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

public partial class reports_rpt_dsbs00300 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
		
        string p_from_date  = Request["p_from_date"];
        string p_to_date    = Request["p_to_date"];
		string p_wh_type    = Request["p_wh_type"];
        string p_wh_pk      = Request["p_wh_pk"];
        string p_cust       = Request["p_cust"];
        

        string TemplateFile = "rpt_dsbs00300.xls";
        string TempFile = "../../../../system/temp/rpt_dsbs00300_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file

        string para = "'" + p_from_date + "','" + p_to_date + "','" + p_wh_type + "','" + p_wh_pk + "','" + p_cust + "'";
		
        DataTable dtInfo = CtlLib.TableReadOpenCursor("st_lg_RPT_dsbs00300_1", "'" + Session["User_ID"].ToString() + "','" + p_from_date + "','" + p_to_date + "','" + p_wh_pk + "'");
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_RPT_dsbs00300", para);

        if (dtInfo.Rows.Count == 0) goto xxx;
        //--set-----DataBind--in---Master---
        if (!string.IsNullOrEmpty(dtInfo.Rows[0]["pic"].ToString()))
        {
            exSheet.Cells["A1"].Select();
            byte[] MyData = new byte[0];
            MyData = (byte[])dtInfo.Rows[0]["pic"];
            MemoryStream stream = new MemoryStream(MyData);

            Bitmap b = new Bitmap(stream);
            exSheet.Shapes.AddPicture(ResizeImage(b, 131, 71));
        }
		
		exSheet.Cells["J1"].Value = "Tel: " + dtInfo.Rows[0]["phone_no"].ToString();
		exSheet.Cells["J2"].Value = "Fax: " + dtInfo.Rows[0]["fax_no"].ToString();
        exSheet.Cells["J3"].Value = "Print date: " + DateTime.Now.ToString("dd/MM/yyyy hh:mm");

        exSheet.Cells["C1"].Value = dtInfo.Rows[0]["partner_name"].ToString();
        exSheet.Cells["C2"].Value = dtInfo.Rows[0]["addr1"].ToString();               
        exSheet.Cells["C3"].Value = "Tax code: " + dtInfo.Rows[0]["tax_code"].ToString();
		
		exSheet.Cells["J7"].Value = dtInfo.Rows[0]["t_date"].ToString();
		exSheet.Cells["C7"].Value = dtInfo.Rows[0]["warehouse"].ToString();
    ////end-set-----DataBind--in---Master---
    xxx:
        if (dtDetail.Rows.Count == 0)
        {
            return;
        }

        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A10"].Rows.EntireRow.Insert();//insert row new of sheet
        }

        for (int l_row = 1; l_row <= dtDetail.Rows.Count; l_row++)
        {                        
			exSheet.Cells[8 + l_row, 1 ].Value = dtDetail.Rows[l_row - 1]["wh_id"].ToString();   
			exSheet.Cells[8 + l_row, 2 ].Value = dtDetail.Rows[l_row - 1]["wh_name"].ToString(); 
			exSheet.Cells[8 + l_row, 3 ].Value = dtDetail.Rows[l_row - 1]["OUT_DATE"].ToString(); 
			exSheet.Cells[8 + l_row, 4 ].Value = dtDetail.Rows[l_row - 1]["partner_id"].ToString(); 			
			exSheet.Cells[8 + l_row, 5 ].Value = dtDetail.Rows[l_row - 1]["partner_name"].ToString(); 			
			exSheet.Cells[8 + l_row, 6 ].Value = dtDetail.Rows[l_row - 1]["slip_no"].ToString(); 			
			exSheet.Cells[8 + l_row, 7 ].Value = dtDetail.Rows[l_row - 1]["ccy_unit"].ToString(); 			
			exSheet.Cells[8 + l_row, 8 ].Value = dtDetail.Rows[l_row - 1]["item_amount"]; 			
			exSheet.Cells[8 + l_row, 9 ].Value = dtDetail.Rows[l_row - 1]["tax_amount"]; 	
			exSheet.Cells[8 + l_row, 10].Value = dtDetail.Rows[l_row - 1]["total_amount"]; 					
			exSheet.Cells[8 + l_row, 11].Value = dtDetail.Rows[l_row - 1]["INVOICE_NO"].ToString(); 
			exSheet.Cells[8 + l_row, 12].Value = dtDetail.Rows[l_row - 1]["invoice_date"].ToString(); 			
			exSheet.Cells[8 + l_row, 13].Value = dtDetail.Rows[l_row - 1]["invoice_net_Tr_amt"]; 			
 			exSheet.Cells[8 + l_row, 14].Value = dtDetail.Rows[l_row - 1]["invoice_vat_tax_amt"]; 			
			exSheet.Cells[8 + l_row, 15].Value = dtDetail.Rows[l_row - 1]["invoice_total_amount"];
        }
		
        exSheet.Cells[9 + dtDetail.Rows.Count, 8 ].Value = "=SUM(H9:H" + (dtDetail.Rows.Count + 8) + ")";        
		exSheet.Cells[9 + dtDetail.Rows.Count, 9 ].Value = "=SUM(I9:I" + (dtDetail.Rows.Count + 8) + ")";        
		exSheet.Cells[9 + dtDetail.Rows.Count, 10].Value = "=SUM(J9:J" + (dtDetail.Rows.Count + 8) + ")";        
		
		exSheet.Cells[9 + dtDetail.Rows.Count, 13].Value = "=SUM(M9:M" + (dtDetail.Rows.Count + 8) + ")";        
		exSheet.Cells[9 + dtDetail.Rows.Count, 14].Value = "=SUM(N9:N" + (dtDetail.Rows.Count + 8) + ")";        
		exSheet.Cells[9 + dtDetail.Rows.Count, 15].Value = "=SUM(O9:O" + (dtDetail.Rows.Count + 8) + ")";   
        // end loop detail not percent

        // end loop detail percent
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