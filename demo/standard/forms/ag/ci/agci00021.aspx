<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Parent S.Group</title>
</head>

<script type="text/javascript" language="javascript">

var G_PK                = 0,
    G_Spec_ID           = 1,
    G_Spec_Name_EN      = 2,
    G_Spec_Name_Local   = 3,
    G_Spec_Name_Foreign = 4,
    G_Active            = 5,
    G_PARENT_SPEC       = 6; 
    
var pk = <%=Request.QueryString("p_pk")%>;
//======================================================
function BodyInit()
{    
    System.Translate(document); 
    txtP_PK.text = pk;
    OnSearch();
}
//======================================================

function OnSearch()
{
    data_agci00021.Call('SELECT');
}
//======================================================

function OnSelect()
{
    var code_data=new Array()
	var ctrl = grdSpecG.GetGridControl();
	var index, rowNo
	
	index =0;
	rowNo = 0 ;
	
	if(ctrl.SelectedRows == 0)
    {
           return ;
    }
    else
	{
	    for(i=0; i < ctrl.SelectedRows; i++)
		{	  
		        rowNo = ctrl.SelectedRow(i)
		        for(j=0; j < grdSpecG.cols -1; j++)
	        	{
            		code_data[index] = grdSpecG.GetGridData(rowNo , j );
            		index ++;
            	}        
		}
	}
	window.returnValue = code_data; 
	this.close(); 	
}
//===================================================================

function OnCancel()
{
    var code_data=new Array()
    
    for( j=0 ; j < grdSpecG.cols ; j++ )
    {
        code_data[j] = '' ;
    } 
	    
    window.returnValue = code_data; 
    this.close(); 	
}

//======================================================

function OnDataReceive()
{
    if ( grdSpecG.rows > 1 )
    {
        textParent.text = grdSpecG.GetGridData(1, G_PARENT_SPEC);
        lbRecord.text = grdSpecG.rows-1 + " record(s)";
    }    
}
//======================================================

</script>

<body>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_agci00021" onreceive="OnDataReceive()">
        <xml>
            <dso id="1" type="grid" function="st_lg_sel_agci00021">
                <input bind="grdSpecG" >
                    <input bind="txtCode" />
                    <input bind="txtP_PK" />
                </input>
                <output bind="grdSpecG" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 40%; white-space: nowrap" align="center">
                            <gw:label id="textParent" styles='width:100%;color:blue;font:9pt'></gw:label>
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="center">
                            <gw:label id="lbRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 10%; white-space: nowrap">
                            Spec
                        </td>
                        <td style="width: 28%; white-space: nowrap">
                            <gw:textbox id="txtCode" styles="width: 100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 1%; white-space: nowrap">
                            <gw:imgbtn id="btnSearch" img="search" onclick="OnSearch()" alt="Search" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id="grdSpecG" header="_PK|S.Code ID|S.Code|_S.Code(Local)|_S.Code(Foreign)|Active|_PARENT_SPEC"
                    format="0|0|0|0|0|3|0" aligns="0|0|0|0|0|0|0" defaults="|||||-1|" editcol="0|0|0|0|0|0|0"
                    widths="0|1500|5500|1500|1500|1000|0" styles="width:100%;height:100%" oncelldblclick="OnSelect()" />
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
    <gw:textbox id="txtP_PK" styles="display: none" />
    <!--------------------------------------------------------->
</body>
</html>
