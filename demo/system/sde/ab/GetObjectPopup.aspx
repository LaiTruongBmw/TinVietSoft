<!-- #include file="../../../system/lib/form.inc"  -->
<html>
<head>
    <title>Object Entry</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
	
	//grdObject.GetGridControl().SheetBorder = 0xF3D781;
	
	BindingDataList();
}

function BindingDataList()
{
    var data="";
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('COAB0110','','') FROM DUAL")%>|%|Select All";
    //alert(data)
    lstObjType.SetDataText(data);
    lstObjType.value = "%";
    
    data = "DATA|1|Object Name|2|Object ID|3|Menu ID";
    lstObjKey.SetDataText(data);
    lstObjKey.value = "1";
}

function OnSave()
{	
	MakeObjectAttribute();
	
	if (CheckDataIsValid()) 
	{
		dsoObject.Call();
	}
}

function OnSearch()
{
	dsoObject.Call('SELECT');
}
function doSelect()
{
	var r_data = new Array()
	//var ctrl = grdObject.GetGridControl();
    
	if(grdObject.row > 0 ) {
		r_data[0]		= grdObject.GetGridData( grdObject.row , 0 ); //pk
		r_data[1] 		= grdObject.GetGridData( grdObject.row , 1 ); //staus
		r_data[2] 		= grdObject.GetGridData( grdObject.row , 2 ); //type
		r_data[3] 		= grdObject.GetGridData( grdObject.row , 3 ); //id
		r_data[4] 		= grdObject.GetGridData( grdObject.row , 4 ); //name
		r_data[5] 		= grdObject.GetGridData( grdObject.row , 5 ); // lname
		r_data[6] 		= grdObject.GetGridData( grdObject.row , 6); // fname
	    r_data[7] 		= grdObject.GetGridData( grdObject.row , 7 ); // menuid
	    r_data[8] 		= grdObject.GetGridData( grdObject.row , 7 ); // used yn
	    r_data[9] 		= grdObject.GetGridData( grdObject.row , 8 ); // start dt
	    r_data[10] 		= grdObject.GetGridData( grdObject.row , 10 ); // end dt
	    r_data[11] 		= grdObject.GetGridData( grdObject.row , 11 ); // url
		window.returnValue = r_data; 
	}
	this.close();
}
</script>

<body>
    <gw:data id="dsoObject"> 
        <xml> 
            <dso type="grid" function="es_sel_obj_popup" >  
                <input bind="grdObject"   > 
				    <input bind="lstObjType" /> 
                    <input bind="lstObjKey" /> 
                    <input bind="txtObjectFilter" /> 
                    <input bind="chkActive" /> 															
                </input> 
                <output bind="grdObject" /> 
            </dso> 
        </xml> 
    </gw:data> 	

	<table width="100%" style=" height:100%" >
      <tr style=" height:5%"> 
        <td width="10%"><b>Object Type</b></td>
        <td width="10%"><gw:list id="lstObjType" onchange="" /></td>
        <td width="10%" ><b>Filter key</b></td>
        <td width="15%"><gw:list id="lstObjKey" onchange="" /></td>
        <td width="5%"><b>Value</b></td>
        <td width="10%"><gw:textbox id="txtObjectFilter" csstype="filter" onenterkey="OnSearch()" /></td>
        <td width="5%"><b>Active</b></td>
        <td width="5%"><gw:checkbox id="chkActive" mode="01" value="-1"/></td>
        <td width="15%"></td>
        <td width="3%"><gw:imgBtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
       </tr>
    <tr style=" height:95%"> 
         <td colspan=14>       
               
					<gw:grid
						id="grdObject"
						header="_pk|Menu ID|Menu name|_Menu ID|Parent name|Form LName|Form FName|_Menu ID|Used_YN|_Start DT|_End Dt|URL"
						format="0|0|0|0|0|0|0|0|3|0|0|0"
						aligns="0|0|0|0|0|0|0|0|0|0|0|0"
						defaults="|U|M||||||||||"
						editcol="1|1|1|1|1|1|1|1|0|0|0"
						autosize="true"
						styles="width:100%; height:100%" oncelldblclick="doSelect()"
						sorting="T"  />
					
        </td>
	</tr>
</table>
<gw:textbox id="txtObjectID" styles="display:none" />
<gw:textbox id="txtObjectName" styles="display:none" />
<gw:textbox id="txtMenuID" styles="display:none" />
</body>
</html>
