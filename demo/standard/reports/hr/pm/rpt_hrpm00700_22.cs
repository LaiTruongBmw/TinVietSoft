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

public partial class rpt_hrpm00700_22 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string p_year, p_from_mon, p_to_mon, p_tco_dept_pk;

        p_year = Request["p_year"].ToString();
        p_from_mon = Request["p_month_from"].ToString();
        p_to_mon = Request["p_month_to"].ToString();
        p_tco_dept_pk = "ALL";

        string TemplateFile = "rpt_hrpm00700_22.xls";
        string TempFile = "../../../../system/temp/rpt_hrpm00700_22_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        int i, j, k;


        //-----------------information of company-----------------
        string SQL_Com
        = "select  a.PARTNER_LNAME,a.ADDR1,a.PHONE_NO,a.TCO_BPPHOTO_PK,to_char(to_date('" + p_from_mon + "','yyyymm'),'MM/YYYY'),to_char(to_date('" + p_to_mon + "','yyyymm'),'MM/YYYY') " +
            "from tco_company a " +
            "where a.DEL_IF=0 " +
            "and a.pk in ( select tco_company_pk from  " +
            "               tco_org  f " +
            "               where  f.pk IN ( " +
            "                              SELECT     g.pk " +
            "                                    FROM tco_org g " +
            "                                   WHERE g.del_if = 0 " +
            "                              START WITH g.pk = " +
            "                                            DECODE ('" + p_tco_dept_pk + "', " +
            "                                                    'ALL', 0, " +
            "                                                    '" + p_tco_dept_pk + "' " +
            "                                                   ) " +
            "                              CONNECT BY PRIOR g.pk = g.p_pk) " +
            "                        OR '" + p_tco_dept_pk + "' = 'ALL') " +
            "and rownum=1 ";

        //Response.Write(SQL_Com);
        //Response.End();
        DataTable dt_com = CtlLib.TableReadOpen(SQL_Com);
        int irow_com;
        irow_com = dt_com.Rows.Count;
        if (irow_com == 0)
        {
            Response.Write("There is no data of company");
            Response.End();
        }

        //Dem so thang user muon xuat
        string SQL
        = "select months_between(to_date('" + p_to_mon + "','yyyymm'),to_date('" + p_from_mon + "','yyyymm')) + 1 from dual";

        DataTable dt_mon = CtlLib.TableReadOpen(SQL);
        int month_num = int.Parse(dt_mon.Rows[0][0].ToString());
        DateTime[] aDate = new DateTime[month_num];
        DateTime Cur_Date = new DateTime(int.Parse(p_from_mon.Substring(0, 4).ToString()), int.Parse(p_from_mon.Substring(4, 2).ToString()), 1);

        SQL
        = "SELECT a.pk " +
        "       ,(select decode(code,'01','Vietnamese','Foreigner') from vhr_hr_code where id='HR0009' and code = a.nation) nation " +
        "       ,a.emp_id " +
        "       ,a.full_name,a.PIT_TAX_NO,A.PERSON_ID " +
        "       ,TO_CHAR (TO_DATE (a.join_dt, 'yyyymmdd'), 'dd/mm/yyyy') ";

        for (i = 0; i < month_num; i++)
        {
            SQL = SQL + "       ,SUM(NVL(case when b.work_mon = TO_CHAR(ADD_MONTHS(to_date('" + p_from_mon + "','yyyymm')," + i + "),'yyyymm') then ROUND(NVL(B.INCOME_AMT_2, 0),3) end,0)) income_amt_2 " +
                        "       ,SUM(NVL(case when b.work_mon = TO_CHAR(ADD_MONTHS(to_date('" + p_from_mon + "','yyyymm')," + i + "),'yyyymm') then ROUND(NVL(B.DEDUCT_PIT, 0),3) END,0)) deduct_pit " +
                        "       ,SUM(NVL(case when b.work_mon = TO_CHAR(ADD_MONTHS(to_date('" + p_from_mon + "','yyyymm')," + i + "),'yyyymm') then 0 end,0)) tu_thien " +
                        "       ,SUM(NVL(case when b.work_mon = TO_CHAR(ADD_MONTHS(to_date('" + p_from_mon + "','yyyymm')," + i + "),'yyyymm') then ROUND(NVL (B.SOCIAL_AMT, 0) + NVL (B.HEALTH_AMT, 0) + NVL (B.UNEMP_INS, 0),3) end,0)) ins " +
                        "       ,SUM(NVL(case when b.work_mon = TO_CHAR(ADD_MONTHS(to_date('" + p_from_mon + "','yyyymm')," + i + "),'yyyymm') then ROUND(NVL (B.INCOME_BEFORE_TAX, NVL (B.INCOME_AMT, 0)),3) end,0)) income_amt " +
                        "       ,SUM(NVL(case when b.work_mon = TO_CHAR(ADD_MONTHS(to_date('" + p_from_mon + "','yyyymm')," + i + "),'yyyymm') then ROUND(NVL(B.INCOME_TAX, 0),3) end,0)) tax ";
            aDate[i] = Cur_Date.AddMonths(i);
        }

        SQL = SQL +
        "            ,0,MAX(NVL(c.income_amt_2,0)),MAX(NVL(c.deduct_pit,0)),MAX(NVL(c.tu_thien,0)) " +
        "            ,MAX(NVL(c.ins,0)),MAX(NVL(c.income_amt,0)),MAX(NVL(c.tax,0)) " +
        "  FROM thr_employee a, thr_month_salary b " +
        "        ,(SELECT a.pk emp_pk, " +
        "             ROUND (SUM (NVL (B.INCOME_AMT_2, 0)), 3) income_amt_2, " +
        "             ROUND (SUM (NVL (B.DEDUCT_PIT, 0)), 3) deduct_pit, " +
        "             0 tu_thien, " +
        "             ROUND (SUM (NVL (B.SOCIAL_AMT, 0)+ NVL (B.HEALTH_AMT, 0)+ NVL (B.UNEMP_INS, 0)),3) ins, " +
        "             ROUND (SUM (NVL (B.INCOME_BEFORE_TAX, NVL (B.INCOME_AMT, 0))), 3) income_amt, " +
        "             ROUND (SUM (NVL (B.INCOME_TAX, 0)), 3) tax " +
        "        FROM thr_employee a, thr_month_salary b " +
        "       WHERE     a.del_if = 0 " +
        "             AND b.del_if = 0 " +
        "             AND a.pk = b.thr_emp_pk " +
        "             AND b.work_mon BETWEEN '" + p_from_mon + "' AND '" + p_to_mon + "' " +
        "    GROUP BY a.pk) c " +
        " WHERE     a.del_if = 0 " +
        "       AND b.del_if = 0 " +
        "       AND a.pk = b.thr_emp_pk " +
        "       AND a.pk = c.emp_pk(+) " +
        "       AND b.work_mon between '" + p_from_mon + "' and '" + p_to_mon + "' " +
        "  GROUP by a.pk,a.nation,a.emp_id,a.full_name,a.join_dt,a.PIT_TAX_NO,A.PERSON_ID " +
        "  ORDER BY nation, a.emp_id        ";


        //Response.Write(SQL);
        //Response.End();

        DataTable dt_emp = CtlLib.TableReadOpen(SQL);
        int irow_emp, icol_emp;
        irow_emp = dt_emp.Rows.Count;

        if (irow_emp == 0)
        {
            Response.Write("There is no data of salary");
            Response.End();
        }

        SQL
        = "  SELECT DECODE (code, '01', 'Vietnamese', 'Foreigner') " +
        "    FROM vhr_hr_code " +
        "   WHERE id = 'HR0009' " +
        "GROUP BY DECODE (code, '01', 'Vietnamese', 'Foreigner') " +
        "ORDER BY DECODE (code, '01', 'Vietnamese', 'Foreigner') ";

        DataTable dt_nation = CtlLib.TableReadOpen(SQL);

        int pos = 7, p_col = 13, n_array = month_num * 6 + 7;   //cong them 6 cot total phia sau
        int emp_dept = 0, n_dept = 0, row = 0;
        int count = 0, ncount = 0;
        double[] sub_total = new double[n_array];
        double[] grant_total = new double[n_array];
        

        string[] atype = new string[] { "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X", "XI" };
/*        string[] acol = new string[] { "", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
                                    ,"AA", "AB", "AC", "AD", "AE", "AF", "AG", "AH", "AI", "AJ", "AK", "AL","AM","AN","AO","AP","AQ","AR","AS","AT","AU","AV","AW","AX","AY","AZ"
                                    ,"BA", "BB", "BC", "BD", "BE", "BF", "BG", "BH", "BI", "BJ", "BK", "BL","BM","BN","BO","BP","BQ","BR","BS","BT","BU","BV","BW","BX","BY","BZ"
                                    ,"CA", "CB", "CC", "CD", "CE", "CF", "CG", "CH", "CI", "CJ", "CK", "CL","CM","CN","CO","CP","CQ","CR","CS","CT","CU","CV","CW","CX","CY","CZ"};
        */
        
        //bind data to excel file
        //-----header---   
        exSheet.Cells["A1"].Value = "BẢNG KÊ THU NHẬP CHỊU THUẾ NĂM " + p_year;
        
        //---end--header---

        for (k = 0; k < n_array; k++)
        {
            sub_total[k] = 0;
            grant_total[k] = 0;
        }
        
        //Insert new column
        for (i = 0; i < (month_num - 1) * 6; i++)
        {
            exSheet.Range[1, p_col].Rows.EntireColumn.Insert();
        }

        for (i = 0; i < month_num - 1; i++)
            exSheet.Range[2, p_col - 6, 6, p_col - 1].Copy(exSheet.Range[2, p_col + i * 6, 6, p_col + 5 + i * 6], XlPasteType.xlPasteAll);

        for (i = 0; i < month_num; i++)
            exSheet.Range[2, 7 + i * 6].Value = aDate[i].ToString("MMM");

        //Insert new row

        for (i = 0; i < irow_emp - 1 + dt_nation.Rows.Count * 2; i++)
        {
            exSheet.Range[pos + 1, 1].Rows.EntireRow.Insert();
        }

        //Show data
        for (j = 0; j < dt_nation.Rows.Count; j++)
        {
            exSheet.Cells[pos + j + count, 1].Value = atype[j];
            exSheet.Cells[pos + j + count, 2].Value = dt_nation.Rows[j][0].ToString();
            exSheet.Cells[pos + j + count, 1, pos + j + count, 2].Rows.Font.Bold = true;
            for (i = 0; i < irow_emp; i++)
            {
                ncount++;
                if (dt_emp.Rows[i][1].ToString() == dt_nation.Rows[j][0].ToString())
                {
                    for (k = 0; k < n_array; k++)
                        sub_total[k] = sub_total[k] + double.Parse(dt_emp.Rows[i][7 + k].ToString());

                    count++;
                    exSheet.Cells[pos + j + count, 1].Value = ncount;
                    for (k = 2; k <= 6 + month_num * 6 + 6; k++)    // cong thêm 6 cot total phia sau
                    {
                        if (k <= 6)
                            exSheet.Cells[pos + j + count, k].Value = dt_emp.Rows[i][k].ToString();
                        else
                            exSheet.Cells[pos + j + count, k].Value = double.Parse(dt_emp.Rows[i][k].ToString());
                    }
                }
                else
                    ncount = 0;

            }
            //Them vao sub_total khi vua ket thuc nation
            exSheet.Cells[pos + j + count + 1, 2, pos + j + count + 1, 3].Merge();
            exSheet.Cells[pos + j + count + 1, 2].Value = "Sub Total ";
            exSheet.Cells[pos + j + count + 1, 1, pos + j + count + 1, 12 + n_array].Rows.Font.Bold = true;
            //exSheet.Cells[pos + j + count + 1, 1, pos + j + count + 1, 7 + n_array].Interior.Color = Color.FromArgb(255, 255, 0);
            for (k = 0; k < n_array; k++)
            {
                exSheet.Cells[pos + j + count + 1, 7 + k].Value = sub_total[k];
                sub_total[k] = 0;
            }
            pos = pos + 1;
        }

        pos = 8;    //lay lai vi tri ban dau
        for (i = 0; i < irow_emp; i++)
            for (k = 0; k < n_array; k++)
                grant_total[k] += Double.Parse(dt_emp.Rows[i][7 + k].ToString());
            
        for (k = 0; k < n_array; k++)
            exSheet.Cells[pos + dt_emp.Rows.Count + dt_nation.Rows.Count + 1, 7 + k].Value = grant_total[k];
        

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