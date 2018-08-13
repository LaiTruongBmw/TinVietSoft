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

public partial class rpt_bisc00030_DR07 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
		
        string l_from_date = Request["p_from_date"];
        string l_to_date   = Request["p_to_date"];        

        string TemplateFile = "rpt_bisc00030_DR07.xls";
		
        string TempFile = "../../../../system/temp/rpt_bisc00030_DR07_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        string l_parameter = "'" + l_from_date + "','" + l_to_date + "'";
		
        DataTable dtMaster = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00030_DR07_1", l_parameter);
		DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_bisc00030_DR07_2", l_parameter);

        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A12"].Rows.EntireRow.Insert();//insert row new of sheet

        }
		
		if ( dtMaster.Rows.Count > 0 )
		{
			exSheet.Cells["C8"].Value = dtMaster.Rows[0]["doc_date"].ToString();  
		}
		
		//-----------------------
		exSheet.Cells["L8"].Value = DateTime.Now.ToString("HH:mm"); 
		
		int l_row = 0;
        // loop detail not percent
        for (l_row = 0; l_row < dtDetail.Rows.Count; l_row++)
        {   
			exSheet.Cells[11 + l_row, 1].Value = dtDetail.Rows[l_row]["item_seq"];    
			
            exSheet.Cells[11 + l_row, 2].Value = dtDetail.Rows[l_row]["item_code"]; 
			exSheet.Cells[11 + l_row, 3].Value = dtDetail.Rows[l_row]["virtual_code"]; 
			exSheet.Cells[11 + l_row, 4].Value = dtDetail.Rows[l_row]["item_name"];			
			exSheet.Cells[11 + l_row, 5].Value = dtDetail.Rows[l_row]["virtual_name"]; 			
			
			exSheet.Cells[11 + l_row, 6].Value = dtDetail.Rows[l_row]["uom"]; 
			
			exSheet.Cells[11 + l_row, 7].Value = dtDetail.Rows[l_row]["begin_act"]; 			
			exSheet.Cells[11 + l_row, 8].Value = dtDetail.Rows[l_row]["begin_doc"]; 
			
			exSheet.Cells[11 + l_row, 9].Value = dtDetail.Rows[l_row]["income_qty"]; 
			
			exSheet.Cells[11 + l_row,10].Value = "=(H"+(11+l_row)+"+I"+(11+l_row)+")";
			exSheet.Cells[11 + l_row,11].Value = "=(G"+(11+l_row)+"+I"+(11+l_row)+")";
			
			exSheet.Cells[11 + l_row,12].Value = dtDetail.Rows[l_row]["outgo_qty"];
			exSheet.Cells[11 + l_row,13].Value = dtDetail.Rows[l_row]["return_qty"]; 
			
			exSheet.Cells[11 + l_row,14].Value = "=J"+(11+l_row)+"-L"+(11+l_row)+"+M"+(11+l_row);
			
			exSheet.Cells[11 + l_row,15].Value = dtDetail.Rows[l_row]["plan_qty"]; 			
			exSheet.Cells[11 + l_row,16].Value = "=O"+(11+l_row)+"/25";

			exSheet.Cells[11 + l_row,17].Value = dtDetail.Rows[l_row]["val01"]; 
			
			exSheet.Cells[11 + l_row,18].Value = "=K"+(11+l_row)+"-L"+(11+l_row)+"+M"+(11+l_row);
			
			exSheet.Cells[11 + l_row,19].Value = dtDetail.Rows[l_row]["unit_price"];
			exSheet.Cells[11 + l_row,20].Value = "=S"+(11+l_row)+"*R"+(11+l_row); 	

			exSheet.Cells[11 + l_row,23].Value = "=R"+(11+l_row)+"/(O"+(11+l_row)+"/30)"; 	
			
			exSheet.Cells[11 + l_row,24].Value = dtDetail.Rows[l_row]["po_qty"];				
        }
		
		exSheet.Cells[11 + l_row, 7 ].Value = "=SUM(G11:G" + (11 + l_row -1 ) + ")"; 
		exSheet.Cells[11 + l_row, 8 ].Value = "=SUM(H11:H" + (11 + l_row -1 ) + ")"; 
		exSheet.Cells[11 + l_row, 9 ].Value = "=SUM(I11:I" + (11 + l_row -1 ) + ")"; 
		exSheet.Cells[11 + l_row, 10].Value = "=SUM(J11:J" + (11 + l_row -1 ) + ")"; 
		exSheet.Cells[11 + l_row, 11].Value = "=SUM(K11:K" + (11 + l_row -1 ) + ")"; 
		
		exSheet.Cells[11 + l_row, 12].Value = "=SUM(L11:L" + (11 + l_row -1 ) + ")"; 
		exSheet.Cells[11 + l_row, 13].Value = "=SUM(M11:M" + (11 + l_row -1 ) + ")"; 
		exSheet.Cells[11 + l_row, 14].Value = "=SUM(N11:N" + (11 + l_row -1 ) + ")"; 
		
		exSheet.Cells[11 + l_row, 15].Value = "=SUM(O11:O" + (11 + l_row -1 ) + ")"; 
		exSheet.Cells[11 + l_row, 16].Value = "=SUM(P11:P" + (11 + l_row -1 ) + ")"; 
		exSheet.Cells[11 + l_row, 17].Value = "=SUM(Q11:Q" + (11 + l_row -1 ) + ")"; 
		
		exSheet.Cells[11 + l_row, 18].Value = "=SUM(R11:R" + (11 + l_row -1 ) + ")"; 
		 
		exSheet.Cells[11 + l_row, 20].Value = "=SUM(T11:T" + (11 + l_row -1 ) + ")"; 	
		exSheet.Cells[11 + l_row, 24].Value = "=SUM(X11:X" + (11 + l_row -1 ) + ")";	
        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }     

         // font bold header
        /*range = exSheet.Range["A1:AC1"];
        range.Rows[4].Font.Bold = true;*/
    

        exBook.SaveAs(TempFile);
        //write out to client broswer
        System.IO.FileInfo file = new System.IO.FileInfo(TempFile);
        Response.Clear();
        Response.Charset = "UTF-8";
        Response.ContentEncoding = System.Text.Encoding.UTF8;
        //Add header, give a default file name for "File Download/Store as"
        Response.AddHeader("Content-Disposition", "attachment; filename=" + Server.UrlEncode(file.Name));
        //Add header, set file size to enable browser display download progress
        Response.AddHeader("Content-Length", file.Length.ToString());
        //Set the return string is unavailable reading for client, and must be downloaded
        Response.ContentType = "application/ms-exSheet";
        //Send file string to client 
        Response.WriteFile(TempFile);
        //Stop execute  
        Response.End();

    }
}
