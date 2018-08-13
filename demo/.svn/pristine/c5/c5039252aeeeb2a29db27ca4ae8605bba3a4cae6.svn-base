<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP UP GET ORDER PLAN NO</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 
    
var G_OrdPlanPK     = 0,
    G_Array_SO_PK   = 1,
    G_PO_No         = 2,
    G_From          = 3,
    G_To            = 4,
    G_Style_PK      = 5,
    G_Style_Code    = 6,
    G_Style_Name    = 7;
    
//=======================================================================
function BodyInit()
{
	System.Translate(document);
    var data="";    
        
    data = "<%=CtlLib.SetListDataSQL("select pk, factory_name from tlg_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||ALL FACTORY";
    lstFactory.SetDataText( data);
    lstFactory.value = '' ;	
	
    //---------------------------                  
    data_fpab00360.Call("SELECT");
}
//=======================================================================

 function OnSearch()
 {
    data_fpab00360.Call('SELECT')
 }
   
//======================================================================
function OnSelect(oGrid)
{
        var code_data = new Array();       
	    
	    if ( oGrid.row > 0 )
	    {
            for( j=0 ; j<oGrid.cols ; j++ )
            {
                code_data[j] = oGrid.GetGridData(oGrid.row , j );
            } 
	    }
	    else
	    {
            for( j=0 ; j<oGrid.cols ; j++ )
            {
                code_data[j] = '';
            } 	    
	    }
	    //----------------------------
	    window.returnValue = code_data; 
	    this.close(); 	
}

//======================================================================
function OnCancel(oGrid)
{
    var code_data=new Array()
    
    for( j=0 ; j < oGrid.cols ; j++ )
    {
        code_data[j] = '' ;
    } 
	    
    window.returnValue = code_data; 
    this.close(); 	
}
//=======================================================================

function OnDataReceive(obj)
{
    switch ( obj.id )
    {
        case 'data_fpab00360' :
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBgColor( 1, G_Style_Code, grdDetail.rows - 1, G_Style_Name, 0xCCFFFF );
                grdDetail.SetCellBold( 1, G_PO_No, grdDetail.rows-1, G_PO_No, true);
            }
        break;
    }    
}
//=======================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00360" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="st_lg_sel_fpab00360"  > 
			    <input bind="grdDetail" >
					<input bind="lstFactory" />
			        <input bind="txtSONo" />		
			    </input> 
			    <output bind="grdDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
			<td style="width: 5%; white-space: nowrap" align="right">
       			Factory
			</td>
   			<td style="width: 30%">
       			<gw:list id="lstFactory" text="" styles="width:100%" onchange="OnSearch(1)" />
   			</td>								
            <td align="right" style="width: 10%; white-space: nowrap">
                SO/PO/Style No</td>
            <td style="width: 30%">
                <gw:textbox id="txtSONo" styles='width:100%' csstype="mandatory" onenterkey="OnSearch(1)" />
            </td>
            <td style="width: 20%; white-space: nowrap">
            </td>
            <td style="width: 2%">
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="search" alt="Search" id="btnSearch" onclick="OnSearch(1)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel(grdDetail)" />
            </td>
            <td align="right" style="width: 1%">
                <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdDetail)" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="9">
                <gw:grid id='grdDetail' header='_OrdPlanPK|_ArraySOPK|P/O No|From|To|_Style_PK|Code|Name'
                    format='0|0|0|4|4|0|0|0' aligns='0|0|0|1|1|0|0|0' defaults='|||||||' editcol='0|0|0|0|0|0|0|0'
                    widths='0|0|2000|1200|1200|0|2000|1000' sorting='T' styles='width:100%; height:100%'
                    oncelldblclick="OnSelect(grdDetail)" />
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
</html>
