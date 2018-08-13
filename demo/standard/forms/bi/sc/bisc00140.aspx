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
	G1_UOM		  = 5,	 
    G1_STOCK_QTY  = 6,
    
    G1_WH_01      = 7,	 
    G1_WH_02      = 8,	 
    G1_WH_03      = 9,
	G1_WH_04      = 10,
    G1_WH_05      = 11,
    G1_WH_06      = 12,
    G1_WH_07      = 13,
	G1_WH_08      = 14,
    G1_WH_09      = 15,
    G1_WH_10      = 16;
	
var G2_WH_PK_01 = 0,	 
	G2_WH_PK_02 = 1,
	G2_WH_PK_03 = 2,
	G2_WH_PK_04 = 3,
	G2_WH_PK_05 = 4,
	G2_WH_PK_06 = 5,
	G2_WH_PK_07 = 6,	
	G2_WH_PK_08 = 7, 
	G2_WH_PK_09 = 8,
	G2_WH_PK_10 = 9,
	G2_WH_NM_01 = 10,
	G2_WH_NM_02 = 11,		
	G2_WH_NM_03 = 12,	
	G2_WH_NM_04 = 13,
	G2_WH_NM_05 = 14,
	G2_WH_NM_06	= 15,
	G2_WH_NM_07	= 16,
	G2_WH_NM_08	= 17,
	G2_WH_NM_09	= 18,
	G2_WH_NM_10	= 19;
	 
//=============================================================================             
function BodyInit()
{       
    System.Translate(document); 
	
    FormatGrid();
	
    var data ;
    data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    lstLang1.SetDataText(data);      
    lstLang1.value = "<%=Session("SESSION_LANG")%>";	        
    //-----------------
    BindReportList();
}
//=============================================================================           
function FormatGrid()
{
    var data ;
 
	data = "<%=CtlLib.SetListDataSQL("SELECT   pk, strg_id || ' * ' || strg_name FROM tlg_in_storage WHERE del_if = 0 AND use_yn = 'Y' ORDER BY strg_id ")%>||";   
    lstStorage.SetDataText(data);
	lstStorage.value = "";	

	data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||";
    lstWHType.SetDataText(data);
    lstWHType.value = '';
	
    data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' * ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||";     
    lstItemGroup01.SetDataText(data);
    lstItemGroup01.value = '';	
    
    
    data = "data|10|Grand Total|20|Group Subtotal";
    lstGridType.SetDataText(data);  
    lstGridType.value = '10'; 
    		
    var ctrl = grdINOUT.GetGridControl();   
      
    ctrl.ColFormat(G1_STOCK_QTY) = "###,###,###" ;     
    ctrl.ColFormat(G1_WH_01)     = "###,###,###" ;
	ctrl.ColFormat(G1_WH_02)     = "###,###,###" ;
	ctrl.ColFormat(G1_WH_03)     = "###,###,###" ;	
    ctrl.ColFormat(G1_WH_04)     = "###,###,###" ;     
    ctrl.ColFormat(G1_WH_05)     = "###,###,###" ;
	ctrl.ColFormat(G1_WH_06)     = "###,###,###" ;
	ctrl.ColFormat(G1_WH_07)     = "###,###,###" ;
    ctrl.ColFormat(G1_WH_08)     = "###,###,###" ;    
    ctrl.ColFormat(G1_WH_09)     = "###,###,###" ; 
	ctrl.ColFormat(G1_WH_10)     = "###,###,###" ;	 	
	
	ctrl.FrozenCols = G1_ITEM_NAME ; 	
		 	  	
}  
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    {               
        case 'BALANCE':           
            //---------------------  			     
            data_bisc00140_1.Call('SELECT');			 
        break;  	
		
		case 'HEADER':
		    //--------------------------
			data_bisc00140.Call('SELECT');
		break;			 
    }
}
  
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {              
        case 'data_bisc00140_1':            
            if ( grdINOUT.rows > 1 )
            {
				var fg = grdINOUT.GetGridControl();				 				
				//------------------------------------------------------------------
				 				 
				fg.Cell(0, 0, G1_WH_01, 0, G1_WH_01 ) = grdHeader.GetGridData( 1, G2_WH_NM_01 );
				fg.Cell(0, 0, G1_WH_02, 0, G1_WH_02 ) = grdHeader.GetGridData( 1, G2_WH_NM_02 );	
				fg.Cell(0, 0, G1_WH_03, 0, G1_WH_03 ) = grdHeader.GetGridData( 1, G2_WH_NM_03 );	
				fg.Cell(0, 0, G1_WH_04, 0, G1_WH_04 ) = grdHeader.GetGridData( 1, G2_WH_NM_04 );	
				fg.Cell(0, 0, G1_WH_05, 0, G1_WH_05 ) = grdHeader.GetGridData( 1, G2_WH_NM_05 );	
				fg.Cell(0, 0, G1_WH_06, 0, G1_WH_06 ) = grdHeader.GetGridData( 1, G2_WH_NM_06 );	
				fg.Cell(0, 0, G1_WH_07, 0, G1_WH_07 ) = grdHeader.GetGridData( 1, G2_WH_NM_07 );	
				fg.Cell(0, 0, G1_WH_08, 0, G1_WH_08 ) = grdHeader.GetGridData( 1, G2_WH_NM_08 );	
				fg.Cell(0, 0, G1_WH_09, 0, G1_WH_09 ) = grdHeader.GetGridData( 1, G2_WH_NM_09 );	
				fg.Cell(0, 0, G1_WH_10, 0, G1_WH_10 ) = grdHeader.GetGridData( 1, G2_WH_NM_10 );	
				
				//--------------------------------------------------------------------							    
                grdINOUT.SetCellBold( 1, G1_ITEM_CODE, grdINOUT.rows-1, G1_ITEM_CODE, true);					 				                
                
                grdINOUT.SetCellBgColor( 1, G1_STOCK_QTY, grdINOUT.rows - 1, G1_STOCK_QTY, 0xCCFFFF );			
				
				if ( lstGridType.value == '10' )
	            {
	                grdINOUT.Subtotal( 0, 2, -1, '6!7!8!9!10!11!12!13!14!15!16','###,###,###.##');							
	            }
	            else if ( lstGridType.value == '20' )
	            {
	                grdINOUT.Subtotal( 0, 2, 0, '6!7!8!9!10!11!12!13!14!15!16','###,###,###.##');							
	            } 
			} 
			else
			{
				var fg = grdINOUT.GetGridControl();				 				
				//------------------------------------------------------------------
				 				 
				fg.Cell(0, 0, G1_WH_01, 0, G1_WH_01 ) = "";
				fg.Cell(0, 0, G1_WH_02, 0, G1_WH_02 ) = ""	
				fg.Cell(0, 0, G1_WH_03, 0, G1_WH_03 ) = "";	
				fg.Cell(0, 0, G1_WH_04, 0, G1_WH_04 ) = "";	
				fg.Cell(0, 0, G1_WH_05, 0, G1_WH_05 ) = "";
				fg.Cell(0, 0, G1_WH_06, 0, G1_WH_06 ) = "";
				fg.Cell(0, 0, G1_WH_07, 0, G1_WH_07 ) = "";	
				fg.Cell(0, 0, G1_WH_08, 0, G1_WH_08 ) = "";	
				fg.Cell(0, 0, G1_WH_09, 0, G1_WH_09 ) = "";	
				fg.Cell(0, 0, G1_WH_10, 0, G1_WH_10 ) = "";		
			}
        break;    

		case 'data_bisc00140': 
			if ( grdHeader.rows > 1 )
			{
				txtWHPK_01.text  = grdHeader.GetGridData( 1, G2_WH_PK_01 );				 
				txtWHPK_02.text  = grdHeader.GetGridData( 1, G2_WH_PK_02 );				 
				txtWHPK_03.text  = grdHeader.GetGridData( 1, G2_WH_PK_03 );				 
				txtWHPK_04.text  = grdHeader.GetGridData( 1, G2_WH_PK_04 );		
				txtWHPK_05.text  = grdHeader.GetGridData( 1, G2_WH_PK_05 );
				txtWHPK_06.text  = grdHeader.GetGridData( 1, G2_WH_PK_06 );	
				txtWHPK_07.text  = grdHeader.GetGridData( 1, G2_WH_PK_07 );		
				txtWHPK_08.text  = grdHeader.GetGridData( 1, G2_WH_PK_08 );
				txtWHPK_09.text  = grdHeader.GetGridData( 1, G2_WH_PK_09 );
				txtWHPK_10.text  = grdHeader.GetGridData( 1, G2_WH_PK_10 ); 						
				
				OnSearch('BALANCE');
			}
			else
			{
				alert('There no warehouse for this Storage .');
			}           
                     
        break;   				  		           
    }
}
//============================================================================= 
function OnPopUp(pos){
    switch (pos)
    {
        case 'REPORT':
		    var url = System.RootURL + '/standard/forms/fp/ab/fpab00790.aspx?group_id=LGCM0050&cha_value2=bisc00140';
			var rtnData = System.OpenModal(  url , 500, 200, 'resizable:yes;status:yes;', this);
			lstReportType.SetDataText(rtnData);
			
		break;
    }
}
//============================================================================= 
function OnReport()
{    
    var url =System.RootURL +   '/standard/reports/bi/sc/rpt_bisc00140_grand.aspx'+ 
                                '?p_lang='+lstLang1.value+
                                '&p_item_grp='+lstItemGroup01.value+
                                '&p_item='+txtItem01.text+
                                '&p_rad_type='+radType.value+
                                '&p_dt_from='+dtFrom.value+
                                '&p_wh_pk_1='+txtWHPK_01.text+
                                '&p_wh_pk_2='+txtWHPK_02.text+
                                '&p_wh_pk_3='+txtWHPK_03.text+
                                '&p_wh_pk_4='+txtWHPK_04.text+
                                '&p_wh_pk_5='+txtWHPK_05.text+
                                '&p_wh_pk_6='+txtWHPK_06.text+
                                '&p_wh_pk_7='+txtWHPK_07.text+
                                '&p_storage='+lstStorage.value+
                                '&p_wh_type='+lstWHType.value;         
    window.open(url);
} 
//=============================================================================
function BindReportList(){
	data = "<%=CtlLib.SetListDataSQL("select v.CHA_VALUE2,v.CODE_NM from vlg_code v where v.group_id='LGCM0050' and v.CHA_VALUE1='bisc00140' order by nvl(v.NUM_VALUE1,0)")%>";
    lstReportType.SetDataText(data);
}                  
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bisc00140_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="st_lg_SEL_bisc00140_1"  >
                <input bind="grdINOUT" >
					<input bind="lstLang1" />										           			      
					<input bind="lstItemGroup01" />				
			        <input bind="txtItem01" />
					<input bind="radType" />
					<input bind="dtFrom" />							 							
					<input bind="txtWHPK_01" />					   
					<input bind="txtWHPK_02" />					 
					<input bind="txtWHPK_03" />					 
					<input bind="txtWHPK_04" />
					<input bind="txtWHPK_05" /> 
					<input bind="txtWHPK_06" />	
					<input bind="txtWHPK_07" />		
					<input bind="txtWHPK_08" />
					<input bind="txtWHPK_09" />
					<input bind="txtWHPK_10" />												      			        
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bisc00140" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="st_lg_SEL_bisc00140"  >
                <input bind="grdHeader" >					 
					<input bind="lstStorage" />	
					<input bind="lstWHType" />	
                </input>
                <output bind="grdHeader" />
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
            <td colspan="30" align="right">
                <gw:list id="lstItemGroup01" styles="width: 100%" />
            </td>
            <td colspan="5" style="white-space: nowrap" align="right">
                Item
            </td>
            <td colspan="20">
                <gw:textbox id="txtItem01" maxlen="100" styles='width:100%' onenterkey="OnSearch('HEADER')" />
            </td>
            <td colspan="5" align="right">
                Lang
            </td>
            <td colspan="10">
                <gw:list id="lstLang1" styles='width:100%' />
            </td>
            <td colspan="10" align="right">
                <b style="color: green; cursor: hand" onclick="OnPopUp('REPORT')"><u>Reports List</u></b>
            </td>
            <td colspan="13">
                <gw:list id="lstReportType" styles='width:100%' />
            </td>
            <td colspan="2" align="right">
                <gw:button id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport()" />
            </td>
        </tr>
        <tr style="width: 100%; height: 1%">
            <td colspan="5" style="white-space: nowrap" align="right">
                W/H
            </td>
            <td colspan="15" align="right">
                <gw:list id="lstStorage" styles="width:100%" />
            </td>
			<td colspan="15" align="right">
                <gw:list id="lstWHType" styles="width:100%" />
            </td>
            <td colspan="5" align="right">
                Date
            </td>
            <td colspan="20" align="left" style="white-space: nowrap">
                <gw:datebox id="dtFrom" lang="1" styles="width:50%" />                 
            </td>
            <td colspan="15" style="white-space: nowrap" align="center">
                <gw:radio id="radType" value="ITEM" styles="width:100%" > 
				     <span value="ST" id="Span01">ST</span> 
				     <span value="ITEM" id="Spqn02">Item</span> 									      
				 </gw:radio>
            </td>
            <td colspan="10" style="white-space:nowrap" align="right">
                Sub Total
            </td>
            <td colspan="13" style="white-space: nowrap">
                <gw:list id="lstGridType" styles='width:100%;' />
            </td>
            <td colspan="2">
                <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('HEADER')" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="100">
                <gw:grid id='grdINOUT' 
					header='_GRP_PK|Group|_ITEM_PK|Item Code|Item Name|UOM|Stock Qty|1|2|3|4|5|6|7|8|9|10'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|1|3|3|3|3|3|3|3|3|3|3|3'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='0|1500|0|1500|3000|800|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
</body>
<gw:textbox id="txtWHPK_01" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_02" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_03" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_04" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_05" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_06" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_07" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_08" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_09" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_10" maxlen="100" styles='width:100%;display:none' />
<gw:grid id='grdHeader' header='WH_PK_01|WH_PK_02|WH_PK_03|WH_PK_04|WH_PK_05|WH_PK_06|WH_PK_07|WH_PK_08|WH_PK_09|WH_PK_10|WH_NM_01|WH_NM_02|WH_NM_03|WH_NM_04|WH_NM_05|WH_NM_06|WH_NM_07|WH_NM_08|WH_NM_09|WH_NM_10'
    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
    styles='width:100%; height:460;display:none' />
</html>
