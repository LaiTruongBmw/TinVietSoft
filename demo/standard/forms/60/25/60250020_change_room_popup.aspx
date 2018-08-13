<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Change Room Popup</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function  BodyInit()
{
   txt_room_allocate_pk_from.text = '<%=Request.QueryString("p_master_pk") %>';        
   txtRoom.text = '<%=Request.QueryString("p_room_no") %>';                 
   //txtGuestName.text = '<%=Request.QueryString("p_golfer_name") %>';  
   dtArrival.value = '<%=Request.QueryString("p_from_date") %>'; 
   dtDeparture.value = '<%=Request.QueryString("p_to_date") %>'; 
   dtArrival.SetEnable(false);
   dtDeparture.SetEnable(false);
   dtArrival2.SetEnable(false);
   var caller = dialogArguments;
  var arrSum = caller.GetGuestName();
  //SetDataGuestName(arrSum);
   
   dso_htfo00040_changed_room.Call("SELECT"); //show guest name.
}
/*function SetDataGuestName(arr){//not getdata-->so body init load guest name.
    var tmp = new Array();
    //alert(arr);
    tmp = arr;
    txtGuestName.text=tmp[0];//GuestName
    
}*/
function OnPopup()
{
	var path = System.RootURL + '/standard/forms/60/25/60250020_popup_receive_change_room.aspx';
	   var obj = System.OpenModal( path ,550 , 550,  'resizable:yes;status:yes');
	   if ( obj != null )
	   {
			if(obj[2]!=txtRoom.text)
			{
				txt_room_allocate_pk_to.text = obj[0]; 
				txtRoom2.text = obj[2];
				txtGuestName2.text = obj[4];
				dtArrival2.value = obj[5];
			}
			else
			{
				alert("you can not  send bill choose room the same."); 
			}
	   }
}
function OnSave()
{
	if(confirm('Are you sure to send this bill to room '+txtRoom2.text+'?'))
   {
		f_lag='update';
		dso_htfo00040_changed_room.StatusUpdate();
		dso_htfo00040_changed_room.Call();
   }
}
function OnClearPK()
{
	if(confirm('Are you sure to clear this bill to room '+txtRoom2.text+'?'))
   {
		txt_room_allocate_pk_to.text="";
		txtRoom2.text="";
		txtGuestName2.text="";
		dtArrival2.text="";
		f_lag='update';
		dso_htfo00040_changed_room.StatusUpdate();
		dso_htfo00040_changed_room.Call();
   }
}
var f_lag='update';
function OnDataReceive(obj)
{
	if(obj.id=='dso_htfo00040_changed_room')
	{
		/*if(f_lag=='update')
		{
			f_lag='select';
			dso_htfo00040_changed_room.Call("SELECT");
		}*/
	}
}
</script>
<body>
<gw:data id="dso_htfo00040_changed_room" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso  type="control" parameter="0,5"  function="st_ht_sel_60250020_changed_room" procedure="st_ht_upd_60250020_changed_room">
			<inout>
				<inout bind="txt_room_allocate_pk_from" /> 
				<inout bind="txtRoom" />
				<inout bind="txtGuestName" />
				<inout bind="dtArrival" />
				<inout bind="dtDeparture" />
				<inout bind="txt_room_allocate_pk_to" />
				<inout bind="txtRoom2"/>
				<inout bind="txtGuestName2"/>
				<inout bind="dtArrival2"/>   
			</inout>
		</dso> 
	</xml> 
</gw:data>
    <table style="width: 100%; height: 100%" border="0">
        <tr valign="top" style="height: 17%">
            <td colspan="2">
                <table width="100%" cellpadding="0" cellspacing="0">
					<tr style="height: 20%">
                        <td  style="background-color:#BDE9FF;width:10%;padding-right:2px" align="left">
                           
                        </td>
                        <td style="background-color:#BDE9FF;width:20%;padding-right:2px" align="right">
                           SEND TO 
                        </td>
                        <td style="background-color:#BDE9FF;width:20%;padding-right:2px" align="left">
                            ANOTHER ROOM
                        </td>
                        <td style="background-color:#BDE9FF;width:50%;padding-right:2px">
                            
                        </td>
                    </tr>
					<tr style="height: 10%">  
                        <td style="background-color:#FF6600;padding-right:2px"> 
                           From
                        </td>
                        <td style="background-color:#FF6600;padding-right:2px">
                          
                        </td>
                        <td style="background-color:#FF6600;padding-right:2px">
                            
                        </td>
                        <td style="background-color:#FF6600;padding-right:2px">
                            
                        </td>
                    </tr>
                    <tr style="height: 10%">
                        <td style="padding-right:2px" align="left">
                            Room#
                        </td>
                        <td >
                            <gw:textbox id="txtRoom" readonly="true"  styles="text-align:center;width:100%;" />
                        </td>
                        <td style="padding-right:2px" align="right">
                            Guest Name
                        </td>
                        <td style="width:27%">
                            <gw:textbox id="txtGuestName" readonly="true"  styles="text-align:left;width:100%;" /> 
                        </td>
                    </tr>
					<tr style="height: 10%">
                        <td style="padding-right:2px" align="left">
                            Arrival
                        </td>
                        <td style="width:6%">
                            <gw:datebox id="dtArrival" lang="1" styles="width:100%" />
                        </td>
                        <td style="width:10%;padding-right:2px" align="right">
                            Departure
                        </td>
                        <td style="width:27%">
                            <gw:datebox id="dtDeparture" lang="1" styles="width:100%" />
                        </td>
                    </tr>
					<tr style="height: 10%">
                        <td style="background-color:#993366;width:25%;padding-right:2px">
                           To
                        </td>
                        <td style="background-color:#993366;width:25%;padding-right:2px">
                          
                        </td>
                        <td style="background-color:#993366;width:25%;padding-right:2px">
                            
                        </td>
                        <td style="background-color:#993366;width:25%;padding-right:2px">
                            
                        </td>
                    </tr>
					<tr style="height: 10%">
                        <td style="width:15%;padding-right:2px" align="left">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopup()">Room#:</b>
                        </td>
                        <td style="width:6%">
                            <gw:textbox id="txtRoom2" readonly="true"  styles="text-align:center;width:100%;" />
                        </td>
                        <td style="width:10%;padding-right:2px" align="right"> 
                           <gw:icon id="btnClear" text="Clear" onclick="OnClearPK()"  styles="width: 100%"/>
                        </td>
                        <td style="width:27%">
                          
                        </td>
                    </tr>
					<tr style="height: 10%">
                        <td style="width:15%;padding-right:2px" align="left">
                            Guest Name:
                        </td>
                        <td style="width:6%">
                            <gw:textbox id="txtGuestName2" readonly="true"  styles="text-align:left;width:100%;" />
                        </td>
                        <td style="width:10%;padding-right:2px" align="right">
                          Arrival: 
                        </td>
                        <td style="width:27%">
                          <gw:datebox id="dtArrival2" lang="1" styles="width:100%" />  
                        </td>
					</tr>
					<tr style="height: 10%">
                        <td style="width:15%;padding-right:2px" align="left">
                          
                        </td>
                        <td style="width:6%">
                           
                        </td>
                        <td style="width:10%;padding-right:2px" align="left">
                         <gw:icon id="btnSave" text="Save" onclick="OnSave()"  styles="width: 100%"/>
                        </td>
                        <td style="width:27%">
                          
                        </td>
					</tr>
                </table>
            </td>
        </tr>
		<tr style="height: 83%"></tr> 
    </table>
    <gw:textbox id="txt_room_allocate_pk_from" styles="width:100%;display:none" />
	<gw:textbox id="txt_room_allocate_pk_to" styles="width:100%;display:none" />
    <!------------------------------------------------------------------------>
</body>
</html>
