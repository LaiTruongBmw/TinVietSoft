<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<%  CtlLib.SetUser("CRM")%>

<script>
 
 function BodyInit()
 {
	dtDate.value = "<%=Request.QueryString("p_date")%>" ;
    txtRoomType.text  = "<%=Request.QueryString("p_room_type")%>" ;
	txtparnerPK.text  = "<%=Request.QueryString("p_parner_pk")%>" ;

	dtDate.SetEnable(false);
	
   dsoDetail.Call("SELECT");
 }
//=========================================================================
 function OnDataReceive(dso){
    var lock_room_qty = 0;
		if(grdDetail.rows > 1){
			lblTotalRoom.text = grdDetail.GetGridData(1,6);
			for(var i=0; i < grdDetail.rows-1; i++){
				if(grdDetail.GetGridData(i,10) != "DMY"){
					lock_room_qty++;
				}
			}
			lblNARooms.text = ""+lock_room_qty;
			lblAVRooms.text = Number(lblTotalRoom.text)-Number(lblNARooms.text);
		}
 }
 function OnShowAllotment()
 {
	var path = System.RootURL + "/standard/forms/ht/rm/htrm00010_allotment_popup.aspx?p_date=" + dtDate.GetData()+"&p_room_type="+txtType.text;
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
           <dso  type="grid"  function="crm.sp_sel_htbk00150_allotment" >
                <input  bind="grdDetail">
					<input bind="txtRoomType" />
					<input bind="dtDate" />	
					<input bind="txtparnerPK" />
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
                            
                        </td>
                        <td style="width: 10%; white-space: nowrap">
                            <gw:label id="lblTotalRoom" styles="display: none" />
                        </td>
                        <td align="right" style="width:15%; white-space: nowrap">
                            
                        </td>
                        <td style="width:5%; white-space: nowrap">
                            <gw:label id="lblNARooms" styles="display: none" />
                        </td>
						<td align="right" style="width:15%; white-space: nowrap">
                            
                        </td>
                        <td style="width:5%; white-space: nowrap">
                            <gw:label id="lblAVRooms" styles="display: none" />
                        </td>
						<td style="width: 4%"><gw:icon text="Allotment & Commitment" styles="display: none" id="btnShow" onclick="OnShowAllotment()" /></td>
						<td style="width: 3%" align="right">
							<gw:imgbtn id="btnReport1" img="excel" styles="display: none" alt="Total Occ Booking" onclick="OnReport()" />
						</td>

                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
            <td colspan=9>
                <gw:grid id='grdDetail' 
				    header='Company Name|Guest Name|_First Name|Arrival|Departure|RSV#/RM#|_Total_Room|Status|Allotment/Commitment|Rate|Deposit|RM.Type|Group|Note'
                    format='0|0|0|4|4|0|0|0|0|0|-0|0|0|0'
                    sorting='T' styles='width:100%; height:100%'
                    autosize="T" />
            </td>
        </tr>
    </table>
    <gw:textbox id="txtRoomType" styles="display: none" /> 
	<gw:textbox id="txtparnerPK" styles="display: none" />
</body>

</html>
