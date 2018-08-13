<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>
    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">
var  g_lang   = "";
var  g_emp_pk = "";
var  g_user_name = "";
var  g_user_id = "";
var  g_user_pk = "";
var  g_company_pk = "";
// grid grdSearch
var g_0_VoucherNo	 = 0,
	g_0_Seq			 = 1,
	g_0_TransDate	 = 2,
	g_0_InvoiceNo	 = 3,
    g_0_NetBooksAmt	 	= 4,
	g_0_PK				= 5;
	
var	g_insert    		= false ;
//_tac_crcad_pk|_tac_crca_pk|Order No|_tco_item_pk|Item Code|Item Name|HS Code|Unit|U/Price|Q'ty|Net U/Price|Extended Price|Trans. Amt|Books. Amt|Net Trans Amt|Net Books Amt|Ac. Code|Account Name|_tac_abacctcode_pk|WH|Description|Local Desc|_tin_wh_pk|_tex_cinv_dtl_pk|_tac_mattakein_ap_pk|Order UPrice|Order Amount|
//VAT Trans|VAT Books|VAT Rate|VAT Tax
var g_tac_crcad_pk		= 0,
	g_tac_crca_other_pk		= 1,
	g_OrderNo			= 2,
	g_tco_item_pk		= 3,
    g_Item_code	 		= 4,
    g_Item_Name			= 5,
	g_HSCode		    = 6,
    g_Unit				= 7,
	g_UPrice			= 8,
	g_Qty				= 9,
	g_order_amt         =10
	g_Net_UPrice		= 11,
	g_Ext_Price			= 12,
	//g_Trans_Amt			= 11,
	//g_Books_Amt			= 13,
    g_Net_Trans_Amt		= 13,
	g_Net_Books_Amt		= 14,
	g_Ac_code_Revenue	= 15,
	g_AccountName		= 16,
	g_tac_abacctcode_pk	= 17,

	g_Desc				= 18,
	g_Local_Desc		= 19,

	g_tex_decl_dtl_pk	= 20,
	g_tac_fgtakeout_ar_pk = 21,
	g_Order_Uprice          = 22;
	//g_Order_amount          = 26,	
	g_VAT_TR_AMT			= 23,
	g_VAT_BK_AMT			= 24,
	g_VAT_Rate				= 25,
	g_VAT_TAX_AMT			= 26;	

	// PL Grid
var g_tac_crcad_pk_pl	= 0,
	g_tac_abplcenter_pk = 1,
    g_item_code_2	    = 2,
    g_item_name_2	    = 3,
	g_pl_cd				= 4,
	g_pl_nm				= 5;
	
var g_update = 0 ; // 1: insert , 2 : delete
	
function BodyInit()
{	
    System.Translate(document);
    BindingDataList();    	
	txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	//dso_getCompany.Call();
		dso_init_form.Call();		
}

function BindingDataList()
{	
	var ls_data         = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 order by 1")%>";
    lstCompany.SetDataText(ls_data);
	
	ls_data      = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACBG0130') FROM DUAL")%>";
	lstVoucherTypeAR.SetDataText(ls_data);
	lstVoucherTypeAR.value = "AR";
    
	ls_data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACBG0010') FROM DUAL ")%>" + "|ALL|Select All";	
	lstSliStatus.SetDataText(ls_data);
	lstStatus.SetDataText(ls_data);
	lstSliStatus.value = 'ALL';
	
	ls_data      = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
	lstTransCcy.SetDataText(ls_data);
	lstOrderCcy.SetDataText(ls_data);
	
	ls_data = "<%=CtlLib.SetListDataSQL("select TRIM(CODE) code, A.CODE code_nm FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'ACBG0040' and A.def_yn = 'Y'")%>";
	lstBook_Ccy.SetDataText(ls_data);
	
	ls_data      = "<%=CtlLib.SetListDataSQL("select trim(code) code, a.code_nm code_nm from tac_commcode_detail a, tac_commcode_master b where a.del_if=0 and b.del_if = 0 and a.tac_commcode_master_pk = b.pk and trim(b.id) = 'EACAB014' AND a.code in ('ED', 'IE', 'TO') ")%>";        
	lstGetData.SetDataText(ls_data);
	
	var ls_VAT_list = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACCR0110','','') FROM DUAL")%>" ;
	lstVAT.SetDataText(ls_VAT_list);
	lstVAT.value = "01"; // Default: none
	
	<%= CtlLib.SetGridColumnComboFormat("grdDtl",25,"SELECT CODE, CODE_NM  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACCR0110' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 order by a.DEF_YN desc , ord")%>
	
	var ls_inv_notype = "<%=CtlLib.SetDataSQL("select d.code_nm from tac_commcode_master a, tac_commcode_detail d where a.pk = d.tac_commcode_master_pk and a.del_if = 0 and d.del_if = 0 and a.id like 'ACBG0181' and d.def_yn = 'Y'")%>";
    if(	ls_inv_notype == 'Auto')
    {
        txtInvNo.SetReadOnly(true);
    }
	
	
	//collapsed left tab
	var left  = document.all("idLEFT");
	left.style.display="none";
	imgArrow.status = "collapse";
	imgArrow.src = "../../../system/images/next_orange.gif";
	
} 


//--------------------------------------------poup----------------------------------------------------------------------------
function onSearchCust(iCase, index)
{
	switch(iCase)
	{
		case 'Customer':
			var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx?com_pk='+ lstCompany.value+'&AR=Y'+'&company=Y'; 
			var object  = System.OpenModal( path, 800, 600,'resizable:yes;status:yes');
			if( index == '0')
			{
				if ( object != null )
				{
					txtCustPK_Sr.text = object[0];
					txtCustNo_Sr.text = object[1];
					txtCustNM_Sr.text = object[2];
				}	
			}
			if( index == '1')
			{
				if ( object != null )
				{
					txtCustPK_Sr_1.text = object[0];
					txtCustNo_Sr_1.text = object[1];
					txtCustNM_Sr_1.text = object[2];
				}	
			}    	
			break;
			
		case 'person':
			/*var path = System.RootURL + "/standard/forms/ch/ae/chae00010_search_emp.aspx";
			var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');		
			if(object!=null)
			{
				txtemp_pk.text = object[0];                
				txtEmployeeCD.text = object[1];
				txtEmployeeNM.text = object[3];
			}    */
			var path = System.RootURL + '/standard/forms/60/05/60050010_popup_2.aspx';
				var obj = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
				if ( obj != null )
				{
					
					txtemp_pk.text = obj[0];                
					txtEmployeeCD.text = obj[1];
					txtEmployeeNM.text = obj[2];
					
				}
			break ;
		
		case 'Account Code A/R':
			var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "131" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=SP_SEL_ACCT_POPUP";
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
		
		
		
		
	
	}
}
//----------------------------------------------------------------onsearch------------------
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
			txtCRCA_OTHER_PK.text = grdSearch.GetGridData(lrow, g_0_PK);
			grdMst.Call("SELECT");				
		break ;
	}
}
//-----------------------------------------------------------------------------------
function OnReset(iCase)
{
	switch(iCase)
	{
		
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
		case 'Customer1':
			txtCustPK_Sr_1.text = '';
			txtCustNo_Sr_1.text = '';
			txtCustNM_Sr_1.text = '';
		break ;
		case 'person':
			txtemp_pk.text = '';                
			txtEmployeeCD.text =''
			txtEmployeeNM.text = '';
			break;
		case 'Trans Type A/R':
			           
			txtTransTCD.text =''
			txtTransTNM.text = '';
			break;
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
					//txtPersonNM.text = txtEmpNM.text ;
				txtTransTCD.text = txtTrTP_AR_CD.text;
				txtTransTNM.text = txtTrTP_AR_NM.text ;
				txtTransTPK.text = txtTrTP_AR.text ;
				txtemp_pk.text = g_user_pk ;
					//txtPersonCD.text = g_user_id ;
									
				g_update = 1; // inserted flag
				//idTab_Child.SetPage(1);
				//ButtonStatus();
				//dso_form_no_serial.Call();
				alert("Already add new data!");
			}
			//else			
			//{
				
			//}
		break ;
	}
}

//-----------------------------------------------------------
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


//---------------------------------------------------------------------
function OnDataReceive(iCase)
{	
	switch(iCase.id)
	{
		/*case "dso_getCompany":
			dso_init_form.Call();	
		break ;*/
		case "dso_init_form":
		
			txtARAccCD.text = txtaccd_dr.text ;
			txtARAccNM.text = txtacnm_dr.text ;
			
			txtARAccPK.text = txtacpk_dr.text ;
			//txtPersonNM.text = txtEmpNM.text ;
			txtTransTCD.text = txtTrTP_AR_CD.text;
			txtTransTNM.text = txtTrTP_AR_NM.text ;
			txtTransTPK.text = txtTrTP_AR.text ;
			if(txtReturn.GetData() != "")
			{
			    lstCompany.SetDataText('DATA|' + txtReturn.GetData());
			}
			dso_get_rate.Call();
		break ;
		
		case 'grdMst':
			//ButtonStatus();
			
			if(g_update == 1 )
			{
				g_update = 0;
				dso_ar_list.Call('SELECT');
			}
			else
			{
				
				idTab_Child.SetPage(0);
				OnSearchTab();
			}			
		break ;
		
		case 'dso_ar_list':
			OnFormatGrid('grdSearch');		
			
		break ;
		case "dso_ar_cancel":			
			lstSliStatus.value = '3';
			grdMst.Call("SELECT");
		break ;
		case 'dso_ar_replicate':
			grdMst.Call("SELECT");
		break ;
		case 'dso_upd_crca_other_item':
			OnFormatGrid('grdDtl');
			break;
	
	}
}


//---------------------------------------------------
function ValidateData(iCase)
{
	switch(iCase)
	{
		case 'Master':
			/*if(chkAuto.value == "F")// khong tu dong 
			{
				if(Trim(txtvoucher_no.text)=="") 
				{
					alert("Voucher No is not null" + "\n" + "Mã số chứng từ thì không được rỗng!!!");
					txtvoucher_no.GetControl().focus();
					return false ;		
				}
			}*/
			/*if(Trim(txtCustomOffPK.text)=="")
			{
				alert("Custom Office is not null" + "\n" + "Văn phòng hải quan thì không được rỗng!!!");
				return false ;						
			}*/
			
			
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
			/*if(Trim(txtTrTP_AR.text)=="")
			{
				alert("Transaction Type is not null" + "\n" + "Loại giao dịch không được rỗng!!!");
				return false ;						
			}*/
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



//============================================================================================================



function OnAdd_Item()
{	
	switch(lstGetData.value)
	{
		case "ED":
			var l_newrow;
			
			
			grdDtl.AddRow();
			l_newrow = grdDtl.rows - 1;		
			grdDtl.SetGridText(l_newrow, g_tac_crca_other_pk, txtCRCA_OTHER_PK.text);
			grdDtl.SetGridText(l_newrow, g_tac_abacctcode_pk, txtacpk_cr.text);     // account pk
			grdDtl.SetGridText(l_newrow, g_Ac_code_Revenue, txtaccd_cr.text);     // account code
			grdDtl.SetGridText(l_newrow, g_AccountName, txtacnm_cr.text);     // account name
			grdDtl.SetGridText(l_newrow, g_Desc, txtDesc.text );     // English description
			grdDtl.SetGridText(l_newrow, g_Local_Desc,   txtLocalDesc.text  );     // local description		
			grdDtl.SetGridText(l_newrow, g_VAT_Rate, lstVAT.value );	 // vat rate		
		break ;
		case "TO":
		    var fpath   = System.RootURL + "/standard/forms/60/11/60110010_GetSO.aspx";
			//var fpath   = System.RootURL + "/standard/forms/gf/ca/gfca00010_GetSO.aspx";
            var object  = System.OpenModal(fpath , 1000 , 700 , 'resizable:yes;status:yes'); 
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
					//grdDtl.SetGridText(j, g_WH, arr[20]);	// warehouse id
					//grdDtl.SetGridText(j, g_WH_PK, arr[19]); // warehouse pk
					grdDtl.SetGridText(j, g_Ac_code_Revenue, txtaccd_cr.text );	// account code revenue
					grdDtl.SetGridText(j, g_AccountName, txtacnm_cr.text ); //acc name vevenue 
					grdDtl.SetGridText(j, g_tac_abacctcode_pk, txtacpk_cr.text ); // acc PK vevenue 
					grdDtl.SetGridText(j, g_Desc, txtDesc.text ); //description
					grdDtl.SetGridText(j, g_Local_Desc, txtLocalDesc.text ); // local desc													
					grdDtl.SetGridText(j, g_tac_crca_other_pk, txtCRCA_OTHER_PK.text); // Master PK
					grdDtl.SetGridText(j, g_tac_fgtakeout_ar_pk, arr[24] );
					grdDtl.SetGridText(j, g_VAT_Rate, lstVAT.value ); // vat rate
					grdDtl.SetGridText(j, g_UPrice, arr[7] ); //Unit Price
					
				}					
			}			
		break ;
		case "IE":
			var fpath   = System.RootURL + "/standard/forms/gf/ca/gfca00020_export_popup_1.aspx?compk=" + lstCompany.value;
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
					grdDtl.SetGridText(j, g_tac_crca_other_pk, txtCRCA_other_PK.text);
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
					grdDtl.SetGridText(j, g_VAT_Rate, lstVAT.value );	 // vat rate				
				}
			}
		break ;
	}
}


//======================================================================
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
	/*else if(l_col == g_WH)
	{
		Popup_WH();
	}*/
}

//------------------------------------------
function Popup_AccDtl()
{
    var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "155" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=SP_SEL_ACCT_POPUP";
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
function Popup_Item()
{
    var i = 0, l_row;
    if (grdDtl.GetGridData(grdDtl.row, g_tco_item_pk) != "")
    {
        fpath = System.RootURL + "/standard/forms/gf/ca/gfca00020_1.aspx?type=PROD&IsSelectItem=1&company_pk=" + lstCompany.value;
    }
    else
    {
       var fpath   = System.RootURL + "/standard/forms/gf/ca/gfca00020_1.aspx?type=PROD&company_pk=" + lstCompany.value;
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
                    grdDtl.SetGridText(l_row + i, g_tac_crca_other_pk, txtCRCA_OTHER_PK.text);     // PK Master
                    grdDtl.SetGridText(l_row + i, g_WH_PK, tmp[14] );     // Warehouse PK
                    grdDtl.SetGridText(l_row + i, g_WH, tmp[21] );     // Warehoue Name
                    
                }                
            }
        }
    }
}
//------------------------------------------
function OnSave_Item()
{

	
	dso_upd_crca_other_item.Call();
}
//=====================================
//------------------------------------------
function OnFormatGrid(iCase)
{	
	switch(iCase)
	{
		case 'grdSearch':
			var fg = grdSearch.GetGridControl();			
			if(lstBook_Ccy.value == "VND")
			{
				fg.ColFormat(g_0_NetBooksAmt) = "###,###R";
			}
			else
			{
				fg.ColFormat(g_0_NetBooksAmt) = "###,###.##R";
				
			}

		break ;
		case 'grdDtl':
			var fg = grdDtl.GetGridControl();
			if(lstTransCcy.value != "VND")
			{
				fg.ColFormat(g_UPrice) 			= "###,###,###,###,###.#####R";
				fg.ColFormat(g_Ext_Price) 		= "###,###,###,###,###.#####R";
				fg.ColFormat(g_Net_Trans_Amt) 	= "###,###,###,###,###.#####R";
				fg.ColFormat(g_Order_Uprice) 	= "###,###,###,###,###.##R";
				fg.ColFormat(g_order_amt) 	= "###,###,###,###,###.##R";
				
			}
			else
			{
			
			
			
				fg.ColFormat(g_UPrice) 			= "###,###,###,###,###R";
				fg.ColFormat(g_Ext_Price) 		= "###,###,###,###,###R";
				fg.ColFormat(g_Net_Trans_Amt) 	= "###,###,###,###,###R";
				fg.ColFormat(g_Order_Uprice) 	= "###,###,###,###,###R";
				fg.ColFormat(g_order_amt) 	= "###,###,###,###,###R";				
			
			}
			fg.ColFormat(g_Qty) 		= "###,###,###,###,###.###R";
			if(lstBook_Ccy.value != "VND")
			{
				fg.ColFormat(g_Net_Books_Amt) = "###,###,###,###,###.##R";
			}
			else
			{
				fg.ColFormat(g_Net_Books_Amt) = "###,###,###,###,###,###R";
			}			
		break ;
		
	}
}

//==============================================================================================================
function OnSearchTab()
{
	var lcurrtab = idTab_Child.GetCurrentPageNo();
	
		if(lcurrtab == 0)
		{
		
			dso_upd_crca_other_item.Call("SELECT");
		}
		else if(lcurrtab == 1)
		{
			dso_upd_crca_pl.Call("SELECT");
		
		}
		
	
}
//---------------------------------------------------------------------------
function OnSave_PL()
{
	dso_upd_crca_pl.Call();
}
//---------------------------------------------------------------------------
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
	dso_upd_crca_other_item.Call();
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

function OnDelete(iCase)
{
	switch(iCase)
	{
		case '1':
			if(confirm("Are you sure you want to delete ?"))
			{
				grdMst.StatusDelete();	
				grdMst.Call();
			}	
		break ;
	}
}
//-----------------------------------------------------------------------------------

function OnConfirm()
{
	if(confirm("Are you sure you want to confirm this slip?"))
	{
	
		
		txtcrca_other_pk_lst.text = txtCRCA_OTHER_PK.text + "," ;	
		dso_ar_confirm.Call();		
	}	
}

//---------------------------------------------------------------------------
function OnReplicate()
{
	if(confirm('Are you sure you want to replicate this slip?'))
	{
		txtcrca_other_pk_lst.SetDataText(txtCRCA_OTHER_PK.text + ",");
		dso_ar_replicate.Call();
	}	
}
//---------------------------------------------------------------------------
function OnCancel()
{
	txtcrca_other_pk_lst.text = txtCRCA_OTHER_PK.text + ",";
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
//-----------------------------------------------------------
function OnGetRate_Company()
{
    dso_get_rate.Call();
}

//---------------------------------------------------------------------------
function SetExRate()
{
	txtTransCcy.text = txtTR_RATE.text;
	txtBookRate.text = txtBK_RATE.text;
	//dso_getBizPlace.Call();	
} 


//------------------------------------------
function OnEditDtl()
{
	var l_row = event.row ;
	var l_col = event.col ;
	var l_price = 0 , l_qty = 0, l_ext_price = 0, l_bk_amt = 0, l_tr_rate = 0, l_bk_rate = 0;
	var l_vat_tr_amt = 0, l_vat_bk_amt = 0, l_vat_tax = 0 ;
	l_vat_rate = lstVAT.value ; // VAT Rate
	if(lstVAT.value == '01' || lstVAT.value == 'NO' || lstVAT.value == '10.' || lstVAT.value == '05.' || lstVAT.value == 'NO01' || lstVAT.value == '00.')
	{	        
		l_vat_rate = 0;
	}
	else
	{
		l_vat_rate = Number(l_vat_rate);
	}
	if(l_col == g_UPrice || l_col == g_Qty)	
	{
		l_price = grdDtl.GetGridData(l_row, g_UPrice);
		l_qty = grdDtl.GetGridData(l_row, g_Qty);
		l_ext_price = Number(l_price * l_qty);
		//l_ext_price = FormatCalculate(lstTransCcy.value, l_ext_price);
		l_tr_rate = Number(txtTransCcy.text) ;
		l_bk_rate = Number(txtBookRate.text) ;
		l_bk_amt = Number(l_ext_price * l_tr_rate / l_bk_rate);
		l_bk_amt = FormatCalculate(lstBook_Ccy.value, l_bk_amt);
		grdDtl.SetGridText(l_row, g_Ext_Price, l_ext_price );		
		grdDtl.SetGridText(l_row, g_Net_Trans_Amt, l_ext_price );
		grdDtl.SetGridText(l_row, g_Net_Books_Amt, l_bk_amt );
		l_vat_tr_amt = l_ext_price * (l_vat_rate / 100);
		l_vat_tr_amt = FormatCalculate(lstTransCcy.value, l_vat_tr_amt); 
		l_vat_bk_amt = l_bk_amt * (l_vat_rate / 100);
		l_vat_bk_amt = FormatCalculate(lstBook_Ccy.value, l_vat_bk_amt);
		l_vat_tax = l_vat_tr_amt * l_tr_rate ;
		l_vat_tax = FormatCalculate("VND", l_vat_tax);
		grdDtl.SetGridText(l_row, g_VAT_TR_AMT, l_vat_tr_amt );		
		grdDtl.SetGridText(l_row, g_VAT_BK_AMT, l_vat_bk_amt );
		grdDtl.SetGridText(l_row, g_VAT_TAX_AMT, l_vat_tax );		
	}
	else if(l_col == g_Net_Trans_Amt)
	{			
		l_vat_tr_amt = l_ext_price * (l_vat_rate / 100);
		l_vat_tr_amt = FormatCalculate(lstTransCcy.value, l_vat_tr_amt); 
		l_vat_bk_amt = l_bk_amt * (l_vat_rate / 100);
		l_vat_bk_amt = FormatCalculate(lstBook_Ccy.value, l_vat_bk_amt);
		l_vat_tax = l_vat_tr_amt * l_tr_rate ;
		l_vat_tax = FormatCalculate("VND", l_vat_tax);
		grdDtl.SetGridText(l_row, g_VAT_TR_AMT, l_vat_tr_amt );		
		grdDtl.SetGridText(l_row, g_VAT_BK_AMT, l_vat_bk_amt );
		grdDtl.SetGridText(l_row, g_VAT_TAX_AMT, l_vat_tax );	
		l_tr_rate = Number(txtTransCcy.text) ;
		l_bk_rate = Number(txtBookRate.text) ;
		l_ext_price = Number(grdDtl.GetGridData(l_row, g_Net_Trans_Amt));
		l_bk_amt = Number(l_ext_price * l_tr_rate / l_bk_rate);
		l_bk_amt = FormatCalculate(lstBook_Ccy.value, l_bk_amt);
		grdDtl.SetGridText(l_row, g_Net_Books_Amt, l_bk_amt );
	}
}
//------------------------------------------

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
function OnShowACNTCode()
{
 //D:\WebProject\ESYS_NEW\form\ag\ga\agga00090_popup.aspx   
 	var fpath = System.RootURL + "/standard/forms/ag/ga/agga00090_popup.aspx?ID=ACBG0181";
	var o = System.OpenModal( fpath , 850 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
	if(o != null)
	{	        
	    if(o[1]=="1")
	    {
	        if(o[0]=="Auto")
	        {
	            txtInvNo.SetReadOnly(true);
	        }
	        else
	        {
	            txtInvNo.SetReadOnly(false);
	        }
	    }	    
	}
}
//-----------------------------------------------------------
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
</script>
<body style="margin:0; padding:0;">
<!---------------------------------------------------------------------------------------------------------->
	<gw:data id="dso_get_rate" onreceive="SetExRate()"> 
        <xml> 
            <dso type="process" procedure="SP_GET_RATE" > 
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

	<gw:data id="grdMst" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33" function="ac_sel_60110240_os" procedure="ac_upd_60110240_os" > 				
				<inout>
					<inout bind="txtCRCA_OTHER_PK" /> 
					<inout bind="lstCompany" />
					<inout bind="lstVoucherTypeAR" />	
					<inout bind="txtVoucherNo" />	
					<inout bind="txtseq" />
					
					<inout bind="dtTransDT" />
					<inout bind="lstStatus" />
					<inout bind="txtEmployeeCD" />
					<inout bind="txtEmployeeNM" />
					<inout bind ="txtemp_pk"/>
					
					<inout bind="txtCustNo_Sr_1" />					
					<inout bind="txtCustNM_Sr_1" />
					<inout bind="txtCustPK_Sr_1" />
					<inout bind="lstBook_Ccy" />					
					<inout bind="txtBookRate" />
					
					<inout bind="txtSerialNo" />					
					<inout bind="dtInvoiceDT" />
					<inout bind="txtInvNo" />
					<inout bind="txtDeclarationNo" />					
					<inout bind="lstTransCcy" /> 	
					
					<inout bind="txtTransCcy" />	
					
					<inout bind="txtARAccPK" />	
					<inout bind="txtARAccCD" />			
					<inout bind="txtARAccNM" />	
					<inout bind="txtTransTCD" />
					<inout bind="txtTransTNM" />
					<inout bind="txtTransTPK" />
					
					<inout bind="txtEnclose" />					
					<inout bind="txtDesc" />
					<inout bind="txtLocalDesc" />		
					<inout bind="lstOrderCcy" />
					<inout bind="txtOrderRate" />
					
					<inout bind="txtOrderAmount" />		
					<inout bind = "lstVAT" />
					
				</inout>
			</dso> 
		</xml> 
	</gw:data>

	
	<!--<gw:data id="dso_form_no_serial" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process" procedure="ac_pro_form_no_serial_os" >
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="lstBiz_Place"/>                   
                </input>  
                <output>
                     <output bind="txtSerialNo"/> 
					 <output bind="txtForm_No"/>	 
				</output> 
            </dso> 
        </xml> 
    </gw:data> -->
    
	<gw:data id="dso_init_form" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process" procedure="ac_sel_60110020_code_ar_os" > 
                <input> 
                     <input bind="lstCompany" />
                     <input bind="txtUser_PK" />
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
<!-- ------------------------------------------------------------------------------------------------------>


    <gw:data id="dso_upd_crca_other_item" onreceive="OnDataReceive(this)" >
        <xml>
            <dso type="grid" parameter="0,1,2,3,7,8,9,10,11,12,13,14,17,18,19,20,21,22,23,24,25,26" function="ac_sel_60110240_crcad_OTHER_do" procedure="ac_upd_60110240_crcad_OTHER_do" >
                <input bind="grdDtl">
                    <input bind="txtCRCA_OTHER_PK"/>
                </input>
                <output bind="grdDtl"/>
            </dso>
        </xml>
    </gw:data>
<!---------------------------------------------------------------------------------------------------------->
 <gw:data id="dso_ar_list" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60110240_crca_other" >
                <input bind="grdSearch">
                    <input bind="lstCompany"/>
                    <input bind="dtTrDatefr" />
                    <input bind="dtTrDateto" />
					<input bind="lstSliStatus" />
					<input bind="txtVoucherNo_Sr" />
					<input bind="txtCustPK_Sr" />					
                </input>
                <output bind="grdSearch"/>
            </dso>
        </xml>
    </gw:data>
<!---------------------------------------------------------------------------------------------------------->
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
	
<!------------------------------------------------------------------------------------------------------------>
    <gw:data id="dso_upd_crca_pl">
        <xml>
            <dso type="grid" parameter="0,1" function="ac_sel_60110240_crcad_other_pl" procedure="ac_upd_60110240_crcad_other_pl" >
                <input bind="grdDtlPL">
                    <input bind="txtCRCA_OTHER_PK"/>
                </input>
                <output bind="grdDtlPL"/>
            </dso>
        </xml>
    </gw:data>
<!---------------------------------------------------------------------------------------------------------->

    <gw:data id="dso_ar_confirm" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process" procedure="ac_pro_60110240_crcaother_conf" >
                <input> 
					<input bind="txtcrca_other_pk_lst"/>
                    <input bind="txtIndex"/>					 
                </input>  
                <output>
                     <output bind="txtReturn"/>
				</output> 
            </dso> 
        </xml> 
    </gw:data>
<!---------------------------------------------------------------------------------------------------------->
<gw:data id="dso_ar_cancel" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process" procedure="ac_pro_60110240_cancel" >
                <input> 
					<input bind="txtcrca_other_pk_lst" />
                    <input bind="txtIndex" />					 
                    <input bind="txtCancelCause" />					
                </input>  
                <output>
                     <output bind="txtReturn" />
				</output> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dso_ar_replicate" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process" procedure="ac_pro_60110240_replcate_1" >
                <input> 
					<input bind="txtCRCA_OTHER_PK" />
                    <input bind="txtIndex" />					 
                </input>  
                <output>
                     <output bind="txtCRCA_OTHER_PK" />
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
									<td align="right">Trans Date</td>
									<td align="left"><gw:datebox id="dtTrDatefr" lang="1" /></td>
									<td align="center">~</td>
									<td align="right" colspan="2"><gw:datebox id="dtTrDateto" lang="1" /></td>
								</tr>
								<tr style="height:4%;">
									<td align="right">Slip Status</td>
									<td align="left"><gw:list id="lstSliStatus" styles="width:100%" onchange="OnSearch('1')" /></td>
									<td align="center">Voucher No</td>
									<td align="right" colspan="2"><gw:textbox id="txtVoucherNo_Sr" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch('1')" /></td>
								</tr>	
							
								<tr style="height:4%;">
									<td align="right"><a title="Click here to select Customer" onclick="onSearchCust('Customer','0')" href="#tips">Customer</a></td>
									<td align="left"><gw:textbox id="txtCustNo_Sr" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch('1')" /></td>
									<td align="left" colspan="2"><gw:textbox id="txtCustNM_Sr" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch('1')" /></td>
									<td align="right" ><gw:imgBtn id="btnReset" img="reset" alt="Reset" onclick="OnReset('Customer')" /></td>
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
								header  ="Voucher No|Seq|Trans Date|Invoice No|Net Books. Amt|_PK
								format  ="0|0|4|0|0|0"
								aligns  ="0|1|1|0|3|0"
								defaults="|||||"
								editcol ="0|0|0|0|0|0"
								widths  ="1500|800|1200|1500|2000|0"
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
							<td align="right">Company</td>
							<td align="left"><gw:list id="lstCompany" styles="width:100%" onchange="OnGetRate_Company()" /></td>
							<td align="right">Voucher Type A/R</td>
							<td align="left" colspan="2" ><gw:list id="lstVoucherTypeAR" styles="width:100%" csstype="mandatory" /></td>
							<td align="right" >Voucher No</td>
							<td align="left" colspan=""><gw:textbox id="txtVoucherNo" styles="width:100%" /></td>
							
							<td align="right" >Seq</td>
							<td align="left" colspan="2"><gw:textbox id="txtseq" styles="width:100%" onenterkey="OnShowTAccount()" /></td>
							<td align="right"><gw:button   id="ibtnNew" img="new" alt="New" onclick="OnNew('Master')" /></td>
							<td align="right"><gw:button   id="ibtnSave" img="save" alt="Save" onclick="OnSave('1')" /></td>
							<td align="right" colspan="1"><gw:button   id="ibtnDelete" img="delete" alt="Delete" onclick="OnDelete('1')" /></td>
						</tr>
						<tr style="height:4%;">
							<td align="right">Trans Date</td>
							<td align="left"><gw:datebox id="dtTransDT" lang="1" onchange="OnChangeTransDT()" csstype="mandatory" /></td>
							<td align="right">Slip Status</td>
							<td align="left" colspan="2"><gw:list id="lstStatus" /></td>
							<td align="right"><a title="Click here to select Person" onclick="onSearchCust('person','0')" href="#tips">Person</a></td>
							<td align="left"><gw:textbox id="txtEmployeeCD" styles="width:100%" csstype="mandatory" /></td> 
							<td align="left" colspan="2" ><gw:textbox id="txtEmployeeNM" styles="width:100%" csstype="mandatory" /></td>	
							
							<td align="left" colspan="1" ><gw:imgBtn id="btnResetARAccCD" img="reset" alt="Reset" onclick="OnReset('person')" /></td>
							<td align="right"><gw:icon id="btnConfirm" img="in" text="Confirm" styles="width:100%" onclick="OnConfirm()" /></td>
							<td align="right"><gw:icon id="btnCancel" img="in" text="Cancel" styles="width:100%" onclick="OnCancel()" /></td>
							<td align="right" colspan="1"><gw:icon id="btnReplicate" img="in" text="Replicate" onclick="OnReplicate()" /></td>
							<td align="right" colspan="1"><gw:button id="ibtnPrint" img="excel" text="Print"alt="Print Out Report" onclick="OnPrint()" /></td>
						</tr>
						<tr style="height:4%;">
							<td align="right"><a title="Click here to select Customer" onclick="onSearchCust('Customer','1')" href="#tips">Customer</a></td>
							<td align="left"><gw:textbox id="txtCustNo_Sr_1" styles="width:100%" csstype="mandatory" /></td>
							<td align="left" colspan="2"><gw:textbox id="txtCustNM_Sr_1" styles="width:100%" csstype="mandatory" /></td>
							<td align="right"><gw:imgBtn id="btnResetConsignor" img="reset" alt="Reset" onclick="OnReset('Customer1')" /></td>
							<td align="right">Booking Ccy</td> 
							<td align="left" ><gw:list id="lstBook_Ccy" styles="width:100%" /></td>
							<td align="left" colspan="3"><gw:textbox id="txtBookRate" type="number" format="###,###,###.##R" /></td>
							<!--<td align="right">pp</td>
							<td align="left" colspan="2"><gw:textbox id="txtDeclNo" onkeypress="Upcase()" styles="width:100%" /></td> 
							<td align="right" colspan="1"><gw:label id="lblPrint" text="" styles="width:100%;color:Red;" /></td> -->
						</tr>
						<tr style="height:4%;"> 
							<td align="right">Serial No</td>
							<td align="left"><gw:textbox id="txtSerialNo" styles="width:100%" csstype="mandatory" /></td>
							<!--<td align="left" colspan="2"><gw:textbox id="txtImporterNM" styles="width:100%" csstype="mandatory" /></td>
							<td align="right"><gw:imgBtn id="btnResetImporter" img="reset" alt="Reset" onclick="OnReset('Importer')" /></td> -->
							<td align="right" >Invoice Date</td>
							<td align="left"> <gw:datebox id="dtInvoiceDT" lang="1" styles="width:100%" /></td>
							<td align="right"  colspan="2" ><a title="Click here to select setup option" href="#tips" onclick="OnShowACNTCode()" >Invoice No</a></td>
							<td align="right" colspan=""><gw:textbox id="txtInvNo"  styles="width:100%" onkeypress="Upcase()" csstype="mandatory" /></td>									
							<td align="right" colspan="" >Declaration No</td>
							<td align="left" colspan="2"><gw:textbox id="txtDeclarationNo"  styles="width:100%" /></td>
							
						</tr>							
						<tr style="height:4%;">
							<td align="right">Trans Ccy</td>
							<td align="left"><gw:list id="lstTransCcy" styles="width:100%;" /></td>
							
							
							<td align="right">Trans  Ex.Rate</td>
							<td align="left" colspan="2" ><gw:textbox id="txtTransCcy" styles="width:100%" /></td>
							<td align="right"><a title="Click here to select Account Code A/R" onclick="onSearchCust('Account Code A/R')" href="#tips">Account Code A/R</a></td>
							<td align="left"><gw:textbox id="txtARAccCD" styles="width:100%" csstype="mandatory"  /></td>
							<td align="right" colspan="2"><gw:textbox id="txtARAccNM" styles="width:100%" csstype="mandatory" onchange="OnChangeTransDT()" /></td>
							<td align="left" colspan="1" ><gw:imgBtn id="btnResetARAccCD" img="reset" alt="Reset" onclick="OnReset('Account Code A/R')" /></td>
						</tr>
						<tr style="height:4%;"> 
							<td align="right">Trans Type A/R</td>
							<td align="left" colspan="1"><gw:textbox id="txtTransTCD"   styles="width:100%; "   /> </td>
							<td align="left" colspan="2"><gw:textbox id="txtTransTNM" styles="width:100%" csstype="mandatory" /></td>
							<td align="right"><gw:imgBtn id="btnResetConsignor" img="reset" alt="Reset" onclick="OnReset('Trans Type A/R','0')" /></td>
							<td align="right">Enclose</td>
							<td align="left" colspan="4"><gw:textbox id="txtEnclose" onkeypress="CheckNumeric()"  styles="width:100%;text-align:right" /></td>
							
						</tr>
						<tr style="height:4%;">
							<td align="right">Decription A/R</td>
							<td align="left" colspan="4"><gw:textbox id="txtDesc" styles="width:100%" /></td>
							<td align="right">Local Decription A/R</td>
							<td align="left" colspan="4"><gw:textbox id="txtLocalDesc" styles="width:100%" /></td>
							
							</td>							
						</tr>
						
						
					<tr style="height:4%;"> 
							<td align="right">Order Ccy</td>
							<td align="left" colspan="1"><gw:list id="lstOrderCcy" styles="width:100%;" /></td>
							
							<td align="right">Order Ex.Rate</td>
							<td align="left" ><gw:textbox id="txtOrderRate" type="number" format="###,###.##R" styles="width:100%;" /></td>
							<td  colspan="2"><gw:list id="lstVAT" styles="width:100%;" /></td>
							<td align="right">Order Amount</td>
							<td align="left" colspan=""><gw:textbox id="txtOrderAmount" onkeypress="CheckNumeric()"  styles="width:100%;text-align:right" /></td>
							
						</tr>
						<tr style="height:68%;">
						<td colspan="14" >
							<gw:tab id="idTab_Child" styles="width:100%;height:100%" onpageactivate="OnSearchTab()" >
								
				            <table name="Item Info" style="width:100%;height:100%" cellpadding ="0" cellspacing ="0" border="0" >
                            <tr style="height:10%;" >
				                <td >
		                            <table style="width:100%;height:100%" cellpadding ="0" cellspacing ="0" border="0">
		                                <tr >
	                                        <!--<td width ="5%" align="right">Price with VAT</td>
	                                        <td width ="5%" align="left" ><gw:checkbox id="chkPriceVAT" onclick="OnPriceWithVAT()" /></td>
                                            <td width ="10%" align="right">Total</td>
                                            <td width ="15%" align="left" ><gw:textbox id="lblTotal_FAMT" text="" type="number" format="###,###.##R" styles="color:red;width:90%;font-weight: bold;font-size:14"/></td>
	                                        <td width ="15%" align="left" ><gw:textbox id="lblTotal_AMT" text="" type="number" format="###,###.##R" styles="color:red;width:90%;font-weight: bold;font-size:14"/></td>	-->                                        	                                        
	                                        <td width ="50%" align="right" colspan="4">Get Data</td>
                                            <td width ="20%"  align="center">
                                                <table border ="0" cellpadding="0" cellspacing="0" style="width:100%;height:100%">
                                                <tr>
                                                    <td>
														<gw:list id="lstGetData" styles="width:100%"  />
                                                    </td>
                                                </tr>
                                                </table>
                                            </td>
                                           <!-- <td style="width:3%;" align="right">Cost</td>
                                            <td style="width:5%;" align="left">
                                                <gw:checkbox id="chkCost" text="Cost" onclick="OnCheckCost()" />
                                            </td>-->
                                            <td width ="10%"  align ="right">
                                                <table border ="0" cellpadding="0" cellspacing="0" style="width:100%;height:100%">
                                                <tr>
	                                                <td width ="1%" align ="right" ><gw:button   id="btnNew_D"    img="new"       alt="New" onclick="OnAdd_Item()"      /> </td>
	                                                <td width ="1%" align ="right" ><gw:button   id="btnSave_D"   img="save"      alt="Save"   onclick="OnSave_Item()"   /> </td>
	                                                <td width ="3%" align ="right" ><gw:button   id="btnDel_D"    img="delete"    alt="Delete" onclick="OnDelete_Item()"   /> </td>
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
                                        header  ="_tac_crcad_pk|_tac_crca_pk|Order No|tco_item_pk|Item Code|Item Name|HS Code|Unit|U/Price|Q'ty|Order Amt|Net U/Price|Extended Price|Net Trans Amt|Net Books Amt|Ac. Code|Account Name|_tac_abacctcode_pk|Description|Local Desc|_tex_cinv_dtl_pk|_tac_mattakein_ap_pk|_Order UPrice|VAT Trans|VAT Books|VAT Rate|VAT Tax"
                                        format  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                        aligns  ="0|0|1|0|0|0|1|1|3|3|3|0|3|3|3|0|0|0|0|0|0|0|0|0|0|0|0"
                                        defaults="||||||||||||||||||||||||||"
                                        editcol ="0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|0|0|0|1|1|0|0|0|1|1|1|1"
                                        widths  ="0|0|1500|0|1500|2500|1300|800|1000|1000|1500|1500|1500|2500|0|1500|2000|2000|0|0|0|1500|0|0|0|0"
                                        styles  ="width:100%; height:100%"
                                        sorting ="F"  
										acceptNullDate="T"
										onafteredit="OnEditDtl()"
										oncelldblclick="OnDblClickDtlItem()"
                                        />
                                </td>
                            </tr>
	                        </table>
						
							<table name="PL" style="width:100%;height:100%" cellpadding ="0" cellspacing ="0" border="0" >
								<tr style="height:10%;">
									<td width ="99%" align ="right" ></td>
									<td width ="1%" align ="right" ><gw:button   id="btnSave_PL" img="save" alt="Save" onclick="OnSave_PL()" /> </td>
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
                                        widths  ="0|0|1500|3500|1500|2500"
                                        styles  ="width:100%; height:100%"
                                        sorting ="T"
										autosize="T"
										oncelldblclick="OnDblDtlPL()"			
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

<gw:textbox id="txtARAccPK" styles="display:none;" />
<gw:textbox id="txtCustPK_Sr_1" styles="display:none;" />
<gw:textbox id="txtCustPK_Sr" styles="display:none;" />
<gw:textbox id="txtemp_pk" styles="display:none;" />
<gw:textbox id="txtProposedByUserPk" styles="display:none;" />
<gw:textbox id="txtCRCA_OTHER_PK" styles="display:none;" />

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
<gw:textbox id="txtReturn" text="" styles="display:none;" />
<gw:textbox id="txtUser_PK" styles="width:100%; display:none;" />
<gw:textbox id="txtEmpNM" styles="display:none;" />
<gw:textbox id="txtTrTP_AR_CD" styles="display:none;" />
<gw:textbox id="txtTrTP_AR_NM" styles="display:none;" />
<gw:textbox id="txtTrTP_AR" styles="display:none;" />
<gw:textbox id="txtBK_RATE" styles="display:none;" />
<gw:textbox id="txtTransTPK" styles="display:none;" />

<gw:textbox id="txtIndex" text="1" styles="display:none;" />
<gw:textbox id="txtCancelCause" text="" styles="display:none;" />

<gw:textbox id="txtcrca_other_pk_lst" text="" styles="display:none;" />
<gw:textbox id="txtTR_RATE" text="" styles="display:none;" />
<gw:textbox id="txtn" text="" styles="display:none;" />

</body>
</html>