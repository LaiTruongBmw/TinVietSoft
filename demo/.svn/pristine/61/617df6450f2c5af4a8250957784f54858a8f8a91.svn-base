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

public partial class rpt_60250030_ih_history : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser("crm");
        string l_date_frm = Request["p_date_frm"];
        string l_date_to = Request["p_date_to"];
		
        string TemplateFile = "rpt_60250030_ih_history.xls";
        string TempFile = "../../../../system/temp/rpt_60250030_ih_history_" + Session["User_ID"].ToString() + ".xls";
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

        para = "'"+l_date_frm+"','"+l_date_to+"'";
        dt = CtlLib.TableReadOpenCursor("ht_rpt_60250030_ih_history", para);
        //-----header---   

        //---end--header---
        //--set-----DataBind--in---Master---
        if (dt.Rows.Count == 0)
        {
            exSheet.Cells[8, 2].Value = "There is not data!";
        }

        if (dt.Rows.Count > 0)
        {
            exSheet.Cells[3, 1].Value = dt.Rows[0]["date_para"].ToString();
            exSheet.Cells[3, 20].Value = dt.Rows[0]["print_time"].ToString();  
        }

        //----------------------
        ////end-set-----DataBind--in---Master---
		int l_first_row=5;
        for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range[l_first_row+l_addrow,1].Rows.EntireRow.Insert();//insert row new of sheet

        }
        //set date title of year
        //exSheet.Cells[2, 1].Value = "Income Statement Year" + " " + l_year;

        //set data to detail.
        // loop detail not percent
		int l_room_charge_amt=0,l_amt_extrabed=0,l_BREAKFAST_AMT=0,l_other_room_fee=0,l_fnb_hotel_amt=0,l_minibar_amt=0,l_laundry_amt=0,l_others_amt=0,l_spa_amt=0,l_shop_amt=0,l_adjust_amt=0;
        int l_cnt = dt.Rows.Count;
		
        for (int l_row = 0; l_row < dt.Rows.Count; l_row++)
        {
				exSheet.Cells[l_first_row + l_row, 1].Value = dt.Rows[l_row]["company_name"];
				exSheet.Cells[l_first_row + l_row, 2].Value = dt.Rows[l_row]["customer_type"];
				exSheet.Cells[l_first_row + l_row, 3].Value = dt.Rows[l_row]["last_name"];
				exSheet.Cells[l_first_row + l_row, 4].Value = dt.Rows[l_row]["last_name"];
				exSheet.Cells[l_first_row + l_row, 5].Value = dt.Rows[l_row]["GENDER"];
				exSheet.Cells[l_first_row + l_row, 6].Value = dt.Rows[l_row]["NATION"];
				exSheet.Cells[l_first_row + l_row, 7].Value = dt.Rows[l_row]["checkin_date"];
				exSheet.Cells[l_first_row + l_row, 8].Value = dt.Rows[l_row]["checkout_date"];
				exSheet.Cells[l_first_row + l_row, 9].Value = dt.Rows[l_row]["advance_amt"];
				
				exSheet.Cells[l_first_row + l_row, 10].Value = dt.Rows[l_row]["room_type"];
				exSheet.Cells[l_first_row + l_row, 11].Value = dt.Rows[l_row]["room_no"];
				exSheet.Cells[l_first_row + l_row, 12].Value = dt.Rows[l_row]["room_charge_amt"];
				
				exSheet.Cells[l_first_row + l_row, 13].Value = dt.Rows[l_row]["amt_extrabed"];
				exSheet.Cells[l_first_row + l_row, 14].Value = dt.Rows[l_row]["BREAKFAST_AMT"];
				exSheet.Cells[l_first_row + l_row, 15].Value = dt.Rows[l_row]["other_room_fee"];
				exSheet.Cells[l_first_row + l_row, 16].Value = dt.Rows[l_row]["fnb_hotel_amt"];
				exSheet.Cells[l_first_row + l_row, 17].Value = dt.Rows[l_row]["minibar_amt"];
				exSheet.Cells[l_first_row + l_row, 18].Value = dt.Rows[l_row]["laundry_amt"];
				exSheet.Cells[l_first_row + l_row, 19].Value = dt.Rows[l_row]["others_amt"];
				exSheet.Cells[l_first_row + l_row, 20].Value = dt.Rows[l_row]["spa_amt"];
				exSheet.Cells[l_first_row + l_row, 21].Value = dt.Rows[l_row]["shop_amt"];
				exSheet.Cells[l_first_row + l_row, 22].Value = dt.Rows[l_row]["adjust_amt"];
								
				
				if(dt.Rows[l_row]["room_charge_amt"].ToString()!="")
				{
					l_room_charge_amt=l_room_charge_amt+int.Parse(dt.Rows[l_row]["room_charge_amt"].ToString());//8--19
				}
				if(dt.Rows[l_row]["amt_extrabed"].ToString()!="")
				{
					l_amt_extrabed=l_amt_extrabed+int.Parse(dt.Rows[l_row]["amt_extrabed"].ToString());//8--19
				}
				if(dt.Rows[l_row]["BREAKFAST_AMT"].ToString()!="")
				{
					l_BREAKFAST_AMT=l_BREAKFAST_AMT+int.Parse(dt.Rows[l_row]["BREAKFAST_AMT"].ToString());//8--19
				}
				if(dt.Rows[l_row]["other_room_fee"].ToString()!="")
				{
					l_other_room_fee=l_other_room_fee+int.Parse(dt.Rows[l_row]["other_room_fee"].ToString());//8--19
				}
				if(dt.Rows[l_row]["fnb_hotel_amt"].ToString()!="")
				{
					l_fnb_hotel_amt=l_fnb_hotel_amt+int.Parse(dt.Rows[l_row]["fnb_hotel_amt"].ToString());//8--19
				}
				if(dt.Rows[l_row]["minibar_amt"].ToString()!="")
				{
					l_minibar_amt=l_minibar_amt+int.Parse(dt.Rows[l_row]["minibar_amt"].ToString());//8--19
				}
				if(dt.Rows[l_row]["laundry_amt"].ToString()!="")
				{
					l_laundry_amt=l_laundry_amt+int.Parse(dt.Rows[l_row]["laundry_amt"].ToString());//8--19
				}
				if(dt.Rows[l_row]["others_amt"].ToString()!="")
				{
					l_others_amt=l_others_amt+int.Parse(dt.Rows[l_row]["others_amt"].ToString());//8--19
				}
				if(dt.Rows[l_row]["spa_amt"].ToString()!="")
				{
					l_spa_amt=l_spa_amt+int.Parse(dt.Rows[l_row]["spa_amt"].ToString());//8--19
				}
				if(dt.Rows[l_row]["shop_amt"].ToString()!="")
				{
					l_shop_amt=l_shop_amt+int.Parse(dt.Rows[l_row]["shop_amt"].ToString());//8--19
				}
				if(dt.Rows[l_row]["adjust_amt"].ToString()!="")
				{
					l_adjust_amt=l_adjust_amt+int.Parse(dt.Rows[l_row]["adjust_amt"].ToString());//8--19
				}
				
        }
		
		exSheet.Cells[5 + dt.Rows.Count, 12].Value =l_room_charge_amt;	
		exSheet.Cells[5 + dt.Rows.Count, 13].Value =l_amt_extrabed;
		exSheet.Cells[5 + dt.Rows.Count, 14].Value =l_BREAKFAST_AMT;
		exSheet.Cells[5 + dt.Rows.Count, 15].Value =l_other_room_fee;
		exSheet.Cells[5 + dt.Rows.Count, 16].Value =l_fnb_hotel_amt;
		exSheet.Cells[5 + dt.Rows.Count, 17].Value =l_minibar_amt;
		exSheet.Cells[5 + dt.Rows.Count, 18].Value =l_laundry_amt;
		exSheet.Cells[5 + dt.Rows.Count, 19].Value =l_others_amt;
		exSheet.Cells[5 + dt.Rows.Count, 20].Value =l_spa_amt;
		exSheet.Cells[5 + dt.Rows.Count, 21].Value =l_shop_amt;
		exSheet.Cells[5 + dt.Rows.Count, 22].Value =l_adjust_amt;
		

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