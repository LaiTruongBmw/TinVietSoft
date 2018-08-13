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

public partial class reports_rpt_bini00040 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
        string p_from_date = Request["p_from_date"];
        string p_to_date = Request["p_to_date"];
        string p_po_vendor = Request["p_po_vendor"];
        string p_item_group_pk = Request["p_item_group_pk"];
        string p_item = Request["p_item"];

        string TemplateFile = "rpt_bini00040.xls";
        string TempFile = "../../../../system/temp/rpt_bini00040_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file

        string para = "'" + p_from_date + "','" + p_to_date + "','" + p_po_vendor + "','" + p_item_group_pk + "','" + p_item + "'";
        DataTable dtInfo = CtlLib.TableReadOpenCursor("ST_LG_RPT_BINI00040_1", "'" + Session["User_ID"].ToString() + "'");
        DataTable dtDetail = CtlLib.TableReadOpenCursor("ST_LG_RPT_BINI00040", para);

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

        exSheet.Cells["S3"].Value = "Print date: " + DateTime.Now.ToString("dd/MM/yyyy hh:mm");

        exSheet.Cells["B1"].Value = dtInfo.Rows[0]["partner_name"].ToString();
        exSheet.Cells["B2"].Value = dtInfo.Rows[0]["addr1"].ToString();
        exSheet.Cells["S1"].Value = "Tel: " + dtInfo.Rows[0]["phone_no"].ToString();
        exSheet.Cells["S2"].Value = "Fax: " + dtInfo.Rows[0]["fax_no"].ToString();
        exSheet.Cells["B3"].Value = "Tax code: " + dtInfo.Rows[0]["tax_code"].ToString();
    ////end-set-----DataBind--in---Master---
    xxx:
        if (dtDetail.Rows.Count == 0)
        {
            return;
        }

        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A7"].Rows.EntireRow.Insert();//insert row new of sheet
        }

        for (int l_row = 1; l_row <= dtDetail.Rows.Count; l_row++)
        {
            for (int col = 0; col <= 18; col++)
            {
                if (col >= 8 && col <= 15)
                {
                    exSheet.Cells[5 + l_row, col + 1].Value = string.IsNullOrEmpty(dtDetail.Rows[l_row - 1][col].ToString()) ? 0 : Convert.ToInt32(dtDetail.Rows[l_row - 1][col]);
                }
                else
                {
                    exSheet.Cells[5 + l_row, col + 1].Value = dtDetail.Rows[l_row - 1][col].ToString();
                }
            }
        }
		
        exSheet.Cells["I" + (dtDetail.Rows.Count + 6)].Value = "=SUM(I6:I" + (dtDetail.Rows.Count + 5) + ")";
        exSheet.Cells["J" + (dtDetail.Rows.Count + 6)].Value = "=SUM(J6:J" + (dtDetail.Rows.Count + 5) + ")";
        exSheet.Cells["K" + (dtDetail.Rows.Count + 6)].Value = "=SUM(K6:K" + (dtDetail.Rows.Count + 5) + ")";
        exSheet.Cells["L" + (dtDetail.Rows.Count + 6)].Value = "=SUM(L6:L" + (dtDetail.Rows.Count + 5) + ")";
        exSheet.Cells["M" + (dtDetail.Rows.Count + 6)].Value = "=SUM(M6:M" + (dtDetail.Rows.Count + 5) + ")";
        exSheet.Cells["N" + (dtDetail.Rows.Count + 6)].Value = "=SUM(N6:N" + (dtDetail.Rows.Count + 5) + ")";
        exSheet.Cells["O" + (dtDetail.Rows.Count + 6)].Value = "=SUM(O6:O" + (dtDetail.Rows.Count + 5) + ")";
        exSheet.Cells["P" + (dtDetail.Rows.Count + 6)].Value = "=SUM(P6:P" + (dtDetail.Rows.Count + 5) + ")";

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