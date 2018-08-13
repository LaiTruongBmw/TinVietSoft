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

public partial class rpt_hrpm00700_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
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

        string TemplateFile = "rpt_hrpm00700_1.xls";
        string TempFile = "../../../../system/temp/rpt_hrpm00700_1_" + Session["User_ID"].ToString() + ".xls";
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
    = "SELECT A.TCO_DEPT_PK dept_pk,'',a.DEPT_NM dept_nm,   " +
       "    A.EMP_ID,   " +
       "    A.FULL_NAME,   " +
       "    to_char(to_date(A.JOIN_DT,'yyyymmdd'),'dd/mm/yyyy') join_dt,   " +
       "    to_char(to_date(A.left_DT,'yyyymmdd'),'dd/mm/yyyy') left_dt,   " +
       "    A.POS_NM,   " +
       "    ROUND(NVL(A.SALARY_LEVEL1,0),10),   " +
       "    ROUND(NVL(A.SALARY_LEVEL2,0),10),   " +
       "    ROUND(NVL(A.SALARY_LEVEL1,0)*NVL(A.EXCHANGE_RATE,1),0),   " +
       "    ROUND(NVL(A.SALARY_LEVEL2,0)*NVL(A.EXCHANGE_RATE,1),0),   " +
       "    ROUND(NVL(A.ALLOW_AMT1,0)*NVL(A.EXCHANGE_RATE,1),0),   " +
       "    ROUND(NVL(A.ALLOW_AMT2,0)*NVL(A.EXCHANGE_RATE,1),0),   " +
       "    ROUND(NVL(A.ALLOW_AMT3,0)*NVL(A.EXCHANGE_RATE,1),0),   " +
       "    ROUND (NVL (A.ALLOW_AMT1, 0) + NVL (A.ALLOW_AMT2, 0) + NVL (A.ALLOW_AMT3, 0), 0) total_allow, " +
       "    ROUND ((NVL (A.ALLOW_AMT1, 0) + NVL (A.ALLOW_AMT2, 0) + NVL (A.ALLOW_AMT3, 0))*NVL(A.EXCHANGE_RATE,1), 0) total_allow_vnd, " +
       "    ROUND(NVL(A.WT_L1,0)/8 + NVL(a.HOL_DAY_L1,0),10),  " +
       "    ROUND(NVL(A.WT_L2,0)/8 + NVL(a.HOL_DAY_L2,0),10),  " +
       "    ROUND(NVL(A.ABS_ALE_L1,0)/8,10),  " +
       "    ROUND(NVL(A.ABS_ALE_L2,0)/8,10),  " +
       "    ROUND(NVL(A.ABS_OTHER_PAY_L1,0)/8,10),  " +
       "    ROUND(NVL(A.ABS_OTHER_PAY_L2,0)/8,10),  " +
       "    ROUND((NVL(A.WT_L1_AMT,0) + nvl(A.WT_L2_AMT,0) + nvl(A.TOTAL_ABS_PAY_L1_AMT,0) + nvl(A.TOTAL_ABS_PAY_L2_AMT,0)+ NVL(a.HOL_DAY_L1_AMT,0)+ NVL(a.HOL_DAY_L2_AMT,0))*NVL(A.EXCHANGE_RATE,1),0) total_wd_amt,   " +
       "    ROUND(NVL(A.OT_L1,0),10),  " +
       "    ROUND(NVL(A.OT_L2,0),10),  " +
       "    ROUND(NVL(A.ST_L1,0) + nvl(A.HT_L1,0)+ nvl(A.OHT_L1,0),10),  " +
       "    ROUND(NVL(A.ST_L2,0) + nvl(A.HT_L2,0)+ nvl(A.OHT_L2,0),10),  " +
       "    ROUND(NVL(A.NT_30_L1,0),10),  " +
       "    ROUND(NVL(A.NT_30_L2,0),10),  " +
       "    ROUND(NVL(A.NT_45_L1,0),10),  " +
       "    ROUND(NVL(A.NT_45_L2,0),10),  " +
       "    ROUND(NVL(A.NT_60_L1,0),10),  " +
       "    ROUND(NVL(A.NT_60_L2,0),10),  " +
       "    ROUND(NVL(A.NT_90_L1,0),10),  " +
       "    ROUND(NVL(A.NT_90_L2,0),10),  " +
       "    ROUND((NVL(A.TOTAL_OT_L1_AMT,0) + nvl(A.TOTAL_OT_L2_AMT,0))*NVL(A.EXCHANGE_RATE,1),0) total_ot_amt,  " +
       "    ROUND((NVL(A.OT_TAX_L1_AMT,0) + nvl(A.OT_TAX_L2_AMT,0))*NVL(A.EXCHANGE_RATE,1),0) total_ot_tax,  " +
       "    ROUND((NVL(A.RETURN_AMT,0) + nvl(A.INC_AMT,0))*NVL(A.EXCHANGE_RATE,1),0),  " +
       "    ROUND(NVL(A.ALE_STOP,0),10),   " +
       "    ROUND((NVL(A.ALE_STOP_AMT,0))*NVL(A.EXCHANGE_RATE,1),0),   " +
       "    ROUND(NVL(A.SEVERANCE_MONTH,0),10),   " +
       "    ROUND(NVL(A.SEVERANCE_AMT,0)*NVL(A.EXCHANGE_RATE,1),0),   " +
       "    ROUND(NVL(A.GROSS_AMT,0)*NVL(A.EXCHANGE_RATE,1),0),   " +
       "    ROUND(NVL(A.NET_AMT,0)*NVL(A.EXCHANGE_RATE,1),0), " +
       "    ROUND(NVL(A.ADVANCE_AMT,0)*NVL(A.EXCHANGE_RATE,1),0),  " +
       "    ROUND(NVL(A.DEDUCT_PIT,0)*NVL(A.EXCHANGE_RATE,1),0),  " +
       "    ROUND(NVL(A.HEALTH_COM_NET,0)*NVL(A.EXCHANGE_RATE,1) ,0),   " +
       "    ROUND(NVL(A.INCOME_AMT_AFTER,0)*NVL(A.EXCHANGE_RATE,1) ,0),   " +
       "    ROUND(NVL(A.ALLOW_AMT4,0)*NVL(A.EXCHANGE_RATE,1),0) house_company, " +
       "    ROUND(NVL(A.HOUSING_FEE,0)*NVL(A.EXCHANGE_RATE,1),0),  " +
       "    ROUND((NVL(A.NET_AMT,0) + NVL(A.HOUSING_FEE,0))*NVL(A.EXCHANGE_RATE,1),0),  " +
       "    ROUND(NVL(A.INCOME_BEFORE_TAX,0)*NVL(A.EXCHANGE_RATE,1),0),  " +
       "    ROUND(NVL(A.INCOME_TAX_NET,0)*NVL(A.EXCHANGE_RATE,1),0),   " +
       "    ROUND(NVL(A.INS_SALARY,0)*NVL(A.EXCHANGE_RATE,1),0), " +
       "    ROUND(NVL(A.HEALTH_45_AMT,0)*NVL(A.EXCHANGE_RATE,1),0),   " +
       "    ROUND((NVL(A.NET_AMT,0) + NVL(A.HOUSING_FEE,0) + NVL(A.INCOME_TAX_NET,0) + NVL(A.HEALTH_45_AMT,0))*NVL(A.EXCHANGE_RATE,1),0) total_cost  " +
       "    FROM THR_MONTH_SALARY A  " +
       "    WHERE A.DEL_IF=0 AND A.WORK_MON='" + p_work_mon + "'  " +
       "    and (a.tco_dept_pk in ( " +
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
        "   and decode('" + p_group + "','ALL','ALL',a.thr_group_pk)='" + p_group + "'" +
        "   and a.emp_id like '%" + p_emp_id + "%' " +
        "   and decode('" + p_status + "','ALL','ALL',a.status)='" + p_status + "'" +
        "   and decode('" + p_pay_type + "','ALL','ALL',a.pay_type)='" + p_pay_type + "'" +
        "   and decode('" + p_m_type + "','ALL','ALL',a.MONEY_KIND)='" + p_m_type + "'" +
        "   and decode('" + p_emp_type + "','ALL','ALL',A.EMPLOYEE_TYPE)='" + p_emp_type + "'" +
       "     AND NVL(A.NET_AMT,0) " + p_type +
       " ORDER BY A.DEPT_NM,A.THR_GROUP_NM,A.EMP_ID ";


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
        int pos = 6;
        int allow = 11, allow_k = 23, equip = 112;     //vi tri phu cap
        int pos_nt = 23;
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

        for (i = 0; i < irow_emp - 1; i++)
        {
            exSheet.Range[pos + i + 1, 1].Rows.EntireRow.Insert();
        }

        //Show data
        for (i = 0; i < irow_emp; i++)
        {
            for (k = 8; k < icol_emp; k++)
            {
                grant_total[k] = grant_total[k] + double.Parse(dt_emp.Rows[i][k].ToString());
            }
            emp_dept++;

            exSheet.Cells[pos + i, 1].Value = emp_dept;
            for (j = 2; j < icol_emp; j++)
            {
                if (j < 8 )
                    exSheet.Cells[pos + i, j].Value = dt_emp.Rows[i][j].ToString();
                else
                    exSheet.Cells[pos + i, j].Value = double.Parse(dt_emp.Rows[i][j].ToString());
            }


            if (i == irow_emp - 1)
            {
                exSheet.Cells[pos + i + 1, 1].Value = "Grant Total: " + dt_emp.Rows.Count + " employee(s)";
                //exSheet.Cells[pos + i + 2, 1, pos + i + 2, icol_emp - 1].Rows.Font.Bold = true;
                for (k = 8; k < icol_emp; k++)
                {
                    exSheet.Cells[pos + i + 1, k].Value = grant_total[k];
                }
            }

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
}