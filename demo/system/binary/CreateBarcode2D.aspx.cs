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
using System.Drawing;
using System.Drawing.Drawing2D;
using MW6.ASPNET.PDF417;
using System.Data.OracleClient;
namespace ESys
{
    public partial class CreateBarcode2D : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string function = Request.QueryString["function"];
            CreateImage(function);

        }
        private void CreateImage(string function)
        {
            string rtnValue = "";
            try
            {
                string _dbuser = function.Substring(0, function.IndexOf(".", 0));
                string conString = ConfigurationManager.AppSettings["strConn"];
                conString += "User Id=" + _dbuser + ";Password=" + _dbuser + "2";

                OracleConnection con = new OracleConnection(conString);
                con.Open();
                string queryString = "select " + function + " xxx from dual";


                OracleCommand command = new OracleCommand(queryString, con);
                OracleDataReader reader;

                reader = command.ExecuteReader();
                while (reader.Read())
                {
                    rtnValue = Convert.ToString(reader["xxx"]);
                }
                reader.Close();
                con.Close();
            }
            catch (Exception ex)
            {
                ESysLib.WriteLogError(ex.Message +"\n"+ ex.StackTrace);
                return;
            }

            if (rtnValue == "") return;

            Bitmap objBitmap;
            Graphics objGraphics = null;
            int ActualRows = 0;
            int ActualCols = 0;
            int ActualWidth = 0;
            int ActualHeight = 0;
            int ExtraWidth, ExtraHeight;
            Point p;

            Response.ContentType = "image/gif";

            PDF417Net MyPDF417 = new PDF417Net();
            MyPDF417.BackColor = Color.FromName("White");
            MyPDF417.BarColor = Color.FromName("Black");
            MyPDF417.Data = rtnValue;// "12321984912\n3ry8sdjhfv\nsdj sdjsd \nds v sdhsdjvsjd\njdsjsdahjsd sdav csaj  sjd jhv\nahsdv chjw";//Request.QueryString["Data"];
            //MyPDF417.ErrorCorrectionLevel = 2; //0->8
            MyPDF417.Mode = 0;//0:Binary, 1:Text, 2:Auto
            //MyPDF417.NarrowBarWidth = 0.07;//(float)System.Convert.ToDouble(Request.QueryString["NarrowBarWidth"]);
            MyPDF417.Orientation = 0;//0: 0 degree, 1: 90 degree, 2: 180 degree, 3: 270 degree
            MyPDF417.Columns = 4;//1->30
            MyPDF417.Rows = 3;//1->90
            MyPDF417.TruncateSymbol = false;//(Request.QueryString["TruncateSymbol"] == "ON");
            MyPDF417.HandleTilde = false;// (Request.QueryString["HandleTilde"] == "ON");
            //MyPDF417.Y2XRatio = 3.0;//(float)System.Convert.ToDouble(Request.QueryString["Y2XRatio"]);

            //// Get actual rows and columns of PDF417 barcode
            MyPDF417.GetActualRC(ref ActualRows, ref ActualCols);

            //// Get actual barcode width and height
            MyPDF417.GetActualSize(ref ActualWidth, ref ActualHeight);

            ExtraWidth = 30;//System.Convert.ToInt16(Request.QueryString["ExtraWidth"]);
            ExtraHeight = 40;//System.Convert.ToInt16(Request.QueryString["ExtraHeight"]);

            // Image size = barcode size + extra space
            //if (MyPDF417.Orientation == 0 || MyPDF417.Orientation == 2)
            //{
            //    MyPDF417.SetSize(ActualWidth + ExtraWidth, ActualHeight + ExtraHeight);
            //    objBitmap = new Bitmap(ActualWidth + ExtraWidth, ActualHeight + ExtraHeight);
            //}
            //else
            //{
            //    MyPDF417.SetSize(ActualHeight + ExtraWidth, ActualWidth + ExtraHeight);
            //    objBitmap = new Bitmap(ActualHeight + ExtraWidth, ActualWidth + ExtraHeight);
            //}
            MyPDF417.SetSize(ActualWidth + ExtraWidth, ActualHeight + ExtraHeight);
            objBitmap = new Bitmap(ActualWidth + ExtraWidth, ActualHeight + ExtraHeight);
            objGraphics = Graphics.FromImage(objBitmap);

            p = new Point(0, 0);
            MyPDF417.Render(objGraphics, p);

            objBitmap.Save(Response.OutputStream, System.Drawing.Imaging.ImageFormat.Gif);

            objGraphics.Flush();
        }
    }
}
