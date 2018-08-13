<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Get Partner Group</title>
</head>

<script type="text/javascript" language="javascript">

var G_PK                    = 0,
    G_PARTNER_GROUP_ID      = 1,
    G_PARTNER_GROUP_NAME    = 2;
	
//======================================================================
    function BodyInit()
    {
	System.Translate(document);
        //-----------------------
        OnSearch();
    }
//======================================================================

    function OnSearch()
    {
        data_fpab00620.Call("SELECT")    
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
//======================================================================
</script>

<body>
    <!----------------------------------------------------->
    <gw:data id="data_fpab00620" onreceive=""> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00620" > 
                  <input bind="idGrid" > 
                    <input bind="txtID" /> 
                    <input bind="txtName" /> 
                    </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-- --------------------------------------------------  -->
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td style="width: 10%; white-space: nowrap" align="right">
                Partner Group ID</td>
            <td style="width: 30%">
                <gw:textbox id="txtID" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td style="width: 10%; white-space: nowrap" align="right">
                Partner Group Name</td>
            <td style="width: 40%" align="left">
                <gw:textbox id="txtName" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td style="width: 7%">
            </td>
            <td style="width: 1%">
                <gw:button id="idSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
			<td style="width: 1%" align="right">
                <gw:button id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel(idGrid)" />
            </td>
			<td style="width: 1%" align="right">
                <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid)" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="8">
                <gw:grid id="idGrid" header="_PK|Partner Group ID|Partner Group NM"
                    format="0|0|0" aligns="0|0|0" defaults="||" editcol="0|0|0"
                    widths="0|1500|2000" styles="width:100%; height:100%" sorting="T"
                    oncelldblclick="OnSelect(idGrid)"  param="0,1,2" />
            </td>
        </tr>
    </table>
</body>
</html>
