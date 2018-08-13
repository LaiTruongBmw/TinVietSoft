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

namespace Ctl
{
    public partial class Login_Submit : System.Web.UI.Page
    {
        private string _notMD5Pass;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                string userID, userPass;

                userID = Request.Form["txtUserID"];
                userPass = Request.Form["_password"];
                _notMD5Pass = Request.Form["txtPassword"];
                
                CheckLogin(userID,userPass);
            }
        }
        private void CheckLogin(string p_user_id, string p_user_pass)
        {	
            string user_info="";
            string[] parameter;
            string[] CDelimeter = new string[] { "|!" };
            try
            {
                string login_status = "";
				string client_id = ConfigurationManager.AppSettings["dbUser"];
                string conString = ConfigurationManager.AppSettings["strConn"];
                conString += "User id=ctl;Password=ctl2";
                string ip_address = Request.UserHostAddress;
                string exeStatement = "Call ctl.ST_SY_LOGIN('" + p_user_id + "','" + p_user_pass + "','" + _notMD5Pass + "','" + ip_address + "','" + client_id + "',:p_rtn_value)";
				//string exeStatement = "Call GASP.sp_sel_check_login('" + p_user_id + "','" + p_user_pass + "','" + _notMD5Pass + "','" + ip_address + "',:p_rtn_value)";

                OracleConnection connection = new OracleConnection(conString);
                connection.Open();

                OracleCommand command = new OracleCommand();
                command.CommandText = exeStatement;
                command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;
                command.Connection = connection;
                OracleDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    login_status = reader["xxx"].ToString();
                    user_info = reader["info"].ToString();
                    
                }
                reader.Close();

                if (login_status == "OK" && p_user_id != "" && p_user_id != null)
                {
                    parameter = user_info.Split(CDelimeter, System.StringSplitOptions.None);

                    Session["User_ID"] = p_user_id.ToLower() ;
                    Session["LOGIN_ID"] = p_user_id.ToLower();
					
                    Session["ORG_NAME"] = parameter[2];
                    Session["DEPT_NAME"] = parameter[2];
                    Session["ROLE_NAME"] = parameter[3];
					
                    Session["CODEADMIN_YN"] = parameter[4];
					
                    Session["Debug_YN"] = parameter[4];
					Session["Debug"] = (parameter[4].ToString() == "Y")?"TRUE":"FALSE";
					Session["DebugLog"] = (parameter[4].ToString() == "Y")?"TRUE":"FALSE";
                    Session["USER_NAME"] = parameter[0];
                    Session["EMPLOYEE_PK"] = parameter[1];
                    Session["COMPANY_PK"] = parameter[5];
                    Session["HR_LEVEL"] = parameter[7];
                    Session["SESSION_LANG"] = parameter[8];
                    Session["EMP_ID"] = parameter[9];
                    Session["POSITION_NAME"] = parameter[10];
                    Session["ANNOUNCE_YN"] = parameter[11];
					Session["Lang"] = "1";
					
					Session["DEPT_PK"] = parameter[6];
                    Session["DEPT_CODE"] = parameter[12];
					Session["ORG_PK"] = parameter[6];
                    Session["ORG_ID"] = parameter[12];
					Session["CLIENT_PK"] = parameter[14];
                    Session["CLIENT_ID"] = parameter[15]; 
                    Session["USER_PK"] = parameter[13];
						
                    //store db pass in the session
					
                    command = new OracleCommand();
                    command.CommandText = "Call ctl.ST_SY_SEL_PASS('" + parameter[13] + "', :p_rtn_value)";
                    command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;
                    command.Connection = connection;
                    reader = command.ExecuteReader();
					//CtlLib.WriteLogError(parameter[13].ToString());
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            Session["APP_DBUSER"] = reader["dbuser_name"].ToString().ToUpper();							
                            Session["APP_DBPASS"] = reader["dbuser_pwd"].ToString();
                        }
                    }
                    else
                    {
                        connection.Close();
                        connection.Dispose();
                        CtlLib.WriteLogError("System cannot get database password information.");
                        Session.Clear();
                        Response.Redirect("login.aspx?errmsg=System meet an error. Please ask genuwin supporter for helping.");
                    }

                    connection.Close();
                    connection.Dispose();
                    
                    Response.Redirect("system/Main.aspx");
                }
                else
                {
                    connection.Close();
                    connection.Dispose();
                    Session.Clear();
                    Response.Redirect("login.aspx?errmsg=" + login_status);
                }

            }
            catch(Exception ex)
            {
                if (ex.Message.IndexOf("Thread was being aborted", 0, ex.Message.Length - 1) == -1)
                {
                    CtlLib.WriteLogError(ex.Message + "\n" + ex.StackTrace);
                    Session.Clear();
                    Response.Redirect("login.aspx?errmsg=System meet an error. Please ask genuwin supporter for helping.");
                }
            }
        }
        
    }
 
}