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

public partial class rpt_hrem00200_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CtlLib.SetUser("APP_DBUSER");

        string p_tco_org_pk = Request["p1"].ToString();
        string p_thr_group_pk = Request["p2"].ToString();
		string p_nation = Request["p3"].ToString();
        string p_search_emp = Request["p5"].ToString();
        string p_from_joindate = Request["p6"].ToString();
        string p_to_joindate = Request["p7"].ToString();
        string p_insurance_yn = Request["p8"].ToString();
        string p_status = Request["p9"].ToString();
        string p_from_leftdate = Request["p10"].ToString();
        string p_to_leftdate = Request["p11"].ToString();
        string p_social_book = Request["p12"].ToString();
        string p_social_yn = Request["p13"].ToString();
        string p_health_yn = Request["p14"].ToString();
        string p_unemp_yn = Request["p15"].ToString();
        string p_social_no = Request["p16"].ToString();
        string p_from_begin_contract = Request["p17"].ToString();
        string p_to_begin_contract = Request["p18"].ToString();
        
        string TemplateFile = "rpt_hrem00200_2.xls";
        string TempFile = "../../../../system/temp/rpt_hrem00200_2_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];
        IRange range;

        string SQL
        = "  SELECT to_char(sysdate,'dd/mm/yyyy'),'',d.org_nm, " +
        "         b.org_nm, " +
        "         c.workgroup_nm, " +
        "         a.EMP_ID,A.OLD_ID, " +
        "         a.FULL_NAME, " +
        "         TO_CHAR (TO_DATE (a.JOIN_DT, 'yyyymmdd'), 'dd/mm/yyyy') JOIN_DT, " +
        "         DECODE(A.STATUS,'A','Active','Resign') status, " +
        "         TO_CHAR (TO_DATE (A.LEFT_DT, 'yyyymmdd'), 'dd/mm/yyyy') left_dt, " +
        "         SOCIAL_YN, " +
        "         SOCIAL_NO_OLD, " +
        "         SOCIAL_NO, " +
        "         (select CODE_NM from vhr_hr_code where id='HR0013' and code = A.SOCIAL_PLACE) social_place, " +
        "         TO_CHAR (TO_DATE (SOCIAL_DT, 'yyyymm'), 'mm/yyyy') social_dt, " +
        "         HEALTH_YN, " +
        "         a.HEALTH_NO, " +
        "         (select CODE_NM from vhr_hr_code where id='HR0012' and code = A.HEALTH_PLACE) HEALTH_PLACE, " +
        "         TO_CHAR (TO_DATE (HEALTH_DT, 'yyyymm'), 'mm/yyyy') health_dt, " +
        "         a.UNEMP_YN, " +
        "         TO_CHAR (TO_DATE (UNEMP_DT, 'yyyymm'), 'mm/yyyy') unemp_dt, " +
        "         (select CODE_NM from vhr_hr_code where id='HR0175' and code = NVL (a.social_book, '01')) social_book, " +
        "         a.BOOK_SUBMIT_DT, " +
        "         a.BOOK_RETURN_DT, " +
        "         a.MONTH_INS, " +
        "         nvl(a.insurance_sal,0), " +
        "         a.NOTE_INS_01, " +
        "         a.NOTE_INS_02 " +
        "    FROM thr_employee a, tco_org b, thr_work_group c, tco_org d " +
        "   WHERE     a.del_if = 0  and d.del_if =0 " +
        "         AND b.del_if = 0 " +
        "         AND c.del_if = 0 " +
        "         AND a.THR_wg_pk = c.pk " +
        "         AND a.TCO_org_PK = b.pk AND b.p_pk = d.pk  " +
        "         AND DECODE ('" + p_thr_group_pk + "', 'ALL', 'ALL', c.pk) = '" + p_thr_group_pk + "' " +
        "         AND DECODE ('" + p_nation + "', 'ALL', 'ALL', NVL (a.NATION, '01')) = '" + p_nation + "' " +
        "         AND ( '" + p_search_emp + "' is null " +
        "              OR (  a.emp_id  LIKE '%' || UPPER ('" + p_search_emp + "') || '%') " +
		"              OR (  a.old_id  LIKE '%' || UPPER ('" + p_search_emp + "') || '%') " +
		"              OR (  a.full_name  LIKE '%' || UPPER ('" + p_search_emp + "') || '%')) " +
        "         AND (   ('" + p_from_begin_contract + "' IS NULL AND '" + p_to_begin_contract + "' IS NULL) " +
        "              OR (a.begin_contract BETWEEN '" + p_from_begin_contract + "' " +
        "                                       AND '" + p_to_begin_contract + "')) " +
        "         AND (   ('" + p_from_joindate + "' IS NULL AND '" + p_to_joindate + "' IS NULL) " +
        "              OR (a.join_dt BETWEEN '" + p_from_joindate + "' AND '" + p_to_joindate + "')) " +
        "         AND DECODE ('" + p_insurance_yn + "', 'ALL', 'ALL', NVL (a.SOCIAL_YN, 'N')) = '" + p_insurance_yn + "' " +
        "         AND DECODE ('" + p_status + "', 'ALL', 'ALL', a.status) = '" + p_status + "' " +
        "         AND DECODE ('" + p_social_yn + "', 'ALL', 'ALL', a.social_yn) = '" + p_social_yn + "' " +
        "         AND DECODE ('" + p_health_yn + "', 'ALL', 'ALL', a.health_yn) = '" + p_health_yn + "' " +
        "         AND DECODE ('" + p_unemp_yn + "', 'ALL', 'ALL', a.unemp_yn) = '" + p_unemp_yn + "' " +
        "         AND (   ('" + p_social_no + "' = 'Y' AND a.social_no IS NOT NULL) " +
        "              OR ('" + p_social_no + "' = 'N' AND a.social_no IS NULL) " +
        "              OR ('" + p_social_no + "' = 'ALL' AND 1 = 1)) " +
        "         AND DECODE ('" + p_social_book + "', 'ALL', 'ALL', NVL (a.social_book, '0')) = '" + p_social_book + "' " +
        "         AND (   ('" + p_from_leftdate + "' IS NULL AND '" + p_to_leftdate + "' IS NULL) " +
        "              OR (a.LEFT_DT BETWEEN '" + p_from_leftdate + "' AND '" + p_to_leftdate + "')) " +
        "         AND (   a.tco_org_pk IN " +
        "                    (    SELECT g.pk " +
        "                           FROM tco_org g " +
        "                          WHERE g.del_if = 0 " +
        "                     START WITH g.pk = " +
        "                                   DECODE ('" + p_tco_org_pk + "', " +
        "                                           'ALL', 0, " +
        "                                           '" + p_tco_org_pk + "') " +
        "                     CONNECT BY PRIOR g.pk = g.p_pk) " +
        "              OR '" + p_tco_org_pk + "' = 'ALL') " +
        "ORDER BY d.org_nm,NVL (b.seq, 0),b.org_nm, NVL (c.seq, 0), A.EMP_ID ";

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

        int i, j;
        int pos = 7;

        //title 
        exSheet.Cells["C2"].Value = Session["User_ID"].ToString();
        exSheet.Cells["C3"].Value = dt_emp.Rows[0][0].ToString();
        
        //Insert new row

        for (i = 0; i < irow - 1; i++)
        {
            exSheet.Range[pos + 1, 1].Rows.EntireRow.Insert();
        }


        //Show data
        for (i = 0; i < irow; i++)
        {
            exSheet.Cells[pos + i, 1].Value = i + 1;
            for (j = 2; j < icol; j++)
                if (j == icol - 3)
                    exSheet.Cells[pos + i, j].Value = double.Parse(dt_emp.Rows[i][j].ToString());
                else
                    exSheet.Cells[pos + i, j].Value = dt_emp.Rows[i][j].ToString();
        }

        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }

        exBook.SaveAs(TempFile);
        //CtlLib.ExcelToPdf(TempFile);
        string pdfFilePath = TempFile.Replace(".xls", ".pdf");
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