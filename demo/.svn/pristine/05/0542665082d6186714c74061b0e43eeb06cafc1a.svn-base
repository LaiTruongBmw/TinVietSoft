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

public partial class rpt_ht_60280180_RoomSummaryMonthly : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		CtlLib.SetUser("crm");
		

        string TemplateFile = "rpt_ht_60280180_RoomSummaryMonthly.xls";
        string TempFile = "../../../../system/temp/rpt_ht_60280180_RoomSummaryMonthly_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
	
		
			string p_room_no = Request["p_room_no"];  
			string p_from_date = Request["p_checkout_date_frm"];
			string p_to_date = Request["p_checkout_date_to"];
			        
        string para = "'" + p_room_no + "','" + p_from_date +"','" + p_to_date+ "'";		
		DataTable dt = CtlLib.TableReadOpenCursor("ht_sel_60280180" , para);		
		if (dt.Rows.Count == 0)
        {
			exSheet.Cells[8, 1].HorizontalAlignment = XlHAlign.xlHAlignLeft;
			exSheet.Cells[8, 1].Font.Color = Color.Red;
            exSheet.Cells[8, 1].Value = "There is not data!";
        }
        // MASTER   

		
		
		// INSERT ROWS
		 
		for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range["A7"].Rows.EntireRow.Insert();//insert row new of sheet
        }
						
		// SET DATA
		int pos = 6 ;
		int i   = 0  ;		  						
		for (i = 0; i < dt.Rows.Count; i++)
        {								
			
			exSheet.Cells[pos + i, 1 ].Value = dt.Rows[i]["folio_no"];
			exSheet.Cells[pos + i, 2 ].Value = dt.Rows[i]["room_no"];
			exSheet.Cells[pos + i, 3 ].Value = dt.Rows[i]["last_name"];
			exSheet.Cells[pos + i, 4 ].Value = dt.Rows[i]["checkin_date"];
			exSheet.Cells[pos + i, 5 ].Value = dt.Rows[i]["checkout_date"];
			exSheet.Cells[pos + i, 6 ].Value = dt.Rows[i]["days"];
			exSheet.Cells[pos + i, 7 ].Value = dt.Rows[i]["room_type"]; 
			exSheet.Cells[pos + i, 8 ].Value = dt.Rows[i]["avg_rate_amt"]; 
			
			exSheet.Cells[pos + i, 9 ].Value = dt.Rows[i]["room_charge"]; 
			exSheet.Cells[pos + i, 10 ].Value = dt.Rows[i]["total_due"];
			exSheet.Cells[pos + i, 11 ].Value = dt.Rows[i]["actual_pay"];			
			exSheet.Cells[pos + i, 12 ].Value = dt.Rows[i]["advance_amt"];
			exSheet.Cells[pos + i, 13 ].Value = dt.Rows[i]["fnb_hotel_amt"];
			exSheet.Cells[pos + i, 14 ].Value = dt.Rows[i]["minibar_amt"];
			exSheet.Cells[pos + i, 15 ].Value = dt.Rows[i]["laundry_amt"];
			exSheet.Cells[pos + i, 16 ].Value = dt.Rows[i]["telephone"];
			exSheet.Cells[pos + i, 17 ].Value = dt.Rows[i]["others_amt"];
			exSheet.Cells[pos + i, 18 ].Value = dt.Rows[i]["spa_amt"];
			exSheet.Cells[pos + i, 19 ].Value = dt.Rows[i]["shop_amt"];
			exSheet.Cells[pos + i, 20 ].Value = dt.Rows[i]["adjust_amt"];
			
			exSheet.Cells[pos + i, 21 ].Value = dt.Rows[i]["checkin_by"];
			exSheet.Cells[pos + i, 22 ].Value = dt.Rows[i]["checkin_time"];
			exSheet.Cells[pos + i, 23 ].Value = dt.Rows[i]["checkout_by"];
			exSheet.Cells[pos + i, 24 ].Value = dt.Rows[i]["checkout_time"];
			exSheet.Cells[pos + i, 25 ].Value = dt.Rows[i]["rate_name"];
			exSheet.Cells[pos + i, 26 ].Value = dt.Rows[i]["pay_method"];
					
        }
		//---------
		 if (dt.Rows.Count > 0)
        {
			exSheet.Cells[pos + dt.Rows.Count, 9].Value = "=sum(I"+pos+":I"+(pos+dt.Rows.Count-1)+")";
			exSheet.Cells[pos + dt.Rows.Count, 10 ].Value = "=sum(J"+pos+":J"+(pos+dt.Rows.Count-1)+")";
			exSheet.Cells[pos + dt.Rows.Count, 11 ].Value = "=sum(K"+pos+":K"+(pos+dt.Rows.Count-1)+")";
			exSheet.Cells[pos + dt.Rows.Count, 12 ].Value = "=sum(L"+pos+":L"+(pos+dt.Rows.Count-1)+")";
			exSheet.Cells[pos + dt.Rows.Count, 13 ].Value = "=sum(M"+pos+":M"+(pos+dt.Rows.Count-1)+")";
			exSheet.Cells[pos + dt.Rows.Count, 14 ].Value = "=sum(N"+pos+":N"+(pos+dt.Rows.Count-1)+")";
			exSheet.Cells[pos + dt.Rows.Count, 15 ].Value = "=sum(O"+pos+":O"+(pos+dt.Rows.Count-1)+")";
			exSheet.Cells[pos + dt.Rows.Count, 16 ].Value = "=sum(P"+pos+":P"+(pos+dt.Rows.Count-1)+")";
			exSheet.Cells[pos + dt.Rows.Count, 17 ].Value = "=sum(Q"+pos+":Q"+(pos+dt.Rows.Count-1)+")";
			exSheet.Cells[pos + dt.Rows.Count, 18 ].Value = "=sum(R"+pos+":R"+(pos+dt.Rows.Count-1)+")";
			exSheet.Cells[pos + dt.Rows.Count, 19 ].Value = "=sum(S"+pos+":S"+(pos+dt.Rows.Count-1)+")";
			exSheet.Cells[pos + dt.Rows.Count, 20 ].Value = "=sum(T"+pos+":T"+(pos+dt.Rows.Count-1)+")";
		}		 					
		//---------
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