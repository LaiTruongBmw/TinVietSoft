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


public partial class reports_ch_rm_rpt_chrm00020_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string p_dept_pk, p_work_mon, p_from_dt, p_to_dt, p_nation, p_group_pk, p_meal_emp_type;

        p_dept_pk = Request["l_tco_dept_pk"].ToString();
        p_group_pk = Request["l_thr_group_pk"].ToString();
        p_work_mon = Request["l_work_mon"].ToString();
        p_to_dt = Request["l_to_dt"].ToString();
        p_from_dt = Request["l_from_dt"].ToString();
        p_meal_emp_type = Request["l_meal_emp_type"].ToString();

        string TemplateFile = "rpt_chrm00020_2.xls";
        string TempFile = "../../../../system/temp/rpt_chrm00020_2_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];
        
        string SQL_CODE
        = "SELECT MAX(CASE WHEN NUM_1 = 1 THEN NVL(NUM_2,0) ELSE 0 END) " +
        "          ,MAX(CASE WHEN NUM_1 = 2 THEN NVL(NUM_2,0) ELSE 0 END) " +
        "    FROM vhr_hr_code c " +
        "   WHERE id = 'HR0191' ";

        DataTable dt_hr_code = CtlLib.TableReadOpen(SQL_CODE);

        double meal_main_amt = double.Parse(dt_hr_code.Rows[0][0].ToString());
        double snack_time_amt = double.Parse(dt_hr_code.Rows[0][1].ToString());

        int ncal = int.Parse(p_to_dt.Substring(6,2).ToString()) - int.Parse(p_from_dt.Substring(6,2).ToString()) + 1;
        int i;

        //======================================================================================================================
        string SQL_1
        = "  SELECT 1 seq,'',MAX((    SELECT g.ORG_NM  " +
        "              FROM TCO_ORG g  " +
        "             WHERE g.del_if = 0 AND G.ORG_TYPE = '06'  " +
        "        START WITH g.pk = b.pk  " +
        "        CONNECT BY PRIOR g.p_pk = g.pk)) div_nm " +
        "         ,B.ORG_NM org_nm " +
        "         ,C.WORKGROUP_NM group_nm " +
        "         ,D.EMP_ID EMP_ID " +
        "         ,D.FULL_NAME " +
        "         ,TO_CHAR (TO_DATE (D.JOIN_DT, 'yyyymmdd'), 'dd/mm/yyyy') join_dt " +
        "         ,SUM (CASE WHEN F.WORK_DT_OF_SHIFT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN 1 ELSE 0 END ELSE 0 END) MEAL_MAIN_QTY " +
        "         ,SUM (CASE WHEN F.WORK_DT_OF_SHIFT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN 1 ELSE 0 END * " + meal_main_amt + " ELSE 0 END) MEAL_MAIN_AMT " +
        "         ,SUM (CASE WHEN F.WORK_DT_OF_SHIFT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN 1 ELSE 0 END ELSE 0 END)  SNACK_TIME_QTY " +
        "         ,SUM (CASE WHEN F.WORK_DT_OF_SHIFT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN 1 ELSE 0 END * " + snack_time_amt + " ELSE 0 END) SNACK_TIME_AMT ";
        for (i = 1; i < ncal; i++)
        {
            SQL_1 = SQL_1 + "         ,SUM (CASE WHEN F.WORK_DT_OF_SHIFT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN 1 ELSE 0 END ELSE 0 END) MEAL_MAIN_QTY " +
                                "         ,SUM (CASE WHEN F.WORK_DT_OF_SHIFT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN 1 ELSE 0 END * " + meal_main_amt + " ELSE 0 END) MEAL_MAIN_AMT " +
                                "         ,SUM (CASE WHEN F.WORK_DT_OF_SHIFT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN 1 ELSE 0 END ELSE 0 END)  SNACK_TIME_QTY " +
                                "         ,SUM (CASE WHEN F.WORK_DT_OF_SHIFT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN 1 ELSE 0 END * " + snack_time_amt + " ELSE 0 END) SNACK_TIME_AMT ";
        }

        SQL_1 = SQL_1 + "    FROM THR_MEAL_CHECKING F, TCO_ORG B, THR_WORK_GROUP C, THR_EMPLOYEE D " +
        "   WHERE  F.DEL_IF = 0 AND B.DEL_IF = 0 AND C.DEL_IF =0 AND D.DEL_IF =0  " +
        "         AND F.THR_EMP_PK = d.pk " +
        "         AND F.TCO_ORG_PK = b.pk " +
        "         and D.THR_WG_PK = c.pk  " +
        "         AND F.WORK_DT_OF_SHIFT BETWEEN '" + p_from_dt + "' AND '" + p_to_dt + "' " +
        "         AND F.MEAL_TIMES IS NOT NULL " +
        "         AND F.MEAL_EMP_TYPE = 'IN' " +
        "         AND DECODE ('" + p_group_pk + "', 'ALL', 'ALL', D.THR_WG_PK) = '" + p_group_pk + "'  " +
        "         AND D.TCO_ORG_PK IN  " +
        "              (    SELECT g.pk  " +
        "                     FROM TCO_ORG g  " +
        "                    WHERE g.del_if = 0  " +
        "               START WITH g.pk =  " +
        "                             CASE  " +
        "                                WHEN '" + p_dept_pk + "' = 'ALL' THEN g.pk  " +
        "                                ELSE TO_NUMBER ('" + p_dept_pk + "')  " +
        "                             END  " +
        "               CONNECT BY PRIOR g.pk = g.p_pk)  " +
        "     GROUP BY D.EMP_ID,B.ORG_NM,C.WORKGROUP_NM,D.FULL_NAME,D.JOIN_DT " +
        " ORDER BY seq,div_nm,org_nm,EMP_ID     ";

        //======================================================================================================================
        string SQL_2
        = "  SELECT 2 seq,'','' div_nm " +
        "         ,'' org_nm " +
        "         ,'' group_nm " +
        "         ,F.EMP_ID EMP_ID " +
        "         ,F.FULL_NAME " +
        "         ,'' join_dt " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN 1 ELSE 0 END ELSE 0 END) MEAL_MAIN_QTY " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN 1 ELSE 0 END * " + meal_main_amt + " ELSE 0 END) MEAL_MAIN_AMT " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN 1 ELSE 0 END ELSE 0 END)  SNACK_TIME_QTY " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN 1 ELSE 0 END * " + snack_time_amt + " ELSE 0 END) SNACK_TIME_AMT ";
        for (i = 1; i < ncal; i++)
        {
            SQL_2 = SQL_2 + "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN 1 ELSE 0 END ELSE 0 END) MEAL_MAIN_QTY " +
                                "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN 1 ELSE 0 END * " + meal_main_amt + " ELSE 0 END) MEAL_MAIN_AMT " +
                                "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN 1 ELSE 0 END ELSE 0 END)  SNACK_TIME_QTY " +
                                "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN 1 ELSE 0 END * " + snack_time_amt + " ELSE 0 END) SNACK_TIME_AMT ";
        }
        SQL_2 = SQL_2 + "    FROM THR_MEAL_CHECKING F " +
        "   WHERE  F.DEL_IF = 0   " +
        "         AND F.WORK_DT BETWEEN '" + p_from_dt + "' AND '" + p_to_dt + "' " +
        "         AND F.MEAL_TIMES IS NOT NULL " +
        "         AND F.MEAL_EMP_TYPE = 'OUT' " +
        "     GROUP BY F.EMP_ID,F.FULL_NAME " +
        " ORDER BY seq,div_nm,org_nm,EMP_ID     ";

        //======================================================================================================================
        string SQL_3
        = "  SELECT 3 seq,'','' div_nm " +
        "         ,'' org_nm " +
        "         ,'' group_nm " +
        "         ,'' EMP_ID " +
        "         ,F.VISITOR_NM " +
        "         ,'' join_dt " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN NVL(F.MEAL_QTY,0) ELSE 0 END ELSE 0 END) MEAL_MAIN_QTY " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN NVL(F.MEAL_QTY,0) ELSE 0 END * " + meal_main_amt + " ELSE 0 END) MEAL_MAIN_AMT " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN NVL(F.MEAL_QTY,0) ELSE 0 END ELSE 0 END)  SNACK_TIME_QTY " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN NVL(F.MEAL_QTY,0) ELSE 0 END * " + snack_time_amt + " ELSE 0 END) SNACK_TIME_AMT ";
        for (i = 1; i < ncal; i++)
        {
            SQL_3 = SQL_3 + "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN NVL(F.MEAL_QTY,0) ELSE 0 END ELSE 0 END) MEAL_MAIN_QTY " +
                                "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN NVL(F.MEAL_QTY,0) ELSE 0 END * " + meal_main_amt + " ELSE 0 END) MEAL_MAIN_AMT " +
                                "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN NVL(F.MEAL_QTY,0) ELSE 0 END ELSE 0 END)  SNACK_TIME_QTY " +
                                "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN NVL(F.MEAL_QTY,0) ELSE 0 END * " + snack_time_amt + " ELSE 0 END) SNACK_TIME_AMT ";
        }
        SQL_3 = SQL_3 + "    FROM THR_MEAL_VISITOR F " +
        "   WHERE  F.DEL_IF = 0   " +
        "         AND F.WORK_DT BETWEEN '" + p_from_dt + "' AND '" + p_to_dt + "' " +
        "         AND F.MEAL_TIMES IS NOT NULL " +
        "    GROUP BY F.VISITOR_NM " +
        " ORDER BY seq,div_nm,org_nm,EMP_ID     ";

        //======================================================================================================================
        string SQL_ALL
        = "  SELECT 1 seq,'',MAX((    SELECT g.ORG_NM  " +
        "              FROM TCO_ORG g  " +
        "             WHERE g.del_if = 0 AND G.ORG_TYPE = '06'  " +
        "        START WITH g.pk = b.pk  " +
        "        CONNECT BY PRIOR g.p_pk = g.pk)) div_nm " +
        "         ,B.ORG_NM org_nm " +
        "         ,C.WORKGROUP_NM group_nm " +
        "         ,D.EMP_ID EMP_ID " +
        "         ,D.FULL_NAME " +
        "         ,TO_CHAR (TO_DATE (D.JOIN_DT, 'yyyymmdd'), 'dd/mm/yyyy') join_dt " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN 1 ELSE 0 END ELSE 0 END) MEAL_MAIN_QTY " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN 1 ELSE 0 END * " + meal_main_amt + " ELSE 0 END) MEAL_MAIN_AMT " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN 1 ELSE 0 END ELSE 0 END)  SNACK_TIME_QTY " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN 1 ELSE 0 END * " + snack_time_amt + " ELSE 0 END) SNACK_TIME_AMT ";
        for (i = 1; i < ncal; i++)
        {
            SQL_ALL = SQL_ALL + "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN 1 ELSE 0 END ELSE 0 END) MEAL_MAIN_QTY " +
                                "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN 1 ELSE 0 END * " + meal_main_amt + " ELSE 0 END) MEAL_MAIN_AMT " +
                                "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN 1 ELSE 0 END ELSE 0 END)  SNACK_TIME_QTY " +
                                "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN 1 ELSE 0 END * " + snack_time_amt + " ELSE 0 END) SNACK_TIME_AMT ";
        }

        SQL_ALL = SQL_ALL + "    FROM THR_MEAL_CHECKING F, TCO_ORG B, THR_WORK_GROUP C, THR_EMPLOYEE D " +
        "   WHERE  F.DEL_IF = 0 AND B.DEL_IF = 0 AND C.DEL_IF =0 AND D.DEL_IF =0  " +
        "         AND F.THR_EMP_PK = d.pk " +
        "         AND F.TCO_ORG_PK = b.pk " +
        "         and D.THR_WG_PK = c.pk  " +
        "         AND F.WORK_DT BETWEEN '" + p_from_dt + "' AND '" + p_to_dt + "' " +
        "         AND F.MEAL_TIMES IS NOT NULL " +
        "         AND F.MEAL_EMP_TYPE = 'IN' " +
        "         AND DECODE ('" + p_group_pk + "', 'ALL', 'ALL', D.THR_WG_PK) = '" + p_group_pk + "'  " +
        "         AND D.TCO_ORG_PK IN  " +
        "              (    SELECT g.pk  " +
        "                     FROM TCO_ORG g  " +
        "                    WHERE g.del_if = 0  " +
        "               START WITH g.pk =  " +
        "                             CASE  " +
        "                                WHEN '" + p_dept_pk + "' = 'ALL' THEN g.pk  " +
        "                                ELSE TO_NUMBER ('" + p_dept_pk + "')  " +
        "                             END  " +
        "               CONNECT BY PRIOR g.pk = g.p_pk)  " +
        "     GROUP BY D.EMP_ID,B.ORG_NM,C.WORKGROUP_NM,D.FULL_NAME,D.JOIN_DT " +
        "    UNION ALL " +
        "    SELECT 2 seq,'','' div_nm " +
        "         ,'' org_nm " +
        "         ,'' group_nm " +
        "         ,F.EMP_ID EMP_ID " +
        "         ,F.FULL_NAME " +
        "         ,'' join_dt " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN 1 ELSE 0 END ELSE 0 END) MEAL_MAIN_QTY " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN 1 ELSE 0 END * " + meal_main_amt + " ELSE 0 END) MEAL_MAIN_AMT " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN 1 ELSE 0 END ELSE 0 END)  SNACK_TIME_QTY " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN 1 ELSE 0 END * " + snack_time_amt + " ELSE 0 END) SNACK_TIME_AMT ";
        for (i = 1; i < ncal; i++)
        {
            SQL_ALL = SQL_ALL + "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN 1 ELSE 0 END ELSE 0 END) MEAL_MAIN_QTY " +
                                "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN 1 ELSE 0 END * " + meal_main_amt + " ELSE 0 END) MEAL_MAIN_AMT " +
                                "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN 1 ELSE 0 END ELSE 0 END)  SNACK_TIME_QTY " +
                                "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN 1 ELSE 0 END * " + snack_time_amt + " ELSE 0 END) SNACK_TIME_AMT ";
        }
        SQL_ALL = SQL_ALL + "    FROM THR_MEAL_CHECKING F " +
        "   WHERE  F.DEL_IF = 0   " +
        "         AND F.WORK_DT BETWEEN '" + p_from_dt + "' AND '" + p_to_dt + "' " +
        "         AND F.MEAL_TIMES IS NOT NULL " +
        "         AND F.MEAL_EMP_TYPE = 'OUT' " +
        "     GROUP BY F.EMP_ID,F.FULL_NAME " +
        "    UNION ALL " +
        "    SELECT 3 seq,'','' div_nm " +
        "         ,'' org_nm " +
        "         ,'' group_nm " +
        "         ,'' EMP_ID " +
        "         ,F.VISITOR_NM " +
        "         ,'' join_dt " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN NVL(F.MEAL_QTY,0) ELSE 0 END ELSE 0 END) MEAL_MAIN_QTY " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN NVL(F.MEAL_QTY,0) ELSE 0 END * " + meal_main_amt + " ELSE 0 END) MEAL_MAIN_AMT " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN NVL(F.MEAL_QTY,0) ELSE 0 END ELSE 0 END)  SNACK_TIME_QTY " +
        "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + 0,'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN NVL(F.MEAL_QTY,0) ELSE 0 END * " + snack_time_amt + " ELSE 0 END) SNACK_TIME_AMT ";
        for (i = 1; i < ncal; i++)
        {
            SQL_ALL = SQL_ALL + "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN NVL(F.MEAL_QTY,0) ELSE 0 END ELSE 0 END) MEAL_MAIN_QTY " +
                                "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 1 THEN NVL(F.MEAL_QTY,0) ELSE 0 END * " + meal_main_amt + " ELSE 0 END) MEAL_MAIN_AMT " +
                                "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN NVL(F.MEAL_QTY,0) ELSE 0 END ELSE 0 END)  SNACK_TIME_QTY " +
                                "         ,SUM (CASE WHEN F.WORK_DT = TO_CHAR(TO_DATE('" + p_from_dt + "','yyyymmdd') + " + i + ",'yyyymmdd') THEN CASE WHEN F.MEAL_TYPE = 2 THEN NVL(F.MEAL_QTY,0) ELSE 0 END * " + snack_time_amt + " ELSE 0 END) SNACK_TIME_AMT ";
        }
        SQL_ALL = SQL_ALL + "    FROM THR_MEAL_VISITOR F " +
        "   WHERE  F.DEL_IF = 0   " +
        "         AND F.WORK_DT BETWEEN '" + p_from_dt + "' AND '" + p_to_dt + "' " +
        "         AND F.MEAL_TIMES IS NOT NULL " +
        "    GROUP BY F.VISITOR_NM " +
        " ORDER BY seq,div_nm,org_nm,EMP_ID     ";

        string SQL;

        if (p_meal_emp_type == "IN")
            SQL = SQL_1;
        else if (p_meal_emp_type == "OUT")
            SQL = SQL_2;
        else if (p_meal_emp_type == "VIS")
            SQL = SQL_3;
        else
            SQL = SQL_ALL;

        //Response.Write(SQL);
        //Response.End();   
        DataTable dt_emp = CtlLib.TableReadOpen(SQL);

        int irow = dt_emp.Rows.Count;
        int icol = dt_emp.Columns.Count;

        if (irow == 0)
        {
            Response.Write("There is no data.");
            Response.End();
        }

        
        //Khai bao bien
        int j, k,pos = 6;
        int ntotal = icol - 8, nseq = 0;        //8 cot khong sum
        double[] s_total = new double[ntotal];
        double[] g_total = new double[ntotal];
        int ncount = 0;

        for (j = 0; j < ntotal; j++)
        {
            s_total[j] = 0;
            g_total[j] = 0;
        }

        //Dem so luong thay doi meal type
        for (i = 0; i < irow - 1; i++)
        {
            if (dt_emp.Rows[i]["seq"].ToString() != dt_emp.Rows[i + 1]["seq"].ToString())
                nseq++;
        }
        //Insert new row

        for (i = 0; i < irow - 1 + nseq; i++)
        {
            exSheet.Range[pos + 1, 1].Rows.EntireRow.Insert();
        }

        //Title value
        exSheet.Cells["BL2"].Value = "Month: " + p_work_mon.Substring(4, 2).ToString() + "/" + p_work_mon.Substring(0, 4).ToString();
        
        //Show data
        for (i = 0; i < irow; i++)
        {
            for (k = 0; k < ntotal; k++)
            {
                s_total[k] = s_total[k] + double.Parse(dt_emp.Rows[i][k + 8].ToString());
                g_total[k] = g_total[k] + double.Parse(dt_emp.Rows[i][k + 8].ToString());
            }
            ncount++;
            exSheet.Cells[pos + i, 1].Value = ncount;
            for (j = 2; j < icol; j++)
            {
                if (j <= 7)
                    exSheet.Cells[pos + i, j].Value = dt_emp.Rows[i][j].ToString();
                else
                    exSheet.Cells[pos + i, j].Value = double.Parse(dt_emp.Rows[i][j].ToString());
            }

            //Dong sub total
            if (i == irow - 1)
            {
                exSheet.Cells[pos + i + 1, 1].Value = "Total " + ncount + " employees";
                for (k = 0; k < ntotal; k++)
                {
                    exSheet.Cells[pos + i + 1, k + 8].Value = s_total[k];
                    exSheet.Cells[pos + i + 2, k + 8].Value = g_total[k];
                }
            }
            else if (dt_emp.Rows[i]["seq"].ToString() != dt_emp.Rows[i + 1]["seq"].ToString())
            {
                exSheet.Cells[pos + i + 1, 1, pos + i + 1, 7].Merge();
                exSheet.Cells[pos + i + 1, 1, pos + i + 1, icol].Font.Bold = true;
                exSheet.Cells[pos + i + 1, 1].HorizontalAlignment = XlHAlign.xlHAlignCenter;
                exSheet.Cells[pos + i + 1, 1].Value = "Total " + ncount + " employees";

                for (k = 0; k < ntotal; k++)
                {
                    exSheet.Cells[pos + i + 1, k + 8].Value = s_total[k];
                    s_total[k] = 0;
                }

                ncount = 0;
                pos++;
            }
        }

        //Xóa cột dư ở những tháng không đủ 31 ngày
        int ndel = 0;   //so luong ngày can xoa
        int cdel = 0;   //vi tri cot can xoa
        ndel = 31 - ncal;
        cdel = ncal * 4 + 7;

        for (i = 0; i < ndel * 4; i++)
        {
            exSheet.Range[1, cdel + 1].Columns.EntireColumn.Delete();
            exSheet.Range[1, cdel + 1].Columns.EntireColumn.Delete();
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
}