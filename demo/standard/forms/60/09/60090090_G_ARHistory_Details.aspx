<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>
    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">
var iSeq 			= 0,
	ivoucherno 		= 1,
	itr_date		= 2,
	iinv_no			= 3,
	iinv_date		= 4,
	iserial_no		= 5,
	ipartner_id		= 6,
	ipartner_name	= 7,
	iremark			= 8,
	iaccd_dr		= 9,
	iaccd_cr1		= 10,
	accd_cr2		= 11,
	item_code		= 12,
	iuom			= 13,
	iqty			= 14,
	iu_price		= 15,
	inet_tr_amt		= 16,
	itr_rate		= 17,
	inet_bk_amt		= 18,
	ivat_rate		= 19,
	ivat_tr_amt		= 20,
	ivat_bk_amt		= 21,
	itrans_amt		= 22,
	ibooks_amt		= 23,
	itr_type		= 24,
	itr_status		= 25;
	
function BodyInit()
{
	//System.Translate(document);
	BindingDataList();

    MergeHeader();
}

function BindingDataList()
{
    var ls_comp         = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_comp);
    //lstVOUCHER_TYPE.SetDataText(ls_voucher);
    //lstTR_TYPE.SetDataText(ls_tr_type);
    //lstVOUCHER_TYPE.SetDataText("AR");
    dtTransFr.value =  dtTransTo.value.substr(0, 6) + "01";
    //var ls_data      = "<%=CtlLib.SetListDataFUNC("SELECT ACNT.SF_A_GET_COMMONCODE('GFQC0027') FROM DUAL")%>";
    //lstReport.SetDataText(ls_data);
	txtPartnerCD.SetEnable(false);
	txtPartnerNM.SetEnable(false);
}
function GetCustomer()
{
    var fpath   = System.RootURL + "/standard/forms/60/09/60090010_vendor_popup.aspx";
    var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
    if ( object != null )  
    {
        if (object[0] != "")
        {
            txtPartner_PK.text = object[0];
            txtPartnerCD.text = object[1];
            txtPartnerNM.text = object[2];                
         }
     }
}

/*function OnResetCust(ind)
{
    txtCUST_PK.text = "";
    txtCUST_ID.text = "";
    txtCUST_NM.text = "";
}*/

function OnSearch()
{
	dso_arhistory_details.Call("SELECT");
}

function OnDataReceive(iObj)
{
	switch(iObj.id)
	{
		case 'dso_arhistory_details':
			MergeHeader();
			var i , l_sum_tramt = 0; l_sum_bkamt = 0, l_sum_qty = 0;
			var l_newrow ;
			for(i = 2; i < idGrid.rows; i++)
			{
				l_sum_qty += Number(idGrid.GetGridData(i, iqty));
				l_sum_tramt += Number(idGrid.GetGridData(i, itrans_amt));
				l_sum_bkamt += Number(idGrid.GetGridData(i, ibooks_amt));				
			}
			idGrid.AddRow();
			l_newrow = idGrid.rows - 1;
              idGrid.SetGridText(i, 0, "TOTAL");
              idGrid.SetCellBgColor(l_newrow, 0, l_newrow, idGrid.cols-1, 0xA9EBD7);			
            idGrid.SetGridText(l_newrow, iqty, l_sum_qty);  
			idGrid.SetGridText(l_newrow, iqty, l_sum_qty);
			idGrid.SetGridText(l_newrow, itrans_amt, l_sum_tramt);
			idGrid.SetGridText(l_newrow, 2, "" );	
			idGrid.SetGridText(l_newrow, 4, "" );						
		break ;
	}
}

function OnReset()
{
	txtPartnerCD.text = '';
	txtPartnerNM.text = '';
	txtPartner_PK.text = '';
}
function OnPoupClick()
{
	var l_tr_type = '', l_seq = '', l_tr_date_fr = '', l_tr_status = '';
	if(idGrid.row > 1)
	{
		/*l_tr_type = idGrid.GetGridData(idGrid.row, itr_type );
		l_seq = idGrid.GetGridData(idGrid.row, iSeq );
		l_tr_date_fr = idGrid.GetGridData(idGrid.row, itr_date );
		l_tr_status = idGrid.GetGridData(idGrid.row, itr_status );
		if(l_tr_type == 'Domestic')
			System.Menu.NewWindow( "form/gf/ca/gfca00010.aspx?tac_hgtrh_pk=" + l_seq + "&trans_dt_fr=" + l_tr_date_fr + "&tr_status=" + l_tr_status , "AR Domestic", "AR Domestic", "AR Domestic" );        
		else
			System.Menu.NewWindow( "form/gf/ca/gfca00020.aspx?tac_hgtrh_pk=" + l_seq + "&trans_dt_fr=" + l_tr_date_fr + "&tr_status=" + l_tr_status , "AR Foreign", "AR Foreign", "AR Foreign" );
		//var mst_pk = grdMaster.GetGridData(grdMaster.row,0);
		//var fpath   = System.RootURL + "/standard/forms/gf/ca/gfca00030_view.aspx?mst_pk=" + mst_pk;
        //var object  = System.OpenModal(fpath , 1000 , 600 , 'resizable:yes;status:yes');	
		*/
	}	
}

function MergeHeader()
{
	var fg=idGrid.GetGridControl();
	
	if(fg.rows == 1)
	{
		idGrid.AddRow();
	}
	fg.FixedRows = 2; 
	fg.MergeCells = 5; 
	fg.MergeRow(0) = true;
	
	fg.MergeCol(0) = true;
	fg.Cell(0, 0, 0, 1, 0) = "Seq";
	fg.ColWidth(0) = 1000;
	fg.Cell(0, 0, 1, 0, 2) = "Voucher";
	fg.Cell(0, 1, 1, 1, 1) = "No";
	fg.Cell(0, 1, 2, 1, 2) = "Date";
	fg.ColWidth(0) = 1000;
	fg.ColWidth(1) = 1500;
	fg.ColWidth(2) = 1200;
	fg.Cell(0, 0, 3, 0, 5) = "VAT Declaration";
	fg.Cell(0, 1, 3, 1, 3) = "No";
	fg.Cell(0, 1, 4, 1, 4) = "Date";
	fg.Cell(0, 1, 5, 1, 5) = "Serial No";
	fg.ColWidth(3) = 1200;
	fg.ColWidth(4) = 1200;
	fg.ColWidth(5) = 1200;	
	fg.Cell(0, 0, 6, 0, 7) = "Customer";
	fg.Cell(0, 1, 6, 1, 6) = "Code";
	fg.Cell(0, 1, 7, 1, 7) = "Name";
	fg.ColWidth(6) = 1200;
	fg.ColWidth(7) = 2000;	
	fg.MergeCol(8) = true;
	fg.Cell(0, 0, 8, 1, 8) = "Description";
	fg.ColWidth(8) = 2000;
	fg.MergeCol(9) = true;
	fg.Cell(0, 0, 9, 1, 9) = "Debit";
	fg.ColWidth(9) = 1000;
	fg.Cell(0, 0, 10, 0, 11) = "Credit";
	fg.Cell(0, 1, 10, 1, 10) = "Credit";
	fg.Cell(0, 1, 11, 1, 11) = "Credit";
	fg.ColWidth(10) = 1000;
	fg.ColWidth(11) = 1000;
	fg.MergeCol(12) = true;
	fg.Cell(0, 0, 12, 1, 12) = "Code finish good";
	fg.ColWidth(12) = 1400;
	fg.MergeCol(13) = true;
	fg.Cell(0, 0, 13, 1, 13) = "Unit";
	fg.ColWidth(13) = 800;
	fg.MergeCol(14) = true;
	fg.Cell(0, 0, 14, 1, 14) = "Quantity";
	fg.ColWidth(14) = 1200;
	fg.MergeCol(15) = true;
	fg.Cell(0, 0, 15, 1, 15) = "Price";
	fg.ColWidth(15) = 1200;
	fg.MergeCol(16) = true;
	fg.Cell(0, 0, 16, 1, 16) = "Amount (Trans)";
	fg.ColWidth(16) = 1500;
	fg.MergeCol(17) = true;
	fg.Cell(0, 0, 17, 1, 17) = "Exchange rate";
	fg.ColWidth(17) = 1500;
	fg.MergeCol(18) = true;
	fg.Cell(0, 0, 18, 1, 18) = "Amount (Books)";
	fg.ColWidth(18) = 1500;
	fg.Cell(0, 0, 19, 0, 21) = "VAT";
	fg.Cell(0, 1, 19, 1, 19) = "rate(%)";
	fg.Cell(0, 1, 20, 1, 20) = "Trans";
	fg.Cell(0, 1, 21, 1, 21) = "Books";
	fg.ColWidth(19) = 1000;
	fg.ColWidth(20) = 1500;
	fg.ColWidth(21) = 1500;
	fg.Cell(0, 0, 22, 0, 23) = "Grandtotal";
	fg.Cell(0, 1, 22, 1, 22) = "Trans";
	fg.Cell(0, 1, 23, 1, 23) = "Books";
	fg.ColWidth(22) = 1500;
	fg.ColWidth(23) = 1500;
	fg.Cell(13, 1, 0, 1, 23) = true;
}
//-----------------------------------------------------------------------------------
function FormatGrid()
{
	var fg = idGrid.GetGridControl();
	fg.ColFormat(iqty) = "#,###,###,###,###,###,###.##R";
	fg.ColFormat(iu_price) = "#,###,###,###,###,###,###.##R";
	fg.ColFormat(inet_tr_amt) = "#,###,###,###,###,###,###.##R";
	fg.ColFormat(itr_rate) = "#,###,###,###,###,###,###.##R";
	fg.ColFormat(inet_bk_amt) = "#,###,###,###,###,###,###";
	fg.ColFormat(ivat_tr_amt) = "#,###,###,###,###,###,###.##R";
	fg.ColFormat(ivat_bk_amt) = "#,###,###,###,###,###,###.##R";
	fg.ColFormat(itrans_amt) = "#,###,###,###,###,###,###.##R";
	fg.ColFormat(ibooks_amt) = "#,###,###,###,###,###,###R";
}
//-----------------------------------------------------------------------------------
// Report Bang thong ke hang ban'
function OnExcel()
{  
			var url = System.RootURL + '/standard/reports/gf/ca/ARHistoryDetails.aspx?tco_company_pk=' + lstCompany.value + '&tr_date_fr=' + dtTransFr.value + '&tr_date_to=' + dtTransTo.value + '&tr_type=' + lstTrType.value + '&tco_buspartner_pk=' + txtPartner_PK.text + '&tr_status=' + lstStatus.value + "&tac_hgtrh_pk=" + txtSeq.text + "&voucherno=" + txtVoucherNo.text + "&invoice_no=" + txtInvNo.text ; 
			System.OpenTargetPage(url);        			
}
//-----------------------------------------------------------------------------------
</script>
<!------------------------------------------------>
<body style="margin:0; padding:0;">
    <gw:data id="dso_arhistory_details" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="ac_sel_60090090_ar_history_dtl"  > 
                <input bind="idGrid" >   
				    <input bind="lstCompany"/>          
                    <input bind="txtPartner_PK"/>
                    <input bind="dtTransFr"/>
                    <input bind="dtTransTo"/>
                    <input bind="lstStatus"/>
                    <input bind="lstTrType"/>
					<input bind="txtSeq"/>
					<input bind="txtVoucherNo"/>
					<input bind="txtInvNo"/>
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>
<!-------------------------------------->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%" >
	<tr>
		<td width="10%"></td>
        <td width="15%"></td>
        <td width="10%"></td>
        <td width="7%"></td>
        <td width="16%"></td>
		<td width="2%"></td>
        <td width="10%"></td>
        <td width="10%"></td>
        <td width="2%"></td>
        <td width="10%"></td>
        <td width="5%"></td>
        <td width="3%"></td>
	</tr>
	<tr style="height:5%">
		<td align="right">Company</td>
		<td align="right"><gw:list id="lstCompany" styles="width:100%" /></td>
		<td align="right"><a title="Click here to show Customer" onclick="GetCustomer()" href="#tips" ><b>Customer</b></a></td>
        <td ><gw:textbox id="txtPartnerCD" styles='width:100%' text='' /></td>
		<td ><gw:textbox id="txtPartnerNM" styles='width:100%' text='' /></td>
		<td ><gw:imgBtn id="ibtnReset" img="reset"  alt="Reset"  onclick="OnReset()" /></td>
		<td align="right">Trans date</td>
		<td align="left"><gw:datebox id="dtTransFr" lang="1" /></td>
		<td>~</td>
		<td align="left"><gw:datebox id="dtTransTo" lang="1" /></td>		
        <td align="right"><gw:imgBtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()"/></td>
        <td align="left"><gw:imgBtn id="ibtnExcel" img="excel"  alt="Print"  onclick="OnExcel()"/></td>
	</tr>
	<tr style="height:5%">
		<td align="right">Status</td>
		<td align="left"><gw:list id="lstStatus" styles="width:100%" onchange="OnSearch()" >
		<data>DATA|2|Confirmed|0|Approved|4|NApp|ALL|Select All</data>
		</gw:list>
		</td>
		<td align="right">Seq/Vou. No</td>
		<td align="left"><gw:textbox id="txtSeq" text="" styles="width:100%" onenterkey="OnSearch()" /></td>
		<td align="left" colspan="2"><gw:textbox id="txtVoucherNo" text="" styles="width:100%" onenterkey="OnSearch()" /></td>
		<td align="right" colspan="1">Origin Source</td>
		<td align="left" colspan="1"><gw:list id="lstTrType" styles="width:100%" onchange="OnSearch()" >
		<data>DATA|DO|Domestic|OS|Foreign|ALL|Select all</data>
		</gw:list>
		</td>	
	</tr>
	<tr style="height:90%">
		<td colspan="12">
			<gw:grid
				id="idGrid"
				header  ="Seq|Voucher No|Trans date|Invoice No|Invoice date|Serial No|Cust Code|Cust Name|Description|Debit|Credit 1|Credit 2|FG Item Code|Unit|Qty|Price|Trans Amt|Ex Rate|Book Amt|Vat(%)|Vat Trans|Vat Book|Trans total|Book total|AR Type|_tr_status"
				format  ="0|0|4|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				aligns  ="1|1|1|1|1|1|1|0|0|1|1|1|1|1|3|3|3|3|3|1|3|3|3|3|0|0"
				defaults="|||||||||||||||||||||||||"
				editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				widths  ="1000|1400|1200|1400|1200|1200|1000|2000|2000|1000|1000|1000|1000|1000|1000|1000|1400|1200|1500|1200|1400|1500|2000|2000|800|0"
				styles  ="width:100%; height:100%"
				oncelldblclick="OnPoupClick()"
				acceptNullDate="T"
				sorting ="F" />        
		</td>
	</tr>
</table>	
<gw:textbox id="txtPartner_PK" styles="display:none; " />
<gw:textbox id="txtInvNo" styles="width:100%; display:none; " onenterkey="OnSearch()" />
		<td align="left"><gw:list id="lstReport" styles="width:100%" /></td>

</body>
</html>