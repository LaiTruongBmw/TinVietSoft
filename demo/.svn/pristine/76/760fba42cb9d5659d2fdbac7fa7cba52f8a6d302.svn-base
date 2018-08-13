<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head id="Head1" runat="server">
    <title>Check In</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>

var COL_PK=0,
	COL_THT_ROOM_ALLOCATE_PK=1,
	COL_Guest_Name=2,
	COL_Room=3,
	COL_Date=4,
	COL_Advance_Amt_USD=5,
	COL_Ex_Rate=6,
	COL_Advance_Amt_VND=7,
	COL_Payment_Method=8,
	Remark=9;
function BodyInit()
{
	var data="";
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT code,NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='PTYPE'")%>";
	grdMST.SetComboFormat(COL_Payment_Method, data);//payment method
	OnSearch();
}

function OnSearch()
{
	dso_htfo00470.Call('SELECT');
}
function OnDataReceive(obj)
{
	if(obj.id=='dso_htfo00470')
	{
		 if(grdMST.rows > 1)
			{
				grdMST.Subtotal( 1, 2, -1, '5!7');
			}
	}
	
}
function OnReport(obj)
{
	if(obj=='1')
	{
		 if(grdMST.row !='-1')
		 {
			var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/fo/htfo00180_advance.rpt&procedure=sp_sel_htfo00180_deposit_rpt&parameter="+
			grdMST.GetGridData(grdMST.row, 0);
			System.OpenTargetPage(url); 
		 }
		 else
		 {
			alert("Please,choose guest name to print.");
		 }
	}
	if(obj=='All')
	{
		if(grdMST.rows >1)
		{
			var url =System.RootURL + '/standard/reports/ho/28/rpt_60280110_Deposit_List.aspx?p_dtfrom='+dtFrom.value+'&p_dtto='+dtTo.value+'&p_room_no='+txtRoom.text;
			System.OpenTargetPage(url);  
		}
	}
}
</script>
<body>
<gw:data id="dso_htfo00470" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid"  function="ht_sel_60280110_advance_list">   
			<input bind="grdMST">
				<input bind="dtFrom" />
				<input bind="dtTo" />
				<input bind="txtRoom" />
				<input bind="chkDeposit" />
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
					<td style="width: 5%" align="right">Date :</td>
					<td style="width: 18%" >
						 <gw:datebox id="dtFrom" lang="1" styles="width:100%" onchange="OnSearch()" />
                            ~<gw:datebox id="dtTo" lang="1" styles="width:100%" onchange="OnSearch()" />
					</td>
					<td style="width: 5%" align="right" nowrap >Room</td>
					<td style="width: 10%" >
						<gw:textbox id="txtRoom" styles="width: 100%"  onenterkey="OnSearch()" />
					</td>
					<td width="35%">
                            <gw:checkbox id="chkDeposit" defaultvalue="Y|N" value="Y" onchange="OnSearch()" />
                            <b>(Check: Deposit UnDelete, Uncheck: Deposit Delete)</b>
                        </td>
					<td style="width: 3%" >
						<gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
					</td>
					<td style="width: 3%">
                       <gw:imgbtn id="ibtnReport" img="printer" alt="Print" style="display: none" onclick="OnReport('1')" />     
                    </td>
					<td style="width: 3%">
                       <gw:imgbtn id="ibtnReport1" img="excel" alt="Report" onclick="OnReport('All')" />   
                    </td>
					<td style="width: 18%" align="right">	
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr style="width: 100%; height: 30%; background: white">
		<td style="width: 100%">
			<gw:grid id="grdMST" 
			header="Folio#|_THT_ROOM_ALLOCATE_PK|Guest Name|Room|Date|Advance Amt(USD)|Ex.Rate|Advance Amt(VND)|Payment Method|Remark|Checkin Date|checkout Date|Create By|Create Date|Reason Delete|Delete(Y/N)" 
			format="0|0|0|0|4|-1|-0|-0|0|0|4|4|0|0|0|0" 
			aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
			defaults="|||||||||||||||" 
			editcol="0|0|1|0|1|1|0|1|1|1|0|0|0|0|0|0" 
			widths="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
			styles="width:100%;height:100%"
			autosize='T' acceptnulldate="T"
			debug='false' />
		</td>
	</tr>
</table>
<gw:textbox id="txt_THT_ROOM_ALLOCATE_PK" style="display: none" />
</body>
<!--------------------------------------------------------------------------------------->
</html>
