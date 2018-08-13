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

public partial class rpt_60240010_Reservation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

         ESysLib.SetUser(Session["APP_DBUSER"].ToString());

        string l_pk = Request["p_master_pk"];
        string l_tco_company_pk=Request["p_company_pk"];
        string TemplateFile = "rpt_60240010_Reservation.xls";
        string TempFile = "../../../system/temp/rpt_60240010_Reservation_" + Session["User_ID"].ToString() + ".xls";
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

        para = "'" + l_pk + "','"+l_tco_company_pk+"'";
        dt = ESysLib.TableReadOpenCursor("ht_rpt_60240010_reservation", para);
        //-----header---   

        //---end--header---
        //--set-----DataBind--in---Master---
        if (dt.Rows.Count == 0)
        {
            exSheet.Cells[6, 8].Value = "There is not data!";

        }
			//insert row de can bang page
		if (dt.Rows.Count == 1)
        {
            for (int l_addrow = 1; l_addrow < 17; l_addrow++)
			{
				exSheet.Range["A32"].Rows.EntireRow.Insert();//insert row new of sheet

			}
        }
		if (dt.Rows.Count == 2)
        {
            for (int l_addrow = 1; l_addrow < 16; l_addrow++)
			{
				exSheet.Range["A32"].Rows.EntireRow.Insert();//insert row new of sheet

			}
        }
		if (dt.Rows.Count == 3)
        {
            for (int l_addrow = 1; l_addrow < 15; l_addrow++)
			{
				exSheet.Range["A32"].Rows.EntireRow.Insert();//insert row new of sheet

			}
        }
		if (dt.Rows.Count == 4)
        {
            for (int l_addrow = 1; l_addrow < 14; l_addrow++)
			{
				exSheet.Range["A32"].Rows.EntireRow.Insert();//insert row new of sheet

			}
        }
		if (dt.Rows.Count == 5)
        {
            for (int l_addrow = 1; l_addrow < 13; l_addrow++)
			{
				exSheet.Range["A32"].Rows.EntireRow.Insert();//insert row new of sheet

			}
        }
		if (dt.Rows.Count == 6)
        {
            for (int l_addrow = 1; l_addrow < 12; l_addrow++)
			{
				exSheet.Range["A32"].Rows.EntireRow.Insert();//insert row new of sheet

			}
        }
		if (dt.Rows.Count == 7)
        {
            for (int l_addrow = 1; l_addrow < 11; l_addrow++)
			{
				exSheet.Range["A32"].Rows.EntireRow.Insert();//insert row new of sheet

			}
        }
		if (dt.Rows.Count == 8)
        {
            for (int l_addrow = 1; l_addrow < 10; l_addrow++)
			{
				exSheet.Range["A32"].Rows.EntireRow.Insert();//insert row new of sheet

			}
        }
		if (dt.Rows.Count == 9)
        {
            for (int l_addrow = 1; l_addrow < 9; l_addrow++)
			{
				exSheet.Range["A32"].Rows.EntireRow.Insert();//insert row new of sheet

			}
        }
		if (dt.Rows.Count == 10)
        {
            for (int l_addrow = 1; l_addrow < 8; l_addrow++)
			{
				exSheet.Range["A32"].Rows.EntireRow.Insert();//insert row new of sheet

			}
        }
		if (dt.Rows.Count == 11)
        {
            for (int l_addrow = 1; l_addrow < 7; l_addrow++)
			{
				exSheet.Range["A32"].Rows.EntireRow.Insert();//insert row new of sheet

			}
        }
		if (dt.Rows.Count == 12)
        {
            for (int l_addrow = 1; l_addrow < 6; l_addrow++)
			{
				exSheet.Range["A32"].Rows.EntireRow.Insert();//insert row new of sheet

			}
        }
		if (dt.Rows.Count == 13)
        {
            for (int l_addrow = 1; l_addrow < 5; l_addrow++)
			{
				exSheet.Range["A32"].Rows.EntireRow.Insert();//insert row new of sheet

			}
        }
		if (dt.Rows.Count == 14)
        {
            for (int l_addrow = 1; l_addrow < 4; l_addrow++)
			{
				exSheet.Range["A32"].Rows.EntireRow.Insert();//insert row new of sheet

			}
        }
		if (dt.Rows.Count == 15)
        {
            for (int l_addrow = 1; l_addrow < 3; l_addrow++)
			{
				exSheet.Range["A32"].Rows.EntireRow.Insert();//insert row new of sheet

			}
        }
		
		//end insert row de can bang page
        if (dt.Rows.Count > 0)
        {
            
			//exSheet.Cells[3, 1].Value = "Month :"+l_month.Substring(4,2)+"/"+l_month.Substring(0,4);
			//exSheet.Cells[3, 6].Value = dt.Rows[0]["print_time"].ToString();  
			
			exSheet.Cells[6, 3].Value = dt.Rows[0]["full_name"].ToString();
			exSheet.Cells[6, 7].Value = dt.Rows[0]["contact_person"].ToString();
			
			exSheet.Cells[7, 7].Value = dt.Rows[0]["company_name"].ToString();
			exSheet.Cells[11, 3].Value = dt.Rows[0]["crt_dt"].ToString();
			exSheet.Cells[9, 7].Value = dt.Rows[0]["phone"].ToString();
			exSheet.Cells[10, 7].Value = dt.Rows[0]["fax"].ToString();
			exSheet.Cells[11, 7].Value = dt.Rows[0]["email"].ToString();
			exSheet.Cells[12, 6].Value = "Reservation# :"+dt.Rows[0]["slip_no"].ToString();
			exSheet.Cells[14, 3].Value = dt.Rows[0]["contact_person"].ToString();//Dear:
			if(dt.Rows[0]["total_deposit_amt_bk"].ToString() !="")
			{
				exSheet.Cells[24, 4].Value = double.Parse(dt.Rows[0]["total_deposit_amt_bk"].ToString());
			}
			exSheet.Cells[25, 3].Value = dt.Rows[0]["credit_card_owner"].ToString();
			exSheet.Cells[26, 3].Value = dt.Rows[0]["credit_type"].ToString();
			exSheet.Cells[27, 3].Value = dt.Rows[0]["credit_no"].ToString();
			exSheet.Cells[28, 3].Value = dt.Rows[0]["expire_date"].ToString();
			exSheet.Cells[21, 3].Value = dt.Rows[0]["request_desc"].ToString();
        }

        //----------------------
        ////end-set-----DataBind--in---Master---

        for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range["A19"].Rows.EntireRow.Insert();//insert row new of sheet

        }
        //set date title of year
        //exSheet.Cells[2, 1].Value = "Income Statement Year" + " " + l_year;

        //set data to detail.
        // loop detail not percent
		int l_total_room=0,l_total_guest=0;
		int l_begin_row=18;
		
		int l_cnt = dt.Rows.Count;
		for (int l_row = 0; l_row < dt.Rows.Count; l_row++)
		{				
			exSheet.Range[l_begin_row + l_row,2,l_begin_row + l_row, 4].Merge();
			
			exSheet.Cells[l_begin_row + l_row, 2].Value = dt.Rows[l_row]["guest_name"].ToString();
			exSheet.Cells[l_begin_row + l_row, 5].Value = dt.Rows[l_row]["room_type"].ToString();
			if(dt.Rows[l_row]["total_amt"].ToString()!="")
			{
				exSheet.Cells[l_begin_row + l_row, 6].Value = double.Parse(dt.Rows[l_row]["total_amt"].ToString());
			}
			exSheet.Cells[l_begin_row + l_row, 7].Value = dt.Rows[l_row]["from_date"].ToString();
			exSheet.Cells[l_begin_row + l_row, 8].Value = dt.Rows[l_row]["date_to"].ToString();
			if(dt.Rows[l_row]["night"].ToString()!="")
			{
				exSheet.Cells[l_begin_row + l_row, 9].Value = double.Parse(dt.Rows[l_row]["night"].ToString());
			}
			if(dt.Rows[l_row]["total_guest"].ToString()!="")
			{
				exSheet.Cells[l_begin_row + l_row, 10].Value = double.Parse(dt.Rows[l_row]["total_guest"].ToString());
			}			
		}
	
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }


        // hide row firts 

        range = exSheet.Range["A1"];
        // hide row A5 
        //range.Rows.Hidden = true;

        // font bold header

        exBook.SaveAs(TempFile);
        //ESysLib.ExcelToPdf(TempFile);
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