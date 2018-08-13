<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Line Stock Checking</title>
</head>

<script> 

var G1_OrdPlan_PK	= 0,
    G1_Style_Code   = 1,
	G1_Style_PK		= 3,
    G1_PO_No        = 4;
var G2_PB_WORK_PROCESS_PK	= 0,
    G2_WP_ID				= 1,
    G2_WP_NAME				= 2,
    G2_PT_COMPONENT_PK		= 3,
    G2_COMPONENT_ID			= 4,
    G2_COMPONENT_NAME    	= 5,
    G2_SPEC01_PK			= 6,
    G2_SPEC01_ID			= 7,
    G2_SPEC02_PK			= 8,
    G2_SPEC02_ID			= 9,
    G2_SPEC03_PK			= 10, 
    G2_SPEC03_ID			= 11,
    G2_SPEC04_PK			= 12,
    G2_SPEC04_ID			= 13,
    G2_SPEC05_PK			= 14,
	G2_SPEC05_ID			= 15,
    G2_PLAN_QTY				= 16,
    G2_REQ_QTY				= 17,
    G2_READY_QTY			= 18,
    G2_PROD_QTY				= 19,
    G2_BAL_QTY				= 20,
    G2_PROD_QTY_01			= 21,
    G2_PROD_QTY_02			= 22,
    G2_PROD_QTY_03			= 23,
    G2_PROD_QTY_04			= 24,
    G2_PROD_QTY_05			= 25;
//===============================================================================================
function OnToggle()
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");
    var imgArrow  = document.all("imgClose");  
        
    if  ( imgArrow.status == "collapse" )
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/button/previous.gif";
    }
	else
    {
        left.style.display     = "none";
        right.style.display    = "";                              
                
        imgArrow.status = "collapse";  
        imgArrow.src = "../../../system/images/button/next.gif";                              
    }
}
//===============================================================================================
 function BodyInit()
 {  
    System.Translate(document);
 	  BindingDataList();
   
      OnFormatGrid();	 
	  
	  OnHiddenGrid();
	  
	  OnSearch('header');
	  
 } 
 
 //========================================================================
function BindingDataList()
{    
    var data="";    
	
    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from tlg_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||ALL FACTORY";
    lstFactory.SetDataText( data);
    lstFactory.value = '' ;	 	

    data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC0101') FROM DUAL")%>||"; 
    lstCompGroup.SetDataText(data);  
    lstCompGroup.value = '' ;
		
    data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC0341') FROM DUAL")%>|0|CUTTING||"; 
    lstWPType.SetDataText(data);  
    lstWPType.value = '' ;
    //-----------
    data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    lstLang.SetDataText(data);      
    lstLang.value = "<%=Session("SESSION_LANG")%>";	  
	//-----------
	data = "data|1|Comp Balance|2|Comp Balance Hourly";
	lstReport.SetDataText(data);
} 

//===============================================================================================
 function OnFormatGrid()
 {
      grdDetail.GetGridControl().MergeCells  = 2 ;	
      grdDetail.GetGridControl().MergeCol(0) = true ;	
      grdDetail.GetGridControl().MergeCol(1) = true ;  
      grdDetail.GetGridControl().MergeCol(2) = true ; 
      grdDetail.GetGridControl().MergeCol(3) = true ; 
      grdDetail.GetGridControl().MergeCol(4) = true ; 
      grdDetail.GetGridControl().MergeCol(5) = true ; 
      grdDetail.GetGridControl().MergeCol(6) = true ;
      grdDetail.GetGridControl().MergeCol(7) = true ;
      grdDetail.GetGridControl().MergeCol(8) = true ;
      grdDetail.GetGridControl().MergeCol(9) = true ;
      grdDetail.GetGridControl().MergeCol(10) = true ;
      grdDetail.GetGridControl().MergeCol(11) = true ;
      grdDetail.GetGridControl().MergeCol(12) = true ;	
      grdDetail.GetGridControl().MergeCol(13) = true ;	
	  grdDetail.GetGridControl().MergeCol(14) = true ; 
	  grdDetail.GetGridControl().MergeCol(15) = true ;  	  	  	  	  	  
	  
      var trl ;
    
	  trl = grdDetail.GetGridControl();
      trl.ColFormat(G2_PLAN_QTY) = "###,###,###,###,###";
      trl.ColFormat(G2_REQ_QTY)  = "###,###,###,###,###";
	  trl.ColFormat(G2_READY_QTY)= "###,###,###,###,###";
      trl.ColFormat(G2_PROD_QTY) = "###,###,###,###,###";	
      
      grdDetail.GetGridControl().Cell( 7, 0, G2_READY_QTY, 0, G2_READY_QTY ) = 0x3300cc;      			
 }
 
//===============================================================================================
 function OnDataReceive(po_oData)
 {
    switch (po_oData.id)
    {
            case 'data_fpgm00100_header':
            if(grdHeader.rows>1)
            {
                var col1=grdHeader.GetGridData(1,2);
                var dis_col1=grdHeader.GetGridData(1,3);
                var col2=grdHeader.GetGridData(1,4);
                var dis_col2=grdHeader.GetGridData(1,5);
                var col3=grdHeader.GetGridData(1,6);
                var dis_col3=grdHeader.GetGridData(1,7);
                var col4=grdHeader.GetGridData(1,8);
                var dis_col4=grdHeader.GetGridData(1,9);
                var col5=grdHeader.GetGridData(1,10);
                var dis_col5=grdHeader.GetGridData(1,11);
                if(dis_col1!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC01_ID,col1);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC01_ID) = false ;
                    
                }
                if (dis_col2!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC02_ID,col2);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC02_ID) = false ;
                    
                }
                if (dis_col3!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC03_ID,col3);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC03_ID) = false ;
                    
                }
                if (dis_col4!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC05_ID,col4);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC04_ID) = false ;
                    
                }
                if (dis_col5!=0)
                {
                    grdDetail.SetGridText(0,G2_SPEC05_ID,col5);
                    grdDetail.GetGridControl().ColHidden(G2_SPEC05_ID) = false ;                    
                }
            }				
			OnSearch('day');
        break;
		
		case 'data_fpgm00100_day':
		if(grdHeaderDay.rows>1)
            {
                var col1=grdHeaderDay.GetGridData(2,0);
                var col2=grdHeaderDay.GetGridData(2,1);
                var col3=grdHeaderDay.GetGridData(2,2);
                var col4=grdHeaderDay.GetGridData(2,3);
                var col5=grdHeaderDay.GetGridData(2,4);
                // day 01
                grdDetail.SetGridText(0,G2_PROD_QTY_01,col1);
                grdDetail.GetGridControl().ColHidden(G2_PROD_QTY_01) = false ;
                // day 02 
                grdDetail.SetGridText(0,G2_PROD_QTY_02,col2);
                grdDetail.GetGridControl().ColHidden(G2_PROD_QTY_02) = false ;
				// day 03
                grdDetail.SetGridText(0,G2_PROD_QTY_03,col3);
                grdDetail.GetGridControl().ColHidden(G2_PROD_QTY_03) = false ;
				// day 04
                grdDetail.SetGridText(0,G2_PROD_QTY_04,col4);
                grdDetail.GetGridControl().ColHidden(G2_PROD_QTY_04) = false ;
				// day 05
                grdDetail.SetGridText(0,G2_PROD_QTY_05,col5);
                grdDetail.GetGridControl().ColHidden(G2_PROD_QTY_05) = false ;
				//--------------------------------------------------------------
				OnSetHeader();				
            }				
		break;
		
 		case 'data_fpgm00100' :            
            if ( grdOrdPlan.rows > 1 )
            {
                grdOrdPlan.SetCellBgColor( 1, G1_Style_Code, grdOrdPlan.rows - 1, G1_Style_Code, 0xCCFFFF );
            }                   
        break;       
				
        case 'data_fpgm00100_1' :            
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBgColor( 1, G2_COMPONENT_ID,  grdDetail.rows - 1, G2_COMPONENT_NAME, 0xCCFFFF );
                grdDetail.SetCellBgColor( 1, G2_BAL_QTY,  grdDetail.rows - 1, G2_BAL_QTY, 0xCCFFFF );
                grdDetail.SetCellBgColor( 1, G2_REQ_QTY,  grdDetail.rows - 1, G2_REQ_QTY, 0xCCFFFF );
                
				grdDetail.GetGridControl().Cell( 7, 1, G2_READY_QTY, grdDetail.rows - 1, G2_READY_QTY ) = 0x3300cc;
				
                grdDetail.SetCellBold( 1, G2_COMPONENT_ID,   grdDetail.rows - 1, G2_COMPONENT_ID,   true);
				grdDetail.SetCellBold( 1, G2_PROD_QTY, grdDetail.rows - 1, G2_PROD_QTY, true);				
                grdDetail.SetCellBold( 1, G2_PLAN_QTY,  grdDetail.rows - 1, G2_BAL_QTY,   true);

                grdDetail.Subtotal( 0, 2, -1, '16!17!18!19','###,###,###');		
				OnSearch('day');
            }                   
        break;             
    }
 }
//=========================================================================
function OnSetHeader()
{
				for(var i = 0; i < 5; i++)
				{
					if(grdHeaderDay.GetGridData(1,i) == 'SUNDAY   ') // Bat buoc phai co khoang trong phia sau cua chu SUNDAY
					{
						grdDetail.GetGridControl().Cell( 7, 0, i+21, 0, i+21 ) = 0x3300cc;
					}
					else
					{
						grdDetail.GetGridControl().Cell( 7, 0, i+21, 0, i+21 ) = 0x550000;
					}
				}
} 
//=========================================================================
function OnHiddenGrid()
{
    grdDetail.GetGridControl().ColHidden(G2_SPEC01_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC02_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC03_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC04_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC05_ID) = true ;
}
 
//===============================================================================================
 function OnSearch(pos)
 {
        switch(pos)
        {
			case 'header':
				data_fpgm00100_header.Call('SELECT');
			break;
			
            case 'OrdPlan':
                data_fpgm00100.Call('SELECT');
            break;
            
            case 'Detail':
                data_fpgm00100_1.Call("SELECT");
            break;

			case 'day':
				data_fpgm00100_day.Call('SELECT');
			break;
        }        
 }
//==========================================================================
function OnPreviousDate()
{
    dtDate.SetDataText(System.AddDate(dtDate.GetData(),-1));
	OnSearch('Detail');
}
//==========================================================================
function OnNextDate()
{
    dtDate.SetDataText(System.AddDate(dtDate.GetData(),+1));
	OnSearch('Detail');
}
//========================================================================
function OnPopUp(pos)
{
    switch(pos)
    {		
   		case 'Detail':
               if ( ( grdDetail.row > 0 ) && ( grdDetail.col == G2_READY_QTY	 ) )
               {
					var path = System.RootURL + '/form/fp/gm/fpgm00101.aspx?ordplan_pk=' + txtOrdPlanPK.text + '&style_pk=' + txtStylePK.text + '&component_pk=' + grdDetail.GetGridData( grdDetail.row, G2_PT_COMPONENT_PK);
                   	var obj = System.OpenModal( path ,870 , 550 ,  'resizable:yes;status:yes');					
               }           
        break;        		     
    }
} 
//===============================================================================================
function OnGridCellClick(obj)
{
    switch (obj.id)
    {
        case 'grdOrdPlan':
            if ( grdOrdPlan.row > 0 )
            {   
				grdOrdPlan.SetCellBold( 1, G1_Style_Code, grdOrdPlan.rows-1, G1_PO_No, false);
			 
				grdOrdPlan.SetCellBold( grdOrdPlan.row, G1_Style_Code, grdOrdPlan.row, G1_Style_Code, true);
				grdOrdPlan.SetCellBold( grdOrdPlan.row, G1_PO_No,      grdOrdPlan.row, G1_PO_No,      true);
				
				lblStylePO.text = grdOrdPlan.GetGridData( grdOrdPlan.row, G1_Style_Code ) + ' / ' + grdOrdPlan.GetGridData( grdOrdPlan.row, G1_PO_No );
				            
				txtOrdPlanPK.text = grdOrdPlan.GetGridData( grdOrdPlan.row, G1_OrdPlan_PK );
				txtStylePK.text   = grdOrdPlan.GetGridData( grdOrdPlan.row, G1_Style_PK   );
				
                OnSearch('Detail');
            }    
        break;
    }
} 
 
//===================================================================================
function OnReport()
{
	if(lstReport.value == 1)
	{
			if(grdDetail.row > 0 && txtOrdPlanPK.text != '')
			{
				 var url =System.RootURL + "/reports/fp/gm/rpt_fpgm00100.aspx?p_pp_ordplan_pk="+txtOrdPlanPK.text+ "&p_style=" + grdOrdPlan.GetGridData( grdOrdPlan.row, 3 ) +"&p_wp_type="+ lstWPType.value + "&p_spec01_pk="+ grdDetail.GetGridData( grdDetail.row, G2_SPEC01_PK )+ "&p_spec02_pk=" + grdDetail.GetGridData( grdDetail.row, G2_SPEC02_PK )+ "&p_spec03_pk="+grdDetail.GetGridData( grdDetail.row, G2_SPEC03_PK )+"&p_spec04_pk="+grdDetail.GetGridData( grdDetail.row, G2_SPEC04_PK ) + "&p_spec05_pk=" +grdDetail.GetGridData( grdDetail.row, G2_SPEC05_PK ) + "&p_date="+ dtDate.value + "&p_lang=" + lstLang.value; 
				 System.OpenTargetPage(url); 
			}
	}
	else if(lstReport.value == 2)
	{
			if(grdDetail.row > 0 && txtOrdPlanPK.text != '')
			{
				 var url =System.RootURL + "/reports/fp/gm/rpt_fpgm00101.aspx?p_pp_ordplan_pk="+txtOrdPlanPK.text+ "&p_style=" + grdOrdPlan.GetGridData( grdOrdPlan.row, 3 ) +"&p_wp_type="+ lstWPType.value + "&p_spec01_pk="+ grdDetail.GetGridData( grdDetail.row, G2_SPEC01_PK )+ "&p_spec02_pk=" + grdDetail.GetGridData( grdDetail.row, G2_SPEC02_PK )+ "&p_spec03_pk="+grdDetail.GetGridData( grdDetail.row, G2_SPEC03_PK )+"&p_spec04_pk="+grdDetail.GetGridData( grdDetail.row, G2_SPEC04_PK ) + "&p_spec05_pk=" +grdDetail.GetGridData( grdDetail.row, G2_SPEC05_PK ) + "&p_date="+ dtDate.value + "&p_lang=" + lstLang.value; 
				 System.OpenTargetPage(url); 
			}
	}
}

//===================================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpgm00100_day" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" parameter="0" function="<%=l_user%>lg_sel_fpgm00100_day "> 
                <input> 
					<input bind="dtDate" />
                </input> 
                <output bind="grdHeaderDay" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpgm00100_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpgm00100_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="data_fpgm00100" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid" user="prod" parameter='0,3,6' function="<%=l_user%>lg_sel_fpgm00100" >
                <input >
					<input bind="lstFactory" />
                    <input bind="txtPOStyle" />
                </input> 
                <output bind="grdOrdPlan" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="data_fpgm00100_1" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso type="grid" user="prod"   function="<%=l_user%>lg_sel_fpgm00100_1"   >
                <input >
                    <input bind="txtOrdPlanPK" />
                    <input bind="txtStylePK" />					 
                    <input bind="lstWPType" />	
					<input bind="lstCompGroup" />
					<input bind="txtComponent" />
					<input bind="txtSpec" />
					<input bind="dtDate" />
					<input bind="lstLang" />
					<input bind="radSearchType" />
					<input bind="chkDetail" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>	 
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 35%" id="t-left">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
					
					    <td align="right" style="width: 5%; white-space: nowrap">
                            Fac
                        </td>
                        <td style="width: 45%">
                            <gw:list id="lstFactory" text="" styles="width:100%" onchange="OnSearch('OrdPlan')" />
                        </td>
						
                        <td align="right" style="width: 5%; white-space: nowrap">
                            P/O Style
                        </td>
                        <td style="width: 45%">
                            <gw:textbox id="txtPOStyle" styles="width:100%" onenterkey="OnSearch('OrdPlan')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch2" img="search" alt="Search" onclick="OnSearch('OrdPlan')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="6">
                            <gw:grid id='grdOrdPlan' header='_PK|Style Code|Style Name|_Style_PK|P/O No' 
							    format='0|0|0|0|0'
                                aligns='0|0|0|0|0' 
								defaults='||||' 
								editcol='0|0|0|0|0' 
                                widths='0|1500|2500|0|1000'
                                sorting='T' styles='width:100%; height:100%' onclick="OnGridCellClick(this)" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 65%" id="t-right">
                <table style="width: 100%; height: 100%" border="0">
				      <tr style="height: 1%">
                        <td style="width: 5%">
                            <img status="expand" id="imgClose" src="../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td colspan=3>
							<gw:label id="lblStylePO" styles='width:100%;color:cc0000;font:9pt' />
						</td>  	
						<td>
							Report
						</td>
						<td>
							<gw:list id="lstReport" styles='width:100%'/>
						</td>
						<td style="width: 10%;white-space:nowrap; background-color: CCFFFF" colspan="3" align="center">
							<gw:radio id="radSearchType" value="1" styles="width:100%" onchange="OnSearch('Detail')"> 
							     <span value="1" id="Min">Min</span> 
							     <span value="2" id="Max">Max</span> 
							 </gw:radio>				
							 <gw:checkbox id="chkDetail" defaultvalue="Y|N" value="N" onchange="OnSearch('Detail')">Detail</gw:checkbox>
						</td>	
						<td>
							<gw:list id="lstLang" styles='width:100%' onchange="OnSearch('Detail')" />
						</td>
						<td style="width: 1%">
							<gw:imgbtn id="btnReport" styles='width:100%' img="excel" alt="" onclick="OnReport()" />
						</td>
			            <td style="width: 1%" align="right">	
							<gw:imgbtn id="ibtnSearch1" img="search" styles="width:100%;" alt="Search" onclick="OnSearch('Detail')" />	
            			</td>										                                             
                    </tr>         
					
                    <tr style="height: 1%"> 
                        <td style="width: 5%; white-space: nowrap" align="right" >  
							W/P Type                           
                        </td>					                      
                        <td style="width: 30%; white-space: nowrap" align="center">  
							<gw:list id="lstWPType" styles="width:100%;" onchange="OnSearch('Detail')" />             			 
           				</td>		
						<td style="width: 5%" align="right" >
							Group
						</td>
						<td style="width: 30%; white-space: nowrap" align="center">
							<gw:list id="lstCompGroup" styles="width:100%;" onchange="OnSearch('Detail')" /> 
						</td>						
						<td align="right" style="width: 5%">
                            Comp
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtComponent" styles="width:100%" onenterkey="OnSearch('Detail')" />
                        </td>  					
						<td align="right" style="width: 5%">
                            Spec
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtSpec" styles="width:100%" onenterkey="OnSearch('Detail')" />
                        </td>  
						<td style="width: 1%" align="right">
									<img status="expand" id="imgArrow" src="../../../system/images/button/icons_button/back.gif"
										style="cursor: hand" onclick="OnPreviousDate()" />
						</td>
						<td style="width: 5%; white-space: nowrap" align="center" colspan="2">
									<gw:datebox id="dtDate" lang="1" styles='width:100%;' onchange="OnSearch('Calendar')" />
						</td>
						<td style="width: 1%" align="left">
									<img status="expand" id="imgArrow1" src="../../../system/images/button/icons_button/next.gif"
										style="cursor: hand" onclick="OnNextDate()" />
						</td>

						                    </tr>                    
                    <tr style="height: 98%">
                        <td colspan="12">
						<gw:grid id='grdDetail'
						header='_Pb_work_process_pk|WP ID|WP Name|_Pt_component_pk|Comp ID|Comp Name|_spec01_pk|Spec 01|_spec02_pk|Spec 02|_spec03_pk|Spec 03|_spec04_pk|Spec 04|_spec05_pk|Spec 05|Plan Qty|Req Qty|Ready Qty|Prod Qty|Bal Qty|Pro d Qty_01|Prod Qty_02|Prod Qty_03|Prod Qty_04|Prod Qty_05'
						format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
						aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3'
						check='|||||||||||||||||||||||||'
						editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
						widths='0|1000|2000|0|1000|2000|0|1000|0|1000|0|1000|0|1000|0|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
						sorting='T'
						styles='width:100%; height:100%'  oncelldblclick="OnPopUp('Detail')" 
						/>                           
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
	<gw:textbox id="txtOrdPlanPK" style="display: none" />
	<gw:textbox id="txtStylePK" style="display: none" />
	<!------------------------------------------------------------------>
	<gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%;display:none' /> 

	<gw:grid id='grdHeaderDay'
	header='DAY01|DAY02|DAY03|DAY04|DAY05'
	format='0|0|0|0|0'
	aligns='0|0|0|0|0'
	check='||||'
	editcol='1|1|1|1|1'
	widths='1000|1000|1000|1000|1000'
	sorting='T'
	autosize='T' 
	styles='width:100%; height:100%;display:none'
	/>
</body>
</html>
