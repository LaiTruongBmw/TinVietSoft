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

public partial class rpt_bisc00171_ST02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString()); 
		//CtlLib.SetUser("SALE"); 
		
        string TemplateFile = "rpt_bisc00171_ST02.xls";
        string TempFile = "../../../../system/temp/rpt_bisc00171_ST02_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
         
        string p_lang 			= Request.QueryString["p_lang"];
        string p_wh_name 		= Request.QueryString["p_wh_name"];
        string p_wh_pk 			= Request.QueryString["p_wh_pk"]; 
        string p_item_group_pk 	= Request.QueryString["p_item_group_pk"];
        string p_item 			= Request.QueryString["p_item"];
        string p_date 			= Request.QueryString["p_date"];     

        DataTable dtInfo   = CtlLib.TableReadOpenCursor("st_lg_rpt_BISC00171_ST02", "'" + Session["User_ID"].ToString() + "'");
		
		string para = "'" + p_date + "'";		
		DataTable dtMaster = CtlLib.TableReadOpenCursor("st_lg_rpt_BISC00171_ST02_1", para);
		
		para = "'" + p_lang + "','" + p_wh_pk + "','" + p_item_group_pk + "','" + p_item + "','" + p_date + "'";		
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_BISC00171_ST02_2", para);

        //--set-----DataBind--in---Master---
        if (!string.IsNullOrEmpty(dtInfo.Rows[0]["pic"].ToString()))
        {
            exSheet.Cells[1, 1].Select();
            byte[] MyData = new byte[0];
            MyData = (byte[])dtInfo.Rows[0]["pic"];
            MemoryStream stream = new MemoryStream(MyData);

            Bitmap b = new Bitmap(stream);
            exSheet.Shapes.AddPicture(ResizeImage(b, 100, 55));
        }

        exSheet.Cells["C1"].Value = dtInfo.Rows[0]["partner_name"].ToString();

        exSheet.Cells["C2"].Value = dtInfo.Rows[0]["addr1"].ToString();

        exSheet.Cells["C3"].Value = "Tax code: " + dtInfo.Rows[0]["tax_code"].ToString();

        exSheet.Cells["I1"].Value = "Tell: " + dtInfo.Rows[0]["phone_no"].ToString();

        exSheet.Cells["I1"].Value = "Fax: " + dtInfo.Rows[0]["fax_no"].ToString();    

        exSheet.Cells["G5"].Value = System.DateTime.ParseExact(p_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy") ;

        exSheet.Cells["C5"].Value = p_wh_name;
        //---------
       
        ////end-set-----DataBind--in---Master---

        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count * 3 -2; l_addrow++)
        {
            exSheet.Range["A11"].Rows.EntireRow.Insert();//insert row new of sheet            
        }
        
		if ( dtMaster.Rows.Count>0 )
		{
			exSheet.Cells["H6"].Value = dtMaster.Rows[0]["date01"];
            exSheet.Cells["I6"].Value = dtMaster.Rows[0]["date02"];
            exSheet.Cells["J6"].Value = dtMaster.Rows[0]["date03"];
            exSheet.Cells["K6"].Value = dtMaster.Rows[0]["date04"];
            exSheet.Cells["L6"].Value = dtMaster.Rows[0]["date05"];
			exSheet.Cells["M6"].Value = dtMaster.Rows[0]["date06"];
			exSheet.Cells["N6"].Value = dtMaster.Rows[0]["date07"];
			exSheet.Cells["O6"].Value = dtMaster.Rows[0]["date08"];
			exSheet.Cells["P6"].Value = dtMaster.Rows[0]["date09"];
			exSheet.Cells["Q6"].Value = dtMaster.Rows[0]["date10"];
			exSheet.Cells["R6"].Value = dtMaster.Rows[0]["date11"];
			exSheet.Cells["S6"].Value = dtMaster.Rows[0]["date12"];
			exSheet.Cells["T6"].Value = dtMaster.Rows[0]["date13"];
			exSheet.Cells["U6"].Value = dtMaster.Rows[0]["date14"];
			exSheet.Cells["V6"].Value = dtMaster.Rows[0]["date15"];
			exSheet.Cells["W6"].Value = dtMaster.Rows[0]["date16"];
			exSheet.Cells["X6"].Value = dtMaster.Rows[0]["date17"];
			exSheet.Cells["Y6"].Value = dtMaster.Rows[0]["date18"];
			exSheet.Cells["Z6"].Value = dtMaster.Rows[0]["date19"];
			exSheet.Cells["AA6"].Value = dtMaster.Rows[0]["date20"];
			exSheet.Cells["AB6"].Value = dtMaster.Rows[0]["date21"];
			exSheet.Cells["AC6"].Value = dtMaster.Rows[0]["date22"];
			exSheet.Cells["AD6"].Value = dtMaster.Rows[0]["date23"];
			exSheet.Cells["AE6"].Value = dtMaster.Rows[0]["date24"];
			exSheet.Cells["AF6"].Value = dtMaster.Rows[0]["date25"];
			exSheet.Cells["AG6"].Value = dtMaster.Rows[0]["date26"];
			exSheet.Cells["AH6"].Value = dtMaster.Rows[0]["date27"];
			exSheet.Cells["AI6"].Value = dtMaster.Rows[0]["date28"];
			exSheet.Cells["AJ6"].Value = dtMaster.Rows[0]["date29"];
			exSheet.Cells["AK6"].Value = dtMaster.Rows[0]["date30"];
			exSheet.Cells["AL6"].Value = dtMaster.Rows[0]["date31"];

			exSheet.Cells["H7"].Value = dtMaster.Rows[1]["date01"];
            exSheet.Cells["I7"].Value = dtMaster.Rows[1]["date02"];
            exSheet.Cells["J7"].Value = dtMaster.Rows[1]["date03"];
            exSheet.Cells["K7"].Value = dtMaster.Rows[1]["date04"];
            exSheet.Cells["L7"].Value = dtMaster.Rows[1]["date05"];
			exSheet.Cells["M7"].Value = dtMaster.Rows[1]["date06"];
			exSheet.Cells["N7"].Value = dtMaster.Rows[1]["date07"];
			exSheet.Cells["O7"].Value = dtMaster.Rows[1]["date08"];
			exSheet.Cells["P7"].Value = dtMaster.Rows[1]["date09"];
			exSheet.Cells["Q7"].Value = dtMaster.Rows[1]["date10"];
			exSheet.Cells["R7"].Value = dtMaster.Rows[1]["date11"];
			exSheet.Cells["S7"].Value = dtMaster.Rows[1]["date12"];
			exSheet.Cells["T7"].Value = dtMaster.Rows[1]["date13"];
			exSheet.Cells["U7"].Value = dtMaster.Rows[1]["date14"];
			exSheet.Cells["V7"].Value = dtMaster.Rows[1]["date15"];
			exSheet.Cells["W7"].Value = dtMaster.Rows[1]["date16"];
			exSheet.Cells["X7"].Value = dtMaster.Rows[1]["date17"];
			exSheet.Cells["Y7"].Value = dtMaster.Rows[1]["date18"];
			exSheet.Cells["Z7"].Value = dtMaster.Rows[1]["date19"];
			exSheet.Cells["AA7"].Value = dtMaster.Rows[1]["date20"];
			exSheet.Cells["AB7"].Value = dtMaster.Rows[1]["date21"];
			exSheet.Cells["AC7"].Value = dtMaster.Rows[1]["date22"];
			exSheet.Cells["AD7"].Value = dtMaster.Rows[1]["date23"];
			exSheet.Cells["AE7"].Value = dtMaster.Rows[1]["date24"];
			exSheet.Cells["AF7"].Value = dtMaster.Rows[1]["date25"];
			exSheet.Cells["AG7"].Value = dtMaster.Rows[1]["date26"];
			exSheet.Cells["AH7"].Value = dtMaster.Rows[1]["date27"];
			exSheet.Cells["AI7"].Value = dtMaster.Rows[1]["date28"];
			exSheet.Cells["AJ7"].Value = dtMaster.Rows[1]["date29"];
			exSheet.Cells["AK7"].Value = dtMaster.Rows[1]["date30"];
			exSheet.Cells["AL7"].Value = dtMaster.Rows[1]["date31"];
		}

		//--------------------------
        double p_begin = 0,  p_total = 0, p_01 = 0, p_02 = 0, p_03 = 0, p_04 = 0, p_05 = 0, p_06 = 0, p_07 = 0, p_08 = 0, p_09 = 0, p_10 = 0,
			   p_11 = 0, p_12 = 0, p_13 = 0, p_14 = 0, p_15 = 0, p_16 = 0, p_17 = 0, p_18 = 0, p_19 = 0, p_20 = 0,
               p_21 = 0, p_22 = 0, p_23 = 0, p_24 = 0, p_25 = 0, p_26 = 0, p_27 = 0, p_28 = 0, p_29 = 0, p_30 = 0, p_31 = 0;

	    int l_pos = 8 ;
		
        for (int i = 0; i < dtDetail.Rows.Count; i++)
        {
            if (i > 0)
            {
                exSheet.Range[8, 1, 10, 39].Copy(exSheet.Range[l_pos, 1, l_pos + 2, 39], XlPasteType.xlPasteAll);
            }
			
            exSheet.Cells[l_pos , 1].Value = i+1;
			exSheet.Cells[l_pos , 2].Value = dtDetail.Rows[i]["item_code"];               
			exSheet.Cells[l_pos , 3].Value = dtDetail.Rows[i]["item_name"]; 
			
			exSheet.Cells[l_pos , 4].Value = dtDetail.Rows[i]["uom"];
			
			exSheet.Cells[l_pos , 6].Value = dtDetail.Rows[i]["begin_qty"]; 
			
			exSheet.Cells[l_pos + 0, 7].Value = dtDetail.Rows[i]["total_in"];
			exSheet.Cells[l_pos + 1, 7].Value = dtDetail.Rows[i]["total_out"];
			exSheet.Cells[l_pos + 2, 7].Value = dtDetail.Rows[i]["end_qty"];	
						  						
            exSheet.Range[l_pos, 1, l_pos + 2, 1].Merge();
            exSheet.Range[l_pos, 2, l_pos + 2, 2].Merge();
            exSheet.Range[l_pos, 3, l_pos + 2, 3].Merge();
            exSheet.Range[l_pos, 4, l_pos + 2, 4].Merge();
            exSheet.Range[l_pos, 6, l_pos + 2, 6].Merge();		 		
         
			
			exSheet.Cells[l_pos    , 8].Value = dtDetail.Rows[i]["in_qty_01"];
			exSheet.Cells[l_pos + 1, 8].Value = dtDetail.Rows[i]["out_qty_01"];
			exSheet.Cells[l_pos + 2, 8].Value = "=F"+(l_pos)+"+H"+(l_pos)+"-H"+(l_pos+1);
			
			exSheet.Cells[l_pos    , 9].Value = dtDetail.Rows[i]["in_qty_02"];
			exSheet.Cells[l_pos + 1, 9].Value = dtDetail.Rows[i]["out_qty_02"];
			exSheet.Cells[l_pos + 2, 9].Value = "=H"+(l_pos+2)+"+I"+(l_pos)+"-I"+(l_pos+1);
			
			exSheet.Cells[l_pos    , 10].Value = dtDetail.Rows[i]["in_qty_03"];
			exSheet.Cells[l_pos + 1, 10].Value = dtDetail.Rows[i]["out_qty_03"];
            exSheet.Cells[l_pos + 2, 10].Value = "=I"+(l_pos+2)+"+J"+(l_pos)+"-J"+(l_pos +1);
			
			exSheet.Cells[l_pos    , 11].Value = dtDetail.Rows[i]["in_qty_04"];
			exSheet.Cells[l_pos + 1, 11].Value = dtDetail.Rows[i]["out_qty_04"];
			exSheet.Cells[l_pos + 2, 11].Value = "=J"+(l_pos+2)+"+K"+(l_pos)+"-K"+(l_pos+1);
			
			exSheet.Cells[l_pos    , 12].Value = dtDetail.Rows[i]["in_qty_05"];
            exSheet.Cells[l_pos + 1, 12].Value = dtDetail.Rows[i]["out_qty_05"];
            exSheet.Cells[l_pos + 2, 12].Value = "=K"+(l_pos+2)+"+L"+(l_pos)+"-L"+(l_pos+1);

            exSheet.Cells[l_pos    , 13].Value = dtDetail.Rows[i]["in_qty_06"];
            exSheet.Cells[l_pos + 1, 13].Value = dtDetail.Rows[i]["out_qty_06"];
            exSheet.Cells[l_pos + 2, 13].Value = "=L"+(l_pos+2)+"+M"+(l_pos)+"-M"+(l_pos+1);

            exSheet.Cells[l_pos    , 14].Value = dtDetail.Rows[i]["in_qty_07"];
            exSheet.Cells[l_pos + 1, 14].Value = dtDetail.Rows[i]["out_qty_07"];
            exSheet.Cells[l_pos + 2, 14].Value = "=M"+(l_pos+2)+"+N"+(l_pos)+"-N"+(l_pos+1);

            exSheet.Cells[l_pos    , 15].Value = dtDetail.Rows[i]["in_qty_08"];
            exSheet.Cells[l_pos + 1, 15].Value = dtDetail.Rows[i]["out_qty_08"];
            exSheet.Cells[l_pos + 2, 15].Value = "=N"+(l_pos+2)+"+O"+(l_pos)+"-O"+(l_pos+1);

            exSheet.Cells[l_pos    , 16].Value = dtDetail.Rows[i]["in_qty_09"];
            exSheet.Cells[l_pos + 1, 16].Value = dtDetail.Rows[i]["out_qty_09"];
            exSheet.Cells[l_pos + 2, 16].Value = "=O"+(l_pos+2)+"+P"+(l_pos)+"-P"+(l_pos+1);

            exSheet.Cells[l_pos    , 17].Value = dtDetail.Rows[i]["in_qty_10"];
            exSheet.Cells[l_pos + 1, 17].Value = dtDetail.Rows[i]["out_qty_10"];
            exSheet.Cells[l_pos + 2, 17].Value = "=P"+(l_pos+2)+"+Q"+(l_pos)+"-Q"+(l_pos+1);

            exSheet.Cells[l_pos    , 18].Value = dtDetail.Rows[i]["in_qty_11"];
            exSheet.Cells[l_pos + 1, 18].Value = dtDetail.Rows[i]["out_qty_11"];
            exSheet.Cells[l_pos + 2, 18].Value = "=Q"+(l_pos+2)+"+R"+(l_pos)+"-R"+(l_pos+1);

            exSheet.Cells[l_pos    , 19].Value = dtDetail.Rows[i]["in_qty_12"];
            exSheet.Cells[l_pos + 1, 19].Value = dtDetail.Rows[i]["out_qty_12"];
            exSheet.Cells[l_pos + 2, 19].Value = "=R"+(l_pos+2)+"+S"+(l_pos)+"-S"+(l_pos+1);

            exSheet.Cells[l_pos    , 20].Value = dtDetail.Rows[i]["in_qty_13"];
            exSheet.Cells[l_pos + 1, 20].Value = dtDetail.Rows[i]["out_qty_13"];
            exSheet.Cells[l_pos + 2, 20].Value = "=S"+(l_pos+2)+"+T"+(l_pos)+"-T"+(l_pos+1);

            exSheet.Cells[l_pos    , 21].Value = dtDetail.Rows[i]["in_qty_14"];
            exSheet.Cells[l_pos + 1, 21].Value = dtDetail.Rows[i]["out_qty_14"];
            exSheet.Cells[l_pos + 2, 21].Value = "=T"+(l_pos+2)+"+U"+(l_pos)+"-U"+(l_pos+1);

            exSheet.Cells[l_pos    , 22].Value = dtDetail.Rows[i]["in_qty_15"];
            exSheet.Cells[l_pos + 1, 22].Value = dtDetail.Rows[i]["out_qty_15"];
            exSheet.Cells[l_pos + 2, 22].Value = "=U"+(l_pos+2)+"+V"+(l_pos)+"-V"+(l_pos+1);

            exSheet.Cells[l_pos    , 23].Value = dtDetail.Rows[i]["in_qty_16"];
            exSheet.Cells[l_pos + 1, 23].Value = dtDetail.Rows[i]["out_qty_16"];
            exSheet.Cells[l_pos + 2, 23].Value = "=V"+(l_pos+2)+"+W"+(l_pos)+"-W"+(l_pos+1);

            exSheet.Cells[l_pos    , 24].Value = dtDetail.Rows[i]["in_qty_17"];
            exSheet.Cells[l_pos + 1, 24].Value = dtDetail.Rows[i]["out_qty_17"];
            exSheet.Cells[l_pos + 2, 24].Value = "=W"+(l_pos+2)+"+X"+(l_pos)+"-X"+(l_pos+1);

            exSheet.Cells[l_pos    , 25].Value = dtDetail.Rows[i]["in_qty_18"];
            exSheet.Cells[l_pos + 1, 25].Value = dtDetail.Rows[i]["out_qty_18"];
            exSheet.Cells[l_pos + 2, 25].Value = "=X"+(l_pos+2)+"+Y"+(l_pos)+"-Y"+(l_pos+1);

            exSheet.Cells[l_pos    , 26].Value = dtDetail.Rows[i]["in_qty_19"];
            exSheet.Cells[l_pos + 1, 26].Value = dtDetail.Rows[i]["out_qty_19"];
            exSheet.Cells[l_pos + 2, 26].Value = "=Y"+(l_pos+2)+"+Z"+(l_pos)+"-Z"+(l_pos+1);

            exSheet.Cells[l_pos    , 27].Value = dtDetail.Rows[i]["in_qty_20"];
            exSheet.Cells[l_pos + 1, 27].Value = dtDetail.Rows[i]["out_qty_20"];
            exSheet.Cells[l_pos + 2, 27].Value = "=Z"+(l_pos+2)+"+AA"+(l_pos)+"-AA"+(l_pos+1);
            
            exSheet.Cells[l_pos    , 28].Value = dtDetail.Rows[i]["in_qty_21"];
            exSheet.Cells[l_pos + 1, 28].Value = dtDetail.Rows[i]["out_qty_21"];
            exSheet.Cells[l_pos + 2, 28].Value = "=AA"+(l_pos+2)+"+AB"+(l_pos)+"-AB"+(l_pos+1);
            
            exSheet.Cells[l_pos    , 29].Value = dtDetail.Rows[i]["in_qty_22"];
            exSheet.Cells[l_pos + 1, 29].Value = dtDetail.Rows[i]["out_qty_22"];
            exSheet.Cells[l_pos + 2, 29].Value = "=AB"+(l_pos+2)+"+AC"+(l_pos)+"-AC"+(l_pos+1);
            
            exSheet.Cells[l_pos    , 30].Value = dtDetail.Rows[i]["in_qty_23"];
            exSheet.Cells[l_pos + 1, 30].Value = dtDetail.Rows[i]["out_qty_23"];
            exSheet.Cells[l_pos + 2, 30].Value = "=AC"+(l_pos+2)+"+AD"+(l_pos)+"-AD"+(l_pos+1);
            
            exSheet.Cells[l_pos    , 31].Value = dtDetail.Rows[i]["in_qty_24"];
            exSheet.Cells[l_pos + 1, 31].Value = dtDetail.Rows[i]["out_qty_24"];
            exSheet.Cells[l_pos + 2, 31].Value = "=AD"+(l_pos+2)+"+AE"+(l_pos)+"-AE"+(l_pos+1);
            
            exSheet.Cells[l_pos    , 32].Value = dtDetail.Rows[i]["in_qty_25"];
            exSheet.Cells[l_pos + 1, 32].Value = dtDetail.Rows[i]["out_qty_25"];
            exSheet.Cells[l_pos + 2, 32].Value = "=AE"+(l_pos+2)+"+AF"+(l_pos)+"-AF"+(l_pos+1);
            
            exSheet.Cells[l_pos    , 33].Value = dtDetail.Rows[i]["in_qty_26"];
            exSheet.Cells[l_pos + 1, 33].Value = dtDetail.Rows[i]["out_qty_26"];
            exSheet.Cells[l_pos + 2, 33].Value = "=AF"+(l_pos+2)+"+AG"+(l_pos)+"-AG"+(l_pos+1);
            
            exSheet.Cells[l_pos    , 34].Value = dtDetail.Rows[i]["in_qty_27"];
            exSheet.Cells[l_pos + 1, 34].Value = dtDetail.Rows[i]["out_qty_27"];
            exSheet.Cells[l_pos + 2, 34].Value = "=AG"+(l_pos+2)+"+AH"+(l_pos)+"-AH"+(l_pos+1);

            exSheet.Cells[l_pos    , 35].Value = dtDetail.Rows[i]["in_qty_28"];
            exSheet.Cells[l_pos + 1, 35].Value = dtDetail.Rows[i]["out_qty_28"];
            exSheet.Cells[l_pos + 2, 35].Value = "=AH"+(l_pos+2)+"+AI"+(l_pos)+"-AI"+(l_pos+1);

            exSheet.Cells[l_pos    , 36].Value = dtDetail.Rows[i]["in_qty_29"];
            exSheet.Cells[l_pos + 1, 36].Value = dtDetail.Rows[i]["out_qty_29"];
            exSheet.Cells[l_pos + 2, 36].Value = "=AI"+(l_pos+2)+"+AJ"+(l_pos)+"-AJ"+(l_pos+1);

            exSheet.Cells[l_pos    , 37].Value = dtDetail.Rows[i]["in_qty_30"];
            exSheet.Cells[l_pos + 1, 37].Value = dtDetail.Rows[i]["out_qty_30"];
            exSheet.Cells[l_pos + 2, 37].Value = "=AJ"+(l_pos+2)+"+AK"+(l_pos)+"-AK"+(l_pos+1);

            exSheet.Cells[l_pos    , 38].Value = dtDetail.Rows[i]["in_qty_31"];
            exSheet.Cells[l_pos + 1, 38].Value = dtDetail.Rows[i]["out_qty_31"];
            exSheet.Cells[l_pos + 2, 38].Value = "=AK"+(l_pos+2)+"+AL"+(l_pos)+"-AL"+(l_pos+1);

			exSheet.Cells[l_pos, 39].Value = dtDetail.Rows[i]["end_qty"];
            exSheet.Range[l_pos, 39, l_pos + 2, 39].Merge(); 
            
            p_total += Convert.ToDouble(dtDetail.Rows[i]["end_qty"]);
            p_begin += Convert.ToDouble(dtDetail.Rows[i]["begin_qty"]);
			
            p_01 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 8].Value);
            p_02 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 9].Value);
            p_03 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 10].Value);
            p_04 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 11].Value);
            p_05 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 12].Value);
            p_06 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 13].Value);
            p_07 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 14].Value);
            p_08 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 15].Value);
            p_09 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 16].Value);
            p_10 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 17].Value);
            p_11 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 18].Value);
            p_12 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 19].Value);
            p_13 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 20].Value);
            p_14 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 21].Value);
            p_15 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 22].Value);
            p_16 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 23].Value);
            p_17 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 24].Value);
            p_18 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 25].Value);
            p_19 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 26].Value);
            p_20 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 27].Value);
            p_21 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 28].Value);
            p_22 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 29].Value);
            p_23 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 30].Value);
            p_24 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 31].Value);
            p_25 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 32].Value);
            p_26 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 33].Value);
            p_27 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 34].Value);
            p_28 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 35].Value);
            p_29 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 36].Value);
            p_30 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 37].Value);
            p_31 += Convert.ToDouble(exSheet.Cells[l_pos + 2, 38].Value);
			
			l_pos = l_pos + 3;
        }


        exSheet.Cells[l_pos , 6].Value = p_begin;

        exSheet.Cells[l_pos , 8].Value   = p_01;
        exSheet.Cells[l_pos , 9].Value   = p_02;
        exSheet.Cells[l_pos , 10].Value = p_03;
		                                  
        exSheet.Cells[l_pos , 11].Value = p_04;
        exSheet.Cells[l_pos , 12].Value = p_05;
		exSheet.Cells[l_pos , 13].Value = p_06;
		                                  
		exSheet.Cells[l_pos , 14].Value = p_07;
		exSheet.Cells[l_pos , 15].Value = p_08;
		exSheet.Cells[l_pos , 16].Value = p_09;
		                                  
		exSheet.Cells[l_pos , 17].Value = p_10;
		exSheet.Cells[l_pos , 18].Value = p_11;
		exSheet.Cells[l_pos , 19].Value = p_12;
		                                  
		exSheet.Cells[l_pos , 20].Value = p_13;
		exSheet.Cells[l_pos , 21].Value = p_14;
		exSheet.Cells[l_pos , 22].Value = p_15;
		                                  
		exSheet.Cells[l_pos , 23].Value = p_16;
		exSheet.Cells[l_pos , 24].Value = p_17;
		exSheet.Cells[l_pos , 25].Value = p_18;
		                                  
		exSheet.Cells[l_pos , 26].Value = p_19;
		exSheet.Cells[l_pos , 27].Value = p_20;
		exSheet.Cells[l_pos , 28].Value = p_21;
		                                  
		exSheet.Cells[l_pos , 29].Value = p_22;
		exSheet.Cells[l_pos , 30].Value = p_23;
		exSheet.Cells[l_pos , 31].Value = p_24;
		                                  
		exSheet.Cells[l_pos , 32].Value = p_25;
		exSheet.Cells[l_pos , 33].Value = p_26;	
		exSheet.Cells[l_pos , 34].Value = p_27;

        exSheet.Cells[l_pos , 35].Value = p_28;
		exSheet.Cells[l_pos , 36].Value = p_29;	
		exSheet.Cells[l_pos , 37].Value = p_30;

        exSheet.Cells[l_pos , 38].Value = p_31;
		
        exSheet.Cells[l_pos , 39].Value = p_total;
                                          
        // end loop detail percent        
        if (File.Exists(TempFile))        	
        {                                
            File.Delete(TempFile);
        }


        // hide row firts 

        //range = exSheet.Range["A1"];
        // hide row A5 
        // range.Rows.Hidden = true;

        // font bold header
        /*range = exSheet.Range["A1:AC1"];
        range.Rows[4].Font.Bold = true;*/

        exBook.SaveAs(TempFile);
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
        //Response.WriteFile(pdfFilePath);
        Response.WriteFile(TempFile);
        //Stop execute  
        Response.End();

    }

    public Bitmap ResizeImage(Bitmap d, int w, int h)
    {
        Bitmap q = new Bitmap(w, h);
        float f, g;
        f = (float)w / (float)d.Width;
        g = (float)h / (float)d.Height;
        for (int i = 0; i < w; i++)
        {
            for (int j = 0; j < h; j++)
            {
                Color c;
                c = d.GetPixel((int)(i / f), (int)(j / g));
                q.SetPixel(i, j, c);
            }
        }
        return q;
    }
}