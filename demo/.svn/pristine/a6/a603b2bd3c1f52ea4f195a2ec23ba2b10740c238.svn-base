<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>P/O W/Processing Detail</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 

var type               = "<%=request.QueryString("type") %>";
var pp_ordplan_pk      = "<%=request.QueryString("pp_ordplan_pk") %>";
var pb_work_process_pk = "<%=request.QueryString("pb_work_process_pk") %>";
 
var G_ORDPLAN_PK    = 0,
    G_PO_NO         = 1,
    G_STYLE_PK      = 2,
    G_Style_Code    = 3,
    G_Style_Name    = 4,
    G_WP_PK         = 5,
    G_WProcess      = 6,
    G_COMPONENT_PK  = 7,
    G_Component     = 8,
    G_Card_ID       = 9,
    G_Card_Qty      = 10,
    G_Spec_01       = 11,
    G_Spec_02       = 12,
    G_Spec_03       = 13,
    G_Spec_04       = 14,
    G_Spec_05       = 15,
    G_Print_Time    = 16,    
    G_Scan_Time     = 17,
    G_Charger_01    = 18,
    G_Charger_02    = 19;
//======================================================================================
    
function BodyInit()
{
    System.Translate(document);
    txtType.text          = type ;
    txtOrdPlanPK.text     = pp_ordplan_pk ;  
    txtWorkProcessPK.text = pb_work_process_pk ;
    
    FormatGrid();
     
    data_fpgm00121_1.Call("SELECT");
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
      grdView.GetGridControl().MergeCol(7) = true ;
      grdView.GetGridControl().MergeCol(8) = true ;
}
//======================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {		
        case "data_fpgm00121_1":
            OnSearch('grdView');
        break;
        
		case "data_fpgm00121":
		     if ( grdView.rows > 1 )
		     {    		     		        
		         grdView.SetCellBold( 1, G_WProcess, grdView.rows - 1, G_WProcess, true);
		         grdView.SetCellBold( 1, G_PO_NO,    grdView.rows - 1, G_PO_NO,    true);
		         grdView.SetCellBold( 1, G_Card_Qty, grdView.rows - 1, G_Card_Qty, true);
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
            data_fpgm00121.Call("SELECT");
        break;
    }
}
//======================================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpgm00121_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="control" function="<%=l_user%>lg_sel_fpgm00121_1" >
                <inout>
                    <inout bind="txtWorkProcessPK" /> 
                    <inout bind="lbWorkProcess" />                      
                 </inout>
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpgm00121" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fpgm00121"  > 
                <input> 
                    <input bind="txtType" />
                    <input bind="txtOrdPlanPK" />
                    <inout bind="txtWorkProcessPK" /> 
                    <input bind="chkShowALL" /> 
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
                            W/Process
                        </td>
                        <td style="width: 90%; white-space: nowrap">
                            <gw:label id="lbWorkProcess" styles='width:100%;color:cc0000;font:9pt' text='' />
                        </td>
                        <td style="width: 5%; white-space: nowrap">
                            Show ALL
                            <gw:checkbox id="chkShowALL" styles="color:blue" defaultvalue="Y|N" value="Y" onclick="OnSearch(this)"></gw:checkbox>
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
                <gw:grid id='grdView' 
                    header='_PP_ORDPLAN_PK|P/O No|_STYLE_PK|Style Code|Style Name|_PB_WORK_PROCESS_PK|W/Process|_PT_COMPONENT_PK|Component|Card ID|Card Qty|Spec 01|Spec 02|Spec 03|Spec 04|Spec 05|Print Time|Scan Time|Charger 01|Charger 02'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                    aligns='0|0|0|0|0|0|0|0|0|1|3|1|1|1|1|1|0|0|0|0'
                    check='|||||||||||||||||||' 
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                    widths='0|1500|0|1500|3000|0|1500|0|2500|2000|1500|1200|1200|1200|1200|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------->
<gw:textbox id="txtOrdPlanPK" text="" styles="width:100%;display:none" />
<gw:textbox id="txtType" text="" styles="width:100%;display:none" />
<gw:textbox id="txtWorkProcessPK" text="" styles="width:100%;display:none" />
<!------------------------------------------------------->
</html>
