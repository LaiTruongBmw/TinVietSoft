<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Monitoring Display : Line Daily Result</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 

var G_Line_ID           = 0, 
	G_Line_Name		    = 1,   
    G_Plan_Qty          = 2,
    G_Prod_Qty          = 3,
    G_Prod_Date         = 4,
    G_Remain_Qty        = 5;
//==============================================================================    
function BodyInit()
{
    System.Translate(document);
    var linegroup_pk = "<%=request.QueryString("line_pk") %>"  ;
    var date = "<%=request.QueryString("date") %>"  ;
    txtLinePK.text=linegroup_pk;
    txtDate.text=date;
    
    OnSearch();
    
}
//==============================================================================
function BindingDataList()
{    
 
}    
//==============================================================================
function GridFormat()
{
//      var trl ;
//      
//      trl = grdProduct.GetGridControl();
//          	
//      trl.ColFormat(G_Target_Qty ) = "###,###,###,###,###";
//      trl.ColFormat(G_Prod_Qty)    = "###,###,###,###,###";
//      trl.ColFormat(G_D1)          = "###,###,###,###,###"; 
//      trl.ColFormat(G_D2)          = "###,###,###,###,###";     
//      trl.ColFormat(G_D3)          = "###,###,###,###,###";
//      trl.ColFormat(G_D4)          = "###,###,###,###,###";
//      trl.ColFormat(G_D5)          = "###,###,###,###,###";
//      trl.ColFormat(G_D6)          = "###,###,###,###,###";
//      trl.ColFormat(G_D7)          = "###,###,###,###,###";
//      trl.ColFormat(G_D8)          = "###,###,###,###,###";
//      trl.ColFormat(G_Bal_Qty)     = "###,###,###,###,###";
//	  
//	  trl.MergeCells  = 2 ;	
//      trl.MergeCol(0) = true ;
//	  //-----------------------------------          	
//      
//      trl = grdDefect.GetGridControl();
//            	
//      trl.ColFormat(G_Target_Qty ) = "###,###,###,###,###";
//      trl.ColFormat(G_Prod_Qty)    = "###,###,###,###,###";
//      trl.ColFormat(G_D1)          = "###,###,###,###,###"; 
//      trl.ColFormat(G_D2)          = "###,###,###,###,###";     
//      trl.ColFormat(G_D3)          = "###,###,###,###,###";
//      trl.ColFormat(G_D4)          = "###,###,###,###,###";
//      trl.ColFormat(G_D5)          = "###,###,###,###,###";
//      trl.ColFormat(G_D6)          = "###,###,###,###,###";
//      trl.ColFormat(G_D7)          = "###,###,###,###,###";
//      trl.ColFormat(G_D8)          = "###,###,###,###,###";
//      trl.ColFormat(G_Bal_Qty)     = "###,###,###,###,###";   
//	  
//	  trl.MergeCells  = 2 ;	
//      trl.MergeCol(0) = true ;	           
}
//==============================================================================
function OnSearch()
{
     data_fpgm00067.Call("SELECT");
}
//==============================================================================
function OnDataReceive(obj)
{
   
} 

//==============================================================================

//==============================================================================


//==============================================================================

//==========================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpgm00067" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fpgm00066_detail"  > 
                <input> 
                    <input bind="txtLinePK" /> 
                     <input bind="txtDate" />                   
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>

    <!------------------------------------------------------------------>

    <!------------------------------------------------------------------->
    <table style="width: 100%; height: 100%;" border="1">
        <tr style="height: 49%">
            <td style="width: 100%">
                <gw:grid id='grdDetail' header='Line ID |Line Name|Plan Qty|Prod Qty|Prod Date|Remain Qty'
                    format='0|0|1|1|4|1' aligns='0|0|0|0|0|0' check='|||||' editcol='0|0|0|0|0|0'
                    widths='1000|2000|1200|1200|1200|1000' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------->
<gw:textbox id="txtLinePK" styles='display:none;width:100%' />
<gw:textbox id="txtDate" styles='display:none;width:100%' />
<!------------------------------------------------------->
</html>
