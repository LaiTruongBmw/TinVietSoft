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

public partial class rpt_60300010_Nigh_Audit_daily_USD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       CtlLib.SetUser(Session["APP_DBUSER"].ToString());
		string l_dtfrm = Request["p_date"];
	       
        string TemplateFile = "rpt_60300010_Nigh_Audit_daily_USD.xls";
        string TempFile = "../../../../system/temp/rpt_60300010_Nigh_Audit_daily_USD_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        string para = "",date_para="";
        DataTable dt,dtAdjPoint;

        para = "'" + l_dtfrm + "'";
		
        dt = CtlLib.TableReadOpenCursor("rpt_60300010_rev_daily_vnd", para); 
		dtAdjPoint = CtlLib.TableReadOpenCursor("rpt_60300010_adjust_by_point", para); 
        //-----header---   

        //---end--header---
        //--set-----DataBind--in---Master---
		date_para="Date :"+l_dtfrm.Substring(6, 2)+"/"+l_dtfrm.Substring(4, 2)+"/" + l_dtfrm.Substring(0, 4);
        if (dt.Rows.Count == 0)
        {
            exSheet.Cells[3, 3].Value = "There is not data!";

        }
        if (dt.Rows.Count > 0)   
        {
			exSheet.Cells[2, 8].Value = "Print Time :           "+dt.Rows[0]["print_time"].ToString();
			exSheet.Cells[3, 1].Value = ""+date_para;
			exSheet.Cells[3, 4].Value = int.Parse(dt.Rows[0][11].ToString());
			exSheet.Cells[3, 6].Value = int.Parse(dt.Rows[0][12].ToString());
			exSheet.Cells[3, 8].Value = int.Parse(dt.Rows[0][13].ToString());
			
			for(int i=0;i<=41;i++){
				exSheet.Cells[i+7, 3].Value  = double.Parse(dt.Rows[i]["qty_today"].ToString());//#  today
				exSheet.Cells[i+7, 4].Value  = double.Parse(dt.Rows[i]["supply_today"].ToString());//Supply
				exSheet.Cells[i+7, 5].Value  = double.Parse(dt.Rows[i]["svc_today"].ToString());//Service charge
				exSheet.Cells[i+7, 6].Value  = double.Parse(dt.Rows[i]["vat_today"].ToString());//vat
				exSheet.Cells[i+7, 7].Value  = double.Parse(dt.Rows[i]["total_today"].ToString());//total
				exSheet.Cells[i+7, 8].Value  = double.Parse(dt.Rows[i]["qty_mtd"].ToString());//# month
				exSheet.Cells[i+7, 9].Value  = double.Parse(dt.Rows[i]["supply_mtd"].ToString());//supply
				exSheet.Cells[i+7, 10].Value  = double.Parse(dt.Rows[i]["svc_mtd"].ToString());//Service charge
				exSheet.Cells[i+7, 11].Value  = double.Parse(dt.Rows[i]["vat_mtd"].ToString());//vat
				exSheet.Cells[i+7, 12].Value = double.Parse(dt.Rows[i]["total_mtd"].ToString());//total
				exSheet.Cells[i+7, 13].Value = double.Parse(dt.Rows[i]["qty_ytd"].ToString());//# year
				exSheet.Cells[i+7, 14].Value = double.Parse(dt.Rows[i]["supply_ytd"].ToString());//supply
				exSheet.Cells[i+7, 15].Value  = double.Parse(dt.Rows[i]["svc_ytd"].ToString());//Service charge
				exSheet.Cells[i+7, 16].Value = double.Parse(dt.Rows[i]["vat_ytd"].ToString());//vat
				exSheet.Cells[i+7, 17].Value = double.Parse(dt.Rows[i]["total_ytd"].ToString());//total
			}
        }
		for (int l_addrow = 1; l_addrow <dtAdjPoint.Rows.Count; l_addrow++)
        {
            exSheet.Range["A52"].Rows.EntireRow.Insert();//insert row new of sheet

        }
		if (dtAdjPoint.Rows.Count > 0)
		{
			for (int l_row = 1; l_row <= dtAdjPoint.Rows.Count; l_row++)
			{
				for (int col = 2; col <= 3; col++)
				{
					if (col == 2 )
					{
						exSheet.Cells[50 + l_row, col].Value = dtAdjPoint.Rows[l_row - 1]["point_name"].ToString();
						exSheet.Cells[l_row + 50, col].HorizontalAlignment = XlHAlign.xlHAlignLeft;
						//exSheet.Range[5, col + 1, l_row + 5, 7].Font.Bold = false;
					}
					else
					{
						exSheet.Cells[50 + l_row, col].Value = double.Parse(dtAdjPoint.Rows[l_row - 1]["amount"].ToString());
						exSheet.Cells[50, col, l_row + 50, col].NumberFormat = "#,##0.00";
						//exSheet.Cells[49, col, l_row + 49, col].Font.Color = Color.Red;
						exSheet.Cells[l_row + 50, col].HorizontalAlignment = XlHAlign.xlHAlignRight;

						if (double.Parse(dtAdjPoint.Rows[l_row - 1][1].ToString()) == 0.00)
						{
							exSheet.Cells[50 + l_row, 3].Value = "";
						}
					}
				}
			}
		}
        //----------------------
        ////end-set-----DataBind--in---Master---

        
        //set date title of year
        //exSheet.Cells[2, 1].Value = "Income Statement Year" + " " + l_year;

        //set data to detail.
        // loop detail not percent
		

        // end loop detail percent
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