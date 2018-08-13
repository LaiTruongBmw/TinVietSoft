<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Get Line Popup</title>
</head>

<script type="text/javascript" language="javascript">

var G_Line_PK       = 0,   
    G_Line_Group    = 1,
    G_Line_ID       = 2,
    G_Line_Name     = 3,
    G_Capa          = 4,
    G_Bus_PK        = 5,
    G_Bus_Partner   = 6,
    G_Use           = 7,
    G_Description   = 8,
    G_NULL01        = 9,
    G_NULL02        = 10;

//------------------------------------------------------

function BodyInit()
{ 
    System.Translate(document);
    var data = "<%=CtlLib.SetGridColumnDataSQL("SELECT   pk, GROUP_ID || ' - ' || group_name  FROM tlg_pb_line_group WHERE del_if = 0 ORDER BY GROUP_ID " ) %> ";       
    idGrid.SetComboFormat( G_Line_Group, data);
    
    data = "<%=CtlLib.SetListDataSQL("SELECT   pk, GROUP_ID || ' - ' || group_name  FROM tlg_pb_line_group WHERE del_if = 0 ORDER BY GROUP_ID ") %>|ALL|Select ALL" ;    
    lstLineGroup.SetDataText(data);    
    //----------------------------    
    data_fpab00200.Call("SELECT") ; 
    //---------------------------- 
}
 
//------------------------------------------------------
function OnSearch()
{
    data_fpab00200.Call("SELECT") ;      
     
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
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Line' :
            
        break;
    }    
}

//=======================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00200" onreceive=""> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00200" > 
                  <input bind="idGrid" > 
                    <input bind="lstLineGroup" /> 
                    <input bind="txtLine" /> 
                    </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 10%; white-space: nowrap" align="right">
                Line Group</td>
            <td style="width: 40%">
                <gw:list id="lstLineGroup" styles="width: 100%" onchange="OnSearch()" />
            </td>
            <td style="width: 10%" align="right">
                Line</td>
            <td style="width: 30%">
                <gw:textbox id="txtLine" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td style="width: 7%">
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="idSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel(idGrid)" />
            </td>
            <td style="width: 1%">
                <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid)" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="8">
                <gw:grid id="idGrid" header="_pk|Line Group|Line ID|Line Name|Capa|_tco_buspartner_pk|Bus Partner|Use|Description|_NULL|_NULL"
                    format="0|0|0|0|0|0|0|3|0|0|0" aligns="0|0|0|0|0|0|0|0|0|1|1" editcol="0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|2000|1500|1500|1500|0|2000|800|1000|1200|1200" styles="width:100%; height:100%"
                    sorting="T" oncelldblclick="OnSelect(idGrid)" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------>
</body>
</html>
