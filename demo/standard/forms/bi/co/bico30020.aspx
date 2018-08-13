<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>W/H Stock Checking 5</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_TR_TYPE  	 = 0, 
	G_TR_WH      = 1,        
    G_TR_DATE    = 2,
    G_SLIP_NO    = 3,   
	G_ITEM_CODE	 = 4,
	G_ITEM_NAME  = 5,
	G_UOM        = 6,   
    G_LOT_NO     = 7,
	G_REF_QTY	 = 8,
	G_UOM_IN_STOCKTR=9,
	G_TRANS_RATE = 10,
    G_TR_QTY     = 11,  
	G_TR_AMOUNT  = 12,
	G_TR_CCY	 = 13,	
    G_COST_YN    = 14,
	G_REF_WH	 = 15,
	G_LINE		 = 16;
    
//===========================================================================
function BodyInit()
{
    System.Translate(document); 
    //---------------------------
	var now = new Date(); 
    var lmonth, ldate;
    
    ldate=txtFromDate.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    txtFromDate.value=ldate ;
    //----------------
    SetGridFormat();
    //-----------------   
	OnToggleGrid();
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
	
    ctrl.ColFormat(G_TR_QTY)    = "###,###,###.##" ; 
	ctrl.ColFormat(G_TR_AMOUNT) = "###,###,###.##" ; 
	
    var data = "<%=ESysLib.SetListDataSQL("SELECT  a.trans_code, a.trans_code||' * '||a.trans_name  FROM tlg_in_trans_code a WHERE a.del_if = 0 and ( trans_type='I' or trans_type='O' ) order by a.trans_code ")%>||"; //move type
    lstTrType.SetDataText(data);
    lstTrType.value='';
	
    data = "<%=ESysLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from TLG_in_warehouse where del_if = 0 and use_yn='Y' order by wh_id")%>";
	lstWareHouse.SetDataText( data + "||");
    lstWareHouse.value = '';
	
	data = "data|I|I * IN|O|O * OUT||";
    lstInOutType.SetDataText(data); 
    lstInOutType.value = '' ;
	
	data = "<%=ESysLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||Select ALL";
    lstWHType.SetDataText(data);
    lstWHType.value = '';	
			   
}
//======================================================================
function OnToggleGrid()
{
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";
	

		grdStockTrans.GetGridControl().ColHidden(G_REF_QTY)  = true ;
		grdStockTrans.GetGridControl().ColHidden(G_UOM_IN_STOCKTR)  = true ;
		grdStockTrans.GetGridControl().ColHidden(G_TRANS_RATE)  = true ;


		
        imgMaster.src = "../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";
		
    }
    else
    {
        imgMaster.status = "expand";
        
		grdStockTrans.GetGridControl().ColHidden(G_REF_QTY)  = false ;
		grdStockTrans.GetGridControl().ColHidden(G_UOM_IN_STOCKTR)  = false ;
		grdStockTrans.GetGridControl().ColHidden(G_TRANS_RATE)  = false ;
		
        imgMaster.src = "../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}

//===========================================================================
 
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_bisc00130':            
			grdStockTrans.Subtotal( 1, 2,-1, '8!9'); 
        break;                
    }
}
//===========================================================================

function OnSearch(pos)
{
	switch(pos)
	{
		case 'BALANCE':
			data_bisc00130.Call("SELECT");
		break;
	}	
}
//===========================================================================

function OnReport(pos)
{
	switch (pos)
	{		 
		case 'ST01' :
			var url = System.RootURL + "/reports/bi/sc/rpt_bisc00130_ST01.aspx" ;
				url = url + "?p_tr_inout_type=" + lstInOutType.value + "&p_tr_type=" + lstTrType.value + "&p_wh_type=" + lstWHType.value + "&p_wh_pk=" + lstWareHouse.value + "&p_from_date=" + txtFromDate.value + "&p_to_date=" + txtToDate.value + "&p_item_lot_no=" + txtItemLotNo.text ;
			 
			System.OpenTargetPage(url);			
		break;
	}
}
//===========================================================================
function OnPopUp(pos)
{
	switch(pos)
	{
		case 'Report':			 
				 
			var path = System.RootURL + '/form/bi/sc/bisc00131.aspx';
			var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
				 
		break; 	

	}
}
//===========================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_bisc00130" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_bisc00130" > 
                <input> 
					<input bind="lstInOutType" />
					<input bind="lstTrType" />
					<input bind="lstWHType" />
					<input bind="lstWareHouse" />                    				
                    <input bind="txtFromDate" />
                    <input bind="txtToDate" />                    
                    <input bind="txtItemLotNo" />
                </input> 
                <output bind="grdStockTrans" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
		<tr style="height: 1%">
			<td style="width: 5%" align="right">
				Type
			</td>
			<td style="width: 10%">
				<gw:list id="lstInOutType" styles="width: 100%" onchange="OnSearch('BALANCE')"  />
			</td>
			<td style="width: 15%">
				<gw:list id="lstTrType" styles="width: 100%" onchange="OnSearch('BALANCE')"  />
			</td>
			<td style="width: 5%" align="right">
				W/H
			</td>
			
			<td style="width: 10%">
				<gw:list id="lstWHType" styles="width: 100%" onchange="OnSearch('BALANCE')"  />
			</td>			
			<td style="width: 20%">
				<gw:list id="lstWareHouse" styles="width: 100%" onchange="OnSearch('BALANCE')"  />
			</td>
			<td style="width: 5%; white-space: nowrap" align="right">
                Date
            </td>
            <td style="width: 10%; white-space: nowrap">
                <gw:datebox id="txtFromDate" lang="1" />
                ~
                <gw:datebox id="txtToDate" lang="1"   />
            </td>		
			<td style="width: 5%" align="right" >
				Item
			</td>
			<td style="width: 10%">
				<gw:textbox id="txtItemLotNo" styles="width: 100%" onchange="OnSearch('BALANCE')"  />
			</td>
			<td style="width: 4%" align="right" >
				<gw:imgbtn id="ibtnReport1" img="excel" alt="reports" text="reports" onclick="OnPopUp('Report')" />
			</td>
			<td style="width: 1%" align="right" >		
				<gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('BALANCE')" />		 
			</td>
		</tr>
		<tr>

            <td colspan="15">
				<img status="expand" id="imgMaster" alt="Show all column" src="../../../system/images/close_popup.gif"
                    style="cursor: hand" onclick="OnToggleGrid()" />
                Item:
            </td>
		</tr>
        <tr style="height: 99%">
            <td colspan=15 >
                <gw:grid id='grdStockTrans' 
					header='Tr Type|Tr W/H|Date|Slip No|Item Code|Item Name|UOM|Lot No|Ref Qty|UOM STOCK|Trans Rate|Tr Qty|Tr Amount|CCY|Cost YN|Ref W/H|Line'
                    format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|1|0|0|0|1|1|3|1|3|3|3|1|1|0|0' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='2000|2000|1200|1500|1500|2500|800|1200|1200|1500|1500|1500|1500|800|1000|2000|2000' sorting='T' styles="width:100%; height:100%" />
            </td>
        </tr>
    </table>
</body>
<!-------------------------------------------------------> 
</html>
