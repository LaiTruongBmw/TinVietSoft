<%@ Page Language="C#"%>
<%@ Import Namespace = "System.Data" %>
<%  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	Response.ContentType = "application/vnd.ms-excel";
    Response.Charset = "utf-8"; 
	Response.Buffer = false;
%>
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%
    string p_tco_org=Request.QueryString[0].ToString();
    string p_tco_org_nm=Request.QueryString[1].ToString() ;
    string p_from=Request.QueryString[2].ToString() ;
    string p_to=Request.QueryString[3].ToString();
    string p_typeDT=Request.QueryString[4].ToString();
    string p_user=Request.QueryString[5].ToString();
    string p_emp_type=Request.QueryString[6].ToString(); 
    
    string p_lbl_Int="";        
    
    if (p_emp_type=="") p_emp_type="0";  
    
    switch (p_emp_type)
    {
        case "0":
            p_lbl_Int ="current";
            break;
        case "1":
            p_lbl_Int ="new employee";
            break;
        case "2":
            p_lbl_Int ="resign employee";
            break;
        case "3":
            p_lbl_Int ="maternity";
            break;
    } 

    string sql_gen_info,sql_sum_info,sql_sum_dept,sql_sum_pos,sql_sum_sen;
    sql_sum_info = "";
    sql_sum_dept="";
    sql_sum_pos="";
    sql_sum_sen="";
    string sql_date=" select to_char(to_date('" + p_from + "','yyyymmdd'),'dd-Mon-yyyy') fr_kind1,to_char(to_date('" + p_from + "','yyyymmdd'),'Month') fr_kind2,to_char(to_date('" + p_to + "','yyyymmdd'),'dd-Mon-yyyy'), substr('" + p_from + "',1,4),to_char(sysdate,'dd-Mon-yyyy') from dual" ;
        
    DataTable dt_date = CtlLib.TableReadOpen(sql_date);
    
   
    sql_gen_info= "SELECT MAX(HR.TOTAL),MAX(HR.new_staff),MAX(HR.resign),MAX(HR.maternity) " + 
        "        FROM " +
        "        ( " +
        "        SELECT count(*) as TOTAL,0 as new_staff,0 as resign, 0 as maternity " +
        "        FROM THR_EMPLOYEE A " +
        "        WHERE A.DEL_IF=0 AND A.JOIN_DT <= '" + p_to + "' " +
        "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
        "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
        "        union all " +
        "        SELECT 0 as TOTAL,count(*) as new_staff,0 as resign, 0 as maternity " +
        "        FROM THR_EMPLOYEE A " +
        "        WHERE A.DEL_IF=0 AND A.JOIN_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
        "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
        "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
        "        union all " +
        "        SELECT 0 as TOTAL,0 as new_staff,COUNT(*) as resign, 0 as maternity " +
        "        FROM THR_EMPLOYEE A " +
        "        WHERE A.DEL_IF=0 AND A.JOIN_DT<='" + p_to + "' " +
        "        AND A.LEFT_DT IS NOT NULL " +
        "        AND A.LEFT_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
        "        AND A.STATUS='R' " +
        "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
        "        union all " +
        "        SELECT 0 as TOTAL,0 as new_staff,0 as resign, COUNT(*) as maternity " +
        "        FROM THR_EMPLOYEE A,THR_ABSENCE_REG B " +
        "        WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND A.PK=B.THR_EMP_PK " +
        "        AND A.JOIN_DT<='" + p_to + "' " +
        "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
        "        AND B.ABSENCE_TYPE='04' " +
        "       AND B.END_DT >='" + p_from + "' AND B.START_DT <='" + p_to + "' " +
        "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL')     )HR " ;
        
        
        //Response.Write(sql_gen_info);
        //Response.End();
        
        DataTable dt_gen_info = CtlLib.TableReadOpen(sql_gen_info);
        
        if (dt_gen_info.Rows.Count == 0)
        {
            Response.Write("There is no data to show");
            Response.End();
        }          
       
        
        if(p_emp_type=="0")
        {                     
                 sql_sum_info= "SELECT MAX(HR.probation),MAX(HR.offical),MAX(HR.discipline),MAX(HR.under_18),MAX(HR.male),MAX(HR.female) " + 
                "FROM " +
                "( " +
                "        SELECT count(*) as probation,0 as offical,0 as discipline, 0 as under_18, 0 as male, 0 as female " +
                "        FROM THR_EMPLOYEE A " +
                "        WHERE A.DEL_IF=0 AND A.END_PROBATION > '" + p_from + "' " +
                "        AND A.JOIN_DT<='" + p_to + "' " +
                "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                "        union all " +
                "        SELECT 0 as probation,count(distinct a.pk) as offical,0 as discipline, 0 as under_18, 0 as male, 0 as female " +
                "        FROM THR_EMPLOYEE A,THR_LABOUR_CONTRACT M " +
                "        WHERE A.DEL_IF=0 AND M.DEL_IF=0 AND A.PK=M.THR_EMPLOYEE_PK " +
                     //"        AND M.CONTRACT_TIMES=2 " +
                "        AND A.END_PROBATION <= '" + p_from + "' " +
                "        AND A.JOIN_DT<='" + p_to + "' " +
                "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                "        union all " +
                "        SELECT 0 as probation,0 as offical,count(*) as discipline, 0 as under_18, 0 as male, 0 as female " +
                "        FROM THR_EMPLOYEE A,THR_DISCIPLINE B " +
                "        WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND A.PK=B.THR_EMP_PK " +
                "        AND A.JOIN_DT<='" + p_to + "' " +
                "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
                "        AND B.DIS_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                "        GROUP BY A.PK " +
                "        union all " +
                "        SELECT 0 as probation,0 as offical,0 as discipline, count(*) as under_18, 0 as male, 0 as female " +
                "        FROM THR_EMPLOYEE A " +
                "        WHERE A.DEL_IF=0 AND A.JOIN_DT<='" + p_to + "' " +
                "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
                "        AND ADD_MONTHS(DECODE(LENGTH(A.BIRTH_DT),4,TO_DATE(A.BIRTH_DT||'0101','YYYYMMDD'),TO_DATE(A.BIRTH_DT,'YYYYMMDD')),216)>SYSDATE " +
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                "        union all " +
                "        SELECT 0 as probation,0 as offical,0 as discipline, 0 as under_18, SUM(DECODE(NVL(A.SEX,'0'),'M',1,0)) as male, SUM(DECODE(NVL(A.SEX,'0'),'F',1,0)) as female " +
                "        FROM THR_EMPLOYEE A " +
                "        WHERE A.DEL_IF=0 " +
                "        AND A.JOIN_DT<='" + p_to + "' " +
                "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                "    )HR " ;
                
                //Response.Write(sql_sum_info);
                //Response.End(); 

                 sql_sum_dept = "SELECT B.PK,F_GET_ORG_3LEVEL(b.pk), SUM(DECODE(NVL(A.SEX,'0'),'M',1,0)) as male, SUM(DECODE(NVL(A.SEX,'0'),'F',1,0)) as female,COUNT(A.PK) AS TOTAL " + 
                "        FROM THR_EMPLOYEE A,tco_org B " +
                "        WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND A.tco_org_pk=B.PK  and nvl(b.p_pk,0)<>0 " +
                "        AND A.JOIN_DT<='" + p_to + "' " +
                "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +                
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                "        GROUP BY B.PK,B.SEQ,F_GET_ORG_3LEVEL(b.pk) " +
                "        ORDER BY NVL(B.SEQ,999999999),F_GET_ORG_3LEVEL(b.pk) "; 
        
        //Response.Write(sql_sum_dept);
        //Response.End(); 
          
         sql_sum_pos = "SELECT NVL(B.CODE,'00'),NVL(B.CODE_NM,'NONE POSITION'), SUM(DECODE(NVL(A.SEX,'0'),'M',1,0)) as male, SUM(DECODE(NVL(A.SEX,'0'),'F',1,0)) as female,COUNT(A.PK) AS TOTAL " + 
        "        FROM THR_EMPLOYEE A,VHR_HR_CODE B " +
        "        WHERE A.DEL_IF=0 AND B.ID(+)='HR0008' AND A.POS_TYPE=B.CODE(+) " +
        "        AND A.JOIN_DT<='" + p_to + "' " +
        "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'p_to') " +
        "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
        "        GROUP BY B.CODE,B.CODE_NM " +
        "        ORDER BY B.CODE " ;
        
        //Response.Write(sql_sum_pos);
        //Response.End();      
        
        sql_sum_sen = "SELECT  SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12<1 THEN 1 " + 
        "             ELSE 0 END)) AS T1 " +
        "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12>=1 " +
        "                        AND MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12<2 THEN 1 " +
        "             ELSE 0 END)) AS T2 " +
        "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12>=2 " +
        "                        AND MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12<3 THEN 1 " +
        "             ELSE 0 END)) AS T3 " +
        "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12>=3 " +
        "                        AND MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12<4 THEN 1 " +
        "             ELSE 0 END)) AS T3 " +
        "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12>=4 " +
        "                        AND MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12<5 THEN 1 " +
        "             ELSE 0 END)) AS T3 " +
        "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12>=5 THEN 1 " +
        "             ELSE 0 END)) AS T3 " +
        "        FROM THR_EMPLOYEE A " +
        "        WHERE A.DEL_IF=0 " +
        "        AND A.JOIN_DT<='" + p_to + "' " +
        "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
       "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " ;
        
        //Response.Write(sql_sum_sen);
        //Response.End(); 
            
        }    
        
        if(p_emp_type=="1")
        {                     
                 
        sql_sum_info= "SELECT MAX(HR.probation),MAX(HR.offical),MAX(HR.discipline),MAX(HR.under_18),MAX(HR.male),MAX(HR.female) " + 
            "FROM " +
            "( " +
            "        SELECT count(*) as probation,0 as offical,0 as discipline, 0 as under_18, 0 as male, 0 as female " +
            "        FROM THR_EMPLOYEE A " +
            "        WHERE A.DEL_IF=0 AND A.END_PROBATION > '" + p_from + "' " +
            "        AND A.JOIN_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
            "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "')  " +
           "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
            "        union all " +
            "        SELECT 0 as probation,count(distinct a.pk) as offical,0 as discipline, 0 as under_18, 0 as male, 0 as female " +
            "        FROM THR_EMPLOYEE A,THR_LABOUR_CONTRACT M " +
            "        WHERE A.DEL_IF=0 AND M.DEL_IF=0 AND A.PK=M.THR_EMPLOYEE_PK " +
            "        AND A.JOIN_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
            //"        AND M.CONTRACT_TIMES=2 " +
                "        AND A.END_PROBATION <= '" + p_from + "' " +
            "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
            "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
            "        union all " +
            "        SELECT 0 as probation,0 as offical,count(*) as discipline, 0 as under_18, 0 as male, 0 as female " +
            "        FROM THR_EMPLOYEE A,THR_DISCIPLINE B " +
            "        WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND A.PK=B.THR_EMP_PK " +
            "        AND A.JOIN_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
            "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
            "        AND B.DIS_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
            "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
            "        GROUP BY A.PK " +
            "        union all " +
            "        SELECT 0 as probation,0 as offical,0 as discipline, count(*) as under_18, 0 as male, 0 as female " +
            "        FROM THR_EMPLOYEE A " +
            "        WHERE A.DEL_IF=0 AND A.JOIN_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
            "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
            "        AND ADD_MONTHS(DECODE(LENGTH(A.BIRTH_DT),4,TO_DATE(A.BIRTH_DT||'0101','YYYYMMDD'),TO_DATE(A.BIRTH_DT,'YYYYMMDD')),216)>SYSDATE " +
            "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
            "        union all " +
            "        SELECT 0 as probation,0 as offical,0 as discipline, 0 as under_18, SUM(DECODE(NVL(A.SEX,'0'),'M',1,0)) as male, SUM(DECODE(NVL(A.SEX,'0'),'F',1,0)) as female " +
            "        FROM THR_EMPLOYEE A " +
            "        WHERE A.DEL_IF=0 " +
            "        AND A.JOIN_DT BETWEEN '" + p_from + "' AND '" + p_to + "'" +
            "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
            "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
            "    )HR " ;          
            
           //Response.Write(sql_sum_info);
           //Response.End(); 
            
            sql_sum_dept  = "SELECT B.PK,B.ORG_NM, SUM(DECODE(NVL(A.SEX,'0'),'M',1,0)) as male, SUM(DECODE(NVL(A.SEX,'0'),'F',1,0)) as female,COUNT(A.PK) AS TOTAL " + 
            "        FROM THR_EMPLOYEE A,tco_org B " +
            "        WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND A.tco_org_pk=B.PK " +
            "        AND A.JOIN_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
            "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +            
            "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
            "        GROUP BY B.PK,B.ORG_NM " +
            "        ORDER BY MAX(NVL(B.SEQ,0)),B.ORG_NM " ;
            
            //Response.Write(sql_sum_dept);
            //Response.End(); 
            
            //toi day ne
                
                sql_sum_pos  = "SELECT NVL(B.CODE,'00'),NVL(B.CODE_NM,'NONE POSITION'), SUM(DECODE(NVL(A.SEX,'0'),'M',1,0)) as male, SUM(DECODE(NVL(A.SEX,'0'),'F',1,0)) as female,COUNT(A.PK) AS TOTAL " + 
                "        FROM THR_EMPLOYEE A,VHR_HR_CODE B " +
                "        WHERE A.DEL_IF=0 AND B.ID(+)='HR0008' AND A.POS_TYPE=B.CODE(+) " +
                "        AND A.JOIN_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
                "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                "        GROUP BY B.CODE,B.CODE_NM " +
                "        ORDER BY B.CODE " ;
                
                //Response.Write(sql_sum_pos);
               //Response.End();
                
                sql_sum_sen = "SELECT  SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 < 1 THEN 1 " + 
                "             ELSE 0 END)) AS T1 " +
                "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 > =1 " +
                "                        AND MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 < 2 THEN 1 " +
                "             ELSE 0 END)) AS T2 " +
                "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 >= 2 " +
                "                        AND MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 < 3 THEN 1 " +
                "             ELSE 0 END)) AS T3 " +
                "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 >= 3 " +
                "                        AND MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 < 4 THEN 1 " +
                "             ELSE 0 END)) AS T3 " +
                "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 >= 4 " +
                "                        AND MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 < 5 THEN 1 " +
                "             ELSE 0 END)) AS T3 " +
                "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 >= 5 THEN 1 " +
                "             ELSE 0 END)) AS T3 " +
                "        FROM THR_EMPLOYEE A " +
                "        WHERE A.DEL_IF=0 " +
                "        AND A.JOIN_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
                "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " ;
                  
                
              // Response.Write(sql_sum_sen);
              //  Response.End();
        }   
        
        if(p_emp_type=="2")
        {                     
                 sql_sum_info = "SELECT MAX(HR.probation),MAX(HR.offical),MAX(HR.discipline),MAX(HR.under_18),MAX(HR.male),MAX(HR.female) " + 
                "FROM " +
                "( " +
                "        SELECT count(*) as probation,0 as offical,0 as discipline, 0 as under_18, 0 as male, 0 as female " +
                "        FROM THR_EMPLOYEE A " +
                "        WHERE A.DEL_IF=0 AND A.END_PROBATION > '" + p_from + "' " +
                "        AND A.JOIN_DT<='" + p_to + "' " +
                "        AND A.LEFT_DT IS NOT NULL " +
                "        AND A.LEFT_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
                "        AND A.STATUS='R' " +
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                "        union all " +
                "        SELECT 0 as probation,count(distinct a.pk) as offical,0 as discipline, 0 as under_18, 0 as male, 0 as female " +
                "        FROM THR_EMPLOYEE A,THR_LABOUR_CONTRACT M " +
                "        WHERE A.DEL_IF=0 AND M.DEL_IF=0 AND A.PK=M.THR_EMPLOYEE_PK " +
                     //"        AND M.CONTRACT_TIMES=2 " +
                "        AND A.END_PROBATION <= '" + p_from + "' " +
                "        AND A.JOIN_DT<='" + p_to + "' " +
                "        AND A.LEFT_DT IS NOT NULL " +
                "        AND A.LEFT_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                "        union all " +
                "        SELECT 0 as probation,0 as offical,count(*) as discipline, 0 as under_18, 0 as male, 0 as female " +
                "        FROM THR_EMPLOYEE A,THR_DISCIPLINE B " +
                "        WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND A.PK=B.THR_EMP_PK " +
                "        AND A.JOIN_DT<='" + p_to + "' " +
                "        AND A.LEFT_DT IS NOT NULL " +
                "        AND A.LEFT_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
                "        AND B.DIS_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                "        GROUP BY A.PK " +
                "        union all " +
                "        SELECT 0 as probation,0 as offical,0 as discipline, count(*) as under_18, 0 as male, 0 as female " +
                "        FROM THR_EMPLOYEE A " +
                "        WHERE A.DEL_IF=0 AND A.JOIN_DT<='" + p_to + "' " +
                "        AND A.LEFT_DT IS NOT NULL " +
                "        AND A.LEFT_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
                "        AND ADD_MONTHS(DECODE(LENGTH(A.BIRTH_DT),4,TO_DATE(A.BIRTH_DT||'0101','YYYYMMDD'),TO_DATE(A.BIRTH_DT,'YYYYMMDD')),216)>SYSDATE " +
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                "        union all " +
                "        SELECT 0 as probation,0 as offical,0 as discipline, 0 as under_18, SUM(DECODE(NVL(A.SEX,'0'),'M',1,0)) as male, SUM(DECODE(NVL(A.SEX,'0'),'F',1,0)) as female " +
                "        FROM THR_EMPLOYEE A " +
                "        WHERE A.DEL_IF=0 " +
                "        AND A.JOIN_DT<='" + p_to + "' " +
                "        AND A.LEFT_DT IS NOT NULL " +
                "        AND A.LEFT_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                "    )HR " ;
                
                
                              
            sql_sum_dept ="SELECT B.PK,B.ORG_NM, SUM(DECODE(NVL(A.SEX,'0'),'M',1,0)) as male, SUM(DECODE(NVL(A.SEX,'0'),'F',1,0)) as female,COUNT(A.PK) AS TOTAL " + 
                "        FROM THR_EMPLOYEE A,tco_org B " +
                "        WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND A.tco_org_pk=B.PK " +
                "        AND A.JOIN_DT<='" + p_to + "' " +
                "        AND A.LEFT_DT IS NOT NULL " +
                "        AND A.LEFT_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
                "        AND A.STATUS='R' " +                
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                "        GROUP BY B.PK,B.ORG_NM " +
                "        ORDER BY MAX(NVL(B.SEQ,0)),B.ORG_NM " ;
                
                //Response.Write(sql_sum_dept);
                //Response.End();
                
               sql_sum_pos= "SELECT NVL(B.CODE,'00'),NVL(B.CODE_NM,'NONE POSITION'), SUM(DECODE(NVL(A.SEX,'0'),'M',1,0)) as male, SUM(DECODE(NVL(A.SEX,'0'),'F',1,0)) as female,COUNT(A.PK) AS TOTAL " + 
                "        FROM THR_EMPLOYEE A,VHR_HR_CODE B " +
                "        WHERE A.DEL_IF=0 AND B.ID(+)='HR0008' AND A.POS_TYPE=B.CODE(+) " +
                "        AND A.JOIN_DT<='" + p_to + "' " +
                "        AND A.LEFT_DT IS NOT NULL " +
                "        AND A.LEFT_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
                "        AND A.STATUS='R' " +
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                "        GROUP BY B.CODE,B.CODE_NM " +
                "        ORDER BY B.CODE " ;
        
        //Response.Write(sql_sum_pos);
        //Response.End();
        
        sql_sum_sen = "SELECT  SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 < 1  THEN 1 " + 
                "             ELSE 0 END)) AS T1 " +
                "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 >= 1 " +
                "                        AND MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 < 2 THEN 1 " +
                "             ELSE 0 END)) AS T2 " +
                "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 >= 2 " +
                "                        AND MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 < 3 THEN 1 " +
                "             ELSE 0 END)) AS T3 " +
                "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 >= 3 " +
                "                        AND MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12<4 THEN 1 " +
                "             ELSE 0 END)) AS T3 " +
                "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 >= 4 " +
                "                        AND MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 < 5 THEN 1 " +
                "             ELSE 0 END)) AS T3 " +
                "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 >= 5 THEN 1 " +
                "             ELSE 0 END)) AS T3 " +
                "        FROM THR_EMPLOYEE A " +
                "        WHERE A.DEL_IF=0 " +
                "        AND A.JOIN_DT<='" + p_to + "' " +
                "        AND A.LEFT_DT IS NOT NULL " +
                "        AND A.LEFT_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
                "        AND A.STATUS='R' " +
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " ;
                
                //Response.Write(sql_sum_sen);
                //Response.End();
        }    
        
        if(p_emp_type=="3")
        {                     
                 sql_sum_info= "SELECT MAX(HR.probation),MAX(HR.offical),MAX(HR.discipline),MAX(HR.under_18),MAX(HR.male),MAX(HR.female) " + 
                    "FROM " +
                    "( " +
                    "        SELECT count(*) as probation,0 as offical,0 as discipline, 0 as under_18, 0 as male, 0 as female " +
                    "        FROM THR_EMPLOYEE A,THR_ABSENCE_REG B " +
                    "        WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND A.PK=B.THR_EMP_PK " +
                    "        AND A.END_PROBATION > '" + p_from + "' " +
                    "        AND A.JOIN_DT<='" + p_to + "' " +
                    "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
                    "        AND (B.START_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
                    "            OR B.END_DT BETWEEN '" + p_from + "' AND '" + p_to + "') " +
                   "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                    "        union all " +
                    "        SELECT 0 as probation,count(distinct a.pk) as offical,0 as discipline, 0 as under_18, 0 as male, 0 as female " +
                    "        FROM THR_EMPLOYEE A,THR_LABOUR_CONTRACT M,THR_ABSENCE_REG B " +
                    "        WHERE A.DEL_IF=0 AND M.DEL_IF=0 AND A.PK=M.THR_EMPLOYEE_PK " +
                    "        AND B.DEL_IF=0 AND A.PK=B.THR_EMP_PK " +
                     //"        AND M.CONTRACT_TIMES=2 " +
                    "        AND A.END_PROBATION <= '" + p_from + "' " +
                    "        AND A.JOIN_DT<='" + p_to + "' " +
                    "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
                    "        AND (B.START_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
                    "            OR B.END_DT BETWEEN '" + p_from + "' AND '" + p_to + "') " +
                    "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                    "        union all " +
                    "        SELECT 0 as probation,0 as offical,count(*) as discipline, 0 as under_18, 0 as male, 0 as female " +
                    "        FROM THR_EMPLOYEE A,THR_DISCIPLINE B,THR_ABSENCE_REG C " +
                    "        WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND C.DEL_IF=0 AND A.PK=B.THR_EMP_PK " +
                    "        AND A.PK=C.THR_EMP_PK " +
                    "        AND A.JOIN_DT<='" + p_to + "' " +
                    "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
                    "        AND B.DIS_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
                    "        AND (C.START_DT BETWEEN '"  + p_from + "' AND '" + p_to + "' " +
                    "            OR C.END_DT BETWEEN '" + p_from + "' AND '" + p_to + "') " +
                    "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                    "        GROUP BY A.PK " +
                    "        union all " +
                    "        SELECT 0 as probation,0 as offical,0 as discipline, count(*) as under_18, 0 as male, 0 as female " +
                    "        FROM THR_EMPLOYEE A,THR_ABSENCE_REG B " +
                    "        WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND A.PK=B.THR_EMP_PK " +
                    "         AND A.JOIN_DT<='" + p_to + "' " +
                    "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
                    "        AND ADD_MONTHS(DECODE(LENGTH(A.BIRTH_DT),4,TO_DATE(A.BIRTH_DT||'0101','YYYYMMDD'),TO_DATE(A.BIRTH_DT,'YYYYMMDD')),216)>SYSDATE " +
                    "        AND B.ABSENCE_TYPE='04'  " +
                    "       AND B.END_DT >='" + p_from + "' AND B.START_DT <='" + p_to + "' " +
                    "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                    "        union all " +
                    "        SELECT 0 as probation,0 as offical,0 as discipline, 0 as under_18, SUM(DECODE(NVL(A.SEX,'0'),'M',1,0)) as male, SUM(DECODE(NVL(A.SEX,'0'),'F',1,0)) as female " +
                    "        FROM THR_EMPLOYEE A,THR_ABSENCE_REG B " +
                    "        WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND A.PK=B.THR_EMP_PK " +
                    "        AND A.JOIN_DT<='" + p_to + "' " +
                    "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
                    "        AND (B.START_DT BETWEEN '" + p_from + "' AND '" + p_to + "' " +
                    "            OR B.END_DT BETWEEN '" + p_from + "' AND '" + p_to + "') " +
                    "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                    "    )HR " ;

                 
                 //Response.Write(sql_sum_info);
                 //Response.End();
                 
            sql_sum_dept = "SELECT B.PK,B.ORG_NM, SUM(DECODE(NVL(A.SEX,'0'),'M',1,0)) as male, SUM(DECODE(NVL(A.SEX,'0'),'F',1,0)) as female,COUNT(A.PK) AS TOTAL " + 
                "        FROM THR_EMPLOYEE A,tco_org B,THR_ABSENCE_REG C " +
                "        WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND C.DEL_IF=0 AND A.PK=C.THR_EMP_PK " +
                "        AND A.tco_org_pk=B.PK " +
                "        AND A.JOIN_DT<='" + p_to + "' " +
                "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +                
                "        AND C.ABSENCE_TYPE='04' " +
                "       AND B.END_DT >='" + p_from + "' AND B.START_DT <='" + p_to + "' " +
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                "        GROUP BY B.PK,B.ORG_NM " +
                "        ORDER BY MAX(NVL(B.SEQ,0)),B.ORG_NM " ;               
             
             //Response.Write(sql_sum_dept);
             //Response.End();
             
             sql_sum_pos = "SELECT NVL(B.CODE,'00'),NVL(B.CODE_NM,'NONE POSITION'), SUM(DECODE(NVL(A.SEX,'0'),'M',1,0)) as male, SUM(DECODE(NVL(A.SEX,'0'),'F',1,0)) as female,COUNT(A.PK) AS TOTAL " + 
                "        FROM THR_EMPLOYEE A,VHR_HR_CODE B,THR_ABSENCE_REG C " +
                "        WHERE A.DEL_IF=0 AND C.DEL_IF=0 AND A.PK=C.THR_EMP_PK " +
                "        AND B.ID(+)='HR0008' AND A.POS_TYPE=B.CODE(+) " +
                "        AND A.JOIN_DT<='" + p_to + "' " +
                "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
                "        AND C.ABSENCE_TYPE='04' " +
                "       AND B.END_DT >='" + p_from + "' AND B.START_DT <='" + p_to + "' " +
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " +
                "        GROUP BY B.CODE,B.CODE_NM " +
                "        ORDER BY B.CODE " ;
        
        //Response.Write(sql_sum_pos);
        //Response.End();
        
            sql_sum_sen = "SELECT  SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 < 1 THEN 1 " + 
                "             ELSE 0 END)) AS T1 " +
                "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 >= 1 " +
                "                        AND MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 < 2 THEN 1 " +
                "             ELSE 0 END)) AS T2 " +
                "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 >= 2 " +
                "                        AND MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 < 3 THEN 1 " +
                "             ELSE 0 END)) AS T3 " +
                "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 >= 3 " +
                "                        AND MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 < 4 THEN 1 " +
                "             ELSE 0 END)) AS T3 " +
                "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 >= 4 " +
                "                        AND MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 < 5 THEN 1 " +
                "             ELSE 0 END)) AS T3 " +
                "        ,SUM((CASE WHEN MONTHS_BETWEEN(SYSDATE,TO_DATE(A.JOIN_DT,'YYYYMMDD'))/12 >= 5 THEN 1 " +
                "             ELSE 0 END)) AS T3 " +
                "        FROM THR_EMPLOYEE A,THR_ABSENCE_REG B " +
                "        WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND A.PK=B.THR_EMP_PK " +
                "        AND A.JOIN_DT <= '" + p_to + "' " +
                "        AND (A.LEFT_DT IS NULL OR A.LEFT_DT>'" + p_to + "') " +
                "        AND B.ABSENCE_TYPE='04'  " +
                "       AND B.END_DT >='" + p_from + "' AND B.START_DT <='" + p_to + "' " +
                "        AND (a.tco_org_pk IN (SELECT g.pk " +
        "                                FROM tco_org g " +
        "                                WHERE g.del_if = 0 " +
        "                                START WITH g.pk =DECODE ('" +p_tco_org +"','ALL', 0,'" + p_tco_org + "') " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "                        OR '"+ p_tco_org + "' = 'ALL') " ;
                
                //Response.Write(sql_sum_sen);
                //Response.End();
        }    
        
        //Response.Write(sql_sum_info);
        //Response.End();           
        
        DataTable dt_sum_info = CtlLib.TableReadOpen(sql_sum_info);
        
            if (dt_sum_info.Rows.Count == 0)
            {
                Response.Write("There is no data to show");
                Response.End();
            }    
        
        DataTable dt_sum_dept = CtlLib.TableReadOpen(sql_sum_dept);
        
        if (dt_sum_dept.Rows.Count == 0)
        {
            Response.Write("There is no data to show");
            Response.End();
        }            
           
        DataTable dt_sum_pos = CtlLib.TableReadOpen(sql_sum_pos);
        
        if (dt_sum_pos.Rows.Count == 0)
        {
            Response.Write("There is no data to show");
            Response.End();
        }        
           
        DataTable dt_sum_sen = CtlLib.TableReadOpen(sql_sum_sen);
        
        if (dt_sum_sen.Rows.Count == 0)
        {
            Response.Write("There is no data to show");
            Response.End();
        }       
          
%>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_employee_info_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_employee_info_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_employee_info_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Thu Hien</o:Author>
  <o:LastAuthor>Thu Hien</o:LastAuthor>
  <o:LastPrinted>2008-11-20T08:48:50Z</o:LastPrinted>
  <o:Created>2008-11-19T09:31:00Z</o:Created>
  <o:LastSaved>2008-11-20T08:49:09Z</o:LastSaved>
  <o:Company>Vina Genuwin</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .5in 1.0in .5in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;
	mso-horizontal-page-align:center;}
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
	mso-number-format:"Medium Date";}
.xl25
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl26
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl27
	{mso-style-parent:style0;
	border:.5pt solid windowtext;}
.xl28
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border:.5pt solid windowtext;}
.xl29
	{mso-style-parent:style0;
	color:red;
	font-style:italic;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl30
	{mso-style-parent:style0;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl31
	{mso-style-parent:style0;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl32
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl33
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl34
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl35
	{mso-style-parent:style0;
	text-align:right;}
.xl36
	{mso-style-parent:style0;
	font-weight:700;
	font-style:italic;
	font-family:Arial, sans-serif;
	mso-font-charset:0;}
.xl37
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl38
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:silver;
	mso-pattern:auto none;}
.xl39
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl40
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl41
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt hairline windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl42
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl43
	{mso-style-parent:style0;
	font-size:14.0pt;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl44
	{mso-style-parent:style0;
	font-size:14.0pt;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl45
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	border-top:.5pt hairline windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl46
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl47
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	border-top:.5pt hairline windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl48
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl49
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl50
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl51
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt hairline windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl52
	{mso-style-parent:style0;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl53
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl54
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl55
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border-top:.5pt hairline windowtext;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;}
.xl56
	{mso-style-parent:style0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl57
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:silver;
	mso-pattern:auto none;}
.xl58
	{mso-style-parent:style0;
	font-size:14.0pt;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl59
	{mso-style-parent:style0;
	font-size:14.0pt;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;}
.xl60
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;}
.xl61
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	text-align:center;
	border:.5pt solid windowtext;
	background:silver;
	mso-pattern:auto none;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>11</x:ActiveRow>
       <x:ActiveCol>4</x:ActiveCol>
       <x:RangeSelection>$E$12:$F$12</x:RangeSelection>
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
  <x:WindowHeight>8700</x:WindowHeight>
  <x:WindowWidth>11355</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>120</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1080 style='border-collapse:
 collapse;table-layout:fixed;width:809pt'>
 <col width=123 style='mso-width-source:userset;mso-width-alt:8498;width:92pt'>
 <col width=111 style='mso-width-source:userset;mso-width-alt:8059;width:83pt'>
 <col width=95 style='mso-width-source:userset;mso-width-alt:3474;width:71pt'>
 <col width=91 style='mso-width-source:userset;mso-width-alt:3328;width:68pt'>
 <col width=99 style='mso-width-source:userset;mso-width-alt:3620;width:74pt'>
 <col width=98 style='mso-width-source:userset;mso-width-alt:3584;width:74pt'>
 <col width=108 style='mso-width-source:userset;mso-width-alt:3949;width:81pt'>
 <col width=99 style='mso-width-source:userset;mso-width-alt:3620;width:74pt'>
 <col width=112 style='mso-width-source:userset;mso-width-alt:4096;width:84pt'>
 <col width=80 style='mso-width-source:userset;mso-width-alt:2925;width:60pt'>
 <col width=64 style='width:48pt'>
 <col width=63 style='mso-width-source:userset;mso-width-alt:2304;width:47pt'>
 <%
    if (p_typeDT=="4")
    {
  %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 width=123 style='height:12.75pt;width:92pt'>Year:</td>
  <td align=right width=111 style='width:83pt' x:num><%= dt_date.Rows[0][3]%></td>
  <td width=95 style='width:71pt'></td>
  <td width=91 style='width:68pt'></td>
  <td width=99 style='width:74pt'>Reporter:</td>
  <td class=xl35 width=98 style='width:74pt'><%=p_user %></td>
  <td width=108 style='width:81pt'></td>
  <td width=99 style='width:74pt'></td>
  <td width=112 style='width:84pt'></td>
  <td width=80 style='width:60pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <%
    }
  %>
  
  <%
    if (p_typeDT=="3")
    {
  %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 style='height:12.75pt'>Month:</td>
  <td class=xl36><%= dt_date.Rows[0][1]%></td>
  <td colspan=2 style='mso-ignore:colspan'></td>
  <td>Reporter:</td>
  <td class=xl35><%=p_user %></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <%
    }
  %>
  <%
    if (p_typeDT=="2")
    {
  %>
 <tr height=17 style='height:12.75pt'>
  <td height=17 style='height:12.75pt'>From: <% =dt_date.Rows[0][0]%></td>
  <td class=xl35></td>
  <td class=xl24>To: <% =dt_date.Rows[0][2]%></td>
  <td></td>
  <td>Reporter:</td>
  <td class=xl35><%=p_user %></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <%
    }
  %>
 <%
    if (p_typeDT=="1")
    {
  %> 
 <tr height=17 style='height:12.75pt'>
  <td height=17 style='height:12.75pt' x:str="Date: ">Date:<span
  style='mso-spacerun:yes'> </span></td>
  <td class=xl24 align=right><%= dt_date.Rows[0][0]%></td>
  <td class=xl24></td>
  <td></td>
  <td>Reporter:</td>
  <td class=xl35><%=p_user%></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <%
    }
    
  %>
  
 <tr height=17 style='height:12.75pt'>
 <%
 if (p_tco_org!="ALL") 
   {
 %>
  <td height=17 style='height:12.75pt'>Department:</td>
  <td class=xl25><%= p_tco_org_nm%></td>
  <%
    } 
   else
   {
   %>
    <td height=17 style='height:12.75pt'>&nbsp;</td>
    <td class=xl25>&nbsp;</td>
  <%} %>
  <td colspan=2 style='mso-ignore:colspan'></td>
  <td>Report date:</td>
  <td class=xl24 align=right x:num><%= dt_date.Rows[0][4]%></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl34 style='height:15.75pt'>CURRENT EMP</td>
  <td class=xl33 x:str="NEW EMP ">NEW EMP<span
  style='mso-spacerun:yes'> </span></td>
  <td colspan=2 class=xl33 style='border-right:.5pt solid black'>RESIGN EMP</td>
  <td colspan=2 class=xl33 style='border-right:.5pt solid black;border-left:
  none'>MATERNITY</td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl43 style='height:18.75pt;border-top:none' x:num><%=dt_gen_info.Rows[0][0].ToString() %></td>
  <td class=xl43 style='border-top:none' x:num><%=dt_gen_info.Rows[0][1].ToString() %></td>
  <td colspan=2 class=xl43 style='border-right:.5pt solid black;' x:num><%=dt_gen_info.Rows[0][2].ToString() %></td>
  <td colspan=2 class=xl43 style='border-right:.5pt solid black;' x:num><%=dt_gen_info.Rows[0][3].ToString() %></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='mso-height-source:userset;height:12.75pt'>
  <td height=17 class=xl29 style='height:12.75pt'>Sumary Information for <%=p_lbl_Int %></td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=21 style='height:15.75pt'>
  <td height=21 class=xl32 style='height:15.75pt'>Probation</td>
  <td class=xl32 style='border-left:none'>Regular</td>
  <td class=xl32 style='border-left:none'>Discipline</td>
  <td class=xl32 style='border-left:none'>Under 18</td>
  <td class=xl32 style='border-left:none'>Male</td>
  <td class=xl32 style='border-left:none'>Female</td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td height=25 class=xl27 align=right style='height:18.75pt;border-top:none'
  x:num><%=dt_sum_info.Rows[0][0].ToString() %></td>
  <td class=xl27 align=right style='border-top:none;border-left:none' x:num><%=dt_sum_info.Rows[0][1].ToString() %></td>
  <td class=xl28 style='border-top:none;border-left:none' x:num><%=dt_sum_info.Rows[0][2].ToString() %></td>
  <td class=xl28 style='border-top:none;border-left:none' x:num><%=dt_sum_info.Rows[0][3].ToString() %></td>
  <td class=xl28 style='border-top:none;border-left:none' x:num><%=dt_sum_info.Rows[0][4].ToString() %></td>
  <td class=xl28 style='border-top:none;border-left:none' x:num><%=dt_sum_info.Rows[0][5].ToString() %></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl29 colspan=2 style='height:15.0pt;mso-ignore:colspan'>Sumary
  by department for <%=p_lbl_Int %></td>
  <td colspan=9 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=2 height=26 class=xl33 style='border-right:.5pt solid black;
  height:19.5pt'>Department</td>
  <td class=xl34 style='border-left:none'>Male</td>
  <td class=xl34>Female</td>
  <td colspan=2 class=xl33>Total</td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <%
    
    for (int i=0;i<dt_sum_dept.Rows.Count;i++)
    {    
  %>
  <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=2 height=26 class=xl51 style='border-right:.5pt solid black;
  height:19.5pt'><%=dt_sum_dept.Rows[i][1] %></td>
  <td class=xl31 align=right style='border-top:none;border-left:none' x:num><%=dt_sum_dept.Rows[i][2] %></td>
  <td class=xl31 align=right style='border-top:none;border-left:none' x:num><%=dt_sum_dept.Rows[i][3] %></td>
  <td colspan=2 class=xl47 style='border-right:.5pt solid black;border-left:
  none' x:num><%=dt_sum_dept.Rows[i][4] %></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 
  <%
    }
  %>
 <tr height=18 style='mso-height-source:userset;height:13.5pt'>
  <td height=18 class=xl29 style='height:13.5pt'>Sumary by position for <%=p_lbl_Int %></td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>  
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td colspan=2 height=26 class=xl33 style='border-right:.5pt solid black;
  height:19.5pt'>Position</td>
  <td class=xl32 style='border-left:none'>Male</td>
  <td class=xl32 style='border-left:none'>Female</td>
  <td colspan=2 class=xl33 style='border-right:.5pt solid black;border-left:
  none'>Total</td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <%
    for (int i=0;i<dt_sum_pos.Rows.Count;i++)
    {
  %> 
  <tr height=25 style='mso-height-source:userset;height:18.75pt'>
  <td colspan=2 height=25 class=xl50 style='height:18.75pt'><%=dt_sum_pos.Rows[i][1] %></td>
  <td class=xl31 align=right style='border-top:none;border-left:none' x:num><%=dt_sum_pos.Rows[i][2] %></td>
  <td class=xl31 align=right style='border-top:none;border-left:none' x:num><%=dt_sum_pos.Rows[i][3] %></td>
  <td colspan=2 class=xl47 style='border-right:.5pt solid black;border-left:
  none' x:num><%=dt_sum_pos.Rows[i][4] %></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 
 <%
    } 
    %>
 
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl29 style='height:12.75pt'>Sumary by Seniority for <%=p_lbl_Int %></td>
  <td colspan=10 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl60 style='height:15.0pt'>&lt;1 (Year)</td>
  <td class=xl60 style='border-left:none'>1 to &lt; 2 (Year)</td>
  <td class=xl60 style='border-left:none'>2 to &lt;3 (Year)</td>
  <td class=xl60 style='border-left:none'>3 to 4 (Year)</td>
  <td class=xl60 style='border-left:none'>4 to &lt; 5 (Year)</td>
  <td class=xl61 style='border-left:none'>&lt; 5 (Year)</td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:19.5pt'>
  <td height=26 class=xl27 align=right style='height:19.5pt;border-top:none'
  x:num><%=dt_sum_sen.Rows[0][0]%></td>
  <td class=xl27 align=right style='border-top:none;border-left:none' x:num><%=dt_sum_sen.Rows[0][1]%></td>
  <td class=xl27 align=right style='border-top:none;border-left:none' x:num><%=dt_sum_sen.Rows[0][2]%></td>
  <td class=xl27 align=right style='border-top:none;border-left:none' x:num><%=dt_sum_sen.Rows[0][3]%></td>
  <td class=xl27 align=right style='border-top:none;border-left:none' x:num><%=dt_sum_sen.Rows[0][4]%></td>
  <td class=xl28 style='border-top:none;border-left:none' x:num><%=dt_sum_sen.Rows[0][5]%></td>
  <td colspan=5 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=123 style='width:92pt'></td>
  <td width=111 style='width:83pt'></td>
  <td width=95 style='width:71pt'></td>
  <td width=91 style='width:68pt'></td>
  <td width=99 style='width:74pt'></td>
  <td width=98 style='width:74pt'></td>
  <td width=108 style='width:81pt'></td>
  <td width=99 style='width:74pt'></td>
  <td width=112 style='width:84pt'></td>
  <td width=80 style='width:60pt'></td>
  <td width=64 style='width:48pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>