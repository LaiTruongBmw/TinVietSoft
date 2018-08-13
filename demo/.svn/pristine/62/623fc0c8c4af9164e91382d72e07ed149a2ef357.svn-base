<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Booking Checking</title>
</head>
<%  ESysLib.SetUser("inv")%>

<script>
var G_wh_id         = 0,
    G_st_code       = 1,
    G_st_name       = 2,
	G_item_pk		= 3,
    G_item_code     = 4,
    G_item_name     = 5,
    G_uom           = 6,
    G_lot_no        = 7,
    G_end_bal       = 8,
    G_book_qty      = 9,
    G_issue_qty     = 10,
    G_reserve_qty   = 11,
    G_comm_qty      = 12,
    G_wh_pk         = 13;
    
var G1_WH_ID        = 0 ,
    G1_Book_Type    = 1 ,
    G1_Book_Qty     = 5 ;

var G2_WH_ID        = 0 ,
    G2_Issue_Type   = 1 ,
    G2_Issue_Qty    = 5 ;
//======================================================================
function BodyInit()
{
    System.Translate(document); 
       BindingDataList()
       OnChangeCondition()
}
//======================================================================

function BindingDataList()
{
    
    var data 
    //---------------------------------
    data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || '-' || grp_nm from comm.tco_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||Select ALL"; 
    lstGroup.SetDataText(data);
    lstGroup.value = '';
    //---------------------------------
    data = "<%=ESysLib.SetListDataSQL("select pk, wh_id || '-' || wh_name from inv.TIN_WAREHOUSE where del_if = 0 and use_yn='Y' order by wh_id ")%>||Select ALL"; 
    lstWH.SetDataText(data);
    lstWH.value = ''; 
    //---------------------------------      
    var ctr = grdStock.GetGridControl();
    ctr.MergeCells = 2 ; 
    
    ctr.MergeCol(0) = true ; 
    ctr.MergeCol(1) = true ; 
    ctr.MergeCol(2) = true ; 
    ctr.MergeCol(3) = true ; 
    ctr.MergeCol(4) = true ; 
    ctr.MergeCol(5) = true ; 
    ctr.MergeCol(6) = true ; 
    
    ctr.ColFormat(G_end_bal)      = "#,###,###,###,###,###.##";
    ctr.ColFormat(G_book_qty)     = "#,###,###,###,###,###.##";
    ctr.ColFormat(G_issue_qty)    = "#,###,###,###,###,###.##";
    ctr.ColFormat(G_reserve_qty)  = "#,###,###,###,###,###.##";
    ctr.ColFormat(G_comm_qty)     = "#,###,###,###,###,###.##";
    
    ctr.FrozenCols = G_st_code;
     
        
}
//======================================================================

function OnSearch(id)
{
    if ( id == 1 )
    {
        data_bisb00010.Call('SELECT')
    }    
}
//======================================================================

function OnChangeCondition()
{
        if ( radCondition.value == 1 )
        {
            grdStock.GetGridControl().ColHidden(G_item_code) = true
            grdStock.GetGridControl().ColHidden(G_item_name) = true
            
            grdStock.GetGridControl().ColHidden(G_st_code) = false
            grdStock.GetGridControl().ColHidden(G_st_name) = false
            grdStock.GetGridControl().ColHidden(G_lot_no)  = true
			data_bisb00010.Call('SELECT');
        }
        else if( radCondition.value == 2 )
        {
            grdStock.GetGridControl().ColHidden(G_item_code) = false
            grdStock.GetGridControl().ColHidden(G_item_name) = false
            
            grdStock.GetGridControl().ColHidden(G_st_code) = true
            grdStock.GetGridControl().ColHidden(G_st_name) = true
            grdStock.GetGridControl().ColHidden(G_lot_no)  = true
			data_bisb00010.Call('SELECT');
        }
        else
        {
            grdStock.GetGridControl().ColHidden(G_item_code) = false
            grdStock.GetGridControl().ColHidden(G_item_name) = false
            grdStock.GetGridControl().ColHidden(G_st_code)   = true
            grdStock.GetGridControl().ColHidden(G_st_name)   = true
            grdStock.GetGridControl().ColHidden(G_lot_no)    = false
			data_bisb00010.Call('SELECT');
        }
}
//======================================================================

function ReceiveData(obj)
{
    if( obj.id == "data_bisb00010" )
    {
        if ( grdStock.rows > 1 )
        {
            grdStock.SetCellBgColor( 1, G_book_qty, grdStock.rows - 1, G_issue_qty, 0xCCFFFF );
        }
        lblRecord.text = grdStock.rows - 1 + " record(s)";            
    }
    else if( obj.id == "data_bisb00010_1" )
    {
        if ( grdBooked.rows > 1 )
        {
            grdBooked.Subtotal( 0, 2, -1, '6','###,###,###.##');
        }
        data_bisb00010_2.Call('SELECT');
    }  
}
//======================================================================
function ShowDetail()
{
    //mo tab 1
    var row, col
    row= event.row;
    col = event.col;
    if((col==G_book_qty || col==G_issue_qty) && (radCondition.value == 2 || radCondition.value == 3))
    {
		var p_book_tr;
		if(col==G_book_qty) p_book_tr = 'I';
		else if(col==G_issue_qty) p_book_tr = 'O';

        var path = System.RootURL + '/form/bi/sb/bisb00011.aspx?p_wh_pk=' + lstWH.value + '&p_item_pk=' + grdStock.GetGridData(row,G_item_pk) + '&p_lot_no=' + grdStock.GetGridData(row,G_lot_no) + '&p_book_tr=' + p_book_tr + '&p_wh_name=' + lstWH.GetText() + '&p_lot_no=' + grdStock.GetGridData(row,G_lot_no);
        var object = System.OpenModal( path, 800, 600, 'resizable:yes;status:yes', this);
    }
   
}
//======================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_bisb00010" onreceive="ReceiveData(this)"> 
        <xml> 
            <dso id="1" type="grid" function="inv.sp_sel_bisb00010" >  
                <input> 
                    <input bind="lstWH" />
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
                    <input bind="radCondition" />
                </input> 
                <output bind="grdStock" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr>
            <td style="height: 100%; width: 100%">
                <table style="height: 100%; width: 100%" name="Stock Booking" border="1">
                    <tr style="height: 1%">
                        <td>
                            <table style="height: 100%; width: 100%">
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        W/H</td>
                                    <td style="width: 20%">
                                        <gw:list id="lstWH" styles="width:100%" onchange="OnSearch(1)" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        Group</td>
                                    <td style="width: 20%">
                                        <gw:list id="lstGroup" styles="width:100%;" onchange="OnSearch(1)" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        Item</td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
                                    </td>
                                    <td style="width: 15%; white-space: nowrap" align="center">
                                        <gw:radio id="radCondition" value="1" styles="width:100%" onchange="OnChangeCondition()"> 
                                                <span value="1">ST Item</span> 
                                                <span value="2">Item</span> 
                                                <span value="3">Lot No</span>
                                         </gw:radio>
                                    </td>
                                    <td style="width: 9%" align="center">
                                        <gw:label id="lblRecord" styles="color: blue">record(s)</gw:label>
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch(1)" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td>
                            <gw:grid id='grdStock' header='WH ID|ST Code|ST Name|_item_pk|Item Code|Item Name|UOM|Lot No|End Bal|Book Qty|Issue Qty|Reserved Qty|Comm Qty|_wh_pk'
                                format='0|0|0|0|0|0|0|0|1|1|1|1|1|0' aligns='0|0|0|0|0|0|1|0|0|0|0|0|0|0' defaults='|||||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1500|1500|2500|0|1500|3000|1000|1500|1500|1500|1500|1500|1500|0'
                                sorting='T' styles='width:100%; height:100%' oncelldblclick="ShowDetail()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------>
</body>
</html>
