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

public partial class rpt_hrti01200_0 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //CtlLib.SetUser("hr");
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string p_user, p_tco_org_pk, p_thr_group_pk, p_status, p_lday, p_ale, p_month, p_input, p_nation, p_from, p_to,p_lang;
        int p_sql;
        p_user = Request["p_user"].ToString();
        p_thr_group_pk = Request["p_thr_group_pk"].ToString();
        p_status = Request["p_status"].ToString();
        p_lday = Request["p_lday"].ToString();
        p_ale = Request["p_ale"].ToString();
        p_month = Request["p_month"].ToString();
        p_input = Request["p_input"].ToString();
        p_nation = Request["p_nation"].ToString();
        p_tco_org_pk = Request["p_tco_org_pk"].ToString();
        p_from = Request["p_from"].ToString();
        p_to = Request["p_to"].ToString();
		p_lang = Request["p_lang"].ToString();
		
        string p_left_from = Request["p_left_from"].ToString();
        string p_left_to = Request["p_left_to"].ToString();
		
        p_sql = int.Parse(Request["sql"]);
        string SQL2 = "select 1 from  vhr_hr_code where id='HR0122' and code='02'";
        int option = 0;
        string SQL = "";
		
		string TemplateFile;
        if(p_lang == "ENG")
		{
			TemplateFile = "rpt_hrti01200_0_eng.xls";
		}
        else
			TemplateFile = "rpt_hrti01200_0_vie.xls";
		
        string TempFile = "../../../../system/temp/rpt_hrti01200_0_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;
		string para = "'"+ p_tco_org_pk + "','" + p_thr_group_pk + "','" + p_status + "','" + p_lday + "','" + p_ale 
						+ "','" + p_month + "','" + p_input + "','" + p_nation + "','" + p_from + "','" + p_to + "','" + p_sql+"'";
						
        if (p_sql == 1)
            SQL
         = "SELECT    " +
                 "               al.dept_nm, al.group_nm, al.emp_id, al.full_nm, " +
                 "               TO_CHAR (TO_DATE (al.join_date, 'YYYYMMDD'), 'DD/MM/YYYY') " +
                 "               ,nvl(al.total_unpay,0) as ale_last_year " +
                 "               ,nvl(al.annual_leave_days_in_year,0) " +
                 "           ,nvl(al.ale_plus,0) " +
                 " ,case when al.Left_dt is null or substr(nvl(al.left_dt,'30000101'),1,6)> '" + p_month + "' then  " +
                 "            HR_F_CAL_ALE('" + p_month + "',AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0),al.emp_pk) " +
                 "            else   HR_F_CAL_ALE_STOP(al.Left_dt,AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0),al.emp_pk) end   AS al_real " +
                 "               ,nvl(yearsum,0) AS used, " +
                 "               case when al.Left_dt is null or substr(nvl(al.left_dt,'30000101'),1,6)>'" + p_month + "' then  " +
                 "            HR_F_CAL_ALE('" + p_month + "',AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0),al.emp_pk) " +
                 "            else    HR_F_CAL_ALE_STOP(al.Left_dt,AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0),al.emp_pk)  end   " +
                 "       - NVL(yearsum,0)+nvl(al.total_unpay,0)  AS UNUSED, " +
                 "      case when al.Left_dt is null or substr(nvl(al.left_dt,'30000101'),1,6)> SUBSTR('" + p_month + "',1,4)||'12' then  " +
                 "    HR_F_CAL_ALE(SUBSTR('" + p_month + "',1,4)||'12',AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0),al.emp_pk) " +
                 "     else       HR_F_CAL_ALE_STOP(al.Left_dt,AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0),al.emp_pk) " +
                 "    end - NVL(yearsum,0)+nvl(al.total_unpay,0) AS unused_in_yeaar, " +
                 "               0 as pay, " +
                 "   case when al.Left_dt is null or substr(nvl(al.left_dt,'30000101'),1,6)>'" + p_month + "' then  " +
                 "            HR_F_CAL_ALE('" + p_month + "',AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0),al.emp_pk) " +
                 "          else  HR_F_CAL_ALE_STOP(al.Left_dt,AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0),al.emp_pk) " +
                 "     end   - NVL(yearsum,0)+nvl(al.total_unpay,0) AS UNPAY,                " +
                 "               decode(mon01,null,0,mon01), decode(mon02,null,0,mon02), " +
                 "               decode(mon03,null,0,mon03), decode(mon04,null,0,mon04), " +
                 "               decode(mon05,null,0,mon05), decode(mon06,null,0,mon06), " +
                 "               decode(mon07,null,0,mon07), decode(mon08,null,0,mon08), " +
                 "               decode(mon09,null,0,mon09), decode(mon10,null,0,mon10), " +
                 "               decode(mon11,null,0,mon11), decode(mon12,null,0,mon12) ,to_char(sysdate,'dd/mm/YYYY') " +
                 "               FROM (SELECT b.pk AS group_pk, b.workgroup_nm AS group_nm, " +
                 "                       a.emp_id AS emp_id, a.full_name AS full_nm, " +
                 "                       a.ale_day_in_year AS annual_leave_days_in_year, a.ale_plus as ale_plus " +
                 "                       ,a.join_dt AS join_date, a.pk AS emp_pk " +
                 "                       ,c.UNUSED as ale_unused " +
                 "                       ,c.ale_pay as ale_pay,a.al_pay_yn as al_pay_yn,c.total_unpay as total_unpay " +
                 "                       ,decode(nvl(a.AL_PAY_YN,'N'),'Y','-1','0') as pay " +
                 "                       ,a.LEFT_DT,d.org_nm as dept_nm " +
                 "                  FROM thr_employee a, thr_work_group b,thr_annual_leave c,tco_org d " +
                 "            WHERE a.del_if = 0 and (a.LEFT_DT is null or substr(nvl(a.LEFT_DT,'30001010'),1,4) >= substr('" + p_month + "',1,4) ) " +
                 "                   AND b.del_if = 0 and d.del_if=0 and d.pk=a.tco_org_pk " +
                 "                   AND c.del_if(+)=0  " +
                 "                   and a.pk=c.thr_emp_pk(+) " +
                 "                   and c.an_year(+)=TO_CHAR(ADD_MONTHS(TO_DATE('" + p_month + "','YYYYMM'),-12),'YYYY')  " +
                 "                   AND a.thr_wg_pk = b.pk " +
                 "                   AND (DECODE ('" + p_status + "', 'ALL', '" + p_status + "', case when a.LEFT_DT is null or substr(a.LEFT_DT,1,6)>='" + p_month + "' then 'A'else 'R' end ) ='" + p_status + "') " +
                "           AND (a.left_dt is not null and  to_date(a.left_dt,'yyyymmdd') between to_date('" + p_left_from + "','yyyymmdd') and to_date('" + p_left_to + "','yyyymmdd')  " +
                "             or '" + p_left_from + "' is null or '" + p_left_to + "' is null) " +

         "                   AND (DECODE ('" + p_nation + "','ALL', '" + p_nation + "',a.nation) = '" + p_nation + "') " +
                 "                   AND (DECODE ('" + p_thr_group_pk + "','ALL', '" + p_thr_group_pk + "',a.thr_wg_pk) = '" + p_thr_group_pk + "') " +
                 "              AND ('" + p_input + "' IS NULL  " +
                "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
                "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
                "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
                 "                   AND (a.tco_org_pk IN ( " +
                 "                              SELECT     g.pk " +
                 "                                    FROM TCO_ORG g " +
                 "                                   WHERE g.del_if = 0 " +
                 "                              START WITH g.pk =DECODE ('" + p_tco_org_pk + "','ALL', 0,'" + p_tco_org_pk + "') " +
                 "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
                 "                        OR '" + p_tco_org_pk + "' = 'ALL' " +
                 "                       )) al, " +
                 " (SELECT   e.emp_id emp_id, e.pk emp_pk, " + 
                "                         SUM (DECODE (SUBSTR (a.work_mon, 5, 2),'01', round(a.ale_hours/8,2),0)) mon01, " +
                "                         SUM (DECODE (SUBSTR (a.work_mon, 5, 2),'02', round(a.ale_hours/8,2),0)) mon02, " +
                "                         SUM (DECODE (SUBSTR (a.work_mon, 5, 2),'03', round(a.ale_hours/8,2),0)) mon03, " +
                "                         SUM (DECODE (SUBSTR (a.work_mon, 5, 2),'04', round(a.ale_hours/8,2),0)) mon04, " +
                "                         SUM (DECODE (SUBSTR (a.work_mon, 5, 2),'05', round(a.ale_hours/8,2),0)) mon05, " +
                "                         SUM (DECODE (SUBSTR (a.work_mon, 5, 2),'06', round(a.ale_hours/8,2),0)) mon06, " +
                "                         SUM (DECODE (SUBSTR (a.work_mon, 5, 2),'07', round(a.ale_hours/8,2),0)) mon07, " +
                "                         SUM (DECODE (SUBSTR (a.work_mon, 5, 2),'08', round(a.ale_hours/8,2),0)) mon08, " +
                "                         SUM (DECODE (SUBSTR (a.work_mon, 5, 2),'09', round(a.ale_hours/8,2),0)) mon09, " +
                "                         SUM (DECODE (SUBSTR (a.work_mon, 5, 2),'10', round(a.ale_hours/8,2),0)) mon10, " +
                "                         SUM (DECODE (SUBSTR (a.work_mon, 5, 2),'11', round(a.ale_hours/8,2),0)) mon11, " +
                "                         SUM (DECODE (SUBSTR (a.work_mon, 5, 2),'12', round(a.ale_hours/8,2),0)) mon12, " +
                "                         round(SUM (nvl(a.ale_hours,0)/8),2) yearsum " +
                "                    FROM thr_current_ale a,thr_employee e " +
                "                   WHERE a.del_if=0 and e.del_if=0 and a.thr_emp_pk=e.pk  " +
                "                    and a.work_mon <= '" + p_month + "' " +
                "                     AND SUBSTR (a.work_mon, 1, 4) = SUBSTR ('" + p_month + "', 1, 4) " +
                "              AND ('" + p_input + "' IS NULL  " +
                "                     OR  (UPPER(E.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
                "                     OR  (UPPER(E.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
                "                     OR  (UPPER(E.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
                "                     AND e.TCO_ORG_PK IN ( " +
                "                              SELECT     G.PK " +
                "                                    FROM TCO_ORG G " +
                "                                   WHERE G.DEL_IF = 0 " +
                "                              START WITH G.PK =(CASE WHEN '" + p_tco_org_pk + "'='ALL' THEN G.PK ELSE TO_NUMBER('" + p_tco_org_pk + "') END) " +
                "                              CONNECT BY PRIOR G.PK = G.P_PK) " +
                "                GROUP BY e.emp_id, e.pk) alsum " +
/*
                 "               (SELECT   a.emp_id emp_id, a.thr_emp_pk emp_pk, " +
                 "                         SUM (DECODE (SUBSTR (a.yearmon, 5, 2),'01', a.mon_cnt,0)) mon01, " +
                 "                         SUM (DECODE (SUBSTR (a.yearmon, 5, 2),'02', a.mon_cnt,0)) mon02, " +
                 "                         SUM (DECODE (SUBSTR (a.yearmon, 5, 2),'03', a.mon_cnt,0)) mon03, " +
                 "                         SUM (DECODE (SUBSTR (a.yearmon, 5, 2),'04', a.mon_cnt,0)) mon04, " +
                 "                         SUM (DECODE (SUBSTR (a.yearmon, 5, 2),'05', a.mon_cnt,0)) mon05, " +
                 "                         SUM (DECODE (SUBSTR (a.yearmon, 5, 2),'06', a.mon_cnt,0)) mon06, " +
                 "                         SUM (DECODE (SUBSTR (a.yearmon, 5, 2),'07', a.mon_cnt,0)) mon07, " +
                 "                         SUM (DECODE (SUBSTR (a.yearmon, 5, 2),'08', a.mon_cnt,0)) mon08, " +
                 "                         SUM (DECODE (SUBSTR (a.yearmon, 5, 2),'09', a.mon_cnt,0)) mon09, " +
                 "                         SUM (DECODE (SUBSTR (a.yearmon, 5, 2),'10', a.mon_cnt,0)) mon10, " +
                 "                         SUM (DECODE (SUBSTR (a.yearmon, 5, 2),'11', a.mon_cnt,0)) mon11, " +
                 "                         SUM (DECODE (SUBSTR (a.yearmon, 5, 2),'12', a.mon_cnt,0)) mon12, " +
                 "                         SUM (a.mon_cnt) yearsum " +
                 "                    FROM vhr_annual_leave a " +
                 "                   WHERE a.yearmon <= '" + p_month + "' " +
                 "                     AND SUBSTR (a.yearmon, 1, 4) = SUBSTR ('" + p_month + "', 1, 4) " +
                 "                     AND (DECODE ('" + p_search + "','1', UPPER (a.emp_id),'2', a.id_num,'3', UPPER (a.full_name)) LIKE '%' || UPPER ('" + p_input + "') " +
                 "                          OR '" + p_input + "' IS NULL " +
                 "                         ) " +
                 "                     AND (   a.tco_org_pk IN ( " +
                 "                                SELECT     g.pk " +
                 "                                      FROM TCO_ORG g " +
                 "                                     WHERE g.del_if = 0 " +
                 "                                START WITH g.pk =DECODE ('" + p_tco_org_pk + "','ALL', 0,'" + p_tco_org_pk + "') " +
                 "                                CONNECT BY PRIOR g.pk = g.p_pk) " +
                 "                          OR '" + p_tco_org_pk + "' = 'ALL' " +
                 "                         ) " +
                 "                GROUP BY a.emp_id, a.thr_emp_pk) alsum " +
*/
                 "         WHERE al.emp_pk = alsum.emp_pk(+) " +
                 "           AND (   ( case when al.Left_dt is null or substr(nvl(al.left_dt,'30000101'),1,6)>='" + p_month + "' then  " +
                 "           HR_F_CAL_ALE('" + p_month + "',AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0),al.emp_pk) " +
                 "            else   HR_F_CAL_ALE_STOP(al.Left_dt,AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0),al.emp_pk) " +
                 "          end   -NVL (yearsum,0)+nvl(al.total_unpay,0)>= '" + p_ale + "' " +
                 "           AND '" + p_lday + "' = '1'   ) " +
                 "                OR ( case when al.Left_dt is null or substr(nvl(al.left_dt,'30000101'),1,6)>='" + p_month + "' then  " +
                 "            HR_F_CAL_ALE('" + p_month + "',AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0),al.emp_pk) " +
                 "            else   HR_F_CAL_ALE_STOP(al.Left_dt,AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0),al.emp_pk) " +
                 "             end    - NVL (yearsum, 0)+nvl(al.total_unpay,0) = '" + p_ale + "' " +
                 "            AND '" + p_lday + "' = '2' ) " +
                 "                OR ( case when al.Left_dt is null or substr(nvl(al.left_dt,'30000101'),1,6)>='" + p_month + "' then  " +
                 "            HR_F_CAL_ALE('" + p_month + "',AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0),al.emp_pk) " +
                 "            else     HR_F_CAL_ALE_STOP(al.Left_dt,AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0),al.emp_pk) " +
                 "                end   - NVL (yearsum, 0)+nvl(al.total_unpay,0) <= '" + p_ale + "' " +
                 "           AND '" + p_lday + "' = '3' " +
                 "          ) " +
                 "                OR '" + p_ale + "' IS NULL " +
                 "               ) " +
               "           AND al.join_date <=TO_CHAR (LAST_DAY (TO_DATE ('" + p_month + "', 'YYYYMM')), 'YYYYMMDD') " +
               "           AND (to_date(al.join_date,'yyyymmdd') between to_date('" + p_from + "','yyyymmdd') and to_date('" + p_to + "','yyyymmdd')  " +
               "             or '" + p_from + "' is null or '" + p_to + "' is null) " +

                     "      ORDER BY al.dept_nm, al.group_nm, al.emp_id ";



        else if (p_sql == 2)
            SQL
           = " SELECT  A.org_nm,A.GROUP_NM,A.EMP_ID,A.FULL_NAME " +
               "        ,TO_CHAR(TO_DATE(A.JOIN_DT,'YYYYMMDD'),'DD/MM/YYYY') " +
               "        ,nvl(A.ALE_LAST_YEAR,0) " +
               "        ,nvl(A.ALE_IN_YEAR,0) " +
               "        ,nvl(A.ALE_PLUS,0) " +
               "        ,nvl(A.ALE_REAL,0) " +
               "        ,nvl(A.USED,0) " +
               "        ,nvl(A.UNUSED,0)  " +
               "        ,nvl(A.UNUSED,0)        " +
               "        ,case when nvl(A.EMPLOYEE_PAY,0) >0 then -1* nvl(A.EMPLOYEE_PAY,0) else nvl(A.ALE_PAY,0) end " +
               "        ,nvl(A.ALE_UNPAY,0) " +
               "        ,nvl(DECODE(A.JAN,0,NULL,A.JAN),0),nvl(DECODE(A.FEB,0,NULL,A.FEB),0) " +
               "        ,nvl(DECODE(A.MAR,0,NULL,A.MAR),0),nvl(DECODE(A.APR,0,NULL,A.APR),0) " +
               "        ,nvl(DECODE(A.MAY,0,NULL,A.MAY),0),nvl(DECODE(A.JUN,0,NULL,A.JUN),0) " +
               "        ,nvl(DECODE(A.JUL,0,NULL,A.JUL),0),nvl(DECODE(A.AUG,0,NULL,A.AUG),0) " +
               "        ,nvl(DECODE(A.SEP,0,NULL,A.SEP),0),nvl(DECODE(A.OCT,0,NULL,A.OCT),0) " +
               "        ,nvl(DECODE(A.NOV,0,NULL,A.NOV),0),nvl(DECODE(A.DEC,0,NULL,A.DEC),0) " +
                "      ,to_char(sysdate,'dd/mm/YYYY') " +
               "  FROM THR_ANNUAL_LEAVE A,THR_ANNUAL_LEAVE B,THR_EMPLOYEE C,tco_org d " +
               "  WHERE A.DEL_IF=0 AND B.DEL_IF(+)=0 AND C.DEL_IF=0 AND A.THR_EMP_PK=C.PK and d.del_if=0 and a.TCO_org_PK=d.pk  " +
               "    AND (DECODE ('" + p_thr_group_pk + "','ALL', '" + p_thr_group_pk + "',a.thr_Group_pk) = '" + p_thr_group_pk + "') " +
               "   AND B.AN_YEAR(+)=TO_CHAR(ADD_MONTHS(TO_DATE('" + p_month + "','YYYYMM'),-12),'YYYY') " +
               "   AND A.THR_EMP_PK=B.THR_EMP_PK(+) " +
               "   AND A.AN_YEAR=SUBSTR('" + p_month + "',1,4) " +
               "              AND ('" + p_input + "' IS NULL  " +
                "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
                "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
                "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
               " AND (   a.tco_org_pk IN ( " +
               "                              SELECT     g.pk " +
               "                                    FROM TCO_ORG g " +
               "                                   WHERE g.del_if = 0 " +
               "                              START WITH g.pk =DECODE ('" + p_tco_org_pk + "','ALL', 0,'" + p_tco_org_pk + "') " +
               "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
               "                        OR '" + p_tco_org_pk + "' = 'ALL') " +
                "  AND (( a.ale_unpay >='" + p_ale + "' AND '" + p_lday + "'='1') " +
               "    OR (a.ale_unpay='" + p_ale + "' AND '" + p_lday + "'='2') " +
               "    OR (a.ale_unpay<='" + p_ale + "' AND '" + p_lday + "'='3') " +
               "    OR '" + p_ale + "' IS NULL) " +
               "    AND (DECODE ('" + p_status + "', 'ALL', '" + p_status + "', a.status) ='" + p_status + "') " +
               "    AND (DECODE ('" + p_nation + "', 'ALL', '" + p_nation + "', c.nation) ='" + p_nation + "') " +
                "           AND (to_date(c.join_dt,'yyyymmdd') between to_date('" + p_from + "','yyyymmdd') and to_date('" + p_to + "','yyyymmdd')  " +
                "             or '" + p_from + "' is null or '" + p_to + "' is null) " +
                "           AND (c.left_dt is not null and  to_date(c.left_dt,'yyyymmdd') between to_date('" + p_left_from + "','yyyymmdd') and to_date('" + p_left_to + "','yyyymmdd')  " +
           "             or '" + p_left_from + "' is null or '" + p_left_to + "' is null) " +

                " ORDER BY  A.org_nm,A.GROUP_NM,A.EMP_ID ";
        else
            SQL
         = " SELECT  A.org_nm,A.GROUP_NM,A.EMP_ID,A.FULL_NAME " +
             "        ,TO_CHAR(TO_DATE(A.JOIN_DT,'YYYYMMDD'),'DD/MM/YYYY') " +
             "        ,nvl(A.ALE_LAST_YEAR,0) " +
             "        ,nvl(A.ALE_IN_YEAR,0) " +
             "        ,nvl(A.ALE_PLUS,0) " +
             "        ,nvl(A.ALE_REAL,0) " +
             "        ,nvl(A.USED,0) " +
             "        ,nvl(A.UNUSED,0)  " +
             "        ,nvl(A.UNUSED,0)        " +
             "        ,case when nvl(A.EMPLOYEE_PAY,0) >0 then -1* nvl(A.EMPLOYEE_PAY,0) else nvl(A.ALE_PAY,0) end " +
             "        ,nvl(A.ALE_UNPAY,0) " +
             "        ,nvl(DECODE(A.JAN,0,NULL,A.JAN),0),nvl(DECODE(A.FEB,0,NULL,A.FEB),0) " +
             "        ,nvl(DECODE(A.MAR,0,NULL,A.MAR),0),nvl(DECODE(A.APR,0,NULL,A.APR),0) " +
             "        ,nvl(DECODE(A.MAY,0,NULL,A.MAY),0),nvl(DECODE(A.JUN,0,NULL,A.JUN),0) " +
             "        ,nvl(DECODE(A.JUL,0,NULL,A.JUL),0),nvl(DECODE(A.AUG,0,NULL,A.AUG),0) " +
             "        ,nvl(DECODE(A.SEP,0,NULL,A.SEP),0),nvl(DECODE(A.OCT,0,NULL,A.OCT),0) " +
             "        ,nvl(DECODE(A.NOV,0,NULL,A.NOV),0),nvl(DECODE(A.DEC,0,NULL,A.DEC),0) " +
              "      ,to_char(sysdate,'dd/mm/YYYY') " +
             "  FROM THR_ANNUAL_LEAVE A,THR_ANNUAL_LEAVE B,THR_EMPLOYEE C,tco_org d " +
             "  WHERE A.DEL_IF=0 AND B.DEL_IF(+)=0 AND C.DEL_IF=0 AND A.THR_EMP_PK=C.PK and d.del_if=0 and a.TCO_org_PK=d.pk  " +
             "  AND (DECODE ('" + p_thr_group_pk + "','ALL', '" + p_thr_group_pk + "',a.thr_group_pk) = '" + p_thr_group_pk + "') " +
             "  AND (DECODE ('" + p_nation + "','ALL', '" + p_nation + "',c.nation) = '" + p_nation + "') " +
             "   AND B.AN_YEAR(+)='" + p_month + "'-1" +
             "   AND A.THR_EMP_PK=B.THR_EMP_PK(+) " +
             "   AND A.AN_YEAR='" + p_month + "' " +
             "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
             " and ( '" + p_status + "'='ALL'   " +
          "            or('" + p_status + "'='A' and nvl(a.status,'A')='A' and nvl(a.resign_pay_yn,'N')='N')  " +
          "            or('" + p_status + "'='R' and nvl(a.status,'A')='R' )  " +
          "            or('" + p_status + "'='Y' and nvl(a.resign_pay_yn,'N')='Y' )  " +
          "     )      " +
             " AND (   a.tco_org_pk IN ( " +
             "                              SELECT     g.pk " +
             "                                    FROM TCO_ORG g " +
             "                                   WHERE g.del_if = 0 " +
             "                              START WITH g.pk =DECODE ('" + p_tco_org_pk + "','ALL', 0,'" + p_tco_org_pk + "') " +
             "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
             "                        OR '" + p_tco_org_pk + "' = 'ALL') " +
               " ORDER BY A.org_nm,A.GROUP_NM,A.EMP_ID ";


                // Response.Write(SQL);
                // Response.End();
                DataTable dt_total = CtlLib.TableReadOpen(SQL);
                DataTable dt_option = CtlLib.TableReadOpen(SQL2);
                if (dt_option.Rows.Count > 0)
                    option = 1;

                //Response.End();          
                int i;
                int irow,icol;
                irow = dt_total.Rows.Count;
                icol = dt_total.Columns.Count;
                if (irow == 0)
                {
                    Response.Write("There is no data");
                    Response.End();
                }

                Boolean p = (p_sql == 1 || p_sql == 2);
                string str = (p) ? p_month.Substring(4, 2) + "/" + p_month.Substring(0, 4) : p_month;
				if(p_lang=="ENG")
					exSheet.Cells[1, 1].Value ="ANNUAL LEAVE REPORT IN " + str;
				else
					exSheet.Cells[1,1].Value ="BÁO CÁO PHÉP NĂM TRONG" +str;
                exSheet.Cells[2, 3].Value = p_user;
                exSheet.Cells[3, 3].Value = dt_total.Rows[0][26].ToString();


            //Insert new row
           
            int row_pos = 7;
            
            for (i = 0; i < irow - 1; i++)
            {

                exSheet.Range[row_pos + i, 1].Rows.EntireRow.Insert();
            }

            double[] total = new double[60];
            for (int j = 5; j < icol-1; j++)
            {
                total[j] = 0;
            }


            //show data
            row_pos = 6;
            for (i = 0; i < irow; i++)
            {
                exSheet.Cells[row_pos + i, 1].Value = i + 1;
                for (int j = 0; j < icol-1; j++)
                {
                    if (IsNumeric(dt_total.Rows[i][j].ToString())&& j !=2)
                    {
                        exSheet.Cells[row_pos + i, j + 2].Value = Double.Parse(dt_total.Rows[i][j].ToString());
                        total[j] = total[j] + Double.Parse(dt_total.Rows[i][j].ToString());
                    }
                    else
                    {
                        exSheet.Cells[row_pos + i, j + 2].Value = dt_total.Rows[i][j].ToString();
                    }
                }
            }
            // show total
            for (int j = 5; j < icol-1; j++)
            {                
                exSheet.Cells[row_pos + irow, j+2].Value = total[j];
            }

        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }


        // hide row firts 

        //range = exSheet.Range["A1"];
        // hide row A5 
        //range.Rows.Hidden = true;
        
        exBook.SaveAs(TempFile);
        //CtlLib.ExcelToPdf(TempFile);
        //string pdfFilePath = TempFile.Replace(".xls", ".pdf");

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
}