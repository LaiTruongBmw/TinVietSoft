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
    data_htfo00550.Call("SELECT");
 }
 function BodyInit()
 {
	dtFrom.SetDataText(System.AddDate(dtFrom.GetData(),-1));
	OnSearch();
 }
function OnDataReceive(obj)
{
	if(obj.id=='data_htfo00550')
	{
		if(grdMoveBillHistory.rows >1)
		{
			
		}
	}
	
}
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htfo00550" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid" function="ht_sel_6025190_log"  >
                <input  bind="grdMoveBillHistory">
					<input bind="dtFrom" /> 
					<input bind="dtTo" />
                    <input bind="txtRoom" /> 
					<input bind="txtRoomTo" /> 
                </input> 
                <output bind="grdMoveBillHistory" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 5%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
						<td align="right" style="width: 5%">
							Date :
						</td>
						<td style="width: 20%; white-space: nowrap" align="center" id="id_date">
                            <gw:datebox id="dtFrom" lang="1" styles="width:100%" onchange="OnSearch()" />
							~
							<gw:datebox id="dtTo" lang="1" styles="width:100%" onchange="OnSearch()" />
                        </td>
                        <td align="right" style="width: 13%;">
                             Room#(from):
                        </td>
                        <td style="width: 8%; white-space: nowrap">
                            <gw:textbox id="txtRoom" onenterkey="OnSearch()"  /> 
                        </td>
						 <td align="right" style="width: 12%">
							Room#(To):	
						</td>
						 <td style="width: 8%" align="center">
							<gw:textbox id="txtRoomTo" onenterkey="OnSearch()"  /> 
						 </td>
						 <td style="width: 3%" align="center">
							 <gw:imgbtn id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch()" />
						 </td> 
						 <td style="width: 31%" align="right">
									
						</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
            <td>
                <gw:grid id='grdMoveBillHistory' header='Move Date|Room#(from)|Room#(To)|Invoice#|Invoice Date|Amount(VND|ex_rate|Amount(USD)|Description|Create By|Create Date'
                    format='4|0|0|0|4|-0|-0|-1|0|0|0' 
                    widths='0|0|0|0|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T" oncellclick=""  />
            </td>
        </tr>
		
    </table>
	<gw:textbox id="txtRoomStatusPK" style="display: none" /> 
    <!------------------------------------------------------------------>
</body>
</html>
