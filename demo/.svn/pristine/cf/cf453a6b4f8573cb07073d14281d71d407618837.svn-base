<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>P/O Stock Booking Status</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_WH_PK             = 0,
    G_WH_ID             = 1,
    G_TCO_ITEM_PK       = 2,
    G_Item_Code         = 3,
    G_Item_name         = 4,
    G_UOM               = 5,
    G_TPR_LOTNO_PK      = 6,
    G_Lot_No            = 7,
    G_End_Bal           = 8,
    G_Book_Qty          = 9,
    G_Issue_Qty         = 10,
    G_Reverved_Qty      = 11,
    G_Comm_Qty          = 12;
      
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
    data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || '-' || grp_nm from comm.tco_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>|ALL|Select ALL"; 
    lstGroup.SetDataText(data);
    lstGroup.value = 'ALL';
    //---------------------------------
    data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || '-' || wh_name from inv.TIN_WAREHOUSE where del_if = 0 and use_yn='Y' order by wh_id ")%>|ALL|Select ALL"; 
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
    ctr.MergeCol(7) = true ;
    
    ctr.ColFormat(G_End_Bal)      = "#,###,###,###,###,###.##";
    ctr.ColFormat(G_Book_Qty)     = "#,###,###,###,###,###.##";    
    ctr.ColFormat(G_Issue_Qty)    = "#,###,###,###,###,###.##";
    ctr.ColFormat(G_Reverved_Qty) = "#,###,###,###,###,###.##";
    ctr.ColFormat(G_Comm_Qty)     = "#,###,###,###,###,###.##";
    
    ctr.FrozenCols = G_Item_Code;
            
}
//======================================================================

function OnSearch(id)
{
    data_fpab00300.Call('SELECT')
}
//======================================================================

function OnChangeCondition()
{
        if(radCondition.value==1)
        {
            grdStock.GetGridControl().ColHidden(G_Lot_No) = true
        }
        else if(radCondition.value==2)
        {
            grdStock.GetGridControl().ColHidden(G_Lot_No) = false
        }
}
//======================================================================

function ReceiveData(obj)
{
    if( obj.id == "data_fpab00300" )
    {
        if ( grdStock.rows > 1 )
        {
            grdStock.SetCellBgColor( 1, G_Book_Qty, grdStock.rows - 1, G_Issue_Qty, 0xCCFFFF );
        }
        lblRecord.text = grdStock.rows - 1 + " record(s)";            
    }
}

//======================================================================
function OnSelect()
{                            
    var arr_data = new Array();
    
    for(var i = 1; i < grdStock.rows; i++ )
    {
        if ( grdStock.GetGridControl().isSelected(i) == true )
        {
             var arrTemp = new Array();
                 
             for( var j = 0; j < grdStock.cols; j++ )
             {
                  arrTemp[arrTemp.length]= grdStock.GetGridData(i,j);
             }
                 
             arr_data[arr_data.length]= arrTemp;
        }
    }

    window.returnValue =  arr_data;
    window.close();       
}

//======================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00300" onreceive="ReceiveData(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_fpab00300" >  
                <input> 
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="lstGroup" />
                    <input bind="txtItem" />
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
                            ETA Date</td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~<gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 5%" align="right">
                            Group</td>
                        <td style="width: 30%">
                            <gw:list id="lstGroup" styles="width:100%;" onchange="OnSearch(1)" />
                        </td>
                        <td style="width: 5%" align="right">
                            Item</td>
                        <td style="width: 20%">
                            <gw:textbox id="txtItem" styles="width:100%" />
                        </td>
                        <td style="width: 18%; white-space: nowrap" align="center">
                            <gw:label id="lblRecord" styles="color: blue">record(s)</gw:label>
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch(1)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="select" alt="Select" id="btnSelect" onclick="OnSelect()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id='grdStock' 
                    header='_TCO_ITEM_PK|Item Code|Item Name|UOM|_TPR_PURORDD_PK|P/O No|P/O Qty|Book Qty|Issue Qty|Reserved Qty|Comm Qty'
                    format='0|0|0|0|0|0|0|0|0|0|0' 
                    aligns='0|0|0|1|0|1|3|3|3|3|3' 
                    defaults='||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0' 
                    widths='0|1500|3000|800|0|1500|1500|1500|1500|1500|1500'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------>
</body>
</html>
