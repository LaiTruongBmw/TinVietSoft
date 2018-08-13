<!-- #include file="../../../../system/lib/form.inc"  -->

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Untitled Page</title>
</head>
<% CtlLib.SetUser(Session("APP_DBUSER"))%>
<script type="text/javascript" language="javascript">
var iDept_Id;
function BodyInit()
{
    System.Translate(document); 
    iDept_Id="<%=request.queryString("DeptId")%>";
    getDepartmentID.Call("SELECT");
    
}
function OnDataReceive(obj)
{
    if (obj.id=="getDepartmentID")
    {
        var i;
        var ctl=idGrid.GetGridControl();
        var old_row=0;
        ctl.OutlineBar=5;
        var j;
        for (i=1;i<idGrid.rows;i++)
      
        {   
            var sdept;
            sdept = idGrid.GetGridData(i,0);
            
            if (iDept_Id == sdept)
                idGrid.SetCellBgColor(i,0,i,3,0xd4d2ff);
            j=Find_Heigher_Level(idGrid.GetGridData(i,0),i);
                ctl.IsSubtotal(i)=true;
                ctl.RowOutlineLevel(i)=j;
           
        }
      
    }
}
function Find_Heigher_Level(value,row)
{
    var i=row;
    if (idGrid.GetGridData(row,0)=="1") 
        return 0;
    else
        while (i>=1)
        {
            if (idGrid.GetGridData(i,0)==value-1)
                return i;
            i=i-1
        }
}
function doExit()
{
	window.returnValue = null; 
	this.close();
}
</script>

<body>
<gw:data id="getDepartmentID"  onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="grid" parameter="0,1,2" function="ST_GS_SEL_GSOR00201_0" > 
            <input bind="idGrid"/> 
            <output  bind="idGrid"/>
        </dso> 
    </xml> 
</gw:data> 
<table style="margin-left:5" align="center" width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="95%" align=center><font size=4.0><b>DEPARTMENT SUMMARY</b></font></td>
	<td width="5%"><gw:button id="idClose" img="close" alt="Close" text="Close" onclick="window.close();" /></td>
			 
  </tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
  <tr>
	  <td colspan=2>
		<gw:grid   
        id="idGrid"  
        header="Level|Department ID|Department Name|Department Local Name|Department Foreign Name|Type|Start Date|End Date|Remark"   
        format="0|0|0|0|0|0|0|0|0"  
        aligns="0|0|0|0|0|0|0|0|0"  
        defaults="||||||||"  
        editcol="0|0|0|0|0|0|0|0|0"  
        widths="0|1400|2000|2100|2300|1200|1200|1200|1000"  
        styles="width:100%; height:350"   
        sorting="T"   
        param="0,1,2,3,4,5,6,7" /> 
	</td>
    
  </tr>

</table>
</body>
</html>
