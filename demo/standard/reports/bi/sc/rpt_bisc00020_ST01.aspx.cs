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

public partial class rpt_bisc00020_ST01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString()); 
		//CtlLib.SetUser("SALE"); 
		
        string TemplateFile = "rpt_bisc00020_ST01.xls";
        string TempFile = "../../../../system/temp/rpt_bisc00020_ST01_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        
		string p_from_date 			= Request.QueryString["p_from_date"]; 
		string p_to_date 			= Request.QueryString["p_to_date"]; 
		string p_wh_type			= Request.QueryString["p_wh_type"]; 
		string p_wh_pk 	= Request.QueryString["p_tin_warehouse_pk"]; 
		string p_wh_name 			= Request.QueryString["p_wh_name"];                      
        string p_item_group_pk 			= Request.QueryString["p_item_grp"];
        string p_item 				= Request.QueryString["p_item"];
        string p_lang 				= Request.QueryString["p_lang"];    

        DataTable dtInfo   = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00020_ST01_1", "'" + Session["User_ID"].ToString() + "'");
	 	 
	string para = "'" + p_wh_pk + "','" + p_from_date + "','" + p_to_date + "'";	
		
        DataTable dtMaster = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00020_ST01_2", para);
		
		para = "'" + p_from_date + "','" + p_to_date + "','" + p_wh_type + "','" + p_wh_pk + "','" + p_item_group_pk + "','" + p_item + "','" + p_lang + "'";	
		
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00020_ST01_3", para);

        //--set-----DataBind--in---Master---
        if (!string.IsNullOrEmpty(dtInfo.Rows[0]["pic"].ToString()))
        {
            exSheet.Cells[1, 1].Select();
            byte[] MyData = new byte[0];
            MyData = (byte[])dtInfo.Rows[0]["pic"];
            MemoryStream stream = new MemoryStream(MyData);

            Bitmap b = new Bitmap(stream);
            exSheet.Shapes.AddPicture(ResizeImage(b, 100, 55));
        }

        exSheet.Cells["C1"].Value = dtInfo.Rows[0]["partner_name"].ToString();

        exSheet.Cells["C2"].Value = dtInfo.Rows[0]["addr1"].ToString();

        exSheet.Cells["C3"].Value = "Tax code: " + dtInfo.Rows[0]["tax_code"].ToString();

        exSheet.Cells["G1"].Value = "Tell: " + dtInfo.Rows[0]["phone_no"].ToString();

        exSheet.Cells["G2"].Value = "Fax: " + dtInfo.Rows[0]["fax_no"].ToString();

        exSheet.Cells["G3"].Value = "Print date: " + DateTime.Now.ToString("dd/MM/yyyy hh:mm");

        exSheet.Cells["C5"].Value = dtMaster.Rows[0]["wh_name"].ToString() ;

        exSheet.Cells["G5"].Value = dtMaster.Rows[0]["range_date"].ToString() ;
        //---------
                		
	    int l_pos = 7 ;
		
		for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A8"].Rows.EntireRow.Insert();//insert row new of sheet
        }
	
	
        for (int i = 0; i < dtDetail.Rows.Count; i++)
        {            		
			exSheet.Cells[l_pos + i, 1].Value = i+1;
			exSheet.Cells[l_pos + i, 2].Value = dtDetail.Rows[i]["grp_nm"].ToString();
			exSheet.Cells[l_pos + i, 3].Value = dtDetail.Rows[i]["item_code"].ToString();
			exSheet.Cells[l_pos + i, 4].Value = dtDetail.Rows[i]["item_name"].ToString();
			exSheet.Cells[l_pos + i, 5].Value = dtDetail.Rows[i]["uom"].ToString();

			exSheet.Cells[l_pos + i, 6].Value = dtDetail.Rows[i]["begin_qty"];
			exSheet.Cells[l_pos + i, 7].Value = dtDetail.Rows[i]["in_qty"];
			exSheet.Cells[l_pos + i, 8].Value = dtDetail.Rows[i]["out_qty"];
			exSheet.Cells[l_pos + i, 9].Value = dtDetail.Rows[i]["end_qty"];					
        }

		exSheet.Cells[dtDetail.Rows.Count + 7, 6].Value = "=SUM(F7:F" + (dtDetail.Rows.Count + 6) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 7, 7].Value = "=SUM(G7:G" + (dtDetail.Rows.Count + 6) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 7, 8].Value = "=SUM(H7:H" + (dtDetail.Rows.Count + 6) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 7, 9].Value = "=SUM(I7:I" + (dtDetail.Rows.Count + 6) + ")";        
                                          
        // end loop detail percent        
        if (File.Exists(TempFile))        	
        {                                
            File.Delete(TempFile);
        }


        // hide row firts 

        //range = exSheet.Range["A1"];
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