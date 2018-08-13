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

var G2_OUT_COMP_NAME= 0,
	G2_COMP_PK      = 1,
    G2_IN_COMP_ID   = 2,
    G2_IN_COMP_NAME = 3,
    G2_SPEC01_PK    = 4,
    G2_SPEC01_ID    = 5,
    G2_SPEC02_PK    = 6,
    G2_SPEC02_ID    = 7,
    G2_SPEC03_PK    = 8,
    G2_SPEC03_ID    = 9,
    G2_SPEC04_PK    = 10,
    G2_SPEC04_ID    = 11, 
    G2_SPEC05_PK    = 12,
    G2_SPEC05_ID    = 13,
    G2_PLAN_QTY     = 14,
    G2_REQ_QTY      = 15,
    G2_PROD_QTY     = 16,
    G2_BAL_QTY      = 17,
	G2_D1_QTY		= 18,
	G2_D2_QTY		= 19,
	G2_D3_QTY		= 20,
	G2_D4_QTY		= 21,
	G2_D5_QTY		= 22,
	G2_GROUP		= 23;
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
	
    data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from TLG_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||ALL FACTORY";
    lstFactory.SetDataText( data);
    lstFactory.value = '' ;	 	
	 	
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
      grdDetail.GetGridControl().MergeCol(11) = true ;
      grdDetail.GetGridControl().MergeCol(12) = true ;	
      grdDetail.GetGridControl().MergeCol(13) = true ;	
	  grdDetail.GetGridControl().MergeCol(14) = true ; 
	  grdDetail.GetGridControl().MergeCol(15) = true ;  	  	  	  	  	  
	  
      var trl ;
    
	trl = grdDetail.GetGridControl();
    
    trl.ColFormat(G2_PLAN_QTY) = "###,###,###,###,###";
    trl.ColFormat(G2_REQ_QTY)  = "###,###,###,###,###";
    trl.ColFormat(G2_PROD_QTY) = "###,###,###,###,###";

	trl.ColFormat(G2_D1_QTY)   = "###,###,###,###,###";
	trl.ColFormat(G2_D2_QTY)   = "###,###,###,###,###";
	trl.ColFormat(G2_D3_QTY)   = "###,###,###,###,###";
	trl.ColFormat(G2_D4_QTY)   = "###,###,###,###,###";
	trl.ColFormat(G2_D5_QTY)   = "###,###,###,###,###";					
 }
 
//===============================================================================================
 function OnDataReceive(po_oData)
 {
    switch (po_oData.id)
    {
            case 'data_fpgm00040_header':
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
			
 		case 'data_fpgm00040' :            
            if ( grdOrdPlan.rows > 1 )
            {
                grdOrdPlan.SetCellBgColor( 1, G1_Style_Code, grdOrdPlan.rows - 1, G1_Style_Code, 0xCCFFFF );
            }                   
        break;       
	    
		case 'data_fpgm00040_2' :
			SetHeader();
			
			data_fpgm00040_1.Call("SELECT");
		break;
				
        case 'data_fpgm00040_1' :            
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBgColor( 1, G2_IN_COMP_ID,  grdDetail.rows - 1, G2_IN_COMP_NAME, 0xCCFFFF );
                grdDetail.SetCellBgColor( 1, G2_BAL_QTY,  grdDetail.rows - 1, G2_BAL_QTY, 0xCCFFFF );
                grdDetail.SetCellBgColor( 1, G2_REQ_QTY,  grdDetail.rows - 1, G2_REQ_QTY, 0xCCFFFF );
                
                grdDetail.SetCellBold( 1, G2_IN_COMP_ID,     grdDetail.rows - 1, G2_IN_COMP_ID, true);
                grdDetail.SetCellBold( 1, G2_PLAN_QTY,    grdDetail.rows - 1, G2_BAL_QTY, true);
				
				if (chkOut.value=='N')
				{
                	grdDetail.Subtotal( 0, 2, -1, '14!15!16!18!19!20!21!22','###,###,###');
			    }	
				else
				{
  					for( var i = 0; i < grdDetail.rows; i++ )
     				{
						if ( grdDetail.GetGridData( i, G2_GROUP) == '2')
						{
							grdDetail.SetCellBgColor( i, G2_PROD_QTY, i, G2_D5_QTY, 0x66FFAA );
						}
					}					
				}	
            }                   
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
//=========================================================================
function OnHiddenGrid()
{
    grdDetail.GetGridControl().ColHidden(G2_SPEC01_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC02_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC03_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC04_ID) = true ;
	grdDetail.GetGridControl().ColHidden(G2_SPEC05_ID) = true ;
}

//==========================================================================

function SetHeader()
{ 
     for( var j = 0; j < grdTmp.cols; j++ )
     {
          //------------------------
          if ( grdTmp.GetGridData( 1, j ) == "SUNDAY   " ) // Bat buoc phai co khoang trong phia sau cua chu SUNDAY
          {        
                grdDetail.GetGridControl().Cell( 7, 0, j + 18, 0, j + 18)   = 0x3300cc;                        
          }
          else
          {
                grdDetail.GetGridControl().Cell( 7, 0, j + 18, 0, j + 18)   = 0x000000;
          }
 
          //------------------------      
          grdDetail.GetGridControl().Cell( 0, 0, j + 18, 0, j + 18 ) = grdTmp.GetGridData( 2, j );
          //------------------------
     }  
	   
}

//===============================================================================================
 function OnSearch(pos)
 {
        switch(pos)
        {
			case 'header':
				data_fpgm00040_header.Call('SELECT');
			break;
			
            case 'OrdPlan':
                data_fpgm00040.Call('SELECT');
            break;
            
            case 'Detail':
                data_fpgm00040_2.Call('SELECT');
            break;
        }        
 }

//========================================================================
function OnPopUp(pos)
{
    switch(pos)
    {		
   		case 'Detail':
                    if ( ( grdDetail.row > 0 ) && ( grdDetail.col > G2_BAL_QTY ) )
                    {
 						var path = System.RootURL + '/form/fp/gm/fpgm00041.aspx?ordplan_pk=' + grdOrdPlan.GetGridData( grdOrdPlan.row, G1_OrdPlan_PK)+"&component=" + grdDetail.GetGridData( grdDetail.row, G2_IN_COMP_ID)+"&prod_date=" + grdTmp.GetGridData( 3, grdDetail.col-18);
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
//=====================================================================================

function OnProcess(pos)
{
    switch (pos)
    {
        case 'RG':
            pro_fpgm00040.Call();
        break;      
    }        
} 
//===================================================================================
</script>

<body>
	<!---------------------------------------------------------------->
    <gw:data id="pro_fpgm00040" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpgm00040" > 
                <input>
                    <input bind="lstFactory" /> 
                </input> 
                <output>
                    <output bind="lstRoutingGroup" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpgm00040_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpgm00040_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="data_fpgm00040" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid" user="prod" parameter='0,3,6' function="<%=l_user%>lg_sel_fpgm00040" >
                <input >
					<input bind="lstFactory" />
                    <input bind="txtPOStyle" />
                </input> 
                <output bind="grdOrdPlan" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="data_fpgm00040_1" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso type="grid" user="prod"   function="<%=l_user%>lg_sel_fpgm00040_1"   >
                <input >
                    <input bind="txtOrdPlanPK" />
                    <input bind="txtStylePK" />
					<input bind="lstRoutingGroup" />
					<input bind="chkDetail" />
					<input bind="chkOut" />
					<input bind="txtOUTComp" />
					<input bind="txtINComp" />
					<input bind="txtSpec" />
					<input bind="dtDate" />
					<input bind="lstLang" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------>
    <gw:data id="data_fpgm00040_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fpgm00040_2"  > 
                <input> 
                    <input bind="dtDate" /> 
                </input> 
                <output bind="grdTmp" /> 
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
                            <gw:list id="lstFactory" text="" styles="width:100%" onchange="OnProcess('RG')" />
                        </td>
						
                        <td align="right" style="width: 5%; white-space: nowrap">
                            P/O Style
                        </td>
                        <td style="width: 44%">
                            <gw:textbox id="txtPOStyle" styles="width:100%" onenterkey="OnSearch('OrdPlan')" />
                        </td>
						<td style="width: 1%">
                			 
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
                <table style="width: 100%; height: 100%">
				      <tr style="height: 1%">
					  
                        <td style="width: 5%">
                            <img status="expand" id="imgClose" src="../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />								
                        </td>
						
                        <td style="width: 20%; white-space: nowrap" colspan=2 >
							<gw:label id="lblStylePO" styles='width:100%;color:cc0000;font:9pt' />
						</td>  
						                                                                 
                        <td style="width: 20%; white-space: nowrap; background-color: CCFFFF" align="center"  >
                			Detail
                			<gw:checkbox id="chkDetail" styles="color:blue" defaultvalue="Y|N" value="N" onchange="OnSearch('Detail')"></gw:checkbox>
							Out
                			<gw:checkbox id="chkOut" styles="color:blue" defaultvalue="Y|N" value="N" onchange="OnSearch('Detail')"></gw:checkbox>							 					 
           				</td>	
						<td style="width: 5%; white-space: nowrap"> 
							Lang                         
                        </td>					 
                        <td style="width: 20%; white-space: nowrap" align="left"   >
                            <gw:list id="lstLang" styles='width:100%' onchange="OnSearch('Detail')" />
                        </td>
						
						<td style="width: 1%" align="right">
			                <gw:imgbtn img="back" id="imgArrow" style="cursor: hand" alt="back" onclick="OnPreviousDate()" />
			            </td>
						<td style="width: 23%">
			                <gw:datebox id="dtDate" lang="1" styles='width:100%;' onchange="" />
			            </td>
			            <td style="width: 1%" align="right">
			                <gw:imgbtn img="next" id="imgArrow1" style="cursor: hand" alt="back" onclick="OnNextDate()" />
            			</td>	
                                               
                    </tr>         
					
                    <tr style="height: 1%"> 
						<td style="width: 5%; white-space: nowrap"> 
							R/G                         
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="center">
							<gw:list id="lstRoutingGroup" styles="width: 100%" onchange="OnSearch('Detail')" />
						</td>  
						
                        <td style="width: 5%; white-space: nowrap" align="right" >  
							OUT Comp                           
                        </td>					                      
                        <td style="width: 25%; white-space: nowrap" align="center">  
							<gw:textbox id="txtOUTComp" styles="width:100%" onenterkey="OnSearch('Detail')" />             			 
           				</td>						
						<td align="right" style="width: 5%; white-space: nowrap">
                            IN Comp
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtINComp" styles="width:100%" onenterkey="OnSearch('Detail')" />
                        </td>  					
						<td align="right" style="width: 5%">
                            Spec
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtSpec" styles="width:100%" onenterkey="OnSearch('Detail')" />
                        </td>  
						<td style="width: 7%" align="left">
							<gw:imgbtn id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch('Detail')" />
						</td>									            		                        						                         
                    </tr>                    
                    <tr style="height: 98%">
                        <td colspan="11">
                            <gw:grid id='grdDetail' 
								header='Out Comp|_Comp_PK|_Comp ID|In Comp|_Spec01_PK|Spec 01|_Spec02_PK|Spec 02|_Spec03_PK|Spec 03|_Spec04_PK|Spec 04|_Spec05_PK|Spec 05|Plan Qty|Req Qty|Prod Qty|(%)|D1 Qty|D2 Qty|D3 Qty|D4 Qty|D5 Qty|_Group'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|0|0|0|1|0|1|0|1|0|1|0|1|3|3|3|3|3|3|3|3|3|0'
                                check='|||||||||||||||||||||||' 
								editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								widths='2000|0|2000|3000|0|1200|0|1200|0|1200|0|1200|0|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|0'
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
	<gw:grid id='grdTmp' header='D1|D2|D3|D4|D5' format='0|0|0|0|0'
    	aligns='0|0|0|0|0' defaults='||||' editcol='1|1|1|1|1'
    	widths='1000|1000|1000|1000|1000' sorting='T' styles='width:100%; height:100%;display:none' />
	<!------------------------------------------------------------------>
	<gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
        format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' autosize='T' styles='width:100%; height:50%;display:none' /> 
	<!------------------------------------------------------------------>
</body>
</html>
