<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
// global variables of grdDtl
var 	g_Chk 				= 0,
		g_tim_cinv_dtl_pk	= 1,
		g_tim_cinv_mst_a_pk	= 2,
		g_tco_item_pk		= 3,
		g_tim_order_pk		= 4,
		g_OrderNo			= 5,
		g_CoInvoiceNo		= 6,
		g_InvoiceDate		= 7,
		g_Itemcode			= 8,
		g_ItemName			= 9,
		g_HSCode			= 10,
		g_Unit				= 11,
		g_UPrice			= 12,
		g_Qty				= 13,
		g_TransAmt			= 14,
		g_VendorID			= 15,
		g_VendorName		= 16;		
		// global variables of grdDtl2
	var g_D2_Chk 			= 0,
		g_D2_tac_cinv_ap_pk	= 1,
		g_D2_CoInvoiceNo	= 2,
		g_D2_InvoiceDate	= 3,
		g_D2_tco_item_pk	= 4,
		g_D2_Itemcode		= 5,
		g_D2_ItemName		= 6,
		g_D2_UOM			= 7,
		g_D2_Qty			= 8,
		g_D2_Price			= 9,
		g_D2_TrAmt			= 10,
		g_D2_VendorID		= 11,
		g_D2_VendorName		= 12,
		g_D2_tim_cinv_dtl_pk = 13;		
var g_Save = false ;
//var g_company_pk   = "<%=Session("COMPANY_PK")%>";	
function BodyInit()
{
    System.Translate(document);
	var l_today = dtInvoiceDateto.value ;
	var l_frdate = l_today.substr(0, 4) + '0101';
	dtInvoiceDatefr.value = l_frdate;
	g_tco_company_pk = "<%=Request("tco_company_pk") %>"
	txtcompk.text = g_tco_company_pk;
	var l_data = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM COMM.TCO_COMPANY WHERE DEL_IF=0")%>";
	lstCompany.SetDataText(l_data);	
	lstCompany.value = g_tco_company_pk ;
	txtInvNo.GetControl().focus();
}
//--------------------------------------------
function onSearchVen()
{
    var path    = System.RootURL + '/standard/forms/gf/co/ffbp00031.aspx';
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
	dso_grd_imp_inv.Call("SELECT");
}
//--------------------------------------------
function onSelect()
{
	var i, j;
	var l_aValue = new Array();
	var l_arr ;
	for(i = 1; i < grdDtl2.rows; i++)
	{
		l_arr = new Array();
		l_arr[l_arr.length] = grdDtl2.GetGridData(i, g_D2_tac_cinv_ap_pk); // tac_cinv_ap_pk
		l_arr[l_arr.length] = grdDtl2.GetGridData(i, g_D2_tco_item_pk); // tco_item_pk
		l_arr[l_arr.length] = grdDtl2.GetGridData(i, g_D2_CoInvoiceNo); // Order No		
		l_arr[l_arr.length] = grdDtl2.GetGridData(i, g_D2_Itemcode); // Item code
		l_arr[l_arr.length] = grdDtl2.GetGridData(i, g_D2_ItemName); // Item Name	
		l_arr[l_arr.length] = grdDtl2.GetGridData(i, g_D2_UOM); // Unit
		l_arr[l_arr.length] = grdDtl2.GetGridData(i, g_D2_Price); // Price
		l_arr[l_arr.length] = grdDtl2.GetGridData(i, g_D2_Qty); // Qty
		l_arr[l_arr.length] = grdDtl2.GetGridData(i, g_D2_TrAmt); // Trans Amt		
		l_aValue[l_aValue.length] = l_arr;
	}
	window.returnValue = l_aValue;
	window.close();
}
//--------------------------------------------
function onNew()
{
	var i,j;
	for(i = 1; i < grdDtl.rows ; i++)
	{
		if(grdDtl.GetGridData(i, g_Chk)=="-1")
		{
			grdDtl2.AddRow();
			for(j = 0; j < grdDtl.cols ; j++)
			{
				grdDtl2.SetGridText(grdDtl2.rows - 1, g_D2_CoInvoiceNo, grdDtl.GetGridData(i, g_CoInvoiceNo));
				grdDtl2.SetGridText(grdDtl2.rows - 1, g_D2_InvoiceDate, grdDtl.GetGridData(i, g_InvoiceDate));
				grdDtl2.SetGridText(grdDtl2.rows - 1, g_D2_tco_item_pk, grdDtl.GetGridData(i, g_tco_item_pk));
				grdDtl2.SetGridText(grdDtl2.rows - 1, g_D2_Itemcode, grdDtl.GetGridData(i, g_Itemcode));
				grdDtl2.SetGridText(grdDtl2.rows - 1, g_D2_ItemName, grdDtl.GetGridData(i, g_ItemName));
				grdDtl2.SetGridText(grdDtl2.rows - 1, g_D2_Qty, grdDtl.GetGridData(i, g_Qty));
				grdDtl2.SetGridText(grdDtl2.rows - 1, g_D2_Price, grdDtl.GetGridData(i, g_UPrice));
				grdDtl2.SetGridText(grdDtl2.rows - 1, g_D2_TrAmt, grdDtl.GetGridData(i, g_TransAmt));
				grdDtl2.SetGridText(grdDtl2.rows - 1, g_D2_tim_cinv_dtl_pk, grdDtl.GetGridData(i, g_tim_cinv_dtl_pk));
				grdDtl2.SetGridText(grdDtl2.rows - 1, g_D2_VendorID, grdDtl.GetGridData(i, g_VendorID));
				grdDtl2.SetGridText(grdDtl2.rows - 1, g_D2_VendorName, grdDtl.GetGridData(i, g_VendorName));
				grdDtl2.SetRowStatus(grdDtl2.rows - 1, 0x20) ;
			}
		}
	}
}
//--------------------------------------------
function OnDataReceive(iObj)
{
	if(iObj.id == "dso_grd_imp_inv")
	{
		dso_grd_imp_inv2.Call("SELECT");
	}
	else if(iObj.id == "dso_grd_imp_inv2")
	{
		if(g_Save)
		{
			g_Save = false ;
			dso_grd_imp_inv.Call("SELECT");
		}
	}
}
//--------------------------------------------
function onSave()
{
	dso_grd_imp_inv2.Call();
	g_Save = true ;
}
//--------------------------------------------
function OnDelete()
{
	var i ;
	for(i = 1; i < grdDtl2.rows; i++)
	{
		if(grdDtl2.GetGridData(i, g_D2_Chk)=="-1")
		{
			grdDtl2.SetRowStatus(i, 0x40);
		}
	}	
}
//--------------------------------------------
</script>
<body style="margin:0; padding:0;">
<!----------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_grd_imp_inv" onreceive="OnDataReceive(this)" >
        <xml>
            <dso type="grid" function="acnt.sp_sel_imp_invoice_ap" >
                <input bind="grdDtl">
                    <input bind="lstCompany" />                   
                    <input bind="dtInvoiceDatefr" />
					<input bind="dtInvoiceDateto" />
                    <input bind="txtInvNo" />
                    <input bind="txtven_pk" />                                        
                </input>
                <output bind="grdDtl" />
            </dso>
        </xml>
    </gw:data>
    <gw:data id="dso_grd_imp_inv2" onreceive="OnDataReceive(this)" >
        <xml>
            <dso type="grid" parameter="1,8,9,10,13" function="acnt.sp_sel_imp_invoice_ap_2" procedure="acnt.sp_upd_imp_invoice_ap" >
                <input bind="grdDtl2">
                    <input bind="lstCompany" />                   
                    <input bind="dtInvoiceDatefr" />
					<input bind="dtInvoiceDateto" />
                    <input bind="txtInvNo" />
                    <input bind="txtven_pk" />                                        
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
        <td align="right">Company&nbsp;</td>
        <td ><gw:list id="lstCompany" styles="width:100%" /></td>
        <td align="right">Invoice Date&nbsp;</td>
        <td><gw:datebox id="dtInvoiceDatefr" lang="1" /></td>
        <td align="center">~</td>
        <td><gw:datebox id="dtInvoiceDateto" styles="width:100%" lang="1" /></td>
        <td align="right">Exporter&nbsp;</td>
        <td>
            <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="height:100%">
            <tr>
                <td width="30%"><gw:textbox id="txtven_cd" styles='width:100%' /></td>
                <td width="60%"><gw:textbox id="txtven_nm" styles='width:100%'/></td>
                <td width="0%"><gw:textbox  id="txtven_pk" styles='display:none'/></td>
                <td width="5%"><gw:imgBtn   img="popup"	id="idSearchVen" alt="Popup" onclick="onSearchVen()"/></td> 
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
        <td align="right" style="width:10%" >Invoice No&nbsp;</td>
        <td align="left" style="width:15%" ><gw:textbox id="txtInvNo" styles="width:100%" onenterkey="onSearch()" /></td>
        <td align="right"></td>
        <td colspan="3"></td>                    
        <td align="right"></td>
        <td></td>
        <td colspan="2" align="right" ></td>
    </tr>    
    <tr style="height40%;">
        <td colspan="10" >
            <gw:grid
                id      ="grdDtl"  
                header  ="|_tim_cinv_dtl_pk|_tim_cinv_mst_a_pk|_tco_item_pk|_tim_order_pk|Order No|Co. Invoice No|Invoice Date|Item code|Item Name|HS Code|Unit|U/Price|Q'ty|Trans Amt|Vendor ID|Vendor Name|_vendor_pk"
                format  ="3|0|0|0|0|0|0|4|0|0|0|0|0|0|0|0|0|0"
                aligns  ="1|0|0|0|0|0|0|1|1|0|1|1|3|3|3|0|0|0"
                defaults="|||||||||||||||||"
                editcol ="1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                widths  ="500|0|0|0|0|1200|1600|1400|1400|2500|1200|800|1400|1400|1400|1200|2000|0"                styles  ="width:100%; height:100%"                
                sorting ="F"                				
            />
        </td>
    </tr>
	<tr style="height:5%;">
		<td colspan="10">
            <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="height:100%">
				<tr>
					<td align="right" width="70%"><gw:imgBtn id="ibtnSelect" img="select" alt="Select" onclick="onSelect()" /></td>
					<td align="right" width="10%"><gw:imgBtn id="ibtnAddNew" img="new" alt="New" onclick="onNew()" /></td>
					<td align="right" width="10%"><gw:imgBtn id="ibtnSave" img="save" alt="Save" onclick="onSave()" /></td>
					<td align="right" width="10%"><gw:imgBtn id="ibtnDelete" img="delete" alt="Delete" onclick="OnDelete()" /></td>					
				</tr>
            </table>			
		</td>
	</tr>
    <tr style="height45%;">
        <td colspan="10" >
            <gw:grid
                id      ="grdDtl2"  
                header  ="|_tac_cinv_ap_pk|Co.Invoice No|Invoice Date|_tco_item_pk|Item code|Item Name|Unit|Q'ty|Price|Trans Amt|Vendor ID|Vendor Name|_tim_cinv_dtl_pk"
                format  ="3|0|0|4|0|0|0|0|0|0|0|0|0|0"
                aligns  ="1|0|0|1|0|1|0|1|3|3|3|0|0|0"
                defaults="|||||||||||||"
                editcol ="1|0|0|0|0|0|0|0|1|0|0|0|0|0"
                widths  ="500|0|1400|1400|0|1200|2000|800|1200|1000|1600|1400|2000|0"
                styles  ="width:100%; height:100%"                
                sorting ="F"                				
            />
        </td>
    </tr>
</table>	
<gw:textbox id="txtcompk"           style="display:none" />
<!---------------------------------------------------------------------------------------------------->
</body>
</html>