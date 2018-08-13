<!-- #include file="../../../../system/lib/form.inc"  -->

<%CtlLib.SetUser("comm")%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Employees List</title>
</head>
<script>
function BodyInit()
{
    BindingDataList();
    txtKeyWord.GetControl().focus();
}
function BindingDataList()
{   
  lstDept.SetDataText("<%=CtlLib.SetListDataSQL("SELECT PK, ORG_ID ||'-'|| ORG_NM FROM COMM.TCO_ORG WHERE DEL_IF = 0 ORDER BY 2")%>|ALL|Select All");
  lstDept.value = "ALL";
}

function doSearch()
{
   // alert(lstDept.value);
	getEmployee.Call('SELECT');
}

function doSelect()
{
	var r_data = new Array()
	var ctrl = idGrid.GetGridControl();
    
	if(ctrl.row > 0 ) {
		r_data[0]		= idGrid.GetGridData( ctrl.row , 0 ); //pk
		r_data[1] 		= idGrid.GetGridData( ctrl.row , 3 ); //name
		r_data[2] 		= idGrid.GetGridData( ctrl.row , 5 ); //tel
		r_data[3] 		= idGrid.GetGridData( ctrl.row , 6 ); //mobile
		r_data[4] 		= idGrid.GetGridData( ctrl.row , 7 ); //JOB TYPE
		r_data[5] 		= idGrid.GetGridData( ctrl.row , 8 ); // living addr
		r_data[6] 		= idGrid.GetGridData( ctrl.row , 9 ); // POSITION
	    r_data[7] 		= idGrid.GetGridData( ctrl.row , 10 ); // Department name
	    r_data[8] 		= idGrid.GetGridData( ctrl.row , 4 ); // employee id
	    r_data[9] 		= idGrid.GetGridData( ctrl.row , 2 ); // GROUP NAME
		window.returnValue = r_data; 
	}
	this.close();
}
function OnSelectAll()
{	
    var ctrl=idGrid.GetGridControl();
    if( chkSelectAll.GetData()=='T')
    {
        for(var i=1;i<ctrl.rows;i++)
        idGrid.SetGridText(i,0,"-1");
    }
	else
	{
            for(var i=0;i<ctrl.rows;i++)
            idGrid.SetGridText(i,0,"0");
    }        

}
</script>

<body>
<gw:data id="getEmployee"  > 
    <xml> 
        <dso type="grid" parameter="0,1,2" function="comm.sp_get_user_entry_popup" > 
            <input> 
                <input bind="lstDept" />
                <input bind="lstKey" />
                <input bind="txtKeyWord" />
             </input>
            <output  bind="idGrid"/>
        </dso> 
    </xml> 
</gw:data> 
<table style="margin-left:5" align="center" width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="10%">Department:</td>
	<td width="40%"><gw:list id="lstDept"></gw:list></td>
	<td width="5%">Key</td>
	<td width="15%"><gw:list id="lstKey"><data>DATA|0|Emp Name|1|Emp ID</data></gw:list></td>
	<td width="25%"><gw:textbox id="txtKeyWord" ></gw:textbox></td>
    <td align="right" width="5%"><gw:imgBtn id="idSearch" img="search" alt="Search" text="Search" onclick="doSearch();" /></td>
  </tr>
  <tr>
        <td><gw:checkbox id="chkSelectAll" value="F" onclick="OnSelectAll()" />Select All</td>
        <td ></td>
        <td ></td>
    </tr>  
  <tr>
	  <td colspan = "6">
		<gw:grid   
        id="idGrid"  
        header="_PK|_Department|_Group|Emp Name|Emp ID|_Tel|_Mobile|_Address|_LivingAddress|_UrgentContact|Dept Name"   
        format="0|0|0|0|0|0|0|0|0|0|0"  
        aligns="0|0|0|0|0|0|0|0|0|0|0"  
        defaults="||||||||||"  
        editcol="0|0|0|0|0|0|0|0|0|0|0"  
        widths="0|1500|0|3000|1000|0|0|0|0|0|0"  
        styles="width:100%; height:400"   
        sorting="T"   
        param="0,1,2,3,4,5,6,7,8,9,10" oncelldblclick ="doSelect()" /> 
	</td>
  </tr>
</table>
</body>
</html>
