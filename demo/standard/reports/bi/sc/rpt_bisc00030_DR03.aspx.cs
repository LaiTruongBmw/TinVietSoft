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

public partial class rpt_bisc00030_DR03 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
		
        string l_from_date = Request["p_from_date"];
        string l_to_date   = Request["p_to_date"];        

        string TemplateFile = "rpt_bisc00030_DR03.xls";
		
        string TempFile = "../../../../system/temp/rpt_bisc00030_DR03_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        string l_parameter = "'" + l_from_date + "','" + l_to_date + "'";
		
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00030_DR03_1", l_parameter);
		DataTable dtMaster = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00030_DR03_2", l_parameter);

        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A9"].Rows.EntireRow.Insert();//insert row new of sheet

        }
		
		if ( dtDetail.Rows.Count > 0 )
		{
			exSheet.Cells["B4"].Value = dtMaster.Rows[0]["search_date"].ToString();  
		}
		
		//-----------------------
		exSheet.Cells["D4"].Value = DateTime.Now.ToString("HH:mm"); 
		
        // loop detail not percent
        for (int l_row = 0; l_row < dtDetail.Rows.Count; l_row++)
        {   
			exSheet.Cells[8 + l_row, 1].Value = l_row+1;        
            exSheet.Cells[8 + l_row, 2].Value = dtDetail.Rows[l_row]["item_name"].ToString(); 
			exSheet.Cells[8 + l_row, 3].Value = dtDetail.Rows[l_row]["item_Code"].ToString(); 
			exSheet.Cells[8 + l_row, 4].Value = dtDetail.Rows[l_row]["kvp_usage_forecast"];			
			exSheet.Cells[8 + l_row, 5].Value = dtDetail.Rows[l_row]["daily_consumption"]; 			
			
			exSheet.Cells[8 + l_row, 6].Value = dtDetail.Rows[l_row]["begin_qty_1"]; 	
			exSheet.Cells[8 + l_row, 7].Value = dtDetail.Rows[l_row]["in_qty_1"]; 
			
			exSheet.Cells[8 + l_row, 8].Value = dtDetail.Rows[l_row]["in_trans_1"]; 
			exSheet.Cells[8 + l_row, 9].Value = dtDetail.Rows[l_row]["in_qc_1"]; 
			exSheet.Cells[8 + l_row,10].Value = dtDetail.Rows[l_row]["in_prod_1"]; 
			exSheet.Cells[8 + l_row,11].Value = dtDetail.Rows[l_row]["in_machine_1"]; 
			
			exSheet.Cells[8 + l_row,12].Value = dtDetail.Rows[l_row]["out_qty_1"];

			exSheet.Cells[8 + l_row,13].Value = dtDetail.Rows[l_row]["out_trans_1"]; 
			exSheet.Cells[8 + l_row,14].Value = dtDetail.Rows[l_row]["out_qc_1"]; 
			exSheet.Cells[8 + l_row,15].Value = dtDetail.Rows[l_row]["out_prod_1"]; 
			
			exSheet.Cells[8 + l_row,16].Value = dtDetail.Rows[l_row]["end_qty_1"]; 

			exSheet.Cells[8 + l_row,17].Value = dtDetail.Rows[l_row]["usable_days_1"]; 
			
			exSheet.Cells[8 + l_row,18].Value = dtDetail.Rows[l_row]["begin_qty_2"]; 
			exSheet.Cells[8 + l_row,19].Value = dtDetail.Rows[l_row]["in_qty_2"]; 
			exSheet.Cells[8 + l_row,20].Value = dtDetail.Rows[l_row]["out_qty_2"]; 
			exSheet.Cells[8 + l_row,21].Value = dtDetail.Rows[l_row]["end_qty_2"]; 

			exSheet.Cells[8 + l_row,22].Value = dtDetail.Rows[l_row]["usable_days_2"];
			
			exSheet.Cells[8 + l_row,23].Value = dtDetail.Rows[l_row]["begin_qty_3"]; 
			exSheet.Cells[8 + l_row,24].Value = dtDetail.Rows[l_row]["in_qty_3"]; 
			exSheet.Cells[8 + l_row,25].Value = dtDetail.Rows[l_row]["def_qty_3"]; 
			exSheet.Cells[8 + l_row,26].Value = dtDetail.Rows[l_row]["out_qty_3"]; 
			exSheet.Cells[8 + l_row,27].Value = dtDetail.Rows[l_row]["end_qty_3"]; 
			
			exSheet.Cells[8 + l_row,28].Value = dtDetail.Rows[l_row]["usable_days_3"];
			
			exSheet.Cells[8 + l_row,29].Value = dtDetail.Rows[l_row]["begin_qty_4"]; 
			exSheet.Cells[8 + l_row,30].Value = dtDetail.Rows[l_row]["in_qty_4"]; 
			exSheet.Cells[8 + l_row,31].Value = dtDetail.Rows[l_row]["out_qty_4"]; 
			exSheet.Cells[8 + l_row,32].Value = dtDetail.Rows[l_row]["end_qty_4"]; 

			exSheet.Cells[8 + l_row,33].Value = dtDetail.Rows[l_row]["usable_days_4"];			
			
			exSheet.Cells[8 + l_row,34].Value = dtDetail.Rows[l_row]["kvp_stock"]; 
			exSheet.Cells[8 + l_row,35].Value = dtDetail.Rows[l_row]["kvp_usable_days"]; 		

			exSheet.Cells[8 + l_row,36].Value = dtDetail.Rows[l_row]["total_qty"]; 
			exSheet.Cells[8 + l_row,37].Value = dtDetail.Rows[l_row]["total_usable_days"]; 
			
			exSheet.Cells[8 + l_row,38].Value = dtDetail.Rows[l_row]["company_qty"]; 
			exSheet.Cells[8 + l_row,39].Value = dtDetail.Rows[l_row]["company_usable_days"];

			exSheet.Cells[8 + l_row,43].Value = 7 ; 
			exSheet.Cells[8 + l_row,44].Value = 3 ; 
			exSheet.Cells[8 + l_row,45].Value = 10; 			
        }

        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }     

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
