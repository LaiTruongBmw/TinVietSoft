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
            exSheet.Cells[3, 25].Value = dt.Rows[0]["print_time"].ToString();  
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
		int l_Room_Charge=0,l_Total_Due=0,l_Payed=0,l_Deposit=0,l_F_B_Hotel=0,l_MiniBar=0,l_Laundry=0;
		int l_Telephone=0,l_Others=0,l_Spa_fee=0,l_Lotus_shop=0,l_Adjust=0;
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
				exSheet.Cells[l_first_row + l_row, 12].Value = dt.Rows[l_row]["EX_RATE"];
				exSheet.Cells[l_first_row + l_row, 13].Value = dt.Rows[l_row]["amt_extrabed"];
				exSheet.Cells[l_first_row + l_row, 14].Value = dt.Rows[l_row]["BREAKFAST_AMT"];
				exSheet.Cells[l_first_row + l_row, 15].Value = dt.Rows[l_row]["fnb_hotel_amt"];
				exSheet.Cells[l_first_row + l_row, 16].Value = dt.Rows[l_row]["minibar_amt"];
				exSheet.Cells[l_first_row + l_row, 17].Value = dt.Rows[l_row]["laundry_amt"];
				exSheet.Cells[l_first_row + l_row, 18].Value = dt.Rows[l_row]["others_amt"];
				exSheet.Cells[l_first_row + l_row, 19].Value = dt.Rows[l_row]["spa_amt"];
				exSheet.Cells[l_first_row + l_row, 20].Value = dt.Rows[l_row]["shop_amt"];
				exSheet.Cells[l_first_row + l_row, 21].Value = dt.Rows[l_row]["adjust_amt"];
				
				
		
				/*if(dt.Rows[l_row]["room_charge"].ToString()!="")
				{
					l_Room_Charge=l_Room_Charge+int.Parse(dt.Rows[l_row]["room_charge"].ToString());//8--19
				}
				if(dt.Rows[l_row]["total_due"].ToString()!="")
				{
					l_Total_Due=l_Total_Due+int.Parse(dt.Rows[l_row]["total_due"].ToString());//8--19
				}
				if(dt.Rows[l_row]["actual_pay"].ToString()!="")
				{
					l_Payed=l_Payed+int.Parse(dt.Rows[l_row]["actual_pay"].ToString());//8--19
				}
				if(dt.Rows[l_row]["advance_amt"].ToString()!="")
				{
					l_Deposit=l_Deposit+int.Parse(dt.Rows[l_row]["advance_amt"].ToString());//8--19
				}
				if(dt.Rows[l_row]["fnb_hotel_amt"].ToString()!="")
				{
					l_F_B_Hotel=l_F_B_Hotel+int.Parse(dt.Rows[l_row]["fnb_hotel_amt"].ToString());//8--19
				}
				if(dt.Rows[l_row]["minibar_amt"].ToString()!="")
				{
					l_MiniBar=l_MiniBar+int.Parse(dt.Rows[l_row]["minibar_amt"].ToString());//8--19
				}
				if(dt.Rows[l_row]["laundry_amt"].ToString()!="")
				{
					l_Laundry=l_Laundry+int.Parse(dt.Rows[l_row]["laundry_amt"].ToString());//8--19
				}
				if(dt.Rows[l_row]["telephone"].ToString()!="")
				{
					l_Telephone=l_Telephone+int.Parse(dt.Rows[l_row]["telephone"].ToString());//8--19
				}
				if(dt.Rows[l_row]["others_amt"].ToString()!="")
				{
					l_Others=l_Others+int.Parse(dt.Rows[l_row]["others_amt"].ToString());//8--19
				}
				if(dt.Rows[l_row]["spa_amt"].ToString()!="")
				{
					l_Spa_fee=l_Spa_fee+int.Parse(dt.Rows[l_row]["spa_amt"].ToString());//8--19
				}
				if(dt.Rows[l_row]["shop_amt"].ToString()!="")
				{
					l_Lotus_shop=l_Lotus_shop+int.Parse(dt.Rows[l_row]["shop_amt"].ToString());//8--19
				}
				if(dt.Rows[l_row]["adjust_amt"].ToString()!="")
				{
					l_Adjust=l_Adjust+int.Parse(dt.Rows[l_row]["adjust_amt"].ToString());//8--19
				}*/
        }
		/*exSheet.Cells[5 + dt.Rows.Count, 10].Value =l_Room_Charge;
		exSheet.Cells[5 + dt.Rows.Count, 11].Value =l_Total_Due;
		exSheet.Cells[5 + dt.Rows.Count, 12].Value =l_Payed;
		exSheet.Cells[5 + dt.Rows.Count, 13].Value =l_Deposit;
		exSheet.Cells[5 + dt.Rows.Count, 14].Value =l_F_B_Hotel;
		exSheet.Cells[5 + dt.Rows.Count, 15].Value =l_MiniBar;
		exSheet.Cells[5 + dt.Rows.Count, 16].Value =l_Laundry;
		exSheet.Cells[5 + dt.Rows.Count, 17].Value =l_Telephone;
		exSheet.Cells[5 + dt.Rows.Count, 18].Value =l_Others;
		exSheet.Cells[5 + dt.Rows.Count, 19].Value =l_Spa_fee;
		exSheet.Cells[5 + dt.Rows.Count, 20].Value =l_Lotus_shop;
		exSheet.Cells[5 + dt.Rows.Count, 21].Value =l_Adjust;*/

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