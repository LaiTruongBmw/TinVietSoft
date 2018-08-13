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

public partial class rpt_dscd00120_ST02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());

        string l_wh_pk = Request["p_wh_pk"];
        string l_group_pk = Request["p_group_pk"];
        string l_item = Request["p_item"];
        string l_date = Request["p_date"];

        string TemplateFile = "rpt_dscd00120_ST02.xls";

        string TempFile = "../../../../system/temp/rpt_dscd00120_ST02_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        string l_parameter = "'" + l_group_pk + "'";
        l_parameter = l_parameter + ",'" + l_group_pk + "'";
        l_parameter = l_parameter + ",'" + l_item + "'";
        l_parameter = l_parameter + ",'" + l_date + "'";

        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_dscd00120_ST01_2", l_parameter);
		DataTable dtHead   = CtlLib.TableReadOpenCursor("st_lg_rpt_dscd00120_ST02_head", l_date);


        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A5"].Rows.EntireRow.Insert();//insert row new of sheet           

        }
		
		 exSheet.Cells[3, 6 ].Value = dtHead.Rows[0][0].ToString();
		 exSheet.Cells[3, 7 ].Value = dtHead.Rows[0][1].ToString();
		 exSheet.Cells[3, 8 ].Value = dtHead.Rows[0][2].ToString();
		 exSheet.Cells[3, 9 ].Value = dtHead.Rows[0][3].ToString();
		 exSheet.Cells[3, 10].Value = dtHead.Rows[0][4].ToString();
		 exSheet.Cells[3, 11].Value = dtHead.Rows[0][5].ToString();
		 exSheet.Cells[3, 12].Value = dtHead.Rows[0][6].ToString();
		 exSheet.Cells[3, 13].Value = dtHead.Rows[0][7].ToString();
		 exSheet.Cells[3, 14].Value = dtHead.Rows[0][8].ToString();
		 exSheet.Cells[3, 15].Value = dtHead.Rows[0][9].ToString();
		 exSheet.Cells[3, 16].Value = dtHead.Rows[0][10].ToString();
		 exSheet.Cells[3, 17].Value = dtHead.Rows[0][11].ToString();
		 exSheet.Cells[3, 18].Value = dtHead.Rows[0][12].ToString();
		 exSheet.Cells[3, 19].Value = dtHead.Rows[0][13].ToString();
		 exSheet.Cells[3, 20].Value = dtHead.Rows[0][14].ToString();
		 exSheet.Cells[3, 21].Value = dtHead.Rows[0][15].ToString();
		 exSheet.Cells[3, 22].Value = dtHead.Rows[0][16].ToString();
		 exSheet.Cells[3, 23].Value = dtHead.Rows[0][17].ToString();
		 exSheet.Cells[3, 24].Value = dtHead.Rows[0][18].ToString();
		 exSheet.Cells[3, 25].Value = dtHead.Rows[0][19].ToString();
		 exSheet.Cells[3, 26].Value = dtHead.Rows[0][20].ToString();
		 exSheet.Cells[3, 27].Value = dtHead.Rows[0][21].ToString();
		 exSheet.Cells[3, 28].Value = dtHead.Rows[0][22].ToString();
		 exSheet.Cells[3, 29].Value = dtHead.Rows[0][23].ToString();
		 exSheet.Cells[3, 30].Value = dtHead.Rows[0][24].ToString();
		 exSheet.Cells[3, 31].Value = dtHead.Rows[0][25].ToString();
		 exSheet.Cells[3, 32].Value = dtHead.Rows[0][26].ToString();
		 exSheet.Cells[3, 33].Value = dtHead.Rows[0][27].ToString();
		 exSheet.Cells[3, 34].Value = dtHead.Rows[0][28].ToString();
		 exSheet.Cells[3, 35].Value = dtHead.Rows[0][29].ToString();
		 exSheet.Cells[3, 36].Value = dtHead.Rows[0][30].ToString();
        
        int l_row = 4;      
        
		int i ;
		
        for (i = 0; i < dtDetail.Rows.Count; i++)
        {       
            
            exSheet.Cells[l_row+i, 1].Value = dtDetail.Rows[i]["item_seq"];
			exSheet.Cells[l_row+i, 2].Value = dtDetail.Rows[i]["item_code"];
			exSheet.Cells[l_row+i, 3].Value = dtDetail.Rows[i]["item_name"];
			exSheet.Cells[l_row+i, 4].Value = "";
            exSheet.Cells[l_row+i, 5].Value = dtDetail.Rows[i]["total_qty"];
            exSheet.Cells[l_row+i, 6].Value = dtDetail.Rows[i]["day00_qty"];
            exSheet.Cells[l_row+i, 7].Value = dtDetail.Rows[i]["day01_qty"];
            exSheet.Cells[l_row+i, 8].Value = dtDetail.Rows[i]["day02_qty"];
            exSheet.Cells[l_row+i, 9].Value = dtDetail.Rows[i]["day03_qty"];
            exSheet.Cells[l_row+i, 10].Value = dtDetail.Rows[i]["day04_qty"];
            exSheet.Cells[l_row+i, 11].Value = dtDetail.Rows[i]["day05_qty"];
            exSheet.Cells[l_row+i, 12].Value = dtDetail.Rows[i]["day06_qty"];
            exSheet.Cells[l_row+i, 13].Value = dtDetail.Rows[i]["day07_qty"];
            exSheet.Cells[l_row+i, 14].Value = dtDetail.Rows[i]["day08_qty"];
            exSheet.Cells[l_row+i, 15].Value = dtDetail.Rows[i]["day09_qty"];
            exSheet.Cells[l_row+i, 16].Value = dtDetail.Rows[i]["day10_qty"];
            exSheet.Cells[l_row+i, 17].Value = dtDetail.Rows[i]["day11_qty"];
            exSheet.Cells[l_row+i, 18].Value = dtDetail.Rows[i]["day12_qty"];
            exSheet.Cells[l_row+i, 19].Value = dtDetail.Rows[i]["day13_qty"];
            exSheet.Cells[l_row+i, 20].Value = dtDetail.Rows[i]["day14_qty"];
            exSheet.Cells[l_row+i, 21].Value = dtDetail.Rows[i]["day15_qty"];
            exSheet.Cells[l_row+i, 22].Value = dtDetail.Rows[i]["day16_qty"];
            exSheet.Cells[l_row+i, 23].Value = dtDetail.Rows[i]["day17_qty"];
            exSheet.Cells[l_row+i, 24].Value = dtDetail.Rows[i]["day18_qty"];
            exSheet.Cells[l_row+i, 25].Value = dtDetail.Rows[i]["day19_qty"];
            exSheet.Cells[l_row+i, 26].Value = dtDetail.Rows[i]["day20_qty"];
            exSheet.Cells[l_row+i, 27].Value = dtDetail.Rows[i]["day21_qty"];
            exSheet.Cells[l_row+i, 28].Value = dtDetail.Rows[i]["day22_qty"];
            exSheet.Cells[l_row+i, 29].Value = dtDetail.Rows[i]["day23_qty"];
            exSheet.Cells[l_row+i, 30].Value = dtDetail.Rows[i]["day24_qty"];
            exSheet.Cells[l_row+i, 31].Value = dtDetail.Rows[i]["day25_qty"];
            exSheet.Cells[l_row+i, 32].Value = dtDetail.Rows[i]["day26_qty"];
            exSheet.Cells[l_row+i, 33].Value = dtDetail.Rows[i]["day27_qty"];
            exSheet.Cells[l_row+i, 34].Value = dtDetail.Rows[i]["day28_qty"];
            exSheet.Cells[l_row+i, 35].Value = dtDetail.Rows[i]["day29_qty"];
            exSheet.Cells[l_row+i, 36].Value = dtDetail.Rows[i]["day30_qty"];
        }
         
			exSheet.Cells[l_row + i, 5 ].Value = "=SUM(E4:E"+(l_row+i-1)+")";			
			exSheet.Cells[l_row + i, 6 ].Value = "=SUM(F4:F"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i, 7 ].Value = "=SUM(G4:G"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i, 8 ].Value = "=SUM(H4:H"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i, 9 ].Value = "=SUM(I4:I"+(l_row+i-1)+")";	
			exSheet.Cells[l_row + i,10 ].Value = "=SUM(J4:J"+(l_row+i-1)+")";		
			exSheet.Cells[l_row + i,11 ].Value = "=SUM(K4:K"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i,12 ].Value = "=SUM(L4:L"+(l_row+i-1)+")";				
			exSheet.Cells[l_row + i,13 ].Value = "=SUM(M4:M"+(l_row+i-1)+")"; 
			exSheet.Cells[l_row + i,14 ].Value = "=SUM(N4:N"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i,15 ].Value = "=SUM(O4:O"+(l_row+i-1)+")";			
			exSheet.Cells[l_row + i,16 ].Value = "=SUM(P4:P"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i,17 ].Value = "=SUM(Q4:Q"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i,18 ].Value = "=SUM(R4:R"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i,19 ].Value = "=SUM(S4:S"+(l_row+i-1)+")";	
			exSheet.Cells[l_row + i,20 ].Value = "=SUM(T4:T"+(l_row+i-1)+")";		
			exSheet.Cells[l_row + i,21 ].Value = "=SUM(U4:U"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i,22 ].Value = "=SUM(V4:V"+(l_row+i-1)+")";				
			exSheet.Cells[l_row + i,23 ].Value = "=SUM(W4:W"+(l_row+i-1)+")"; 
			exSheet.Cells[l_row + i,24 ].Value = "=SUM(X4:X"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i,25 ].Value = "=SUM(Y4:Y"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i,26 ].Value = "=SUM(Z4:Z"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i,27 ].Value = "=SUM(AA4:AA"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i,28 ].Value = "=SUM(AB4:AB"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i,29 ].Value = "=SUM(AC4:AC"+(l_row+i-1)+")";	
			exSheet.Cells[l_row + i,30 ].Value = "=SUM(AD4:AD"+(l_row+i-1)+")";		
			exSheet.Cells[l_row + i,31 ].Value = "=SUM(AE4:AE"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i,32 ].Value = "=SUM(AF4:AF"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i,33 ].Value = "=SUM(AG4:AG"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i,34 ].Value = "=SUM(AH4:AH"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i,35 ].Value = "=SUM(AI4:AI"+(l_row+i-1)+")";
			exSheet.Cells[l_row + i,36 ].Value = "=SUM(AJ4:AJ"+(l_row+i-1)+")";
			
        //**************************************************//
        //****************SHEET 2***********************//
        //***************************************************//
        //Add worksheet
        IWorksheet exSheet2 = exBook.Worksheets[2];
        //bind data to excel file      
        DataTable dtDetail2 = CtlLib.TableReadOpenCursor("st_lg_rpt_dscd00120_ST01_2", l_parameter);
       

        for (int l_addrow = 1; l_addrow < dtDetail2.Rows.Count; l_addrow++)
        {
            exSheet2.Range["A5"].Rows.EntireRow.Insert();//insert row new of sheet           

        }
		
		 exSheet2.Cells[3, 6 ].Value = dtHead.Rows[0][0].ToString();
		 exSheet2.Cells[3, 7 ].Value = dtHead.Rows[0][1].ToString();
		 exSheet2.Cells[3, 8 ].Value = dtHead.Rows[0][2].ToString();
		 exSheet2.Cells[3, 9 ].Value = dtHead.Rows[0][3].ToString();
		 exSheet2.Cells[3, 10].Value = dtHead.Rows[0][4].ToString();
		 exSheet2.Cells[3, 11].Value = dtHead.Rows[0][5].ToString();
		 exSheet2.Cells[3, 12].Value = dtHead.Rows[0][6].ToString();
		 exSheet2.Cells[3, 13].Value = dtHead.Rows[0][7].ToString();
		 exSheet2.Cells[3, 14].Value = dtHead.Rows[0][8].ToString();
		 exSheet2.Cells[3, 15].Value = dtHead.Rows[0][9].ToString();
		 exSheet2.Cells[3, 16].Value = dtHead.Rows[0][10].ToString();
		 exSheet2.Cells[3, 17].Value = dtHead.Rows[0][11].ToString();
		 exSheet2.Cells[3, 18].Value = dtHead.Rows[0][12].ToString();
		 exSheet2.Cells[3, 19].Value = dtHead.Rows[0][13].ToString();
		 exSheet2.Cells[3, 20].Value = dtHead.Rows[0][14].ToString();
		 exSheet2.Cells[3, 21].Value = dtHead.Rows[0][15].ToString();
		 exSheet2.Cells[3, 22].Value = dtHead.Rows[0][16].ToString();
		 exSheet2.Cells[3, 23].Value = dtHead.Rows[0][17].ToString();
		 exSheet2.Cells[3, 24].Value = dtHead.Rows[0][18].ToString();
		 exSheet2.Cells[3, 25].Value = dtHead.Rows[0][19].ToString();
		 exSheet2.Cells[3, 26].Value = dtHead.Rows[0][20].ToString();
		 exSheet2.Cells[3, 27].Value = dtHead.Rows[0][21].ToString();
		 exSheet2.Cells[3, 28].Value = dtHead.Rows[0][22].ToString();
		 exSheet2.Cells[3, 29].Value = dtHead.Rows[0][23].ToString();
		 exSheet2.Cells[3, 30].Value = dtHead.Rows[0][24].ToString();
		 exSheet2.Cells[3, 31].Value = dtHead.Rows[0][25].ToString();
		 exSheet2.Cells[3, 32].Value = dtHead.Rows[0][26].ToString();
		 exSheet2.Cells[3, 33].Value = dtHead.Rows[0][27].ToString();
		 exSheet2.Cells[3, 34].Value = dtHead.Rows[0][28].ToString();
		 exSheet2.Cells[3, 35].Value = dtHead.Rows[0][29].ToString();
		 exSheet2.Cells[3, 36].Value = dtHead.Rows[0][30].ToString();
        // loop detail not percent
        
        l_row = 4;
        
        for (i = 0; i < dtDetail2.Rows.Count; i++)
        {             
            exSheet2.Cells[l_row+i, 1].Value = dtDetail2.Rows[i]["item_seq"];
			exSheet2.Cells[l_row+i, 2].Value = dtDetail2.Rows[i]["item_code"];
			exSheet2.Cells[l_row+i, 3].Value = dtDetail2.Rows[i]["item_name"];
            exSheet2.Cells[l_row+i, 4].Value = "";
            exSheet2.Cells[l_row+i, 5].Value = dtDetail2.Rows[i]["total_qty"];
            exSheet2.Cells[l_row+i, 6].Value = dtDetail2.Rows[i]["day00_qty"];
            exSheet2.Cells[l_row+i, 7].Value = dtDetail2.Rows[i]["day01_qty"];
            exSheet2.Cells[l_row+i, 8].Value = dtDetail2.Rows[i]["day02_qty"];
            exSheet2.Cells[l_row+i, 9].Value = dtDetail2.Rows[i]["day03_qty"];
            exSheet2.Cells[l_row+i, 10].Value = dtDetail2.Rows[i]["day04_qty"];
            exSheet2.Cells[l_row+i, 11].Value = dtDetail2.Rows[i]["day05_qty"];
            exSheet2.Cells[l_row+i, 12].Value = dtDetail2.Rows[i]["day06_qty"];
            exSheet2.Cells[l_row+i, 13].Value = dtDetail2.Rows[i]["day07_qty"];
            exSheet2.Cells[l_row+i, 14].Value = dtDetail2.Rows[i]["day08_qty"];
            exSheet2.Cells[l_row+i, 15].Value = dtDetail2.Rows[i]["day09_qty"];
            exSheet2.Cells[l_row+i, 16].Value = dtDetail2.Rows[i]["day10_qty"];
            exSheet2.Cells[l_row+i, 17].Value = dtDetail2.Rows[i]["day11_qty"];
            exSheet2.Cells[l_row+i, 18].Value = dtDetail2.Rows[i]["day12_qty"];
            exSheet2.Cells[l_row+i, 19].Value = dtDetail2.Rows[i]["day13_qty"];
            exSheet2.Cells[l_row+i, 20].Value = dtDetail2.Rows[i]["day14_qty"];
            exSheet2.Cells[l_row+i, 21].Value = dtDetail2.Rows[i]["day15_qty"];
            exSheet2.Cells[l_row+i, 22].Value = dtDetail2.Rows[i]["day16_qty"];
            exSheet2.Cells[l_row+i, 23].Value = dtDetail2.Rows[i]["day17_qty"];
            exSheet2.Cells[l_row+i, 24].Value = dtDetail2.Rows[i]["day18_qty"];
            exSheet2.Cells[l_row+i, 25].Value = dtDetail2.Rows[i]["day19_qty"];
            exSheet2.Cells[l_row+i, 26].Value = dtDetail2.Rows[i]["day20_qty"];
            exSheet2.Cells[l_row+i, 27].Value = dtDetail2.Rows[i]["day21_qty"];
            exSheet2.Cells[l_row+i, 28].Value = dtDetail2.Rows[i]["day22_qty"];
            exSheet2.Cells[l_row+i, 29].Value = dtDetail2.Rows[i]["day23_qty"];
            exSheet2.Cells[l_row+i, 30].Value = dtDetail2.Rows[i]["day24_qty"];
            exSheet2.Cells[l_row+i, 31].Value = dtDetail2.Rows[i]["day25_qty"];
            exSheet2.Cells[l_row+i, 32].Value = dtDetail2.Rows[i]["day26_qty"];
            exSheet2.Cells[l_row+i, 33].Value = dtDetail2.Rows[i]["day27_qty"];
            exSheet2.Cells[l_row+i, 34].Value = dtDetail2.Rows[i]["day28_qty"];
            exSheet2.Cells[l_row+i, 35].Value = dtDetail2.Rows[i]["day29_qty"];
            exSheet2.Cells[l_row+i, 36].Value = dtDetail2.Rows[i]["day30_qty"];           
        }
        
		//---------
			exSheet2.Cells[l_row + i, 5 ].Value = "=SUM(E4:E"+(l_row+i-1)+")";			
			exSheet2.Cells[l_row + i, 6 ].Value = "=SUM(F4:F"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i, 7 ].Value = "=SUM(G4:G"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i, 8 ].Value = "=SUM(H4:H"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i, 9 ].Value = "=SUM(I4:I"+(l_row+i-1)+")";	
			exSheet2.Cells[l_row + i,10 ].Value = "=SUM(J4:J"+(l_row+i-1)+")";		
			exSheet2.Cells[l_row + i,11 ].Value = "=SUM(K4:K"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i,12 ].Value = "=SUM(L4:L"+(l_row+i-1)+")";				
			exSheet2.Cells[l_row + i,13 ].Value = "=SUM(M4:M"+(l_row+i-1)+")"; 
			exSheet2.Cells[l_row + i,14 ].Value = "=SUM(N4:N"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i,15 ].Value = "=SUM(O4:O"+(l_row+i-1)+")";			
			exSheet2.Cells[l_row + i,16 ].Value = "=SUM(P4:P"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i,17 ].Value = "=SUM(Q4:Q"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i,18 ].Value = "=SUM(R4:R"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i,19 ].Value = "=SUM(S4:S"+(l_row+i-1)+")";	
			exSheet2.Cells[l_row + i,20 ].Value = "=SUM(T4:T"+(l_row+i-1)+")";		
			exSheet2.Cells[l_row + i,21 ].Value = "=SUM(U4:U"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i,22 ].Value = "=SUM(V4:V"+(l_row+i-1)+")";				
			exSheet2.Cells[l_row + i,23 ].Value = "=SUM(W4:W"+(l_row+i-1)+")"; 
			exSheet2.Cells[l_row + i,24 ].Value = "=SUM(X4:X"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i,25 ].Value = "=SUM(Y4:Y"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i,26 ].Value = "=SUM(Z4:Z"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i,27 ].Value = "=SUM(AA4:AA"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i,28 ].Value = "=SUM(AB4:AB"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i,29 ].Value = "=SUM(AC4:AC"+(l_row+i-1)+")";	
			exSheet2.Cells[l_row + i,30 ].Value = "=SUM(AD4:AD"+(l_row+i-1)+")";		
			exSheet2.Cells[l_row + i,31 ].Value = "=SUM(AE4:AE"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i,32 ].Value = "=SUM(AF4:AF"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i,33 ].Value = "=SUM(AG4:AG"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i,34 ].Value = "=SUM(AH4:AH"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i,35 ].Value = "=SUM(AI4:AI"+(l_row+i-1)+")";
			exSheet2.Cells[l_row + i,36 ].Value = "=SUM(AJ4:AJ"+(l_row+i-1)+")";	 
			
			 
			
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
