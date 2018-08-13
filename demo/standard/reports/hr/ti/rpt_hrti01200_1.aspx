<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data"%>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
    string p_user,p_tco_org_pk,p_thr_group_pk,p_status,p_lday,p_ale,p_month,p_search,p_input,p_nation,p_from,p_to;
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

    string p_left_from = Request["p_left_from"].ToString();
    string p_left_to = Request["p_left_to"].ToString();
    
    p_sql = int.Parse(Request["sql"]);
     string SQL2="select 1 from  vhr_hr_code where id='HR0122' and code='02'";
     int option=0;
    string SQL="";
    
    if (p_sql == 1)
   SQL
= "SELECT    " + 
        "               al.dept_nm, al.group_nm, al.emp_id, al.full_nm, " +
        "               TO_CHAR (TO_DATE (al.join_date, 'YYYYMMDD'), 'DD/MM/YYYY') " +
        "               ,nvl(al.ale_unpay,0) as ale_last_year " +
        "               ,nvl(al.ale_next_year,0) as lend_lastyear " +
        "             ,nvl(al.borrow_al_next_year,0) as borrow_last " +
        "               ,al.annual_leave_days_in_year " +
         "           ,al.ale_plus " +
        " ,case when al.Left_dt is null or substr(nvl(al.left_dt,'30000101'),1,6)> '" + p_month + "' then  "+
        "            HR_F_CAL_ALE('" + p_month + "',AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0)) "+
        "            else   HR_F_CAL_ALE_STOP(al.Left_dt,AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0)) end   AS al_real "+  
        "               ,0 as lend_inyear " +
        "               ,0  as borrow_in  " +
        "               ,nvl(yearsum,0) AS used, " +
        "               case when al.Left_dt is null or substr(nvl(al.left_dt,'30000101'),1,6)>='"+p_month+"' then  "+
        "            HR_F_CAL_ALE('" + p_month + "',AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0)) " +
        "            else    HR_F_CAL_ALE_STOP(al.Left_dt,AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0))  end   " +
        "       +  nvl(al.ale_next_year,0)- NVL(yearsum,0)+nvl(al.ale_unpay,0)-nvl(al.borrow_al_next_year,0)  AS UNUSED, " +
        "      case when al.Left_dt is null or substr(nvl(al.left_dt,'30000101'),1,6)>= SUBSTR('"+p_month+"',1,4)||'12' then  "+
        "    HR_F_CAL_ALE(SUBSTR('" + p_month + "',1,4)||'12',AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0)) " +
        "     else       HR_F_CAL_ALE_STOP(al.Left_dt,AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0)) " +
        "    end + nvl(al.ale_next_year,0)- NVL(yearsum,0)+nvl(al.ale_unpay,0)-nvl( al.borrow_al_next_year,0)AS unused_in_yeaar, " +
        "               0 as pay, " +
        "   case when al.Left_dt is null or substr(nvl(al.left_dt,'30000101'),1,6)>='"+p_month+"' then  "+
        "            HR_F_CAL_ALE('" + p_month + "',AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0)) " +
        "          else  HR_F_CAL_ALE_STOP(al.Left_dt,AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0)) " +
        "     end   + nvl(al.ale_next_year,0)- NVL(yearsum,0)+nvl(al.ale_unpay,0)-nvl(al.borrow_al_next_year,0) AS UNPAY,                " +
        "                0 as salary,0 as amt, " +
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
        "                       ,c.ale_for_next_year as ale_next_year " +
        "                       ,c.ale_pay as ale_pay,a.al_pay_yn as al_pay_yn,c.ale_unpay as ale_unpay " +
        "                       ,c.borrow_al_next_year as borrow_al_next_year ,decode(nvl(a.AL_PAY_YN,'N'),'Y','-1','0') as pay " +
        "                       ,a.LEFT_DT,d.org_nm as dept_nm " +
        "                  FROM thr_employee a, thr_work_group b,thr_annual_leave c,tco_org d " +
        "            WHERE a.del_if = 0 and (a.LEFT_DT is null or substr(nvl(a.LEFT_DT,'30001010'),1,4) >= substr('"+p_month+"',1,4) ) " +
        "                   AND b.del_if = 0 and d.del_if=0 and d.pk=a.tco_org_pk " +
        "                   AND c.del_if(+)=0  " +
        "                   and a.pk=c.thr_emp_pk(+) " +
        "                   and c.an_year(+)=TO_CHAR(ADD_MONTHS(TO_DATE('"+p_month+"','YYYYMM'),-12),'YYYY')  " +
        "                   AND a.thr_wg_pk = b.pk " +
        "                   AND (DECODE ('" + p_status + "', 'ALL', '" + p_status + "', case when a.LEFT_DT is null or substr(a.LEFT_DT,1,6)>='"+p_month+"' then 'A'else 'R' end ) ='" + p_status + "') " +
       "           AND (a.left_dt is not null and  to_date(a.left_dt,'yyyymmdd') between to_date('" + p_left_from + "','yyyymmdd') and to_date('" + p_left_to + "','yyyymmdd')  " +
       "             or '" + p_left_from + "' is null or '" + p_left_to + "' is null) " +
     
"                   AND (DECODE ('"+p_nation+"','ALL', '"+p_nation+"',a.nation) = '"+p_nation+"') " +
        "                   AND (DECODE ('"+p_thr_group_pk+"','ALL', '"+p_thr_group_pk+"',a.thr_wg_pk) = '"+p_thr_group_pk+"') " +
        "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
        "                   AND (a.tco_org_pk IN ( " +
        "                              SELECT     g.pk " +
        "                                    FROM TCO_ORG g " +
        "                                   WHERE g.del_if = 0 " +
        "                              START WITH g.pk =DECODE ('"+p_tco_org_pk+"','ALL', 0,'"+p_tco_org_pk+"') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+p_tco_org_pk+"' = 'ALL' " +
        "                       )) al, " +
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
        "                   WHERE a.yearmon <= '"+p_month+"' " +
        "                     AND SUBSTR (a.yearmon, 1, 4) = SUBSTR ('"+p_month+"', 1, 4) " +
        "              AND ('" + p_input + "' IS NULL  " +
        "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
        "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
        "                     AND (   a.tco_org_pk IN ( " +
        "                                SELECT     g.pk " +
        "                                      FROM TCO_ORG g " +
        "                                     WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" + p_tco_org_pk + "','ALL', 0,'" + p_tco_org_pk + "') " +
        "                                CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                          OR '" + p_tco_org_pk + "' = 'ALL' " +
        "                         ) " +
        "                GROUP BY a.emp_id, a.thr_emp_pk) alsum " +
        "         WHERE al.emp_pk = alsum.emp_pk(+) " +
        "           AND (   ( case when al.Left_dt is null or substr(nvl(al.left_dt,'30000101'),1,6)>='"+p_month+"' then  " +
        "           HR_F_CAL_ALE('" + p_month + "',AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0)) " +
        "            else   HR_F_CAL_ALE_STOP(al.Left_dt,AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0)) " +
        "          end   -NVL (yearsum,0)+nvl(al.ale_next_year,0)-nvl( al.borrow_al_next_year,0)>= '"+p_ale+"' "+
        "           AND '"+p_lday+"' = '1'   ) " +
        "                OR ( case when al.Left_dt is null or substr(nvl(al.left_dt,'30000101'),1,6)>='"+p_month+"' then  "+
        "            HR_F_CAL_ALE('" + p_month + "',AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0)) " +
        "            else   HR_F_CAL_ALE_STOP(al.Left_dt,AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0)) " +
        "             end    - NVL (yearsum, 0)+nvl(al.ale_next_year,0)-nvl( al.borrow_al_next_year,0) = '"+p_ale+"' "+
        "            AND '"+p_lday+"' = '2' ) " +
        "                OR ( case when al.Left_dt is null or substr(nvl(al.left_dt,'30000101'),1,6)>='"+p_month+"' then  "+
        "            HR_F_CAL_ALE('" + p_month + "',AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0)) " +
        "            else     HR_F_CAL_ALE_STOP(al.Left_dt,AL.JOIN_DATE,NVL(AL.ANNUAL_LEAVE_DAYS_IN_YEAR,0),NVL(AL.ALE_PLUS,0)) " +
        "                end   - NVL (yearsum, 0)+nvl(al.ale_next_year,0)-nvl( al.borrow_al_next_year,0) <= '"+p_ale+"' "+
        "           AND '"+p_lday+"' = '3' "+
        "          ) " +
        "                OR '"+p_ale+"' IS NULL " +
        "               ) " +
      "           AND al.join_date <=TO_CHAR (LAST_DAY (TO_DATE ('"+p_month+"', 'YYYYMM')), 'YYYYMMDD') " +
      "           AND (to_date(al.join_date,'yyyymmdd') between to_date('" + p_from + "','yyyymmdd') and to_date('" + p_to + "','yyyymmdd')  " +
      "             or '" + p_from + "' is null or '" + p_to + "' is null) "+
      
            "      ORDER BY al.dept_nm, al.group_nm, al.emp_id " ;

	

    else if (p_sql==2)
        SQL
       = " SELECT  A.org_nm,A.GROUP_NM,A.EMP_ID,A.FULL_NAME " +
           "        ,TO_CHAR(TO_DATE(A.JOIN_DT,'YYYYMMDD'),'DD/MM/YYYY') " +
           "        ,nvl(A.ALE_LAST_YEAR,0) " +
           "        ,nvl(B.ALE_FOR_NEXT_YEAR,0) " +
           "        ,nvl(B.BORROW_AL_NEXT_YEAR,0) " +
           "        ,nvl(A.ALE_IN_YEAR,0) " +
           "        ,nvl(A.ALE_PLUS,0) " +
           "        ,nvl(A.ALE_REAL,0) " +
           "        ,nvl(A.ALE_FOR_NEXT_YEAR,0) " +
           "        ,nvl(A.BORROW_AL_NEXT_YEAR,0) " +
           "        ,nvl(A.USED,0) " +
           "        ,nvl(A.UNUSED,0)  " +
           "        ,nvl(A.UNUSED,0)        " +
           "        ,case when nvl(A.EMPLOYEE_PAY,0) >0 then -1* nvl(A.EMPLOYEE_PAY,0) else nvl(A.ALE_PAY,0) end " +
           "        ,nvl(A.ALE_UNPAY,0) " +
           "        ,round(nvl(a.salary,0),10),round(nvl(a.ALE_PAY_AMT,0),10) " +
           "        ,nvl(DECODE(A.JAN,0,NULL,A.JAN),0),nvl(DECODE(A.FEB,0,NULL,A.FEB),0) " +
           "        ,nvl(DECODE(A.MAR,0,NULL,A.MAR),0),nvl(DECODE(A.APR,0,NULL,A.APR),0) " +
           "        ,nvl(DECODE(A.MAY,0,NULL,A.MAY),0),nvl(DECODE(A.JUN,0,NULL,A.JUN),0) " +
           "        ,nvl(DECODE(A.JUL,0,NULL,A.JUL),0),nvl(DECODE(A.AUG,0,NULL,A.AUG),0) " +
           "        ,nvl(DECODE(A.SEP,0,NULL,A.SEP),0),nvl(DECODE(A.OCT,0,NULL,A.OCT),0) " +
           "        ,nvl(DECODE(A.NOV,0,NULL,A.NOV),0),nvl(DECODE(A.DEC,0,NULL,A.DEC),0) " +
            "      ,to_char(sysdate,'dd/mm/YYYY') "+
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
            "  AND (( a.ale_unpay >='"+p_ale+"' AND '"+p_lday+"'='1') " +
           "    OR (a.ale_unpay='"+p_ale+"' AND '"+p_lday+"'='2') " +
           "    OR (a.ale_unpay<='"+p_ale+"' AND '"+p_lday+"'='3') " +
           "    OR '"+p_ale+"' IS NULL) " +
           "    AND (DECODE ('"+p_status+"', 'ALL', '"+p_status+"', a.status) ='"+p_status+"') " +
           "    AND (DECODE ('"+p_nation+"', 'ALL', '"+p_nation+"', c.nation) ='"+p_nation+"') " +
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
           "        ,nvl(B.ALE_FOR_NEXT_YEAR,0) " +
           "        ,nvl(B.BORROW_AL_NEXT_YEAR,0) " +
           "        ,nvl(A.ALE_IN_YEAR,0) " +
           "        ,nvl(A.ALE_PLUS,0) " +
           "        ,nvl(A.ALE_REAL,0) " +
           "        ,nvl(A.ALE_FOR_NEXT_YEAR,0) " +
           "        ,nvl(A.BORROW_AL_NEXT_YEAR,0) " +
           "        ,nvl(A.USED,0) " +
           "        ,nvl(A.UNUSED,0)  " +
           "        ,nvl(A.UNUSED,0)        " +
           "        ,case when nvl(A.EMPLOYEE_PAY,0) >0 then -1* nvl(A.EMPLOYEE_PAY,0) else nvl(A.ALE_PAY,0) end " +
           "        ,nvl(A.ALE_UNPAY,0) " +
           "        ,round(nvl(a.salary,0),10),round(nvl(a.ALE_PAY_AMT,0),10) " +
           "        ,nvl(DECODE(A.JAN,0,NULL,A.JAN),0),nvl(DECODE(A.FEB,0,NULL,A.FEB),0) " +
           "        ,nvl(DECODE(A.MAR,0,NULL,A.MAR),0),nvl(DECODE(A.APR,0,NULL,A.APR),0) " +
           "        ,nvl(DECODE(A.MAY,0,NULL,A.MAY),0),nvl(DECODE(A.JUN,0,NULL,A.JUN),0) " +
           "        ,nvl(DECODE(A.JUL,0,NULL,A.JUL),0),nvl(DECODE(A.AUG,0,NULL,A.AUG),0) " +
           "        ,nvl(DECODE(A.SEP,0,NULL,A.SEP),0),nvl(DECODE(A.OCT,0,NULL,A.OCT),0) " +
           "        ,nvl(DECODE(A.NOV,0,NULL,A.NOV),0),nvl(DECODE(A.DEC,0,NULL,A.DEC),0) " +
            "      ,to_char(sysdate,'dd/mm/YYYY') "+
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
           " and ( '"+p_status+"'='ALL'   " +
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
          
      //      Response.Write(SQL);
       // Response.End();
    DataTable dt_total = CtlLib.TableReadOpen(SQL);
     DataTable dt_option = CtlLib.TableReadOpen(SQL2);
     if(dt_option.Rows.Count>0)
      option=1;
//Response.End();          
    int irow;
        irow = dt_total.Rows.Count;
        if (irow == 0)
        {Response.Write("There is no data");
        Response.End();
        }
  

    
  %>

<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="aa_files/filelist.xml">
<link rel=Edit-Time-Data href="aa_files/editdata.mso">
<link rel=OLE-Object-Data href="aa_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>ty-ml</o:Author>
  <o:LastAuthor>Genu Test</o:LastAuthor>
  <o:LastPrinted>2008-05-26T09:36:58Z</o:LastPrinted>
  <o:Created>2008-05-26T09:13:46Z</o:Created>
  <o:LastSaved>2009-10-29T10:41:55Z</o:LastSaved>
  <o:Company>genuwin</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{mso-footer-data:"Page &P of &N";
	margin:.1in .1in .1in .1in;
	mso-header-margin:.16in;
	mso-footer-margin:.41in;
	mso-page-orientation:landscape;}
tr
	{mso-height-source:auto;}
col
	{mso-width-source:auto;}
br
	{mso-data-placement:same-cell;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:Normal;
	mso-style-id:0;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl24
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";}
.xl26
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[$-1010000\]d\/m\/yyyy\;\@";}
.xl27
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl28
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl29
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl33
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\[$-1010000\]d\/m\/yyyy\;\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl37
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl39
	{mso-style-parent:style0;
	font-size:9.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl40
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:normal;}
.xl41
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl42
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl43
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl44
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl45
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022?_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
.xl46
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	white-space:normal;}
.xl47
	{mso-style-parent:style0;
	font-size:18.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:normal;}
.xl48
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;}
.xl49
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"Short Date";
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl50
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl51
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline black;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl52
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl53
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"\@";
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline black;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl54
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl55
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid black;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:normal;}
	.xl56
	{mso-style-parent:style0;
	font-size:8.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	white-space:normal;}
	.xl58
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;
	background:#CCFFCC;
	mso-pattern:auto none;}

-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
    <x:FitToPage/>
     <x:FitToPage/>
     <x:Print>
      <x:FitHeight>0</x:FitHeight>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:Scale>45</x:Scale>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>1</x:SplitHorizontal>
     <x:TopRowBottomPane>1</x:TopRowBottomPane>
     <x:SplitVertical>4</x:SplitVertical>
     <x:LeftColumnRightPane>10</x:LeftColumnRightPane>
     <x:ActivePane>0</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>1</x:Number>
       <x:ActiveCol>4</x:ActiveCol>
      </x:Pane>
      <x:Pane>
       <x:Number>2</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>0</x:Number>
       <x:ActiveRow>5</x:ActiveRow>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
   <x:ExcelWorksheet>
    <x:Name>Sheet2</x:Name>
    <x:WorksheetOptions>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
   <x:ExcelWorksheet>
    <x:Name>Sheet3</x:Name>
    <x:WorksheetOptions>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>8955</x:WindowHeight>
  <x:WindowWidth>15360</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>255</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$1:$6</x:Formula>
 </x:ExcelName>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=2629 style='border-collapse:
 collapse;table-layout:fixed;width:1970pt'>
 <col class=xl24 width=36 style='mso-width-source:userset;mso-width-alt:1316;
 width:27pt'>
 <col class=xl24 width=246 style='mso-width-source:userset;mso-width-alt:8996;
 width:185pt'>
 <col class=xl24 width=200 style='mso-width-source:userset;mso-width-alt:7000;
 width:109pt'>
 <col class=xl24 width=75 style='mso-width-source:userset;mso-width-alt:2742;
 width:56pt'>
 <col class=xl25 width=189 style='mso-width-source:userset;mso-width-alt:6912;
 width:142pt'>
 <col class=xl26 width=79 style='mso-width-source:userset;mso-width-alt:2889;
 width:59pt'>
 <col class=xl24 width=76 style='mso-width-source:userset;mso-width-alt:2779;
 width:57pt'>
 <col class=xl24 width=105 style='mso-width-source:userset;mso-width-alt:3840;
 width:79pt'>
 <col class=xl24 width=104 span=2 style='mso-width-source:userset;mso-width-alt:
 3803;width:78pt;<%=(option==0)?"display:none":"" %>'>
 <col class=xl24 width=104 span=2 style='mso-width-source:userset;mso-width-alt:
 3803;width:78pt'>
 <col class=xl24 width=104  style='mso-width-source:userset;mso-width-alt:
 3803;width:78pt;<%=(p_sql==1)?"display:none":""%>'>
 
 <col class=xl24 width=89 style='mso-width-source:userset;mso-width-alt:3254;
 width:67pt;<%=(p_sql==1||option==0)?"display:none":""%>'>
 <col class=xl24 width=105 style='mso-width-source:userset;mso-width-alt:3840;
 width:79pt'>
 <col class=xl24 width=104 span=2 style='mso-width-source:userset;mso-width-alt:
 3803;width:78pt'>
  <col class=xl24 width=104 span=2 style='mso-width-source:userset;mso-width-alt:
 3803;width:78pt;<%=(p_sql==1)?"display:none":""%>'>
 <col class=xl24 width=107 style='mso-width-source:userset;mso-width-alt:3913;
 width:80pt;<%=(p_sql==1||p_sql==2)?"display:none":""%>'>
  <col class=xl24 width=107 style='mso-width-source:userset;mso-width-alt:3913;
 width:80pt;<%=(p_sql==1||p_sql==2)?"display:none":""%>'>
 <col class=xl24 width=43 span=11 style='mso-width-source:userset;mso-width-alt:
 1572;width:32pt'>
 <col class=xl24 width=48 style='mso-width-source:userset;mso-width-alt:1755;
 width:36pt'>
 <col class=xl24 width=64 span=2 style='width:48pt'>
 <tr height=28 style='mso-height-source:userset;height:21.0pt'>
  <td colspan=30 height=28 class=xl47 width=2501 style='height:21.0pt;
  width:1874pt'>ANNUAL LEAVE REPORT IN <%=(p_sql == 1 || p_sql == 2) ? p_month.Substring(4,2)+"/"+p_month.Substring(0,4): p_month%></td>
  <td class=xl24 width=64 style='width:48pt'></td>
  <td class=xl24 width=64 style='width:48pt'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=25 class=xl24 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl27 colspan=2 style='mso-ignore:colspan'>Reporter</td>
  <td class=xl24></td>
  <td colspan=2 class=xl48><%=p_user %></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 colspan=25 class=xl24 style='height:15.75pt;mso-ignore:colspan'></td>
  <td class=xl27 colspan=3 style='mso-ignore:colspan'>Report Date</td>
  <td colspan=2 class=xl49><%=dt_total.Rows[0][30].ToString() %></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=45 style='mso-height-source:userset;height:33.75pt'>
  <td rowspan=2 height=90 class=xl50 width=36 style='border-bottom:.5pt hairline black;
  height:67.5pt;width:27pt'>No</td>
  <td rowspan=2 class=xl50 width=246 style='border-bottom:.5pt hairline black;
  width:185pt'>Organization</td>
  <td rowspan=2 class=xl50 width=145 style='border-bottom:.5pt hairline black;
  width:109pt'>Work Group</td>
  <td rowspan=2 class=xl50 width=75 style='border-bottom:.5pt hairline black;
  width:56pt'>Emp ID</td>
  <td rowspan=2 class=xl52 width=189 style='border-bottom:.5pt hairline black;
  width:142pt'>Full Name</td>
  <td rowspan=2 class=xl50 width=79 style='border-bottom:.5pt hairline black;
  width:59pt'>Join_Date</td>
  <td colspan=3 class=xl54 width=285 style='border-right:.5pt solid black;
  border-left:none;width:214pt'>Last Year</td>
  <td class=xl29 width=104 style='width:78pt'>&nbsp;</td>
  <td colspan=23 class=xl29 width=1342 style='border-right:.5pt solid black;
  width:1004pt'>In Year</td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=45 style='mso-height-source:userset;height:33.75pt'>
  <td height=45 class=xl30 width=76 style='height:33.75pt;width:57pt'>ALE Last
  Year</td>
  <td class=xl30 width=105 style='width:79pt'>Lend ALE ABS</td>
  <td class=xl30 width=104 style='width:78pt'>Lend ALE</td>
  <td class=xl30 width=104 style='width:78pt'>ALE In Year</td>
  <td class=xl30 width=104 style='width:78pt'>ALE Plus</td>
  <td class=xl30 width=104 style='width:78pt'>ALE Real</td>
  <td class=xl30 width=104 style='width:78pt'>Lend ALE ABS</td>
  <td class=xl30 width=89 style='width:67pt'>Lend ALE</td>
  <td class=xl30 width=105 style='width:79pt'>ALE Used</td>
  <td class=xl30 width=104 style='width:78pt'>Unused</td>
  <td class=xl31 width=104 style='width:78pt'>Unused ALE In Year</td>
  <td class=xl31 width=104 style='width:78pt'>Pay</td>
  <td class=xl31 width=104 style='width:78pt'>Unpay</td>
  <td class=xl31 width=107 style='width:80pt'>Salary</td>
  <td class=xl31 width=107 style='width:80pt'>Amount</td>
  <td class=xl30 width=43 style='width:32pt'>JAN</td>
  <td class=xl30 width=43 style='width:32pt'>FEB</td>
  <td class=xl30 width=43 style='width:32pt'>MAR</td>
  <td class=xl30 width=43 style='width:32pt'>APR</td>
  <td class=xl30 width=43 style='width:32pt'>MAY</td>
  <td class=xl30 width=43 style='width:32pt'>JUN</td>
  <td class=xl30 width=43 style='width:32pt'>JUL</td>
  <td class=xl30 width=43 style='width:32pt'>AUG</td>
  <td class=xl30 width=43 style='width:32pt'>SEP</td>
  <td class=xl30 width=43 style='width:32pt'>OCT</td>
  <td class=xl30 width=43 style='width:32pt'>NOV</td>
  <td class=xl30 width=48 style='width:36pt'>DEC</td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl28 height=48 style='height:36.0pt'>
  <td height=48 class=xl32 width=36 style='height:36.0pt;width:27pt'>STT</td>
  <td class=xl33 width=246 style='width:185pt'>Bộ phận</td>
  <td class=xl33 width=145 style='width:109pt'>Nhóm</td>
  <td class=xl33 width=75 style='width:56pt'>Mã NV</td>
  <td class=xl34 width=189 style='width:142pt'>Họ và tên NV</td>
  <td class=xl35 width=79 style='width:59pt'>Ngày vào</td>
  <td class=xl33 width=76 style='width:57pt'>Phép năm năm trước</td>
  <td class=xl36 width=105 style='width:79pt'>Số ngày nghỉ năm nay đã thanh
  toán ở năm trước</td>
  <td class=xl37 width=104 style='width:78pt'>Số ngày phép năm nay đã thanh
  toán ở năm trước</td>
  <td class=xl36 width=104 style='width:78pt'>Phép năm trong<span
  style='mso-spacerun:yes'>  </span>năm</td>
  <td class=xl36 width=104 style='width:78pt'>Phép năm <span
  style='mso-spacerun:yes'>  </span>cộng thêm</td>
  <td class=xl36 width=104 style='width:78pt'>Phép năm thực<span
  style='mso-spacerun:yes'>  </span>có</td>
  <td class=xl37 width=104 style='width:78pt'>Số ngày nghỉ năm tới đã thanh
  toán ở năm nay</td>
  <td class=xl38 width=89 style='width:67pt'>Số ngày phép năm tới thanh toán ở
  năm nay</td>
  <td class=xl36 width=105 style='width:79pt'>Phép năm đã dùng</td>
  <td class=xl37 width=104 style='width:78pt'>Phép năm chưa dùng</td>
  <td class=xl39 width=104 style='width:78pt'>Phép năm chưa dùng trong năm</td>
  <td class=xl39 width=104 style='width:78pt'><span
  style='mso-spacerun:yes'> </span>Phép năm được thanh toán</td>
  <td class=xl39 width=104 style='width:78pt'>Số ngày chưa thanh toán</td>
  <td class=xl39 width=107 style='width:80pt'>Lương </td>
  <td class=xl39 width=107 style='width:80pt'>Số tiền phải trả</td>
  <td class=xl33 width=43 style='width:32pt' x:num>1</td>
  <td class=xl33 width=43 style='width:32pt' x:num>2</td>
  <td class=xl33 width=43 style='width:32pt' x:num>3</td>
  <td class=xl33 width=43 style='width:32pt' x:num>4</td>
  <td class=xl33 width=43 style='width:32pt' x:num>5</td>
  <td class=xl33 width=43 style='width:32pt' x:num>6</td>
  <td class=xl33 width=43 style='width:32pt' x:num>7</td>
  <td class=xl33 width=43 style='width:32pt' x:num>8</td>
  <td class=xl33 width=43 style='width:32pt' x:num>9</td>
  <td class=xl33 width=43 style='width:32pt' x:num>10</td>
  <td class=xl33 width=43 style='width:32pt' x:num>11</td>
  <td class=xl33 width=48 style='width:36pt' x:num>12</td>
  <td colspan=2 class=xl28 style='mso-ignore:colspan'></td>
 </tr>
 <%  double[] total=new double[60]; 
  for(int j=5;j<30;j++) 
        {total[j]=0; 
        }
   
 %>
 <% for (int i = 0; i < dt_total.Rows.Count; i++)
    {%>
 <tr class=xl28 height=30 style='mso-height-source:userset;height:22.5pt'>
  <td height=30 class=xl40 width=36 style='height:22.5pt;width:27pt' x:num><%=i + 1%></td>
  <td class=xl41 width=246 style='width:185pt' x:num><%=dt_total.Rows[i][0].ToString()%></td>
  <td class=xl56 width=145 style='width:109pt' x:num><%=dt_total.Rows[i][1].ToString()%></td>
  <td class=xl42 width=75 style='width:56pt' x:str><%=dt_total.Rows[i][2].ToString()%></td>
  <td class=xl43><%=dt_total.Rows[i][3].ToString()%></td>
  <td class=xl44 width=79 style='width:59pt'><%=dt_total.Rows[i][4].ToString()%></td>
  <td class=xl45 width=76 style='width:57pt' x:num><%=dt_total.Rows[i][5].ToString()%></td>
  <td class=xl45 width=105 style='width:79pt' x:num><%=dt_total.Rows[i][6].ToString()%> </td>
  <td class=xl45 width=104 style='width:78pt' x:num><%=dt_total.Rows[i][7].ToString()%> </td>
  <td class=xl45 width=104 style='width:78pt'x:num><%=dt_total.Rows[i][8].ToString()%></td>
  <td class=xl45 width=104 style='width:78pt'x:num><%=dt_total.Rows[i][9].ToString()%></td>
  <td class=xl45 width=104 style='width:78pt'x:num><%=dt_total.Rows[i][10].ToString()%></td>
  <td class=xl45 width=89 style='width:67pt' x:num><%=dt_total.Rows[i][11].ToString()%></td>
  <td class=xl45 width=105 style='width:79pt' x:num><%=dt_total.Rows[i][12].ToString()%></td>
  <td class=xl45 width=104 style='width:78pt' x:num><%=dt_total.Rows[i][13].ToString()%></td>
  <td class=xl45 width=104 style='width:78pt' x:num><%=dt_total.Rows[i][14].ToString()%></td>
  <td class=xl45 width=104 style='width:78pt' x:num><%=dt_total.Rows[i][15].ToString()%></td>
  <td class=xl45 width=104 style='width:78pt' x:num><%=dt_total.Rows[i][16].ToString()%></td>
  <td class=xl45 width=107 style='width:80pt' x:num><%=dt_total.Rows[i][17].ToString()%></td>
  <td class=xl45 width=107 style='width:80pt' x:num><%=dt_total.Rows[i][18].ToString()%></td>
  <td class=xl45 width=43 style='width:32pt' x:num><%=dt_total.Rows[i][19].ToString()%></td>
  <td class=xl45 width=43 style='width:32pt' x:num><%=dt_total.Rows[i][20].ToString()%></td>
  <td class=xl45 width=43 style='width:32pt' x:num><%=dt_total.Rows[i][21].ToString()%></td>
  <td class=xl45 width=43 style='width:32pt' x:num><%=dt_total.Rows[i][22].ToString()%></td>
  <td class=xl45 width=43 style='width:32pt' x:num><%=dt_total.Rows[i][23].ToString()%></td>
  <td class=xl45 width=43 style='width:32pt' x:num><%=dt_total.Rows[i][24].ToString()%></td>
  <td class=xl45 width=43 style='width:32pt' x:num><%=dt_total.Rows[i][25].ToString()%> </td>
  <td class=xl45 width=43 style='width:32pt' x:num><%=dt_total.Rows[i][26].ToString()%></td>
  <td class=xl45 width=43 style='width:32pt' x:num><%=dt_total.Rows[i][27].ToString()%></td>
  <td class=xl45 width=43 style='width:32pt' x:num><%=dt_total.Rows[i][28].ToString()%></td>
  <td class=xl45 width=43 style='width:32pt' x:num><%=dt_total.Rows[i][29].ToString()%></td>
  <td class=xl45 width=43 style='width:32pt' x:num><%=dt_total.Rows[i][30].ToString()%></td>
  <td class=xl45 width=43 style='width:32pt' x:num><%=dt_total.Rows[i][31].ToString()%></td>
   <td colspan=2 class=xl46 style='mso-ignore:colspan'></td>
  
   <% for(int j=5;j<30;j++) 
        {total[j]=total[j] + ((dt_total.Rows[i][j].ToString()!="")?Double.Parse(dt_total.Rows[i][j].ToString()):0); 
        }
        
   %>
 </tr>
 <%} %>
 <tr height=21 style='height:15.75pt'>
  <td  align=center colspan=6 height=21 class=xl58 style='height:15.75pt'>Total</td>
  <td class=xl58 style='border-top:none'x:num><%=total[5] %></td>
  <td class=xl58 style='border-top:none;border-left:none'x:num><%=total[6] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[7] %></td>
  <td class=xl58 style='border-top:none;border-left:none'x:num><%=total[8] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[9] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[10] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[11] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[12] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[13] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[14] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[15] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[16] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[17] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[18] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[19] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[20] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[21] %></td>
  <td class=xl58 style='border-top:none;border-left:none'x:num><%=total[22] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[23] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[24] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[25] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[26] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[27] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[28] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[29] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[30] %></td>
  <td class=xl58 style='border-top:none;border-left:none' x:num><%=total[31] %></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'></td>
 </tr>

 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=36 style='width:27pt'></td>
  <td width=246 style='width:185pt'></td>
  <td width=145 style='width:109pt'></td>
  <td width=75 style='width:56pt'></td>
  <td width=189 style='width:142pt'></td>
  <td width=79 style='width:59pt'></td>
  <td width=76 style='width:57pt'></td>
  <td width=105 style='width:79pt'></td>
  <td width=104 style='width:78pt'></td>
  <td width=104 style='width:78pt'></td>
  <td width=104 style='width:78pt'></td>
  <td width=89 style='width:67pt'></td>
  <td width=105 style='width:79pt'></td>
  <td width=104 style='width:78pt'></td>
  <td width=104 style='width:78pt'></td>
  <td width=104 style='width:78pt'></td>
  <td width=104 style='width:78pt'></td>
  <td width=107 style='width:80pt'></td>
  <td width=43 style='width:32pt'></td>
  <td width=43 style='width:32pt'></td>
  <td width=43 style='width:32pt'></td>
  <td width=43 style='width:32pt'></td>
  <td width=43 style='width:32pt'></td>
  <td width=43 style='width:32pt'></td>
  <td width=43 style='width:32pt'></td>
  <td width=43 style='width:32pt'></td>
  <td width=43 style='width:32pt'></td>
  <td width=43 style='width:32pt'></td>
  <td width=43 style='width:32pt'></td>
  <td width=48 style='width:36pt'></td>
  <td width=64 style='width:48pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
