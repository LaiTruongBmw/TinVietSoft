<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head id="Head1" runat="server">
    <title>Check Out</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var COL_PK			    = 0,
	COL_SELECT		    = 1,
	COL_ROOM_NO		    = 2,
	COL_DESCRIPTION	    = 3,//group name
	COL_FROM_DATE	    = 4,
	COL_TO_DATE	        = 5,
	COL_TOTAL_DUE		= 6,
	COL_DAILY_RATE      = 7,
	COL_TT_DAYS         = 8,
	COL_ROOM_CHARGE	    = 9,
	COL_GUEST_NAME	    = 10,
	COL_INVOICE_NO      = 11,
	COL_PAY_METHOD	    = 12,
	COL_T_A_COMPANY     = 13,
	COL_CASH_VND	    = 14,
	COL_CASH_USD	    = 15,
	COL_REMAIN_VND      = 16,
	COL_REMAIN_USD      = 17,
	COL_GUEST_RTN_VND   = 18,
	COL_GUEST_RTN_USD   = 19,
	COL_PRINTED_YN    = 20,
	COL_THT_ROOM_PK	    = 21,
	COL_DISCOUNT	    = 22,
	COL_DEPOSIT			= 23,
	COL_FEE_MINIBAR		= 24,
	COL_FEE_LAUNDRY		= 25,
	COL_FEE_FNB			= 26,
	COL_FEE_OTHER		= 27,
	COL_FEE_TOTAL		= 28,
	COL_COMP_PK			= 29,
	COL_COMP_NAME		= 30,
	COL_COMP_TAXCODE	= 31,
	COL_COMP_ADDRESS	= 32,
	COL_CREDIT_TYPE		= 33,
	COL_GOLF_FEES		= 34,
	COL_TOTAL_DUE_2		= 35,
	COL_RATE_NAME      	= 36,//rate plan
	COL_NATION		    = 37,
	COL_GENDER		    = 38,
	
    COL2_NO             = 0,
    COL2_PK             = 1,
    COL2_ROOM_NO        = 2,
    COL2_NAME           = 3,
    COL2_LOCATION       = 4,
    COL2_INVOICE_ID     = 5,
    COL2_DATE           = 6,
    COL2_AMT            = 7,
    COL2_POINT          = 8,
    COL2_BASIC_AMT      = 9,
    COL2_SERVICE_AMT    = 10,
    COL2_VAT_AMT        = 11,
    COL2_AMT_USD        = 12,
    COL2_DISCOUNT       = 13;
    
function BodyInit()
{
    //grdMST.GetGridControl().FrozenCols=12;
	var cutoff_date="<%=Session("CUTOFF_DATE")%>";
	var d =  new Date();
	var dd = d.getDate();
	cutoff_date = cutoff_date.substring(0,2);
	
	if(cutoff_date < dd){
		alert("You have not cutoff date. Maybe you will lose room fee.");
	}

	BindingDataList();
	OnSearch(1);
	COMP_PK.text = "<%=Session("COMPANY_PK") %>";
	txtExRate.text = "<%=CtlLib.SetDataSQL("SELECT sf_get_current_sell_ex_rate("+Session("COMPANY_PK")+",'USD') from dual")%> VND";
	EMPLOYEE_PK.text = "<%=Session("EMPLOYEE_PK") %>";
	var data = "<%=CtlLib.SetGridColumnDataSQL("SELECT code,NAME FROM tco_commcode WHERE DEL_IF=0 and  parent_code='PTYPE' and use_yn='Y'")%>";
    grdMST.SetComboFormat(COL_PAY_METHOD, data);
	
	data = "<%=CtlLib.SetListDataSQL("SELECT A.* FROM (SELECT CODE, NAME FROM tco_commcode WHERE PARENT_CODE = 'FOLIO' and del_if=0 UNION SELECT '','SELECT ALL' FROM DUAL ) A ORDER BY CODE ")%>";
	lstFolioType.SetDataText(data);
	lstFolioType.value='';
	
	var fg=grdMST.GetGridControl(); 
    fg.FrozenCols = 7;
}

function BindingDataList()
{
	var data = '';
	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='GEN'")%>";
	grdMST.SetComboFormat(COL_GENDER, data);

	data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='NAT'")%>";
	grdMST.SetComboFormat(COL_NATION, data);
	
	data = "<%=CtlLib.SetListDataSQL("SELECT A.* FROM (SELECT CODE, NAME FROM tco_commcode WHERE PARENT_CODE = 'POINT' and del_if=0 UNION SELECT '','SELECT ALL' FROM DUAL) A ORDER BY CODE DESC")%>";
	lstLocation.SetDataText(data);
}

function OnSearch(n)
{
	switch(n)
	{
		case 1:
			dso_htfo00040.Call('SELECT');
			txtCustomer.text    = "";
			txtTaxcode.text     = "";
			txtAddress.text     = "";
			grdSRV.ClearData();
		break;
		case 2:
		    if(grdMST.row >0){
		        var arr_pk = "";
		        if(grdMST.GetGridData(event.row, COL_PK)!= ''){
		                arr_pk = arr_pk + grdMST.GetGridData(event.row, COL_PK) + ',';
		        }
		        for (i = 1; i < grdMST.rows; i++)
		            grdMST.SetGridText(i, COL_SELECT, "0");
		            
		        grdMST.SetGridText(event.row, COL_SELECT,(arr_pk.length>1)?"-1":"0");
		        
		        txtCustomer.text = grdMST.GetGridData(event.row, COL_GUEST_NAME);

		        var iLen = String(arr_pk).length;
		        if(iLen > 0)
		            arr_pk = String(arr_pk).substring(0, iLen - 1);
		        else{txtCustomer.text = ""; txtTaxcode.text = ""; txtAddress.text = ""; }
		        
                TABLE_PK.text = arr_pk;
				txtDiposit.text = grdMST.GetGridData(event.row, COL_DEPOSIT);
				
				OnBindDetail();
				lstLocation.value = '';
			    dso_htfo00040_srv.Call('SELECT');
		    }else if(event.col == 8){
		        //0 ~ 11
                var dtfrom = new Date(); var dtto = new Date();var one_day=1000*60*60*24;var tt_day;
                dtfrom.setFullYear(Number(grdMST.GetGridData(event.row,COL_FROM_DATE).substring(0,4)),Number(grdMST.GetGridData(event.row,COL_FROM_DATE).substring(4,6))-1,Number(grdMST.GetGridData(event.row,COL_FROM_DATE).substring(6,8)));
                dtto.setFullYear(Number(grdMST.GetGridData(event.row,COL_TO_DATE).substring(0,4)),Number(grdMST.GetGridData(event.row,COL_TO_DATE).substring(4,6))-1,Number(grdMST.GetGridData(event.row,COL_TO_DATE).substring(6,8)));
                tt_day = ((dtto-dtfrom)/one_day);
                if(tt_day < 0){alert("To date more than From date!");return;}
                tt_day++;
                
                grdMST.SetGridText(event.row, COL_TT_DAYS, tt_day);
                grdMST.SetGridText(event.row, COL_ROOM_CHARGE, tt_day*Number(grdMST.GetGridData(event.row, COL_DAILY_RATE)));
                
                dso_htfo00040_srv.Call('SELECT');
		    }
		    else return false;
		break;
		case 3:
		    var path = System.RootURL + '/standard/forms/ho/25/htfo00041.aspx?pk=' + grdSRV.GetGridData(grdSRV.row, 1) + '&sn=' + grdSRV.GetGridData(grdSRV.row, 5)+ '&date=' + grdSRV.GetGridData(grdSRV.row, 6).substring(6,8) + '/' + grdSRV.GetGridData(grdSRV.row, 6).substring(4,6)+ '/' + grdSRV.GetGridData(grdSRV.row, 6).substring(0,4)+ '&room=' + grdSRV.GetGridData(grdSRV.row, 2);
            var obj = System.OpenModal( path ,550 , 500,  'resizable:yes;status:yes');
		break;
		case 4:
		    var path = System.RootURL, obj, flag = false;
		    switch(lstLocation.value){
		        default:
		            path += '/form/ht/fo/htfo00260.aspx?point=' + lstLocation.value; flag = true;
		        break;
				case "POINT-14":
					path += '/form/ht/fo/htfo00280.aspx'; flag = true;
				break;
				case "POINT-12":
					path += '/form/ht/fo/htfo00070.aspx'; flag = true;
				break;
		    }
		    if(flag){
		        obj = System.OpenModal( path ,900 , 800,  'resizable:yes;status:yes');
		       //IsPostBack();
		    }
		break;
		case 5:
		break;
		case 6:
		    var path = System.RootURL + '/standard/forms/ho/25/60250020_correct.aspx';
            var obj = System.OpenModal( path ,900 , 800,  'resizable:yes;status:yes');
			dso_htfo00040_srv.Call("SELECT");
            //IsPostBack();
		break;
	}
}
function LisOnChange(){
	dso_htfo00040_srv.Call('SELECT');
}
function OnPreview(){
    
    if(grdMST.row <=0 ){alert("Please select a customer to preview!");return;}

    txtCustomer.text = Trim(txtCustomer.text);
    DATE_TO.text = grdMST.GetGridData(grdMST.row ,COL_TO_DATE);
    var url = '/standard/reports/ho/25/rpt_60250020_Guest_Invoice.aspx?p_tht_room_allocate_pk='+grdMST.GetGridData(grdMST.row,COL_PK)+'&p_cashier_pk='+EMPLOYEE_PK.text+'&p_printed_yn='+'N'+'&p_paymethod='+grdMST.GetGridData(grdMST.row,COL_PAY_METHOD)+'&p_folio_type='+lstFolioType.value; 
	System.OpenTargetPage( System.RootURL+url , "newform" );
}

function OnPrint(){
    if(grdMST.row <=0 ){alert("Please select a customer to print bill!");return;}
    if(CheckDateIsValid()){
		if(grdMST.GetGridData(grdMST.row ,COL_PAY_METHOD) == ''){alert("Please choose payment method!");return false;}
        var url = '/reports/ht/fo/htfo00040.aspx?p1=' + TABLE_PK.GetData() +"&p2="+EMPLOYEE_PK.text + "&p3=Y&p4=" + grdMST.GetGridData(grdMST.row ,COL_PAY_METHOD);
		System.OpenTargetPage( System.RootURL+url , "newform" );
		OnSearch(1);
    }
}
function OnPrintInvoice(){
    if(grdMST.row <=0 ){alert("Please select a customer to print bill!");return;}
    if(CheckDateIsValid()){
        
		if(grdMST.GetGridData(grdMST.row,COL_PAY_METHOD) == ''){alert("Please choose payment method!");return false;}
		var url = '/standard/reports/ho/25/rpt_60250020_Guest_Invoice.aspx?p_tht_room_allocate_pk='+grdMST.GetGridData(grdMST.row,COL_PK)+'&p_cashier_pk='+EMPLOYEE_PK.text+'&p_printed_yn='+'Y'+'&p_paymethod='+grdMST.GetGridData(grdMST.row,COL_PAY_METHOD)+'&p_folio_type='+lstFolioType.value; 
        System.OpenTargetPage( System.RootURL+url , "newform" );
		OnSearch(1);
    }
}

function OnUnPrint(){
    if(grdMST.row <=0){
		alert("Please select a customer to set unprint!");
		return false;
	}
    
    if(grdMST.GetGridData(grdMST.row, COL_PRINTED_YN) == 'N'){
		alert('Customer ' + grdMST.GetGridData(grdMST.row, COL_GUEST_NAME) + ' was not printed!'); 
		return false;
	}
    grdMST.SetGridText(grdMST.row, COL_SELECT,-1);
	
    dso_htfo00040_unprint.Call();
}

function OnChangeDate(){
    if(CheckDateIsValid())
        dso_jarc00040_date_to.Call();
}

function CheckDateIsValid(){
      return true;
}

function OnCheckOut()
{
    if(grdMST.row > 0)
	{
		
		var path = System.RootURL + '/standard/forms/ho/25/60250020_CheckOut.aspx?p_room_allocate_pk=' +grdMST.GetGridData(grdMST.row, COL_PK);
		var object = System.OpenModal( path , 850 , 410 ,  'resizable:yes;status:yes',window);
		
		dso_htfo00040.Call("SELECT");
	}
	else
	{
		alert("Please select a customer to check out.");
	}
		
}
function OnOtherFees()
{
    
    if(grdMST.row <=0){
		alert("Please select a customer to add other fees!");
		return false;
	}
	
    if(grdMST.GetGridData(grdMST.row, COL_PRINTED_YN) == "Y"){
		alert("Customer " + grdMST.GetGridData(grdMST.row, COL_GUEST_NAME) + " already print bill can not add other fees!");
		return false;
	}

        var path = System.RootURL + "/standard/forms/ho/25/60250020_popup_other_fee.aspx?encode_yn=Y&p_master_pk="+grdMST.GetGridData(grdMST.row, COL_PK)+"&p_golfer_name="+url_encode(grdMST.GetGridData(grdMST.row, COL_GUEST_NAME))+"&p_room_no="+url_encode(grdMST.GetGridData(grdMST.row, COL_ROOM_NO))+"";
        var object = System.OpenModal( path , 1000 , 400 ,  'resizable:yes;status:yes',window);
		
        dso_htfo00040_srv.Call('SELECT');

}

function CheckDataIsValid(){
  if(grdMST.row <= 0 ) return true;
  
   if(grdMST.GetGridData(grdMST.row,COL_PAY_METHOD) == ""){
		alert("Please select payment method for customer who has room# is '"+ grdMST.GetGridData(grdMST.row,COL_ROOM_NO)+"'.");
		return false;
	}
	return true;
}
function SetBGColor(){
	for(var i=1;i<grdMST.rows;i++){
		if(grdMST.GetGridData(i, COL_PRINTED_YN) == "Y"){
			grdMST.SetCellBgColor(i,0,i,grdMST.cols-1,0xabcdef);
		}
	}
}
function OnBindDetail(){
if(grdMST.row <=0) return;
	var 		l_total_VND     = 0, 
				l_total_DUE     = 0, 
                l_Discount_VND  = 0,
                l_Room_VND      = 0,
                l_Minibar_VND   = 0,
                l_Laundry_VND   = 0,
                l_FNB_VND       = 0,
                l_Bar_VND       = 0,
                l_Telephone_VND = 0,
                l_Karaoke_VND   = 0,
                l_Massage_VND   = 0,
                l_Spa_VND       = 0,
                l_Other_VND     = 0,
                l_Rate          = 0,
				l_Daily			= 0,
l_Golf_Fees_VND=0
                ;
            
            l_Rate = Number(String(txtExRate.GetData()).substring(0, txtExRate.GetData().length - 4));
            
                    l_Discount_VND  += Number(grdMST.GetGridData(grdMST.row, COL_DISCOUNT));
					l_total_VND		+= Number(grdMST.GetGridData(grdMST.row, COL_FEE_TOTAL));
					l_total_DUE		+= Number(grdMST.GetGridData(grdMST.row, COL_TOTAL_DUE));
					l_Room_VND      += Number(grdMST.GetGridData(grdMST.row, COL_ROOM_CHARGE));
					l_Minibar_VND	+= Number(grdMST.GetGridData(grdMST.row, COL_FEE_MINIBAR));
					l_Laundry_VND	+= Number(grdMST.GetGridData(grdMST.row, COL_FEE_LAUNDRY));
					l_FNB_VND		+= Number(grdMST.GetGridData(grdMST.row, COL_FEE_FNB));
					l_Other_VND		+= Number(grdMST.GetGridData(grdMST.row, COL_FEE_OTHER));
                    l_Golf_Fees_VND		+= Number(grdMST.GetGridData(grdMST.row, COL_GOLF_FEES)); 
            
			//5%
			txtAmountDueSVC.text  	= Math.round((l_total_VND/1.155)	*	0.05); 
			txtTotalSVC.text      	= Math.round((l_total_VND/1.155)	*	0.05); 
			txtRoomFeeSVC.text    	= Math.round((l_Room_VND/1.155)		*	0.05);
			txtMinibarFeeSVC.text   = Math.round((l_Minibar_VND/1.155)	*	0.05);
			txtLaundryFeeSVC.text   = Math.round((l_Laundry_VND/1.155)	*	0.05);
			txtFNBFeeSVC.text   	= Math.round((l_FNB_VND/1.155)		*	0.05);
			txtOtherFeeSVC.text   	= Math.round((l_Other_VND/1.155)	*	0.05);
			
			//10%
			txtAmountDueVAT.text    = Math.round(((l_total_VND/1.155)	+	Number(txtTotalSVC.text))		*	0.1);
			txtTotalVAT.text      	= Math.round(((l_total_VND/1.155)	+	Number(txtTotalSVC.text))		*	0.1);
			txtRoomFeeVAT.text      = Math.round(((l_Room_VND/1.155)	+	Number(txtRoomFeeSVC.text))		*	0.1);
			txtMinibarFeeVAT.text   = Math.round(((l_Minibar_VND/1.155)	+	Number(txtMinibarFeeSVC.text))	*	0.1);
			txtLaundryFeeVAT.text   = Math.round(((l_Laundry_VND/1.155)	+	Number(txtLaundryFeeSVC.text))	*	0.1);
			txtFNBFeeVAT.text   	= Math.round(((l_FNB_VND/1.155)		+	Number(txtFNBFeeSVC.text))		*	0.1);
			txtOtherFeeVAT.text   	= Math.round(((l_Other_VND/1.155)	+	Number(txtOtherFeeSVC.text))	*	0.1);
				
			//VND
			txtAmountDueVND.text    = l_total_DUE;
			txtDiscountVND.text		= l_Discount_VND;
			txtTotalVND.text      	= Math.round(l_total_VND);
			txtRoomFeeVND.text      = Math.round(l_Room_VND		);
			txtMinibarFeeVND.text   = Math.round(l_Minibar_VND	);
			txtLaundryFeeVND.text   = Math.round(l_Laundry_VND	);
			txtFNBFeeVND.text   	= Math.round(l_FNB_VND		);
			txtOtherFeeVND.text   	= Math.round(l_Other_VND	);
			txtGolfFeeVND.text   	= Math.round(l_Golf_Fees_VND);
			
			//USD
			txtAmountDueUSD.text    = Math.round(Number(txtAmountDueVND.text)	/l_Rate*100)/100;
			txtDiscountUSD.text    	= Math.round(Number(txtDiscountVND.text)	/l_Rate*100)/100;
			txtTotalUSD.text      	= Math.round(Number(txtTotalVND.text)		/l_Rate*100)/100;
			txtRoomFeeUSD.text      = Math.round(Number(txtRoomFeeVND.text)		/l_Rate*100)/100;
			txtMinibarFeeUSD.text   = Math.round(Number(txtMinibarFeeVND.text)	/l_Rate*100)/100;
			txtLaundryFeeUSD.text   = Math.round(Number(txtLaundryFeeVND.text)	/l_Rate*100)/100;
			txtFNBFeeUSD.text   	= Math.round(Number(txtFNBFeeVND.text)		/l_Rate*100)/100;
			txtOtherFeeUSD.text   	= Math.round(Number(txtOtherFeeVND.text)	/l_Rate*100)/100;
                   txtGolfFeeUSD.text   	= Math.round(Number(txtGolfFeeVND.text)	/l_Rate*100)/100;
}
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "dso_htfo00040_srv":
			if (grdSRV.rows > 1)	
				grdSRV.Subtotal( 1, 2, -1, '7');
        break;
        case "dso_htfo00040_upd":
            OnSearch(1);
            alert("Check out finish");
        break;
        case "dso_htfo00040_upd_invifo":
            var url = System.RootURL + "/system/ReportEngine.aspx?encode_yn=Y&export_pdf=Y&file=ht/fo/htfo00040.rpt&procedure=CRM.sp_rpt_htfo00040|CRM.sp_rpt_htfo00040_dt&parameter=" + TABLE_PK.GetData() + "|" + TABLE_PK.GetData();
            System.OpenTargetPage(url); 
            window.close();
            //SetBGColor();
            OnSearch(1)
        break;
        case "dso_htfo00040_checkout":
        case "dso_htfo00040_unprint":
        case "dso_jarc00040_date_to":
        case "dso_htfo00040":
            SetBGColor();
			lblTotalRoom.text = grdMST.rows - 1;
        break;
    }
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
function OnMove()
{
	
	if(grdMST.row > 0)
	{
   	   var path = System.RootURL + '/standard/forms/ho/25/60250020_Move_Popup.aspx?p_room_allocate_pk='+ grdMST.GetGridData(grdMST.row, COL_PK);
	   var object = System.OpenModal( path ,1000, 550 ,  'resizable:yes;status:yes',window);

	}
	else
	{
		alert("You must check room to Move bill.");
	}
}
function OnMoveBill()//move bill from room to room
{
	if(grdMST.row > 0)
	{
		var path = System.RootURL + '/standard/forms/ho/25/60250020_Move_Bill_Popup.aspx?p_room_allocate_pk='+grdMST.GetGridData(grdMST.row, COL_PK)+'&p_room_no='+grdMST.GetGridData(grdMST.row, COL_ROOM_NO);
		var object = System.OpenModal( path ,1000, 650 ,  'resizable:yes;status:yes',window);

	}
	else
	{
		alert("You must check room to Move bill.");
	}
		
}

function OnChangeRoom()
{
	if(grdMST.col==COL_ROOM_NO)
	{
		var path = System.RootURL + "/standard/forms/ho/25/60250020_change_room_popup.aspx?encode_yn=Y&p_master_pk="+grdMST.GetGridData(grdMST.row, COL_PK)+"&p_room_no="+url_encode(grdMST.GetGridData(grdMST.row, COL_ROOM_NO))+"&p_from_date="+url_encode(grdMST.GetGridData(grdMST.row, COL_FROM_DATE))+"&p_to_date="+url_encode(grdMST.GetGridData(grdMST.row, COL_TO_DATE))+"";
		var object = System.OpenModal( path , 600 , 260 ,  'resizable:yes;status:yes',window); 
	}
}
function GetGuestName(){
		    if(grdMST.row !=-1)
		    {
		      var arr = new Array();
		      arr[0]=url_encode(grdMST.GetGridData(grdMST.row,COL_GUEST_NAME));//GUEST_NAMe
		      return arr;
		    }
}
function OnSendRoom()
{
	
	var path = System.RootURL + '/standard/forms/ho/25/60250020_Send_Room_Popup.aspx';
	  var object = System.OpenModal( path ,1000, 550 ,  'resizable:yes;status:yes',window);
		
}

</script>
<body style="margin: 0 0 0 0;">
<gw:data id="dso_htfo00040" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid" parameter="" function="ht_sel_60250020" >
			<input bind="grdMST">
                <input bind="txtSlipNo" />
				<input bind="txtSearch" />
				<input bind="dtDeparture" /> 
			</input> 
			<output bind="grdMST" /> 
		</dso> 
	</xml> 
</gw:data>
<gw:data id="dso_htfo00040_srv" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="grid" parameter="" function="ht_sel_60250020_srv">
			<input bind="grdSRV">
				<input bind="TABLE_PK" />
				<input bind="COMP_PK" />
				<input bind="lstLocation" />
			</input> 
			<output bind="grdSRV" /> 
		</dso> 
	</xml> 
</gw:data>


<gw:data id="dso_htfo00040_unprint" onreceive="OnDataReceive(this)"  > 
    <xml> 
        <dso type="grid" parameter="0,1" function="ht_sel_60250020" procedure="crm.ht_upd_60250020_unprint">
            <input>
                <input bind="txtSlipNo" />
				<input bind="txtSearch" />
				<input bind="dtDeparture" /> 
            </input>
            <output bind="grdMST" />
        </dso>
    </xml>
</gw:data>
<gw:data id="dso_jarc00040_date_to" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="2" type="grid" parameter="0,1,4" function="ht_sel_60250020" procedure="ht_upd_60250020_date_to">
            <input>
				<input bind="txtSlipNo" />
				<input bind="txtSearch" />
				<input bind="dtDeparture" /> 
            </input>
            <output bind="grdMST" />
        </dso>
    </xml>
</gw:data>
<table style="height: 100%; width: 100%; background: #BDE9FF" border="0">
	<tr style="width: 100%; height: 1%">
		<td style="width: 100%; background: white" valign="top" colspan="2">			
			<table style="width: 100%" border="0">
				<tr>
				    <td> 
						<table style="width: 100%" border="0">
						        <tr>
						            <td style="width: 8%" align="right" nowrap >Room : </td>
						            <td style="width: 15%" ><gw:textbox id="txtSlipNo" styles="width: 100%" onenterkey="OnSearch(1)" /></td>
						            <td style="width: 5%" align="right" nowrap >Name : </td>
						            <td style="width: 15%" ><gw:textbox id="txtSearch" styles="width: 100%" onenterkey="OnSearch(1)" /></td>
						            <td style="width: 10%" align="right" nowrap >Total Rooms : </td>
						            <td style="width: 7%"><gw:label id="lblTotalRoom" /></td>
									<td style="width: 10%" ><gw:icon id="btnNoRoomRate" text="No Room rate" onclick="OnNoRoomRate()"  styles="width: 100%;display:none"/></td>
						            <td style="width: 5%" ><gw:icon id="btnSearch" text="Search" onclick="OnSearch(1)"  styles="width: 100%"/></td>
						            <td style="width: 5%" ><gw:icon id="btnInvoice" text="Print Invoice" onclick="OnPrintInvoice()"  styles="width: 100%"/></td>
						            <td style="width: 5%" ><gw:icon id="btnOther" text="Other Fees" onclick="OnOtherFees()"  styles="width: 100%"/></td>
						            <td style="width: 5%" ><gw:icon id="btnCheckOut" text="Check Out" onclick="OnCheckOut()"  styles="width: 100%"/></td>	
						        </tr>
								<tr>
									<td style="width: 8%" align="right">Folio Type</td>
									<td style="width: 15%"><gw:list id="lstFolioType" onchange ="" /><gw:textbox id="txtCustomer" styles="width: 100%;display:none" /></td>
									<td style="width: 7%" align="right">Departure</td>
									<td style="width: 7%" ><gw:datebox id="dtDeparture" styles="width: 100%;" nullaccept="T" lang="1" onchange="OnSearch(1);" /></td>
									<td style="width: 10%"><gw:textbox id="txtTaxcode" styles="width: 100%; display:none" /></td>
									<td style="width: 10%" align="right"><gw:textbox id="txtAddress" styles="width: 100%; display:none" /></td>
									<td style="width: 10%"  align="right" >
										<gw:icon id="btnMoveBill" text="Move Bill" onclick="OnMoveBill()"  styles="width: 100%" />
									</td>
									<td style="width: 10%"><gw:icon id="btnSendRoom" text="Send Room" onclick="OnSendRoom()" /></td>
									<td style="width: 5%"><gw:icon id="btnCheckPreview" text="Preview" onclick="OnPreview()"  styles="width: 100%" /></td>
									<td style="width: 5%"><gw:icon id="btnUnPrint" text="Set UnPrint" onclick="OnUnPrint()"  styles="width: 100%" /></td>
									<td style="width: 5%"><gw:icon id="btnVirtualFolio" text="Virtual Folio" onclick="OnMove()"  styles="width: 100%" /></td>	
								</tr>
						</table>
				   </td>
				    
				</tr>
			</table>
		</td>
	</tr>
	<tr style="width: 100%; height: 30%; background: white">
		<td style="width: 100%" colspan="2">
			<gw:grid id="grdMST" 
			header  ="_PK|_Select|Room|Group Name|Arrival|Departure|Total Due|Daily Rate|Nights|Room Charge|Guest Name|Folio#|Payment Method|T/A COMPANY|_Cash VND|_Cash USD|_Remain VND|_Remain USD|_Guest Return VND|_Guest Return USD|_PrintedYN|_tht_room_pk|_Discount|_Diposit|Minibar|_Laundry|_FNB|_Other|_Total_Fee|_COM_PK|_COM_NAME|_COM_TAXCODE|_COM_ADDRESS|_CREDIT_TYPE|_Golf_Fees|_Total DUE|Rate Plans|Nation|Gender" 
			format  ="0|3|0|0|4|4|-0|-0|0|-0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|-0|-0|0|0|0" 
			aligns  ="0|0|0|0|0|3|0|3|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
			editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
			widths  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
			styles  ="width:100%;height:100%"
			autosize='T' oncelldblclick="OnChangeRoom()"
			debug   ='false' oncellclick="OnSearch(2);"/>
		</td>
	</tr>
	<tr style="width: 100%; height: 25%; background: white">
	    <td style="width: 35%;background-color:#33CCFF" valign="top">
	        <table style="height: 100%; width: 100%;border:0px;" cellspacing="1" cellpadding="1">
	            <tr style="height: 2%;" valign="top">
                    <td align="center" style="background-color:White;width:25%;" valign="middle">Ex. RATE : <gw:textbox id="txtExRate" styles="width: 70px;border:none;color:red;font-weight:bold;" readonly="true" /></td>
                    <td align="center" style="background-color:White;width:15%;" valign="middle">Amount(USD)</td>
                    <td align="center" style="background-color:White;width:15%;" valign="middle">Amount(VND)</td>
                    <td align="center" style="background-color:White;width:15%;display:none;" valign="middle">SVC(5%)</td>
                    <td align="center" style="background-color:White;width:15%;display:none;" valign="middle">VAT(10%)</td>
                </tr>
                <tr style="height: 2%;display:none;" valign="top">
                    <td style="background-color:Red;padding-left:5px;color:Black" valign="middle">Amount due</td>
                    <td style="background-color:White" valign="middle"><gw:textbox id="txtAmountDueUSD" styles="width:100%;border:0px;font-weight:bold;" type="number" format="###,###,###,###,###.##" /></td>
                    <td style="background-color:White" valign="middle"><gw:textbox id="txtAmountDueVND" styles="width:100%;border:0px;font-weight:bold;" type="number" format="###,###,###,###,###" /></td>
                    <td style="background-color:White'display:none;" valign="middle"><gw:textbox id="txtAmountDueSVC" styles="width:100%;border:0px;font-weight:bold;" type="number" format="###,###,###,###,###" /></td>
                    <td style="background-color:White;display:none;" valign="middle"><gw:textbox id="txtAmountDueVAT" styles="width:100%;border:0px;font-weight:bold;" type="number" format="###,###,###,###,###"  /></td>
                </tr>
                <tr style="height: 2%;display:none;" valign="top">
                    <td style="background-color:Yellow;padding-left:5px;color:Black" valign="middle">Discount</td>
                    <td style="background-color:White" valign="middle"><gw:textbox id="txtDiscountUSD" styles="width:100%;border:0px;font-weight:bold;" type="number" format="###,###,###,###,###.##" /></td>
                    <td style="background-color:White" valign="middle"><gw:textbox id="txtDiscountVND" styles="width:100%;border:0px;font-weight:bold;" type="number" format="###,###,###,###,###" /></td>
                    <td style="background-color:White;display:none;" valign="middle"><gw:textbox id="txtDiscountSVC" styles="width:100%;border:0px;font-weight:bold;" type="number" format="###,###,###,###,###" /></td>
                    <td style="background-color:White;display:none;" valign="middle"><gw:textbox id="txtDiscountVAT" styles="width:100%;border:0px;font-weight:bold;" type="number" format="###,###,###,###,###"  /></td>
                </tr>
                <tr style="height: 2%" valign="top">
                    <td style="background-color:White;padding-left:5px;color:Black" valign="middle">Total</td>
                    <td style="background-color:White" valign="middle"><gw:textbox id="txtTotalUSD" styles="width:100%;border:0px;font-weight:bold;" type="number" format="###,###,###,###,###.##" /></td>
                    <td style="background-color:White" valign="middle"><gw:textbox id="txtTotalVND" styles="width:100%;border:0px;font-weight:bold;" type="number" format="###,###,###,###,###" /></td>
                    <td style="background-color:White;display:none;" valign="middle"><gw:textbox id="txtTotalSVC" styles="width:100%;border:0px;font-weight:bold;" type="number" format="###,###,###,###,###" /></td>
                    <td style="background-color:White;display:none;" valign="middle"><gw:textbox id="txtTotalVAT" styles="width:100%;border:0px;font-weight:bold;" type="number" format="###,###,###,###,###"  /></td>
                </tr>
                <tr style="height: 2%;" valign="top">
                    <td style="background-color:White;padding-left:5px;" valign="middle">Room Fee</td>
                    <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtRoomFeeUSD" styles="width:100%;border:0px;" type="number" format="###,###,###,###.##"  /></td>
                    <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtRoomFeeVND" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                    <td align="right" style="background-color:White;display:none;" valign="middle"><gw:textbox id="txtRoomFeeSVC" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                    <td align="right" style="background-color:White;display:none;" valign="middle"><gw:textbox id="txtRoomFeeVAT" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                </tr>
                <tr style="height: 2%;" valign="top">
                    <td style="background-color:White;padding-left:5px;" valign="middle">Minibar Fee</td>
                    <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtMinibarFeeUSD" styles="width:100%;border:0px;" type="number" format="###,###,###,###.##"  /></td>
                    <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtMinibarFeeVND" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                    <td align="right" style="background-color:White;display:none;" valign="middle"><gw:textbox id="txtMinibarFeeSVC" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                    <td align="right" style="background-color:White;display:none;" valign="middle"><gw:textbox id="txtMinibarFeeVAT" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                </tr>
                <tr style="height: 2%;" valign="top">
                    <td style="background-color:White;padding-left:5px;" valign="middle">Laundry Fee</td>
                    <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtLaundryFeeUSD" styles="width:100%;border:0px;" type="number" format="###,###,###,###.##"  /></td>
                    <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtLaundryFeeVND" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                    <td align="right" style="background-color:White;display:none;" valign="middle"><gw:textbox id="txtLaundryFeeSVC" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                    <td align="right" style="background-color:White;display:none;" valign="middle"><gw:textbox id="txtLaundryFeeVAT" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                </tr>
                <tr style="height: 2%;" valign="top">
                    <td style="background-color:White;padding-left:5px;" valign="middle">F&B Fee</td>
                    <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtFNBFeeUSD" styles="width:100%;border:0px;" type="number" format="###,###,###,###.##"  /></td>
                    <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtFNBFeeVND" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                    <td align="right" style="background-color:White;display:none;" valign="middle"><gw:textbox id="txtFNBFeeSVC" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                    <td align="right" style="background-color:White;display:none;" valign="middle"><gw:textbox id="txtFNBFeeVAT" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                </tr>
                <tr style="height: 2%;" valign="top">
                    <td style="background-color:White;padding-left:5px;" valign="middle">Other Fee</td>
                    <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtOtherFeeUSD" styles="width:100%;border:0px;" type="number" format="###,###,###,###.##"  /></td>
                    <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtOtherFeeVND" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                    <td align="right" style="background-color:White;display:none;" valign="middle"><gw:textbox id="txtOtherFeeSVC" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                    <td align="right" style="background-color:White;display:none;" valign="middle"><gw:textbox id="txtOtherFeeVAT" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                </tr>
		<tr style="height: 2%;" valign="top">
                    <td style="background-color:White;padding-left:5px;" valign="middle">Special Fee</td>
                    <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtGolfFeeUSD" styles="width:100%;border:0px;" type="number" format="###,###,###,###.##"  /></td>
                    <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtGolfFeeVND" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                    <td align="right" style="background-color:White;display:none;" valign="middle"><gw:textbox id="txtGolfFeeSVC" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                    <td align="right" style="background-color:White;display:none;" valign="middle"><gw:textbox id="txtGolfFeeVAT" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                </tr>
	        </table>
	    </td>  
		<td style="width: 65%" valign="top">
		    <table style="width: 100%;">
		        <tr>
					<td style="width:15%;" align="right">Diposit : </td>
					<td style="width:30%"><gw:textbox id="txtDiposit" styles="width: 100%;border:none;color:red;font-weight:bold;text-align:left;" readonly="true" type="number"  format="###,###,###,###,###" /></td>
					<td style="width:15%;color:red;font-weight:bold" align="left">(VND)</td>
		            <td style="width:35%"><gw:list id="lstLocation" onchange="LisOnChange()" /></td>
		            <td style="width:5%"><gw:icon id="btnSELECT" text="SHOW" onclick="OnSearch(4);" /></td>
		            <td style="width:5%" align="right"><gw:icon id="btnCORRECT" text="CORRECT BILL" onclick="OnSearch(6);" /></td>
		        </tr>
		    </table>
			<gw:grid id="grdSRV" 
			header  ="_No|_PK|_RoomNo|_Name|Location|Invoice ID|Date|Amount|_POINT|_Total_AMT|_Service_AMT|_VAT_AMT|_Amount_USD|Description" 
			format  ="0|0|0|0|0|0|4|-0|0|0|-0|-0|-2|0" 
			aligns  ="1|0|1|0|0|0|1|0|0|0|0|0|0|0" 
			defaults="|||||||||||||" 
			editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
 		    widths  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
			styles="width:100%;height:100%"
			autosize='T'
			debug='false'
			oncelldblclick="OnSearch(3);"/>
		</td>
	</tr>	
</table>
</body>

<!--------------------------------------------------------------------------------------->
<gw:textbox id="EMPLOYEE_PK" styles="width: 100%; display:none" />
<gw:textbox id="DATE_TO" styles="width: 100%; display:none" />
<gw:textbox id="TABLE_PK" styles="width: 100%; display:none" />
<gw:textbox id="COMP_PK" styles="width: 100%; display:none" />
<gw:icon id="btnDiscount" text="Discount" onclick="OnDiscount()"  styles="width: 100%;display:none" />
</html>
