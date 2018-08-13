<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>DEBIT NOTES -O.P Penalty</title>
    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">
var iSeq 			= 0,
	iserial 		= 1,
	itr_date		= 2,
	iorder_no		= 3,
	idesciption		= 4,
	iAR		        = 5,
	icollection		= 6,
	ibalance		= 7,
	inot_over       = 8,
	iover1_30		= 9,
	iover31_60		= 10,
	iover61_90		= 11,
	iover90		    = 12;
	
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
	var ls_Report    = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACBG0204') FROM DUAL")%>";
    var ls_data = "<%=CtlLib.SetListDataSQL("select TRIM(CODE) code, A.CODE code_nm FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'ACBG0040' and A.def_yn = 'Y'")%>";    	
	//lstBook_Ccy.SetDataText(ls_data);	
    lstCompany.SetDataText(ls_comp);
	lstReport_Type.SetDataText(ls_Report);
    //lstVOUCHER_TYPE.SetDataText(ls_voucher);
    //lstTR_TYPE.SetDataText(ls_tr_type);
    //lstVOUCHER_TYPE.SetDataText("AR");
    dtTransFr.value =  dtTransTo.value.substr(0, 6) + "01";
	txtPartnerCD.SetEnable(false);
	txtPartnerNM.SetEnable(false);
}


function OnSearch()
{
	dso_debit_note.Call("SELECT");
}

function OnDataReceive(iObj)
{
	switch(iObj.id)
	{
		
		case 'dso_debit_note':
			MergeHeader();
            FormatGrid();
            idGrid.Subtotal( 0, 2, 0, '5!6!7!8!9!10!11!12','###,###,###,###.##');

			/*var i, l_tot_bk_amt = 0, l_tot_tr_amt = 0;
			for( i = 2; i < idGrid.rows; i++)
			{
			    l_tot_bk_amt += Number(idGrid.GetGridData(i, inet_bk_amt));   
			    l_tot_tr_amt += Number(idGrid.GetGridData(i, inet_tr_amt));
			}
			idGrid.AddRow();
			idGrid.SetGridText(idGrid.rows - 1, iSeq, 'TOTAL');
			idGrid.SetGridText(idGrid.rows - 1, inet_tr_amt, l_tot_tr_amt);
			idGrid.SetGridText(idGrid.rows - 1, inet_bk_amt, l_tot_bk_amt);*/
		break ;
	}
}

function OnReset()
{
	txtPartnerCD.text = '';
	txtPartnerNM.text = '';
	txtPartner_PK.text = '';
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
	fg.Cell(0, 0, 0, 1, 0) = "No";
	fg.ColWidth(0) = 1000;
	fg.Cell(0, 0, 1, 0, 3) = "Invoice";
	fg.Cell(0, 1, 1, 1, 1) = "Serial";
	fg.Cell(0, 1, 2, 1, 2) = "Date";
    fg.Cell(0, 1, 3, 1, 3) = "No";
	fg.ColWidth(0) = 1000;
	fg.ColWidth(1) = 1500;
	fg.ColWidth(2) = 1200;
    fg.ColWidth(3) = 1000;
	fg.MergeCol(4) = true;
	fg.Cell(0, 0, 4, 1, 4) = "Description";
	fg.ColWidth(4) = 2000;
	
    fg.MergeCol(5) = true;
	fg.Cell(0, 0, 5, 1, 5) = "Account Receivable";
	fg.ColWidth(5) = 2000;

    fg.MergeCol(6) = true;
	fg.Cell(0, 0, 6, 1, 6) = "Collection Amt";
	fg.ColWidth(6) = 1500;

    fg.MergeCol(7) = true;
	fg.Cell(0, 0, 7, 1, 7) = "Balance Amt";
	fg.ColWidth(7) = 1500;

    fg.MergeCol(8) = true;
	fg.Cell(0, 0, 8, 1, 8) = "0";
	fg.ColWidth(8) = 1500;

    fg.MergeCol(9) = true;
	fg.Cell(0, 0,9, 1, 9) = "Over 1-30 days";
	fg.ColWidth(9) = 1500;

    fg.MergeCol(10) = true;
	fg.Cell(0, 0, 10, 1, 10) = "Over 31-60 days";
	fg.ColWidth(10) = 1500;

    fg.MergeCol(11) = true;
	fg.Cell(0, 0, 11, 1, 11) = "Over 61-90 days";
	fg.ColWidth(11) = 1500;
    fg.MergeCol(12) = true;
	fg.Cell(0, 0, 12, 1, 12) = "Over 90 days";
	fg.ColWidth(12) = 1500;
}
//-----------------------------------------------------------------------------------
function FormatGrid()
{
    var fg = idGrid.GetGridControl();
    fg.ColFormat(iAR) = "#,###,###,###,###,###,###.##R";
    fg.ColFormat(icollection) = "#,###,###,###,###,###,###.##R";
	fg.ColFormat(ibalance) = "#,###,###,###,###,###,###.##R";
	fg.ColFormat(inot_over) = "#,###,###,###,###,###,###.##R";
	fg.ColFormat(iover1_30) = "#,###,###,###,###,###,###.##R";
	fg.ColFormat(iover31_60) = "#,###,###,###,###,###,###.##R";
	fg.ColFormat(iover61_90) = "#,###,###,###,###,###,###.##R";
	fg.ColFormat(iover90) = "#,###,###,###,###,###,###.##R";

   /* if(lstBook_Ccy.value=='VND')
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
    }*/
	
	
}
//-----------------------------------------------------------------------------------
// Report Bang thong ke hang ban'
function OnExcel()
{  
	switch(lstReport_Type.value)
	{
		case '01':
			var url = System.RootURL + '/standard/reports/60/11/rpt_60110220_01.aspx?tco_company_pk=' + lstCompany.value + '&tr_date_fr=' + dtTransFr.value + '&tr_date_to=' + dtTransTo.value + '&tco_buspartner_pk=' + txtPartner_PK.text + '&bank_pk=' + txtBankPK.text + '&balance_yn=' + chkBalance.text ; 
		break ;	
        case '02':
            var url = System.RootURL + '/standard/reports/60/11/rpt_60110220_02.aspx?tco_company_pk=' + lstCompany.value + '&tr_date_fr=' + dtTransFr.value + '&tr_date_to=' + dtTransTo.value + '&tco_buspartner_pk=' + txtPartner_PK.text + '&bank_pk=' + txtBankPK.text + '&balance_yn=' + chkBalance.text ;
        break;
        case '03':
            var url = System.RootURL + '/standard/reports/60/11/rpt_60110220_overdue_penalty.aspx?tco_company_pk=' + lstCompany.value + '&tr_date_fr=' + dtTransFr.value + '&tr_date_to=' + dtTransTo.value + '&tco_buspartner_pk=' + txtPartner_PK.text + '&bank_pk=' + txtBankPK.text + '&balance_yn=' + chkBalance.text ;
        break;       
	}
    System.OpenTargetPage(url);     
}
//-----------------------------------------------------------------------------------
function OnPopUp(obj)
{
    switch(obj)
    {
       case 'Customer':   
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
        break;
         case 'Bank':  
       var fpath   =   System.RootURL + "/standard/forms/gf/co/gfco002010.aspx?comm_code=" + "" + "&comm_nm=" + "" + "&company=" + lstCompany.GetData() + '&dsqlid=ac_sel_60110220_bank_popup&col_code=' + 'Bank Code' + '&col_nm=' + 'Bank Name' ;
	  var object = System.OpenModal(fpath, 600, 500, 'resizable:yes;status:yes');
            if ( object != null )  
            {
                if (object[0] != "")
                {
                    txtBankPK.text = object[2];
                    txtBankNo.text = object[1];
                    txtBankName.text = object[0];
                
                 }
             }
        break;
    }
}
</script>
<!------------------------------------------------>
<body style="margin:0; padding:0;">
    <gw:data id="dso_debit_note" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="ac_sel_60110220"  > 
                <input bind="idGrid" >   
				    <input bind="lstCompany"/>          
                    <input bind="txtPartner_PK"/>
                    <input bind="dtTransFr"/>
                    <input bind="dtTransTo"/>
                    <input bind="txtBankPK"/>
                    <input bind="chkBalance"/>
                </input>
                <output  bind="idGrid" />
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
		<td align="" width='35%'><gw:list id="lstCompany" styles="width:100%" /></td>
		<td align="right" width='7%'><a title="Click here to show Customer" onclick="OnPopUp('Customer')" href="#tips" ><b>Customer&nbsp;</b></a></td>
        <td width='30%'>
            <table width='100%' cellpadding='0' cellspacing='0'>
                <tr>
                    <td width='35%'><gw:textbox id="txtPartnerCD" styles='width:100%' text='' /></td>
		            <td width='65%'><gw:textbox id="txtPartnerNM" styles='width:100%' text='' /></td>
		            <td ><gw:imgBtn id="ibtnReset" img="reset"  alt="Reset"  onclick="OnReset()" /></td>
                </tr>
            </table>
        </td>
		<td align="right" width='10%'>Trans date&nbsp;</td>
        <td width='10%'>
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
		<td align="right"><a title="Click here to show Bank Account No" onclick="OnPopUp('Bank')" href="#tips" >Bank Account No&nbsp;</a></td>
        <td colspan=''> 
            <table width='100%' cellpadding='0' cellspacing='0'>
                <tr>
                    <td width='60%'><gw:textbox id="txtBankNo" styles='width:100%' text='' /></td>
		            <td width='40%'><gw:textbox id="txtBankName" styles='width:100%' text='' /></td>
                    <td ><gw:textbox id="txtBankPK" styles='width:;display:none' text='' /></td>
		            <td ><gw:imgBtn id="ibtnReset" img="reset"  alt="Reset"  onclick="txtBankNo.text='';txtBankName.text='';txtBankPK.text='';" /></td>
                    
                </tr>
            </table>
        </td>
        <td align="right">Balance&nbsp;</td>
        <td ><gw:checkbox id="chkBalance" default='Y|N' value = "Y" onchange="OnSearch()" /></td>

    	<td align="right" >Report Type&nbsp;</td>
		<td colspan='3'><gw:list id="lstReport_Type" styles="width:100%" onchange="" /></td>
	</tr>
	<tr style="height:90%">
		<td colspan="12">
			<gw:grid
				id="idGrid"
				header  ="Seq|Serial|Date|No|Description|AR|Collection Amt|Balance Amt|0|1-30|31-60|61-90|Over 90"
				format  ="0|0|4|0|0|0|0|0|0|0|0|0|0"
				aligns  ="1|1|1|1|1|1|1|1|0|0|1|1|1"
				defaults="|||||||||||||
				editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0"
				widths  ="1000|1400|1200|1000|1400|2000|1500|1500|1500|1500|1500|1500|1500"
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