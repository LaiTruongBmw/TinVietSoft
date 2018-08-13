<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Untitled Page</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit(){
	txtClientPK.text = "<%=Session("CLIENT_PK")%>";
}
function getUserAndRole()
 {	
	dataGetUserAndRole.Call("SELECT"); 	 
}

function getObjectAndRole()
 {	
	dataGetObjectAndRole.Call("SELECT"); 	 
}

function getObjectAndUser()
{
    dataGetObjectAndUser.Call("SELECT");
}

function getTotal()
 {	
	document.getElementById("totalrows").innerHTML = "<b>Total Rows: " + idGridUserObject.rows +"</b>";
}
function OnDataReceive(dso)
{

}
//Object ID|Object Name|Menu ID|_Obj_Priv|_Obj_Status|_Obj_Use|Obj_StartDate|Role_Name|_Role_Use|Role Start Date
</script>

<body>
<gw:data id="dataGetUserAndRole" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso type="grid" parameter="0,1,2" function="ST_GS_SEL_GSAU00500_0" > 
            <input> 
                <input bind="txtUserID" />
                <input bind="txtFullName" />
                <input bind="chkUser" />
				<input bind="txtClientPK" />
				
             </input>
            <output  bind="idGridUserAndRole"/>
        </dso> 
    </xml> 
</gw:data> 

<gw:data id="dataGetObjectAndRole" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso type="grid" parameter="0,1,2" function="ST_GS_SEL_GSAU00500_1" > 
            <input> 
                <input bind="txtObjectId1" />
                <input bind="txtObjectName1" />
                <input bind="chkUsedObject1" />
                <input bind="chkUsedRole1" />
                <input bind="txtRole1" />
             </input>
            <output  bind="grdObjectAndRole1"/>
        </dso> 
    </xml> 
</gw:data> 

<gw:data id="dataGetObjectAndUser" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso type="grid" parameter="0,1,2" function="ST_GS_SEL_GSAU00500_2" > 
            <input> 
                <input bind="txtUserId2" />
                <input bind="txtObjectId2" />
                <input bind="txtObjectName2" />
                <input bind="txtRoleName2" />
                <input bind="chkUsedObject2" />
                <input bind="chkUsedUser2" />
             </input>
            <output  bind="grdObjectAndUser2"/>
        </dso> 
    </xml> 
</gw:data>

<table width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;">
<tr style="width:100%;height:100%" valign="top">
	<td width="100%">
	<gw:tab id="idTab">
		<table width="100%"  style="height:100%" name="User and Role" >
		<tr style="width:100%;height:5%">
			<td width="5%"><b>User ID</b></td>
			<td width="20%">
				<gw:textbox id="txtUserID" styles="width:90%" onenterkey="getUserAndRole()" /></td>
			<td width="5%"></td>
			<td width="10%"><b>Employee Name</b></td>
			<td width="20%">
				<gw:textbox id="txtFullName" styles="width:90%"  onenterkey="getUserAndRole()" /></td>
			<td width="5%"></td>
			<td width="10%" align ="right"><b>User Active</b></td>
			<td width="5%"><gw:checkbox id="chkUser" value="T"/></td>
			<td width="5%"></td>		
			<td width="5%"><gw:button id="btnSearch" img="search" alt="Search"  onclick="getUserAndRole()"/></td>					
			<td width="10%"></td>
		</tr>
		<tr style="width:100%;height:95%" valign="top">
			<td colspan="12" style="width:100%;height:100%;">
			    
					<gw:grid
						id="idGridUserAndRole"
						header="User ID|Full Name|Role Name|Role Active|Crt Date|Crt By"
						format="0|0|0|3|0|0"
						aligns="0|0|0|0|0|0"
						defaults="|||||"
						editcol="1|1|1|1|1|1"
						styles="width:100%; height:100%;"
						sorting="T" />
			
            </td>
		</tr>
		</table>
		
		<table width="100%" style="height:100%" name="Object and Role" ID="Table1">
		<tr> 
			<td width="7%"><b>Object ID</b></td>
			<td width="15%"><gw:textbox id="txtObjectId1"  styles="width:90%" onenterkey="getObjectAndRole()" /></td>
			<td width="8%"><b>Object Name</b></td>
			<td width="15%"><gw:textbox id="txtObjectName1"  styles="width:90%" onenterkey="getObjectAndRole()" /></td>						
			<td width="5%"><b>Role</b></td>
			<td width="15%"><gw:textbox id="txtRole1"  styles="width:90%" onenterkey="getObjectAndRole()" /></td>			
			<td width="10%" align ="right"><b>Used Object</b></td>
			<td width="5%"><gw:checkbox id="chkUsedObject1" mode="01" value="-1"/></td>
			<td width="5%"></td>			
			<td width="10%"><b>Used Role</b></td>
			<td width="5%"><gw:checkbox id="chkUsedRole1" mode="01" value="-1"/></td>
			<td width="5%"><gw:button id="btnSearch1" img="search" alt="Search"  onclick="getObjectAndRole()"/></td>					
			
		</tr>
		<tr style="width:100%;height:95%" valign="top">
			<td colspan="17" style="width:100%;height:100%;">
				
					<gw:grid
						id="grdObjectAndRole1"
						header="Object ID|Object Name|Menu ID|Obj Start Date|Role Name|Role Start Date|_Obj_Priv|_Obj_Status|_Obj_Use|_Role_Use"
						format="0|0|0|4|0|4|3|3|3|3"
						aligns="0|0|0|0|0|0|0|0|0|0"
						defaults="|||||||||"
						editcol="1|1|1|1|1|1|1|1|1|1"
						autosize="true"
						styles="width:100%; height:100%;"
						sorting="T" />
				
            </td>						
		</tr>		
    </table>    
	
	<table width="100%" style="height:100%" name="Object and User" ID="Table2">
		<tr> 
			<td width="7%" align ="right"><b>User ID</b></td> 
			<td width="10%" widht="5%"><gw:textbox id="txtUserId2"  styles="width:90%" onenterkey="getObjectAndUser()" /></td> 
			<td width="7%" align ="right"><b>Object ID</b></td>
			<td width="10%"><gw:textbox id="txtObjectId2"  styles="width:90%" onenterkey="getObjectAndUser()" /></td>
			<td width="7%" align ="right"><b>Object Name</b></td>
			<td width="10%"><gw:textbox id="txtObjectName2"  styles="width:90%" onenterkey="getObjectAndUser()" /></td>				
			<td width="7%" align ="right"><b>Role Name</b></td>
			<td width="10%"><gw:textbox id="txtRoleName2"  styles="width:90%" onenterkey="getObjectAndUser()" /></td>			
			<td width="7%" align ="right"><b>Used Object</b></td>
			<td width="5%"><gw:checkbox id="chkUsedObject2" mode="01" value="-1"/></td>
			<td width="7%" align ="right"><b>Used User</b></td>
			<td width="5%"><gw:checkbox id="chkUsedUser2" mode="01" value="-1"/></td>
			<td width="3%"><gw:button id="btnSelect2" img="search" alt="Search"  onclick="getObjectAndUser()"/></td>					
			<td width="5%"><div id="totalrows2"/></td>		
			
		</tr>
		<tr style="width:100%;height:95%" valign="top">
			<td colspan="16" style="width:100%;height:100%;">
			    
					<gw:grid
                    id="grdObjectAndUser2"
                    header="User ID|Full Name|Object ID|Object Name|Menu ID|Role Name|Object Used|Role Used|Role Object Used|User Used|User Role Used"
                    format="0|0|0|0|0|0|3|3|3|3|3"
                    aligns="0|0|0|0|0|0|0|0|0|0|0"
                    defaults="||||||||||"
                    editcol="1|1|1|1|1|1|1|1|1|1|1"
                    autosize="true"
                    styles="width:100%; height:100%" 
                    sorting="T" />
				
			</td>						
		</tr>		
    </table>
	
	
	
	
	</gw:tab>
	</td>
</tr>
</table>   
<gw:textbox id="txtClientPK"  text="" styles="display:none" /> 
<gw:textbox id="idID"  text="" styles="display:none" /> 
<gw:textbox id="idName"  text="" styles="display:none" />
</body>
</html>
