<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Advance Room Fee</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 var G_PK=0,
 G_THT_ROOM_ALLOCATE_PK=1,
 G_THT_BOOKINGD_PK=2, //Folio#
 G_ROOM=3,
 G_GUEST_NAME=4,
 G_CHECK_IN=5,
 G_CHECK_OUT=6,
 G_PAY_FROM=7,
 G_PAY_TO=8,
 G_TOTAL_NIGHT=9,
 G_DAILY_RATE=10,
 G_TOTAL_AMOUNT=11,
 G_CASH_VND=12,
 G_CASH_USD=13,
 G_CREDIT_VND=14,
 G_CREDIT_USD=15,
 G_BANK_TRANS=16,
 G_EX_RATE=17,
 G_PAYED_DATE = 18,
 G_PAY_METHOD=19,
 G_DESCRIPTION=20;
 function BodyInit()
 {
    var data = "<%=CtlLib.SetGridColumnDataSQL("SELECT code,NAME FROM tco_commcode WHERE DEL_IF=0 and parent_code='PTYPE' and use_yn='Y'")%>";
	grdAdvRoomFee.SetComboFormat(G_PAY_METHOD, data);
	//OnSearch();
 }

 function OnAddNew()
 {
			var path = System.RootURL + '/standard/forms/ho/25/60250310_popup.aspx';
			var object = System.OpenModal( path ,1000, 550 , 'resizable:yes;status:yes');
			if ( object != null )
			{

				var arrTemp
				for( var i=0; i < object.length; i++) 
				{ 
					arrTemp = object[i]; 
					
					grdAdvRoomFee.AddRow();
					grdAdvRoomFee.SetGridText( grdAdvRoomFee.rows-1, G_THT_ROOM_ALLOCATE_PK,arrTemp[0]);//tht_room_allocate_pk
					grdAdvRoomFee.SetGridText( grdAdvRoomFee.rows-1, G_THT_BOOKINGD_PK, arrTemp[1]);//Folio
					grdAdvRoomFee.SetGridText( grdAdvRoomFee.rows-1, G_ROOM, arrTemp[2]);//Room No 
					grdAdvRoomFee.SetGridText( grdAdvRoomFee.rows-1, G_GUEST_NAME, arrTemp[3]);//Guest Name
					grdAdvRoomFee.SetGridText( grdAdvRoomFee.rows-1, G_CHECK_IN, arrTemp[4]);//CheckIn Date
					grdAdvRoomFee.SetGridText( grdAdvRoomFee.rows-1, G_CHECK_OUT, arrTemp[5]);//CheckIn Date
					grdAdvRoomFee.SetGridText( grdAdvRoomFee.rows-1, G_DAILY_RATE, arrTemp[6]);//CheckIn Date
						
					grdAdvRoomFee.SetGridText( grdAdvRoomFee.rows-1, G_DESCRIPTION, "Advanced payments room amount");//CheckIn Date
				}	
			}/**/	
		
 }
function CheckValidate()
{
	for( var i=1; i <grdAdvRoomFee.rows; i++) 
	{
		
		if(grdAdvRoomFee.GetGridData( i, G_PAY_FROM )==""){
			alert("Please ! Input Payment from date to save !!!");
			return false;
		}
		if(grdAdvRoomFee.GetGridData( i, G_PAY_TO )==""){
			alert("Please ! Input Payment to date to save !!!");
			return false;
		}
		
		if(grdAdvRoomFee.GetGridData( i, G_PAY_METHOD )==""){
			alert("Please ! Choose payment method to save !!!");
			return false;
		}
		if(grdAdvRoomFee.GetGridData( i, G_PAYED_DATE )==""){
			alert("Please ! Input Payed date to save !!!");
			return false;
		}
		return true;
	}
}
function OnSave()
{
	if(CheckValidate())
	{ 
		data_60250310.Call();
	}

}
function OnSearch()
{
	data_60250310.Call('SELECT');

}
function OnDelete()
{ 
	if( confirm('Do you want to delete this row?'))
	{ 
		grdAdvRoomFee.DeleteRow();
		data_60250310.Call();
	}
	else
	{
		
	}
}

function OnDataReceive(obj)
{
		
}
function ChangeDate()
{
    if((grdAdvRoomFee.GetGridData(grdAdvRoomFee.row, G_PAY_TO )) =="" || (grdAdvRoomFee.GetGridData(grdAdvRoomFee.row, G_PAY_FROM ))=="") 
    {
       grdAdvRoomFee.SetGridText( grdAdvRoomFee.row, G_TOTAL_NIGHT,'0');
	}
	else
	{
	    if(Number(grdAdvRoomFee.GetGridData(grdAdvRoomFee.row, G_PAY_TO )) >= Number(grdAdvRoomFee.GetGridData(grdAdvRoomFee.row, G_PAY_FROM ))) 
        {
            var dtfrom = new Date(); var dtto = new Date();var one_day=1000*60*60*24;var tt_day,total_amount;
			dtfrom.setFullYear(Number((grdAdvRoomFee.GetGridData(grdAdvRoomFee.row, G_PAY_FROM )).substring(0,4)),Number((grdAdvRoomFee.GetGridData(grdAdvRoomFee.row, G_PAY_FROM )).substring(4,6))-1,Number((grdAdvRoomFee.GetGridData(grdAdvRoomFee.row, G_PAY_FROM )).substring(6,8)));
			dtto.setFullYear(Number((grdAdvRoomFee.GetGridData(grdAdvRoomFee.row, G_PAY_TO )).substring(0,4)),Number((grdAdvRoomFee.GetGridData(grdAdvRoomFee.row, G_PAY_TO )).substring(4,6))-1,Number((grdAdvRoomFee.GetGridData(grdAdvRoomFee.row, G_PAY_TO )).substring(6,8)));
			tt_day = ((dtto-dtfrom)/one_day)+1;
			total_amount=tt_day*Number(grdAdvRoomFee.GetGridData(grdAdvRoomFee.row, G_DAILY_RATE ));
			
			grdAdvRoomFee.SetGridText( grdAdvRoomFee.row, G_TOTAL_NIGHT,tt_day);
			grdAdvRoomFee.SetGridText( grdAdvRoomFee.row, G_TOTAL_AMOUNT,total_amount);
			
        }
        else if(Number(grdAdvRoomFee.GetGridData(grdAdvRoomFee.row, G_PAY_TO )) < Number(grdAdvRoomFee.GetGridData(grdAdvRoomFee.row, G_PAY_FROM ))) 
        {
	        alert('Please, input date to greater than or equal date from.');
	        return;
        }
	}	
}

</script>

<body>
<!------------------------------------------------------------------>
<gw:data id="data_60250310" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20" function="ht_sel_60250310" procedure="ht_upd_60250310" > 
			<input> 
				<input bind="dtFrom" />
				<input bind="dtTo" /> 
				<input bind="txtRoomNo" /> 
			</input> 
			<output bind="grdAdvRoomFee" /> 
		</dso> 
	</xml> 
</gw:data>
    
    <table style="width: 100%; height: 100%" border="0">
		<tr style="height: 5%">
						<td style="width:7%">Date</td>
                        <td style="width: 10%" align="left">
							<gw:datebox id="dtFrom" lang="1" onchange="OnSearch()" />
                            ~<gw:datebox id="dtTo" lang="1" onchange="OnSearch()" />
                        </td>
                        <td align="right" style="width: 23%; white-space: nowrap">Room No/Guest Name</td>
                        <td style="width: 30%; white-space: nowrap">
                            <gw:textbox id="txtRoomNo" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
						<td style="width: 7%; white-space: nowrap" align="left">
                            <gw:imgbtn id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
						<td style="width: 1%" align="right">
						<gw:imgbtn img="new" alt="Add New" id="btnAddNew1" onclick="OnAddNew()" />
						</td>
						<td style="width: 1%" align="right">
							<gw:imgbtn img="delete" alt="Delete" id="btnDelete1" onclick="OnDelete()" />
						</td>
						<td style="width: 1%" align="right">
							<gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave()" />
						</td>
						<td></td>
	
        <tr style="height: 95%">
			<td colspan="9">
				<gw:grid id='grdAdvRoomFee' header='_PK|_tht_ROOM_ALLOCATE|Folio#|Room#|Guest Name|Check In|CheckOut|Pay From|Pay To|Total Night|Daily Rate|Total Amount|Cash VND|Cash USD|Credit VND|Credit USD|Bank Transfer|_Ex_Rate|Payed Date|Pay Method|Description'
						format='0|0|0|0|0|4|4|4|4|-0|-0|-0|-0|-2|-0|-2|-0|-0|4|0|0' 
						aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
						editcol='0|0|0|0|0|0|0|1|1|0|0|0|1|1|1|1|1|1|1|0|1'
						widths='800|800|800|800|1000|1000|1000|1000|1200|1200|1200|1000|800|800|1000|1000|1000|1000|1000|1000|1000'
						sorting='T' styles='width:100%; height:100%' autosize="T" onafteredit="ChangeDate()"  />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
	<gw:textbox id="tht_room_allocate2_pk" text="" style="display: none" />

</body>
</html>
