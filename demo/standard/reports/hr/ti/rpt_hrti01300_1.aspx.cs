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

public partial class rpt_hrti01300_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string TemplateFile = "rpt_hrti01300_1.xls";
        string TempFile = "../../../../system/temp/rpt_hrti01300_1_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

         //Create a new workbook
		IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

		//Add worksheet
		IWorksheet exSheet = exBook.Worksheets[1];
		IRange range;		
		MemoryStream stream;
		Bitmap b;
		
		string p_tco_dept_pk, p_thr_group_pk, p_status, p_emp_id, p_work_mon, p_from_dt, p_to_dt, p_dept_nm, l_work_from, p_nation, p_salary_period,p_lstEmpID;
    
		p_tco_dept_pk = Request["l_tco_dept_pk"].ToString();
		p_thr_group_pk = Request["l_thr_group_pk"].ToString();
		p_status = Request["l_status"].ToString();
		p_emp_id = Request["l_emp_id"].ToString();
		p_work_mon = Request["l_work_mon"].ToString();
		p_to_dt = Request["l_to_dt"].ToString();
		p_from_dt = Request["l_from_dt"].ToString();
		p_dept_nm = Request["l_dept_nm"].ToString();
		p_nation = Request["l_nation"].ToString();
		p_salary_period = Request["l_SalaryPeriod"].ToString();
		p_lstEmpID = Request["l_lstEmpID"].ToString();
		
		
		
		string l_Emp_id="";
		if (p_lstEmpID != "")
		{   
			l_Emp_id=" and b.emp_id in ('" + p_lstEmpID + "')" ;
		}
		else
		{		
			p_emp_id=p_emp_id.ToUpper();
			l_Emp_id=" and b.emp_id like '%" + p_emp_id + "%'" ;
		}
	
		
		//-----------------information of company-----------------
		string SQL_Com
		= "select  a.PARTNER_LNAME,a.ADDR1,a.PHONE_NO,b.data,to_char(to_date('"+p_work_mon+"','yyyymm'),'mm/yyyy') " +
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
		//Response.Write(SQL_Com);
		//Response.End();
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
			exSheet.Cells["A1"].Select();
			exSheet.Shapes.AddPicture(CtlLib.ResizeImage(b, 130, 60));
		}
		
		//-----------------working time-----------------
    string SQL = "select c.org_NM,b.emp_id,b.full_name " +
        ",to_char(to_date(b.join_dt,'yyyymmdd'),'dd/mm/yyyy') join_dt " +
        ",MAX(DECODE(A.WORK_DT,'" + p_from_dt + "',a.TIME_IN,'')) as in_1 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+1,'YYYYMMDD'),a.TIME_IN,'')) as in_2 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+2,'YYYYMMDD'),a.TIME_IN,'')) as in_3 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+3,'YYYYMMDD'),a.TIME_IN,'')) as in_4 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+4,'YYYYMMDD'),a.TIME_IN,'')) as in_5 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+5,'YYYYMMDD'),a.TIME_IN,'')) as in_6 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+6,'YYYYMMDD'),a.TIME_IN,'')) as in_7 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+7,'YYYYMMDD'),a.TIME_IN,'')) as in_8 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+8,'YYYYMMDD'),a.TIME_IN,'')) as in_9 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+9,'YYYYMMDD'),a.TIME_IN,'')) as in_10 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+10,'YYYYMMDD'),a.TIME_IN,'')) as in_11 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+11,'YYYYMMDD'),a.TIME_IN,'')) as in_12 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+12,'YYYYMMDD'),a.TIME_IN,'')) as in_13 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+13,'YYYYMMDD'),a.TIME_IN,'')) as in_14 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+14,'YYYYMMDD'),a.TIME_IN,'')) as in_15 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+15,'YYYYMMDD'),a.TIME_IN,'')) as in_16 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+16,'YYYYMMDD'),a.TIME_IN,'')) as in_17 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+17,'YYYYMMDD'),a.TIME_IN,'')) as in_18 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+18,'YYYYMMDD'),a.TIME_IN,'')) as in_19 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+19,'YYYYMMDD'),a.TIME_IN,'')) as in_20 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+20,'YYYYMMDD'),a.TIME_IN,'')) as in_21 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+21,'YYYYMMDD'),a.TIME_IN,'')) as in_22 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+22,'YYYYMMDD'),a.TIME_IN,'')) as in_23 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+23,'YYYYMMDD'),a.TIME_IN,'')) as in_24 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+24,'YYYYMMDD'),a.TIME_IN,'')) as in_25 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+25,'YYYYMMDD'),a.TIME_IN,'')) as in_26 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+26,'YYYYMMDD'),a.TIME_IN,'')) as in_27 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+27,'YYYYMMDD'),a.TIME_IN,'')) as in_28 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+28,'YYYYMMDD'),a.TIME_IN,'')) as in_29 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+29,'YYYYMMDD'),a.TIME_IN,'')) as in_30 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+30,'YYYYMMDD'),a.TIME_IN,'')) as in_31 " +
        ",MAX(DECODE(A.WORK_DT,'" + p_from_dt + "',a.TIME_OUT,'')) as out_1 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+1,'YYYYMMDD'),a.TIME_OUT,'')) as out_2 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+2,'YYYYMMDD'),a.TIME_OUT,'')) as out_3 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+3,'YYYYMMDD'),a.TIME_OUT,'')) as out_4 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+4,'YYYYMMDD'),a.TIME_OUT,'')) as out_5 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+5,'YYYYMMDD'),a.TIME_OUT,'')) as out_6 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+6,'YYYYMMDD'),a.TIME_OUT,'')) as out_7 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+7,'YYYYMMDD'),a.TIME_OUT,'')) as out_8 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+8,'YYYYMMDD'),a.TIME_OUT,'')) as out_9 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+9,'YYYYMMDD'),a.TIME_OUT,'')) as out_10 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+10,'YYYYMMDD'),a.TIME_OUT,'')) as out_11 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+11,'YYYYMMDD'),a.TIME_OUT,'')) as out_12 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+12,'YYYYMMDD'),a.TIME_OUT,'')) as out_13 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+13,'YYYYMMDD'),a.TIME_OUT,'')) as out_14 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+14,'YYYYMMDD'),a.TIME_OUT,'')) as out_15 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+15,'YYYYMMDD'),a.TIME_OUT,'')) as out_16 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+16,'YYYYMMDD'),a.TIME_OUT,'')) as out_17 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+17,'YYYYMMDD'),a.TIME_OUT,'')) as out_18 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+18,'YYYYMMDD'),a.TIME_OUT,'')) as out_19 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+19,'YYYYMMDD'),a.TIME_OUT,'')) as out_20 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+20,'YYYYMMDD'),a.TIME_OUT,'')) as out_21 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+21,'YYYYMMDD'),a.TIME_OUT,'')) as out_22 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+22,'YYYYMMDD'),a.TIME_OUT,'')) as out_23 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+23,'YYYYMMDD'),a.TIME_OUT,'')) as out_24 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+24,'YYYYMMDD'),a.TIME_OUT,'')) as out_25 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+25,'YYYYMMDD'),a.TIME_OUT,'')) as out_26 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+26,'YYYYMMDD'),a.TIME_OUT,'')) as out_27 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+27,'YYYYMMDD'),a.TIME_OUT,'')) as out_28 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+28,'YYYYMMDD'),a.TIME_OUT,'')) as out_29 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+29,'YYYYMMDD'),a.TIME_OUT,'')) as out_30 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + p_from_dt + "','YYYYMMDD')+30,'YYYYMMDD'),a.TIME_OUT,'')) as out_31 " +
        ", NVL (c.seq, 0) seq,SUM(decode(a.hol_type, null, NVL(A.WT,0), 0)) WORK_TIME " +
		", sum(decode(a.hol_type, null, a.ot, 0)) OT " +
		", (SUM(NVL(A.NT, 0)) + SUM(NVL(A.ONT, 0))) NT " +
		", sum(decode(a.hol_type, null, 0, NVL(a.WT, 0) + NVL(a.ot, 0) )) HT " +
        " from thr_work_date a,thr_employee b,tco_org c " +
        "where a.del_if=0 and b.del_if=0 and c.del_if=0 " +
        "and a.THR_EMP_PK=b.pk and b.tco_org_pk=c.pk " +
        "and a.WORK_DT between '" + p_from_dt + "' and '" + p_to_dt + "' " +
        "and a.WORK_DT between b.join_dt and nvl(b.left_dt,'" + p_to_dt + "') " +
        "and b.join_dt<=a.WORK_DT " +
        "and (b.left_dt>a.WORK_DT or b.left_dt is null) " +
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
        l_Emp_id +
        "and decode('" + p_status + "','ALL','ALL',b.status)='" + p_status + "'" +
        " and decode('" + p_salary_period + "','ALL','ALL',nvl(b.sal_period,' '))='" + p_salary_period + "' " +
        " and decode('" + p_nation + "','ALL','ALL',nvl(b.nation,'01'))='" + p_nation + "' " +
        " GROUP BY A.THR_EMP_PK,c.org_NM,b.emp_id,b.full_name,b.join_dt,NVL (c.seq, 0) " +
        " ORDER BY NVL (c.seq, 0),c.org_nm, b.emp_id ";
				
		string SQL_work_from = " select m.from_dt " +
        "from thr_close m " +
        "where  m.del_if=0 and m.id='01' and m.month_close='" + p_work_mon + "' ";
		DataTable dt_from = CtlLib.TableReadOpen(SQL_work_from);
		l_work_from = dt_from.Rows[0][0].ToString();    
		
		string SQL1 = "select c.org_NM,b.emp_id,b.full_name " +
        ",to_char(to_date(b.join_dt,'yyyymmdd'),'dd/mm/yyyy') join_dt " +
        ",MAX(DECODE(A.WORK_DT,'" + l_work_from + "',a.TIME_IN,'')) as in_1 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+1,'YYYYMMDD'),a.TIME_IN,'')) as in_2 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+2,'YYYYMMDD'),a.TIME_IN,'')) as in_3 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+3,'YYYYMMDD'),a.TIME_IN,'')) as in_4 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+4,'YYYYMMDD'),a.TIME_IN,'')) as in_5 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+5,'YYYYMMDD'),a.TIME_IN,'')) as in_6 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+6,'YYYYMMDD'),a.TIME_IN,'')) as in_7 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+7,'YYYYMMDD'),a.TIME_IN,'')) as in_8 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+8,'YYYYMMDD'),a.TIME_IN,'')) as in_9 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+9,'YYYYMMDD'),a.TIME_IN,'')) as in_10 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+10,'YYYYMMDD'),a.TIME_IN,'')) as in_11 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+11,'YYYYMMDD'),a.TIME_IN,'')) as in_12 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+12,'YYYYMMDD'),a.TIME_IN,'')) as in_13 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+13,'YYYYMMDD'),a.TIME_IN,'')) as in_14 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+14,'YYYYMMDD'),a.TIME_IN,'')) as in_15 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+15,'YYYYMMDD'),a.TIME_IN,'')) as in_16 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+16,'YYYYMMDD'),a.TIME_IN,'')) as in_17 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+17,'YYYYMMDD'),a.TIME_IN,'')) as in_18 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+18,'YYYYMMDD'),a.TIME_IN,'')) as in_19 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+19,'YYYYMMDD'),a.TIME_IN,'')) as in_20 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+20,'YYYYMMDD'),a.TIME_IN,'')) as in_21 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+21,'YYYYMMDD'),a.TIME_IN,'')) as in_22 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+22,'YYYYMMDD'),a.TIME_IN,'')) as in_23 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+23,'YYYYMMDD'),a.TIME_IN,'')) as in_24 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+24,'YYYYMMDD'),a.TIME_IN,'')) as in_25 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+25,'YYYYMMDD'),a.TIME_IN,'')) as in_26 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+26,'YYYYMMDD'),a.TIME_IN,'')) as in_27 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+27,'YYYYMMDD'),a.TIME_IN,'')) as in_28 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+28,'YYYYMMDD'),a.TIME_IN,'')) as in_29 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+29,'YYYYMMDD'),a.TIME_IN,'')) as in_30 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+30,'YYYYMMDD'),a.TIME_IN,'')) as in_31 " +
        ",MAX(DECODE(A.WORK_DT,'" + l_work_from + "',a.TIME_OUT,'')) as out_1 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+1,'YYYYMMDD'),a.TIME_OUT,'')) as out_2 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+2,'YYYYMMDD'),a.TIME_OUT,'')) as out_3 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+3,'YYYYMMDD'),a.TIME_OUT,'')) as out_4 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+4,'YYYYMMDD'),a.TIME_OUT,'')) as out_5 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+5,'YYYYMMDD'),a.TIME_OUT,'')) as out_6 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+6,'YYYYMMDD'),a.TIME_OUT,'')) as out_7 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+7,'YYYYMMDD'),a.TIME_OUT,'')) as out_8 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+8,'YYYYMMDD'),a.TIME_OUT,'')) as out_9 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+9,'YYYYMMDD'),a.TIME_OUT,'')) as out_10 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+10,'YYYYMMDD'),a.TIME_OUT,'')) as out_11 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+11,'YYYYMMDD'),a.TIME_OUT,'')) as out_12 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+12,'YYYYMMDD'),a.TIME_OUT,'')) as out_13 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+13,'YYYYMMDD'),a.TIME_OUT,'')) as out_14 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+14,'YYYYMMDD'),a.TIME_OUT,'')) as out_15 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+15,'YYYYMMDD'),a.TIME_OUT,'')) as out_16 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+16,'YYYYMMDD'),a.TIME_OUT,'')) as out_17 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+17,'YYYYMMDD'),a.TIME_OUT,'')) as out_18 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+18,'YYYYMMDD'),a.TIME_OUT,'')) as out_19 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+19,'YYYYMMDD'),a.TIME_OUT,'')) as out_20 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+20,'YYYYMMDD'),a.TIME_OUT,'')) as out_21 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+21,'YYYYMMDD'),a.TIME_OUT,'')) as out_22 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+22,'YYYYMMDD'),a.TIME_OUT,'')) as out_23 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+23,'YYYYMMDD'),a.TIME_OUT,'')) as out_24 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+24,'YYYYMMDD'),a.TIME_OUT,'')) as out_25 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+25,'YYYYMMDD'),a.TIME_OUT,'')) as out_26 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+26,'YYYYMMDD'),a.TIME_OUT,'')) as out_27 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+27,'YYYYMMDD'),a.TIME_OUT,'')) as out_28 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+28,'YYYYMMDD'),a.TIME_OUT,'')) as out_29 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+29,'YYYYMMDD'),a.TIME_OUT,'')) as out_30 " +
        ",MAX(DECODE(A.WORK_DT,TO_CHAR(TO_DATE('" + l_work_from + "','YYYYMMDD')+30,'YYYYMMDD'),a.TIME_OUT,'')) as out_31 " +
        ", NVL (c.seq, 0) seq,SUM(decode(a.hol_type, null, NVL(A.WT,0), 0)) WORK_TIME " +
		", sum(decode(a.hol_type, null, a.ot, 0)) OT " +
		", (SUM(NVL(A.NT, 0)) + SUM(NVL(A.ONT, 0))) NT " +
		", sum(decode(a.hol_type, null, 0, NVL(a.WT, 0) + NVL(a.ot, 0) )) HT " +
        " from thr_work_date a,thr_employee b,tco_org c " +                   
        "where a.del_if=0 and b.del_if=0 and c.del_if=0 " +
        "and a.THR_EMP_PK=b.pk and b.tco_org_pk=c.pk " +
        "and a.WORK_DT between '" + l_work_from + "' and '" + p_to_dt + "' " +
        "and a.WORK_DT between b.join_dt and nvl(b.left_dt,'" + p_to_dt + "') " +
        "and b.join_dt<=a.WORK_DT " +
        " AND b.left_dt BETWEEN '" + p_from_dt + "' and '" + p_to_dt + "' " +
        "and b.left_dt is not null " +
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
        l_Emp_id +
        "and decode('" + p_status + "','ALL','ALL',b.status)='" + p_status + "'" +
        " and decode('" + p_nation + "','ALL','ALL',nvl(b.nation,'01'))='" + p_nation + "' " +
        " GROUP BY A.THR_EMP_PK,c.org_NM,b.emp_id,b.full_name,b.join_dt,NVL (c.seq, 0) " +
        " ORDER BY NVL (c.seq, 0),c.org_nm, b.emp_id ";
		
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
						
		//exSheet.Range["T2"].Value =	string.Format("IN - OUT SUMMARY - {0}", p_dept_nm);
		exSheet.Range["T3:U3"].Value =	dt_Com.Rows[0][4].ToString();
		
		//header columns
		for (int row = 0; row < row_cal; row++)
		{
			exSheet.Range[4, s_col + row, 5, s_col + row].Value = double.Parse(dt_Cal.Rows[row][0].ToString());
		}
		
		s_row = 6;
		//insert new row
		for (int row = 1; row < row_emp; row++)
		{
			exSheet.Range["A8:AT9"].EntireRow.Insert();
		}

		exSheet.Range["A6:AT7"].Rows.Copy(exSheet.Range["A" + (s_row + 2) + ":" + "AT" + (((row_emp - 1) * 2) + s_row -1 + 2)] , XlPasteType.xlPasteAll);

		for (int row = 0; row < row_emp; row++)
		{
			exSheet.Range["A" + (s_row + row) + ":A" + (s_row + row + 1)].Value = row + 1;
			exSheet.Range["B" + (s_row + row) + ":B" + (s_row + row + 1)].Value = dt_Emp.Rows[row]["ORG_NM"].ToString();
			exSheet.Range["C" + (s_row + row) + ":C" + (s_row + row + 1)].Value = dt_Emp.Rows[row]["EMP_ID"].ToString();
			exSheet.Range["D" + (s_row + row) + ":D" + (s_row + row + 1)].Value = dt_Emp.Rows[row]["FULL_NAME"].ToString();
			exSheet.Range["E" + (s_row + row) + ":E" + (s_row + row + 1)].Value = dt_Emp.Rows[row]["JOIN_DT"].ToString();

			GeneralData(exSheet, "1", "G", s_row + row, row, "IN_1", dt_Emp);
			GeneralData(exSheet, "1", "G", s_row + row + 1, row, "OUT_1", dt_Emp);
			GeneralData(exSheet, "1", "H", s_row + row, row, "IN_2", dt_Emp);
			GeneralData(exSheet, "1", "H", s_row + row + 1, row, "OUT_2", dt_Emp);
			GeneralData(exSheet, "1", "I", s_row + row, row, "IN_3", dt_Emp);
			GeneralData(exSheet, "1", "I", s_row + row + 1, row, "OUT_3", dt_Emp);
			GeneralData(exSheet, "1", "J", s_row + row, row, "IN_4", dt_Emp);
			GeneralData(exSheet, "1", "J", s_row + row + 1, row, "OUT_4", dt_Emp);
			GeneralData(exSheet, "1", "K", s_row + row, row, "IN_5", dt_Emp);
			GeneralData(exSheet, "1", "K", s_row + row + 1, row, "OUT_5", dt_Emp);
			GeneralData(exSheet, "1", "L", s_row + row, row, "IN_6", dt_Emp);
			GeneralData(exSheet, "1", "L", s_row + row + 1, row, "OUT_6", dt_Emp);
			GeneralData(exSheet, "1", "M", s_row + row, row, "IN_7", dt_Emp);
			GeneralData(exSheet, "1", "M", s_row + row + 1, row, "OUT_7", dt_Emp);
			GeneralData(exSheet, "1", "N", s_row + row, row, "IN_8", dt_Emp);
			GeneralData(exSheet, "1", "N", s_row + row + 1, row, "OUT_8", dt_Emp);
			GeneralData(exSheet, "1", "O", s_row + row, row, "IN_9", dt_Emp);
			GeneralData(exSheet, "1", "O", s_row + row + 1, row, "OUT_9", dt_Emp);
			GeneralData(exSheet, "1", "P", s_row + row, row, "IN_10", dt_Emp);
			GeneralData(exSheet, "1", "P", s_row + row + 1, row, "OUT_10", dt_Emp);

			GeneralData(exSheet, "1", "Q", s_row + row, row, "IN_11", dt_Emp);
			GeneralData(exSheet, "1", "Q", s_row + row + 1, row, "OUT_11", dt_Emp);
			GeneralData(exSheet, "1", "R", s_row + row, row, "IN_12", dt_Emp);
			GeneralData(exSheet, "1", "R", s_row + row + 1, row, "OUT_12", dt_Emp);
			GeneralData(exSheet, "1", "S", s_row + row, row, "IN_13", dt_Emp);
			GeneralData(exSheet, "1", "S", s_row + row + 1, row, "OUT_13", dt_Emp);
			GeneralData(exSheet, "1", "T", s_row + row, row, "IN_14", dt_Emp);
			GeneralData(exSheet, "1", "T", s_row + row + 1, row, "OUT_14", dt_Emp);
			GeneralData(exSheet, "1", "U", s_row + row, row, "IN_15", dt_Emp);
			GeneralData(exSheet, "1", "U", s_row + row + 1, row, "OUT_15", dt_Emp);
			GeneralData(exSheet, "1", "V", s_row + row, row, "IN_16", dt_Emp);
			GeneralData(exSheet, "1", "V", s_row + row + 1, row, "OUT_16", dt_Emp);
			GeneralData(exSheet, "1", "W", s_row + row, row, "IN_17", dt_Emp);
			GeneralData(exSheet, "1", "W", s_row + row + 1, row, "OUT_17", dt_Emp);
			GeneralData(exSheet, "1", "X", s_row + row, row, "IN_18", dt_Emp);
			GeneralData(exSheet, "1", "X", s_row + row + 1, row, "OUT_18", dt_Emp);
			GeneralData(exSheet, "1", "Y", s_row + row, row, "IN_19", dt_Emp);
			GeneralData(exSheet, "1", "Y", s_row + row + 1, row, "OUT_19", dt_Emp);
			GeneralData(exSheet, "1", "Z", s_row + row, row, "IN_20", dt_Emp);
			GeneralData(exSheet, "1", "Z", s_row + row + 1, row, "OUT_20", dt_Emp);

			GeneralData(exSheet, "1", "AA", s_row + row, row, "IN_21", dt_Emp);
			GeneralData(exSheet, "1", "AA", s_row + row + 1, row, "OUT_21", dt_Emp);
			GeneralData(exSheet, "1", "AB", s_row + row, row, "IN_22", dt_Emp);
			GeneralData(exSheet, "1", "AB", s_row + row + 1, row, "OUT_22", dt_Emp);
			GeneralData(exSheet, "1", "AC", s_row + row, row, "IN_23", dt_Emp);
			GeneralData(exSheet, "1", "AC", s_row + row + 1, row, "OUT_23", dt_Emp);
			GeneralData(exSheet, "1", "AD", s_row + row, row, "IN_24", dt_Emp);
			GeneralData(exSheet, "1", "AD", s_row + row + 1, row, "OUT_24", dt_Emp);
			GeneralData(exSheet, "1", "AE", s_row + row, row, "IN_25", dt_Emp);
			GeneralData(exSheet, "1", "AE", s_row + row + 1, row, "OUT_25", dt_Emp);
			GeneralData(exSheet, "1", "AF", s_row + row, row, "IN_26", dt_Emp);
			GeneralData(exSheet, "1", "AF", s_row + row + 1, row, "OUT_26", dt_Emp);
			GeneralData(exSheet, "1", "AG", s_row + row, row, "IN_27", dt_Emp);
			GeneralData(exSheet, "1", "AG", s_row + row + 1, row, "OUT_27", dt_Emp);
			GeneralData(exSheet, "1", "AH", s_row + row, row, "IN_28", dt_Emp);
			GeneralData(exSheet, "1", "AH", s_row + row + 1, row, "OUT_28", dt_Emp);
			GeneralData(exSheet, "1", "AI", s_row + row, row, "IN_29", dt_Emp);
			GeneralData(exSheet, "1", "AI", s_row + row + 1, row, "OUT_29", dt_Emp);
			GeneralData(exSheet, "1", "AJ", s_row + row, row, "IN_30", dt_Emp);
			GeneralData(exSheet, "1", "AJ", s_row + row + 1, row, "OUT_30", dt_Emp);

			GeneralData(exSheet, "1", "AK", s_row + row, row, "IN_31", dt_Emp);
			GeneralData(exSheet, "1", "AK", s_row + row + 1, row, "OUT_31", dt_Emp);

			GeneralData(exSheet, "2", "AL", s_row + row, row, "WORK_TIME", dt_Emp);   
			GeneralData(exSheet, "2", "AM", s_row + row, row, "OT", dt_Emp);
			GeneralData(exSheet, "2", "AN", s_row + row, row, "NT", dt_Emp);
			GeneralData(exSheet, "2", "AO", s_row + row, row, "HT", dt_Emp);

			s_row++;
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
