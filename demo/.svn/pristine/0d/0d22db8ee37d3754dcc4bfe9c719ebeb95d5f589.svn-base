<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>W/H Stock Checking 3</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>


<script>

var G_TR_DATE   = 0,
	G_TR_NAME	= 1,
    G_SLIP_NO   = 2,       
    G_LOT_NO    = 3,
    G_BEGIN_QTY = 4,  
    G_IN_QTY   	= 5,
	G_OUT_QTY	= 6,	
    G_END_QTY   = 7;
    
//===========================================================================
function BodyInit()
{
    System.Translate(document); 
	
    var callerWindowObj = dialogArguments;
    
	txtStockDate.text 	= callerWindowObj.dtStockDate.value;	
	txtItemPK.text      = callerWindowObj.vITEM_PK;
	txtWHLocPK.text     = callerWindowObj.vLOC_PK;
	txtLotNo.text       = callerWindowObj.vLOTNO;

    //----------------
    SetGridFormat();
    //-----------------  
    data_biws00011.Call('SELECT');
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
	
    ctrl.ColFormat(G_BEGIN_QTY) = "###,###,###.##" ; 
	ctrl.ColFormat(G_IN_QTY) 	= "###,###,###.##" ; 
	ctrl.ColFormat(G_OUT_QTY) 	= "###,###,###.##" ; 	
	ctrl.ColFormat(G_END_QTY) 	= "###,###,###.##" ; 
}
//===========================================================================
 
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_biws00011':            
			//grdStockTrans.Subtotal( 0, 2, 0, '5','###,###,###.###');
        break;                
    }
}
//===========================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_biws00011" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_biws00031" > 
                <input> 					
                    <input bind="txtStockDate" />
                    <input bind="txtWHLocPK" />
                    <input bind="txtItemPK" />
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
                <gw:grid id='grdStockTrans' 
					header='Date|Tr Name|Slip No|Lot No|Begin|In|Out|End'
                    format='4|0|0|0|0|0|0|0' 
					aligns='1|0|0|1|3|3|3|3' 
					defaults='|||||||' 
					editcol='0|0|0|0|0|0|0|0'
                    widths='1200|1800|1500|1500|1500|1500|1500|1500' 
					sorting='T' styles="width:100%; height:100%" />
            </td>
        </tr>
    </table>
	<!---------------------------------------------------------------->
</body>
<!------------------------------------------------------->
<gw:textbox id="txtStockDate" styles="width:100%;display:none" />
<gw:textbox id="txtWHLocPK" styles="width:100%;display:none" />
<gw:textbox id="txtItemPK" styles="width:100%;display:none" />
<gw:textbox id="txtLotNo" styles="width:100%;display:none" />
<!------------------------------------------------------->
</html>
