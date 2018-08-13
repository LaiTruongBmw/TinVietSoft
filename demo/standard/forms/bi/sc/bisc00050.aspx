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
   
var G1_GRP_PK	  = 0,
	G1_GRP_CODE   = 1,
	G1_ITEM_PK    = 2,    
    G1_ITEM_CODE  = 3,
    G1_ITEM_NAME  = 4, 	 	
	G1_UOM		  = 5,	 
    G1_BEGIN_01   = 6,
    G1_IN_01      = 7,
    G1_OUT_01     = 8,
    G1_END_01     = 9,
	G1_BEGIN_02   = 10,
    G1_IN_02      = 11,
    G1_OUT_02     = 12,
    G1_END_02     = 13,
	G1_BEGIN_03   = 14,
    G1_IN_03      = 15,
    G1_OUT_03     = 16,
    G1_END_03     = 17,
	G1_BEGIN_04   = 18,
    G1_IN_04      = 19,
    G1_OUT_04     = 20,
    G1_END_04     = 21;
	
var G2_BEGIN_01 = 0,
	G2_END_01   = 1,
	G2_BEGIN_02 = 2,
	G2_END_02   = 3,
	G2_BEGIN_03 = 4,
	G2_END_03   = 5,
	G2_BEGIN_04 = 6,
	G2_END_04   = 7,
	G2_HEADER_01= 8,
	G2_HEADER_02= 9,		
	G2_HEADER_03= 10,	
	G2_HEADER_04= 11;		
	 
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
 
	data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||Select ALL";    
    lstWHType01.SetDataText(data);
    lstWHType01.value = '';	
	
	data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from tlg_in_warehouse where del_if = 0 and use_yn='Y' order by wh_id")%>";     
	lstWH01.SetDataText( data + "||");
    lstWH01.value = '';			 
	
    data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||";     
    lstItemGroup01.SetDataText(data);
    lstItemGroup01.value = '';	
    		
    var ctrl = grdINOUT.GetGridControl();   
     
    ctrl.ColFormat(G1_BEGIN_01) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_IN_01)    = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_01)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_01)   = "###,###,###.##" ;	
    ctrl.ColFormat(G1_BEGIN_02) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_IN_02)    = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_02)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_02)   = "###,###,###.##" ;
    ctrl.ColFormat(G1_BEGIN_03) = "###,###,###.##" ;    
    ctrl.ColFormat(G1_IN_03)    = "###,###,###.##" ; 
	ctrl.ColFormat(G1_OUT_03)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_03)   = "###,###,###.##" ;
    ctrl.ColFormat(G1_BEGIN_04) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_IN_04)    = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_04)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_04)   = "###,###,###.##" ;	
	
	ctrl.FrozenCols = G1_ITEM_NAME ; 	
		 	  	
}  
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    {               
        case 'BALANCE':           
            //---------------------  			     
            data_bisc00050_1.Call('SELECT');			 
        break;  	
		
		case 'HEADER':
		    //--------------------------
			data_bisc00050.Call('SELECT');
		break;			 
    }
}
  
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {              
        case 'data_bisc00050_1':            
            if ( grdINOUT.rows > 1 )
            {
				var fg = grdINOUT.GetGridControl();
				
				fg.FixedRows  = 2 ;
            	fg.MergeCells = 5 ;
				grdINOUT.SetCellBold( 1, 1, 1, G1_END_04, true);
				
				fg.MergeCol(G1_GRP_CODE)  = true;
				fg.MergeCol(G1_ITEM_CODE) = true;
				fg.MergeCol(G1_ITEM_NAME) = true;
				fg.MergeCol(G1_UOM)       = true;
				
                fg.Cell(0, 0, G1_GRP_CODE,  1, G1_GRP_CODE  ) = "Group";                
                fg.Cell(0, 0, G1_ITEM_CODE, 1, G1_ITEM_CODE ) = "Item Code";                 
                fg.Cell(0, 0, G1_ITEM_NAME, 1, G1_ITEM_NAME ) = "Item Name";
				fg.Cell(0, 0, G1_UOM,       1, G1_UOM       ) = "UOM";
				
				fg.MergeRow(0) = true;
				fg.Cell(0, 0, G1_BEGIN_01, 0, G1_END_01 ) = grdHeader.GetGridData( 1, G2_HEADER_01 );
				fg.Cell(0, 0, G1_BEGIN_02, 0, G1_END_02 ) = grdHeader.GetGridData( 1, G2_HEADER_02 );
				fg.Cell(0, 0, G1_BEGIN_03, 0, G1_END_03 ) = grdHeader.GetGridData( 1, G2_HEADER_03 );
				fg.Cell(0, 0, G1_BEGIN_04, 0, G1_END_04 ) = grdHeader.GetGridData( 1, G2_HEADER_04 );
                fg.Cell(0, 1, G1_BEGIN_01, 1 ) = "Begin" ;
                fg.Cell(0, 1, G1_IN_01,    1 ) = "In" ;
                fg.Cell(0, 1, G1_OUT_01,   1 ) = "Out" ;
				fg.Cell(0, 1, G1_END_01,   1 ) = "End" ;
                fg.Cell(0, 1, G1_BEGIN_02, 1 ) = "Begin" ;
                fg.Cell(0, 1, G1_IN_02,    1 ) = "In" ;
                fg.Cell(0, 1, G1_OUT_02,   1 ) = "Out" ;
				fg.Cell(0, 1, G1_END_02,   1 ) = "End" ;				
                fg.Cell(0, 1, G1_BEGIN_03, 1 ) = "Begin" ;
                fg.Cell(0, 1, G1_IN_03,    1 ) = "In" ;
                fg.Cell(0, 1, G1_OUT_03,   1 ) = "Out" ;
				fg.Cell(0, 1, G1_END_03,   1 ) = "End" ;				
                fg.Cell(0, 1, G1_BEGIN_04, 1 ) = "Begin" ;
                fg.Cell(0, 1, G1_IN_04,    1 ) = "In" ;
                fg.Cell(0, 1, G1_OUT_04,   1 ) = "Out" ;
				fg.Cell(0, 1, G1_END_04,   1 ) = "End" ;
                
                if (grdINOUT.rows > 2)
                {
                    grdINOUT.SetCellBold( 1, G1_ITEM_CODE, grdINOUT.rows-1, G1_ITEM_CODE, true);							                
                    
                    grdINOUT.SetCellBgColor( 2, G1_BEGIN_01, grdINOUT.rows - 1, G1_END_01, 0xCCFFFF );			
				    grdINOUT.SetCellBgColor( 2, G1_BEGIN_03, grdINOUT.rows - 1, G1_END_03, 0xCCFFFF );	
				}
				grdINOUT.Subtotal( 0, 2, 0, '6!7!8!9!10!11!12!13!14!15!16!17!18!19!20!21','###,###,###.##');							
            }            
        break;    

		case 'data_bisc00050': 
			if ( grdHeader.rows > 1 )
			{
				txtBegin_01.text = grdHeader.GetGridData( 1, G2_BEGIN_01 );
				txtEnd_01.text   = grdHeader.GetGridData( 1, G2_END_01   );
				txtBegin_02.text = grdHeader.GetGridData( 1, G2_BEGIN_02 );
				txtEnd_02.text   = grdHeader.GetGridData( 1, G2_END_02   );
				txtBegin_03.text = grdHeader.GetGridData( 1, G2_BEGIN_03 );
				txtEnd_03.text   = grdHeader.GetGridData( 1, G2_END_03   );
				txtBegin_04.text = grdHeader.GetGridData( 1, G2_BEGIN_04 );
				txtEnd_04.text   = grdHeader.GetGridData( 1, G2_END_04   );								
				
				OnSearch('BALANCE');
			}
			else
			{
				alert('Pls check search date .');
			}           
                     
        break;   				  		           
    }
}
//============================================================================= 
function OnPopUp(pos)
{
	switch(pos)
	{
		case 'REPORT':
            var url = System.RootURL + '/standard/forms/fp/ab/fpab00790.aspx?group_id=LGCM0050&cha_value2=bisc00050';
			var rtnData = System.OpenModal(  url , 500, 200, 'resizable:yes;status:yes;', this);
			lstReportType.SetDataText(rtnData);	
 	         	        		
		break;
	}
}
//============================================================================= 
function OnReport()
{    
    var idxReport = lstReportType.GetControl().options.selectedIndex;
    switch (idxReport)
    {
        case 0:
            var url = System.RootURL + "/standard/reports/bi/sc/" + lstReportType.value +
                                       "?p_lang=" + lstLang1.value +
                                       "&p_wh_type=" + lstWHType01.value +
                                       "&p_wh=" + lstWH01.value +
                                       "&p_item_group=" + lstItemGroup01.value +
                                       "&p_item=" + txtItem01.text+
                                       "&p_begin_01=" + txtBegin_01.text +
                                       "&p_end_01=" + txtEnd_01.text +
                                       "&p_begin_02=" + txtBegin_02.text +
                                       "&p_end_02=" + txtEnd_02.text +
                                       "&p_begin_03=" + txtBegin_03.text +
                                       "&p_end_03=" + txtEnd_03.text +
                                       "&p_begin_04=" + txtBegin_04.text +
                                       "&p_end_04=" + txtEnd_04.text +
                                       "&p_rad_type=" + radType.value +
                                       "&p_month=" + dtMonth01.value;
		    System.OpenTargetPage(url);
            break;
        case 1:
            var url = System.RootURL + "/standard/reports/bi/sc/" + lstReportType.value +
                                       "?p_wh_type=" + lstWHType01.value+
                                       "&p_wh=" + lstWH01.value+
                                       "&p_item_group=" + lstItemGroup01.value + 
                                       "&p_item=" + txtItem01.text+
                                       "&p_month_text=" + dtMonth01.text+
                                       "&p_month_value=" + dtMonth01.value;
            System.OpenTargetPage(url);
            break;
    }
} 
//=============================================================================
function BindReportList(){
	data = "<%=CtlLib.SetListDataSQL("select v.CHA_VALUE2,v.CODE_NM from vlg_code v where v.group_id='LGCM0050' and v.CHA_VALUE1='bisc00050' order by nvl(v.NUM_VALUE1,0)")%>";
    lstReportType.SetDataText(data);
}                      
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bisc00050" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="st_lg_pro_bisc00050" > 
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
    <gw:data id="data_bisc00050_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="st_lg_SEL_bisc00050_1"  >
                <input bind="grdINOUT" >
					<input bind="lstLang1" />					
					<input bind="lstWHType01" />               
			        <input bind="lstWH01" />
			        <input bind="lstUseYn" />
					<input bind="lstItemGroup01" />				
			        <input bind="txtItem01" />
					<input bind="txtBegin_01" />
					<input bind="txtEnd_01" />  
					<input bind="txtBegin_02" />
					<input bind="txtEnd_02" /> 
					<input bind="txtBegin_03" />
					<input bind="txtEnd_03" /> 
					<input bind="txtBegin_04" />
					<input bind="txtEnd_04" /> 															      			        
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bisc00050" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="st_lg_SEL_bisc00050"  >
                <input bind="grdHeader" >
					<input bind="dtMonth01" />	
					<input bind="radType" />									 													      			        
                </input>
                <output bind="grdHeader" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Stock Status">
        <tr style="width: 100%; height: 0%;">
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
			<td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
		</tr>
        <tr>
            <td colspan="5" style="white-space: nowrap" align="right">
                Group
            </td>
            <td colspan="30" align="right">
                <gw:list id="lstItemGroup01" styles="width: 100%" />
            </td>            
            <td colspan="25">
                <gw:textbox id="txtItem01" maxlen="100" styles='width:100%' onenterkey="OnSearch('HEADER')" />
            </td>
            <td colspan="5" align="right">
                Lang
            </td>
            <td  colspan="10">
                <gw:list id="lstLang1" styles='width:100%' />
            </td>
            <td colspan="8" align="right">
                <b style="color: green; cursor: hand" onclick="OnPopUp('REPORT')"><u>Reports List</u></b>
            </td>
            <td colspan="15">
                <gw:list id="lstReportType" styles='width:100%' />
            </td>
            <td colspan="2" align="right">
                <gw:button id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport()" />
            </td>
        </tr>
        <tr>
            <td colspan="5" style="white-space: nowrap" align="right">
                W/H
            </td>
            <td colspan="30" align="right">
                <gw:list id="lstWHType01" styles="width:100%" onchange="pro_bisc00050.Call('SELECT')" />
            </td>
            <td colspan="25" align="right">
                <gw:list id="lstWH01" styles="width: 100%" />
            </td>
            <td colspan="10" align="right">
                <gw:list id="lstUseYn" styles="width: 100%" onchange="pro_bisc00050.Call('SELECT')">
					<data>ListUse|Y|In use|N|Not in use|ALL|All</data>
				</gw:list>
            </td>
            <td colspan="5" style="white-space: nowrap" align="right">
                Date
            </td>
            <td colspan="10" style="white-space: nowrap" align="left">
                <gw:datebox id="dtMonth01" lang="1" type="month" />
            </td>
            <td colspan="13" align="center" colspan="3">
                <gw:radio id="radType" value="M" styles="width:100%"> 
									     <span value="M" id="Span01">Month</span> 
									     <span value="Q" id="Spqn02">Quater</span> 									      
									 </gw:radio>
            </td>
            <td colspan="2">
                <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('HEADER')" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="100">
                <gw:grid id='grdINOUT' header='_GRP_PK|Group|_ITEM_PK|Item Code|Item Name|UOM|01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|1|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|1500|0|1500|3000|800|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
</body>
<gw:textbox id="txtBegin_01" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtEnd_01" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtBegin_02" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtEnd_02" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtBegin_03" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtEnd_03" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtBegin_04" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtEnd_04" maxlen="100" styles='width:100%;display:none' />
<gw:grid id='grdHeader' header='L_BEGIN_DAY_01|L_END_DAY_01|L_BEGIN_DAY_02|L_END_DAY_02|L_BEGIN_DAY_03|L_END_DAY_03|L_BEGIN_DAY_04|L_END_DAY_04|DAY01|DAY02|DAY03|DAY04'
    format='0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
    styles='width:100%; height:460;display:none' />
</html>
