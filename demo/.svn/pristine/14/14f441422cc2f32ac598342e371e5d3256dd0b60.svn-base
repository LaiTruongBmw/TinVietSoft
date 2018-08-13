<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>Clear Advance Popup</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var _Book_CCY = "VND";
var C_PK = 0,
    C_MASTER_PK = 1,
    C_ACC_PK = 2,
    C_NO = 3,
    C_ACC_CD = 4,
    C_ACC_NM = 5,
    C_CCY = 6,
    C_EX_RATE = 7,
    C_AMT_T = 8,
    C_AMT_B = 9,
    C_TAX_RATE = 10,
    C_VAT_AMT_T = 11,
    C_VAT_AMT_B = 12,
    C_TOTAL_AMT_T = 13,
    C_TOTAL_AMT_B = 14,
    C_DESCRIPTION = 15,
    C_LDESCRIPTION = 16,
    C_PLUNIT = 17,
    C_CUSTOMER = 18,
    C_INVOICE_NO = 19,
    C_INVOICE_DATE = 20,
    C_DUE_DATE = 21,
    C_SERIAL_NO = 22,
    C_NET_AMT = 23,
    C_PRODUCT_ITEM = 24,
    C_PLUNIT_PK = 25,
    C_CUSTOMER_PK = 26,
    C_DRCR_TYPE = 27,
    C_BOOK_RATE = 28,
    C_TECPS_EXPENSE_REQ_PK = 29
    ;
var D_PK = 0,
    D_MASTER_PK = 1,
    D_ACC_PK = 2,
    D_NO = 3,
    D_ACC_CD = 4,
    D_ACC_NM = 5,
    D_CCY = 6,
    D_EX_RATE = 7,
    D_AMT_T = 8,
    D_AMT_B = 9,
    D_TAX_RATE = 10,
    D_VAT_AMT_T = 11,
    D_VAT_AMT_B = 12,
    D_TOTAL_AMT_T = 13,
    D_TOTAL_AMT_B = 14,
    D_DESCRIPTION = 15,
    D_LDESCRIPTION = 16,
    D_PLUNIT = 17,
    D_CUSTOMER = 18,
    D_INVOICE_NO = 19,
    D_INVOICE_DATE = 20,
    D_DUE_DATE = 21,
    D_SERIAL_NO = 22,
    D_NET_AMT = 23,
    D_PRODUCT_ITEM = 24,
    D_PLUNIT_PK = 25,
    D_CUSTOMER_PK = 26,
    D_DRCR_TYPE = 27,
    D_BOOK_RATE = 28,
    D_TECPS_EXPENSE_REQ_PK = 29
    ; 
function BodyInit()
{
	System.Translate(document);
	BindingDataList();	
	grdDebit.GetGridControl().FrozenCols = D_EX_RATE;
	grdCredit.GetGridControl().FrozenCols = C_EX_RATE;
	BA.style.display='none';
	TBA.style.display='none';
	RBA.style.display='none';
    txtExRate1.SetDataText('1');
	txtExRate2.SetDataText("1");
	var _TECPS_EXPENSE_PAY_PK =  "<%=request.QueryString("TECPS_EXPENSE_PAY_PK")%>";
	txtMasterPK.SetDataText(_TECPS_EXPENSE_PAY_PK);
	
	if(txtMasterPK.text == '')
	{
			dso_upd_master.StatusInsert();	
			var _TECPS_EXPENSE_REQ_PK =  "<%=request.QueryString("TECPS_EXPENSE_REQ_PK")%>";
			txtTECPS_EXPENSE_REQ_PK.SetDataText(_TECPS_EXPENSE_REQ_PK);
			var _project_pk =  "<%=request.QueryString("p_project_pk")%>";
			txtProject_Pk.SetDataText(_project_pk);
			var _project_cd =  "<%=request.QueryString("p_project_cd")%>";
			txtProject_Cd.SetDataText(_project_cd);
			var _project_nm =  "<%=request.QueryString("p_project_nm")%>";
			txtProject_Nm.SetDataText(_project_nm);
			dso_get_exrate_list.Call();
	}
	else
	{
			dso_upd_master.Call('SELECT');
	}
	
}
//==============================================================================
function BindingDataList()
{
	var _Company = "<%=Session("COMPANY_PK")%>"; 
	txtCompany_Pk.SetDataText(_Company);
	data = "<%=ESysLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
    lstCurrency.SetDataText(data); 
	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0027') FROM DUAL")%>"; 
	lstReqType.SetDataText(data);
	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0043') FROM DUAL")%>"; 
	lstPaymentMethod.SetDataText(data); 
	<%=ESysLib.SetGridColumnComboFormat("grdDebit", 6,"SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
    <%=ESysLib.SetGridColumnComboFormat("grdCredit", 6,"SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
	<%=ESysLib.SetGridColumnComboFormat("grdDebit",10,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0017' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
	<%=ESysLib.SetGridColumnComboFormat("grdCredit",10,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0017' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
	
	_Book_CCY = "<%=ESysLib.SetDataSQL("select b.code, b.char_1  from tac_commcode_master a, tac_commcode_detail b where a.pk = b.tac_commcode_master_pk and a.id = 'ACBG0040' and b.def_yn = 'Y' and a.del_if = 0 and b.del_if = 0")%>";
    
	var a = _Book_CCY.split("|");
	if(a.length <=0) alert("Please setup book currency in common code.");
    _Book_CCY = a[0];
}
//==============================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'project':
		    var path = System.RootURL + '/form/61/05/61050020_popup.aspx';
		    var obj = System.OpenModal( path ,750 , 500 , 'resizable:yes;status:yes');
		    if ( obj != null )
		    {
			    txtProject_Pk.text = obj[0];
                txtProject_Cd.text = obj[1];
                txtProject_Nm.text = obj[2];
		    }
	    break;
	    case 'Customer':
            var path = System.RootURL + '/form/61/05/61050020_popup2.aspx';
            var obj = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
            if ( obj != null )
            {
				txtCustomer_Nm.SetDataText(obj[2]);//customer name
				txtCustomer_Pk.SetDataText(obj[0]);//customer name
				txtCustomer_Cd.SetDataText(obj[1]); 
            }
        break;   
        case 'currency':        
             var path = System.RootURL + "/form/61/06/61060010_popup.aspx?code=ACAB0110";
	         var obj = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (obj != null )
             {
				 lstCurrency.SetDataText(obj[1]);
			 }
        break; 
		case 'Budget':
			var fpath = System.RootURL + "/form/61/06/61060010_Budget_popup.aspx";
			var object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
			if(object != null)
			{
				txtBudget_Pk.text =  object[0];
				txtBudget_Cd.text =  object[1];
				txtBudget_Nm.text =  object[2];
			}
	    break;
		case 'Contract':
				var path = System.RootURL + '/form/61/06/61060060_AccSubCont_popup.aspx?TAC_ABPL_pk=' + txtTAC_ABPL_pk.text;
				var obj = System.OpenModal( path ,600 , 600 , 'resizable:yes;status:yes');
				if ( obj != null )
				{
					txtContract.SetDataText(obj[1]);
					txtContract_Pk.SetDataText(obj[0]);
				}
		break;
		case 'RequestType':
			var path = System.RootURL + '/form/61/06/61060010_popup.aspx?code=TPS0027';
			var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 lstReqType.SetDataText(object[1]);
			 }
     	break;
		case 'Edit_Dr':
			if(event.col == D_ACC_CD || event.col == D_ACC_NM)
			{
				var fpath   = System.RootURL + "/form/61/05/61050080_popup_Transaction.aspx?dsqlid=pm_sel_62060060_acc" + "&p_type=";
				var aValue = System.OpenModal(  fpath , 750 , 550 , 'resizable:yes;status:yes');
				if (aValue != null)
				{
					var tmp = aValue[0];
					grdDebit.SetGridText(grdDebit.row, D_ACC_PK, tmp[1]);
					grdDebit.SetGridText(grdDebit.row, D_ACC_CD, tmp[2]);
					grdDebit.SetGridText(grdDebit.row, D_ACC_NM, tmp[3]);
				}
			}
		break;
		case 'Edit_Cr':
			if(event.col == C_ACC_CD || event.col == C_ACC_NM)
			{
				var fpath   = System.RootURL + "/form/61/05/61050080_popup_Transaction.aspx?dsqlid=pm_sel_62060060_acc" + "&p_type=";
				var aValue = System.OpenModal(  fpath , 750 , 550 , 'resizable:yes;status:yes');
				if (aValue != null)
				{
					var tmp = aValue[0];
					grdCredit.SetGridText(grdCredit.row, C_ACC_PK, tmp[1]);
					grdCredit.SetGridText(grdCredit.row, C_ACC_CD, tmp[2]);
					grdCredit.SetGridText(grdCredit.row, C_ACC_NM, tmp[3]);
				}
			}
		break;
		case 'PL_Unit_Dr':
			if(event.col == D_PLUNIT)
			{
				var fpath = System.RootURL + "/form/61/06/61060050_popup.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + txtCompany_Pk.GetData() + '&dsqlid=pm_sel_62060060_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
				var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
				if ( object != null ) 
				{
					if (object[0] != 0)
					{
						grdDebit.SetGridText(grdDebit.row, D_PLUNIT_PK, object[2]);
						grdDebit.SetGridText(grdDebit.row, D_PLUNIT, object[0] + ' - ' + object[1]);
					}
				}
			}
		break;
		case 'PL_Unit_Cr':
			if(event.col == C_PLUNIT)
			{
				var fpath = System.RootURL + "/form/61/06/61060050_popup.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + txtCompany_Pk.GetData() + '&dsqlid=pm_sel_62060060_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
				var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
				if ( object != null ) 
				{
					if (object[0] != 0)
					{
						grdCredit.SetGridText(grdCredit.row, C_PLUNIT_PK, object[2]);
						grdCredit.SetGridText(grdCredit.row, C_PLUNIT, object[0] + ' - ' + object[1]);
					}
				}
			}
		break;
		case 'Customer_Dr':
			if(event.col== D_CUSTOMER)
			{
				var path = System.RootURL + '/form/61/05/61050020_popup2.aspx';
				var obj = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
				if ( obj != null )
				{
					grdDebit.SetGridText(grdDebit.row, D_CUSTOMER_PK, obj[0]);
					grdDebit.SetGridText(grdDebit.row, D_CUSTOMER, obj[1]+ ' - '+ obj[2]);
				}
			}
        break;   
		case 'Customer_Cr':
			if(event.col== C_CUSTOMER)
			{
				var path = System.RootURL + '/form/61/05/61050020_popup2.aspx';
				var obj = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
				if ( obj != null )
				{
					grdCredit.SetGridText(grdCredit.row, C_CUSTOMER_PK, obj[0]);
					grdCredit.SetGridText(grdCredit.row, C_CUSTOMER, obj[1]+ ' - '+ obj[2]);
				}
			}
        break;   
		case 'Employee':
			var fpath = System.RootURL + "/form/61/05/61050080_popup3.aspx";
			var aValue = System.OpenModal( fpath , 900 ,600, 'resizable:yes;status:yes'); 
			if ((aValue != null)&&(aValue[0]!=""))
			{
				txtEmployee_Pk.text = aValue[0];
				txtEmployee_Cd.text = aValue[1];
				txtEmployee_Nm.text = aValue[2];
			}
		break;
		case 'OrderWork':
			var fpath = System.RootURL + "/form/61/05/61050020_Order_W_Div?p_project_pk=" + txtProject_Pk.text;
			var aValue = System.OpenModal( fpath , 900 ,600, 'resizable:yes;status:yes'); 
			if ((aValue != null)&&(aValue[0]!=""))
			{
				txtOrderW_Pk.text = aValue[0];
				txtOrderW_Cd.text = aValue[1];
				txtOrderW_Nm.text = aValue[2];
			}
		break;
		case 'Account':
			var fpath   = System.RootURL + "/form/61/06/61060060_popup2.aspx?contract_type=BUY&company=" + txtCompany_Pk.text;
        	var object  = System.OpenModal(fpath , 900 , 600 , 'resizable:yes;status:yes'); 
			if ( object != null )  
			{
				if (object[0] != 0)
				{
					txtDepositAccNo.text = object[1];//code
					txtDepositAccNo_Pk.text = object[2] ;//pk	
				}
			} 
		break;
		case 'PMethod':
			var path = System.RootURL + '/form/61/06/61060010_popup.aspx?code=TPS0043';
			var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 lstPaymentMethod.SetDataText(object[1]);
			 }
		break;
    }
    
}
var flag='';
//==============================================================================
function OnSave(obj)
{
	switch (obj)
	{
		case 'Master':
		    if (txtCustomer_Pk.GetData()=='')
		    {
				alert('You must select customer');
				return false;
		    }

			if (txtEmployee_Pk.GetData()=='')
		    {
				alert('You must select employee');
				return false;
		    } 
			if(txtProject_Pk.text != '')
			{
				flag='save';
				    if(txtRequest_No.text != '')
                    { 
                         if(grdDebit.rows>1)
                           { 
                                var _sum_ftotal = 0;
                                var _sum_total = 0;
                                for(i=1;i<grdDebit.rows;i++)
                                {
                                    _sum_ftotal += Number(grdDebit.GetGridData(i, D_TOTAL_AMT_T));
                                    _sum_total += Number(grdDebit.GetGridData(i, D_TOTAL_AMT_B));
                                } 
                               txtFTotal.text = _sum_ftotal;
                                txtTotal.text = _sum_total; 
                            }  
					    dso_upd_master.Call();
                    }
                    else
                    {
                        alert('Please input Request No !!');
                    }
			}
			else
			{
				alert('Please select Project !!');	
			}
		break;	
		case 'Debit':
			if(txtMasterPK.text != '')
			{
				if(!OnCheckSum())
				{
					dso_dr.Call();
				}
			}
			else
			{
				alert('Please save master first !!');	
			}
		break;
		case 'Credit':
			if(txtMasterPK.text != '')
			{
				if(!OnCheckSum())
				{
					dso_cr.Call();
				}
			}
			else
			{
				alert('Please save master first !!');	
			}
		break;
	}
	
}
//==============================================================================
function OnNew(obj)
{
	switch (obj)
	{
		case 'Master':
			dso_upd_master.StatusInsert();	
			btnNew.SetEnable(true);
			btnSave.SetEnable(true);
			btnDelete.SetEnable(true);
			
			btnNew_dr.SetEnable(true);	
			btnSave_dr.SetEnable(true);	
			btnDelete_dr.SetEnable(true);	
			
			btnNew_cr.SetEnable(true);	
			btnSave_cr.SetEnable(true);	
			btnDelete_cr.SetEnable(true);	
			
			btnCancel.SetEnable(false);	
			grdDebit.GridRefresh();
			grdCredit.GridRefresh();
		break;
		case 'Debit':
			if(txtMasterPK.text != '')
			{
				var fpath   = System.RootURL + "/form/61/05/61050080_popup_Transaction.aspx?dsqlid=pm_sel_61060060_acc" + "&p_type=";
				var aValue = System.OpenModal(  fpath , 750 , 550 , 'resizable:yes;status:yes');
				if (aValue != null)
				{
					var tmp = aValue[0];
					grdDebit.AddRow();
						grdDebit.SetGridText(grdDebit.rows-1, D_NO, 1);
					grdDebit.SetGridText(grdDebit.rows-1, D_MASTER_PK, txtMasterPK.text);
					
					grdDebit.SetGridText(grdDebit.rows-1, D_DRCR_TYPE, 'D');
					grdDebit.SetGridText(grdDebit.rows-1, D_CUSTOMER_PK, txtCustomer_Pk.text);
					grdDebit.SetGridText(grdDebit.rows-1, D_DESCRIPTION, txtDescription.text);
					grdDebit.SetGridText(grdDebit.rows-1, D_LDESCRIPTION, txtLocal_Description.text);
                    grdDebit.SetGridText(grdDebit.rows-1, D_TECPS_EXPENSE_REQ_PK, txtTECPS_EXPENSE_REQ_PK.text);
                    
					grdDebit.SetGridText(grdDebit.rows-1, D_ACC_PK, tmp[1]);
					grdDebit.SetGridText(grdDebit.rows-1, D_ACC_CD, tmp[2]);
					grdDebit.SetGridText(grdDebit.rows-1, D_ACC_NM, tmp[3]);
					
					grdDebit.SetGridText(grdDebit.rows-1, D_PLUNIT_PK , txtPL_Pk.text);
					grdDebit.SetGridText(grdDebit.rows-1, D_PLUNIT, txtPL_Cd.text);
					if (grdDebit.rows > 2)
					{
						var ls_curr = grdDebit.GetGridData(grdDebit.rows - 2, D_CCY);
						var ls_rate = grdDebit.GetGridData(grdDebit.rows - 2, D_EX_RATE);
						grdDebit.SetGridText( grdDebit.rows - 1, D_CCY, ls_curr);       //Rate
						grdDebit.SetGridText( grdDebit.rows - 1, D_EX_RATE, ls_rate);       //Rate
					}
					else
					{
						grdDebit.SetGridText( grdDebit.rows - 1, D_EX_RATE, '1');           //Rate
						grdDebit.SetGridText(grdDebit.rows-1, D_CCY, lstCurrency.value);
					}    
					grdDebit.SetGridText( grdDebit.rows - 1, D_BOOK_RATE, GetBookExRate(_Book_CCY));
				}
			}
			else
			{
				alert('Please save master first !!');	
			}
		break;
		case 'Credit':
			if(txtMasterPK.text != '')
			{
				var fpath   = System.RootURL + "/form/61/05/61050080_popup_Transaction.aspx?dsqlid=pm_sel_61060060_acc" + "&p_type=";
				var aValue = System.OpenModal(  fpath , 750 , 550 , 'resizable:yes;status:yes');
				if (aValue != null)
				{
					var tmp = aValue[0];
					var Sum_Amt_Tr = 0;
					var Sum_Amt_Bk = 0;
					grdCredit.AddRow();
						grdCredit.SetGridText(grdCredit.rows-1, C_NO, 1);
					grdCredit.SetGridText(grdCredit.rows-1, C_MASTER_PK, txtMasterPK.text);
					
					grdCredit.SetGridText(grdCredit.rows-1, C_CUSTOMER_PK, txtCustomer_Pk.text);
					grdCredit.SetGridText(grdCredit.rows-1, C_DESCRIPTION, txtDescription.text);
					grdCredit.SetGridText(grdCredit.rows-1, C_LDESCRIPTION, txtLocal_Description.text);
                    grdCredit.SetGridText(grdCredit.rows-1, C_TECPS_EXPENSE_REQ_PK, txtTECPS_EXPENSE_REQ_PK.text);
					grdCredit.SetGridText(grdCredit.rows-1, C_DRCR_TYPE, 'C');
					grdCredit.SetGridText(grdCredit.rows-1, C_ACC_PK, tmp[1]);
					grdCredit.SetGridText(grdCredit.rows-1, C_ACC_CD, tmp[2]);
					grdCredit.SetGridText(grdCredit.rows-1, C_ACC_NM, tmp[3]);
					
					grdCredit.SetGridText(grdCredit.rows-1, C_PLUNIT_PK , txtPL_Pk.text);
					grdCredit.SetGridText(grdCredit.rows-1, C_PLUNIT, txtPL_Cd.text);
					for(var i=1;i<grdDebit.rows;i++)
					{
						Sum_Amt_Tr += Number(grdDebit.GetGridData(i,D_TOTAL_AMT_T));
						Sum_Amt_Bk += Number(grdDebit.GetGridData(i,D_TOTAL_AMT_B)); 	
					}
					grdCredit.SetGridText(grdCredit.rows-1, C_AMT_T, Sum_Amt_Tr);
					grdCredit.SetGridText(grdCredit.rows-1, C_AMT_B, Sum_Amt_Bk);
                    grdCredit.SetGridText(grdCredit.rows-1, C_TOTAL_AMT_T, Sum_Amt_Tr);
					grdCredit.SetGridText(grdCredit.rows-1, C_TOTAL_AMT_B, Sum_Amt_Bk);
					if (grdCredit.rows > 2)
					{
						var ls_curr = grdCredit.GetGridData(grdCredit.rows - 2, C_CCY);
						var ls_rate = grdCredit.GetGridData(grdCredit.rows - 2, C_EX_RATE);
						grdCredit.SetGridText( grdCredit.rows - 1, C_CCY, ls_curr);       //Rate
						grdCredit.SetGridText( grdCredit.rows - 1, C_EX_RATE, ls_rate);       //Rate
					}
					else
					{
						grdCredit.SetGridText( grdCredit.rows - 1, C_EX_RATE, '1');           //Rate
						grdCredit.SetGridText(grdCredit.rows-1, C_CCY, lstCurrency.value);
					}    
					grdCredit.SetGridText( grdCredit.rows - 1, C_BOOK_RATE, GetBookExRate(_Book_CCY));
				}
			}
			else
			{
				alert('Please save master first !!');	
			}
		break;
	}
}
//==============================================================================
function OnDelete(obj)
{
	switch (obj)
	{
		case 'Master':
			if(confirm('Are you sure you want to delete ?'))
			{
				dso_upd_master.StatusDelete();
				flag='delete';
				dso_upd_master.Call();	
			}
		break;	
		case 'Debit':
			if(confirm('Are you sure you want to delete ?'))
			{
				grdDebit.DeleteRow();
				dso_dr.Call();
			}
		break;
		case 'Credit':
			if(confirm('Are you sure you want to delete ?'))
			{
				grdCredit.DeleteRow();
				dso_cr.Call();
			}
		break;
	}
	
}
//==============================================================================
function OnSearch(obj)
{
	switch (obj)
	{
		case 'grid_master':
			dso_search_master.Call('SELECT');
		break;
		case 'control':
			txtMasterPK.text = grdMaster.GetGridData(grdMaster.row, 0);
			flag='search';
			dso_upd_master.Call('SELECT');
		break;	
	}
}
//==============================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'dso_upd_master':
			if(flag != 'search')
			{
				flag='save';
				dso_dr.Call();
			}
			else
			{
				dso_dr.Call('SELECT');
			}
			ChangeMethod();
			if(lblStatus.text == 'Confirm')
			{
				btnNew.SetEnable(true);
				btnSave.SetEnable(false);
				btnDelete.SetEnable(false);
				btnConfirm.SetEnable(false);
				btnCancel.SetEnable(true);
				
				btnNew_dr.SetEnable(false);	
				btnSave_dr.SetEnable(false);	
				btnDelete_dr.SetEnable(false);	
				btnNew_cr.SetEnable(false);	
				btnSave_cr.SetEnable(false);	
				btnDelete_cr.SetEnable(false);	
			}
			else if(lblStatus.text == 'Cancel')
			{
				btnCancel.SetEnable(false);	
				btnSave.SetEnable(false);
				btnDelete.SetEnable(false);
				btnConfirm.SetEnable(false);
				
				btnNew_dr.SetEnable(false);	
				btnSave_dr.SetEnable(false);	
				btnDelete_dr.SetEnable(false);	
				btnNew_cr.SetEnable(false);	
				btnSave_cr.SetEnable(false);	
				btnDelete_cr.SetEnable(false);	
			}
			else
			{
				btnNew.SetEnable(true);
				btnSave.SetEnable(true);
				btnDelete.SetEnable(true);
				btnConfirm.SetEnable(true);
				btnCancel.SetEnable(false);
				
				btnNew_dr.SetEnable(true);	
				btnSave_dr.SetEnable(true);	
				btnDelete_dr.SetEnable(true);	
				
				btnNew_cr.SetEnable(true);	
				btnSave_cr.SetEnable(true);	
				btnDelete_cr.SetEnable(true);	
			}
		break;
		case 'dso_dr':
			if(flag=='save')
			{
				flag="save";
				dso_cr.Call();	
			}
			else
			{
				dso_cr.Call('SELECT');	
			}
		break;
		case 'dso_cr':
			dso_get_exrate_list.Call();
		break;
		case "dso_get_exrate_list":
            _book_rate = GetBookExRate(_Book_CCY);
            var i = 0;
            var j = 0;
//            for(i=1;i<grdDebit.rows;i++)
//            {
//                grdDebit.SetGridText(i,D_BOOK_RATE,D_BOOK_RATE);
//            }
//            for(j=1;j<grdCredit.rows;j++)
//            {
//                grdCredit.SetGridText(j,C_BOOK_RATE,_book_rate);
//            }
            ChangeMethod();
        break;
		case 'dso_confirm':
			if(lblStatus.text == 'Confirm')
			{
				btnNew.SetEnable(true);
				btnSave.SetEnable(false);
				btnDelete.SetEnable(false);
				btnConfirm.SetEnable(false);
				btnCancel.SetEnable(true);
				
				btnNew_dr.SetEnable(false);	
				btnSave_dr.SetEnable(false);	
				btnDelete_dr.SetEnable(false);	
				btnNew_cr.SetEnable(false);	
				btnSave_cr.SetEnable(false);	
				btnDelete_cr.SetEnable(false);	
			}
			else if(lblStatus.text == 'Cancel')
			{
				btnCancel.SetEnable(false);	
				btnSave.SetEnable(false);
				btnDelete.SetEnable(false);
				btnConfirm.SetEnable(false);
				
				btnNew_dr.SetEnable(false);	
				btnSave_dr.SetEnable(false);	
				btnDelete_dr.SetEnable(false);	
				btnNew_cr.SetEnable(false);	
				btnSave_cr.SetEnable(false);	
				btnDelete_cr.SetEnable(false);	
			}
			else
			{
				btnNew.SetEnable(true);
				btnSave.SetEnable(true);
				btnDelete.SetEnable(true);
				btnConfirm.SetEnable(true);
				btnCancel.SetEnable(false);
				
				btnNew_dr.SetEnable(true);	
				btnSave_dr.SetEnable(true);	
				btnDelete_dr.SetEnable(true);	
				
				btnNew_cr.SetEnable(true);	
				btnSave_cr.SetEnable(true);	
				btnDelete_cr.SetEnable(true);	
			}
			alert(txtRtn.text);
		break;
        case 'dso_MakePlan':
            alert(txtMessage.text);
        break;
    }
}
function OnSumTotal(obj)
{
    switch(obj)
    {
        case 'Dr':
            var _DSumTotal1_T = 0;
            var _DSumTotal2_B = 0;
            var _DSumTotal3_T = 0;
            var _DSumTotal4_B = 0;
                       
            
            var _DDiff_T = 0;
            var _DDiff_B = 0;
            for(i=1;i<grdDebit.rows;i++)
            {
                _DSumTotal1_T += Math.round(Number(grdDebit.GetGridData(i,D_TOTAL_AMT_T)));
                _DSumTotal2_B += format_number( Number(grdDebit.GetGridData(i,D_TOTAL_AMT_B)),2);
            }

            for(j=1;j<grdCredit.rows;j++)
            {
                _DSumTotal3_T += Math.round(Number(grdCredit.GetGridData(j,C_TOTAL_AMT_T)));
                _DSumTotal4_B += format_number( Number(grdCredit.GetGridData(j,C_TOTAL_AMT_B)),2);
            }
            
            
            _DDiff_T = Number(_DSumTotal1_T) - Number(_DSumTotal3_T);
            _DDiff_B = Number(_DSumTotal2_B.toFixed(2)) - Number(_DSumTotal4_B.toFixed(2));

            txtDSumTotal_T.SetDataText(_DSumTotal1_T);
            txtDSumTotal_B.SetDataText(_DSumTotal2_B);
            txtDifferent_T.SetDataText(_DDiff_T);
            txtDifferent_B.SetDataText(_DDiff_B);
        break;
        case 'Cr':
            var _CSumTotal1_T = 0;
            var _CSumTotal2_B = 0;
            var _CSumTotal3_T = 0;
            var _CSumTotal4_B = 0;
            var _CDiff_T = 0;
            var _CDiff_B = 0;
            for(i=1;i<grdCredit.rows;i++)
            {
                _CSumTotal1_T += Math.round(Number(grdCredit.GetGridData(i,C_TOTAL_AMT_T)));
                _CSumTotal2_B += format_number( Number(grdCredit.GetGridData(i,C_TOTAL_AMT_B)),2);
            }
            for(j=1;j<grdDebit.rows;j++)
            {
                _CSumTotal3_T += Math.round(Number(grdDebit.GetGridData(j,D_TOTAL_AMT_T)));
                _CSumTotal4_B +=format_number( Number(grdDebit.GetGridData(j,D_TOTAL_AMT_B)),2);
            }
            _CDiff_T = Number(_CSumTotal1_T) - Number(_CSumTotal3_T);
            _CDiff_B = Number(_CSumTotal2_B.toFixed(2)) - Number(_CSumTotal4_B.toFixed(2));

            txtCSumTotal_T.SetDataText(_CSumTotal1_T);
            txtCSumTotal_B.SetDataText(_CSumTotal2_B);
            txtDifferent_T.SetDataText(_CDiff_T);
            txtDifferent_B.SetDataText(_CDiff_B);
        break;
    }
}
//------------------------------------------------------------------------------
function format_number(dec, fix) 
{
	fixValue = parseFloat(Math.pow(10,fix));
	rtn_value = parseInt(Math.round(dec * fixValue)) / fixValue;	
	return rtn_value ;
}
//==============================================================================
function RowEdit(obj)
{
	switch (obj)
	{
		case 'Dr':
			var dr_famt = 0;
			var dr_bamt = 0;
			var dr_rate = 0;
			var book_rate = 1;
			var _book_rate_dr = 0;
                _book_rate_dr = Number(grdDebit.GetGridData(event.row, 28));
                var ccy = grdDebit.GetGridData(event.row, 6);
                var _vat_rate = grdDebit.GetGridData(event.row, 10);
                var _vat_famt = 0;
                var _vat_amt = 0;
                var _total_famt = 0;
                var _total_amt = 0;
                var i = 0;
                var _sum_ftotal = 0;
                var _sum_total = 0;

             
				if (event.col < 11)
				{
					dr_famt = Number(grdDebit.GetGridData(event.row, 8));
					if(_book_rate_dr !='' || _book_rate_dr != 0 ){
					   dr_bamt = format_number (  dr_famt / _book_rate_dr,2);
					}
				    grdDebit.SetGridText(event.row, 9, dr_bamt);
					
					if (_vat_rate != 0 && _vat_rate != '' && _vat_rate != 'No VAT')
					{
						_vat_famt = format_number(dr_famt * Number(_vat_rate)/100 ,0) ;
						grdDebit.SetGridText(event.row, 11, _vat_famt);
					
						if(_book_rate_dr !='' || _book_rate_dr != 0 )
						{
							_vat_amt  =  format_number(  dr_famt * Number(_vat_rate)/100  / _book_rate_dr,2);
							grdDebit.SetGridText(event.row, 12, _vat_amt);
                        }
					}
					
   				    _total_famt = Number(dr_famt) + Number(_vat_famt) ;
					_total_amt  = Number(dr_bamt) + Number(_vat_amt) ;
					 grdDebit.SetGridText(event.row, 13, _total_famt);
				     grdDebit.SetGridText(event.row, 14, _total_amt);
                }
				if (event.col == 11)
				{
					dr_famt = Number(grdDebit.GetGridData(event.row, 8));
                    _vat_famt = Number(grdDebit.GetGridData(event.row, 11));
				   _total_famt = Number(dr_famt) + Number(_vat_famt) ;
				    grdDebit.SetGridText(event.row, 13, _total_famt);
				}

				if (event.col == 12)
				{
					dr_bamt = Number(grdDebit.GetGridData(event.row, 9));
					_vat_amt = Number(grdDebit.GetGridData(event.row, 12));
                   _total_amt  = Number(dr_bamt) + Number(_vat_amt) ;
				    grdDebit.SetGridText(event.row, 14, _total_amt);
				}

		break;


		case 'Cr':
			var cr_famt = 0;
			var cr_bamt = 0;
			var cr_rate = 0;
			var book_rate = 1;			
            var _book_rate_cr = 0;
            
                _book_rate_cr = Number(grdCredit.GetGridData(event.row, C_BOOK_RATE));
			if (event.col == C_CCY || event.col == C_EX_RATE || event.col == C_AMT_T || event.col == C_TAX_RATE || event.col == C_TOTAL_AMT_T)
			{
				var ccy = grdCredit.GetGridData(event.row, C_CCY);
				var _vat_rate = grdCredit.GetGridData(event.row, C_TAX_RATE);
                var _vat_famt = 0;
                var _vat_amt = 0;
                var _total_famt = 0;
                var _total_amt = 0;
				cr_famt = Number(grdCredit.GetGridData(event.row, C_AMT_T));
				cr_bamt = Number(grdCredit.GetGridData(event.row, C_AMT_B));
				if (_vat_rate != 0 || _vat_rate != '' || _vat_rate != 'No VAT')
				{
					_vat_famt = cr_famt * Number(_vat_rate) / 100;
					_vat_amt = cr_bamt * Number(_vat_rate) / 100;
				}
                _total_famt = Math.round(cr_famt + _vat_famt);
                _total_amt = cr_bamt + _vat_amt;
                grdCredit.SetGridText(event.row, C_VAT_AMT_T, _vat_famt);
                grdCredit.SetGridText(event.row, C_VAT_AMT_B, _vat_amt);
                grdCredit.SetGridText(event.row, C_TOTAL_AMT_T, _total_famt);
                grdCredit.SetGridText(event.row, C_TOTAL_AMT_B, _total_amt);
                book_rate = GetBookExRate(ccy);
			   if(event.col == C_CCY)
			   {
					grdCredit.SetGridText(event.row, C_EX_RATE, book_rate);
			   }
				cr_rate = Number(grdCredit.GetGridData(event.row, C_EX_RATE));
                if(_book_rate_cr != '')
                {
				    var book_amt_cr = System.Round(Number(cr_famt*(cr_rate/_book_rate_cr)),5);
				    grdCredit.SetGridText(event.row, C_AMT_B, book_amt_cr);
			    }
				else
				{
					grdCredit.SetGridText(event.row, C_AMT_B, '');
				}
			  
			}
      break;	
	}
}
//==============================================================================
function GetBookExRate(p_ccy){
    lstBookExRate.value = p_ccy;
	var DD = dtRequestDate.value;
	var MM = dtRequestDate.value;
	var YYYY = dtRequestDate.value;
	
	var year = YYYY.substring(0,4);
	var month = MM.substring(4,6);
	var day = DD.substring(6,8);
    var sTemp = lstBookExRate.GetText();
    if(sTemp == ""){
        alert("Please input exchange rate for this "+ p_ccy +" currency at date:"+ day+"/"+month+"/"+year +".");
        return;
    }
    var aTemp = sTemp.split("-");   
    var book_rate =  aTemp[1];
    return book_rate;
}
//==============================================================================
function OnConfirm()
{
	if(txtMasterPK.text != '')
	{
	    var _total_book=0;
	    for(i=1;i<grdDebit.rows;i++)
	    {
	        _total_book = grdDebit.GetGridData(i, D_TOTAL_AMT_B);
	        
	    } 
       if(!OnCheckSum())
		{
			if(confirm('Are you sure you want to confirm ?'))
			{
				txtConfirm.text = 'INSERT';
				var MM = dtRequestDate.value;
				var month = MM.substring(0,6);
				txtMonth.text = month;
				dso_confirm.Call();	
			}
		}

	}
	else
	{
		alert('There is no data to confirm !!');	
	}
}
//----------------------------------------------------------------------------
function OnCancel()
{
	if(txtMasterPK.text != '')
	{
		if(confirm('Are you sure you want to cancel ?'))
		{
			txtConfirm.text = 'DELETE';
			var MM = dtRequestDate.value;
			var month = MM.substring(0,6);
			txtMonth.text = month;
			dso_confirm.Call();	
		}
	}
	else
	{
		alert('There is no data to confirm !!');	
	}
}
//----------------------------------------------------------------------------------------
function OnCheckSum()
{
	var i = 0;
	var j = 0;
	var TotalTr_dr = 0;
	var TotalBk_dr = 0;
	
	var TotalTr_cr = 0;
	var TotalBk_cr = 0;
	for(i=1;i<grdDebit.rows;i++)
	{
		TotalTr_dr += Math.round(Number(grdDebit.GetGridData(i, D_TOTAL_AMT_T)));
		TotalBk_dr += System.Round(Number(grdDebit.GetGridData(i, D_TOTAL_AMT_B)),5);
        
	}
	for(j=1;j<grdCredit.rows;j++)
	{
		TotalTr_cr += Math.round(Number(grdCredit.GetGridData(j, C_TOTAL_AMT_T)));
		TotalBk_cr += System.Round(Number(grdCredit.GetGridData(j, C_TOTAL_AMT_B)),5);
        
	}
	OnSumTotal('Dr');
	if(TotalTr_dr != TotalTr_cr)
	{
		alert('Debit and credit amount must be same !!');	
		return true;
	}
	else if(txtDifferent_T.text  != '0' )
	{
	        alert('Total amount (Trans) must equal 0 ');
	        return true;
	}
	else if(txtDifferent_B.text  != '0')
	{
	         alert('Total amount (Book) must equal 0 ');
	        return true;
	}
	return false;
}
//==============================================================
function ChangeMethod()
{
	if(lstPaymentMethod.value == '4')	
	{
		BA.style.display='';
		TBA.style.display='';
		RBA.style.display='';
	}
	else
	{
		BA.style.display='none';
		TBA.style.display='none';	
		RBA.style.display='none';
	}
}
//==============================================================
function OnChangeCurrent()
{
    dso_get_rate.Call();
} 
//===============================================================
function OnMakePlan()
{
    if(confirm('Are you sure you want to Make Plan ?'))
    {
        txtConfirm.text = 'INSERT';
        dso_MakePlan.Call();
    }
}
//================================================================
</script>
<body> 
<gw:data id="dso_get_rate" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="pm_pro_61060010_GET_RATE"> 
                <input> 
                     <input bind="dtRequestDate"/>
                     <input bind="txtCompany_Pk"/>
                     <input bind="lstCurrency" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtExRate2"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>          
<gw:data id="dso_upd_master" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35" function="pm_sel_61060060_popup" procedure="pm_upd_61060060_popup">
                <input>
                     <inout bind="txtMasterPK"  />
                     <inout bind="txtProject_Pk"  />
                     <inout bind="txtProject_Cd"  />
                     <inout bind="txtProject_Nm"  />
                     <inout bind="txtCustomer_Pk"  />
                     
                     <inout bind="txtCustomer_Cd"  />
                     <inout bind="txtCustomer_Nm"  />
                     <inout bind="txtRequest_No"  />
                     <inout bind="txtBudget_Pk"  />
                     <inout bind="txtBudget_Cd"  />
                     
                     <inout bind="txtBudget_Nm"  />
                     <inout bind="lstCurrency"  />
                     <inout bind="txtContract_Pk"  />
                     <inout bind="txtContract"  />                     
                     <inout bind="dtRequestDate"  />
                     
                     <inout bind="lstPaymentMethod"  />
                     <inout bind="lstReqType"  />
                     <inout bind="lblStatus"  />
                     <inout bind="txtDescription"  />
                     <inout bind="txtLocal_Description"  /> 
                                         
                     <inout bind="txtNet_FAmt"  />
                     <inout bind="txtNet_Amt"  /> 
                     <inout bind="txtFVAT"  />                   
					 <inout bind="txtVAT"  />
                     <inout bind="txtFTotal"  /> 
                     
                     <inout bind="txtTotal"  /> 
                     <inout bind="txtConfirm"  />
                     <inout bind="txtTECPS_EXPENSE_REQ_PK"  />
                     <inout bind="txtEmployee_Pk"  />
                     <inout bind="txtEmployee_Cd"  /> 
                     
                     <inout bind="txtEmployee_Nm"  />    
                     <inout bind="txtDepositAccNo"  /> 
                     <inout bind="txtOrderW_Pk"  />
                     <inout bind="txtOrderW_Cd"  />
                     <inout bind="txtOrderW_Nm"  />
                     
                     <inout bind="txtDepositAccNo_Pk"  />
                       
                     <inout bind="txtSeq"  />  
                     <inout bind="txtPL_Pk"  />
                     <inout bind="txtPL_Cd"  />
                </input>
            </dso>
        </xml>
    </gw:data>
    
<gw:data id="dso_get_exrate_list" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="list" procedure="pm_sel_61060060_list"> 
                <input> 
                     <input bind="txtCompany_Pk"/>
                     <input bind="dtRequestDate" />
                </input>
                <output>
                     <output bind="lstBookExRate"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>    
    
 <gw:data id="dso_dr" onreceive="OnDataReceive(this)">
      <xml>
        <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29"  function="pm_sel_61060060_dr"  procedure="pm_upd_61060060_dr">
          <input bind="grdDebit" >
          <input bind="txtMasterPK" />
          </input>
          <output bind="grdDebit" />
        </dso>
      </xml>
    </gw:data>    
    
<gw:data id="dso_cr" onreceive="OnDataReceive(this)">
      <xml>
        <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29"  function="pm_sel_61060060_cr"  procedure="pm_upd_61060060_cr">
          <input bind="grdCredit" >
          <input bind="txtMasterPK" />
          </input>
          <output bind="grdCredit" />
        </dso>
      </xml>
    </gw:data>   
    
<gw:data id="dso_confirm" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="pm_pro_61060060_confirm"> 
                <input> 
                	 <input bind="txtConfirm"/>
                     <input bind="txtMonth"/>
                     <input bind="dtRequestDate"/>
                     <input bind="txtMasterPK" />
                </input>
                <output>
                     <output bind="txtRtn"/>
                     <output bind="txtSeq"/>
                     <output bind="lblStatus"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>     
    
<gw:data id="dso_MakePlan" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="pm_pro_61060060_plan"> 
                <input> 
                     <input bind="txtConfirm" />
                     <input bind="txtMasterPK" />
                </input>
                <output>
                     <output bind="txtMessage"/>
                     <output bind="txtRtn"/>
                     <output bind="txtRtn_Status"/>
               </output> 
            </dso> 
        </xml>   
</gw:data>                        
      <table style="width:100%;height:100%;background:#BDE9FF" >
   		<tr height="100%">
        	
        	<td id="right" width="100%" valign="top" style="background:white">
            	<table cellpadding="1" cellspacing="0" bordercolor="#00CCFF" style="border-collapse:collapse;width:100%;height:100%" border="1">
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right" width="29%"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('project')">Project&nbsp;</a></td>
                        <td width="71%">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="30%"><gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' /></td>
                                    <td width="70%"><gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' /></td>
                                    <td width=""><gw:textbox id="txtProject_Pk" readonly="true" styles='width:100%;display:none' /></td>
                                    <td><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
                                </tr>
                            </table>
                        </td>
                        <td colspan="2" width="">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width=""><gw:icon id="btnMakePlan" img="in" text="Make Plan" onclick="OnMakePlan()" /></td>
                                    <td width=""><gw:imgbtn id="btnNew" img="new" alt="New" onclick="OnNew('Master')" /></td>
                                    <td width=""><gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave('Master')" /></td>
                                    <td width=""><gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete('Master')" /></td>
                                    <td width=""><gw:imgbtn id="btnConfirm" img="confirm" alt="Confirm" onclick="OnConfirm()" /></td>
                                    <td width=""><gw:imgbtn id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel()" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right" ><a href="#" title="Click here to show Customer" style="text-decoration: none" onClick="OnPopUp('Customer')">Customer&nbsp;</a></td>
                        <td colspan="">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="30%"><gw:textbox id="txtCustomer_Cd" csstype="mandatory" styles='width:100%' readonly="T" /></td>
                                    <td width="70%" ><gw:textbox id="txtCustomer_Nm" csstype="mandatory" styles='width:100%' readonly="T" /></td>
                                    <td width=""><gw:textbox id="txtCustomer_Pk" styles='width:0%;display:none' /></td>
                                    <td><gw:imgbtn id="btnnfim" img="reset" alt="Reset" onclick="txtCustomer_Cd.text='';txtCustomer_Nm.text='';txtCustomer_Pk.text='';" /></td>
                                </tr>
                            </table>
                        </td> 
                        <td width="" align="right"><a title="Request No" style="color:#333">Req. No&nbsp;</a></td>
                        <td width="" colspan=""><gw:textbox id="txtRequest_No" csstype="mandatory" styles='width:100%'  /></td>
                    </tr>
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right" ><a href="#" title="Click here to show Order Work Division" style="text-decoration: none" onClick="OnPopUp('OrderWork')">Order W.&nbsp;</a></td>
                        <td colspan="">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="30%"><gw:textbox id="txtOrderW_Cd" styles='width:100%' readonly="T" /></td>
                                    <td width="70%" ><gw:textbox id="txtOrderW_Nm" styles='width:100%' readonly="T" /></td>
                                    <td width=""><gw:textbox id="txtOrderW_Pk" styles='width:0%;display:none' /></td>
                                    <td><gw:imgbtn id="btnnfim" img="reset" alt="Reset" onclick="txtOrderW_Cd.text='';txtOrderW_Nm.text='';txtOrderW_Pk.text='';" /></td>
                                </tr>
                            </table>
                        </td> 
                        <td width="" align="right">Seq&nbsp;</td>
                        <td width="42%"><gw:textbox id="txtSeq" styles='width:100%' /></td>
                    </tr>
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right" ><a href="#" title="Click here to show Budget" style="text-decoration: none" onClick="OnPopUp('Budget')">Budget&nbsp;</a></td>
                        <td colspan="">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="30%"><gw:textbox id="txtBudget_Cd" styles='width:100%' readonly="T" /></td>
                                    <td width="70%" ><gw:textbox id="txtBudget_Nm" styles='width:100%' readonly="T" /></td>
                                    <td width=""><gw:textbox id="txtBudget_Pk" styles='width:0%;display:none' /></td>
                                    <td><gw:imgbtn id="btnnfim" img="reset" alt="Reset" onclick="txtBudget_Cd.text='';txtBudget_Nm.text='';txtBudget_Pk.text='';" /></td>
                                </tr>
                            </table>
                        </td> 
                        <td align="right"><a title="Click here to show currency" href="#" style="text-decoration: none" onClick="OnPopUp('currency')">Currency&nbsp;</a></td>
                        <td width=""><gw:list id="lstCurrency" onchange="OnChangeCurrent()" styles='width:100%'  /></td>
                        
                    </tr>
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right" ><a href="#" title="Click here to show Employee" style="text-decoration: none" onClick="OnPopUp('Employee')">Employee&nbsp;</a></td>
                        <td colspan="">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="30%"><gw:textbox id="txtEmployee_Cd" csstype="mandatory" styles='width:100%' readonly="T" /></td>
                                    <td width="70%"><gw:textbox id="txtEmployee_Nm" csstype="mandatory" styles='width:100%' readonly="T" /></td>
                                    <td width=""><gw:textbox id="txtEmployee_Pk" styles='width:0%;display:none' /></td>
                                    <td><gw:imgbtn id="btnnfim" img="reset" alt="Reset" onclick="txtEmployee_Cd.text='';txtEmployee_Nm.text='';txtEmployee_Pk.text='';" /></td>
                                </tr>
                            </table>
                        </td>  
                        <td align="right">Status&nbsp;</td>
                        <td width="" colspan="" style="background-color:white"><gw:label id="lblStatus" styles='width:100%'  /></td>
                    </tr>
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right" ><a href="#" title="Click here to show Contract" style="text-decoration: none" onClick="OnPopUp('Contract')">Contract&nbsp;</a></td>
                        <td colspan="">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="100%"><gw:textbox id="txtContract" styles='width:100%' readonly="T" /></td>
                                    <td width=""><gw:textbox id="txtContract_Pk" styles='width:0%;display:none' /></td>
                                    <td><gw:imgbtn id="btnnfim" img="reset" alt="Reset" onclick="txtContract.text='';txtContract_Pk.text='';" /></td>
                                </tr>
                            </table>
                        </td>  
                        <td align="right"><a title="Request Date" style="color:#333">Req.Date&nbsp;</a></td>
                        <td width="" colspan=""><gw:datebox id="dtRequestDate" styles='width:100%' lang="1" /></td>
                    </tr>
                    
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right"><a  title="Click here to show Payment Method"  style="text-decoration:none" href="#" onClick="OnPopUp('PMethod')" >P. Method.&nbsp;</a></td>
                        <td colspan="3">
                        	<table cellpadding="0" cellspacing="0" width="100%">
                            	<tr>
                                	<td width="50%"><gw:list id="lstPaymentMethod" onchange="ChangeMethod()" styles='width:100%' /></td>
                                    <td align="right" width="15%" id="BA"><a href="#" title="Click here to show Deposit Account No" onClick="OnPopUp('Account')"  style="text-decoration:none" >Bank Acc.&nbsp;</a></td>
                                    <td width="35%" id="TBA"><gw:textbox id="txtDepositAccNo" styles='width:100%' /></td>
                                    <td id="RBA"><gw:imgbtn id="btnnfim" img="reset" alt="Reset" onclick="txtDepositAccNo.text='';txtDepositAccNo_Pk.text='';" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="background:#C5EFF1;height:2%">
                        <td width="" align="right"><a href="#" title="Click here to show Request Type" onClick="OnPopUp('RequestType')" style="text-decoration:none" >Req.Type&nbsp;</a></td>
                        <td colspan="3">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="30%" colspan=""><gw:list id="lstReqType" onchange="" styles='width:100%'  /></td>
                                    <td width="20%" align="right">Ex.Rate&nbsp;</td>
                                    <td width="20%"><gw:textbox id="txtExRate1" type="number" readonly="true" format="###,###.#"  styles='width:100%' /></td>
                                    <td width="30%"><gw:textbox id="txtExRate2" type="number" readonly="true" format="###,###.#"  styles='width:100%' /></td>
                                </tr>
                            </table>
                        </td>      
                    </tr>
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right"><a title="Description" style="color:#333">Descrip.&nbsp;</a></td>
                        <td colspan="3"><gw:textbox id="txtDescription" styles='width:100%' /></td>
                       
                    </tr>
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right"><a title="Local Description" style="color:#333">L. Descrip.&nbsp;</a></td>
                        <td colspan="3"><gw:textbox id="txtLocal_Description" styles='width:100%' /></td>
                        
                    </tr>
                    
                    <tr style="background:#C5EFF1;height:2%;display:none">
                        <td align="right">Net Amt&nbsp;</td>
                        <td colspan="3">
                        	<table cellpadding="0" cellspacing="0" width="100%">
                            	<tr>
                                	<td width="50%"><gw:textbox id="txtNet_FAmt" type="number" format="###,###.#"  styles='width:100%' /></td>
                        			<td width="50%"><gw:textbox id="txtNet_Amt" type="number" format="###,###.##R"  styles='width:100%' /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="background:#C5EFF1;height:2%;display:none">
                        <td align="right">VAT&nbsp;</td>
                        <td colspan="3">
                        	<table cellpadding="0" cellspacing="0" width="100%">
                            	<tr>
                                	<td width="50%"><gw:textbox id="txtFVAT" type="number" format="###,###.#"  styles='width:100%' /></td>
                        			<td width="50%"><gw:textbox id="txtVAT" type="number" format="###,###.##R"  styles='width:100%' /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right">Total&nbsp;</td>
                        <td colspan="3">
                        	<table cellpadding="0" cellspacing="0" width="100%">
                            	<tr>
                                	<td width="50%"><gw:textbox id="txtFTotal" type="number" format="###,###,###,###.#"  styles='width:100%' /></td>
                        			<td width="50%"><gw:textbox id="txtTotal" type="number" format="###,###,###,###.##R"  styles='width:100%' /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr height="2%">
                    	<td colspan="4">
                        	<table cellpadding="0" cellspacing="0" width="100%">
                            	<tr>
                                	<td align="left" width="6%" colspan="" width="100%"><font size="2" color="red">Debit</font></td>
                                    <td width="21%"><gw:textbox id="txtDSumTotal_T" type="number" format="###,###,###,###.#"  styles='width:100%' /></td>
                                    <td width="21%"><gw:textbox id="txtDSumTotal_B" type="number" format="###,###,###,###.##R"  styles='width:100%' /></td>
                                    <td width="10%" align="center">Different&nbsp;</td>
                                    <td width="21%"><gw:textbox id="txtDifferent_T" type="number" format="###,###,###,###.#"  styles='width:100%' /></td>
                                    <td width="21%"><gw:textbox id="txtDifferent_B" type="number" format="###,###,###,###.##R"  styles='width:100%' /></td>
                                    <td width=""><gw:imgbtn id="btnNew_dr" img="new" alt="New" onclick="OnNew('Debit')" /></td>
                                    <td width="" style="display:none"><gw:imgbtn id="btnSave_dr" img="save" alt="Save" onclick="OnSave('Debit')" /></td>
                                    <td width=""><gw:imgbtn id="btnDelete_dr" img="delete" alt="Delete" onclick="OnDelete('Debit')" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                   
                    <tr height="35%">
                    	<td colspan="4">
                        <!--0_PK|1_Mater_pk|2_Acc_pk|3.No|4.Account Code|5.Account Name|6.Currency|7.Ex. Rate|8.Amount(Trans)|9.Amount(Book)|10.Tax Rate|11.VAT Amount(Trans)|12.VAT Amount(Book)|13.Total Amount(Trans)|14.Total Amount(Book)|15.Description|16.Local Description|17.PL Unit|18.Customer|19.Invoice No|20.Invoice Date|21.Due Date|22.Serial No|23.Net Amount|24.Product Item|_25.PLUnit_pk|_26.Customer_pk|_27.DrCr_Type|28.Book Rate|29_TECPS_EXPENSE_REQ_PK -->
                            <gw:grid id='grdDebit' 
                            	header='_PK|_Mater_pk|_Acc_pk|No|Account Code|Account Name|Currency|Ex. Rate|Amount(Trans)|Amount(Book)|Tax Rate|VAT Amount(Trans)|VAT Amount(Book)|Total Amount(Trans)|Total Amount(Book)|Description|Local Description|PL Unit|Customer|Invoice No|Invoice Date|Due Date|Serial No|Net Amount|Product Item|_21.PLUnit_pk|_22.Customer_pk|_23.DrCr_Type|Book Rate|_TECPS_EXPENSE_REQ_PK' 
							    format='0|0|0|0|0|0|0|1|1|1|0|1|1|1|1|0|0|0|0|0|4|4|0|1|0|0|0|0|1|0'
                                aligns='0|0|0|1|0|0|1|0|0|0|3|0|0|0|0|0|0|0|0|0|1|1|0|0|0|0|0|0|0|0' 
								check='|||||||||||||||||||||||||||||' 
							   editcol='0|0|0|1|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0' 
								widths='0|0|0|600|1500|2500|1000|1500|2000|2000|1500|2000|2000|2000|2000|3000|3000|3000|3000|1500|1500|1500|1500|1500|2000|0|0|0|2000|0' 
                                sorting='F'
                                styles='width:100%; height:200' 
                                onafteredit="RowEdit('Dr')"
                                oncellclick="OnSumTotal('Dr')"
                                oncelldblclick="OnPopUp('Edit_Dr');OnPopUp('PL_Unit_Dr');OnPopUp('Customer_Dr')" />
                        </td>
                    </tr>
                    <tr height="2%">
                    	<td colspan="4">
                        	<table cellpadding="0" cellspacing="0" width="100%">
                            	<tr>
                                	<td align="left" colspan="" width="6%"><font size="2" color="red">Credit</font></td>
                                    <td width="21%"><gw:textbox id="txtCSumTotal_T" type="number" format="###,###,###,###.#"  styles='width:100%' /></td>
                                    <td width="21%"><gw:textbox id="txtCSumTotal_B" type="number" format="###,###,###,###.##R"  styles='width:100%' /></td>
                                    <td width="52%"></td>
                                    <td width=""><gw:imgbtn id="btnNew_cr" img="new" alt="New" onclick="OnNew('Credit')" /></td>
                                    <td width="" style="display:none"><gw:imgbtn id="btnSave_cr" img="save" alt="Save" onclick="OnSave('Credit')" /></td>
                                    <td width=""><gw:imgbtn id="btnDelete_cr" img="delete" alt="Delete" onclick="OnDelete('Credit')" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr height="35%">
                    	<td colspan="4">
                            <gw:grid id='grdCredit' 
                            	header='_PK|_Mater_pk|_Acc_pk|No|Account Code|Account Name|Currency|Ex. Rate|Amount(Trans)|Amount(Book)|Tax Rate|VAT Amount(Trans)|VAT Amount(Book)|Total Amount(Trans)|Total Amount(Book)|Description|Local Description|PL Unit|Customer|Invoice No|Invoice Date|Due Date|Serial No|Net Amount|Product Item|_21.PLUnit_pk|_22.Customer_pk|_23.DrCr_Type|Book Rate|_TECPS_EXPENSE_REQ_PK' 
							    format='0|0|0|0|0|0|0|1|1|1|0|1|1|1|1|0|0|0|0|0|4|4|0|1|0|0|0|0|1|0'
                                aligns='0|0|0|1|0|0|1|0|0|0|3|0|0|0|0|0|0|0|0|0|1|1|0|0|0|0|0|0|0|0' 
								check='|||||||||||||||||||||||||||||' 
							   editcol='0|0|0|1|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0' 
								widths='0|0|0|600|1500|2500|1000|1500|2000|2000|1500|2000|2000|2000|2000|3000|3000|3000|3000|1500|1500|1500|1500|1500|2000|0|0|0|2000|0' 
                                sorting='F'
                                onafteredit="RowEdit('Cr')"
                                oncellclick="OnSumTotal('Cr')"
                                styles='width:100%; height:200' 
                                oncelldblclick="OnPopUp('Edit_Cr');OnPopUp('PL_Unit_Cr');OnPopUp('Customer_Cr')" />
                        </td>
                    </tr>
                    <tr style="display:none">
                    <td colspan="4">
                    	
                        <gw:textbox id="txtTAC_ABPL_pk"        styles='display:none'/>
                        <gw:textbox id="txtMasterPK"        styles='display:none'/>
                        <gw:textbox id="txtCompany_Pk"        styles='display:none'/>
                        <gw:list id="lstBookExRate" styles="width:100%;display:" />
						<gw:textbox id="txtDepositAccNo_Pk"        styles='display:'/>
                        <gw:textbox id="txtConfirm"        styles='display:none'/>
                        <gw:textbox id="txtMonth"        styles='display:none'/>
                        <gw:textbox id="txtRtn"        styles='display:none'/>
                        <gw:textbox id="txt_row" text="1"       styles='display:none'/>
                        <gw:textbox id="txtMessage"        styles='display:none'/>
                        <gw:textbox id="txtRtn_Status"        styles='display:none'/>
                        
                        <gw:textbox id="txtTECPS_EXPENSE_REQ_PK"        styles='display:none'/>
                       
                     <gw:textbox id="txtPL_Pk"         styles='display:none'/>
                        <gw:textbox id="txtPL_Cd"        styles='display:none'/>
						</td>
                    </tr>
                </table>
            </td>
        </tr>
   </table>
   
</body>
</html>
