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

public partial class rpt_60250300_vat_invoice : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        CtlLib.SetUser(Session["APP_DBUSER"].ToString());        

        string TemplateFile = "rpt_60250300_vat_invoice.xls";
        string TempFile = "../../../../system/temp/rpt_60250300_vat_invoice_" + Session["User_ID"].ToString() + ".xls";
        TemplateFile = Server.MapPath(TemplateFile);
        TempFile = Server.MapPath(TempFile);

        //Create a new workbook
        IWorkbook exBook = NativeExcel.Factory.OpenWorkbook(TemplateFile);

        //Add worksheet
        IWorksheet exSheet = exBook.Worksheets[1];

        IRange range;

        //bind data to excel file
		string p_tac_crca_pk = Request.QueryString["p_tac_crca_pk"];
		string para= "'" + p_tac_crca_pk + "'";
		
		

		DataTable dtMaster   = CtlLib.TableReadOpenCursor("ac_rpt_60250300_vatinvoice_mst", para);
		DataTable dtDetail   = CtlLib.TableReadOpenCursor("ac_rpt_60250300_vatinvoice_dtl", para);
		
        
		//set master data
		//day
		exSheet.Cells["D13"].Value = dtMaster.Rows[0]["dd"].ToString();
		//month
		exSheet.Cells["E13"].Value = dtMaster.Rows[0]["mm"].ToString();
		//year
		exSheet.Cells["G13"].Value = dtMaster.Rows[0]["yyyy"].ToString();
		//guest name 
		exSheet.Cells["D14"].Value = dtMaster.Rows[0]["recv_person"].ToString();
        //customer name
        exSheet.Cells["D15"].Value = dtMaster.Rows[0]["customer_name"].ToString();
		//tax code
		exSheet.Cells["D16"].Value = dtMaster.Rows[0]["taxcode"].ToString();
		//customer address
		exSheet.Cells["C17"].Value = dtMaster.Rows[0]["addr1"].ToString();
		//pay_method
		exSheet.Cells["D18"].Value = dtMaster.Rows[0]["pay_method"].ToString();
		
		//sub net total
		exSheet.Cells["H33"].Value = double.Parse(dtMaster.Rows[0]["net_amt"].ToString());
		//service charge amt
		exSheet.Cells["H34"].Value = double.Parse(dtMaster.Rows[0]["svc_amt"].ToString());
		//vat amt
		exSheet.Cells["H35"].Value = double.Parse(dtMaster.Rows[0]["vat_amt"].ToString());
		//total amt
		exSheet.Cells["H36"].Value = double.Parse(dtMaster.Rows[0]["total_amt"].ToString());
		
		//VAT RATE
		exSheet.Cells["HC5"].Value = 10;
		//number to VN words
		exSheet.Cells["A39"].Value = CommondLib.Num2VNText(dtMaster.Rows[0]["total_amt"].ToString(),"VND");
		
        //set detail data
		int l_pos = 22;
		int i = 0 ;
		
        for (i = 0; i < dtDetail.Rows.Count; i++)
        {
            //exSheet.Cells[l_pos+i,1].Value =i+1;
			exSheet.Cells[l_pos+i,2].Value = dtDetail.Rows[i]["item_name"].ToString(); //item name
			
			//exSheet.Cells[l_pos+i,4].Value = dtDetail.Rows[i]["item_uom"].ToString(); //unit
			//exSheet.Cells[l_pos+i,5].Value = dtDetail.Rows[i]["qty"].ToString(); //qty
			//exSheet.Cells[l_pos+i,6].Value = dtDetail.Rows[i]["u_price"].ToString(); //price
			
			exSheet.Cells[l_pos+i,8].Value = double.Parse(dtDetail.Rows[i]["amt"].ToString()); //net amt
		}	
		
        if (File.Exists(TempFile))
        {
            File.Delete(TempFile);
        }
        

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

}