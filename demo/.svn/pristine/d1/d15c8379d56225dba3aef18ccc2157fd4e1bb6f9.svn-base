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
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM TCO_COMMCODE WHERE DEL_IF = 0 AND PARENT_CODE = 'RTYPE'")%>";
	//grdArriving.SetComboFormat(7, data);
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CTYPE'" )%>"; 
    //grdArriving.SetComboFormat(1, data);
	
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='GEN'")%>";
	//grdArriving.SetComboFormat(3, data);

	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='NAT'")%>";
	//grdArriving.SetComboFormat(4, data);
	dtTo.SetDataText(System.AddDate(dtFrom.GetData(),15));
	//grdArriving.GetGridControl().FrozenCols = 5;
	OnSearch();
 }
 function OnClickGrid()
 {
    if(grdArriving.rows-1 >0)
    {
        grdArriving.row=-1;
    }
 }
 function OnReport()
 {
    /*var url = '/reports/ht/fo/htfo00020.aspx?p_dt_frm='+ dtFrom.value+'&p_dt_departure='+dtTo.value;
	     System.OpenTargetPage( System.RootURL+url , "newform" ); */
	/*var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/fo/rpt_htfo00020_departure.rpt&procedure=sp_rpt_htfo00020&parameter="+dtFrom.value+','+dtTo.value;   
	System.OpenTargetPage(url); */
	var url = '/standard/reports/ho/25/rpt_htfo00020_departure.aspx?p_dt_frm='+ dtFrom.value+'&p_dt_departure='+dtTo.value;
			System.OpenTargetPage( System.RootURL+url , "newform" );  

 }
 function OnDataReceive(obj)
 {
	 if(obj.id=='data_htfo00020')
	 {
		if(grdArriving.rows-1 > 0)
		{
			txtCount.text=grdArriving.rows-1 + "   Guest(s).";
			ColorDummyRoom();
			ColorCheckOut();
		}
	 }
 }
 function ColorDummyRoom(){

     for(var i=1; i< grdArriving.rows;i++)
	 {
		if(Number(grdArriving.GetGridData(i,12)) < 100  && grdArriving.GetGridData(i,12) !="")
		{
			grdArriving.SetCellBgColor(i, 0, i, grdArriving.cols-1,0x99FFFF);
		}
	 }
 }
 function ColorCheckOut(){

     for(var i=1; i< grdArriving.rows;i++)
	 {
		if(grdArriving.GetGridData(i,27) != "Inhouse")
		{
			grdArriving.SetCellBgColor(i, 0, i, grdArriving.cols-1,0x99FF99);
		}
	 }
 }
//=========================================================================
 
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htfo00020" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"  function="ht_sel_60250040" >
                <input  bind="grdArriving">
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
					<input bind="txtGroup" /> 
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
                             Group/Folio:
                        </td>
                        <td style="width:14%; white-space: nowrap">
                            <gw:textbox id="txtGroup" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
						<td style="width: 3%; white-space: nowrap" align="center">
                            <gw:imgbtn id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td width="3%" align="right">
                            <gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnReport()" />
                        </td>
                        <td align="right" style="width: 7%">
							 <b>Total:</b></td>
						 <td style="width: 14%" align="center">
							 <gw:label id="txtCount" />
						 </td>
                        <td style="width: 26%" align="right">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
            <td>
                <gw:grid id='grdArriving' header='_pk|Group Name|Company/Agent|Guest Type|Guest Name|_First Name|Gender|Nation|Arrive|Departure|Deposit Amt|Room Rate|Room#|Room Type|Contact Name|Contact Phone|Contact Mail|Adult(Male)|Adult(Female)|Child(Male)|Child(Female)|Checkin By|Checkin Date|Guest Name2|Guest Name3|Guest Name4|Request|Status|Folio#'
                    format='0|0|0|0|0|0|0|0|0|0|-0|0|0|0|0|0|0|0|0|0|0|0|4|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|0|0|3|3|1|0|0|0|0|3|3|3|3|0|0|0|0|0|0|0|0'
                    defaults='|||||||||||||||||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T"  />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
