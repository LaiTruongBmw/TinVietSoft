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

var G_WH           = 0,  
    G_TRANS_TYPE   = 1,   
    G_TR_DATE      = 2,
    G_SLIP_NO      = 3,       
    G_LOT_NO       = 4,
    G_QTY          = 5,  
    G_TABLE_NAME   = 6,
    G_TABLE_PK     = 7;
    
//===========================================================================
function BodyInit()
{
    System.Translate(document); 
    var callerWindowObj = dialogArguments;
    
	txtFromDate.text 	= callerWindowObj.dtDTFrom.value;
	txtToDate.text   	= callerWindowObj.dtDTTo.value;
	txtWHType.text      = callerWindowObj.lstWHType01.value;
	txtWarehousePK.text = callerWindowObj.lstWH01.value;
	
	txtItemPK.text      = callerWindowObj.vITEM_PK;
	txtType.text        = callerWindowObj.vTYPE;
	txtLotNo.text       = callerWindowObj.vLOTNO;

    //----------------
    SetGridFormat();
    //-----------------  
    data_bisc00021.Call('SELECT');
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
	
    ctrl.ColFormat(G_QTY) = "###,###,###.###" ;    
}
//===========================================================================
 
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_bisc00021':            
			grdStockTrans.Subtotal( 0, 2, 0, '5','###,###,###.###');
        break;                
    }
}
//===========================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_bisc00021" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bisc00021" > 
                <input> 
					<input bind="txtWHType" />
					<input bind="txtWarehousePK" />
                    <input bind="txtItemPK" />				
                    <input bind="txtFromDate" />
                    <input bind="txtToDate" />
                    <input bind="txtType" />
                    <input bind="txtLotNo" />
                </input> 
                <output bind="grdStockTrans" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr style="height: 100%">
            <td>
                <gw:grid id='grdStockTrans' header='WareHouse|Trans Type|Date|Slip No|Lot No|Qty|_TABLE_NAME|_TABLE_PK'
                    format='0|0|4|0|0|1|0|0' aligns='0|0|1|0|1|3|0|0' defaults='|||||||' editcol='0|0|0|0|0|0|0|0'
                    widths='2000|2000|1200|1500|1500|1500|1000|1000' sorting='T' styles="width:100%; height:100%" />
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------->
<gw:textbox id="txtFromDate" styles="width:100%;display:none" />
<gw:textbox id="txtToDate" styles="width:100%;display:none" />
<gw:textbox id="txtWHType" styles="width:100%;display:none" />
<gw:textbox id="txtWarehousePK" styles="width:100%;display:none" />
<gw:textbox id="txtItemPK" styles="width:100%;display:none" />
<gw:textbox id="txtType" styles="width:100%;display:none" />
<gw:textbox id="txtLotNo" styles="width:100%;display:none" />

</html>
