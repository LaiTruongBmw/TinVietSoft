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

public partial class rpt_hrpm00700_2 : System.Web.UI.Page
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

        string TemplateFile = "rpt_hrpm00700_2.xls";
        string TempFile = "../../../../system/temp/rpt_hrpm00700_2_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        string SQL
    = "SELECT A.FULL_NAME full_nm,   " +
        "         A.EMP_ID emp_id,   " +
        "         a.DEPT_NM dept_nm,   " +
        "         TO_CHAR (TO_DATE (A.JOIN_DT, 'yyyymmdd'), 'dd/mm/yyyy') join_dt,   " +
        "         (CASE   " +
        "             WHEN NVL (a.CONFIRM_DT, a.from_dt) > a.from_dt   " +
        "             THEN   " +
        "                ROUND (NVL (A.SALARY_LEVEL1, 0), 10)   " +
        "             ELSE   " +
        "                0   " +
        "          END)   " +
        "            sal_level1_7,   " +
        "         (CASE   " +
        "             WHEN NVL (a.CONFIRM_DT, a.to_dt) > a.to_DT THEN 0   " +
        "             ELSE ROUND (NVL (A.SALARY_LEVEL2, 0), 10)   " +
        "          END)   " +
        "            sal_level2,   " +
        "         ROUND (NVL (A.ALLOW_AMT1, 0), 10) allow_amt6,   " +
        "         ROUND (NVL (A.ALLOW_AMT2, 0), 10) allow_amt1,   " +
        "         ROUND (NVL (A.ALLOW_AMT3, 0), 10) allow_amt1,   " +
        "         ROUND (NVL (A.ALLOW_AMT4, 0), 10) allow_amt4,   " +
        "         ROUND (NVL (A.ALLOW_AMT5, 0), 10) allow_amt5,   " +
        "         ROUND (NVL (A.ALLOW_AMT6, 0), 10) allow_amt6,   " +
        "         ROUND (NVL (A.ALLOW_AMT7, 0), 10) allow_amt7,   " +
        "         ROUND (NVL (A.ALLOW_AMT8, 0), 10) allow_amt8,   " +
        "         ROUND (NVL (A.ALLOW_AMT9, 0), 10) allow_amt9,   " +
        "         ROUND (NVL (A.ALLOW_AMT10, 0), 10) allow_amt10,   " +
        "         ROUND (NVL (A.ALLOW_AMT11, 0), 10) allow_amt11,   " +
        "         ROUND (NVL (A.ALLOW_AMT12, 0), 10) allow_amt12,'',   " +
        "         ROUND (NVL (A.WT_L1_AMT, 0)+ NVL (a.HOL_DAY_L1_AMT, 0)+ NVL (A.WT_L2_AMT, 0)+ NVL (a.HOL_DAY_L2_AMT, 0),3) total_wd_amt_23,  " +
        "         ROUND (NVL (A.ABS_ALE_L1_AMT, 0) + NVL (A.ABS_ALE_L2_AMT, 0),3) abs_ale_amt,   " +
        "         ROUND (NVL (A.ABS_OTHER_PAY_L1_AMT, 0) + NVL (A.ABS_OTHER_PAY_L2_AMT, 0),3) abs_other_amt,   " +
        "         ROUND (NVL (A.OT_L1_AMT, 0) + NVL (A.OT_L2_AMT, 0), 3) ot_amt,   " +
        "         ROUND (NVL (A.ST_L1_AMT, 0) + NVL (A.OST_L1_AMT, 0) + NVL (A.OST_L2_AMT, 0) + NVL (A.ST_L2_AMT, 0), 3) st_amt,   " +
        "         ROUND (NVL (A.HT_L1_AMT, 0) + NVL (A.OHT_L1_AMT, 0) + NVL (A.HT_L2_AMT, 0) + NVL (A.OHT_L2_AMT, 0), 3) hol_amt,   " +
        "         ROUND (NVL (A.NT_30_L1_AMT, 0) + NVL (A.NT_30_L2_AMT, 0), 3) nt30_amt,   " +
        "         ROUND (NVL (A.NT_45_L1_AMT, 0) + NVL (A.NT_45_L2_AMT, 0) + NVL (A.NT_45_2_L1_AMT, 0) + NVL (A.NT_45_2_L2_AMT, 0), 3) nt45_amt,   " +
        "         ROUND (NVL (A.NT_60_L1_AMT, 0) + NVL (A.NT_60_L2_AMT, 0), 3) nt60_amt,   " +
        "         ROUND (NVL (A.NT_90_L1_AMT, 0) + NVL (A.NT_90_L2_AMT, 0), 3) nt90_amt_34, " +
        "         ROUND (NVL (A.RETURN_AMT, 0), 3) return_amt_36, " +
        "         ROUND (NVL (A.INC_AMT, 0) + NVL (A.BONUS_YEARLY_AMT, 0), 3) inc_amt, " +
        "         ROUND (NVL (A.ALE_STOP_AMT, 0), 3) ale_stop_amt,     " +
        "         ROUND (NVL (A.SEVERANCE_AMT, 0), 3) severance_amt, " +
        "         ROUND (NVL (A.GROSS_AMT, 0), 3) gross_amt,   " +
        "         ROUND (NVL (A.BREAK_CONTRACT_AMT, 0), 3) break_day_amt,   " +
        "         ROUND (NVL (A.SOCIAL_AMT, 0), 3) total_ins_amt, " +
        "         ROUND (NVL (A.HEALTH_AMT, 0), 3) health_amt, " +
        "         ROUND (NVL (A.UNEMP_INS, 0), 3) unemp_amt,   " +
        "         ROUND (NVL (A.ADVANCE_AMT, 0), 3) advance_amt,   " +
        "         ROUND (NVL (A.EQUIP1_AMT, 0), 3) uniform_amt,   " +
        "         ROUND (NVL (A.OT_TAX_L1_AMT, 0) + NVL (A.OT_TAX_L2_AMT, 0), 3) ot_100_amt, " +
        "         ROUND (NVL (A.DEDUCT_PIT, 0), 3) deduct_pit, " +
        "         ROUND (NVL (A.INCOME_BEFORE_TAX, 0), 3) income_amt, " +
        "         ROUND (NVL (A.INCOME_TAX, 0), 3) income_tax,   " +
        "         ROUND (NVL (A.UNION_AMT, 0), 3) union_amt,   " +
        "         ROUND (NVL (A.RETURN_NO_PIT, 0) , 3) return_no_pit,   " +
        "         ROUND (NVL (A.ADVANCE_NO_PIT, 0), 3) advance_no_pit,  " +
        "         0 pit_final,  " +
        "         ROUND (NVL (A.NET_AMT, 0), 2) net_amt_46,   " +
        "         ROUND (NVL (A.WT_L1, 0) / 8  + NVL (a.HOL_DAY_L1, 0),0) wd_l1,   " +
        "         ROUND (NVL (A.ABS_ALE_L1, 0) / 8,0) ale_l1, " +
        "         ROUND (NVL (A.ABS_OTHER_PAY_L1, 0)/8,0) abs_other_l1, " +
        "         ROUND (NVL (A.OT_L1, 0),0) ot_l1, " +
        "         ROUND (NVL (A.ST_L1, 0) + NVL (A.OST_L1, 0),0) st_l1,  " +
        "         ROUND (NVL (A.HT_L1, 0) + NVL (A.OHT_L1, 0),0) ht_l1,  " +
        "         ROUND (NVL (A.NT_30_L1, 0), 0) ,  " +
        "         ROUND (NVL (A.NT_45_L1, 0) + NVL (A.NT_45_2_L1, 0), 0) ,  " +
        "         ROUND (NVL (A.NT_60_L1, 0), 0) ,  " +
        "         ROUND (NVL (A.NT_90_L1, 0), 0) ,     " +
        "         ROUND (NVL (A.WT_L2, 0) / 8 + NVL (a.HOL_DAY_L2, 0) , 2) wd_l2, " +
        "         ROUND (NVL (A.ABS_ALE_L2, 0) / 8, 2) ale_l2, " +
        "         ROUND (NVL (A.ABS_OTHER_PAY_L2, 0)/8,3) abs_other_l2, " +
        "         ROUND (NVL (A.OT_L2, 0), 3) ot_l2, " +
        "         ROUND (NVL (A.OST_L2, 0) + NVL (A.ST_L2, 0),3) ot_l2, " +
        "         ROUND (NVL (A.HT_L2, 0) + NVL (A.OHT_L2, 0), 3) ot_hol_52,   " +
        "         ROUND (NVL (A.NT_30_L2, 0), 3) nt30,  " +
        "         ROUND (NVL (A.NT_45_L2, 0) + NVL (A.NT_45_2_L2, 0), 3) nt45,  " +
        "         ROUND (NVL (A.NT_60_L2, 0), 3) nt60,  " +
        "         ROUND (NVL (A.NT_90_L2, 0), 3) nt90,  " +
        "         ROUND (NVL (A.ALE_STOP, 0), 3) ale_stop, " +
        "         ROUND (NVL (A.SEVERANCE_MONTH, 0), 3) severance_month " +
        "    FROM thr_month_salary a,   " +
        "         tco_org b, thr_work_group c   " +
        "   WHERE     a.del_if = 0 and c.del_if =0   " +
        "         AND a.work_mon = '" + p_work_mon + "'   " +
        "         AND b.del_if = 0   " +
        "         AND a.tco_dept_pk = b.pk   " +
        "         AND A.THR_GROUP_PK = c.pk " +
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
        "ORDER BY C.WORKGROUP_NM,nvl(b.seq,0),A.DEPT_NM, a.emp_id   ";

        //Response.Write(SQL);
        //Response.End();
        DataTable dt_emp = CtlLib.TableReadOpen(SQL);
        int irow = dt_emp.Rows.Count;
        int icol = dt_emp.Columns.Count;

        if (irow == 0)
        {
            Response.Write("There is no data of salary.");
            Response.End();
        }

        string para_com = "'" + p_dept + "','" + p_work_mon + "'";
        DataTable dt_com = CtlLib.TableReadOpenCursor("ST_HR_RPT_CO_COMPANY", para_com);


        DataTable dt_allow = CtlLib.TableReadOpenCursor("ST_HR_RPT_CO_ALLOW_SALARY");


        //Khai bao bien
        int i, j;
        int loop_row = 51, stt = 0;
        int r_allow = 9;
        string allow_a = "";
        double allow_amt = 0;
        //Insert new row

        for (i = 1; i < irow; i++)
        {
            //exSheet.Range[2, 7, 54, 7].Rows.EntireRow.Insert();
            exSheet.Range["A1:G" + loop_row].Copy(exSheet.Range["A" + (loop_row * i + 1) + ":G" + (loop_row + loop_row * i)], XlPasteType.xlPasteAll);

            for (j = 1; j < loop_row; j++)
                exSheet.Range[loop_row * i + j, 1].RowHeight = exSheet.Range[j, 1].RowHeight;


        }

        //Show data
        for (i = 0; i < irow; i++)
        {
            //insert picture
            if (dt_com.Rows[0]["image"].ToString() != "")
            {
                byte[] MyData = new byte[0];
                MyData = (byte[])dt_com.Rows[0]["image"];
                MemoryStream stream = new MemoryStream(MyData);

                Bitmap b = new Bitmap(stream);
                exSheet.Cells[1 + loop_row * i, 1].Select();
                exSheet.Shapes.AddPicture(ResizeImage(b, 140, 60));
            }   
            stt++;

            exSheet.Cells["B" + (2 + loop_row * i)].Value = "PAY-SLIP IN " + dt_com.Rows[0][4].ToString();
            exSheet.Cells["B" + (3 + loop_row * i)].Value = "PHIẾU LƯƠNG THÁNG " + dt_com.Rows[0][5].ToString();

            exSheet.Cells["A" + (4 + loop_row * i)].Value = string.Format("Họ tên: {0}", dt_emp.Rows[i]["full_nm"].ToString());
            exSheet.Cells["B" + (5 + loop_row * i)].Value = dt_emp.Rows[i]["emp_id"].ToString();
            exSheet.Cells["F" + (5 + loop_row * i)].Value = dt_emp.Rows[i]["dept_nm"].ToString();
            exSheet.Cells["B" + (6 + loop_row * i)].Value = dt_emp.Rows[i]["join_dt"].ToString();
            exSheet.Cells["D" + (8 + loop_row * i)].Value = double.Parse(dt_emp.Rows[i]["sal_level1_7"].ToString());
            exSheet.Cells["F" + (8 + loop_row * i)].Value = double.Parse(dt_emp.Rows[i]["sal_level2"].ToString());

            //ten phu cap
            
            for (j = 0; j < 12; j++)
            {
                exSheet.Cells["A" + (r_allow + j + loop_row * i)].Value = dt_allow.Rows[0][24 + j].ToString();
                exSheet.Cells["B" + (r_allow + j + loop_row * i)].Value = string.Format("({0})", dt_allow.Rows[0][0 + j].ToString());
            }

            //cot tien tu dong 9 den dong 47
            int k = 6;
            for (j = 0; j < 43; j++)
            {
                if (j != 12)
                    exSheet.Cells["G" + (9 + j + loop_row * i)].Value = double.Parse(dt_emp.Rows[i][j + k].ToString());
            }

            //Ngay cong, gio tang ca l1
            k += 43;
            for (j = 0; j < 10; j++)
            {
                exSheet.Cells["D" + (22 + j + loop_row * i)].Value = double.Parse(dt_emp.Rows[i][j + k].ToString());
            }
            //Ngay cong, gio tang ca l1
            k += 10;
            for (j = 0; j < 10; j++)
            {
                exSheet.Cells["E" + (22 + j + loop_row * i)].Value = double.Parse(dt_emp.Rows[i][j + k].ToString());
            }

            k += 10;
            exSheet.Cells["D" + (34 + loop_row * i)].Value = double.Parse(dt_emp.Rows[i]["ale_stop"].ToString());
            exSheet.Cells["D" + (35 + loop_row * i)].Value = double.Parse(dt_emp.Rows[i]["severance_month"].ToString());

            //Insert page break
            IPageBreaks pbs = exBook.Worksheets[1].HPageBreaks;
            IRange usedrange = exBook.Worksheets[1].UsedRange;
            //pbs.Reset();
            pbs.Add(usedrange.Rows[loop_row + loop_row * i + 1]);
            //end insert page beak

            //Hide allowance row allowance
            for (j = 0; j < 12; j++)
            {
                if (dt_allow.Rows[0][j + 12].ToString() != "1")
                    exSheet.Range["A" + (r_allow + j + loop_row * i)].Rows.Hidden = true;


            }
        }

        //Hide row


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