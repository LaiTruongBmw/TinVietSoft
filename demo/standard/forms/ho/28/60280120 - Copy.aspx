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
	var data="";
	data = "<%=CtlLib.SetListDataSQL("SELECT code,NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='PTYPE' and code not in('PTYPE-04','PTYPE-09')" )%>|ALL|Select All"; 
	lstPaymentMethod.SetDataText(data);
	lstPaymentMethod.value = 'ALL';
	
	OnSearch();
 }
function OnSearch()
{
	dso_htfo00680.Call('SELECT');
}
function OnDataReceive(obj)
{
	if(obj.id=='dso_htfo00680')
	{
		txtCount.text=grdMST.rows-1+ "   Room(s).";
		if (grdMST.rows > 1)
		{		
				grdMST.Subtotal( 0, 2, -1, '8!9!10!11!12!13');
		}
	}
}
function OnReport()
{
		 var url = '/standard/reports/ho/28/rpt_60280120_cash_daily_summary2.aspx?p_date='+dtDate.value+'&p_date_to='+dtDateTo.value+'&p_room='+txtRoom.text+'&p_payment_method='+lstPaymentMethod.value+'&p_partner_PK='+txtCompany_PK.text +"&p_time_frm=" +  txtFromTime.text+"&p_time_to=" +  txtToTime.text+"&p_cashier=" +  txtCashier.text;
		 System.OpenTargetPage( System.RootURL+url , "newform" );      
}
function OnPopUp(obj)
{		
	if(obj=='customer_s')
	{
		var path = System.RootURL + "/standard/forms/ho/24/60240010_bus.aspx?";
			var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
			if ( object != null )
			{
				txtCompany_PK.text  = object[0]; 
				txtCompanyNameS.text			= object[3];
				OnSearch();
			}
	}
}
</script>
<body>
<gw:data id="dso_htfo00680" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid"   function="ht_sel_60280120" >
			<input bind="grdMST">
				<input bind="dtDate" />
				<input bind="dtDateTo" />
				<input bind="txtRoom" />
				<input bind="lstPaymentMethod" />
				<input bind="txtCompany_PK" />
				<input bind="txtFromTime" />
				<input bind="txtToTime" />
				<input bind="txtCashier" />
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
					<td style="width: 5%" align="right" nowrap >Date</td>
					<td style="width: 8%" >
						<gw:datebox id="dtDate" lang="<%=Session("Lang")%>" onchange="OnSearch()" />
					</td>
					<td style="width: 5%" align="right" nowrap >~<gw:datebox id="dtDateTo" lang="<%=Session("Lang")%>" onchange="OnSearch()" /></td>
					<td style="width: 8%" >
						
					</td>
					
					<td width="12%" align="right">
						Room
					 </td>
					<td style="width: 14%; white-space: nowrap">
						<gw:textbox id="txtRoom" styles="width: 100%" onenterkey="OnSearch()" />
					</td>
					<td style="width: 5%">
						Payment Method</td> 
					<td style="width: 19%; white-space: nowrap">
						<gw:list id="lstPaymentMethod" styles='width:100%' onchange='OnSearch()' />   
					</td>
					<td style="width: 1%" ><gw:imgbtn id="btnClearGolf" img="reset" alt="Reset" onclick="txtCompanyNameS.text='';txtCompany_PK.text='';" /></td>
					<td style="width: 5%" >Total :</td>
					<td style="width: 12%" align="center">
						 <gw:label id="txtCount" />
					</td>
					<td style="width: 3%" >
						<gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
					</td>
					<td width="3%" align="right">
                            <gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnReport()" />
                    </td>	
				</tr>
				<tr>
				    <td colspan="4">
				        <table style="width:100%">
				            <tr>
							    <td width="20%">Time</td>
				                <td width="80%">
								<gw:textbox id="txtFromTime" styles="width:40%" onenterkey="OnSearch()" />
								~
								<gw:textbox id="txtToTime" styles="width:40%" onenterkey="OnSearch()" />
							</td>
				            </tr>
				        </table>
				    </td>
				    <td align="right">Cashier ID</td>
				    <td><gw:textbox id="txtCashier" styles="width: 100%" onenterkey="OnSearch()" /></td>
					<td >
						<a href="#" onclick="OnPopUp('customer_s')">Customer</a></td> 
				    <td colspan="6"><gw:textbox id="txtCompanyNameS" styles="width:100%" readonly="true" /></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr style="width: 100%; height: 30%; background: white">
		<td style="width: 100%">
			<gw:grid id="grdMST" header="_pk|Room#|Folio#|Pay Date|Guest Name|Checkin Date|Checkout Date|Partner Name|Cash VND|Cash USD|Credit Card VND|Credit Card USD|Transfer|AR VND|Checkout By|Payment Method|_tco_buspartner_pk|Refund Amount" 
			format="0|0|0|4|0|4|4|0|-0|-2|-0|-2|-0|-0|0|0|0|-0"			
			styles="width:100%;height:100%"
			autosize='T'
			debug='false'
			acceptnulldate="T"
			oncelldblclick="OnGetRoom()" />
		</td>
	</tr>
</table>
<gw:textbox id="txtMasterPK" style="display: none" />
<gw:textbox id="txtTEMP" style="display: none" />
<gw:textbox id="txtCompany_PK" style="display: none" />
</body>
<!--------------------------------------------------------------------------------------->
</html>
