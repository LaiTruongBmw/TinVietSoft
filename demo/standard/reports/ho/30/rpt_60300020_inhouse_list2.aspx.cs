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

public partial class rpt_60300020_inhouse_list2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

         CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string l_room_no_guest_group = Request["p_room"];
		string l_report_type =Request["p_report_type"];
        string TemplateFile = "rpt_60300020_inhouse_list2.xls";
        string TempFile = "../../../../system/temp/rpt_60300020_inhouse_list2_" + Session["User_ID"].ToString() + ".xls";
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
        dt = CtlLib.TableReadOpenCursor("ht_rpt_60300010_new", para);
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
			exSheet.Cells[3, 13].Value = dt.Rows[0]["print_time"].ToString();
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
	  double tt_adult_total_guest=0 ,tt_child_total_guest=0,l_total_room=0;
        for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range["A6"].Rows.EntireRow.Insert();//insert row new of sheet
        }
        
        for (int l_row = 0; l_row < dt.Rows.Count; l_row++)
        {
				
			exSheet.Cells[l_row_first + l_row, 1].Value = dt.Rows[l_row]["guest_name"].ToString();
			exSheet.Cells[l_row_first + l_row, 2].Value = dt.Rows[l_row]["checkin_date"].ToString();
			exSheet.Cells[l_row_first + l_row, 3].Value = dt.Rows[l_row]["departure_date"].ToString();
			if(dt.Rows[l_row]["room_no"].ToString()!="")
			{
				exSheet.Cells[l_row_first + l_row, 4].Value = double.Parse(dt.Rows[l_row]["room_no"].ToString());
			}
			exSheet.Cells[l_row_first + l_row, 5].Value = dt.Rows[l_row]["room_code"].ToString();
			if(dt.Rows[l_row]["room_rate"].ToString()!="")
			{
				exSheet.Cells[l_row_first + l_row, 6].Value = double.Parse(dt.Rows[l_row]["room_rate"].ToString());
			}
			if(dt.Rows[l_row]["child_total_guest"].ToString()!="")
			{
				exSheet.Cells[l_row_first + l_row, 7].Value = double.Parse(dt.Rows[l_row]["child_total_guest"].ToString());
				tt_child_total_guest=tt_child_total_guest+double.Parse(dt.Rows[l_row]["child_total_guest"].ToString());
			}
			if(dt.Rows[l_row]["adult_total_guest"].ToString()!="")
			{
				exSheet.Cells[l_row_first + l_row, 8].Value = double.Parse(dt.Rows[l_row]["adult_total_guest"].ToString());
				tt_adult_total_guest=tt_adult_total_guest+double.Parse(dt.Rows[l_row]["adult_total_guest"].ToString());
			}
			exSheet.Cells[l_row_first + l_row, 9].Value = dt.Rows[l_row]["company_name"].ToString();
			exSheet.Cells[l_row_first + l_row, 10].Value = dt.Rows[l_row]["nation"].ToString();
			exSheet.Cells[l_row_first + l_row, 11].Value = dt.Rows[l_row]["request_master"].ToString();
			exSheet.Cells[l_row_first + l_row, 12].Value = dt.Rows[l_row]["detail_request"].ToString();
			//exSheet.Cells[l_row_first + l_row, 13].Value = dt.Rows[l_row]["adult_total_guest"].ToString();  special service
			exSheet.Cells[l_row_first + l_row, 14].Value = dt.Rows[l_row]["VIP"].ToString();
		}
			exSheet.Cells[l_row_first+l_cnt, 7].Value =tt_child_total_guest ;
			exSheet.Cells[l_row_first+l_cnt, 8].Value = tt_adult_total_guest;
			//exSheet.Cells[3, 1].Value = "Total : "+l_total_room+" Room(s.)";
			
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