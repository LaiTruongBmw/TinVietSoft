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

public partial class rpt_bisc00070_happycook_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser("SALE");
        //string l_pk = Request["master_pk"];

        string TemplateFile = "rpt_bisc00070_happycook_1.xls";
        string TempFile = "../../../../system/temp/rpt_bisc00070_happycook_1_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file

        //string para = "'" + l_pk + "'";
        string p_from_date = Request.QueryString["p_from_date"];
        string p_to_date = Request.QueryString["p_to_date"];
        string p_wh_type = Request.QueryString["p_wh_type"];
        string p_tin_warehouse_pk = Request.QueryString["p_tin_warehouse_pk"];
        string p_use_yn = Request.QueryString["p_use_yn"];
        string p_item_group_pk = Request.QueryString["p_item_group_pk"];
        string p_item = Request.QueryString["p_item"];
        string p_wh_name = Request.QueryString["p_wh_name"];
        string para = "'" + p_from_date + "','" + p_to_date + "','" + p_wh_type + "','" + p_tin_warehouse_pk + "','" + p_use_yn + "','" + p_item_group_pk + "','" + p_item + "'";

        DataTable dtInfo = CtlLib.TableReadOpenCursor("st_lg_rpt_BISC00070", "'" + Session["User_ID"].ToString() + "'");
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_BISC00070_HAPPY_2", para);

        //--set-----DataBind--in---Master---
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

        exSheet.Cells[1, 7].Value = "Tell: " + dtInfo.Rows[0]["phone_no"].ToString();

        exSheet.Cells[2, 7].Value = "Fax: " + dtInfo.Rows[0]["fax_no"].ToString();

        exSheet.Cells[3, 7].Value = "Print date: " + DateTime.Now.ToString("dd/MM/yyyy hh:mm");

        exSheet.Cells["G5"].Value = System.DateTime.ParseExact(p_from_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy") + "-" + System.DateTime.ParseExact(p_to_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy");

        exSheet.Cells["C5"].Value = p_wh_name;
        //---------
       
        ////end-set-----DataBind--in---Master---

        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A10"].Rows.EntireRow.Insert();//insert row new of sheet

        }
        //set data to detail.
        // loop detail not percent

        for (int l_row = 1; l_row <= dtDetail.Rows.Count; l_row++)
        {
            for (int col = 1; col <= dtDetail.Columns.Count; col++)
            {
               
                if (col == 1)
                {
                    exSheet.Cells[8 + l_row, col].Value = l_row;
                }
                else if (col == 6 || col == 7 || col == 8 || col == 9 || col == 10 || col == 11)
                {
                    int no = string.IsNullOrEmpty(dtDetail.Rows[l_row - 1][col - 1].ToString()) ? 0 : Convert.ToInt32(dtDetail.Rows[l_row - 1][col - 1]);
                    exSheet.Cells[8 + l_row, col].Value = no;
                }
                else
                {
                    exSheet.Cells[8 + l_row, col].Value = dtDetail.Rows[l_row - 1][col - 1];
                }
             
            }
        }
     
        exSheet.Cells[dtDetail.Rows.Count + 9, 6].Value = "=SUM(F9:F" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 7].Value = "=SUM(G9:G" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 8].Value = "=SUM(H9:H" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 9].Value = "=SUM(I9:I" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 10].Value = "=SUM(J9:J" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 11].Value = "=SUM(K9:K" + (dtDetail.Rows.Count + 8) + ")";
        // end loop detail not percent

        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }


        // hide row firts 

        //range = exSheet.Range["A1"];
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