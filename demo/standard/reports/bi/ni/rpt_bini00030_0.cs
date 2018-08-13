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

public partial class rpt_bini00030_0 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string p_master_pk = Request["master_pk"];

        string TemplateFile = "rpt_bini00030_0.xls";
        string TempFile = "../../../../system/temp/rpt_bini00030_0_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;


        string para = "'" + p_master_pk + "'";
        DataTable dt_com = CtlLib.TableReadOpenCursor("lg_rpt_bini00030_0_0", para);
		DataTable dt_master = CtlLib.TableReadOpenCursor("lg_rpt_bini00030_0_1", para);
		DataTable dt_detail = CtlLib.TableReadOpenCursor("lg_rpt_bini00030_0_2", para);
		
		if (dt_master.Rows.Count == 0)
        {
			Response.Write("there is not have data!");
            Response.End();
        }
		//insert picture
		if (dt_com.Rows[0]["image"].ToString() != "")
		{
			byte[] MyData = new byte[0];
			MyData = (byte[])dt_com.Rows[0]["image"];
			MemoryStream stream = new MemoryStream(MyData);

			Bitmap b = new Bitmap(stream);
			exSheet.Cells[1, 1].Select();
			exSheet.Shapes.AddPicture(ResizeImage(b, 90, 85));
		}
		exSheet.Cells["C1"].Value = dt_com.Rows[0]["com_name"];
		exSheet.Cells["C2"].Value = dt_com.Rows[0]["address"];
		exSheet.Cells["C3"].Value = "MST: " +dt_com.Rows[0]["tax_code"];
		exSheet.Cells["J1"].Value = "Tel: " +dt_com.Rows[0]["tel"];
		exSheet.Cells["J2"].Value = "Fax: " +dt_com.Rows[0]["fax"];
		exSheet.Cells["J3"].Value = "Print Date: " +dt_com.Rows[0]["print_dt"];
		
		exSheet.Cells["B6"].Value = "DATE: " +dt_master.Rows[0]["in_date"];
		exSheet.Cells["B7"].Value = "Số (No.): " + dt_master.Rows[0]["slip_no"];
		exSheet.Cells["D8"].Value = dt_master.Rows[0]["supplier"];
		exSheet.Cells["D9"].Value = dt_master.Rows[0]["wh_name"];
		
		
		int row_loop = 15;
		int l_col = dt_detail.Columns.Count;
		int count=0;
		double total_qty=0;
		double total_amt=0;
		double total_ttamt=0;
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
                exSheet.Cells[row_loop + l_row, 2].Value = count;
                
				total_qty += double.Parse(dt_detail.Rows[l_row]["in_qty"].ToString());
				total_amt += double.Parse(dt_detail.Rows[l_row]["amount"].ToString());
				total_ttamt += double.Parse(dt_detail.Rows[l_row]["total_amount"].ToString());	
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
            exSheet.Cells[row_loop + count, 6].Value =  total_qty;
			exSheet.Cells[row_loop + count, 8].Value =  total_amt;
			exSheet.Cells[row_loop + count, 10].Value =  total_ttamt;	
		}  
        
		exSheet.Cells[row_loop + count + 2, 10].Value = "Ngày "+ dt_master.Rows[0]["ins_day"].ToString() +" Tháng "+ dt_master.Rows[0]["ins_mon"].ToString() + " Năm "+ dt_master.Rows[0]["ins_year"].ToString();
  
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