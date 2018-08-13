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

public partial class reports_rpt_dscd00031 : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		CtlLib.SetUser("sale");
		string p_from_date = Request["p_from_date"];
		string p_to_date = Request["p_to_date"];

		string TemplateFile = "rpt_dscd00031.xls";
		string TempFile = "../../../../system/temp/rpt_dscd00031_" + Session["User_ID"].ToString() + ".xls";
		TemplateFile = Server.MapPath(TemplateFile);
		TempFile = Server.MapPath(TempFile);

		//Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

		//Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

		IRange range;

		//bind data to excel file

        string para = "'" + p_from_date + "','" + p_to_date + "'";
		DataTable dtInfo = CtlLib.TableReadOpenCursor("st_lg_RPT_DSCD00030_3");
		DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_RPT_DSCD00030_1", para);

		//--set-----DataBind--in---Master---
        if (!string.IsNullOrEmpty(dtInfo.Rows[0]["pic"].ToString()))
		{
			exSheet.Cells[1, 1].Select();
			byte[] MyData = new byte[0];
			MyData = (byte[])dtInfo.Rows[0]["pic"];
			MemoryStream stream = new MemoryStream(MyData);

			Bitmap b = new Bitmap(stream);
			exSheet.Shapes.AddPicture(ResizeImage(b, 90, 59));
		}

		exSheet.Cells[1, 3].Value = dtInfo.Rows[0]["partner_name"].ToString();
		exSheet.Cells[1, 8].Value = "Tel: " + dtInfo.Rows[0]["partner_name"].ToString();

		exSheet.Cells[2, 3].Value = dtInfo.Rows[0]["addr1"].ToString();
		exSheet.Cells[2, 8].Value = "Fax: " + dtInfo.Rows[0]["fax_no"].ToString();

		exSheet.Cells[3, 3].Value = "MST: " + dtInfo.Rows[0]["tax_code"].ToString();
		exSheet.Cells[3, 8].Value = "Print date: " + DateTime.Now.ToString("dd/MM/yyyy hh:mm");

		string s_date = System.DateTime.ParseExact(p_from_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy");
		s_date += " - " + System.DateTime.ParseExact(p_to_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy");
		exSheet.Cells[5, 3].Value = s_date;
		////end-set-----DataBind--in---Master---
        string strRtnType = string.Empty;
		string strItem = string.Empty;

		int r_group = 0, rc = 0;
		int[] rg = new int[dtDetail.Rows.Count];

        for (int l_addrow = 0; l_addrow < dtDetail.Rows.Count; l_addrow++)
		{
			if (strRtnType != dtDetail.Rows[l_addrow]["rtn_type"].ToString() || strItem != dtDetail.Rows[l_addrow]["item_code"].ToString())
			{
				rg[r_group] = rc;

				rc = 1;
				r_group++;

				DataRow r = dtDetail.NewRow();
				dtDetail.Rows.InsertAt(r, l_addrow);

				strRtnType = dtDetail.Rows[l_addrow]["rtn_type"].ToString();
				strItem = dtDetail.Rows[l_addrow]["item_code"].ToString();
                l_addrow = l_addrow + 1;
			}
			else
			{
				rc++;
			}
		}

		for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count + r_group; l_addrow++)
		{
			exSheet.Range["A10"].Rows.EntireRow.Insert();//insert row new of sheet
		}

		// loop detail not percent
        int r_up = 0;
		int quantity = 0;
		for (int l_row = 0; l_row < dtDetail.Rows.Count; l_row++)
		{
			for (int col = 1; col <= 9; col++)
			{
				if (l_row == 0)
				{
					exSheet.Cells[9 + l_row, col].Value = dtDetail.Rows[l_row]["item_code"].ToString();
					exSheet.Cells[9 + l_row, col + 1].Value = dtDetail.Rows[l_row]["item_name"].ToString();
					exSheet.Cells[9 + l_row, 3, 9 + l_row, 4].Merge();

					strRtnType = dtDetail.Rows[l_row]["rtn_type"].ToString();
					strItem = dtDetail.Rows[l_row]["item_code"].ToString();
					r_up++;
					if(dtDetail.Rows[l_row]["rtn_qty"].ToString()!="")
					{
							quantity += Convert.ToInt32(dtDetail.Rows[l_row]["rtn_qty"]);
					}
					
				}
				else
				{
					if (strRtnType != dtDetail.Rows[l_row]["rtn_type"].ToString() || strItem != dtDetail.Rows[l_row]["item_code"].ToString())
					{
						exSheet.Cells[8 + l_row + r_up, 1, 8 + l_row + r_up, 5].Merge();
						exSheet.Cells[8 + l_row + r_up, 1].Value = "Sub Total";
						exSheet.Cells[8 + l_row + r_up, 6].Value = quantity;

						exSheet.Cells[9 + l_row + r_up, col].Value = dtDetail.Rows[l_row]["item_code"].ToString();
						exSheet.Cells[9 + l_row + r_up, col + 1].Value = dtDetail.Rows[l_row]["item_name"].ToString();
						exSheet.Cells[9 + l_row + r_up, 3, 9 + l_row + r_up, 4].Merge();

						strRtnType = dtDetail.Rows[l_row]["rtn_type"].ToString();
						strItem = dtDetail.Rows[l_row]["item_code"].ToString();
						r_up++;
						if(dtDetail.Rows[l_row]["rtn_qty"].ToString()!= "")
						{
							quantity += Convert.ToInt32(dtDetail.Rows[l_row]["rtn_qty"]);
						}
                    }
                    if (l_row == dtDetail.Rows.Count - 1)
                    {
                        exSheet.Cells[9 + l_row + r_up, 1, 9 + l_row + r_up, 5].Merge();
                        exSheet.Cells[9 + l_row + r_up, 1].Value = "Sub Total";
                    }
                }
            }
            /* else if (col == 3) // item_name
             {
                 exSheet.Cells[9 + l_row, col].Value = dtDetail.Rows[l_row]["item_name"].ToString();
                 exSheet.Cells[9 + l_row, 3, 9 + l_row, 4].Merge();
             }
             else if (col == 5) // rtn_uom
             {
                 exSheet.Cells[9 + l_row, col].Value = dtDetail.Rows[l_row]["rtn_uom"].ToString();
             }
             else if (col == 6) // rtn_qty
             {
                 exSheet.Cells[9 + l_row, col].Value = Convert.ToInt32(dtDetail.Rows[l_row]["rtn_qty"]);
             }
             else if (col == 7) // grade_a
             {
                 exSheet.Cells[9 + l_row, col].Value = Convert.ToInt32(dtDetail.Rows[l_row]["grade_a"]);
             }
             else if (col == 8) // grade_b
             {
                 exSheet.Cells[9 + l_row, col].Value = Convert.ToInt32(dtDetail.Rows[l_row]["grade_b"]);
             }
             else if (col == 9) // rtn_type
             {
                 exSheet.Cells[9 + l_row, col].Value = dtDetail.Rows[l_row]["rtn_type"].ToString();
             }*/
        }
        //exSheet.Cells[dtDetail.Rows.Count + 9, 6].Value = "=SUM(F9:F" + (dtDetail.Rows.Count + 8) + ")";
        //exSheet.Cells[dtDetail.Rows.Count + 9, 7].Value = "=SUM(G9:G" + (dtDetail.Rows.Count + 8) + ")";
        //exSheet.Cells[dtDetail.Rows.Count + 9, 8].Value = "=SUM(H9:H" + (dtDetail.Rows.Count + 8) + ")";
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
}