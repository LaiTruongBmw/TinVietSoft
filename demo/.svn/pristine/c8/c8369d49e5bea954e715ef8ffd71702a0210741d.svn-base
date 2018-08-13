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

public partial class rpt_hrti01700_0 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string p_tco_org_pk = Request["l_tco_org_pk"];
		string p_work_mon = Request["l_work_mon"];
		string p_emp_id = Request["l_emp_id"];
		string p_from_dt = Request["dt_from"];
		string p_to_dt = Request["dt_to"];
		string p_nation = Request["l_nation"];
		string p_sal_period = Request["l_sal_period"];

        string TemplateFile = "rpt_hrti01700_0.xls";
        string TempFile = "../../../../system/temp/rpt_hrti01700_0_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range ;


        string para = "'" + p_emp_id + "','" + p_work_mon + "','" + p_tco_org_pk + "','" + p_nation + "','" + p_sal_period +"'" ;
		DataTable dt_detail = CtlLib.TableReadOpenCursor("ST_HR_RPT_HRTI01700_0", para);
		
		string sql_day
		= "select substr(c.car_date,-2), c.hol_type from thr_calendar c  " + 
        "where c.del_if=0  " +
        "and c.car_date between '"+ p_from_dt +"' and '"+ p_to_dt +"' " +
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
		
		int row_loop = 10;
		int l_col = dt_detail.Columns.Count -31;
		int row_emp = dt_detail.Rows.Count;
		int row_day = dt_day.Rows.Count;
		int count=0;
		
		int s_row = 9;
		int pos = 9;
		int s_col = 6;
		int temp = 0;
		int l_col_pass = 11;
		double[] grd_total = new double[l_col];
		
		exSheet.Cells["A6"].Value = "THÁNG " +dt_date.Rows[0][0];
		// do du lieu header ngay
		for(int d=0; d < dt_day.Rows.Count; d++)
		{
			exSheet.Cells[9, s_col + d].Value = dt_day.Rows[d][0].ToString();
			
		}
		
		
		
		for (int l_addrow = 1; l_addrow < dt_detail.Rows.Count; l_addrow++)
        {
            exSheet.Range[row_loop + l_addrow, 50 ].Rows.EntireRow.Insert();//insert row new of sheet
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
					if(IsNumeric(dt_detail.Rows[l_row][col].ToString()) && col != 3)
					{
						grd_total[col] += double.Parse(dt_detail.Rows[l_row][col].ToString());
						exSheet.Cells[row_loop + l_row, col].Value = double.Parse(dt_detail.Rows[l_row][col].ToString());
					}
					else 
						exSheet.Cells[row_loop + l_row, col].Value = dt_detail.Rows[l_row][col].ToString();
					
				}
				pos ++;
				
				//TO MAU CHO NHUNG NGAY OFF VA NGAY LE 
				for(int col = s_col; col < s_col + 31; col++)
				{
					if(dt_detail.Rows[l_row][col + l_col_pass + 31].ToString() == "SUN")
					{
						exSheet.Range[row_loop + l_row, col].Interior.Color = Color.SkyBlue;
					}
					if(dt_detail.Rows[l_row][col + l_col_pass + 31].ToString() == "HOL")
					{
						exSheet.Range[row_loop + l_row, col].Interior.Color = Color.Pink;
						
						if(dt_detail.Rows[l_row][col].ToString() =="" )
						{
							exSheet.Cells[row_loop + l_row, col].Value = "PH" ;
						}
					}
				
				}
			}
            //do du lieu vao grand total
			for (int k = 36; k < l_col; k++)
			{
				exSheet.Cells[pos + 1, k].Value = grd_total[k];
				exSheet.Cells[pos + 1, k].Rows.Font.Bold = true;
				
			}
				
		}  
        
		//exSheet.Cells[row_loop + count + 2, 9].Value = "Ngày "+ dt_master.Rows[0]["ins_day"].ToString() +" Tháng "+ dt_master.Rows[0]["ins_mon"].ToString() + " Năm "+ dt_master.Rows[0]["ins_year"].ToString();
		
		for (int row = 0; row < row_day; row++)
		{
			temp = 31 - row_day;
			switch (temp)
			{
				case 3:
					
					exSheet.Range["AH1"].Columns.Hidden = true;
					exSheet.Range["AI1"].Columns.Hidden = true;
					exSheet.Range["AJ1"].Columns.Hidden = true;
					break;
				case 2:
					exSheet.Range["AI1"].Columns.Hidden = true;
					exSheet.Range["AJ1"].Columns.Hidden = true;   
					break;
				case 1:
					exSheet.Range["AJ1"].Columns.Hidden = true;
					break;
			}
			switch (dt_day.Rows[row][1].ToString())
			{
				case "SUN":
					exSheet.Range[s_row , row + s_col].Interior.Color = Color.SkyBlue;
					break;

				case "HOL":
					exSheet.Range[s_row, row + s_col, s_row, row + s_col].Interior.Color = Color.Pink;
					break;
			}
		}
		
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