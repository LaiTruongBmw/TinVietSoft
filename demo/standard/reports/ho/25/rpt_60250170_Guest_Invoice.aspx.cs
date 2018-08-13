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

public partial class rpt_60250170_Guest_Invoice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
        string l_repayment_pk = Request["p_tht_repayment_pk"];
		string p_employee_pk = Request["p_employee_pk"];
        		
        string TemplateFile = "rpt_60250170_Guest_Invoice.xls";
        string TempFile = "../../../../system/temp/rpt_60250170_Guest_Invoice_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
		string para="";
		DataTable dt;
		
		para = "'" + l_repayment_pk + "'";
		dt = CtlLib.TableReadOpenCursor("ht_rpt_60250170_repayment", para);	
		string SQL="";
		SQL = "select max(full_name) from thr_employee where pk='" +p_employee_pk +"'";
		DataTable dtEmp = new DataTable();
		dtEmp = CtlLib.TableReadOpen(SQL);
		exSheet.Cells[ 33, 5].Value = dtEmp.Rows[0][0].ToString();//full_name login sofware
        //-----header---   
		
        //---end--header---
        //--set-----DataBind--in---Master---
		if(dt.Rows.Count == 0)
		{
			exSheet.Cells[ 8, 4].Value = "There is not data!";
		}
		if(dt.Rows.Count >0)
		{		
			string l_status_title="GUEST INVOICE";
		
				
				exSheet.Cells[ 7, 3].Value = l_status_title;
				//exSheet.Cells[ 8, 1].Value = dt.Rows[0]["confirm_msg"].ToString();
				exSheet.Cells[ 9, 3].Value = dt.Rows[0]["guest_name"].ToString();
				exSheet.Cells[ 9, 6].Value = dt.Rows[0]["print_time"].ToString();
				exSheet.Cells[10, 3].Value = dt.Rows[0]["partner_name"].ToString();
				exSheet.Cells[10, 6].Value = dt.Rows[0]["room_no"].ToString();    
				//exSheet.Cells[10, 7].Value = l_folio_type;
				exSheet.Cells[11, 3].Value = dt.Rows[0]["customer_address"].ToString();
				exSheet.Cells[11, 6].Value = dt.Rows[0]["invoice_no"].ToString();
				exSheet.Cells[12, 3].Value = dt.Rows[0]["tax_code"].ToString();
				exSheet.Cells[12, 6].Value = dt.Rows[0]["arrival_dt"].ToString();
				//exSheet.Cells[13, 3].Value = dt.Rows[0]["guest_name"].ToString(); //total guest
				exSheet.Cells[13, 6].Value = dt.Rows[0]["checkout_dt"].ToString();
				exSheet.Cells[14, 4].Value = dt.Rows[0]["paymethod"].ToString();
				if(dt.Rows[0]["total_due_vnd_pp"].ToString()!="")
				{
					exSheet.Cells[17, 5].Value = double.Parse(dt.Rows[0]["total_due_vnd_pp"].ToString());//
				}
				if(dt.Rows[0]["total_due_usd_pp"].ToString()!="")
				{
					exSheet.Cells[17, 7].Value = float.Parse(dt.Rows[0]["total_due_usd_pp"].ToString());
				}
				
				//exSheet.Cells[18, 5].Value = dt.Rows[0]["paymethod"].ToString();TTDB  VND
				//exSheet.Cells[18, 7].Value = dt.Rows[0]["paymethod"].ToString();TTDB  USD
				if(dt.Rows[0]["svc_amt"].ToString()!="")
				{
					exSheet.Cells[19, 5].Value = double.Parse(dt.Rows[0]["svc_amt"].ToString());
				}
				if(dt.Rows[0]["svc_amt_usd"].ToString()!="")
				{
					exSheet.Cells[19, 7].Value = float.Parse(dt.Rows[0]["svc_amt_usd"].ToString());
				}
				if(dt.Rows[0]["total_vnd"].ToString()!="")
				{
					exSheet.Cells[20, 5].Value = double.Parse(dt.Rows[0]["total_vnd"].ToString());
				}
				
				if(dt.Rows[0]["total_usd"].ToString()!="")
				{
					exSheet.Cells[20, 7].Value = float.Parse(dt.Rows[0]["total_usd"].ToString());
				}
				if(dt.Rows[0]["vat_amt"].ToString()!="")
				{
					exSheet.Cells[21, 5].Value = double.Parse(dt.Rows[0]["vat_amt"].ToString());
				}
				if(dt.Rows[0]["vat_amt_usd"].ToString()!="")
				{
					exSheet.Cells[21, 7].Value = float.Parse(dt.Rows[0]["vat_amt_usd"].ToString());
				}

				
				

				//exSheet.Cells[22, 5].Value = int.Parse(dt.Rows[0]["total_discount_amt"].ToString());
				//exSheet.Cells[22, 7].Value = float.Parse(dt.Rows[0]["total_discount_amt_usd"].ToString());

				//exSheet.Cells[22, 5].Value = int.Parse(dt.Rows[0]["advance_amt"].ToString());
				//exSheet.Cells[22, 7].Value = float.Parse(dt.Rows[0]["advance_amt_usd"].ToString());
				if(dt.Rows[0]["total_due_end_vnd"].ToString()!="")
				{
					exSheet.Cells[23, 5].Value = double.Parse(dt.Rows[0]["total_due_end_vnd"].ToString());
				}
				if(dt.Rows[0]["total_due_usd"].ToString()!="")
				{
					exSheet.Cells[23, 7].Value = float.Parse(dt.Rows[0]["total_due_usd"].ToString());
				}
				if(dt.Rows[0]["cash_vnd"].ToString()!="")
				{
					exSheet.Cells[24, 3].Value = double.Parse(dt.Rows[0]["cash_vnd"].ToString());
				}
				if(dt.Rows[0]["cash_usd"].ToString()!="")
				{
					exSheet.Cells[24, 5].Value = float.Parse(dt.Rows[0]["cash_usd"].ToString());
				}
				if(dt.Rows[0]["credit_vnd"].ToString()!="")
				{
					exSheet.Cells[25, 3].Value = double.Parse(dt.Rows[0]["credit_vnd"].ToString());
				}
				if(dt.Rows[0]["credit_usd"].ToString()!="")
				{
					exSheet.Cells[25, 5].Value = float.Parse(dt.Rows[0]["credit_usd"].ToString());
				}
				
				if(double.Parse(dt.Rows[0]["cash_vnd"].ToString())==0 && float.Parse(dt.Rows[0]["cash_usd"].ToString())==0)
				{
					range = exSheet.Range["A24"];
					range.Rows.Hidden = true;
				}
				if(double.Parse(dt.Rows[0]["credit_vnd"].ToString())==0 && float.Parse(dt.Rows[0]["credit_usd"].ToString())==0)
				{
					range = exSheet.Range["A25"];
					range.Rows.Hidden = true;
				}
				string inword_amt, inword_amt_usd;
			   inword_amt     = CommondLib.Num2VNText(dt.Rows[0]["total_due_end_vnd"].ToString(), "VND");
			   inword_amt_usd = CommondLib.Num2EngText(dt.Rows[0]["total_due_usd"].ToString(), "USD");
			   exSheet.Cells[26, 3].Value = inword_amt.ToString();
			   exSheet.Cells[27, 3].Value = inword_amt_usd.ToString();
		}
        
        /*if (l_svc < 1)//not svc then hide row svc 
        {
            range = exSheet.Range["A15"];
            // hide row A15 
            range.Rows.Hidden = true;
        }*/

        //----------------------
        ////end-set-----DataBind--in---Master---

        for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range["A16"].Rows.EntireRow.Insert();//insert row new of sheet

        }
        //set date title of year
        //exSheet.Cells[2, 1].Value = "Income Statement Year" + " " + l_year;

        //set data to detail.
        // loop detail not percent
        int l_cnt = dt.Rows.Count;
		if(dt.Rows.Count > 0)
		{
			for (int l_row = 1; l_row <= dt.Rows.Count; l_row++)
			{
				for (int col = 0; col <= 6; col++)
				{


					if (col == 1 || col == 2 || col == 3)
					{
						exSheet.Cells[15 + l_row, col + 1].Value = dt.Rows[l_row - 1][col].ToString();
						exSheet.Cells[l_row + 15, col + 1].HorizontalAlignment = XlHAlign.xlHAlignLeft;
						exSheet.Range[16, col + 1, l_row + 15, 7].Font.Bold = false;
					}
					else
					{
						if (col == 6)
						{
							
							if(dt.Rows[l_row - 1][col].ToString()!="")
							{
								exSheet.Cells[15 + l_row, col + 1].Value = float.Parse(dt.Rows[l_row - 1][col].ToString());
								exSheet.Cells[15, col + 1, l_row + 15, col + 1].NumberFormat = "#,##0.00";
								exSheet.Cells[l_row + 15, col + 1].HorizontalAlignment = XlHAlign.xlHAlignRight;
							}
						}
						else
						{
							if(dt.Rows[l_row - 1][col].ToString()!="")
							{
								exSheet.Cells[15 + l_row, col + 1].Value = long.Parse(dt.Rows[l_row - 1][col].ToString());
								exSheet.Cells[15, col + 1, l_row + 15, col + 1].NumberFormat = "#,##0";
								exSheet.Cells[l_row + 15, col + 1].HorizontalAlignment = XlHAlign.xlHAlignRight;  
							}							
						}
						exSheet.Range[16, col + 1, l_row + 15, 7].Font.Bold = false;
					}

					//exSheet.Cells[l_row + 12, 1].HorizontalAlignment = XlHAlign.xlHAlignCenter;
				}
			}
		}
        
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