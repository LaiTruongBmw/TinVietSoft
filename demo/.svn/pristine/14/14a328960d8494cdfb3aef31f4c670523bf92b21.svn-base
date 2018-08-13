<!-- #include file="../../../../system/lib/form.inc"  -->

<%  
CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Employees Entry</title>
</head>

<script>

var G_EMP_PK		= 0,
	G_EMP_ID		= 1,
	G_EMP_NAME		= 2,
	G_JOIN_DT		= 3,
	G_BIRTH_DT		= 4,
	G_DEPT_NAME		= 5;

<!-------------------------------------------------------------------------------------------->
function BodyInit()
{
    BindingDataList();
    txtEmployee.GetControl().focus();
}
<!-------------------------------------------------------------------------------------------->
function BindingDataList()
{   
	var data = "";
	
	data = "<%=CtlLib.SetListDataSQL("SELECT PK, ORG_ID || ' * ' || ORG_NM FROM TCO_ORG WHERE DEL_IF = 0 ORDER BY 2")%>||Select ALL";
	lstDept.SetDataText(data);
	lstDept.value = "";
	
	data = "<%=CtlLib.SetGridColumnDataSQL(" SELECT PK, ORG_ID || ' * ' || ORG_NM FROM TCO_ORG WHERE DEL_IF = 0 ORDER BY 2 " ) %> ";       
    idGrid.SetComboFormat(G_DEPT_NAME,data); 
}
<!-------------------------------------------------------------------------------------------->
function OnSearch()
{  
	getEmployee.Call('SELECT');
}
<!-------------------------------------------------------------------------------------------->
function OnAddNew()
{
	if ( lstDept.value != "" )
	{
		idGrid.AddRow();
		idGrid.SetGridText( idGrid.rows-1, G_DEPT_NAME, lstDept.value );
	}
	else
	{
		alert("PLS SELECT DEPT FIRST !");
	}
} 
<!-------------------------------------------------------------------------------------------->
function OnDelete()
{
	idGrid.DeleteRow();
}
<!-------------------------------------------------------------------------------------------->
function OnSave()
{
	getEmployee.Call();
} 
<!-------------------------------------------------------------------------------------------->
</script>

<body>
<!------------------------------------------------------------------------------------------>
<gw:data id="getEmployee"  > 
    <xml> 
        <dso type="grid" parameter="0,1,2,3,4,5" function="st_lg_sel_agds00010" procedure="st_lg_upd_agds00010"  > 
            <input> 
                <input bind="lstDept" />                 
                <input bind="txtEmployee" />
             </input>
            <output  bind="idGrid"/>
        </dso> 
    </xml> 
</gw:data> 
<!------------------------------------------------------------------------------------------>
<table style="width:100%;height:100%" align="center"   >
  <tr style="height:1%">
		<td width="5%">
			Dept
		</td>
		<td width="45%">
			<gw:list id="lstDept"></gw:list>
		</td>
		<td width="5%">
			Emp
		</td>		 
		<td width="41%">
			<gw:textbox id="txtEmployee" ></gw:textbox>
		</td>
		<td align="right" width="1%">
			<gw:imgBtn id="idSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
		</td>
		<td align="right" width="1%">
			<gw:imgBtn id="idAddNew" img="new" alt="Add New" text="Add New" onclick="OnAddNew()" />
		</td>
		<td align="right" width="1%">
			<gw:imgBtn id="idDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
		</td>
		<td align="right" width="1%">
			<gw:imgBtn id="idSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
		</td>
  </tr>
  
  <tr style="height:99%">
	  <td colspan = "8">
		<gw:grid   
        id="idGrid"  
        header="_PK|Emp ID|Emp Name|Join Dt|Birth Dt|Dept Name"   
        format="0|0|0|4|4|0"  
        aligns="0|0|0|1|1|0"  
        defaults="|||||"  
        editcol="1|1|1|1|1|1"  
        widths="0|1500|3000|1200|1200|1500"  
        styles="width:100%; height:100%"   
        sorting="T"   
        param="0,1,2,3,4,5" /> 
	</td>
  </tr>
</table>
</body>
</html>
