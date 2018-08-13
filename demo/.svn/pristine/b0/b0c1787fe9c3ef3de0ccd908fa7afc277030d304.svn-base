using System;
using System.Data;
using System.Collections.Generic;
using System.Configuration;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Drawing;
using NativeExcel;

public partial class rpt_hrti00900_0 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		CtlLib.SetUser(Session["APP_DBUSER"].ToString());
		
		string p_org ,p_workgroup, p_search,p_workshift, p_from_dt, p_to_dt, p_lang;
		
			p_org = Request["p_tco_org_pk"].ToString();
			p_workgroup = Request["p_group"].ToString();
			p_search = Request["p_search"].ToString();
			p_workshift = Request["p_ws"].ToString();
			p_from_dt = Request["p_fromdt"].ToString();
			p_to_dt = Request["p_todt"].ToString();			
			p_lang = Request["p_lang"].ToString();
		
		string TemplateFile;
		
		if(p_lang == "ENG")			
			TemplateFile = "rpt_hrti00900_0_eng.xls";
		else
			TemplateFile = "rpt_hrti00900_0_vie.xls";
		
        string TempFile = "../../../../system/temp/rpt_hrti00400_9_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
		IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);
		
		 IWorksheet exSheet = exBook.Worksheets[1];

        IRange range ;

        string para = "'" + p_org + "','" + p_workgroup + "','" + p_search + "','" + p_workshift + "','" + p_from_dt + "','" + p_to_dt + "'";
		
		DataTable dt_emp = CtlLib.TableReadOpenCursor("ST_HR_RPT_HRTI00900_0", para);
		
		if (dt_emp.Rows.Count == 0)
        {
			if(p_lang == "ENG")
				Response.Write("There is no data!");
			else
				Response.Write("Không có dữ liệu!");
            Response.End();
        }
			
		int row_loop = 4;
		int l_col = dt_emp.Columns.Count;
		int count=0;
		for (int l_addrow = 1; l_addrow < dt_emp.Rows.Count; l_addrow++)
        {
            exSheet.Range[row_loop + l_addrow, 1 ].Rows.EntireRow.Insert();//insert row new of sheet
        }
			if(p_from_dt != "" && p_to_dt !="")
			{
				if(p_lang == "ENG")
					exSheet.Cells["A2"].Value = "From Date "+ dt_emp.Rows[0][0].ToString() + " -----" +" To Date " + dt_emp.Rows[0][1].ToString();
				else
					exSheet.Cells["A2"].Value = "Từ ngày "+ dt_emp.Rows[0][0].ToString() + " -----" +" Đến ngày " + dt_emp.Rows[0][1].ToString();
			}
		// xu ly du lieu do vao excel
		if (dt_emp.Rows.Count > 0)
		{
			for (int l_row = 0; l_row < dt_emp.Rows.Count; l_row++)
			{               
                count++;
                exSheet.Cells[row_loop + l_row, 1].Value = count;
                // do du lieu vao cac dong 
				for (int col = 2; col < l_col; col++)
				{
					if(IsNumeric(dt_emp.Rows[l_row][col].ToString()) && col != 3)
					{
						exSheet.Cells[row_loop + l_row, col].Value = double.Parse(dt_emp.Rows[l_row][col].ToString());
					}
					else 
						exSheet.Cells[row_loop + l_row, col].Value = dt_emp.Rows[l_row][col].ToString();							
				}				
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
