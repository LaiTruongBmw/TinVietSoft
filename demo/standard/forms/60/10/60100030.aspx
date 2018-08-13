<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 
<script>

var click_tab0   = true;
var click_tab1   = true;
var g_user_pk = "";
var g_emp_id = "";
function BodyInit()
{
    g_user_pk = "<%=Session("USER_PK") %>";
    g_emp_id = "<%=Session("EMP_ID") %>";

    System.Translate(document);
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
	var ls_current     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
	var ls_date        = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
	var ls_Book_ccy    = "<%=CtlLib.SetListDataSQL("select a.code, a.code code_nm from tac_commcode_detail a, tac_commcode_master b where a.del_if = 0 and b.del_if = 0 and a.tac_commcode_master_pk = b.pk and b.id='ACBG0040' and a.def_yn = 'Y'")%>";
	var ls_date1       = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL")%>";
	var ls_Type        = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACAB001') FROM DUAL")%>";
	
	lstType.SetDataText(ls_Type);
	lstType.value = 'AL';
    <%=CtlLib.SetGridColumnComboFormat("grid_amount", 14,"SELECT 'Y','Y' FROM DUAL UNION SELECT 'N','N' FROM DUAL")%>;
	<%=CtlLib.SetGridColumnComboFormat("grid_amount",  9,"SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
	<%=CtlLib.SetGridColumnComboFormat("grid_amount",  7,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'ACCR0040' AND A.DEL_IF = 0 AND B.DEL_IF = 0 ORDER BY CODE, B.CODE_NM")%>;
	ls_Type = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACCR0040') FROM DUAL")%>||ALL";
	lstPayMethod.SetDataText(ls_Type);		
	lstPayMethod.value = '04'; // Bank VND
	lstBook_ccy.SetDataText(ls_Book_ccy);
	lstCompany.SetDataText(ls_data);	
    //dtPay_duefr.SetDataText(ls_date_fr);
    //dtPay_fr.SetDataText(ls_date_fr);
    
    txt_date.SetDataText(ls_date);
    txt_date1.SetDataText(ls_date1);
    
    lstCurrent.SetDataText(ls_current);
    
    txtcust_nm.SetEnable(false);
    txtpl_nm.SetEnable(false);
    
    txtchk.SetDataText("0");
    txtrate.SetDataText("1");
    txttab.text = 0;
    SetGridData();
    Control_Menu();
    txtUser_PK.SetDataText(g_user_pk);
    txtEmp_ID.SetDataText(g_emp_id);
    //alert(g_emp_id);
    dso_getCompany.Call();
    //dso_sel_booksrate.Call();
    txtseq.GetControl().focus();   
}

function SetGridData()
{
    var fg  = grid_amount.GetGridControl();
        
    if (lstBook_ccy.GetData() == 'VND')
    {
        fg.ColFormat(6)     = "#,###,###,###,###,###,###,###,###,###R";
        fg.ColFormat(12)    = "#,###,###,###,###,###,###,###,###,###R";
        fg.ColFormat(13)    = "#,###,###,###,###,###,###,###,###,###R";
    }
    else
    {
        fg.ColFormat(6)     = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(12)    = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(13)    = "#,###,###,###,###,###,###,###,###.##R";
    }
    fg.ColFormat(5)     = "#,###,###,###,###,###,###,###,###.##R";
    fg.ColFormat(11)    = "#,###,###,###,###,###,###,###,###.##R";
	fg.ColFormat(18)    = "#,###,###,###,###,###,###,###,###R";
	fg.ColFormat(10)    = "#,###,###,###,###,###,###,###,###.##R"; // Pay Rate
	fg.ColFormat(19)    = "#,###,###,###,###,###,###,###,###R";
	fg.ColFormat(4)    = "#,###,###,###,###,###,###,###,###.##R";
}

function Reset_Cust()
{
    txtcust_cd.SetDataText("");
    txtcust_nm.SetDataText("");
    txtcust_pk.SetDataText("");
}

function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise
}

function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
	var x = c.toUpperCase().charCodeAt(0);
	event.keyCode = x;
}

function OnChkAll()
{
	var l_pay_trans = 0, l_pay_bkamt = 0 ;
	var l_ap_bkamt = 0, l_ap_trans = 0;
	var l_pay_rate = 0, l_ap_rate = 0, l_pay_bk_rate = 0;
	l_pay_rate = Number(txtrate.GetData());
    if (grid_amount.rows > 1)
    {
        if (txtchk.GetData() == 0)
        {
            btnChk.text="UnChk";
            txtchk.SetDataText("1");
            for (i = 1; i< grid_amount.rows; i++)
            {
                grid_amount.SetGridText(i, 0, -1);
				grid_amount.SetGridText(i, 7, lstPayMethod.value); //pay method
				grid_amount.SetGridText(i, 9, lstCurrent.value);	// pay ccy
				grid_amount.SetGridText(i, 10, txtrate.GetData());	// pay rate
				OnCalcPayAmount(i);
            }
        }
        else
        {
            btnChk.text="ChkAll";
            txtchk.SetDataText("0");
            for (i = 1; i< grid_amount.rows; i++)
            {
                grid_amount.SetGridText(i, 0, 0);
            }
        }
    }
}

function OnCheck()
{
    var std_dt, etd_dt ;
    std_dt = dtPay_duefr.GetData();
	etd_dt = dtPay_dueto.GetData();
	if (parseInt(etd_dt) < parseInt(std_dt))
	{
		alert(' End Pay Due Date can’t be earlier than start date!!!'+'\n'+'Ngày kết thúc không thể nhỏ hơn ngày bắt đầu!!!');
		return false;
	}
	std_dt = dtPay_fr.GetData();
	etd_dt = dtPay_to.GetData();
	if (parseInt(etd_dt) < parseInt(std_dt))
	{
		alert(' End Pay Date can’t be earlier than start date!!!'+'\n'+'Ngày kết thúc không thể nhỏ hơn ngày bắt đầu!!!');
		return false;
	}
	return true;
}

function OnSearch()
{
    if (idTab_Child.GetCurrentPageNo() == 0)
    {
        click_tab0 = false;
    }
    else if (idTab_Child.GetCurrentPageNo() == 1)
    {
        click_tab1 = false;
    }
    grid_amount.ClearData();
    grid_invoice.ClearData();
    
    if (OnCheck())
    {
        if (txttab.GetData() == 0)
        {
            dso_sel_grd_approval_pay_method.Call('SELECT');
			
        }
        else if (txttab.GetData() == 1)
        {
            
            dso_sel_grd_payable_invoice.Call('SELECT');
        }
    }
}

function Popup_Cust()
{
    var fpath   = System.RootURL + '/standard/forms/60/08/60080030_popup_customer.aspx';
    var object  = System.OpenModal(fpath , 800 , 500 , 'resizable:yes;status:yes'); 
    if ( object != null )
    {
        if (object[1] != 0)
        {
            txtcust_pk.text    = object[0];
            txtcust_nm.text    = object[2];
            txtcust_cd.text    = object[1];
        }
    }
}

function Control_Menu()
{
    btnConfirm.SetEnable(false);
    btnCancel.SetEnable(false);
    btnChk.SetEnable(false);
    if (rbstatus.GetData() == 1)
    {
        btnConfirm.SetEnable(true);
    }
    else
    {
        btnCancel.SetEnable(true);
    }
    btnChk.SetEnable(true);
    SetTotal();
}

function EnableTab(bool)
{
    click_tab0 = bool;
    click_tab1 = bool;
}

function onSearchTab()
{
    
    if (idTab_Child.GetCurrentPageNo() == 0)
    {
        if (click_tab0 == true)
        {
            EnableTab(true);
            click_tab0 = false;
            txttab.text = 0;
            OnSearch();
        }
    }
    else if (idTab_Child.GetCurrentPageNo() == 1)
    {
        if (click_tab1 == true)
        {
            EnableTab(true);
            click_tab1 = false;
            txttab.text = 1;
            OnSearch();
        }
    }
    Control_Menu();
}

function OnCheck_Method()
{
	var tmp, i;
    for (i=1; i<grid_amount.rows; i++)
	{
		if(grid_amount.GetGridData(i, 0)=='-1')
		{
			tmp = grid_amount.GetGridData(i, 7);
			if (tmp == '')
			{
				alert('   You must choose payment method in row '+ i +'\n'+'Bạn hãy chọn phương thức thanh toán ở dòng '+ i);
				return false;
			}
		}	
	}
	return true;
}

function OnApproval()
{
    txtseq_str.text = "";
    txtindex.text   = "";
    var data;
	data = "";
	var ctrl 	= grid_amount.GetGridControl();
	var rows 	= ctrl.Rows;
	var index;
	index  = 0;
	if (!OnCheck_Method())
	{
	    return;
	}
	for (i=1; i<ctrl.Rows; i++)
	{
		var tmp = grid_amount.GetGridData(i, 0);
		if (tmp == "-1")
		{
			index = index + 1 ;
		}
	}
	if(index == 0)
	{
		alert('Please select check SEQ for confirm!!!'+'\n'+'  Bạn hãy chọn số SEQ để Confirm!!!')
		return;
	}
	else
	{
		if(confirm('Are you sure you want to confirm?'+'\n'+'Bạn có chắc Confirm số SEQ này?'))
		{
	        for (i = 1; i < grid_amount.rows; i++)
	        {
	            var tmp = grid_amount.GetGridData(i, 0);
		        if (tmp == "-1")
		        {
	                if (grid_amount.GetGridData(i, 17) == '')
	                {
	                    grid_amount.SetRowStatus(i, 0x20);
	                    /*for (j = 1; j< grid_amount.rows; j++)
                        {
                            grid_amount.SetGridText(j, 18, txtBookRate.GetData());
                        }*/
	                }
	                else
	                {
	                    grid_amount.SetRowStatus(i, 0x10);
	                }
                }
	        }
	        dso_sel_grd_approval_pay_method.Call();
        }
    }
}

function OnAppCancel()
{
    txtseq_str.text = "";
    txtindex.text   = "";
    var data;
	data = "";
	var ctrl 	= grid_amount.GetGridControl();
	var rows 	= ctrl.Rows;
	var index;
	index  = 0;
	
	for (i=1; i<ctrl.Rows; i++)
	{
		var tmp = grid_amount.GetGridData(i, 0);
		if (tmp == "-1")
		{
			index = index + 1;
		}
	}
	if(index == 0)
	{
		alert('Please select check SEQ for cancel Approval!!!'+'\n'+'  Bạn hãy chọn số SEQ để Cancel Approval!!!');
		return;
	}
	else
	{
		if(confirm('Are you sure you want to cancel Approval?'+'\n'+'Bạn có chắc Cancel Approval số SEQ này?'))
		{
	        for (i = 1; i < grid_amount.rows; i++)
	        {
	            var tmp = grid_amount.GetGridData(i, 0);
		        if (tmp == "-1")
		        {
		            grid_amount.SetRowStatus(i, 0x40);
                }
	        }
	        dso_upd_grd_unapp_amount.Call();
        }
    }
}

function SetTotal()
{
    if (grid_amount.rows > 1)
    {
        var ctrl = grid_amount.GetGridControl();
	    btnChk.SetEnable(true);
    }
    btnChk.text="ChkAll";
    txtchk.SetDataText("0");   
}

function OnPrint()
{
    alert("Not Yet");
    return;
}

function RowEdit()
{
    if(event.col == 7 ) //pay method
    {
        if(grid_amount.GetGridData(event.row, 7) == "02" || grid_amount.GetGridData(event.row, 7) == "04") // Cash VND Or Bank VND
        {
            grid_amount.SetGridText(event.row, 9, "VND");
        }
        else
        {
            if(grid_amount.GetGridData(event.row, 7) == "03") // BAnk FG - USD
            {
                grid_amount.SetGridText(event.row, 9, "USD");
            }
            else if(grid_amount.GetGridData(event.row, 7) == "08") // BAnk FG - YEN
            {
                grid_amount.SetGridText(event.row, 9, "JPY");
            }
            else if(grid_amount.GetGridData(event.row, 7) == "01") // Cash FG
            {
                grid_amount.SetGridText(event.row, 9, "USD");
            }
        }
		var l_pay_type = grid_amount.GetGridData(event.row, 7); //pay method
		if(l_pay_type == '02' || l_pay_type == '04' )
		{
			grid_amount.SetGridText(event.row, 9, 'VND'); // pay ccy
			grid_amount.SetGridText(event.row, 10, 1); // pay rate			
			OnCalcPayAmount(event.row);
		}
		else if(l_pay_type == '01' || l_pay_type == '03' )
		{
			grid_amount.SetGridText(event.row, 9, 'USD'); // pay ccy
			RowChange();
		}
		
    }
    else if(event.col == 9 ) //pay ccy
    {
        if(grid_amount.GetGridData(event.row, 7) == "02" || grid_amount.GetGridData(event.row, 7) == "04") // Cash VND Or Bank VND
        {
            grid_amount.SetGridText(event.row, 9, "VND");
        }
        else
        {
            if(grid_amount.GetGridData(event.row, 7) == "03") // BAnk FG - USD
            {
                grid_amount.SetGridText(event.row, 9, "USD");
            }
            else if(grid_amount.GetGridData(event.row, 7) == "08") // BAnk FG - YEN
            {
                grid_amount.SetGridText(event.row, 9, "JPY");
            }
            else if(grid_amount.GetGridData(event.row, 7) == "01") // Cash FG
            {
                grid_amount.SetGridText(event.row, 9, "USD");
            }
        }
        RowChange();
    }
    else if(event.col == 10) // pay tr rate
    {
        //onChangeRate(event.row);
		var l_pay_ccy = grid_amount.GetGridData(event.row, 9);
		var l_pay_trrate = Number(grid_amount.GetGridData(event.row, 10));
		if(l_pay_ccy == lstBook_ccy.value)
		{
			grid_amount.SetGridText(event.row, 18, l_pay_trrate);
		}
		OnCalcPayAmount(event.row);
    }
	else if(event.col == 18) // pay bk rate
	{
		//onInputRate(event.row);
		var l_pay_ccy = grid_amount.GetGridData(event.row, 9); // payment currency
		var l_pay_bkrate = Number(grid_amount.GetGridData(event.row, 18)); // payment ex rate		
		if(l_pay_ccy == lstBook_ccy.value)
		{
			grid_amount.SetGridText(event.row, 10, l_pay_bkrate);
		}		
		OnCalcPayAmount(event.row);
	}
	else if(event.col == 11) // pay trans
	{
		OnCalcPayAmount(event.row);
	}
}

function RowChange()
{
    txtcur.text     = '';
    txt_row.text    = event.row;
    txtcur.text     = grid_amount.GetGridData(event.row, 9);
	txt_date.text 	= grid_amount.GetGridData(event.row, 8);
    dso_get_rate1.Call();
}

function OnChangeCurrent()
{
    dso_get_rate.Call();
}

function onSetBookRate()
{
    if (txtBookRate.GetData() == 0)
    {
        alert('You must type in day ratio: '+ txt_date.GetData() +'\n'+'Bạn hãy nhập tỉ giá ngày: '+ txt_date.GetData());
        return;
    }
	// 
}

function onCheckCur()
{
    var ls_ccy      = grid_amount.GetGridData(txt_row.text, 9);
    var rate        = grid_amount.GetGridData(txt_row.text, 10);
    if ((ls_ccy == 'VND') && (rate > 1))
    {
        alert('Base rate (VND) is not greater than one!!!'+'\n'+'Tỉ lệ quy đổi (VND) không được lớn hơn 1!!!')
        return false;
    }
    if (rate < 1)
    {
        alert('You must input Base Rate to date: '+ txt_date.GetData() +'\n'+'       Bạn hãy nhập tỉ giá ngày: '+ txt_date.GetData())
        return false;
    }
    return true;
}

function SetCurrent()
{
    var rate        = txtrate1.GetData(); // pay_rate
	grid_amount.SetGridText(txt_row.text, 10, rate); //pay_rate
	if (!onCheckCur())
    {
        return;
    }
    var famt        = Number(grid_amount.GetGridData(txt_row.text, 5)); // AP Trans
	var ap_rate 	= Number(grid_amount.GetGridData(txt_row.text, 4)); // AP Rate
    var ls_ccy      = grid_amount.GetGridData(txt_row.text, 9);// pay ccy
	var ls_ap_ccy	= grid_amount.GetGridData(txt_row.text, 3);// ap_ccy
	var ap_bk_rate	= Number(grid_amount.GetGridData(txt_row.text, 19));// ap_book_rate
    var ls_bookccy  = txtBookRate.GetData();
    var ap_famt     = Number(grid_amount.GetGridData(txt_row.text, 6)); // AP Books
	if(ls_ccy == lstBook_ccy.value)
	{
		grid_amount.SetGridText(txt_row.text, 18, rate); //pay_book_rate
	}	
	var pay_bkrate  = Number(grid_amount.GetGridData(txt_row.text, 18)); // Pay book rate	
	OnCalcPayAmount(Number(txt_row.text));
}

function onChangeRate(row)
{
    txt_row.text = row;
    
    var ls_ccy          = grid_amount.GetGridData(txt_row.text, 9); // pay ccy
    var ls_bookccy      = txtBookRate.GetData();
	var rate            = Number(grid_amount.GetGridData(txt_row.text, 10)); // pay rate
	var famt            = Number(grid_amount.GetGridData(txt_row.text, 5)); // ap trans	
	var ap_famt         = Number(grid_amount.GetGridData(txt_row.text, 6));//ap book amt
	var ap_rate 	= Number(grid_amount.GetGridData(txt_row.text, 4)); // AP Rate
	var pay_bkrate = Number(grid_amount.GetGridData(txt_row.text, 18)); // Payment book rate
	var ap_bk_rate	= Number(grid_amount.GetGridData(txt_row.text, 19));// ap_book_rate
	var ls_ap_ccy	= grid_amount.GetGridData(txt_row.text, 3);// ap_ccy
	
	if (!onCheckCur())
    {
        return;
    }
	var pay_tramt = 0;
	var pay_amt = 0;
	if(ls_ccy == ls_ap_ccy && ls_ap_ccy == 'VND' && ap_bk_rate == pay_bkrate)
	{
		pay_tramt = famt;
		pay_amt = ap_famt ;
	}
	else
	{
		if(ls_ccy == 'VND')
		{
			pay_tramt 	= Math.round(Number(famt * ap_rate / rate));	  // pay trans		
		}	
		else
		{
			pay_tramt 	= Number(Math.round(Number(famt * ap_rate / rate) * 100) / 100) ;	  // pay trans		
		}
		if(lstBook_ccy.value == 'VND')
		{
			pay_amt 	= Math.round(Number(famt * ap_rate / pay_bkrate)); // pay book	
		}
		else
		{
			pay_amt 	= Number(Math.round(Number(famt * ap_rate / pay_bkrate) * 100) / 100); // pay book	
		}	
	}	
	grid_amount.SetGridText(txt_row.text, 11, pay_tramt);	
	grid_amount.SetGridText(txt_row.text, 12, pay_amt);

    if (ls_ccy == lstBook_ccy.GetData())
    {
        //grid_amount.SetGridText(txt_row.text, 12, famt);
        grid_amount.SetGridText(txt_row.text, 13, ap_famt - pay_amt);
    }
    else
    {
        //grid_amount.SetGridText(txt_row.text, 12, Math.round(Number(famt*(rate/ls_bookccy)*100))/100);
        //grid_amount.SetGridText(txt_row.text, 13, ap_famt - Math.round(Number(famt*(rate/ls_bookccy)*100))/100);
		grid_amount.SetGridText(txt_row.text, 13, ap_famt - pay_amt);
    }
    if (grid_amount.GetGridData(txt_row.text, 13) != 0)
    {
        grid_amount.SetGridText(txt_row.text, 14, 'Y');
    }
    else
    {
        grid_amount.SetGridText(txt_row.text, 14, 'N');
    }
}

function onChangeGrid()
{
    if (grid_amount.rows < 2) return;
    for (i = 1; i < grid_amount.rows; i++)
    {
        grid_amount.SetGridText(i,  9, lstCurrent.GetData()); // pay ccy
        grid_amount.SetGridText(i, 10, txtrate.GetData()); // pay tr rate
		if(lstCurrent.GetData() == lstBook_ccy.value)	
		{
			grid_amount.SetGridText(i, 18, txtrate.GetData()); // pay bk rate
		}
        //onChangeRate(i);
		OnCalcPayAmount(i);
    }
}

function Popup_PL()
{
    var fpath = System.RootURL + "/standard/forms/60/08/60080030_popup_bank.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ACNT.SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
    var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
    if ( object != null ) 
    {
        if (object[0] != 0)
        {
            txtpl_pk.SetDataText(object[2]); // PK
            txtpl_cd.SetDataText(object[0]); // Item Code
            txtpl_nm.SetDataText(object[1]); // Item Name Local
        }
    }
}

function Reset_PL()
{
    txtpl_pk.SetDataText("");
    txtpl_cd.SetDataText("");
    txtpl_nm.SetDataText("");
}

function Popup_Type()
{
    var fpath   = System.RootURL + '/standard/forms/ag/ga/agga00090.aspx';
	var wWidth  = 950;
	var wHeight = 580;
	var x = Math.round((screen.availWidth - wWidth)/2);
	var y = Math.round((screen.availHeight - wHeight)/2);
	
	var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
	   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
	   "lef="+ x +",top=" + y;			
    var object = System.OpenModal(fpath, wWidth, wHeight, features);
}

function onInputRate(row)
{
	txt_row.text = row;
    var rate = Number(grid_amount.GetGridData(txt_row.text, 10));
	var famt        = Number(grid_amount.GetGridData(txt_row.text, 11));
    var ls_ccy      = grid_amount.GetGridData(txt_row.text, 9);
    var ls_bookccy  = Number(grid_amount.GetGridData(txt_row.text, 18));
    var ap_famt     = Number(grid_amount.GetGridData(txt_row.text, 6));
    if (!onCheckCur())
    {
        return;
    }
    if (ls_ccy == lstBook_ccy.GetData())
    {
        grid_amount.SetGridText(txt_row.text, 12, famt);
        grid_amount.SetGridText(txt_row.text, 13, ap_famt - famt);
    }
    else
    {		
        grid_amount.SetGridText(txt_row.text, 12, Math.round(Number(famt*(rate/ls_bookccy)*100))/100);
        grid_amount.SetGridText(txt_row.text, 13, ap_famt - Math.round(Number(famt*(rate/ls_bookccy)*100))/100);
    }
    if (grid_amount.GetGridData(txt_row.text, 13) != 0)
    {
        grid_amount.SetGridText(txt_row.text, 14, 'Y');
    }
    else
    {
        grid_amount.SetGridText(txt_row.text, 14, 'N');
    }	
}
//-----------------------------------------------------
function OnCalcPayAmount(lrow)
{
	txt_row.text = lrow;
	var pay_trrate            = Number(grid_amount.GetGridData(lrow, 10)); // pay rate
	if (!onCheckCur())
    {
        return;
    }
	var ls_ap_ccy	= grid_amount.GetGridData(lrow, 3);// ap_ccy
	var ap_rate 	= Number(grid_amount.GetGridData(lrow, 4)); // AP Rate
	var ap_bk_rate	= Number(grid_amount.GetGridData(lrow, 19));// ap_book_rate	
	var ap_tramt    = Number(grid_amount.GetGridData(lrow, 5)); // ap trans	
	var ap_bkamt    = Number(grid_amount.GetGridData(lrow, 6));//ap book amt	
    var l_pay_ccy          = grid_amount.GetGridData(lrow, 9); // pay ccy	    
	var pay_bkrate = Number(grid_amount.GetGridData(lrow, 18)); // Payment book rate
	var pay_rate = Number(grid_amount.GetGridData(lrow, 10)); // Pay RAte
	var pay_tramt = 0, pay_bkamt = 0;
// A. BOOK = USD	 	
	if(lstBook_ccy.value == 'USD')
	{	//1. AP_CCy = VND
		if(ls_ap_ccy == 'VND') 
		{  
			if(l_pay_ccy == 'VND') //1.a 
			{
				pay_tramt = grid_amount.GetGridData(lrow, 11); // payment trans amt
				
				pay_bkamt = Math.round(pay_tramt / pay_bkrate * 100) / 100 ;					
				
				grid_amount.SetGridText(lrow, 12, pay_bkamt);				
				//Diff Books
				if(ap_bk_rate != pay_bkrate)
				{
					grid_amount.SetGridText(lrow, 13, pay_bkamt - (Number(Math.round((pay_tramt / ap_bk_rate) * 100)) / 100) );
					grid_amount.SetGridText(lrow, 14, 'Y');
				}
				else
				{
					grid_amount.SetGridText(lrow, 14, 'N');
					grid_amount.SetGridText(lrow, 13, '' );
				}
			}
			else // 1.b pay = USD 
			{
				if(pay_trrate == ap_bk_rate)
				{
					pay_tramt = ap_bkamt ;									
				}
				else
				{					
					pay_tramt = ap_tramt / pay_trrate;
					pay_tramt = Math.round(Number(pay_tramt * 100)) / 100;					
				}	
				pay_bkamt = pay_tramt ;
				grid_amount.SetGridText(lrow, 11, pay_tramt);
				grid_amount.SetGridText(lrow, 12, pay_bkamt);								
				// Chenh lech ty gia
				grid_amount.SetGridText(lrow, 13, Number(ap_bkamt - pay_bkamt));
				if (grid_amount.GetGridData(lrow, 13) != 0)
				{
					grid_amount.SetGridText(lrow, 14, 'Y');
				}
				else
				{
					grid_amount.SetGridText(lrow, 14, 'N');
				}										
			}
		}
		// 2. AP_CCy = USD
		else
		{	//2.a
			if(l_pay_ccy == 'USD')
			{
				pay_tramt = ap_tramt;
				pay_bkamt = ap_bkamt;
				grid_amount.SetGridText(lrow, 11, pay_tramt);
				grid_amount.SetGridText(lrow, 12, pay_bkamt);				
				// Khong chenh lech ty gia
				grid_amount.SetGridText(lrow, 13, 0);
				grid_amount.SetGridText(lrow, 14, 'N');				
			}
			else // 2.b l_pay_ccy = VND
			{				
				pay_tramt = Math.round(ap_tramt * pay_trrate);
				if(ap_bk_rate == pay_bkrate)
					pay_bkamt = ap_bkamt ;
				else
					pay_bkamt = Math.round(Number(pay_tramt / pay_bkrate) * 100) / 100 ;
				grid_amount.SetGridText(lrow, 11, pay_tramt);
				grid_amount.SetGridText(lrow, 12, pay_bkamt);									
				// Chenh lech ty gia
				grid_amount.SetGridText(lrow, 13, Number(ap_bkamt - pay_bkamt));
				if (grid_amount.GetGridData(lrow, 13) != 0)
				{
					grid_amount.SetGridText(lrow, 14, 'Y');
				}
				else
				{
					grid_amount.SetGridText(lrow, 14, 'N');
				}															
			}
		}	
	}	
     //B.BOOK = VND
	else 
	{
		pay_tramt = grid_amount.GetGridData(lrow, 11); // pay trans		
		pay_bkamt = Number(pay_tramt * pay_trrate) ;		
		grid_amount.SetGridText(lrow, 12, pay_bkamt);
		// AP_ccy = Pay_ccy = USD && AP_Rate != Pay_Rate
		if(ls_ap_ccy == l_pay_ccy && ls_ap_ccy == 'USD' && ap_rate != pay_rate)
		{
		    grid_amount.SetGridText(lrow, 14, 'Y');
		    grid_amount.SetGridText(lrow, 13, Number(pay_bkamt - ap_bkamt));
		}
		else
		{
		    grid_amount.SetGridText(lrow, 14, 'N');
		    grid_amount.SetGridText(lrow, 13, 0);
		}
	}	
}

//-----------------------------------------------------
function OnDefaultPayAmount()
{
    var i;
    var l_ap_trans = 0, l_ap_books = 0, l_pay_trans = 0, l_pay_books = 0;
	Control_Menu();
	//Sum total
	if(grid_amount.rows > 1)
	{
	    for(i = 1; i < grid_amount.rows; i++)
	    {
	        l_ap_trans += Number(grid_amount.GetGridData(i, 5));
	        l_ap_books += Number(grid_amount.GetGridData(i, 6));
	        l_pay_trans += Number(grid_amount.GetGridData(i, 11));
	        l_pay_books += Number(grid_amount.GetGridData(i, 12));	        
	    }
	    grid_amount.AddRow();
	    grid_amount.SetCellBgColor(grid_amount.rows-1, 0, grid_amount.rows-1, grid_amount.cols-1, 0xA9EBD7);
	    grid_amount.SetGridText(grid_amount.rows - 1, 5, l_ap_trans);
	    grid_amount.SetGridText(grid_amount.rows - 1, 6, l_ap_books);
	    grid_amount.SetGridText(grid_amount.rows - 1, 11, l_pay_trans);
	    grid_amount.SetGridText(grid_amount.rows - 1, 12, l_pay_books);	    
	}
	if(rbstatus.value == 1)
	{
		/*var i ;
		for(i = 1; i < grid_amount.rows ; i++)
		{
			OnCalcPayAmount(i);
		}*/	
	}
}
//-----------------------------------------------------
function OnReport()
{
	var url = "";
	var rqt = "";
	if(rbstatus.value == "1")
	{
	    rqt = "?l_compk=" + lstCompany.GetData() + '&l_seq=&l_paydue_fr=&l_paydue_to=&l_datefr=' + dtPay_fr.GetData() + '&l_dateto=' + dtPay_to.GetData() + '&l_tco_buspartner_pk=' + txtcust_pk.GetData() + '&l_voucher_no=' + txtvoucher_no.GetData() + '&l_tac_abplcenter_pk=' + txtpl_pk.GetData() + '&l_type=' + lstType.GetData() + '&l_pay_date=' + dtPay_Date.GetData() + '&bal_opt=0';
		url =System.RootURL + '/standard/reports/60/10/60100030_unappr.aspx' + rqt;
		if (confirm("Are you sure you want to report ?" ))
		{
			System.OpenTargetPage(url, 'newform');
			return;
		}
	}
	else if(rbstatus.value == "2")
	{
        rqt = "?l_compk=" + lstCompany.GetData() + '&l_seq=' + txtseq.GetData() + '&l_paydue_fr=' + dtPay_duefr.GetData() + '&l_paydue_to=' + dtPay_dueto.GetData() + '&l_datefr=' + dtPay_fr.GetData() + '&l_dateto=' + dtPay_to.GetData() + '&l_tco_buspartner_pk=' + txtcust_pk.GetData() + '&l_voucher_no=' + txtvoucher_no.GetData() + '&l_tac_abplcenter_pk=' + txtpl_pk.GetData() + '&l_type=' + lstType.GetData() + '&l_pay_date=' + dtPay_Date.GetData() + '&bal_opt=0';
      //rqt = "?l_compk=" + lstCompany.GetData() + '&l_seq=&l_paydue_fr=&l_paydue_to=&l_datefr=' + dtPay_fr.GetData() + '&l_dateto=' + dtPay_to.GetData() + '&l_tco_buspartner_pk=' + txtcust_pk.GetData() + '&l_voucher_no=' + txtvoucher_no.GetData() + '&l_tac_abplcenter_pk=' + txtpl_pk.GetData() + '&l_type=' + lstType.GetData() + '&l_pay_date=' + dtPay_Date.GetData() + '&bal_opt=';
		url =System.RootURL + '/standard/reports/60/10/60100030_approved.aspx' + rqt;
		if (confirm("Are you sure you want to report ?" ))
		{
			System.OpenTargetPage(url, 'newform');
			return;
		}	
	}
}
//-----------------------------------------------------
function OnDataReceive(iObj)
{
    if(iObj.id == 'dso_getCompany')
    {
        dso_sel_booksrate.Call();
    }
}

//-----------------------------------------------------
function OnChangeCompany()
{
    grid_amount.ClearData();
    grid_invoice.ClearData();
    dso_get_rate.Call();
}
//-----------------------------------------------------
function OnSetPayMethod()
{
    var i;
    for(i = 1; i < grid_amount.rows; i++)
    {
        grid_amount.SetGridText(i, 7, lstPayMethod.value);
        if(lstPayMethod.value == "02" || lstPayMethod.value == "04") // Cash VND Or Bank VND
        {
            grid_amount.SetGridText(i, 9, "VND");
        }
        else
        {
            if(lstPayMethod.value == "03") // Bank FG - USD
            {
                grid_amount.SetGridText(i, 9, "USD");
            }
            else if(lstPayMethod.value == "08") // BAnk FG - YEN
            {
                grid_amount.SetGridText(i, 9, "JPY");
            }
            else if(lstPayMethod.value == "01") // Cash FG
            {
                grid_amount.SetGridText(i, 9, "USD");
            }
        }        
    }
    if(lstPayMethod.value == "02" || lstPayMethod.value == "04")
    {
        lstCurrent.value = "VND";
    }
    else
    {
        if(lstPayMethod.value == "03") // Bank FG - USD
        {
            lstCurrent.value = "USD";
        }
        else if(lstPayMethod.value == "08") // BAnk FG - YEN
        {
            lstCurrent.value = "JPY";
        }
        else if(lstPayMethod.value == "01") // Cash FG
        {
            lstCurrent.value = "USD";
        }    
    }    
}
//-----------------------------------------------------
</script>
<body style="margin:0; padding:0;">

    <gw:data id="dso_sel_grd_approval_pay_method" onreceive="OnDefaultPayAmount()">
        <xml>
            <dso type="grid" parameter="7,9,10,11,12,14,15,16,17,18" function="ac_sel_60100030_approve_method" procedure="ac_pro_60100030_APPROVE_METHOD">
                <input bind="grid_amount">
                    <input bind="lstCompany"/>
                    <input bind="rbstatus"/>
                    <input bind="txtseq"/>
                    <input bind="dtPay_Date"/>
                    <input bind="dtPay_Date"/>
                    <input bind="dtPay_fr"/>
                    <input bind="dtPay_to"/>
                    <input bind="txtcust_pk"/>
                    <input bind="txtvoucher_no"/>
                    <input bind="txtpl_pk"/>
                    <input bind="lstType"/>
                    <input bind="txttab"/>
					<input bind="lstPayMethod"/>
					<input bind="txtEmp_ID"/>
                </input>
                <output bind="grid_amount"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_sel_grd_payable_invoice" onreceive="Control_Menu()">
        <xml>
            <dso type="grid" parameter="7,9,10" function="ac_sel_60100030_approve_method" procedure="ac_sel_60100030_entry_4PAYABLE">
                <input bind="grid_invoice">
                    <input bind="lstCompany"/>
                    <input bind="rbstatus"/>
                    <input bind="txtseq"/>
                    <input bind="dtPay_Date"/>
                    <input bind="dtPay_Date"/>
                    <input bind="dtPay_fr"/>
                    <input bind="dtPay_to"/>
                    <input bind="txtcust_pk"/>
                    <input bind="txtvoucher_no"/>
                    <input bind="txtpl_pk"/>
                    <input bind="lstType"/>
                    <input bind="txttab"/>
					<input bind="lstPayMethod"/>
					<input bind="txtEmp_ID"/>
                </input>
                <output bind="grid_invoice"/>
            </dso>
        </xml>
    </gw:data>
    
    <!-- Chon phan Mst -->    
    <gw:data id="dso_get_rate" onreceive="onChangeGrid()">
        <xml> 
            <dso type="process" procedure="ac_pro_60100030_RATE"> 
                <input> 
                     <input bind="txt_date"/>
                     <input bind="lstCompany"/>
                     <input bind="lstCurrent" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtrate"/>
                     <output bind="txt_row"/>
               </output> 
            </dso>
        </xml> 
    </gw:data>
    
    <!-- Tien ghi so -->
    <gw:data id="dso_sel_booksrate" onreceive="onSetBookRate()"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60100030_BOOKCCY">
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="txt_date1"/>
                     <input bind="lstBook_ccy"/>
                </input>  
                <output>
                     <output bind="txtBookRate"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    
    <!-- Chon phan Dtl -->
    <gw:data id="dso_get_rate1" onreceive="SetCurrent()">
        <xml> 
            <dso type="process" procedure="ac_pro_60100030_RATE"> 
                <input> 
                     <input bind="txt_date"/>
                     <input bind="lstCompany"/>
                     <input bind="txtcur" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtrate1"/>
                     <output bind="txt_row"/>
               </output> 
            </dso>
        </xml> 
    </gw:data>
    
    <gw:data id="dso_upd_grd_unapp_amount" onreceive="Control_Menu()">
        <xml>
            <dso type="grid" parameter="15,17" function="ac_sel_60100030_approve_method" procedure="ac_upd_60100030_NAPP_PAY">
                <input bind="grid_amount">
                    <input bind="lstCompany"/>
                    <input bind="rbstatus"/>
                    <input bind="txtseq"/>
                    <input bind="dtPay_duefr"/>
                    <input bind="dtPay_dueto"/>
                    <input bind="dtPay_fr"/>
                    <input bind="dtPay_to"/>
                    <input bind="txtcust_pk"/>
                    <input bind="txtvoucher_no"/>
                    <input bind="txtpl_pk"/>
                    <input bind="lstType"/>
                    <input bind="txttab"/>
					<input bind="lstPayMethod"/>
					<input bind="txtEmp_ID"/>
                </input>
                <output bind="grid_amount"/>
            </dso>
        </xml>
    </gw:data>
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60100030_1" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!-------------------------------------------------------------------------------------------------------->        
<table width="100%" cellpadding="0" cellspacing="0" border="1">
<tr>
    <td width="100%">
	    <table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
            <td width="100%">
	            <table width="100%" cellpadding="0" cellspacing="0" border="0">
		        <tr>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="2%"></td>
                    <td width="10%"></td>
                    <td width="8%"></td>
                    <td width="12%"></td>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="8%"></td>
                    <td width="10%"></td>
                    <td width="5%"></td>
                    <td width="5%"></td>
                </tr>
                <tr>
                    <td align="right">Company</td>
                    <td colspan="3"><gw:list id="lstCompany" onchange="OnChangeCompany()"  styles='width:100%'></gw:list></td>
                    <td align="center">Status</td>
                    <td colspan = 3>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td><gw:datebox id="dtPay_Date" onChange="OnSearch()" styles='width:85%' lang="1"/></td>
                            <td align="left"><gw:radio id="rbstatus" value="1" onchange="OnSearch()" > 
					                <span value="1">UnApproval</span>
					                <span value="2">Approval</span>
                            </gw:radio>
                            </td>
                        </tr>
                        </table>
                    </td>
                    <td align="right">SEQ</td>
                    <td><gw:textbox id="txtseq" styles="width:100%" onenterkey="OnSearch()" onkeypress="CheckNumeric()"/></td>
                    <td colspan = 3>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="80%"></td>
                            <td ><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"    onclick="OnSearch()" /></td>
				            <td ><gw:imgBtn id="ibtnReport" img="printer"   alt="Print Acct" onclick="OnReport()" /></td>
				            <td><gw:icon id="btnChk"   img="in" text="ChkAll" styles='width:100%' onclick="OnChkAll()"/></td>
                        </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right">Pay Due Date</td>
                    <td><gw:datebox id="dtPay_duefr" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtPay_dueto" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center"><a title="Click here to select Customer" onclick="Popup_Cust()" href="#tips">Customer</td>
                    <td colspan="3">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="30%"><gw:textbox id="txtcust_cd" styles='width:100%'/></td>
                            <td width="60%"><gw:textbox id="txtcust_nm" styles='width:100%'/></td>
                            <td width="0%"><gw:textbox  id="txtcust_pk" styles='display:none'/></td>
                            <td width="5%"><gw:imgBtn   img="reset"	id="idResetTr"  alt="Reset" onclick="Reset_Cust()"/></td>
                        </tr>
                        </table>
                    </td>
                    <td align="right">Voucher No</td>
                    <td><gw:textbox id="txtvoucher_no" styles="width:100%" onenterkey="OnSearch()"/></td>
			        <td><gw:icon id="btnConfirm"    img="in" text="Approval"     styles='width:100%' onclick="OnApproval()"/></td>
                    <td><gw:icon id="btnCancel"     img="in" text="Cancel"      styles='width:100%' onclick="OnAppCancel()"/></td>
                </tr>
                <tr>
                    <td align="right"><gw:label id="lblDate" text="Pay Date" /></td>
                    <td><gw:datebox id="dtPay_fr" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtPay_to" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center"><a title="Click here to select Profit & Loss(PL)" onclick="Popup_PL()" href="#tips">Profit & Loss(PL)</td>
                    <td colspan="3">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="30%"><gw:textbox id="txtpl_cd" styles='width:100%'/></td>
                            <td width="60%"><gw:textbox id="txtpl_nm" styles='width:100%'/></td>
                            <td width="0%"><gw:textbox  id="txtpl_pk" styles='display:none'/></td>
                            <td width="5%"><gw:imgBtn   img="reset"	id="idResetPL"  alt="Reset" onclick="Reset_PL()"/></td>
                        </tr>
                        </table>
                    </td>
			        <td align="right">Type</td>
                    <td><gw:list id="lstType" onChange="OnSearch()" value ="" styles='width:100%'></gw:list></td>
                    <td colspan = 3>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td align="right" width="10%">Ccy</td>
                            <td width="50%"><gw:list id="lstCurrent" onChange="OnChangeCurrent()"  value ="" styles='width:100%'></gw:list></td>
                            <td width="40%"><gw:textbox id="txtrate"  styles='width:100%' type="number" format="###,###.##R" /></td>
                        </tr>
                        </table>
                    </td>
                </tr>
				<tr>
					<td align="right">Pay Method</td>
					<td><gw:list id="lstPayMethod" styles='width:100%;' onchange="OnSetPayMethod()" /></td>
				</tr>
                </table>
            </td>
        </tr>
        </table>
    </td>
</tr>
<tr>
    <td width="100%">
        <table border=0 width="100%" cellpadding=0 cellspacing=0 >
        <tr>
            <td>
                <gw:tab id="idTab_Child"  onpageactivate="onSearchTab()">
                    <table name="Amount Infor" width ="100%" cellpadding ="0" cellspacing ="0" border="1" >
                        <tr>
                            <td width ="100%">
                                <gw:grid   
		                            id="grid_amount"
		                            header  ="Chk|Seq|A/P Date|A/P Ccy|A/P Rate|A/P Trans|A/P Books|Pay Method|Pay Date|Pay Ccy|Pay Rate|Pay Trans|Pay Books|Diff Books|Diff Rate|_tfn_eppay_pk|_trd_pk|_tfn_eppaytr_pk|Book Rate|AP_Book_Rate|Serial No|Invoice Date|Invoice No"
		                            format  ="3|0|4|0|0|0|0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
		                            aligns  ="1|1|1|1|1|3|3|0|1|1|1|3|3|3|1|0|0|0|1|1|1|1|1"
		                            defaults="|||||||04|||||||||||||||"
		                            editcol ="0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|0|0|0|1|0|0|0|0"
		                            acceptNullDate="T"
		                            widths  ="400|700|1100|800|900|1600|1400|1200|1100|800|900|1600|1600|1300|900|900|0|0|1200|1200|1000|1000|1000"
		                            styles  ="width:100%; height:380"
		                            sorting ="T"
		                            onafteredit  = "RowEdit()"
		                            />
                            </td>
                        </tr>
                    </table>
                    <table name="Invoice & Plan" width ="100%" cellpadding ="0" cellspacing ="0" border="1" >
                            <tr>
				                <td width ="100%">
                                    <gw:grid   
		                                id="grid_invoice"
		                                header  ="Seq|Voucher No|P/L Name|Customer Name|Desc|Desc Local|Serial No|Invoice No|Invoice Date|Due Date|Remark|_pk"
		                                format  ="0|0|0|0|0|0|0|0|4|4|0|0"  
		                                aligns  ="1|1|1|0|0|0|0|0|1|0|0|0" 
		                                defaults="|||||||||||"  
		                                editcol ="0|0|0|0|0|0|0|0|1|0|1|0"
		                                widths  ="600|1500|1500|2000|1500|1500|1500|1500|1500|1500|0|0"  
		                                styles  ="width:100%; height:380"
		                                sorting ="T"
		                                acceptNullDate="T"
		                                />
                                </td>
                            </tr>
                    </table>
                </gw:tab>
            </td>
        </tr>
        
        </table>
    </td>
</tr>
</table>

<gw:textbox id="txtchk"                 style="display:none" />
<gw:textbox id="txttab"                 style="display:none" />
<gw:textbox id="txtseq_str"             style="display:none" />
<gw:textbox id="txtindex"               style="display:none" />
<gw:textbox id="txtStatus"              style="display:none" />

<gw:textbox id="txt_row"               style="display:none" />
<gw:textbox id="txt_date"               styles='display:none'/>

<gw:list    id="lstBook_ccy" 		    style="width:75%;display:none"></gw:list >
<gw:textbox id="txtBookRate"            style="display:none" />

<gw:textbox id="txtcur"                 styles='display:none'/>
<gw:textbox id="txtrate1"               styles='display:none'/>
<gw:textbox id="txt_date1"              styles='display:none'/>
<gw:textbox id="txtUser_PK"              styles='display:none'/>
<gw:textbox id="txtEmp_ID"              styles='display:none'/>

</body>
</html>
