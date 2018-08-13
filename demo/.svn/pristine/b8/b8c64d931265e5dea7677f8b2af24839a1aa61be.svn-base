<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Booking Checking</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>
var G_WH_ID     = 0,
    G_ITEM_CODE = 1,
    G_ITEM_NAME = 2,	 
    G_UOM       = 3,
    G_LOT_NO    = 4,
    G_STOCK_QTY = 5,
    G_BOOK_QTY  = 6,
    G_ISSUE_QTY = 7,
    G_RES_QTY   = 8,
    G_COMM_QTY  = 9,
    G_WH_PK     = 10,
    G_ITEM_PK   = 11;

//======================================================================
function BodyInit()
{
       System.Translate(document); 
       BindingDataList()
}
//======================================================================

function BindingDataList()
{
    
    var data 
    //---------------------------------
    data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || '-' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||Select ALL"; 
    lstGroup.SetDataText(data);
    lstGroup.value = '';
    //---------------------------------
    data = "<%=ESysLib.SetListDataSQL("select pk, wh_id || '-' || wh_name from tlg_IN_WAREHOUSE where del_if = 0 and use_yn='Y' order by wh_id ")%>||Select ALL"; 
    lstWH.SetDataText(data);
    lstWH.value = ''; 
	
	//--------------------------------- 
    data = "data|10|Grand Total|20|W/H Subtotal";
    lstGridType.SetDataText(data);  
    lstGridType.value = '10'; 
	
    //---------------------------------      
    var ctr = grdDetail.GetGridControl();
    ctr.MergeCells = 2 ; 
    
    ctr.MergeCol(0) = true ; 
    ctr.MergeCol(1) = true ; 
    ctr.MergeCol(2) = true ; 
    ctr.MergeCol(3) = true ; 
    ctr.MergeCol(4) = true ; 
    ctr.MergeCol(5) = true ; 
    ctr.MergeCol(6) = true ; 
    
    ctr.ColFormat(G_STOCK_QTY) = "#,###,###,###,###,###";
    ctr.ColFormat(G_BOOK_QTY)  = "#,###,###,###,###,###";
    ctr.ColFormat(G_ISSUE_QTY) = "#,###,###,###,###,###";
    ctr.ColFormat(G_RES_QTY)   = "#,###,###,###,###,###";
    ctr.ColFormat(G_COMM_QTY)  = "#,###,###,###,###,###";
    
    ctr.FrozenCols = G_ITEM_CODE;             
}
//======================================================================

function OnSearch(pos)
{
	switch(pos)
	{
		case 'Detail':
			data_bisb00010.Call('SELECT');
		break;		
	}  
}
 
//======================================================================

function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case "data_bisb00010":
			if ( grdDetail.rows > 1 )
        	{
            	grdDetail.SetCellBgColor( 1, G_ITEM_CODE, grdDetail.rows - 1, G_ITEM_NAME, 0xCCFFFF );
				
				grdDetail.SetCellBgColor( 1, G_STOCK_QTY, grdDetail.rows - 1, G_STOCK_QTY, 0xCCFFFF );
				grdDetail.SetCellBgColor( 1, G_RES_QTY,   grdDetail.rows - 1, G_RES_QTY,   0xCCFFFF );
				grdDetail.SetCellBgColor( 1, G_COMM_QTY,  grdDetail.rows - 1, G_COMM_QTY,  0xCCFFFF );
				
				grdDetail.SetCellBold( 1, G_ITEM_CODE, grdDetail.rows - 1, G_ITEM_CODE, true);
				grdDetail.SetCellBold( 1, G_STOCK_QTY, grdDetail.rows - 1, G_STOCK_QTY, true);
				grdDetail.SetCellBold( 1, G_RES_QTY,   grdDetail.rows - 1, G_RES_QTY,   true);
				grdDetail.SetCellBold( 1, G_COMM_QTY,  grdDetail.rows - 1, G_COMM_QTY,  true);
				
				if ( lstGridType.value == '10' )
		        {
		        	grdDetail.Subtotal( 0, 2, -1, '5!6!7!8!9');
		        }
		        else if ( lstGridType.value == '20' )
		        {
		            grdDetail.Subtotal( 0, 2, 0, '5!6!7!8!9');
		        }		         	
        	}
			
        	lblRecord.text = grdDetail.rows - 1 + " record(s)";     
		break;
	}	
}
//======================================================================
function ShowDetail()
{

    var l_wh_pk = grdDetail.GetGridData(grdDetail.row,G_WH_PK);
    var l_item_pk   = grdDetail.GetGridData(grdDetail.row,G_ITEM_PK);
    var l_item_code = grdDetail.GetGridData(grdDetail.row,G_ITEM_CODE);
    
    var path = System.RootURL + '/form/bi/sb/bisb00011.aspx?p_wh_pk=' + l_wh_pk + '&p_item_pk=' + l_item_pk + '&p_item_code='+l_item_code;
    var object = System.OpenModal( path, 800, 600, 'resizable:yes;status:yes', this);
   
}
//=================================================================
function ShowDetail1()
{
    //mo tab 1
    var row, col
    row= event.row;
    col = event.col;
    if((col==G_BOOK_QTY || col==G_ISSUE_QTY) && (radCondition.value == 2 || radCondition.value == 3))
    {
		var p_book_tr;
		if(col==G_BOOK_QTY) p_book_tr = 'I';
		else if(col==G_ISSUE_QTY) p_book_tr = 'O';

        var path = System.RootURL + '/form/bi/sb/bisb00011.aspx?p_wh_pk=' + lstWH.value + '&p_item_pk=' + grdDetail.GetGridData(row,G_ITEM_PK) + '&p_lot_no=' + grdDetail.GetGridData(row,G_LOT_NO) + '&p_book_tr=' + p_book_tr + '&p_wh_name=' + lstWH.GetText() + '&p_lot_no=' + grdDetail.GetGridData(row,G_LOT_NO);
        var object = System.OpenModal( path, 800, 600, 'resizable:yes;status:yes', this);
    }
   
}
//======================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_bisb00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="lg_sel_bisb00010" >  
                <input> 
                    <input bind="lstWH" />
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
                    <input bind="radCondition" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------>
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            W/H
                        </td>
                        <td style="width: 15%">
                            <gw:list id="lstWH" styles="width:100%" onchange="OnSearch('Detail')" />
                        </td>
                        <td style="width: 5%" align="right">
                            Group
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstGroup" styles="width:100%;" onchange="OnSearch('Detail')" />
                        </td>
                        <td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="center">
                            <gw:radio id="radCondition" value="2" styles="width:100%" onchange="OnSearch('Detail')"> 
                                           	<span value="1">ST Item</span> 
                                            <span value="2">Item</span> 
                                            <span value="3">Lot No</span>
                                         </gw:radio>
                        </td>
                        <td style="width: 9%" align="center">
                            <gw:label id="lblRecord" styles="color: blue">record(s)</gw:label>
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Detail')" />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnDetail" img="2" text="Detail" onclick="ShowDetail()" />
                        </td>
                        <td style="width: 10%; white-space: nowrap">
                            <gw:list id="lstGridType" styles='width:100%;' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id='grdDetail' header='W/H|Item Code|Item Name|UOM|Lot No|Stock Qty|Book Qty|Issue Qty|Reserved Qty|Comm Qty|_WH_PK|_ITEM_PK'
                    format='0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|1|1|3|3|3|3|3|1|1' editcol='0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='1500|2000|3500|800|1500|1500|1200|1200|1500|1500|1000|1000' sorting='T' styles='width:100%; height:100%'
                    oncelldblclick="ShowDetail()" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------>
</body>
</html>
