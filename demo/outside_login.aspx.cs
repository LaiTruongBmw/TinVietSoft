using System;
using System.Data;
using System.Data.OracleClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Runtime.InteropServices;
namespace ESys
{
    public partial class outside_login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string userID, userPass="";
                
                userID = Request.QueryString["userid"];
                try
                {
                    string queryString = "select esys.sf_get_pwd_by_userid('" + userID + "') xxx from dual";
                    string conString = ConfigurationManager.AppSettings["strConn"];
                    conString += "User id=esys;Password=esys2";

                    OracleConnection connection = new OracleConnection(conString);
                    connection.Open();
                    OracleCommand command = new OracleCommand(queryString, connection);
                    OracleDataReader reader;
                    reader = command.ExecuteReader();
                   
                    while (reader.Read())
                    {
                        userPass = reader["xxx"].ToString();
                    }
                    reader.Close();
                    connection.Close();
                    if (userPass == "" || userPass == null)
                    {
                        Response.Redirect(Application["rooturl"] + "/login.aspx?errmsg=Invalid user id or password.");
                    }
                    else
                    {
                        CheckLogin(userID, userPass);
                    }
                }
                catch (Exception ex)
                {
                    if (ex.Message.IndexOf("Thread was being aborted", 0, ex.Message.Length - 1) == -1)
                    {
                        ESysLib.WriteLogError(Server.MachineName + "\n" + ex.Message + "\n" + ex.StackTrace);
                        Response.Redirect(Application["rooturl"] + "/login.aspx?errmsg=Invalid user id or password.");
                    }
                }
            }
        }
        private void CheckLogin(string p_user_id, string p_user_pass)
        {
            string user_info = "";
            string[] parameter;
            string[] CDelimeter = new string[] { "|!" };
            try
            {
                string queryString = "select esys.sf_check_login('" + p_user_id + "','" + p_user_pass + "') xxx, esys.sf_get_user_info('" + p_user_id + "') info  from dual";
                int rtnValue = -1;
                string conString = ConfigurationManager.AppSettings["strConn"];
                conString += "User id=esys;Password=esys2";

                OracleConnection connection = new OracleConnection(conString);
                connection.Open();
                OracleCommand command = new OracleCommand(queryString, connection);
                OracleDataReader reader;

                reader = command.ExecuteReader();
                while (reader.Read())
                {
                    rtnValue = Convert.ToInt16(reader["xxx"]);
                    user_info = reader["info"].ToString();

                }
                reader.Close();

                if (rtnValue > 0 && p_user_id != "" && p_user_id != null)
                {
                    if (user_info == "no_data_found")
                    {
                        Response.Redirect(Application["rooturl"] + "/login.aspx?errmsg=You have no permision to login the system.");
                    }
                    parameter = user_info.Split(CDelimeter, System.StringSplitOptions.None);

                    Session["User_ID"] = p_user_id.ToLower();
                    Session["LOGIN_ID"] = p_user_id.ToLower();
                    Session["USER_PK"] = rtnValue;
                    Session["ORG_PK"] = parameter[6];
                    Session["ORG_NAME"] = parameter[2];
                    Session["DEPT_PK"] = parameter[6];
                    Session["DEPT_NAME"] = parameter[2];
                    Session["ROLE_NAME"] = parameter[3];
                    Session["CODEADMIN_YN"] = parameter[4];
                    Session["Debug_YN"] = parameter[4];
                    Session["USER_NAME"] = parameter[0];
                    Session["EMPLOYEE_PK"] = parameter[1];
                    Session["COMPANY_PK"] = parameter[5];
                    Session["HR_LEVEL"] = parameter[7];
                    Session["SESSION_LANG"] = parameter[8];
                    Session["EMP_ID"] = parameter[9];
                    Session["POSITION_NAME"] = parameter[10];
                    Session["ANNOUNCE_YN"] = parameter[11];

                    command = new OracleCommand();
                    command.Connection = connection;
                    command.CommandText = "esys.sp_login_entry";
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("p_user_id", OracleType.VarChar, 20).Value = p_user_id;
                    command.Parameters.Add("p_login_ip", OracleType.VarChar, 50).Value = Request.UserHostAddress;
                    command.Parameters.Add("p_login_pcname", OracleType.VarChar, 50).Value = Request.UserHostName;
                    command.ExecuteNonQuery();
                    connection.Close();
                    connection.Dispose();
                    Response.Redirect(Application["rooturl"] + "/system/Main.aspx");

                }
                else
                {
                    connection.Close();
                    connection.Dispose();
                    Response.Redirect(Application["rooturl"] + "/login.aspx?errmsg=Invalid user id or password.");
                }

            }
            catch (Exception ex)
            {
                if (ex.Message.IndexOf("Thread was being aborted", 0, ex.Message.Length - 1) == -1)
                {
                    ESysLib.WriteLogError(ex.Message + "\n" + ex.StackTrace);
                    Response.Redirect(Application["rooturl"] + "/login.aspx?errmsg=System meet error. Please check log file to know the reason.");
                }
            }
        }

    }

}