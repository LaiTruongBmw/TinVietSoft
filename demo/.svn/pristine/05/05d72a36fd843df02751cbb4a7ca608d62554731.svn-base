<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head id="Head1" runat="server">
    <title>Room Allocated Status</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
	BindingDataList();
	//OnSearch('mst');
}
function BindingDataList()
{
	var data="";
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CTYPE' AND USE_YN='Y' order by ord" )%>"; 
    grdMST_Log.SetComboFormat(10, data); //SMK.segment
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='PMT'" )%>"; 
    grdMST_Log.SetComboFormat(12, data);//PMT
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.PK,a.RATE_CODE ||' - '||a.RATE_NAME FROM  THT_RATE_PLANS a WHERE a.DEL_IF=0 order by a.RATE_CODE" )%>"; 
    grdMST_Log.SetComboFormat(13, data);//rate plan
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='NAT'" )%>"; 
    grdMST_Log.SetComboFormat(14, data);//nation
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CITY'" )%>"; 
    grdMST_Log.SetComboFormat(15, data);//city
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CCY'" )%>"; 
    grdMST_Log.SetComboFormat(18, data);//currency
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.PK,a.RATE_CODE ||' - '||a.RATE_NAME FROM  THT_RATE_PLANS a WHERE a.DEL_IF=0 order by a.RATE_CODE" )%>"; 
    grdDTL.SetComboFormat(4, data);//rate plan
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='RTYPE'" )%>"; 
    grdDTL.SetComboFormat(5, data);//room type
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.PK,a.RATE_CODE ||' - '||a.RATE_NAME FROM  THT_RATE_PLANS a WHERE a.DEL_IF=0 order by a.RATE_CODE" )%>"; 
    grdDtl_Log.SetComboFormat(4, data);//rate plan
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='RTYPE'" )%>"; 
    grdDtl_Log.SetComboFormat(5, data);//room type
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CTYPE' AND USE_YN='Y' order by ord" )%>"; 
    grdMST_Not_Write_Log.SetComboFormat(10, data); //SMK.segment
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='PMT'" )%>"; 
    grdMST_Not_Write_Log.SetComboFormat(12, data);//PMT
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.PK,a.RATE_CODE ||' - '||a.RATE_NAME FROM  THT_RATE_PLANS a WHERE a.DEL_IF=0 order by a.RATE_CODE" )%>"; 
    grdMST_Not_Write_Log.SetComboFormat(13, data);//rate plan
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='NAT'" )%>"; 
    grdMST_Not_Write_Log.SetComboFormat(14, data);//nation
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CITY'" )%>"; 
    grdMST_Not_Write_Log.SetComboFormat(15, data);//city
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CCY'" )%>"; 
    grdMST_Not_Write_Log.SetComboFormat(18, data);//currency
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.PK,a.RATE_CODE ||' - '||a.RATE_NAME FROM  THT_RATE_PLANS a WHERE a.DEL_IF=0 order by a.RATE_CODE" )%>"; 
    grdDTL_Delete.SetComboFormat(4, data);//rate plan
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='RTYPE'" )%>"; 
    grdDTL_Delete.SetComboFormat(5, data);//room type
	
}

function OnSearch(obj)  
{
	if(obj=='mst_not_write_log')
	{
		dso_htbk00030_mst_not_write_log.Call("SELECT");
	}
	if(obj=='Mst_log')
	{
		THT_BOOKING_NOT_WRITE_PK.text= grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 0);
		dso_htbk00030_mst.Call("SELECT");
	}
	if(obj=='dtl')
	{
		THT_BOOKING_PK.text= THT_BOOKING_NOT_WRITE_PK.GetData();//grdMST_Log.GetGridData(grdMST_Log.row, 0);
		dso_htbk100_dtl.Call("SELECT");
	}
	if(obj=='dtl_log')
	{
		THT_BOOKINGD_PK.text= grdDTL.GetGridData(grdDTL.row, 0);
		dso_htbk100_dtl_log.Call("SELECT");
	}
	if(obj=='delete_detail')   
	{
		THT_BOOKING_NOT_WRITE_PK.text= grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 0);
		dso_htbk100_delete_dtl.Call("SELECT");
	}
	
}
function OnPopup(obj)
{
	if(obj=='hotel')
	{
		var path = System.RootURL + "/standard/forms/60/24/60240060_hotel_confirm_no_popup.aspx?";
				var object = System.OpenModal( path ,700 , 500 ,  'resizable:yes;status:yes');
				if ( object != null )
				{
					txtReservationNo.text	= object[7]; 
					OnSearch('mst_not_write_log');	
				}
	}
}
function OnDataReceive(obj)
{
	if(obj.id=='dso_htbk00030_mst')
	{
		grdDTL.ClearData(); 
		grdDtl_Log.ClearData();
		if(grdMST_Not_Write_Log.rows >1)
		{
			//alert(grdMST_Not_Write_Log.rows);
			if(grdMST_Log.rows >1)//so sanh grid dong tren cung cua  Grd_mst_log voi dong current cua grd_mst
			{
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 1) !=grdMST_Log.GetGridData(1, 1))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 1, 1, 1, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 2) !=grdMST_Log.GetGridData(1, 2))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 2, 1, 2, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 3) !=grdMST_Log.GetGridData(1, 3))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 3, 1, 3, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 4) !=grdMST_Log.GetGridData(1, 4))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 4, 1, 4, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 5) !=grdMST_Log.GetGridData(1, 5))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 5, 1, 5, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 6) !=grdMST_Log.GetGridData(1, 6))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 6, 1, 6, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 10) !=grdMST_Log.GetGridData(1, 10))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 10, 1, 10, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 12) !=grdMST_Log.GetGridData(1, 12))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 12, 1, 12, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 13) !=grdMST_Log.GetGridData(1, 13))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 13, 1, 13, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 14) !=grdMST_Log.GetGridData(1, 14))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 14, 1, 14, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 15) !=grdMST_Log.GetGridData(1, 15))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 15, 1, 15, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 16) !=grdMST_Log.GetGridData(1, 16))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 16, 1, 16, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 17) !=grdMST_Log.GetGridData(1, 17))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 17, 1, 17, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 18) !=grdMST_Log.GetGridData(1, 18))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 18, 1, 18, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 44) !=grdMST_Log.GetGridData(1, 45))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 45, 1, 45, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 45) !=grdMST_Log.GetGridData(1, 46))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 46, 1, 46, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 46) !=grdMST_Log.GetGridData(1, 47))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 47, 1, 47, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 47) !=grdMST_Log.GetGridData(1, 48))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 48, 1,48, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 48) !=grdMST_Log.GetGridData(1, 49))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 49, 1,49, 0xCC99FF);
				}
				if(grdMST_Not_Write_Log.GetGridData(grdMST_Not_Write_Log.row, 49) !=grdMST_Log.GetGridData(1, 50))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(1, 50, 1,50, 0xCC99FF);
				}
			}
		}
		if(grdMST_Log.rows >2) //so sanh dong sau voi dong truoc no-->chi tren grid grd_mst_log thoi(so sanh lien ke nhau)
		{
			for (var i = 2; i < grdMST_Log.rows ; i ++ )
			{
				if(grdMST_Log.GetGridData(i, 1) !=grdMST_Log.GetGridData(i-1, 1))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 1, i, 1, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 2) !=grdMST_Log.GetGridData(i-1, 2))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 2, i, 2, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 3) !=grdMST_Log.GetGridData(i-1, 3))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 3, i, 3, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 4) !=grdMST_Log.GetGridData(i-1, 4))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 4, i, 4, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 5) !=grdMST_Log.GetGridData(i-1, 5))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 5, i, 5, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 6) !=grdMST_Log.GetGridData(i-1, 6))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 6, i, 6, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 10) !=grdMST_Log.GetGridData(i-1, 10))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 10, i, 10, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 12) !=grdMST_Log.GetGridData(i-1, 12))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 12, i, 12, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 13) !=grdMST_Log.GetGridData(i-1, 13))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 13, i, 13, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 14) !=grdMST_Log.GetGridData(i-1, 14))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 14, i, 14, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 15) !=grdMST_Log.GetGridData(i-1, 15))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 15, i, 15, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 16) !=grdMST_Log.GetGridData(i-1, 16))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 16, i, 16, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 17) !=grdMST_Log.GetGridData(i-1, 17))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 17, i, 17, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 18) !=grdMST_Log.GetGridData(i-1, 18))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 18, i, 18, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 45) !=grdMST_Log.GetGridData(i-1, 45))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 45, i, 45, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 46) !=grdMST_Log.GetGridData(i-1, 46))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 46, i, 46, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 47) !=grdMST_Log.GetGridData(i-1, 47))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 47, i, 47, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 48) !=grdMST_Log.GetGridData(i-1, 48))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 48, i, 48, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 49) !=grdMST_Log.GetGridData(i-1, 49))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 49, i, 49, 0xCC99FF);
				}
				if(grdMST_Log.GetGridData(i, 50) !=grdMST_Log.GetGridData(i-1, 50))
				{
					//alert("color");
					grdMST_Log.SetCellBgColor(i, 50, i, 50, 0xCC99FF);
				}
			}
		}
		THT_BOOKING_PK.text= THT_BOOKING_NOT_WRITE_PK.GetData();//grdMST_Log.GetGridData(grdMST_Log.row, 0);
		dso_htbk100_dtl.Call("SELECT");
		//OnSearch('delete_detail');
	}
	if(obj.id=='dso_htbk100_dtl_log')
	{
		if(grdDTL.rows >1)
		{
			//alert(grdMST_Not_Write_Log.rows);
			if(grdDtl_Log.rows >1) //so sanh grid dong tren cung cua  Grd_dtl_log voi dong current cua grd_dtl
			{
				if((grdDTL.GetGridData(grdDTL.row, 2) !=grdDtl_Log.GetGridData(1, 2)))
				{
					//alert("color");
					grdDtl_Log.SetCellBgColor(1, 2, 1, 2, 0xCC99FF);
				}
				if(grdDTL.GetGridData(grdDTL.row, 3) !=grdDtl_Log.GetGridData(1, 3))
				{
					//alert("color");
					grdDtl_Log.SetCellBgColor(1, 3, 1, 3, 0xCC99FF);
				}
				if(grdDTL.GetGridData(grdDTL.row, 4) !=grdDtl_Log.GetGridData(1, 4))
				{
					//alert("color");
					grdDtl_Log.SetCellBgColor(1, 4, 1, 4, 0xCC99FF);
				}
				if(grdDTL.GetGridData(grdDTL.row, 5) !=grdDtl_Log.GetGridData(1, 5))
				{
					//alert("color");
					grdDtl_Log.SetCellBgColor(1, 5, 1, 5, 0xCC99FF);
				}
				if (grdDTL.GetGridData(grdDTL.row, 6) !=grdDtl_Log.GetGridData(1, 6))
				{
					//alert("color");
					grdDtl_Log.SetCellBgColor(1, 6, 1, 6, 0xCC99FF);
				}
				if(grdDTL.GetGridData(grdDTL.row, 7) !=grdDtl_Log.GetGridData(1, 7))
				{
					//alert("color");
					grdDtl_Log.SetCellBgColor(1, 7, 1, 7, 0xCC99FF);
				}
				if(grdDTL.GetGridData(grdDTL.row, 8) !=grdDtl_Log.GetGridData(1, 8))
				{
					//alert("color");
					grdDtl_Log.SetCellBgColor(1, 8, 1, 8, 0xCC99FF);
				}
				if(grdDTL.GetGridData(grdDTL.row, 9) !=grdDtl_Log.GetGridData(1, 9))
				{
					//alert("color");
					grdDtl_Log.SetCellBgColor(1, 9, 1, 9, 0xCC99FF);
				}
				if(grdDTL.GetGridData(grdDTL.row, 10) !=grdDtl_Log.GetGridData(1, 10))
				{
					//alert("color");
					grdDtl_Log.SetCellBgColor(1, 10, 1, 10, 0xCC99FF);
				}
				if(grdDTL.GetGridData(grdDTL.row, 11) !=grdDtl_Log.GetGridData(1, 11))
				{
					//alert("color");
					grdDtl_Log.SetCellBgColor(1, 11, 1, 11, 0xCC99FF);
				}
				if(grdDTL.GetGridData(grdDTL.row, 12) !=grdDtl_Log.GetGridData(1, 12))
				{
					//alert("color");
					grdDtl_Log.SetCellBgColor(1, 12, 1, 12, 0xCC99FF);
				}
				if(grdDTL.GetGridData(grdDTL.row, 13) !=grdDtl_Log.GetGridData(1, 13))
				{
					//alert("color");
					grdDtl_Log.SetCellBgColor(1, 13, 1, 13, 0xCC99FF);
				}
				if(grdDTL.GetGridData(grdDTL.row, 14) !=grdDtl_Log.GetGridData(1, 14))
				{
					//alert("color");
					grdDtl_Log.SetCellBgColor(1, 14, 1, 14, 0xCC99FF);
				}
				if(grdDTL.GetGridData(grdDTL.row, 15) !=grdDtl_Log.GetGridData(1, 15))
				{
					//alert("color");
					grdDtl_Log.SetCellBgColor(1, 15, 1, 15, 0xCC99FF);
				}
				if(grdDTL.GetGridData(grdDTL.row, 16) !=grdDtl_Log.GetGridData(1, 16))
				{
					//alert("color");
					grdDtl_Log.SetCellBgColor(1, 16, 1, 16, 0xCC99FF);
				}
				if(grdDTL.GetGridData(grdDTL.row, 18) !=grdDtl_Log.GetGridData(1, 18))
				{
					//alert("color");
					grdDtl_Log.SetCellBgColor(1, 18, 1, 18, 0xCC99FF);
				}
				if(grdDTL.GetGridData(grdDTL.row, 19) !=grdDtl_Log.GetGridData(1, 19))
				{
					//alert("color");
					grdDtl_Log.SetCellBgColor(1, 19, 1, 19, 0xCC99FF);
				}
			}
		}
		if(grdDtl_Log.rows >2) //so sanh dong sau voi dong truoc no-->chi tren grid grd_dtl_log thoi(so sanh lien ke nhau)
		{
			for ( i = 2; i < grdDtl_Log.rows ; i ++ )
			{
				if(grdDtl_Log.GetGridData(i, 2) !=grdDtl_Log.GetGridData(i-1, 2))
				{
					//alert(grdDtl_Log.GetGridData(i, 18));
					grdDtl_Log.SetCellBgColor(i, 2, i, 2, 0xCC99FF);
				}
				if(grdDtl_Log.GetGridData(i, 3) !=grdDtl_Log.GetGridData(i-1, 3))
				{
					//alert(grdDtl_Log.GetGridData(i, 18));
					grdDtl_Log.SetCellBgColor(i, 3, i, 3, 0xCC99FF);
				}
				if(grdDtl_Log.GetGridData(i, 4) !=grdDtl_Log.GetGridData(i-1, 4))
				{
					//alert(grdDtl_Log.GetGridData(i, 18));
					grdDtl_Log.SetCellBgColor(i, 4, i, 4, 0xCC99FF);
				}
				if(grdDtl_Log.GetGridData(i, 5) !=grdDtl_Log.GetGridData(i-1, 5))
				{
					//alert(grdDtl_Log.GetGridData(i, 18));
					grdDtl_Log.SetCellBgColor(i, 5, i, 5, 0xCC99FF);
				}
				if(grdDtl_Log.GetGridData(i, 6) !=grdDtl_Log.GetGridData(i-1, 6))
				{
					//alert(grdDtl_Log.GetGridData(i, 18));
					grdDtl_Log.SetCellBgColor(i, 6, i, 6, 0xCC99FF);
				}
				if(grdDtl_Log.GetGridData(i, 7) !=grdDtl_Log.GetGridData(i-1, 7))
				{
					//alert(grdDtl_Log.GetGridData(i, 18));
					grdDtl_Log.SetCellBgColor(i, 7, i, 7, 0xCC99FF);
				}
				if(grdDtl_Log.GetGridData(i, 8) !=grdDtl_Log.GetGridData(i-1, 8))
				{
					//alert(grdDtl_Log.GetGridData(i, 18));
					grdDtl_Log.SetCellBgColor(i, 8, i, 8, 0xCC99FF);
				}
				if(grdDtl_Log.GetGridData(i, 9) !=grdDtl_Log.GetGridData(i-1, 9))
				{
					//alert(grdDtl_Log.GetGridData(i, 18));
					grdDtl_Log.SetCellBgColor(i, 9, i, 9, 0xCC99FF);
				}
				if(grdDtl_Log.GetGridData(i, 10) !=grdDtl_Log.GetGridData(i-1, 10))
				{
					//alert(grdDtl_Log.GetGridData(i, 18));
					grdDtl_Log.SetCellBgColor(i, 10, i, 10, 0xCC99FF);
				}
				if(grdDtl_Log.GetGridData(i, 11) !=grdDtl_Log.GetGridData(i-1, 11))
				{
					//alert(grdDtl_Log.GetGridData(i, 18));
					grdDtl_Log.SetCellBgColor(i, 11, i, 11, 0xCC99FF);
				}
				if(grdDtl_Log.GetGridData(i, 12) !=grdDtl_Log.GetGridData(i-1, 12))
				{
					//alert(grdDtl_Log.GetGridData(i, 18));
					grdDtl_Log.SetCellBgColor(i, 12, i, 12, 0xCC99FF);
				}
				if(grdDtl_Log.GetGridData(i, 13) !=grdDtl_Log.GetGridData(i-1, 13))
				{
					//alert(grdDtl_Log.GetGridData(i, 18));
					grdDtl_Log.SetCellBgColor(i, 13, i,13, 0xCC99FF);
				}
				if(grdDtl_Log.GetGridData(i, 14) !=grdDtl_Log.GetGridData(i-1, 14))
				{
					//alert(grdDtl_Log.GetGridData(i, 18));
					grdDtl_Log.SetCellBgColor(i, 14, i, 14, 0xCC99FF);
				}
				if(grdDtl_Log.GetGridData(i, 15) !=grdDtl_Log.GetGridData(i-1, 15))
				{
					//alert(grdDtl_Log.GetGridData(i, 18));
					grdDtl_Log.SetCellBgColor(i, 15, i, 15, 0xCC99FF);
				}
				if(grdDtl_Log.GetGridData(i, 16) !=grdDtl_Log.GetGridData(i-1, 16))
				{
					//alert(grdDtl_Log.GetGridData(i, 18));
					grdDtl_Log.SetCellBgColor(i, 16, i, 16, 0xCC99FF);
				}
				if(grdDtl_Log.GetGridData(i, 18) !=grdDtl_Log.GetGridData(i-1, 18))
				{
					//alert(grdDtl_Log.GetGridData(i, 18));
					grdDtl_Log.SetCellBgColor(i, 18, i, 18, 0xCC99FF);
				}
				if(grdDtl_Log.GetGridData(i, 19) !=grdDtl_Log.GetGridData(i-1, 19))
				{
					//alert(grdDtl_Log.GetGridData(i, 18));
					grdDtl_Log.SetCellBgColor(i, 19, i, 19, 0xCC99FF);
				}
			}
		}
		OnSearch('delete_detail');
	}
}
</script> 

<body>
<gw:data id="dso_htbk00030_mst_not_write_log" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid" parameter="" function="st_ht_sel_60240060_not_log">
			<input bind="grdMST_Not_Write_Log">
				<input bind="dtFrom" />
				<input bind="dtTo" />
				<input bind="txtReservationNo" />
			</input> 
			<output bind="grdMST_Not_Write_Log" /> 
		</dso> 
	</xml> 
</gw:data>

    <gw:data id="dso_htbk00030_mst" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid" parameter="" function="st_ht_sel_60240060">
			<input bind="grdMST_Log">
				<input bind="THT_BOOKING_NOT_WRITE_PK" />
			</input> 
			<output bind="grdMST_Log" /> 
		</dso> 
	</xml> 
</gw:data>
 <gw:data id="dso_htbk100_dtl" onreceive="">
	<xml> 
		<dso type="grid" parameter="" function="st_ht_sel_60240060_dtl">
			<input bind="grdDTL">
			   
				 <input bind="THT_BOOKING_PK" />
			</input> 
			<output bind="grdDTL" /> 
		</dso>  
	</xml> 
</gw:data>
    <gw:data id="dso_htbk100_dtl_log" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid"  function="st_ht_sel_60240060_dtl_log" >
			<input bind="grdDtl_Log">
				<input bind="THT_BOOKINGD_PK" />
			</input> 
			<output bind="grdDtl_Log" /> 
		</dso> 
	</xml> 
</gw:data>
<gw:data id="dso_htbk100_delete_dtl" onreceive="">  
	<xml> 
		<dso type="grid" parameter="" function="st_ht_sel_60240060_delete_dtl">
			<input bind="grdDTL_Delete">
			   
				 <input bind="THT_BOOKING_NOT_WRITE_PK" />
			</input> 
			<output bind="grdDTL_Delete" /> 
		</dso>  
	</xml> 
</gw:data>
    <table style="height: 100%; width: 100%; background: #BDE9FF" border="0">
        <tr style="width: 100%; height: 2%">
            <td style="width: 100%; background: white" valign="top">
                <table style="width: 100%" border="0">
                    <tr>
                        <td style="width: 10%" align="right">Date
                            </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtFrom" lang="1"   onchange="OnSearch('mst_not_write_log')" />
                            ~<gw:datebox id="dtTo" lang="1"   onchange="OnSearch('mst_not_write_log')" />
                        </td>
                        <td style="width: 10%" align="right">
                            <a href="#" onclick="OnPopup('hotel')">RSV#</td>
                        <td style="width: 30%">
                            <gw:textbox id="txtReservationNo" styles="width: 100%" onenterkey="OnSearch('mst_not_write_log')" />
                        </td>
                        <td style="width: 4%" align="center">
                           <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('mst_not_write_log')" /> 
                        </td>
                        <td style="width: 10%" align="center">
                            
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 3%">
                            
                        </td>
                        <td style="width: 12%">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
		 <tr style="width: 50%; background: white; height: 35%">
			<td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 50%; background: #BDE9FF">
                            <gw:grid id="grdMST_Not_Write_Log" header="_pk|Slip No|From Date|Date To|Contact Person|Phone|Email|_tco_buspartner_pk|_address|_fax|MKT.Segment|_send_booking_yn|Payment Method|Price Plan|Nation|City|Night|Total Customer|Currency|_adjust_desc|_request_desc|_description|_condit_cancel_desc|_transport_method|_transport_fee|_status|_last_name|_customer_id|_confirm_yn|_payment|_arrival_time|_departure_time|_tht_guest_profile_pk|_deposit_amt|_credit_card_owner|_credit_type|_credit_no|_credit_expire_date|_credit_ccv|_guarantee_type|_cash_amt|_first_name|_doc_date|_exp_date|Create By|Create Date|Modify By|Modify Date|Status|Request Description"
								format="0|0|4|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
								widths="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
								styles="width:100%;height:100%"
								autosize='T' debug='false' oncellclick="OnSearch('Mst_log')" />
                        </td>
                        <td style="width: 50%; background: #BDE9FF">
                            <gw:grid id="grdDTL_Delete" header="_pk|_tht_booking_pk|*Last Name(Deleted)|*First Name|*Rate Plan|*Room type|*Adult|Child|Rate|_tht_room_pk|*Room|VIP|Guest2 Name|Guest3  Name|Guest4 Name|Advance|Create By|Create Date|Modify By|Modify Date"
								format="0|0|0|0|0|0|0|0|-2|0|0|0|0|0|0|0|0|0|0|0" 
								aligns="0|0|0|0|0|0|3|3|3|0|3|0|0|0|0|0|0|0|0|0"
								editcol="0|0|1|1|1|0|1|1|1|0|0|0|1|1|1|0|0|0|0|0"
								styles="width:100%;height:100%" debug="false" autosize='T'
								oncellclick=""			/>
                        </td>
                    </tr>
                </table>
            </td>
			
            
        </tr>
        <tr style="width: 100%; background: white; height: 38%">
            <td style="width: 100%" >
                <gw:grid id="grdMST_Log" header="_pk|Slip No|From Date|Date To|Contact Person|Phone|Email|_tco_buspartner_pk|_address|_fax|MKT.Segment|_send_booking_yn|Payment Method|Price Plan|Nation|City|Night|Total Customer|Currency|_adjust_desc|_request_desc|_description|_condit_cancel_desc|_transport_method|_transport_fee|_status|_last_name|_customer_id|_confirm_yn|_payment|_arrival_time|_departure_time|_tht_guest_profile_pk|_deposit_amt|_credit_card_owner|_credit_type|_credit_no|_credit_expire_date|_credit_ccv|_guarantee_type|_cash_amt|_first_name|_doc_date|_exp_date|_tht_booking_pk|Create By|Create Date|Modify By|Modify Date|Status|Request Description"
                    format="0|0|4|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					widths="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					styles="width:100%;height:100%"
                    autosize='T' debug='false' oncellclick="OnSearch('dtl')" />
            </td>
        </tr>
        
        <tr style="width: 100%; height: 25%; background: white">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 50%; background: #BDE9FF">
                            <gw:grid id="grdDTL" header="_pk|_tht_booking_pk|*Last Name|*First Name|*Rate Plan|*Room type|*Adult|Child|Rate|_tht_room_pk|*Room|VIP|Guest2 Name|Guest3  Name|Guest4 Name|Advance|Create By|Create Date|Modify By|Modify Date"
                                            format="0|0|0|0|0|0|0|0|-2|0|0|0|0|0|0|0|0|0|0|0" 
											aligns="0|0|0|0|0|0|3|3|3|0|3|0|0|0|0|0|0|0|0|0"
                                            editcol="0|0|1|1|1|0|1|1|1|0|0|0|1|1|1|0|0|0|0|0"
                                            styles="width:100%;height:100%" debug="false" autosize='T'
											oncellclick="OnSearch('dtl_log')"			/>
                        </td>
                        <td style="width: 50%; background: #BDE9FF">
                            <gw:grid id="grdDtl_Log" header="_pk|_tht_booking_pk|*Last Name|*First Name|*Rate Plan|*Room type|*Adult|Child|Rate|_tht_room_pk|*Room|VIP|Guest2 Name|Guest3  Name|Guest4 Name|Advance|Create By|Create Date|Modify By|Modify Date"
                                            format="0|0|0|0|0|0|0|0|-2|0|0|0|0|0|0|0|0|0|0|0" 
											aligns="0|0|0|0|0|0|3|3|3|0|3|0|0|0|0|0|0|0|0|0"
                                            editcol="0|0|1|1|1|0|1|1|1|0|0|0|1|1|1|0|0|0|0|0"
                                            styles="width:100%;height:100%" debug="false" autosize='T'  />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="THT_BOOKING_PK" styles="display: none" />
<gw:textbox id="THT_BOOKINGD_PK" styles="display: none" />
<gw:textbox id="txtDateFrom" styles="display: none" />
<gw:textbox id="txtDateTo" styles="display: none" />
<gw:textbox id="THT_BOOKING_NOT_WRITE_PK" styles="display: none" />
<!--------------------------------------------------------------------------------------->
</html>
