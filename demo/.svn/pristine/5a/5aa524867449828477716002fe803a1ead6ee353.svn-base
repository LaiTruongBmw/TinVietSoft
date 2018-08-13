<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>W/H Stock Checking</title>
</head>

<script>

var G1_WH_ID	  	    = 0,
	G1_WH_NAME   	    = 1,	
    G1_ITEM_CODE 	    = 2,
    G1_ITEM_NAME        = 3,
    G1_UOM    		    = 4,
	G1_ACC_BEGIN_QTY	= 5,
	G1_ACC_IN_QTY  		= 6,
	G1_ACC_OUT_QTY     	= 7,
	G1_ACC_END_QTY  	= 8,
	G1_LOG_BEGIN_QTY	= 9,
	G1_LOG_IN_QTY  		= 10,
	G1_LOG_OUT_QTY     	= 11,
	G1_LOG_END_QTY  	= 12,
	G1_GAP_BEGIN_QTY	= 13,
	G1_GAP_IN_QTY  		= 14,
	G1_GAP_OUT_QTY     	= 15,
	G1_GAP_END_QTY  	= 16;
	
var binit=true;
	
//=============================================================================
function BodyInit()
{
    System.Translate(document);
    //--------------------
	var now = new Date(); 
    var lmonth, ldate;
    
    ldate = dtDTFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtDTFrom.value=ldate ;
	//---------------------
    FormatGrid();
}
//=============================================================================
function FormatGrid()
{
    var data ;	
	
    //-----------------	
	data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||Select ALL";
    lstWHType01.SetDataText(data);
    lstWHType01.value = '';

	data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from TLG_in_warehouse where del_if = 0 and use_yn='Y' order by wh_id")%>";
	lstWH01.SetDataText( data + "||");
    lstWH01.value = '';

    data = "<%=CtlLib.SetListDataSQL("select a.pk, lpad('-',level ,'-') || ' ' || a.grp_cd || ' - ' || a.grp_nm from tlg_it_itemgrp a where a.del_if = 0 and a.use_yn='Y' and a.group_type is not null connect by prior a.pk = A.P_PK start with A.P_PK is null order siblings by grp_cd " )%>||SELECT ALL";
    lstItemGroup01.SetDataText(data);
    lstItemGroup01.value = '';    
	
	var ctrl = grdINOUT.GetGridControl();

    ctrl.MergeCells = 2;
    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;
    ctrl.MergeCol(2) = true;
    ctrl.MergeCol(3) = true;
    ctrl.MergeCol(4) = true;
    ctrl.MergeCol(5) = true;
    ctrl.MergeCol(6) = true;

    grdINOUT.GetGridControl().FrozenCols =G1_UOM;
    grdINOUT.GetGridControl().ScrollTrack=true;
    
    SetGridHeader(grdINOUT);

}
//=============================================================================
function SetGridHeader(obj)
{
    var stt;
    
    var fg=obj.GetGridControl(); 	  
    if (binit==true)
    {
        fg.rows=fg.rows+1;
        binit=false;
    }
    fg.FixedRows = 2;
    fg.FixCols=1;
    fg.MergeCells =5	;
    for (var i=G1_WH_ID;i<=G1_GAP_END_QTY; i++)
    {
        if (i<=G1_UOM )
        {
            fg.MergeCol(i) =true	;
            fg.Cell(0, 0, i, 1, i)  = obj.GetGridData(0,i);
        }
    }
    fg.MergeRow(0) =true	;
    
    fg.Cell(0, 0, G1_ACC_BEGIN_QTY, 0, G1_ACC_END_QTY)  = "ACCOUNTING";   //fg.Cell(0,row, from_col, row, to_col)	
    fg.Cell(0, 1, G1_ACC_BEGIN_QTY, 1, G1_ACC_BEGIN_QTY) = "Begin Qty";
    fg.Cell(0, 1, G1_ACC_IN_QTY, 1, G1_ACC_IN_QTY) = "In Qty";
    fg.Cell(0, 1, G1_ACC_OUT_QTY, 1, G1_ACC_OUT_QTY) = "Out Qty";
    fg.Cell(0, 1, G1_ACC_END_QTY, 1, G1_ACC_END_QTY) = "End Qty";
    
    fg.Cell(0, 0, G1_LOG_BEGIN_QTY, 0, G1_LOG_END_QTY)  = "LOGISTIC";   //fg.Cell(0,row, from_col, row, to_col)	
    fg.Cell(0, 1, G1_LOG_BEGIN_QTY, 1, G1_LOG_BEGIN_QTY) = "Begin Qty";
    fg.Cell(0, 1, G1_LOG_IN_QTY, 1, G1_LOG_IN_QTY) = "In Qty";
    fg.Cell(0, 1, G1_LOG_OUT_QTY, 1, G1_LOG_OUT_QTY) = "Out Qty";
    fg.Cell(0, 1, G1_LOG_END_QTY, 1, G1_LOG_END_QTY) = "End Qty";
    
    fg.Cell(0, 0, G1_GAP_BEGIN_QTY, 0, G1_GAP_END_QTY)  = "GAP";   //fg.Cell(0,row, from_col, row, to_col)	
    fg.Cell(0, 1, G1_GAP_BEGIN_QTY, 1, G1_GAP_BEGIN_QTY) = "Begin Qty";
    fg.Cell(0, 1, G1_GAP_IN_QTY, 1, G1_GAP_IN_QTY) = "In Qty";
    fg.Cell(0, 1, G1_GAP_OUT_QTY, 1, G1_GAP_OUT_QTY) = "Out Qty";
    fg.Cell(0, 1, G1_GAP_END_QTY, 1, G1_GAP_END_QTY) = "End Qty";
    
    obj.SetCellBold(1,1,1,G1_GAP_END_QTY,true);
}
//=============================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'BALANCE':
            //---------------------
            data_bisc00200.Call('SELECT');
        break;
    }
}

//=============================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_bisc00200':
            SetGridHeader(grdINOUT);
            if ( grdINOUT.rows > 1 )
            {                
                grdINOUT.SetCellBgColor( 2, G1_ITEM_CODE, grdINOUT.rows - 1, G1_ITEM_CODE, 0xCCFFFF );
                grdINOUT.SetCellBgColor( 2, G1_LOG_BEGIN_QTY, grdINOUT.rows - 1, G1_LOG_END_QTY, 0xFFCCFF );
				if (radType.value=="G")
				    grdINOUT.Subtotal( 1, 2, -1, '5!6!7!8!9!10!11!12!13!14!15!16','###,###,###.##');
				else
				    grdINOUT.Subtotal( 1, 2, 0, '5!6!7!8!9!10!11!12!13!14!15!16','###,###,###.##');
            }
        break;
    }
}
  
//=============================================================================
function OnPrint(obj)
{
    if(obj==1)
    {
    	var url = System.RootURL + "/standard/reports/bi/sc/rpt_bisc00200.aspx?p_from_date="+dtDTFrom.value+ "&p_to_date=" + dtDTTo.value ;
		url = url + "&p_wh_type=" + lstWHType01.value + "&p_tin_warehouse_pk=" + lstWH01.value + "&p_wh_name=" + lstWH01.GetText() ;
		url = url + "&p_item_grp=" + lstItemGroup01.value + "&p_item=" + txtItem01.text+ "&p_chk_bal=" + chkBal.value + "&p_bal=" + lstBal.value;
    	System.OpenTargetPage(url);
    }	 
}

//=============================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bisc00200" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="st_lg_pro_bisc00200" >
                <input>
                    <input bind="lstWHType01" />
                </input>
                <output>
                    <output bind="lstWH01" />
                </output>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bisc00200" onreceive="OnDataReceive(this)">
        <xml>
            <dso id="1" type="grid" function="st_lg_sel_bisc00200"  >
                <input bind="grdINOUT" >
					<input bind="dtDTFrom" />
					<input bind="dtDTTo" />
					<input bind="lstWHType01" />
			        <input bind="lstWH01" />
					<input bind="lstItemGroup01" />
			        <input bind="txtItem01" />	
					<input bind="chkBal" />		
					<input bind="lstBal" />		
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Stock Status">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
                W/H
            </td>
            <td style="width: 15%" align="right">
                <gw:list id="lstWHType01" styles="width:100%" onchange="pro_bisc00200.Call('SELECT')" />
            </td>
            <td style="width: 20%" align="right">
                <gw:list id="lstWH01" styles="width: 100%" onchange="OnSearch('BALANCE')"  />
            </td>
			
			<td style="width: 5%; white-space: nowrap" align="right">
                Item
            </td>
            <td style="width: 20%" align="right">
                <gw:list id="lstItemGroup01" styles="width: 100%" onchange="OnSearch('BALANCE')" />
            </td>
            <td style="width: 10%">
                <gw:textbox id="txtItem01" maxlen="100" styles='width:100%' onenterkey="OnSearch('BALANCE')" />
            </td>
			
            <td style="width: 5%; white-space: nowrap" align="right">
                Date
            </td>
            <td style="width: 10%; white-space: nowrap">
                <gw:datebox id="dtDTFrom" lang="1"   />
                ~
                <gw:datebox id="dtDTTo" lang="1"   />
            </td>             
            <td style="width: 1%" align="center"> 
				<gw:checkbox id="chkBal" styles="color:red" defaultvalue="Y|N" value="N" onchange="OnSearch('BALANCE')"></gw:checkbox>
            </td>
            <td style="width: 7%" align="center"> 
				<gw:list id="lstBal" styles="width: 100%" onchange="OnSearch('BALANCE')" >
				 <data>|ALL|Gap All|1|Begin Qty|2|In Qty|3|Out Qty|4|End Qty</data></gw:list>
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="ibtnReport1" img="excel" alt="Report" text="Report" onclick="OnPrint(1)" />
            </td>             
            <td style="width: 1%" align="right">
                <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('BALANCE')" />
            </td> 
        </tr>
        <tr style="height: 1%">
            <td align="right" style="width: 5%; white-space: nowrap">
            </td>
            <td align="right" style="width: 15%">
            </td>
            <td align="right" style="width: 20%">
            <gw:radio id="radType" value="G" styles="width:100%" onchange="OnSearch('BALANCE')"> 
			     <span value="G" id="Span01">Grand Total</span> 
			     <span value="S" id="Spqn02">Sub Total</span> 									      
			 </gw:radio>
            </td>
            <td align="right" style="width: 5%; white-space: nowrap">
            </td>
            <td align="right" style="width: 20%">
            </td>
            <td style="width: 10%">
            </td>
            <td align="right" style="width: 5%; white-space: nowrap">
            </td>
            <td style="width: 10%; white-space: nowrap">
            </td>
            <td align="center" colspan=4 style="width: 1%">
                <gw:label id="lblRecord"  text="0 record(s)." maxlen = "100" styles="color:red;width:90%;font-weight: bold;font-size:10" />
            </td>
           
        </tr>
        <tr style="height: 98%">
            <td colspan="15">
                <gw:grid id='grdINOUT' 
					header='W/H ID|W/H Name|Item Code|Item Name|UOM|Begin Qty(ACC)|In Qty(ACC)|Out Qty(ACC)|End Qty(ACC)|Begin Qty(LOG)|In Qty(LOG)|Out Qty(LOG)|End Qty(LOG)|Begin Qty(GAP)|In Qty(GAP)|Out Qty(GAP)|End Qty(GAP)'
                    format='0|0|0|0|-2|-2|-2|-2|-2|-2|-2|-2|-2|-2|-2|-2|-2' 
					aligns='0|0|1|0|0|0|1|3|3|3|3|3|3|3|3|3'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
				    widths='1500|2000|1200|1200|1500|2500|800|1500|1500|1500|1500|1500|1500|1500|1500|1500'
                    sorting='T' styles='width:100%; height:100%' 
                    autosize='T'
					/>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
</body>
</html>
