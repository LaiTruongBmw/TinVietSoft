<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Process W/I List</title>
</head>

<script>

    var user_pk   = "<%=Session("EMPLOYEE_PK")%>" 
    var user_name = "<%=Session("USER_NAME")%>" 
    
    var flag = 0 ;
    
    var G1_ORDPLAN_PK	= 0,
		G1_NULL_01      = 1,         
        G1_PO_NO      	= 2, 
		G1_NULL_02		= 3, 
		G1_NULL_03		= 4,		 
        G1_STYLE_CODE   = 5,
        G1_STYLE_NAME   = 6,
		G1_WI_QTY       = 7; 
		
    var G2_LINE_PK		= 0,
		G2_LINE_ID      = 1,         
        G2_LINE_NAME    = 2, 
		G2_ORDPLAN_PK	= 3, 
		G2_WI_QTY		= 4,
		G2_DESCRIPTION	= 5; 		
		
    var G3_SPEC01_PK	= 0,
		G3_SPEC01_ID    = 1,         
        G3_SPEC02_PK	= 2,
		G3_SPEC02_ID    = 3,
		G3_SPEC03_PK	= 4,
		G3_SPEC03_ID    = 5,
		G3_SPEC04_PK	= 6,
		G3_SPEC04_ID    = 7,	
		G3_SPEC05_PK	= 8,
		G3_SPEC05_ID    = 9,
		G3_PLAN_QTY		= 10;
		
    var G4_LINE_PK		= 0,
		G4_ORDPLAN_PK   = 1,         
        G4_SPEC01_PK	= 2,
		G4_SPEC02_PK	= 3,
		G4_SPEC03_PK	= 4,		
		G4_SPEC04_PK	= 5,
		G4_SPEC05_PK	= 6,
		G4_WI_DATE      = 7,
		G4_WI_QTY		= 8;		
				
//================================================================

 function BodyInit()
 {     
    System.Translate(document);
      //----------------------------- 
      FormatGrid();
	  
	  OnSearch('POMASTER');           
 }
//================================================================

 function FormatGrid()
 { 
      var trl;   
      //-------------------------------------------------
      trl = grdWILine.GetGridControl();	
      trl.ColFormat(G2_WI_QTY) = "###,###,###,###,###";
	  
	  trl = grdOrdMaster.GetGridControl();
      trl.ColFormat(G1_WI_QTY) = "###,###,###,###,###";
      //-------------------------------------------------

      data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from prod.TPR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||ALL FACTORY";
      lstFactory.SetDataText( data);
      lstFactory.value = '' ;	
	      
      data = "<%=ESysLib.SetListDataSQL("SELECT   pk, GROUP_ID || ' - ' || group_name  FROM prod.pb_line_group WHERE del_if = 0 ORDER BY GROUP_ID ") %>||Select ALL" ;    
      lstLineGroup.SetDataText(data); 
      lstLineGroup.value = '' ;
      //-------------------------------------------------               
 }        
 
//=======================================================================
 function OnSearch(pos)
 {
 		switch (pos)
		{
			case 'POMASTER':
				data_fppw00014.Call("SELECT"); 
			break;
			
			case 'WILine':
				if ( grdOrdMaster.row > 0 ) 
				{
					txtOrdPlanPK.text = grdOrdMaster.GetGridData( grdOrdMaster.row, G1_ORDPLAN_PK);
					
					if ( grdOrdDetail.row > 0 )
					{
						txtSpec01PK.text = grdOrdDetail.GetGridData(grdOrdDetail.row,G3_SPEC01_PK);
						txtSpec02PK.text = grdOrdDetail.GetGridData(grdOrdDetail.row,G3_SPEC02_PK);
						txtSpec03PK.text = grdOrdDetail.GetGridData(grdOrdDetail.row,G3_SPEC03_PK);
						txtSpec04PK.text = grdOrdDetail.GetGridData(grdOrdDetail.row,G3_SPEC04_PK);
						txtSpec05PK.text = grdOrdDetail.GetGridData(grdOrdDetail.row,G3_SPEC05_PK);
					}
					else
					{
						txtSpec01PK.text = '';
						txtSpec02PK.text = '';
						txtSpec03PK.text = '';
						txtSpec04PK.text = '';
						txtSpec05PK.text = '';					
					}
				}
				else
				{
					txtOrdPlanPK.text = '';
				}
				
				data_fppw00014_1.Call("SELECT"); 
			break;
			
			case 'PODETAIL':
				data_fppw00014_2.Call("SELECT");
			break;
			
			case 'WIDetail':
				if ( grdWILine.row > 0 )
				{
					txtLinePK.text = grdWILine.GetGridData(grdWILine.row,G2_LINE_PK);
					
					if ( grdOrdDetail.row > 0 )
					{
						txtSpec01PK.text = grdOrdDetail.GetGridData(grdOrdDetail.row,G3_SPEC01_PK);
						txtSpec02PK.text = grdOrdDetail.GetGridData(grdOrdDetail.row,G3_SPEC02_PK);
						txtSpec03PK.text = grdOrdDetail.GetGridData(grdOrdDetail.row,G3_SPEC03_PK);
						txtSpec04PK.text = grdOrdDetail.GetGridData(grdOrdDetail.row,G3_SPEC04_PK);
						txtSpec05PK.text = grdOrdDetail.GetGridData(grdOrdDetail.row,G3_SPEC05_PK);
						
						data_fppw00014_4.Call("SELECT");
					}
				}
				else
				{
					alert("PLS SELECT ONE LINE.");
				}								
			break;			
		}
 }
//======================================================================
function OnSave(pos)
{
	switch(pos)
	{
		case 'WILine':
			data_fppw00014_1.Call();
		break;
		
		case 'WIDetail':
			data_fppw00014_4.Call();
		break;
	}      
}
 
//========================================================================
 function OnDataReceive(obj)
 { 
      switch (obj.id)         
      {		            			                                 
            case "data_fppw00014" :
	            if ( grdOrdMaster.rows > 1 )
	            {
	                grdOrdMaster.SetCellBgColor( 1, G1_PO_NO, grdOrdMaster.rows - 1, G1_PO_NO, 0xCCFFFF );
					
	                grdOrdMaster.SetCellBold( 1, G1_STYLE_CODE, grdOrdMaster.rows-1, G1_STYLE_CODE, true);
					grdOrdMaster.SetCellBold( 1, G1_WI_QTY,     grdOrdMaster.rows-1, G1_WI_QTY,     true);
	            }        
            break;   
			
            case "data_fppw00014_1" :
	            if ( grdWILine.rows > 1 )
	            {					
	                grdWILine.SetCellBold( 1, G2_LINE_ID, grdWILine.rows-1, G2_LINE_ID, true);
					grdWILine.SetCellBold( 1, G2_WI_QTY,  grdWILine.rows-1, G2_WI_QTY,  true);
	            }   				
            break; 
			
			case "data_fppw00014_2":
				OnSearch("WILine");
			break; 			          
      }  
 }
//==========================================================================

 function CheckInput(obj)
 { 
    var  row, col;
   
    switch (obj.id)
    {
        case 'grdWILine':
            row = event.row ;
            col = event.col ;    
            
            if ( col == G2_WI_QTY )
            {
                var dQuantiy;
                
                dQuantiy =  grdWILine.GetGridData(row,col)
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        grdWILine.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(0));
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdWILine.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdWILine.SetGridText(row,col,"")
                }                
            }         
        break;
    }        
 }
//=========================================================================
</script>

<body>
	<!------------------------------------------------------------------>
    <gw:data id="data_fppw00014" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="<%=l_user%>lg_sel_fppw00014"  > 
			    <input bind="grdOrdMaster" >
					<input bind="lstFactory" />
					<input bind="txtStylePO" />
			    </input> 
			    <output bind="grdOrdMaster" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppw00014_1" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5" function="<%=l_user%>lg_sel_fppw00014_1" procedure="<%=l_user%>lg_upd_fppw00014_1" > 
			    <input bind="grdOrdMaster" >
					<input bind="lstLineGroup" />
					<input bind="txtOrdPlanPK" />
			    </input> 
			    <output bind="grdWILine" /> 
		    </dso> 
	    </xml> 
    </gw:data>	
	<!------------------------------------------------------------------>
    <gw:data id="data_fppw00014_2" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="<%=l_user%>lg_sel_fppw00014_2"  > 
			    <input bind="grdOrdDetail" >
					<input bind="txtOrdPlanPK" />
			    </input> 
			    <output bind="grdOrdDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>		
    <!------------------------------------------------------------------>
    <gw:data id="data_fppw00014_4" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8" function="<%=l_user%>lg_sel_fppw00014_4" procedure="<%=l_user%>lg_upd_fppw00014_4"  > 
			    <input bind="grdWIDetail" >
					<input bind="txtLinePK" />
					<input bind="txtOrdPlanPK" />
					<input bind="txtSpec01PK" />
					<input bind="txtSpec02PK" />
					<input bind="txtSpec03PK" />
					<input bind="txtSpec04PK" />
					<input bind="txtSpec05PK" />
					<input bind="dtFromDate" />
			    </input> 
			    <output bind="grdWIDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>	
    <!------------------------------------------------------------------>
                            <table style="width: 100%; height: 100%">
								 <tr style="height: 1%">
										<td style="width: 5%; white-space: nowrap" align="right">
							       			Factory
										</td>
							   			<td style="width: 30%">
							       			<gw:list id="lstFactory" text="" styles="width:100%" onchange="OnSearch('POMASTER')" />
							   			</td>								
							            <td align="right" style="width: 5%; white-space: nowrap">
							                PO/Style</td>
							            <td style="width: 30%">
							                <gw:textbox id="txtStylePO" styles='width:100%' csstype="mandatory" onenterkey="OnSearch('POMASTER')" />
							            </td>
							            <td style="width: 29%; white-space: nowrap">
							            </td>
							            <td align="right" style="width: 1%">
							                <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('POMASTER')" />
							            </td>
								</tr>							
			 					<tr style="height: 49%">
			                        <td colspan=4>
			                            <gw:grid id='grdOrdMaster' header='_OrdPlanPK|_null|P/O No|_NULL|_NULL|Code|Name|W/I Qty'
						                    format='0|0|0|4|4|0|0|0' 
											aligns='0|0|0|1|1|0|0|3' 
											defaults='|||||||' 
											editcol='0|0|0|0|0|0|0|0'
						                    widths='0|0|2000|1200|1200|2000|4000|1000' 
											sorting='T' 
											styles='width:100%; height:100%'
						                    onclick="OnSearch('PODETAIL')" />
			                        </td>
									 <td colspan=2>
			                            <gw:grid id='grdOrdDetail' header='_Spec01_PK|Color|_Spec02_PK|_Spec02|_Spec03_PK|_Spec03|_Spec04_PK|_Spec04|_Spec05_PK|_Spec05|Plan Qty'
						                    format='0|0|0|0|0|0|0|0|0|0|0' 
											aligns='0|1|0|0|0|0|0|0|0|0|3' 
											defaults='||||||||||' 
											editcol='0|0|0|0|0|0|0|0|0|0|0'
						                    widths='0|2000|0|0|0|0|0|0|0|0|1200' 
											sorting='T' 
											styles='width:100%; height:100%'
						                    onclick="OnSearch('WIDetail')" />
			                        </td>
			                    </tr>	
                                <tr style="height: 1%">                                    
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Line Grp
									</td>
                                    <td style="width: 30%; white-space: nowrap">
                                        <gw:list id="lstLineGroup" styles='width:100%' csstype="mandatory" onchange="OnSearch('WILine')" />
                                    </td>
									<td style="width: 5%" align="right">   
										<gw:imgbtn img="save" alt="Save" id="btnSave" onclick="OnSave('WILine')" />                                     
                                    </td>                                    
                                    <td style="width: 30%" align='right'>                                        
                                    </td>
									<td style="width: 29%" align="right"> 
										<gw:datebox id="dtFromDate" lang="1" styles="width:100%" />               						 
            						</td>
            						<td align="right" style="width: 1%">	
										<gw:imgbtn img="save" alt="Save" id="btnSave01" onclick="OnSave('WIDetail')" />          																		           						 
            						</td>									
                                </tr>   
								<tr style="height: 49%">
			                        <td colspan=4>
			                            <gw:grid id='grdWILine' header='_LINE_PK|Line ID|Line Name|_ORDPLAN_PK|W/I Qty|Description'
						                    format='0|0|0|0|0|0' 
											aligns='0|0|0|0|3|0' 
											defaults='|||||' 
											editcol='0|0|0|0|1|1'
						                    widths='0|1500|1500|0|1200|1000' sorting='T' styles='width:100%; height:100%'
											onafteredit="CheckInput(this)" onclick="OnSearch('WIDetail')"
						                     />																																	  			 
			                        </td>
									<td colspan=2>
			                            <gw:grid id='grdWIDetail' 
											header='_LINE_PK|_ORDPLAN_PK|_SPEC01_PK|_SPEC02_PK|_SPEC03_PK|_SPEC04_PK|_SPEC05_PK|Date|W/I Qty'
						                    format='0|0|0|0|0|0|0|4|0' 
											aligns='0|0|0|0|0|0|0|1|3' 
											defaults='||||||||' 
											editcol='0|0|0|0|0|0|0|1|3'
						                    widths='0|0|0|0|0|0|0|1200|1200' 
											sorting='T' 
											styles='width:100%; height:100%'
						                    onclick="OnSearch()" />
			                        </td>
			                    </tr>																								                             
                            </table>           
	<!------------------------------------------------------------------> 	
	<gw:textbox id="txtOrdPlanPK" styles='width:100%;display:none' />
	<gw:textbox id="txtLinePK" styles='width:100%;display:none' />
	<gw:textbox id="txtSpec01PK" styles='width:100%;display:none' />
	<gw:textbox id="txtSpec02PK" styles='width:100%;display:none' />
	<gw:textbox id="txtSpec03PK" styles='width:100%;display:none' />
	<gw:textbox id="txtSpec04PK" styles='width:100%;display:none' />
	<gw:textbox id="txtSpec05PK" styles='width:100%;display:none' />
</body>

</html>
