<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Advance Regist Popup</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var G_PK=0,
	G_Pay_Rcpt_Date=1,
	G_Currency=2,
	G_Supply_Amt=3,
	G_supply_amt_book=4,
	G_VAT=5,
	G_VAT_book=6,
	G_Witholding_Tax=7,
	G_Witholding_Tax_book=8,
	G_Retention_Money=9,
	G_Retention_money_book=10,
	G_Pay_Rcpt_Amt=11,
	G_Pay_Rcpt_Amt_book=12,
	G_Remarks=13,
	G_project_pk=14,
	G_tecps_prepayexec_pk=15;
var v_level ='';
function BodyInit()
{   
	lstCurrencyReadOnly.SetEnable(false);
	lstdescriptionType.SetEnable(false);
	dtRequestDate.SetEnable(false);
	var lstCcy = "<%=ESysLib.SetListDataSQL("SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'ACAB0110' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>";
	lstCurrencyReadOnly.SetDataText(lstCcy);
	var lstDescType = "<%=ESysLib.SetListDataSQL("SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'TPS0030' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>";
	lstdescriptionType.SetDataText(lstDescType);
	txt_project_PK.text = '<%=Request.QueryString("Project_Pk") %>';
	txt_master_PK.text = '<%=Request.QueryString("master_pk") %>';
	txtCurrency.text = '<%=Request.QueryString("currency") %>';
	
	txtProjectCode.text = '<%=Request.QueryString("project_code") %>';
	txtProjectName.text = '<%=Request.QueryString("project_name") %>';
	dtRequestDate.value = '<%=Request.QueryString("req_date") %>';
	lstdescriptionType.value = '<%=Request.QueryString("description_type") %>';
	txtS_No.text = '<%=Request.QueryString("pp_s_no") %>';
	txtReqAmt.text = '<%=Request.QueryString("req_amt") %>';
	txtRetentionMoney.text = '<%=Request.QueryString("retention_money") %>';
	txtWithholdingTax.text = '<%=Request.QueryString("withholding_tax") %>';
	lstCurrencyReadOnly.value = '<%=Request.QueryString("currency") %>';
	
	<%=ESysLib.SetGridColumnComboFormat("grdAdvRegistPopup", 2,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'ACAB0110' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>; //currency
	var ls_company = "<%=ESysLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if=0")%>";
	lstCOMPANY.SetDataText(ls_company);
	
	lstCOMPANY.value = "<%=session("company_pk") %>";
	var	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
   var arr  = data.split("|");
   txtbookccy.SetDataText(arr[1]);
   var ls_ccy = "<%=ESysLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
   txtccy.SetDataText(ls_ccy);
   dso_get_exrate.Call();  
	//dso_AdvRegistPopup.Call("SELECT");
}
function OnSearch()
{
    dso_AdvRegistPopup.Call("SELECT");
}
function OnDelete()
{
    grdAdvRegistPopup.DeleteRow(); 
}
function OnNew()
{
    var data="";
    grdAdvRegistPopup.AddRow();
	grdAdvRegistPopup.SetGridText(grdAdvRegistPopup.rows-1, G_Currency,txtCurrency.text); 
	grdAdvRegistPopup.SetGridText(grdAdvRegistPopup.rows-1, G_project_pk,txt_project_PK.text); 
	grdAdvRegistPopup.SetGridText(grdAdvRegistPopup.rows-1, G_tecps_prepayexec_pk,txt_master_PK.text);
}
function OnSave()
{
    if(CheckDataIsValid())
    {   
        dso_AdvRegistPopup.Call();  
    }
 }
function CheckDataIsValid()
{
    for(var i=1;i<grdAdvRegistPopup.rows;i++)
          {
			if(grdAdvRegistPopup.GetGridData(i,G_Supply_Amt) == "")
             {
                alert("Please input supply amount at row "+ i);
                return false;
             }
          }
          return true;
}
function OnDataReceive(obj){
  if(obj.id == "dso_get_exrate"){
    dso_AdvRegistPopup.Call("SELECT");
  }
  if(obj.id == "dso_AdvRegistPopup")
  {
	if(grdAdvRegistPopup.rows >1)
	{
		grdAdvRegistPopup.Subtotal( 1, 2, -1, '3!5!7!9!11');
	}
  }
  if(obj.id == "dso_get_exrate_list"){
    BookAmt();
  }
}
function BookAmt()
{	
		var _Supply_Amt = Number(grdAdvRegistPopup.GetGridData(grdAdvRegistPopup.row, G_Supply_Amt));
		var _Vat_Amt = Number(grdAdvRegistPopup.GetGridData(grdAdvRegistPopup.row, G_VAT));
		var _Withholding_tax_Amt = Number(grdAdvRegistPopup.GetGridData(grdAdvRegistPopup.row, G_Witholding_Tax));
		var _Retention_money_Amt = Number(grdAdvRegistPopup.GetGridData(grdAdvRegistPopup.row, G_Retention_Money));
		var _Pay_Rcpt_Amt = Number(grdAdvRegistPopup.GetGridData(grdAdvRegistPopup.row, G_Pay_Rcpt_Amt));
		
		var ccy = grdAdvRegistPopup.GetGridData(grdAdvRegistPopup.row, G_Currency);
		var tr_rate = Number(txtTR_RATE.text);
		txtccy.value = grdAdvRegistPopup.GetGridData(grdAdvRegistPopup.row, G_Currency);
		var _Supply_Amt_Bk = 0,_Vat_Amt_Bk = 0,_Withholding_tax_Amt_Bk = 0,
			_Retention_money_Amt_Bk = 0,_Pay_Rcpt_Amt_Bk = 0;
		var _book_rate = Number(txtBookRate.text);
		//alert(txtbookccy.text+""+_book_rate+""+ccy)
		
		if(txtbookccy.text == 'VND' && _book_rate > 0)
		{
				
				if(ccy == 'USD')
				{
						_Supply_Amt_Bk = Math.round(_Supply_Amt * tr_rate);
						_Vat_Amt_Bk = Math.round(_Vat_Amt * tr_rate);
						_Withholding_tax_Amt_Bk = Math.round(_Withholding_tax_Amt * tr_rate);
						_Retention_money_Amt_Bk = Math.round(_Retention_money_Amt * tr_rate);
						_Pay_Rcpt_Amt_Bk = Math.round(_Pay_Rcpt_Amt * tr_rate);
						
						//_Bk_Amount = Math.round(_Amount * tr_rate)
				}
				else if(ccy == 'VND')
				{
						_Supply_Amt_Bk = Math.round(_Supply_Amt * _book_rate);
						_Vat_Amt_Bk = Math.round(_Vat_Amt * _book_rate);
						_Withholding_tax_Amt_Bk = Math.round(_Withholding_tax_Amt * _book_rate);
						_Retention_money_Amt_Bk = Math.round(_Retention_money_Amt * _book_rate);
						_Pay_Rcpt_Amt_Bk = Math.round(_Pay_Rcpt_Amt * _book_rate);
						
						//_Bk_Amount = Math.round(_Amount / _book_rate );
				}
		}
		else if(txtbookccy.text == 'USD' && _book_rate > 0)
		{
				if(ccy == 'USD')
				{
						_Supply_Amt_Bk = Math.round((_Supply_Amt * _book_rate / _book_rate) * 100) / 100;
						
						_Vat_Amt_Bk = Math.round((_Vat_Amt * _book_rate / _book_rate) * 100) / 100;
						
						_Withholding_tax_Amt_Bk = Math.round((_Withholding_tax_Amt * _book_rate / _book_rate) * 100) / 100;
						
						_Retention_money_Amt_Bk = Math.round((_Retention_money_Amt * _book_rate / _book_rate) * 100) / 100;
						
						_Pay_Rcpt_Amt_Bk = Math.round((_Pay_Rcpt_Amt * _book_rate / _book_rate) * 100) / 100;
						
						
						//_Bk_Amount = Math.round((_Amount * _book_rate / _book_rate) * 100) / 100;
						
				}
				else if(ccy == 'VND')
				{
						_Supply_Amt_Bk = Math.round(_Supply_Amt / _book_rate *100 )/100;
						_Vat_Amt_Bk = Math.round(_Vat_Amt / _book_rate *100 )/100;
						_Withholding_tax_Amt_Bk = Math.round(_Withholding_tax_Amt/ _book_rate *100 )/100;
						_Retention_money_Amt_Bk = Math.round(_Retention_money_Amt / _book_rate *100 )/100;
						_Pay_Rcpt_Amt_Bk = Math.round(_Pay_Rcpt_Amt / _book_rate *100 )/100;
						
						//_Bk_Amount = Math.round(_Amount / _book_rate *100 )/100;
				}
		}
		grdAdvRegistPopup.SetGridText(grdAdvRegistPopup.row, G_supply_amt_book, _Supply_Amt_Bk); 
		grdAdvRegistPopup.SetGridText(grdAdvRegistPopup.row, G_VAT_book, _Vat_Amt_Bk);    
		grdAdvRegistPopup.SetGridText(grdAdvRegistPopup.row, G_Witholding_Tax_book, _Withholding_tax_Amt_Bk);    
		grdAdvRegistPopup.SetGridText(grdAdvRegistPopup.row, G_Retention_money_book, _Retention_money_Amt_Bk);    
		grdAdvRegistPopup.SetGridText(grdAdvRegistPopup.row, G_Pay_Rcpt_Amt_book, _Pay_Rcpt_Amt_Bk); 
}
function OnGetRate()
{
		dso_get_exrate_list.Call();	
}
</script>

<body bgcolor='#F5F8FF'>
	 <gw:data id="dso_AdvRegistPopup" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="pm_sel_61030060_popup" procedure="pm_upd_61030060_popup">  
                <input bind="grdAdvRegistPopup"   >  
                    <input bind="txt_master_PK" />														
                </input> 
                <output bind="grdAdvRegistPopup" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------->
	<gw:data id="dso_get_exrate" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="sp_pro_get_rate"> 
                <input> 
                	 <input bind="txtUSE_DATE" />
                     <input bind="lstCOMPANY"/>
                     <input bind="txtbookccy" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtBookRate"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------->
      <gw:data id="dso_get_exrate_list" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="sp_get_rate" > 
                <input> 
                     <input bind="lstCOMPANY"/>
                     <input bind="txtccy"/>
                     <input bind="txtUSE_DATE"/>
                </input>
                <output>
                     <output bind="txtTR_RATE"/>
                     <output bind="txtBK_RATE"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
   
    <table style="width: 100%; height: 100%">
        <tr>
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td width="10%">
                        </td>
						<td width="6%">
                        </td>
						<td width="7%">
                        </td>
                        <td width="12%">
                        </td>
						<td width="7%">
                        </td>
						<td width="11%">
                        </td>
						<td width="8%">
                        </td>
						<td width="12%">
                        </td>
						<td width="10%">
                        </td>
						<td width="10%">
                        </td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnNew()" />
                        </td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                        </td>
                        <td style="width: 3%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
                        </td>
						<td style="display:none"><gw:datebox id="txtUSE_DATE" lang="1" styles='width:100%;' /></td>
                    </tr>
					<tr>
                        <td width="10%">
							Project
                        </td>
						<td colspan="2">
							<gw:textbox id="txtProjectCode" styles='width:100%;' readonly="T" />
                        </td>
						
                        <td colspan="3">
							<gw:textbox id="txtProjectName" styles='width:100%;' readonly="T" />
                        </td>
						
                       
						<td width="8%">
							Request Date
                        </td>
						<td width="12%">
							<gw:datebox id="dtRequestDate" lang="1" styles='width:100%;' />
                        </td>
						<td width="10%">
							Description
                        </td>
						<td colspan="4">
							<gw:list id="lstdescriptionType" styles='width:100%;' readonly="T" />
                        </td>
                        
                    </tr>
					<tr>
                        <td width="10%">
							P/P S/No
                        </td>
						<td width="6%"> 
							<gw:textbox id="txtS_No" styles='width:100%;' readonly="T" type="number" format="###,###,###" styles="text-align:right;width:100%;" />
                        </td>
						<td width="7%">
							Currency
                        </td>
                        <td width="12%">
							<gw:list id="lstCurrencyReadOnly" styles='width:100%;' />
                        </td>
						<td width="7%">
							Req.Amt
                        </td>
						<td width="11%">
							<gw:textbox id="txtReqAmt" styles='width:100%;' readonly="T" type="number" format="###,###,###"  styles="text-align:right;width:100%;" />
                        </td>
						<td width="8%">
						Retention Money
                        </td>
						<td width="12%">
							<gw:textbox id="txtRetentionMoney" styles='width:100%;' readonly="T" type="number" format="###,###,###" styles="text-align:right;width:100%;"" />
                        </td>
						<td width="10%"> 
							Withholding Tax
                        </td>
						<td colspan="4">
							<gw:textbox id="txtWithholdingTax" styles='width:100%;' readonly="T" type="number" format="###,###,###" styles="text-align:right;width:100%;" />
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="13">
                            <gw:grid id='grdAdvRegistPopup' header='_PK|Pay.Rcpt.Date|Currency|Supply Amt|_supply_amt_book|VAT|_VAT_book|Withholding Tax|_Witholding_Tax_book|Retention Money|_Retention_money_book|Pay.Rcpt.Amt|_Pay_Rcpt_Amt_book|Remarks|_project_pk|_tecps_prepayexec_pk'
                                format='0|4|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0|0|0' 
								aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								defaults='|||||||||||||||'
                                editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1' 
								widths='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								autosize="T" oncellclick="OnGetRate();" 
                                sorting='T' styles='width:100%; height:100%'  onafteredit="BookAmt()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
		<td style="display:none"><gw:textbox id="txt_project_PK" styles='width:100%;display:none' /></td>
		<td style="display:none"><gw:textbox id="txt_master_PK" styles='width:100%;display:none' /></td>
		<td style="display:none"> <gw:textbox id="txtCurrency" styles='width:100%;display:none' /></td>
		<td style="display:none"><gw:list id="lstCOMPANY" styles='width:100%;display:none' /> </td>
		<td style="display:none"> <gw:textbox id="txtbookccy" styles='width:100%;display:none' /></td>
		<td style="display:none"> <gw:textbox id="txt_row" styles='display:none' /></td>
		<td style="display:none"> <gw:textbox id="txtBookRate" styles='width:100%;display:none' /></td>
		<td style="display:none"> <gw:list id="txtccy" onchange="OnGetRate()" styles='width:100%;display:none' /></td>
		<td style="display:none"> <gw:textbox id="txtBK_RATE"  styles='width:100%;display:none' /></td>
		<td style="display:none"> <gw:textbox id="txtTR_RATE" styles="width:100%;display:none" /></td>
		<td style="display:none"> <gw:textbox id="txtContrac_pk" styles="width:100%;display:none" /></td>
    </table>
</body>
