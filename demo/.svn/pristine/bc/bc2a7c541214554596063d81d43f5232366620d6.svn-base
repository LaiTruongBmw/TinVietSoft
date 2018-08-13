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

public partial class rpt_hrem01100_0 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
		string p_user,p_tco_org_pk,p_thr_wgroup_pk,p_emp_search,p_status,p_relation,
			   p_start_dt,p_end_dt,p_thr_emp_pk,p_job,p_nation,p_depend,p_lang;
			
			p_user = Request["l_user"].ToString();
			p_tco_org_pk = Request["l_tco_org_pk"].ToString();
			p_thr_wgroup_pk = Request["l_wgroup_pk"].ToString();
			p_emp_search = Request["l_temp"].ToString();
			p_status = Request["l_status"].ToString();
			p_relation = Request["l_relation"].ToString();
			p_start_dt = Request["l_start_dt"].ToString();
			p_end_dt = Request["l_end_dt"].ToString();
			p_thr_emp_pk = Request["l_thr_emp_pk"].ToString();
			p_job = Request["p_job"].ToString();
			p_nation = Request["p_nation"].ToString();
			p_depend = Request["l_depend"].ToString();
			p_lang = Request["p_lang"].ToString();
		
			
        string TemplateFile;
		if(p_lang == "ENG")
		{
			TemplateFile = "rpt_hrem01100_0_eng.xls";
		}
        else
			TemplateFile = "rpt_hrem01100_0_vie.xls";
		
        string TempFile = "../../../../system/temp/rpt_hrem01100_0" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range ;


        string para = "'" + p_tco_org_pk +"','"+ p_thr_wgroup_pk + "','"+ p_emp_search 
					  + "','" +p_status + "','" + p_relation + "','" + p_start_dt 
					  + "','" + p_end_dt + "','" + p_thr_emp_pk + "','" +p_nation
					  + "','" + p_job + "','" + p_depend + "','" + p_lang + "'";
		
		DataTable dt_emp = CtlLib.TableReadOpenCursor("ST_HR_RPT_HREM01100_0", para);
		
		if (dt_emp.Rows.Count == 0)
        {
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
			if(p_start_dt != "" && p_end_dt !="")
			{
				exSheet.Cells["A2"].Value = "Từ ngày "+ dt_emp.Rows[0][0].ToString() +" Đến ngày " + dt_emp.Rows[0][1].ToString();
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
					if(IsNumeric(dt_emp.Rows[l_row][col].ToString()) && col != 4)
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