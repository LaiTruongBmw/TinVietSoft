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

public partial class reports_ch_rm_rpt_chrm00010 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string p_dept_pk = Request["l_tco_dept_pk"].ToString();
        string p_group_pk = Request["l_thr_group_pk"].ToString();
        string p_from_dt = Request["l_from_dt"].ToString();
        string p_to_dt = Request["l_to_dt"].ToString();
        string p_search = Request["l_search_by"].ToString();
        string p_input = Request["l_search_tmp"].ToString();
        string p_meal_emp_type = Request["l_meal_emp_type"].ToString();
        string p_meal_type = Request["l_meal_type"].ToString();
        string p_meal_times = Request["l_meal_times"].ToString();

        string TemplateFile = "rpt_chrm00010.xls";
        string TempFile = "../../../../system/temp/rpt_chrm00010_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];


        string SQL
        = "SELECT '','', " +
        "       (    SELECT g.ORG_NM " +
        "              FROM TCO_ORG g " +
        "             WHERE g.del_if = 0 AND G.ORG_TYPE = '06' " +
        "        START WITH g.pk = e.pk " +
        "        CONNECT BY PRIOR g.p_pk = g.pk) " +
        "          DIV_NM,e.org_nm, " +
        "         b.WORKGROUP_NM AS group_nm, " +
        "         a.EMP_ID AS emp_id, " +
        "         a.FULL_NAME AS full_name, " +
        "         to_char(to_date(a.join_dt,'yyyymmdd'),'dd/mm/yyyy') AS join_dt, " +
        "         to_char(to_date(d.WORK_DT_OF_SHIFT,'yyyymmdd'),'dd/mm/yyyy') AS work_dt, " +
        "         d.TIME_IN AS time, " +
        "         (select CODE_NM from vhr_hr_code where id='HR0191' and code =D.MEAL_TIMES) meal_times, " +
        "         decode(NVL(D.MOD_BY_HAND,'N'),'N','NO','YES'), " +
        "         decode(d.meal_emp_type,'IN','Employee of Company','Out of Company') " +
        "    FROM THR_EMPLOYEE A, " +
        "         THR_WORK_GROUP B, " +
        "         THR_MEAL_CHECKING D, " +
        "         tco_org e " +
        "   WHERE     A.DEL_IF = 0 AND D.DEL_IF = 0 " +
        "         AND B.DEL_IF = 0 " +
        "         AND e.del_if = 0 " +
        "         AND A.THR_WG_PK = B.PK " +
        "         AND A.pk = D.thr_emp_pk " +
        "         AND a.tco_org_pk = e.pk " +
        "         AND D.WORK_DT_OF_SHIFT BETWEEN '" + p_from_dt + "' AND '" + p_to_dt + "' " +
        "         AND D.MEAL_EMP_TYPE = 'IN' " +
        "         AND DECODE ('" + p_group_pk + "', 'ALL', 'ALL', B.PK) = '" + p_group_pk + "' " +
        "         AND  A.TCO_ORG_PK IN " +
        "                    (    SELECT g.pk " +
        "                           FROM TCO_ORG g " +
        "                          WHERE g.del_if = 0 " +
        "                     START WITH g.pk = case when '" + p_dept_pk + "' = 'ALL' then g.pk else to_number('" + p_dept_pk + "') end " +
        "                     CONNECT BY PRIOR g.pk = g.p_pk) " +
        "         AND (   DECODE ('" + p_search + "', " +
        "                         '1', UPPER (A.EMP_ID), " +
        "                         '2', A.ID_NUM, " +
        "                         '3', UPPER (A.FULL_NAME)) LIKE " +
        "                    '%' || UPPER ('" + p_input + "') || '%' " +
        "              OR '" + p_input + "' IS NULL) " +
        "         AND DECODE ('" + p_meal_emp_type + "', 'ALL', 'ALL', d.meal_emp_type) = " +
        "                '" + p_meal_emp_type + "' " +
        "         AND DECODE ('" + p_meal_type + "', 'ALL', 'ALL', D.MEAL_TYPE) = '" + p_meal_type + "' " +
        "         AND DECODE ('" + p_meal_times + "', 'ALL', 'ALL', D.MEAL_TIMES) = '" + p_meal_times + "' " +
        "    UNION ALL " +
        "    SELECT '','','' DIV_NM,'' org_nm, " +
        "         '' AS group_nm, " +
        "         d.EMP_ID AS emp_id, " +
        "         D.FULL_NAME AS full_name, " +
        "         '' AS join_dt, " +
        "         to_char(to_date(d.WORK_DT_OF_SHIFT,'yyyymmdd'),'dd/mm/yyyy') AS work_dt, " +
        "         d.TIME_IN AS time, " +
        "         (select CODE_NM from vhr_hr_code where id='HR0191' and code =D.MEAL_TIMES) meal_times, " +
        "         decode(NVL(D.MOD_BY_HAND,'N'),'N','NO','YES'), " +
        "         decode(d.meal_emp_type,'IN','Employee of Company','Out of Company') " +
        "    FROM THR_MEAL_CHECKING D " +
        "   WHERE     D.DEL_IF = 0 " +
        "         AND D.WORK_DT_OF_SHIFT BETWEEN '" + p_from_dt + "' AND '" + p_to_dt + "' " +
        "         AND D.MEAL_EMP_TYPE = 'OUT' " +
        "         AND (   DECODE ('" + p_search + "', " +
        "                         '1', UPPER (D.EMP_ID), " +
        "                         '3', UPPER (D.FULL_NAME)) LIKE " +
        "                    '%' || UPPER ('" + p_input + "') || '%' " +
        "              OR '" + p_input + "' IS NULL) " +
        "         AND DECODE ('" + p_meal_emp_type + "', 'ALL', 'ALL', d.meal_emp_type) = " +
        "                '" + p_meal_emp_type + "' " +
        "         AND DECODE ('" + p_meal_type + "', 'ALL', 'ALL', D.MEAL_TYPE) = '" + p_meal_type + "' " +
        "         AND DECODE ('" + p_meal_times + "', 'ALL', 'ALL', D.MEAL_TIMES) = '" + p_meal_times + "'      " +
        "ORDER BY work_dt,DIV_NM,org_nm,group_nm,emp_id ";

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
        int i, j, pos = 5;
        
        //Insert new row

        for (i = 0; i < irow - 1; i++)
        {
            exSheet.Range[pos + 1, 1].Rows.EntireRow.Insert();
        }

        //Title value
        exSheet.Cells["F2"].Value = p_from_dt.Substring(6, 2).ToString() + "/" + p_from_dt.Substring(4, 2).ToString() + "/" + p_from_dt.Substring(0, 4).ToString();
        exSheet.Cells["I2"].Value = p_to_dt.Substring(6, 2).ToString() + "/" + p_to_dt.Substring(4, 2).ToString() + "/" + p_to_dt.Substring(0, 4).ToString();

        //Show data
        for (i = 0; i < irow; i++)
        {
            exSheet.Cells[pos + i, 1].Value = i + 1;
            for (j = 2; j < icol; j++)
            {
                exSheet.Cells[pos + i, j].Value = dt_emp.Rows[i][j].ToString();
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
}