<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Room Ledger Adjust</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 
var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
var  user_name  = "<%=Session("USER_NAME")%>" ;
 //===================================================================    

 function BodyInit()
 {
	OnSearch();
 }
 function OnSearch()
 {
	dso_htfo00660.Call("SELECT");
 }
function OnReport()
{
	if(grdRoomFeeAdjust.rows >1)
	{
		var url =System.RootURL + '/standard/reports/ho/25/rpt_60250180_room_fee_adjust_all.aspx?p_room_last_first_name='+txtRoomNo.text+'&p_dtfrom='+dtFrom.value+'&p_dtto='+dtTo.value;
		System.OpenTargetPage(url);  
	}
}
function OnDataReceive(obj)
{
	if(obj.id=='dso_htfo00660')
	{
		if(grdRoomFeeAdjust.rows >1)
		{
		grdRoomFeeAdjust.Subtotal( 1, 2, -1, '5!7');
		lblRows.text = grdRoomFeeAdjust.rows-2;
		}

	}
}
</script>

<body>
 
    <!----------------------------------------------------------------------->
    <gw:data id="dso_htfo00660" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"  function="sp_sel_htfo00660" >
                <input  bind="grdRoomFeeAdjust">
                    <input bind="txtRoomNo" /> 
                    <input bind="dtFrom" />
					<input bind="dtTo" />
                </input> 
                <output bind="grdRoomFeeAdjust" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 100%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Room#/Guest Name:
                        </td>
                        <td width="20%" align="right">
                            <gw:textbox id="txtRoomNo" styles="width: 100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="left">
                            
                        </td>
                        <td style="width: 30%; white-space: nowrap" align="center" id="id_date">
                            From:
                            <gw:datebox id="dtFrom" lang="1" styles="width:100%" onchange="OnSearch()" />
							<gw:datebox id="dtTo" lang="1" styles="width:100%" onchange="OnSearch()" />
                        </td>
                        <td style="width: 10%; white-space: nowrap">
                            Total Room:
                        </td>
                        <td style="width: 18%">
                            <gw:label id="lblRows" />
                        </td>
                        <td style="width: 8%; white-space: nowrap" align="center">
                            <gw:imgbtn id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 3%">
							<gw:imgbtn id="btnReport" img="excel" alt="Print Request" onclick="OnReport()" />
						</td>
                        <td style="width: 1%" align="left">
                             
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="11">
                            <gw:grid id='grdRoomFeeAdjust' 
                                header='_pk|Room#|Last Name|First Name|Audit Date|Room Amount(VND)|Ex_Rate|Daily Rate USD|Adjust Amt(VND)|Ajust Reason|Create By|Create Date'
                                format='0|0|0|0|4|-0|-0|-2|-0|0|0|0' 
                                aligns='0|0|0|0|0|0|0|0|0|0|0|0'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0' 
                                widths='1200|1500|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                                sorting='T' autosize='T' acceptnulldate="T" styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txtNightAuditPK" styles='width:100%;display:none' />
    <gw:textbox id="txtExRate" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
