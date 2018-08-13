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

public partial class rpt_hrmr00300_0 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CtlLib.SetUser("APP_DBUSER");

        string p_org_pk, p_wg_pk, p_nation,  p_search_temp, p_date, p_emp_type, p_thr_ws_pk;

        p_org_pk = Request["l_org_pk"].ToString();
        p_wg_pk = Request["l_group"].ToString();
        p_nation = Request["l_nation"].ToString();
        p_search_temp = Request["l_search_temp"].ToString();
        p_date = Request["l_date"].ToString();
        p_emp_type = Request["l_emp_type"].ToString();
        p_thr_ws_pk = Request["l_thr_ws_pk"].ToString();
        
        string TemplateFile;

        TemplateFile = "rpt_hrmr00300_0.xls";

        string TempFile = "../../../../system/temp/rpt_hrmr00300_0_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        string para = "'" + p_org_pk + "','" + p_wg_pk + "','" + p_nation + "','" + p_search_temp + "','" + p_date + "','" + p_emp_type + "','" + p_thr_ws_pk + "'";
        DataTable dt_emp = CtlLib.TableReadOpenCursor("ST_HR_RPT_HRMR00300_0", para);

        if (dt_emp.Rows.Count == 0)
        {
            Response.Write("There is no data !");
            Response.End();
        }



        //bind data to excel file
        //-----header---   

        exSheet.Cells["C2"].Value = dt_emp.Rows[0][5];
        exSheet.Cells["C3"].Value = Session["User_ID"].ToString();

        //---end--header---
        int pos = 6;
        //Insert new row

        for (int i = 0; i < dt_emp.Rows.Count - 1 ; i++)
        {
            exSheet.Range[pos + 1, 1].Rows.EntireRow.Insert();
        }

        //Show data

        for (int i = 0; i < dt_emp.Rows.Count; i++)
        {
            exSheet.Cells[i + pos, 1].Value = i + 1;
            for (int j = 1; j <= dt_emp.Columns.Count; j++)
            {
                exSheet.Cells[i + pos, j +1].Value = dt_emp.Rows[i][j-1].ToString();
            }

            
        }
      
        // hide row not use 


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