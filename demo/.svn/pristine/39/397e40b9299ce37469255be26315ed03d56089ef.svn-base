<!--#include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">
// global variables
var  g_emp_pk = "" ;
var  g_user_pk = "" ;
var  g_user_name = "" ;
var  g_user_id = "" ;
var g_language   = "";	
var g_company_pk   = "";	
// global variables for grdSearch
	var g_S_VoucherNo 	= 0,
		g_S_Seq			= 1,
		g_S_TransDate	= 2,
		g_S_InvoiceNo	= 3,
		g_S_TotalTransAmount = 4,
		g_S_TotalBooksAmount = 5,
		g_S_tac_crda_pk	     = 6;
// global variables of grdMst
var 	g_M_tac_crda_pk		= 0,
		g_M_tco_company_pk	= 1,
		g_M_voucherno		= 2,
		g_M_voucher_type	= 3,
		g_M_seq				= 4,
		g_M_tr_date			= 5,
		g_M_tr_status		= 6,
		g_M_crt_by			= 7,
		g_M_full_name		= 8,
		g_M_emp_pk			= 9,
		g_M_vendor_cd		= 10,
		g_M_vendor_nm		= 11,
		g_M_vendor_pk		= 12,
		g_M_delivery_cd		= 13,
		g_M_delivery_nm		= 14,
		g_M_delivery_pk		= 15,
		g_M_charger_cd		= 16,
		g_M_charger_nm		= 17,
		g_M_charger_pk		= 18,
		g_M_contact_cd		= 19,
		g_M_contact_nm		= 20,
		g_M_contact_pk		= 21,
		g_M_bk_rate			= 22,
		g_M_tr_ccy			= 23,
		g_M_tr_rate			= 24,
		g_M_tr_enclose		= 25,
		g_M_Acc_pk			= 26,
		g_M_ac_cd			= 27,
		g_M_ac_nm			= 28,
		g_M_remark			= 29,
		g_M_remark2			= 30,
		g_M_tac_abtrtype_pk	= 31,
		g_M_tr_type			= 32,
		g_M_tr_tpnm			= 33,
		g_M_custom_pk		= 34,
		g_M_custom_cd		= 35,
		g_M_custom_nm		= 36,
		g_M_mat_due_date	= 37,
		g_M_mat_duedt_exp	= 38,
		g_M_vat_due_date	= 39,
		g_M_vat_duedt_exp	= 40,
		g_M_takein_date		= 41,
		g_M_dtInvoiceDT		= 42,
		g_M_invoiceno		= 43,
		g_M_serial			= 44,
		g_M_Auto			= 45,
		g_M_APPOType		= 46,
		g_M_Clear_amt		= 47;
// global variable for updating status of grdMst
var g_insert = false ;	//insert master	
var g_delete = false ; // delete master
var g_save	= false ; //save master 
// global variables of grid grdDtl
var g_Dtl_PK  				= 0,
	g_Dtl_Order_No			= 1,
	g_Dtl_Item_Code			= 2,
	g_Dtl_Item_Name			= 3,
	g_Dtl_WH				= 4,
	g_Dtl_Unit				= 5,
	g_Dtl_UPrice			= 6,
	g_Dtl_Act_Qty			= 7,
	g_Dtl_Inv_Qty			= 8,
	g_Dtl_Diff_Qty			= 9,
	g_Dtl_Inv_Net_Tr_Amt	= 10,
	g_Dtl_Inv_Net_Bk_Amt	= 11,
	g_Dtl_Diff_Net_Tr_Amt	= 12,
	g_Dtl_Diff_Net_Bk_Amt	= 13,
	g_Dtl_Ac_CD				= 14,
	g_Dtl_Ac_NM				= 15,
	g_Dtl_Cost				= 16,
	g_Dtl_Desc				= 17,
	g_Dtl_Local_Desc		= 18,
	g_Dtl_Tac_crda_pk		= 19,
	g_Dtl_tco_item_pk		= 20,
	g_Dtl_tac_abacctcode_pk	= 21,
	g_Dtl_wh_pk				= 22,
	g_Dtl_mat_famt			= 23,
	g_Dtl_mat_amt			= 24,
	g_Dtl_mat_unit			= 25,
	g_Dtl_mat_pk			= 26,
	g_Dtl_mattakein_pk	    = 27,
	g_Dtl_APPO_Type			= 28,
	g_Dtl_tac_cinv_ap		= 29,
	g_Dtl_vat_rate	        = 30,
	//g_Dtl_tin_stocktr_pk	= 31,
	g_Dtl_tac_abplcenter_pk	= 31,
	g_Dtl_seq_item	= 32;
		
// global variables of grid VAT
var	g_VAT_PK 			= 0,
	g_VAT_Item_code		= 1,
	g_VAT_Item_name 	= 2,
	g_VAT_CalAmtTax 	= 3,
	g_VAT_CalAmt 		= 4,
	g_VAT_CalTaxNetVAT	= 5,
	g_VAT_TaxRate		= 6,
	g_VAT_VATTransAmt 	= 7,
	g_VAT_VAT_Books_Amt = 8,
	g_VAT_TAX_VAT_Amt   = 9,
	g_VAT_VAT_Acc_Code	= 10,
	g_VAT_VAT_Acc_NM	= 11,
	g_VAT_Desc			= 12,
	g_VAT_LocalDesc		= 13,
	g_VAT_abacctcode_pk_vat = 14;
// global variables
	var g_PL_PK 				= 0,
		g_PL_tac_abplcenter_pk 	= 1,
		g_PL_ItemCode			= 2,
		g_PL_ItemName			= 3,
		g_PL_PLCode				= 4,
		g_PL_PLName				= 5;
// global variables of grid grdDtlAllocate
	var g_Alc_PK 			= 0,
		g_Alc_ItemCode		= 1,
		g_Alc_ItemName		= 2,
		g_Alc_CalTransAmt 	= 3,
		g_Alc_CalBookAmt 	= 4,
		g_Alc_AlcTransAmt 	= 5,
		g_Alc_AlcBooksAmt 	= 6,
		g_Alc_Ratio			= 7,
		g_Alc_Ex_Rate		= 8,
		g_Alc_FOB_Price		= 9 ;
// global variables of grdDtlImp
var		g_Imp_PK			= 0,
		g_Imp_ItemCode		= 1,
		g_Imp_ItemName		= 2,
		g_Imp_CalcAmtTax	= 3,
		g_Imp_CalcAmt		= 4,
		g_Imp_CalcTaxNetTax = 5,
		g_Imp_TaxRate		= 6,
		g_Imp_TaxTransAmt	= 7,
		g_Imp_TaxBooksAmt	= 8,
		g_Imp_ImpTaxAmt		= 9,
		g_Imp_ReturnTax		= 10;
// global variables of grdDtlExc
var 	g_Exc_PK			= 0,
		g_Exc_Itemcode		= 1,
		g_Exc_Itemname		= 2,
		g_Exc_CalcAmtTax	= 3,
		g_Exc_CalcAmt		= 4,
		g_Exc_CalcTaxNetExc	= 5,
		g_Exc_ExcRate		= 6,
		g_Exc_ExcTransAmt	= 7,
		g_Exc_ExcBooksAmt	= 8,
		g_Exc_TaxExcAmt		= 9;
// global variables of grdENVTax
var 	g_env_pk			= 0,
		g_env_item_code		= 1,
		g_env_item_name     = 2,
		g_env_net_trans_amt = 3,
		g_env_net_books_amt = 4,
		g_env_net_vnd_amt = 5,
		g_env_rate = 6,
		g_env_tax_trans_amt = 7,
		g_env_tax_books_amt = 8,
		g_env_tax_vnd_amt = 9,
		g_env_acc_cd = 10,
		g_env_acc_nm = 11,
		g_env_desc = 12,
		g_env_local_desc = 13,
		g_env_ac_pk = 14;
		
//---------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    dtDueDate.SetEnable(false);
    BindingDataList();
}
/*---------------------------------------------------------------
init default values for controls
******************************************************************/
function BindingDataList()
{
    g_emp_pk = "<%=Session("EMPLOYEE_PK")%>" ;
    g_user_pk = "<%=Session("USER_PK")%>" ;
    g_user_name = "<%=Session("USER_NAME")%>" ;
    g_user_id = "<%=Session("USER_ID")%>" ;
    g_language   = "<%=Session("SESSION_LANG")%>";	
    g_company_pk   = "<%=Session("COMPANY_PK")%>";	

	var l_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(l_data);	
	lstCompany.value = g_company_pk;
	l_data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACBG0010') FROM DUAL ")%>";	
	lstSliStatus.SetDataText(l_data + "|ALL|ALL" );
	lstSliStatus.value = "ALL" ;	
	lstStatus.SetDataText(l_data);		
	lstStatus.value = 1;
	var l_today = dtTrDateto.value ;
	var l_from_dt = l_today.substring(0, 6) + "01";
	dtTrDatefr.value = l_from_dt;
	txtTransDT.text = dtTransDT.text ;
	l_data    = "<%=CtlLib.SetListDataSQL("SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B  WHERE A.PK     = B.TAC_COMMCODE_MASTER_PK AND A.ID     = 'ACBG0130' AND A.DEL_IF = 0  AND B.DEL_IF = 0  AND B.USE_YN ='Y' AND A.TCO_COMPANY_PK="+ Session("COMPANY_PK") +"  ORDER BY CODE, B.CODE_NM")%>";
	lstVoucherType.SetDataText(l_data);	
	lstVoucherType.value = "NK" ;
	l_data = "<%=CtlLib.SetListDataSQL("select TRIM(CODE) code, A.CODE code_nm FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'ACBG0040' and A.def_yn = 'Y'")%>";
	lstBookCcy_2.SetDataText(l_data);	
	lstBook_Ccy.SetDataText(l_data);	
	lstBook_Ccy.value = lstBookCcy_2.value ;
	l_data = "<%=CtlLib.SetListDataFUNC(" SELECT f_commoncode('ACAB0110', '', '') FROM DUAL ")%>";
	lstTransCcy.SetDataText(l_data);
	lstTransCcy.value = "VND";
	
	l_data = "<%=CtlLib.SetListDataSQL("select TRIM(CODE) code, A.CODE code_nm FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'EACAB038' and A.def_yn = 'Y'")%>";
	lstVATCurr.SetDataText(l_data);
	txtVATCurrRate.text = "1";
	l_data = "<%=CtlLib.SetListDataSQL("select TRIM(CODE) code, A.code_nm FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'EACAB007' and a.code in ('ED', 'PO', 'IE') ")%>";
	lstGetData.SetDataText(l_data);
	// Enter Direct : getdata
	lstGetData.value = "ED";
	<%=CtlLib.SetGridColumnComboFormat("grdDtlVAT", 6,"SELECT A.CODE, A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACCR0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
	<%=CtlLib.SetGridColumnComboFormat("grdDtlImp", 6,"SELECT A.CODE, A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACCR0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;	
	<%=CtlLib.SetGridColumnComboFormat("grdDtlExc", 6,"SELECT A.CODE, A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACCR0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;	
	<%=CtlLib.SetGridColumnComboFormat("grdDtl", 5,"select uom_code, uom_nm from tlg_it_uom where del_if = 0 order by uom_code asc ")%>;
	txtGROUPID.text = "EACAB011";
	txtFORMID.text = "60040020";
	txtemp_pk.text = g_user_pk ;	
	txtPersonCD.text = g_user_id ;
	// vat custom office
	txtCustomOffCD.text = txtVATCustom_CD.text;
	txtCustomOffNM.text = txtVATCustom_NM.text;
	txtCustomOffPK.text = txtVATCustom_PK.text;
	lstVATCurr.SetEnable(false);	
	lstBook_Ccy.SetEnable(false);	
	btnConfirm.SetEnable(false);	
	ibtnDelete.SetEnable(false);
	btnReplicate.SetEnable(false);
	ibtnPrint.SetEnable(false);
	btnCancel.SetEnable(false);
    var left  = document.all("idLEFT");    
    var right = document.all("idRIGHT");   
    var imgArrow = document.all("imgArrow");       
    left.style.display="none";       
    imgArrow.status = "collapse";
    right.style.width="100%";
    imgArrow.src = "../../../system/images/next_orange.gif";
	chkCost.value = 'T';
	l_data = "<%=CtlLib.SetListDataFUNC("SELECT f_commoncode('ACCR0110', '', '') FROM DUAL")%>";	
	lstVATRate.SetDataText(l_data);
	lstVATRate.value = '01'; // none
	//alert(g_company_pk);
	txtCompany_PK.SetDataText(g_company_pk);
    OnNew('Master');
	txtUser_Pk.text = "<%=Session("USER_PK")%>";
	lstVoucherType.value = "AP";
	dso_getCompany.Call();
}
//---------------------------------------------------------------
function OnToggle()
 {
    var left  = document.all("idLEFT");    
    var right = document.all("idRIGHT");   
    var imgArrow = document.all("imgArrow");       
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="85%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
 }
//---------------------------------------------------------------
function onSetBookRate()
{
    if (txtBookRate_2.GetData() == 0)
    {
        alert('You must type in day ratio: '+ dtTransDT.text +'\n'+'Bạn hãy nhập tỷ giá ngày: '+ dtTransDT.text);
    }
	txtBookRate.text = txtBookRate_2.text;	
	dso_get_vat_ccy.Call();
}
//---------------------------------------------------------------
function OnDataReceive(iObj)
{
	switch(iObj.id)
	{
		case 'dso_getCompany':
	        dso_init_form.Call();
	        break;
		case "dso_init_form":
			if(txtaccr_pk.text == "")
			{
				alert("The system has not setup initial information!!!");
			}
			else
			{				
									
				txtTrsTP_PK.text = txtTransTP_PK.text;
				txtTransCD.text = txtTransTP_CD.text;
				txtTransNM.text = txtTransTP_NM.text;
				txtAPaccPK.text = txtaccr_pk.text;
				txtAPacc.text = txtAPAC_CD.text;
				txtAPaccNM.text = txtAPAC_NM.text;
				txtPersonNM.text = txtPersonNM_0.text;			
				txtemp_pk.text = g_user_pk;
				txtPersonCD.text = g_user_id;
				txtBookRate.text = txtBookRate_2.text;
				lstStatus.value = "1";		
				txtCustomOffCD.text = txtVATCustom_CD.text;
				txtCustomOffNM.text = txtVATCustom_NM.text;
				txtCustomOffPK.text = txtVATCustom_PK.text;	/*						
				if(Trim(txtCompany_Rnt.GetData()) != "")
				{
				    lstCompany.SetDataText("DATA|" + txtCompany_Rnt.GetData());
				}*/
                if (txtBookRate_2.GetData() == 0)
                {
                    alert('You must type in day ratio: '+ dtTransDT.text +'\n'+'Bạn hãy nhập tỷ giá ngày: '+ dtTransDT.text);
                }
                txtBookRate.text = txtBookRate_2.text;
                
				//dso_sel_booksrate.Call();
			}
		break ;
		case "grdMst":
			OnStatusButtons();
			if(g_insert)
			{
				g_insert = false ;
				idTab_Child.SetPage(1); // turn to the Item Info tab
				lstSliStatus.value = "1";
				dso_ap_list.Call("SELECT");				
			}
			else if(g_delete || g_save )
			{
				g_delete = false ;
				g_save = false ;
				lstSliStatus.value = "1";
				dso_ap_list.Call("SELECT");										
			}	
			else
			{
				OnSearchTab();
			}
		break ;
		case "dso_upd_grd_dtl_ap_do":
			OnFormatGrid();
			var l_sum_Inv_Net_Tr_Amt = 0, l_sum_Inv_Net_Bk_Amt = 0;
			var i;
			for(i = 1; i < grdDtl.rows; i++)
			{
				l_sum_Inv_Net_Tr_Amt += Number(grdDtl.GetGridData(i, g_Dtl_Inv_Net_Tr_Amt));
				l_sum_Inv_Net_Bk_Amt += Number(grdDtl.GetGridData(i, g_Dtl_Inv_Net_Bk_Amt));
			}
			lblTotal_FAMT.text = l_sum_Inv_Net_Tr_Amt.toFixed(3);
			lblTotal_AMT.text = l_sum_Inv_Net_Bk_Amt.toFixed(3);	
			if( grdDtl.rows > 1)
			{
				txtAPPO_Type.text = grdDtl.GetGridData(1, g_Dtl_APPO_Type);
			}
			if(txtAPPO_Type.text == "P")
				lstGetData.value = "PO";
			else if(txtAPPO_Type.text == "E")			
				lstGetData.value = "ED";	
			else if(txtAPPO_Type.text == "I")		
				lstGetData.value = "IE";			
		break ;
		case "dso_upd_grd_dtl_ap_vat":
			OnFormatGrid_VAT();
			var i, l_tot_tr_amt = 0, l_tot_bk_amt = 0;
			for(i = 1; i < grdDtlVAT.rows; i++)
			{
				l_tot_tr_amt += Number(grdDtlVAT.GetGridData(i, g_VAT_VATTransAmt));
				l_tot_bk_amt += Number(grdDtlVAT.GetGridData(i, g_VAT_VAT_Books_Amt));
			}
			txtTotTrAmt.text = l_tot_tr_amt.toFixed(3);
			txtTotBkAmt.text = l_tot_bk_amt.toFixed(3);			
		break ;
		case "dso_upd_grd_dtl_ap_allocate":
			OnFormat_Allocate();
			var i, l_tot_alc_tramt = 0, l_tot_alc_bkamt = 0 ;
			for(i = 1; i < grdDtlAllocate.rows; i++)
			{
				l_tot_alc_tramt += Number(grdDtlAllocate.GetGridData(i, g_Alc_AlcTransAmt));
				l_tot_alc_bkamt += Number(grdDtlAllocate.GetGridData(i, g_Alc_AlcBooksAmt));
				grdDtlAllocate.SetRowStatus(i, 0);	
			}
			txtAlcTrAmt.text = l_tot_alc_tramt.toFixed(3);
			txtAlcBkAmt.text = l_tot_alc_bkamt.toFixed(3);
			
			dso_pro_losgistic.Call();
		break ;
		case "dso_ap_list":
			OnFormat_gridSearch();
		break ;
		case "dso_crda_confirm":			
			grdMst.Call("SELECT");
		break ;
		case "dso_upd_cancel":
			grdMst.Call("SELECT");
		break ;
		case "dso_upd_replicate":
			txtCRDA_pk.text = txtStatus.text;
			grdMst.Call("SELECT");			
		break;
		case "dso_upd_grd_dtl_imp":
			OnFormat_ImpTax();
			var i, l_tot_trans = 0, l_tot_books = 0;
			
		break ;
		case "dso_upd_grd_dtl_exc":
			OnFormat_ExcTax();			
		break ;
		case 'dso_upd_grd_dtl_ap_enron_tax':
			OnFormat_ENRONTax();
		break;		
	}
}
//---------------------------------------------------------------
function SetCurrent()
{
	if(txtTransCcy.text == "" )
	{
		alert('   Rate is not null!!!'+'\n'+'Tỷ giá giao dịch không được rỗng!!!');
	}
	else if(Number(txtTransCcy.text)==0)
	{
		alert('   Rate is not null!!!'+'\n'+'Tỷ giá giao dịch không được rỗng!!!');
	}
	dso_sel_booksrate.Call();
}
//---------------------------------------------------------------
function SetVATCCY()
{
	if(txtVATCurrRate.text == "")
	{
		alert('   VAT Currency Rate is not null!!!'+'\n'+'Tỷ giá giao dịch không được rỗng!!!');
	}
	else if(Number(txtVATCurrRate.text)==0)
	{
		alert('   VAT Currency Rate is not null!!!'+'\n'+'Tỷ giá giao dịch không được rỗng!!!');
	}
}
//---------------------------------------------------------------
function OnReset(iObj)
{
	switch(iObj)
	{
		case "Person":
			txtPersonCD.text = "";
			txtPersonNM.text = "";
			txtemp_pk.text 	= "" ;	
		break ;
		case "Vendor":
			txtVendorCD.text = "" ;
			txtVendorNM.text = "" ;
			txtVendorPK.text = "";
		break ;
		case "Vendor_1":
			txtVendorID.text = "" ;
			txtVendorName.text = "" ;
			txtVendorPK_1.text = "";
		break ;
		case "Deliver":
			txtDeliverCD.text = "";
			txtDeliverNM.text = "" ;
			txtDeliverPK.text = "" ;
		break ;
		case "A/P":
			txtChargerCD.text = "" ;
			txtChargerNM.text = "";		
			txtChargerPK.text = "" ;	
		break ;
		case "Paid To":
			txtContactCD.text = "";
			txtContactNM.text = "" ;
			txtContactPK.text = "" ;
		break ;
		case "Account code A/P":
			txtAPacc.text = "";
			txtAPaccNM.text = "";
			txtAPaccPK.text = "";
		break ;
		case "VAT Custom Office":
			txtCustomOffCD.text = "";
			txtCustomOffNM.text = "";
			txtCustomOffPK.text = "" ;
		break ;
		case "Trans Type":
			txtTransCD.text = "" ;
			txtTransNM.text = "" ;
			txtTrsTP_PK.text = "" ;
		break ;
		case "New Master":
			txtTrsTP_PK.text = txtTransTP_PK.text;
			txtTransCD.text = txtTransTP_CD.text;
			txtTransNM.text = txtTransTP_NM.text;
			txtAPaccPK.text = txtaccr_pk.text;
			txtAPacc.text = txtAPAC_CD.text;
			txtAPaccNM.text = txtAPAC_NM.text;
			txtPersonNM.text = txtPersonNM_0.text;			
			txtemp_pk.text = g_user_pk;
			txtPersonCD.text = g_user_id;
			txtBookRate.text = txtBookRate_2.text;
			lstStatus.value = "1";
			lstTransCcy.value = "VND";
			txtTransCcy.text = "1";
			txtCustomOffCD.text = txtVATCustom_CD.text;
			txtCustomOffNM.text = txtVATCustom_NM.text;
			txtCustomOffPK.text = txtVATCustom_PK.text;			
			chkAuto.value = 'T';
		break ;
		case "Refresh":
			chkAuto.value = "T";
			txtvoucher_no.text = "";
			txtseq.text = "";
			lstStatus.value = "";
			txtPersonCD.text = "";
			txtPersonNM.text = "";
			txtVendorCD.text = "";
			txtVendorNM.text = "";
			txtDeliverCD.text = "";
			txtDeliverNM.text = "";
			txtChargerCD.text = "";
			txtChargerNM.text = "";
			txtContactCD.text = "";
			txtContactNM.text = "";
			txtserial.text = "";
			txtinvoiceno.text = "";
			txtdeclareno.text = "";
			txtEnclose.text = "";
			txtAPacc.text = "";
			txtAPaccNM.text = "";
			txtDesc.text = "";
			txtLocalDesc.text = "";
			txtCustomOffCD.text = "";
			txtCustomOffNM.text = "";
			txtDueDate.text = "";
			txtVATDue.text = "";
			txtClearAmount.text = "";
			txtCRDA_pk.text = "";			
			if(idTab_Child.GetCurrentPageNo() == 0)
			{
				idTab_Child.SetPage(1);
			}
            else
			{
				if(idTab_Child.GetCurrentPageNo() == 1)
					grdDtl.ClearData();
				else if(idTab_Child.GetCurrentPageNo() == 2)	
					grdDtlVAT.ClearData();
				else if(idTab_Child.GetCurrentPageNo() == 3)	
					grdDtlPL.ClearData();
				else if(idTab_Child.GetCurrentPageNo() == 4)	
					grdDtlAllocate.ClearData();					
			}
			lblTotal_FAMT.text = "0";
			lblTotal_AMT.text = "0";
			btnConfirm.SetEnable(false);
			ibtnSave.SetEnable(false);
			ibtnDelete.SetEnable(false);
			btnReplicate.SetEnable(false);
			ibtnPrint.SetEnable(false);
			btnCancel.SetEnable(false);
			btnAdd_More.SetEnable(false);
			btnSave_More.SetEnable(false);
			btnSave_More.SetEnable(false);
			btnNew_D.SetEnable(false);
			btnSave_D.SetEnable(false);
			btnDel_D.SetEnable(false);				
			btnSave_VAT.SetEnable(false);
			btnSave_PL.SetEnable(false);
			btnSave_Allocate.SetEnable(false);
			chkCost.SetEnable(false);						
		break ;
	}
}
//---------------------------------------------------------------
function onSearchCust(p_data)
{
	if(p_data == "Vendor" || p_data=="Vendor_1" || p_data == "Deliver" || p_data == "A/P" || p_data == "Paid To" || p_data == "VATCustomOffice" )
	{
		var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx?com_pk='+lstCompany.value;
		var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
		if ( object != null )
		{
			if (object[0] != 0)
			{
				if (p_data == 'Vendor')
				{
					txtVendorPK.text = object[0];
					txtVendorNM.text = object[2];
					txtVendorCD.text = object[1];
					txtDeliverPK.text = object[0];
					txtDeliverNM.text = object[2];
					txtDeliverCD.text = object[1];
					txtChargerPK.text = object[0];
					txtChargerNM.text = object[2];
					txtChargerCD.text = object[1];
					txtContactPK.text = object[0];
					txtContactNM.text = object[2];
					txtContactCD.text = object[1];
					
					txtCustomOffPK.text = object[0];
					txtCustomOffCD.text = object[1];
					txtCustomOffNM.text = object[2];
					
					txtDueDate.text=object[26];
					OnDueDate();
					
				}
				else if (p_data == 'Deliver')
				{
					txtDeliverPK.text = object[0];
					txtDeliverNM.text = object[2];
					txtDeliverCD.text = object[1];
				}
				else if (p_data == 'A/P')
				{
					txtChargerPK.text = object[0];
					txtChargerNM.text = object[2];
					txtChargerCD.text = object[1];
				}
				else if (p_data == 'Paid To')
				{
					txtContactPK.text = object[0];
					txtContactNM.text = object[2];
					txtContactCD.text = object[1];
				}
				else if (p_data == 'SearchVendor')
				{
					txtvenpk.text = object[0];
					txtvenid.text = object[1];
					txtvennm.text = object[2];
				}
				else if (p_data == 'VATCustomOffice')
				{
					txtCustomOffPK.text = object[0];
					txtCustomOffCD.text = object[1];
					txtCustomOffNM.text = object[2];
				}
				else if(p_data == "Vendor_1")
				{
					txtVendorID.text = object[1];
					txtVendorName.text = object[2];
					txtVendorPK_1.text = object[0];
				}				
			}
		}
	}		
	else if(p_data == "AccountAP")
	{
		var fpath = System.RootURL + "/standard/forms/60/09/60090020_account_popup.aspx?comm_nm=" + "" + "&comm_code=" + "210101" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60090010_acn_ap_popup";
		o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
		if (o != null)
		{
			if(o[0] != 0)
			{
				txtAPaccPK.text = o[3]; // account pk
				txtAPacc.text = o[0]; // account code
				txtAPaccNM.text = o[1] ; // account name
			}
			txtseq.GetControl().focus();
		}
	}			
	else if(p_data == "Person")
	{
		var path = System.RootURL + "/standard/forms/60/09/60090010_search_emp.aspx";
		var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');		
		if(object!=null)
		{
			txtemp_pk.text = g_user_pk ;            
			txtPersonCD.text = object[1];
			txtPersonNM.text = object[2];
		}        
	}			
	else if (p_data == "Trans Type" )
	{
		var path = System.RootURL + '/standard/forms/60/09/60090010_Transaction.aspx?compk='+ lstCompany.value;
		var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
		if( object != null )
		{
			var tmp = object[0];
			if (tmp[1] != null)
			{
				txtTransCD.text = tmp[1];
				txtTransNM.text = tmp[2];
				txtTrsTP_PK.text = tmp[0];
			}                
		}            	
	}
	else if(p_data == "ClearType" )
	{
		var path = System.RootURL + '/standard/forms/60/09/60090020_GetAdvance.aspx?compk='+ lstCompany.value + "&tac_crda_pk=" + txtCRDA_pk.text + "&status=" + lstStatus.value+'&AP_Type=OS' ;		
		var object = System.OpenModal( path , 1100, 700,  'resizable:yes;status:yes');
		if(object != null)
		{					
		    if(object[0] == true)
		    {
		        grdMst.Call('SELECT');
			}
		}
	}
}
//---------------------------------------------------------------
function OnSearch(iCase)
{
	switch(iCase)
	{
		case '1': // grdSearch			
			OnReset("Refresh");
			dso_ap_list.Call("SELECT");
		break ;
		case '2': // grdMst
		/*if(g_insert)
		{
			if(confirm("Do you want to save new AP slip?"))
			{
				OnSave('1'); // save master
			}
			else
			{*/
				txtCRDA_pk.text = grdSearch.GetGridData(grdSearch.row, g_S_tac_crda_pk); ;
				g_insert = false;			
				grdMst.Call("SELECT");
				
			//}
		//}
		//else
		//{
		//}	
		break ;
	}
}
//---------------------------------------------------------------
function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
	var x = c.toUpperCase().charCodeAt(0);
	event.keyCode = x;
}
//---------------------------------------------------------------
function OnNew(iCase)
{
	switch(iCase)
	{
		case 'Master':						
			grdMst.StatusInsert() ;
			OnReset("New Master");
			OnStatusButtons();
			idTab_Child.SetPage(1);							
			g_insert = true;
			lstVoucherType.value = "AP";
		break ;
	}
}
//---------------------------------------------------------------
function OnMatDueDate()
{
	var ls_Duedate = dtDueDate.value ;	
	var ls_trdate = dtTransDT.value ;	
	var ldt_Duedate = new Date(ls_Duedate.substr(0,4), Number(ls_Duedate.substr(4,2)) - 1, ls_Duedate.substr(6,2));
	var ldt_trdate = new Date(ls_trdate.substr(0,4), Number(ls_trdate.substr(4,2)) - 1, ls_trdate.substr(6,2));		
	var l_seconds = Date.parse(ldt_Duedate) - Date.parse(ldt_trdate);
	var l_days = Number(l_seconds/1000/60/60/24*100/100);	
	txtDueDate.text = l_days.toFixed(3);
}
//---------------------------------------------------------------
function OnVATDueDate()
{
	var ls_Duedate = dtVATDue.value ;	
	var ls_trdate = dtTransDT.value ;	
	var ldt_Duedate = new Date(ls_Duedate.substr(0,4), Number(ls_Duedate.substr(4,2)) - 1, ls_Duedate.substr(6,2));
	var ldt_trdate = new Date(ls_trdate.substr(0,4), Number(ls_trdate.substr(4,2)) - 1, ls_trdate.substr(6,2));		
	var l_seconds = Date.parse(ldt_Duedate) - Date.parse(ldt_trdate);
	var l_days = Number(l_seconds/1000/60/60/24*100/100);	
	txtVATDue.text = l_days.toFixed(3);
}
//---------------------------------------------------------------
function ValidateData(iCase)
{
	switch(iCase)
	{
		case "1": //grdMst
			if(chkAuto.value == "F")// khong tu dong 
			{
				if(Trim(txtvoucher_no.text)=="") 
				{
					alert("Voucher No is not null" + "\n" + "Mã số chứng từ thì không được rỗng!!!");
					txtvoucher_no.GetControl().focus();
					return false ;		
				}
			}
			if(Trim(txtVendorPK.text)=="")
			{
					alert("Vendor is not null" + "\n" + "Nhà cung cấp thì không được rỗng!!!");
					return false ;						
			}
			if(Trim(txtDeliverPK.text)=="")
			{
					alert("Deliver is not null" + "\n" + "Nhà giao hàng thì không được rỗng!!!");
					return false ;						
			}
			if(Trim(txtChargerPK.text)=="")
			{
					alert("A/P Customer is not null" + "\n" + "Nhà thâu tiền thì không được rỗng!!!");
					return false ;						
			}
			if(Trim(txtContactPK.text)=="")
			{
					alert("Contact is not null" + "\n" + "Nhà liên lạc thì không du?c r?ng!!!");
					return false ;						
			}
			if(Trim(txtAPaccPK.text)=="") // 3311, 3312
			{
					alert("A/P account is not null" + "\n" + "Tài khoản công nợ thì không được rỗng!!!");
					return false ;						
			}
			if(Trim(txtTrsTP_PK.text)=="")
			{
					alert("Transaction type is not null" + "\n" + "Nhóm giao dịch thì không được rỗng!!!");
					return false ;						
			}
			if(Trim(txtserial.text)=="")
			{
					//alert("Serial no is not null" + "\n" + "Mã s? seri c?a hóa don thì không du?c r?ng!!!");
					//txtserial.GetControl().focus();
					//return false ;										
			}
			if(Trim(txtinvoiceno.text)=="")
			{
					//alert("Invoice no is not null" + "\n" + "Mã s? hóa don thì không du?c r?ng!!!");
					//txtinvoiceno.GetControl().focus();
					//return false ;										
			}
			if(Trim(lstTransCcy.value)=="")
			{
					alert("Transaction currency is not null" + "\n" + "Ðồng tiền giao dịch thì không được rỗng!!!");
					return false ;										
			}
			if(Trim(txtTransCcy.text)=="")
			{
					alert("Transaction rate is not null" + "\n" + "Tỷ giá tiền giao dịch thì không được rỗng!!!");
					return false ;										
			}
			else if(Number(txtTransCcy.text)==0)
			{
					alert("Transaction rate is not zero" + "\n" + "Tỷ giá tiền giao dịch thì không được = 0!!!");
					return false ;													
			}
			if(Trim(txtDesc.text)=="")
			{
					alert("Description is not null" + "\n" + "Ghi chú thì không được rỗng!!!");
					txtDesc.GetControl().focus();
					return false ;										
			}
			if(Trim(txtLocalDesc.text)=="")
			{
					alert("Local description is not null" + "\n" + "Ghi chú tiếng địa phương thì không được rỗng!!!");
					txtLocalDesc.GetControl().focus();
					return false ;										
			}
			if(Trim(txtBookRate.text)=="")
			{
					alert("Book rate is not null" + "\n" + "Tỷ giá tiền ghi sổ thì không được rỗng!!!");					
					return false ;										
			}
			else if(Number(txtBookRate.text)==0)
			{
					alert("Book rate is not zero" + "\n" + "Tỷ giá tiền ghi sổ thì không được là 0!!!");
					return false ;										
			}			
			return true;	
		break ;
		case "2":
			var i;
			var l_data = "";
			var l_tr_rate = Number(txtTransCcy.text);
			var l_bk_rate = Number(txtBookRate.text);
			for (i = 1; i < grdDtl.rows ; i++)
			{
				l_data = grdDtl.GetGridData(i, g_Dtl_Cost);
				if(l_data == "-1")
				{
					l_data = grdDtl.GetGridData(i, g_Dtl_wh_pk);
					//if(l_data == "")
					//{
						//alert("Warehouse is not null" + "\n" + "Nhà kho thì không du?c r?ng!!!");
						//return false ;		
					//}
				}
				l_data = grdDtl.GetGridData(i, g_Dtl_tac_abacctcode_pk);
				if(l_data == "")
				{
					alert("Account code is not null" + "\n" + "Tài khoản kế toán thì không được rỗng!!!");
					return false ;							
				}
				l_data = Trim(grdDtl.GetGridData(i, g_Dtl_Inv_Net_Bk_Amt));
				if(l_data =="")
				{
					l_data = grdDtl.GetGridData(i, g_Dtl_Inv_Net_Tr_Amt);
					l_data = FormatCalculate(lstBook_Ccy.value, (Number(l_data) * l_tr_rate / l_bk_rate));
					grdDtl.SetGridText(i, g_Dtl_Inv_Net_Bk_Amt, l_data);
				}
			}
			return true ;	
		break ;
		case "3":
			var i ;
			for(i = 1; i < grdDtlVAT.rows ; i++)
			{
				if(grdDtlVAT.GetGridData(i, g_VAT_abacctcode_pk_vat)=="")
				{
					alert("VAT Account code is not null." + "\n" + "Tài khoản VAT thì không được rỗng.");
					return false ;		
				}	
			}
			return true ;
		break ;
	}	
}
//---------------------------------------------------------------
function OnSave(iCase)
{
	switch(iCase)
	{
		case '1': //save master
			if(ValidateData("1"))
			{
				if(g_insert)
				{
					grdMst.Call();					
					g_save = true ;
				}
				else
				{
					grdMst.StatusUpdate();
					grdMst.Call();
					g_save = true ;
				}
			}
		break ;
	}
}
//------------------------------------------------------------
function OnSearchTab()
{
	var lcurrtab = idTab_Child.GetCurrentPageNo();
	/*if(g_insert)
	{
		if(confirm("Do you want to save new AP slip?"))
		{	
			OnSave("1");
		}	
		else
		{
			g_insert = false ;
			//grdMst.Call("SELECT");
			dso_ap_list.Call("SELECT");
		}
	}
	else*/
	//{
		if(lcurrtab == 0)
		{
			dso_upd_grd_dtl_ap_domestic_item.Call("SELECT");
		}
		else if(lcurrtab == 1)
		{
			dso_upd_grd_dtl_ap_do.Call("SELECT");
		}
		else if(lcurrtab == 5)
		{
			dso_upd_grd_dtl_ap_vat.Call("SELECT");
		}
		else if(lcurrtab == 6)
		{
			dso_upd_grd_dtl_ap_enron_tax.Call("SELECT");
		}				
		else if(lcurrtab == 7)
		{
			dso_upd_grd_dtl_ap_pl.Call("SELECT");
		}
		else if(lcurrtab == 4)
		{
			dso_upd_grd_dtl_ap_allocate.Call("SELECT");
		}
		else if(lcurrtab == 2) // Import Tax
		{
			dso_upd_grd_dtl_imp.Call("SELECT");
		}	
		else if(lcurrtab == 3) // Excise Tax
		{
			dso_upd_grd_dtl_exc.Call("SELECT");
		}			
	//}
}
//------------------------------------------------------------
function OnDelete(iObj)
{
	if(iObj == "1")
	{		
		if(confirm("Do you want to delete this AP slip?"))
		{	
			grdMst.StatusDelete();
			g_delete = true ;
			grdMst.Call();			
		}			
	}
}
//------------------------------------------------------------
function OnChangeTransDT()
{
	var l_trdate = dtTransDT.text ;
	txtTransDT.text = l_trdate;
	OnDueDate();
	dso_get_rate.Call()
}
//------------------------------------------------------------
function Add_CtrlItem()
{
    var fg = grdInfor.GetGridControl();
    if (grdInfor.selrow > 0)
    {
        for (i = 1; i < grdInfor.rows; i++)
        {
            fg.RowSel = 0;
	        fg.isSelected (i) = false;
        }
    }
	grdInfor.AddRow();
	fg.RowSel = grdInfor.rows - 1;
	fg.isSelected (grdInfor.rows - 1) = true;
	grdInfor.SetGridText(grdInfor.rows - 1, 7, txtCRDA_pk.GetData());	
}
//------------------------------------------------------------
function PopupClickCtrl_Item()
{
    if ((event.col == 2) || (event.col == 3))
    {
		var path   = System.RootURL + "/standard/forms/60/09/60090010_CtrItem.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + '' + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60090010_popup_item_n" + '&col_code=Item Name' + '&col_nm=Item Name Local';
		aValue     = System.OpenModal( path, 500, 500, 'resizable:yes;status:yes');
		if (aValue != null) 
        {
            if (aValue.length > 0)
            {
                for (i = 0; i < 1; i++)
                {
                    var tmp = aValue[i];
                    if (tmp[0] != 0)
                    {
                        grdInfor.SetGridText(grdInfor.selrow, 1, tmp[0]);     // PK
                        grdInfor.SetGridText(grdInfor.selrow, 2, tmp[2]);     // Item Name
                        grdInfor.SetGridText(grdInfor.selrow, 3, tmp[3]);     // Item Name Local
                        grdInfor.SetGridText(grdInfor.selrow, 4, tmp[4]);     // InType
                        grdInfor.SetGridText(grdInfor.selrow, 6, "");         // Item
				        grdInfor.SetGridText(grdInfor.selrow, 9, "");         // Item NM
				        if (tmp[5] == 'N')
				        {
				            grdInfor.SetGridText(grdInfor.selrow + i, 5, 0); // DataType
				        }
				        else if (tmp[5]== 'D')
				        {
				            grdInfor.SetGridText(grdInfor.selrow + i, 5, 2); // DataType
				        }
				        else
				        {
				            grdInfor.SetGridText(grdInfor.selrow + i, 5, 1); // DataType
				        }
				        if (tmp[4] == "T" | tmp[4] == "C")
		                {
	                        if(tmp[4] == "T")
	                        {
		                        grdInfor.SetCellBgColor(grdInfor.selrow + i, 2, grdInfor.selrow + i, 6, 0xEFFFFF);	
	                        }
	                        else
	                        {
		                        grdInfor.SetCellBgColor(grdInfor.selrow + i, 2, grdInfor.selrow + i, 6, 0xF4E6E0);
	                        }
	                        grdInfor.SetRowEditable(grdInfor.selrow + i, false);
		                }
        		        if (tmp[2] == 'COMMERCIAL INVOICE NO')
		                {
		                    grdInfor.SetGridText(grdInfor.selrow + i, 6, txtinvoiceno.text );
		                }
		                else if (tmp[2] == 'SERIAL NO')
		                {							
							grdInfor.SetGridText(grdInfor.selrow + i, 6, txtserial.text );
		                }
		                else if (tmp[2] == 'COMMERCIAL INVOICE DATE')
		                {							
							grdInfor.SetGridText(grdInfor.selrow + i, 6, dtInvoiceDT.value );
		                }
		                else if (tmp[2] == 'CONTRACT NOAP')
		                {							
							grdInfor.SetGridText(grdInfor.selrow + i, 6, "POS0001" );
		                }						
                    }
                }
                for(i=1; i<aValue.length; i++)
                {
                    var tmp = aValue[i];
                    if (tmp[1] != 0)
                    {
                        grdInfor.AddRow();
                        grdInfor.SetGridText(grdInfor.selrow + i, 1, tmp[0]);     // PK
                        grdInfor.SetGridText(grdInfor.selrow + i, 2, tmp[2]);     // Item Name
                        grdInfor.SetGridText(grdInfor.selrow + i, 3, tmp[3]);     // Item Name Local
                        grdInfor.SetGridText(grdInfor.selrow + i, 4, tmp[4]);     // InType
                        grdInfor.SetGridText(grdInfor.selrow + i, 6, "");         // Item
				        grdInfor.SetGridText(grdInfor.selrow + i, 9, "");         // Item NM
				        if (tmp[5] == 'N')
				        {
				            grdInfor.SetGridText(grdInfor.selrow + i, 5, 0); // DataType
				        }
				        else if (tmp[5]== 'D')
				        {
				            grdInfor.SetGridText(grdInfor.selrow + i, 5, 2); // DataType
				        }
				        else
				        {
				            grdInfor.SetGridText(grdInfor.selrow + i, 5, 1); // DataType
				        }
				        if (tmp[4] == "T" | tmp[4] == "C")
		                {
	                        if(tmp[4] == "T")
	                        {
		                        grdInfor.SetCellBgColor(grdInfor.selrow + i, 2, grdInfor.selrow + i, 6, 0xEFFFFF);	
	                        }
	                        else
	                        {
		                        grdInfor.SetCellBgColor(grdInfor.selrow + i, 2, grdInfor.selrow + i, 6, 0xF4E6E0);
	                        }
	                        grdInfor.SetRowEditable(grdInfor.selrow + i, false);
		                }
        		        if (tmp[2] == 'COMMERCIAL INVOICE NO')
		                {
		                    grdInfor.SetGridText(grdInfor.selrow + i, 6, txtinvoiceno.text);
		                }
		                else if (tmp[2] == 'SERIAL NO')
		                {
							grdInfor.SetGridText(grdInfor.selrow + i, 6, txtserial.text );
		                }
		                else if (tmp[2] == 'COMMERCIAL INVOICE DATE')
		                {							
							grdInfor.SetGridText(grdInfor.selrow + i, 6, dtInvoiceDT.value );
		                }				
		                else if (tmp[2] == 'CONTRACT NOAP')
		                {							
							grdInfor.SetGridText(grdInfor.selrow + i, 6, "POS0001" );
		                }												
                    }
                }
                txtseq.GetControl().focus();
            }
        }
	}
	else if (event.col == 6)
	{
	    onDBList();
	}
}
//------------------------------------------------------------
function onDBList()
{
    var ctrl = grdInfor.GetGridControl();
    if ((grdInfor.GetGridData( ctrl.row, 4) == 'T') || (grdInfor.GetGridData(ctrl.row, 4) == 'C'))
	{
		if (grdInfor.GetGridData( ctrl.row, 4) == 'C')
		{
		    var ls_str = grdInfor.GetGridData(ctrl.row, 2);
			var temp = new Array();
            temp = ls_str.split(' ');
			var ls_temp = temp[0];
			
			var fpath   = System.RootURL + "/standard/forms/60/09/60090010_CtrItem2.aspx?comm_code="+ "" + "&comm_nm=" + ls_str + "&company=" + lstCompany.GetData() + '&dsqlid=sp_sel_pl_popup_plpk&col_code=' + ls_temp +" CODE" + '&col_nm=' + ls_temp + " NAME";
            var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
            if ( object != null )  
            {
                if (object[0] != 0)
                {
                    grdInfor.SetGridText(ctrl.row, 6, object[0]);
                    //grdInfor.SetGridText(ctrl.row, 8, object[2]); pk
                    //grdInfor.SetGridText(ctrl.row, 9, object[1]);
                }
            }
        }
        else
        {
            if (grdInfor.GetGridData( ctrl.row, 2) == 'CUSTOMER NAME')
	        {
	            var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx?com_pk='+lstCompany.value+'&AP=Y';
		        var object  = System.OpenModal( path ,800 , 550 , 'resizable:yes;status:yes');
		        if ( object != null )
		        {
		            if (object[0] != 0)
                    {
		                grdInfor.SetGridText(ctrl.row, 6, object[0]);
		                grdInfor.SetGridText(ctrl.row, 8, object[2]);
		                
		                grdInfor.SetGridText(ctrl.row, 9, object[1]);
		            }
                }
            }
            else if ( grdInfor.GetGridData(ctrl.row, 2)== "Bank Account No." || grdInfor.GetGridData( ctrl.row, 2 )== "DEPOSIT ACCOUNT NO" || grdInfor.GetGridData( ctrl.row, 2 )== "BANK ACCOUNT NUMBER" || grdInfor.GetGridData( ctrl.row, 2 )== "BANK ACCOUNT NO.")
	        {
	            var ls_ccy = txtcur.GetData();
	            var fpath   = System.RootURL + "/standard/forms/60/09/60090010_CtrItem2.aspx?comm_code="+ "" + "&comm_nm=" + "" + "&val1=" + ls_ccy + "&company="+ lstCompany.GetData() + '&dsqlid=ac_sel_60090010_bank_popup&col_code=' + 'Bank Code'  + '&col_nm=' + 'Bank Name';
                var object  = System.OpenModal(  fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                if (object != null)
                {
                    if (object[0] != 0)
                    {
                        grdInfor.SetGridText(ctrl.row, 6, object[0]);  // Item
                        grdInfor.SetGridText(ctrl.row, 8, object[4]);  // Table PK
                        grdInfor.SetGridText(ctrl.row, 9, object[1]);  // Table PK
                    }
                }
            } 
            else if (grdInfor.GetGridData( ctrl.row, 2)== "EMPLOYEE NAME")
            {
                var fpath   = System.RootURL + "/standard/forms/60/09/60090010_emp_name.aspx";
                var object  = System.OpenModal(  fpath , 800 , 500 , 'resizable:yes;status:yes'); 
                if ( object != null )  
                {
                    if (object[0] != 0)
                    {
                        grdInfor.SetGridText(ctrl.row,  6, object[2]) ; //Employee ID
                        grdInfor.SetGridText(ctrl.row,  8, object[0]) ; //Employee Name    
                        grdInfor.SetGridText(ctrl.row,  9, object[1]) ; //Employee CODE    
                    }
                }
            }
        }
    }
}
//------------------------------------------------------------------
function Save_CtrlItem()
{
    var i;
    if(grdInfor.rows > 1)
    {
        var mstPK = grdInfor.GetGridData(1, 7) ;
        for(i = 2; i < grdInfor.rows; i++)
        {
            grdInfor.SetGridText(i, 7, mstPK);
        }
    }        
    dso_upd_grd_dtl_ap_domestic_item.Call();
}
//------------------------------------------------------------------
function Delete_CtrlItem()
{
    var ctrl = grdInfor.GetGridControl();
    if (grdInfor.rows > 1)
    {
        var i = 1;
        var j = 1;
        var lb_flag = false;
        if (confirm('Are you sure you want to delete this Item ?'+'\n'+'Bạn có chắc muốn xóa Item này?'))
        {
            for ( i=1; i < ctrl.rows; i++ )
		    {
		        if (ctrl.isSelected(i) == true)
		        {
                    grdInfor.DeleteRow();
                }
            }
        }
    }
}
//------------------------------------------------------------------
function OnEditDtl()
{
	if(event.col == g_Dtl_UPrice || event.col == g_Dtl_Inv_Qty )	
	{
		var l_uprice = grdDtl.GetGridData(event.row, g_Dtl_UPrice);
		var l_qty = grdDtl.GetGridData(event.row, g_Dtl_Inv_Qty);
		var l_net_tramt = Number(l_uprice) * Number(l_qty); // trans amt
		var l_bk_rate = Number(txtBookRate.text);
		var l_tr_rate = Number(txtTransCcy.text);
		var l_net_bkamt = Number( l_net_tramt * l_tr_rate / l_bk_rate) ;		
		grdDtl.SetGridText(event.row, g_Dtl_Inv_Net_Tr_Amt, FormatCalculate(lstTransCcy.value, l_net_tramt));
		grdDtl.SetGridText(event.row, g_Dtl_Inv_Net_Bk_Amt, FormatCalculate(lstBook_Ccy.value, l_net_bkamt));		
		var l_sum_Inv_Net_Tr_Amt = 0, l_sum_Inv_Net_Bk_Amt = 0;
		var i;
		for(i = 1; i < grdDtl.rows; i++)
		{
			l_sum_Inv_Net_Tr_Amt += Number(grdDtl.GetGridData(i, g_Dtl_Inv_Net_Tr_Amt));
			l_sum_Inv_Net_Bk_Amt += Number(grdDtl.GetGridData(i, g_Dtl_Inv_Net_Bk_Amt));
		}
		lblTotal_FAMT.text = l_sum_Inv_Net_Tr_Amt.toFixed(3);
		lblTotal_AMT.text = l_sum_Inv_Net_Bk_Amt.toFixed(3);		
	}
	else if(event.col == g_Dtl_Inv_Net_Tr_Amt)
	{
		var l_net_tramt = grdDtl.GetGridData(event.row, g_Dtl_Inv_Net_Tr_Amt);
		var l_bk_rate = Number(txtBookRate.text);
		var l_tr_rate = Number(txtTransCcy.text);
		var l_net_bkamt = Number( l_net_tramt * l_tr_rate / l_bk_rate) ;		
		grdDtl.SetGridText(event.row, g_Dtl_Inv_Net_Bk_Amt, FormatCalculate(lstBook_Ccy.value, l_net_bkamt));
		var i;
		for(i = 1; i < grdDtl.rows; i++)
		{
			l_sum_Inv_Net_Tr_Amt += Number(grdDtl.GetGridData(i, g_Dtl_Inv_Net_Tr_Amt));
			l_sum_Inv_Net_Bk_Amt += Number(grdDtl.GetGridData(i, g_Dtl_Inv_Net_Bk_Amt));
		}
		lblTotal_FAMT.text = l_sum_Inv_Net_Tr_Amt.toFixed(3);
		lblTotal_AMT.text = l_sum_Inv_Net_Bk_Amt.toFixed(3);				
	}
}
//------------------------------------------------------------------
function FormatCalculate(ccy, pnum)
{
	var rValue =0 ;
	if(ccy == "VND")
	{
		rValue = Math.round(Number(pnum));
	}
	else
	{
		rValue = Math.round(Number(pnum) * 100)/100;
	}	
	return rValue;
}
//------------------------------------------------------------------
function OnFormatGrid()
{
	var fg = grdDtl.GetGridControl();
	fg.ColFormat(g_Dtl_UPrice) = "###,###.####R";
	if(lstTransCcy.value == 'VND')
	{
		fg.ColFormat(g_Dtl_Inv_Net_Tr_Amt) = "###,###,###R";
		fg.ColFormat(g_Dtl_Diff_Net_Tr_Amt) = "###,###,###R";
	}
	else
	{
		fg.ColFormat(g_Dtl_Inv_Net_Tr_Amt) = "###,###.##R";
		fg.ColFormat(g_Dtl_Diff_Net_Tr_Amt) = "###,###.##R";	
	}
	fg.ColFormat(g_Dtl_Act_Qty) = "###,###.###R";
	fg.ColFormat(g_Dtl_Inv_Qty) = "###,###.###R";
	fg.ColFormat(g_Dtl_Diff_Qty) = "###,###.###R";	
	if(lstBook_Ccy.value == "VND")
	{
		fg.ColFormat(g_Dtl_Inv_Net_Bk_Amt) = "###,###R";
		fg.ColFormat(g_Dtl_Diff_Net_Bk_Amt) = "###,###R";
	}	
	else
	{
		fg.ColFormat(g_Dtl_Inv_Net_Bk_Amt) = "###,###.##R";
		fg.ColFormat(g_Dtl_Diff_Net_Bk_Amt) = "###,###.##R";
	}
	if(fg.rows > 1)
	{
		fg.Cell(7, 1, g_Dtl_UPrice, fg.rows - 1, g_Dtl_UPrice) = 0x0000FF;
		fg.Cell(7, 1, g_Dtl_Inv_Qty, fg.rows - 1, g_Dtl_Inv_Qty) = 0x0000FF;
		fg.Cell(7, 1, g_Dtl_Inv_Net_Tr_Amt, fg.rows - 1, g_Dtl_Inv_Net_Tr_Amt) = 0x0000FF;
		fg.Cell(7, 1, g_Dtl_Inv_Net_Bk_Amt, fg.rows - 1, g_Dtl_Inv_Net_Bk_Amt) = 0x0000FF;	
	}
}
//------------------------------------------------------------------
function OnAdd_Item()
{
	if(lstGetData.value == "ED")
	{
		var fg = grdDtl.GetGridControl();
		grdDtl.AddRow();
		fg.IsSelected(grdDtl.rows - 1) = true ;
		fg.TopRow = grdDtl.rows - 1;
		grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Tac_crda_pk, txtCRDA_pk.text);
		grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Desc, txtDesc.text);
		grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Local_Desc, txtLocalDesc.text);
		grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_WH, txtWH_NM.text );
		grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_wh_pk, txtWH.text );
		if(chkCost.value == "T")
			grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Cost, "-1" );
		else
			grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Cost, "0" );
		grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_vat_rate, lstVATRate.value);     // VAT Rate       	
	}
	else if(lstGetData.value == "PO")
	{
	    var i, v_tr_rate = 0, v_book_amt = 0  ;
		var fpath   = System.RootURL + "/standard/forms/60/09/60090010_GetPO.aspx?tco_company_pk=" + lstCompany.value + "&trans_date=" + dtTransDT.value + "&vendor_pk=" + txtVendorPK.GetData() + "&vendor_cd=" + txtVendorCD.GetData() + "&vendor_nm=" + txtVendorNM.GetData();
		var object  = System.OpenModal(fpath, 1100,700, 'resizable:yes;status:yes'); 
		var l_bk_rate = Number(txtBookRate.text);
		v_tr_rate = Number(txtTransCcy.GetData());
		if ( object != null )  
		{
			if (object[0] != null)
			{
				
				
				var l_Tmp = new Array();
				for(i = 0; i < object.length; i++)
				{
					l_Tmp = object[i];
					grdDtl.AddRow();
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_tco_item_pk, l_Tmp[13]);
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Item_Code, l_Tmp[3]);
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Item_Name, l_Tmp[4]);
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Unit, l_Tmp[5]);
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_UPrice, l_Tmp[7]);
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Inv_Qty, l_Tmp[11]);
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Inv_Net_Tr_Amt, FormatCalculate(lstTransCcy.value, Number(l_Tmp[15]))); // Trans Amt									
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_mat_famt, l_Tmp[15]);									
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Order_No, l_Tmp[2]);
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Act_Qty, l_Tmp[8]);
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Diff_Qty, Number(l_Tmp[8]) - Number(l_Tmp[11]) );
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_mattakein_pk, l_Tmp[24] );
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Desc, txtDesc.text );
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Local_Desc, txtLocalDesc.text );
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Tac_crda_pk, txtCRDA_pk.text );
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_mat_pk, l_Tmp[13] );
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_tac_abacctcode_pk, l_Tmp[16] );
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Ac_CD, l_Tmp[17] );
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Ac_NM, l_Tmp[18] );
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_WH, l_Tmp[20] );
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_wh_pk, l_Tmp[19] );					
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_tac_abplcenter_pk, l_Tmp[21] );		
                    v_book_amt = Number(v_tr_rate * Number(l_Tmp[15]) / l_bk_rate);  // Book Amt
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Inv_Net_Bk_Amt, FormatCalculate(lstBook_Ccy.value, v_book_amt ));					
					if(chkCost.value == "T")
						grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Cost, "-1" );
					else
						grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Cost, "0" );				
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_tac_abplcenter_pk, l_Tmp[21] );						
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_vat_rate, l_Tmp[26] );						
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_seq_item, l_Tmp[28] );
				}
			}
		}		
	}
	else if(lstGetData.value == "IE")
	{
		var fpath   = System.RootURL + "/standard/forms/60/09/60090010_GetImpContract.aspx?tco_company_pk=" + lstCompany.value;
		var object  = System.OpenModal(fpath, 900, 600, 'resizable:yes;status:yes'); 
		if ( object != null )  
		{
			var i;
			var l_arr = new Array();
			for(i = 0; i < object.length; i++)
			{
				l_arr = object[i];
				grdDtl.AddRow();
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Order_No, l_arr[2]);
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_tco_item_pk, l_arr[1]);
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Item_Code, l_arr[3]);
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Item_Name, l_arr[4]);
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Unit, l_arr[5]);
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_UPrice, l_arr[6]);
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Inv_Qty, l_arr[7]);
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Inv_Net_Tr_Amt, l_arr[8]);				
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Tac_crda_pk, txtCRDA_pk.text );
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Desc, txtDesc.text );
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Local_Desc, txtLocalDesc.text );				
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_tac_cinv_ap, l_arr[0] );
			}
		}	
	}
	else if(lstGetData.value == "O1")
	{
		var fpath   = System.RootURL + "/standard/forms/gf/da/gfda00010_getdata_SH.aspx" ;
		var object  = System.OpenModal(fpath, 900, 600, 'resizable:yes;status:yes'); 
		if ( object != null )  
		{
			var i;
			
			for(i = 0; i < object.length; i++)
			{				
				var arr = new Array();
				arr = object[i];
				grdDtl.AddRow();
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Order_No, arr[16]);
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Item_Code, arr[7]);
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Item_Name, arr[8]);
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_tco_item_pk, arr[9]);
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_UPrice, arr[11]);
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Inv_Qty, arr[10]);
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Inv_Net_Tr_Amt, arr[12]);
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Desc, txtDesc.text );
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Local_Desc, txtLocalDesc.text );
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Tac_crda_pk, txtCRDA_pk.text);
				//grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_tac_rec_d_crdad_pk, arr[0]);									
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_WH, txtWH_NM.text );
				grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_wh_pk, txtWH.text );
				
				if(chkCost.value == "T")
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Cost, "-1" );
				else
					grdDtl.SetGridText(grdDtl.rows - 1, g_Dtl_Cost, "0" );				
			}
		}		
	}
}
//------------------------------------------------------------------
function Popup_Item()
{
    //alert(lstVATRate.value);
    if(Number(txtCRDA_pk.text) < 1)
    {
        alert('Please choose the AP Master ...');
        return ;        
    }                
    var i = 0;
    var fpath   = System.RootURL + "/standard/forms/60/09/60090010_item2_popup.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + '' + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60090010_tco_item" + '&col_code=Item Code' + '&col_nm=Item Name';
    aValue      = System.OpenModal(  fpath , 900 , 700 , 'resizable:yes;status:yes');	
    if ( aValue != null ) 
    {
        if (aValue.length > 0)
        {
            for (i = 0; i < 1; i++)
            {
                var tmp = aValue[i];
                if (tmp[0] != 0)
                {
                    grdDtl.SetGridText(grdDtl.selrow, g_Dtl_tco_item_pk, tmp[0]);     // PK
                    grdDtl.SetGridText(grdDtl.selrow, g_Dtl_Item_Code, tmp[1]);     // Item Code
                    grdDtl.SetGridText(grdDtl.selrow, g_Dtl_Item_Name, tmp[2]);     // Item Name Local
                    grdDtl.SetGridText(grdDtl.selrow, g_Dtl_tac_abacctcode_pk, tmp[9]); // tac_abacctcode_pk
                    grdDtl.SetGridText(grdDtl.selrow, g_Dtl_Ac_CD, tmp[7]);     // ac_cd
                    grdDtl.SetGridText(grdDtl.selrow, g_Dtl_Ac_NM, tmp[8]);     // ac_nm
                    grdDtl.SetGridText(grdDtl.selrow, g_Dtl_Unit, tmp[5]);     // UOM
                    grdDtl.SetGridText(grdDtl.selrow, g_Dtl_UPrice, tmp[6]);     // Price  
                    //alert(lstVATRate.value);
                    
                }
            }
            for(i = 1; i < aValue.length; i++)
            {
                var tmp = aValue[i];
                if (tmp[0] != 0)
                {
                    grdDtl.AddRow();
                    grdDtl.SetGridText(grdDtl.selrow + i, g_Dtl_Tac_crda_pk, txtCRDA_pk.text );
                    grdDtl.SetGridText(grdDtl.selrow + i, g_Dtl_tco_item_pk, tmp[0]);                      // PK
                    grdDtl.SetGridText(grdDtl.selrow + i, g_Dtl_Item_Code, tmp[1]);  // Item Code
                    grdDtl.SetGridText(grdDtl.selrow + i, g_Dtl_Item_Name, tmp[2]);  // Item Name Local
                    grdDtl.SetGridText(grdDtl.selrow + i, g_Dtl_tac_abacctcode_pk, tmp[9]);     // tac_abacctcode_pk
                    grdDtl.SetGridText(grdDtl.selrow + i, g_Dtl_Ac_CD, tmp[7]);     // ac_cd
                    grdDtl.SetGridText(grdDtl.selrow + i, g_Dtl_Ac_NM, tmp[8]);     // ac_nm
                    grdDtl.SetGridText(grdDtl.selrow + i, g_Dtl_Unit, tmp[5]);     // UOM
                    grdDtl.SetGridText(grdDtl.selrow + i, g_Dtl_UPrice, tmp[6]);     // Price                                        
					grdDtl.SetGridText(grdDtl.selrow + i, g_Dtl_Desc, txtDesc.text);
					grdDtl.SetGridText(grdDtl.selrow + i, g_Dtl_Local_Desc, txtLocalDesc.text);	
					grdDtl.SetGridText(grdDtl.selrow + i, g_Dtl_vat_rate, lstVATRate.value);     // VAT Rate				
                }
            }
            txtseq.GetControl().focus();
        }
    }
    else
    {
        txtseq.GetControl().focus();
    }
}
//------------------------------------------------------------
function OnDblClickDtlItem()
{
	if(event.col == g_Dtl_Item_Code)
	{
		Popup_Item();
	}
	else if(event.col == g_Dtl_Ac_CD)
	{
		Popup_AccDtl();
	}
	else if(event.col == g_Dtl_WH )
	{
		Popup_WH();
	}
}
//------------------------------------------------------------
function Popup_AccDtl()
{
    var fpath = System.RootURL + "/standard/forms/60/09/60090010_AccountAP.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60090010_acn_ap_popup";
    o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
    if (o != null)
    {
        if(o[0] != 0)
        {
            grdDtl.SetGridText(grdDtl.selrow, g_Dtl_tac_abacctcode_pk, o[3]);
            grdDtl.SetGridText(grdDtl.selrow, g_Dtl_Ac_CD, o[0]);
            grdDtl.SetGridText(grdDtl.selrow, g_Dtl_Ac_NM, o[1]);
        }
        txtseq.GetControl().focus();
    }
    else
    {
        txtseq.GetControl().focus();
    }
}
//------------------------------------------------------------
function Popup_WH()
{
    var lrow = event.row ;
    var lcol = event.col ;
    var fpath   = System.RootURL + "/standard/forms/60/09/60090010_GetWareHouse.aspx?company_pk=" + lstCompany.value ;
    aValue      = System.OpenModal(  fpath , 800 , 400 , 'resizable:yes;status:yes');	
    if ( aValue != null ) 
    {
        grdDtl.SetGridText(lrow, g_Dtl_wh_pk, aValue[0]);
        grdDtl.SetGridText(lrow, g_Dtl_WH, aValue[2]);
    }    
	
}
//------------------------------------------------------------
function OnSave_Item()
{
	if(ValidateData('2'))
	{
		dso_upd_grd_dtl_ap_do.Call();
	}		
}
//------------------------------------------------------------
function OnCheckCost()
{
	if(chkCost.value == "F" )
	{
		var i;
		for(i = 1; i < grdDtl.rows; i++)
		{
			grdDtl.SetGridText(i, g_Dtl_Cost, "0");			
		}
	}
	else
	{
		var i;
		for(i = 1; i < grdDtl.rows; i++)
		{
			grdDtl.SetGridText(i, g_Dtl_Cost, "-1");
		}	
	}
}
//------------------------------------------------------------
function OnFormatGrid_VAT()
{
	var fg = grdDtlVAT.GetGridControl();
	
	fg.ColFormat(g_VAT_TAX_VAT_Amt) = "###,###R";
	if(lstBook_Ccy.value == "VND")
	{
		fg.ColFormat(g_VAT_CalAmt) = "###,###R";
		fg.ColFormat(g_VAT_VAT_Books_Amt) = "###,###R";
	}	
	else
	{
		fg.ColFormat(g_VAT_CalAmt) = "###,###.##R";
		fg.ColFormat(g_VAT_VAT_Books_Amt) = "###,###.##R";
	}
	if(lstTransCcy.value == 'VND')
	{
		fg.ColFormat(g_VAT_CalAmtTax) = "###,###,###R";
		fg.ColFormat(g_VAT_CalTaxNetVAT) = "###,###,###R";
		fg.ColFormat(g_VAT_VATTransAmt) = "###,###,###R";		
	}
	else
	{
		fg.ColFormat(g_VAT_CalAmtTax) = "###,###.##R";
		fg.ColFormat(g_VAT_CalTaxNetVAT) = "###,###.##R";
		fg.ColFormat(g_VAT_VATTransAmt) = "###,###.##R";
	}
}
//------------------------------------------------------------------
function OnFormat_ENRONTax()
{
	var fg = grdDtlEnvTax.GetGridControl();
	fg.ColFormat(g_env_net_trans_amt) = "###,###,###R";	
	fg.ColFormat(g_env_net_books_amt) = "###,###,###R";	
	fg.ColFormat(g_env_net_vnd_amt) = "###,###,###R";	
	fg.ColFormat(g_env_tax_trans_amt) = "###,###,###R";	
	fg.ColFormat(g_env_tax_books_amt) = "###,###,###R";	
	fg.ColFormat(g_env_tax_vnd_amt) = "###,###,###R";	
	var i , l_trans_amt = 0, l_books_amt = 0;
	for(i = 1; i < grdDtlEnvTax.rows; i++)
	{
		l_trans_amt += Number(grdDtlEnvTax.GetGridData(i, g_env_tax_books_amt));
		l_books_amt += Number(grdDtlEnvTax.GetGridData(i, g_env_tax_vnd_amt));
	}
	txtTotEnvTrAmt.SetDataText(l_trans_amt);
	txtTotEnvBkAmt.SetDataText(l_books_amt);
}
//------------------------------------------------------------

function OnEditDtl_VAT()
{
	var i, v_tot_trans_amt = 0, v_tot_books_amt = 0 ;
	if(event.col == g_VAT_TaxRate)
	{
		var l_trrate = Number(txtTransCcy.text);
		var l_bkrate = Number(txtBookRate.text);
		var l_tr_amt = Number(grdDtlVAT.GetGridData(event.row, g_VAT_CalAmtTax));	
		var l_vat_rate = grdDtlVAT.GetGridData(event.row, g_VAT_TaxRate);	
		if(l_vat_rate == "01")// || l_vat_rate == "NO")//none VAT
		{
			grdDtlVAT.SetGridText(event.row, g_VAT_VATTransAmt, "");
			grdDtlVAT.SetGridText(event.row, g_VAT_VAT_Books_Amt, "");
			grdDtlVAT.SetGridText(event.row, g_VAT_TAX_VAT_Amt, "");
		}
		else if(l_vat_rate.toUpperCase() == "NO")
		{
			grdDtlVAT.SetGridText(event.row, g_VAT_VATTransAmt, "0");
			grdDtlVAT.SetGridText(event.row, g_VAT_VAT_Books_Amt, "0");
			grdDtlVAT.SetGridText(event.row, g_VAT_TAX_VAT_Amt, "0");
		}
		else		
		{
			l_vat_rate = Number(l_vat_rate);
			var l_vat_trans = Number(l_tr_amt * l_vat_rate / 100) ;
			
			var l_net_books = Number(grdDtlVAT.GetGridData(event.row, g_VAT_CalAmt));
			var l_vat_books = Number(l_net_books * l_vat_rate / 100 );
			l_vat_books = FormatCalculate(lstBook_Ccy.value, l_vat_books);
			var l_vat_vnd = 0 ;
			if(lstBook_Ccy.value == 'VND')
			{
				l_vat_vnd = l_vat_books ;
			}
			else
			{
				l_vat_vnd = Number(l_net_books * l_bkrate) * l_vat_rate / 100 ;
			}
			//alert(l_vat_vnd);
			l_vat_vnd = FormatCalculate("VND", l_vat_vnd);
			l_vat_trans = FormatCalculate(lstTransCcy.value, l_vat_trans);									
			grdDtlVAT.SetGridText(event.row, g_VAT_VATTransAmt, l_vat_trans);
			grdDtlVAT.SetGridText(event.row, g_VAT_VAT_Books_Amt, l_vat_books);
			grdDtlVAT.SetGridText(event.row, g_VAT_TAX_VAT_Amt, l_vat_vnd);
			
		}
		for( i = 1; i < grdDtlVAT.rows ; i++)
		{
			v_tot_trans_amt += Number(grdDtlVAT.GetGridData(i, g_VAT_VATTransAmt));
			v_tot_books_amt += Number(grdDtlVAT.GetGridData(i, g_VAT_VAT_Books_Amt));
		}
		txtTotTrAmt.SetDataText(v_tot_trans_amt);
		txtTotBkAmt.SetDataText(v_tot_books_amt);
	}
	else if(event.col == g_VAT_VATTransAmt)
	{
		var l_trrate = Number(txtTransCcy.text);
		var l_bkrate = Number(txtBookRate.text);	
		var l_vat_trans = Number(grdDtlVAT.GetGridData(event.row, g_VAT_VATTransAmt)) ;
		//var l_vat_books = Number(l_vat_trans * l_trrate / l_bkrate);
		//l_vat_books = FormatCalculate(lstBook_Ccy.value, l_vat_books);
		var l_vat_vnd = Number(l_vat_trans * l_trrate);
		l_vat_vnd = FormatCalculate("VND", l_vat_vnd);		
		//grdDtlVAT.SetGridText(event.row, g_VAT_VAT_Books_Amt, l_vat_books);
		grdDtlVAT.SetGridText(event.row, g_VAT_TAX_VAT_Amt, l_vat_vnd);		
		
		var l_vat_rate = "";
		l_vat_rate = grdDtlVAT.GetGridData(event.row, g_VAT_TaxRate) ;
		var l_net_books = Number(grdDtlVAT.GetGridData(event.row, g_VAT_CalAmt));
		var l_vat_books = 0 ; //Number(l_net_books * l_vat_rate / 100 );
		if(l_vat_rate != "01" && l_vat_rate != "NO" )
		{
			l_vat_books = Number(l_net_books * Number(l_vat_rate) / 100 );			
		}
		else
		{
			l_vat_books = 0 ;
		}		
		l_vat_books = FormatCalculate(lstBook_Ccy.value, l_vat_books);	
		grdDtlVAT.SetGridText(event.row, g_VAT_VAT_Books_Amt, l_vat_books);
		// Sum VAT Amount
		for( i = 1; i < grdDtlVAT.rows ; i++)
		{
			v_tot_trans_amt += Number(grdDtlVAT.GetGridData(i, g_VAT_VATTransAmt));
			v_tot_books_amt += Number(grdDtlVAT.GetGridData(i, g_VAT_VAT_Books_Amt));
		}
		txtTotTrAmt.SetDataText(v_tot_trans_amt);
		txtTotBkAmt.SetDataText(v_tot_books_amt);		
	}	
	else if(event.col == g_VAT_VAT_Books_Amt)
	{
		var l_vat_books = Number(grdDtlVAT.GetGridData(event.row, g_VAT_VAT_Books_Amt)) ;	
		var l_bkrate = Number(txtBookRate.text);
		var l_vat_tax_VND = Math.round(Number(l_vat_books * l_bkrate)) ;
		grdDtlVAT.SetGridText(event.row, g_VAT_TAX_VAT_Amt, l_vat_tax_VND);
		for( i = 1; i < grdDtlVAT.rows ; i++)
		{
			v_tot_trans_amt += Number(grdDtlVAT.GetGridData(i, g_VAT_VATTransAmt));
			v_tot_books_amt += Number(grdDtlVAT.GetGridData(i, g_VAT_VAT_Books_Amt));
		}
		txtTotTrAmt.SetDataText(v_tot_trans_amt);
		txtTotBkAmt.SetDataText(v_tot_books_amt);				
	}	
}
//------------------------------------------------------------------
function OnSave_VAT()
{
	if(ValidateData("3"))
	{
		dso_upd_grd_dtl_ap_vat.Call();
	}	
}
//------------------------------------------------------------------
function OnDblClickDtlVAT()
{
	if(event.col == g_VAT_VAT_Acc_Code)
	{
		var fpath = System.RootURL + "/standard/forms/60/09/60090010_AccountAP.aspx?comm_nm=" + "" + "&comm_code=" + "133" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60090010_acn_ap_popup";
		o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
		if (o != null)
		{
			if(o[0] != 0)
			{
				grdDtlVAT.SetGridText(grdDtlVAT.selrow, g_VAT_abacctcode_pk_vat, o[3]);
				grdDtlVAT.SetGridText(grdDtlVAT.selrow, g_VAT_VAT_Acc_Code, o[0]);
				grdDtlVAT.SetGridText(grdDtlVAT.selrow, g_VAT_VAT_Acc_NM, o[1]);
			}
		}		
	}
}
//------------------------------------------------------------------
function OnDblClickDtlPL()
{
	if(event.col == g_PL_PLCode)
	{
        var fpath   = System.RootURL + "/standard/forms/60/09/60090010_CtrItem2.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=sp_sel_pl_popup_plpk&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
        var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
        if ( object != null )  
        {
            if (object[0] != 0)
            {
                grdDtlPL.SetGridText(grdDtlPL.selrow, g_PL_tac_abplcenter_pk, object[2]);     // PK
                grdDtlPL.SetGridText(grdDtlPL.selrow, g_PL_PLCode, object[0]);     // Item Code
                grdDtlPL.SetGridText(grdDtlPL.selrow, g_PL_PLName, object[1]);     // Item Name Local
            }
        }
	}
}
//------------------------------------------------------------------
function OnSave_PL()
{
	dso_upd_grd_dtl_ap_pl.Call();
}
//------------------------------------------------------------------
function OnEditDtl_Allocate()
{
	if(event.col == g_Alc_CalTransAmt)
	{
		var l_ratio = grdDtlAllocate.GetGridData(event.row, g_Alc_Ratio);
		var l_tr_amt = grdDtlAllocate.GetGridData(event.row, g_Alc_CalTransAmt);
		var l_bk_amt = grdDtlAllocate.GetGridData(event.row, g_Alc_CalBookAmt);
		var l_allo_tramt = Number(l_tr_amt) * Number(l_ratio) / 100;
		var l_allo_bkamt = Number(l_bk_amt) * Number(l_ratio) / 100;
		l_allo_tramt = FormatCalculate(lstTransCcy.value, l_allo_tramt);
		l_allo_bkamt = FormatCalculate(lstBook_Ccy.value, l_allo_bkamt);
		grdDtlAllocate.SetGridText(event.row, g_Alc_AlcTransAmt, l_allo_tramt);
		grdDtlAllocate.SetGridText(event.row, g_Alc_AlcBooksAmt, l_allo_bkamt);
	}
}
//------------------------------------------------------------------
function OnDivideAllocate()
{
	var l_allo_fee = 0 ;
	var i;
	var l_tot_tr_amt = 0, l_allo_tr_amt = 0, l_cal_tr_amt = 0, l_cal_bk_amt = 0;
	var l_tot_bk_amt = 0, l_allo_bk_amt = 0;
	
	var l_tr_rate = 0;
	
	if(chkFOB_YN.value == 'T')
	{
		l_tr_rate = Number(txtExRate.GetData());
	}
	else
	{
		l_tr_rate = Number(txtTransCcy.GetData());
	}
	l_allo_fee = Number(txtAlcTrAmt.GetData());
	
	var l_bk_rate = Number(txtBookRate.GetData());	
	var l_allo_fee_bk = Number(l_allo_fee) * l_tr_rate / l_bk_rate ;
	
	l_allo_fee_bk = FormatCalculate(lstBook_Ccy.value, l_allo_fee_bk);	
	txtAlcBkAmt.text = l_allo_fee_bk ;
	
	for(i = 1; i < grdDtlAllocate.rows; i++)
	{
		l_tot_tr_amt += Number(grdDtlAllocate.GetGridData(i, g_Alc_CalTransAmt));		
		l_tot_bk_amt += Number(grdDtlAllocate.GetGridData(i, g_Alc_CalBookAmt));
	}
	var l_sum_nsub1 = 0, l_sum_nsub1_bk = 0;
	for(i = 1; i < grdDtlAllocate.rows - 1; i++)
	{
		l_cal_tr_amt = Number(grdDtlAllocate.GetGridData(i, g_Alc_CalTransAmt));
		l_allo_tr_amt = Number(l_allo_fee * l_cal_tr_amt / l_tot_tr_amt);
		l_allo_tr_amt = FormatCalculate(lstTransCcy.value, l_allo_tr_amt);
		grdDtlAllocate.SetGridText(i, g_Alc_AlcTransAmt, l_allo_tr_amt);
		l_cal_bk_amt = Number(grdDtlAllocate.GetGridData(i, g_Alc_CalBookAmt));
		l_allo_bk_amt = Number(l_allo_fee_bk * l_cal_bk_amt / l_tot_bk_amt);
		l_allo_bk_amt = FormatCalculate(lstBook_Ccy.value, l_allo_bk_amt);
		grdDtlAllocate.SetGridText(i, g_Alc_AlcBooksAmt, l_allo_bk_amt);
		l_sum_nsub1 += l_allo_tr_amt ;
		l_sum_nsub1_bk += l_allo_bk_amt ;
	}
	if(grdDtlAllocate.rows > 1)
	{
		grdDtlAllocate.SetGridText(grdDtlAllocate.rows - 1, g_Alc_AlcTransAmt, l_allo_fee - l_sum_nsub1);
		grdDtlAllocate.SetGridText(grdDtlAllocate.rows - 1, g_Alc_AlcBooksAmt, l_allo_fee_bk - l_sum_nsub1_bk);
	}	
	//percentage Ratio
	l_sum_nsub1 = 0; 
	for(i = 1; i < grdDtlAllocate.rows - 1; i++)
	{
		l_allo_tr_amt = grdDtlAllocate.GetGridData(i, g_Alc_AlcTransAmt);
		if(l_allo_fee != 0)
		{
			l_cal_tr_amt = Number(l_allo_tr_amt * 100 / l_allo_fee) ;
		}
		else
		{
			l_cal_tr_amt = 0 ;
		}	
		l_cal_tr_amt = Math.round(l_cal_tr_amt * 100 / 100);
		l_sum_nsub1 += l_cal_tr_amt ;
		grdDtlAllocate.SetGridText(i, g_Alc_Ratio, l_cal_tr_amt);
	}
	if(grdDtlAllocate.rows > 1)
	{
	
		grdDtlAllocate.SetGridText(grdDtlAllocate.rows - 1, g_Alc_Ratio, 100 - l_sum_nsub1);
	}	
}
//------------------------------------------------------------------
function OnFormat_Allocate()
{
	var fg = grdDtlAllocate.GetGridControl();
	fg.ColFormat(g_Alc_CalTransAmt) = "###,###.##R";
	fg.ColFormat(g_Alc_AlcTransAmt) = "###,###.##R";
	if(lstBook_Ccy.value == "VND")
	{
		fg.ColFormat(g_Alc_CalBookAmt) = "###,###R";
		fg.ColFormat(g_Alc_AlcBooksAmt) = "###,###R";
	}	
	else
	{
		fg.ColFormat(g_Alc_CalBookAmt) = "###,###.##R";
		fg.ColFormat(g_Alc_AlcBooksAmt) = "###,###.##R";
	}			
	
}
//------------------------------------------------------------------
function OnFormat_gridSearch()
{
	var fg = grdSearch.GetGridControl();
	fg.ColFormat(g_S_TotalTransAmount) = "###,###.###R";	
	if(lstBook_Ccy.value == "VND")
	{
		fg.ColFormat(g_S_TotalBooksAmount) = "###,###R";
	}	
	else
	{
		fg.ColFormat(g_S_TotalBooksAmount) = "###,###.##R";		
	}			
}
//------------------------------------------------------------------
function OnFormat_ImpTax()
{
	var fg = grdDtlImp.GetGridControl();					
	if(lstBook_Ccy.value == "VND")
	{
		fg.ColFormat(g_Imp_CalcAmt) = "###,###R";
		fg.ColFormat(g_Imp_TaxBooksAmt) = "###,###R";
	}	
	else
	{
		fg.ColFormat(g_Imp_CalcAmt) = "###,###.##R";
		fg.ColFormat(g_Imp_TaxBooksAmt) = "###,###.##R";
	}			
	fg.ColFormat(g_Imp_ImpTaxAmt) = "###,###,###R";
	if(lstTransCcy.value == 'VND')
	{
		fg.ColFormat(g_Imp_CalcAmtTax) = "###,###,###,###R";
		fg.ColFormat(g_Imp_CalcTaxNetTax) = "###,###,###R";	
		fg.ColFormat(g_Imp_TaxTransAmt) = "###,###,###R";
	}
	else
	{
		fg.ColFormat(g_Imp_CalcAmtTax) = "###,###,###,###.##R";
		fg.ColFormat(g_Imp_CalcTaxNetTax) = "###,###,###.##R";	
		fg.ColFormat(g_Imp_TaxTransAmt) = "###,###,###.##R";	
	}
	if(fg.rows > 1)
	{
		fg.Cell(7, 1, g_Imp_TaxRate, fg.rows - 1, g_Imp_TaxRate) = 0x0000FF;
	}
	var i ;
	var l_trans_amt = 0, l_books_amt = 0;
	for(i = 1; i < grdDtlImp.rows ; i++)
	{
		l_trans_amt += Number(grdDtlImp.GetGridData(i, g_Imp_TaxTransAmt));
		l_books_amt += Number(grdDtlImp.GetGridData(i, g_Imp_TaxBooksAmt));
	}
	txtTotTrAmtImp.text = l_trans_amt.toFixed(3);
	txtTotBkAmtImp.text = l_books_amt.toFixed(3)
}
//------------------------------------------------------------------
function OnFormat_ExcTax()
{
	var fg = grdDtlExc.GetGridControl();
	fg.ColFormat(g_Exc_CalcAmtTax) = "###,###.##R";	
	fg.ColFormat(g_Exc_CalcAmt) = "###,###,###R";	
	fg.ColFormat(g_Exc_CalcTaxNetExc) = "###,###.##R";	
	fg.ColFormat(g_Exc_ExcTransAmt) = "###,###.##R";	
	if(lstBook_Ccy.value == "VND")
	{
		fg.ColFormat(g_Exc_CalcAmt) = "###,###R";
		fg.ColFormat(g_Exc_ExcBooksAmt) = "###,###R";
	}	
	else
	{
		fg.ColFormat(g_Exc_CalcAmt) = "###,###.##R";
		fg.ColFormat(g_Exc_ExcBooksAmt) = "###,###.##R";
	}			
	if(fg.rows > 1)
	{
		fg.Cell(7, 1, g_Exc_ExcRate, fg.rows - 1, g_Exc_ExcRate) = 0x0000FF;
	}
	var i , l_trans_amt = 0, l_books_amt = 0;
	for(i = 1; i < grdDtlExc.rows; i++)
	{
		l_trans_amt += Number(grdDtlExc.GetGridData(i, g_Exc_ExcTransAmt));
		l_books_amt += Number(grdDtlExc.GetGridData(i, g_Exc_ExcBooksAmt));
	}
	txtTotTrAmtExc.text = l_trans_amt.toFixed(3);
	txtTotBkAmtExc.text = l_books_amt.toFixed(3);
}
//------------------------------------------------------------------
function OnStatusButtons()
{ 
	if(lstStatus.value == "1" ) // Saved
	{
		btnConfirm.SetEnable(true);
		ibtnSave.SetEnable(true);
		ibtnDelete.SetEnable(true);
		btnReplicate.SetEnable(false);
		ibtnPrint.SetEnable(false);
		btnCancel.SetEnable(false);
		btnAdd_More.SetEnable(true);
		btnSave_More.SetEnable(true);
		btnSave_More.SetEnable(true);
		btnNew_D.SetEnable(true);
		btnSave_D.SetEnable(true);
		btnDel_D.SetEnable(true);				
		btnSave_VAT.SetEnable(true);
		btnSave_PL.SetEnable(true);
		btnSave_Allocate.SetEnable(true);
		btnSave_Imp.SetEnable(true);
		chkCost.SetEnable(true);
	}
	if(lstStatus.value == "2" )//confirmed
	{
		btnConfirm.SetEnable(false);
		ibtnSave.SetEnable(false);
		ibtnDelete.SetEnable(false);
		btnReplicate.SetEnable(false);
		ibtnPrint.SetEnable(true);
		btnCancel.SetEnable(true);
		btnAdd_More.SetEnable(false);
		btnSave_More.SetEnable(false);
		btnSave_More.SetEnable(false);
		btnNew_D.SetEnable(false);
		btnSave_D.SetEnable(false);
		btnDel_D.SetEnable(false);				
		btnSave_VAT.SetEnable(false);
		btnSave_PL.SetEnable(false);
		btnSave_Allocate.SetEnable(false);	
		chkCost.SetEnable(false);		
		btnSave_Imp.SetEnable(false);
		btnSave_Exc.SetEnable(false);
		btnSave_Allocate.SetEnable(false);
		btnSave_VAT.SetEnable(false);
	}
	if(lstStatus.value == "0" || lstSliStatus.value == "4" )
	{
		btnConfirm.SetEnable(false);
		ibtnSave.SetEnable(false);
		ibtnDelete.SetEnable(false);
		btnReplicate.SetEnable(false);
		ibtnPrint.SetEnable(true);
		btnCancel.SetEnable(false);
		btnAdd_More.SetEnable(false);
		btnSave_More.SetEnable(false);
		btnSave_More.SetEnable(false);
		btnNew_D.SetEnable(false);
		btnSave_D.SetEnable(false);
		btnDel_D.SetEnable(false);				
		btnSave_VAT.SetEnable(false);
		btnSave_PL.SetEnable(false);
		btnSave_Allocate.SetEnable(false);
		chkCost.SetEnable(false);
	}
	if(lstStatus.value == "3" )
	{
		btnConfirm.SetEnable(false);
		ibtnSave.SetEnable(false);
		ibtnDelete.SetEnable(true);
		btnReplicate.SetEnable(true);
		ibtnPrint.SetEnable(false);
		btnCancel.SetEnable(false);
		btnAdd_More.SetEnable(false);
		btnSave_More.SetEnable(false);
		btnSave_More.SetEnable(false);
		btnNew_D.SetEnable(false);
		btnSave_D.SetEnable(false);
		btnDel_D.SetEnable(false);				
		btnSave_VAT.SetEnable(false);
		btnSave_PL.SetEnable(false);
		btnSave_Allocate.SetEnable(false);
		chkCost.SetEnable(false);
	}			
}
//------------------------------------------
function OnChangeMethod()
{	
	var l_method = "";
	if( grdDtl.rows > 1)
	{
		txtAPPO_Type.text = grdDtl.GetGridData(1, g_Dtl_APPO_Type);
	}
/*	if(Trim(txtAPPO_Type.text) == 'P' && grdDtl.rows > 1 && lstGetData.value != "PO")
	{
		lstGetData.value = "PO";
		l_method = "Get Data PO";
		var ctrl = grdDtl.GetGridControl();
		ctrl.ColWidth(g_Dtl_Order_No) = "1200";		
		alert("This Slip has already used " + l_method + " method!!!");	
		return ;
	}	
	if(txtAPPO_Type.text == 'E' && grdDtl.rows > 1 && lstGetData.value != "ED")	
	{
		lstGetData.value = "ED";
		l_method = "Enter Direct";
		var ctrl = grdDtl.GetGridControl();
		ctrl.ColWidth(g_Dtl_Order_No) = "0";				
		alert("This Slip has already used " + l_method + " method!!!");	
		return ;
	}		
	if(txtAPPO_Type.text == 'I' && grdDtl.rows > 1 && lstGetData.value != "IE")
	{
		lstGetData.value = "IE";
		l_method = "Get Import";
		var ctrl = grdDtl.GetGridControl();
		ctrl.ColWidth(g_Dtl_Order_No) = "0";				
		alert("This Slip has already used " + l_method + " method!!!");	
		return ;
	}
	if(txtAPPO_Type.text == 'S' && grdDtl.rows > 1 && lstGetData.value != "O1")
	{
		lstGetData.value = "O1";
		l_method = "Get data from Suheung";
		var ctrl = grdDtl.GetGridControl();
		ctrl.ColWidth(g_Dtl_Order_No) = "0";				
		alert("This Slip has already used " + l_method + " method!!!");	
		return ;
	}
*/	
	if(lstGetData.value == "ED" || lstGetData.value == "IE")
	{
		var ctrl = grdDtl.GetGridControl();
		ctrl.ColWidth(g_Dtl_Order_No) = "0";					
	}	
	else
	{
		var ctrl = grdDtl.GetGridControl();
		ctrl.ColWidth(g_Dtl_Order_No) = "1200";						
	}
}
//---------------------------------------------------
function OnDelete_Item()
{
	var i;
	var fg = grdDtl.GetGridControl();
	for(i = 1; i < grdDtl.rows; i++)
	{
		if(fg.IsSelected(i) == true)
		{
			grdDtl.DeleteRow(i);
		}
	}
}
//---------------------------------------------------
function OnConfirm()
{
	if(confirm("Are you sure you want to confirm this AP Slip?"))
	{
		lstCRDAPK.text = txtCRDA_pk.text + ",";
		txtIndex.text = "1";
		txtAPType.text = "OS";
		dso_crda_confirm.Call();
	}
}
//---------------------------------------------------
function OnCancell()
{	
	if(confirm("Are you sure you want to cancel this AP Slip?"))
	{
		lstCRDAPK.text = txtCRDA_pk.text + ",";
		txtIndex.text = "1";
		txtAPType.text = "OS";
		dso_upd_cancel.Call();
	}	
}
//---------------------------------------------------
function OnReplicate()
{
	if(confirm("Are you sure you want to replicate this AP Slip?"))
	{
		lstCRDAPK.text = txtCRDA_pk.text + ",";
		txtIndex.text = "1";
		txtAPType.text = "OS";
		dso_upd_replicate.Call();	
	}
}
//---------------------------------------------------
function OnEditDtl_Imp()
{
	if(event.col == g_Imp_TaxRate)
	{
		var l_tax_rate = grdDtlImp.GetGridData(event.row, g_Imp_TaxRate);	
		if(l_tax_rate == "01" || l_tax_rate == "NO")//none VAT
		{
			grdDtlImp.SetGridText(event.row, g_Imp_TaxTransAmt, "");
			grdDtlImp.SetGridText(event.row, g_Imp_TaxBooksAmt, "");			
		}
		else if(l_tax_rate == "01")
		{
			grdDtlImp.SetGridText(event.row, g_Imp_TaxTransAmt, "0");
			grdDtlImp.SetGridText(event.row, g_Imp_TaxBooksAmt, "0");
		}
		else		
		{
			l_tax_rate = Number(l_tax_rate);
			var l_tr_amt = grdDtlImp.GetGridData(event.row, g_Imp_CalcTaxNetTax); // Trans Amt
			var l_trrate = Number(txtTransCcy.text) ;
			var l_bkrate = Number(txtBookRate.text) ;
			var l_net_book = grdDtlImp.GetGridData(event.row, g_Imp_CalcAmt); // Books Amt
			var l_tax_trans = Number(l_tr_amt * l_tax_rate / 100) ;
			var l_tax_books = Number(l_net_book * l_tax_rate / 100) ; 		
			l_tax_trans = FormatCalculate(lstTransCcy.value, l_tax_trans);	
			l_tax_books = FormatCalculate(lstBook_Ccy.value, l_tax_books);			
			var l_tax_vnd = 	Number(l_tax_trans * l_trrate);
			l_tax_vnd = FormatCalculate("VND", l_tax_vnd);
			grdDtlImp.SetGridText(event.row, g_Imp_TaxTransAmt, l_tax_trans);
			grdDtlImp.SetGridText(event.row, g_Imp_TaxBooksAmt, l_tax_books);		
			grdDtlImp.SetGridText(event.row, g_Imp_ImpTaxAmt, l_tax_vnd);		
		}	
		OnSum_ImpTaxAmt();	
	}
	else if (event.col == g_Imp_TaxTransAmt)
	{
		var l_tax_trans = grdDtlImp.GetGridData(event.row, g_Imp_TaxTransAmt);
		var l_trrate = Number(txtTransCcy.text) ;
		var l_bkrate = Number(txtBookRate.text) ;
		var l_tax_books = Number(l_tax_trans * l_trrate / l_bkrate);
		l_tax_books = FormatCalculate(lstBook_Ccy.value, l_tax_books);
		var l_tax_vnd = Number(l_tax_trans * l_trrate);
		l_tax_vnd = FormatCalculate("VND", l_tax_vnd);
		grdDtlImp.SetGridText(event.row, g_Imp_ImpTaxAmt, l_tax_vnd);
		grdDtlImp.SetGridText(event.row, g_Imp_TaxBooksAmt, l_tax_books);		
		OnSum_ImpTaxAmt();	
	}
	else if (event.col == g_Imp_TaxBooksAmt)
	{
		var l_tax_books = Number(grdDtlImp.GetGridData(event.row, g_Imp_TaxBooksAmt));		
		var l_bkrate = Number(txtBookRate.text) ;
		var l_tax_vnd = Math.round(l_tax_books * l_bkrate) ;
		l_tax_vnd = FormatCalculate("VND", l_tax_vnd);
		grdDtlImp.SetGridText(event.row, g_Imp_ImpTaxAmt, l_tax_vnd);			
		OnSum_ImpTaxAmt();	
	}	
}
//---------------------------------------------------
function OnSum_ImpTaxAmt()
{
	var i, l_sum_tax_trans = 0, l_sum_tax_book = 0;
	for( i = 1; i < grdDtlImp.rows; i++)
	{
		l_sum_tax_trans += Number(grdDtlImp.GetGridData(i, g_Imp_TaxTransAmt));
		l_sum_tax_book += Number(grdDtlImp.GetGridData(i, g_Imp_TaxBooksAmt));
	}
	txtTotTrAmtImp.text = l_sum_tax_trans.toFixed(3);
	txtTotBkAmtImp.text = l_sum_tax_book.toFixed(3);
}
//---------------------------------------------------
function OnSave_ImpTax()
{
	dso_upd_grd_dtl_imp.Call();
}
//---------------------------------------------------
function OnEditDtl_Exc()
{
	var l_tax_rate = grdDtlExc.GetGridData(event.row, g_Exc_ExcRate);	
	if(l_tax_rate == "01" || l_tax_rate == "NO")//none 
	{
		grdDtlExc.SetGridText(event.row, g_Exc_ExcTransAmt, "");
		grdDtlExc.SetGridText(event.row, g_Exc_ExcBooksAmt, "");			
	}
	else if(l_tax_rate == "01")
	{
		grdDtlExc.SetGridText(event.row, g_Exc_ExcTransAmt, "0");
		grdDtlExc.SetGridText(event.row, g_Exc_ExcBooksAmt, "0");			
	}
	else		
	{
		l_tax_rate = Number(l_tax_rate);
		var l_tr_amt = grdDtlExc.GetGridData(event.row, g_Exc_CalcAmtTax);
		var l_trrate = Number(txtTransCcy.text) ;
		var l_bkrate = Number(txtBookRate.text) ;
		var l_tax_trans = Number(l_tr_amt * l_tax_rate / 100) ;
		var l_tax_books = Number(l_tax_trans * l_trrate / l_bkrate);		
		l_tax_trans = FormatCalculate(lstTransCcy.value, l_tax_trans);	
		l_tax_books = FormatCalculate(lstBook_Ccy.value, l_tax_books);			
		grdDtlExc.SetGridText(event.row, g_Exc_ExcTransAmt, l_tax_trans);
		grdDtlExc.SetGridText(event.row, g_Exc_ExcBooksAmt, l_tax_books);		
	}			
}
//---------------------------------------------------
function OnSave_Exc()
{
	dso_upd_grd_dtl_exc.Call();
}
//---------------------------------------------------
function OnEditDtl_Allocate()
{
	if(event.col == g_Alc_CalTransAmt)
	{
		var l_ratio = grdDtlAllocate.GetGridData(event.row, g_Alc_Ratio);
		var l_tr_amt = grdDtlAllocate.GetGridData(event.row, g_Alc_CalTransAmt);
		var l_bk_amt = grdDtlAllocate.GetGridData(event.row, g_Alc_CalBookAmt);
		var l_allo_tramt = Number(l_tr_amt) * Number(l_ratio) / 100;
		var l_allo_bkamt = Number(l_bk_amt) * Number(l_ratio) / 100;
		l_allo_tramt = FormatCalculate(lstTransCcy.value, l_allo_tramt);
		l_allo_bkamt = FormatCalculate(lstBook_Ccy.value, l_allo_bkamt);
		grdDtlAllocate.SetGridText(event.row, g_Alc_AlcTransAmt, l_allo_tramt);
		grdDtlAllocate.SetGridText(event.row, g_Alc_AlcBooksAmt, l_allo_bkamt);
	}
}
//------------------------------------------------------------------
function OnSave_Allocate()
{
	dso_upd_grd_dtl_ap_allocate.Call();
}
//------------------------------------------------------------------
function OnShowTAccount()
{
	if(txtseq.text != "")
	{
		if(lstStatus.value == "2" || lstStatus.value == "0")
		{
			var fpath = System.RootURL + '/standard/forms/60/09/60090030_popup.aspx?PK_ROW=' + txtseq.text + '&ROW=' + 1 + '&ROWS=&APPRCANCEL=';
			var wWidth = 950;
			var wHeight = 600;
			var x = Math.round((screen.availWidth - wWidth)/2);
			var y = Math.round((screen.availHeight - wHeight)/2);

			var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +"lef="+ x +",top=" + y;
			//this.name = "gfka00100_popup";
			var object = System.OpenModal(fpath, wWidth, wHeight, features, window);
		}
	}	
}
//------------------------------------------------------------------
function OnPrint(iCase)
{
	switch(iCase)
	{
		case '1':
			if(Number(txtseq.GetData()) > 0)
			{
				var url = System.RootURL + "/standard/reports/60/06/60060010_rpt_envn.aspx?seq=" + txtseq.GetData() ;
				System.OpenTargetPage(url);        			
			}	
		break ;
		case '2':			
            //var url = System.RootURL + "/standard/reports/gf/da/gfda00010_PaymentReq.aspx?tac_hgtrh_pk=" + txtseq.GetData() + "&tac_crda_pk=" + txtCRDA_pk.GetData() + "&company_pk=" + lstCompany.value ;
            //var url = System.RootURL + "/standard/reports/gf/da/AP_Freport.aspx?pk=" + txtCRDA_pk.GetData() ; // truyen pk            
			var url = System.RootURL + "/standard/reports/60/09/60090020_rpt_Freport.aspx?pk=" + txtCRDA_pk.GetData() + "&company_pk=" + lstCompany.value ;
            System.OpenTargetPage(url);        					
		break ;
	}
}

function OnDueDate()
{
    	var obj_num = Number(txtDueDate.GetData());
			if(obj_num < 0){alert('Due Date must > or = 0!');return false;}
			var str_date = dtTransDT.GetData();			
			dtDueDate.SetDataText(System.AddDate(dtTransDT.GetData(),obj_num));
    
   /* //case "txtDueDate":
			var obj_num = Number(txtDueDate.GetData());
			if(obj_num < 0){alert('Due Date must > or = 0!');return false;}
			var str_date = dtTransDT.GetData();
			var obj_date = new Date(parseInt(str_date.substring(0,4)), parseInt(str_date.substring(4,6))-1, parseInt(str_date.substring(6,8)));
			var end_date = new Date(obj_date);
			end_date.setDate(end_date.getDate() + obj_num);
			var str_date = end_date.getDate().toString();
			str_date = (str_date.length == 1)?'0' + str_date:str_date;
			var int_month = end_date.getMonth() + 1;
			var str_month = int_month.toString();
			str_month = (str_month.length == 1)?'0' + str_month:str_month;
			var str_yyyy = end_date.getFullYear();
			dtDueDate.value = str_yyyy + str_month + str_date;
			//break;	*/
            
}
//------------------------------------------------------------------
function OnEditDtl_ENVTax()
{
	var v_row = event.row ;
	var v_col = event.col ;
	var v_tax_trans = 0 ;
	if(v_col == g_env_tax_trans_amt)
	{
		//alert(v_tax_trans);
		v_tax_trans = grdDtlEnvTax.GetGridData( v_row, g_env_tax_trans_amt);
		grdDtlEnvTax.SetGridText(v_row, g_env_tax_books_amt, v_tax_trans);
		grdDtlEnvTax.SetGridText(v_row, g_env_tax_vnd_amt, v_tax_trans);
	}
}
//------------------------------------------------------------------
function OnSave_ENVTax()
{
	if(confirm('Are you sure you want to save data?'))
	{
		//dso_upd_grd_dtl_ap_enron_tax.Call();
	}
}
//-------------------------------------------------------------------
function OnChangeFOB()
{
	if(chkFOB_YN.value == "T") // checked FOB
	{
		if(grdDtlAllocate.rows > 1)
		{
			grdDtlAllocate.SetGridText(1, g_Alc_FOB_Price, 'Y');
			grdDtlAllocate.SetGridText(1, g_Alc_Ex_Rate, txtExRate.GetData() );
		}				
	}
	else
	{
		if(grdDtlAllocate.rows > 1)
		{
			grdDtlAllocate.SetGridText(1, g_Alc_FOB_Price, 'N');
			grdDtlAllocate.SetGridText(1, g_Alc_Ex_Rate, "" );
		}			
	}
}
//-------------------------------------------------------------------
</script>
<body>
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
    <gw:data id="dso_sel_booksrate" onreceive="onSetBookRate()"> 
        <xml> 
            <dso type="process" procedure="ac_PRO_60090030_GET_BOOKCCY">
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="txtTransDT"/>
                     <input bind="lstBookCcy_2"/>
                </input>  
                <output>
                     <output bind="txtBookRate_2"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dso_init_form" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60090030_get_acntcd_os">
                <input> 
                     <input bind="txtCompany_PK"/>
                     <input bind="txtGROUPID"/>
                     <input bind="txtFORMID"/>
                     <input bind="lstBookCcy_2"/>
                     <input bind="txtemp_pk"/>
                </input>  
                <output>
                     <output bind="txtTransTP_PK"/>
					 <output bind="txtTransTP_CD"/>
					 <output bind="txtTransTP_NM"/>
					 <output bind="txtacdr_pk"/>
					 <output bind="txtacdr_cd"/>
					 
					 <output bind="txtacdr_nm"/>
					 <output bind="txtaccr_pk"/>
					 <output bind="txtAPAC_CD"/>
					 <output bind="txtAPAC_NM"/>
					 <output bind="txtacvat_pk"/>
					 
					 <output bind="txtacvat_cd"/>
					 <output bind="txtacvat_nm"/>
					 <output bind="txtPersonNM_0" />
					 <output bind="txtImacpk" />
					 <output bind="txtImaccd" />
					 
					 <output bind="txtImacnm" />
					 <output bind="txtExacpk" />
					 <output bind="txtExaccd" />
					 <output bind="txtExacnm" />
					 <output bind="txtVATCustom_PK" />
					 
					 <output bind="txtVATCustom_CD" />
					 <output bind="txtVATCustom_NM" />
					 <output bind="txtBookRate_2"/>
					 <output bind="txtCompany_Rnt"/>
				 </output> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_get_rate" onreceive="SetCurrent()">
        <xml> 
            <dso type="process" procedure="ac_PRO_60090030_GET_RATE_DATE"> 
                <input> 
                     <input bind="txtTransDT"/>
                     <input bind="lstCompany"/>
                     <input bind="lstTransCcy" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtTransCcy"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_get_vat_ccy" onreceive="SetVATCCY()">
        <xml> 
            <dso type="process" procedure="ac_PRO_60090030_GET_RATE_DATE"> 
                <input> 
                     <input bind="txtTransDT"/>
                     <input bind="lstCompany"/>
                     <input bind="lstVATCurr" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtVATCurrRate"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dso_ap_list" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60090030_crda_search_os" >
                <input bind="grdSearch">
                    <input bind="lstCompany"/>
                    <input bind="dtTrDatefr" />
                    <input bind="dtTrDateto" />
					<input bind="lstSliStatus" />
					<input bind="txtVoucherNo_Sr" />
					
					<input bind="txtVendorPK_1" />
					<input bind="txtSeq_1" />
					<inout bind="txtdeclareno_Sr" />
					<inout bind="txtinvoiceno_Sr" />					
                </input>
                <output bind="grdSearch"/>
            </dso>
        </xml>
    </gw:data>
	<gw:data id="grdMst" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="control" parameter="0,1,2,3,5,9,12,15,18,21,22,23,24,26,29,30,31,34,37,39,41,42,43,44,45,47,50,51,52" function="ac_sel_60090030_mst_os" procedure="ac_upd_60090030_mst_os" > 
				<inout>
					<inout bind="txtCRDA_pk" /> 
					<inout bind="lstCompany" />
					<inout bind="txtvoucher_no" />
					<inout bind="lstVoucherType" />
					<inout bind="txtseq" />
					
					<inout bind="dtTransDT" />
					<inout bind="lstStatus" />
					<inout bind="txtPersonCD" />
					<inout bind="txtPersonNM" />
					<inout bind="txtemp_pk" />
					
					<inout bind="txtVendorCD" />
					<inout bind="txtVendorNM" />
					<inout bind="txtVendorPK" />
					<inout bind="txtDeliverCD" />
					<inout bind="txtDeliverNM" />
					
					<inout bind="txtDeliverPK" />
					<inout bind="txtChargerCD" />                
					<inout bind="txtChargerNM" />
					<inout bind="txtChargerPK" />		
					<inout bind="txtContactCD" />
					
					<inout bind="txtContactNM" />
					<inout bind="txtContactPK" />
					<inout bind="txtBookRate" />
					<inout bind="lstTransCcy" />
					<inout bind="txtTransCcy" />
					
					<inout bind="txtEnclose" />
					<inout bind="txtAPaccPK" />
					<inout bind="txtAPacc" />
					<inout bind="txtAPaccNM" />
					<inout bind="txtDesc" />
					
					<inout bind="txtLocalDesc" />
					<inout bind="txtTrsTP_PK" />
					<inout bind="txtTransCD" />
					<inout bind="txtTransNM" />
					<inout bind="txtCustomOffPK" />
					
					<inout bind="txtCustomOffCD" />
					<inout bind="txtCustomOffNM" />
					<inout bind="dtDueDate" />
					<inout bind="txtDueDate" />
					<inout bind="dtVATDue" />
					
					<inout bind="txtVATDue" />
					<inout bind="dtTakein" />	
					<inout bind="dtInvoiceDT" />
					<inout bind="txtinvoiceno" />
					<inout bind="txtserial" />
					
					<inout bind="chkAuto" />
					<inout bind="txtAPPO_Type" />
					<inout bind="txtClearAmount" />
					<inout bind="txtAPAmount" />
					<inout bind="txtAPAmountBK" />			
					
					<inout bind="txtTrSeq" />
					<inout bind="txtdeclareno" />
					<inout bind="lstVATRate" />
				</inout>
			</dso> 
		</xml> 
	</gw:data>
    <gw:data id="dso_upd_grd_dtl_ap_domestic_item" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,4,5,6,7,8,9,10" function="ac_SEL_60090030_AP_DO_ITEM" procedure="ac_upd_60090030_AP_DO_ITEM">
                <input bind="grdInfor">
                    <input bind="txtCRDA_pk"/>                    
                </input>
                <output bind="grdInfor"/>
            </dso>
        </xml>
    </gw:data>
    <gw:data id="dso_upd_grd_dtl_ap_do" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,5,6,7,8,9,10,11,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32" function="ac_sel_60090030_crdad_os" procedure="ac_upd_60090030_crdad_os">
                <input bind="grdDtl">
                    <input bind="txtCRDA_pk"/>
                    <input bind="lstCompany" />
                </input>
                <output bind="grdDtl"/>
            </dso>
        </xml>		
    </gw:data>
	
    <gw:data id="dso_upd_grd_dtl_imp" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,6,7,8,10" function="ac_sel_60090030_imptax" procedure="ac_upd_60090030_imptax" >
                <input bind="grdDtlImp">
                    <input bind="txtCRDA_pk" />
                    <input bind="lstCompany" />
                </input>
                <output bind="grdDtlImp" />
            </dso>
        </xml>
    </gw:data>	

	    <gw:data id="dso_upd_grd_dtl_exc" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,6,7,8" function="ac_sel_60090030_exctax" procedure="ac_upd_60090030_exctax" >
                <input bind="grdDtlExc">
                    <input bind="txtCRDA_pk" />
                    <input bind="lstCompany" />
                </input>
                <output bind="grdDtlExc" />
            </dso>
        </xml>
    </gw:data>	

    <gw:data id="dso_upd_grd_dtl_ap_vat" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,6,7,8,9,12,13,14" function="ac_sel_60090030_vat_os" procedure="ac_upd_60090030_vat_os" >
                <input bind="grdDtlVAT">
                    <input bind="txtCRDA_pk" />
                    <input bind="lstCompany" />
                </input>
                <output bind="grdDtlVAT" />
            </dso>
        </xml>
    </gw:data>	

    <gw:data id="dso_upd_grd_dtl_ap_pl" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1" function="ac_sel_60090030_pl" procedure="ac_upd_60090030_pl" >
                <input bind="grdDtlPL">
                    <input bind="txtCRDA_pk"/>
                    <input bind="lstCompany" />
                </input>
                <output bind="grdDtlPL"/>
            </dso>
        </xml>
    </gw:data>	
    <gw:data id="dso_upd_grd_dtl_ap_allocate" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,5,6,7,8,9" function="ac_sel_60090030_allocate" procedure="ac_upd_60090030_allocate" >
                <input bind="grdDtlAllocate">
                    <input bind="txtCRDA_pk"/>
                    <input bind="lstCompany" />
                </input>
                <output bind="grdDtlAllocate"/>
            </dso>
        </xml>
    </gw:data>
	
    <gw:data id="dso_crda_confirm" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="ac_pro_60090030_conf_ap_do"> 
                <input> 
                     <input bind="lstCRDAPK"/>
                     <input bind="lstCompany"/>
                     <input bind="txtIndex" />
                     <input bind="txtAPType"/>
                </input>
                <output>
                     <output bind="txtReturn" />                     
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    
    <gw:data id="dso_upd_cancel" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_PRO_60090030_CANCEL_AP_DO">
                <input> 
                     <input bind="lstCRDAPK"/>
                     <input bind="lstCompany"/>
                     <input bind="txtIndex"/>
                     <input bind="txtemp_pk"/>
                </input>  
                <output>  
                     <output bind="txtStatus"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dso_upd_replicate" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process" procedure="ac_pro_60090030_AUTO_AP_DO_REG">
                <input> 
                     <input bind="lstCRDAPK"/>
                     <input bind="lstCompany"/>
                     <input bind="txtIndex"/>
                </input>  
                <output>  
                     <output bind="txtStatus"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dso_upd_grd_dtl_ap_enron_tax" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,7,8,9" function="ac_sel_60090030_enron_tax" procedure="ac_upd_60090030_enron_tax" >
                <input bind="grdDtlEnvTax">
                    <input bind="txtCRDA_pk" />
                </input>
                <output bind="grdDtlEnvTax" />
            </dso>
        </xml>
    </gw:data>	

    <gw:data id="dso_pro_losgistic" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="ac_pro_60090030_allocate_fob"> 
                <input> 
                     <input bind="txtCRDA_pk"/>
                </input>
                <output>
                     <output bind="txtExRate" />                     
					 <output bind="chkFOB_YN" />
               </output> 
            </dso> 
        </xml> 
    </gw:data>
	
	
<!------------------------------------------------------------------------------------------------------->
	<table style="width:100%;height:100%" border="1" cellpadding="0" cellspacing="0" >
		<tr style="height:100%">
			<td id="idLEFT" width="13%" style="height:17%" >
				<table style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0" >
					<tr>
						<td>
							<table style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td width="30%"></td>
									<td width="20%"></td>
									<td width="30%"></td>
									<td width="20%"></td>
								</tr>
								<tr style="height:4%;">
									<td align="right">Trans Date</td>
									<td align="left"><gw:datebox id="dtTrDatefr" lang="1" /></td>
									<td align="center">~</td>
									<td align="right"><gw:datebox id="dtTrDateto" lang="1" /></td>
								</tr>
								<tr style="height:4%;">
									<td align="right">Slip Status</td>
									<td align="left"><gw:list id="lstSliStatus" styles="width:100%" onchange="OnSearch('1')" /></td>
									<td align="center">Voucher No</td>
									<td align="right"><gw:textbox id="txtVoucherNo_Sr" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch('1')" /></td>
								</tr>	
								<tr style="height:4%;">
									<td align="right"><a title="Click here to select vendor" href="#tips" onclick="onSearchCust('Vendor_1')" >Vendor</a></td>
									<td colspan="1" align="left"><gw:textbox id="txtVendorID" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch('1')" /></td>
									<td colspan="2" align="left"><gw:textbox id="txtVendorName" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch('1')" /></td>
								</tr>		
								<tr>
								    <td align="right">Decl. No</td>
								    <td align="right"><gw:textbox id="txtdeclareno_Sr" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch('1')" /></td>
								    <td align="right">Inv. No</td>
								    <td align="right"><gw:textbox id="txtinvoiceno_Sr" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch('1')" /></td>
								</tr>															
								<tr style="height:4%;">			
								    <td>Seq</td>
								    <td><gw:textbox id="txtSeq_1" styles="width:100%" onenterkey="OnSearch('1')" /></td>						
									<td align="right" colspan="2" >
										<table style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0">
											<tr>
												<td width="90%" align="right"><gw:imgBtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('1')" /></td>
												<td width="10%" align="right"><gw:imgBtn id="btnReset_1" img="reset" alt="Reset" onclick="OnReset('Vendor_1')" /></td>
											</tr>
										</table>
									</td>									
								</tr>									
							</table>
						</td>
					</tr>
					<tr>
						<td style="height:83%" >
							<gw:grid 
								id="grdSearch"  
								header  ="Voucher No|Seq|Trans Date|Invoice No|Total Trans Amount|Total Books Amount|_PK"
								format  ="0|0|4|0|0|0|0"
								aligns  ="0|1|1|0|3|3|0"
								defaults="||||||"
								editcol ="0|0|0|0|0|0|0"
								widths  ="1500|800|1200|1500|2000|2000|0"
								styles  ="width:100%; height:100%"
								sorting ="F"
								acceptNullDate  = "T"
								oncellclick="OnSearch('2')"
							/>
						</td>
					</tr>
				</table>
			</td>
			<td id="idRIGHT" width="87%" >
				<table style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0" >
					<tr style="width:100%;height:32%">
						<td>
							<table style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0">
								<tr >
									<td style="width:10%"></td>
									<td style="width:10%"></td>
									<td style="width:10%"></td>
									<td style="width:8%"></td>
									<td style="width:2%"></td>
									<td style="width:10%"></td>
									<td style="width:10%"></td>
									<td style="width:10%"></td>									
									<td style="width:8%"></td>
									<td style="width:2%"></td>
									<td style="width:9%"></td>
									<td style="width:8%"></td>
									<td style="width:2%"></td>
									<td style="width:2%"></td>
								</tr>
								<tr style="height:4%;">
									<td align="right">Company</td>
									<td align="left"><gw:list id="lstCompany" styles="width:100%" /></td>
									<td align="right">Voucher Type</td>
									<td align="left" colspan="1" ><gw:list id="lstVoucherType" styles="width:100%" csstype="mandatory" /></td>
									<td align="left" colspan="1" ><gw:checkbox id="chkAuto" value="T" styles="width:100%" /></td>
									<td align="right">Voucher No</td>
									<td align="left" ><gw:textbox id="txtvoucher_no" styles="width:100%" csstype="mandatory" /></td>
									<td align="left" ><gw:textbox id="txtTrSeq" styles="width:100%" /></td>
									<td align="right">Seq</td>
									<td align="left" colspan="2"><gw:textbox id="txtseq" styles="width:100%" onenterkey="OnShowTAccount()" /></td>
									<td align="right"><gw:imgBtn id="ibtnNew" img="new" alt="New" onclick="OnNew('Master')" /></td>
									<td align="right"><gw:imgBtn id="ibtnSave" img="save" alt="Save" onclick="OnSave('1')" /></td>
									<td align="right" colspan="1"><gw:imgBtn id="ibtnDelete" img="delete" alt="Delete" onclick="OnDelete('1')" /></td>
								</tr>
								<tr style="height:4%;">
									<td align="right">Trans Date</td>
									<td align="left"><gw:datebox id="dtTransDT" lang="1" csstype="mandatory" onchange="OnChangeTransDT()" /></td>
									<td align="right">Slip Status</td>
									<td align="left" colspan="2"><gw:list id="lstStatus" /></td>
									<td align="right"><a title="Click here to select Person" onclick="onSearchCust('Person')" href="#tips">Person</a></td>
									<td align="left"><gw:textbox id="txtPersonCD" styles="width:100%" /></td>
									<td align="left" colspan="3" ><gw:textbox id="txtPersonNM" styles="width:100%" /></td>																		
									<td align="right"><gw:icon id="btnConfirm" img="in" text="Confirm" styles="width:100%" onclick="OnConfirm()" /></td>
									<td align="right"><gw:icon id="btnCancel" img="in" text="Cancel" styles="width:100%" onclick="OnCancell()" /></td>
									<td align="right" colspan="1"><gw:icon id="btnReplicate" img="in" text="Replicate" onclick="OnReplicate()" /></td>
									<td align="right" colspan="1"><gw:imgBtn id="ibtnPrint" img="printer" alt="Print Accounting Slip" onclick="OnPrint('1')" /></td>
								</tr>
								<tr style="height:4%;">
									<td align="right"><a title="Click here to select Vendor" onclick="onSearchCust('Vendor')" href="#tips">Vendor</a></td>
									<td align="left"><gw:textbox id="txtVendorCD" styles="width:100%" csstype="mandatory" /></td>
									<td align="left" colspan="2"><gw:textbox id="txtVendorNM" styles="width:100%" csstype="mandatory" /></td>
									<td align="right"><gw:imgBtn id="btnResetvVendor" img="reset" alt="Reset" onclick="OnReset('Vendor')" /></td>
									<td align="right"><a title="Click here to select Deliver" onclick="onSearchCust('Deliver')" href="#tips">Deliver</a></td>
									<td align="left"><gw:textbox id="txtDeliverCD" styles="width:100%" /></td>
									<td align="left" colspan="2"><gw:textbox id="txtDeliverNM" styles="width:100%" /></td>
									<td align="right"><gw:imgBtn id="btnResetvDeliver" img="reset" alt="Reset" onclick="OnReset('Deliver')" /></td>
									<td align="right">VAT Currency</td>
									<td align="left"><gw:list id="lstVATCurr" styles="width:100%" /></td>
									<td align="right" colspan="1"><gw:textbox id="txtVATCurrRate" type="number" format="###,###,###.##R" /></td>
									<td align="right" colspan="1"><gw:imgBtn id="ibtnPrint_1" img="printer" alt="Print Take in Slip" onclick="OnPrint('2')" /></td>
								</tr>
								<tr style="height:4%;">
									<td align="right"><a title="Click here to select Charger" onclick="onSearchCust('A/P')" href="#tips">A/P</a></td>
									<td align="left"><gw:textbox id="txtChargerCD" styles="width:100%" /></td>
									<td align="left" colspan="2"><gw:textbox id="txtChargerNM" styles="width:100%" /></td>
									<td align="right"><gw:imgBtn id="btnResetCharger" img="reset" alt="Reset" onclick="OnReset('A/P')" /></td>
									<td align="right"><a title="Click here to select Contact" onclick="onSearchCust('Paid To')" href="#tips">Paid To</a></td>
									<td align="left"><gw:textbox id="txtContactCD" styles="width:100%" /></td>
									<td align="left" colspan="2"><gw:textbox id="txtContactNM" styles="width:100%" /></td>
									<td align="right"><gw:imgBtn id="btnResetvContact" img="reset" alt="Reset" onclick="OnReset('Paid To')" /></td>									
									<td align="right">Book Ccy</td>
									<td align="left"><gw:list id="lstBook_Ccy" styles="width:100%" /></td>
									<td align="right" colspan="2"><gw:textbox id="txtBookRate" type="number" format="###,###,###.##R" /></td>
								</tr>							
								<tr style="height:4%;">
									<td align="right">Serial No</td>
									<td align="left"><gw:textbox id="txtserial" styles="width:100%" onkeypress="Upcase()" onenterkey="onSearch()"/></td>
									<td align="right">Invoice Date</td>
									<td align="left" colspan="2" ><gw:datebox id="dtInvoiceDT" lang="1" styles="width:100%" csstype="mandatory" /></td>
									<td align="right">Invoice No</td>
									<td align="left" ><gw:textbox id="txtinvoiceno" styles="width:100%" /></td>
									<td align="right">Declare No</td>
									<td align="left" colspan="2"><gw:textbox id="txtdeclareno" styles="width:100%" /></td>
									<td align="right">Trans Ccy</td>
									<td align="left"><gw:list id="lstTransCcy" styles="width:100%" csstype="mandatory" onchange="dso_get_rate.Call()" /></td>
									<td align="right" colspan="2"><gw:textbox id="txtTransCcy" type="number" format="###,###.##R" /></td>
								</tr>
								<tr style="height:4%;">
									<td align="right">Enclose</td>
									<td align="left" colspan="4"><gw:textbox id="txtEnclose" styles="width:100%" /></td>
									<td align="right"><a title="Click here to select Account code" onclick="onSearchCust('AccountAP')" href="#tips">Account code A/P</a></td>
									<td align="left" ><gw:textbox id="txtAPacc" styles="width:100%" /></td>
									<td align="left" colspan="2" ><gw:textbox id="txtAPaccNM" styles="width:100%" /></td>
									<td align="left" colspan="1"><gw:imgBtn id="btnResetAPACC" img="reset" alt="Reset" onclick="OnReset('Account code A/P')" /></td>
									<td align=right>VAT Rate</td>
									<td align=left><gw:list id="lstVATRate" styles="width:100%;" /></td>
									
								</tr>		
								<tr style="height:4%;">
									<td align="right">Description</td>
									<td align="left" colspan="4" ><gw:textbox id="txtDesc" styles="width:100%" csstype="mandatory" /></td>
									<td align="right">Local Description</td>
									<td align="left" colspan="4" ><gw:textbox id="txtLocalDesc" styles="width:100%" csstype="mandatory" /></td>
									<td align="right">Due Date</td>
									<td align="right"><gw:textbox id="txtDueDate" type="number" format="###,###.##R"  onblur="OnDueDate()" onchange="OnDueDate()"  /></td>
									<td align="right" colspan="1"><gw:datebox id="dtDueDate" lang="1" onchange="OnMatDueDate()" /></td>
								</tr>								
								<tr style="height:4%;">
									<td align="right"><a title="Click here to select VAT Customs Office" onclick="onSearchCust('VATCustomOffice')" href="#tips">VAT Customs Office</a></td>
									<td align="left" colspan="1" ><gw:textbox id="txtCustomOffCD" styles="width:100%" /></td>
									<td align="left" colspan="2" ><gw:textbox id="txtCustomOffNM" styles="width:100%" /></td>
									<td align="left"><gw:imgBtn id="btnResetCustom" img="reset" alt="Reset" onclick="OnReset('VAT Custom Office')" /></td>
									<td align="right"><a title="Click here to select Trans Type" onclick="onSearchCust('Trans Type')" href="#tips">Trans Type</a></td>
									<td align="left" colspan="1" ><gw:textbox id="txtTransCD" styles="width:100%" csstype="mandatory" /></td>
									<td align="left" colspan="2" ><gw:textbox id="txtTransNM" styles="width:100%" csstype="mandatory" /></td>
									<td align="left"><gw:imgBtn id="btnResetTrans" img="reset" alt="Reset" onclick="OnReset('Trans Type')" /></td>
									<td align="right"><b>VAT Due Date</b></td>
									<td align="right" colspan="1" ><gw:textbox id="txtVATDue" type="number" format="###,###.##R" /></td>									
									<td align="right" colspan="2" ><gw:datebox id="dtVATDue" lang="1" onchange="OnVATDueDate()" /></td>									
								</tr>																
								<tr>
									<td align="right"><b>Takein Date</b></td>
									<td align="left"><gw:datebox id="dtTakein" lang="1" /></td>
									<td colspan="4" align="right">AP Amount</td>
									<td colspan="1"><gw:textbox id="txtAPAmount" type="number" format="###,###,###,###.##R" /></td>
									<td colspan="3"><gw:textbox id="txtAPAmountBK" type="number" format="###,###,###,###.##R" /></td>
									<td align="right"><a title="Click here to select advance information" onclick="onSearchCust('ClearType')" href="#tips">Clear Type</a></td>
									<td align="right" colspan="3" ><gw:textbox id="txtClearAmount" type="number" format="###,###.###R" /></td>									
								</tr>
							</table> 
						</td>
					</tr>
					<tr style="width:100%;height:68%;">
						<td>
							<gw:tab id="idTab_Child" styles="width:100%;height:100%" onpageactivate="OnSearchTab()" >
								<table name="Control Item..." width ="100%" height="100%" cellpadding ="0" cellspacing ="0" border="0" >
									<tr style="height:8%">
										<td align ="right" width="94%" ><gw:imgBtn id="btnAdd_More" img="new" alt="Add New Item" onclick="Add_CtrlItem()"/></td>
										<td align ="right" width="3%" ><gw:imgBtn id="btnSave_More" img="save" alt="Save"         onclick="Save_CtrlItem()"/></td>
										<td align ="right" width="3%" ><gw:imgBtn id="btnDel_More" img="delete" alt="Delete"       onclick="Delete_CtrlItem()"/></td>    
									</tr>
									<tr style="height:92%" >
										<td width ="100%" colspan="3" >
											<gw:neogrid id="grdInfor" styles="width:100%;height:100%" oncelldblclick ="PopupClickCtrl_Item()"> 
												<XML>
													<xmlblock>
													
													<column title="PK" hidden='T'>
														<textbox type="number" format="######R"/>
													</column>

													<column title="Item PK" hidden='T'>
														<textbox type="number" format="######R" />
													</column>

													<column title="Item Code" width='3500' editmode="0">
														<textbox />
													</column>

													<column title="Item Name" width='3500' editmode="0">
														<textbox />
													</column>

													<column title="InType" hidden='T'>
														<textbox  />
													</column>

													<column title="DataType" hidden='T'>
														<textbox />
													</column>
													<column title="Item Code"  width='3500'>
														<multiple ref="5">
															<textbox type="number" format="###,###C" value="" />
															<textbox format="50" value="" />
															<datebox type="day" format=""  lang="1" acceptnull="T"/>
															<checkbox />	
															<htmledit value="[New]" />				
														</multiple>
													</column>
													
													<column title="Mst_PK" hidden='T' >
														<textbox/>
													</column>
													
													<column title="Item_Table" hidden='T'>
														<textbox  />
													</column>
													
													<column title="Item Name" width='3500' editmode="0">
														<textbox  />
													</column>
													<column title="Table Name" hidden='T'>
														<textbox  />
													</column>

												</xmlblock>
											</xml>
										</gw:neogrid>
										</td>			
									</tr>
								</table>
				            <table name="Item Info" style="width:100%;height:100%" cellpadding ="0" cellspacing ="0" border="0" >
                            <tr style="height:10%;" >
				                <td >
		                            <table style="width:100%;height:100%" cellpadding ="0" cellspacing ="0" border="0">
		                                <tr >
	                                        <td width ="5%" align="right">SEQ</td>
	                                        <td width ="5%" align="left" ><gw:label id="lblSeq" text="" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td>
                                            <td width ="10%" align="right">Total</td>
                                            <td width ="15%" align="left" ><gw:textbox id="lblTotal_FAMT" text="" type="number" format="###,###.###R" styles="color:red;width:90%;font-weight: bold;font-size:14"/></td>
	                                        <td width ="15%" align="left" ><gw:textbox id="lblTotal_AMT" text="" type="number" format="###,###.###R" styles="color:red;width:90%;font-weight: bold;font-size:14"/></td>	                                        	                                        
	                                        <td width ="8%" align="center">Get Data</td>
                                            <td width ="24%" align="center">
                                                <table border ="0" cellpadding="0" cellspacing="0" style="width:100%;height:100%">
                                                <tr>
                                                    <td>
														<gw:list id="lstGetData" styles="width:100%" onchange="OnChangeMethod()" />
                                                    </td>
                                                </tr>
                                                </table>
                                            </td>
                                            <td style="width:3%;" align="right">Cost</td>
                                            <td style="width:5%;" align="left">
                                                <gw:checkbox id="chkCost" text="Cost" value="T" onclick="OnCheckCost()" />
                                            </td>
                                            <td>
                                                <table border ="0" cellpadding="0" cellspacing="0" style="width:100%;height:100%">
                                                <tr>
	                                                <td width ="3%" align ="right" ><gw:imgBtn id="btnNew_D"    img="new"       alt="New" onclick="OnAdd_Item()"      /> </td>
	                                                <td width ="3%" align ="right" ><gw:imgBtn id="btnSave_D"   img="save"      alt="Save"   onclick="OnSave_Item()"   /> </td>
	                                                <td width ="3%" align ="right" ><gw:imgBtn id="btnDel_D"    img="delete"    alt="Delete" onclick="OnDelete_Item()"   /> </td>
                                                </tr>
                                                </table>
                                            </td>
                                            
                                        </tr>
                                    </table>                   
                                </td>
                            </tr>
	                        <tr>
                                <td width ="100%" >
                                    <gw:grid
                                        id      ="grdDtl"  
                                        header  ="_PK|Order No|Item Code|Item Name|WH|Unit|U/Price|_Actural Q'ty|Invoice Q'ty|_Diff Q'ty|Invoice Net Trans. Amt|Invoice Net Books. Amt|_Diff Net Trans. Amt|_Diff Net Books. Amt|Ac. Code|Account Name|Costing|Description|Local Description|_tac_crda_pk|_tco_item_pk|_tac_abacctcode_pk|_tin_warehouse_pk|_mat_famt|_mat_amt|_mat_unit|_mat_pk|_tac_mattakein_ap_pk|_APPO_Type|_tac_cinv_ap_pk|VAT Rate|_tac_abplcenter_pk|_Seq_item"
                                        format  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                        aligns  ="0|0|1|0|1|1|3|3|3|3|3|3|3|3|1|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                        defaults="||||||||||||||||Y||||||||||||||||"
                                        editcol ="0|0|0|0|0|0|1|0|1|0|1|1|0|0|0|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                        widths  ="0|1200|1500|2500|2000|800|1000|1500|1500|1500|2000|2105|2100|2000|1200|2000|1000|2000|2000|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                        styles  ="width:100%; height:100%"
                                        sorting ="F"  
										acceptNullDate="T"
										onafteredit="OnEditDtl()"
										oncellclick="OnEditDtl()"
										oncelldblclick="OnDblClickDtlItem()"
                                        />
                                </td>
                            </tr>
	                        </table>
							<table name="Import Tax" style="width:100%;height:100%" cellpadding ="0" cellspacing ="0" border="0" >
								<tr style="height:10%;">
									<td width="20%" align="right">Total</td>
									<td width="25%"><gw:textbox id="txtTotTrAmtImp" type="number" format="###,###.###R" styles="color:red;width:90%;font-weight: bold;font-size:14" /></td>
									<td width="30%"><gw:textbox id="txtTotBkAmtImp" type="number" format="###,###.###R" styles="color:red;width:90%;font-weight: bold;font-size:14" /></td>
									<td width="25%" align ="right" ><gw:imgBtn id="btnSave_Imp" img="save" alt="Save" onclick="OnSave_ImpTax()" /> </td>
								</tr>
								<tr style="height:90%;">
									<td colspan="4">
										<gw:grid
                                        id      ="grdDtlImp"
                                        header  ="_PK|Item Code|Item Name|Calculated Amt Tax|Calculated Amt|Calculated Net Tax|Tax Rate|Tax Trans. Amt|Tax Books. Amt|Imp. Tax Amt|Return Tax"
                                        format  ="0|0|0|0|0|0|0|0|0|0|0"
                                        aligns  ="0|0|0|3|3|3|1|3|3|3|1"
                                        defaults="||||||||||N"
                                        editcol ="0|0|0|0|0|0|1|1|1|1|1"
                                        widths  ="0|1000|2000|2000|2000|2100|1000|1500|1500|1500|800"
                                        styles  ="width:100%; height:100%"
                                        sorting ="T"
										oncellclick="OnEditDtl_Imp()"
										onafteredit="OnEditDtl_Imp()"										
                                        />									
									</td>
								</tr>
							</table>														
							<table name="Excise Tax" style="width:100%;height:100%" cellpadding ="0" cellspacing ="0" border="0" >
								<tr style="height:10%;">
									<td width="20%" align="right">Total</td>
									<td width="25%"><gw:textbox id="txtTotTrAmtExc" type="number" format="###,###.##R" styles="color:red;width:90%;font-weight: bold;font-size:14" /></td>
									<td width="30%"><gw:textbox id="txtTotBkAmtExc" type="number" format="###,###.##R" styles="color:red;width:90%;font-weight: bold;font-size:14" /></td>
									<td width ="25%" align ="right" ><gw:imgBtn id="btnSave_Exc" img="save" alt="Save" onclick="OnSave_Exc()"     /> </td>
								</tr>
								<tr style="height:90%;">
									<td colspan="4">
										<gw:grid
                                        id      ="grdDtlExc"
                                        header  ="_PK|Item code|Item name|Calculated Amt Tax|Calculated Amt|Calculated Net Exc|Exc Rate|Exc Trans. Amt|Exc Books. Amt|TAX Exc. Amt"
                                        format  ="0|0|0|0|0|0|0|0|0|0"
                                        aligns  ="0|0|0|3|3|3|1|3|3|3"
                                        defaults="|||||||||"
                                        editcol ="0|0|0|0|0|0|1|0|0|0"
                                        widths  ="0|1000|2000|2000|2000|2100|1000|1500|1500|1500"
                                        styles  ="width:100%; height:100%"
                                        sorting ="F"
										onafteredit="OnEditDtl_Exc()"
										oncellclick="OnEditDtl_Exc()"
                                        />									
									</td>
								</tr>
							</table>														
							<table name="Allocation Fee" style="width:100%;height:100%;display:none" cellpadding ="0" cellspacing ="0" border="0" >
								<tr style="height:10%;">
									<td align="right" width="10%">FOB Price</td>
									<td align="right" width="5%"><gw:checkbox id="chkFOB_YN" onclick="OnChangeFOB()" /></td>
									<td align="right" width="10%">Ex. Rate</td>
									<td align="right" width="20%"><gw:textbox id="txtExRate" type="number" format="###,###.#R" styles="color:red;width:90%;font-weight: bold;font-size:14" onchange="OnDivideAllocate()" /></td>		
									<td align="right" width="10%">Allocate</td>
									<td align="right" width="20%"><gw:textbox id="txtAlcTrAmt" type="number" format="###,###.##R" styles="color:red;width:90%;font-weight: bold;font-size:14" onchange="OnDivideAllocate()" onenterkey="OnDivideAllocate()" /></td>																		
									<td align="right" width="20%"><gw:textbox id="txtAlcBkAmt" type="number" format="###,###.##R" styles="color:red;width:90%;font-weight: bold;font-size:14" /></td>
									<td width ="5%" align ="right" ><gw:imgBtn id="btnSave_Allocate" img="save" alt="Save" onclick="OnSave_Allocate()" /> </td>
								</tr>
								<tr style="height:90%;">
									<td colspan="9">
										<gw:grid
                                        id      ="grdDtlAllocate"  
                                        header  ="_PK|Item Code|Item Name|Calculated Trans Amt|Calculated Books. Amt|Allocated Trans. Amt|Allocated Books. Amt|Ratio|_Ex. Rate|_FOB Price"
                                        format  ="0|0|0|0|0|0|0|0|0|0"
                                        aligns  ="0|0|0|3|3|3|3|3|3|1"
                                        defaults="|||||||||"
                                        editcol ="0|0|0|0|0|1|1|1|0|0"
                                        widths  ="0|1500|2500|2000|2000|2000|2000|1000|0|0"
                                        styles  ="width:100%; height:100%"
                                        sorting ="F"
										onafteredit="OnEditDtl_Allocate()"
										oncellclick="OnEditDtl_Allocate()"
                                        />									
									</td>
								</tr>
							</table>
							<table name="VAT Tax" style="width:100%;height:100%" cellpadding ="0" cellspacing ="0" border="0" >
								<tr style="height:10%;">
									<td width="20%" align="right">Total</td>
									<td width="25%"><gw:textbox id="txtTotTrAmt" type="number" format="###,###.###R" styles="color:red;width:90%;font-weight: bold;font-size:14" /></td>
									<td width="30%"><gw:textbox id="txtTotBkAmt" type="number" format="###,###.###R" styles="color:red;width:90%;font-weight: bold;font-size:14" /></td>
									<td width ="25%" align ="right" ><gw:imgBtn id="btnSave_VAT"   img="save"      alt="Save" onclick="OnSave_VAT()"     /></td>
								</tr>
								<tr style="height:90%;">
									<td colspan="4">
										<gw:grid
                                        id      ="grdDtlVAT"
                                        header  ="_PK|Item code|Item name|Calculated Amt Tax|Calculated Amt|Calculated Net VAT|Tax Rate|VAT Trans. Amt|VAT Books. Amt|TAX VAT. Amt|VAT Account Code|VAT Account Name|Description|Local Description|_tac_abacctcode_pk_vat"
                                        format  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                        aligns  ="0|0|0|3|3|3|1|3|3|3|1|0|0|0|0"
                                        defaults="||||||||||||||"
                                        editcol ="0|0|0|0|0|0|1|1|1|1|0|0|1|1|0"
                                        widths  ="0|1000|2000|2000|2000|2100|1000|1500|1500|1500|1550|2000|2000|2000|0"
                                        styles  ="width:100%; height:100%"
                                        sorting ="F"
										onafteredit="OnEditDtl_VAT()"
										oncellclick="OnEditDtl_VAT()"
										oncelldblclick="OnDblClickDtlVAT()"
                                        />									
									</td>
								</tr>
							</table>
							<table name="Environment Tax" style="width:100%;height:100%;" cellpadding ="0" cellspacing ="0" border="0" >
								<tr style="height:10%;">
									<td width="20%" align="right">Total</td>
									<td width="25%"><gw:textbox id="txtTotEnvTrAmt" type="number" format="###,###.##R" styles="color:red;width:90%;font-weight: bold;font-size:14" /></td>
									<td width="30%"><gw:textbox id="txtTotEnvBkAmt" type="number" format="###,###.##R" styles="color:red;width:90%;font-weight: bold;font-size:14" /></td>
									<td width ="25%" align ="right" ><gw:imgBtn id="btnSave_ENVTax"   img="save"      alt="Save" onclick="OnSave_ENVTax()"     /></td>
								</tr>
								<tr style="height:90%;">
									<td colspan="4">
										<gw:grid
                                        id      ="grdDtlEnvTax"
                                        header  ="_PK|Item code|Item name|Net Trans Amt|Net Books Amt|Net VND Amt|Tax Rate|Tax Trans. Amt|Tax Books. Amt|TAX VND Amt|Account Code|Account Name|Description|Local Description|_tac_abacctcode_pk"
                                        format  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                        aligns  ="0|0|0|3|3|3|1|3|3|3|1|0|0|0|0"
                                        defaults="||||||||||||||"
                                        editcol ="0|0|0|0|0|0|1|1|1|1|1|0|0|0|0"
                                        widths  ="0|1000|2000|2000|2000|2100|1000|1500|1500|1500|1550|2000|2000|2000|0"
                                        styles  ="width:100%; height:100%"
                                        sorting ="F"
										onafteredit="OnEditDtl_ENVTax()"	
										oncellclick="OnEditDtl_ENVTax()"		
                                        />									
									</td>
								</tr>
							</table>
							
							<table name="PL" style="width:100%;height:100%" cellpadding ="0" cellspacing ="0" border="0" >
								<tr style="height:10%;">
									<td width ="100%" align ="right" ><gw:imgBtn id="btnSave_PL" img="save" alt="Save" onclick="OnSave_PL()" /> </td>
								</tr>
								<tr style="height:90%;">
									<td colspan="3">
										<gw:grid
                                        id      ="grdDtlPL"  
                                        header  ="_PK|_tac_abplcenter_pk|Item Code|Item Name|P/L Code|P/L Name|Account Code"
                                        format  ="0|0|0|0|0|0|0"
                                        aligns  ="0|0|1|0|0|0|0"
                                        defaults="||||||"
                                        editcol ="0|0|0|0|1|0|0"
                                        widths  ="0|0|1500|3500|1500|2500|0"
                                        styles  ="width:100%; height:100%"
                                        sorting ="F"
										autosize="T"
										oncelldblclick="OnDblClickDtlPL()"			
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
<!------------------------------------------------------------------------>
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif"
        style="cursor: hand; position: absolute; left: 1; top: 0;" onclick="OnToggle()" />      
<!------------------------------------------------------------------------>	
<gw:list id="lstBookCcy_2"         style="display:none" />
<gw:textbox id="txtBookRate_2"         style="display:none" />
<gw:textbox id="txtTransDT"         style="display:none" />
<gw:textbox id="txtFORMID"         style="display:none" />
<gw:textbox id="txtGROUPID"         style="display:none" />
<gw:textbox id="txtTrsTP_PK"         style="display:none" />
<gw:textbox id="txtacdr_pk"         style="display:none" />
<gw:textbox id="txtacdr_cd"         style="display:none" />
<gw:textbox id="txtacdr_nm"         style="display:none" />
<gw:textbox id="txtaccr_pk"         style="display:none" />
<gw:textbox id="txtacvat_cd"         style="display:none" />
<gw:textbox id="txtacvat_nm"         style="display:none" />
<gw:textbox id="txtacvat_pk"         style="display:none" />
<gw:textbox id="txtemp_pk"         style="display:none" />
<gw:textbox id="txt_row"         style="display:none" />
<gw:textbox id="txtVendorPK"         style="display:none" />
<gw:textbox id="txtDeliverPK"         style="display:none" />
<gw:textbox id="txtChargerPK"         style="display:none" />
<gw:textbox id="txtContactPK"         style="display:none" />
<gw:textbox id="txtAPaccPK"         style="display:none" />
<gw:textbox id="txtCustomOffPK"         style="display:none" />
<gw:textbox id="txtCRDA_pk" style="display:none" />
<gw:textbox id="txtAPAC_CD"         style="display:none" />
<gw:textbox id="txtAPAC_NM"         style="display:none" />
<gw:textbox id="txtTransTP_PK"         style="display:none" />
<gw:textbox id="txtTransTP_CD"         style="display:none" />
<gw:textbox id="txtTransTP_NM"         style="display:none" />
<gw:textbox id="txtPersonNM_0"         style="display:none" />
<gw:textbox id="txtAPPO_Type" style="display:none" />
<gw:textbox id="lstCRDAPK" style="display:none" />
<gw:textbox id="txtIndex" style="display:none" />
<gw:textbox id="txtAPType" style="display:none" />
<gw:textbox id="txtReturn" style="display:none" />
<gw:textbox id="txtStatus" style="display:none" />
<gw:textbox id="txtImacpk" style="display:none" />
<gw:textbox id="txtImaccd" style="display:none" />
<gw:textbox id="txtImacnm" style="display:none" />
<gw:textbox id="txtExacpk" style="display:none" />
<gw:textbox id="txtExaccd" style="display:none" />
<gw:textbox id="txtExacnm" style="display:none" />
<gw:textbox id="txtWH" style="display:none" />
<gw:textbox id="txtWH_NM" style="display:none" />

<gw:textbox id="txtVATCustom_PK" style="display:none" />
<gw:textbox id="txtVATCustom_CD" style="display:none" />
<gw:textbox id="txtVATCustom_NM" style="display:none" />
<gw:textbox id="txtVendorPK_1" style="display:none" />
<gw:textbox id="txtCompany_PK" style="display:none" />
<gw:textbox id="txtCompany_Rnt" style="display:none" />
<gw:textbox id="txtUser_Pk"               style="display:none" />
</body>
</html>