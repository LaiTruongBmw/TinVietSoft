<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Guest Arriving</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 var G_pk=0,
 G_Group=1,
 G_Room_No=2,
 G_Rate=3,
 G_Advance=4,
 G_Company_Agent=5,
 G_Guest_Type=6,
 G_Last_Name=7,
 G_First_Name=8, 
 G_Gender=9, 
 G_Nation=10,
 G_Arrive_Date=11,
 G_Departure=12,
 G_Room_Rate=13,
 G_Room_Type=14,
 G_Contact_Name=15,
 G_Contact_Phone=16,
 G_Contact_Mail=17,
 G_Adult_Male=18,
 G_Adult_Female=19,
 G_Child_Male=20,
 G_Child_Female=21,
 G_Checkin_By=22,
 G_Checkin_Date=23,
 G_Request=24,
 G_Room_Pk=25,
 G_Room_Type_code=26,
 G_PA_ID=27,
 G_Rate_Plan=28,
 G_Booking_detail_pk=29,//Folio#
 G_Guest2_name=30,
 G_Guest3_name=31,
 G_Guest4_name=32,
 G_guest5_name =33,
 G_guest6_name=34,
 G_Company_pk=35,
 G_gest_profile_pk=36,
 G_gest_profile_pk2=37;
    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
	var currentTime, month, year, day;
 function OnSearch()
 {
    data_htfo00180.Call("SELECT");
 }
 function BodyInit()
 {
    var data;
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='GEN'")%>";
	grdArriving.SetComboFormat(G_Gender, data);//gender

	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='NAT'")%>";
	grdArriving.SetComboFormat(G_Nation, data);//nation
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CTYPE' AND USE_YN='Y' order by ord")%>";
	grdArriving.SetComboFormat(G_Guest_Type, data);//MKT.Segment

	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.PK,a.RATE_CODE ||' - '||a.RATE_NAME FROM  THT_RATE_PLANS a WHERE a.DEL_IF=0 order by a.RATE_CODE " )%>"; 
    grdArriving.SetComboFormat(G_Rate_Plan, data);//rate plan
	//grdArriving.GetGridControl().FrozenCols = 5;
	data ="data|1|Inhouse List All|2|Inhouse List-Normal|3|Inhouse List-ViP|4|R-Card"
	lstReportType.SetDataText(data);
	currentTime = new Date()
    month = currentTime.getMonth() + 1;
    day = currentTime.getDate();
    year = currentTime.getFullYear();


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
	if(lstReportType.value=='1' || lstReportType.value=='2'||lstReportType.value=='3')//detail 
	{
		var url = '/standard/reports/60/30/rpt_60300020_inhouse_list2.aspx?p_room='+ txtRoomNo.text+'&p_report_type='+lstReportType.value;
	     System.OpenTargetPage( System.RootURL+url , "newform" );
		 
	}
		 
		 //var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/fo/htfo00180_1.rpt&procedure=sp_rpt_htfo00180&parameter="+txtRoomNo.text+","+txtAdult.text+","+txtChild.text;      
         //System.OpenTargetPage(url); 
 }
 function OnReport2()
 {
  
   //var url = '/standard/reports/ht/fo/rpt_htfo00180.aspx?p_room='+ txtRoomNo.text;
	     //System.OpenTargetPage( System.RootURL+url , "newform" );
		 
		var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/fo/htfo00180_4.rpt&procedure=sp_rpt_htfo00180_2&parameter="+txtRoomNo.text+","+txtAdult.text+","+txtChild.text;    
         System.OpenTargetPage(url); 
 }
 function OnSave()
 {
	/*if(Number(grdArriving.GetGridData(grdArriving.row,G_Rate)) > 1000)
	 {
		alert("amount value too large.");
		return false;
	 }*/
	data_htfo00180.Call();
 }
 function OnReport_R_Card()
 {
		if(grdArriving.row !='-1' )
		{
			var url = '/standard/reports/ht/fo/rpt_htfo00180_R_Card.aspx?p_pk='+grdArriving.GetGridData(grdArriving.row, G_pk);
			 System.OpenTargetPage( System.RootURL+url , "newform" );
		 }
 }
//=========================================================================
 function RoomPopup(obj)
{
	if(obj.col==G_Room_No)
    {
       if (confirm("New room and old room are them same daily rate?"))
		{
		   var path = System.RootURL + "/form/60/25/60250030_room_popup.aspx?";
			var object = System.OpenModal( path ,500 , 400 ,  'resizable:yes;status:yes');
			if ( object != null )
			{
				grdArriving.SetGridText(grdArriving.row,G_Room_Pk, object[0]);//room_pk
				grdArriving.SetGridText(grdArriving.row, G_Room_No, object[1]);//room no
				grdArriving.SetGridText(grdArriving.row,G_Room_Type_code, object[2]);//room type
			}  
		}
    }
	if(obj.col==G_Advance)//deposit=advance
    {
		var guest_name = url_encode(grdArriving.GetGridData(grdArriving.row, G_Last_Name))+" "+url_encode(grdArriving.GetGridData(grdArriving.row, G_First_Name));//last_name and first name
		var path = System.RootURL + '/standard/forms/60/25/60250030_popup_deposit.aspx?p_room_allocate_pk='+ url_encode(grdArriving.GetGridData(grdArriving.row, G_pk))+"&p_guest_name="+guest_name+"&p_room_no="+url_encode(grdArriving.GetGridData(grdArriving.row, G_Room_No));
		var object = System.OpenModal( path ,800 , 300 ,  'resizable:yes;status:yes',window);
		OnSearch();

	}
	if(obj.col==G_Company_Agent)//Company
	{
		var path = System.RootURL + "/form/60/24/60240010_bus.aspx?";
			var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
			if ( object != null )
			{
				grdArriving.SetGridText(grdArriving.row,G_Company_pk, object[0]);//company_pk object[0];
				grdArriving.SetGridText(grdArriving.row,G_Company_Agent, object[4]);//company name object[4];
			}

	}
	if(event.col==G_Last_Name)
	{//htfo00720_guest_profile_popup
	
	var aa =url_encode(grdArriving.GetGridData(grdArriving.row, G_Last_Name));
	//alert(aa);
		var path = System.RootURL + '/standard/forms/60/25/60250220.aspx?p_guest_name='+ url_encode(grdArriving.GetGridData(grdArriving.row, G_Last_Name));
			var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
			if ( object != null )
			{   
			
				grdArriving.SetGridText(grdArriving.row,G_gest_profile_pk, object[0]);//
				grdArriving.SetGridText(grdArriving.row,G_Last_Name, object[1]);
				grdArriving.SetGridText(grdArriving.row,G_Gender,    object[2]);
				grdArriving.SetGridText(grdArriving.row,G_Nation,    object[3]);
				grdArriving.SetGridText(grdArriving.row,G_PA_ID,     object[4]);
				//grdArriving.SetGridText(grdArriving.row,COL_BIRTHDAY,    object[5]);
				grdArriving.SetGridText(grdArriving.row,G_Contact_Phone,     object[6]);
				grdArriving.SetGridText(grdArriving.row,G_Contact_Mail,     object[7]);
				
				//OnSave();
			}
	}
	if(event.col==G_Guest2_name)
	{//htfo00720_guest_profile_popup
		var path = System.RootURL + '/standard/forms/ht/fo/htfo00720.aspx?p_guest_name='+ url_encode(grdArriving.GetGridData(grdArriving.row, G_Guest2_name));
			var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
			if ( object != null )
			{  
				grdArriving.SetGridText(grdArriving.row,G_gest_profile_pk2, object[0]);//
				grdArriving.SetGridText(grdArriving.row,G_Guest2_name, object[1]);
				//OnSave();
			} 
	}
}

function OnDataReceive()
{
	if(grdArriving.rows >0)
	{
		for (i = 1; i < grdArriving.rows; i++)
		{
			if(Number(grdArriving.GetGridData(i,G_Room_No)) > 100)
			 {
				grdArriving.SetCellBgColor(i, 0, i, 35,0x99FFFF);
			 }
			grdArriving.SetCellBgColor(i, G_Advance, i, G_Advance, 0xB3B3D7);
			grdArriving.SetCellBgColor(i, G_Rate, i, G_Rate, 0xCCCC33);
			grdArriving.SetCellBgColor(i, G_Room_No, i, G_Room_No, 0xB3B3D7);
			grdArriving.SetCellBgColor(i, G_Company_Agent, i, G_Company_Agent, 0xB3B3D7);
		}
		//txtCount.text=grdArriving.rows-1 + " Rooms.";
		Sum_Adult_Child();
	}
}
function Sum_Adult_Child()   
 {
	var l_adult = 0,l_child = 0,l_total_room = 0;
     for(var i=1; i< grdArriving.rows;i++)
	 {
		if(grdArriving.GetGridData(i,G_Adult_Male) !=""|| grdArriving.GetGridData(i,G_Adult_Female) !="")//adult(M) or Adult(F)
		{
			if(grdArriving.GetGridData(i,G_Adult_Male) !="" &&  grdArriving.GetGridData(i,G_Room_Type_code) !="DMY")//adult and rm_type is dummy
			{
				l_adult= l_adult + Number(grdArriving.GetGridData(i,G_Adult_Male))+ Number(grdArriving.GetGridData(i,G_Adult_Female));//adult(M)
			}
			if(grdArriving.GetGridData(i,G_Child_Male) !="" &&  grdArriving.GetGridData(i,G_Room_Type_code) !="DMY")//adult and rm_type is dummy
			{
				l_child= l_child + Number(grdArriving.GetGridData(i,G_Child_Male))+ Number(grdArriving.GetGridData(i,G_Child_Female));//child(M)
			}
		} 
		if(grdArriving.GetGridData(i,G_Room_Type_code) !="DMY")
		{
			l_total_room=l_total_room + 1;
		}	
	 }
	 txtCount.text= l_total_room + "   Room(s).";
	 txtAdult.text= l_adult; 
	 txtChild.text= l_child;
 }
 function OnPrintAdvance(url){
		System.OpenTargetPage(url); 
		//window.open(url);
 }
 function OnDelete()
{
	if (confirm('Are you sure delete data ?'))
	{
		grdArriving.DeleteRow();
		data_htfo00180.Call();	
	}
}
function OnNotEdit(obj)
{
	if(obj.col==G_Gender || obj.col==G_Nation)
	{
		grdArriving.row =-1;
	}
	 
}

 function OnReportPA18()
 {
    var url = System.RootURL + '/standard/reports/60/25/rpt_60250020_pa18.aspx?p_day=' + day + "&p_month=" + month + "&p_year=" + year;
    System.OpenTargetPage(url); 
 }

function url_encode(s) {
		string = s.replace(/\r\n/g,"\n");
		var utftext = "";
 
		for (var n = 0; n < string.length; n++) {
 
			var c = string.charCodeAt(n);
 
			if (c < 128) {
				utftext += String.fromCharCode(c);
			}
			else if((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			}
			else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}
 
		}
 
		return escape(utftext);
}
//0,2,3,4,5,6,7,8,13,14,15,16,17,18,19,22,23,24,25,26,27,29,30,31,32,33,34"
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htfo00180" onreceive="OnDataReceive()"> 
        <xml>                         
           <dso  type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37"  function="st_ht_sel_60250030_form" procedure="st_ht_upd_60250030" >
                <input  bind="grdArriving">
                    <input bind="txtRoomNo" />
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
                        <td align="right" style="width: 19%; white-space: nowrap">
                             Room No/Guest Name/Group/Folio#
                        </td>
                        <td style="width: 10%; white-space: nowrap">
                            <gw:textbox id="txtRoomNo" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
						<td align="right" style="width: 5%">
							 <b>Total:</b></td>
						<td style="width: 13%" align="center">
							 <gw:label id="txtCount" />
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
						 <td style="width: 3%; white-space: nowrap" align="center">
                            <gw:imgbtn id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                        <td style="width: 2%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
						</td>
						<td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>
						<td style="width: 4%">
							<gw:list id="lstReportType" styles="width: 100" />
						</td>
						<td style="width: 2%" align="right">
							<gw:imgbtn id="ibtnReport" styles='width:100%;' img="printer" alt="Print 3" onclick="OnReport()" />
                        </td>
						 </td>
						<td style="width: 2%" align="right">
							<gw:icon id="icoPrint" img="2" text="PA18" onclick="OnReportPA18()" /> 
                        </td>

						
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
            <td>
                <gw:grid id='grdArriving' header='_pk|Group Name|Room#|Rate ++(VND)|Deposit(VND)|Company|MKT.Segment|Guest Name|_First Name|Gender|Nation|Arrive Date|Departure|_Rate|Room Type|Contact Name|Phone|Mail|Adult-M|Adult-F|Child-M|Child-F|Checkin By|Checkin Date|Request|_Room_Pk|_Room_Type|PA/ID|Rate Plan|Folio#|Guest2 Name|Guest3 Name|Guest4 Name|Guest5 Name|Guest6 Name|_Company_pk|_guest_profile_pk|_guest_profile_pk2'
                    format='0|0|0|-2|-0|0|0|0|0|0|0|4|4|-0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|-2|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|0|0|0|3|3|1|0|0|0|0|0|3|3|3|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    editcol='0|0|0|1|0|0|0|1|1|0|0|0|1|1|0|1|0|0|1|1|1|1|0|0|1|1|1|0|0|0|0|1|1|1|1|0|0|0'
                    widths='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T" oncelldblclick="RoomPopup(this)" oncellclick="OnNotEdit(this)"   />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
