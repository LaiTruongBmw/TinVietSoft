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

public partial class rpt_hrpr00400_0 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
	
		string p_org_pk = Request["l_org_pk"];
        string p_emp_id = Request["l_emp_id"];
		string p_item_name = Request["l_item_name"];
		string p_process = Request["l_process"];
		string p_from = Request["l_from"];
		string p_to = Request["l_to"];

        string TemplateFile = "rpt_hrpr00400_0.xls";
        string TempFile = "../../../../system/temp/rpt_hrpr00400_0_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range ;


        string para = "'" + p_emp_id + "','" + p_item_name + "','" + p_process + "','" + p_from + "','" + p_to + "'" ;
		DataTable dt_detail = CtlLib.TableReadOpenCursor("st_hr_rpt_hrpr00400_0", para);
		
		if (dt_detail.Rows.Count == 0)
        {
			Response.Write("There is not have data!");
            Response.End();
        }
		
		string SQL
		= "select to_char(to_date('" + p_from +"', 'yyyymmdd'), 'dd/mm/yyyy') " + 
			", to_char(to_date('" + p_to +"', 'yyyymmdd'), 'dd/mm/yyyy') " +
			"from dual " ;
		DataTable dt_date = CtlLib.TableReadOpen(SQL);
		
	
		
		exSheet.Cells["A3"].Value = "(Từ ngày "+ dt_date.Rows[0][0].ToString() +" đến "+ dt_date.Rows[0][1].ToString() +")" ;
		int row_loop = 6;
		int l_col = dt_detail.Columns.Count;
		int count=0;
		double total_qty=0;
		double total_amt=0;
		for (int l_addrow = 1; l_addrow < dt_detail.Rows.Count; l_addrow++)
        {
            exSheet.Range[row_loop + l_addrow, 20 ].Rows.EntireRow.Insert();//insert row new of sheet
        }

		// xu ly du lieu do vao excel
		if (dt_detail.Rows.Count > 0)
		{
			for (int l_row = 0; l_row < dt_detail.Rows.Count; l_row++)
			{
                
                count++;
                exSheet.Cells[row_loop + l_row, 1].Value = count;
                exSheet.Cells[row_loop + l_row, 2].Value = dt_detail.Rows[l_row][2].ToString();
				
				total_qty += double.Parse(dt_detail.Rows[l_row]["product_qty"].ToString());
				total_amt += double.Parse(dt_detail.Rows[l_row]["product_amt"].ToString());
				// do du lieu vao cac dong 
				for (int col = 3; col < l_col; col++)
				{
					if(IsNumeric(dt_detail.Rows[l_row][col].ToString()))
					{
						exSheet.Cells[row_loop + l_row, col].Value = double.Parse(dt_detail.Rows[l_row][col].ToString());
					}
					else 
						exSheet.Cells[row_loop + l_row, col].Value = dt_detail.Rows[l_row][col].ToString();
							
				}
				
			}  
				
		}  
        exSheet.Cells[row_loop + count, 11].Value =  total_qty;
		exSheet.Cells[row_loop + count, 12].Value =  total_amt;
		//exSheet.Cells[row_loop + count + 2, 9].Value = "Ngày "+ dt_master.Rows[0]["ins_day"].ToString() +" Tháng "+ dt_master.Rows[0]["ins_mon"].ToString() + " Năm "+ dt_master.Rows[0]["ins_year"].ToString();
  
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
	public static bool IsNumeric(string strNum)
    {
        try
        {
            double tmp = double.Parse(strNum);
            return true;
        }
        catch
        {
            return false;
        }
    }
}