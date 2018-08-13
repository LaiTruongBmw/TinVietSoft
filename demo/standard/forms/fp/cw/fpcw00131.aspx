<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Cutting Result Detail</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 

    var ordplan_pk = "<%=request.QueryString("ordplan_pk") %>";
    var comp_pk    = "<%=Request.querystring("comp_pk")%>";
 
var G_Comp_ID       = 0,
    G_Comp_Name     = 1,
    G_Spec_01       = 2,
    G_Spec_02       = 3,
    G_Spec_03       = 4,
    G_Spec_04       = 5,
    G_Spec_05       = 6,
    G_Card_ID       = 7,
    G_Prod_Qty      = 8,
    G_Defect_Qty    = 9; 
//===============================================================================
    
function BodyInit()
{
    txtOrdPlanPK.text = ordplan_pk ;  
    
    FormatGrid();
     
    OnSearch('Component');
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
      grdDetail.GetGridControl().MergeCol(5) = true ;
      grdDetail.GetGridControl().MergeCol(6) = true ;
}
//===============================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {	
        case "pro_fpcw00131":
            lstComponent.value = comp_pk ;
            
            OnSearch('POStyle');
        break;
        	
        case "data_fpcw00131_1":
            OnSearch('Detail');
        break;
        
		case "data_fpcw00131":
		     if ( grdDetail.rows > 1 )
		     {    		     		        		         
		         grdDetail.Subtotal( 0, 2, -1, '8!9', '###,###,###');		         
             }
		break;
   }
}

//===============================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'Component':
            pro_fpcw00131.Call();
        break;
        
        case 'POStyle':
            data_fpcw00131_1.Call("SELECT");
        break;
        
        case 'Detail' :
            data_fpcw00131.Call("SELECT");
        break;
    }
}
//===============================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpcw00131" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpcw00131" > 
                <input>
                    <input bind="txtOrdPlanPK" /> 
                </input> 
                <output>
                    <output bind="lstComponent" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpcw00131_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="control" function="<%=l_user%>lg_sel_fpcw00131_1" >
                <inout>
                    <inout bind="txtOrdPlanPK" /> 
                    <inout bind="lblPONo" />     
                    <inout bind="lblStyle" />                     
                 </inout>
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpcw00131" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fpcw00131"  > 
                <input> 
                    <input bind="txtOrdPlanPK" /> 
                    <input bind="lstComponent" /> 
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
                            Component
                        </td>
                        <td style="width: 29%; white-space: nowrap">
                            <gw:list id="lstComponent" text="" styles="width:100%" onchange="OnSearch('grdOrdPlan')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" styles='width:100%' onclick="data_fpcw00131.Call('SELECT')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td style="width: 100%">
                <gw:grid id='grdDetail' header='Comp ID|Comp Name|Spec 01|Spec 02|Spec 03|_Spec 04|_Spec 05|Card ID|Prod Qty|Defect Qty'
                    format='0|0|0|0|0|0|0|0|0|0' aligns='1|1|1|1|1|1|1|1|3|3' defaults='|||||||||' editcol='0|0|0|0|0|0|0|0|0|0'
                    widths='1500|2500|1200|1200|1200|1200|1200|1500|1200|1200' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------->
<gw:textbox id="txtOrdPlanPK" text="" styles="width:100%;display:none" />
<!------------------------------------------------------->
</html>
