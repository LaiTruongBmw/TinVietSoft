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

public partial class rpt_dscd00070_kb01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //CtlLib.SetUser(Session["APP_DBUSER"].ToString());
		CtlLib.SetUser("SALE");

        string TemplateFile = "rpt_dscd00070_kb01.xls";
        string TempFile = "../../../../system/temp/rpt_dscd00070_kb01_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
		 
        string     master_pk = Request["master_pk"];
         
        string para = "'" + master_pk + "'";		
		DataTable dt = CtlLib.TableReadOpenCursor("st_lg_rpt_dscd00070_kb01" , para);		
		DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_dscd00070_kb01_1" , para);		  
	//	DataTable dtInfo   = CtlLib.TableReadOpenCursor("st_lg_rpt_epbp00010_st01_2", "'" + Session["User_ID"].ToString() + "'");	
        // MASTER   

       
		if( dt.Rows.Count >0)
		{
			 exSheet.Cells["h6"].Value =dt.Rows[0]["slip_no"];
			 exSheet.Cells["h7"].Value = "No/dr ";//+dt.Rows[0]["req_date"];
			 exSheet.Cells["h8"].Value = "Co/cr";//;+dt.Rows[0]["dept_name"];
			 exSheet.Cells["d8"].Value =dt.Rows[0]["dd"];
			 exSheet.Cells["e8"].Value =dt.Rows[0]["mm"];
			 exSheet.Cells["f8"].Value =dt.Rows[0]["yy"];
			 exSheet.Cells["d9"].Value =dt.Rows[0]["partner_name"];
			exSheet.Cells["d10"].Value =dt.Rows[0]["addr"];
			exSheet.Cells["d11"].Value =dt.Rows[0]["TAX_CODE"];
			 exSheet.Cells["d12"].Value =dt.Rows[0]["PHONE_NO"];
			 exSheet.Cells["f12"].Value =dt.Rows[0]["FAX_NO"];
			 exSheet.Cells["d16"].Value =dt.Rows[0]["description"];
			 exSheet.Cells["e13"].Value =dt.Rows[0]["deli_loc_pk"];
			 exSheet.Cells["e14"].Value =dt.Rows[0]["full_name"];
			 exSheet.Cells["h14"].Value =dt.Rows[0]["tel"];
			
		}
		
		// INSERT ROWS
		 
		//for (int l_addrow = 0; l_addrow < dtDetail.Rows.Count-1; l_addrow++)
		//{
         //  exSheet.Range["A17"].Rows.EntireRow.Insert();//insert row new of sheet
		//}
						
		// SET DATA
		int pos = 19;
		int i   = 0  ;		  			
		
		
					
		for (i = 0; i < dtDetail.Rows.Count; i++)
        {									
			 exSheet.Range[pos + i, 4,pos + i, 5].Merge();
			 exSheet.Cells[pos + i, 2 ].Value = i+1;
			exSheet.Cells[pos + i, 3 ].Value = dtDetail.Rows[i]["out_item_code"];
			 exSheet.Cells[pos + i, 4 ].Value = dtDetail.Rows[i]["out_item_name"];
			 exSheet.Cells[pos + i, 6 ].Value = dtDetail.Rows[i]["lot_no"];
			exSheet.Cells[pos + i, 7 ].Value = dtDetail.Rows[i]["out_qty"];
			// exSheet.Cells[pos + i, 8 ].Value = dtDetail.Rows[i]["in_uom"]; 			
			 exSheet.Cells[pos + i, 9 ].Value = dtDetail.Rows[i]["description"]; 			
        }
		// exSheet.Cells["i30"].Value =dtDetail.Rows[0]["item_amount"];
		// exSheet.Cells["i31"].Value =dtDetail.Rows[0]["vat_amount"];
		// exSheet.Cells["i32"].Value =dtDetail.Rows[0]["total_amount"];
		//---------
		//exSheet.Cells[pos + i, 6 ].Value = "=sum(F10:F"+(pos+i-1)+")";
		//exSheet.Cells[pos + i, 7].Value = "=sum(G10:G"+(pos+i-1)+")";			 					
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