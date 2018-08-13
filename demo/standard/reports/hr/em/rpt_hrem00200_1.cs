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
public partial class rpt_hrem00200_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string p_tco_org_pk, p_nation, p_emp_search, p_select_date, p_from_date, p_to_date, p_status, p_salary_yn, p_position;
        string p_user, p_sal_security;
        string p_data, p_lang;

        p_user = Request["p_user"].ToString();
        p_tco_org_pk = Request["p_tco_org_pk"].ToString();
        p_nation = Request["p_nation"].ToString();
        p_emp_search = Request["p_emp_search"].ToString();
        p_select_date = Request["p_select_date"].ToString();
        p_from_date = Request["p_from_date"].ToString();
        p_to_date = Request["p_to_date"].ToString();
        p_salary_yn = Request["p_salary_yn"].ToString();
        p_position = Request["p_position"].ToString();
        p_status = Request["p_status"].ToString();
        p_sal_security = Request["p_sal_security"].ToString();
        p_data = Request["p_data"].ToString();
        p_lang = Request["p_lang"].ToString();

        string TemplateFile = "rpt_hrem00200_1.xls";
        string TempFile = "../../../../system/temp/rpt_hrem00200_1_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        string para = "'" + p_emp_search + "','" + p_tco_org_pk + "','" + p_nation + "','" + p_position + "','" + p_select_date + "','";
        para = para + p_from_date + "','" + p_to_date + "','" + p_salary_yn + "','" + p_status + "'" ;

        DataTable dt_emp = CtlLib.TableReadOpenCursor("ST_HR_RPT_HREM00200_1", para);


        int irow,icol_emp;
        irow = dt_emp.Rows.Count;
        icol_emp = dt_emp.Columns.Count;
        if (irow == 0)
        {
            Response.Write("There is no data");
            Response.End();
        }    

        
        DataTable dt_allow = CtlLib.TableReadOpenCursor("ST_HR_RPT_CO_ALLOW_SALARY");

        //DataTable dt_allow_k = CtlLib.TableReadOpenCursor("hr.sp_rpt_allowance_k_salary");

        int i, j, k, i_allow;
        int pos = 7, total_col = icol_emp;
        int allow = 16;     //vi tri phu cap
        
        //bind data to excel file
        //-----header---   

        exSheet.Cells["C2"].Value = Session["User_ID"].ToString();
        exSheet.Cells["C3"].Value = dt_emp.Rows[0][1].ToString();
        
        for (i_allow = 0; i_allow < 8; i_allow++)
        {
            if (dt_allow.Rows[0][i_allow + 8].ToString() == "1")
            {
                exSheet.Cells[5, allow + i_allow].Value = dt_allow.Rows[0][16 + i_allow].ToString() ;
                exSheet.Cells[6, allow + i_allow].Value = dt_allow.Rows[0][i_allow].ToString();
            }
        }


        //---end--header---
        //Insert new row

        for (i = 0; i < irow - 1; i++)
        {
            exSheet.Range[pos + 1, 1].Rows.EntireRow.Insert();
        }

        //Show data
        for (i = 0; i < irow; i++)
        {
            exSheet.Cells[pos + i, 1].Value = i + 1;
            for (j = 2; j < icol_emp; j++)
                if (j >= 14 && j <= 23)
                    exSheet.Cells[pos + i, j].Value = Double.Parse(dt_emp.Rows[i][j].ToString());
                else if (j == 37 || j == 38 || j == 41 || j == 42 || j == 9 || j==11)
                {
                    if (dt_emp.Rows[i][j].ToString().Length == 8)
                        exSheet.Cells[pos + i, j].Value = new DateTime(int.Parse(dt_emp.Rows[i][j].ToString().Substring(0, 4)), int.Parse(dt_emp.Rows[i][j].ToString().Substring(4, 2)), int.Parse(dt_emp.Rows[i][j].ToString().Substring(6, 2)));

                    else
                        exSheet.Cells[pos + i, j].Value = dt_emp.Rows[i][j].ToString();
                }
                else
                    exSheet.Cells[pos + i, j].Value = dt_emp.Rows[i][j].ToString();
           
        }

        //Hide allowance column
        for (i_allow = 0; i_allow < 8; i_allow++)
        {
            if (dt_allow.Rows[0][i_allow + 8].ToString() != "1")
                exSheet.Range[1, allow + i_allow].Columns.Hidden = true;
        }

        //delete theo security

        if (p_sal_security == "N")
        {
            for (i = 0; i < 10; i++)
                exSheet.Range[1, allow - 2].Columns.EntireColumn.Delete();
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