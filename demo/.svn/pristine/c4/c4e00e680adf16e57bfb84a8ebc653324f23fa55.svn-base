<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Booking Checking</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var G_wh_id         = 0,
    G_st_code       = 1,
    G_st_name       = 2,
    G_item_code     = 3,
    G_item_name     = 4,
    G_uom           = 5,
    G_lot_no        = 6,
    G_end_bal       = 7,
    G_book_qty      = 8,
    G_issue_qty     = 9,
    G_reserve_qty   = 10,
    G_comm_qty      = 11,
    G_wh_pk         = 12;
    
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
    data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || '-' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>|ALL|Select ALL"; 
    lstGroup.SetDataText(data);
    lstGroup.value = 'ALL';
    //---------------------------------
    data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || '-' || wh_name from tlg_IN_WAREHOUSE where del_if = 0 and use_yn='Y' order by wh_id ")%>|ALL|Select ALL"; 
    lstWH.SetDataText(data);
    lstWH.value = 'ALL'; 
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
    data_fpab00170.Call('SELECT')
}
//======================================================================

function OnChangeCondition()
{
    if(radCondition.value==1)
        {
            grdStock.GetGridControl().ColHidden(G_item_code) = true
            grdStock.GetGridControl().ColHidden(G_item_name) = true
            
            grdStock.GetGridControl().ColHidden(G_st_code) = false
            grdStock.GetGridControl().ColHidden(G_st_name) = false
            grdStock.GetGridControl().ColHidden(G_lot_no) = true
        }else
        {
            if(radCondition.value==2)
            {
                grdStock.GetGridControl().ColHidden(G_item_code) = false
                grdStock.GetGridControl().ColHidden(G_item_name) = false
                
                grdStock.GetGridControl().ColHidden(G_st_code) = true
                grdStock.GetGridControl().ColHidden(G_st_name) = true
                grdStock.GetGridControl().ColHidden(G_lot_no) = true
            }else
            {
                grdStock.GetGridControl().ColHidden(G_item_code) = false
                grdStock.GetGridControl().ColHidden(G_item_name) = false
                grdStock.GetGridControl().ColHidden(G_st_code) = true
                grdStock.GetGridControl().ColHidden(G_st_name) = true
                grdStock.GetGridControl().ColHidden(G_lot_no) = false
            }
        }
        //OnSearch(1)
}
//======================================================================

function ReceiveData(obj)
{
    if( obj.id == "data_fpab00170" )
    {
        if ( grdStock.rows > 1 )
        {
            grdStock.SetCellBgColor( 1, G_book_qty, grdStock.rows - 1, G_issue_qty, 0xCCFFFF );
        }
        lblRecord.text = grdStock.rows - 1 + " record(s)";            
    }
}
//======================================================================

function OnPopUp(pos)
{
    switch (pos)
    {
        case 'Book-Detail':
            var fpath  = System.RootURL + "/form/fp/ab/fpab00171.aspx";
            var aValue = window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:900px;dialogHeight:600px');	
        break;
    }
}

//======================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00170" onreceive="ReceiveData(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_fpab00170" >  
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
    <table style="height: 100%; width: 100%" border="1">
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
                            <gw:textbox id="txtItem" styles="width:100%" />
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="center">
                            <gw:radio id="radCondition" value="2" styles="width:100%" onchange="OnChangeCondition()"> 
                                    <span value="1">ST Item</span> 
                                    <span value="2">Item</span> 
                                    <span value="3">Lot No</span>
                             </gw:radio>
                        </td>
                        <td style="width: 9%; white-space: nowrap" align="center">
                            <gw:label id="lblRecord" styles="color: blue">record(s)</gw:label>
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch(1)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id='grdStock' header='W/H ID|ST Code|ST Name|Item Code|Item Name|UOM|Lot No|End Bal|Book Qty|Issue Qty|Reverved Qty|Comm Qty|_wh_pk'
                    format='0|0|0|0|0|0|0|1|1|1|1|1|0' aligns='0|0|0|0|0|1|0|0|0|0|0|0|0' defaults='||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1500|1500|2500|1500|3000|1000|1500|1500|1500|1500|1500|1500|0'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick="OnPopUp('Book-Detail')" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------>
</body>
</html>
