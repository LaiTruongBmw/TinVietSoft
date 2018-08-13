<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Line Stock Transaction</title>
</head>

<script>    
         
var G1_LINE_ID  = 0,
    G1_WP_NAME  = 1,
    G1_P_CARD_ID= 2,
    G1_COMP_ID  = 3,
    G1_COMP_NAME= 4,
    G1_CARD_ID  = 5,
    G1_QTY      = 6,
    G1_SPEC_01  = 7,
    G1_SPEC_02  = 8,
    G1_SPEC_03  = 9,
    G1_SPEC_04  = 10,
    G1_SPEC_05  = 11,
    G1_REF_PO_NO= 12,
    G1_TR_DATE  = 13,
    G1_CHARGER_01= 14,
    G1_CHARGER_02= 15; 
    
//=====================================================================================
function BodyInit()
 {     
    System.Translate(document); 
      OnChangeTab();
      //----------------------
      OnFormatGrid();      
      //----------------------
      OnToggleGrid();
 }      
 
//=====================================================================================
 function OnFormatGrid()
 {
    var data ;

    data = "<%=ESysLib.SetListDataSQL("SELECT   pk, GROUP_ID || ' - ' || group_name  FROM tlg_pb_line_group WHERE del_if = 0 ORDER BY GROUP_ID ") %>||" ;    
    lstLineGroup.SetDataText(data); 
    lstLineGroup.value = '' ;                      
     
    var trl ;
    
    trl = grdMaster.GetGridControl();
    trl.ColFormat(G1_QTY)    = "###,###,###,###,###.##";
    
    grdMaster.GetGridControl().Cell( 7, 0, G1_TR_DATE, 0, G1_TR_DATE) = 0x3300cc;
    
    grdMaster.GetGridControl().MergeCells  = 2 ;	
    grdMaster.GetGridControl().MergeCol(0) = true ;	
    grdMaster.GetGridControl().MergeCol(1) = true ;   	
    grdMaster.GetGridControl().MergeCol(2) = true ;
    grdMaster.GetGridControl().MergeCol(3) = true ;
    grdMaster.GetGridControl().MergeCol(4) = true ;
 }

//=====================================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'Master' :
                data_fppr00070.Call("SELECT");
            break;             
      }  
 }

//=====================================================================================
 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {
            case "data_fppr00070" :
                //--------------------------------
                if ( grdMaster.rows > 1 )
                {
                    lblCount.text = grdMaster.rows-1 + ' (s)';
                    
                    grdMaster.SetCellBold( 1, G1_COMP_ID, grdMaster.rows - 1, G1_COMP_ID, true);
                    grdMaster.SetCellBold( 1, G1_QTY,     grdMaster.rows - 1, G1_QTY,   true);
                }                
                //--------------------------------                
            break;              
      }  
 }
 
//=====================================================================================
function OnToggleGrid()
{
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";

		grdMaster.GetGridControl().ColHidden(G1_SPEC_01) = true ;
		grdMaster.GetGridControl().ColHidden(G1_SPEC_02) = true ;
		grdMaster.GetGridControl().ColHidden(G1_SPEC_03) = true ;
		grdMaster.GetGridControl().ColHidden(G1_SPEC_04) = true ;
		grdMaster.GetGridControl().ColHidden(G1_SPEC_05) = true ;
		
        imgMaster.src = "../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";
		
    }
    else
    {
        imgMaster.status = "expand";

		grdMaster.GetGridControl().ColHidden(G1_SPEC_01) = false ;
		grdMaster.GetGridControl().ColHidden(G1_SPEC_02) = false ;
		grdMaster.GetGridControl().ColHidden(G1_SPEC_03) = false ;
		grdMaster.GetGridControl().ColHidden(G1_SPEC_04) = false ;
		grdMaster.GetGridControl().ColHidden(G1_SPEC_05) = false ;

        imgMaster.src = "../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}


//=====================================================================================

function OnProcess(pos)
{
    switch (pos)
    {
        case 'Line':
            pro_fppr00070.Call();
        break;        
    }        
}
//=========================================================================
function OnExcel()
{
     if ( grdMaster.row > 0 )
     {     
         var url =System.RootURL + "/reports/fp/pr/rpt_fppr00070_bkvina.aspx?work_process_pk=" + grdMaster.GetGridData( grdMaster.row, G1_WORK_PROCESS_PK ) + "&work_process_name="+ grdMaster.GetGridData( grdMaster.row, G1_WP_NAME ) +"&day="+ grdMaster.GetGridData( grdMaster.row, G1_PROD_DATE );
         System.OpenTargetPage(url);
     } 
}
//=========================================================================
 function OnChangeTab()
 {
 
    var strRad = radTrType.GetData();
             
	switch (strRad)
	{
		case '10':
		    rdResult.style.color       = "cc0000"; 
		    rdPrepare.style.color      = "";
		    rdLineMapping.style.color  = "";	    
        break;
        
        case '20':
		    rdResult.style.color       = ""; 
		    rdPrepare.style.color      = "cc0000";
		    rdLineMapping.style.color  = "";		    		    
        break;
        
        case '30':
		    rdResult.style.color       = ""; 
		    rdPrepare.style.color      = "";
		    rdLineMapping.style.color  = "cc0000";		    		    
        break;		
    } 
 }
 //=============================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fppr00070" > 
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
    <gw:data id="data_fppr00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="<%=l_user%>lg_sel_fppr00070" procedure="<%=l_user%>lg_upd_fppr00070" > 
                <input>
                    <input bind="radTrType" />
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />                      
                    <input bind="lstLineGroup" />
                    <input bind="lstLine" />  
                    <input bind="txtComp" />
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr id='top' style="height: 45%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            <img status="expand" id="imgMaster" alt="Show all column" src="../../../system/images/close_popup.gif"
                                style="cursor: hand" onclick="OnToggleGrid()" />
                        </td>
                        <td colspan="3" align="center">
                            <gw:radio id="radTrType" value="10" styles="width:100%" onchange="OnChangeTab()">                      
                                <span value="10" id="rdResult">Line Result</span>                       
                                <span value="20" id="rdPrepare">Preparation</span>
                                <span value="30" id="rdLineMapping">Line Mapping</span>    			                                
		                    </gw:radio>
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 25%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 9%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch('Master')" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Line Group
                        </td>
                        <td style="width: 25%" align="right">
                            <gw:list id="lstLineGroup" styles="width: 100%" onchange="OnProcess('Line')" />
                        </td>
                        <td style="width: 5%" align="right">
                            Line
                        </td>
                        <td style="width: 25%">
                            <gw:list id="lstLine" styles="width: 100%" onchange="OnSearch('Master')" />
                        </td>
                        <td style="width: 5%" align="right">
                            Comp/BC
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtComp" styles='width:100%' onenterkey="OnSearch('grdWIList')" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" colspan="2" align="center">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="15">
                            <gw:grid id='grdMaster' header='Line|W/Process|P Card ID|Comp ID|Comp Name|Card ID|Qty|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|P/O No|Tr Date|Charger 01|Charger 02'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|1|3|1|1|1|1|1|0|1|0|0'
                                check='|||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1500|2000|1500|1500|2500|1500|1200|1200|1200|1200|1200|1200|1500|1500|1200|1200'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
