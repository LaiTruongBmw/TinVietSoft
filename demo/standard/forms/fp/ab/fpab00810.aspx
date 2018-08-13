<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head>
    <title>Pop Up Get Item Barcode</title>
</head>
<script>
var G_PK            = 0,
    G_NO            = 1,
    G_Item_Name     = 2,
    G_ITEM_BC       = 3,
    G_ITEM_AMOUNT   = 4,
    G_UNIT_PRICE    = 5,
    G_LOT_NO        = 6,
    G_OUT_QTY       = 7,
    G_REF_NO        = 8,
    G_DESCRIPTION   = 9,    
    G_OUT_UOM       = 10,      
    G_CRT_DATE      = 11,
	G_WH_NAME       = 12,
    G_TABLE_D_PK    = 13,
    G_TABLE_D_NM    = 14,
    G_TABLE_M_PK    = 15,
    G_TABLE_NM_NM   = 16;

function BodyInit()
{
    idGrid.SelectionMode = 

    txtMasterPK.text    = "<%=Request.QueryString("p_master_pk")%>";	  	
	txtDetailPK.text    = "<%=Request.querystring("p_detail_pk")%>";	
	txtDetailName.text  = "<%=Request.querystring("p_detail_nm")%>";

    dsoSelectItemBarcode.Call("SELECT");
}
function OnSearch()
{
    dsoSelectItemBarcode.Call("SELECT");
}
function LoadSum()
{
	var t_item_qty      = 0  ;
	var t_temp_item_pk  = "" ;
	var t_item_count    = 0  ;
	var t_uom           = "" ;
	
	for(var i=1; i<idGrid.rows; i++)				
	{
	    t_item_count = t_item_count + 1;
		t_item_qty = Number(t_item_qty) + Number(idGrid.GetGridData(i, G_OUT_QTY)) ;
		t_uom = idGrid.GetGridData(i, G_OUT_UOM);					
	}

	lbItemNum.text = addCommas(t_item_count) + " Barcode" ;
	lbItemQty.text = addCommas(t_item_qty)   + " (" + t_uom + ")";
}
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "dsoSelectItemBarcode":
			LoadSum();		
            break;
	}
}
function addCommas(nStr)
{
	nStr += '';
	x = nStr.split('.');
	x1 = x[0];
	x2 = x.length > 1 ? '.' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1))
	{
		x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2;
}
function OnDelete()
{
    idGrid.DeleteRow();
}
function OnSave()
{
    dsoSelectItemBarcode.Call();
}
function OnGridCellDoubleClick(oGrid)
{
    var row = oGrid.GetGridControl().RowSel;
    var barcode = oGrid.GetGridData(row, G_ITEM_BC);
    window.returnValue = barcode;
    this.close();
}
</script>
<body>
    <gw:data id="dsoSelectItemBarcode" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="lg_sel_fpab00810" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" procedure="lg_upd_fpab00810" > 
                  <input bind="idGrid" > 
					<input bind="txtMasterPK" />
					<input bind="txtDetailPK" />
				  	<input bind="txtDetailName" />                   
                  </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>

<table style="height: 100%; width: 100%">
    <tr style="height: 1%">
        <td style="width: 10%" align="right">
            ITEM BC
        </td>
        <td style="width: 20%">
            <gw:textbox id="txtItemBC" styles="width:100%" csstype="mandatory" onenterkey="OnSearch()" />
        </td>
        <td style="width: 5%">
        </td>
       
        <td style="width: 20%" align="left">
            <gw:label id="lbItemNum" styles='width:100%;color:cc0000;font:9pt'>-</gw:label>
        </td>
        <td style="width: 15%; color: blue" align="left">
            Total Qty :
        </td>
        <td style="width: 10%" align="left">
            <gw:label id="lbItemQty" styles='width:100%;color:cc0000;font:9pt'>-</gw:label>
        </td>
        <td style="width: 3%" >
            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
        </td>
        <td style="width: 1%">
            <gw:button id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
        </td>
        <td style="width: 1%" >
            <gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
        </td>
    </tr>
    <tr style="height: 99%">
        <td colspan="10">
            <gw:grid id="idGrid" header="_PK|No|Item Name|Barcode|_ITEM_AMOUNT|_UNIT_PRICE|Lot No|Qty|Ref No|Description|_OUT_UOM|Create Date|Warehouse|_T_D_PK|_T_D_NM|_T_M_PK|_T_M_NM"
                format="0|0|0|0|0|0|0|0|-2|0|0|0|0|0|0|0|0" 
                aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                defaults="||||||||||||||||" 
                editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                widths="0|0|0|1000|0|1500|4000|0|0|0|0|0|0|0|0|0|0"
                styles="width:100%; height:100%" sorting="T" autosize="T" oncelldblclick="OnGridCellDoubleClick(this)" />
        </td>
    </tr>
</table>
<gw:textbox id="txtMasterPK" styles="width:100%;display:none" />
<gw:textbox id="txtDetailPK" styles="width:100%;display:none" />
<gw:textbox id="txtDetailName" styles="width:100%;display:none" />
</body>
</html>