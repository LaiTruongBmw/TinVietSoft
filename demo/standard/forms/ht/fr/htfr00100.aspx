<!-- #include file="../../../../system/lib/form.inc"  -->
 <%CtlLib.SetUser(Session("APP_DBUSER"))%>
<html>
<head>
    <title>Standard Reservation</title>
</head>
<script>
var COL_M_PK			 = 0,
	COL_M_SLIP_NO		 = 1,
	COL_M_CRT_DATE		 = 2,
	COL_M_CONTACT_PERSON = 3,
	COL_M_TT_CUS		 = 4;

	//"_tht_booking_pk|Folio#|*Guest Name|*Room type|_tht_room_pk|*Room|*From Date|*To Date|*Adult|Child|*Rate Plan
	//|Amount|Deposit Amount|Status|Request"
var G_PK	 			= 0,
	G_THT_BOOKING_PK  	= 1,
	G_FOLIO				= 2,
	G_GUEST_PK	 		= 3,
	G_GUEST_NAME 		= 4,
	G_ROOM_TYPE 		= 5,
	G_THT_ROOM_PK 		= 6,
	G_ROOM_NAME			= 7,
	G_FROM_DT 			= 8,
	G_TO_DT	 			= 9,
	G_ADULT 			= 10,
	G_CHILD 			= 11,
	G_RATE_PLAN 		= 12,
	G_AMOUNT 			= 13,
	G_DEPOSIT_AMT 		= 14,
	G_STATUS 			= 15,
	G_REQUEST 			= 16;
	
var flag_save	= false;
var flag_delete	= false;
function BodyInit()
{  
	//txtCompany_pk.text = "<%=Session("COMPANY_PK")%>";
	System.Translate(document);
	tab_credit.style.display ="none" ;
	//OnButtonClick('OnToggle');
	BindingDataList();
	
}
function BindingDataList()
{ 
	var data="";
	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='NAT'" )%>"; 
	lstNation.SetDataText(data);
	lstNation.value = 'VIE';
	
	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CCY'" )%>"; 
	lstCCY.SetDataText(data);
	lstCCY.value = 'CCY-VND';
	
	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='PMT'" )%>"; 
	lstPayment.SetDataText(data);
	
	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='BKSRC' and use_yn='Y' " )%>||"; 
	lstBookingSource.SetDataText(data);
	lstBookingSource.value='';
	
	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CTYPE' AND USE_YN='Y' order by ord" )%>||"; 
	lstCustType.SetDataText(data);
	lstCustType.value = '';
	
	data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CREDITCARD'" )%>"; 
	lstCreditType.SetDataText(data);
	
	data ="data|1|Search Arrival date |2|Search Create date"
    lstSearchDateType.SetDataText(data);
	lstSearchDateType.value=1;
	
	data ="data|M|Male|F|Female||"
    lstSex.SetDataText(data);
	lstSex.value = '';
	
	data ="#10;CONFIRMED|#20;TENTATIVE|#30;CANCEL|#40;WAITING"
    grdDTL.SetComboFormat(G_STATUS,data);
	
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.PK,a.RATE_CODE ||' - '||a.RATE_NAME FROM  THT_RATE_PLANS a WHERE a.DEL_IF=0 order by a.RATE_CODE " )%>"; 
    grdDTL.SetComboFormat(G_RATE_PLAN, data);

    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, CODE||' - '||NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='RTYPE' order by ord" )%>"; 
    grdDTL.SetComboFormat(G_ROOM_TYPE, data);
	
	data ="data|10|CONFIRMED|20|TENTATIVE|30|CANCEL|40|WAITING"
    lstStatus.SetDataText(data);
	
	txtSlipNo.SetEnable(false);
	txtTotalAmt.SetEnable(false);
	txtDepositAmt.SetEnable(false);
	txtQuantityRoom.SetEnable(false);
	txtAdult.SetEnable(false);
	txtChild.SetEnable(false);
	
	OnNew(1);
}

function OnNew(obj)
{	
	if(obj=="1")
	{
		grdDTL.ClearData();
		data_htfr00100_1.StatusInsert();
		txtSlipNo.text = '*New Voucher*';
		 
		btnSave.SetEnable(true);
		btnDelete.SetEnable(true);
	}
	else if(obj=="2")
	{
		if (dtFromBooking.GetData() == "")
		{
			alert("PLEASE SELECT ARRIVAL DATE FIRSTLY.");
			return;
		}
		 var path = System.RootURL + "/standard/forms/ht/fr/htfr00101.aspx?start_date="+dtFromBooking.GetData()+"&total_night="+txtNights.text;
			var object = System.OpenModal( path ,900 , 900 ,  'resizable:yes;status:yes');
			if ( object != null )
			{
				 for( var i=0; i < object.length; i++)	  
					{	
						arrTemp = object[i];
						grdDTL.AddRow(); 
						grdDTL.SetGridText(grdDTL.rows-1, G_THT_BOOKING_PK, txtMasterPK.text);
						grdDTL.SetGridText(grdDTL.rows-1, G_THT_ROOM_PK, arrTemp[0]);//room_pk
						grdDTL.SetGridText(grdDTL.rows-1, G_ROOM_NAME, arrTemp[1]);//room no
						grdDTL.SetGridText(grdDTL.rows-1, G_ROOM_TYPE, arrTemp[2]);//room type
						grdDTL.SetGridText(grdDTL.rows-1, G_FROM_DT,  dtFromBooking.value);//arrival date
						grdDTL.SetGridText(grdDTL.rows-1, G_TO_DT, dtToBooking.value);//departure date
						grdDTL.SetGridText(grdDTL.rows-1, G_STATUS, 10);
						grdDTL.SetGridText(grdDTL.rows-1, G_GUEST_NAME, txtCustomer.text);
					
					}
			}
		
	}
	
	
}
function OnDelete(obj)
{
	switch(obj)
	{
		case 1:
		    if (confirm('ARE YOU SURE DELETE DATA ?'))
			{
				data_htfr00100_1.StatusDelete();
				flag_delete = true;
				data_htfr00100_1.Call();
			}
		break;
		case 2:
		    if(grdDTL.GetGridData(grdDTL.row,G_PK) == "")
		    {
		        grdDTL.RemoveRowAt(grdDTL.row);
		    }
		    else
		    {
		        if (confirm('ARE YOU SURE DELETE DATA ?'))
		        {
			        grdDTL.DeleteRow();
			        data_htfr00100_2.Call();
			    }
		    }
		break;  
		
    }
}
function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'data_htfr00100_1':
			if (flag_save == true || flag_delete == true)
			{
				if(flag_save == true)
				{
				   if (grdDTL.rows > 1)
					{
						for (row = 1; row < grdDTL.rows; row++)
						{
							if(grdDTL.GetGridData(row, G_THT_BOOKING_PK) == "")
							{
								grdDTL.SetGridText(row, G_THT_BOOKING_PK, txtMasterPK.text);
							}
						}
						  
							flag_save = false;
							data_htfr00100_2.Call();
						
					}
					else
					{
						data_htfr00100_0.Call('SELECT');
					}
				}
				else
				{
						if(grdDTL.rows-1 < 1 )
						{
							flag_delete = false;
							data_htfr00100_0.Call('SELECT');
						}
				}
			}
			else
			{
				 HideShowControl();
				 data_htfr00100_2.Call('SELECT');
			}
		break;
			
	}
}
function CheckValidateDetail()
{  alert("test-0")
    for(var i=1;i<grdDTL.rows;i++)
          {	alert("test0")
            if(grdDTL.GetGridData(i,G_GUEST_NAME) == "")
             {
                alert("PLEASE INPUT GUEST NAME AT ROW "+ i);
                return false;
             } alert("test1")
            if(grdDTL.GetGridData(i,G_ADULT) == "" )
             {
                alert("PLEASE INPUT ADULT AT ROW "+ i);
                return false;
             } alert("test2")
			 if(grdDTL.GetGridData(i, G_RATE_PLAN) == 1)
			 {
				if(grdDTL.GetGridData(i,G_AMOUNT) == "")
				 {
					alert("THE RATE PLAN IS FLEXIBLE,PLEASE INPUT RATE AT ROW "+ i);
					return false;
				 }
			 }
             
          }
          return true;
}
function OnButtonClick(obj)    
{
	switch(obj)
	{
		case 'Main':
			data_htfr00100_0.Call('SELECT');
		break;
		case 'Detail':
			txtMasterPK.text = grdData.GetGridData(grdData.row, COL_M_PK);
			data_htfr00100_1.Call('SELECT');
		break;
		case 'Save':		
			
			if (txtCompany.text == '')
			{
				alert('PLEASE, INPUT COMPANY NAME.');
				txtCompany.GetControl().focus();
				return;
			}
			if (txtCustomer.text == '')
			{
				alert('PLEASE, INPUT CUSTOMER NAME.');
				txtCustomer.GetControl().focus();
				return;
			}
			if (txtMobile.text == '')
			{
				alert('PLEASE, INPUT MOBILE PHONE.');
				txtMobile.GetControl().focus();
				return;
			}
			if (dtFromBooking.value == '')
			{
				alert('PLEASE, INPUT ARRIVAL DATE.'); 
				return;
			}
			if (dtToBooking.value == '')
			{
				alert('PLEASE, INPUT DEPARTURE DATE.');
				return;
			}
			
			flag_save=true; 
			data_htfr00100_1.Call();
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
function checkTime(n) 
{ 
	// regular expression to match required time format  
	// (eg. 08:50 or 8:50am)
	re = /^\d{1,2}:\d{2}([ap]m)?$/;
	switch(n)
	{
		case 1:
			if(txtHoursFromBooking.text != '' && !txtHoursFromBooking.text.match(re)) 
			{ 
				alert("INVALID TIME FORMAT, PLEASE INSERT TYPE HH:MM"); 
				txtHoursFromBooking.focus(); 
				txtHoursFromBooking.text = '';
				return false; 
			}
		break;
		case 2:
			if(txtHoursToBooking.text != '' && !txtHoursToBooking.text.match(re)) 
			{
				alert("INVALID TIME FORMAT, PLEASE INSERT TYPE HH:MM"); 
				txtHoursToBooking.focus(); 
				txtHoursToBooking.text = '';
				return false; 
			}
			
		break;
	}
}
function OnEnterEvent(obj)
 {
     switch(obj.id)
     {
		
     }
 }
function ChangeDate()
{
    if(dtFromBooking.value=="" || dtToBooking.value=="")
    {
        txtNights.text = '';
	}
	else
	{
	    if (Number(dtToBooking.GetData()) == Number(dtFromBooking.GetData()))
        {
	        //dtFromBooking.SetDataText(dtToBooking.GetData());
	        txtNights.text = '0';
        }
        else if(Number(dtToBooking.GetData()) > Number(dtFromBooking.GetData()))
        {
            var dtfrom = new Date(); var dtto = new Date();var one_day=1000*60*60*24;var tt_day;
			dtfrom.setFullYear(Number((dtFromBooking.GetData()).substring(0,4)),Number((dtFromBooking.GetData()).substring(4,6))-1,Number((dtFromBooking.GetData()).substring(6,8)));
			dtto.setFullYear(Number((dtToBooking.GetData()).substring(0,4)),Number((dtToBooking.GetData()).substring(4,6))-1,Number((dtToBooking.GetData()).substring(6,8)));
			tt_day = ((dtto-dtfrom)/one_day);
			txtNights.text = tt_day;
        }
        else if(Number(dtToBooking.GetData()) < Number(dtFromBooking.GetData()))
        {
	        alert('PLEASE, INPUT DATE TO GREATER THAN OR EQUAL DATE FROM');
	        return;
        }
	}	
}
function HideShowControl()
{
    if(lstPayment.value == 'AO30')  //Credit card
    {   
		tab_credit.style.display ="block" ; // show
    }
	else
	{  
		tab_credit.style.display ="none" ; // show
	}
    
}
function OnPopUp(n)
{
	switch(n)
	{
		case 1:		
			var path = System.RootURL + "/standard/forms/ht/fr/htfr00102.aspx?p_company_pk=null";
			var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
			if ( object != null )
			{ 
				txtCompany_pk.text  = 	object[0];
				txtCompany.text		= object[2];
			}
		break;
		case 2:		
			var path = System.RootURL + "/standard/forms/60/25/60250220.aspx";
			var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
			if ( object != null )
			{ 
				txtCustomer_pk.text  = 	object[0];
				txtCustomer.text	 = object[1];
				lstSex.value		= object[2];
				lstNation.value 	= object[3];
				txtPersonalID.text   = object[4];
				dtBirthDate.value	 = object[5];
				txtMobile.text 		 = object[6];
				txtEmail.text		= object[7];
				
			}
		break;
		
	}
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
function PopupRoomNumber(obj)
{
   
	if(obj.col == G_DEPOSIT_AMT) 
	{
		var guest_name = grdDTL.GetGridData(grdDTL.row, G_GUEST_NAME) ;//last_name and first name
		var path = System.RootURL + '/standard/forms/ht/fr/htfr00103.aspx?p_room_allocate_pk='+ grdDTL.GetGridData(grdDTL.row, 0)+"&p_guest_name="+guest_name+"&p_room_no="+grdDTL.GetGridData(grdDTL.row,G_ROOM_NAME);
		var object = System.OpenModal( path ,800 , 300 ,  'resizable:yes;status:yes',window);
		data_htfr00100_2.Call('SELECT');
	}
	if(event.col==G_GUEST_NAME)
	{
		var path = System.RootURL + '/standard/forms/60/25/60250220.aspx?p_guest_name='+ grdDTL.GetGridData(grdDTL.row, G_GUEST_NAME);
			var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
			if ( object != null ) 
			{  
				grdDTL.SetGridText(grdDTL.row,G_GUEST_PK, object[0]);//
				grdDTL.SetGridText(grdDTL.row,G_GUEST_NAME, object[1]);
			} 
	}
	if(obj.col==G_ROOM_NAME )
    {
	   var room_type = grdDTL.GetGridData(grdDTL.row,G_ROOM_TYPE);//room type
	   var dtfrom = grdDTL.GetGridData(grdDTL.row,G_FROM_DT);//from date
       var path = System.RootURL + "/standard/forms/ht/fr/htfr00105.aspx?start_date="+ dtfrom +"&room_type="+ room_type+"&total_night="+txtNights.text;
        var object = System.OpenModal( path ,800 , 500 ,  'resizable:yes;status:yes');
        if ( object != null )
        {
            grdDTL.SetGridText(grdDTL.row, G_THT_ROOM_PK, object[0]);//room_pk
            grdDTL.SetGridText(grdDTL.row, G_ROOM_NAME, object[1]);//room no
			grdDTL.SetGridText(grdDTL.row, G_ROOM_TYPE, object[2]);//room type
			//grdDTL.SetGridText(grdDTL.row, G_RATE_PLAN, lstPriceType.value);// rate  plan
			
        }  
    }
	
}
function OnSpecialSVC()
{
	if (grdDTL.row == '-1')
		{
			return;
		}
		var path = System.RootURL + '/standard/forms/ht/fr/htfr00104.aspx?p_bookingd_pk='+grdDTL.GetGridData(grdDTL.row, G_PK);
		   var object = System.OpenModal( path ,1000, 550 ,  'resizable:yes;status:yes',window);
	
}
</script>
<body>
<gw:data id="data_htfr00100_0" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" parameter="" function="ST_HT_SEL_HTFR00100_0">
			<input bind="grdData">
				<input bind="dtFrSearch" />
				<input bind="dtToSearch" />
				<input bind="txtSearchSlipNo" />
				<input bind="txtSearchCompany" />
				<input bind="txtSearchCustomer" />
				<input bind="lstSearchDateType" />
			</input> 
			<output bind="grdData" /> 
		</dso> 
	</xml> 
</gw:data>
<gw:data id="data_htfr00100_1" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso  type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39" function="ST_HT_SEL_HTFR00100_1" procedure="ST_HT_UPD_HTFR00100_1"> 
			<inout>
				<inout bind="txtMasterPK" />
				<inout bind="dtBooking"/>
				<inout bind="txtSlipNo"/>
				<inout bind="lstCustType"/>
				<inout bind="lstBookingSource"/>
				
				<inout bind="txtCompany_pk"/>
				<inout bind="txtCompany"/>
				<inout bind="txtCustomer"/>
				<inout bind="txtMobile"/>
				<inout bind="dtBirthDate"/>
				<inout bind="txtPersonalID"/>
				
				<inout bind="txtPassport"/>
				<inout bind="txtEmail"/>
				<inout bind="lstSex"/>
				<inout bind="txtAddress"/>
				<inout bind="txtCity"/>
				
				<inout bind="lstNation"/>
				<inout bind="txtNote"/>
				<inout bind="dtFromBooking"/>
				<inout bind="txtHoursFromBooking"/>
				<inout bind="dtToBooking"/>
				
				<inout bind="txtHoursToBooking"/>
				<inout bind="txtNights"/>
				<inout bind="lstPayment"/>
				<inout bind="lstCCY"/>
				<inout bind="txtPax"/>
				
				<inout bind="lstCreditType"/>
				<inout bind="txtExpDate"/>
				<inout bind="txtCCV"/>
				<inout bind="txtCreditNo"/>
				<inout bind="txtCreditOwner"/>
				
				<inout bind="dtReleaseDate"/>
				<inout bind="txtTotalAmt"/>
				<inout bind="txtDepositAmt"/>
				<inout bind="txtQuantityRoom"/>
				<inout bind="txtAdult"/>
				
				<inout bind="txtChild"/>
				<inout bind="lstStatus"/>
				<inout bind="txtCustomer_pk"/>
			</inout>
		</dso>  
	</xml> 
</gw:data>
<gw:data id="data_htfr00100_2" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="ST_HT_SEL_HTFR00100_2" procedure="ST_HT_UPD_HTFR00100_2"> 
			<input bind="grdDTL">
				<input bind="txtMasterPK" />
			</input> 
			<output bind="grdDTL" /> 
		</dso> 
	</xml> 
</gw:data>
    <table style="height: 100%; width: 100%;border:1px solid #BDE9FF;" cellpadding="0" cellspacing="0">
        <tr>
            <td style="width: 30%;border-right:1px solid #BDE9FF;" id="left">
                <!--For Search-->
                <table style="height: 100%; width: 100%" border="0" cellpadding="0" cellspacing="2">
					<tr style="height: 1%">
                        <td style="width: 25%" align="right">
                             Date Type:
                        </td>
                        <td style="width: 75%" colspan="2">
                            <gw:list id="lstSearchDateType"   onchange="OnButtonClick('Main')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 1%;white-space:nowrap" align="right">
                            Search Date
                        </td>
                        <td style="white-space: nowrap">
                            <gw:datebox id="dtFrSearch" lang="1"  />~<gw:datebox id="dtToSearch" lang="1" />
                        </td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnSearch" img="search" onclick="OnButtonClick('Main')" alt="Search" />
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td style="width: 1%; white-space: nowrap" align="right">
                            Slip No
                        </td>
                        <td style="width: 75%" colspan="2">
                            <gw:textbox id="txtSearchSlipNo" styles="width: 100%" onenterkey="OnButtonClick('Main')" />
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td style="width: 1%; white-space: nowrap" align="right">
                            Company
                        </td>
                        <td style="width: 75%" colspan="2">
                            <gw:textbox id="txtSearchCompany" styles="width: 100%" onenterkey="OnButtonClick('Main')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 1%; white-space: nowrap" align="right">
                            Customer
                        </td>
                        <td style="width: 75%" colspan="2">
                            <gw:textbox id="txtSearchCustomer" styles="width: 100%" onenterkey="OnButtonClick('Main')" />
                        </td>
                    </tr>
                    
                    <tr style="height: 96%">
                        <td  colspan="3" style="padding-top:6px">						
                            <gw:grid id="grdData" header="_PK|Arrival|Departure|Nights|Rooms|Group|Company Name|RSV No|_First_Name"
                                format="0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0" defaults="||||||||" editcol="0|0|0|0|0|0|0|0|0"
								autosize="true"
                                widths="1000|1000|1000|1000|1000|1000|1000" styles="width:100%;height:100%" oncellclick="OnButtonClick('Detail')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 70%" align="center" id="right">
                <!--For Content-->
                <table valign='top' style="height: 100%; width: 100%" border="0">
                    <tr style="height: 1%">
                        <td>
                            <!--For Status Master-->
                            <table style="height: 100%; width: 100%">
                                <tr>
                                    <td style="width: 1%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand"
                                            onclick="OnButtonClick('OnToggle')" />
                                    </td>
									<td style="width: 1%;white-space:nowrap" align="right">
                                       Date
                                    </td>
									
									<td style="width: 1%" align="left">
                                        <gw:datebox id="dtBooking" lang="1"  />
                                    </td>
									<td style="width: 15%;white-space:nowrap" align="right">

                                    </td>
									<td style="width: 1%;white-space:nowrap" align="right">
                                        Slip No
                                    </td>
									<td style="width: 1%" align="left">
                                        <gw:textbox id="txtSlipNo" styles="width: 100px" csstype="mandatory" />
                                    </td>
									<td style="width: 18%;white-space:nowrap" align="right">

                                    </td>
									<td style="width: 8%" align="right">
										Status
                                    </td>
									<td style="width: 15%" align="left">
										<gw:list id="lstStatus" styles="width: 100" />
                                    </td>
                                   <td style="width: 6%" align="right">
										
                                    </td>
									<td style="width: 15%" align="left">
										
                                    </td>
                                    <td style="width: 5%" align="left">
                                       
                                    </td>
                                    
                                    <td style="width: 1%;display:none">
                                        <gw:imgBtn id="btnCopy" img="copy" img="copy" text="Copy" onclick="OnCopy()" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnAddNew" img="new" img="new" text="New" onclick="OnNew(1)" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnDelete" img="delete" img="delete" text="Delete" onclick="OnDelete(1)" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnSave" img="save" img="save" text="Save" onclick="OnButtonClick('Save')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height:1%">
                        <td>
                            <!--For Book Room Basic Master-->
                            <table style="width: 100%; height: 100%; background: #F5FFFA">
                                <tr>
                                    <td style="width: 1%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp(1)">
										<b style="color: Red">*</b> Company</b>
                                    </td>
                                    <td style="width: 20%" align="right">
										<gw:textbox id="txtCompany" styles="width: 100%" csstype="mandatory"  />
                                    </td>
                                    <td style="width: 1%;white-space:nowrap" align="right">
										<b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp(2)">
                                       <b style="color: Red">*</b> Customer
                                    </td>
                                    <td style="width: 20%" align="right">
                                        <gw:textbox id="txtCustomer" styles="width: 100%"  />
                                    </td>
									<td style="width: 1%;white-space:nowrap" align="right">
                                        <b style="color: Red">*</b> Mobile
                                    </td>
                                    <td style="width: 20%" align="right">
                                        <gw:textbox id="txtMobile" styles="width: 100%" csstype="mandatory"  />
                                    </td>
									<td style="width: 1%;white-space:nowrap" align="right">
                                        Birth Date
                                    </td>
                                    <td style="width: 10%" align="right">
										<gw:datebox id="dtBirthDate" lang="1" nullaccept="T" />
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td style="width: 1%;white-space:nowrap" align="right">
                                        Personal ID
                                    </td>
                                    <td>
                                        <gw:textbox id="txtPersonalID" styles="width: 100%"  />
                                    </td>
									<td style="width: 1%;white-space:nowrap" align="right" >
                                        Passport
                                    </td>
                                    <td>
                                        <gw:textbox id="txtPassport" styles="width: 100%" />
                                    </td>
                                    <td style="width: 1%;white-space:nowrap" align="right" >
                                        Email
                                    </td>
                                    <td>
                                        <gw:textbox id="txtEmail" styles="width: 100%" onchange='checkEmail()'  />
                                    </td>
                                    
                                    <td style="width: 1%;white-space:nowrap" align="right">
                                        Sex
                                    </td>
                                    <td>
                                        <gw:list id="lstSex" text="" styles='width:100%' />
                                    </td>
                                    
                                </tr>
								<tr>
                                    <td style="width: 1%;white-space:nowrap" align="right">
                                        Address
                                    </td>
                                    <td>
                                       <gw:textbox id="txtAddress" styles="width: 100%" onchange=''  />
                                    </td>
                                    <td style="width: 1%;white-space:nowrap" align="right">
                                        City
                                    </td>
                                    <td>
                                        <gw:textbox id="txtCity" styles="width: 100%" onchange=''  />
                                    </td>
                                    <td style="width: 1%;white-space:nowrap" align="right">
                                        Nation
                                    </td>
                                    <td>
                                        <gw:list id="lstNation" styles="width: 100%" onenterkey="OnEnterEvent(this)" />
                                    </td>
                                    <td style="width: 1%;white-space:nowrap" align="right">
                                        Source
                                    </td>
                                    <td>
                                        <gw:list id="lstBookingSource" styles="width: 100%" csstype="mandatory" onenterkey="OnEnterEvent(this)" />
                                    </td>
                                    
                                </tr>
								<tr style="height: 1%">
                                    <td style="width: 1%;white-space:nowrap" align="right">
                                        Note
                                    </td>
                                    <td colspan=3 >
                                        <gw:textbox id="txtNote" styles="width: 100%"   />
                                    </td>
                                    <td style="width: 1%;white-space:nowrap" align="right">
                                        Segment
                                    </td>
                                    <td colspan=3 >
                                        <gw:list id="lstCustType" styles="width: 100%" onenterkey="OnEnterEvent(this)" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height:100%">
                        <td valign="top">
                            <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    
									
                                    <!--For Book Room Detail-->
                                    <td style="width:70%;border-top:1px solid #BDE9FF;border-right:1px solid #BDE9FF;border-bottom:1px solid #BDE9FF;" valign="top">
                                        <table style="width: 100%;height:100%" cellpadding="0" cellspacing="0">
                                            <tr style="background-color:white">
                                                <td style="height:30px;">
                                                    <table style="height: 100%; width: 100%" cellpadding="0" cellspacing="2">
                                                        <tr>
                                                            <td align="right" colspan="7">
                                                                <table cellpadding="0" cellspacing="0" border="0">
                                                                    
																	<tr>
                                                                        <td colspan="10" align="right"  style="width: 5%;white-space:nowrap" >
                                                                             <fieldset style="padding: 5">
																				<table style="width: 100%; height: 100%" >
																					<tr>
																						<td style="width: 10%; white-space: nowrap" align="right">
																							<b style="color: Red">*</b> Arrival
																						</td>
																						<td style="width: 10%">
																							<gw:datebox id="dtFromBooking" lang="1" nullaccept="T" onchange="ChangeDate()"/>  ~
																						</td>
																						<td  style="width: 5%;white-space:nowrap" >
																							<gw:textbox id="txtHoursFromBooking" styles="width: 80; text-align: center" onchange='checkTime(1)' onenterkey="OnEnterEvent(this)" />
																						</td>
																						<td style="width: 10%; white-space: nowrap" align="right">
																							<b style="color: Red">*</b> Departure
																						</td>
																						<td style="width: 10%">
																							<gw:datebox id="dtToBooking" lang="1" nullaccept="T" onchange="ChangeDate()"/> ~
																						</td>
																						<td  style="width: 5%;white-space:nowrap" >
																							<gw:textbox id="txtHoursToBooking" styles="width: 80; text-align: center" onchange='checkTime(2)' onenterkey="OnEnterEvent(this)" />
																						</td>
																						<td style="width: 10%; white-space: nowrap" align="right">
																							Nights
																						</td>
																						<td style="width: 15%">
																							<gw:textbox id="txtNights"  width="100%" type="number" format="###,###,###,###" />
																						</td>
																						
																					</tr>
																					<tr>
																						<td style="width: 10%" align="right">
																							Payment
																						</td>
																						<td colspan=2 style="width: 15%">
																							<gw:list id="lstPayment" styles="width: 100%" onchange="HideShowControl()" />
																						</td>
																						<td style="width: 10%; white-space: nowrap" align="right">
																							Currency
																						</td>
																						<td colspan=2 style="width: 15%">
																							<gw:list id="lstCCY" text="" styles='width:100%' onenterkey="OnEnterEvent(this)" />
																						</td>
																						<td style="width: 10%; white-space: nowrap" align="right">
																							Pax
																						</td>
																						<td style="width: 15%">
																							<gw:textbox id="txtPax" type="number" format="###,###,###" styles="width: 100%" onenterkey="OnEnterEvent(this)"  />
																						</td>
																					</tr>
																				</table>
																			</fieldset>
                                                                        </td>
                                                                    </tr>
																	<tr>
                                                                        <td id="tab_credit" colspan="10" align="right"  style="width: 5%;white-space:nowrap" >
                                                                             <fieldset style="padding: 5;background: #BDE9FF">
																				<table style="width: 100%; height: 100%"  >
																					<tr>
																						<td style="width: 10%; white-space: nowrap" align="right">
																							Credit Type
																						</td>
																						<td style="width: 15%">
																							<gw:list id="lstCreditType" text="" styles='width:100%' />
																						</td>
																						<td style="width: 10%; white-space: nowrap" align="right">
																							Exp.Date
																						</td>
																						<td style="width: 15%">
																							<gw:textbox id="txtExpDate" styles="text-align:left;width:100%;" />
																						</td>
																						<td style="width: 10%; white-space: nowrap" align="right">
																							Credit CCV
																						</td>
																						<td style="width: 15%">
																							<gw:textbox id="txtCCV" styles="text-align:left;width:100%;" />
																						</td>
																						
																					</tr>
																					<tr>
																						<td style="width: 10%" align="right">
																							Card No
																						</td>
																						<td style="width: 15%">
																							<gw:textbox id="txtCreditNo" styles="text-align:left;width:100%;" onenterkey="OnEnterEvent(this)" />
																						</td>
																						<td style="width: 10%; white-space: nowrap" align="right">
																							Credit Owner
																						</td>
																						<td style="width: 15%">
																							<gw:textbox id="txtCreditOwner" styles="width: 100%" />
																						</td>
																						<td style="width: 10%; white-space: nowrap" align="right">
																							Release Date
																						</td>
																						<td style="width: 15%">
																							<gw:datebox id="dtReleaseDate" lang="1" styles="width:100%" csstype="mandatory" nullaccept="T" />
																						</td>
																					</tr>
																				</table>
																			</fieldset>
                                                                        </td>
																		
                                                                    </tr>
																	<tr>
                                                                        <td  align="right"  style="width: 5%;white-space:nowrap" >
                                                                             <fieldset style="padding: 5">
																				<table style="width: 100%; height: 100%;background: #F7F5AF" >
																					<tr>
																						<td style="width: 5%; white-space: nowrap" align="right">
																							Total AMT
																						</td>
																						<td style="width: 10%">
																							<gw:textbox id="txtTotalAmt"  width="50%" />
																						</td>
																						<td style="width: 5%; white-space: nowrap" align="right">
																							Deposit AMT
																						</td>
																						<td style="width: 10%">
																							<gw:textbox id="txtDepositAmt" width="50%" />
																						</td>
																						<td style="width: 5%; white-space: nowrap" align="right">
																							Total Room
																						</td>
																						<td style="width: 10%">
																							<gw:textbox id="txtQuantityRoom" width="50%" />
																						</td>
																						<td style="width: 5%; white-space: nowrap" align="right">
																							Adults
																						</td>
																						<td style="width: 10%">
																							<gw:textbox id="txtAdult" width="50%" />
																						</td>
																						<td style="width: 5%; white-space: nowrap" align="right">
																							Childs
																						</td>
																						<td style="width: 10%">
																							<gw:textbox id="txtChild" width="50%" />
																						</td>
																						<td style="width: 5%">
																							<gw:icon id="btnSpecialSVC" text="Sevices" onclick="OnSpecialSVC()" styles="width: 100%" />
																						</td>
																						<td style="width: 1%">
																							<gw:imgbtn img="new" alt="New" id="btnAddNewDTL" onclick="OnNew(2)" />
																						</td>
																						<td style="width: 1%">
																							<gw:imgbtn img="delete" alt="Delete" id="btnDeleteDTL" onclick="OnDelete(2)" />
																						</td>
																					</tr>
																				</table>
																			</fieldset>
                                                                        </td>
																		
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" style="padding-top:2px">
                                                    <gw:grid id="grdDTL" 
													header="_PK|_tht_booking_pk|Folio#|_Guest_PK|*Guest Name|*Room type|_tht_room_pk|*Room|*From Date|*To Date|*Adult|Child|*Rate Plan|Amount|Deposit Amount|Status|Description"
													format="0|0|0|0|0|0|0|0|4|4|-0|-0|0|-0|-0|2|0" 
													aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
													defaults="||||||||||||||||"
													editcol="1|1|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
													styles="width:100%;height:100%"  autosize='T' 
													oncelldblclick="PopupRoomNumber(this)
													"
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
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="txtMasterPK" styles="display: none" />
<gw:textbox id="txtCompany_pk" styles="display: none" />
<gw:textbox id="txtCustomer_pk" styles="display: none" />
<!--------------------------------------------------------------------------------------->
</html>
