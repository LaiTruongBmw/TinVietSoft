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

public partial class reports_rpt_bisc00130_ST01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
		//CtlLib.SetUser("SALE");

        string TemplateFile = "rpt_bisc00130_ST01.xls";
        string TempFile = "../../../../system/temp/rpt_bisc00130_ST01_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;
   
        //bind data to excel file
		string p_tr_inout_type  = Request.QueryString["p_tr_inout_type"];
        string p_tr_type        = Request.QueryString["p_tr_type"];
		string p_wh_type 		= Request.QueryString["p_wh_type"];
        string p_wh_pk  		= Request.QueryString["p_wh_pk"];
        string p_use_yn         = Request.QueryString["p_use_yn"];
		string p_from_date 		= Request.QueryString["p_from_date"];
		string p_to_date    	= Request.QueryString["p_to_date"];
		string p_item_lot_no    = Request.QueryString["p_item_lot_no"];
         
        string para = "'" + p_wh_pk + "','" + p_from_date + "','" + p_to_date + "'";	
		
        DataTable dtHeader = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00130_ST01_1"   , para);

        para = "'" + p_tr_inout_type + "','" + p_tr_type + "','" + p_wh_type + "','" + p_wh_pk + "','" + p_use_yn + "','" + p_from_date + "','" + p_to_date + "','" + p_item_lot_no + "'";	
	
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00130_ST01_2" , para);
		
        // MASTER   

		//--set-----DataBind--in---Master---
        if (!string.IsNullOrEmpty(dtHeader.Rows[0]["pic"].ToString()))
        {
            exSheet.Cells[1, 1].Select();
            byte[] MyData = new byte[0];
            MyData = (byte[])dtHeader.Rows[0]["pic"];
            MemoryStream stream = new MemoryStream(MyData);

            Bitmap b = new Bitmap(stream);
            exSheet.Shapes.AddPicture(ResizeImage(b, 90, 59));
        }
		
		exSheet.Cells["B1"].Value = dtHeader.Rows[0]["partner_name"];
		exSheet.Cells["B2"].Value = dtHeader.Rows[0]["addr1"];		
        exSheet.Cells["B3"].Value = "Tax Code: " + dtHeader.Rows[0]["tax_code"];
		
		exSheet.Cells["F1"].Value = "Tel: "      + dtHeader.Rows[0]["phone_no"];
		exSheet.Cells["F2"].Value = "Fax No: "   + dtHeader.Rows[0]["fax_no"]; 		
		exSheet.Cells["F3"].Value = "Print Date: " + DateTime.Now.ToString("dd/MM/yyyy hh:mm");
		
		exSheet.Cells["B7"].Value = dtHeader.Rows[0]["wh_name"];
		exSheet.Cells["F7"].Value = dtHeader.Rows[0]["t_date"];
        // END MASTER
		
		// INSERT ROWS
		 
		for (int l_addrow = 0; l_addrow < dtDetail.Rows.Count-1; l_addrow++)
        {
            exSheet.Range["A10"].Rows.EntireRow.Insert();//insert row new of sheet
        }
						
		// SET DATA
		int pos = 9 ;
		int i   = 0 ;
		 		
		Color color1 = ColorTranslator.FromHtml("0xCCFFFF");
		Color color2 = ColorTranslator.FromHtml("0xFFFFCC");
					
		for (i = 0; i < dtDetail.Rows.Count; i++)
        {		
            exSheet.Cells[pos + i, 1 ].Value = dtDetail.Rows[i]["trans_type"];
			exSheet.Cells[pos + i, 2 ].Value = dtDetail.Rows[i]["wh_name"];
			exSheet.Cells[pos + i, 3 ].Value = dtDetail.Rows[i]["tr_date_fm"];
			exSheet.Cells[pos + i, 4 ].Value = dtDetail.Rows[i]["slip_no"];
			exSheet.Cells[pos + i, 5 ].Value = dtDetail.Rows[i]["item_code"];
			exSheet.Cells[pos + i, 6 ].Value = dtDetail.Rows[i]["item_name"];
			exSheet.Cells[pos + i, 7 ].Value = dtDetail.Rows[i]["uom"];
			exSheet.Cells[pos + i, 8 ].Value = dtDetail.Rows[i]["lot_no"];	
			exSheet.Cells[pos + i, 9 ].Value = dtDetail.Rows[i]["tr_qty"];
			exSheet.Cells[pos + i, 10].Value = dtDetail.Rows[i]["tr_amount"];
			exSheet.Cells[pos + i, 11].Value = dtDetail.Rows[i]["tr_ccy"];	
			exSheet.Cells[pos + i, 12].Value = dtDetail.Rows[i]["cost_yn"];	
			exSheet.Cells[pos + i, 13].Value = dtDetail.Rows[i]["ref_wh"];	
			exSheet.Cells[pos + i, 14].Value = dtDetail.Rows[i]["line"];		
			//-------------
			 						 
        }
		
		int t = pos+i-1 ;
		
		exSheet.Cells[pos + i, 9 ].Value = "=sum(I10:I"+t+")";		
		exSheet.Cells[pos + i, 10].Value = "=sum(J10:J"+t+")";	
		
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