<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Guest Arriving</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 
    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
 
 function BodyInit()
 {
	OnSearch();
 }
 function OnSearch()
 {
    data_htfo00010.Call("SELECT");
 }
 function OnReport()
 {
		var url = '/reports/ht/fo/htfo00010.aspx?p_dt_frm='+ dtFrom.value+'&p_dt_departure='+dtTo.value+'&p_guest_name='+txtFirsLastName.text+'&p_count_RM='+txtCount.text;
			System.OpenTargetPage( System.RootURL+url , "newform" );  
	
 }
 function OnDataReceive(obj)
 {
	if(obj.id=='data_htfo00010')
	{
		
	}
 }
 function OnPrint()
 {
	if(grdArriving.rows >1)
	{
		var url = '/reports/ht/bk/rpt_htbk00120_special_service_booking.aspx?p_dtfrm='+dtFrom.value+'&p_dtto='+dtTo.value; 
			System.OpenTargetPage( System.RootURL+url , "newform" );
	}
 }
//=========================================================================
 
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htfo00010" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"   function="ht_sel_60240090" >
                <input  bind="grdArriving">
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
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
                        <td align="right" style="width: 5%; white-space: nowrap">
                             Date
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" onchange="OnSearch()" />
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" onchange="OnSearch()" />
                        </td>
						<td style="width: 25%" align="right" nowrap ></td>
					<td style="width: 17%" >
						
					</td>
					<td align="right" style="width: 5%">
							 </td>
					 <td style="width: 4%" align="center">
						 
					 </td>
					 <td align="right" style="width: 5%"> 
							 </td>
					 <td style="width: 4%" align="center">
						 
					 </td>
                    <td align="right" style="width: 5%">
							 </td>
					<td style="width: 12%" align="center">
						 <gw:label id="txtCount" />
					 </td>
                        <td style="width: 3%; white-space: nowrap" align="center">
                            <gw:imgbtn id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
						<td style="width: 3%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" style="display:none" />
                        </td>
						 <td width="3%" align="right">
                            <gw:imgbtn id="btnReport1" img="excel" styles="display: none" alt="Special Service Booking" onclick="OnPrint()" />
                        </td>
                        <td width="3%" align="right">
                            
                        </td>
						<td width="3%" align="right">
                            
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
            <td>
                <gw:grid id='grdArriving' header='Partner ID|Partner name|Contract no|Description|Release days|Room Qty|Room type|From date|Date to'
                    format='0|0|0|0|-0|-0|-0|4|4' 
					aligns='0|0|0|0|0|0|0|0|0'
                    defaults='||||||||' 
					editcol='0|0|0|0|0|0|0|0|0'
                    widths='0|0|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
