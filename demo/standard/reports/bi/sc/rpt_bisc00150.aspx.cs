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

public partial class rpt_bisc00150 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string TemplateFile = "rpt_bisc00150_grand.xls";
        string TempFile = "../../../../system/temp/rpt_bisc00150_grand_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        string p_lang = Request.QueryString["p_lang"];
        string p_item_group = Request.QueryString["p_item_grp"];
        string p_item = Request.QueryString["p_item"];
        string p_wh_type = Request.QueryString["p_wh_type"];
        string p_wh = Request.QueryString["p_wh"];
        string p_wh_name = Request.QueryString["p_wh_name"];
        string p_use_yn = Request.QueryString["p_use_yn"];
        string p_rad_type = Request.QueryString["p_rad_type"];
        string p_dt_from = Request.QueryString["p_dt_from"];

        string para = "'" + p_lang + 
                    "','" + p_item_group +
                    "','" + p_item +
                    "','" + p_wh_type +
                    "','" + p_wh +
                    "','" + p_use_yn +
                    "','" + p_rad_type +
                    "','" + p_dt_from + "'";

        DataTable dtInfo = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00150_2", "'" + Session["User_ID"].ToString() + "'");
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00150_1", para);

        //Set Data In Master
        if (!string.IsNullOrEmpty(dtInfo.Rows[0]["pic"].ToString()))
        {
            exSheet.Cells[1, 1].Select();
            byte[] MyData = new byte[0];
            MyData = (byte[])dtInfo.Rows[0]["pic"];
            MemoryStream stream = new MemoryStream(MyData);

            Bitmap b = new Bitmap(stream);
            exSheet.Shapes.AddPicture(ResizeImage(b, 100, 55));
        }

        exSheet.Cells["C1"].Value = dtInfo.Rows[0]["partner_name"].ToString();

        exSheet.Cells["C2"].Value = dtInfo.Rows[0]["addr1"].ToString();

        exSheet.Cells["C3"].Value = "Tax code: " + dtInfo.Rows[0]["tax_code"].ToString();

        exSheet.Cells["I1"].Value = "Tell: " + dtInfo.Rows[0]["phone_no"].ToString();

        exSheet.Cells["I1"].Value = "Fax: " + dtInfo.Rows[0]["fax_no"].ToString();

        exSheet.Cells["I1"].Value = "Print date: " + DateTime.Now.ToString("dd/MM/yyyy hh:mm");

        exSheet.Cells["F5"].Value = System.DateTime.ParseExact(p_dt_from, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy");
        
        exSheet.Cells["A6"].Value = String.Format("W/H name: {0}", p_wh_name);

        exSheet.Cells["G6"].Value = String.Format("Date: {0}", System.DateTime.ParseExact(p_dt_from, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy").ToString());

        //insert row new of sheet
        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A9"].Rows.EntireRow.Insert();
        }

        //sum variable
        double sum_stock_qty = 0;
        double sum_qty1 = 0;
        double sum_qty2 = 0;
        double sum_qty3 = 0;
        double sum_qty4 = 0;
        double sum_qty5 = 0;

        double sum_stock_qty_sub = 0;
        double sum_qty1_sub = 0;
        double sum_qty2_sub = 0;
        double sum_qty3_sub = 0;
        double sum_qty4_sub = 0;
        double sum_qty5_sub = 0;

        double tmp_stock_qty = 0;
        double tmp_qty1 = 0;
        double tmp_qty2 = 0;
        double tmp_qty3 = 0;
        double tmp_qty4 = 0;
        double tmp_qty5 = 0;

        //Set data
        int l_pos = 7;
        for (int i = 0; i < dtDetail.Rows.Count; i++)
        {
            l_pos += 1;
            if (i > 0 && dtDetail.Rows[i]["tlg_it_itemgrp_pk"].ToString() != dtDetail.Rows[i - 1]["tlg_it_itemgrp_pk"].ToString())
            {
                exSheet.Cells[l_pos, 4].Value = String.Format("{0:0,0}", sum_stock_qty_sub);
                exSheet.Cells[l_pos, 7].Value = String.Format("{0:0,0}", sum_qty1_sub);
                exSheet.Cells[l_pos, 10].Value = String.Format("{0:0,0}", sum_qty2_sub);
                exSheet.Cells[l_pos, 13].Value = String.Format("{0:0,0}", sum_qty3_sub);
                exSheet.Cells[l_pos, 16].Value = String.Format("{0:0,0}", sum_qty4_sub);
                exSheet.Cells[l_pos, 19].Value = String.Format("{0:0,0}", sum_qty5_sub);

                FormatTotalRange(exSheet, l_pos, 1, l_pos, 20);
                exSheet.Cells[l_pos, 1, l_pos, 3].Merge();

                l_pos += 1;

                sum_stock_qty_sub = 0;
                sum_qty1_sub = 0;
                sum_qty2_sub = 0;
                sum_qty3_sub = 0;
                sum_qty4_sub = 0;
                sum_qty5_sub = 0;
            }

            exSheet.Cells[l_pos, 1].Value = dtDetail.Rows[i]["grp_nm"];
            exSheet.Cells[l_pos, 2].Value = dtDetail.Rows[i]["item_code"];
            exSheet.Cells[l_pos, 2].Font.Bold = true;
            exSheet.Cells[l_pos, 3].Value = dtDetail.Rows[i]["item_name"];

            exSheet.Cells[l_pos, 4].Value = dtDetail.Rows[i]["stock_qty"];
            exSheet.Cells[l_pos, 4].Font.Bold = true;
            exSheet.Cells[l_pos, 5].Value = dtDetail.Rows[i]["uom"];
            exSheet.Cells[l_pos, 6].Value = dtDetail.Rows[i]["trans_rate_1"];

            exSheet.Cells[l_pos, 7].Value = dtDetail.Rows[i]["qty1"];
            exSheet.Cells[l_pos, 7].Font.Bold = true;
            exSheet.Cells[l_pos, 8].Value = dtDetail.Rows[i]["trans_uom_1"];
            exSheet.Cells[l_pos, 9].Value = dtDetail.Rows[i]["trans_rate_2"];

            exSheet.Cells[l_pos, 10].Value = dtDetail.Rows[i]["qty2"];
            exSheet.Cells[l_pos, 10].Font.Bold = true;
            exSheet.Cells[l_pos, 11].Value = dtDetail.Rows[i]["trans_uom_2"];
            exSheet.Cells[l_pos, 12].Value = dtDetail.Rows[i]["trans_rate_3"];

            exSheet.Cells[l_pos, 13].Value = dtDetail.Rows[i]["qty3"];
            exSheet.Cells[l_pos, 13].Font.Bold = true;
            exSheet.Cells[l_pos, 14].Value = dtDetail.Rows[i]["trans_uom_3"];
            exSheet.Cells[l_pos, 15].Value = dtDetail.Rows[i]["trans_rate_4"];

            exSheet.Cells[l_pos, 16].Value = dtDetail.Rows[i]["qty4"];
            exSheet.Cells[l_pos, 16].Font.Bold = true;
            exSheet.Cells[l_pos, 17].Value = dtDetail.Rows[i]["trans_uom_4"];
            exSheet.Cells[l_pos, 18].Value = dtDetail.Rows[i]["trans_rate_5"];

            exSheet.Cells[l_pos, 19].Value = dtDetail.Rows[i]["qty5"];
            exSheet.Cells[l_pos, 19].Font.Bold = true;
            exSheet.Cells[l_pos, 20].Value = dtDetail.Rows[i]["trans_uom_5"];

            FormatNormalRange(exSheet, l_pos, 1, l_pos, 20);

            if (double.TryParse(dtDetail.Rows[i]["stock_qty"].ToString(), out tmp_stock_qty))
            {
                sum_stock_qty_sub += tmp_stock_qty;
                sum_stock_qty += tmp_stock_qty;
            }
            if (double.TryParse(dtDetail.Rows[i]["qty1"].ToString(), out tmp_qty1))
            {
                sum_qty1_sub += tmp_qty1;
                sum_qty1 += tmp_qty1;
            }
            if (double.TryParse(dtDetail.Rows[i]["qty2"].ToString(), out tmp_qty2))
            {
                sum_qty2_sub += tmp_qty2;
                sum_qty2 += tmp_qty2;
            }
            if (double.TryParse(dtDetail.Rows[i]["qty3"].ToString(), out tmp_qty3))
            {
                sum_qty3_sub += tmp_qty3;
                sum_qty3 += tmp_qty3;
            }
            if (double.TryParse(dtDetail.Rows[i]["qty4"].ToString(), out tmp_qty4))
            {
                sum_qty4_sub += tmp_qty4;
                sum_qty4 += tmp_qty4;
            }
            if (double.TryParse(dtDetail.Rows[i]["qty5"].ToString(), out tmp_qty5))
            {
                sum_qty5_sub += tmp_qty5;
                sum_qty5 += tmp_qty5;
            }
        }

        //The final sub total row
        l_pos += 1;
        exSheet.Cells[l_pos, 4].Value = String.Format("{0:0,0}", sum_stock_qty_sub);
        exSheet.Cells[l_pos, 7].Value = String.Format("{0:0,0}", sum_qty1_sub);
        exSheet.Cells[l_pos, 10].Value = String.Format("{0:0,0}", sum_qty2_sub);
        exSheet.Cells[l_pos, 13].Value = String.Format("{0:0,0}", sum_qty3_sub);
        exSheet.Cells[l_pos, 16].Value = String.Format("{0:0,0}", sum_qty4_sub);
        exSheet.Cells[l_pos, 19].Value = String.Format("{0:0,0}", sum_qty5_sub);

        FormatTotalRange(exSheet, l_pos, 1, l_pos, 20);
        exSheet.Cells[l_pos, 1, l_pos, 3].Merge();

        //The total row
        l_pos += 1;
        exSheet.Cells[l_pos, 4].Value = String.Format("{0:0,0}", sum_stock_qty);
        exSheet.Cells[l_pos, 7].Value = String.Format("{0:0,0}", sum_qty1);
        exSheet.Cells[l_pos, 10].Value = String.Format("{0:0,0}", sum_qty2);
        exSheet.Cells[l_pos, 13].Value = String.Format("{0:0,0}", sum_qty3);
        exSheet.Cells[l_pos, 16].Value = String.Format("{0:0,0}", sum_qty4);
        exSheet.Cells[l_pos, 19].Value = String.Format("{0:0,0}", sum_qty5);

        FormatTotalRange(exSheet, l_pos, 1, l_pos, 20);
        exSheet.Cells[l_pos, 1, l_pos, 3].Merge();
        exSheet.Cells[l_pos, 1, l_pos, 3].HorizontalAlignment = XlHAlign.xlHAlignCenter;
        exSheet.Cells[l_pos, 1, l_pos, 3].Value = "GRAND TOTAL";
        exSheet.Cells[l_pos, 1, l_pos, 3].Font.Bold = false;

        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }

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

    private void FormatTotalRange(IWorksheet exSheet, int row1, int col1, int row2, int col2)
    {
        exSheet.Cells[row1, col1, row2, col2].Interior.Color = Color.FromArgb(255, 204, 153);
        exSheet.Cells[row1, col1, row2, col2].RowHeight = 25;
        exSheet.Cells[row1, col1, row2, col2].VerticalAlignment = XlVAlign.xlVAlignCenter;
        exSheet.Cells[row1, col1, row2, col2].HorizontalAlignment = XlHAlign.xlHAlignRight;
        exSheet.Cells[row1, col1, row2, col2].Font.Bold = true;
        exSheet.Cells[row1, col1, row2, col2].Borders[XlBordersIndex.xlInsideAll].LineStyle = XlLineStyle.xlContinuous;
        exSheet.Cells[row1, col1, row2, col2].Borders[XlBordersIndex.xlAround].LineStyle = XlLineStyle.xlContinuous;
    }

    private void FormatNormalRange(IWorksheet exSheet, int row1, int col1, int row2, int col2)
    {
        exSheet.Cells[row1, col1, row2, col2].Interior.Color = Color.FromArgb(255, 255, 255);
        exSheet.Cells[row1, col1, row2, col2].RowHeight = 25;
        exSheet.Cells[row1, col1, row2, col2].VerticalAlignment = XlVAlign.xlVAlignCenter;
        exSheet.Cells[row1, col1, row2, col2].Borders[XlBordersIndex.xlInsideAll].LineStyle = XlLineStyle.xlContinuous;
        exSheet.Cells[row1, col1, row2, col2].Borders[XlBordersIndex.xlAround].LineStyle = XlLineStyle.xlContinuous;
    }
}
