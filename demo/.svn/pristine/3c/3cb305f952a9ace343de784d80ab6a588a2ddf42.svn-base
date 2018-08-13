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

public partial class rpt_dscd00120_ST01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        
         
        string l_wh_pk = Request["p_wh_pk"];
        string l_group_pk = Request["p_group_pk"];
        string l_item = Request["p_item"];
        string l_date = Request["p_date"];

        string TemplateFile = "rpt_dscd00120_ST01.xls";

        string TempFile = "../../../../system/temp/rpt_dscd00120_ST01_" + Session["User_ID"].ToString() + ".xls";
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

        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_dscd00120_ST01_1", l_parameter);
		DataTable dtHead = CtlLib.TableReadOpenCursor("st_lg_rpt_dscd00120_head", l_date);
        //DataTable dtMaster = CtlLib.TableReadOpenCursor("st_lg_rpt_fppr00080_02_2", l_parameter);

        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count * 2 - 1; l_addrow++)
        {
            exSheet.Range["A6"].Rows.EntireRow.Insert();//insert row new of sheet           

        }
		 exSheet.Cells[3, 6  ].Value = dtHead.Rows[0][0].ToString();
		 exSheet.Cells[3, 7 ].Value = dtHead.Rows[0][1].ToString();
		 exSheet.Cells[3, 8  ].Value = dtHead.Rows[0][2].ToString();
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
        // loop detail not percent
        string l_type = "Plan", l_prev_type = "2";
        int l_row = 4;

        int p_total = 0, p_00 = 0, p_01 = 0, p_02 = 0, p_03 = 0, p_04 = 0, p_05 = 0, p_06 = 0, p_07 = 0, p_08 = 0, p_09 = 0, p_10 = 0,
                p_11 = 0, p_12 = 0, p_13 = 0, p_14 = 0, p_15 = 0, p_16 = 0, p_17 = 0, p_18 = 0, p_19 = 0, p_20 = 0,
                p_21 = 0, p_22 = 0, p_23 = 0, p_24 = 0, p_25 = 0, p_26 = 0, p_27 = 0, p_28 = 0, p_29 = 0, p_30 = 0;
        int r_total = 0, r_00 = 0, r_01 = 0, r_02 = 0, r_03 = 0, r_04 = 0, r_05 = 0, r_06 = 0, r_07 = 0, r_08 = 0, r_09 = 0, r_10 = 0,
                r_11 = 0, r_12 = 0, r_13 = 0, r_14 = 0, r_15 = 0, r_16 = 0, r_17 = 0, r_18 = 0, r_19 = 0, r_20 = 0,
                r_21 = 0, r_22 = 0, r_23 = 0, r_24 = 0, r_25 = 0, r_26 = 0, r_27 = 0, r_28 = 0, r_29 = 0, r_30 = 0;

        for (int l_rec = 0; l_rec < dtDetail.Rows.Count; l_rec++)
        {
            if (dtDetail.Rows[l_rec]["search_type"].ToString() == "1")
            {
                p_total += Convert.ToInt32(dtDetail.Rows[l_rec]["total_qty"]);
                p_00 += Convert.ToInt32(dtDetail.Rows[l_rec]["day00_qty"]);
                p_01 += Convert.ToInt32(dtDetail.Rows[l_rec]["day01_qty"]);
                p_02 += Convert.ToInt32(dtDetail.Rows[l_rec]["day02_qty"]);
                p_03 += Convert.ToInt32(dtDetail.Rows[l_rec]["day03_qty"]);
                p_04 += Convert.ToInt32(dtDetail.Rows[l_rec]["day04_qty"]);
                p_05 += Convert.ToInt32(dtDetail.Rows[l_rec]["day05_qty"]);
                p_06 += Convert.ToInt32(dtDetail.Rows[l_rec]["day06_qty"]);
                p_07 += Convert.ToInt32(dtDetail.Rows[l_rec]["day07_qty"]);
                p_08 += Convert.ToInt32(dtDetail.Rows[l_rec]["day08_qty"]);
                p_09 += Convert.ToInt32(dtDetail.Rows[l_rec]["day09_qty"]);
                p_10 += Convert.ToInt32(dtDetail.Rows[l_rec]["day10_qty"]);
                p_11 += Convert.ToInt32(dtDetail.Rows[l_rec]["day11_qty"]);
                p_12 += Convert.ToInt32(dtDetail.Rows[l_rec]["day12_qty"]);
                p_13 += Convert.ToInt32(dtDetail.Rows[l_rec]["day13_qty"]);
                p_14 += Convert.ToInt32(dtDetail.Rows[l_rec]["day14_qty"]);
                p_15 += Convert.ToInt32(dtDetail.Rows[l_rec]["day15_qty"]);
                p_16 += Convert.ToInt32(dtDetail.Rows[l_rec]["day16_qty"]);
                p_17 += Convert.ToInt32(dtDetail.Rows[l_rec]["day17_qty"]);
                p_18 += Convert.ToInt32(dtDetail.Rows[l_rec]["day18_qty"]);
                p_19 += Convert.ToInt32(dtDetail.Rows[l_rec]["day19_qty"]);
                p_20 += Convert.ToInt32(dtDetail.Rows[l_rec]["day20_qty"]);
                p_21 += Convert.ToInt32(dtDetail.Rows[l_rec]["day21_qty"]);
                p_22 += Convert.ToInt32(dtDetail.Rows[l_rec]["day22_qty"]);
                p_23 += Convert.ToInt32(dtDetail.Rows[l_rec]["day23_qty"]);
                p_24 += Convert.ToInt32(dtDetail.Rows[l_rec]["day24_qty"]);
                p_25 += Convert.ToInt32(dtDetail.Rows[l_rec]["day25_qty"]);
                p_26 += Convert.ToInt32(dtDetail.Rows[l_rec]["day26_qty"]);
                p_27 += Convert.ToInt32(dtDetail.Rows[l_rec]["day27_qty"]);
                p_28 += Convert.ToInt32(dtDetail.Rows[l_rec]["day28_qty"]);
                p_29 += Convert.ToInt32(dtDetail.Rows[l_rec]["day29_qty"]);
                p_30 += Convert.ToInt32(dtDetail.Rows[l_rec]["day30_qty"]);
            }
            else
            {
                r_total += Convert.ToInt32(dtDetail.Rows[l_rec]["total_qty"]);
                r_00 += Convert.ToInt32(dtDetail.Rows[l_rec]["day00_qty"]);
                r_01 += Convert.ToInt32(dtDetail.Rows[l_rec]["day01_qty"]);
                r_02 += Convert.ToInt32(dtDetail.Rows[l_rec]["day02_qty"]);
                r_03 += Convert.ToInt32(dtDetail.Rows[l_rec]["day03_qty"]);
                r_04 += Convert.ToInt32(dtDetail.Rows[l_rec]["day04_qty"]);
                r_05 += Convert.ToInt32(dtDetail.Rows[l_rec]["day05_qty"]);
                r_06 += Convert.ToInt32(dtDetail.Rows[l_rec]["day06_qty"]);
                r_07 += Convert.ToInt32(dtDetail.Rows[l_rec]["day07_qty"]);
                r_08 += Convert.ToInt32(dtDetail.Rows[l_rec]["day08_qty"]);
                r_09 += Convert.ToInt32(dtDetail.Rows[l_rec]["day09_qty"]);
                r_10 += Convert.ToInt32(dtDetail.Rows[l_rec]["day10_qty"]);
                r_11 += Convert.ToInt32(dtDetail.Rows[l_rec]["day11_qty"]);
                r_12 += Convert.ToInt32(dtDetail.Rows[l_rec]["day12_qty"]);
                r_13 += Convert.ToInt32(dtDetail.Rows[l_rec]["day13_qty"]);
                r_14 += Convert.ToInt32(dtDetail.Rows[l_rec]["day14_qty"]);
                r_15 += Convert.ToInt32(dtDetail.Rows[l_rec]["day15_qty"]);
                r_16 += Convert.ToInt32(dtDetail.Rows[l_rec]["day16_qty"]);
                r_17 += Convert.ToInt32(dtDetail.Rows[l_rec]["day17_qty"]);
                r_18 += Convert.ToInt32(dtDetail.Rows[l_rec]["day18_qty"]);
                r_19 += Convert.ToInt32(dtDetail.Rows[l_rec]["day19_qty"]);
                r_20 += Convert.ToInt32(dtDetail.Rows[l_rec]["day20_qty"]);
                r_21 += Convert.ToInt32(dtDetail.Rows[l_rec]["day21_qty"]);
                r_22 += Convert.ToInt32(dtDetail.Rows[l_rec]["day22_qty"]);
                r_23 += Convert.ToInt32(dtDetail.Rows[l_rec]["day23_qty"]);
                r_24 += Convert.ToInt32(dtDetail.Rows[l_rec]["day24_qty"]);
                r_25 += Convert.ToInt32(dtDetail.Rows[l_rec]["day25_qty"]);
                r_26 += Convert.ToInt32(dtDetail.Rows[l_rec]["day26_qty"]);
                r_27 += Convert.ToInt32(dtDetail.Rows[l_rec]["day27_qty"]);
                r_28 += Convert.ToInt32(dtDetail.Rows[l_rec]["day28_qty"]);
                r_29 += Convert.ToInt32(dtDetail.Rows[l_rec]["day29_qty"]);
                r_30 += Convert.ToInt32(dtDetail.Rows[l_rec]["day30_qty"]);
            }


            if (l_prev_type == dtDetail.Rows[l_rec]["search_type"].ToString())
            {
                if (dtDetail.Rows[l_rec]["search_type"].ToString() == "1")
                {
                    l_type = "Results";
                    l_prev_type = "2";
                    // exSheet.Range[5, 1, 5, 36].Copy(exSheet.Range[l_row, 1, l_row, 36], XlPasteType.xlPasteAll);
                    exSheet.Cells[l_row, 1].Value = dtDetail.Rows[l_rec - 1]["item_seq"].ToString();
                    // exSheet.Cells[l_row, 2].Value = dtDetail.Rows[l_rec-1]["item_code"].ToString();
                    //  exSheet.Cells[l_row, 3].Value = dtDetail.Rows[l_rec-1]["item_name"].ToString();
                    exSheet.Cells[l_row, 4].Value = l_type;
                    l_row = l_row + 1;
                    l_type = "Plan";

                }
                else
                {
                    l_type = "Plan";
                    l_prev_type = "1";
                    exSheet.Range[4, 1, 5, 36].Copy(exSheet.Range[l_row, 1, l_row + 1, 36], XlPasteType.xlPasteAll);
                    exSheet.Cells[l_row, 1].Value = dtDetail.Rows[l_rec]["item_seq"].ToString();
                    exSheet.Cells[l_row, 2].Value = dtDetail.Rows[l_rec]["item_code"].ToString();
                    exSheet.Cells[l_row, 3].Value = dtDetail.Rows[l_rec]["item_name"].ToString();
                    exSheet.Cells[l_row, 4].Value = l_type;
                    l_row = l_row + 1;
                    l_type = "Results";
                }

            }

            l_prev_type = dtDetail.Rows[l_rec]["search_type"].ToString();
            if (l_prev_type == "1")
            {
                l_type = "Plan";
                exSheet.Range[4, 1, 5, 36].Copy(exSheet.Range[l_row, 1, l_row + 1, 36], XlPasteType.xlPasteAll);
                exSheet.Range[l_row, 1, l_row + 1, 1].Merge();
                exSheet.Range[l_row, 2, l_row + 1, 2].Merge();
                exSheet.Range[l_row, 3, l_row + 1, 3].Merge();
                exSheet.Cells[l_row, 1].Value = dtDetail.Rows[l_rec]["item_seq"].ToString();
                exSheet.Cells[l_row, 2].Value = dtDetail.Rows[l_rec]["item_code"].ToString();
                exSheet.Cells[l_row, 3].Value = dtDetail.Rows[l_rec]["item_name"].ToString();
            }
            else
            {
                l_type = "Results";
                // exSheet.Range[5, 1, 5, 36].Copy(exSheet.Range[l_row, 1, l_row, 36], XlPasteType.xlPasteAll);

            }

            exSheet.Cells[l_row, 4].Value = l_type;
            exSheet.Cells[l_row, 5].Value = dtDetail.Rows[l_rec]["total_qty"];
            exSheet.Cells[l_row, 6].Value = dtDetail.Rows[l_rec]["day00_qty"];
            exSheet.Cells[l_row, 7].Value = dtDetail.Rows[l_rec]["day01_qty"];
            exSheet.Cells[l_row, 8].Value = dtDetail.Rows[l_rec]["day02_qty"];
            exSheet.Cells[l_row, 9].Value = dtDetail.Rows[l_rec]["day03_qty"];
            exSheet.Cells[l_row, 10].Value = dtDetail.Rows[l_rec]["day04_qty"];
            exSheet.Cells[l_row, 11].Value = dtDetail.Rows[l_rec]["day05_qty"];
            exSheet.Cells[l_row, 12].Value = dtDetail.Rows[l_rec]["day06_qty"];
            exSheet.Cells[l_row, 13].Value = dtDetail.Rows[l_rec]["day07_qty"];
            exSheet.Cells[l_row, 14].Value = dtDetail.Rows[l_rec]["day08_qty"];
            exSheet.Cells[l_row, 15].Value = dtDetail.Rows[l_rec]["day09_qty"];
            exSheet.Cells[l_row, 16].Value = dtDetail.Rows[l_rec]["day10_qty"];
            exSheet.Cells[l_row, 17].Value = dtDetail.Rows[l_rec]["day11_qty"];
            exSheet.Cells[l_row, 18].Value = dtDetail.Rows[l_rec]["day12_qty"];
            exSheet.Cells[l_row, 19].Value = dtDetail.Rows[l_rec]["day13_qty"];
            exSheet.Cells[l_row, 20].Value = dtDetail.Rows[l_rec]["day14_qty"];
            exSheet.Cells[l_row, 21].Value = dtDetail.Rows[l_rec]["day15_qty"];
            exSheet.Cells[l_row, 22].Value = dtDetail.Rows[l_rec]["day16_qty"];
            exSheet.Cells[l_row, 23].Value = dtDetail.Rows[l_rec]["day17_qty"];
            exSheet.Cells[l_row, 24].Value = dtDetail.Rows[l_rec]["day18_qty"];
            exSheet.Cells[l_row, 25].Value = dtDetail.Rows[l_rec]["day19_qty"];
            exSheet.Cells[l_row, 26].Value = dtDetail.Rows[l_rec]["day20_qty"];
            exSheet.Cells[l_row, 27].Value = dtDetail.Rows[l_rec]["day21_qty"];
            exSheet.Cells[l_row, 28].Value = dtDetail.Rows[l_rec]["day22_qty"];
            exSheet.Cells[l_row, 29].Value = dtDetail.Rows[l_rec]["day23_qty"];
            exSheet.Cells[l_row, 30].Value = dtDetail.Rows[l_rec]["day24_qty"];
            exSheet.Cells[l_row, 31].Value = dtDetail.Rows[l_rec]["day25_qty"];
            exSheet.Cells[l_row, 32].Value = dtDetail.Rows[l_rec]["day26_qty"];
            exSheet.Cells[l_row, 33].Value = dtDetail.Rows[l_rec]["day27_qty"];
            exSheet.Cells[l_row, 34].Value = dtDetail.Rows[l_rec]["day28_qty"];
            exSheet.Cells[l_row, 35].Value = dtDetail.Rows[l_rec]["day29_qty"];
            exSheet.Cells[l_row, 36].Value = dtDetail.Rows[l_rec]["day30_qty"];

            l_row = l_row + 1;
        }
        /*cuoi cung*/
        if (l_prev_type == "1")
        {
            l_type = "Results";
            l_prev_type = "2";
            //  exSheet.Range[5, 1, 5, 36].Copy(exSheet.Range[l_row, 1, l_row, 36], XlPasteType.xlPasteAll);
            // exSheet.Cells[l_row, 1].Value = dtDetail.Rows[dtDetail.Rows.Count - 1]["item_seq"].ToString();
            // exSheet.Cells[l_row, 2].Value = dtDetail.Rows[dtDetail.Rows.Count - 1]["item_code"].ToString();
            // exSheet.Cells[l_row, 3].Value = dtDetail.Rows[dtDetail.Rows.Count - 1]["item_name"].ToString();
            exSheet.Cells[l_row, 4].Value = l_type;
            l_row = l_row + 1;
        }

        int temp = l_row;
        while (temp < dtDetail.Rows.Count * 2 + 4)
        {
            exSheet.Range["A" + (l_row)].Rows.EntireRow.Delete();
            temp++;
        }
        exSheet.Range[l_row, 1, l_row + 1, 3].Merge();
        exSheet.Cells[l_row, 5].Value = p_total;
        exSheet.Cells[l_row, 6].Value = p_00;
        exSheet.Cells[l_row, 7].Value = p_01;
        exSheet.Cells[l_row, 8].Value = p_02;
        exSheet.Cells[l_row, 9].Value = p_03;
        exSheet.Cells[l_row, 10].Value = p_04;
        exSheet.Cells[l_row, 11].Value = p_05;
        exSheet.Cells[l_row, 12].Value = p_06;
        exSheet.Cells[l_row, 13].Value = p_07;
        exSheet.Cells[l_row, 14].Value = p_08;
        exSheet.Cells[l_row, 15].Value = p_09;
        exSheet.Cells[l_row, 16].Value = p_10;
        exSheet.Cells[l_row, 17].Value = p_11;
        exSheet.Cells[l_row, 18].Value = p_12;
        exSheet.Cells[l_row, 19].Value = p_13;
        exSheet.Cells[l_row, 20].Value = p_14;
        exSheet.Cells[l_row, 21].Value = p_15;
        exSheet.Cells[l_row, 22].Value = p_16;
        exSheet.Cells[l_row, 23].Value = p_17;
        exSheet.Cells[l_row, 24].Value = p_18;
        exSheet.Cells[l_row, 25].Value = p_19;
        exSheet.Cells[l_row, 26].Value = p_20;
        exSheet.Cells[l_row, 27].Value = p_21;
        exSheet.Cells[l_row, 28].Value = p_22;
        exSheet.Cells[l_row, 29].Value = p_23;
        exSheet.Cells[l_row, 30].Value = p_24;
        exSheet.Cells[l_row, 31].Value = p_25;
        exSheet.Cells[l_row, 32].Value = p_26;
        exSheet.Cells[l_row, 33].Value = p_27;
        exSheet.Cells[l_row, 34].Value = p_28;
        exSheet.Cells[l_row, 35].Value = p_29;
        exSheet.Cells[l_row, 36].Value = p_30;
        l_row = l_row + 1;
        exSheet.Cells[l_row, 5].Value = r_total;
        exSheet.Cells[l_row, 6].Value = r_00;
        exSheet.Cells[l_row, 7].Value = r_01;
        exSheet.Cells[l_row, 8].Value = r_02;
        exSheet.Cells[l_row, 9].Value = r_03;
        exSheet.Cells[l_row, 10].Value = r_04;
        exSheet.Cells[l_row, 11].Value = r_05;
        exSheet.Cells[l_row, 12].Value = r_06;
        exSheet.Cells[l_row, 13].Value = r_07;
        exSheet.Cells[l_row, 14].Value = r_08;
        exSheet.Cells[l_row, 15].Value = r_09;
        exSheet.Cells[l_row, 16].Value = r_10;
        exSheet.Cells[l_row, 17].Value = r_11;
        exSheet.Cells[l_row, 18].Value = r_12;
        exSheet.Cells[l_row, 19].Value = r_13;
        exSheet.Cells[l_row, 20].Value = r_14;
        exSheet.Cells[l_row, 21].Value = r_15;
        exSheet.Cells[l_row, 22].Value = r_16;
        exSheet.Cells[l_row, 23].Value = r_17;
        exSheet.Cells[l_row, 24].Value = r_18;
        exSheet.Cells[l_row, 25].Value = r_19;
        exSheet.Cells[l_row, 26].Value = r_20;
        exSheet.Cells[l_row, 27].Value = r_21;
        exSheet.Cells[l_row, 28].Value = r_22;
        exSheet.Cells[l_row, 29].Value = r_23;
        exSheet.Cells[l_row, 30].Value = r_24;
        exSheet.Cells[l_row, 31].Value = r_25;
        exSheet.Cells[l_row, 32].Value = r_26;
        exSheet.Cells[l_row, 33].Value = r_27;
        exSheet.Cells[l_row, 34].Value = r_28;
        exSheet.Cells[l_row, 35].Value = r_29;
        exSheet.Cells[l_row, 36].Value = r_30;
        //**************************************************//
        //****************SHEET 2***********************//
        //***************************************************//
        //Add worksheet
        IWorksheet exSheet2 = exBook.Worksheets[2];
        //bind data to excel file      
        DataTable dtDetail2 = CtlLib.TableReadOpenCursor("st_lg_rpt_dscd00120_ST01_2", l_parameter);
        //DataTable dtMaster = CtlLib.TableReadOpenCursor("st_lg_rpt_fppr00080_02_2", l_parameter);

        for (int l_addrow = 1; l_addrow < dtDetail2.Rows.Count * 2 - 1; l_addrow++)
        {
            exSheet2.Range["A6"].Rows.EntireRow.Insert();//insert row new of sheet           

        }
		 exSheet2.Cells[3, 6  ].Value = dtHead.Rows[0][0].ToString();
		 exSheet2.Cells[3, 7 ].Value = dtHead.Rows[0][1].ToString();
		 exSheet2.Cells[3, 8  ].Value = dtHead.Rows[0][2].ToString();
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
        // loop detail not percent
        l_type = "Plan"; l_prev_type = "2";
        l_row = 4;

        p_total = 0; p_00 = 0; p_01 = 0; p_02 = 0; p_03 = 0; p_04 = 0; p_05 = 0; p_06 = 0; p_07 = 0; p_08 = 0; p_09 = 0; p_10 = 0;
        p_11 = 0; p_12 = 0; p_13 = 0; p_14 = 0; p_15 = 0; p_16 = 0; p_17 = 0; p_18 = 0; p_19 = 0; p_20 = 0;
        p_21 = 0; p_22 = 0; p_23 = 0; p_24 = 0; p_25 = 0; p_26 = 0; p_27 = 0; p_28 = 0; p_29 = 0; p_30 = 0;
        r_total = 0; r_00 = 0; r_01 = 0; r_02 = 0; r_03 = 0; r_04 = 0; r_05 = 0; r_06 = 0; r_07 = 0; r_08 = 0; r_09 = 0; r_10 = 0;
        r_11 = 0; r_12 = 0; r_13 = 0; r_14 = 0; r_15 = 0; r_16 = 0; r_17 = 0; r_18 = 0; r_19 = 0; r_20 = 0;
        r_21 = 0; r_22 = 0; r_23 = 0; r_24 = 0; r_25 = 0; r_26 = 0; r_27 = 0; r_28 = 0; r_29 = 0; r_30 = 0;

        for (int l_rec = 0; l_rec < dtDetail2.Rows.Count; l_rec++)
        {
            if (dtDetail2.Rows[l_rec]["search_type"].ToString() == "1")
            {
                p_total += Convert.ToInt32(dtDetail2.Rows[l_rec]["total_qty"]);
                p_00 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day00_qty"]);
                p_01 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day01_qty"]);
                p_02 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day02_qty"]);
                p_03 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day03_qty"]);
                p_04 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day04_qty"]);
                p_05 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day05_qty"]);
                p_06 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day06_qty"]);
                p_07 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day07_qty"]);
                p_08 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day08_qty"]);
                p_09 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day09_qty"]);
                p_10 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day10_qty"]);
                p_11 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day11_qty"]);
                p_12 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day12_qty"]);
                p_13 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day13_qty"]);
                p_14 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day14_qty"]);
                p_15 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day15_qty"]);
                p_16 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day16_qty"]);
                p_17 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day17_qty"]);
                p_18 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day18_qty"]);
                p_19 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day19_qty"]);
                p_20 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day20_qty"]);
                p_21 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day21_qty"]);
                p_22 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day22_qty"]);
                p_23 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day23_qty"]);
                p_24 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day24_qty"]);
                p_25 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day25_qty"]);
                p_26 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day26_qty"]);
                p_27 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day27_qty"]);
                p_28 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day28_qty"]);
                p_29 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day29_qty"]);
                p_30 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day30_qty"]);
            }
            else
            {
                r_total += Convert.ToInt32(dtDetail2.Rows[l_rec]["total_qty"]);
                r_00 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day00_qty"]);
                r_01 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day01_qty"]);
                r_02 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day02_qty"]);
                r_03 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day03_qty"]);
                r_04 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day04_qty"]);
                r_05 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day05_qty"]);
                r_06 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day06_qty"]);
                r_07 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day07_qty"]);
                r_08 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day08_qty"]);
                r_09 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day09_qty"]);
                r_10 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day10_qty"]);
                r_11 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day11_qty"]);
                r_12 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day12_qty"]);
                r_13 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day13_qty"]);
                r_14 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day14_qty"]);
                r_15 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day15_qty"]);
                r_16 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day16_qty"]);
                r_17 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day17_qty"]);
                r_18 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day18_qty"]);
                r_19 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day19_qty"]);
                r_20 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day20_qty"]);
                r_21 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day21_qty"]);
                r_22 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day22_qty"]);
                r_23 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day23_qty"]);
                r_24 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day24_qty"]);
                r_25 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day25_qty"]);
                r_26 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day26_qty"]);
                r_27 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day27_qty"]);
                r_28 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day28_qty"]);
                r_29 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day29_qty"]);
                r_30 += Convert.ToInt32(dtDetail2.Rows[l_rec]["day30_qty"]);
            }


            if (l_prev_type == dtDetail2.Rows[l_rec]["search_type"].ToString())
            {
                if (dtDetail2.Rows[l_rec]["search_type"].ToString() == "1")
                {
                    l_type = "Results";
                    l_prev_type = "2";
                    // exSheet2.Range[5, 1, 5, 36].Copy(exSheet2.Range[l_row, 1, l_row, 36], XlPasteType.xlPasteAll);
                    exSheet2.Cells[l_row, 1].Value = dtDetail2.Rows[l_rec - 1]["item_seq"].ToString();
                    // exSheet2.Cells[l_row, 2].Value = dtDetail2.Rows[l_rec-1]["item_code"].ToString();
                    //  exSheet2.Cells[l_row, 3].Value = dtDetail2.Rows[l_rec-1]["item_name"].ToString();
                    exSheet2.Cells[l_row, 4].Value = l_type;
                    l_row = l_row + 1;
                    l_type = "Plan";

                }
                else
                {
                    l_type = "Plan";
                    l_prev_type = "1";
                    exSheet2.Range[4, 1, 5, 36].Copy(exSheet2.Range[l_row, 1, l_row + 1, 36], XlPasteType.xlPasteAll);
                    exSheet2.Cells[l_row, 1].Value = dtDetail2.Rows[l_rec]["item_seq"].ToString();
                    exSheet2.Cells[l_row, 2].Value = dtDetail2.Rows[l_rec]["item_code"].ToString();
                    exSheet2.Cells[l_row, 3].Value = dtDetail2.Rows[l_rec]["item_name"].ToString();
                    exSheet2.Cells[l_row, 4].Value = l_type;
                    l_row = l_row + 1;
                    l_type = "Results";
                }

            }

            l_prev_type = dtDetail2.Rows[l_rec]["search_type"].ToString();
            if (l_prev_type == "1")
            {
                l_type = "Plan";
                exSheet2.Range[4, 1, 5, 36].Copy(exSheet2.Range[l_row, 1, l_row + 1, 36], XlPasteType.xlPasteAll);
                exSheet2.Range[l_row, 1, l_row + 1, 1].Merge();
                exSheet2.Range[l_row, 2, l_row + 1, 2].Merge();
                exSheet2.Range[l_row, 3, l_row + 1, 3].Merge();
                exSheet2.Cells[l_row, 1].Value = dtDetail2.Rows[l_rec]["item_seq"].ToString();
                exSheet2.Cells[l_row, 2].Value = dtDetail2.Rows[l_rec]["item_code"].ToString();
                exSheet2.Cells[l_row, 3].Value = dtDetail2.Rows[l_rec]["item_name"].ToString();
            }
            else
            {
                l_type = "Results";
                // exSheet2.Range[5, 1, 5, 36].Copy(exSheet2.Range[l_row, 1, l_row, 36], XlPasteType.xlPasteAll);

            }

            exSheet2.Cells[l_row, 4].Value = l_type;
            exSheet2.Cells[l_row, 5].Value = dtDetail2.Rows[l_rec]["total_qty"];
            exSheet2.Cells[l_row, 6].Value = dtDetail2.Rows[l_rec]["day00_qty"];
            exSheet2.Cells[l_row, 7].Value = dtDetail2.Rows[l_rec]["day01_qty"];
            exSheet2.Cells[l_row, 8].Value = dtDetail2.Rows[l_rec]["day02_qty"];
            exSheet2.Cells[l_row, 9].Value = dtDetail2.Rows[l_rec]["day03_qty"];
            exSheet2.Cells[l_row, 10].Value = dtDetail2.Rows[l_rec]["day04_qty"];
            exSheet2.Cells[l_row, 11].Value = dtDetail2.Rows[l_rec]["day05_qty"];
            exSheet2.Cells[l_row, 12].Value = dtDetail2.Rows[l_rec]["day06_qty"];
            exSheet2.Cells[l_row, 13].Value = dtDetail2.Rows[l_rec]["day07_qty"];
            exSheet2.Cells[l_row, 14].Value = dtDetail2.Rows[l_rec]["day08_qty"];
            exSheet2.Cells[l_row, 15].Value = dtDetail2.Rows[l_rec]["day09_qty"];
            exSheet2.Cells[l_row, 16].Value = dtDetail2.Rows[l_rec]["day10_qty"];
            exSheet2.Cells[l_row, 17].Value = dtDetail2.Rows[l_rec]["day11_qty"];
            exSheet2.Cells[l_row, 18].Value = dtDetail2.Rows[l_rec]["day12_qty"];
            exSheet2.Cells[l_row, 19].Value = dtDetail2.Rows[l_rec]["day13_qty"];
            exSheet2.Cells[l_row, 20].Value = dtDetail2.Rows[l_rec]["day14_qty"];
            exSheet2.Cells[l_row, 21].Value = dtDetail2.Rows[l_rec]["day15_qty"];
            exSheet2.Cells[l_row, 22].Value = dtDetail2.Rows[l_rec]["day16_qty"];
            exSheet2.Cells[l_row, 23].Value = dtDetail2.Rows[l_rec]["day17_qty"];
            exSheet2.Cells[l_row, 24].Value = dtDetail2.Rows[l_rec]["day18_qty"];
            exSheet2.Cells[l_row, 25].Value = dtDetail2.Rows[l_rec]["day19_qty"];
            exSheet2.Cells[l_row, 26].Value = dtDetail2.Rows[l_rec]["day20_qty"];
            exSheet2.Cells[l_row, 27].Value = dtDetail2.Rows[l_rec]["day21_qty"];
            exSheet2.Cells[l_row, 28].Value = dtDetail2.Rows[l_rec]["day22_qty"];
            exSheet2.Cells[l_row, 29].Value = dtDetail2.Rows[l_rec]["day23_qty"];
            exSheet2.Cells[l_row, 30].Value = dtDetail2.Rows[l_rec]["day24_qty"];
            exSheet2.Cells[l_row, 31].Value = dtDetail2.Rows[l_rec]["day25_qty"];
            exSheet2.Cells[l_row, 32].Value = dtDetail2.Rows[l_rec]["day26_qty"];
            exSheet2.Cells[l_row, 33].Value = dtDetail2.Rows[l_rec]["day27_qty"];
            exSheet2.Cells[l_row, 34].Value = dtDetail2.Rows[l_rec]["day28_qty"];
            exSheet2.Cells[l_row, 35].Value = dtDetail2.Rows[l_rec]["day29_qty"];
            exSheet2.Cells[l_row, 36].Value = dtDetail2.Rows[l_rec]["day30_qty"];

            l_row = l_row + 1;
        }
        /*cuoi cung*/
        if (l_prev_type == "1")
        {
            l_type = "Results";
            l_prev_type = "2";
            //  exSheet2.Range[5, 1, 5, 36].Copy(exSheet2.Range[l_row, 1, l_row, 36], XlPasteType.xlPasteAll);
            // exSheet2.Cells[l_row, 1].Value = dtDetail2.Rows[dtDetail2.Rows.Count - 1]["item_seq"].ToString();
            // exSheet2.Cells[l_row, 2].Value = dtDetail2.Rows[dtDetail2.Rows.Count - 1]["item_code"].ToString();
            // exSheet2.Cells[l_row, 3].Value = dtDetail2.Rows[dtDetail2.Rows.Count - 1]["item_name"].ToString();
            exSheet2.Cells[l_row, 4].Value = l_type;
            l_row = l_row + 1;
        }

        temp = l_row;
        while (temp < dtDetail2.Rows.Count * 2 + 4)
        {
            exSheet2.Range["A" + (l_row)].Rows.EntireRow.Delete();
            temp++;
        }
        exSheet2.Range[l_row, 1, l_row + 1, 3].Merge();
        exSheet2.Cells[l_row, 5].Value = p_total;
        exSheet2.Cells[l_row, 6].Value = p_00;
        exSheet2.Cells[l_row, 7].Value = p_01;
        exSheet2.Cells[l_row, 8].Value = p_02;
        exSheet2.Cells[l_row, 9].Value = p_03;
        exSheet2.Cells[l_row, 10].Value = p_04;
        exSheet2.Cells[l_row, 11].Value = p_05;
        exSheet2.Cells[l_row, 12].Value = p_06;
        exSheet2.Cells[l_row, 13].Value = p_07;
        exSheet2.Cells[l_row, 14].Value = p_08;
        exSheet2.Cells[l_row, 15].Value = p_09;
        exSheet2.Cells[l_row, 16].Value = p_10;
        exSheet2.Cells[l_row, 17].Value = p_11;
        exSheet2.Cells[l_row, 18].Value = p_12;
        exSheet2.Cells[l_row, 19].Value = p_13;
        exSheet2.Cells[l_row, 20].Value = p_14;
        exSheet2.Cells[l_row, 21].Value = p_15;
        exSheet2.Cells[l_row, 22].Value = p_16;
        exSheet2.Cells[l_row, 23].Value = p_17;
        exSheet2.Cells[l_row, 24].Value = p_18;
        exSheet2.Cells[l_row, 25].Value = p_19;
        exSheet2.Cells[l_row, 26].Value = p_20;
        exSheet2.Cells[l_row, 27].Value = p_21;
        exSheet2.Cells[l_row, 28].Value = p_22;
        exSheet2.Cells[l_row, 29].Value = p_23;
        exSheet2.Cells[l_row, 30].Value = p_24;
        exSheet2.Cells[l_row, 31].Value = p_25;
        exSheet2.Cells[l_row, 32].Value = p_26;
        exSheet2.Cells[l_row, 33].Value = p_27;
        exSheet2.Cells[l_row, 34].Value = p_28;
        exSheet2.Cells[l_row, 35].Value = p_29;
        exSheet2.Cells[l_row, 36].Value = p_30;
        l_row = l_row + 1;
        exSheet2.Cells[l_row, 5].Value = r_total;
        exSheet2.Cells[l_row, 6].Value = r_00;
        exSheet2.Cells[l_row, 7].Value = r_01;
        exSheet2.Cells[l_row, 8].Value = r_02;
        exSheet2.Cells[l_row, 9].Value = r_03;
        exSheet2.Cells[l_row, 10].Value = r_04;
        exSheet2.Cells[l_row, 11].Value = r_05;
        exSheet2.Cells[l_row, 12].Value = r_06;
        exSheet2.Cells[l_row, 13].Value = r_07;
        exSheet2.Cells[l_row, 14].Value = r_08;
        exSheet2.Cells[l_row, 15].Value = r_09;
        exSheet2.Cells[l_row, 16].Value = r_10;
        exSheet2.Cells[l_row, 17].Value = r_11;
        exSheet2.Cells[l_row, 18].Value = r_12;
        exSheet2.Cells[l_row, 19].Value = r_13;
        exSheet2.Cells[l_row, 20].Value = r_14;
        exSheet2.Cells[l_row, 21].Value = r_15;
        exSheet2.Cells[l_row, 22].Value = r_16;
        exSheet2.Cells[l_row, 23].Value = r_17;
        exSheet2.Cells[l_row, 24].Value = r_18;
        exSheet2.Cells[l_row, 25].Value = r_19;
        exSheet2.Cells[l_row, 26].Value = r_20;
        exSheet2.Cells[l_row, 27].Value = r_21;
        exSheet2.Cells[l_row, 28].Value = r_22;
        exSheet2.Cells[l_row, 29].Value = r_23;
        exSheet2.Cells[l_row, 30].Value = r_24;
        exSheet2.Cells[l_row, 31].Value = r_25;
        exSheet2.Cells[l_row, 32].Value = r_26;
        exSheet2.Cells[l_row, 33].Value = r_27;
        exSheet2.Cells[l_row, 34].Value = r_28;
        exSheet2.Cells[l_row, 35].Value = r_29;
        exSheet2.Cells[l_row, 36].Value = r_30;
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
