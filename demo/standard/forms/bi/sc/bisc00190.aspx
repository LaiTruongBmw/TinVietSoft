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

var G1_WH_ID	  	= 0,
	G1_WH_NAME   	= 1,	
    G1_TR_DATE  	= 2,
    G1_SLIP_NO		= 3,
	G1_ITEM_CODE 	= 4,
    G1_ITEM_NAME    = 5,
    G1_UOM    		= 6,
	G1_UNIT_PRICE   = 7,
	G1_BEGIN_QTY	= 8,
	G1_BEGIN_AMOUNT	= 9,
    G1_IN_QTY  		= 10,
	G1_IN_AMOUNT	= 11,
    G1_OUT_QTY     	= 12,
	G1_OUT_AMOUNT	= 13,
    G1_END_QTY  	= 14,
	G1_END_AMOUNT   = 15;

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
    BindReportList();
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

	ctrl.ColFormat(G1_UNIT_PRICE) 	= "###,###,###.##" ;	
    ctrl.ColFormat(G1_BEGIN_QTY) 	= "###,###,###.##" ;
	ctrl.ColFormat(G1_BEGIN_AMOUNT) = "###,###,###.##" ;
    ctrl.ColFormat(G1_IN_QTY)   	= "###,###,###.##" ;
    ctrl.ColFormat(G1_IN_AMOUNT) 	= "###,###,###.##" ;	 
	ctrl.ColFormat(G1_OUT_QTY)   	= "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_AMOUNT)	= "###,###,###.##" ;
	ctrl.ColFormat(G1_END_QTY) 		= "###,###,###.##" ;
	ctrl.ColFormat(G1_END_AMOUNT)   = "###,###,###.##" ;

	//ctrl.FrozenCols = G1_ITEM_NAME ; 
	//------

}
//=============================================================================
function OnSearch(id)
{
    switch(id)
    {
        case 'BALANCE':
            //---------------------
            data_bisc00190.Call('SELECT');
        break;
    }
}

//=============================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'data_bisc00190':
            if ( grdINOUT.rows > 1 )
            {                
                grdINOUT.SetCellBold( 1, G1_UNIT_PRICE, grdINOUT.rows-1, G1_UNIT_PRICE,   true);

                grdINOUT.SetCellBgColor( 1, G1_ITEM_CODE, grdINOUT.rows - 1, G1_ITEM_CODE, 0xCCFFFF );

				grdINOUT.SetCellBgColor( 1, G1_IN_QTY,  grdINOUT.rows - 1, G1_IN_AMOUNT,  0xCCFFFF );
                grdINOUT.SetCellBgColor( 1, G1_OUT_QTY, grdINOUT.rows - 1, G1_OUT_AMOUNT, 0xFFFFCC );
				
				grdINOUT.Subtotal( 1, 2, -1, '8!9!10!11!12!13!14!15','###,###,###.##');
				 
            }
        break;
    }
}
//=============================================================================
 function OnPopUp(pos){
    switch (pos)
    {
        case 'REPORT':
		    var url = System.RootURL + '/standard/forms/fp/ab/fpab00790.aspx?group_id=LGCM0050&cha_value2=bisc00190';
			var rtnData = System.OpenModal(  url , 500, 200, 'resizable:yes;status:yes;', this);
			lstReportType.SetDataText(rtnData);
			
		break;
    }
}
//=============================================================================
function OnReport()
{	
    var url = System.RootURL + "/standard/reports/bi/sc/" + lstReportType.value +
                               "?p_from_date=" + dtDTFrom.value + 
                               "&p_to_date=" + dtDTTo.value + 
                               "&p_wh_type=" + lstWHType01.value + 
                               "&p_wh=" + lstWH01.value +
                               "&p_wh_name=" + lstWH01.GetText() +
                               "&p_use_yn=" + lstUseYn.value +
                               "&p_item_grp=" + lstItemGroup01.value + 
                               "&p_item=" + txtItem01.text + 
                               "&p_bal_yn=" + chkBal.value ;
     	 
    System.OpenTargetPage(url);	 
}
 
//=============================================================================
function BindReportList(){
	data = "<%=CtlLib.SetListDataSQL("select v.CHA_VALUE2,v.CODE_NM from vlg_code v where v.group_id='LGCM0050' and v.CHA_VALUE1='bisc00190' order by nvl(v.NUM_VALUE1,0)")%>";
    lstReportType.SetDataText(data);
} 
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bisc00190" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="st_lg_pro_bisc00190" >
                <input>
                    <input bind="lstWHType01" />
                    <input bind="lstUseYn" />
                </input>
                <output>
                    <output bind="lstWH01" />
                </output>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bisc00190" onreceive="OnDataReceive(this)">
        <xml>
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="st_lg_sel_bisc00190"  >
                <input bind="grdINOUT" >
					<input bind="dtDTFrom" />
					<input bind="dtDTTo" />
					<input bind="lstWHType01" />
			        <input bind="lstWH01" />
			        <input bind="lstUseYn" />
					<input bind="lstItemGroup01" />
			        <input bind="txtItem01" />	
					<input bind="chkBal" />		
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Stock Status">
        <tr style="width: 100%; height: 0%">
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
        </tr>
        <tr style="width: 100%; height: 1%">
            <td colspan="5" style="white-space: nowrap" align="right">
                W/H
            </td>
            <td colspan="20" align="right">
                <gw:list id="lstWHType01" styles="width:100%" onchange="pro_bisc00190.Call('SELECT')" />
            </td>
            <td colspan="25" align="right">
                <gw:list id="lstWH01" styles="width: 100%" />
            </td>
			<td colspan="10" align="right">
                <gw:list id="lstUseYn" styles="width: 100%" onchange="pro_bisc00190.Call('SELECT')">
	                <data>ListUse|Y|In use|N|Not in use|ALL|All</data>
                </gw:list>
            </td>
            <td colspan="5" style="white-space: nowrap" align="right">
                Date
            </td>
            <td colspan="10" style="white-space: nowrap">
                <gw:datebox id="dtDTFrom" lang="1"   />
                ~
                <gw:datebox id="dtDTTo" lang="1"   />
            </td>   
            <td colspan="23" align="center"> 
				<gw:checkbox id="chkBal" styles="color:red" defaultvalue="Y|N" value="Y">Bal</gw:checkbox>
            </td>         
            <td colspan="2" align="right">
                <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('BALANCE')" />
            </td> 
        </tr>
        <tr style="width: 100%; height: 1%">
			<td colspan="5" style="white-space: nowrap" align="right">
                Item
            </td>
            <td colspan="20" align="right">
                <gw:list id="lstItemGroup01" styles="width: 100%" />
            </td>
            <td colspan="25">
                <gw:textbox id="txtItem01" maxlen="100" styles='width:100%' onenterkey="OnSearch('BALANCE')" />
            </td>
			<td colspan="22">
			</td>
            <td colspan="10" align="right">
                <b style="color: green; cursor: hand" onclick="OnPopUp('REPORT')"><u>Reports List</u></b>
            </td>
            <td colspan="16">
                <gw:list id="lstReportType" styles='width:100%' />
            </td>
            <td colspan="2" align="right">
                <gw:button id="ibtnReport1" img="excel" alt="Many reports" text="Many reports" onclick="OnReport()" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="100">
                <gw:grid id='grdINOUT' 
					header='_W/H ID|W/H Name|Date|Slip No|Item Code|Item Name|UOM|Unit Price|Begin Qty|Begin Amount|In Qty|In Amount|Out Qty|Out Amount|End Qty|End Amount'
                    format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|1|0|0|0|1|3|3|3|3|3|3|3|3|3'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
				    widths='1500|2000|1200|1200|1500|2500|800|1500|1500|1500|1500|1500|1500|1500|1500|1500'
                    sorting='T' styles='width:100%; height:100%' 
					oncelldblclick="OnPopUp('DETAIL')" />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
</body>
</html>
