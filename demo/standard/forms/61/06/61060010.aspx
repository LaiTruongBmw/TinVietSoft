<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Expenditure Issue Input</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
	var ls_company = "<%=ESysLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if=0")%>";
	lstCOMPANY.SetDataText(ls_company);
	lstCOMPANY.value = "<%=session("COMPANY_PK") %>";
	txtTotal.SetEnable(false);
	txtProjectCode.SetEnable(false);
	txtProjectName.SetEnable(false);
	txtBudgetCode.SetEnable(false);
	txtBudgetName.SetEnable(false);
	txtVendorCode.SetEnable(false);
	txtVendorName.SetEnable(false);
	lstStatus.SetEnable(false);
	gridMST.GetGridControl().FrozenCols = 3;
	var data = "<%=ESysLib.SetListDataFUNC("SELECT f_logistic_code('LGCM0100') FROM DUAL" )%>";    
    lstccy.SetDataText(data); 
	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0027') FROM DUAL")%>"; 
	lstPayDescrip.SetDataText(data);
	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0028') FROM DUAL")%>"; 
    lstEvidYN.SetDataText(data);
	data = "data |10|None-Approved|20|Approved";
    lstStatus.SetDataText(data); 
	lstStatusSearch.SetDataText(data);
	var	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
	var arr  = data.split("|");
	txtbookccy.SetDataText(arr[1]);
	var ls_ccy= "<%=ESysLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
	txtccy.SetDataText(ls_ccy);
	OnNew();
	dso_get_exrate.Call();
	//OnSearch('Master');
}
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'project':
		    var path = System.RootURL + '/form/61/05/61050020_popup.aspx';
		    var object = System.OpenModal( path ,750 , 500 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
			    txtProjectPK.text = object[0];
                txtProjectCode.text = object[1];
                txtProjectName.text = object[2]; 
		    }
	    break;
		case 'Vendor'://trans.co---buspartner
			var path = System.RootURL + '/form/61/05/61050020_popup2.aspx';
			var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
			if ( object != null )
			{
				if (object[0] != 0)
				{
					txtVendorPK.text   = object[0];
					txtVendorCode.text = object[1];
					txtVendorName.text = object[2];
				}
			}
	    break;
		case 'Pay_Description':
			var path = System.RootURL + '/form/61/06/61060010_popup.aspx?code=TPS0027';
			var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 lstPayDescrip.SetDataText(object[1]);
			 }
	    break;
		case 'Evid':
			var path = System.RootURL + '/form/61/06/61060010_popup.aspx?code=TPS0028';
			var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 lstEvidYN.SetDataText(object[1]);
			 }
	    break;
		case 'budget':
			var fpath = System.RootURL + "/form/61/06/61060010_Budget_popup.aspx";
					var object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
					if(object != null)
					{
						txtBudgetPK.text =  object[0];
						txtBudgetCode.text =  object[1];
						txtBudgetName.text =  object[2];
					}
	    break;
    }
    
}
function OnReset(pos)
{
    switch(pos)
    {
        case '1':
			txtProjectPK.text = "";
			txtProjectCode.text = "";
			txtProjectName.text = ""; 
	    break;
		case '2':
			txtBudgetPK.text = "";
			txtBudgetCode.text = "";
			txtBudgetName.text = ""; 
	    break;
		
		case '3':
			txtVendorPK.text = "";
			txtVendorCode.text = "";
			txtVendorName.text = ""; 
	    break;
    }
	
}

function OnSearch(obj)
{
    if(obj=='Master')
	{
		dso_kpde00010_expenditure.Call("SELECT");
	}
	if(obj=='Detail')
	{
		f_lag='select';
		txtMasterPK.text=gridMST.GetGridData(gridMST.row, 0);
		dso_kpde00010.Call("SELECT");
	}
}
f_lag='select';
function OnDataReceive(obj)
{
	if(obj.id=='dso_kpde00010')
	{
		if(f_lag=='update')
		{
			dso_kpde00010_expenditure.Call("SELECT");
		}
	}
	if(obj.id=='dso_Approve') 
	{
			f_lag=='select'
			dso_kpde00010.Call("SELECT");
	}
	if(obj.id=='dso_cancel')
	{
			f_lag=='select'
			dso_kpde00010.Call("SELECT");
	}
	if(obj.id=='dso_get_exrate_list') 
	{
		ChangBookAmt();//sum
	}
}
function OnNew()
{
	dso_kpde00010.StatusInsert();//add new
}
function CheckValidate()
{
	txtprjectpk_insert.text=txtProjectPK.text;
	if(txtprjectpk_insert.text=="")
	{
		alert("Please select project to save.");
        return false;
	}
	return true;
}
function OnSave()
{
	if(CheckValidate())
	{
		f_lag='update';
		dso_kpde00010.Call();
	}
}
function OnDelete()
{
	if(confirm('Are you sure to delete ?'))
   {
		dso_kpde00010.StatusDelete();
		f_lag='update';
		dso_kpde00010.Call();
	}
}
function OnApprove()
{
   if(txtMasterPK.text !="")
   {
	   if(confirm('Are you sure to approve ?'))
	   {
			dso_Approve.Call();
	   }
   }
 else
	{
		alert("You must choose one item in master to approve.");
	}
}
function OnCancel()
{
   if(txtMasterPK.text !="")
   {
	   if(confirm('Are you sure to approve ?'))
	   {
			dso_cancel.Call();
	   }
   }
 else
	{
		alert("You must choose one item in master to approve.");
	}
}
function OnGetRate()
{
		dso_get_exrate_list.Call();	
}
function ChangBookAmt()
{
	var _Amount = Number(txtSuppliedAmount.GetData())+Number(txtWithholdingTax.GetData())+Number(txtVAT.GetData()); 
		//alert(_Amount)	;
		txtTotal.text=_Amount;	
		var ccy = lstccy.GetData();
		var tr_rate = Number(txtTR_RATE.text);
		txtccy.value = lstccy.GetData();
		var _Bk_Amount = 0;
		var _book_rate = Number(txtBookRate.GetData());
		//alert(txtBookRate.GetData());
		if(txtbookccy.text == 'VND' && _book_rate > 0)
		{
				if(ccy == 'USD')
				{
						_Bk_Amount =	Math.round(_Amount * tr_rate)
				}
				else if(ccy == 'VND')
				{
					
						//alert(_book_rate);
						_Bk_Amount = Math.round(_Amount / _book_rate );
						
				}
		}
		else if(txtbookccy.text == 'USD' && _book_rate > 0)
		{
				if(ccy == 'USD')
				{
						_Bk_Amount = Math.round((_Amount * _book_rate / _book_rate) * 100) / 100;
				}
				else if(ccy == 'VND')
				{
						_Bk_Amount = Math.round(_Amount / _book_rate *100 )/100;
				}
		}
		//alert(_Bk_Amount)	;	
		txtTotalBookAmt.text=_Bk_Amount;
}
function BookAmt()
{
	OnGetRate();				
}
</script>
<body>
<!------------------------------------------------------------------------------------->
    <gw:data id="dso_kpde00010_expenditure" onreceive=""> 
	<xml> 
		<dso type="grid" parameter="" function="pm_sel_61060010_expenditure">
			<input bind="gridMST">
				<input bind="txtProjectPK" />
				<input bind="lstStatusSearch" />
				<input bind="dtFrom" />
				<input bind="dtTo" />
			</input> 
			<output bind="gridMST" /> 
		</dso> 
	</xml> 
</gw:data>
<gw:data id="dso_kpde00010" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso  type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23" function="pm_sel_61060010_mst" procedure="pm_upd_61060010_mst"> 
			<inout>
				<inout bind="txtMasterPK" />
				<inout bind="dtTransactionDate"/>
				<inout bind="txtDraffer"/>
				<inout bind="lstPayDescrip"/>   
				<inout bind="txtBudgetPK"/>
				<inout bind="txtBudgetCode"/>
				<inout bind="txtBudgetName"/>
				<inout bind="txtVendorPK"/>           
				<inout bind="txtVendorCode"/>
				<inout bind="txtVendorName"/>        
				<inout bind="lstEvidYN"/>
				<inout bind="EvidDate"/>
				<inout bind="lstccy"/>
				<inout bind="txtSuppliedAmount"/>
				<inout bind="txtVAT"/>
				<inout bind="txtWithholdingTax"/>
				<inout bind="txtTotal"/>
				<inout bind="txtDescription"/>
				<inout bind="txtprjectpk_insert"/>
				<inout bind="txtIssueNo"/>
				<inout bind="txtProjectCode"/> 
				<inout bind="txtProjectName"/>
				<inout bind="lstStatus"/>
				<inout bind="txtTotalBookAmt"/>
			</inout>
		</dso> 
	</xml> 
</gw:data>
<gw:data id="dso_Approve" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="process" procedure="pm_pro_61060010_approve" > 
				<input>
					 <input bind="txtMasterPK" /> 
				</input> 
				<output> 
					<output bind="txtMasterPK"/>
				</output>
			</dso> 
		</xml> 
</gw:data>
<gw:data id="dso_cancel" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="process" procedure="pm_pro_61060010_cancel" > 
				<input>
					 <input bind="txtMasterPK" /> 
				</input> 
				<output> 
					<output bind="txtMasterPK"/>
				</output>
			</dso> 
		</xml> 
</gw:data>
<gw:data id="dso_get_exrate" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="pm_pro_61060010_GET_RATE"> 
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
<gw:data id="dso_get_exrate_list" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="pm_sel_61060010_get_rate" > 
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
<table style="background: #BDE9FF; height: 100%; width: 100%">
	<tr>
		<td style="width:30%"></td>
		<td style="width:30%"></td>
		<td style="width:40%"></td>
	</tr>
		<tr>	
			<td colspan="3">
				<table style="width:100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
				
				<td style="width:100%"colspan="2">
					<table style="width:100%" cellpadding="0" cellspacing="0" border="0">
						<tr>
							<td align="center" style="width: 15%"><a title="Click here to select Project" onclick="OnPopUp('project')" href="#tips"  style="text-decoration: none; color=#0000ff"><b>Project</b></a> </td>
							<td style="width: 20%"><gw:textbox id="txtProjectCode" styles='width:100%' /></td>
							<td style="width: 30%"><gw:textbox id="txtProjectName" styles='width:100%' /></td>
							<td style="width: 8%"><gw:imgBtn id="bt_ResetUpper"      img="reset"     alt="Reset" onclick="OnReset('1')" /></td>
							
							<td style="width: 20%"></td>
							<td style="width: 1%"><gw:imgBtn img="search" id="ibtnSearch"   alt="search"  onclick="OnSearch('Master')"/></td>
							<td style="width: 1%"><gw:icon id="idBtnApprove" img="in" text="Approve" styles='width:100%' onclick="OnApprove()" /></td>
							<td style="width: 1%"><gw:icon id="idBtnCancel" img="in" text="Cancel" styles='width:100%' onclick="OnCancel()" /></td>
							<td style="width: 1%"><gw:icon id="idBtnInquiry" img="in" text="Inquiry" styles='width:100%' onclick="OnInquiry()" /></td>
							<td style="width: 1%"><gw:imgbtn id="btAddNew" img="new" alt="Add New"  onclick="OnNew()" /></td>
							<td style="width: 1%"><gw:imgBtn id="ibUpde" img="delete" alt="Delete" 	onclick="OnDelete()" 	 /></td>
							<td style="width: 1%"><gw:imgbtn id="btvhe2" img="save" alt="Save"  onclick="OnSave()" /></td>
						</tr>
						<tr>
							<td align="center" style="width: 15%">Status</td>
							<td style="width: 34%" colspan="2"><gw:list id="lstStatusSearch" styles="width:100%" onchange="OnSearch('Master')"></gw:list ></td>
							<td align="center" style="width: 12%" >Execution Mth/Yr</td>
							<td style="width: 39%" colspan="8" nowrap>
								<gw:datebox id="dtFrom" type="month" lang="1" onchange="OnSearch('Master')" /> ~ <gw:datebox id="dtTo" type="month" lang="1" onchange="OnSearch('Master')" />
							</td>
						</tr>
					</table>
				</td>
				
					
				</table>
				</tr>
			</td> 
		</tr>			
		<tr style="height:94%">
			<td style="background: white; width: 60%;height:100%" id="left" colspan="2">
				<gw:grid id='gridMST' 
							header='_PK|Issue Date|Issue No.|Pay. Descrip.|Budget Item Name|Trans. Co.|Total|Description'
							format='0|0|0|0|0|0|-0|-0' 
							aligns='0|0|1|1|0|0|0|0'
							defaults='|||||||' 
							editcol='0|0|0|0|0|0|0|0' 
							widths='2000|1200|1300|1800|1400|1400|1500|1500'
							autosize="T"
							sorting='T' styles='width:100%; height:100%' oncellclick="OnSearch('Detail')"  />
			</td>
			<td style="background: white; width: 40%" id="right" valign="top">
				<table  style="width: 100%;background: #BDE9FF;" border="0">
				   <tr style="width:100%;height:100%;" >
					   <td style="width: 35%" align="right">*Issu Date</td>
					   <td style="width: 65%"><gw:datebox id="dtTransactionDate" lang="1" /></td>							   
				   </tr>  
				   <tr>
						<td  align="right">Drafter</td>
						<td ><gw:textbox id="txtDraffer"  styles='width:100%' /></td> 
				   </tr>
				   <tr>						
						<td align="right">Status</td> 
						<td ><gw:list id="lstStatus" styles="width:100%"></gw:list ></td>
				   </tr>
				   <tr>
						<td align="right"><a title="Click here to select Project" onclick="OnPopUp('budget')" href="#tips"  style="text-decoration: none; color=#0000ff"><b>Budget Item</b></a></td>
						<td> 
							<table style="width:100%" cellpadding="0" cellspacing="0" > 
								<tr>
									<td style="width: 40%"><gw:textbox id="txtBudgetCode"  styles='width:100%' /></td>
									<td style="width: 60%"><gw:textbox id="txtBudgetName"  styles='width:100%' /></td>
									<td ><gw:imgBtn id="bt_ResetUpper"      img="reset"     alt="Reset"     onclick="OnReset('2')" /></td> 
								</tr>
							</table>
						</td>
				   </tr>
				   <tr>
						<td align="right"><a onclick="OnPopUp('Vendor')" href="#" title="Get customer">Trans.Co.</a></td>
						<td> 
							<table style="width:100%" cellpadding="0" cellspacing="0" > 
								<tr>
									<td style="width: 40%"><gw:textbox id="txtVendorCode"  styles='width:100%' /></td>
									<td style="width: 60%"><gw:textbox id="txtVendorName"  styles='width:100%' /></td>
									<td ><gw:imgBtn id="bt_ResetUpper"      img="reset"     alt="Reset"     onclick="OnReset('3')" /></td> 
								</tr>
							</table>
						</td>
				   </tr>
				   <tr>
						<td align="right"><a title="Click here to select Project" onclick="OnPopUp('Evid')" href="#tips"  style="text-decoration: none; color=#0000ff"><b>Evid(Y/N)</b></a></td>
						<td><gw:list id="lstEvidYN" styles="width:100%"></gw:list ></td>
				   </tr>
				   <tr>
						<td align="right">Evid. Date</td> 
						<td ><gw:datebox id="EvidDate" lang="1" /></td>
				   </tr>
				   <tr>
						<td align="right">Currency</td>
						<td><gw:list id="lstccy"  maxlen = "100" text="" styles='width:100%' csstype="mandatory"/> </td>
				   </tr>
				   <tr>
						<td align="right">Supplied Amount</td>
						<td><gw:textbox id="txtSuppliedAmount" type="number" format="#,###,###,###,###" styles='width:100%' onchange="BookAmt()" /></td>
				   </tr>
				   <tr>
						<td align="right">VAT</td> 
						<td><gw:textbox id="txtVAT" type="number" format="#,###,###,###,###" styles='width:100%'   onchange="BookAmt()" /></td>
					</tr>
				   <tr>
						<td align="right"> Withholding Tax</td>
						<td><gw:textbox id="txtWithholdingTax" type="number" format="#,###,###,###,###" styles='width:100%' onchange="BookAmt()" /></td>
				   </tr>
					<tr>
						<td align="right">Total</td>
						<td><gw:textbox id="txtTotal" type="number" format="#,###,###,###,###" styles='width:100%' /></td>
				   </tr>
				    <tr>						
						<td align="right"><a title="Click here to select Project" onclick="OnPopUp('Pay_Description')" href="#tips"  style="text-decoration: none; color=#0000ff"><b>Pay Description</b></a></td> 
						<td ><gw:list id="lstPayDescrip" styles="width:100%"></gw:list ></td>
				   </tr>
				   <tr>
						<td align="right">Description</td>
						<td><gw:textarea  id="txtDescription" rows=7  text="" styles='width:100%'  /> </td>
						<td style="display:none"><gw:datebox id="txtUSE_DATE" lang="1" styles='width:100%;display:none' /></td>
					</tr>
				</table>
			</td>
	</tr>
</table>
<gw:textbox id="txtMasterPK"		styles='width:100%;display:none' />	
<gw:textbox id="txtIssueNo"		styles='width:100%;display:none' />
<gw:textbox id="txtProjectPK"		styles='width:100%;display:none' />
<gw:textbox id="txtBudgetPK"	styles='width:100%;display:none' />
<gw:textbox id="txtVendorPK"		styles='width:100%;display:none' />
<gw:textbox id="txtTraPK"			styles='width:100%;display:none' />

 <gw:list id="lstCOMPANY" styles='width:100%;display:none' />
 <gw:textbox id="txtbookccy" styles='width:100%;display:none' />
 <gw:textbox id="txt_row" styles='display:none' />
 <gw:textbox id="txtBookRate" styles='width:100%;display:none' />
 <gw:list id="txtccy" onchange="OnGetRate()" styles='width:100%;display:none' />
 <gw:textbox id="txtBK_RATE"  styles='width:100%;display:none' />
 <gw:textbox id="txtTR_RATE" styles="width:100%;display:none" />
 <gw:textbox id="txtTotalBookAmt" styles="width:100%;display:none" />
 <gw:textbox id="txtprjectpk_insert" styles="width:100%;display:none" />
</body>
</html>
