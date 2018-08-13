<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
 
<script>

var click_tab0   = true;
var click_tab1   = true;
var g_user_pk = "<%=Session("USER_PK") %>";
function BodyInit()
{
    System.Translate(document);
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
	
	<%=CtlLib.SetGridColumnComboFormat("grid_amount", 2,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACBG0130' AND A.USE_IF = 1")%>;
	
	var ls_Type        = "<%=CtlLib.SetListDataFUNC("SELECT AC_GET_COMMONCODE('EACAB001') FROM DUAL")%>";
	var ls_date        = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL")%>";
	var ls_Book_ccy    = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACBG0040','04','') FROM DUAL")%>";
	
	lstBook_ccy.SetDataText(ls_Book_ccy);
	txt_date.SetDataText(ls_date);
	
	
	lstType.SetDataText(ls_Type);
    lstCompany.SetDataText(ls_data);
	
    dtPay_duefr.SetDataText(ls_date_fr);
    dtPay_fr.SetDataText(ls_date_fr);
    
    txtcust_nm.SetEnable(false);
    txtpl_nm.SetEnable(false);
    
    txtchk.SetDataText("0");
    txttab.text = 0;
    SetGridData();
    Control_Menu();
    txtseq.GetControl().focus();
	txtUser_Pk.text = g_user_pk;
	dso_getCompany.Call();

}

function SetGridData()
{
    var fg  = grid_amount.GetGridControl();
    fg.ColFormat(10)     = "#,###,###,###,###,###,###,###,###,###R";
    fg.ColFormat(11)     = "#,###,###,###,###,###,###,###,###.##R";
    fg.ColFormat(12)     = "#,###,###,###,###,###,###,###,###,###.##R";
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
	if (txtseq.GetData() == '')
	{
	    return false;
	}
	return true;
}

function OnSearch()
{
    if (idTab_Child.GetCurrentPageNo() == 0)
    {
        click_tab0 = false;
	//txttab.text = "0";
    }
    else if (idTab_Child.GetCurrentPageNo() == 1)
    {
        click_tab1 = false;
	//txttab.text = "1";
    }
    grid_amount.ClearData();
    grid_invoice.ClearData();
    if (OnCheck())
    {
        
        if (txttab.GetData() == 0)
        {
            dso_sel_grd_payable_amount.Call('SELECT');
        }
        else if (txttab.GetData() == 1)
        {
            dso_sel_grd_payable_invoice.Call('SELECT');
        }
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
    btnChk.SetEnable(false);
    if (!click_tab0)
    {
        if (rbstatus.GetData() == 1)
        {
            btnConfirm.SetEnable(true);
        }
        btnChk.SetEnable(true);
    }
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
			data  = grid_amount.GetGridData(i, 13)+ "," + data ;
			data1 = grid_amount.GetGridData(i, 1)+ "," + data1 ;
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
	        txtseq_str.text     = data;
	        txtseq_str1.text    = data1;
	        txtindex.text       = index;
	        dso_upd_confirm.Call();	
        }
    }
}

function SetTotal()
{
    if (grid_amount.rows > 1)
    {
        var ctrl = grid_amount.GetGridControl();
	    //var i = ctrl.rows - 1;
	    btnChk.SetEnable(true);
	    var ctrl = grid_amount.GetGridControl();
    
        ctrl.Cell(14, 1, 1, 1, 12) = false;
	    grid_amount.SetCellBold(1, 1, 1, 12, true);
	    if (grid_amount.rows == 2)
	    {
	        grid_amount.SetCellBgColor(1, 0, 1, 12, Number('0X8B8B00'));
	    }
	    else if ((grid_amount.rows > 2) && (grid_amount.GetGridData(grid_amount.rows - 1, 11) != ""))
        {
            grid_amount.SetCellBgColor(1, 0, 1, 12, Number('0X2FFFAD'));
            for (i = 2; i < grid_amount.rows; i++)
            {
                grid_amount.SetCellBgColor(i, 0, i, 12, Number('0XAD2FFF'));
            }
        }
    }
    else if (grid_invoice.rows > 1)
    {     
        var ctrl = grid_invoice.GetGridControl();
        ctrl.Cell(14, 1, 1, 1, 11) = false;
	    grid_invoice.SetCellBold(1, 0, 1, 11, true);
	    if (grid_invoice.rows == 2)
	    {
	        grid_invoice.SetCellBgColor(1, 0, 1, 11, Number('0X8B8B00'));
	    }
	    else if ((grid_invoice.rows > 2))
        {
            grid_invoice.SetCellBgColor(1, 0, 1, 11, Number('0X2FFFAD'));
            for (i = 2; i < grid_invoice.rows; i++)
            {
                grid_invoice.SetCellBgColor(i, 0, i, 11, Number('0XAD2FFF'));
            }
        }    
    }
    btnChk.text="ChkAll";
    txtchk.SetDataText("0");
}

function onNew()
{
    if (grid_amount.rows > 2 || grid_amount.rows == 1) return
    for (i = 2; i < 4; i++)
    {
        grid_amount.AddRow();
        for (j = 1; j < grid_amount.cols - 5; j++)
        {
            grid_amount.SetGridText(i, j, grid_amount.GetGridData(1, j));
        }
    }
    grid_amount.SetGridText(2, 13, grid_amount.GetGridData(1, 13));
    for (i = 1; i < 4 ; i++)
    {
        if (i != 2)
        {
            grid_amount.SetRowEditable(i, false);
        }
    }
    grid_amount.SetCellBgColor(2, 0, 2, 14, Number('0XAD2FFF'));
    grid_amount.SetCellBgColor(3, 0, 3, 14, Number('0X2FFFAD'));
}

function RowEdit()
{
    if ((event.col == 11) && (event.row == 2) && (grid_amount.rows == 4))
    {
        var tr_famt = Number(grid_amount.GetGridData(1, 11));
        var tr_amt  = Number(grid_amount.GetGridData(1, 12));
        
        var tr_ccy  = grid_amount.GetGridData(1, 9);
        var tr_ccy_book     = lstBook_ccy.GetData();
        var tr_rate_book    = txtBookRate.GetData();
        if (tr_ccy == tr_ccy_book)
        {
            dr_famt = Number(grid_amount.GetGridData(event.row, 11));
            if (!isFinite(dr_famt))
            {
                alert('Amount Transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tiền giao dịch là số. Bạn hãy kiểm tra lỗi dòng '+ (event.row) +'!!!')
                grid_amount.SetGridText(2, 11, "");
                grid_amount.SetGridText(2, 12, "");
                grid_amount.SetGridText(3, 11, "");
                grid_amount.SetGridText(3, 12, "");
                return false;
            }
            if (dr_famt >=  tr_famt)
            {
                alert('Amount Transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tiền giao dịch là số. Bạn hãy kiểm tra lỗi dòng '+ (event.row) +'!!!')
                grid_amount.SetGridText(2, 11, "");
                grid_amount.SetGridText(2, 12, "");
                grid_amount.SetGridText(3, 11, "");
                grid_amount.SetGridText(3, 12, "");
                return false;
            }
            grid_amount.SetGridText(2, 12, Number(dr_famt));
            grid_amount.SetGridText(3, 11, Number(tr_famt - dr_famt));
            grid_amount.SetGridText(3, 12, Number(tr_famt - dr_famt));
        }
        else
        {
            var tr_famt = Number(grid_amount.GetGridData(1, 11));
            var tr_amt  = Number(grid_amount.GetGridData(1, 12));
            var tr_rate = Number(grid_amount.GetGridData(1, 10));
            
            dr_famt = Number(grid_amount.GetGridData(event.row, 11));
            if (!isFinite(dr_famt))
            {
                alert('Amount Transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tiền giao dịch là số. Bạn hãy kiểm tra lỗi dòng '+ (event.row) +'!!!')
                grid_amount.SetGridText(2,  11, "");
                grid_amount.SetGridText(3,  11, "");
                return false;
            }
            if (dr_famt >=  tr_famt)
            {
                alert('Amount Transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tiền giao dịch là số. Bạn hãy kiểm tra lỗi dòng '+ (event.row) +'!!!')
                grid_amount.SetGridText(2, 11, "");
                grid_amount.SetGridText(3, 11, "");
                return false;
            }
            
            //grid_amount.SetGridText(3, 11, Number(tr_famt - dr_famt));
            
            grid_amount.SetGridText(2, 12, Number(dr_famt*(tr_rate/tr_rate_book)));
            grid_amount.SetGridText(3, 11, Number(tr_famt - dr_famt));
            grid_amount.SetGridText(3, 12, Number(tr_amt) - Number(dr_famt*(tr_rate/tr_rate_book)));
        }
    }
    else if ((event.col == 12) && (event.row == 2) && (grid_amount.rows == 4))
    {
        var tr_amt  = Number(grid_amount.GetGridData(1, 12));
        var dr_amt  = Number(grid_amount.GetGridData(event.row, 12));
        if (!isFinite(dr_famt))
        {
            alert('Amount Transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tiền giao dịch là số. Bạn hãy kiểm tra lỗi dòng '+ (event.row) +'!!!')
            grid_amount.SetGridText(2, 12, "");
            grid_amount.SetGridText(3, 12, "");
            return false;
        }
        if (dr_amt >= tr_amt)
        {
            alert('Amount Transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tiền giao dịch là số. Bạn hãy kiểm tra lỗi dòng '+ (event.row) +'!!!')
            grid_amount.SetGridText(2, 12, "");
            grid_amount.SetGridText(3, 12, "");
            return false;
        }
       grid_amount.SetGridText(3, 12, Number(tr_amt - dr_amt));
    }
}

function onSave()
{
    if (idTab_Child.GetCurrentPageNo() == 0)
    {
        if (grid_amount.rows > 3)
        {
            grid_amount.SetRowStatus(1, 0);
            grid_amount.SetRowStatus(2, 0x20);
            grid_amount.SetRowStatus(3, 0);
            var tr_famt     = Number(grid_amount.GetGridData(2, 11));
            var tr_amt      = Number(grid_amount.GetGridData(2, 12));
            
            if (tr_famt == "")
            {
                return;
            }
            if (tr_amt == "")
            {
                return;
            }
            dso_sel_grd_payable_amount.Call();
        }
    }
    else if (idTab_Child.GetCurrentPageNo() == 1)
    {
        dso_sel_grd_payable_invoice.Call();
    }
}

function onMerge()
{
    var i, v_ac_pk = "", j = 0;
    // Compare Acc PK
    if(grid_amount.rows > 1)
    {
        for (i = 1; i < grid_amount.rows; i++)
        {
            if((grid_amount.GetGridData(i, 0)=='-1') && (grid_amount.GetGridData(i, 13)!= ''))
            {
                v_ac_pk = Number(grid_amount.GetGridData(i, 15)) ; // Acc PK
                j = i;
                break;
            }
        }        
    }        
    for (i = j+1; i < grid_amount.rows; i++)
    {
        if(v_ac_pk != Number(grid_amount.GetGridData(i, 15)))
        {
            return;
        }
    }
    var v_tot_trans_amt = 0, v_tot_books_amt = 0;
    if(j > 0) 
    {
        grid_amount.SetRowStatus(j, 0x10); // Update row
	    v_tot_trans_amt += Number(grid_amount.GetGridData(j, 11)); // Amt Trans
	    v_tot_books_amt += Number(grid_amount.GetGridData(j, 12)); // Amt Books
        for (i = j + 1; i < grid_amount.rows; i++)
        {
	        if((grid_amount.GetGridData(i, 0) == '-1') && (grid_amount.GetGridData(i, 13)!= ''))
	        {
	            v_tot_trans_amt += Number(grid_amount.GetGridData(i, 11)); // Amt Trans
	            v_tot_books_amt += Number(grid_amount.GetGridData(i, 12)); // Amt Books	            
            	grid_amount.SetRowStatus(i, 0x40);  // delete row
	        }
        }
        grid_amount.SetGridText(j, 11, v_tot_trans_amt); // Amt Trans
        grid_amount.SetGridText(j, 12, v_tot_books_amt);// Amt Books	            
        dso_sel_grd_payable_amount.Call();
    }
    else
    {
        alert('You do not merge row'+'\n'+'');
        return;
    }
}

function OnPrint()
{
    alert("Not Yet");
    return;
}

function Popup_PL()
{
    var fpath = System.RootURL + "/standard/forms/60/09/60090010_CtrItem2.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
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

function OnSetBookRate()
{
    if (txtBookRate.GetData() == 0)
    {
        alert('You must type in day ratio: '+ txt_date.GetData() +'\n'+'Bạn hãy nhập tỷ giá ngày: '+ txt_date.GetData());
        return;
    }
}

function OnDataReceive(obj){
	switch(obj.id){
		case "dso_getCompany":
			dso_sel_booksrate.Call();
		break;
	}
}
</script>
<body style="margin:0; padding:0;">
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
    <gw:data id="dso_sel_grd_payable_amount" onreceive="Control_Menu()">
        <xml>
            <dso type="grid" parameter="1,11,12,13,14" function="AC_SEL_60100020_INSTALLMENT" procedure="AC_UPD_60100020_INSTALLMENT">
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
                    <input bind="txtAmountTrans"/>
                    <input bind="txtAmountBooks"/>
                </input>
                <output bind="grid_amount"/>
            </dso>
        </xml>
    </gw:data>
    
    
    <gw:data id="dso_sel_grd_payable_invoice" onreceive="Control_Menu()">
        <xml>
            <dso type="grid" parameter="7,10,11" function="AC_SEL_60100020_INSTALLMENT" procedure="AC_UPD_60100020_PAYABLE">
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
                    <input bind="txtAmountTrans"/>
                    <input bind="txtAmountBooks"/>                    
                </input>
                <output bind="grid_invoice"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_upd_confirm" onreceive="OnSearch()"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60100020_conf_cancel" > 
                <input> 
                     <input bind="txtseq_str"/>
                     <input bind="lstCompany"/>
                     <input bind="rbstatus"/>
                     <input bind="txtindex"/>
                     <input bind="dtPay_Date"/>
                     <input bind="txtseq_str1"/>
                </input>
                <output>
                     <output bind="txtStatus"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    
    <gw:data id="dso_sel_booksrate" onreceive="OnSetBookRate()"> 
        <xml> 
            <dso type="process" procedure="AC_PRO_60100020_GET_BOOKCCY">
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="txt_date"/>
                     <input bind="lstBook_ccy"/>
                </input>  
                <output>
                     <output bind="txtBookRate"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>   
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
                    <td colspan="3"><gw:list id="lstCompany" onChange="OnSearch()" styles='width:100%'></gw:list></td>
                    <td align="center">Status</td>
                    <td colspan = 3>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td><gw:datebox id="dtPay_Date" onchange="" styles='width:85%' lang="1"/></td>
                            <td align="left"><gw:radio id="rbstatus" value="1" onchange="OnSearch()"> 
					                <span value="1">UnConfirmed</span>
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
				            <td ><gw:imgBtn id="ibtnNew"    img="new"       alt="New"       onclick="onNew()" /></td>
				            <td ><gw:imgBtn id="ibtnSave"   img="save"      alt="Save"      onclick="onSave()" /></td>
				            <td ><gw:imgBtn id="ibtnDelete" img="test"      alt="Merge"     onclick="onMerge()" /></td>
				            <td ><gw:imgBtn id="ibtnReport" img="printer"   alt="Print Acct" onclick="OnReport()" /></td>
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
                            <td width="30%"><gw:textbox id="txtcust_cd" styles='width:100%' onenterkey="OnSearchTrans()" onkeypress="Upcase()"/></td>
                            <td width="60%"><gw:textbox id="txtcust_nm" styles='width:100%'/></td>
                            <td width="0%"><gw:textbox  id="txtcust_pk" styles='display:none'/></td>
                            <td width="5%"><gw:imgBtn   img="reset"	id="idResetTr"  alt="Reset" onclick="Reset_Cust()"/></td>
                        </tr>
                        </table>
                    </td>
                    <td align="right">Voucher No</td>
                    <td><gw:textbox id="txtvoucher_no" styles="width:100%" onenterkey="OnSearch()"/></td>
			        <td><gw:icon id="btnConfirm"    img="in" text="Confirm"     styles='width:100%' onclick="OnConfirm()"/></td>
                    <td><gw:icon id="btnChk"        img="in" text="ChkAll" styles='width:100%' onclick="OnChkAll()"/></td>
                </tr>
                <tr>
                    <td align="right"><gw:label id="lblDate" text="Pay Date" /></td>
                    <td><gw:datebox id="dtPay_fr" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtPay_to" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center"><a title="Click here to select Profit & Loss(PL)" onclick="Popup_PL()" href="#tips"><b>Profit & Loss(PL)</b></td>
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
                    <td><gw:list id="lstType" onchange="OnSearch()" value ="" styles='width:100%'></gw:list></td>
                    <td colspan = 3>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td align="center"  width="85%"></td>
                            <td align="center"  width="5%"></td> 
                        </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right">Amount(VND~USD)</td>
                    <td align="left"><gw:textbox id="txtAmountTrans" text="" onenterkey="OnSearch()" /></td>
                    <td align="center">~</td>
                    <td align="left"><gw:textbox id="txtAmountBooks" text="" onenterkey="OnSearch()" /></td>
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
                <gw:tab id="idTab_Child"  onclick ="onSearchTab()">
                    <table name="Amount Infor" width ="100%" cellpadding ="0" cellspacing ="0" border="1" >
                        <tr>
                            <td width ="100%">
                                <gw:grid   
		                            id="grid_amount"
		                            header  ="Chk|Seq|Voucher Type|Voucher No|Prps Date|Appr.Date|Appr.No|Customer Name|Pay Date|Ccy|Rate|Amount Trans|Amount Books|_pk|_trd_pk|_acpk|Account Code|Account Name"
		                            format  ="3|0|0|0|4|4|0|0|4|0|0|0|0|0|0|0|0|0"
		                            aligns  ="1|1|1|1|1|1|0|0|1|1|1|3|3|0|0|0|1|2"
		                            defaults="|||||||||||||||||"
		                            acceptNullDate="T"
		                            editcol ="0|0|0|0|0|0|0|0|0|0|0|1|1|0|0|0|0|0"
		                            widths  ="400|600|1300|1500|1200|1200|1000|2000|1200|800|800|1500|0|0|0|0|1200|1500"
		                            styles  ="width:100%; height:365"
		                            sorting ="F"
		                            onafteredit  = "RowEdit()"
		                            />
                            </td>
                        </tr>
                        <tr>
                            <td width ="100%">
                                <table border=0 width="100%" cellpadding=0 cellspacing=0 >
                                <tr>
                                    <td width ="10%"></td>
                                    <td bgcolor="#008B8B" width ="5%"></td>
                                    <td width ="15%">&nbsp;&nbsp;&nbsp; ----   Total Balance    ----</td>
                                    <td width ="10%"></td>
                                    <td bgcolor="#FF2FAD" width ="5%"></td>
                                    <td width ="15%">&nbsp;&nbsp;&nbsp; ----   Pay    ----</td>
                                    <td width ="10%"></td>
                                    <td bgcolor="#ADFF2F" width ="5%"></td>
                                    <td width ="15%">&nbsp;&nbsp;&nbsp; ----   Remain Balance    ----</td>
                                </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <table name="Invoice & Plan" width ="100%" cellpadding ="0" cellspacing ="0" border="1" >
                            <tr>
				                <td width ="100%">
                                    <gw:grid   
		                                id="grid_invoice"
		                                header  ="Seq|Voucher No|P/L Name|Desc|Desc Local|Invoice Date|Invoice No|Due Date|Plan Due Date|Contract No|Remark|_pk"
		                                format  ="0|0|0|0|0|0|0|4|0|0|0|0"  
		                                aligns  ="1|1|1|0|0|0|0|1|0|0|0|0" 
		                                defaults="|||||||||||"  
		                                acceptNullDate="T"
		                                editcol ="0|0|0|0|0|0|0|1|0|0|1|0"
		                                widths  ="600|1500|1500|1500|1500|1500|1000|1500|1500|1300|0|0"  
		                                styles  ="width:100%; height:380"
		                                sorting ="F"
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
<gw:textbox id="txtseq_str1"            style="display:none" />
<gw:textbox id="txtindex"               style="display:none" />
<gw:textbox id="txtStatus"              style="display:none" />

<gw:list    id="lstBook_ccy" 		    style="display:none"></gw:list >
<gw:textbox id="txtBookRate"            style="display:none" />
<gw:textbox id="txt_date"               style='display:none'/>
<gw:textbox id="txtUser_Pk" styles="display:none;" />
</body>
</html>
