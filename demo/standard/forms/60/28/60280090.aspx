<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Guest Arriving</title>
<script language="javascript" type="text/javascript" for="document" event="onbeforeupdate">
<!--
return document_onbeforeupdate()
// -->
</script>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 var G_pk=0,
 G_Company_Agent=1,
 G_Guest_Type=2,
 G_Last_Name=3,
 G_First_Name=4,
 G_Gender=5,
 G_Nation=6,
 G_Arrive_Date=7,
 G_Departure=8,
 G_Advance=9,
 G_Room_Rate=10,
 G_Room_No=11,
 G_Room_Type=12,
 G_Contact_Name=13,
 G_Contact_Phone=14,
 G_Contact_Mail=15,
 G_Adult_Male=16,
 G_Adult_Female=17,
 G_Child_Male=18,
 G_Child_Female=19,
 G_Checkin_By=20,
 G_Checkin_Date=21,
 G_Request=22,
 G_Room_Pk=23,
 G_Room_Type_code=24,
 G_PA_ID=25,
 G_Rate_Plan=26,
 G_Rate=27,
 G_SLIP_NO=28,
 G_Guest2_name=29,
 G_Guest3_name=30,
 G_Guest4_name=31,
 G_Company_pk=32;
    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
 function OnSearch()
 {
    data_htfo00620.Call("SELECT");
 }
 function BodyInit()
 {
    var data;
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='GEN'")%>";
	grdRoomAllocate.SetComboFormat(G_Gender, data);//gender

	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='NAT'")%>";
	grdRoomAllocate.SetComboFormat(G_Nation, data);//nation
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CTYPE' AND USE_YN='Y' order by ord")%>";
	grdRoomAllocate.SetComboFormat(G_Guest_Type, data);//MKT.Segment

	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.PK,a.RATE_CODE ||' - '||a.RATE_NAME FROM  THT_RATE_PLANS a WHERE a.DEL_IF=0 order by a.RATE_CODE " )%>"; 
    grdRoomAllocate.SetComboFormat(G_Rate_Plan, data);//rate plan
	grdRoomAllocate.GetGridControl().FrozenCols = 5;
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='GEN'")%>";
	grdRoomAllocateLog.SetComboFormat(11, data);//gender
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='NAT'")%>";
	grdRoomAllocateLog.SetComboFormat(12, data);//nation
	
	dtFrom.SetDataText(System.AddDate(dtFrom.GetData(),-1));  
	dtTo.SetDataText(System.AddDate(dtTo.GetData(),-1)); 
	
	OnSearch();
 }
function OnDataReceive(obj)
{
	var count = 0;
	if(obj.id=='data_htfo00620')
	{
		
			txtTotalGuest.text=grdRoomAllocate.rows-1 + "   Room(s).";
	
	}
	if(obj.id=='data_htfo00620_log')
	{
		if(grdRoomAllocateLog.rows >1) //so sanh grid dong tren cung cua  Grd_dtl_log voi dong current cua grd_dtl
			{
				for ( i = 2; i < grdRoomAllocateLog.rows ; i ++ )
				{
					if(grdRoomAllocateLog.GetGridData(i, 0) !=grdRoomAllocateLog.GetGridData(i-1, 0))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 0, i, 0, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 1) !=grdRoomAllocateLog.GetGridData(i-1, 1))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 1, i, 1, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 2) !=grdRoomAllocateLog.GetGridData(i-1, 2))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 2, i, 2, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 3) !=grdRoomAllocateLog.GetGridData(i-1, 3))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 3, i, 3, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 4) !=grdRoomAllocateLog.GetGridData(i-1, 4))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 4, i, 4, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 5) !=grdRoomAllocateLog.GetGridData(i-1, 5))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 5, i, 5, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 6) !=grdRoomAllocateLog.GetGridData(i-1, 6))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 6, i, 6, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 7) !=grdRoomAllocateLog.GetGridData(i-1, 7))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 7, i, 7, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 8) !=grdRoomAllocateLog.GetGridData(i-1, 8))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 8, i, 8, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 9) !=grdRoomAllocateLog.GetGridData(i-1, 9))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 9, i, 9, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 10) !=grdRoomAllocateLog.GetGridData(i-1, 10))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 10, i, 10, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 11) !=grdRoomAllocateLog.GetGridData(i-1, 11))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 11, i, 11, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 12) !=grdRoomAllocateLog.GetGridData(i-1, 12))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 12, i, 12, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 13) !=grdRoomAllocateLog.GetGridData(i-1, 13))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 13, i,13, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 14) !=grdRoomAllocateLog.GetGridData(i-1, 14))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 14, i, 14, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 15) !=grdRoomAllocateLog.GetGridData(i-1, 15))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 15, i, 15, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 16) !=grdRoomAllocateLog.GetGridData(i-1, 16))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 16, i, 16, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 17) !=grdRoomAllocateLog.GetGridData(i-1, 17))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 17, i, 17, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 18) !=grdRoomAllocateLog.GetGridData(i-1, 18))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 18, i, 18, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 19) !=grdRoomAllocateLog.GetGridData(i-1, 19))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 19, i, 19, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 20) !=grdRoomAllocateLog.GetGridData(i-1, 20))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 20, i, 20, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 21) !=grdRoomAllocateLog.GetGridData(i-1, 21))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 21, i, 21, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 22) !=grdRoomAllocateLog.GetGridData(i-1, 22))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 22, i, 22, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 23) !=grdRoomAllocateLog.GetGridData(i-1, 23))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 23, i, 23, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 24) !=grdRoomAllocateLog.GetGridData(i-1, 24))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 24, i, 24, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 25) !=grdRoomAllocateLog.GetGridData(i-1, 25))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 25, i, 25, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 26) !=grdRoomAllocateLog.GetGridData(i-1, 26))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 26, i, 26, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 27) !=grdRoomAllocateLog.GetGridData(i-1, 27))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 27, i, 27, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 28) !=grdRoomAllocateLog.GetGridData(i-1, 28))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 28, i, 28, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 29) !=grdRoomAllocateLog.GetGridData(i-1, 29))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 29, i, 29, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 30) !=grdRoomAllocateLog.GetGridData(i-1, 30))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 30, i, 30, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 31) !=grdRoomAllocateLog.GetGridData(i-1, 31))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 31, i, 31, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 32) !=grdRoomAllocateLog.GetGridData(i-1, 32))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 32, i, 32, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 33) !=grdRoomAllocateLog.GetGridData(i-1, 33))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 33, i, 33, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 34) !=grdRoomAllocateLog.GetGridData(i-1, 34))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 34, i, 34, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 35) !=grdRoomAllocateLog.GetGridData(i-1, 35))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 35, i, 35, 0xCC99FF);
					}if(grdRoomAllocateLog.GetGridData(i, 36) !=grdRoomAllocateLog.GetGridData(i-1, 36))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 36, i, 36, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 37) !=grdRoomAllocateLog.GetGridData(i-1, 37))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 37, i, 37, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 38) !=grdRoomAllocateLog.GetGridData(i-1, 38))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 38, i, 38, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 39) !=grdRoomAllocateLog.GetGridData(i-1, 39))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 39, i, 39, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 40) !=grdRoomAllocateLog.GetGridData(i-1, 40))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 40, i, 40, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 41) !=grdRoomAllocateLog.GetGridData(i-1, 41))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 41, i, 41, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 42) !=grdRoomAllocateLog.GetGridData(i-1, 42))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 42, i, 42, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 43) !=grdRoomAllocateLog.GetGridData(i-1, 43))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 43, i, 43, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 44) !=grdRoomAllocateLog.GetGridData(i-1, 44))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 44, i, 44, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 45) !=grdRoomAllocateLog.GetGridData(i-1, 45))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 45, i, 45, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 46) !=grdRoomAllocateLog.GetGridData(i-1, 46))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 46, i, 46, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 47) !=grdRoomAllocateLog.GetGridData(i-1, 47))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 47, i, 47, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 48) !=grdRoomAllocateLog.GetGridData(i-1, 48))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 48, i, 48, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 49) !=grdRoomAllocateLog.GetGridData(i-1, 49))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 49, i, 49, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 50) !=grdRoomAllocateLog.GetGridData(i-1, 50))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 50, i, 50, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 51) !=grdRoomAllocateLog.GetGridData(i-1, 51))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 51, i, 51, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 52) !=grdRoomAllocateLog.GetGridData(i-1, 52))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 52, i, 52, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 53) !=grdRoomAllocateLog.GetGridData(i-1, 53))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 53, i, 53, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 54) !=grdRoomAllocateLog.GetGridData(i-1, 54))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 54, i, 54, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 55) !=grdRoomAllocateLog.GetGridData(i-1, 55))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 55, i, 55, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 56) !=grdRoomAllocateLog.GetGridData(i-1, 56))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 56, i, 56, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 57) !=grdRoomAllocateLog.GetGridData(i-1, 57))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 57, i, 57, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 58) !=grdRoomAllocateLog.GetGridData(i-1, 58))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 58, i, 58, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 59) !=grdRoomAllocateLog.GetGridData(i-1, 59))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 59, i, 59, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 60) !=grdRoomAllocateLog.GetGridData(i-1, 60))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 60, i, 60, 0xCC99FF);
					}
					if(grdRoomAllocateLog.GetGridData(i, 61) !=grdRoomAllocateLog.GetGridData(i-1, 61))
					{
						//alert(grdRoomAllocateLog.GetGridData(i, 18));
						grdRoomAllocateLog.SetCellBgColor(i, 61, i, 61, 0xCC99FF);
					}
				}
			}
	}
}
function Sum_Adult_Child()
 {
	
 }
 function OnSearchGrd2()
 {
	txtRoomAllocateLogPK.text=grdRoomAllocate.GetGridData(grdRoomAllocate.row, 0);
	data_htfo00620_log.Call("SELECT");
 }
 function OnPrint()
 {
	var url = '/standard/reports/60/28/rpt_60280090_inhouse_log.aspx?p_dtfrom='+ dtFrom.value+'&p_dtto='+dtTo.value+'&p_guest_name='+txtRoomNoGuestName.text;
			System.OpenTargetPage( System.RootURL+url , "newform" ); 
 }
function document_onbeforeupdate() {

}

</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htfo00620" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid" function="st_ht_sel_60280090"  >
                <input  bind="grdRoomAllocate">
                    <input bind="dtFrom" /> 
					<input bind="dtTo" />
					<input bind="txtRoomNoGuestName" />
                </input> 
                <output bind="grdRoomAllocate" /> 
            </dso> 
        </xml> 
    </gw:data>
	<gw:data id="data_htfo00620_log" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid" function="st_ht_sel_60280090_log"  >
                <input  bind="grdRoomAllocateLog">
                    <input bind="txtRoomAllocateLogPK" />
                </input> 
                <output bind="grdRoomAllocateLog" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 5%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td align="right" style="width: 5%;">
                             Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" onchange="OnSearch()" />
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" onchange="OnSearch()" />
                        </td>
						<td align="right" style="width: 17%">
						Guest Name/Room#
							 </td>
						<td style="width: 17%" align="center">
							 <gw:textbox id="txtRoomNoGuestName" styles="width: 100%" onenterkey="OnSearch()" />
						 </td>
						 <td align="right" style="width: 9%">
							 </td>
						 <td style="width: 14%" align="center">
							<gw:label id="txtTotalGuest" /> 
						 </td>
						 
						 <td style="width: 7%" align="center">
							 <gw:imgbtn id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch()" />
						 </td> 
						 <td style="width: 5%" align="right">
									<gw:imgbtn img="excel" alt="Print" text="Print" id="btnReport" onclick="OnPrint()"/>

							 </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 45%">
            <td>
                <gw:grid id='grdRoomAllocate' header='_pk|Company|MKT.Segment|Guest Name|_First Name|Gender|Nation|Arrive Date|Departure|Advance|_Rate|Room#|Room Type|Contact Name|Phone|Mail|Adult-M|Adult-F|Child-M|Child-F|Checkin By|Checkin Date|Request|_Room_Pk|_Room_Type|PA/ID|Rate Plan|Rate|Slip No|Guest2 Name|Guest3 Name|Guest4 Name|_Company_pk'
                    format='0|0|0|0|0|0|0|4|4|-0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|0|0|3|3|1|0|0|0|0|3|3|3|3|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    editcol='0|0|0|1|1|1|1|0|1|0|1|0|0|1|1|1|1|1|1|1|0|0|1|1|1|1|1|1|0|1|1|1|0'
                    widths='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T" oncellclick="OnSearchGrd2()"  />
            </td>
        </tr>
		<tr style="height: 40%">
            <td>
                <gw:grid id='grdRoomAllocateLog' header='ROOM TYPE|ROOM#|DESCRIPTION|_DEL_IF|CREATE DATE|CREATE BY| MODIFY BY|MODIFY DATE| GUEST ID| LAST NAME| FIRST NAME| GENDER| NATION| CHECKIN DATE| CHECKOUT DATE| VISA NO| EXPIRE DATE| BIRTHDAY| PASSPORT NO| PRICE TYPE| PRINTED YN|_THT_ROOM_PRICE_PK| TOTAL ADULT| TOTAL CHILD| TOTAL AMT| FROM DATE| DATE TO|RATE PLANS| TAX CODE| CUSTOMER NAME| CUSTOMER ADDRESS| SERIAL NO|CASHIER_PK|_TMP_DATE_TO| PAY METHOD| CASH VND| CASH USD| REMAIN VND| REMAIN USD| GUEST RTN VND| GUEST RTN USD| OTHER PL AMT| ACC GET YN|_TAC_HGTRH_PK| EXPIRE DATE PA ID| INVOICE NO|_PRINT_DT| DISCOUNT AMT| TOTAL ADULT FEMALE| TOTAL CHILD FEMALE|_CHANGED_DATE| DEPOSIT AMT VND| CUSTOMER TYPE|_TOTAL_DUE|_TCO_BUSPARTNER_PK|GUEST2 NAME|GUEST3 NAME|GUEST4 NAME|CONTACT NAME|CONTACT PHONE|CONTACT EMAIL|GUEST REQUEST'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|4|4|0|0|0|0|0|0|0|0|0|0|4|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|-0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T" acceptnulldate = "T"  />
            </td>
        </tr>
    </table>
	<gw:textbox id="txtRoomAllocateLogPK" style="display: none" /> 
    <!------------------------------------------------------------------>
</body>
</html>
