<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP UP GET ORDER PLAN NO</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
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
    //---------------------------   
    System.Translate(document);                
    data_fppr00043.Call("SELECT");
}
//=======================================================================

 function OnSearch()
 {
    data_fppr00043.Call('SELECT')
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
        case 'data_fppr00043' :
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
    <gw:data id="data_fppr00043" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="<%=l_user%>lg_sel_fppr00043"  > 
			    <input bind="grdDetail" >
			        <input bind="txtSONo" />		
			    </input> 
			    <output bind="grdDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td align="right" style="width: 10%; white-space: nowrap">
                SO/PO/Style No</td>
            <td style="width: 40%">
                <gw:textbox id="txtSONo" styles='width:100%' csstype="mandatory" onenterkey="OnSearch(1)" />
            </td>
            <td align='right' style="width: 10%; white-space: nowrap">
            </td>
            <td style="width: 20%; white-space: nowrap">
            </td>
            <td style="width: 17%">
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch(1)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel(grdDetail)" />
            </td>
            <td align="right" style="width: 1%">
                <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdDetail)" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="8">
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
