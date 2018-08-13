<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>WARE HOUSE GROUP</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script> 
	var G1_PK = 0,
	G1_Seq = 1,
	G1_WareHouse = 2,
	G1_Group_Name = 3,
	G1_Line_Group =4,
	G1_Use_YN =5,
	G1_REMARK = 6;
//====================================================================================
function BodyInit(){
	BindingDataList();
	
}
//====================================================================================
function BindingDataList()
{
	var data;
	data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0020') FROM DUAL" )%>||Select All"; 
	lstCodeGroup.SetDataText(data);
		
	data = "<%=ESysLib.SetListDataSQL("SELECT pk ,GROUP_ID || ' - ' || GROUP_NAME FROM tlg_pb_line_group WHERE del_if = 0 ORDER BY GROUP_ID" )%>||Select All"; 
	lstLineGroup.SetDataText(data);
	
	var data;
	data = "<%=ESysLib.SetGridColumnDataSQL("SELECT   code, (code || '-' || code_nm) code_nm FROM tlg_lg_code a, tlg_lg_code_group b WHERE a.tlg_lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGCM0020' AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 ORDER BY a.def_yn DESC, ord")%>";
	grdWHGroup.SetComboFormat(G1_Group_Name, data );
	
	data = "<%=ESysLib.SetGridColumnDataSQL("select a.pk,a.pk||'-'||a.wh_name wh_name from tlg_in_warehouse a where a.use_yn = 'Y' AND a.del_if = 0 ORDER BY a.pk")%>";
	grdWHGroup.SetComboFormat(G1_WareHouse, data ); 
	
	data = "<%=ESysLib.SetGridColumnDataSQL("SELECT pk ,GROUP_ID || ' - ' || GROUP_NAME FROM tlg_pb_line_group WHERE del_if = 0 ORDER BY GROUP_ID" )%>"; 
	grdWHGroup.SetComboFormat(G1_Line_Group , data ); 
}
//====================================================================================
function OnAddNew(pos)
{ 
	switch (pos)
	{
		case 'AddNew' :
			grdWHGroup.AddRow();
			grdWHGroup.SetGridText( grdWHGroup.rows-1, G1_Group_Name, lstCodeGroup.value );
			grdWHGroup.SetGridText( grdWHGroup.rows-1, G1_Line_Group, lstLineGroup.value );
		break;
	}
}
//====================================================================================
function OnSave(pos)
{
	for(var i=0;i<grdWHGroup.rows;i++)
	{
		if(grdWHGroup.GetGridData(i,G1_Seq)=="")
		{
			alert("Please,input number SEQ to save data.");
			return;
		}
		if(grdWHGroup.GetGridData(i,G1_WareHouse)=="")
		{
			alert("Please,select WH Name to save data.");
			return;
		}
	}
	data_fpib00080.Call();	
}
//====================================================================================
function OnSearch()
{
	data_fpib00080.Call("SELECT");
}
function OnDataReceive(obj)
{
      switch (obj)
    {
        case 'data_fpib00080' :
            //OnSearch();
		 break;
               
	}	
}
//====================================================================================
function OnDelete()
{
	if (confirm('Are you sure you want to delete ?'))
	{
		grdWHGroup.DeleteRow();
		data_fpib00080.Call();
	}
}
</script>
<body>

<gw:data id="data_fpib00080" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="lg_sel_fpib00080" parameter="0,1,2,3,4,5,6" procedure="lg_upd_fpib00080"> 
                <input bind="grdWHGroup" >
                    <input bind="lstCodeGroup" /> 
                    <input bind="lstLineGroup" /> 
                </input> 
                <output bind="grdWHGroup" /> 
            </dso> 
        </xml> 
</gw:data>

	<table style="width: 100%; height: 100%">
		<tr style="height: 1%">
			<td style="width: 10%">Code Group</td>
			<td style="width: 30%">
				<gw:list id="lstCodeGroup" onchange=""/>
			</td>
			<td style="width: 10%;align:right;">Line Group</td>
			<td style="width: 30%">
				<gw:list id="lstLineGroup" onchange=""/>
			</td>
			<td style="width: 1%">
				<gw:imgbtn id="btnSearch2" img="search" alt="Search" onclick="OnSearch()"/>
			</td>
			<td style="width: 1%">
				<gw:imgbtn id="btnAddNew2" img="new" alt="Add new" onclick="OnAddNew('AddNew')"/>
			</td>
			<td style="width: 1%">
				<gw:imgbtn id="btnDelete2" img="delete" alt="Delete" onclick="OnDelete()"   />
			</td>
			<td style="width: 1%">
				<gw:imgbtn id="btnSave2" img="save" alt="Save" onclick="OnSave('grdWHGroup')"/>
			</td>
			<td></td>
		</tr>
		<tr style="height: 99%">
			<td colspan="9">
			<gw:grid id='grdWHGroup' header='_PK|Seq|Warehouse Name|Code Group|Line Group|Use_YN|Remark'
			format='0|0|0|0|0|3|0' aligns='0|0|0|0|0|0|0' defaults='|||||-1|' editcol='0|1|1|1|1|1|1'
			widths='800|800|2500|3000|2000|1000|2000' sorting='T' styles='width:100%; height:100%'
			
			 /><!--oncellclick="OnSearch('')" -->
			</td>
		</tr>

</table>
<!------------------------------------------------------------------>
<gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
<gw:textbox id="txtLineGroupPK" text="" styles="display:none" />
<gw:textbox id="txtLinePK" text="" styles="display:none" />
<!----------------------------------------------------------->
</body>
</html>