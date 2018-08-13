<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>P/O Component Stock</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 

var pp_ordplan_pk = "<%=request.QueryString("pp_ordplan_pk")%>";
 
var G_COMP_ID   = 0,
    G_COMP_NAME = 1,
    G_SPEC_01   = 2,
    G_SPEC_02   = 3,
    G_SPEC_03   = 4,
    G_SPEC_04   = 5,
    G_SPEC_05   = 6,
    G_STOCK_QTY = 7;
//======================================================================================
    
function BodyInit()
{
    System.Translate(document);
    txtOrdPlanPK.text = pp_ordplan_pk ;  
    
    FormatGrid();
     
    data_fpgm00122_1.Call("SELECT");
}
//======================================================================================
function FormatGrid()
{
      grdView.GetGridControl().MergeCells  = 4 ;	
      grdView.GetGridControl().MergeCol(0) = true ;	
      grdView.GetGridControl().MergeCol(1) = true ;   	
      grdView.GetGridControl().MergeCol(2) = true ;	
      grdView.GetGridControl().MergeCol(3) = true ;	
      grdView.GetGridControl().MergeCol(4) = true ;
      grdView.GetGridControl().MergeCol(5) = true ;
      grdView.GetGridControl().MergeCol(6) = true ;
}
//======================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {		
        case "data_fpgm00122_1":
             OnSearch('grdView');
        break;
        
		case "data_fpgm00122":
		     if ( grdView.rows > 1 )
		     {    		     		        
		         grdView.SetCellBold( 1, G_COMP_ID,   grdView.rows - 1, G_COMP_ID,   true);
		         grdView.SetCellBold( 1, G_STOCK_QTY, grdView.rows - 1, G_STOCK_QTY, true);
		     }
		break;
   }
}

//======================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdView' :
            data_fpgm00122.Call("SELECT");
        break;
    }
}
//======================================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpgm00122_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="control" function="<%=l_user%>lg_sel_fpgm00122_1" >
                <inout>
                    <inout bind="txtOrdPlanPK" /> 
                    <inout bind="lbPONo" />     
                    <inout bind="lbStyle" />                 
                 </inout>
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpgm00122" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fpgm00122"  > 
                <input> 
                    <input bind="txtOrdPlanPK" />
                </input> 
                <output bind="grdView" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <table style="width: 100%; height: 100%;" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%;">
                    <tr>
                        <td style="width: 5%" align="right">
                            P/O
                        </td>
                        <td style="width: 30%; white-space: nowrap">
                            <gw:label id="lbPONo" styles='width:100%;color:cc0000;font:9pt' text='' />
                        </td>
                        <td style="width: 5%" align="right">
                            Style
                        </td>
                        <td style="width: 59%; white-space: nowrap">
                            <gw:label id="lbStyle" styles='width:100%;color:cc0000;font:9pt' text='' />
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="btnSearch" img="2" text="Search" onclick="OnSearch('grdView')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td style="width: 100%">
                <gw:grid id='grdView' header='Comp ID|Comp Name|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|Stock Qty'
                    format='0|0|0|0|0|0|0|0' aligns='0|0|1|1|1|1|1|3' check='|||||||' editcol='0|0|0|0|0|0|0|0'
                    widths='1500|2500|1200|1200|1200|1200|1200|1000' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------->
<gw:textbox id="txtOrdPlanPK" text="" styles="width:100%;display:none" />
<!------------------------------------------------------->
</html>
