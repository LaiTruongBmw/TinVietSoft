using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing;
using NativeExcel;

public partial class rpt_hrti00400_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
		string p_tco_org_pk, p_wg, p_from, p_to, p_txtID, p_work_mon,p_lang;
			
			p_tco_org_pk = Request["p_tco_org_pk"].ToString();
			p_wg = Request["p_wg"].ToString();
			p_from = Request["p_from_dt"].ToString();
			p_to = Request["p_to_dt"].ToString();
			p_txtID = Request["p_emp_search"].ToString();
			p_work_mon = Request["p_month"].ToString();
			p_lang = Request["p_lang"].ToString();
        
		string TemplateFile;
		
		if(p_lang == "ENG")			
			TemplateFile = "rpt_hrti00400_2_eng.xls";
		else
			TemplateFile = "rpt_hrti00400_2_vie.xls";
		
        string TempFile = "../../../../system/temp/rpt_hrti00400_2_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
         IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range ;


        string para = "'" + p_tco_org_pk + "','" + p_wg + "','" + p_work_mon + "','" + p_from + "','" + p_to + "','" + p_txtID +"'" ;
		DataTable dt_detail = CtlLib.TableReadOpenCursor("ST_HR_RPT_HRTI00400_2", para);

		string sql_day
		= "select substr(c.car_date,-2), c.hol_type from thr_calendar c  " + 
        "where c.del_if=0  " +
        "and c.car_date between '"+ p_from +"' and '"+ p_to +"' " +
        "and c.tco_company_pk = (select g.tco_company_pk " +
        "                                       from tco_org g " +
        "                                      where g.del_if = 0 and g.pk = '" + p_tco_org_pk  +"') " +
		" order by c.car_date ";
		
        DataTable dt_day = CtlLib.TableReadOpen(sql_day);
		
		string sql_date
		= "select  " + 
			"    to_char(to_date('"+ p_work_mon +"', 'yyyymm'), 'mm yyyy')  " +
			"  from dual " ;
			
		DataTable dt_date = CtlLib.TableReadOpen(sql_date);
				
		if (dt_detail.Rows.Count == 0)
        {
			Response.Write("Không có dữ liệu!");
            Response.End();
        }
		int row_loop = 5;
		int l_col = dt_detail.Columns.Count -31;
		int row_emp = dt_detail.Rows.Count;
		int row_day = dt_day.Rows.Count;
		int count=0;
		
		int s_row = 4;
		int pos = 4;
		int s_col = 8;
		int temp = 0;
		int l_col_pass = 6;
		
		for(int d=0; d < dt_day.Rows.Count; d++)
		{
			exSheet.Cells[4, s_col + d].Value = dt_day.Rows[d][0].ToString();
			
		}
		for (int l_addrow = 1; l_addrow < dt_detail.Rows.Count; l_addrow++)
        {
            exSheet.Range[row_loop + l_addrow, 1 ].Rows.EntireRow.Insert();//insert row new of sheet
        }
			if(p_from != "" && p_to !="")
			{
				if(p_lang == "ENG")
					exSheet.Cells["A2"].Value = "From Date "+ dt_detail.Rows[0][0].ToString() + " -----" +" To Date " + dt_detail.Rows[0][1].ToString();
				else
					exSheet.Cells["A2"].Value = "Từ ngày "+ dt_detail.Rows[0][0].ToString() + " -----" +" Đến ngày " + dt_detail.Rows[0][1].ToString();
			}
		// xu ly du lieu do vao excel
		if (dt_detail.Rows.Count > 0)
		{
			for (int l_row = 0; l_row < dt_detail.Rows.Count; l_row++)
			{
                
                count++;
                exSheet.Cells[row_loop + l_row, 1].Value = count;
                // do du lieu vao cac dong 
				for (int col = 2; col < l_col; col++)
				{
					if(IsNumeric(dt_detail.Rows[l_row][col].ToString()) && col != 2)
					{
						exSheet.Cells[row_loop + l_row, col].Value = double.Parse(dt_detail.Rows[l_row][col].ToString());
					}
					else 
						exSheet.Cells[row_loop + l_row, col].Value = dt_detail.Rows[l_row][col].ToString();
							
				}
				pos ++;
				for(int col = s_col; col < s_col + 31; col++)
				{
					if(dt_detail.Rows[l_row][col + 31].ToString() == "SUN")
					{
						exSheet.Range[row_loop + l_row, col].Interior.Color = Color.SkyBlue;
					}
					if(dt_detail.Rows[l_row][col + 31].ToString() == "HOL")
					{
						exSheet.Range[row_loop + l_row, col].Interior.Color = Color.Pink;
						
						if(dt_detail.Rows[l_row][col].ToString() =="" )
						{
							exSheet.Cells[row_loop + l_row, col].Value = "PH" ;
						}
					}
				
				}
				
			}
            
				
		}  
        for (int row = 0; row < row_day; row++)
		{
			temp = 31 - row_day;
			switch (temp)
			{
				case 3:
					
					exSheet.Range["AJ1"].Columns.Hidden = true;
					exSheet.Range["AK1"].Columns.Hidden = true;
					exSheet.Range["AL1"].Columns.Hidden = true;
					break;
				case 2:
					exSheet.Range["AK1"].Columns.Hidden = true;
					exSheet.Range["AL1"].Columns.Hidden = true;   
					break;
				case 1:
					exSheet.Range["AL1"].Columns.Hidden = true;
					break;
			}
			switch (dt_day.Rows[row][1].ToString())
			{
				case "SUN":
					exSheet.Range[s_row , row + s_col].Interior.Color = Color.Green;
					break;

				case "HOL":
					exSheet.Range[s_row, row + s_col, s_row, row + s_col].Interior.Color = Color.Pink;
					break;
			}
		}
		
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
	public static bool IsNumeric(string strNum)
    {
        try
        {
            double tmp = double.Parse(strNum);
            return true;
        }
        catch
        {
            return false;
        }
    }
}