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

public partial class rpt_bisc00200 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
        //string l_pk = Request["master_pk"];

        string TemplateFile = "rpt_bisc00200.xlsx";
        string TempFile = "../../../../system/temp/rpt_bisc00200_" + Session["User_ID"].ToString() + ".xls";
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
        string p_tin_warehouse_pk = Request.QueryString["p_tin_warehouse_pk"];
        string p_wh_name = Request.QueryString["p_wh_name"];
        string p_item_grp = Request.QueryString["p_item_grp"];
        string p_item = Request.QueryString["p_item"];
        string p_chk_bal = Request.QueryString["p_chk_bal"];
        string p_bal = Request.QueryString["p_bal"]; 
        
        string para = "'" + p_from_date + "','" + p_to_date + "','" + p_wh_type + "','" + p_tin_warehouse_pk + "','" + p_item_grp + "','" + p_item + "','" + p_chk_bal + "','" + p_bal + "'";
		
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00200", para);
        DataTable dtHeader = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00200_header", "'" + Session["User_ID"].ToString() + "'");

        if (dtDetail.Rows.Count == 0)
        {
            Response.Write("There is no data!");
            Response.End();
        }

        //---------------------header---------------------
        if (!string.IsNullOrEmpty(dtHeader.Rows[0]["pic"].ToString()))
        {
            exSheet.Cells[1, 1].Select();
            byte[] MyData = new byte[0];
            MyData = (byte[])dtHeader.Rows[0]["pic"];
            MemoryStream stream = new MemoryStream(MyData);

            Bitmap b = new Bitmap(stream);
            exSheet.Shapes.AddPicture(ResizeImage(b, 90, 59));
        }

        exSheet.Cells["C1"].Value = dtHeader.Rows[0]["partner_name"];
        exSheet.Cells["C2"].Value = dtHeader.Rows[0]["addr1"];
        exSheet.Cells["C3"].Value = "Tax Code: " + dtHeader.Rows[0]["tax_code"];

        exSheet.Cells["Q1"].Value = "Tel: " + dtHeader.Rows[0]["phone_no"];
        exSheet.Cells["Q2"].Value = "Fax No: " + dtHeader.Rows[0]["fax_no"];
        exSheet.Cells["Q3"].Value = "Print Date: " + DateTime.Now.ToString("dd/MM/yyyy hh:mm"); 
        
        exSheet.Cells["B5"].Value = p_from_date + " ~ " + p_to_date;

        int l_pos = 8;

		//-----------------------------detail--------------------
        for (int l_addrow = 0; l_addrow < dtDetail.Rows.Count-1; l_addrow++)
        {
            exSheet.Range[l_pos + l_addrow + 1, 1].Rows.EntireRow.Insert();//insert row new of sheet
        }
        // loop detail not percent
		int i = 0 ;
        for (i = 0; i < dtDetail.Rows.Count; i++)
        {
            exSheet.Cells[l_pos + i, 1].Value = i + 1; 
            for (int k = 1; k <= dtDetail.Columns.Count; k++)
            {
                exSheet.Cells[l_pos + i, k+1].Value = dtDetail.Rows[i][k - 1];
            }
        }

        exSheet.Cells[l_pos + i, 6].Value = "=SUM(F" + l_pos + ":F" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 7].Value = "=SUM(G" + l_pos + ":G" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 8].Value = "=SUM(H" + l_pos + ":H" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 9].Value = "=SUM(I" + l_pos + ":I" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 10].Value = "=SUM(J" + l_pos + ":J" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 11].Value = "=SUM(K" + l_pos + ":K" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 12].Value = "=SUM(L" + l_pos + ":L" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 13].Value = "=SUM(M" + l_pos + ":M" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 14].Value = "=SUM(N" + l_pos + ":N" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 15].Value = "=SUM(O" + l_pos + ":O" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 16].Value = "=SUM(P" + l_pos + ":P" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 17].Value = "=SUM(Q" + l_pos + ":Q" + (dtDetail.Rows.Count + 4) + ")";
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