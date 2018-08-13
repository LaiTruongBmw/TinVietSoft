<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Get PO</title>    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
// 1, 6,10,13,14,20
//|_Trans_PK|Slip No|Item Code|Item Name|UOM|Vendor|Unit Price|Takein Q'ty|_Loaded Qty|_Balance|Invoice Q'ty|PO No|_ItemPK|Ccy|
//Trans Amount|_tac_abacctcode_pk|Acc Code|Acc Name|_tin_wh_pk|WH|_tac_abplcenter_pk|PL Code|PL Name|_tac_mattakein_ap_pk|Date|Vat Rate|Vat Amount
var g_Chk					= 0,
	g_D_Trans_PK	= 1,
	g_D_SlipNo		= 2,
	g_D_ItemCode			= 3,
	g_D_ItemName			= 4,
	g_D_UOM					= 5,
	g_D_Vendor				= 6,
	g_D_UnitPrice			= 7,
	g_D_TakeinQty			= 8,
	g_D_LoadedQty			= 9,
	g_D_Balance				= 10,
	g_D_InvoiceQty			= 11,
	g_D_PONo				= 12,
	g_D_ItemPK				= 13,
	g_D_Ccy					= 14,
	g_D_Amount				= 15,
	g_D_Acc_PK				= 16,
	g_D_Acc_CD				= 17,
	g_D_Acc_Name			= 18,
	g_D_tin_warehouse_pk	= 19,
	g_D_WHName				= 20,
	g_D_tac_abplcenter_pk   = 21,
	g_D_plcd                = 22,
	g_D_plnm                = 23,
	g_D_tac_mattakein_ap_pk = 24,
	g_D_Tr_date				= 25,
	g_D_VAT_Rate			= 26,
	g_D_VAT_Amount			= 27 ;
	var g_tco_company_pk 		= "";	
	var g_vendor_pk = "";
	var g_vendor_cd = "";
	var g_vendor_nm = "";
var g_D2_Chk					= 0,
	g_D2_tin_mattakeind_PK		= 1,
	g_D2_DeliveryNote			= 2,
	g_D2_ItemCode				= 3,
	g_D2_ItemName				= 4,
	g_D2_UOM					= 5,
	g_D2_Vendor					= 6,
	g_D2_UnitPrice				= 7,
	g_D2_TakeinQty				= 8,
	g_D2_LoadedQty				= 9,
	g_D2_Balance				= 10,
	g_D2_InvoiceQty				= 11,
	g_D2_PONo					= 12,
	g_D2_ItemPK					= 13,
	g_D2_Ccy					= 14,
	g_D2_Amount					= 15,
	g_D2_Acc_PK				= 16,
	g_D2_Acc_CD				= 17,
	g_D2_Acc_Name			= 18,	
	g_D2_tin_warehouse_pk		= 19,
	g_D2_WHName					= 20,	
	g_D2_tac_abacctcode_pk		= 21,
	g_D2_Acc_Code				= 22,
	g_D2_Acc_Name				= 23,
	g_D2_tac_mattakein_ap_pk  	= 24,
	g_D2_Tr_date				= 25,
	g_D2_VAT_Rate			= 26,
	g_D2_VAT_Amount			= 27 ;

	
var g_Save = false ;
var g_trans_date = "";

function BodyInit()
{
    System.Translate(document);
    g_tco_company_pk = "<%=Request("tco_company_pk") %>"
    g_vendor_pk = "<%=Request("vendor_pk") %>"    
    txtven_pk.SetDataText(g_vendor_pk);
    g_vendor_cd = "<%=Request("vendor_cd") %>"    
    txtven_cd.SetDataText(g_vendor_cd);
    g_vendor_nm = "<%=Request("vendor_nm") %>"    
    txtven_nm.SetDataText(g_vendor_nm);

    g_trans_date = "<%=Request("trans_date") %>"                
    txtcompk.text = g_tco_company_pk;
   
    var l_from_dt = g_trans_date.substring(0, 6) + "01";
    dtInvoiceDatefr.value = l_from_dt ;
    dtInvoiceDateto.value = g_trans_date ;  
    		
    //dso_grd_takein_ap.Call("SELECT");				
	OnFormat();

}
//--------------------------------------------
function onSearchVen()
{
    var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx';
	var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes;toolbar:no;location:no;directories:no;status:no;menubar:no;scrollbars:no;resizable:no;');
	if ( object != null )
	{
	    if (object[0] != 0)
        {
            txtven_cd.text = object[1];
            txtven_nm.text = object[2];
            txtven_pk.text = object[0];
        }
    }
}
//--------------------------------------------
function onResetVen()
{
    txtven_cd.text = '';
    txtven_nm.text = '';
    txtven_pk.text = '';
}
//--------------------------------------------
function onSearch()
{	
	dso_grd_takein_ap.Call("SELECT");
}
//--------------------------------------------
function OnChangeInvQty()
{		
	return ;
}
//--------------------------------------------
function onSelect()
{
	var i, j;
	var l_aValue = new Array();
	var l_arr ;
	for(i = 1; i < grdDtl2.rows; i++)
	{		
		if(grdDtl2.GetGridData(i, 0)=='-1')
		{
			l_arr = new Array();
			for( j = 0 ; j < grdDtl2.cols; j++)
			{
				l_arr[l_arr.length] = grdDtl2.GetGridData(i, j);			
			}
			l_aValue[l_aValue.length] = l_arr;
		}	
	}
	window.returnValue = l_aValue;
	window.close();
}
//--------------------------------------------
function onNew()
{
	var i, j  ;
	for (i = 1; i < grdDtl.rows ; i++)
	{
		if(grdDtl.GetGridData(i, g_Chk)== "-1")
		{
			grdDtl2.AddRow();
			for(j = 1; j < grdDtl.cols; j++)
			{
				grdDtl2.SetGridText(grdDtl2.rows - 1, j, grdDtl.GetGridData(i, j) );				
			}
		}
	}
}
//--------------------------------------------
function OnDataReceive(iObj)
{
	if(iObj.id == "dso_grd_takein_ap")
	{
		lblsum.text = grdDtl.rows - 1 ;
		if(grdDtl.rows > 1)
		{
		    txtven_nm.SetDataText(grdDtl.GetGridData(1, 6));   
		    //txtven_cd.SetDataText(grdDtl.GetGridData(1, 6));   
		}
		if(g_Save)
		    g_Save = false ;
	    else	    
		    dso_split_qty.Call("SELECT");				
	}
	else if(iObj.id == "dso_split_qty")
	{
		if(g_Save)	
		{			
			dso_grd_takein_ap.Call("SELECT");
		}		
	}
}
//--------------------------------------------
function onSave()
{
	if(ValidateData())
	{
		g_Save = true ;
		dso_split_qty.Call();
	}
}
//--------------------------------------------
function ValidateData()
{	
	var l_inv_qty, l_bal_qty, i, l_loaded_qty ;
	for( i = 1; i < grdDtl2.rows; i++)
	{
		l_inv_qty = grdDtl2.GetGridData(i, g_D2_InvoiceQty);
		l_bal_qty = grdDtl2.GetGridData(i, g_D2_Balance);
		l_loaded_qty = grdDtl2.GetGridData(i, g_D2_LoadedQty);
		if(isNaN(l_inv_qty))
		{
			alert("Please input Inv Qty is number, be greater than 0 and less than Balance Qty, at row " + i);
			grdDtl2.SetGridText(i, g_D2_InvoiceQty, Number(l_bal_qty) + Number(l_loaded_qty) ) ;	
			return false ;			
		}
		if( Number(l_inv_qty) > Number(l_bal_qty) + Number(l_loaded_qty) )
		{
			alert("Please input Inv Qty is number, be greater than 0 and less than Balance Qty, at row " + i);
			grdDtl2.SetGridText(i, g_D2_InvoiceQty, Number(l_bal_qty) + Number(l_loaded_qty) ) ;	
			return false ;
		}
	}
	return true;
}
//--------------------------------------------
function OnDelete()
{
	var i ;
	for(i = 1; i < grdDtl2.rows ; i++)
	{
		if(grdDtl2.GetGridData(i, g_D2_Chk)=="-1")
			grdDtl2.SetRowStatus(i, Number("0x40"));
	}
	g_Save = true;
	dso_split_qty.Call();
}
//--------------------------------------------
function OnCopy()
{
	var i, j ;	
	for(i = 1; i < grdDtl.rows; i++)
	{
		if(grdDtl.GetGridData(i, 0)=='-1')
		{
			grdDtl2.AddRow();
			for(j = 1; j < grdDtl.cols; j++)
			{
				grdDtl2.SetGridText(grdDtl2.rows - 1, j, grdDtl.GetGridData(i, j) );
				grdDtl2.SetRowStatus(grdDtl2.rows - 1, 0x20);
			}						
		}				
    }		
	j = 1;	
	i = j;
	while(i >= j && i < grdDtl.rows)
	{
		if(grdDtl.GetGridData(i, 0)=='-1')
		{
			grdDtl.RemoveRowAt(i);
			j = i;
		}
		else
		{
			i++;
		}
	}
	g_Save = true;
	dso_split_qty.Call();
}
//--------------------------------------------
function OnCheckAll()
{
    var i;
    if(chkCheckAll.value == 'T')
    {
        for(i = 1; i < grdDtl.rows; i++)
        {
            grdDtl.SetGridText(i, g_Chk, '-1');
        }
    }
    else if(chkCheckAll.value == 'F')
    {
        for(i = 1; i < grdDtl.rows; i++)
        {
            grdDtl.SetGridText(i, g_Chk, '0');
        }    
    }        
}
//--------------------------------------------
function OnCheckAll_1()
{
    var i;
    if(chkCheckAll_1.value == 'T')
    {
        for(i = 1; i < grdDtl2.rows; i++)
        {
            grdDtl2.SetGridText(i, g_D2_Chk, '-1');
        }
    }
    else if(chkCheckAll_1.value == 'F')
    {
        for(i = 1; i < grdDtl2.rows; i++)
        {
            grdDtl2.SetGridText(i, g_D2_Chk, '0');
        }    
    }        
}
//--------------------------------------------

function OnFormat()
{
	var fg = grdDtl.GetGridControl();
	fg.ColFormat(g_D_UnitPrice) = "###,###.###R";
	fg.ColFormat(g_D_Amount) = "###,###,###R";
	fg.ColFormat(g_D_TakeinQty) = "###,###.##R";
	fg.ColFormat(g_D_LoadedQty) = "###,###.##R";
	fg.ColFormat(g_D_Balance) = "###,###.##R";
	fg.ColFormat(g_D_InvoiceQty) = "###,###.##R";	
	
	var fg2 = grdDtl2.GetGridControl();
	fg2.ColFormat(g_D2_UnitPrice) = "###,###.###R";
	fg2.ColFormat(g_D2_TakeinQty) = "###,###.###R";
	fg2.ColFormat(g_D2_LoadedQty) = "###,###.##R";
	fg2.ColFormat(g_D2_Balance) = "###,###.##R";
	fg2.ColFormat(g_D2_InvoiceQty) = "###,###.##R";
	fg2.ColFormat(g_D2_Amount) = "###,###,###,###R";
	fg2.ColFormat(g_D2_VAT_Amount) = "###,###,###,###R";
}
//--------------------------------------------
</script>
<body style="margin:0; padding:0;">
<!----------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_grd_takein_ap" onreceive="OnDataReceive(this)" >
        <xml>
            <dso type="grid" function="ac_sel_60090010_vin_stockdaily" >
                <input bind="grdDtl">
                    <input bind="txtcompk" />                   
                    <input bind="txtDeliveryNo" />
					<input bind="dtInvoiceDatefr" />
                    <input bind="dtInvoiceDateto" />
                    <input bind="txtven_pk" />
                    <input bind="txtpo_no" />                     
				    <input bind="txtItem" />		
                </input>
                <output bind="grdDtl" />
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_split_qty" onreceive="OnDataReceive(this)" >
        <xml>
            <dso type="grid" parameter="1,7,11,14,15,24" function="ac_sel_60090010_stockdaily2" procedure="ac_upd_60090010_stockdaily" >
                <input bind="grdDtl2">
                    <input bind="txtcompk" />                   
                    <input bind="txtDeliveryNo" />
		            <input bind="dtInvoiceDatefr" />
                    <input bind="dtInvoiceDateto" />
                    <input bind="txtven_pk" />
                    <input bind="txtpo_no" />
		    <input bind="txtRefNo" />		                    
                </input>
                <output bind="grdDtl2" />
            </dso>
        </xml>
    </gw:data>

<!----------------------------------------------------------------------------------------------------------------->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%">
<tr style="height:0%" >    
    <td width="8%"></td>
    <td width="12%"></td>
    <td width="8%"></td>
    <td width="10%"></td>
    <td width="3%"></td>
    <td width="10%"></td>
    <td width="5%"></td>
    <td width="27%"></td>
    <td width="12%"></td>
    <td width="3%"></td>
</tr>
    <tr style="height:5%; " >
        <td align="right">Slip No</td>
        <td ><gw:textbox id="txtDeliveryNo" styles="width:100%" onenterkey="onSearch()"/></td>
        <td align="right">Stock Date</td>
        <td><gw:datebox id="dtInvoiceDatefr" lang="1" /></td>
        <td align="center"></td>
        <td><gw:datebox id="dtInvoiceDateto" lang="1" /></td>
        <td align="right"><a title="Click here to select vendor" href="#tips" onclick="onSearchVen()" >Vendor&nbsp;</a></td>
        <td>
            <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="height:100%">
            <tr>
                <td width="30%"><gw:textbox id="txtven_cd" styles='width:100%' /></td>
                <td width="60%"><gw:textbox id="txtven_nm" styles='width:100%'/></td>
                <td width="0%"><gw:textbox  id="txtven_pk" styles='display:none'/></td>
                <td width="5%"></td> 
                <td width="5%"><gw:imgBtn   img="reset"	id="idResetVen"  alt="Reset" onclick="onResetVen()"/></td>
            </tr>
            </table>
        </td>
        <td>
            <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="height:100%">
				<tr>
					<td align="center" width="40%"><gw:label id="lblsum" text="0" styles="color:red;width:90%;font-weight: bold;font-size:12"/></td>
					<td align="right" width="60%"><gw:label id="lblLabel" text="record(s)" styles="color:red;width:90%;font-weight: bold;font-size:12"/>&nbsp;</td>
				</tr>
            </table>
        </td>
        <td><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"        onclick="onSearch()"/></td>
    </tr>
    <tr style="height:5%">
        <td align="right" style="width:10%" >PO No</td>
        <td align="left" style="width:15%" ><gw:textbox id="txtpo_no" styles="width:100%" onenterkey="onSearch()" /></td>
        <td align="right">Item</td>
        <td colspan="3"><gw:textbox id="txtItem" styles="width:100%;" onenterkey="onSearch()" /></td>                    
        <td align="right">REF No</td>
        <td align="left"><gw:textbox id="txtRefNo" styles="width:100%;" /></td>
        <td align="right">Check All</td>
        <td colspan="2" align="left" ><gw:checkbox id="chkCheckAll" value="F" onchange="OnCheckAll()" /></td>
    </tr>    
    <tr style="height:40%;">
        <td colspan="10" >
            <gw:grid
                id      ="grdDtl"  
                header  ="|_Trans_PK|Slip No|Item Code|Item Name|UOM|Vendor|Unit Price|Takein Q'ty|_Loaded Qty|_Balance|Invoice Q'ty|PO No|_ItemPK|Ccy|Trans Amount|_tac_abacctcode_pk|Acc Code|Acc Name|_tin_wh_pk|WH|_tac_abplcenter_pk|PL Code|PL Name|_tac_mattakein_ap_pk|Date|Vat Rate|Vat Amount"
                format  ="3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|0|0"
                aligns  ="1|0|1|1|0|1|0|3|3|3|3|3|0|0|0|3|0|0|0|0|0|0|0|0|0|1|1|3"
                defaults="0|||||||||||||||||||||||||||"
                editcol ="1|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                widths  ="600|0|1500|1300|2500|600|2000|1500|1300|1300|1300|1300|1500|0|800|1300|0|1200|2500|0|1400|0|1400|2000|0|1000|800|1200"
                styles  ="width:100%; height:100%"                
                sorting ="T"                								
            />
        </td>
    </tr>
	<tr style="height:5%;">
		<td colspan="10">
            <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="height:100%">
				<tr>	
				    <td align="right" width="10%" >Check All</td>
				    <td align="left" width="10%" ><gw:checkbox id="chkCheckAll_1" value="F" onchange="OnCheckAll_1()" /></td>				
					<td align="right" width="10%"><gw:icon id="ibtnAddNew" img="in" text="Copy" alt="Copy" onclick="OnCopy()" /></td>
					<td align="right" width="10%"><gw:imgBtn id="ibtnSave" img="save" alt="Save" onclick="onSave()" /></td>
					<td align="right" width="10%"><gw:imgBtn id="ibtnDelete" img="delete" alt="Delete" onclick="OnDelete()" /></td>					
                    <td align="right" width="10%"><gw:imgBtn id="ibtnSelect" img="select" alt="Select" onclick="onSelect()" /></td>					
				</tr>
            </table>			
		</td>
	</tr>
    <tr style="height:45%;">
        <td colspan="10" >
            <gw:grid
                id      ="grdDtl2"  
                header  ="|_tin_stocktr_PK|Slip No|Item Code|Item Name|UOM|Vendor|Unit Price|Takein Q'ty|_Loaded Qty|_Balance|Invoice Q'ty|PO No|_ItemPK|Ccy|Trans Amount|_tac_abacctcode_pk|Acc Code|Acc Name|_tin_wh_pk|WH|_tac_abplcenter_pk|PL Code|PL Name|_tac_mattakein_ap_pk|Date|Vat Rate|Vat Amount|SEQ"
                format  ="3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|0|0|0"
                aligns  ="1|0|1|1|0|1|0|3|3|3|3|3|0|0|0|3|0|0|0|0|0|0|0|0|0|1|1|3|0"
                defaults="0||||||||||||||||||||||||||||"
                editcol ="1|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                widths  ="600|0|1500|1300|2500|600|2000|1500|1300|1300|1300|1300|1500|0|800|1300|0|1200|2500|0|1400|0|1400|2000|0|1000|800|1200|0"
                styles  ="width:100%; height:100%"                
                sorting ="T"                				
				
            />
        </td>
    </tr>
</table>	
<gw:textbox id="txtcompk"           style="display:none" />
<!---------------------------------------------------------------------------------------------------->
</body>
</html>