<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>vina genuwin</title>
    <%  CtlLib.SetUser("crm")%>

<script>
function BodyInit()
{
	OnSearch();
}
function OnGetRoom()
{
	var ctrl = grdRoom.GetGridControl();
	var rtn_value = new Array();
	var index = 0;

	if (grdRoom.row > 0)
	{
		for(j = 0; j < grdRoom.cols -1; j++)
		{
			rtn_value[index] = grdRoom.GetGridData(grdRoom.row, j );
			index ++;
		}
		
		window.returnValue = rtn_value; 
		this.close();
	}
}
function OnSearch()
{
	dsoRoom.Call("SELECT");
}
</script>

</head>
<body>
    <gw:data id="dsoRoom" onreceive="">
        <xml>
           <dso  type="grid"  function="crm.sp_sel_htfo00180_room_popup" >
                <input  bind="grdRoom">
                    <input bind="txtRoomNo" />
                </input> 
                <output bind="grdRoom" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="width: 100%; height: 100%" border="0">
        <tr>
			<td style="width: 6%;">Room</td>
			<td style="width: 17%;"><gw:textbox id="txtRoomNo" styles='width:100%;' onenterkey="OnSearch()" /></td>
			<td style="width: 3%; white-space: nowrap" align="center">
                            <gw:imgbtn id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
			<td style="width: 81%;"></td>
		</tr>
		<tr style="height: 100%">
            <td colspan="4">
                <gw:grid id='grdRoom' header='_PK|Room No|Code_Room_Type|Room Type|Description'
                    format='0|0|0|0|0' 
					aligns='0|0|0|0|0'
                    defaults='||||'
					editcol='0|0|0|0|0'
					widths='1000|1000|1000|1000|10000'
                    sorting='T' styles='width:100%; height:100%' autosize="T" oncelldblclick='OnGetRoom()' />
            </td>
        </tr>
    </table>
</body>
</html>
