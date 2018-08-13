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

public partial class rpt_hrem01600_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string p_tco_org_pk,p_emp_search,p_probation_type,p_contract_type,p_have_appendix,p_from_date,p_to_date,p_status,p_lang, p_select_date;
     
		p_tco_org_pk 		 = Request["p_tco_org_pk"].ToString();
		p_emp_search         = Request["p_emp_search"].ToString();
		p_select_date        = Request["p_select_date"].ToString();
		p_from_date  		 = Request["p_from_date"].ToString();
		p_to_date  		 	 = Request["p_to_date"].ToString();
		p_contract_type      = Request["p_contract_type"].ToString();
		p_probation_type     = Request["p_probation_type"].ToString();
		p_status 			 = Request["p_status"].ToString();
		p_have_appendix		 = Request["p_have_appendix"].ToString();
		p_lang 			 	 = Request["p_lang"].ToString();

		string TemplateFile;
		if(p_lang == "ENG")
		{
			TemplateFile = "rpt_hrem01600_1_eng.xls";
		}
        else
			TemplateFile = "rpt_hrem01600_1_vie.xls";
		
        string TempFile = "../../../../system/temp/rpt_hrem01600_1_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range ;


        string para = "'" + p_emp_search + "','" + p_select_date + "','" + p_from_date + "','"+ p_to_date  + "','" + p_tco_org_pk + "','" + p_probation_type + "','" + p_contract_type + "','"+ p_status + "','"+ p_have_appendix +"','" + p_lang +"'";
		
       
		
		DataTable dt_emp = CtlLib.TableReadOpenCursor("ST_HR_RPT_HREM01600_1", para);
		
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