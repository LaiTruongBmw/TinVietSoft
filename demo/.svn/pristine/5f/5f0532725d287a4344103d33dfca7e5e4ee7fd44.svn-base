<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Input Detail</title>
</head>

<script> 

var G2_COMP_PK      = 0,
    G2_IN_COMP_ID   = 1,
    G2_IN_COMP_NAME = 2,
    G2_SPEC01_PK    = 3,
    G2_SPEC01_ID    = 4,
    G2_SPEC02_PK    = 5,
    G2_SPEC02_ID    = 6,
    G2_SPEC03_PK    = 7,
    G2_SPEC03_ID    = 8,
    G2_SPEC04_PK    = 9,
    G2_SPEC04_ID    = 10, 
    G2_SPEC05_PK    = 11,
    G2_SPEC05_ID    = 12,
	G2_CARD_ID		= 13,
    G2_CARD_QTY     = 14,
    G2_WH_LOC_ID    = 15;
 
//===============================================================================================
 function BodyInit()
 {  
      System.Translate(document);
	  
	  var ordplan_pk  = "<%=request.QueryString("ordplan_pk") %>";
	  txtOrdPlanPK.text = ordplan_pk ;	
	  
	  var pr_pk  = "<%=request.QueryString("pr_pk") %>";
	  txtProcessPK.text = pr_pk ;		  
    
      OnFormatGrid();	 
	  
	  OnSearch('header');
 } 

//===============================================================================================
 function OnFormatGrid()
 {
      var data="";    
      //-----------
      data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
      lstLang.SetDataText(data);      
      lstLang.value = "<%=Session("SESSION_LANG")%>";	   
	
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
	  
      var trl ;
    
	trl = grdDetail.GetGridControl();
    
    trl.ColFormat(G2_CARD_QTY) = "###,###,###,###,###";
			
 }
 
//===============================================================================================
 function OnDataReceive(po_oData)
 {
    switch (po_oData.id)
    {
            case 'data_fpgm00074_header':
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
        break;       
				
        case 'data_fpgm00074' :            
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBgColor( 1, G2_IN_COMP_ID,  grdDetail.rows - 1, G2_IN_COMP_NAME, 0xCCFFFF );
                grdDetail.SetCellBgColor( 1, G2_CARD_QTY,  grdDetail.rows - 1, G2_CARD_QTY, 0xCCFFFF );                 
                
                grdDetail.SetCellBold( 1, G2_IN_COMP_ID, grdDetail.rows - 1, G2_IN_COMP_ID, true);
				grdDetail.SetCellBold( 1, G2_WH_LOC_ID,  grdDetail.rows - 1, G2_WH_LOC_ID,  true);		
				 
               	grdDetail.Subtotal( 0, 2, -1, '13','###,###,###');
			    
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
				data_fpgm00074_header.Call('SELECT');
			break;
            
            case 'Detail':
                data_fpgm00074.Call('SELECT');
            break;
        }        
 }
 
//===================================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpgm00074_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpgm00074_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="data_fpgm00074" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso type="grid" user="prod"   function="<%=l_user%>lg_sel_fpgm00074"   >
                <input >
                    <input bind="txtOrdPlanPK" />
                    <input bind="txtProcessPK" />					 
					<input bind="txtComponent" />
					<input bind="lstLang" />
					<input bind="chkMainPart" />					 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>	 
    <!---------------------------------------------------------------------->
                <table style="width: 100%; height: 100%">				         					
                    <tr style="height: 1%">                         											 					
						<td align="right" style="width: 5%">
                            Component
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtComponent" styles="width:100%" onenterkey="OnSearch('Detail')" />
                        </td> 						
						<td style="width: 5%; white-space: nowrap" align="right">
                            Lang</td>
                        <td style="width: 30%; white-space: nowrap" align="left">
                            <gw:list id="lstLang" styles='width:100%' onchange="OnSearch('Detail')" />
                        </td>						 
						<td style="width: 20%" align="left">
							Main Part
                			<gw:checkbox id="chkMainPart" styles="color:blue" defaultvalue="Y|N" value="N" onchange="OnSearch('Detail')"></gw:checkbox>	
						</td>
						<td style="width: 9%" align="left">
						</td>										            
			            <td style="width: 1%" align="right">	
							<gw:imgbtn id="btnSearch" img="search" onclick="OnSearch('Detail')" />		                 
            			</td>			                        						                         
                    </tr>   					               
                    <tr style="height: 98%">
                        <td colspan="7">
                            <gw:grid id='grdDetail' 
								header='_Comp_PK|Comp ID|Comp Name|_Spec01_PK|_Spec 01|_Spec02_PK|_Spec 02|_Spec03_PK|_Spec 03|_Spec04_PK|_Spec 04|_Spec05_PK|_Spec 05|Card ID|Card Qty|W/H Loc'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|0|0|1|0|1|0|1|0|1|0|1|1|3|1'
								editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								widths='0|2000|3000|0|1200|0|1200|0|1200|0|1200|0|1200|1200|1200|1200'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>           
    <!------------------------------------------------------------------>
	<gw:textbox id="txtOrdPlanPK" style="display: none" />
	<gw:textbox id="txtProcessPK" style="display: none" />
	 <!------------------------------------------------------------------>
	<gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%;display:none' /> 
</body>
</html>
