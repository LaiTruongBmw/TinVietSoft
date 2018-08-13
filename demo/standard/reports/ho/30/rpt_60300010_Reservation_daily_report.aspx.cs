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

public partial class rpt_60300010_Reservation_daily_report : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		CtlLib.SetUser(Session["APP_DBUSER"].ToString());  
		

        string TemplateFile = "rpt_60300010_Reservation_daily_report.xls";
        string TempFile = "../../../../system/temp/rpt_60300010_Reservation_daily_report_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
	
		
			string p_dtfrm = Request["p_dtfrm"]; 
			
			        
        string para = "'" + p_dtfrm +"'";		
		DataTable dt = CtlLib.TableReadOpenCursor("ht_rpt_60300010_rm_rsv_state" , para);		
	
        // MASTER   
		exSheet.Cells["c2"].Value = dt.Rows[0]["p_date"].ToString();
		exSheet.Cells[2, 43].Value = dt.Rows[0]["print_time"].ToString();
		//exSheet.Cells[6, 1].Value ="Print time: "+ dt.Rows[0]["print_time"].ToString();
		exSheet.Cells[4, 13].Value = dt.Rows[0]["month_curr"].ToString();
		exSheet.Cells[4,16].Value = dt.Rows[0]["month02"].ToString();
		exSheet.Cells[4,19].Value = dt.Rows[0]["month03"].ToString();
		exSheet.Cells[4,22].Value = dt.Rows[0]["month04"].ToString();
		exSheet.Cells[4,25].Value = dt.Rows[0]["month05"].ToString();
		exSheet.Cells[4,28].Value = dt.Rows[0]["month06"].ToString();
		exSheet.Cells[4,31].Value = dt.Rows[0]["month07"].ToString();
		exSheet.Cells[4,34].Value = dt.Rows[0]["month08"].ToString();
		exSheet.Cells[4,37].Value = dt.Rows[0]["month09"].ToString();
		exSheet.Cells[4,40].Value = dt.Rows[0]["month10"].ToString();
		exSheet.Cells[4,43].Value = dt.Rows[0]["month11"].ToString();
		exSheet.Cells[4,46].Value = dt.Rows[0]["month12"].ToString();
		
		// INSERT ROWS
		 
		  
		for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range["A6"].Rows.EntireRow.Insert();//insert row new of sheet
        }
		int pos = 4 ,row_num=0;			
		for (int i = 1; i <= dt.Rows.Count; i++)
        {								
			if((dt.Rows[i-1]["mkt_segment"].ToString() !="")&&(dt.Rows[i-1]["company_name"].ToString()!=""))
			{
				row_num=row_num+1;
				exSheet.Cells[pos + i, 1 ].Value = row_num;
			}
			
			exSheet.Cells[pos + i, 2 ].Value = dt.Rows[i-1]["mkt_segment"];
			exSheet.Cells[pos + i, 3 ].Value = dt.Rows[i-1]["company_name"];
			//exSheet.Cells[pos + i, 4 ].Value = dt.Rows[i-1]["Allotment_day"];
			exSheet.Cells[pos + i, 4].Value = dt.Rows[i-1]["total_night"];
			exSheet.Cells[pos + i, 5].Value = dt.Rows[i-1]["weekday"];
			exSheet.Cells[pos + i, 6].Value = dt.Rows[i-1]["weekday_rate"];
			exSheet.Cells[pos + i, 7].Value = dt.Rows[i-1]["weekend"];
			exSheet.Cells[pos + i, 8].Value = dt.Rows[i-1]["weekend_rate"];
			exSheet.Cells[pos + i, 9].Value = dt.Rows[i-1]["total_rm_amt"];
			exSheet.Cells[pos + i, 10].Value = dt.Rows[i-1]["total_rate"];
			
			exSheet.Cells[pos + i, 11].Value = dt.Rows[i-1]["n1"];
			exSheet.Cells[pos + i, 12].Value = dt.Rows[i-1]["rate1"];
			exSheet.Cells[pos + i, 13].Value = dt.Rows[i-1]["d1"];
			
			exSheet.Cells[pos + i, 14].Value = dt.Rows[i-1]["n2"];
			exSheet.Cells[pos + i, 15].Value = dt.Rows[i-1]["rate2"];
			exSheet.Cells[pos + i, 16].Value = dt.Rows[i-1]["d2"];
			
			exSheet.Cells[pos + i, 17].Value = dt.Rows[i-1]["n3"];
			exSheet.Cells[pos + i, 18].Value = dt.Rows[i-1]["rate3"];
			exSheet.Cells[pos + i, 19].Value = dt.Rows[i-1]["d3"];
			
			exSheet.Cells[pos + i, 20].Value = dt.Rows[i-1]["n4"];
			exSheet.Cells[pos + i, 21].Value = dt.Rows[i-1]["rate4"];
			exSheet.Cells[pos + i, 22].Value = dt.Rows[i-1]["d4"];
			
			exSheet.Cells[pos + i, 23].Value = dt.Rows[i-1]["n5"];
			exSheet.Cells[pos + i, 24].Value = dt.Rows[i-1]["rate5"];
			exSheet.Cells[pos + i, 25].Value = dt.Rows[i-1]["d5"];
			
			exSheet.Cells[pos + i, 26].Value = dt.Rows[i-1]["n6"];
			exSheet.Cells[pos + i, 27].Value = dt.Rows[i-1]["rate6"];
			exSheet.Cells[pos + i, 28].Value = dt.Rows[i-1]["d6"];
			
			exSheet.Cells[pos + i, 29].Value = dt.Rows[i-1]["n7"];
			exSheet.Cells[pos + i, 30].Value = dt.Rows[i-1]["rate7"];
			exSheet.Cells[pos + i, 31].Value = dt.Rows[i-1]["d7"];
			
			exSheet.Cells[pos + i, 32].Value = dt.Rows[i-1]["n8"];
			exSheet.Cells[pos + i, 33].Value = dt.Rows[i-1]["rate8"];
			exSheet.Cells[pos + i, 34].Value = dt.Rows[i-1]["d8"];
			
			exSheet.Cells[pos + i, 35].Value = dt.Rows[i-1]["n9"];
			exSheet.Cells[pos + i, 36].Value = dt.Rows[i-1]["rate9"];
			exSheet.Cells[pos + i, 37].Value = dt.Rows[i-1]["d9"];
			
			exSheet.Cells[pos + i, 38].Value = dt.Rows[i-1]["n10"];
			exSheet.Cells[pos + i, 39].Value = dt.Rows[i-1]["rate10"];
			exSheet.Cells[pos + i, 40].Value = dt.Rows[i-1]["d10"];
			
			exSheet.Cells[pos + i, 41].Value = dt.Rows[i-1]["n11"];
			exSheet.Cells[pos + i, 42].Value = dt.Rows[i-1]["rate11"];
			exSheet.Cells[pos + i, 43].Value = dt.Rows[i-1]["d11"];
			
			exSheet.Cells[pos + i, 44].Value = dt.Rows[i-1]["n12"];
			exSheet.Cells[pos + i, 45].Value = dt.Rows[i-1]["rate12"];
			exSheet.Cells[pos + i, 46].Value = dt.Rows[i-1]["d12"];

			exSheet.Cells[pos + i, 47].Value = dt.Rows[i-1]["night_month_over"];
			exSheet.Cells[pos + i, 48].Value = dt.Rows[i-1]["rate_over"];
			exSheet.Cells[pos + i, 49].Value = dt.Rows[i-1]["amt_month_over"];
			if((dt.Rows[i-1]["mkt_segment"].ToString() !="")&&(dt.Rows[i-1]["company_name"].ToString()==""))
			{
				string l_Color="0XD8D8D8";
				Color colorValueFrmHex = ColorTranslator.FromHtml(l_Color);//var color
				exSheet.Cells[pos + i, 3,pos + i, 49].Interior.Color = colorValueFrmHex;//set color
				exSheet.Cells[pos + i,3].Value ="Sub Total:";
			}
			
			if((dt.Rows[i-1]["mkt_segment"].ToString() =="")&&(dt.Rows[i-1]["company_name"].ToString()==""))
			{
				string l_Color="0X18D8D8";
				Color colorValueFrmHex = ColorTranslator.FromHtml(l_Color);//var color
				exSheet.Cells[pos + i, 3,pos + i, 49].Interior.Color = colorValueFrmHex;//set color
				exSheet.Cells[pos + i,3].Value ="Total:";
			}
			
			if(i<dt.Rows.Count)
			{
				if(dt.Rows[i-1]["mkt_segment"].ToString() == dt.Rows[i]["mkt_segment"].ToString())
				{	
					exSheet.Range[i+4, 2,i+5, 2].Merge();
				}
			}
		}
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