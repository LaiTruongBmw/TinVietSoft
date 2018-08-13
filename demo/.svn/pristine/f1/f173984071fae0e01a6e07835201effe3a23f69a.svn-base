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

public partial class rpt_60240030_R_Card : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

         CtlLib.SetUser(Session["APP_DBUSER"].ToString());

		
       
        string TemplateFile = "rpt_60240030_R_Card.xls";
        string TempFile = "../../../../system/temp/rpt_60240030_R_Card_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
       string l_pk = Request.QueryString["p_pk"];
		String l_print_date="";
		string l_parameter = "'" + l_pk + "'";
		DataTable dt, dt1;
        dt = CtlLib.TableReadOpenCursor("ht_rpt_60250030_inhouseR_card", l_parameter);
        //-----header---   

        //---end--header---
        //--set-----DataBind--in---Master---
        if (dt.Rows.Count == 0)
        {
            exSheet.Cells[6, 8].Value = "There is not data!";

        }
        if (dt.Rows.Count > 0)
        {
            
			//exSheet.Cells[3, 1].Value = "Month :"+l_month.Substring(4,2)+"/"+l_month.Substring(0,4);
		//	exSheet.Cells[3, 6].Value = dt.Rows[0]["print_time"].ToString();  
			exSheet.Cells[6,1].Value = dt.Rows[0]["account_number"].ToString();
			exSheet.Cells[6,4].Value = dt.Rows[0]["date_to"].ToString();
			exSheet.Cells[6,2].Value = dt.Rows[0]["from_date"].ToString();
			if(dt.Rows[0]["room_rate"].ToString()!="")
			{
				exSheet.Cells[8,1].Value = double.Parse(dt.Rows[0]["room_rate"].ToString());
			}
				if(dt.Rows[0]["deposit_amt_vnd"].ToString()!="")
			{
				exSheet.Cells[8,3].Value = double.Parse(dt.Rows[0]["deposit_amt_vnd"].ToString());
			}
			exSheet.Cells[8,4].Value = dt.Rows[0]["room_type"].ToString();
			exSheet.Cells[8,5].Value = dt.Rows[0]["room_no"].ToString();
			
			
			exSheet.Cells[9,2].Value = dt.Rows[0]["full_name"].ToString();
			exSheet.Cells[10,2].Value = dt.Rows[0]["nation"].ToString();
			exSheet.Cells[11,2].Value = dt.Rows[0]["passport_no"].ToString();
			
			exSheet.Cells[12,2].Value = dt.Rows[0]["company_name"].ToString();
			exSheet.Cells[13,2].Value = dt.Rows[0]["email"].ToString();
			exSheet.Cells[13,6].Value = dt.Rows[0]["phone"].ToString();
			exSheet.Cells[14,2].Value = dt.Rows[0]["address"].ToString();
			
			exSheet.Cells[16,2].Value = dt.Rows[0]["city_name"].ToString();
			
        }

        //----------------------
        ////end-set-----DataBind--in---Master---


        //set data to detail.
        // loop detail not percent
		int l_row_first=9;
        for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range["A9"].Rows.EntireRow.Insert();//insert row new of sheet
        }
        
        for (int l_row = 0; l_row < dt.Rows.Count; l_row++)
        {
				
			
			
				
				
			
		}
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }


        // hide row firts 

      //  range = exSheet.Range["A1"];
        // hide row A5 
       // range.Rows.Hidden = true;

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