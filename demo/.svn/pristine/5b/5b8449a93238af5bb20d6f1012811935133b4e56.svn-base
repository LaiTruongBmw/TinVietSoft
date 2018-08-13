<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Get One Process</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_PK            = 0,
    G_Process_ID    = 1,
    G_Process_Name  = 2,
    G_Process_Price = 3,
    G_Labour_Price  = 4,
    G_CCY           = 5,
    G_USE           = 6,
    G_Description   = 7,
    G_ATT01         = 8,
    G_ATT02         = 9,
    G_ATT03         = 10,
    G_ATT04         = 11,
    G_ATT05         = 12;
 //---------------------------------------------------------
  
function BodyInit()
{
    System.Translate(document);
    var tco_stitem_pk;

    tco_stitem_pk = "<%=Request.querystring("tco_stitem_pk")%>";    
    
    if ( Number(tco_stitem_pk) > 0 )
    {
        txtSTitemPK.text = tco_stitem_pk;
    }
    //----------------------------------------
    
    grdProcess.GetGridControl().ColFormat(G_Process_Price) = "###,###,###,###,###.##";
    grdProcess.GetGridControl().ColFormat(G_Labour_Price)  = "###,###,###,###,###.##";        
    //----------------------------------------  
     
    OnSearch();
    //----------------------------------------      
}
//-----------------------------------------------------------------------------------------------
function OnSearch()
{
     datGetOneProcess.Call("SELECT");
}
//-----------------------------------------------------------------------------------------------

function OnGridCellDoubleClick(oGrid)
{
    var code_data = new Array()
    
    if ( oGrid.row > 0 )
    {
        for( j=0 ; j<oGrid.cols -1 ; j++ )
        {
            code_data[j] = oGrid.GetGridData( oGrid.row, j );
        } 
    }
    
    window.returnValue = code_data; 
    this.close(); 	
} 
//==============================================================
function OnCancel()
{
    var code_data = new Array()
    
    for( j=0 ; j < grdProcess.cols ; j++ )
    {
        code_data[j] = '' ;
    } 
	    
    window.returnValue = code_data; 
    this.close(); 	
}  
//==============================================================
</script>

<body>
    <!--------------------------------------------->
    <gw:data id="datGetOneProcess" onreceive=""> 
    <xml> 
           <dso id="1" type="grid" function="st_lg_sel_fpab00010" > 
                  <input bind="grdProcess" > 
                    <input bind="txtSTitemPK" />
                    <input bind="txtProcess" />					                 
                  </input>
                <output bind="grdProcess" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------->
    <table class="table" style="width: 100%; height: 100%" border="1">
        <tr style="height: 2%">
            <td>
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td style="width: 10%" align="right">
                            Process
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtProcess" text="" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 58%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSearch1" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:grid id='grdProcess' header='_PK|Process ID|Process Name|Process Price|Labour Price|CCY|_USE|Description|_ATT01|_ATT02|_ATT03|_ATT04|_ATT05'
                    format='0|0|0|1|1|0|3|0|0|0|0|0|0' aligns='0|0|0|3|3|1|0|0|0|0|0|0|0' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='1000|1500|2500|1500|1500|800|1000|1000|1000|1000|1000|1000|1000' sorting='T'
                    styles='width:100%; height:100%' oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
    </table>
    <!--------------------------------------------->
    <gw:textbox id="txtSTitemPK" styles="display:none" />
    <!--------------------------------------------->
</body>
</html>
