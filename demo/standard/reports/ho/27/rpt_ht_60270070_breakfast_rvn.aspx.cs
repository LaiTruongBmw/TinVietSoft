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

public partial class rpt_ht_60270070_breakfast_rvn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		//CtlLib.SetUser(Session["crm"].ToString());
		CtlLib.SetUser("crm");

        string TemplateFile = "rpt_ht_60270070_breakfast_rvn.xls";
        string TempFile = "../../../../system/temp/rpt_ht_60270070_breakfast_rvn_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
	
		
			string p_dfrom = Request["p_dfrom"]; 
			string p_dto = Request["p_dto"]; 
			string p_chkUseYN = Request["p_chkUseYN"]; 
						        
        string para = "'" + p_dfrom + "','" + p_dto + "','" + p_chkUseYN + "'";		
		DataTable dt = CtlLib.TableReadOpenCursor("ht_sel_60270100" , para);		
	
        // MASTER   

		
		
		// INSERT ROWS
		 
		for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range["A8"].Rows.EntireRow.Insert();//insert row new of sheet
        }
						
		// SET DATA
		int pos = 7 ;
		int i   = 0  ;		  						
		for (i = 0; i < dt.Rows.Count; i++)
        {								
			exSheet.Cells[pos + i, 1 ].Value = dt.Rows[i]["room_no"];
			exSheet.Cells[pos + i, 2 ].Value = dt.Rows[i]["room_type"];
			exSheet.Cells[pos + i, 3 ].Value = dt.Rows[i]["last_name"];
			exSheet.Cells[pos + i, 4 ].Value = dt.Rows[i]["adult"];
			exSheet.Cells[pos + i, 5 ].Value = dt.Rows[i]["child"];
			exSheet.Cells[pos + i, 6 ].Value = dt.Rows[i]["nights"];
			exSheet.Cells[pos + i, 7 ].Value = dt.Rows[i]["amount"]; 
			exSheet.Cells[pos + i, 8 ].Value = dt.Rows[i]["svc_amt"]; 
			exSheet.Cells[pos + i, 9 ].Value = dt.Rows[i]["vat_amt"]; 
			exSheet.Cells[pos + i, 10 ].Value = dt.Rows[i]["total_due"]; 
			exSheet.Cells[pos + i, 11].Value = dt.Rows[i]["total_due_usd"]; 
			exSheet.Cells[pos + i, 12].Value = dt.Rows[i]["checkin_date"]; 
			exSheet.Cells[pos + i, 13].Value = dt.Rows[i]["checkout_date"]; 
					
        }
		exSheet.Cells[pos + i, 7 ].Value = "=sum(G7:G"+(pos+i-1)+")";
		exSheet.Cells[pos + i, 8 ].Value = "=sum(H7:H"+(pos+i-1)+")";
		exSheet.Cells[pos + i, 9 ].Value = "=sum(i7:I"+(pos+i-1)+")";
		exSheet.Cells[pos + i, 10 ].Value = "=sum(J7:J"+(pos+i-1)+")";
		exSheet.Cells[pos + i, 11 ].Value = "=sum(K7:K"+(pos+i-1)+")";
		//exSheet.Cells["B2"].Value = dt.Rows[0]["print_time"];
				 					
		if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }
        // hide row firts 
        range = exSheet.Range["A1"];
        // hide row A5 
        // range.Rows.Hidden = true;
        // font bold header
        /*range = exSheet.Range["A1:AC1"];
        range.Rows[4].Font.Bold = true;*/

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

    public Bitmap ResizeImage(Bitmap d, int w, int h)
    {
        Bitmap q = new Bitmap(w, h);
        float f, g;
        f = (float)w / (float)d.Width;
        g = (float)h / (float)d.Height;
        for (int i = 0; i < w; i++)
        {
            for (int j = 0; j < h; j++)
            {
                Color c;
                c = d.GetPixel((int)(i / f), (int)(j / g));
                q.SetPixel(i, j, c);
            }
        }
        return q;
    }
}