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

public partial class rpt_60300010 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

     CtlLib.SetUser(Session["APP_DBUSER"].ToString());

     string l_dt_frm="",l_dt_departure="",l_parameter="",l_guest_name="",l_total_room="",l_report_type="";
			l_dt_frm =Request["p_dt_frm"];
			l_dt_departure =Request["p_dt_departure"];
			l_guest_name =Request["p_guest_name"];
			l_total_room =Request["p_count_RM"];
			l_report_type =Request["p_report_type"];
			
			l_parameter = "'" + l_dt_frm + "','" + l_dt_departure + "','"+l_guest_name+"','" + l_report_type + "'";  
       
        string TemplateFile = "rpt_60300010.xls";
        string TempFile = "../../../../system/temp/rpt_60300010_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        
        DataTable dt;

       
        dt = CtlLib.TableReadOpenCursor("ht_rpt_60300010_arrival", l_parameter);
        //-----header---   

        //---end--header---
        //--set-----DataBind--in---Master---
        if (dt.Rows.Count == 0)
        {
            exSheet.Cells[6, 1].Value = "There is not data!";

        }
        if (dt.Rows.Count > 0)
        {
				if(l_report_type=="1")
			{
				exSheet.Cells[1, 5].Value = "Arrival list ";
			}
			if(l_report_type=="2")
			{
				exSheet.Cells[1, 5].Value = "Arrival list (Normal)";
			}
			if(l_report_type=="3")
			{
				exSheet.Cells[1, 5].Value = "Arrival list (VIP)";
			}
			exSheet.Cells[2, 1].Value = dt.Rows[0]["date_para"].ToString();
			 exSheet.Cells[2, 14].Value = dt.Rows[0]["print_time"].ToString();
			//	exSheet.Cells[4, 12].Value = dt.Rows[0]["date_header"].ToString(); 
        }

        //----------------------
        ////end-set-----DataBind--in---Master---
		int l_row_first=4;
        for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range["A5"].Rows.EntireRow.Insert();//insert row new of sheet
        }
        
        for (int l_row = 0; l_row < dt.Rows.Count; l_row++)
        {
				
			exSheet.Cells[l_row_first + l_row, 1].Value = dt.Rows[l_row]["company_name"].ToString();
			exSheet.Cells[l_row_first + l_row, 2].Value = dt.Rows[l_row]["last_name"].ToString();
			exSheet.Cells[l_row_first + l_row, 3].Value = dt.Rows[l_row]["from_date"].ToString();
			exSheet.Cells[l_row_first + l_row, 4].Value = dt.Rows[l_row]["date_to"].ToString();
			if(dt.Rows[l_row]["total_day"].ToString()!="")
			{
				exSheet.Cells[l_row_first + l_row, 5].Value = double.Parse(dt.Rows[l_row]["total_day"].ToString());
			}
			if(dt.Rows[l_row]["room_rate"].ToString()!="")
			{
				exSheet.Cells[l_row_first + l_row, 6].Value = double.Parse(dt.Rows[l_row]["room_rate"].ToString());
			}
			exSheet.Cells[l_row_first + l_row, 7].Value = dt.Rows[l_row]["room_type"].ToString();
			if(dt.Rows[l_row]["room_no"].ToString()!="")
			{
				exSheet.Cells[l_row_first + l_row, 8].Value = double.Parse(dt.Rows[l_row]["room_no"].ToString());
			}
			//exSheet.Cells[l_row_first + l_row, 9].Value = dt.Rows[l_row]["contact_person"].ToString();
			if(dt.Rows[l_row]["total_adult"].ToString()!="")
			{
				exSheet.Cells[l_row_first + l_row, 9].Value = double.Parse(dt.Rows[l_row]["total_adult"].ToString());		
			}
			if(dt.Rows[l_row]["total_child"].ToString()!="")
			{
				exSheet.Cells[l_row_first + l_row, 10].Value = double.Parse(dt.Rows[l_row]["total_child"].ToString());
			}
			if(dt.Rows[l_row]["slip_no"].ToString()!="")
			{
				exSheet.Cells[l_row_first + l_row, 11].Value = dt.Rows[l_row]["slip_no"].ToString();
			}
			exSheet.Cells[l_row_first + l_row, 12].Value = dt.Rows[l_row]["detail_request"].ToString();	
			exSheet.Cells[l_row_first + l_row, 13].Value = dt.Rows[l_row]["vip_type"].ToString();		
			exSheet.Cells[l_row_first + l_row, 14].Value = dt.Rows[l_row]["description"].ToString();
			//exSheet.Cells[l_row_first + l_row, 15].Value = dt.Rows[l_row]["description"].ToString();
			exSheet.Cells[l_row_first + l_row, 16].Value = dt.Rows[l_row]["nation"].ToString();
			exSheet.Cells[l_row_first + l_row, 17].Value = dt.Rows[l_row]["group_name"].ToString();	
				
		}
        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }


        // hide row firts 

       // range = exSheet.Range["A1"];
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