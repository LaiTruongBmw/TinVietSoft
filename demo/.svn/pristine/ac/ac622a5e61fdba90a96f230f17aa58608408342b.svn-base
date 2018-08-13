<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>W/H Stock Checking 3</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_STOCK_QTY     = 8;
var callerWindowObj = dialogArguments;  
//===========================================================================
function BodyInit()
{
    System.Translate(document); 
    //----------------
    BindingDataList();
    SetGridFormat();
    
    lstWH.value = "<%=Request.querystring("wh_pk")%>" ;
     txtItem.text =   callerWindowObj.txtItem.text;    
    lstWH.SetEnable(false)   
    //-----------------  
    OnSearch('1')
}

//===========================================================================
function BindingDataList()
{
    var data = ""; 
    //-----------------
    data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from TLG_IN_WAREHOUSE where del_if = 0 and use_yn='Y' order by wh_id ")%>||"; 
    lstWH.SetDataText(data); 
    //-----------------   
}

//===========================================================================
function SetGridFormat()
{ 
    var ctr2 = grdStock.GetGridControl();      
    ctr2.ColFormat(G_STOCK_QTY)       = "#,###,###,###,###,###.##";
    
    ctr2.MergeCells  = 2 ;	
    ctr2.MergeCol(0) = true ; 
    ctr2.MergeCol(1) = true ;
    ctr2.MergeCol(2) = true ;
          
}

//===========================================================================

function OnSearch(obj)
{
    switch(obj)
    {       
        case '1':
            data_bisc00121.Call('SELECT');
        break;       
    }
}

//==================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_bisc00121':            
            if ( grdStock.rows > 1 )
            {                
                grdStock.SetCellBold( 1, G_STOCK_QTY,   grdStock.rows - 1, G_STOCK_QTY,   true );                
                grdStock.Subtotal( 0, 2, -1, '8');
            }    
        break;                
    }
}

//==================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_bisc00121" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bisc00121" > 
                <input> 
                    <input bind="lstWH" />
                    <input bind="txtItem" />
                    <input bind="chkStock" />                  
                </input> 
                <output bind="grdStock" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">                       
            <td style="width: 5%" align="right">
                W/H
            </td>
            <td style="width: 25%">
                <gw:list id="lstWH" styles="width:100%" onchange="OnSearch('StockTrans')" />
            </td>
            <td style="width: 5%" align="right">
                Item
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtItem" styles="width:100%;" onenterkey="OnSearch('StockTrans')" />
            </td>
            <td style="width: 13%" align="center">
                <gw:checkbox id="chkStock" styles="color:red" defaultvalue="Y|N" value="Y">Stock Qty > 0</gw:checkbox>
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('StockTrans')" />
            </td>
           
        </tr>
        <tr style="height: 99%">
            <td colspan="10">
                <gw:grid id='grdStock' header='_wh_pk|_W/H ID|W/H|_item_pk|Item Code|Item Name|UOM|Lot No|Stock Qty'
                    format='0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|3'
                    check='||||||||' editcol='0|0|0|0|0|0|0|0|0' widths='0|2000|2000|0|1500|2000|1200|1500|1500'
                    sorting='T' styles='width:100%; height:100%'
					/>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------->
<gw:textbox id="txt_trans_type" styles="width:100%;display:none"  />
<gw:list id="lstTrans_Type" styles="width:100%;display:none" />
</html>
