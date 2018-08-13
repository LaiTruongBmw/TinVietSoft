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

public partial class rpt_bisc00171_ST03 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString()); 
		//CtlLib.SetUser("SALE"); 
		
        string TemplateFile = "rpt_bisc00171_ST03.xls";
        string TempFile = "../../../../system/temp/rpt_bisc00171_ST03_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
         
        string p_lang 			= Request.QueryString["p_lang"];
        string p_wh_name 		= Request.QueryString["p_wh_name"];
		string p_wh_type 		= Request.QueryString["p_wh_type"];
        string p_wh_pk 			= Request.QueryString["p_wh_pk"]; 
        string p_item_group_pk 	= Request.QueryString["p_item_group_pk"];
		string p_item_group_nm 	= Request.QueryString["p_item_group_nm"];
        string p_item 			= Request.QueryString["p_item"];
        string p_date 			= Request.QueryString["p_date"];     

        
		
		string SQL_WH
		= "select b.wh_type a0,wh_t.code_nm a1" + 
        " from tlg_lg_wh_item_group a,tlg_in_warehouse b,tlg_it_itemgrp c " +
        ",(SELECT   a.code, a.code_nm FROM tlg_lg_code a WHERE a.del_if = 0 AND tlg_lg_code_group_pk = '14') wh_t " +
        "where a.del_if=0 and b.del_if=0 and c.del_if=0 " +
        "and A.TLG_IN_WAREHOUSE_PK=b.pk " +
        "and A.TLG_IT_ITEMGRP_PK=c.pk " +
        "and c.pk='" + p_item_group_pk + "' " +
		"and (b.wh_type = '" + p_wh_type + "' or '" + p_wh_type + "' is null)" +
        "and wh_t.code=b.wh_type " +
        "group by b.wh_type,wh_t.code_nm order by a0,a1" ;


		DataTable dt_WH = CtlLib.TableReadOpen(SQL_WH);
		int i_row_wh=dt_WH.Rows.Count;
		if (i_row_wh==0)
		{
			Response.Write("There is no data of warehouse type");
			Response.End();
		}
		string SQL
	= "select max(t.item_code) a0 " +
	",max(t.item_name) a1 " +
	 ",lg_f_get_spec_nm_by_seq(a1.tlg_it_item_pk,1) " +
	 ",lg_f_get_spec_nm_by_seq(a1.tlg_it_item_pk,2) " +
	 ",lg_f_get_spec_nm_by_seq(a1.tlg_it_item_pk,3) " +
	 ",(select sum(g.min_qty) from TLG_IT_SECURE g where g.del_if=0 and g.tlg_it_item_pk=a1.tlg_it_item_pk and (TLG_IN_WAREHOUSE_PK='" + p_wh_pk + "' or '" + p_wh_pk + "' is null ) ) " ;
	    for (int i=0;i<dt_WH.Rows.Count;i++)
		{
			SQL=SQL+ "                               ,sum(decode(a1.wh_type,'" + dt_WH.Rows[i][0].ToString() + "',a1.end_qty)) wh_" + dt_WH.Rows[i][0].ToString()  ;
		}
        SQL=SQL +
        "                               from ( " +
        "                                 select wh.wh_type " +
        "                                ,wh.pk " +
        "                                ,tr.tlg_it_item_pk " +
        "                                ,tr.end_qty " +
        "                                    from (SELECT tlg_in_warehouse_pk, " +
        "                                           tlg_it_item_pk, " +
        "                                           nvl(SUM (begin_qty),0) + nvl(SUM (in_qty),0) - nvl(SUM (out_qty),0) end_qty " +
        "                                      FROM (SELECT a.tlg_in_warehouse_pk, " +
        "                                                   b.tlg_it_item_pk, " +
        "                                                   b.end_qty begin_qty, " +
        "                                                   NULL in_qty, " +
        "                                                   NULL out_qty " +
        "                                              FROM tlg_sa_stock_closing_m a, " +
        "                                                   tlg_sa_stock_closing_d b,tlg_it_item c " +
        "                                             WHERE     a.del_if = 0 and c.del_if=0 and b.tlg_it_item_pk=c.pk" +
        "                                                   AND (a.tlg_in_warehouse_pk, " +
        "                                                        a.stock_date) IN " +
        "                                                          (  SELECT b.tlg_in_warehouse_pk, " +
        "                                                                    MAX ( " +
        "                                                                       b.stock_date) " +
        "                                                               FROM tlg_sa_stock_closing_m b " +
        "                                                              WHERE     b.del_if = 0 " +
        "                                                                    AND b.stock_date < " +
        "                                                                           '" + p_date + "' " +
        "                                                           GROUP BY b.tlg_in_warehouse_pk) " +
        "                                                   AND b.del_if = 0 " +
        "                                                   AND a.pk = " +
        "                                                          b.tlg_sa_stock_closing_m_pk " +
		"													and (c.tlg_it_itemgrp_pk = '" + p_item_group_pk + "' or '" + p_item_group_pk + "' is null) " + 
        "                                                   AND NVL (b.end_qty, 0) <> 0 " +
        "                                            UNION ALL " +
        "                                            SELECT a.tlg_in_warehouse_pk, " +
        "                                                   a.tlg_it_item_pk, " +
        "                                                   NULL begin_qty, " +
        "                                                   a.input_qty in_qty, " +
        "                                                   a.output_qty out_qty " +
        "                                              FROM tlg_in_stocktr a,tlg_it_item b " +
        "                                             WHERE     a.del_if = 0 and b.del_if=0 and a.tlg_it_item_pk=b.pk " +
        "                                                   AND a.tr_date > " +
        "                                                          NVL ( " +
        "                                                             (SELECT MAX ( " +
        "                                                                        b.stock_date) " +
        "                                                                FROM tlg_sa_stock_closing_m b " +
        "                                                               WHERE     b.del_if = " +
        "                                                                            0 " +
        "                                                                     AND b.stock_date < " +
        "                                                                            '" + p_date + "' " +
        "                                                                     AND b.tlg_in_warehouse_pk = " +
        "                                                                            a.tlg_in_warehouse_pk), " +
        "                                                             '0') " +
        "													and (b.tlg_it_itemgrp_pk = '" + p_item_group_pk + "' or '" + p_item_group_pk + "' is null) " + 
        "                                                   AND a.tr_date <= '" + p_date + "')  " +
		"                                  GROUP BY tlg_in_warehouse_pk, " +
        "                                           tlg_it_item_pk ) tr,tlg_in_warehouse wh " +
        "                                  where wh.del_if=0  " +
		"								   and (wh.wh_type ='" + p_wh_type + "' or '" + p_wh_type + "' is null) " +
		"								   and (wh.pk ='" + p_wh_pk + "' or '" + p_wh_pk + "' is null) " +
        "                                  and tr.tlg_in_warehouse_pk =wh.pk)a1,tlg_it_item t  " +
		"                                  where t.del_if=0 and a1.tlg_it_item_pk=t.pk  " +
        "                            group by a1.tlg_it_item_pk order by a0     " +
        "                                   " ;
		//Response.Write(SQL);
			//Response.End();
        DataTable dt_Detail = CtlLib.TableReadOpen(SQL);
		
        int i_row=dt_Detail.Rows.Count;
		int i_col=dt_Detail.Columns.Count;
		if (i_row==0)
		{
			Response.Write("There is no data!");
			Response.End();
		}
		exSheet.Cells["E3"].Value = p_item_group_nm;
		exSheet.Range["A1:A" + (i_col+2)].Columns.Merge();
		//exSheet.Cells["A1"].Value = "END STOCK BY ITEM GROUP";
		exSheet.Cells["E5"].Value = p_date.Substring(6,2)+ "/" + p_date.Substring(4,2) + "/" + p_date.Substring(0,4) ;
        //---------
       
        ////end-set-----DataBind--in---Master---
		int i_header_row=7;
		int i_header_col=8;
		int i_b_row=9;
		Double[] grant_total = new Double[i_col+1];
		Double sub_total=0;
		//-------------bind header--------------
		for (int i=0;i<i_row_wh;i++)
		{
			if (i!=0)
				exSheet.Range[i_header_row, i_header_col+i,i_header_row, i_header_col+i].Columns.EntireColumn.Insert();//insert row new of sheet
			exSheet.Range[i_header_row, i_header_col+i,i_header_row, i_header_col+i].Value=dt_WH.Rows[i][1].ToString();
		}
        //insert new row
		for (int i= 1; i < i_row; i++)
		{
			exSheet.Range["A" + (i_b_row + i)].EntireRow.Insert();
		}        
		for (int i=0;i<i_col+1;i++)
			grant_total[i] = 0;
		for (int i=0;i<i_row;i++)
		{
			sub_total=0;
			exSheet.Range[i_b_row + i,1,i_b_row + i,1].Value=i+1;
			for (int j=0;j<i_col;j++)
			{
				if (j<=5)
					exSheet.Range[i_b_row +i ,2+j,i_b_row + i,j+2].Value=dt_Detail.Rows[i][j].ToString();
				else
				{
					if (dt_Detail.Rows[i][j].ToString()!="")
					{
						exSheet.Range[i_b_row +i ,2+j,i_b_row + i,j+2].Value=Double.Parse(dt_Detail.Rows[i][j].ToString());
						sub_total+=Double.Parse(dt_Detail.Rows[i][j].ToString());
						grant_total[j] += Double.Parse(dt_Detail.Rows[i][j].ToString());
					}
				}
			}
			exSheet.Range[i_b_row + i,2+i_col,i_b_row + i,2+i_col].Value = sub_total;
			grant_total[i_col]+=sub_total;
			if (sub_total!=0 && dt_Detail.Rows[i][5].ToString()!="")
				exSheet.Range[i_b_row + i,3+i_col,i_b_row + i,3+i_col].Value = Double.Parse(dt_Detail.Rows[i][5].ToString())/sub_total;
			else
				exSheet.Range[i_b_row + i,3+i_col,i_b_row + i,3+i_col].Value = 0;
			
		}
		for (int j=6;j<i_col+1;j++)
			exSheet.Range[i_b_row +i_row ,2+j,i_b_row + i_row,j+2].Value=grant_total[j];
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