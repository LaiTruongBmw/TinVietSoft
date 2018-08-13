<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP UP GET PATTERN</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>     
var G1_PK           = 0,
    G1_Pattern_ID   = 1,
    G1_Pattern_Nm   = 2;

//=======================================================================
function BodyInit()
{
	System.Translate(document);
    //---------------------------                                 
    data_fpab00400.Call("SELECT");
}
//=======================================================================

 function OnSearch()
 {
    data_fpab00400.Call('SELECT')
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
        case 'data_fpab00400' :
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBgColor( 1, G1_Pattern_ID, grdDetail.rows - 1, G1_Pattern_ID, 0xCCFFFF );
            }
        break;
    }    
}
//=======================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00400" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="st_lg_sel_fpab00400"  > 
			    <input bind="grdDetail" >
			        <input bind="txtPattern" />		
			    </input> 
			    <output bind="grdDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%">
                ID/Name
            </td>
            <td style="width: 55%">
                <gw:textbox id="txtPattern" styles='width:100%' onenterkey="OnSearch()" />
            </td>
            <td style="width: 37%">
            </td>
            <td style="width: 1%">
                <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%">
                <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdDetail)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel(grdDetail)" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="6">
                <gw:grid id='grdDetail' header='_PK|Pattern ID|Patterm Nm' format='0|0|0' aligns='0|0|0'
                    editcol='0|0|0' widths='0|1500|2000' sorting='T' styles='width:100%; height:100%'
                    oncelldblclick='OnSelect(grdDetail)' />
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
<gw:textbox id="txtStylePK" styles='width:100%; display:none' onenterkey="" />
<!---------------------------------------------------------------------->
</html>
