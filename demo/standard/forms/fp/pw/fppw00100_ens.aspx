<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Process W/I Entry</title>
</head>

<script type="text/javascript">

    var user_pk   = "<%=Session("EMPLOYEE_PK")%>" 
    var user_name = "<%=Session("USER_NAME")%>" 
    
  
    
 
    var G1_ITEM_CODE  = 0,
        G1_ITEM_NAME  = 1,
        G1_UOM        = 2,
        G1_WI_15      = 3,
        G1_RE_15      = 4,
        G1_WI_14      = 5,
        G1_RE_14      = 6,
        G1_WI_13      = 7,
        G1_RE_13      = 8,
        G1_WI_12      = 9,
        G1_RE_12      = 10,
        G1_WI_11      = 11,
        G1_RE_11      = 12,
        G1_WI_10      = 13,
        G1_RE_10      = 14,
        G1_WI_09      = 15,
        G1_RE_09      = 16,
        G1_WI_08      = 17,
        G1_RE_08      = 18,
        G1_WI_07      = 19,
        G1_RE_07      = 20,
        G1_WI_06      = 21,
        G1_RE_06      = 22,
        G1_WI_05      = 23,
        G1_RE_05      = 24,
        G1_WI_04      = 25,
        G1_RE_04      = 26,
        G1_WI_03      = 27,
        G1_RE_03      = 28,
        G1_WI_02      = 29,
        G1_RE_02      = 30,
        G1_WI_01      = 31,
        G1_RE_01      = 32,	
        G1_WI_00      = 33,
        G1_RE_00      = 34;	
    
	var G2_COL15  = 0,
        G2_COL14  = 1,
		G2_COL13  = 2,
		G2_COL12  = 3,
		G2_COL11  = 4,
		G2_COL10  = 5,
		G2_COL09  = 6,
		G2_COL08  = 7,
		G2_COL07  = 8,
		G2_COL06  = 9,
		G2_COL05  = 10,
		G2_COL04  = 11,
		G2_COL03  = 12,
		G2_COL02  = 13,
		G2_COL01  = 14,
		G2_COL00  = 15;													 

//================================================================

 function BodyInit()
 {
      System.Translate(document);
       
      //----------------------------- 
      FormatGrid();
	  //-----------------------------
	  OnSearch('date_header');
           
 }
//================================================================

 function FormatGrid()
 {   
      var  data = "" ;
      //-------------------------------------------------
      data = "<%=ESysLib.SetListDataSQL("SELECT   pk, GROUP_ID || ' - ' || group_name  FROM tlg_pb_line_group WHERE del_if = 0 ORDER BY GROUP_ID ") %>||" ;    
      lstLineGroup.SetDataText(data); 
      lstLineGroup.value = '' ;   

      data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from TLG_IT_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||";
      lstItemGroup.SetDataText(data);
      lstItemGroup.value = '';   
      //-------------------------------------------------
      var ctrl = grdDetail.GetGridControl();	
      
      ctrl.ColFormat(3) = "###,###,###,###,###"; 
	  ctrl.ColFormat(4) = "###,###,###,###,###";
	  ctrl.ColFormat(5) = "###,###,###,###,###";
	  ctrl.ColFormat(6) = "###,###,###,###,###";
	  ctrl.ColFormat(7) = "###,###,###,###,###";
	  ctrl.ColFormat(8) = "###,###,###,###,###";
	  ctrl.ColFormat(9) = "###,###,###,###,###";
	  ctrl.ColFormat(10) = "###,###,###,###,###";
	  ctrl.ColFormat(11) = "###,###,###,###,###";
	  ctrl.ColFormat(12) = "###,###,###,###,###";
	  ctrl.ColFormat(13) = "###,###,###,###,###";
	  ctrl.ColFormat(14) = "###,###,###,###,###";
	  ctrl.ColFormat(15) = "###,###,###,###,###";
	  ctrl.ColFormat(16) = "###,###,###,###,###";
	  ctrl.ColFormat(17) = "###,###,###,###,###";
	  ctrl.ColFormat(18) = "###,###,###,###,###";
	  ctrl.ColFormat(19) = "###,###,###,###,###";
	  ctrl.ColFormat(20) = "###,###,###,###,###";
	  ctrl.ColFormat(21) = "###,###,###,###,###";
	  ctrl.ColFormat(22) = "###,###,###,###,###";
	  ctrl.ColFormat(23) = "###,###,###,###,###";
	  ctrl.ColFormat(24) = "###,###,###,###,###";
	  ctrl.ColFormat(25) = "###,###,###,###,###";
	  ctrl.ColFormat(26) = "###,###,###,###,###";
	  ctrl.ColFormat(27) = "###,###,###,###,###";
	  ctrl.ColFormat(28) = "###,###,###,###,###";
	  ctrl.ColFormat(29) = "###,###,###,###,###";
	  ctrl.ColFormat(30) = "###,###,###,###,###";
	  ctrl.ColFormat(31) = "###,###,###,###,###";
	  ctrl.ColFormat(32) = "###,###,###,###,###";
	  ctrl.ColFormat(33) = "###,###,###,###,###";
	  ctrl.ColFormat(34) = "###,###,###,###,###";     
 }        
 
//=======================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'date_header' :
                 data_fppw00100_date_header.Call("SELECT");
            break;   
          
		  	case 'DETAIL':
				data_fppw00100.Call("SELECT");
			break;                
      }  
 }
  
//========================================================================
 function OnDataReceive(obj)
 { 
      switch (obj.id)         
      {		
            case 'data_fppw00100_date_header':
			 
				 var fg = grdDetail.GetGridControl();
				 
				 fg.FixedRows  = 1 ;
				 fg.MergeCells = 5 ;
                 fg.MergeRow(0) = true;
				 fg.Cell(0, 0, G1_WI_15, 0, G1_RE_15 ) = grdHeader.GetGridData( 1, G2_COL15 );
				 fg.Cell(0, 0, G1_WI_14, 0, G1_RE_14 ) = grdHeader.GetGridData( 1, G2_COL14 );
				 fg.Cell(0, 0, G1_WI_13, 0, G1_RE_13 ) = grdHeader.GetGridData( 1, G2_COL13 );
				 fg.Cell(0, 0, G1_WI_12, 0, G1_RE_12 ) = grdHeader.GetGridData( 1, G2_COL12 );
				 fg.Cell(0, 0, G1_WI_11, 0, G1_RE_11 ) = grdHeader.GetGridData( 1, G2_COL11 );
				 fg.Cell(0, 0, G1_WI_10, 0, G1_RE_10 ) = grdHeader.GetGridData( 1, G2_COL10 );
				 fg.Cell(0, 0, G1_WI_09, 0, G1_RE_09 ) = grdHeader.GetGridData( 1, G2_COL09 );
				 fg.Cell(0, 0, G1_WI_08, 0, G1_RE_08 ) = grdHeader.GetGridData( 1, G2_COL08 );
				 fg.Cell(0, 0, G1_WI_07, 0, G1_RE_07 ) = grdHeader.GetGridData( 1, G2_COL07 );
				 fg.Cell(0, 0, G1_WI_06, 0, G1_RE_06 ) = grdHeader.GetGridData( 1, G2_COL06 );
				 fg.Cell(0, 0, G1_WI_05, 0, G1_RE_05 ) = grdHeader.GetGridData( 1, G2_COL05 );
				 fg.Cell(0, 0, G1_WI_04, 0, G1_RE_04 ) = grdHeader.GetGridData( 1, G2_COL04 );
				 fg.Cell(0, 0, G1_WI_03, 0, G1_RE_03 ) = grdHeader.GetGridData( 1, G2_COL03 );
				 fg.Cell(0, 0, G1_WI_02, 0, G1_RE_02 ) = grdHeader.GetGridData( 1, G2_COL02 );
				 fg.Cell(0, 0, G1_WI_01, 0, G1_RE_01 ) = grdHeader.GetGridData( 1, G2_COL01 );
				 fg.Cell(0, 0, G1_WI_00, 0, G1_RE_00 ) = grdHeader.GetGridData( 1, G2_COL00 );
				 
				 OnSearch("DETAIL");
				 
            break;    
			
			case 'data_fppw00100':
				if ( grdDetail.rows > 1 )
				{
					grdDetail.SetCellBold( 1, G1_ITEM_CODE, grdDetail.rows-1, G1_ITEM_CODE, true);
					
					grdDetail.SetCellBgColor( 1, G1_WI_15, grdDetail.rows - 1, G1_RE_15, 0xCCFFFF );					 
					grdDetail.SetCellBgColor( 1, G1_WI_13, grdDetail.rows - 1, G1_RE_13, 0xCCFFFF );					 
					grdDetail.SetCellBgColor( 1, G1_WI_11, grdDetail.rows - 1, G1_RE_11, 0xCCFFFF );					 
					grdDetail.SetCellBgColor( 1, G1_WI_09, grdDetail.rows - 1, G1_RE_09, 0xCCFFFF );					 
					grdDetail.SetCellBgColor( 1, G1_WI_07, grdDetail.rows - 1, G1_RE_07, 0xCCFFFF );					 
					grdDetail.SetCellBgColor( 1, G1_WI_05, grdDetail.rows - 1, G1_RE_05, 0xCCFFFF );					 
					grdDetail.SetCellBgColor( 1, G1_WI_03, grdDetail.rows - 1, G1_RE_03, 0xCCFFFF );					 
					grdDetail.SetCellBgColor( 1, G1_WI_01, grdDetail.rows - 1, G1_RE_01, 0xCCFFFF );
					
					grdDetail.GetGridControl().Cell( 7, 1, G1_RE_15, grdDetail.rows - 1, G1_RE_15 ) = 0x3300cc;
					grdDetail.GetGridControl().Cell( 7, 1, G1_RE_14, grdDetail.rows - 1, G1_RE_14 ) = 0x3300cc;
					grdDetail.GetGridControl().Cell( 7, 1, G1_RE_13, grdDetail.rows - 1, G1_RE_13 ) = 0x3300cc;
					grdDetail.GetGridControl().Cell( 7, 1, G1_RE_12, grdDetail.rows - 1, G1_RE_12 ) = 0x3300cc;
					grdDetail.GetGridControl().Cell( 7, 1, G1_RE_11, grdDetail.rows - 1, G1_RE_11 ) = 0x3300cc;
					grdDetail.GetGridControl().Cell( 7, 1, G1_RE_10, grdDetail.rows - 1, G1_RE_10 ) = 0x3300cc;	
					grdDetail.GetGridControl().Cell( 7, 1, G1_RE_09, grdDetail.rows - 1, G1_RE_09 ) = 0x3300cc;		
					grdDetail.GetGridControl().Cell( 7, 1, G1_RE_08, grdDetail.rows - 1, G1_RE_08 ) = 0x3300cc;	
					grdDetail.GetGridControl().Cell( 7, 1, G1_RE_07, grdDetail.rows - 1, G1_RE_07 ) = 0x3300cc;	
					grdDetail.GetGridControl().Cell( 7, 1, G1_RE_06, grdDetail.rows - 1, G1_RE_06 ) = 0x3300cc;	
					grdDetail.GetGridControl().Cell( 7, 1, G1_RE_05, grdDetail.rows - 1, G1_RE_05 ) = 0x3300cc;	
					grdDetail.GetGridControl().Cell( 7, 1, G1_RE_04, grdDetail.rows - 1, G1_RE_04 ) = 0x3300cc;	
					grdDetail.GetGridControl().Cell( 7, 1, G1_RE_03, grdDetail.rows - 1, G1_RE_03 ) = 0x3300cc;	
					grdDetail.GetGridControl().Cell( 7, 1, G1_RE_02, grdDetail.rows - 1, G1_RE_02 ) = 0x3300cc;
					grdDetail.GetGridControl().Cell( 7, 1, G1_RE_01, grdDetail.rows - 1, G1_RE_01 ) = 0x3300cc;	
					grdDetail.GetGridControl().Cell( 7, 1, G1_RE_00, grdDetail.rows - 1, G1_RE_00 ) = 0x3300cc;				 					                	 
					
					grdDetail.Subtotal( 0, 2, -1, '3!4!5!6!7!8!9!10!11!12!13!14!15!16!17!18!19!20!21!22!23!24!25!26!27!28!29!30!31!32!33!34','###,###,###');
				}			
			break;   			                                   
      }  
 } 

//=====================================================================================

function OnProcess(pos)
{
    switch (pos)
    {
        case 'Line':
            pro_fppw00100_line.Call();
        break; 
    }
}	   
//================================================================================
function OnReport(pos)
{
	switch(pos)
	{
		case 'ST01':
			var url =System.RootURL + '/reports/fp/pw/rpt_fppw00100_ST01.aspx?p_pb_line_group_pk='+ lstLineGroup.value+ '&p_pb_line_pk='+lstLine.value+ '&p_itemgrp_pk='+lstItemGroup.value+ '&p_item='+txtItem.text+ '&p_date='+dtFromDate.value;
			window.open(url); 		
		break;
		case 'ST02':
				 	
		break;
		
		case 'ST03':
						
		break;
	}
 
}
function OnPopUp(pos)
{	
	switch(pos)
	{	    
	    //----------------
		case 'REPORT':
			var path = System.RootURL + '/form/fp/pw/fppw00102.aspx';
		    var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
		break;	
	}
} 
 
//=========================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppw00100_line" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fppw00100_line" > 
                <input>
                    <input bind="lstLineGroup" /> 
                </input> 
                <output>
                    <output bind="lstLine" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppw00100" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fppw00100_ens" > 
			    <input bind="grdDetail" >			        
			        <input bind="lstLineGroup" />			
			        <input bind="lstLine" />
					<input bind="lstItemGroup" />		
					<input bind="txtItem" />		
			        <input bind="dtFromDate" />			
			    </input> 
			    <output bind="grdDetail" />
		    </dso> 
	    </xml> 
    </gw:data>
	<!---------------------------------------------------------------->
    <gw:data id="data_fppw00100_date_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fppw00100_date_header"> 
                <input> 
                    <input bind="dtFromDate" />
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            
            <td align="right" style="width: 5%; white-space: nowrap">
                Line
            </td>
            <td style="width: 15%; white-space: nowrap">
                <gw:list id="lstLineGroup" styles='width:100%'  onchange="OnProcess('Line')" />
            </td>             
            <td style="width: 20%; white-space: nowrap">
                <gw:list id="lstLine" styles='width:100%'   onchange="OnSearch('DETAIL')" />
            </td>
			
			<td align="right" style="width: 5%; white-space: nowrap">
                Item
            </td>
            <td style="width: 20%; white-space: nowrap">
                <gw:list id="lstItemGroup" styles='width:100%'   onchange="OnSearch('DETAIL')" />
            </td>
			<td style="width: 15%; white-space: nowrap">
                <gw:textbox id="txtItem"   styles="width:100%;" onenterkey="OnSearch('DETAIL')"/>
            </td>	
					 
            <td align="right" style="width: 5%; white-space: nowrap">
                Date
            </td>
            <td style="width: 10%; white-space: nowrap">
                <gw:datebox id="dtFromDate" lang="1" styles="width:100%" onchange="OnSearch('date_header')" />
            </td>
 			<td style="width: 4%" align="center"> 
				<gw:imgbtn img="excel" alt="Report" onclick="OnPopUp('REPORT')" />
            </td>			
            <td style="width: 1%" align='right'>
                <gw:imgbtn id="btnSearch01" img="search" alt="Search W/I List" onclick="OnSearch('DETAIL')" />
            </td>           
        </tr>
        <tr style="height: 49%">
            <td colspan="10">
                <gw:grid id='grdDetail'
                    header='Item Code|Item Name|UOM|WI_15|RE_15|WI_14|RE_14|WI_13|RE_13|WI_12|RE_12|WI_11|RE_11|WI_10|RE_10|WI_09|RE_09|WI_08|RE_08|WI_07|RE_07|WI_06|RE_06|WI_05|RE_05|WI_04|RE_04|WI_03|RE_03|WI_02|RE_02|WI_01|RE_01|WI_00|RE_00'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    aligns='0|0|1|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
                    check='||||||||||||||||||||||||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='1500|2500|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800|800'
                    sorting='T'
                    styles='width:100%; height:100%'
                    />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:grid id='grdHeader' 
		header='COL15|COL14|COL13|COL12|COL11|COL10|COL09|COL08|COL07|COL06|COL05|COL04|COL03|COL02|COL01|COL00'
        format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'  editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
        widths='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' sorting='T' autosize='T'
        styles='width:100%; height:50%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
