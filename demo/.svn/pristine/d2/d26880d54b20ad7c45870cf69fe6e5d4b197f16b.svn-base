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

public partial class rpt_60300010_nationality_mkt_segment_yearly : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

         CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string p_year = Request["p_year"];
       
        string TemplateFile = "rpt_60300010_nationality_mkt_segment_yearly.xls";
        string TempFile = "../../../../system/temp/rpt_60300010_nationality_mkt_segment_yearly_" + Session["User_ID"].ToString() + ".xls";
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

        para = "'" + p_year + "'";
        dt = CtlLib.TableReadOpenCursor("rpt_60300010_mkt_segment_year", para);
        //-----header---   

        //---end--header---
        //--set-----DataBind--in---Master---
        if (dt.Rows.Count == 0)
        {
            exSheet.Cells[6, 1].Value = "There is not data!";

        }
        /*if (dt.Rows.Count > 0)
        {
			exSheet.Cells[3, 1].Value = dt.Rows[0]["date_para"].ToString();
            exSheet.Cells[3, 9].Value = dt.Rows[0]["print_time"].ToString();
			exSheet.Cells[4, 11].Value = dt.Rows[0]["date_header"].ToString(); 
        }*/

        //----------------------
        ////end-set-----DataBind--in---Master---
		
        /*for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range["A7"].Rows.EntireRow.Insert();//insert row new of sheet

        }*/
		for (int l_addrow_1 = 0; l_addrow_1 < dt.Rows.Count-1; l_addrow_1++)//add row show with data of table
		{           
			exSheet.Range[5+l_addrow_1+1,1].Rows.EntireRow.Insert();//insert row new of sheet
		}
        //set date title of year
        //exSheet.Cells[2, 1].Value = "Income Statement Year" + " " + l_year;

        //set data to detail.
        // loop detail not percent
        int l_cnt = dt.Rows.Count;
		
		for (int l_row = 0; l_row < dt.Rows.Count; l_row++)
		{
			exSheet.Cells[3,28].Value = "Total "+p_year;
			
			
			exSheet.Cells[5 + l_row,2].Value = dt.Rows[l_row]["nation"];
			exSheet.Cells[5 + l_row,3].Value = dt.Rows[l_row]["customer_type"];
			
			exSheet.Cells[5 + l_row,4].Value = dt.Rows[l_row]["mm1"];
			exSheet.Cells[5 + l_row,5].Value = dt.Rows[l_row]["rate_mm1"];
			
			exSheet.Cells[5 + l_row,6].Value = dt.Rows[l_row]["mm2"];
			exSheet.Cells[5 + l_row,7].Value = dt.Rows[l_row]["rate_mm2"];
			
			exSheet.Cells[5 + l_row,8].Value = dt.Rows[l_row]["mm3"];
			exSheet.Cells[5 + l_row,9].Value = dt.Rows[l_row]["rate_mm3"];
			
			exSheet.Cells[5 + l_row,10].Value = dt.Rows[l_row]["mm4"];
			exSheet.Cells[5 + l_row,11].Value = dt.Rows[l_row]["rate_mm4"];
			
			exSheet.Cells[5 + l_row,12].Value = dt.Rows[l_row]["mm5"];
			exSheet.Cells[5 + l_row,13].Value = dt.Rows[l_row]["rate_mm5"];
			
			exSheet.Cells[5 + l_row,14].Value = dt.Rows[l_row]["mm6"];
			exSheet.Cells[5 + l_row,15].Value = dt.Rows[l_row]["rate_mm6"];
			
			exSheet.Cells[5 + l_row,16].Value = dt.Rows[l_row]["mm7"];
			exSheet.Cells[5 + l_row,17].Value = dt.Rows[l_row]["rate_mm7"];
			
			exSheet.Cells[5 + l_row,18].Value = dt.Rows[l_row]["mm8"];
			exSheet.Cells[5 + l_row,19].Value = dt.Rows[l_row]["rate_mm8"];
			
			exSheet.Cells[5 + l_row,20].Value = dt.Rows[l_row]["mm9"];
			exSheet.Cells[5 + l_row,21].Value = dt.Rows[l_row]["rate_mm9"];
			
			exSheet.Cells[5 + l_row,22].Value = dt.Rows[l_row]["mm10"];
			exSheet.Cells[5 + l_row,23].Value = dt.Rows[l_row]["rate_mm10"];
			
			exSheet.Cells[5 + l_row,24].Value = dt.Rows[l_row]["mm11"];
			exSheet.Cells[5 + l_row,25].Value = dt.Rows[l_row]["rate_mm11"];
			
			exSheet.Cells[5 + l_row,26].Value = dt.Rows[l_row]["mm12"];
			exSheet.Cells[5 + l_row,27].Value = dt.Rows[l_row]["rate_mm12"];
			
			exSheet.Cells[5 + l_row,28].Value = dt.Rows[l_row]["total_year"];
			exSheet.Cells[5 + l_row,29].Value = dt.Rows[l_row]["rate_year"];
			
			Color color2 = ColorTranslator.FromHtml("0xFFFFCC");
			if(dt.Rows[l_row]["customer_type"].ToString()=="" && dt.Rows[l_row]["mm1"].ToString()!="")
			{
				exSheet.Cells[5 + l_row,3, 5 + l_row, 29].Interior.Color = color2;//Color.Green;
			}
			
			if(dt.Rows[l_row]["nation"].ToString()!="" && dt.Rows[l_row]["customer_type"].ToString()=="" && dt.Rows[l_row]["mm1"].ToString()!="")
			{
				exSheet.Cells[5 + l_row,3].Value = "Sub Total";//SUBTOTAL;
				exSheet.Cells[5 + l_row,29].Value = "100%";
			}
			if(dt.Rows[l_row]["nation"].ToString()=="" && dt.Rows[l_row]["customer_type"].ToString()=="" && dt.Rows[l_row]["mm1"].ToString()!="")
			{
				exSheet.Cells[5 + l_row,3].Value = "Total";//TOTAL;
				exSheet.Cells[5 + l_row,29].Value = "100%";
				
				exSheet.Cells[5 + l_row,5].Value = "100%";
				exSheet.Cells[5 + l_row,7].Value = "100%";
				exSheet.Cells[5 + l_row,9].Value = "100%";
				exSheet.Cells[5 + l_row,11].Value = "100%";
				exSheet.Cells[5 + l_row,13].Value = "100%";
				exSheet.Cells[5 + l_row,15].Value = "100%";
				exSheet.Cells[5 + l_row,17].Value = "100%";
				exSheet.Cells[5 + l_row,19].Value = "100%";
				exSheet.Cells[5 + l_row,21].Value = "100%";
				exSheet.Cells[5 + l_row,23].Value = "100%";
				exSheet.Cells[5 + l_row,25].Value = "100%";
				exSheet.Cells[5 + l_row,27].Value = "100%";
			}
			if (l_row >1 && l_row < dt.Rows.Count)
			{
					if(dt.Rows[l_row-1]["nation"].ToString() == dt.Rows[l_row]["nation"].ToString())
					{
						exSheet.Range[l_row+4, 2,l_row+5, 2].Merge();
						//l_long_term=l_long_term+1;
					}
			}
			if (l_row >0 && l_row ==1)
			{
					if(dt.Rows[l_row-1]["nation"].ToString() == dt.Rows[l_row]["nation"].ToString())
					{
						exSheet.Range[l_row+4, 2,l_row+5, 2].Merge();
						//l_long_term=l_long_term+1;
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