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

public partial class rpt_bini00040_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		CtlLib.SetUser(Session["APP_DBUSER"].ToString());
		

        string TemplateFile = "rpt_bini00040_1.xls";
        string TempFile = "../../../../system/temp/rpt_bini00040_1_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
		
		string p_wh_type 	= Request.QueryString["p_wh_type"];	
		string p_wh_pk 		= Request.QueryString["p_wh_pk"];
		string p_from_dt 	= Request.QueryString["p_from_dt"];	
		string p_to_dt 		= Request.QueryString["p_to_dt"];	
		string p_po_vendor 	= Request.QueryString["p_po_vendor"];	
		string p_itemgrp_pk = Request.QueryString["p_itemgrp_pk"];	
		string p_item 		= Request.QueryString["p_item"];		
		 
        string para ;
				
		DataTable dtInfo   = CtlLib.TableReadOpenCursor("st_lg_rpt_bini00040_FOSE01_1" , "'" + Session["User_ID"].ToString() + "'");	
		
		para = "'" + p_wh_type + "','" + p_wh_pk + "','" + p_from_dt + "','" + p_to_dt + "','" + p_po_vendor + "','" + p_itemgrp_pk + "','" + p_item + "'";	
		DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_bini00040_FOSE01_2" , para);	
	 
        // MASTER   
		
		//--set-----DataBind--in---Master---
        if (!string.IsNullOrEmpty(dtInfo.Rows[0]["pic"].ToString()))
        {
            exSheet.Cells[1, 1].Select();
            byte[] MyData = new byte[0];
            MyData = (byte[])dtInfo.Rows[0]["pic"];
            MemoryStream stream = new MemoryStream(MyData);

            Bitmap b = new Bitmap(stream);
            exSheet.Shapes.AddPicture(ResizeImage(b, 90, 59));
        }
		
		//-------------------------------		
		exSheet.Cells["C1"].Value = dtInfo.Rows[0]["partner_name"];
		exSheet.Cells["C2"].Value = dtInfo.Rows[0]["addr1"];
		exSheet.Cells["C3"].Value = "Tax Code: " + dtInfo.Rows[0]["tax_code"];
		
		exSheet.Cells["I1"].Value = "Tel: "      + dtInfo.Rows[0]["phone_no"];
		exSheet.Cells["I2"].Value = "Fax No: "   + dtInfo.Rows[0]["fax_no"]; 
		exSheet.Cells["I3"].Value = "Print Date: " + DateTime.Now.ToString("dd/MM/yyyy hh:mm");		        
		//-------------------------------	
		 
		// INSERT ROWS
		 
		for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A9"].Rows.EntireRow.Insert();//insert row new of sheet
        }
						
		// SET DATA
		int pos = 8 ;
		int i   = 0  ;		
		
		for (i = 0; i < dtDetail.Rows.Count; i++)
        {
			exSheet.Cells[pos + i, 1 ].Value = dtDetail.Rows[i]["wh_id"];
			
			exSheet.Cells[pos + i, 2 ].Value = dtDetail.Rows[i]["wh_name"];
			exSheet.Cells[pos + i, 3 ].Value = dtDetail.Rows[i]["partner_id"];
			exSheet.Cells[pos + i, 4 ].Value = dtDetail.Rows[i]["partner_name"];	
			exSheet.Cells[pos + i, 5 ].Value = dtDetail.Rows[i]["in_date"];
			exSheet.Cells[pos + i, 6 ].Value = dtDetail.Rows[i]["slip_no"];			
			exSheet.Cells[pos + i, 7 ].Value = dtDetail.Rows[i]["seq"];
			
			exSheet.Cells[pos + i, 8 ].Value = dtDetail.Rows[i]["ref_no"];
			exSheet.Cells[pos + i, 9 ].Value = dtDetail.Rows[i]["item_code"];
			exSheet.Cells[pos + i,10 ].Value = dtDetail.Rows[i]["item_name"]; 
			
			exSheet.Cells[pos + i,11 ].Value = dtDetail.Rows[i]["in_uom"];
			exSheet.Cells[pos + i,12 ].Value = dtDetail.Rows[i]["po_qty"];
			exSheet.Cells[pos + i,13 ].Value = dtDetail.Rows[i]["in_qty"];
			
			exSheet.Cells[pos + i,14 ].Value = dtDetail.Rows[i]["unit_price"];
			exSheet.Cells[pos + i,15 ].Value = dtDetail.Rows[i]["item_amount"];
			exSheet.Cells[pos + i,16 ].Value = dtDetail.Rows[i]["vat_amount"];
			
			exSheet.Cells[pos + i,17 ].Value = dtDetail.Rows[i]["total_amount"];
			exSheet.Cells[pos + i,18 ].Value = dtDetail.Rows[i]["CCY"];
			exSheet.Cells[pos + i,19 ].Value = dtDetail.Rows[i]["po_no"];
			exSheet.Cells[pos + i,20 ].Value = dtDetail.Rows[i]["po_partner"];
			exSheet.Cells[pos + i,21 ].Value = dtDetail.Rows[i]["description"];
			 
        }
		//---------
        
		int t = pos+i-1 ;
		
		exSheet.Cells[pos + i, 12].Value = "=sum(L8:L"+t+")";		
		exSheet.Cells[pos + i, 13].Value = "=sum(M8:M"+t+")";	
		exSheet.Cells[pos + i, 15].Value = "=sum(O8:O"+t+")";
		exSheet.Cells[pos + i, 16].Value = "=sum(P8:P"+t+")";
		exSheet.Cells[pos + i, 17].Value = "=sum(Q8:Q"+t+")";
		
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