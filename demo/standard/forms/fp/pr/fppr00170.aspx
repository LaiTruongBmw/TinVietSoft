<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Line Stock Update</title>
</head>

<script> 

var user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
var user_name  = "<%=Session("USER_NAME")%>" ;  

var G1_OrdPlan_PK	= 0,
    G1_Style_Code   = 1,
	G1_Style_PK		= 3,
    G1_PO_No        = 4;

var G2_PRO_COMP_PK 	= 0,
	G2_WP_PK      		= 1,
    G2_SEQ   			= 2,
    G2_WPROCESS 		= 3,
    G2_COMP_PK    		= 4,
    G2_COMP_ID    		= 5,    
    G2_COMP_NAME    	= 6;

var G3_SEQ			= 0,
	G3_COMP_ID		= 1,
	G3_COMP_NAME	= 2,
	G3_IN_RATIO		= 3,
	G3_IN_QTY		= 4,
	G3_SPEC_NM		= 5,
	G3_REQ_QTY		= 6,		
	G3_INPUT_QTY	= 7,
	G3_INPUT_ADJ	= 8,
	G3_INPUT_TOTAL  = 9,
	G3_OUTPUT_QTY	= 10,
	G3_OUTPUT_ADJ	= 11,
	G3_OUTPUT_TOTAL = 12,
	G3_ORDPLAN_PK	= 13,
	G3_RG		    = 14,
	G3_PROD_DATE	= 15,
	G3_COMP_PK		= 16,
	G3_SPEC01_PK	= 17,
	G3_SPEC02_PK	= 18,
	G3_SPEC03_PK	= 19,
	G3_SPEC04_PK	= 20,
	G3_SPEC05_PK	= 21,
	G3_EMP_PK		= 22;
	
var arr_FormatNumber = new Array();	
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
 	  txtEmpPK.text = user_pk ;
	  
 	  BindingDataList();
   
      OnFormatGrid();	 	 	  	  
 } 
 
 //========================================================================
function BindingDataList()
{    
    var data="";    
	
    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from tlg_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||ALL FACTORY";
    lstFactory.SetDataText( data);
    lstFactory.value = '' ;	 	           
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
      
	  trl.ColFormat(G3_REQ_QTY)     = "###,###,###,###,###";  
	   
      trl.ColFormat(G3_INPUT_QTY)   = "###,###,###,###,###";
      trl.ColFormat(G3_INPUT_ADJ)   = "###,###,###,###,###";
      trl.ColFormat(G3_INPUT_TOTAL) = "###,###,###,###,###";

	  trl.ColFormat(G3_OUTPUT_QTY)   = "###,###,###,###,###";
	  trl.ColFormat(G3_OUTPUT_ADJ)   = "###,###,###,###,###";
	  trl.ColFormat(G3_OUTPUT_TOTAL) = "###,###,###,###,###";
	  
      arr_FormatNumber[G3_OUTPUT_ADJ]   = 0;
      arr_FormatNumber[G3_INPUT_ADJ]    = 0;
      arr_FormatNumber[G3_OUTPUT_TOTAL] = 0;
      arr_FormatNumber[G3_INPUT_TOTAL]  = 0; 
		  					
 }
 
//===============================================================================================
 function OnDataReceive(po_oData)
 {
    switch (po_oData.id)
    {   
 		case 'pro_fppr00170' :            
            OnSearch('OrdPlan');                  
        break;  
			         
 		case 'data_fppr00170' :            
            if ( grdOrdPlan.rows > 1 )
            {
                grdOrdPlan.SetCellBgColor( 1, G1_Style_Code, grdOrdPlan.rows - 1, G1_Style_Code, 0xCCFFFF );
            }                   
        break;       	    		 
				
        case 'data_fppr00170_1' :            
            if ( grdOutComp.rows > 1 )
            {
                grdOutComp.SetCellBold( 1, G2_COMP_ID, grdOutComp.rows - 1, G2_COMP_ID, true);													 
            }                   
        break;    
		
        case 'data_fppr00170_2' :            
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G3_COMP_ID, grdDetail.rows - 1, G3_COMP_ID, true);
				grdDetail.SetCellBold( 1, G3_REQ_QTY, grdDetail.rows - 1, G3_REQ_QTY, true);	
				
				grdDetail.SetCellBold( 1, G3_INPUT_TOTAL,  grdDetail.rows - 1, G3_INPUT_TOTAL,  true);
				grdDetail.SetCellBold( 1, G3_OUTPUT_TOTAL, grdDetail.rows - 1, G3_OUTPUT_TOTAL, true);	
				
				grdDetail.SetCellBgColor( 1, G3_INPUT_QTY,  grdDetail.rows - 1, G3_INPUT_ADJ,  0xCCFFFF );	
				grdDetail.SetCellBgColor( 1, G3_OUTPUT_QTY, grdDetail.rows - 1, G3_OUTPUT_ADJ, 0xd4d2ff );	
				
				grdDetail.GetGridControl().Cell( 7, 1, G3_INPUT_ADJ,  grdDetail.rows - 1, G3_INPUT_ADJ )  = 0x3300cc;
				grdDetail.GetGridControl().Cell( 7, 1, G3_OUTPUT_ADJ, grdDetail.rows - 1, G3_OUTPUT_ADJ ) = 0x3300cc;									 
            }                   
        break;		         
    }
 } 

//===============================================================================================
 function OnSearch(pos)
 {
        switch(pos)
        {
			case 'header':
				data_fppr00170_header.Call('SELECT');
			break;
			
            case 'OrdPlan':
                data_fppr00170.Call('SELECT');
            break;

            case 'OutComp':
                data_fppr00170_1.Call('SELECT');
            break;
			            
            case 'Detail':
                data_fppr00170_2.Call('SELECT');
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
				
                OnSearch('OutComp');
            }    
        break;
		
		case 'grdOutComp':
            if ( grdOutComp.row > 0 )
            {   
				txtProcessCompPK.text = grdOutComp.GetGridData( grdOutComp.row, G2_PRO_COMP_PK );
				
                OnSearch('Detail');
            } 			
		break;
    }
} 
 //=================================================================================

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( (col == G3_INPUT_ADJ || col == G3_INPUT_TOTAL || col == G3_OUTPUT_ADJ || col == G3_OUTPUT_TOTAL) && row > 0)
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            grdDetail.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));                         
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        }  
        //----------------------Calculate Amount -----        
            if ( col == G3_INPUT_ADJ )
            {
                dQuantiy = Number(grdDetail.GetGridData( row, G3_INPUT_ADJ)) + Number(grdDetail.GetGridData( row, G3_INPUT_QTY)) ;                 
                
                grdDetail.SetGridText( row, G3_INPUT_TOTAL, System.Round( dQuantiy, arr_FormatNumber[G3_INPUT_TOTAL] ));                                              
            } 
            else if ( col == G3_OUTPUT_ADJ )
            {
                dQuantiy = Number(grdDetail.GetGridData( row, G3_OUTPUT_ADJ)) + Number(grdDetail.GetGridData( row, G3_OUTPUT_QTY)) ;                 
                
                grdDetail.SetGridText( row, G3_OUTPUT_TOTAL, System.Round( dQuantiy, arr_FormatNumber[G3_OUTPUT_TOTAL] ));   
            }
            else if ( col == G3_INPUT_TOTAL )
            {
                dQuantiy = Number(grdDetail.GetGridData( row, G3_INPUT_TOTAL)) - Number(grdDetail.GetGridData( row, G3_INPUT_QTY)) ;                 
                
                grdDetail.SetGridText( row, G3_INPUT_ADJ, System.Round( dQuantiy, arr_FormatNumber[G3_INPUT_ADJ] ));         
            }
			else if ( col == G3_OUTPUT_TOTAL )
            {
                dQuantiy = Number(grdDetail.GetGridData( row, G3_OUTPUT_TOTAL)) - Number(grdDetail.GetGridData( row, G3_OUTPUT_QTY)) ;                 
                
                grdDetail.SetGridText( row, G3_OUTPUT_ADJ, System.Round( dQuantiy, arr_FormatNumber[G3_OUTPUT_ADJ] ));         
            }                  
    }      
} 
//=====================================================================================

function OnProcess(pos)
{
    switch (pos)
    {
        case 'Line':
            pro_fppr00170.Call();
        break;
		
		case 'SetProdQty':
			if ( !(Number(txtQty.text)>0) )
			{							
				alert("Pls input valid number for process quantity.");
				return;
			}
			
			var dQuantiy, dProcessQty ;
			
			for (var i = 1 ; i < grdDetail.rows ; i++ )
			{
				dProcessQty = Number(txtQty.text)*Number(grdDetail.GetGridData( i, G3_IN_QTY));
				
				grdDetail.SetGridText( i, G3_INPUT_TOTAL, System.Round(dProcessQty,arr_FormatNumber[G3_INPUT_TOTAL]) );
				
				dQuantiy = Number(grdDetail.GetGridData( i, G3_INPUT_TOTAL)) - Number(grdDetail.GetGridData( i, G3_INPUT_QTY)) ;                 
                
                grdDetail.SetGridText( i, G3_INPUT_ADJ, System.Round( dQuantiy, arr_FormatNumber[G3_INPUT_ADJ] ));	
				
				//---------------
				grdDetail.SetGridText( i, G3_OUTPUT_TOTAL, System.Round(dProcessQty,arr_FormatNumber[G3_OUTPUT_TOTAL]) );
				
				dQuantiy = Number(grdDetail.GetGridData( i, G3_OUTPUT_TOTAL)) - Number(grdDetail.GetGridData( i, G3_OUTPUT_QTY)) ;                 
                
                grdDetail.SetGridText( i, G3_OUTPUT_ADJ, System.Round( dQuantiy, arr_FormatNumber[G3_OUTPUT_ADJ] ));						
			}
									
		break;                      
    }        
}

 //=============================================================================                       
 
 function OnSave()
 {
    data_fppr00170_2.Call();
 }
  
//===================================================================================
</script>

<body>   
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00170" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fppr00170" > 
                <input>
                    <input bind="lstFactory" /> 
                </input> 
                <output>
                    <output bind="lstRG" />
                </output>
            </dso> 
        </xml> 
    </gw:data> 
    <!----------------------------------------------------------------------->
    <gw:data id="data_fppr00170" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid" user="prod" parameter='0,3,6' function="<%=l_user%>lg_sel_fppr00170" >
                <input >
					<input bind="lstFactory" />
                    <input bind="txtPOStyle" />
                </input> 
                <output bind="grdOrdPlan" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="data_fppr00170_1" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso type="grid" user="prod" function="<%=l_user%>lg_sel_fppr00170_1" >
                <input >
                    <input bind="txtStylePK" />					 
					<input bind="txtComponent" />					 
                </input> 
                <output bind="grdOutComp" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------>
    <gw:data id="data_fppr00170_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22" function="<%=l_user%>lg_sel_fppr00170_2" procedure="<%=l_user%>lg_upd_fppr00170_2" > 
                <input> 
					<input bind="txtProcessCompPK" />
                    <input bind="txtOrdPlanPK" />
					<input bind="lstRG" />
					<input bind="dtDate" />
					<input bind="txtSpec" />
					<input bind="txtEmpPK" />
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
                            <gw:list id="lstFactory" text="" styles="width:100%" onchange="OnProcess('Line')" />
                        </td>
						
                        <td align="right" style="width: 5%; white-space: nowrap">
                            P/O Style
                        </td>
                        <td style="width: 44%">
                            <gw:textbox id="txtPOStyle" styles="width:100%" onenterkey="OnSearch('OrdPlan')" />
                        </td>						 
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch2" img="search" alt="Search" onclick="OnSearch('OrdPlan')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="5">
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
                <table style="width: 100%; height: 100%">
				     <tr style="height: 1%">
                        <td style="width: 5%">
                            <img status="expand" id="imgClose" src="../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td colspan=3 ><gw:label id="lblStylePO" styles='width:100%;color:cc0000;font:9pt' /></td>  
						                                                                   
                        <td style="width: 10%; white-space: nowrap"align="right" >
                			Comp
           				</td>						 
                        <td style="width: 1%; white-space: nowrap" align="left">
                            <gw:textbox id="txtComponent" styles="width:100%" onenterkey="OnSearch('OutComp')" />
                        </td>
						
                        <td style="width: 1%" align="left" colspan=2 > 
							<gw:imgbtn id="ibtnSearch3" img="search" alt="Search" onclick="OnSearch('OutComp')" />                           
                        </td>
						<td style="width: 1%" align="left"   > 							                            
                        </td> 
						<td style="width: 1%" align="left"   > 							      
                        </td>                         
                    </tr>         
					
                    <tr style="height: 39%"> 
                        <td colspan="10">
							 <gw:grid id='grdOutComp' 
								header='_ProcessCompPK|_WP_PK|Seq|W/Process|_Comp_PK|Comp ID|Comp Name'
                                format='0|0|0|0|0|0|0' 
								aligns='0|0|1|0|0|1|0'
                                check='||||||' 
								editcol='0|0|0|0|0|0|0' 
								widths='0|0|800|2000|0|1500|2500'
                                sorting='T' styles='width:100%; height:100%' onclick="OnGridCellClick(this)" />
						</td>		                        						                         
                    </tr> 
					
					<tr style="height: 1%"> 
                        <td style="width: 5%; white-space: nowrap" align="right">
						 	R/G
						</td>	
						<td style="width: 30%; white-space: nowrap"> 
							<gw:list id="lstRG" text="" styles="width:100%" onchange="OnSearch('Detail')" />
						</td>	
						<td style="width: 5%; white-space: nowrap" align="right">
						 	Date
						</td>	
						<td style="width: 8%; white-space: nowrap"> 
							<gw:datebox id="dtDate" lang="1" styles='width:100%;' onchange="OnSearch('Detail')" />
						</td>
						<td style="width: 5%; white-space: nowrap"align="right" >
                			Spec
           				</td>						 
                        <td style="width: 20%; white-space: nowrap" align="left">
                            <gw:textbox id="txtSpec" styles="width:100%" onenterkey="OnSearch('Detail')" />
                        </td>	
						<td style="width: 5%; white-space: nowrap; background-color: CCFFFF"align="right" >
                			Qty
           				</td>						 
                        <td style="width: 18%; white-space: nowrap; background-color: CCFFFF" align="left">
							<gw:textbox id="txtQty" styles="width:100%;" type="number" format="#,###,###"
                                csstype="mandatory" onenterkey="OnProcess('SetProdQty')" />
                        </td>	
						<td style="width: 1%" align="left" > 
							<gw:imgbtn id="ibtnProcess" img="process" alt="Search" onclick="OnProcess('SetProdQty')" />                           
                        </td> 
						<td style="width: 1%" align="left" > 
							<gw:imgbtn id="ibtnSave" img="save" alt="Search" onclick="OnSave()" />                           
                        </td> 												                        						                         
                    </tr>
					                   
                    <tr style="height: 59%">
                        <td colspan="10">                          								
							<gw:grid id='grdDetail'
								header='Seq|Comp ID|Comp Name|In (%)|In Qty|Spec|Req Qty|Input Qty|Adj Qty|Total Input|Output Qty|Adj Qty|Total Output|_PP_ORDPLAN_PK|R/G|_PROD_DATE|_COMP_PK|_SPEC01_PK|_SPEC02_PK|_SPEC03_PK|_SPEC04_PK|_SPEC05_PK|_Emp_PK'
								format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
								aligns='1|1|0|3|3|1|3|3|3|3|3|3|3|0|1|0|0|0|0|0|0|0|0'
								check='||||||||||||||||||||||'
								editcol='0|0|0|0|0|0|0|0|1|1|0|1|1|0|0|0|0|0|0|0|0|0|0'
								widths='800|1500|2500|1000|1000|1500|1200|1200|1200|1200|1200|1200|1200|0|0|0|0|0|0|0|0|0|0'
								sorting='T' 
								styles='width:100%; height:100%'  onafteredit="CheckInput()"
							/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
	<gw:textbox id="txtProcessCompPK" style="display: none" />
	<gw:textbox id="txtOrdPlanPK" style="display: none" />
	<gw:textbox id="txtStylePK" style="display: none" />	 
	
	<gw:textbox id="txtEmpPK" style="display: none" />
	<!------------------------------------------------------------------>
</body>
</html>
