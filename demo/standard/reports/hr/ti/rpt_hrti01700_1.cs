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

public partial class rpt_hrti01700_1 : System.Web.UI.Page
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

        string TemplateFile = "rpt_hrti01700_1.xls";
        string TempFile = "../../../../system/temp/rpt_hrti01700_1_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        List<IWorksheet> listWB = new List<IWorksheet>();

        //Add worksheet
        IWorksheet exSheet;

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
		
		string sql_org
		= "select b.pk, substr(b.org_nm, 1, 30) org_nm from thr_work_month a, tco_org b " + 
			"where a.del_if=0 and b.del_if=0 " +
			"and a.outlet_pk = b.pk " +
			"and a.work_mon = '" + p_work_mon + "' " +
			"and (a.emp_id = '" + p_emp_id + "' or '" + p_emp_id + "' is null) " +
			"and a.outlet_pk in ( select  g.pk " +
			"                                from tco_org g " +
			"                               where g.del_if = 0 " +
			"                          start with g.pk =(case when '" + p_tco_org_pk  +"'='ALL' then g.pk else to_number('" + p_tco_org_pk  +"') end) " +
			"                          connect by prior g.pk = g.p_pk) " +
			"group by b.pk, b.org_nm " +
			"order by b.org_nm " ;
		
		DataTable dt_org = CtlLib.TableReadOpen(sql_org);

        int count_org = dt_org.Rows.Count;
        string sheet_nm = string.Empty;
		
		int row_loop = 7;
		
		for (int i = 0; i < count_org; i++)
        {
            //Create a new workbook
            exBook.Worksheets.Add();

            //Add worksheet
            exSheet = exBook.Worksheets[i + 1];

            if (i < dt_org.Rows.Count)
            {
                sheet_nm = dt_org.Rows[i][1].ToString();
	
                exSheet.Name = sheet_nm;
                listWB.Add(exSheet);
            }
            if (i == 0)
            {


                listWB[0].Cells["A6"].Value = string.Format("THÁNG {0} ", dt_date.Rows[0][0]);
				
				IInterior interior = listWB[0].Cells["E5:E5"].Interior;
				interior.Color = System.Drawing.Color.FromArgb(0, 204, 204);
                //listWB[0].Cells["A3"].Value = "Bộ phận: " + sheet_nm;

				/*
                for (int j = 0; j < dt_cal.Rows.Count; j++) //to mau cn cho dong tieu de
                {
                    int tmp = int.Parse(dt_cal.Rows[j][0].ToString()) + 4;
                    if(dt_cal.Rows[j][1].ToString()=="HOL")
                        listWB[0].Cells[row_loop - 1, tmp].Rows.Font.Color = Color.FromArgb(255, 000, 000);
                    else
                        listWB[0].Cells[row_loop - 1, tmp].Interior.Color = Color.FromArgb(141, 180, 226);

                    
                    
                } */

            }
            else
            {
                listWB[0].Range["A1:AT30"].Copy(listWB[i].Range["A1:AT30"], XlPasteType.xlPasteAll);
                listWB[i].Cells["A6"].Value = string.Format("THÁNG {0} ", dt_date.Rows[0][0]);
                //listWB[i].Cells["E5"].Rows.Font.Color = Color.FromArgb(0, 153, 153);
                listWB[i].Cells["A1"].Rows.RowHeight = 20.25;
                listWB[i].Cells["A2"].Rows.RowHeight = 15.75;
                listWB[i].Cells["A3"].Rows.RowHeight = 18;
                listWB[i].Cells["A4"].Rows.RowHeight = 15;
                listWB[i].Cells["A5"].Rows.RowHeight = 22.5;
                listWB[i].Cells["A6"].Rows.RowHeight = 42;
				
				IInterior interior = listWB[i].Cells["E5:E5"].Interior;
				interior.Color = System.Drawing.Color.FromArgb(0, 204, 204);
	/*
                listWB[i].FreezePanes = listWB[0].FreezePanes;
                listWB[i].PageSetup.LeftMargin = listWB[0].PageSetup.LeftMargin;
                listWB[i].PageSetup.Orientation = listWB[0].PageSetup.Orientation;
                listWB[i].PageSetup.FitToPagesWide = 1;
                listWB[i].Zoom = 120;
                listWB[i].PageSetup.PrintTitleRows = listWB[0].PageSetup.PrintTitleRows;
                listWB[i].PageSetup.RightMargin = listWB[0].PageSetup.RightMargin;
                listWB[i].PageSetup.HeaderMargin = listWB[0].PageSetup.HeaderMargin;
                listWB[i].PageSetup.FooterMargin = listWB[0].PageSetup.FooterMargin;
                listWB[i].PageSetup.FitToPages = true;
                listWB[i].PageSetup.CenterFooter = listWB[0].PageSetup.CenterFooter;
                listWB[i].PageSetup.PaperSize = listWB[0].PageSetup.PaperSize;
                listWB[i].PageSetup.TopMargin = listWB[0].PageSetup.TopMargin;
                listWB[i].PageSetup.CenterHorizontally = listWB[0].PageSetup.CenterHorizontally;
			*/
            }
			
			// do du lieu header ngay
			for(int d=0; d < dt_day.Rows.Count; d++)
			{
				listWB[i].Cells[6, 5 + d].Value = dt_day.Rows[d][0].ToString();
				
			}
        }
		
		// binding data
        string SQL_EMP = string.Empty;
        long outlet_pk;
        for (int i = 0; i < count_org; i++)
        {
            outlet_pk = long.Parse(dt_org.Rows[i][0].ToString());

			SQL_EMP
			= "select 0, " + 
			"              1, " +
			"              a.emp_id, " +
			"              e.full_name, " +
			"              (select initcap(v.code_nm) from vhr_hr_code v where v.id='HR0008' and v.code = a.pos_type ), " +
			"              nullif(a.wt1,'0'), " +
			"              nullif(a.wt2,'0'), " +
			"              nullif(a.wt3,'0'), " +
			"              nullif(a.wt4,'0'), " +
			"              nullif(a.wt5,'0'), " +
			"              nullif(a.wt6,'0'), " +
			"              nullif(a.wt7,'0'), " +
			"              nullif(a.wt8,'0'), " +
			"              nullif(a.wt9,'0'), " +
			"              nullif(a.wt10,'0'), " +
			"              nullif(a.wt11,'0'), " +
			"              nullif(a.wt12,'0'), " +
			"              nullif(a.wt13,'0'), " +
			"              nullif(a.wt14,'0'), " +
			"              nullif(a.wt15,'0'), " +
			"              nullif(a.wt16,'0'), " +
			"              nullif(a.wt17,'0'), " +
			"              nullif(a.wt18,'0'), " +
			"              nullif(a.wt19,'0'), " +
			"              nullif(a.wt20,'0'), " +
			"              nullif(a.wt21,'0'), " +
			"              nullif(a.wt22,'0'), " +
			"              nullif(a.wt23,'0'), " +
			"              nullif(a.wt24,'0'), " +
			"              nullif(a.wt25,'0'), " +
			"              nullif(a.wt26,'0'), " +
			"              nullif(a.wt27,'0'), " +
			"              nullif(a.wt28,'0'), " +
			"              nullif(a.wt29,'0'), " +
			"              nullif(a.wt30,'0'), " +
			"              nullif(a.wt31,'0'), " +
			"              nullif(round(nvl(a.total_wd, 0) + nvl(a.total_hol, 0), 2), 0), " +
			"              nullif(round(nvl(a.abs1_pay, 0)/8, 2), 0),  " +
			"              nullif(round(nvl(a.abs2_pay, 0)/8, 2), 0),  " +
			"              nullif(round(nvl(a.abs3_pay, 0)/8, 2), 0),  " +
			"              nullif(round(nvl(a.abs4_pay, 0)/8, 2), 0),  " +
			"              nullif((round(nvl(a.total_wd, 0) + nvl(a.total_hol, 0), 2) + round(nvl(a.abs1_pay, 0)/8, 2) + round(nvl(a.abs2_pay, 0)/8, 2) " +
			"                                                    + round(nvl(a.abs3_pay, 0)/8, 2) + round(nvl(a.abs4_pay, 0)/8, 2)), 0) as total_day_wt_abs, " +
			"              nullif(nvl(a.total_ot, 0) , 0) ,                                       " +
			"              nullif(nvl(a.total_st, 0) + nvl(a.total_ost, 0) , 0) , " +
			"              nullif(nvl(a.total_ht, 0) + nvl(a.total_oht, 0) , 0) , " +
			"              nullif(round((nvl(a.total_rate_ot, 0) + nvl(a.total_rate_st, 0) + nvl(a.total_rate_ost, 0) + nvl(a.total_rate_ht, 0) + nvl(a.total_rate_oht, 0))/8, 2), 0) total_day_ot, " +
			"              nullif((round(nvl(a.total_wd, 0) + nvl(a.total_hol, 0), 2) + round(nvl(a.abs1_pay, 0)/8, 2) + round(nvl(a.abs2_pay, 0)/8, 2) " +
			"                                                    + round(nvl(a.abs3_pay, 0)/8, 2) + round(nvl(a.abs4_pay, 0)/8, 2)) " +
			"                      + round((nvl(a.total_rate_ot, 0) + nvl(a.total_rate_st, 0) + nvl(a.total_rate_ost, 0) + nvl(a.total_rate_ht, 0) + nvl(a.total_rate_oht, 0))/8, 2)                              " +
			"                     , 0) as total_day_wt_abs_ot " +
			"       from thr_work_month a, tco_org o, thr_employee e " +
			"       where a.del_if=0 and o.del_if=0 and e.del_if=0 " +
			"       and a.thr_emp_pk = e.pk " +
			"       and a.tco_org_pk = o.pk " +
			"       and a.work_mon = '" + p_work_mon + "' " +
			"		and a.outlet_pk ='" + outlet_pk + "' " +
			"		and (a.emp_id = '" + p_emp_id + "' or '" + p_emp_id + "' is null) " +
			"       and decode('" + p_nation + "','ALL','ALL',e.nation )= '" + p_nation + "' " +
			"       and a.sal_period  = '" + p_sal_period + "' " +
			"       order by a.work_mon, a.emp_id " ;
			
			DataTable dt_detail;
			dt_detail = CtlLib.TableReadOpen(SQL_EMP);
			
			int col_emp = dt_detail.Columns.Count;
			int row_emp = dt_detail.Rows.Count;
			int count=0;
			for (int l_addrow = 1; l_addrow < dt_detail.Rows.Count; l_addrow++)
			{
				listWB[i].Range[row_loop + l_addrow, 50 ].Rows.EntireRow.Insert();//insert row new of sheet
				
			}

			// xu ly du lieu do vao excel
			if (dt_detail.Rows.Count > 0)
			{
				for (int l_row = 0; l_row < dt_detail.Rows.Count; l_row++)
				{
					
					count++;
					listWB[i].Cells[row_loop + l_row, 1].Value = count;
						
					// do du lieu vao cac dong 
					for (int col = 2; col < col_emp; col++)
					{
						if(IsNumeric(dt_detail.Rows[l_row][col].ToString()) && col != 2)
						{
							listWB[i].Cells[row_loop + l_row, col].Value = double.Parse(dt_detail.Rows[l_row][col].ToString());
						}
						else 
							listWB[i].Cells[row_loop + l_row, col].Value = dt_detail.Rows[l_row][col].ToString();
						
					}
					
				}
				
					
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