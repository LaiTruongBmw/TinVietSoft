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
using System.IO;
using System.Drawing;
using NativeExcel;

public partial class rpt_60280120_payment_report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		CtlLib.SetUser(Session["APP_DBUSER"].ToString());
		

        string TemplateFile = "rpt_60280120_payment_report.xls";
        string TempFile = "../../../../system/temp/rpt_60280120_payment_report_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
	
		
			string p_date = Request["p_date"]; 
			string p_date_to = Request["p_date_to"];
			string p_room = Request["p_room"];
			string p_payment_method = Request["p_payment_method"];
			string p_partner_PK = Request["p_partner_PK"];
			string p_time_frm = Request["p_time_frm"];
			string p_time_to = Request["p_time_to"];
			string p_cashier = Request["p_cashier"];
         
        string para = "'" + p_date + "','" + p_date_to +"','" + p_room +"','" + p_payment_method+"','" + p_partner_PK+"','" + p_time_frm +"','" + p_time_to+ "','" + p_cashier+ "'";		
		DataTable dt = CtlLib.TableReadOpenCursor("ht_sel_60280120" , para);		
	
        // MASTER   

		
		
		// INSERT ROWS
		 
		for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range["A9"].Rows.EntireRow.Insert();//insert row new of sheet
        }
						
		// SET DATA
		int pos = 8 ;
		int i   = 0  ;		  						
		for (i = 0; i < dt.Rows.Count; i++)
        {								
			 exSheet.Cells[pos + i, 1 ].Value = i+1;
			exSheet.Cells[pos + i, 2 ].Value = dt.Rows[i]["room_no"];
			exSheet.Cells[pos + i, 3 ].Value = dt.Rows[i]["invoice_no"];
			exSheet.Cells[pos + i, 4 ].Value = dt.Rows[i]["pay_date"];
		 exSheet.Cells[pos + i, 5 ].Value = dt.Rows[i]["guest_name"];
			exSheet.Cells[pos + i, 6 ].Value = dt.Rows[i]["checkin_date"];
			exSheet.Cells[pos + i, 7 ].Value = dt.Rows[i]["checkout_date"];
			exSheet.Cells[pos + i, 8 ].Value = dt.Rows[i]["partner_name"]; 
			// exSheet.Cells[pos + i, 9 ].Value = dt.Rows[i]["description"]; 		
        }
		//---------
		//exSheet.Cells[pos + i, 6 ].Value = "=sum(F10:F"+(pos+i-1)+")";
		//exSheet.Cells[pos + i, 7].Value = "=sum(G10:G"+(pos+i-1)+")";			 					
		//---------
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }
        // hide row firts 
        range = exSheet.Range["A1"];
        // hide row A5 
        // range.Rows.Hidden = true;
        // font bold header
        /*range = exSheet.Range["A1:AC1"];
        range.Rows[4].Font.Bold = true;*/

        exBook.SaveAs(TempFile);
        //write out to client broswer
        System.IO.FileInfo file = new System.IO.FileInfo(TempFile);
        //System.IO.FileInfo file = new System.IO.FileInfo(pdfFilePath);
        Response.Clear();
        Response.Charset = "UTF-8";
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        //Add header, give a default file name for "File Download/Store as"
        Response.AddHeader("Content-Disposition", "attachment; filename=" + Server.UrlEncode(file.Name));
        //Add header, set file size to enable browser display download progress
        Response.AddHeader("Content-Length", file.Length.ToString());
        //Set the return string is unavailable reading for client, and must be downloaded
        Response.ContentType = "application/ms-exSheet";
        //Response.ContentType = "application/pdf";
        //Send file string to client 
        //Response.WriteFile(pdfFilePath);
        Response.WriteFile(TempFile);
        //Stop execute  
        Response.End();

    }

    public Bitmap ResizeImage(Bitmap d, int w, int h)
    {
        Bitmap q = new Bitmap(w, h);
        float f, g;
        f = (float)w / (float)d.Width;
        g = (float)h / (float)d.Height;
        for (int i = 0; i < w; i++)
        {
            for (int j = 0; j < h; j++)
            {
                Color c;
                c = d.GetPixel((int)(i / f), (int)(j / g));
                q.SetPixel(i, j, c);
            }
        }
        return q;
    }
}