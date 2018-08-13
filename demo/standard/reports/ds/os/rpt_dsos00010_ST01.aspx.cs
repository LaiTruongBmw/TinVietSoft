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

public partial class rpt_dsos00010_ST01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		CtlLib.SetUser(Session["APP_DBUSER"].ToString());
		//CtlLib.SetUser("SALE");

        string TemplateFile = "rpt_dsos00010_ST01.xls";
        string TempFile = "../../../../system/temp/rpt_dsos00010_ST01_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
		 
        string p_tsa_saleorder_m_pk = Request.QueryString["p_tsa_saleorder_m_pk"];
		 
        
        string para = "'" + p_tsa_saleorder_m_pk + "'";
			
		DataTable dtSaleOrd = CtlLib.TableReadOpenCursor("st_lg_rpt_dsos00010_st01_1" , para); 
		DataTable dtDetail  = CtlLib.TableReadOpenCursor("st_lg_rpt_dsos00010_st01_2" , para);	
		
		DataTable dtInfo   = CtlLib.TableReadOpenCursor("st_lg_rpt_dsos00010_st01_3", "'" + Session["User_ID"].ToString() + "'");	
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
				
		//exSheet.Cells["C1"].Value = dtInfo.Rows[0]["partner_name"];
		//exSheet.Cells["C2"].Value = dtInfo.Rows[0]["addr1"];
		//exSheet.Cells["C3"].Value = "Tax Code: " + dtInfo.Rows[0]["tax_code"];
		
		//exSheet.Cells["G1"].Value = "Tel: "      + dtInfo.Rows[0]["phone_no"];
		//exSheet.Cells["G2"].Value = "Fax No: "   + dtInfo.Rows[0]["fax_no"]; 
        		
		exSheet.Cells["I4"].Value = "Print Date: " + DateTime.Now.ToString("dd/MM/yyyy hh:mm");		 
		 //SET DATA MASTER SALE ORDER
		 if(dtSaleOrd.Rows.Count >0)
		 {
			exSheet.Cells["C6"].Value = dtSaleOrd.Rows[0]["item_name"];
			exSheet.Cells["D9"].Value = dtSaleOrd.Rows[0]["unit_price"];
			exSheet.Cells["C10"].Value = dtSaleOrd.Rows[0]["ord_qty"];
		 }
		// INSERT ROWS
		 
		for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A15"].Rows.EntireRow.Insert();//insert row new of sheet
        }
						
		// SET DATA DETAIL
		int pos = 14,l_cnt=0 ;
		int i   = 0  ,l_total_amount=0;
		l_cnt=dtDetail.Rows.Count;
        		
		for (i = 0; i < dtDetail.Rows.Count; i++)
        {								
			exSheet.Cells[pos + i, 1 ].Value = i+1;
			
			exSheet.Cells[pos + i, 3 ].Value = dtDetail.Rows[i]["item_code"];
			exSheet.Cells[pos + i, 4 ].Value = dtDetail.Rows[i]["item_name"];
			exSheet.Cells[pos + i, 5 ].Value = dtDetail.Rows[i]["cons_qty"];
			exSheet.Cells[pos + i, 6 ].Value = dtDetail.Rows[i]["mat_uom"];
			exSheet.Cells[pos + i, 7 ].Value = dtDetail.Rows[i]["pur_price"];
			exSheet.Cells[pos + i, 8 ].Value = dtDetail.Rows[i]["loss_rate"]; 
			exSheet.Cells[pos + i, 9 ].Value = dtDetail.Rows[i]["amount"];
			if(dtDetail.Rows[i]["amount"].ToString() !="")
			{
				l_total_amount=l_total_amount+int.Parse(dtDetail.Rows[i]["amount"].ToString());
			}			
			
        }
		exSheet.Cells[pos + l_cnt, 9 ].Value = l_total_amount;
		exSheet.Cells["I9"].Value =l_total_amount;
		//---------
		 	 					
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