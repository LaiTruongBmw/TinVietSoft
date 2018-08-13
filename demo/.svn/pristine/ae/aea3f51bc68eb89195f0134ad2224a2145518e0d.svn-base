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
    
    string p_user, p_tco_org_pk, p_wg, p_emp_id, p_work_mon;
    string p_from_date, p_to_date, p_from_date_text, p_to_date_text, p_date_type, p_nation, p_salary_period, p_lstEmpID;


    p_tco_org_pk = Request["l_tco_dept_pk"].ToString();
    p_wg = Request["l_thr_group_pk"].ToString();
    //p_date_type = Request["p_date_type"].ToString();
    //p_search_by = Request["p_search_by"].ToString();
    p_emp_id = Request["l_emp_id"].ToString();
    //p_work_shift = Request["p_work_shift"].ToString();
    p_from_date = Request["l_from_dt"].ToString();
    p_to_date = Request["l_to_dt"].ToString();
    p_user = Request["l_user"].ToString();
    p_nation = Request["l_nation"].ToString();
    p_work_mon = Request["l_work_mon"].ToString();
    p_salary_period = Request["l_SalaryPeriod"].ToString();
    p_lstEmpID = Request["l_lstEmpID"].ToString();


    string SQL;
    if (p_lstEmpID != "")
    {    
    
        SQL= "select o.ORG_NM, g.WORKGROUP_NM, e.EMP_ID, e.FULL_NAME " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+0,'yyyymmdd'), m.WORK_TIME , 0)) as wt_0 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+0,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_0   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+0,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_0 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+0,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_0              " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+1,'yyyymmdd'), m.WORK_TIME, 0)) as wt_1 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+1,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_1   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+1,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_1 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+1,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_1     " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+2,'yyyymmdd'), m.WORK_TIME, 0)) as wt_2 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+2,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_2   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+2,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_2 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+2,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_2         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+3,'yyyymmdd'), m.WORK_TIME, 0)) as wt_3 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+3,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_3   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+3,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_3 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+3,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_3    " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+4,'yyyymmdd'), m.WORK_TIME, 0)) as wt_4 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+4,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_4   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+4,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_4 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+4,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_4           " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+5,'yyyymmdd'), m.WORK_TIME, 0)) as wt_5 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+5,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_5   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+5,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_5 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+5,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_5         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+6,'yyyymmdd'), m.WORK_TIME, 0)) as wt_6 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+6,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_6   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+6,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_6 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+6,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_6         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+7,'yyyymmdd'), m.WORK_TIME, 0)) as wt_7 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+7,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_7   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+7,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_7 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+7,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_7         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+8,'yyyymmdd'), m.WORK_TIME, 0)) as wt_8 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+8,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_8   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+8,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_8 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+8,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_8         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+9,'yyyymmdd'), m.WORK_TIME, 0)) as wt_9 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+9,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_9   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+9,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_9 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+9,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_9         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+10,'yyyymmdd'), m.WORK_TIME, 0)) as wt_10 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+10,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_10   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+10,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_10 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+10,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_10         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+11,'yyyymmdd'), m.WORK_TIME, 0)) as wt_11 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+11,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_11   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+11,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_11 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+11,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_11         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+12,'yyyymmdd'), m.WORK_TIME, 0)) as wt_12 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+12,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_12   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+12,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_12 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+12,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_12         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+13,'yyyymmdd'), m.WORK_TIME, 0)) as wt_13 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+13,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_13   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+13,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_13 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+13,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_13         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+14,'yyyymmdd'), m.WORK_TIME, 0)) as wt_14 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+14,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_14  " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+14,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_14 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+14,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_14         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+15,'yyyymmdd'), m.WORK_TIME, 0)) as wt_15 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+15,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_15   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+15,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_15 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+15,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_15         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+16,'yyyymmdd'), m.WORK_TIME, 0)) as wt_16 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+16,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_16  " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+16,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_16 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+16,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_16         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+17,'yyyymmdd'), m.WORK_TIME, 0)) as wt_17 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+17,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_17   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+17,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_17 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+17,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_17         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+18,'yyyymmdd'), m.WORK_TIME, 0)) as wt_18 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+18,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_18  " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+18,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_18 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+18,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_18         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+19,'yyyymmdd'), m.WORK_TIME, 0)) as wt_19 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+19,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_19  " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+19,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_19 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+19,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_19         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+20,'yyyymmdd'), m.WORK_TIME, 0)) as wt_20 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+20,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_20   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+20,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_20 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+20,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_20         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+21,'yyyymmdd'), m.WORK_TIME, 0)) as wt_21 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+21,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_21  " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+21,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_21 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+21,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_21         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+22,'yyyymmdd'), m.WORK_TIME, 0)) as wt_22 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+22,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_22   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+22,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_22 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+22,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_22         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+23,'yyyymmdd'), m.WORK_TIME, 0)) as wt_23 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+23,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_23   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+23,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_23 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+23,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_23         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+24,'yyyymmdd'), m.WORK_TIME, 0)) as wt_24 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+24,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_24   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+24,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_24 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+24,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_24         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+25,'yyyymmdd'), m.WORK_TIME, 0)) as wt_25 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+25,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_25   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+25,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_25 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+25,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_25         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+26,'yyyymmdd'), m.WORK_TIME, 0)) as wt_26 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+26,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_26   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+26,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_26 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+26,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_26         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+27,'yyyymmdd'), m.WORK_TIME, 0)) as wt_27 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+27,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_27   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+27,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_27 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+27,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_27         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+28,'yyyymmdd'), m.WORK_TIME, 0)) as wt_28 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+28,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_28   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+28,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_28 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+28,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_28         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+29,'yyyymmdd'), m.WORK_TIME, 0)) as wt_29 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+29,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_29   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+29,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_29 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+29,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_29         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+30,'yyyymmdd'), m.WORK_TIME, 0)) as wt_30   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+30,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_30   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+30,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_30 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+30,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_30     " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+0,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_0 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+1,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_1 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+2,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_2 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+3,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_3 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+4,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_4 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+5,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_5 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+6,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_6 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+7,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_7 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+8,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_8 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+9,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_9 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+10,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_10 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+11,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_11 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+12,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_12 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+13,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_13 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+14,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_14 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+15,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_15 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+16,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_16 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+17,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_17 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+18,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_18 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+19,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_19 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+20,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_20 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+21,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_21 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+22,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_22 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+23,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_23 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+24,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_24 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+25,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_25 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+26,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_26 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+27,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_27 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+28,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_28 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+29,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_29 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+30,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_30  " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd'),'dd')) as d_0 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+1,'dd')) as d_1 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+2,'dd')) as d_2 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+3,'dd')) as d_3 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+4,'dd')) as d_4 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+5,'dd')) as d_5 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+6,'dd')) as d_6 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+7,'dd')) as d_7 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+8,'dd')) as d_8 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+9,'dd')) as d_9 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+10,'dd')) as d_10 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+11,'dd')) as d_11 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+12,'dd')) as d_12 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+13,'dd')) as d_13 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+14,'dd')) as d_14 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+15,'dd')) as d_15 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+16,'dd')) as d_16 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+17,'dd')) as d_17 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+18,'dd')) as d_18 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+19,'dd')) as d_19 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+20,'dd')) as d_20 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+21,'dd')) as d_21 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+22,'dd')) as d_22 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+23,'dd')) as d_23 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+24,'dd')) as d_24 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+25,'dd')) as d_25 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+26,'dd')) as d_26 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+27,'dd')) as d_27 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+28,'dd')) as d_28 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+29,'dd')) as d_29 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+30,'dd')) as d_30 " +
        "    ,count(w.WORK_DT) " +
        "    ,max(nvl(tm.work_time,0))+sum(nvl(a.abs_plus,0)) as sum_wt " +
        "    ,sum(case when t.OT_TYPE='OT' and t.HOL_TYPE is null then nvl(t.OT_TIME,0) end) as sum_ot " +
        "    ,sum(decode(t.OT_TYPE,'NT',nvl(t.OT_TIME,0),0)) as sum_nt " +
        "    ,sum(case when t.OT_TYPE='HT' and t.HOL_TYPE='SUN' then nvl(t.OT_TIME,0) end) as sum_ost " +
        "    ,sum(case when t.OT_TYPE='HT' and t.HOL_TYPE='HOL' then nvl(t.OT_TIME,0) end) as sum_oht " +
        "    ,sum(nvl(a.abs_time,0)) as abs_ttl  " +
        "from thr_employee e, thr_work_group g, tco_org o, thr_time_machine m " +
        "    , thr_wg_sch_detail w, thr_extra_time t " +
        "    , (select a.thr_emp_pk, a.ABSENCE_DT, v.char_1 " +
        "    , decode(nvl(a.COMPANY_PAY_YN,'N'),'N',0,nvl(a.ABSENCE_TIME,0))as abs_time,nvl(a.ABSENCE_PLUS,0) as abs_plus " +
        "        from thr_absence a , vhr_hr_code v " +
        "        where a.DEL_IF=0  " +
        "        and v.ID='HR0003' " +
        "        and v.CODE=a.ABSENCE_TYPE " +
        "        and a.ABSENCE_DT between '" + p_from_date + "' and '" + p_to_date + "' " +
        "       )  a " +
        "   ,(select tm.thr_emp_pk, sum(nvl(tm.work_time,0)) as work_time from thr_time_machine tm " +
        "       where tm.del_if=0 " +
        "       and tm.work_dt between '" + p_from_date + "' and '" + p_to_date + "' " +
        "       group by tm.thr_emp_pk) tm " +
        "where  e.DEL_IF=0 " +
        "    and g.DEL_IF=0 " +
        "    and o.DEL_IF=0 " +
        "    and m.DEL_IF(+)=0  " +
        "    and t.DEL_IF(+)=0    " +
        " and decode('" + p_salary_period + "','ALL','ALL',nvl(e.sal_period,' '))='" + p_salary_period + "' " +
        "    and w.DEL_IF=0         " +
        "    AND e.JOIN_DT <= '" + p_to_date + "' " +
        "    AND (e.LEFT_DT > w.WORK_DT OR e.LEFT_DT IS NULL) " +
        "    and e.THR_WG_PK=g.pk " +
        "    and e.TCO_ORG_PK=o.pk " +
        "    and e.PK=w.THR_EMP_PK         " +
        "    and w.THR_EMP_PK=tm.THR_EMP_PK(+) " +
        "    and w.THR_EMP_PK=t.THR_EMP_PK(+) " +
        "    and w.THR_EMP_PK =m.THR_EMP_PK(+) " +
        "    and w.THR_EMP_PK=a.THR_EMP_PK(+)         " +
        "    and UPPER(e.emp_id) in ('" + p_lstEmpID + "')" + 
        "   AND DECODE ('" + p_nation + "', 'ALL', '" + p_nation + "', e.nation) = '" + p_nation + "'" +
        "     AND DECODE ('" + p_wg + "', 'ALL', '" + p_wg + "', g.PK) = '" + p_wg + "'" +
        "                   AND (    e.TCO_ORG_PK IN ( " +
        "                       SELECT     G.PK " +
        "                             FROM TCO_ORG G " +
        "                            WHERE G.DEL_IF = 0           " +
        "                       START WITH G.PK = " +
        "                                     DECODE ('" + p_tco_org_pk + "', " +
        "                                             'ALL', 0, " +
        "                                             '" + p_tco_org_pk + "' " +
        "                                            ) " +
        "                       CONNECT BY PRIOR G.PK = G.P_PK) " +
        "                 OR '" + p_tco_org_pk + "' = 'ALL') " +
        "    and w.WORK_DT=m.WORK_DT(+) " +
        "    and w.WORK_DT=t.WORK_DT(+) " +
        "    and w.WORK_DT=a.ABSENCE_DT(+) " +
        "    and w.WORK_DT between '" + p_from_date + "' AND '" + p_to_date + "' " +
        "group by o.ORG_NM, g.WORKGROUP_NM, e.EMP_ID, e.FULL_NAME " +
        "order by o.ORG_NM, g.WORKGROUP_NM, e.EMP_ID, e.FULL_NAME ";
    
    }
    else //if (p_lstEmpID == "")
    {
        
        SQL= "select o.ORG_NM, g.WORKGROUP_NM, e.EMP_ID, e.FULL_NAME " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+0,'yyyymmdd'), m.WORK_TIME , 0)) as wt_0 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+0,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_0   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+0,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_0 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+0,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_0              " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+1,'yyyymmdd'), m.WORK_TIME, 0)) as wt_1 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+1,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_1   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+1,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_1 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+1,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_1     " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+2,'yyyymmdd'), m.WORK_TIME, 0)) as wt_2 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+2,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_2   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+2,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_2 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+2,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_2         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+3,'yyyymmdd'), m.WORK_TIME, 0)) as wt_3 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+3,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_3   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+3,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_3 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+3,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_3    " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+4,'yyyymmdd'), m.WORK_TIME, 0)) as wt_4 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+4,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_4   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+4,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_4 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+4,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_4           " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+5,'yyyymmdd'), m.WORK_TIME, 0)) as wt_5 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+5,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_5   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+5,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_5 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+5,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_5         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+6,'yyyymmdd'), m.WORK_TIME, 0)) as wt_6 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+6,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_6   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+6,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_6 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+6,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_6         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+7,'yyyymmdd'), m.WORK_TIME, 0)) as wt_7 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+7,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_7   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+7,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_7 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+7,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_7         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+8,'yyyymmdd'), m.WORK_TIME, 0)) as wt_8 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+8,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_8   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+8,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_8 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+8,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_8         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+9,'yyyymmdd'), m.WORK_TIME, 0)) as wt_9 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+9,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_9   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+9,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_9 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+9,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_9         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+10,'yyyymmdd'), m.WORK_TIME, 0)) as wt_10 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+10,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_10   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+10,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_10 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+10,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_10         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+11,'yyyymmdd'), m.WORK_TIME, 0)) as wt_11 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+11,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_11   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+11,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_11 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+11,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_11         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+12,'yyyymmdd'), m.WORK_TIME, 0)) as wt_12 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+12,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_12   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+12,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_12 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+12,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_12         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+13,'yyyymmdd'), m.WORK_TIME, 0)) as wt_13 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+13,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_13   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+13,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_13 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+13,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_13         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+14,'yyyymmdd'), m.WORK_TIME, 0)) as wt_14 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+14,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_14  " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+14,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_14 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+14,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_14         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+15,'yyyymmdd'), m.WORK_TIME, 0)) as wt_15 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+15,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_15   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+15,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_15 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+15,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_15         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+16,'yyyymmdd'), m.WORK_TIME, 0)) as wt_16 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+16,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_16  " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+16,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_16 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+16,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_16         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+17,'yyyymmdd'), m.WORK_TIME, 0)) as wt_17 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+17,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_17   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+17,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_17 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+17,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_17         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+18,'yyyymmdd'), m.WORK_TIME, 0)) as wt_18 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+18,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_18  " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+18,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_18 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+18,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_18         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+19,'yyyymmdd'), m.WORK_TIME, 0)) as wt_19 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+19,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_19  " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+19,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_19 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+19,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_19         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+20,'yyyymmdd'), m.WORK_TIME, 0)) as wt_20 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+20,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_20   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+20,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_20 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+20,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_20         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+21,'yyyymmdd'), m.WORK_TIME, 0)) as wt_21 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+21,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_21  " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+21,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_21 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+21,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_21         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+22,'yyyymmdd'), m.WORK_TIME, 0)) as wt_22 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+22,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_22   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+22,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_22 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+22,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_22         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+23,'yyyymmdd'), m.WORK_TIME, 0)) as wt_23 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+23,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_23   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+23,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_23 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+23,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_23         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+24,'yyyymmdd'), m.WORK_TIME, 0)) as wt_24 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+24,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_24   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+24,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_24 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+24,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_24         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+25,'yyyymmdd'), m.WORK_TIME, 0)) as wt_25 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+25,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_25   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+25,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_25 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+25,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_25         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+26,'yyyymmdd'), m.WORK_TIME, 0)) as wt_26 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+26,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_26   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+26,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_26 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+26,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_26         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+27,'yyyymmdd'), m.WORK_TIME, 0)) as wt_27 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+27,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_27   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+27,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_27 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+27,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_27         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+28,'yyyymmdd'), m.WORK_TIME, 0)) as wt_28 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+28,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_28   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+28,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_28 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+28,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_28         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+29,'yyyymmdd'), m.WORK_TIME, 0)) as wt_29 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+29,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_29   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+29,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_29 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+29,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_29         " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+30,'yyyymmdd'), m.WORK_TIME, 0)) as wt_30   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+30,'yyyymmdd') and t.OT_TYPE='OT'   " +
        "        then    t.OT_TIME else 0 end) as OT_30   " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+30,'yyyymmdd') and t.OT_TYPE='NT'   " +
        "        then    t.OT_TIME else 0 end) as NT_30 " +
        "    ,   max( case when w.WORK_DT= to_char(to_date('" + p_from_date + "','yyyymmdd')+30,'yyyymmdd') and t.OT_TYPE='HT'  " +
        "        then    t.OT_TIME else 0 end) as HT_30     " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+0,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_0 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+1,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_1 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+2,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_2 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+3,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_3 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+4,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_4 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+5,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_5 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+6,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_6 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+7,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_7 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+8,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_8 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+9,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_9 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+10,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_10 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+11,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_11 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+12,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_12 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+13,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_13 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+14,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_14 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+15,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_15 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+16,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_16 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+17,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_17 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+18,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_18 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+19,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_19 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+20,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_20 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+21,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_21 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+22,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_22 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+23,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_23 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+24,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_24 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+25,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_25 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+26,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_26 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+27,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_27 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+28,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_28 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+29,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_29 " +
        "    ,max( decode(w.WORK_DT, to_char(to_date('" + p_from_date + "','yyyymmdd')+30,'yyyymmdd'), decode( w.HOL_TYPE,'HOL',1,'SUN',2,3 ), 0)) as day_30  " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd'),'dd')) as d_0 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+1,'dd')) as d_1 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+2,'dd')) as d_2 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+3,'dd')) as d_3 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+4,'dd')) as d_4 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+5,'dd')) as d_5 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+6,'dd')) as d_6 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+7,'dd')) as d_7 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+8,'dd')) as d_8 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+9,'dd')) as d_9 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+10,'dd')) as d_10 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+11,'dd')) as d_11 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+12,'dd')) as d_12 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+13,'dd')) as d_13 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+14,'dd')) as d_14 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+15,'dd')) as d_15 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+16,'dd')) as d_16 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+17,'dd')) as d_17 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+18,'dd')) as d_18 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+19,'dd')) as d_19 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+20,'dd')) as d_20 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+21,'dd')) as d_21 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+22,'dd')) as d_22 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+23,'dd')) as d_23 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+24,'dd')) as d_24 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+25,'dd')) as d_25 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+26,'dd')) as d_26 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+27,'dd')) as d_27 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+28,'dd')) as d_28 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+29,'dd')) as d_29 " +
        "    ,max( to_char(to_date('" + p_from_date + "','yyyymmdd')+30,'dd')) as d_30 " +
        "    ,count(w.WORK_DT) " +
        "    ,max(nvl(tm.work_time,0))+sum(nvl(a.abs_plus,0)) as sum_wt " +
        "    ,sum(case when t.OT_TYPE='OT' and t.HOL_TYPE is null then nvl(t.OT_TIME,0) end) as sum_ot " +
        "    ,sum(decode(t.OT_TYPE,'NT',nvl(t.OT_TIME,0),0)) as sum_nt " +
        "    ,sum(case when t.OT_TYPE='HT' and t.HOL_TYPE='SUN' then nvl(t.OT_TIME,0) end) as sum_ost " +
        "    ,sum(case when t.OT_TYPE='HT' and t.HOL_TYPE='HOL' then nvl(t.OT_TIME,0) end) as sum_oht " +
        "    ,sum(nvl(a.abs_time,0)) as abs_ttl  " +
        "from thr_employee e, thr_work_group g, tco_org o, thr_time_machine m " +
        "    , thr_wg_sch_detail w, thr_extra_time t " +
        "    , (select a.thr_emp_pk, a.ABSENCE_DT, v.char_1 " +
        "    , decode(nvl(a.COMPANY_PAY_YN,'N'),'N',0,nvl(a.ABSENCE_TIME,0))as abs_time,nvl(a.ABSENCE_PLUS,0) as abs_plus " +
        "        from thr_absence a , vhr_hr_code v " +
        "        where a.DEL_IF=0  " +
        "        and v.ID='HR0003' " +
        "        and v.CODE=a.ABSENCE_TYPE " +
        "        and a.ABSENCE_DT between '" + p_from_date + "' and '" + p_to_date + "' " +
        "       )  a " +
        "   ,(select tm.thr_emp_pk, sum(nvl(tm.work_time,0)) as work_time from thr_time_machine tm " +
        "       where tm.del_if=0 " +
        "       and tm.work_dt between '" + p_from_date + "' and '" + p_to_date + "' " +
        "       group by tm.thr_emp_pk) tm " +
        "where  e.DEL_IF=0 " +
        "    and g.DEL_IF=0 " +
        "    and o.DEL_IF=0 " +
        "    and m.DEL_IF(+)=0  " +
        "    and t.DEL_IF(+)=0    " +
        " and decode('" + p_salary_period + "','ALL','ALL',nvl(e.sal_period,' '))='" + p_salary_period + "' " +
        "    and w.DEL_IF=0         " +
        "    AND e.JOIN_DT <= '" + p_to_date + "' " +
        "    AND (e.LEFT_DT > w.WORK_DT OR e.LEFT_DT IS NULL) " +
        "    and e.THR_WG_PK=g.pk " +
        "    and e.TCO_ORG_PK=o.pk " +
        "    and e.PK=w.THR_EMP_PK         " +
        "    and w.THR_EMP_PK=tm.THR_EMP_PK(+) " +
        "    and w.THR_EMP_PK=t.THR_EMP_PK(+) " +
        "    and w.THR_EMP_PK =m.THR_EMP_PK(+) " +
        "    and w.THR_EMP_PK=a.THR_EMP_PK(+)         " +
        "     AND (  e.emp_id like '%'||'" + p_emp_id + "'||'%'  ) " +
        "   AND DECODE ('" + p_nation + "', 'ALL', '" + p_nation + "', e.nation) = '" + p_nation + "'" +
        "     AND DECODE ('" + p_wg + "', 'ALL', '" + p_wg + "', g.PK) = '" + p_wg + "'" +
        "                   AND (    e.TCO_ORG_PK IN ( " +
        "                       SELECT     G.PK " +
        "                             FROM TCO_ORG G " +
        "                            WHERE G.DEL_IF = 0           " +
        "                       START WITH G.PK = " +
        "                                     DECODE ('" + p_tco_org_pk + "', " +
        "                                             'ALL', 0, " +
        "                                             '" + p_tco_org_pk + "' " +
        "                                            ) " +
        "                       CONNECT BY PRIOR G.PK = G.P_PK) " +
        "                 OR '" + p_tco_org_pk + "' = 'ALL') " +
        "    and w.WORK_DT=m.WORK_DT(+) " +
        "    and w.WORK_DT=t.WORK_DT(+) " +
        "    and w.WORK_DT=a.ABSENCE_DT(+) " +
        "    and w.WORK_DT between '" + p_from_date + "' AND '" + p_to_date + "' " +
        "group by o.ORG_NM, g.WORKGROUP_NM, e.EMP_ID, e.FULL_NAME " +
        "order by o.ORG_NM, g.WORKGROUP_NM, e.EMP_ID, e.FULL_NAME ";
    }
    
    
    //Response.Write(SQL);
    //Response.End();

    DataTable dt_emp = CtlLib.TableReadOpen(SQL);               
    int dt_row = dt_emp.Rows.Count;
    if (dt_row == 0)
    {
        Response.Write("There is no data to show");
        Response.End();
    }

    string SQL1
    = "select substr(t.car_date,-2),t.hol_type " +
        "from thr_calendar T,thr_close m " +
        "where t.del_if=0 and m.del_if=0 and m.id='" + p_salary_period + "' and m.month_close='" + p_work_mon + "' " +
        "   and m.tco_company_pk=(select tco_company_pk from tco_org g where g.del_if=0 and g.pk='" + p_tco_org_pk + "' ) " +
		" and t.tco_company_pk=(select tco_company_pk from tco_org g where g.del_if=0 and g.pk='" + p_tco_org_pk + "' ) " +
        "    and t.car_date between m.from_dt and '" + p_to_date + "' order by t.car_date ";
    DataTable dt_day = CtlLib.TableReadOpen(SQL1);
    int day = int.Parse(dt_day.Rows[0][0].ToString()) ;
    //Response.Write(SQL1);
    //Response.End();
    
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=utf-8">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="rpt_attendence_absence_detail_files/filelist.xml">
<link rel=Edit-Time-Data href="rpt_attendence_absence_detail_files/editdata.mso">
<link rel=OLE-Object-Data href="rpt_attendence_absence_detail_files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>Hee</o:Author>
  <o:LastAuthor>Hee</o:LastAuthor>
  <o:LastPrinted>2009-10-15T02:55:31Z</o:LastPrinted>
  <o:Created>2009-10-15T02:32:52Z</o:Created>
  <o:LastSaved>2009-10-16T01:36:33Z</o:LastSaved>
  <o:Version>11.5606</o:Version>
 </o:DocumentProperties>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:.44in .25in .39in .26in;
	mso-header-margin:.25in;
	mso-footer-margin:.28in;
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
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;}
.xl25
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl26
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;}
.xl27
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl28
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#FFCC00;
	mso-pattern:auto none;}
.xl29
	{mso-style-parent:style0;
	font-size:12.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:#FFCC00;
	mso-pattern:auto none;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;}
.xl31
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl32
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl33
	{mso-style-parent:style0;
	color:#3366FF;
	font-size:18.0pt;
	font-weight:700;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;}
.xl34
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022?_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl35
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022?_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	border:.5pt solid windowtext;
	background:yellow;
	mso-pattern:auto none;
	white-space:nowrap;
	mso-text-control:shrinktofit;}
.xl36
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022?_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	background:pink;
	mso-pattern:auto none;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}	
.xl37
	{mso-style-parent:style0;
	font-family:Tahoma, sans-serif;
	mso-font-charset:0;
	mso-number-format:"_\(* \#\,\#\#0\.0_\)\;_\(* \\\(\#\,\#\#0\.0\\\)\;_\(* \0022-\0022?_\)\;_\(\@_\)";
	text-align:center;
	vertical-align:middle;
	background:silver;
	mso-pattern:auto thin-diag-stripe;
	border:.5pt solid windowtext;
	white-space:nowrap;
	mso-text-control:shrinktofit;}	
		
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
      <x:Scale>81</x:Scale>
      <x:HorizontalResolution>600</x:HorizontalResolution>
      <x:VerticalResolution>600</x:VerticalResolution>
     </x:Print>
     <x:Zoom>90</x:Zoom>
     <x:Selected/>
     <x:FreezePanes/>
     <x:FrozenNoSplit/>
     <x:SplitHorizontal>7</x:SplitHorizontal>
     <x:TopRowBottomPane>7</x:TopRowBottomPane>
     <x:SplitVertical>4</x:SplitVertical>
     <x:LeftColumnRightPane>4</x:LeftColumnRightPane>
     <x:ActivePane>0</x:ActivePane>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>1</x:Number>
      </x:Pane>
      <x:Pane>
       <x:Number>2</x:Number>
       <x:ActiveRow>4</x:ActiveRow>
      </x:Pane>
      <x:Pane>
       <x:Number>0</x:Number>
       <x:ActiveRow>8</x:ActiveRow>
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
  <x:WindowHeight>12525</x:WindowHeight>
  <x:WindowWidth>19035</x:WindowWidth>
  <x:WindowTopX>0</x:WindowTopX>
  <x:WindowTopY>120</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
 <x:ExcelName>
  <x:Name>Print_Titles</x:Name>
  <x:SheetIndex>1</x:SheetIndex>
  <x:Formula>=Sheet1!$4:$7</x:Formula>
 </x:ExcelName>
</xml><![endif]-->
</head>

<body link=blue vlink=purple class=xl24>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1249 style='border-collapse:
 collapse;table-layout:fixed;width:937pt'>
 <col class=xl24 width=39 style='mso-width-source:userset;mso-width-alt:1426;
 width:29pt'>
 <col class=xl24 width=159 span=2 style='mso-width-source:userset;mso-width-alt:
 5814;width:119pt'>
 <col class=xl24 width=70 style='mso-width-source:userset;mso-width-alt:2560;
 width:53pt'>
 <col class=xl24 width=173 style='mso-width-source:userset;mso-width-alt:6326;
 width:130pt'>
<!-- <col class=xl24 width=0 style='display:none;mso-width-source:userset;
 mso-width-alt:5302'> -->
 <!-- <col class=xl24 width=64 span=9 style='width:48pt'> -->
 <%
     for (int l = 0; l < dt_day.Rows.Count; l++)
     { %>
 <col class=xl24 width=73 style='mso-width-source:userset;mso-width-alt:2669;
 width:55pt'>
 <%     } %>
 <tr height=37 style='mso-height-source:userset;height:27.75pt'>
  <td colspan="<%=5+day*4 %>" height=37 class=xl33 width=856 style='height:27.75pt;
  width:642pt'>WORKING TIME &amp; ABSENCE DETAILS</td>
  <td class=xl24 width=64 style='width:48pt'></td>
  <td class=xl24 width=64 style='width:48pt'></td>
  <td class=xl24 width=64 style='width:48pt'></td>
  <td class=xl24 width=64 style='width:48pt'></td>
  <td class=xl24 width=64 style='width:48pt'></td>
  <td class=xl24 width=73 style='width:55pt'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl24 style='height:15.0pt'></td>
  <td class=xl30>Month:<%=p_work_mon.Substring(4,2)%>/<%=p_work_mon.Substring(0,4) %></td>
  <td colspan=14 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=20 style='mso-height-source:userset;height:15.0pt'>
  <td height=20 class=xl24 style='height:15.0pt'></td>
  <td class=xl30>Reporter:<%=p_user %></td>
  <td colspan=14 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=17 style='height:12.75pt'>
  <td height=17 class=xl24 style='height:12.75pt'></td>
  <td class=xl30>Report Date:<%=DateTime.Now.ToString("dd-MM-yyyy") %></td>
  <td colspan=14 class=xl24 style='mso-ignore:colspan'></td>
 </tr>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td height=35 class=xl26 style='height:26.25pt'>NO</td>
  <td class=xl26 style='border-left:none'>ORGANIZATION</td>
  <td class=xl26 style='border-left:none'>WORK GROUP</td>
  <td class=xl26 style='border-left:none'>EMP ID</td>
  <td class=xl26 style='border-left:none'>FULL NAME</td>
 <!-- <td class=xl26 style='border-left:none'>Work Shift</td> -->
 <% for (int i = 0; i < dt_day.Rows.Count ; i++)
    { %>
  <td colspan=4 class=xl26 style='border-left:none'><%=dt_day.Rows[i][0].ToString() %></td>
  <%} %>
  <td colspan=6 class=xl28 style='border-left:none'>TOTAL</td>
 </tr>
 <tr class=xl25 height=26 style='mso-height-source:userset;height:19.5pt'>
  <td rowspan=2 height=89 class=xl27 width=39 style='height:66.75pt;border-top:
  none;width:29pt'>STT</td>
  <td rowspan=2 class=xl27 width=159 style='border-top:none;width:119pt'>Bộ
  phận</td>
  <td rowspan=2 class=xl27 width=159 style='border-top:none;width:119pt'>Nhóm</td>
  <td rowspan=2 class=xl27 width=70 style='border-top:none;width:53pt'>Mã NV</td>
  <td rowspan=2 class=xl27 width=173 style='border-top:none;width:130pt'>Họ và
  tên</td>
 <!-- <td rowspan=2 class=xl27 width=0 style='border-top:none'>Ca làm việc</td> -->
 <% for (int i = 0; i < dt_day.Rows.Count; i++)
    { %>
  <td class=xl26 style='border-top:none;border-left:none'>WT</td>
  <td class=xl26 style='border-top:none;border-left:none'>OT</td>
  <td class=xl26 style='border-top:none;border-left:none'>NT</td>
  <td class=xl26 style='border-top:none;border-left:none'>HT</td>
  <%} %>
  <td class=xl28 style='border-top:none;border-left:none'>WT</td>
  <td class=xl28 style='border-top:none;border-left:none'>OT</td>
  <td class=xl28 style='border-top:none;border-left:none'>NT</td>
  <td class=xl28 style='border-top:none;border-left:none'>ST</td>
  <td class=xl28 style='border-top:none;border-left:none'>HT</td>
  <td class=xl28 style='border-top:none;border-left:none'>ABS Pay</td>
 </tr>
 <tr class=xl25 height=63 style='height:47.25pt'>
 <% for (int i = 0; i < dt_day.Rows.Count; i++)
    { %>
  <td height=63 class=xl27 width=64 style='height:47.25pt;border-top:none;
  border-left:none;width:48pt'>Công</td>
  <td class=xl27 width=64 style='border-top:none;border-left:none;width:48pt'>Tăng
  ca</td>
  <td class=xl27 width=64 style='border-top:none;border-left:none;width:48pt'>Giờ
  đêm</td>
  <td class=xl27 width=64 style='border-top:none;border-left:none;width:48pt'>Ngày
  lễ</td>
  <%} %>
  <td class=xl29 width=64 style='border-top:none;border-left:none;width:48pt'>Công</td>
  <td class=xl29 width=64 style='border-top:none;border-left:none;width:48pt'>Tăng
  ca</td>
  <td class=xl29 width=64 style='border-top:none;border-left:none;width:48pt'>Giờ
  đêm</td>
  <td class=xl29 width=64 style='border-top:none;border-left:none;width:48pt'>Ngày
  chủ nhật</td>
  <td class=xl29 width=64 style='border-top:none;border-left:none;width:48pt'>Ngày
  lễ</td>
  <td class=xl29 width=73 style='border-top:none;border-left:none;width:55pt'>Vắng
  hưởng lương</td>
 </tr>
 <%
     for (int i = 0; i < dt_row; i++)
     {
  %>
 <tr height=24 style='height:18.0pt'>
  <td height=24 class=xl31 style='height:18.0pt;border-top:none' x:num><%=i+1 %></td>
  <td class=xl32 style='border-top:none;border-left:none'><%=dt_emp.Rows[i][0].ToString() %></td>
  <td class=xl32 style='border-top:none;border-left:none'><%=dt_emp.Rows[i][1].ToString() %></td>
  <td class=xl31 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][2].ToString() %></td>
  <td class=xl32 style='border-top:none;border-left:none'><%=dt_emp.Rows[i][3].ToString() %></td>
 <!-- <td class=xl31 style='border-top:none;border-left:none'>SSSSSSSS-SSSS-SSSS-SSSSS</td> -->
        <%
         int  k = 0;
         string style = "";

         for (int j = 0; j < dt_day.Rows.Count; j++)
         {
             if (int.Parse(dt_emp.Rows[i][128 + j].ToString()) == 1)//ngay le 
             {
                 style = "xl36";
             }
             else if (int.Parse(dt_emp.Rows[i][128 + j].ToString()) == 2)//ngay chu nhat
             {
                 style = "xl35";
             }
             else if (int.Parse(dt_emp.Rows[i][128 + j].ToString()) == 3) //ngay thuong
             {
                 style = "xl34";
             }/**/
             else if (int.Parse(dt_emp.Rows[i][128 + j].ToString()) == 0) //khong co lich(ko co lam viec)
             {
                 style = "xl37";
             }
            %>
  <td class="<%=style %>" style=" text-align:center" x:num><%=dt_emp.Rows[i][4 + j + k].ToString()%></td>
  <td class="<%=style %>" style=" text-align:center" x:num><%=dt_emp.Rows[i][5 + j + k].ToString()%></td>
  <td class="<%=style %>" style=" text-align:center" x:num><%=dt_emp.Rows[i][6 + j + k].ToString()%></td>
  <td class="<%=style %>" style=" text-align:center" x:num><%=dt_emp.Rows[i][7 + j + k].ToString()%></td>
        <%
            k += 3;
          }
        k = 0; %>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][191].ToString() %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][192].ToString() %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][193].ToString() %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][194].ToString() %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][195].ToString() %></td>
  <td class=xl34 style='border-top:none;border-left:none' x:num><%=dt_emp.Rows[i][196].ToString() %></td>
 </tr>
 <%} %>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>

 </tr>
 <![endif]>
</table>

</body>

</html>
