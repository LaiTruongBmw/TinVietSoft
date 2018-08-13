using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class system_Main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LOGIN_ID"] == "" || Session["LOGIN_ID"] == null)
        {
            Session["Debug"] = "FALSE";
            Session["DebugLog"] = "FALSE";
            Response.Redirect("../login.aspx?errmsg=You have not login so you cannot access this page.");
        }
    }
}
