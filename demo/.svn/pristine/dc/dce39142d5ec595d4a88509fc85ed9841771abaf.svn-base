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

public partial class rpt_60300010_consolidate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string l_monthly = Request["p_monthly"];  

       
        string TemplateFile = "rpt_60300010_consolidate.xls";
        string TempFile = "../../../../system/temp/rpt_60300010_consolidate_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        string para = "";
        DataTable dt, dtSum;

        para = "'" + l_monthly + "'";
        dt = CtlLib.TableReadOpenCursor("rpt_60300010_division_report", para);
        //-----header---   

        //---end--header---
        //--set-----DataBind--in---Master---
        if (dt.Rows.Count == 0)
        {
            exSheet.Cells[6, 3].Value = "There is not data!";

        }
        if (dt.Rows.Count > 0)
        {
            
		//	exSheet.Cells[3, 1].Value = dt.Rows[0]["date_para"].ToString();
			//exSheet.Cells[3, 9].Value = dt.Rows[0]["print_time"].ToString();  
        }

        //----------------------
        ////end-set-----DataBind--in---Master---

        for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range["A7"].Rows.EntireRow.Insert();//insert row new of sheet

        }
        //set date title of year
        //exSheet.Cells[2, 1].Value = "Income Statement Year" + " " + l_year;

        //set data to detail.
        // loop detail not percent
		int l_total_room=0,l_total_guest=0;
		if(dt.Rows.Count > 0)
		{
			int l_cnt = dt.Rows.Count;
			for (int l_row = 1; l_row <= dt.Rows.Count; l_row++)
			{
				for (int col = 0; col <= 9 ;col++)
				{	
					if(col==0)
					{					
						exSheet.Cells[5 + l_row, 1].Value = dt.Rows[l_row - 1][0].ToString();
						
					}
					if(col==1)
					{
						exSheet.Cells[5 + l_row, 2].Value = dt.Rows[l_row - 1][1].ToString();
					}
					if(col==2)
					{
						if(dt.Rows[l_row - 1][2].ToString()!="")
						{
							exSheet.Cells[5 + l_row, 3].Value = double.Parse(dt.Rows[l_row - 1][2].ToString());
						}
					}
					if(col==3)
					{
						exSheet.Cells[5 + l_row, 4].Value = dt.Rows[l_row - 1][3].ToString();
					}
					if(col==4)
					{
						if(dt.Rows[l_row - 1][4].ToString()!="")
						{
							exSheet.Cells[5 + l_row, 5].Value = double.Parse(dt.Rows[l_row - 1][4].ToString());
						}
						
					}
					if(col==5)
					{
						if(dt.Rows[l_row - 1][5].ToString()!="")
						{
							exSheet.Cells[5 + l_row, 6].Value = double.Parse(dt.Rows[l_row - 1][5].ToString());
						}
					}
					if(col==6)
					{
						if(dt.Rows[l_row - 1][6].ToString()!="")
						{
							exSheet.Cells[5 + l_row, 7].Value = double.Parse(dt.Rows[l_row - 1][6].ToString());
						}
					}
					if(col==7)
					{
						if(dt.Rows[l_row - 1][7].ToString()!="")
						{
							exSheet.Cells[5 + l_row, 8].Value = double.Parse(dt.Rows[l_row - 1][7].ToString());
						}
					}
					if(col==8)
					{
						if(dt.Rows[l_row - 1][8].ToString()!="")
						{
							exSheet.Cells[5 + l_row, 9].Value = double.Parse(dt.Rows[l_row - 1][8].ToString());
						}
					}
					if(col==9)
					{
						if(dt.Rows[l_row - 1][9].ToString()!="")
						{
							exSheet.Cells[5 + l_row, 10].Value = double.Parse(dt.Rows[l_row - 1][9].ToString());
						}
					}
					if(dt.Rows[l_row - 1][0].ToString()=="" && dt.Rows[l_row - 1][1].ToString()=="")
					{
						exSheet.Cells[5 + l_row, 2].Value = "Total";
						exSheet.Cells[5 + l_row, 1,5 + l_row,10].Font.Bold = true;
					}
					if(dt.Rows[l_row - 1][0].ToString()!="" && dt.Rows[l_row - 1][1].ToString()=="")
					{
						exSheet.Cells[5 + l_row, 2].Value = "Sub Total";
						exSheet.Cells[5 + l_row, 1,5 + l_row,10].Font.Bold = true;
					}
					if(col==0)
					{
						if (l_row < dt.Rows.Count)
						{
							if(col==0)
							{
								if(dt.Rows[l_row-1][0].ToString() == dt.Rows[l_row][0].ToString())
								{
									exSheet.Range[l_row+5, 1,l_row+6, 1].Merge();
									//l_long_term=l_long_term+1;
								}
							}
							
						}
					}
				
				}
				
				
			}
			//use Merge
			
		}
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }


        // hide row firts 

        range = exSheet.Range["A1"];
        // hide row A5 
        range.Rows.Hidden = true;

        // font bold header

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