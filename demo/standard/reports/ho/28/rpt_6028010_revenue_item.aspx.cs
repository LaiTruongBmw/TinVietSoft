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

public partial class rpt_6028010_revenue_item : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
        string l_dtfrm = Request["p_from"];
        string l_dtto = Request["p_to"];
        string l_guest_name = Request["p_guest_name"];

        string l_parameter = "'" + l_dtfrm + "','" + l_dtto + "'";

        string TemplateFile = "rpt_6028010_revenue_item.xls";
        string TempFile = "../../../../system/temp/rpt_6028010_revenue_item_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file

        //DataTable dtMst = CtlLib.TableReadOpenCursor("acnt.sp_rpt_gfrp00010_mst", l_parameter);
        DataTable dtDetail = CtlLib.TableReadOpenCursor("ht_rpt_60280100_1", l_parameter);

        //-----header---   

        //---end--header---
        //--set-----DataBind--in---Master---
		if(dtDetail.Rows.Count>0)
		{
			exSheet.Cells[3, 1].Value = dtDetail.Rows[0]["date_para"].ToString();
		   
			exSheet.Cells[3, 7].Value = dtDetail.Rows[0]["print_time"].ToString();
		}
        //----------------------
        
        int l_first_row1=6;
        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range[l_first_row1+l_addrow,1].Rows.EntireRow.Insert();//insert row new of sheet

        }
        //set date title of year
        //exSheet.Cells[2, 1].Value = "Income Statement Year" + " " + l_year;

        //set data to detail.
        // loop detail not percent
		int l_first_row=5;
		 int l_cnt = dtDetail.Rows.Count;
		double l_total_qty=0,l_total_amt=0;
        for (int l_row = 1; l_row <= dtDetail.Rows.Count; l_row++)
        {
			exSheet.Cells[l_first_row + l_row, 1].Value = dtDetail.Rows[l_row-1]["invoice_date"];
			exSheet.Cells[l_first_row + l_row, 2].Value = dtDetail.Rows[l_row-1]["invoice_id"];
			exSheet.Cells[l_first_row + l_row, 3].Value = dtDetail.Rows[l_row-1]["item_name"];
			exSheet.Cells[l_first_row + l_row, 4].Value = dtDetail.Rows[l_row-1]["item_qty"];
			if(dtDetail.Rows[l_row-1]["item_qty"].ToString()!="")
			{
				l_total_qty=l_total_qty+double.Parse(dtDetail.Rows[l_row-1]["item_qty"].ToString());
			}
			exSheet.Cells[l_first_row + l_row, 5].Value = dtDetail.Rows[l_row-1]["price"];
			exSheet.Cells[l_first_row + l_row, 6].Value = dtDetail.Rows[l_row-1]["amount"];
			exSheet.Cells[l_first_row + l_row, 7].Value = dtDetail.Rows[l_row-1]["discount_amt"];
			exSheet.Cells[l_first_row + l_row, 8].Value = dtDetail.Rows[l_row-1]["total_due"];
			if(dtDetail.Rows[l_row-1]["total_due"].ToString()!="")
			{
				l_total_amt=l_total_amt+double.Parse(dtDetail.Rows[l_row-1]["total_due"].ToString());
			}
			if (l_row < dtDetail.Rows.Count)
			{
				if(dtDetail.Rows[l_row-1]["invoice_id"].ToString() == dtDetail.Rows[l_row]["invoice_id"].ToString())
				{
					exSheet.Range[l_first_row + l_row, 1,l_first_row + l_row+1, 1].Merge();	
					exSheet.Range[l_first_row + l_row, 2,l_first_row + l_row+1, 2].Merge();
					exSheet.Range[l_first_row + l_row, 8,l_first_row + l_row+1, 8].Merge();
					//l_long_term=l_long_term+1;
				}
			}
		}
		//exSheet.Cells[6 + l_cnt, 3].Value=l_total_qty;
		//exSheet.Cells[6 + l_cnt, 5].Value=l_total_amt;
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
        /*range = exSheet.Range["A1:AC1"];
        range.Rows[4].Font.Bold = true;*/

        exBook.SaveAs(TempFile);
        //write out to client broswer
        System.IO.FileInfo file = new System.IO.FileInfo(TempFile);
        Response.Clear();
        Response.Charset = "UTF-8";
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        //Add header, give a default file name for "File Download/Store as"
        Response.AddHeader("Content-Disposition", "attachment; filename=" + Server.UrlEncode(file.Name));
        //Add header, set file size to enable browser display download progress
        Response.AddHeader("Content-Length", file.Length.ToString());
        //Set the return string is unavailable reading for client, and must be downloaded
        Response.ContentType = "application/ms-exSheet";
        //Send file string to client 
        Response.WriteFile(TempFile);
        //Stop execute  
        Response.End();

    }
}
