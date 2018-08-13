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

public partial class rpt_bisc00090 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser("sale");
        string l_date = Request["p_date"];
        string l_wh = Request["p_wh"];
        string l_item = Request["p_item"];

        string l_parameter = "'" + l_date + "','" + l_wh + "','" + l_item + "'";

        string TemplateFile = "rpt_bisc00090.xls";
        string TempFile = "../../../../system/temp/rpt_bisc00090_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        //-----header--- 
        DataTable dtHeader = CtlLib.TableReadOpenCursor("LG_SEL_BISC00090_HEADER", l_parameter);
        int count = 5;
        for (int i = 0; i < dtHeader.Rows.Count; i++)
        {
            exSheet.Cells[4, count].Value = dtHeader.Rows[i][0].ToString();
            count++;
        }
        //---end--header---
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_BISC00090", l_parameter);

        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A6"].Rows.EntireRow.Insert();//insert row new of sheet

        }
        // loop detail not percent
        for (int l_row = 1; l_row <= dtDetail.Rows.Count; l_row++)
        {
            for (int col = 0; col <= 15; col++)
            {
                if (col == 0 || col == 1 || col == 2 || col == 3)
                {
                    exSheet.Cells[4 + l_row, col + 1].Value = dtDetail.Rows[l_row - 1][col].ToString();
                }
                else
                {
                    if (col >= 4 && col <= 15)
                    {
                        if (!string.IsNullOrEmpty(dtDetail.Rows[l_row - 1][col].ToString()))
                        {
                            exSheet.Cells[4 + l_row, col + 1].Value = float.Parse(dtDetail.Rows[l_row - 1][col].ToString());
                        }
                        else
                        {
                            exSheet.Cells[4 + l_row, col + 1].Value = string.Empty;
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
        range = exSheet.Range["A1"];
        // hide row A5 
        range.Rows.Hidden = true;

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
