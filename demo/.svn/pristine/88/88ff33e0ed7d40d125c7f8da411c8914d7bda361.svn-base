<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Pop Up Get Warehouse</title>
</head>

<script type="text/javascript" language="javascript">
//--------------------------------------------------------------

function BodyInit()
{
    System.Translate(document);
	var data = "<%=CtlLib.SetListDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE b.GROUP_ID='LGIN0210' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM")%>||Select ALL";
    lstWHType.SetDataText(data);
    lstWHType.value = '' ;
	
    OnSearch();
}
//--------------------------------------------------------------

function OnSearch()
{
    data_fpab00240.Call("SELECT")    
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
    
    this.close(); 	
}

//--------------------------------------------------------------
    
</script>

<body>
	<!-- This is our html --------------------------------------------------  -->
    <gw:data id="data_fpab00240" onreceive=""> 
    <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00240" > 
                <input bind="idGrid" > 
				  	<input bind="lstWHType" />
                    <input bind="txtSearch" />
                </input> 
                <output bind="idGrid" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-- This is our html --------------------------------------------------  -->
    <table style="height: 100%; width: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr>
						<td style="width: 10%;white-space:nowrap" align="right">
                            W/H Type</td>
                        <td style="width: 30%">
                            <gw:list id="lstWHType" styles="width: 100%" onchange="OnSearch()" />
                        </td>
                        <td style="width: 10%" align="right">
                            ID/Name</td>
                        <td style="width: 30%">
                            <gw:textbox id="txtSearch" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 17%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="idSearch" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect(idGrid)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel(idGrid)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id="idGrid" 
					header="_PK|W/H ID|W/H NAME|_tin_storage_pk|Storage|_WH Item Class|Item Grade|_Item Use YN|_Outside YN|_Stock YN|_Use YN|_Start Date|_End Date|Description"
                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|2000|3000|2000|2000|2000|2000|2000|0|0|0|0|0|0" 
					styles="width:100%; height:100%"
                    sorting="T" oncelldblclick="OnSelect(idGrid)" 
					param="0,1,2,3,4,5,6,7,8,9,10,11,12,13" />
            </td>
        </tr>
    </table>
</body>

</html>
