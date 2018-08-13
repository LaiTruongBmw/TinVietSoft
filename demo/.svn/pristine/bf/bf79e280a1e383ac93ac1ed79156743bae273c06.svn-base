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

public partial class rpt_hrpm00700_0 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //CtlLib.SetUser("hr");
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string p_dept, p_group, p_status, p_type, p_pay_type, p_emp_id, p_work_mon, p_m_type, p_sal_period, p_emp_type;

        p_dept = Request["l_dept"].ToString();
        p_group = Request["l_group"].ToString();
        p_status = Request["l_status"].ToString();
        p_type = Request["l_type"].ToString();
        p_pay_type = Request["l_pay_type"].ToString();
        p_emp_id = Request["l_emp_id"].ToString();
        p_work_mon = Request["l_work_mon"].ToString();
        p_sal_period = Request["l_sal_period"].ToString();
        p_emp_type = Request["l_Emp_Type"].ToString();
        p_m_type = Request.QueryString["l_m_type"].ToString();
        //p_from_leftdate = Request["l_from_leftdate"].ToString();
        //p_to_leftdate = Request["l_to_leftdate"].ToString();

        string TemplateFile = "rpt_hrpm00700_0.xls";
        string TempFile = "../../../../system/temp/rpt_hrpm00700_0_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        if (p_type == "ALL")
        {
            p_type = "= NVL (a.net_amt, 0)";
        }

        string SQL
        = "SELECT A.TCO_DEPT_PK dept_pk,'', " +
        "         a.DEPT_NM dept_nm, " +
        "         A.EMP_ID emp_id_2, " +
        "         A.FULL_NAME full_nm_3, " +
        "         TO_CHAR (TO_DATE (A.JOIN_DT, 'yyyymmdd'), 'dd/mm/yyyy') join_dt_4, " +
        "         TO_CHAR (TO_DATE (A.left_DT, 'yyyymmdd'), 'dd/mm/yyyy') left_dt_5, " +
        "         A.POS_NM pos_nm_6, " +
        "         (SELECT code_nm " +
        "            FROM vhr_hr_code " +
        "           WHERE id = 'HR0117' AND code = a.times) " +
        "            times_74, " +
        "         (CASE " +
        "             WHEN NVL (a.CONFIRM_DT, a.from_dt) > a.from_dt " +
        "             THEN " +
        "                ROUND (NVL (A.SALARY_LEVEL1, 0), 10) " +
        "             ELSE " +
        "                0 " +
        "          END) " +
        "            sal_level1_7, " +
        "         (CASE " +
        "             WHEN NVL (a.CONFIRM_DT, a.to_dt) > a.to_DT THEN 0 " +
        "             ELSE ROUND (NVL (A.SALARY_LEVEL2, 0), 10) " +
        "          END) " +
        "            sal_level2_8, " +
        "         ROUND (NVL (A.ALLOW_AMT1, 0), 10) allow_amt1_9, " +
        "         ROUND (NVL (A.ALLOW_AMT2, 0), 10) allow_amt2_10, " +
        "         ROUND (NVL (A.ALLOW_AMT3, 0), 10) allow_amt3_11, " +
        "         ROUND (NVL (A.ALLOW_AMT4, 0), 10) allow_amt4_12, " +
        "         ROUND (NVL (A.ALLOW_AMT5, 0), 10) allow_amt5_13, " +
        "         ROUND (NVL (A.ALLOW_AMT6, 0), 10) allow_amt6_14, " +
        "         ROUND (NVL (A.ALLOW_AMT7, 0), 10) allow_amt7_15, " +
        "         ROUND (NVL (A.ALLOW_AMT8, 0), 10) allow_amt8_16, " +
        "         ROUND (NVL (A.ALLOW_AMT9, 0), 10) allow_amt1_9, " +
        "         ROUND (NVL (A.ALLOW_AMT10, 0), 10) allow_amt1_9, " +
        "         ROUND (NVL (A.ALLOW_AMT11, 0), 10) allow_amt1_9, " +
        "         ROUND (NVL (A.ALLOW_AMT12, 0), 10) allow_amt1_9, " +
        "         ROUND (NVL (A.ALLOW_AMT1, 0) + NVL (A.ALLOW_AMT2, 0) + NVL (A.ALLOW_AMT3, 0) + NVL (A.ALLOW_AMT4, 0)" +
        "               + NVL (A.ALLOW_AMT5, 0) + NVL (A.ALLOW_AMT6, 0) + NVL (A.ALLOW_AMT7, 0) + NVL (A.ALLOW_AMT8, 0)" +
        "               + NVL (A.ALLOW_AMT9, 0) + NVL (A.ALLOW_AMT10, 0) + NVL (A.ALLOW_AMT11, 0) + NVL (A.ALLOW_AMT12, 0), 0) total_allow, " +
        "         ROUND (NVL (A.ALLOW_K1_AMT, 0), 10) allow_k1_amt_38, " +
        "         ROUND (NVL (A.ALLOW_K2_AMT, 0), 10) allow_k2_amt_39, " +
        "         ROUND (NVL (A.ALLOW_K3_AMT, 0), 10) allow_k3_amt_40, " +
        "         ROUND (NVL (A.ALLOW_K4_AMT, 0), 10) allow_k4_amt_41, " +
        "         ROUND (NVL (A.ALLOW_K5_AMT, 0), 10) allow_k5_amt_42, " +
        "         ROUND (NVL (A.ALLOW_K6_AMT, 0), 10) allow_k6_amt_43, " +
        "         ROUND (NVL (A.ALLOW_K7_AMT, 0), 10) allow_k7_amt_44, " +
        "         ROUND (NVL (A.ALLOW_K8_AMT, 0), 10) allow_k8_amt_45, " +
        "         ROUND (NVL (A.WT_L1, 0) / 8 + NVL (a.HOL_DAY_L1, 0), 10) wd1_17, " +
        "         ROUND (NVL (A.WT_L2, 0) / 8 + NVL (a.HOL_DAY_L2, 0), 10) wd2_18, " +
        "         ROUND (NVL (A.TOTAL_ABS_NPAY_L1, 0) / 8, 10) abs_npay_19, " +
        "         ROUND (NVL (A.TOTAL_ABS_NPAY_L2, 0) / 8, 10) abs_npay_20, " +
        "         ROUND (NVL (A.WT_L1_AMT, 0), 10) wd1_17, " +
        "         ROUND (NVL (A.WT_L2_AMT, 0), 10) wd2_18, " +
        "         ROUND (NVL (A.ABS_ALE_L1, 0) / 8, 10) abs_ale1_19, " +
        "         ROUND (NVL (A.ABS_ALE_L2, 0) / 8, 10) abs_ale2_20, " +
        "         ROUND (NVL (A.ABS_ALE_L1_AMT, 0), 10) abs_ale1_19, " +
        "         ROUND (NVL (A.ABS_ALE_L2_AMT, 0), 10) abs_ale2_20, " +
        "         ROUND (NVL (A.ABS_OTHER_PAY_L1, 0) / 8, 10) abs_other1_21, " +
        "         ROUND (NVL (A.ABS_OTHER_PAY_L2, 0) / 8, 10) abs_other2_22, " +
        "         ROUND (NVL (A.ABS_OTHER_PAY_L1_AMT, 0), 10) abs_other1_21, " +
        "         ROUND (NVL (A.ABS_OTHER_PAY_L2_AMT, 0), 10) abs_other2_22, " +
		"		  0 abs_12_1_19, " +
		"		  0 abs_12_2_20, " +
		"		  0 abs_12_1_19, " +
		"		  0 abs_12_2_20, " +
        //"         ROUND (NVL (A.ABS_12_L1, 0) / 8, 10) abs_12_1_19, " +
        //"         ROUND (NVL (A.ABS_12_L2, 0) / 8, 10) abs_12_2_20, " +
        //"         ROUND (NVL (A.ABS_12_L1_AMT, 0), 10) abs_12_1_19, " +
        //"         ROUND (NVL (A.ABS_12_L2_AMT, 0), 10) abs_12_2_20, " +
        "         ROUND (NVL (A.WT_L1_AMT, 0) + NVL (A.WT_L2_AMT, 0) + NVL (A.HOL_DAY_L1_AMT, 0) + NVL (A.HOL_DAY_L2_AMT, 0), 10) sal_wd_23, " +
        "         ROUND (NVL (A.WT_L1, 0) + NVL (a.HOL_DAY_L1, 0), 10) wd1_17, " +
        "         ROUND (NVL (A.WT_L2, 0) + NVL (a.HOL_DAY_L2, 0), 10) wd2_18, " +
        "         ROUND (NVL (A.OT_L1, 0), 10) ot_l1_24,  " +
        "         ROUND (NVL (A.OT_L2, 0), 10) ot_l2_25,  " +
        "         ROUND (NVL (A.OT_L1_amt, 0), 10) ot_l1_amt_24,  " +
        "         ROUND (NVL (A.OT_L2_amt, 0), 10) ot_l2_amt_25,  " +
        "         ROUND (NVL (A.ST_L1, 0), 10) st_l1_24,  " +
        "         ROUND (NVL (A.ST_L2, 0), 10) st_l2_25,  " +
        "         ROUND (NVL (A.ST_L1_amt, 0), 10) st_l1_amt_24,  " +
        "         ROUND (NVL (A.ST_L2_amt, 0), 10) st_l2_amt_25,  " +
        "         ROUND (NVL (A.OST_L1, 0), 10) ost_l1_24,  " +
        "         ROUND (NVL (A.OST_L2, 0), 10) ost_l2_25,  " +
        "         ROUND (NVL (A.OST_L1_amt, 0), 10) ost_l1_amt_24,  " +
        "         ROUND (NVL (A.OST_L2_amt, 0), 10) ost_l2_amt_25,  " +
        "         ROUND (NVL (A.HT_L1, 0), 10) ht_l1_24,  " +
        "         ROUND (NVL (A.HT_L2, 0), 10) ht_l2_25,  " +
        "         ROUND (NVL (A.HT_L1_amt, 0), 10) ht_l1_amt_24,  " +
        "         ROUND (NVL (A.HT_L2_amt, 0), 10) ht_l2_amt_25,  " +
        "         ROUND (NVL (A.OHT_L1, 0), 10) oht_l1_24,  " +
        "         ROUND (NVL (A.OHT_L2, 0), 10) oht_l2_25,  " +
        "         ROUND (NVL (A.OHT_L1_amt, 0), 10) oht_l1_amt_24,  " +
        "         ROUND (NVL (A.OHT_L2_amt, 0), 10) oht_l2_amt_25,  " +
        "         ROUND (NVL (A.NT_30_L1, 0), 10) nt_30_l1_28,  " +
        "         ROUND (NVL (A.NT_30_L2, 0), 10) nt_30_l2_29,  " +
        "         ROUND (NVL (A.NT_30_L1_amt, 0), 10) nt_30_l1_amt_28,  " +
        "         ROUND (NVL (A.NT_30_L2_amt, 0), 10) nt_30_l2_amt_29,  " +
        "         ROUND (NVL (A.NT_45_L1, 0), 10) nt_45_l1_30,  " +
        "         ROUND (NVL (A.NT_45_L2, 0), 10) nt_45_l2_31,  " +
        "         ROUND (NVL (A.NT_45_L1_amt, 0), 10) nt_45_l1_amt_30,  " +
        "         ROUND (NVL (A.NT_45_L2_amt, 0), 10) nt_45_l2_amt_31, " +
        "         ROUND (NVL (A.NT_45_2_L1, 0), 10) nt_45_l1_30,  " +
        "         ROUND (NVL (A.NT_45_2_L2, 0), 10) nt_45_l2_31,  " +
        "         ROUND (NVL (A.NT_45_2_L1_amt, 0), 10) nt_45_l1_amt_30,  " +
        "         ROUND (NVL (A.NT_45_2_L2_amt, 0), 10) nt_45_l2_amt_31,  " +
        "         ROUND (NVL (A.NT_60_L1, 0), 10) nt_60_l1_32,  " +
        "         ROUND (NVL (A.NT_60_L2, 0), 10) nt_60_l2_33,  " +
        "         ROUND (NVL (A.NT_60_L1_amt, 0), 10) nt_60_l1_amt_32,  " +
        "         ROUND (NVL (A.NT_60_L2_amt, 0), 10) nt_60_l2_amt_33,  " +
        "         ROUND (NVL (A.NOST_L1, 0), 10) nt_60_l1_32,  " +
        "         ROUND (NVL (A.NOST_L2, 0), 10) nt_60_l2_33,  " +
        "         ROUND (NVL (A.NOST_L1_amt, 0), 10) nt_60_l1_amt_32,  " +
        "         ROUND (NVL (A.NOST_L2_amt, 0), 10) nt_60_l2_amt_33, " +
        "         ROUND (NVL (A.NT_90_L1, 0), 10) nt_90_l1_34,  " +
        "         ROUND (NVL (A.NT_90_L2, 0), 10) nt_90_l2_35,  " +
        "         ROUND (NVL (A.NT_90_L1_amt, 0), 10) nt_90_l1_amt_34,  " +
        "         ROUND (NVL (A.NT_90_L2_amt, 0), 10) nt_90_l2_amt_35,  " +
        "         ROUND (NVL (A.NOHT_L1, 0), 10) nt_90_l1_34,  " +
        "         ROUND (NVL (A.NOHT_L2, 0), 10) nt_90_l2_35,  " +
        "         ROUND (NVL (A.NOHT_L1_amt, 0), 10) nt_90_l1_amt_34,  " +
        "         ROUND (NVL (A.NOHT_L2_amt, 0), 10) nt_90_l2_amt_35,  " +
        "         ROUND (NVL (A.TOTAL_OT_L1_AMT, 0) + NVL (A.TOTAL_OT_L2_AMT, 0), 10) " +
        "            total_ot_amt_36, " +
        "         ROUND (NVL (A.OT_TAX_L1_AMT, 0) + NVL (A.OT_TAX_L2_AMT, 0), 10) " +
        "            ot_tax_amt_37, " +
        "         ROUND (NVL (A.RETURN_AMT, 0), 10) return_amt_46, " +
        "         ROUND (NVL (A.INC_AMT, 0) + NVL (A.BONUS_YEARLY_AMT, 0), 10) " +
        "            incentive_amt_47, " +
        "         ROUND (NVL (A.ALE_STOP, 0), 10) ale_stop_48, " +
        "         ROUND (NVL (A.ALE_STOP_AMT, 0), 10) ale_stop_amt_49, " +
        "         ROUND (NVL (A.SEVERANCE_MONTH, 0), 10) serverance_mon_50, " +
        "         ROUND (NVL (A.SEVERANCE_AMT, 0), 10) serverance_amt_51, " +
        "         ROUND (NVL (A.GROSS_AMT, 0), 10) gross_amt_52, " +
        "         ROUND (NVL (A.BREAK_CONTRACT_AMT, 0), 10) break_con_amt_53, " +
        "         ROUND (NVL (A.ADVANCE_AMT, 0), 10) advance_amt_54, " +
        "         ROUND (NVL (A.ADD_FOR_TAX, 0), 10) add_for_tax, " +
        "         ROUND (NVL (A.GROSS_AMT_2, 0), 10) gross_amt_2_52, " +
        "         ROUND (NVL (A.DEDUCT_PIT, 0), 10) deduct_pit_55, " +
        "         ROUND (NVL (A.INCOME_AMT_2, 0), 10) income_amt_56, " +
        "         ROUND (NVL (A.INCOME_BEFORE_TAX, NVL (A.INCOME_AMT, 0)), 10) " +
        "            income_bef_amt_57, " +
        "         ROUND (NVL (A.INCOME_TAX, 0), 10) income_tax_58, " +
        "         ROUND (NVL (A.UNION_AMT, 0), 10) union_amt_59, " +
        "         ROUND (NVL (A.SOCIAL_AMT, 0), 10) social_amt_60, " +
        "         ROUND (NVL (A.HEALTH_AMT, 0), 10) health_amt_61, " +
        "         ROUND (NVL (A.UNEMP_INS, 0), 10) unemp_ins_amt_62, " +
        "         ROUND (NVL (A.RETURN_NO_PIT, 0) + NVL (A.ADJ_FOR_TAX, 0), 10) " +
        "            return_no_pit_63, " +
        "         ROUND (NVL (A.ADVANCE_NO_PIT, 0), 10) advance_no_pit_64, " +
        "         ROUND (NVL (A.health_card_amt, 0), 10) break_con_amt_53, " +
        "         ROUND (NVL (A.EQUIP1_AMT, 0), 10) equip1_amt_66, " +
        "         ROUND (NVL (A.EQUIP2_AMT, 0), 10) equip2_amt_67, " +
        "         ROUND (NVL (A.EQUIP3_AMT, 0), 10) equip3_amt_68, " +
        "         ROUND (NVL (A.EQUIP4_AMT, 0), 10) equip4_amt_69, " +
        "         ROUND (NVL (A.EQUIP5_AMT, 0), 10) equip5_amt_70, " +
        "         ROUND (NVL (A.EQUIP6_AMT, 0), 10) equip6_amt_71, " +
        "         ROUND (NVL (A.EQUIP7_AMT, 0), 10) equip7_amt_72, " +
        "         ROUND (NVL (A.EQUIP8_AMT, 0), 10) equip8_amt_73, " +
        "         ROUND (NVL (A.health_card_amt, 0) + NVL (A.EQUIP1_AMT, 0) - NVL (A.EQUIP2_AMT, 0)  - NVL (A.EQUIP3_AMT, 0)  - NVL (A.EQUIP4_AMT, 0)  - NVL (A.EQUIP5_AMT, 0)  - NVL (A.EQUIP6_AMT, 0)  - NVL (A.EQUIP7_AMT, 0)  - NVL (A.EQUIP8_AMT, 0), 10) total_deduct, " +
        "         ROUND (NVL (A.actual_deduct, 0), 10) actual_deduct, " +
        "         ROUND (NVL (A.ADVANCE_AMT2, 0), 10) advance_amt_2, " +
        "         ROUND (NVL (A.UNIFORM_AMT, 0), 10) uniform_amt, " +
        "         DECODE ('" + p_m_type + "', " +
        "                 'ALL', ROUND (NVL (A.NET_AMT, 0), 0), " +
        "                 '01', ROUND (NVL (A.NET_AMT, 0), 0), " +
        "                 ROUND (NVL (A.NET_AMT, 0), 10)) " +
        "            net_amt_65,'', " +
        "         ROUND (NVL (A.SOCIAL_COMPANY, 0), 10) social_com,  " +
        "         ROUND (NVL (A.HEALTH_COMPANY, 0), 10) health_com,  " +
        "         ROUND (NVL (A.UNEMP_COM_INS, 0), 10) unemp_com,  " +
        "         ROUND (NVL (A.UNION_COMPANY, 0), 10) union_com,  " +
        "         (SELECT    TO_CHAR (TO_DATE (m.from_dt, 'yyyymmdd'), 'dd-mm-yy') " +
        "                 || ' to ' " +
        "                 || TO_CHAR (TO_DATE (m.to_dt, 'yyyymmdd'), 'dd-mm-yy') " +
        "            FROM thr_close m " +
        "           WHERE     m.del_if = 0 " +
        "                 AND m.ID = '" + p_sal_period + "' " +
        "                 AND m.month_close = '" + p_work_mon + "' " +
        "                 AND m.times = NVL (a.times, '0')) " +
        "            period_resign_75 " +
        "    FROM thr_month_salary a, tco_org b, thr_work_group c " +
        "   WHERE     a.del_if = 0 " +
        "         AND a.work_mon = '" + p_work_mon + "' " +
        "         AND b.del_if = 0 " +
        "         AND c.del_if = 0 " +
        "         AND a.tco_dept_pk = b.pk " +
        "         AND a.thr_group_pk = c.pk " +
        "         AND (a.tco_dept_pk IN " +
        "                 (    SELECT g.pk " +
        "                        FROM tco_org g " +
        "                       WHERE g.del_if = 0 " +
        "                  START WITH g.pk = " +
        "                                DECODE ('" + p_dept + "', " +
        "                                        'ALL', 0, " +
        "                                        '" + p_dept + "') " +
        "                  CONNECT BY PRIOR g.pk = g.p_pk) " +
        "              OR '" + p_dept + "' = 'ALL') " +
        "         AND DECODE ('" + p_group + "', 'ALL', 'ALL', a.thr_group_pk) = '" + p_group + "' " +
        "         AND a.emp_id LIKE '%" + p_emp_id + "%' " +
        "         AND DECODE ('" + p_status + "', 'ALL', 'ALL', a.status) = '" + p_status + "' " +
        "         AND DECODE ('" + p_pay_type + "', 'ALL', 'ALL', a.pay_type) = '" + p_pay_type + "' " +
        "         and decode('" + p_emp_type + "' ,'ALL','ALL',A.EMPLOYEE_TYPE)='" + p_emp_type + "' " +
        "         AND DECODE ('" + p_m_type + "', 'ALL', 'ALL', a.MONEY_KIND) = '" + p_m_type + "' " +
        "         AND DECODE ('" + p_sal_period + "', 'ALL', 'ALL', A.SAL_PERIOD) = '" + p_sal_period + "' " +
        "         AND NVL (a.net_amt, 0) " + p_type +
        "ORDER BY A.DEPT_NM, a.emp_id ";

        //Response.Write(SQL);
        //Response.End();
        DataTable dt_emp = CtlLib.TableReadOpen(SQL);
        int irow_emp, icol_emp;
        irow_emp = dt_emp.Rows.Count;
        icol_emp = dt_emp.Columns.Count;
        if (irow_emp == 0)
        {
            Response.Write("There is no data of salary");
            Response.End();
        }

        string para_com = "'" + p_dept + "','" + p_work_mon + "'";
        DataTable dt_com = CtlLib.TableReadOpenCursor("ST_HR_RPT_CO_COMPANY", para_com);


        DataTable dt_allow = CtlLib.TableReadOpenCursor("ST_HR_RPT_CO_ALLOW_SALARY");

        DataTable dt_allow_k = CtlLib.TableReadOpenCursor("ST_HR_RPT_CO_ALLOW_K_SALARY");

        DataTable dt_equip = CtlLib.TableReadOpenCursor("ST_HR_RPT_CO_EQUIP");

        SQL
        = "SELECT NT_RATE nt30, " +
            "       NOT_RATE nt45, " +
            "       NOT_2_RATE nt45_2, " +
            "       OST_RATE ost, " +
            "       NOST_RATE nost, " +
            "       OHT_RATE oht, " +
            "       NOHT_RATE noht, " +
            "       NST_RATE nt60, " +
            "       NHT_RATE nt90 " +
            "  FROM THR_MONTH_OT_RATE " +
            " WHERE del_if = 0 AND work_mon = '" + p_work_mon + "' ";

        DataTable dt_rate = CtlLib.TableReadOpen(SQL);

        int i, j, k, i_allow;
        int pos = 7;
        int allow = 11, allow_k = 24, equip = 125;     //vi tri phu cap
        int pos_nt = 73;
        int emp_dept = 0, n_dept = 0;
        Double[] sub_total = new Double[icol_emp];
        Double[] grant_total = new Double[icol_emp];

        //bind data to excel file
        //-----header---   
        exSheet.Cells[1, 1].Select();
        exSheet.Cells["C1"].Value = dt_com.Rows[0][0].ToString();
        exSheet.Cells["C2"].Value = dt_com.Rows[0][1].ToString();
        exSheet.Cells["C3"].Value = "Phone: " + dt_com.Rows[0][2].ToString();
        exSheet.Cells[1, pos_nt].Value = "EMPLOYEE'S PAYROLL IN " + dt_com.Rows[0][4].ToString();
        exSheet.Cells[2, pos_nt].Value = "BẢNG LƯƠNG NHÂN VIÊN THÁNG " + dt_com.Rows[0][5].ToString();

        exSheet.Cells[4, pos_nt].Value = string.Format("NT {0}%", dt_rate.Rows[0]["NT30"].ToString());
        exSheet.Cells[5, pos_nt].Value = string.Format("Trợ cấp đêm", dt_rate.Rows[0]["NT30"].ToString());
        pos_nt += 2;
        exSheet.Cells[4, pos_nt].Value = string.Format("NT {0}% Amount", dt_rate.Rows[0]["NT30"].ToString());
        exSheet.Cells[5, pos_nt].Value = string.Format("Tiền trợ cấp đêm {0}%", dt_rate.Rows[0]["NT30"].ToString());
        pos_nt += 2;
        exSheet.Cells[4, pos_nt].Value = string.Format("NOT {0}%", dt_rate.Rows[0]["NT45"].ToString());
        exSheet.Cells[5, pos_nt].Value = string.Format("Trợ cấp T.C đêm", dt_rate.Rows[0]["NT45"].ToString());
        pos_nt += 2;
        exSheet.Cells[4, pos_nt].Value = string.Format("NOT {0}% Amount", dt_rate.Rows[0]["NT45"].ToString());
        exSheet.Cells[5, pos_nt].Value = string.Format("Tiền trợ T.C cấp đêm {0}%", dt_rate.Rows[0]["NT45"].ToString());
        pos_nt += 2;
        exSheet.Cells[4, pos_nt].Value = string.Format("NOT {0}%", dt_rate.Rows[0]["NT45_2"].ToString());
        exSheet.Cells[5, pos_nt].Value = string.Format("Trợ cấp T.C đêm", dt_rate.Rows[0]["NT45_2"].ToString());
        pos_nt += 2;
        exSheet.Cells[4, pos_nt].Value = string.Format("NOT {0}% Amount", dt_rate.Rows[0]["NT45_2"].ToString());
        exSheet.Cells[5, pos_nt].Value = string.Format("Tiền trợ cấp T.C đêm {0}%", dt_rate.Rows[0]["NT45_2"].ToString());
        pos_nt += 2;
        exSheet.Cells[4, pos_nt].Value = string.Format("NST {0}%", dt_rate.Rows[0]["NT60"].ToString());
        exSheet.Cells[5, pos_nt].Value = string.Format("Trợ cấp đêm chủ nhật", dt_rate.Rows[0]["NT60"].ToString());
        pos_nt += 2;
        exSheet.Cells[4, pos_nt].Value = string.Format("NST {0}% Amount", dt_rate.Rows[0]["NT60"].ToString());
        exSheet.Cells[5, pos_nt].Value = string.Format("Tiền trợ cấp đêm chủ nhật {0}%", dt_rate.Rows[0]["NT60"].ToString());
        pos_nt += 2;
        exSheet.Cells[4, pos_nt].Value = string.Format("NOST {0}%", dt_rate.Rows[0]["NOST"].ToString());
        exSheet.Cells[5, pos_nt].Value = string.Format("Trợ cấp T.C đêm chủ nhật", dt_rate.Rows[0]["NOST"].ToString());
        pos_nt += 2;
        exSheet.Cells[4, pos_nt].Value = string.Format("NOST {0}% Amount", dt_rate.Rows[0]["NOST"].ToString());
        exSheet.Cells[5, pos_nt].Value = string.Format("Tiền trợ cấp T.C đêm chủ nhật {0}%", dt_rate.Rows[0]["NOST"].ToString());
        pos_nt += 2;
        exSheet.Cells[4, pos_nt].Value = string.Format("NHT {0}%", dt_rate.Rows[0]["NT90"].ToString());
        exSheet.Cells[5, pos_nt].Value = string.Format("Trợ cấp đêm lễ", dt_rate.Rows[0]["NT90"].ToString());
        pos_nt += 2;
        exSheet.Cells[4, pos_nt].Value = string.Format("NHT {0}% Amount", dt_rate.Rows[0]["NT90"].ToString());
        exSheet.Cells[5, pos_nt].Value = string.Format("Tiền trợ cấp đêm lễ {0}%", dt_rate.Rows[0]["NT90"].ToString());
        pos_nt += 2;
        exSheet.Cells[4, pos_nt].Value = string.Format("NOHT {0}%", dt_rate.Rows[0]["NOHT"].ToString());
        exSheet.Cells[5, pos_nt].Value = string.Format("Trợ cấp T.C đêm lễ", dt_rate.Rows[0]["NOHT"].ToString());
        pos_nt += 2;
        exSheet.Cells[4, pos_nt].Value = string.Format("NOHT {0}% Amount", dt_rate.Rows[0]["NOHT"].ToString());
        exSheet.Cells[5, pos_nt].Value = string.Format("Tiền trợ cấp T.C đêm lễ {0}%", dt_rate.Rows[0]["NOHT"].ToString());




        for (i_allow = 0; i_allow < 12; i_allow++)
        {
            if (dt_allow.Rows[0][i_allow + 12].ToString() == "1")
            {
                exSheet.Cells[4, allow + i_allow].Value = dt_allow.Rows[0][i_allow].ToString();
                exSheet.Cells[5, allow + i_allow].Value = dt_allow.Rows[0][24 + i_allow].ToString();
            }
        }

        for (i_allow = 0; i_allow < 8; i_allow++)
        {
            if (dt_allow_k.Rows[0][i_allow].ToString() != "")
            {
                exSheet.Cells[4, allow_k + i_allow].Value = dt_allow_k.Rows[0][i_allow].ToString();
                exSheet.Cells[5, allow_k + i_allow].Value = dt_allow_k.Rows[0][i_allow + 8].ToString();
            }

            if (dt_equip.Rows[0][i_allow].ToString() != "")
            {
                exSheet.Cells[4, equip + i_allow].Value = dt_equip.Rows[0][i_allow].ToString();
                exSheet.Cells[6, equip + i_allow].Value = dt_equip.Rows[0][i_allow + 8].ToString();
            }
        }
        //insert picture
        if (dt_com.Rows[0][3].ToString() != "")
        {
            byte[] MyData = new byte[0];
            MyData = (byte[])dt_com.Rows[0][3];
            MemoryStream stream = new MemoryStream(MyData);

            Bitmap b = new Bitmap(stream);

            exSheet.Shapes.AddPicture(ResizeImage(b, 115, 85));
        }

        //---end--header---

        for (k = 0; k < icol_emp; k++)
        {
            sub_total[k] = 0;
            grant_total[k] = 0;
        }

        for (i = 0; i < irow_emp - 1; i++)
        {
            j = i + 1;
            if (dt_emp.Rows[i]["dept_pk"].ToString() != dt_emp.Rows[j]["dept_pk"].ToString())
                n_dept++;
        }

        //Insert new row

        for (i = 0; i < irow_emp - 1 + n_dept; i++)
        {
            exSheet.Range[pos + 1, 1].Rows.EntireRow.Insert();
        }

        //Show data
        for (i = 0; i < irow_emp; i++)
        {
            for (k = 9; k < icol_emp - 1; k++)
            {
                if (k == icol_emp - 6)
                {
                    continue;
                }
                else
                {
                    sub_total[k] = sub_total[k] + double.Parse(dt_emp.Rows[i][k].ToString());
                    grant_total[k] = grant_total[k] + double.Parse(dt_emp.Rows[i][k].ToString());
                }
            }
            emp_dept++;

            exSheet.Cells[pos + i, 1].Value = emp_dept;
            for (j = 2; j < icol_emp; j++)
            {
                if (j < 9 || j == icol_emp - 6 || j == icol_emp - 1)
                    exSheet.Cells[pos + i, j].Value = dt_emp.Rows[i][j].ToString();
                else
                    exSheet.Cells[pos + i, j].Value = double.Parse(dt_emp.Rows[i][j].ToString());
            }


            if (i != irow_emp - 1 && (dt_emp.Rows[i]["dept_pk"].ToString() != dt_emp.Rows[i + 1]["dept_pk"].ToString()))
            {
                exSheet.Cells[pos + i + 1, 1, pos + i + 1, 4].Merge();
                exSheet.Cells[pos + i + 1, 1].Value = "Total " + dt_emp.Rows[i]["dept_nm"].ToString() + " (" + emp_dept + " employees)";
                exSheet.Cells[pos + i + 1, 1, pos + i + 1, icol_emp - 1].Rows.Font.Bold = true;
                for (k = 9; k < icol_emp - 1; k++)
                {
                    exSheet.Cells[pos + i + 1, k].Value = sub_total[k];
                    sub_total[k] = 0;
                }
                //Insert page break
                IPageBreaks pbs = exBook.Worksheets[1].HPageBreaks;
                IRange usedrange = exBook.Worksheets[1].UsedRange;
                //pbs.Reset();
                pbs.Add(usedrange.Rows[pos + i + 2]);
                //end insert page beak
                pos = pos + 1;
                emp_dept = 0;
            }
            else if (i == irow_emp - 1)
            {
                exSheet.Cells[pos + i + 1, 1, pos + i + 1, 4].Merge();
                exSheet.Cells[pos + i + 1, 1].Value = "Total " + dt_emp.Rows[i]["dept_nm"].ToString() + ": " + emp_dept + " employee(s)";
                exSheet.Cells[pos + i + 1, 1, pos + i + 1, icol_emp - 1].Rows.Font.Bold = true;
                exSheet.Cells[pos + i + 2, 1, pos + i + 2, 4].Merge();
                exSheet.Cells[pos + i + 2, 1].Value = "Grant Total: " + dt_emp.Rows.Count + " employee(s)";
                exSheet.Cells[pos + i + 2, 1, pos + i + 2, icol_emp - 1].Rows.Font.Bold = true;
                for (k = 9; k < icol_emp - 1; k++)
                {
                    exSheet.Cells[pos + i + 1, k].Value = sub_total[k];
                    exSheet.Cells[pos + i + 2, k].Value = grant_total[k];
                }
            }

        }
        //Hide allowance column
        for (i_allow = 0; i_allow < 12; i_allow++)
        {
            if (dt_allow.Rows[0][i_allow + 12].ToString() != "1")
                exSheet.Range[1, allow + i_allow].Columns.Hidden = true;
        }

        for (i_allow = 0; i_allow < 8; i_allow++)
        {
            if (dt_allow_k.Rows[0][i_allow].ToString() == "")
                exSheet.Range[1, allow_k + i_allow].Columns.Hidden = true;

            if (dt_equip.Rows[0][i_allow].ToString() == "")
                exSheet.Range[1, equip + i_allow].Columns.Hidden = true;
        }

        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }


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