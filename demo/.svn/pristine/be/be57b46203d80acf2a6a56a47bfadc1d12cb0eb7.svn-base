<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head id="Head1" runat="server">
    <title>Send Room</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script> 
//G2 is GrdInhouse
//G3 is grdSend_Room
var G1_tht_room_allocate_from=0,
	G1_Group_Name=1,
	G1_Last_Name=2,
	G1_First_Name=3,
	G1_Room_No=4,
	G1_from_date=5,
	G1_departure_date=6;
var  G2_tht_room_allocate_from=0,
	 G2_tht_room_allocate2_pk=1, 
	 G2_group_name=2, 
	 G2_room_no=3,
	 G2_last_name=4, 
	 G2_first_name=5, 
	 G2_checkin_date=6,
	 G2_departure_date=7;
function BodyInit()
{
	BindingDataList();
}
function BindingDataList()
{
	//txt_room_allocate_pk_from.text = '<%=Request.QueryString("p_room_allocate_pk") %>';
	dso_htfo00040_inhouse.Call('SELECT');
	
}
function OnSearch(n)
{
	switch(n)
	{
		case 'Inhouse':
			dso_htfo00040_inhouse.Call();   
		break;
	}
}
function OnDelete()
{
	if (confirm('Are you sure delete data ?'))
	{
		grdSend_Room.DeleteRow();
		dso_htfo00040_send_room.Call();	
	}
}
function OnSave()
{
	dso_htfo00040_send_room.Call();
}
function OnSendRoom()
{	
	if(txt_room_allocate_pk_to.text =="")	
	{
		alert("Please,choose room to send.");
		return false;
	}
	grdSend_Room.AddRow();
	grdSend_Room.SetGridText(grdSend_Room.rows-1, G2_tht_room_allocate_from, GrdInhouse.GetGridData(GrdInhouse.row,G1_tht_room_allocate_from));//
	grdSend_Room.SetGridText(grdSend_Room.rows-1, G2_tht_room_allocate2_pk,  txt_room_allocate_pk_to.text);
	grdSend_Room.SetGridText(grdSend_Room.rows-1, G2_group_name,	         GrdInhouse.GetGridData(GrdInhouse.row,G1_Group_Name));//
	grdSend_Room.SetGridText(grdSend_Room.rows-1, G2_room_no,	             GrdInhouse.GetGridData(GrdInhouse.row,G1_Room_No));//
	grdSend_Room.SetGridText(grdSend_Room.rows-1, G2_last_name,		         GrdInhouse.GetGridData(GrdInhouse.row,G1_Last_Name));//
	grdSend_Room.SetGridText(grdSend_Room.rows-1, G2_first_name,		     GrdInhouse.GetGridData(GrdInhouse.row,G1_First_Name));//
	grdSend_Room.SetGridText(grdSend_Room.rows-1, G2_checkin_date,		     GrdInhouse.GetGridData(GrdInhouse.row,G1_from_date));//
	grdSend_Room.SetGridText(grdSend_Room.rows-1, G2_departure_date,		 GrdInhouse.GetGridData(GrdInhouse.row,G1_departure_date));//
	G2_tht_room_allocate_from=0,

	GrdInhouse.RemoveRowAt(GrdInhouse.row);				
}
function OnRemoveRoom()
{
	for(row = grdSend_Room.rows-1; row > 0; row--)
	{
		
		if (grdSend_Room.GetGridControl().isSelected(row) == true)
		{
			if (grdSend_Room.GetGridData(row, G2_Full_Name_2) == '')
			{
						grdSend_Room.RemoveRowAt(row);
						OnSearch('Inhouse');
					
			}
		}
	}
}
function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'dso_htfo00040_inhouse':
				dso_htfo00040_send_room.Call("SELECT");	
		break; 
	}
}
function OnPopUp(pos)
{
      switch (pos)         
      {		        
            case 'RoomSearch' :
               var path = System.RootURL + '/standard/forms/60/25/60250020_room_inhouse_popup.aspx';
               var obj = System.OpenModal( path ,550 , 500,  'resizable:yes;status:yes');
               if ( obj != null )
               {
                    txt_room_allocate_pk_to.text = obj[0]; 
					txtRoomNo.text = obj[2]; 
					dso_htfo00040_inhouse.Call();
               }	
            break;  	
      }
}

</script> 	

<body>
<gw:data id="dso_htfo00040_inhouse" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid" parameter="" function="st_ht_sel_60250020_send_rm_popup">
			<input bind="GrdInhouse">
				 <input bind="txtGroupName" />
				 <input bind="txt_room_allocate_pk_to" />
			</input> 
			<output bind="GrdInhouse" /> 
		</dso> 
	</xml> 
</gw:data>
    <gw:data id="dso_htfo00040_send_room" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid" parameter="0,1" function="st_ht_sel_60250020_send_room" procedure="st_ht_upd_60250020_send_room">
			<input bind="grdSend_Room">
				<input bind="txt_room_allocate_pk_to" />
			</input> 
			<output bind="grdSend_Room" /> 
		</dso> 
	</xml> 
</gw:data>
    <table style="height: 100%; width: 100%; background: #BDE9FF" border="0">
        <tr style="width: 100%; height: 1%">
            
        </tr>
        
        <tr style="width: 100%; height: 1%">
            <td style="width: 100%; background: white" valign="top">
                <table style="width: 100%" border="0">
                    <tr>
                        <td style="width: 13%">
							 Group Name/RM#:
                        </td>
						<td style="width: 23%" align="right">
							<gw:textbox id="txtGroupName" styles="width: 100%" onenterkey="OnSearch('Inhouse')" />
                        </td>
                        <td style="width: 15%" align="right">
                        </td>
                        <td style="width: 10%">
							
                        </td>
                        <td style="width: 10%">
						<b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('RoomSearch')">Room</b>
                        </td>
                        <td style="width: 10%">
							<gw:textbox id="txtRoomNo" readonly="T" styles="width: 100%" onchange="" /> 
                        </td>
                       <td style="width: 10%">
							
						</td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" />
                        </td>
						 <td width="3%" align="right">
                            <gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnReport()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 100%; height: 98%; background: white">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr>
						<td width="48%">
                            <gw:grid id="GrdInhouse" header="_tht_room_allocate_from|Group Name|Last Name|First Name|Room#|From Date|Departure Date"
                                format="0|0|0|0|0|4|4" aligns="0|0|0|0|0|0|0" defaults="||||||" editcol="0|0|0|0|0|0|0"
                                widths="2000|1000|1000|3000|1000|1000" styles="width:100%; height:100%"
                                sorting="F"  onafteredit="" autosize="T" oncelldblclick="OnSendRoom()" />
                        </td>
                        
                        <td style="width: 3%" align="center">
                            <gw:icon id="ibtnSelect" img="in" text=">>" onclick="OnSendRoom()" />
                            </br>
                            <gw:icon id="ibtnRemove" img="in" text="<<" onclick="OnRemoveRoom()" />
                        </td>
                        <td style="width: 59%; height: 5%; background: #BDE9FF">
                            <gw:grid id="grdSend_Room" header="_tht_room_allocate_from|_tht_room_allocate2_pk|Group Name|Room#|Last Name|First Name|Checkin Date|Departure Date"
                                format="0|0|0|0|0|0|4|4" aligns="0|0|0|0|0|0|0|0" defaults="|||||||" editcol="0|0|0|0|0|0|0|0"
                                widths="2000|1000|1000|3000|2000|1000|1000|3000" styles="width:100%; height:100%"
                                sorting="F"  onafteredit="" autosize="T"  />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="txt_room_allocate_pk_from" styles="display: none" />
<gw:textbox id="txt_room_allocate_pk_to" styles="display: none" />
<!--------------------------------------------------------------------------------------->
</html>
