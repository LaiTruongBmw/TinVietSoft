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

public partial class rpt_60270030_Invoice : System.Web.UI.Page
{
	
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string l_fr = Request["p_fr"];  
		string l_to = Request["p_to"];  
		string l_loc = Request["p_loc"];  

        string TemplateFile = "rpt_60270030_Invoice.xls";
        string TempFile = "../../../../system/temp/rpt_60270030_Invoice_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet sheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        string para = "";
		string[][] title = new string[2][]{new string[]{"1","2","6","7","8","9","10","11","12","13"},
										   new string[]{"Item Code","Item Name","Unit","Q.Ty","Price","Sub","Service","Tax","Discount","Total"}};
		int row = 6, tt_dt = 0;
        DataTable dt;
        para = "'" + l_fr + "','" + l_to + "','" + l_loc + "'";
		
        dt = CtlLib.TableReadOpenCursor("rpt_60270030_item_invoice2", para); 
		if(dt.Rows.Count > 0){
			sheet.Cells[4, 5].Value 	= dt.Rows[0][14];
			sheet.Cells[4, 11].Value 	= dt.Rows[0][15];
			sheet.Cells[5, 5].Value 	= dt.Rows[0][16];
			
			for(int y = 0; y < dt.Rows.Count; y++){
				if(dt.Rows[y][0].ToString() != "" && dt.Rows[y][3].ToString() == ""){
					row++;for(int x = 0; x < title[0].Length; x++){
						sheet.Cells[row, int.Parse(title[0][x])].Borders[XlBordersIndex.xlEdgeTop].LineStyle = XlLineStyle.xlDot;
						sheet.Cells[row, int.Parse(title[0][x])].Borders[XlBordersIndex.xlEdgeBottom].LineStyle = XlLineStyle.xlContinuous;
						if(title[0][x] == "2"){
							sheet.Cells[row, int.Parse(title[0][x]), row, int.Parse(title[0][x+1]) - 1].Borders[XlBordersIndex.xlEdgeTop].LineStyle = XlLineStyle.xlDot;
							sheet.Cells[row, int.Parse(title[0][x]), row, int.Parse(title[0][x+1]) - 1].Borders[XlBordersIndex.xlEdgeBottom].LineStyle = XlLineStyle.xlContinuous;
						}
						switch(x){
							case 0:
								sheet.Cells[row, int.Parse(title[0][x])].Value = "Total Invoice ID: " + dt.Rows[y][0].ToString();
								sheet.Cells[row, int.Parse(title[0][x])].Font.Bold = true;
								sheet.Cells[row, int.Parse(title[0][x])].Font.Size = 8;
								sheet.Cells[row, int.Parse(title[0][x])].Font.Color = Color.Black;
								sheet.Cells[row, int.Parse(title[0][x])].WrapText = false;
								sheet.Cells[row, int.Parse(title[0][x])].VerticalAlignment = XlVAlign.xlVAlignCenter;
								sheet.Cells[row, int.Parse(title[0][x])].HorizontalAlignment = XlHAlign.xlHAlignLeft;
								sheet.Cells[row, int.Parse(title[0][x])].RowHeight = 20;
							break;
							case 5:
							case 6:
							case 7:
							case 8:
							case 9:
								sheet.Cells[row, int.Parse(title[0][x])].Value = double.Parse(dt.Rows[y][x+3].ToString());
								sheet.Cells[row, int.Parse(title[0][x])].NumberFormat = "###,###,##0";
								sheet.Cells[row, int.Parse(title[0][x])].Font.Bold = true;
								sheet.Cells[row, int.Parse(title[0][x])].Font.Size = 8;
								sheet.Cells[row, int.Parse(title[0][x])].Font.Color = Color.Black;
								sheet.Cells[row, int.Parse(title[0][x])].WrapText = false;
								sheet.Cells[row, int.Parse(title[0][x])].VerticalAlignment = XlVAlign.xlVAlignCenter;
								sheet.Cells[row, int.Parse(title[0][x])].HorizontalAlignment = XlHAlign.xlHAlignRight;
								sheet.Cells[row, int.Parse(title[0][x])].RowHeight = 20;
							break;
						}
					}
					row++;sheet.Cells[row, 1].RowHeight = 20;
				} else if (dt.Rows[y][0].ToString() != "" && dt.Rows[y][3].ToString() != ""){
					if(y==0 || (y > 0 && dt.Rows[y-1][0].ToString() != "" && dt.Rows[y-1][3].ToString() == "")){
						if(y==0){
							for(int x = 0; x < title[0].Length; x++){
								sheet.Cells[row, int.Parse(title[0][x])].Value = "'" + title[1][x];
								sheet.Cells[row, int.Parse(title[0][x])].Font.Bold = true;
								sheet.Cells[row, int.Parse(title[0][x])].Font.Color = Color.Black;
								sheet.Cells[row, int.Parse(title[0][x])].VerticalAlignment = XlVAlign.xlVAlignCenter;
								sheet.Cells[row, int.Parse(title[0][x])].HorizontalAlignment = XlHAlign.xlHAlignCenter;
								sheet.Cells[row, int.Parse(title[0][x])].RowHeight = 20;
								sheet.Cells[row, int.Parse(title[0][x])].Borders[XlBordersIndex.xlEdgeBottom].LineStyle = XlLineStyle.xlContinuous;
								if(title[0][x] == "2"){
									sheet.Cells[row, int.Parse(title[0][x]), row, int.Parse(title[0][x+1]) - 1].Merge();
									sheet.Cells[row, int.Parse(title[0][x]), row, int.Parse(title[0][x+1]) - 1].Borders[XlBordersIndex.xlEdgeBottom].LineStyle = XlLineStyle.xlContinuous;
								}
							}
						}
					
						row++;for(int x = 0; x < title[0].Length; x++){
							switch(x){
								case 0:
									sheet.Cells[row, int.Parse(title[0][x])].Value = "Invoice ID: " + dt.Rows[y][0].ToString();
									sheet.Cells[row, int.Parse(title[0][x])].Font.Bold = true;
									sheet.Cells[row, int.Parse(title[0][x])].Font.Size = 8;
									sheet.Cells[row, int.Parse(title[0][x])].Font.Color = Color.Black;
									sheet.Cells[row, int.Parse(title[0][x])].WrapText = false;
									sheet.Cells[row, int.Parse(title[0][x])].VerticalAlignment = XlVAlign.xlVAlignBottom;
									sheet.Cells[row, int.Parse(title[0][x])].HorizontalAlignment = XlHAlign.xlHAlignLeft;
									sheet.Cells[row, int.Parse(title[0][x])].RowHeight = 20;
									sheet.Cells[row, int.Parse(title[0][x])].Font.Underline = XlUnderlineStyle.xlUnderlineStyleSingle;
								break;
								case 2:
									sheet.Cells[row, int.Parse(title[0][x])].Value = "Guest Name: " + dt.Rows[y][2].ToString();
									sheet.Cells[row, int.Parse(title[0][x])].Font.Bold = true;
									sheet.Cells[row, int.Parse(title[0][x])].Font.Size = 8;
									sheet.Cells[row, int.Parse(title[0][x])].Font.Color = Color.Black;
									sheet.Cells[row, int.Parse(title[0][x])].WrapText = false;
									sheet.Cells[row, int.Parse(title[0][x])].VerticalAlignment = XlVAlign.xlVAlignBottom;
									sheet.Cells[row, int.Parse(title[0][x])].HorizontalAlignment = XlHAlign.xlHAlignLeft;
									sheet.Cells[row, int.Parse(title[0][x])].RowHeight = 20;
								break;
								case 9:
									sheet.Cells[row, int.Parse(title[0][x])].Value = "Cover: " + dt.Rows[y][1].ToString();
									sheet.Cells[row, int.Parse(title[0][x])].Font.Bold = true;
									sheet.Cells[row, int.Parse(title[0][x])].Font.Size = 8;
									sheet.Cells[row, int.Parse(title[0][x])].Font.Color = Color.Black;
									sheet.Cells[row, int.Parse(title[0][x])].WrapText = false;
									sheet.Cells[row, int.Parse(title[0][x])].VerticalAlignment = XlVAlign.xlVAlignBottom;
									sheet.Cells[row, int.Parse(title[0][x])].HorizontalAlignment = XlHAlign.xlHAlignLeft;
									sheet.Cells[row, int.Parse(title[0][x])].RowHeight = 20;
								break;
							}
						}
					}
					
					row++;for(int x = 0; x < title[0].Length; x++){
						
						//sheet.Cells[row, int.Parse(title[0][x])].Font.Bold = true;
						sheet.Cells[row, int.Parse(title[0][x])].Font.Color = Color.Black;
						sheet.Cells[row, int.Parse(title[0][x])].WrapText = false;
						sheet.Cells[row, int.Parse(title[0][x])].Font.Size = 8;
						sheet.Cells[row, int.Parse(title[0][x])].VerticalAlignment = XlVAlign.xlVAlignCenter;
						sheet.Cells[row, int.Parse(title[0][x])].HorizontalAlignment = XlHAlign.xlHAlignLeft;
						sheet.Cells[row, int.Parse(title[0][x])].RowHeight = 15;
						switch(x){
							case 0:
								sheet.Cells[row, int.Parse(title[0][x])].Value = dt.Rows[y][x+3].ToString();
							break;
							case 1:
								sheet.Cells[row, int.Parse(title[0][x])].Value = dt.Rows[y][x+3].ToString();
								sheet.Cells[row, int.Parse(title[0][x]), row, int.Parse(title[0][x+1]) - 1].Merge();
							break;
							case 2:
								sheet.Cells[row, int.Parse(title[0][x])].Value = dt.Rows[y][x+3].ToString();
								sheet.Cells[row, int.Parse(title[0][x])].HorizontalAlignment = XlHAlign.xlHAlignCenter;
							break;
							case 3:
								sheet.Cells[row, int.Parse(title[0][x])].Value = double.Parse(dt.Rows[y][x+3].ToString());
								sheet.Cells[row, int.Parse(title[0][x])].NumberFormat = "###,###,##0";
								sheet.Cells[row, int.Parse(title[0][x])].HorizontalAlignment = XlHAlign.xlHAlignCenter;
							break;
							default:
								sheet.Cells[row, int.Parse(title[0][x])].Value = double.Parse(dt.Rows[y][x+3].ToString());
								sheet.Cells[row, int.Parse(title[0][x])].NumberFormat = "###,###,##0";
								sheet.Cells[row, int.Parse(title[0][x])].HorizontalAlignment = XlHAlign.xlHAlignRight;
							break;
						}
					}
				}
			}
		}

        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }


        // hide row firts 

        range = sheet.Range["A1"];
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