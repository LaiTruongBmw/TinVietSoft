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

public partial class rpt_hrpm00700_9 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string p_dept, p_group, p_status, p_type, p_pay_type, p_emp_id, p_work_mon, p_sal_period, p_m_type;
       
		p_dept       = Request["l_dept"].ToString();
		p_group      = Request["l_group"].ToString();
		p_status     = Request["l_status"].ToString();
		p_type       = Request["l_type"].ToString();
		p_pay_type   = Request["l_pay_type"].ToString();
		p_emp_id     = Request["l_emp_id"].ToString();
		p_work_mon   = Request["l_work_mon"].ToString();
		p_m_type 	 = Request.QueryString["l_m_type"].ToString();
        p_sal_period = Request["l_sal_period"].ToString();
		
		DateTime p_month_dt=new DateTime(int.Parse(p_work_mon.Substring(0,4).ToString()),int.Parse(p_work_mon.Substring(4,2).ToString()),1) ;

        string TemplateFile = "rpt_hrpm00700_9.xls";
        string TempFile = "../../../../system/temp/rpt_hrpm00700_9_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

         //Create a new workbook
		IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

		//Add worksheet
		IWorksheet exSheet = exBook.Worksheets[1];
		IRange range;
				
		string SQL_Code = "select num_1,num_2 from vhr_hr_code " + 
			"where id='HR0045' " +
			"order by num_1 " ;
		DataTable dt_Code = CtlLib.TableReadOpen(SQL_Code);
		int irow_code;
		irow_code = dt_Code.Rows.Count;
		if (irow_code == 0)
		{
			Response.Write("There is no data of money code");
			Response.End();
		}
		
		for (int j=0;j<irow_code;j++) //chay cac cot loai tien 
		{
			exSheet.Range[4, 5].Copy(exSheet.Range[4, 5+j], XlPasteType.xlPasteAll);
			exSheet.Cells[4, 5+j].Value = double.Parse(dt_Code.Rows[j][1].ToString());
		}
					
		//-----------------------ket loai tien--------------
		string sql_temp="";
		for (int i=1;i<=irow_code;i++)
		{
			sql_temp += ",HR_CLASSIFICATION_MONEY_DETAIL(sum(round(a.net_amt,3))," + i.ToString() + ")";
		}
		//-------------------------main sql-------------------------------
	   string SQL
		= "select a.dept_NM,  " +                                  //1
			"count(*),  " +                                             //2
			"round(sum(NVL(A.net_amt,0)),3)  ";              //54
	   SQL = SQL + sql_temp  + 
			"from thr_month_salary a " +         
			"where a.del_if=0 and a.work_mon='" + p_work_mon + "'  " +
			" and (a.tco_dept_pk in ( " +
			"                              SELECT     g.pk " +
			"                                    FROM tco_org g " +
			"                                   WHERE g.del_if = 0 " +
			"                              START WITH g.pk = " +
			"                                            DECODE ('" + p_dept + "', " +
			"                                                    'ALL', 0, " +
			"                                                    '" + p_dept + "' " +
			"                                                   ) " +
			"                              CONNECT BY PRIOR g.pk = g.p_pk) " +
			"                        OR '" + p_dept + "' = 'ALL') " +
			" and decode('" + p_group + "','ALL','ALL',a.thr_group_pk)='" + p_group + "'" +
			" and a.emp_id like '%" + p_emp_id + "%' " + 
			" and decode('" + p_status + "','ALL','ALL',a.status)='" + p_status + "'" +
			" and decode('" + p_pay_type + "','ALL','ALL',a.pay_type)='" + p_pay_type + "'" +
			" and decode('" + p_m_type + "','ALL','ALL',a.MONEY_KIND)='" + p_m_type + "'" +
			" and nvl(a.net_amt,0) " + p_type  +
            " and decode('" + p_sal_period + "','ALL','ALL',a.sal_period)='" + p_sal_period + "'" +
			" group by a.dept_nm" +
			" order by a.dept_nm" ;
		//Response.Write(SQL);
		//Response.End();
		DataTable dt_Emp = CtlLib.TableReadOpen(SQL);
		int irow_emp,icol_emp;
		irow_emp = dt_Emp.Rows.Count;
		icol_emp=dt_Emp.Columns.Count;
		if (irow_emp == 0)
		{
			Response.Write("There is no data of salary");
			Response.End();
		}
		
		//--------------------company information-----------------------
		string SQL_Com
		= "select  a.PARTNER_LNAME,a.ADDR1,a.PHONE_NO,f.data,to_char(to_date('" + p_work_mon + "','yyyymm'),'MON-YYYY'),to_char(to_date('" + p_work_mon + "','yyyymm'),'MM-YYYY') " + 
			"from tco_company a, tc_fsbinary f " +
            "where a.DEL_IF=0 and a.TCO_BPPHOTO_PK = f.pk(+) " +
			"and a.pk in ( select tco_company_pk from  " +
			"               tco_org  f " +
			"               where  f.pk IN ( " +
			"                              SELECT     g.pk " +
			"                                    FROM tco_org g " +
			"                                   WHERE g.del_if = 0 " +
			"                              START WITH g.pk = " +
			"                                            DECODE ('" + p_dept + "', " +
			"                                                    'ALL', 0, " +
			"                                                    '" + p_dept + "' " +
			"                                                   ) " +
			"                              CONNECT BY PRIOR g.pk = g.p_pk) " +
			"                        OR '" + p_dept + "' = 'ALL') " +
			"and rownum=1 " ;

		//Response.Write(SQL_Com);
		//Response.End();
		DataTable dt_Com = CtlLib.TableReadOpen(SQL_Com);
		int irow_com;
		irow_com = dt_Com.Rows.Count;
		
		
		exSheet.Cells["B1"].Value = dt_Com.Rows[0][0].ToString();
		exSheet.Cells["B2"].Value = dt_Com.Rows[0][1].ToString();
		exSheet.Cells["B3"].Value = dt_Com.Rows[0][2].ToString();
				
		MemoryStream stream;
		Bitmap b;
		if (dt_Com.Rows[0][3].ToString().Length != 0)
		{
			byte[] MyData = new byte[0];
			MyData = (byte[])dt_Com.Rows[0][3];
			stream = new MemoryStream(MyData);

			b = new Bitmap(stream);
			exSheet.Cells["A1"].Select();
			exSheet.Shapes.AddPicture(CtlLib.ResizeImage(b, 70, 70));
		}
		
		exSheet.Cells["I1"].Value = string.Format("CLASSIFICATION OF MONEY SUMMARY IN {0}",dt_Com.Rows[0][4].ToString());
		exSheet.Cells["I2"].Value = string.Format("TỔNG HỢP PHÂN LOẠI TIỀN THÁNG {0}", dt_Com.Rows[0][5].ToString());
		
		int s_row = 5;
		int s_col = 5;
		
		for (int i = 0; i < irow_emp; i++)
		{
			exSheet.Cells["A" + s_row].Value = i+1;
			exSheet.Cells["B" + s_row].Value = dt_Emp.Rows[i][0].ToString();
			exSheet.Cells["C" + s_row].Value = dt_Emp.Rows[i][1].ToString();
			exSheet.Cells["D" + s_row].Value = double.Parse(dt_Emp.Rows[i][2].ToString());
			
			s_col = 5;
			for (int j=0;j<irow_code;j++) //chay cac cot loai tien 
			{
				exSheet.Cells[s_row, 5].Copy(exSheet.Range[s_row, s_col], XlPasteType.xlPasteAll);
				exSheet.Cells[s_row, s_col].Value = double.Parse(dt_Emp.Rows[i][3+j].ToString());
				s_col++;
			}
			
			s_row++;
			if (i < irow_emp-1)
			{
				exSheet.Range["A" + s_row].Rows.EntireRow.Insert();
			}
		}	
		
		exBook.SaveAs(TempFile);
        //CtlLib.ExcelToPdf(TempFile);
        string pdfFilePath = TempFile.Replace(".xls", ".pdf");
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
        Response.WriteFile(TempFile);
        //Response.WriteFile(pdfFilePath);
        //Stop execute  
        Response.End();
    }
}
