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

public partial class reports_ch_rm_rpt_chrm00020_3 : System.Web.UI.Page
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

        string TemplateFile = "rpt_chrm00020_3.xls";
        string TempFile = "../../../../system/temp/rpt_chrm00020_3_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        string SQL_CODE
        = "SELECT code,code_nm " +
        "    FROM vhr_hr_code c " +
        "   WHERE id = 'HR0191' ";

        DataTable dt_hr_code = CtlLib.TableReadOpen(SQL_CODE);


        //======================================================================================================================
        string SQL_1
        = "SELECT 1 seq, " +
        "       NVL (A.MEAL_EMP_TYPE, ' ') meal_emp_type, " +
        "       (    SELECT g.ORG_NM " +
        "              FROM TCO_ORG g " +
        "             WHERE g.del_if = 0 AND G.ORG_TYPE = '06' " +
        "        START WITH g.pk = b.pk " +
        "        CONNECT BY PRIOR g.p_pk = g.pk) " +
        "          DIV_NM, " +
        "       B.ORG_NM dept_nm, c.WORKGROUP_NM group_nm, " +
        "       A.EMP_ID, " +
        "       A.FULL_NM, " +
        "       TO_CHAR (TO_DATE (A.JOIN_DT, 'yyyymmdd'), 'dd/mm/yyyy'), " +
        "       NVL(A.MEAL_TIME_01,0), " +
        "       NVL(A.MEAL_TIME_01_AMT,0),  " +
        "       NVL(A.MEAL_TIME_02,0), " +
        "       NVL(A.MEAL_TIME_02_AMT,0), " +
        "       NVL(A.MEAL_TIME_03,0), " +
        "       NVL(A.MEAL_TIME_03_AMT,0), " +
        "       NVL(A.MEAL_TIME_04,0), " +
        "       NVL(A.MEAL_TIME_04_AMT,0),  " +
        "       NVL (A.MEAL_MAIN_QTY, 0) + NVL (A.SNACK_TIME_QTY, 0), " +
        "       NVL (A.MEAL_MAIN_AMT, 0) + NVL (A.SNACK_TIME_AMT, 0) " +
        "  FROM thr_meal_month a, tco_org b, thr_work_group c " +
        " WHERE     a.del_if = 0 and c.del_if = 0 " +
        "       AND b.del_if = 0 " +
        "       AND A.TCO_ORG_PK = B.PK and a.thr_wg_pk = c.pk " +
        "       AND A.MEAL_EMP_TYPE = 'IN' " +
        "       AND A.WORK_MON = '" + p_work_mon + "' " +
        "       AND DECODE ('" + p_group_pk + "', 'ALL', 'ALL', A.THR_WG_PK) = '" + p_group_pk + "' " +
        "       AND A.TCO_ORG_PK IN " +
        "              (    SELECT g.pk " +
        "                     FROM TCO_ORG g " +
        "                    WHERE g.del_if = 0 " +
        "               START WITH g.pk = " +
        "                             CASE " +
        "                                WHEN '" + p_dept_pk + "' = 'ALL' THEN g.pk " +
        "                                ELSE TO_NUMBER ('" + p_dept_pk + "') " +
        "                             END " +
        "               CONNECT BY PRIOR g.pk = g.p_pk) " +
        " ORDER BY seq, " +
        "         DIV_NM, " +
        "         dept_nm, " +
        "         EMP_ID ";

        //======================================================================================================================
        string SQL_2
        = "SELECT 2 seq, " +
        "       NVL (A.MEAL_EMP_TYPE, ' '), " +
        "       '' DIV_NM, " +
        "       '' dept_nm,'' group_nm, " +
        "       A.EMP_ID, " +
        "       A.FULL_NM, " +
        "       TO_CHAR (TO_DATE (A.JOIN_DT, 'yyyymmdd'), 'dd/mm/yyyy'), " +
        "       NVL(A.MEAL_TIME_01,0), " +
        "       NVL(A.MEAL_TIME_01_AMT,0),  " +
        "       NVL(A.MEAL_TIME_02,0), " +
        "       NVL(A.MEAL_TIME_02_AMT,0), " +
        "       NVL(A.MEAL_TIME_03,0), " +
        "       NVL(A.MEAL_TIME_03_AMT,0), " +
        "       NVL(A.MEAL_TIME_04,0), " +
        "       NVL(A.MEAL_TIME_04_AMT,0),  " +
        "       NVL (A.MEAL_MAIN_QTY, 0) + NVL (A.SNACK_TIME_QTY, 0), " +
        "       NVL (A.MEAL_MAIN_AMT, 0) + NVL (A.SNACK_TIME_AMT, 0) " +
        "  FROM thr_meal_month a " +
        " WHERE a.del_if = 0 AND A.MEAL_EMP_TYPE = 'OUT' AND A.WORK_MON = '" + p_work_mon + "' ";

        //======================================================================================================================
        string SQL_3
        = "SELECT 3 seq, " +
        "       NVL (A.MEAL_EMP_TYPE, ' '), " +
        "       '' DIV_NM, " +
        "       '' dept_nm,'' group_nm, " +
        "       A.EMP_ID, " +
        "       A.FULL_NM, " +
        "       TO_CHAR (TO_DATE (A.JOIN_DT, 'yyyymmdd'), 'dd/mm/yyyy'), " +
        "       NVL(A.MEAL_TIME_01,0), " +
        "       NVL(A.MEAL_TIME_01_AMT,0),  " +
        "       NVL(A.MEAL_TIME_02,0), " +
        "       NVL(A.MEAL_TIME_02_AMT,0), " +
        "       NVL(A.MEAL_TIME_03,0), " +
        "       NVL(A.MEAL_TIME_03_AMT,0), " +
        "       NVL(A.MEAL_TIME_04,0), " +
        "       NVL(A.MEAL_TIME_04_AMT,0),  " +
        "       NVL (A.MEAL_MAIN_QTY, 0) + NVL (A.SNACK_TIME_QTY, 0), " +
        "       NVL (A.MEAL_MAIN_AMT, 0) + NVL (A.SNACK_TIME_AMT, 0) " +
        "  FROM thr_meal_month a " +
        " WHERE a.del_if = 0 AND A.MEAL_EMP_TYPE IS NULL AND A.WORK_MON = '" + p_work_mon + "' ";

        //======================================================================================================================
        string SQL_ALL
        = "SELECT 1 seq, " +
        "       NVL (A.MEAL_EMP_TYPE, ' ') meal_emp_type, " +
        "       (    SELECT g.ORG_NM " +
        "              FROM TCO_ORG g " +
        "             WHERE g.del_if = 0 AND G.ORG_TYPE = '06' " +
        "        START WITH g.pk = b.pk " +
        "        CONNECT BY PRIOR g.p_pk = g.pk) " +
        "          DIV_NM, " +
        "       B.ORG_NM dept_nm,c.WORKGROUP_NM group_nm, " +
        "       A.EMP_ID, " +
        "       A.FULL_NM, " +
        "       TO_CHAR (TO_DATE (A.JOIN_DT, 'yyyymmdd'), 'dd/mm/yyyy'), " +
        "       NVL(A.MEAL_TIME_01,0), " +
        "       NVL(A.MEAL_TIME_01_AMT,0),  " +
        "       NVL(A.MEAL_TIME_02,0), " +
        "       NVL(A.MEAL_TIME_02_AMT,0), " +
        "       NVL(A.MEAL_TIME_03,0), " +
        "       NVL(A.MEAL_TIME_03_AMT,0), " +
        "       NVL(A.MEAL_TIME_04,0), " +
        "       NVL(A.MEAL_TIME_04_AMT,0),  " +
        "       NVL (A.MEAL_MAIN_QTY, 0) + NVL (A.SNACK_TIME_QTY, 0), " +
        "       NVL (A.MEAL_MAIN_AMT, 0) + NVL (A.SNACK_TIME_AMT, 0) " +
        "  FROM thr_meal_month a, tco_org b, thr_work_group c " +
        " WHERE     a.del_if = 0 and c.del_if = 0 " +
        "       AND b.del_if = 0 " +
        "       AND A.TCO_ORG_PK = B.PK and a.thr_wg_pk = c.pk " +
        "       AND A.MEAL_EMP_TYPE = 'IN' " +
        "       AND A.WORK_MON = '" + p_work_mon + "' " +
        "       AND DECODE ('ALL', 'ALL', 'ALL', A.THR_WG_PK) = 'ALL' " +
        "       AND A.TCO_ORG_PK IN " +
        "              (    SELECT g.pk " +
        "                     FROM TCO_ORG g " +
        "                    WHERE g.del_if = 0 " +
        "               START WITH g.pk = " +
        "                             CASE " +
        "                                WHEN '" + p_dept_pk + "' = 'ALL' THEN g.pk " +
        "                                ELSE TO_NUMBER ('" + p_dept_pk + "') " +
        "                             END " +
        "               CONNECT BY PRIOR g.pk = g.p_pk) " +
        "UNION ALL " +
        "SELECT 2 seq, " +
        "       NVL (A.MEAL_EMP_TYPE, ' '), " +
        "       '' DIV_NM, " +
        "       '' dept_nm,'' group_nm, " +
        "       A.EMP_ID, " +
        "       A.FULL_NM, " +
        "       TO_CHAR (TO_DATE (A.JOIN_DT, 'yyyymmdd'), 'dd/mm/yyyy'), " +
        "       NVL(A.MEAL_TIME_01,0), " +
        "       NVL(A.MEAL_TIME_01_AMT,0),  " +
        "       NVL(A.MEAL_TIME_02,0), " +
        "       NVL(A.MEAL_TIME_02_AMT,0), " +
        "       NVL(A.MEAL_TIME_03,0), " +
        "       NVL(A.MEAL_TIME_03_AMT,0), " +
        "       NVL(A.MEAL_TIME_04,0), " +
        "       NVL(A.MEAL_TIME_04_AMT,0),  " +
        "       NVL (A.MEAL_MAIN_QTY, 0) + NVL (A.SNACK_TIME_QTY, 0), " +
        "       NVL (A.MEAL_MAIN_AMT, 0) + NVL (A.SNACK_TIME_AMT, 0) " +
        "  FROM thr_meal_month a " +
        " WHERE a.del_if = 0 AND A.MEAL_EMP_TYPE = 'OUT' AND A.WORK_MON = '" + p_work_mon + "' " +
        "UNION ALL " +
        "SELECT 3 seq, " +
        "       NVL (A.MEAL_EMP_TYPE, ' '), " +
        "       '' DIV_NM, " +
        "       '' dept_nm,'' group_nm, " +
        "       A.EMP_ID, " +
        "       A.FULL_NM, " +
        "       TO_CHAR (TO_DATE (A.JOIN_DT, 'yyyymmdd'), 'dd/mm/yyyy'), " +
        "       NVL(A.MEAL_TIME_01,0), " +
        "       NVL(A.MEAL_TIME_01_AMT,0),  " +
        "       NVL(A.MEAL_TIME_02,0), " +
        "       NVL(A.MEAL_TIME_02_AMT,0), " +
        "       NVL(A.MEAL_TIME_03,0), " +
        "       NVL(A.MEAL_TIME_03_AMT,0), " +
        "       NVL(A.MEAL_TIME_04,0), " +
        "       NVL(A.MEAL_TIME_04_AMT,0),  " +
        "       NVL (A.MEAL_MAIN_QTY, 0) + NVL (A.SNACK_TIME_QTY, 0), " +
        "       NVL (A.MEAL_MAIN_AMT, 0) + NVL (A.SNACK_TIME_AMT, 0) " +
        "  FROM thr_meal_month a " +
        " WHERE a.del_if = 0 AND A.MEAL_EMP_TYPE IS NULL AND A.WORK_MON = '" + p_work_mon + "' " +
        "ORDER BY seq, " +
        "         DIV_NM, " +
        "         dept_nm, " +
        "         EMP_ID ";

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
        int i, j, k, pos = 6;
        int ntotal = icol - 8, nseq = 0, ndiv = 0;        //8 cot khong sum
        double[] s_total = new double[ntotal];
        double[] g_total = new double[ntotal];
        double[] d_total = new double[ntotal];      //div_total
        int ncount = 0, scount = 0;

        for (j = 0; j < ntotal; j++)
        {
            s_total[j] = 0;
            g_total[j] = 0;
            d_total[j] = 0;
        }

        //Dem so luong thay doi meal type
        for (i = 0; i < irow - 1; i++)
        {
            if (dt_emp.Rows[i]["seq"].ToString() != dt_emp.Rows[i + 1]["seq"].ToString())
                nseq++;

            if (dt_emp.Rows[i]["div_nm"].ToString() != dt_emp.Rows[i + 1]["div_nm"].ToString() && dt_emp.Rows[i]["div_nm"].ToString() != "")
                ndiv++;
        }
        //Insert new row

        for (i = 0; i < irow - 1 + nseq + ndiv; i++)
        {
            exSheet.Range[pos + 1, 1].Rows.EntireRow.Insert();
        }

        //Title value
        exSheet.Cells["F2"].Value = p_from_dt.Substring(6, 2).ToString() + "/" + p_from_dt.Substring(4, 2).ToString() + "/" + p_from_dt.Substring(0, 4).ToString();
        exSheet.Cells["I2"].Value = p_to_dt.Substring(6, 2).ToString() + "/" + p_to_dt.Substring(4, 2).ToString() + "/" + p_to_dt.Substring(0, 4).ToString();

        exSheet.Cells["H4"].Value = dt_hr_code.Rows[0][1].ToString();
        exSheet.Cells["J4"].Value = dt_hr_code.Rows[1][1].ToString();
        exSheet.Cells["L4"].Value = dt_hr_code.Rows[2][1].ToString();
        exSheet.Cells["N4"].Value = dt_hr_code.Rows[3][1].ToString();

        //Show data
        for (i = 0; i < irow; i++)
        {
            for (k = 0; k < ntotal; k++)
            {
                s_total[k] = s_total[k] + double.Parse(dt_emp.Rows[i][k + 8].ToString());
                g_total[k] = g_total[k] + double.Parse(dt_emp.Rows[i][k + 8].ToString());
                d_total[k] = d_total[k] + double.Parse(dt_emp.Rows[i][k + 8].ToString());
            }
            ncount++;
            scount++;
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

            else
            {
                
                if (dt_emp.Rows[i]["seq"].ToString() != dt_emp.Rows[i + 1]["seq"].ToString())
                {
                    if (dt_emp.Rows[i]["div_nm"].ToString() != "")
                    {
                        exSheet.Cells[pos + i + 1, 1, pos + i + 1, 7].Merge();
                        exSheet.Cells[pos + i + 1, 1, pos + i + 1, icol].Font.Bold = true;
                        exSheet.Cells[pos + i + 1, 1].HorizontalAlignment = XlHAlign.xlHAlignCenter;
                        exSheet.Cells[pos + i + 1, 1].Value = "Total " + dt_emp.Rows[i]["div_nm"].ToString() + " " + ncount + " employees";

                        for (k = 0; k < ntotal; k++)
                        {
                            exSheet.Cells[pos + i + 1, k + 8].Value = d_total[k];
                            d_total[k] = 0;
                        }

                        ncount = 0;
                        pos++;
                    }

                    exSheet.Cells[pos + i + 1, 1, pos + i + 1, 7].Merge();
                    exSheet.Cells[pos + i + 1, 1, pos + i + 1, icol].Font.Bold = true;
                    exSheet.Cells[pos + i + 1, 1].HorizontalAlignment = XlHAlign.xlHAlignCenter;
                    exSheet.Cells[pos + i + 1, 1].Value = "Total " + scount + " employees";

                    for (k = 0; k < ntotal; k++)
                    {
                        exSheet.Cells[pos + i + 1, k + 8].Value = s_total[k];
                        s_total[k] = 0;
                    }

                    ncount = 0;
                    pos++;
                }
                else if (dt_emp.Rows[i]["div_nm"].ToString() != dt_emp.Rows[i + 1]["div_nm"].ToString() && dt_emp.Rows[i]["div_nm"].ToString() != "")
                {
                    exSheet.Cells[pos + i + 1, 1, pos + i + 1, 7].Merge();
                    exSheet.Cells[pos + i + 1, 1, pos + i + 1, icol].Font.Bold = true;
                    exSheet.Cells[pos + i + 1, 1].HorizontalAlignment = XlHAlign.xlHAlignCenter;
                    exSheet.Cells[pos + i + 1, 1].Value = "Total " + dt_emp.Rows[i]["div_nm"].ToString() + " " + ncount + " employees";

                    for (k = 0; k < ntotal; k++)
                    {
                        exSheet.Cells[pos + i + 1, k + 8].Value = d_total[k];
                        d_total[k] = 0;
                    }

                    ncount = 0;
                    pos++;
                }

            }
        }

        //Xóa cột dư ở những tháng không đủ 31 ngày


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