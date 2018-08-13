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

var G_LOC_ID	= 0,
	G_TR_DATE   = 1,
	G_TR_NAME	= 2,
    G_SLIP_NO   = 3,       
    G_LOT_NO    = 4,
    G_BEGIN_QTY = 5,  
    G_IN_QTY   	= 6,
	G_OUT_QTY	= 7,	
    G_END_QTY   = 8;
    
//===========================================================================
function BodyInit()
{
    System.Translate(document); 

    SetGridFormat();
    //-----------------  
	
    var callerWindowObj = dialogArguments;
    
	txtStockDate.text 	= callerWindowObj.dtStockDate.value;	
	txtItemPK.text      = callerWindowObj.vITEM_PK;
	txtLocation.text    = callerWindowObj.vLOC_ID;
	txtLotNo.text       = callerWindowObj.vLOTNO;

    //----------------

    OnSearch('BALANCE'); 
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
	
	//-----------------	
	var data = "<%=ESysLib.SetListDataSQL("select pk, strg_id || ' * ' || strg_name from tlg_in_storage where del_if = 0 and use_yn = 'Y' order by strg_id " )%>||Select ALL";
    lstStorage.SetDataText(data);
    lstStorage.value = '';
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
 
function OnSearch(pos)
{
    switch(pos)
    {
        case 'BALANCE':            
			data_biws00011.Call('SELECT');
        break;                
    }
}

//===========================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_biws00011" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_biws00011" > 
                <input> 					
                    <input bind="txtStockDate" />
                    <input bind="lstStorage" />
			        <input bind="txtLocation" />
                    <input bind="txtItemPK" />
                    <input bind="txtLotNo" />
                </input> 
                <output bind="grdStockTrans" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
		<tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                Loc
            </td>
            <td style="width: 25%" align="right">
                <gw:list id="lstStorage" styles="width:100%" onchange="OnSearch('BALANCE')" />
            </td>
            <td style="width: 35%" align="right">
                <gw:textbox id="txtLocation" maxlen="100" styles='width:100%' onenterkey="OnSearch('BALANCE')" />
            </td>
			<td style="width: 34%" >
			</td>
			<td style="width: 1%; white-space: nowrap" align="right" >
                <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('BALANCE')" /> 
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan=10 >
                <gw:grid id='grdStockTrans' 
					header='Loc|Date|Tr Name|Slip No|Lot No|Begin|In|Out|End'
                    format='0|4|0|0|0|0|0|0|0' 
					aligns='0|1|0|0|1|3|3|3|3' 
					defaults='||||||||' 
					editcol='0|0|0|0|0|0|0|0|0'
                    widths='1200|1200|1800|1500|1500|1500|1500|1500|1500' 
					acceptnulldate="T"
					sorting='T' styles="width:100%; height:100%" />
            </td>
        </tr>
    </table>
	<!---------------------------------------------------------------->
</body>
<!------------------------------------------------------->
<gw:textbox id="txtStockDate" styles="width:100%;display:none" />
<gw:textbox id="txtItemPK" styles="width:100%;display:none" />
<gw:textbox id="txtLotNo" styles="width:100%;display:none" />
<!------------------------------------------------------->
</html>
