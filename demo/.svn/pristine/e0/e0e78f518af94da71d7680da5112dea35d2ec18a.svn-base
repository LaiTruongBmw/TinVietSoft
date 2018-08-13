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

public partial class rpt_hrpm00700_12 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string l_group = Request.QueryString["l_group"].ToString();
        string l_pay_type = Request.QueryString["l_pay_type"].ToString();
        string l_m_type = Request.QueryString["l_m_type"].ToString();
        string l_bn_times = Request.QueryString["l_bn_times"].ToString();
        string l_emp_id = Request.QueryString["l_emp_id"].ToString();
        string l_dept = Request.QueryString["l_dept"].ToString();
        string l_year = Request.QueryString["l_year"].ToString();

        string TemplateFile = "rpt_hrpm00700_12.xls";
        string TempFile = "../../../../system/temp/rpt_hrpm00700_12_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;
        string SQL
        = "  SELECT '', " +
        "         '', " +
        "         org.org_nm dept_nm, " +
        "         te.EMP_ID, " +
        "         te.FULL_NAME, " +
        "         TO_CHAR (TO_DATE (te.JOIN_DT, 'yyyymmdd'), 'dd-mm-yyyy') join_dt, " +
        "         ROUND (NVL (tb.SENIORITY, 0), 2), " +
        "         ROUND (NVL (tb.SALARY, 0), 2), " +
        "         ROUND (NVL (tb.RATIO, 0), 2), " +
        "         CASE " +
        "            WHEN tb.MONEY_KIND = '02' " +
        "            THEN " +
        "               ROUND (tb.BN_AMT * NVL (tb.BN_EXT_RATE, 0), 3) " +
        "            ELSE " +
        "               ROUND (NVL (tb.BN_AMT, 0), 0) " +
        "         END " +
        "            AS bonus_amt " +
        "    FROM thr_bonus tb, " +
        "         thr_work_group tg, " +
        "         thr_employee te, " +
        "         tco_org org " +
        "   WHERE     tb.DEL_IF = 0 " +
        "         AND org.del_if = 0 " +
        "         AND org.pk = te.tco_org_pk " +
        "         AND NVL (tb.BN_AMT, 0) > 0 " +
        "         AND te.DEL_IF = 0 " +
        "         AND tg.DEL_IF = 0 " +
        "         AND tb.THR_EMP_PK = te.pk " +
        "         AND tg.PK = te.THR_wG_PK " +
        "         AND tb.BN_YEAR = '" + l_year + "' " +
        "    and decode('" + l_group + "','ALL','" + l_group + "',te.THR_wg_PK)='" + l_group + "'  " +
        "    and decode('" + l_pay_type + "','ALL','" + l_pay_type + "',tb.PAY_TYPE)='" + l_pay_type + "'  " +
        "    and decode('" + l_m_type + "','ALL','" + l_m_type + "',tb.MONEY_KIND)='" + l_m_type + "'  " +
        "    and decode('" + l_bn_times + "','ALL','" + l_bn_times + "',tb.BN_TIMES)='" + l_bn_times + "'  " +
        "    and (te.EMP_ID like  '%'||'" + l_emp_id + "'||'%' or '" + l_emp_id + "' is null) " +
        "    and (te.TCO_org_PK in   (  " +
        "                              SELECT     g.pk  " +
        "                                    FROM tco_org g  " +
        "                                   WHERE g.del_if = 0  " +
        "                              START WITH g.pk =  " +
        "                                            DECODE ('" + l_dept + "',  " +
        "                                                    'ALL', 0,  " +
        "                                                    '" + l_dept + "'  " +
        "                                                   )  " +
        "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
        "            OR '" + l_dept + "' = 'ALL')  " +
        "ORDER BY org.org_nm, te.EMP_ID ";

        
        // Response.Write(SQL);
        // Response.End();


        DataTable dt_emp = CtlLib.TableReadOpen(SQL);
        int irow_emp, icol_emp;
        irow_emp = dt_emp.Rows.Count;
        icol_emp = dt_emp.Columns.Count;
        if (irow_emp == 0)
        {
            Response.Write("There is no data of salary");
            Response.End();
        }

        
        
        //Khai bao bien
        int i, j;
        int pos = 5;
        int emp_dept = 0, n_dept = 0;
        double sub_total1 = 0, sub_total2 = 0, grand_total1 = 0, grand_total2 = 0;

        //-----header---   
        exSheet.Cells["F2"].Value = "Bonus Year: " + l_year;
        exSheet.Cells["H2"].Value = "Times " + l_bn_times;

        for (i = 0; i < irow_emp - 1; i++)
        {
            j = i + 1;
            if (dt_emp.Rows[i]["dept_nm"].ToString() != dt_emp.Rows[j]["dept_nm"].ToString()) 
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
            sub_total1 = sub_total1 + double.Parse(dt_emp.Rows[i][7].ToString());
            sub_total2 = sub_total2 + double.Parse(dt_emp.Rows[i][9].ToString());
            grand_total1 = grand_total1 + double.Parse(dt_emp.Rows[i][7].ToString());
            grand_total2 = grand_total2 + double.Parse(dt_emp.Rows[i][9].ToString());

            emp_dept++;

            exSheet.Cells[pos + i, 1].Value = emp_dept;

            for (j = 2; j < icol_emp; j++)
            {
                if (j <= 5)
                    exSheet.Cells[pos + i, j].Value = dt_emp.Rows[i][j].ToString();
                else
                    exSheet.Cells[pos + i, j].Value = double.Parse(dt_emp.Rows[i][j].ToString());

            }

            if (i != irow_emp - 1 && (dt_emp.Rows[i]["dept_nm"].ToString() != dt_emp.Rows[i + 1]["dept_nm"].ToString()))
            {
                exSheet.Cells[pos + i + 1, 1, pos + i + 1, 5].Merge();
                exSheet.Cells[pos + i + 1, 1].Value = "Sub Total " + dt_emp.Rows[i]["dept_nm"].ToString() + " (" + emp_dept + " employees)";
                exSheet.Cells[pos + i + 1, 1, pos + i + 1, icol_emp - 1].Rows.Font.Bold = true;
                exSheet.Cells[pos + i + 1, 1, pos + i + 1, icol_emp - 1].Interior.Color = Color.FromArgb(204, 255, 204);    //to mau cho sub

                exSheet.Cells[pos + i + 1, 7].Value = sub_total1;
                exSheet.Cells[pos + i + 1, 9].Value = sub_total2;

                sub_total1 = sub_total2 = 0;

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
                exSheet.Cells[pos + i + 1, 1].Value = "Total " + dt_emp.Rows[i]["dept_nm"].ToString() + ": " + emp_dept + " employee(s)";
                exSheet.Cells[pos + i + 2, 1].Value = "Grant Total: " + irow_emp + " employee(s)";

                exSheet.Cells[pos + i + 1, 7].Value = sub_total1;
                exSheet.Cells[pos + i + 1, 9].Value = sub_total2;
                exSheet.Cells[pos + i + 2, 7].Value = grand_total1;
                exSheet.Cells[pos + i + 2, 9].Value = grand_total2;
                
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