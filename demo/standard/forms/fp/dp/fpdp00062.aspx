<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP UP GET PATTERN GROUP</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>     
var G_Pattern    = 0,
    G_Group_PK   = 1,
    G_Group_ID   = 2,
    G_Group_Name = 3;

//=======================================================================
function BodyInit()
{
    System.Translate(document);
    //---------------------------                  
    var data ;
    
    data = "<%=ESysLib.SetListDataSQL("SELECT   pk, pattern_id || ' - ' || pattern_name FROM tlg_pt_pattern WHERE del_if = 0 and use_yn = 'Y' ORDER BY pattern_id ")%>||";     
    lstPattern.SetDataText(data);
    //---------------------------                  
    var pattern_pk    = "<%=request.QueryString("pattern_pk") %>"  ;

    if ( Number(pattern_pk) > 0 )
    {     
        lstPattern.SetEnable(false); 
        lstPattern.value = pattern_pk ;
    }
    //---------------------------                  
    var ctrl = grdDetail.GetGridControl() ;      
    ctrl.MergeCells  = 2 ;	      
    ctrl.MergeCol(0) = true ;	
    //---------------------------                  
    data_fpdp00062.Call("SELECT");
}
//=======================================================================

 function OnSearch()
 {
    data_fpdp00062.Call('SELECT')
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
        case 'data_fpdp00062' :
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
    <gw:data id="data_fpdp00062" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="<%=l_user%>lg_sel_fpdp00062"  > 
			    <input bind="grdDetail" >
			        <input bind="lstPattern" />	
			        <input bind="txtGroup" />		
			    </input> 
			    <output bind="grdDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap">
                Pattern
            </td>
            <td style="width: 50%">
                <gw:list id="lstPattern" styles="width:100%" onchange="OnSearch()" />
            </td>
            <td style="width: 5%">
                Group
            </td>
            <td style="width: 37%">
                <gw:textbox id="txtGroup" styles='width:100%' onenterkey="OnSearch()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%">
                <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdDetail)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel(grdDetail)" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="7">
                <gw:grid id='grdDetail' header='Pattern|_PK|Group ID|Group Name|Description' format='0|0|0|0|0'
                    aligns='0|0|0|0|0' defaults='||||' editcol='0|0|0|0|0' widths='2000|0|2000|3000|0'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick='OnSelect(grdDetail)' />
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
</html>
