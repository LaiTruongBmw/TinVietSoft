<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>R/G PLAN ENTRY</title>
</head>

<script>
var G_RG_PLAN_PK	= 0,
	G_FAC_PK		= 1,
	G_RG_ID			= 2,
	G_ORDPLAND_PK	= 3,	 
	G_FROM_DT		= 4,
	G_TO_DT			= 5,
	G_RG_PLAN_QTY	= 6;
	
var G1_PK               = 0, 
    G1_PROCESS_PK       = 1,
    G1_ORDPLAND_PK      = 2,
    G1_SEQ              = 3,
    G1_PROCESS_ID       = 4,
    G1_PROCESS_NAME     = 5,
    G1_PLAN_QTY         = 6,
    G1_FROM_DT          = 7,
    G1_TO_DT            = 8,
    G1_DESCRIPTION      = 9;
	
var G3_DELI_PLAN_PK     = 0,     
    G3_ORDPLAND_PK      = 1,
    G3_SEQ              = 2,
    G3_FROM_DT          = 3,
    G3_TO_DT            = 4,
	G3_RATE				= 5,
    G3_PLAN_QTY         = 6,    
    G3_DESCRIPTION      = 7;	
    
var arr_FormatNum_RG = new Array();  
var arr_FormatNum_DL = new Array(); 
   
var p_ord_plan_d_pk ;
//============================================================================================
    function BodyInit()
    {   
        System.Translate(document);
		var callerWindowObj = dialogArguments;    
		
		txtOrdPlanDPK.text = callerWindowObj.grdOrdPlan.GetGridData( callerWindowObj.grdOrdPlan.row, callerWindowObj.G2_DETAIL_PK );
		 
		txtOrdPlanQty.text = callerWindowObj.grdOrdPlan.GetGridData( callerWindowObj.grdOrdPlan.row, callerWindowObj.G2_PLAN_QTY  );       
        
		lblPONo.text  = callerWindowObj.grdOrdPlan.GetGridData( callerWindowObj.grdOrdPlan.row, callerWindowObj.G2_PO_NO ); 
		lblStyle.text = callerWindowObj.grdOrdPlan.GetGridData( callerWindowObj.grdOrdPlan.row, callerWindowObj.G2_STYLE_CODE ) + ' / ' + callerWindowObj.grdOrdPlan.GetGridData( callerWindowObj.grdOrdPlan.row, callerWindowObj.G2_STYLE_NAME );
		lblSpec.text  = callerWindowObj.grdOrdPlan.GetGridData( callerWindowObj.grdOrdPlan.row, callerWindowObj.G2_SPEC01_NM ) + ' / ' + callerWindowObj.grdOrdPlan.GetGridData( callerWindowObj.grdOrdPlan.row, callerWindowObj.G2_SPEC02_NM ) + ' / ' + callerWindowObj.grdOrdPlan.GetGridData( callerWindowObj.grdOrdPlan.row, callerWindowObj.G2_SPEC03_NM ) + ' / ' + callerWindowObj.grdOrdPlan.GetGridData( callerWindowObj.grdOrdPlan.row, callerWindowObj.G2_SPEC04_NM ) + ' / ' + callerWindowObj.grdOrdPlan.GetGridData( callerWindowObj.grdOrdPlan.row, callerWindowObj.G2_SPEC05_NM );
		//------------------------------------------------------------
        FormatGrid();
		 
	    OnSearch('1');
    } 
//============================================================================================
    function OnSearch(pos)
    {    
		switch (pos)
		{
			case '1' :
				data_fpip00106.Call('SELECT');
			break;
			
			case '4' :
				data_fpip00106_3.Call('SELECT');
			break; 
		}        
    }
//============================================================================================
    function FormatGrid()
    {	
	 	var data="";	
			 
    	data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from TLG_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||ALL FACTORY";
    	lstFactory.SetDataText( data);
    	lstFactory.value = '' ;	 				
		//------------------------------ 	
		
		grdRoutingGroup.GetGridControl().ColFormat(G_RG_PLAN_QTY) = "###,###,###,###.##"; 
		grdDeliPlan.GetGridControl().ColFormat(G3_PLAN_QTY)       = "###,###,###,###";   
		
		arr_FormatNum_RG[G_RG_PLAN_QTY] = 2;  
		arr_FormatNum_DL[G3_PLAN_QTY]   = 0;     
    }
//============================================================================================
    function OnSave(para)
    {
		switch(para)
		{
			case '1' :
				data_fpip00106.Call();
			break;
			
			case '2' :
				data_fpip00106_1.Call();
			break;
			
			case '3' :				 
            	data_fpip00106_2.Call();			
			break;
			
			case '4' :
				data_fpip00106_3.Call();	
			break; 
		}	        
    }
//============================================================================================
function OnDelete(para)
{
	switch(para)
	{
		case 1 :
			if ( grdRoutingGroup.row > 0 )
	        {
	            if ( grdRoutingGroup.GetGridData( grdRoutingGroup.row, G_RG_PLAN_PK) == '' ) 
	            {
		            grdRoutingGroup.RemoveRowAt( grdRoutingGroup.row ); 			
		        }
		        else			
		        {
		            grdRoutingGroup.DeleteRow();
		        }
		    }  			
		break;
		
	    case 2 :
			if ( grdProcess.row > 0 )
	        {
	            if ( grdProcess.GetGridData( grdProcess.row, G1_PK ) == '' ) 
	            {
		            grdProcess.RemoveRowAt( grdProcess.row ); 			
		        }
		        else			
		        {
		            grdProcess.DeleteRow();
		        }
		    } 			
		break;
		
		case '4':
			if ( grdDeliPlan.row > 0 )
	        {
	            if ( grdDeliPlan.GetGridData( grdDeliPlan.row, G3_DELI_PLAN_PK ) == '' ) 
	            {
		            grdDeliPlan.RemoveRowAt( grdDeliPlan.row ); 			
		        }
		        else			
		        {
		            grdDeliPlan.DeleteRow();
		        }
		    } 			
		break;				             
	}
}
//=======================================================================
function OnUnDelete(para)
{    
    if(para == 1)
    {
        grdRoutingGroup.UnDeleteRow();
    }
    if(para == 2)
    {
        grdProcess.UnDeleteRow();
    }
	if(para == 4)
    {
        grdDeliPlan.UnDeleteRow();
    }
}
//=======================================================================
function OnDataReceive(para)
{
	switch(para.id)
	{
		case "data_fpip00106" :
			if ( grdRoutingGroup.rows > 1)
	        {
	            grdRoutingGroup.SetCellBold( 1, G_RG_PLAN_QTY, grdRoutingGroup.rows-1, G_RG_PLAN_QTY, true);
			    grdRoutingGroup.SetCellBold( 1, G_RG_ID,       grdRoutingGroup.rows-1, G_RG_ID,       true);
	    		 
			    var rg_plan_qty = 0 ;
			    for ( var i = 1; i < grdRoutingGroup.rows; i++ )
			    {
				    rg_plan_qty = rg_plan_qty + Number( grdRoutingGroup.GetGridData( i, G_RG_PLAN_QTY) );
			    }
	    				
			    txtRGPlanQty.text  = rg_plan_qty;
			    txtRemainQty.text  = Number(txtOrdPlanQty.text) - Number(txtRGPlanQty.text);
	        }
		    else
		    {		 
			    txtRGPlanQty.text  = '';
			    txtRemainQty.text  = '';
		    }
			
		    data_fpip00106_1.Call('SELECT');		
		break;
	    
		case "data_fpip00106_1" :
			if ( grdProcess.rows > 1)
	        {		
				grdProcess.SetCellBold( 1, G1_PROCESS_ID, grdProcess.rows - 1, G1_PROCESS_ID, true);  
            	grdProcess.SetCellBold( 1, G1_PLAN_QTY,   grdProcess.rows - 1, G1_PLAN_QTY,   true);
			}	
			
			data_fpip00106_2.Call('SELECT');  			
		break;
			 
	    case "data_fpip00106_2" :
			data_fpip00106_3.Call('SELECT');  
		break;
		
		case "data_fpip00106_3" :
		break;
	}
}
//=======================================================================
function OnAddNew(para)
{
    switch (para)
	{
		case '1':
			if ( grdRoutingGroup.row > 0 )
		    {
			    var i = grdRoutingGroup.row;
			    grdRoutingGroup.AddRow();
	    		
			    grdRoutingGroup.SetGridText( grdRoutingGroup.rows-1, G_FAC_PK, grdRoutingGroup.GetGridData( i, G_FAC_PK ) );
			    grdRoutingGroup.SetGridText( grdRoutingGroup.rows-1, G_RG_ID,  grdRoutingGroup.GetGridData( i, G_RG_ID  ) );		
	    		
			    grdRoutingGroup.SetGridText( grdRoutingGroup.rows-1, G_ORDPLAND_PK, txtOrdPlanDPK.text );
		    }
		    else
		    {
			    alert("Pls select one routing group.")
		    }			
		break;
	 
        case '2' :
			if(grdProcess.row > 0)
	        {
			    var i = grdProcess.row;
			    grdProcess.AddRow();
	    		
				grdProcess.SetGridText( grdProcess.rows-1, G1_ORDPLAND_PK, grdProcess.GetGridData( i, G1_ORDPLAND_PK ));	
				grdProcess.SetGridText( grdProcess.rows-1, G1_PROCESS_PK,  grdProcess.GetGridData( i, G1_PROCESS_ID     ));
			    grdProcess.SetGridText( grdProcess.rows-1, G1_PROCESS_ID,     grdProcess.GetGridData( i, G1_PROCESS_ID     ));		
			    grdProcess.SetGridText( grdProcess.rows-1, G1_PROCESS_NAME,   grdProcess.GetGridData( i, G1_PROCESS_NAME   ));		 
			    	 
			}		
		break;
		
		case '4' :
				grdDeliPlan.AddRow();	    		
				grdDeliPlan.SetGridText( grdDeliPlan.rows-1, G3_ORDPLAND_PK, txtOrdPlanDPK.text );	
		break; 				
    }
}
//=======================================================================

 function CheckInput(obj)
 {   
 	switch(obj.id)
	{
		case 'grdRoutingGroup':
		
	    	var  row, col 
	        
	    	row = event.row ;
	    	col = event.col ;    
	    
	    	if ( col == G_RG_PLAN_QTY )
	    	{
	        	var dQuantiy;
	        
	        	dQuantiy =  grdRoutingGroup.GetGridData(row,col)
	        
	        	if (Number(dQuantiy))
	        	{   
	            	if (dQuantiy >0)
	            	{
	                	grdRoutingGroup.SetGridText( row, col, System.Round(dQuantiy+"",arr_FormatNum_RG[col]));
	           		}
	            	else
	            	{
	                	alert(" Value must greater than zero !!");
	                	grdRoutingGroup.SetGridText(row,col,"")
	            	}
	       	 	}
	        	else
	        	{
	            	grdRoutingGroup.SetGridText(row,col,"")
	        	}                 
	    	} 
		break;
		
		case 'grdDeliPlan' :
	    	var  row, col 
	        
	    	row = event.row ;
	    	col = event.col ;    
	    
	    	if ( col == G3_PLAN_QTY )
	    	{
	        	var dQuantiy;
	        
	        	dQuantiy =  grdDeliPlan.GetGridData(row,col)
	        
	        	if (Number(dQuantiy))
	        	{   
	            	if (dQuantiy >0)
	            	{
	                	grdDeliPlan.SetGridText( row, col, System.Round(dQuantiy+"",arr_FormatNum_RG[col]));
	           		}
	            	else
	            	{
	                	alert(" Value must greater than zero !!");
	                	grdDeliPlan.SetGridText(row,col,"")
	            	}
	       	 	}
	        	else
	        	{
	            	grdDeliPlan.SetGridText(row,col,"")
	        	}                 
	    	} 			
		break;	
	}	

 }
 //====================================================================== 
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpip00106" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id = "1" type = "grid" parameter ="0,1,2,3,4,5,6" function = "<%=l_user%>lg_sel_fpip00106" procedure="<%=l_user%>lg_upd_fpip00106" > 
                    <input >
                        <input bind="lstFactory" /> 
					    <input bind="txtOrdPlanDPK" />                    
                    </input> 
                     <output bind="grdRoutingGroup" />                      
                </dso> 
            </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpip00106_1" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id = "1" type = "grid" parameter ="0,1,2,3,4,5,6,7,8,9,10" function = "<%=l_user%>lg_sel_fpip00106_1" procedure="<%=l_user%>lg_upd_fpip00106_1" > 
                    <input >
					    <input bind="txtOrdPlanDPK" />                    
                    </input> 
                     <output bind="grdProcess" />                      
                </dso> 
            </xml> 
    </gw:data>
	 <!------------------------------------------------------------------>
    <gw:data id="data_fpip00106_3" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id = "1" type = "grid" parameter ="0,1,2,3,4,5,6,7" function = "<%=l_user%>lg_sel_fpip00106_3" procedure="<%=l_user%>lg_upd_fpip00106_3" > 
                    <input >
					    <input bind="txtOrdPlanDPK" />                    
                    </input> 
                     <output bind="grdDeliPlan" />                      
                </dso> 
            </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpip00106_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="<%=l_user%>lg_sel_fpip00106_2" procedure="<%=l_user%>lg_upd_fpip00106_2">
                <input>
                    <inout bind="txtOrdPlanDPK" />
                    <inout bind="txtPile" />
                    <inout bind="txtReed" />
                    <inout bind="txtDensity" />                    
                    <inout bind="txtDensity2" />                                                                                                                
					<inout bind="txtPileLength" />                                                                                                                
					<inout bind="txtNoPileLength" />                                                                                                                
					<inout bind="txtMC" />    
					<inout bind="txtReduceLength" /> 
					<inout bind="txtLabel" />
					<inout bind="txtType" />
					<inout bind="txtStick" />
					<inout bind="txtRemark" />                                                                                                                  
                </input>
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%" id="tab_bottom">
            <td style="width: 5%; white-space: nowrap" align="right">
                P/O No
            </td>
            <td style="width: 30%; white-space: nowrap">
                <gw:label id="lblPONo" styles='width:100%;color:cc0000;font:9pt' text='' />
            </td>
            <td align="right" style="width: 5%; white-space: nowrap">
                Style
            </td>
            <td style="width: 15%" colspan="3">
                <gw:label id="lblStyle" styles='width:100%;color:cc0000;font:9pt' text='' />
            </td>
            <td align="right" style="width: 5%; white-space: nowrap">
                Spec
            </td>
            <td style="width: 15%" colspan="8">
                <gw:label id="lblSpec" styles='width:100%;color:cc0000;font:9pt' text='' />
            </td>
        </tr>
        <tr>
            <td colspan="15">
                <hr noshade size="1" style="color: Silver" />
            </td>
        </tr>  
		<tr height="1%">
			<td colspan=3 align=left style="color: purple" >*** Basic Info *** </td>
            <td colspan="10" align="right">
                <gw:imgbtn img="save" alt="Save" id="btnSave3" onclick="OnSave('3')" />
            </td>
        </tr>             
        <tr style="height: 5%; width: 100%">
            <td colspan="15">
                <table style="height: 100%; width: 100%" border="0">
                    <tr>
                        <td style="width: 5%">
                            Pile
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtPile" styles='width:100%' />
                        </td>
                        <td style="width: 5%">
                            Reed
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtReed" styles='width:100%' />
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            Pile Length
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtPileLength" styles='width:100%' />
                        </td>
                    </tr>
                    <tr>
                        <td style="white-space: nowrap">
                            Density(weft)
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtDensity" styles='width:49%' />
                            <gw:textbox id="txtDensity2" styles='width:50%' />
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            No Pile Length
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtNoPileLength" styles='width:100%' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Label
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtLabel" styles='width:100%' />
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            Reduce Length
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtReduceLength" styles='width:100%' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Stick
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtStick" styles='width:100%' />
                        </td>
                        <td>
                            Type
                        </td>
                        <td>
                            <gw:textbox id="txtType" styles='width:100%' />
                        </td>
                        <td style="width: 5%">
                            MC
                        </td>
                        <td>
                            <gw:textbox id="txtMC" styles='width:100%' />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Remark
                        </td>
                        <td colspan="7">
                            <gw:textbox id="txtRemark" styles='width:100%' />
                        </td>
                    </tr>															
                </table>
            </td>
        </tr>
		<tr>
            <td colspan="15">
                <hr noshade size="1" style="color: Silver" />
            </td>
        </tr>       
        <tr style="height: 1%" id="Tr1">            
            <td colspan=3 align=left style="color: purple" >*** Process *** </td>
            <td style="width: 15%">
            </td>
            <td align="right" style="width: 5%; white-space: nowrap">
            </td>
            <td style="width: 15%">
            </td>
            <td align="right" style="width: 5%; white-space: nowrap">
            </td>
            <td style="width: 15%">
            </td>
            <td style="width: 1%; white-space: nowrap" align="center">
            </td>
            <td style="width: 1%" align='right'>
                <gw:imgbtn id="btnAddNew2" img="new" onclick="OnAddNew('2')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="delete" alt="Delete" id="btnDelete2" onclick="OnDelete('2')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="udelete" alt="UnDelete" id="btnUnDelete2" onclick="OnUnDelete('2')" />
            </td>
            <td style="width: 1%" align='right'>
                <gw:imgbtn img="save" alt="Save" id="btnSave2" onclick="OnSave('2')" />
            </td>
        </tr>
        <tr style="height: 40%">
            <td colspan="20">
                <gw:grid id='grdProcess' header='_pk|_pb_process_pk|_pp_ordpland_pk|Seq|Process ID|Process Name|Plan Qty|From Date|To Date|Description'
                    format='0|0|0|0|0|0|1|4|4|0' aligns='0|0|0|1|0|0|0|1|1|0' check='|||||||||' editcol='1|1|1|1|0|0|1|1|1|1'
                    widths='0|0|0|600|1500|2500|1000|1200|1200|1000' sorting='T' styles='width:100%; height:150'
                    acceptnulldate />
            </td>
        </tr>	
		<tr>
            <td colspan="15">
                <hr noshade size="1" style="color: Silver" />
            </td>
        </tr>    
		 <tr style="height: 1%" id="tab_bottom">
            <td colspan=3 align=left style="color: purple" >*** Deli Plan *** </td>
            <td style="width: 15%">                 
            </td>
            <td align="right" style="width: 5%; white-space: nowrap">                 
            </td>
            <td style="width: 15%">               
            </td>
            <td align="right" style="width: 5%; white-space: nowrap">               
            </td>
            <td style="width: 15%">                 
            </td>
            <td style="width: 1%; white-space: nowrap" align="center">
                <gw:imgbtn id="btnSearch" img="search" onclick="OnSearch('4')" />
            </td>
            <td style="width: 1%" align='right'>
                <gw:imgbtn id="btnAddNew" img="new" onclick="OnAddNew('4')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete('4')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="udelete" alt="UnDelete" id="btnUnDelete" onclick="OnUnDelete('4')" />
            </td>
            <td style="width: 1%" align='right'>
                <gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave('4')" />
            </td>
        </tr>
        <tr style="height: 40%;">
            <td colspan="20">
                <gw:grid id='grdDeliPlan' header='_PK|_pp_ordpland_pk|Seq|From|To|Rate|Plan Qty|Remark'
                    format='0|0|0|4|4|0|0|0' aligns='0|0|0|1|1|3|3|3' 
					editcol='0|0|1|1|1|1|1|1'
                    widths='0|0|800|1200|1200|1200|1200|1000' onafteredit="CheckInput(this)" acceptnulldate="T"
                    sorting='T' styles='width:100%; height:150' />
            </td>
        </tr>	
		<tr>
            <td colspan="15">
                <hr noshade size="1" style="color: Silver" />
            </td>
        </tr>    
		 <tr style="height: 1%" id="tab_bottom">
            <td style="width: 5%; white-space: nowrap" align="right">
                Factory
            </td>
            <td style="width: 30%; white-space: nowrap" align="right">
                <gw:list id="lstFactory" styles='width:100%' onchange="OnSearch()" />
            </td>
            <td align="right" style="width: 5%; white-space: nowrap">
                Ord Plan
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtOrdPlanQty" styles='width:100%' csstype="mandatory" type="number"
                    format="###,###,###" />
            </td>
            <td align="right" style="width: 5%; white-space: nowrap">
                R/G Plan
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtRGPlanQty" styles='width:100%' csstype="mandatory" type="number"
                    format="###,###,###" />
            </td>
            <td align="right" style="width: 5%; white-space: nowrap">
                Remain
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtRemainQty" styles='width:100%; color:blue' type="number" format="###,###,###" />
            </td>
            <td style="width: 1%; white-space: nowrap" align="center">
                <gw:imgbtn id="btnSearch" img="search" onclick="OnSearch('1')" />
            </td>
            <td style="width: 1%" align='right'>
                <gw:imgbtn id="btnAddNew" img="new" onclick="OnAddNew('1')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete('1')" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn img="udelete" alt="UnDelete" id="btnUnDelete" onclick="OnUnDelete('1')" />
            </td>
            <td style="width: 1%" align='right'>
                <gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave('1')" />
            </td>
        </tr>
        <tr style="height: 40%;">
            <td colspan="20">
                <gw:grid id='grdRoutingGroup' header='_PK|_fac_pk|R/G|_pp_ordpland_pk|From|To|R/G Plan Qty'
                    format='0|0|0|0|4|4|0' aligns='0|0|1|0|1|1|3' check='||||||' editcol='0|0|0|0|1|1|1'
                    widths='0|0|3000|0|1200|1200|1000' onafteredit="CheckInput(this)" acceptnulldate="T"
                    sorting='T' styles='width:100%; height:150' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------->
    <gw:textbox id="txtOrdPlanDPK" styles='width:100%;display:none' />
    <!------------------------------------------------------------------->
</body>
</html>
