<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Booking Checking</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>

var G1_WH_ID		= 0,
	G1_ITEM			= 1,
	G1_LOT_NO		= 2,
	G1_STOCK_QTY	= 3,
	G1_RES_QTY		= 4,
	G1_COMM_QTY		= 5,
	G1_SPEC			= 6;

var G2_Type			= 0,
	G2_NO			= 1,
	G2_BILL_TO		= 2,
	G2_SO_ITEM_NO	= 3,
	G2_BOOK_QTY		= 4,
	G2_ISSUE_QTY	= 5;
    
//===========================================================================

function BodyInit()
{   
    System.Translate(document); 
	var callerWindowObj = dialogArguments;    
                
    txtWHPK.text 	= callerWindowObj.txtWHPK.text   ;
    txtITEMPK.text 	= callerWindowObj.txtITEMPK.text ; 
	txtLOTNO.text 	= callerWindowObj.txtLOTNO.text  ;
	
	OnSearch('grdItem');
}
 
//===========================================================================

function BindingDataList()
{
     
}

//===========================================================================

function OnDataReceive(pos)
{
    switch(pos.id)
    {
        case 'data_bisb00061':
			if ( grdItem.rows > 1 )
			{
            	lbWarehouse.text = grdItem.GetGridData( 1, G1_WH_ID);
				lbItem.text 	 = grdItem.GetGridData( 1, G1_ITEM);
				lbLotNo.text	 = grdItem.GetGridData( 1, G1_LOT_NO);
				
				lbStockQty.text	    = grdItem.GetGridData( 1, G1_STOCK_QTY);
				lbReservedQty.text	= grdItem.GetGridData( 1, G1_RES_QTY);
				lbCommQty.text		= grdItem.GetGridData( 1, G1_COMM_QTY);
				
				lbSpec.text	= grdItem.GetGridData( 1, G1_SPEC);
			}	
			
			OnSearch('grdDetail');
        break;
		
		case 'data_bisb00061_1':
			if (grdDetail.rows > 1)
			{
				grdDetail.SetCellBold( 1, G2_BOOK_QTY, grdDetail.rows-1, G2_ISSUE_QTY, true);
				
				grdDetail.Subtotal( 0, 2, -1, '4!5');
			}	
		break;
    }
}
 
//===========================================================================

function OnSearch(obj)
{
    switch(obj)
    {
        case 'grdItem':
            data_bisb00061.Call("SELECT");
        break;
		
        case 'grdDetail':
            data_bisb00061_1.Call("SELECT");
        break;
    }
    
}

//===========================================================================
 
</script>

<body>
  	<!---------------------------------------------------------------->
    <gw:data id="data_bisb00061" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="lg_sel_bisb00061" parameter="0,1,2,3,4,5,6,7,8">  
                <input bind="grdItem"> 
                    <input bind="txtWHPK" />
                    <input bind="txtITEMPK" />
					<input bind="txtLOTNO" />
                </input> 
                <output bind="grdItem" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_bisb00061_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="lg_sel_bisb00061_1"   parameter="0,1,2,3,4,5,6,7,8">  
                <input bind="grdDetail"> 
                    <input bind="txtWHPK" />
                    <input bind="txtITEMPK" />
					<input bind="txtLOTNO" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 100%">
                <fieldset style="padding: 2; width: 100%; height: 20%">
                    <table style="height: 20%; width: 100%" name="Group" id="TabGroup">                        
                        <tr style="height: 1%">
                            <td style="width: 5%; white-space: nowrap">
                                W/H
                            </td>
                            <td style="width: 30%">
                                <gw:label id="lbWarehouse" styles='width:100%;color:cc0000;font:10pt'>-</gw:label>
                            </td>
                            <td style="width: 5%; white-space: nowrap">
                                Item
                            </td>
                            <td style="width: 30%">
                                <gw:label id="lbItem" styles='width:100%;color:cc0000;font:10pt'>-</gw:label>
                            </td>
                            <td style="width: 5%; white-space: nowrap">
                                Lot No
                            </td>
                            <td style="width: 25%">
                                <gw:label id="lbLotNo" styles='width:100%;color:cc0000;font:10pt'>-</gw:label>
                            </td>
                        </tr>
                        <tr style="height: 1%">
                            <td style="width: 5%; white-space: nowrap">
                                Stock Qty
                            </td>
                            <td style="width: 30%">	
								<gw:label id="lbStockQty" styles='width:100%;font:11pt;color:blue' type="number" format="###,###.###" ></gw:label>							 
                            </td>
                            <td style="width: 5%; white-space: nowrap">
                                Reserved Qty
                            </td>
                            <td style="width: 30%">
								<gw:label id="lbReservedQty" styles='width:100%;font:11pt;color:blue' type="number" format="###,###.###" ></gw:label>
                            </td>						
							<td style="width: 5%; white-space: nowrap">
                                Comm Qty
                            </td>
                            <td style="width: 25%">
								<gw:label id="lbCommQty" styles='width:100%;font:11pt;color:blue' type="number" format="###,###.###" ></gw:label>							
                            </td>
                        </tr>
 						<tr style="height: 1%">
                            <td style="width: 5%; white-space: nowrap">
                                Spec
                            </td>
                            <td style="width: 30%" colspan=5>
                                <gw:label id="lbSpec" styles='width:100%;font:9pt;color:cc0000'></gw:label>                             
                            </td>
                        </tr>						                        
                    </table>
                </fieldset>			                
            </td>
        </tr>
 		<tr style="height: 99%">
            <td>
                <gw:grid id='grdDetail' header='Type|No|Bill To|S/O Item No|Book Qty|Issue Qty'
                    format='0|0|0|0|0|0' 
					aligns='1|1|0|1|3|3' 
					check='|||||' 
					editcol='0|0|0|0|0|0'
                    widths='1000|1000|4000|1500|1500|1500' sorting='T' styles='width:100%; height:100%'
                    />
            </td>
        </tr>		
    </table>
</body>
<!------------------------------------------------------->
<gw:textbox id="txtWHPK" styles="width: 100%;display: none" />
<gw:textbox id="txtITEMPK" styles="width: 100%;display: none" />
<gw:textbox id="txtLOTNO" styles="width: 100%;display: none" />
<!------------------------------------------------------->
<gw:grid id='grdItem'
header='WH_ID|ITEM|LOT_NO|STOCK_QTY|RES_QTY|COMM_QTY|SPEC'
format='0|0|0|0|0|0|0'
aligns='0|0|0|0|0|0|0'
check='||||||'
editcol='1|1|1|1|1|1|1'
widths='1000|1000|1000|1000|1000|1000|1000'
sorting='T'
autosize='T' 
styles='width:100%; height:460;display:none'
/>
<!------------------------------------------------------->
</html>
