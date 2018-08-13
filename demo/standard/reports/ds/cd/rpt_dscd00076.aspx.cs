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

public partial class reports_rpt_dscd00076 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser("sale");
        string l_pk = Request["master_pk"];

        string TemplateFile = "rpt_dscd00076.xls";
        string TempFile = "../../../../system/temp/rpt_dscd00076_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file

        string para = "'" + l_pk + "'";
        DataTable dtInfo = CtlLib.TableReadOpenCursor("st_lg_RPT_DSCD00075_2", "'" + Session["User_ID"].ToString() + "'");
        dtInfo.Rows.Add();
        DataTable dtMaster = CtlLib.TableReadOpenCursor("st_lg_RPT_DSCD00075", para);
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_RPT_DSCD00075_1", para);

        //--set-----DataBind--in---Master---
        if (!string.IsNullOrEmpty(dtInfo.Rows[0]["pic"].ToString()))
        {
            exSheet.Cells[2, 2].Select();
            byte[] MyData = new byte[0];
            MyData = (byte[])dtInfo.Rows[0]["pic"];
            MemoryStream stream = new MemoryStream(MyData);

            Bitmap b = new Bitmap(stream);
            exSheet.Shapes.AddPicture(ResizeImage(b, 143, 84));
        }

        exSheet.Cells["P3"].Value = "Print date: " + DateTime.Now.ToString("dd/MM/yyyy hh:mm");

        exSheet.Cells["E5"].Value = dtInfo.Rows[0]["partner_name"].ToString();
        exSheet.Cells["M5"].Value = dtMaster.Rows[0]["slip_no"].ToString();

        exSheet.Cells["E6"].Value = dtInfo.Rows[0]["addr1"].ToString();
        exSheet.Cells["M6"].Value = dtMaster.Rows[0]["out_date"].ToString();

        exSheet.Cells["E7"].Value = dtInfo.Rows[0]["tax_code"].ToString();
        exSheet.Cells["M7"].Value = dtMaster.Rows[0]["description"].ToString();

        exSheet.Cells["E8"].Value = dtInfo.Rows[0]["phone_no"].ToString();
        //---------
        exSheet.Cells["E10"].Value = dtMaster.Rows[0]["bill_partner_name"].ToString();
        exSheet.Cells["M10"].Value = dtMaster.Rows[0]["deli_partner_name"].ToString();

        exSheet.Cells["E11"].Value = dtMaster.Rows[0]["short_nm"].ToString();
        exSheet.Cells["M11"].Value = dtMaster.Rows[0]["deli_addr1"].ToString();

        exSheet.Cells["E12"].Value = dtMaster.Rows[0]["bill_addr1"].ToString();
        exSheet.Cells["E13"].Value = dtMaster.Rows[0]["tax_code"].ToString();
        exSheet.Cells["G13"].Value = dtMaster.Rows[0]["phone_no"].ToString();

        exSheet.Cells["E14"].Value = dtMaster.Rows[0]["po_date"].ToString();

        exSheet.Cells["E15"].Value = dtMaster.Rows[0]["po_no"].ToString();
        //----------------------
        ////end-set-----DataBind--in---Master---

        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A22"].Rows.EntireRow.Insert();//insert row new of sheet

        }
        //set date title of year
        //exSheet.Cells[2, 1].Value = "Income Statement Year" + " " + l_year;

        //set data to detail.
        // loop detail not percent
        int pos = 21;
        for (int l_row = 0; l_row < dtDetail.Rows.Count; l_row++)
        {
            exSheet.Cells[pos + l_row, 1].Value = l_row + 1;
            exSheet.Cells[pos + l_row, 2].Value = dtDetail.Rows[l_row]["item_bc"];
            exSheet.Cells[pos + l_row, 3].Value = dtDetail.Rows[l_row]["item_code"];
            exSheet.Cells[pos + l_row, 4].Value = dtDetail.Rows[l_row]["item_name"];
            exSheet.Cells[pos + l_row, 4, pos + l_row, 6].Merge();
            exSheet.Cells[pos + l_row, 7].Value = dtDetail.Rows[l_row]["out_uom"];
            exSheet.Cells[pos + l_row, 8].Value = dtDetail.Rows[l_row]["out_qty"];
            exSheet.Cells[pos + l_row, 9].Value = dtDetail.Rows[l_row]["unit_price"];
            exSheet.Cells[pos + l_row, 10].Value = dtDetail.Rows[l_row]["discount_rate"];
            exSheet.Cells[pos + l_row, 11].Value = dtDetail.Rows[l_row]["discount_amount"];
            exSheet.Cells[pos + l_row, 11, pos + l_row, 13].Merge();
            exSheet.Cells[pos + l_row, 14].Value = dtDetail.Rows[l_row]["total_amount"];
            exSheet.Cells[pos + l_row, 15].Value = dtDetail.Rows[l_row]["ref_no"];
            exSheet.Cells[pos + l_row, 16].Value = dtDetail.Rows[l_row]["description"];
        }
        exSheet.Cells[dtDetail.Rows.Count + 21, 8].Value = "=SUM(H21:H" + (dtDetail.Rows.Count + 20) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 21, 11].Value = "=SUM(K21:K" + (dtDetail.Rows.Count + 20) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 21, 14].Value = "=SUM(N21:N" + (dtDetail.Rows.Count + 20) + ")";

        exSheet.Cells[dtDetail.Rows.Count + 22, 14].Value = "=SUM(N21:N" + (dtDetail.Rows.Count + 20) + ")*10%";
        exSheet.Cells[dtDetail.Rows.Count + 23, 14].Value = "=SUM(N21:N" + (dtDetail.Rows.Count + 20) + ")+ (SUM(N21:N" + (dtDetail.Rows.Count + 20) + ")*10%)";
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