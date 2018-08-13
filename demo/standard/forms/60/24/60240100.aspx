<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Guest Arriving</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 var    G_Date=0,
		G_Partner_name=1, 
		G_From_date=2,
		G_Date_to=3,
		G_Description=4,
		G_Release_days=5, 
		G_Room_type=6,
		G_Room_Qty=7, 
		G_Pickup=8,
		G_Remain=9,
		G_partner_pk=10;
		
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
		var url = '/standard/reports/ht/fo/htfo00010.aspx?p_dt_frm='+ dtFrom.value+'&p_dt_departure='+dtTo.value+'&p_guest_name='+txtFirsLastName.text+'&p_count_RM='+txtCount.text;
			System.OpenTargetPage( System.RootURL+url , "newform" );  
	
 }
 function OnDataReceive(obj)
 {
	if(obj.id=='data_htfo00010')
	{
		if(grdArriving.rows >1)
		{
			for(var i=1; i< grdArriving.rows;i++)
			{
				if(grdArriving.GetGridData(i,G_Partner_name) =='' && grdArriving.GetGridData(i,G_Date) !='')
				{
					grdArriving.SetCellBgColor(i, 0, i, grdArriving.cols-1,0XEE82EE); 
				}
			}
		}
	}
 }
 function OnPrint()
 {
	if(grdArriving.rows >1)
	{
		var url = '/standard/reports/ht/bk/rpt_htbk00120_special_service_booking.aspx?p_dtfrm='+dtFrom.value+'&p_dtto='+dtTo.value; 
			System.OpenTargetPage( System.RootURL+url , "newform" );
	}
 }
 function OnShowUsePick()
 {
	if(grdArriving.col==G_Pickup)
	{
		if(grdArriving.GetGridData(grdArriving.row,G_Pickup) !="" && Number(grdArriving.GetGridData(grdArriving.row,G_Pickup)) >0)
		{
			var path = System.RootURL + "/standard/forms/ht/bk/htbk00150_allotment_popup.aspx?p_room_type=" +grdArriving.GetGridData(grdArriving.row,G_Room_type)+"&p_date="+ grdArriving.GetGridData(grdArriving.row,G_Date)+"&p_parner_pk="+ grdArriving.GetGridData(grdArriving.row,G_partner_pk); 
			   var object = System.OpenModal( path ,1000 ,500 ,  'resizable:yes;status:yes');  
		}
	}
 }
 function OnPrint()
 {
	if(grdArriving.rows >1)
	{
		var url = '/standard/reports/60/24/rpt_60240100_Allotment_Occupancy_Details.aspx?p_dtfrom='+dtFrom.GetData()+"&p_dtto="+dtTo.GetData();
			System.OpenTargetPage( System.RootURL+url , "newform" );
	}
 }
//=========================================================================
 
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htfo00010" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"   function="st_ht_sel_60240100" >
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
						<td style="width: 3%" align="right"><gw:imgbtn id="btnReport" img="excel" alt="Print" text="Print" onclick="OnPrint()" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
            <td>
                <gw:grid id='grdArriving' header='Date|Partner name|From date|Date to|Description|Release days|Room type|Room Qty|Pickup|Remain|_tht_allotment_bookingd_pk'
                    format='4|0|4|4|0|-0|0|-0|-0|-0|0' 
					aligns='0|0|0|0|0|0|0|0|0|0|0'
                    defaults='||||||||||' 
					acceptNullDate="true"
					editcol='0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|0|0|0|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T" oncelldblclick="OnShowUsePick(this)" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
