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
public partial class rpt_hrem00500_5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
	  CtlLib.SetUser(Session["APP_DBUSER"].ToString());
    Response.ContentType = "application/vnd.ms-excel";
    Response.Buffer = false;
string p_tco_org_pk,p_thr_wg_pk,p_temp,p_contract_type,p_from_begin_contract,p_to_begin_contract,p_status;

 p_tco_org_pk = Request["p_tco_org_pk"].ToString();
 p_thr_wg_pk = Request["p_thr_wg_pk"].ToString();
 p_temp = Request["p_temp"].ToString();
 p_contract_type = Request["p_contract_type"].ToString() ;
 p_from_begin_contract = Request["p_from_begin_contract"].ToString();
 p_to_begin_contract = Request["p_to_begin_contract"].ToString() ;
 p_status = Request["p_status"].ToString();
 
        string TemplateFile = "rpt_hrem00500_5.xls";
        string TempFile = "../../../../system/temp/rpt_hrem00500_5_" + Session["APP_DBUSER"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];
        IRange range;        
		string para = "'" + p_tco_org_pk + "','" + p_thr_wg_pk + "', '"+ p_temp +"','"+ p_contract_type +"','"+ p_from_begin_contract +"','"+ p_to_begin_contract +"','"+ p_status +"'" ;	
			
		DataTable dt_emp = CtlLib.TableReadOpenCursor("ST_HR_RPT_HREM00500_5", para);
      int irow,icol_emp;
        irow = dt_emp.Rows.Count;
        icol_emp = dt_emp.Columns.Count;
	 
	  if (irow == 0)
        {
            Response.Write("There is no data");
            Response.End();
        } 
	 int i, j, k;
        int pos = 5, total_col = icol_emp;
       
	    //bind data to excel file
       
	 //string retstring = p_curentmonth.Substring(4,2) +"-"+p_curentmonth.Substring(0,4);
	 //exSheet.Cells["C1"].Value=exSheet.Cells["C1"].Value+retstring;
	 exSheet.Cells["B1"].Value="Report by: " +Session["APP_DBUSER"].ToString();	
	 exSheet.Cells["B2"].Value= "Report date: "+DateTime.Now.ToString("dd/MM/yyyy");
	 
	 //---end--header---
        //Insert new row

        for (i = 0; i < irow - 1; i++)
        {
            exSheet.Range[pos + 1, 1].Rows.EntireRow.Insert();
        }
        //Show data
        for (i = 0; i < irow; i++)
        {
			
		//----------------------------------------	
		
            exSheet.Cells[pos + i, 1].Value = i + 1;
            for (j = 0; j < icol_emp; j++)
               if (j >= 11 )
                    exSheet.Cells[pos + i, j+2].Value = Double.Parse(dt_emp.Rows[i][j].ToString());                
                else
                    exSheet.Cells[pos + i, j+2].Value = dt_emp.Rows[i][j].ToString();           
        }
//-------------------------------------- 

	
	
//----------------------------------------
        // hide row firts       
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
	public static bool IsNumeric(string strNum)
    {
        try
        {
            double tmp = double.Parse(strNum);
            return true;
        }
        catch
        {
            return false;
        }
    }
}