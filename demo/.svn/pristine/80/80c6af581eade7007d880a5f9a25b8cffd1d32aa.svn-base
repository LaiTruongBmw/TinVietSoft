<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>
    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">
var  g_lang   = "<%=Session("SESSION_LANG")%>"  ;
var  g_emp_pk = "<%=Session("EMPLOYEE_PK")%>" ;
var  g_user_name = "<%=Session("USER_NAME")%>" ;
var  g_user_id = "<%=Session("USER_ID")%>" ;
var  g_user_pk = "<%=Session("USER_PK")%>" ;
var  g_company_pk = "<%=Session("TCO_COMPANY_PK")%>" ;
// grid grdSearch
var g_0_VoucherNo	 = 0,
	g_0_Seq			 = 1,
	g_0_TransDate	 = 2,
	g_0_InvoiceNo	 = 3,
    g_0_NetBooksAmt	 	= 4,
    g_0_CalcTAXNetVAT	= 5,
	g_0_TAXVATAmt		= 6,
	g_0_PK				= 7,
	g_0_Printed_YN      = 8;
var	g_insert    		= false ;
var g_tac_crcad_pk		= 0,
	g_tac_crca_pk		= 1,
	g_OrderNo			= 2,
	g_tco_item_pk		= 3,
    g_Item_code	 		= 4,
    g_Item_Name			= 5,
	g_HSCode		    = 6,
    g_Unit				= 7,
	g_UPrice			= 8,
	g_Qty				= 9,
	g_Ext_Price			= 10,
    g_Net_Trans_Amt		= 11,
	g_Net_Books_Amt		= 12,
	g_Ac_code_Revenue	= 13,
	g_AccountName		= 14,
	g_tac_abacctcode_pk	= 15,
	g_WH				= 16,
	g_Desc				= 17,
	g_Local_Desc		= 18,
	g_WH_PK				= 19,
	g_tex_decl_dtl_pk	= 20,
	g_tac_mattakein_ap_pk = 21;
// VAT grid
var   	g_tac_crcad_pk 		= 0,
		g_item_code_1	    = 1,
		g_item_name_1	    = 2,
		g_calc_amt_tax		= 3,
		g_calc_amt			= 4,
		g_calc_net_vat		= 5,
		g_vat_rate			= 6,
		g_vat_tr_amt		= 7,
		g_vat_bk_amt		= 8,
		g_vat_tax_amt		= 9,
		g_vat_accd			= 10,
		g_vat_acnm			= 11,
		g_desc				= 12,
		g_local_desc		= 13,
		g_tac_abacctcode_pkvat = 14;
// PL Grid
var g_tac_crcad_pk_pl	= 0,
	g_tac_abplcenter_pk = 1,
    g_item_code_2	    = 2,
    g_item_name_2	    = 3,
	g_pl_cd				= 4,
	g_pl_nm				= 5;
// Costing Grid
var g_crcad_pk_cost	= 0,
    g_item_code_3	= 1,
    g_item_name_3	= 2,
    g_cost_accd		= 3,
	g_cost_acnm		= 4,
	g_trans_amt		= 5,
    g_books_amt		= 6,
	g_tac_abacctcode_pk_cost = 7 ;	
var g_update = 0 ; // 1: insert , 2 : delete
	
function BodyInit()
{	
    System.Translate(document);
    BindingDataList();
txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	dso_getCompany.Call();		
}

function BindingDataList()
{
    var ls_data         = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 and pk = 2 order by 1")%>";
    lstCompany.SetDataText(ls_data);
	ls_data      = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
	lstTransCcy.SetDataText(ls_data);
    ls_data      = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACBG0130') FROM DUAL")%>";
	lstVoucherType.SetDataText(ls_data);
	lstVoucherType.value = "AR";
    ls_data      = "<%=CtlLib.SetListDataSQL("select trim(code) code, a.code_nm code_nm from tac_commcode_detail a, tac_commcode_master b where a.del_if=0 and b.del_if = 0 and a.tac_commcode_master_pk = b.pk and trim(b.id) = 'EACAB014' AND a.code in ('ED', 'IE', 'TO') ")%>";        
	lstGetData.SetDataText(ls_data);
	ls_data = "<%=CtlLib.SetListDataSQL("select TRIM(CODE) code, A.CODE code_nm FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'EACAB038' and A.def_yn = 'Y'")%>";
	lstVATCurr.SetDataText(ls_data);
	txtVATCurrRate.text = '1';
	ls_data = "<%=CtlLib.SetListDataSQL("select TRIM(CODE) code, A.CODE code_nm FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'ACBG0040' and A.def_yn = 'Y'")%>";
	lstBook_Ccy.SetDataText(ls_data);
	//lstBook_Ccy.value = 'VND';
	//txtBookRate.text = '1';
	var ls_dt = dtTrDateto.value ;	
	ls_dt = ls_dt.substring(0, 4) + ls_dt.substring(4, 6) + "01" ;
	dtTrDatefr.value = ls_dt ;
	ls_data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACBG0010') FROM DUAL ")%>" + "|ALL|Select All";	
	lstSliStatus.SetDataText(ls_data);
	lstStatus.SetDataText(ls_data);
	lstSliStatus.value = 'ALL';
	txtemp_pk.text = g_user_pk ;
	txtPersonCD.text = g_user_id ;		
	// set grid column combo 
	<%=CtlLib.SetGridColumnComboFormat("grdDtlVAT", 6,"SELECT A.CODE, A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACCR0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
	
	// trạng thái mặc định
	lstStatus.value = '1';
	//collapsed left tab
	var left  = document.all("idLEFT");
	left.style.display="none";
	imgArrow.status = "collapse";
	imgArrow.src = "../../../system/images/next_orange.gif";	
	// Invoice No: auto or manual 
	var ls_inv_notype = "<%=CtlLib.SetDataSQL("select d.code_nm from tac_commcode_master a, tac_commcode_detail d where a.pk = d.tac_commcode_master_pk and a.del_if = 0 and d.del_if = 0 and a.id like 'ACBG0181' and d.def_yn = 'Y'")%>";
    if(	ls_inv_notype == 'Auto')
    {
        txtInvNo.SetReadOnly(true);
    }
	
	grdMst.StatusInsert();
	dso_init_form.Call();	
}

function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
	var x = c.toUpperCase().charCodeAt(0);
	event.keyCode = x;
}

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
        right.style.width="75%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
 }

function SetExRate()
{
	txtTransCcy.text = txtTR_RATE.text;
	txtBookRate.text = txtBK_RATE.text;
} 

function OnChangeTransDT()
{
	dso_get_rate.Call();
}

function onSearchCust(iCase)
{
	switch(iCase)
	{
		case 'Customer':
			var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx?com_pk='+ lstCompany.value+'&AR=Y'+'&company=Y'; 
			var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
			if ( object != null )
			{
				txtCustPK_Sr.text = object[0];
				txtCustNo_Sr.text = object[1];
				txtCustNM_Sr.text = object[2];
			}	
		break ;
		case 'Person':
			var path = System.RootURL + "/standard/forms/ch/ae/chae00010_search_emp.aspx";
			var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');		
			if(object!=null)
			{
				txtemp_pk.text = object[0];                
				txtPersonCD.text = object[1];
				txtPersonNM.text = object[2];
			}        		
		break ;
		case 'A/R': 
			var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx?com_pk='+ lstCompany.value+'&AR=Y'+'&company=Y'; 
			var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
			if ( object != null )
			{
				// Custom office
				txtCustomOffPK.text = object[0];
				txtCustomOffCD.text = object[1];
				txtCustomOffNM.text = object[2];
				// Consignor
				txtConsignorPK.text = object[0];
				txtConsignorCD.text = object[1];
				txtConsignorNM.text = object[2];
				// Importer 
				txtImporterPK.text = object[0];
				txtImporterCD.text = object[1];
				txtImporterNM.text = object[2];
				// A/R Collection
				txtARCollPK.text = object[0];
				txtARCollCD.text = object[1];
				txtARCollNM.text = object[2];				
			}			
		break ;
		case 'Account Code A/R':
			var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "131" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_SEL_ACCT_POPUP";
			var o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
			if (o != null)
			{
				if(o[0] != 0)
				{
					txtARAccPK.text = o[3]; // account pk
					txtARAccCD.text = o[0]; // account code
					txtARAccNM.text = o[1] ; // account name
				}				
			}		
		break ;
		case 'Custom office':
			var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx?com_pk='+ lstCompany.value+'&AR=Y'+'&company=Y'; 
			var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
			if ( object != null )
			{
				// Custom office
				txtCustomOffPK.text = object[0];
				txtCustomOffCD.text = object[1];
				txtCustomOffNM.text = object[2];
			}
		break ;
		case 'A/R Collection':
			var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx?com_pk='+ lstCompany.value+'&AR=Y'+'&company=Y'; 
			var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
			if ( object != null )
			{
				// AR Collection
				txtARCollPK.text = object[0];
				txtARCollCD.text = object[1];
				txtARCollNM.text = object[2];				
			}		
		break ;
		case 'Importer':
			var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx?com_pk='+ lstCompany.value+'&AR=Y'+'&company=Y'; 
			var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
			if ( object != null )
			{
				// Importer 
				txtImporterPK.text = object[0];
				txtImporterCD.text = object[1];
				txtImporterNM.text = object[2];
			}
		break ;
		case 'Trans Type AR':
			var path = System.RootURL + '/standard/forms/gf/hg/gfhg00010_transaction.aspx?compk='+ lstCompany.value;
			var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
			if( object != null )
			{
				var tmp = object[0];
				if (tmp[1] != null)
				{
					txtTransTCD.text = tmp[1];
					txtTransTNM.text = tmp[2];
					txtTransTPK.text = tmp[0];
				}                
			}            				
		break ;
	}
}
//---------------------------------------------------------------------
function OnDataReceive(iCase)
{	
	switch(iCase.id)
	{
		case "dso_init_form":
			txtARAccCD.text = txtaccd_dr.text ;
			txtARAccNM.text = txtacnm_dr.text ;
			txtARAccPK.text = txtacpk_dr.text ;
			txtPersonNM.text = txtEmpNM.text ;
			txtTransTCD.text = txtTrTP_AR_CD.text;
			txtTransTNM.text = txtTrTP_AR_NM.text ;
			txtTransTPK.text = txtTrTP_AR.text ;
			dso_get_rate.Call();
		break ;
		case 'dso_ar_list':
			OnFormatGrid('grdSearch');		
			var i;
			for(i = 1; i < grdSearch.rows ; i++)
			{
			    if(grdSearch.GetGridData(i, g_0_Printed_YN) == 'Y')
			    {
			        grdSearch.SetCellBgColor(i, 0, i ,grdSearch.cols-1, 0xFF66FF);
			    }
			}	
		break ;
		case 'grdMst':
			ButtonStatus();
			if(g_update == 1 || g_update == 2)
			{
				g_update = 0;
				dso_ar_list.Call('SELECT');
			}
			else
			{
				OnSearchTab();
			}			
		break ;
		case "dso_ar_confirm":			
			lstSliStatus.value = '2';
			grdMst.Call("SELECT");
		break ;
		case "dso_ar_cancel":			
			lstSliStatus.value = '3';
			grdMst.Call("SELECT");
		break ;
		case 'dso_ar_replicate':
			grdMst.Call("SELECT");
		break ;
		case 'dso_upd_crca_vat':
			OnFormatGrid('grdDtlVAT');
			var i, l_tot_vat_tr_amt = 0, l_tot_vat_bk_amt = 0;
			for( i = 1; i < grdDtlVAT.rows ; i++)
			{
				l_tot_vat_tr_amt += Number(grdDtlVAT.GetGridData(i, g_vat_tr_amt));
				l_tot_vat_bk_amt += Number(grdDtlVAT.GetGridData(i, g_vat_bk_amt));
			}
			txtTotTrAmt.text = l_tot_vat_tr_amt.toFixed(3);
			txtTotBkAmt.text = l_tot_vat_bk_amt.toFixed(3);
		break ;
		case 'dso_upd_crca_item':			
			OnFormatGrid('grdDtl');			
			var i, l_tot_net_tr_amt = 0, l_tot_net_bk_amt = 0;
			for( i = 1; i < grdDtl.rows ; i++)
			{
				l_tot_net_tr_amt += Number(grdDtl.GetGridData(i, g_Net_Trans_Amt));
				l_tot_net_bk_amt += Number(grdDtl.GetGridData(i, g_Net_Books_Amt));
			}				
			lblTotal_FAMT.text = l_tot_net_tr_amt.toFixed(3);
			lblTotal_AMT.text = l_tot_net_bk_amt.toFixed(3);
		break ;
		case 'dso_upd_crca_cost':
			OnFormatGrid('grdDtlCost');			
		break ;
		case "dso_upd_crca_ctrlitem":
		break ;
		case "dso_upd_vat_inv":
		if(txtReturn.GetData()== "-1")
        {                        
            alert("This invoice has already printed out");
        }
		break ;
		case "dso_ar_copy":
		    grdMst.Call("SELECT");
		break ;
	}
}
//----------------------------------------------------------------------------------
function OnReset(iCase)
{
	switch(iCase)
	{
		case 'Custom office':
			txtCustomOffCD.text = "";
			txtCustomOffPK.text = "";
			txtCustomOffNM.text = "";
		break ;
		case 'A/R':
			txtConsignorCD.text = '';
			txtConsignorNM.text = '';
			txtConsignorPK.text = '';
		break ;
		case 'Importer':
			txtImporterCD.text = '';
			txtImporterNM.text = '';
			txtImporterPK.text = '' ;
		break ;
		case 'A/R Collection':
			txtARCollCD.text = '';
			txtARCollNM.text = '';
			txtARCollPK.text = '';
		break ;
		case 'Account Code A/R':
			txtARAccCD.text = "";
			txtARAccNM.text = "";
			txtARAccPK.text = "";			
		break ;
		case 'Customer':
			txtCustPK_Sr.text = '';
			txtCustNo_Sr.text = '';
			txtCustNM_Sr.text = '';
		break ;
	}
}
//---------------------------------------------------
function OnSearch(iCase)
{
	switch(iCase)
	{
		case '1':
			dso_ar_list.Call("SELECT");
		break;
		case '2':
			var lrow ;
			lrow = event.row ;
			txtCRCA_PK.text = grdSearch.GetGridData(lrow, g_0_PK) ;
			/*if(grdSearch.GetGridData(lrow, g_0_Printed_YN) == 'Y')
			{
			    btnCopy.SetEnable(true);
			}
			else
			{
			    btnCopy.SetEnable(false);
			}*/
			btnCopy.SetEnable(true);
			grdMst.Call("SELECT");				
		break ;
	}
}
//------------------------------------------
function OnFormatGrid(iCase)
{	
	switch(iCase)
	{
		case 'grdSearch':
			var fg = grdSearch.GetGridControl();			
			if(lstBook_Ccy.value == "VND")
			{
				fg.ColFormat(g_0_NetBooksAmt) = "###,###";
			}
			else
			{
				fg.ColFormat(g_0_NetBooksAmt) = "###,###.##";
			}
			fg.ColFormat(g_0_CalcTAXNetVAT) 	= "###,###.##";
			fg.ColFormat(g_0_TAXVATAmt) 		= "###,###";
		break ;
		case 'grdDtl':
			var fg = grdDtl.GetGridControl();
			if(lstTransCcy.value != "VND")
			{
				fg.ColFormat(g_UPrice) 			= "###,###,###,###,###.##";
				fg.ColFormat(g_Ext_Price) 		= "###,###,###,###,###.#####";
				fg.ColFormat(g_Net_Trans_Amt) 	= "###,###,###,###,###.##";
			}
			else
			{
				fg.ColFormat(g_UPrice) 			= "###,###,###,###,###";
				fg.ColFormat(g_Ext_Price) 		= "###,###,###,###,###";
				fg.ColFormat(g_Net_Trans_Amt) 	= "###,###,###,###,###";
			}
			fg.ColFormat(g_Qty) = "###,###,###,###,###.###";
			if(lstBook_Ccy.value != "VND")
			{
				fg.ColFormat(g_Net_Books_Amt) = "###,###,###,###,###.##";
			}
			else
			{
				fg.ColFormat(g_Net_Books_Amt) = "###,###,###,###,###,###";
			}			
		break ;
		case 'grdDtlVAT':
			var fg = grdDtlVAT.GetGridControl();
			if(lstTransCcy.value != "VND")
			{
				fg.ColFormat(g_calc_amt_tax) = "###,###,###,###,###.##";
				fg.ColFormat(g_calc_net_vat) = "###,###,###,###,###.##";
				fg.ColFormat(g_vat_tr_amt) = "###,###,###,###,###.##";				
			}
			else
			{
				fg.ColFormat(g_calc_amt_tax) = "###,###,###,###,###";
				fg.ColFormat(g_calc_net_vat) = "###,###,###,###,###";
				fg.ColFormat(g_vat_tr_amt) = "###,###,###,###,###";							
			}
			if(lstBook_Ccy.value != "VND")
			{
				fg.ColFormat(g_calc_amt) = "###,###,###,###,###.##";				
				fg.ColFormat(g_vat_bk_amt) = "###,###,###,###,###.##";
			}
			else
			{
				fg.ColFormat(g_calc_amt) = "###,###,###,###,###";
				fg.ColFormat(g_vat_bk_amt) = "###,###,###,###,###,###";
			}
			fg.ColFormat(g_vat_tax_amt) = "###,###,###,###,###,###";
		break ;
		case 'grdDtlCost':
			var fg = grdDtlCost.GetGridControl();
			if(lstTransCcy.value != "VND")
			{
				fg.ColFormat(g_trans_amt) = "###,###,###,###,###.##";				
			}
			else
			{
				fg.ColFormat(g_trans_amt) = "###,###,###,###,###";
			}
			if(lstBook_Ccy.value == "VND")			
				fg.ColFormat(g_books_amt) = "###,###,###,###,###";
			else
				fg.ColFormat(g_books_amt) = "###,###,###,###,###.##";
		break ;
	}
}
//-------------------------------------------------
function OnNew(iCase)
{
	switch(iCase)
	{
		case 'Master':
			if(grdMst.GetStatus() != 20)
			{
				grdMst.StatusInsert();
				lstStatus.value = "1";
				//lstBook_Ccy.value = 'VND';
				txtBookRate.text = txtBK_RATE.text;
				lstTransCcy.value = "VND";
				txtTransCcy.text = "1";
				txtARAccCD.text = txtaccd_dr.text ;
				txtARAccNM.text = txtacnm_dr.text ;
				txtARAccPK.text = txtacpk_dr.text ;
				txtPersonNM.text = txtEmpNM.text ;
				txtTransTCD.text = txtTrTP_AR_CD.text;
				txtTransTNM.text = txtTrTP_AR_NM.text ;
				txtTransTPK.text = txtTrTP_AR.text ;
				txtemp_pk.text = g_user_pk ;
				txtPersonCD.text = g_user_id ;					
				g_update = 1; // inserted flag
				idTab_Child.SetPage(1);
			}
			else			
			{
				alert("Already add new data!");
			}
		break ;
	}
}

function OnSave(iCase)
{
	switch(iCase)
	{
		case '1':
			if(ValidateData('Master'))
			{
				grdMst.Call();
			}	
		break ;
	}
}
//---------------------------------------------------
function ValidateData(iCase)
{
	switch(iCase)
	{
		case 'Master':
			if(chkAuto.value == "F")// khong tu dong 
			{
				if(Trim(txtvoucher_no.text)=="") 
				{
					alert("Voucher No is not null" + "\n" + "Mã số chứng từ thì không được rỗng!!!");
					txtvoucher_no.GetControl().focus();
					return false ;		
				}
			}
			/*if(Trim(txtCustomOffPK.text)=="")
			{
				alert("Custom Office is not null" + "\n" + "Văn phòng hải quan thì không được rỗng!!!");
				return false ;						
			}*/
			if(Trim(txtConsignorPK.text)=="")
			{
				alert("A/R is not null" + "\n" + "Người phải trả tiền thì không được rỗng!!!");
				return false ;						
			}
			if(Trim(txtImporterPK.text)=="")
			{
				alert("Importer is not null" + "\n" + "Nơi nhập hàng hóa thì không được rỗng!!!");
				return false ;						
			}
			if(Trim(txtARCollPK.text)=="")
			{
				alert("A/R Collection is not null" + "\n" + "Người thu tiền không được rỗng!!!");
				return false ;						
			}
			if(Trim(txtBookRate.text)=="")
			{
				alert("Book Ccy is not null" + "\n" + "Tỷ giá đồng tiền ghi sổ không được rỗng!!!");
				return false ;						
			}
			if(Trim(txtSerialNo.text)=="")
			{
				//alert("Serial No is not null" + "\n" + "Số Seri hóa đơn không được rỗng!!!");
				//return false ;						
			}
			if(Trim(lstTransCcy.value)=="")
			{
				alert("Transaction Ccy is not null" + "\n" + "Tiền giao dịch không được rỗng!!!");
				return false ;						
			}
			if(Trim(txtTransCcy.text)=="")
			{
				alert("Transaction Rate is not null" + "\n" + "Tỷ giá tiền giao dịch không được rỗng!!!");
				return false ;						
			}
			if(Trim(txtInvNo.text)=="")
			{
				//alert("Invoice No is not null" + "\n" + "Mã số hóa đơn không được rỗng!!!");
				//return false ;						
			}
			if(Trim(txtTransTPK.text)=="")
			{
				alert("Transaction Type is not null" + "\n" + "Loại giao dịch không được rỗng!!!");
				return false ;						
			}
			if(Trim(txtDesc.text)=="")
			{
				alert("Description is not null" + "\n" + "Diễn giải không được rỗng!!!");
				return false ;						
			}			
			if(Trim(txtLocalDesc.text)=="")
			{
				alert("Local Description is not null" + "\n" + "Diễn giải tiếng việt không được rỗng!!!");
				return false ;						
			}			
			return true;
		break ;
	}
}
//------------------------------------------------------------
function OnDelete(iCase)
{
	switch(iCase)
	{
		case '1':
			if(confirm("Are you sure you want to delete this AR?"))
			{
				grdMst.StatusDelete();	
				grdMst.Call();
			}	
		break ;
	}
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
	grdInfor.SetGridText(grdInfor.rows - 1, 7, txtCRCA_PK.GetData());
}
//------------------------------------------------------------
function PopupClickCtrl_Item()
{
    if ((event.col == 2) || (event.col == 3))
    {
		var path   = System.RootURL + "/standard/forms/gf/co/gfco002006.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + '' + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.GetData() + "&dsqlid=SP_SEL_POPUP_ITEM_N" + '&col_code=Item Name' + '&col_nm=Item Name Local';
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
        		        if (tmp[2] == 'SERIAL NO')
		                {
		                    grdInfor.SetGridText(grdInfor.selrow + i, 6, txtSerialNo.text );
		                }
		                if (tmp[2] == 'INVOICE DATE')
		                {
		                    grdInfor.SetGridText(grdInfor.selrow + i, 6, dtInvoiceDT.value );
		                }
		                if (tmp[2] == 'INVOICE NO')
		                {
		                    grdInfor.SetGridText(grdInfor.selrow + i, 6, txtInvNo.text);
		                }
		                else if (tmp[2] == 'TAX RATE')
		                {
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
        		        if (tmp[2] == 'INVOICE NO')
		                {
		                    grdInfor.SetGridText(grdInfor.selrow + i, 6, txtInvNo.text );
		                }
		                if (tmp[2] == 'INVOICE DATE')
		                {
		                    grdInfor.SetGridText(grdInfor.selrow + i, 6, dtInvoiceDT.value );
		                }
		                if (tmp[2] == 'SERIAL NO')
		                {
		                    grdInfor.SetGridText(grdInfor.selrow + i, 6, txtSerialNo.text );
		                }
                    }
                }
                //txtSEQ.GetControl().focus();
            }
            
        }
	}
	else if (event.col == 6)
	{
	    onDBList();
	}
}

function onDBList()
{
    var ctrl = grdInfor.GetGridControl();
    if ((grdInfor.GetGridData( ctrl.row, 4) == 'M') || (grdInfor.GetGridData(ctrl.row, 4) == 'C'))
	{
		if (grdInfor.GetGridData( ctrl.row, 4) == 'C')
		{
		    var ls_str = grdInfor.GetGridData(ctrl.row, 2);
			var temp = new Array();
            temp = ls_str.split(' ');
			var ls_temp = temp[0];
			
			var fpath   = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + ls_str + "&company=" + lstCompany.GetData() + '&dsqlid=SP_SEL_ITEMNM_POPUP&col_code=' + ls_temp +" CODE" + '&col_nm=' + ls_temp + " NAME";
            var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
            if ( object != null )  
            {
                if (object[0] != 0)
                {
                    grdInfor.SetGridText(ctrl.row, 6, object[1]);
                    grdInfor.SetGridText(ctrl.row, 8, object[2]);
                    //grdInfor.SetGridText(ctrl.row, 9, object[1]);
                }
            }
        }
        else
        {
			if (grdInfor.GetGridData( ctrl.row, 2) == "CUSTOMER  NAME")
	        {
				var path    = System.RootURL + '/standard/forms/60/08/60080030_popup_customer.aspx?com_pk='+ lstCompany.value; 
		        var object  = System.OpenModal( path ,800 , 550 , 'resizable:yes;status:yes');
		        if ( object != null )
		        {
		            if (object[0] != 0)
                    {
		                grdInfor.SetGridText(ctrl.row, 6,object[1] );
		                grdInfor.SetGridText(ctrl.row, 8,object[0]);
		                
		                grdInfor.SetGridText(ctrl.row, 9, object[2] );
		            }
                }
            }
            else if ( grdInfor.GetGridData(ctrl.row, 2)== "Bank Account No." || grdInfor.GetGridData( ctrl.row, 2 )== "DEPOSIT ACCOUNT NO" || grdInfor.GetGridData( ctrl.row, 2 )== "BANK ACCOUNT NUMBER" || grdInfor.GetGridData( ctrl.row, 2 )== "BANK ACCOUNT NO.")
	        {
	            var ls_ccy = txtcur.GetData();
	            var fpath   = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + "" + "&val1=" + ls_ccy + "&company="+ lstCompany.GetData() + '&dsqlid=SP_SEL_BANK_POPUP&col_code=' + 'Bank Code'  + '&col_nm=' + 'Bank Name';
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
                var fpath   = System.RootURL + "/standard/forms/gf/co/ffco002003.aspx";
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

function Save_CtrlItem()
{   
    for (i = 1; i < grdInfor.rows; i++)
    {
        grdInfor.SetGridText(i, 7, txtCRCA_PK.text); 
    }            
	dso_upd_crca_ctrlitem.Call();
}

function OnDeleteCtrl()
{
    var ctrl = grdInfor.GetGridControl();
    if (grdInfor.rows > 1)
    {
        var i = 1;
        var j = 1;        
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

function OnSearchTab()
{
	var lcurrtab = idTab_Child.GetCurrentPageNo();
	if(g_insert)
	{
		if(confirm("Do you want to save new AP slip?"))
		{	
			OnSave("1");
		}	
		else
		{
			g_insert = false ;
		}
	}
	else
	{
		if(lcurrtab == 0)
		{
			dso_upd_crca_ctrlitem.Call("SELECT");
		}
		else if(lcurrtab == 1)
		{
			dso_upd_crca_item.Call("SELECT");
		}
		else if(lcurrtab == 2)
		{
			dso_upd_crca_vat.Call("SELECT");
		}
		else if(lcurrtab == 3)
		{
			dso_upd_crca_pl.Call("SELECT");
		}
		else if(lcurrtab == 4)
		{
			dso_upd_crca_cost.Call("SELECT");
		}
	}
}

function OnAdd_Item()
{	
	switch(lstGetData.value)
	{
		case "ED":
			var l_newrow;
			grdDtl.AddRow();
			l_newrow = grdDtl.rows - 1;
			grdDtl.SetGridText(l_newrow, g_tac_crca_pk, txtCRCA_PK.text);
			grdDtl.SetGridText(l_newrow, g_tac_abacctcode_pk, txtacpk_cr.text);     // account pk
			grdDtl.SetGridText(l_newrow, g_Ac_code_Revenue, txtaccd_cr.text);     // account code
			grdDtl.SetGridText(l_newrow, g_AccountName, txtacnm_cr.text);     // account name
			grdDtl.SetGridText(l_newrow, g_Desc, txtDesc.text );     // English description
			grdDtl.SetGridText(l_newrow, g_Local_Desc,   txtLocalDesc.text  );     // local description			
		break ;
		case "TO":
			var fpath   = System.RootURL + "/standard/forms/gf/ca/gfca00020_GetPO.aspx";
            var object  = System.OpenModal(fpath , 800 , 600 , 'resizable:yes;status:yes'); 
			var i, j;
			if(object != null)
			{
				for(i = 0; i < object.length; i++)
				{
					var arr = new Array();
					arr = object[i];	
					grdDtl.AddRow();	
					j = grdDtl.rows - 1;
					grdDtl.SetGridText(j, g_OrderNo, arr[2]);	// slip No				
					grdDtl.SetGridText(j, g_tco_item_pk, arr[13]); // Item PK
					grdDtl.SetGridText(j, g_Item_code, arr[3]);	// Item code
					grdDtl.SetGridText(j, g_Item_Name, arr[4]); // Item name
					grdDtl.SetGridText(j, g_Unit, arr[5]);	// UOM
					grdDtl.SetGridText(j, g_Qty, arr[8]); // output qty
					grdDtl.SetGridText(j, g_WH, arr[20]);	// warehouse id
					grdDtl.SetGridText(j, g_WH_PK, arr[19]); // warehouse pk
					grdDtl.SetGridText(j, g_Ac_code_Revenue, txtaccd_cr.text );	// account code revenue
					grdDtl.SetGridText(j, g_AccountName, txtacnm_cr.text ); //acc name vevenue 
					grdDtl.SetGridText(j, g_tac_abacctcode_pk, txtacpk_cr.text ); // acc PK vevenue 
					grdDtl.SetGridText(j, g_Desc, txtDesc.text ); //description
					grdDtl.SetGridText(j, g_Local_Desc, txtLocalDesc.text ); // local desc													
					grdDtl.SetGridText(j, g_tac_crca_pk, txtCRCA_PK.text );
				}					
			}			
		break ;
		case "IE":
			var fpath   = System.RootURL + "/standard/forms/gf/ca/gfca00020_export_popup.aspx?compk=" + lstCompany.value;
			var object  = System.OpenModal(fpath, 900, 600, 'resizable:yes;status:yes'); 		
			var i, j, l_books_amt = 0 ;
			if(object != null)
			{
				for( i = 12; i < object.length; i++)
				{
					grdDtl.AddRow();
					j = grdDtl.rows - 1;
					var arr = new Array();
					arr = object[i];
					grdDtl.SetGridText(j, g_tac_crca_pk, txtCRCA_PK.text);
					grdDtl.SetGridText(j, g_tco_item_pk, arr[3] ); // tco_item_pk
					grdDtl.SetGridText(j, g_Item_code, arr[4] ); // item_code
					grdDtl.SetGridText(j, g_Item_Name, arr[5] ); // item_name
					grdDtl.SetGridText(j, g_Unit, arr[6] ); // unit
					grdDtl.SetGridText(j, g_UPrice, arr[8] ); // unit price
					grdDtl.SetGridText(j, g_Qty, arr[7] ); // qty
					grdDtl.SetGridText(j, g_Ext_Price, arr[9] ); // ext price
					grdDtl.SetGridText(j, g_Net_Trans_Amt, arr[9] ); // trans amt
					l_books_amt = Number(arr[9]) * Number(txtTransCcy.text) / Number(txtBookRate.text); 					
					grdDtl.SetGridText(j, g_Net_Books_Amt, l_books_amt ); // books amt
					grdDtl.SetGridText(j, g_Ac_code_Revenue, txtaccd_cr.text ); // account code
					grdDtl.SetGridText(j, g_AccountName, txtacnm_cr.text ); // account name
					grdDtl.SetGridText(j, g_tac_abacctcode_pk, txtacpk_cr.text ); // acc pk
					grdDtl.SetGridText(j, g_Desc, txtDesc.text ); // description
					grdDtl.SetGridText(j, g_Local_Desc, txtLocalDesc.text ); // local description
					grdDtl.SetGridText(j, g_tex_decl_dtl_pk, arr[2] ); // pk																																			
				}
			}
		break ;
	}
}

function OnSave_Item()
{
	dso_upd_crca_item.Call();
}

function OnDelete_Item()
{
	var i ;
	var fg = grdDtl.GetGridControl();
	for(i = 1; i < grdDtl.rows ; i++)
	{
		if(fg.isSelected(i) == true)
		{
			grdDtl.SetRowStatus(i, 0x40);
		}
	}
	dso_upd_crca_item.Call();
}

function OnDblClickDtlItem()
{
	var l_row = event.row ;
	var l_col = event.col ;
	if(l_col == g_Ac_code_Revenue)
	{
		Popup_AccDtl();
	}
	else if(l_col == g_Item_code )
	{
		Popup_Item();
	}
	else if(l_col == g_WH)
	{
		Popup_WH();
	}
}
//------------------------------------------
function Popup_AccDtl()
{
    var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "155" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_SEL_ACCT_POPUP";
    var o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
    if (o != null)
    {
        if(o[0] != 0)
        {
            grdDtl.SetGridText(grdDtl.selrow, g_tac_abacctcode_pk, o[3]);
            grdDtl.SetGridText(grdDtl.selrow, g_Ac_code_Revenue, o[0]);
            grdDtl.SetGridText(grdDtl.selrow, g_AccountName, o[1]);
        }
        txtseq.GetControl().focus();
    }
    else
    {
        txtseq.GetControl().focus();
    }
}
//------------------------------------------
function Popup_WH()
{
    var fpath = System.RootURL + "/standard/forms/gf/ca/PopUpGetWareHouse.aspx" ;
    var o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
    if (o != null)
    {
        if(o[0] != 0)
        {
            grdDtl.SetGridText(grdDtl.selrow, g_WH_PK, o[0]);
            grdDtl.SetGridText(grdDtl.selrow, g_WH, o[2]);
        }
        txtseq.GetControl().focus();
    }
    else
    {
        txtseq.GetControl().focus();
    }
}
//------------------------------------------
function Popup_Item()
{
    var i = 0, l_row;
    if (grdDtl.GetGridData(grdDtl.row, g_tco_item_pk) != "")
    {
        fpath = System.RootURL + "/standard/forms/gf/ca/gfca00020_1.aspx?type=PROD&IsSelectItem=1";
    }
    else
    {
       var fpath   = System.RootURL + "/standard/forms/gf/ca/gfca00020_1.aspx?type=PROD";
    }           
    var aValue      = System.OpenModal(  fpath , 900 , 580 , 'resizable:yes;status:yes');	  
    if ( aValue != null ) 
    {
        if (aValue.length > 0)
        {
			l_row = grdDtl.rows - 1 ;
            for (i = 0; i< aValue.length; ++i)
            {                
                var tmp = Array();
                tmp = aValue[i];                
                if (tmp[0] != 0)
                {
                    if(i != 0)
                    {
                        grdDtl.AddRow();						
                    }
                    grdDtl.SetGridText(l_row + i, g_tac_abacctcode_pk, txtacpk_cr.text);     // account pk
                    grdDtl.SetGridText(l_row + i, g_Ac_code_Revenue, txtaccd_cr.text);     // account code
                    grdDtl.SetGridText(l_row + i, g_AccountName, txtacnm_cr.text);     // account name
                    grdDtl.SetGridText(l_row + i, g_Desc, txtDesc.text );     // English description
                    grdDtl.SetGridText(l_row + i, g_Local_Desc,   txtLocalDesc.text  );     // local description
                    grdDtl.SetGridText(l_row + i, g_tco_item_pk, tmp[0]);     // PK
                    grdDtl.SetGridText(l_row + i, g_Item_code, tmp[1]);     // Item Name
                    grdDtl.SetGridText(l_row + i, g_Item_Name, tmp[2]);     // Item Name Local
                    grdDtl.SetGridText(l_row + i, g_Unit, tmp[5]);     // Unit                    
                    grdDtl.SetGridText(l_row + i, g_tac_crca_pk, txtCRCA_PK.text);     // PK Master
                }
            }
        }
    }
}
//------------------------------------------
function OnEditDtl()
{
	var l_row = event.row ;
	var l_col = event.col ;
	var l_price = 0 , l_qty = 0, l_ext_price = 0, l_bk_amt = 0, l_tr_rate = 0, l_bk_rate = 0;
	if(l_col == g_UPrice || l_col == g_Qty)	
	{
		l_price = grdDtl.GetGridData(l_row, g_UPrice);
		l_qty = grdDtl.GetGridData(l_row, g_Qty);
		l_ext_price = Number(l_price * l_qty);
		l_ext_price = FormatCalculate(lstTransCcy.value, l_ext_price);
		l_tr_rate = Number(txtTransCcy.text) ;
		l_bk_rate = Number(txtBookRate.text) ;
		l_bk_amt = Number(l_ext_price * l_tr_rate / l_bk_rate);
		l_bk_amt = FormatCalculate(lstBook_Ccy.value, l_bk_amt);
		grdDtl.SetGridText(l_row, g_Ext_Price, l_ext_price );		
		grdDtl.SetGridText(l_row, g_Net_Trans_Amt, l_ext_price );
		grdDtl.SetGridText(l_row, g_Net_Books_Amt, l_bk_amt );
	}
	else if(l_col == g_Net_Trans_Amt)
	{		
		l_ext_price = Number(grdDtl.GetGridData(l_row, g_Net_Trans_Amt));
		l_bk_amt = Number(l_ext_price * l_tr_rate / l_bk_rate);
		l_bk_amt = FormatCalculate(lstBook_Ccy.value, l_bk_amt);
		grdDtl.SetGridText(l_row, g_Net_Books_Amt, l_bk_amt );
	}
}
//------------------------------------------
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
//---------------------------------------------------------------------------
function OnEditDtlVAT()
{
	var l_row = event.row ;
	var l_col = event.col ;
	var l_calc_tr_amt = 0, l_calc_bk_amt = 0, l_vat_rate = 0;
	var l_vat_tr_amt = 0, l_vat_bk_amt = 0;
	var l_tr_rate = 0, l_vat_tax_amt = 0;
	if(l_col == g_vat_rate)
	{
		l_calc_tr_amt = Number(grdDtlVAT.GetGridData(l_row, g_calc_amt_tax));
		l_calc_bk_amt = Number(grdDtlVAT.GetGridData(l_row, g_calc_amt));
		l_vat_rate = grdDtlVAT.GetGridData(l_row, g_vat_rate);
		if(l_vat_rate != "00" && l_vat_rate != "01" && l_vat_rate != "NO")
		{
			l_vat_tr_amt = FormatCalculate(lstTransCcy.value, Number(l_calc_tr_amt * Number(l_vat_rate) / 100));
			l_vat_bk_amt = FormatCalculate(lstBook_Ccy.value, Number(l_calc_bk_amt * Number(l_vat_rate) / 100));
		}
		grdDtlVAT.SetGridText(l_row, g_vat_tr_amt, l_vat_tr_amt);
		grdDtlVAT.SetGridText(l_row, g_vat_bk_amt, l_vat_bk_amt);
		l_tr_rate = Number(txtTransCcy.text);
		l_vat_tax_amt = Number(l_vat_tr_amt * l_tr_rate);
		grdDtlVAT.SetGridText(l_row, g_vat_tax_amt, l_vat_tax_amt);		
	}
}
//---------------------------------------------------------------------------
function OnDblDtlVAT()
{
	var l_col = event.col ;
	var l_row = event.row ;
	if(l_col == g_vat_accd)
	{
    var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "333110" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_SEL_ACCT_POPUP";
    var o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
		if (o != null)
		{
			if(o[0] != 0)
			{
				grdDtlVAT.SetGridText(l_row, g_tac_abacctcode_pkvat, o[3] );
				grdDtlVAT.SetGridText(l_row, g_vat_accd, o[0] );
				grdDtlVAT.SetGridText(l_row, g_vat_acnm, o[1] );
			}
			txtseq.GetControl().focus();
		}
		else
		{
			txtseq.GetControl().focus();
		}		
	}
}
//---------------------------------------------------------------------------
function OnSave_VAT()
{
   dso_upd_crca_vat.Call();
}
//---------------------------------------------------------------------------
function OnDblDtlPL()
{
	var l_col = event.col ;
	var l_row = event.row ;
	if(l_col == g_pl_cd)
	{
        var fpath   = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
        var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
        if ( object != null )  
        {
            if (object[0] != 0)
            {
                grdDtlPL.SetGridText(l_row, g_tac_abplcenter_pk, object[2]);     // PK
                grdDtlPL.SetGridText(l_row, g_pl_cd, object[0]);     // PL Code
                grdDtlPL.SetGridText(l_row, g_pl_nm, object[1]);     // PL Name
            }
        }		
	}
}
//---------------------------------------------------------------------------
function OnDblDtlCost()
{
     var l_row = event.row ;
	 var l_col = event.col ;
	 if(l_col == g_cost_accd)
	 {
    var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "632" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_SEL_ACCT_POPUP";
    var o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
		if (o != null)
		{
			if(o[0] != 0)
			{
				grdDtlCost.SetGridText(l_row, g_tac_abacctcode_pk_cost, o[3]);
				grdDtlCost.SetGridText(l_row, g_cost_accd, o[0]);
				grdDtlCost.SetGridText(l_row, g_cost_acnm, o[1]);
			}
			txtseq.GetControl().focus();
		}
		else
		{
			txtseq.GetControl().focus();
		}
		
	 }	 
}
//---------------------------------------------------------------------------
function OnSave_Cost()
{
	dso_upd_crca_cost.Call();
}
//---------------------------------------------------------------------------
function OnConfirm()
{
	if(confirm("Are you sure you want to confirm this slip?"))
	{
		txtcrca_pk_lst.text = txtCRCA_PK.text + "," ;	
		dso_ar_confirm.Call();		
	}	
}
//---------------------------------------------------------------------------
function OnCancel()
{
	txtcrca_pk_lst.text = txtCRCA_PK.text + ",";
	var fpath = System.RootURL + '/standard/forms/gf/ca/gfca00010_causecancel.aspx';
	var wWidth = 500;
	var wHeight = 400;
	var x = Math.round((screen.availWidth - wWidth)/2);
	var y = Math.round((screen.availHeight - wHeight)/2);
	var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +"lef="+ x +",top=" + y;	
	var object = System.OpenModal(fpath, wWidth, wHeight, features, window);		
	if(object != null)
	{
	    if(object[0] != 0)
	    {
	        txtCancelCause.SetDataText(object[0]);
	        dso_ar_cancel.Call();  // Cancell the invoice			
	    }
    }		
}
//---------------------------------------------------------------------------
function OnShowTAccount()
{
	var l_seq = txtseq.text ;
	if(txtseq.text != "")
	{		
		if(lstStatus.value == "2" || lstStatus.value == "0")
		{		
			var fpath = System.RootURL + '/standard/forms/gf/hg/gfhg00020_popup.aspx?PK_ROW=' + txtseq.text + '&ROW=' + 1 + '&ROWS=&APPRCANCEL=';
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
//---------------------------------------------------------------------------
function OnReplicate()
{
	if(confirm('Are you sure you want to replicate this slip?'))
	{
		txtcrca_pk_lst.SetDataText(txtCRCA_PK.text + ",");
		dso_ar_replicate.Call();
	}	
}
//---------------------------------------------------------------------------
function ButtonStatus()
{
	if(lstStatus.value == '1')
	{
		ibtnNew.SetEnable(true);
		ibtnSave.SetEnable(true);
		ibtnDelete.SetEnable(true);
		btnConfirm.SetEnable(true);
		btnCancel.SetEnable(false);
//		btnReplicate.SetEnable(false);
		ibtnPrint.SetEnable(false);
		//control item
		btnAdd_More.SetEnable(true);
		btnSave_More.SetEnable(true);
		btnDel_More.SetEnable(true);
		// tab Item
		btnNew_D.SetEnable(true);
		btnSave_D.SetEnable(true);
		btnDel_D.SetEnable(true);
		//tab VAT
		btnSave_VAT.SetEnable(true);
		//tab PL
		btnSave_PL.SetEnable(true);
		// tab Costing
		btnSave_Allocate.SetEnable(true);
	}
	else if(lstStatus.value == '2')
	{
		ibtnNew.SetEnable(true);
		ibtnSave.SetEnable(false);
		ibtnDelete.SetEnable(false);
		btnConfirm.SetEnable(false);
		btnCancel.SetEnable(true);
//		btnReplicate.SetEnable(false);
		ibtnPrint.SetEnable(true);
		//control item
		btnAdd_More.SetEnable(false);
		btnSave_More.SetEnable(false);
		btnDel_More.SetEnable(false);
		// tab Item
		btnNew_D.SetEnable(false);
		btnSave_D.SetEnable(false);
		btnDel_D.SetEnable(false);
		//tab VAT
		btnSave_VAT.SetEnable(false);
		//tab PL
		btnSave_PL.SetEnable(false);
		// tab Costing
		btnSave_Allocate.SetEnable(false);		
	}
	else if(lstStatus.value == '0')
	{
		ibtnNew.SetEnable(true);
		ibtnSave.SetEnable(false);
		ibtnDelete.SetEnable(false);
		btnConfirm.SetEnable(false);
		btnCancel.SetEnable(false);
//		btnReplicate.SetEnable(false);
		ibtnPrint.SetEnable(true);		
		//control item
		btnAdd_More.SetEnable(false);
		btnSave_More.SetEnable(false);
		btnDel_More.SetEnable(false);
		// tab Item
		btnNew_D.SetEnable(false);
		btnSave_D.SetEnable(false);
		btnDel_D.SetEnable(false);
		//tab VAT
		btnSave_VAT.SetEnable(false);
		//tab PL
		btnSave_PL.SetEnable(false);
		// tab Costing
		btnSave_Allocate.SetEnable(false);		
	}
	else if(lstStatus.value == '3')
	{
		ibtnNew.SetEnable(true);
		ibtnSave.SetEnable(false);
		ibtnDelete.SetEnable(false);
		btnConfirm.SetEnable(false);
		btnCancel.SetEnable(false);
		//btnReplicate.SetEnable(true);
		ibtnPrint.SetEnable(true);
		//control item
		btnAdd_More.SetEnable(false);
		btnSave_More.SetEnable(false);
		btnDel_More.SetEnable(false);
		// tab Item
		btnNew_D.SetEnable(false);
		btnSave_D.SetEnable(false);
		btnDel_D.SetEnable(false);
		//tab VAT
		btnSave_VAT.SetEnable(false);
		//tab PL
		btnSave_PL.SetEnable(false);
		// tab Costing
		btnSave_Allocate.SetEnable(false);		
	}
}	
//---------------------------------------------------------------------------
function OnPrint()
{
    if(lstRptType.value == '0')
    {
	    var url = System.RootURL + "/standard/reports/gf/ca/gfca00020.aspx?company_pk=" + lstCompany.value + "&tac_hgtrh_pk=" + txtseq.text + "&tac_crca_pk=" + txtCRCA_PK.text ;
	    System.OpenTargetPage(url);		
    }
    else if(lstRptType.value == '1')	    
    {
	    var url = System.RootURL + "/standard/reports/gf/ca/gfca00020_HDBTC.aspx?company_pk=" + lstCompany.value + "&tac_hgtrh_pk=" + txtseq.text + "&tac_crca_pk=" + txtCRCA_PK.text ;
	    System.OpenTargetPage(url);		    
    }
    else if(lstRptType.value == '2')
    {
        dso_upd_vat_inv.Call();
    }
}
//---------------------------------------------------------------------------
function OnCheckCost()
{
	
}
//---------------------------------------------------------------------------
function OnShowContract()
{
	var fpath = System.RootURL + "/standard/forms/gf/ca/gfca00010_contract.aspx";
	var o = System.OpenModal( fpath , 850 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
	if (o != null)
	{
		if(o[0] != 0)
		{
			txtContractPK.text = o[0];
			txtContractNo.text = o[1];
			txtConsignorPK.text = o[2];
			txtConsignorCD.text = o[3];
			txtConsignorNM.text = o[4];
			txtImporterPK.text = o[2];
			txtImporterCD.text = o[3];
			txtImporterNM.text = o[4];			
			txtARCollPK.text = o[5];
			txtARCollCD.text = o[6];
			txtARCollNM.text = o[7];			
		}
		txtseq.GetControl().focus();
	}
	else
	{
		txtseq.GetControl().focus();
	}			
}
//---------------------------------------------------------------------------
function OnSave_PL()
{
	dso_upd_crca_pl.Call();
}
//---------------------------------------------------------------------------
function OnCopy()
{
    var l_printed = lblPrint.GetData();
    if(l_printed == '') 
    {        
        alert('Only reports already printed out, can cancelled on this form!!!');
        return false ;
    }
    if(confirm('Are you sure you want to copy this voucher?'))
    {
        dso_ar_copy.Call();
    }    
}
//---------------------------------------------------------------------------
</script>
<body style="margin:0; padding:0;">
<!---------------------------------------------------------------------------------------------------------->
<gw:data id="dso_get_rate" onreceive="SetExRate()"> 
        <xml> 
            <dso type="process" procedure="ac_GET_RATE" > 
                <input> 
                     <input bind="lstCompany" />
                     <input bind="lstTransCcy" />
                     <input bind="dtTransDT" />
                </input>
                <output>
                     <output bind="txtTR_RATE"/>
                     <output bind="txtBK_RATE"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
	
    <gw:data id="dso_init_form" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process" procedure="ac_sel_60110020C_code_ar_os" >
                <input> 
                     <input bind="lstCompany"/>
					 <input bind="txtUser_PK"/>
                </input>  
                <output>
                     <output bind="txtaccd_dr" />
					 <output bind="txtacpk_dr" />
					 <output bind="txtacnm_dr" />
					 <output bind="txtaccd_cr" />
					 <output bind="txtacpk_cr" />
					 <output bind="txtacnm_cr" />
					 <output bind="txtaccd_vat" />
					 <output bind="txtacpk_vat" />
					 <output bind="txtacnm_vat" />
					 <output bind="txtvat_calc" />
					 <output bind="txtEmpNM" />
					 <output bind="txtTrTP_AR_CD" />
					 <output bind="txtTrTP_AR_NM" />
					 <output bind="txtTrTP_AR" />
					 <output bind="txtReturn" />
				</output> 
            </dso> 
        </xml> 
    </gw:data>
	
    <gw:data id="dso_ar_list" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60110020C_crca_lst_os_1" >
                <input bind="grdSearch">
                    <input bind="lstCompany"/>
                    <input bind="dtTrDatefr" />
                    <input bind="dtTrDateto" />
					<input bind="lstSliStatus" />
					<input bind="txtVoucherNo_Sr" />
					
					<input bind="txtInvNo_Sr" />
					<input bind="txtSeq_Sr" />
					<input bind="txtCustPK_Sr" />					
                </input>
                <output bind="grdSearch"/>
            </dso>
        </xml>
    </gw:data>

	<gw:data id="grdMst" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="control" parameter="0,1,2,3,4,6,7,8,11,14,17,20,23,24,25,26,29,30,32,34,35,36,37,40,41,42,44" function="ac_sel_60110020C_crca_os" procedure="ac_upd_60110020C_crca_os" > 				
				<inout>
					<inout bind="txtCRCA_PK" /> 
					<inout bind="lstCompany" />
					<inout bind="lstVoucherType" />	
					<inout bind="chkAuto" />	
					<inout bind="txtvoucher_no" />
					
					<inout bind="txtseq" />
					<inout bind="dtTransDT" />
					<inout bind="lstStatus" />
					<inout bind="txtemp_pk" />
					<inout bind="txtPersonCD" />					
					
					<inout bind="txtPersonNM" />
					<inout bind="txtCustomOffPK" />					
					<inout bind="txtCustomOffCD" />
					<inout bind="txtCustomOffNM" />					
					<inout bind="txtConsignorPK" />
					
					<inout bind="txtConsignorCD" />
					<inout bind="txtConsignorNM" />					
					<inout bind="txtImporterPK" /> 					
					<inout bind="txtImporterCD" />					
					<inout bind="txtImporterNM" />					
					
					<inout bind="txtARCollPK" />	
					<inout bind="txtARCollCD" />
					<inout bind="txtARCollNM" />
					<inout bind="txtBookRate" />					
					<inout bind="lstTransCcy" />
					
					<inout bind="txtTransCcy" />		
					<inout bind="txtARAccPK" />
					<inout bind="txtARAccCD" />
					<inout bind="txtARAccNM" />					
					<inout bind="txtSerialNo" />
					
					<inout bind="txtInvNo" />					
					<inout bind="txtEnclose" />					
					<inout bind="txtDeclNo" />					
					<inout bind="txtDueDate" />
					<inout bind="dtDueDate" />					
					
					<inout bind="txtDesc" />
					<inout bind="txtLocalDesc" />					
					<inout bind="txtTransTPK" />
					<inout bind="txtTransTCD" />
					<inout bind="txtTransTNM" />										
					
					<inout bind="txtContractPK" />					
					<inout bind="dtInvoiceDT" />
					<inout bind="txtTrSeq" />		
					<inout bind="txtContractNo" />		
                    <inout bind="txtRecvPerson" />								
                    
					<inout bind="lblPrint" />
				</inout>
			</dso> 
		</xml> 
	</gw:data>

    <gw:data id="dso_upd_crca_ctrlitem" onreceive="OnDataReceive(this)" >
        <xml>
            <dso type="grid" parameter="0,1,4,5,6,7,8,9" function="ac_sel_60110020C_crca_ctrlitem" procedure="ac_upd_60110020C_ctrlitem">
                <input bind="grdInfor">
                    <input bind="txtCRCA_PK"/>
                </input>
                <output bind="grdInfor"/>
            </dso>
        </xml>
    </gw:data>

    <gw:data id="dso_upd_crca_item" onreceive="OnDataReceive(this)" >
        <xml>
            <dso type="grid" parameter="0,1,2,3,8,9,10,11,12,15,17,18,19,20,21" function="ac_sel_60110020C_crcad_do" procedure="ac_upd_60110020C_crcad_do" >
                <input bind="grdDtl">
                    <input bind="txtCRCA_PK"/>
                </input>
                <output bind="grdDtl"/>
            </dso>
        </xml>
    </gw:data>

    <gw:data id="dso_upd_crca_vat" onreceive="OnDataReceive(this)" >
        <xml>
            <dso type="grid" parameter="0,6,7,8,9,12,13,14" function="ac_sel_60110020C_crcad_vat" procedure="ac_upd_60110020C_crcad_vat" >
                <input bind="grdDtlVAT" >
                    <input bind="txtCRCA_PK"/>
					<input bind="lstCompany"/>
                </input>
                <output bind="grdDtlVAT"/>
            </dso>
        </xml>
    </gw:data>

    <gw:data id="dso_upd_crca_pl">
        <xml>
            <dso type="grid" parameter="0,1" function="ac_sel_60110020C_crcad_pl" procedure="ac_upd_60110020C_crcad_pl" >
                <input bind="grdDtlPL">
                    <input bind="txtCRCA_PK"/>
                </input>
                <output bind="grdDtlPL"/>
            </dso>
        </xml>
    </gw:data>
    <gw:data id="dso_upd_crca_cost" onreceive="OnDataReceive(this)" >
        <xml>
            <dso type="grid" parameter="0,7" function="ac_sel_60110020C_crcad_cost" procedure="ac_upd_60110020C_crcad_cost" >
                <input bind="grdDtlCost">
                    <input bind="txtCRCA_PK"/>
					<input bind="lstCompany" />
                </input>
                <output bind="grdDtlCost"/>
            </dso>
        </xml>
    </gw:data>

    <gw:data id="dso_ar_confirm" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process" procedure="ac_pro_60110010_crca_do_conf" >
                <input> 
					<input bind="txtcrca_pk_lst"/>
                    <input bind="txtIndex"/>					 
                </input>  
                <output>
                     <output bind="txtReturn"/>
				</output> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dso_ar_cancel" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process" procedure="ac_pro_60110020_cancel" >
                <input> 
					<input bind="txtcrca_pk_lst" />
                    <input bind="txtIndex" />					 
                    <input bind="txtCancelCause" />					
                </input>  
                <output>
                     <output bind="txtReturn" />
				</output> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dso_ar_copy" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process" procedure="ac_pro_60110020C_copy" >
                <input> 
					<input bind="txtCRCA_PK" />                    			 
                </input>  
                <output>
                     <output bind="txtCRCA_PK" />
				</output> 
            </dso> 
        </xml> 
    </gw:data>
	
    <gw:data id="dso_upd_vat_inv" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process" procedure="ac_upd_60110020C_invoice" >
                <input> 
					<input bind="txtCRCA_PK" />
                </input>  
                <output>
                     <output bind="txtReturn" />
				</output> 
            </dso> 
        </xml> 
    </gw:data>
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

<!---------------------------------------------------------------------------------------------------------->
<table style="width:100%; height:100%; " border="1" cellpadding="0" cellspacing="0" >
	<tr style="height:100%">		
		<td id="idLEFT" width="20%"  >
				<table style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0" >
					<tr style="height:21%">
						<td>
							<table style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td width="30%"></td>
									<td width="20%"></td>
									<td width="30%"></td>
									<td width="17%"></td>
									<td width="3%"></td>
								</tr>
								<tr style="height:4%;">
									<td align="right">Trans Date&nbsp;</td>
									<td align="left"><gw:datebox id="dtTrDatefr" lang="1" /></td>
									<td align="center">~</td>
									<td align="right" colspan="2"><gw:datebox id="dtTrDateto" lang="1" /></td>
								</tr>
								<tr style="height:4%;">
									<td align="right">Slip Status&nbsp;</td>
									<td align="left"><gw:list id="lstSliStatus" styles="width:100%" onchange="OnSearch('1')" /></td>
									<td align="center">Voucher No&nbsp;</td>
									<td align="right" colspan="2"><gw:textbox id="txtVoucherNo_Sr" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch('1')" /></td>
								</tr>	
								<tr style="height:4%;">
									<td align="right">Inv No&nbsp;</td>
									<td align="left"><gw:textbox id="txtInvNo_Sr" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch('1')" /></td>
									<td align="center">Seq&nbsp;</td>
									<td align="right" colspan="2"><gw:textbox id="txtSeq_Sr" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch('1')" /></td>
								</tr>
								<tr style="height:4%;">
									<td align="right"><a title="Click here to select Customer" onclick="onSearchCust('Customer')" href="#tips">Customer&nbsp;</a></td>
									<td align="left"><gw:textbox id="txtCustNo_Sr" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch('1')" /></td>
									<td align="left" colspan="2"><gw:textbox id="txtCustNM_Sr" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch('1')" /></td>
									<td align="right"><gw:imgBtn id="btnReset" img="reset" alt="Reset" onclick="OnReset('Customer')" /></td>
								</tr>											
								<tr style="height:4%;">
									<td align="right" colspan="5" ><gw:imgBtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('1')" /></td>
								</tr>									
							</table>
						</td>
					</tr>
					<tr>
						<td style="height:79%" >
							<gw:grid 
								id="grdSearch"  
								header  ="Voucher No|Seq|Trans Date|Invoice No|Net Books. Amt|Calculated TAX Net VAT|TAX VAT. Amt|_PK|_Printed_YN"
								format  ="0|0|4|0|0|0|0|0|0"
								aligns  ="0|1|1|0|3|3|3|0|0"
								defaults="||||||||"
								editcol ="0|0|0|0|0|0|0|0|0"
								widths  ="1500|800|1200|1500|2000|2000|1600|0|0"
								styles  ="width:100%; height:100%"
								sorting ="F"
								acceptNullDate  = "T"
								oncellclick="OnSearch('2')"
							/>
						</td>
					</tr>
				</table>
			</td>
		<td id="idRIGHT" style="width:75%">
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
							<td align="right">Company&nbsp;</td>
							<td align="left"><gw:list id="lstCompany" styles="width:100%" /></td>
							<td align="right">Voucher Type&nbsp;</td>
							<td align="left" colspan="1" ><gw:list id="lstVoucherType" styles="width:100%" csstype="mandatory" /></td>
							<td align="left" colspan="1" ><gw:checkbox id="chkAuto" styles="width:100%" /></td>
							<td align="right">Voucher No&nbsp;</td>
							<td align="left"><gw:textbox id="txtTrSeq" styles="width:100%" /></td>
							<td align="left" ><gw:textbox id="txtvoucher_no" styles="width:100%" /></td>
							<td align="right" colspan="2">Seq&nbsp;</td>
							<td align="left" colspan="1"><gw:textbox id="txtseq" styles="width:100%" onenterkey="OnShowTAccount()" /></td>
							<td align="right"><gw:imgBtn id="ibtnNew" img="new" alt="New" onclick="OnNew('Master')" /></td>
							<td align="right"><gw:imgBtn id="ibtnSave" img="save" alt="Save" onclick="OnSave('1')" /></td>
							<td align="right" colspan="1"><gw:imgBtn id="ibtnDelete" img="delete" alt="Delete" onclick="OnDelete('1')" /></td>
						</tr>
						<tr style="height:4%;">
							<td align="right">Trans Date&nbsp;</td>
							<td align="left"><gw:datebox id="dtTransDT" lang="1" onchange="OnChangeTransDT()" csstype="mandatory" /></td>
							<td align="right">Slip Status&nbsp;</td>
							<td align="left" colspan="2"><gw:list id="lstStatus" /></td>
							<td align="right"><a title="Click here to select Person" onclick="onSearchCust('Person')" href="#tips">Person&nbsp;</a></td>
							<td align="left"><gw:textbox id="txtPersonCD" styles="width:100%" /></td>
							<td align="left" colspan="3" ><gw:textbox id="txtPersonNM" styles="width:100%" /></td>																		
							<td align="right"><gw:icon id="btnConfirm" img="in" text="Confirm" styles="width:100%" onclick="OnConfirm()" /></td>
							<td align="right"><gw:icon id="btnCancel" img="in" text="Cancel" styles="width:100%" onclick="OnCancel()" /></td>
							<td align="right" colspan="1"><gw:icon id="btnCopy" img="in" text="Copy" onclick="OnCopy()" /></td>
							<td align="right" colspan="1"><gw:imgBtn id="ibtnPrint" img="printer" alt="Print" onclick="OnPrint()" /></td>
						</tr>
						<tr style="height:4%;">
							<td align="right"><a title="Click here to select A/R" onclick="onSearchCust('A/R')" href="#tips">A/R&nbsp;</a></td>
							<td align="left"><gw:textbox id="txtConsignorCD" styles="width:100%" csstype="mandatory" /></td>
							<td align="left" colspan="2"><gw:textbox id="txtConsignorNM" styles="width:100%" csstype="mandatory" /></td>
							<td align="right"><gw:imgBtn id="btnResetConsignor" img="reset" alt="Reset" onclick="OnReset('A/R')" /></td>
							<td align="right"><a title="Click here to select Custom office" onclick="onSearchCust('Custom office')" href="#tips">Custom office&nbsp;</a></td>
							<td align="left"><gw:textbox id="txtCustomOffCD" styles="width:100%" csstype="mandatory" /></td>
							<td align="left" colspan="2"><gw:textbox id="txtCustomOffNM" styles="width:100%" csstype="mandatory" /></td>
							<td align="right"><gw:imgBtn id="btnResetCustomOff" img="reset" alt="Reset" onclick="OnReset('Custom office')" /></td>
							<td align="right">VAT Currency&nbsp;</td>
							<td align="left"><gw:list id="lstVATCurr" styles="width:100%" /></td>
							<td align="right" colspan="1"><gw:textbox id="txtVATCurrRate" type="number" format="###,###,###.##" /></td>
							<td align="right" colspan="1"><gw:label id="lblPrint" text="" styles="width:100%;color:Red;" /></td>
						</tr>
						<tr style="height:4%;">
							<td align="right"><a title="Click here to select Importer" onclick="onSearchCust('Importer')" href="#tips">Importer&nbsp;</a></td>
							<td align="left"><gw:textbox id="txtImporterCD" styles="width:100%" csstype="mandatory" /></td>
							<td align="left" colspan="2"><gw:textbox id="txtImporterNM" styles="width:100%" csstype="mandatory" /></td>
							<td align="right"><gw:imgBtn id="btnResetImporter" img="reset" alt="Reset" onclick="OnReset('Importer')" /></td>
							<td align="right"><a title="Click here to select A/R Collection " onclick="onSearchCust('A/R Collection')" href="#tips">A/R Collection&nbsp;</a></td>
							<td align="left"><gw:textbox id="txtARCollCD" styles="width:100%" csstype="mandatory" /></td>
							<td align="left" colspan="2"><gw:textbox id="txtARCollNM" styles="width:100%" csstype="mandatory" /></td>
							<td align="right"><gw:imgBtn id="btnResetARColl" img="reset" alt="Reset" onclick="OnReset('A/R Collection')" /></td>									
							<td align="right">Book Ccy&nbsp;</td>
							<td align="left"><gw:list id="lstBook_Ccy" styles="width:100%" /></td>
							<td align="right" colspan="2"><gw:textbox id="txtBookRate" type="number" format="###,###,###.##" /></td>
						</tr>							
						<tr style="height:4%;">
							<td align="right"><a title="Click here to select Account Code A/R" onclick="onSearchCust('Account Code A/R')" href="#tips">Account Code A/R&nbsp;</a></td>
							<td align="left"><gw:textbox id="txtARAccCD" styles="width:100%" csstype="mandatory" /></td>
							<td align="right" colspan="2"><gw:textbox id="txtARAccNM" styles="width:100%" csstype="mandatory" /></td>
							<td align="left" colspan="1" ><gw:imgBtn id="btnResetARAccCD" img="reset" alt="Reset" onclick="OnReset('Account Code A/R')" /></td>
							<td align="right">Serial No&nbsp;</td>
							<td align="left" ><gw:textbox id="txtSerialNo"  styles="width:100%" onkeypress="Upcase()" csstype="mandatory" /></td>
							<td align="right">Invoice Date&nbsp;</td>
							<td align="left" colspan="2"><gw:datebox id="dtInvoiceDT" lang="1" styles="width:100%" /></td>
							<td align="right">Trans Ccy&nbsp;</td>
							<td align="left"><gw:list id="lstTransCcy" styles="width:100%" csstype="mandatory" onchange="OnChangeTransDT()" /></td>
							<td align="right" colspan="2"><gw:textbox id="txtTransCcy" type="number" format="###,###.##" /></td>
						</tr>
						<tr style="height:4%;">
							<td align="right">Recv Person&nbsp;</td>
							<td align="left" colspan="4"><gw:textbox id="txtRecvPerson" styles="width:100%" /></td>
							<td align="right">Invoice No&nbsp;</td>
							<td align="left" colspan="1"><gw:textbox id="txtInvNo" styles="width:100%" onkeypress="Upcase()" csstype="mandatory" /></td>
							<td align="right">Declaration No&nbsp;</td>
							<td align="left" colspan="2"><gw:textbox id="txtDeclNo" onkeypress="Upcase()" styles="width:100%" /></td>
							<td align="right">Due Date&nbsp;</td>
							<td align="right"><gw:textbox id="txtDueDate" type="number" format="###,###.##" /></td>
							<td align="right" colspan="2"><gw:datebox id="dtDueDate" lang="1" onchange="OnMatDueDate()" /></td>
						</tr>
						<tr style="height:4%;">
							<td align="right">Desc A/R&nbsp;</td>
							<td align="left" colspan="4"><gw:textbox id="txtDesc" styles="width:100%" csstype="mandatory" /></td>
							<td align="right">Local Desc A/R&nbsp;</td>
							<td align="left" colspan="4"><gw:textbox id="txtLocalDesc" styles="width:100%" csstype="mandatory" /></td>
							<td align="right">Report Type&nbsp;</td>
							<td align="left" colspan="3"><gw:list id="lstRptType" >
							    <data>DATA|0|Hóa đơn bán hàng|1|Hóa đơn BTC|2|Hóa đơn điện tử</data>
							</gw:list>
							</td>							
						</tr>
						<tr style="height:4%;">
							<td align="right"><a title="Click here to select Trans Type A/R" onclick="onSearchCust('Trans Type AR')" href="#tips">Trans Type A/R&nbsp;</a></td>
							<td align="left" ><gw:textbox id="txtTransTCD" styles="width:100%" csstype="mandatory" /></td>
							<td align="left" colspan="3" ><gw:textbox id="txtTransTNM" styles="width:100%" csstype="mandatory" /></td>
							<td align="right"><a title="Click here to select Contract No" onclick="OnShowContract()" href="#tips">Contract No&nbsp;</td>
							<td align="left" colspan="4" ><gw:textbox id="txtContractNo" styles="width:100%;" /></td>														
							<td align="left" >Enclose&nbsp;</td>
							<td align="left" colspan="3"><gw:textbox id="txtEnclose" styles="width:100%;" /></td>							
						</tr>
						<tr style="height:64%;">
						<td colspan="14" >
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
														<textbox type="number" format="######"/>
													</column>

													<column title="Item PK" hidden='T'>
														<textbox type="number" format="######" />
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
	                                        <td width ="5%" align="right">&nbsp;</td>
	                                        <td width ="5%" align="left" ></td>
                                            <td width ="10%" align="right">Total&nbsp;&nbsp;</td>
                                            <td width ="15%" align="left" ><gw:textbox id="lblTotal_FAMT" text="" type="number" format="###,###.##R" styles="color:red;width:90%;font-weight: bold;font-size:14"/></td>
	                                        <td width ="15%" align="left" ><gw:textbox id="lblTotal_AMT" text="" type="number" format="###,###.##R" styles="color:red;width:90%;font-weight: bold;font-size:14"/></td>	                                        	                                        
	                                        <td width ="8%" align="center">Get Data&nbsp;</td>
                                            <td width ="24%" align="center">
                                                <table border ="0" cellpadding="0" cellspacing="0" style="width:100%;height:100%">
                                                <tr>
                                                    <td>
														<gw:list id="lstGetData" styles="width:100%"  />
                                                    </td>
                                                </tr>
                                                </table>
                                            </td>
                                            <td style="width:3%;" align="right">Cost</td>
                                            <td style="width:5%;" align="left">
                                                <gw:checkbox id="chkCost" text="Cost" onclick="OnCheckCost()" />
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
                                        header  ="_tac_crcad_pk|_tac_crca_pk|Order No|_tco_item_pk|Item Code|Item Name|HS Code|Unit|U/Price|Q'ty|Extended Price|Net Trans. Amt|Net Books. Amt|Ac. Code|Account Name|_tac_abacctcode_pk|WH|Description|Local Desc|_tin_wh_pk|_tex_decl_dtl_pk|_tac_mattakein_ap_pk"
                                        format  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                        aligns  ="0|0|1|0|0|0|1|1|3|3|3|3|3|0|0|0|0|0|0|0|0|0"
                                        defaults="|||||||||||||||||||||"
                                        editcol ="0|0|0|0|0|0|0|0|1|1|1|1|1|0|0|0|0|0|0|0|0|0"
                                        widths  ="0|0|1500|0|1500|2500|1300|800|1000|1000|1500|1500|1500|1500|2500|0|1500|2000|2000|0|0|0"
                                        styles  ="width:100%; height:100%"
                                        sorting ="F"  
										acceptNullDate="T"
										onafteredit="OnEditDtl()"
										oncelldblclick="OnDblClickDtlItem()"
                                        />
                                </td>
                            </tr>
	                        </table>
							<table name="Tax Calculation..." style="width:100%;height:100%" cellpadding ="0" cellspacing ="0" border="0" >
								<tr style="height:10%;">
									<td width="20%" align="right">Total&nbsp;</td>
									<td width="25%"><gw:textbox id="txtTotTrAmt" type="number" format="###,###.##R" styles="color:red;width:90%;font-weight: bold;font-size:14" /></td>
									<td width="30%"><gw:textbox id="txtTotBkAmt" type="number" format="###,###.##R" styles="color:red;width:90%;font-weight: bold;font-size:14" /></td>
									<td width ="25%" align ="right" ><gw:imgBtn id="btnSave_VAT"   img="save"      alt="Save" onclick="OnSave_VAT()"     /> </td>
								</tr>
								<tr style="height:90%;">
									<td colspan="4">
										<gw:grid
                                        id      ="grdDtlVAT"  
                                        header  ="_PK|Item code|Item name|Calculated Amt Tax|Calculated Amt|_Calculated Tax Net VAT|Tax Rate|VAT Trans. Amt|VAT Books. Amt|TAX VAT. Amt|VAT Account Code|VAT Account Name|Description|Local Description|_tac_abacctcode_pk_vat"
                                        format  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                        aligns  ="0|0|0|3|3|3|1|3|3|3|1|0|0|0|0"
                                        defaults="||||||||||||||"
                                        editcol ="0|0|0|0|0|0|1|1|1|1|1|0|1|1|0"
                                        widths  ="0|1000|2000|2000|2000|2100|1000|1500|1500|1500|1550|2000|2000|2000|0"
                                        styles  ="width:100%; height:100%"
                                        sorting ="F"
										onafteredit="OnEditDtlVAT()"
										oncelldblclick="OnDblDtlVAT()"
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
                                        sorting ="T"
										autosize="T"
										oncelldblclick="OnDblDtlPL()"			
                                        />									
									</td>
								</tr>
							</table>
							<table name="Costing" style="width:100%;height:100%" cellpadding ="0" cellspacing ="0" border="0" >
								<tr style="height:10%;">
									<td align="right" width="30%"></td>
									<td align="right" width="25%"></td>									
									<td align="right" width="5%"></td>
									<td align="right" width="25%"></td>
									<td width ="15%" align ="right" ><gw:imgBtn id="btnSave_Allocate" img="save" alt="Save" onclick="OnSave_Cost()" /></td>
								</tr>
								<tr style="height:90%;">
									<td colspan="5">
										<gw:grid
                                        id      ="grdDtlCost"  
                                        header  ="_PK|Item Code|Item Name|Costing Acc. Code|Costing Acc. Name|Trans. Amt|Books. Amt|_tac_abacctcode_pk_cost"
                                        format  ="0|0|0|0|0|0|0|0"
                                        aligns  ="0|0|0|0|0|3|3|0"
                                        defaults="|||||||"
                                        editcol ="0|0|0|0|0|0|0|0"
                                        widths  ="0|1500|2500|2000|2000|2000|2000|0"
                                        styles  ="width:100%; height:100%"
                                        sorting ="T"
										oncelldblclick="OnDblDtlCost()"		
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
		</td>
	</tr>	
</table>
<!------------------------------------------------------------------------>
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif"
        style="cursor: hand; position: absolute; left: 1; top: 0;" onclick="OnToggle()" />      
<!------------------------------------------------------------------------>	
<gw:textbox id="txtTR_RATE" styles="display:none;" />
<gw:textbox id="txtBK_RATE" styles="display:none;" />
<gw:textbox id="txtCustPK_Sr" styles="display:none;" />
<gw:textbox id="txtemp_pk" styles="display:none;" />
<gw:textbox id="txtCustomOffPK" styles="display:none;" />
<gw:textbox id="txtConsignorPK" styles="display:none;" />
<gw:textbox id="txtImporterPK" styles="display:none;" />
<gw:textbox id="txtARCollPK" styles="display:none;" />
<gw:textbox id="txtARAccPK" styles="display:none;" />
<gw:textbox id="txtaccd_dr" styles="display:none;" />
<gw:textbox id="txtacnm_dr" styles="display:none;" />
<gw:textbox id="txtacpk_dr" styles="display:none;" />
<gw:textbox id="txtaccd_cr" styles="display:none;" />
<gw:textbox id="txtacnm_cr" styles="display:none;" />
<gw:textbox id="txtacpk_cr" styles="display:none;" />
<gw:textbox id="txtaccd_vat" styles="display:none;" />
<gw:textbox id="txtacnm_vat" styles="display:none;" />
<gw:textbox id="txtacpk_vat" styles="display:none;" />
<gw:textbox id="txtvat_calc" styles="display:none;" />
<gw:textbox id="txtEmpNM" styles="display:none;" />
<gw:textbox id="txtTransTPK" styles="display:none;" />
<gw:textbox id="txtTransTCostPK" styles="display:none;" />
<gw:textbox id="txtTrTP_AR" styles="display:none;" />
<gw:textbox id="txtTrTP_AR_CD" styles="display:none;" />
<gw:textbox id="txtTrTP_AR_NM" styles="display:none;" />
<gw:textbox id="txtTrTPCost" styles="display:none;" />
<gw:textbox id="txtTrTPCost_NM" styles="display:none;" />
<gw:textbox id="txtTrTPCost_PK" styles="display:none;" />
<gw:textbox id="txtCRCA_PK" styles="display:none;" />
<!------------------------------------------->
<gw:textbox id="txtcrca_pk_lst" styles="display:none;" />
<gw:textbox id="txtUser_PK" styles="display:none;" />
<gw:textbox id="txtIndex" text="1" styles="display:none;" />
<gw:textbox id="txtReturn" text="" styles="display:none;" />
<gw:textbox id="txtContractPK" text="" styles="display:none;" />
<gw:textbox id="txtCancelCause" text="" styles="display:none;" />
<gw:textbox id="txtProposedByUserPk"  styles='display:none' />
</body>
</html>
