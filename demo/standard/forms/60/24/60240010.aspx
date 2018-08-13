<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head id="Head1" runat="server">
    <title>New Reservation Group</title>
</head>
 <%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
//===============================================================
var COL_M_PK			 = 0,
	COL_M_SLIP_NO		 = 1,
	COL_M_CRT_DATE		 = 2,
	COL_M_CONTACT_PERSON = 3,
	COL_M_TT_CUS		 = 4;
    
var COL_D1_PK               = 0,
    COL_D1_THT_BOOKING_PK   = 1,    
    COL_D1_LAST_NAME        = 2,
    COL_D1_FIRST_NAME       = 3,
    COL_D1_ROOM_TYPE        = 4,
    COL_D1_ADULT            = 5,
    COL_D1_CHILD            = 6,
    COL_D1_RATE             = 7,
	COL_D1_Advance			=8,//deposit
    COL_D1_THT_ROOM_PK      = 9,
    COL_D1_ROOM             = 10,
	COL_Allotment_YN        = 11,
	COL_Commitment_YN        = 12,
    COL_D1_VIP_TYPE         = 13,
	COL_D1_Guest2_Name=14,
	COL_D1_Guest3_Name=15,
	COL_D1_Guest4_Name=16,
	COL_D1_Package_Amt=17,
	COL_D1_Status=18, 
	COL_D1_Request=19,
	COL_guest_profile_pk=20,
	COL_D1_THT_RATE_PLAN_PK = 21,
	COL_LUNCH_AMT  =22, 
	COL_DINNER_AMT =23; 	 

	
var G2_PK=0,
	G2_THT_BOOKING_PK=1,
	G2_Book_DATE=2,
	G2_Book_Time=3,
	G2_Dinner_Place=4,
	G2_Menu_Type=5,
	G2_Total_Pax=6,
	G2_Price=7,
	G2_Description=8;   
var flag_save	= false;
var flag_delete	= false;

var currentTime = new Date();
var hours, minutes;

function BodyInit()
{  
	txtcompany_pk.text="<%=session("COMPANY_PK") %>";

	
	//alert("<%=session("COMPANY_PK") %>");
	
	OnButtonClick('OnToggle');
	//grdData.GetGridControl().ScrollBars =  2;
	dso_htbk00010_mst.StatusInsert();
	BindingDataList();
	ChangeDate();
	txtTTCust.text = '1';
	
	
	txtCompany.SetReadOnly(true);
	txtTotalAmt.SetReadOnly(true);
	txtCancel.SetReadOnly(true);
	txtConfirm.text = 'N';
	//getHH();
	//getMM();
	//txtHFrom.text = hours + ':' + minutes;
	//txtHTo.text = hours + ':' + minutes;
	OnChangeTab();	
}

function getHH()
{
	hours = currentTime.getHours() + "";
	if (hours.length < 2)
		hours = "0" + hours;
	else
		hours = hours;
}

function getMM()
{
	minutes = currentTime.getMinutes() + "";
	if (minutes.length < 2)
		minutes = "0" + minutes;
	else
		minutes = minutes;
}

function BindingDataList()
{ 
	var data="";
	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CTYPE' AND USE_YN='Y' order by ord" )%>"; 
	lstCustType.SetDataText(data);
	lstCustType.value = '';

	data = "<%=CtlLib.SetListDataSQL("SELECT a.PK,a.RATE_CODE ||' - '||a.RATE_NAME FROM  THT_RATE_PLANS a WHERE a.DEL_IF=0 order by a.RATE_CODE" )%>"; 
	lstPriceType.SetDataText(data);//rate plans
	lstPriceType.value = 1;
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.PK,a.RATE_CODE ||' - '||a.RATE_NAME FROM  THT_RATE_PLANS a WHERE a.DEL_IF=0 order by a.RATE_CODE " )%>"; 
    grdDTL.SetComboFormat(COL_D1_THT_RATE_PLAN_PK, data);

    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, CODE||' - '||NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='RTYPE' order by ord" )%>"; 
    grdDTL.SetComboFormat(COL_D1_ROOM_TYPE, data);

	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='NAT'" )%>"; 
	lstNation.SetDataText(data);
	lstNation.value = 'VIE';

	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CITY'" )%>"; 
	lstCity.SetDataText(data);
	lstCity.value = 'CITY-HCM';

	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CCY'" )%>"; 
	lstCCY.SetDataText(data);
	lstCCY.value = 'CCY-VND';

	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='PMT'" )%>"; 
	lstPayment.SetDataText(data);
	
	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='GTD'" )%>||"; 
	lstGTDType.SetDataText(data);
	lstGTDType.value='';
	
	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CREDITCARD'" )%>"; 
	lstCreditType.SetDataText(data);
	
	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='BKSRC' and use_yn='Y' " )%>"; 
	lstBookingSource.SetDataText(data);
	
	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='BK_TYPE' and use_yn='Y' " )%>"; 
	lstBookingType.SetDataText(data);
	lstBookingType.value='10';
	
	txtCancel.SetDataText('* Vui lòng đặt cọc 30% trên tổng số tiền phòng trước khi khách hàng nhận phòng 15 ngày \n* (30% of the total cost of the booking shall be paid 15 days in advance period prior to arrival date) \n* Nếu không nhận được tiền đặt cọc của Quý công ty theo thời hạn như trên, mọi đặt phòng coi như đã hủy.');
	
	data ="data|10|CONFIRMED|20|TENTATIVE|30|CANCEL|40|WAITING"
    lstStatus.SetDataText(data);

	data ="data|1|Search Arrival date |2|Search Create date"
    lstSearchDateType.SetDataText(data);
	lstSearchStatus.value=1;
	
	data ="data|10|CONFIRMED|20|TENTATIVE|30|CANCEL|40|WAITING|50|CONFIRMED && TENTATIVE"	
    lstSearchStatus.SetDataText(data);
	lstSearchStatus.value=50;
    
    data ="#VIP1;VIP1|#VIP2;VIP2|#VIP3;VIP3|#VIP4;VIP4|#VIP5;VIP5|#VIP6;VIP6|#;"
    grdDTL.SetComboFormat(COL_D1_VIP_TYPE,data);
	
	data ="#10;CLUB HOUSE PDR|#20;HOTEL PDR|#30;GRAND BALLROOM|#40;POOLSIZE"
    grdLunchDinner.SetComboFormat(G2_Dinner_Place,data);
	
    data ="#10;MENU SET|#20;BUFFET|#30;BARBECUE"
    grdLunchDinner.SetComboFormat(G2_Menu_Type,data);
	
	data ="#10;CONFIRMED|#20;TENTATIVE|#30;CANCEL|#40;WAITING"
    grdDTL.SetComboFormat(COL_D1_Status,data);
	
	data ="#7;07:00|#8;08:00|#9;09:00|#10;10:00|#11;11:00|#12;12:00|#13;13:00|#14;14:00|#15;15:00|#16;16:00|#17;17:00|#18;18:00|#19;19:00"
    grdLunchDinner.SetComboFormat(G2_Book_Time,data);
	
	//txtCancel.SetReadOnly(true);
	txtSlipNo.SetReadOnly(true);
    //dtFrom1.SetDataText(System.AddDate(dtFrom1.GetData(),-7));
    HideShowControl();
	
	//alert(txtcompany_pk.text);
	OnButtonClick('Main');
}

function checkEmail() 
{
	var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
	if (!filter.test(txtEmail.text))
	{
		alert('Please provide a valid email address');
		txtEmail.text = '';
		return false;
	}
}
function OnRemoveRoom()
{
	for(row = grdDTL.rows-1; row > 0 ; row--)
	{
		if (grdDTL.GetGridControl().isSelected(row) == true)
		{
			if (grdDTL.GetGridData(row, COL_D1_PK) == '')
				grdDTL.RemoveRowAt(row);
			else
			{
				if (confirm('Are you sure delete data ?'))
			    {
				    grdDTL.DeleteRow();
				    dso_htbk00010_dtl.Call();
				}
			}
		}
	}
}
function ChangeDate()
{
    if(dtFrom2.value=="" || dtTo2.value=="")
    {
        txtDays.text = '';
	}
	else
	{
	    if (Number(dtTo2.GetData()) == Number(dtFrom2.GetData()))
        {
	        //dtFrom2.SetDataText(dtTo2.GetData());
	        txtDays.text = '0';
        }
        else if(Number(dtTo2.GetData()) > Number(dtFrom2.GetData()))
        {
            var dtfrom = new Date(); var dtto = new Date();var one_day=1000*60*60*24;var tt_day;
			dtfrom.setFullYear(Number((dtFrom2.GetData()).substring(0,4)),Number((dtFrom2.GetData()).substring(4,6))-1,Number((dtFrom2.GetData()).substring(6,8)));
			dtto.setFullYear(Number((dtTo2.GetData()).substring(0,4)),Number((dtTo2.GetData()).substring(4,6))-1,Number((dtTo2.GetData()).substring(6,8)));
			tt_day = ((dtto-dtfrom)/one_day);
			txtDays.text = tt_day;
        }
        else if(Number(dtTo2.GetData()) < Number(dtFrom2.GetData()))
        {
	        alert('Please, input date to greater than or equal date from.');
	        return;
        }
	}	
}
function OnInHouseDay()
{
	var l_day=Number(txtDays.text);
	dtTo2.SetDataText(System.AddDate(dtFrom2.GetData(),+ l_day));
}
function OnConfirm()
{
	if (txtMasterPK.text != '')
	{
		if (confirm("Are you sure confirm this booking ?"))
		{
			dso_htbk00010_confirm.Call();			
		}
	}
}

function OnCancel()
{
	if (txtMasterPK.text != '')
	{
		if (confirm("Are you sure cancel this booking ?"))
		{
			dso_htbk00010_cancel.Call();
		}
	}
}
function GetDummyRoom(){
	var path = System.RootURL + "/standard/forms/60/24/60240010_dummy_room.aspx?";
	var object = System.OpenModal( path ,500 , 500 ,  'resizable:yes;status:yes');
	if ( object != null )
	{
				grdDTL.AddRow(); 
				
				grdDTL.SetGridText(grdDTL.rows-1, COL_D1_THT_BOOKING_PK, txtMasterPK.text);
				grdDTL.SetGridText(grdDTL.rows-1, COL_D1_THT_ROOM_PK, object[0]);//room_pk
				grdDTL.SetGridText(grdDTL.rows-1, COL_D1_ROOM, object[1]);//room no
				grdDTL.SetGridText(grdDTL.rows-1, COL_D1_ROOM_TYPE, object[2]);//room type
				grdDTL.SetGridText(grdDTL.rows-1, COL_D1_CHILD,	'0');
				grdDTL.SetGridText(grdDTL.rows-1, COL_D1_FIRST_NAME,txtFirstName.text);
				grdDTL.SetGridText(grdDTL.rows-1, COL_D1_LAST_NAME,txtLastName.text);
				grdDTL.SetGridText(grdDTL.rows-1, COL_D1_THT_RATE_PLAN_PK, lstPriceType.value);// rate  plan
				grdDTL.SetGridText(grdDTL.rows-1, COL_D1_Status, 10);
				grdDTL.SetGridText(grdDTL.rows-1, COL_Commitment_YN,0);
				grdDTL.SetGridText(grdDTL.rows-1, COL_Allotment_YN,0);
				
			if(object[2] == "DMY"){
			
				chkRMFeeMaster.SetDataText("Y");
			}
	}
}
function OnNew(obj)
{	
	switch(obj)
	{
		case 1:
		    grdDTL.ClearData();
            dso_htbk00010_mst.StatusInsert();
			lstPriceType.value = 1;
            //getHH();
            //getMM();
            //txtHFrom.text	= hours + ':' + minutes;
            //txtHTo.text		= hours + ':' + minutes;
            txtTTCust.text = '1';
            txtDays.text = '1';	
            lstGTDType.value='';
            HideShowControl();
             
            btnSave.SetEnable(true);
            btnDelete.SetEnable(true);
            txtCancel.SetDataText('* Vui lòng đặt cọc 30% trên tổng số tiền phòng trước khi khách hàng nhận phòng 15 ngày \n* (30% of the total cost of the booking shall be paid 15 days in advance period prior to arrival date) \n* Nếu không nhận được tiền đặt cọc của Quý công ty theo thời hạn như trên, mọi đặt phòng coi như đã hủy.');
		break;
		case 2:
		        if (dtFrom2.GetData() == ""){
					alert("Please select arrival date firstly.");
					return;
				}
				 var path = System.RootURL + "/standard/forms/60/24/60240010_addnew_popup.aspx?start_date="+dtFrom2.GetData()+"&total_night="+txtDays.text;
			        var object = System.OpenModal( path ,900 , 900 ,  'resizable:yes;status:yes');
		            if ( object != null )
		            {
						 for( var i=0; i < object.length; i++)	  
							{	
								arrTemp = object[i];
								grdDTL.AddRow(); 
								grdDTL.SetGridText(grdDTL.rows-1, COL_D1_THT_BOOKING_PK, txtMasterPK.text);
								grdDTL.SetGridText(grdDTL.rows-1, COL_D1_THT_ROOM_PK, arrTemp[0]);//room_pk
								grdDTL.SetGridText(grdDTL.rows-1, COL_D1_ROOM, arrTemp[1]);//room no
								grdDTL.SetGridText(grdDTL.rows-1, COL_D1_ROOM_TYPE, arrTemp[2]);//room type
								grdDTL.SetGridText(grdDTL.rows-1, COL_D1_CHILD,	'0');
								grdDTL.SetGridText(grdDTL.rows-1, COL_D1_FIRST_NAME,txtFirstName.text);
								grdDTL.SetGridText(grdDTL.rows-1, COL_D1_LAST_NAME,txtLastName.text);
								grdDTL.SetGridText(grdDTL.rows-1, COL_D1_THT_RATE_PLAN_PK, lstPriceType.value);// rate  plan
								grdDTL.SetGridText(grdDTL.rows-1, COL_D1_Status, 10);
								//grdDTL.SetGridText(grdDTL.rows-1, COL_Allotment_YN,0);
								//grdDTL.SetGridText(grdDTL.rows-1, COL_Commitment_YN,0);

							}
					}
		break;
		case 3:
				if (txtMasterPK.text != '')
				{
					grdLunchDinner.AddRow(); 
					grdLunchDinner.SetGridText(grdLunchDinner.rows-1, G2_THT_BOOKING_PK, txtMasterPK.text);
				}
				else
				{
					alert("Please,choose guest to add new.");
				}
		break;
    }
}
function OnAddRmType(){
    if (dtFrom2.GetData() == ""){
		alert("Please select arrival date firstly.");
		return;
	}
	var path = System.RootURL + "/standard/forms/60/24/60240010_popup.aspx?start_date="+dtFrom2.GetData();
	var object = System.OpenModal( path ,700 , 600 ,  'resizable:yes;status:yes');
	if ( object != null )
	{
		 for( var i=0; i < object.length; i++)	  
			{	
				arrTemp = object[i];
				grdDTL.AddRow(); 
				grdDTL.SetGridText(grdDTL.rows-1, COL_D1_THT_BOOKING_PK, txtMasterPK.text);
				//grdDTL.SetGridText(grdDTL.rows-1, COL_D1_THT_ROOM_PK, arrTemp[0]);//room_pk
				//grdDTL.SetGridText(grdDTL.rows-1, COL_D1_ROOM, arrTemp[1]);//room no
				grdDTL.SetGridText(grdDTL.rows-1, COL_D1_ROOM_TYPE, arrTemp[0]);//room type
				grdDTL.SetGridText(grdDTL.rows-1, COL_D1_CHILD,	'0');
				grdDTL.SetGridText(grdDTL.rows-1, COL_D1_FIRST_NAME,txtFirstName.text);
				grdDTL.SetGridText(grdDTL.rows-1, COL_D1_LAST_NAME,txtLastName.text);
				grdDTL.SetGridText(grdDTL.rows-1, COL_D1_THT_RATE_PLAN_PK, lstPriceType.value);// rate  plan
				grdDTL.SetGridText(grdDTL.rows-1, COL_Allotment_YN,0);

			}
	}
}
function OnDelete(obj)
{
	switch(obj)
	{
		case 1:
		    if (confirm('Are you sure delete data ?'))
			{
				dso_htbk00010_mst.StatusDelete();
				flag_delete = true;
				dso_htbk00010_mst.Call();
			}
		break;
		case 2:
		    if(grdDTL.GetGridData(grdDTL.row,COL_D1_PK) == "")
		    {
		        grdDTL.RemoveRowAt(grdDTL.row);
		    }
		    else
		    {
		        if (confirm('Are you sure delete data ?'))
		        {
			        grdDTL.DeleteRow();
			        dso_htbk00010_dtl.Call();
			    }
		    }
		break;  
		case 3:
		    if(grdLunchDinner.GetGridData(grdLunchDinner.row,G2_PK) == "")
		    {
		        grdLunchDinner.RemoveRowAt(grdLunchDinner.row);
		    }
		    else
		    {
		        if (confirm('Are you sure delete data ?'))
		        {
			        grdLunchDinner.DeleteRow();
			        dso_htbk00010_LunchDinner.Call();
			    }
		    }
		break;  
    }
}
function CheckValidateLunch()
{
	for(var i=1;i<grdLunchDinner.rows;i++)
          {
            if(grdLunchDinner.GetGridData(i,G2_Book_Time) == "")
             {
                alert("Please input book time at row "+ i);
                return false;
             }
			if(grdLunchDinner.GetGridData(i,G2_Dinner_Place) == "")
             {
                alert("Please input dinner place at row "+ i);
                return false;
             }
             if(grdLunchDinner.GetGridData(i,G2_Menu_Type) == "")
             {
                alert("Please input menu type at row "+ i);
                return false;
             }
			 if(grdLunchDinner.GetGridData(i,G2_Total_Pax) == "")
             {
                alert("Please input total pax at row "+ i);
                return false;
             }
			 if(grdLunchDinner.GetGridData(i,G2_Price) == "")
             {
                alert("Please input price at row "+ i);
                return false;
             }
          }
          return true;
}
function OnButtonClick(obj)    
{
	switch(obj)
	{
		case 'Main':
			/*if(txtSearch.text !="" || txtCompanyNameS.text !="")
			{
				dtFrom1.value='20000101';
				//dtTo.SetDataText(System.AddDate(dtFrom.GetData(),1));
			}
			else
			{
				//dtFrom1.value=dtTo1.value;
			}*/
			dso_htbk00010_main_list.Call('SELECT');
		break;
		case 'MST':
			txtMasterPK.text = grdData.GetGridData(grdData.row, COL_M_PK);
			dso_htbk00010_mst.Call('SELECT');
		break;
		case 'Save':		
		
			if (lstCustType.value == '')
			{
				alert('Please, select market segment.');
				lstCustType.GetControl().focus();
				return;
			}
			/*if ((lstCustType.value == '20'&& txtCompany.text=="") || (lstCustType.value == '70'&& txtCompany.text=="")|| (lstCustType.value == '90'&& txtCompany.text==""))//input customer--->if MKT Segment(name : corporate(transient),corporate(group),tour)
			{
				alert('Please, select customer(company) to save.');
				lstCustType.GetControl().focus();
				return;
			}*/
			if (txtContact.text == '')
			{
				alert('Please, input Contact Name.');
				txtContact.GetControl().focus();
				return;
			}
			if (txtCompany.text == '')
			{
				alert('Please, choose Company Name to save.');
				txtContact.GetControl().focus();
				return;
			}
						
			if (txtLastName.text == '')
			{
				alert('Please, input Group name.');
				txtLastName.GetControl().focus();
				return;
			}
			
			if (txtPhone.text == '')
			{
				alert('Please, input Phone.');
				txtPhone.GetControl().focus();
				return;
			}
			if (dtFrom2.value == '')
			{
				alert('Please, input from date.'); 
				return;
			}
			if (txtHFrom.text == '')
			{
				alert('Please, input hour guest to checkin.'); 
				return;
			}
			
			if (lstNation.value == '')
			{
				alert('Please, input nation to save.'); 
				return;
			}
			
			if (dtTo2.value == '')
			{
				alert('Please, input to date.');
				return;
			}
			/*if (dtReleaseDate.value == '')
			{
				alert('Please, input Release Date.');
				return;
			}*/
			if (lstBookingSource.value == '')
			{
				alert('Please, input Booking Source to save.');
				return;
			}	
			
			flag_save=true;
			dso_htbk00010_mst.Call();
		break;
		case 'SaveLunchDinner':
				if(CheckValidateLunch())
				{
					dso_htbk00010_LunchDinner.Call();
				}
		break;
		case 'OnToggle':
			var left  = document.all("left");    
			var right = document.all("right");   
			var imgArrow = document.all("imgArrow");

			if(imgArrow.status == "expand")
			{
				left.style.display="none";       
				imgArrow.status = "collapse";
				right.style.width="50%";
				imgArrow.src = "../../../../system/images/next_orange.gif";
			}
			else
			{
				left.style.display="";
				imgArrow.status = "expand";
				right.style.width="50%";
				imgArrow.src = "../../../../system/images/prev_orange.gif";
			}
		break;
	}	
}
function CheckValidateDetail()
{
    for(var i=1;i<grdDTL.rows;i++)
          {
            if(grdDTL.GetGridData(i,COL_D1_LAST_NAME) == "")
             {
                alert("Please input guest name at row "+ i);
                return false;
             }
            if(grdDTL.GetGridData(i,COL_D1_ADULT) == "" && grdDTL.GetGridData(i,COL_D1_ROOM_TYPE) != "DMY")
             {
                alert("Please input adult at row "+ i);
                return false;
             }
			 if(lstPriceType.value == 1)
			 {
				if(grdDTL.GetGridData(i,COL_D1_RATE) == "")
				 {
					alert("The rate plan is Flexible,Please input rate at row "+ i);
					return false;
				 }
			 }
             
          }
          return true;
}
function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'dso_htbk00010_mst':
			if (flag_save == true || flag_delete == true)
			{
				if(flag_save == true)
				{
				   if (grdDTL.rows > 1)
					{
						
						for (row = 1; row < grdDTL.rows; row++)
						{
							if(grdDTL.GetGridData(row, COL_D1_THT_BOOKING_PK) == ""){
								grdDTL.SetGridText(row, COL_D1_THT_BOOKING_PK, txtMasterPK.text);
							}
						}

						if(CheckValidateDetail())
						{   
							flag_save = false;
							dso_htbk00010_dtl.Call();
						}
					}
					else
						{
							dso_htbk00010_main_list.Call('SELECT');
						}
				}
				else
				{
						if(grdDTL.rows-1 < 1 )
						{
							flag_delete = false;
							dso_htbk00010_main_list.Call('SELECT');
						}
				}
			}
			else
			{
				 HideShowControl();
				 dso_htbk00010_dtl.Call('SELECT');
			}
			
		break;
		case 'dso_htbk00010_cancel':
			dso_htbk00010_main_list.Call('SELECT');
		break;
		case 'dso_htbk00010_confirm':
			dso_htbk00010_main_list.Call('SELECT');
		break;
		case 'dso_htbk00010_dtl':
			SetColorGirdDtl();
			var tt_amt = 0;
				 for (row = 1; row < grdDTL.rows; row++)
					{
						tt_amt=tt_amt + Number(grdDTL.GetGridData(row, COL_D1_RATE));//rate amt
					}
					txtTotalAmt.text = tt_amt;
					txtTotalRoom.text= grdDTL.rows -1;
					dso_htbk00010_LunchDinner.Call("SELECT");
		break;
		case 'dso_htbk00010_main_list':
			var tt_guest = 0,tt_room=0,total_nights=0;
				 for (row = 1; row < grdData.rows; row++)
					{
						//tt_guest=tt_guest + Number(grdData.GetGridData(row, 5));//tt guest
						tt_room=tt_room + Number(grdData.GetGridData(row, 4));//tt room
						total_nights=total_nights+ Number(grdData.GetGridData(row, 3));//tt nights
					}
					txtTotalGuest.text = tt_guest;
					txtTotalRoomGrdS.text= tt_room; 
					txtTT_rsv.text=	grdData.rows-1;
					txtTotalNights.text=total_nights;
		break; 
		case 'process_htbk00010_copy':
		      alert("Copy data was completed.");
			  lstSearchStatus.value = 40; 
			  dso_htbk00010_mst.Call('SELECT');
		break; 
		
		
		
					
					
			
				
					 
		
	}
}

function OnPopUp(n)
{
	switch(n)
	{
		case 1:
			var path = System.RootURL + "/standard/forms/60/24/60240010_popup_again_booking.aspx?";
			var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
			if ( object != null )
			{
			    txtFirstName.text	= object[1];
				txtLastName.text	= object[0];
				lstCustType.value		= object[2];
				lstNation.value	= object[3];
				tco_buspartner_pk.text	= object[4];
				txtCompany.text		= object[5];
				txtContact.text		= object[6];
				txtPhone.text	= object[7];
				lstPayment.value		= object[8];
				txtEmail.text		= object[9];
				
				lstGTDType.value    = object[12];
				lstCreditType.value = object[13];
				//dtExpDate.value     = object[14];
				txtCCV.text         = object[15];
				
				txtCreditNo.text    = object[16];
				txtCreditOwner.text = object[17];
				
				txtCash.text = object[18];
		
				HideShowControl();
			}
		break;

		case 2:		
		
			var path = System.RootURL + "/standard/forms/60/24/60240010_bus.aspx?p_company_pk="+txtcompany_pk.text;
			var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
			if ( object != null )
			{
				tco_buspartner_pk.text  = object[0];
				txtCompany.text			= object[4];
			}
		break;
		case 3:			
			if(grdDTL.rows > 1)
			{
			    if(grdDTL.col==2 || grdDTL.col==3 || grdDTL.col==4 || grdDTL.col==5 || grdDTL.col==6|| grdDTL.col==7 || grdDTL.col==8)
			    {
			       var path = System.RootURL + "/standard/forms/ht/bk/htbk00010_room_popup.aspx?";
			        var object = System.OpenModal( path ,1300 , 900 ,  'resizable:yes;status:yes');
		            if ( object != null )
		            {
	                    grdDTL.SetGridText(grdDTL.row, COL_D1_THT_ROOM_PK, object[0]);//room_pk
	                    grdDTL.SetGridText(grdDTL.row, COL_D1_ROOM, object[1]);//room no 
						grdDTL.SetGridText(grdDTL.row,COL_D1_ROOM_TYPE, object[2]);//room type
		            }  
			    }
			    else
			    {
			        alert("Please, select a row to open popup.");
			    }  
			}
			
		break; 
		case 4:			
			    var path = System.RootURL + "/standard/forms/ht/bk/htbk00010_TaskPlan.aspx?";
			    var object = System.OpenModal( path ,700 , 500 ,  'resizable:yes;status:yes');
		break;
		case 5:	//Allotment		
			    var path = System.RootURL + "/standard/forms/ht/bk/htbk00130.aspx?";
			    var object = System.OpenModal( path ,1000 , 500 ,  'resizable:yes;status:yes');
		break;
	}
}
function PopupRoomNumber(obj)
{
    if(obj.col==COL_D1_ROOM && event.row > 0)
    {
	   var room_type = grdDTL.GetGridData(grdDTL.row,COL_D1_ROOM_TYPE);//room type
       var path = System.RootURL + "/standard/forms/60/24/60240010_room_popup.aspx?start_date="+dtFrom2.GetData()+"&room_type="+ room_type+"&total_night="+txtDays.text;
        var object = System.OpenModal( path ,800 , 500 ,  'resizable:yes;status:yes');
        if ( object != null )
        {
            grdDTL.SetGridText(grdDTL.row, COL_D1_THT_ROOM_PK, object[0]);//room_pk
            grdDTL.SetGridText(grdDTL.row, COL_D1_ROOM, object[1]);//room no
			grdDTL.SetGridText(grdDTL.row,COL_D1_ROOM_TYPE, object[2]);//room type
			//grdDTL.SetGridText(grdDTL.row, COL_D1_THT_RATE_PLAN_PK, lstPriceType.value);// rate  plan
			
        }  
    }
	if(obj.col == COL_D1_Advance) 
	{
		var guest_name = grdDTL.GetGridData(grdDTL.row, COL_D1_LAST_NAME)+" "+grdDTL.GetGridData(grdDTL.row, COL_D1_FIRST_NAME);//last_name and first name
		var path = System.RootURL + '/standard/forms/60/24/60240010_advance.aspx?p_room_allocate_pk='+ grdDTL.GetGridData(grdDTL.row, 0)+"&p_guest_name="+guest_name+"&p_room_no="+grdDTL.GetGridData(grdDTL.row,COL_D1_ROOM);
		var object = System.OpenModal( path ,800 , 300 ,  'resizable:yes;status:yes',window);
		dso_htbk00010_mst.Call('SELECT');
	}
	if(event.col==COL_D1_LAST_NAME)
	{//htfo00720_guest_profile_popup
		var path = System.RootURL + '/standard/forms/60/25/60250220.aspx?p_guest_name='+ grdDTL.GetGridData(grdDTL.row, COL_D1_LAST_NAME);
			var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
			if ( object != null ) 
			{  
				grdDTL.SetGridText(grdDTL.row,COL_guest_profile_pk, object[0]);//
				grdDTL.SetGridText(grdDTL.row,COL_D1_LAST_NAME, object[1]);
			} 
	}
}
function checkTime(n) 
{ 
	// regular expression to match required time format  
	// (eg. 08:50 or 8:50am)
	re = /^\d{1,2}:\d{2}([ap]m)?$/;
	switch(n)
	{
		case 1:
			if(txtHFrom.text != '' && !txtHFrom.text.match(re)) 
			{ 
				alert("Invalid time format: " + txtHFrom.text); 
				txtHFrom.focus(); 
				txtHFrom.text = '';
				return false; 
			}
		break;
		case 2:
			if(txtHTo.text != '' && !txtHTo.text.match(re)) 
			{
				alert("Invalid time format: " + txtHTo.text); 
				txtHTo.focus(); 
				txtHTo.text = '';
				return false; 
			}
			else
			{
			    ChangeDate();
			}
		break;
	}
}
function HideShowControl()
{
    if(lstGTDType.value == '')
    {
        document.all("tab_credit").style.display = "none";
        document.all("tab_cash").style.display   = "none";
            
        /*txtCreditNo.SetEnable(false);
		dtExpDate.SetEnable(false);	
		txtCCV.SetEnable(false);	
		lstCreditType.SetEnable(false);	 
		txtCreditOwner.SetEnable(false);
		txtCash.SetEnable(false);

		txtCreditNo.text="";
		dtExpDate.text="";
		txtCCV.text="";	
		lstCreditType.text=""; 
		txtCreditOwner.text="";
		txtCash.text="";*/
    }
    else if ( lstGTDType.value == '01' )
    {       
        document.all("tab_credit").style.display = "";
        document.all("tab_cash").style.display   = "none";
        
        /*txtCreditNo.SetEnable(true);
		dtExpDate.SetEnable(true);	
		txtCCV.SetEnable(true);	
		lstCreditType.SetEnable(true);	 
		txtCreditOwner.SetEnable(true);
		txtCash.SetEnable(true);*/
    }
    else if ( lstGTDType.value == '02' )
    {       
        document.all("tab_credit").style.display = "none";
        document.all("tab_cash").style.display   = "";
        
        /*txtCreditNo.SetEnable(true);
		dtExpDate.SetEnable(true);	
		txtCCV.SetEnable(true);	
		lstCreditType.SetEnable(true);	 
		txtCreditOwner.SetEnable(true);
		txtCash.SetEnable(true);*/
    }    
}
function OnPrint(obj)
{
	if(obj=='1')
	{	
		if(txtMasterPK.GetData() != ''){
			   var url = '/standard/reports/60/24/rpt_60240010_Reservation.aspx?p_master_pk='+txtMasterPK.text+"&p_company_pk="+txtcompany_pk.text;
			System.OpenTargetPage( System.RootURL+url , "newform" );
		}
		else
		{
			alert("Please,choose guest to print.");
		}
	}
	if(obj=='2')
	{	
		if(txtMasterPK.GetData() != ''){
			  var url = '/standard/reports/60/24/rpt_60240010_Group_Record.aspx?p_master_pk='+ txtMasterPK.text;
			System.OpenTargetPage( System.RootURL+url , "newform" );
			
		}
		else
		{
			alert("Please,choose guest to print.");
		}
	}
}
function SetVisibleControl()
{
	if(radTab.GetData()=='2' || radTab.GetData()=='3')
	{
		lstPriceType.SetEnable(false);
		btnAddRmType.SetEnable(false);
		btnAddNewDTL.SetEnable(false);
		btnDeleteDTL.SetEnable(false);
	}
	else
	{
		lstPriceType.SetEnable(true);
		btnAddRmType.SetEnable(true);
		btnAddNewDTL.SetEnable(true);
		btnDeleteDTL.SetEnable(true);
	}
}
 function OnChangeTab()
 { 
    SetVisibleControl();
	var strRad = radTab.GetData();
             
	switch (strRad)
	{
		case '1':
		    document.all("Tab_Detail").style.display     = "";
		    document.all("Tab_Request").style.display = "none"; 
 		    document.all("Tab_Lunch_Dinner").style.display = "none";
			
		    document.all("tab01").style.color = "red"; 
		    document.all("tab02").style.color = "";
			document.all("tab03").style.color = "";
         break;
        
        case '2':
		    document.all("Tab_Detail").style.display  = "none";
			document.all("Tab_Lunch_Dinner").style.display = "none";
		    document.all("Tab_Request").style.display = "";
 		    
		    document.all("tab01").style.color = ""; 
		    document.all("tab02").style.color = "red";
			document.all("tab03").style.color = "";
		break;
		case '3':
		    document.all("Tab_Detail").style.display  = "none";
			document.all("Tab_Lunch_Dinner").style.display = "";
		    document.all("Tab_Request").style.display = "none";
 		    
		    document.all("tab01").style.color = ""; 
		    document.all("tab02").style.color = "";
			document.all("tab03").style.color = "red";
		break;	  	
     } 
 }
 //===============================================================
 function OnEnterEvent(obj)
 {
     switch(obj.id)
     {
        case 'txtFirstName':
            txtLastName.GetControl().focus();
        break;
     
        case 'txtLastName':
            dtFrom2.GetControl().focus();
        break;
        
        case 'dtFrom2':
            txtHFrom.GetControl().focus();
        break;   
        
        case 'txtHFrom':
            dtTo2.GetControl().focus();
        break;
        
        case 'dtTo2':
            txtHTo.GetControl().focus();
        break; 
        
        case 'txtHTo':
            lstCustType.GetControl().focus();
        break;     
        
        case 'lstCustType':
            txtDays.GetControl().focus();
        break;
        
        case 'txtDays':
            txtTTCust.GetControl().focus();
        break; 
        
        case 'txtTTCust':
            txtTotalRoom.GetControl().focus();
        break; 
        
        case 'txtTotalRoom':
            txtContact.GetControl().focus();
        break;                 
        
        case 'txtContact':
            txtPhone.GetControl().focus();
        break;  
        
        case 'txtPhone':
            txtAddress.GetControl().focus();
        break;   
        
        case 'txtAddress':
            lstCity.GetControl().focus();
        break;     
        
        case 'lstCity':
            lstNation.GetControl().focus();
        break;     
        
        case 'lstNation':
            txtFax.GetControl().focus();
        break;  
        
        case 'txtFax':
            txtEmail.GetControl().focus();
        break;    
        
        case 'txtEmail':
            lstPriceType.GetControl().focus();
        break;         
        
        case 'lstPriceType':
            lstPayment.GetControl().focus();
        break; 
        
        case 'lstPayment':
            lstCCY.GetControl().focus();
        break;                                                                                                                  
     }
 }
 //=========================================================================        

function CheckInput()
{   
    var col, row;
    col = event.col;
    row = event.row; 
    
    if ( col == COL_D1_ADULT || col == COL_D1_CHILD )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDTL.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDTL.SetGridText( row, col, System.Round(dQuantiy,0));
            }
        }               
        else
        {
            grdDTL.SetGridText(row,col,"") ;
        }         
    }   
    
}
function OnCopy()
{
	if (txtMasterPK.text != '')
	{
		if (confirm("Do you want copy data booking reservation ?"))
		{
			process_htbk00010_copy.Call();			
		}
	}
	else
	{
		alert("Please,choose guest name to copy data.");
	}
}  
function OnPrintAdvance(url){
		System.OpenTargetPage(url); 
 }
 function OnCheckCustomer(obj_popup)
{
	if(obj_popup=='1')
	{
		var path = System.RootURL + '/standard/forms/60/24/60240080_pp.aspx';
		var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
 
		 if ( obj != null )
		 {
			txtCompanyPK_S.text = obj[0]; 
			txtCompanyNameS.text   = obj[4];
			OnButtonClick('Main') ;
		}
	}
    
}
function OnSpecialSVC()
{
	if (grdDTL.row == '-1')
		{
			return;
		}
		var path = System.RootURL + '/standard/forms/60/24/60240010_SpecialSVC_Popup.aspx?p_bookingd_pk='+grdDTL.GetGridData(grdDTL.row, G2_PK);
		   var object = System.OpenModal( path ,1000, 550 ,  'resizable:yes;status:yes',window);
	
}
function SetColorGirdDtl()
{
    for(var i=1;i<grdDTL.rows;i++)
	{
		if(grdDTL.GetGridData(i,COL_D1_ROOM_TYPE) == "DMY")
		 {
			grdDTL.SetCellBgColor(i, 0, i, 18,0x99FFFF);
		 }
	}
}
function OnDeleteRoom()
{
	if(grdDTL.rows > 1)
	{
		if(grdDTL.row !='-1')
		{
			grdDTL.SetGridText( grdDTL.row, COL_D1_THT_ROOM_PK,''); 
			grdDTL.SetGridText( grdDTL.row, COL_D1_ROOM,'');
		}
	}
}
 //===============================================================
</script>

<body>
    <!------------------------------------------------------------------------------------->
    <gw:data id="dso_htbk00010_main_list" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" parameter="" function="st_ht_sel_60240010_main_list">
			<input bind="grdData">
				<input bind="dtFrom1" />
				<input bind="dtTo1" />
				<input bind="txtSearch" />
				<input bind="lstSearchStatus" />  
				<input bind="txtCompanyNameS" />
				<input bind="lstSearchDateType" />
			</input> 
			<output bind="grdData" /> 
		</dso> 
	</xml> 
</gw:data>
    <!------------------------------------------------------------------------------------->
    <gw:data id="dso_htbk00010_mst" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso  type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47" function="st_ht_sel_60240010_mst" procedure="st_ht_upd_60240010_mst"> 
			<inout>
				<inout bind="txtMasterPK" />
				<inout bind="txtSlipNo"/>
				<inout bind="dtFrom2"/>
				<inout bind="dtTo2"/>
				<inout bind="txtHFrom"/>
				<inout bind="txtHTo"/>
				<inout bind="lstCustType"/>				
				<inout bind="txtLastName"/>
				<inout bind="txtFirstName"/>
				<inout bind="lstCCY"/>
				<inout bind="tco_buspartner_pk"/>
				<inout bind="txtDays"/>
				<inout bind="txtTTCust"/>
				<inout bind="txtContact"/>
				<inout bind="txtPhone"/>
				<inout bind="txtEmail"/>
				<inout bind="txtAddress"/>
				<inout bind="lstNation"/>
				<inout bind="lstPriceType"/>
				<inout bind="txtFax"/>
				<inout bind="lstCity"/>
				<inout bind="edtRequest"/>
				<inout bind="edtAdjust"/>
				<inout bind="txtNote"/>
				<inout bind="txtCancel"/>
				<inout bind="txtConfirm"/>
				<inout bind="lstPayment"/>	
				<inout bind="txtGuestPK"/>	
				<inout bind="txtDepositl"/>	
				<inout bind="lstGTDType"/>	
				<inout bind="txtCreditNo"/>	
				<inout bind="txtExpDate"/>	
				<inout bind="txtCCV"/>	
				<inout bind="lstCreditType"/>	 
				<inout bind="txtCreditOwner"/>
				<inout bind="txtCompany"/>	
				<inout bind="txtCash"/>
				<inout bind="lstStatus" />
				<inout bind="lblCreateBy" />
				<inout bind="lblCreateDate" />
				<inout bind="lblModifiedBy" />
				<inout bind="lblModifiedDate" />
				<inout bind="dtReleaseDate" />
				<inout bind="lstBookingSource" />
				<inout bind="chkRMFeeMaster" />
				<inout bind="dtDepositDate" />
				<inout bind="lstBookingType" />
				<inout bind="txtTotalNightsM" />
			</inout>
		</dso>  
	</xml> 
</gw:data>
    <!------------------------------------------------------------------------------------->
    <gw:data id="dso_htbk00010_dtl" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23" function="st_ht_sel_60240010_dtl" procedure="st_ht_upd_60240010_dtl"> 
			<input bind="grdDTL">
				<input bind="txtMasterPK" />
			</input> 
			<output bind="grdDTL" /> 
		</dso> 
	</xml> 
</gw:data>
    <!------------------------------------------------------------------------------------->
    <gw:data id="dso_htbk00010_confirm" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso  type="process" procedure="st_ht_PRO_60240010_CONFIRM" > 
			<input>
				 <input bind="txtMasterPK" /> 
			</input> 
			<output> 
				<output bind="txtTEMP"/>
			</output>
		</dso> 
	</xml> 
</gw:data>
    <!------------------------------------------------------------------------------------->
    <gw:data id="dso_htbk00010_cancel" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso  type="process" procedure="st_ht_PRO_60240010_CANCEL" > 
			<input>
				 <input bind="txtMasterPK" /> 
			</input> 
			<output> 
				<output bind="txtTEMP"/>
			</output>
		</dso> 
	</xml> 
</gw:data>
    <!----------------------------process_copy-date-booking-hotel---------------------------------------------------->
    <gw:data id="process_htbk00010_copy" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso  type="process" procedure="st_ht_pro_60240010_copy" > 
			<input>
				 <input bind="txtMasterPK" /> 
			</input> 
			<output> 
				<output bind="txtMasterPK"/>
			</output>
		</dso> 
	</xml> 
</gw:data>
<!--------------------grdLunchDinner---------------->
<gw:data id="dso_htbk00010_LunchDinner" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" parameter="0,1,2,3,4,5,6,7,8" function="st_ht_sel_60240010_LunchDinner" procedure="st_ht_upd_60240010_LunchDinner"> 
			<input bind="grdLunchDinner">
				<input bind="txtMasterPK" />
			</input> 
			<output bind="grdLunchDinner" /> 
		</dso> 
	</xml> 
</gw:data>
<!------------------------------------------------->	
    <table style="height: 100%; width: 100%" border="1">
        <tr>
            <td style="width: 20%" id="left">
                <table style="height: 100%; width: 100%" border="0">
					<tr style="height: 1%">
                        <td style="width: 25%"> 
                        </td>
                        <td style="width: 72%" > 
                        </td>
						<td style="width: 3%" >    
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td style="width: 25%" align="right">
                             Date Type:
                        </td>
                        <td style="width: 75%" colspan="2">
                            <gw:list id="lstSearchDateType"   onchange="OnButtonClick('Main')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 25%" align="right">
                            Arrival date
                        </td>
                        <td style="width: 72%; white-space: nowrap">
                            <gw:datebox id="dtFrom1" lang="1"   onchange="OnButtonClick('Main')" />
                            ~<gw:datebox id="dtTo1" lang="1"   onchange="OnButtonClick('Main')" />
                        </td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnSearch" img="search" onclick="OnButtonClick('Main')" alt="Search" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 25%; white-space: nowrap">
                            RSV #/Group
                        </td>
                        <td style="width: 75%" colspan="2">
                            <gw:textbox id="txtSearch" styles="width: 100%" onenterkey="OnButtonClick('Main')" />
                        </td>
                    </tr>
					<tr>
                        <td colspan=3>
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 27%">
                                        Company</td>
                                    <td style="width: 70%; white-space: nowrap">
                                        <gw:textbox id="txtCompanyNameS" styles="width:100%" onenterkey="OnButtonClick('Main')"  />
                                    </td>
									<td style="width: 3%"><gw:imgbtn id="btnClearCompanyS" img="reset" alt="Reset" onclick="txtCompanyNameS.text='';txtCompanyPK_S.text='';" /></td>
                                </tr>
								</table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 25%">
                            Status
                        </td>
                        <td style="width: 75%" colspan="2">
                            <gw:list id="lstSearchStatus"   onchange="OnButtonClick('Main')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="3">
                            <table style="height: 100%; width: 100%" border="0">
                                <tr style="height: 1%">
                                    <td style="width: 30%">
                                        Total Guest:
                                    </td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtTotalGuest" styles="width: 100%" />
                                    </td>
                                    <td style="width: 30%">
                                        Total Room:
                                    </td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtTotalRoomGrdS" styles="width: 100%" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr> 
					<tr style="height: 1%">
					<td  colspan="3">
							<table style="height: 100%; width: 100%" border="0">
                                <tr style="height: 1%">
                                    <td style="width: 30%">
                                        Total RSV:
                                    </td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtTT_rsv" styles="width: 100%" />
                                    </td>
                                    <td style="width: 30%">
                                        Total Nights:
                                    </td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtTotalNights" styles="width: 100%" />
                                    </td>
                                </tr>
                            </table>
                     </td>
                    </tr>
                    <tr style="height: 96%">
                        <td  colspan="3">						
                            <gw:grid id="grdData" header="_PK|Arrival|Departure|Nights|Rooms|Group|Company Name|RSV No|_First_Name"
                                format="0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0" defaults="||||||||" editcol="0|0|0|0|0|0|0|0|0"
								autosize="true"
                                widths="1000|1000|1000|1000|1000|1000|1000" styles="width:100%;height:100%" oncellclick="OnButtonClick('MST')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 80%" align="center" id="right">
                <table valign='top' style="height: 100%; width: 100%" border="0">
                    <tr style="height: 1%">
                        <td colspan="8">
                            <table style="height: 100%; width: 100%">
                                <tr>
                                    <td style="width: 20%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand"
                                            onclick="OnButtonClick('OnToggle')" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Resv #
                                    </td>
                                    <td style="width: 15%" align="left">
                                        <gw:textbox id="txtSlipNo" styles="width: 100" csstype="mandatory" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        Status
                                    </td>
                                    <td style="width: 15%" align="left">
                                        <gw:list id="lstStatus" styles="width: 100" />
                                    </td>
                                    <td style="width: 18%" align="right">
										Total Amt
                                    </td>
									<td style="width: 16%" align="right">
										<gw:textbox id="txtTotalAmt" styles="width: 100%" type="number" format="###,###,###,###.#"
                                            styles="text-align:right;width:100%;color:red" />
                                    </td>
                                    <td style="width: 10%">
                                        <gw:icon id="btnCopy" text="Copy" onclick="OnCopy()" styles="width: 100%" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="excel" alt="Print Reservation" text="Print Reservation" id="btnReport" onclick="OnPrint('1')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="new" alt="New" id="btnAddNew" onclick="OnNew(1)" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete(1)" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="save" alt="Save" id="btnSave" onclick="OnButtonClick('Save')" />
                                    </td>
									<td style="width: 2%" align="right">
                                        <gw:imgbtn img="excel" alt="Group_Record" text="Group_Record" id="btnReport2" onclick="OnPrint('2')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8">
                            <table style="width: 100%; height: 100%; background: #BDE9FF">
                                <tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp(1)"><b style="color: Red">*
                                        </b>Group</b>
                                    </td>
                                    <td style="width: 45%; white-space: nowrap">
										<table style="width: 100%; height: 100%">
                                            <tr>
                                                <td style="width: 50%" align="right">
                                                    <gw:textbox id="txtLastName" styles="width: 100%" csstype="mandatory" onenterkey="OnEnterEvent(this)" />
                                                </td>
                                                <td style="width: 10%" align="right" nowrap>
                                                    Booking Type
                                                </td>
                                                <td style="width: 40%" >
                                                    <gw:list id="lstBookingType" styles="width: 100%" onenterkey="OnEnterEvent(this)" />
                                                </td>
                                            </tr>
                                        </table>
                                        
                                    </td>
                                    <td style="width: 5%" align="right">
                                        <b style="color: Red">*</b>Arrive
                                    </td>
                                    <td style="width: 10%">
                                        <gw:datebox id="dtFrom2" lang="1" styles="width:100%" nullaccept="T" onchange="ChangeDate()"
                                            onenterkey="OnEnterEvent(this)" />
                                    </td>
                                    <td style="width: 10%">
                                        <b style="color: Red">*</b><gw:textbox id="txtHFrom" styles="width: 80; text-align: center" onchange='checkTime(1)'
                                            onenterkey="OnEnterEvent(this)" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        <b style="color: Red">*</b>Depart
                                    </td>
                                    <td style="width: 10%">
                                        <gw:datebox id="dtTo2" lang="1" styles="width:100%;" nullaccept="T" onchange="ChangeDate()"
                                            onenterkey="OnEnterEvent(this)" />
                                    </td>
                                    <td style="width: 10%">
                                        <gw:textbox id="txtHTo" styles="width: 80; text-align: center" onchange='checkTime(2)'
                                            onenterkey="OnEnterEvent(this)" />
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                         <b style="color: Red">*</b>MKT.Segment
                                    </td>
                                    <td style="width: 45%">
                                        <gw:list id="lstCustType" styles="width: 100%" onenterkey="OnEnterEvent(this)" />
                                    </td>
                                    <td colspan="6">
                                        <table style="width: 100%; height: 100%">
                                            <tr>
												<td style="width: 5%" align="right" nowrap>
                                                    Pax
                                                </td>
                                                <td style="width: 20%" colspan="2">
                                                    <gw:textbox id="txtTTCust" type="number" format="###,###,###" styles="width: 100%"
                                                        onenterkey="OnEnterEvent(this)" readonly="T" />
                                                </td>
                                                <td style="width: 5%" align="right">
                                                    Nights
                                                </td>
                                                <td style="width: 20%" colspan="2">
                                                    <gw:textbox id="txtDays" type="number" format="###,###,###" styles="width: 100%"
                                                        onenterkey="OnInHouseDay();OnEnterEvent(this)" readonly="T" />
                                                </td>
                                                
                                                <td style="width: 5%; white-space: nowrap" align="right">
                                                    Total Room
                                                </td>
                                                <td style="width: 20%">
                                                    <gw:textbox id="txtTotalRoom" styles="width: 100%" type="number" format="###,###,###,###"
                                                        csstype="mandatory" onenterkey="OnEnterEvent(this)" readonly="T" />
                                                </td>
												<td style="width: 5%; white-space: nowrap" align="right">
                                                    Total Nights
                                                </td>
                                                <td style="width: 20%">
                                                    <gw:textbox id="txtTotalNightsM" styles="width: 100%" type="number" format="###,###,###,###"
                                                        csstype="mandatory" onenterkey="OnEnterEvent(this)" readonly="T" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp(2)"><b style="color: Red">*</b>Company</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtCompany" styles="width: 100%" onenterkey="OnEnterEvent(this)" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        <b style="color: Red">*</b>Contact
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtContact" styles="width: 100%" csstype="mandatory" onenterkey="OnEnterEvent(this)" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right" align="right">
                                        <b style="color: Red">*</b>Book Tel
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtPhone" styles="width: 100%" csstype="mandatory" onenterkey="OnEnterEvent(this)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%" align="right">
                                        Address
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtAddress" styles="width: 100%" onenterkey="OnEnterEvent(this)" />
                                    </td>
                                    <td style="width: 5%" align="right" align="right">
                                        City
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstCity" styles="width: 100%" onenterkey="OnEnterEvent(this)" />
                                    </td>
                                    <td style="width: 5%" align="right" nowrap>
                                        <b style="color: Red">*</b>Nation
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstNation" styles="width: 100%" onenterkey="OnEnterEvent(this)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%" align="right">
                                        Fax
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtFax" styles="width: 100%" onenterkey="OnEnterEvent(this)" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        Email
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtEmail" styles="width: 100%" onchange='checkEmail()' onenterkey="OnEnterEvent(this)" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: Red">*</b>Booking Source:
                                    </td>
                                    <td style="width: 25%" colspan="1">
                                        <gw:list id="lstBookingSource" styles="width: 100%" csstype="mandatory" onenterkey="OnEnterEvent(this)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%" align="right" nowrap>
                                        Payment
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstPayment" styles="width: 100%" onenterkey="OnEnterEvent(this)" />
                                    </td>
                                    <td style="width: 5%" align="right" nowrap>
                                        CCY
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstCCY" text="" styles='width:100%' onenterkey="OnEnterEvent(this)" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Create by: 
                                    </td>
                                    <td style="width: 25%" >
                                            <table style="width: 100%; height: 100%" >
                                                <tr>
                                                    <td style="width: 35%">
                                                        <gw:label id="lblCreateBy" styles="width: 100%;" />
                                                    </td>
                                                    <td style="width: 15%">
                                                        Date :
                                                    </td>
                                                    <td style="width: 50%">
														<gw:label id="lblCreateDate" styles="width: 100%;" />
                                                    </td>
                                                    
                                                </tr>
                                            </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8">
                            <table style="width: 100%; height: 100%; background-color: #BDE9FF">
                                <tr>
                                    <td style="width: 5%; white-space: nowrap">
                                        GTD Type
                                    </td>
                                    <td style="width: 27%">
                                        <gw:list id="lstGTDType" text="" styles='width:100%' onchange="HideShowControl()" />
                                    </td>
									
									<td style="width: 10%; white-space: nowrap" align="right">
                                        Release Date
                                    </td>
                                    <td style="width: 8%" align="right">
                                        <gw:datebox id="dtReleaseDate" lang="1" styles="width:100%" csstype="mandatory" nullaccept="T" />
                                    </td>		
									<td style="width: 10%; white-space: nowrap" align="right">
                                        Deposit Date
                                    </td>
                                    <td style="width: 10%" align="left">
                                        <gw:datebox id="dtDepositDate" lang="1" styles="width:100%" csstype="mandatory" nullaccept="T" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Modified by:
                                    </td>
                                    <td style="width: 10%" align="right">
                                        <gw:label id="lblModifiedBy" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        date:
                                    </td>
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        <gw:label id="lblModifiedDate" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 50%" colspan="6">
                                        <fieldset style="padding: 5">
                                            <table style="width: 100%; height: 100%" id="tab_credit">
                                                <tr>
                                                    <td style="width: 5%; white-space: nowrap" align="right">
                                                        Credit Type
                                                    </td>
                                                    <td style="width: 20%">
                                                        <gw:list id="lstCreditType" text="" styles='width:100%' />
                                                    </td>
                                                    <td style="width: 5%; white-space: nowrap">
                                                        Exp.Date
                                                    </td>
                                                    <td style="width: 20%">
                                                        <gw:textbox id="txtExpDate" styles="text-align:left;width:100%;" />
                                                    </td>
                                                    <td style="width: 5%; white-space: nowrap" align="right">
                                                        Credit CCV
                                                    </td>
                                                    <td style="width: 20%">
                                                        <gw:textbox id="txtCCV" styles="text-align:left;width:100%;" />
                                                    </td>
													
                                                </tr>
                                                <tr>
                                                    <td style="width: 5%">
                                                        Card No
                                                    </td>
                                                    <td style="width: 20%">
                                                        <gw:textbox id="txtCreditNo" styles="text-align:left;width:100%;" onenterkey="OnEnterEvent(this)" />
                                                    </td>
                                                    <td style="width: 5%; white-space: nowrap" align="right">
                                                        Credit Owner
                                                    </td>
                                                    <td style="width: 20%">
                                                        <gw:textbox id="txtCreditOwner" styles="width: 100%" />
                                                    </td>
                                                    <td>
														
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
									
                                </tr>
                                <tr>
                                    <td style="width: 50%" colspan="4">
                                        <fieldset style="padding: 5">
                                            <table style="width: 100%; height: 100%" id="tab_cash">
                                                <tr>
                                                    <td style="width: 5%">
                                                        Cash
                                                    </td>
                                                    <td style="width: 25%">
                                                        <gw:textbox id="txtCash" styles="width: 100%" type="number" format="###,###,###,###"
                                                            styles="text-align:right;width:100%;color:red" />
                                                    </td>
                                                    <td style="width: 5%">
                                                    </td>
                                                    <td style="width: 65%">
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
									<td style="width: 44%"></td>
									<td style="width: 6%"><gw:icon id="btnAllotment"  alt="Allotment" styles="display: none" text="Allotment" onclick="OnPopUp(5)" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8">
                            <table style="height: 100%; width: 100%">
                                <tr>
                                    <td style="width: 24%; white-space: nowrap" align="left">
                                        <gw:radio id="radTab" value="1" styles="width:100%" onchange="OnChangeTab()"> 
                                            <span value="1" id="tab01">Detail</span> 
                                            <span value="2" id="tab02">Request</span>
											<span value="3" id="tab03">Lunch/Dinner</span>
                                        </gw:radio>
                                    </td>
                                    <td style="width: 9%" align="center">
										<gw:icon id="btnSpecialSVC" text="Special SVC" onclick="OnSpecialSVC()" styles="width: 100%" />
                                    </td>
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        Rate Plan
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstPriceType" styles="width: 180" onchange="OnButtonClick('Room')" onenterkey="OnEnterEvent(this)" />
                                    </td>
                                  
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnAddTaskPlan" styles="display:none;" alt="Add Task Plan" text="Add Task Plan"
                                            onclick="OnPopUp(4)" />
                                    </td>
									<td style="width: 8%"><gw:icon id="btnDummyRoom" text="Dummy RM" onclick="GetDummyRoom()" /></td>
									<td style="width: 20%"><gw:checkbox id="chkRMFeeMaster" defaultvalue="Y|N" value="N" tyles="width:15%" />RM charge to master</td>
									<td style="width: 3%">   
                                        <gw:icon text="Delete RM" id="btnDeleteRM" onclick="OnDeleteRoom()" />
                                    </td>
                                    <td style="width: 3%">   
                                        <gw:icon text="RM Type" id="btnAddRmType" onclick="OnAddRmType()" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn img="new" alt="New" id="btnAddNewDTL" onclick="OnNew(2)" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn img="delete" alt="Delete" id="btnDeleteDTL" onclick="OnDelete(2)" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="width: 100%; height: 95%; background: #BDE9FF">
                        <td>
                            <table style="height: 100%; width: 100%" id="Tab_Detail">
                                <tr> 
                                    <td style="width: 100%; background: white"> 
                                        <gw:grid id="grdDTL" header="Folio#|_tht_booking_pk|*Guest Name|_First Name|*Room type|*Adult|Child|Rate|Deposit|_tht_room_pk|*Room|Allotment YN|Commitment YN|VIP|_Guest2_Name|_Guest3_Name|_Guest4_Name|Package Amt|Status|Request|_tht_guest_profile_pk|*Rate Plan|LUNCH_AMT|DINNER_AMT"
                                            format="0|0|0|0|0|0|0|-2|-0|0|0|3|3|0|0|0|0|-0|0|0|0|0|-0|-0" 
											aligns="0|0|0|0|0|3|3|3|0|0|3|0|0|0|0|0|0|0|0|0|0|0|0|0"
											defaults="|||||||||||||||||||||||"
                                            editcol="0|0|1|1|0|1|1|1|0|0|0|1|1|0|1|1|1|1|1|1|0|1|1|1"
                                            styles="width:100%;height:100%" debug="false" autosize='T' oncelldblclick="PopupRoomNumber(this)"
                                            onafteredit="CheckInput()" />
                                    </td>
                                </tr>
                            </table>
                            <table style="height: 100%; width: 100%" id="Tab_Request">
                                <tr>
                                    <td style="width: 5%">  
                                    </td>
                                    <td style="width: 95%">
										<gw:htmledit styles="width:100%;display:none" rows="3" id="edtRequest" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%"> 
                                    </td>
                                    <td style="width: 95%">
                                        <gw:htmledit styles="width:100%;display:none" id="edtAdjust" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">
                                        Note
                                    </td>
                                    <td colspan='6' style="width: 95%">
                                        <gw:textarea id="txtNote" rows="6" styles="width:100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%">
                                        Cancel Condition
                                    </td>
                                    <td style="width: 5%">
                                        <gw:textarea id="txtCancel" rows="4" styles="width:100%" />
                                    </td>
                                </tr>
                            </table> 
							<table style="height: 100%; width: 100%" id="Tab_Lunch_Dinner">
								<tr style="height: 2%;">
									<td style="width: 91%"></td>
									<td style="width: 3%">
                                        <gw:imgbtn img="new" alt="New Lunch Dinner" id="btnAddNewLunchDinner" onclick="OnNew(3)" />
                                    </td>
                                    <td style="width: 3%">
                                        <gw:imgbtn img="delete" alt="Delete Lunch Dinner" id="btnLunchDinner" onclick="OnDelete(3)" />
                                    </td>
									<td style="width: 3%">
                                        <gw:imgbtn img="save" alt="Save Lunch Dinner" id="btnSaveLunchDinner" onclick="OnButtonClick('SaveLunchDinner')" />
                                    </td>
								</tr>
                                <tr style="height: 98%;">
                                    <td style="width: 100%; background: white" colspan="4">
                                        <gw:grid id="grdLunchDinner" header="_PK|_THT_BOOKING_PK|Book Date|Book Time|Dinner Place|Menu Type|Total Pax|Price|Description"
                                            format="0|0|4|0|0|0|-0|-0|0" aligns="0|0|0|1|0|0|0|0|0"
                                            defaults="||||||||" editcol="1|1|1|1|1|1|1|1|1" widths="0|0|0|0|0|0|0|0|0"
                                            styles="width:100%;height:100%" debug="false" autosize='T'
                                             />  
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="txtMasterPK" styles="display: none" />
<gw:textbox id="txtcompany_pk" styles="display: none" />
<gw:textbox id="txtDepositl" text="0" type="number" format="###,###.##R" styles="text-align:right;display: none" />
<gw:textbox id="tco_buspartner_pk" styles="display: none" />
<gw:textbox id="txtGuestPK" styles="display: none" />
<gw:textbox id="txtConfirm" styles="display: none" />
<gw:textbox id="txtTEMP" styles="display: none" />
<gw:textbox id="txtCompanyPK_S" styles="width:100%; display:none" />
<gw:textbox id="txtFirstName" styles="width: 60%;display:none" csstype="mandatory" onenterkey="OnEnterEvent(this)" />

<!--------------------------------------------------------------------------------------->
</html>
