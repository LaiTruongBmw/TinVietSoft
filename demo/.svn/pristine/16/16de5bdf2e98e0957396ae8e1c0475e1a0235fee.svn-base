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

public partial class rpt_60250090_luutru : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());        

        string TemplateFile = "rpt_60250090_luutru.xls";
        string TempFile = "../../../../system/temp/rpt_60250090_luutru_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
	
		 string         p_dfr = Request.QueryString["p_dfr"];
		 string         p_dto = Request.QueryString["p_dto"];
         
        string para = "'" + p_dfr + "','" + p_dto + "'";	
		

		//DataTable dtMaster   = CtlLib.TableReadOpenCursor("ac_rpt_60250300_vatinvoice_mst", para);
		DataTable dtDetail   = CtlLib.TableReadOpenCursor("ht_rpt_60250090_baocao_luutru", para);
		
        for (int l_addrow = 0; l_addrow < dtDetail.Rows.Count-1; l_addrow++)
        {
            exSheet.Range["A9"].Rows.EntireRow.Insert();//insert row new of sheet
        }
        //set detail data
		int pos = 8;
		int i = 0 ;
		
       for (i = 0; i < dtDetail.Rows.Count; i++)
        {								
           // exSheet.Range[pos + i, 2,pos + i, 3].Merge();
			//exSheet.Cells[pos + i, 1 ].Value = i+1;
			//exSheet.Cells[pos + i, 2 ].Value = dtDetail.Rows[i]["item_name"]+" "+dtDetail.Rows[i]["item_lname"];
			exSheet.Cells[pos + i, 1].Value = dtDetail.Rows[i]["nation_name"];
			exSheet.Cells[pos + i, 2].Value = dtDetail.Rows[i]["total"];
			
			exSheet.Cells[pos + i, 3].Value = dtDetail.Rows[i]["male"];
			exSheet.Cells[pos + i, 4].Value = dtDetail.Rows[i]["female"];
			exSheet.Cells[pos + i, 5].Value = dtDetail.Rows[i]["foreign"];
			exSheet.Cells[pos + i, 6].Value = dtDetail.Rows[i]["local_oversea"];
			exSheet.Cells[pos + i, 7].Value = dtDetail.Rows[i]["vietnam"];
			//exSheet.Cells[pos + i, 5 ].Value = dtDetail.Rows[i]["req_uom_01"];
			//exSheet.Cells[pos + i, 6 ].Value = dtDetail.Rows[i]["req_qty_01"];
			//exSheet.Cells[pos + i, 7 ].Value = dtDetail.Rows[i]["pr_stock_qty"];
			//exSheet.Cells[pos + i, 8 ].Value = dtDetail.Rows[i]["description"]; 			
        }
		//---------
		//exSheet.Cells[pos + i, 6 ].Value = "=sum(F10:F"+(pos+i-1)+")";
		//exSheet.Cells[pos + i, 7].Value = "=sum(G10:G"+(pos+i-1)+")";			
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }
        

        exBook.SaveAs(TempFile);
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
        //Response.WriteFile(pdfFilePath);
        Response.WriteFile(TempFile);
        //Stop execute  
        Response.End();

    }

}