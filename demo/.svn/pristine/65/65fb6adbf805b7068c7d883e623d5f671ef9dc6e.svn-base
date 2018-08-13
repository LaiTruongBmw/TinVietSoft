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

public partial class rpt_dscd00030_ST02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser("sale");

        string TemplateFile = "rpt_dscd00030_ST02.xls";
        string TempFile = "../../../../system/temp/rpt_dscd00030_ST02_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);
        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);
        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];
        IRange range;
        //bind data to excel file
        string p_from_date 		= Request["p_from_date"];
        string p_to_date 		= Request["p_to_date"];
        string p_order_type 	= Request["p_order_type"];
        string p_po_vendor	 	= Request["p_po_vendor"];
        string p_item_group_pk	= Request["p_item_group_pk"];
        string p_item 			= Request["p_item"];
        string p_type 			= Request["p_type"];
        string p_inout_type 	= Request["p_inout_type"];
        string p_wh_type 		= Request["p_wh_type"];
        string p_wh_pk 			= Request["p_wh_pk"];

        string para = "'" + p_from_date + "','" + p_to_date + "','" + Session["User_ID"].ToString() + "'";
        DataTable dtMaster = CtlLib.TableReadOpenCursor("st_lg_rpt_dscd00030_ST02_1", para);

        if (dtMaster.Rows.Count > 0)
        {
            exSheet.Cells["B2"].Value = dtMaster.Rows[0]["partner_name"];
            exSheet.Cells["H2"].Value = "Tel: " + dtMaster.Rows[0]["phone_no"];

            exSheet.Cells["B3"].Value = dtMaster.Rows[0]["addr1"];
            exSheet.Cells["H3"].Value = "Fax: " + dtMaster.Rows[0]["fax_no"];

            exSheet.Cells["B4"].Value = "Tax No: " + dtMaster.Rows[0]["tax_code"];
            exSheet.Cells["H4"].Value = "Print Date: " + DateTime.Now.ToString("dd/MM/yyyy HH:mm");
        }
		
        exSheet.Cells["A7"].Value = System.DateTime.ParseExact(p_from_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy") + " ~ " + System.DateTime.ParseExact(p_to_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy");

        para = "'" + p_from_date + "','" + p_to_date + "','" + p_order_type + "','" + p_po_vendor + "','" + p_item_group_pk + "','" + p_item + "','" + p_type + "','" + p_inout_type + "','" + p_wh_type + "','" + p_wh_pk + "'";
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_RPT_DSCD00030_ST02_2", para);

        for (int r = 0; r < dtDetail.Rows.Count; r++)
        {
            if (r < dtDetail.Rows.Count - 2)
            {
                exSheet.Range["A" + (10 + r)].Rows.EntireRow.Insert();
            }
            for (int c = 0; c < dtDetail.Columns.Count; c++)
            {
                exSheet.Cells[9 + r, c + 1].Value = dtDetail.Rows[r][c];
            }
        }
        // end loop detail not percent
        if (dtDetail.Rows.Count > 0)
        {
            exSheet.Cells["F" + (dtDetail.Rows.Count + 9)].Value = "=SUM(F9:F" + (dtDetail.Rows.Count + 8) + ")";
			exSheet.Cells["G" + (dtDetail.Rows.Count + 9)].Value = "=SUM(G9:G" + (dtDetail.Rows.Count + 8) + ")";
			exSheet.Cells["H" + (dtDetail.Rows.Count + 9)].Value = "=SUM(H9:H" + (dtDetail.Rows.Count + 8) + ")";
        }
        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }


        // hide row firts 

        range = exSheet.Range["A1"];
        // hide row A5 
        range.Rows.Hidden = true;

        // font bold header
        /*range = exSheet.Range["A1:AC1"];
        range.Rows[4].Font.Bold = true;*/

        exBook.SaveAs(TempFile);
        //CtlLib.ExcelToPdf(TempFile);
        //string pdfFilePath = TempFile.Replace(".xls", ".pdf");
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