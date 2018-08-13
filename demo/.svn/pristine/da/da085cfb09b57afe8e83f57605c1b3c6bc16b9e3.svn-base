<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 
 function BodyInit()
 {
	dtDate.value = "<%=Request.QueryString("d")%>" ;
    txtType.text  = "<%=Request.QueryString("type")%>" ;

	dtDate.SetEnable(false);
	
   dsoDetail.Call("SELECT");
 }
//=========================================================================
 function OnDataReceive(dso){
    var lock_room_qty = 0;
		if(grdDetail.rows > 1){
			lblTotalRoom.text = grdDetail.GetGridData(1,10);
			for(var i=0; i < grdDetail.rows-1; i++){
				if(grdDetail.GetGridData(i,14) != "DMY"){
					lock_room_qty++;
				}
			}
			lblNARooms.text = ""+lock_room_qty;
			lblAVRooms.text = Number(lblTotalRoom.text)-Number(lblNARooms.text);
		}
 }
 function OnShowAllotment()
 {
	var path = System.RootURL + "/standard/forms/60/24/60240030_allotment_popup.aspx?p_date=" + dtDate.GetData()+"&p_room_type="+txtType.text;
       var object = System.OpenModal( path ,1000 ,500 ,  'resizable:yes;status:yes');
 }
 function OnReport()
 {
	if(grdDetail.rows > 1)
	 {
		var url = '/standard/reports/ht/rm/rpt_htrm00010_show_bk_detail.aspx?p_date='+dtDate.GetData()+"&p_room_type="+txtType.text + "&p_total_room=" + lblTotalRoom.text +"&p_N_A_Room="+lblNARooms.text+"&p_available_room="+ lblAVRooms.text;
	    System.OpenTargetPage( System.RootURL+url , "newform" );
	 }
    
 }
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="dsoDetail" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"  function="st_ht_sel_60240030_popup1" >
                <input  bind="grdDetail">
                    <input bind="dtDate" />
					<input bind="txtType" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 5%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
					    <td align="right" style="width:5%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width:10%; white-space: nowrap">
                            <gw:datebox id="dtDate" lang="1" />
                        </td>
                        <td align="right" style="width:15%; white-space: nowrap">
                            Total rooms:
                        </td>
                        <td style="width: 10%; white-space: nowrap">
                            <gw:label id="lblTotalRoom"/>
                        </td>
                        <td align="right" style="width:15%; white-space: nowrap">
                            N/A Rooms:
                        </td>
                        <td style="width:5%; white-space: nowrap">
                            <gw:label id="lblNARooms"/>
                        </td>
						<td align="right" style="width:15%; white-space: nowrap">
                            Available Rooms:
                        </td>
                        <td style="width:5%; white-space: nowrap">
                            <gw:label id="lblAVRooms"/>
                        </td>
						<td style="width: 4%"><gw:icon text="Allotment & Commitment" id="btnShow" onclick="OnShowAllotment()" /></td>
						<td style="width: 3%" align="right">
							<gw:imgbtn id="btnReport1" img="excel" alt="Total Occ Booking" onclick="OnReport()" />
						</td>

                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
            <td colspan=9>
                <gw:grid id='grdDetail' 
				    header='Company Name|Guest Name|_First Name|Arrival|Departure|RSV#|RSV#/RM#|Service Name|Qty|Service2 Name|Qty2|_Total_Room|Status|Allotment/Commitment|Rate|Deposit|RM.Type|Group|Note|_room_no'
                    format='0|0|0|4|4|0|0|0|-0|0|-0|0|0|0|0|-0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%'
                    autosize="T" />
            </td>
        </tr>
    </table>
    <gw:textbox id="txtType" styles="display: none" />
</body>

</html>
