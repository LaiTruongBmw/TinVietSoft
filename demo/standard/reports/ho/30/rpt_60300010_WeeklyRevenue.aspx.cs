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

public partial class rpt_60300010_WeeklyRevenue : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

         CtlLib.SetUser(Session["APP_DBUSER"].ToString());
        string l_date = Request["p_Month"];
        string l_week = Request["p_week"];


        string TemplateFile = "rpt_60300010_WeeklyRevenue.xls";
        string TempFile = "../../../../system/temp/rpt_60300010_WeeklyRevenue_" + Session["User_ID"].ToString() + ".xls";
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

        para = "'" + l_date + "','" + l_week + "'";
        dt = CtlLib.TableReadOpenCursor("rpt_60300010_rev_weekly_usd", para);
        //-----header---  
        exSheet.Cells[2, 3].Value = dt.Rows[0]["months"].ToString();
        exSheet.Cells[2, 6].Value = l_week;

        exSheet.Cells[4, 4].Value =  dt.Rows[0]["mon_d"].ToString();
        exSheet.Cells[4, 6].Value =  dt.Rows[0]["tue_d"].ToString();
        exSheet.Cells[4, 8].Value =  dt.Rows[0]["wed_d"].ToString();
        exSheet.Cells[4, 10].Value = dt.Rows[0]["thu_d"].ToString();
        exSheet.Cells[4, 12].Value = dt.Rows[0]["fri_d"].ToString();
        exSheet.Cells[4, 14].Value = dt.Rows[0]["sat_d"].ToString();
        exSheet.Cells[4, 16].Value = dt.Rows[0]["sun_d"].ToString();
        //---end--header---
        //--set-----DataBind--in---Master---
        

        
            exSheet.Cells[7, 4].Value = float.Parse(dt.Rows[0]["d8"].ToString());
            exSheet.Cells[7, 5].Value = float.Parse(dt.Rows[0]["d1"].ToString());
            exSheet.Cells[7, 6].Value = float.Parse(dt.Rows[0]["d9"].ToString());
            exSheet.Cells[7, 7].Value = float.Parse(dt.Rows[0]["d2"].ToString());
            exSheet.Cells[7, 8].Value = float.Parse(dt.Rows[0]["d10"].ToString());
            exSheet.Cells[7, 9].Value = float.Parse(dt.Rows[0]["d3"].ToString());
            exSheet.Cells[7, 10].Value = float.Parse(dt.Rows[0]["d11"].ToString());
            exSheet.Cells[7, 11].Value = float.Parse(dt.Rows[0]["d4"].ToString());
            exSheet.Cells[7, 12].Value = float.Parse(dt.Rows[0]["d12"].ToString());
            exSheet.Cells[7, 13].Value = float.Parse(dt.Rows[0]["d5"].ToString());
            exSheet.Cells[7, 14].Value = float.Parse(dt.Rows[0]["d13"].ToString());
            exSheet.Cells[7, 15].Value = float.Parse(dt.Rows[0]["d6"].ToString());
            exSheet.Cells[7, 16].Value = float.Parse(dt.Rows[0]["d14"].ToString());
            exSheet.Cells[7, 17].Value = float.Parse(dt.Rows[0]["d7"].ToString());
            exSheet.Cells[7, 18].Value = float.Parse(dt.Rows[0]["sum_guest_qty"].ToString());
            exSheet.Cells[7, 19].Value = float.Parse(dt.Rows[0]["mm_sum"].ToString());
            exSheet.Cells[7, 20].Value = float.Parse(dt.Rows[0]["avg_guest_qty"].ToString());
            exSheet.Cells[7, 21].Value = float.Parse(dt.Rows[0]["avg_amount_qty"].ToString());

            exSheet.Cells[8, 4].Value  = float.Parse(dt.Rows[1]["d8"].ToString());
            exSheet.Cells[8, 5].Value  = float.Parse(dt.Rows[1]["d1"].ToString());
            exSheet.Cells[8, 6].Value  = float.Parse(dt.Rows[1]["d9"].ToString());
            exSheet.Cells[8, 7].Value  = float.Parse(dt.Rows[1]["d2"].ToString());
            exSheet.Cells[8, 8].Value  = float.Parse(dt.Rows[1]["d10"].ToString());
            exSheet.Cells[8, 9].Value  = float.Parse(dt.Rows[1]["d3"].ToString());
            exSheet.Cells[8, 10].Value = float.Parse(dt.Rows[1]["d11"].ToString());
            exSheet.Cells[8, 11].Value = float.Parse(dt.Rows[1]["d4"].ToString());
            exSheet.Cells[8, 12].Value = float.Parse(dt.Rows[1]["d12"].ToString());
            exSheet.Cells[8, 13].Value = float.Parse(dt.Rows[1]["d5"].ToString());
            exSheet.Cells[8, 14].Value = float.Parse(dt.Rows[1]["d13"].ToString());
            exSheet.Cells[8, 15].Value = float.Parse(dt.Rows[1]["d6"].ToString());
            exSheet.Cells[8, 16].Value = float.Parse(dt.Rows[1]["d14"].ToString());
            exSheet.Cells[8, 17].Value = float.Parse(dt.Rows[1]["d7"].ToString());
            exSheet.Cells[8, 18].Value = float.Parse(dt.Rows[1]["sum_guest_qty"].ToString());
            exSheet.Cells[8, 19].Value = float.Parse(dt.Rows[1]["mm_sum"].ToString());
            exSheet.Cells[8, 20].Value = float.Parse(dt.Rows[1]["avg_guest_qty"].ToString());
            exSheet.Cells[8, 21].Value = float.Parse(dt.Rows[1]["avg_amount_qty"].ToString());

            exSheet.Cells[9, 4].Value = float.Parse(dt.Rows[2]["d8"].ToString());
            exSheet.Cells[9, 5].Value = float.Parse(dt.Rows[2]["d1"].ToString());
            exSheet.Cells[9, 6].Value = float.Parse(dt.Rows[2]["d9"].ToString());
            exSheet.Cells[9, 7].Value = float.Parse(dt.Rows[2]["d2"].ToString());
            exSheet.Cells[9, 8].Value = float.Parse(dt.Rows[2]["d10"].ToString());
            exSheet.Cells[9, 9].Value = float.Parse(dt.Rows[2]["d3"].ToString());
            exSheet.Cells[9, 10].Value = float.Parse(dt.Rows[2]["d11"].ToString());
            exSheet.Cells[9, 11].Value = float.Parse(dt.Rows[2]["d4"].ToString());
            exSheet.Cells[9, 12].Value = float.Parse(dt.Rows[2]["d12"].ToString());
            exSheet.Cells[9, 13].Value = float.Parse(dt.Rows[2]["d5"].ToString());
            exSheet.Cells[9, 14].Value = float.Parse(dt.Rows[2]["d13"].ToString());
            exSheet.Cells[9, 15].Value = float.Parse(dt.Rows[2]["d6"].ToString());
            exSheet.Cells[9, 16].Value = float.Parse(dt.Rows[2]["d14"].ToString());
            exSheet.Cells[9, 17].Value = float.Parse(dt.Rows[2]["d7"].ToString());
            exSheet.Cells[9, 18].Value = float.Parse(dt.Rows[2]["sum_guest_qty"].ToString());
            exSheet.Cells[9, 19].Value = float.Parse(dt.Rows[2]["mm_sum"].ToString());
            exSheet.Cells[9, 20].Value = float.Parse(dt.Rows[2]["avg_guest_qty"].ToString());
            exSheet.Cells[9, 21].Value = float.Parse(dt.Rows[2]["avg_amount_qty"].ToString());

            exSheet.Cells[10, 4].Value = float.Parse(dt.Rows[3]["d8"].ToString());
            exSheet.Cells[10, 5].Value = float.Parse(dt.Rows[3]["d1"].ToString());
            exSheet.Cells[10, 6].Value = float.Parse(dt.Rows[3]["d9"].ToString());
            exSheet.Cells[10, 7].Value = float.Parse(dt.Rows[3]["d2"].ToString());
            exSheet.Cells[10, 8].Value = float.Parse(dt.Rows[3]["d10"].ToString());
            exSheet.Cells[10, 9].Value = float.Parse(dt.Rows[3]["d3"].ToString());
            exSheet.Cells[10, 10].Value = float.Parse(dt.Rows[3]["d11"].ToString());
            exSheet.Cells[10, 11].Value = float.Parse(dt.Rows[3]["d4"].ToString());
            exSheet.Cells[10, 12].Value = float.Parse(dt.Rows[3]["d12"].ToString());
            exSheet.Cells[10, 13].Value = float.Parse(dt.Rows[3]["d5"].ToString());
            exSheet.Cells[10, 14].Value = float.Parse(dt.Rows[3]["d13"].ToString());
            exSheet.Cells[10, 15].Value = float.Parse(dt.Rows[3]["d6"].ToString());
            exSheet.Cells[10, 16].Value = float.Parse(dt.Rows[3]["d14"].ToString());
            exSheet.Cells[10, 17].Value = float.Parse(dt.Rows[3]["d7"].ToString());
            exSheet.Cells[10, 18].Value = float.Parse(dt.Rows[3]["sum_guest_qty"].ToString());
            exSheet.Cells[10, 19].Value = float.Parse(dt.Rows[3]["mm_sum"].ToString());
            exSheet.Cells[10, 20].Value = float.Parse(dt.Rows[3]["avg_guest_qty"].ToString());
            exSheet.Cells[10, 21].Value = float.Parse(dt.Rows[3]["avg_amount_qty"].ToString());

            exSheet.Cells[11, 4].Value = float.Parse(dt.Rows[4]["d8"].ToString());
            exSheet.Cells[11, 5].Value = float.Parse(dt.Rows[4]["d1"].ToString());
            exSheet.Cells[11, 6].Value = float.Parse(dt.Rows[4]["d9"].ToString());
            exSheet.Cells[11, 7].Value = float.Parse(dt.Rows[4]["d2"].ToString());
            exSheet.Cells[11, 8].Value = float.Parse(dt.Rows[4]["d10"].ToString());
            exSheet.Cells[11, 9].Value = float.Parse(dt.Rows[4]["d3"].ToString());
            exSheet.Cells[11, 10].Value = float.Parse(dt.Rows[4]["d11"].ToString());
            exSheet.Cells[11, 11].Value = float.Parse(dt.Rows[4]["d4"].ToString());
            exSheet.Cells[11, 12].Value = float.Parse(dt.Rows[4]["d12"].ToString());
            exSheet.Cells[11, 13].Value = float.Parse(dt.Rows[4]["d5"].ToString());
            exSheet.Cells[11, 14].Value = float.Parse(dt.Rows[4]["d13"].ToString());
            exSheet.Cells[11, 15].Value = float.Parse(dt.Rows[4]["d6"].ToString());
            exSheet.Cells[11, 16].Value = float.Parse(dt.Rows[4]["d14"].ToString());
            exSheet.Cells[11, 17].Value = float.Parse(dt.Rows[4]["d7"].ToString());
            exSheet.Cells[11, 18].Value = float.Parse(dt.Rows[4]["sum_guest_qty"].ToString());
            exSheet.Cells[11, 19].Value = float.Parse(dt.Rows[4]["mm_sum"].ToString());
            exSheet.Cells[11, 20].Value = float.Parse(dt.Rows[4]["avg_guest_qty"].ToString());
            exSheet.Cells[11, 21].Value = float.Parse(dt.Rows[4]["avg_amount_qty"].ToString());

            exSheet.Cells[12, 4].Value = float.Parse(dt.Rows[5]["d8"].ToString());
            exSheet.Cells[12, 5].Value = float.Parse(dt.Rows[5]["d1"].ToString());
            exSheet.Cells[12, 6].Value = float.Parse(dt.Rows[5]["d9"].ToString());
            exSheet.Cells[12, 7].Value = float.Parse(dt.Rows[5]["d2"].ToString());
            exSheet.Cells[12, 8].Value = float.Parse(dt.Rows[5]["d10"].ToString());
            exSheet.Cells[12, 9].Value = float.Parse(dt.Rows[5]["d3"].ToString());
            exSheet.Cells[12, 10].Value = float.Parse(dt.Rows[5]["d11"].ToString());
            exSheet.Cells[12, 11].Value = float.Parse(dt.Rows[5]["d4"].ToString());
            exSheet.Cells[12, 12].Value = float.Parse(dt.Rows[5]["d12"].ToString());
            exSheet.Cells[12, 13].Value = float.Parse(dt.Rows[5]["d5"].ToString());
            exSheet.Cells[12, 14].Value = float.Parse(dt.Rows[5]["d13"].ToString());
            exSheet.Cells[12, 15].Value = float.Parse(dt.Rows[5]["d6"].ToString());
            exSheet.Cells[12, 16].Value = float.Parse(dt.Rows[5]["d14"].ToString());
            exSheet.Cells[12, 17].Value = float.Parse(dt.Rows[5]["d7"].ToString());
            exSheet.Cells[12, 18].Value = float.Parse(dt.Rows[5]["sum_guest_qty"].ToString());
            exSheet.Cells[12, 19].Value = float.Parse(dt.Rows[5]["mm_sum"].ToString());
            exSheet.Cells[12, 20].Value = float.Parse(dt.Rows[5]["avg_guest_qty"].ToString());
            exSheet.Cells[12, 21].Value = float.Parse(dt.Rows[5]["avg_amount_qty"].ToString());

            exSheet.Cells[13, 4].Value = float.Parse(dt.Rows[6]["d8"].ToString());
            exSheet.Cells[13, 5].Value = float.Parse(dt.Rows[6]["d1"].ToString());
            exSheet.Cells[13, 6].Value = float.Parse(dt.Rows[6]["d9"].ToString());
            exSheet.Cells[13, 7].Value = float.Parse(dt.Rows[6]["d2"].ToString());
            exSheet.Cells[13, 8].Value = float.Parse(dt.Rows[6]["d10"].ToString());
            exSheet.Cells[13, 9].Value = float.Parse(dt.Rows[6]["d3"].ToString());
            exSheet.Cells[13, 10].Value = float.Parse(dt.Rows[6]["d11"].ToString());
            exSheet.Cells[13, 11].Value = float.Parse(dt.Rows[6]["d4"].ToString());
            exSheet.Cells[13, 12].Value = float.Parse(dt.Rows[6]["d12"].ToString());
            exSheet.Cells[13, 13].Value = float.Parse(dt.Rows[6]["d5"].ToString());
            exSheet.Cells[13, 14].Value = float.Parse(dt.Rows[6]["d13"].ToString());
            exSheet.Cells[13, 15].Value = float.Parse(dt.Rows[6]["d6"].ToString());
            exSheet.Cells[13, 16].Value = float.Parse(dt.Rows[6]["d14"].ToString());
            exSheet.Cells[13, 17].Value = float.Parse(dt.Rows[6]["d7"].ToString());
            exSheet.Cells[13, 18].Value = float.Parse(dt.Rows[6]["sum_guest_qty"].ToString());
            exSheet.Cells[13, 19].Value = float.Parse(dt.Rows[6]["mm_sum"].ToString());
            exSheet.Cells[13, 20].Value = float.Parse(dt.Rows[6]["avg_guest_qty"].ToString());
            exSheet.Cells[13, 21].Value = float.Parse(dt.Rows[6]["avg_amount_qty"].ToString());

            exSheet.Cells[14, 4].Value = float.Parse(dt.Rows[7]["d8"].ToString());
            exSheet.Cells[14, 5].Value = float.Parse(dt.Rows[7]["d1"].ToString());
            exSheet.Cells[14, 6].Value = float.Parse(dt.Rows[7]["d9"].ToString());
            exSheet.Cells[14, 7].Value = float.Parse(dt.Rows[7]["d2"].ToString());
            exSheet.Cells[14, 8].Value = float.Parse(dt.Rows[7]["d10"].ToString());
            exSheet.Cells[14, 9].Value = float.Parse(dt.Rows[7]["d3"].ToString());
            exSheet.Cells[14, 10].Value = float.Parse(dt.Rows[7]["d11"].ToString());
            exSheet.Cells[14, 11].Value = float.Parse(dt.Rows[7]["d4"].ToString());
            exSheet.Cells[14, 12].Value = float.Parse(dt.Rows[7]["d12"].ToString());
            exSheet.Cells[14, 13].Value = float.Parse(dt.Rows[7]["d5"].ToString());
            exSheet.Cells[14, 14].Value = float.Parse(dt.Rows[7]["d13"].ToString());
            exSheet.Cells[14, 15].Value = float.Parse(dt.Rows[7]["d6"].ToString());
            exSheet.Cells[14, 16].Value = float.Parse(dt.Rows[7]["d14"].ToString());
            exSheet.Cells[14, 17].Value = float.Parse(dt.Rows[7]["d7"].ToString());
            exSheet.Cells[14, 18].Value = float.Parse(dt.Rows[7]["sum_guest_qty"].ToString());
            exSheet.Cells[14, 19].Value = float.Parse(dt.Rows[7]["mm_sum"].ToString());
            exSheet.Cells[14, 20].Value = float.Parse(dt.Rows[7]["avg_guest_qty"].ToString());
            exSheet.Cells[14, 21].Value = float.Parse(dt.Rows[7]["avg_amount_qty"].ToString());

            exSheet.Cells[15, 4].Value = float.Parse(dt.Rows[8]["d8"].ToString());
            exSheet.Cells[15, 5].Value = float.Parse(dt.Rows[8]["d1"].ToString());
            exSheet.Cells[15, 6].Value = float.Parse(dt.Rows[8]["d9"].ToString());
            exSheet.Cells[15, 7].Value = float.Parse(dt.Rows[8]["d2"].ToString());
            exSheet.Cells[15, 8].Value = float.Parse(dt.Rows[8]["d10"].ToString());
            exSheet.Cells[15, 9].Value = float.Parse(dt.Rows[8]["d3"].ToString());
            exSheet.Cells[15, 10].Value = float.Parse(dt.Rows[8]["d11"].ToString());
            exSheet.Cells[15, 11].Value = float.Parse(dt.Rows[8]["d4"].ToString());
            exSheet.Cells[15, 12].Value = float.Parse(dt.Rows[8]["d12"].ToString());
            exSheet.Cells[15, 13].Value = float.Parse(dt.Rows[8]["d5"].ToString());
            exSheet.Cells[15, 14].Value = float.Parse(dt.Rows[8]["d13"].ToString());
            exSheet.Cells[15, 15].Value = float.Parse(dt.Rows[8]["d6"].ToString());
            exSheet.Cells[15, 16].Value = float.Parse(dt.Rows[8]["d14"].ToString());
            exSheet.Cells[15, 17].Value = float.Parse(dt.Rows[8]["d7"].ToString());
            exSheet.Cells[15, 18].Value = float.Parse(dt.Rows[8]["sum_guest_qty"].ToString());
            exSheet.Cells[15, 19].Value = float.Parse(dt.Rows[8]["mm_sum"].ToString());
            exSheet.Cells[15, 20].Value = float.Parse(dt.Rows[8]["avg_guest_qty"].ToString());
            exSheet.Cells[15, 21].Value = float.Parse(dt.Rows[8]["avg_amount_qty"].ToString());

            exSheet.Cells[16, 4].Value = float.Parse(dt.Rows[9]["d8"].ToString());
            exSheet.Cells[16, 5].Value = float.Parse(dt.Rows[9]["d1"].ToString());
            exSheet.Cells[16, 6].Value = float.Parse(dt.Rows[9]["d9"].ToString());
            exSheet.Cells[16, 7].Value = float.Parse(dt.Rows[9]["d2"].ToString());
            exSheet.Cells[16, 8].Value = float.Parse(dt.Rows[9]["d10"].ToString());
            exSheet.Cells[16, 9].Value = float.Parse(dt.Rows[9]["d3"].ToString());
            exSheet.Cells[16, 10].Value = float.Parse(dt.Rows[9]["d11"].ToString());
            exSheet.Cells[16, 11].Value = float.Parse(dt.Rows[9]["d4"].ToString());
            exSheet.Cells[16, 12].Value = float.Parse(dt.Rows[9]["d12"].ToString());
            exSheet.Cells[16, 13].Value = float.Parse(dt.Rows[9]["d5"].ToString());
            exSheet.Cells[16, 14].Value = float.Parse(dt.Rows[9]["d13"].ToString());
            exSheet.Cells[16, 15].Value = float.Parse(dt.Rows[9]["d6"].ToString());
            exSheet.Cells[16, 16].Value = float.Parse(dt.Rows[9]["d14"].ToString());
            exSheet.Cells[16, 17].Value = float.Parse(dt.Rows[9]["d7"].ToString());
            exSheet.Cells[16, 18].Value = float.Parse(dt.Rows[9]["sum_guest_qty"].ToString());
            exSheet.Cells[16, 19].Value = float.Parse(dt.Rows[9]["mm_sum"].ToString());
            exSheet.Cells[16, 20].Value = float.Parse(dt.Rows[9]["avg_guest_qty"].ToString());
            exSheet.Cells[16, 21].Value = float.Parse(dt.Rows[9]["avg_amount_qty"].ToString());

            exSheet.Cells[17, 4].Value = float.Parse(dt.Rows[10]["d8"].ToString());
            exSheet.Cells[17, 5].Value = float.Parse(dt.Rows[10]["d1"].ToString());
            exSheet.Cells[17, 6].Value = float.Parse(dt.Rows[10]["d9"].ToString());
            exSheet.Cells[17, 7].Value = float.Parse(dt.Rows[10]["d2"].ToString());
            exSheet.Cells[17, 8].Value = float.Parse(dt.Rows[10]["d10"].ToString());
            exSheet.Cells[17, 9].Value = float.Parse(dt.Rows[10]["d3"].ToString());
            exSheet.Cells[17, 10].Value = float.Parse(dt.Rows[10]["d11"].ToString());
            exSheet.Cells[17, 11].Value = float.Parse(dt.Rows[10]["d4"].ToString());
            exSheet.Cells[17, 12].Value = float.Parse(dt.Rows[10]["d12"].ToString());
            exSheet.Cells[17, 13].Value = float.Parse(dt.Rows[10]["d5"].ToString());
            exSheet.Cells[17, 14].Value = float.Parse(dt.Rows[10]["d13"].ToString());
            exSheet.Cells[17, 15].Value = float.Parse(dt.Rows[10]["d6"].ToString());
            exSheet.Cells[17, 16].Value = float.Parse(dt.Rows[10]["d14"].ToString());
            exSheet.Cells[17, 17].Value = float.Parse(dt.Rows[10]["d7"].ToString());
            exSheet.Cells[17, 18].Value = float.Parse(dt.Rows[10]["sum_guest_qty"].ToString());
            exSheet.Cells[17, 19].Value = float.Parse(dt.Rows[10]["mm_sum"].ToString());
            exSheet.Cells[17, 20].Value = float.Parse(dt.Rows[10]["avg_guest_qty"].ToString());
            exSheet.Cells[17, 21].Value = float.Parse(dt.Rows[10]["avg_amount_qty"].ToString());

            exSheet.Cells[18, 4].Value = float.Parse(dt.Rows[11]["d8"].ToString());
            exSheet.Cells[18, 5].Value = float.Parse(dt.Rows[11]["d1"].ToString());
            exSheet.Cells[18, 6].Value = float.Parse(dt.Rows[11]["d9"].ToString());
            exSheet.Cells[18, 7].Value = float.Parse(dt.Rows[11]["d2"].ToString());
            exSheet.Cells[18, 8].Value = float.Parse(dt.Rows[11]["d10"].ToString());
            exSheet.Cells[18, 9].Value = float.Parse(dt.Rows[11]["d3"].ToString());
            exSheet.Cells[18, 10].Value = float.Parse(dt.Rows[11]["d11"].ToString());
            exSheet.Cells[18, 11].Value = float.Parse(dt.Rows[11]["d4"].ToString());
            exSheet.Cells[18, 12].Value = float.Parse(dt.Rows[11]["d12"].ToString());
            exSheet.Cells[18, 13].Value = float.Parse(dt.Rows[11]["d5"].ToString());
            exSheet.Cells[18, 14].Value = float.Parse(dt.Rows[11]["d13"].ToString());
            exSheet.Cells[18, 15].Value = float.Parse(dt.Rows[11]["d6"].ToString());
            exSheet.Cells[18, 16].Value = float.Parse(dt.Rows[11]["d14"].ToString());
            exSheet.Cells[18, 17].Value = float.Parse(dt.Rows[11]["d7"].ToString());
            exSheet.Cells[18, 18].Value = float.Parse(dt.Rows[11]["sum_guest_qty"].ToString());
            exSheet.Cells[18, 19].Value = float.Parse(dt.Rows[11]["mm_sum"].ToString());
            exSheet.Cells[18, 20].Value = float.Parse(dt.Rows[11]["avg_guest_qty"].ToString());
            exSheet.Cells[18, 21].Value = float.Parse(dt.Rows[11]["avg_amount_qty"].ToString());

            exSheet.Cells[19, 4].Value = float.Parse(dt.Rows[12]["d8"].ToString());
            exSheet.Cells[19, 5].Value = float.Parse(dt.Rows[12]["d1"].ToString());
            exSheet.Cells[19, 6].Value = float.Parse(dt.Rows[12]["d9"].ToString());
            exSheet.Cells[19, 7].Value = float.Parse(dt.Rows[12]["d2"].ToString());
            exSheet.Cells[19, 8].Value = float.Parse(dt.Rows[12]["d10"].ToString());
            exSheet.Cells[19, 9].Value = float.Parse(dt.Rows[12]["d3"].ToString());
            exSheet.Cells[19, 10].Value = float.Parse(dt.Rows[12]["d11"].ToString());
            exSheet.Cells[19, 11].Value = float.Parse(dt.Rows[12]["d4"].ToString());
            exSheet.Cells[19, 12].Value = float.Parse(dt.Rows[12]["d12"].ToString());
            exSheet.Cells[19, 13].Value = float.Parse(dt.Rows[12]["d5"].ToString());
            exSheet.Cells[19, 14].Value = float.Parse(dt.Rows[12]["d13"].ToString());
            exSheet.Cells[19, 15].Value = float.Parse(dt.Rows[12]["d6"].ToString());
            exSheet.Cells[19, 16].Value = float.Parse(dt.Rows[12]["d14"].ToString());
            exSheet.Cells[19, 17].Value = float.Parse(dt.Rows[12]["d7"].ToString());
            exSheet.Cells[19, 18].Value = float.Parse(dt.Rows[12]["sum_guest_qty"].ToString());
            exSheet.Cells[19, 19].Value = float.Parse(dt.Rows[12]["mm_sum"].ToString());
            exSheet.Cells[19, 20].Value = float.Parse(dt.Rows[12]["avg_guest_qty"].ToString());
            exSheet.Cells[19, 21].Value = float.Parse(dt.Rows[12]["avg_amount_qty"].ToString());

            exSheet.Cells[20, 4].Value = float.Parse(dt.Rows[13]["d8"].ToString());
            exSheet.Cells[20, 5].Value = float.Parse(dt.Rows[13]["d1"].ToString());
            exSheet.Cells[20, 6].Value = float.Parse(dt.Rows[13]["d9"].ToString());
            exSheet.Cells[20, 7].Value = float.Parse(dt.Rows[13]["d2"].ToString());
            exSheet.Cells[20, 8].Value = float.Parse(dt.Rows[13]["d10"].ToString());
            exSheet.Cells[20, 9].Value = float.Parse(dt.Rows[13]["d3"].ToString());
            exSheet.Cells[20, 10].Value = float.Parse(dt.Rows[13]["d11"].ToString());
            exSheet.Cells[20, 11].Value = float.Parse(dt.Rows[13]["d4"].ToString());
            exSheet.Cells[20, 12].Value = float.Parse(dt.Rows[13]["d12"].ToString());
            exSheet.Cells[20, 13].Value = float.Parse(dt.Rows[13]["d5"].ToString());
            exSheet.Cells[20, 14].Value = float.Parse(dt.Rows[13]["d13"].ToString());
            exSheet.Cells[20, 15].Value = float.Parse(dt.Rows[13]["d6"].ToString());
            exSheet.Cells[20, 16].Value = float.Parse(dt.Rows[13]["d14"].ToString());
            exSheet.Cells[20, 17].Value = float.Parse(dt.Rows[13]["d7"].ToString());
            exSheet.Cells[20, 18].Value = float.Parse(dt.Rows[13]["sum_guest_qty"].ToString());
            exSheet.Cells[20, 19].Value = float.Parse(dt.Rows[13]["mm_sum"].ToString());
            exSheet.Cells[20, 20].Value = float.Parse(dt.Rows[13]["avg_guest_qty"].ToString());
            exSheet.Cells[20, 21].Value = float.Parse(dt.Rows[13]["avg_amount_qty"].ToString());

            exSheet.Cells[21, 4].Value = float.Parse(dt.Rows[14]["d8"].ToString());
            exSheet.Cells[21, 5].Value = float.Parse(dt.Rows[14]["d1"].ToString());
            exSheet.Cells[21, 6].Value = float.Parse(dt.Rows[14]["d9"].ToString());
            exSheet.Cells[21, 7].Value = float.Parse(dt.Rows[14]["d2"].ToString());
            exSheet.Cells[21, 8].Value = float.Parse(dt.Rows[14]["d10"].ToString());
            exSheet.Cells[21, 9].Value = float.Parse(dt.Rows[14]["d3"].ToString());
            exSheet.Cells[21, 10].Value = float.Parse(dt.Rows[14]["d11"].ToString());
            exSheet.Cells[21, 11].Value = float.Parse(dt.Rows[14]["d4"].ToString());
            exSheet.Cells[21, 12].Value = float.Parse(dt.Rows[14]["d12"].ToString());
            exSheet.Cells[21, 13].Value = float.Parse(dt.Rows[14]["d5"].ToString());
            exSheet.Cells[21, 14].Value = float.Parse(dt.Rows[14]["d13"].ToString());
            exSheet.Cells[21, 15].Value = float.Parse(dt.Rows[14]["d6"].ToString());
            exSheet.Cells[21, 16].Value = float.Parse(dt.Rows[14]["d14"].ToString());
            exSheet.Cells[21, 17].Value = float.Parse(dt.Rows[14]["d7"].ToString());
            exSheet.Cells[21, 18].Value = float.Parse(dt.Rows[14]["sum_guest_qty"].ToString());
            exSheet.Cells[21, 19].Value = float.Parse(dt.Rows[14]["mm_sum"].ToString());
            exSheet.Cells[21, 20].Value = float.Parse(dt.Rows[14]["avg_guest_qty"].ToString());
            exSheet.Cells[21, 21].Value = float.Parse(dt.Rows[14]["avg_amount_qty"].ToString());

            exSheet.Cells[22, 4].Value = float.Parse(dt.Rows[15]["d8"].ToString());
            exSheet.Cells[22, 5].Value = float.Parse(dt.Rows[15]["d1"].ToString());
            exSheet.Cells[22, 6].Value = float.Parse(dt.Rows[15]["d9"].ToString());
            exSheet.Cells[22, 7].Value = float.Parse(dt.Rows[15]["d2"].ToString());
            exSheet.Cells[22, 8].Value = float.Parse(dt.Rows[15]["d10"].ToString());
            exSheet.Cells[22, 9].Value = float.Parse(dt.Rows[15]["d3"].ToString());
            exSheet.Cells[22, 10].Value = float.Parse(dt.Rows[15]["d11"].ToString());
            exSheet.Cells[22, 11].Value = float.Parse(dt.Rows[15]["d4"].ToString());
            exSheet.Cells[22, 12].Value = float.Parse(dt.Rows[15]["d12"].ToString());
            exSheet.Cells[22, 13].Value = float.Parse(dt.Rows[15]["d5"].ToString());
            exSheet.Cells[22, 14].Value = float.Parse(dt.Rows[15]["d13"].ToString());
            exSheet.Cells[22, 15].Value = float.Parse(dt.Rows[15]["d6"].ToString());
            exSheet.Cells[22, 16].Value = float.Parse(dt.Rows[15]["d14"].ToString());
            exSheet.Cells[22, 17].Value = float.Parse(dt.Rows[15]["d7"].ToString());
            exSheet.Cells[22, 18].Value = float.Parse(dt.Rows[15]["sum_guest_qty"].ToString());
            exSheet.Cells[22, 19].Value = float.Parse(dt.Rows[15]["mm_sum"].ToString());
            exSheet.Cells[22, 20].Value = float.Parse(dt.Rows[15]["avg_guest_qty"].ToString());
            exSheet.Cells[22, 21].Value = float.Parse(dt.Rows[15]["avg_amount_qty"].ToString());

            exSheet.Cells[23, 4].Value = float.Parse(dt.Rows[16]["d8"].ToString());
            exSheet.Cells[23, 5].Value = float.Parse(dt.Rows[16]["d1"].ToString());
            exSheet.Cells[23, 6].Value = float.Parse(dt.Rows[16]["d9"].ToString());
            exSheet.Cells[23, 7].Value = float.Parse(dt.Rows[16]["d2"].ToString());
            exSheet.Cells[23, 8].Value = float.Parse(dt.Rows[16]["d10"].ToString());
            exSheet.Cells[23, 9].Value = float.Parse(dt.Rows[16]["d3"].ToString());
            exSheet.Cells[23, 10].Value = float.Parse(dt.Rows[16]["d11"].ToString());
            exSheet.Cells[23, 11].Value = float.Parse(dt.Rows[16]["d4"].ToString());
            exSheet.Cells[23, 12].Value = float.Parse(dt.Rows[16]["d12"].ToString());
            exSheet.Cells[23, 13].Value = float.Parse(dt.Rows[16]["d5"].ToString());
            exSheet.Cells[23, 14].Value = float.Parse(dt.Rows[16]["d13"].ToString());
            exSheet.Cells[23, 15].Value = float.Parse(dt.Rows[16]["d6"].ToString());
            exSheet.Cells[23, 16].Value = float.Parse(dt.Rows[16]["d14"].ToString());
            exSheet.Cells[23, 17].Value = float.Parse(dt.Rows[16]["d7"].ToString());
            exSheet.Cells[23, 18].Value = float.Parse(dt.Rows[16]["sum_guest_qty"].ToString());
            exSheet.Cells[23, 19].Value = float.Parse(dt.Rows[16]["mm_sum"].ToString());
            exSheet.Cells[23, 20].Value = float.Parse(dt.Rows[16]["avg_guest_qty"].ToString());
            exSheet.Cells[23, 21].Value = float.Parse(dt.Rows[16]["avg_amount_qty"].ToString());

            exSheet.Cells[24, 4].Value = float.Parse(dt.Rows[17]["d8"].ToString());
            exSheet.Cells[24, 5].Value = float.Parse(dt.Rows[17]["d1"].ToString());
            exSheet.Cells[24, 6].Value = float.Parse(dt.Rows[17]["d9"].ToString());
            exSheet.Cells[24, 7].Value = float.Parse(dt.Rows[17]["d2"].ToString());
            exSheet.Cells[24, 8].Value = float.Parse(dt.Rows[17]["d10"].ToString());
            exSheet.Cells[24, 9].Value = float.Parse(dt.Rows[17]["d3"].ToString());
            exSheet.Cells[24, 10].Value = float.Parse(dt.Rows[17]["d11"].ToString());
            exSheet.Cells[24, 11].Value = float.Parse(dt.Rows[17]["d4"].ToString());
            exSheet.Cells[24, 12].Value = float.Parse(dt.Rows[17]["d12"].ToString());
            exSheet.Cells[24, 13].Value = float.Parse(dt.Rows[17]["d5"].ToString());
            exSheet.Cells[24, 14].Value = float.Parse(dt.Rows[17]["d13"].ToString());
            exSheet.Cells[24, 15].Value = float.Parse(dt.Rows[17]["d6"].ToString());
            exSheet.Cells[24, 16].Value = float.Parse(dt.Rows[17]["d14"].ToString());
            exSheet.Cells[24, 17].Value = float.Parse(dt.Rows[17]["d7"].ToString());
            exSheet.Cells[24, 18].Value = float.Parse(dt.Rows[17]["sum_guest_qty"].ToString());
            exSheet.Cells[24, 19].Value = float.Parse(dt.Rows[17]["mm_sum"].ToString());
            exSheet.Cells[24, 20].Value = float.Parse(dt.Rows[17]["avg_guest_qty"].ToString());
            exSheet.Cells[24, 21].Value = float.Parse(dt.Rows[17]["avg_amount_qty"].ToString());

            exSheet.Cells[25, 4].Value = float.Parse(dt.Rows[18]["d8"].ToString());
            exSheet.Cells[25, 5].Value = float.Parse(dt.Rows[18]["d1"].ToString());
            exSheet.Cells[25, 6].Value = float.Parse(dt.Rows[18]["d9"].ToString());
            exSheet.Cells[25, 7].Value = float.Parse(dt.Rows[18]["d2"].ToString());
            exSheet.Cells[25, 8].Value = float.Parse(dt.Rows[18]["d10"].ToString());
            exSheet.Cells[25, 9].Value = float.Parse(dt.Rows[18]["d3"].ToString());
            exSheet.Cells[25, 10].Value = float.Parse(dt.Rows[18]["d11"].ToString());
            exSheet.Cells[25, 11].Value = float.Parse(dt.Rows[18]["d4"].ToString());
            exSheet.Cells[25, 12].Value = float.Parse(dt.Rows[18]["d12"].ToString());
            exSheet.Cells[25, 13].Value = float.Parse(dt.Rows[18]["d5"].ToString());
            exSheet.Cells[25, 14].Value = float.Parse(dt.Rows[18]["d13"].ToString());
            exSheet.Cells[25, 15].Value =  float.Parse(dt.Rows[18]["d6"].ToString());
            exSheet.Cells[25, 16].Value = float.Parse(dt.Rows[18]["d14"].ToString());
            exSheet.Cells[25, 17].Value = float.Parse(dt.Rows[18]["d7"].ToString());
            exSheet.Cells[25, 18].Value = float.Parse(dt.Rows[18]["sum_guest_qty"].ToString());
            exSheet.Cells[25, 19].Value = float.Parse(dt.Rows[18]["mm_sum"].ToString());
            exSheet.Cells[25, 20].Value = float.Parse(dt.Rows[18]["avg_guest_qty"].ToString());
            exSheet.Cells[25, 21].Value = float.Parse(dt.Rows[18]["avg_amount_qty"].ToString());

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

        //range = exSheet.Range["A1"];
        // hide row A5 
//range.Rows.Hidden = true;

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
