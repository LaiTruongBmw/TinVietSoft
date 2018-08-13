<!-- #include file="../../../../system/lib/form.inc"  -->

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Project</title>
  </head>

<%  CtlLib.SetUser(Session("APP_DBUSER"))%><script>

function BodyInit()
{
    
}

function onSearch()
{
    idData_dsql_tac_abpl.Call();
}

function OnDBClick()
{
    var data = new Array();
    
    for ( var i=0; i<grdProj.cols-1; i++)
    {
        data[i] = grdProj.GetGridData(grdProj.row, i);
    }
    
    window.returnValue = data;
    window.close();
}
</script>
<body>
<gw:data id="idData_dsql_tac_abpl"  onreceive="" > 
    <xml> 
       <dso id="1" type="grid"  function="ac_sel_60010100_popup" > 
            <input  bind="grdProj">
                <input bind="txtProj" />
            </input> 
            <output bind="grdProj" /> 
        </dso> 
    </xml> 
</gw:data> 

<table style="width:100%;height:100%" border="0">
    <tr height="2%">
        <td width="15%"><b>&nbsp; Project</b></td>
        <td width="85%"><gw:textbox id="txtProj" style="width: 100%" ></gw:textbox></td>
        <td width=""><gw:imgBtn img="search" alt="Search" onclick ="onSearch()"/></td
    </tr>
    <tr height="98%">
        <td colspan="4">
             <div style="width:100%; height:94%; overflow:auto;">
					<gw:datagrid   
                id="grdProj"
                header="Project Code|Project Name|_PK"
                format="0|0|0"
                aligns="0|0|0"
                defaults="||"
                editcol="0|0|0"
                widths="100|500|0"
                styles="width:100%; height:100%"
                sorting="T"
                paging="true" pageview="20"
                oncelldblclick="OnDBClick()"
                param="0,1,2"/>
                </div>
        </td>
    </tr>
</table>
</body>
</html>
