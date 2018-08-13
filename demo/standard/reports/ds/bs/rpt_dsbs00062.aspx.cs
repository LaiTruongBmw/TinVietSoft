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

public partial class rpt_dsbs00062 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser("sale");
        string p_company = Request["p_company"];
        string p_dt_from = Request["p_dt_from"];
        string p_dt_to = Request["p_dt_to"];
        string p_item = Request["p_item"];
        string p_bill_to = Request["p_bill_to"];
        string p_type = Request["p_type"];

        string TemplateFile = "rpt_dsbs00062.xls";
        string TempFile = "../../../../system/temp/rpt_dsbs00062_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;


        string para = "'" + p_company + "','" + p_dt_from + "','" + p_dt_to + "','" + p_item + "','" + p_bill_to + "','" + p_type + "'";
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_dsbs00062", para);

        if (dtDetail.Rows.Count == 0)
        {
            Response.Write("No Data"); Response.End();
        }

        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A5"].Rows.EntireRow.Insert();//insert row new of sheet
        }

        int pos = 4;
        for (int l_row = 0; l_row < dtDetail.Rows.Count; l_row++)
        {
            exSheet.Cells[pos + l_row, 1].Value = dtDetail.Rows[l_row]["bill_to_name"].ToString();
            exSheet.Cells[pos + l_row, 2].Value = dtDetail.Rows[l_row]["order_dt"].ToString();
            exSheet.Cells[pos + l_row, 3].Value = dtDetail.Rows[l_row]["po_no"].ToString();
            exSheet.Cells[pos + l_row, 4].Value = dtDetail.Rows[l_row]["ord_qty"];
            exSheet.Cells[pos + l_row, 5].Value = dtDetail.Rows[l_row]["cancel_qty"];
            exSheet.Cells[pos + l_row, 6].Value = dtDetail.Rows[l_row]["out_qty"];
            exSheet.Cells[pos + l_row, 7].Value = dtDetail.Rows[l_row]["return_qty"];
            exSheet.Cells[pos + l_row, 8].Value = dtDetail.Rows[l_row]["bal_qty"];
            exSheet.Cells[pos + l_row, 9].Value = dtDetail.Rows[l_row]["deli"].ToString();
        }
        exSheet.Cells[dtDetail.Rows.Count + 4, 4].Value = "=SUM(D4:D" + (dtDetail.Rows.Count + 3) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 4, 5].Value = "=SUM(E4:E" + (dtDetail.Rows.Count + 3) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 4, 6].Value = "=SUM(F4:F" + (dtDetail.Rows.Count + 3) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 4, 7].Value = "=SUM(G4:G" + (dtDetail.Rows.Count + 3) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 4, 8].Value = "=SUM(H4:H" + (dtDetail.Rows.Count + 3) + ")";

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