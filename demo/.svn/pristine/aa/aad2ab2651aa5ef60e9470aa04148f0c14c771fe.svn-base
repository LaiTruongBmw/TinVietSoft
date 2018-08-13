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

public partial class reports_rpt_dscd00075 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser("sale");
        string l_pk = Request["master_pk"];

        string TemplateFile = "rpt_dscd00075.xls";
        string TempFile = "../../../../system/temp/rpt_dscd00075_" + Session["User_ID"].ToString() + ".xls";
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
            exSheet.Shapes.AddPicture(ResizeImage(b, 131, 71));
        }

        exSheet.Cells[3, 15].Value = "Print date: " + DateTime.Now.ToString("dd/MM/yyyy hh:mm");

        exSheet.Cells[5, 4].Value = dtInfo.Rows[0]["partner_name"].ToString();
        exSheet.Cells[5, 12].Value = dtMaster.Rows[0]["slip_no"].ToString();

        exSheet.Cells[6, 4].Value = dtInfo.Rows[0]["addr1"].ToString();
        exSheet.Cells[6, 12].Value = dtMaster.Rows[0]["out_date"].ToString();

        exSheet.Cells[7, 4].Value = dtInfo.Rows[0]["tax_code"].ToString();
        exSheet.Cells[7, 12].Value = dtMaster.Rows[0]["description"].ToString();

        exSheet.Cells[8, 4].Value = dtInfo.Rows[0]["phone_no"].ToString();
        //---------
        exSheet.Cells[10, 4].Value = dtMaster.Rows[0]["bill_partner_name"].ToString();
        exSheet.Cells[10, 12].Value = dtMaster.Rows[0]["deli_partner_name"].ToString();

        exSheet.Cells[11, 4].Value = dtMaster.Rows[0]["short_nm"].ToString();
        exSheet.Cells[11, 12].Value = dtMaster.Rows[0]["deli_addr1"].ToString();

        exSheet.Cells[12, 4].Value = dtMaster.Rows[0]["bill_addr1"].ToString();
        exSheet.Cells[13, 4].Value = dtMaster.Rows[0]["tax_code"].ToString();
        exSheet.Cells[13, 6].Value = dtMaster.Rows[0]["phone_no"].ToString();

        exSheet.Cells[14, 4].Value = dtMaster.Rows[0]["po_date"].ToString();

        exSheet.Cells[15, 4].Value = dtMaster.Rows[0]["po_no"].ToString();
        /*exSheet.Cells[11, 2].Value = dtMst.Rows[0]["charger"].ToString();
        exSheet.Cells[12, 2].Value = dtMst.Rows[0]["department_name"].ToString(); 
        exSheet.Cells[20, 2].Value = dtMst.Rows[0]["partner_name"].ToString();
        exSheet.Cells[20, 3].Value = dtMst.Rows[0]["ACCOUNT_NO"].ToString();
        exSheet.Cells[22, 2].Value = dtMst.Rows[0]["BEDEFI_BANK_NM"].ToString();
        exSheet.Cells[17, 6].Value = dtMst.Rows[0]["PAY_METHOD"].ToString();

        exSheet.Cells[13, 4].Value = "Amount (" + dtMst.Rows[0]["REQ_CCY"].ToString() + " )";
        

        exSheet.Cells[15, 4].Value = long.Parse(dtTotal.Rows[0][0].ToString());//total
        exSheet.Cells[15, 4, 15, 4].NumberFormat = "#,##0";

        exSheet.Cells[17, 4].Value = long.Parse(dtTotal.Rows[0][0].ToString());//total rerurn company
        exSheet.Cells[17, 4, 17, 4].NumberFormat = "#,##0";*/
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

        for (int l_row = 1; l_row <= dtDetail.Rows.Count; l_row++)
        {
            for (int col = 0; col <= 14; col++)
            {
                if (col == 0) // seq
                {
                    exSheet.Cells[20 + l_row, col + 1].Value = dtDetail.Rows[l_row - 1]["rownum"].ToString();
                }
                else if (col == 1) // item code
                {
                    exSheet.Cells[20 + l_row, col + 1].Value = dtDetail.Rows[l_row - 1]["item_code"].ToString();
                }
                else if (col == 2) // item name
                {
                    exSheet.Cells[20 + l_row, col + 1].Value = dtDetail.Rows[l_row - 1]["item_name"].ToString();
                    exSheet.Cells[20 + l_row, 3, 20 + l_row, 5].Merge();
                }
                else if (col == 5) // uom
                {
                    exSheet.Cells[20 + l_row, col + 1].Value = dtDetail.Rows[l_row - 1]["out_uom"].ToString();
                }
                else if (col == 6) // qty
                {
                    exSheet.Cells[20 + l_row, col + 1].Value = Convert.ToDouble(dtDetail.Rows[l_row - 1]["out_qty"]);
                }
                else if (col == 7) // unit_price
                {
                    exSheet.Cells[20 + l_row, col + 1].Value = Convert.ToDouble(dtDetail.Rows[l_row - 1]["unit_price"]);
                }
                else if (col == 8) // discount_rate
                {
                    exSheet.Cells[20 + l_row, col + 1].Value = Convert.ToInt32(dtDetail.Rows[l_row - 1]["discount_rate"]);
                }
                else if (col == 9) // discount_amount
                {
                    exSheet.Cells[20 + l_row, col + 1].Value = Convert.ToDouble(dtDetail.Rows[l_row - 1]["discount_amount"]);
                    exSheet.Cells[20 + l_row, 10, 20 + l_row, 12].Merge();
                }
                else if (col == 12) // total_amount
                {
                    exSheet.Cells[20 + l_row, col + 1].Value = Convert.ToDouble(dtDetail.Rows[l_row - 1]["total_amount"]);
                }
                else if (col == 13) // ref_no
                {
                    exSheet.Cells[20 + l_row, col + 1].Value = dtDetail.Rows[l_row - 1]["ref_no"].ToString();
                }
                else if (col == 14) // description
                {
                    exSheet.Cells[20 + l_row, col + 1].Value = dtDetail.Rows[l_row - 1]["description"].ToString();
                }
                /*   if (col == 0)
             {
                 exSheet.Cells[20 + l_row, col].Value = l_row; // no
             }
             else
             {
                 exSheet.Cells[20 + l_row, col + 1].Value = dtDetail.Rows[l_row - 1]["item_code"].ToString();
             }
              
         else
         {
              exSheet.Cells[12 + l_row, col + 1].Value = long.Parse(dtDetail.Rows[l_row - 1][col].ToString());
              exSheet.Cells[13, col + 1, l_row + 13, col + 1].NumberFormat = "#,##0";
              exSheet.Cells[l_row + 12, col + 1].HorizontalAlignment = XlHAlign.xlHAlignRight;
              exSheet.Range[13, col + 1, l_row + 13, 6].Font.Bold = false;
         }

         exSheet.Cells[l_row + 12, 1].HorizontalAlignment = XlHAlign.xlHAlignCenter;
         exSheet.Cells[l_row + 13, 1].HorizontalAlignment = XlHAlign.xlHAlignCenter;
         exSheet.Cells[l_row + 13, 2].HorizontalAlignment = XlHAlign.xlHAlignCenter;
         exSheet.Cells[l_row + 13, 3].HorizontalAlignment = XlHAlign.xlHAlignLeft;
         exSheet.Cells[l_row + 13, 5].HorizontalAlignment = XlHAlign.xlHAlignLeft;
         exSheet.Cells[l_row + 13, 6].HorizontalAlignment = XlHAlign.xlHAlignLeft;*/
            }
        }
        exSheet.Cells[dtDetail.Rows.Count + 21, 7].Value = "=SUM(G21:G" + (dtDetail.Rows.Count + 20) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 21, 10].Value = "=SUM(J21:J" + (dtDetail.Rows.Count + 20) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 21, 13].Value = "=SUM(M21:M" + (dtDetail.Rows.Count + 20) + ")";

        exSheet.Cells[dtDetail.Rows.Count + 22, 13].Value = "=SUM(M21:M" + (dtDetail.Rows.Count + 20) + ")*10%";
        exSheet.Cells[dtDetail.Rows.Count + 23, 13].Value = "=SUM(M21:M" + (dtDetail.Rows.Count + 20) + ")+ (SUM(M21:M" + (dtDetail.Rows.Count + 20) + ")*10%)";
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
        CtlLib.ExcelToPdf(TempFile);
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