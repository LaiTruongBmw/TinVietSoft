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

public partial class rpt_bisc00020_ST06 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString()); 
		//CtlLib.SetUser("SALE"); 
		
        string TemplateFile = "rpt_bisc00020_ST06.xls";
        string TempFile = "../../../../system/temp/rpt_bisc00020_ST06_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        
		string p_from_date 			= Request.QueryString["p_from_date"]; 
		string p_to_date 			= Request.QueryString["p_to_date"]; 
		string p_wh_type			= Request.QueryString["p_wh_type"]; 
		string p_tin_warehouse_pk 	= Request.QueryString["p_tin_warehouse_pk"]; 
		string p_item_group_pk 		= Request.QueryString["p_item_group_pk"];                      
        string p_item 				= Request.QueryString["p_item"];	
		
		string para = "'" + p_from_date + "','" + p_to_date + "','" + p_wh_type + "','" + p_tin_warehouse_pk + "','" + p_item_group_pk + "','" + p_item + "'";	
		
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00020_ST06_2", para);
        
		int k     = 0 ;	 
		int l_row = 12;
		
        for (int i = 0; i < dtDetail.Rows.Count; i=i+2 )
        {      
			if ( i+2 < dtDetail.Rows.Count)
			{
				exSheet.Range["A1:H12"].Copy("A"+(((k+1)*12)+1)+":H"+(((k+1)*12)+l_row),XlPasteType.xlPasteAll);
			 
				exSheet.Cells.Rows[((k+1)*12)+2].RowHeight  = 30;
				exSheet.Cells.Rows[((k+1)*12)+3].RowHeight  = 30;
				exSheet.Cells.Rows[((k+1)*12)+4].RowHeight  = 30;
				exSheet.Cells.Rows[((k+1)*12)+5].RowHeight  = 30;
				exSheet.Cells.Rows[((k+1)*12)+6].RowHeight  = 30;
				exSheet.Cells.Rows[((k+1)*12)+7].RowHeight  = 30;
				exSheet.Cells.Rows[((k+1)*12)+8].RowHeight  = 30;
				exSheet.Cells.Rows[((k+1)*12)+9].RowHeight  = 30;	
				exSheet.Cells.Rows[((k+1)*12)+10].RowHeight = 30;
				exSheet.Cells.Rows[((k+1)*12)+11].RowHeight = 30;
				exSheet.Cells.Rows[((k+1)*12)+12].RowHeight = 30;
			}
			
			if ( i < dtDetail.Rows.Count )
			{
				exSheet.Cells[ (k*12) + 2, 4].Value = i+1;
				exSheet.Cells[ (k*12) + 3, 2].Value = dtDetail.Rows[i]["grp_nm"];			
				exSheet.Cells[ (k*12) + 4, 3].Value = dtDetail.Rows[i]["stock_date"];
				exSheet.Cells[ (k*12) + 5, 3].Value = dtDetail.Rows[i]["item_code"];
				exSheet.Cells[ (k*12) + 6, 3].Value = dtDetail.Rows[i]["item_name"];
				exSheet.Cells[ (k*12) + 7, 3].Value = dtDetail.Rows[i]["wh_name"];
				exSheet.Cells[ (k*12) + 8, 3].Value = dtDetail.Rows[i]["uom"];
				exSheet.Cells[ (k*12) + 9, 3].Value = dtDetail.Rows[i]["end_qty"];
				exSheet.Cells[ (k*12) +10, 3].Value = dtDetail.Rows[i]["box_qty"];
			}
			
			if ( i+1 < dtDetail.Rows.Count )
			{
				exSheet.Cells[ (k*12) + 2, 8].Value = i+2;	
				exSheet.Cells[ (k*12) + 3, 6].Value = dtDetail.Rows[i+1]["grp_nm"];			
				exSheet.Cells[ (k*12) + 4, 7].Value = dtDetail.Rows[i+1]["stock_date"];
				exSheet.Cells[ (k*12) + 5, 7].Value = dtDetail.Rows[i+1]["item_code"];
				exSheet.Cells[ (k*12) + 6, 7].Value = dtDetail.Rows[i+1]["item_name"];
				exSheet.Cells[ (k*12) + 7, 7].Value = dtDetail.Rows[i+1]["wh_name"];
				exSheet.Cells[ (k*12) + 8, 7].Value = dtDetail.Rows[i+1]["uom"];
				exSheet.Cells[ (k*12) + 9, 7].Value = dtDetail.Rows[i+1]["end_qty"];
				exSheet.Cells[ (k*12) +10, 7].Value = dtDetail.Rows[i+1]["box_qty"];
			}
			
			k++;			
        }		    
                                          
        // end loop detail percent        
        if (File.Exists(TempFile))        	
        {                                
            File.Delete(TempFile);
        }

        // hide row firts 

        //range = exSheet.Range["A1"];
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

    public Bitmap ResizeImage(Bitmap d, int w, int h)
    {
        Bitmap q = new Bitmap(w, h);
        float f, g;
        f = (float)w / (float)d.Width;
        g = (float)h / (float)d.Height;
        for (int i = 0; i < w; i++)
        {
            for (int j = 0; j < h; j++)
            {
                Color c;
                c = d.GetPixel((int)(i / f), (int)(j / g));
                q.SetPixel(i, j, c);
            }
        }
        return q;
    }
}