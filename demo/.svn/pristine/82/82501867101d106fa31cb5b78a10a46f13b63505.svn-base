<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Guest Arriving</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 
    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
 function OnSearch()
 {
    data_htfo00020.Call("SELECT");
 }
 function BodyInit()
 {
    var data;
	OnSearch();
 }
 function OnClickGrid()
 {
    if(grdArriving.rows-1 >0)
    {
       // grdArriving.row=-1;
    }
 }
 function OnReport()
 {
	var url = '/standard/reports/60/28/rpt_60280140.aspx?p_dt_frm='+ dtFrom.value+'&p_dt_to='+dtTo.value+'&P_DummyRoom='+txtDummyRoom.text+'&p_GroupName='+txtGroupName.text;
			System.OpenTargetPage( System.RootURL+url , "newform" );  

 }
 function OnDataReceive(obj)
 {
	 if(obj.id=='data_htfo00020')
	 {
		if(grdArriving.rows > 0)
		{
			txtCount.text=grdArriving.rows-1 + "   Guest(s).";
			grdArriving.Subtotal( 1, 2, -1, '4');
		}
	 }
 }
//=========================================================================
 
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htfo00020" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"  function="st_ht_sel_60280140" >
                <input  bind="grdArriving">
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
					<input bind="txtDummyRoom" /> 
					<input bind="txtGroupName" />
                </input> 
                <output bind="grdArriving" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 5%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td align="right" style="width: 6%; white-space: nowrap">
                             Date
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" onchange="OnSearch()" />
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" onchange="OnSearch()" />
                        </td>
						 <td style="width: 3%" align="right">
                        </td>
						<td align="right" style="width: 6%; white-space: nowrap">
                             Dummy Room:
                        </td>
                        <td style="width:14%; white-space: nowrap">
                            <gw:textbox id="txtDummyRoom" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
						<td align="right" style="width: 6%; white-space: nowrap">
                             Group Name:
                        </td>
                        <td style="width:14%; white-space: nowrap">
                            <gw:textbox id="txtGroupName" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
						<td style="width: 3%; white-space: nowrap" align="center">
                            <gw:imgbtn id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td width="3%" align="right">
                            <gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnReport()" styles="width: 100%" />
                        </td>
                        <td align="right" style="width: 7%">
							 <b>Total:</b></td>
						 <td style="width: 14%" align="center">
							 <gw:label id="txtCount" />
						 </td>
                        <td style="width: 6%" align="right">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
            <td>
                <gw:grid id='grdArriving' header='Date|Dummy|Room|Room Type|Rate(VND)|Group Name|Guest Name|Rate Plan|Checkin|Checkout'
                    format='4|0|0|0|-0|0|0|0|4|4' 
					aligns='0|0|0|0|0|0|0|0|0|0'                    
					editcol='0|0|0|0|0|0|0|0|0|0'
                    widths='0|0|0|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T"  />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
