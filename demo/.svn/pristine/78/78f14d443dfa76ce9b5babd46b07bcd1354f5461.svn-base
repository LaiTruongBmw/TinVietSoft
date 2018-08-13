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

public partial class rpt_60240030_room_availability : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString()); 

        string l_date = Request["p_date"];
       
        string TemplateFile = "rpt_60240030_room_availability.xls";
        string TempFile = "../../../../system/temp/rpt_60240030_room_availability_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
        string para = "";
        DataTable dt, dtNote;

        para = "'" + l_date + "'";
        dt = CtlLib.TableReadOpenCursor("ht_rpt_60240030", para);
		
		dtNote = CtlLib.TableReadOpenCursor("ht_rpt_60240030_note", para);
		// Response.Write(dtNote.Rows.Count);
		// Response.End();
        //-----header---   
		
        //---end--header---
        //--set-----DataBind--in---Master---
        if (dt.Rows.Count == 0)
        {
            exSheet.Cells[3, 3].Value = "There is not data!";

        }
		int start_col=4;
		if (dt.Rows.Count > 0)//hesder 1   
        {
				int first_days =int.Parse(dt.Rows[1][34].ToString());
				int last_day   =int.Parse(dt.Rows[1][35].ToString());
				int first_day  =int.Parse(dt.Rows[1][36].ToString());
				int cur_month  =int.Parse(dt.Rows[0][37].ToString());
				int col_idx;
				
				if(first_day > 1){
					//alert(first_days +":"+last_day+":"+first_day)
					for(int i=0;i<=first_days;i++){
						exSheet.Cells[4, start_col+i].Value = first_day+i+"/"+cur_month;
						exSheet.Cells[18, start_col+i].Value = first_day+i+"/"+cur_month;
					}
					if(cur_month < 12){
						cur_month += 1;
					}
					else{
						cur_month = 1;
					}
					for(int j=1;j<(31-first_days);j++){
						exSheet.Cells[4, start_col+j+first_days].Value = j+"/"+cur_month;
						exSheet.Cells[18,start_col+j+first_days].Value = j+"/"+cur_month;
					}
					
				}
				else
				{
					for(int k=0;k<=30;k++){
						exSheet.Cells[4, k+start_col].Value = 1+k+"/"+cur_month;
						exSheet.Cells[18, k+start_col].Value = 1+k+"/"+cur_month;
					}
				}
		}
		
        if (dt.Rows.Count > 0)
        {
		
			//header thu'
			exSheet.Cells[3, 1].Value = dt.Rows[0]["date_para"].ToString();
			exSheet.Cells[2, 29].Value = dt.Rows[0]["print_time"].ToString();
			
			exSheet.Cells[5, 1].Value = dt.Rows[0][0].ToString();
			exSheet.Cells[5, 2].Value = dt.Rows[0][1].ToString();
			exSheet.Cells[5, 3].Value = dt.Rows[0][2].ToString();
            exSheet.Cells[5, 4].Value = dt.Rows[0][3].ToString();
			exSheet.Cells[5, 5].Value = dt.Rows[0][4].ToString();
			exSheet.Cells[5, 6].Value = dt.Rows[0][5].ToString();
			exSheet.Cells[5, 7].Value = dt.Rows[0][6].ToString();
			exSheet.Cells[5, 8].Value = dt.Rows[0][7].ToString();
			exSheet.Cells[5, 9].Value = dt.Rows[0][8].ToString();
			exSheet.Cells[5, 10].Value = dt.Rows[0][9].ToString();
			exSheet.Cells[5, 11].Value = dt.Rows[0][10].ToString();
			exSheet.Cells[5, 12].Value = dt.Rows[0][11].ToString();
			exSheet.Cells[5, 13].Value = dt.Rows[0][12].ToString();
			exSheet.Cells[5, 14].Value = dt.Rows[0][13].ToString();
			exSheet.Cells[5, 15].Value = dt.Rows[0][14].ToString();
			exSheet.Cells[5, 16].Value = dt.Rows[0][15].ToString();
			exSheet.Cells[5, 17].Value = dt.Rows[0][16].ToString();
			exSheet.Cells[5, 18].Value = dt.Rows[0][17].ToString();
			exSheet.Cells[5, 19].Value = dt.Rows[0][18].ToString();
			exSheet.Cells[5, 20].Value = dt.Rows[0][19].ToString();
			exSheet.Cells[5, 21].Value = dt.Rows[0][20].ToString();
			exSheet.Cells[5, 22].Value = dt.Rows[0][21].ToString();
			exSheet.Cells[5, 23].Value = dt.Rows[0][22].ToString();
			exSheet.Cells[5, 24].Value = dt.Rows[0][23].ToString();
			exSheet.Cells[5, 25].Value = dt.Rows[0][24].ToString();
			exSheet.Cells[5, 26].Value = dt.Rows[0][25].ToString();
			exSheet.Cells[5, 27].Value = dt.Rows[0][26].ToString();
			exSheet.Cells[5, 28].Value = dt.Rows[0][27].ToString();
			exSheet.Cells[5, 29].Value = dt.Rows[0][28].ToString();
			exSheet.Cells[5, 30].Value = dt.Rows[0][29].ToString();
			exSheet.Cells[5, 31].Value = dt.Rows[0][30].ToString();
			exSheet.Cells[5, 32].Value = dt.Rows[0][31].ToString();
			exSheet.Cells[5, 33].Value = dt.Rows[0][32].ToString();
			exSheet.Cells[5, 34].Value = dt.Rows[0][33].ToString();
			//row 6
			exSheet.Cells[6, 1].Value = dt.Rows[1][0].ToString();
			exSheet.Cells[6, 2].Value = dt.Rows[1][1].ToString();
			exSheet.Cells[6, 3].Value = int.Parse(dt.Rows[1][2].ToString());
            exSheet.Cells[6, 4].Value = int.Parse(dt.Rows[1][3].ToString());
			exSheet.Cells[6, 5].Value = int.Parse(dt.Rows[1][4].ToString());
			exSheet.Cells[6, 6].Value = int.Parse(dt.Rows[1][5].ToString());
			exSheet.Cells[6, 7].Value = int.Parse(dt.Rows[1][6].ToString());
			exSheet.Cells[6, 8].Value = int.Parse(dt.Rows[1][7].ToString());
			exSheet.Cells[6, 9].Value = int.Parse(dt.Rows[1][8].ToString());
			exSheet.Cells[6, 10].Value = int.Parse(dt.Rows[1][9].ToString());
			exSheet.Cells[6, 11].Value = int.Parse(dt.Rows[1][10].ToString());
			exSheet.Cells[6, 12].Value = int.Parse(dt.Rows[1][11].ToString());
			exSheet.Cells[6, 13].Value = int.Parse(dt.Rows[1][12].ToString());
			exSheet.Cells[6, 14].Value = int.Parse(dt.Rows[1][13].ToString());
			exSheet.Cells[6, 15].Value = int.Parse(dt.Rows[1][14].ToString());
			exSheet.Cells[6, 16].Value = int.Parse(dt.Rows[1][15].ToString());
			exSheet.Cells[6, 17].Value = int.Parse(dt.Rows[1][16].ToString());
			exSheet.Cells[6, 18].Value = int.Parse(dt.Rows[1][17].ToString());
			exSheet.Cells[6, 19].Value = int.Parse(dt.Rows[1][18].ToString());
			exSheet.Cells[6, 20].Value = int.Parse(dt.Rows[1][19].ToString());
			exSheet.Cells[6, 21].Value = int.Parse(dt.Rows[1][20].ToString());
			exSheet.Cells[6, 22].Value = int.Parse(dt.Rows[1][21].ToString());
			exSheet.Cells[6, 23].Value = int.Parse(dt.Rows[1][22].ToString());
			exSheet.Cells[6, 24].Value = int.Parse(dt.Rows[1][23].ToString());
			exSheet.Cells[6, 25].Value = int.Parse(dt.Rows[1][24].ToString());
			exSheet.Cells[6, 26].Value = int.Parse(dt.Rows[1][25].ToString());
			exSheet.Cells[6, 27].Value = int.Parse(dt.Rows[1][26].ToString());
			exSheet.Cells[6, 28].Value = int.Parse(dt.Rows[1][27].ToString());
			exSheet.Cells[6, 29].Value = int.Parse(dt.Rows[1][28].ToString());
			exSheet.Cells[6, 30].Value = int.Parse(dt.Rows[1][29].ToString());
			exSheet.Cells[6, 31].Value = int.Parse(dt.Rows[1][30].ToString());
			exSheet.Cells[6, 32].Value = int.Parse(dt.Rows[1][31].ToString());
			exSheet.Cells[6, 33].Value = int.Parse(dt.Rows[1][32].ToString());
			exSheet.Cells[6, 34].Value = int.Parse(dt.Rows[1][33].ToString());
			//row7
			exSheet.Cells[7, 1].Value = dt.Rows[2][0].ToString();
			exSheet.Cells[7, 2].Value = dt.Rows[2][1].ToString();
			exSheet.Cells[7, 3].Value = int.Parse(dt.Rows[2][2].ToString());
            exSheet.Cells[7, 4].Value = int.Parse(dt.Rows[2][3].ToString());
			exSheet.Cells[7, 5].Value = int.Parse(dt.Rows[2][4].ToString());
			exSheet.Cells[7, 6].Value = int.Parse(dt.Rows[2][5].ToString());
			exSheet.Cells[7, 7].Value = int.Parse(dt.Rows[2][6].ToString());
			exSheet.Cells[7, 8].Value = int.Parse(dt.Rows[2][7].ToString());
			exSheet.Cells[7, 9].Value = int.Parse(dt.Rows[2][8].ToString());
			exSheet.Cells[7, 10].Value = int.Parse(dt.Rows[2][9].ToString());
			exSheet.Cells[7, 11].Value = int.Parse(dt.Rows[2][10].ToString());
			exSheet.Cells[7, 12].Value = int.Parse(dt.Rows[2][11].ToString());
			exSheet.Cells[7, 13].Value = int.Parse(dt.Rows[2][12].ToString());
			exSheet.Cells[7, 14].Value = int.Parse(dt.Rows[2][13].ToString());
			exSheet.Cells[7, 15].Value = int.Parse(dt.Rows[2][14].ToString());
			exSheet.Cells[7, 16].Value = int.Parse(dt.Rows[2][15].ToString());
			exSheet.Cells[7, 17].Value = int.Parse(dt.Rows[2][16].ToString());
			exSheet.Cells[7, 18].Value = int.Parse(dt.Rows[2][17].ToString());
			exSheet.Cells[7, 19].Value = int.Parse(dt.Rows[2][18].ToString());
			exSheet.Cells[7, 20].Value = int.Parse(dt.Rows[2][19].ToString());
			exSheet.Cells[7, 21].Value = int.Parse(dt.Rows[2][20].ToString());
			exSheet.Cells[7, 22].Value = int.Parse(dt.Rows[2][21].ToString());
			exSheet.Cells[7, 23].Value = int.Parse(dt.Rows[2][22].ToString());
			exSheet.Cells[7, 24].Value = int.Parse(dt.Rows[2][23].ToString());
			exSheet.Cells[7, 25].Value = int.Parse(dt.Rows[2][24].ToString());
			exSheet.Cells[7, 26].Value = int.Parse(dt.Rows[2][25].ToString());
			exSheet.Cells[7, 27].Value = int.Parse(dt.Rows[2][26].ToString());
			exSheet.Cells[7, 28].Value = int.Parse(dt.Rows[2][27].ToString());
			exSheet.Cells[7, 29].Value = int.Parse(dt.Rows[2][28].ToString());
			exSheet.Cells[7, 30].Value = int.Parse(dt.Rows[2][29].ToString());
			exSheet.Cells[7, 31].Value = int.Parse(dt.Rows[2][30].ToString());
			exSheet.Cells[7, 32].Value = int.Parse(dt.Rows[2][31].ToString());
			exSheet.Cells[7, 33].Value = int.Parse(dt.Rows[2][32].ToString());
			exSheet.Cells[7, 34].Value = int.Parse(dt.Rows[2][33].ToString());
			//
			exSheet.Cells[8, 1].Value = dt.Rows[3][0].ToString();
			exSheet.Cells[8, 2].Value = dt.Rows[3][1].ToString();
			exSheet.Cells[8, 3].Value = int.Parse(dt.Rows[3][2].ToString());
            exSheet.Cells[8, 4].Value = int.Parse(dt.Rows[3][3].ToString());
			exSheet.Cells[8, 5].Value = int.Parse(dt.Rows[3][4].ToString());
			exSheet.Cells[8, 6].Value = int.Parse(dt.Rows[3][5].ToString());
			exSheet.Cells[8, 7].Value = int.Parse(dt.Rows[3][6].ToString());
			exSheet.Cells[8, 8].Value = int.Parse(dt.Rows[3][7].ToString());
			exSheet.Cells[8, 9].Value = int.Parse(dt.Rows[3][8].ToString());
			exSheet.Cells[8, 10].Value = int.Parse(dt.Rows[3][9].ToString());
			exSheet.Cells[8, 11].Value = int.Parse(dt.Rows[3][10].ToString());
			exSheet.Cells[8, 12].Value = int.Parse(dt.Rows[3][11].ToString());
			exSheet.Cells[8, 13].Value = int.Parse(dt.Rows[3][12].ToString());
			exSheet.Cells[8, 14].Value = int.Parse(dt.Rows[3][13].ToString());
			exSheet.Cells[8, 15].Value = int.Parse(dt.Rows[3][14].ToString());
			exSheet.Cells[8, 16].Value = int.Parse(dt.Rows[3][15].ToString());
			exSheet.Cells[8, 17].Value = int.Parse(dt.Rows[3][16].ToString());
			exSheet.Cells[8, 18].Value = int.Parse(dt.Rows[3][17].ToString());
			exSheet.Cells[8, 19].Value = int.Parse(dt.Rows[3][18].ToString());
			exSheet.Cells[8, 20].Value = int.Parse(dt.Rows[3][19].ToString());
			exSheet.Cells[8, 21].Value = int.Parse(dt.Rows[3][20].ToString());
			exSheet.Cells[8, 22].Value = int.Parse(dt.Rows[3][21].ToString());
			exSheet.Cells[8, 23].Value = int.Parse(dt.Rows[3][22].ToString());
			exSheet.Cells[8, 24].Value = int.Parse(dt.Rows[3][23].ToString());
			exSheet.Cells[8, 25].Value = int.Parse(dt.Rows[3][24].ToString());
			exSheet.Cells[8, 26].Value = int.Parse(dt.Rows[3][25].ToString());
			exSheet.Cells[8, 27].Value = int.Parse(dt.Rows[3][26].ToString());
			exSheet.Cells[8, 28].Value = int.Parse(dt.Rows[3][27].ToString());
			exSheet.Cells[8, 29].Value = int.Parse(dt.Rows[3][28].ToString());
			exSheet.Cells[8, 30].Value = int.Parse(dt.Rows[3][29].ToString());
			exSheet.Cells[8, 31].Value = int.Parse(dt.Rows[3][30].ToString());
			exSheet.Cells[8, 32].Value = int.Parse(dt.Rows[3][31].ToString());
			exSheet.Cells[8, 33].Value = int.Parse(dt.Rows[3][32].ToString());
			exSheet.Cells[8, 34].Value = int.Parse(dt.Rows[3][33].ToString());
			//
			exSheet.Cells[9, 1].Value = dt.Rows[4][0].ToString();
			exSheet.Cells[9, 2].Value = dt.Rows[4][1].ToString();
			exSheet.Cells[9, 3].Value = int.Parse(dt.Rows[4][2].ToString());
            exSheet.Cells[9, 4].Value = int.Parse(dt.Rows[4][3].ToString());
			exSheet.Cells[9, 5].Value = int.Parse(dt.Rows[4][4].ToString());
			exSheet.Cells[9, 6].Value = int.Parse(dt.Rows[4][5].ToString());
			exSheet.Cells[9, 7].Value = int.Parse(dt.Rows[4][6].ToString());
			exSheet.Cells[9, 8].Value = int.Parse(dt.Rows[4][7].ToString());
			exSheet.Cells[9, 9].Value = int.Parse(dt.Rows[4][8].ToString());
			exSheet.Cells[9, 10].Value = int.Parse(dt.Rows[4][9].ToString());
			exSheet.Cells[9, 11].Value = int.Parse(dt.Rows[4][10].ToString());
			exSheet.Cells[9, 12].Value = int.Parse(dt.Rows[4][11].ToString());
			exSheet.Cells[9, 13].Value = int.Parse(dt.Rows[4][12].ToString());
			exSheet.Cells[9, 14].Value = int.Parse(dt.Rows[4][13].ToString());
			exSheet.Cells[9, 15].Value = int.Parse(dt.Rows[4][14].ToString());
			exSheet.Cells[9, 16].Value = int.Parse(dt.Rows[4][15].ToString());
			exSheet.Cells[9, 17].Value = int.Parse(dt.Rows[4][16].ToString());
			exSheet.Cells[9, 18].Value = int.Parse(dt.Rows[4][17].ToString());
			exSheet.Cells[9, 19].Value = int.Parse(dt.Rows[4][18].ToString());
			exSheet.Cells[9, 20].Value = int.Parse(dt.Rows[4][19].ToString());
			exSheet.Cells[9, 21].Value = int.Parse(dt.Rows[4][20].ToString());
			exSheet.Cells[9, 22].Value = int.Parse(dt.Rows[4][21].ToString());
			exSheet.Cells[9, 23].Value = int.Parse(dt.Rows[4][22].ToString());
			exSheet.Cells[9, 24].Value = int.Parse(dt.Rows[4][23].ToString());
			exSheet.Cells[9, 25].Value = int.Parse(dt.Rows[4][24].ToString());
			exSheet.Cells[9, 26].Value = int.Parse(dt.Rows[4][25].ToString());
			exSheet.Cells[9, 27].Value = int.Parse(dt.Rows[4][26].ToString());
			exSheet.Cells[9, 28].Value = int.Parse(dt.Rows[4][27].ToString());
			exSheet.Cells[9, 29].Value = int.Parse(dt.Rows[4][28].ToString());
			exSheet.Cells[9, 30].Value = int.Parse(dt.Rows[4][29].ToString());
			exSheet.Cells[9, 31].Value = int.Parse(dt.Rows[4][30].ToString());
			exSheet.Cells[9, 32].Value = int.Parse(dt.Rows[4][31].ToString());
			exSheet.Cells[9, 33].Value = int.Parse(dt.Rows[4][32].ToString());
			exSheet.Cells[9, 34].Value = int.Parse(dt.Rows[4][33].ToString());
			//
			exSheet.Cells[10, 1].Value = dt.Rows[5][0].ToString();
			exSheet.Cells[10, 2].Value = dt.Rows[5][1].ToString();
			exSheet.Cells[10, 3].Value = int.Parse(dt.Rows[5][2].ToString());
            exSheet.Cells[10, 4].Value = int.Parse(dt.Rows[5][3].ToString());
			exSheet.Cells[10, 5].Value = int.Parse(dt.Rows[5][4].ToString());
			exSheet.Cells[10, 6].Value = int.Parse(dt.Rows[5][5].ToString());
			exSheet.Cells[10, 7].Value = int.Parse(dt.Rows[5][6].ToString());
			exSheet.Cells[10, 8].Value = int.Parse(dt.Rows[5][7].ToString());
			exSheet.Cells[10, 9].Value = int.Parse(dt.Rows[5][8].ToString());
			exSheet.Cells[10, 10].Value = int.Parse(dt.Rows[5][9].ToString());
			exSheet.Cells[10, 11].Value = int.Parse(dt.Rows[5][10].ToString());
			exSheet.Cells[10, 12].Value = int.Parse(dt.Rows[5][11].ToString());
			exSheet.Cells[10, 13].Value = int.Parse(dt.Rows[5][12].ToString());
			exSheet.Cells[10, 14].Value = int.Parse(dt.Rows[5][13].ToString());
			exSheet.Cells[10, 15].Value = int.Parse(dt.Rows[5][14].ToString());
			exSheet.Cells[10, 16].Value = int.Parse(dt.Rows[5][15].ToString());
			exSheet.Cells[10, 17].Value = int.Parse(dt.Rows[5][16].ToString());
			exSheet.Cells[10, 18].Value = int.Parse(dt.Rows[5][17].ToString());
			exSheet.Cells[10, 19].Value = int.Parse(dt.Rows[5][18].ToString());
			exSheet.Cells[10, 20].Value = int.Parse(dt.Rows[5][19].ToString());
			exSheet.Cells[10, 21].Value = int.Parse(dt.Rows[5][20].ToString());
			exSheet.Cells[10, 22].Value = int.Parse(dt.Rows[5][21].ToString());
			exSheet.Cells[10, 23].Value = int.Parse(dt.Rows[5][22].ToString());
			exSheet.Cells[10, 24].Value = int.Parse(dt.Rows[5][23].ToString());
			exSheet.Cells[10, 25].Value = int.Parse(dt.Rows[5][24].ToString());
			exSheet.Cells[10, 26].Value = int.Parse(dt.Rows[5][25].ToString());
			exSheet.Cells[10, 27].Value = int.Parse(dt.Rows[5][26].ToString());
			exSheet.Cells[10, 28].Value = int.Parse(dt.Rows[5][27].ToString());
			exSheet.Cells[10, 29].Value = int.Parse(dt.Rows[5][28].ToString());
			exSheet.Cells[10, 30].Value = int.Parse(dt.Rows[5][29].ToString());
			exSheet.Cells[10, 31].Value = int.Parse(dt.Rows[5][30].ToString());
			exSheet.Cells[10, 32].Value = int.Parse(dt.Rows[5][31].ToString());
			exSheet.Cells[10, 33].Value = int.Parse(dt.Rows[5][32].ToString());
			exSheet.Cells[10, 34].Value = int.Parse(dt.Rows[5][33].ToString());
			//
			exSheet.Cells[11, 1].Value = dt.Rows[6][0].ToString();
			exSheet.Cells[11, 2].Value = dt.Rows[6][1].ToString();
			exSheet.Cells[11, 3].Value = int.Parse(dt.Rows[6][2].ToString());
            exSheet.Cells[11, 4].Value = int.Parse(dt.Rows[6][3].ToString());
			exSheet.Cells[11, 5].Value = int.Parse(dt.Rows[6][4].ToString());
			exSheet.Cells[11, 6].Value = int.Parse(dt.Rows[6][5].ToString());
			exSheet.Cells[11, 7].Value = int.Parse(dt.Rows[6][6].ToString());
			exSheet.Cells[11, 8].Value = int.Parse(dt.Rows[6][7].ToString());
			exSheet.Cells[11, 9].Value = int.Parse(dt.Rows[6][8].ToString());
			exSheet.Cells[11, 10].Value = int.Parse(dt.Rows[6][9].ToString());
			exSheet.Cells[11, 11].Value = int.Parse(dt.Rows[6][10].ToString());
			exSheet.Cells[11, 12].Value = int.Parse(dt.Rows[6][11].ToString());
			exSheet.Cells[11, 13].Value = int.Parse(dt.Rows[6][12].ToString());
			exSheet.Cells[11, 14].Value = int.Parse(dt.Rows[6][13].ToString());
			exSheet.Cells[11, 15].Value = int.Parse(dt.Rows[6][14].ToString());
			exSheet.Cells[11, 16].Value = int.Parse(dt.Rows[6][15].ToString());
			exSheet.Cells[11, 17].Value = int.Parse(dt.Rows[6][16].ToString());
			exSheet.Cells[11, 18].Value = int.Parse(dt.Rows[6][17].ToString());
			exSheet.Cells[11, 19].Value = int.Parse(dt.Rows[6][18].ToString());
			exSheet.Cells[11, 20].Value = int.Parse(dt.Rows[6][19].ToString());
			exSheet.Cells[11, 21].Value = int.Parse(dt.Rows[6][20].ToString());
			exSheet.Cells[11, 22].Value = int.Parse(dt.Rows[6][21].ToString());
			exSheet.Cells[11, 23].Value = int.Parse(dt.Rows[6][22].ToString());
			exSheet.Cells[11, 24].Value = int.Parse(dt.Rows[6][23].ToString());
			exSheet.Cells[11, 25].Value = int.Parse(dt.Rows[6][24].ToString());
			exSheet.Cells[11, 26].Value = int.Parse(dt.Rows[6][25].ToString());
			exSheet.Cells[11, 27].Value = int.Parse(dt.Rows[6][26].ToString());
			exSheet.Cells[11, 28].Value = int.Parse(dt.Rows[6][27].ToString());
			exSheet.Cells[11, 29].Value = int.Parse(dt.Rows[6][28].ToString());
			exSheet.Cells[11, 30].Value = int.Parse(dt.Rows[6][29].ToString());
			exSheet.Cells[11, 31].Value = int.Parse(dt.Rows[6][30].ToString());
			exSheet.Cells[11, 32].Value = int.Parse(dt.Rows[6][31].ToString());
			exSheet.Cells[11, 33].Value = int.Parse(dt.Rows[6][32].ToString());
			exSheet.Cells[11, 34].Value = int.Parse(dt.Rows[6][33].ToString());
			//
			exSheet.Cells[12, 1].Value = dt.Rows[7][0].ToString();
			exSheet.Cells[12, 2].Value = dt.Rows[7][1].ToString();
			exSheet.Cells[12, 3].Value = int.Parse(dt.Rows[7][2].ToString());
            exSheet.Cells[12, 4].Value = int.Parse(dt.Rows[7][3].ToString());
			exSheet.Cells[12, 5].Value = int.Parse(dt.Rows[7][4].ToString());
			exSheet.Cells[12, 6].Value = int.Parse(dt.Rows[7][5].ToString());
			exSheet.Cells[12, 7].Value = int.Parse(dt.Rows[7][6].ToString());
			exSheet.Cells[12, 8].Value = int.Parse(dt.Rows[7][7].ToString());
			exSheet.Cells[12, 9].Value = int.Parse(dt.Rows[7][8].ToString());
			exSheet.Cells[12, 10].Value = int.Parse(dt.Rows[7][9].ToString());
			exSheet.Cells[12, 11].Value = int.Parse(dt.Rows[7][10].ToString());
			exSheet.Cells[12, 12].Value = int.Parse(dt.Rows[7][11].ToString());
			exSheet.Cells[12, 13].Value = int.Parse(dt.Rows[7][12].ToString());
			exSheet.Cells[12, 14].Value = int.Parse(dt.Rows[7][13].ToString());
			exSheet.Cells[12, 15].Value = int.Parse(dt.Rows[7][14].ToString());
			exSheet.Cells[12, 16].Value = int.Parse(dt.Rows[7][15].ToString());
			exSheet.Cells[12, 17].Value = int.Parse(dt.Rows[7][16].ToString());
			exSheet.Cells[12, 18].Value = int.Parse(dt.Rows[7][17].ToString());
			exSheet.Cells[12, 19].Value = int.Parse(dt.Rows[7][18].ToString());
			exSheet.Cells[12, 20].Value = int.Parse(dt.Rows[7][19].ToString());
			exSheet.Cells[12, 21].Value = int.Parse(dt.Rows[7][20].ToString());
			exSheet.Cells[12, 22].Value = int.Parse(dt.Rows[7][21].ToString());
			exSheet.Cells[12, 23].Value = int.Parse(dt.Rows[7][22].ToString());
			exSheet.Cells[12, 24].Value = int.Parse(dt.Rows[7][23].ToString());
			exSheet.Cells[12, 25].Value = int.Parse(dt.Rows[7][24].ToString());
			exSheet.Cells[12, 26].Value = int.Parse(dt.Rows[7][25].ToString());
			exSheet.Cells[12, 27].Value = int.Parse(dt.Rows[7][26].ToString());
			exSheet.Cells[12, 28].Value = int.Parse(dt.Rows[7][27].ToString());
			exSheet.Cells[12, 29].Value = int.Parse(dt.Rows[7][28].ToString());
			exSheet.Cells[12, 30].Value = int.Parse(dt.Rows[7][29].ToString());
			exSheet.Cells[12, 31].Value = int.Parse(dt.Rows[7][30].ToString());
			exSheet.Cells[12, 32].Value = int.Parse(dt.Rows[7][31].ToString());
			exSheet.Cells[12, 33].Value = int.Parse(dt.Rows[7][32].ToString());
			exSheet.Cells[12, 34].Value = int.Parse(dt.Rows[7][33].ToString());
			//
			exSheet.Cells[13, 1].Value = dt.Rows[8][0].ToString();
			exSheet.Cells[13, 2].Value = dt.Rows[8][1].ToString();
			exSheet.Cells[13, 3].Value = int.Parse(dt.Rows[8][2].ToString());
            exSheet.Cells[13, 4].Value = int.Parse(dt.Rows[8][3].ToString());
			exSheet.Cells[13, 5].Value = int.Parse(dt.Rows[8][4].ToString());
			exSheet.Cells[13, 6].Value = int.Parse(dt.Rows[8][5].ToString());
			exSheet.Cells[13, 7].Value = int.Parse(dt.Rows[8][6].ToString());
			exSheet.Cells[13, 8].Value = int.Parse(dt.Rows[8][7].ToString());
			exSheet.Cells[13, 9].Value = int.Parse(dt.Rows[8][8].ToString());
			exSheet.Cells[13, 10].Value = int.Parse(dt.Rows[8][9].ToString());
			exSheet.Cells[13, 11].Value = int.Parse(dt.Rows[8][10].ToString());
			exSheet.Cells[13, 12].Value = int.Parse(dt.Rows[8][11].ToString());
			exSheet.Cells[13, 13].Value = int.Parse(dt.Rows[8][12].ToString());
			exSheet.Cells[13, 14].Value = int.Parse(dt.Rows[8][13].ToString());
			exSheet.Cells[13, 15].Value = int.Parse(dt.Rows[8][14].ToString());
			exSheet.Cells[13, 16].Value = int.Parse(dt.Rows[8][15].ToString());
			exSheet.Cells[13, 17].Value = int.Parse(dt.Rows[8][16].ToString());
			exSheet.Cells[13, 18].Value = int.Parse(dt.Rows[8][17].ToString());
			exSheet.Cells[13, 19].Value = int.Parse(dt.Rows[8][18].ToString());
			exSheet.Cells[13, 20].Value = int.Parse(dt.Rows[8][19].ToString());
			exSheet.Cells[13, 21].Value = int.Parse(dt.Rows[8][20].ToString());
			exSheet.Cells[13, 22].Value = int.Parse(dt.Rows[8][21].ToString());
			exSheet.Cells[13, 23].Value = int.Parse(dt.Rows[8][22].ToString());
			exSheet.Cells[13, 24].Value = int.Parse(dt.Rows[8][23].ToString());
			exSheet.Cells[13, 25].Value = int.Parse(dt.Rows[8][24].ToString());
			exSheet.Cells[13, 26].Value = int.Parse(dt.Rows[8][25].ToString());
			exSheet.Cells[13, 27].Value = int.Parse(dt.Rows[8][26].ToString());
			exSheet.Cells[13, 28].Value = int.Parse(dt.Rows[8][27].ToString());
			exSheet.Cells[13, 29].Value = int.Parse(dt.Rows[8][28].ToString());
			exSheet.Cells[13, 30].Value = int.Parse(dt.Rows[8][29].ToString());
			exSheet.Cells[13, 31].Value = int.Parse(dt.Rows[8][30].ToString());
			exSheet.Cells[13, 32].Value = int.Parse(dt.Rows[8][31].ToString());
			exSheet.Cells[13, 33].Value = int.Parse(dt.Rows[8][32].ToString());
			exSheet.Cells[13, 34].Value = int.Parse(dt.Rows[8][33].ToString());
			//
			exSheet.Cells[14, 1].Value = dt.Rows[9][0].ToString();
			exSheet.Cells[14, 2].Value = dt.Rows[9][1].ToString();
			exSheet.Cells[14, 3].Value = int.Parse(dt.Rows[9][2].ToString());
            exSheet.Cells[14, 4].Value = int.Parse(dt.Rows[9][3].ToString());
			exSheet.Cells[14, 5].Value = int.Parse(dt.Rows[9][4].ToString());
			exSheet.Cells[14, 6].Value = int.Parse(dt.Rows[9][5].ToString());
			exSheet.Cells[14, 7].Value = int.Parse(dt.Rows[9][6].ToString());
			exSheet.Cells[14, 8].Value = int.Parse(dt.Rows[9][7].ToString());
			exSheet.Cells[14, 9].Value = int.Parse(dt.Rows[9][8].ToString());
			exSheet.Cells[14, 10].Value = int.Parse(dt.Rows[9][9].ToString());
			exSheet.Cells[14, 11].Value = int.Parse(dt.Rows[9][10].ToString());
			exSheet.Cells[14, 12].Value = int.Parse(dt.Rows[9][11].ToString());
			exSheet.Cells[14, 13].Value = int.Parse(dt.Rows[9][12].ToString());
			exSheet.Cells[14, 14].Value = int.Parse(dt.Rows[9][13].ToString());
			exSheet.Cells[14, 15].Value = int.Parse(dt.Rows[9][14].ToString());
			exSheet.Cells[14, 16].Value = int.Parse(dt.Rows[9][15].ToString());
			exSheet.Cells[14, 17].Value = int.Parse(dt.Rows[9][16].ToString());
			exSheet.Cells[14, 18].Value = int.Parse(dt.Rows[9][17].ToString());
			exSheet.Cells[14, 19].Value = int.Parse(dt.Rows[9][18].ToString());
			exSheet.Cells[14, 20].Value = int.Parse(dt.Rows[9][19].ToString());
			exSheet.Cells[14, 21].Value = int.Parse(dt.Rows[9][20].ToString());
			exSheet.Cells[14, 22].Value = int.Parse(dt.Rows[9][21].ToString());
			exSheet.Cells[14, 23].Value = int.Parse(dt.Rows[9][22].ToString());
			exSheet.Cells[14, 24].Value = int.Parse(dt.Rows[9][23].ToString());
			exSheet.Cells[14, 25].Value = int.Parse(dt.Rows[9][24].ToString());
			exSheet.Cells[14, 26].Value = int.Parse(dt.Rows[9][25].ToString());
			exSheet.Cells[14, 27].Value = int.Parse(dt.Rows[9][26].ToString());
			exSheet.Cells[14, 28].Value = int.Parse(dt.Rows[9][27].ToString());
			exSheet.Cells[14, 29].Value = int.Parse(dt.Rows[9][28].ToString());
			exSheet.Cells[14, 30].Value = int.Parse(dt.Rows[9][29].ToString());
			exSheet.Cells[14, 31].Value = int.Parse(dt.Rows[9][30].ToString());
			exSheet.Cells[14, 32].Value = int.Parse(dt.Rows[9][31].ToString());
			exSheet.Cells[14, 33].Value = int.Parse(dt.Rows[9][32].ToString());
			exSheet.Cells[14, 34].Value = int.Parse(dt.Rows[9][33].ToString());
			
			exSheet.Cells[15, 1].Value = dt.Rows[10][0].ToString();
			exSheet.Cells[15, 2].Value = dt.Rows[10][1].ToString();
			exSheet.Cells[15, 3].Value = dt.Rows[10][2].ToString();
            exSheet.Cells[15, 4].Value = int.Parse(dt.Rows[10][3].ToString());
			exSheet.Cells[15, 5].Value = int.Parse(dt.Rows[10][4].ToString());
			exSheet.Cells[15, 6].Value = int.Parse(dt.Rows[10][5].ToString());
			exSheet.Cells[15, 7].Value = int.Parse(dt.Rows[10][6].ToString());
			exSheet.Cells[15, 8].Value = int.Parse(dt.Rows[10][7].ToString());
			exSheet.Cells[15, 9].Value = int.Parse(dt.Rows[10][8].ToString());
			exSheet.Cells[15, 10].Value = int.Parse(dt.Rows[10][9].ToString());
			exSheet.Cells[15, 11].Value = int.Parse(dt.Rows[10][10].ToString());
			exSheet.Cells[15, 12].Value = int.Parse(dt.Rows[10][11].ToString());
			exSheet.Cells[15, 13].Value = int.Parse(dt.Rows[10][12].ToString());
			exSheet.Cells[15, 14].Value = int.Parse(dt.Rows[10][13].ToString());
			exSheet.Cells[15, 15].Value = int.Parse(dt.Rows[10][14].ToString());
			exSheet.Cells[15, 16].Value = int.Parse(dt.Rows[10][15].ToString());
			exSheet.Cells[15, 17].Value = int.Parse(dt.Rows[10][16].ToString());
			exSheet.Cells[15, 18].Value = int.Parse(dt.Rows[10][17].ToString());
			exSheet.Cells[15, 19].Value = int.Parse(dt.Rows[10][18].ToString());
			exSheet.Cells[15, 20].Value = int.Parse(dt.Rows[10][19].ToString());
			exSheet.Cells[15, 21].Value = int.Parse(dt.Rows[10][20].ToString());
			exSheet.Cells[15, 22].Value = int.Parse(dt.Rows[10][21].ToString());
			exSheet.Cells[15, 23].Value = int.Parse(dt.Rows[10][22].ToString());
			exSheet.Cells[15, 24].Value = int.Parse(dt.Rows[10][23].ToString());
			exSheet.Cells[15, 25].Value = int.Parse(dt.Rows[10][24].ToString());
			exSheet.Cells[15, 26].Value = int.Parse(dt.Rows[10][25].ToString());
			exSheet.Cells[15, 27].Value = int.Parse(dt.Rows[10][26].ToString());
			exSheet.Cells[15, 28].Value = int.Parse(dt.Rows[10][27].ToString());
			exSheet.Cells[15, 29].Value = int.Parse(dt.Rows[10][28].ToString());
			exSheet.Cells[15, 30].Value = int.Parse(dt.Rows[10][29].ToString());
			exSheet.Cells[15, 31].Value = int.Parse(dt.Rows[10][30].ToString());
			exSheet.Cells[15, 32].Value = int.Parse(dt.Rows[10][31].ToString());
			exSheet.Cells[15, 33].Value = int.Parse(dt.Rows[10][32].ToString());
			exSheet.Cells[15, 34].Value = int.Parse(dt.Rows[10][33].ToString());
			
			int l_total_1=0,l_total_2=0,l_total_3=0,l_total_4=0,l_total_5=0,l_total_6=0,l_total_7=0,l_total_8=0,l_total_9=0,l_total_10=0;
			int l_total_11=0,l_total_12=0,l_total_13=0,l_total_14=0,l_total_15=0,l_total_16=0,l_total_17=0,l_total_18=0,l_total_19=0,l_total_20=0;
			int l_total_21=0,l_total_22=0,l_total_23=0,l_total_24=0,l_total_25=0,l_total_26=0,l_total_27=0,l_total_28=0,l_total_29=0,l_total_30=0,l_total_31=0;
			
			//l_total_1= int.Parse(dt.Rows[1][3].ToString())+int.Parse(dt.Rows[2][3].ToString())+int.Parse(dt.Rows[3][3].ToString())+int.Parse(dt.Rows[4][3].ToString())+int.Parse(dt.Rows[5][3].ToString())+int.Parse(dt.Rows[6][3].ToString())+int.Parse(dt.Rows[7][3].ToString())+int.Parse(dt.Rows[8][3].ToString())+int.Parse(dt.Rows[9][3].ToString())+int.Parse(dt.Rows[10][3].ToString());
			l_total_1= int.Parse(dt.Rows[1][3].ToString())+int.Parse(dt.Rows[2][3].ToString())+int.Parse(dt.Rows[3][3].ToString())+int.Parse(dt.Rows[4][3].ToString())+int.Parse(dt.Rows[5][3].ToString())+int.Parse(dt.Rows[6][3].ToString())+int.Parse(dt.Rows[7][3].ToString())+int.Parse(dt.Rows[8][3].ToString())+int.Parse(dt.Rows[9][3].ToString())+int.Parse(dt.Rows[10][3].ToString());
			l_total_2= int.Parse(dt.Rows[1][4].ToString())+int.Parse(dt.Rows[2][4].ToString())+int.Parse(dt.Rows[3][4].ToString())+int.Parse(dt.Rows[4][4].ToString())+int.Parse(dt.Rows[5][4].ToString())+int.Parse(dt.Rows[6][4].ToString())+int.Parse(dt.Rows[7][4].ToString())+int.Parse(dt.Rows[8][4].ToString())+int.Parse(dt.Rows[9][4].ToString())+int.Parse(dt.Rows[10][4].ToString());
			l_total_3= int.Parse(dt.Rows[1][5].ToString())+int.Parse(dt.Rows[2][5].ToString())+int.Parse(dt.Rows[3][5].ToString())+int.Parse(dt.Rows[4][5].ToString())+int.Parse(dt.Rows[5][5].ToString())+int.Parse(dt.Rows[6][5].ToString())+int.Parse(dt.Rows[7][5].ToString())+int.Parse(dt.Rows[8][5].ToString())+int.Parse(dt.Rows[9][5].ToString())+int.Parse(dt.Rows[10][5].ToString());
			l_total_4= int.Parse(dt.Rows[1][6].ToString())+int.Parse(dt.Rows[2][6].ToString())+int.Parse(dt.Rows[3][6].ToString())+int.Parse(dt.Rows[4][6].ToString())+int.Parse(dt.Rows[5][6].ToString())+int.Parse(dt.Rows[6][6].ToString())+int.Parse(dt.Rows[7][6].ToString())+int.Parse(dt.Rows[8][6].ToString())+int.Parse(dt.Rows[9][6].ToString())+int.Parse(dt.Rows[10][6].ToString());
			l_total_5= int.Parse(dt.Rows[1][7].ToString())+int.Parse(dt.Rows[2][7].ToString())+int.Parse(dt.Rows[3][7].ToString())+int.Parse(dt.Rows[4][7].ToString())+int.Parse(dt.Rows[5][7].ToString())+int.Parse(dt.Rows[6][7].ToString())+int.Parse(dt.Rows[7][7].ToString())+int.Parse(dt.Rows[8][7].ToString())+int.Parse(dt.Rows[9][7].ToString())+int.Parse(dt.Rows[10][7].ToString());
			l_total_6= int.Parse(dt.Rows[1][8].ToString())+int.Parse(dt.Rows[2][8].ToString())+int.Parse(dt.Rows[3][8].ToString())+int.Parse(dt.Rows[4][8].ToString())+int.Parse(dt.Rows[5][8].ToString())+int.Parse(dt.Rows[6][8].ToString())+int.Parse(dt.Rows[7][8].ToString())+int.Parse(dt.Rows[8][8].ToString())+int.Parse(dt.Rows[9][8].ToString())+int.Parse(dt.Rows[10][8].ToString());
			l_total_7= int.Parse(dt.Rows[1][9].ToString())+int.Parse(dt.Rows[2][9].ToString())+int.Parse(dt.Rows[3][9].ToString())+int.Parse(dt.Rows[4][9].ToString())+int.Parse(dt.Rows[5][9].ToString())+int.Parse(dt.Rows[6][9].ToString())+int.Parse(dt.Rows[7][9].ToString())+int.Parse(dt.Rows[8][9].ToString())+int.Parse(dt.Rows[9][9].ToString())+int.Parse(dt.Rows[10][9].ToString());
			
			
			l_total_8= int.Parse(dt.Rows[1][10].ToString())+int.Parse(dt.Rows[2][10].ToString())+int.Parse(dt.Rows[3][10].ToString())+int.Parse(dt.Rows[4][10].ToString())+int.Parse(dt.Rows[5][10].ToString())+int.Parse(dt.Rows[6][10].ToString())+int.Parse(dt.Rows[7][10].ToString())+int.Parse(dt.Rows[8][10].ToString())+int.Parse(dt.Rows[9][10].ToString())+int.Parse(dt.Rows[10][10].ToString());
			l_total_9= int.Parse(dt.Rows[1][11].ToString())+int.Parse(dt.Rows[2][11].ToString())+int.Parse(dt.Rows[3][11].ToString())+int.Parse(dt.Rows[4][11].ToString())+int.Parse(dt.Rows[5][11].ToString())+int.Parse(dt.Rows[6][11].ToString())+int.Parse(dt.Rows[7][11].ToString())+int.Parse(dt.Rows[8][11].ToString())+int.Parse(dt.Rows[9][11].ToString())+int.Parse(dt.Rows[10][11].ToString());
			
			l_total_10= int.Parse(dt.Rows[1][12].ToString())+int.Parse(dt.Rows[2][12].ToString())+int.Parse(dt.Rows[3][12].ToString())+int.Parse(dt.Rows[4][12].ToString())+int.Parse(dt.Rows[5][12].ToString())+int.Parse(dt.Rows[6][12].ToString())+int.Parse(dt.Rows[7][12].ToString())+int.Parse(dt.Rows[8][12].ToString())+int.Parse(dt.Rows[9][12].ToString())+int.Parse(dt.Rows[10][12].ToString());
			l_total_11= int.Parse(dt.Rows[1][13].ToString())+int.Parse(dt.Rows[2][13].ToString())+int.Parse(dt.Rows[3][13].ToString())+int.Parse(dt.Rows[4][13].ToString())+int.Parse(dt.Rows[5][13].ToString())+int.Parse(dt.Rows[6][13].ToString())+int.Parse(dt.Rows[7][13].ToString())+int.Parse(dt.Rows[8][13].ToString())+int.Parse(dt.Rows[9][13].ToString())+int.Parse(dt.Rows[10][13].ToString());
			l_total_12= int.Parse(dt.Rows[1][14].ToString())+int.Parse(dt.Rows[2][14].ToString())+int.Parse(dt.Rows[3][14].ToString())+int.Parse(dt.Rows[4][14].ToString())+int.Parse(dt.Rows[5][14].ToString())+int.Parse(dt.Rows[6][14].ToString())+int.Parse(dt.Rows[7][14].ToString())+int.Parse(dt.Rows[8][14].ToString())+int.Parse(dt.Rows[9][14].ToString())+int.Parse(dt.Rows[10][14].ToString());
			l_total_13= int.Parse(dt.Rows[1][15].ToString())+int.Parse(dt.Rows[2][15].ToString())+int.Parse(dt.Rows[3][15].ToString())+int.Parse(dt.Rows[4][15].ToString())+int.Parse(dt.Rows[5][15].ToString())+int.Parse(dt.Rows[6][15].ToString())+int.Parse(dt.Rows[7][15].ToString())+int.Parse(dt.Rows[8][15].ToString())+int.Parse(dt.Rows[9][15].ToString())+int.Parse(dt.Rows[10][15].ToString());
			l_total_14= int.Parse(dt.Rows[1][16].ToString())+int.Parse(dt.Rows[2][16].ToString())+int.Parse(dt.Rows[3][16].ToString())+int.Parse(dt.Rows[4][16].ToString())+int.Parse(dt.Rows[5][16].ToString())+int.Parse(dt.Rows[6][16].ToString())+int.Parse(dt.Rows[7][16].ToString())+int.Parse(dt.Rows[8][16].ToString())+int.Parse(dt.Rows[9][16].ToString())+int.Parse(dt.Rows[10][16].ToString());
			l_total_15= int.Parse(dt.Rows[1][17].ToString())+int.Parse(dt.Rows[2][17].ToString())+int.Parse(dt.Rows[3][17].ToString())+int.Parse(dt.Rows[4][17].ToString())+int.Parse(dt.Rows[5][17].ToString())+int.Parse(dt.Rows[6][17].ToString())+int.Parse(dt.Rows[7][17].ToString())+int.Parse(dt.Rows[8][17].ToString())+int.Parse(dt.Rows[9][17].ToString())+int.Parse(dt.Rows[10][17].ToString());
			l_total_16= int.Parse(dt.Rows[1][18].ToString())+int.Parse(dt.Rows[2][18].ToString())+int.Parse(dt.Rows[3][18].ToString())+int.Parse(dt.Rows[4][18].ToString())+int.Parse(dt.Rows[5][18].ToString())+int.Parse(dt.Rows[6][18].ToString())+int.Parse(dt.Rows[7][18].ToString())+int.Parse(dt.Rows[8][18].ToString())+int.Parse(dt.Rows[9][18].ToString())+int.Parse(dt.Rows[10][18].ToString());
			l_total_17= int.Parse(dt.Rows[1][19].ToString())+int.Parse(dt.Rows[2][19].ToString())+int.Parse(dt.Rows[3][19].ToString())+int.Parse(dt.Rows[4][19].ToString())+int.Parse(dt.Rows[5][19].ToString())+int.Parse(dt.Rows[6][19].ToString())+int.Parse(dt.Rows[7][19].ToString())+int.Parse(dt.Rows[8][19].ToString())+int.Parse(dt.Rows[9][19].ToString())+int.Parse(dt.Rows[10][19].ToString());
			l_total_18= int.Parse(dt.Rows[1][20].ToString())+int.Parse(dt.Rows[2][20].ToString())+int.Parse(dt.Rows[3][20].ToString())+int.Parse(dt.Rows[4][20].ToString())+int.Parse(dt.Rows[5][20].ToString())+int.Parse(dt.Rows[6][20].ToString())+int.Parse(dt.Rows[7][20].ToString())+int.Parse(dt.Rows[8][20].ToString())+int.Parse(dt.Rows[9][20].ToString())+int.Parse(dt.Rows[10][20].ToString());
			l_total_19= int.Parse(dt.Rows[1][21].ToString())+int.Parse(dt.Rows[2][21].ToString())+int.Parse(dt.Rows[3][21].ToString())+int.Parse(dt.Rows[4][21].ToString())+int.Parse(dt.Rows[5][21].ToString())+int.Parse(dt.Rows[6][21].ToString())+int.Parse(dt.Rows[7][21].ToString())+int.Parse(dt.Rows[8][21].ToString())+int.Parse(dt.Rows[9][21].ToString())+int.Parse(dt.Rows[10][21].ToString());
			
			l_total_20= int.Parse(dt.Rows[1][22].ToString())+int.Parse(dt.Rows[2][22].ToString())+int.Parse(dt.Rows[3][22].ToString())+int.Parse(dt.Rows[4][22].ToString())+int.Parse(dt.Rows[5][22].ToString())+int.Parse(dt.Rows[6][22].ToString())+int.Parse(dt.Rows[7][22].ToString())+int.Parse(dt.Rows[8][22].ToString())+int.Parse(dt.Rows[9][22].ToString())+int.Parse(dt.Rows[10][22].ToString());
			l_total_21= int.Parse(dt.Rows[1][23].ToString())+int.Parse(dt.Rows[2][23].ToString())+int.Parse(dt.Rows[3][23].ToString())+int.Parse(dt.Rows[4][23].ToString())+int.Parse(dt.Rows[5][23].ToString())+int.Parse(dt.Rows[6][23].ToString())+int.Parse(dt.Rows[7][23].ToString())+int.Parse(dt.Rows[8][23].ToString())+int.Parse(dt.Rows[9][23].ToString())+int.Parse(dt.Rows[10][23].ToString());
			l_total_22= int.Parse(dt.Rows[1][24].ToString())+int.Parse(dt.Rows[2][24].ToString())+int.Parse(dt.Rows[3][24].ToString())+int.Parse(dt.Rows[4][24].ToString())+int.Parse(dt.Rows[5][24].ToString())+int.Parse(dt.Rows[6][24].ToString())+int.Parse(dt.Rows[7][24].ToString())+int.Parse(dt.Rows[8][24].ToString())+int.Parse(dt.Rows[9][24].ToString())+int.Parse(dt.Rows[10][24].ToString());
			l_total_23= int.Parse(dt.Rows[1][25].ToString())+int.Parse(dt.Rows[2][25].ToString())+int.Parse(dt.Rows[3][25].ToString())+int.Parse(dt.Rows[4][25].ToString())+int.Parse(dt.Rows[5][25].ToString())+int.Parse(dt.Rows[6][25].ToString())+int.Parse(dt.Rows[7][25].ToString())+int.Parse(dt.Rows[8][25].ToString())+int.Parse(dt.Rows[9][25].ToString())+int.Parse(dt.Rows[10][25].ToString());
			l_total_24= int.Parse(dt.Rows[1][26].ToString())+int.Parse(dt.Rows[2][26].ToString())+int.Parse(dt.Rows[3][26].ToString())+int.Parse(dt.Rows[4][26].ToString())+int.Parse(dt.Rows[5][26].ToString())+int.Parse(dt.Rows[6][26].ToString())+int.Parse(dt.Rows[7][26].ToString())+int.Parse(dt.Rows[8][26].ToString())+int.Parse(dt.Rows[9][26].ToString())+int.Parse(dt.Rows[10][26].ToString());
			l_total_25= int.Parse(dt.Rows[1][27].ToString())+int.Parse(dt.Rows[2][27].ToString())+int.Parse(dt.Rows[3][27].ToString())+int.Parse(dt.Rows[4][27].ToString())+int.Parse(dt.Rows[5][27].ToString())+int.Parse(dt.Rows[6][27].ToString())+int.Parse(dt.Rows[7][27].ToString())+int.Parse(dt.Rows[8][27].ToString())+int.Parse(dt.Rows[9][27].ToString())+int.Parse(dt.Rows[10][27].ToString());
			l_total_26= int.Parse(dt.Rows[1][28].ToString())+int.Parse(dt.Rows[2][28].ToString())+int.Parse(dt.Rows[3][28].ToString())+int.Parse(dt.Rows[4][28].ToString())+int.Parse(dt.Rows[5][28].ToString())+int.Parse(dt.Rows[6][28].ToString())+int.Parse(dt.Rows[7][28].ToString())+int.Parse(dt.Rows[8][28].ToString())+int.Parse(dt.Rows[9][28].ToString())+int.Parse(dt.Rows[10][28].ToString());
			l_total_27= int.Parse(dt.Rows[1][29].ToString())+int.Parse(dt.Rows[2][29].ToString())+int.Parse(dt.Rows[3][29].ToString())+int.Parse(dt.Rows[4][29].ToString())+int.Parse(dt.Rows[5][29].ToString())+int.Parse(dt.Rows[6][29].ToString())+int.Parse(dt.Rows[7][29].ToString())+int.Parse(dt.Rows[8][29].ToString())+int.Parse(dt.Rows[9][29].ToString())+int.Parse(dt.Rows[10][29].ToString());
			l_total_28= int.Parse(dt.Rows[1][30].ToString())+int.Parse(dt.Rows[2][30].ToString())+int.Parse(dt.Rows[3][30].ToString())+int.Parse(dt.Rows[4][30].ToString())+int.Parse(dt.Rows[5][30].ToString())+int.Parse(dt.Rows[6][30].ToString())+int.Parse(dt.Rows[7][30].ToString())+int.Parse(dt.Rows[8][30].ToString())+int.Parse(dt.Rows[9][30].ToString())+int.Parse(dt.Rows[10][30].ToString());
			l_total_29= int.Parse(dt.Rows[1][31].ToString())+int.Parse(dt.Rows[2][31].ToString())+int.Parse(dt.Rows[3][31].ToString())+int.Parse(dt.Rows[4][31].ToString())+int.Parse(dt.Rows[5][31].ToString())+int.Parse(dt.Rows[6][31].ToString())+int.Parse(dt.Rows[7][31].ToString())+int.Parse(dt.Rows[8][31].ToString())+int.Parse(dt.Rows[9][31].ToString())+int.Parse(dt.Rows[10][31].ToString());
			l_total_30= int.Parse(dt.Rows[1][32].ToString())+int.Parse(dt.Rows[2][32].ToString())+int.Parse(dt.Rows[3][32].ToString())+int.Parse(dt.Rows[4][32].ToString())+int.Parse(dt.Rows[5][32].ToString())+int.Parse(dt.Rows[6][32].ToString())+int.Parse(dt.Rows[7][32].ToString())+int.Parse(dt.Rows[8][32].ToString())+int.Parse(dt.Rows[9][32].ToString())+int.Parse(dt.Rows[10][32].ToString());
			l_total_31= int.Parse(dt.Rows[1][33].ToString())+int.Parse(dt.Rows[2][33].ToString())+int.Parse(dt.Rows[3][33].ToString())+int.Parse(dt.Rows[4][33].ToString())+int.Parse(dt.Rows[5][33].ToString())+int.Parse(dt.Rows[6][33].ToString())+int.Parse(dt.Rows[7][33].ToString())+int.Parse(dt.Rows[8][33].ToString())+int.Parse(dt.Rows[9][33].ToString())+int.Parse(dt.Rows[10][33].ToString());

			exSheet.Cells[16, 4].Value  =l_total_1;
			exSheet.Cells[16, 5].Value  =l_total_2;
			exSheet.Cells[16, 6].Value  =l_total_3;
			exSheet.Cells[16, 7].Value  =l_total_4;
			exSheet.Cells[16, 8].Value  =l_total_5;
			exSheet.Cells[16, 9].Value  =l_total_6;
			exSheet.Cells[16, 10].Value =l_total_7;
			exSheet.Cells[16, 11].Value =l_total_8;
			exSheet.Cells[16, 12].Value =l_total_9;
			exSheet.Cells[16, 13].Value =l_total_10;
			exSheet.Cells[16, 14].Value =l_total_11;
			exSheet.Cells[16, 15].Value =l_total_12;
			exSheet.Cells[16, 16].Value =l_total_13;
			exSheet.Cells[16, 17].Value =l_total_14;
			exSheet.Cells[16, 18].Value =l_total_15;
			exSheet.Cells[16, 19].Value =l_total_16;
			exSheet.Cells[16, 20].Value =l_total_17;
			exSheet.Cells[16, 21].Value =l_total_18;
			exSheet.Cells[16, 22].Value =l_total_19;
			exSheet.Cells[16, 23].Value =l_total_20;
			exSheet.Cells[16, 24].Value =l_total_21;
			exSheet.Cells[16, 25].Value =l_total_22;
			exSheet.Cells[16, 26].Value =l_total_23;
			exSheet.Cells[16, 27].Value =l_total_24;
			exSheet.Cells[16, 28].Value =l_total_25;
			exSheet.Cells[16, 29].Value =l_total_26;
			exSheet.Cells[16, 30].Value =l_total_27;
			exSheet.Cells[16, 31].Value =l_total_28;
			exSheet.Cells[16, 32].Value =l_total_29;
			exSheet.Cells[16, 33].Value =l_total_30;
			exSheet.Cells[16, 34].Value =l_total_31;
			//----------------end--grid--number 1------------------------
			
			//thu'
			exSheet.Cells[19, 1].Value = dtNote.Rows[0][0].ToString();
			exSheet.Cells[19, 2].Value = dtNote.Rows[0][1].ToString();
			exSheet.Cells[19, 4].Value = dtNote.Rows[0][2].ToString();
            exSheet.Cells[19, 5].Value = dtNote.Rows[0][3].ToString();
			exSheet.Cells[19, 6].Value = dtNote.Rows[0][4].ToString();
			exSheet.Cells[19, 7].Value = dtNote.Rows[0][5].ToString();
			exSheet.Cells[19, 8].Value = dtNote.Rows[0][6].ToString();
			exSheet.Cells[19, 9].Value = dtNote.Rows[0][7].ToString();
			exSheet.Cells[19, 10].Value = dtNote.Rows[0][8].ToString();
			exSheet.Cells[19, 11].Value = dtNote.Rows[0][9].ToString();
			exSheet.Cells[19 ,12].Value = dtNote.Rows[0][10].ToString();
			exSheet.Cells[19, 13].Value = dtNote.Rows[0][11].ToString();
			exSheet.Cells[19, 14].Value = dtNote.Rows[0][12].ToString();
			exSheet.Cells[19, 15].Value = dtNote.Rows[0][13].ToString();
			exSheet.Cells[19, 16].Value = dtNote.Rows[0][14].ToString();
			exSheet.Cells[19, 17].Value = dtNote.Rows[0][15].ToString();
			exSheet.Cells[19, 18].Value = dtNote.Rows[0][16].ToString();
			exSheet.Cells[19, 19].Value = dtNote.Rows[0][17].ToString();
			exSheet.Cells[19, 20].Value = dtNote.Rows[0][18].ToString();
			exSheet.Cells[19, 21].Value = dtNote.Rows[0][19].ToString();
			exSheet.Cells[19, 22].Value = dtNote.Rows[0][20].ToString();
			exSheet.Cells[19, 23].Value = dtNote.Rows[0][21].ToString();
			exSheet.Cells[19, 24].Value = dtNote.Rows[0][22].ToString();
			exSheet.Cells[19, 25].Value = dtNote.Rows[0][23].ToString();
			exSheet.Cells[19, 26].Value = dtNote.Rows[0][24].ToString();
			exSheet.Cells[19, 27].Value = dtNote.Rows[0][25].ToString();
			exSheet.Cells[19, 28].Value = dtNote.Rows[0][26].ToString();
			exSheet.Cells[19, 29].Value = dtNote.Rows[0][27].ToString();
			exSheet.Cells[19, 30].Value = dtNote.Rows[0][28].ToString();
			exSheet.Cells[19, 31].Value = dtNote.Rows[0][29].ToString();
			exSheet.Cells[19, 32].Value = dtNote.Rows[0][30].ToString();
			exSheet.Cells[19, 33].Value = dtNote.Rows[0][31].ToString();
			exSheet.Cells[19, 34].Value = dtNote.Rows[0][32].ToString();
			//
			exSheet.Cells[20, 1].Value = dtNote.Rows[1][0].ToString();
			exSheet.Cells[20, 2].Value = dtNote.Rows[1][1].ToString();
			exSheet.Cells[20, 4].Value = int.Parse(dtNote.Rows[1][2].ToString());
            exSheet.Cells[20, 5].Value = int.Parse(dtNote.Rows[1][3].ToString());
			exSheet.Cells[20, 6].Value = int.Parse(dtNote.Rows[1][4].ToString());
			exSheet.Cells[20, 7].Value = int.Parse(dtNote.Rows[1][5].ToString());
			exSheet.Cells[20, 8].Value = int.Parse(dtNote.Rows[1][6].ToString());
			exSheet.Cells[20, 9].Value = int.Parse(dtNote.Rows[1][7].ToString());
			exSheet.Cells[20, 10].Value = int.Parse(dtNote.Rows[1][8].ToString());
			exSheet.Cells[20,11].Value = int.Parse(dtNote.Rows[1][9].ToString());
			exSheet.Cells[20 ,12].Value = int.Parse(dtNote.Rows[1][10].ToString());
			exSheet.Cells[20, 13].Value = int.Parse(dtNote.Rows[1][11].ToString());
			exSheet.Cells[20, 14].Value = int.Parse(dtNote.Rows[1][12].ToString());
			exSheet.Cells[20, 15].Value = int.Parse(dtNote.Rows[1][13].ToString());
			exSheet.Cells[20, 16].Value = int.Parse(dtNote.Rows[1][14].ToString());
			exSheet.Cells[20, 17].Value = int.Parse(dtNote.Rows[1][15].ToString());
			exSheet.Cells[20, 18].Value = int.Parse(dtNote.Rows[1][16].ToString());
			exSheet.Cells[20, 19].Value = int.Parse(dtNote.Rows[1][17].ToString());
			exSheet.Cells[20, 20].Value = int.Parse(dtNote.Rows[1][18].ToString());
			exSheet.Cells[20, 21].Value = int.Parse(dtNote.Rows[1][19].ToString());
			exSheet.Cells[20, 22].Value = int.Parse(dtNote.Rows[1][20].ToString());
			exSheet.Cells[20, 23].Value = int.Parse(dtNote.Rows[1][21].ToString());
			exSheet.Cells[20, 24].Value = int.Parse(dtNote.Rows[1][22].ToString());
			exSheet.Cells[20, 25].Value = int.Parse(dtNote.Rows[1][23].ToString());
			exSheet.Cells[20, 26].Value = int.Parse(dtNote.Rows[1][24].ToString());
			exSheet.Cells[20, 27].Value = int.Parse(dtNote.Rows[1][25].ToString());
			exSheet.Cells[20, 28].Value = int.Parse(dtNote.Rows[1][26].ToString());
			exSheet.Cells[20, 29].Value = int.Parse(dtNote.Rows[1][27].ToString());
			exSheet.Cells[20, 30].Value = int.Parse(dtNote.Rows[1][28].ToString());
			exSheet.Cells[20, 31].Value = int.Parse(dtNote.Rows[1][29].ToString());
			exSheet.Cells[20, 32].Value = int.Parse(dtNote.Rows[1][30].ToString());
			exSheet.Cells[20, 33].Value = int.Parse(dtNote.Rows[1][31].ToString());
			exSheet.Cells[20, 34].Value = int.Parse(dtNote.Rows[1][32].ToString());
			//
			exSheet.Cells[21, 1].Value = dtNote.Rows[2][0].ToString();
			exSheet.Cells[21, 2].Value = dtNote.Rows[2][1].ToString();
			exSheet.Cells[21, 4].Value = int.Parse(dtNote.Rows[2][2].ToString());
            exSheet.Cells[21, 5].Value = int.Parse(dtNote.Rows[2][3].ToString());
			exSheet.Cells[21, 6].Value = int.Parse(dtNote.Rows[2][4].ToString());
			exSheet.Cells[21, 7].Value = int.Parse(dtNote.Rows[2][5].ToString());
			exSheet.Cells[21, 8].Value = int.Parse(dtNote.Rows[2][6].ToString());
			exSheet.Cells[21, 9].Value = int.Parse(dtNote.Rows[2][7].ToString());
			exSheet.Cells[21, 10].Value = int.Parse(dtNote.Rows[2][8].ToString());
			exSheet.Cells[21, 11].Value = int.Parse(dtNote.Rows[2][9].ToString());
			exSheet.Cells[21,12].Value = int.Parse(dtNote.Rows[2][10].ToString());
			exSheet.Cells[21, 13].Value = int.Parse(dtNote.Rows[2][11].ToString());
			exSheet.Cells[21, 14].Value = int.Parse(dtNote.Rows[2][12].ToString());
			exSheet.Cells[21, 15].Value = int.Parse(dtNote.Rows[2][13].ToString());
			exSheet.Cells[21, 16].Value = int.Parse(dtNote.Rows[2][14].ToString());
			exSheet.Cells[21, 17].Value = int.Parse(dtNote.Rows[2][15].ToString());
			exSheet.Cells[21, 18].Value = int.Parse(dtNote.Rows[2][16].ToString());
			exSheet.Cells[21, 19].Value = int.Parse(dtNote.Rows[2][17].ToString());
			exSheet.Cells[21, 20].Value = int.Parse(dtNote.Rows[2][18].ToString());
			exSheet.Cells[21, 21].Value = int.Parse(dtNote.Rows[2][19].ToString());
			exSheet.Cells[21, 22].Value = int.Parse(dtNote.Rows[2][20].ToString());
			exSheet.Cells[21, 23].Value = int.Parse(dtNote.Rows[2][21].ToString());
			exSheet.Cells[21, 24].Value = int.Parse(dtNote.Rows[2][22].ToString());
			exSheet.Cells[21, 25].Value = int.Parse(dtNote.Rows[2][23].ToString());
			exSheet.Cells[21, 26].Value = int.Parse(dtNote.Rows[2][24].ToString());
			exSheet.Cells[21, 27].Value = int.Parse(dtNote.Rows[2][25].ToString());
			exSheet.Cells[21, 28].Value = int.Parse(dtNote.Rows[2][26].ToString());
			exSheet.Cells[21, 29].Value = int.Parse(dtNote.Rows[2][27].ToString());
			exSheet.Cells[21, 30].Value = int.Parse(dtNote.Rows[2][28].ToString());
			exSheet.Cells[21, 31].Value = int.Parse(dtNote.Rows[2][29].ToString());
			exSheet.Cells[21, 32].Value = int.Parse(dtNote.Rows[2][30].ToString());
			exSheet.Cells[21, 33].Value = int.Parse(dtNote.Rows[2][31].ToString());
			exSheet.Cells[21, 34].Value = int.Parse(dtNote.Rows[2][32].ToString());
			//
			exSheet.Cells[22, 1].Value = dtNote.Rows[3][0].ToString();
			exSheet.Cells[22, 2].Value = dtNote.Rows[3][1].ToString();
			exSheet.Cells[22, 4].Value = int.Parse(dtNote.Rows[3][2].ToString());
            exSheet.Cells[22, 5].Value = int.Parse(dtNote.Rows[3][3].ToString());
			exSheet.Cells[22, 6].Value = int.Parse(dtNote.Rows[3][4].ToString());
			exSheet.Cells[22, 7].Value = int.Parse(dtNote.Rows[3][5].ToString());
			exSheet.Cells[22, 8].Value = int.Parse(dtNote.Rows[3][6].ToString());
			exSheet.Cells[22, 9].Value = int.Parse(dtNote.Rows[3][7].ToString());
			exSheet.Cells[22,10].Value = int.Parse(dtNote.Rows[3][8].ToString());
			exSheet.Cells[22,11].Value = int.Parse(dtNote.Rows[3][9].ToString());
			exSheet.Cells[22, 12].Value = int.Parse(dtNote.Rows[3][10].ToString());
			exSheet.Cells[22, 13].Value = int.Parse(dtNote.Rows[3][11].ToString());
			exSheet.Cells[22, 14].Value = int.Parse(dtNote.Rows[3][12].ToString());
			exSheet.Cells[22, 15].Value = int.Parse(dtNote.Rows[3][13].ToString());
			exSheet.Cells[22, 16].Value = int.Parse(dtNote.Rows[3][14].ToString());
			exSheet.Cells[22, 17].Value = int.Parse(dtNote.Rows[3][15].ToString());
			exSheet.Cells[22, 18].Value = int.Parse(dtNote.Rows[3][16].ToString());
			exSheet.Cells[22, 19].Value = int.Parse(dtNote.Rows[3][17].ToString());
			exSheet.Cells[22, 20].Value = int.Parse(dtNote.Rows[3][18].ToString());
			exSheet.Cells[22, 21].Value = int.Parse(dtNote.Rows[3][19].ToString());
			exSheet.Cells[22, 22].Value = int.Parse(dtNote.Rows[3][20].ToString());
			exSheet.Cells[22, 23].Value = int.Parse(dtNote.Rows[3][21].ToString());
			exSheet.Cells[22, 24].Value = int.Parse(dtNote.Rows[3][22].ToString());
			exSheet.Cells[22, 25].Value = int.Parse(dtNote.Rows[3][23].ToString());
			exSheet.Cells[22, 26].Value = int.Parse(dtNote.Rows[3][24].ToString());
			exSheet.Cells[22, 27].Value = int.Parse(dtNote.Rows[3][25].ToString());
			exSheet.Cells[22, 28].Value = int.Parse(dtNote.Rows[3][26].ToString());
			exSheet.Cells[22, 29].Value = int.Parse(dtNote.Rows[3][27].ToString());
			exSheet.Cells[22, 30].Value = int.Parse(dtNote.Rows[3][28].ToString());
			exSheet.Cells[22, 31].Value = int.Parse(dtNote.Rows[3][29].ToString());
			exSheet.Cells[22, 32].Value = int.Parse(dtNote.Rows[3][30].ToString());
			exSheet.Cells[22, 33].Value = int.Parse(dtNote.Rows[3][31].ToString());
			exSheet.Cells[22, 34].Value = int.Parse(dtNote.Rows[3][32].ToString());
			//
			exSheet.Cells[23, 1].Value = dtNote.Rows[4][0].ToString();
			exSheet.Cells[23, 2].Value = dtNote.Rows[4][1].ToString();
			exSheet.Cells[23, 4].Value = int.Parse(dtNote.Rows[4][2].ToString());
            exSheet.Cells[23, 5].Value = int.Parse(dtNote.Rows[4][3].ToString());
			exSheet.Cells[23, 6].Value = int.Parse(dtNote.Rows[4][4].ToString());
			exSheet.Cells[23, 7].Value = int.Parse(dtNote.Rows[4][5].ToString());
			exSheet.Cells[23, 8].Value = int.Parse(dtNote.Rows[4][6].ToString());
			exSheet.Cells[23, 9].Value = int.Parse(dtNote.Rows[4][7].ToString());
			exSheet.Cells[23, 10].Value = int.Parse(dtNote.Rows[4][8].ToString());
			exSheet.Cells[23,11].Value = int.Parse(dtNote.Rows[4][9].ToString());
			exSheet.Cells[23 ,12].Value = int.Parse(dtNote.Rows[4][10].ToString());
			exSheet.Cells[23, 13].Value = int.Parse(dtNote.Rows[4][11].ToString());
			exSheet.Cells[23, 14].Value = int.Parse(dtNote.Rows[4][12].ToString());
			exSheet.Cells[23, 15].Value = int.Parse(dtNote.Rows[4][13].ToString());
			exSheet.Cells[23, 16].Value = int.Parse(dtNote.Rows[4][14].ToString());
			exSheet.Cells[23, 17].Value = int.Parse(dtNote.Rows[4][15].ToString());
			exSheet.Cells[23, 18].Value = int.Parse(dtNote.Rows[4][16].ToString());
			exSheet.Cells[23, 19].Value = int.Parse(dtNote.Rows[4][17].ToString());
			exSheet.Cells[23, 20].Value = int.Parse(dtNote.Rows[4][18].ToString());
			exSheet.Cells[23, 21].Value = int.Parse(dtNote.Rows[4][19].ToString());
			exSheet.Cells[23, 22].Value = int.Parse(dtNote.Rows[4][20].ToString());
			exSheet.Cells[23, 23].Value = int.Parse(dtNote.Rows[4][21].ToString());
			exSheet.Cells[23, 24].Value = int.Parse(dtNote.Rows[4][22].ToString());
			exSheet.Cells[23, 25].Value = int.Parse(dtNote.Rows[4][23].ToString());
			exSheet.Cells[23, 26].Value = int.Parse(dtNote.Rows[4][24].ToString());
			exSheet.Cells[23, 27].Value = int.Parse(dtNote.Rows[4][25].ToString());
			exSheet.Cells[23, 28].Value = int.Parse(dtNote.Rows[4][26].ToString());
			exSheet.Cells[23, 29].Value = int.Parse(dtNote.Rows[4][27].ToString());
			exSheet.Cells[23, 30].Value = int.Parse(dtNote.Rows[4][28].ToString());
			exSheet.Cells[23, 31].Value = int.Parse(dtNote.Rows[4][29].ToString());
			exSheet.Cells[23, 32].Value = int.Parse(dtNote.Rows[4][30].ToString());
			exSheet.Cells[23, 33].Value = int.Parse(dtNote.Rows[4][31].ToString());
			exSheet.Cells[23, 34].Value = int.Parse(dtNote.Rows[4][32].ToString());
			//
			exSheet.Cells[24, 1].Value = dtNote.Rows[5][0].ToString();
			exSheet.Cells[24, 2].Value = dtNote.Rows[5][1].ToString();
			exSheet.Cells[24, 4].Value = int.Parse(dtNote.Rows[5][2].ToString());
            exSheet.Cells[24, 5].Value = int.Parse(dtNote.Rows[5][3].ToString());
			exSheet.Cells[24, 6].Value = int.Parse(dtNote.Rows[5][4].ToString());
			exSheet.Cells[24, 7].Value = int.Parse(dtNote.Rows[5][5].ToString());
			exSheet.Cells[24, 8].Value = int.Parse(dtNote.Rows[5][6].ToString());
			exSheet.Cells[24, 9].Value = int.Parse(dtNote.Rows[5][7].ToString());
			exSheet.Cells[24, 10].Value = int.Parse(dtNote.Rows[5][8].ToString());
			exSheet.Cells[24,11].Value = int.Parse(dtNote.Rows[5][9].ToString());
			exSheet.Cells[24, 12].Value = int.Parse(dtNote.Rows[5][10].ToString());
			exSheet.Cells[24, 13].Value = int.Parse(dtNote.Rows[5][11].ToString());
			exSheet.Cells[24, 14].Value = int.Parse(dtNote.Rows[5][12].ToString());
			exSheet.Cells[24, 15].Value = int.Parse(dtNote.Rows[5][13].ToString());
			exSheet.Cells[24, 16].Value = int.Parse(dtNote.Rows[5][14].ToString());
			exSheet.Cells[24, 17].Value = int.Parse(dtNote.Rows[5][15].ToString());
			exSheet.Cells[24, 18].Value = int.Parse(dtNote.Rows[5][16].ToString());
			exSheet.Cells[24, 19].Value = int.Parse(dtNote.Rows[5][17].ToString());
			exSheet.Cells[24, 20].Value = int.Parse(dtNote.Rows[5][18].ToString());
			exSheet.Cells[24, 21].Value = int.Parse(dtNote.Rows[5][19].ToString());
			exSheet.Cells[24, 22].Value = int.Parse(dtNote.Rows[5][20].ToString());
			exSheet.Cells[24, 23].Value = int.Parse(dtNote.Rows[5][21].ToString());
			exSheet.Cells[24, 24].Value = int.Parse(dtNote.Rows[5][22].ToString());
			exSheet.Cells[24, 25].Value = int.Parse(dtNote.Rows[5][23].ToString());
			exSheet.Cells[24, 26].Value = int.Parse(dtNote.Rows[5][24].ToString());
			exSheet.Cells[24, 27].Value = int.Parse(dtNote.Rows[5][25].ToString());
			exSheet.Cells[24, 28].Value = int.Parse(dtNote.Rows[5][26].ToString());
			exSheet.Cells[24, 29].Value = int.Parse(dtNote.Rows[5][27].ToString());
			exSheet.Cells[24, 30].Value = int.Parse(dtNote.Rows[5][28].ToString());
			exSheet.Cells[24, 31].Value = int.Parse(dtNote.Rows[5][29].ToString());
			exSheet.Cells[24, 32].Value = int.Parse(dtNote.Rows[5][30].ToString());
			exSheet.Cells[24, 33].Value = int.Parse(dtNote.Rows[5][31].ToString());
			exSheet.Cells[24, 34].Value = int.Parse(dtNote.Rows[5][32].ToString());
			//
			exSheet.Cells[25, 1].Value = dtNote.Rows[6][0].ToString();
			exSheet.Cells[25, 2].Value = dtNote.Rows[6][1].ToString();
			exSheet.Cells[25, 4].Value = int.Parse(dtNote.Rows[6][2].ToString());
            exSheet.Cells[25, 5].Value = int.Parse(dtNote.Rows[6][3].ToString());
			exSheet.Cells[25, 6].Value = int.Parse(dtNote.Rows[6][4].ToString());
			exSheet.Cells[25, 7].Value = int.Parse(dtNote.Rows[6][5].ToString());
			exSheet.Cells[25, 8].Value = int.Parse(dtNote.Rows[6][6].ToString());
			exSheet.Cells[25, 9].Value = int.Parse(dtNote.Rows[6][7].ToString());
			exSheet.Cells[25, 10].Value = int.Parse(dtNote.Rows[6][8].ToString());
			exSheet.Cells[25,11].Value = int.Parse(dtNote.Rows[6][9].ToString());
			exSheet.Cells[25, 12].Value = int.Parse(dtNote.Rows[6][10].ToString());
			exSheet.Cells[25, 13].Value = int.Parse(dtNote.Rows[6][11].ToString());
			exSheet.Cells[25, 14].Value = int.Parse(dtNote.Rows[6][12].ToString());
			exSheet.Cells[25, 15].Value = int.Parse(dtNote.Rows[6][13].ToString());
			exSheet.Cells[25, 16].Value = int.Parse(dtNote.Rows[6][14].ToString());
			exSheet.Cells[25, 17].Value = int.Parse(dtNote.Rows[6][15].ToString());
			exSheet.Cells[25, 18].Value = int.Parse(dtNote.Rows[6][16].ToString());
			exSheet.Cells[25, 19].Value = int.Parse(dtNote.Rows[6][17].ToString());
			exSheet.Cells[25, 20].Value = int.Parse(dtNote.Rows[6][18].ToString());
			exSheet.Cells[25, 21].Value = int.Parse(dtNote.Rows[6][19].ToString());
			exSheet.Cells[25, 22].Value = int.Parse(dtNote.Rows[6][20].ToString());
			exSheet.Cells[25, 23].Value = int.Parse(dtNote.Rows[6][21].ToString());
			exSheet.Cells[25, 24].Value = int.Parse(dtNote.Rows[6][22].ToString());
			exSheet.Cells[25, 25].Value = int.Parse(dtNote.Rows[6][23].ToString());
			exSheet.Cells[25, 26].Value = int.Parse(dtNote.Rows[6][24].ToString());
			exSheet.Cells[25, 27].Value = int.Parse(dtNote.Rows[6][25].ToString());
			exSheet.Cells[25, 28].Value = int.Parse(dtNote.Rows[6][26].ToString());
			exSheet.Cells[25, 29].Value = int.Parse(dtNote.Rows[6][27].ToString());
			exSheet.Cells[25, 30].Value = int.Parse(dtNote.Rows[6][28].ToString());
			exSheet.Cells[25, 31].Value = int.Parse(dtNote.Rows[6][29].ToString());
			exSheet.Cells[25, 32].Value = int.Parse(dtNote.Rows[6][30].ToString());
			exSheet.Cells[25, 33].Value = int.Parse(dtNote.Rows[6][31].ToString());
			exSheet.Cells[25, 34].Value = int.Parse(dtNote.Rows[6][32].ToString());
			
        }

        //----------------------
        ////end-set-----DataBind--in---Master---

        
        //set date title of year
        //exSheet.Cells[2, 1].Value = "Income Statement Year" + " " + l_year;

        //set data to detail.
        // loop detail not percent
		
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