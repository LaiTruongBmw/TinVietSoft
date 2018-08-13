<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>Daily Stock Checking</title>
</head>

<script>
   
var G1_WH_ID	  = 0,
	G1_GRP_CODE   = 1,	 
    G1_ITEM_CODE  = 2,
    G1_ITEM_NAME  = 3, 	 	
	G1_UOM		  = 4,	
	G1_TYPE       = 5,
    G1_BEGIN_QTY  = 6,
    G1_IN_01      = 7,
    G1_OUT_01     = 8,    	
    G1_IN_02      = 9,
    G1_OUT_02     = 10,    
    G1_IN_03      = 11,
    G1_OUT_03     = 12,    
    G1_IN_04      = 13,
    G1_OUT_04     = 14,
	G1_IN_05      = 15,
    G1_OUT_05     = 16,
	G1_IN_06      = 17,
    G1_OUT_06     = 18,
	G1_IN_07      = 19,
    G1_OUT_07     = 20,
	G1_IN_08      = 21,
    G1_OUT_08     = 22,
	G1_IN_09      = 23,
    G1_OUT_09     = 24,
	G1_IN_10      = 25,
    G1_OUT_10     = 26,
	G1_END_QTY    = 27;
	
var G2_DAY_01 	= 0,
	G2_DAY_02 	= 1,
	G2_DAY_03 	= 2,
	G2_DAY_04   = 3,
	G2_DAY_05 	= 4,
	G2_DAY_06   = 5,
	G2_DAY_07 	= 6,
	G2_DAY_08   = 7,
	G2_DAY_09	= 8,
	G2_DAY_10	= 9,
	G2_HEADER_01= 10,
	G2_HEADER_02= 11,		
	G2_HEADER_03= 12,	
	G2_HEADER_04= 13,
	G2_HEADER_05= 14,
	G2_HEADER_06= 15,
	G2_HEADER_07= 16,
	G2_HEADER_08= 17,
	G2_HEADER_09= 18,
	G2_HEADER_10= 19;		
	 
//=============================================================================             
function BodyInit()
{       
    System.Translate(document); 
	 
    FormatGrid();	
	        
    //-----------------     
	
	OnSearch('HEADER');
}
//=============================================================================           
function FormatGrid()
{
    var data ;
 
	data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||Select ALL";    
    lstWHType.SetDataText(data);
    lstWHType.value = '';	
	
	data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from tlg_in_warehouse where del_if = 0 and use_yn='Y' order by wh_id")%>";     
	lstWarehouse.SetDataText( data + "||");
    lstWarehouse.value = '';			 
	
    data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||";     
    lstGroup.SetDataText(data);
    lstGroup.value = '';	
    		
    data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    lstLang.SetDataText(data);      
    lstLang.value = "<%=Session("SESSION_LANG")%>";
	
    data = "data|10|Qty|20|Ref Qty|30|ALL";
    lstType.SetDataText(data);   
	lstType.value = '10';

    var ctrl = grdINOUT.GetGridControl();   
     
    ctrl.ColFormat(G1_BEGIN_QTY) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_IN_01)     = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_01)    = "###,###,###.##" ;	   
    ctrl.ColFormat(G1_IN_02)     = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_02)    = "###,###,###.##" ;
    ctrl.ColFormat(G1_IN_03)     = "###,###,###.##" ; 
	ctrl.ColFormat(G1_OUT_03)    = "###,###,###.##" ;
    ctrl.ColFormat(G1_IN_04)     = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_04)    = "###,###,###.##" ;	
    ctrl.ColFormat(G1_IN_05)     = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_05)    = "###,###,###.##" ;
    ctrl.ColFormat(G1_IN_06)     = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_06)    = "###,###,###.##" ;
    ctrl.ColFormat(G1_IN_07)     = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_07)    = "###,###,###.##" ;
    ctrl.ColFormat(G1_IN_08)     = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_08)    = "###,###,###.##" ;
    ctrl.ColFormat(G1_IN_09)     = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_09)    = "###,###,###.##" ;
    ctrl.ColFormat(G1_IN_10)     = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_10)    = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_QTY)   = "###,###,###.##" ;  
	
	ctrl.MergeCells = 2 ; 
				
	ctrl.MergeCol(0) = true;
	ctrl.MergeCol(1) = true;
	ctrl.MergeCol(2) = true;
	ctrl.MergeCol(3) = true;
	ctrl.MergeCol(4) = true;
				
	ctrl.FrozenCols = G1_ITEM_NAME ; 	
		 	  	
}  
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    {               
        case 'BALANCE':           
            //---------------------  			     
            data_dscd00120_1.Call('SELECT');			 
        break;  	
		
		case 'HEADER':
		    //--------------------------
			data_dscd00120.Call('SELECT');
		break;			 
    }
}
  
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {              
        case 'data_dscd00120_1':            
            if ( grdINOUT.rows > 1 )
            {
				var fg = grdINOUT.GetGridControl();								
				 			 				
				fg.MergeRow(0) = true;				
				fg.Cell(0, 0, G1_IN_01, 0, G1_OUT_01 ) = grdHeader.GetGridData( 1, G2_HEADER_01 );
				fg.Cell(0, 0, G1_IN_02, 0, G1_OUT_02 ) = grdHeader.GetGridData( 1, G2_HEADER_02 );
				fg.Cell(0, 0, G1_IN_03, 0, G1_OUT_03 ) = grdHeader.GetGridData( 1, G2_HEADER_03 );
				fg.Cell(0, 0, G1_IN_04, 0, G1_OUT_04 ) = grdHeader.GetGridData( 1, G2_HEADER_04 );
				fg.Cell(0, 0, G1_IN_05, 0, G1_OUT_05 ) = grdHeader.GetGridData( 1, G2_HEADER_05 );
				fg.Cell(0, 0, G1_IN_06, 0, G1_OUT_06 ) = grdHeader.GetGridData( 1, G2_HEADER_06 );
				fg.Cell(0, 0, G1_IN_07, 0, G1_OUT_07 ) = grdHeader.GetGridData( 1, G2_HEADER_07 );
				fg.Cell(0, 0, G1_IN_08, 0, G1_OUT_08 ) = grdHeader.GetGridData( 1, G2_HEADER_08 );
				fg.Cell(0, 0, G1_IN_09, 0, G1_OUT_09 ) = grdHeader.GetGridData( 1, G2_HEADER_09 );
				fg.Cell(0, 0, G1_IN_10, 0, G1_OUT_10 ) = grdHeader.GetGridData( 1, G2_HEADER_10 );
				                           
                grdINOUT.SetCellBold( 1, G1_ITEM_CODE, grdINOUT.rows-1, G1_ITEM_CODE, true);							                
                
                grdINOUT.SetCellBgColor( 1, G1_IN_01, grdINOUT.rows - 1, G1_IN_01, 0xCCFFFF );
				grdINOUT.SetCellBgColor( 1, G1_IN_02, grdINOUT.rows - 1, G1_IN_02, 0xCCFFFF );
				grdINOUT.SetCellBgColor( 1, G1_IN_03, grdINOUT.rows - 1, G1_IN_03, 0xCCFFFF );
				grdINOUT.SetCellBgColor( 1, G1_IN_04, grdINOUT.rows - 1, G1_IN_04, 0xCCFFFF );
				grdINOUT.SetCellBgColor( 1, G1_IN_05, grdINOUT.rows - 1, G1_IN_05, 0xCCFFFF );
				grdINOUT.SetCellBgColor( 1, G1_IN_06, grdINOUT.rows - 1, G1_IN_06, 0xCCFFFF );
				grdINOUT.SetCellBgColor( 1, G1_IN_07, grdINOUT.rows - 1, G1_IN_07, 0xCCFFFF );
				grdINOUT.SetCellBgColor( 1, G1_IN_08, grdINOUT.rows - 1, G1_IN_08, 0xCCFFFF );
				grdINOUT.SetCellBgColor( 1, G1_IN_09, grdINOUT.rows - 1, G1_IN_09, 0xCCFFFF );
				grdINOUT.SetCellBgColor( 1, G1_IN_10, grdINOUT.rows - 1, G1_IN_10, 0xCCFFFF );
				
				grdINOUT.SetCellBgColor( 1, G1_OUT_01, grdINOUT.rows - 1, G1_OUT_01, 0xFFFFCC );
				grdINOUT.SetCellBgColor( 1, G1_OUT_02, grdINOUT.rows - 1, G1_OUT_02, 0xFFFFCC );
				grdINOUT.SetCellBgColor( 1, G1_OUT_03, grdINOUT.rows - 1, G1_OUT_03, 0xFFFFCC );
				grdINOUT.SetCellBgColor( 1, G1_OUT_04, grdINOUT.rows - 1, G1_OUT_04, 0xFFFFCC );
				grdINOUT.SetCellBgColor( 1, G1_OUT_05, grdINOUT.rows - 1, G1_OUT_05, 0xFFFFCC );
				grdINOUT.SetCellBgColor( 1, G1_OUT_06, grdINOUT.rows - 1, G1_OUT_06, 0xFFFFCC );
				grdINOUT.SetCellBgColor( 1, G1_OUT_07, grdINOUT.rows - 1, G1_OUT_07, 0xFFFFCC );
				grdINOUT.SetCellBgColor( 1, G1_OUT_08, grdINOUT.rows - 1, G1_OUT_08, 0xFFFFCC );
				grdINOUT.SetCellBgColor( 1, G1_OUT_09, grdINOUT.rows - 1, G1_OUT_09, 0xFFFFCC );
				grdINOUT.SetCellBgColor( 1, G1_OUT_10, grdINOUT.rows - 1, G1_OUT_10, 0xFFFFCC );										
            }            
        break;    

		case 'data_dscd00120': 
			if ( grdHeader.rows > 1 )
			{
				var fg = grdINOUT.GetGridControl();								 
				 			 				
				fg.MergeRow(0) = true;				
				fg.Cell(0, 0, G1_IN_01, 0, G1_OUT_01 ) = grdHeader.GetGridData( 1, G2_HEADER_01 );
				fg.Cell(0, 0, G1_IN_02, 0, G1_OUT_02 ) = grdHeader.GetGridData( 1, G2_HEADER_02 );
				fg.Cell(0, 0, G1_IN_03, 0, G1_OUT_03 ) = grdHeader.GetGridData( 1, G2_HEADER_03 );
				fg.Cell(0, 0, G1_IN_04, 0, G1_OUT_04 ) = grdHeader.GetGridData( 1, G2_HEADER_04 );
				fg.Cell(0, 0, G1_IN_05, 0, G1_OUT_05 ) = grdHeader.GetGridData( 1, G2_HEADER_05 );
				fg.Cell(0, 0, G1_IN_06, 0, G1_OUT_06 ) = grdHeader.GetGridData( 1, G2_HEADER_06 );
				fg.Cell(0, 0, G1_IN_07, 0, G1_OUT_07 ) = grdHeader.GetGridData( 1, G2_HEADER_07 );
				fg.Cell(0, 0, G1_IN_08, 0, G1_OUT_08 ) = grdHeader.GetGridData( 1, G2_HEADER_08 );
				fg.Cell(0, 0, G1_IN_09, 0, G1_OUT_09 ) = grdHeader.GetGridData( 1, G2_HEADER_09 );
				fg.Cell(0, 0, G1_IN_10, 0, G1_OUT_10 ) = grdHeader.GetGridData( 1, G2_HEADER_10 );
				
				txtDay01.text = grdHeader.GetGridData( 1, G2_DAY_01 );
				txtDay02.text = grdHeader.GetGridData( 1, G2_DAY_02 );
				txtDay03.text = grdHeader.GetGridData( 1, G2_DAY_03 );
				txtDay04.text = grdHeader.GetGridData( 1, G2_DAY_04 );
				txtDay05.text = grdHeader.GetGridData( 1, G2_DAY_05 );
				txtDay06.text = grdHeader.GetGridData( 1, G2_DAY_06 );
				txtDay07.text = grdHeader.GetGridData( 1, G2_DAY_07 );
				txtDay08.text = grdHeader.GetGridData( 1, G2_DAY_08 );	
				txtDay09.text = grdHeader.GetGridData( 1, G2_DAY_09 );								
				txtDay10.text = grdHeader.GetGridData( 1, G2_DAY_10 );												
				
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
		case 'Report':
			  
		        var path = System.RootURL + '/standard/forms/ds/cd/dscd00121.aspx';
		        var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
 	         	        		
		break;
	}
}
//============================================================================= 
function OnReport(pos)
{    
	switch (pos)
	{
	 	case 'ST01' :
	 	  	 var url = System.RootURL + "/standard/reports/ds/cd/rpt_dscd00120_ST01.aspx?p_wh_pk=" + lstWarehouse.value + "&p_group_pk=" + lstGroup.value + "&p_item=" + txtItem.text + "&p_date=" + txtDate.value ;			 
		     System.OpenTargetPage(url); 			
		break;

	 	case 'ST02' :
	 	  	 var url = System.RootURL + "/standard/reports/ds/cd/rpt_dscd00120_ST02.aspx?p_wh_pk=" + lstWarehouse.value + "&p_group_pk=" + lstGroup.value + "&p_item=" + txtItem.text + "&p_date=" + txtDate.value ;			 
		     System.OpenTargetPage(url); 			
		break;
		
	}
     
} 
//=============================================================================                       
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_dscd00120" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="st_lg_pro_dscd00120" > 
                <input>
                    <input bind="lstWHType" /> 
                </input> 
                <output>
                    <output bind="lstWarehouse" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_dscd00120_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="st_lg_SEL_dscd00120_1"  >
                <input bind="grdINOUT" >
					<input bind="lstLang" />					
					<input bind="lstWHType" />               
			        <input bind="lstWarehouse" />	
					<input bind="lstGroup" />				
			        <input bind="txtItem" />
					<input bind="txtDay01" />
					<input bind="txtDay02" />  
					<input bind="txtDay03" />
					<input bind="txtDay04" /> 
					<input bind="txtDay05" />
					<input bind="txtDay06" /> 
					<input bind="txtDay07" />
					<input bind="txtDay08" /> 	
					<input bind="txtDay09" /> 
					<input bind="txtDay10" /> 
					<input bind="lstType" />		
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_dscd00120" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="st_lg_SEL_dscd00120"  >
                <input bind="grdHeader" >
					<input bind="txtDate" />					 								 													      			       
                </input>
                <output bind="grdHeader" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Stock Status">
        <tr>
            <td style="width: 5%; white-space: nowrap" align="right">
                Group
            </td>
            <td style="width: 30%" align="right">
                <gw:list id="lstGroup" styles="width: 100%" onchange="OnSearch('BALANCE')" />
            </td>            
            <td style="width: 25%" colspan="2">
                <gw:textbox id="txtItem" maxlen="100" styles='width:100%' onenterkey="OnSearch('BALANCE')" />
            </td>
            <td style="width: 5%" align="right">
               Type
            </td>
            <td style="width: 15%">
				<gw:list id="lstType" styles='width:100%' onchange="OnSearch('BALANCE')" />
                
            </td>
            <td style="width: 13%">
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnPopUp('Report')" />
            </td>
            <td style="width: 1%">
                <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('BALANCE')" />
            </td>
        </tr>
        <tr>
            <td style="width: 5%; white-space: nowrap" align="right">
                W/H
            </td>
            <td align="right">
                <gw:list id="lstWHType" styles="width:100%" onchange="pro_dscd00120.Call('SELECT')" />
            </td>
            <td align="right" colspan="2">
                <gw:list id="lstWarehouse" styles="width: 100%" onchange="OnSearch('BALANCE')" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Date
            </td>
            <td style="width: 15%; white-space: nowrap" align="left">
                <gw:datebox id="txtDate" lang="1" onchange="OnSearch('HEADER')" type="date" />
            </td>
			<td style="width: 13%">				 
            </td>
            <td style="width: 7%" align="center" colspan="2"> 
				<gw:list id="lstLang" styles='width:100%' onchange="OnSearch('BALANCE')" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="12">
                <gw:grid id='grdINOUT' header='W/H|Group|Item Code|Item Name|UOM|_Type|Begin|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|End'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|1|1|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='1500|1500|1500|3000|800|0|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
</body>
<gw:textbox id="txtDay01" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtDay02" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtDay03" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtDay04" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtDay05" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtDay06" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtDay07" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtDay08" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtDay09" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtDay10" maxlen="100" styles='width:100%;display:none' />
<gw:grid id='grdHeader' 
	header='L_DAY_01|L_DAY_02|L_DAY_03|L_DAY_04|L_DAY_05|L_DAY_06|L_DAY_07|L_DAY_08|L_DAY_09|L_DAY_10|DAY01|DAY02|DAY03|DAY04|DAY05|DAY06|DAY07|DAY08|DAY09|DAY10'
    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
	aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
	widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|0|0|0|0|0|0'
    styles='width:100%; height:460;display:none' />
</html>
