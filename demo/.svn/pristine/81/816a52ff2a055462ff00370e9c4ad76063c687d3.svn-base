<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>W/H Stock Checking</title>
</head>

<script>
//'Warehouse Name|Location Name|Item Barcode|Quantity|Item Code|Item Name|UOM|Lot No'
var G1_WAREHOUSE  = 0,
	G1_LOCATION   = 1,
	G1_ITEM_BARCODE    = 2,
	G1_QUANTITY	  = 3,
    G1_ITEM_CODE  = 4,
    G1_ITEM_NAME  = 5,
	G1_UOM 		  = 6,
	G1_LOT_NO 	  = 7;
    
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
	data = "<%=CtlLib.SetListDataSQL("select a.pk, a.strg_id ||' * '||a.strg_name from tlg_in_storage a where a.del_if=0 and a.use_yn = 'Y' order by a.strg_id")%>||Select All";
    lstWHType01.SetDataText(data);
    lstWHType01.value = '';

	data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from TLG_in_warehouse where del_if = 0 and use_yn='Y' order by wh_id")%>";
	lstWH01.SetDataText( data + "||");
    lstWH01.value = '';

    data = "<%=CtlLib.SetListDataSQL("select a.pk, lpad('-',level ,'-')||a.grp_cd || ' - ' || a.grp_nm from tlg_it_itemgrp a where a.del_if = 0 and a.use_yn='Y'  connect by prior a.pk = A.P_PK start with A.P_PK is null order siblings by grp_cd ")%>||Select All";
    lstItemGroup01.SetDataText(data);
    lstItemGroup01.value = '';    
	
	var ctrl = grdINOUT.GetGridControl();

    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;

    ctrl.ColFormat(G1_QUANTITY) = "###,###,###" ;
    
	
}
//=============================================================================
function OnSearch(id)
{
  data_biws00050.Call('SELECT');
       
}

//=============================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_biws00050':
          if ( grdINOUT.rows > 1 )
            {
				grdINOUT.Subtotal( 0, 2, 0, '3');
            }
        break;
		
			
    }
}

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_biws00050" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="st_lg_pro_biws00050" >
                <input>
                    <input bind="lstWHType01" />
                </input>
                <output>
                    <output bind="lstWH01" />
                </output>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_biws00050" onreceive="OnDataReceive(this)">
        <xml>
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="st_lg_sel_biws00050"  >
                <input bind="grdINOUT" >
					<input bind="lstWHType01" />
			        <input bind="lstWH01" />
			        <input bind="txtLocation" />
					<input bind="lstItemGroup01" />
			        <input bind="txtItem01" />
			        <input bind="txtBarcode" />
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>

    <!---------------------------------------------------------------->	
    <table style="width: 100%; height: 100%" name="Stock Status">
        <tr style="height: 0%">
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
        </tr>
        <tr style="height: 1%">
            <td colspan="3" style="white-space: nowrap" align="right">W/H</td>
            <td colspan="20" align="right">
                <gw:list id="lstWHType01" styles="width:100%" onchange="pro_biws00050.Call()" />
            </td>
            <td colspan="25" align="right">
                <gw:list id="lstWH01" styles="width: 100%"/>
            </td>
            <td colspan="8" align="right">
                
            </td>
            <td colspan="5" style="white-space: nowrap;" align="right">
				Location
			</td>
            <td colspan="20" style="white-space: nowrap">
               <gw:textbox id="txtLocation" maxlen="100" styles='width:100%' onenterkey="OnSearch()" />
            </td>
            <td colspan="7" align="center">
				
			</td>
            <td colspan="5" style="white-space: nowrap" align="right">
                
            </td>
            <td colspan="5" >
                <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('BALANCE')" />
            </td>
            <td colspan="2" >
                <gw:button id="ibtnReport1" img="excel" alt="Report" text="Report" onclick="OnPrint()" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td colspan="3" style="white-space: nowrap" align="right">Item</td>
            <td colspan="20" align="right">
                <gw:list id="lstItemGroup01" styles="width: 100%" />
            </td>
            <td colspan="25">
                <gw:textbox id="txtItem01" maxlen="100" styles='width:100%' onenterkey="OnSearch()" />
            </td>
           <td colspan="8" align="right">
                
            </td>
            <td colspan="5" style="white-space: nowrap;" align="right">
				Barcode
			</td>
            <td colspan="20" style="white-space: nowrap">
               <gw:textbox id="txtBarcode" maxlen="100" styles='width:100%' onenterkey="OnSearch()" />
            </td>
            <td colspan="8" align="right">
               
            </td>
            <td colspan="10" align="right">
                
            </td>
            <td colspan="2" align="right">
                
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="100">
                <gw:grid id='grdINOUT' 
					header='Warehouse Name|Location Name|Item Barcode|Quantity|Item Code|Item Name|UOM|Lot No'
                    format='0|0|0|0|0|0|0|0' 
					aligns='0|0|0|3|0|0|0|0'
                    editcol='0|0|0|0|0|0|0|0' 
					widths='2500|2000|2000|1500|2000|2500|1500|1500'
                    sorting='T' styles='width:100%; height:100%'  />
            </td>
        </tr>
    </table>
  
</body>
</html>
