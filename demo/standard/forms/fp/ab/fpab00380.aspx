<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>POP UP BUSINESS P/L CENTER : LOGISTIC </title>
</head>

<script type="text/javascript" language="javascript">

var G_GROUP_PK      = 0,
    G_GROUP_ID      = 1,
    G_GROUP_NAME    = 2,
	G_CENTER_PK     = 3,
    G_CENTER_ID     = 4,
    G_CENTER_NAME   = 5,
    G_PLCENTER_PK   = 6;

//------------------------------------------------------

function BodyInit()
{ 
	System.Translate(document);
    //-----------------------------------    

    idGrid.GetGridControl().MergeCells  = 2 ;	
    idGrid.GetGridControl().MergeCol(0) = true ;	
    idGrid.GetGridControl().MergeCol(1) = true ;   	
    idGrid.GetGridControl().MergeCol(2) = true ;	
    
    //----------------------------    
    data_fpab00380.Call("SELECT") ; 
    //---------------------------- 
}
 
//------------------------------------------------------
function OnSearch()
{
    data_fpab00380.Call("SELECT") ;      
     
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
    switch(obj.id)
    {
        case "data_fpab00380": 
            if ( idGrid.rows > 1 )
            {        
	            idGrid.SetCellBold( 1, G_CENTER_ID, idGrid.rows - 1, G_CENTER_ID, true);
	            idGrid.SetCellBold( 1, G_GROUP_ID,  idGrid.rows - 1, G_GROUP_ID,  true);
            }	            
        break;
    }
}  

//=======================================================================
      
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_fpab00380" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00380" > 
                  <input bind="idGrid" > 
                    <input bind="txtPLCenter" /> 
                    </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 10%; white-space:nowrap" align="right">
                Center</td>
            <td style="width: 50%">
                <gw:textbox id="txtPLCenter" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td style="width: 37%">
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
            <td colspan="6">
                <gw:grid id="idGrid" header="_PL_PK|Group ID|Group Name|_CenterPK|Center ID|Center Name|_PLCenterPK"
                    format="0|0|0|0|0|0|0" 
                    aligns="0|0|0|0|0|0|0" 
                    editcol="0|0|0|0|0|0|0"
                    widths="0|1500|3000|0|1500|3000|0" styles="width:100%; height:100%"
                    sorting="T" oncelldblclick="OnSelect(idGrid)" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------>
</body>
</html>
