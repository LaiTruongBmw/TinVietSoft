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

public partial class rpt_bisc00180 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
        //string l_pk = Request["master_pk"];

        string TemplateFile = "rpt_bisc00180.xls";
        string TempFile = "../../../../system/temp/rpt_bisc00180_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file

		string p_lang          = Request.QueryString["p_lang"];
		string p_wh_pk         = Request.QueryString["p_wh_pk"];
		string p_item_group_pk = Request.QueryString["p_item_grp_pk"];
        string p_item          = Request.QueryString["p_item"];
        string p_from_date     = Request.QueryString["p_from_date"];
        string p_to_date       = Request.QueryString["p_to_date"]; 
        
        string p_wh_pk_01 = Request.QueryString["p_wh_pk_1"];
        string p_wh_pk_02 = Request.QueryString["p_wh_pk_2"];
        string p_wh_pk_03 = Request.QueryString["p_wh_pk_3"];
		string p_wh_pk_04 = Request.QueryString["p_wh_pk_4"];
		string p_wh_pk_05 = Request.QueryString["p_wh_pk_5"];
		string p_wh_pk_06 = Request.QueryString["p_wh_pk_6"];
		string p_wh_pk_07 = Request.QueryString["p_wh_pk_7"];
		string p_wh_pk_08 = Request.QueryString["p_wh_pk_8"];
		string p_wh_pk_09 = Request.QueryString["p_wh_pk_9"];
		string p_wh_pk_10 = Request.QueryString["p_wh_pk_10"];
		string p_wh_pk_11 = Request.QueryString["p_wh_pk_11"];
		string p_wh_pk_12 = Request.QueryString["p_wh_pk_12"];
		string p_wh_pk_13 = Request.QueryString["p_wh_pk_13"];
		string p_wh_pk_14 = Request.QueryString["p_wh_pk_14"];
		string p_wh_pk_15 = Request.QueryString["p_wh_pk_15"];
		string p_wh_pk_16 = Request.QueryString["p_wh_pk_16"];
		string p_wh_pk_17 = Request.QueryString["p_wh_pk_17"];
		string p_wh_pk_18 = Request.QueryString["p_wh_pk_18"];
		string p_wh_pk_19 = Request.QueryString["p_wh_pk_19"];
		string p_wh_pk_20 = Request.QueryString["p_wh_pk_20"];		 

        string para = "'" + p_wh_pk + "','" + p_from_date + "','" + p_to_date + "'";		       

        DataTable dtMaster = CtlLib.TableReadOpenCursor("st_lg_rpt_BISC00180_WH", para);	

			   para = "'" + p_lang + "','" + p_wh_pk + "','" + p_item_group_pk + "','" + p_item + "','" + p_from_date + "','" + p_to_date + "','" + p_wh_pk_01 + "','" + p_wh_pk_02 + "','" + p_wh_pk_03 + "','" + p_wh_pk_04 + "','" + p_wh_pk_05 ;
			   para = para + "','" + p_wh_pk_06 + "','" + p_wh_pk_07 + "','" + p_wh_pk_08 + "','" + p_wh_pk_09 + "','" + p_wh_pk_10 ;
			   para = para + "','" + p_wh_pk_11 + "','" + p_wh_pk_12 + "','" + p_wh_pk_13 + "','" + p_wh_pk_14 + "','" + p_wh_pk_15 ;
			   para = para + "','" + p_wh_pk_16 + "','" + p_wh_pk_17 + "','" + p_wh_pk_18 + "','" + p_wh_pk_19 + "','" + p_wh_pk_20 + "'" ;			   
   
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_BISC00180_1", para);
        
		exSheet.Cells["E2"].Value  = p_from_date + " ~ " + p_to_date ;
		exSheet.Cells["B2"].Value  = para ;
		
		if ( dtMaster.Rows.Count > 0 )
		{
			exSheet.Cells["H4"].Value  = dtMaster.Rows[0]["wh_01_id"].ToString();
			exSheet.Cells["I4"].Value  = dtMaster.Rows[0]["wh_02_id"].ToString();
			exSheet.Cells["J4"].Value  = dtMaster.Rows[0]["wh_03_id"].ToString();
			exSheet.Cells["K4"].Value  = dtMaster.Rows[0]["wh_04_id"].ToString();
			exSheet.Cells["L4"].Value  = dtMaster.Rows[0]["wh_05_id"].ToString();
			exSheet.Cells["M4"].Value  = dtMaster.Rows[0]["wh_06_id"].ToString();
			exSheet.Cells["N4"].Value  = dtMaster.Rows[0]["wh_07_id"].ToString();
			exSheet.Cells["O4"].Value  = dtMaster.Rows[0]["wh_08_id"].ToString();
			exSheet.Cells["P4"].Value  = dtMaster.Rows[0]["wh_09_id"].ToString();
			exSheet.Cells["Q4"].Value  = dtMaster.Rows[0]["wh_10_id"].ToString();
			exSheet.Cells["R4"].Value  = dtMaster.Rows[0]["wh_11_id"].ToString();
			exSheet.Cells["S4"].Value  = dtMaster.Rows[0]["wh_12_id"].ToString();
			exSheet.Cells["T4"].Value  = dtMaster.Rows[0]["wh_13_id"].ToString();
			exSheet.Cells["U4"].Value  = dtMaster.Rows[0]["wh_14_id"].ToString();
			exSheet.Cells["V4"].Value  = dtMaster.Rows[0]["wh_15_id"].ToString();
			exSheet.Cells["W4"].Value  = dtMaster.Rows[0]["wh_16_id"].ToString();
			exSheet.Cells["X4"].Value  = dtMaster.Rows[0]["wh_17_id"].ToString();
			exSheet.Cells["Y4"].Value  = dtMaster.Rows[0]["wh_18_id"].ToString();
			exSheet.Cells["Z4"].Value  = dtMaster.Rows[0]["wh_19_id"].ToString();
			exSheet.Cells["AA4"].Value = dtMaster.Rows[0]["wh_20_id"].ToString();
		}	
        //---------

        ////end-set-----DataBind--in---Master---

        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A6"].Rows.EntireRow.Insert();//insert row new of sheet
        }
        //set data to detail.
        // loop detail not percent
		int l_pos = 5;
		int i = 0 ;
        for (i = 0; i < dtDetail.Rows.Count; i++)
        {
            exSheet.Cells[l_pos+i,1].Value = dtDetail.Rows[i]["grp_nm"].ToString(); 
			exSheet.Cells[l_pos+i,2].Value = dtDetail.Rows[i]["item_code"].ToString(); 
			exSheet.Cells[l_pos+i,3].Value = dtDetail.Rows[i]["item_name"].ToString(); 
			exSheet.Cells[l_pos+i,4].Value = dtDetail.Rows[i]["uom"].ToString(); 
			exSheet.Cells[l_pos+i,5].Value = dtDetail.Rows[i]["begin_qty"];
			exSheet.Cells[l_pos+i,6].Value = dtDetail.Rows[i]["dr_in_qty"]; 
			exSheet.Cells[l_pos+i,7].Value = dtDetail.Rows[i]["ot_in_qty"]; 
			exSheet.Cells[l_pos+i,8].Value = dtDetail.Rows[i]["tr_wh_01_qty"]; 
			exSheet.Cells[l_pos+i,9].Value = dtDetail.Rows[i]["tr_wh_02_qty"]; 
			exSheet.Cells[l_pos+i,10].Value = dtDetail.Rows[i]["tr_wh_03_qty"]; 
			exSheet.Cells[l_pos+i,11].Value = dtDetail.Rows[i]["tr_wh_04_qty"]; 
			exSheet.Cells[l_pos+i,12].Value = dtDetail.Rows[i]["tr_wh_05_qty"]; 
			exSheet.Cells[l_pos+i,13].Value = dtDetail.Rows[i]["tr_wh_06_qty"]; 
			exSheet.Cells[l_pos+i,14].Value = dtDetail.Rows[i]["tr_wh_07_qty"]; 
			exSheet.Cells[l_pos+i,15].Value = dtDetail.Rows[i]["tr_wh_08_qty"]; 
			exSheet.Cells[l_pos+i,16].Value = dtDetail.Rows[i]["tr_wh_09_qty"]; 
			exSheet.Cells[l_pos+i,17].Value = dtDetail.Rows[i]["tr_wh_10_qty"]; 
			exSheet.Cells[l_pos+i,18].Value = dtDetail.Rows[i]["tr_wh_11_qty"]; 
			exSheet.Cells[l_pos+i,19].Value = dtDetail.Rows[i]["tr_wh_12_qty"]; 
			exSheet.Cells[l_pos+i,20].Value = dtDetail.Rows[i]["tr_wh_13_qty"]; 
			exSheet.Cells[l_pos+i,21].Value = dtDetail.Rows[i]["tr_wh_14_qty"]; 
			exSheet.Cells[l_pos+i,22].Value = dtDetail.Rows[i]["tr_wh_15_qty"]; 			
			exSheet.Cells[l_pos+i,23].Value = dtDetail.Rows[i]["tr_wh_16_qty"]; 
			exSheet.Cells[l_pos+i,24].Value = dtDetail.Rows[i]["tr_wh_17_qty"]; 
			exSheet.Cells[l_pos+i,25].Value = dtDetail.Rows[i]["tr_wh_18_qty"]; 
			exSheet.Cells[l_pos+i,26].Value = dtDetail.Rows[i]["tr_wh_19_qty"]; 
			exSheet.Cells[l_pos+i,27].Value = dtDetail.Rows[i]["tr_wh_20_qty"]; 
			exSheet.Cells[l_pos+i,28].Value = dtDetail.Rows[i]["ot_out_qty"]; 
			exSheet.Cells[l_pos+i,29].Value = dtDetail.Rows[i]["end_qty"]; 
        }

        exSheet.Cells[l_pos + i, 5].Value = "=SUM(E5:E" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 6].Value = "=SUM(F5:F" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 7].Value = "=SUM(G5:G" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 8].Value = "=SUM(H5:H" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 9].Value = "=SUM(I5:I" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 10].Value = "=SUM(J5:J" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 11].Value = "=SUM(K5:K" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 12].Value = "=SUM(L5:L" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 13].Value = "=SUM(M5:M" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 14].Value = "=SUM(N5:N" + (dtDetail.Rows.Count + 4) + ")";
        exSheet.Cells[l_pos + i, 15].Value = "=SUM(O5:O" + (dtDetail.Rows.Count + 4) + ")";
		exSheet.Cells[l_pos + i, 16].Value = "=SUM(P5:P" + (dtDetail.Rows.Count + 4) + ")";
		exSheet.Cells[l_pos + i, 17].Value = "=SUM(Q5:Q" + (dtDetail.Rows.Count + 4) + ")";
		exSheet.Cells[l_pos + i, 18].Value = "=SUM(R5:R" + (dtDetail.Rows.Count + 4) + ")";
		exSheet.Cells[l_pos + i, 19].Value = "=SUM(S5:S" + (dtDetail.Rows.Count + 4) + ")";
		exSheet.Cells[l_pos + i, 20].Value = "=SUM(T5:T" + (dtDetail.Rows.Count + 4) + ")";
		exSheet.Cells[l_pos + i, 21].Value = "=SUM(U5:U" + (dtDetail.Rows.Count + 4) + ")";
		exSheet.Cells[l_pos + i, 22].Value = "=SUM(V5:V" + (dtDetail.Rows.Count + 4) + ")";
		exSheet.Cells[l_pos + i, 23].Value = "=SUM(W5:W" + (dtDetail.Rows.Count + 4) + ")";
		exSheet.Cells[l_pos + i, 24].Value = "=SUM(X5:X" + (dtDetail.Rows.Count + 4) + ")";
		exSheet.Cells[l_pos + i, 25].Value = "=SUM(Y5:Y" + (dtDetail.Rows.Count + 4) + ")";
		exSheet.Cells[l_pos + i, 26].Value = "=SUM(Z5:Z" + (dtDetail.Rows.Count + 4) + ")";
		exSheet.Cells[l_pos + i, 27].Value = "=SUM(AA5:AA" + (dtDetail.Rows.Count + 4) + ")";
		exSheet.Cells[l_pos + i, 28].Value = "=SUM(AB5:AB" + (dtDetail.Rows.Count + 4) + ")";
		exSheet.Cells[l_pos + i, 29].Value = "=SUM(AC5:AC" + (dtDetail.Rows.Count + 4) + ")";
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