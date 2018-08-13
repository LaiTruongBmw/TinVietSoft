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

public partial class reports_bi_sc_rpt_bisc00020_4 : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		CtlLib.SetUser(Session["APP_DBUSER"].ToString());
		//string l_pk = Request["master_pk"];

		string TemplateFile = "rpt_bisc00020_4.xls";
		string TempFile = "../../../../system/temp/rpt_bisc00020_4_" + Session["User_ID"].ToString() + ".xls";
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
        string p_tin_warehouse_pk = Request["p_wh"];
        string p_use_yn = Request["p_use_yn"];
		string p_item_group_pk = Request["p_item_grp"];
		string p_item = Request["p_item"];
		string p_lang = Request["p_lang"];
		string p_wh_name = Request["p_wh_name"];
		string p_bal_minus = Request["p_bal_minus"];
		string p_lot_no_yn = Request["p_lot_no_yn"];

        string para = "'" + p_from_date + "','" + p_to_date + "','" + p_wh_type + "','" + p_tin_warehouse_pk + "','" + p_use_yn + "','" + p_item_group_pk + "','" + p_item + "','" + p_bal_minus+ "','" + p_lang+ "','" + p_lot_no_yn + "'";
        DataTable dt = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00020_4", "'" + Session["User_ID"].ToString() + "'");
        DataTable dt1 = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00020_1", para);

        //--set-----DataBind--in---Master---
        if (!string.IsNullOrEmpty(dt.Rows[0]["pic"].ToString()))
        {
            exSheet.Cells[1, 1].Select();
            byte[] MyData = new byte[0];
            MyData = (byte[])dt.Rows[0]["pic"];
            MemoryStream stream = new MemoryStream(MyData);

            Bitmap b = new Bitmap(stream);
            exSheet.Shapes.AddPicture(ResizeImage(b, 90, 59));
        }

        exSheet.Cells[6, 1].Value = "W/H Name : " + p_wh_name;

        exSheet.Cells[2, 3].Value = dt.Rows[0]["partner_name"].ToString();

        exSheet.Cells[3, 3].Value = dt.Rows[0]["addr1"].ToString();

        exSheet.Cells[4, 3].Value = "Tax code:" + dt.Rows[0]["tax_code"].ToString();

        exSheet.Cells[2, 6].Value = "Tell:" + dt.Rows[0]["phone_no"].ToString();

        exSheet.Cells[3, 6].Value = "Fax:" + dt.Rows[0]["fax_no"].ToString();

        exSheet.Cells[4, 6].Value = "Print date: " + DateTime.Now.ToString("dd/MM/yyyy hh:mm");

        exSheet.Cells[6, 6].Value = System.DateTime.ParseExact(p_from_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy") + "-" + System.DateTime.ParseExact(p_to_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy");

        for (int l_addrow = 1; l_addrow < dt1.Rows.Count; l_addrow++)
        {
            exSheet.Range["A9"].Rows.EntireRow.Insert();//insert row new of sheet

        }
        double total = 0;
        for (int l_row = 0; l_row <= dt1.Rows.Count-1; l_row++)
        {
            total = total + CommondLib.ConvertToDbl(dt1.Rows[l_row]["begin_qty"].ToString());
            exSheet.Cells[8 + l_row, 1].Value = l_row + 1;
            exSheet.Cells[8 + l_row, 2].Value = dt1.Rows[l_row]["item_code"];
            exSheet.Cells[8 + l_row, 3].Value = dt1.Rows[l_row]["item_name"];
            exSheet.Cells[8 + l_row, 4].Value = dt1.Rows[l_row]["uom"];
            if (dt1.Rows[l_row]["begin_qty"].ToString() != "")
            {
                exSheet.Cells[8 + l_row, 5].Value = CommondLib.ConvertToDbl(dt1.Rows[l_row]["begin_qty"].ToString());
            }
        }

        exSheet.Cells[8 + dt1.Rows.Count, 5].Value = total;

        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }


        // hide row firts 

        range = exSheet.Range["A1"];
        // hide row A5 
        range.Rows.Hidden = true;

        // font bold header

        exBook.SaveAs(TempFile);
        System.IO.FileInfo file = new System.IO.FileInfo(TempFile);
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
        Response.WriteFile(TempFile);
        //Response.WriteFile(pdfFilePath);
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
