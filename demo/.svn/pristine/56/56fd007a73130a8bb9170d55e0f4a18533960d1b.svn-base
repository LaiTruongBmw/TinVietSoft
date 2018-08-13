<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>Employees List</title>
</head>
<script>

function BodyInit()
{
    txtKeyWord.GetControl().focus();
	txtClient.SetEnable(false);
	OnShowDepartmentList();
}
function OnSearch()
{
   getEmployee.Call("SELECT");
}

function doSelect()
{
	var r_data = new Array()
	//var ctrl = idGrid.GetGridControl();
    
	if(idGrid.row > 0 ) {
		r_data[0]		= idGrid.GetGridData( idGrid.row , 0 ); //pk
		r_data[1] 		= idGrid.GetGridData( idGrid.row , 3 ); //name
		r_data[2] 		= idGrid.GetGridData( idGrid.row , 5 ); //tel
		r_data[3] 		= idGrid.GetGridData( idGrid.row , 6 ); //mobile tele
		r_data[4] 		= idGrid.GetGridData( idGrid.row , 7 ); //JOB TYPE
		r_data[5] 		= idGrid.GetGridData( idGrid.row , 8 ); // living addr
		r_data[6] 		= idGrid.GetGridData( idGrid.row , 9 ); // POSITION
	    r_data[7] 		= idGrid.GetGridData( idGrid.row , 10 ); // Department name
	    r_data[8] 		= idGrid.GetGridData( idGrid.row , 4 ); // employee id
	    r_data[9] 		= idGrid.GetGridData( idGrid.row , 2 ); // GROUP NAME
		//r_data[10] 		= lstClient.value; //client pk
		window.returnValue = r_data; 
	}
	this.close();
}
function OnShowDepartmentList()
{
	dso_department.Call();
}
</script>

<body>
<gw:data id="dso_department" onreceive=""> 
		<xml> 
			<dso type="list" procedure="ST_HR_PRO_CO_LIST_ORG" > 
				<input>
					 <input bind="txtClient" /> 
				</input> 
				<output> 
					<output bind="lstDepartment"/>
				</output>
			</dso> 
		</xml> 
	</gw:data>
	
<gw:data id="getEmployee"  > 
    <xml> 
        <dso type="grid" parameter="0,1,2" function="ST_GS_SEL_GSAU00101_0" > 
            <input> 
                <input bind="txtClient" />
                <input bind="lstDepartment" />
                <input bind="txtKeyWord" />
             </input>
            <output  bind="idGrid"/>
        </dso> 
    </xml> 
</gw:data> 
<table style="margin-left:5" align="center" width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="6%">Client:</td>
	<td width="26%"><gw:textbox id="txtClient"  text="<%=Session("APP_DBUSER")%>" /></td>
	<td width="5%">Org:</td>
	<td width="30%"><gw:list id="lstDepartment" onchange="OnSearch()" ></gw:list></td>
	<td width="10%">ID/Name:</td>
	<td width="20%"><gw:textbox id="txtKeyWord" onenterkey="OnSearch()" ></gw:textbox></td>
    <td align="right" width="1%" style="padding-left:1px;"><gw:button id="idSearch" img="search" alt="Search" text="Search" onclick="OnSearch();" /></td>
    <td align="right" width="1%" style="padding-left:1px;"><gw:button img="search" alt="Dictionary" id="Dictionary" text="Dictionary" onclick="System.GetDataLanguage_Popup(document,window.location.toString(),'<%=Session("SESSION_LANG")%>','<%=Session("CODEADMIN_YN")%>');" /></td>
  </tr>
  <tr>
	  <td colspan = "8">
		<div style="width:100%; height:450; overflow:auto">
			<gw:grid  
				id="idGrid"  
				header="_PK|_Department|_Group|Emp Name|Emp ID|_Tel|_Mobile|_Address|_LivingAddress|_UrgentContact|Organization Name"   
				format="0|0|0|0|0|0|0|0|0|0|0"  
				aligns="0|0|0|0|0|0|0|0|0|0|0"  
				defaults="||||||||||"  
				editcol="0|0|0|0|0|0|0|0|0|0|0"  
				autosize="true" 
				styles="width:100%; height:400"   
				sorting="T" 
			    oncelldblclick ="doSelect()" /> 
		</div>	
	</td>
  </tr>
</table>
</body>
</html>
