<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head>
    <title>User Authority Entry</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
var _gLoad = false;
function BodyInit()
{	
    BindDataList();
    txtClientDB.text = "<%=Session("APP_DBUSER")%>";
	OnSearch('0');
}

function BindDataList()
{
    var data = "<%=CtlLib.SetListDataSQL("SELECT PK, ORG_ID ||'-'|| ORG_NM FROM "+Session("APP_DBUSER")+".TCO_ORG WHERE DEL_IF = 0 ORDER BY 2")%>|%|Select All";
    
   // var data = "<%=CtlLib.SetListDataSQL("SELECT PK, ORG_ID ||'-'|| ORG_NM FROM "+Session("APP_DBUSER")+".TCO_ORG WHERE DEL_IF = 0 ORDER BY 2")%>|%|Select All";
    
    lstDept.SetDataText(data);
    lstDept.value = "%";
    
    data = "DATA|0|Full Name|1|Employee ID";
    lstKey.SetDataText(data);
    lstKey.value = "0";
}

function OnSearch(obj)
{
	if(obj=='0')
	{
		dsoUserList.Call("SELECT");
	}
	if(obj=='1')
	{
		var key = lstKey.GetData();
		if (key == '0') 
		{
			txtFullName.text = txtKeyWord.text; 
			txtEmpID.text = '';
		}
		if (key == '1') 
		{
			txtFullName.text = ''; 
			txtEmpID.text = txtKeyWord.text;
		}
		
		if (Trim(txtRolePK.text) != "") 
		{
			dsoUserList.Call("SELECT");
		}
	}
	if(obj=='2')
	{
		dsoUserLisMpos.Call("SELECT");
	}
}

function loadRoleByUser(obj)
{
    _gLoad = true;
	if(obj=='0')
	{
		txtUserPK.text = grdUserList.GetGridData(grdUserList.row, 3);
		dsoRoleList.Call("SELECT");
	}
	if(obj=='1')
	{
		txtRolePK.text = grdRoleList1.GetGridData(grdRoleList1.row, 1);
		dsoUserList_2.Call("SELECT");
	}
	if(obj=='2')
	{
		txtUserMposPK.text = grdUserMpos.GetGridData(grdUserMpos.row, 3);
		dsoFuncMpos.Call("SELECT");
	}
}

function addObjectTo(obj) 
{
	if(obj=='0')//tab 1	
	{
	        if(grdUserList.row <= 0){
	            alert("Please select user to add to role.");
	            return;
	        }
			if(grdRoleList.row <= 0){
	            alert("Please select role to add to user.");
	            return;
	        }
			//header="Role Name|UserID|Emp Name|Active|Start Date|End Date|Add YN|Edit YN|Del YN|Print YN|Confirm YN|Cancel YN|Undo YN|Redo YN|Export YN|Att File|Att File View|Att File Dowload|_PK|_UserPK|_RolePK"   
			
			for (i = 0; i < grdRoleList.rows; i++)	
			{
					if (grdRoleList.GetGridControl().isSelected(i)== true)
					{
						grdMapping.AddRow();
						//header="User ID|Full Name|Employee ID|_PK"   
						grdMapping.SetGridText(grdMapping.rows-1 , 19, grdUserList.GetGridData(grdUserList.row,3)); //user pk				
						grdMapping.SetGridText(grdMapping.rows-1 , 20, grdRoleList.GetGridData(i,1)); //role pk
						grdMapping.SetGridText(grdMapping.rows-1 , 0, grdRoleList.GetGridData(i,0));//role name
						grdMapping.SetGridText(grdMapping.rows-1 , 1, grdUserList.GetGridData(grdUserList.row,0));//user id
						grdMapping.SetGridText(grdMapping.rows-1 , 2, grdUserList.GetGridData(grdUserList.row,1));//emp full name
						//alert(i);
						//grdRoleList.RemoveRow();

					}
			}

			//============
			for (i = grdRoleList.rows-1; i >=0 ; i--)	
			{
					if (grdRoleList.GetGridControl().isSelected(i)== true)
					{
						//alert(i);
						grdRoleList.RemoveRowAt(i);
					}
			}

	}
	if(obj=='1')
	{
		var rolePK = txtRolePK.text;
	
		if (Trim(rolePK) != "") 
		{
				if(grdUserList1.row <= 0){
					alert("Please select user to add to role.");
					return;
				}
				for (i = 0; i < grdUserList1.rows; i++)	
				{
					if (grdUserList1.GetGridControl().isSelected(i)== true)
					{
						grdMapping1.AddRow();
						//header="Role Name|UserID|Emp Name|Active|Start Date|End Date|_PK|_UserPK|_RolePK" 
						grdMapping1.SetGridText(grdMapping1.rows-1 , 7, grdUserList1.GetGridData(i,3)); //user pk				
						grdMapping1.SetGridText(grdMapping1.rows-1 , 8, rolePK); //role pk
						grdMapping1.SetGridText(grdMapping1.rows-1 , 0, grdRoleList1.GetGridData(grdRoleList1.row,0));//role name
						grdMapping1.SetGridText(grdMapping1.rows-1 , 1, grdUserList1.GetGridData(i,0));//user id
						grdMapping1.SetGridText(grdMapping1.rows-1 , 2, grdUserList1.GetGridData(i,1));//emp full name
					}
				}
				//============
				for (i = grdUserList1.rows-1; i >=0 ; i--)	
				{
						if (grdUserList1.GetGridControl().isSelected(i)== true)
						{
							//alert(i);
							grdUserList1.RemoveRowAt(i);
						}
				}
				//grdUserList.RemoveRow();
		} 
		else {
			alert ("Please select Role for mapping.");
		}
	}
	if(obj=='2')//tab 3
	{
	        if(grdUserMpos.row <= 0){
	            alert("Please select user to add to role.");
	            return;
	        }
			if(grdFuncMpos.row <= 0){
	            alert("Please select role to add to user.");
	            return;
	        }
			
			for (i = 0; i < grdFuncMpos.rows; i++)	
			{
					if (grdFuncMpos.GetGridControl().isSelected(i)== true)
					{
						grdMappingMpos.AddRow();
						//header="Form Name|UserID|Emp Name|Active|_PK|_UserPK|_RolePK" 
						grdMappingMpos.SetGridText(grdMappingMpos.rows-1 , 5, grdUserMpos.GetGridData(grdUserMpos.row,3)); //user pk				
						grdMappingMpos.SetGridText(grdMappingMpos.rows-1 , 6, grdFuncMpos.GetGridData(i,1)); //role pk
						grdMappingMpos.SetGridText(grdMappingMpos.rows-1 , 0, grdFuncMpos.GetGridData(i,0));//form name
						grdMappingMpos.SetGridText(grdMappingMpos.rows-1 , 1, grdUserMpos.GetGridData(grdUserMpos.row,0));//user id
						grdMappingMpos.SetGridText(grdMappingMpos.rows-1 , 2, grdUserMpos.GetGridData(grdUserMpos.row,1));//emp full name
						//alert(i);
						//grdRoleList.RemoveRow();

					}
			}

			//============
			for (i = grdFuncMpos.rows-1; i >=0 ; i--)	
			{
					if (grdFuncMpos.GetGridControl().isSelected(i)== true)
					{
						//alert(i);
						grdFuncMpos.RemoveRowAt(i);
					}
			}

	}
}

function removeObjectFrom(obj) 
{
	if(obj=='0')
	{
		grdMapping.DeleteRow()//RemoveItem(i);
	}	
	if(obj=='1')
	{
		grdMapping1.DeleteRow()//RemoveItem(i);
	}
	if(obj=='2')
	{
		grdMappingMpos.DeleteRow()//RemoveItem(i);
	}
}

function UnRemoveObjectFrom(obj) 
{
	if(obj=='0')
	{
		grdMapping.UnDeleteRow()//RemoveItem(i);
	}
	if(obj=='1')
	{
		grdMapping1.UnDeleteRow()//RemoveItem(i);
	}
}

function saveMapping(obj)
{
    _gLoad = true;
	if(obj=='0')
	{
		
		dsoUserRoleMapping.Call();
	}
	if(obj=='1')
	{
		dsoUserRoleMapping_2.Call();
	}
	if(obj=='2')
	{
		dsoUserMposMapping.Call();
	}
}
function OnDataReceive(dso)
{
    if(dso.id == "dsoRoleList")
    {
        if(_gLoad == true)
       {
           _gLoad = false;
			dsoUserRoleMapping.Call("SELECT");
		}
    }
    else if(dso.id == "dsoUserRoleMapping")
    {
       if(_gLoad == true)
       {
            _gLoad = false;
            dsoRoleList.Call("SELECT");
       }
    }
	
	//========
	 if(dso.id == "dsoUserList_2")
    {
       if(_gLoad == true)
       {
           _gLoad = false;
           dsoUserRoleMapping_2.Call("SELECT");
       }
    }
    else if(dso.id == "dsoUserRoleMapping_2")
    {
       if(_gLoad == true)
       {
            _gLoad = false;
            dsoUserList_2.Call("SELECT");
       }
    }
	if(dso.id =="dsoFuncMpos"){
		if(_gLoad == true)
       {
           _gLoad = false;
			dsoUserMposMapping.Call("SELECT");
		}
	}
	else if(dso.id == "dsoUserMposMapping")
    {
       if(_gLoad == true)
       {
            _gLoad = false;
            dsoFuncMpos.Call("SELECT");
       }
    }
}
function OnSearchRole(obj)
{
	if(obj=='0')
	{
		dsoRoleList.Call("SELECT");
	}
	if(obj=='1')
	{
		dsoRoleList_2.Call("SELECT");
	}
	if(obj=='2')
	{
		dsoFuncMpos.Call("SELECT");
	}
}
function OnSearchTab()
{
	var tab_idx = idTab.GetCurrentPageNo();

	/*if(tab_idx==0)
	{
		OnSearchRole('0');
	}
	if(tab_idx==1)
	{
		OnSearchRole('1');
	}*/
}
</script>

<body>
<!--------------------tab1----------------------->
<gw:data id="dsoRoleList"  onreceive="OnDataReceive(this)" > 
	<xml> 
		<dso type="grid" function="ST_GS_SEL_GSAU00300_0"  > 
			<input bind="grdRoleList" >	
			        <input bind="txtUserPK" />
					<input bind="txtRoleName" /> 
			</input> 
			<output bind="grdRoleList" /> 
		</dso> 
	</xml> 
</gw:data>

  <gw:data id="dsoUserList"  onreceive="" > 
      <xml> 
          <dso type="grid" function="ST_GS_SEL_GSAU00300_1" > 
              <input bind="grdUserList"> 
                  <input bind="txtFullName" /> 
                  <input bind="txtEmpID" /> 
                  <input bind="txtClientDB" /> 
              </input> 
              <output bind="grdUserList" /> 
          </dso> 
      </xml> 
  </gw:data>

 <gw:data id="dsoUserRoleMapping"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso type="grid" parameter="3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20" function="ST_GS_SEL_GSAU00300_2" procedure="ST_GS_UPD_GSAU00300_2"> 
            <input bind="grdMapping" > 
                <input bind="txtUserPK" /> 
            </input> 
            <output bind="grdMapping" /> 
        </dso> 
    </xml> 
</gw:data> 

<!--------------------tab2----------------------->
<gw:data id="dsoRoleList_2"  onreceive="" > 
	<xml> 
		<dso type="grid" function="ST_GS_SEL_GSAU00300_3"  > 
			<input bind="grdRoleList1" >
				<input bind="txtRoleName2" /> 
			</input> 
			<output bind="grdRoleList1" /> 
		</dso> 
	</xml> 
</gw:data>

  <gw:data id="dsoUserList_2"  onreceive="OnDataReceive(this)" > 
      <xml> 
          <dso type="grid" function="ST_GS_SEL_GSAU00300_4" >  
              <input bind="grdUserList1"> 
                  <input bind="lstDept" /> 
                  <input bind="txtFullName" /> 
                  <input bind="txtKeyWord" /> 
                  <input bind="txtRolePK" /> 
                  <input bind="txtClientDB" />  
              </input> 
              <output bind="grdUserList1" /> 
          </dso> 
      </xml> 
  </gw:data>

 <gw:data id="dsoUserRoleMapping_2"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso type="grid" parameter="3,4,5,6,7,8" function="ST_GS_SEL_GSAU00300_5" procedure="ST_GS_UPD_GSAU00300_5"> 
            <input bind="grdMapping1" > 
                <input bind="txtRolePK" /> 
				<input bind="txtClientDB" /> 
            </input> 
            <output bind="grdMapping1" /> 
        </dso> 
    </xml> 
</gw:data> 
<!--------------------tab3----------------------->
  <gw:data id="dsoUserLisMpos"  onreceive="" > 
      <xml> 
          <dso type="grid" function="ST_GS_SEL_GSAU00300_6" > 
              <input bind="grdUserMpos"> 
                  <input bind="txtFullNameMpos" /> 
                  <input bind="txtEmpIDMpos" /> 
                  <input bind="txtClientDB" /> 
              </input> 
              <output bind="grdUserMpos" /> 
          </dso> 
      </xml> 
  </gw:data>
  
  <gw:data id="dsoFuncMpos"  onreceive="OnDataReceive(this)" > 
	<xml> 
		<dso type="grid" function="ST_GS_SEL_GSAU00300_7"  > 
			<input bind="grdFuncMpos" >	
			        <input bind="txtUserMposPK" />
					<input bind="txtFuncName" /> 
			</input> 
			<output bind="grdFuncMpos" /> 
		</dso> 
	</xml> 
</gw:data>

<gw:data id="dsoUserMposMapping"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso type="grid" parameter="3,4,5,6" function="ST_GS_SEL_GSAU00300_8" procedure="ST_GS_UPD_GSAU00300_8"> 
            <input bind="grdMappingMpos" > 
                <input bind="txtUserMposPK" /> 
            </input> 
            <output bind="grdMappingMpos" /> 
        </dso> 
    </xml> 
</gw:data> 

<table  style="width: 100%; height: 100%"  border="0">
<tr>
	<td>

		<gw:tab id="idTab" onclick ="OnSearchTab(this)">
		<form name="User-Roles"   id="User_Roles"    type="hidden">
		<table  style="width: 100%; height: 100%"  border="1">
			<tr>
				<td width="40%">
					<table style="width: 100%; height: 100%">
						<tr style="height: 2%">
							<td style="white-space:nowrap;">Emp name</td>
							<td width="50%"><gw:textbox id="txtFullName" styles="width:100%" onenterkey="OnSearch('0')" /></td>
							 <td style="white-space:nowrap;">Emp ID</td>
							<td width="30%"><gw:textbox id="txtEmpID" styles="width:100%" onenterkey="OnSearch('0')" /></td>
							<td width="3%"><gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch('0')" /></td>
					  </tr>
						<tr style="height: 48%">
							<td colspan="5">
								   
									<gw:grid   
									id="grdUserList"  
									header="User ID|Full Name|Employee ID|_PK"   
									format="0|0|0|0"  
									aligns="0|0|0|0"  
									editcol="0|0|0|0"  
									widths="100|400|100|1"  
									styles="width:100%; height:100%"   
									sorting="T"  autosize="true"  
									oncellclick="loadRoleByUser('0')"
									/> 
								 
							</td>
						</tr>
						<tr style="height: 50%">
				
							<td colspan="5">
							   <table style="width: 100%; height: 100%">
								   <tr style="height: 2%">
										<td width="30%" >
											Role name
										</td>
										<td width="50%"><gw:textbox id="txtRoleName" styles="width:100%" onenterkey="OnSearchRole('0')" /></td>
										<td width="10%"><gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearchRole('0')" /></td>
										<td width="10%"><gw:button id="btnAdd6" img="new" alt="Add" onclick="addObjectTo('0')"/></td>

									</tr>
									<tr style="height: 98%">
										<td colspan=4>
											<gw:grid   
											id="grdRoleList"  
											header="Role Name|_PK"   
											format="0|0"  
											aligns="0|0"  
											editcol="0|0"  
											widths="300|1"  
											styles="width:100%; height:100%"   
											sorting="T"   autosize="true" 
											oncelldblclick="addObjectTo('0')"  /> 
										</td>
									</tr>
							   </table>
							</td>
						</tr>
					</table>
				</td>
				<td  width="60%" valign="top">
					<table style="width: 100%; height: 100%">
						<tr style="height: 2%">
							<td width="85%"></td>
							<td><gw:button id="btnAdd" img="new" alt="Add" onclick="addObjectTo('0')"  style="display:none" /> </td>
							<td><gw:button id="btnDelete" img="delete" alt="Remove" onclick="removeObjectFrom('0')"/> </td>				
							<td> </td>									
							<td><gw:button id="btnSave" img="save" alt="Save" onclick="saveMapping('0')"/></td>
						</tr>
						<tr style="height: 98%">
							<td colspan="5">
							 
								<gw:grid   
								id="grdMapping"  
								header="Role Name|UserID|Emp Name|Active|Start Date|End Date|Add YN|Edit YN|Del YN|Print YN|Confirm YN|Cancel YN|Undo YN|Redo YN|Export YN|Att File|Att File View|Att File Dowload|_PK|_UserPK|_RolePK"   
								format="0|0|0|3|4|4|3|3|3|3|3|3|3|3|3|3|3|3|0|0|0"  
								aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
								defaults="|||-1|||||||||||||||||"  
								editcol="0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0"  
								widths="150|60|150|50|80|80|50|50|50|50|50|50|50|50|50|50|50|50|50|1|1|1"  
								styles="width:100%; height:100%"   
								sorting="T"   autosize="true" 
								oncelldblclick="removeObjectFrom('0')" /> 
							  
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
		</table>
		</form>


		<form name="Roles-User"   id="Roles_user"    type="hidden">
		<table style="width: 100%; height: 100%"  border="1">
			<tr>
				<td width="40%">
					<table style="width: 100%; height: 100%">
						<tr style="height: 2%">
							<td width="20%">Role Name</td>
							<td width="75%"><gw:textbox id="txtRoleName2" styles="width:100%" onenterkey="OnSearchRole('1')" /></td>
							<td width="5%" align="right"><gw:button id="btnSearch5" img="search" alt="Search" onclick="OnSearchRole('1')" /></td>
						</tr>
						<tr style="height: 48%">
							<td colspan="3">
								<gw:grid   
								id="grdRoleList1"  
								header="Role Name|_PK"   
								format="0|0"  
								aligns="0|0"  
								editcol="0|0"  
								widths="300|1"  
								styles="width:100%; height:100%"   
								sorting="T"   autosize="true" 
								oncellclick="loadRoleByUser('1')" /> 
							</td>
						</tr>
						<tr style="height: 50%">
							<td td colspan="3">
								<table style="width: 100%; height: 100%">
									<tr style="height: 2%">
										<td width="10%"><b>Department</b></td>
										<td width="27%"><gw:list id="lstDept" styles="width:100%"/></td>
										<td width="6%"><b>Key</b></td>
										<td width="26%"><gw:list id="lstKey" styles="width:100%"/></td>
										<td width="30%"><gw:textbox id="txtKeyWord" styles="width:100%" onenterkey="loadRoleByUser('1')" /></td>
										<td width="3%"><gw:button id="btnSearch5" img="search" alt="Search" onclick="loadRoleByUser('1')" /></td>
										<td width="5%"><gw:button id="btnAdd7" img="new" alt="Add" onclick="addObjectTo('1')"/></td>
								  </tr>
									<tr style="height: 98%">
										<td colspan="7">
											   
												<gw:grid   
												id="grdUserList1"  
												header="User ID|Full Name|Employee ID|_PK"   
												format="0|0|0|0"  
												aligns="0|0|0|0"  
												editcol="0|0|0|0"  
												widths="100|400|100|1"  
												styles="width:100%; height:100%"   
												sorting="T"  autosize="true"  
												oncelldblclick="addObjectTo('1')" /> 
											 
										</td>
									</tr>
								</table>
							</td>
					</tr>
					</table>
				</td>
				<td  width="60%" valign="top">
					<table table style="width: 100%; height: 100%">
						<tr style="height: 2%">
							<td width="5%"></td>
							<td width="80%"></td>
							<td><gw:button id="btnAdd1" img="new" alt="Add" onclick="addObjectTo('1')"/> </td>
							<td><gw:button id="btnDelete1" img="delete" alt="Remove" onclick="removeObjectFrom('1')"/> </td>				
							<td> </td>									
							<td><gw:button id="btnSave1" img="save" alt="Save" onclick="saveMapping('1')"/></td>
						</tr>
						<tr style="height: 98%">
							<td colspan="6">
							 
								<gw:grid   
								id="grdMapping1"  
								header="Role Name|UserID|Emp Name|Active|Start Date|End Date|_PK|_UserPK|_RolePK"   
								format="0|0|0|3|4|4|0|0|0"  
								aligns="0|0|0|0|0|0|0|0|0"  
								defaults="|||-1|||||"  
								editcol="0|0|0|1|1|1|0|0|0"  
								widths="150|60|150|50|80|80|1|1|1"  
								styles="width:100%; height:100%"   
								sorting="T"   autosize="true" 
								oncelldblclick="removeObjectFrom('1')" /> 
							  
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
		</table>
		</form>
		<form name="Tablet-User"   id="Tablet-User"    type="hidden">
			<table  style="width: 100%; height: 100%"  border="1">
			<tr>
				<td width="40%">
					<table style="width: 100%; height: 100%">
						<tr style="height: 2%">
							<td style="white-space:nowrap;">Emp name</td>
							<td width="50%"><gw:textbox id="txtFullNameMpos" styles="width:100%" onenterkey="OnSearch('2')" /></td>
							 <td style="white-space:nowrap;">Emp ID</td>
							<td width="30%"><gw:textbox id="txtEmpIDMpos" styles="width:100%" onenterkey="OnSearch('2')" /></td>
							<td width="3%"><gw:button id="btnSearchMpos" img="search" alt="Search" onclick="OnSearch('2')" /></td>
					  </tr>
						<tr style="height: 48%">
							<td colspan="5">
								   
									<gw:grid   
									id="grdUserMpos"  
									header="User ID|Full Name|Employee ID|_PK"   
									format="0|0|0|0"  
									aligns="0|0|0|0"  
									editcol="0|0|0|0"  
									widths="100|400|100|1"  
									styles="width:100%; height:100%"   
									sorting="T"  autosize="true"  
									oncellclick="loadRoleByUser('2')"
									/> 
								 
							</td>
						</tr>
						<tr style="height: 50%">
				
							<td colspan="5">
							   <table style="width: 100%; height: 100%">
								   <tr style="height: 2%">
										<td width="30%" >
											Form name
										</td>
										<td width="50%"><gw:textbox id="txtFuncName" styles="width:100%" onenterkey="OnSearchRole('2')" /></td>
										<td width="10%"><gw:button id="btnSearchMpos" img="search" alt="Search" onclick="OnSearchRole('2')" /></td>
										<td width="10%"><gw:button id="btnAddMpos" img="new" style="display:none" alt="Add" onclick="addObjectTo('2')"/></td>

									</tr>
									<tr style="height: 98%">
										<td colspan=4>
											<gw:grid   
											id="grdFuncMpos"  
											header="Role Name|_PK"   
											format="0|0"  
											aligns="0|0"  
											editcol="0|0"  
											widths="300|1"  
											styles="width:100%; height:100%"   
											sorting="T"   autosize="true" 
											oncelldblclick="addObjectTo('2')"  /> 
										</td>
									</tr>
							   </table>
							</td>
						</tr>
					</table>
				</td>
				<td  width="60%" valign="top">
					<table style="width: 100%; height: 100%">
						<tr style="height: 2%">
							<td width="85%"></td>
							<td><gw:button id="btnAdd2Mpos" img="new" alt="Add" onclick="addObjectTo('0')"  style="display:none" /> </td>
							<td><gw:button id="btnDeleteMpos" img="delete" alt="Remove" onclick="removeObjectFrom('2')"/> </td>											
							<td><gw:button id="btnSaveMpos" img="save" alt="Save" onclick="saveMapping('2')"/></td>
						</tr>
						<tr style="height: 98%">
							<td colspan="4">
							 
								<gw:grid   
								id="grdMappingMpos"  
								header="Form Name|UserID|Emp Name|Active|_PK|_UserPK|_RolePK"   
								format="0|0|0|3|0|0|0"  
								aligns="0|0|0|0|0|0|0"  
								defaults="|||-1||||"  
								editcol="0|0|0|1|0|0|0"  
								widths="150|60|150|50|1|1|1"  
								styles="width:100%; height:100%"   
								sorting="T"   autosize="true" 
								oncelldblclick="removeObjectFrom('2')" /> 
							  
							</td>
						</tr>
					</table>
				</td>
			</tr>
			
		</table>
		</form>
		</gw:tab>
	</td>
</tr>
</table>
<gw:textbox id="txtUserPK"   style="display:none" /> 
<gw:textbox id="txtClientDB"   style="display:none" /> 


<gw:textbox id="txtRolePK"   style="display:none" /> 
<gw:textbox id="txtUserMposPK"   style="display:none" /> 
</body>
</html>