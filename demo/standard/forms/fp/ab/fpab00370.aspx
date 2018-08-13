<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP UP GET PATTERN GROUP</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>     
var G_Pattern    = 0,
    G_Group_PK   = 1,
    G_Group_ID   = 2,
    G_Group_Name = 3,
    G_ST_Mat_PK  = 4,
    G_Mat_PK     = 5,
    G_Code       = 6,
    G_Name       = 7;

//=======================================================================
function BodyInit()
{
	System.Translate(document);
    //---------------------------                  
    var style_pk = "<%=request.QueryString("style_pk") %>"  ;

    if ( Number(style_pk) > 0 )
    {     
        txtStylePK.text = style_pk ;
    }
    //---------------------------                  
    var ctrl = grdDetail.GetGridControl() ;      
    ctrl.MergeCells  = 2 ;	      
    ctrl.MergeCol(0) = true ;	
    //---------------------------                  
    data_fpab00370.Call("SELECT");
}
//=======================================================================

 function OnSearch()
 {
    data_fpab00370.Call('SELECT')
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
        case 'data_fpab00370' :
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBgColor( 1, G_Group_ID, grdDetail.rows - 1, G_Group_Name, 0xCCFFFF );
            }
        break;
    }    
}
//=======================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00370" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="st_lg_sel_fpab00370"  > 
			    <input bind="grdDetail" >
			        <input bind="txtStylePK" />	
			        <input bind="txtGroup" />		
			    </input> 
			    <output bind="grdDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%">
                Group
            </td>
            <td style="width: 55%">
                <gw:textbox id="txtGroup" styles='width:100%' onenterkey="OnSearch()" />
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
                <gw:grid id='grdDetail' header='Pattern|_PK|Group ID|Group Name|_ST_Mat_PK|_Mat_PK|Code|Name' format='0|0|0|0|0|0|0|0'
                    aligns='0|0|0|0|0|0|0|0' defaults='|||||||' editcol='0|0|0|0|0|0|0|0' 
                    widths='1500|0|1500|2000|0|0|1500|1000'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick='OnSelect(grdDetail)' />
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
<gw:textbox id="txtStylePK" styles='width:100%; display:none' onenterkey="" />
<!---------------------------------------------------------------------->
</html>
