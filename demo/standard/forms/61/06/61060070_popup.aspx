<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>Clear Payable Popup</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var _Book_CCY = "VND";
function BodyInit()
{
	System.Translate(document);
	BindingDataList();	
	grdDebit.GetGridControl().FrozenCols = 6;
	grdCredit.GetGridControl().FrozenCols = 6;
	BA.style.display='none';
	TBA.style.display='none';
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
	<%=ESysLib.SetGridColumnComboFormat("grdDebit",17,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0017' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
	<%=ESysLib.SetGridColumnComboFormat("grdCredit",17,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0017' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
	grdDebit.SetComboFormat(25, '#Y;Yes|#N;No');
	grdCredit.SetComboFormat(25, '#Y;Yes|#N;No');
	_Book_CCY = "<%=ESysLib.SetDataSQL("select b.code, b.char_1  from tac_commcode_master a, tac_commcode_detail b where a.pk = b.tac_commcode_master_pk and a.id = 'ACBG0040' and b.def_yn = 'Y' and a.del_if = 0 and b.del_if = 0")%>";
    
	var a = _Book_CCY.split("|");
	if(a.length <=0) alert("Please setup book currency in common code.");
    _Book_CCY = a[0];
}
//==============================================================================
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
			//if(txtTAC_ABPL_pk.text != '')
//			{
				var path = System.RootURL + '/form/61/06/61060060_AccSubCont_popup.aspx?TAC_ABPL_pk=' + txtTAC_ABPL_pk.text;
				var obj = System.OpenModal( path ,600 , 600 , 'resizable:yes;status:yes');
				if ( obj != null )
				{
					txtContract.SetDataText(obj[1]);
					txtContract_Pk.SetDataText(obj[0]);
				}
			//}
//			else
//			{
//				alert('Please select Project !!');	
//			}
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
			if(event.col == '4' || event.col == '5')
			{
				var fpath   = System.RootURL + "/form/61/05/61050080_popup_Transaction.aspx?dsqlid=pm_sel_61060060_acc" + "&p_type=";
				var aValue = System.OpenModal(  fpath , 750 , 550 , 'resizable:yes;status:yes');
				if (aValue != null)
				{
					var tmp = aValue[0];
					grdDebit.SetGridText(grdDebit.row, 2, tmp[1]);
					grdDebit.SetGridText(grdDebit.row, 4, tmp[2]);
					grdDebit.SetGridText(grdDebit.row, 5, tmp[3]);
				}
			}
		break;
		case 'Edit_Cr':
			if(event.col == '4' || event.col == '5')
			{
				var fpath   = System.RootURL + "/form/61/05/61050080_popup_Transaction.aspx?dsqlid=pm_sel_61060060_acc" + "&p_type=";
				var aValue = System.OpenModal(  fpath , 750 , 550 , 'resizable:yes;status:yes');
				if (aValue != null)
				{
					var tmp = aValue[0];
					grdCredit.SetGridText(grdCredit.row, 2, tmp[1]);
					grdCredit.SetGridText(grdCredit.row, 4, tmp[2]);
					grdCredit.SetGridText(grdCredit.row, 5, tmp[3]);
				}
			}
		break;
		case 'PL_Unit_Dr':
			if(event.col == '12')
			{
				var fpath = System.RootURL + "/form/61/06/61060050_popup.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + txtCompany_Pk.GetData() + '&dsqlid=pm_sel_62060060_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
				var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
				if ( object != null ) 
				{
					if (object[0] != 0)
					{
						grdDebit.SetGridText(grdDebit.row, 21, object[2]);
						grdDebit.SetGridText(grdDebit.row, 12, object[0] + ' - ' + object[1]);
					}
				}
			}
		break;
		case 'PL_Unit_Cr':
			if(event.col == '12')
			{
				var fpath = System.RootURL + "/form/61/06/61060050_popup.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + txtCompany_Pk.GetData() + '&dsqlid=pm_sel_62060060_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
				var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
				if ( object != null ) 
				{
					if (object[0] != 0)
					{
						grdCredit.SetGridText(grdCredit.row, 21, object[2]);
						grdCredit.SetGridText(grdCredit.row, 12, object[0] + ' - ' + object[1]);
					}
				}
			}
		break;
		case 'Customer_Dr':
			if(event.col=='13')
			{
				var path = System.RootURL + '/form/61/05/61050020_popup2.aspx';
				var obj = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
				if ( obj != null )
				{
					grdDebit.SetGridText(grdDebit.row, 22, obj[0]);
					grdDebit.SetGridText(grdDebit.row, 13, obj[1]+ ' - '+ obj[2]);
				}
			}
        break;   
		case 'Customer_Cr':
			if(event.col=='13')
			{
				var path = System.RootURL + '/form/61/05/61050020_popup2.aspx';
				var obj = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
				if ( obj != null )
				{
					grdCredit.SetGridText(grdCredit.row, 22, obj[0]);
					grdCredit.SetGridText(grdCredit.row, 13, obj[1]+ ' - '+ obj[2]);
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
		case 'PMethod':
			var path = System.RootURL + '/form/61/06/61060010_popup.aspx?code=TPS0043';
			var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			 if (object != null )
             {
				 lstPaymentMethod.SetDataText(object[1]);
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
    }
    
}
var flag='';
//==============================================================================
function OnSave(obj)
{
	switch (obj)
	{
		case 'Master':
			if(txtProject_Pk.text != '')
			{
				flag='save';
					dso_upd_master.Call();
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
					for(var i=1;i<grdDebit.rows;i++)
					{
						grdDebit.SetGridText(grdDebit.rows-1, 3, i);
					}
					grdDebit.SetGridText(grdDebit.rows-1, 1, txtMasterPK.text);
					
					grdDebit.SetGridText(grdDebit.rows-1, 23, 'D');
					grdDebit.SetGridText(grdDebit.rows-1, 22, txtCustomer_Pk.text);
					grdDebit.SetGridText(grdDebit.rows-1, 10, txtDescription.text);
					grdDebit.SetGridText(grdDebit.rows-1, 11, txtLocal_Description.text);
					grdDebit.SetGridText(grdDebit.rows-1, 2, tmp[1]);
					grdDebit.SetGridText(grdDebit.rows-1, 4, tmp[2]);
					grdDebit.SetGridText(grdDebit.rows-1, 5, tmp[3]);
					if (grdDebit.rows > 2)
					{
						var ls_curr = grdDebit.GetGridData(grdDebit.rows - 2, 6);
						var ls_rate = grdDebit.GetGridData(grdDebit.rows - 2, 7);
						grdDebit.SetGridText( grdDebit.rows - 1, 6, ls_curr);       //Rate
						grdDebit.SetGridText( grdDebit.rows - 1, 7, ls_rate);       //Rate
					}
					else
					{
						grdDebit.SetGridText( grdDebit.rows - 1, 7, '1');           //Rate
						grdDebit.SetGridText(grdDebit.rows-1, 6, lstCurrency.value);
					}    
					grdDebit.SetGridText( grdDebit.rows - 1, 24, GetBookExRate(_Book_CCY));
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
					for(var i=1;i<grdCredit.rows;i++)
					{
						grdCredit.SetGridText(grdCredit.rows-1, 3, i);
					}
					grdCredit.SetGridText(grdCredit.rows-1, 1, txtMasterPK.text);
					
					grdCredit.SetGridText(grdCredit.rows-1, 22, txtCustomer_Pk.text);
					grdCredit.SetGridText(grdCredit.rows-1, 10, txtDescription.text);
					grdCredit.SetGridText(grdCredit.rows-1, 11, txtLocal_Description.text);
					grdCredit.SetGridText(grdCredit.rows-1, 23, 'C');
					grdCredit.SetGridText(grdCredit.rows-1, 2, tmp[1]);
					grdCredit.SetGridText(grdCredit.rows-1, 4, tmp[2]);
					grdCredit.SetGridText(grdCredit.rows-1, 5, tmp[3]);
					
					for(var i=1;i<grdDebit.rows;i++)
					{
						Sum_Amt_Tr += Number(grdDebit.GetGridData(i,8));
						Sum_Amt_Bk += Number(grdDebit.GetGridData(i,9)); 	
					}
					grdCredit.SetGridText(grdCredit.rows-1, 8, Sum_Amt_Tr);
					grdCredit.SetGridText(grdCredit.rows-1, 9, Sum_Amt_Bk);
					if (grdCredit.rows > 2)
					{
						var ls_curr = grdCredit.GetGridData(grdCredit.rows - 2, 6);
						var ls_rate = grdCredit.GetGridData(grdCredit.rows - 2, 7);
						grdCredit.SetGridText( grdCredit.rows - 1, 6, ls_curr);       //Rate
						grdCredit.SetGridText( grdCredit.rows - 1, 7, ls_rate);       //Rate
					}
					else
					{
						grdCredit.SetGridText( grdCredit.rows - 1, 7, '1');           //Rate
						grdCredit.SetGridText(grdCredit.rows-1, 6, lstCurrency.value);
					}    
					grdCredit.SetGridText( grdCredit.rows - 1, 24, GetBookExRate(_Book_CCY));
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
    }
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
			
			_book_rate = grdDebit.GetGridData(event.row, 24);
			if (event.col == 6 || event.col == 8 || event.col == 7)
			{
				//txtcur.text = grdDebit.GetGridData(event.row, 6);
				var ccy = grdDebit.GetGridData(event.row, 6);
				//txt_row.text = event.row;
				dr_famt = Number(grdDebit.GetGridData(event.row, 8));
				dr_bamt = Number(grdDebit.GetGridData(event.row, 9));
				book_rate = GetBookExRate(ccy);
			   if(event.col == 6)
			   {
					grdDebit.SetGridText(event.row, 7, book_rate);
			   }
				dr_rate = Number(grdDebit.GetGridData(event.row, 7));
				if(Number(grdDebit.GetGridData(grdDebit.row, 8))>0)
				{
					var book_amt = (Number(dr_famt*(dr_rate/_book_rate)));
					book_amt = System.Round(book_amt,2);
					grdDebit.SetGridText(event.row, 9, book_amt);
				}
				else
				{
					grdDebit.SetGridText(event.row, 9, Math.round(Number(dr_famt*(dr_rate/_book_rate))));
				}
			  
			}
		break;
		case 'Cr':
			var cr_famt = 0;
			var cr_bamt = 0;
			var cr_rate = 0;
			var book_rate = 1;
			
			_book_rate = grdCredit.GetGridData(event.row, 24);
			if (event.col == 6 || event.col == 8 || event.col == 7)
			{
				//txtcur.text = grdDebit.GetGridData(event.row, 6);
				var ccy = grdCredit.GetGridData(event.row, 6);
				//txt_row.text = event.row;
				dr_famt = Number(grdCredit.GetGridData(event.row, 8));
				dr_bamt = Number(grdCredit.GetGridData(event.row, 9));
				book_rate = GetBookExRate(ccy);
			   if(event.col == 6)
			   {
					grdCredit.SetGridText(event.row, 7, book_rate);
			   }
				dr_rate = Number(grdCredit.GetGridData(event.row, 7));
				if(Number(grdCredit.GetGridData(grdCredit.row, 8))>0)
				{
					var book_amt = (Number(dr_famt*(dr_rate/_book_rate)));
					book_amt = System.Round(book_amt,2);
					grdCredit.SetGridText(event.row, 9, book_amt);
				}
				else
				{
					grdCredit.SetGridText(event.row, 9, Math.round(Number(dr_famt*(dr_rate/_book_rate))));
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
		if(confirm('Are you sure you want to confirm ?'))
		{
			if(!OnCheckSum())
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

function OnCheckSum()
{
	var i = 0;
	var j = 0;
	var TotalTr_dr = 0;
	var TotalBk_dr = 0;
	
	var TotalTr_cr = 0;
	var TotalBk_cr = 0;
	
	var VATTr_dr = 0;
	var VATBk_dr = 0;
	
	var VAT_YN = 0
	
	var Total_Tr = 0;
	var Total_Bk = 0;
	var Net_dr_tr = 0;
	var Net_dr_bk = 0;
	for(i=1;i<grdDebit.rows;i++)
	{
		TotalTr_dr += Math.round(Number(grdDebit.GetGridData(i, 8)));
		TotalBk_dr += Math.round(Number(grdDebit.GetGridData(i, 9)));
		if(grdDebit.GetGridData(i,25) == 'Y')
		{
			VATTr_dr += Math.round(Number(grdDebit.GetGridData(i, 8)));
			VATBk_dr += Math.round(Number(grdDebit.GetGridData(i, 9)));
		}
		else
		{
			Net_dr_tr += Math.round(Number(grdDebit.GetGridData(i, 8)));
			Net_dr_bk += Number(grdDebit.GetGridData(i, 9));	
		}
	}
	for(i=1;i<grdCredit.rows;i++)
	{
		TotalTr_cr += Math.round(Number(grdCredit.GetGridData(i, 8)));
		TotalBk_cr += Math.round(Number(grdCredit.GetGridData(i, 9)));
	}
	if((TotalTr_dr == TotalTr_cr)  || (TotalBk_dr == TotalBk_cr))
	{
		txtNet_FAmt.text = Net_dr_tr;
		txtNet_Amt.text = Net_dr_bk;
		
		txtFVAT.text = VATTr_dr;
		txtVAT.text = VATBk_dr;
		
		Total_Tr = Math.round(Number(txtNet_FAmt.text) + Number(txtFVAT.text));
		Total_Bk = Math.round(Number(txtNet_Amt.text) + Number(txtVAT.text));
		txtFTotal.text = Total_Tr;
		txtTotal.text = Total_Bk;
	}
	else
	{
		alert('Debit and Credit of Amount is the same !!');	
		return true;
	}
	return false;
}

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
</script>
<body> 
<gw:data id="dso_upd_master" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35" function="pm_sel_61060070_popup" procedure="pm_upd_61060070_popup">
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
                </input>
            </dso>
        </xml>
    </gw:data>
    
<gw:data id="dso_get_exrate_list" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="list" procedure="pm_sel_62060050_abexrates_list"> 
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
        <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25"  function="pm_sel_61060070_dr"  procedure="pm_upd_61060070_dr">
          <input bind="grdDebit" >
          <input bind="txtMasterPK" />
          </input>
          <output bind="grdDebit" />
        </dso>
      </xml>
    </gw:data>    
    
<gw:data id="dso_cr" onreceive="OnDataReceive(this)">
      <xml>
        <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25"  function="pm_sel_61060070_cr"  procedure="pm_upd_61060070_cr">
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
                                    <td width="25%"><gw:imgbtn id="btnNew" img="new" alt="New" onclick="OnNew('Master')" /></td>
                                    <td width="25%"><gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave('Master')" /></td>
                                    <td width="25%"><gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete('Master')" /></td>
                                    <td width="25%"><gw:imgbtn id="btnConfirm" img="confirm" alt="Confirm" onclick="OnConfirm()" /></td>
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
                                    <td width="30%"><gw:textbox id="txtCustomer_Cd" styles='width:100%' readonly="T" /></td>
                                    <td width="70%" ><gw:textbox id="txtCustomer_Nm" styles='width:100%' readonly="T" /></td>
                                    <td width=""><gw:textbox id="txtCustomer_Pk" styles='width:0%;display:none' /></td>
                                    <td><gw:imgbtn id="btnnfim" img="reset" alt="Reset" onclick="txtCustomer_Cd.text='';txtCustomer_Nm.text='';txtCustomer_Pk.text='';" /></td>
                                </tr>
                            </table>
                        </td> 
                        <td width="" align="right"><a title="Request No" style="color:#333">Req. No&nbsp;</a></td>
                        <td width="" colspan=""><gw:textbox id="txtRequest_No" styles='width:100%'  /></td>
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
                        <td width=""><gw:list id="lstCurrency" styles='width:100%'  /></td>
                        
                    </tr>
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right" ><a href="#" title="Click here to show Employee" style="text-decoration: none" onClick="OnPopUp('Employee')">Employee&nbsp;</a></td>
                        <td colspan="">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="30%"><gw:textbox id="txtEmployee_Cd" styles='width:100%' readonly="T" /></td>
                                    <td width="70%"><gw:textbox id="txtEmployee_Nm" styles='width:100%' readonly="T" /></td>
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
                                	<td width="15%"><gw:list id="lstPaymentMethod" onchange="ChangeMethod()" styles='width:100%' /></td>
                                    <td align="right" width="15%" id="BA"><a href="#" title="Click here to show Deposit Account No" onClick="OnPopUp('Account')"  style="text-decoration:none" >Bank Acc.&nbsp;</a></td>
                                    <td width="35%" id="TBA"><gw:textbox id="txtDepositAccNo" styles='width:100%' /></td>
                                    <td id="RBA"><gw:imgbtn id="btnnfim" img="reset" alt="Reset" onclick="txtDepositAccNo.text='';txtDepositAccNo_Pk.text='';" /></td>
                                	<td width="15%" align="right"><a href="#" title="Click here to show Request Type" onClick="OnPopUp('RequestType')" style="text-decoration:none" >Req.Type&nbsp;</a></td>
                        			<td width="20%" colspan=""><gw:list id="lstReqType" styles='width:100%'  /></td>
                                    
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
                    
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right">Net Amt&nbsp;</td>
                        <td colspan="3">
                        	<table cellpadding="0" cellspacing="0" width="100%">
                            	<tr>
                                	<td width="50%"><gw:textbox id="txtNet_FAmt" type="number" format="###,###.#"  styles='width:100%' /></td>
                        			<td width="50%"><gw:textbox id="txtNet_Amt" type="number" format="###,###.#"  styles='width:100%' /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right">VAT&nbsp;</td>
                        <td colspan="3">
                        	<table cellpadding="0" cellspacing="0" width="100%">
                            	<tr>
                                	<td width="50%"><gw:textbox id="txtFVAT" type="number" format="###,###.#"  styles='width:100%' /></td>
                        			<td width="50%"><gw:textbox id="txtVAT" type="number" format="###,###.#"  styles='width:100%' /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="background:#C5EFF1;height:2%">
                        <td align="right">Total&nbsp;</td>
                        <td colspan="3">
                        	<table cellpadding="0" cellspacing="0" width="100%">
                            	<tr>
                                	<td width="50%"><gw:textbox id="txtFTotal" type="number" format="###,###.#"  styles='width:100%' /></td>
                        			<td width="50%"><gw:textbox id="txtTotal" type="number" format="###,###.#"  styles='width:100%' /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr height="2%">
                    	<td colspan="4">
                        	<table cellpadding="0" cellspacing="0" width="100%">
                            	<tr>
                                	<td align="left" colspan="" width="100%"><font size="2" color="red">Debit</font></td>
                                    <td width=""><gw:imgbtn id="btnNew_dr" img="new" alt="New" onclick="OnNew('Debit')" /></td>
                                    <td width="" style="display:none"><gw:imgbtn id="btnSave_dr" img="save" alt="Save" onclick="OnSave('Debit')" /></td>
                                    <td width=""><gw:imgbtn id="btnDelete_dr" img="delete" alt="Delete" onclick="OnDelete('Debit')" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                   
                    <tr height="36%">
                    	<td colspan="4">
                        <!--header='0._PK|1._Mater_pk|2._Acc_pk|3.No|4.Account Code|5.Account Name|6.Currency|7.Rate|8.Amount(Trans)|9.Amount(Book)|10.Description|11.Local Description|12.PL Unit|13.Customer|14.Invoice No|15.Invoice Date|16.Due Date|17.Tax Rate|18.Serial No|19.Net Amount|20.Product Item|21.PLUnit_pk|22.Customer_pk' -->
                            <gw:grid id='grdDebit' 
                            	header='_PK|_Mater_pk|_Acc_pk|No|Account Code|Account Name|Currency|Ex. Rate|Amount(Trans)|Amount(Book)|Description|Local Description|PL Unit|Customer|Invoice No|Invoice Date|Due Date|Tax Rate|Serial No|Net Amount|Product Item|_21.PLUnit_pk|_22.Customer_pk|_23.DrCr_Type|_24.book_rate|VAT (Y/N)' 
							    format='0|0|0|0|0|0|0|1|1|1|0|0|0|0|0|4|4|0|0|1|0|0|0|0|0|0'
                                aligns='0|0|0|1|0|0|1|0|0|0|0|0|0|0|0|1|1|0|0|0|0|0|0|0|0|0' 
								check='|||||||||||||||||||||||||' 
							   editcol='0|0|0|1|0|0|1|1|1|1|1|1|0|0|1|1|1|1|1|1|1|0|0|0|0|0' 
								widths='0|0|0|600|1500|2500|1000|1000|2000|2000|3000|3000|3000|3000|1500|1500|1500|1500|1500|2000|2000|0|0|0|0|0' 
                                sorting='T'
                                styles='width:100%; height:200' 
                                onafteredit="RowEdit('Dr')"
                                oncelldblclick="OnPopUp('Edit_Dr');OnPopUp('PL_Unit_Dr');OnPopUp('Customer_Dr')" />
                        </td>
                    </tr>
                    <tr height="2%">
                    	<td colspan="4">
                        	<table cellpadding="0" cellspacing="0" width="100%">
                            	<tr>
                                	<td align="left" colspan="" width="100%"><font size="2" color="red">Credit</font></td>
                                    <td width=""><gw:imgbtn id="btnNew_cr" img="new" alt="New" onclick="OnNew('Credit')" /></td>
                                    <td width="" style="display:none"><gw:imgbtn id="btnSave_cr" img="save" alt="Save" onclick="OnSave('Credit')" /></td>
                                    <td width=""><gw:imgbtn id="btnDelete_cr" img="delete" alt="Delete" onclick="OnDelete('Credit')" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr height="36%">
                    	<td colspan="4">
                            <gw:grid id='grdCredit' 
                            	header='_PK|_Mater_pk|_Acc_pk|No|Account Code|Account Name|Currency|Ex. Rate|Amount(Trans)|Amount(Book)|Description|Local Description|PL Unit|Customer|Invoice No|Invoice Date|Due Date|Tax Rate|Serial No|Net Amount|Product Item|_21.PLUnit_pk|_22.Customer_pk|_23.DrCr_Type|_24.book_rate|VAT (Y/N)' 
							    format='0|0|0|0|0|0|0|1|1|1|0|0|0|0|0|4|4|0|0|1|0|0|0|0|0|0'
                                aligns='0|0|0|1|0|0|1|0|0|0|0|0|0|0|0|1|1|0|0|0|0|0|0|0|0|0' 
								check='|||||||||||||||||||||||||' 
							   editcol='0|0|0|1|0|0|1|1|1|1|1|1|0|0|1|1|1|1|1|1|1|0|0|0|0|0' 
								widths='0|0|0|600|1500|2500|1000|1000|2000|2000|3000|3000|3000|3000|1500|1500|1500|1500|1500|2000|2000|0|0|0|0|0' 
                                sorting='T'
                                onafteredit="RowEdit('Cr')"
                                styles='width:100%; height:200' 
                                oncelldblclick="OnPopUp('Edit_Cr');OnPopUp('PL_Unit_Cr');OnPopUp('Customer_Cr')" />
                        </td>
                    </tr>
                    <tr style="display:none">
                    <td colspan="4">
                    	
                        <gw:textbox id="txtTAC_ABPL_pk"        styles='display:none'/>
                        <gw:textbox id="txtMasterPK"        styles='display:none'/>
                        <gw:textbox id="txtCompany_Pk"        styles='display:none'/>
                        <gw:list id="lstBookExRate" styles="width:100%;display:none" />
                        <gw:textbox id="txtConfirm"        styles='display:none'/>
                        <gw:textbox id="txtMonth"        styles='display:none'/>
                        <gw:textbox id="txtRtn"        styles='display:none'/>
                        <gw:textbox id="txtTECPS_EXPENSE_REQ_PK"        styles='display:none'/>
                        <gw:textbox id="txtDepositAccNo_Pk"        styles='display:'/>
						</td>
                    </tr>
                </table>
            </td>
        </tr>
   </table>
</body>
</html>
