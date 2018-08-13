<!-- #include file="../../../system/lib/form.inc"  -->

<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Item</title>
  </head>
<%ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
     %>
<script>

function BodyInit()
{
    System.Translate(document); 
    idData_fpfa00293.Call('SELECT');
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
<gw:data id="idData_fpfa00293"  onreceive="" > 
    <xml> 
       <dso id="1" type="grid" user="acnt" function="<%=l_user%>lg_sel_fpfa00293" > 
            <input  bind="grdProj">
                <input bind="txtProject" />
                <input bind="txtItem" />
            </input> 
            <output bind="grdProj" /> 
        </dso> 
    </xml> 
</gw:data> 

<table width="100%" style="height:100%" border="0">
    <tr style="height:5%">
        <td width="15%"><b>&nbsp; Project</b></td>
        <td width="20%"><gw:textbox id="txtProject" style="width: 100%" ></gw:textbox></td>
        <td width="15%"><b>&nbsp; Item</b></td>
        <td width="20%"><gw:textbox id="txtItem" style="width: 100%" ></gw:textbox></td>
        <td width="3%"><gw:imgBtn img="search" alt="Search" onclick ="idData_fpfa00293.Call('SELECT')"/></td>
        <td width="27%"></td>
    </tr>
    <tr style="height:95%">
        <td colspan="6"> 
             <gw:grid
                id="grdProj"
                header="_pl_pk|Project|Item Name"
                format="0|0|0"
                aligns="0|0|0"
                defaults="||"
                editcol="0|0|0"
                widths="0|2500|2000"
                styles="width:100%; height:100%"
                sorting="T"
                oncelldblclick="OnDBClick()"
                param="0,1,2"/>
        </td>
    </tr>
</table>
</body>
<gw:textbox id="txtProjectPK" style="width: 100%;display:none" >
</html>

