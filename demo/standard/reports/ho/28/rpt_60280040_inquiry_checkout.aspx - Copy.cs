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

public partial class rpt_60280040_inquiry_checkout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser("crm");
		string l_room_no = Request["p_room_no"];  
        string l_checkout_date_frm = Request["p_checkout_date_frm"];
        string l_checkout_date_to = Request["p_checkout_date_to"];
		
        string TemplateFile = "rpt_60280040_inquiry_checkout.xls";
        string TempFile = "../../../../system/temp/rpt_60280040_inquiry_checkout_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        string para = "";
        DataTable dt;

        para = "'"+l_room_no+"','"+l_checkout_date_frm+"','"+l_checkout_date_to+"'";
        dt = CtlLib.TableReadOpenCursor("rpt_60280040_inquiry", para);
        //-----header---   

        //---end--header---
        //--set-----DataBind--in---Master---
        if (dt.Rows.Count == 0)
        {
            exSheet.Cells[8, 2].Value = "There is not data!";
        }

        if (dt.Rows.Count > 0)
        {
            exSheet.Cells[3, 1].Value = dt.Rows[0]["date_para"].ToString();
            exSheet.Cells[3, 25].Value = dt.Rows[0]["print_time"].ToString();  
        }

        //----------------------
        ////end-set-----DataBind--in---Master---

        for (int l_addrow = 1; l_addrow < dt.Rows.Count; l_addrow++)
        {
            exSheet.Range["A6"].Rows.EntireRow.Insert();//insert row new of sheet

        }
        //set date title of year
        //exSheet.Cells[2, 1].Value = "Income Statement Year" + " " + l_year;

        //set data to detail.
        // loop detail not percent
		double l_Room_Charge=0,l_Total_Due=0,l_Payed=0,l_Deposit=0,l_F_B_Hotel=0,l_MiniBar=0,l_Laundry=0;
		double l_Telephone=0,l_Others=0,l_Spa_fee=0,l_Lotus_shop=0,l_Adjust=0;
        int l_cnt = dt.Rows.Count;
        for (int l_row = 1; l_row <= dt.Rows.Count; l_row++)
        {
            for (int col = 0; col <= 25; col++)
            {
                if (col == 1||col == 2 || col == 3 || col == 4 || col == 6 || col == 20 || col == 21|| col == 22|| col == 23|| col == 24|| col == 25)
                {
                    exSheet.Cells[4 + l_row, col + 1].Value = dt.Rows[l_row - 1][col].ToString();
                    exSheet.Cells[l_row + 4, col + 1].HorizontalAlignment = XlHAlign.xlHAlignLeft;
                }
                else
                {		if(dt.Rows[l_row - 1][col].ToString()!="")
						{
							exSheet.Cells[4 + l_row, col + 1].Value = double.Parse(dt.Rows[l_row - 1][col].ToString());
						}
					if(col==8)
						{
							l_Room_Charge=l_Room_Charge+double.Parse(dt.Rows[l_row - 1][col].ToString());
						}
						if(col==9)
						{
							l_Total_Due=l_Total_Due+double.Parse(dt.Rows[l_row - 1][col].ToString());
						}
						if(col==10)
						{	if(dt.Rows[l_row - 1][col].ToString()!="")
							{
								l_Payed=l_Payed+double.Parse(dt.Rows[l_row - 1][col].ToString());
							}
						}
						if(col==11)
						{
							l_Deposit=l_Deposit+double.Parse(dt.Rows[l_row - 1][col].ToString());
						}
						if(col==12)
						{
							l_F_B_Hotel=l_F_B_Hotel+double.Parse(dt.Rows[l_row - 1][col].ToString());
						}
						if(col==13)
						{
							l_MiniBar=l_MiniBar+double.Parse(dt.Rows[l_row - 1][col].ToString());
						}
						if(col==14)
						{
							l_Laundry=l_Laundry;
						}
						if(col==15)
						{
							l_Telephone=l_Telephone+double.Parse(dt.Rows[l_row - 1][col].ToString());
						}
						if(col==16)
						{
							l_Others=l_Others+double.Parse(dt.Rows[l_row - 1][col].ToString());
						}
						if(col==17)
						{
							l_Spa_fee=l_Spa_fee+double.Parse(dt.Rows[l_row - 1][col].ToString());
						}
						if(col==18)
						{
							l_Lotus_shop=l_Lotus_shop+double.Parse(dt.Rows[l_row - 1][col].ToString());
						}
						if(col==19)
						{
							l_Adjust=l_Adjust+double.Parse(dt.Rows[l_row - 1][col].ToString());;
						}
						
                        exSheet.Cells[4, col + 1, l_row + 4, col + 1].NumberFormat = "#,##0";
                        exSheet.Cells[l_row + 4, col + 1].HorizontalAlignment = XlHAlign.xlHAlignRight;

                        if (dt.Rows[l_row - 1][col].ToString()!="")
						{
							if (double.Parse(dt.Rows[l_row - 1][col].ToString())== 0)
							{
								exSheet.Cells[4 + l_row, col + 1].Value = "";
							}
						}
                }
            }
			
			exSheet.Cells[5 + dt.Rows.Count, 9].Value =l_Room_Charge;
			exSheet.Cells[5 + dt.Rows.Count, 10].Value =l_Total_Due;
			exSheet.Cells[5 + dt.Rows.Count, 11].Value =l_Payed;
			exSheet.Cells[5 + dt.Rows.Count, 12].Value =l_Deposit;
			exSheet.Cells[5 + dt.Rows.Count, 13].Value =l_F_B_Hotel;
			exSheet.Cells[5 + dt.Rows.Count, 14].Value =l_MiniBar;
			exSheet.Cells[5 + dt.Rows.Count, 15].Value =l_Laundry;
			exSheet.Cells[5 + dt.Rows.Count, 16].Value =l_Telephone;
			exSheet.Cells[5 + dt.Rows.Count, 17].Value =l_Others;
			exSheet.Cells[5 + dt.Rows.Count, 18].Value =l_Spa_fee;
			exSheet.Cells[5 + dt.Rows.Count, 19].Value =l_Lotus_shop;
			exSheet.Cells[5 + dt.Rows.Count, 20].Value =l_Adjust;
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