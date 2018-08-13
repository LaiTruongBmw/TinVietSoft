using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Drawing;
using NativeExcel;

public partial class rpt_hrti00500_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        

        string p_month 		= Request["p_rpt_month"];
        string p_from_dt 	= Request["l_from_dt"];
        string p_to_dt 		= Request["l_to_dt"];
        string p_seq 		= Request["l_txtSequence"];
		
        string TemplateFile = "rpt_hrti00500_1.xls";
        string TempFile = "../../../../system/temp/rpt_hrti00500_1_" + DateTime.Now.ToString("yyyyMMdd") + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];
        IRange range;

		DataTable myDT;
		string para = p_month + "," + p_from_dt + "," + p_to_dt + "," + p_seq;
		
        myDT = CtlLib.TableReadOpenCursor("ST_HR_RPT_HRTI00500_1", para);
		
		int iRow = myDT.Rows.Count;
		int iCol = myDT.Columns.Count;
		int sRow = 3;
		int sCol = 2;
		
		if (iRow <= 0)
		{
			Response.Write("Không có dữ liệu !!!");
			Response.End();
		}
		
		for	(int row = 0; row < iRow-1; row++)
		{	
			exSheet.Range["A" + (4)].EntireRow.Insert();
		}
		
		for	(int row = 0; row < iRow; row++)
		{
			exSheet.Range[sRow + row, 1, sRow + row, 1].Value = row + 1;
			
			for	(int col = 0; col < iCol; col++)
			{
				exSheet.Range[sRow + row, sCol + col,sRow + row, sCol + col].Value = myDT.Rows[row][col].ToString();
			}
		}
		
		/*
		string SQL	= "select case when b.day_type = 1 then 'CN' " + 
					" when b.day_type = 2 then 'T2' " +
					" when b.day_type = 3 then 'T3' " +
					" when b.day_type = 4 then 'T4' " +
					" when b.day_type = 5 then 'T5' " +
					" when b.day_type = 6 then 'T6' " +
					" else 'T7' end " +
					" from ctl.TCO_ABCALENDAR b " +
					" where B.CAR_DATE BETWEEN " + p_month + "01" + " AND to_char(LAST_DAY(to_date("+ p_month + "01, 'YYYYMMDD')), 'YYYYMMDD')" ;
					
		// Response.Write(SQL);
		// Response.End();
		
		DataTable myDT;
        myDT = CtlLib.TableReadOpen(SQL);
		int irow = myDT.Rows.Count;
		int sRow = 2;
		int sCol = 5;
		
		exSheet.Range["A1:AI1"].Value = string.Format("LỊCH LÀM VIỆC THÁNG {0}", p_month_text);
		
		for	(int row = 0; row < irow; row++)
		{
			exSheet.Range[sRow, sCol + row,sRow, sCol + row].Value = myDT.Rows[row][0].ToString();
						
			if (myDT.Rows[row][0].ToString() == "CN")
				exSheet.Range[sRow, sCol + row,sRow, sCol + row].Interior.Color = Color.GreenYellow;
		}
		*/
        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }
		
        exBook.SaveAs(TempFile);
        //ESysLib.ExcelToPdf(TempFile);
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