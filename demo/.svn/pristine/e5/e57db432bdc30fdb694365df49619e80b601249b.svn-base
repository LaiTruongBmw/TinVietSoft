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

public partial class rpt_chrm00010_01 : System.Web.UI.Page
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

        string TemplateFile = "rpt_chrm00010_01.xls";
        string TempFile = "../../../../system/temp/rpt_chrm00010_01_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];


        string SQL
        = "SELECT (    SELECT g.ORG_NM " +
        "              FROM TCO_ORG g " +
        "             WHERE g.del_if = 0 AND G.ORG_TYPE = '06' " +
        "        START WITH g.pk = e.pk " +
        "        CONNECT BY PRIOR g.p_pk = g.pk) C0, e.org_nm C1, " +
        "         b.WORKGROUP_NM C2, " +
        "         a.EMP_ID AS emp_id, " +
        "         a.FULL_NAME AS full_name, " +
        "         to_char(to_date(a.join_dt,'yyyymmdd'),'dd/mm/yyyy') AS join_dt, " +
        "         to_char(to_date(d.WORK_DT,'yyyymmdd'),'dd/mm/yyyy') AS work_dt, " +
        "         C.REMARK C7, F.TIME_IN,F.TIME_OUT C9 "+
        ",NULLIF(MEAL.MEAL_01,'00:00'),NULLIF(MEAL.MEAL_02,'00:00'),NULLIF(MEAL.MEAL_03,'00:00'),NULLIF(MEAL.MEAL_04,'00:00'),NULLIF(MEAL.MEAL_05,'00:00') " +
        "    FROM THR_EMPLOYEE A, THR_WORK_GROUP B,THR_WORK_SHIFT C,THR_WG_SCH_DETAIL D,tco_org e,THR_TIME_MACHINE F " +
        " ,(SELECT M1.THR_EMP_PK, " + 
        "               M1.WORK_DT_OF_SHIFT, " +
        "               MAX (CASE WHEN M1.MEAL_TIMES = '01' THEN M1.TIME_IN ELSE '00:00' END) MEAL_01, " +
        "               MAX (CASE WHEN M1.MEAL_TIMES = '02' THEN M1.TIME_IN ELSE '00:00' END) MEAL_02, " +
        "               MAX (CASE WHEN M1.MEAL_TIMES = '03' THEN M1.TIME_IN ELSE '00:00' END) MEAL_03, " +
        "               MAX (CASE WHEN M1.MEAL_TIMES = '04' THEN M1.TIME_IN ELSE '00:00' END) MEAL_04, " +
        "               MAX (CASE WHEN M1.MEAL_TIMES = '05' THEN M1.TIME_IN ELSE '00:00' END) MEAL_05 " +
        "               FROM THR_MEAL_CHECKING M1  " +
        "               WHERE M1.DEL_IF=0  " +
        "               AND M1.WORK_DT_OF_SHIFT BETWEEN '" + p_from_dt + "' AND '" + p_to_dt + "' " +
        "               AND M1.THR_EMP_PK IS NOT NULL  " +
        "               GROUP BY M1.THR_EMP_PK,M1.WORK_DT_OF_SHIFT) MEAL " +
        "   WHERE A.DEL_IF = 0 AND B.DEL_IF = 0 " +
        "         AND C.DEL_IF = 0 " +
        "         AND D.del_if = 0 AND E.DEL_IF=0 AND F.DEL_IF=0 AND D.THR_EMP_PK=F.THR_EMP_PK AND D.WORK_DT=F.WORK_DT " +
        "         AND A.THR_WG_PK = B.PK " +
        "         AND A.pk = D.thr_emp_pk " +
        "         AND a.tco_org_pk = e.pk AND D.THR_WS_PK=C.PK AND D.WORK_DT=MEAL.WORK_DT_OF_SHIFT(+) AND D.THR_EMP_PK=MEAL.THR_EMP_PK(+) " +
        "         AND D.WORK_DT BETWEEN '" + p_from_dt + "' AND '" + p_to_dt + "' " +
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
        "ORDER BY D.WORK_DT,E.ORG_NM,emp_id ";

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
            exSheet.Range[pos +i+ 1, 1].Rows.EntireRow.Insert();
        }

        //Title value
        exSheet.Cells["F2"].Value = p_from_dt.Substring(6, 2).ToString() + "/" + p_from_dt.Substring(4, 2).ToString() + "/" + p_from_dt.Substring(0, 4).ToString();
        exSheet.Cells["I2"].Value = p_to_dt.Substring(6, 2).ToString() + "/" + p_to_dt.Substring(4, 2).ToString() + "/" + p_to_dt.Substring(0, 4).ToString();

        //Show data
        for (i = 0; i < irow; i++)
        {
            exSheet.Cells[pos + i, 1].Value = i + 1;
            for (j = 0; j < icol; j++)
            {
               // if(j>=10)
                 //   exSheet.Cells[pos + i, j+2].Value =double.Parse(dt_emp.Rows[i][j].ToString());
                //else
                    exSheet.Cells[pos + i, j + 2].Value = dt_emp.Rows[i][j].ToString();    
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