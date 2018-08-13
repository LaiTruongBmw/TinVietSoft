<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>Stock Location Moving</title>
</head>

<script>

var G1_LOC_ID	  	= 0,
	G1_STORE_QTY  	= 1,
	G1_TOTAL_QTY  	= 2,
    G1_REMAIN_QTY 	= 3,
	G1_ITEM_CODE	= 4,
    G1_ITEM_NAME  	= 5,
	G1_UOM 		  	= 6,
	G1_LOT_NO	  	= 7,
    G1_INV_QTY     	= 8,
	G1_WHLOC_PK		= 9,
	G1_ITEM_PK		= 10;
	
var G2_TRANS_PK		= 0,
	G2_TR_DATE		= 1,
	G2_ITEM_PK		= 2,
	G2_ITEM_CODE	= 3,
	G2_ITEM_NAME	= 4,
	G2_UOM			= 5,
	G2_LOT_NO		= 6,
    G2_INV_QTY		= 7,
    G2_FR_LOC_PK	= 8,
    G2_FR_LOC_ID	= 9,
    G2_TO_LOC_PK	= 10,
    G2_TO_LOC_ID	= 11,
	G2_REMARK       = 12;

var arr_Trans = new Array();
//=============================================================================
function BodyInit()
{
    System.Translate(document);
	//---------------------
    FormatGrid();
}
//=============================================================================
function FormatGrid()
{
    var data ;		
    //-----------------	
	data = "<%=ESysLib.SetListDataSQL("select pk, strg_id || ' * ' || strg_name from tlg_in_storage where del_if = 0 and use_yn = 'Y' order by strg_id " )%>||Select ALL";
    lstStorage.SetDataText(data);
    lstStorage.value = '';

    data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from TLG_IT_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||";
    lstItemGroup.SetDataText(data);
    lstItemGroup.value = '';    
	
	var ctrl = grdINOUT.GetGridControl();

    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;
    ctrl.MergeCol(2) = true;
    ctrl.MergeCol(3) = true;
    ctrl.MergeCol(4) = true;
    ctrl.MergeCol(5) = true;
    ctrl.MergeCol(6) = true;

    ctrl.ColFormat(G1_STORE_QTY) 	= "###,###,###.##" ;
    ctrl.ColFormat(G1_TOTAL_QTY)    = "###,###,###.##" ;
    ctrl.ColFormat(G1_REMAIN_QTY) 	= "###,###,###.##" ;
	ctrl.ColFormat(G1_INV_QTY)  	= "###,###,###.##" ;

	//------
	var ctrl = grdTrans.GetGridControl();
	
    ctrl.ColFormat(G2_INV_QTY)  = "###,###,###,###.##";	 
	
	arr_Trans[G2_INV_QTY]  		= 2;
 
	//------
}

//=============================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'BALANCE':
            //---------------------
            data_biws00030_1.Call('SELECT');
        break;
		
		case 'TRANS':
            //---------------------
            data_biws00030_2.Call('SELECT');
        break;
    }
}

//=============================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_biws00030_1':
            if ( grdINOUT.rows > 1 )
            {                                 
				grdINOUT.SetCellBold( 1, G1_LOC_ID, 	grdINOUT.rows - 1, G1_LOC_ID,   	true);
				grdINOUT.SetCellBold( 1, G1_ITEM_CODE, 	grdINOUT.rows - 1, G1_ITEM_CODE,    true);
				
				grdINOUT.SetCellBgColor( 1, G1_REMAIN_QTY, grdINOUT.rows - 1, G1_REMAIN_QTY, 0xCCFFFF );
                grdINOUT.SetCellBgColor( 1, G1_INV_QTY,	   grdINOUT.rows - 1, G1_INV_QTY,    0xFFFFCC );								 
            }
        break;
		
		case 'data_biws00030_2':
            if ( grdTrans.rows > 1 )
            {                                 
				grdTrans.SetCellBold( 1, G2_TO_LOC_ID, 	grdTrans.rows - 1, G2_TO_LOC_ID,   	true);
				grdTrans.SetCellBold( 1, G2_ITEM_CODE, 	grdTrans.rows - 1, G2_ITEM_CODE,    true);
				
				grdTrans.SetCellBgColor( 1, G2_INV_QTY,    grdTrans.rows - 1, G2_INV_QTY,   0xCCFFFF );
                grdTrans.SetCellBgColor( 1, G2_FR_LOC_ID,  grdTrans.rows - 1, G2_FR_LOC_ID, 0xFFFFCC );								 
            }
        break;
    }
}
//=============================================================================
var vLOC_PK , vITEM_PK, vLOTNO;

function OnPopUp(pos)
{
	switch (pos)
	{
		case 'DETAIL':
		
			if ( event.col >= G1_ITEM_CODE && event.col <= G1_ITEM_NAME && event.row > 0 )
			{
				var col = event.col ;
				var row = event.row ;
				 
				vLOC_PK  = grdINOUT.GetGridData( row, G1_WHLOC_PK );				
				vITEM_PK = grdINOUT.GetGridData( row, G1_ITEM_PK  );
				vLOTNO   = grdINOUT.GetGridData( row, G1_LOT_NO   );
				
			    var url = System.RootURL + '/form/bi/ws/biws00031.aspx';
				var aValue  = System.OpenModal(  url , 700, 450, 'resizable:yes;status:yes', this);
			}
			
		break;	
		
		case 'TRANS':
			if ( event.col == G2_TO_LOC_ID )
			{
				var event_col = event.col ;
                var event_row = event.row ;
                      
                var path = System.RootURL + '/form/fp/ab/fpab00160.aspx';
	            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	                 
	            if ( obj != null )
	            {
                    grdTrans.SetGridText( event_row, G2_TO_LOC_PK, obj[0] ); //loc_pk
                    grdTrans.SetGridText( event_row, G2_TO_LOC_ID, obj[7] ); //loc_id                    
                }	  			
			}
		break;
		
	}
}
 
//=============================================================================
function OnReport(pos)
{
	
	switch (pos)
	{				
		case 'ST01':
			var url = System.RootURL + "/reports/bi/sc/rpt_biws00030_ST01.aspx?p_from_date="+dtStockDate.value+ "&p_to_date=" + dtDTTo.value ;
				url = url + "&p_wh_type=" + lstWHType01.value + "&p_tin_warehouse_pk=" + lstWH01.value + "&p_wh_name=" + lstWH01.GetText() ;
				url = url + "&p_item_grp=" + lstItemGroup01.value + "&p_item=" + txtItem01.text + "&p_lang=" + lstLang1.value ;
     	 
			System.OpenTargetPage(url);
		break;				
	}		 
}
 
//=============================================================================

function OnAddNew(pos)
{
	switch (pos)
	{
		case 'TRANS':
		
			if ( grdINOUT.row > 0 )
			{		
				grdTrans.AddRow();
			
				grdTrans.SetGridText( grdTrans.rows-1, G2_FR_LOC_PK, grdINOUT.GetGridData( grdINOUT.row, G1_WHLOC_PK ) );
				grdTrans.SetGridText( grdTrans.rows-1, G2_FR_LOC_ID, grdINOUT.GetGridData( grdINOUT.row, G1_LOC_ID   ) );
				
				grdTrans.SetGridText( grdTrans.rows-1, G2_ITEM_PK, 	 grdINOUT.GetGridData( grdINOUT.row, G1_ITEM_PK   ) );
				grdTrans.SetGridText( grdTrans.rows-1, G2_ITEM_CODE, grdINOUT.GetGridData( grdINOUT.row, G1_ITEM_CODE ) );
				grdTrans.SetGridText( grdTrans.rows-1, G2_ITEM_NAME, grdINOUT.GetGridData( grdINOUT.row, G1_ITEM_NAME ) );
				grdTrans.SetGridText( grdTrans.rows-1, G2_UOM, 		 grdINOUT.GetGridData( grdINOUT.row, G1_UOM 	  ) );
				
				grdTrans.SetGridText( grdTrans.rows-1, G2_LOT_NO,  grdINOUT.GetGridData( grdINOUT.row, G1_LOT_NO ) );
				
				grdTrans.SetGridText( grdTrans.rows-1, G2_INV_QTY, grdINOUT.GetGridData( grdINOUT.row, G1_INV_QTY ) );
				
				grdTrans.SetGridText( grdTrans.rows-1, G2_TR_DATE, dtStockDate.value );
			}
			else
			{
				alert("PLS SELECT ONE ITEM TO MOVE.");
			}
		break;	
	}
}

//====================================================================================

function OnCheckVal()
{
	for ( var i=0; i<grdTrans.rows; i++)	  
    {
		if ( grdTrans.GetGridData( i, G2_TO_LOC_ID) == "" )
		{
			alert("PLS SELECT TO LOCATION AT ROW " + (i) );
			
			return false;
		}
	}	
	
	return true;
}
//====================================================================================

function OnSave(pos)
{   
    switch (pos)
    {
        case 'TRANS' :
			if ( OnCheckVal() )
			{
				data_biws00030_2.Call();
			}	
        break; 
    }
}
//====================================================================================

function OnDelete(ogrid)
{
    if ( ogrid.row > 0 )
    {
        if ( ogrid.GetGridData( ogrid.row, 0) == '' )  
        {
	        ogrid.RemoveRowAt( ogrid.row ); 			
	    }
	    else			
	    {
	        ogrid.DeleteRow();
	    }
	}   
}

//====================================================================================

function OnUnDelete(ogrid)
{    
    ogrid.UnDeleteRow()
}

//========================================================================
 
 function CheckInput(obj)
 {   
    switch(obj.id)
    {         
        case 'grdTrans':
            var  row, col 
                
            row = event.row ;
            col = event.col ;    
            
            if ( col == G2_INV_QTY )
            {
                var dQuantiy;                
                dQuantiy =  grdTrans.GetGridData(row,col);
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        grdTrans.SetGridText(row,col, System.Round( dQuantiy, arr_Trans[col] ) );												 	
                    }
                    else
                    {                         
                        grdTrans.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdTrans.SetGridText(row,col,"")
                }         
            }                       
			//------------------------------------------			
        break;
    }
 }
//=============================================================================

function OnProcess(pos)
{
	switch(pos)
	{
		case 'MOVE':
			if ( grdTrans.row > 0 && grdINOUT.row > 0 )
			{
				grdTrans.SetGridText( grdTrans.row, G2_TO_LOC_PK, grdINOUT.GetGridData( grdINOUT.row, G1_WHLOC_PK));
				grdTrans.SetGridText( grdTrans.row, G2_TO_LOC_ID, grdINOUT.GetGridData( grdINOUT.row, G1_LOC_ID  ));
			}
			else
			{
				alert("PLS SELECT FROM LOCATION & TO LOCATION.");
			}
		break;
	}
}
//=============================================================================

</script>

<body>    
    <!--------------------------------------------------------------------->
    <gw:data id="data_biws00030_1" onreceive="OnDataReceive(this)">
        <xml>
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_sel_biws00030_1"  >
                <input bind="grdINOUT" >
					<input bind="lstStorage" />
			        <input bind="txtLocation" />				
					<input bind="dtStockDate" />			 
					<input bind="lstItemGroup" />
			        <input bind="txtItem" />
					<input bind="chkBal" />		 
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>
	<!--------------------------------------------------------------------->
    <gw:data id="data_biws00030_2" onreceive="OnDataReceive(this)">
        <xml>
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="<%=l_user%>lg_sel_biws00030_2"  procedure="<%=l_user%>lg_upd_biws00030_2" >
                <input bind="grdTrans" >
					<input bind="txtFrLoc" />
			        <input bind="txtToLoc" />				
					<input bind="dtFromDate" />	
					<input bind="dtToDate" />						
					<input bind="lstItemGroup" />
			        <input bind="txtItem" /> 
                </input>
                <output bind="grdTrans" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Stock Status">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                Loc
            </td>
            <td style="width: 15%" align="right">
                <gw:list id="lstStorage" styles="width:100%" onchange="OnSearch('BALANCE')" />
            </td>
            <td style="width: 10%" align="right">
                <gw:textbox id="txtLocation" maxlen="100" styles='width:100%' onenterkey="OnSearch('BALANCE')" />
            </td>
			<td style="width: 5%; white-space: nowrap" align="right">
                Item
            </td>
            <td style="width: 20%" align="right">
                <gw:list id="lstItemGroup" styles="width: 100%" onchange="OnSearch('BALANCE')" />
            </td>
            <td style="width: 10%">
                <gw:textbox id="txtItem" maxlen="100" styles='width:100%' onenterkey="OnSearch('BALANCE')" />
            </td>			
            <td style="width: 5%; white-space: nowrap" align="right">
                Date
            </td>
            <td style="width: 15%; white-space: nowrap">
                <gw:datebox id="dtStockDate" lang="1"   />                
            </td>
			 
			<td style="width: 3%; white-space: nowrap" colspan="2" align="center">                
                <gw:checkbox id="chkBal" styles="color:red" defaultvalue="Y|N" value="N" onchange="OnSearch('BALANCE')">End Qty>0</gw:checkbox>			 
            </td>
            
            <td style="width: 1%; white-space: nowrap" align="right" >
                <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('BALANCE')" /> 
            </td>
        </tr>        
        <tr style="height: 48%">
            <td colspan="13">
                <gw:grid id='grdINOUT' 
					header='Loc ID|Store Qty|Total Qty|Remain Qty|Item Code|Item Name|UOM|Lot No|Inv Qty|_WH_LOC_PK|_ITEM_PK'
                    format='0|0|0|0|0|0|0|0|0|0|0' 
					aligns='1|3|3|3|0|0|1|1|3|0|0'
                    editcol='0|0|0|0|0|0|0|0|0|0|0' 
					widths='1500|1500|1500|1500|1500|2500|800|1200|1200|0|0'
                    sorting='T' styles='width:100%; height:100%' 
					oncelldblclick="OnPopUp('DETAIL')" />
            </td>
        </tr>
		
		<tr style="height: 1%">
						<td style="width: 100%; white-space: nowrap" align="right" colspan=13  >
							<table style="width: 100%; height: 100%" >								 
								<tr style="height: 1%" >	
									<td style="width: 5%; white-space: nowrap">	
										From Loc
									</td>
									<td style="width: 15%">
										<gw:textbox id="txtFrLoc" maxlen="100" styles='width:100%' onenterkey="OnSearch('TRANS')" />
									</td>
									<td style="width: 5%; white-space: nowrap">	
										To Loc
									</td>
									<td style="width: 15%">
										<gw:textbox id="txtToLoc" maxlen="100" styles='width:100%' onenterkey="OnSearch('TRANS')" />
									</td>	
									<td style="width: 5%; white-space: nowrap" align="right">
										Date
									</td>
									<td style="width: 20%; white-space: nowrap">
										<gw:datebox id="dtFromDate" lang="1"   />                
										~
										<gw:datebox id="dtToDate" lang="1"   />      
									</td>
									<td style="width: 19%; white-space: nowrap">
										 
									</td>	
									<td style="width: 1%; white-space: nowrap">
										<gw:icon id="idBtnMove" img="2" text="Move" styles='width:100%' onclick="OnProcess('MOVE')" />
									</td>									
									<td style="width: 1%">
										<gw:imgbtn id="btnSearch1" img="search" alt="Search" onclick="OnSearch('TRANS')" />
									</td>
									<td style="width: 1%">
										<gw:imgbtn id="btnAddNew" img="new" alt="Add new" onclick="OnAddNew('TRANS')" />
									</td>
									<td style="width: 1%">
										<gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete(grdTrans)" />
									</td>
									<td style="width: 1%">
										<gw:imgbtn id="btnUndelete" img="udelete" alt="Undelete" onclick="OnUnDelete(grdTrans)" />
									</td>
									<td style="width: 1%">
										<gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave('TRANS')" />
									</td>
								</tr>											
							</table>		
                        </td>                 
        </tr>
        <tr style="height: 49%">
            <td colspan="13">
                <gw:grid id='grdTrans' 
					header='_PK|Date|_ITEM_PK|Item Code|Item Name|UOM|Lot No|Inv Qty|_FR_LOC_PK|Fr Loc|_TO_LOC_PK|To Loc'
                    format='0|4|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|1|0|0|0|1|1|3|0|1|0|1'					 
                    editcol='0|1|0|0|0|0|0|1|0|1|0|1' 
					widths='0|1200|0|1500|3000|800|1500|1500|0|1500|0|1500'
                    sorting='T' styles='width:100%; height:100%' 
					oncelldblclick="OnPopUp('TRANS')" 
					onafteredit="CheckInput(this)" />
            </td>
        </tr>
		
    </table>
    <!----------------------------------------------------------->
</body>
</html>
