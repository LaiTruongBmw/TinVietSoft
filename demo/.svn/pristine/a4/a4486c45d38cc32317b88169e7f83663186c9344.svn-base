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

public partial class rpt_hrti00800_0 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //CtlLib.SetUser("hr");
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string p_user, p_tco_org_pk, p_wg, p_from, p_to;
        string p_thr_ws_pk, p_search, p_input, p_opt, p_opt_text, p_m1, p_m2, p_nation;


        p_tco_org_pk = Request["p_tco_org_pk"].ToString();
        p_wg = Request["p_wg"].ToString();
        p_from = Request["p_from"].ToString();
        p_to = Request["p_to"].ToString();
        p_thr_ws_pk = Request["p_thr_ws_pk"].ToString();
        p_input = Request["p_input"].ToString();
        p_user = Request["p_user"].ToString();
        p_opt = Request["p_opt"].ToString();
        p_opt_text = Request["p_opt_text"].ToString();
        p_m1 = Request["p_m1"].ToString();
        p_m2 = Request["p_m2"].ToString();
        p_nation = Request["p_nation"].ToString();
        string SQL;


        string TemplateFile = "rpt_hrti00800_0.xls";
        string TempFile = "../../../../system/temp/rpt_hrti00800_0_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;


        if (p_opt == "5")
        {
            SQL = "SELECT     TO_CHAR(SYSDATE,'DD/MM/YYYY') " +
            "            ,F.org_NM " +
            "            ,B.workgroup_NM " +
            "            ,A.EMP_ID " +
            "            ,A.FULL_NAME " +
            "            ,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD'),'DD/MM/YYYY') " +
            "            ,C.REMARK " +
            "            ,D.TIME_IN,D.TIME_OUT " +
            "            ,MAX(DECODE(D.HOL_TYPE, NULL, D.WT, '')) AS WT " +
			"            ,MAX(D.OT) AS OT " +
			"            ,MAX(D.NT) AS NT " +
			"            ,MAX(D.ONT) AS NT2 " +
			"            ,MAX(DECODE(D.HOL_TYPE, 'SUN', D.WT, '')) AS ST3 " +
			"            ,MAX(DECODE(D.HOL_TYPE,'HOL', D.WT, '')) AS HT " +
            "           ,(case when MAX(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK)) >=0 then NULL " +
            "       else " +
            "           ABS(MAX(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK))) " +
            "     END ) " +
            "        AS LATE_IN " +
            ",(case when MAX(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK)) >=0 then null " +
            "    else " +
            "        abs(MAX(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK))) " +
            "  end)   AS EARLY_OUT " +
            "            ,MAX(D.MOD_BYHAND_YN ) as by_hand " +
			"            ,MAX(D.MOD_BY) as mod_by " +            
            "            FROM THR_EMPLOYEE A,THR_work_group B, THR_WORK_SHIFT C,THR_WORK_DATE D,tco_org F " +
            "            WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND C.DEL_IF=0 AND D.DEL_IF=0 AND F.DEL_IF=0 " +
            "            AND A.THR_wg_PK=B.PK AND A.PK=D.THR_EMP_PK AND C.PK=D.THR_WS_PK AND A.TCO_org_PK=F.PK " +
            "            AND D.WORK_DT BETWEEN '" + p_from + "' AND  '" + p_to + "' " +
            "            AND DECODE('" + p_wg + "' ,'ALL', '" + p_wg + "',B.PK) =  '" + p_wg + "'" +
            "            AND DECODE('" + p_nation + "' ,'ALL', '" + p_nation + "',a.nation) =  '" + p_nation + "'" +
            "            AND DECODE('" + p_thr_ws_pk + "','ALL', '" + p_thr_ws_pk + "',C.PK)= '" + p_thr_ws_pk + "' ";
            SQL = SQL + "                   AND (    A.TCO_ORG_PK IN ( ";
            SQL = SQL + "                       SELECT     G.PK ";
            SQL = SQL + "                             FROM TCO_ORG G ";
            SQL = SQL + "                            WHERE G.DEL_IF = 0           ";
            SQL = SQL + "                       START WITH G.PK = ";
            SQL = SQL + "                                     DECODE ('" + p_tco_org_pk + "', ";
            SQL = SQL + "                                             'ALL', 0, ";
            SQL = SQL + "                                             '" + p_tco_org_pk + "' ";
            SQL = SQL + "                                            ) ";
            SQL = SQL + "                       CONNECT BY PRIOR G.PK = G.P_PK) ";
            SQL = SQL + "                 OR '" + p_tco_org_pk + "' = 'ALL') " +
            "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            "            GROUP BY F.org_NM,B.workGROUP_NM,D.WORK_DT,A.EMP_ID,A.FULL_NAME,C.REMARK,D.TIME_IN,D.TIME_OUT,D.WT " +
            "            ORDER BY F.org_NM,B.workGROUP_NM,D.WORK_DT,A.EMP_ID ";
        }
        else if (p_opt == "1")
        {
            SQL = "SELECT     TO_CHAR(SYSDATE,'DD/MM/YYYY') " +
            "            ,F.org_NM " +
            "            ,B.workgroup_NM " +
            "            ,A.EMP_ID " +
            "            ,A.FULL_NAME " +
            "            ,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD'),'DD/MM/YYYY') " +
            "            ,C.REMARK " +
            "            ,D.TIME_IN,D.TIME_OUT " +
            "            ,MAX(DECODE(D.HOL_TYPE, NULL, D.WT, '')) AS WT " +
			"            ,MAX(D.OT) AS OT " +
			"            ,MAX(D.NT) AS NT " +
			"            ,MAX(D.ONT) AS NT2 " +
			"            ,MAX(DECODE(D.HOL_TYPE, 'SUN', D.WT, '')) AS ST3 " +
			"            ,MAX(DECODE(D.HOL_TYPE,'HOL', D.WT, '')) AS HT " +
            "           ,(case when MAX(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK)) >=0 then NULL " +
            "       else " +
            "           ABS(MAX(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK))) " +
            "     END ) " +
            "        AS LATE_IN " +
            ",(case when MAX(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK)) >=0 then null " +
            "    else " +
            "        abs(MAX(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK))) " +
            "  end)   AS EARLY_OUT " +
            "            ,MAX(D.MOD_BYHAND_YN ) as by_hand " +
			"            ,MAX(D.MOD_BY) as mod_by " +            
            "            FROM THR_EMPLOYEE A,THR_work_group B, THR_WORK_SHIFT C,THR_WORK_DATE D,tco_org F " +
            "            WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND C.DEL_IF=0 AND D.DEL_IF=0 AND F.DEL_IF=0 " +
            "            AND A.THR_wg_PK=B.PK AND A.PK=D.THR_EMP_PK AND C.PK=D.THR_WS_PK AND A.TCO_org_PK=F.PK " +
            "            AND D.WORK_DT BETWEEN '" + p_from + "' AND  '" + p_to + "' " +
            "            AND DECODE('" + p_wg + "' ,'ALL', '" + p_wg + "',B.PK) =  '" + p_wg + "'" +
            "            AND DECODE('" + p_nation + "' ,'ALL', '" + p_nation + "',a.nation) =  '" + p_nation + "'" +
            "            AND DECODE('" + p_thr_ws_pk + "','ALL', '" + p_thr_ws_pk + "',C.PK)= '" + p_thr_ws_pk + "' ";
            SQL = SQL + "                   AND (    A.TCO_ORG_PK IN ( ";
            SQL = SQL + "                       SELECT     G.PK ";
            SQL = SQL + "                             FROM TCO_ORG G ";
            SQL = SQL + "                            WHERE G.DEL_IF = 0           ";
            SQL = SQL + "                       START WITH G.PK = ";
            SQL = SQL + "                                     DECODE ('" + p_tco_org_pk + "', ";
            SQL = SQL + "                                             'ALL', 0, ";
            SQL = SQL + "                                             '" + p_tco_org_pk + "' ";
            SQL = SQL + "                                            ) ";
            SQL = SQL + "                       CONNECT BY PRIOR G.PK = G.P_PK) ";
            SQL = SQL + "                 OR '" + p_tco_org_pk + "' = 'ALL') " +
            "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            "            AND (D.TIME_IN IS NULL OR D.TIME_OUT IS NULL)          " +
            "            GROUP BY F.org_NM,B.workGROUP_NM,D.WORK_DT,A.EMP_ID,A.FULL_NAME,C.REMARK,D.TIME_IN,D.TIME_OUT,D.WT " +
            "            ORDER BY F.org_NM,B.workGROUP_NM,D.WORK_DT,A.EMP_ID ";
        }
        else if (p_opt == "2")
        {
            SQL = "SELECT     TO_CHAR(SYSDATE,'DD/MM/YYYY') " +
            "            ,F.org_NM " +
            "            ,B.workgroup_NM " +
            "            ,A.EMP_ID " +
            "            ,A.FULL_NAME " +
            "            ,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD'),'DD/MM/YYYY') " +
            "            ,C.REMARK " +
            "            ,D.TIME_IN,D.TIME_OUT " +
            "            ,MAX(DECODE(D.HOL_TYPE, NULL, D.WT, '')) AS WT " +
			"            ,MAX(D.OT) AS OT " +
			"            ,MAX(D.NT) AS NT " +
			"            ,MAX(D.ONT) AS NT2 " +
			"            ,MAX(DECODE(D.HOL_TYPE, 'SUN', D.WT, '')) AS ST3 " +
			"            ,MAX(DECODE(D.HOL_TYPE,'HOL', D.WT, '')) AS HT " +
            "           ,(case when MAX(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK)) >=0 then NULL " +
            "       else " +
            "           ABS(MAX(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK))) " +
            "     END ) " +
            "        AS LATE_IN " +
            ",(case when MAX(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK)) >=0 then null " +
            "    else " +
            "        abs(MAX(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK))) " +
            "  end)   AS EARLY_OUT " +
            "            ,MAX(D.MOD_BYHAND_YN ) as by_hand " +
			"            ,MAX(D.MOD_BY) as mod_by " +            
            "            FROM THR_EMPLOYEE A,THR_work_group B, THR_WORK_SHIFT C,THR_WORK_DATE D,tco_org F " +
            "            WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND C.DEL_IF=0 AND D.DEL_IF=0 AND F.DEL_IF=0 " +
            "            AND A.THR_wg_PK=B.PK AND A.PK=D.THR_EMP_PK AND C.PK=D.THR_WS_PK AND A.TCO_org_PK=F.PK " +
            "            AND D.WORK_DT BETWEEN '" + p_from + "' AND  '" + p_to + "' " +
            "            AND DECODE('" + p_wg + "' ,'ALL', '" + p_wg + "',B.PK) =  '" + p_wg + "'" +
            "            AND DECODE('" + p_nation + "' ,'ALL', '" + p_nation + "',a.nation) =  '" + p_nation + "'" +
            "            AND DECODE('" + p_thr_ws_pk + "','ALL', '" + p_thr_ws_pk + "',C.PK)= '" + p_thr_ws_pk + "' ";
            SQL = SQL + "                   AND (    A.TCO_ORG_PK IN ( ";
            SQL = SQL + "                       SELECT     G.PK ";
            SQL = SQL + "                             FROM TCO_ORG G ";
            SQL = SQL + "                            WHERE G.DEL_IF = 0           ";
            SQL = SQL + "                       START WITH G.PK = ";
            SQL = SQL + "                                     DECODE ('" + p_tco_org_pk + "', ";
            SQL = SQL + "                                             'ALL', 0, ";
            SQL = SQL + "                                             '" + p_tco_org_pk + "' ";
            SQL = SQL + "                                            ) ";
            SQL = SQL + "                       CONNECT BY PRIOR G.PK = G.P_PK) ";
            SQL = SQL + "                 OR '" + p_tco_org_pk + "' = 'ALL') " +
            "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            "           AND (HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK) < 0  )  " +
            "       AND (Abs(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK)) >= '" + p_m1 + "' OR '" + p_m1 + "' is null) " +
            "       AND (Abs(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK)) <= '" + p_m2 + "' OR '" + p_m2 + "' is null) " +
            "            GROUP BY F.ORG_NM,B.WORKGROUP_NM,D.WORK_DT,A.EMP_ID,A.FULL_NAME,C.REMARK,D.TIME_IN,D.TIME_OUT,D.WT " +
            "            ORDER BY F.ORG_NM,B.WORKGROUP_NM,D.WORK_DT,A.EMP_ID ";


        }
        else if (p_opt == "3")
        {
            SQL = "SELECT     TO_CHAR(SYSDATE,'DD/MM/YYYY') " +
            "            ,F.org_NM " +
            "            ,B.workgroup_NM " +
            "            ,A.EMP_ID " +
            "            ,A.FULL_NAME " +
            "            ,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD'),'DD/MM/YYYY') " +
            "            ,C.REMARK " +
            "            ,D.TIME_IN,D.TIME_OUT " +
            "            ,MAX(DECODE(D.HOL_TYPE, NULL, D.WT, '')) AS WT " +
			"            ,MAX(D.OT) AS OT " +
			"            ,MAX(D.NT) AS NT " +
			"            ,MAX(D.ONT) AS NT2 " +
			"            ,MAX(DECODE(D.HOL_TYPE, 'SUN', D.WT, '')) AS ST3 " +
			"            ,MAX(DECODE(D.HOL_TYPE,'HOL', D.WT, '')) AS HT " +
            "           ,(case when MAX(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK)) >=0 then NULL " +
            "       else " +
            "           ABS(MAX(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK))) " +
            "     END ) " +
            "        AS LATE_IN " +
            ",(case when MAX(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK)) >=0 then null " +
            "    else " +
            "        abs(MAX(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK))) " +
            "  end)   AS EARLY_OUT " +
            "            ,MAX(D.MOD_BYHAND_YN ) as by_hand " +
			"            ,MAX(D.MOD_BY) as mod_by " +            
            "            FROM THR_EMPLOYEE A,THR_work_group B, THR_WORK_SHIFT C,THR_WORK_DATE D,tco_org F " +
            "            WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND C.DEL_IF=0 AND D.DEL_IF=0 AND F.DEL_IF=0 " +
            "            AND A.THR_wg_PK=B.PK AND A.PK=D.THR_EMP_PK AND C.PK=D.THR_WS_PK AND A.TCO_org_PK=F.PK " +
            "            AND D.WORK_DT BETWEEN '" + p_from + "' AND  '" + p_to + "' " +
            "            AND DECODE('" + p_wg + "' ,'ALL', '" + p_wg + "',B.PK) =  '" + p_wg + "'" +
            "            AND DECODE('" + p_nation + "' ,'ALL', '" + p_nation + "',a.nation) =  '" + p_nation + "'" +
            "            AND DECODE('" + p_thr_ws_pk + "','ALL', '" + p_thr_ws_pk + "',C.PK)= '" + p_thr_ws_pk + "' ";
            SQL = SQL + "                   AND (    A.TCO_ORG_PK IN ( ";
            SQL = SQL + "                       SELECT     G.PK ";
            SQL = SQL + "                             FROM TCO_ORG G ";
            SQL = SQL + "                            WHERE G.DEL_IF = 0           ";
            SQL = SQL + "                       START WITH G.PK = ";
            SQL = SQL + "                                     DECODE ('" + p_tco_org_pk + "', ";
            SQL = SQL + "                                             'ALL', 0, ";
            SQL = SQL + "                                             '" + p_tco_org_pk + "' ";
            SQL = SQL + "                                            ) ";
            SQL = SQL + "                       CONNECT BY PRIOR G.PK = G.P_PK) ";
            SQL = SQL + "                 OR '" + p_tco_org_pk + "' = 'ALL') " +
            "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            "              AND (HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK) < 0 )             " +
            "       AND (Abs(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK)) >= '" + p_m1 + "' OR '" + p_m1 + "' is null) " +
            "       AND (Abs(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK)) <= '" + p_m2 + "' OR '" + p_m2 + "' is null) " +
            "            GROUP BY F.ORG_NM,B.WORKGROUP_NM,D.WORK_DT,A.EMP_ID,A.FULL_NAME,C.REMARK,D.TIME_IN,D.TIME_OUT,D.WT " +
            "            ORDER BY F.ORG_NM,B.WORKGROUP_NM,D.WORK_DT,A.EMP_ID ";
        }
        else if (p_opt == "4")
        {
            SQL = "SELECT     TO_CHAR(SYSDATE,'DD/MM/YYYY') " +
            "            ,F.org_NM " +
            "            ,B.workgroup_NM " +
            "            ,A.EMP_ID " +
            "            ,A.FULL_NAME " +
            "            ,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD'),'DD/MM/YYYY') " +
            "            ,C.REMARK " +
            "            ,D.TIME_IN,D.TIME_OUT " +
            "            ,MAX(DECODE(D.HOL_TYPE, NULL, D.WT, '')) AS WT " +
			"            ,MAX(D.OT) AS OT " +
			"            ,MAX(D.NT) AS NT " +
			"            ,MAX(D.ONT) AS NT2 " +
			"            ,MAX(DECODE(D.HOL_TYPE, 'SUN', D.WT, '')) AS ST3 " +
			"            ,MAX(DECODE(D.HOL_TYPE,'HOL', D.WT, '')) AS HT " +
            "           ,(case when MAX(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK)) >=0 then NULL " +
            "       else " +
            "           ABS(MAX(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK))) " +
            "     END ) " +
            "        AS LATE_IN " +
            ",(case when MAX(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK)) >=0 then null " +
            "    else " +
            "        abs(MAX(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK))) " +
            "  end)   AS EARLY_OUT " +
            "            ,MAX(D.MOD_BYHAND_YN ) as by_hand " +
			"            ,MAX(D.MOD_BY) as mod_by " +            
            "            FROM THR_EMPLOYEE A,THR_work_group B, THR_WORK_SHIFT C,THR_WORK_DATE D,tco_org F " +
            "            WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND C.DEL_IF=0 AND D.DEL_IF=0 AND F.DEL_IF=0 " +
            "            AND A.THR_wg_PK=B.PK AND A.PK=D.THR_EMP_PK AND C.PK=D.THR_WS_PK AND A.TCO_org_PK=F.PK " +
            "            AND D.WORK_DT BETWEEN '" + p_from + "' AND  '" + p_to + "' " +
            "            AND DECODE('" + p_wg + "' ,'ALL', '" + p_wg + "',B.PK) =  '" + p_wg + "'" +
            "            AND DECODE('" + p_nation + "' ,'ALL', '" + p_nation + "',a.nation) =  '" + p_nation + "'" +
            "            AND DECODE('" + p_thr_ws_pk + "','ALL', '" + p_thr_ws_pk + "',C.PK)= '" + p_thr_ws_pk + "' ";
            SQL = SQL + "                   AND (    A.TCO_ORG_PK IN ( ";
            SQL = SQL + "                       SELECT     G.PK ";
            SQL = SQL + "                             FROM TCO_ORG G ";
            SQL = SQL + "                            WHERE G.DEL_IF = 0           ";
            SQL = SQL + "                       START WITH G.PK = ";
            SQL = SQL + "                                     DECODE ('" + p_tco_org_pk + "', ";
            SQL = SQL + "                                             'ALL', 0, ";
            SQL = SQL + "                                             '" + p_tco_org_pk + "' ";
            SQL = SQL + "                                            ) ";
            SQL = SQL + "                       CONNECT BY PRIOR G.PK = G.P_PK) ";
            SQL = SQL + "                 OR '" + p_tco_org_pk + "' = 'ALL') " +
            "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            "		AND (NVL(D.MOD_BYHAND_YN,'N')='Y' ) " +
            "            GROUP BY F.ORG_NM,B.WORKGROUP_NM,D.WORK_DT,A.EMP_ID,A.FULL_NAME,C.REMARK,D.TIME_IN,D.TIME_OUT,D.WT " +
            "            ORDER BY F.ORG_NM,B.WORKGROUP_NM,D.WORK_DT,A.EMP_ID ";
        }
/*		OR NVL(E.MOD_BYHAND_YN,'N')='Y' " +
            "        OR NVL(D.MOD_AUTO_YN,'N')='Y' OR NVL(E.MOD_AUTO_YN,'N')='Y'*/
        else if (p_opt == "6")
        {
            SQL = "SELECT     TO_CHAR(SYSDATE,'DD/MM/YYYY') " +
            "            ,F.org_NM " +
            "            ,B.workgroup_NM " +
            "            ,A.EMP_ID " +
            "            ,A.FULL_NAME " +
            "            ,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD'),'DD/MM/YYYY') " +
            "            ,C.REMARK " +
            "            ,D.TIME_IN,D.TIME_OUT " +
            "            ,MAX(DECODE(D.HOL_TYPE, NULL, D.WT, '')) AS WT " +
			"            ,MAX(D.OT) AS OT " +
			"            ,MAX(D.NT) AS NT " +
			"            ,MAX(D.ONT) AS NT2 " +
			"            ,MAX(DECODE(D.HOL_TYPE, 'SUN', D.WT, '')) AS ST3 " +
			"            ,MAX(DECODE(D.HOL_TYPE,'HOL', D.WT, '')) AS HT " +
            "           ,(case when MAX(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK)) >=0 then NULL " +
            "       else " +
            "           ABS(MAX(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK))) " +
            "     END ) " +
            "        AS LATE_IN " +
            ",(case when MAX(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK)) >=0 then null " +
            "    else " +
            "        abs(MAX(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK))) " +
            "  end)   AS EARLY_OUT " +
            "            ,MAX(D.MOD_BYHAND_YN ) as by_hand " +
			"            ,MAX(D.MOD_BY) as mod_by " +            
            "            FROM THR_EMPLOYEE A,THR_work_group B, THR_WORK_SHIFT C,THR_WORK_DATE D,tco_org F " +
            "            WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND C.DEL_IF=0 AND D.DEL_IF=0 AND F.DEL_IF=0 " +
            "            AND A.THR_wg_PK=B.PK AND A.PK=D.THR_EMP_PK AND C.PK=D.THR_WS_PK AND A.TCO_org_PK=F.PK " +
            "            AND D.WORK_DT BETWEEN '" + p_from + "' AND  '" + p_to + "' " +
            "            AND DECODE('" + p_wg + "' ,'ALL', '" + p_wg + "',B.PK) =  '" + p_wg + "'" +
            "            AND DECODE('" + p_nation + "' ,'ALL', '" + p_nation + "',a.nation) =  '" + p_nation + "'" +
            "            AND DECODE('" + p_thr_ws_pk + "','ALL', '" + p_thr_ws_pk + "',C.PK)= '" + p_thr_ws_pk + "' ";
            SQL = SQL + "                   AND (    A.TCO_ORG_PK IN ( ";
            SQL = SQL + "                       SELECT     G.PK ";
            SQL = SQL + "                             FROM TCO_ORG G ";
            SQL = SQL + "                            WHERE G.DEL_IF = 0           ";
            SQL = SQL + "                       START WITH G.PK = ";
            SQL = SQL + "                                     DECODE ('" + p_tco_org_pk + "', ";
            SQL = SQL + "                                             'ALL', 0, ";
            SQL = SQL + "                                             '" + p_tco_org_pk + "' ";
            SQL = SQL + "                                            ) ";
            SQL = SQL + "                       CONNECT BY PRIOR G.PK = G.P_PK) ";
            SQL = SQL + "                 OR '" + p_tco_org_pk + "' = 'ALL') " +
            "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            " AND (HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK) < 0  " +
            "or HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK) < 0 ) " +
            "AND ( ( " +
            "(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK) < 0  and (abs(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK)) >= '" + p_m1 + "' OR  '" + p_m1 + "'  is null) " +
            "AND (abs(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK)) <= '" + p_m2 + "' OR '" + p_m2 + "'  is null)) " +
            ") or (  " +
            "HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK)  < 0  and  (abs(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK)) >=  '" + p_m1 + "'  OR  '" + p_m1 + "'  is null) " +
            "AND (abs(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK)) <=  '" + p_m2 + "'  OR  '" + p_m2 + "'  is null) " +
            ")) " +
            "            GROUP BY F.ORG_NM,B.WORKGROUP_NM,D.WORK_DT,A.EMP_ID,A.FULL_NAME,C.REMARK,D.TIME_IN,D.TIME_OUT,D.WT " +
            "            ORDER BY F.ORG_NM,B.WORKGROUP_NM,D.WORK_DT,A.EMP_ID ";
        }
        else if (p_opt == "7")
        {
            SQL = "SELECT     TO_CHAR(SYSDATE,'DD/MM/YYYY') " +
            "            ,F.org_NM " +
            "            ,B.workgroup_NM " +
            "            ,A.EMP_ID " +
            "            ,A.FULL_NAME " +
            "            ,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD'),'DD/MM/YYYY') " +
            "            ,C.REMARK " +
            "            ,D.TIME_IN,D.TIME_OUT " +
            "            ,MAX(DECODE(D.HOL_TYPE, NULL, D.WT, '')) AS WT " +
			"            ,MAX(D.OT) AS OT " +
			"            ,MAX(D.NT) AS NT " +
			"            ,MAX(D.ONT) AS NT2 " +
			"            ,MAX(DECODE(D.HOL_TYPE, 'SUN', D.WT, '')) AS ST3 " +
			"            ,MAX(DECODE(D.HOL_TYPE,'HOL', D.WT, '')) AS HT " +
            "           ,(case when MAX(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK)) >=0 then NULL " +
            "       else " +
            "           ABS(MAX(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK))) " +
            "     END ) " +
            "        AS LATE_IN " +
            ",(case when MAX(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK)) >=0 then null " +
            "    else " +
            "        abs(MAX(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK))) " +
            "  end)   AS EARLY_OUT " +
            "            ,MAX(D.MOD_BYHAND_YN ) as by_hand " +
			"            ,MAX(D.MOD_BY) as mod_by " +            
            "            FROM THR_EMPLOYEE A,THR_work_group B, THR_WORK_SHIFT C,THR_WORK_DATE D,tco_org F " +
            "            WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND C.DEL_IF=0 AND D.DEL_IF=0 AND F.DEL_IF=0 " +
            "            AND A.THR_wg_PK=B.PK AND A.PK=D.THR_EMP_PK AND C.PK=D.THR_WS_PK AND A.TCO_org_PK=F.PK " +
            "            AND D.WORK_DT BETWEEN '" + p_from + "' AND  '" + p_to + "' " +
            "            AND DECODE('" + p_wg + "' ,'ALL', '" + p_wg + "',B.PK) =  '" + p_wg + "'" +
            "            AND DECODE('" + p_nation + "' ,'ALL', '" + p_nation + "',a.nation) =  '" + p_nation + "'" +
            "            AND DECODE('" + p_thr_ws_pk + "','ALL', '" + p_thr_ws_pk + "',C.PK)= '" + p_thr_ws_pk + "' ";
            SQL = SQL + "                   AND (    A.TCO_ORG_PK IN ( ";
            SQL = SQL + "                       SELECT     G.PK ";
            SQL = SQL + "                             FROM TCO_ORG G ";
            SQL = SQL + "                            WHERE G.DEL_IF = 0           ";
            SQL = SQL + "                       START WITH G.PK = ";
            SQL = SQL + "                                     DECODE ('" + p_tco_org_pk + "', ";
            SQL = SQL + "                                             'ALL', 0, ";
            SQL = SQL + "                                             '" + p_tco_org_pk + "' ";
            SQL = SQL + "                                            ) ";
            SQL = SQL + "                       CONNECT BY PRIOR G.PK = G.P_PK) ";
            SQL = SQL + "                 OR '" + p_tco_org_pk + "' = 'ALL') " +
            "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            "           AND D.TIME_IN IS NOT NULL  " +
            "    AND D.TIME_IN BETWEEN NVL('" + p_m1 + "',D.TIME_IN) AND NVL('" + p_m2 + "',D.TIME_IN)" +
            "            GROUP BY F.ORG_NM,B.WORKGROUP_NM,D.WORK_DT,A.EMP_ID,A.FULL_NAME,C.REMARK,D.TIME_IN,D.TIME_OUT,D.WT " +
            "            ORDER BY F.ORG_NM,B.WORKGROUP_NM,D.WORK_DT,A.EMP_ID ";
        }
        else //if (p_opt=="8")   
        {
            SQL = "SELECT     TO_CHAR(SYSDATE,'DD/MM/YYYY') " +
            "            ,F.org_NM " +
            "            ,B.workgroup_NM " +
            "            ,A.EMP_ID " +
            "            ,A.FULL_NAME " +
            "            ,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD'),'DD/MM/YYYY') " +
            "            ,C.REMARK " +
            "            ,D.TIME_IN,D.TIME_OUT " +
            "            ,MAX(DECODE(D.HOL_TYPE, NULL, D.WT, '')) AS WT " +
			"            ,MAX(D.OT) AS OT " +
			"            ,MAX(D.NT) AS NT " +
			"            ,MAX(D.ONT) AS NT2 " +
			"            ,MAX(DECODE(D.HOL_TYPE, 'SUN', D.WT, '')) AS ST3 " +
			"            ,MAX(DECODE(D.HOL_TYPE,'HOL', D.WT, '')) AS HT " +
            "           ,(case when MAX(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK)) >=0 then NULL " +
            "       else " +
            "           ABS(MAX(HR_LATELY_EARLY(D.WORK_DT,C.START_TIME,D.DATE_IN,D.TIME_IN,'IN',A.PK))) " +
            "     END ) " +
            "        AS LATE_IN " +
            ",(case when MAX(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK)) >=0 then null " +
            "    else " +
            "        abs(MAX(HR_LATELY_EARLY(D.DATE_OUT,D.TIME_OUT,DECODE(C.DURING_DAY,1,D.WORK_DT,TO_CHAR(TO_DATE(D.WORK_DT,'YYYYMMDD')+1,'YYYYMMDD')),C.END_TIME,'OUT',A.PK))) " +
            "  end)   AS EARLY_OUT " +
            "            ,MAX(D.MOD_BYHAND_YN ) as by_hand " +
			"            ,MAX(D.MOD_BY) as mod_by " +            
            "            FROM THR_EMPLOYEE A,THR_work_group B, THR_WORK_SHIFT C,THR_WORK_DATE D,tco_org F " +
            "            WHERE A.DEL_IF=0 AND B.DEL_IF=0 AND C.DEL_IF=0 AND D.DEL_IF=0 AND F.DEL_IF=0 " +
            "            AND A.THR_wg_PK=B.PK AND A.PK=D.THR_EMP_PK AND C.PK=D.THR_WS_PK AND A.TCO_org_PK=F.PK " +
            "            AND D.WORK_DT BETWEEN '" + p_from + "' AND  '" + p_to + "' " +
            "            AND DECODE('" + p_wg + "' ,'ALL', '" + p_wg + "',B.PK) =  '" + p_wg + "'" +
            "            AND DECODE('" + p_nation + "' ,'ALL', '" + p_nation + "',a.nation) =  '" + p_nation + "'" +
            "            AND DECODE('" + p_thr_ws_pk + "','ALL', '" + p_thr_ws_pk + "',C.PK)= '" + p_thr_ws_pk + "' ";
            SQL = SQL + "                   AND (    A.TCO_ORG_PK IN ( ";
            SQL = SQL + "                       SELECT     G.PK ";
            SQL = SQL + "                             FROM TCO_ORG G ";
            SQL = SQL + "                            WHERE G.DEL_IF = 0           ";
            SQL = SQL + "                       START WITH G.PK = ";
            SQL = SQL + "                                     DECODE ('" + p_tco_org_pk + "', ";
            SQL = SQL + "                                             'ALL', 0, ";
            SQL = SQL + "                                             '" + p_tco_org_pk + "' ";
            SQL = SQL + "                                            ) ";
            SQL = SQL + "                       CONNECT BY PRIOR G.PK = G.P_PK) ";
            SQL = SQL + "                 OR '" + p_tco_org_pk + "' = 'ALL') " +
            "              AND ('" + p_input + "' IS NULL  " +
            "                     OR  (UPPER(A.EMP_ID) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.OLD_ID ) LIKE  '%' || UPPER('" + p_input + "')|| '%') " +
            "                     OR  (UPPER(A.FULL_NAME) LIKE  '%' || UPPER('" + p_input + "')|| '%')) " +
            "           AND D.TIME_OUT IS NOT NULL  " +
            "    AND D.TIME_OUT BETWEEN NVL('" + p_m1 + "',D.TIME_OUT) AND NVL('" + p_m2 + "',D.TIME_OUT)" +
            "            GROUP BY F.ORG_NM,B.WORKGROUP_NM,D.WORK_DT,A.EMP_ID,A.FULL_NAME,C.REMARK,D.TIME_IN,D.TIME_OUT,D.WT " +
            "            ORDER BY F.ORG_NM,B.WORKGROUP_NM,D.WORK_DT,A.EMP_ID ";

        } 


        //----------------------------------

        
        //Response.Write(SQL);
        //Response.End();
        DataTable dt_total = CtlLib.TableReadOpen(SQL);
        int irow,icol;
        irow = dt_total.Rows.Count;
        icol = dt_total.Columns.Count;
        if (irow == 0)
        {
            Response.Write("There is no data");
            Response.End();
        }

        exSheet.Cells[1, 1].Value = "TIME SUMMARY ";
        exSheet.Cells[2, 2].Value = "Work date: ";        
        exSheet.Cells[2, 3].Value = p_from.Substring(6,2) + "/" + p_from.Substring(4,2) + "/" + p_from.Substring(0,4);
        exSheet.Cells[2, 4].Value = "~";
        exSheet.Cells[2, 5].Value = p_to.Substring(6, 2) + "/" + p_to.Substring(4, 2) + "/" + p_to.Substring(0, 4);
       
        exSheet.Cells[2, 9].Value = "Reporter";
        exSheet.Cells[2, 11].Value = p_user;
        exSheet.Cells[3, 9].Value = "Report Date";
         exSheet.Cells[3, 11].Value = dt_total.Rows[0][0].ToString();

        if (p_opt != "5")
            Response.Write("Option:   ");
        if (p_opt != "5")
            Response.Write(p_opt_text);

        int i;
        int row_pos = 8;

        //insert row
        for (i = 0; i < irow - 1; i++)
        {

            exSheet.Range[row_pos + i, 1].Rows.EntireRow.Insert();
        }

       // exSheet.Range[row_pos, 1, row_pos, 18].Borders[XlBordersIndex.xlEdgeTop].LineStyle = XlLineStyle.xlContinuous;
        //exSheet.Range[row_pos + irow , 1, row_pos + irow , 18].Borders[XlBordersIndex.xlEdgeTop].LineStyle = XlLineStyle.xlContinuous;

        //show data
        row_pos = 7;
        for (i = 0; i < irow; i++)
        {
            exSheet.Cells[row_pos + i, 1].Value = i + 1;
            for (int j = 1; j < icol ; j++)
            {
                //if (j >= 9 && j < 14)
                //{                        
                //    exSheet.Cells[row_pos + i, j + 1].Value = Double.Parse(dt_total.Rows[i][j].ToString());                    
                //}
                //else
                //{

                    if (IsNumeric(dt_total.Rows[i][j].ToString()))
                    {
                        exSheet.Cells[row_pos + i, j + 1].Value = Double.Parse(dt_total.Rows[i][j].ToString()); 
                    }
                    else
                    {
                        exSheet.Cells[row_pos + i, j + 1].Value = dt_total.Rows[i][j].ToString();
                    }
               // }
            }
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