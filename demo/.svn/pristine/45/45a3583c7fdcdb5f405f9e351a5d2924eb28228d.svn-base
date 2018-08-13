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
    dso_htfo00700.Call("SELECT");
 }
 function BodyInit()
 {
    var data;
    data = "<%=CtlLib.SetListDataSQL("SELECT CODE,NAME FROM tco_commcode WHERE PARENT_CODE = 'POINT' and use_yn='Y' and del_if=0 ORDER BY CODE")%>|OTHER_FEE|OTHER FEES(FO)|FOSPC|SPECIAL SERVICES(FO)|ALL|Select All";
	lstLocation.SetDataText(data);
	lstLocation.value='ALL';
	data = "<%=CtlLib.SetListDataSQL("SELECT A.* FROM (SELECT CODE, NAME FROM tco_commcode WHERE PARENT_CODE = 'FEES' and use_yn='Y' and del_if=0 UNION SELECT 'ALL','Select All' FROM DUAL) A ORDER BY CODE DESC")%>";
	lstTableName.SetDataText(data);
	lstTableName.value='ALL';
	OnSearch();
 }
 function OnClickGrid()
 {
    if(grdTransactionPosted.rows-1 >0)
    {
        grdTransactionPosted.row=-1;
    }
 }
 function OnReport()
 {
	if(grdTransactionPosted.rows >1)
	{
		var url = '/standard/reports/60/25/rpt_60250200_list_transaction_posted.aspx?p_dt_from='+ dtFrom.value+'&p_dt_to='+dtTo.value+'&p_crt_by='+txtCashierID.text+'&p_services_name='+lstTableName.value+'&p_location='+lstLocation.value+'&p_time_from='+txtFromTime.text+'&p_time_to='+txtToTime.text;  
			System.OpenTargetPage( System.RootURL+url , "newform" );  
	}
 }
 function OnDataReceive(obj)
 {
	 if(obj.id=='dso_htfo00700')
	 {
		if(grdTransactionPosted.rows-1 > 0)
		{
			OnColor();
		}
	 }
 }
 
 function OnColor()
 {
     for(var i=1; i< grdTransactionPosted.rows;i++)
	 {
		if(Number(grdTransactionPosted.GetGridData(i,6)) ==""  && grdTransactionPosted.GetGridData(i,7) !="")
		{
			grdTransactionPosted.SetCellBgColor(i, 0, i, grdTransactionPosted.cols-1,0XEE82EE);
		}
		if(Number(grdTransactionPosted.GetGridData(i,6)) ==""  && grdTransactionPosted.GetGridData(i,7) =="")
		{
			grdTransactionPosted.SetCellBgColor(i, 0, i, grdTransactionPosted.cols-1,0xE08080); 
		}
	 }
 }

//=========================================================================
 
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="dso_htfo00700" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"  function="st_ht_sel_60250200" >
                <input  bind="grdTransactionPosted">
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
					<input bind="txtFolio" />  
					<input bind="txtCashierID" />
					<input bind="lstTableName" />
					<input bind="lstLocation" /> 
					<input bind="txtFromTime" />  
					<input bind="txtToTime" />  
                </input> 
                <output bind="grdTransactionPosted" />  
            </dso> 
        </xml> 
    </gw:data>
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 5%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td align="right" style="width: 5%; white-space: nowrap">
                             Date
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" onchange="OnSearch()" />
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" onchange="OnSearch()" />
                        </td>
						<td>Folio#</td>
						<td style="width: 5%; white-space: nowrap" align="center">
                          <gw:textbox id="txtFolio" styles="width: 100%" onenterkey="OnSearch()" />  
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap;display:none">
                            Service:
                        </td>
                        <td style="width: 13%; white-space: nowrap;display:none">
                            <gw:list id="lstTableName" onchange="OnSearch()" />
                        </td>
						<td align="right" style="width: 13%; white-space: nowrap">
                            Location
                        </td>
                        <td style="width: 30%; white-space: nowrap">
                            <gw:list id="lstLocation" onchange="OnSearch()" />
                        </td>
						<td style="width: 5%; white-space: nowrap" align="right">
                           Cashier:
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="center">
                          <gw:textbox id="txtCashierID" styles="width: 100%" onenterkey="OnSearch()" />  
                        </td>
						<td width="4%">Time</td> 
						<td width="12%">
						<gw:textbox id="txtFromTime" styles="width:40%" onenterkey="OnSearch()" />
						~
						<gw:textbox id="txtToTime" styles="width:40%" onenterkey="OnSearch()" />
					  </td>

                        <td width="1%" align="right">
                            <gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnReport()" />
                        </td>
						 <td style="width: 1%" align="center">
							 <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
						 </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
            <td>
                <gw:grid id='grdTransactionPosted' header='_pk|_Services_Name|Date Time|Folio#|Invoice#|Room#|Guest Name|Item|Item Desc|Amount|Ex_rate|Amount(usd)|Location|Create By'
                    format='0|0|0|0|0|0|0|0|0|-0|-0|-2|0|0' 
					aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    defaults='|||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T"  />
            </td>
        </tr>
    </table>
	<gw:textbox id="txtCount" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
