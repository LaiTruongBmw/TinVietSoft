<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Main Contract Other Expenses</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var G_pk=0,
G_project_pk=1,
G_Req_Date=2,
G_Description=3,
G_Slip_No=4,
G_tco_buspartner_pk=5,//customer Name  
G_Owner=6,
G_Owner_Name=7,
G_Currency=8,
G_Progress_Payment_Amt=9,
G_pp_amt_book=10,
G_Advance_Payment_Description=11,
G_adv_amt_book=12,
G_Supplied_Amt=13,
G_supply_amt_book=14
G_VAT_Amt=15,
G_vat_amt_Book=16
G_Currency_Term_Demand_Amt=17,// total_amt  <--> req_amt
G_total_amt_book=18,
G_Retention_Money=19,
G_retention_amt_book=20,
G_Withholding_Tax=21,
G_holdtax_amt_book=22,
G_Basic_Exchg_Rate=23,
G_Per_In_Chrg=24,
G_Confirm_YN=25;
var l_lag="select";
function BodyInit()
{
    System.Translate(document);
	var	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0031') FROM DUAL")%>"; 
	lstEvidYN.SetDataText(data);
	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0032') FROM DUAL")%>"; 
	lstVatType.SetDataText(data);
	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0033') FROM DUAL")%>"; 
	lstRcptCond.SetDataText(data);
    <%=ESysLib.SetGridColumnComboFormat("GridMst", 8,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'ACAB0110' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>; //currency
	<%=ESysLib.SetGridColumnComboFormat("GridMst", 3,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'TPS0030' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>; //G_Description
	<%=ESysLib.SetGridColumnComboFormat("GridMst2", 2,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'ACAB0110' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>; //currency_Grid2
	<%=ESysLib.SetGridColumnComboFormat("GridMst2", 0,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'TPS0030' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>; //G_Description_Grid2
	<%=ESysLib.SetGridColumnComboFormat("GridMst", 5,"select a.tco_buspartner_pk,b.partner_name from tecps_project_contr a, tco_buspartner b where a.del_if = 0 and b.del_if = 0 and a.tco_buspartner_pk = b.pk ")%>; //onwer buspartner_PK
	var ls_company = "<%=ESysLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if=0")%>";
	lstCOMPANY.SetDataText(ls_company);
	lstCOMPANY.value = "<%=session("company_pk") %>";
	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
   var arr  = data.split("|");
   txtbookccy.SetDataText(arr[1]);
   var ls_ccy = "<%=ESysLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
   txtccy.SetDataText(ls_ccy);
   //lstChangeCurrency.SetDataText(ls_ccy);
   MergeHeader();
   dso_get_exrate.Call();  
}
function OnSearch(obj)
{
	if(obj=='1')
	{
		if(txtProject_Pk.text !="")
		{
			dso_kpbp00110.Call("SELECT");
		}
		else
		{
			alert("Please,choose project to search.");
		}
	}
	if(obj=='2')
	{
		if(GridMst.GetGridData(GridMst.row, G_pk) !="")
		{
			txtMasterPK.text=GridMst.GetGridData(GridMst.row, G_pk);
			txtProject_Pk_Grid2.text=GridMst.GetGridData(GridMst.row, G_project_pk);
			txtPP_S_No.text=GridMst.GetGridData(GridMst.row, G_Slip_No);
			dso_htbk00010_control.Call("SELECT");
		}
		else
		{
			OnGetRate();
		}
	}
}
function OnAddNew()
{
	if(txtProject_Pk.text !="")
	{
		GridMst.AddRow();
		ReSetControl(); 
		GridMst.SetGridText(GridMst.rows-1, G_project_pk,txtProject_Pk.text); 
		//GridMst.SetGridText(GridMst.rows-1, G_tco_buspartner_pk,txtProject_Pk.text); 
	}
	else
	{
		alert("Please,choose project to add new.");
	}
}
function ReSetControl()
{
	txtPublisherCode.text=""; 
	txtPublisherName.text=""; 
	lstEvidYN.value=""; 
	lstVatType.value="";  
	txtDescription.text="";  
	txtNoteUsance.text="";  
	dtExpDate.value="";  
	lstRcptCond.value="" ;
	dtIssuDate.value="" ;
}
function OnDelete()
{
	if(confirm('Are you sure to delete ?'))
   {
		GridMst.DeleteRow(); 
		ReSetControl();
		dso_kpbp00110.Call();
	}
}
var l_status='select';
function CheckValidate()
{
    for(var i=1;i<GridMst.rows;i++)
          {
            if(GridMst.GetGridData(i,G_Description) == "")
             {
                alert("Please input description type at row "+ i);
                return false;
             }
            if(GridMst.GetGridData(i,G_Slip_No) == "")
             {
                alert("Please input serial no at row "+ i);
                return false;
             }
             if(GridMst.GetGridData(i,G_tco_buspartner_pk) == "")
             {
                alert("Please input customer name row "+ i);
                return false;
             }
			 if(GridMst.GetGridData(i,G_Currency) == "")
             {
                alert("Please input currency at row "+ i);
                return false;
             }
          }
          return true;
}
function OnSave()
{
	if(CheckValidate())
	{
		l_lag="update";
		txtPP_S_No.text=GridMst.GetGridData(GridMst.row, G_Slip_No);
		dso_kpbp00110.Call();
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
//-------------------------------------------------------------------------------------------------------------------------------------
function OnPopUp(obj)
{
        switch(obj)
        {
                case 'Project':
                            var fpath = System.RootURL + "/form/61/03/61030010_1.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2]; 
									OnSearch('1');		
                            } 
                break; 
				case 'OnPayRcptRegister':
				
						if(txtProject_Pk.text !="")
						{
							if(GridMst.rows-1 > 0 && GridMst.row !='-1')
								{ 
									var path = System.RootURL + "/form/61/03/61030060_pay_rcpt_register_popup.aspx?encode_yn=Y&Project_Pk=" + txtProject_Pk.text+"&master_pk="+url_encode(GridMst.GetGridData(GridMst.row, G_pk))+"&currency="+GridMst.GetGridData(GridMst.row, G_Currency)+"&project_code="+url_encode(GridMst.GetGridData(GridMst.row, G_Owner))+"&project_name="+url_encode(GridMst.GetGridData(GridMst.row, G_Owner_Name))+"&req_date="+url_encode(GridMst.GetGridData(GridMst.row, G_Req_Date))+"&description_type="+url_encode(GridMst.GetGridData(GridMst.row, G_Description))+"&pp_s_no="+url_encode(GridMst.GetGridData(GridMst.row, G_Slip_No))+"&req_amt="+url_encode(GridMst.GetGridData(GridMst.row, G_Currency_Term_Demand_Amt))+"&retention_money="+url_encode(GridMst.GetGridData(GridMst.row, G_Retention_Money))+"&withholding_tax="+url_encode(GridMst.GetGridData(GridMst.row, G_Withholding_Tax));
									var object = System.OpenModal( path ,900 , 500 , 'resizable:yes;status:yes');          
								}
								else
								{
									alert("Please,select item to advance register.");
								}
						}
						else
							{
								alert("Please select project to advance register.");
							}
				break;	
				case 'Customer':
					if(GridMst.col==G_Owner||GridMst.col==G_Owner_Name) 
					{
						var path = System.RootURL + '/form/61/03/61030060_customer.aspx';
						var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
						if ( object != null )
						{
							if (object[0] != 0)
							{
								GridMst.SetGridText(GridMst.row, G_tco_buspartner_pk, object[0]);
								GridMst.SetGridText(GridMst.row, G_Owner, object[1]);
								GridMst.SetGridText(GridMst.row, G_Owner_Name, object[2]);
							}
						}
					}
				break;
				case 'Evid_Y_N':      
						var path = System.RootURL + '/form/61/02/61020010_popup_1.aspx?code=TPS0031';
						var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
						 if (object != null )
						 {
							 lstEvidYN.SetDataText(object[1]);   
						 }
				break;
				case 'VAT_Type':
						var path = System.RootURL + '/form/61/02/61020010_popup_1.aspx?code=TPS0032';
						var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
						 if (object != null )
						 {
							 lstVatType.SetDataText(object[1]);
						 }
				break;
				case 'Pay_Rcpt_Cond':
						var path = System.RootURL + '/form/61/02/61020010_popup_1.aspx?code=TPS0033';
						var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
						 if (object != null )
						 {
							 lstRcptCond.SetDataText(object[1]);
						 }
				break;
        }
} 
//---------------------------------------------------------------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
         switch(obj.id)
         {
			   case "dso_kpbp00110":
					if(l_lag=="update")
					{
						l_lag="select"
						dso_get_master_pk.Call();
					}
                break;
			   case "dso_get_master_pk":
					if(txtMasterPK.text!="")
						 {
							dso_htbk00010_control.StatusUpdate();
							dso_htbk00010_control.Call();
						 }
				break;
				case "dso_htbk00010_control":
						dso_kpbp00110_Grid2.Call("SELECT");
				break;
				case "dso_kpbp00110_Grid2":
						OnGetRate();
						MergeHeader();
				break;
				case "dso_get_exrate_list":
						BookAmt();
				break;
		 }
}
function BookAmt()
{
		var _Propress_payment_Amt = Number(GridMst.GetGridData(GridMst.row, G_Progress_Payment_Amt));
		var _Advance_Pay_Ded_Amt = Number(GridMst.GetGridData(GridMst.row, G_Advance_Payment_Description));
		
		var _Supply_Amt = Math.round(_Propress_payment_Amt-_Advance_Pay_Ded_Amt);//Number(GridMst.GetGridData(GridMst.row, G_Supplied_Amt));
		
		var _Vat_Amt = Number(GridMst.GetGridData(GridMst.row, G_VAT_Amt));
		
		var _Curr_Demand_Amt = Math.round(_Supply_Amt+_Vat_Amt);//Number(GridMst.GetGridData(GridMst.row, G_Currency_Term_Demand_Amt));
		var _Retention_Money_Amt = Number(GridMst.GetGridData(GridMst.row, G_Retention_Money));
		var _Witholding_Tax_Amt = Number(GridMst.GetGridData(GridMst.row, G_Withholding_Tax));
		
		GridMst.SetGridText(GridMst.row, G_Supplied_Amt, _Supply_Amt);  
		GridMst.SetGridText(GridMst.row, G_Currency_Term_Demand_Amt,_Curr_Demand_Amt);
		
		var ccy = GridMst.GetGridData(GridMst.row, G_Currency);
		
		txtccy.value = ccy;//GridMst.GetGridData(GridMst.row, G_Currency);
		var _Propress_payment_Bk_Amt = 0,_Advance_Pay_Ded_Bk_Amt = 0,_Supply_Bk_Amt = 0,
			_Vat_Bk_Amt = 0,_Curr_Demand_Bk_Amt = 0,_Retention_Money_Bk_Amt = 0,_Witholding_Tax_Bk_Amt = 0;
		var _book_rate = Number(txtBookRate.text);
		
		var tr_rate = Number(txtTR_RATE.text);
		
		//alert(txtbookccy.text+""+_book_rate+""+ccy)
		if(txtbookccy.text == 'VND' && _book_rate > 0)
		{
				if(ccy == 'USD')
				{		//alert(txtbookccy.text+""+_book_rate+""+ccy)
						//OnGetRate();
						//alert(tr_rate);
						_Propress_payment_Bk_Amt = Math.round(_Propress_payment_Amt * tr_rate);
						//alert(_Propress_payment_Bk_Amt);
						_Advance_Pay_Ded_Bk_Amt = Math.round(_Advance_Pay_Ded_Amt * tr_rate);
						_Supply_Bk_Amt = Math.round(_Supply_Amt * tr_rate);
						_Vat_Bk_Amt = Math.round(_Vat_Amt * tr_rate);
						_Curr_Demand_Bk_Amt = Math.round(_Curr_Demand_Amt * tr_rate);
						_Retention_Money_Bk_Amt = Math.round(_Retention_Money_Amt * tr_rate);
						_Witholding_Tax_Bk_Amt = Math.round(_Witholding_Tax_Amt * tr_rate);
				}
				else if(ccy == 'VND')
				{
						_Propress_payment_Bk_Amt = Math.round(_Propress_payment_Amt * _book_rate);
						_Advance_Pay_Ded_Bk_Amt = Math.round(_Advance_Pay_Ded_Amt * _book_rate);
						_Supply_Bk_Amt = Math.round(_Supply_Amt * _book_rate);
						_Vat_Bk_Amt = Math.round(_Vat_Amt * _book_rate);
						_Curr_Demand_Bk_Amt = Math.round(_Curr_Demand_Amt * _book_rate);
						_Retention_Money_Bk_Amt = Math.round(_Retention_Money_Amt * _book_rate);
						_Witholding_Tax_Bk_Amt = Math.round(_Witholding_Tax_Amt * _book_rate);
				}
		}
		else if(txtbookccy.text == 'USD' && _book_rate > 0)
		{
				if(ccy == 'USD')
				{
						_Propress_payment_Bk_Amt = Math.round((_Propress_payment_Amt * _book_rate/ _book_rate) * 100) / 100;
						_Advance_Pay_Ded_Bk_Amt = Math.round((_Advance_Pay_Ded_Amt * _book_rate/ _book_rate) * 100) / 100;
						_Supply_Bk_Amt = Math.round((_Supply_Amt * _book_rate/ _book_rate) * 100) / 100;
						_Vat_Bk_Amt = Math.round((_Vat_Amt * _book_rate/ _book_rate) * 100) / 100;
						_Curr_Demand_Bk_Amt = Math.round((_Curr_Demand_Amt * _book_rate/ _book_rate) * 100) / 100;
						_Retention_Money_Bk_Amt = Math.round((_Retention_Money_Amt * _book_rate/ _book_rate) * 100) / 100;
						_Witholding_Tax_Bk_Amt = Math.round((_Witholding_Tax_Amt * _book_rate/ _book_rate) * 100) / 100;
						
				}
				else if(ccy == 'VND')
				{
						_Propress_payment_Bk_Amt = Math.round(_Propress_payment_Amt * _book_rate*100)/100;
						_Advance_Pay_Ded_Bk_Amt = Math.round(_Advance_Pay_Ded_Amt * _book_rate*100)/100;
						_Supply_Bk_Amt = Math.round(_Supply_Amt * _book_rate*100)/100;
						_Vat_Bk_Amt = Math.round(_Vat_Amt * _book_rate*100)/100;
						_Curr_Demand_Bk_Amt = Math.round(_Curr_Demand_Amt * _book_rate*100)/100;
						_Retention_Money_Bk_Amt = Math.round(_Retention_Money_Amt * _book_rate*100)/100;
						_Witholding_Tax_Bk_Amt = Math.round(_Witholding_Tax_Amt * _book_rate*100)/100;
						
				}
		}
		
		
		GridMst.SetGridText(GridMst.row, G_pp_amt_book, _Propress_payment_Bk_Amt);//book_amt 
		GridMst.SetGridText(GridMst.row, G_adv_amt_book, _Advance_Pay_Ded_Bk_Amt);//book_amt
		GridMst.SetGridText(GridMst.row, G_supply_amt_book, _Supply_Bk_Amt);//book_amt
		GridMst.SetGridText(GridMst.row, G_vat_amt_Book, _Vat_Bk_Amt);//book_amt
		GridMst.SetGridText(GridMst.row, G_total_amt_book, _Curr_Demand_Bk_Amt);//G_Currency_Term_Demand_Amt_book
		GridMst.SetGridText(GridMst.row, G_retention_amt_book, _Retention_Money_Bk_Amt);//book_amt
		GridMst.SetGridText(GridMst.row, G_holdtax_amt_book, _Witholding_Tax_Bk_Amt);//book_amt	
		txtPP_S_No.text=GridMst.GetGridData(GridMst.row, G_Slip_No);
}
function OnGetRate()
{
		dso_get_exrate_list.Call();	
}
function MergeHeader()
{
        var fg=GridMst2.GetGridControl(); 	
        if(fg.Rows < 2)
		{
		   GridMst2.AddRow();     
		}    
        fg.FixedRows = 2
        fg.MergeCells =5	
        
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 3, 0, 8)  = "Key Currency"   
		fg.Cell(0, 1, 3, 1, 3) = "Adv.Pay.amt"
	    fg.Cell(0, 1, 4, 1, 4) = "P/P Amt"
	    fg.Cell(0, 1, 5, 1, 5) = "Adv.Pay.Dev" 
		fg.Cell(0, 1, 6, 1, 6) = "Supply Amt" 
		fg.Cell(0, 1, 7, 1, 7) = "Vat Amt" 
		fg.Cell(0, 1, 8, 1, 8) = "Currency Demand Amt" 
		
		fg.Cell(0, 0, 9, 0, 14)  = "Corporation Currency Conversion"   
		fg.Cell(0, 1, 9, 1, 9) = "Adv.Pay.amt"
	    fg.Cell(0, 1, 10, 1, 10) = "P/P Amt"
	    fg.Cell(0, 1, 11, 1, 11) = "Adv.Pay.Dev" 
		fg.Cell(0, 1, 12, 1, 12) = "Supply Amt" 
	    fg.Cell(0, 1, 13, 1, 13) = "Vat Amt" 
		fg.Cell(0, 1, 14, 1, 14) = "Currency Demand Amt" 
	
	    fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Description"	
		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "P/P S/No"	
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Currency"	
} 
function OnCancel()
{
   if(GridMst.row !='-1' && GridMst.GetGridData(GridMst.row, G_Confirm_YN)=='0')
	{
		if(confirm('Are you sure to cancel ?'))
	   {
			l_lag="cancel";
			dso_kpbp00110.Call();
	   }
	}
	else
	{
		alert("Please,choose the customer(uncheck the customer) to cancel.");
	}
}
function OnConfirm()
{
	if(GridMst.row !='-1' && GridMst.GetGridData(GridMst.row, G_Confirm_YN)=='-1')
	{
		if(confirm('Are you sure to confirm ?'))
	   {
			l_lag="confirm";
			dso_kpbp00110.Call();
	   }
	}
	else
	{
		alert("Please,check the customer to confirm.");
	}
} 		 

function OnPrint()
{
    if(txtProject_Pk.text != '')
    {
        var url = System.RootURL + "/reports/kp/bp/kpbp00110.aspx?Master_Pk=" + txtMasterPK.text;
		System.OpenTargetPage(url);  
    }   
    else
    {
        alert('Please select Project !!');
    }
}
</script>
<body>
<gw:data id="dso_kpbp00110_Grid2" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid"  function="pm_sel_61030060_grid2"> 
			<input bind="GridMst2">
				<input bind="txtProject_Pk_Grid2" />
			</input> 
			<output bind="GridMst2" /> 
		</dso> 
	</xml> 
</gw:data>
<!------------------------------------------------------------------------------------->
	<gw:data id="dso_kpbp00110" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25" function="pm_sel_61030060" procedure="pm_upd_61030060"> 
			<input bind="GridMst">
				<input bind="txtProject_Pk" />
			</input> 
			<output bind="GridMst" /> 
		</dso> 
	</xml> 
</gw:data>
<!------------------------------------------------------------------------------------->
<gw:data id="dso_htbk00010_control" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso  type="control" parameter="0,1,2,3,4,5,6,7,8,9" function="pm_sel_61030060_control" procedure="pm_upd_61030060_control"> 
			<inout>
				<inout bind="txtMasterPK" />
				<inout bind="dtIssuDate"/>
				<inout bind="lstEvidYN"/>
				<inout bind="lstVatType"/>
				<inout bind="txtDescription"/>
				<inout bind="txtNoteUsance"/>
				<inout bind="dtExpDate"/>
				<inout bind="lstRcptCond"/>
				<inout bind="txtPublisherCode"/>
				<inout bind="txtPublisherName"/>
			</inout>
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
	 <!----------------get-master---pk--------------->
	<gw:data id="dso_get_master_pk" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="sp_pro_get_master_pk"> 
                <input> 
                	 <input bind="txtPP_S_No" />
                </input>
                <output>
                     <output bind="txtMasterPK"/>
               </output> 
            </dso> 
        </xml> 
</gw:data>
  <table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
		<tr style="height:4%">
			<td>
				<fieldset style="padding:0">
					<table style="width:100%" cellpadding="0" cellspacing="0">
						<tr> 
							<td align="right" width="9%"><a title="Click here to show Project" href="#" style="text-decoration : none" onClick="OnPopUp('Project')">Project&nbsp;</a></td>
							<td width="60%">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="40%"><gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' /></td>
										<td width="60%"><gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' /></td> 
										<td width=""><gw:textbox id="txtProject_Pk" styles='width:100%;display:none' /></td>  
										<td ><gw:imgbtn id="btve2" img="reset" alt="Reset"  onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td> 
									</tr>
								</table>
							</td>  
							
							<td width="40%">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
									    <td  width="20%" ></td>  
										<td   width="3%" align="right" ><gw:imgBtn id="ibSearch" img="search" alt="Inquiry" 	onclick="OnSearch('1')" 	 /></td>  
										<td   width="3%" align="right"><gw:imgBtn id="ibtnUpdte" img="cancel" alt="Cancel confirm" 	onclick="OnCancel()" 	 /></td>
										<td  width="20%" ></td> 		
										<td style="width: 10%"><gw:icon id="idBtnConfirm" img="in" text="Confirm" styles='width:100%' onclick="OnConfirm()" /></td>											
										<td  width="20%" ></td> 
										<td style="width: 15%"><gw:icon id="idBtnRegister" img="in" text="Pay Reception Register" styles='width:100%' onclick="OnPopUp('OnPayRcptRegister')" /></td>	
										<td   width="3%" align="right"><gw:imgBtn id="ibtnAddNew" img="new" alt="Add new" 	onclick="OnAddNew()" 	 /></td>  
										<td   width="3%" align="right" ><gw:imgBtn id="ibDelete" img="delete" alt="Delete" 	onclick="OnDelete()" 	 /></td>   
										<td   width="3%" align="right" ><gw:imgBtn id="ibOnSave" img="save" alt="Print" 	onclick="OnSave()" 	 /></td>  
										<td   width="3%" align="right" ><gw:imgBtn id="ibOnSave" img="excel" alt="Print" 	onclick="OnPrint()" 	 /></td>  

									</tr>
								</table>
							</td>   
						</tr> 
								   
					</table>
				</fieldset>
			</td> 
						
		</tr>
		<tr style="height:45%">
			<td colspan="4">
				<gw:grid   
				id="GridMst"  
				header="pk|_project_pk|*Req. Date|*Req Type|PP S/No|*Customer Name|_Owner|_Owner_Name|*Currency|Progress Amount|_pp_amt_book|Advance deduct|_adv_amt_book|Net Amount|_supply_amt_book|VAT Amt|_vat_amt_Book|Retention Amount|_total_amt_book|Withholding Tax|_retention_amt_book|This moth amount|_holdtax_amt_book|Book Ex.Rate|Per In Chrg|Confirm(Y/N)"   			
				format  ="0|0|4|0|0|0|0|0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-2|0|3"  
				aligns ="1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
				defaults="|||||||||||||||||||||||||"  
				editcol ="1|1|1|1|1|1|1|1|1|1|1|1|1|0|1|1|1|0|1|1|1|1|1|1|0|1"  
				widths  ="1300|2000|800|2000|2500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"  
				styles="width:100%; height:100%" oncellclick="OnSearch('2')"   
				sorting="T" autosize="T" onafteredit="BookAmt()" oncelldblclick="OnPopUp('Customer')"  
				 /> 
			</td>
		</tr> 
		<tr style="height:6%">
			<td colspan="4">
				<table>
				<tr>
						<td style="width: 15%">
						</td>
						<td style="width: 15%">
						</td>
						<td style="width: 10%">
						</td>
						<td style="width: 15%">
						</td>
						<td style="width: 10%">
						</td>
						<td style="width: 15%">
						</td>
						<td style="width: 20%">
						</td>
					</tr>
					<tr>
						<td>
							<a title="Tax Invoice Issuance Date" style="color:#333">Tax Inv. Issu. Date</a>
						</td>
						<td>
							<gw:datebox id="dtIssuDate" lang="1" nullaccept="T" />
						</td>
						<td align="right">
							<a title="Click here to select Evid" onclick="OnPopUp('Evid_Y_N')" href="#tips"  style="text-decoration: none; color=#0000ff"><b>Evid(Y/N)</b></a>
						</td>
						<td colspan="2"> 
							<gw:list id="lstEvidYN"  maxlen = "100" text="" styles='width:100%' csstype="mandatory"/>
						</td>
						<td align="right">  
							<a title="Click here to select VAT Type" onclick="OnPopUp('VAT_Type')" href="#tips"  style="text-decoration: none; color=#0000ff"><b>VAT Type</b></a>
						</td> 
						<td>
							<gw:list id="lstVatType"  maxlen = "100" text="" styles='width:100%' csstype="mandatory"/>
						</td>  
					</tr>
					<tr>
						<td>
							Description 
						</td>
						<td colspan="4">
							<gw:textbox id="txtDescription" styles='width:100%' />
						</td>
						
						<td align="right">
							Note Usance 
						</td>
						<td>
							<gw:textbox id="txtNoteUsance" styles='width:100%' />
						</td>
					</tr>
					<tr>
						<td>
							<a title="" style="color:#333"><a title="Payment Receipt Expiry Date" style="color:#333">Pay.Rcpt Exp.Date</a></a>
						</td>
						<td>
							<gw:datebox id="dtExpDate" lang="1" nullaccept="T" />
						</td>
						<td align="right">
							<a title="Click here to select Payment Receipt Condition" onclick="OnPopUp('Pay_Rcpt_Cond')" href="#tips"  style="text-decoration: none; color=#0000ff"><b>Pay.Rcpt Cond</b></a>    
						</td>
						<td>
							<gw:list id="lstRcptCond"  maxlen = "100" text="" styles='width:100%' csstype="mandatory"/>
						</td>
						<td align="right">
							Publisher
						</td>
						
						<td colspan="2">
							<gw:textbox id="txtPublisherName"  styles='width:100%' readonly="T" />
						</td>
						<td style="display:none">
							<gw:textbox id="txtPublisherCode" styles='width:100%' readonly="T" />
						</td>
						<td style="display:none"><gw:datebox id="txtUSE_DATE" lang="1" /></td>
					</tr>
				</table>
			</td>
		</tr> 
		<tr style="height:45%">
			<td colspan="4">
				<gw:grid   
				id="GridMst2"  
				header="0|1|2|3|4|5|6|7|8|9|10|11|12|13|14"   			
				format ="0|0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0"  
				aligns ="0|1|0|0|0|0|0|0|0|0|0|0|0|0|0"  
				defaults="||||||||||||||"  
				editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
				widths  ="1800|1600|1500|1800|1800|1800|1800|1800|1950|1800|1800|1800|1800|1800|1800"  
				styles="width:100%; height:100%" "   
				sorting="T"   
				 /> 
			</td>
		</tr>
		<td style="display:none"><gw:textbox id="txtProject_Pk_Grid2" styles="display: none" /> </td>	
		<td style="display:none"><gw:textbox id="txtMasterPK" styles="display: none" /> </td>
		<td style="display:none"><gw:textbox id="txtPP_S_No" styles="display: none" /> </td>
		<td style="display:none"><gw:list id="lstCOMPANY" styles='width:100%;display:none' /></td>
		<td style=""><gw:textbox id="txtbookccy" styles='width:100%;display:none' /></td>
		<td style="display:none"><gw:textbox id="txt_row" styles='display:none' /></td>
		<td style="display:none"><gw:textbox id="txtBookRate" styles='width:100%;display:none' /></td>
		<td style="display:none"><gw:list id="txtccy" onchange="OnGetRate()" styles='width:100%;display:none' /></td>
		<td style="display:none"><gw:textbox id="txtBK_RATE"  styles='width:100%;display:none' /></td>
		<td style="display:none"><gw:textbox id="txtTR_RATE" styles="width:100%;display:none" /></td>
  </table>
</body>
</html>
