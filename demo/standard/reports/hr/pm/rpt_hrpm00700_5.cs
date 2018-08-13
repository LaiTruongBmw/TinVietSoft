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

public partial class rpt_hrpm00700_5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string p_dept, p_group, p_status, p_type, p_pay_type, p_emp_id, p_work_mon, p_times, p_m_type, p_sal_period;

        p_dept = Request["l_dept"].ToString();
        p_group = Request["l_group"].ToString();
        p_status = Request["l_status"].ToString();
        p_type = Request["l_type"].ToString();
        p_pay_type = Request["l_pay_type"].ToString();
        p_emp_id = Request["l_emp_id"].ToString();
        p_work_mon = Request["l_work_mon"].ToString();
        p_sal_period = Request["l_sal_period"].ToString();
        p_m_type = Request.QueryString["l_m_type"].ToString();

        string TemplateFile = "rpt_hrpm00700_5.xls";
        string TempFile = "../../../../system/temp/rpt_hrpm00700_5_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

         //Create a new workbook
		IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

		//Add worksheet
		IWorksheet exSheet = exBook.Worksheets[1];
		IRange range;
		DataTable myDT;
		string SQL = "";
		/*
		myDT = new DataTable();
		SQL = "SELECT TO_CHAR(SYSDATE,'dd/mm/yyyy') FROM DUAL";
		myDT = CtlLib.TableReadOpen(SQL);
		exSheet.Cells["A2"].Value = string.Format("(SALARY CYCLE: TO 26/07/2012 25/08/2012)", myDT.Rows[0][0].ToString());
		*/
		
		myDT = new DataTable();
		string SQL_Com = "select  a.PARTNER_LNAME,a.ADDR1,a.PHONE_NO,f.data,to_char(to_date('" + p_work_mon + "','yyyymm'),'MON-YYYY'),to_char(to_date('" + p_work_mon + "','yyyymm'),'MM-YYYY') " + 
			"from tco_company a, tc_fsbinary f " +
			"where a.DEL_IF=0 and a.TCO_BPPHOTO_PK = f.pk " +
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

		DataTable dt_Com = CtlLib.TableReadOpen(SQL_Com);
		int irow_com;
		irow_com = dt_Com.Rows.Count;
		
							
		MemoryStream stream;
		Bitmap b;
		if (dt_Com.Rows[0][3].ToString().Length != 0)
		{
			byte[] MyData = new byte[0];
			MyData = (byte[])dt_Com.Rows[0][3];
			stream = new MemoryStream(MyData);

			b = new Bitmap(stream);
			exSheet.Cells["A1"].Select();
			exSheet.Shapes.AddPicture(CtlLib.ResizeImage(b, 100, 70));
		}
		exSheet.Cells["B1"].Value = dt_Com.Rows[0][0].ToString();
		exSheet.Cells["B2"].Value = dt_Com.Rows[0][1].ToString();
		exSheet.Cells["E1"].Value = string.Format("SEVERANCE AMOUNT SUMMARY IN {0}",  dt_Com.Rows[0][4].ToString());
		exSheet.Cells["E2"].Value = string.Format("TỔNG TIỀN TRỢ CẤP THÔI VIỆC THÁNG {0}",  dt_Com.Rows[0][5].ToString());
		exSheet.Cells["B3"].Value = string.Format("Phone: {0}",  dt_Com.Rows[0][2].ToString());		
		
		SQL	= "select a.THR_GROUP_NM,  " +                                  //1
        "A.EMP_ID,  " +                                             //2
        "A.FULL_NAME,  " +                                          //3
        "to_char(to_date(A.JOIN_DT,'yyyymmdd'),'dd/mm/yyyy'),  " +  //4
        "A.POS_NM,  " +                                             //6
        "NVL(A.SALARY_LEVEL1,0),  " +                               //7
        "NVL(A.SALARY_LEVEL2,0),  " +                               //8
        "round(NVL(A.severance_month,3)),  " +                                 //53
        "round(NVL(A.severance_amt,3))  " +                           //54
        "from thr_month_salary a " +         
        "where a.del_if=0 and a.work_mon='" + p_work_mon + "' " +
		"and NVL(A.severance_amt,0) > 0 " +
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
        " and nvl(a.net_amt,0) " + p_type  + " and rownum <=10 " +
        "order by a.dept_nm,a.thr_group_nm,a.emp_id" ;

		//Response.Write(SQL);
		//Response.End();
		DataTable dt_Emp = CtlLib.TableReadOpen(SQL);
		int irow_emp,icol_emp;
		irow_emp = dt_Emp.Rows.Count;
		icol_emp = dt_Emp.Columns.Count;
		if (irow_emp == 0)
		{
			Response.Write("There is no data of salary");
			Response.End();
		}
		
		double tt_1 = 0, tt_2 = 0, tt_3 = 0, tt_4 = 0;
		
		int s_row = 6;
		for (int i = 0; i < dt_Emp.Rows.Count; i++)
		{
			exSheet.Cells["A" + s_row].Value = i+1;
			exSheet.Cells["B" + s_row].Value = dt_Emp.Rows[i][0].ToString();
			exSheet.Cells["C" + s_row].Value = dt_Emp.Rows[i][1].ToString();
			exSheet.Cells["D" + s_row].Value = dt_Emp.Rows[i][2].ToString();
			exSheet.Cells["E" + s_row].Value = dt_Emp.Rows[i][3].ToString();
			exSheet.Cells["F" + s_row].Value = dt_Emp.Rows[i][4].ToString();
			
			tt_1 += double.Parse(dt_Emp.Rows[i][5].ToString());
			tt_2 += double.Parse(dt_Emp.Rows[i][6].ToString());
			tt_3 += double.Parse(dt_Emp.Rows[i][7].ToString());
			tt_4 += double.Parse(dt_Emp.Rows[i][8].ToString());
			
			exSheet.Cells["G" + s_row].Value = double.Parse(dt_Emp.Rows[i][5].ToString());
			exSheet.Cells["H" + s_row].Value = double.Parse(dt_Emp.Rows[i][6].ToString());
			exSheet.Cells["I" + s_row].Value = double.Parse(dt_Emp.Rows[i][7].ToString());
			exSheet.Cells["J" + s_row].Value = double.Parse(dt_Emp.Rows[i][8].ToString());
			
			s_row++;
			
			if (i < dt_Emp.Rows.Count - 1)
			{
				exSheet.Range["A" + s_row].Rows.EntireRow.Insert();
			}
		}
				
		exSheet.Cells["A" + s_row].Value = string.Format("Total {0} Employee(s)", dt_Emp.Rows.Count);
		exSheet.Cells["G" + s_row].Value = tt_1;
		exSheet.Cells["H" + s_row].Value = tt_2;
		exSheet.Cells["I" + s_row].Value = tt_3;
		exSheet.Cells["J" + s_row].Value = tt_4;		
		
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
