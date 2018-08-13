<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>
    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">
//Item Code|Item Name|Takein Date|Delivery Note|Trans Date|
//Voucher No|Seq|Qty|Trans Amt|Book Amt|Warehouse|PL Code|
//PL Name|Vendor
var gItem_code 		= 0,
	gItem_name		= 1,
	gTakeinDate		= 2,
	gDeliveryNote	= 3,
	gTransDate		= 4,
	gVoucherNo		= 5,
	gSeq			= 6,
	gClear          = 7,
	gQty			= 8,
	gTrans_Amt		= 9,
	gBookAmt		= 10,
	gVCNo           = 11,
	gSeq331         = 12,
	gInvNo          = 13,
	gInvDate        = 14,
	gSerialNo       = 15,
	gWarehouse		= 16,
	gPLCode			= 17,
	gPLName			= 18,
	gVendor			= 19;
var  g_user_id = "<%=Session("USER_ID")%>" ;	
var g_user_pk = "<%=Session("USER_PK")%>" ;	
function BodyInit()
{	
	BindingDataList();
    FormatGrid();   
}

function BindingDataList()
{
    var ls_comp         = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_comp);    
    dtTransFr.value =  dtTransTo.value.substr(0, 6) + "01";	
    txtUserID.SetDataText('');
    txtUserPK.SetDataText(g_user_pk);
    dso_getCompany.Call();
}

function OnSearch()
{
    if(chkUser.value =='F')
        txtUserID.SetDataText('');
    else
        txtUserID.SetDataText('g_user_id');        
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
function OnExcel(iCase)
{  
	switch(iCase)
	{
		case '1':
			var url = System.RootURL + '/standard/reports/gf/ca/ARHistoryDetails.aspx?tco_company_pk=' + lstCompany.value + '&tr_date_fr=' + dtTransFr.value + '&tr_date_to=' + dtTransTo.value + '&tr_type=' + lstTrType.value + '&tco_buspartner_pk=' + txtPartner_PK.text + '&tr_status=' + lstStatus.value + "&tac_hgtrh_pk=" + txtSeq.text + "&voucherno=" + txtVoucherNo.text + "&invoice_no=" + txtInvNo.text ; 
			System.OpenTargetPage(url);        			
			break ;	
	}
}
//-----------------------------------------------------------------------------------
function OnPopUp(obj)
{
    switch(obj)
    {
        case 'Project':
             fpath  = System.RootURL + "/standard/forms/60/09/60090010_CtrItem2.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ac_sel_60090010_popup_item&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
             oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
            if ( oValue != null )
            {
                txtPL_PK.text = oValue[2]; 
                txtPL_NM.text   = oValue[1];
                txtPL_CD.text   = oValue[0];
            }
        break;
        case 'vendor':
            var path = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx?com_pk=' + lstCompany.GetData();
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
	var i;
	var l_tot_qty = 0, l_tot_trans_amt = 0, l_tot_book_amt = 0;
	for(i = 1; i < idGrid.rows; i++)
	{
		l_tot_qty += Number(idGrid.GetGridData(i, gQty));
		l_tot_trans_amt += Number(idGrid.GetGridData(i, gTrans_Amt));
		l_tot_book_amt += Number(idGrid.GetGridData(i, gBookAmt));
		if(idGrid.GetGridData(i, gClear)=='-1')
		{
		    idGrid.SetCellBgColor(i, 0, i, idGrid.cols-1, Number('0xA9EBD7'));      
		}
	}
	idGrid.AddRow();
	idGrid.SetGridText(idGrid.rows - 1, gQty, l_tot_qty);
	idGrid.SetGridText(idGrid.rows - 1, gTrans_Amt, l_tot_trans_amt);
	idGrid.SetGridText(idGrid.rows - 1, gBookAmt, l_tot_book_amt);
	idGrid.SetCellBgColor(idGrid.rows-1, 0, idGrid.rows-1, idGrid.cols-1, Number("0xA9EBD7"));		
}
//-----------------------------------------------------------
function OnPrint()
{
    var url = System.RootURL + "/standard/reports/60/09/60090070_AP_OtherList.aspx?company_pk=" + lstCompany.value + "&from_date=" + dtTransFr.value + "&to_date=" + dtTransTo.value + "&voucherno=" + txtVoucherNo.GetData() + "&vendor_pk=" + txtCust_PK.GetData() + "&item_pk=" + txtItem_pk.GetData() + "&pl_pk=" + txtPL_PK.GetData() + "&delivery=" + txtDelivery.GetData() + "&user_id=" + txtUserID.GetData() + "&user_yn=" + chkUser.value ;
    System.OpenTargetPage(url);            
}
//-----------------------------------------------------------
function OnDataReceive(iObj)
{
    if(iObj.id == 'dso_getCompany')
    {
        
    }
}
//-----------------------------------------------------------
</script>

<body style="margin:0; padding:0;">
    <gw:data id="dso_search" onreceive="OnSum()"> 
        <xml> 
            <dso id="1" type="grid"  function="ac_sel_60090070"  > 
                <input bind="idGrid" >   
				    <input bind="lstCompany"/>
                    <input bind="dtTransFr"/>
                    <input bind="dtTransTo"/>
                    <input bind="txtVoucherNo"/>
                    <input bind="txtCust_PK"/>                    
                    <input bind="txtItem_pk"/>
                    <input bind="txtPL_PK"/>
					<input bind="txtDelivery"/>
                    <input bind="txtUserID"/>
					<input bind="chkUser"/>					
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>
<!-------------------------------------->    
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60090070_1" > 
                <input> 
                     <input bind="txtUserPK"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!-------------------------------------->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%" >
	
	<tr style="height:5%">
		<td align="right" width="10%">Company&nbsp;</td>
		<td  colspan="3" width="30%"><gw:list id="lstCompany" styles="width:100%" /></td>		
		<td align="right" width="15%"><a title="Click here to show Vendor" onclick="OnPopUp('vendor')" href="#tips" ><b>Vendor&nbsp;</b></a></td>
        <td width="10%"><gw:textbox id="txtCust_CD" readonly='true' styles='width:100%'  /></td>
		<td width="15%"><gw:textbox id="txtCust_NM" readonly='true' styles='width:100%'  /></td>
		<td ><gw:imgBtn id="ibtnReset" img="reset"  alt="Reset"  onclick="OnResetVendor()" /></td>
		
		<td align="right" width="10%">Trans date&nbsp;</td>
		<td width="5%"><gw:datebox id="dtTransFr" lang="1" /></td>
		<td align="center">~</td>
		<td width="5%"><gw:datebox id="dtTransTo" lang="1" /></td>
				
        <td ><gw:imgBtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()"/></td>
        <td ><gw:imgBtn id="ibtnExcel" img="excel"  alt="Print"  onclick="OnPrint()"/></td>
	</tr>
	<tr style="height:5%">
		<td width="10%" align="right"><a title="Click here to show Project" onclick="OnPopUp('Project')" href="#tips" ><b>Project&nbsp;</b></a></td>
        <td width="10%"><gw:textbox id="txtPL_CD" readonly='true' styles='width:100%' text='' /></td>
        <td width="15%" ><gw:textbox id="txtPL_NM" readonly='true' styles='width:100%' text='' /></td>
        <td ><gw:imgBtn id="ibtnReset1" img="reset"  alt="Reset"  onclick="OnReset()" /></td>
              
		<td width="15%" align="right">Delivery No/Vou.No&nbsp;</td>
		<td width="10%"><gw:textbox id="txtDelivery" onkeypress="Upcase()"  styles="width:100%" onenterkey="OnSearch()" /></td>
		<td width="15%" colspan="2"><gw:textbox id="txtVoucherNo"  onkeypress="Upcase()" styles="width:100%" onenterkey="OnSearch()" /></td>
		
		<td align="right" width="10%"><a title="Click here to show Item" onclick="OnPopUp('Item')" href="#tips" ><b>Item&nbsp;</b></a></td>
		<td width="15%" colspan="4">		    
		<gw:textbox id="txtItem_cd" readonly='true' styles="width:40%" onenterkey="OnSearch()" />
		<gw:textbox id="txtItem_nm" readonly='true' styles="width:60%" onenterkey="OnSearch()" />		            		          
		</td>
		<td><gw:imgBtn id="ibtnReset2" img="reset"  alt="Reset"  onclick="OnResetItem()" /></td>		
	</tr>
	<tr>
	    <td align="right">User</td>
	    <td align="left"><gw:checkbox id="chkUser" value="F" /></td>
	</tr>	
	<tr style="height:90%;width:100%" >
		<td colspan="14" width="100%">
		<!--header  ="0.Item Code|1.Item Name|2.Delivery Note|3.Trans Date|4.Voucher No|5.Seq|6.Qty|7.Trans Amt|8.Book Amt|9.Warehouse|10.PL Code|11.PL Name|12.Vendor"-->
			<gw:grid
				id="idGrid"				
				header  ="Item Code|Item Name|_Takein Date|_Delivery Note|Trans Date|VoucherNo(Others)|Seq(Others)|Clear|Qty|Trans Amt|Book Amt|Voucher A/P|Seq(A/P)|Invoice No|Invoice Date|SerialNo|_Warehouse|PL Code|PL Name|Vendor"
				format  ="0|0|4|0|4|0|0|3|0|0|0|0|0|0|4|0|0|0|0|0"
				aligns  ="0|0|1|0|0|0|1|1|3|3|3|0|0|0|0|0|0|0|0|0"
				defaults="|||||||||||||||||||"
				editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				widths  ="1500|2500|1400|1500|1200|1800|1800|1000|1400|2000|2000|1500|1500|1500|1500|1500|2500|1500|2500|2500"
				styles  ="width:100%; height:100%"		
				acceptNullDate="T"	
				sorting ="T" />        
		</td>
	</tr>
</table>	
<gw:textbox id="txtPL_PK" styles="display:none; " />
<gw:textbox id="txtCust_PK" styles="display:none; " />
<gw:textbox id="txtItem_pk" styles="display:none; " />
<gw:textbox id="txtUserID" styles="display:none; " />
<gw:textbox id="txtUserPK" styles="display:none; " />
</body>
</html>