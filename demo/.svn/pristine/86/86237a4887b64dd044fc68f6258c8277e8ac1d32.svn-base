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

public partial class rpt_60300010_cash_daily_summary2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser("crm");

        string l_date = Request["p_date"]; 
		string l_date_to = Request["p_date_to"];	
		string l_room= Request["p_room"];
		string l_payment_method = Request["p_payment_method"];		
		string l_partner_PK = Request["p_partner_PK"];
		string l_time_frm = Request["p_time_frm"];  
		string l_time_to= Request["p_time_to"];
		string l_cashier = Request["p_cashier"];
	       
        string TemplateFile = "rpt_60300010_cash_daily_summary2.xls";
        string TempFile = "../../../../system/temp/rpt_60300010_cash_daily_summary2_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        string para = "";
        DataTable dt; 

        para = "'" + l_date + "','" + l_date_to + "','" + l_room + "','" + l_payment_method + "','" + l_partner_PK + "','" + l_time_frm + "','" + l_time_to + "','" + l_cashier + "'";
		
        dt = CtlLib.TableReadOpenCursor("rpt_60300010summery", para); 
        //-----header---   

        //---end--header---
        //--set-----DataBind--in---Master---
        if (dt.Rows.Count == 0)
        {
            exSheet.Cells[3, 8].Value = "There is not data!";

        }
        if (dt.Rows.Count > 0)   
        {
			
			if(l_time_frm !="")
			{
				exSheet.Cells[3, 4].Value = "Time :"+l_time_frm+" ~ "+l_time_to;
			}
			if(l_cashier !="")
			{
				exSheet.Cells[3, 8].Value = "Cashier ID :"+l_cashier;
			}
			exSheet.Cells[3, 1].Value = dt.Rows[0]["date_para"].ToString();
            exSheet.Cells[3, 12].Value = dt.Rows[0]["print_time"].ToString();
			exSheet.Cells[3, 6].Value = "Total :"+dt.Rows.Count+" Room(s).";
			
			/*exSheet.Cells[2, 1].Select();
			
			byte[] MyData = new byte[0];
			MyData = (byte[])dt.Rows[0]["logo_lotus"];
			MemoryStream stream = new MemoryStream(MyData);
			exSheet.Shapes.AddPicture(stream);*/
        }

        //----------------------
        ////end-set-----DataBind--in---Master---

        for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range["A6"].Rows.EntireRow.Insert();//insert row new of sheet
			
        }
        //set date title of year
        //exSheet.Cells[2, 1].Value = "Income Statement Year" + " " + l_year;

        //set data to detail.
        // loop detail not percent
		double l_ar_total_vnd=0, l_credit_total_vnd=0, l_total_cash_vnd =0, l_transfer_total_vnd=0;
		float l_cash_total_usd =0, l_credit_total_usd =0;
		
        int l_cnt = dt.Rows.Count;
        for (int l_row = 1; l_row <= dt.Rows.Count; l_row++)
        {
            for (int col = 0; col <= 14; col++)
            {
                if (col == 0 || col == 1 || col == 2 || col == 3|| col == 4|| col == 5|| col == 6|| col == 7|| col == 14)
                {
                    exSheet.Cells[4 + l_row, col + 1].Value = dt.Rows[l_row - 1][col].ToString();
                    exSheet.Cells[l_row + 4, col + 1].HorizontalAlignment = XlHAlign.xlHAlignLeft;
                }
                else
                {
                    if (col == 8||col == 10||col == 12||col == 13)
                    {
                        exSheet.Cells[4 + l_row, col + 1].Value = double.Parse(dt.Rows[l_row - 1][col].ToString());
                        exSheet.Cells[4, col + 1, l_row + 4, col + 1].NumberFormat = "#,##0";
                        exSheet.Cells[l_row + 4, col + 1].HorizontalAlignment = XlHAlign.xlHAlignRight;
						if(col == 8)
						{
							l_total_cash_vnd=l_total_cash_vnd + double.Parse(dt.Rows[l_row - 1][col].ToString());
						}
						if(col == 10)
						{
							l_credit_total_vnd=l_credit_total_vnd + double.Parse(dt.Rows[l_row - 1][col].ToString());
						}
						if(col == 12)
						{
							l_transfer_total_vnd=l_transfer_total_vnd + double.Parse(dt.Rows[l_row - 1][col].ToString());
						}
						if(col == 13)
						{
							l_ar_total_vnd=l_ar_total_vnd + double.Parse(dt.Rows[l_row - 1][col].ToString());
						}
						
                        if (double.Parse(dt.Rows[l_row - 1][col].ToString()) == 0)
                        {
                            exSheet.Cells[4 + l_row, col + 1].Value = "";
                        }
						
                    }
                    else
                    {
                       exSheet.Cells[4 + l_row, col + 1].Value = float.Parse(dt.Rows[l_row - 1][col].ToString());
                        exSheet.Cells[4, col + 1, l_row + 4, col + 1].NumberFormat = "#,##0.00";
                        exSheet.Cells[l_row + 4, col + 1].HorizontalAlignment = XlHAlign.xlHAlignRight;
						
						if(col == 9)
						{
							l_cash_total_usd=l_cash_total_usd + float.Parse(dt.Rows[l_row - 1][col].ToString());
						}
						if(col == 11) 
						{
							l_credit_total_usd=l_credit_total_usd + float.Parse(dt.Rows[l_row - 1][col].ToString());
						}
						
						
                        if (float.Parse(dt.Rows[l_row - 1][col].ToString()) == 0.00)
                        {
                            exSheet.Cells[4 + l_row, col + 1].Value = "";
                        } 
                    }
                }
            }
			exSheet.Cells[5 + dt.Rows.Count, 9].Value =l_total_cash_vnd;
			exSheet.Cells[5 + dt.Rows.Count, 11].Value =l_credit_total_vnd;
			exSheet.Cells[5 + dt.Rows.Count, 13].Value =l_transfer_total_vnd;
			exSheet.Cells[5 + dt.Rows.Count, 14].Value =l_ar_total_vnd;
			exSheet.Cells[5 + dt.Rows.Count, 10].Value =l_cash_total_usd;
			exSheet.Cells[5 + dt.Rows.Count, 12].Value =l_credit_total_usd;
        }

        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }


        // hide row firts 

        range = exSheet.Range["A1"];
        // hide row A5 
        range.Rows.Hidden = true;

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