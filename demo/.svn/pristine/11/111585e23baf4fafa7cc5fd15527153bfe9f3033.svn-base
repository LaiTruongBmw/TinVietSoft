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
    
    string p_dept,p_group,p_status,p_type,p_pay_type,p_emp_id,p_work_mon,p_sal_period,p_emp_type;
     
  
    p_dept       = Request["l_dept"].ToString();
    p_group      = Request["l_group"].ToString();
    p_status      = Request["l_status"].ToString();
    p_type       = Request["l_type"].ToString();
    p_pay_type   = Request["l_pay_type"].ToString();
    p_emp_id     = Request["l_emp_id"].ToString();
    p_work_mon   = Request["l_work_mon"].ToString();
    p_sal_period = Request["l_sal_period"].ToString();
    p_emp_type = Request["l_Emp_Type"].ToString();
    string p_m_type = Request.QueryString["l_m_type"].ToString();

    if (p_type == "ALL")
        p_type = "=nvl(a.net_amt,0)";
    
    //-------------------department summary--------------------------
   string SQL
	= "select a.dept_nm," +                                     //0
	    "a.THR_GROUP_NM,  " +                                  //1
	    "count(*) ,  " +                                  //2
        "ROUND(sum(NVL(A.SALARY_LEVEL1,0)),3),  " +                               //3
        "ROUND(sum(NVL(A.SALARY_LEVEL2,0)),3),  " +                               //4
        "ROUND(sum(NVL(A.ALLOW_AMT1,0)),3),  " +                                  //5
        "ROUND(sum(NVL(A.ALLOW_AMT2,0)),3),  " +                                  //6
        "ROUND(sum(NVL(A.ALLOW_AMT3,0)),3),  " +                                  //7
        "ROUND(sum(NVL(A.ALLOW_AMT4,0)),3),  " +                                  //8
        "ROUND(sum(NVL(A.ALLOW_AMT5,0)),3),  " +                                  //9
        "ROUND(sum(NVL(A.ALLOW_AMT6,0)),3),  " +                                  //10
        "ROUND(sum(NVL(A.ALLOW_AMT7,0)),3),  " +                                  //11
        "ROUND(sum(NVL(A.ALLOW_AMT8,0)),3),  " +                                  //12
        "round(sum(nvl(A.WT_L1_AMT,0) + nvl(A.WT_L2_AMT,0) + nvl(A.TOTAL_ABS_PAY_L1_AMT,0) + nvl(A.TOTAL_ABS_PAY_L2_AMT,0)+ NVL(a.HOL_DAY_L1_AMT,0)+ NVL(a.HOL_DAY_L2_AMT,0)),3),  " +  //13
        "round(sum(nvl(A.TOTAL_OT_L1_AMT,0) + nvl(A.TOTAL_OT_L2_AMT,0)),3), " +        //14
        "ROUND(sum(NVL(A.OT_TAX_L1_AMT,0)+NVL(A.OT_TAX_L2_AMT,0)),3)," + //15
        "ROUND(sum(NVL(A.ALLOW_K1_AMT,0)),3),  " +                                //16
        "ROUND(sum(NVL(A.ALLOW_K2_AMT,0)),3),  " +                                //17
        "ROUND(sum(NVL(A.ALLOW_K3_AMT,0)),3),  " +                                //18
        "ROUND(sum(NVL(A.ALLOW_K4_AMT,0)),3),  " +                                //19
        "ROUND(sum(NVL(A.ALLOW_K5_AMT,0)),3),  " +                                //20
        "ROUND(sum(NVL(A.ALLOW_K6_AMT,0)),3),  " +                                //21
        "ROUND(sum(NVL(A.ALLOW_K7_AMT,0)),3),  " +                                //22
        "ROUND(sum(NVL(A.ALLOW_K8_AMT,0)),3),  " +                                //23
        "round(sum(nvl(A.RETURN_AMT,0) ),3), " +                //24
        "round(sum(nvl(A.INC_AMT,0)),3), " +                //25
        "round(sum(NVL(A.ALE_STOP_AMT,0)),3),  " +                                //26
        "round(sum(NVL(A.SEVERANCE_AMT,0)),3),  " +                               //27
        "round(sum(NVL(A.GROSS_AMT,0)),3),  " +                            //28
        "round(sum(NVL(A.BREAK_CONTRACT_AMT,0)),3), " +                           //29
        "round(sum(NVL(A.ADVANCE_AMT,0)),3),  " +                                 //30
        "ROUND(sum(NVL(A.DEDUCT_PIT,0)),3)," + //31
        "ROUND(sum(NVL(A.INCOME_AMT,0)),3)," + //32
        "round(sum(NVL(A.INCOME_TAX,0)),3),  " +                           //33
        "round(sum(NVL(A.UNION_AMT,0)),3),  " +                                   //34
        "round(sum(nvl(A.SOCIAL_AMT,0) + NVL(A.UNEMP_INS,0) ),3) ,  " +           //35
        "ROUND(sum(nvl(A.HEALTH_AMT,0)),3)," + //36
        "ROUND(sum(NVL(A.RETURN_NO_PIT,0)),3)," + //37
        "ROUND(sum(NVL(A.ADVANCE_NO_PIT,0)),3)," + //38 
        "round(sum(nvl(A.NET_AMT,0)),0)  " +                               //39
        "from thr_month_salary a " +         
        "where a.del_if=0 and a.work_mon='" + p_work_mon + "' " +
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
		" and decode('" + p_emp_type + "','ALL','ALL',A.EMPLOYEE_TYPE)='" + p_emp_type + "'" +
        " group by a.tco_dept_pk,a.dept_nm,a.thr_group_pk,a.thr_group_nm "  +
        "order by a.dept_nm,a.thr_group_nm" ;



//Response.Write(SQL);
//Response.End();
    DataTable dt_Emp = CtlLib.TableReadOpen(SQL);
    int irow_emp,icol_emp;
    irow_emp = dt_Emp.Rows.Count;
    icol_emp=dt_Emp.Columns.Count;
    if (irow_emp == 0)
    {
        Response.Write("There is no data of salary this month");
        Response.End();
    }
    //-------------------department summary--------------------------
    string SQL_Dept
	= "select a.dept_nm," +                                     //0
	    "count(distinct a.thr_group_nm) as count_grp,  " +                               //1
	    "count(*) as count_emp,  " +                               //2
	    "round(sum(NVL(A.SALARY_LEVEL1,0)),3),  " +                               //3
        "round(sum(NVL(A.SALARY_LEVEL2,0)),3),  " +                               //4
        "round(sum(NVL(A.ALLOW_AMT1,0)),3),  " +                                  //5
        "round(sum(NVL(A.ALLOW_AMT2,0)),3),  " +                                  //6
        "round(sum(NVL(A.ALLOW_AMT3,0)),3),  " +                                  //7
        "round(sum(NVL(A.ALLOW_AMT4,0)),3),  " +                                  //8
        "round(sum(NVL(A.ALLOW_AMT5,0)),3),  " +                                  //9
        "round(sum(NVL(A.ALLOW_AMT6,0)),3),  " +                                  //10
        "round(sum(NVL(A.ALLOW_AMT7,0)),3),  " +                                  //11
        "round(sum(NVL(A.ALLOW_AMT8,0)),3),  " +                                  //12
        "round(sum(nvl(A.WT_L1_AMT,0) + nvl(A.WT_L2_AMT,0) + nvl(A.TOTAL_ABS_PAY_L1_AMT,0) + nvl(A.TOTAL_ABS_PAY_L2_AMT,0)+ NVL(a.HOL_DAY_L1_AMT,0)+ NVL(a.HOL_DAY_L2_AMT,0)),3),  " +  //13
        "round(sum(nvl(A.TOTAL_OT_L1_AMT,0) + nvl(A.TOTAL_OT_L2_AMT,0)),3), " +        //14
        "ROUND(sum(NVL(A.OT_TAX_L1_AMT,0)+NVL(A.OT_TAX_L2_AMT,0)),3)," + //15
        "round(sum(NVL(A.ALLOW_K1_AMT,0)),3),  " +                                //16
        "round(sum(NVL(A.ALLOW_K2_AMT,0)),3),  " +                                //17
        "round(sum(NVL(A.ALLOW_K3_AMT,0)),3),  " +                                //18
        "round(sum(NVL(A.ALLOW_K4_AMT,0)),3),  " +                                //19
        "round(sum(NVL(A.ALLOW_K5_AMT,0)),3),  " +                                //20
        "round(sum(NVL(A.ALLOW_K6_AMT,0)),3),  " +                                //21
        "round(sum(NVL(A.ALLOW_K7_AMT,0)),3),  " +                                //22
        "round(sum(NVL(A.ALLOW_K8_AMT,0)),3),  " +                                //23
        "round(sum(nvl(A.RETURN_AMT,0) ),3), " +                //24
        "round(sum( nvl(A.INC_AMT,0)),3), " +                //25
        "round(sum(NVL(A.ALE_STOP_AMT,0)),3),  " +                                //26
        "round(sum(NVL(A.SEVERANCE_AMT,0)),3),  " +                               //27
        "round(sum(NVL(A.GROSS_AMT,0)),3),  " +                            //28
        "round(sum(NVL(A.BREAK_CONTRACT_AMT,0)),3), " +                          //29
        "round(sum(NVL(A.ADVANCE_AMT,0)),3),  " +                                 //30
        "ROUND(sum(NVL(A.DEDUCT_PIT,0)),3)," + //31
        "ROUND(sum(NVL(A.INCOME_AMT,0)),3)," + //32
        "round(sum(NVL(A.INCOME_TAX,0)),3),  " +                           //33
        "round(sum(NVL(A.UNION_AMT,0)),3),  " +                                   //34
        "round(sum(nvl(A.SOCIAL_AMT,0) + nvl(A.HEALTH_AMT,0)),3) ,  " +           //35
        "ROUND(sum(NVL(A.UNEMP_INS,0)),3)," + //36
        "ROUND(sum(NVL(A.RETURN_NO_PIT,0)),3)," + //37
        "ROUND(sum(NVL(A.ADVANCE_NO_PIT,0)),3)," + //38 
        "round(sum(nvl(A.NET_AMT,0)),0)  " +                               //39
        "from thr_month_salary a " +         
        "where a.del_if=0 and a.work_mon='" + p_work_mon + "' " +
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
        " and decode('" + p_sal_period + "','ALL','ALL',a.sal_period)='" + p_sal_period + "'" +
		" and decode('" + p_emp_type + "','ALL','ALL',A.EMPLOYEE_TYPE)='" + p_emp_type + "'" +
        " and nvl(a.net_amt,0) " + p_type  + 
        " group by a.tco_dept_pk,a.dept_nm "  +
        "order by a.dept_nm" ;
if(p_status=="ALL")
    SQL_Dept
    = "select a.dept_nm," +                                     //0
        "count(distinct a.thr_group_nm) + count(distinct a.times) as count_grp,  " +                               //1
        "count(*) as count_emp,  " +                               //2
        "round(sum(NVL(A.SALARY_LEVEL1,0)),3),  " +                               //3
        "round(sum(NVL(A.SALARY_LEVEL2,0)),3),  " +                               //4
        "round(sum(NVL(A.ALLOW_AMT1,0)),3),  " +                                  //5
        "round(sum(NVL(A.ALLOW_AMT2,0)),3),  " +                                  //6
        "round(sum(NVL(A.ALLOW_AMT3,0)),3),  " +                                  //7
        "round(sum(NVL(A.ALLOW_AMT4,0)),3),  " +                                  //8
        "round(sum(NVL(A.ALLOW_AMT5,0)),3),  " +                                  //9
        "round(sum(NVL(A.ALLOW_AMT6,0)),3),  " +                                  //10
        "round(sum(NVL(A.ALLOW_AMT7,0)),3),  " +                                  //11
        "round(sum(NVL(A.ALLOW_AMT8,0)),3),  " +                                  //12
        "round(sum(nvl(A.WT_L1_AMT,0) + nvl(A.WT_L2_AMT,0) + nvl(A.TOTAL_ABS_PAY_L1_AMT,0) + nvl(A.TOTAL_ABS_PAY_L2_AMT,0)+ NVL(a.HOL_DAY_L1_AMT,0)+ NVL(a.HOL_DAY_L2_AMT,0)),3),  " +  //13
        "round(sum(nvl(A.TOTAL_OT_L1_AMT,0) + nvl(A.TOTAL_OT_L2_AMT,0)),3), " +        //14
        "ROUND(sum(NVL(A.OT_TAX_L1_AMT,0)+NVL(A.OT_TAX_L2_AMT,0)),3)," + //15
        "round(sum(NVL(A.ALLOW_K1_AMT,0)),3),  " +                                //16
        "round(sum(NVL(A.ALLOW_K2_AMT,0)),3),  " +                                //17
        "round(sum(NVL(A.ALLOW_K3_AMT,0)),3),  " +                                //18
        "round(sum(NVL(A.ALLOW_K4_AMT,0)),3),  " +                                //19
        "round(sum(NVL(A.ALLOW_K5_AMT,0)),3),  " +                                //20
        "round(sum(NVL(A.ALLOW_K6_AMT,0)),3),  " +                                //21
        "round(sum(NVL(A.ALLOW_K7_AMT,0)),3),  " +                                //22
        "round(sum(NVL(A.ALLOW_K8_AMT,0)),3),  " +                                //23
        "round(sum(nvl(A.RETURN_AMT,0) ),3), " +                //24
        "round(sum( nvl(A.INC_AMT,0)),3), " +                //25
        "round(sum(NVL(A.ALE_STOP_AMT,0)),3),  " +                                //26
        "round(sum(NVL(A.SEVERANCE_AMT,0)),3),  " +                               //27
        "round(sum(NVL(A.GROSS_AMT,0)),3),  " +                            //28
        "round(sum(NVL(A.BREAK_CONTRACT_AMT,0)),3), " +                          //29
        "round(sum(NVL(A.ADVANCE_AMT,0)),3),  " +                                 //30
        "ROUND(sum(NVL(A.DEDUCT_PIT,0)),3)," + //31
        "ROUND(sum(NVL(A.INCOME_AMT,0)),3)," + //32
        "round(sum(NVL(A.INCOME_TAX,0)),3),  " +                           //33
        "round(sum(NVL(A.UNION_AMT,0)),3),  " +                                   //34
        "round(sum(nvl(A.SOCIAL_AMT,0) + nvl(A.HEALTH_AMT,0)),3) ,  " +           //35
        "ROUND(sum(NVL(A.UNEMP_INS,0)),3)," + //36
        "ROUND(sum(NVL(A.RETURN_NO_PIT,0)),3)," + //37
        "ROUND(sum(NVL(A.ADVANCE_NO_PIT,0)),3)," + //38 
        "round(sum(nvl(A.NET_AMT,0)),0)  " +                               //39
        "from thr_month_salary a " +
        "where a.del_if=0 and a.work_mon='" + p_work_mon + "' " +
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
        " and decode('" + p_sal_period + "','ALL','ALL',a.sal_period)='" + p_sal_period + "'" +
		" and decode('" + p_emp_type + "','ALL','ALL',A.EMPLOYEE_TYPE)='" + p_emp_type + "'" +
        " and nvl(a.net_amt,0) " + p_type +
        " group by a.tco_dept_pk,a.dept_nm " +
        "order by a.dept_nm";


//Response.Write(SQL_Dept);
//Response.End();
    DataTable dt_Dept = CtlLib.TableReadOpen(SQL_Dept);
    int irow_dept;
    irow_dept = dt_Dept.Rows.Count;
    if (irow_emp == 0)
    {
        Response.Write("There is no data of working time");
        Response.End();
    }
    //--------------------company information-----------------------
    string SQL_Com
	= "select  a.PARTNER_LNAME,a.ADDR1,a.PHONE_NO,a.TCO_BPPHOTO_PK,to_char(to_date('" + p_work_mon + "','yyyymm'),'MON-YYYY'),to_char(to_date('" + p_work_mon + "','yyyymm'),'MM-YYYY') " + 
        "from tco_company a " +
        "where a.DEL_IF=0 " +
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
    if (irow_com == 0)
    {
        Response.Write("There is no data of company");
        Response.End();
    }
    string SQL_Allow
	= "   SELECT MAX (code1), MAX (code2), MAX (code3), MAX (code4), MAX (code5), " + 
        "             MAX (code6), MAX (code7), MAX (code8), MAX (c1), MAX (c2), " +
        "             MAX (c3), MAX (c4), MAX (c5), MAX (c6), MAX (c7), MAX (c8), " +
        "           MAX (codef1), MAX (codef2), MAX (codef3), MAX (codef4), MAX (codef5), " + 
        "             MAX (codef6), MAX (codef7), MAX (codef8) " +
        "        FROM (SELECT DECODE (code, 'A1', a.code_nm, '') AS code1, " +
        "                     DECODE (code, 'A2', a.code_nm, '') AS code2, " +
        "                     DECODE (code, 'A3', a.code_nm, '') AS code3, " +
        "                     DECODE (code, 'A4', a.code_nm, '') AS code4, " +
        "                     DECODE (code, 'A5', a.code_nm, '') AS code5, " +
        "                     DECODE (code, 'A6', a.code_nm, '') AS code6, " +
        "                     DECODE (code, 'A7', a.code_nm, '') AS code7, " +
        "                     DECODE (code, 'A8', a.code_nm, '') AS code8, " +
        "                     DECODE (code, 'A1', a.num_2, '') AS c1, " +
        "                     DECODE (code, 'A2', a.num_2, '') AS c2, " +
        "                     DECODE (code, 'A3', a.num_2, '') AS c3, " +
        "                     DECODE (code, 'A4', a.num_2, '') AS c4, " +
        "                     DECODE (code, 'A5', a.num_2, '') AS c5, " +
        "                     DECODE (code, 'A6', a.num_2, '') AS c6, " +
        "                     DECODE (code, 'A7', a.num_2, '') AS c7, " +
        "                     DECODE (code, 'A8', a.num_2, '') AS c8, " +
        "                     DECODE (code, 'A1', a.code_fnm, '') AS codef1, " +
        "                     DECODE (code, 'A2', a.code_fnm, '') AS codef2, " +
        "                     DECODE (code, 'A3', a.code_fnm, '') AS codef3, " +
        "                     DECODE (code, 'A4', a.code_fnm, '') AS codef4, " +
        "                     DECODE (code, 'A5', a.code_fnm, '') AS codef5, " +
        "                     DECODE (code, 'A6', a.code_fnm, '') AS codef6, " +
        "                     DECODE (code, 'A7', a.code_fnm, '') AS codef7, " +
        "                     DECODE (code, 'A8', a.code_fnm, '') AS codef8 " +
        "                FROM vhr_hr_code a " +
        "               WHERE a.ID = 'HR0019'  ) allow_amt " ;
    DataTable dt_Allow = CtlLib.TableReadOpen(SQL_Allow);
    int irow_Allow;
    irow_Allow = dt_Allow.Rows.Count;
    if (irow_Allow == 0)
    {
        Response.Write("There is no data of allowance");
        Response.End();
    }
    string SQL_Allowk
	= " SELECT max(name1),max(name2),max(name3),max(name4),max(name5),max(name6),max(name7),max(name8) " + 
        "        FROM (SELECT DECODE (kind, '01', a.name, '') AS name1, " +
        "                     DECODE (kind, '02', a.name, '') AS name2, " +
        "                     DECODE (kind, '03', a.name, '') AS name3, " +
        "                     DECODE (kind, '04', a.name, '') AS name4, " +
        "                     DECODE (kind, '05', a.name, '') AS name5, " +
        "                     DECODE (kind, '06', a.name, '') AS name6, " +
        "                     DECODE (kind, '07', a.name, '') AS name7, " +
        "                     DECODE (kind, '08', a.name, '') AS name8 " +
        "                FROM THR_ALLOWANCE_MASTER A  " +
        "               WHERE del_if=0) allow_k " ;

    DataTable dt_Allowk = CtlLib.TableReadOpen(SQL_Allowk);
    int irow_Allowk;
    irow_Allowk = dt_Allowk.Rows.Count;
    if (irow_Allowk == 0)
    {
        Response.Write("There is no data of allowance");
        Response.End();
    }
    
    
 %>


<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_payroll_summary_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_payroll_summary_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_payroll_summary_files/oledata.mso">
<!--[if !mso]>
<style>
v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
x\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style>
<![endif]--><!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>ty-ml</o:Author>
  <o:LastAuthor>ty-ml</o:LastAuthor>
  <o:LastPrinted>2008-09-19T02:06:51Z</o:LastPrinted>
  <o:Created>2008-09-06T07:03:32Z</o:Created>
  <o:LastSaved>2008-09-19T03:41:56Z</o:LastSaved>
  <o:Company>genuwin</o:Company>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.38in .19in .41in .2in;
	mso-header-margin:.32in;
	mso-footer-margin:.19in;
	mso-page-orientation:landscape;}
.font8
	{color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font12
	{color:windowtext;
	font-size:11.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.font14
	{color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:italic;
	text-decoration:none;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
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
	padding:0px;
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
	font-size:12.0pt;
	font-weight:700;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl25
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl26
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl27
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl28
	{mso-style-parent:style0;
	font-size:20.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl29
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl30
	{mso-style-parent:style0;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl31
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;}
.xl32
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl33
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl34
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl35
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl36
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;}
.xl37
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl38
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt hairline windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl39
	{mso-style-parent:style0;
	font-size:15.0pt;
	font-style:italic;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;}
.xl40
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl41
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl42
	{mso-style-parent:style0;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl43
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl44
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl45
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl46
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl47
	{mso-style-parent:style0;
	font-size:11.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl48
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;
	mso-text-control:shrinktofit;}
.xl49
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl50
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl51
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FFFFCC;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl52
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl53
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl54
	{mso-style-parent:style0;
	font-size:14.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#99CCFF;
	mso-pattern:auto none;}
.xl55
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0_\)\;_\(* \\\(\#\,\#\#0\\\)\;_\(* \0022-\0022_\)\;_\(\@_\)";
	vertical-align:middle;
	border-top:.5pt hairline windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#99CCFF;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl56
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#FFFFCC;
	mso-pattern:auto none;}
.xl57
	{mso-style-parent:style0;
	font-size:13.0pt;
	font-weight:700;
	font-family:"Times New Roman", serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border-top:.5pt solid windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#FF99CC;
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
      <x:Scale>38</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>5</x:SplitHorizontal>
     <x:TopRowBottomPane>5</x:TopRowBottomPane>
     <x:SplitVertical>3</x:SplitVertical>
     <x:LeftColumnRightPane>9</x:LeftColumnRightPane>
     <x:ActivePane>0</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>1</x:Number>
       <x:ActiveCol>6</x:ActiveCol>
      </x:Pane>
      <x:Pane>
       <x:Number>2</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>0</x:Number>
       <x:ActiveRow>7</x:ActiveRow>
       <x:ActiveCol>11</x:ActiveCol>
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
  <x:WindowHeight>7935</x:WindowHeight>
  <x:WindowWidth>15195</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>105</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$1:$5</x:Formula>
 </x:ExcelName>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapedefaults v:ext="edit" spidmax="2049"/>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <o:shapelayout v:ext="edit">
  <o:idmap v:ext="edit" data="1"/>
 </o:shapelayout></xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl29>

<table x:str border=0 cellpadding=0 cellspacing=0 width=2757 style='border-collapse:
 collapse;table-layout:fixed;width:2067pt'>
 <col class=xl29 width=124 style='mso-width-source:userset;mso-width-alt:4534;
 width:93pt'>
 <col class=xl29 width=92 style='mso-width-source:userset;mso-width-alt:3364;
 width:69pt'>
 <col class=xl29 width=83 style='mso-width-source:userset;mso-width-alt:3035;
 width:62pt'>
 <col class=xl29 width=66 span=2 style='mso-width-source:userset;mso-width-alt:
 2413;width:50pt'>

   <%
        if (dt_Allow.Rows[0][8].ToString()=="1")
        {
    %>
 <col class=xl29 width=71 style='mso-width-source:userset;mso-width-alt:
 2596;width:53pt'>
 <%} %>
   <%
        if (dt_Allow.Rows[0][9].ToString()=="1")
        {
    %>
  <col class=xl29 width=71 style='mso-width-source:userset;mso-width-alt:
 2596;width:53pt'>
 <%} %>
   <%
        if (dt_Allow.Rows[0][10].ToString()=="1")
        {
    %>
  <col class=xl29 width=71 style='mso-width-source:userset;mso-width-alt:
 2596;width:53pt'>
 <%} %>
   <%
        if (dt_Allow.Rows[0][11].ToString()=="1")
        {
    %>
  <col class=xl29 width=71 style='mso-width-source:userset;mso-width-alt:
 2596;width:53pt'>
 <%} %>
   <%
        if (dt_Allow.Rows[0][12].ToString()=="1")
        {
    %>
  <col class=xl29 width=71 style='mso-width-source:userset;mso-width-alt:
 2596;width:53pt'>
 <%} %>
   <%
        if (dt_Allow.Rows[0][13].ToString()=="1")
        {
    %>
  <col class=xl29 width=71 style='mso-width-source:userset;mso-width-alt:
 2596;width:53pt'>
 <%} %>
   <%
        if (dt_Allow.Rows[0][14].ToString()=="1")
        {
    %>
  <col class=xl29 width=71 style='mso-width-source:userset;mso-width-alt:
 2596;width:53pt'>
 <%} %>
   <%
        if (dt_Allow.Rows[0][15].ToString()=="1")
        {
    %>
  <col class=xl29 width=71 style='mso-width-source:userset;mso-width-alt:
 2596;width:53pt'>
 <%} %>
 <col class=xl29 width=86 style='mso-width-source:userset;mso-width-alt:3145;
 width:65pt'>
 <col class=xl29 width=74 style='mso-width-source:userset;mso-width-alt:2706;
 width:56pt'>
 <col class=xl29 width=74 style='mso-width-source:userset;mso-width-alt:2706;
 width:56pt'>
 <%
        if (dt_Allowk.Rows[0][0].ToString()!="")
        {
    %>
 <col class=xl29 width=84 style='mso-width-source:userset;mso-width-alt:3072;
 width:63pt'>
 <%} %>
 <%
        if (dt_Allowk.Rows[0][1].ToString()!="")
        {
    %>
 <col class=xl29 width=83 style='mso-width-source:userset;mso-width-alt:3035;
 width:62pt'>
 <%} %>
 <%
        if (dt_Allowk.Rows[0][2].ToString()!="")
        {
    %>
 <col class=xl29 width=83 style='mso-width-source:userset;mso-width-alt:
 3035;width:62pt'>
 <%} %>
 <%
        if (dt_Allowk.Rows[0][3].ToString()!="")
        {
    %>
 <col class=xl29 width=83 style='mso-width-source:userset;mso-width-alt:
 3035;width:62pt'>
 <%} %>
 <%
        if (dt_Allowk.Rows[0][4].ToString()!="")
        {
    %>
 <col class=xl29 width=83 style='mso-width-source:userset;mso-width-alt:
 3035;width:62pt'>
 <%} %>
 <%
        if (dt_Allowk.Rows[0][5].ToString()!="")
        {
    %>
 <col class=xl29 width=83 style='mso-width-source:userset;mso-width-alt:
 3035;width:62pt'>
 <%} %>
 <%
        if (dt_Allowk.Rows[0][6].ToString()!="")
        {
    %>
 <col class=xl29 width=83 style='mso-width-source:userset;mso-width-alt:
 3035;width:62pt'>
 <%} %>
 <%
        if (dt_Allowk.Rows[0][7].ToString()!="")
        {
    %>
 <col class=xl29 width=83 style='mso-width-source:userset;mso-width-alt:
 3035;width:62pt'>
 <%} %>
 <col class=xl29 width=99 style='mso-width-source:userset;mso-width-alt:3620;
 width:74pt'>
 <col class=xl29 width=99 style='mso-width-source:userset;mso-width-alt:3620;
 width:74pt'>
 
 <col class=xl29 width=124 style='mso-width-source:userset;mso-width-alt:4534;
 width:93pt'>
 <col class=xl29 width=122 style='mso-width-source:userset;mso-width-alt:4461;
 width:92pt'>
 <col class=xl29 width=97 style='mso-width-source:userset;mso-width-alt:3547;
 width:73pt'>
 <col class=xl29 width=73 style='mso-width-source:userset;mso-width-alt:2669;
 width:55pt'>
 <col class=xl29 width=72 span=2 style='mso-width-source:userset;mso-width-alt:
 2633;width:54pt'>
 <col class=xl29 width=85 style='mso-width-source:userset;mso-width-alt:3108;
 width:64pt'>
 <col class=xl29 width=85 style='mso-width-source:userset;mso-width-alt:3108;
 width:64pt'>
 <col class=xl29 width=85 style='mso-width-source:userset;mso-width-alt:3108;
 width:64pt'>
 <col class=xl29 width=100 style='mso-width-source:userset;mso-width-alt:3657;
 width:75pt'>
 <col class=xl29 width=100 style='mso-width-source:userset;mso-width-alt:3657;
 width:75pt'>
 
 <col class=xl29 width=100 style='mso-width-source:userset;mso-width-alt:3657;
 width:75pt'>
 <col class=xl29 width=100 style='mso-width-source:userset;mso-width-alt:3657;
 width:75pt'>
 <col class=xl29 width=89 style='mso-width-source:userset;mso-width-alt:3254;
 width:67pt'>
 <tr height=29 style='mso-height-source:userset;height:21.75pt'>
  <td height=29 width=124 style='height:21.75pt;width:93pt' align=left
  valign=top><!--[if gte vml 1]><v:shapetype id="_x0000_t75" coordsize="21600,21600"
   o:spt="75" o:preferrelative="t" path="m@4@5l@4@11@9@11@9@5xe" filled="f"
   stroked="f">
   <v:stroke joinstyle="miter"/>
   <v:formulas>
    <v:f eqn="if lineDrawn pixelLineWidth 0"/>
    <v:f eqn="sum @0 1 0"/>
    <v:f eqn="sum 0 0 @1"/>
    <v:f eqn="prod @2 1 2"/>
    <v:f eqn="prod @3 21600 pixelWidth"/>
    <v:f eqn="prod @3 21600 pixelHeight"/>
    <v:f eqn="sum @0 0 1"/>
    <v:f eqn="prod @6 1 2"/>
    <v:f eqn="prod @7 21600 pixelWidth"/>
    <v:f eqn="sum @8 21600 0"/>
    <v:f eqn="prod @7 21600 pixelHeight"/>
    <v:f eqn="sum @10 21600 0"/>
   </v:formulas>
   <v:path o:extrusionok="f" gradientshapeok="t" o:connecttype="rect"/>
   <o:lock v:ext="edit" aspectratio="t"/>
  </v:shapetype><v:shape id="_x0000_s1025" type="#_x0000_t75" style='position:absolute;
   margin-left:10.5pt;margin-top:7.5pt;width:76.5pt;height:45.75pt;z-index:1'>
   <v:imagedata src="rpt_payroll_summary_files/image001.png" o:title="vinagenuwin"/>
   <x:ClientData ObjectType="Pict">
    <x:SizeWithCells/>
    </x:ClientData>
  </v:shape><![endif]--><![if !vml]><span style='mso-ignore:vglayout;
  position:absolute;z-index:1;margin-left:14px;margin-top:10px;width:102px;
  height:61px'><img width=102 height=61
  src="..\..\..\system\binary\ViewFile.aspx?img_pk=<%=dt_Com.Rows[0][3].ToString()%>&table_name=tco_bpphoto" v:shapes="_x0000_s1025"></span><![endif]><span
  style='mso-ignore:vglayout2'>
  <table cellpadding=0 cellspacing=0>
   <tr>
    <td height=29 class=xl29 width=124 style='height:21.75pt;width:93pt'></td>
   </tr>
  </table>
  </span></td>
  <td class=xl24 colspan=3 width=241 style='mso-ignore:colspan;width:181pt'><%=dt_Com.Rows[0][0].ToString()%></td>
  <td class=xl29 width=66 style='width:50pt'></td>
  <td class=xl29 width=71 style='width:53pt'></td>
  <td class=xl29 width=71 style='width:53pt'></td>
  <td class=xl29 width=71 style='width:53pt'></td>
  <td class=xl29 width=71 style='width:53pt'></td>
  <td class=xl29 width=71 style='width:53pt'></td>
  <td class=xl29 width=71 style='width:53pt'></td>
  <td class=xl29 width=71 style='width:53pt'></td>
  <td class=xl29 width=71 style='width:53pt'></td>
  <td class=xl29 width=86 style='width:65pt'></td>
  <td class=xl29 width=74 style='width:56pt'></td>
  <td class=xl29 width=84 style='width:63pt'></td>
  <td class=xl29 width=83 style='width:62pt'></td>
  <td class=xl29 width=83 style='width:62pt'></td>
  <td class=xl28 width=83 style='width:62pt'>PAYROLL SUMMARY IN <%=dt_Com.Rows[0][4].ToString()%></td>
  <td class=xl29 width=83 style='width:62pt'></td>
  <td class=xl29 width=83 style='width:62pt'></td>
  <td class=xl29 width=83 style='width:62pt'></td>
  <td class=xl29 width=83 style='width:62pt'></td>
  <td class=xl29 width=99 style='width:74pt'></td>
  <td class=xl29 width=124 style='width:93pt'></td>
  <td class=xl29 width=122 style='width:92pt'></td>
  <td class=xl29 width=97 style='width:73pt'></td>
  <td class=xl29 width=73 style='width:55pt'></td>
  <td class=xl29 width=72 style='width:54pt'></td>
  <td class=xl29 width=72 style='width:54pt'></td>
  <td class=xl29 width=85 style='width:64pt'></td>
  <td class=xl29 width=100 style='width:75pt'></td>
  <td class=xl29 width=89 style='width:67pt'></td>
 </tr>
 <tr height=33 style='mso-height-source:userset;height:24.75pt'>
  <td height=33 class=xl29 style='height:24.75pt'></td>
  <td class=xl24 colspan=3 style='mso-ignore:colspan'><%=dt_Com.Rows[0][1].ToString()%></td>
  <td colspan=9 class=xl25 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=4 class=xl25 style='mso-ignore:colspan'></td>
  <td class=xl39>B&#7842;NG T&#7892;NG H&#7906;P L&#431;&#416;NG THÁNG <%=dt_Com.Rows[0][5].ToString()%></td>
  <td colspan=4 class=xl25 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=9 class=xl25 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=31 style='mso-height-source:userset;height:23.25pt'>
  <td height=31 class=xl29 style='height:23.25pt'></td>
  <td class=xl24 colspan=2 style='mso-ignore:colspan'>Phone :<span
  style='mso-spacerun:yes'>  </span><%=dt_Com.Rows[0][2].ToString()%></td>
  <td colspan=10 class=xl26 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=4 class=xl26 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=4 class=xl26 style='mso-ignore:colspan'></td>
  <td class=xl29></td>
  <td colspan=9 class=xl26 style='mso-ignore:colspan'></td>
 </tr>
 <tr class=xl41 height=46 style='mso-height-source:userset;height:34.5pt'>
  <td rowspan=2 height=92 class=xl44 width=124 style='border-bottom:.5pt solid black;
  height:69.0pt;width:93pt'>DEPARTMENT<br>
    <font class="font8">B&#7897; ph&#7853;n</font></td>
  <td rowspan=2 class=xl44 width=92 style='border-bottom:.5pt solid black;
  width:69pt'>GROUP<br>
    <font class="font8">Nhóm</font></td>
  <td rowspan=2 class=xl44 width=83 style='border-bottom:.5pt solid black;
  width:62pt'>Employees Total<br>
    <font class="font8">T&#7893;ng s&#7889; nhân viên</font></td>
  <td colspan=2 class=xl43 width=132 style='border-right:.5pt solid black;
  border-left:none;width:100pt'>Salary<br>
    <font class="font8">L&#432;&#417;ng</font></td>
    <%
        if (dt_Allow.Rows[0][8].ToString()=="1")
        {
    %>
  <td rowspan=2 class=xl46 width=71 style='width:53pt'><% =dt_Allow.Rows[0][0].ToString()%><br>
    <font class="font8"><% =dt_Allow.Rows[0][16].ToString()%></font></td>
    <%  } %>
    <%
        if (dt_Allow.Rows[0][9].ToString()=="1")
        {
    %>
  <td rowspan=2 class=xl46 width=71 style='width:53pt'><% =dt_Allow.Rows[0][1].ToString()%><br>
    <font class="font8"><% =dt_Allow.Rows[0][17].ToString()%></font></td>
   <%  } %>
   <%
        if (dt_Allow.Rows[0][10].ToString()=="1")
        {
    %>
  <td rowspan=2 class=xl46 width=71 style='width:53pt'><% =dt_Allow.Rows[0][2].ToString()%><br>
    <font class="font8"><% =dt_Allow.Rows[0][18].ToString()%></font></td>
    <% } %>
    <%
        if (dt_Allow.Rows[0][11].ToString()=="1")
        {
    %>
  <td rowspan=2 class=xl46 width=71 style='width:53pt'><% =dt_Allow.Rows[0][3].ToString()%><br>
    <font class="font8"><% =dt_Allow.Rows[0][19].ToString()%></font></td>
    <%} %>
    <%
        if (dt_Allow.Rows[0][12].ToString()=="1")
        {
    %>
  <td rowspan=2 class=xl46 width=71 style='width:53pt'><% =dt_Allow.Rows[0][4].ToString()%><br>
    <font class="font8"><% =dt_Allow.Rows[0][20].ToString()%></font></td>
    <%} %>
    <%
        if (dt_Allow.Rows[0][13].ToString()=="1")
        {
    %>
  <td rowspan=2 class=xl46 width=71 style='width:53pt'><% =dt_Allow.Rows[0][5].ToString()%><br>
    <font class="font8"><% =dt_Allow.Rows[0][21].ToString()%></font></td>
    <%} %>
    <%
        if (dt_Allow.Rows[0][14].ToString()=="1")
        {
    %>
  <td rowspan=2 class=xl46 width=71 style='width:53pt'><% =dt_Allow.Rows[0][6].ToString()%><br>
    <font class="font8"><% =dt_Allow.Rows[0][22].ToString()%></font></td>
    <%} %>
    <%
        if (dt_Allow.Rows[0][15].ToString()=="1")
        {
    %>
  <td rowspan=2 class=xl46 width=71 style='width:53pt'><% =dt_Allow.Rows[0][7].ToString()%><br>
    <font class="font8"><% =dt_Allow.Rows[0][23].ToString()%></font></td>
    <%} %>
  <td rowspan=2 class=xl44 width=86 style='border-bottom:.5pt solid black;
  width:65pt'>Working Salary<br>
    <font class="font8">L&#432;&#417;ng ngày công</font></td>
  <td rowspan=2 class=xl44 width=74 style='border-bottom:.5pt solid black;
  width:56pt'>OT Salary<br>
    <font class="font8">L&#432;&#417;ng t&#259;ng ca </font></td>
  <td rowspan=2 class=xl44 width=74 style='border-bottom:.5pt solid black;
  width:56pt'>OT 100%<br>
    <font class="font8">Tăng ca(100%)</font></td>
   <%
        if (dt_Allowk.Rows[0][0].ToString()!="")
        {
    %>
  <td rowspan=2 class=xl46 width=84 style='width:63pt'><%=dt_Allowk.Rows[0][0].ToString() %>
    </td>
    <%} %>
    <%
        if (dt_Allowk.Rows[0][1].ToString()!="")
        {
    %>
   <td rowspan=2 class=xl46 width=84 style='width:63pt'><%=dt_Allowk.Rows[0][1].ToString() %>
    </td>
     <%} %>
    <%
        if (dt_Allowk.Rows[0][2].ToString()!="")
        {
    %>
   <td rowspan=2 class=xl46 width=84 style='width:63pt'><%=dt_Allowk.Rows[0][2].ToString() %>
    </td>
     <%} %>
    <%
        if (dt_Allowk.Rows[0][3].ToString()!="")
        {
    %>
   <td rowspan=2 class=xl46 width=84 style='width:63pt'><%=dt_Allowk.Rows[0][3].ToString() %>
    </td>
     <%} %>
    <%
        if (dt_Allowk.Rows[0][4].ToString()!="")
        {
    %>
   <td rowspan=2 class=xl46 width=84 style='width:63pt'><%=dt_Allowk.Rows[0][4].ToString() %>
    </td>
     <%} %>
    <%
        if (dt_Allowk.Rows[0][5].ToString()!="")
        {
    %>
   <td rowspan=2 class=xl46 width=84 style='width:63pt'><%=dt_Allowk.Rows[0][5].ToString() %>
    </td>
     <%} %>
    <%
        if (dt_Allowk.Rows[0][6].ToString()!="")
        {
    %>
   <td rowspan=2 class=xl46 width=84 style='width:63pt'><%=dt_Allowk.Rows[0][6].ToString() %>
    </td>
     <%} %>
    <%
        if (dt_Allowk.Rows[0][7].ToString()!="")
        {
    %>
   <td rowspan=2 class=xl46 width=84 style='width:63pt'><%=dt_Allowk.Rows[0][7].ToString() %>
    </td>
     <%} %>
   
  <td rowspan=2 class=xl47 width=99 style='width:74pt'>Other Compensation<br>
    <font class="font12">Hoàn tr&#7843; khác</font></td>
  <td rowspan=2 class=xl47 width=99 style='width:74pt'>Incentive<br>
    <font class="font12">Tiền thưởng</font></td>
  <td class=xl43 width=124 style='border-left:none;width:93pt'>Remaining
  ALE<br>
    <font class="font8">Phép n&#259;m còn l&#7841;i<span
  style='mso-spacerun:yes'> </span></font></td>
  <td class=xl43 width=122 style='width:92pt'>Severance<br>
    <font class="font8">Tr&#7907; c&#7845;p thôi vi&#7879;c</font></td>
  <td rowspan=2 class=xl48 width=97 style='width:73pt'>Total Income<br>
    <font class="font8">T&#7893;ng thu nh&#7853;p</font></td>
  <td rowspan=2 class=xl44 width=73 style='border-bottom:.5pt solid black;
  width:55pt'>Break Contract<br>
    <font class="font8">Vi ph&#7841;m h&#7907;p &#273;&#7891;ng</font></td>
  <td rowspan=2 class=xl47 width=72 style='width:54pt'>Other Deduction <br>
    <font class="font12">Tr&#7915; khác</font></td>
  <td rowspan=2 class=xl47 width=72 style='width:54pt'>Deduct PIT<br>
    <font class="font12">Giảm trừ thuế</font></td>
  <td rowspan=2 class=xl47 width=72 style='width:54pt'>Income Pay Tax<br>
    <font class="font12">Thu nhập chịu thuế</font></td>
    
  <td rowspan=2 class=xl47 width=72 style='width:54pt'>Income Tax<br>
    <font class="font12">Thu&#7871; thu nh&#7853;p</font></td>
  <td rowspan=2 class=xl48 width=85 style='width:64pt'>Union AMT<br>
    <font class="font8">Ti&#7873;n công &#273;oàn</font></td>
  <td rowspan=2 class=xl48 width=100 style='width:75pt'>Insurance (SI & UI 7%)<br>
    <font class="font8">BHXH & BHTN</font></td>
  <td rowspan=2 class=xl48 width=100 style='width:75pt'>Insurance (HI 1.5%)<br>
    <font class="font8">BH YT</font></td>
    
  <td rowspan=2 class=xl47 width=99 style='width:74pt'>Other Compensation (No PIT)<br>
    <font class="font12">Hoàn tr&#7843; khác</font></td>
  <td rowspan=2 class=xl47 width=72 style='width:54pt'>Other Deduction (No PIT)<br>
    <font class="font12">Tr&#7915; khác</font></td>  
  <td rowspan=2 class=xl48 width=89 style='width:67pt'>Net Salary<br>
    <font class="font8">Th&#7921;c lãnh</font></td>
 </tr>
 
 <tr class=xl41 height=46 style='mso-height-source:userset;height:34.5pt'>
  <td height=46 class=xl42 width=66 style='height:34.5pt;border-top:none;
  border-left:none;width:50pt'>PRO<br>
    <font class="font14">TV</font></td>
  <td class=xl42 width=66 style='border-top:none;border-left:none;width:50pt'>OFF<br>
    <font class="font14">CT</font></td>
  <td class=xl27 width=124 style='border-left:none;width:93pt'>Salary <br>
    <font class="font8">Ti&#7873;n</font></td>
  <td class=xl27 width=122 style='border-left:none;width:92pt'>Salary <br>
    <font class="font8">Ti&#7873;n</font></td>
 </tr>
 <%
    //khai bao bien 
    int i,idept;
    idept=-1;
    int k ;
    double[] Grant_Total=new double[60];
    Boolean bTotal=false; 
    Boolean bChangeDept=false; 
    string cur_dept,next_dept,old_dept;
    for (int j=2;j<icol_emp;j++)
    {
        Grant_Total[j-2]=0;
    }
    
    for (i=0;i<irow_emp;i++)
    {
        cur_dept=dt_Emp.Rows[i][0].ToString() ;
        for (int j=2;j<icol_emp;j++)
        {
            Grant_Total[j-2]+=Double.Parse(dt_Emp.Rows[i][j].ToString());
        }
 %>
 <tr class=xl35 height=46 style='mso-height-source:userset;height:34.5pt'>
 <%
    if (i==0)
    {
        bChangeDept=true;
    }
    else
    {
        old_dept=dt_Emp.Rows[i-1][0].ToString();
        if (old_dept != cur_dept)
            bChangeDept=true;
        else
            bChangeDept=false;
    }    
  %>
  <% if (bChangeDept==true) 
     {
        idept+=1;
  %>
    <td height=46 rowspan='<%=dt_Dept.Rows[idept][1] %>' class=xl33 style='height:34.5pt;border-top:none'><%=dt_Emp.Rows[i][0].ToString()%></td>
   <%
        bChangeDept=false;
     }
    %> 
  <td class=xl33 style='border-top:none;border-left:none'><%=dt_Emp.Rows[i][1].ToString()%></td>
  <td class=xl32 style='border-top:none;border-left:none' x:num><%=dt_Emp.Rows[i][2].ToString()%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][3].ToString()%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][4].ToString()%></td>
  
  <%
        if (dt_Allow.Rows[0][8].ToString()=="1")
        {
    %>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][5].ToString()%></td>
  <%    } %>
  <%
        if (dt_Allow.Rows[0][9].ToString()=="1")
        {
    %>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][6].ToString()%></td>
  <%    } %>
  <%
        if (dt_Allow.Rows[0][10].ToString()=="1")
        {
    %>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][7].ToString()%></td>
  <%    } %>
  <%
        if (dt_Allow.Rows[0][11].ToString()=="1")
        {
    %>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][8].ToString()%></td>
  <%    } %>
  <%
        if (dt_Allow.Rows[0][12].ToString()=="1")
        {
    %>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][9].ToString()%></td>
  <%    } %>
  <%
        if (dt_Allow.Rows[0][13].ToString()=="1")
        {
    %>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][10].ToString()%></td>
  <%    } %>
  <%
        if (dt_Allow.Rows[0][14].ToString()=="1")
        {
    %>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][11].ToString()%></td>
  <%    } %>
  <%
        if (dt_Allow.Rows[0][15].ToString()=="1")
        {
    %>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][12].ToString()%></td>
  <%    } %>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][13].ToString()%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][14].ToString()%></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][15].ToString()%></td>
  <%
        if (dt_Allowk.Rows[0][0].ToString()!="")
        {
    %>
 <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][16].ToString()%></td>
  <%} %>
  <%
        if (dt_Allowk.Rows[0][1].ToString()!="")
        {
    %>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][17].ToString()%> </td>
  <%} %>
  <%
        if (dt_Allowk.Rows[0][2].ToString()!="")
        {
    %>
   <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][18].ToString()%></td>
  <%} %>
  <%
        if (dt_Allowk.Rows[0][3].ToString()!="")
        {
    %>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][19].ToString()%> </td>
  <%} %>
  <%
        if (dt_Allowk.Rows[0][4].ToString()!="")
        {
    %>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][20].ToString()%></td>
  <%} %>
  <%
        if (dt_Allowk.Rows[0][5].ToString()!="")
        {
    %>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][21].ToString()%></td>
  <%} %>
  <%
        if (dt_Allowk.Rows[0][6].ToString()!="")
        {
    %>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][22].ToString()%></td>
  <%} %>
  <%
        if (dt_Allowk.Rows[0][7].ToString()!="")
        {
    %>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][23].ToString()%></td>
  <%} %>
  <%
      
      for (k = 24; k <= 39; k++)
      {
         %>
  <td class=xl34 style='border-top:none;border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Emp.Rows[i][k].ToString()%></td>
 <%
      } %>
  
 </tr>
 <%
        
        
        if (i<irow_emp-1)
        {
            
            next_dept=dt_Emp.Rows[i+1][0].ToString();
            if (cur_dept!=next_dept)
                bTotal=true;
        }    
        else
        {
                bTotal=true;
        }
  %>
  <%
        if (bTotal==true)
        {
   %>
 <tr class=xl30 height=46 style='mso-height-source:userset;height:34.5pt'>
  <td colspan=2 class=xl56 style='border-right:.5pt solid black'>Total <%=cur_dept %></td>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][2].ToString()%> </td>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][3].ToString()%> </td>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][4].ToString()%></td>
  <%
        if (dt_Allow.Rows[0][8].ToString()=="1")
        {
    %>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][5].ToString()%></td>
  <%} %>
  <%
        if (dt_Allow.Rows[0][9].ToString()=="1")
        {
    %>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][6].ToString()%></td>
  <%} %>
  <%
        if (dt_Allow.Rows[0][10].ToString()=="1")
        {
    %>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][7].ToString()%></td>
  <%} %>
  <%
        if (dt_Allow.Rows[0][11].ToString()=="1")
        {
    %>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][8].ToString()%></td>
  <%} %>
  <%
        if (dt_Allow.Rows[0][12].ToString()=="1")
        {
    %>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][9].ToString()%></td>
  <%} %>
  <%
        if (dt_Allow.Rows[0][13].ToString()=="1")
        {
    %>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][10].ToString()%></td>
  <%} %>
  <%
        if (dt_Allow.Rows[0][14].ToString()=="1")
        {
    %>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][11].ToString()%></td>
  <%} %>
  <%
        if (dt_Allow.Rows[0][15].ToString()=="1")
        {
    %>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][12].ToString()%></td>
  <%} %>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][13].ToString()%></td>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][14].ToString()%></td>
 <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][15].ToString()%></td>
    <%
        if (dt_Allowk.Rows[0][0].ToString()!="")
        {
    %>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][16].ToString()%></td>
  <%} %>
    <%
        if (dt_Allowk.Rows[0][1].ToString()!="")
        {
    %>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][17].ToString()%></td>
  <%} %>
    <%
        if (dt_Allowk.Rows[0][2].ToString()!="")
        {
    %>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][18].ToString()%></td>
  <%} %>
    <%
        if (dt_Allowk.Rows[0][3].ToString()!="")
        {
    %>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][19].ToString()%></td>
  <%} %>
    <%
        if (dt_Allowk.Rows[0][4].ToString()!="")
        {
    %>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][20].ToString()%></td>
  <%} %>
    <%
        if (dt_Allowk.Rows[0][5].ToString()!="")
        {
    %>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][21].ToString()%></td>
  <%} %>
    <%
        if (dt_Allowk.Rows[0][6].ToString()!="")
        {
    %>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][22].ToString()%></td>
  <%} %>
    <%
        if (dt_Allowk.Rows[0][7].ToString()!="")
        {
    %>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][23].ToString()%></td>
  <%} %>
  <%
        for (k=24;k<=39;k++)
        { %>
  <td class=xl51 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=dt_Dept.Rows[idept][k].ToString()%></td>
  <%    } %>
  
  
 </tr>
 <%
            bTotal=false;
        
    }
 }
  %>
 <tr class=xl30 height=46 style='mso-height-source:userset;height:34.5pt'>
  <td colspan=2 height=46 class=xl52 style='border-right:.5pt solid black;
  height:34.5pt'>Grant Total</td>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[0] %></td>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[1] %></td>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[2] %></td>
   <%
        if (dt_Allow.Rows[0][8].ToString()=="1")
        {
    %>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[3] %></td>
  <%} %>
   <%
        if (dt_Allow.Rows[0][9].ToString()=="1")
        {
    %>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[4] %></td>
  <%} %>
   <%
        if (dt_Allow.Rows[0][10].ToString()=="1")
        {
    %>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[5] %></td>
  <%} %>
   <%
        if (dt_Allow.Rows[0][11].ToString()=="1")
        {
    %>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[6] %></td>
  <%} %>
   <%
        if (dt_Allow.Rows[0][12].ToString()=="1")
        {
    %>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[7] %></td>
  <%} %>
   <%
        if (dt_Allow.Rows[0][13].ToString()=="1")
        {
    %>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[8] %></td>
  <%} %>
   <%
        if (dt_Allow.Rows[0][14].ToString()=="1")
        {
    %>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[9] %></td>
  <%} %>
   <%
        if (dt_Allow.Rows[0][15].ToString()=="1")
        {
    %>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[10] %></td>
  <%} %>
  
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[11] %></td>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[12] %></td>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[13] %></td>
    <%
        if (dt_Allowk.Rows[0][0].ToString()!="")
        {
    %>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[14] %></td>
  <%} %>
    <%
        if (dt_Allowk.Rows[0][1].ToString()!="")
        {
    %>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[15] %></td>
  <%} %>
    <%
        if (dt_Allowk.Rows[0][2].ToString()!="")
        {
    %>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[16] %></td>
  <%} %>
    <%
        if (dt_Allowk.Rows[0][3].ToString()!="")
        {
    %>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[17] %></td>
  <%} %>
    <%
        if (dt_Allowk.Rows[0][4].ToString()!="")
        {
    %>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[18] %></td>
  <%} %>
    <%
        if (dt_Allowk.Rows[0][5].ToString()!="")
        {
    %>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[19] %></td>
  <%} %>
    <%
        if (dt_Allowk.Rows[0][6].ToString()!="")
        {
    %>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[20] %></td>
  <%} %>
    <%
        if (dt_Allowk.Rows[0][7].ToString()!="")
        {
    %>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[21] %></td>
  <%} %>
  <%
        for (k=22;k<=37;k++)
        { %>
  <td class=xl55 style='border-left:none' x:num><span
  style='mso-spacerun:yes'> </span><%=Grant_Total[k] %></td>
  <%} %>
  
  </tr>
 <tr height=25 style='height:18.75pt'>
  <td height=25 colspan=2 class=xl31 style='height:18.75pt;mso-ignore:colspan'></td>
  <td colspan=31 class=xl29 style='mso-ignore:colspan'></td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=124 style='width:93pt'></td>
  <td width=92 style='width:69pt'></td>
  <td width=83 style='width:62pt'></td>
  <td width=66 style='width:50pt'></td>
  <td width=66 style='width:50pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=71 style='width:53pt'></td>
  <td width=86 style='width:65pt'></td>
  <td width=74 style='width:56pt'></td>
  <td width=84 style='width:63pt'></td>
  <td width=83 style='width:62pt'></td>
  <td width=83 style='width:62pt'></td>
  <td width=83 style='width:62pt'></td>
  <td width=83 style='width:62pt'></td>
  <td width=83 style='width:62pt'></td>
  <td width=83 style='width:62pt'></td>
  <td width=83 style='width:62pt'></td>
  <td width=99 style='width:74pt'></td>
  <td width=124 style='width:93pt'></td>
  <td width=122 style='width:92pt'></td>
  <td width=97 style='width:73pt'></td>
  <td width=73 style='width:55pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=72 style='width:54pt'></td>
  <td width=85 style='width:64pt'></td>
  <td width=100 style='width:75pt'></td>
  <td width=89 style='width:67pt'></td>
 </tr>
 <![endif]>
</table>

</body>

</html>
