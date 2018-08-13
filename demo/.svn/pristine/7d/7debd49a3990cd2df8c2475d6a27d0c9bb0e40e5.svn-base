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

public partial class rpt_dsbs00200_YJ02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
		//CtlLib.SetUser("SALE");

        string TemplateFile = "rpt_dsbs00200_YJ02.xls";
        string TempFile = "../../../../system/temp/rpt_dsbs00200_YJ02_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;
   
        //bind data to excel file
        string p_parent_pk     = Request.QueryString["p_parent_pk"];
		string para = "'" + p_parent_pk + "'";
        DataTable dt = CtlLib.TableReadOpenCursor("st_lg_rpt_dsbs00200_YJ02_2" , para);		
		
        	
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_dsbs00200_YJ02_3" , para);
				
		
		if( dt.Rows.Count >0)
		{
			exSheet.Cells["B11"].Value = dt.Rows[0]["po_date"];
			exSheet.Cells["B16"].Value = dt.Rows[0]["dest_nation"];
			exSheet.Cells["B17"].Value = dt.Rows[0]["price_type"]; 
			exSheet.Cells["B18"].Value = dt.Rows[0]["PAY_TERM"]; 
			exSheet.Cells["B19"].Value = dt.Rows[0]["PACKING_MARKS"]; 
			exSheet.Cells["B20"].Value = dt.Rows[0]["PRODUCTION_MARKS"]; //Finish:
		}
		 // INSERT ROWS
		for (int l_addrow = 0; l_addrow < dtDetail.Rows.Count-1; l_addrow++)
        {
            exSheet.Range["A15"].Rows.EntireRow.Insert();//insert row new of sheet
        }
						
		// SET DATA
		int pos = 14 ;
		int i   = 0 ;
		 		
		//Color color1 = ColorTranslator.FromHtml("0xCCFFFF");
		//Color color2 = ColorTranslator.FromHtml("0xFFFFCC");
					
		for (i = 0; i < dtDetail.Rows.Count; i++)
        {	
            exSheet.Cells[pos + i, 1  ].Value = dtDetail.Rows[i]["ref_no"];
			exSheet.Cells[pos + i, 2  ].Value = dtDetail.Rows[i]["spec01_nm"];
			exSheet.Cells[pos + i, 3  ].Value = dtDetail.Rows[i]["spec02_nm"];
			exSheet.Cells[pos + i, 4  ].Value = dtDetail.Rows[i]["ord_qty"];
			exSheet.Cells[pos + i, 5  ].Value = dtDetail.Rows[i]["unit_price"];
			exSheet.Cells[pos + i, 6  ].Value = dtDetail.Rows[i]["item_amount"];
			exSheet.Cells[pos + i, 7  ].Value = dtDetail.Rows[i]["item_etd"];
			//-------------
			 						 
        }
		
		int t = pos+i-1 ;
		exSheet.Cells[pos + i, 4].Value = "=sum(D14:D"+t+")";
		exSheet.Cells[pos + i, 6].Value = "=sum(F14:F"+t+")";	
		
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