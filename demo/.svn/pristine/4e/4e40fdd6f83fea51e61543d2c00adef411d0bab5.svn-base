<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>1.2.11 AR Confirm</title>
</head>

<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript">
var click_dr = 0;
var click_cr = 0;
var flag_update = false;
//-----------------------------------------------------------------------
function BodyInit()
{
	System.Translate(document);
    BindingDataList() ;
}
//-------------------------------------------------------------------------
function BindingDataList() 
{
    var data="<%=ESysLib.SetListDataSQL("SELECT pk, PARTNER_NAME FROM TCO_company  where del_if=0")%>";   
    lstCompany.SetDataText(data);
	lstCompany.value = "<%=session("company_pk") %>";
	data = "<%=ESysLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
    lstOrder_Ccy.SetDataText(data); 
    lstInvoice_Ccy.SetDataText(data); 
    lstBook_Ccy.SetDataText(data); 
    lstBook_Ccy.value='USD';
    lstOrder_Ccy.SetEnable(false);
    lstBook_Ccy.SetEnable(false);
	txtUserPk.text="<%=Session("USER_PK")%>";
}
//--------------------------------------------------------------------------
function OnToggle() 
{
    var left = document.all("left");
    var right = document.all("right");
    var imgArrow = document.all("imgArrow");

    if (imgArrow.status == "expand") 
    {
        left.style.display = "none";
        imgArrow.status = "collapse";
        right.style.width = "100%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else 
    {
        left.style.display = "";
        imgArrow.status = "expand";
        right.style.width = "75%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
}	
//----------------------------------------------------------------------------
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'project':
		    var path = System.RootURL + '/form/61/03/61030010_1.aspx';
		    var obj = System.OpenModal( path ,750 , 500 , 'resizable:yes;status:yes');
		    if ( obj != null )
		    {
			    txtProject_Pk.text = obj[0];
                txtProject_Cd.text = obj[1];
                txtProject_Nm.text = obj[2];
                txtProject_M.text = obj[1];
//                txttac_abplcenter_pk.text 		= obj[8];
//                dso_get_customer_105.Call();
		    }
	    break;
        case 'Customer1':
            var path = System.RootURL + '/form/61/03/61030070_popup_Customer.aspx?Project_Pk=' + txtProject_Pk.text;
            var obj = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
            if ( obj != null )
            {
				txtCustomer1_Nm.SetDataText(obj[2]);//customer name
				txtCustomer1_Pk.SetDataText(obj[0]);//customer name
				txtCustomer1_Cd.SetDataText(obj[1]);
//                dso_get_AccountNo_auto.Call(); 
            }
        break;   
        case 'Customer3':
            var path = System.RootURL + '/form/61/03/61030070_popup_Customer.aspx?Project_Pk=' + txtProject_Pk.text;
            var obj = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
            if ( obj != null )
            {
				txtCustomer3_Nm.SetDataText(obj[2]);//customer name
				txtCustomer3_Pk.SetDataText(obj[0]);//customer name
				txtCustomer3_Cd.SetDataText(obj[1]);
//                dso_get_AccountNo_auto.Call(); 
            }
        break;   
        case 'Customer2':
            var path = System.RootURL + '/form/61/03/61030070_popup_Customer.aspx?Project_Pk=' + txtProject_Pk.text;
            var obj = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
            if ( obj != null )
            {
				txtCustomer2_Nm.SetDataText(obj[2]);//customer name
				txtCustomer2_Pk.SetDataText(obj[0]);//customer name
				txtCustomer2_Cd.SetDataText(obj[1]);
//                dso_get_AccountNo_auto.Call(); 
            }
        break;   
        case 'Contract':
				var path = System.RootURL + '/form/61/03/61030070_popup_AccCont.aspx?TAC_ABPL_pk=' + txtProject_Pk.text;
				var obj = System.OpenModal( path ,600 , 600 , 'resizable:yes;status:yes');
				if ( obj != null )
				{
					txtContract.SetDataText(obj[1]);
					txtContract_Pk.SetDataText(obj[0]);
				}
		break;
		case 'MCrequest':
			var path = System.RootURL + '/form/61/03/61030100_1.aspx';
				var obj = System.OpenModal( path ,1000 , 600 , 'resizable:yes;status:yes');
				if ( obj != null )
				{
					txttecps_mctrequestPK.SetDataText(obj[0]);
					dso_upd_1211_1.Call('SELECT');
				}
		break;
		case 'ACCLIP':
			if (txttrhSeq.GetData() > 0)
		    {
		        var path = System.RootURL + '/reports/gf/hg/60080010_envn.aspx?seq=' + txttrhSeq.GetData();
		          System.OpenTargetPage(path);
		    }
        break;
    }
}
//--------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch(obj.id)
    {
		case 'dso_upd_1211_1':
			 txtDRCRtype.text = 'D';
             dso_1211_2.Call('SELECT');
		break;
		case 'dso_1211_2':
		    if (txttrhSeq.GetData()==''){
				btnCancel.SetEnable(false);
				btnConfirm.SetEnable(true);
				btnSave_dr.SetEnable(true);
				btnSave_cr.SetEnable(true);
				btnTreament.SetEnable(true);
			}else{
				btnCancel.SetEnable(true);
				btnConfirm.SetEnable(false);
				btnSave_dr.SetEnable(false);
				btnSave_cr.SetEnable(false);
				btnTreament.SetEnable(false);
			}
			txtDRCRtype.text = 'C';
            dso_1211_3.Call('SELECT');
		break;
		case 'dso_MakeSlip':
			  if (txttrhSeq.GetData()==''){
				btnCancel.SetEnable(false);
				btnConfirm.SetEnable(true);
				btnSave_dr.SetEnable(true);
				btnSave_cr.SetEnable(true);
				btnTreament.SetEnable(true);
				btnsave_m.SetEnable(true);
			}else{
				btnCancel.SetEnable(true);
				btnConfirm.SetEnable(false);
				btnSave_dr.SetEnable(false);
				btnSave_cr.SetEnable(false);
				btnTreament.SetEnable(false);
				btnsave_m.SetEnable(false);
			}
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
//
//=======================================================================================================
function OnCalc_Control()
{
   
	
        //===========Calc Book Amt=================
		 // caculate book amount
		 var book_amt =0;
	   if( Number( lblBook_Rate.GetData()!= 0)){
			if(lstBook_Ccy.GetData()=='VND'){
				 txtAmount_bk.text         =  format_number( Number(txtAmount_ord.GetData()) * Number(txtOrder_ExRate.GetData()) / Number(lblBook_Rate.text),0);
				
			}else{

				 book_amt        =  format_number( Number(txtAmount_ord.GetData()) * Number(txtOrder_ExRate.GetData()) / Number(lblBook_Rate.text),2);
				txtAmount_bk.SetDataText( book_amt);
			
			}
       }

        //===========Calc invoice Amt=================
		
	   if( Number( txtInvoice_ExRate.GetData()!= 0)){
			if(lstInvoice_Ccy.text=='VND'){
				 txtAmount_inv.text         =  format_number( Number(txtAmount_ord.GetData()) * Number(txtOrder_ExRate.GetData()) / Number(txtInvoice_ExRate.text),0);
						
			}else{

				 txtAmount_inv.text         =  format_number( Number(txtAmount_ord.GetData()) * Number(txtOrder_ExRate.GetData()) / Number(txtInvoice_ExRate.text),2);
				
			}
   
      }
}
//--------------------------------------------------------------------------------
function RowClick_CR()
{
    if (grdCredit.rows < 2)	
    {
        return;
    }
	else
	{
	     if (grdCredit.selrow < 1)
	    {
	        return;
	    }
	
	    if ((grdCredit.rows > 1) && (grdCredit.selrow < grdCredit.rows) && (grdCredit.selrow != click_cr))
	    {
            for (i = 1; i < grdCredit.rows; i++)
            {
                if (grdCredit.selrow == i)
                {
	                grdCredit.SetCellBold(i,1,i,15,true);
	                grdCredit.SetRowEditable(i, true);
                }
                else
                {
	                grdCredit.SetCellBold(i,1,i,15,false);
	                grdCredit.SetRowEditable(i, false);
                }
            }
            txtacpk.SetDataText(grdCredit.GetGridData(grdCredit.selrow, 1));
            txtTECPS_MCTREQUESTD_PK.SetDataText(grdCredit.GetGridData(grdCredit.selrow, 0));
            txt_rowclick.text = grdCredit.selrow;
            txtDRCRtype.SetDataText('C');
            idGridItem.SetData("");
            click_dr = 0;
            click_cr = grdCredit.selrow;
            dso_upd_ctl_item.Call("SELECT");
        }
        
        OnCheckSumCR();
    }
}
//-----------------------------------------------------------------------------------------
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
//-----------------------------------------------------------------------------------------
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
//-----------------------------------------------------------------------------------------
function ClickItemControl()
{    
	var flg = "0";
	var ctrl = idGridItem.GetGridControl();
	
	if (idGridItem.GetGridData( ctrl.row, 2) == '-1')
	{
		flg = "2";
		var path = System.RootURL + '/form/61/02/61020020_Customer.aspx';
		var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		if ( object != null )
		{
		    if (object[0] != 0)
            {
                idGridItem.SetGridText(ctrl.row,  9, object[1]);//customer id
		        idGridItem.SetGridText(ctrl.row,  10, object[2]);//customer name
		        idGridItem.SetGridText(ctrl.row,  11, "TCO_BUSPARTNER");//table name
		        idGridItem.SetGridText(ctrl.row, 12, object[0]);//customer pk
		        
		        for (i = 1; i < idGridItem.rows; i++)
		        {
//		            if (idGridItem.GetGridData(i, 8) == 'CUSTOMER NAME')
//		            {
//		                idGridItem.SetGridText(i, 10, object[2]);//cuatomer name
//		                idGridItem.SetGridText(i,  9, object[1]);//cuatomer id
//		            }
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
	else if (idGridItem.GetGridData( ctrl.row, 2) == '-2')
	{
	    var fpath   = System.RootURL + "/form/61/03/61030070_popup_Bank_Acc.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
        var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
        if ( object != null )  
        {
            if (object[0] != 0)
            {
                idGridItem.SetGridText(ctrl.row,  9, object[1]) ;//pl name
                idGridItem.SetGridText(ctrl.row, 10, object[3]) ;//cost center name
                idGridItem.SetGridText(ctrl.row,  11, "TAC_ABPLCENTER") ;//
                idGridItem.SetGridText(ctrl.row,  12, object[2]) ;//table pk			
            }
        } 
	}
	else if(idGridItem.GetGridData(idGridItem.row, 8) == 'CONTRACT NOAR'){
	    var fpath   = System.RootURL + "/form/61/03/61030100_contract.aspx?contract_type=SALE&company=" + lstCompany.GetData();
        var object  = System.OpenModal(fpath , 900 , 600 , 'resizable:yes;status:yes'); 
        if ( object!=null ){
            idGridItem.SetGridText(idGridItem.row,  9, object[1]) ;//ITEM CODE(contract no)
            idGridItem.SetGridText(idGridItem.row, 10, object[4]) ;//ITEM NAME(customer name)
            idGridItem.SetGridText(idGridItem.row, 11, "TEX_CONTR_MST") ;//TABLE NAME 
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
                if (idGridItem.GetGridData(i, 8) == 'PL UNIT'){
                    idGridItem.SetGridText(i,  9, object[12]);
                    idGridItem.SetGridText(i,  10, object[13]);
                    idGridItem.SetGridText(i,  12, object[11]);
                }
             
            }
        } 
    }    
    else if(idGridItem.GetGridData( idGridItem.row, 8) == 'CONTRACT NOAR'){
	    var fpath   = System.RootURL + "/form/61/03/61030100_contract.aspx?contract_type=BUY";
        var object  = System.OpenModal(fpath , 900 , 600 , 'resizable:yes;status:yes'); 
        if ( object != null ){
            idGridItem.SetGridText(idGridItem.row,  9, object[1]) ;//ITEM CODE
            idGridItem.SetGridText(idGridItem.row, 10, object[4]) ;//ITEM NAME
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
                if (idGridItem.GetGridData(i, 8) == 'PL UNIT'){
                    idGridItem.SetGridText(i,  9, object[12]);
                    idGridItem.SetGridText(i,  10, object[13]);
                    idGridItem.SetGridText(i,  12, object[11]);
                }
            }
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
				
				var fpath   = System.RootURL + "/form/61/03/61030070_popup_Bank_Acc.aspx?comm_code="+ "" + "&comm_nm=" + ls_str + "&company=" + lstCompany.GetData() + '&dsqlid=SP_SEL_ITEMNM_POPUP&col_code=' + ls_temp +" CODE" + '&col_nm=' + ls_temp + " NAME";
                var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
                //get from TAC_ABITEMCODE
                if ( object != null )  
                {
                    if (object[0] != 0)
                    {
                        idGridItem.SetGridText(ctrl.row,  9, object[0]) ;// item code
                        idGridItem.SetGridText(ctrl.row, 10, object[1]) ;//item name
                        idGridItem.SetGridText(ctrl.row, 11, "TAC_ABITEMCODE") ; //table name
                        idGridItem.SetGridText(ctrl.row, 12, object[2]) ; //table pk
                    }
                } 
			}
			else
			{
			  
				if (idGridItem.GetGridData(ctrl.row, 4) != '')
				{
				//
				}
				else
				{
				   
					if ( idGridItem.GetGridData( ctrl.row, 8 )== "Bank Account No." || idGridItem.GetGridData( ctrl.row, 8 )== "DEPOSIT ACCOUNT NO" || idGridItem.GetGridData( ctrl.row, 8 )== "BANK ACCOUNT NUMBER" || idGridItem.GetGridData( ctrl.row, 8 )== "BANK ACCOUNT NO.")
					{
					    var ls_ccy
					    if (txtDRCRtype.GetData() == 'D')
					    {
					        ls_ccy = grdDebit.GetGridData(click_dr, 6);
					    }
					    else if (txtDRCRtype.GetData() == 'C')
					    {
					        ls_ccy = grdCredit.GetGridData(click_cr, 6);
					    }
					    var fpath   = System.RootURL + "/form/61/03/61030070_popup_Bank_Acc.aspx?comm_code="+ "" + "&comm_nm=" + "" + "&val1=" + ls_ccy + "&company="+ lstCompany.GetData() + '&dsqlid=ACNT.SP_SEL_BANK_POPUP&col_code=' + 'Bank Code'  + '&col_nm=' + 'Bank Name';
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
					else if(idGridItem.GetGridData( ctrl.row, 8 )=="BENEFICIARY BANK")
					{
					    
					    var fpath   = System.RootURL + "/form/61/03/61030070_popup_Bank_Acc.aspx?comm_code="+ "" + "&comm_nm=" + "" + "&val1=" + ls_ccy + "&company="+ lstCompany.GetData() + '&dsqlid=ACNT.sp_sel_BFBENEFICIARY_popup&col_code=' + ' Beneficiary Bank '  + '&col_nm=' + 'Account No';
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
					}
					/*-------------------------------------------------------------------------------*/
					else
					{
						
						if (idGridItem.GetGridData( ctrl.row, 8 )== "EMPLOYEE NAME")
						{
							//var fpath   = System.RootURL + "/form/gf/co/ffco002003.aspx";
							var fpath   = System.RootURL + "/form/61/03/61030100_3.aspx";
                            var object  = System.OpenModal(  fpath , 800 , 500 , 'resizable:yes;status:yes'); 
                            if ( object != null )  
                            {
                                if (object[0] != 0)
                                {
                                    idGridItem.SetGridText(ctrl.row,  9, object[1]) ; //Employee ID
                                    idGridItem.SetGridText(ctrl.row, 10, object[2]) ; //Employee Name 
                                    idGridItem.SetGridText(ctrl.row, 11, "TAC_EMPLOYEE_ADV") ; //table name
                                    idGridItem.SetGridText(ctrl.row, 12, object[0]) ; //TABLE PK    
                                }
                            }
						}	
						else if ( idGridItem.GetGridData( ctrl.row, 8 )== "DEPARTMENT" || idGridItem.GetGridData( ctrl.row, 8 )== "DEPARTMENT NAME" )
						{
							flg = "-3";
						}	
						else if ( idGridItem.GetGridData( ctrl.row, 8 )== "CONTRACT NO")
						{
							flg = "-4";
						}
					}
				}
			}
		}
	}
}
//--------------------------------------------------------------------------------
function RowClick_DR()
{
    if (grdDebit.rows < 2)
    {
        return;
    }
	else
	{
	    if (grdDebit.selrow < 1)
	    {
	        return;
	    }
	   
	    if ((grdDebit.rows > 1) && (grdDebit.selrow < grdDebit.rows) && (grdDebit.selrow != click_dr))
	    {
            for (i = 1; i < grdDebit.rows; i++)
            {
                if (grdDebit.selrow == i)
                {
	                grdDebit.SetCellBold(i,1,i,15,true);
	                grdDebit.SetRowEditable(i, true);
                }
                else
                {
	                grdDebit.SetCellBold(i,1,i,15,false);
	                grdDebit.SetRowEditable(i, false);
                }
            }
            txtacpk.SetDataText(grdDebit.GetGridData(grdDebit.selrow, 1));
            txtTECPS_MCTREQUESTD_PK.SetDataText(grdDebit.GetGridData(grdDebit.selrow, 0));
            txt_rowclick.text = grdDebit.selrow;
            txtDRCRtype.SetDataText('D');
            idGridItem.SetData("");
            click_dr = grdDebit.selrow;
            click_cr = 0;
            dso_upd_ctl_item.Call("SELECT");
        }
        
        OnCheckSumDR();
    }
}
//=======================================================================================================
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
//--------------------------------------------------------------------------------
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
	txtsum_total_cr_famt.text = "" + System.Round(sum_cr_famt,2);
	txtsum_total_cr_amt.text = "" + System.Round(sum_cr_amt,2);
}
//=======================================================================================================
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
	txtsum_total_dr_famt.text = "" + System.Round(sum_dr_famt,2);
	txtsum_total_dr_amt.text = "" + System.Round(sum_dr_amt,2);
}
//-----------------------------------------------------------------------------------------
function OnConfirm()
{
    if (txttrhSeq.text != '')
	{
		alert('Already Confirm Slip ' + txtVoucher_No.text);
	}
	else
	{			
		if (confirm('Are you sure Make Slip for [' + txtVoucher_No.text + '] ?'))
		{
			if (txttecps_mctrequestPK.text != '')
			{
				flag_update = true;
				txtAction.text = "INSERT";
				dso_MakeSlip.Call();
			}
		}
	}
}
//-------------------------------------------------------------------------------------------
function OnCancel()
{
  	if (confirm('Do you want to cancel selected invoice ?'))
	{
		flag_update = true;
		txtAction.text = "DELETE";
		dso_MakeSlip.Call();
	
	}
}
//-----------------------------------------------------------------------------------
function OnSearch(idx){
    switch(idx)
	{
		case 0:
			dso_1211_7.Call('SELECT');
		break;
		case 1:
			txttecps_mctrequestPK.text =  grdMaster.GetGridData(grdMaster.row,0);
			dso_upd_1211_1.Call('SELECT');
		break
	}
	
}
//--------------------------------------------------------------------------------
function OnSave(obj)
{
	switch(obj)
	{
		case 'master':
			dso_upd_1211_1.Call();
		break;
		 case 'Dr':
            txtDRCRtype.text = 'D';
            dso_1211_2.Call();
         
        break;
        case 'Cr':
           txtDRCRtype.text = 'C';	
           dso_1211_3.Call();
         
        break;
	}
}
//--------------------------------------------------------------------------------------
function OnTreament()
{
   SaveItemControl();
}

function SaveItemControl()
{
    if (idGridItem.rows > 1)
	{
	    for (i = 1; i<idGridItem.rows; i++)
	    {
            if (txtDRCRtype.GetData() == 'D')
            {
                if ((idGridItem.GetGridData(i, 0) == '') && (idGridItem.GetGridData(i, 9) !='' ))
                {
                    idGridItem.SetGridText(i, 1, grdDebit.GetGridData(txt_rowclick.text, 0));
                    idGridItem.SetRowStatus(i, 0x20);
                }
                txtacpk.SetDataText(grdDebit.GetGridData(txt_rowclick.text, 1));
                txtTECPS_MCTREQUESTD_PK.SetDataText(grdDebit.GetGridData(txt_rowclick.text, 0));
            }
            else if (txtDRCRtype.GetData() == 'C')
            {
                if (idGridItem.GetGridData(i, 0) == '')
                {
                    idGridItem.SetGridText(i, 1, grdCredit.GetGridData(txt_rowclick.text, 0));
                    idGridItem.SetRowStatus(i, 0x20);
                }
                
                txtacpk.SetDataText(grdCredit.GetGridData(txt_rowclick.text, 1));
                txtTECPS_MCTREQUESTD_PK.SetDataText(grdCredit.GetGridData(txt_rowclick.text, 0));
            }
	    }
	    dso_upd_ctl_item.Call();
    }
}
//--------------------------------------------------------------------------------
</script>

<body>
<!------------1-------------------------------------------------------------------------->
<gw:data id="dso_upd_1211_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,18,19,21,22,23,24,25,26,28,29,30,34,36,37" function="pm_sel_61030100"  procedure="pm_upd_61030100"  >
                <input>
                     <inout bind="txttecps_mctrequestPK"  />
                     <inout bind="txtProject_Pk"  />
                     <inout bind="txtProject_Cd"  />
                     <inout bind="txtProject_Nm"  />
					 <inout bind="txtContract_Pk"  />
                     <inout bind="txtContract"  />  
                     <inout bind="txtCustomer_Pk_AR"  />
					 <inout bind="txtCustomer_Cd_AR"  />
                     <inout bind="txtCustomer_Nm_AR"  />  
					 <inout bind="txtCustomer_Pk_to"  />
					 <inout bind="txtCustomer_Cd_to"  />
                     <inout bind="txtCustomer_Nm_to"  />
					 <inout bind="txtCustomer_Pk_im"  />
					 <inout bind="txtCustomer_Cd_im"  />
                     <inout bind="txtCustomer_Nm_im"  />
                     <inout bind="txtTransType_Pk"  />
					 <inout bind="txtTransType_Cd"  />
                     <inout bind="txtTransType_Nm"  />
					 <inout bind="txtDescription"  />
                     <inout bind="txtLocal_Description"  />
					 <inout bind="txtEnclose"  />
                     <inout bind="lstOrder_Ccy"  />
					 <inout bind="txtOrder_ExRate"  />
					 <inout bind="lstInvoice_Ccy"  />
					 <inout bind="txtInvoice_ExRate"  />
					 <inout bind="lstBook_Ccy"  />
					 <inout bind="lblBook_Rate"  />
					 <inout bind="txtAmount_ord"  />
					 <inout bind="txtAmount_inv"  />
					 <inout bind="txtAmount_bk"  />
					 <inout bind="dtTrans_Date"  />
					 <inout bind="txtVoucher_No"  />
					 <inout bind="txtStatus"  />
					 <inout bind="txttrhSeq"  />
					 <inout bind="txtSerial_No"  />
					 <inout bind="txtInvoice_No"  />
					 <inout bind="dtInvoice_Date"  />
					 <inout bind="dtDue_Date"  />
                </input>
            </dso>
        </xml>
    </gw:data>
<!--------3------------------------------------------------------------------------->
<gw:data id="dso_1211_2" onreceive="OnDataReceive(this)">
      <xml>
        <dso id="1" type="grid" parameter="0,1,3,6,7,8,9,10,11,13,15,17,19,20,21,22,23"  function="pm_sel_61030100_detail"  procedure="pm_upd_61030070_detail">
          <input bind="grdDebit" >
          <input bind="txttecps_mctrequestPK" />
          <input bind="txtDRCRtype" />
          </input>
          <output bind="grdDebit" />
        </dso>
      </xml>
    </gw:data>    
<!----------4----------------------------------------------------------------------->
<gw:data id="dso_1211_3" onreceive="OnDataReceive(this)">
      <xml>
        <dso id="1" type="grid" parameter="0,1,3,6,7,8,9,10,11,13,15,17,19,20,21,22,23"  function="pm_sel_61030100_detail"  procedure="pm_upd_61030070_detail">
          <input bind="grdCredit" >
          <input bind="txttecps_mctrequestPK" />
          <input bind="txtDRCRtype" />
          </input>
          <output bind="grdCredit" />
        </dso>
      </xml>
    </gw:data> 
<!------5------------------------------------------------------------------->
<gw:data id="dso_upd_ctl_item" onreceive="">
        <xml>
            <dso type="grid" parameter="0,1,2,9,10,11,12" function="pm_sel_61030070_ctl_item" procedure="pm_upd_61030070_item_ctl">
                <input bind="idGridItem">
                    <input bind="txtTECPS_MCTREQUESTD_PK"/>
                    <input bind="txtacpk"/>
                    <input bind="txtDRCRtype"/>
                </input> 
                <output bind="idGridItem"/>
            </dso>
        </xml>
    </gw:data>
<!-------6-------------------------------------------------------------------------->
<gw:data id="dso_MakeSlip" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="process" parameter="0,1,2,3" procedure="duol.pm_pro_61030100_confirm"> 
			<input> 
				 <input bind="txtAction" />
				 <input bind="txttecps_mctrequestPK"/>
				 <input bind="lstCompany" />
				 <input bind="txtUserPk"/>
				 <input bind="dtInvoice_Date"/>
			</input>
			<output>
				 <output bind="txtMsgconfirm"/>
                 <output bind="txtVoucher_No"/>
				 <output bind="txttrhSeq"/>
				 <output bind="txtInvoice_No"/>
		   </output> 
		</dso> 
	</xml> 
</gw:data>
<!----------7----------------------------------------------------------------------->
<gw:data id="dso_1211_7" onreceive="OnDataReceive(this)">
      <xml>
        <dso id="1" type="grid"   function="pm_sel_61030100_2"  >
          <input bind="grdMaster" >
			  <input bind="dtFrom" />
			  <input bind="dtTo" />
			  <input bind="txtProject_M" />
			  <input bind="txtCustomer_M" />
			  <input bind="txtSeq_M" />
          </input>
          <output bind="grdMaster" />
        </dso>
      </xml>
    </gw:data> 

<!--------------------------------------------------------------------------------->
   <table style="width:100%;height:100%;background:#BDE9FF" >
   		<tr height="100%">
        	<td id="left" width="25%" style="background:white" valign="top">
            	<table style="width:100%;height:100%" cellpadding="0" cellspacing="0">
                	<tr height="6%">
                    	<td>
                        	<fieldset style="padding:0">
                                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                                         <tr style="height:">
                                                <td style="width: 10%" align="right">Date&nbsp;</td>
                                                <td style="width: 90%"><gw:datebox id="dtFrom" lang="1" onchange="OnSearch(0)" />~<gw:datebox id="dtTo" onchange="OnSearch(0)" lang="1" /></td>
                                                <td width=""><gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch(0)" /></td>
                                            </tr>
                                            <tr style="height: " >
                                                <td style="width: 10%" align="right">Project&nbsp;</td>
                                                <td colspan="2"><gw:textbox id="txtProject_M" styles="width: 100%" onenterkey="OnSearch(0)" /></td>
                                            </tr>
                                            <tr style="height: " >
                                                <td style="width: 10%" align="right">Customer&nbsp;</td>
                                                <td colspan="2"><gw:textbox id="txtCustomer_M" styles="width: 100%" onenterkey="OnSearch(0)" /></td>
                                            </tr>
                                            <tr style="height: " >
                                                <td align="right">Seq&nbsp;</td>
                                                <td colspan="2"><gw:textbox id="txtSeq_M" styles="width: 100%" onenterkey="OnSearch(0)" /></td>
                                            </tr>
                                </table>
                          </fieldset>  
                        </td>
                    </tr>
                    <tr height="94%">
                        <td colspan="">
                            <gw:grid id='grdMaster' 
                            header='_PK|Seq|Order Amount| Order CCY| Booking Amount|Booking CCY' 
                            format='0|0|1|0|1|0'
                            aligns='0|3|3|1|3|1' 
                            check='|||||'
                            editcol= '|||||'
                            widths='0|1200|1500|1000|1500|1000' 
                            sorting='T'
                            styles='width:100%; height:95%' 
							oncellclick="OnSearch(1)" />
                        </td>
                    </tr>
                </table>
            </td>
        	<td id="right" width="75%" valign="top" style="background:white">
            	<table cellpadding="0" cellspacing="0"  style="width:100%;height:" border="0">
                        <tr style="background:#C5EFF1;height:">
                            <td width="80%" colspan="">
                                <table cellpadding="0" cellspacing="0" width="100%" bordercolor="#00CCFF" style="border-collapse:collapse;width:100%;height:" border="1">
                                    <tr>
                                            <td align="right" width="30%">Company&nbsp;</td>
                                            <td width="70%"><gw:list id="lstCompany" onchange="" styles='width:100%'  /></td>
                                    </tr>
                                </table>
                            </td>
                            <td colspan="2" width="20%">
                                <table cellpadding="1" cellspacing="1" width="100%">
                                    <tr>
										<td width="85%"></td>
										<td width="3%"><gw:button id="btnsave_m" img="save" alt="Save" onclick="OnSave('master')" /></td>
										<td width="3%"><gw:button id="btnaccslip" img="excel" alt="Print out accounting slip" onclick="OnPopUp('ACCLIP')" /></td>
										<td width="3%"><gw:button id="btnpopup" img="popup" alt="Get main contract request" onclick="OnPopUp('MCrequest')" /></td>
										<td width="3%"><gw:button id="btnConfirm" img="confirm" alt="Confirm" onclick="OnConfirm()" /></td>
										<td width="3"><gw:button id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel()" /></td>
                                      
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td width="" colspan="2" valign="top">
                                <table cellpadding="1" cellspacing="0" width="100%" bordercolor="#00CCFF" style="border-collapse:collapse;width:100%;height:" border="1">
                                        <tr style="background:#C5EFF1;height:">
                                            <td align="right" width="30%"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('project')">Project&nbsp;</a></td>
                                            <td width="70%" colspan="">
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td width="30%"><gw:textbox id="txtProject_Cd" csstype="mandatory" readonly="true" styles='width:100%' /></td>
                                                        <td width="70%"><gw:textbox id="txtProject_Nm" csstype="mandatory" readonly="true" styles='width:100%' /></td>
                                                        <td width=""><gw:textbox id="txtProject_Pk" readonly="true" styles='width:100%;display:none' /></td>
                                                        <td><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        
                                        <tr style="background:#C5EFF1;height:">
                                            <td align="right" ><a href="#" title="Click here to show Contract" style="text-decoration: none" onClick="OnPopUp('Contract')">Contract&nbsp;</a></td>
                                            <td colspan="">
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td width="100%"><gw:textbox id="txtContract" csstype="mandatory" styles='width:100%' readonly="T" /></td>
                                                        <td width=""><gw:textbox id="txtContract_Pk" styles='width:0%;display:none' /></td>
                                                        <td><gw:imgbtn id="btnonfim" img="reset" alt="Reset" onclick="txtContract.text='';txtContract_Pk.text='';" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr style="background:#C5EFF1;height:">
                                            <td align="right" ><a href="#" title="Click here to show Customer" style="text-decoration: none" onClick="OnPopUp('Customer1')">Customer(AR)&nbsp;</a></td>
                                            <td colspan="">
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td width="30%"><gw:textbox id="txtCustomer_Cd_AR" csstype="mandatory" styles='width:100%' readonly="T" /></td>
                                                        <td width="70%" ><gw:textbox id="txtCustomer_Nm_AR" csstype="mandatory" styles='width:100%' readonly="T" /></td>
                                                        <td width=""><gw:textbox id="txtCustomer_Pk_AR" styles='width:0%;display:none' /></td>
                                                        <td><gw:imgbtn id="btnnfim" img="reset" alt="Reset" onclick="txtCustomer_Cd_AR.text='';txtCustomer_Nm_AR.text='';txtCustomer_Pk_AR.text='';" /></td>
                                                    </tr>
                                                </table>
                                            </td> 
                                        </tr>
                                        <tr style="background:#C5EFF1;height:">
                                            <td align="right" ><a href="#" title="Click here to show Customer" style="text-decoration: none" onClick="OnPopUp('Customer2')">Customer(T/O)&nbsp;</a></td>
                                            <td colspan="">
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td width="30%"><gw:textbox id="txtCustomer_Cd_to" csstype="mandatory" styles='width:100%' readonly="T" /></td>
                                                        <td width="70%" ><gw:textbox id="txtCustomer_Nm_to" csstype="mandatory" styles='width:100%' readonly="T" /></td>
                                                        <td width=""><gw:textbox id="txtCustomer_Pk_to" styles='width:0%;display:none' /></td>
                                                        <td><gw:imgbtn id="btnnfim" img="reset" alt="Reset" onclick="txtCustomer_Cd_to.text='';txtCustomer_Nm_to.text='';txtCustomer_Pk_to.text='';" /></td>
                                                    </tr>
                                                </table>
                                            </td> 
                                        </tr>
                                        <tr style="background:#C5EFF1;height:">
                                            <td align="right" ><a href="#" title="Click here to show Customer" style="text-decoration: none" onClick="OnPopUp('Customer3')">Importer&nbsp;</a></td>
                                            <td colspan="">
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td width="30%"><gw:textbox id="txtCustomer_Cd_im" csstype="mandatory" styles='width:100%' readonly="T" /></td>
                                                        <td width="70%" ><gw:textbox id="txtCustomer_Nm_im" csstype="mandatory" styles='width:100%' readonly="T" /></td>
                                                        <td width=""><gw:textbox id="txtCustomer_Pk_im" styles='width:0%;display:none' /></td>
                                                        <td><gw:imgbtn id="btnnfim" img="reset" alt="Reset" onclick="txtCustomer_Cd_im.text='';txtCustomer_Nm_im.text='';txtCustomer_Pk_im.text='';" /></td>
                                                    </tr>
                                                </table>
                                            </td> 
                                        </tr>
                                        <tr style="background:#C5EFF1;height:">
                        <td align="right" ><a href="#" title="Click here to show Transaction Type" style="text-decoration: none" onClick="OnPopUp('TransType')">Trans.Type&nbsp;</a></td>
                        <td colspan="">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="30%"><gw:textbox id="txtTransType_Cd" csstype="mandatory" styles='width:100%' readonly="T" /></td>
                                    <td width="70%" ><gw:textbox id="txtTransType_Nm" csstype="mandatory" styles='width:100%' readonly="T" /></td>
                                    <td width=""><gw:textbox id="txtTransType_Pk" styles='width:0%;display:none' /></td>
                                    <td><gw:imgbtn id="btnnfim" img="reset" alt="Reset" onclick="txtTransType_Cd.text='';txtTransType.text='';txtTransType_Pk.text='';" /></td>
                                </tr>
                            </table>
                        </td> 
                        
                    </tr>
                                        <tr style="background:#C5EFF1;height:">
                        <td align="right"><a title="Description" style="color:#333">Description&nbsp;</a></td>
                        <td colspan=""><gw:textbox id="txtDescription" styles='width:100%' /></td>
                       
                    </tr>
                                        <tr style="background:#C5EFF1;height:">
                                            <td align="right"><a title="Local Description" style="color:#333">L. Description&nbsp;</a></td>
                                            <td colspan=""><gw:textbox id="txtLocal_Description" styles='width:100%' /></td>
                                        </tr>
                                        <tr style="background:#C5EFF1;height:">
                                            <td align="right">Enclose&nbsp;</td>
                                            <td colspan=""><gw:textbox id="txtEnclose" styles='width:100%' /></td>
                                        </tr>    
                                </table>
                            </td>
                            <td width="" valign="top">
                                <table cellpadding="0" cellspacing="0" width="100%" bordercolor="#00CCFF" style="border-collapse:collapse;width:100%;height:100%" border="1">
                                    <tr>
                                        <td valign="top" style="background:#C5EFF1">
                                            <fieldset style="padding:0"><legend><font style="color:Blue">Slip Info</font></legend>
                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                    <tr style="background:#C5EFF1;height:">
                                                        <td align="right">Trans.Date&nbsp;</td>
                                                        <td colspan=""><gw:datebox id="dtTrans_Date" lang="1"  /></td>
                                                    </tr>
                                                    <tr style="background:#C5EFF1;height:">
                                                        <td align="right">Voucher No&nbsp;</td>
                                                        <td colspan=""><gw:textbox id="txtVoucher_No" styles='width:100%' /></td>
                                                    </tr>  
                                                    <tr style="background:#C5EFF1;height:">
                                                        <td align="right">Status&nbsp;</td>
                                                        <td colspan=""><gw:textbox id="txtStatus" styles='width:100%' /></td>
                                                    </tr>  
                                                    <tr style="background:#C5EFF1;height:">
                                                        <td align="right">Seq&nbsp;</td>
                                                        <td colspan=""><gw:textbox id="txttrhSeq" styles='width:100%' /></td>
                                                    </tr>    
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" style="background:#C5EFF1">
                                            <fieldset style="padding:0"><legend><font style="color:Blue">Invoice Info</font></legend>
                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                    <tr style="background:#C5EFF1;height:">
                                                        <td align="right">Serial No&nbsp;</td>
                                                        <td colspan=""><gw:textbox id="txtSerial_No" styles='width:100%' /></td>
                                                    </tr>  
                                                    <tr style="background:#C5EFF1;height:">
                                                        <td align="right">Inv. No&nbsp;</td>
                                                        <td colspan=""><gw:textbox id="txtInvoice_No" styles='width:100%' /></td>
                                                    </tr>  
                                                    <tr style="background:#C5EFF1;height:">
                                                        <td align="right">Inv. Date&nbsp;</td>
                                                        <td colspan=""><gw:datebox id="dtInvoice_Date" lang="1"  /></td>
                                                    </tr>
                                                    <tr style="background:#C5EFF1;height:">
                                                        <td align="right">Due. Date&nbsp;</td>
                                                        <td colspan=""><gw:datebox id="dtDue_Date" lang="1"  /></td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                    </tr>
                        <tr style="height:">
                                <td colspan="4">
                                    <table cellpadding="0" cellspacing="0" bordercolor="#00CCFF" style="border-collapse:collapse;width:100%;height:100%" border="1">
                                        <tr style="background:#C5EFF1;height:20">
                                            <td width="15%"></td>
                                            <td align="center" width="25%" style="">
                                                <table cellpadding="0" cellspacing="0" >
                            	                    <tr>
                                                        <td width="" style="white-space:nowrap"><a title="Click here to show Order Currency" href="#" style="text-decoration: none" onClick="OnPopUp('currency')">Order CCY&nbsp;</a></td>
                                                        <td width="38%"><gw:list id="lstOrder_Ccy" onchange="dso_get_rate_Order.Call();" styles='width:100%'  /></td>
                                                        <td width="2%"></td>
                                                        <td width="60%"><gw:textbox id="txtOrder_ExRate" styles='width:100%' onenterkey="OnCalc_Control()" type="number"  format="###,###.#" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="center" width="25%">
                                                <table cellpadding="0" cellspacing="0" width="100%">
                            	                    <tr>
                                                        <td width="" style="white-space:nowrap"><a title="Click here to show Invoice Currency" href="#" style="text-decoration: none" onClick="OnPopUp('Invoice')">Inv. CCY&nbsp;</a></td>
                                                        <td width="38%"><gw:list id="lstInvoice_Ccy" onchange="dso_get_rate_Invoice.Call();" styles='width:100%'  /></td>
                                                        <td width="2%"></td>
                                                        <td width="60%"><gw:textbox id="txtInvoice_ExRate" onenterkey="OnCalc_Control()" type="number"  format="###,###.#" styles='width:100%;text-align:right'  /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="center" width="25%">
                                                <table cellpadding="0" cellspacing="0" width="100%">
                            	                    <tr>
                                                        <td width="" style="white-space:nowrap"><a title="Click here to show Book Currency" href="#" style="text-decoration: none" onClick="OnPopUp('BCCY')">BCCY&nbsp;</a></td>
                                                        <td width="38%"><gw:list id="lstBook_Ccy" onchange="dso_get_rate_book.Call();" styles='width:100%'  /></td>
                                                        <td width="2%"></td>
                                                        <td width="60%"><gw:textbox id="lblBook_Rate" onenterkey="OnCalc_Control()" type="number"  format="###,###.#" styles='width:100%;text-align:right'  /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                    </tr>
                                        <tr style="background:#C5EFF1;height:2%">
                                        <td align="right">Amount&nbsp;</td>
                                        <td width=""><gw:textbox id="txtAmount_ord" type="number"  onblur="" format="###,###.#"  styles='width:100%' /></td>
                        			    <td width=""><gw:textbox id="txtAmount_inv" type="number" onenterkey="" onblur="" format="###,###.#R"  styles='width:100%' /></td>
                                        <td width=""><gw:textbox id="txtAmount_bk" type="number" onenterkey="" onblur="" format="###,###.##R"  styles='width:100%' /></td>
                                    </tr>
                                    </table>
                                </td>
                        </tr>
                        <tr id="_5" style="height:">
					<td colspan="4" width="100%" >
						<table border="1" width="100%" cellpadding=0 cellspacing=0 bordercolor="#00FFFF">
							<tr>
								<td width="60%" valign=top id="tdGrid">
								  <table border="0" width="100%" cellpadding=0 cellspacing=0>
									<tr>
										<td width="5%" align="center">
                                                    <a onclick="OnSumDR()" href="#tips">Debit</a></td>
                                                <td width="15%">
                                                    <gw:textbox id="txtsum_chk_dr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                </td>
                                                <td width="15%">
                                                    <gw:textbox id="txtsum_chk_dr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                </td>
                                                <td width="10%" align="center">
                                                    Total</td>
                                                <td width="15%">
                                                    <gw:textbox id="txtsum_total_dr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                </td>
                                                <td width="15%">
                                                    <gw:textbox id="txtsum_total_dr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                </td>
                                                <td width="3%" align="right">
                                                    <gw:button id="btnNew_Dr" img="new" alt="New" styles="width:100%;display:none" onclick="OnNewDr()" />
                                                </td>
                                                <td width="3%" align="right">
                                                    <gw:button id="btnSave_dr" img="save" alt="Save" onclick="OnSave('Dr')" />
                                                </td>
                                                <td width="3%" align="right">
                                                    <gw:button id="btnDel_Dr" img="delete" styles="width:100%;display:none" alt="Delete" onclick="OnDelDr()" />
                                                </td>
                                               
                                                <td width="3%">
                                                </td>
									</tr>
									<tr >
									   <!--0_Pk|1_Acc_pk|2check|3 type ref|4.Acc.Code|5.Acc.Name|6.Ccy|7.Rate|8.Amount Trans|9.mount Book|10.Description|11.Local Description|12_Expense Type|13_m_pk|14_ODR|15_DRCR|16_ChkTreat|17.Book Rate|18Tmp Rate|19_bookccy|20_tco_buspartner_pk|21_tac_abplcenter_pk|22_BUS_ID|23_BUS_NM-->
										<td colspan="10" width="width: 100%">
											<gw:grid id="grdDebit" 
											header="_Pk|_Acc_pk|||Acc.Code|Acc.Name|Ccy|Rate|Amount Trans|Amount Book|Description|Local Description|_Expense Type|_m_pk|_ODR|_DRCR|_ChkTreat|Book Rate|_Tmp Rate|_bookccy|_tco_buspartner_pk|_tac_abplcenter_pk|_BUS_ID|_BUS_NM"
											format="0|0|3|0|0|0|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
											aligns="0|0|1|1|1|0|1|1|3|3|0|0|0|0|0|0|0|0|3|0|0|0|0|0"
											defaults="||||||VND||||||||||||||||0|0" 
											editcol="1|1|1|1|1|1|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1" 
											widths="0|0|250|300|1500|2000|700|1000|1800|1800|3000|2500|1000|1000|1000|800|0|1000|1000|0|0|0|0|0"
											styles="width:100%; height:120" 
											sorting="F"  
											oncelldblclick="OnPopUp('Edit_Dr')" 
											oncellclick="RowClick_DR()"
											/>
										</td>
									</tr>
									<tr>
										 <td width="5%" align="center">
                                                    <b><a onclick="OnSumCR()" href="#tips">Credit</a></td>
                                                <td width="15%">
                                                    <gw:textbox id="txtsum_chk_cr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                </td>
                                                <td width="15%">
                                                    <gw:textbox id="txtsum_chk_cr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##.##R" />
                                                </td>
                                                <td width="10%" align="center">
                                                    Total</td>
                                                <td width="15%">
                                                    <gw:textbox id="txtsum_total_cr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                </td>
                                                <td width="15%">
                                                    <gw:textbox id="txtsum_total_cr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                </td>
                                                <td width="3%" align="right">
                                                    <gw:button id="btnNew_Cr" img="New" styles="width:100%;display:none" alt="New credit" onclick="OnNewCr()" />
                                                </td>
                                                <td width="3%" align="right">
                                                    <gw:button id="btnSave_cr" img="save" alt="Save" onclick="OnSave('Cr')" />
                                                </td>
                                                <td width="3%" align="right">
                                                    <gw:imgbtn id="btnDel_Cr" img="delete" styles="width:100%;display:none"  alt="Delete" onclick="OnDelCr()" />
                                                </td>
                                               
                                            
                                                <td width="3%" align="right">
                                                    <img status="expand" id="img1" src="../../../system/images/next_orange.gif"
                                                        style="cursor: hand;" onclick="OnToggle_dtl()" /></img></td>
									</tr>
									<tr >
									<td colspan="10" width="width: 100%">
										<gw:grid id="grdCredit" 
										header="_Pk|_Acc_pk|||Acc.Code|Acc.Name|Ccy|Rate|Amount Trans|Amount Book|Description|Local Description|_Expense Type|_m_pk|_ODR|_DRCR|_ChkTreat|Book Rate|_Tmp Rate|_bookccy|_tco_buspartner_pk|_tac_abplcenter_pk|_BUS_ID|_BUS_NM"
										format="0|0|3|0|0|0|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
										aligns="0|0|1|1|1|0|1|1|3|3|0|0|0|0|0|0|0|0|3|0|0|0|0|0"
										defaults="||||||VND|||||||||||||0|0|0|0|0" 
										editcol="1|1|1|1|1|1|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1" 
										widths="0|0|250|300|1500|2000|700|1000|1800|1800|3000|2500|1000|1000|1000|800|0|1000|1000|0|0|0|0|0"
										styles="width:100%; height:120" 
										sorting="F"
										oncelldblclick="OnPopUp('Edit_Cr')" 
										oncellclick="RowClick_CR()"
										/>
									</td>
								</tr>

								</table>
								
								</td>
								
								<td width="40%"  id="tdControlItem" style="height:100%" valign="top" >
									<table border="0" style="height:100%" width="100%" cellpadding=0 cellspacing=0>
										<tr height="2%">
										  <td width="100%" align="left"> Control Item</td>
										  <td width="" align="right"><gw:icon id="btnTreament" img="in" text="Treatment" onclick="OnTreament()" styles="width:100%" /></td>
										</tr>
										<tr height="98%">
											<td colspan="3" width="100%" >
												 <gw:neogrid id="idGridItem" styles="width:100%;height:100%" oncelldblclick="ClickItemControl()"
													onafteredit="ChangeData_Upper()"> 
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

															<column title="Item code"  width='2500'>
																<multiple ref="7"  >
																	<textbox type="number" format="###,###C" value="" />
																	<textbox format="50" value="" />
																	<datebox type="day" format=""  lang="1" acceptnull="T"/>
																	<checkbox />	
																	<htmledit value="[New]" />				
																</multiple>
															</column>
															
															<column title="Item name" width='1500'>
																<textbox/>
															</column>
															
															<column title="TABLE NM" hidden='T'>
																<textbox  />
															</column>
															
															<column title="TABLE PK" hidden='T'>
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
            </td>
        </tr>
   </table>
<img status="expand" id="imgArrow" src="../../../system/images/prev_orange.gif" style="cursor: hand;position:absolute; left:1; top: 0;" onClick="OnToggle()" /> 

<gw:textbox id="txttecps_mctrequestPK"        styles='display:none'/>
<gw:textbox id="txtDRCRtype"        styles='display:none'/>
<gw:textbox id="txtTECPS_MCTREQUESTD_PK"        styles='display:none'/>
<gw:textbox id="txtacpk"        styles='display:none'/>
<gw:textbox id="txt_rowclick" style="display: none" />
<gw:textbox id="txtAction" style="display: none" />
<gw:textbox id="txtUserPk" style="display: none" />
<gw:textbox id="txtMsgconfirm" style="display: none" />

</body>
</html>