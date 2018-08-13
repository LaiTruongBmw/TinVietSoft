<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>    
</head>
<%CtlLib.SetUser("acnt")%>
<script>
// global variables of grdAdv

var g_tfn_eppaytr			= 0,
	g_Chk					= 1,
	g_No					= 2,	
	g_AdvReqNo				= 3,
	g_AdvReqDate			= 4,
	g_DueDate				= 5,
	g_Seq					= 6,
	g_PVNo					= 7,
	g_PVDate				= 8,
	g_Vendor_nm				= 9,
	g_tac_abacctcode_pk		= 10,
	g_ac_cd					= 11,
	g_ac_nm					= 12,
	g_TransCcy				= 13,
	g_TransRate				= 14,
	g_BooksRate				= 15,
	g_AdvTransAmt			= 16,
	g_AdvBooksAmt			= 17,
	g_ClearTransAmt			= 18,
	g_ClearBooksAmt			= 19,
	g_TransBal				= 20,
	g_BooksBal				= 21,
	g_ClearAll				= 22,
	g_Description			= 23,
	g_LocalDesc				= 24,
	g_tac_crda_pk			= 25,
	g_sub_tr_famt		    = 26,
	g_sub_tr_amt			= 27,
	g_vendor_pk				= 28,
	g_Type_ref				= 29 ;
		
// global variables of grdAP	
//|No|_tac_abacctcode_pk|Acc. Code|Acc. Name|Acc.Code CR|Acc.Name CR|Ccy|Trans Rate|Books Rate|
//TransAmount|Books Amount|Clear Trans. Amt|Clear Books. Amt.|Trans Balance|Books Balance|
//_tac_crda_pk|_tac_eppay_ap_pk|_otherincome_famt|_otherincome_amt|_clear_famt|_clear_amt|
//_CCY|_tac_abplcenter_pk|PL_Code|_adv_famt|_adv_famt|_AP_YN|Type Ref|_ACC_PK_CR|_ACC_PK_ADV
	var 
		g_A_Chk					= 0,
		g_A_No					= 1,
		g_A_tac_abacctcode_pk 	= 2,
		g_A_AccountCode  		= 3,
		g_A_AccountName			= 4,
		g_A_AccountCode_CR  		= 5,
		g_A_AccountName_CR			= 6,
		g_A_Ccy					= 7,
		g_A_TransExRate			= 8,
		g_A_BooksExRate			= 9,
		g_A_TransAmount			= 10,
		g_A_BooksAmount			= 11,
		g_A_ClearTransAmt		= 12,
		g_A_ClearBooksAmt		= 13,
		g_A_TransBalance		= 14,
		g_A_BooksBalance		= 15,
		g_A_tac_crda_pk			= 16,
		g_A_tac_eppay_pk		= 17,
		g_A_otherincome_famt	= 18,
		g_A_exrate_diff			= 19,
		g_A_clear_famt			= 20,
		g_A_clear_amt		 	= 21,
		g_A_Adv_ccy             = 22,
		g_A_tac_abplcenter_pk	= 23,
		g_A_PL_Code				= 24,
        g_A_adv_famt 			= 25,
        g_A_adv_amt				= 26,
		g_A_AP_YN				= 27,
		g_A_Type_Ref			= 28,
		g_A_ACC_PK_CR			= 29 ,
		g_A_ACC_PK_ADV			= 30;		
		
//  global variables of grdClear
	var g_C_tfn_eppaytr	 		= 0,
		g_C_tac_crdad_pk		= 1,
		g_C_Chk					= 2,
		g_C_No					= 3,
		g_C_TransDate			= 4,
		g_C_TransCcy			= 5,
		g_C_TransExRate1		= 6,
		g_C_BooksExRate1		= 7,
		g_C_ClearTransAmt		= 8,
		g_C_ClearBooksAmt		= 9,
		g_C_AccountCode			= 10,
		g_C_AccountName			= 11,
		g_C_Ccy					= 12,
		g_C_TransExRate2		= 13,
		g_C_BooksExRate2		= 14,
		g_C_TransAmount			= 15,
		g_C_BooksAmount			= 16,
		g_C_Trans_Diff			= 17,
		g_C_Books_Diff			= 18,
		g_C_Trans_Diff_Loss		= 19,
		g_C_Books_Diff_Loss		= 20,		
		g_C_Trans_Retouch_711	= 21,
		g_C_Books_Retouch_711	= 22,
		g_C_Trans_Retouch_811	= 23,
		g_C_Books_Retouch_811	= 24,
		g_C_tac_eppay_ap_pk		= 25,
		g_C_curr_rate			= 26;
// grdAdv_1
	var g_1_iChk  				= 0,
		g_1_tfn_eradv_ven_pk	= 1,
		g_1_tco_buspartner_pk	= 2,
		g_1_seq					= 3,
		g_1_voucherno			= 4,
		g_1_partner_id			= 5,
		g_1_partner_lname		= 6,
		g_1_tr_ccy				= 7,
		g_1_tr_rate				= 8,
		g_1_bk_rate				= 9,
		g_1_tr_famt				= 10,
		g_1_tr_amt				= 11,
		g_1_tac_abacctcode_pk	= 12,
		g_1_ac_cd				= 13,
		g_1_ac_nm				= 14;			
// global variable for saving data
	var g_Save	= false ;
	var g_Insert = false ;
	var g_Status = "";
	var g_refresh_yn = false ;
	var g_company_pk = "<%=Session("COMPANY_PK") %>" ;
	
function BodyInit()
{
    System.Translate(document);
	var l_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
	lstCompany.SetDataText(l_data);	
	lstCompany.value = g_company_pk ;
	l_data     = "<%=CtlLib.SetListDataSQL("select pk, org_nm from tco_org where del_if = 0")%>";
	lstDept.SetDataText(l_data + "|ALL|Select All");
	lstDept.value = "ALL";	
	l_data     = "<%=CtlLib.SetListDataSQL("select a.code, a.code code_2 from tac_commcode_detail a, tac_commcode_master b where a.del_if = 0 and b.del_if = 0 and a.tac_commcode_master_pk = b.pk and a.def_yn = 'Y' and b.id = 'ACBG0040'")%>";
	lstBookCcy.SetDataText(l_data);
	l_data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','','') FROM DUAL")%>"; 
	lstTransCcy.SetDataText(l_data);
	txttac_crda_PK.text = "<%=Request("tac_crda_pk") %>" ;
	g_Status = "<%=Request("status") %>" ;
	<%=CtlLib.SetGridColumnComboFormat("grdAP", 7,"SELECT A.CODE, A.CODE CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
	if(g_Status == "1")
	{
		btnNew.SetEnable(true);
		btnSave.SetEnable(false);
		btnCancel.SetEnable(true);
	}
	else
	{
		btnNew.SetEnable(false);
		btnSave.SetEnable(false);
		btnCancel.SetEnable(false);	
	}
	l_data = dtToday.value ;
	txtTransDT.text = l_data.substr(6, 2) + "/" + l_data.substr(4, 2) + "/" + l_data.substr(0, 4) ;
	dtReqFr.value = l_data.substr(0, 4) + "0101";
	dtPayFr.value = l_data.substr(0, 4) + "0101";		
	txtTrStatus.text  = g_Status;
	btnSearch.SetEnable(false);
	
	txtAPTR_Type.text = "<%=Request("AP_Type") %>" ;
	//grdClear.AddRow();		
	//OnMergeHeader();	
	//dso_ap_list.Call("SELECT");
	dso_sel_booksrate.Call();
}
//--------------------------------------------
function onSearchVen()
{
    var path    = System.RootURL + '/standard/forms/gf/co/ffbp00031.aspx';
	var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes;toolbar:no;location:no;directories:no;status:no;menubar:no;scrollbars:no;resizable:no;');
	if ( object != null )
	{
	    if (object[0] != 0)
        {
            txtven_cd.text = object[1];
            txtven_nm.text = object[2];
            txtven_pk.text = object[0];
        }
    }
}
//--------------------------------------------
function onResetVen()
{
    txtven_cd.text = '';
    txtven_nm.text = '';
    txtven_pk.text = '';
}
//--------------------------------------------
function OnPopup(iCase) 
{
	switch(iCase)
	{
		case "Vendor":
		var path    = System.RootURL + '/standard/forms/gf/co/ffbp00031.aspx';
		var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
		if( object != null )
		{
			if (object[0] != 0)
			{
				txtChargerPK.text = object[0];
				txtChargerNM.text = object[2];
				txtChargerID.text = object[1];
			}
        }				
		break ;
		case "Employee":
			var path = System.RootURL + "/standard/forms/ch/ae/chae00010_search_emp.aspx";
			var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');		
			if(object!=null)
			{
				txtEmpPK.text = object[0];                
				txtEmpID.text = object[1];
				txtEmpNM.text = object[2];
			}        			
		break ;
	}
}
//--------------------------------------------
function OnSearch(iCase)
{
	switch(iCase)
	{
		case 'grdAdv':
			dso_advance_list.Call("SELECT");
			break ;
		case 'grdAdv_1':
			dso_advance_list_1.Call("SELECT");
			break ;
	}
}
//--------------------------------------------
function OnDataReceive(iObj)
{
	switch(iObj.id)
	{
		case "dso_pro_clear_all_yn":
			/*if(txtRtnMsg.text == "1")
			{
				alert("Already cleared all for this slip");
			}
			else
			{*/
				OnProcess_General();
			//}	
		break ;
		case "dso_advance_list":
			if(g_Save)
			{
				g_Save = false;
				if(Number(txtExRate_DRCR.text) != 0 || Number(txtRcvExcessLack_DRCR.text) != 0 )
				{
					dso_pro_rate_revexcess.Call();								
				}	
			}
			else
			{
				var i, l_clear_tramt = 0, l_clear_bkamt = 0
				OnFormatGrid("grdAdv");
				for(i = 1; i < grdAdv.rows ; i++)
				{
					l_clear_tramt += Number(grdAdv.GetGridData(i, g_ClearTransAmt));
					l_clear_bkamt += Number(grdAdv.GetGridData(i, g_ClearBooksAmt));
				}
				txtTransAmt.text = l_clear_tramt.toFixed(3);
				txtBkAmt.text = l_clear_bkamt.toFixed(3);
				
				//dso_clear_advance.Call("SELECT");
			}		
		break ;
		case "dso_ap_list":
			OnFormatGrid("grdAP");
			if(g_Save)
			{						
				dso_advance_list.Call();	
			}
			else
			{
				dso_advance_list.Call('SELECT');
				btnSearch.SetEnable(true);
			}
		break ;	
		case 'dso_merge_adv':
			dso_advance_list_1.Call('SELECT');
		break;
		case 'dso_pro_unprocess':
			// reset thong tin 
			txtExRate_DRCR.text = "";
			txtRcvExcessLack_DRCR.text = "";
			dso_ap_list.Call('SELECT');
		break ;
	}
}
//--------------------------------------------
function OnFormatGrid(iCase)
{
	switch(iCase)
	{
		case "grdAdv":
			var ctrl = grdAdv.GetGridControl();
			if(lstBookCcy.value == "VND")
			{
				ctrl.ColFormat(g_BooksRate) = "###,###,###R";
				ctrl.ColFormat(g_TransRate) = "###,###,###R";
				ctrl.ColFormat(g_AdvBooksAmt) = "###,###,###R";
				ctrl.ColFormat(g_ClearBooksAmt) = "###,###,###R";
				ctrl.ColFormat(g_BooksBal) = "###,###,###R";
			}
			else 
			{
				ctrl.ColFormat(g_BooksRate) = "###,###,###.##R";
				ctrl.ColFormat(g_TransRate) = "###,###,###.##R";
				ctrl.ColFormat(g_AdvBooksAmt) = "###,###,###.##R";
				ctrl.ColFormat(g_ClearBooksAmt) = "###,###,###.##R";
				ctrl.ColFormat(g_BooksBal) = "###,###,###.##R";	
			}
			ctrl.ColFormat(g_AdvTransAmt) 	= "###,###,###.##R";	
			ctrl.ColFormat(g_ClearTransAmt) = "###,###,###.##R";	
			ctrl.ColFormat(g_TransBal) 		= "###,###,###.##R";		
		break ;
		case "grdAP":
			var ctrl = grdAP.GetGridControl();
			ctrl.ColFormat(g_A_TransExRate) 	= "###,###,###R";
			ctrl.ColFormat(g_A_BooksExRate) 	= "###,###,###R";
			ctrl.ColFormat(g_A_TransAmount) 	= "###,###,###.##R";
			ctrl.ColFormat(g_A_TransBalance) 	= "###,###,###.##R";
			ctrl.ColFormat(g_A_ClearTransAmt) 	= "###,###,###.##R";			
			if(lstBookCcy.value == "VND")
			{
				ctrl.ColFormat(g_A_BooksAmount) = "###,###,###R";
				ctrl.ColFormat(g_A_ClearBooksAmt) = "###,###,###R";
				ctrl.ColFormat(g_AdvBooksAmt) = "###,###,###R";
				ctrl.ColFormat(g_A_BooksBalance) = "###,###,###R";
			}
			else 
			{
				ctrl.ColFormat(g_A_BooksAmount) 	= "###,###,###.##R";
				ctrl.ColFormat(g_A_ClearBooksAmt) 	= "###,###,###.##R";
				ctrl.ColFormat(g_AdvBooksAmt) 		= "###,###,###.##R";
				ctrl.ColFormat(g_A_BooksBalance) 	= "###,###,###.##R";
			}
		break ;
	}		
}
//--------------------------------------------
function OnProcess_General()
{
	/*
	if(OnValidate()==false)
	{
		return ;
	}*/
	/*
	for( i = 1; i < grdAdv.rows ; i++)
	{
		grdAdv.SetGridText(i, g_tac_crda_pk, txttac_crda_PK.text);
	}		
	for(i = 1; i < grdAP.rows; i++)
	{
		if(Number(grdAP.GetGridData(i, g_A_BooksBalance)) != 0)
		{
			l_clearall = false ;
			break ;
		}	
	}	
	if(l_clearall == true)
	{
		alert('Has cleared all' + '\n' + 'Ðã trả hết nợ!!!');
		return ;
	}
	*/
	var l_adv_ccy = "", l_adv_rate = 0; // Advance
	var l_adv_bk_rate = 0;	
	var l_ap_ccy = "", l_ap_rate = 0;   // AP
	var l_ap_bk_rate = 0;
	
	
}
//--------------------------------------------
function OnClearAdv_VND()
{
	grdTemp.C
	var l_book_ccy = lstBookCcy.value ;
	if(l_book_ccy == 'VND')
	{
		var l_adv_trans = 0; // Advanced Trans Amount
		var l_adv_books = 0 ; // Advanced Books Amount
		var l_adv_ccy = "" ; // Advanced Trans Ccy
		var l_adv_rate = 0 ; // Advance Ex Rate
		var l_ap_ccy = "" ; // AP Trans Ccy		
		var l_ap_rate = 0 ; // AP Ex Rate
		var l_sum_adv_trans = 0 ; // Sum Cleared Advanced Amount TRans
		var l_sum_adv_books = 0 ; // Sum Cleared Advanced Amount Books		
		var l_clr_trans	= 0 ; // Cleared Trans Amount
		var l_clr_books	= 0 ; // Cleared Books Amount
		var l_ap_trans = 0 ; // AP Trans Amount
		var l_ap_books = 0 ; // AP Books Amount
		var l_diff_exrate = 0 ; // Diff Ex Rate
		var l_type_ref	= ""; // Type Ref of AP Slip
		var i, j;
		for(i = 1; i < grdAdv.rows; i++)
		{		
			if(grdAdv.GetGridData(i, g_Chk) == '-1')
			{
				l_sum_adv_trans = 0;
				l_sum_adv_books = 0 ;
				l_adv_ccy = grdAdv.GetGridData(i, g_TransCcy);
				l_adv_rate = Number(grdAdv.GetGridData(i, g_TransRate));
				l_adv_trans = Number(grdAdv.GetGridData(i, g_TransBal));
				l_adv_books = Number(grdAdv.GetGridData(i, g_BooksBal));
				if(l_adv_ccy != "VND")
				{
					for(j = 1; j < grdAP.rows; j++)
					{
						if(grdAP.GetGridData(j, g_A_Chk) == '-1')
						{
							l_ap_trans = Number(grdAP.GetGridData(j, g_A_TransBalance));
							l_ap_books = Number(grdAP.GetGridData(j, g_A_BooksBalance));
							l_ap_rate = Number(grdAP.GetGridData(j, g_A_TransExRate));
							l_ap_ccy = grdAP.GetGridData(j, g_A_Ccy);							
							l_type_ref = grdAP.GetGridData(j, g_A_Type_Ref);
							if(l_type_ref == "0")
							{
								
							}
						}
					}
				}
				else //else (l_adv_ccy == "VND")
				{
				}
			}
		}
	}
}
//--------------------------------------------
function OnProcess_Poslilama()
{
	if( OnValidate() == false )
	{
		return ;
	}
	var i ;
	var l_clearall = true ;	
	for( i = 1; i < grdAdv.rows ; i++ )
	{
		grdAdv.SetGridText(i, g_tac_crda_pk, txttac_crda_PK.text);
	}		
	for(i = 1; i < grdAP.rows; i++)
	{
		if(Number(grdAP.GetGridData(i, g_A_BooksBalance)) != 0)
		{
			l_clearall = false ;
			break ;
		}	
	}	
	if(l_clearall == true)
	{
		alert('Has cleared all' + '\n' + 'Ðã trả hết nợ!!!');
		return ;
	}
	if(grdAP.rows > 1)
	{
		for(i = 1; i < grdAP.rows ; i++ )
		{
			grdAP.SetRowStatus(i, Number("0x00"));
		}
	}		
	// clear advance for ap domestic, only used for Poslilama
	var l_trans , l_books ;
	var l_adv_trans, l_adv_books, l_clr_trans, l_clr_books, l_ap_bk_rate, l_adv_bk_rate;
	var l_sum_trans, l_sum_books, l_sum_diff, l_ap_tot_amt = 0;
	var l_ap_trans , l_tot_clr_books = 0, l_ap_books ;
	l_sum_diff = 0 ; 
	for(i = 1; i < grdAdv.rows; i++)
	{
	    grdAdv.SetRowStatus(i, 0);	    
    }	    
	for(i = 1; i < grdAdv.rows; i++)
	{
	    if(grdAdv.GetGridData(i, g_Chk) == '-1') // if grdAdv.checked
	    {
	        l_sum_trans = 0;
	        l_sum_books = 0;
	        l_adv_trans = Number(grdAdv.GetGridData(i, g_TransBal));
	        l_adv_books = Number(grdAdv.GetGridData(i, g_BooksBal));
	        l_adv_bk_rate = Number(grdAdv.GetGridData(i, g_BooksRate));
	        for(j = 1; j < grdAP.rows; j++)
	        {
    	        if(grdAP.GetGridData(j, g_A_Chk) == '-1' ) // if grdAP.checked
    	        {
    	            l_ap_trans = Number(grdAP.GetGridData(j, g_A_TransBalance));
    	            l_ap_bk_rate = Number(grdAP.GetGridData(j, g_A_BooksExRate));    	            
    	            l_clr_trans = Number(grdAP.GetGridData(j, g_A_clear_famt));
    	            l_clr_books = Number(grdAP.GetGridData(j, g_A_clear_amt));    	            
    	            l_ap_books = Number(grdAP.GetGridData(j, g_A_BooksBalance));
    	             
    	             if(l_ap_trans == 0 && l_ap_books == 0)
    	             {
    	                continue ;
    	             }
    	            if(l_adv_books > 0 && l_adv_books <= l_ap_books  )
    	            {
    	                if(idClearAll.GetData()=="T")
    	                {
    	                    l_trans = l_ap_trans ;
    	                    l_books = l_ap_books;    	                    
    	                }
    	                else
    	                {
    	                    l_trans = l_adv_trans ;
    	                    l_books = l_adv_books;
    	                }
    	                l_sum_trans += l_trans ;
    	                l_sum_books += l_adv_books ;
    	                l_clr_trans += l_trans ;
    	                l_clr_books += l_books ;
    	                l_adv_trans = 0;
    	                grdAP.SetGridText(j, g_A_ClearTransAmt, l_clr_trans);// cleared trans
    	                grdAP.SetGridText(j, g_A_ClearBooksAmt, l_clr_books); // cleared books
    	                grdAP.SetGridText(j, g_A_clear_famt, l_clr_trans);// cleared trans
    	                grdAP.SetGridText(j, g_A_clear_amt, l_clr_books); // cleared books    	                
    	                grdAdv.SetGridText(i, g_TransBal, 0);
    	                grdAdv.SetGridText(i, g_BooksBal, 0);
    	                grdAP.SetGridText(j, g_A_TransBalance, l_ap_trans - l_trans );
    	                grdAP.SetGridText(j, g_A_BooksBalance, l_ap_books - l_clr_books );
    	            }
    	            else if(l_adv_books > l_ap_books && l_ap_books > 0 )
    	            {    	                
    	                l_trans = l_ap_trans ;
    	                l_books = l_ap_books;
	                    l_sum_books += l_books ;
	                    l_adv_books -= l_books ;    	                        	                
    	                l_sum_trans += l_trans ;    	                
    	                l_clr_trans += l_trans ;
    	                l_clr_books += l_books ;
    	                l_adv_trans -= l_ap_trans ;    	                
    	                grdAP.SetGridText(j, g_A_ClearTransAmt, l_clr_trans);// cleared trans
    	                grdAP.SetGridText(j, g_A_ClearBooksAmt, l_clr_books); // cleared books    	                
    	                grdAP.SetGridText(j, g_A_clear_famt, l_clr_trans);// cleared trans
    	                grdAP.SetGridText(j, g_A_clear_amt, l_clr_books); // cleared books    	                                 
    	                grdAdv.SetGridText(i, g_TransBal, l_adv_trans);
    	                grdAdv.SetGridText(i, g_BooksBal, l_adv_books);
    	                grdAP.SetGridText(j, g_A_TransBalance, 0 );
    	                grdAP.SetGridText(j, g_A_BooksBalance, 0 );
    	            }
    	        } // if grdAP.checked
	        } // for j
	        if(l_sum_books > 0 )
	        {
	            grdAdv.SetGridText(i, g_sub_tr_famt, l_sum_trans );
	            grdAdv.SetGridText(i, g_sub_tr_amt, l_sum_books );	        
	            l_trans = Number(grdAdv.GetGridData(i, g_ClearTransAmt));
	            l_books = Number(grdAdv.GetGridData(i, g_ClearBooksAmt));
	            grdAdv.SetGridText(i, g_ClearTransAmt, l_trans + l_sum_trans );
	            grdAdv.SetGridText(i, g_ClearBooksAmt, l_books + l_sum_books );	        	            
	            grdAdv.SetRowStatus(i, Number('0x10'));
	            
	        }    
	        l_tot_clr_books += l_sum_books ;
        } // if if grdAdv.checked 	        
	}// for i
	//-------------------ExRate Loss-Gain
	if(l_sum_diff != 0)
	{
	    txtExRate_DRCR.SetDataText(Math.round(Number(l_sum_diff * 100)) / 100);	    
	}
	else
	{
	    txtExRate_DRCR.SetDataText("0");	    
	}
	//-------------------Clear All
	if(idClearAll.GetData()=="T")
	{
	    for(i = 1; i < grdAP.rows; i++)
	    {
	        l_ap_tot_amt += Number(grdAP.GetGridData(i, g_A_BooksAmount));
	    }	    
	    l_tot_clr_books = l_ap_tot_amt - l_tot_clr_books ;
	    txtRcvExcessLack_DRCR.SetDataText(Math.round(Number(l_tot_clr_books) * 100)/100);
	}
	else
	{
	    txtRcvExcessLack_DRCR.SetDataText("0");
	}
	// button status
	btnNew.SetEnable(false);
	btnCancel.SetEnable(false);
	btnSave.SetEnable(true);
}	
//--------------------------------------------
function OnSave()
{
	var i;
	g_Save = true ;
	//dso_clear_advance.Call();
	//if(OnValidate())
	//{
		/*if(grdAP.rows > 1)
		{
			grdAP.SetGridText(1, g_A_otherincome_famt, txtTotBkAmt.text) ;
			grdAP.SetGridText(1, g_A_exrate_diff, txtBalBkAmt.text) ;
			grdAP.SetGridText(1, g_A_tac_crda_pk, txttac_crda_PK.text) ;
		}*/
		g_refresh_yn = true;
	// button status
	    btnNew.SetEnable(true);
	    btnCancel.SetEnable(true);
	    btnSave.SetEnable(false);		
		dso_ap_list.Call();
	//}	
}
//--------------------------------------------
function onSetBookRate()
{
	//dso_clear_advance.Call("SELECT");
	dso_ap_list.Call("SELECT");
}
//--------------------------------------------
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
//----------------------------------------------
function EditAdvance()
{
	var l_row = event.row ;
	if(grdAdv.GetGridData(l_row, g_Chk) == '-1')
	{
		grdAdv.SetColEdit(g_ClearTransAmt, 1);
	}
	else
	{
		grdAdv.SetColEdit(g_ClearTransAmt, 0);
	}
	if(event.col == g_ClearTransAmt)
	{
		var l_clr_trans_amt = 0, l_clr_book_amt = 0, l_tr_rate = 0, l_bk_rate = 0;
		var l_adv_trans_amt = 0, l_adv_book_amt = 0;
		var l_trans_bal = 0;
		l_clr_trans_amt = Number(grdAdv.GetGridData(l_row, g_ClearTransAmt));
		l_trans_bal = Number(grdAdv.GetGridData(l_row, g_TransBal));
		/*if(l_clr_trans_amt > l_trans_bal)
		{
			alert('Clear amount must be less than or equal to balance amount');
			return false ;		
		}*/
		l_tr_rate = Number(grdAdv.GetGridData(l_row, g_TransRate));
		l_bk_rate = Number(grdAdv.GetGridData(l_row, g_BooksRate));
		l_clr_book_amt = FormatCalculate(lstBookCcy.value, Number(l_clr_trans_amt * l_tr_rate / l_bk_rate ));
		grdAdv.SetGridText(l_row, g_ClearBooksAmt, l_clr_book_amt);
		l_adv_trans_amt = Number(grdAdv.GetGridData(l_row, g_AdvTransAmt));
		l_adv_book_amt = Number(grdAdv.GetGridData(l_row, g_AdvBooksAmt));
		grdAdv.SetGridText(l_row, g_TransBal, Number(l_adv_trans_amt) - Number(l_clr_trans_amt) );
		grdAdv.SetGridText(l_row, g_BooksBal, Number(l_adv_book_amt) - Number(l_clr_book_amt) );
		//OnCalcExRateDiff();
	}
}
//----------------------------------------------
function OnClickAdvance()
{
	var l_row = event.row ;
	if(grdAdv.GetGridData(l_row, g_Chk) == '-1')
	{
		grdAdv.SetColEdit(g_ClearTransAmt, 1);
		grdAdv.SetColEdit(g_ClearBooksAmt, 1);
	}
	else
	{
		grdAdv.SetColEdit(g_ClearTransAmt, 0);
		grdAdv.SetColEdit(g_ClearBooksAmt, 0);
	}	
}
//----------------------------------------------
function OnClickAP()
{
	var l_row = event.row ;
	if(grdAP.GetGridData(l_row, g_A_Chk) == '-1')
	{
		grdAP.SetColEdit(g_A_ClearTransAmt, 1);
		grdAP.SetColEdit(g_A_ClearBooksAmt, 1);
	}
	else
	{
		grdAP.SetColEdit(g_A_ClearTransAmt, 0);
		grdAP.SetColEdit(g_A_ClearBooksAmt, 0);
	}	
}
//----------------------------------------------
function OnEditAP()
{
	var l_tr_rate = 0, l_bk_rate = 0, l_clr_trans_amt = 0, l_clr_book_amt = 0;
	var l_row = event.row ;
	var l_ap_trans_amt = 0, l_ap_book_amt = 0;
	var l_ac_cd = "";
	l_ac_cd = grdAP.GetGridData(l_row, g_A_AccountCode);
	if(l_ac_cd.substring(0, 3) == "711" || l_ac_cd.substring(0, 3) == "811" )
	{
		l_tr_rate = grdAP.GetGridData(l_row, g_A_TransExRate);
		l_bk_rate = grdAP.GetGridData(l_row, g_A_BooksExRate);
		l_clr_trans_amt = Number(grdAP.GetGridData(l_row, g_A_ClearTransAmt));
		l_clr_book_amt = FormatCalculate(lstBookCcy.value, Number(l_clr_trans_amt * l_tr_rate / l_bk_rate));
		grdAP.SetGridText(l_row, g_A_ClearBooksAmt, l_clr_book_amt);		
	}
    else
    {	
		l_tr_rate = grdAP.GetGridData(l_row, g_A_TransExRate);
		l_bk_rate = grdAP.GetGridData(l_row, g_A_BooksExRate);
		l_clr_trans_amt = Number(grdAP.GetGridData(l_row, g_A_ClearTransAmt));
		l_clr_book_amt = FormatCalculate(lstBookCcy.value, Number(l_clr_trans_amt * l_tr_rate / l_bk_rate));
		grdAP.SetGridText(l_row, g_A_ClearBooksAmt, l_clr_book_amt);
		l_ap_trans_amt = grdAP.GetGridData(l_row, g_A_TransAmount );
		l_ap_book_amt = grdAP.GetGridData(l_row, g_A_BooksAmount );
		grdAP.SetGridText(l_row, g_A_TransBalance, Number(l_ap_trans_amt) - Number(l_clr_trans_amt));
		grdAP.SetGridText(l_row, g_A_BooksBalance, Number(l_ap_book_amt) - Number(l_clr_book_amt));			
	}	
}
//----------------------------------------------
function OnDblClickAP()
{
	var l_row = event.row ;
	var l_col = event.col ;
	if(l_col == g_A_AccountCode)
	{
		var fpath = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "711" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ACNT.SP_SEL_ACCT_POPUP";
		o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
		if (o != null)
		{
			if(o[0] != 0)
			{
				grdAP.SetGridText(l_row, g_A_tac_abacctcode_pk, o[3]); // account pk
				grdAP.SetGridText(l_row, g_A_AccountCode, o[0]); // account code
				grdAP.SetGridText(l_row, g_A_AccountName, o[1] ); // account name
			}			
		}		
	}
}
//----------------------------------------------
function OnValidate()
{
	var i, j;
	var l_grp_id = "", l_grp_id_1 = "";
	var l_cnt = 0, l_cnt_1 = 0;
	// Kiem tra AP
	for(i = 1; i < grdAdv.rows ; i++)
	{
		if(grdAdv.GetGridData(i, g_Chk) == "-1")
		{
			l_cnt += 1;
		}
	}	
	for(i = 1; i < grdAP.rows; i++)
	{
		if(grdAP.GetGridData(i, g_A_Chk) == "-1")
		{
			l_cnt_1 += 1;
		}
	}	
	if(!((l_cnt == 1 && l_cnt_1 >= 1) || (l_cnt_1 == 1 && l_cnt >= 1)))
	{
		return false ;
		
	}
	if(l_cnt == 1)
	{
		for(i = 1; i < grdAdv.rows; i++)
		{
			if(grdAdv.GetGridData(i, g_Chk) == "-1")
			{
				l_grp_id_1 = grdAdv.GetGridData(i, g_No) ;
			}
		}	
	}	
	
	if(l_cnt_1 == 1)
	{
		for(i = 1; i < grdAP.rows; i++)
		{
			if(grdAP.GetGridData(i, g_A_Chk) == "-1")
			{
				l_grp_id = grdAP.GetGridData(i, g_A_No) ;
			}
		}	
	}	
	
	for(i = 1; i < grdAdv.rows; i++)
	{
		if(grdAdv.GetGridData(i, g_Chk) == "-1")
		{
			if( (grdAdv.GetGridData(i, g_No) != l_grp_id) && (l_grp_id != "" ) )
			{
				return false ;
			}
		}
	}

	
	for(i = 1; i < grdAP.rows - 1; i++)
	{
		if(grdAP.GetGridData(i, g_A_Chk) == "-1")
		{
			if( (grdAP.GetGridData(i, g_A_No) != l_grp_id_1) && (l_grp_id_1 != "") )
			{
				return false ;
			}
		}
	}
	
	return true ;
}
//----------------------------------------------
function OnDelete()
{
	var i;
	var fg = grdAP.GetGridControl();
	for(i = 1; i < grdAP.rows; i++)
	{
		if(fg.isSelected(i)== true)
		{
			grdAP.SetRowStatus(i, Number(0x40) );
		}		
	}
	dso_ap_list.Call();
}
//----------------------------------------------
function OnDivide()
{
	var i, l_newrow, n = 0 ;
	for(i = 1; i < grdAdv_1.rows ; i++)
	{
		
	}
	grdAdv_1.AddRow();
	l_newrow = grdAdv_1.rows - 1;
	for(i = 0; i < grdAdv_1.cols; i++)
	{
		grdAdv_1.SetGridText(l_newrow, i, grdAdv_1.GetGridData(1, i));
	}	
	grdAdv_1.SetGridText(l_newrow, g_1_iChk, '0');	
	grdAdv_1.SetGridText(l_newrow, g_1_tr_famt, '');	
	grdAdv_1.SetGridText(l_newrow, g_1_tr_amt, '');	
	
}
//----------------------------------------------
function OnSearchTab()
{
	switch(idTab.GetCurrentPageNo())
	{
		case 0:
			
		break ;
		case 1:
			if(Trim(txtSeq.text) == '')
			{
				alert('Please input Seq to divide or merge data');
				return ;
			}			
			dso_advance_list_1.Call('SELECT');
		break ;
	}
}
//----------------------------------------------
function OnEditAdv_1()
{
	var l_row = event.row ;
	var l_col = event.col ;
	if (l_row == 2)
	{
		var l_tr_famt_1 = 0, l_tr_famt_2 = 0, l_tr_amt_1 = 0, l_tr_amt_2 = 0;
		var l_tr_ccy = grdAdv_1.GetGridData(1, g_1_tr_ccy);
		var l_tr_rate = grdAdv_1.GetGridData(1, g_1_tr_rate);
		var l_bk_rate = grdAdv_1.GetGridData(1, g_1_bk_rate);
		
		if(l_col == g_1_tr_famt)
		{
			l_tr_famt_2 = grdAdv_1.GetGridData(l_row, g_1_tr_famt);
			l_tr_famt_1 = grdAdv_1.GetGridData(1, g_1_tr_famt);
			l_tr_famt_1 = Number(l_tr_famt_1 - l_tr_famt_2) ;
			grdAdv_1.SetGridText(1, g_1_tr_famt, l_tr_famt_1);
			l_tr_amt_2 = FormatCalculate(l_tr_ccy, Number(l_tr_famt_2 * l_tr_rate / l_bk_rate) );
			grdAdv_1.SetGridText(l_row, g_1_tr_amt, l_tr_amt_2);
			l_tr_amt_1 = grdAdv_1.GetGridData(1, g_1_tr_amt);
			l_tr_amt_1 = Number(l_tr_amt_1 - l_tr_amt_2) ;
			grdAdv_1.SetGridText(1, g_1_tr_amt, l_tr_amt_1);
		}
	}	
}
//----------------------------------------------
function OnUpdate()
{
	var i, n = 0 ;
	for(i = 1; i < grdAdv_1.rows; i++)
	{
		if(grdAdv_1.GetGridData(i, g_1_iChk)=='-1')
		{
			n += 1;
		}
	}
	if(n != 2)
	{
		return ;
	}
	grdAdv_1.SetRowStatus(2, 0x20);
	grdAdv_1.SetRowStatus(1, 0x10);
	dso_advance_list_1.Call();
}
//----------------------------------------------
function OnMerge()
{
	var i, n = 0 ;
	for(i = 1; i < grdAdv_1.rows; i++)
	{
		if(grdAdv_1.GetGridData(i, g_1_iChk)=='-1')
		{
			n += 1;
		}
	}
	if(n != 2)
	{
		return ;
	}
	for( i = 1; i < grdAdv_1.rows; i++)
	{
		grdAdv_1.SetRowStatus(i, 0x10);
	}
	var l_eradv_pk = '';
	l_eradv_pk = grdAdv_1.GetGridData(1, g_1_tfn_eradv_ven_pk) + ',';
	l_eradv_pk += grdAdv_1.GetGridData(2, g_1_tfn_eradv_ven_pk) + ',';
	txtIndex.text = '2';
	txttfn_eradv_ven_pk.text = l_eradv_pk;	
	dso_merge_adv.Call();
}
//----------------------------------------------
function OnUnProcess()
{
	var i;
	btnNew.SetEnable(true);
	btnSave.SetEnable(false);
	dso_pro_unprocess.Call();
	g_refresh_yn = true ;
	
	
}
//----------------------------------------------
function OnClose()
{
	var l_Array = new Array();
	l_Array[0] = g_refresh_yn ;
	window.returnValue = l_Array;
	this.close();
}
//----------------------------------------------
function OnPreProcess()
{
    btnSave.SetEnable(true);
    btnNew.SetEnable(false);
    btnCancel.SetEnable(false);
	OnProcess_VND();
	//dso_pro_clear_all_yn.Call();
}
//----------------------------------------------
function OnProcess_VND()
{
	var i, j;
	//Divide TYPE_REF
	var v_cust_pk = "", v_type_ref = 1;
	// 
	var v_Chk = "", v_adv_famt = 0, v_adv_amt = 0, v_sub_adv_famt = 0, v_sub_adv_amt = 0;
	var v_ap_famt = 0, v_ap_amt = 0, v_clr_famt = 0, v_clr_amt = 0, v_sum_clr_famt = 0;
	var v_diff_rate = 0, v_sum_clr_amt = 0, v_adv_ccy = "";
	var v_adv_ccy = "", v_adv_rate = 0, v_ap_rate = 0; 
	if(grdAdv.rows > 1)
	{
		v_cust_pk = grdAdv.GetGridData(1, g_vendor_pk);
	}
	//Divide Type Ref
	for(i = 2; i < grdAdv.rows ; i++)
	{
		if(v_cust_pk != grdAdv.GetGridData(i, g_vendor_pk))
		{
			v_type_ref += 1;
			grdAdv.SetGridText(i, g_Type_ref, v_type_ref);
			v_cust_pk = grdAdv.GetGridData(i, g_vendor_pk);
		}
	}
	for(i = 1; i < grdAdv.rows ; i++) // (I) 
	{
		v_Chk = grdAdv.GetGridData(i, g_Chk);
		if(v_Chk == '-1')	// (A)
		{
			v_adv_famt = Number(grdAdv.GetGridData(i, g_TransBal));
			v_adv_amt = Number(grdAdv.GetGridData(i, g_BooksBal));
			if(v_adv_famt > 0) // (B)
			{
				v_adv_ccy = grdAdv.GetGridData(i, g_TransCcy);
				v_adv_rate = Number(grdAdv.GetGridData(i, g_TransRate));
				v_sub_adv_famt = 0; 
				v_sub_adv_amt = 0;
				for(j = 1; j < grdAP.rows ; j++) //(II)
				{
					v_Chk = grdAP.GetGridData(j, g_A_Chk);
					if(v_Chk == '-1') // (C)					
					{
						v_ap_famt = Number(grdAP.GetGridData(j, g_A_TransBalance));
						v_ap_amt = Number(grdAP.GetGridData(j, g_A_BooksBalance));
						if(v_ap_famt > 0) // (D)
						{
							v_ap_rate = Number(grdAP.GetGridData(j, g_A_TransExRate));
							v_sum_clr_famt = Number(grdAP.GetGridData(j, g_A_ClearTransAmt));
							v_sum_clr_amt = Number(grdAP.GetGridData(j, g_A_ClearBooksAmt));
							v_clr_famt = 0; 
							v_clr_amt = 0; 
							v_diff_rate = 0;
							if(v_adv_famt > v_ap_famt )  // (E) 
							{
								v_clr_famt = v_ap_famt;
								v_clr_amt = v_ap_amt;
								if(v_adv_ccy != "VND")
								{
									v_diff_rate = Math.round(v_clr_famt * v_adv_rate) - v_clr_amt;
								}	
								v_sum_clr_famt += v_clr_famt;
								v_sum_clr_amt += v_clr_amt;
								v_sub_adv_famt += v_clr_famt;
								v_sub_adv_amt += Math.round(v_clr_famt * v_adv_rate);
								v_ap_famt -= v_clr_famt;
								v_ap_amt -= v_clr_amt;
								grdAP.SetGridText(j, g_A_clear_famt, v_clr_famt);
								grdAP.SetGridText(j, g_A_clear_amt, v_clr_amt);
								grdAP.SetGridText(j, g_A_ClearTransAmt, v_sum_clr_famt);
								grdAP.SetGridText(j, g_A_ClearBooksAmt, v_sum_clr_amt);
								grdAP.SetGridText(j, g_A_TransBalance, v_ap_famt);
								grdAP.SetGridText(j, g_A_BooksBalance, v_ap_amt);
								v_adv_famt -= v_clr_famt;
								v_adv_amt -= Math.round(v_clr_famt * v_adv_rate);
								if(v_diff_rate != 0)
								{
									grdAP.SetGridText(j, g_A_exrate_diff, v_diff_rate);
								}
							} // (E)
							else if (v_adv_famt == v_ap_famt) // (F)
							{
								v_clr_famt = v_ap_famt;
								v_clr_amt = v_ap_amt;
								if(v_adv_ccy != "VND")
								{
									v_diff_rate = v_adv_amt - v_clr_amt;
								}																
								v_sum_clr_famt += v_clr_famt;
								v_sum_clr_amt += v_clr_amt;
								v_sub_adv_famt += v_clr_famt;
								v_sub_adv_amt += v_adv_amt ;
								v_ap_famt -= v_clr_famt;
								v_ap_amt -= v_clr_amt;
								grdAP.SetGridText(j, g_A_clear_famt, v_clr_famt);
								grdAP.SetGridText(j, g_A_clear_amt, v_clr_amt);
								grdAP.SetGridText(j, g_A_ClearTransAmt, v_sum_clr_famt);
								grdAP.SetGridText(j, g_A_ClearBooksAmt, v_sum_clr_amt);
								grdAP.SetGridText(j, g_A_TransBalance, v_ap_famt);
								grdAP.SetGridText(j, g_A_BooksBalance, v_ap_amt);
								if(v_diff_rate != 0)
								{
									grdAP.SetGridText(j, g_A_exrate_diff, v_diff_rate);
								}								
								v_adv_famt = 0;
								v_adv_amt = 0 ;
							} 	// (F) 
							else // (G)
							{
								v_clr_famt = v_adv_famt ;
								v_clr_amt = Math.round(v_clr_famt * v_ap_rate);
								if(v_adv_ccy != "VND")
								{
									v_diff_rate = v_adv_amt - v_clr_amt;
								}
								v_sum_clr_famt += v_clr_famt;
								v_sum_clr_amt += v_clr_amt;
								v_sub_adv_famt += v_clr_famt;
								v_sub_adv_amt += v_adv_amt ;
								v_ap_famt -= v_clr_famt;
								v_ap_amt -= v_clr_amt;
								grdAP.SetGridText(j, g_A_clear_famt, v_clr_famt);
								grdAP.SetGridText(j, g_A_clear_amt, v_clr_amt);
								grdAP.SetGridText(j, g_A_ClearTransAmt, v_sum_clr_famt);
								grdAP.SetGridText(j, g_A_ClearBooksAmt, v_sum_clr_amt);
								grdAP.SetGridText(j, g_A_TransBalance, v_ap_famt);
								grdAP.SetGridText(j, g_A_BooksBalance, v_ap_amt);
								v_adv_famt = 0;
								v_adv_amt = 0 ;
								if(v_diff_rate != 0)
								{
									grdAP.SetGridText(j, g_A_exrate_diff, v_diff_rate);
								}																
							} // (G)
						}  // (D)
					} // (C)
				}  // (II)
				v_clr_famt = grdAdv.GetGridData(i, g_ClearTransAmt);
				v_clr_amt = grdAdv.GetGridData(i, g_ClearBooksAmt);
				grdAdv.SetGridText(i, g_sub_tr_famt, v_sub_adv_famt);
				grdAdv.SetGridText(i, g_sub_tr_amt, v_sub_adv_amt);
				grdAdv.SetGridText(i, g_ClearTransAmt, v_clr_famt + v_sub_adv_famt);
				grdAdv.SetGridText(i, g_ClearBooksAmt, v_clr_amt + v_sub_adv_amt);
				grdAdv.SetGridText(i, g_TransBal, v_adv_famt);
				grdAdv.SetGridText(i, g_BooksBal, v_adv_amt);
			} // (B)	
		}	// (A)
	} //(I)
}
</script>
<body style="margin:0; padding:0;">
<!----------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_advance_list" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,18,19,25,29" function="ac_sel_eppay_ap" procedure="ac_upd_eppay_ap" >
                <input bind="grdAdv">
                    <input bind="lstCompany" />
                    <input bind="dtPayFr" />
                    <input bind="dtPayTo" />
					<input bind="txtSeq" />
					<input bind="txtChargerPK" />					
					<input bind="txtPaymentNo" />														
					<input bind="txttac_crda_PK" />
					<input bind="txtAPTr_Type" />
                </input>
                <output bind="grdAdv" />
            </dso>
        </xml>
    </gw:data>
	
    <gw:data id="dso_advance_list_1" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="1,10,11" function="ac_sel_eppay_ap_1" procedure="ac_upd_eppay_ap_1" >
                <input bind="grdAdv_1">                    
                    <input bind="dtPayFr" />
                    <input bind="dtPayTo" />
					<input bind="txtSeq" />					
                </input>
                <output bind="grdAdv_1" />
            </dso>
        </xml>
    </gw:data>
	
    <gw:data id="dso_merge_adv" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="ac_pro_eppay_ap"> 
                <input> 
                     <input bind="txttfn_eradv_ven_pk"/>
                     <input bind="txtIndex"/>
                </input>
                <output>
                     <output bind="txtRtnMsg"/>
               </output> 				
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dso_ap_list" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="2,7,10,11,12,13,16,17,19,23,28,29" function="ac_sel_ap_clear_adv" procedure="ac_upd_ap_clear_adv" >
                <input bind="grdAP">
                    <input bind="txttac_crda_PK" />
					<input bind="lstCompany" />
					<input bind="txtAPTR_Type" />
					<input bind="txtTrStatus" />
                </input>
                <output bind="grdAP" />
            </dso>
        </xml>
    </gw:data>
    
	<gw:data id="dso_pro_rate_revexcess" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="ac_pro_eppay_ap_1"> 
                <input> 
                     <input bind="txttac_crda_PK" />
                     <input bind="txtExRate_DRCR" />
					 <input bind="txtRcvExcessLack_DRCR" />
                </input>
                <output>
                     <output bind="txtRtnMsg"/>
               </output> 				
            </dso> 
        </xml> 
    </gw:data>	

		<gw:data id="dso_pro_unprocess" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="ac_pro_eppay_2"> 
                <input> 
                     <input bind="txttac_crda_PK" />
                </input>
                <output>
                     <output bind="txtRtnMsg"/>
               </output> 				
            </dso> 
        </xml> 
    </gw:data>	

    <gw:data id="dso_sel_booksrate" onreceive="onSetBookRate()"> 
        <xml> 
            <dso type="process" procedure="AC_PRO_GET_BOOKCCY">
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="txtTransDT"/>
                     <input bind="lstBookCcy"/>
                </input>  
                <output>
                     <output bind="txtBookRate"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	

	<gw:data id="dso_pro_clear_all_yn" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="ACNT.sp_get_tac_crda_clearall_yn"> 
                <input> 
                     <input bind="txttac_crda_PK" />
                </input>
                <output>
                     <output bind="txtRtnMsg"/>
               </output> 				
            </dso> 
        </xml> 
    </gw:data>	
	
<!----------------------------------------------------------------------------------------------->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%">
	<tr style="height:0%" >    
		<td width="8%"></td>
		<td width="10%"></td>
		<td width="2%"></td>
		<td width="10%"></td>
		<td width="8%"></td>
		<td width="5%"></td>
		<td width="9%"></td>
		<td width="5%"></td>
		<td width="3%"></td>
		<td width="5%"></td>
		<td width="8%"></td>
		<td width="7%"></td>
		<td width="8%"></td>
		<td width="7%"></td>
		<td width="5%"></td>
	</tr>
    <tr style="height:4%; " >
        <td align="right">Company</td>
		<td align="left" colspan="3" ><gw:list id="lstCompany" styles="width:100%" /></td>
		<td align="right"><a title="Click here to select Vendor" onclick="OnPopup('Vendor')" href="#tips">Vendor</a></td>
		<td align="left"><gw:textbox id="txtChargerID" styles="width:100%" /></td>
		<td align="left" colspan="2" ><gw:textbox id="txtChargerNM" styles="width:100%" /></td>
		<td align="right"><gw:imgBtn id="btnSearch" text="Search" alt="Search" img="search" onclick="OnSearch('grdAdv')" /></td>
		<td align="right"></td>
		<td align="left"><gw:checkbox id="chkCheckAll" styles="display:none;" /></td>
		<td>Clear All<gw:checkbox id="idClearAll" value="F" /></td>
		<td></td>
		<td></td>		
		<td><gw:icon id="idbtnClose" text="Close" alt="Close" onclick="OnClose()" /></td>		
    </tr>
	<tr style="height: 4%;" >
		<td align="right">Adv. Req. Date</td>
		<td align="left"><gw:datebox id="dtReqFr" lang="1" /></td>
		<td>~</td>
		<td align="left"><gw:datebox id="dtReqTo" lang="1" /></td>
		<td align="right">Seq</td>
		<td align="left"><gw:textbox id="txtSeq" styles="width:100%" onenterkey="OnSearch()" /></td>
		<td align="right">Department</td>		
		<td align="left" colspan="3" ><gw:list id="lstDept" styles="width:100%" /></td>
		<td align="right">Trans Amount</td>
		<td align="left"><gw:textbox id="txtTransAmt" styles="width:100%" type="number" format="###,###,###.##R" /></td>
		<td align="right">Booking Ccy</td>
		<td align="left"><gw:list id="lstBookCcy" styles="width:100%" /></td>
		<td align="left"><gw:textbox id="txtBookRate" styles="width:100%" /></td>		
	</tr>
	<tr style="height: 4%;" >
		<td align="right">Payment. Date</td>
		<td align="left"><gw:datebox id="dtPayFr" lang="1" /></td>
		<td>~</td>
		<td align="left"><gw:datebox id="dtPayTo" lang="1" /></td>
		<td align="right">Payment. No</td>
		<td align="left"><gw:textbox id="txtPaymentNo" styles="width:100%" onenterkey="OnSearch()" /></td>
		<td align="right"><a title="Click here to select Employee" onclick="OnPopup('Employee')" href="#tips">Employee&nbsp;</a></td>
		<td align="left"><gw:textbox id="txtEmpID" styles="width:100%" /></td>
		<td align="left" colspan="2" ><gw:textbox id="txtEmpNM" styles="width:100%" /></td>
		<td align="right">Books Amount</td>
		<td align="left"><gw:textbox id="txtBkAmt" styles="width:100%" type="number" format="###,###,###R" /></td>
		<td align="right">Trans Ccy</td>
		<td align="left"><gw:list id="lstTransCcy" styles="width:100%" /></td>
		<td align="left"><gw:textbox id="txtTrRate" styles="width:100%" /></td>		
	</tr>
	<tr style="height:86%;" >
		<td colspan="15" >
			<gw:tab id="idTab" onpageactivate="OnSearchTab()" >
			<table name="Process" border="0" style="height:100%; width:100%;" cellpadding="0" cellspacing="0" >
					<tr style="height:50%;">
						<td colspan="3">
							<table border="0" style="height:100%; width:100%;" cellpadding="0" cellspacing="0" >
								<tr style="height:100%;">
									<td>
										<gw:grid 
											id="grdAdv"  
											header  ="_tfn_eppaytr_pk||No.|_Adv. Req. No.|_Adv. Req. Date|_Due Date|Seq|PV No.|PV Date|Vendor name|_tac_abacctcode_pk|Acc. code|Acc. Name|Trans Ccy|Trans Rate|Books Rate|Adv Trans Amt|Adv Books Amt|_Clear Trans Amt|_Clear Books Amt|Trans Balance|Books Balance|_Clear All|Description|Local Desc|_tac_crda_pk|Clear Trans Amt|Clear Books Amt|_Cust_PK|Type Ref"
											format  ="0|3|0|0|4|4|0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0"
											aligns  ="0|1|0|1|1|1|0|1|1|0|0|0|0|1|3|3|3|3|3|3|3|3|1|0|0|0|3|3|0|1"
											defaults="|||||||||||||||||||||||||||||"
											editcol ="0|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|0|0|1|0|0|0|0|0|0|0"
											widths  ="0|500|600|1500|1500|1200|1000|1200|1200|2000|0|1400|2500|1200|1200|1200|1500|1500|1500|1500|1500|1500|1200|2000|2000|0|0|0|0|600"
											styles  ="width:100%; height:100%"
											sorting ="F"
											acceptNullDate  = "T"
											onafteredit="EditAdvance()"	
											oncellclick="OnClickAdvance()"
										/>		
									</td>		
							</table>
						</td>
					</tr>
					<tr style="height:4%;">
						<td colspan="1" style="width:80%;" align="right"><gw:icon id="btnCancel" alt="UnProcess" text="UnClear" onclick="OnUnProcess()" /></td>
						<td style="width:10%;" align="right"><gw:icon id="btnNew" alt="Process" text="Clear" onclick="OnPreProcess()" /></td>
						<td style="width:10%;" align="right"><gw:imgBtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" /></td>	
					</tr>			
					<tr style="height:40%;">
						<td colspan="15">
							<table border="1" style="height:100%; width:100%;" cellpadding="0" cellspacing="0" >
								<tr style="height:100%;">
									<td style="width:100%;">
										<gw:grid 
											id="grdAP"  
											header  ="|No|_tac_abacctcode_pk|Acc. Code|Acc. Name|Acc.Code CR|Acc.Name CR|Ccy|Trans Rate|Books Rate|TransAmount|Books Amount|Clear Trans. Amt|Clear Books. Amt.|Trans Balance|Books Balance|_tac_crda_pk|_tac_eppay_ap_pk|_otherincome_famt|_otherincome_amt|_clear_famt|_clear_amt|_CCY|_tac_abplcenter_pk|PL Code|_adv_famt|_adv_famt|_AP_YN|Type Ref|_ACC_PK_CR"
											format  ="3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
											aligns  ="0|1|0|1|0|1|2|0|1|3|3|3|3|3|3|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
											defaults="|||||||||||||||||||||||||||||"
											editcol ="1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
											widths  ="500|500|0|1200|2500|1600|2000|700|1400|1400|1300|1400|1500|1500|1400|1400|0|0|0|0|0|0|0|0|1500|800|0|0|0|0"
											styles  ="width:100%; height:100%"
											sorting ="F"
											acceptNullDate  = "T"
											oncellclick="OnClickAP()"	
											onafteredit=""
											oncelldblclick="OnDblClickAP()"
										/>		
									</td>
								</tr>	
							</table>
						</td>
					</tr>
					<tr style="height:6%;">
						<td colspan="15">
							<table border="1" style="height:100%; width:100%;" cellpadding="0" cellspacing="0" >
								<tr style="height:100%;">
									<td style="width:20%;">Total Book Advance</td>
									<td style="width:25%;"><gw:textbox id="txtTotBkAmt" type="number" format="###,###,###,###.##R" /></td>
									<td style="width:20%;">Total Book AP</td>
									<td style="width:25%;"><gw:textbox id="txtBalBkAmt" type="number" format="###,###,###,###.##R" /></td>					
								</tr>	
							</table>
						</td>
					</tr>	
				</table>				
			</table>
			<table name="Installment Entry" border="0" style="height:100%; width:100%;" cellpadding="0" cellspacing="0" >
				<tr style="height:5%">
					<td style="width:80%;"></td>
					<td style="width:5%" ><gw:imgBtn id="btnSearch_1" alt="Search" img="search" onclick="OnSearch('grdAdv_1')" /></td>
					<td style="width:5%" ><gw:imgBtn id="btnAdd" alt="Add New" img="new" onclick="OnDivide()" /></td>					
					<td style="width:5%" ><gw:icon id="btnDivide" text="Divide" img="in" alt="Divide" onclick="OnUpdate()" /></td>
					<td style="width:5%" ><gw:icon id="btnMerge" text="Merge" img="in" alt="Merge" onclick="OnMerge()" /></td>
				</tr>
				<tr style="height:95%" >
					<td colspan="5" >
						<gw:grid 
							id="grdAdv_1"  
							header  ="|_tfn_eradv_ven_pk|_tco_buspartner_pk|Seq|Voucher no|Partner Id|Partner_lname|Ccy|Rate|Bk rate|Trans Amt|Book Amt|_tac_abacctcode_pk|Acc. code|Acc. name"
							format  ="3|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
							aligns  ="1|0|0|0|0|0|0|1|3|3|3|3|0|0|0"
							defaults="||||||||||||||"
							editcol ="0|0|0|0|0|0|0|0|0|0|1|1|0|0|0"
							widths  ="500|0|0|700|1500|1500|2000|700|1200|0|1400|1400|0|1000|2000"
							styles  ="width:100%; height:100%"
							sorting ="T"
							acceptNullDate  = "T"
							onafteredit="OnEditAdv_1()"
						/>								
					</td>
				</tr>
			</table>
			</gw:tab>
		</td>
	</tr>
<!---------------------------------------------------------------------------------------------------->
<gw:textbox id="txtChargerPK" style="display:none;" />
<gw:textbox id="txtEmpPK" style="display:none;" />
<gw:textbox id="txttac_crda_PK" style="display:none;" />
<gw:textbox id="txtrow" style="display:none;" />
<gw:textbox id="txt_row" style="display:none;" />
<gw:textbox id="txtTransDT" style="display:none;" />
<gw:textbox id="txtTransRate" style="display:none;" />
<gw:textbox id="txtTransCcy" style="display:none;" />
<gw:datebox id="dtToday" lang="1" style="display:none;" />
<gw:textbox id="txtAPTR_Type" text="" style="display:none;" />
<gw:textbox id="txtTrStatus" text="" style="display:none;" />
<gw:textbox id="txtExRate_DRCR" text="" style="display:none;" />
<gw:textbox id="txtRcvExcessLack_DRCR" text="" style="display:none;" />
<gw:textbox id="txttfn_eradv_ven_pk" text="" style="display:none;" />
<gw:textbox id="txtIndex" text="" style="display:none;" />
<gw:textbox id="txtRtnMsg" text="" style="display:none;" />
<gw:grid 
	id="grdTemp"  
	header  ="TAC_CRDA_PK|TYPE_REF|TAC_ABACCTCODE_PK|TAC_ABACCTCODE_PK_CR|TR_AMT"
	format  ="0|0|0|0|0"
	aligns  ="1|0|0|0|0"
	defaults="||||"
	editcol ="0|0|0|0|0"
	widths  ="500|0|0|700|1000"
	styles  ="width:100%; height:100%; display:none;"
/>								
</body>
</html>