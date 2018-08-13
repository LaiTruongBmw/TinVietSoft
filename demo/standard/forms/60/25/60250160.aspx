<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Spa Revenue</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
    //FormatForm();
	dtDate.SetEnable(false);
    OnSearch();
    
}

function FormatForm()
{ 
	 txtDepExRoom.SetEnable(false);
     txtDepExPax.SetEnable(false);
     txtDepAcRoom.SetEnable(false);
     txtDepAcPax.SetEnable(false);
     txtArrExRoom.SetEnable(false);
     
     txtArrExPax.SetEnable(false);
     txtArrAcRoom.SetEnable(false);
     txtArrAcPax.SetEnable(false);
     txtPreAssRoom.SetEnable(false);
     txtPreAssPax.SetEnable(false);
     
     txtCurOccRoom.SetEnable(false);
     txtCurOccPax.SetEnable(false);
     txtExStRoom.SetEnable(false);
     txtExStPax.SetEnable(false);
     txtEaDepRoom.SetEnable(false);
     
     txtEaDepPax.SetEnable(false);
     txtDayRoomRoom.SetEnable(false);
     txtDayRoomPax.SetEnable(false);
     txtWalkInRoom.SetEnable(false);
     txtWalkInPax.SetEnable(false);
     
     txtVC.SetEnable(false);
     txtVD.SetEnable(false);
     txtOC.SetEnable(false);
     txtOD.SetEnable(false);
     txtOOO.SetEnable(false);
     
     txtTotalRooms.SetEnable(false);
     txtTotalAvaiRooms.SetEnable(false);
     txtAvalTonightRoom.SetEnable(false);
     txtSaleAvaiRoom.SetEnable(false);
     txtOccTonightRoom.SetEnable(false);
     
     txtOccTonightPax.SetEnable(false);
     txtOccTonightPercent.SetEnable(false);
     txtCompUse.SetEnable(false);
     txtHouseUse.SetEnable(false);
     txtOccWoCpHu.SetEnable(false);
     
     txtOccWoCpHuPercent.SetEnable(false);
     txtOccWoHu.SetEnable(false);
     txtOccWoHuPercent.SetEnable(false);
     txtForecast.SetEnable(false);
     txtAverage.SetEnable(false);
     
     txtRoomRevPax.SetEnable(false);
}
function OnSearch()
{
    data_htfo00611.Call("SELECT");
}


 function OnDataReceive(obj)
 {
 SettimeReSearch();

}
var mTimer;
function SettimeReSearch()
{
  mTimer = setTimeout('OnSearch();',3000000); //Refresh every 5 minutes 
}

</script>

<body>
    <!----------------------------------------------------------------------------------------------->
    <gw:data id="data_htfo00611" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control"  function="st_ht_sel_60250160"> 
                
                <inout>
                     <inout  bind="dtDate" />
                     <inout  bind="txtDepExRoom" />
                     <inout  bind="txtDepExPax" />
                     <inout  bind="txtDepAcRoom" />
                     <inout  bind="txtDepAcPax" />
                     <inout  bind="txtArrExRoom" />
                     
                     <inout  bind="txtArrExPax" />
                     <inout  bind="txtArrAcRoom" />
                     <inout  bind="txtArrAcPax" />
                     <inout  bind="txtPreAssRoom" />
                     <inout  bind="txtPreAssPax" />
                     
                     <inout  bind="txtCurOccRoom" />
                     <inout  bind="txtCurOccPax" />
                     <inout  bind="txtExStRoom" />
                     <inout  bind="txtExStPax" />
                     <inout  bind="txtEaDepRoom" />
                     
                     <inout  bind="txtEaDepPax" />
                     <inout  bind="txtDayRoomRoom" />
                     <inout  bind="txtDayRoomPax" />
                     <inout  bind="txtWalkInRoom" />
                     <inout  bind="txtWalkInPax" />
                     
                     <inout  bind="txtVC" />
                     <inout  bind="txtVD" />
                     <inout  bind="txtOC" />
                     <inout  bind="txtOD" />
                     <inout  bind="txtOOO" />
                     
                     <inout  bind="txtTotalRooms" />
                     <inout  bind="txtTotalAvaiRooms" />
                     <inout  bind="txtAvalTonightRoom" />
                     <inout  bind="txtSaleAvaiRoom" />
                     <inout  bind="txtOccTonightRoom" />
                     
                     <inout  bind="txtOccTonightPax" />
                     <inout  bind="txtOccTonightPercent" />
                     <inout  bind="txtCompUse" />
                     <inout  bind="txtHouseUse" />
                     <inout  bind="txtOccWoCpHu" />
                     
                     <inout  bind="txtOccWoCpHuPercent" />
                     <inout  bind="txtOccWoHu" />
                     <inout  bind="txtOccWoHuPercent" />
                     <inout  bind="txtForecast" />
                     <inout  bind="txtAverage" />
                     
                     <inout  bind="txtRoomRevPax" />
					 <inout  bind="txtOutOfOrder" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="height: 100%">
            <td style="width: 45%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 100%; white-space: nowrap" colspan="3">
                            <table style="width: 100%;height:100%">
                                <tr style="height: 1%">
                                    <td style="width: 40%" align="center">
                                        Date :</td>
                                    <td style="width: 40%">
                                        <gw:datebox id="dtDate" lang="1" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn img="search" alt="Refesh" id="btnSearch" onclick="OnSearch()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 20%">
                        <td style="width: 100%; white-space: nowrap" colspan="3">
                            <fieldset style="width: 100%; height: 100%">
                                <table style="width: 100%; height: 100%" >
                                    <tr style="height: 1%">
                                        <td style="width: 100%; white-space: nowrap" colspan="3">
                                            <b>
                                                <h4>
                                                    Rooms Summary</h4>
                                            </b>
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Total Hotel Rooms
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtTotalRooms" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Total Available Rooms&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtTotalAvaiRooms" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Out Of Order
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtOutOfOrder" styles="width:100%" type="number" format="###,###" readonly ="T" />
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Total Saleable Rooms
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtSaleAvaiRoom" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 70%">
                        <td style="width: 100%; white-space: nowrap" colspan="3">
                            <fieldset style="width: 100%; height: 100%">
                                <table style="width: 100%; height: 100%" >
                                    <tr style="height: 1%">
                                        <td style="width: 100%; white-space: nowrap" colspan="3">
                                            <b>
                                                <h4>
                                                    Movement</h4>
                                            </b>
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                        </td>
                                        <td style="width: 49%; white-space: nowrap" align="center">
                                            Room
                                        </td>
                                        <td style="width: 49%; white-space: nowrap" align="center">
                                            PAX
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Departure Expected
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtDepExRoom" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtDepExPax" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Departure Actual
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtDepAcRoom" styles="width:100%" type="number" format="###,###.###" readonly ="T"/>
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtDepAcPax" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Arrival Expected
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtArrExRoom" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtArrExPax" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Pre-Assigned Rooms
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtPreAssRoom" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtPreAssPax" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Arrival Actual
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtArrAcRoom" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtArrAcPax" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Current Occupied
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtCurOccRoom" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtCurOccPax" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Extended Stays
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtExStRoom" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtExStPax" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Early Departures
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtEaDepRoom" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtEaDepPax" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Day Rooms
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtDayRoomRoom" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtDayRoomPax" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Same Day Reservations
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtSaDaReRoom" styles="width:100%" readonly ="T" />
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtSaDaRePax" styles="width:100%" readonly ="T"  />
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Walk In
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtWalkInRoom" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 49%; white-space: nowrap">
                                            <gw:textbox id="txtWalkInPax" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 55%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 35%">
                        <td style="width: 100%; white-space: nowrap" colspan="3">
                            <fieldset style="width: 100%; height: 100%">
                                <table style="width: 100%; height: 100%">
                                    <tr style="height: 1%">
                                        <td style="width: 100%; white-space: nowrap" colspan="5">
                                            <b>
                                                <h4>
                                                    Housekepping (Current Status)</h4>
                                            </b>
                                        </td>
                                    </tr>
                                    
                                    <tr style="height: 1%">
                                        <td style="width: 15%; white-space: nowrap" align="right">
                                            VC
                                        </td>
                                        <td style="width: 20%; white-space: nowrap" align="center">
                                            <gw:textbox id="txtVC" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 5%; white-space: nowrap" align="right">
                                            VD
                                        </td>
                                        <td style="width: 20%; white-space: nowrap">
                                            <gw:textbox id="txtVD" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 9%; white-space: nowrap">
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 15%; white-space: nowrap" align="right">
                                            OC
                                        </td>
                                        <td style="width: 20%; white-space: nowrap" align="center">
                                            <gw:textbox id="txtOC" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 5%; white-space: nowrap" align="right">
                                            OD
                                        </td>
                                        <td style="width: 20%; white-space: nowrap">
                                            <gw:textbox id="txtOD" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 9%; white-space: nowrap">
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 15%; white-space: nowrap" align="right">
                                            OOO
                                        </td>
                                        <td style="width: 20%; white-space: nowrap" align="center">
                                            <gw:textbox id="txtOOO" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 5%; white-space: nowrap" align="center">
                                            
                                        </td>
                                        <td style="width: 20%; white-space: nowrap">
                                            
                                        </td>
                                        <td style="width: 9%; white-space: nowrap">
                                        </td>
                                    </tr>
                                    <tr style="height: 50%">
                                        <td style="width: 1%; white-space: nowrap">
                                            
                                        </td>
                                        <td style="width: 20%; white-space: nowrap" align="center">
                                           
                                        </td>
                                        <td style="width: 5%; white-space: nowrap" align="center">
                                            
                                        </td>
                                        <td style="width: 20%; white-space: nowrap">
                                            
                                        </td>
                                        <td style="width: 9%; white-space: nowrap">
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 65%">
                        <td style="width: 100%; white-space: nowrap" colspan="3">
                            <fieldset style="width: 100%; height: 100%">
                                <table style="width: 100%; height: 100%">
                                    <tr style="height: 1%">
                                        <td style="width: 100%; white-space: nowrap" colspan="5">
                                            <b>
                                                <h4>
                                                    End Of Day Projection</h4>
                                            </b>
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                        </td>
                                        <td style="width: 30%; white-space: nowrap" align="center">
                                            Room
                                        </td>
                                        <td style="width: 30%; white-space: nowrap" align="center">
                                            PAX
                                        </td>
                                        <td style="width: 30%; white-space: nowrap">
                                        </td>
                                        <td style="width: 9%; white-space: nowrap">
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Available Tonight
                                        </td>
                                        <td style="width: 30%; white-space: nowrap" align="center">
                                            <gw:textbox id="txtAvalTonightRoom" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 30%; white-space: nowrap" align="center">
                                            <gw:textbox id="txtAvalToPax" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 30%; white-space: nowrap">
                                        </td>
                                        <td style="width: 9%; white-space: nowrap">
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Occupied Tonight
                                        </td>
                                        <td style="width: 30%; white-space: nowrap" align="center">
                                            <gw:textbox id="txtOccTonightRoom" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 30%; white-space: nowrap" align="center">
                                            <gw:textbox id="txtOccTonightPax" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 30%; white-space: nowrap">
                                            <gw:textbox id="txtOccTonightPercent" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 9%; white-space: nowrap">
                                            %
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Comp/House Use &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                        </td>
                                        <td style="width: 30%; white-space: nowrap" align="center">
                                            <gw:textbox id="txtCompUse" styles="width:50%" type="number" format="###,###.###" readonly ="T" />
                                            <gw:textbox id="txtHouseUse" styles="width:50%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 30%; white-space: nowrap" align="center">
                                        </td>
                                        <td style="width: 30%; white-space: nowrap">
                                        </td>
                                        <td style="width: 9%; white-space: nowrap">
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td colspan="5">
                                            <hr />
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Occ w/o CP,HU
                                        </td>
                                        <td style="width: 30%; white-space: nowrap" align="center">
                                            <gw:textbox id="txtOccWoCpHu" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 30%; white-space: nowrap" align="center">
                                        </td>
                                        <td style="width: 30%; white-space: nowrap">
                                            <gw:textbox id="txtOccWoCpHuPercent" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 9%; white-space: nowrap">
                                            %
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%; white-space: nowrap">
                                            Occ w/o HU
                                        </td>
                                        <td style="width: 30%; white-space: nowrap" align="center">
                                            <gw:textbox id="txtOccWoHu" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 30%; white-space: nowrap" align="center">
                                        </td>
                                        <td style="width: 30%; white-space: nowrap">
                                            <gw:textbox id="txtOccWoHuPercent" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                        <td style="width: 9%; white-space: nowrap">
                                            %
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%">
                                            Forecast Rm Revenue (Definite+Tentative)
                                        </td>
                                        <td style="width: 30%; white-space: nowrap" colspan="2">
                                            <gw:textbox id="txtForecast" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%">
                                            Average Room Rate (Inc Comp,Exc HU)
                                        </td>
                                        <td style="width: 30%; white-space: nowrap" colspan="2">
                                            <gw:textbox id="txtAverage" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                    </tr>
                                    <tr style="height: 1%">
                                        <td style="width: 1%">
                                            Room Rev PAX
                                        </td>
                                        <td style="width: 30%; white-space: nowrap" colspan="2">
                                            <gw:textbox id="txtRoomRevPax" styles="width:100%" type="number" format="###,###.###" readonly ="T" />
                                        </td>
                                    </tr>
                                    <tr style="height: 10%">
                                        <td style="width: 1%">
                                            &nbsp;
                                        </td>
                                        <td style="width: 30%; white-space: nowrap" colspan="2">
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txt_pk" style="display: none" />
</body>
</html>
