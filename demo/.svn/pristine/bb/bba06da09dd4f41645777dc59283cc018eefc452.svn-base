<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP UP GET OUT COMPONENT</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script> 
    
var G_COMP_PK       = 0,
    G_Seq           = 1,
    G_COMP_OUT_PK   = 2,
    G_COMP_ID       = 3,
    G_COMP_NAME     = 4,
    G_Description   = 5;

var p_pp_ordplan_pk        = "<%=request.QueryString("pp_ordplan_pk") %>"  ;

//=======================================================================
function BodyInit()
{
    System.Translate(document); 
    txtOrdPlanPK.text = p_pp_ordplan_pk ;                         
}
//=======================================================================

 function OnSearch()
 {
    data_fppr00042.Call('SELECT')
 }
   
//=======================================================================
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

//=======================================================================
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
        case 'data_fppr00042' :
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBgColor( 1, G_Seq, grdDetail.rows - 1, G_Seq, 0xCCFFFF );
            }
        break;
    }    
}
//=======================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00042" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="<%=l_user%>lg_sel_fppr00042"  > 
			    <input bind="grdDetail" >
			        <input bind="txtOrdPlanPK" />			
			    </input> 
			    <output bind="grdDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right">
            </td>
            <td style="width: 85%">
            </td>
            <td style="width: 8%" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdDetail)" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel(grdDetail)" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="5">
                <gw:grid id='grdDetail' header='_PK|Seq|_comp_pk|COMP ID|COMP Name|Description'
                    format='0|0|0|0|0|0' aligns='0|1|0|0|0|0' editcol='0|0|0|0|0|0' widths='0|800|0|2000|4000|1000'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick='OnSelect(grdDetail)' />
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
<gw:textbox id="txtOrdPlanPK" text="" styles="display:none" />
<!---------------------------------------------------------------------->
</html>
