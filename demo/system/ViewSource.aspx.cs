using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
namespace Ctl
{
    public partial class ViewSource : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string file_name = Server.MapPath(Request["file_name"]);
                GetFileSource(file_name);
            }
        }
        private void GetFileSource(string file_name)
        {
            try
            {
                // Create an instance of StreamReader to read from a file.
                // The using statement also closes the StreamReader.
                using (StreamReader sr = new StreamReader(file_name))
                {
                    string line;
                    // Read and display lines from the file until the end of 
                    // the file is reached.
                    Response.Write(Server.HtmlEncode(file_name));
                    Response.Write("<br><br>");
                    while ((line = sr.ReadLine()) != null)
                    {
                        Response.Write(Server.HtmlEncode(line));
                        Response.Write("<br>");
                    }
                    sr.Close();
                }
            }
            catch (Exception e)
            {
                // Let the user know what went wrong.
                Response.Write(e.Message);
            }
 
        }
    }
}