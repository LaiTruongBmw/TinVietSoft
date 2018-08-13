<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>AP Details</title>
    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">
//Item Code|Item Name|Takein Date|Delivery Note|Trans Date|
//Voucher No|Seq|Qty|Trans Amt|Book Amt|Warehouse|PL Code|
//PL Name|Vendor
var g_user_pk = "<%=Session("USER_PK")%>" ;
var gItem_code 		= 0,
	gItem_name		= 1,
	gTakeinDate		= 2,
	gDeliveryNote	= 3,
	gTransDate		= 4,
	gVoucherNo		= 5,
	gSeq			= 6,
	gQty			= 7,
	gTrans_Amt		= 8,
	gBookAmt		= 9,
	gWarehouse		= 10,
	gPLCode			= 11,
	gPLName			= 12,
	gVendor			= 13;
function BodyInit()
{	
	BindingDataList();
    FormatGrid();   
	 txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	dso_getCompany.Call();
  
}

function BindingDataList()
{
    var ls_comp         = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_comp);    
	var l_data = "<%=CtlLib.SetListDataFUNC("SELECT ac_A_GET_COMMONCODE('ACBG0010') FROM DUAL ")%>"; 
	lstStatus.SetDataText(l_data); 

    dtTransFr.value =  dtTransTo.value.substr(0, 6) + "01";	
    txtUserPK.SetDataText(g_user_pk);
	data ="data|1|Report 1|2|Report 2"
	lstReportsType.SetDataText(data);

  //
}

function OnSearch()
{
	dso_search.Call("SELECT");
}

function OnReset()
{
	txtPL_CD.text = '';
	txtPL_NM.text = '';
	txtPL_PK.text = '';
}

function OnResetVendor()
{
    txtCust_CD.text='';
    txtCust_NM.text='';
    txtCust_PK.text='';
}

function OnResetItem()
{
    txtItem_cd.text='';
    txtItem_nm.text='';
    txtItem_pk.text='';
}
//-----------------------------------------------------------------------------------
function FormatGrid()
{
	var fg = idGrid.GetGridControl();
	fg.ColFormat(gQty) = "#,###,###,###,###,###,###.##R";
	fg.ColFormat(gTrans_Amt) = "#,###,###,###,###,###,###.##R";
	fg.ColFormat(gBookAmt) = "#,###,###,###,###,###,###.##R";
}	
// Report Bang thong ke hang ban'
function OnExcel()
{  
	
		if(lstReportsType.value=='1')
		{
			var url = System.RootURL + "/standard/reports/gf/da/gfda00150.aspx?std_ym=" + dtTransFr.value + "&ac_cd=" + txtACC_PK.GetData() + "&tin_warehouse_pk=ALL&tco_company_pk=" + lstCompany.value + "&item_pk=" + txtItem_pk.GetData() + "&cust_pk=" + txtCust_PK.GetData() + "&voucherno=" + txtVoucherNo.GetData() + "&takein_no=" + txtDelivery.GetData() + "&std_ym_to=" + dtTransTo.value ;
			System.OpenTargetPage(url);  
			/*var url = System.RootURL + '/standard/reports/60/09/60090090_G_ARHistory_Details.aspx?tco_company_pk=' + lstCompany.value + '&tr_date_fr=' + dtTransFr.value + '&tr_date_to=' + dtTransTo.value + '&tr_type=' + lstTrType.value + '&tco_buspartner_pk=' + txtPartner_PK.text + '&tr_status=' + lstStatus.value + "&tac_hgtrh_pk=" + txtSeq.text + "&voucherno=" + txtVoucherNo.text + "&invoice_no=" + txtInvNo.text ; 
			System.OpenTargetPage(url);  */ 
		}				
		if(lstReportsType.value=='2')
		{
			var url = System.RootURL + "/standard/reports/60/09/rpt_60090090_2.aspx?std_ym=" + dtTransFr.value + "&ac_cd=" + txtACC_PK.GetData() + "&tin_warehouse_pk=ALL&tco_company_pk=" + lstCompany.value + "&item_pk=" + txtItem_pk.GetData() + "&cust_pk=" + txtCust_PK.GetData() + "&voucherno=" + txtVoucherNo.GetData() + "&takein_no=" + txtDelivery.GetData() + "&std_ym_to=" + dtTransTo.value ;
			System.OpenTargetPage(url);  
			/*var url = System.RootURL + '/standard/reports/60/09/60090090_G_ARHistory_Details.aspx?tco_company_pk=' + lstCompany.value + '&tr_date_fr=' + dtTransFr.value + '&tr_date_to=' + dtTransTo.value + '&tr_type=' + lstTrType.value + '&tco_buspartner_pk=' + txtPartner_PK.text + '&tr_status=' + lstStatus.value + "&tac_hgtrh_pk=" + txtSeq.text + "&voucherno=" + txtVoucherNo.text + "&invoice_no=" + txtInvNo.text ; 
			System.OpenTargetPage(url);  */      			
		}
}
//-----------------------------------------------------------------------------------
function OnPopUp(obj)
{
    switch(obj)
    {
        case 'Project':
             fpath  = System.RootURL + "/standard/forms/60/09/60090010_CtrItem2.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=AC_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
             oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
            if ( oValue != null )
            {
                txtPL_PK.text = oValue[2]; 
                txtPL_NM.text   = oValue[1];
                txtPL_CD.text   = oValue[0];
            }
        break;
        case 'vendor':
            var path = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx?com_pk='+lstCompany.value;
		    var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
		        if (object[0] != 0)
                {
                    txtCust_CD.SetDataText(object[1]);//customer id
                    txtCust_NM.SetDataText(object[2]);//customer name
                    txtCust_PK.SetDataText(object[0]);//customer name
      	        }
		     }       
        break; 
        case 'Item':
            var path = System.RootURL + '/standard/forms/60/11/60110190_popup_get_one_item.aspx';
		    var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
		        if (object[0] != 0)
                {
                    txtItem_cd.SetDataText(object[1]);//customer id
                    txtItem_nm.SetDataText(object[2]);//customer name
                    txtItem_pk.SetDataText(object[0]);//customer name
      	        }
		     }       
        break;
        case 'Account':
			var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "15" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=SP_SEL_ACCT_POPUP";
			var o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
			if (o != null)
			{
				if(o[0] != 0)
				{
					txtACC_PK.text = o[3]; // account pk
					txtACC_CD.text = o[0]; // account code
					txtACC_NM.text = o[1] ; // account name
				}				
			}		

			
            /*var fpath   = System.RootURL + "/standard/forms/60/09/60090090_popup.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=YAPD&val1=A/P Domestic&val2=D&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60090090_acc_drcr";
            var aValue      = System.OpenModal(  fpath , 750 , 550 , 'resizable:yes;status:yes');	
            if ( aValue != null ) 
            {
                if (aValue.length > 0)
                {
                    var tmp = aValue[0];
                    if (tmp[1] != 0)
                    {
			            txtACC_PK.text = tmp[1];    //ACPK
			            txtACC_CD.text = tmp[4];    //Account Code
			            txtACC_NM.text = tmp[5];    //Account Name
                    }
                 }
            }*/                        
        break ;
    }    
}
//-----------------------------------------------------------
function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
    var x = c.toUpperCase().charCodeAt(0);
    event.keyCode = x;
}
//-----------------------------------------------------------
function OnSum()
{
	/*var i;
	var l_tot_qty = 0, l_tot_trans_amt = 0, l_tot_book_amt = 0;
	for(i = 1; i < idGrid.rows; i++)
	{
		l_tot_qty += Number(idGrid.GetGridData(i, gQty));
		l_tot_trans_amt += Number(idGrid.GetGridData(i, gTrans_Amt));
		l_tot_book_amt += Number(idGrid.GetGridData(i, gBookAmt));
	}
	idGrid.AddRow();
	idGrid.SetGridText(idGrid.rows - 1, gQty, l_tot_qty);
	idGrid.SetGridText(idGrid.rows - 1, gTrans_Amt, l_tot_trans_amt);
	idGrid.SetGridText(idGrid.rows - 1, gBookAmt, l_tot_book_amt);
	idGrid.SetCellBgColor(idGrid.rows-1, 0, idGrid.rows-1, idGrid.cols-1, Number("0xA9EBD7"));*/
	idGrid.Subtotal(1   ,2                ,-1       ,"6!7!8!9!10!11!12!13",""          ,true        ,0        ," Grand total %s ",0X00ffff,0x000000,true);
	//idGrid.Subtotal(1,2,0,"6!7!8!9!10!11!12!13","",true,0,"    Total %s ");
		
}
//-----------------------------------------------------------

function OnResetAcc()
{
    txtACC_CD.SetDataText('');
    txtACC_NM.SetDataText('');  
    txtACC_PK.SetDataText(''); 
}
//-----------------------------------------------------------
function OnDataReceive(iObj)
{
    if(iObj.id == 'dso_getCompany')
    {
        	//BindingDataList.Call();
    }
}
//-----------------------------------------------------------
</script>

<body style="margin:0; padding:0;">
    <gw:data id="dso_search" onreceive="OnSum()"> 
        <xml> 
            <dso id="1" type="grid"  function="ac_sel_60090090"  > 
                <input bind="idGrid" >   
				    <input bind="lstCompany"/>
                    <input bind="dtTransFr"/>
                    <input bind="dtTransTo"/>
                    <input bind="txtVoucherNo"/>
                    <input bind="txtCust_PK"/>                    
                    <input bind="txtItem_pk"/>
                    <input bind="txtPL_PK"/>
					<input bind="txtDelivery"/>
					<input bind="txtACC_PK"/>
					<input bind="txtSeq"/>
					<input bind="lstStatus"/>
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>
<!-------------------------------------->
	 <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_pro_60020020_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!-------------------------------------->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%" >
	
	<tr style="height:4%">
		<td align="right" width="10%">Company</td>
		<td  colspan="3" width="30%"><gw:list id="lstCompany" styles="width:100%" /></td>		
		<td align="right" width="15%"><a title="Click here to show Vendor" onclick="OnPopUp('vendor')" href="#tips" ><b>Vendor</b></a></td>
        <td width="10%"><gw:textbox id="txtCust_CD" readonly='true' styles='width:100%'  /></td>
		<td width="15%"><gw:textbox id="txtCust_NM" readonly='true' styles='width:100%'  /></td>
		<td ><gw:imgBtn id="ibtnReset" img="reset"  alt="Reset"  onclick="OnResetVendor()" /></td>
		
		<td align="right" width="10%">Trans date</td>
		<td width="5%"><gw:datebox id="dtTransFr" lang="1" /></td>
		<td align="center">~</td>
		<td width="5%"><gw:datebox id="dtTransTo" lang="1" /></td>
				
        <td ><gw:imgBtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()"/></td>
        <td ><gw:imgBtn id="ibtnExcel" img="excel"  alt="Print"  onclick="OnExcel()" /></td>
	</tr>
	<tr style="height:4%">
		<td width="10%" align="right"><a title="Click here to show Project" onclick="OnPopUp('Project')" href="#tips" ><b>Project</b></a></td>
        <td width="10%"><gw:textbox id="txtPL_CD" readonly='true' styles='width:100%' text='' /></td>
        <td width="15%" ><gw:textbox id="txtPL_NM" readonly='true' styles='width:100%' text='' /></td>
        <td ><gw:imgBtn id="ibtnReset1" img="reset"  alt="Reset"  onclick="OnReset()" /></td>
              
		<td width="15%" align="right">Delivery No/Vou.No</td>
		<td width="10%"><gw:textbox id="txtDelivery" onkeypress="Upcase()"  styles="width:100%" onenterkey="OnSearch()" /></td>
		<td width="15%" colspan="2"><gw:textbox id="txtVoucherNo"  onkeypress="Upcase()" styles="width:100%" onenterkey="OnSearch()" /></td>
		
		<td align="right" width="10%"><a title="Click here to show Item" onclick="OnPopUp('Item')" href="#tips" ><b>Item</b></a></td>
		<td width="15%" colspan="4">		    
		<gw:textbox id="txtItem_cd" readonly='true' styles="width:40%" onenterkey="OnSearch()" />
		<gw:textbox id="txtItem_nm" readonly='true' styles="width:60%" onenterkey="OnSearch()" />		            		          
		</td>
		<td><gw:imgBtn id="ibtnReset2" img="reset"  alt="Reset"  onclick="OnResetItem()" /></td>		
	</tr>
	<tr style="height:4%;" >
	    <td width="10%" align="right"><a title="Click here to show account code" onclick="OnPopUp('Account')" href="#tips" >Account Code</a></td>
        <td width="10%"><gw:textbox id="txtACC_CD" readonly='true' styles='width:100%' text='' /></td>
        <td width="15%" ><gw:textbox id="txtACC_NM" readonly='true' styles='width:100%' text='' /></td>
        <td ><gw:imgBtn id="ibtnReset3" img="reset"  alt="Reset"  onclick="OnResetAcc()" /></td>
	    <td width="15%" align="right">Seq</td>
	    <td width="10%"><gw:textbox id="txtSeq" onkeypress="Upcase()"  styles="width:100%" onenterkey="OnSearch()" /></td>
		<td></td>
		<td></td>
		<td width="15%" align="right">Status</td>
		<td align=""><gw:list id="lstStatus" styles="width:100%" onchange="OnSearch()" /></td>
		<td width="15%" align="right">Reports</td>
		<td align="" colspan="3"> <gw:list id="lstReportsType" styles="width:100%" onchange="" /></td>
	</tr>
	<tr style="height:88%;width:100%" >
		<td colspan="14" width="100%">
		<!--header  ="0.Item Code|1.Item Name|2.Delivery Note|3.Trans Date|4.Voucher No|5.Seq|6.Qty|7.Trans Amt|8.Book Amt|9.Warehouse|10.PL Code|11.PL Name|12.Vendor|||13 Serial| 14 Invoice Date| 15 Invoice No"-->
			<gw:grid
				id="idGrid"				
				header  ="Item Code|Item Name|Takein Date|Delivery Note|Trans Date|Voucher No|Seq|Qty|Trans Amt|Book Amt|Warehouse|PL Code|PL Name|Vendor|_|_|Serial No| Invoice Date|Invoice No"
				format  ="0|0|4|0|4|0|0|0|0|0|0|0|0|0|0|0|0|4|0"
				aligns  ="0|0|1|0|0|0|1|3|3|3|0|0|0|0|0|0|0|0|0"
				defaults="||||||||||||||||||"
				editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				widths  ="1500|2500|1400|1500|1200|1500|1000|800|2000|2000|2500|1500|2500|2500|0|0|1000|1000|1000"
				styles  ="width:100%; height:100%"		
				acceptNullDate="T"	
				sorting ="T" />        
		</td>
	</tr>
</table>	
<gw:textbox id="txtPL_PK" styles="display:none; " />
<gw:textbox id="txtCust_PK" styles="display:none; " />
<gw:textbox id="txtItem_pk" styles="display:none; " />
<gw:textbox id="txtACC_PK" readonly='true' styles='width:100%; display:none; ' />
<gw:textbox id="txtUserPK" styles="display:none; " />
<gw:textbox id="txtProposedByUserPk"  styles='display:none' />
</body>
</html>