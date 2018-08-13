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

public partial class reports_rpt_dscd00030 : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		CtlLib.SetUser("sale");


        string p_from_date = Request["p_from_date"]; 
        string p_to_date = Request["p_to_date"]; 
        string p_order_type = Request["p_order_type"]; 
        string p_po_vendor = Request["p_po_vendor"]; 
        string p_item_group = Request["p_item_group"]; 
        string p_item = Request["p_item"]; 
        string p_search_type = Request["p_searchtype"]; 
        string p_curr = Request["p_curr"]; 
        string p_io_type = Request["p_io_type"]; 
        string p_sale_yn = Request["p_sale_yn"]; 
        string p_wh_type = Request["p_wh_type"]; 
        string p_wh_pk = Request["p_wh_pk"]; 
        string p_gd_type = Request["p_gd_type"];

        string TemplateFile = "";
        string TempFile = "";


        if (p_search_type == "REQ")
        {
            TemplateFile = "rpt_dscd00030.xls";
            TempFile = "../../../../system/temp/rpt_dscd00030_" + Session["User_ID"].ToString() + ".xls";
            TemplateFile = Server.MapPath(TemplateFile);
            TempFile = Server.MapPath(TempFile);
        }
        else
        {
            TemplateFile = "rpt_dscd00030_1.xls";
            TempFile = "../../../../system/temp/rpt_dscd00030_1_" + Session["User_ID"].ToString() + ".xls";
            TemplateFile = Server.MapPath(TemplateFile);
            TempFile = Server.MapPath(TempFile);
        }
		

		//Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

		//Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

		IRange range;

		//bind data to excel file

        string para = "'" + p_from_date + "','" + p_to_date + "','" + p_order_type + "','" + p_po_vendor + "','" + p_item_group + "','" + p_item + "','" + p_search_type + "','" + p_curr + "','" + p_io_type + "','" + p_sale_yn + "','" + p_wh_type + "','" + p_wh_pk + "','" + p_gd_type + "'";
        DataTable dtInfo = CtlLib.TableReadOpenCursor("st_lg_rpt_dscd00030_INFO");
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_dscd00030", para);

		//--set-----DataBind--in---Master---
        if (!string.IsNullOrEmpty(dtInfo.Rows[0]["pic"].ToString()))
		{
			exSheet.Cells[1, 1].Select();
			byte[] MyData = new byte[0];
			MyData = (byte[])dtInfo.Rows[0]["pic"];
			MemoryStream stream = new MemoryStream(MyData);

			Bitmap b = new Bitmap(stream);
			exSheet.Shapes.AddPicture(ResizeImage(b, 95, 55));
		}

		exSheet.Cells["P2"].Value = "Print date: " + DateTime.Now.ToString("dd/MM/yyyy hh:mm");

		string s_date = System.DateTime.ParseExact(p_from_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy");
		s_date += " - " + System.DateTime.ParseExact(p_to_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy");
        exSheet.Cells["B2"].Value = "Date : " + s_date;


        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A5"].Rows.EntireRow.Insert();//insert row new of sheet
        }

        for (int i = 0; i < dtDetail.Rows.Count; i++)
        {
            for (int j = 0; j < dtDetail.Columns.Count;j++ )
            {
                exSheet.Cells[4 + i, j + 1].Value = dtDetail.Rows[i][j];
            }
        }
        exSheet.Cells[dtDetail.Rows.Count + 4, 12].Value = "=SUM(L4:L" + (dtDetail.Rows.Count + 3) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 4, 14].Value = "=SUM(N4:N" + (dtDetail.Rows.Count + 3) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 4, 16].Value = "=SUM(P4:P" + (dtDetail.Rows.Count + 3) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 4, 17].Value = "=SUM(Q4:Q" + (dtDetail.Rows.Count + 3) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 4, 19].Value = "=SUM(S4:S" + (dtDetail.Rows.Count + 3) + ")";
            //exSheet.Cells[dtDetail.Rows.Count + 9, 7].Value = "=SUM(G9:G" + (dtDetail.Rows.Count + 8) + ")";
            //exSheet.Cells[dtDetail.Rows.Count + 9, 8].Value = "=SUM(H9:H" + (dtDetail.Rows.Count + 8) + ")";
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