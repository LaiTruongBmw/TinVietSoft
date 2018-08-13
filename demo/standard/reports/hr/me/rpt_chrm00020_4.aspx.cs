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

public partial class reports_ch_rm_rpt_chrm00020_4 : System.Web.UI.Page
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

        string TemplateFile = "rpt_chrm00020_4.xls";
        string TempFile = "../../../../system/temp/rpt_chrm00020_4_" + Session["User_ID"].ToString() + ".xls";
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
        string SQL
        = "SELECT '','', to_char(to_date(a.work_dt,'yyyymmdd'),'dd/mm/yyyy'), " +
        "       NVL(A.MEAL_TIME_01,0),  " +
        "       NVL(A.MEAL_TIME_02,0),  " +
        "       NVL(A.MEAL_TIME_03,0),  " +
        "       NVL(A.MEAL_TIME_04,0),  " +
        "       NVL (A.MEAL_MAIN_QTY, 0) + NVL (A.SNACK_TIME_QTY, 0),  " +
        "       NVL (A.MEAL_MAIN_AMT, 0) + NVL (A.SNACK_TIME_AMT, 0)  " +
        "  FROM THR_MEAL_DAILY_SUMMARY a " +
        " WHERE     a.del_if = 0 AND A.WORK_DT BETWEEN '" + p_from_dt + "' AND '" + p_to_dt + "' " +
        "ORDER BY a.work_dt ";

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
        int i, j, k, pos = 4;
        int ntotal = 6;
        double[] s_total = new double[ntotal];
        
        for (j = 0; j < ntotal; j++)
        {
            s_total[j] = 0;
        }

        //Insert new row

        for (i = 0; i < irow - 1; i++)
        {
            exSheet.Range[pos + 1, 1].Rows.EntireRow.Insert();
        }

        //Title value

        exSheet.Cells["A1"].Value = "THEO DÕI SUẤT ĂN THÁNG " + p_work_mon.Substring(4, 2).ToString() + "/" + p_work_mon.Substring(0, 4).ToString() ;

        //Show data
        for (i = 0; i < irow; i++)
        {
            for (k = 0; k < ntotal; k++)
            {
                s_total[k] = s_total[k] + double.Parse(dt_emp.Rows[i][k + 3].ToString());
            }

            exSheet.Cells[pos + i, 1].Value = i + 1;
            for (j = 2; j < icol; j++)
            {
                if (j <= 2)
                    exSheet.Cells[pos + i, j].Value = dt_emp.Rows[i][j].ToString();
                else
                    exSheet.Cells[pos + i, j].Value = double.Parse(dt_emp.Rows[i][j].ToString());
            }

            //Dong sub total
            
        }

        for (k = 0; k < ntotal; k++)
        {
            exSheet.Cells[pos + irow, k + 3].Value = s_total[k];
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