<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Popup  Again Booking</title>
    <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
	Bingding();
	OnSearch();
}

function Bingding()
{
	var data = '';
	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='NAT'" )%>"; 
	lstNation.SetDataText(data);
	lstNation.value = 'NAT-VIE';

	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='NAT'" )%>"; 
    grdRoom.SetComboFormat(3, data);//nation

	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CTYPE'" )%>"; 
    grdRoom.SetComboFormat(2, data);//cust type

	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='PMT'" )%>"; 
    grdRoom.SetComboFormat(8, data);//method

	dtFrom.SetDataText(System.AddDate(dtFrom.GetData(),-365));

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
function OnDataReceive(obj)
{
	if(obj.id=='dsoRoom')
	{
		
	}
}
</script>

</head>
<body>
    <!----------------------------------------------------------------------->
    <gw:data id="dsoRoom" onreceive="OnDataReceive(this)">
        <xml>
           <dso  type="grid"  function="ht_60240010_again_booking" >
                <input  bind="grdRoom">
                    <input bind="dtFrom" />
					<input bind="dtTo" />
					<input bind="txtGuestName" />
					<input bind="lstNation" />
					<input bind="txtContactName" />
                </input> 
                <output bind="grdRoom" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 5%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">Date</td>
                        <td style="width:20%; white-space: nowrap">
							 <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" onchange="OnSearch()" />
							~ 
							<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" onchange="OnSearch()" />
                        </td>						
						<td style="width: 10%; white-space: nowrap" align='right'>Guest Name</td>
						<td style="width: 20%; white-space: nowrap">
							<gw:textbox id="txtGuestName" onenterkey="OnSearch()" />
						</td>
						<td style="width: 10%; white-space: nowrap">
							Contact Name
						</td>
						<td style="width: 2%; white-space: nowrap"></td>
						<td style="width: 10%; white-space: nowrap">
							<gw:textbox id="txtContactName" onenterkey="OnSearch()" />
						</td>
						<td style="width: 5%; white-space: nowrap" align="right">Nation</td>
						<td style="width: 18%; white-space: nowrap">
							<gw:list id="lstNation" styles='width:100%' onchange='OnSearch()' />
						</td>
						<td style="width: 2%; white-space: nowrap"></td>       
						
						<td style="width: 1%; white-space: nowrap"></td>
						<td style="width: 1%" >
							<gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
						</td>
						<td style="width: 1%; white-space: nowrap">
						</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
            <td>
                <gw:grid id='grdRoom' header='Last Name|First Name|Cust Type|Nation|_tco_buspartner_pk|Company Name|Contact Name|Book Tel|Payment|Email|Arrival|Depart|_|_|_|_|_|_|_'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    defaults='||||||||||||||||||'
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T" oncelldblclick="OnGetRoom()" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
