<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>P/O Process Balance Detail</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 

    var ordplan_pk = "<%=request.QueryString("ordplan_pk") %>";
    var process_pk = "<%=Request.querystring("process_pk")%>";
 
var G_Spec_01       = 0,
    G_Spec_02       = 1,
    G_Spec_03       = 2,
    G_Spec_04       = 3,
    G_Spec_05       = 4,
    G_Plan_Qty      = 5,
    G_Prod_Qty      = 6,
    G_Defect_Qty    = 7,
    G_Bal_Qty       = 8; 
//===============================================================================
    
function BodyInit()
{
    System.Translate(document);
    txtOrdPlanPK.text = ordplan_pk ;  
    
    FormatGrid();
     
    OnHiddenGrid();
    OnSearch('header'); 
}
//===============================================================================
function FormatGrid()
{
      grdDetail.GetGridControl().MergeCells  = 4 ;	
      grdDetail.GetGridControl().MergeCol(0) = true ;	
      grdDetail.GetGridControl().MergeCol(1) = true ;   	
      grdDetail.GetGridControl().MergeCol(2) = true ;	
      grdDetail.GetGridControl().MergeCol(3) = true ;	
      grdDetail.GetGridControl().MergeCol(4) = true ;
}
//===============================================================================

function OnHiddenGrid()
{
    grdDetail.GetGridControl().ColHidden(G_Spec_01) = true ;
	grdDetail.GetGridControl().ColHidden(G_Spec_02) = true ;
	grdDetail.GetGridControl().ColHidden(G_Spec_03) = true ;
	grdDetail.GetGridControl().ColHidden(G_Spec_04) = true ;
	grdDetail.GetGridControl().ColHidden(G_Spec_05) = true ;
}
//===============================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {	
        case 'data_fpip00100_Header':
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
                    grdDetail.SetGridText(0,G_Spec_01,col1);
                    grdDetail.GetGridControl().ColHidden(G_Spec_01) = false ;
                    
                }
                if (dis_col2!=0)
                {
                    grdDetail.SetGridText(0,G_Spec_02,col2);
                    grdDetail.GetGridControl().ColHidden(G_Spec_02) = false ;
                    
                }
                if (dis_col3!=0)
                {
                    grdDetail.SetGridText(0,G_Spec_03,col3);
                    grdDetail.GetGridControl().ColHidden(G_Spec_03) = false ;
                    
                }
                if (dis_col4!=0)
                {
                    grdDetail.SetGridText(0,G_Spec_04,col4);
                    grdDetail.GetGridControl().ColHidden(G_Spec_04) = false ;
                    
                }
                if (dis_col5!=0)
                {
                    grdDetail.SetGridText(0,G_Spec_05,col5);
                    grdDetail.GetGridControl().ColHidden(G_Spec_05) = false ;
                    
                }
                OnSearch('Process');
            }
        break;
        case "pro_fpgm00091":
            lstProcess.value = process_pk ;
            
            OnSearch('POStyle');
        break;
        	
        case "data_fpgm00091_1":
            OnSearch('Detail');
        break;
        
		case "data_fpgm00091":
		     if ( grdDetail.rows > 1 )
		     {    		     		        		         
		         grdDetail.Subtotal( 0, 2, -1, '5!6!7!8', '###,###,###');		         
             }
		break;
   }
}

//===============================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'Process':
            pro_fpgm00091.Call();
        break;
        
        case 'POStyle':
            data_fpgm00091_1.Call("SELECT");
        break;
        
        case 'Detail' :
            data_fpgm00091.Call("SELECT");
        break;
        case 'header':
            data_fpip00100_Header.Call("SELECT");
        break;
    }
}
//===============================================================================

</script>

<body>
    <gw:data id="data_fpip00100_Header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpip00100_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpgm00091" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpgm00091" > 
                <input>
                    <input bind="txtOrdPlanPK" /> 
                </input> 
                <output>
                    <output bind="lstProcess" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpgm00091_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="control" function="<%=l_user%>lg_sel_fpgm00091_1" >
                <inout>
                    <inout bind="txtOrdPlanPK" /> 
                    <inout bind="lblPONo" />     
                    <inout bind="lblStyle" />                     
                 </inout>
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpgm00091" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fpgm00091"  > 
                <input> 
                    <input bind="txtOrdPlanPK" /> 
                    <input bind="lstProcess" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <table style="width: 100%; height: 100%;" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%;">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            P/O No :
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:label id="lblPONo" styles='width:100%;color:cc0000;font:9pt' text='' />
                        </td>
                        <td style="width: 5%" align="right">
                            Style :
                        </td>
                        <td style="width: 40%; white-space: nowrap">
                            <gw:label id="lblStyle" styles='width:100%;color:cc0000;font:9pt' text='' />
                        </td>
                        <td style="width: 5%" align="right">
                            Process
                        </td>
                        <td style="width: 29%; white-space: nowrap">
                            <gw:list id="lstProcess" text="" styles="width:100%" onchange="OnSearch('grdOrdPlan')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" styles='width:100%' onclick="data_fpgm00091.Call('SELECT')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td style="width: 100%">
                <gw:grid id='grdDetail' header='Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|Plan Qty|Prod Qty|Defect Qty|Bal Qty'
                    format='0|0|0|0|0|0|0|0|0' aligns='1|1|1|1|1|3|3|3|3' defaults='||||||||' editcol='0|0|0|0|0|0|0|0|0'
                    widths='1500|1500|1500|1500|1500|1200|1200|1200|1200' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------->
<gw:textbox id="txtOrdPlanPK" text="" styles="width:100%;display:none" />
<!------------------------------------------------------->
<gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
    format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
    editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
    sorting='T' autosize='T' styles='width:100%; height:50%;display:none' />
</html>
