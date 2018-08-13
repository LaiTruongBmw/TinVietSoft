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

public partial class rpt_hrti01300_0 : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string TemplateFile = "rpt_hrti01300_0.xls";
        string TempFile = "../../../../system/temp/rpt_hrti01300_0_" + Session["User_ID"].ToString() + ".xls";
		TemplateFile = Server.MapPath(TemplateFile);
		TempFile = Server.MapPath(TempFile);

		//Create a new workbook
		IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

		//Add worksheet
		IWorksheet exSheet = exBook.Worksheets[1];
		IRange range;
		MemoryStream stream;
		Bitmap b;

		string p_tco_dept_pk, p_thr_group_pk, p_status, p_emp_id, p_work_mon, p_from_dt, p_to_dt, p_dept_nm, p_salary_period, p_nation, p_lstEmpID;

		p_tco_dept_pk = Request["l_tco_dept_pk"].ToString();
		p_thr_group_pk = Request["l_thr_group_pk"].ToString();
		p_status = Request["l_status"].ToString();
		p_emp_id = Request["l_emp_id"].ToString();
		p_work_mon = Request["l_work_mon"].ToString();
		p_to_dt = Request["l_to_dt"].ToString();
		p_from_dt = Request["l_from_dt"].ToString();
		p_dept_nm = Request["l_dept_nm"].ToString();
		p_salary_period = Request["l_SalaryPeriod"].ToString();
		p_nation = Request["l_nation"].ToString();
		p_lstEmpID = Request["l_lstEmpID"].ToString();

		//-----------------information of company-----------------
	string SQL_Com
		 = "select  a.PARTNER_LNAME,a.ADDR1,a.PHONE_NO,b.data,to_char(to_date('"+ p_work_mon +"','yyyymm'),'MON-YYYY'),to_char(to_date('"+ p_work_mon +"','yyyymm'),'mm/YYYY') " +
			"from tco_company a, tco_bpphoto b " +
			"where a.DEL_IF=0  and b.del_if(+) = 0 and a.TCO_BPPHOTO_PK = b.pk(+)" +
			"and a.pk in ( select tco_company_pk from  " +
			"               tco_org  f " +
			"               where  f.pk IN ( " +
			"                              SELECT     g.pk " +
			"                                    FROM tco_org g " +
			"                                   WHERE g.del_if = 0 " +
			"                              START WITH g.pk = " +
			"                                            DECODE ('" + p_tco_dept_pk + "', " +
			"                                                    'ALL', 0, " +
			"                                                    '" + p_tco_dept_pk + "' " +
			"                                                   ) " +
			"                              CONNECT BY PRIOR g.pk = g.p_pk) " +
			"                        OR '" + p_tco_dept_pk + "' = 'ALL') " +
			"and rownum=1 ";

		DataTable dt_Com = CtlLib.TableReadOpen(SQL_Com);

		exSheet.Range["C1"].Value = dt_Com.Rows[0][0].ToString();
		exSheet.Range["C2"].Value = dt_Com.Rows[0][1].ToString();
		exSheet.Range["C3"].Value = dt_Com.Rows[0][2].ToString();
		exSheet.Range["T1"].Value = "WORKING TIME REPORT ON "+dt_Com.Rows[0][4].ToString();
		exSheet.Range["W3"].Value = "(BẢNG CÔNG THÁNG "+dt_Com.Rows[0][5].ToString()+")";

		if (!string.IsNullOrEmpty(dt_Com.Rows[0][3].ToString()))
		{
			byte[] MyData = new byte[0];
			MyData = (byte[])dt_Com.Rows[0][3];
			stream = new MemoryStream(MyData);

			b = new Bitmap(stream);
			exSheet.Cells["B1"].Select();
			exSheet.Shapes.AddPicture(CtlLib.ResizeImage(b, 75, 40));
		}

		//-----------------working time-----------------

	string l_Emp_id = "";
		if (p_lstEmpID != "")
		{
			l_Emp_id = " and a.emp_id in ('" + p_lstEmpID + "')";
		}
		else
		{
			p_emp_id = p_emp_id.ToUpper();
			l_Emp_id = " and a.emp_id like '%" + p_emp_id + "%'";
		}

		string SQL = "";

		SQL = "select a.dept_NM,a.EMP_ID,a.full_name,to_char(to_date(a.JOIN_DT,'yyyymmdd'),'dd/mm/yyyy') JOIN_DT " +
        ",a.D1	,a.D2	,a.D3	,a.D4	,a.D5	,a.D6	,a.D7	,a.D8	,a.D9	,a.D10	 " +
        ",a.D11	,a.D12	,a.D13	,a.D14	,a.D15	,a.D16	,a.D17	,a.D18	,a.D19	,a.D20	 " +
        ",a.D21	,a.D22	,a.D23	,a.D24	,a.D25	,a.D26	,a.D27	,a.D28	,a.D29	,a.D30	,a.D31 " +
        ",decode(b.D1,0,'',b.D1) || decode(nvl(b.N1,0),0,'',' N' || b.N1)|| decode(nvl(b.NT2_1,0),0,'',' N+' || b.NT2_1) N1	 " +
        ",decode(b.D2,0,'',b.D2) || decode(nvl(b.N2,0),0,'',' N' || b.N2)|| decode(nvl(b.NT2_2,0),0,'',' N+' || b.NT2_2)	N2 " +
        ",decode(b.D3,0,'',b.D3) || decode(nvl(b.N3,0),0,'',' N' || b.N3)|| decode(nvl(b.NT2_3,0),0,'',' N+' || b.NT2_3)	N3 " +
        ",decode(b.D4,0,'',b.D4) || decode(nvl(b.N4,0),0,'',' N' || b.N4)|| decode(nvl(b.NT2_4,0),0,'',' N+' || b.NT2_4)	N4  " +
        ",decode(b.D5,0,'',b.D5) || decode(nvl(b.N5,0),0,'',' N' || b.N5)|| decode(nvl(b.NT2_5,0),0,'',' N+' || b.NT2_5)	 N5  " +
        ",decode(b.D6,0,'',b.D6) || decode(nvl(b.N6,0),0,'',' N' || b.N6)|| decode(nvl(b.NT2_6,0),0,'',' N+' || b.NT2_6)	N6  " +
        ",decode(b.D7,0,'',b.D7) || decode(nvl(b.N7,0),0,'',' N' || b.N7)|| decode(nvl(b.NT2_7,0),0,'',' N+' || b.NT2_7)	N7   " +
        ",decode(b.D8,0,'',b.D8) || decode(nvl(b.N8,0),0,'',' N' || b.N8)|| decode(nvl(b.NT2_8,0),0,'',' N+' || b.NT2_8)	N8   " +
        ",decode(b.D9,0,'',b.D9) || decode(nvl(b.N9,0),0,'',' N' || b.N9)|| decode(nvl(b.NT2_9,0),0,'',' N+' || b.NT2_9)	N9   " +
        ",decode(b.D10,0,'',b.D10) || decode(nvl(b.N10,0),0,'',' N' || b.N10)|| decode(nvl(b.NT2_10,0),0,'',' N+' || b.NT2_10)	N10  " +
        ",decode(b.D11,0,'',b.D11) || decode(nvl(b.N11,0),0,'',' N' || b.N11)|| decode(nvl(b.NT2_11,0),0,'',' N+' || b.NT2_11)	N11   " +
        ",decode(b.D12,0,'',b.D12) || decode(nvl(b.N12,0),0,'',' N' || b.N12)|| decode(nvl(b.NT2_12,0),0,'',' N+'|| b.NT2_12)	N12  " +
        ",decode(b.D13,0,'',b.D13) || decode(nvl(b.N13,0),0,'',' N' || b.N13)|| decode(nvl(b.NT2_13,0),0,'',' N+' || b.NT2_13)	N13  " +
        ",decode(b.D14,0,'',b.D14) || decode(nvl(b.N14,0),0,'',' N' || b.N14)|| decode(nvl(b.NT2_14,0),0,'',' N+' || b.NT2_14)	N14  " +
        ",decode(b.D15,0,'',b.D15) || decode(nvl(b.N15,0),0,'',' N' || b.N15)|| decode(nvl(b.NT2_15,0),0,'',' N+' || b.NT2_15)	N15  " +
        ",decode(b.D16,0,'',b.D16) || decode(nvl(b.N16,0),0,'',' N' || b.N16)|| decode(nvl(b.NT2_16,0),0,'',' N+' || b.NT2_16)	N16  " +
        ",decode(b.D17,0,'',b.D17) || decode(nvl(b.N17,0),0,'',' N' || b.N17)|| decode(nvl(b.NT2_17,0),0,'',' N+' || b.NT2_17)	N17  " +
        ",decode(b.D18,0,'',b.D18) || decode(nvl(b.N18,0),0,'',' N' || b.N18)|| decode(nvl(b.NT2_18,0),0,'',' N+' || b.NT2_18)	N18  " +
        ",decode(b.D19,0,'',b.D19) || decode(nvl(b.N19,0),0,'',' N' || b.N19)|| decode(nvl(b.NT2_19,0),0,'',' N+' || b.NT2_19)	N19  " +
        ",decode(b.D20,0,'',b.D20) || decode(nvl(b.N20,0),0,'',' N' || b.N20)|| decode(nvl(b.NT2_20,0),0,'',' N+' || b.NT2_20)	N20  " +
        ",decode(b.D21,0,'',b.D21) || decode(nvl(b.N21,0),0,'',' N' || b.N21)|| decode(nvl(b.NT2_21,0),0,'',' N+' || b.NT2_21)	N21  " +
        ",decode(b.D22,0,'',b.D22) || decode(nvl(b.N22,0),0,'',' N' || b.N22)|| decode(nvl(b.NT2_22,0),0,'',' N+' || b.NT2_22)	N22  " +
        ",decode(b.D23,0,'',b.D23) || decode(nvl(b.N23,0),0,'',' N' || b.N23)|| decode(nvl(b.NT2_23,0),0,'',' N+' || b.NT2_23)	N23  " +
        ",decode(b.D24,0,'',b.D24) || decode(nvl(b.N24,0),0,'',' N' || b.N24)|| decode(nvl(b.NT2_24,0),0,'',' N+' || b.NT2_24)	N24  " +
        ",decode(b.D25,0,'',b.D25) || decode(nvl(b.N25,0),0,'',' N' || b.N25)|| decode(nvl(b.NT2_25,0),0,'',' N+' || b.NT2_25)	N25 " +
        ",decode(b.D26,0,'',b.D26) || decode(nvl(b.N26,0),0,'',' N' || b.N26)|| decode(nvl(b.NT2_26,0),0,'',' N+' || b.NT2_26)	N26  " +
        ",decode(b.D27,0,'',b.D27) || decode(nvl(b.N27,0),0,'',' N' || b.N27)|| decode(nvl(b.NT2_27,0),0,'',' N+' || b.NT2_27)	N27  " +
        ",decode(b.D28,0,'',b.D28) || decode(nvl(b.N28,0),0,'',' N' || b.N28)|| decode(nvl(b.NT2_28,0),0,'',' N+' || b.NT2_28)	N28  " +
        ",decode(b.D29,0,'',b.D29) || decode(nvl(b.N29,0),0,'',' N' || b.N29)|| decode(nvl(b.NT2_29,0),0,'',' N+' || b.NT2_29)	N29  " +
        ",decode(b.D30,0,'',b.D30) || decode(nvl(b.N30,0),0,'',' N' || b.N30)|| decode(nvl(b.NT2_30,0),0,'',' N+' || b.NT2_30)	N30  " +
        ",decode(b.D31,0,'',b.D31) || decode(nvl(b.N31,0),0,'',' N' || b.N31)|| decode(nvl(b.NT2_31,0),0,'',' N+' || b.NT2_31)	N31  " +
        ",round(nvl(a.TOTAL_WD,0)/8,3) TOTAL_WD " +
        ",b.TOTAL_OT " +
        ",b.TOTAL_NT30 " +
		",b.TOTAL_NT45 " +
		",b.TOTAL_NT60 " +
		",b.TOTAL_NT90 " +
        ",b.TOTAL_ST " +
		",b.TOTAL_HT " +
        ",a.ale_have,a.total_ale_use,a.remain_ale,a.abs_ale " +
        "from thr_work_mon a,thr_extra_month b, thr_work_group c,thr_employee e " +
        "where a.del_if=0 and b.del_if=0 and c.del_if=0 and e.del_if=0 and c.pk=a.thr_group_pk " +
        "and a.thr_emp_pk=b.thr_emp_pk  and e.pk=a.thr_emp_pk " +
        "and a.work_mon = b.work_mon " +
        "and a.work_mon='" + p_work_mon + "' " +
        "and b.work_mon='" + p_work_mon + "' " +
        "and (a.tco_dept_pk in ( " +
        "                              SELECT     g.pk " +
        "                                    FROM tco_org g " +
        "                                   WHERE g.del_if = 0 " +
        "                              START WITH g.pk = " +
        "                                            DECODE ('" + p_tco_dept_pk + "', " +
        "                                                    'ALL', 0, " +
        "                                                    '" + p_tco_dept_pk + "' " +
        "                                                   ) " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '" + p_tco_dept_pk + "' = 'ALL') " +
        "and decode('" + p_thr_group_pk + "','ALL','ALL',a.thr_group_pk)='" + p_thr_group_pk + "' " +
         l_Emp_id +
        "and decode('" + p_status + "','ALL','ALL',a.status)='" + p_status + "' " +
        " and decode('" + p_salary_period + "','ALL','ALL',nvl(a.sal_period,' '))='" + p_salary_period + "' " +
        " and decode('" + p_nation + "','ALL','ALL',nvl(e.nation,'01'))='" + p_nation + "' " +
        "order by a.dept_nm,a.emp_id ";

		// string para = "'" + p_work_mon + "','" + p_salary_period + "','" + p_lstEmpID + "'";    

		//Response.Write(SQL);
		//  Response.End();   

		DataTable dt_Emp = CtlLib.TableReadOpen(SQL);

		//DataTable dt_Emp = CtlLib.TableReadOpen(SQL);
		int irow_emp;
		irow_emp = dt_Emp.Rows.Count;
		if (irow_emp == 0)
		{
			Response.Write("There is no data of working time");
			Response.End();
		}

		int iDate_Num;

		//-----------------calendar-----------------
    string SQL_Cal
    = "select substr(t.car_date,-2),t.hol_type " +
        "from thr_calendar T,thr_close m " +
        "where t.del_if=0 and m.del_if=0 and m.id='" + p_salary_period + "' and m.month_close='" + p_work_mon + "' and m.tco_company_pk=t.tco_company_pk " +
        "   and m.tco_company_pk=(select tco_company_pk from tco_org g where g.del_if=0 and DECODE('" + p_tco_dept_pk + "','ALL','" + p_tco_dept_pk + "',G.PK)= '" + p_tco_dept_pk + "' ) " +
        "    and t.car_date between m.from_dt and '" + p_to_dt + "' order by t.car_date ";
		DataTable dt_Cal = CtlLib.TableReadOpen(SQL_Cal);
		iDate_Num = dt_Cal.Rows.Count;
		if (iDate_Num == 0)
		{
			Response.Write("There is no data of calendar");
			Response.End();
		}

		int row_emp = dt_Emp.Rows.Count;
		int row_cal = dt_Cal.Rows.Count;

		int s_col = 7;
		int s_row = 6;
		int tt_col = row_cal + 19;

		if (row_emp <= 0)
		{
			Response.Write("There is no data !!!");
			Response.End();
		}

		//header columns
		for (int row = 0; row < row_cal; row++)
		{
			exSheet.Range[4, s_col + row, 5, s_col + row].Value = double.Parse(dt_Cal.Rows[row][0].ToString());
		}

		s_row = 6;
		//insert new row
		for (int row = 1; row < row_emp; row++)
		{
			exSheet.Range["A8:AX9"].EntireRow.Insert();
		}

		if (row_emp > 1)
			exSheet.Range["A6:AX7"].Rows.Copy(exSheet.Range["A" + (s_row + 2) + ":" + "AX" + (((row_emp - 1) * 2) + s_row -1 + 2)] , XlPasteType.xlPasteAll);

		for (int row = 0; row < row_emp; row++)
		{
			exSheet.Range["A" + (s_row + row) + ":A" + (s_row + row + 1)].Value = row + 1;
			exSheet.Range["B" + (s_row + row) + ":B" + (s_row + row + 1)].Value = dt_Emp.Rows[row]["DEPT_NM"].ToString();
			exSheet.Range["C" + (s_row + row) + ":C" + (s_row + row + 1)].Value = dt_Emp.Rows[row]["EMP_ID"].ToString();
			exSheet.Range["D" + (s_row + row) + ":D" + (s_row + row + 1)].Value = dt_Emp.Rows[row]["FULL_NAME"].ToString();
			exSheet.Range["E" + (s_row + row) + ":E" + (s_row + row + 1)].Value = dt_Emp.Rows[row]["JOIN_DT"].ToString();

			GeneralData(exSheet, "1", "G", s_row + row, row, "D1", dt_Emp);
			GeneralData(exSheet, "1", "G", s_row + row + 1, row, "N1", dt_Emp);
			GeneralData(exSheet, "1", "H", s_row + row, row, "D2", dt_Emp);
			GeneralData(exSheet, "1", "H", s_row + row + 1, row, "N2", dt_Emp);
			GeneralData(exSheet, "1", "I", s_row + row, row, "D3", dt_Emp);
			GeneralData(exSheet, "1", "I", s_row + row + 1, row, "N3", dt_Emp);
			GeneralData(exSheet, "1", "J", s_row + row, row, "D4", dt_Emp);
			GeneralData(exSheet, "1", "J", s_row + row + 1, row, "N4", dt_Emp);
			GeneralData(exSheet, "1", "K", s_row + row, row, "D5", dt_Emp);
			GeneralData(exSheet, "1", "K", s_row + row + 1, row, "N5", dt_Emp);
			GeneralData(exSheet, "1", "L", s_row + row, row, "D6", dt_Emp);
			GeneralData(exSheet, "1", "L", s_row + row + 1, row, "N6", dt_Emp);
			GeneralData(exSheet, "1", "M", s_row + row, row, "D7", dt_Emp);
			GeneralData(exSheet, "1", "M", s_row + row + 1, row, "N7", dt_Emp);
			GeneralData(exSheet, "1", "N", s_row + row, row, "D8", dt_Emp);
			GeneralData(exSheet, "1", "N", s_row + row + 1, row, "N8", dt_Emp);
			GeneralData(exSheet, "1", "O", s_row + row, row, "D9", dt_Emp);
			GeneralData(exSheet, "1", "O", s_row + row + 1, row, "N9", dt_Emp);
			GeneralData(exSheet, "1", "P", s_row + row, row, "D10", dt_Emp);
			GeneralData(exSheet, "1", "P", s_row + row + 1, row, "N10", dt_Emp);

			GeneralData(exSheet, "1", "Q", s_row + row, row, "D11", dt_Emp);
			GeneralData(exSheet, "1", "Q", s_row + row + 1, row, "N11", dt_Emp);
			GeneralData(exSheet, "1", "R", s_row + row, row, "D12", dt_Emp);
			GeneralData(exSheet, "1", "R", s_row + row + 1, row, "N12", dt_Emp);
			GeneralData(exSheet, "1", "S", s_row + row, row, "D13", dt_Emp);
			GeneralData(exSheet, "1", "S", s_row + row + 1, row, "N13", dt_Emp);
			GeneralData(exSheet, "1", "T", s_row + row, row, "D14", dt_Emp);
			GeneralData(exSheet, "1", "T", s_row + row + 1, row, "N14", dt_Emp);
			GeneralData(exSheet, "1", "U", s_row + row, row, "D15", dt_Emp);
			GeneralData(exSheet, "1", "U", s_row + row + 1, row, "N15", dt_Emp);
			GeneralData(exSheet, "1", "V", s_row + row, row, "D16", dt_Emp);
			GeneralData(exSheet, "1", "V", s_row + row + 1, row, "N16", dt_Emp);
			GeneralData(exSheet, "1", "W", s_row + row, row, "D17", dt_Emp);
			GeneralData(exSheet, "1", "W", s_row + row + 1, row, "N17", dt_Emp);
			GeneralData(exSheet, "1", "X", s_row + row, row, "D18", dt_Emp);
			GeneralData(exSheet, "1", "X", s_row + row + 1, row, "N18", dt_Emp);
			GeneralData(exSheet, "1", "Y", s_row + row, row, "D19", dt_Emp);
			GeneralData(exSheet, "1", "Y", s_row + row + 1, row, "N19", dt_Emp);
			GeneralData(exSheet, "1", "Z", s_row + row, row, "D20", dt_Emp);
			GeneralData(exSheet, "1", "Z", s_row + row + 1, row, "N20", dt_Emp);

			GeneralData(exSheet, "1", "AA", s_row + row, row, "D21", dt_Emp);
			GeneralData(exSheet, "1", "AA", s_row + row + 1, row, "N21", dt_Emp);
			GeneralData(exSheet, "1", "AB", s_row + row, row, "D22", dt_Emp);
			GeneralData(exSheet, "1", "AB", s_row + row + 1, row, "N22", dt_Emp);
			GeneralData(exSheet, "1", "AC", s_row + row, row, "D23", dt_Emp);
			GeneralData(exSheet, "1", "AC", s_row + row + 1, row, "N23", dt_Emp);
			GeneralData(exSheet, "1", "AD", s_row + row, row, "D24", dt_Emp);
			GeneralData(exSheet, "1", "AD", s_row + row + 1, row, "N24", dt_Emp);
			GeneralData(exSheet, "1", "AE", s_row + row, row, "D25", dt_Emp);
			GeneralData(exSheet, "1", "AE", s_row + row + 1, row, "N25", dt_Emp);
			GeneralData(exSheet, "1", "AF", s_row + row, row, "D26", dt_Emp);
			GeneralData(exSheet, "1", "AF", s_row + row + 1, row, "N26", dt_Emp);
			GeneralData(exSheet, "1", "AG", s_row + row, row, "D27", dt_Emp);
			GeneralData(exSheet, "1", "AG", s_row + row + 1, row, "N27", dt_Emp);
			GeneralData(exSheet, "1", "AH", s_row + row, row, "D28", dt_Emp);
			GeneralData(exSheet, "1", "AH", s_row + row + 1, row, "N28", dt_Emp);
			GeneralData(exSheet, "1", "AI", s_row + row, row, "D29", dt_Emp);
			GeneralData(exSheet, "1", "AI", s_row + row + 1, row, "N29", dt_Emp);
			GeneralData(exSheet, "1", "AJ", s_row + row, row, "D30", dt_Emp);
			GeneralData(exSheet, "1", "AJ", s_row + row + 1, row, "N30", dt_Emp);

			GeneralData(exSheet, "1", "AK", s_row + row, row, "D31", dt_Emp);
			GeneralData(exSheet, "1", "AK", s_row + row + 1, row, "N31", dt_Emp);

			GeneralData(exSheet, "2", "AL", s_row + row, row, "TOTAL_WD", dt_Emp);
			GeneralData(exSheet, "2", "AM", s_row + row, row, "TOTAL_OT", dt_Emp);
			GeneralData(exSheet, "2", "AN", s_row + row, row, "TOTAL_NT30", dt_Emp);
			GeneralData(exSheet, "2", "AO", s_row + row, row, "TOTAL_NT45", dt_Emp);
			GeneralData(exSheet, "2", "AP", s_row + row, row, "TOTAL_NT60", dt_Emp);
			GeneralData(exSheet, "2", "AQ", s_row + row, row, "TOTAL_NT90", dt_Emp);
			GeneralData(exSheet, "2", "AR", s_row + row, row, "TOTAL_HT", dt_Emp);
			GeneralData(exSheet, "2", "AS", s_row + row, row, "TOTAL_ST", dt_Emp);

			GeneralData(exSheet, "2", "AT", s_row + row, row, "ale_have", dt_Emp);
			GeneralData(exSheet, "2", "AU", s_row + row, row, "total_ale_use", dt_Emp);
			GeneralData(exSheet, "2", "AV", s_row + row, row, "remain_ale", dt_Emp);
			GeneralData(exSheet, "2", "AW", s_row + row, row, "ABS_ALE", dt_Emp);
			

			s_row++;
		}
		
		// draw color
		s_row = 6;
		int temp = 0;
		for (int row = 0; row < row_cal; row++)
		{
			temp = 31 - row_cal;
			switch (temp)
			{
				case 3:
					exSheet.Range["AI1"].Columns.Hidden = true;
					break;
				case 2:
					exSheet.Range["AJ1"].Columns.Hidden = true;
					break;
				case 1:
					exSheet.Range["AK1"].Columns.Hidden = true;
					break;
			}

			switch (dt_Cal.Rows[row][1].ToString())
			{
				case "SUN":
					exSheet.Range[s_row, row + s_col, ((row_emp * 2) + s_row - 1), row + s_col].Interior.Color = Color.SkyBlue;
					break;

				case "HOL":
					exSheet.Range[s_row, row + s_col, ((row_emp * 2) + s_row - 1), row + s_col].Interior.Color = Color.Pink;
					break;
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
	
	public static void GeneralData(IWorksheet exSheet, string type, string col_name, int col_num, int row_data, string col_data, DataTable myDT)
	{
		switch (type)
		{
			case "1":
				if (IsNumeric(myDT.Rows[row_data][col_data].ToString()))
					exSheet.Range[col_name + col_num + ":" + col_name + col_num].Value = double.Parse(myDT.Rows[row_data][col_data].ToString());
				else
					exSheet.Range[col_name + col_num + ":" + col_name + col_num].Value = myDT.Rows[row_data][col_data].ToString();
				break;
			case "2":
				if (IsNumeric(myDT.Rows[row_data][col_data].ToString()))
					exSheet.Range[col_name + col_num + ":" + col_name + (col_num + 1)].Value = double.Parse(myDT.Rows[row_data][col_data].ToString());
				else
					exSheet.Range[col_name + col_num + ":" + col_name + (col_num + 1)].Value = myDT.Rows[row_data][col_data].ToString();
			break;
		}
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
