<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head>
    <title>Role Entry</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var _bLoad = false;
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
	txtClientPK.text = "<%=Session("CLIENT_PK")%>";
	grdMapping.GetGridControl().FrozenCols = 6;
	chkActive.value = "-1";
	grdRole.SetComboFormat(1 , "<%=CtlLib.SetGridColumnDataSQL("select code, CODE_NM from vhr_hr_code where id='HR0141' ")%>");
	OnSearchRole();
}
//----------------------------------------Role------------------------------------------------------
function OnSearchRole()
{
    dsoRole.Call("SELECT");
}
function OnNewRole()
{
    grdRole.AddRow();
}
function OnDeleteRole()
{ 
    if(confirm((v_language =="ENG")?"Do you want to delete?":"Bạn có muốn xóa dữ liệu?"))
	{
		grdRole.DeleteRow();
		dsoRole.Call();
	}
	
}
function OnUnDeleteRole()
{
    grdRole.UnDeleteRow();
}
function OnSaveRole()
{
    if(CheckRoleDataIsValid())
    {
        dsoRole.Call();
    }
}
function CheckRoleDataIsValid(){
    return true;
}
//----------------------------------------------------End of Role-----------------------------------------------------------------
function checkValue_Tab()
{	 	
	switch ( idTab.GetCurrentPageNo() )
	{
		case 0:
			OnSearchRole();
			break;
		case 1:
			OnSearchRoleList();
			grdMapping.ClearData();
			break;
	}
}	
//---------------------------------------------------- Function for mapping-----------------------------------------------------------
function OnSearchRoleList()
{
    dsoRoleList.Call("SELECT");    
}
function loadObjectList(obj)
{
    _gLoad = true;
	txtParentPK.text = "0";
	txtRolePK.text = grdRoleList.GetGridData(grdRoleList.row,1);
	OnFilterObjectChange();
	dsoObjectList.Call("SELECT");
}
function saveMapping()
{
	//Build priviledge code
	_gLoad = false;

	dsoRoleObjList.Call();
}

/*function OnAddTo() 
{
	var rolePK = txtRolePK.text;
	var i = 0;
	
	if (Trim(rolePK) != "") {
	    alert(grdObjList.getSelRow);
	    while(grdObjList.rows > 1)
		{
			
			grdMapping.AddRow();
			grdMapping.SetGridText(grdMapping.rows-1 , 4, rolePK); //role pk
			grdMapping.SetGridText(grdMapping.rows-1 , 5,grdObjList.GetGridData(1,3)); //obj pk				
			grdMapping.SetGridText(grdMapping.rows-1 , 0,grdObjList.GetGridData(1,0));//obj ID
			grdMapping.SetGridText(grdMapping.rows-1 , 1,grdObjList.GetGridData(1,1));//Obj name
			
			grdObjList.RemoveRowAt(1);
		}
	} 
	else {
		alert ("Please select Role for mapping.");
	}
}*/
function OnAddTo() 
{
    var objCtrl = grdObjList.GetGridControl();
	var rolePK = txtRolePK.text;
	var i = 0;
	
	if (Trim(rolePK) != "") {
		//get selected row
		if (objCtrl.SelectedRows >0) {
			for (i=objCtrl.Rows-1;i>0;i--){
				//Add row to mapping grid
				if (objCtrl.IsSelected(i)){
					grdMapping.AddRow();
					grdMapping.SetGridText(grdMapping.rows-1 , 4, rolePK); //role pk
					grdMapping.SetGridText(grdMapping.rows-1 , 5,grdObjList.GetGridData(i,3)); //obj pk				
					grdMapping.SetGridText(grdMapping.rows-1 , 0,grdObjList.GetGridData(i,0));//obj ID
					grdMapping.SetGridText(grdMapping.rows-1 , 1,grdObjList.GetGridData(i,1));//Obj name
					
					objCtrl.RemoveItem(i);
				}
			}
			
		} 
		else {
			//alert ("Please select Object for mapping.");
		}
	} 
	else {
		alert ("Please select Role for mapping.");
	}
}
function OnAddTo2() 
{
	var rolePK = txtRolePK.text;
	var i = 0;
	
	if (Trim(rolePK) != "") {
	    if(grdObjList.row < 0){
	        alert("Please select menu to add to role.");
	        return;
	    }
	    
		grdMapping.AddRow();
		
		grdMapping.SetGridText(grdMapping.rows-1 , 4, rolePK); //role pk
		grdMapping.SetGridText(grdMapping.rows-1 , 5,grdObjList.GetGridData(grdObjList.row,3)); //obj pk				
		grdMapping.SetGridText(grdMapping.rows-1 , 0,grdObjList.GetGridData(grdObjList.row,0));//obj ID
		grdMapping.SetGridText(grdMapping.rows-1 , 1,grdObjList.GetGridData(grdObjList.row,1));//Obj name
		
		grdObjList.RemoveRow();
		grdObjList.row = -1;

	} 
	else {
		alert ("Please select Role for mapping.");
	}
}
function OnDelete() 
{
	
	if((v_language =="ENG")?"Do you want to delete?":"Bạn có muốn xóa dữ liệu?")
	{
		grdMapping.DeleteRow();
		dsoRoleObjList.Call();
	}
}

function OnUnDelete() 
{
    grdMapping.UnDeleteRow();
}

function OnDataReceive(dso)
{
    if(dso.id == "dsoObjectList")
    {
       if(_gLoad == true)
       {
           _gLoad = false;
           dsoRoleObjList.Call("SELECT");
       }
    }
    else if(dso.id == "dsoRoleObjList")
    {
       if(_gLoad == true)
       {
            _gLoad = false;
            dsoObjectList.Call("SELECT");
       }
    }
	else if(dso.id == "dsoRoleList")
    {
		dsoMenuTree.Call("SELECT");
	}
}
function OnSearch()
{
    OnFilterObjectChange();
    dsoObjectList.Call("SELECT");
}
function OnFilterObjectChange()
{
    if(lstKey.GetData() == "1")
    {
        txtObjectID.text = txtFilter.text;
        txtObjectName.text = "";
    }
    else
    {
        txtObjectID.text = "";
        txtObjectName.text = txtFilter.text;
    }
}

function MenuClick()
{
    if(txtRolePK.text == ""){
		alert("Please select a role firstly.");
		return;
	}
	
	var node = idMenu.GetCurrentNode();
  
	txtParentPK.text = node.oid ;
	
	_gLoad = true;
	
	OnFilterObjectChange();
	dsoObjectList.Call("SELECT");
	
}

</script>

<body>

<gw:data id="dsoMenuTree"  onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso id="1" type="tree" function="ST_GS_PRO_GSAU00200_0" > 
                <input bind="idMenu" > 
                </input> 
                <output bind="idMenu" /> 
            </dso> 
        </xml> 
</gw:data> 
<gw:data id="dsoRoleList"  onreceive="OnDataReceive(this)" > 
	<xml> 
		<dso type="grid" function="ST_GS_SEL_GSAU00200_0"  > 
			<input bind="grdRoleList" >								
			</input> 
			<output bind="grdRoleList" /> 
		</dso> 
	</xml> 
</gw:data>

<gw:data id="dsoRole" onreceive="OnDataReceive(this)" > 
	<xml> 
		<dso type="grid" parameter="0,1,2,3,4,5,6" function="ST_GS_SEL_GSAU00200_1" procedure="ST_GS_UPD_GSAU00200_1"  > 
			<input bind="grdRole" > 
			    <input bind="txtRoleName" />
			    <input bind="chkActive" />
				<input bind="txtClientPK" />
			</input> 
			<output bind="grdRole" /> 
		</dso> 
	</xml> 
</gw:data> 

<gw:data id="dsoObjectList"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso type="grid" function="ST_GS_SEL_GSAU00200_2"  > 
            <input bind="grdObjList"  > 
				<input bind="txtRolePK" />
                <input bind="txtObjectID" /> 
                <input bind="txtObjectName" />
                <input bind="txtParentPK" />				
            </input> 
            <output bind="grdObjList" /> 
        </dso> 
    </xml> 
</gw:data> 
				
<gw:data id="dsoRoleObjList"  onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso type="grid" parameter="3,4,5" function="ST_GS_SEL_GSAU00200_3" procedure="ST_GS_UPD_GSAU00200_3" > 
            <input bind="grdMapping" > 
                <input bind="txtRolePK" /> 
            </input> 
            <output bind="grdMapping" /> 
        </dso> 
    </xml> 
</gw:data> 

<table width="100%" style="height:100%" border=1>
    <tr>
        <td>
            <gw:tab id="idTab" onpageactivate="checkValue_Tab()" > 
				<table name="Role Entry" width="100%" style="height:100%">
					<tr>
						<td width="8%"><b>Role Name</b></td>
						<td width="10%"><gw:textbox id="txtRoleName" csstype="filter" text="" /></td>
						<td width="10%">Active</td>
						<td width="10%"><gw:checkbox id="chkActive" mode="01" value="-1" /></td>
						<td width="47%"></td>
						<td width="1%"><gw:button id="btnSearchRole" img="search" alt="Search" onclick="OnSearchRole()" /></td>
						<td width="1%"><gw:button id="btnNewRole" img="new" alt="New" onclick="OnNewRole()"/> </td>
						<td width="1%"><gw:button id="btnDleteRole" img="delete" alt="Delete" onclick="OnDeleteRole()"/></td>
						<td width="1%"></td>					 
						<td width="1%"><gw:button id="btnSaveRole" img="save" alt="Save" onclick="OnSaveRole()"/> </td>				
					 </tr>
					 <tr style="width:100%;height:95%" valign="top">
						<td colspan=10 style="width:100%;height:100%;">	
						
								<gw:grid   
								id="grdRole"  
								header="Role Name|Role Kind|Active|Start Date|End Date|_PK|_Client_PK"   
								format="0|2|3|4|4|0|0"  
								aligns="0|0|0|0|0|0|0"  
								defaults="||-1||||"  
								editcol="1|1|1|1|1|0|0" autosize="true"
								styles="width:100%; height:100%"   
								sorting="T"
                                acceptNullDate="T"  
								/> 
					    
					 </td>
				   </tr>
			</table>

			<table name="Role Object Mapping" width="100%" border="1">
				<tr height="50%">
				   <td width="30%" height="100%" valign="top">
				     <table width="100%" border=1>
					   <tr>
					     <td>
						<gw:grid   
							id="grdRoleList"  
							header="Role Name|_PK"   
							format="0|0"  
							aligns="0|0"  
							editcol="0|0"  
							widths="300|0"  
							styles="width:100%; height:300"   
							sorting="T" autosize="true"  
							oncellclick="loadObjectList(this)" />
					   </td>
					   </tr>
					   <tr height="50%" >
							<td height="100%" valign="top" >
								<!-- Object List-->
								 <gw:tree id="idMenu" style="width:100%; height:200;overflow:auto;" onclicknode="MenuClick()"/>
								
							</td>
						 </tr>
					 
					 </table>
					 
				   </td>
				   <td width="70%" valign="top" >
				   <table width="100%" >
						<tr>
							<td colspan=4>
								<table width="100%" >
									<tr>
										<td width="20%"><b>Filter key</b></td>
										<td width="15%">
											<gw:list id="lstKey" value="A" styles="width:100px" onchange="OnFilterObjectChange()">
												<data>DATA|1|Object ID|2|Object Name</data>
											</gw:list>
										</td>
										<td width="10%"><b>Value</b></td>
										<td width="28%"><gw:textbox id="txtFilter" styles="width:100%" onenterkey="OnSearch()" /></td>
										<td width="1%" align="right"><gw:button id="btnAddTo" img="select" alt="Add to" onclick="OnAddTo()" /></td>
										<td width="1%" align="right"><gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
									</tr>
									<tr>
										<td colspan="6">
										
												<gw:grid   
												id="grdObjList"  
												header="Menu ID|Menu Name|Parent Menu Name|_PK"
												format="0|0|0|0"  
												aligns="0|0|0|0"  
												editcol="0|0|0|0"  
												autosize="true"  
												styles="width:100%; height:250"   
												sorting="T" 
												oncelldblclick="OnAddTo2()" /> 
									
										</td>
									</tr>
								</table>
							</td>
						</tr>
						
						<tr>
							<td width="88%"></td>
							<td width="1%"><gw:button id="idDelete" img="delete" alt="Remove" text="Delete" onclick="OnDelete()"/> </td>				
							<td width="1%"><gw:button id="idUDelete" img="undelete" alt="UnRemove" text="UnDelete" onclick="OnUnDelete()"/> </td>								
							<td width="1%"><gw:button id="idBtnUpdate" img="save" alt="Save" text="Save" onclick="saveMapping()"/></td>
						</tr>
						<tr>
							<td colspan="4">
							
									<gw:grid   
									id="grdMapping"  
									header="Menu ID|Menu Name|Role Name|_PK|_RolePK|_ObjPK"   
									format="0|0|0|0|0|0"  
									aligns="0|0|0|0|0|0"  
									editcol="0|0|0|0|0|0"  
									autosize="true"  
									styles="width:100%; height:200"   
									sorting="T" debug="false"
									 /> 
							
							</td>
						</tr>
					</table>
				</td>
			  </tr>
		</table> 
		</gw:tab>	
        </td>
    </tr>
</table>    
<gw:textbox id="txtClientPK"  text="" styles="display:none" /> 
<gw:textbox id="txtParentPK"  text="" styles="display:none" /> 
<gw:textbox id="txtRolePK"  text="" styles="display:none" /> 
<gw:textbox id="txtObjectID"  text="" styles="display:none" />
<gw:textbox id="txtObjectName"  text="" styles="display:none" />
</body>
</html>
