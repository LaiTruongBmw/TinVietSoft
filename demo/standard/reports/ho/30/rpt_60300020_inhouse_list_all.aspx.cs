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

public partial class rpt_60300020_inhouse_list_all : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

         CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string l_room_no_guest_group = Request["p_room"];
		string l_report_type =Request["p_report_type"];
        string TemplateFile = "rpt_60300020_inhouse_list_all.xls";
        string TempFile = "../../../../system/temp/rpt_60300020_inhouse_list_all_" + Session["User_ID"].ToString() + ".xls";
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

        para = "'" + l_room_no_guest_group + "','" + l_report_type +"'";
        dt = CtlLib.TableReadOpenCursor("ht_rpt_60250030_form", para);
        //-----header---   

        //---end--header---
        //--set-----DataBind--in---Master---
        if (dt.Rows.Count == 0)
        {
            exSheet.Cells[3, 3].Value = "There is not data!";

        }
        if (dt.Rows.Count > 0)
        {
           // exSheet.Cells[3, 1].Value = "Total : "+dt.Rows.Count+" Rooms.";
			exSheet.Cells[3, 26].Value = dt.Rows[0]["print_time"].ToString();
			//exSheet.Cells[3, 1].Value = dt.Rows[0]["date_para"].ToString();
				if(l_report_type=="1")
			{
				exSheet.Cells[2, 2].Value = "Inhouse list ";
			}
				if(l_report_type=="2")
			{
				exSheet.Cells[2, 2].Value = "Inhouse list (Normal)";
			}
				if(l_report_type=="3")
			{
				exSheet.Cells[2, 2].Value = "Inhouse list (VIP)";
			}
        }

        //----------------------
        ////end-set-----DataBind--in---Master---

      int l_row_first=5,l_cnt=dt.Rows.Count;
	  int tt_rate=0,tt_deposit=0,tt_child_M=0 ,tt_child_F=0,tt_adult_M=0,tt_adult_F=0;
        for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range["A6"].Rows.EntireRow.Insert();//insert row new of sheet
        }
        
        for (int l_row = 0; l_row < dt.Rows.Count; l_row++)
        {	
			exSheet.Cells[l_row_first + l_row, 1].Value = dt.Rows[l_row]["group_name"];
			exSheet.Cells[l_row_first + l_row, 2].Value = dt.Rows[l_row]["room_no"];
			exSheet.Cells[l_row_first + l_row, 3].Value = dt.Rows[l_row]["rate"];
			if(dt.Rows[l_row]["rate"].ToString()!="")
			{
				tt_rate=tt_rate+int.Parse(dt.Rows[l_row]["rate"].ToString());
			}
			exSheet.Cells[l_row_first + l_row, 4].Value = dt.Rows[l_row]["deposit_amt_vnd"];
			if(dt.Rows[l_row]["rate"].ToString()!="")
			{
				tt_rate=tt_rate+int.Parse(dt.Rows[l_row]["rate"].ToString());
			}
			exSheet.Cells[l_row_first + l_row, 5].Value = dt.Rows[l_row]["company_name"];
			exSheet.Cells[l_row_first + l_row, 6].Value = dt.Rows[l_row]["customer_type"];
			exSheet.Cells[l_row_first + l_row, 7].Value = dt.Rows[l_row]["last_name"];
			exSheet.Cells[l_row_first + l_row, 8].Value = dt.Rows[l_row]["gender"];
			exSheet.Cells[l_row_first + l_row, 9].Value = dt.Rows[l_row]["nation"];
			exSheet.Cells[l_row_first + l_row, 10].Value = dt.Rows[l_row]["checkin_date"];
			exSheet.Cells[l_row_first + l_row, 11].Value = dt.Rows[l_row]["departure_date"];
			
			exSheet.Cells[l_row_first + l_row, 12].Value = dt.Rows[l_row]["room_type"];
			exSheet.Cells[l_row_first + l_row, 13].Value = dt.Rows[l_row]["contact_name"];
			exSheet.Cells[l_row_first + l_row, 14].Value = dt.Rows[l_row]["contact_phone"];
			exSheet.Cells[l_row_first + l_row, 15].Value = dt.Rows[l_row]["contact_email"];
			exSheet.Cells[l_row_first + l_row, 16].Value = dt.Rows[l_row]["total_adult"];
			if(dt.Rows[l_row]["total_adult"].ToString()!="")
			{
				tt_adult_M=tt_adult_M+int.Parse(dt.Rows[l_row]["total_adult"].ToString());
			}
			exSheet.Cells[l_row_first + l_row, 17].Value = dt.Rows[l_row]["total_adult_female"];
			if(dt.Rows[l_row]["total_adult_female"].ToString()!="")
			{
				tt_adult_F=tt_adult_F+int.Parse(dt.Rows[l_row]["total_adult_female"].ToString());
			}
			exSheet.Cells[l_row_first + l_row, 18].Value = dt.Rows[l_row]["total_child"];
			if(dt.Rows[l_row]["total_child"].ToString()!="")
			{
				tt_child_M=tt_child_M+int.Parse(dt.Rows[l_row]["total_child"].ToString());
			}
			exSheet.Cells[l_row_first + l_row, 19].Value = dt.Rows[l_row]["total_child_female"];
			if(dt.Rows[l_row]["total_child_female"].ToString()!="")
			{
				tt_child_F=tt_child_F+int.Parse(dt.Rows[l_row]["total_child_female"].ToString());
			}
			exSheet.Cells[l_row_first + l_row, 20].Value = dt.Rows[l_row]["crt_by"];
			exSheet.Cells[l_row_first + l_row, 21].Value = dt.Rows[l_row]["checkin_time"];
			exSheet.Cells[l_row_first + l_row, 22].Value = dt.Rows[l_row]["request"];
			exSheet.Cells[l_row_first + l_row, 23].Value = dt.Rows[l_row]["passport_no"];
			exSheet.Cells[l_row_first + l_row, 24].Value = dt.Rows[l_row]["tht_rate_plans_pk"];
			exSheet.Cells[l_row_first + l_row, 25].Value = dt.Rows[l_row]["Folio"];
			exSheet.Cells[l_row_first + l_row, 26].Value = dt.Rows[l_row]["Guest2_name"];
			exSheet.Cells[l_row_first + l_row, 27].Value = dt.Rows[l_row]["lunch_amt"];
			exSheet.Cells[l_row_first + l_row, 28].Value = dt.Rows[l_row]["dinner_amt"];
			
		}
			exSheet.Cells[l_row_first+l_cnt, 3].Value =tt_rate ;
			exSheet.Cells[l_row_first+l_cnt, 4].Value = tt_deposit;
			exSheet.Cells[l_row_first+l_cnt, 16].Value =tt_adult_M ;
			exSheet.Cells[l_row_first+l_cnt, 17].Value = tt_adult_F;
			exSheet.Cells[l_row_first+l_cnt, 18].Value =tt_child_M ;
			exSheet.Cells[l_row_first+l_cnt, 19].Value = tt_child_F;
			
			
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