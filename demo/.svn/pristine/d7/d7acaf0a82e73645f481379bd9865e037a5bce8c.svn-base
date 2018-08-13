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

public partial class rpt_60300010_room_type_date_from_to : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string l_dt_from = Request["p_dtfrm"]; 
		string l_dtto = Request["p_dtto"]; 		
       
        string TemplateFile = "rpt_60300010_room_type_date_from_to.xls";
        string TempFile = "../../../../system/temp/rpt_60300010_room_type_date_from_to_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        string para = "";
        DataTable dt, dtSum;

        para = "'" + l_dt_from + "','" + l_dtto + "'";
        dt = CtlLib.TableReadOpenCursor("rpt_60300010_room_type_frm_to", para);
        //-----header---   

        //---end--header---
        //--set-----DataBind--in---Master---
        if (dt.Rows.Count == 0)
        {
            exSheet.Cells[6, 1].Value = "There is not data!";

        }
        if (dt.Rows.Count > 0)
        {
			exSheet.Cells[4, 3].Value = dt.Rows[0]["dt_frm_to"].ToString();//"Date :"+l_dt_from.Substring(6, 2)+"/"+l_dt_from.Substring(4, 2)+"/"+l_dt_from.Substring(0,4);
            exSheet.Cells[3, 4].Value = dt.Rows[0]["print_time"].ToString();
			//exSheet.Cells[4, 11].Value = dt.Rows[0]["date_header"].ToString(); 
        }

        //----------------------
        ////end-set-----DataBind--in---Master---
		int l_first_row=6;
        for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range[l_first_row+l_addrow,1].Rows.EntireRow.Insert();//insert row new of sheet

        }
        //set date title of year
        //exSheet.Cells[2, 1].Value = "Income Statement Year" + " " + l_year;

        //set data to detail.
        // loop detail not percent
        int l_cnt = dt.Rows.Count;
		if (dt.Rows.Count > 0)
		{
			for (int l_row = 0; l_row < dt.Rows.Count; l_row++) 
			{
				exSheet.Cells[l_first_row + l_row,1].Value = dt.Rows[l_row]["room_type"];
				exSheet.Cells[l_first_row + l_row,2].Value = dt.Rows[l_row]["description"];
				exSheet.Cells[l_first_row + l_row,3].Value = dt.Rows[l_row]["guest"];
				exSheet.Cells[l_first_row + l_row,4].Value = dt.Rows[l_row]["night"];
				exSheet.Cells[l_first_row + l_row,5].Value = dt.Rows[l_row]["rev"];
			}
		}
        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }


        // hide row firts 

       // range = exSheet.Range["A1"];
        // hide row A5 
     //   range.Rows.Hidden = true;

        // font bold header

        exBook.SaveAs(TempFile);
        //CtlLib.ExcelToPdf(TempFile);
        //string pdfFilePath = TempFile.Replace(".xls", ".pdf");
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
        Response.WriteFile(TempFile);
        //Response.WriteFile(pdfFilePath);
        //Stop execute  
        Response.End();

    }
}