<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
 
<script>

var click_tab0   = true;
var click_tab1   = true;
var click_tab2   = true;
var g_user_pk = "<%=Session("USER_PK")%>";
function BodyInit()
{
    System.Translate(document);
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
	lstCompany.SetDataText(ls_data);
    var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
	
	<%=CtlLib.SetGridColumnComboFormat("grid_amount", 2, "select d.code, d.code_nm from tac_commcode_detail d, tac_commcode_master m where d.del_if = 0 and m.del_if = 0 and d.tac_commcode_master_pk = m.pk and m.id = 'ACBG0130'")%>;
	<%=CtlLib.SetGridColumnComboFormat("grid_invoice", 1,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACBG0130' AND A.USE_IF = 1")%>;
	<%=CtlLib.SetGridColumnComboFormat("grid_amount", 10,"select itemcode, itemcode_nm from tac_abitemcode c, tac_abitem a where c.tac_abitem_pk = a.pk and c.del_if = 0 and a.del_if = 0 and a.item_nm = 'PAYMENT METHOD'")%>;
	var ls_Type        = "<%=CtlLib.SetListDataFUNC("SELECT AC_GET_COMMONCODE('EACAB001') FROM DUAL")%>";	
	lstType.SetDataText(ls_Type); 
	lstType.value = "AL";
	ls_data        = "<%=CtlLib.SetListDataSQL("SELECT B.CODE, B.CODE FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'ACBG0040' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.DEF_YN = 'Y'")%>";	
	lstBookCcy.SetDataText(ls_data);
    dtPay_duefr.SetDataText(ls_date_fr);
    dtPay_fr.SetDataText(ls_date_fr);    
    txtcust_nm.SetEnable(false);
    txtpl_nm.SetEnable(false);
    lblRecord.SetDataText("0");
    txtchk.SetDataText("0");
    txttab.text = 0;
    SetGridData();
    Control_Menu();
    txtseq.GetControl().focus();
	grid_amount.GetGridControl().FrozenCols = 7;
    chkPayment.value = 'T';
    OnFilterPayment();    
	txtUser_Pk.text = g_user_pk;
dso_getCompany.Call();

}

function SetGridData()
{
    var fg  = grid_amount.GetGridControl();
    var fg1 = grid_pay.GetGridControl();
    fg.ColFormat(11)     = "#,###,###,###,###,###,###,###,###.##R";
	if(lstBookCcy.value == "VND")
	{
		fg.ColFormat(12)    = "#,###,###,###,###,###,###,###,###,###R";	
	}
	else
	{
		fg.ColFormat(12)    = "#,###,###,###,###,###,###,###,###.##R";	
    }
    fg1.ColFormat(5)    = "#,###,###,###,###,###,###,###,###.##R";
	if(lstBookCcy.value == "VND")
		fg1.ColFormat(6)    = "#,###,###,###,###,###,###,###,###,###R";
	else
		fg1.ColFormat(6)    = "#,###,###,###,###,###,###,###,###.##R";
    fg1.ColFormat(7)    = "#,###,###,###,###,###,###,###,###.##R";
	if(lstBookCcy.value == "VND")	
		fg1.ColFormat(8)    = "#,###,###,###,###,###,###,###,###,###R";
	else
		fg1.ColFormat(8)    = "#,###,###,###,###,###,###,###,###.##R";
    fg1.ColFormat(9)    = "#,###,###,###,###,###,###,###,###.##R";
	if(lstBookCcy.value == "VND")
		fg1.ColFormat(10)   = "#,###,###,###,###,###,###,###,###,###R";
	else
		fg1.ColFormat(10)   = "#,###,###,###,###,###,###,###,###.##R";
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
    if (grid_amount.rows > 1)
    {
        if (txtchk.GetData() == 0)
        {
            btnChk.text="UnChk";
            txtchk.SetDataText("1");
            for (i = 1; i< grid_amount.rows; i++)
            {
                grid_amount.SetGridText(i, 0, -1);
            }
        }
        else
        {
            btnChk.text="ChkAll";
            txtchk.SetDataText("0");
            for (i = 1; i< grid_amount.rows -1; i++)
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
    OnChangeStatus();
    grid_amount.ClearData();
    grid_invoice.ClearData();
    grid_pay.ClearData();
    OnCheckTab();
    if (OnCheck())
    {
        if (txttab.GetData() == 0)
        {
            dso_sel_grd_payable_amount.Call('SELECT');
        }
        else if (txttab.GetData() == 1)
        {
            dso_sel_grd_payable_payment.Call('SELECT');
        }
        else if (Trim(txttab.GetData()) == "2")
        {				
            dso_sel_grd_payable_invoice.Call('SELECT');
        }
    }
}

function OnCheckTab()
{
    if (idTab_Child.GetCurrentPageNo() == 0)
    {
        click_tab0 = false;
    }
    else if (idTab_Child.GetCurrentPageNo() == 1)
    {
        click_tab1 = false;
    }
    else if (idTab_Child.GetCurrentPageNo() == 2)
    {
        click_tab2  = false;
    }
}

function Popup_Cust()
{
    var fpath   = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx?com_pk=' + lstCompany.GetData();
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
    btnUpdate.SetEnable(false);
    btnChk.SetEnable(false);
    if (!click_tab0)
    {
        if (rbstatus.GetData() == 1)
        {
            btnConfirm.SetEnable(true);
        }
        else
        {
            btnCancel.SetEnable(true);
        }
        btnChk.SetEnable(true);
    }
    else if (!click_tab2)
    {
        btnUpdate.SetEnable(true);
    }
    SetTotal();	
}

function OnSumTotal(iObj)
{
	Control_Menu();
	var i; var l_sum_trans = 0, l_sum_books = 0, l_pay_famt = 0, l_pay_amt = 0, l_bal_famt = 0, l_bal_amt = 0;
	var l_conf_trans_amt = 0, l_conf_books_amt = 0;
	if(iObj.id=="dso_sel_grd_payable_amount")
	{
		for(i = 1; i < grid_amount.rows; i++)
		{
			l_sum_trans += Number(grid_amount.GetGridData(i, 11));
			l_sum_books += Number(grid_amount.GetGridData(i, 12));
		}
		grid_amount.AddRow();
		grid_amount.SetGridText(grid_amount.rows - 1, 3, "Total");
		grid_amount.SetGridText(grid_amount.rows - 1, 11, l_sum_trans);
		grid_amount.SetGridText(grid_amount.rows - 1, 12, l_sum_books);
		//txtSumTrans.text = l_sum_trans.toFixed(3);
		//txtSumBook.text = l_sum_books.toFixed(3);
		grid_amount.SetCellBgColor(grid_amount.rows-1, 0, grid_amount.rows-1, grid_amount.cols-1, Number("0xA9EBD7"));
		txtConfirmTrans.text = "0";
		txtConfirmBook.text = "0";
		dso_get_unpaid_amt.Call();
	}
	else if(iObj.id=="dso_sel_grd_payable_payment")
	{		
		for(i = 1; i < grid_pay.rows; i++)
		{
			if(rbstatus.value == "2" )
			{
				l_conf_trans_amt += Number(grid_pay.GetGridData(i, 5));
				l_conf_books_amt += Number(grid_pay.GetGridData(i, 6));
			}
			l_sum_trans += Number(grid_pay.GetGridData(i, 7));
			l_sum_books += Number(grid_pay.GetGridData(i, 8));
			l_pay_famt  += Number(grid_pay.GetGridData(i, 7));
			l_pay_amt  += Number(grid_pay.GetGridData(i, 8));
			l_bal_famt += Number(grid_pay.GetGridData(i, 9));
			l_bal_amt += Number(grid_pay.GetGridData(i, 10));
		}
		grid_pay.AddRow();
		grid_pay.SetGridText(grid_pay.rows - 1, 3, "Total");
		grid_pay.SetGridText(grid_pay.rows - 1, 5, l_sum_trans);
		grid_pay.SetGridText(grid_pay.rows - 1, 6, l_sum_books);
		grid_pay.SetGridText(grid_pay.rows - 1, 7, l_pay_famt);
		grid_pay.SetGridText(grid_pay.rows - 1, 8, l_pay_amt);
		grid_pay.SetGridText(grid_pay.rows - 1, 9, l_bal_famt);
		grid_pay.SetGridText(grid_pay.rows - 1, 10, l_bal_amt);
		txtConfirmTrans.text = l_conf_trans_amt.toFixed(3);
		txtConfirmBook.text = l_conf_books_amt.toFixed(3);	
		grid_pay.SetCellBgColor(grid_pay.rows-1, 0, grid_pay.rows-1, grid_pay.cols-1, Number("0xA9EBD7"));
		//txtSumTrans.text = l_sum_trans.toFixed(3);
		//txtSumBook.text = l_sum_books.toFixed(3);
		txtConfirmTrans.text = "0";
		txtConfirmBook.text = "0";
		
	}
	else if(iObj.id=="dso_sel_grd_payable_invoice")
	{	
		txtConfirmTrans.text = "0";
		txtConfirmBook.text = "0";	
	}
}

function EnableTab(bool)
{
    click_tab0 = bool;
    click_tab1 = bool;
    click_tab2 = bool;
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
    else if (idTab_Child.GetCurrentPageNo() == 2)
    {
        if (click_tab2 == true)
        {
            EnableTab(true);
            click_tab2 = false;
            txttab.SetDataText("2");
			//dso_sel_grd_payable_invoice.Call("SELECT");
            OnSearch();
        }
    }
    Control_Menu();
}

function OnChangeStatus()
{
    if (rbstatus.GetData() == 1)
    {
        lblDate.text = 'Trans Date';
    }
    else
    {
        lblDate.text = 'Pay Date';
    }
}

function OnUpdate()
{
    dso_sel_grd_payable_invoice.Call();
}

function OnConfirm()
{
    txtseq_str.text = "";
    txtindex.text   = "";
    var data='';	
	var ctrl 	= grid_amount.GetGridControl();
	var rows 	= ctrl.Rows;
	var index;
	index  = 0;
	var l_comma = '';
	
	for (i=1; i<grid_amount.rows; i++)
	{
		var tmp = grid_amount.GetGridData(i, 0);
		if (tmp == "-1")
		{		    
			data  += l_comma + grid_amount.GetGridData(i, 13);
			index = index + 1 ;
			l_comma = ',' ;
		}
	}
	data = data + ",";
	if(index == 0)
	{
		alert('Please select check SEQ for confirm!!!'+'\n'+'  Bạn hãy chọn số SEQ để Confirm!!!')
		return;
	}
	else
	{
		if(confirm('Are you sure you want to confirm?'+'\n'+'Bạn có chắc Confirm số SEQ này?'))
		{	        
	        txtseq_str.SetDataText(data);	        
	        txtindex.text   = index;
	        dso_upd_confirm_cancel.Call();	
        }
    }
}

function OnConfirmCancel()
{
    txtseq_str.text = "";
    txtindex.text   = "";
    var data='';	
	var ctrl 	= grid_amount.GetGridControl();
	var rows 	= ctrl.Rows;
	var index;
	index  = 0;
	var l_comma = '';
	
	for (i=1; i< grid_amount.rows - 1 ; i++)
	{
		var tmp = grid_amount.GetGridData(i, 0);
		if (tmp == "-1")
		{		    
			data  += l_comma + grid_amount.GetGridData(i, 13);
			index = index + 1 ;
			l_comma = ',' ;
		}
	}
	data = data + ",";	
	if(index == 0)
	{
		alert('Please select check SEQ for cancel!!!'+'\n'+'  Bạn hãy chọn số SEQ để cancel!!!')
		return;
	}
	else
	{
		if(confirm('Are you sure you want to cancel?'+'\n'+'Bạn có chắc cancel số SEQ này?'))
		{	        
	        txtseq_str.SetDataText(data);	        
	        txtindex.text   = index;
	        dso_upd_confirm_cancel.Call();	
        }
    }
}
//-----------------------------------------------------------------------
function OnGetPK()
{
     txtseq_str.text = "";
    txtindex.text   = "";
    var data;
    var data1;
	data    = "";
	data1   = "";
    var ctrl 	= grid_amount.GetGridControl();
	var rows 	= ctrl.Rows;
	var index;
	index  = 0;
    for (i=1; i<ctrl.Rows; i++)
	{
		var tmp = grid_amount.GetGridData(i, 0);
		if (tmp == "-1")
		{
		    
			data  = grid_amount.GetGridData(i, 13)+ "," + data;
			data1 = grid_amount.GetGridData(i, 1)+ "," + data1;
			index = index + 1;			
		}
	}
    
}
//-----------------------------------------------------------------------

function SetTotal()
{
    if (grid_amount.rows > 1)
    {
        var ctrl = grid_amount.GetGridControl();
	    var i = ctrl.rows - 1;
	    lblRecord.SetDataText(i);
	    btnChk.SetEnable(true);
    }
    else
    {
        lblRecord.SetDataText(0);
    }
    btnChk.text="ChkAll";
    txtchk.SetDataText("0");
}

function OnPrint()
{
    var v_approve ='Y';
    if (rbstatus.GetData() == "1")
	{
	    v_approve = 'N';
		rqt = "?l_compk=" + lstCompany.GetData() + '&l_seq=' + txtseq.GetData() + '&l_paydue_fr=' + dtPay_duefr.GetData() + '&l_paydue_to=' + dtPay_dueto.GetData() + '&l_datefr=' + dtPay_fr.GetData() + '&l_dateto=' + dtPay_to.GetData() + '&l_tco_buspartner_pk=' + txtcust_pk.GetData() + '&l_voucher_no=' + txtvoucher_no.GetData() + '&l_tac_abplcenter_pk=' + txtpl_pk.GetData() + '&l_type=' + lstType.GetData() + '&l_pay_date=' + dtPay_Date.GetData() + '&bal_opt=' + lstBalance.value + '&l_approve=' + v_approve;
		url =System.RootURL + '/standard/reports/60/10/60100010_paylist.aspx' + rqt;
		if (confirm("Are you sure you want to report ?" ))
		{
			System.OpenTargetPage(url, 'newform');
			return;
		}
	}
	else if (rbstatus.GetData() == "2")
	{
	     v_approve = 'Y';
	    rqt = "?l_compk=" + lstCompany.GetData() + '&l_seq=' + txtseq.GetData() + '&l_paydue_fr=' + dtPay_duefr.GetData() + '&l_paydue_to=' + dtPay_dueto.GetData() + '&l_datefr=' + dtPay_fr.GetData() + '&l_dateto=' + dtPay_to.GetData() + '&l_tco_buspartner_pk=' + txtcust_pk.GetData() + '&l_voucher_no=' + txtvoucher_no.GetData() + '&l_tac_abplcenter_pk=' + txtpl_pk.GetData() + '&l_type=' + lstType.GetData() + '&l_pay_date=' + dtPay_Date.GetData() + '&bal_opt=' + lstBalance.value+ '&l_approve=' + v_approve;
		url =System.RootURL + '/standard/reports/60/10/60100010_paylist.aspx' + rqt;
		if (confirm("Are you sure you want to report ?" ))
		{
			System.OpenTargetPage(url, 'newform');
			return;
		}
	
	   /*  // Tuyen dong lai
	   rqt = "?l_compk=" + lstCompany.GetData() + '&l_seq=' + txtseq.GetData() + '&l_paydue_fr=' + dtPay_duefr.GetData() + '&l_paydue_to=' + dtPay_dueto.GetData() + '&l_datefr=' + dtPay_fr.GetData() + '&l_dateto=' + dtPay_to.GetData() + '&l_tco_buspartner_pk=' + txtcust_pk.GetData() + '&l_voucher_no=' + txtvoucher_no.GetData() + '&l_tac_abplcenter_pk=' + txtpl_pk.GetData() + '&l_type=' + lstType.GetData() + '&l_pay_date=' + dtPay_Date.GetData() + '&bal_opt=' + lstBalance.value;
		url =System.RootURL + '/standard/reports/60/10/60100010_paylist_cfm.aspx' + rqt;
		if (confirm("Are you sure you want to report ?" ))
		{
			System.OpenTargetPage(url, 'newform');
			return;
		}*/
	}
}

function Popup_PL()
{
    var fpath = System.RootURL + "/standard/forms/60/09/60090010_CtrItem2.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=AC_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
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

function OnPopupSlipEntry()
{
    var ctrl 	= grid_amount.GetGridControl();
	var rows    = ctrl.Rows
	rows = rows - 1;
	var rownum  	= ctrl.Row;
	var colnum  	= ctrl.Col;
	if (rownum > 0)		 
	{
		if (event.col > 0)
		{
			var pk      = grid_amount.GetGridData(ctrl.row, 1);
			var status  = 0;
			var ls_arr = "";
			for (i = 1; i < grid_amount.rows; i++)
			{
			    ls_arr = ls_arr + ' ' + grid_amount.GetGridData(i, 1);
			}
			
			var fpath   = System.RootURL + '/standard/forms/60/09/60090030_popup.aspx?PK_ROW=' + pk + '&ROW=' + ctrl.row + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
			var wWidth  = 950;
			var wHeight = 580;
			var x = Math.round((screen.availWidth - wWidth)/2);
			var y = Math.round((screen.availHeight - wHeight)/2);
			
			var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
			   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
			   "lef="+ x +",top=" + y;
			
			var object = System.OpenModal(fpath, wWidth, wHeight, features);
	    }
    }
}

function OnSumCheckRow()
{
	var i, l_trans_amt = 0, l_book_amt = 0;
	for(i = 1; i < grid_amount.rows; i++)
	{
		if(grid_amount.GetGridData(i, 0)=='-1')
		{
			l_trans_amt += Number(grid_amount.GetGridData(i, 11));
			l_book_amt += Number(grid_amount.GetGridData(i, 12));
		}		
	}
	txtConfirmTrans.text = l_trans_amt.toFixed(3);
	txtConfirmBook.text = l_book_amt.toFixed(3);
}

function OnShowGrandTotal()
{
	
}

function Popup_AC()
{
    var fpath = System.RootURL + "/standard/forms/60/08/60080050_popup_Acc.aspx?comm_nm=" + "" + "&comm_code=" + "331" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60080050_acct";
    o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
    if (o != null)
    {
        if(o[0] != 0)
        {
            txtac_pk.SetDataText(o[3]);
            txtac_cd.SetDataText( o[0]);
            txtac_nm.SetDataText(o[1]);            
        }
    }    
}

function OnFilterPayment()
{
    if(chkPayment.value == 'T') // trang thai payment
    {
        btnConfirm.SetEnable(true); // can confirm
        btnCancel.SetEnable(true); // can unconfirm        
    }
    else  // trang thai unpayment
    {        
        btnConfirm.SetEnable(false); // cannot confirm
        btnCancel.SetEnable(false); // cannot unconfirm
    }
}

function Reset_AC()
{
    txtac_cd.SetDataText("");
    txtac_nm.SetDataText("");
    txtac_pk.SetDataText("");
}

function OnDataReceive(obj){
	switch(obj.id){
		case "dso_getCompany":
			dso_get_unpaid_amt.Call();
		break;
	}
}

</script>
<body style="margin:0; padding:0;">

    <gw:data id="dso_sel_grd_payable_amount" onreceive="OnSumTotal(this)">
        <xml>
            <dso type="grid" function="ac_sel_60100010_payable">
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
                    <input bind="txttab" />
					<input bind="lstBalance" />
					<input bind="dtPay_Date" />
					<input bind="txtac_pk" />
					<input bind="chkPayment" />
                </input>
                <output bind="grid_amount"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_sel_grd_payable_payment" onreceive="OnSumTotal(this)">
        <xml>
            <dso type="grid" function="ac_sel_60100010_payable">
                <input bind="grid_pay">
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
                    <input bind="txttab" />
					<input bind="lstBalance" />
					<input bind="dtPay_Date" />
					<input bind="txtac_pk" />
					<input bind="chkPayment" />					
                </input>
                <output bind="grid_pay"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_sel_grd_payable_invoice" onreceive="OnSumTotal(this)">
        <xml>
            <dso type="grid" parameter="7,9,10" function="ac_sel_60100010_payable" procedure="ac_upd_60100010_payable">
                <input bind="grid_invoice">
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
					<input bind="lstBalance" />
					<input bind="dtPay_Date" />
					<input bind="txtac_pk" />
					<input bind="chkPayment" />					
                </input>
                <output bind="grid_invoice"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_upd_confirm_cancel" onreceive="OnSearch()"> 
        <xml> 
            <dso type="process" procedure="AC_PRO_60100010_CONFIRM_CANCEL" > 
                <input> 
                     <input bind="txtseq_str"/>
                     <input bind="lstCompany"/>
                     <input bind="rbstatus"/>
                     <input bind="txtindex"/>
                     <input bind="dtPay_Date"/>
                     <input bind="txtseq1_str"/>
                </input>
                <output>
                     <output bind="rbstatus"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dso_get_unpaid_amt" onreceive="OnShowGrandTotal()"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60100010_unpaid" > 
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="dtPay_to"/>
                </input>
                <output>
                     <output bind="txtSumTrans"/>
					 <output bind="txtSumBook"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
     <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_pro_60090010_company" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------------->
    
    
<table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
<tr height='100%'>
    <td width="100%">
	    <table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
		<tr height='8%'>
            <td width="100%">
	            <table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
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
                    <td colspan="3"><gw:list id="lstCompany" onChange="OnSearch()" styles='width:100%'></gw:list></td>
                    <td align="center">Status&nbsp;</td>
                    <td colspan = 2>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td><gw:datebox id="dtPay_Date" onchange="" styles='width:85%' lang="1"/></td>
                            <td align="left"><gw:radio id="rbstatus" value="1" onchange="OnSearch()"> 
					                <span value="1">UnConfirmed&nbsp;</span>
					                <span value="2">Confirmed</span>
                            </gw:radio>
                            </td>
                        </tr>
                        </table>
                    </td>
					<td>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>							
                            <td align="left"><gw:list id="lstBalance" onchange="OnSearch()" > 
							<data>DATA|0|<>0|1|=0|2|>0</data>
							</gw:list>
                            </td>
                        </tr>
                        </table>					
					</td>
                    <td align="right">SEQ&nbsp;</td>
                    <td><gw:textbox id="txtseq" styles="width:100%" onenterkey="OnSearch()" onkeypress="CheckNumeric()"/></td>
                    <td colspan = 3>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td width="50%"><gw:icon id="btnSearch" img="in" text="Search"  styles='width:100%' onclick="OnSearch()"/></td>
								<td width="50%"><gw:icon id="btnPrint"  img="in" text="Print"   styles='width:100%' onclick="OnPrint()"/></td>
							</tr>
						</table>
                    </td>
                </tr>
                <tr>
                    <td align="right">Pay Due Date&nbsp;</td>
                    <td><gw:datebox id="dtPay_duefr" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtPay_dueto" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center"><a title="Click here to select Customer" onclick="Popup_Cust()" href="#tips">Customer&nbsp;</td>
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
                    <td align="right">Voucher No&nbsp;</td>
                    <td><gw:textbox id="txtvoucher_no" styles="width:100%" onenterkey="OnSearch()"/></td>
			        <td><gw:icon id="btnConfirm"    img="in" text="Confirm"     styles='width:100%' onclick="OnConfirm()"/></td>
                    <td><gw:icon id="btnCancel"     img="in" text="Cancel"      styles='width:100%' onclick="OnConfirmCancel()"/></td>
                    <td><gw:icon id="btnUpdate"     img="in" text="Update"      styles='width:100%' onclick="OnUpdate()"/></td>
                </tr>
                <tr>
                    <td align="right"><gw:label id="lblDate" text="Pay Date" />&nbsp;</td>
                    <td><gw:datebox id="dtPay_fr" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtPay_to" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center"><a title="Click here to select Profit & Loss(PL)" onclick="Popup_PL()" href="#tips">Profit & Loss(PL)&nbsp;</td>
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
			        <td align="right">Type&nbsp;</td>
                    <td><gw:list id="lstType" onChange="OnSearch()" value ="" styles='width:100%'></gw:list></td>
                    <td colspan = 3>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td align="center"  width="5%">Total&nbsp;</td>
                            <td align="center"  width="5%"><gw:label id="lblRecord" text="" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td> 
					        <td align="left"    width="5%">vouchers&nbsp;</td>
					        <td                 width="5%"><gw:icon id="btnChk"     img="in" text="ChkAll" styles='width:100%' onclick="OnChkAll()"/></td>
                        </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="1" align="right">Payment&nbsp;</td>
                    <td colspan="1" align="left" ><gw:checkbox id="chkPayment" styles="width:100%" onclick="OnFilterPayment()" /></td>
                    <td colspan="2"></td>
                    <td align="center"><a title="Click here to select account code" onclick="Popup_AC()" href="#tips">Account Code&nbsp;</td>
                    <td colspan="3">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="30%"><gw:textbox id="txtac_cd" styles='width:100%'/></td>
                            <td width="60%"><gw:textbox id="txtac_nm" styles='width:100%'/></td>
                            <td width="0%"><gw:textbox  id="txtac_pk" styles='display:none'/></td>
                            <td width="5%"><gw:imgBtn   img="reset"	id="idResetAC"  alt="Reset" onclick="Reset_AC()"/></td>
                        </tr>
                        </table>
                    </td>                    
                </tr>                
                </table>
            </td>
        </tr>
        <tr height='90%'>
            <td>
				<gw:tab id="idTab_Child" onclick="onSearchTab()" >
                    <table name="Amount Infor" style='width:100%;height:100%' cellpadding ="0" cellspacing ="0" border="0" >
                        <tr height='100%'>
                            <td width ="100%">
                                <gw:grid   
		                            id="grid_amount"
		                            header  ="Chk|Seq|Voucher Type|Voucher No|Prps Date|Appr.Date|Appr.No|Description|Customer Name|Pay Date|Pay Method|Amount Trans|Amount Books|_pk|Remark|Invoice Date|Serial No|Due Date|Plan Due Date|Payment"
		                            format  ="3|0|0|0|4|4|0|0|0|4|0|0|0|0|0|4|0|4|4|3"
		                            aligns  ="1|1|1|1|1|1|0|0|0|0|0|3|3|0|0|1|1|1|1|1"
		                            defaults="|||||||||||||||||||"
		                            editcol ="0|0|0|0|0|0|0|0|0|1|1|0|0|0|0|0|0|0|0|0"
		                            widths  ="500|800|1500|1500|1200|1200|1200|2000|2500|1200|1300|1700|1500|0|1500|1500|1500|1500|1500|800"
		                            styles  ="width:100%; height:100%"
		                            sorting ="T"
									autosize="T"
		                            oncellclick="OnGetPK()"
		                            oncelldblclick="OnPopupSlipEntry()"
									onafteredit="OnSumCheckRow()"
									acceptNullDate="T"
		                            />
                            </td>
                        </tr>
                    </table>
					<table name="Payment & Balance" style='width:100%;height:100%' cellpadding ="0" cellspacing ="0" border="0" >
                            <tr height='100%'>
				                <td width ="100%">
                                    <gw:grid   
		                                id="grid_pay"
		                                header  ="Seq|Voucher No|P/L Name|Desc|Desc Local|Amount Trans|Amount Books|Pay Trans|Pay Books|Balance Trans|Balance Books"
		                                format  ="0|0|0|0|0|0|0|0|0|0|0"
		                                aligns  ="1|1|0|0|0|3|3|3|3|3|3"
		                                defaults="||||||||||"
		                                editcol ="0|0|0|0|0|0|0|0|0|0|0"  
		                                widths  ="600|1500|1300|1500|1500|1500|1500|1300|1300|1500|0"  
		                                styles  ="width:100%; height:100%"
		                                sorting ="T"
										autosize="T"
		                                />
                                </td>
                            </tr>
                    </table>
					<table name="Invoice & Plan" style='width:100%;height:100%' cellpadding ="0" cellspacing ="0" border="0" >
                            <tr height='100%'>
				                <td width ="100%">
                                    <gw:grid   
		                                id="grid_invoice"
		                                header  ="Seq|Voucher Type|Voucher No|Customer Name|Invoice Date|Invoice No|Due Date|Plan Due Date|Contract No|Remark|_pk"
		                                format  ="0|0|0|0|4|0|4|4|0|0|0"  
		                                aligns  ="1|1|1|0|1|1|0|1|0|0|0" 
		                                defaults="||||||||||"  
		                                editcol ="0|0|0|0|0|0|0|1|0|1|0"
		                                widths  ="800|1500|1500|2500|1500|1500|1000|1500|1500|0|0"  
		                                styles  ="width:100%; height:100%"
										acceptNullDate="T"
		                                sorting ="T"
										autosize="T"
		                                />
                                </td>
                            </tr>
                    </table>
                 </gw:tab>   
              
            </td>
        </tr>
		<tr height='2%'>
            <td>
                <table border=0 style='width:100%' cellpadding=0 cellspacing=0>
                    <tr>
                        <td style="width:15%" align="right">Grand Total&nbsp;</td>
                        <td style="width:15%"><gw:textbox id="txtSumTrans" type="number" format="###,###,###.##" /></td>
                        <td style="width:15%"><gw:textbox id="txtSumBook" type="number" format="###,###,###.##" /></td>
                        <td style="width:20%" align="right">Checked Total&nbsp;</td>
                        <td style="width:15%"><gw:textbox id="txtConfirmTrans" type="number" format="###,###,###.##" /></td>
                        <td style="width:15%"><gw:textbox id="txtConfirmBook" type="number" format="###,###,###.##" /></td>                        
                    </tr>
                </table>
            </td>
        </tr>
        </table>
    </td>
</tr>

</table>
<gw:textbox id="txtchk"                 style="display:none" />
<gw:textbox id="txttab"    style="display:none"              />
<gw:textbox id="txtseq_str"             style="display:none" />
<gw:textbox id="txtseq1_str"             style="display:none" />

<gw:textbox id="txtindex"               style="display:none" />
<gw:textbox id="txtStatus"              style="display:none" />

<gw:textbox id="txtpkall"              style="display:none" />
<gw:list id="lstBookCcy"              style="display:none" />

<gw:textbox id="txtUser_Pk"                 style="display:none" />
</body>
</html>