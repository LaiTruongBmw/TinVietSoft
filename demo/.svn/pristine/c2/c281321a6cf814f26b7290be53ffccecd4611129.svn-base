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

public partial class rpt_60280140 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

          CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string p_dt_frm = Request["p_dt_frm"]; 
		string p_dt_to = Request["p_dt_to"];
		string P_DummyRoom = Request["P_DummyRoom"];
		string p_GroupName = Request["p_GroupName"];
       
        string TemplateFile = "rpt_60280140.xls";
        string TempFile = "../../../../system/temp/rpt_60280140_" + Session["User_ID"].ToString() + ".xls";
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

        para = "'" + p_dt_frm + "','" + p_dt_to + "','" + P_DummyRoom + "','" + p_GroupName + "'";
		
        dt = CtlLib.TableReadOpenCursor("rpt_ht_sel_60280140", para); 
        //-----header---   

        //---end--header---
        //--set-----DataBind--in---Master---
        if (dt.Rows.Count == 0)
        {
            exSheet.Cells[6, 3].Value = "There is not data!";

        }
      //  if (dt.Rows.Count > 0)   
      //  {
		////	exSheet.Cells[3, 1].Value = "Date: "+l_dtfrm.Substring(6, 2)+"/"+l_dtfrm.Substring(4, 2)+"/"+l_dtfrm.Substring(0, 4)+" ~ "+""+l_dtto.Substring(6, 2)+"/"+l_dtto.Substring(4, 2)+"/"+l_dtto.Substring(0, 4);
        //    exSheet.Cells[3, 6].Value = dt.Rows[0]["print_time"].ToString();
		//	exSheet.Cells[3, 3].Value = "Total : "+dt.Rows.Count.ToString()+" row(s).";
       // }

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
		float l_total_amt_usd=0;
		double l_total_amt_vnd=0;
       int pos = 5 ;
		int i   = 0  ;		  						
		for (i = 0; i < dt.Rows.Count; i++)
        {								
			
			exSheet.Cells[pos + i, 1 ].Value = dt.Rows[i]["audit_date"];
			exSheet.Cells[pos + i, 2 ].Value = dt.Rows[i]["dummy_room"];
			exSheet.Cells[pos + i, 3 ].Value = dt.Rows[i]["room_no"];
			exSheet.Cells[pos + i, 4 ].Value = dt.Rows[i]["room_type"];
			exSheet.Cells[pos + i, 5 ].Value = dt.Rows[i]["in_room_amt"];
			exSheet.Cells[pos + i, 6 ].Value = dt.Rows[i]["group_name"];
			exSheet.Cells[pos + i, 7 ].Value = dt.Rows[i]["guest_name"]; 
			exSheet.Cells[pos + i, 8 ].Value = dt.Rows[i]["rate_plan"]; 			
			exSheet.Cells[pos + i, 9 ].Value = dt.Rows[i]["checkin_date"]; 
			exSheet.Cells[pos + i, 10 ].Value = dt.Rows[i]["checkout_date"];
			
			}
	exSheet.Cells[pos + i, 5 ].Value = "=sum(E5:E"+(pos+i-1)+")";
		//exSheet.Cells[5 + l_cnt, 6].Value =l_total_amt_usd;
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