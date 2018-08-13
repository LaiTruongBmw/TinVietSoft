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

public partial class rpt_60300010_other_fee : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

         CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string l_dtfrm = Request["p_dtfrom"];
		string l_dtto = Request["p_dtto"];
		string l_room_last_first_name = Request["p_room_last_first_name"];
		string l_fee_type = Request["p_fee_type"];
       
        string TemplateFile = "rpt_60300010_other_fee.xls";
        string TempFile = "../../../../system/temp/rpt_60300010_other_fee_" + Session["User_ID"].ToString() + ".xls";
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

        para = "'" + l_dtfrm + "','" + l_dtto + "','" + l_room_last_first_name + "','" + l_fee_type + "'";
		
        dt = CtlLib.TableReadOpenCursor("ht_rpt_60300010_orther_fee", para); 
		dtSum = CtlLib.TableReadOpenCursor("ht_rpt_60300010_sum", para); 
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
            exSheet.Cells[3, 10].Value = dt.Rows[0]["print_time"].ToString();
			if(dtSum.Rows[0]["fee_amt"].ToString()!="")
			{
				exSheet.Cells[6, 6].Value = double.Parse(dtSum.Rows[0]["fee_amt"].ToString());
			}
			if(dtSum.Rows[0]["fee_amt_usd"].ToString()!="")
			{
				exSheet.Cells[6, 8].Value = float.Parse(dtSum.Rows[0]["fee_amt_usd"].ToString());
			}
	   }

        //----------------------
        ////end-set-----DataBind--in---Master---

        for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range["A6"].Rows.EntireRow.Insert();//insert row new of sheet

        }
        //set date title of year
        //exSheet.Cells[2, 1].Value = "Income Statement Year" + " " + l_year;

        //set data to detail.
        // loop detail not percent
        int l_cnt = dt.Rows.Count;
        for (int l_row = 1; l_row <= dt.Rows.Count; l_row++)
        {
            for (int col = 0; col <= 9; col++)
            {
                if (col == 0 || col == 1 || col == 2 || col == 3 || col == 4 || col == 8|| col == 9)
                {
                    exSheet.Cells[4 + l_row, col + 1].Value = dt.Rows[l_row - 1][col].ToString();
                    exSheet.Cells[l_row + 4, col + 1].HorizontalAlignment = XlHAlign.xlHAlignLeft;
                    //exSheet.Range[5, col + 1, l_row + 5, 7].Font.Bold = false;
                }
                else
                {
                    if (col == 7)
                    {
                        exSheet.Cells[4 + l_row, col + 1].Value = float.Parse(dt.Rows[l_row - 1][col].ToString());
                        exSheet.Cells[4, col + 1, l_row + 4, col + 1].NumberFormat = "#,##0.00";
                        exSheet.Cells[l_row + 4, col + 1].HorizontalAlignment = XlHAlign.xlHAlignRight;
                        if (float.Parse(dt.Rows[l_row - 1][col].ToString()) == 0.00)
                        {
                            exSheet.Cells[4 + l_row, col + 1].Value = "";
                        }
                    }
                    else
                    {	if(dt.Rows[l_row - 1][col].ToString()!="")
						{
							exSheet.Cells[4 + l_row, col + 1].Value = double.Parse(dt.Rows[l_row - 1][col].ToString());
							exSheet.Cells[4, col + 1, l_row + 4, col + 1].NumberFormat = "#,##0";
                            exSheet.Cells[l_row + 4, col + 1].HorizontalAlignment = XlHAlign.xlHAlignRight;
							if (double.Parse(dt.Rows[l_row - 1][col].ToString()) == 0)
							{
								exSheet.Cells[4 + l_row, col + 1].Value = "";
							}
							
						}
                        

                        
                    }
                }
            }
        }

        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }


        // hide row firts 

      //  range = exSheet.Range["A1"];
        // hide row A5 
       // range.Rows.Hidden = true;

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