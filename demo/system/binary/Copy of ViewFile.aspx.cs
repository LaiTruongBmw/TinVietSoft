using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OracleClient;
namespace ESys
{
    public partial class ViewFile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string sqlText="";

                try
                {
                    string img_pk = Request.QueryString["img_pk"];
                    string table_name = Request.QueryString["table_name"];

                    //string dbuser = Session["APP_DBUSER"].ToString();
                    string dbuser = "nobland";
                    string dbpass = Session["APP_DBPASS"].ToString();
     
                    if (img_pk == null || img_pk == "" || img_pk == "0")
                    {
                        img_pk = "-1";//show default image
                    }

                    sqlText = "select * from " + dbuser +"."+ table_name + " where pk =" + img_pk;
                    ESysLib.WriteLogFile(sqlText);
                    string conString = ConfigurationManager.AppSettings["strConn"];
                    
                    conString += "User Id=" + dbuser + ";password=" + dbpass;

                    OracleConnection connection = new OracleConnection(conString);
                    connection.Open();
                    OracleCommand command = connection.CreateCommand();
                    command.CommandText = sqlText;
                    OracleDataReader dr = command.ExecuteReader();
                    if (dr.Read())
                    {
                        Response.ContentType = dr["CONTENTTYPE"].ToString();
                        Response.BinaryWrite((byte[])dr["DATA"]);
                    }
                    connection.Close();
                }
                catch (Exception ex)
                {
                    ESysLib.WriteLogError(ex.Message + ". "+ sqlText);
                    throw (ex);
                }
               
            }
        }
    }
}
