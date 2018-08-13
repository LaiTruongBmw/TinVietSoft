<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Guest Check out</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function  BodyInit()
{
  txtBuyExRate.text = "<%=CtlLib.SetDataSQL("SELECT sf_get_current_buy_ex_rate(2,'USD') from dual")%>"; 
  lstCreditType.SetDataText("<%=CtlLib.SetListDataSQL("SELECT '', '' FROM DUAL UNION ALL SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CREDITCARD'" )%>"); 
  
  var caller = dialogArguments;
  var arrSum = caller.GetSumaryAmount();
  SetSumData(arrSum);
  var arrGuest = caller.GetGuestInfo();
  SetGuestInfo(arrGuest);
  SetPayMethod();
}
function SetPayMethod(){
	switch('<%=Request.QueryString("pay") %>'){
		case "PTYPE-01":
			rbCashCredit.value = 1;
			rbCashCredit.SetEnable(false);
		break;
		case "PTYPE-02":
			rbCashCredit.value = 2;
			rbCashCredit.SetEnable(false);
		break;
		case "PTYPE-03":
			rbCashCredit.value = 3;
			rbCashCredit.SetEnable(false);
			txtReceiptVND.text = Number(txtSumVND.text);OnChangeMoney();
		break;
	}
}
function OnPreview(){
	var arr_pk = '<%=Request.QueryString("pk") %>';
    var l_crt_by = '<%=session("user_id") %>';
    var url = System.RootURL + "/system/ReportEngine.aspx?encode_yn=Y&export_pdf=Y&file=ja/rc/jarc0040_preview.rpt&procedure=sp_sel_jarc00040_preview&parameter="+
	arr_pk+",,,,"+l_crt_by;   
	System.OpenTargetPage(url);  
}
function OnPrintBill(){
    var arr_pk = '<%=Request.QueryString("pk") %>';
    var l_crt_by = '<%=session("user_id") %>';
    var url = System.RootURL + "/system/ReportEngine.aspx?encode_yn=Y&export_pdf=Y&file=ja/rc/jarc0040.rpt&procedure=sp_sel_jarc00040_invoice_print&parameter="+
	arr_pk+",,,,"+l_crt_by;   
	System.OpenTargetPage(url); 
}
function SetSumData(arr){

    var tmp = new Array();
    //total txtTotalUSD
    tmp = arr[0];
    txtTotalUSD.text=tmp[0];
    txtTotalVND.text=tmp[1];
    txtTotalVAT.text=tmp[2];
    txtTotalSVC.text=tmp[3];
    //txtSumUSD.text=tmp[0];//total fee is USD
    //txtSumVND.text=tmp[1];//total fee is VND
    
    tmp = arr[1];
    txtRoomFeeUSD.text=tmp[0];
    txtRoomFeeVND.text=tmp[1];
    txtRoomFeeVAT.text=tmp[2];
    txtRoomFeeSVC.text=tmp[3];
    
    tmp = arr[2];
    txtMinibarFeeUSD.text=tmp[0];
    txtMinibarFeeVND.text=tmp[1];
    txtMinibarFeeVAT.text=tmp[2];
    txtMinibarFeeSVC.text=tmp[3];
    
    tmp = arr[3];
    txtLaundryFeeUSD.text=tmp[0];
    txtLaundryFeeVND.text=tmp[1];
    txtLaundryFeeVAT.text=tmp[2];
    txtLaundryFeeSVC.text=tmp[3];
    
    tmp = arr[4]; 
    txtFNBFeeUSD.text=tmp[0];
    txtFNBFeeVND.text=tmp[1];
    txtFNBFeeVAT.text=tmp[2];
    txtFNBFeeSVC.text=tmp[3];
    
    tmp = arr[5];
    txtOtherFeeUSD.text=tmp[0];
    txtOtherFeeVND.text=tmp[1];
    txtOtherFeeVAT.text=tmp[2];
    txtOtherFeeSVC.text=tmp[3];
    
    tmp = arr[6];
    txtGolfFeeUSD.text=tmp[0];
    txtGolfFeeVND.text=tmp[1];
    txtGolfFeeVAT.text=tmp[2];
    txtGolfFeeSVC.text=tmp[3];

    tmp = arr[7];
    txtSellExRate.text=tmp[0];//Ex_rate

	tmp = arr[8]; //Total DUE
    txtSumVND.text= tmp[0];
	txtSumUSD.text= System.Round(tmp[0]/Number(txtSellExRate.text)*100,0)/100;

    OnChangeMoney();
}
function SetGuestInfo(arr){
    var tmp = new Array();
    //alert(arr);
    tmp = arr;
    txtLocker.text=tmp[0];//locker#  
    txtGolferName.text=tmp[1]; //golfer name
}
function OnChangeMoney()
{
    var Balance_VND=0,USD_VND=0,Balance_USD=0,VND=0;
    var tmp=0,pay_vnd, pay_usd_vnd=0,return_vnd=0,return_usd=0, return_usd_vnd=0,return_vnd_add_usd=0;
    
        VND=Number(txtReceiptVND.GetData());
        USD_VND=System.Round(Number(txtReceiptUSD.GetData())*Number(txtSellExRate.GetData()),0);
        pay_vnd = Number(txtPaymentVND.GetData());
        pay_usd_vnd = Number(txtPaymentUSD.GetData())*Number(txtSellExRate.GetData());
        
        return_vnd = Number(txtReturnVND.GetData());
        
        return_usd = Number(txtReturnUSD.GetData());
        if(return_usd > 0)
        {
            return_usd_vnd = Number(txtReturnUSD.GetData())*Number(txtSellExRate.GetData());
        }
        return_vnd_add_usd=return_vnd + return_usd_vnd;
        tmp = Number(txtSumVND.GetData())+ pay_vnd + pay_usd_vnd -(VND+USD_VND);
        Balance_VND = System.Round(tmp/1000,0)*1000;
        Balance_USD =System.Round((Balance_VND)/Number(txtSellExRate.GetData()),2);
        
        txtBalanceVND.SetDataText(""+Balance_VND);
        txtBalanceUSD.SetDataText(""+Balance_USD);
        tmp = Number(txtSumVND.GetData());
        tmp = System.Round(tmp/1000,0)*1000 - tmp;
        txtOtherProfitLoss.text = tmp+return_vnd_add_usd;
}
function OnChangeCashCredit()
{
	lstCreditType.SetEnable(rbCashCredit.value == 2);
	if(rbCashCredit.value != 1){
		txtReceiptVND.text = Number(txtSumVND.text);OnChangeMoney();}
}
function OnGetBus(){
	var path = System.RootURL + "/form/ht/bk/htbk00010_bus.aspx?";
	var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
	if ( object != null ){
		txtCompanyPK.text  		= object[0];
		txtCompanyName.text		= object[2];
		txtTaxCode.text			= object[6];
		txtCompanyAddress.text	= object[7];
	}
}
function OnClose(){
    window.close();
}
function OnCheckOut(){
		if(txtBalanceVND.text != "0"){
			alert("Balance is not zero. So you can not check out.");
			return;
		}
		if(rbCashCredit.value == 2)
			if(lstCreditType.value == "") {alert("Please choose credit type!");return;}
			
		if(rbCashCredit.value == 3){
			if(txtCompanyPK.text == "" || txtCompanyName.text == "")
				{alert("Company need full information as Company Name, Tax Code, Address!");return;}}
			
    if(confirm("Do you want to check out for guest '"+ txtGolferName.text +"' ?")){
        var arrReturn = new Array();
        
        arrReturn[arrReturn.length] = txtReceiptVND.text;
        arrReturn[arrReturn.length] = txtReceiptUSD.text;
        
        arrReturn[arrReturn.length] = txtPaymentVND.text;
        arrReturn[arrReturn.length] = txtPaymentUSD.text;
        
        arrReturn[arrReturn.length] = txtOtherProfitLoss.text;
        
        if(rbCashCredit.GetData() == "1" ){
            arrReturn[arrReturn.length] = "PTYPE-01";
        }
        else if(rbCashCredit.GetData() == "2" ){
            arrReturn[arrReturn.length] = "PTYPE-02";
        }
        else if(rbCashCredit.GetData() == "3" ){
            arrReturn[arrReturn.length] = "PTYPE-03";
        }
		
        arrReturn[arrReturn.length] = txtReturnVND.text;
        arrReturn[arrReturn.length] = txtReturnUSD.text;
		
		arrReturn[arrReturn.length] = txtCompanyPK.text;
		arrReturn[arrReturn.length] = txtCompanyName.text;
		arrReturn[arrReturn.length] = txtTaxCode.text;
		arrReturn[arrReturn.length] = txtCompanyAddress.text;
		arrReturn[arrReturn.length] = (rbCashCredit.GetData() == "2")?lstCreditType.value:"";
        
        window.returnValue = arrReturn;
        window.close();
    }/**/
}
</script>

<body>
    <table style="width: 100%; height: 100%" border="0">
        <tr valign="top" style="height: 2%">
            <td colspan="2">
                <table style="height: 100%; width: 100%">
                    <tr valign="top">
                        <td>
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <!--td style="width: 11%">
                                    </td>
                                    <td style="width: 12%">
                                        <gw:icon id="idBtnPreview" img="2" text="Preview" styles='width:100%' onclick="OnPreview()" />
                                    </td>
                                    <td style="width: 14%">
                                    </td>
                                    <td style="width: 12%">
                                        <gw:icon id="idBtnPrintBill" img="2" text="Print Bill" styles='width:100%' onclick="OnPrintBill()" />
                                    </td-->
                                    <td style="width: 85%" align="left"></td>
                                    <td style="width: 5%" align="left">
                                        <gw:icon id="btnClose" img="2" text="Not Check Out" styles='width:100%' onclick="OnClose()" />
                                    </td>
                                    <td style="width: 5%" align="left"></td>
                                    <td style="width: 5%">
                                        <gw:icon id="idBtnCheckOut" img="2" text="Check Out" styles='width:100%' onclick="OnCheckOut()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr valign="top" style="height: 2%">
            <td colspan="2">
                <table width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="width:15%;padding-right:2px" align="left">
                            Room#
                        </td>
                        <td style="width:6%">
                            <gw:textbox id="txtLocker" />
                        </td>
                        <td style="width:10%;padding-right:2px" align="right">
                            Guest Name
                        </td>
                        <td style="width:27%">
                            <gw:textbox id="txtGolferName" />
                        </td>
                        <td style="width:13%;padding-left:5px">Sell Ex.Rate:</td>
                        <td style="width:10%"><gw:textbox id="txtSellExRate" readonly="true" styles="width:100%;border:0px;" /></td>
                        <td style="width:12%">Buy Ex.Rate:</td>
                        <td style="width:10%"><gw:textbox id="txtBuyExRate" readonly="true" styles="width:100%;border:0px;" /></td>
                    </tr>
					<tr>
						<td><a href="#" onclick="OnGetBus();">Company Name</a></td>
						<td colspan="3"><gw:textbox id="txtCompanyName" readonly="true"/></td>
						<td style="padding-left:5px">Tax Code</td>
						<td colspan="3"><gw:textbox id="txtTaxCode" readonly="true"/></td>
					</tr>
					<tr>
						<td>Company Address</td>
						<td colspan="3"><gw:textbox id="txtCompanyAddress" readonly="true"/><gw:textbox id="txtCompanyPK" readonly="true" style="display:none"/></td>
						<td style="padding-left:5px">Credit type</td>
						<td colspan="3"><gw:list id="lstCreditType" text="" styles='width:100%' /></td>
					</tr>
                </table>
            </td>
        </tr>
        <tr valign="top" style="height: 96%">
            <td style="width: 58%; background-color: #33CCFF">
                <table style="height: 100%; width: 100%; border: 0px;" cellspacing="1" cellpadding="1">
                    <tr style="height: 2%;" valign="top">
                        <td align="center" style="background-color:White;width:20%;" valign="middle"></td>
                        <td align="center" style="background-color:White;width:20%;" valign="middle">USD</td>
                        <td align="center" style="background-color:White;width:20%;" valign="middle">VND</td>
                        <td align="center" style="background-color:White;width:20%;" valign="middle">SVC(5%)</td>
                        <td align="center" style="background-color:White;width:20%;" valign="middle">VAT(10%)</td>
                    </tr>
                    <tr style="height: 2%" valign="top">
                        <td style="background-color:Red;padding-left:5px;color:White" valign="middle">Total</td>
                        <td style="background-color:White" valign="middle"><gw:textbox id="txtTotalUSD" styles="width:100%;border:0px;font-weight:bold;" type="number" format="###,###,###,###,###.##" /></td>
                        <td style="background-color:White" valign="middle"><gw:textbox id="txtTotalVND" styles="width:100%;border:0px;font-weight:bold;" type="number" format="###,###,###,###,###" /></td>
                        <td style="background-color:White" valign="middle"><gw:textbox id="txtTotalSVC" styles="width:100%;border:0px;font-weight:bold;" type="number" format="###,###,###,###,###" /></td>
                        <td style="background-color:White" valign="middle"><gw:textbox id="txtTotalVAT" styles="width:100%;border:0px;font-weight:bold;" type="number" format="###,###,###,###,###"  /></td>
                    </tr>
                    <tr style="height: 2%;" valign="top">
                        <td style="background-color:White;padding-left:5px;" valign="middle">Room Fee</td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtRoomFeeUSD" styles="width:100%;border:0px;" type="number" format="###,###,###,###.##"  /></td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtRoomFeeVND" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtRoomFeeSVC" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtRoomFeeVAT" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                    </tr>
                    <tr style="height: 2%;" valign="top">
                        <td style="background-color:White;padding-left:5px;" valign="middle">Minibar Fee</td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtMinibarFeeUSD" styles="width:100%;border:0px;" type="number" format="###,###,###,###.##"  /></td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtMinibarFeeVND" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtMinibarFeeSVC" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtMinibarFeeVAT" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                    </tr>
                    <tr style="height: 2%;" valign="top">
                        <td style="background-color:White;padding-left:5px;" valign="middle">Laundry Fee</td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtLaundryFeeUSD" styles="width:100%;border:0px;" type="number" format="###,###,###,###.##"  /></td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtLaundryFeeVND" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtLaundryFeeSVC" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtLaundryFeeVAT" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                    </tr>
                    <tr style="height: 2%;" valign="top">
                        <td style="background-color:White;padding-left:5px;" valign="middle">F&B Fee</td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtFNBFeeUSD" styles="width:100%;border:0px;" type="number" format="###,###,###,###.##"  /></td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtFNBFeeVND" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtFNBFeeSVC" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtFNBFeeVAT" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                    </tr>
                    <tr style="height: 2%;" valign="top">
                        <td style="background-color:White;padding-left:5px;" valign="middle">Other Fee</td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtOtherFeeUSD" styles="width:100%;border:0px;" type="number" format="###,###,###,###.##"  /></td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtOtherFeeVND" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtOtherFeeSVC" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtOtherFeeVAT" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                    </tr>
		    <tr style="height: 2%;" valign="top">
                        <td style="background-color:White;padding-left:5px;" valign="middle">Golf Fee</td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtGolfFeeUSD" styles="width:100%;border:0px;" type="number" format="###,###,###,###.##"  /></td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtGolfFeeVND" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtGolfFeeSVC" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                        <td align="right" style="background-color:White" valign="middle"><gw:textbox id="txtGolfFeeVAT" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                    </tr>	
                </table>
            </td>
            <td style="width: 40%; background-color: #33CCFF">
                <table style="height: 100%; width: 100%; border: 0px;" cellspacing="1" cellpadding="0">
                    <tr style="height: 3%">
                        <td style="background-color: #5A79A5; width: 100%" align="center" colspan="3">
                            <gw:radio id="rbCashCredit" value="1" onchange="OnChangeCashCredit()"> 
		                                <span value="1">Cash</span>
		                                <span value="2">Credit Card</span>
		                                <span value="3">City Ledger</span>
                            </gw:radio>
                        </td>
                    </tr>
                    <tr style="height: 4%">
                        <td style="background-color: #BFD9DA; width: 35%; font-size:larger" rowspan="2" align="center">
                            Total Fee</td>
                        <td style="background-color: #BFD9DA; width: 15%; font-size:larger" align="center">
                            VND</td>
                        <td style="background-color: #BFD9DA;">
                            <gw:textbox id="txtSumVND" styles="width:100%;border:0px;background-color:#BFD9DA; font-size:large" type="number" format="###,###,###,###,###" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td style="background-color: #BFD9DA; font-size:larger" align="center">
                            USD</td>
                        <td style="background-color: #BFD9DA">
                            <gw:textbox id="txtSumUSD" styles="width:100%;border:0px; font-size:large;background-color:#BFD9DA" type="number" format="###,###,###,###,###.##" />
                        </td>
                    </tr>
                    <tr style="height: 4%">
                        <td style="background-color: White; width: 35%; font-size:larger" rowspan="2" align="center">
                            Receipt</td>
                        <td style="background-color: White; width: 15%; font-size:larger" align="center">
                            VND</td>
                        <td style="background-color: White;">
                            <gw:textbox id="txtReceiptVND" styles="width:100%;border:0px; font-size:large" type="number" format="###,###,###,###,###"
                                onchange="OnChangeMoney()" onenterkey="OnChangeMoney()" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td style="background-color: White; font-size:larger" align="center">
                            USD</td>
                        <td style="background-color: White">
                            <gw:textbox id="txtReceiptUSD" styles="width:100%;border:0px; font-size:large" type="number" format="###,###,###,###,###.##"
                                onchange="OnChangeMoney()" onenterkey="OnChangeMoney()" />
                        </td>
                    </tr>
                    <tr style="height: 4%">
                        <td style="background-color: #D9D4AE; width: 35%; font-size:larger" rowspan="2" align="center">
                            Payment</td>
                        <td style="background-color: #D9D4AE; width: 15%; font-size:larger" align="center">
                            VND</td>
                        <td style="background-color: #D9D4AE;">
                            <gw:textbox id="txtPaymentVND" styles="width:100%;border:0px;background-color:#D9D4AE; font-size:large" type="number" format="###,###,###,###,###"
                                onchange="OnChangeMoney()" onenterkey="OnChangeMoney()" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td style="background-color: #D9D4AE; font-size:larger" align="center">
                            USD</td>
                        <td style="background-color: #D9D4AE;">
                            <gw:textbox id="txtPaymentUSD" styles="width:100%;border:0px; font-size:large;background-color:#D9D4AE" type="number" format="###,###,###,###,###.##"
                                onchange="OnChangeMoney()" onenterkey="OnChangeMoney()" />
                        </td>
                    </tr>
                    <tr style="height: 4%">
                        <td style="background-color: White; width: 35%; font-size:larger" rowspan="2" align="center">
                            Return</td>
                        <td style="background-color: White; width: 15%; font-size:larger" align="center">
                            VND</td>
                        <td style="background-color: White;">
                            <gw:textbox id="txtReturnVND" styles="width:100%;border:0px; font-size:large" type="number" format="###,###,###,###,###"
                                onchange="OnChangeMoney()" onenterkey="OnChangeMoney()" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td style="background-color: White; font-size:larger" align="center">
                            USD</td>
                        <td style="background-color: White;">
                            <gw:textbox id="txtReturnUSD" styles="width:100%;border:0px; font-size:large" type="number" format="###,###,###,###,###.##"
                                onchange="OnChangeMoney()" onenterkey="OnChangeMoney()" />
                        </td>
                    </tr>
                    <tr style="height: 4%">
                        <td style="background-color: #BFD9DA; width: 35%; font-size:larger" rowspan="2" align="center">
                            Balance:</td>
                        <td style="background-color: #BFD9DA; width: 15%; font-size:larger" align="center">
                            VND</td>
                        <td style="background-color: #BFD9DA;">
                            <gw:textbox id="txtBalanceVND" styles="width:100%;border:0px;color:red;background-color:#BFD9DA; font-size:large" readonly="true" type="number" format="###,###,###,###,###"
                                onchange="OnChangeMoney()" onenterkey="OnChangeMoney()" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td style="background-color: #BFD9DA; font-size:larger" align="center">
                            USD</td>
                        <td style="background-color: #BFD9DA">
                            <gw:textbox id="txtBalanceUSD" styles="width:100%;border:0px; color:red;background-color:#BFD9DA; font-size:large" readonly="true" type="number" format="###,###,###,###,###.##.##"
                                onchange="OnChangeMoney()" onenterkey="OnChangeMoney()" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td style="background-color: #BFD9DA;" align="center" colspan="2">
                            Other Profit/Loss</td>
                        <td style="background-color: #BFD9DA;">
                            <gw:textbox id="txtOtherProfitLoss" styles="width:100%;border:0px;background-color:#BFD9DA;" readonly="true" type="number"
                                format="###,###,###,###,###" />
                        </td>
                    </tr>
                    <!--tr style="height: 88%">
                        <td style="background-color: #BFD9DA; width: 100%" colspan="3">
                        </td>
                    </tr-->
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txtPKs" styles="width:100%; display:none" />
    <gw:textbox id="txtCashUSD" styles="width:100%; display:none" />
    <gw:textbox id="txtCashVND" styles="width:100%; display:none" />
    <gw:textbox id="txtCreditUSD" styles="width:100%; display:none" />
    <gw:textbox id="txtCreditVND" styles="width:100%; display:none" />
    <!------------------------------------------------------------------------>
</body>
</html>
