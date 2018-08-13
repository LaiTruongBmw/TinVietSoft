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
	iu_price		= 16,
	inet_tr_amt		= 17,
	itr_rate		= 18,
	inet_bk_amt		= 19,
	ivat_rate		= 20,
	ivat_tr_amt		= 21,
	ivat_bk_amt		= 22,
	itrans_amt		= 23,
	ibooks_amt		= 24,
	itr_type		= 25,
	itr_status		= 26;
	
function BodyInit()
{
	//System.Translate(document);
	
	 BindingDataList();
    MergeHeader();
	txtProposedByUserPk.text = "<%=Session("USER_PK")%>";
   dso_getCompany.Call();
  
}

function BindingDataList()
{
    var ls_comp         = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
	var ls_Report    = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACBK050') FROM DUAL")%>";
    var ls_Nation = "<%=CtlLib.SetListDataSQL(" select COUNTRY_no, COUNTRY_NM from tie_country a where  a.del_if = 0")%>|ALL|[SELECT ALL]"; 
    var ls_data = "<%=CtlLib.SetListDataSQL("select TRIM(CODE) code, A.CODE code_nm FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'ACBG0040' and A.def_yn = 'Y'")%>";    	
	//lstBook_Ccy.SetDataText(ls_data);	
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
    var fpath   = System.RootURL + "/standard/forms/60/08/60080030_popup_customer.aspx";
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
            FormatGrid();
			var i, l_tot_bk_amt = 0, l_tot_tr_amt = 0;
			for( i = 2; i < idGrid.rows; i++)
			{
			    l_tot_bk_amt += Number(idGrid.GetGridData(i, inet_bk_amt));   
			    l_tot_tr_amt += Number(idGrid.GetGridData(i, inet_tr_amt));
			}
			idGrid.AddRow();
			idGrid.SetGridText(idGrid.rows - 1, iSeq, 'TOTAL');
			idGrid.SetGridText(idGrid.rows - 1, inet_tr_amt, l_tot_tr_amt);
			idGrid.SetGridText(idGrid.rows - 1, inet_bk_amt, l_tot_bk_amt);
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
	fg.MergeCol(3) = true;
	fg.Cell(0, 0, 3, 1, 3) = "Order No";
	fg.ColWidth(0) = 1300;
	
	fg.Cell(0, 0, 4, 0, 6) = "VAT Declaration";
	fg.Cell(0, 1, 4, 1, 4) = "No";
	fg.Cell(0, 1, 5, 1, 5) = "Date";
	fg.Cell(0, 1, 6, 1, 6) = "Serial No";
	fg.ColWidth(4) = 1200;
	fg.ColWidth(5) = 1200;
	fg.ColWidth(6) = 1200;	
	fg.Cell(0, 0, 7, 0, 8) = "Customer";
	fg.Cell(0, 1, 7, 1, 7) = "Code";
	fg.Cell(0, 1, 8, 1, 8) = "Name";
	fg.ColWidth(7) = 1200;
	fg.ColWidth(8) = 2000;	
	fg.MergeCol(9) = true;
	fg.Cell(0, 0, 9, 1, 9) = "Description";
	fg.ColWidth(9) = 2000;
	fg.MergeCol(10) = true;
	fg.Cell(0, 0, 10, 1, 10) = "Debit";
	fg.ColWidth(10) = 1000;
	fg.Cell(0, 0, 11, 0, 12) = "Credit";
	fg.Cell(0, 1, 11, 1, 11) = "Credit";
	fg.Cell(0, 1, 12, 1, 12) = "Credit";
	fg.ColWidth(11) = 1000;
	fg.ColWidth(12) = 1000;
	fg.MergeCol(13) = true;
	fg.Cell(0, 0, 13, 1, 13) = "Code finished good";
	fg.ColWidth(13) = 1400;
	fg.MergeCol(14) = true;
	fg.Cell(0, 0, 14, 1, 14) = "Unit";
	fg.ColWidth(14) = 800;
	fg.MergeCol(15) = true;
	fg.Cell(0, 0, 15, 1, 15) = "Quantity";
	fg.ColWidth(15) = 1200;
	fg.MergeCol(16) = true;
	fg.Cell(0, 0, 16, 1, 16) = "Price";
	fg.ColWidth(16) = 1200;
	fg.MergeCol(17) = true;
	fg.Cell(0, 0, 17, 1, 17) = "Amount (Trans)";
	fg.ColWidth(17) = 1500;
	fg.MergeCol(18) = true;
	fg.Cell(0, 0, 18, 1, 18) = "Exchange rate";
	fg.ColWidth(18) = 1500;
	fg.MergeCol(19) = true;
	fg.Cell(0, 0, 19, 1, 19) = "Amount (Books)";
	fg.ColWidth(19) = 1500;
	fg.Cell(0, 0, 20, 0, 22) = "VAT";
	fg.Cell(0, 1, 20, 1, 20) = "rate(%)";
	fg.Cell(0, 1, 21, 1, 21) = "Trans";
	fg.Cell(0, 1, 22, 1, 22) = "Books";
	fg.ColWidth(20) = 1000;
	fg.ColWidth(21) = 1500;
	fg.ColWidth(22) = 1500;
	fg.Cell(0, 0, 23, 0, 24) = "Grand total";
	fg.Cell(0, 1, 23, 1, 23) = "Trans";
	fg.Cell(0, 1, 24, 1, 24) = "Books";
	fg.ColWidth(23) = 1500;
	fg.ColWidth(24) = 1500;
	fg.Cell(13, 1, 0, 1, 24) = true;

    fg.MergeCol(25) = true;
	fg.Cell(0, 0, 25, 1, 25) = "AR Type";
    fg.MergeCol(27) = true;
	fg.Cell(0, 0, 27, 1, 27) = "PL Unit";
    fg.MergeCol(28) = true;
	fg.Cell(0, 0, 28, 1, 28) = "Nation";
}
//-----------------------------------------------------------------------------------
function FormatGrid()
{
    var fg = idGrid.GetGridControl();
    if(lstBook_Ccy.value=='VND')
    {
        fg.ColFormat(iqty) = "#,###,###,###,###,###,###";
	    fg.ColFormat(iu_price) = "#,###,###,###,###,###,###";
	    fg.ColFormat(inet_tr_amt) = "#,###,###,###,###,###,###";
	    fg.ColFormat(itr_rate) = "#,###,###,###,###,###,###";
	    fg.ColFormat(inet_bk_amt) = "#,###,###,###,###,###,###";
	    fg.ColFormat(ivat_tr_amt) = "#,###,###,###,###,###,###";
	    fg.ColFormat(ivat_bk_amt) = "#,###,###,###,###,###,###";
	    fg.ColFormat(itrans_amt) = "#,###,###,###,###,###,###";
	    fg.ColFormat(ibooks_amt) = "#,###,###,###,###,###,###";
    }
    else
    {
        fg.ColFormat(iqty) = "#,###,###,###,###,###,###.##R";
	    fg.ColFormat(iu_price) = "#,###,###,###,###,###,###.##R";
	    fg.ColFormat(inet_tr_amt) = "#,###,###,###,###,###,###.##R";
	    fg.ColFormat(itr_rate) = "#,###,###,###,###,###,###.##R";
	    fg.ColFormat(inet_bk_amt) = "#,###,###,###,###,###,###.##R";
	    fg.ColFormat(ivat_tr_amt) = "#,###,###,###,###,###,###.##R";
	    fg.ColFormat(ivat_bk_amt) = "#,###,###,###,###,###,###.##R";
	    fg.ColFormat(itrans_amt) = "#,###,###,###,###,###,###.##R";
	    fg.ColFormat(ibooks_amt) = "#,###,###,###,###,###,###.##R";
    }
	
	
}
//-----------------------------------------------------------------------------------
// Report Bang thong ke hang ban'
function OnExcel()
{  
	switch(lstReport_Type.value)
	{
		case 'AS':
			var url = System.RootURL + '/standard/reports/60/11/rpt_60110070_ARHisDetails.aspx?tco_company_pk=' + lstCompany.value + '&tr_date_fr=' + dtTransFr.value + '&tr_date_to=' + dtTransTo.value + '&tr_type=' + lstTrType.value + '&tco_buspartner_pk=' + txtPartner_PK.text + '&tr_status=' + lstStatus.value + "&tac_hgtrh_pk=" + txtSeq.text + "&voucherno=" + txtVoucherNo.text + "&invoice_no=" + txtInvNo.text + '&Item_pk=' + txtItem_Pk.text + '&PLUnit=' + txtPL_Pk.text + '&Nation=' + lstNation.value ; 
		break ;	
        case '02':
            var url = System.RootURL + '/standard/reports/60/11/rpt_60110070_AccCode_Item.aspx?tco_company_pk=' + lstCompany.value + '&tr_date_fr=' + dtTransFr.value + '&tr_date_to=' + dtTransTo.value + '&tr_type=' + lstTrType.value + '&tco_buspartner_pk=' + txtPartner_PK.text + '&tr_status=' + lstStatus.value + "&tac_hgtrh_pk=" + txtSeq.text + "&voucherno=" + txtVoucherNo.text + "&invoice_no=" + txtInvNo.text + '&Item_pk=' + txtItem_Pk.text + '&PLUnit=' + txtPL_Pk.text + '&Nation=' + lstNation.value ; 
        break;
        case '03':
            var url = System.RootURL + '/standard/reports/60/11/rpt_60110070_AccCode_Cus_Item.aspx?tco_company_pk=' + lstCompany.value + '&tr_date_fr=' + dtTransFr.value + '&tr_date_to=' + dtTransTo.value + '&tr_type=' + lstTrType.value + '&tco_buspartner_pk=' + txtPartner_PK.text + '&tr_status=' + lstStatus.value + "&tac_hgtrh_pk=" + txtSeq.text + "&voucherno=" + txtVoucherNo.text + "&invoice_no=" + txtInvNo.text + '&Item_pk=' + txtItem_Pk.text + '&PLUnit=' + txtPL_Pk.text + '&Nation=' + lstNation.value ; 
        break;
        case '04':
            var url = System.RootURL + '/standard/reports/60/11/rpt_60110070_AR_His.aspx?tco_company_pk=' + lstCompany.value + '&tr_date_fr=' + dtTransFr.value + '&tr_date_to=' + dtTransTo.value + '&tr_type=' + lstTrType.value + '&tco_buspartner_pk=' + txtPartner_PK.text + '&tr_status=' + lstStatus.value + "&tac_hgtrh_pk=" + txtSeq.text + "&voucherno=" + txtVoucherNo.text + "&invoice_no=" + txtInvNo.text + '&Item_pk=' + txtItem_Pk.text + '&PLUnit=' + txtPL_Pk.text + '&Nation=' + lstNation.value ; 
        break;
		case '02INV':
            var url = System.RootURL + '/standard/reports/60/11/rpt_60110070_INV.aspx?tco_company_pk=' + lstCompany.value + '&tr_date_fr=' + dtTransFr.value + '&tr_date_to=' + dtTransTo.value + '&tr_type=' + lstTrType.value + '&tco_buspartner_pk=' + txtPartner_PK.text + '&tr_status=' + lstStatus.value + "&tac_hgtrh_pk=" + txtSeq.text + "&voucherno=" + txtVoucherNo.text + "&invoice_no=" + txtInvNo.text + '&Item_pk=' + txtItem_Pk.text + '&PLUnit=' + txtPL_Pk.text + '&Nation=' + lstNation.value ; 
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
            var fpath   = System.RootURL + "/standard/forms/60/01/60010080_plcenter.aspx?";
          var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
           
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
            var path = System.RootURL + "/standard/forms/60/08/60080030_popup_customer.aspx?purchase_yn=&item_code=" + txtItem_Cd.text + "&item_name=" + txtItem_Nm.text ;
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
    <gw:data id="dso_arhistory_details" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="ac_sel_60110070_history_dtl"  > 
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
            <dso  type="process"   procedure="ac_sel_60110070_SL"  > 
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

  <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="AC_pro_60020020_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
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
				header  ="Seq|Voucher No|Trans date|Order No|Invoice No|Invoice date|Serial No|Cust Code|Cust Name|Description|Debit|Credit 1|Credit 2|FG Item Code|Unit|Qty|Price|Trans Amt|Ex Rate|Book Amt|Vat(%)|Vat Trans|Vat Book|Trans total|Book total|AR Type|_tr_status|PL Unit|Nation"
				format  ="0|0|4|0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				aligns  ="1|1|1|1|1|1|1|1|0|0|1|1|1|1|1|3|3|3|3|3|1|3|3|3|3|0|0|0|0"
				defaults="||||||||||||||||||||||||||||"
				editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				widths  ="1000|1400|1200|1300|1400|1200|1200|1000|2000|2000|1000|1000|1000|1000|1000|1000|1000|1400|1200|1500|1200|1400|1500|2000|2000|1500|0|2000|2000"
				styles  ="width:100%; height:100%"
				oncelldblclick="OnPoupClick()"
				sorting ="F" />        
		</td>
	</tr>
</table>	
<gw:textbox id="txtPartner_PK" styles="display:none; " />
<gw:textbox id="txtUser_Pk"  styles='display:none' />
<gw:textbox id="txtProposedByUserPk"  styles='display:none' />

<gw:list id="lstBook_Ccy" styles="width:100%;display:none" onchange="" />
</body>
</html>