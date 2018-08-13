<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Guest Detail</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>

function BodyInit()
{
	var data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='NAT'")%>";
	grdData.SetComboFormat(1, data);//nation
	var room_pk = '<%=Request.QueryString("p_room_pk") %>';
	var date = '<%=Request.QueryString("p_date") %>';
	var color = '<%=Request.QueryString("p_color") %>';
	txtRoom_PK.text = room_pk;
	txtDate.text = date;
	if(color == '15631086')//in 206
	{
	    
		data_htfo00110_in.Call('SELECT');
	}
	else if(color == '11776983')//reserved
	{
	    data_htfo00110_reserved.Call('SELECT');
	}
	else if(color == '3368499')//guaranted
	{
	    data_htfo00110_guaranted.Call('SELECT');
	}
	else if(color == '9868950'){
		alert('Please print out of order report at Room Status(HseKeeping) form to see detail data');
	}
}
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htfo00110_in" onreceive="">
        <xml>
           <dso  type="grid"  function="st_ht_sel_60250050_in" >
                <input  bind="grdData">
                    <input bind="txtRoom_PK" />
					<input bind="txtDate" />
                </input> 
                <output bind="grdData" /> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="data_htfo00110_reserved" onreceive="">
        <xml>
           <dso  type="grid"  function="st_ht_sel_60250050_reserved" >
                <input  bind="grdData">
                    <input bind="txtRoom_PK" />
					<input bind="txtDate" />
                </input> 
                <output bind="grdData" /> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="data_htfo00110_guaranted" onreceive="">
        <xml>
           <dso  type="grid"  function="st_ht_sel_60250050_guaranted" >
                <input  bind="grdData">
                    <input bind="txtRoom_PK" />
					<input bind="txtDate" />
                </input> 
                <output bind="grdData" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 100%">
            <td>
                <gw:grid id='grdData' header='Guest Name|Nation|Adult|Child|Total Amt|From Date|To Date|Reservation#|Status|Request'
                    format='0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|3|3|3|0|0|0|0|0'
					editcol='0|0|0|0|0|0|0|0|0|0'
                    widths='1000|1000|1000|1000|1000|1000|1000|1000|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T"/>
            </td>
        </tr>
    </table>
    <gw:textbox id="txtRoom_PK" styles="display: none" />
    <gw:textbox id="txtDate" styles="display: none" />
    <!------------------------------------------------------------------>
</body>
</html>
