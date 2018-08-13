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
    public partial class Menu : System.Web.UI.Page
    {
        private string str;

        public string ExecuteSQL( string sql)
        {
            string user_lang = Session["SESSION_LANG"].ToString();
            string dbpass = Session["Ctl"].ToString();
            string TCO_BSUSER_PK = Session["USER_PK"].ToString();
            string sqlResult = "";
            //$1 TCO_BSUSER_PK parameter
            //$2 user language(ENG,VIE,KOR)
            string queryString = sql.Replace("$1", TCO_BSUSER_PK);
            queryString = sql.Replace("$2", user_lang);
            try
            {
                string conString = ConfigurationManager.AppSettings["strConn"];
                conString += "User id=Ctl;Password=" + dbpass;

                OracleConnection connection = new OracleConnection(conString);
                connection.Open();
                OracleCommand command = new OracleCommand(queryString, connection);
                sqlResult = command.ExecuteOracleScalar().ToString();
                connection.Close();
                connection.Dispose();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message + ":" + queryString);
            }
            
            return sqlResult;
        }
        public void WriteAlertMenu()
        {
            Session["SESSION_LANG"] = Request.QueryString["lang"].ToString();
            string dbpass = Session["Ctl"].ToString();
            string conString = ConfigurationManager.AppSettings["strConn"];
            conString += "User id=Ctl;Password=" + dbpass;

            OracleConnection connection = new OracleConnection(conString);
            connection.Open();
            string queryString = "select SF_GET_USER_ALERT(" + Session["USER_PK"].ToString() + ") from dual";
            try
            {
                OracleCommand command = new OracleCommand(queryString, connection);
                OracleDataReader reader;
                reader = command.ExecuteReader();
                while (reader.Read())
                {
                    str = reader.GetString(0);
                    if (str.Trim() != "")
                    {
                        str = str.Substring(0, str.Length - 1);
                        AlertMenuItem(0, 0);
                    }
                }
                reader.Close();

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
            finally
            {
                connection.Close();
                connection.Dispose();
            }
        }
        public void AlertMenuItem(int id, int depth)
        {
            string fPK, fType, Title, lTitle, fTitle, sTitle, fImg, url,sqlStatement;
            string queryString = "select * from TES_ALERTLIST where use_yn = 'Y' and parent_pk = " + id + " and PK in ( " + str + ") order by seq ";
            string sqlResult = "";
            try
            {
                string dbpass = Session["Ctl"].ToString();
                string conString = ConfigurationManager.AppSettings["strConn"];
                conString += "User id=Ctl;Password=" + dbpass;

                OracleConnection connection = new OracleConnection(conString);
                connection.Open();
                OracleCommand command = new OracleCommand(queryString, connection);
                OracleDataReader reader;
                reader = command.ExecuteReader();
                while (reader.Read())
                {
                    fType = reader["FORM_TYPE"].ToString();
                    fPK = reader["pk"].ToString();
                    fImg = reader["IMG"].ToString();
                    Title = Server.HtmlEncode(reader["FORM_NM"].ToString());
                    sqlStatement = reader["SQL_STATEMENT"].ToString();
                    if (sqlStatement.Length > 10)
                    {
                        sqlResult = ExecuteSQL(sqlStatement);
                    }
                    if (reader["FORM_LNM"] != DBNull.Value)
                    {
                        lTitle = RemoveHTMLCharacter(reader["FORM_LNM"].ToString());
                    }
                    else
                    {
                        lTitle = Title;
                    }
                    if (reader["FORM_FNM"] != DBNull.Value)
                    {
                        fTitle = RemoveHTMLCharacter(reader["FORM_FNM"].ToString());
                    }
                    else
                    {
                        fTitle = Title;
                    }

                    if (Session["SESSION_LANG"].ToString() == "VIE")
                    {
                        sTitle = lTitle;
                    }
                    else if (Session["SESSION_LANG"].ToString() == "KOR")
                    {
                        sTitle = fTitle;
                    }
                    else
                    {
                        sTitle = Title;
                    }

                    if (fType == "M")
                    {
                        if (depth == 0)
                        {
                            string s = "<tr>";
                            s += "<td>";
                            s += " <table cellspacing='0' cellpadding='0' id='folder" + fPK + "_a' onmouseover='' onmouseout=''>";
                            s += " <tr class='Normal NOT_Opened NOT_Hover NOT_Selected NOT_Pressed NOT_Focused' id='child" + fPK + "_a' onmouseover='setMouseOver(this);return true;'";
                            s += " onmouseout='setMouseOut(this); return true;' onmousedown='setMouseDown(this);return true;' onmouseup='setMouseUp(this);return true;'>";
                            s += " <td width='5px'  id='folderImg" + fPK + "_a'>";
                            s += " <img src='images/blank.gif' class='Menu_Client_Button_BigIcon' style='background:url(" + fImg + ") no-repeat right center' /></td>";
                            s += " <td nowrap='' id='folderCell1_" + fPK + "_a'>" + sTitle + "(" + sqlResult + ")</td>";
                            s += " </tr>";
                            s += " </table>";
                            s += " </td>";
                            s += " </tr>";
                            s += " <tr>";
                            s += " <td style='display: none;' id='parent" + fPK + "_a'>";
                            s += " <table cellspacing='0' cellpadding='0' class='Menu_Client_child_bg'>";

                            Response.Write(s + (char)13);
                            AlertMenuItem(CGlobal.ToInt(fPK), depth + 1);
                            Response.Write("</table></td></tr>" + (char)13);
                        }
                        else if (depth == 1)
                        {
                            if (fImg == null || fImg == "") fImg = "images/iconFolderClosed.png";
                            string s = "<tr>";
                            s += " <td>";
                            s += " <table cellspacing='0' cellpadding='0' id='folder" + fPK + "_a' onmouseover='' onmouseout=''>";
                            s += " <tr class='Normal NOT_Opened NOT_Hover NOT_Selected NOT_Pressed NOT_Focused' id='child" + fPK + "_a' onmouseover='setMouseOver(this);return true;'";
                            s += " onmouseout='setMouseOut(this); return true;' onmousedown='setMouseDown(this);return true;' onmouseup='setMouseUp(this);return true;'>";
                            s += " <td width='5px'  id='folderImg" + fPK + "_a'>";
                            s += " <img src='images/blank.gif' class='Menu_Client_Button_Icon'";
                            s += " style='background:url(" + fImg + ") no-repeat right center' /></td>";
                            s += " <td nowrap='' id='folderCell2_" + fPK + "_a'>&nbsp;" + sTitle + "(" + sqlResult + ")</td>";
                            s += " </tr>";
                            s += " </table>";
                            s += " </td>";
                            s += " </tr>";
                            s += " <tr>";
                            s += " <td style='display: none;' id='parent" + fPK + "_a'>";
                            s += " <table cellspacing='0' cellpadding='0' class='Menu_Client_child_bg'>";

                            Response.Write(s + (char)13);
                            AlertMenuItem(CGlobal.ToInt(fPK), depth + 1);
                            Response.Write("</table></td></tr>" + (char)13);
                        }
                    }
                    else
                    {

                        if (fImg == null || fImg == "") fImg = "images/iconAutoForm.png";
                        //menu item
                        url = Application["rooturl"] + "/" + reader["FORM_url"].ToString();
                        string s = "<tr>";
                        s += " <td>";
                        s += " <table cellspacing='0' cellpadding='0' id='form" + fPK + "_a' onmouseover=''";
                        s += " onmouseout=''>";
                        s += " <tr class='Normal NOT_Opened NOT_Hover NOT_Selected NOT_Pressed NOT_Focused' id='childform" + fPK + "_a' onclick='checkSelected(this.id);System.Menu.NewWindow(\"" + url + "\",\"" + Title + "\",\"" + lTitle + "\",\"" + fTitle + "\");return false;'";
                        s += " onmouseover='setMouseOver(this);return true;' onmouseout='setMouseOut(this); return true;' onmousedown='setMouseDown(this);return true;'";
                        s += " onmouseup='setMouseUp(this);return true;'>";
                        s += " <td width='5px' >";
                        s += " <img src='images/blank.gif' class='Menu_Client_Button_Icon' style='background:url(" + fImg + ") no-repeat right center' ></td>";
                        s += " <td nowrap=''>&nbsp;" + sTitle + "(" + sqlResult + ")</td>";
                        s += " </tr>";
                        s += " </table>";
                        s += " </td>";
                        s += " </tr>";
                        s += " <tr>";
                        s += " <td style='display: none;' id='parent" + fPK + "_a'>";
                        s += " <table cellspacing='0' cellpadding='0' class='Menu_Client_child_bg'>";
                        s += " </table>";
                        s += " </td>";
                        s += " </tr>";

                        Response.Write(s + (char)13);
                    }
                }
                reader.Close();
                connection.Close();
                connection.Dispose();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }
        public void WriteMenu()
        {
            Session["SESSION_LANG"] = Request.QueryString["lang"].ToString();
            MenuItem(0, 0);
        }
        private string RemoveHTMLCharacter(string s)
        {
            s = s.Replace("&", "");
            s = s.Replace(">", "");
            s = s.Replace("<", "");
            return s;
        }
        private void MenuItem(int id, int depth)
        {
            string fPK, fType, Title, lTitle, fTitle, sTitle, fImg, url, menu_id;
            string user_pk = Session["USER_PK"].ToString();
            string exeStatement = "Call Ctl.SP_SEL_USER_MENU('" + id + "','" + user_pk + "',:p_rtn_value)";
            try
            {
                string dbpass = Session["Ctl"].ToString();
                string conString = ConfigurationManager.AppSettings["strConn"];
                conString += "User id=Ctl;Password=" + dbpass;
                

                OracleConnection connection = new OracleConnection(conString);
                connection.Open();
                OracleCommand command = new OracleCommand();
                command.CommandText = exeStatement;
                command.Parameters.Add(":p_rtn_value", OracleType.Cursor).Direction = ParameterDirection.Output;
                command.Connection = connection;
                OracleDataReader reader = command.ExecuteReader();
                
                while (reader.Read())
                {
                    fType = reader["FORM_TYPE"].ToString();
                    fPK = reader["pk"].ToString();
                    fImg = reader["IMG"].ToString();
                    menu_id = reader["MENU_ID"].ToString();

                    Title = Server.HtmlEncode(reader["FORM_NM"].ToString());

                    if (reader["FORM_LNM"] != DBNull.Value)
                    {
                        lTitle = RemoveHTMLCharacter(reader["FORM_LNM"].ToString());
                    }
                    else
                    {
                        lTitle = Title;
                    }
                    if (reader["FORM_FNM"] != DBNull.Value)
                    {
                        fTitle = RemoveHTMLCharacter(reader["FORM_FNM"].ToString());
                    }
                    else
                    {
                        fTitle = Title;
                    }

                    if (Session["SESSION_LANG"].ToString() == "VIE")
                    {
                        sTitle = lTitle;
                    }
                    else if (Session["SESSION_LANG"].ToString() == "KOR")
                    {
                        sTitle = fTitle;
                    }
                    else
                    {
                        sTitle = Title;
                    }

                    if (fType == "M")
                    {
                        if (depth == 0)
                        {
                            string s = "<tr>";
                            s += "<td>";
                            s += " <table cellspacing='0' cellpadding='0' id='folder" + fPK + "' onmouseover='' onmouseout=''>";
                            s += " <tr class='Normal NOT_Opened NOT_Hover NOT_Selected NOT_Pressed NOT_Focused' id='child" + fPK + "' onmouseover='setMouseOver(this);return true;'";
                            s += " onmouseout='setMouseOut(this); return true;' onmousedown='setMouseDown(this);return true;' onmouseup='setMouseUp(this);return true;'>";
                            s += " <td width='5px'  id='folderImg" + fPK + "'>";
                            s += " <img src='images/blank.gif' class='Menu_Client_Button_BigIcon' style='background:url(" + fImg + ") no-repeat right center' /></td>";
                            s += " <td nowrap='' id='folderCell1_" + fPK + "'>" + sTitle + "</td>";
                            s += " </tr>";
                            s += " </table>";
                            s += " </td>";
                            s += " </tr>";
                            s += " <tr>";
                            s += " <td style='display: none;' id='parent" + fPK + "'>";
                            s += " <table cellspacing='0' cellpadding='0' class='Menu_Client_child_bg'>";
                            
                            Response.Write(s+(char)13);
                            MenuItem(CGlobal.ToInt(fPK), depth + 1);
                            Response.Write("</table></td></tr>" + (char)13);
                        }
                        else if (depth > 0)
                        {
                            if (fImg == null || fImg == "") fImg = "images/iconFolderClosed.png";
                         string s = "<tr>";
                            s +=" <td>";
                            s += " <table cellspacing='0' cellpadding='0' id='folder" + fPK + "' onmouseover='' onmouseout=''>";
                            s += " <tr class='Normal NOT_Opened NOT_Hover NOT_Selected NOT_Pressed NOT_Focused' id='child" + fPK + "' onmouseover='setMouseOver(this);return true;'";
                            s +=" onmouseout='setMouseOut(this); return true;' onmousedown='setMouseDown(this);return true;' onmouseup='setMouseUp(this);return true;'>";
                            s += " <td width='5px'  id='folderImg" + fPK + "'>";
                            s +=" <img src='images/blank.gif' class='Menu_Client_Button_Icon'";
                            s += " style='background:url(" + fImg + ") no-repeat right center' /></td>";
                            s += " <td nowrap='' id='folderCell2_" + fPK + "'>&nbsp;" + sTitle + "</td>";
                            s +=" </tr>";
                            s +=" </table>";
                            s +=" </td>";
                            s +=" </tr>";
                            s +=" <tr>";
                            s += " <td style='display: none;' id='parent" + fPK + "'>";
                            s +=" <table cellspacing='0' cellpadding='0' class='Menu_Client_child_bg'>";

                            Response.Write(s + (char)13);
                            MenuItem(CGlobal.ToInt(fPK), depth + 1);
                            Response.Write("</table></td></tr>" + (char)13);
                        }
                    }
                    else
                    {

                        if (fImg == null || fImg == "") fImg = "images/iconAutoForm.png";
                        //menu item
                        url = Application["rooturl"] +  "/" +reader["FORM_url"].ToString();
                        string s = "<tr>";
                               s +=" <td>";
                               s += " <table cellspacing='0' cellpadding='0' id='form" + fPK + "' onmouseover=''";
                               s +=" onmouseout=''>";
                               s += " <tr class='Normal NOT_Opened NOT_Hover NOT_Selected NOT_Pressed NOT_Focused' id='childform" + fPK + "' onclick='checkSelected(this.id);System.Menu.NewWindow(\"" + url + "\",\"" + Title + "\",\"" + lTitle + "\",\"" + fTitle + "\",\"" + menu_id + "\");return false;'";
                               s +=" onmouseover='setMouseOver(this);return true;' onmouseout='setMouseOut(this); return true;' onmousedown='setMouseDown(this);return true;'";
                               s +=" onmouseup='setMouseUp(this);return true;'>";
                               s += " <td width='5px' >";
                               s += " <img src='images/blank.gif' class='Menu_Client_Button_Icon' style='background:url(" + fImg + ") no-repeat right center' ></td>";
                               s +=" <td nowrap=''>&nbsp;" + sTitle + "</td>";
                               s +=" </tr>";
                               s +=" </table>";
                               s +=" </td>";
                               s +=" </tr>";
                               s +=" <tr>";
                               s += " <td style='display: none;' id='parent" + fPK + "'>";
                               s +=" <table cellspacing='0' cellpadding='0' class='Menu_Client_child_bg'>";
                               s +=" </table>";
                               s +=" </td>";
                               s +=" </tr>";

                               Response.Write(s + (char)13);
                    }
                }
                reader.Close();
                connection.Close();
                connection.Dispose();
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message + ":" + exeStatement);
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        
    }
}