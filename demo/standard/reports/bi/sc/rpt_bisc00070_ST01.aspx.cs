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

public partial class rpt_bisc00070_ST01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser("SALE");
        //string l_pk = Request["master_pk"];

        string TemplateFile = "rpt_bisc00070_ST01.xls";
        string TempFile = "../../../../system/temp/rpt_bisc00070_ST01_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
         
        string p_from_date 			= Request.QueryString["p_from_date"];
        string p_to_date	 		= Request.QueryString["p_to_date"];
        string p_wh_type 			= Request.QueryString["p_wh_type"];
        string p_tin_warehouse_pk 	= Request.QueryString["p_tin_warehouse_pk"];
        string p_use_yn             = Request.QueryString["p_use_yn"];
        string p_item_group_pk 		= Request.QueryString["p_item_group_pk"];
        string p_item 				= Request.QueryString["p_item"];
		string p_in_out_yn          = Request.QueryString["p_in_out_yn"];
		string p_lang               = Request.QueryString["p_lang"]; 
        string p_wh_name 			= Request.QueryString["p_wh_name"];

        string para = "'" + p_from_date + "','" + p_to_date + "','" + p_wh_type + "','" + p_tin_warehouse_pk + "','" + p_use_yn + "','" + p_item_group_pk + "','" + p_item + "','" + p_in_out_yn + "','" + p_lang + "'";

        DataTable dtInfo 	= CtlLib.TableReadOpenCursor("st_lg_rpt_BISC00070_ST01_2", "'" + Session["User_ID"].ToString() + "'");
        DataTable dtDetail 	= CtlLib.TableReadOpenCursor("st_lg_rpt_BISC00070_ST01_1", para);   

		if (dtDetail.Rows.Count == 0)
        {
            Response.Write("There is no data");
            Response.End();
        }
		
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

        exSheet.Cells["K1"].Value = "Tell: " + dtInfo.Rows[0]["phone_no"].ToString();

        exSheet.Cells["K2"].Value = "Fax: " + dtInfo.Rows[0]["fax_no"].ToString();

        exSheet.Cells["K3"].Value = "Print date: " + DateTime.Now.ToString("dd/MM/yyyy hh:mm");

        exSheet.Cells["I5"].Value = System.DateTime.ParseExact(p_from_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy") + "-" + System.DateTime.ParseExact(p_to_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy");

        exSheet.Cells["C5"].Value = p_wh_name;
        //---------
       
        ////end-set-----DataBind--in---Master---

        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A9"].Rows.EntireRow.Insert();//insert row new of sheet

        }
        //set data to detail.
        // loop detail not percent
		int l_pos = 8;
        for (int i = 0; i < dtDetail.Rows.Count; i++)
        {
			exSheet.Cells[l_pos + i, 1].Value = i+1 ;
            exSheet.Cells[l_pos + i, 2].Value = dtDetail.Rows[i]["wh_name"];
			exSheet.Cells[l_pos + i, 3].Value = dtDetail.Rows[i]["item_code"];
			exSheet.Cells[l_pos + i, 4].Value = dtDetail.Rows[i]["item_name"];
			exSheet.Cells[l_pos + i, 5].Value = dtDetail.Rows[i]["uom"];
			exSheet.Cells[l_pos + i, 6].Value = dtDetail.Rows[i]["lot_no"];
			
			exSheet.Cells[l_pos + i, 7].Value = dtDetail.Rows[i]["begin_qty"];
			
			exSheet.Cells[l_pos + i, 8].Value = dtDetail.Rows[i]["open_qty"];
			exSheet.Cells[l_pos + i, 9].Value = dtDetail.Rows[i]["income_qty"];
			exSheet.Cells[l_pos + i,10].Value = dtDetail.Rows[i]["prod_in_qty"];
			exSheet.Cells[l_pos + i,11].Value = dtDetail.Rows[i]["ass_in_qty"];
			exSheet.Cells[l_pos + i,12].Value = dtDetail.Rows[i]["trans_in_qty"];
			exSheet.Cells[l_pos + i,13].Value = dtDetail.Rows[i]["ex_in_qty"];
			exSheet.Cells[l_pos + i,14].Value = dtDetail.Rows[i]["in_return_qty"];
			exSheet.Cells[l_pos + i,15].Value = dtDetail.Rows[i]["others_in_qty"];
			
			exSheet.Cells[l_pos + i,16].Value = dtDetail.Rows[i]["total_in"];
			
			exSheet.Cells[l_pos + i,17].Value = dtDetail.Rows[i]["outgo_qty"];
			exSheet.Cells[l_pos + i,18].Value = dtDetail.Rows[i]["deli_qty"];
			exSheet.Cells[l_pos + i,19].Value = dtDetail.Rows[i]["prod_out_qty"];
			exSheet.Cells[l_pos + i,20].Value = dtDetail.Rows[i]["ass_out_qty"];
			exSheet.Cells[l_pos + i,21].Value = dtDetail.Rows[i]["trans_out_qty"];
			exSheet.Cells[l_pos + i,22].Value = dtDetail.Rows[i]["ex_out_qty"];
			exSheet.Cells[l_pos + i,23].Value = dtDetail.Rows[i]["out_return_qty"];
			exSheet.Cells[l_pos + i,24].Value = dtDetail.Rows[i]["discard_qty"];
			exSheet.Cells[l_pos + i,25].Value = dtDetail.Rows[i]["others_out_qty"];
			exSheet.Cells[l_pos + i,26].Value = dtDetail.Rows[i]["adj_qty"];
			
			exSheet.Cells[l_pos + i,27].Value = dtDetail.Rows[i]["total_out"];
			
			exSheet.Cells[l_pos + i,28].Value = dtDetail.Rows[i]["end_qty"];
        }
     
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 7 ].Value = "=SUM(G8:G" + (dtDetail.Rows.Count-1 + l_pos) + ")";
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 8 ].Value = "=SUM(H8:H" + (dtDetail.Rows.Count-1 + l_pos) + ")";
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 9 ].Value = "=SUM(I8:I" + (dtDetail.Rows.Count-1 + l_pos) + ")";
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 10].Value = "=SUM(J8:J" + (dtDetail.Rows.Count-1 + l_pos) + ")";
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 11].Value = "=SUM(K8:K" + (dtDetail.Rows.Count-1 + l_pos) + ")";
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 12].Value = "=SUM(L8:L" + (dtDetail.Rows.Count-1 + l_pos) + ")";
		exSheet.Cells[dtDetail.Rows.Count + l_pos, 13].Value = "=SUM(M8:M" + (dtDetail.Rows.Count-1 + l_pos) + ")";
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 14].Value = "=SUM(N8:N" + (dtDetail.Rows.Count-1 + l_pos) + ")";
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 15].Value = "=SUM(O8:O" + (dtDetail.Rows.Count-1 + l_pos) + ")";
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 16].Value = "=SUM(P8:P" + (dtDetail.Rows.Count-1 + l_pos) + ")";
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 17].Value = "=SUM(Q8:Q" + (dtDetail.Rows.Count-1 + l_pos) + ")";
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 18].Value = "=SUM(R8:R" + (dtDetail.Rows.Count-1 + l_pos) + ")";
		exSheet.Cells[dtDetail.Rows.Count + l_pos, 19].Value = "=SUM(S8:S" + (dtDetail.Rows.Count-1 + l_pos) + ")";
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 20].Value = "=SUM(T8:T" + (dtDetail.Rows.Count-1 + l_pos) + ")";
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 21].Value = "=SUM(U8:U" + (dtDetail.Rows.Count-1 + l_pos) + ")";
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 22].Value = "=SUM(V8:V" + (dtDetail.Rows.Count-1 + l_pos) + ")";
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 23].Value = "=SUM(W8:W" + (dtDetail.Rows.Count-1 + l_pos) + ")";
        exSheet.Cells[dtDetail.Rows.Count + l_pos, 24].Value = "=SUM(X8:X" + (dtDetail.Rows.Count-1 + l_pos) + ")";
		exSheet.Cells[dtDetail.Rows.Count + l_pos, 25].Value = "=SUM(Y8:Y" + (dtDetail.Rows.Count-1 + l_pos) + ")";
		exSheet.Cells[dtDetail.Rows.Count + l_pos, 26].Value = "=SUM(Z8:Z" + (dtDetail.Rows.Count-1 + l_pos) + ")";
		exSheet.Cells[dtDetail.Rows.Count + l_pos, 27].Value = "=SUM(AA8:AA" + (dtDetail.Rows.Count-1 + l_pos) + ")";
		exSheet.Cells[dtDetail.Rows.Count + l_pos, 28].Value = "=SUM(AB8:AB" + (dtDetail.Rows.Count-1 + l_pos) + ")";
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