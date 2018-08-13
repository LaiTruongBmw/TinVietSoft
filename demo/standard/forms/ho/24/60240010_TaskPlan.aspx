<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head id="Head1" runat="server">
    <title>Check In</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
	BindingDataList();
	var ctrl = grdTaskPlan.GetGridControl();
     ctrl.ColEditMask(2) = "##:##";  
	dsoTaskPlan.Call("SELECT");
}
function BindingDataList()
{
	var data ="#10;INHOUSE|#20;ARRIVING|#30;DEPARTURE"; 
        grdTaskPlan.SetComboFormat(5,data);//guest status
        
        data ="#10;COMPLETED|#20;NOT COMPLETED|#30;CANCELLED"; // status
        grdTaskPlan.SetComboFormat(8,data);//
}
function OnSearch()
{
	dsoTaskPlan.Call("SELECT");
}
function OnNew()
{
	grdTaskPlan.AddRow();
}
function CheckValidate()
{
    for(var i=1;i<grdTaskPlan.rows;i++)
          {
            if(grdTaskPlan.GetGridData(i,1) == "")
             {
                alert("Please input date at row "+ i);       
                return false;
             }
             if(grdTaskPlan.GetGridData(i,3) == "")
             {
                alert("Please input description at row "+ i);       
                return false;
             }
             if(grdTaskPlan.GetGridData(i,4) == "")
             {
                alert("Please input room no at row "+ i);       
                return false;
             }
          }
          return true;
}
function OnSave()
{
   if(CheckValidate())
   {
        dsoTaskPlan.Call();
   }
}
function OnDelete()
{
    if(grdTaskPlan.GetGridData(grdTaskPlan.row,0) == "")
    {
        grdTaskPlan.RemoveRowAt(grdTaskPlan.row);
    }
    else
    {
        if (confirm('Are you sure delete data ?'))
        {
	        grdTaskPlan.DeleteRow();
	        dsoTaskPlan.Call();
	    }
    }
}
function OnDataReceive()
{

}
</script>
<body>
<gw:data id="dsoTaskPlan" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid" parameter="0,1,2,3,4,5,6,7,8" function="ht_sel_60240010_taskplan" procedure="ht_upd_60240010_taskplan">
			<input bind="grdTaskPlan">
				<input bind="dtFrom" />
				<input bind="txtRoomNo" />
			</input> 
			<output bind="grdTaskPlan" /> 
		</dso> 
	</xml> 
</gw:data>
<table style="height: 100%; width: 100%; background: #BDE9FF" border="0">
	<tr style="width: 100%; height: 1%">
		<td style="width: 100%; background: white" valign="top" >			
			<table style="width: 100%" border="0">
				<tr >
					<td style="width: 10%" align="right" >Date</td>
					<td style="width: 10%" >
						<gw:datebox id="dtFrom" lang="1" nullaccept="T" styles="width:100%" onchange="OnSearch()" />
					</td>
					<td style="width: 10%" align="right" >Room#</td>
					<td style="width: 15%" >
						<gw:textbox id="txtRoomNo" styles="width: 100%" onenterkey="OnSearch()" />
					</td>
					<td style="width: 43%" ></td>
					<td style="width: 3%" >
						<gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
					</td>
					<td style="width: 3%" >
						<gw:imgbtn img="new" alt="New" id="btnAddNew" onclick="OnNew()" />   
					</td>
					<td style="width: 3%" >
						<gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
					</td>
					<td style="width: 3%" >
						<gw:imgbtn img="save" alt="Save" id="btnSave" onclick="OnSave()" />
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr style="width: 100%; height: 30%; background: white">
		<td style="width: 100%">
			<gw:grid id="grdTaskPlan" 
			header="_pk|Date|Time|Description|Room#|Guest Status|Guest Info|Booking No|Status" 
			format="0|4|0|0|0|0|0|0|0" 
			aligns="0|0|0|0|0|0|0|0|0" 
			defaults="||||||||" 
			editcol="1|1|1|1|1|1|1|1|1" 
			widths="0|0|0|0|0|0|0|0|0" 
			styles="width:100%;height:100%"
			autosize='T'
			debug='false'
			acceptnulldate="T"/>
		</td>
	</tr>
</table>
</body>
<!--------------------------------------------------------------------------------------->
</html>
