<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>POP UP GET COMPONENT</title>
</head>

<script> 

var G1_OrdPlan_PK	= 0,
    G1_Style_Code   = 1,
	G1_Style_PK		= 3,
    G1_PO_No        = 4;

var G2_GROUP        = 0,
	G2_COMP_PK      = 1,
    G2_IN_COMP_ID   = 2,
    G2_IN_COMP_NAME = 3,
    G2_SPEC01_PK    = 4,
    G2_SPEC02_PK    = 5,
    G2_SPEC03_PK    = 6,
    G2_SPEC04_PK    = 7, 
    G2_SPEC05_PK    = 8,
	G2_SPEC_NM      = 9,
    G2_PLAN_QTY     = 10,
    G2_REQ_QTY      = 11,
    G2_PROD_QTY     = 12,    
	G2_ORDPLAN_PK	= 13,
	G2_PO_NO		= 14,
	G2_STYLE_CODE	= 15,
	G2_STYLE_NAME	= 16;
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
 } 
 
 //========================================================================
function BindingDataList()
{    
    var data="";    
	
    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from prod.TPR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||ALL FACTORY";
    lstFactory.SetDataText( data);
    lstFactory.value = '' ;	 	

    data = "<%=ESysLib.SetListDataFUNC("SELECT COMM.f_logistic_code('LGPC0101') FROM DUAL")%>||"; 
    lstCompGroup.SetDataText(data);  
    lstCompGroup.value = '' ;
	 	
    //-----------
    data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    lstLang.SetDataText(data);      
    lstLang.value = "<%=Session("SESSION_LANG")%>";	             
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
	  
      var trl ;
    
	trl = grdDetail.GetGridControl();
    
    trl.ColFormat(G2_PLAN_QTY) = "###,###,###,###,###";
    trl.ColFormat(G2_REQ_QTY)  = "###,###,###,###,###";
    trl.ColFormat(G2_PROD_QTY) = "###,###,###,###,###";				
 }
 
//===============================================================================================
 function OnDataReceive(po_oData)
 {
    switch (po_oData.id)
    {
            
 		case 'data_fppr00161' :            
            if ( grdOrdPlan.rows > 1 )
            {
                grdOrdPlan.SetCellBgColor( 1, G1_Style_Code, grdOrdPlan.rows - 1, G1_Style_Code, 0xCCFFFF );
            }                   
        break;       
	    				
        case 'data_fppr00161_1' :            
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBgColor( 1, G2_IN_COMP_ID,  grdDetail.rows - 1, G2_IN_COMP_NAME, 0xCCFFFF );

                grdDetail.SetCellBgColor( 1, G2_REQ_QTY,  grdDetail.rows - 1, G2_REQ_QTY, 0xCCFFFF );
                
                grdDetail.SetCellBold( 1, G2_IN_COMP_ID,  grdDetail.rows - 1, G2_IN_COMP_ID, true);
                grdDetail.SetCellBold( 1, G2_PROD_QTY,    grdDetail.rows - 1, G2_PROD_QTY, true);			    
            }                   
        break;             
    }
 }

//===============================================================================================
 function OnSearch(pos)
 {
        switch(pos)
        {
            case 'OrdPlan':
                data_fppr00161.Call('SELECT');
            break;
            
            case 'Detail':
                data_fppr00161_1.Call('SELECT');
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
//======================================================================
function OnSelect()
{   
        var arr_data = new Array();
        for(var i = 1; i < grdDetail.rows; i++ )
        {
            if ( grdDetail.GetGridControl().isSelected(i) == true )
            {
                 var arrTemp = new Array();
                     
                 for( var j = 0; j < grdDetail.cols; j++ )
                 {
                      arrTemp[arrTemp.length]= grdDetail.GetGridData(i,j);
                 }
                     
                 arr_data[arr_data.length]= arrTemp;
            }
        }
          
        window.returnValue =  arr_data;
        window.close();	          	
} 
//===================================================================================
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_fppr00161" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid" user="prod" parameter='0,3,6' function="<%=l_user%>lg_sel_fppr00161" >
                <input >
					<input bind="lstFactory" />
                    <input bind="txtPOStyle" />
                </input> 
                <output bind="grdOrdPlan" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="data_fppr00161_1" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso type="grid" user="prod"   function="<%=l_user%>lg_sel_fppr00161_1"   >
                <input >
                    <input bind="txtOrdPlanPK" />
                    <input bind="txtStylePK" />					 
					<input bind="lstCompGroup" />
					<input bind="txtComponent" />
					<input bind="txtSpec" />				 
					<input bind="lstLang" />
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
                        <td colspan=4 ><gw:label id="lblStylePO" styles='width:100%;color:cc0000;font:9pt' /></td>
						<td style="width: 10%" align="right" colspan=4>
			              	<gw:list id="lstLang" styles='width:100%' onchange="OnSearch('Detail')" />
            			</td>	  						                                                                                                             
                    </tr>         
					
                    <tr style="height: 1%"> 
                        <td style="width: 5%" align="right" >  
							Group                           
                        </td>					                      
                        <td style="width: 30%; white-space: nowrap" align="center">  
							<gw:list id="lstCompGroup" styles="width:100%;" onchange="OnSearch('Detail')" />              			 
           				</td>						
						<td align="right" style="width: 5%">
                            Comp
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtComponent" styles="width:100%" onenterkey="OnSearch('Detail')" />
                        </td>  					
						<td align="right" style="width: 5%">
                            Spec
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtSpec" styles="width:100%" onenterkey="OnSearch('Detail')" />
                        </td>  
						<td style="width: 3%" ></td>
						<td style="width: 1%" align="left">
							<gw:imgbtn id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch('Detail')" />
						</td>	
						<td style="width: 1%" align="left">
							<gw:imgbtn id="ibtnSelect" img="select" alt="Search" onclick="OnSelect()" />
						</td>	
											
			            		                        						                         
                    </tr>                    
                    <tr style="height: 98%">
                        <td colspan="10">
                            <gw:grid id='grdDetail' 
								header='Group|_Comp_PK|Comp ID|Comp Name|_Spec01_PK|_Spec02_PK|_Spec03_PK|_Spec04_PK|_Spec05_PK|Spec|Plan Qty|Req Qty|Prod Qty|_ORDPLAN_PK|_PO_NO|_STYLE_CODE|_STYLE_NAME'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|0|0|0|0|0|0|0|1|3|3|3|0|0|0|0'
                                check='||||||||||||||||' 
								editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								widths='2000|0|2000|3000|0|0|0|0|0|1200|1200|1200|1200|1200|0|0|0'
                                sorting='T' styles='width:100%; height:100%' oncelldblclick="OnPopUp('Detail')" />
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
</body>
</html>
