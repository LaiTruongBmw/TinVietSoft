<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>W/H Stock Checking 6</title>
</head>

<script>
   
var G1_GRP_PK	  = 0,
	G1_GRP_CODE   = 1,
	G1_ITEM_PK    = 2,    
    G1_ITEM_CODE  = 3,
    G1_ITEM_NAME  = 4, 	 	
		 
    G1_STOCK_QTY  = 5,
	G1_UOM		  = 6,
	
	G1_CON_RATE_1 = 7,
	G1_CON_STOCK_1= 8,
	G1_CON_UOM_1  = 9,
	G1_CON_RATE_2 = 10,
	G1_CON_STOCK_2= 11,
	G1_CON_UOM_2  = 12,
	G1_CON_RATE_3 = 13,
	G1_CON_STOCK_3= 14,
	G1_CON_UOM_3  = 15,
	G1_CON_RATE_4 = 16,
	G1_CON_STOCK_4= 17,
	G1_CON_UOM_4  = 18,
	G1_CON_RATE_5 = 19,
	G1_CON_STOCK_5= 20,
	G1_CON_UOM_5  = 21;
	 
//=============================================================================             
function BodyInit()
{       
    System.Translate(document); 
	
    FormatGrid();	          
    //----------------- 
    BindReportList();    
}
//=============================================================================           
function FormatGrid()
{
    var data ;
 
	data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||Select ALL";
    lstWHType.SetDataText(data);
    lstWHType.value = '';
 	
	data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from tlg_in_warehouse where del_if = 0 and use_yn = 'Y' order by wh_id ")%>||";     
    lstWareHouse.SetDataText(data);
    lstWareHouse.value = '';
	 	
    data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' * ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||";     
    lstGroup.SetDataText(data);
    lstGroup.value = '';	
        
    data = "data|10|Grand Total|20|Group Subtotal";
    lstGridType.SetDataText(data);  
    lstGridType.value = '10'; 
    
    data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    lstLang.SetDataText(data);      
    lstLang.value = "<%=Session("SESSION_LANG")%>";	 
			
    var ctrl = grdINOUT.GetGridControl();   
      
    ctrl.ColFormat(G1_STOCK_QTY)   = "###,###,###.##" ;     
    ctrl.ColFormat(G1_CON_STOCK_1) = "###,###,###.##" ;
	ctrl.ColFormat(G1_CON_STOCK_2) = "###,###,###.##" ;
	ctrl.ColFormat(G1_CON_STOCK_3) = "###,###,###.##" ;	
    ctrl.ColFormat(G1_CON_STOCK_4) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_CON_STOCK_5) = "###,###,###.##" ; 	
	
	ctrl.FrozenCols = G1_ITEM_NAME ; 	
		 	  	
}  
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    {               
        case 'BALANCE':           
            //---------------------  			     
            data_bisc00150_1.Call('SELECT');			 
        break;
    }
}
  
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {              
        case 'data_bisc00150_1':            
            if ( grdINOUT.rows > 1 )
            {
				var fg = grdINOUT.GetGridControl();				 				
				//--------------------------------------------------------------------							    
                grdINOUT.SetCellBold( 1, G1_ITEM_CODE, grdINOUT.rows-1, G1_ITEM_CODE, true);
				
				grdINOUT.SetCellBold( 1, G1_STOCK_QTY,   grdINOUT.rows-1, G1_STOCK_QTY,   true);
				grdINOUT.SetCellBold( 1, G1_CON_STOCK_1, grdINOUT.rows-1, G1_CON_STOCK_1, true);	
				grdINOUT.SetCellBold( 1, G1_CON_STOCK_2, grdINOUT.rows-1, G1_CON_STOCK_2, true);
				grdINOUT.SetCellBold( 1, G1_CON_STOCK_3, grdINOUT.rows-1, G1_CON_STOCK_3, true);
				grdINOUT.SetCellBold( 1, G1_CON_STOCK_4, grdINOUT.rows-1, G1_CON_STOCK_4, true);
				grdINOUT.SetCellBold( 1, G1_CON_STOCK_5, grdINOUT.rows-1, G1_CON_STOCK_5, true);				 				                
                
                grdINOUT.SetCellBgColor( 1, G1_STOCK_QTY, grdINOUT.rows - 1, G1_UOM, 0xFFFFCC );		
				
				grdINOUT.SetCellBgColor( 1, G1_CON_STOCK_1, grdINOUT.rows - 1, G1_CON_UOM_1, 0xCCFFFF );	
				grdINOUT.SetCellBgColor( 1, G1_CON_STOCK_2, grdINOUT.rows - 1, G1_CON_UOM_2, 0xCCFFFF ); 
				grdINOUT.SetCellBgColor( 1, G1_CON_STOCK_3, grdINOUT.rows - 1, G1_CON_UOM_3, 0xCCFFFF );
				grdINOUT.SetCellBgColor( 1, G1_CON_STOCK_4, grdINOUT.rows - 1, G1_CON_UOM_4, 0xCCFFFF );
				grdINOUT.SetCellBgColor( 1, G1_CON_STOCK_5, grdINOUT.rows - 1, G1_CON_UOM_5, 0xCCFFFF );
				
				if ( lstGridType.value == '10' )
	            {
	                grdINOUT.Subtotal( 0, 2, -1, '5!8!11!14!17!20','###,###,###.##');							
	            }
	            else if ( lstGridType.value == '20' )
	            {
	                grdINOUT.Subtotal( 0, 2, 0, '5!8!11!14!17!20','###,###,###.##');							
	            }
									 
			} 
        break;    		 	  		           
    }
}
//=============================================================================
function OnPopUp(pos){
    switch (pos)
    {
        case 'REPORT':
		    var url = System.RootURL + '/standard/forms/fp/ab/fpab00790.aspx?group_id=LGCM0050&cha_value2=bisc00150';
			var rtnData = System.OpenModal(  url , 500, 200, 'resizable:yes;status:yes;', this);
			lstReportType.SetDataText(rtnData);
			
		break;
    }
}
//============================================================================= 
function OnReport()
{    
    var url =System.RootURL + '/standard/reports/bi/sc/' + lstReportType.value +
                              '?p_lang=' + lstLang.value +
                              '&p_item_grp=' + lstGroup.value +
                              '&p_item=' + txtItem.text +
                              '&p_wh_type=' + lstWHType.value +
                              '&p_wh=' + lstWareHouse.value +
                              '&p_wh_name=' + lstWareHouse.GetText() +
                              '&p_use_yn=' + lstUseYn.value +
                              '&p_rad_type=' + radType.value +
                              '&p_dt_from=' + dtFrom.value;
    window.open(url);
} 
//=============================================================================
function BindReportList(){
	data = "<%=CtlLib.SetListDataSQL("select v.CHA_VALUE2,v.CODE_NM from vlg_code v where v.group_id='LGCM0050' and v.CHA_VALUE1='bisc00150' order by nvl(v.NUM_VALUE1,0)")%>";
    lstReportType.SetDataText(data);
}                
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bisc00150_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="st_lg_SEL_bisc00150_1"  >
                <input bind="grdINOUT" >
					<input bind="lstLang" />										           			      
					<input bind="lstGroup" />				
			        <input bind="txtItem" />
					<input bind="lstWHType" />				
			        <input bind="lstWareHouse" />
			        <input bind="lstUseYn" />
					<input bind="radType" />
					<input bind="dtFrom" />							 												 												      			        
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bisc00150" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="st_lg_pro_bisc00150" >
                <input>
                    <input bind="lstWHType" />
                    <input bind="lstUseYn" />
                </input>
                <output>
                    <output bind="lstWareHouse" />
                </output>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
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
                Group
            </td>
            <td colspan="20" align="right">
                <gw:list id="lstGroup" styles="width: 100%" />
            </td>            
            <td colspan="25">
                <gw:textbox id="txtItem" maxlen="100" styles='width:100%' onenterkey="OnSearch('BALANCE')" />
            </td>
			<td colspan="10" style="white-space: nowrap" align="center">
                <gw:radio id="radType" value="ITEM" styles="width:100%"> 
				     <span value="ST" id="Span01">ST</span> 
				     <span value="ITEM" id="Spqn02">Item</span> 									      
				 </gw:radio>
            </td>
            <td colspan="5" align="right">
                Lang
            </td>
            <td colspan="10">
                <gw:list id="lstLang" styles='width:100%' />
            </td>
			
			<td colspan="8" style="white-space:nowrap" align="right">
                Sub Total
            </td>
            <td colspan="10" style="white-space: nowrap"  >
                <gw:list id="lstGridType" styles='width:100%;' />
            </td>
            <td colspan="5">
            </td>           
            <td colspan="2">
                <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('BALANCE')" />
            </td>
        </tr>
        <tr style="width: 100%; height: 1%">
            <td colspan="5" style="white-space: nowrap" align="right">
                W/H
            </td>
            <td colspan="20" align="right">
                <gw:list id="lstWHType" styles="width:100%" onchange="pro_bisc00150.Call('SELECT')" />
            </td>
			<td colspan="25" align="right">
                <gw:list id="lstWareHouse" styles="width: 100%" />
            </td>
            <td colspan="10" align="right">
                <gw:list id="lstUseYn" styles="width: 100%" onchange="pro_bisc00150.Call('SELECT')">
					<data>ListUse|Y|In use|N|Not in use|ALL|All</data>
				</gw:list>
            </td>
            <td colspan="5" align="right">
                Date
            </td>
            <td colspan="10" align="left" style="white-space: nowrap">
                <gw:datebox id="dtFrom" lang="1" styles="width:100%" />                 
            </td>
            <td colspan="8" align="right">
                <b style="color: green; cursor: hand" onclick="OnPopUp('REPORT')"><u>Reports List</u></b>
            </td>
            <td colspan="15" align="right">
                <gw:list id="lstReportType" styles='width:100%' />
            </td>
            <td colspan="2" align="right">
                <gw:button id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport()" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="100">
                <gw:grid id='grdINOUT' 
					header='_GRP_PK|Group|_ITEM_PK|Item Code|Item Name|Stock Qty|Item UOM|Rate|Con Qty|UOM|Rate|Con Qty|UOM|Rate|Con Qty|UOM|Rate|Con Qty|UOM|Rate|Con Qty|UOM'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|3|1|3|3|1|3|3|1|3|3|1|3|3|1|3|3|1'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='0|1500|0|1500|3000|1200|1000|1200|1500|1000|1200|1500|1000|1200|1500|1000|1200|1500|1000|1200|1500|1000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
</body> 
 
</html>
