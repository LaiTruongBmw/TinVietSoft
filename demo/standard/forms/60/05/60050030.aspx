<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Payment Voucher</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">
var G_D_PK = 0,
    G_D_ACC_PK = 1,
    G_D_CHECK = 2,
    G_D_TYPE_REF = 3,
    G_D_ACC_CD = 4,
    G_D_ACC_NM = 5,
    G_D_CCY = 6,
    G_D_EXRATE = 7,
    G_D_AMT_TR = 8,
    G_D_AMT_BK = 9,
    G_D_VAT_PER = 10,
    G_D_VATAMT_TR = 11,
    G_D_VATAMT_BK = 12,
    G_D_VATAMT_DEDUCT_TR = 13,
    G_D_VATAMT_DEDUCT_BK = 14,
    G_D_DESCRIPTION = 15,
    G_D_DESCRIPTION_LC = 16,
    G_D_M_PK = 17,
    G_D_ODR = 18,
    G_D_DRCR = 19,
    G_D_EXRATE_BK = 20,
    G_D_DESCRIPTION_KOR = 21
    ;
    
    
var click_dr = 0;
var click_cr = 0;
var _Book_CCY;
var _book_rate = 1;
var _book_col_format = "###,###.##R";
var flag_select = false;
var lang = "<%=Session("SESSION_LANG")%>";
var _company_pk = "<%=Session("COMPANY_PK")%>";
var _user_id = "<%=Session("USER_ID")%>";
var _dept_pk = "<%=Session("ORG_PK")%>";
var _user_pk = "<%=Session("USER_PK")%>";
var _user_name = "<%=Session("USER_NAME")%>";
var _employee_pk = "<%=Session("EMPLOYEE_PK")%>";

function BodyInit()
{
    System.Translate(document);
    idGridItem.SetHeaderBold(true);
    dso_udp_ctl_mst_pay_pvp.StatusInsert();
    
    txtsum_chk_dr_famt.SetEnable(false);
    txtsum_chk_dr_amt.SetEnable(false);
    txtsum_chk_cr_famt.SetEnable(false);
    txtsum_chk_cr_amt.SetEnable(false);
    //lstDepartment.SetEnable(false);
    txtProposedByUserID.SetEnable(false);
    txtProposedByUserName.SetEnable(false);
    btnTreament.SetEnable(false);
    txtcustid.SetEnable(false);
    txtcustnm.SetEnable(false);
    txtLang.SetDataText(lang);
    btnReplicate.SetEnable(false);
    btnCancel.SetEnable(false);
    btnConfirm.SetEnable(false);
    btnCopy.SetEnable(false);
    txsetDRamt2CR.SetDataText("0");
    txtsum_diff_famt.SetEnable(false);
    txtsum_diff_amt.SetEnable(false);
    
    <%=CtlLib.SetGridColumnComboFormat("grdDebit",  6,"SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
    <%=CtlLib.SetGridColumnComboFormat("grdCredit", 6,"SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;

    <%=CtlLib.SetGridColumnComboFormat("grdDebit",  10,"SELECT A.CODE, A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACCR0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
    <%=CtlLib.SetGridColumnComboFormat("grdCredit", 10,"SELECT A.CODE, A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACCR0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;

    grdDebit.GetGridControl().FrozenCols = 6;
    grdCredit.GetGridControl().FrozenCols = 6;

    _Book_CCY = "<%=CtlLib.SetDataSQL("select b.code, b.char_1  from tac_commcode_master a, tac_commcode_detail b where a.pk = b.tac_commcode_master_pk and a.id = 'ACBG0040' and b.def_yn = 'Y' and a.del_if = 0 and b.del_if = 0")%>";
    var a = _Book_CCY.split("|");
    if(a.length <=0) alert("Please setup book currency in common code.");
    _Book_CCY = a[0];
    SetColumnFormat(a[1]);
     var ls_data3    = "<%=CtlLib.SetListDataFUNC("SELECT ac_get_default ('EACAB032')   FROM DUAL")%>";
    var arr  = ls_data3.split("|");
	txtEACAB032.SetDataText(arr[1]); 
	
	ls_data3    = "<%=CtlLib.SetListDataFUNC("SELECT ac_get_default ('EACAB018')   FROM DUAL")%>";
    var  arr  = ls_data3.split("|");
	txtEACAB018.SetDataText(arr[1]);
	
    txtGROUPID.text = "EACAB011";
    txtFORMID.text = "60020030";
    txtseq.GetControl().focus();
    ibtnPopup.SetEnable(false);
    BindingDataList();
    SetUserInfo();
    OnShowHide_Col('Dr');
    OnShowHide_Col('Cr');
     txtUser_Pk.text = "<%=Session("USER_PK")%>";
   dso_getCompany.Call();
    
}
function onChangeDate()
{
    dso_get_exrate_list.Call();
}
function OnAutoYN()
{
    if (chkauto_YN.GetData() != 'T')
    {
        txtvoucher_auto.SetEnable(true);
        txtvoucher_auto.SetDataText('');
	    txtvoucher_auto.GetControl().focus();
    }
    else
    {
        txtvoucher_auto.SetEnable(false);
    }
}

function BindingDataList()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_data1    = "<%=CtlLib.SetListDataSQL("SELECT A.PK, A.org_NM FROM TCO_org A WHERE a.del_if=0 ")%>";
    var ls_data2    = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'ACBG0130' AND M.DEL_IF = 0 AND D.DEL_IF = 0 and D.USE_YN = 'Y' ORDER BY D.CODE_NM")%>"; 
    var ls_data3    = "<%=CtlLib.SetListDataSQL("SELECT NVL(NUM_3, '0'), CODE FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE D.TAC_COMMCODE_MASTER_PK = M.PK AND D.DEL_IF = 0 AND M.DEL_IF = 0 AND M.ID = 'ACBG0130'")%>";
    
    var ls_data4    = "<%=CtlLib.SetDataSQL("SELECT CODE FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'ACBG0130' AND B.CHAR_3 = 'PV' AND A.DEL_IF = 0 AND B.DEL_IF = 0")%>";
    var ls_data5    = "<%=CtlLib.SetDataSQL("SELECT NUM_2 FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'ACBG0130' AND B.CHAR_3 = 'PV' AND A.DEL_IF = 0 AND B.DEL_IF = 0")%>";
    var ls_data6    = "<%=CtlLib.SetDataSQL("SELECT NVL(NUM_3, '0') FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'ACBG0130' AND B.CHAR_3 = 'PV' AND A.DEL_IF = 0 AND B.DEL_IF = 0")%>";
    var ls_data7    = "<%=CtlLib.SetDataSQL("SELECT DECODE(B.CODE, 'Y', 'T', 'F') FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACAB004' AND B.DEF_YN = 'Y' AND A.DEL_IF = 0 AND B.DEL_IF = 0")%>";
    var ls_data8    = "<%=CtlLib.SetListDataSQL("SELECT b.CODE, b.CODE_NM FROM tac_commcode_master a, tac_commcode_detail b WHERE a.pk = b.tac_commcode_master_pk and b.use_yn = 'Y' AND a.ID = 'GFQC0016'  AND a.del_if = 0 AND b.del_if = 0 and b.remark = 'P' ORDER BY B.DEF_YN DESC,B.ORD")%>";

    lstReportLocation.SetDataText(ls_data8);
	lstReportLocation.value = '1030_v2';
    var ls_Circulars = "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='AC150001' ORDER BY D.DEF_YN DESC")%>";
	lstCirculars.SetDataText(ls_Circulars);
	var ls_Print_Format = "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='TPS0054' and D.DEF_YN = 'Y'")%>";
	txtPrint_Format.SetDataText(ls_Print_Format);
    var ls_Print_Amount = "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='TPS0055' and D.DEF_YN = 'Y'")%>";
	lst_Print_Amount.SetDataText(ls_Print_Amount);
    lstCompany.SetDataText(ls_data);
    lstCompany.SetDataText(_company_pk);
    lstDepartment.SetDataText(ls_data1);
    lstVoucherType.SetDataText(ls_data2);
	lstVoucherTypePrint.SetDataText(ls_data3);
    lstVoucherType.SetDataText(ls_data4);
    lstVoucherTypePrint.SetDataText(ls_data6);
    chkauto_YN.SetDataText(ls_data7);
    if (ls_data7 == 'T')
    {
        txtvoucher_auto.SetEnable(false);
        txtvoucher_auto.SetDataText('');
    }
    else
    {
        txtvoucher_auto.SetEnable(true);
        txtvoucher_auto.SetDataText('');
    }
    lstVoucherType.SetEnable(false);
    txttax_acc.SetDataText(ls_data5);
}

function onCustPopUp()
{
    var path = System.RootURL + '/standard/forms/60/05/60050010_popup_4.aspx?com_pk=' + lstCompany.value;
    var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
	if ( object != null )
	{
		if (object[0] != 0)
        {
            txtcustpk.text = object[0];//
            txtcustid.text = object[1];//
            txtcustnm.text = object[2];//
        }
    }
}

function onCustReset()
{
    txtcustpk.text = "";
    txtcustid.text = "";
    txtcustnm.text = "";
}

function OnToggle()
{
    var left  = document.all("tdGrid");
    var right = document.all("tdControlItem");
    var imgArrow = document.all("imgArrow");
    
    if(imgArrow.status == "collapse")
    {
        right.style.display="none";       
        imgArrow.status = "expand";
        left.style.width="100%";
        imgArrow.src = "../../../system/controls/images/button/back.png";
    }
    else
    {
        right.style.display="";
        imgArrow.status = "collapse";
        left.style.width="60%";
        imgArrow.src = "../../../system/controls/images/button/next.png";
    }
}

function OnCtrToggleLeft()
{
    var left  = document.all("tdGrid");
    var right = document.all("tdControlItem");
    var imgArrow = document.all("imgArrow");
    
    right.style.display="";
    imgArrow.status = "collapse";
    left.style.width="60%";
    imgArrow.src = "../../../system/controls/images/button/next.png";
}

function OnCtrToggleRight()
{
    var left  = document.all("tdGrid");
    var right = document.all("tdControlItem");
    var imgArrow = document.all("imgArrow");
    
    if(imgArrow.status == "collapse")
    {
        right.style.display="none";       
        imgArrow.status = "expand";
        left.style.width="100%";
        imgArrow.src = "../../../system/controls/images/button/back.png";
    }
}

//------------------------------------- Master event ----------------------------------------------------
 
function onSearch()
{
    var path    = System.RootURL + '/standard/forms/60/05/60050010_popup_search.aspx?com_pk='+ lstCompany.GetData() + '&dsql=ac_sel_60050010_payment_search' + '&VoucherType=' + lstVoucherType.GetData();
    var object  = System.OpenModal( path ,950 , 600, 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no');
    if ( object != null )
    {
        if (object[0] != 0)
        {
            txtseq.text     = object[1];
            txtseq1.text    = object[0];
            CheckKeySeq();
        }
    }
}

function Reset_Master()
{
    txtseq.text             = "";
    txtvoucher_no.text      = "";
    txtvoucher_auto.text    = "";
    txtpay_person.text      = "";
    txtcustpk.text          = "";
    txtcustid.text          = "";
    txtcustnm.text          = "";
    txtEnclose.text         = "";
    txtDescription.text     = "";
    txtLocalDescription.text= "";
    txtDescription_Korea.text= "";
	txsetDRamt2CR.SetDataText("0");
    txttrans_pk.text     = "";
    txttransaction_code.text     = "";
    txttransaction_name.text     = "";
}
function onChangDate()
{
    dso_get_exrate_list.Call();
}
 
function onNew()
{
    if (dso_udp_ctl_mst_pay_pvp.GetStatus() != 20){
        dso_udp_ctl_mst_pay_pvp.StatusInsert();
    }
    Reset_Master();
    
    grdDebit.ClearData();
    grdCredit.ClearData();
    idGridItem.SetData("");
    txtStatus.SetDataText("");
    SetButtonEnable();
    SetButtonCtl(true);
    btnTreament.SetEnable(false);
    OnCtrToggleRight();
    txtsum_chk_dr_famt.SetDataText('');
    txtsum_chk_dr_amt.SetDataText('');
    txtsum_chk_cr_famt.SetDataText('');
    txtsum_chk_cr_amt.SetDataText('');
    txtsum_total_dr_famt.SetDataText('');
    txtsum_total_dr_amt.SetDataText('');
    txtsum_total_cr_famt.SetDataText('');
    txtsum_total_cr_amt.SetDataText('');
    btnReplicate.SetEnable(false);
    var ls_data7    = "<%=CtlLib.SetDataSQL("SELECT DECODE(B.CODE, 'Y', 'T', 'F') FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACAB004' AND B.DEF_YN = 'Y' AND A.DEL_IF = 0 AND B.DEL_IF = 0")%>";
    chkauto_YN.SetDataText(ls_data7);
    if (ls_data7 == 'T'){
        txtvoucher_auto.SetEnable(false);
        txtvoucher_auto.SetDataText('');
    }
    else{
        txtvoucher_auto.SetEnable(true);
        txtvoucher_auto.SetDataText('');
    }
    SetUserInfo();
    //txttransaction_code.GetControl().focus();
    dso_transtype_acntcode.Call();
}

function CheckKeySeq()
{
        txtDescription.SetDataText("");
        txtLocalDescription.SetDataText("");
        txtDescription_Korea.SetDataText("");
        grdDebit.ClearData();
        grdCredit.ClearData();
        idGridItem.SetData("");
        
        txtsum_chk_dr_famt.text = 0;
        txtsum_chk_dr_amt.text = 0;
        txtsum_chk_cr_famt.text = 0;
        txtsum_chk_cr_amt.text = 0;
        txtsum_total_dr_famt.text = 0;
        txtsum_total_dr_amt.text = 0;
        txtsum_total_cr_famt.text = 0;
        txtsum_total_cr_amt.text = 0;
        txtsum_diff_famt.text = 0;
        txtsum_diff_amt.text = 0;
        
        flag_select = true;
        click_dr = 0;
        click_cr = 0;
        OnCtrToggleRight();
        if (txtseq.GetData() != '')
        {
            dso_sel_ctl_mst_pay_pvp.Call('SELECT');
        }
        else
        {
            dso_udp_ctl_mst_pay_pvp.Call('SELECT');
        }
}


function onDelete()
{
    if (txtStatus.GetData() == '')// Save
    {
        return;
    }
    if(!CanChange()) return;
    
    var path = System.RootURL + '/standard/forms/60/05/60050010_popup_causecancel.aspx?com_pk='+ lstCompany.GetData() + '&seq=' + txtseq1.GetData() + '&status=' + txtStatus.GetData() + '&userid=' + txtProposedByUserID.GetData() + '&usernm=' + txtProposedByUserName.GetData() + '&userpk=' + txtProposedByUserPk.GetData() + '&dsqlid=ac_PRO_60050010_popup_cancel';
    var object = System.OpenModal( path,  400 , 400,'resizable:yes;status:yes');
    if ( object != null )
    {
        if (object[0] !=0)
        {
            txtseq1.text = object[0];
            CheckKeySeq();
        }
    }
}
 
function onSave()
{
    if (Check_Master_Ctl())
    {
        dso_udp_ctl_mst_pay_pvp.Call();
    }
}
 
function Check_Master_Ctl()
{
    if(!CanChange()) return false;
    if (txttrans_pk.GetData() == '')
    {
        alert('Transaction Type is not null. Please check again'+'\n'+'Loại giao dịch không được rỗng. Bạn hãy kiểm tra lại!!!');
        return false;
    }
    if (txtProposedByUserPk.text == '')
    {
        alert(''+'\n'+'Bạn đã hết phiên giao dịch. Hãy đăng nhập lại, cảm ơn!!!');
        return false;
    }
    if (txtDescription.GetData() == '')
    {
        alert('   Description is not null. Please check again!!!'+'\n'+'Diễn giải không được rỗng. Bạn hãy kiểm tra lại!!!');
        return false;
    }
    if (txtLocalDescription.GetData() == '')
    {
        alert('Local description is not null. Please check again'+'\n'+'Diễn giải không được rỗng. Bạn hãy kiểm tra lại!!!');
        return false;
    }
    return true;
}
 
function Popup_OnNew(p_payrec, p_drcr)
{
    if(!CanChange()) return;
    
    var i = 0;
    var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_new.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + txttransaction_code.GetData() + '' + "&val1="  + "&val2=" + p_drcr + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60050010_drcr_payrec";
    aValue      = System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	
    if ( aValue != null ) 
    {
        if (aValue.length > 0)
        {
            for(i=0; i<aValue.length; i++)
            {
                var tmp = aValue[i];
                if (tmp[1] != 0)
                {
                    var book_rate = GetBookExRate(tmp[6]);
                    if (p_drcr == 'D')
                    {
                        grdDebit.AddRow();
                        grdDebit.SetGridText( grdDebit.rows - 1, 19, 'D' );
					    grdDebit.SetGridText( grdDebit.rows - 1,  3, '1' );
					    grdDebit.SetGridText( grdDebit.rows - 1, 1, tmp[1]);    //ACPK
					    grdDebit.SetGridText( grdDebit.rows - 1, 4, tmp[4]);    //Account Code
					    grdDebit.SetGridText( grdDebit.rows - 1, 5, tmp[5]);    //Account Name
                        grdDebit.SetGridText( grdDebit.rows - 1, 6, tmp[6]);   
                        grdDebit.SetGridText( grdDebit.rows - 1, 7, book_rate);       //Rate
					    if (grdDebit.rows > 2)
					    {
					        var ls_curr = grdDebit.GetGridData(grdDebit.rows - 2, 6);
					        var ls_rate = grdDebit.GetGridData(grdDebit.rows - 2, 7);
					        var ls_ref  = grdDebit.GetGridData(grdDebit.rows - 2, 3);
//					        grdDebit.SetGridText( grdDebit.rows - 1, 6, ls_curr);       //Rate
//					        grdDebit.SetGridText( grdDebit.rows - 1, 7, ls_rate);       //Rate
					        grdDebit.SetGridText( grdDebit.rows - 1, 3, ls_ref);
					    }
					    else
					    {
//					        grdDebit.SetGridText( grdDebit.rows - 1, 7, '1');           //Rate
					        grdDebit.SetGridText( grdDebit.rows - 1, 3, '1');
					    }
					    grdDebit.SetGridText( grdDebit.rows - 1, 10, "01" );                        //Desc Eng
					    grdDebit.SetGridText( grdDebit.rows - 1, 15, txtDescription.text );         //Desc Eng
					    grdDebit.SetGridText( grdDebit.rows - 1, 16, txtLocalDescription.text );    //Desc Local
                        grdDebit.SetGridText( grdDebit.rows - 1, 21, txtDescription_Korea.text ); 
					    grdDebit.SetGridText( grdDebit.rows - 1, 17, txtseq1.text );                 //SEQ
					    grdDebit.SetGridText( grdDebit.rows - 1, 20, GetBookExRate(_Book_CCY));                 //SEQ
					    click_dr = 0;
					    //grdDebit.SetRowEditable(grdDebit.rows - 1, false);
						Color_Save('Dr');
                    }
                    else if (p_drcr == 'C')
                    {
                        grdCredit.DeselectRow(grdCredit.row);
	                    grdCredit.AddRow();
                        grdCredit.SelectRow(grdCredit.rows - 1);
                        grdCredit.SetGridText( grdCredit.rows - 1, 19, 'C' );
					    grdCredit.SetGridText( grdCredit.rows - 1, 1, tmp[1]);  //ACPK
					    grdCredit.SetGridText( grdCredit.rows - 1, 4, tmp[4]);  //Account Code
					    grdCredit.SetGridText( grdCredit.rows - 1, 5, tmp[5]);  //Account Name
                        grdCredit.SetGridText( grdCredit.rows - 1, 6, tmp[6]);   
                        grdCredit.SetGridText( grdCredit.rows - 1, 7, book_rate);       //Rate
//					    if (grdCredit.rows > 2)
//					    {
//					        var ls_curr = grdCredit.GetGridData(grdCredit.rows - 2, 6);
//					        var ls_rate = grdCredit.GetGridData(grdCredit.rows - 2, 7);
//					        grdCredit.SetGridText( grdCredit.rows - 1, 6, ls_curr);       //Rate
//					        grdCredit.SetGridText( grdCredit.rows - 1, 7, ls_rate);       //Rate
//					    }
//					    else
//					    {
//					        grdCredit.SetGridText( grdCredit.rows - 1, 7, '1');           //Rate
//					    }
					    var ls_ref;
					    if (grdDebit.row != -1)
					    {
					        ls_ref = grdDebit.GetGridData(grdDebit.row, 3);
					    }
					    else
					    {
					        ls_ref = 1;
					    }
					    grdCredit.SetGridText( grdCredit.rows - 1, 3, ls_ref );
                        onSetData_CR(ls_ref);
                        grdCredit.SetGridText( grdCredit.rows - 1, 10, "01" );                          //Desc Eng
					    grdCredit.SetGridText( grdCredit.rows - 1, 15, txtDescription.text );           //Desc Eng
					    grdCredit.SetGridText( grdCredit.rows - 1, 16, txtLocalDescription.text );      //Desc Local
                        grdCredit.SetGridText( grdCredit.rows - 1, 21, txtDescription_Korea.text ); 
					    grdCredit.SetGridText( grdCredit.rows - 1, 17, txtseq1.text);  
					                      //SEQ Local
                      //  alert(GetBookExRate(_Book_CCY));					                      
					    grdCredit.SetGridText( grdCredit.rows - 1, 20, GetBookExRate(_Book_CCY));
					    click_cr = 0;
					    //grdCredit.SetRowEditable(grdCredit.rows - 1, false);
						OnSumDR();
						//alert(grdCredit.rows-1);
						if(txsetDRamt2CR.GetData()=="0")
						{
							//alert(txtsum_total_dr_famt.GetData());
							//alert(txtsum_total_dr_famt.GetData());
							grdCredit.SetGridText( 1, 8, txtsum_total_dr_famt.GetData());     //7.Amount Trans
							grdCredit.SetGridText( 1, 9, txtsum_total_dr_amt.GetData());     //8.Amount Book
						}
						txsetDRamt2CR.SetDataText("2");
						Color_Save('Cr');
                    }
                }
            }
        }
    }
}

function onSetData_CR(p_ref)
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
	for (i = 1; i < grdCredit.rows; i++)
	{
        if ((grdCredit.GetGridData(i, 3) == p_ref) && (grdCredit.row != click_cr))
        {
            l_sum_cr = l_sum_cr + Number(grdCredit.GetGridData(i, 9));
        }
	}
	//grdCredit.SetGridText( grdCredit.rows - 1, 9, l_sum_dr - l_sum_cr);
	for (i = 1; i < grdCredit.rows; i++)
    {
        if (grdCredit.row == i)
        {
            grdCredit.SetCellBold(i,1,i,19,true);
            grdCredit.SetRowEditable(i, true);
        }
        else
        {
            grdCredit.SetCellBold(i,1,i,19,false);
            grdCredit.SetRowEditable(i, false);
        }
    }
}
    
function OnNewDr()
{
    if (txtseq1.GetData() != '')
    {
        OnCtrToggleRight();
        Popup_OnNew('NOTREN', 'D');
    }
    else
    {
        alert('master not null'+'\n'+'');
        return;
    }
}

function OnNewCr()
{
    if (txtseq1.GetData() != '')
    {
        OnCtrToggleRight();
        Popup_OnNew('PAYMENT','C');
    }
    else
    {
        alert('master not null'+'\n'+'');
        return;
    }
}

function RowClick_DR()
{
    if (grdDebit.rows < 2)
    {
        return;
    }
	else
	{
	    if (grdDebit.row < 1)
	    {
	        return;
	    }
	   if (event.col == 9){
        
          var col_3='';
          col_3 = grdDebit.GetGridData(grdDebit.row,3);
         
          if(txtEACAB032.GetData()=='N' && col_3==1 ){
             grdDebit.row=-1;
             return;
            
           } 
        }
	    OnCheckSumDR();
	    if ((grdDebit.rows > 1) && (grdDebit.row < grdDebit.rows) && (grdDebit.row != click_dr))
	    {
            for (i = 1; i < grdDebit.rows; i++)
            {
                if (grdDebit.row == i)
                {
	                grdDebit.SetCellBold(i,1,i,23,true);
	                grdDebit.SetRowEditable(i, true);
                }
                else
                {
	                grdDebit.SetCellBold(i,1,i,23,false);
	                grdDebit.SetRowEditable(i, false);
                }
            }
            txtacpk.SetDataText(grdDebit.GetGridData(grdDebit.row, 1));
            txtbprvpvd.SetDataText(grdDebit.GetGridData(grdDebit.row, 0));
            var dr_ratevat  = grdDebit.GetGridData(grdDebit.row, 10);
            if (dr_ratevat != 'NO')
            {
                if (dr_ratevat != '01')
                {
                    txt_rate.SetDataText(grdDebit.GetGridData(grdDebit.row, 10));
                }
                else
                {
                    txt_rate.SetDataText('');
                }
            }
            else
            {
                txt_rate.SetDataText('');
            }
            txt_rowclick.text = grdDebit.row;
            txt_drcr_type.SetDataText('D');
            idGridItem.SetData("");
            click_dr = grdDebit.row;
            click_cr = 0;
			Color_Save('Dr');
            OnCheckSumDR();
            dso_upd_ctl_item.Call("SELECT");
        }
        
    }
}

function RowClick_CR()
{
    if (grdCredit.rows < 2)	
    {
        return;
    }
	else
	{
        if (grdCredit.row < 1)
	    {
	        return;
	    }
	    if (event.col == 9){
        
          var col_3='';
          col_3 = grdCredit.GetGridData(grdCredit.row,3);
         
          if(txtEACAB032.GetData()=='N' && col_3==1 ){
             grdCredit.row=-1;
             return;
            
           } 
        }
	    OnCheckSumCR();
	    if ((grdCredit.rows > 1) && (grdCredit.row < grdCredit.rows) && (grdCredit.row != click_cr))
	    {
            for (i = 1; i < grdCredit.rows; i++)
            {
                if (grdCredit.row == i)
                {
	                grdCredit.SetCellBold(i,1,i,23,true);
	                grdCredit.SetRowEditable(i, true);
                }
                else
                {
	                grdCredit.SetCellBold(i,1,i,23,false);
	                grdCredit.SetRowEditable(i, false);
                }
            }
            txtacpk.SetDataText(grdCredit.GetGridData(grdCredit.row, 1));
            txtbprvpvd.SetDataText(grdCredit.GetGridData(grdCredit.row, 0));
            var cr_ratevat  = grdCredit.GetGridData(grdCredit.row, 10);
            if (cr_ratevat != 'NO')
            {
                if (cr_ratevat != 1)
                {
                    txt_rate.SetDataText(grdCredit.GetGridData(grdCredit.row, 10));
                }
                else
                {
                    txt_rate.SetDataText('');
                }
            }
            else
            {
                txt_rate.SetDataText('');
            }
            txt_rowclick.text = grdCredit.row;
            txt_drcr_type.SetDataText('C');
            idGridItem.SetData("");
            click_dr = 0;
            click_cr = grdCredit.row;
            OnCheckSumCR();
			Color_Save('Dr');
            dso_upd_ctl_item.Call("SELECT");
        }
        
    }
}

function DBPopupClick_DR()
{
    if (event.col == 4)
	{
	    Popup_OnSelect_Acc('','D');
    }
}

function DBPopupClick_CR()
{
    if (event.col == 4)
	{
	    Popup_OnSelect_Acc('PAYMENT','C');
    }
}
function CanChange(){
    switch(txtStatus.GetData()){
        case "0":alert("This voucher was approved. So you can not change !.\n Số phiếu này đã được approve. Bạn không thể thay đổi !");
               return false;
        break;
        case "1": return true;
        case "2":alert("This voucher was confirmed. So you can not change !.\n Số phiếu này đã được xác nhận. Bạn không thể thay đổi !");
                 return false;
        break;
        case "3": return true;
        break;
        case "4": alert("This voucher was approved. So you can not change !.\n Số phiếu này đã được approve. Bạn không thể thay đổi !");
               return false;
        break;
    }
    return true;
}
function Popup_OnSelect_Acc(p_payrec, p_drcr)
{
    if(!CanChange()) return;
    
    var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_new.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + txttransaction_code.GetData() + '' + "&val1="  + "&val2=" + p_drcr + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60050010_drcr_payrec";    
    aValue      = System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	
    if (aValue != null)
    {
        if (aValue.length > 0)
        {
            for(i=0; i<aValue.length; i++)
            {
                var tmp = aValue[i];
                if (tmp[1] != 0)
                {
                    idGridItem.SetData("");
                    var book_rate = GetBookExRate(tmp[6]);
                    if ((p_drcr == 'D') && (txtStatus.GetData() == 1 || txtStatus.GetData() == ''))  
                    {
                        grdDebit.SetGridText( grdDebit.row, 19, 'D' );
					    grdDebit.SetGridText( grdDebit.row,  3, '1' );
					    grdDebit.SetGridText( grdDebit.row, 1, tmp[1]);
					    grdDebit.SetGridText( grdDebit.row, 4, tmp[4]);
					    grdDebit.SetGridText( grdDebit.row, 5, tmp[5]);
                        grdDebit.SetGridText( grdDebit.row, 6, tmp[6]);  
                        grdDebit.SetGridText( grdDebit.row, 7, book_rate);
					    click_dr = 0;
                        click_cr = 0;
					    RowClick_DR();
                    }
                    else if ((p_drcr == 'C') && (txtStatus.GetData() == 1 || txtStatus.GetData() == ''))
                    {
                        grdCredit.SetGridText( grdCredit.row, 19, 'C' );
					    grdCredit.SetGridText( grdCredit.row, 1, tmp[1]);
					    grdCredit.SetGridText( grdCredit.row, 4, tmp[4]);
					    grdCredit.SetGridText( grdCredit.row, 5, tmp[5]);
                        grdCredit.SetGridText( grdCredit.row, 6, tmp[6]); 
                        grdCredit.SetGridText( grdCredit.row, 7, book_rate);       //Rate
					    var ls_ref;
					    if (grdDebit.row != -1)
					    {
					        ls_ref = grdDebit.GetGridData(grdDebit.row, 3);
					    }
					    else
					    {
					        ls_ref = 1;
					    }
					    grdCredit.SetGridText( grdCredit.rows - 1, 3, ls_ref );
                        onSetData_CR(ls_ref);
                        click_dr = 0;
                        click_cr = 0;
					    RowClick_CR();
                    }
                }
            }
        }
    }
}
function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {
        case "dso_get_exrate_list":
            _book_rate = GetBookExRate(_Book_CCY);
            lblBookRate.text = _book_rate;
            
        break;
        case "dso_sel_ctl_mst_pay_pvp":
        case "dso_udp_ctl_mst_pay_pvp":
            SetButtonEnable();
            if (flag_select == true){
                txt_drcr_type.SetDataText('D');
                dso_upd_grd_dtl_payment_dr.Call("SELECT");
            }
            //flag_select=true;
        break;
        
        case "dso_upd_grd_dtl_payment_dr":
            OnCloseData();
            if (flag_select == true){
                txt_drcr_type.SetDataText('C');
                dso_upd_grd_dtl_payment_cr.Call("SELECT");
            }
            else{
                click_dr = 0;
                click_cr = 0;
                SaveItemControl();
            }
            for (i=1;i<=grdDebit.rows-1;i++)
            {               
                grdDebit.SetCellBgColor(i,20,i,20,Number(0XCDFAFF));
            }  
            
        break;
        
        case "dso_upd_grd_dtl_payment_cr":
            if (flag_select == true){
				flag_select = false;
                click_dr = 0;
                click_cr = 0;
                dso_get_exrate_list.Call();
            }
            else{
                SaveItemControl();
            }
            for (i=1;i<=grdCredit.rows-1;i++)
            {
                grdCredit.SetCellBgColor(i,20,i,20,0XCDFAFF);
            }  
        break;
        
        case "dso_upd_confirm":
            SetButtonEnable();
            CheckKeySeq();
        break;
        case "dso_upd_replicate":
	        txtseq.text = "";	
            SetButtonEnable();
            CheckKeySeq();
        break;
        case "dso_upd_copy":
            txtseq.text = ""; 		
            SetButtonEnable();
            CheckKeySeq();
        break;
        case 'dso_getCompany':
            dso_transtype_acntcode.Call();
        break;
        case 'dso_transtype_acntcode':
            dso_get_exrate_list.Call();
        break;
        case "dso_sel_trans_debit":
            txt_DRCR.SetDataText('C');
            dso_sel_trans_credit.Call('SELECT');
        break;
        case "dso_sel_trans_credit":
            OnCloseData();
            dso_pro_get_transname.Call();
        break;
        case "dso_pro_get_transname":
            OnSetDescriptionDetail();
        break;
		case 'dso_copy_dr':
			dso_upd_grd_dtl_payment_dr.Call('SELECT');
		break;
		case 'dso_copy_cr':
			dso_upd_grd_dtl_payment_cr.Call('SELECT');
		break;
    }
}

function SetButtonEnable()
{
    if (txtStatus.GetData() == 1) // Save
    {
        btnConfirm.SetEnable(true);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(false);
        btnCopy.SetEnable(true);
        ibtnPopup.SetEnable(false);
        SetButtonCtl(true);
    }
    else if (txtStatus.GetData() == 2) // Comfirm
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(true);
        btnReplicate.SetEnable(false);
        btnCopy.SetEnable(true);
        ibtnPopup.SetEnable(true);
        SetButtonCtl(false);
    }
    else if (txtStatus.GetData() == 3) // Cancel
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(true);
        btnCopy.SetEnable(false);
        ibtnPopup.SetEnable(true);
        SetButtonCtl(false);
    }
    else if (txtStatus.GetData() == '') // New
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(false);
        btnCopy.SetEnable(false);
        ibtnPopup.SetEnable(false);
        SetButtonCtl(true);
    }
    else if (txtStatus.GetData() == 0) // Approve
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(false);
        ibtnPopup.SetEnable(true);
		
        SetButtonCtl(false);
		btnCopy.SetEnable(true);
    }
    else if (txtStatus.GetData() == 4) // No Approve
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(false);
        ibtnPopup.SetEnable(true);
        SetButtonCtl(false);
    }
}

function SetButtonCtl(p_data)
{
    btnCopyRow_Dr.SetEnable(p_data);
	btnNew_Dr.SetEnable(p_data);
    btnSave_Dr.SetEnable(p_data);
    btnDel_Dr.SetEnable(p_data);
    btnUp_Dr.SetEnable(p_data);
    btnDown_Dr.SetEnable(p_data);
        
    btnCopyRow_Cr.SetEnable(p_data);
	btnNew_Cr.SetEnable(p_data);
    btnSave_Cr.SetEnable(p_data);
    btnDel_Cr.SetEnable(p_data);
    btnUp_Cr.SetEnable(p_data);
    btnDown_Cr.SetEnable(p_data);
    btnTreament.SetEnable(p_data);
    ibtnDelete.SetEnable(p_data);
    ibtnSave.SetEnable(p_data);
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
	for (i = 1; i < idGridItem.rows; i++)
    {
        if (idGridItem.GetGridData(i, 8) == 'CUSTOMER')
        {
            if (txtcustpk.GetData() != '')
            {
                if (idGridItem.GetGridData(i, 10) == '')
                {
                    idGridItem.SetGridText(i, 12, txtcustpk.GetData());//Customer pk
                    idGridItem.SetGridText(i,  11, "TCO_BUSPARTNER");
                    idGridItem.SetGridText(i,  10, txtcustnm.GetData());
                    idGridItem.SetGridText(i,  9, txtcustid.GetData());
                }
            }
        }
		else if (idGridItem.GetGridData(i, 8) == 'CUSTOMER NAME')
        {
            if (txtcustpk.GetData() != '')
            {
                if (idGridItem.GetGridData(i, 10) == '')
                {
                    idGridItem.SetGridText(i, 12, txtcustpk.GetData());//Customer pk
                    idGridItem.SetGridText(i,  11, "TCO_BUSPARTNER");
                    idGridItem.SetGridText(i,  10, txtcustnm.GetData());
                    idGridItem.SetGridText(i,  9, txtcustid.GetData());
                }
            }
        }
	}
	SetDetailCtlItem();	
	
}

function OnSaveDr()
{
    if(!CheckDataIsValid()) return;
    
    SetItemToGridTmp();
    
    if ((txt_drcr_type.GetData() == 'D') && (grdDebit.rows > 1))
    {
        for (i = 1; i < grdDebit.rows; i++)
        {
            if ((grdDebit.GetGridData(i, 17) == "") && (grdDebit.GetGridData(i, 8) != ''))
            {
                grdDebit.SetGridText(i, 17, txtseq1.GetData());
                grdDebit.SetRowStatus(i, 0x20);
            }            
            if ((grdDebit.GetGridData(i, 8) == '') && (grdDebit.GetGridData(i, 9) == ''))
            {
                grdDebit.SetGridText(i, 17, txtseq1.GetData());
                grdDebit.SetGridText(i, 8, 0);
                grdDebit.SetGridText(i, 9, 0);
            }
            grdDebit.SetGridText(i, 19, 'D');
            if (grdDebit.GetGridData(i, 15) == "")
            {
                grdDebit.SetGridText(i, 15, txtDescription.GetData());
            }
            if (grdDebit.GetGridData(i, 16) == "")
            {
                grdDebit.SetGridText(i, 16, txtLocalDescription.GetData());
            }
            if (grdDebit.GetGridData(i, 21) == "")
            {
                grdDebit.SetGridText(i, 21, txtDescription_Korea.GetData());
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
                grdDebit.SetGridText(i, 18, i - j);
            }
        }
        txt_rowclick.text = grdDebit.row;
        //flag_select='save';
		RowEditDR();
        dso_upd_grd_dtl_payment_dr.Call();
    }
}

function OnSaveCr()
{
    if(!CheckDataIsValid()) return;
    
    SetItemToGridTmp();
    //alert(flag_select);
    //alert(txt_drcr_type.GetData());
    if ((txt_drcr_type.GetData() == 'C') && (grdCredit.rows > 1))
    {
        for (i = 1; i < grdCredit.rows; i++)
        {
            if ((grdCredit.GetGridData(i, 17) == "") && (grdCredit.GetGridData(i, 8) != ''))
            {
                grdCredit.SetGridText(i, 17, txtseq1.GetData());
                grdCredit.SetRowStatus(i, 0x20);
            }
            if ((grdCredit.GetGridData(i, 8) == '') && (grdCredit.GetGridData(i, 9) == ''))
            {
                grdCredit.SetGridText(i, 17, txtseq1.GetData());
                grdCredit.SetGridText(i, 8, 0);
                grdCredit.SetGridText(i, 9, 0);
            }
            grdCredit.SetGridText(i, 19, 'C');
            if (grdCredit.GetGridData(i, 15) == "")
            {
                grdCredit.SetGridText(i, 15, txtDescription.GetData());
            }
            if (grdCredit.GetGridData(i, 16) == "")
            {
                grdCredit.SetGridText(i, 16, txtLocalDescription.GetData());
            }
            if (grdCredit.GetGridData(i, 21) == "")
            {
                grdCredit.SetGridText(i, 21, txtDescription_Korea.GetData());
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
                grdCredit.SetGridText(i, 18, i - j);
            }
        }
        txt_rowclick.text = grdCredit.row;
        //flag_select='save';
		RowEditCR();
        dso_upd_grd_dtl_payment_cr.Call();
    }
}
function CheckDataIsValid(){
    if(!CanChange()) return false;
    if (txtseq1.GetData() == '')
    {
        alert('  Save Master and then Treament'+'\n'+'Bạn lưu lại trước sau đó Treament');
        return false;
    }
    // Set Item To Grid
    //SetItemToGridTmp();
    
    if ((grdDebit.row < 1) && (grdCredit.row < 1))
    {
        return false;
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
			return false;
		}
		j = j + 1;
	}
	return true;
}
function OnTreament()
{
  if(txt_drcr_type.GetData() == 'C'){
    OnSaveCr();
  }
  else{
    OnSaveDr();
  }
}

function OnCloseData()
{
    for (i = 1; i < grdDebit.rows; i++)
    {
        grdDebit.SetGridText( i, 18, i);
        grdDebit.SetRowEditable(i, false);
    }
    for (i = 1; i < grdCredit.rows; i++)
    {
        grdCredit.SetGridText( i, 18, i);
        grdCredit.SetRowEditable(i, false);
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
                if ((idGridItem.GetGridData(i, 0) == ''))   // && (idGridItem.GetGridData(i, 9) !='' ))
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
                txtbprvpvd.SetDataText(grdDebit.GetGridData(txt_rowclick.text, 0));
            }
            else if (txt_drcr_type.GetData() == 'C')
            {
                if ((idGridItem.GetGridData(i, 0) == '')) //&& (idGridItem.GetGridData(i, 9) !='' )) //(idGridItem.GetGridData(i, 0) == '')
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
                txtbprvpvd.SetDataText(grdCredit.GetGridData(txt_rowclick.text, 0));
            }
	    }
        //flag_select='save';
	    dso_upd_ctl_item.Call("");
    }
}

function SetDetailCtlItem()
{
	if (idGridItem.rows > 1)
	{
	    for (i = 1; i<idGridItem.rows; i++)
	    {
            var itemal  = idGridItem.GetGridData(i,8);
            var item    = idGridItem.GetGridData(i,9);
		        for (j = 1; j<idGridTempItem.rows; j++)
		        {
		            var itemal2 = idGridTempItem.GetGridData(j,1);
		            var item2   = idGridTempItem.GetGridData(j,2);
		            var itemnm2 = idGridTempItem.GetGridData(j,3);
		            var itempk2 = idGridTempItem.GetGridData(j,4);	
					var temp_table_name = idGridTempItem.GetGridData(j,5);	
		            if ((itemal == itemal2) && (item == '') && (txtEACAB018.GetData()=='Y'))
	                {
	                    idGridItem.SetGridText( i ,  9, item2);
			            idGridItem.SetGridText( i , 10, itemnm2);
						idGridItem.SetGridText( i , 11, temp_table_name);
			            idGridItem.SetGridText( i , 12, itempk2);
	                }
		        }
	    }
    }
   
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
		var table_name  = idGridItem.GetGridData(i,11);
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
		            idGridTempItem.SetGridText(  j , 0, acctpk);
		            idGridTempItem.SetGridText(  j , 1, itemal);
		            idGridTempItem.SetGridText(  j , 2, item);
		            idGridTempItem.SetGridText(  j , 3, itemnm);
		            idGridTempItem.SetGridText(  j , 4, itempk);
					idGridTempItem.SetGridText(  j , 5, table_name);
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
				idGridTempItem.SetGridText(  ctrl1.rows - 1 , 5, table_name);
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
			idGridTempItem.SetGridText(  ctrl1.rows - 1 , 5, table_name);
		}
	}
}
/*
function SetNumGridDR()
{
    var fg=grdDebit.GetGridControl();
    fg.ColFormat(7) = "#,###,###,###,###,###,###,###,###R"; 
	fg.ColFormat(8) = "#,###,###,###,###,###,###,###,###.##R"; 
	fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###R"; 
	fg.ColFormat(11) = "#,###,###,###,###,###,###,###,###.##R"; 
	fg.ColFormat(12) = "#,###,###,###,###,###,###,###,###R"; 
	fg.ColFormat(13) = "#,###,###,###,###,###,###,###,###.##R"; 
	fg.ColFormat(14) = "#,###,###,###,###,###,###,###,###R"; 
}

function SetNumGridCR()
{
    var fg=grdCredit.GetGridControl();
    fg.ColFormat(7) = "#,###,###,###,###,###,###,###,###R"; 
	fg.ColFormat(8) = "#,###,###,###,###,###,###,###,###.##R"; 
	fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###R"; 
	fg.ColFormat(11) = "#,###,###,###,###,###,###,###,###.##R"; 
	fg.ColFormat(12) = "#,###,###,###,###,###,###,###,###R"; 
	fg.ColFormat(13) = "#,###,###,###,###,###,###,###,###.##R"; 
	fg.ColFormat(14) = "#,###,###,###,###,###,###,###,###R"; 
}
*/
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
            dso_upd_grd_dtl_payment_dr.Call();
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
            dso_upd_grd_dtl_payment_cr.Call();
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
        if (grdDebit.row > 1)
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
        if (grdDebit.row < ctrl.rows -1 )
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
        if (grdCredit.row > 1)
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
        if (grdCredit.row < ctrl.rows -1 )
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

function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
	var x = c.toUpperCase().charCodeAt(0);
	event.keyCode = x;
}

function OnConfirm()
{
    if(!CanChange()) return;
    Color_Save('Dr');
	Color_Save('Cr');
    dso_upd_confirm.Call();
}

function OnReplicate()
{
    dso_upd_replicate.Call();
}

function ClickItemControl()
{    
	var flg = "0";
	var ctrl = idGridItem.GetGridControl();
	var _customer_cd;
                var _customer_nm;
	if (idGridItem.GetGridData( ctrl.row, 2) == '-1')
	{
		flg = "2";
		var path = System.RootURL + '/standard/forms/60/05/60050010_popup_4.aspx?com_pk=' + lstCompany.value;
		var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		if ( object != null )
		{
		    if (object[0] != 0)
            {
		        idGridItem.SetGridText(ctrl.row, 12, object[0]);//table pk
		        idGridItem.SetGridText(ctrl.row,  9, object[1]);//item code
		        idGridItem.SetGridText(ctrl.row,  10, object[2]);//item name(customer name)
		        idGridItem.SetGridText(ctrl.row,  11, "TCO_BUSPARTNER") ;//TABLE NAME
		        for (i = 1; i < idGridItem.rows; i++)
		        {
		            if(idGridItem.GetGridData(i,8)=='CUSTOMER')
                        {
                            _customer_cd = idGridItem.GetGridData(i,9);
                            _customer_nm = idGridItem.GetGridData(i,10);
                        }
                        if(idGridItem.GetGridData(i,8)=='CUSTOMER NAME')
                        {
                            idGridItem.SetGridText(i,9,_customer_cd);
                            idGridItem.SetGridText(i,10,_customer_nm);
							idGridItem.SetGridText(i,11,'TCO_BUSPARTNER');
							idGridItem.SetGridText(i,12,object[0]);
                        }
		            if (idGridItem.GetGridData(i, 8) == 'SERIAL NO')
		            {
		                idGridItem.SetGridText(i,  9, object[7]);
		            }
		            if (idGridItem.GetGridData(i, 8) == 'TAX CODE')
		            {
		                idGridItem.SetGridText(i,  9, object[6]);
		            }
					if (idGridItem.GetGridData(i, 8) == 'FORM NO')
		            {
		                idGridItem.SetGridText(i,  9, object[8]);
		            }
		        }
				
		    }
        }
	}
	else if (idGridItem.GetGridData( ctrl.row, 2) == '-2')
	{
	    var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ac_SEL_60050010_popup_2005&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
        var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
        if ( object != null )  
        {
            if (object[0] != 0)
            {                
                idGridItem.SetGridText(ctrl.row,  9, object[1]) ;//item code
				idGridItem.SetGridText(ctrl.row, 10, object[3]) ;//item name(center name)
                idGridItem.SetGridText(ctrl.row,  11, "TAC_ABPLCENTER") ;//TABLE NAME
                idGridItem.SetGridText(ctrl.row,  12, object[2]) ;//table pk
            }
        } 
	}
	else if (idGridItem.GetGridData( ctrl.row, 2) == '-3')
	{
	    var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ac_SEL_60050010_BUDGET&col_code=' + "BUDGET CODE" + '&col_nm=' + "BUDGET NAME&val1="  + txtacpk.GetData() ;
        var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
        if ( object != null )  
        {
            if (object[0] != 0)
            {
                idGridItem.SetGridText(ctrl.row,  9, object[1]) ;//pl name
                idGridItem.SetGridText(ctrl.row, 10, object[3]) ;//cost center name
                idGridItem.SetGridText(ctrl.row,  11, "TAC_ABBUDGET") ;//
                idGridItem.SetGridText(ctrl.row,  12, object[2]) ;//table pk			
            }
        } 
	}
	else if(idGridItem.GetGridData(idGridItem.row, 8) == 'CONTRACT NOAR'){
	    var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_2007.aspx?contract_type=SALE&company=" + lstCompany.GetData();
        var object  = System.OpenModal(fpath , 900 , 600 , 'resizable:yes;status:yes'); 
        if ( object.length > 0 ){
            idGridItem.SetGridText(idGridItem.row,  9, object[1]) ;//ITEM CODE(contract no)
            idGridItem.SetGridText(idGridItem.row, 10, object[4]) ;//ITEM NAME(customer name)
            idGridItem.SetGridText(idGridItem.row, 11, "TAC_CRCONTRACT") ;//TABLE NAME 
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
            }
        } 
    }    
    else if(idGridItem.GetGridData( idGridItem.row, 8) == 'CONTRACT NOAP'){
	    var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_2007.aspx?contract_type=BUY&company=" + lstCompany.GetData();
        var object  = System.OpenModal(fpath , 900 , 600 , 'resizable:yes;status:yes'); 
        if ( object.length > 0 ){
            idGridItem.SetGridText(idGridItem.row,  9, object[1]) ;//ITEM CODE
            idGridItem.SetGridText(idGridItem.row, 10, object[4]) ;//ITEM NAME
            idGridItem.SetGridText(idGridItem.row, 11, "TAC_CRSUBCONTRACT") ;//TABLE NAME 
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
            }
        } 
	}
	else if(idGridItem.GetGridData( idGridItem.row, 8) == 'BENEFICIARY BANK'){ //BENEFICIARY BANK
	    var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_2009.aspx?contract_type=BUY&company=" + lstCompany.GetData();
        var object  = System.OpenModal(fpath , 900 , 600 , 'resizable:yes;status:yes'); 
        if ( object.length > 0 ){
            idGridItem.SetGridText(idGridItem.row,  9, object[1]) ;//BANK ID
            idGridItem.SetGridText(idGridItem.row, 10, object[0]) ;//BANK NAME(PARTNER NAME)
            idGridItem.SetGridText(idGridItem.row, 11, "TAC_BFBENEFICIARY") ;//TABLE NAME 
            idGridItem.SetGridText(idGridItem.row, 12, object[2]) ;//TABLE PK 
        } 
	}
	else if(idGridItem.GetGridData( idGridItem.row, 8) == 'BIZ PLACE'){ //BENEFICIARY BANK
	    var fpath   = System.RootURL + "/standard/forms/60/06/60060010_BizPlace_popup.aspx?com_pk=" + lstCompany.GetData();
        var object  = System.OpenModal(fpath , 900 , 600 , 'resizable:yes;status:yes'); 
        if ( object.length > 0 ){
            idGridItem.SetGridText(idGridItem.row,  9, object[1]) ;//BANK ID
            idGridItem.SetGridText(idGridItem.row, 10, object[2]) ;//BANK NAME(PARTNER NAME)
            idGridItem.SetGridText(idGridItem.row, 11, "TCO_BUSPLACE") ;//TABLE NAME 
            idGridItem.SetGridText(idGridItem.row, 12, object[0]) ;//TABLE PK 
        } 
	}

	else
	{
		if ((idGridItem.GetGridData( ctrl.row, 3) == 'T') || (idGridItem.GetGridData(ctrl.row, 3) == 'C'))
		{
			if (idGridItem.GetGridData( ctrl.row, 3) == 'C')
			{
				var ls_str = idGridItem.GetGridData(ctrl.row, 8);
				var temp = new Array();
                temp = ls_str.split(' ');
				var ls_temp = temp[0];
				
				var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + ls_str + "&company=" + lstCompany.GetData() + '&dsqlid=ac_sel_60050010_itemnm_popup&col_code=' + ls_temp +" CODE" + '&col_nm=' + ls_temp + " NAME";
                var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                if ( object != null )  
                {
                    if (object[0] != 0)
                    {
                        idGridItem.SetGridText(ctrl.row,  9, object[0]) ;//ITEM CODE
                        idGridItem.SetGridText(ctrl.row, 10, object[1]) ;//ITEM NAME
                        idGridItem.SetGridText(ctrl.row, 11, "TAC_ABITEMCODE") ;//TABLE NAME 
                        idGridItem.SetGridText(ctrl.row, 12, object[2]) ;//TABLE PK 
                        
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
				else
				{
					if ( idGridItem.GetGridData( ctrl.row, 8 )== "Bank Account No." || idGridItem.GetGridData( ctrl.row, 8 )== "DEPOSIT ACCOUNT NO" || idGridItem.GetGridData( ctrl.row, 8 )== "BANK ACCOUNT NUMBER" || idGridItem.GetGridData( ctrl.row, 8 )== "BANK ACCOUNT NO.")
					{
					    var ls_ccy
					    var _Ac_pk;
					    if (txt_drcr_type.GetData() == 'D')
					    {
					        ls_ccy = grdDebit.GetGridData(click_dr, 6);
                            _Ac_pk = grdDebit.GetGridData(click_dr, 1);
					    }
					    else if (txt_drcr_type.GetData() == 'C')
					    {
					        ls_ccy = grdCredit.GetGridData(click_cr, 6);
                            _Ac_pk = grdCredit.GetGridData(click_cr, 1);
					    }
                        
					    var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + "" + "&val1=" + ls_ccy + "&company="+ lstCompany.GetData() + '&dsqlid=ac_sel_60050010_bank_popup&col_code=' + 'Bank Code'  + '&col_nm=' + 'Bank Name'+ '&Acc_Pk='+_Ac_pk;
                        var object  =   System.OpenModal(  fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                        if (object != null)
                        {
                            if (object[0] != 0)
                            {
                                idGridItem.SetGridText(ctrl.row,  9, object[1]);//BANK ID
                                idGridItem.SetGridText(ctrl.row, 10, object[0]);//BANK NAME(PARTNER NAME)
                                idGridItem.SetGridText(ctrl.row, 11, "TAC_ABDEPOMT");// TABLE NAME 
                                idGridItem.SetGridText(ctrl.row, 12, object[2]);// TABLE PK 
                            }
                        }
					}
						/*-------------------------------------------------------------------------------*/
					/*else if(idGridItem.GetGridData( ctrl.row, 8 )=="BENEFICIARY BANK")
					{
					    
					    var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + "" + "&val1=" + ls_ccy + "&company="+ lstCompany.GetData() + '&dsqlid=sp_sel_BFBENEFICIARY_popup&col_code=' + ' Beneficiary Bank '  + '&col_nm=' + 'Account No';
                        var object  =   System.OpenModal(  fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                        if (object != null)
                        {
                            if (object[0] != 0)
                            {
                                idGridItem.SetGridText(ctrl.row,  9, object[1]);//BANK ID
                                idGridItem.SetGridText(ctrl.row, 10, object[0]);//BANK NAME(PARTNER NAME)
                                idGridItem.SetGridText(ctrl.row, 11, "TAC_BFBENEFICIARY");// TABLE NAME 
                                idGridItem.SetGridText(ctrl.row, 12, object[2]);// TABLE PK 
                            }
                        }
					}*/
					/*-------------------------------------------------------------------------------*/
					else
					{
						
						if (idGridItem.GetGridData( ctrl.row, 8 )== "EMPLOYEE NAME")
						{
							//var fpath   = System.RootURL + "/standard/forms/60/05/60050010_popup_3.aspx";
							var fpath   = System.RootURL + "/standard/forms/gf/ma/gfma00010_3.aspx";
                            var object  = System.OpenModal(  fpath , 800 , 500 , 'resizable:yes;status:yes'); 
                            if ( object != null )  
                            {
                                if (object[0] != 0)
                                {
                                    idGridItem.SetGridText(ctrl.row, 9, object[1]) ; //Employee ID
                                    idGridItem.SetGridText(ctrl.row,  10, object[2]) ; //Employee Name    
                                    idGridItem.SetGridText(ctrl.row, 11, "TAC_EMPLOYEE_ADV") ; //TABLE NAME
                                    idGridItem.SetGridText(ctrl.row, 12, object[0]) ; //TABLE PK
                                }
                            }
						}	
						else if ( idGridItem.GetGridData( ctrl.row, 8 )== "DEPARTMENT" || idGridItem.GetGridData( ctrl.row, 8 )== "DEPARTMENT NAME" )
						{
							flg = "-3";
//							var path = System.RootURL + '/standard/forms/acnt/fc/wafc001000.asp?dsql=' + escape(sqlsen) + '&dsqlid=' + 'dsql_slipitemcodesql' + '&title=' + 'Item Code List' + '&col_code=' + 'Item Code'  + '&col_nm=' + 'Item Name';
//							o = System.OpenModal( path ,700 , 500 , 'resizable:yes;status:yes');
						}	
						else if ( idGridItem.GetGridData( ctrl.row, 8 )== "CONTRACT NO")
						{
							flg = "-4";
//							var path = System.RootURL + '/standard/forms/acnt/fc/wafc019000_subcontract.asp?dsql=' + escape(sqlsen) + '&dsqlid=' + 'dsql_slipitemcodesql' + '&title=' + 'Item Code List' + '&col_code=' + 'Item Code'  + '&col_nm=' + 'Item Name';
//							o = System.OpenModal( path ,750 , 550 , 'resizable:yes;status:yes');
						}
					}
				}
			}
		}
	}
}

function OnSumCR()
{
    var ctrl = grdCredit.GetGridControl();
    var sum_cr_famt = 0; 
    var sum_cr_amt  = 0;
    for (i = 1; i < ctrl.rows; i++)
	{
	     sum_cr_famt = sum_cr_famt + Number(grdCredit.GetGridData(i, 8)) + Number(grdCredit.GetGridData(i, 13));
	     sum_cr_amt  = sum_cr_amt  + Number(grdCredit.GetGridData(i, 9)) + Number(grdCredit.GetGridData(i, 14));
	}
	txtsum_total_cr_famt.text = "" + System.Round(sum_cr_famt,2);
	txtsum_total_cr_amt.text = "" + System.Round(sum_cr_amt,2);
}

function OnSumDR()
{
    var sum_dr_famt = 0;
    var sum_dr_amt  = 0;
    for (i = 1; i < grdDebit.rows; i++)
	{
	     sum_dr_famt = Number(sum_dr_famt) + Number(grdDebit.GetGridData(i, 8))+ Number(grdDebit.GetGridData(i, 13));
	     sum_dr_amt  = Number(sum_dr_amt)  + Number(grdDebit.GetGridData(i, 9))+ Number(grdDebit.GetGridData(i, 14));
	}
	
	txtsum_total_dr_famt.text = "" + System.Round(sum_dr_famt,2);
	txtsum_total_dr_amt.text = "" + System.Round(sum_dr_amt,2);
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
			sum_dr_famt = Number(sum_dr_famt) + Number(grdDebit.GetGridData(i, 8)) + Number(grdDebit.GetGridData(i, 13));
			sum_dr_amt  = Number(sum_dr_amt)  + Number(grdDebit.GetGridData(i, 9)) + Number(grdDebit.GetGridData(i, 14));
		}
	}
	txtsum_chk_dr_famt.SetDataText(''   + sum_dr_famt);
	txtsum_chk_dr_amt.SetDataText(''    + sum_dr_amt);
	OnSumDR();
	OnSumCR();
	txtsum_diff_famt.SetDataText('' + (Number(txtsum_total_dr_famt.text)-Number(txtsum_total_cr_famt.text)));
	txtsum_diff_amt.SetDataText('' + (Number(txtsum_total_dr_amt.text)-Number(txtsum_total_cr_amt.text)));
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
			sum_cr_famt = Number(sum_cr_famt) + Number(grdCredit.GetGridData(i, 8)) + Number(grdCredit.GetGridData(i, 13));
			sum_cr_amt  = Number(sum_cr_amt)  + Number(grdCredit.GetGridData(i, 9)) + Number(grdCredit.GetGridData(i, 14));
		}
	}
	txtsum_chk_cr_famt.SetDataText('' + sum_cr_famt);
	txtsum_chk_cr_amt.SetDataText(''  + sum_cr_amt);
	OnSumDR();
	OnSumCR();
	txtsum_diff_famt.SetDataText('' + (Number(txtsum_total_dr_famt.text)-Number(txtsum_total_cr_famt.text)));
	txtsum_diff_amt.SetDataText('' + (Number(txtsum_total_dr_amt.text)-Number(txtsum_total_cr_amt.text)));
}

function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise,    
}

function RowEditDR(){
    var dr_famt = 0;
    var dr_rate = 0;
    var book_rate = 1;
    _book_rate = grdDebit.GetGridData(event.row, 20);
    if (event.col == 6 ||  event.col == 7 || event.col == 8 || event.col == 10 || event.col == 20 || event.col == 22 || event.col == 23){
        txtcur.text = grdDebit.GetGridData(event.row, 6);
        
        dr_famt = Number(grdDebit.GetGridData(event.row, 8));
        book_rate = GetBookExRate(txtcur.text);
        if(event.col == 6){
        grdDebit.SetGridText(event.row, 7, book_rate);}
        dr_rate = Number(grdDebit.GetGridData(event.row, 7));  
        if(_book_col_format.indexOf(".")>0){
            grdDebit.SetGridText(event.row, 9, (Number(dr_famt*(dr_rate/_book_rate))));
            var book_amt = Number(dr_famt*(dr_rate/_book_rate));
            book_amt = System.Round(book_amt,2);
            grdDebit.SetGridText(event.row, 9, book_amt);
        }
        else{
            grdDebit.SetGridText(event.row, 9, Math.round(Number(dr_famt*(dr_rate/_book_rate))));
        }
        
        dr_famt     = Number(grdDebit.GetGridData(event.row, 8));
        dr_amt      = Number(grdDebit.GetGridData(event.row, 9));
        
        dr_ratevat  = grdDebit.GetGridData(event.row, 10);
        
        dr_vatfamt  = 0;
        dr_vatamt   = 0;
        if (dr_ratevat != 'NO' && dr_ratevat != '01'){
            if(_book_col_format.indexOf(".")>0){
                dr_vatfamt  = System.Round((Number(dr_famt*dr_ratevat/100)*100)/100,2);
                dr_vatamt   = System.Round((Number(dr_amt*dr_ratevat/100)*100)/100,2);
            }
            else{
                if(txtcur.text!='VND')
				{
					dr_vatfamt  = System.Round(Number(dr_famt*dr_ratevat/100),2);
				}
				else
				{
					dr_vatfamt  = Math.round((Number(dr_famt*dr_ratevat/100)*100)/100);
				}
                dr_vatamt   = Math.round((Number(dr_amt*dr_ratevat/100)*100)/100);
            }
            txt_rate.SetDataText(dr_ratevat);
        }
        else{
            txt_rate.SetDataText('');
        }
        
        grdDebit.SetGridText(event.row, 11, dr_vatfamt);
        grdDebit.SetGridText(event.row, 12, dr_vatamt);
        grdDebit.SetGridText(event.row, 13, dr_vatfamt);
        grdDebit.SetGridText(event.row, 14, dr_vatamt);
        
        grdDebit.SetGridText(event.row, 22, Number(dr_famt+dr_vatfamt));
        grdDebit.SetGridText(event.row, 23, Number(dr_amt+dr_vatamt));
        
        dso_upd_ctl_item.Call("SELECT");
    }
    
    if (event.col == 13){
        dr_vatfamt     = Number(grdDebit.GetGridData(event.row, 13));
        grdDebit.SetGridText(event.row, 14, dr_vatfamt);
    }
    OnSumDR();
}

function RowEditCR(){
    var cr_famt = 0;
    var cr_rate = 0;
    var book_rate = 1;   
     _book_rate = grdCredit.GetGridData(event.row, 20);
    if (event.col == 6 ||  event.col == 7 || event.col == 8 || event.col == 10 || event.col == 20 || event.col == 22 || event.col == 23){
        txtcur.text = grdCredit.GetGridData(event.row, 6);
        
        cr_famt = Number(grdCredit.GetGridData(event.row, 8));
        
        book_rate = GetBookExRate(txtcur.text);
        if(event.col == 6){
        grdCredit.SetGridText(event.row, 7, book_rate);}
        cr_rate = Number(grdCredit.GetGridData(event.row, 7));
        if(_book_col_format.indexOf(".")>0){
            var book_amt = Number(cr_famt*(cr_rate/_book_rate));
            book_amt = System.Round(book_amt,2);
            grdCredit.SetGridText(event.row, 9, book_amt);
        }
        else{
            grdCredit.SetGridText(event.row, 9, Math.round(Number(cr_famt*(cr_rate/_book_rate))));
        }
     
        cr_famt     = Number(grdCredit.GetGridData(event.row, 8));
        cr_amt      = Number(grdCredit.GetGridData(event.row, 9));
         
        cr_ratevat  = grdCredit.GetGridData(event.row, 10);
        cr_vatfamt  = 0;
        cr_vatamt   = 0;
        if (cr_ratevat != 'NO' && cr_ratevat != '01'){
             if(_book_col_format.indexOf(".") > 0){
                cr_vatfamt = Number(cr_famt*cr_ratevat/100);
                cr_vatfamt  = System.Round(cr_vatfamt,2);
                cr_vatamt   = System.Round(Number(cr_amt*cr_ratevat/100),2);
             }
             else{
                cr_vatfamt = Number(cr_famt*cr_ratevat/100);
                cr_vatfamt  = Math.round(cr_vatfamt);
                cr_vatamt   = Math.round(Number(cr_amt*cr_ratevat/100));
             }
                txt_rate.SetDataText(cr_ratevat);
        }
        else{
            txt_rate.SetDataText('');
        }
        grdCredit.SetGridText(event.row, 11, cr_vatfamt);
        grdCredit.SetGridText(event.row, 12, cr_vatamt);
        grdCredit.SetGridText(event.row, 13, cr_vatfamt);
        grdCredit.SetGridText(event.row, 14, cr_vatamt);
        
        grdCredit.SetGridText(event.row, 22, Number(cr_famt+cr_vatfamt));
        grdCredit.SetGridText(event.row, 23, Number(cr_amt+cr_vatamt));

        
        dso_upd_ctl_item.Call("SELECT");
    }
    else if (event.col == 13){
        cr_vatfamt     = Number(grdCredit.GetGridData(event.row, 13));
        grdCredit.SetGridText(event.row, 14, cr_vatfamt);
    }
    OnSumCR();
}
function RowChange(p_data)
{
    txtcur.text     = '';
    txt_row.text    = '';
    if (p_data == 'DR')
    {
        txtcur.text = grdDebit.GetGridData(event.row, 6);
        txt_row.text = event.row;
        dso_get_rate_dr.Call();
    }
    else if (p_data == 'CR')
    {
        txtcur.text = grdCredit.GetGridData(event.row, 6);
        txt_row.text = event.row;
        dso_get_rate_cr.Call();
    }
}

function SetCurrent(p_data)
{
    var rate = 0;
    if (p_data == 'DR')
    {
        rate = txtrate.GetData();
        grdDebit.SetGridText(txt_row.text, 7, rate);
        var dr_famt = Number(grdDebit.GetGridData(txt_row.text, 8));
        grdDebit.SetGridText(txt_row.text, 9, Math.round(Number(dr_famt*rate)));
        OnSumDR();
    }
    else if (p_data == 'CR')
    {
        rate = txtrate.GetData();
        grdCredit.SetGridText(txt_row.text, 7, rate);
        var dr_famt = Number(grdCredit.GetGridData(txt_row.text, 8));
        grdCredit.SetGridText(txt_row.text, 9, Math.round(Number(dr_famt*rate)));
        OnSumCR();
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
        if(itemal == "SERIAL NUMBER" || itemal == "SERIAL NO" || itemal == "SERI NO")
        {
            item_value = item_value.toUpperCase();
            idGridItem.SetGridText( i , 9, item_value);
        }
    }
}

function OnChangeList()
{
    dso_get_rate_arap.Call();
}

function OnConfirmCancel()
{
    var path = System.RootURL + '/standard/forms/60/05/60050010_popup_causecancel.aspx?com_pk='+ lstCompany.GetData() + '&seq=' + txtseq1.GetData() + '&status=' + txtStatus.GetData() + '&userid=' + txtProposedByUserID.GetData() + '&usernm=' + txtProposedByUserName.GetData() + '&userpk=' + txtProposedByUserPk.GetData() + '&dsqlid=ac_PRO_60050010_popup_cancel' + '&table=TAC_BPRVPV';
    var object = System.OpenModal( path,  400 , 400,'resizable:yes;status:yes');
    if ( object != null )
    {
        if (object[0] !=0)
        {
            txtseq1.text = object[0];
            CheckKeySeq();
        }
    }
}

function OnReportAcct()
{
	if(txtseq.text!="")
	{
		var url =System.RootURL + '/standard/reports/60/06/60060010_envn.aspx?seq=' + txtseq.GetData();
		if(confirm("Are you sure you want to report ?" ))
		{
			System.OpenTargetPage( url , 'newform' );
			return;
		}
	}
	else
	{
		alert("This voucher hasn't confirmed yet!");
		return;
	}
}
function OnReport()
{
	if(txtseq.text!='')
	{
		if(lstReportLocation.value=='1030_v2')
		{
			if(txtPrint_Format.value=='A4')
			{
				rqt = "?company_pk=" + lstCompany.GetData() + '&seq='+txtseq.GetData() + '&pv_pk=' + txtseq1.GetData()+'&circulars='+lstCirculars.value+'&print_amount='+lst_Print_Amount.value;
				url = System.RootURL + '/standard/reports/gf/br/gfbr00030_PaymentVoucher_General_pdf.aspx'+rqt; 
			}
			else
			{
				rqt = "?company_pk=" + lstCompany.GetData() + '&seq='+txtseq.GetData() + '&pv_pk=' + txtseq1.GetData()+'&circulars='+lstCirculars.value+'&print_amount='+lst_Print_Amount.value;
				url = System.RootURL + '/standard/reports/gf/br/gfbr00030_PaymentVoucher_General_pdf_A5.aspx'+rqt; 
			}
		}
		else if(lstReportLocation.value=='1000_v2')
		{
			rqt = "?company_pk=" + lstCompany.GetData() + '&seq=' + txtseq.GetData()+'&pv_pk=' + txtseq1.GetData();
			url =System.RootURL + '/standard/reports/gf/br/gfbr00030_Payment_Expenditure_Cash_Adv.aspx' + rqt; 
		}
		else if(lstReportLocation.value=='1010_v2')
		{
			rqt = "?company_pk=" + lstCompany.GetData() + '&seq=' + txtseq.GetData()+'&pv_pk=' + txtseq1.GetData();
			url =System.RootURL + '/standard/reports/gf/br/gfbr00030_Payment_Expenditure_Cash.aspx' + rqt; 
		}
		System.OpenTargetPage( url , 'newform' );
	}
}
/*
function OnReportRV()
{
    if (lstVoucherTypePrint.GetData()=="2")//Payment voucher - Phieu Chi
	{
		rqt = "?company_pk="+lstCompany.GetData()+'&seq='+txtseq.GetData()+'&pv_pk='+txtseq1.GetData();
		//url =System.RootURL + '/standard/reports/gf/br/gfbr00030_PaymentVoucher.aspx'+rqt; 
		
		if(txtseq.text!="")
		{
		        switch (lstReportLocation.value)
		        {
		            case "160"://ACCOUNTING
		                //url =System.RootURL + '/standard/reports/gf/br/gfbr00030_PaymentVoucher_General_pdf.aspx'+rqt; 
		                url =System.RootURL + '/standard/reports/gf/br/gfbr00030_PaymentVoucher_General.aspx'+rqt; 
		                break;
		            case "170"://OTHER
		                url =System.RootURL + '/standard/reports/gf/br/gfbr00030_PaymentVoucher_Other.aspx'+rqt; 
		                break;
		            case "180"://FACOTRY
		                url =System.RootURL + '/standard/reports/gf/br/gfbr00030_PaymentVoucher_Fact.aspx'+rqt; 
		                break;  
		              case "200":
		           //alert(txtseq.text);
		           //alert(txtseq1.text);
		              var  url =System.RootURL + '/standard/reports/gf/br/gfbr00030_Payment_Order.aspx?seq='+txtseq.text ;		
		                
		               break;   
		              /*case "50":
		                        var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=gf/br/rpt_gfbr00030_other.rpt&procedure=RPT_SEL_GFHG00010_PV|RPT_SEL_GFHG00010_PV1&parameter="+txtseq.text+"|"+txtseq.text;   
                       
		              break;   
		              case "40":
		                        var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=gf/br/rpt_gfbr00030_PaymentVoucher.rpt&procedure=RPT_SEL_GFHG00010_PV|RPT_SEL_GFHG00010_PV1&parameter="+txtseq.text+"|"+txtseq.text;   
                       
		              break;   
		              case "60":
		                        var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=gf/br/rpt_gfbr00030_other.rpt&procedure=RPT_SEL_GFHG00010_PV|RPT_SEL_GFHG00010_PV1&parameter="+txtseq.text+"|"+txtseq.text;   
                        
		              break;   
		              case "80":
		                        var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=gf/br/rpt_gfbr00030_Payment_Order.rpt&procedure=RPT_SEL_GFBR00030|RPT_SEL_GFBR00030_1&parameter="+txtseq.text+"|"+txtseq.text;   
                        
		              break;   
		        }
		}
		else
		{
            alert("This voucher hasn't confirmed yet!!");		
		}
//		if(confirm("Are you sure you want to report ?" ))
//		{
			System.OpenTargetPage( url , 'newform' );
//			return;
//		}
	}
	if (lstVoucherTypePrint.GetData()=="1")//Receipt Voucher- Phieu Thu
	{
		rqt = "?company_pk="+lstCompany.GetData()+'&seq='+txtseq.GetData()+'&pv_pk='+txtseq1.GetData();
		//url =System.RootURL + '/standard/reports/gf/br/gfbr00030_ReceiptVoucher.aspx'+rqt; 
		url =System.RootURL + '/standard/reports/gf/br/gfbr00030_ReceiptVoucher_General.aspx'+rqt; 
		if(confirm("Are you sure you want to report ?" ))
		{
			System.OpenTargetPage( url , 'newform' );
			return;
		}
	}
}
*/
function onViewTAccount()
{
    if (txtseq.text !='')
    {
        var pk      = txtseq.text;
		var status  = txtStatus.text;
		
		var fpath   = System.RootURL + '/standard/forms/60/05/60050010_popup_1.aspx?PK_ROW=' + pk + '&APPRCANCEL=' + status;
		var wWidth  = 950;
		var wHeight = 565;
		var x = Math.round((screen.availWidth - wWidth)/2);
		var y = Math.round((screen.availHeight - wHeight)/2);
			
		var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
		   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
		   "lef="+ x +",top=" + y;
		
		var object = System.OpenModal(fpath, wWidth, wHeight, features);
    }
}

function OnCopy()
{
    dso_upd_copy.Call();
}
function CheckKey() 
{
	 var c = String.fromCharCode (event.keyCode); 
	 var x = c.toUpperCase().charCodeAt(0) ; 
	 event.keyCode = x; 
}
function SetColumnFormat(p_format){
    var fg = grdDebit.GetGridControl();
    fg.ColFormat(7) = "###,###.##R"; 
	fg.ColFormat(8) = "###,###.##R";
	fg.ColFormat(20) = "###,###R"; 
	
	if(p_format != ""){
	    fg.ColFormat(9) = p_format;
	    _book_col_format = p_format;
	} 
	else{
	    fg.ColFormat(9) = "###,###R"; 
	}
	
	fg=grdCredit.GetGridControl();
    fg.ColFormat(7) = "###,###.##R"; 
	fg.ColFormat(8) = "###,###.##R"; 
	fg.ColFormat(20) = "###,###R"; 
	if(p_format != ""){
	    fg.ColFormat(9) = p_format; 
	    _book_col_format = p_format;
	} 
	else{
	    fg.ColFormat(9) = "###,###R"; 
	}
}
function SetUserInfo(){
    txtProposedByUserPk.text = _user_pk;
    txtProposedByUserID.text = _user_id;
    txtProposedByUserName.text = _user_name;
    lstDepartment.value = _dept_pk;
}
function GetBookExRate(p_ccy){
    lstBookExRate.value = p_ccy;
    var sTemp = lstBookExRate.GetText();
    
    if(sTemp == ""){
        alert("Please input exchange rate for this "+ p_ccy +" currency at date:"+ dtDate.GetData() +".");
        return;
    }
    
    var aTemp = sTemp.split("-");   
    var book_rate =  aTemp[1];
    
    return book_rate;
}
//--------------------------------------------------------------------------------
function onEmpPopUp()
{
	 
	var path = System.RootURL + '/standard/forms/60/05/60050010_popup_2.aspx';
	var obj = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');

	if ( obj != null )
	{
		txtpay_person.text    = obj[2];
		txtpay_person_pk.text  = obj[0];
				   
	}
   
	
}

function OnTransactionPopUp()
{
    if (txtStatus.GetData() != '')
    {
        alert('You canot change Transaction Type!!!'+'\n'+'Bạn không thể thay đổi loại giao dịch');
        return;
    }
    txttransaction_code.text = "";
    txttransaction_name.text = "";
    txtDescription.text      = "";
    txtLocalDescription.text = "";
    txtDescription_Korea.text = "";
    
    grdDebit.ClearData();
    grdCredit.ClearData();
    var path = System.RootURL + '/standard/forms/60/05/60050010_Transaction.aspx?compk='+ lstCompany.GetData();
    aValue = System.OpenModal( path ,850 , 500 ,  'resizable:yes;status:yes');
    if ( aValue != null )
	{
		var tmp = aValue[0];
		if (tmp[1] != null)
		{
		    txttrans_pk.text         = tmp[0];
		    txttransaction_code.text = tmp[1];
		    txttransaction_name.text = tmp[2];
		    txtDescription.text      = tmp[3];
            txtLocalDescription.text = tmp[4];
		}
		if(aValue.length < 2)
		{
		    txt_DRCR.SetDataText('D');
			dso_sel_trans_debit.Call('SELECT');
		}
		else if (aValue.length > 1)
		{		
			for(i=1;i<aValue.length;i++)
			{
			    var tmp1= aValue[i];
			    if (tmp1[0] == "D")
				{
					grdDebit.AddRow();
					grdDebit.SetGridText( grdDebit.rows - 1,  3, '1' );
					grdDebit.SetGridText( grdDebit.rows - 1, 1, tmp1[2] ); //ACPK
					grdDebit.SetGridText( grdDebit.rows - 1, 4, tmp1[5] ); //Account Code
					grdDebit.SetGridText( grdDebit.rows - 1, 5, tmp1[6] ); //Account Name
					grdDebit.SetGridText( grdDebit.rows - 1, 15, txtDescription.text);         //Desc Eng
					grdDebit.SetGridText( grdDebit.rows - 1, 16, txtLocalDescription.text);    //Desc Local
                    grdDebit.SetGridText( grdDebit.rows - 1, 21, txtDescription_Korea.text);
					grdDebit.SetGridText( grdDebit.rows - 1, 17, txtseq.text);
					//grdDebit.SetRowEditable(grdDebit.rows - 1, false);
                    grdDebit.SetGridText( grdDebit.rows - 1, 6, tmp1[7]);
                    grdDebit.SetGridText( grdDebit.rows - 1, 7, GetBookExRate(tmp1[7]));
					grdDebit.SetGridText( grdDebit.rows - 1, 20, GetBookExRate(_Book_CCY));
					
				}
				else if (tmp1[0] == "C")
				{
					grdCredit.AddRow();
					grdCredit.SetGridText( grdCredit.rows - 1,  3, '1' );
					grdCredit.SetGridText( grdCredit.rows - 1, 1, tmp1[2] ); //ACPK
					grdCredit.SetGridText( grdCredit.rows - 1, 4, tmp1[5] ); //Account Code
					grdCredit.SetGridText( grdCredit.rows - 1, 5, tmp1[6] ); //Account Name
					grdCredit.SetGridText( grdCredit.rows - 1, 15, txtDescription.text );       //Desc Eng
					grdCredit.SetGridText( grdCredit.rows - 1, 16, txtLocalDescription.text );  //Desc Local
                    grdCredit.SetGridText( grdCredit.rows - 1, 21, txtDescription_Korea.text );
					grdCredit.SetGridText( grdCredit.rows - 1, 17, txtseq.text);
					//grdCredit.SetRowEditable(grdCredit.rows - 1, false);
                    grdCredit.SetGridText( grdCredit.rows - 1, 6, tmp1[7]);
                    grdCredit.SetGridText( grdCredit.rows - 1, 7, GetBookExRate(tmp1[7]));
					grdCredit.SetGridText( grdCredit.rows - 1, 20, GetBookExRate(_Book_CCY));
				}
			}
		}
	}
}

function OnEnterTrans_Code()
{
    if (txtStatus.GetData() != '')
    {
        alert('You canot change Transaction Type!!!'+'\n'+'Bạn không thể thay đổi loại giao dịch');
        txttransaction_code.text = txttrans_code_tmp.GetData();
        return;
    }
    txttransaction_name.SetDataText('');
    txt_DRCR.SetDataText('D');
    dso_sel_trans_debit.Call('SELECT');
}

function OnCloseData()
{
    for (i = 1; i < grdDebit.rows; i++)
    {
        grdDebit.SetGridText( i, 18, i);
        grdDebit.SetRowEditable(i, false);
    }
    for (i = 1; i < grdCredit.rows; i++)
    {
        grdCredit.SetGridText( i, 18, i);
        grdCredit.SetRowEditable(i, false);
    }
}

function OnSetDescriptionDetail()
{
    for (i = 1; i < grdDebit.rows; i++)
    {
        grdDebit.SetGridText( i, 15, txtDescription.GetData());
        grdDebit.SetGridText( i, 16, txtLocalDescription.GetData());
        grdDebit.SetGridText( i, 21, txtDescription_Korea.GetData());
        grdDebit.SetGridText( i, 20, GetBookExRate(_Book_CCY));
    }
    for (i = 1; i < grdCredit.rows; i++)
    {
        grdCredit.SetGridText( i, 15, txtDescription.GetData());
        grdCredit.SetGridText( i, 16, txtLocalDescription.GetData());
        grdCredit.SetGridText( i, 21, txtDescription_Korea.GetData());
        grdCredit.SetGridText( i, 20, GetBookExRate(_Book_CCY));
    }
}

function OnChange_ControlItem()
{
    if (txt_drcr_type.GetData() == 'D') 
    {
        grdDebit.SelectRow(txt_rowclick.text);
        for(i=0;i<idGridItem.rows;i++)
        {
			if(grdDebit.GetGridData(grdDebit.row,G_D_VAT_PER)!='NO' && grdDebit.GetGridData(grdDebit.row,G_D_VAT_PER)!='01')
			{
				if(idGridItem.GetGridData(i,8)=='NET AMOUNT')
				{
					idGridItem.SetGridText(i,9,grdDebit.GetGridData(grdDebit.row,G_D_AMT_BK));
				}
            }
		}
    }
    /*else
    {
        grdCredit.SelectRow(txt_rowclick.text);
		for(i=0;i<idGridItem.rows;i++)
        {
			if(grdCredit.GetGridData(grdCredit.row,G_C_VAT_PER)!='NO' && grdCredit.GetGridData(grdCredit.row,G_C_VAT_PER)!='01')
			{
				if(idGridItem.GetGridData(i,8)=='NET AMOUNT')
				{
					idGridItem.SetGridText(i,9,grdCredit.GetGridData(grdCredit.row,G_D_AMT_BK));
				}
            }
		}
    }*/
}
//--------------------------------------------------------------------------------
function OnShowHide_Col(obj)
{
    switch(obj)
    {
        case 'Dr':
            if(chkShowHide.value=='F')
            {
                grdDebit.GetGridControl().ColHidden(22) = true;
                grdDebit.GetGridControl().ColHidden(23) = true;
            }
            else
            {
                grdDebit.GetGridControl().ColHidden(22) = false;
                grdDebit.GetGridControl().ColHidden(23) = false;
            }
        break;
        case 'Cr':
            if(chkShowHide_Cr.value=='F')
            {
                grdCredit.GetGridControl().ColHidden(22) = true;
                grdCredit.GetGridControl().ColHidden(23) = true;
            }
            else
            {
                grdCredit.GetGridControl().ColHidden(22) = false;
                grdCredit.GetGridControl().ColHidden(23) = false;
            }
        break;
    }
}

function OnCopyRow_Dr()
{
	dso_copy_dr.Call();
}

function OnCopyRow_Cr()
{
	dso_copy_cr.Call();
}

function Color_Save(obj)
{
	switch(obj)
	{
		case 'Dr':
			for(i=1;i<grdDebit.rows;i++)
			{
				if(grdDebit.GetGridData(i,0)=='')
				{
					grdDebit.SetCellBgColor(i, 0, i, 23, 0x58FAF4);
				}
			}
		break;
		case 'Cr':
			for(i=1;i<grdCredit.rows;i++)
			{
				if(grdCredit.GetGridData(i,0)=='')
				{
					grdCredit.SetCellBgColor(i, 0, i, 23, 0x58FAF4);
				}
			}
		break;
	}
}
</script>

<body style="margin: 0; padding: 0;">
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_company" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_sel_ctl_mst_pay_pvp" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" function="AC_SEL_60050010_PAY_HGTRH">
            <inout> 
                <inout bind="txtseq"/>
                <inout bind="lstCompany"/>
                <inout bind="chkauto_YN"/>
                <inout bind="lstVoucherType"/>
                <inout bind="txtvoucher_auto"/>
                <inout bind="txtvoucher_no"/>
                <inout bind="dtDate"/>
                <inout bind="lstDepartment"/>
                <inout bind="txtProposedByUserPk"/>
                <inout bind="txtProposedByUserID"/>
                <inout bind="txtProposedByUserName"/>
                <inout bind="lstPayment"/>
                <inout bind="txtpay_person"/>
                <inout bind="txtcustpk"/>
                <inout bind="txtcustid"/>
                <inout bind="txtcustnm"/>
                <inout bind="txtEnclose"/>
                <inout bind="txtDescription"/>
                <inout bind="txtLocalDescription"/>
                <inout bind="txtStatus"/>
                <inout bind="txttax_acc"/>
                <inout bind="txtseq1"/>
                <inout bind="txttrans_pk"/>
                <inout bind="txttransaction_code"/>
                <inout bind="txttransaction_name"/>
                <inout bind="txtDescription_Korea"/>
            </inout>
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_udp_ctl_mst_pay_pvp" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,21,22,23,24,25" function="AC_SEL_60050010_PAY_VOUCHER" procedure="AC_UPD_60050010_PAY_VOUCHER">
            <inout> 
                <inout bind="txtseq1"/>
                <inout bind="lstCompany"/>
                <inout bind="chkauto_YN"/>
                <inout bind="lstVoucherType"/>
                <inout bind="txtvoucher_auto"/>
                <inout bind="txtvoucher_no"/>
                <inout bind="dtDate"/>
                <inout bind="lstDepartment"/>
                <inout bind="txtProposedByUserPk"/>
                <inout bind="txtProposedByUserID"/>
                <inout bind="txtProposedByUserName"/>
                <inout bind="lstPayment"/>
                <inout bind="txtpay_person"/>
                <inout bind="txtcustpk"/>
                <inout bind="txtcustid"/>
                <inout bind="txtcustnm"/>
                <inout bind="txtEnclose"/>
                <inout bind="txtDescription"/>
                <inout bind="txtLocalDescription"/>
                <inout bind="txtStatus"/>
                <inout bind="txttax_acc"/>
				<inout bind="txtpay_person_pk"/>
                <inout bind="txttrans_pk"/>
                <inout bind="txttransaction_code"/>
                <inout bind="txttransaction_name"/>
                <inout bind="txtDescription_Korea"/>
            </inout>
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_upd_grd_dtl_payment_dr" onreceive="OnDataReceive(this)">
        <xml>
            <dso id="1" type="grid" parameter="0,1,3,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23" function="ac_SEL_60050010_GRD_DTL_PAY" procedure="AC_UPD_60050010_PAY_DTL">
                <input bind="grdDebit">
                    <input bind="txtseq1"/>
                    <input bind="txt_drcr_type"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="grdDebit" />
            </dso>
        </xml>
    </gw:data>
    <gw:data id="dso_upd_grd_dtl_payment_cr" onreceive="OnDataReceive(this)">
        <xml>
            <dso id="2" type="grid" parameter="0,1,3,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23" function="ac_SEL_60050010_GRD_DTL_PAY" procedure="AC_UPD_60050010_PAY_DTL">
                <input bind="grdCredit">
                    <input bind="txtseq1"/>
                    <input bind="txt_drcr_type"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="grdCredit"/>
            </dso>
        </xml>
    </gw:data>
    <gw:data id="dso_upd_ctl_item" onreceive="ItemStyle()">
        <xml>
            <dso type="grid" parameter="0,1,2,9,10,11,12" function="ac_sel_60050010_ctl_item_paymt" procedure="ac_upd_60050010_item_ctl_paymt">
                <input bind="idGridItem">
                    <input bind="lstCompany"/>
                    <input bind="txtbprvpvd"/>
                    <input bind="txtacpk"/>
                    <input bind="txt_drcr_type"/>
                    <input bind="txttax_acc"/>
                    <input bind="txt_rate"/>
                </input> 
                <output bind="idGridItem"/>
            </dso>
        </xml>
    </gw:data>
    <gw:data id="dso_get_rate_arap">
        <xml> 
            <dso type="process" procedure="AC_PRO_60050010_GETRATE_ACC">
                <input> 
                     <input bind="lstVoucherType"/>
                </input>
                <output>
                     <output bind="txttax_acc"/>
               </output> 
            </dso> 
        </xml>
    </gw:data>
    <gw:data id="dso_upd_confirm" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="AC_PRO_60050010_CFM_TAC_BPRVPV" > 
                <input> 
                     <input bind="txtseq1"/>
                     <input bind="lstCompany"/>
                </input>  
                <output>  
                     <output bind="txtStatus"/>
                     <output bind="txtseq"/>
                     <output bind="txtvoucher_auto"/>
                     <output bind="txtvoucher_no"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_upd_replicate" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="AC_pro_60050010_PAY_REGENERATE"> 
                <input> 
                     <input bind="txtseq1"/>
                     <input bind="lstCompany"/>
                </input>
                <output>
                     <output bind="txtseq1"/>
                     <output bind="txtStatus"/>
               </output> 
            </dso> 
        </xml>
    </gw:data>
    <gw:data id="dso_upd_copy" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="AC_PRO_60050010_PAY_REGEN_COPY"> 
                <input> 
                     <input bind="txtseq1"/>
                     <input bind="lstCompany"/>
                </input>
                <output>
                     <output bind="txtseq1"/>
                     <output bind="txtStatus"/>
               </output> 
            </dso> 
        </xml>
    </gw:data>
    <gw:data id="dso_get_exrate_list" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="list" procedure="AC_SEL_TAC_ABEXRATES_LIST"> 
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="dtDate" />
                </input>
                <output>
                     <output bind="lstBookExRate"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

      <gw:data id="dso_sel_trans_debit" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2,3" function="AC_SEL_60090010_ACCOUNT_DRCR">
                <input bind="grdDebit">
                    <input bind="txttransaction_code"/>
                    <input bind="txttransaction_name"/>
                    <input bind="txt_DRCR"/>
                    <input bind="lstCompany"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="grdDebit"/>
            </dso>
        </xml>
    </gw:data>

    <gw:data id="dso_sel_trans_credit" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2,3" function="AC_SEL_60090010_ACCOUNT_DRCR">
                <input bind="grdCredit">
                    <input bind="txttransaction_code"/>
                    <input bind="txttransaction_name"/>
                    <input bind="txt_DRCR"/>
                    <input bind="lstCompany"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="grdCredit"/>
            </dso>
        </xml>
    </gw:data>

    <gw:data id="dso_pro_get_transname" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="AC_PRO_GET_TRANS_NAME" > 
                <input> 
                     <input bind="txttransaction_code"/>
                     <input bind="lstCompany"/>
                </input>
                <output>
                     <output bind="txttransaction_name"/>
                     <output bind="txttrans_pk"/>
                     <output bind="txtDescription"/>
                     <output bind="txtLocalDescription"/>
                     <output bind="txtDescription_Korea"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

<gw:data id="dso_transtype_acntcode" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60060010_acntcode_RP">
                <input>
                     <input bind="txtGROUPID"/>
                     <input bind="txtFORMID"/>
                </input>  
                <output>
                     <output bind="txttrans_pk" />
					 <output bind="txttransaction_code" />
					 <output bind="txttransaction_name" />
				</output> 
            </dso> 
        </xml> 
    </gw:data>
	
	<gw:data id="dso_copy_dr" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="process" procedure="ac_sel_60050010_dtl_pay_copy">
                <input >
                    <input bind="txtbprvpvd"/>
                    <input bind="txt_drcr_type"/>
                    <input bind="txtLang"/>
                </input>
                <output>
                     <output bind="txtRtn_Copy" />
				</output> 
            </dso>
        </xml>
    </gw:data>
	
	<gw:data id="dso_copy_cr" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="process" procedure="ac_sel_60050010_dtl_pay_copy">
                <input >
                    <input bind="txtbprvpvd"/>
                    <input bind="txt_drcr_type"/>
                    <input bind="txtLang"/>
                </input>
                <output>
                     <output bind="txtRtn_Copy" />
				</output> 
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------------------------------------------->
    <table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
        <tr style='height:8%'>
            <td colspan='2'>
                <fieldset style='padding:0'>
                <table width="100%" border="0" cellspacing="1" cellpadding="0">
								<tr>
									
									<td width='100%' colspan='6' align='right'>
										<table width='100%' cellpadding='1' cellspacing='1'>
												<tr>
														<td width='100%'></td>
														<td style="width:"><gw:button id="ibtnNew" img="new" alt="New" onclick="onNew()" /></td>
														<td style="width:"><gw:button id="ibtnSave" img="save" alt="Save" onclick="onSave()" /></td>
														<td style="width:"><gw:button id="ibtnDelete" img="delete" alt="Delete" onclick="onDelete()" /></td>
														<td style="width:"><gw:button id="ibtnReport" img="excel" alt="Print Acct" onclick="OnReportAcct()" /></td>
														<td width=""><gw:button id="btnReportRV" img="excel" alt="Print Income Cash" onclick="OnReport()" /></td>
														
												</tr>
										</table>
									</td>
								</tr>
                                <tr>
                                                <td width="10%" align="right">Company&nbsp;</td>
                                                <td width="25%" ><gw:list id="lstCompany" value="" onchange="dso_get_exrate_list.Call();" /></td>
                                                <td width="10%" align="right">Voucher No&nbsp;</td>
                                                <td width='25%'>
                                                        <table width='100%' cellpadding='0' cellspacing='0'>
                                                                <tr>
                                                                        <td width="" align="left"><gw:checkbox id="chkauto_YN" value="T" onclick="OnAutoYN()" /></td>
                                                                        <td width="30%"><gw:list id="lstVoucherType" onchange="OnChangeList()" /></td>
                                                                        <td width="2%"></td>
                                                                        <td width="30%"><gw:textbox id="txtvoucher_auto" styles="width:100%"/></td>
                                                                        <td width="38%"><gw:textbox id="txtvoucher_no" onkeypress="CheckKey()" styles="width:100%"/></td>
                                                                </tr>
                                                        </table>
                                                </td>
												<td style="width:10%" align="right">Seq&nbsp;</td>
                                                <td width='20%'>
                                                        <table width='100%' cellpadding='0' cellspacing='0'>
                                                                <tr>
																	
																	<td style="width:100%"><gw:textbox id="txtseq" onenterkey="CheckKeySeq()" onkeypress="CheckNumeric()" /></td>
																	<td style="width:"><gw:button id="ibtnPopup" img="popup" alt="View T Account" onclick="onViewTAccount()" /></td>
																	<td style="width:"><gw:button id="ibtnSearch" img="search" alt="Search" onclick="onSearch()" /></td>
																</tr>
                                                        </table>
                                                </td>
                                                
                                </tr>
                                <tr>
                                                <td width="" align="right">Trans Date&nbsp;</td>
                                                <td>
                                                        <table width='100%' cellpadding='1' cellspacing='1'>
                                                                <tr>
                                                                        <td width=""><gw:datebox id="dtDate" lang="1" onchange="dateChange()" /></td>
                                                                        <td width="20%" align="right">Enclose&nbsp;</td>
                                                                         <td width="80%"><gw:textbox id="txtEnclose" /></td>
                                                                        
                                                                </tr>
                                                        </table>
                                                </td>
                                                <td width="" align="right">Proposed By&nbsp;</td>
                                                <td>
                                                        <table width='100%' cellpadding='0' cellspacing='0'>
                                                                <tr>
                                                                        <td width="30%"><gw:textbox id="txtProposedByUserID" /></td>
                                                                        <td width="70%"><gw:textbox id="txtProposedByUserName" /></td>
                                                                </tr>
                                                        </table>
                                                </td>
												<td></td>
                                                <td colspan=''>
                                                        <table width='100%' cellpadding='1' cellspacing='1'>
                                                                <tr>
                                                                        <td width=""><gw:button id="btnConfirm" img="confirm" text="Confirm" onclick="OnConfirm()" /></td>
                                                                        <td width=""><gw:button id="btnCancel" img="cancel" text="Cancel" onclick="OnConfirmCancel()" /></td>
                                                                        <td width=""><gw:button id="btnReplicate" img="Replicate" text="Replicate" onclick="OnReplicate()"  /></td>
                                                                        <td width=""><gw:button id="btnCopy" img="copy" text="Copy" onclick="OnCopy()"  /></td>
                                                                </tr>
                                                        </table>
                                                </td>
                                </tr>
                                <tr>
                                        <td width="" align="right">Department&nbsp;</td>
                                        <td width=""><gw:list id="lstDepartment" value="ALL" /></td>
                                        <td width="" align="right"><a onclick="onCustPopUp()" href="#" title="Get customer">Partner&nbsp;</a></td>
                                        <td>
                                                <table width='100%' cellpadding='0' cellspacing='0'>
                                                        <tr>
                                                            <td width="30%"><gw:textbox id="txtcustid" /></td>
                                                            <td width="70%"><gw:textbox id="txtcustnm" /></td>
                                                            <td width=""><gw:imgbtn id="btnResetCust" img="reset" alt="Reset" onclick="onCustReset()" /></td>
                                                        </tr>
                                                </table>
                                        </td>
										<td width="" align="right"><a title="Nhấp vào đây để hiển thị nhân viên" onclick="onEmpPopUp()" href="#tips" >Payment Person&nbsp;</a></td>
                                        <td >
                                                <table width='100%' cellpadding='0' cellspacing='0'>
                                                        <tr>
                                                                
                                                                <td width="35%"><gw:textbox id="txtpay_person" /></td>
                                                                <td width="25%" align="right">Ex.Rate (BK)&nbsp;</td>
                                                                <td width="10%"><gw:label id="lblBookRate" type="number" format="#,###,###,###,###.##R"/></td>
                                                        </tr>
                                                </table>
                                        </td>
                                </tr>
                                <tr>
                                        <td width="" align="right"><a onclick="OnTransactionPopUp()" href="#tips" title="Get Transaction">Trans Type&nbsp;</a></td>
                                        <td>
                                                <table width='100%' cellpadding='0' cellspacing='0'>
                                                        <tr>
                                                                <td width="30%"><gw:textbox id="txttransaction_code" styles="width:100%" onkeypress="Upcase()" onenterkey="OnEnterTrans_Code()" csstype="mandatory" /></td>
                                                                <td width="70%"><gw:textbox id="txttransaction_name" styles="width:100%" csstype="mandatory"/></td>
                                                                <td width="" style='display:none'><gw:textbox id="txttrans_pk" styles="width:100%" /></td>
                                                        </tr>
                                                </table>
                                        </td>
                                        <td width="" align="right">Description&nbsp;</td>
                                        <td width=""><gw:textbox id="txtDescription" csstype="mandatory" /></td>
										<td width="" align="right">L.Description&nbsp;</td>
										<td width="" colspan=''><gw:textbox id="txtLocalDescription" csstype="mandatory" /></td>
                                </tr>
                                <tr>
                                    <td width="" align="right">Kor Description&nbsp;</td>
									<td width=""><gw:textbox id="txtDescription_Korea" csstype="mandatory" /></td>
									<td width="" align="right">Report&nbsp;</td>
									<td width="" colspan=''><gw:list id="lstReportLocation" styles="width:100%"/></td>
									<td align='right' style='white-space:nowrap'>Circulars</td>
									<td width=""><gw:list id="lstCirculars" onchange="" styles='width:100%' /></td>
                                </tr>
                </table>
                </fieldset>
            </td>
        </tr>
        <tr style='height:92%'>
            <td width="60%" id="tdGrid">
                <table border="0" style="width:100%;height:100%" cellpadding="0" cellspacing="0" bordercolor="#00CCFF" style="border-collapse: collapse">
                    <tr style='height:2%'>
                            <td>
                                <fieldset style='padding:0'>
                                    <table width='100%' cellpadding='0' cellspacing='0'>
                                        <tr>
                                                <td width="5%" align="center"><a onclick="OnSumDR()" href="#tips">Debit&nbsp;</a></td>
                                                <td width="20%"><gw:textbox id="txtsum_chk_dr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" /></td>
                                                <td width="20%"><gw:textbox id="txtsum_chk_dr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##R" /></td>
                                                <td width="15%" align="center">Total</td>
                                                <td width="20%"><gw:textbox id="txtsum_total_dr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" /></td>
                                                <td width="20%"><gw:textbox id="txtsum_total_dr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##R" /></td>
                                                <td width="" align=""><gw:button id="btnCopyRow_Dr" img="copy" alt="Copy Row" onclick="OnCopyRow_Dr()" /></td>
												<td width="" align=""><gw:button id="btnNew_Dr" img="new" alt="New" onclick="OnNewDr()" /></td>
                                                <td width="" align=""><gw:button id="btnSave_Dr" img="save" alt="Save" onclick="OnSaveDr()" /></td>
                                                <td width="" align=""><gw:button id="btnDel_Dr" img="delete" alt="Delete" onclick="OnDelDr()" /></td>
                                                <td width="" align=""><gw:button id="btnUp_Dr" img="up" onclick="OnUpDr()"/></td>
                                                <td width="" align=""><gw:button id="btnDown_Dr" img="down" onclick="OnDownDr()"/></td>
                                                <td title='Show/Hide Toltal Amt'><gw:checkbox id="chkShowHide" value="F"  onclick="OnShowHide_Col('Dr')" /></td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </td>
                                    
                    </tr>
                    <tr style='height:48%'>
                        <!--0_Pk|1_Acc_pk|2|3|4.Acc.Code|5.Acc.Name|6.Ccy|7.Rate|Amount Trans|Amount Book|%VAT|VAT Trans|VAT Book|VAT Deduct Trans|VAT Deduct Book|Description|Local Description|_m_pk|_ODR|_DRCR|Book Rate"-->
                        <td width="100%" colspan=''>
                            <gw:grid id="grdDebit" 
                            header="_Pk|_Acc_pk|||Acc. Code|Acc. Name|Ccy|Ex. Rate|Amt (Trans)|Amt (Books)|%VAT|VAT Amt (TR)|VAT Amt (BK)|VAT Amt Deduct (TR)|VAT Amt Deduct (BK)|Description|Description (LC)|_m_pk|_ODR|_DRCR|Ex.Rate (Books)|Korea Description|Total Amt(Trans)|Total Amt(Book)"
                                format="0|0|3|0|0|0|0|0|0|2|0|1|1|1|1|0|0|0|0|0|2|0|1|1" 
                                aligns="0|0|1|1|1|0|1|1|3|3|1|3|3|3|3|0|0|0|0|0|0|0|0|0"
                                defaults="||||||VND||||||||||||||||" 
                               editcol="0|0|1|1|0|0|1|1|1|1|1|0|0|1|1|1|1|0|0|0|1|1|0|0" 
                                widths="0|0|250|300|1000|2000|700|1000|1800|1800|700|1800|1800|1800|1800|3000|2500|1000|1000|1000|1500|2000|2000|0"
                                styles="width:100%; height:100%" sorting="F" oncellclick="RowClick_DR()" oncelldblclick="DBPopupClick_DR()"
                                onafteredit="RowEditDR()" onselchange="RowClick_DR()" />
                        </td>
                    </tr>
                    <tr style='height:2%'>
                        <td width="100%">
                            <fieldset style='padding:0'>
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                        <td width="5%" align="center"><a onclick="OnSumCR()" href="#tips">Credit&nbsp;</a></td>
                                        <td width="20%"><gw:textbox id="txtsum_chk_cr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" /></td>
                                        <td width="20%"><gw:textbox id="txtsum_chk_cr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##R" /></td>
                                        <td width="15%" align="center">Total</td>
                                        <td width="20%"><gw:textbox id="txtsum_total_cr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" /></td>
                                        <td width="20%"><gw:textbox id="txtsum_total_cr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##R" /></td>
                                        <td width="" align=""><gw:button id="btnCopyRow_Cr" img="copy" alt="Copy Row" onclick="OnCopyRow_Cr()" /></td>
										<td width="" align=""><gw:button id="btnNew_Cr" img="new" alt="New" onclick="OnNewCr()" /></td>
                                        <td width="" align=""><gw:button id="btnSave_Cr" img="save" alt="Save" onclick="OnSaveCr()" /></td>
                                        <td width="" align=""><gw:button id="btnDel_Cr" img="delete" alt="Delete" onclick="OnDelCr()" /></td>
                                        <td width="" align=""><gw:button id="btnUp_Cr" img="up" onclick="OnUpCr()"/></td>
                                        <td width="" align=""><gw:button id="btnDown_Cr" img="down" onclick="OnDownCr()"/></td>
                                        <td title='Show/Hide Toltal Amt'><gw:checkbox id="chkShowHide_Cr" value="F"  onclick="OnShowHide_Col('Cr')" /></td>
                                        <td width="" align=""><img status="expand" id="imgArrow" src="../../../../system/controls/images/button/back.png" style="cursor: hand;" onclick="OnToggle()" /></img></td>
                                            
                                </tr>
                            </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style='height:48%'>
                            <!--0_Pk|1_Acc_pk|2.|3.|4.Acc.Code|5.Acc.Name|6.Ccy|7.Rate|8.Amount Trans|9.Amount Book|10.%VAT|11.VAT Trans|12.VAT Book|13.VAT Deduct Trans|14.VAT 15.Deduct Book|16.Description|17.Local Description|18._m_pk|19_ODR|20_DRCR|21.Book Rate-->
                                    <td width="100%">
                                        <gw:grid id="grdCredit" 
                                        header="_Pk|_Acc_pk|||Acc. Code|Acc. Name|Ccy|Ex. Rate|Amt (Trans)|Amt (Books)|%VAT|VAT Amt (TR)|VAT Amt (BK)|VAT Amt Deduct (TR)|VAT Amt Deduct (BK)|Description|Description (LC)|_m_pk|_ODR|_DRCR|Ex.Rate (Books)|Korea Description|Total Amt(Trans)|Total Amt(Book)"
                                format="0|0|3|0|0|0|0|0|0|2|0|1|1|1|1|0|0|0|0|0|2|0|1|1" 
                                aligns="0|0|1|1|1|0|1|1|3|3|1|3|3|3|3|0|0|0|0|0|0|0|0|0"
                                defaults="||||||VND||||||||||||||||" 
                               editcol="0|0|1|1|0|0|1|1|1|1|1|0|0|1|1|1|1|0|0|0|1|1|0|0" 
                                widths="0|0|250|300|1000|2000|700|1000|1800|1800|700|1800|1800|1800|1800|3000|2500|1000|1000|1000|1500|2000|2000|0"
                                            styles="width:100%; height:100%" sorting="F" oncelldblclick="DBPopupClick_CR()" oncellclick="RowClick_CR()" onselchange="RowClick_CR()"
                                            onafteredit="RowEditCR()" />
                                    </td>
                    </tr>
                    <tr style='height:2%'>
                        <td width="100%">
                            <fieldset style='padding:0'>
                                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                    <tr style='background-color:bde9ff'>
                                            <td width="15%" ></td>
                                            <td width="10%"  align="right">Difference&nbsp;</td>
                                            <td width="30%" ><gw:textbox id="txtsum_diff_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" /></td>
                                            <td width="30%" ><gw:textbox id="txtsum_diff_amt" styles="width:100%" type="number" format="#,###,###,###,###R" /></td>
                                            <td width="15%" ></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                        
                    </tr>
                </table>
            </td>
            <td width="40%" id="tdControlItem" style="display: none" valign="top">
                <table border="0" style='height:100%;width:100%' cellpadding="0" cellspacing="0">
                    <tr style='height:2%'>
                        <td width="100%">
                            <fieldset style='padding:0'>
                            <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="25%" align="Center">Control Item</td>
                                    <td width="50%" align="left"></td>
                                    <td width="25%" align="right"><gw:icon id="btnTreament" img="in" text="Treament" onclick="OnTreament()" styles="width:100%" /></td>
                                </tr>
                            </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style='height:98%'>
                        <td width="100%">
                            <table border="1" style="width:100%;height:100%" cellpadding="0" cellspacing="0" bordercolor="#00CCFF" style="border-collapse: collapse">
                                <tr style='height:100%'>
                                        <td>
                                                <gw:neogrid id="idGridItem" styles="width:100%;height:100%" oncellclick="OnChange_ControlItem()" oncelldblclick="ClickItemControl()" onafteredit="ChangeData_Upper()"> 
                                                    <XML>
						<xmlblock>
										
							<column title="itempk" hidden='T'><textbox type="number" format="######"/></column>

							<column title="detailpk" hidden='T'><textbox type="number" format="######" /></column>

							<column title="acctpk" hidden='T'><textbox type="number" format="######" /></column>

							<column title="INPUT TYPE" hidden='T'><textbox  format="3" /></column>

							<column title="dsqlid" hidden='T'><textbox  format="3" /></column>

							<column title="dsql" hidden='T'><textbox  format="3" /></column>

							<column title="mandatory" hidden='T'><textbox  format="3" /></column>

							<column title="data type" hidden='T'><textbox  format="3" /></column>

							<column title="Item Alias" width='1500' editmode="0" ><textbox  format="3" /></column>

							<column title="Item code"  width='2500'>
								<multiple ref="7"  >
									<textbox type="number" format="###,###C" value="" />
									<textbox format="100" value="" />
									<datebox type="day" format=""  lang="1" acceptnull="T"/>
									<checkbox />	
									<htmledit value="[New]" />				
								</multiple>
							</column>
										
							<column title="Item name" width='1500'><textbox/></column>
										
							<column title="TABLE NM" hidden='T'><textbox  /></column>
										
							<column title="TABLE PK" hidden='T'><textbox  /></column>
						</xmlblock>
					</xml>
				                                </gw:neogrid>
                                        </td>
                                        
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                                <td>
                                               <!------------------------------------------Textbox ẩn ----------------------------------------------->
    <gw:list id="lstVoucherTypePrint" styles="display:none" />
    <gw:textbox id="txtProposedByUserPk" style="display: none" />
    <gw:list id="lstBookExRate" styles="display:none" />
    <gw:textbox id="txtcustpk" styles="Display:none" />
    <gw:textbox id="txt_DRCR" style="display: none" />
    <gw:textbox id="txtStatus" style="display: none" />
    <gw:textbox id="txttrans_code_tmp" style="display: none" />
    <gw:textbox id="txtacpk" style="display: none" />
    <gw:textbox id="txtRtn_Copy" style="display:none " />
    <gw:textbox id="txt_rowclick" style="display: none" />
    <gw:textbox id="txt_count" style="display: none" />
    <gw:textbox id="txtbprvpvd" style="display: none" />
    <gw:textbox id="txtcur" style="display: none" />
    <gw:textbox id="txtrate" style="display: none" />
    <gw:textbox id="txt_row" style="display: none" />
    <gw:textbox id="txttax_acc" style="display: none" />
    <gw:textbox id="txtUser_Pk"  styles='display:none' />
    <gw:textbox id="txtLang" style="display: none" />
    <gw:textbox id="txt_rate" style="display: none" />
    <gw:textbox id="txtseq1" style="display:none " />
    <gw:textbox id="txtEACAB032" style="display: none" />
    <gw:textbox id="txtEACAB018" style="display: none" />
	<gw:textbox id="txtpay_person_pk" style="display: none" />
	<gw:textbox id="txsetDRamt2CR" style="display: none" />
    <gw:list id="lstPayment" value="1" styles='display:none'><data>Data|1|Payment|2|Receipt|3|Payment-A4|4|Receipt-A4</data></gw:list>
    <gw:grid style="display:none " 
 id="idGridTempItem" 
 header="itemacctpk|itemal|item|itemnm|table_pk|table_name" 
 format="0|0|0|0|0|0"
 aligns="0|0|0|0|0|0" 
 defaults="|||||" 
editcol="0|0|0|0|0|0" 
 widths="1300|3500|3500|2000|1500|2000" 
 styles="width:100%; height:100"
        sorting="F"  />
    <!---------------------------------------------------------------------------------------------------->
    <gw:textbox id="txtAc_level"  styles='display:none' />
<gw:textbox id="txtSesion_company"  styles='display:none' />
                                </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
   <gw:textbox id="txt_drcr_type" style="display:none " />
   <gw:textbox id="txtFORMID"         style="display:none" />
<gw:textbox id="txtGROUPID"         style="display:none" />
	<gw:list id="txtPrint_Format"  styles='display:none' />
<gw:list id="lst_Print_Amount"  styles='display:none' />   
</body>
</html>
