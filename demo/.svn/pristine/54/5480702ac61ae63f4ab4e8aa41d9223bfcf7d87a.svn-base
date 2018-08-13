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

public partial class rpt_bisc00171 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString()); 
		//CtlLib.SetUser("SALE"); 
		
        string TemplateFile = "rpt_bisc00171.xls";
        string TempFile = "../../../../system/temp/rpt_bisc00171_" + Session["User_ID"].ToString() + ".xls";
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
		string p_type			= Request.QueryString["p_type"];		       

        DataTable dtInfo   = CtlLib.TableReadOpenCursor("st_lg_rpt_BISC00171", "'" + Session["User_ID"].ToString() + "'");
		
		string para = "'" + p_date + "'";		
		DataTable dtMaster = CtlLib.TableReadOpenCursor("st_lg_rpt_BISC00171_1", para);
		
		para = "'" + p_lang + "','" + p_wh_pk + "','" + p_item_group_pk + "','" + p_item + "','" + p_date + "','" + p_type + "'";		
        DataTable dtDetail = CtlLib.TableReadOpenCursor("st_lg_rpt_BISC00171_2", para);

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

        exSheet.Cells["I1"].Value = "Print date: " + DateTime.Now.ToString("dd/MM/yyyy hh:mm");

        exSheet.Cells["F5"].Value = System.DateTime.ParseExact(p_date, "yyyyMMdd", System.Globalization.CultureInfo.InvariantCulture).ToString("dd/MM/yyyy") ;

        exSheet.Cells["C5"].Value = p_wh_name;
        //---------
       
        ////end-set-----DataBind--in---Master---

        for (int l_addrow = 1; l_addrow < dtDetail.Rows.Count; l_addrow++)
        {
            exSheet.Range["A9"].Rows.EntireRow.Insert();//insert row new of sheet

        }
        
		if ( dtDetail.Rows.Count>1 )
		{
			exSheet.Cells["M6"].Value = dtMaster.Rows[0]["date01"];
			exSheet.Cells["O6"].Value = dtMaster.Rows[0]["date02"];
			exSheet.Cells["Q6"].Value = dtMaster.Rows[0]["date03"];
			exSheet.Cells["S6"].Value = dtMaster.Rows[0]["date04"];
			exSheet.Cells["U6"].Value = dtMaster.Rows[0]["date05"];
			exSheet.Cells["W6"].Value = dtMaster.Rows[0]["date06"];
			exSheet.Cells["Y6"].Value = dtMaster.Rows[0]["date07"];
			exSheet.Cells["AA6"].Value = dtMaster.Rows[0]["date08"];
			exSheet.Cells["AC6"].Value = dtMaster.Rows[0]["date09"];
			exSheet.Cells["AE6"].Value = dtMaster.Rows[0]["date10"];
			exSheet.Cells["AG6"].Value = dtMaster.Rows[0]["date11"];
			exSheet.Cells["AI6"].Value = dtMaster.Rows[0]["date12"];
			exSheet.Cells["AK6"].Value = dtMaster.Rows[0]["date13"];
			exSheet.Cells["AM6"].Value = dtMaster.Rows[0]["date14"];
			exSheet.Cells["AO6"].Value = dtMaster.Rows[0]["date15"];
			exSheet.Cells["AQ6"].Value = dtMaster.Rows[0]["date16"];
			exSheet.Cells["AS6"].Value = dtMaster.Rows[0]["date17"];
			exSheet.Cells["AU6"].Value = dtMaster.Rows[0]["date18"];
			exSheet.Cells["AW6"].Value = dtMaster.Rows[0]["date19"];
			exSheet.Cells["AY6"].Value = dtMaster.Rows[0]["date20"];
			exSheet.Cells["BA6"].Value = dtMaster.Rows[0]["date21"];
			exSheet.Cells["BC6"].Value = dtMaster.Rows[0]["date22"];
			exSheet.Cells["BE6"].Value = dtMaster.Rows[0]["date23"];
			exSheet.Cells["BG6"].Value = dtMaster.Rows[0]["date24"];
			exSheet.Cells["BI6"].Value = dtMaster.Rows[0]["date25"];
			exSheet.Cells["BK6"].Value = dtMaster.Rows[0]["date26"];
			exSheet.Cells["BM6"].Value = dtMaster.Rows[0]["date27"];
			exSheet.Cells["BO6"].Value = dtMaster.Rows[0]["date28"];
			exSheet.Cells["BQ6"].Value = dtMaster.Rows[0]["date29"];
			exSheet.Cells["BS6"].Value = dtMaster.Rows[0]["date30"];
			exSheet.Cells["BU6"].Value = dtMaster.Rows[0]["date31"];
		}
		//--------------------------	   
	    int l_pos = 8 ;
		
        for (int i = 0; i < dtDetail.Rows.Count; i++)
        {           
            exSheet.Cells[l_pos + i, 1].Value = i+1;
			exSheet.Cells[l_pos + i, 2].Value = dtDetail.Rows[i]["item_code"];               
			exSheet.Cells[l_pos + i, 3].Value = dtDetail.Rows[i]["item_name"]; 
			
			exSheet.Cells[l_pos + i, 4].Value = dtDetail.Rows[i]["spec01_nm"];
			exSheet.Cells[l_pos + i, 5].Value = dtDetail.Rows[i]["spec02_nm"];
			exSheet.Cells[l_pos + i, 6].Value = dtDetail.Rows[i]["spec03_nm"];
			exSheet.Cells[l_pos + i, 7].Value = dtDetail.Rows[i]["spec04_nm"];
			exSheet.Cells[l_pos + i, 8].Value = dtDetail.Rows[i]["uom"];
			
			exSheet.Cells[l_pos + i, 9].Value = dtDetail.Rows[i]["lot_qty"];
			exSheet.Cells[l_pos + i,10].Value = dtDetail.Rows[i]["stock_qty"];
			exSheet.Cells[l_pos + i,11].Value = dtDetail.Rows[i]["box_qty"];
			
			exSheet.Cells[l_pos + i,12].Value = dtDetail.Rows[i]["begin_qty"];
			
			exSheet.Cells[l_pos + i,13].Value = dtDetail.Rows[i]["in_qty_01"];
			exSheet.Cells[l_pos + i,14].Value = dtDetail.Rows[i]["out_qty_01"];
			exSheet.Cells[l_pos + i,15].Value = dtDetail.Rows[i]["in_qty_02"];
			exSheet.Cells[l_pos + i,16].Value = dtDetail.Rows[i]["out_qty_02"];
			exSheet.Cells[l_pos + i,17].Value = dtDetail.Rows[i]["in_qty_03"];
			exSheet.Cells[l_pos + i,18].Value = dtDetail.Rows[i]["out_qty_03"];			
			exSheet.Cells[l_pos + i,19].Value = dtDetail.Rows[i]["in_qty_04"];
			exSheet.Cells[l_pos + i,20].Value = dtDetail.Rows[i]["out_qty_04"];
			exSheet.Cells[l_pos + i,21].Value = dtDetail.Rows[i]["in_qty_05"];
			exSheet.Cells[l_pos + i,22].Value = dtDetail.Rows[i]["out_qty_05"];
			exSheet.Cells[l_pos + i,23].Value = dtDetail.Rows[i]["in_qty_06"];
			exSheet.Cells[l_pos + i,24].Value = dtDetail.Rows[i]["out_qty_06"];
			exSheet.Cells[l_pos + i,25].Value = dtDetail.Rows[i]["in_qty_07"];
			exSheet.Cells[l_pos + i,26].Value = dtDetail.Rows[i]["out_qty_07"];
			exSheet.Cells[l_pos + i,27].Value = dtDetail.Rows[i]["in_qty_08"];
			exSheet.Cells[l_pos + i,28].Value = dtDetail.Rows[i]["out_qty_08"];
			exSheet.Cells[l_pos + i,29].Value = dtDetail.Rows[i]["in_qty_09"];
			exSheet.Cells[l_pos + i,30].Value = dtDetail.Rows[i]["out_qty_09"];
			exSheet.Cells[l_pos + i,31].Value = dtDetail.Rows[i]["in_qty_10"];
			exSheet.Cells[l_pos + i,32].Value = dtDetail.Rows[i]["out_qty_10"];
			exSheet.Cells[l_pos + i,33].Value = dtDetail.Rows[i]["in_qty_11"];
			exSheet.Cells[l_pos + i,34].Value = dtDetail.Rows[i]["out_qty_11"];
			exSheet.Cells[l_pos + i,35].Value = dtDetail.Rows[i]["in_qty_12"];
			exSheet.Cells[l_pos + i,36].Value = dtDetail.Rows[i]["out_qty_12"];
			exSheet.Cells[l_pos + i,37].Value = dtDetail.Rows[i]["in_qty_13"];
			exSheet.Cells[l_pos + i,38].Value = dtDetail.Rows[i]["out_qty_13"];
			exSheet.Cells[l_pos + i,39].Value = dtDetail.Rows[i]["in_qty_14"];
			exSheet.Cells[l_pos + i,40].Value = dtDetail.Rows[i]["out_qty_14"];
			exSheet.Cells[l_pos + i,41].Value = dtDetail.Rows[i]["in_qty_15"];
			exSheet.Cells[l_pos + i,42].Value = dtDetail.Rows[i]["out_qty_15"];
			exSheet.Cells[l_pos + i,43].Value = dtDetail.Rows[i]["in_qty_16"];
			exSheet.Cells[l_pos + i,44].Value = dtDetail.Rows[i]["out_qty_16"];
			exSheet.Cells[l_pos + i,45].Value = dtDetail.Rows[i]["in_qty_17"];
			exSheet.Cells[l_pos + i,46].Value = dtDetail.Rows[i]["out_qty_17"];
			exSheet.Cells[l_pos + i,47].Value = dtDetail.Rows[i]["in_qty_18"];
			exSheet.Cells[l_pos + i,48].Value = dtDetail.Rows[i]["out_qty_18"];
			exSheet.Cells[l_pos + i,49].Value = dtDetail.Rows[i]["in_qty_19"];
			exSheet.Cells[l_pos + i,50].Value = dtDetail.Rows[i]["out_qty_19"];
			exSheet.Cells[l_pos + i,51].Value = dtDetail.Rows[i]["in_qty_20"];
			exSheet.Cells[l_pos + i,52].Value = dtDetail.Rows[i]["out_qty_20"];
			exSheet.Cells[l_pos + i,53].Value = dtDetail.Rows[i]["in_qty_21"];
			exSheet.Cells[l_pos + i,54].Value = dtDetail.Rows[i]["out_qty_21"];
			exSheet.Cells[l_pos + i,55].Value = dtDetail.Rows[i]["in_qty_22"];
			exSheet.Cells[l_pos + i,56].Value = dtDetail.Rows[i]["out_qty_22"];
			exSheet.Cells[l_pos + i,57].Value = dtDetail.Rows[i]["in_qty_23"];
			exSheet.Cells[l_pos + i,58].Value = dtDetail.Rows[i]["out_qty_23"];
			exSheet.Cells[l_pos + i,59].Value = dtDetail.Rows[i]["in_qty_24"];
			exSheet.Cells[l_pos + i,60].Value = dtDetail.Rows[i]["out_qty_24"];
			exSheet.Cells[l_pos + i,61].Value = dtDetail.Rows[i]["in_qty_25"];
			exSheet.Cells[l_pos + i,62].Value = dtDetail.Rows[i]["out_qty_25"];
			exSheet.Cells[l_pos + i,63].Value = dtDetail.Rows[i]["in_qty_26"];
			exSheet.Cells[l_pos + i,64].Value = dtDetail.Rows[i]["out_qty_26"];
			exSheet.Cells[l_pos + i,65].Value = dtDetail.Rows[i]["in_qty_27"];
			exSheet.Cells[l_pos + i,66].Value = dtDetail.Rows[i]["out_qty_27"];
			exSheet.Cells[l_pos + i,67].Value = dtDetail.Rows[i]["in_qty_28"];
			exSheet.Cells[l_pos + i,68].Value = dtDetail.Rows[i]["out_qty_28"];
			exSheet.Cells[l_pos + i,69].Value = dtDetail.Rows[i]["in_qty_29"];
			exSheet.Cells[l_pos + i,70].Value = dtDetail.Rows[i]["out_qty_29"];
			exSheet.Cells[l_pos + i,71].Value = dtDetail.Rows[i]["in_qty_30"];
			exSheet.Cells[l_pos + i,72].Value = dtDetail.Rows[i]["out_qty_30"];
			exSheet.Cells[l_pos + i,73].Value = dtDetail.Rows[i]["in_qty_31"];
			exSheet.Cells[l_pos + i,74].Value = dtDetail.Rows[i]["out_qty_31"];
			
			exSheet.Cells[l_pos + i,75].Value = dtDetail.Rows[i]["end_qty"];
        }
     
        exSheet.Cells[dtDetail.Rows.Count + 8, 10].Value = "=SUM(J8:J" + (dtDetail.Rows.Count + 7) + ")";
		
        exSheet.Cells[dtDetail.Rows.Count + 8, 11].Value = "=SUM(K8:K" + (dtDetail.Rows.Count + 7) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 8, 12].Value = "=SUM(L8:L" + (dtDetail.Rows.Count + 7) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 8, 13].Value = "=SUM(M8:M" + (dtDetail.Rows.Count + 7) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 8, 14].Value = "=SUM(N8:N" + (dtDetail.Rows.Count + 7) + ")";
        exSheet.Cells[dtDetail.Rows.Count + 8, 15].Value = "=SUM(O8:O" + (dtDetail.Rows.Count + 7) + ")";
		
		exSheet.Cells[dtDetail.Rows.Count + 8, 16].Value = "=SUM(P8:P" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 17].Value = "=SUM(Q8:Q" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 18].Value = "=SUM(R8:R" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 19].Value = "=SUM(S8:S" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 20].Value = "=SUM(T8:T" + (dtDetail.Rows.Count + 7) + ")";
		
		exSheet.Cells[dtDetail.Rows.Count + 8, 21].Value = "=SUM(U8:U" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 22].Value = "=SUM(V8:V" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 23].Value = "=SUM(W8:W" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 24].Value = "=SUM(X8:X" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 25].Value = "=SUM(Y8:Y" + (dtDetail.Rows.Count + 7) + ")";
		
		exSheet.Cells[dtDetail.Rows.Count + 8, 26].Value = "=SUM(Z8:Z" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 27].Value = "=SUM(AA8:AA" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 28].Value = "=SUM(AB8:AB" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 29].Value = "=SUM(AC8:AC" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 30].Value = "=SUM(AD8:AD" + (dtDetail.Rows.Count + 7) + ")";
		
		exSheet.Cells[dtDetail.Rows.Count + 8, 31].Value = "=SUM(AE8:AE" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 32].Value = "=SUM(AF8:AF" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 33].Value = "=SUM(AG8:AG" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 34].Value = "=SUM(AH8:AH" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 35].Value = "=SUM(AI8:AI" + (dtDetail.Rows.Count + 7) + ")";
		
		exSheet.Cells[dtDetail.Rows.Count + 8, 36].Value = "=SUM(AJ8:AJ" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 37].Value = "=SUM(AK8:AK" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 38].Value = "=SUM(AL8:AL" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 39].Value = "=SUM(AM8:AM" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 40].Value = "=SUM(AN8:AN" + (dtDetail.Rows.Count + 7) + ")";
		
		exSheet.Cells[dtDetail.Rows.Count + 8, 41].Value = "=SUM(AO8:AO" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 42].Value = "=SUM(AP8:AP" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 43].Value = "=SUM(AQ8:AQ" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 44].Value = "=SUM(AR8:AR" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 45].Value = "=SUM(AS8:AS" + (dtDetail.Rows.Count + 7) + ")";
		
		exSheet.Cells[dtDetail.Rows.Count + 8, 46].Value = "=SUM(AT8:AT" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 47].Value = "=SUM(AU8:AU" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 48].Value = "=SUM(AV8:AV" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 49].Value = "=SUM(AW8:AW" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 50].Value = "=SUM(AX8:AX" + (dtDetail.Rows.Count + 7) + ")";
		
		exSheet.Cells[dtDetail.Rows.Count + 8, 51].Value = "=SUM(AY8:AY" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 52].Value = "=SUM(AZ8:AZ" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 53].Value = "=SUM(BA8:BA" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 54].Value = "=SUM(BB8:BB" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 55].Value = "=SUM(BC8:BC" + (dtDetail.Rows.Count + 7) + ")";
		
		exSheet.Cells[dtDetail.Rows.Count + 8, 56].Value = "=SUM(BD8:BD" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 57].Value = "=SUM(BE8:BE" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 58].Value = "=SUM(BF8:BF" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 59].Value = "=SUM(BG8:BG" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 60].Value = "=SUM(BH8:BH" + (dtDetail.Rows.Count + 7) + ")";
		
		exSheet.Cells[dtDetail.Rows.Count + 8, 61].Value = "=SUM(BI8:BI" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 62].Value = "=SUM(BJ8:BJ" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 63].Value = "=SUM(BK8:BK" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 64].Value = "=SUM(BL8:BL" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 65].Value = "=SUM(BM8:BM" + (dtDetail.Rows.Count + 7) + ")";
		
		exSheet.Cells[dtDetail.Rows.Count + 8, 66].Value = "=SUM(BN8:BN" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 67].Value = "=SUM(BO8:BO" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 68].Value = "=SUM(BP8:BP" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 69].Value = "=SUM(BQ8:BQ" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 70].Value = "=SUM(BR8:BR" + (dtDetail.Rows.Count + 7) + ")";
		
		exSheet.Cells[dtDetail.Rows.Count + 8, 71].Value = "=SUM(BS8:BS" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 72].Value = "=SUM(BT8:BT" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 73].Value = "=SUM(BU8:BU" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 74].Value = "=SUM(BV8:BV" + (dtDetail.Rows.Count + 7) + ")";
		exSheet.Cells[dtDetail.Rows.Count + 8, 75].Value = "=SUM(BW8:BW" + (dtDetail.Rows.Count + 7) + ")";
         
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