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
public partial class rpt_60280170_rvn_cabana_detail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       CtlLib.SetUser(Session["APP_DBUSER"].ToString());
        string l_from =     Request["p_dtfrom"];
        string l_to =       Request["p_dtto"];
       
        string TemplateFile = "rpt_60280170_rvn_cabana_detail.xls";
        string TempFile = "../../../../system/temp/rpt_60280170_rvn_cabana_detail_" + Session["User_ID"].ToString() + ".xls";
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

        para = "'" + l_from + "','" + l_to + "'";
        dt = CtlLib.TableReadOpenCursor("rpt_ht_sel_60280170", para);
        //-----header---   

        //---end--header---
        //--set-----DataBind--in---Master---
        if (dt.Rows.Count == 0)
        {
            exSheet.Cells[3, 3].Value = "There is not data!";

        }
        if (dt.Rows.Count > 0)
        {
            exSheet.Cells[3, 1].Value = dt.Rows[0]["date_para"].ToString();
         //   exSheet.Cells[3, 4].Value = dt.Rows[0]["roomno"].ToString();
          //  exSheet.Cells[3, 5].Value = dt.Rows[0]["paymnent"].ToString();
           exSheet.Cells[3, 7].Value = dt.Rows[0]["print_time"].ToString();
           // exSheet.Cells[2, 3].Value = dt.Rows[0]["report_name"].ToString();
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
        
        int l_cnt = dt.Rows.Count;
		double l_total_qty=0,l_total_amount=0;

      if(dt.Rows.Count > 0)
		{
			//int l_cnt = dt.Rows.Count;
			for (int l_row = 1; l_row <= dt.Rows.Count; l_row++)
			{
				for (int col = 0; col <= 8 ;col++)
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
							exSheet.Cells[5 + l_row, 3].Value = dt.Rows[l_row - 1][2].ToString();
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
							exSheet.Cells[5 + l_row, 5].Value = dt.Rows[l_row - 1][4].ToString();
						}
						
					}
					if(col==5)
					{
						if(dt.Rows[l_row - 1][5].ToString()!="")
						{
							exSheet.Cells[5 + l_row, 6].Value = dt.Rows[l_row - 1][5].ToString();
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
							l_total_qty=l_total_qty+ double.Parse(dt.Rows[l_row - 1][7].ToString());
						}
					}
					if(col==8)
					{
						if(dt.Rows[l_row - 1][8].ToString()!="")
						{
							exSheet.Cells[5 + l_row, 9].Value = double.Parse(dt.Rows[l_row - 1][8].ToString());
							l_total_amount=l_total_amount+double.Parse(dt.Rows[l_row - 1][8].ToString());
						}
					}
				}
			}
		}
		exSheet.Cells[6 + l_cnt, 8].Value=l_total_qty;
		exSheet.Cells[6 + l_cnt, 9].Value=l_total_amount;

        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }
        range = exSheet.Range["A1"];
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