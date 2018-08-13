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

public partial class rpt_bisc00160_grand : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string TemplateFile = "rpt_bisc00160_grand.xls";
        string TempFile = "../../../../system/temp/rpt_bisc00160_grand_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        string p_from_date = Request.QueryString["p_from_date"];
        string p_to_date = Request.QueryString["p_to_date"];
        string p_wh_type = Request.QueryString["p_wh_type"];
        string p_wh = Request.QueryString["p_wh"];
        string p_wh_name = Request.QueryString["p_wh_name"];
        string p_use_yn = Request.QueryString["p_use_yn"];
        string p_item_grp = Request.QueryString["p_item_grp"];
        string p_item = Request.QueryString["p_item"];
        string p_lang = Request.QueryString["p_lang"];

        string para = "'" + p_from_date +
                    "','" + p_to_date +
                    "','" + p_wh_type +
                    "','" + p_wh +
                    "','" + p_use_yn +
                    "','" + p_item_grp +
                    "','" + p_item +
                    "','" + p_lang + "'";

        DataTable dtInfo = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00160_2", "'" + Session["User_ID"].ToString() + "'");
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00160_1", para);

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

        string strFromDt = System.DateTime.ParseExact(p_from_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy");
        string strToDt = System.DateTime.ParseExact(p_to_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy");

        exSheet.Cells["A6"].Value = String.Format("W/H name: {0}", p_wh_name);
        exSheet.Cells["E6"].Value = String.Format("Date: {0} - {1}", strFromDt, strToDt);

        //insert row new of sheet
        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A9"].Rows.EntireRow.Insert();
        }

        //sum variable
        double sum_begin_qty = 0;
        double sum_begin_ref_qty = 0;
        double sum_in_qty = 0;
        double sum_in_ref_qty = 0;
        double sum_out_qty = 0;
        double sum_out_ref_qty = 0;
        double sum_end_qty = 0;
        double sum_end_ref_qty = 0;

        double tmp_begin_qty = 0;
        double tmp_begin_ref_qty = 0;
        double tmp_in_qty = 0;
        double tmp_in_ref_qty = 0;
        double tmp_out_qty = 0;
        double tmp_out_ref_qty = 0;
        double tmp_end_qty = 0;
        double tmp_end_ref_qty = 0;

        //Set data
        int l_pos = 8;
        for (int i = 0; i < dtDetail.Rows.Count; i++)
        {
            exSheet.Cells[l_pos + i, 1].Value = dtDetail.Rows[i]["grp_nm"];
            exSheet.Cells[l_pos + i, 2].Value = dtDetail.Rows[i]["item_code"];
            exSheet.Cells[l_pos + i, 3].Value = dtDetail.Rows[i]["item_name"];
            exSheet.Cells[l_pos + i, 4].Value = dtDetail.Rows[i]["uom"];
            exSheet.Cells[l_pos + i, 5].Value = dtDetail.Rows[i]["lot_no"];

            exSheet.Cells[l_pos + i, 6].Value = dtDetail.Rows[i]["begin_qty"];
            exSheet.Cells[l_pos + i, 7].Value = dtDetail.Rows[i]["begin_ref_qty"];

            exSheet.Cells[l_pos + i, 8].Value = dtDetail.Rows[i]["in_qty"];
            exSheet.Cells[l_pos + i, 9].Value = dtDetail.Rows[i]["in_ref_qty"];

            exSheet.Cells[l_pos + i, 10].Value = dtDetail.Rows[i]["out_qty"];
            exSheet.Cells[l_pos + i, 11].Value = dtDetail.Rows[i]["out_ref_qty"];

            exSheet.Cells[l_pos + i, 12].Value = dtDetail.Rows[i]["end_qty"];
            exSheet.Cells[l_pos + i, 13].Value = dtDetail.Rows[i]["end_ref_qty"];

            if (double.TryParse(dtDetail.Rows[i]["begin_qty"].ToString(), out tmp_begin_qty))
            {
                sum_begin_qty += tmp_begin_qty;
            }

            if (double.TryParse(dtDetail.Rows[i]["begin_ref_qty"].ToString(), out tmp_begin_ref_qty))
            {
                sum_begin_ref_qty += tmp_begin_ref_qty;
            }

            if (double.TryParse(dtDetail.Rows[i]["in_qty"].ToString(), out tmp_in_qty))
            {
                sum_in_qty += tmp_in_qty;
            }

            if (double.TryParse(dtDetail.Rows[i]["in_ref_qty"].ToString(), out tmp_in_ref_qty))
            {
                sum_in_ref_qty += tmp_in_ref_qty;
            }

            if (double.TryParse(dtDetail.Rows[i]["out_qty"].ToString(), out tmp_out_qty))
            {
                sum_out_qty += tmp_out_qty;
            }

            if (double.TryParse(dtDetail.Rows[i]["out_ref_qty"].ToString(), out tmp_out_ref_qty))
            {
                sum_out_ref_qty += tmp_out_ref_qty;
            }

            if (double.TryParse(dtDetail.Rows[i]["end_qty"].ToString(), out tmp_end_qty))
            {
                sum_end_qty += tmp_end_qty;
            }

            if (double.TryParse(dtDetail.Rows[i]["end_ref_qty"].ToString(), out tmp_end_ref_qty))
            {
                sum_end_ref_qty += tmp_end_ref_qty;
            }
        }

        exSheet.Cells[dtDetail.Rows.Count + l_pos, 6].Value = String.Format("{0:0,0}", sum_begin_qty);
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 7].Value = String.Format("{0:0,0}", sum_begin_ref_qty);
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 8].Value = String.Format("{0:0,0}", sum_in_qty);
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 9].Value = String.Format("{0:0,0}", sum_in_ref_qty);
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 10].Value = String.Format("{0:0,0}", sum_out_qty);
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 11].Value = String.Format("{0:0,0}", sum_out_ref_qty);
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 12].Value = String.Format("{0:0,0}", sum_end_qty);
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 13].Value = String.Format("{0:0,0}", sum_end_ref_qty);

        exSheet.Cells[dtDetail.Rows.Count + l_pos, 1, dtDetail.Rows.Count + l_pos, 13].Interior.Color = Color.FromArgb(255, 204, 153);
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 1, dtDetail.Rows.Count + l_pos, 13].RowHeight = 30;
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 1, dtDetail.Rows.Count + l_pos, 13].VerticalAlignment = XlVAlign.xlVAlignCenter;
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 1, dtDetail.Rows.Count + l_pos, 13].HorizontalAlignment = XlHAlign.xlHAlignRight;
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 1, dtDetail.Rows.Count + l_pos, 13].Font.Bold = true;
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 1, dtDetail.Rows.Count + l_pos, 13].Borders[XlBordersIndex.xlInsideAll].LineStyle = XlLineStyle.xlContinuous;
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 1, dtDetail.Rows.Count + l_pos, 13].Borders[XlBordersIndex.xlAround].LineStyle = XlLineStyle.xlContinuous;

        exSheet.Cells[dtDetail.Rows.Count + l_pos, 1, dtDetail.Rows.Count + l_pos, 5].Merge();
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 1, dtDetail.Rows.Count + l_pos, 5].HorizontalAlignment = XlHAlign.xlHAlignCenter;
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 1, dtDetail.Rows.Count + l_pos, 5].Value = "GRAND TOTAL";
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 1, dtDetail.Rows.Count + l_pos, 5].Font.Bold = false;

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
}
