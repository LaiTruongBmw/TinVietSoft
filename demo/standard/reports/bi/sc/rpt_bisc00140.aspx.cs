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

public partial class rpt_bisc00140 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int C_GRP_NM = 1;
        int C_ITEM_CODE = 2;
        int C_ITEM_NAME = 3;
        int C_UOM = 4;
        int C_STOCK_QTY = 5;
        int C_WH_1 = 6;
        int C_WH_2 = 7;
        int C_WH_3 = 8;
        int C_WH_4 = 9;
        int C_WH_5 = 10;
        int C_WH_6 = 11;
        int C_WH_7 = 12;
        int C_WH_8 = 13;
        int C_WH_9 = 14;
        int C_WH_10 = 15;

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string TemplateFile = "rpt_bisc00140_grand.xls";
        string TempFile = "../../../../system/temp/rpt_bisc00140_grand_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        string p_lang = Request.QueryString["p_lang"];
        string p_item_grp = Request.QueryString["p_item_grp"];
        string p_item = Request.QueryString["p_item"];
        string p_rad_type = Request.QueryString["p_rad_type"];
        string p_dt_from = Request.QueryString["p_dt_from"];
        
        string p_wh_pk_1 = Request.QueryString["p_wh_pk_1"];
        string p_wh_pk_2 = Request.QueryString["p_wh_pk_2"];
        string p_wh_pk_3 = Request.QueryString["p_wh_pk_3"];
        string p_wh_pk_4 = Request.QueryString["p_wh_pk_4"];
        string p_wh_pk_5 = Request.QueryString["p_wh_pk_5"];
        string p_wh_pk_6 = Request.QueryString["p_wh_pk_6"];
        string p_wh_pk_7 = Request.QueryString["p_wh_pk_7"];
        string p_wh_pk_8 = Request.QueryString["p_wh_pk_8"];
        string p_wh_pk_9 = Request.QueryString["p_wh_pk_9"];
        string p_wh_pk_10 = Request.QueryString["p_wh_pk_10"];

        string p_storage = Request.QueryString["p_storage"];
        string p_wh_type = Request.QueryString["p_wh_type"];

        string paraHeader = "'" + p_storage +
                            "','" + p_wh_type + "'";

        string para = "'" + p_lang +
                    "','" + p_item_grp +
                    "','" + p_item +
                    "','" + p_rad_type +
                    "','" + p_dt_from +
                    "','" + p_wh_pk_1 +
                    "','" + p_wh_pk_2 +
                    "','" + p_wh_pk_3 +
                    "','" + p_wh_pk_4 +
                    "','" + p_wh_pk_5 +
                    "','" + p_wh_pk_6 +
                    "','" + p_wh_pk_7 +
                    "','" + p_wh_pk_8 +
                    "','" + p_wh_pk_9 +
                    "','" + p_wh_pk_10 + "'";

        DataTable dtInfo = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00140_2", "'" + Session["User_ID"].ToString() + "'");
        DataTable dtHeader = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00140", paraHeader);
        DataTable dtDetail = CtlLib.TableReadOpenCursor("lg_sel_bisc00140_1", para);

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

        string strFromDt = System.DateTime.ParseExact(p_dt_from, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy");

        exSheet.Cells["E6"].Value = String.Format("Date: {0}", strFromDt);

        //Set data for header
        if (dtHeader.Rows != null && dtHeader.Rows.Count > 0)
        {
            exSheet.Cells[7, C_WH_1].Value = dtHeader.Rows[0]["wh_01_nm"];
            exSheet.Cells[7, C_WH_2].Value = dtHeader.Rows[0]["wh_02_nm"];
            exSheet.Cells[7, C_WH_3].Value = dtHeader.Rows[0]["wh_03_nm"];
            exSheet.Cells[7, C_WH_4].Value = dtHeader.Rows[0]["wh_04_nm"];
            exSheet.Cells[7, C_WH_5].Value = dtHeader.Rows[0]["wh_05_nm"];
            exSheet.Cells[7, C_WH_6].Value = dtHeader.Rows[0]["wh_06_nm"];
            exSheet.Cells[7, C_WH_7].Value = dtHeader.Rows[0]["wh_07_nm"];
            exSheet.Cells[7, C_WH_8].Value = dtHeader.Rows[0]["wh_08_nm"];
            exSheet.Cells[7, C_WH_9].Value = dtHeader.Rows[0]["wh_09_nm"];
            exSheet.Cells[7, C_WH_10].Value = dtHeader.Rows[0]["wh_10_nm"];
        }

        //insert row new of sheet
        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A9"].Rows.EntireRow.Insert();
        }

        //sum variable
        double sum_qty1 = 0, sum_qty2 = 0, sum_qty3 = 0, sum_qty4 = 0, sum_qty5 = 0;
        double sum_qty6 = 0, sum_qty7 = 0, sum_qty8 = 0, sum_qty9 = 0, sum_qty10 = 0;

        double tmp_qty1 = 0, tmp_qty2 = 0, tmp_qty3 = 0, tmp_qty4 = 0, tmp_qty5 = 0;
        double tmp_qty6 = 0, tmp_qty7 = 0, tmp_qty8 = 0, tmp_qty9 = 0, tmp_qty10 = 0;

        double sum_qty1_sub = 0, sum_qty2_sub = 0, sum_qty3_sub = 0, sum_qty4_sub = 0, sum_qty5_sub = 0;
        double sum_qty6_sub = 0, sum_qty7_sub = 0, sum_qty8_sub = 0, sum_qty9_sub = 0, sum_qty10_sub = 0;

        //Set data
        int l_pos = 7;
        for (int i = 0; i < dtDetail.Rows.Count; i++)
        {
            l_pos += 1;
            if (i > 0 && dtDetail.Rows[i]["tlg_it_itemgrp_pk"].ToString() != dtDetail.Rows[i - 1]["tlg_it_itemgrp_pk"].ToString())
            {
                exSheet.Cells[l_pos, C_WH_1].Value = String.Format("{0:0,0}", sum_qty1_sub);
                exSheet.Cells[l_pos, C_WH_2].Value = String.Format("{0:0,0}", sum_qty2_sub);
                exSheet.Cells[l_pos, C_WH_3].Value = String.Format("{0:0,0}", sum_qty3_sub);
                exSheet.Cells[l_pos, C_WH_4].Value = String.Format("{0:0,0}", sum_qty4_sub);
                exSheet.Cells[l_pos, C_WH_5].Value = String.Format("{0:0,0}", sum_qty5_sub);
                exSheet.Cells[l_pos, C_WH_6].Value = String.Format("{0:0,0}", sum_qty6_sub);
                exSheet.Cells[l_pos, C_WH_7].Value = String.Format("{0:0,0}", sum_qty7_sub);
                exSheet.Cells[l_pos, C_WH_8].Value = String.Format("{0:0,0}", sum_qty8_sub);
                exSheet.Cells[l_pos, C_WH_9].Value = String.Format("{0:0,0}", sum_qty9_sub);
                exSheet.Cells[l_pos, C_WH_10].Value = String.Format("{0:0,0}", sum_qty10_sub);

                FormatTotalRange(exSheet, l_pos, C_GRP_NM, l_pos, C_WH_10);
                exSheet.Cells[l_pos, C_GRP_NM, l_pos, C_STOCK_QTY].Merge();

                l_pos += 1;

                sum_qty1_sub = 0; sum_qty2_sub = 0; sum_qty3_sub = 0; sum_qty4_sub = 0; sum_qty5_sub = 0;
                sum_qty6_sub = 0; sum_qty7_sub = 0; sum_qty8_sub = 0; sum_qty9_sub = 0; sum_qty10_sub = 0;
            }
            
            exSheet.Cells[l_pos, C_GRP_NM].Value = dtDetail.Rows[i]["grp_nm"];
            exSheet.Cells[l_pos, C_ITEM_CODE].Value = dtDetail.Rows[i]["item_code"];
            exSheet.Cells[l_pos, C_ITEM_NAME].Value = dtDetail.Rows[i]["item_name"];
            exSheet.Cells[l_pos, C_UOM].Value = dtDetail.Rows[i]["uom"];
            exSheet.Cells[l_pos, C_STOCK_QTY].Value = dtDetail.Rows[i]["stock_qty"];

            exSheet.Cells[l_pos, C_WH_1].Value = dtDetail.Rows[i]["qty1"];
            exSheet.Cells[l_pos, C_WH_2].Value = dtDetail.Rows[i]["qty2"];
            exSheet.Cells[l_pos, C_WH_3].Value = dtDetail.Rows[i]["qty3"];
            exSheet.Cells[l_pos, C_WH_4].Value = dtDetail.Rows[i]["qty4"];
            exSheet.Cells[l_pos, C_WH_5].Value = dtDetail.Rows[i]["qty5"];
            exSheet.Cells[l_pos, C_WH_6].Value = dtDetail.Rows[i]["qty6"];
            exSheet.Cells[l_pos, C_WH_7].Value = dtDetail.Rows[i]["qty7"];
            exSheet.Cells[l_pos, C_WH_8].Value = dtDetail.Rows[i]["qty8"];
            exSheet.Cells[l_pos, C_WH_9].Value = dtDetail.Rows[i]["qty9"];
            exSheet.Cells[l_pos, C_WH_10].Value = dtDetail.Rows[i]["qty10"];

            FormatNormalRange(exSheet, l_pos, C_GRP_NM, l_pos, C_WH_10);

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

            if (double.TryParse(dtDetail.Rows[i]["qty6"].ToString(), out tmp_qty6))
            {
                sum_qty6_sub += tmp_qty6;
                sum_qty6 += tmp_qty6;
            }

            if (double.TryParse(dtDetail.Rows[i]["qty7"].ToString(), out tmp_qty7))
            {
                sum_qty7_sub += tmp_qty7;
                sum_qty7 += tmp_qty7;
            }

            if (double.TryParse(dtDetail.Rows[i]["qty8"].ToString(), out tmp_qty8))
            {
                sum_qty8_sub += tmp_qty8;
                sum_qty8 += tmp_qty8;
            }

            if (double.TryParse(dtDetail.Rows[i]["qty9"].ToString(), out tmp_qty9))
            {
                sum_qty9_sub += tmp_qty9;
                sum_qty9 += tmp_qty9;
            }

            if (double.TryParse(dtDetail.Rows[i]["qty10"].ToString(), out tmp_qty10))
            {
                sum_qty10_sub += tmp_qty10;
                sum_qty10 += tmp_qty10;
            }
        }

        l_pos += 1;
        exSheet.Cells[l_pos, C_WH_1].Value = String.Format("{0:0,0}", sum_qty1_sub);
        exSheet.Cells[l_pos, C_WH_2].Value = String.Format("{0:0,0}", sum_qty2_sub);
        exSheet.Cells[l_pos, C_WH_3].Value = String.Format("{0:0,0}", sum_qty3_sub);
        exSheet.Cells[l_pos, C_WH_4].Value = String.Format("{0:0,0}", sum_qty4_sub);
        exSheet.Cells[l_pos, C_WH_5].Value = String.Format("{0:0,0}", sum_qty5_sub);
        exSheet.Cells[l_pos, C_WH_6].Value = String.Format("{0:0,0}", sum_qty6_sub);
        exSheet.Cells[l_pos, C_WH_7].Value = String.Format("{0:0,0}", sum_qty7_sub);
        exSheet.Cells[l_pos, C_WH_8].Value = String.Format("{0:0,0}", sum_qty8_sub);
        exSheet.Cells[l_pos, C_WH_9].Value = String.Format("{0:0,0}", sum_qty9_sub);
        exSheet.Cells[l_pos, C_WH_10].Value = String.Format("{0:0,0}", sum_qty10_sub);

        FormatTotalRange(exSheet, l_pos, C_GRP_NM, l_pos, C_WH_10);
        exSheet.Cells[l_pos, C_GRP_NM, l_pos, C_STOCK_QTY].Merge();

        l_pos += 1;
        exSheet.Cells[l_pos, C_WH_1].Value = String.Format("{0:0,0}", sum_qty1);
        exSheet.Cells[l_pos, C_WH_2].Value = String.Format("{0:0,0}", sum_qty2);
        exSheet.Cells[l_pos, C_WH_3].Value = String.Format("{0:0,0}", sum_qty3);
        exSheet.Cells[l_pos, C_WH_4].Value = String.Format("{0:0,0}", sum_qty4);
        exSheet.Cells[l_pos, C_WH_5].Value = String.Format("{0:0,0}", sum_qty5);
        exSheet.Cells[l_pos, C_WH_6].Value = String.Format("{0:0,0}", sum_qty6);
        exSheet.Cells[l_pos, C_WH_7].Value = String.Format("{0:0,0}", sum_qty7);
        exSheet.Cells[l_pos, C_WH_8].Value = String.Format("{0:0,0}", sum_qty8);
        exSheet.Cells[l_pos, C_WH_9].Value = String.Format("{0:0,0}", sum_qty9);
        exSheet.Cells[l_pos, C_WH_10].Value = String.Format("{0:0,0}", sum_qty10);

        FormatTotalRange(exSheet, l_pos, C_GRP_NM, l_pos, C_WH_10);

        exSheet.Cells[l_pos, C_GRP_NM, l_pos, C_STOCK_QTY].Merge();
        exSheet.Cells[l_pos, C_GRP_NM, l_pos, C_STOCK_QTY].HorizontalAlignment = XlHAlign.xlHAlignCenter;
        exSheet.Cells[l_pos, C_GRP_NM, l_pos, C_STOCK_QTY].Value = "GRAND TOTAL";
        exSheet.Cells[l_pos, C_GRP_NM, l_pos, C_STOCK_QTY].Font.Bold = false;

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
