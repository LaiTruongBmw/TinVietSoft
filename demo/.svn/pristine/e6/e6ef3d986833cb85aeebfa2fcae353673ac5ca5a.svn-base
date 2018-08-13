<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>W/H Stock Checking</title>
</head>

<script>

var G1_LOC_ID	  	= 0,
	G1_STORE_QTY  	= 1,
	G1_TOTAL_QTY  	= 2,
    G1_REMAIN_QTY 	= 3,
	G1_ITEM_CODE	= 4,
    G1_ITEM_NAME  	= 5,
	G1_UOM 		  	= 6,
	G1_LOT_NO	  	= 7,
    G1_INV_QTY     	= 8,
	G1_LAST_DATE	= 9,
	G1_STORE_DAYS   = 10,
	G1_WHLOC_PK		= 11,
	G1_ITEM_PK		= 12;

//=============================================================================
function BodyInit()
{
    System.Translate(document);
	//---------------------
    FormatGrid();
}
//=============================================================================
function FormatGrid()
{
    var data ;		
    //-----------------	
	data = "<%=ESysLib.SetListDataSQL("select pk, strg_id || ' * ' || strg_name from tlg_in_storage where del_if = 0 and use_yn = 'Y' order by strg_id " )%>||Select ALL";
    lstStorage.SetDataText(data);
    lstStorage.value = '';

    data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from TLG_IT_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||";
    lstItemGroup.SetDataText(data);
    lstItemGroup.value = '';    
	//-----------------
	data = "data|10|Grand|20|by Location";
    lstGridType.SetDataText(data);  
    lstGridType.value = '10'; 
	
	//-----------------
	
	var ctrl = grdINOUT.GetGridControl();

    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;
    ctrl.MergeCol(2) = true;
    ctrl.MergeCol(3) = true;
    ctrl.MergeCol(4) = true;
    ctrl.MergeCol(5) = true;
    ctrl.MergeCol(6) = true;

    ctrl.ColFormat(G1_STORE_QTY) 	= "###,###,###.##" ;
    ctrl.ColFormat(G1_TOTAL_QTY)    = "###,###,###.##" ;
    ctrl.ColFormat(G1_REMAIN_QTY) 	= "###,###,###.##" ;
	ctrl.ColFormat(G1_INV_QTY)  	= "###,###,###.##" ;

	//------

}
//=============================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'BALANCE':
            //---------------------
            data_biws00010_3.Call('SELECT');
        break;
    }
}

//=============================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_biws00010_3':
            if ( grdINOUT.rows > 1 )
            {                                 
				grdINOUT.SetCellBold( 1, G1_LOC_ID, 	grdINOUT.rows - 1, G1_LOC_ID,   	true);
				grdINOUT.SetCellBold( 1, G1_ITEM_CODE, 	grdINOUT.rows - 1, G1_ITEM_CODE,   true);
				
				grdINOUT.SetCellBgColor( 1, G1_REMAIN_QTY, grdINOUT.rows - 1, G1_REMAIN_QTY, 0xCCFFFF );
                grdINOUT.SetCellBgColor( 1, G1_INV_QTY,	   grdINOUT.rows - 1, G1_INV_QTY,    0xFFFFCC );			

				if ( lstGridType.value == '20' )
				{
					grdINOUT.Subtotal( 0, 2, 0, '8','###,###,###.##');	
				}
				else if ( lstGridType.value == '10' )
				{
					grdINOUT.Subtotal( 0, 2, -1, '8','###,###,###.##');	
				}					
            }
        break;
    }
}
//=============================================================================
var vLOC_PK, vLOC_ID, vITEM_PK, vLOTNO;

function OnPopUp(pos)
{
	switch (pos)
	{
		case 'DETAIL':
		
			if ( ( event.col == G1_ITEM_CODE || event.col == G1_ITEM_NAME || event.col == G1_LOT_NO || event.col == G1_INV_QTY ) && event.row > 0 )
			{
				var col = event.col ;
				var row = event.row ;
				 
				vLOC_PK  = grdINOUT.GetGridData( row, G1_WHLOC_PK );
				vLOC_ID  = grdINOUT.GetGridData( row, G1_LOC_ID   );					
				vITEM_PK = grdINOUT.GetGridData( row, G1_ITEM_PK  );
				vLOTNO   = grdINOUT.GetGridData( row, G1_LOT_NO   );
				
			    var url = System.RootURL + '/form/bi/ws/biws00011.aspx';
				var aValue  = System.OpenModal(  url , 900, 450, 'resizable:yes;status:yes', this);
			}
			
		break;	

		case 'REPORT':
			var path = System.RootURL + '/form/bi/ws/biws00012.aspx';
			var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
		break;	
	}
}
 
//=============================================================================
function OnReport(pos)
{
	
	switch (pos)
	{				
		case 'ST01':
			var url = System.RootURL + "/reports/bi/ws/rpt_biws00010_ST01.aspx?p_storage_pk="+lstStorage.value+ "&p_location=" + txtLocation.text ;
				url = url + "&p_stock_date=" + dtStockDate.value + "&p_grp_pk=" + lstItemGroup.value + "&p_item=" + txtItem.text ;
				url = url + "&p_chk_bal=" + chkBal.value + "&p_chk_lot=" + chkLot.value ;
     	 
			System.OpenTargetPage(url);
		break;

		case 'ST02':
			var url = System.RootURL + "/reports/bi/ws/rpt_biws00010_ST02.aspx?p_storage_pk="+lstStorage.value+ "&p_location=" + txtLocation.text ;
				url = url + "&p_stock_date=" + dtStockDate.value + "&p_grp_pk=" + lstItemGroup.value + "&p_item=" + txtItem.text ;
				url = url + "&p_chk_bal=" + chkBal.value + "&p_chk_lot=" + chkLot.value ;
     	 
			System.OpenTargetPage(url);
		break;
	}		 
}
 
//=============================================================================
</script>

<body>    
    <!--------------------------------------------------------------------->
    <gw:data id="data_biws00010_3" onreceive="OnDataReceive(this)">
        <xml>
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_sel_biws00010_3"  >
                <input bind="grdINOUT" >
					<input bind="lstStorage" />
			        <input bind="txtLocation" />				
					<input bind="dtStockDate" />			 
					<input bind="lstItemGroup" />
			        <input bind="txtItem" />
					<input bind="chkBal" />
					<input bind="chkLot" />
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Stock Status">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                Loc
            </td>
            <td style="width: 25%" align="right">
                <gw:list id="lstStorage" styles="width:100%" onchange="OnSearch('BALANCE')" />
            </td>
            <td style="width: 35%" align="right">
                <gw:textbox id="txtLocation" maxlen="100" styles='width:100%' onenterkey="OnSearch('BALANCE')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Date
            </td>
            <td style="width: 20%; white-space: nowrap">
                <gw:datebox id="dtStockDate" lang="1"   />                
            </td>
			<td style="width: 8%; white-space: nowrap" align="right">                
            </td>
            <td style="width: 1%; white-space: nowrap" align="right">
                <gw:imgbtn id="ibtnReport2" img="excel" alt="report" text="Report" onclick="OnPopUp('REPORT')" /> 
            </td>
            <td style="width: 1%; white-space: nowrap" align="right" >
                <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('BALANCE')" /> 
            </td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                Item
            </td>
            <td style="width: 25%" align="right">
                <gw:list id="lstItemGroup" styles="width: 100%" onchange="OnSearch('BALANCE')" />
            </td>
            <td style="width: 35%">
                <gw:textbox id="txtItem" maxlen="100" styles='width:100%' onenterkey="OnSearch('BALANCE')" />
            </td>
            <td style="width: 25%; white-space: nowrap" colspan="2" align="center">                
                <gw:checkbox id="chkBal" styles="color:red" defaultvalue="Y|N" value="N" onchange="OnSearch('BALANCE')">End Qty>0</gw:checkbox>	
				<gw:checkbox id="chkLot" styles="color:red" defaultvalue="Y|N" value="Y" onchange="OnSearch('BALANCE')">Lot No</gw:checkbox>	
            </td>
            <td style="width: 3%" align="right" colspan=3 > 
				<gw:list id="lstGridType" styles='width:80' />	
            </td>            
        </tr>
        <tr style="height: 98%">
            <td colspan="13">
                <gw:grid id='grdINOUT' 
					header='Loc ID|Store Qty|Total Qty|Remain Qty|Item Code|Item Name|UOM|Lot No|Inv Qty|Last In Date|Store days|_WH_LOC_PK|_ITEM_PK'
                    format='0|0|0|0|0|0|0|0|0|4|0|0|0' 
					aligns='1|3|3|3|0|0|1|1|3|1|3|0|0'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='1500|1500|1500|1500|1500|3500|800|1200|1500|1200|1200|0|0'
                    sorting='T' styles='width:100%; height:100%' 
					acceptnulldate="T"
					oncelldblclick="OnPopUp('DETAIL')" />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
</body>
</html>
