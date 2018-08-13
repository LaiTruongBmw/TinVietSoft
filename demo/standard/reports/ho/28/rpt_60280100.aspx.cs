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

public partial class rpt_60280100 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
        string l_from =     Request["p_from"];
        string l_to =       Request["p_to"];
        string l_invoice =  Request["p_invoice"];
        string l_roomno =   Request["p_roomno"];
        string l_loc =      Request["p_loc"];
        string l_pay =      Request["p_pay"];

        string TemplateFile = "rpt_60280100.xls";
        string TempFile = "../../../../system/temp/rpt_60280100_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        string para = "";
        DataTable dt, dtSum;

        para = "'" + l_from + "','" + l_to + "','" + l_invoice + "','" + l_roomno + "','" + l_loc + "','" + l_pay + "'";
        dt = CtlLib.TableReadOpenCursor("rpt_60280100", para);
        //-----header---   

        //---end--header---
        //--set-----DataBind--in---Master---
        if (dt.Rows.Count == 0)
        {
            exSheet.Cells[3, 3].Value = "There is not data!";

        }
        if (dt.Rows.Count > 0)
        {
            exSheet.Cells[3, 1].Value = dt.Rows[0]["date_from_to_parameter"].ToString();
            exSheet.Cells[3, 4].Value = dt.Rows[0]["roomno"].ToString();
            exSheet.Cells[3, 5].Value = dt.Rows[0]["paymnent"].ToString();
            exSheet.Cells[3, 10].Value = dt.Rows[0]["print_time"].ToString();
            exSheet.Cells[2, 3].Value = dt.Rows[0]["report_name"].ToString();
        }

        //----------------------
        ////end-set-----DataBind--in---Master---
        
        for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range["A7"].Rows.EntireRow.Insert();//insert row new of sheet

        }
        //set date title of year
        //exSheet.Cells[2, 1].Value = "Income Statement Year" + " " + l_year;

        //set data to detail.
        // loop detail not percent
        
        int start = 6;
        for (int row = 0; row < dt.Rows.Count; row++)
        {
            for (int col = 0; col < dt.Columns.Count - 5; col++)
            {
                switch (col) { 
                    //Type String 
                    case 0:
                    case 1:
                    case 2:
                    case 3:
                    case 4:
                        exSheet.Cells[start + row, col + 1].Value = dt.Rows[row][col].ToString();
                        break;
                    //Type Number
                    case 5:
                    case 6:
                    case 7:
                    case 8:
                    case 9:
                        if(row == 0) exSheet.Cells[start + dt.Rows.Count, col + 1].Value = '0';
                        exSheet.Cells[start + row, col + 1].Value = float.Parse(dt.Rows[row][col].ToString());
                        exSheet.Cells[start + dt.Rows.Count, col + 1].Value = float.Parse(exSheet.Cells[start + dt.Rows.Count, col + 1].Value.ToString()) + float.Parse(exSheet.Cells[start + row, col + 1].Value.ToString());
                        //exSheet.Cells[start + row, col + 1].NumberFormat = "#,##0";
                        exSheet.Cells[start + row, col + 1].HorizontalAlignment = XlHAlign.xlHAlignRight;
                        break;
                }
            }
        }

        // end loop detail percent
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }


        // hide row firts 

        range = exSheet.Range["A1"];
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