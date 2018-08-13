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

public partial class reports_rpt_dsbs00243 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
		//CtlLib.SetUser("SALE");

        string TemplateFile = "rpt_dsbs00243.xls";
        string TempFile = "../../../../system/temp/rpt_dsbs00243_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        string p_partner_pk = Request.QueryString["p_partner_pk"];
        string p_year  		= Request.QueryString["p_year"];
		string p_out_type 	= Request.QueryString["p_out_type"];        
		string p_po_no      = Request.QueryString["p_po_no"];
		string p_item       = Request.QueryString["p_item"];
         
        string para = "'" + p_partner_pk + "','" + p_year + "','" + p_out_type + "','" + p_po_no + "','" + p_item + "'";
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_dsbs00243"   , para);				 
		
		// INSERT ROWS
		for (int l_addrow = 0; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A12"].Rows.EntireRow.Insert();//insert row new of sheet
        }
				 		
		// SET DATA		   
		int pos = 11 ;		 
		
		Color color1 = ColorTranslator.FromHtml("0xCCFFFF");
		Color color2 = ColorTranslator.FromHtml("0xFFFFCC");
		
		//----------		
		exSheet.Cells["G7"].Value = p_year + "-" + p_out_type;
		//----------
		
		for (int i = 0; i < dtDetail.Rows.Count; i++)
        {
            exSheet.Cells[pos + i, 1 ].Value = i + 1 ;
			exSheet.Cells[pos + i, 2 ].Value = dtDetail.Rows[i]["master_remark"];
			exSheet.Cells[pos + i, 3 ].Value = dtDetail.Rows[i]["po_no"];
			exSheet.Cells[pos + i, 4 ].Value = "-";
			exSheet.Cells[pos + i, 5 ].Value = dtDetail.Rows[i]["item_name"];
			exSheet.Cells[pos + i, 6 ].Value = dtDetail.Rows[i]["t_size"];
			exSheet.Cells[pos + i, 7 ].Value = dtDetail.Rows[i]["color"];
			exSheet.Cells[pos + i, 8 ].Value = dtDetail.Rows[i]["uom"];
			exSheet.Cells[pos + i, 9 ].Value = dtDetail.Rows[i]["ord_qty"];
			exSheet.Cells[pos + i, 10].Value = dtDetail.Rows[i]["out_qty"];
			exSheet.Cells[pos + i, 11].Value = dtDetail.Rows[i]["unit_price"];
			exSheet.Cells[pos + i, 12].Value = dtDetail.Rows[i]["item_amount"]; 
			exSheet.Cells[pos + i, 13].Value = "-"; 	 
        }
		 		 		 	
		//---------
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }
        // hide row firts 
        range = exSheet.Range["A1"];
        // hide row A5 
        // range.Rows.Hidden = true;
        // font bold header
        /*range = exSheet.Range["A1:AC1"];
        range.Rows[4].Font.Bold = true;*/

        exBook.SaveAs(TempFile);
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
        //Response.WriteFile(pdfFilePath);
        Response.WriteFile(TempFile);
        //Stop execute  
        Response.End();

    }
   
}