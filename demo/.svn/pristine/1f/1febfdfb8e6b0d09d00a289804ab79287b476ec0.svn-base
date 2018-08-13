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

public partial class rpt_60250200_list_transaction_posted : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

         CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string l_dt_from = Request["p_dt_from"]; 
		string l_dt_to = Request["p_dt_to"];
		string l_crt_by = Request["p_crt_by"];
		string l_services_name = Request["p_services_name"];
		string l_location = Request["p_location"];
		string l_time_from = Request["p_time_from"]; 
		string l_time_to = Request["p_time_to"];
       
        string TemplateFile = "rpt_60250200_list_transaction_posted.xls";
        string TempFile = "../../../../system/temp/rpt_60250200_list_transaction_posted_" + Session["User_ID"].ToString() + ".xls";
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

        para = "'" + l_dt_from + "','" + l_dt_to + "','" + l_crt_by + "','" + l_services_name + "','" + l_location + "','" + l_time_from + "','" + l_time_to + "'";
        dt = CtlLib.TableReadOpenCursor("ht_rpt_6025000_list_posted", para);
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
			if(l_time_from !="")
			{
				exSheet.Cells[3, 5].Value = "Time :"+l_time_from +" ~ "+l_time_to;
			}
			exSheet.Cells[3, 4].Value = dt.Rows[0]["location_name"].ToString();
			exSheet.Cells[3, 10].Value = dt.Rows[0]["print_time"].ToString();
			/*byte[] MyData = new byte[0];
         MyData = (byte[])dtpicture.Rows[0]["logo_lotus"];
         MemoryStream stream = new MemoryStream(MyData);
         exSheet.Shapes.AddPicture(stream);*/

        }

        //----------------------
        ////end-set-----DataBind--in---Master---
		int pos=5;
        for (int l_addrow = 0; l_addrow < dt.Rows.Count-1; l_addrow++)
        {
            //exSheet.Range["A6"].Rows.EntireRow.Insert();//insert row new of sheet
			exSheet.Range[pos + l_addrow+1, 1].Rows.EntireRow.Insert();
        }
        //set date title of year
        //exSheet.Cells[2, 1].Value = "Income Statement Year" + " " + l_year;

        //set data to detail.
        // loop detail not percent
        int l_cnt = dt.Rows.Count;
        for (int l_row = 1; l_row <= dt.Rows.Count; l_row++)
        {          
                exSheet.Cells[pos + l_row-1, 1].Value = dt.Rows[l_row-1]["date_time"];	
				exSheet.Cells[pos + l_row-1, 2].Value = dt.Rows[l_row-1]["invoice_id"];
				exSheet.Cells[pos + l_row-1, 3].Value = dt.Rows[l_row-1]["post_to"];
				exSheet.Cells[pos + l_row-1, 4].Value = dt.Rows[l_row-1]["guest_name"];
				exSheet.Cells[pos + l_row-1, 5].Value = dt.Rows[l_row-1]["item"];
				exSheet.Cells[pos + l_row-1, 6].Value = dt.Rows[l_row-1]["item_desc"];
				exSheet.Cells[pos + l_row-1, 7].Value = dt.Rows[l_row-1]["amount"];
				exSheet.Cells[pos + l_row-1, 8].Value = dt.Rows[l_row-1]["ex_rate"];
				exSheet.Cells[pos + l_row-1, 9].Value = dt.Rows[l_row-1]["amount_usd"];
				exSheet.Cells[pos + l_row-1, 10].Value = dt.Rows[l_row-1]["loc"];
				exSheet.Cells[pos + l_row-1, 11].Value = dt.Rows[l_row-1]["crt_by"];
				
				if( dt.Rows[l_row-1][1].ToString()=="" && dt.Rows[l_row-1][2].ToString()=="" &&dt.Rows[l_row-1][3].ToString()==""&&dt.Rows[l_row-1][4].ToString()=="")
				{
					string l_Color3="0XF77A7A";
					Color colorValueFrmHex3 = ColorTranslator.FromHtml(l_Color3);
					exSheet.Cells[l_row+pos-1, 1,l_row+pos-1, 11].Interior.Color = colorValueFrmHex3;//set color sub total
				}
							
				if( dt.Rows[l_row-1][1].ToString()=="" && dt.Rows[l_row-1][2].ToString()=="" &&dt.Rows[l_row-1][3].ToString()=="" &&dt.Rows[l_row-1][4].ToString()!="")
				{
					string l_Color3="0XD8D8D8";
					Color colorValueFrmHex3 = ColorTranslator.FromHtml(l_Color3);
					exSheet.Cells[l_row+pos-1, 1,l_row+pos-1, 11].Interior.Color = colorValueFrmHex3;//set color sub total
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