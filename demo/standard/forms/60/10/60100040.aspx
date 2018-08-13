<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>External Payment</title>
  </head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 
<script>
var click_dr = 0;
var click_cr = 0;
var flag_del = false;
var cur_before_change = "";

var click_tab0   = true;
var click_tab1   = true;
var click_tab2   = true;

var g_upd_yn_dr = false;
var g_upd_yn_cr = false;
var g_user_pk = "";
var g_emp_id = "";
var g_usr_id = "";

var G_Pre_Chk = 0,
	G_Pre_Seq = 1,
	G_Pre_VoucherNo = 2,
	G_Pre_custpk = 3,
	G_Pre_PartnerCode = 4,
	G_Pre_PartnerName = 5,
	G_Pre_TransAmount = 6,
	G_Pre_BooksAmount = 7,
	G_Pre_SerialNo = 8,
	G_Pre_InvoiceNo = 9,
	G_Pre_InvoiceDate = 10,
	G_Pre_AccCode = 11,
	G_Pre_AccName = 12,
	G_Pre_PayDate = 13,
	G_Pre_PayCcy = 14,
	G_Pre_PayRate = 15,
	G_Pre_Description = 16,
	G_Pre_LocalDescription = 17,
	G_Pre_TFN_EPPAYTR_PK = 18,
	G_Pre_PayMethod = 19,
	G_Pre_PayType = 20;
	
	
function BodyInit()
{
    System.Translate(document);
    g_user_pk = "<%=Session("USER_PK") %>";
    g_emp_id = "<%=Session("EMP_ID") %>";
    g_usr_id = "<%=Session("User_ID") %>";
    
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 AND PK IN (2) ")%>";
    var ls_data1       = "<%=CtlLib.SetListDataSQL("SELECT A.PK, A.ORG_NM FROM  TCO_ORG A WHERE (A.END_DATE >= '20080101' OR A.END_DATE IS NULL)")%>";
    var ls_data2       = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACBG0130') FROM DUAL")%>";
    
    var ls_date1       = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL")%>";
	
    var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
    var ls_Book_ccy    = "<%=CtlLib.SetListDataFUNC("select a.code, a.code code_nm from tac_commcode_detail a, tac_commcode_master b where a.del_if = 0 and b.del_if = 0 and a.tac_commcode_master_pk = b.pk and b.id='ACBG0040' and a.def_yn = 'Y'")%>";
    var ls_Type        = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACAB001') FROM DUAL")%>";
    var ls_data4       = "<%=CtlLib.SetDataSQL("SELECT CODE FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'ACBG0130' AND B.CHAR_3 = 'AP' AND A.DEL_IF = 0 AND B.DEL_IF = 0")%>";
    var ls_trans_pk       = "<%=CtlLib.SetDataSQL("select pk from tac_abtrtype where del_if = 0 and tr_type = 'Y001'")%>";
	txttrans_pk.text = ls_trans_pk;
	txttrans_cd.text = 'Y001';
	var ls_trans_nm       = "<%=CtlLib.SetDataSQL("select tr_tpnm from tac_abtrtype where del_if = 0 and tr_type = 'Y001'")%>";
	txttrans_nm.text = ls_trans_nm;
	lstType.SetDataText(ls_Type);
	lstType.value 	= 'AL';
    //dtPay_fr.SetDataText(ls_date_fr);
    <%=CtlLib.SetGridColumnComboFormat("grdDebit", 6,"SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
    <%=CtlLib.SetGridColumnComboFormat("grdCredit", 6,"SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
    
    lstBook_ccy.SetDataText(ls_Book_ccy);
    txt_date.SetDataText(ls_date1);
    lstCompany.SetDataText(ls_data);

    lstDepartment.SetDataText(ls_data1);
    lstVoucherType.SetDataText(ls_data2);
    lstVoucherType.value = 'BN';
    
    txtcust_nm.SetEnable(false);
    txttrans_nm.SetEnable(false);
    ls_data4 = "<%=CtlLib.SetListDataSQL("select pk, bank_id from tac_abdepomt where del_if = 0 and use_yn = 'Y' and depo_period is null order by bank_id asc")%>"
	lstBankID.SetDataText(ls_data4);
	
    grdDebit.ClearData();
    grdCredit.ClearData();
    idGridItem.SetData("");
    grid_paid.ClearData();
    grid_amount.ClearData();
    btnPayment.SetEnable(false);
    btnCancel.SetEnable(false);
    SetGridData();
    txtProposedByUserPk.text = "<%=Session("USER_PK")%>";	    
    txtProposedByUserID.text = "<%=Session("User_ID")%>";
    txtProposedByUserName.text = "<%=Session("USER_NAME")%>";
    txtEmp_ID.SetDataText(g_usr_id);
    lstDepartment.value = "<%=Session("ORG_PK")%>";   
    var ls_data8    = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('GFQC0016') FROM DUAL")%>";
    btnReportList.SetDataText(ls_data8);
    btnReportList.value = '40';
    txtUser_PK.SetDataText(g_user_pk); 
    dso_getCompany.Call();
    //dso_sel_booksrate.Call();
}

function OnToggle()
{
    var left        = document.all("tdGrid");
    var right       = document.all("tdControlItem");
    var imgArrow    = document.all("imgArrow");
    
    if(imgArrow.status == "collapse")
    {
        right.style.display = "none";       
        imgArrow.status     = "expand";
        left.style.width    = "100%";
        imgArrow.src        = "../../../system/images/prev_orange.gif";
    }
    else
    {
        right.style.display = "";
        imgArrow.status     = "collapse";
        left.style.width    = "60%";
        imgArrow.src        = "../../../system/images/next_orange.gif";
    }
}

function OnCtrToggleLeft()
{
    var left        = document.all("tdGrid");
    var right       = document.all("tdControlItem");
    var imgArrow    = document.all("imgArrow");
    
    right.style.display = "";
    imgArrow.status     = "collapse";
    left.style.width    = "60%";
    imgArrow.src        = "../../../system/images/next_orange.gif";
}

function OnCtrToggleRight()
{
    var left    = document.all("tdGrid");
    var right   = document.all("tdControlItem");
    var imgArrow = document.all("imgArrow");
    
    if(imgArrow.status == "collapse")
    {
        right.style.display = "none";       
        imgArrow.status     = "expand";
        left.style.width    = "100%";
        imgArrow.src        = "../../../system/images/prev_orange.gif";
    }
}

function OnChangeRadio()
{
    grdDebit.ClearData();
    grdCredit.ClearData();
    idGridItem.SetData("");
    grid_paid.ClearData();
    grid_amount.ClearData();
    grid_payable.ClearData();
    OnCheckTab();
    if (rbstatus.GetData() == 1)
    {
        idTab_Child.SetPage(0);
        dso_sel_grd_external_payment.Call('SELECT');
    }
    else if (rbstatus.GetData() == 2)
    {
        idTab_Child.SetPage(1);
        dso_sel_grd_payable.Call('SELECT');
    }
    else if (rbstatus.GetData() == 3)
    {
        idTab_Child.SetPage(2);
        dso_sel_grd_paid.Call('SELECT');
    }
    OnSetButton();
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

function OnSetButton()
{
    if (rbstatus.GetData() == 1)
    {
        ibtnUpdate.SetEnable(true);
        btnPayment.SetEnable(false);
        btnSave.SetEnable(false);
        btnCancel.SetEnable(false);
        grid_amount.ClearData();
    }
    else if (rbstatus.GetData() == 2)
    {
        ibtnUpdate.SetEnable(false);
        btnPayment.SetEnable(true);
        btnCancel.SetEnable(true);
        btnSave.SetEnable(true);
        OnCtrToggleRight();
        txtsum_chk_dr_famt.SetDataText("");
        txtsum_chk_dr_amt.SetDataText("");
        txtsum_total_dr_famt.SetDataText("");
        txtsum_total_dr_amt.SetDataText("");
        txtsum_chk_cr_famt.SetDataText("");
        txtsum_chk_cr_amt.SetDataText("");
        txtsum_total_cr_famt.SetDataText("");
        txtsum_total_cr_amt.SetDataText("");
        grid_payable.ClearData();
        grdDebit.ClearData();
        grdCredit.ClearData();
        idGridItem.SetData("");
    }
    else if (rbstatus.GetData() == 3)
    {
        grid_paid.ClearData();
        ibtnUpdate.SetEnable(false);
        btnPayment.SetEnable(false);
        btnCancel.SetEnable(true);
        btnSave.SetEnable(false);
    }
}

function SetGridData()
{
    var fg1  = grid_amount.GetGridControl();
    var fg2  = grid_payable.GetGridControl();
    var fg3  = grdDebit.GetGridControl();
    var fg4  = grdCredit.GetGridControl();
    var fg5  = grid_paid.GetGridControl();

    if (lstBook_ccy.GetData() == 'VND')
    {
        fg1.ColFormat(G_Pre_TransAmount)     = "#,###,###,###,###,###,###,###,###R";
        fg1.ColFormat(G_Pre_BooksAmount)     = "#,###,###,###,###,###,###,###,###,###R";
        fg2.ColFormat(5)     = "#,###,###,###,###,###,###,###,###,###R";
        fg3.ColFormat(8)     = "#,###,###,###,###,###,###,###,###.##R";
        fg3.ColFormat(9)     = "#,###,###,###,###,###,###,###,###,###R";
        fg4.ColFormat(8)     = "#,###,###,###,###,###,###,###,###.##R";
        fg4.ColFormat(9)     = "#,###,###,###,###,###,###,###,###,###R";
        fg5.ColFormat(5)     = "#,###,###,###,###,###,###,###,###,###R";
    }
    else
    {
        fg1.ColFormat(G_Pre_TransAmount)     = "#,###,###,###,###,###,###,###,###.##R";
        fg1.ColFormat(G_Pre_BooksAmount)     = "#,###,###,###,###,###,###,###,###.##R";
        fg2.ColFormat(5)     = "#,###,###,###,###,###,###,###,###.##R";
        fg3.ColFormat(8)     = "#,###,###,###,###,###,###,###,###.##R";
        fg3.ColFormat(9)     = "#,###,###,###,###,###,###,###,###.##R";
        fg4.ColFormat(8)     = "#,###,###,###,###,###,###,###,###.##";
        fg4.ColFormat(9)     = "#,###,###,###,###,###,###,###,###.##R";
        fg5.ColFormat(5)     = "#,###,###,###,###,###,###,###,###.##R";
    }
}

function EnableTab(bool)
{
    click_tab0 = bool;
    click_tab1 = bool;
    click_tab2 = bool;
}

function OnSetDataRadio()
{
	if (idTab_Child.GetCurrentPageNo() == 0)
    {
        rbstatus.SetDataText('1');
        if (click_tab0 == true)
        {
            EnableTab(true);
            click_tab0 = false;
            OnChangeRadio();
        }
    }
    else if (idTab_Child.GetCurrentPageNo() == 1)
    {
        rbstatus.SetDataText('2');
        if (click_tab1 == true)
        {
            EnableTab(true);
            click_tab1 = false;
            OnChangeRadio();
			btnCancel.SetEnable(true);
        }
    }
    else if (idTab_Child.GetCurrentPageNo() == 2)
    {
        rbstatus.SetDataText('3');
        if (click_tab2 == true)
        {
            EnableTab(true);
            click_tab2 = false;
            OnChangeRadio();
        }
    }
}

function OnUpDr()
{
	var lb_flag
    ctrl = grdDebit.GetGridControl();
	rows = ctrl.Rows  - 1;
	if (rows > 1)
	{
	    var j = 0;
        var i = 1;
        while ((i < ctrl.rows) && (j < 1))
        {
            if (ctrl.isSelected(i) == true)
            {
                j = j + 1;
            }
            i = i + 1;
        }

        if (j > 1)
        {
            alert('    You must one row to move!!!'+'\n'+'Bạn chỉ chọn 1 dòng để di chuyển!!!')
            return;
        }
	    i = 1;
	    lb_flag = false;
	    while ((i <= rows) && !lb_flag)
	    {
	        if (ctrl.isSelected (i) == true)
	        {
	            lb_flag = true;
	        }
	        else
	        {
	            i = i + 1;
            }
	    }
	}
	if (lb_flag)
	{
        if (grdDebit.selrow > 1)
        {
            for (i = 1; i < grdDebit.rows; i++)
            {
                grdDebit.SetCellBold(i,1,i,15,false);
                grdDebit.SetRowEditable(i, false);
            }
            grdDebit.UpRow();
        }
	}
	else
	{
		if (ctrl.rows < 3) return;
		alert('   Please select one row to move!!!'+'\n'+'Bạn hãy chọn 1 dòng để di chuyển!!!');
		return;
	}
}

function OnDownDr()
{
	var lb_flag
    ctrl = grdDebit.GetGridControl();
	rows = ctrl.Rows  - 1;
	if (rows > 1)
	{
	    var j = 0;
        var i = 1;
        while ((i < ctrl.rows) && (j < 1))
        {
            if (ctrl.isSelected(i) == true)
            {
                j = j + 1;
            }
            i = i + 1;
        }

        if (j > 1)
        {
            alert('    You must one row to move!!!'+'\n'+'Bạn chỉ chọn 1 dòng để di chuyển!!!')
            return;
        }
	    i = 1;
	    lb_flag = false;
	    while ((i <= rows) && !lb_flag)
	    {
	        if (ctrl.isSelected (i) == true)
	        {
	            lb_flag = true;
	        }
	        else
	        {
	            i = i + 1;
            }
	    }
	}
	if (lb_flag)
	{
        if (grdDebit.selrow < ctrl.rows -1 )
        {
            for (i = 1; i < grdDebit.rows; i++)
            {
                grdDebit.SetCellBold(i,1,i,15,false);
                grdDebit.SetRowEditable(i, false);
            }
            grdDebit.DownRow();
        }
	}
	else
	{
		if (ctrl.rows < 3) return;
		alert('   Please select one row to move!!!'+'\n'+'Bạn hãy chọn 1 dòng để di chuyển!!!');
		return;
	}
}

function OnUpCr()
{
	var lb_flag
    ctrl = grdCredit.GetGridControl();
	rows = ctrl.Rows  - 1;
	if (rows > 1)
	{
	    var j = 0;
        var i = 1;
        while ((i < ctrl.rows) && (j < 1))
        {
            if (ctrl.isSelected(i) == true)
            {
                j = j + 1;
            }
            i = i + 1;
        }

        if (j > 1)
        {
            alert('    You must one row to move!!!'+'\n'+'Bạn chỉ chọn 1 dòng để di chuyển!!!')
            return;
        }
	    i = 1;
	    lb_flag = false;
	    while ((i <= rows) && !lb_flag)
	    {
	        if (ctrl.isSelected (i) == true)
	        {
	            lb_flag = true;
	        }
	        else
	        {
	            i = i + 1;
            }
	    }
	}
	if (lb_flag)
	{
        if (grdCredit.selrow > 1)
        {
            for (i = 1; i < grdCredit.rows; i++)
            {
                grdCredit.SetCellBold(i,1,i,15,false);
                grdCredit.SetRowEditable(i, false);
            }
            grdCredit.UpRow();
        }
	}
	else
	{
		if (ctrl.rows < 3) return;
		alert('  Please select one row to move!!!'+'\n'+'Bạn hãy chọn 1 dòng để di chuyển!!!');
		return;
	}
}

function OnDownCr()
{
	var lb_flag
    ctrl = grdCredit.GetGridControl();
	rows = ctrl.Rows  - 1;
	if (rows > 1)
	{
	    var j = 0;
        var i = 1;
        while ((i < ctrl.rows) && (j < 1))
        {
            if (ctrl.isSelected(i) == true)
            {
                j = j + 1;
            }
            i = i + 1;
        }

        if (j > 1)
        {
            alert('    You must one row to move!!!'+'\n'+'Bạn chỉ chọn 1 dòng để di chuyển!!!')
            return;
        } 
	    
	    i = 1;
	    lb_flag = false;
	    while ((i <= rows) && !lb_flag)
	    {
	        if (ctrl.isSelected (i) == true)
	        {
	            lb_flag = true;
	        }
	        else
	        {
	            i = i + 1;
            }
	    }
	}
	if (lb_flag)
	{
        if (grdCredit.selrow < ctrl.rows -1 )
        {
            for (i = 1; i < grdCredit.rows; i++)
            {
                grdCredit.SetCellBold(i,1,i,15,false);
                grdCredit.SetRowEditable(i, false);
            }
            grdCredit.DownRow();
        }
	}
	else
	{
		if (ctrl.rows < 3) return;
		alert('Please select one row to move!!!'+'\n'+'Bạn hãy chọn 1 dòng để di chuyển!!!');
		return;
	}
}

function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise,    
}

function OnSearch()
{
    OnCheckTab();
    OnChangeRadio();
}

function OnCheckAll()
{
    var n = 0, v_pay_method = "";
    if (grid_amount.rows > 1)
    {
        if (chk_all.GetData() == 'T')
        {
            // kiem tra
            v_pay_method = grid_amount.SetGridText(1, G_Pre_PayType);
            for (i = 2; i< grid_amount.rows; i++)
            {
                grid_amount.SetGridText(i, G_Pre_Chk, -1);
            }
            
            for (i = 1; i< grid_amount.rows; i++)
            {
                grid_amount.SetGridText(i, G_Pre_Chk, -1);
            }
        }
        else
        {
            for (i = 1; i< grid_amount.rows; i++)
            {
                grid_amount.SetGridText(i, G_Pre_Chk, 0);
            }
        }
    }
}

function onCheck()
{
    if (txttrans_pk.GetData() == "")
    {
        alert('  Please choose Trans Group!!!'+'\n'+'Bạn hãy chọn loại Trans Group!!!');
        return false;
    }
    if (txtProposedByUserPk.GetData() == "")
    {
        alert(''+'\n'+'Bạn đã hết phiên giao dịch. Hãy đăng nhập lại, cảm ơn!!!');
        return false;
    }
    if (txtdesc.GetData() =="")
    {
        alert('Description is not null!!!'+'\n'+'Diễn giải không được rỗng!!!');
        txtdesc.GetControl().focus();
        return false;
    }
    
    if (txtdesc_local.GetData() =="")
    {
        alert('Description Local is not null!!!'+'\n'+'Diễn giải địa phương không được rỗng!!!');
        txtdesc_local.GetControl().focus();
        return false;
    }
    
    if (txtBookRate.GetData() == "" || txtBookRate.GetData() == 0)
    {
        alert('You must type in day ratio: '+ txt_date.GetData() +'\n'+'Bạn hãy nhập tỉ giá ngày: '+ txt_date.GetData());
        return false;
    }
    var k = 0;
    for (i=1; i<grid_amount.rows; i++)
	{
		var tmp = grid_amount.GetGridData(i, G_Pre_Chk);
		if (tmp == "-1")
		{
			k = k + 1;
		}
    }
    if (k > 1)
    {
        var data_i;
        var data_j;
        for (i=1; i<grid_amount.rows - 1; i++)
	    {
			if(grid_amount.GetGridData(i, G_Pre_Chk) =="-1")
			{
				for (j=i+1; j<grid_amount.rows; j++)
				{
					if(grid_amount.GetGridData(j, G_Pre_Chk) =="-1")
					{
						
						data_i = grid_amount.GetGridData(i, G_Pre_PayCcy);
						data_j = grid_amount.GetGridData(j, G_Pre_PayCcy);
						if (data_i != data_j)
						{
							alert(''+'\n'+'Loại tiền trả không giống nhau. Bạn hãy kiểm tra lại!!!');
							return false;
						}
						
						data_i = grid_amount.GetGridData(i, G_Pre_PayRate);
						data_j = grid_amount.GetGridData(j, G_Pre_PayRate);
						
						data_i = grid_amount.GetGridData(i, G_Pre_custpk);
						data_j = grid_amount.GetGridData(j, G_Pre_custpk);
						if (data_i != data_j)
						{
							alert(''+'\n'+'Mã khách hàng không giống nhau. Bạn hãy kiểm tra lại!!!');
							return false;
						}
					}		
				}
			}
		}
    }
	return true;
}

function Popup_Cust()
{
    var path = System.RootURL + '/standard/forms/60/08/60080030_popup_customer.aspx';
    var object = System.OpenModal( path ,800 , 500 , 'resizable:yes;status:yes');
    if ( object != null )
    {
        if (object[0] != 0)
        {
            txtcust_cd.SetDataText(object[1]);
            txtcust_nm.SetDataText(object[2]);
            txtcust_pk.SetDataText(object[0]);
        }
    }
}

function Reset_Cust()
{
    txtcust_cd.SetDataText('');
    txtcust_nm.SetDataText('');
    txtcust_pk.SetDataText('');
}

function Popup_Trans()
{
    var path = System.RootURL + '/standard/forms/60/05/60050010_Transaction.aspx?compk='+ lstCompany.GetData();
    aValue = System.OpenModal( path ,850 , 500 ,  'resizable:yes;status:yes');
    if ( aValue != null )
	{
		var tmp = aValue[0];
		if (tmp[1] != null)
		{
		    txttrans_cd.SetDataText(tmp[1]);
            txttrans_nm.SetDataText(tmp[2]);
            txttrans_pk.SetDataText(tmp[0]);
        }
    }
}

function Reset_Trans()
{
    txttrans_cd.SetDataText("");
    txttrans_nm.SetDataText("");
    txttrans_pk.SetDataText("");
}

function OnSetBookRate()
{
    if (txtBookRate.GetData() == 0)
    {
        alert('You must type in day ratio: '+ txt_date.GetData() +'\n'+'Bạn hãy nhập tỉ giá ngày: '+ txt_date.GetData());
        return;
    }
    if (txtProposedByUserPk.GetData() == "")
    {
        alert(''+'\n'+'Bạn đã hết phiên giao dịch. Hãy đăng nhập lại, cảm ơn!!!');
        return;
    }
    
}

function OnSetBkRate()
{
    dso_sel_booksrate.Call();
    
}

function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {
        case 'dso_get_department':
            OnGetBankID();
            break;
        case 'dso_getCompany':
            dso_get_department.Call();
            //dso_sel_booksrate.Call();
        break;
        case 'dso_get_bankid':
            dso_sel_booksrate.Call();
        break;
        case "dso_upd_grd_dtl_ext_payment_dr":
            if (g_upd_yn_dr == false)
            {
                txt_drcr_type.SetDataText('C');            
                // grdCredit get data
                dso_upd_grd_dtl_ext_payment_cr.Call("SELECT");
            }
            else
            {
                click_dr = 0;
                click_cr = 0;                
                SaveItemControl();
                g_upd_yn_dr = false;
            }
        break;
        
        case "dso_upd_grd_dtl_ext_payment_cr":
            if(g_upd_yn_cr)
            {
                click_dr = 0;
                click_cr = 0;
                SaveItemControl();
                g_upd_yn_cr = false;
            }
        break;
        
        case "dso_upd_confirm_payment":
            rbstatus.SetDataText("3");
            OnChangeRadio();
        break;
        
        case "dso_upd_cancel_ext_payment":
            rbstatus.SetDataText("1");
            OnChangeRadio();
        break;
        
        case "dso_upd_external_payment":
            txtdesc.SetDataText('');
            txtdesc_local.SetDataText('');
            rbstatus.SetDataText("2");
            OnCtrToggleRight();
            OnChangeRadio();
        break;
        case "dso_upd_paydate":
            dso_sel_grd_payable.Call('SELECT');
        break;
    }
}

function OnNewDr()
{
    if (txttrans_pk.GetData() != '')
    {
        OnCtrToggleRight();
        Popup_OnNew('D');
    }
    else
    {
        alert('Please Choose Transaction Type!!!'+'\n'+'    Bạn hãy chọn loại giao dịch!!!');
        return;
    }
}

function OnNewCr()
{
    if (txttrans_pk.GetData() != '')
    {
        OnCtrToggleRight();
        Popup_OnNew('C');
    }
    else
    {
        alert('Please Choose Transaction Type!!!'+'\n'+'    Bạn hãy chọn loại giao dịch!!!');
        return;
    }
}


function Popup_OnNew(p_data)
{
	
    if (grid_payable.selrow < 1)
    {
        alert('Please Select Master!!!'+'\n'+'    Bạn hãy chọn loại giao dịch!!!');
        return;
    }
    var i = 0;
    var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_new.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + txttrans_cd.GetData() + "&val1=" + txttrans_nm.GetData() + "&val2=" + p_data + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel60100040_new_drcr";
    aValue      = System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	
    if ( aValue != null ) 
    {
        if (aValue.length > 0)
        {
			txt_eppaytrd_pk.SetDataText('');
            for(i=0; i<aValue.length; i++)
            {
                var tmp = aValue[i];
                if (tmp[1] != 0)
                {
                    if (p_data == 'D')
                    {
                        grdDebit.AddRow();
                        grdDebit.SetGridText( grdDebit.rows - 1, 14, 'D' );
					    grdDebit.SetGridText( grdDebit.rows - 1, 1, tmp[1]);    //ACPK
					    grdDebit.SetGridText( grdDebit.rows - 1, 4, tmp[4]);    //Account Code
					    grdDebit.SetGridText( grdDebit.rows - 1, 5, tmp[5]);    //Account Name
					    if (grdDebit.rows > 2)
					    {
					        var ls_curr = grdDebit.GetGridData(grdDebit.rows - 2, 6);
					        var ls_rate = grdDebit.GetGridData(grdDebit.rows - 2, 7);
					        var ls_ref  = grdDebit.GetGridData(grdDebit.rows - 2, 3);
					        grdDebit.SetGridText( grdDebit.rows - 1, 6, ls_curr);       //Rate
					        grdDebit.SetGridText( grdDebit.rows - 1, 7, ls_rate);       //Rate
					        grdDebit.SetGridText( grdDebit.rows - 1, 3, ls_ref);
					    }
					    else
					    {
					        grdDebit.SetGridText( grdDebit.rows - 1, 7, '1');           //Rate
					        grdDebit.SetGridText( grdDebit.rows - 1, 3, '1' );
					    }
					    grdDebit.SetGridText( grdDebit.rows - 1, 10, txtdesc.text );          //Desc Eng
					    grdDebit.SetGridText( grdDebit.rows - 1, 11, txtdesc_local.text );    //Desc Local
					    grdDebit.SetGridText( grdDebit.rows - 1, 12, grid_payable.GetGridData(grid_payable.selrow, 1));
					    grdDebit.SetGridText( grdDebit.rows - 1, 16, lstCompany.GetData());
					    grdDebit.SetGridText( grdDebit.rows - 1, 18, txtBookRate.GetData());
					    click_dr = 0
					    //grdDebit.SetRowEditable( grdDebit.rows - 1, false);
                    }
                    else if (p_data == 'C')
                    {
                        grdCredit.DeselectRow(grdCredit.selrow);
                        grdCredit.AddRow();
                        grdCredit.SelectRow(grdCredit.rows - 1);
                        grdCredit.SetGridText( grdCredit.rows - 1, 14, 'C' );
					    grdCredit.SetGridText( grdCredit.rows - 1, 1, tmp[1]);  //ACPK
					    grdCredit.SetGridText( grdCredit.rows - 1, 4, tmp[4]);  //Account Code
					    grdCredit.SetGridText( grdCredit.rows - 1, 5, tmp[5]);  //Account Name
					    if (grdCredit.rows > 2)
					    {
					        var ls_curr = grdCredit.GetGridData(grdCredit.rows - 2, 6);
					        var ls_rate = grdCredit.GetGridData(grdCredit.rows - 2, 7);
					        var ls_ref  = grdCredit.GetGridData(grdCredit.rows - 2, 3);
					        grdCredit.SetGridText( grdCredit.rows - 1, 6, ls_curr);       //Rate
					        grdCredit.SetGridText( grdCredit.rows - 1, 7, ls_rate);       //Rate
					        grdCredit.SetGridText( grdCredit.rows - 1, 3, ls_ref);
					    }
					    else
					    {
					        grdCredit.SetGridText( grdCredit.rows - 1, 7, '1');           //Rate
					        grdCredit.SetGridText( grdCredit.rows - 1, 3, '1');
					    }
					    var ls_ref;
					    if (grdDebit.selrow != -1)
					    {
					        ls_ref = grdDebit.GetGridData(grdDebit.selrow, 3);
					    }
					    else
					    {
					        ls_ref = 1;
					    }
					    grdCredit.SetGridText( grdCredit.rows - 1, 3, ls_ref );
                        OnSetData_CR(ls_ref);
					    grdCredit.SetGridText( grdCredit.rows - 1, 10, txtdesc.text );         //Desc Eng
					    grdCredit.SetGridText( grdCredit.rows - 1, 11, txtdesc_local.text );   //Desc Local
					    grdCredit.SetGridText( grdCredit.rows - 1, 12, grid_payable.GetGridData(grid_payable.selrow, 1));
					    grdCredit.SetGridText( grdCredit.rows - 1, 16, lstCompany.GetData());
					    grdCredit.SetGridText( grdCredit.rows - 1, 18, txtBookRate.GetData());
					    click_cr = 0
					    //grdCredit.SetRowEditable(grdCredit.rows - 1, false);
                    }
                }
            }
        }
    }
}

function OnSetData_CR(p_ref)
{
	var l_sum_dr = 0;
	var l_sum_cr = 0;
	for (i = 1; i < grdDebit.rows; i++)
	{
        if (grdDebit.GetGridData(i, 3) == p_ref)
        {
            l_sum_dr = l_sum_dr + Number(grdDebit.GetGridData(i, 9));
        }
	}
	for (i = 1; i < grdCredit.rows - 1; i++)
	{
        if ((grdCredit.GetGridData(i, 3) == p_ref))
        {
            l_sum_cr = l_sum_cr + Number(grdCredit.GetGridData(i, 9));
        }
	}
	//grdCredit.SetGridText( grdCredit.rows - 1, 9, Math.round(l_sum_dr) - Math.round(l_sum_cr));
	//alert(l_sum_dr);
	//alert(l_sum_cr);
	grdCredit.SetGridText( grdCredit.rows - 1, 9, l_sum_dr - l_sum_cr);
}

function RowClick_DR()
{
//	    if ((grdDebit.rows > 1) && (grdDebit.selrow < grdDebit.rows) && (grdDebit.selrow != click_dr))
//	    {
//            for (i = 1; i < grdDebit.rows; i++)
//            {
//                if (grdDebit.selrow == i)
//                {
//	                grdDebit.SetCellBold(i,1,i,15,true);
//	                if (grdDebit.GetGridData(grdDebit.selrow, 15) == '')
//	                {
//	                    grdDebit.SetRowEditable(i, true);
//                    }
//                    else
//                    {
//                        grdDebit.SetRowEditable(i, false);
//                    }
//                }
//                else
//                {
//	                grdDebit.SetCellBold(i,1,i,15,false);
//	                grdDebit.SetRowEditable(i, false);
//                }
//            }
            txtacpk.SetDataText(grdDebit.GetGridData(grdDebit.selrow, 1));
            txt_eppaytrd_pk.SetDataText(grdDebit.GetGridData(grdDebit.selrow, 0));
            txt_rowclick.text = grdDebit.selrow;
            txt_drcr_type.SetDataText('D');
            idGridItem.SetData("");
            click_dr = grdDebit.selrow;
            click_cr = 0;
            txt_eppaytrh_pk.SetDataText(grdDebit.GetGridData(grdDebit.selrow, 12)); // tfn_eppaytrh_pk
            dso_upd_ctl_item.Call("SELECT");            
        //}
        OnCheckSumDR();    
}

function RowClick_CR()
{
//    if ((grdCredit.rows > 1) && (grdCredit.selrow < grdCredit.rows) && (grdCredit.selrow != click_cr))
//    {
//        for (i = 1; i < grdCredit.rows; i++)
//        {
//            if (grdCredit.selrow == i)
//            {
//                grdCredit.SetCellBold(i,1,i,15,true);
//                grdCredit.SetRowEditable(i, true);
//            }
//            else
//            {
//                grdCredit.SetCellBold(i,1,i,15,false);
//                grdCredit.SetRowEditable(i, false);
//            }
//        }
        txtacpk.SetDataText(grdCredit.GetGridData(grdCredit.selrow, 1));
        txt_eppaytrd_pk.SetDataText(grdCredit.GetGridData(grdCredit.selrow, 0));
        txt_rowclick.text = grdCredit.selrow;
        txt_drcr_type.SetDataText('C');
        idGridItem.SetData("");
        click_cr = grdCredit.selrow;
        click_dr = 0;
        txt_eppaytrh_pk.SetDataText(grdCredit.GetGridData(grdCredit.selrow, 12)); // tfn_eppaytrh_pk
        dso_upd_ctl_item.Call("SELECT");
    //}
    OnCheckSumCR();    
}

function OnCheckSumDR()
{
	var ctrl 	    = grdDebit.GetGridControl();
	var sum_dr_famt = 0;
	var sum_dr_amt  = 0;
	for (i=1; i < ctrl.rows; i++)
	{
		var tmp = grdDebit.GetGridData(i, 2);
		if (tmp == '-1')
		{
			sum_dr_famt = Number(sum_dr_famt) + Number(grdDebit.GetGridData(i, 8));
			sum_dr_amt  = Number(sum_dr_amt)  + Number(grdDebit.GetGridData(i, 9));
		}
	}
	txtsum_chk_dr_famt.SetDataText(''   + sum_dr_famt);
	txtsum_chk_dr_amt.SetDataText(''    + sum_dr_amt);
	OnSumDR();
}

function OnCheckSumCR()
{
	var ctrl 	    = grdCredit.GetGridControl();
	var sum_cr_famt = 0;
	var sum_cr_amt  = 0;
	for (i=1; i < ctrl.rows; i++)
	{
		var tmp = grdCredit.GetGridData(i, 2);
		if (tmp == '-1')
		{
			sum_cr_famt = Number(sum_cr_famt) + Number(grdCredit.GetGridData(i, 8));
			sum_cr_amt  = Number(sum_cr_amt)  + Number(grdCredit.GetGridData(i, 9));
		}
	}
	txtsum_chk_cr_famt.SetDataText('' + sum_cr_famt);
	txtsum_chk_cr_amt.SetDataText(''  + sum_cr_amt);
	OnSumCR();
}

function OnSumCR()
{
    var ctrl = grdCredit.GetGridControl();
    var sum_cr_famt = 0; 
    var sum_cr_amt  = 0;
    for (i = 1; i < ctrl.rows; i++)
	{
	     sum_cr_famt = sum_cr_famt + Number(grdCredit.GetGridData(i, 8));
	     sum_cr_amt  = sum_cr_amt  + Number(grdCredit.GetGridData(i, 9));
	}
	txtsum_total_cr_famt.SetDataText('' + sum_cr_famt);
	txtsum_total_cr_amt.SetDataText('' + sum_cr_amt);
}

function OnSumDR()
{
    var ctrl = grdDebit.GetGridControl();
    var sum_dr_famt = 0;
    var sum_dr_amt  = 0;
    for (i = 1; i < ctrl.rows; i++)
	{
	     sum_dr_famt = Number(sum_dr_famt) + Number(grdDebit.GetGridData(i, 8));
	     sum_dr_amt  = Number(sum_dr_amt)  + Number(grdDebit.GetGridData(i, 9));
	}
	txtsum_total_dr_famt.SetDataText('' + sum_dr_famt);
	txtsum_total_dr_amt.SetDataText('' + sum_dr_amt);
}

function RowEditBefore(p_drcr)
{
    if (p_drcr == 'DR')
    {
        cur_before_change = grdDebit.GetGridData(event.row, 6);
    }
    else if (p_drcr == 'CR')
    {
        cur_before_change = grdCredit.GetGridData(event.row, 6);
    }
}

function RowEditDR()
{
    var dr_famt = 0;
    var dr_rate = 0;
    
    if ((event.col == 6) && (grdDebit.GetGridData(event.row, 15) == ""))
    {
        RowChange('DR')
    }
    else if ((event.col == 6) && (grdDebit.GetGridData(event.row, 15) != ""))
    {
        grdDebit.SetGridText(event.row, 6, cur_before_change);
    }
    if (((event.col == 8) || (event.col == 7)) ) // amount trans & Rate //&& ((grdDebit.GetGridData(event.row, 15) == ""))
    {
        dr_rate = Number(grdDebit.GetGridData(event.row, 7));
        dr_famt = Number(grdDebit.GetGridData(event.row, 8));
        if (!isFinite(dr_rate))
        {
            alert('Rare transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tỉ giá giao dịch là số. Bạn hãy kiểm tra lại dòng '+ (event.row) +'!!!')
            return false;
        }
        if (!isFinite(dr_famt))
        {
            alert('Amount Transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tiền giao dịch là số. Bạn hãy kiểm tra lại dòng '+ (event.row) +'!!!')
            return false;
        }
        var ls_ccy      = grdDebit.GetGridData(txt_rowclick.text, 6);
        var ls_bookccy  = txtBookRate.GetData();
        if (!OnCheckCur('DR'))
        {
            return;
        }
        if (ls_ccy == lstBook_ccy.GetData())
        {
            grdDebit.SetGridText(txt_rowclick.text, 9, dr_famt);
        }
        else
        {
            grdDebit.SetGridText(txt_rowclick.text, 9, Math.round(Number(dr_famt*(dr_rate/ls_bookccy)*100))/100);            
        }
    }
    OnSumDR();
}

function RowEditCR()
{
    var cr_famt = 0;
    var cr_rate = 0;
    if ((event.col == 6) && (grdCredit.GetGridData(event.row, 15) == ""))
    {
        RowChange('CR')
    }
    else if ((event.col == 6) && (grdCredit.GetGridData(event.row, 15) != ""))
    {
        grdCredit.SetGridText(event.row, 6, cur_before_change);
    }
    if (((event.col == 8) || (event.col == 7)) && ((grdCredit.GetGridData(event.row, 15) == "")))
    {
        cr_rate = Number(grdCredit.GetGridData(event.row, 7));
        cr_famt = Number(grdCredit.GetGridData(event.row, 8));
        if (!isFinite(cr_rate))
        {
            alert('Rare transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tỉ giá giao dịch là số. Bạn hãy kiểm tra lại dòng '+ (event.row) +'!!!')
            return false;
        }
        if (!isFinite(cr_famt))
        {
            alert('Amount Transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tiền giao dịch là số. Bạn hãy kiểm tra lại dòng '+ (event.row) +'!!!')
            return false;
        }
        var ls_ccy  = grdCredit.GetGridData(txt_rowclick.text, 6);
        var ls_bookccy = txtBookRate.GetData();
        if (!OnCheckCur('CR'))
        {
            return;
        }
        if (ls_ccy == lstBook_ccy.GetData())
        {
            grdCredit.SetGridText(txt_rowclick.text, 9, cr_famt);    
        }
        else
        {
            grdCredit.SetGridText(txt_rowclick.text, 9, Math.round(Number(cr_famt*(cr_rate/ls_bookccy)*100))/100);
        }
    }
    OnSumCR();
}

function RowChange(p_data)
{
    txtcur.text     = '';
    txt_rowclick.text    = '';
    if (p_data == 'DR')
    {
        txtcur.text = grdDebit.GetGridData(event.row, 6);
        txt_rowclick.text = event.row;
        dso_get_rate_dr.Call();
    }
    else if (p_data == 'CR')
    {
        txtcur.text = grdCredit.GetGridData(event.row, 6);
        txt_rowclick.text = event.row;
        dso_get_rate_cr.Call();
    }
}

function OnCheckCur(p_drcr)
{
    var ls_ccy;
    var rate;
    
    if (p_drcr == 'DR')
    {
        ls_ccy      = grdDebit.GetGridData(txt_rowclick.text, 6);
        rate        = grdDebit.GetGridData(txt_rowclick.text, 7);
    }
    else if (p_drcr == 'CR')
    {
        ls_ccy      = grdCredit.GetGridData(txt_rowclick.text, 6);
        rate        = grdCredit.GetGridData(txt_rowclick.text, 7);
    }
    if ((ls_ccy == 'VND') && (rate > 1))
    {
        alert('Base rate (VND) is not greater than one!!!'+'\n'+'Tỉ lệ quy đổi (VND) không được lớn hơn 1!!!')
        return false;
    }
    if (rate < 1)
    {
        alert('You must input Base Rate to date: '+ dttrs_date.GetData() +'\n'+'       Bạn hãy nhập tỉ giá ngày: '+ dttrs_date.GetData())
        return false;
    }
    return true;
}

function SetCurrent(p_data)
{
    var rate = 0;
    if (p_data == 'DR')
    {
        rate = txtrate.GetData();
        grdDebit.SetGridText(txt_rowclick.text, 7, rate);
        var dr_famt     = Number(grdDebit.GetGridData(txt_rowclick.text, 8));
        var ls_ccy      = grdDebit.GetGridData(txt_rowclick.text, 6);
        var ls_bookccy  = txtBookRate.GetData();
        if (!OnCheckCur('DR'))
        {
            return;
        }
        if (ls_ccy == lstBook_ccy.GetData())
        {
            grdDebit.SetGridText(txt_rowclick.text, 9, dr_famt);    
        }
        else
        {
            grdDebit.SetGridText(txt_rowclick.text, 9, Math.round(Number(dr_famt*(rate/ls_bookccy)*100))/100);
        }
        OnSumDR();
    }
    else if (p_data == 'CR')
    {
        rate = txtrate.GetData();
        grdCredit.SetGridText(txt_rowclick.text, 7, rate);
        var cr_famt = Number(grdCredit.GetGridData(txt_rowclick.text, 8));
        var ls_ccy  = grdCredit.GetGridData(txt_rowclick.text, 6);
        var ls_bookccy = txtBookRate.GetData();
        if (!OnCheckCur('CR'))
        {
            return;
        }
        if (ls_ccy == lstBook_ccy.GetData())
        {
            grdCredit.SetGridText(txt_rowclick.text, 9, cr_famt);    
        }
        else
        {
            grdCredit.SetGridText(txt_rowclick.text, 9, Math.round(Number(cr_famt*(rate/ls_bookccy)*100))/100);
        }
        OnSumCR();
    }
}

function ItemStyle()
{
	if (idGridItem.rows > 1)
	{
	    OnCtrToggleLeft();
	}
	else
	{
	    OnCtrToggleRight();
	}
	var ctrl = idGridItem.GetGridControl();
	var j = 1;
	var i = ctrl.rows - 1;
	while (j <= i)
	{
		var man = idGridItem.GetGridData(j,6);
		if(man == "Y")
		{
			idGridItem.SetCellBold(j,8,j,8,true);
		}
	    var type = idGridItem.GetGridData(j,3);
		if(type == "T" | type == "C")
		{
			if(type == "T")
			{
				idGridItem.SetCellBgColor(j,8,j,10,0xEFFFFF);	
			}
			else
			{
				idGridItem.SetCellBgColor(j,8,j,10,0xF4E6E0);
			}
			idGridItem.SetRowEditable(j,false);
		}
		j = j + 1;
	}
	SetDetailCtlItem();	
}

function SetDetailCtlItem()
{
	if (idGridItem.rows > 1)
	{
	    for (i = 1; i<idGridItem.rows; i++)
	    {
            var itemal  = idGridItem.GetGridData(i,8);
            var item    = idGridItem.GetGridData(i,9);
		    if (idGridTempItem.rows > 1)
		    {
		        for (j = 1; j<idGridTempItem.rows; j++)
		        {
		            var itemal2 = idGridTempItem.GetGridData(j,1);
		            var item2   = idGridTempItem.GetGridData(j,2);
		            var itemnm2 = idGridTempItem.GetGridData(j,3);
		            var itempk2 = idGridTempItem.GetGridData(j,4);	
		            if ((itemal == itemal2) && (item == ''))
		            {
		                idGridItem.SetGridText( i ,  9, item2);
				        idGridItem.SetGridText( i , 10, itemnm2);
				        idGridItem.SetGridText( i , 12, itempk2);
		            }
		        }
            }
	    }
    }
    if (txt_drcr_type.GetData() == 'D') 
    {
        grdDebit.SelectRow(txt_rowclick.text);
    }
    else
    {
        grdCredit.SelectRow(txt_rowclick.text);
    }
}

function OnSaveDr()
{
    g_upd_yn_dr = true;
    txt_drcr_type.SetDataText('D');
    OnTreament();
}

function OnSaveCr()
{
    g_upd_yn_cr = true;
    txt_drcr_type.SetDataText('C');
    OnTreament();
}

function SetItemToGridTmp()
{
	var ctrl = idGridItem.GetGridControl();
	for (i = 1; i < ctrl.rows; i++)
	{
		var acctpk  = idGridItem.GetGridData(i,2);
		var itemal  = idGridItem.GetGridData(i,8);
		var item    = idGridItem.GetGridData(i,9);
		var itemnm  = idGridItem.GetGridData(i,10);
		var itempk  = idGridItem.GetGridData(i,12);
		var ctrl1    = idGridTempItem.GetGridControl();
		if (ctrl1.rows > 1)
		{
		    // Kiem tra xem co du lieu duoi grid tam hay khong?
		    var flag;
		    var j;
		    flag = false
		    j = 1;
		    while ((j < ctrl1.rows) && (!flag))
		    {
		        var itemal1  = idGridTempItem.GetGridData(j,1);
		        if (itemal == itemal1)
		        {
		            flag = true;
		        }
		        j = j + 1;
		    }
		    if (!flag)
		    {
		        idGridTempItem.AddRow();
                idGridTempItem.SetGridText(  ctrl1.rows - 1 , 0, acctpk);
		        idGridTempItem.SetGridText(  ctrl1.rows - 1 , 1, itemal);
		        idGridTempItem.SetGridText(  ctrl1.rows - 1 , 2, item);
		        idGridTempItem.SetGridText(  ctrl1.rows - 1 , 3, itemnm);
		        idGridTempItem.SetGridText(  ctrl1.rows - 1 , 4, itempk);
		    }
		}
		else
		{
		    idGridTempItem.AddRow();
            idGridTempItem.SetGridText(  ctrl1.rows - 1 , 0, acctpk);
			idGridTempItem.SetGridText(  ctrl1.rows - 1 , 1, itemal);
			idGridTempItem.SetGridText(  ctrl1.rows - 1 , 2, item);
			idGridTempItem.SetGridText(  ctrl1.rows - 1 , 3, itemnm);
			idGridTempItem.SetGridText(  ctrl1.rows - 1 , 4, itempk);
		}
	}
}

function OnTreament()
{
    //SetItemToGridTmp();
    
    if ((grdDebit.selrow < 1) && (grdCredit.selrow < 1))
    {
        return;
    }
    var ctrl = idGridItem.GetGridControl();
	var j = 1;
	var i = ctrl.rows - 1;
	while (j <= i)
	{
		var man         = idGridItem.GetGridData(j,6);
		var itemtitle   = idGridItem.GetGridData(j,8);
		var item        = idGridItem.GetGridData(j,9);
		if(man == "Y" & item == "")
		{
			alert('           '+ itemtitle + ' is mandatory. Please input!!!'+'\n'+ itemtitle +' thông tin bắt buộc nhập. Vui lòng nhập vào!!!');
			return;
		}
		j = j + 1;
	}
	if ((txt_drcr_type.GetData() == 'D') && (grdDebit.rows > 1))
    {
        for (i = 1; i < grdDebit.rows; i++)
        {
            if ((grdDebit.GetGridData(i, 12) == "") && (grdDebit.GetGridData(i, 9) == ''))
            {
                grdDebit.SetGridText(i, 12, grid_payable.GetGridData(grid_payable.selrow, 1));
                grdDebit.SetRowStatus(i, 0x20);
            }            
            if (grdDebit.GetGridData(i, 9) == '')
            {
                grdDebit.SetGridText(i, 12, grid_payable.GetGridData(grid_payable.selrow, 1));
                grdDebit.SetGridText(i, 8, 0);
                grdDebit.SetGridText(i, 9, 0);
            }
            grdDebit.SetGridText(i, 14, 'D');
            if (grdDebit.GetGridData(i, 10) == "")
            {
                grdDebit.SetGridText(i, 10, txtdesc.GetData());
            }
            if (grdDebit.GetGridData(i, 11) == "")
            {
                grdDebit.SetGridText(i, 11, txtdesc_local.GetData());
            }
            if (grdDebit.GetGridData(i, 16) == "")
            {
                grdDebit.SetGridText(i, 16, lstCompany.GetData());
            }
            if (grdDebit.GetGridData(i, 18) == "")
            {
                grdDebit.SetGridText(i, 18, txtBookRate.GetData());
            }
        }
        var j = 0;
        for (i = 1; i < grdDebit.rows; i++)
        {
            if (grdDebit.GetGridData(i, 9) == '')
            {
                grdDebit.SetRowStatus(i, 0x40);
                j = j + 1;
            }
            else
            {
                grdDebit.SetGridText(i, 13, i - j);
            }
        }
        txt_rowclick.text = grdDebit.selrow;        
        g_upd_yn_dr = true;
        dso_upd_grd_dtl_ext_payment_dr.Call();
    }
    if ((txt_drcr_type.GetData() == 'C') && (grdCredit.rows > 1))
    {
        for (i = 1; i < grdCredit.rows; i++)
        {
            if ((grdCredit.GetGridData(i, 12) == "") && (grdCredit.GetGridData(i, 9) == ''))
            {
                grdCredit.SetGridText(i, 12, grid_payable.GetGridData(grid_payable.selrow, 1));
                grdCredit.SetRowStatus(i, 0x20);
            }            
            if (grdCredit.GetGridData(i, 9) == '')
            {
                grdCredit.SetGridText(i, 12, grid_payable.GetGridData(grid_payable.selrow, 1));
                grdCredit.SetGridText(i, 8, 0);
                grdCredit.SetGridText(i, 9, 0);
            }
            grdCredit.SetGridText(i, 14, 'C');
            if (grdCredit.GetGridData(i, 10) == "")
            {
                grdCredit.SetGridText(i, 10, txtdesc.GetData());
            }
            if (grdCredit.GetGridData(i, 11) == "")
            {
                grdCredit.SetGridText(i, 11, txtdesc_local.GetData());
            }
            if (grdCredit.GetGridData(i, 16) == "")
            {
                grdCredit.SetGridText(i, 16, lstCompany.GetData());
            }
            if (grdCredit.GetGridData(i, 18) == "")
            {
                grdCredit.SetGridText(i, 18, txtBookRate.GetData());
            }
        }
        var j = 0;
        for (i = 1; i < grdCredit.rows; i++)
        {
            if (grdCredit.GetGridData(i, 9) == '')
            {
                grdCredit.SetRowStatus(i, 0x40);
                j = j + 1;
            }
            else
            {
                grdCredit.SetGridText(i, 13, i - j);
            }
        }
        txt_rowclick.text = grdCredit.selrow;           
        g_upd_yn_cr = true;   
        
        dso_upd_grd_dtl_ext_payment_cr.Call();
    }
}

function OnDelDr()
{
    var ctrl = grdDebit.GetGridControl();
    if (grdDebit.rows > 1)
    {
        var j = 0;
        var i = 1;
        if (confirm('Are you sure you want to delete?'+'\n'+'Bạn có chắc muốn xóa Code này?'))
        {
            for ( i=1; i < ctrl.rows; i++ )
		    {
		        if (ctrl.isSelected(i) == true)
		        {
                    grdDebit.DeleteRow();
                    idGridItem.SetData("");
                    OnCtrToggleRight();
                }
            }
            flag_del = true;
            dso_upd_grd_dtl_ext_payment_dr.Call();
        }
    }
}

function OnDelCr()
{
    var ctrl = grdCredit.GetGridControl();
    if (grdCredit.rows > 1)
    {
        var j = 0;
        var i = 1;
        if (confirm('Are you sure you want to delete?'+'\n'+'Bạn có chắc muốn xóa Code này?'))
        {
            for ( i=1; i < ctrl.rows; i++ )
		    {
		        if (ctrl.isSelected(i) == true)
		        {
                    grdCredit.DeleteRow();
                    idGridItem.SetData("");
                    OnCtrToggleRight();
                }
            }
            dso_upd_grd_dtl_ext_payment_cr.Call();
        }
    }
}


function SaveItemControl()
{
    if (idGridItem.rows > 1)
	{
	    for (i = 1; i<idGridItem.rows; i++)
	    {
            if (txt_drcr_type.GetData() == 'D')
            {
                if ((idGridItem.GetGridData(i, 0) == ''))
                {
                    idGridItem.SetGridText(i, 1, grdDebit.GetGridData(txt_rowclick.text, 0));
                    idGridItem.SetRowStatus(i, 0x20);
                }
                else
                {
                    idGridItem.SetGridText(i, 1, grdDebit.GetGridData(txt_rowclick.text, 0));
                    idGridItem.SetRowStatus(i, 0x10);
                }
                txtacpk.SetDataText(grdDebit.GetGridData(txt_rowclick.text, 1));
                txt_eppaytrd_pk.SetDataText(grdDebit.GetGridData(txt_rowclick.text, 0));
            }
            else if (txt_drcr_type.GetData() == 'C')
            {
                if (idGridItem.GetGridData(i, 0) == '')
                {
                    idGridItem.SetGridText(i, 1, grdCredit.GetGridData(txt_rowclick.text, 0));
                    idGridItem.SetRowStatus(i, 0x20);
                }
                else
                {
                    idGridItem.SetGridText(i, 1, grdCredit.GetGridData(txt_rowclick.text, 0));
                    idGridItem.SetRowStatus(i, 0x10);
                }
                txtacpk.SetDataText(grdCredit.GetGridData(txt_rowclick.text, 1));
                txt_eppaytrd_pk.SetDataText(grdCredit.GetGridData(txt_rowclick.text, 0));
            }
	    }
	    dso_upd_ctl_item.Call();
    }
}

function ClickItemControl()
{    
	var flg = "0";
	var ctrl = idGridItem.GetGridControl();
	
	if (idGridItem.GetGridData( ctrl.row, 2) == '-1') // customer
	{
		flg = "2";
		var path = System.RootURL + '/standard/forms/gf/co/ffbp00031.aspx';
		var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		if ( object != null )
		{
		    if (object[0] != 0)
            {
		        idGridItem.SetGridText(ctrl.row, 10, object[0]);
		        idGridItem.SetGridText(ctrl.row,  9, object[2]);
		        for (i = 1; i < idGridItem.rows; i++)
		        {
		            if (idGridItem.GetGridData(i, 8) == 'CUSTOMER NAME')
		            {
		                idGridItem.SetGridText(i, 9, object[2]); // partner name
		                idGridItem.SetGridText(i,  10, object[1]); // partner id
		                idGridItem.SetGridText(i,  12, object[0]); // partner pk
		            }
		            if (idGridItem.GetGridData(i, 8) == 'SERIAL NO')
		            {
		                idGridItem.SetGridText(i,  9, object[7]);
		            }
		            if (idGridItem.GetGridData(i, 8) == 'TAX CODE')
		            {
		                idGridItem.SetGridText(i,  9, object[6]);
		            }
		        }
		    }
        }
	}
	else if (idGridItem.GetGridData( ctrl.row, 2) == '-2') // PL Unit
	{
	    var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ac_sel_6010004_0pl_popup&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
        var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
        if ( object != null )  
        {
            if (object[0] != 0)
            {
                idGridItem.SetGridText(ctrl.row, 10, object[2]) ; // PL Name
                idGridItem.SetGridText(ctrl.row,  9, object[1]) ; // PL ID
                idGridItem.SetGridText(ctrl.row,  12, object[0]) ; // PL PK
            }
        } 
	}
	else // others
	{
		if ((idGridItem.GetGridData( ctrl.row, 3) == 'T') || (idGridItem.GetGridData(ctrl.row, 3) == 'C'))
		{
			if (idGridItem.GetGridData( ctrl.row, 3) == 'C')
			{
				var ls_str = idGridItem.GetGridData(ctrl.row, 8);
				var temp = new Array();
                temp = ls_str.split(' ');
				var ls_temp = temp[0];
				
				var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + ls_str + "&company=" + lstCompany.GetData() + '&dsqlid=ac_sel_60100040_itemn_popup&col_code=' + ls_temp +" CODE" + '&col_nm=' + ls_temp + " NAME";
                var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                if ( object != null )  
                {
                    if (object[0] != 0)
                    {
                        idGridItem.SetGridText(ctrl.row, 10, object[2]) ;
                        idGridItem.SetGridText(ctrl.row,  9, object[0]) ;
                        idGridItem.SetGridText(ctrl.row, 12, object[3]) ; 
                    }
                } 
			}
			else
			{
				if (idGridItem.GetGridData(ctrl.row, 4) != '')
				{
					//var path = System.RootURL + '/standard/forms/acnt/fc/wafc001000.asp?dsqlid=' + idGridItem.GetGridData( ctrl.row, 4)  + '&title=' + 'Item Code List' + '&col_code=' + 'Item Code'  + '&col_nm=' + 'Item Name';
					//o = System.OpenModal( path ,500 , 500 , 'resizable:yes;status:yes');
				}
				else // others
				{
				    //var sqlsen = idGridItem.GetGridData( ctrl.row, 5);
			        //var path = System.RootURL + '/standard/forms/acnt/fc/wafc001000.asp?dsql=' + escape(sqlsen) + '&dsqlid=' + 'dsql_slipitemcodesql' + '&title=' + 'Item Code List' + '&col_code=' + 'Item Code'  + '&col_nm=' + 'Item Name';
					//alert( idGridItem.GetGridData( ctrl.row, 8 ))
					if ( idGridItem.GetGridData( ctrl.row, 8 )== "Bank Account No." || idGridItem.GetGridData( ctrl.row, 8 )== "DEPOSIT ACCOUNT NO" || idGridItem.GetGridData( ctrl.row, 8 )== "BANK ACCOUNT NUMBER" || idGridItem.GetGridData( ctrl.row, 8 )== "BANK ACCOUNT NO.")
					{
					    var ls_ccy
					    if (txt_drcr_type.GetData() == 'D')
					    {
					        ls_ccy = grdDebit.GetGridData(click_dr, 6);
					    }
					    else if (txt_drcr_type.GetData() == 'C')
					    {
					        ls_ccy = grdCredit.GetGridData(click_cr, 6);
					    }
					    var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + "" + "&val1=" + ls_ccy + "&company="+ lstCompany.GetData() + '&dsqlid=ac_sel_60100040_bank_popup&col_code=' + 'Bank Code'  + '&col_nm=' + 'Bank Name';
                        var object  =   System.OpenModal(  fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                        if (object != null)
                        {
                            if (object[0] != 0)
                            {
                                idGridItem.SetGridText(ctrl.row, 9, object[1]); //bank name
                                idGridItem.SetGridText(ctrl.row,  10, object[0]); // bank id
                                idGridItem.SetGridText(ctrl.row,  11, 'TAC_ABDEPOMT');
                                idGridItem.SetGridText(ctrl.row, 12, object[2]); // table pk
                            }
                        }
//						sqlsen = sqlsen.replace('$1', idaccd.GetData());
//						sqlsen = sqlsen.replace('$1', idaccd.GetData());
						
//						var path = System.RootURL + '/standard/forms/acnt/fc/wafc001000.asp?dsql=' + escape(sqlsen) + '&dsqlid=' + 'dsql_slipitemcodesql' + '&title=' + 'Item Code List' + '&col_code=' + 'Item Code'  + '&col_nm=' + 'Item Name';						
//						o = System.OpenModal( path ,500 , 500 , 'resizable:yes;status:yes');
					}
					else
					{
						
						if (idGridItem.GetGridData( ctrl.row, 8 )== "EMPLOYEE NAME")
						{
							var fpath   = System.RootURL + "/standard/forms/gf/ma/gfma00010_3.aspx";
                            var object  = System.OpenModal(  fpath , 800 , 500 , 'resizable:yes;status:yes'); 
                            if ( object != null )  
                            {
                                if (object[0] != 0)
                                {
										idGridItem.SetGridText(ctrl.row,  9, object[2]);//emp id
										idGridItem.SetGridText(ctrl.row, 10, object[3]);// emp name
										idGridItem.SetGridText(ctrl.row,  11, "TAC_EMPLOYEE_ADV");//TABLE NAME
										idGridItem.SetGridText(ctrl.row,  12, object[0]);//Employee PK                                       
                                }
                            }
						}	
						else if ( idGridItem.GetGridData( ctrl.row, 8 )== "DEPARTMENT" || idGridItem.GetGridData( ctrl.row, 8 )== "DEPARTMENT NAME" )
						{
							flg = "-3";
//							var path = System.RootURL + '/standard/forms/acnt/fc/wafc001000.asp?dsql=' + escape(sqlsen) + '&dsqlid=' + 'dsql_slipitemcodesql' + '&title=' + 'Item Code List' + '&col_code=' + 'Item Code'  + '&col_nm=' + 'Item Name';
//							o = System.OpenModal( path ,700 , 500 , 'resizable:yes;status:yes');
						}	
						else if ( idGridItem.GetGridData( ctrl.row, 8 )== "CONTRACT NOAP")
						{
							flg = "-4";
							//alert(flg);
							var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_2007.aspx?contract_type=BUY&company=" + lstCompany.GetData();
							var object  = System.OpenModal(fpath , 900 , 600 , 'resizable:yes;status:yes'); 
							if ( object != null ){
								idGridItem.SetGridText(idGridItem.row,  9, object[1]) ;//ITEM CODE
								idGridItem.SetGridText(idGridItem.row, 10, object[4]) ;//ITEM NAME
								idGridItem.SetGridText(idGridItem.row, 11, "TIM_CONTR_MST") ;//TABLE NAME 
								idGridItem.SetGridText(idGridItem.row, 12, object[0]) ;//TABLE PK 
								for(var i=1;i<idGridItem.rows;i++){
									if ((idGridItem.GetGridData(i, 8) == 'CUSTOMER') && (Trim(idGridItem.GetGridData(i, 9)) == "")){
										idGridItem.SetGridText(i,  9, object[3]);//customer id
										idGridItem.SetGridText(i, 10, object[4]);//customer name
										idGridItem.SetGridText(i,  11, "TCO_BUSPARTNER");//TABLE NAME
										idGridItem.SetGridText(i,  12, object[8]);//TABLE PK
									}
									if (idGridItem.GetGridData(i, 8) == 'SERIAL NO'){
										idGridItem.SetGridText(i,  9, object[10]);
									}
									if (idGridItem.GetGridData(i, 8) == 'TAX CODE'){
										idGridItem.SetGridText(i,  9, object[9]);
									}
									if (idGridItem.GetGridData(i, 8) == 'PL UNIT'){
										idGridItem.SetGridText(i,  9, object[12]);
										idGridItem.SetGridText(i,  10, object[13]);
										idGridItem.SetGridText(i,  12, object[11]);
									}
								}								
							}					
					//							var path = System.RootURL + '/standard/forms/acnt/fc/wafc019000_subcontract.asp?dsql=' + escape(sqlsen) + '&dsqlid=' + 'dsql_slipitemcodesql' + '&title=' + 'Item Code List' + '&col_code=' + 'Item Code'  + '&col_nm=' + 'Item Name';
//							o = System.OpenModal( path ,750 , 550 , 'resizable:yes;status:yes');
						}
						else if(idGridItem.GetGridData( ctrl.row, 8 )== "BENEFICIARY BANK")
						{
							var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_2009.aspx?contract_type=BUY&company=" + lstCompany.GetData();
							var object  = System.OpenModal(fpath , 900 , 600 , 'resizable:yes;status:yes'); 							
							if ( object != null ){
							    var arr = new Array();
							    arr = object ;
								idGridItem.SetGridText(idGridItem.row,  9, arr[1]) ;//account code
								idGridItem.SetGridText(idGridItem.row, 10, arr[0]) ; //bedefi_bank_nm
								idGridItem.SetGridText(idGridItem.row, 11, "TAC_BFBENEFICIARY") ;//TABLE NAME 
								idGridItem.SetGridText(idGridItem.row, 12, arr[2]) ;//TABLE PK 
							} 						
						}						
					}
				}
			}
		}
	}
}

function ChangeData_Upper()
{
    var ctrl = idGridItem.GetGridControl(); 
    var i = ctrl.rows - 1;
    for (i=1; i< ctrl.rows; i++)
    {
        var itemal      = idGridItem.GetGridData(i, 8); 
        var item_value  = idGridItem.GetGridData(i, 9); 
        if(itemal == "SERIAL NUMBER" || itemal == "SERIAL NO" || itemal == "SERI NO" )
        {
            item_value = item_value.toUpperCase();
            idGridItem.SetGridText( i , 9, item_value);
        }
    }
}

function OnUpdate()
{
    if (!onCheck()) return;
	//alert(onCheck());
    var data;
	data = "";
	var ctrl 	= grid_amount.GetGridControl();
	var rows 	= ctrl.Rows;
	var index;
	index  = 0;
	
	for (i=1; i<ctrl.Rows; i++)
	{
		var tmp = grid_amount.GetGridData(i, G_Pre_Chk);
		if (tmp == "-1")
		{
			data  = grid_amount.GetGridData(i, G_Pre_TFN_EPPAYTR_PK)+ "," + data ;
			index = index + 1 ;
			txt_paydate.text = grid_amount.GetGridData(i, G_Pre_PayDate);
		}
	}
	if(index == 0)
	{
		alert('Please select check SEQ for update payment!!!'+'\n'+'  Bạn hãy chọn số SEQ để update payment!!!')
		return;
	}
	else
	{
		if(confirm('Are you sure you want to update payment?'+'\n'+'Bạn có chắc update payment số SEQ này?'))
		{
	        txt_str.text     = data;
	        txt_index.text   = index;			
	        dso_upd_external_payment.Call();
        	}
    	}
}

function OnPayment()
{
    var data;
	data = "";
	var ctrl 	= grid_payable.GetGridControl();
	var rows 	= ctrl.Rows;
	var index;
	index  = 0;
	txt_str.text    = "";
	for (i=1; i<ctrl.Rows; i++)
	{
		var tmp = grid_payable.GetGridData(i, 0);
		if (tmp == "-1")
		{
			data  = grid_payable.GetGridData(i, 1)+ "," + data ;
			index = index + 1 ;
			if (grid_payable.GetGridData(i, 11) != 1)
			{
			    return;
			}
		}
	}
	if(index == 0)
	{
		alert('Please select check SEQ for approve payment!!!'+'\n'+'  Bạn hãy chọn số SEQ để approve payment!!!')
		return;
	}
	else
	{
		if(confirm('Are you sure you want to approve payment?'+'\n'+'      Bạn có chắc Approval số SEQ này?'))
		{
	        txt_str.text     = data;
	        txt_index.text   = index;
	        dso_upd_confirm_payment.Call();
        }
    }
}

function OnCancel()
{
    var data;
	data = "";
	if(idTab_Child.GetCurrentPageNo()==2)
	{
		var ctrl 	= grid_paid.GetGridControl();
		var rows 	= ctrl.Rows;
		var index;
		index  = 0;
		
		txt_str.text    = "";
		txt_index.text  = "";

		for (i=1; i<ctrl.Rows; i++)
		{
			var tmp = grid_paid.GetGridData(i, 0);
			if (tmp == "-1")
			{
				data  = grid_paid.GetGridData(i, 9)+ "," + data ;
				index = index + 1 ;
				if (grid_paid.GetGridData(i, 8) != 2)
				{
					return;
				}
			}
		}
		if(index == 0)
		{
			alert('Please select check SEQ for cancel payment!!!'+'\n'+'        Bạn hãy chọn số SEQ để hủy!!!')
			return;
		}
		else
		{
			if(confirm('Are you sure you want to cancel payment?'+'\n'+'        Bạn có chắc hủy số SEQ này?'))
			{
				txt_str.text     = data;
				txt_index.text   = index;
				dso_upd_cancel_ext_payment.Call();
			}
		}
	}	
	else if(idTab_Child.GetCurrentPageNo()==1)	
	{
		var ctrl 	= grid_payable.GetGridControl();
		var rows 	= ctrl.Rows;
		var index;
		index  = 0;
		
		txt_str.text    = "";
		txt_index.text  = "";

		for (i=1; i<ctrl.Rows; i++)
		{
			var tmp = grid_payable.GetGridData(i, 0);
			if (tmp == "-1")
			{
				data  = grid_payable.GetGridData(i, 1)+ "," + data ;
				index = index + 1 ;				
			}
		}
		if(index == 0)
		{
			alert('Please select check SEQ for cancel payment!!!'+'\n'+'        Bạn hãy chọn số SEQ để hủy!!!')
			return;
		}
		else
		{
			if(confirm('Are you sure you want to cancel payment?'+'\n'+'        Bạn có chắc hủy số SEQ này?'))
			{
				txt_str.text     = data;
				txt_index.text   = index;
				dso_upd_cancel_ext_payment.Call();
			}
		}		
	
	}	
}

function RowClick_Payable()
{
    if (event.col == 0)
    {
        return;
    }
    grdDebit.ClearData();
    grdCredit.ClearData();
    idGridItem.SetData("");
    txt_eppaytrh_pk.SetDataText(grid_payable.GetGridData(grid_payable.selrow, 1));
    txt_drcr_type.SetDataText('D');
    txtdesc.SetDataText(grid_payable.GetGridData(grid_payable.selrow, 6));
    txtdesc_local.SetDataText(grid_payable.GetGridData(grid_payable.selrow, 7));
    //txttrans_pk.SetDataText(grid_payable.GetGridData(grid_payable.selrow, 8));
    //txttrans_cd.SetDataText(grid_payable.GetGridData(grid_payable.selrow, 9));
    //txttrans_nm.SetDataText(grid_payable.GetGridData(grid_payable.selrow, 10));
    g_upd_yn_dr = false;
    // grdDebit get data
    dso_upd_grd_dtl_ext_payment_dr.Call("SELECT");    
}

function Popup_PL()
{
    var fpath = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ac_sel_6010004_0pl_popup&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
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

function Reset_Trans()
{
    txttrans_cd.SetDataText("");
    txttrans_nm.SetDataText("");
    txttrans_pk.SetDataText("");
}


function onSearchTAcc()
{
    if (event.col == 0)
    {
        return;
    }
    var ls_seq = grid_paid.GetGridData(grid_paid.selrow, 1);
    if ( ls_seq != '')
    {
        var pk      = ls_seq;
		var status  = '2';
		
		var fpath   = System.RootURL + '/standard/forms/gf/ep/gfep00050_popup_TAcc.aspx?PK_ROW=' + pk + '&APPRCANCEL=' + status;
		var wWidth  = 950;
		var wHeight = 570;
		var x = Math.round((screen.availWidth - wWidth)/2);
		var y = Math.round((screen.availHeight - wHeight)/2);
			
		var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
		   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
		   "lef="+ x +",top=" + y;
		
		var object = System.OpenModal(fpath, wWidth, wHeight, features);
    }
}
//---------------------------------------
function OnReport()
{
	var l_seq = "", i;
	if(btnReportList.value == '100') //uy nhiem chi Thong Thuong
	{    
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1) + ",";
		    }	
	    }	
    	
	    if(l_seq != "")
	    {
		    l_seq = l_seq.substring(0, l_seq.length - 1);
		    var url = System.RootURL + "/standard/reports/gf/ep/gfep00050.aspx?seq=" + l_seq + "&company=" + lstCompany.value;
		    System.OpenTargetPage(url);        				
	    }		
    }
    else if(btnReportList.value == '310') // phieu ke toan standard
    {
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1) ;
			    break;
		    }	
	    }	
        if(l_seq != '')
        {
             var url =System.RootURL + '/standard/reports/gf/hg/60080010_envn.aspx?seq='+ l_seq;
             System.OpenTargetPage( url , 'newform' );     
        }             
    }    	    
    else if(btnReportList.value == '290') // phieu UNC VCB
    {
        var l_seq = '';
        var i;
        for( i = 1; i < grid_paid.rows ; i++)
        {
            if(grid_paid.GetGridData(i, 0) == '-1')
            {
                l_seq = grid_paid.GetGridData(i, 1); // sequence in
                var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=gf/br/rpt_gfbr00040_UNC_VCB.rpt&procedure=RPT_SEL_GFBR00030|RPT_SEL_GFBR00030_1&parameter=" + l_seq + "|" + l_seq;   
                System.OpenTargetPage( url , 'newform' );
                break;
            }
        }            
    }    	    
    else if(btnReportList.value == '80') // phieu UNC TECH
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1) + ",";
		    }	
	    }	
    	
	    if(l_seq != "")
	    {
		    l_seq = l_seq.substring(0, l_seq.length - 1);
		    var url = System.RootURL + "/standard/reports/gf/ep/gfep00050.aspx?seq=" + l_seq + "&company=" + lstCompany.value;
		    System.OpenTargetPage(url);        				
	    }		
    }    	    
    else if(btnReportList.value == '390') // phieu UNC SHB
    {
        var l_seq = '';
        var i;
        for( i = 1; i < grid_paid.rows ; i++)
        {
            if(grid_paid.GetGridData(i, 0) == '-1')
            {
                l_seq = grid_paid.GetGridData(i, 1); // sequence in
                var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=gf/hg/rpt_gfhg00010_SHB_1.rpt&procedure=rpt_sel_gfbr00030|rpt_sel_gfbr00030_1&parameter="+l_seq+"|"+l_seq; 
                System.OpenTargetPage( url , 'newform' );
                break;
            }
        }            
    }    	    
    else if( btnReportList.value == '440') // VietinBank Payment Statement
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	 
		    var url = System.RootURL + "/standard/reports/gf/br/rpt_gfbr00040_UNC_LenhChi_new.aspx?Seq=" + l_seq ;
		    System.OpenTargetPage(url);        					    	       
    }
    else if( btnReportList.value == '470') // Vietcombank Payment Statement
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	 
		    var url = System.RootURL + "/standard/reports/gf/br/rpt_gfbr00040_Vietcom_GiayNopTien.aspx?Seq=" + l_seq ;
		    System.OpenTargetPage(url);        					    	       
    }
    else if( btnReportList.value== '460') //WooriBank Giay Gui Tien
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	 
		    var url = System.RootURL + "/standard/reports/gf/br/rpt_gfbr00040_Woori_PhieuGuiTien_Full.aspx?Seq=" + l_seq ;
		    System.OpenTargetPage(url);        					    	           		    
    }
    else if(btnReportList.value== '450')
    {        
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	    
	    var  url = System.RootURL + '/standard/reports/gf/br/rpt_gfbr00040_UNC_PhieuRutTien.aspx?Seq='+ l_seq;         
	    System.OpenTargetPage(url);        					    	           		         
    }
    else if(btnReportList.value== '480')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	        
        var  url = System.RootURL + '/standard/reports/gf/br/rpt_gfbr00040_Vietcom_GiayRutTien.aspx?Seq='+ l_seq; 
        System.OpenTargetPage(url);
    }
    else if(btnReportList.value== '490')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	            
        var  url = System.RootURL + '/standard/reports/gf/br/rpt_gfbr00040_Woori_PhieuRutTien_Full.aspx?Seq='+ l_seq; 
        System.OpenTargetPage(url);
    }
    else if(btnReportList.value== '410')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	                
        var  url = System.RootURL + '/standard/reports/gf/br/rpt_gfbr00040_UNC_VCB.aspx?Seq='+ l_seq;
        System.OpenTargetPage(url);
    }
    else if(btnReportList.value== '420')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	                
        //var  url = System.RootURL + '/standard/reports/gf/br/rpt_gfbr00040_UNC_LenhChuyenTien.aspx?Seq='+ l_seq ;
        //System.OpenTargetPage(url);        
    }
    else if(btnReportList.value== '430')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	                
        //var  url = System.RootURL + '/standard/reports/gf/br/rpt_gfbr00040_UNC_GiayNopTien.aspx?Seq='+ txtseq.text+ '&Seq1='  + txtseq1.text; 
        //System.OpenTargetPage(url);        
    }
    else if(btnReportList.value== '500')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	                
        var url = System.RootURL + '/standard/reports/gf/br/rpt_gfbr00040_Shinhan_GiayChuyenTien_Full.aspx?Seq='+ l_seq;
        System.OpenTargetPage(url);
    }
    else if(btnReportList.value== '510')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	                
	var url = System.RootURL + '/standard/reports/gf/br/rpt_gfbr00040_KEB_BankTransfer.aspx?Seq='+ l_seq;
                       System.OpenTargetPage(url);
    }
    
    else if(btnReportList.value== '520')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	                
        var url = System.RootURL + '/standard/reports/gf/br/rpt_gfbr00040_VIB_GiayNopTien.aspx?Seq='+ l_seq; 
        System.OpenTargetPage(url);
    }
    else if(btnReportList.value== '530')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	                
        var url = System.RootURL + '/standard/reports/gf/br/rpt_gfbr00040_KEB_GiayLinhTienMat.aspx?Seq='+ l_seq; 
        System.OpenTargetPage(url);
    }
    else if(btnReportList.value== '540')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	                
        var url = System.RootURL + '/standard/reports/gf/br/rpt_gfbr00040_ShinhanBankVietnam.aspx?Seq='+ l_seq ;
        System.OpenTargetPage(url);
    }
    else if(btnReportList.value== '550')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	                
        var url = System.RootURL + '/standard/reports/gf/br/rpt_gfbr00040_SVB_DT.aspx?Seq='+ l_seq ;
        System.OpenTargetPage(url);
    }
    else if(btnReportList.value== '560')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	                
        var url = System.RootURL + '/standard/reports/gf/br/rpt_gfbr00040_Woori_DonXinGiaoDichNgoaiTe.aspx?Seq='+ l_seq;
        System.OpenTargetPage(url);
    }
    else if(btnReportList.value== '570')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	                
        var url = System.RootURL + '/standard/reports/gf/br/rpt_gfbr00040_ShinhanBankVietnam_2.aspx?Seq='+ l_seq ;
        System.OpenTargetPage(url);
    }
	else if(btnReportList.value== '690_v2')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	                
        var url = System.RootURL + '/standard/reports/gf/br/gfbr00040_Woori_PhieuGuiTien_pdf.aspx?Seq='+ l_seq ;
        System.OpenTargetPage(url);
    }
	else if(btnReportList.value== '870_v2')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	                
        var url = System.RootURL + '/standard/reports/gf/br/gfbr00040_Shinhan_GiayChuyenTien2_excel.aspx?p_Seq='+ l_seq ;
        System.OpenTargetPage(url);
    }
	else if(btnReportList.value== '1090_v2')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	                
        var url = System.RootURL + '/standard/reports/gf/br/gfbr00040_ABBank_Payment_Order_pdf.aspx?p_Seq='+ l_seq ;
        System.OpenTargetPage(url);
    }
	else if(btnReportList.value== '1150_v2')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	  
		
        var url = System.RootURL + '/standard/reports/gf/br/gfbr00030_UNC_DONGA_Bank_Payment.aspx?p_Seq='+ l_seq ;
        System.OpenTargetPage(url);
    }
	else if(btnReportList.value== '1160_v2')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	                
        var url = System.RootURL + '/standard/reports/gf/br/gfbr00040_HD_bank_UNC_EXCEL.aspx?p_Seq='+ l_seq ;
        System.OpenTargetPage(url);
    }
	else if(btnReportList.value== '1180_v2')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	                
        var url = System.RootURL + '/standard/reports/60/06/rpt_60060010_Pay_voucher.aspx?p_Seq='+l_seq;
        System.OpenTargetPage(url);
    }
	else if(btnReportList.value== '1250_v2')
    {
	    var l_seq = "";
	    for ( i = 1; i < grid_paid.rows; i++)
	    {
		    if(grid_paid.GetGridData(i, 0) == "-1")
		    {
			    l_seq = grid_paid.GetGridData(i, 1);
			    break ;
		    }	
	    }	                
        var url = System.RootURL + '/standard/reports/gf/br/rpt_gfbr00040_HSBC_CashWithDrawal_latest.aspx?p_Seq='+l_seq;
        System.OpenTargetPage(url);
    }
}
//---------------------------------------
function OnReport_PV()
{
    var l_seq = "";
    var i ;
    for( i = 1; i < grid_paid.rows; i++)
    {
        if(grid_paid.GetGridData(i, 0) == '-1')
        {
            l_seq = grid_paid.GetGridData(i, 1) ;    
            break;
        }    
    }     
    if(l_seq != "")
    {
        var url = System.RootURL + "/standard/reports/gf/ep/gfep00050_1.aspx?seq=" + l_seq ;
        System.OpenTargetPage(url);        				    
    }    
}
//---------------------------------------
function OnPopUpAcc()
{
	if(event.col == 4)
	{
		var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_new.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + txttrans_cd.GetData() + "&val1=" + txttrans_nm.GetData() + "&val2=D&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel60100040_new_drcr";
		var object      = System.OpenModal(  fpath , 750 , 550 , 'resizable:yes;status:yes');	    
		if(object != null) 
		{
			var tmp = new Array();
			tmp = object[0];
			if(tmp[1] != "0")
			{
				grdCredit.SetGridText(event.row, 1, tmp[1]);//acc_pk
				grdCredit.SetGridText(event.row, 4, tmp[4]); //acc_cd
				grdCredit.SetGridText(event.row, 5, tmp[5]);//acc_nm
			}
		}
	}
}
//---------------------------------------
function OnUpdateDate()
{    
    var data;
	data = "";
	var ctrl 	= grid_payable.GetGridControl();
	var rows 	= ctrl.Rows;
	var index;
	index  = 0;
	txt_str.text    = "";
	for (i=1; i<ctrl.Rows; i++)
	{
		var tmp = grid_payable.GetGridData(i, 0);
		if (tmp == "-1")
		{
			data  = grid_payable.GetGridData(i, 1)+ "," + data ;
			index = index + 1 ;
			if (grid_payable.GetGridData(i, 11) != 1)
			{
			    return;
			}
		}
	}
	if(index == 0)
	{
		alert('Please select check SEQ to modify payment date!!!'+'\n'+'  Bạn hãy chọn số SEQ để điều chỉnh ngày trả!!!')
		return;
	}
	else
	{
		if(confirm('Are you sure you want to modify payment date?'+'\n'+'      Bạn có chắc điều chỉnh ngày trả của số SEQ này?'))
		{
	        txt_str.text     = data;
	        txt_index.text   = index;
	        dso_upd_paydate.Call();
        }
    }    
    
}
//---------------------------------------
function OnCreditAccount()
{
    var fpath   = System.RootURL + "/standard/forms/gf/co/ffco002004.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + txttrans_cd.GetData() + "&val1=" + txttrans_nm.GetData() + "&val2=C&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel60100040_new_drcr";
    var object      = System.OpenModal(  fpath , 750 , 550 , 'resizable:yes;status:yes');	    
    if(object != null) 
    {
        var tmp = new Array();
        tmp = object[0];
        if(tmp[1] != "0")
        {
            
            txtAccPK_CR.SetDataText(tmp[1]);//acc_pk
            txtAccCD_CR.SetDataText(tmp[4]); //acc_cd
            txtAccNM_CR.SetDataText(tmp[5]);//acc_nm
        }
    }
}
//---------------------------------------
function Reset_CreditAcc()
{
    txtAccPK_CR.SetDataText("");
    txtAccCD_CR.SetDataText("");
    txtAccNM_CR.SetDataText("");
}
//---------------------------------------
function OnTest()
{
    alert('TEST');
}
//---------------------------------------
function OnGetBankID()
{
    grdDebit.ClearData();
    grdCredit.ClearData();
    idGridItem.SetData("");
    grid_paid.ClearData();
    grid_amount.ClearData();
    grid_payable.ClearData();
    dso_get_bankid.Call("SELECT");
}
//------------------------------------------
function OnAutoYN()
{
}
//------------------------------------------
</script>
<body style="margin:0; padding:0;">
<!------------------1------------------------------------------------------------>
    <gw:data id="dso_sel_grd_external_payment" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60100040_ext_payment">
                <input bind="grid_amount">
                    <input bind="lstCompany"/>
                    <input bind="txtseq"/>
                    <input bind="dtPay_fr"/>
                    <input bind="dtPay_to"/>
                    <input bind="txtcust_pk"/>
                    <input bind="txtvoucher_no"/>
                    <input bind="txtpl_pk"/>
                    <input bind="lstType"/>
                    <input bind="rbstatus"/>
                    <input bind="txtEmp_ID"/>
                </input>
                <output bind="grid_amount"/>
            </dso>
        </xml>
    </gw:data>
<!------------------2------------------------------------------------------------>    
    <gw:data id="dso_upd_external_payment" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_upd_60100040_ext_payment_m">
                <input>
                     <input bind="txt_str"/>
                     <input bind="txt_index"/>
                     <input bind="txttrans_pk"/>
                     <input bind="lstCompany"/>
                     <input bind="lstVoucherType"/>
                     <input bind="lstDepartment"/>
                     <input bind="txtProposedByUserPk"/>
                     <input bind="txtdesc"/>
                     <input bind="txtdesc_local"/>
                     <input bind="txt_paydate"/>
                     <input bind="txtBookRate"/>
                     <input bind="chkauto_YN"/>
                     <input bind="txtvoucher_auto"/>
                     <input bind="txtvoucher_no"/>	
					 <input bind="lstBankID"/>
					 <input bind="txtRcvPerson"/>
					 <input bind="txtAccPK_CR"/>
                </input>
                <output>
                     <output bind="txt_tmp"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!------------------3------------------------------------------------------------>    
    <gw:data id="dso_sel_grd_payable" onreceive="">
        <xml>
            <dso type="grid" function="ac_sel_60100040_ext_payment">
                <input bind="grid_payable">
                    <input bind="lstCompany"/>
                    <input bind="txtseq"/>
                    <input bind="dtPay_fr"/>
                    <input bind="dtPay_to"/>
                    <input bind="txtcust_pk"/>
                    <input bind="txtvoucher_no"/>
                    <input bind="txtpl_pk"/>
                    <input bind="lstType"/>
                    <input bind="rbstatus"/>
                    <input bind="txtEmp_ID"/>
                </input>
                <output bind="grid_payable"/>
            </dso>
        </xml>
    </gw:data>
<!------------------4------------------------------------------------------------>    
    <gw:data id="dso_sel_grd_paid" onreceive="">
        <xml>
            <dso type="grid" function="ac_sel_60100040_ext_payment">
                <input bind="grid_paid">
                    <input bind="lstCompany"/>
                    <input bind="txtseq"/>
                    <input bind="dtPay_fr"/>
                    <input bind="dtPay_to"/>
                    <input bind="txtcust_pk"/>
                    <input bind="txtvoucher_no"/>
                    <input bind="txtpl_pk"/>
                    <input bind="lstType"/>
                    <input bind="rbstatus"/>
                    <input bind="txtEmp_ID"/>
                </input>
                <output bind="grid_paid"/>
            </dso>
        </xml>
    </gw:data>
<!------------------5------------------------------------------------------------>    
    <gw:data id="dso_sel_booksrate" onreceive="OnSetBookRate()"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60100040_get_bookccy">
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
<!------------------6------------------------------------------------------------>    
    <gw:data id="dso_upd_grd_dtl_ext_payment_dr" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,3,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="ac_sel_60100040_dtl_payment" procedure="ac_upd_60100040_dtl_payment">
                <input bind="grdDebit">
                    <input bind="txt_eppaytrh_pk"/>
                    <input bind="txt_drcr_type"/>
                </input>
                <output bind="grdDebit"/>
            </dso>
        </xml>
    </gw:data>

<!------------------12------------------------------------------------------------>
    <gw:data id="dso_upd_grd_dtl_ext_payment_cr" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,3,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="ac_sel_60100040_dtl_payment" procedure="ac_upd_60100040_dtl_payment">
                <input bind="grdCredit">
                    <input bind="txt_eppaytrh_pk"/>
                    <input bind="txt_drcr_type"/>
                </input>
                <output bind="grdCredit"/>
            </dso>
        </xml>
    </gw:data>
<!------------------13------------------------------------------------------------>    
    <gw:data id="dso_upd_ctl_item" onreceive="ItemStyle()">
        <xml>
            <dso type="grid" parameter="0,1,2,9,10,12" function="ac_sel_60100040_item_payment" procedure="ac_upd_60100040_item_payment">
                <input bind="idGridItem">
                    <input bind="lstCompany"/>
                    <input bind="txt_eppaytrd_pk"/>
                    <input bind="txtacpk"/>
                    <input bind="txt_drcr_type"/> 
                    <input bind="txt_eppaytrh_pk"/>                    
                </input> 
                <output bind="idGridItem"/>
            </dso>
        </xml>
    </gw:data>
<!------------------14------------------------------------------------------------>    
    <gw:data id="dso_upd_confirm_payment" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60100040_confm_payment" > 
                <input> 
                     <input bind="txt_str"/>
                     <input bind="lstCompany"/>
                     <input bind="txt_index"/>
                </input>  
                <output>  
                     <output bind="txtStatus"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!------------------15------------------------------------------------------------>    
    <gw:data id="dso_upd_cancel_ext_payment" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60100040_cancel_payment" > 
                <input> 
                     <input bind="txt_str"/>
                     <input bind="lstCompany"/>
                     <input bind="txt_index"/>
                     <input bind="txtProposedByUserPk"/>
                </input>  
                <output>  
                     <output bind="txtStatus"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!------------------16------------------------------------------------------------>    
    <gw:data id="dso_get_rate_dr" onreceive="SetCurrent('DR')">
        <xml> 
            <dso type="process" procedure="ac_pro_60100040_get_rate"> 
                <input> 
                     <input bind="dttrs_date"/>
                     <input bind="lstCompany"/>
                     <input bind="txtcur"/>
                     <input bind="txt_rowclick"/>
                </input>
                <output>
                     <output bind="txtrate"/>
                     <output bind="txt_rowclick"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!------------------17------------------------------------------------------------>
    <gw:data id="dso_get_rate_cr" onreceive="SetCurrent('CR')">
        <xml>
            <dso type="process" procedure="ac_pro_60100040_get_rate"> 
                <input> 
                     <input bind="dttrs_date"/>
                     <input bind="lstCompany"/>
                     <input bind="txtcur"/>
                     <input bind="txt_rowclick"/>
                </input>
                <output>
                     <output bind="txtrate"/>
                     <output bind="txt_rowclick"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!------------------------------------------------------------------------------>    
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="AC_pro_60020020_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	      
<!------------------------------------------------------------------------------>        
<gw:data id="dso_get_bankid" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60100040_bankid" > 
                <input> 
                     <input bind="lstCompany"/>
                </input>
                <output>
                     <output bind="lstBankID"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>        

 <gw:data id="dso_get_department" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="list" procedure="ac_sel_60100040_BANK_depr"> 
                <input> 
                     <input bind="lstCompany"/>
                </input>
                <output>
                     <output bind="lstDepartment"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

    
<!------------------------------------------------------------------------------>
<table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
<tr>
    <td width="100%">
	    <table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
		<tr height='10%'>
            <td width="100%">
	            <table width="100%" cellpadding="0" cellspacing="0" border="0">
		        <tr>
                    <td width="8%"></td>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="8%"></td>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="8%"></td>
                    <td width="7%"></td>
                    <td width="9%"></td>
                    <td width="10%"></td>
                </tr>
                <tr>
                    <td align="right">Company</td>
                    <td><gw:list id="lstCompany" onChange="dso_get_department.Call()" styles='width:100%'></gw:list></td>
                    <td align="right">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td align="right">Voucher No</td>
                            <td><gw:checkbox id="chkauto_YN" value="F"  onclick="OnAutoYN()"/></td>
                        </tr>
                        </table>
				    </td>
				    <td><gw:list id="lstVoucherType" onChange="OnChangeList()" styles="width:100%"></gw:list></td>
                    <td><gw:textbox id="txtvoucher_auto" styles="width:100%"/></td>
					<td ><gw:textbox id="txtvoucher_no" styles="width:100%" onenterkey="OnSearch()" csstype="mandatory" /></td>
                    <td align="center">SEQ</td>
                    <td><gw:textbox id="txtseq" styles="width:100%" onenterkey="OnSearch()" onkeypress="CheckNumeric()"/></td>
                    <td><gw:datebox id="dttrs_date" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td colspan=2>
				        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td align="right">Check All</td>
                            <td><gw:checkbox id="chk_all"  value="F"        onclick="OnCheckAll()"/></td>
                            <td><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"     onclick="OnSearch()" /></td>
				            <td><gw:imgBtn id="ibtnUpdate" img="test"      alt="Update "     onclick="OnUpdate()" /></td>
				            <td><gw:imgBtn id="ibtnReport" img="printer"   alt="Print Acct & UNC" onclick="OnReport()" /></td>
				            <td><gw:imgBtn id="ibtnReport_Paid" img="printer"   alt="Print PV" onclick="OnReport_PV()" /></td>
                        </tr>
                        </table>
				    </td>
                </tr>
                <tr>
                    <td align="right">Pay Date</td>
                    <td><gw:datebox id="dtPay_fr" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtPay_to" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center"><a title="Click here to select PL" onclick="Popup_PL()" href="#tips">Profit and Loss</a></td>
				    <td colspan= 4>
				        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="30%"><gw:textbox id="txtpl_cd" styles='width:100%' onenterkey="OnSearchTrans()" onkeypress="Upcase()"/></td>
                            <td width="60%"><gw:textbox id="txtpl_nm" styles='width:100%'/></td>
                            <td width="0%"><gw:textbox  id="txtpl_pk" styles='display:none'/></td>
                            <td width="5%"><gw:imgBtn   img="reset"	id="idResetCust"  alt="Reset" onclick="Reset_PL()"/></td>
                        </tr>
				        </table>
				    </td>
				    <td colspan="2">
				        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="40%"><gw:icon id="btnPayment"    img="in" text="Payment"     styles='width:100%' onclick="OnPayment()"/></td>
                            <td width="30%"><gw:icon id="btnSave"    img="in" text="Save"     style='width:100%;display:none;' onclick="OnUpdateDate()"/></td>                            
                            <td width="30%"><gw:icon id="btnCancel"     img="in" text="Cancel"      styles='width:100%' onclick="OnCancel()"/></td>
                        </tr>
                        </table>
				    </td>
                </tr>
                <tr>
                    
                    <td align="right"><a title="Click here to select Customer" onclick="Popup_Cust()" href="#tips">Customer</a></td>
				    <td colspan=3>
				        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="30%"><gw:textbox id="txtcust_cd" styles='width:100%' onenterkey="OnSearchTrans()" onkeypress="Upcase()"/></td>
                            <td width="60%"><gw:textbox id="txtcust_nm" styles='width:100%'/></td>
                            <td width="0%"><gw:textbox  id="txtcust_pk" styles='display:none'/></td>
                            <td width="5%"><gw:imgBtn   img="reset"	id="idResetCust_1"  alt="Reset" onclick="Reset_Cust()"/></td>
                        </tr>
				        </table>
				    </td>
                    
                    <td align="center"><a title="Click here to select Trans Group" onclick="Popup_Trans()" href="#tips">Trans Group</a></td>
				    <td colspan=4>
				        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="30%"><gw:textbox id="txttrans_cd" styles='width:100%' onenterkey="OnSearchTrans()" onkeypress="Upcase()" csstype="mandatory"/></td>
                            <td width="60%"><gw:textbox id="txttrans_nm" styles='width:100%' csstype="mandatory"/></td>
                            <td width="0%"><gw:textbox  id="txttrans_pk" styles='display:none'/></td>
                            <td width="5%"><gw:imgBtn   img="reset"	id="idResetTr"  alt="Reset" onclick="Reset_Trans()"/></td>
                        </tr>
				        </table>
				    </td>
				    <td colspan= "2">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td align="left"><gw:radio id="rbstatus" value="1" onchange="OnChangeRadio()"> 
				                <span value="1">Prepare</span>
				                <span value="2">Payable</span>
				                <span value="3">Paid</span>
                                </gw:radio>
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right">Description</td>
                    <td colspan=3><gw:textbox id="txtdesc" styles='width:100%' csstype="mandatory"/></td>
                    <td align="center">Local Desc</td>
                    <td colspan=2><gw:textbox id="txtdesc_local" styles='width:100%' csstype="mandatory"/></td>
                    <td colspan="2"><gw:list id="btnReportList" styles='width:100%' /></td>
                    <td align="center">Type</td>
                    <td><gw:list id="lstType" onChange="OnSearch()" value ="" styles='width:100%'></gw:list></td>
                </tr>
				<tr>
					<td align="right">Bank ID</td>
					<td colspan="2"><gw:list id="lstBankID" style='width:100%;' /></td>
					<td colspan="2"><gw:list id="lstDepartment" style='width:100%;' /></td>
					<td align="right">Received Person</td>
					<td colspan="2"><gw:textbox id="txtRcvPerson" styles='width:100%' /></td>
					<td colspan="1" align="right"><a title="Click here to select account code" href="#tips" onclick="OnCreditAccount()" >Credit Account</a></td>
					<td colspan="1"><gw:textbox id="txtAccCD_CR" style='width:100%;' /></td>
					<td colspan="1"><gw:textbox id="txtAccNM_CR" style='width:100%;' />					    
					</td>
					<td><gw:imgBtn   img="reset"	id="idResetAccCR"  alt="Reset" onclick="Reset_CreditAcc()"/></td>
				</tr>
                </table>
            </td>
        </tr>
		<tr height='90%'>
            <td>
                <gw:tab id="idTab_Child"  onpageactivate="OnSetDataRadio()">
                    
                    <table name="Prepare" style='width:100%;height:100%' cellpadding ="0" cellspacing ="0" border="0" >
                        <tr height='100%'>
						<!--header  ="Chk|Seq|Voucher No|Acc.Code|Acc Name|Pay Date|Pay Ccy|Pay Rate|Trans Amount|Books Amount|_custpk|Partner Code|Partner Name|Description|Local Description|_TFN_EPPAYTR_PK|Pay Method|_Pay Type|Serial No|Invoice No|Invoice Date"-->
                            <td width ="100%">
                                <gw:grid   
                                    id="grid_amount"
                                    header  ="Chk|Seq|Voucher No|_custpk|Partner Code|Partner Name|Trans Amount|Books Amount|Serial No|Invoice No|Invoice Date|Acc.Code|Acc Name|Pay Date|Pay Ccy|Pay Rate|Description|Local Description|_TFN_EPPAYTR_PK|Pay Method|_Pay Type"
                                    format  ="3|0|0|0|0|0|0|0|0|0|4|0|0|0|0|0|0|0|0|0|0"
                                    aligns  ="1|1|0|0|0|0|3|3|0|0|1|0|0|0|0|0|0|0|0|0|0"
                                    defaults="||||||||||||||||||||"
                                    acceptNullDate="T"
                                    editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                    widths  ="400|600|1500|1000|2000|1200|800|1000|1500|1500|1300|2000|2000|2000|2000|0|1500|0|1500|1500|1500"
                                    styles  ="width:100%; height:100%"
									autosize="T"
                                    sorting ="T"
                                    />
                        </tr>
                    </table>
                    
                    <table name="Payable" width ="100%" cellpadding ="0" cellspacing ="0" border="1" >
                        <tr>
                            <td width ="100%">
                                <gw:grid   
                                    id="grid_payable"
                                    header  ="Chk|_PK|Voucher Type|Voucher No|Pay Date|Total Amount|Description|Local Description|_TRTYPE_PK|_TRTYPE_CD|_TRTYPE_NAME|_STATUS"
                                    format  ="3|0|0|0|0|0|0|0|0|0|0|0"
                                    aligns  ="1|0|1|1|1|3|0|0|0|0|0|0"
                                    defaults="|||||||||||"
                                    editcol ="0|0|0|0|0|0|0|0|0|0|0|0"
                                    widths  ="400|0|1500|1500|1500|1500|3500|2000|0|0|0|0"
                                    styles  ="width:100%; height:120"
                                    acceptNullDate="T"
                                    sorting ="F"
                                    oncellclick  = "RowClick_Payable()"
                                    />
                        </tr>
                        <tr>
                            <td>
                                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td width="60%" id="tdGrid">
                                        <table border=0 width="100%" cellpadding=0 cellspacing=0 >
                                        <tr>
                                            <td>
				                                <table  width ="100%" cellpadding ="0" cellspacing ="0" border="0" >
                                                <tr>
				                                    <td>
		                                                <table width ="100%" cellpadding ="0" cellspacing ="0" border="0">
		                                                    <tr>
	                                                           <td width ="5%" align="left"><b><a onClick="OnSumDR()" href="#tips"   style="text-decoration : none; color=#0000FF" ><b><u>Debit</u></b> </a></td>				
	                                                           <td width ="15%"><gw:textbox id="txtsum_chk_dr_famt" styles="width:100%"type="number" format="#,###,###,###,###.##R"/></td>
			                                                   <td width ="15%"><gw:textbox id="txtsum_chk_dr_amt" styles="width:100%"type="number" format="#,###,###,###,###R"/></td>
			                                                   <td width ="3%" align="center"><img id="imgMaster" alt="Show Column" src="../../../../system/images/iconmaximize.gif" style="cursor:hand; display:none;" onclick="RowClick_DR()" /></td>
				                                               <td width ="7%" align="right"><b>Total</b></td>
				                                               <td width ="15%"><gw:textbox id="txtsum_total_dr_famt"   styles="width:100%"  type="number" format="#,###,###,###,###.##R"/></td>
				                                               <td width ="15%"><gw:textbox id="txtsum_total_dr_amt"    styles="width:100%"  type="number" format="#,###,###,###,###.##R"/></td>
	                                                           <td width ="3%" align ="right" ><gw:imgBtn id="btnNew_Dr"    img="new"       alt="New"       onclick="OnNewDr()" /> </td>
	                                                           <td width ="3%" align ="right" ><gw:imgBtn id="btnSave_Dr"   img="save"      alt="Save"      onclick="OnSaveDr()" /> </td>
	                                                           <td width ="3%" align ="right" ><gw:imgBtn id="btnDel_Dr"    img="delete"    alt="Delete"    onclick="OnDelDr()" /> </td>
	                                                           <td width ="3%" align ="right" ><gw:icon   id="btnUp_Dr"                                     onclick="OnUpDr()"><img src="../../../../system/images/up.gif"/></gw:icon> </td>
	                                                           <td width ="3%" align ="right" ><gw:icon   id="btnDown_Dr"                                   onclick="OnDownDr()"><img src="../../../../system/images/down.gif"/></gw:icon> </td>
	                                                           <td width ="3%"></td>
                                                            </tr>
                                                        </table>                   
                                                    </td>
                                                </tr>
	                                            <tr>
                                                    <td width ="100%" >
                                                    <gw:grid
                                                        id="grdDebit"  
                                                        header  ="_Pk|_Acc_pk|||Acc.Code|Acc.Name|Ccy|Rate|Amount Trans|Amount Book|Description|Local Description|_m_pk|_ODR|_DRCR|_p_tfn_eppay_pk|_p_com_pk|_p_fged_yn|_p_bkrate|_p_tfn_eppaytr_pk"
                                                        format  ="0|0|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                                        aligns  ="0|0|1|1|1|0|1|1|3|3|0|0|3|3|3|0|0|0|0|0"
                                                        defaults="||||||VND|||||||||||||"
                                                        editcol ="0|0|1|1|0|0|1|1|1|1|1|1|0|1|1|0|0|0|0|0"
                                                        widths  ="0|0|250|300|1000|2100|700|1000|1800|1800|2500|2500|0|0|0|0|0|0|0|0"
                                                        styles  ="width:100%; height:160"
                                                        sorting ="F"   
                                                        oncellclick  = "RowClick_DR()"
                                                        onafteredit  = "RowEditDR()"                                                        
                                                         />
                                                    </td>
                                                </tr>
	                                            </table>	
			                                </td>
                                          </tr>
                                          <tr>
                                            <td width="100%">
				                                <table  width ="100%" cellpadding ="0" cellspacing ="0" border="0" >
				                                <tr>
		                                            <td>
		                                                <table width ="100%" cellpadding ="0" cellspacing ="0" border="0">
		                                                    <tr>
	                                                           <td width="5%"><b><a onClick="OnSumCR()" href="#tips" style="text-decoration:none; color=#0000FF" ><b><u>Credit</u></b> </a></td>				
	                                                           <td width="15%"><gw:textbox id="txtsum_chk_cr_famt" styles="width:100%"type="number" format="#,###,###,###,###.##R"/> </td>                                        
				                                               <td width="15%"><gw:textbox id="txtsum_chk_cr_amt" styles="width:100%"type="number" format="#,###,###,###,###R"/> </td>                                        
				                                               <td width ="3%" align="center"><img id="img1" alt="Show Column" src="../../../../system/images/iconmaximize.gif" style="cursor:hand; display:none; " onclick="RowClick_CR()" /></td>
				                                               <td width="7%" align="center"><b>Total</b>&nbsp;&nbsp;</td>                    
				                                               <td width="15%"><gw:textbox id="txtsum_total_cr_famt"  styles="width:100%" type="number" format="#,###,###,###,###.##R"/></td>                    
				                                               <td width="15%"><gw:textbox id="txtsum_total_cr_amt" styles="width:100%"  type="number" format="#,###,###,###,###.##R"/></td>  
	                                                           <td width="3%" align ="right" ><gw:imgBtn id="btnNew_Cr"     img="New"     alt="New"     onclick="OnNewCr()" /> </td>
	                                                           <td width="3%" align ="right" ><gw:imgBtn id="btnSave_Cr"    img="save"    alt="Save"    onclick="OnSaveCr()" /> </td>
	                                                           <td width="3%" align ="right" ><gw:imgBtn id="btnDel_Cr"     img="delete"  alt="Delete"  onclick="OnDelCr()" /> </td>
	                                                           <td width="3%" align ="right" ><gw:icon   id="btnUp_Cr"                                  onclick="OnUpCr()"><img src="../../../../system/images/up.gif" /></gw:icon> </td>
	                                                           <td width="3%" align ="right" ><gw:icon   id="btnDown_Cr"                                onclick="OnDownCr()"><img src="../../../../system/images/down.gif" /></gw:icon> </td>
	                                                           <td width="3%" align ="right" ><img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;" onclick="OnToggle()" /></img></td>
                                                            </tr>
                                                        </table>                   
                                                    </td>
                                                </tr>
	                                            <tr>
	                                                <td width ="100%">
	                                                    <gw:grid
	                                                        id="grdCredit"  
						                                    header  ="_Pk|_Acc_pk|||Acc.Code|Acc.Name|Ccy|Rate|Amount Trans|Amount Book|Description|Local Description|_m_pk|_ODR|_DRCR|_p_tfn_eppay_pk|_p_com_pk|_p_fged_yn|_p_bkrate|_p_tfn_eppaytr_pk"
                                                            format  ="0|0|3|0|0|0|0|0|0|2|0|0|0|0|0|0|0|0|0|0"
                                                            aligns  ="0|0|1|1|1|0|1|1|3|3|0|0|3|3|3|0|0|0|0|0"
                                                            defaults="||||||VND|||||||||||||"
                                                            editcol ="0|0|1|1|0|0|1|1|1|1|1|1|0|1|1|0|0|0|0|0"
                                                            widths  ="0|0|250|300|1000|2100|700|1000|1800|1800|2500|2500|0|0|0|0|0|0|0|0"
                                                            styles  ="width:100%; height:160"
                                                            sorting ="F" 
                                                            oncellclick  = "RowClick_CR()"                                                            
                                                            onafteredit  = "RowEditCR()"                                                            
                                                            oncelldblclick = "OnPopUpAcc()"
				                                            />
                                                    </td>   
                                                </tr>
	                                            </table>	
                                            </td>
                                        </tr>
                                        </table>
                                    </td>
                                    <td width="40%" id="tdControlItem" style="display:none" valign="top">
                                        <table border="1" width="100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="100%">
                                                    <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="25%" align="Center"><b>Control Item</b></td>
                                                            <td width="50%" align="left"></td>
                                                            <td width="25%" align="right"><gw:icon id="btnTreament" img="in" text="Treament" onclick="OnTreament()"       styles="width:100%"/></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td width="100%"> 
							                        <gw:neogrid  id="idGridItem" styles="width:100%;height:200" oncelldblclick ="ClickItemControl()" onafteredit="ChangeData_Upper()"> 
								                        <XML>
									                        <xmlblock>
                        										
										                        <column title="itempk" hidden='T'>
											                        <textbox type="number" format="######"/>
										                        </column>

										                        <column title="detailpk" hidden='T'>
											                        <textbox type="number" format="######" />
										                        </column>

										                        <column title="acctpk" hidden='T'>
											                        <textbox type="number" format="######" />
										                        </column>

										                        <column title="INPUT TYPE" hidden='T'>
											                        <textbox  format="3" />
										                        </column>

										                        <column title="dsqlid" hidden='T'>
											                        <textbox  format="3" />
										                        </column>

										                        <column title="dsql" hidden='T'>
											                        <textbox  format="3" />
										                        </column>

										                        <column title="mandatory" hidden='T'>
											                        <textbox  format="3" />
										                        </column>

										                        <column title="data type" hidden='T'>
											                        <textbox  format="3" />
										                        </column>

										                        <column title="Item Alias" width='1500' editmode="0" >
											                        <textbox  format="3" />
										                        </column>

										                        <column title="Item"  width='2500'>
											                        <multiple ref="7"  >
												                        <textbox type="number" format="###,###C" value="" />
												                        <textbox format="50" value="" />
												                        <datebox type="day" format=""  lang="1" acceptnull="T"/>
												                        <checkbox />	
												                        <htmledit value="[New]" />				
											                        </multiple>
										                        </column>
                        										
										                        <column title="Item code" width='1500'>
											                        <textbox/>
										                        </column>
                        										
										                        <column title="ITEM NM" hidden='T'>
											                        <textbox  />
										                        </column>
                        										
										                        <column title="ITEM PK" hidden='T'>
											                        <textbox  />
										                        </column>
									                        </xmlblock>
								                        </xml>
							                        </gw:neogrid>
						                        </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    
                    <table name="Paid" style='width:100%;height:100%' cellpadding ="0" cellspacing ="0" border="0" >
                        <tr height='100%'>
                            <td width ="100%">
                                <gw:grid   
                                    id="grid_paid"
                                    header  ="Chk|Seq|Voucher Type|Voucher No|Pay Date|Total Amount|Description|Local Description|_STATUS|_TFN_EPPAYTRH_PK|Debit Account"
                                    format  ="3|0|0|0|0|0|0|0|0|0|0"
                                    aligns  ="1|1|1|1|1|3|0|0|0|0|0"
                                    defaults="||||||||||"
                                    editcol ="0|0|0|0|0|0|0|0|0|0|0"
                                    widths  ="400|1000|1500|1500|1500|1500|3500|2000|0|0|1500"
                                    styles  ="width:100%; height:100%"
                                    sorting ="T"
									autosize="T"
                                    oncelldblclick="onSearchTAcc()"
                                    />
                        </tr>
                    </table>
                    </gw:tab>
                </td>
            </tr>
        </table>
    </td>
</tr>


</table>

<gw:textbox id="txtProposedByUserPk"    style="display:none"/>
<gw:textbox id="txtProposedByUserID"    style="display:none"/>
<gw:textbox id="txtProposedByUserName"  style="display:none"/>


<gw:list    id="lstBook_ccy" 		    style="width:75%;display:none"></gw:list >
<gw:textbox id="txtBookRate"            style="display:none" />
<gw:textbox id="txt_date"               style='display:none'/>
<gw:textbox id="txt_paydate"               style='display:none'/>
<gw:textbox id="txt_rowclick"         style='display:none'  />
<gw:textbox id="txtStatus"              style="display:none" />

<gw:textbox id="txt_drcr_type"              style='display:none'/>
<gw:textbox id="txt_str"                    style='display:none'/>
<gw:textbox id="txt_eppaytrh_pk"            style='display:none'/>
<gw:textbox id="txt_index"                  style='display:none'/>
<gw:textbox id="txt_eppaytrd_pk"            style='display:none'/>
<gw:textbox id="txtacpk"                    style='display:none'/>
<gw:textbox id="txt_count"                  style='display:none'/>
<gw:textbox id="txt_tmp"                    style='display:none'/>
<gw:textbox id="txtcur"                     style="display:none"/>
<gw:textbox id="txtrate"                    style="display:none"/>
<gw:textbox id="txtAccPK_CR"                    style="display:none"/>

<gw:grid 
    id="idGridTempItem"
    header="itemacctpk|itemal|item|itemnm|table_pk"
    format="0|0|0|0|0"
    aligns="0|0|0|0|0"
    defaults="||||"
    editcol="0|0|0|0|0"
    widths="1300|3500|3500|2000|0"
    styles="display:none;"
    sorting="F"
    param="0,1,2,3,4"/>
<gw:textbox id="txtUser_PK"                    style="display:none"/>	
<gw:textbox id="txtEmp_ID"                    style="display:none"/>
</body>
</html>