<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head id="Head1" runat="server">
    <title>Check In</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var _user_id = "<%=Session("USER_ID")%>";
function BodyInit()
 {
	//var l_date=(dtDate.GetData());
	//var l_date_from=l_date.substring(0,6)+"01";
	//dtDate.value=l_date_from;
	grdMST.GetGridControl().FrozenCols = 5;
	OnSearch();
 }
function OnSearch()
{
	dso_htfo00270.Call('SELECT');
}
function OnDataReceive(obj)
{
	if(obj.id=='dso_htfo00270')
	{
		
	}
}
function OnReport()
{
		if (grdMST.rows > 1)
		{
			//url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/fo/htfo00270_1.rpt&procedure=sp_sel_htfo00270_1_rpt&parameter="+dtDate.value+","+dtDateTo.value;   //+","+dtDateTo.value
			//System.OpenTargetPage(url);  
		}
}
function OnSave()
{
    if(grdMST.row !='-1')
	{
		if(grdMST.GetGridData(grdMST.row,0) =='-1')//check is Yes
		{
			if(confirm("Are you sure undo checkout?"))
			{
				dso_htfo00270.Call();
			}
		}
		else
		{
			alert("You must check one Room to undo checkout.");
		}
	}
	else
		{
			alert("You must check one Room to undo checkout.");
		}
}
</script>
<body>
<gw:data id="dso_htfo00270" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid" parameter="0,1"   function="HT_sel_60250100" procedure="HT_upd_60250100" >
			<input bind="grdMST">
				<input bind="txtRoom" />
			</input> 
			<output bind="grdMST" /> 
		</dso> 
	</xml> 
</gw:data>
<table style="height: 100%; width: 100%; background: #BDE9FF" border="0">
	<tr style="width: 100%; height: 1%">
		<td style="width: 100%; background: white" valign="top" >			
			<table style="width: 100%" border="0">
				<tr >
					<td style="width: 6%" align="right" nowrap >Room</td>
					<td style="width: 8%" >
						<gw:textbox id="txtRoom" styles="width: 100%" onenterkey="OnSearch()" />
					</td>
					<td style="width: 3%" >
						<gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
					</td>
					<td width="3%" align="right">
                            <gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnReport()" style="display: none" />
                    </td>
					<td style="width: 10%" align="right">
						<gw:icon id="btnSave" img="2" text="Undo Checkout" styles='width:100%' onclick="OnSave()" />
					</td>	
					<td width="70%" align="right">
                          <!--  <gw:imgbtn id="ibtnReport2" img="excel" alt="Print" onclick="OnExcel()" /> -->
                    </td>
				</tr>
			</table>
		</td>
	</tr>
	<tr style="width: 100%; height: 30%; background: white">
		<td style="width: 100%">
			<gw:grid id="grdMST" 
			header="Chk|_PK|Room#|Invoice No|Last Name|First Name|Checkin|Checkout|Night|Total Due|Actual Payed|Cash (VND)|Cash(USD)|Credit Card(VND)|Credit Card(USD)|AR(VND)|Room Charge|Restaurant|Minibar|Laudry|Spa|Lotus shop|Telephone|Others|Special Service|Advance|Adjust|Pay Method|Customer" 
			format="3|0|0|0|0|0|4|4|-0|-0|-0|-0|-0|1|-0|1|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0"			
			styles="width:100%;height:100%"
			autosize='T'
			debug='false'
			acceptnulldate="T"
			oncelldblclick="" />
		</td>
	</tr>
</table>
<gw:textbox id="txtMasterPK" style="display: none" />
<gw:textbox id="txtTEMP" style="display: none" />
</body>
<!--------------------------------------------------------------------------------------->
</html>
