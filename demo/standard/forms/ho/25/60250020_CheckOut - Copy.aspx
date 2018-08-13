<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Guest Check out</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var flag="";
function  BodyInit()
{
var  l_company_pk   = "<%=Session("COMPANY_PK")%>";
  //txtCompanyPK.text=l_company_pk;	
  txtRoomAllocatePK.text = '<%=Request.QueryString("p_room_allocate_pk") %>';
  txtBuyExRate.text = "<%=CtlLib.SetDataSQL("SELECT sf_get_current_buy_ex_rate("+Session("COMPANY_PK")+",'USD') from dual")%>"; 
  lstCreditType.SetDataText("<%=CtlLib.SetListDataSQL("SELECT '', '' FROM DUAL UNION ALL SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='CREDITCARD'" )%>"); 
  lstPaymentMehtod.SetDataText("<%=CtlLib.SetListDataSQL("SELECT code,NAME FROM tco_commcode WHERE DEL_IF=0 and  parent_code='PTYPE' and use_yn='Y'" )%>");
  lstPaymentMehtod.SetEnable(false);
  txtCityUSD.SetEnable(false);
  dso_CheckOut.Call("SELECT");  
}
function OnSetEnableControl()
{
		if(lstPaymentMehtod.value=='PTYPE-01')//cash
		{
            txtReceiptCreditVND.SetEnable(false);
            txtReceiptCreditUSD.SetEnable(false);
            txtCityVND.SetEnable(false);
			txtCityUSD.SetEnable(false);     	
		}
		if(lstPaymentMehtod.value=='PTYPE-02')//credit
		{
			txtReceiptCashVND.SetEnable(false);  
            txtReceiptCashUSD.SetEnable(false); 
            txtCityVND.SetEnable(false);
			txtCityUSD.SetEnable(false);  
		}
		if(lstPaymentMehtod.value=='PTYPE-03')//ledger
		{
			txtReceiptCashVND.SetEnable(false);  
            txtReceiptCashUSD.SetEnable(false); 
            txtReceiptCreditVND.SetEnable(false);
            txtReceiptCreditUSD.SetEnable(false);
		}
		if(lstPaymentMehtod.value=='PTYPE-05')//Payment By Cash & Credit Card
		{
            txtCityVND.SetEnable(false);
			txtCityUSD.SetEnable(false);  
		}
		if(lstPaymentMehtod.value=='PTYPE-06')//Payment By Cash, Credit Card & City Ledger
		{
			
		}
		if(lstPaymentMehtod.value=='PTYPE-07')//Payment By Cash & City Ledger
		{
            txtReceiptCreditVND.SetEnable(false);
            txtReceiptCreditUSD.SetEnable(false);
		}
		if(lstPaymentMehtod.value=='PTYPE-07')//Payment By Cash & City Ledger
		{
            txtReceiptCreditVND.SetEnable(false);
            txtReceiptCreditUSD.SetEnable(false);
		}
		if(lstPaymentMehtod.value=='PTYPE-08')//Payment By Credit Card & City Ledger
		{
			txtReceiptCashVND.SetEnable(false);  
            txtReceiptCashUSD.SetEnable(false); 
		}
}
function OnCheckOut()
{
	/*if(lstPaymentMehtod.value !='PTYPE-01' && lstCreditType.value=="")
	{
		alert("you choose credit type to checkout.");
		return false;
	}*/
	if(Number(txtBalanceVND.text) == 0)
	{
		flag="CheckoutOK";
		dso_CheckOut.StatusUpdate(); 
		dso_CheckOut.Call();
	}
    else
	{
		alert("Balance is zero then check out.");
	}	
}
function OnClose(){
    window.close();
}
function OnBalance()
{
	var l_receipt_cash_vnd=0,l_receipt_credit_vnd,l_Balance_VND=0,l_Balance_USD=0,l_total_due_vnd,l_receipt_cashusd_vnd=0,l_receipt_creditusd_vnd=0,l_city_ledger_vnd=0,l_city_ledger_usd=0;
	txtBalanceVND.text = txtTotalDueVND.text;
	//--------city--ledger-------
	if(lstPaymentMehtod.value=='PTYPE-03')
	{
		txtCityVND.text= Number(txtTotalDueVND.text);
	}
	//--------end--city--ledger--
	if(Number(txtReceiptCashUSD.text) != 0)
	{
		l_receipt_cashusd_vnd=System.Round(Number(txtReceiptCashUSD.text)*Number(txtBuyExRate.text),0)
	}
	if(Number(txtReceiptCreditUSD.text) != 0)
	{
		l_receipt_creditusd_vnd=System.Round(Number(txtReceiptCreditUSD.text)*Number(txtBuyExRate.text),0)
	}
	l_total_due_vnd      =Number(txtTotalDueVND.text);
	l_receipt_cash_vnd   =Number(txtReceiptCashVND.text);
	
	l_receipt_credit_vnd = Number(txtReceiptCreditVND.text);
	l_city_ledger_vnd    =Number(txtCityVND.text);
	
	l_city_ledger_usd    = System.Round(l_city_ledger_vnd/Number(txtBuyExRate.text),2);
	
	l_Balance_VND        = l_total_due_vnd -(l_receipt_cashusd_vnd + l_receipt_creditusd_vnd + l_receipt_cash_vnd + l_receipt_credit_vnd+l_city_ledger_vnd);
	l_Balance_USD = System.Round(l_Balance_VND/Number(txtBuyExRate.text),2);
	
	if(l_total_due_vnd == l_receipt_credit_vnd)
	{
		l_Balance_VND=0;
		l_Balance_USD=0;
	}
	if(Number(txtTotalDueUSD.text) == Number(txtReceiptCreditUSD.text))
	{
		l_Balance_VND=0;
		l_Balance_USD=0;
	}
	if(l_total_due_vnd == Number(txtReceiptCashVND.text))
	{
		l_Balance_VND=0;
		l_Balance_USD=0;
	}
	if(Number(txtTotalDueUSD.text) == Number(txtReceiptCashUSD.text))
	{
		l_Balance_VND=0;
		l_Balance_USD=0;
	}
	if(Math.abs(l_Balance_VND) < 1000)
	{
		l_Balance_VND=0;
		l_Balance_USD=0;
	}
	txtBalanceVND.text = l_Balance_VND;
	txtBalanceUSD.text = l_Balance_USD;
	
	txtCityUSD.text    = l_city_ledger_usd;
	if(txtReceiptCashVND.text=="0" && txtReceiptCashUSD.text=="0" && txtReceiptCreditVND.text=="0" && txtReceiptCreditUSD.text=="0" && txtCityVND.text=="0" && txtCityUSD.text=="0")
	{
		txtBalanceUSD.text = txtTotalDueUSD.text;
	}
}
function OnDataReceive(obj)
{
	if(obj.id=='dso_CheckOut')
	{
		OnBalance();
		OnSetEnableControl();
		if(flag == 'CheckoutOK')
		{
			alert(" Checked Out guest was successfull.");
			window.close();
		}
	}
}
function OnReceiveError(obj){
    alert(obj.errmsg);
	window.close();
}
</script>
<body>
<gw:data id="dso_CheckOut" onreceive="OnDataReceive(this)" onerror="OnReceiveError(this)"> 
        <xml> 
            <dso  type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="ht_60250020_checkout" procedure="ht_upd_60250020_checkout" > 
                <inout> 
                     <inout bind="txtRoomAllocatePK" /> 
                     <inout bind="txtRoomNo" /> 
                     <inout bind="txtGuestName" />
					 <inout bind="txtCompanyPK"/>
                     <inout bind="txtCompanyName" />
                     <inout bind="txtTaxCode"/>
                     <inout bind="txtCompanyAddress"/>
                     <inout bind="lstCreditType"/>
					 <inout bind="lstPaymentMehtod"/> 
					 
					 <inout bind="txtTotalDueVND" />   
					 <inout bind="txtTotalDueUSD" />
					 <inout bind="txtReceiptCashVND"/>  
                     <inout bind="txtReceiptCashUSD" /> 
                     <inout bind="txtReceiptCreditVND"/>
                     <inout bind="txtReceiptCreditUSD"/> 
                     <inout bind="txtCityVND"/>
					 <inout bind="txtCityUSD"/>     	
                </inout> 
             </dso> 
        </xml> 
    </gw:data>
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
                                        
                                    </td>
                                    <td style="width: 5%" align="left"></td>
                                    <td style="width: 5%">
                                        
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
                            <gw:textbox id="txtRoomNo" />
                        </td>
                        <td style="width:10%;padding-right:2px" align="right">
                            Guest Name
                        </td>
                        <td style="width:27%">
                            <gw:textbox id="txtGuestName" />
                        </td>
                        <td style="width:13%;padding-left:5px">Sell Ex.Rate:</td>
                        <td style="width:10%"><gw:textbox id="txtSellExRate" readonly="true" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
                        <td style="width:12%">Buy Ex.Rate:</td>
                        <td style="width:10%"><gw:textbox id="txtBuyExRate" readonly="true" styles="width:100%;border:0px;" type="number" format="###,###,###,###,###" /></td>
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
        <tr valign="top" style="height: 60%">
            
            <td style="width: 100%; background-color: #33CCFF">
                <table style="height: 100%; width: 100%; border: 0px;" cellspacing="1" cellpadding="0">
                    <tr style="height: 3%">
						 <td style="background-color: #BFD9DA; width: 100%" align="right" colspan="3">
                            Payment Mehtod:
                        </td>
                        <td style="background-color: #33CCFF; width: 100%" align="center" colspan="1">
                            <gw:list id="lstPaymentMehtod" text="" styles='width:100%' />
                        </td>
                    </tr>
                    <tr style="height:3%">
						<td style="background-color: #BFD9DA; width: 35%;" colspan="2"></td>
						<td style="background-color: #BFD9DA; width: 40%; font-size:larger" align="center">VND</td>
						<td style="background-color: #BFD9DA; width: 25%; font-size:larger" align="center">USD</td>
					</tr>
					<tr style="height: 4%">
                        <td style="background-color: #BFD9DA; font-size:larger; padding-left:100px;" colspan = "2" align="left">
                            Total Due</td>
                        <td style="background-color: #BFD9DA;"> 
                            <gw:textbox id="txtTotalDueVND" styles="width:100%;border:0px; font-size:large;background-color:#BFD9DA" readonly="T" type="number" format="###,###,###,###,###" />
						</td>
                        <td style="background-color: #BFD9DA;">
                            <gw:textbox id="txtTotalDueUSD" styles="width:100%;border:0px; font-size:large;background-color:#BFD9DA" readonly="T" type="number" format="###,###,###,###,###.##" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td style="background-color: #FFFFFF; font-size:larger;width:20%; padding-left:100px;" align="left" rowspan="2">Receipt</td>
						<td style="background-color: #FFFFFF; font-size:larger;width:15%" align="center">Cash</td>
                        <td style="background-color: #FFFFFF">
                            <gw:textbox id="txtReceiptCashVND" styles="width:100%;border:0px; font-size:large" type="number" format="###,###,###,###,###"
                                onchange="OnBalance()" onenterkey="OnBalance()" />
                        </td>
						<td style="background-color: #FFFFFF">
							<gw:textbox id="txtReceiptCashUSD" styles="width:100%;border:0px; font-size:large" type="number" format="###,###,###,###,###.##"
                                onchange="OnBalance()" onenterkey="OnBalance()" />
						</td>
                    </tr>
                    <tr style="height: 2%">
						<td style="background-color: #FFFFFF; font-size:larger;width:15%" align="center">Credit Card</td>
                        <td style="background-color: #FFFFFF">
                            <gw:textbox id="txtReceiptCreditVND" styles="width:100%;border:0px; font-size:large" type="number" format="###,###,###,###,###"
                                onchange="OnBalance()" onenterkey="OnBalance()" />
                        </td>
						<td style="background-color: #FFFFFF">
							<gw:textbox id="txtReceiptCreditUSD" styles="width:100%;border:0px; font-size:large" type="number" format="###,###,###,###,###.##"
                                onchange="OnBalance()" onenterkey="OnBalance()" />
						</td>
                    </tr>
                    <tr style="height: 4%">
                        <td style="background-color: #D9D4AE; font-size:larger; padding-left:100px;" align="left" colspan="2">
                            City Ledger</td>
                        <td style="background-color: #D9D4AE;font-size:larger" align="center">
                            <gw:textbox id="txtCityVND" styles="width:100%;border:0px;background-color:#D9D4AE; font-size:large" type="number" format="###,###,###,###,###"
                                onchange="OnBalance()" onenterkey="OnBalance()" />
						</td>
                        <td style="background-color: #D9D4AE;">
                            <gw:textbox id="txtCityUSD" styles="width:100%;border:0px;background-color:#D9D4AE; font-size:large" readonly="T" type="number" format="###,###,###,###,###.##"
                                onchange="OnBalance()" onenterkey="OnBalance()" />
                        </td>
                    </tr>
					<tr style="height: 4%">
                        <td style="background-color: silver; font-size:larger; padding-left:100px;" align="left" colspan="2">
                            Balance</td> 
                        <td style="background-color: silver; font-size:larger; padding-left:100px" align="center">
                            <gw:textbox id="txtBalanceVND" styles="width:100%;border:0px;background-color:silver; font-size:large" readonly="T" type="number" format="###,###,###,###,###"
                                onchange="OnBalance()" onenterkey="OnBalance()" />
						</td>
                        <td style="background-color: silver; font-size:larger; padding-left:100px">
                            <gw:textbox id="txtBalanceUSD" styles="width:100%;border:0px;background-color:silver; font-size:large" readonly="T" type="number" format="###,###,###,###,###.##"
                                onchange="OnBalance()" onenterkey="OnBalance()" />
                        </td>
                    </tr>
					<tr style="height:4%">
						<td colspan ="4" align="center" style="background-color: #FFFFFF;">
							<table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
									<td style="width:40%">&nbsp;</td>
                                    <td style="width: 7%" align="left">
                                        <gw:icon id="btnCancel" img="2" text="Cancel" styles='width:100%' onclick="OnClose()" />
                                    </td>
                                    <td style="width: 3%" align="left"></td>  
									<td style="width:8%"><gw:icon id="btnRecalculated" img="2" text="Recalculate" styles='width:100%' onclick="OnBalance()" /></td>
									<td style="width:3%">&nbsp;</td>
                                    <td style="width: 7%" align="right">
                                        <gw:icon id="btnCheckOut" img="2" text="Check Out" styles='width:100%' onclick="OnCheckOut()" />
                                    </td>
									<td style="width:32%">&nbsp;</td>
                                </tr>
                            </table>
						</td>
					</tr>
                </table>
            </td>
        </tr>
		<tr><td colspan="2" style="32%">&nbsp;</td></tr>
    </table>
    <gw:textbox id="txtRoomAllocatePK" styles="width:100%; display:none" />
    <!------------------------------------------------------------------------>
</body>
</html>
