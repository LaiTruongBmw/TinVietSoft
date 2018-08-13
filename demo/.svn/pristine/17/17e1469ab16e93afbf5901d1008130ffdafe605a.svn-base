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

public partial class rpt_60240010_Group_Record : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       CtlLib.SetUser(Session["APP_DBUSER"].ToString());  

        string l_pk = Request["p_master_pk"];
       
        string TemplateFile = "rpt_60240010_Group_Record.xls";
        string TempFile = "../../../../system/temp/rpt_60240010_Group_Record_" + Session["User_ID"].ToString() + ".xls";
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

        para = "'" + l_pk + "'";
        dt = CtlLib.TableReadOpenCursor("ht_rpt_60240010_Group_Record", para);
        //-----header---   

        //---end--header---
        //--set-----DataBind--in---Master---
        if (dt.Rows.Count == 0)
        {
            exSheet.Cells[6, 8].Value = "There is not data!";

        }
        if (dt.Rows.Count > 0)
        {
			//No.of person: Adult:       Child:
			exSheet.Cells[4, 3].Value = "No. of Room :"+dt.Rows[0]["total_room"].ToString(); 
			exSheet.Cells[4, 1].Value = "No.of person: Adult: "+dt.Rows[0]["adult"].ToString()+" Child: "+dt.Rows[0]["childrens"].ToString();
			exSheet.Cells[3, 2].Value = dt.Rows[0]["from_date"].ToString();
			exSheet.Cells[3, 4].Value = dt.Rows[0]["arrival_time"].ToString();
			exSheet.Cells[3, 6].Value = dt.Rows[0]["date_to"].ToString();
			exSheet.Cells[3, 8].Value = dt.Rows[0]["departure_time"].ToString();
			exSheet.Cells[2, 6].Value = dt.Rows[0]["company_name"].ToString();
			exSheet.Cells[2, 2].Value = dt.Rows[0]["group_name"].ToString();	
        }

        //----------------------
        ////end-set-----DataBind--in---Master---

        for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range["A10"].Rows.EntireRow.Insert();//insert row new of sheet

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
				exSheet.Cells[l_row+8, 4,l_row+8, 8].Merge();
				for (int col = 0; col <= 6 ;col++)
				{				
					if(col==0)
					{
						exSheet.Cells[8 + l_row,1].Value = dt.Rows[l_row - 1]["room_no"].ToString();
					}
					if(col==1)
					{
						exSheet.Cells[8 + l_row, 2].Value = dt.Rows[l_row - 1]["guest_name"].ToString();
					}
					if(col==3)
					{
						exSheet.Cells[8 + l_row, 4].Value = dt.Rows[l_row - 1]["description"].ToString();
					}
				}	
			}
		}
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }


        // hide row firts 

        //range = exSheet.Range["A1"];
        // hide row A5 
        //range.Rows.Hidden = true;

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