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

public partial class rpt_bisc00070_happycook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
        //string l_pk = Request["master_pk"];

        string TemplateFile = "rpt_bisc00070_happycook.xls";
        string TempFile = "../../../../system/temp/rpt_bisc00070_happycook_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file

        //string para = "'" + l_pk + "'";
        string p_from_date = Request["p_from_date"];
        string p_to_date = Request["p_to_date"];
        string p_wh_type = Request["p_wh_type"];
        string p_tin_warehouse_pk = Request["p_tin_warehouse_pk"];
        string p_item_group_pk = Request["p_item_group_pk"];
        string p_item = Request["p_item"];
        string p_in_out_yn = Request["p_in_out_yn"];
        string p_wh_name = Request["p_wh_name"];
        
        string para = "'" + p_from_date + "','" + p_to_date + "','" + p_wh_type + "','" + p_tin_warehouse_pk + "','" + p_item_group_pk + "','" + p_item + "','" + p_in_out_yn + "'";
        DataTable dtInfo = CtlLib.TableReadOpenCursor("st_lg_rpt_BISC00070", "'" + Session["User_ID"].ToString() + "'");
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_BISC00070_HAPPY_1", para);

        //--set-----DataBind--in---Master---
        if (!string.IsNullOrEmpty(dtInfo.Rows[0]["pic"].ToString()))
        {
            exSheet.Cells[1, 1].Select();
            byte[] MyData = new byte[0];
            MyData = (byte[])dtInfo.Rows[0]["pic"];
            MemoryStream stream = new MemoryStream(MyData);

            Bitmap b = new Bitmap(stream);
            exSheet.Shapes.AddPicture(ResizeImage(b, 131, 71));
        }

        exSheet.Cells[1, 3].Value = dtInfo.Rows[0]["partner_name"].ToString();

        exSheet.Cells[2, 3].Value = dtInfo.Rows[0]["addr1"].ToString();

        exSheet.Cells[3, 3].Value = "Tax code:"  + dtInfo.Rows[0]["tax_code"].ToString();
       
        exSheet.Cells[1, 13].Value = "Tell:" + dtInfo.Rows[0]["phone_no"].ToString();

        exSheet.Cells[2, 13].Value = "Fax:" + dtInfo.Rows[0]["fax_no"].ToString();

        exSheet.Cells[3, 13].Value = "Print date: " + DateTime.Now.ToString("dd/MM/yyyy hh:mm");

        exSheet.Cells[5, 13].Value = System.DateTime.ParseExact(p_from_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy")+ "-" + System.DateTime.ParseExact(p_to_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy");

        //---------
        /*exSheet.Cells[10, 4].Value = dtMaster.Rows[0]["bill_partner_name"].ToString();
        exSheet.Cells[10, 12].Value = dtMaster.Rows[0]["deli_partner_name"].ToString();

        exSheet.Cells[11, 4].Value = dtMaster.Rows[0]["short_nm"].ToString();
        exSheet.Cells[11, 12].Value = dtMaster.Rows[0]["deli_addr1"].ToString();

        exSheet.Cells[12, 4].Value = dtMaster.Rows[0]["bill_addr1"].ToString();
        exSheet.Cells[13, 4].Value = dtMaster.Rows[0]["tax_code"].ToString();
        exSheet.Cells[13, 6].Value = dtMaster.Rows[0]["phone_no"].ToString();

        exSheet.Cells[14, 4].Value = dtMaster.Rows[0]["po_date"].ToString();

        exSheet.Cells[15, 4].Value = dtMaster.Rows[0]["po_no"].ToString();
        exSheet.Cells[11, 2].Value = dtMst.Rows[0]["charger"].ToString();
        exSheet.Cells[12, 2].Value = dtMst.Rows[0]["department_name"].ToString(); 
        exSheet.Cells[8, 2].Value = dtMst.Rows[0]["partner_name"].ToString();
        exSheet.Cells[8, 3].Value = dtMst.Rows[0]["ACCOUNT_NO"].ToString();
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
            exSheet.Range["A10"].Rows.EntireRow.Insert();//insert row new of sheet

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
                    exSheet.Cells[8 + l_row, col + 1].Value = dtDetail.Rows[l_row - 1]["rownum"].ToString();
                }
                else if (col == 1) // item code
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = dtDetail.Rows[l_row - 1]["item_code"].ToString();
                }
                else if (col == 2) // uom
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = dtDetail.Rows[l_row - 1]["uom"].ToString();
                    //exSheet.Cells[8 + l_row, 3, 8 + l_row, 5].Merge();
                }
                else if (col == 3) // begin qty
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = Convert.ToInt32(dtDetail.Rows[l_row - 1]["begin_qty"]);          
                }
                else if (col == 4) // Production
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = Convert.ToInt32(dtDetail.Rows[l_row - 1]["prod"]);
                    
                }
                else if (col == 5) // other in
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = Convert.ToInt32(dtDetail.Rows[l_row - 1]["other_in"]);
                }
                else if (col == 6) //buy
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = Convert.ToDouble(dtDetail.Rows[l_row - 1]["buy"]);
                }
                else if (col == 7) // transfer_in
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = Convert.ToDouble(dtDetail.Rows[l_row - 1]["transfer_in"]);
                }
                else if (col == 8) // assembly_in
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = Convert.ToInt32(dtDetail.Rows[l_row - 1]["assembly_in"]);
                }
                else if (col == 9) // return
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = Convert.ToDouble(dtDetail.Rows[l_row - 1]["return"]);
                    
                }
                else if (col == 10) // total_in
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = "=SUM(E" + (8 + l_row) + ":J" + (8 + l_row) + ")";
                }
                else if (col == 11) // sale
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = Convert.ToInt32(dtDetail.Rows[l_row - 1]["sale"]);
                }
                else if (col == 12) // pro_order
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = Convert.ToInt32(dtDetail.Rows[l_row - 1]["pro_order"]);
                }
                else if (col == 13) // warranty
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = Convert.ToInt32(dtDetail.Rows[l_row - 1]["warranty"]);
                }
                else if (col == 14) // promote
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = Convert.ToInt32(dtDetail.Rows[l_row - 1]["promote"]);
                }
                else if (col == 15) // manager
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = Convert.ToInt32(dtDetail.Rows[l_row - 1]["manager"]);
                }
                else if (col == 16) // sample
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = Convert.ToInt32(dtDetail.Rows[l_row - 1]["sample"]);
                }
                else if (col == 17) // packing
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = Convert.ToInt32(dtDetail.Rows[l_row - 1]["packing"]);
                }
                else if (col == 18) // assembly_out
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = Convert.ToInt32(dtDetail.Rows[l_row - 1]["assembly_out"]);
                }
                else if (col == 19) // transfer_out
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = Convert.ToInt32(dtDetail.Rows[l_row - 1]["transfer_out"]);
                }
                else if (col == 8) // gift
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = Convert.ToInt32(dtDetail.Rows[l_row - 1]["gift"]);
                }
                else if (col == 21) // export
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = Convert.ToInt32(dtDetail.Rows[l_row - 1]["export"]);
                }
                else if (col == 22) // total_out
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = "=SUM(L" + (8 + l_row) + ":V" + (8 + l_row) + ")"; 
                }
                else if (col == 23) // end_qty
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = "=D" + (8 + l_row) + "+ K" + (8 + l_row) + "- W" + (8 + l_row);
                }
                else if (col == 24) // description
                {
                    exSheet.Cells[8 + l_row, col + 1].Value = dtDetail.Rows[l_row - 1]["description"].ToString();
                }
                /*   if (col == 0)
             {
                 exSheet.Cells[8 + l_row, col].Value = l_row; // no
             }
             else
             {
                 exSheet.Cells[8 + l_row, col + 1].Value = dtDetail.Rows[l_row - 1]["item_code"].ToString();
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
        exSheet.Cells[dtDetail.Rows.Count + 9, 4].Value = "=SUM(D9:D" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 5].Value = "=SUM(E9:E" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 6].Value = "=SUM(F9:F" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 7].Value = "=SUM(G9:G" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 8].Value = "=SUM(H9:H" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 9].Value = "=SUM(I9:I" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 10].Value = "=SUM(J9:J" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 11].Value = "=SUM(K9:K" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 12].Value = "=SUM(L9:L" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 13].Value = "=SUM(M9:M" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 14].Value = "=SUM(N9:N" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 15].Value = "=SUM(O9:O" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 16].Value = "=SUM(P9:P" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 17].Value = "=SUM(Q9:Q" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 18].Value = "=SUM(R9:R" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 19].Value = "=SUM(S9:S" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 20].Value = "=SUM(T9:T" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 21].Value = "=SUM(U9:U" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 22].Value = "=SUM(V9:V" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 23].Value = "=SUM(W9:W" + (dtDetail.Rows.Count + 8) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 9, 24].Value = "=SUM(X9:X" + (dtDetail.Rows.Count + 8) + ")";

        //exSheet.Cells[dtDetail.Rows.Count + 22, 13].Value = "=SUM(M21:M" + (dtDetail.Rows.Count + 8) + ")*10%";
        //exSheet.Cells[dtDetail.Rows.Count + 23, 13].Value = "=SUM(M21:M" + (dtDetail.Rows.Count + 8) + ")+ (SUM(M21:M" + (dtDetail.Rows.Count + 8) + ")*10%)";
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