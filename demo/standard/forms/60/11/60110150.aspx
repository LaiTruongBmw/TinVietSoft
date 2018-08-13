<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Returned Goods Inventory</title>
    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<script type="text/javascript" language="javascript">
var iSeq 			= 0,
	ivoucherno 		= 1,
	itr_date		= 2,
	iorder_no		= 3,
	iinv_no			= 4,
	iinv_date		= 5,
	iserial_no		= 6,
	ipartner_id		= 7,
	ipartner_name	= 8,
	iremark			= 9,
	iaccd_dr		= 10,
	iaccd_cr1		= 11,
	accd_cr2		= 12,
	item_code		= 13,
	iuom			= 14,
	iqty			= 15,
	icost_price		= 16 ,
	icost_amt		= 17,
	iu_price		= 18,
	inet_tr_amt		= 19,
	itr_rate		= 20,
	inet_bk_amt		= 21,
	ivat_rate		= 22,
	ivat_tr_amt		= 23,
	ivat_bk_amt		= 24,
	itrans_amt		= 25,
	ibooks_amt		= 26,
	itr_type		= 27,
	itr_status		= 28,
	ipl_unit 		= 29,
	iNation			= 30;
	
	
function BodyInit()
{
	//System.Translate(document);
    BindingDataList();

    MergeHeader();
	
	txtUser_Pk.text = "<%=Session("USER_PK")%>";
    dso_getCompany.Call();
}

function BindingDataList()
{
    var ls_comp         = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
	var ls_Report    = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACBK050') FROM DUAL")%>";
    
    
    lstNation.SetDataText(ls_Nation);
    lstNation.value='ALL';
    lstCompany.SetDataText(ls_comp);
	lstReport_Type.SetDataText(ls_Report);
    //lstVOUCHER_TYPE.SetDataText(ls_voucher);
    //lstTR_TYPE.SetDataText(ls_tr_type);
    //lstVOUCHER_TYPE.SetDataText("AR");
    dtTransFr.value =  dtTransTo.value.substr(0, 6) + "01";
	txtPartnerCD.SetEnable(false);
	txtPartnerNM.SetEnable(false);
}
function GetCustomer()
{
    var fpath   = System.RootURL + "/standard/forms/gf/co/ffbp00031.aspx?Company_pk="+lstCompany.value;
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
			var i, l_tot_bk_amt = 0, l_tot_tr_amt = 0, l_tot_qty = 0;
			var l_tot_cost_amt = 0 ;
			for( i = 2; i < idGrid.rows; i++)
			{
			    l_tot_bk_amt += Number(idGrid.GetGridData(i, inet_bk_amt));   
			    l_tot_tr_amt += Number(idGrid.GetGridData(i, inet_tr_amt));
			    l_tot_qty += Number(idGrid.GetGridData(i, iqty));
				l_tot_cost_amt += Number(idGrid.GetGridData(i, icost_amt));
			}
			idGrid.AddRow();
			idGrid.SetGridText(idGrid.rows - 1, iSeq, 'TOTAL');
			idGrid.SetGridText(idGrid.rows - 1, inet_tr_amt, l_tot_tr_amt);
			idGrid.SetGridText(idGrid.rows - 1, inet_bk_amt, l_tot_bk_amt);
			idGrid.SetGridText(idGrid.rows - 1, iqty, l_tot_qty);
			idGrid.SetGridText(idGrid.rows - 1, icost_amt, l_tot_cost_amt);
			idGrid.SetCellBgColor(idGrid.rows-1, 0,idGrid.rows-1,idGrid.cols-1,0xA9EBD7);
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
		l_tr_type = idGrid.GetGridData(idGrid.row, itr_type );
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
	
	fg.MergeCol(iSeq) = true;
	fg.Cell(0, 0, iSeq, 1, iSeq) = "Seq";
	fg.ColWidth(iSeq) = 1000;
	
	fg.Cell(0, 0, ivoucherno, 0, itr_date) = "Voucher";
	fg.Cell(0, 1, ivoucherno, 1, ivoucherno) = "No";
	fg.Cell(0, 1, itr_date, 1, itr_date) = "Date";	
	fg.ColWidth(ivoucherno) = 1500;
	fg.ColWidth(itr_date) = 1200;
	
	fg.MergeCol(iorder_no) = true;
	fg.Cell(0, 0, iorder_no, 1, iorder_no) = "Order No";
	fg.ColWidth(iorder_no) = 1300;
	
	fg.Cell(0, 0, iinv_no, 0, iserial_no) = "VAT Declaration";
	fg.Cell(0, 1, iinv_no, 1, iinv_no) = "No";
	fg.Cell(0, 1, iinv_date, 1, iinv_date) = "Date";
	fg.Cell(0, 1, iserial_no, 1, iserial_no) = "Serial No";
	fg.ColWidth(iinv_no) = 1200;
	fg.ColWidth(iinv_date) = 1200;
	fg.ColWidth(iserial_no) = 1200;	
	
	fg.Cell(0, 0, ipartner_id, 0, ipartner_name) = "Customer";
	fg.Cell(0, 1, ipartner_id, 1, ipartner_id) = "Code";
	fg.Cell(0, 1, ipartner_name, 1, ipartner_name) = "Name";
	fg.ColWidth(ipartner_id) = 1200;
	fg.ColWidth(ipartner_name) = 2000;
	
	fg.MergeCol(iremark) = true;
	fg.Cell(0, 0, iremark, 1, iremark) = "Description";
	fg.ColWidth(iremark) = 2000;
	
	fg.MergeCol(iaccd_dr) = true;
	fg.Cell(0, 0, iaccd_dr, 1, iaccd_dr) = "Debit";
	fg.ColWidth(iaccd_dr) = 1000;
	
	fg.Cell(0, 0, iaccd_cr1, 0, accd_cr2) = "Credit";
	fg.Cell(0, 1, iaccd_cr1, 1, iaccd_cr1) = "Credit";
	fg.Cell(0, 1, accd_cr2, 1, accd_cr2) = "Credit";
	fg.ColWidth(iaccd_cr1) = 1000;
	fg.ColWidth(accd_cr2) = 1000;
	
	fg.MergeCol(item_code) = true;
	fg.Cell(0, 0, item_code, 1, item_code) = "Code finished good";
	fg.ColWidth(item_code) = 1400;
	
	fg.MergeCol(iuom) = true;
	fg.Cell(0, 0, iuom, 1, iuom) = "Unit";
	fg.ColWidth(iuom) = 800;
	
	fg.MergeCol(iqty) = true;
	fg.Cell(0, 0, iqty, 1, iqty) = "Quantity";
	fg.ColWidth(iqty) = 1200;
	
	fg.MergeCol(icost_price) = true;
	fg.Cell(0, 0, icost_price, 1, icost_price) = "Cost Price";
	fg.ColWidth(icost_price) = 1300;

	fg.MergeCol(icost_amt) = true;
	fg.Cell(0, 0, icost_amt, 1, icost_amt) = "Cost Amt";
	fg.ColWidth(icost_amt) = 1200;

	fg.MergeCol(iu_price) = true;
	fg.Cell(0, 0, iu_price, 1, iu_price) = "Price";
	fg.ColWidth(iu_price) = 1200;
	
	fg.MergeCol(inet_tr_amt) = true;
	fg.Cell(0, 0, inet_tr_amt, 1, inet_tr_amt) = "Amount (Trans)";
	fg.ColWidth(inet_tr_amt) = 1500;
	
	fg.MergeCol(itr_rate) = true;
	fg.Cell(0, 0, itr_rate, 1, itr_rate) = "Exchange rate";
	fg.ColWidth(itr_rate) = 1500;
	
	fg.MergeCol(inet_bk_amt) = true;
	fg.Cell(0, 0, inet_bk_amt, 1, inet_bk_amt) = "Amount (Books)";
	fg.ColWidth(inet_bk_amt) = 1500;
	
	fg.Cell(0, 0, ivat_rate, 0, ivat_bk_amt) = "VAT";
	fg.Cell(0, 1, ivat_rate, 1, ivat_rate) = "rate(%)";
	fg.Cell(0, 1, ivat_tr_amt, 1, ivat_tr_amt) = "Trans";
	fg.Cell(0, 1, ivat_bk_amt, 1, ivat_bk_amt) = "Books";	
	fg.ColWidth(ivat_rate) = 1000;
	fg.ColWidth(ivat_tr_amt) = 1500;
	fg.ColWidth(ivat_bk_amt) = 1500;
	
	fg.Cell(0, 0, itrans_amt, 0, ibooks_amt) = "Grand total";
	fg.Cell(0, 1, itrans_amt, 1, itrans_amt) = "Trans";
	fg.Cell(0, 1, ibooks_amt, 1, ibooks_amt) = "Books";
	fg.ColWidth(itrans_amt) = 1500;
	fg.ColWidth(ibooks_amt) = 1500;
	
	fg.Cell(13, 1, iSeq, 1, itr_status) = true;

    fg.MergeCol(itr_type) = true;
	fg.Cell(0, 0, itr_type, 1, itr_type) = "AR Type";
	
    fg.MergeCol(ipl_unit) = true;
	fg.Cell(0, 0, ipl_unit, 1, ipl_unit) = "PL Unit";
	
    fg.MergeCol(iNation) = true;
	fg.Cell(0, 0, iNation, 1, iNation) = "Nation";
}
//-----------------------------------------------------------------------------------
function FormatGrid()
{
	var fg = idGrid.GetGridControl();
	fg.ColFormat(iqty) = "#,###,###,###,###,###,###.##R";
	fg.ColFormat(iu_price) = "#,###,###,###,###,###,###.##R";
	fg.ColFormat(icost_price) = "#,###,###,###,###,###,###.##R";
	fg.ColFormat(icost_amt) = "#,###,###,###,###,###,###.##R";
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
	switch(lstReport_Type.value)
	{
		case 'AS':
			//var url = System.RootURL + '/standard/reports/gf/ca/ARHistoryDetails.aspx?tco_company_pk=' + lstCompany.value + '&tr_date_fr=' + dtTransFr.value + '&tr_date_to=' + dtTransTo.value + '&tr_type=' + lstTrType.value + '&tco_buspartner_pk=' + txtPartner_PK.text + '&tr_status=' + lstStatus.value + "&tac_hgtrh_pk=" + txtSeq.text + "&voucherno=" + txtVoucherNo.text + "&invoice_no=" + txtInvNo.text + '&Item_pk=' + txtItem_Pk.text + '&PLUnit=' + txtPL_Pk.text + '&Nation=' + lstNation.value ; 
			var url = System.RootURL + '/standard/reports/gf/ca/ARHistoryDetails.aspx?tco_company_pk=' + lstCompany.value + '&tr_date_fr=' + dtTransFr.value + '&tr_date_to=' + dtTransTo.value + '&tr_type=' + lstTrType.value + '&tco_buspartner_pk=' + txtPartner_PK.text + '&tr_status=' + lstStatus.value + "&tac_hgtrh_pk=" + txtSeq.text + "&voucherno=" + txtVoucherNo.text + "&invoice_no=" + txtInvNo.text ; 
		break ;	
        case '02':
            var url = System.RootURL + '/standard/reports/gf/ca/gfca00030_AccCode_Item.aspx?tco_company_pk=' + lstCompany.value + '&tr_date_fr=' + dtTransFr.value + '&tr_date_to=' + dtTransTo.value + '&tr_type=' + lstTrType.value + '&tco_buspartner_pk=' + txtPartner_PK.text + '&tr_status=' + lstStatus.value + "&tac_hgtrh_pk=" + txtSeq.text + "&voucherno=" + txtVoucherNo.text + "&invoice_no=" + txtInvNo.text + '&Item_pk=' + txtItem_Pk.text + '&PLUnit=' + txtPL_Pk.text + '&Nation=' + lstNation.value ; 
        break;
        case '03':
            var url = System.RootURL + '/standard/reports/gf/ca/gfca00030_AccCode_Cus_Item.aspx?tco_company_pk=' + lstCompany.value + '&tr_date_fr=' + dtTransFr.value + '&tr_date_to=' + dtTransTo.value + '&tr_type=' + lstTrType.value + '&tco_buspartner_pk=' + txtPartner_PK.text + '&tr_status=' + lstStatus.value + "&tac_hgtrh_pk=" + txtSeq.text + "&voucherno=" + txtVoucherNo.text + "&invoice_no=" + txtInvNo.text + '&Item_pk=' + txtItem_Pk.text + '&PLUnit=' + txtPL_Pk.text + '&Nation=' + lstNation.value ; 
        break;
        case '04':
            var url = System.RootURL + '/standard/reports/gf/ca/gfca00030_AR_His.aspx?tco_company_pk=' + lstCompany.value + '&tr_date_fr=' + dtTransFr.value + '&tr_date_to=' + dtTransTo.value + '&tr_type=' + lstTrType.value + '&tco_buspartner_pk=' + txtPartner_PK.text + '&tr_status=' + lstStatus.value + "&tac_hgtrh_pk=" + txtSeq.text + "&voucherno=" + txtVoucherNo.text + "&invoice_no=" + txtInvNo.text + '&Item_pk=' + txtItem_Pk.text + '&PLUnit=' + txtPL_Pk.text + '&Nation=' + lstNation.value ; 
        break;
	}
    System.OpenTargetPage(url);     
}
//-----------------------------------------------------------------------------------
function OnPopUp(obj)
{
    switch(obj)
    {
        case 'PL_Unit':
            var fpath   = System.RootURL + "/standard/forms/60/01/60010080_popup_plunit.aspx?";
          var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
            // var object=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
          var tmp;
            if ( object != null )  
            {
                if (object[0] != 0)
                {
                    txtPL_Pk.text=object;     // Center PK
                    dat_gfka00220_2.Call();
                }            
            }    

        break;
        case 'Item':        
            var path = System.RootURL + "/standard/forms/fm/gf/PopUpGetOneItem.aspx?purchase_yn=&item_code=" + txtItem_Cd.text + "&item_name=" + txtItem_Nm.text ;
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
            if(object != null)
            {
                txtItem_Pk.text = object[0] ;
                txtItem_Cd.text = object[1];
                txtItem_Nm.text = object[2];
            }                        
        break;

    }
}
</script>
<!------------------------------------------------>
<body style="margin:0; padding:0;">
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="list" procedure="ac_sel_60110150_1" > 
			<input> 
				 <input bind="txtUser_Pk"/>
			</input>
			<output>
				 <output bind="lstCompany"/>
		   </output> 
		</dso> 
	</xml> 
</gw:data>
    <gw:data id="dso_arhistory_details" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="ac_SEL_60110150_DTL"  > 
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
                    <input bind="txtItem_Pk"/>
                    <input bind="txtPL_Pk"/>
                    <input bind="lstNation"/>
                    
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>
<!-------------------------------------->
<gw:data id="dat_gfka00220_2" onreceive=""  > 
        <xml>
            <dso  type="process"   procedure="ac_sel_60110150_2"  > 
                <input>
                    <input bind="txtPL_Pk" />
                </input> 
                <output>
                    <output bind="txtPL_Cd" />
                    <output bind="txtPL_Nm" />
                </output>
            </dso> 
        </xml> 
   </gw:data>

<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%" >
	<tr style="height:5%">
		<td align="right" width='13%'>Company&nbsp;</td>
		<td align="" width='30%'><gw:list id="lstCompany" styles="width:100%" /></td>
		<td align="right" width='12%'><a title="Click here to show Customer" onclick="GetCustomer()" href="#tips" ><b>Customer&nbsp;</b></a></td>
        <td width='30%'>
            <table width='100%' cellpadding='0' cellspacing='0'>
                <tr>
                    <td width='35%'><gw:textbox id="txtPartnerCD" styles='width:100%' text='' /></td>
		            <td width='65%'><gw:textbox id="txtPartnerNM" styles='width:100%' text='' /></td>
		            <td ><gw:imgBtn id="ibtnReset" img="reset"  alt="Reset"  onclick="OnReset()" /></td>
                </tr>
            </table>
        </td>
		<td align="right" width='15%'>Trans date&nbsp;</td>
        <td>
            <table width='100%' cellpadding='0' cellspacing='0'>
                <tr>
                    <td align="left"><gw:datebox id="dtTransFr" lang="1" /></td>
		            <td>~</td>
		            <td align="left"><gw:datebox id="dtTransTo" lang="1" /></td>	
                    <td width='100%'></td>	
                </tr>
            </table>
        </td>
        <td align="right"><gw:imgBtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()"/></td>
        <td align="left"><gw:imgBtn id="ibtnExcel" img="excel"  alt="Print"  onclick="OnExcel()"/></td>
	</tr>
	<tr style="height:5%">
        <td align="right" colspan="">Origin Source&nbsp;</td>
        <td>
            <table width='100%' cellpadding='0' cellspacing='0'>
                <tr>
                    <td width='40%'><gw:list id="lstTrType" styles="width:100%" onchange="OnSearch()" >
		            <data>DATA|DO|Domestic|OS|Foreign|ALL|Select all</data>
		            </gw:list>
		            </td>	
                    <td align="right" width='20%'>Status&nbsp;</td>
		            <td align="" width='40%'><gw:list id="lstStatus" styles="width:100%" onchange="OnSearch()" >
		            <data>DATA|2|Confirmed|0|Approved|4|NApp|ALL|Select All</data>
		            </gw:list>
		            </td>
                </tr>
            </table>
        </td>
		
        <td align="right"><a title="Click here to show Item" onclick="OnPopUp('Item')" href="#tips" >Item&nbsp;</a></td>
        <td>
            <table width='100%' cellpadding='0' cellspacing='0'>
                <tr>
                    <td width='35%'><gw:textbox id="txtItem_Cd" styles='width:100%' text='' /></td>
		            <td width='65%'><gw:textbox id="txtItem_Nm" styles='width:100%' text='' /></td>
                    <td ><gw:textbox id="txtItem_Pk" styles='width:;display:none' text='' /></td>
		            <td ><gw:imgBtn id="ibtnReset" img="reset"  alt="Reset"  onclick="txtItem_Cd.text='';txtItem_Nm.text='';txtItem_Pk.text='';" /></td>
                </tr>
            </table>
        </td>
		<td align="right">Seq/Vou. No&nbsp;</td>
        <td colspan='3'>
            <table width='100%' cellpadding='0' cellspacing='0'>
                <tr>
                    <td align="" width='25%'><gw:textbox id="txtSeq" text="" styles="width:100%" onenterkey="OnSearch()" /></td>
		            <td align="" colspan="" width='25%'><gw:textbox id="txtVoucherNo" text="" styles="width:100%" onenterkey="OnSearch()" /></td>
                    <td align="right" width='25%' style='white-space:nowrap'>Invoice No&nbsp;</td>
		            <td align="" width='25%'><gw:textbox id="txtInvNo" styles="width:100%" onenterkey="OnSearch()" /></td>
                </tr>
            </table>
        </td>
		
	</tr>
	<tr style="height:5%">
		<td width='' align="right">Nation&nbsp;</td>
		<td width=''><gw:list id="lstNation" styles="width:100%" onchange="" /></td>
        <td align="right"><a title="Click here to show PL Unit" onclick="OnPopUp('PL_Unit')" href="#tips" >PL Unit&nbsp;</a></td>
        <td colspan=''> 
            <table width='100%' cellpadding='0' cellspacing='0'>
                <tr>
                    <td width='35%'><gw:textbox id="txtPL_Cd" styles='width:100%' text='' /></td>
		            <td width='65%'><gw:textbox id="txtPL_Nm" styles='width:100%' text='' /></td>
                    <td ><gw:textbox id="txtPL_Pk" styles='width:;display:none' text='' /></td>
		            <td ><gw:imgBtn id="ibtnReset" img="reset"  alt="Reset"  onclick="txtPL_Cd.text='';txtPL_Nm.text='';txtPL_Pk.text='';" /></td>
                    
                </tr>
            </table>
        </td>
        
		<td align="right" >Report Type&nbsp;</td>
		<td colspan='3'><gw:list id="lstReport_Type" styles="width:100%" onchange="" /></td>
	</tr>
	<tr style="height:90%">
		<td colspan="12">
			<gw:grid
				id="idGrid"
				header  ="Seq|Voucher No|Trans date|Order No|Invoice No|Invoice date|Serial No|Cust Code|Cust Name|Description|Debit|Credit 1|Credit 2|FG Item Code|Unit|Qty|Cost Price|Cost Amt|Price|Trans Amt|Ex Rate|Book Amt|Vat(%)|Vat Trans|Vat Book|Trans total|Book total|AR Type|_tr_status|PL Unit|Nation"
				format  ="0|0|4|0|0|4|0|0|0|0|0|0|0|0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0|0|0|0"
				aligns  ="1|1|1|1|1|1|1|1|0|0|1|1|1|1|1|3|3|3|3|3|3|3|1|3|3|3|3|0|0|0|0"
				defaults="||||||||||||||||||||||||||||||"
				editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				widths  ="1000|1400|1200|1300|1400|1200|1200|1000|2000|2000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1400|1200|1500|1200|1400|1500|2000|2000|1500|0|2000|2000"
				styles  ="width:100%; height:100%"
				oncelldblclick=""
				sorting ="F" />        
		</td>
	</tr>
</table>	
<gw:textbox id="txtPartner_PK" styles="display:none; " />
<gw:textbox id="txtUser_Pk" styles="display:none; " />
</body>
</html>