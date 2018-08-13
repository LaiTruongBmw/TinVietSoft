<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Guest Arriving</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 var G_pk=0,
 G_Status=1,
 G_Room_No=2,
 G_Room_Rate=3,
 G_Deposit=4,
 G_Company_Agent=5,
 G_Last_Name=6,
 G_First_Name=7,
 G_Guest_Type=8,
 G_Guest_Account=9,
 G_Nation=10,
 G_Arrive_Date=11,
 G_Departure=12,
 G_Room_Type=13,
 G_Contact_Name=14,
 G_Contact_Phone=15,
 G_Contact_Mail=16,
 G_Adult=17, 
 G_Adul_F=18,
 G_Child=19,
 G_Slip_No=20,
 G_Create_By=21,
 G_Create_Date=22,
 G_Request=23,
 G_Room_Pk=24,
 G_Room_Type=25,
 G_bookingd_pk=26,
 G_VIP=27,
 G_Guest2_Name=28,
 G_Guest3_Name=29,
 G_Guest4_Name=30;
    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
 function OnSearch()
 {
    data_htfo00010.Call("SELECT");
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
	
	//data ="#10;CONFIRMED|#20;TENTATIVE|#30;CANCEL|#40;WAITING"
    //grdArriving.SetComboFormat(30,data); //status
	
	dtTo.SetDataText(System.AddDate(dtFrom.GetData(),1));
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
 function OnReport(obj)
 {
    if(obj=='All')
	{
		var url = '/standard/reports/ht/fo/htfo00010.aspx?p_dt_frm='+ dtFrom.value+'&p_dt_departure='+dtTo.value+'&p_guest_name='+txtGuestNameS.text+'&p_count_RM='+txtCount.text;
			System.OpenTargetPage( System.RootURL+url , "newform" );  
	}
	if(obj=='Detail')
	{
		if(grdArriving.row !='-1')
		{
			var url = '/standard/reports/ht/fo/htfo00010_detail.aspx?p_pk='+ grdArriving.GetGridData(grdArriving.row,0);
				System.OpenTargetPage( System.RootURL+url , "newform" );  
		}
		else
		{
			alert("Please,choose one guest to print.");
		}
	}
	if(obj=='Detail_rpt')
	{
		url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/fo/htfo00010_2.rpt&procedure=sp_rpt_htfo00010&parameter="+dtFrom.value+","+dtTo.value;   
         System.OpenTargetPage(url);  

	}
 }
 function OnDataReceive(obj)
 {
	 if(obj.id=='data_htfo00010')
	 {
		if(grdArriving.rows-1 > 0)
		{
			//txtCount.text=grdArriving.rows-1 + "   Room(s).";
			HighLightRoomNotAvailable();
			Sum_Adult_Child();
			grdArriving.SetCellBgColor(1, G_Deposit, grdArriving.rows-1, G_Deposit, 0xB3B3D7);
		}
	 }
 }
 function OnAdvance(obj){
	if(obj.col == G_Deposit)//deposit=advance
    { 
		var guest_name = grdArriving.GetGridData(grdArriving.row, G_Last_Name)+" "+grdArriving.GetGridData(grdArriving.row, G_First_Name);//last_name and first name
		var path = System.RootURL + '/standard/forms/ht/fo/htfo00010_advance.aspx?p_room_allocate_pk='+ grdArriving.GetGridData(grdArriving.row, 0)+"&p_guest_name="+guest_name+"&p_room_no="+grdArriving.GetGridData(grdArriving.row, G_Room_No);
		var object = System.OpenModal( path ,800 , 300 ,  'resizable:yes;status:yes');
		OnSearch();

	}
 }
 function HighLightRoomNotAvailable(){

     for(var i=1; i< grdArriving.rows;i++){
		if(grdArriving.GetGridData(i,G_Status) =='INHOUSE' ){
			grdArriving.SetCellBgColor(i, 0, i, grdArriving.cols-1,0XEE82EE); 
		}
		if(grdArriving.GetGridData(i,G_Status) =='CHECKOUT' ){
			grdArriving.SetCellBgColor(i, 0, i, grdArriving.cols-1,0X6666CC); 
		}
		if(Number(grdArriving.GetGridData(i,G_Room_No)) > 100  && grdArriving.GetGridData(i,G_Room_No) !=""){
			grdArriving.SetCellBgColor(i, 0, i, grdArriving.cols-1,0x99FFFF);
		}
	 }
 }
 function OnSave()
 {
	data_htfo00010.Call();
 }
 function Sum_Adult_Child()
 {
	var l_adult=0,l_child=0,l_total_room =0;
     for(var i=1; i< grdArriving.rows;i++)
	 {
		if(grdArriving.GetGridData(i,G_Adult) !="" ||  grdArriving.GetGridData(i,G_Child) !="")//adult   
		{
			if(grdArriving.GetGridData(i,G_Adult) !="" &&  grdArriving.GetGridData(i,G_Room_Type) !="DMY")//adult and rm_type is dummy
			{
				l_adult= l_adult + Number(grdArriving.GetGridData(i,G_Adult));//adult
			}
			if(grdArriving.GetGridData(i,G_Child) !="" && grdArriving.GetGridData(i,G_Room_Type) !="DMY")//adult nd rm_type is dummy
			{
				l_child= l_child + Number(grdArriving.GetGridData(i,G_Child));//child
			}
		}
		if(grdArriving.GetGridData(i,G_Room_Type) !="DMY")
		{
			l_total_room=l_total_room + 1;
		}
	 }
	 txtCount.text= l_total_room + "   Room(s).";
	 txtAdult.text= l_adult;
	 txtChild.text= l_child;
 }
//=========================================================================
 
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htfo00010" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid" parameter="6,7,17,19,26"  function="st_ht_sel_60240040_form" procedure="st_ht_upd_60240040" >
                <input  bind="grdArriving">
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
					<input bind="txtGuestNameS" />
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
						<td style="width: 25%" align="right" nowrap >Room/Last/First Name/Contact Name</td>
					<td style="width: 17%" >
						<gw:textbox id="txtGuestNameS" styles="width: 100%" onenterkey="OnSearch()" />
					</td>
					<td align="right" style="width: 5%">
							 <b>Adult:</b></td>
					 <td style="width: 4%" align="center">
						 <gw:label id="txtAdult" />
					 </td>
					 <td align="right" style="width: 5%"> 
							 <b>Child:</b></td>
					 <td style="width: 4%" align="center">
						 <gw:label id="txtChild" />
					 </td>
                    <td align="right" style="width: 5%">
							 <b>Total:</b></td>
					<td style="width: 12%" align="center">
						 <gw:label id="txtCount" />
					 </td>
                        <td style="width: 3%; white-space: nowrap" align="center">
                            <gw:imgbtn id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
						<td style="width: 3%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" styles="display: none" />
                        </td>
						 <td width="3%" align="right">
                            <gw:imgbtn id="ibtnReport_rpt"   styles='width:100%;display:none' img="printer" alt="Print2" onclick="OnReport('Detail_rpt')" />
                        </td>
                        <td width="3%" align="right">
                            <gw:imgbtn id="ibtnReport"  styles='width:100%;display:none' img="printer" alt="Print" onclick="OnReport('All')" />
                        </td>
						<td width="3%" align="right">
                            <gw:imgbtn id="ibtnReportDetail"  styles='width:100%;display:none' img="printer" alt="Print R-Card" onclick="OnReport('Detail')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
            <td>
                <gw:grid id='grdArriving' header='_pk|Status|Room#|Room Rate|Deposit|Company/Agent|Last Name|First Name|Guest Type|Guest Account|Nation|Arrive Date|Departure|Room Type|Contact Name|Contact Phone|Contact Mail|Adult|_Adul_F|Child|Slip No|Create By|Create Date|Request|_Room_Pk|_Room_Type|_bookingd_pk|VIP|Guest2 Name|Guest3 Name|Guest4 Name'
                    format='0|0|0|-2|-0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|0|0|3|3|1|0|0|0|0|3|3|3|0|0|0|0|0|0|0|0|0|0|0|0'
                    defaults='|||||||||||||||||||||||||||||' 
					editcol='0|0|0|0|0|0|1|1|0|0|0|0|0|0|0|0|0|1|0|1|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T" oncelldblclick="OnAdvance(this)" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
