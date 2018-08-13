<%@ WebHandler Language="C#" Class="ViewImage" %>

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
using System.Web.SessionState;

public class ViewImage : IHttpHandler
{
    
    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        string sqlText = "";
        try
        {
            string dbuser = "", dbpass = "", conString;
            OracleConnection connection;
            OracleCommand command;
            
            string img_pk = context.Request.QueryString["img_pk"];
            string table_name = context.Request.QueryString["table_name"];


            if (img_pk == null || img_pk == "" || img_pk == "0")
            {
                img_pk = "-1";//show default image
            }

            if (table_name.IndexOf(".") > 1)
            {
                dbuser = table_name.Substring(0, table_name.IndexOf("."));

                //get database pass by database user name
                conString = ConfigurationManager.AppSettings["strConn"];
                conString += "User Id=Ctl;password=Ctl2";
                connection = new OracleConnection(conString);
                command = new OracleCommand();

                command.CommandText = "Call Ctl.sp_sel_db_pass2('" + dbuser + "', :p_rtn_value)";
                command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;
                connection.Open();
                command.Connection = connection;
                OracleDataReader reader = command.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        dbpass = reader["dbuser_pwd"].ToString();
                    }
                    conString = ConfigurationManager.AppSettings["strConn"];
                    conString += "User Id=" + dbuser + ";password=" + dbpass;
                    sqlText = "select * from " + table_name + " where pk =" + img_pk;
                }
            }
            else
            {
                dbuser = context.Request.QueryString["dbuser"];
                dbpass = context.Request.QueryString["dbpass"];
                conString = ConfigurationManager.AppSettings["strConn"];
                conString += "User Id=" + dbuser + ";password=" + dbpass;
                sqlText = "select * from " + dbuser + "." + table_name + " where pk =" + img_pk;
            }
            
            connection = new OracleConnection(conString);
            connection.Open();
            command = connection.CreateCommand();

            command.CommandText = sqlText;
            OracleDataReader dr = command.ExecuteReader();
            if (dr.Read())
            {
                context.Response.ContentType = dr["CONTENTTYPE"].ToString();
                context.Response.BinaryWrite((byte[])dr["DATA"]);
            }
            connection.Close();
        }
        catch (Exception ex)
        {
            CtlLib.WriteLogError(ex.Message + ". " + sqlText);
            throw (ex);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}