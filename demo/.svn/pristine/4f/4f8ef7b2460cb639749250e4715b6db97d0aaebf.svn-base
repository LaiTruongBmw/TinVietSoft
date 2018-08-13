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

public partial class rpt_hrti01300_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string TemplateFile = "rpt_hrti01300_2.xls";
        string TempFile = "../../../../system/temp/rpt_hrti01300_2_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

         //Create a new workbook
		IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

		//Add worksheet
		IWorksheet exSheet = exBook.Worksheets[1];
		IRange range;		
		MemoryStream stream;
		Bitmap b;
		
		string p_tco_dept_pk, p_thr_group_pk, p_status, p_emp_id, p_work_mon, p_from_dt, p_to_dt, p_dept_nm, p_salary_period, p_company_pk;
    
		p_tco_dept_pk = Request["l_tco_dept_pk"].ToString();
		p_thr_group_pk = Request["l_thr_group_pk"].ToString();
		p_status = Request["l_status"].ToString();
		p_emp_id = Request["l_emp_id"].ToString();
		p_work_mon = Request["l_work_mon"].ToString();
		p_to_dt = Request["l_to_dt"].ToString();
		p_from_dt = Request["l_from_dt"].ToString();
		p_dept_nm = Request["l_dept_nm"].ToString();
		p_salary_period = Request["l_SalaryPeriod"].ToString();
		//p_company_pk = Request["l_company_pk"].ToString();
		
		//-----------------information of company-----------------
		string SQL_Com
		= "select  a.PARTNER_LNAME,a.ADDR1,a.PHONE_NO,b.data,to_char(to_date('201210','yyyymm'),'MON-YYYY') " +
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
			"and rownum=1 " ;

		DataTable dt_Com = CtlLib.TableReadOpen(SQL_Com);

		exSheet.Range["C1"].Value = dt_Com.Rows[0][0].ToString();
		exSheet.Range["C2"].Value = dt_Com.Rows[0][1].ToString();
		exSheet.Range["C3"].Value = dt_Com.Rows[0][2].ToString();

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
		
		
		string SQL  = "select c.org_NM,b.emp_id,b.full_name  " +
        ",to_char(to_date(b.join_dt,'yyyymmdd'),'dd/mm/yyyy') join_dt " +
        ",MAX(DECODE(A.ABSENCE_DT,'" + p_from_dt + "',abs_type.char_1 || nvl(absence_time,8),'')) as in_1  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+1,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_2  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+2,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_3  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+3,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_4  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+4,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_5  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+5,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_6  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+6,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_7  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+7,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_8  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+8,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_9  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+9,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_10  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+10,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_11  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+11,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_12  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+12,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_13  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+13,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_14  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+14,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_15  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+15,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_16  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+16,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_17  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+17,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_18  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+18,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_19  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+19,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_20  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+20,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_21  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+21,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_22  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+22,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_23  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+23,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_24  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+24,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_25  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+25,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_26  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+26,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_27  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+27,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_28  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+28,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_29  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+29,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_30  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+30,'YYYYMMDD'),abs_type.char_1 || nvl(absence_time,8),'')) as in_31  " +
        " , NVL (c.seq, 0), SUM (NVL (a.absence_time, 0) / 8) AS total_abs  " +
        "from thr_absence a,thr_employee b,tco_org c  " +
        ",(select d.code,d.char_1 from vhr_hr_code d where id='HR0003') abs_type " +
        "where a.del_if=0 and b.del_if=0 and c.del_if=0  " +
        "and a.THR_EMP_PK=b.pk and b.tco_org_pk=c.pk " +
        "and a.ABSENCE_TYPE=abs_type.code  " +
        "and a.absence_dt between '" + p_from_dt + "' and '" + p_to_dt + "' " +
        "and (b.tco_org_pk in ( " +
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
        "and decode('" + p_thr_group_pk + "','ALL','ALL',b.thr_wg_pk)='" + p_thr_group_pk + "'" +
        " and decode('" + p_salary_period + "','ALL','ALL',nvl(b.sal_period,' '))='" + p_salary_period + "' " +
        "and b.emp_id like '%" + p_emp_id + "%' " +
        "and decode('" + p_status + "','ALL','ALL',b.status)='" + p_status + "'" +
        " GROUP BY A.THR_EMP_PK,c.org_NM,b.emp_id,b.full_name,b.join_dt,NVL (c.seq, 0) " +
        " order by NVL (c.seq, 0),c.org_NM,b.emp_id ";    
		
		string SQL1  = "select c.org_NM,b.emp_id,b.full_name  " +
        ",to_char(to_date(b.join_dt,'yyyymmdd'),'dd/mm/yyyy') join_dt  " +
        ",MAX(DECODE(A.ABSENCE_DT,'" + p_from_dt + "',abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ) ,'')) as in_1  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+1,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_2  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+2,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_3  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+3,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_4  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+4,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_5  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+5,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_6  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+6,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_7  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+7,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_8  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+8,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_9  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+9,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_10  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+10,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_11  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+11,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_12  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+12,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_13  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+13,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_14  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+14,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_15  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+15,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_16  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+16,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_17  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+17,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_18  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+18,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_19  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+19,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_20  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+20,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_21  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+21,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_22  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+22,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_23  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+23,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_24  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+24,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_25  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+25,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_26  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+26,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_27  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+27,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_28  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+28,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_29  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+29,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_30  " +
        ",MAX(DECODE(A.ABSENCE_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+30,'YYYYMMDD'),abs_type.char_1 || decode(nvl(absence_time,8),8,'','(' || absence_time || ')' ),'')) as in_31  " +
        " , NVL (c.seq, 0), SUM (NVL (a.absence_time, 0) / 8) AS total_abs  " +
        "from thr_absence a,thr_employee b,tco_org c  " +
        ",(select d.code,d.char_1 from vhr_hr_code d where id='HR0003') abs_type " +
        "where a.del_if=0 and b.del_if=0 and c.del_if=0  " +
        "and a.THR_EMP_PK=b.pk and b.tco_org_pk=c.pk " +
        "and a.ABSENCE_TYPE=abs_type.code  " + 
        "and a.absence_dt between '" + p_from_dt + "' and '" + p_to_dt + "' " +
        "and B.LEFT_DT between '" + p_from_dt + "' and '" + p_to_dt + "' " +
        "and B.LEFT_DT IS NOT NULL " +
        "and (b.tco_org_pk in ( " +
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
        "and decode('" + p_thr_group_pk + "','ALL','ALL',b.thr_wg_pk)='" + p_thr_group_pk + "'" +
        "and b.emp_id like '%" + p_emp_id + "%' " + 
        "and decode('" + p_status + "','ALL','ALL',b.status)='" + p_status + "'" +
        " and decode('" + p_salary_period + "','ALL','ALL',nvl(b.sal_period,' '))='" + p_salary_period + "' " +
        " GROUP BY A.THR_EMP_PK,c.org_NM,b.emp_id,b.full_name,b.join_dt,NVL (c.seq, 0) " +
        " order by NVL (c.seq, 0),c.org_NM,b.emp_id ";
		
		if (p_status == "R")
		{
			SQL = SQL1;
		}
		//Response.Write(SQL);
		//Response.End();
		DataTable dt_Emp = CtlLib.TableReadOpen(SQL);
	
		string SQL_Cal = "select substr(t.car_date,-2),t.hol_type " +
        "from thr_calendar T,thr_close m " +
        "where t.del_if=0 and m.del_if=0 and m.id='" + p_salary_period + "' and m.month_close='" + p_work_mon + "' " +
		" and t.tco_company_pk=(select tco_company_pk from tco_org g where g.del_if=0 and g.pk='" + p_tco_dept_pk + "' ) " +
        "    and t.car_date between m.from_dt and '" + p_to_dt + "' order by t.car_date ";
		
		//Response.Write(SQL_Cal);
		//Response.End();
		DataTable dt_Cal = CtlLib.TableReadOpen(SQL_Cal);
		
		int row_emp = dt_Emp.Rows.Count;
		int row_cal = dt_Cal.Rows.Count;

		int s_col = 7;
		int s_row = 6;

		exSheet.Range["U2"].Value =	string.Format("ABSENCE SUMMARY - {0}", p_dept_nm);
		exSheet.Range["T3"].Value =	dt_Com.Rows[0][4].ToString();
		
		//header columns
		for (int row = 0; row < row_cal; row++)
		{
			exSheet.Range[4, s_col + row, 5, s_col + row].Value = double.Parse(dt_Cal.Rows[row][0].ToString());
		}
		
		s_row = 6;
		//insert new row
		for (int row = 1; row < row_emp; row++)
		{
			exSheet.Range["A7"].EntireRow.Insert();
		}

		//exSheet.Range["A6:AM6"].Rows.Copy(exSheet.Range["A" + (s_row) + ":" + "AM" + ((row_emp -1) + s_row)], XlPasteType.xlPasteAll);

		for (int row = 0; row < row_emp; row++)
		{
			exSheet.Range["A" + (s_row + row) + ":A" + (s_row + row)].Value = row + 1;
			exSheet.Range["B" + (s_row + row) + ":B" + (s_row + row)].Value = dt_Emp.Rows[row]["ORG_NM"].ToString();
			exSheet.Range["C" + (s_row + row) + ":C" + (s_row + row)].Value = dt_Emp.Rows[row]["EMP_ID"].ToString();
			exSheet.Range["D" + (s_row + row) + ":D" + (s_row + row)].Value = dt_Emp.Rows[row]["FULL_NAME"].ToString();
			exSheet.Range["E" + (s_row + row) + ":E" + (s_row + row)].Value = dt_Emp.Rows[row]["JOIN_DT"].ToString();

			GeneralData(exSheet, "1", "G", s_row + row, row, "IN_1", dt_Emp);
			GeneralData(exSheet, "1", "H", s_row + row, row, "IN_2", dt_Emp);
			GeneralData(exSheet, "1", "I", s_row + row, row, "IN_3", dt_Emp);
			GeneralData(exSheet, "1", "J", s_row + row, row, "IN_4", dt_Emp);
			GeneralData(exSheet, "1", "K", s_row + row, row, "IN_5", dt_Emp);
			GeneralData(exSheet, "1", "L", s_row + row, row, "IN_6", dt_Emp);
			GeneralData(exSheet, "1", "M", s_row + row, row, "IN_7", dt_Emp);
			GeneralData(exSheet, "1", "N", s_row + row, row, "IN_8", dt_Emp);
			GeneralData(exSheet, "1", "O", s_row + row, row, "IN_9", dt_Emp);
			GeneralData(exSheet, "1", "P", s_row + row, row, "IN_10", dt_Emp);
			GeneralData(exSheet, "1", "Q", s_row + row, row, "IN_11", dt_Emp);
			GeneralData(exSheet, "1", "R", s_row + row, row, "IN_12", dt_Emp);
			GeneralData(exSheet, "1", "S", s_row + row, row, "IN_13", dt_Emp);
			GeneralData(exSheet, "1", "T", s_row + row, row, "IN_14", dt_Emp);
			GeneralData(exSheet, "1", "U", s_row + row, row, "IN_15", dt_Emp);
			GeneralData(exSheet, "1", "V", s_row + row, row, "IN_16", dt_Emp);
			GeneralData(exSheet, "1", "W", s_row + row, row, "IN_17", dt_Emp);
			GeneralData(exSheet, "1", "X", s_row + row, row, "IN_18", dt_Emp);
			GeneralData(exSheet, "1", "Y", s_row + row, row, "IN_19", dt_Emp);
			GeneralData(exSheet, "1", "Z", s_row + row, row, "IN_20", dt_Emp);
			GeneralData(exSheet, "1", "AA", s_row + row, row, "IN_21", dt_Emp);
			GeneralData(exSheet, "1", "AB", s_row + row, row, "IN_22", dt_Emp);
			GeneralData(exSheet, "1", "AC", s_row + row, row, "IN_23", dt_Emp);
			GeneralData(exSheet, "1", "AD", s_row + row, row, "IN_24", dt_Emp);
			GeneralData(exSheet, "1", "AF", s_row + row, row, "IN_26", dt_Emp);
			GeneralData(exSheet, "1", "AG", s_row + row, row, "IN_27", dt_Emp);
			GeneralData(exSheet, "1", "AH", s_row + row, row, "IN_28", dt_Emp);
			GeneralData(exSheet, "1", "AI", s_row + row, row, "IN_29", dt_Emp);
			GeneralData(exSheet, "1", "AJ", s_row + row, row, "IN_30", dt_Emp);
			GeneralData(exSheet, "1", "AK", s_row + row, row, "IN_31", dt_Emp);
			GeneralData(exSheet, "1", "AL", s_row + row, row, "TOTAL_ABS", dt_Emp);

			//s_row++;
		}

		// draw color
		s_row = 6;
		int temp = 0;
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

		for (int row = 0; row < row_cal; row++)
		{

			switch (dt_Cal.Rows[row][1].ToString())
			{
				case "SUN":
					exSheet.Range[s_row, row + s_col, ((row_emp) + s_row - 1), row + s_col].Interior.Color = Color.SkyBlue;
					break;

				case "HOL":
					exSheet.Range[s_row, row + s_col, ((row_emp) + s_row - 1), row + s_col].Interior.Color = Color.Pink;
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
