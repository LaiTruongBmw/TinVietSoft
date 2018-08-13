<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">

<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head>
    <title>POP Transaction</title>
</head>

<script type="text/javascript" language="javascript">
var p_comma = '' ;
//=========================================================================================
//'Item BC|Item Code|Item Name|UOM|Lot No|Quantity|Warehouse ID|Warehouse Name|Warehouse Loc'
var G1_ITEM_BC			= 0,
	G1_ITEM_CODE		= 1,
	G1_ITEM_NAME		= 2,
	G1_UOM			= 3,
	G1_LOT_NO		= 4,
	G1_QUANTITY		= 5,
	G1_WH_ID		= 6,
	G1_WH_NAME		= 7,
	G1_WH_LOC		= 8;
	
//=================================================================================

function BodyInit()
{     
    System.Translate(document);
    BindingDataList();         
}
//=================================================================================

function BindingDataList()
{    
    var data="";    
	
      
    data = "<%=CtlLib.SetListDataSQL("select pk, WH_ID || ' * '| | WH_NAME from TLG_IN_WAREHOUSE a where  del_if=0 order by WH_ID ")%>||";
    lstWarehouse.SetDataText( data);
    lstWarehouse.value = '' ;	
	
	lstStatus.SetDataText("|1|In Warehouse|2|Not in Warehouse||Select All");
	lstStatus.value = "1";

	
    SetGridFormat();

} 
//---------------------------------------------------------------------------------------------------
 function SetGridFormat()
 {
    var ctr = grdMaster.GetGridControl(); 
    ctr.ColFormat(G1_QUANTITY) = "#,###,###,###,###,###";
 }
//=================================================================================
function OnSearch()
{
     data_biws00040.Call('SELECT');    
}

//=================================================================================

function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'data_biws00040':			 
			if ( grdMaster.rows > 1 )
			{   				   				 			  
   				lblRecord.text=grdMaster.rows-1 + " Rows.";
        
			} 
		break;
		case 'data_biws00040_1':			 
			
		break;
		
		
		
	}
}

function loadDetail()
{
	for (i = 0; i < grdMaster.rows; i++)	
	{
			if (grdMaster.GetGridControl().isSelected(i)== true)
			{
				 
				txtMasterPK.text=grdMaster.GetGridData(grdMaster.row,0);
				data_biws00040_1.Call('SELECT');
			}
	}
	
}

//=========================================================================================================

</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
    <!------------------------------------------------------------------->
    <gw:data id="data_biws00040" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_biws00040" > 
                <input> 
					 <input bind="txtItem" />
					 <input bind="txtBarcode" />
					 <input bind="txtBCLotNo" />
					 <input bind="lstStatus" />
					 <input bind="lstWarehouse" />
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
     <gw:data id="data_biws00040_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" function="st_lg_sel_biws00040_1" > 
                <input> 
					 <input bind="txtMasterPK" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%;">
        <tr style="width: 100%; height: 1%; white-space: nowrap;">
            <td style="width: 10%; white-space: nowrap" align="right" >
                Item
            </td>
            <td style="width: 15%; white-space: nowrap;">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch()"/>
            </td>
            <td style="width: 10%; white-space: nowrap" align="right" >
                Barcode No
            </td>
            <td style="width: 15%; white-space: nowrap;">
                <gw:textbox id="txtBarcode" styles="width:100%" onenterkey="OnSearch()"/>
            </td>
            <td style="width: 10%; white-space: nowrap" align="right" >
                Lot No
            </td>
            <td style="width: 15%; white-space: nowrap;">
                <gw:textbox id="txtBCLotNo" styles="width:100%" onenterkey="OnSearch()"/>
            </td>
			
			<td style="width: 5%; white-space: nowrap" align="right" >
             
            </td>            
			<td style="width: 15%; white-space: nowrap;">
                <gw:label id="lblRecord"  text=""  />
            </td>		                    
                      
            <td style="width: 1%">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
        </tr>
		<tr style="width: 100%; height: 1%; white-space: nowrap;">
            <td style="width: 10%; white-space: nowrap" align="right" >
                Status
            </td>
            <td style="width: 15%; white-space: nowrap;">
                <gw:list id="lstStatus" styles="width:100%;" />
            </td>
            <td style="width: 10%; white-space: nowrap" align="right" >
                Warehouse
            </td>
            <td style="width: 15%; white-space: nowrap;">
                <gw:list id="lstWarehouse" styles="width:100%;" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right" >
                
            </td>
            <td style="width: 15%; white-space: nowrap;">
                
            </td>
			
			<td style="width: 5%; white-space: nowrap" align="right" >
                
            </td>            
			<td style="width: 15%; white-space: nowrap;">
             
            </td>		                    
                      
            <td style="width: 1%">
                
            </td>
        </tr>
        <tr style="width: 100%; height: 40%">
            <td colspan="17">
                <gw:grid id='grdMaster' 
                    header='Item BC|Item Code|Item Name|UOM|Lot No|Qty|Warehouse ID|Warehouse Name|Location|Date|Supplier ID'
                    format='0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|1|3|0|0|0|0|0' 			 
                    editcol='0|0|0|0|0|0|0|0|0|0|0' 
					widths='1500|1500|2500|1000|1500|1000|2000|2500|1000|1500|2000'
                    sorting='T' styles='width:100%; height:100%'
					autosize="T"
					oncellclick="loadDetail()"/>
            </td>
        </tr>
		<tr style="width: 100%; height: 2%">
			<td colspan="17"></td>
		</tr>
		<tr style="width: 100%; height: 50%">
            <td colspan="17">
                <gw:grid id='grdDetail' 
                    header='_pk|Item BC|Item Code|Item Name|UOM|Lot No|In Type|In Qty|Out Type|Out Qty|Warehouse ID|Warehouse Name|Location|Date|Supplier ID'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|1|0|3|3|3|3|0|0|0|0|0' 			 
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='1000|1500|1500|2500|1000|1500|1000|1000|1000|1000|2000|2500|1000|1500|2000'
                    sorting='T' autosize="T" styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles="width:100%;display:none"  />
	<gw:textbox id="txtTransPK" styles="width:100%;display:none"  />
	<gw:textbox id="txtMasterPK" styles="display:none;" />
</body>
 </html>