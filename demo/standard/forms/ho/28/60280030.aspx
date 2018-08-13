<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>vina genuwin</title>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

 <script>
      function BodyInit()
      {
        Bingding();
		OnSearch();
      }
      function Bingding()
      {
        
      }
     function OnSearch(){
        dso_Phone.Call("SELECT");
      }
	 function OnDataReceive(obj)
	 {
		if(obj.id=='dso_Phone')
		if(grdPhoneRevenue.rows >1)
		{
			lblRows.text = grdPhoneRevenue.rows-1+" row(s).";
			grdPhoneRevenue.Subtotal( 1, 2, -1,'11');
		}
	 } 
	 function OnPrint()
	 {
		var url = '/standard/reports/ho/28/rpt_60280030_telephone_revenue.aspx?p_dt_from='+dtFrom.value+ "&p_dt_to="+dtTo.value+"&p_room_no_name="+txtRoomNo.text;
		System.OpenTargetPage( System.RootURL+url , "newform" );
	 }
 </script>

</head>
<body>
    <gw:data id="dso_Phone" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid"  function="ht_sel_60280030" >  
                <input bind="grdPhoneRevenue"> 
					<input bind="dtFrom" />
					<input bind="dtTo"/>
                    <input bind="txtRoomNo" />   															
                </input> 
                <output bind="grdPhoneRevenue" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table width="100%" style="height: 100%">
        <tr style="height: 2%">
			<td width="5%" align = "right">
				Date
            </td>
			<td width="12%">
				<gw:datebox id="dtFrom" lang="1" styles="width:47%" onchange="OnSearch()" />
				~<gw:datebox id="dtTo" lang="1" styles="width:47%" onchange="OnSearch()" />
            </td>
            <td width="25%" align = "right">
                <b>Room No/Last Name/First Name</b></td>
            <td width="25%">
                <gw:textbox id="txtRoomNo" styles="width:100%" onenterkey="OnSearch()" />
            </td>
			<td width="6%" align = "right">
			Total:
			</td>
            <td width="22%">
                 <gw:label id="lblRows" />
            </td>
			<td width="3%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
			<td style="width: 3%" align="right">
				<gw:imgbtn img="excel" alt="Print" text="Print" id="btnReport" onclick="OnPrint()" />
			</td>
        </tr>
        <tr style="height: 98%">
            <td colspan="8">
                <gw:grid id="grdPhoneRevenue" header="Room No|Last Name|First Name|Checkin|checkOut|Night|Call Date|Start Time|Duration|Call Form|Call To|Amount|Destination|Trunk|Outgoing|Point"
                    format="0|0|0|4|4|0|4|0|0|0|0|-0|0|0|0|0" 
					aligns="0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0" 
					defaults="|||||||||||||||" 
					editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					sorting='T' autosize="T" acceptNullDate="T"
                    styles="width:100%; height:100%" />
            </td>
        </tr>
    </table>
</body>
</html>
