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

var G_STOCK_DATE = 0,     
    G_LOT_NO     = 1,
    G_BEGIN_QTY  = 2,       
    G_IN_QTY     = 3,
    G_OUT_QTY    = 4,  
    G_END_QTY    = 5;
    
//===========================================================================
function BodyInit()
{
    System.Translate(document); 
    var callerWindowObj = dialogArguments;
    
	txtFromDate.text = callerWindowObj.dtFrom.value;
	txtToDate.text   = callerWindowObj.dtTo.value;
	
	txtWarehousePK.text = callerWindowObj.vWH_PK;
	txtItemPK.text      = callerWindowObj.vITEM_PK;

    //----------------
    SetGridFormat();
    //-----------------  
    data_bisc00072.Call('SELECT');
}
//===========================================================================
function SetGridFormat()
{ 
    var ctrl = grdStockTrans.GetGridControl();   
    
    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;
    ctrl.MergeCol(2) = true;
    ctrl.MergeCol(3) = true;
    ctrl.MergeCol(4) = true;
    ctrl.MergeCol(5) = true;
    ctrl.MergeCol(6) = true;
	
    ctrl.ColFormat(G_BEGIN_QTY) = "###,###,###.##" ;
	ctrl.ColFormat(G_IN_QTY)    = "###,###,###.##" ;
	ctrl.ColFormat(G_OUT_QTY)   = "###,###,###.##" ;
	ctrl.ColFormat(G_END_QTY)   = "###,###,###.##" ;    
}
//===========================================================================
 
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_bisc00072':            
     
        break;                
    }
}
//===========================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_bisc00072" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bisc00072" > 
                <input> 
					<input bind="txtWarehousePK" />
                    <input bind="txtItemPK" />				
                    <input bind="txtFromDate" />
                    <input bind="txtToDate" />
                </input> 
                <output bind="grdStockTrans" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 100%">
            <td>
                <gw:grid id='grdStockTrans' 
					header='Stock Date|Lot No|Begin Qty|In Qty|Out Qty|End Qty'
                    format='4|0|0|0|0|0' 
					aligns='1|1|3|3|3|3' 
					defaults='|||||'
                    editcol='0|0|0|0|0|0' 
					widths='1200|1500|1500|1500|1500|1500'
                    styles="width:100%; height:100%" />
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------->
<gw:textbox id="txtFromDate" styles="width:100%;display:none"  />
<gw:textbox id="txtToDate" styles="width:100%;display:none"  />
<gw:textbox id="txtWarehousePK" styles="width:100%;display:none"  />
<gw:textbox id="txtItemPK" styles="width:100%;display:none"  />

</html>
