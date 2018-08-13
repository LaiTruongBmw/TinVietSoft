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

public partial class rpt_chrm00020_5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

       // string p_dept_pk = Request["l_tco_dept_pk"].ToString();
       // string p_group_pk = Request["l_thr_group_pk"].ToString();
        string p_from_dt = Request["l_from_dt"].ToString();
        string p_to_dt = Request["l_to_dt"].ToString();
        //string p_search = Request["l_search_by"].ToString();
        //string p_input = Request["l_search_tmp"].ToString();
       // string p_meal_emp_type = Request["l_meal_emp_type"].ToString();
       // string p_meal_type = Request["l_meal_type"].ToString();
       // string p_meal_times = Request["l_meal_times"].ToString();

        string TemplateFile = "rpt_chrm00020_5.xls";
        string TempFile = "../../../../system/temp/rpt_chrm00020_5_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];


 
		string SQL
		= "SELECT 1,DIV_SEQ,ORG_SEQ,DIV_0,PL_CD,SUM(MEAL_01),SUM(MEAL_02),SUM(MEAL_03),SUM(MEAL_04),SUM(MEAL_05),SUM(TOTAL)  " + 
        "FROM (   " +
        "SELECT 1, NVL(DIV_SEQ,99999999) DIV_SEQ,NVL(ORG_SEQ,99999999) ORG_SEQ,NVL(DIV_0,99999999) DIV_0 ,PL_CD " +
        ",SUM(MEAL_01) MEAL_01,SUM(MEAL_02) MEAL_02,SUM(MEAL_03) MEAL_03,SUM(MEAL_04) MEAL_04  " +
        ",SUM(MEAL_05) MEAL_05,SUM(TOTAL) TOTAL  " +
        "FROM(  " +
        " SELECT (    SELECT g.seq   " +
        "              FROM TCO_ORG g   " +
        "             WHERE g.del_if = 0 AND G.ORG_TYPE = '03'   " +
        "        START WITH g.pk = e.pk   " +
        "        CONNECT BY PRIOR g.p_pk = g.pk) DIV_seq,  " +
        " nvl((SELECT g.seq   " +
        "              FROM TCO_ORG g   " +
        "             WHERE g.del_if = 0 AND G.ORG_TYPE = '07'   " +
        "        START WITH g.pk = e.pk   " +
        "        CONNECT BY PRIOR g.p_pk = g.pk),e.seq) ORG_seq,  " +
        " nvl((SELECT g.ORG_NM   " +
        "              FROM TCO_ORG g   " +
        "             WHERE g.del_if = 0 AND G.ORG_TYPE = '07'   " +
        "        START WITH g.pk = e.pk   " +
        "        CONNECT BY PRIOR g.p_pk = g.pk),e.org_nm) DIV_0  " +
        " ,P.PL_CD        " +
        " ,NVL(MEAL.MEAL_01,0) MEAL_01,NVL(MEAL.MEAL_02,0) MEAL_02,NVL(MEAL.MEAL_03,0) MEAL_03,NVL(MEAL.MEAL_04,0) MEAL_04  " +
        " ,NVL(MEAL.MEAL_05,0) MEAL_05           " +
        " ,NVL(MEAL.MEAL_01,0)+NVL(MEAL.MEAL_02,0)+NVL(MEAL.MEAL_03,0)+NVL(MEAL.MEAL_04,0)+NVL(MEAL.MEAL_05,0) TOTAL         " +
        " FROM THR_EMPLOYEE A,THR_WG_SCH_DETAIL D,tco_org e, tac_abpl p  " +
        "    ,(SELECT M1.THR_EMP_PK,   " +
        "               M1.WORK_DT_OF_SHIFT,   " +
        "               SUM(CASE WHEN M1.MEAL_TIMES = '01' THEN 1 ELSE 0 END) MEAL_01,   " +
        "               SUM (CASE WHEN M1.MEAL_TIMES = '02' THEN 1 ELSE 0 END) MEAL_02,   " +
        "               SUM (CASE WHEN M1.MEAL_TIMES = '03' THEN 1 ELSE 0 END) MEAL_03,   " +
        "               SUM (CASE WHEN M1.MEAL_TIMES = '04' THEN 1 ELSE 0 END) MEAL_04,   " +
        "               SUM (CASE WHEN M1.MEAL_TIMES = '05' THEN 1 ELSE 0 END) MEAL_05   " +
        "               FROM THR_MEAL_CHECKING M1    " +
        "               WHERE M1.DEL_IF=0    " +
        "               AND M1.WORK_DT_OF_SHIFT BETWEEN '" + p_from_dt + "' AND '"+p_to_dt+"'  AND M1.MEAL_EMP_TYPE='IN'  " +
        "               AND M1.THR_EMP_PK IS NOT NULL    " +
        "               GROUP BY M1.THR_EMP_PK,M1.WORK_DT_OF_SHIFT) MEAL  " +
        " WHERE A.DEL_IF=0 AND D.DEL_IF=0 AND E.DEL_IF=0 and p.del_if =0   " +
        " AND A.TCO_ORG_PK=E.PK AND A.PK=D.THR_EMP_PK AND A.NATION='01' and A.TAC_ABPL_PK = p.pk " +
        "AND D.WORK_DT BETWEEN '" + p_from_dt + "' AND '"+p_to_dt+"' AND D.THR_EMP_PK=MEAL.THR_EMP_PK(+) AND D.WORK_DT=MEAL.WORK_DT_OF_SHIFT(+)  " +
        "AND A.JOIN_DT<='" + p_from_dt + "') dorco2  " +
        "GROUP BY DIV_0,DIV_SEQ,ORG_SEQ ,PL_CD " +
        "UNION ALL  " +
        "SELECT 2,0,0, 'OUT OF COMPANY','',   " +
        "SUM(CASE WHEN M1.MEAL_TIMES = '01' THEN 1 ELSE 0 END) MEAL_01,   " +
        "SUM(CASE WHEN M1.MEAL_TIMES = '02' THEN 1 ELSE 0 END) MEAL_02,   " +
        "SUM(CASE WHEN M1.MEAL_TIMES = '03' THEN 1 ELSE 0 END) MEAL_03,   " +
        "SUM(CASE WHEN M1.MEAL_TIMES = '04' THEN 1 ELSE 0 END) MEAL_04,   " +
        "0 MEAL_05,COUNT(*) TOTAL   " +
        "FROM THR_MEAL_CHECKING M1    " +
        "WHERE M1.DEL_IF=0    " +
        "AND M1.WORK_DT_OF_SHIFT BETWEEN '" + p_from_dt + "' AND '"+p_to_dt+"' AND M1.MEAL_EMP_TYPE='OUT'  " +
        "GROUP BY M1.WORK_DT_OF_SHIFT  " +
        "UNION ALL  " +
        "SELECT 3,0,0, 'VISITOR','',   " +
        "SUM(NVL(M1.MEAL_QTY,1)*(CASE WHEN M1.MEAL_TIMES = '01' THEN 1 ELSE 0 END)) MEAL_01,   " +
        "SUM(NVL(M1.MEAL_QTY,1)*(CASE WHEN M1.MEAL_TIMES = '02' THEN 1 ELSE 0 END)) MEAL_02,   " +
        "SUM(NVL(M1.MEAL_QTY,1)*(CASE WHEN M1.MEAL_TIMES = '03' THEN 1 ELSE 0 END)) MEAL_03,   " +
        "SUM(NVL(M1.MEAL_QTY,1)*(CASE WHEN M1.MEAL_TIMES = '04' THEN 1 ELSE 0 END)) MEAL_04,   " +
        "0 MEAL_05,SUM(NVL(M1.MEAL_QTY,1)) TOTAL   " +
        "FROM THR_MEAL_VISITOR M1    " +
        "WHERE M1.DEL_IF=0    " +
        "AND M1.WORK_DT_OF_SHIFT BETWEEN '" + p_from_dt + "' AND '"+p_to_dt+"' " +
        "GROUP BY M1.WORK_DT_OF_SHIFT  " +
        "UNION ALL  " +
        "SELECT 4,0,0, 'OTHER','',   " +
        "SUM(NVL(M1.MEAL_QTY,1)*(CASE WHEN M1.MEAL_TIMES = '01' THEN 1 ELSE 0 END)) MEAL_01,   " +
        "SUM(NVL(M1.MEAL_QTY,1)*(CASE WHEN M1.MEAL_TIMES = '02' THEN 1 ELSE 0 END)) MEAL_02,   " +
        "SUM(NVL(M1.MEAL_QTY,1)*(CASE WHEN M1.MEAL_TIMES = '03' THEN 1 ELSE 0 END)) MEAL_03,   " +
        "SUM(NVL(M1.MEAL_QTY,1)*(CASE WHEN M1.MEAL_TIMES = '04' THEN 1 ELSE 0 END)) MEAL_04,   " +
        "0 MEAL_05,SUM(NVL(M1.MEAL_QTY,1)) TOTAL   " +
        "FROM THR_MEAL_OTHER M1    " +
        "WHERE M1.DEL_IF=0    " +
        "AND M1.WORK_DT_OF_SHIFT BETWEEN '" + p_from_dt + "' AND '"+p_to_dt+"' " +
        "GROUP BY M1.WORK_DT_OF_SHIFT)  " +
        " GROUP BY 1,DIV_SEQ,ORG_SEQ,DIV_0,PL_CD  " +
        "ORDER BY 1,2,3  " ;

		
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
        double[] grant_total = new double[icol + 1];
        
        //Insert new row

        for (i = 0; i < irow - 1; i++)
        {
            exSheet.Range[pos +i+ 1, 1].Rows.EntireRow.Insert();
        }

        //Title value
        exSheet.Cells["D2"].Value = p_from_dt.Substring(6, 2).ToString() + "/" + p_from_dt.Substring(4, 2).ToString() + "/" + p_from_dt.Substring(0, 4).ToString()
							+" ~ "+ p_to_dt.Substring(6, 2).ToString() + "/" + p_to_dt.Substring(4, 2).ToString() + "/" + p_to_dt.Substring(0, 4).ToString() ;
       

        //Show data
        for (i = 0; i < irow; i++)
        {
            exSheet.Cells[pos + i, 1].Value = i + 1;
            for (j = 3; j < icol; j++)
            {
                if (j >= 5)
                {
                    exSheet.Cells[pos + i, j - 1].Value = double.Parse(dt_emp.Rows[i][j].ToString());
                    grant_total[j] += double.Parse(dt_emp.Rows[i][j].ToString());
                }
                else
                    exSheet.Cells[pos + i, j - 1].Value = dt_emp.Rows[i][j].ToString();    
            }

        }

        for (j = 3; j < icol; j++)
        {
            exSheet.Cells[pos + irow, j - 1].Value = grant_total[j];
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