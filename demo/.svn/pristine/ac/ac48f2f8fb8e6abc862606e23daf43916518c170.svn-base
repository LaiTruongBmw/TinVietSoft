using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using NativeExcel;

public partial class rpt_inio00100_0 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        CtlLib.SetUser("APP_DBUSER");

        
       
        string TemplateFile = "rpt_inio00100_0.xls";
        string TempFile = "../../../../system/temp/rpt_inio00100_0_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
		IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

		//Add worksheet
		IWorksheet exSheet = exBook.Worksheets[1];
		IRange range;

		string p_master_pk;
        
		p_master_pk = Request.QueryString["p_master_pk"];
         
        string para = "'" + p_master_pk + "'";	

		DataTable dtInfo   = CtlLib.TableReadOpenCursor("ST_LG_RPT_INIO00100_0_0", "'" + Session["User_ID"].ToString() + "'");			
		DataTable dtMaster = CtlLib.TableReadOpenCursor("ST_LG_RPT_INIO00100_0_1" , para);		
		DataTable dtDetail = CtlLib.TableReadOpenCursor("ST_LG_RPT_INIO00100_0_2" , para);		
		
		if (dtDetail.Rows.Count <= 0)
		{
			Response.Write("There is no data!");
			Response.End();
		}

			
         int l_row = dtDetail.Rows.Count;
         int l_col = dtDetail.Columns.Count;
		
		 double[] g_total = new double[l_col+1]; 
         int l_pos = 17;
		 int col_char = 3;
         for (int k = 0; k < l_col; k++)
         {
             g_total[k] = 0;
         }


         for (int i = 0; i < l_row - 1; i++)
         {

             exSheet.Range[l_pos + i + 1, l_col].Rows.EntireRow.Insert();//insert dong moi 
         }
        
		// MASTER   
	    
		exSheet.Cells["C1"].Value = dtInfo.Rows[0]["partner_name"].ToString();
        exSheet.Cells["G1"].Value = "Tel: " + dtInfo.Rows[0]["phone_no"].ToString();
        exSheet.Cells["C2"].Value = "Addr: " + dtInfo.Rows[0]["addr1"].ToString();
        exSheet.Cells["G2"].Value = "Fax: " + dtInfo.Rows[0]["fax_no"].ToString();
        exSheet.Cells["C3"].Value = "MST: " + dtInfo.Rows[0]["tax_code"].ToString();
        exSheet.Cells["G3"].Value = "Print Date: " + DateTime.Now.ToString("dd/MM/yyyy"); 
		
		//--set-----DataBind--in---Master---
        if (!string.IsNullOrEmpty(dtInfo.Rows[0]["pic"].ToString()))
        {
            exSheet.Cells["A1"].Select();
            byte[] MyData = new byte[0];
            MyData = (byte[])dtInfo.Rows[0]["pic"];
            MemoryStream stream = new MemoryStream(MyData);

            Bitmap b = new Bitmap(stream);
            exSheet.Shapes.AddPicture(ResizeImage(b, 90, 65));
        }
	
		if( dtMaster.Rows.Count >0)
		{
			
			exSheet.Cells["B6"].Value = "Ngày "+ dtMaster.Rows[0]["req_date"].ToString().Substring(6, 2) + " Tháng " + dtMaster.Rows[0]["req_date"].ToString().Substring(4, 2) + " Năm "+ dtMaster.Rows[0]["req_date"].ToString().Substring(0, 4) ;
			exSheet.Cells["B7"].Value = "Số :" + dtMaster.Rows[0]["slip_no"];
			
			exSheet.Cells["B9"].Value = "Người yêu cầu: " +dtMaster.Rows[0]["requester_name"];
			exSheet.Cells["B10"].Value = "Nhập tại kho: " +dtMaster.Rows[0]["wh_name"];
		
		
		}
		// SHOW DATA
         for (int i = 0; i < l_row; i++)
         {
			 
             for (int j = 0; j < l_col; j++)
             {
				 if (j > col_char  && j < l_col)
				 {
					exSheet.Cells[l_pos + i, j + 2].Value = double.Parse(dtDetail.Rows[i][j].ToString());	
					g_total[j] += double.Parse(dtDetail.Rows[i][j].ToString());					
				 }
				 else
				 {
					exSheet.Cells[l_pos + i, j +2].Value = dtDetail.Rows[i][j].ToString(); 
				 }
             }
	
			  	 			
         }
		 //grand total
		
		 for (int j = col_char; j < l_col; j++)
		 {					
			 exSheet.Cells[l_pos + l_row, j + 2].Value = g_total[j];
		 }	 
		 
		//exSheet.Cells[l_pos + l_row + 3, 4].Value = "- Tổng số tiền (viết bằng chữ): " + CommondLib.Num2VNText(l_total_sum,ccy) ;
		
	/*	
		total_sum = vat_amt + grant_total[11] ;		
		ccy  = dtDetail.Rows[0][13].ToString();
		total_amt= dtDetail.Rows[0][14].ToString();
		exSheet.Cells[6, 2].Value = "Ngày "+ dtDetail.Rows[0][11].ToString().Substring(6, 2) + " Tháng " + dtDetail.Rows[0][11].ToString().Substring(4, 2) + " Năm "+ dtDetail.Rows[0][11].ToString().Substring(0, 4) ;
		exSheet.Cells[3, 7].Value = "Print Date: " + DateTime.Now.ToString("dd/MM/yyyy");	
		exSheet.Cells[7, 3].Value = "Số: " + dtDetail.Rows[0][12].ToString();	
		exSheet.Cells[l_pos + l_row + 1, 12].Value = vat_amt ;	// tien vat
		exSheet.Cells[l_pos + l_row + 2, 12].Value = total_sum ;	// tong tien
		l_total_sum = ""+ total_sum;
		exSheet.Cells[l_pos + l_row + 4, 4].Value = "- Tổng số tiền (viết bằng chữ): " + CommondLib.Num2VNText(l_total_sum,ccy) ;		 
		exSheet.Cells[11, 3].Value ="Người giao hàng: "+ dtDetail.Rows[0][15].ToString();
		exSheet.Cells[13, 3].Value ="Nhập tại kho: " + dtDetail.Rows[0][16].ToString();
		exSheet.Cells[l_pos + l_row + 6, 11].Value = "Ngày "+ dtDetail.Rows[0][11].ToString().Substring(6, 2) + " Tháng " + dtDetail.Rows[0][11].ToString().Substring(4, 2) + " Năm "+ dtDetail.Rows[0][11].ToString().Substring(0, 4) ;
*/
		exBook.SaveAs(TempFile);
        //CtlLib.ExcelToPdf(TempFile);
        string pdfFilePath = TempFile.Replace(".xls", ".pdf");
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
        Response.WriteFile(TempFile);
        //Response.WriteFile(pdfFilePath);
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
