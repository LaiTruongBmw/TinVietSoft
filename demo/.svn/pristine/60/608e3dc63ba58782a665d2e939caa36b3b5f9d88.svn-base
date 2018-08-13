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

public partial class rpt_60280090_inhouse_log : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());
        string l_dtfrm = Request["p_dtfrom"];
        string l_dtto = Request["p_dtto"];
        string l_guest_name = Request["p_guest_name"];

        string l_parameter = "'" + l_dtfrm + "','" + l_dtto + "','" + l_guest_name + "'";

        string TemplateFile = "rpt_60280090_inhouse_log.xls";
        string TempFile = "../../../../system/temp/rpt_60280090_inhouse_log_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file

        //DataTable dtMst = CtlLib.TableReadOpenCursor("acnt.sp_rpt_gfrp00010_mst", l_parameter);
        DataTable dtDetail = CtlLib.TableReadOpenCursor("rpt_60280090", l_parameter);

        //-----header---   

        //---end--header---
        //--set-----DataBind--in---Master---

        exSheet.Cells[3, 1].Value = dtDetail.Rows[0]["date_para"].ToString();
        exSheet.Cells[3, 9].Value = dtDetail.Rows.Count;
        exSheet.Cells[3, 10].Value = " Room(s)";
        exSheet.Cells[3, 22].Value = dtDetail.Rows[0]["print_time"].ToString();
        //----------------------
        ////end-set-----DataBind--in---Master---

        //sumtotal 
        // not tax
        //exSheet.Cells[13, 7].Value = long.Parse(dtTotal.Rows[0][0].ToString());//total
       // exSheet.Cells[16, 7].Value = long.Parse(dtTotal.Rows[0][0].ToString());//grand total
       
        //end sum total
        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A7"].Rows.EntireRow.Insert();//insert row new of sheet

        }
        //set date title of year
        //exSheet.Cells[2, 1].Value = "Income Statement Year" + " " + l_year;

        //set data to detail.
        // loop detail not percent
		int l_firstt=6;
        for (int l_row = 0; l_row < dtDetail.Rows.Count; l_row++)
        {
            for (int col = 0; col <= 22; col++)
            {
                //exSheet.Cells[11 + l_row, col + 1].Value = dtDetail.Rows[l_row - 1][col].ToString();
                //exSheet.Cells[5, col + 1].Value = dt.Rows[0][col].ToString();
                if (col == 0 || col == 1 || col == 2 || col == 3 || col == 4 || col == 5 || col == 6 || col == 7 || col == 9 || col == 10 || col == 11 || col == 12 || col == 13 || col == 18 || col == 19 || col == 20 || col == 22)
                {
                    exSheet.Cells[l_firstt + l_row, col + 1].Value = dtDetail.Rows[l_row][col].ToString();

                }
                else
                {
                    if(dtDetail.Rows[l_row][col].ToString() !="")
					{
						exSheet.Cells[l_firstt + l_row, col + 1].Value = double.Parse(dtDetail.Rows[l_row][col].ToString());
						
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
