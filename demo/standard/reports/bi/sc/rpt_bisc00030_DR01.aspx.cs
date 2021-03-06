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

public partial class rpt_bisc00030_DR01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
		
        string l_from_date = Request["p_from_date"];
        string l_to_date   = Request["p_to_date"];        

        string TemplateFile = "rpt_bisc00030_DR01.xls";
		
        string TempFile = "../../../../system/temp/rpt_bisc00030_DR01_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        string l_parameter = "'" + l_from_date + "','" + l_to_date + "'";
		
		DataTable dtMaster = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00030_DR01_1", l_parameter);
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00030_DR01_2", l_parameter);
		
        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A7"].Rows.EntireRow.Insert(); 

        }
		//-----------------------
		if ( dtMaster.Rows.Count > 0 )
		{
			exSheet.Cells["C3"].Value = dtMaster.Rows[0]["doc_date"].ToString();  
		}		
		//-----------------------

        for (int l_row = 0; l_row < dtDetail.Rows.Count; l_row++)
        {   
			exSheet.Cells[6 + l_row, 1].Value = l_row+1;        
            exSheet.Cells[6 + l_row, 2].Value = dtDetail.Rows[l_row]["item_code"].ToString(); 
			exSheet.Cells[6 + l_row, 3].Value = dtDetail.Rows[l_row]["item_name"].ToString(); 		 
			exSheet.Cells[6 + l_row, 4].Value = dtDetail.Rows[l_row]["uom"].ToString(); 
			exSheet.Cells[6 + l_row, 5].Value = dtDetail.Rows[l_row]["lot_no"].ToString(); 
			exSheet.Cells[6 + l_row, 6].Value = dtDetail.Rows[l_row]["begin_qty"]; 
			exSheet.Cells[6 + l_row, 7].Value = dtDetail.Rows[l_row]["in_qty"]; 	
			exSheet.Cells[6 + l_row, 8].Value = dtDetail.Rows[l_row]["or_in_qty"]; 
			exSheet.Cells[6 + l_row, 9].Value = dtDetail.Rows[l_row]["out_qty"]; 
			exSheet.Cells[6 + l_row,10].Value = dtDetail.Rows[l_row]["end_qty"]; 
			exSheet.Cells[6 + l_row,11].Value = dtDetail.Rows[l_row]["ng_begin_qty"]; 
			exSheet.Cells[6 + l_row,12].Value = dtDetail.Rows[l_row]["ng_in_qty"]; 
			exSheet.Cells[6 + l_row,13].Value = dtDetail.Rows[l_row]["ng_out_qty"]; 
			exSheet.Cells[6 + l_row,14].Value = dtDetail.Rows[l_row]["ng_end_qty"]; 				 			
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
