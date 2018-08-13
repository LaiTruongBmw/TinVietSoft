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

public partial class rpt_hrpm00900_0 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string l_wgroup = Request.QueryString["l_wgroup"].ToString();
        string l_bn_times = Request.QueryString["l_bn_times"].ToString();
        string l_tco_org = Request.QueryString["l_tco_org"].ToString();
        string l_year = Request.QueryString["l_year"].ToString();
        string l_emp_type = Request.QueryString["l_emp_type"].ToString();
        string l_nation = Request.QueryString["l_nation"].ToString();
        string l_contract = Request.QueryString["l_contract"].ToString();
        string p_input = Request.QueryString["l_Temp"].ToString();
        string l_j_from = Request.QueryString["l_j_from"].ToString();
        string l_j_to = Request.QueryString["l_j_to"].ToString();
        string l_l_from = Request.QueryString["l_l_from"].ToString();
        string l_l_to = Request.QueryString["l_l_to"].ToString();
        string l_type = Request.QueryString["l_type"].ToString();
        string l_Senority_from = Request.QueryString["l_Senority_from"].ToString();
        string l_Senority_to = Request.QueryString["l_Senority_to"].ToString();

        string TemplateFile = "rpt_hrpm00900_0.xls";
        string TempFile = "../../../../system/temp/rpt_hrpm00900_0_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        string para = "'" + l_wgroup + "','" + l_bn_times + "','" + l_tco_org + "','" + l_year + "','" + l_emp_type + "','" + l_nation + "','" + l_contract + "','";
        para = para + p_input + "','" + l_j_from + "','" + l_j_to + "','" + l_l_from + "','" + l_l_to + "','" + l_type + "','" + l_Senority_from + "','" + l_Senority_to + "'";
        DataTable dt_emp = CtlLib.TableReadOpenCursor("ST_HR_rpt_hrpm00900_0", para);

        if (dt_emp.Rows.Count == 0)
        {
            Response.Write("There is no data of bonus amount.");
            Response.End();
        }

        string SQL
        = "select A.REMARK " +
            "from thr_bonus_master a " +
            "where a.del_if = 0 " +
            "and A.TIMES = '" + l_bn_times + "' " +
            "and A.YEAR = '" + l_year + "' ";

        DataTable dt_remark = CtlLib.TableReadOpen(SQL);

        //Khai bao bien
        int pos = 5;
        int i, j, n_dept = 0, emp_dept = 0;
        Double[] subtotal = new Double[2] { 0, 0 };
        Double[] grandtotal = new Double[2] { 0, 0 };
        //Insert new row
        for (i = 0; i < dt_emp.Rows.Count - 1; i++)
        {
            if (dt_emp.Rows[i][1].ToString() != dt_emp.Rows[i + 1][1].ToString()) //khac bo phan
                n_dept++;
        }

        for (i = 0; i < dt_emp.Rows.Count + n_dept - 1; i++)
        {
            exSheet.Range[pos + 1 + i, 1].Rows.EntireRow.Insert();
        }

        exSheet.Cells[2, 5].Value = "Bonus Year: " + l_year;
        exSheet.Cells[2, 7].Value = "Times: " + l_bn_times + " - " + dt_remark.Rows[0][0].ToString();
        //Show data
        for (i = 0; i < dt_emp.Rows.Count; i++)
        {
            subtotal[0] = subtotal[0] + Double.Parse(dt_emp.Rows[i][6].ToString());
            subtotal[1] = subtotal[1] + Double.Parse(dt_emp.Rows[i][8].ToString());
            grandtotal[0] = grandtotal[0] + Double.Parse(dt_emp.Rows[i][6].ToString());
            grandtotal[1] = grandtotal[1] + Double.Parse(dt_emp.Rows[i][8].ToString());
            emp_dept++;
            exSheet.Cells[pos + i, 1].Value = emp_dept;
            for (j = 1; j <= 8; j++)
            {
                if (j >= 6)
                    exSheet.Cells[pos + i, j + 1].Value = Double.Parse(dt_emp.Rows[i][j].ToString());
                else
                    exSheet.Cells[pos + i, j + 1].Value = dt_emp.Rows[i][j].ToString();
            }

            if (i != dt_emp.Rows.Count - 1 && dt_emp.Rows[i][1].ToString() != dt_emp.Rows[i + 1][1].ToString()) //khac bo phan
            {
                exSheet.Cells[pos + i + 1, 2, pos + i + 1, 5].Merge();
                exSheet.Cells[pos + i + 1, 2].Value = "Sub Total " + dt_emp.Rows[i][1].ToString() + " - " + emp_dept + " employee(s)";
                exSheet.Cells[pos + i + 1, 2, pos + i + 1, 9].Rows.Font.Bold = true;
                exSheet.Cells[pos + i + 1, 2].HorizontalAlignment = XlHAlign.xlHAlignCenter;
                exSheet.Cells[pos + i + 1, 7].Value = subtotal[0];
                exSheet.Cells[pos + i + 1, 9].Value = subtotal[1];
                //Insert page break
                IPageBreaks pbs = exBook.Worksheets[1].HPageBreaks;
                IRange usedrange = exBook.Worksheets[1].UsedRange;
                //pbs.Reset();
                pbs.Add(usedrange.Rows[pos + i + 2]);
                subtotal[0] = 0;
                subtotal[1] = 0;
                pos = pos + 1;
                emp_dept = 0;
            }
            else if (i == dt_emp.Rows.Count - 1)
            {
                exSheet.Cells[pos + i + 1, 2].Value = "Sub Total " + dt_emp.Rows[i][1].ToString() + " - " + emp_dept + " employee(s)";
                exSheet.Cells[pos + i + 2, 1].Value = "Grand Total - " + dt_emp.Rows.Count + " employee(s)";

                exSheet.Cells[pos + i + 1, 7].Value = subtotal[0];
                exSheet.Cells[pos + i + 1, 9].Value = subtotal[1];

                exSheet.Cells[pos + i + 2, 7].Value = grandtotal[0];
                exSheet.Cells[pos + i + 2, 9].Value = grandtotal[1];
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