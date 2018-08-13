<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Request for payment</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>
var flag_update = false;
var click_dr = 0;
var click_cr = 0;
var G1_PK				    = 0,
	G1_REQ_NO		        = 1,
	G1_THIS_PAYMENT         = 2,
	G1_CCY      		    = 3;
//---------------------------------------------------------------------	
function BodyInit()
{
	System.Translate(document);
	BindingDataList();
	dso_kpcs319_mst.StatusInsert();
	txtOrderERate.SetDataText('1');
    txt_inv_ERate.SetDataText('1');
	txtBRate.SetDataText('1');
	lstBCCY.SetEnable(false);
    lstOrderCCY.SetEnable(false);
	txtReqFAMT.SetReadOnly(true);
	txtReq_Inv_AMT.SetReadOnly(true);
	txtReqAMT.SetReadOnly(true);
	
}	
//-----------------------------------------------------------------------------------------
function BindingDataList()
{
	var data ;
	var _Book_CCY;
	data = "<%=ESysLib.SetListDataSQL("SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>";
	lst_inv_CCY.SetDataText(data);
	lst_inv_CCY.value = 'VND';
    lstBCCY.SetDataText(data); 
	lstOrderCCY.SetDataText(data); 
	_Book_CCY = "<%=ESysLib.SetDataSQL("select b.code, b.char_1  from tac_commcode_master a, tac_commcode_detail b where a.pk = b.tac_commcode_master_pk and a.id = 'ACBG0040' and b.def_yn = 'Y' and a.del_if = 0 and b.del_if = 0")%>";
    
    var a = _Book_CCY.split("|");
    if(a.length <=0) alert("Please setup book currency in common code.");
    _Book_CCY = a[0];
     lstBCCY.value = _Book_CCY;
	data = "<%=ESysLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'TPS0030' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>";
	lstPPDes.SetDataText(data);
	lstPPDes.value = '';
	txtCompanyPK.text = "<%=Session("COMPANY_PK")%>";
	data     = "<%=ESysLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
	lstCompany.SetDataText(data);
	lstCompany.value = "<%=session("company_pk") %>";
    txtUserPk.text="<%=Session("USER_PK")%>";
}
//-----------------------------------------------------------------------------------------
function OnPrint(obj)
{
    switch(obj)
    {
        case 'proposal':
        	   var path = System.RootURL + '/reports/kp/cs/kpcs319_request4payment_pdf.aspx?p_pk=' + txt_tecps_requestpayment_pk.GetData() + '&l_pj_pk=' + txtProjectPK.text  + '&user_pk=' + txtUserPk.text;
			   System.OpenTargetPage(path);
	   break;
        case 'slipentry':
            if (txtSeq.GetData() > 0)
		    {
		        var path = System.RootURL + '/reports/61/05/rpt_61050080_envn.aspx?seq=' + txtSeq.GetData();
		          System.OpenTargetPage(path);
		    }
        break;
    }
}
//---------------------------------------------------------------------------------------------
function OnPopUp(pos)
{
	switch(pos)
	{
		case 'project':				
			var path = System.RootURL + '/form/61/05/61050020_popup.aspx';
			var obj = System.OpenModal( path ,750 , 500 , 'resizable:yes;status:yes');
					
			if ( obj != null )
			{
				txtProjectPK.text 		= obj[0];
				txtProjectCdSearch.text = obj[1];
				txtProjectCd.text 		= obj[1];
				txtProjectNm.text 		= obj[2];
				txtTAC_ABPL_pk.text = obj[3];
				txttac_abplcenter_pk.text 		= obj[8];
			}
		break;
		case 'subcontracno':
			if (txtProjectPK.text == '')
			{
				alert('Please, select Project !!!');
			}
			else
			{
				var path = System.RootURL + '/form/61/08/61080030_Subcontract.aspx?Project_pk=' + txtProjectPK.text;
				var obj = System.OpenModal( path ,700 , 400 , 'resizable:yes;status:yes');
				
				if ( obj != null )
				{
					tecps_substrp12000_pk.SetDataText(obj[0]);
					txtSubNoCd.SetDataText(obj[3]);
					txtSubNoNm.SetDataText(obj[2]); 
				    txtSubcontractSearch.text = obj[3];
					dso_get_subcontract_info.Call();
				}
			}
		break;
	    case 'subcontractor':
            var path = System.RootURL + '/form/61/05/61050020_popup2.aspx';
            var obj = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
			
            if ( obj != null )
            {
				txtSubPK.SetDataText(obj[0]);
				txtSubNm.SetDataText(obj[2]);
				txtSubCd.SetDataText(obj[1]); 
            }
        break;
		
	   
	}
}
//-----------------------------------------------------------------------------------	
function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("imgArrow"); 

    if (imgArrow.status == "expand")
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
//----------------------------------------------------
function OnToggle_dtl()
{
    var left  = document.all("tdGrid");    
    var right = document.all("tdControlItem");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "collapse")
    {
        right.style.display="none";       
        imgArrow.status = "expand";
        left.style.width="100%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
    else
    {
        right.style.display="";
        imgArrow.status = "collapse";
        left.style.width="60%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
}

//----------------------------------------------------------------------------------
function OnNew()
{
	btnSave.SetEnable(true);
	btnDelete.SetEnable(true);
	btconfirm.SetEnable(true);
   
	dso_kpcs319_mst.StatusInsert();
	 txtOrderERate.SetDataText('1');
    txt_inv_ERate.SetDataText('1');
	//txtBRate.SetDataText('1');
	lstPPDes.value = '';
	grdDebit.ClearData();
    grdCredit.ClearData();
	idGridItem.SetData("");
}
//------------------------------------------------------------------------------------
function OnCheckInput()
{
    if (txtReqNo.text == '')
	{
		alert('Please, input Request No !!!');
        txtReqNo.GetControl().focus();
        return true;
    }
    else if(txtProjectPK.text == '')
    {
        alert('Please, input Project !!!');
        return true;
    }
    else if(txtSubNoCd.text == '')
    {
        alert('Please, input Subcontract No !!!');
        return true;
    }
    else if(txtSubCd.text == '')
    {
        alert('Please, input Subcontractor !!!');
        return true;
    }
    return false;
}
//-------------------------------------------------------------------------------------
function OnSave()
{
    if(!OnCheckInput())
    {
		flag_update = true;
		dso_kpcs319_mst.Call();
   }
}
//---------------------------------------------------------------------------------------
function OnDelete()
{
    if (txt_tecps_requestpayment_pk.text != '')
    {
        if (confirm('Are you sure you want to delete?'))
        {
			idGridItem.SetData("");
			flag_update = true;
			dso_kpcs319_mst.StatusDelete();
            dso_kpcs319_mst.Call();
        }
    }
}
//-----------------------------------------------------------------------------------------
function OnConfirm()
{
    if (tac_hgtrh_pk.text != '')
	{
		alert('Already Confirm Slip ' + txtReqNo.text);
	}
	else
	{			
		if (confirm('Are you sure Make Slip for [' + txtReqNo.text + '] ?'))
		{
			if (txt_tecps_requestpayment_pk.text != '')
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
    if (txt_trhstatus.GetData() == '2')
	{
		alert('The selected request was confirmed by accounting team. So you can not cancel it.' );
	}else if(txt_trhstatus.GetData() == '0'){ 
		alert('The selected request was approved by accounting team. So you can not cancel it.' );
	}

	else
	{
		if (txt_tecps_requestpayment_pk.text != '')
		{
			flag_update = true;
			txtAction.text = "DELETE";
			dso_MakeSlip.Call();
		}
	}
}
//--------------------------------------------------------------------------------------------
function OnSearch(obj)
{
    switch(obj.id)
    {
        case 'btnSearch':
        case 'txtProjectCdSearch':
        case 'txtSubcontractSearch':
            if(txtProjectCdSearch.text != '')
            {
                if(txtSubcontractSearch.text != '')
                {
                    dso_kpcs319_search.Call("SELECT");
                }
                else
                {
                    alert('Please select Subcontract !!');
                }
            }
            else
            {
                alert('Please select Project !!');
            }
        break;
        case 'grdSearch':
            if (grdSearch.row < 1) return;
            
            if (flag_update == false)
            {
                txt_tecps_requestpayment_pk.text = grdSearch.GetGridData(grdSearch.row, G1_PK);
                dso_kpcs319_mst.Call("SELECT");
            }
        break;
    }
}
//----------------------------------------------------------------------------------------------
function Enablebutton()
{
	 if (lblStatus.text == 'Confirmed')
            {
                btnSave.SetEnable(false);
                btnDelete.SetEnable(false);
                btconfirm.SetEnable(false);
				
            }
            else
            {
                btnSave.SetEnable(true);
                btnDelete.SetEnable(true);
                btconfirm.SetEnable(true);
				//setAmtDetail();
            }
}
//----------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch(obj.id)
    {
	    case 'dso_adv_deduct_can':
			if ( Number(txtAdvDeduct_FAMT.GetData()) >  Number(txt_adv_deduct_can.GetData()))
			{
				alert('The advance deduct amount must be less than or equal ' + txt_adv_deduct_can.GetData());
                txtAdvDeduct_FAMT.text = txt_adv_deduct_can.text;
				OnChangeText();
			}
		break;
		case 'dso_get_subcontract_info':
             
			 if (txt_acc_order_pk.GetData()=='')
		     {
				txt_acc_order_pk.SetDataText('2724');
                txt_acc_order_cd.SetDataText('6040110000');
				txt_acc_order_nm.SetDataText('S/E - Outside order cost');
		     }
			if (txt_edit_yn.GetData()=='N')
			{
				dtProFrom.SetEnable(false);
			}else{
				dtProFrom.SetEnable(true);
			}
		break;
		
        case 'dso_kpcs319_search':
			flag_update = false;
        break;
        case 'dso_kpcs319_mst':
			SetReqMonth();
            if (lblStatus.text == 'Confirmed')
            {
                btnSave.SetEnable(false);
                btnDelete.SetEnable(false);
                btconfirm.SetEnable(false);
				 txtDRCRtype.text = 'D'
			
			    dso_kpcs319_dtl_debit.Call('SELECT');
            }
            else
            {
                btnSave.SetEnable(true);
                btnDelete.SetEnable(true);
                btconfirm.SetEnable(true);
				//setAmtDetail();
            }			
			for(i=1;i<grdDebit.rows;i++)
            {
				if(grdDebit.GetGridData(i,0) =='')
				{
					grdDebit.SetGridText(i, 0,1);
					grdDebit.SetRowStatus(i, 0x20);
					grdDebit.SetGridText( i, 13, txt_tecps_requestpayment_pk.GetData()); // 13 master pk
				}
            }
			 txtDRCRtype.text = 'D'
			
			 dso_kpcs319_dtl_debit.Call();
        break;
        case 'dso_kpcs319_dtl_debit':
		   for(i=1;i<grdCredit.rows;i++)
            {
				if(grdCredit.GetGridData(i,0) =='')
				{
					grdCredit.SetGridText(i, 0,1);
					grdCredit.SetRowStatus(i, 0x20);
					grdCredit.SetGridText( i, 13, txt_tecps_requestpayment_pk.GetData()); // 13 master pk
				}
            }
		  txtDRCRtype.text = 'C'	 
		  dso_kpcs319_dtl_credit.Call();
        break;
        case 'dso_kpcs319_dtl_credit':
		  // SaveItemControl();
        break;
		case 'dso_MakeSlip':
			//dso_kpcs319_search.Call("SELECT");
		    alert(txtStatus.text);
			if (lblStatus.text == 'Confirmed')
            {
                btnSave.SetEnable(false);
                btnDelete.SetEnable(false);
                btconfirm.SetEnable(false);
            }
            else
            {
                btnSave.SetEnable(true);
                btnDelete.SetEnable(true);
                btconfirm.SetEnable(true);
            }
			
			
			
		break;
		case 'dso_req_amt':
		    OnChangeText();
			setAmtDetail();
			
		break;
		case 'dso_delete_all_detail':
			dso_kpcs319_mst.Call();
		break;
    }
}
//-------------------------------------------------------------------------------
function setAmtDetail()
{
				grdDebit.ClearData();
				grdCredit.ClearData();
				var Description ='';
				var L_Description ='';
				var req_time ='' ;
				
				switch(txtreqtime.GetData())
				{
					case '0':
					break;
					case '1':
					case '21':
						req_time = txtreqtime.GetData() + 'st' ;
					break;
					case '2':
					case '22':
						req_time = txtreqtime.GetData() + 'nd' ;
					break;
					case '3':
					case '23': 
					   req_time = txtreqtime.GetData() + 'rd' ;
					break;
					case '4':
					case '5':
					case '6':
					case '7':
					case '8':
					case '9':
					case '10':
					case '11':
					case '12':
					case '13':
					case '14':
					case '15':
					case '16':
					case '17':
					case '18':
					case '19':
					case '20':
					case '24':
					case '25':
					case '26':
					case '27':
					case '28':
					case '29':
					case '30':
						req_time = txtreqtime.GetData() + 'th' ;
					break;
					
				}
				//---- 1 Net Amount --------------------------------------------------------
				//alert(txtReq_Inv_AMT.GetData());
				if( Number(txtReqFAMT.GetData()) !=0)
				{
					if ( lstPPDes.GetData()== '01' )
					{
						var Net_Inv_amt = Number(txtThisPay_InvAMT.GetData()) - Number(txtVAT_InvAMT.GetData());
						var Net_book_amt =Number(txtThisPayAMT.GetData()) - Number(txtVATAMT.GetData());
						Description =  ' Advance payment for  (' + txtSubNm.GetData() + ') of (' + txtSubNoCd.GetData() + ')'  ;
						L_Description ='Thanh toán tạm ứng cho  ' + txtreqtime.GetData() + ' cho(' + txtSubNm.GetData() + ') của hợp đồng số (' + txtSubNoCd.GetData() + ')'  ;
						grdDebit.AddRow();
						grdDebit.SetGridText( grdDebit.rows - 1, 1, 2163 );
						grdDebit.SetGridText( grdDebit.rows - 1, 3,1);    //ACPK
						grdDebit.SetGridText( grdDebit.rows - 1, 4,'331300' );    //Account Code
						grdDebit.SetGridText( grdDebit.rows - 1, 5, 'Advance to vendor - Domestic');    //Account Name
						grdDebit.SetGridText( grdDebit.rows - 1, 6, lst_inv_CCY.GetData());    // ccy 
						grdDebit.SetGridText( grdDebit.rows - 1, 7, txt_inv_ERate.GetData());    // txt_inv_ERate
						grdDebit.SetGridText( grdDebit.rows - 1, 8, Net_Inv_amt);    // 8.Amount Trans
						grdDebit.SetGridText( grdDebit.rows - 1, 9, Net_book_amt);    // 9 mount Book
						grdDebit.SetGridText( grdDebit.rows - 1, 10, Description);    // 10 Description
						grdDebit.SetGridText( grdDebit.rows - 1, 11, L_Description);    // 11 Local Description
					   // grdDebit.SetGridText( grdDebit.rows - 1, 13, txt_tecps_requestpayment_pk.GetData()); // 13 master pk
						grdDebit.SetGridText( grdDebit.rows - 1, 15, 'D');    // 15_DRCR 
						grdDebit.SetGridText( grdDebit.rows - 1, 17, txtBRate.GetData());    // txtBRate
						grdDebit.SetGridText( grdDebit.rows - 1, 19, lstBCCY.GetData());    // 19_bookccy
						grdDebit.SetGridText( grdDebit.rows - 1, 20, txtSubPK.GetData());    // 20_tco_buspartner_pk
						grdDebit.SetGridText( grdDebit.rows - 1, 21, txttac_abplcenter_pk.GetData());    // 21_tac_abplcenter_pk--
						grdDebit.SetGridText( grdDebit.rows - 1, 22, txtSubCd.GetData());    // 22 BUS ID
						grdDebit.SetGridText( grdDebit.rows - 1, 23, txtSubNm.GetData());    // 23 BUS NM

						grdCredit.AddRow();
						grdCredit.SetGridText( grdCredit.rows - 1, 1, 2161 );
						grdCredit.SetGridText( grdCredit.rows - 1, 3,1);    //ACPK
						grdCredit.SetGridText( grdCredit.rows - 1, 4,'331100' );    //Account Code
						grdCredit.SetGridText( grdCredit.rows - 1, 5, 'A/P - DOMESTIC TRADE');    //Account Name
						grdCredit.SetGridText( grdCredit.rows - 1, 6, lst_inv_CCY.GetData());    // ccy 
						grdCredit.SetGridText( grdCredit.rows - 1, 7, txt_inv_ERate.GetData());    // txt_inv_ERate
						grdCredit.SetGridText( grdCredit.rows - 1, 8, Net_Inv_amt);    // 8.Amount Trans
						grdCredit.SetGridText( grdCredit.rows - 1, 9, Net_book_amt);    // 9 mount Book
						grdCredit.SetGridText( grdCredit.rows - 1, 10, Description);    // 10 Description
						grdCredit.SetGridText( grdCredit.rows - 1, 11, L_Description);    // 11 Local Description
						//grdCredit.SetGridText( grdCredit.rows - 1, 13, txt_tecps_requestpayment_pk.GetData()); // 13 master pk
						grdCredit.SetGridText( grdCredit.rows - 1, 15, 'C');    // 15_DRCR 
						grdCredit.SetGridText( grdCredit.rows - 1, 17, txtBRate.GetData());    // txtBRate
						grdCredit.SetGridText( grdCredit.rows - 1, 19, lstBCCY.GetData());    // 19_bookccy
						grdCredit.SetGridText( grdCredit.rows - 1, 20, txtSubPK.GetData());    // 20_tco_buspartner_pk
						grdCredit.SetGridText( grdCredit.rows - 1, 21, txttac_abplcenter_pk.GetData());    // 21_tac_abplcenter_pk--
						grdCredit.SetGridText( grdCredit.rows - 1, 22, txtSubCd.GetData());    // 22 BUS ID
						grdCredit.SetGridText( grdCredit.rows - 1, 23, txtSubNm.GetData());    // 23 BUS NM

						//---------Withholding tax-------------------------------------------------------

						
					}else{

						var Net_Inv_amt = Number(txtThisPay_InvAMT.GetData()) - Number(txtVAT_InvAMT.GetData());
						var Net_book_amt =Number(txtThisPayAMT.GetData()) - Number(txtVATAMT.GetData());
						Description = req_time + ' payment for (' + txtSubNm.GetData() + ') of (' + txtSubNoCd.GetData() + ')'  ;
						L_Description ='Thanh toán tiến độ lần ' + txtreqtime.GetData() + ' cho(' + txtSubNm.GetData() + ') của hợp đồng số (' + txtSubNoCd.GetData() + ')'  ;
						grdDebit.AddRow();
						grdDebit.SetGridText( grdDebit.rows - 1, 1, txt_acc_order_pk.GetData() ); // 2724
						grdDebit.SetGridText( grdDebit.rows - 1, 3,1);    //ACPK
						grdDebit.SetGridText( grdDebit.rows - 1, 4, txt_acc_order_cd.GetData() );    //Account Code '6040110000'
						grdDebit.SetGridText( grdDebit.rows - 1, 5, txt_acc_order_nm.GetData());    //Account Name  'S/E - Outside order cost'
						grdDebit.SetGridText( grdDebit.rows - 1, 6, lst_inv_CCY.GetData());    // ccy 
						grdDebit.SetGridText( grdDebit.rows - 1, 7, txt_inv_ERate.GetData());    // txt_inv_ERate
						grdDebit.SetGridText( grdDebit.rows - 1, 8, Net_Inv_amt);    // 8.Amount Trans
						grdDebit.SetGridText( grdDebit.rows - 1, 9, Net_book_amt);    // 9 mount Book
						grdDebit.SetGridText( grdDebit.rows - 1, 10, Description);    // 10 Description
						grdDebit.SetGridText( grdDebit.rows - 1, 11, L_Description);    // 11 Local Description
					   // grdDebit.SetGridText( grdDebit.rows - 1, 13, txt_tecps_requestpayment_pk.GetData()); // 13 master pk
						grdDebit.SetGridText( grdDebit.rows - 1, 15, 'D');    // 15_DRCR 
						grdDebit.SetGridText( grdDebit.rows - 1, 17, txtBRate.GetData());    // txtBRate
						grdDebit.SetGridText( grdDebit.rows - 1, 19, lstBCCY.GetData());    // 19_bookccy
						grdDebit.SetGridText( grdDebit.rows - 1, 20, txtSubPK.GetData());    // 20_tco_buspartner_pk
						grdDebit.SetGridText( grdDebit.rows - 1, 21, txttac_abplcenter_pk.GetData());    // 21_tac_abplcenter_pk--
						grdDebit.SetGridText( grdDebit.rows - 1, 22, txtSubCd.GetData());    // 22 BUS ID
						grdDebit.SetGridText( grdDebit.rows - 1, 23, txtSubNm.GetData());    // 23 BUS NM

						grdCredit.AddRow();
						grdCredit.SetGridText( grdCredit.rows - 1, 1, 2161 );
						grdCredit.SetGridText( grdCredit.rows - 1, 3,1);    //ACPK
						grdCredit.SetGridText( grdCredit.rows - 1, 4,'331100' );    //Account Code
						grdCredit.SetGridText( grdCredit.rows - 1, 5, 'Accounts payable - Domestic');    //Account Name
						grdCredit.SetGridText( grdCredit.rows - 1, 6, lst_inv_CCY.GetData());    // ccy 
						grdCredit.SetGridText( grdCredit.rows - 1, 7, txt_inv_ERate.GetData());    // txt_inv_ERate
						grdCredit.SetGridText( grdCredit.rows - 1, 8, Net_Inv_amt);    // 8.Amount Trans
						grdCredit.SetGridText( grdCredit.rows - 1, 9, Net_book_amt);    // 9 mount Book
						grdCredit.SetGridText( grdCredit.rows - 1, 10, Description);    // 10 Description
						grdCredit.SetGridText( grdCredit.rows - 1, 11, L_Description);    // 11 Local Description
						//grdCredit.SetGridText( grdCredit.rows - 1, 13, txt_tecps_requestpayment_pk.GetData()); // 13 master pk
						grdCredit.SetGridText( grdCredit.rows - 1, 15, 'C');    // 15_DRCR 
						grdCredit.SetGridText( grdCredit.rows - 1, 17, txtBRate.GetData());    // txtBRate
						grdCredit.SetGridText( grdCredit.rows - 1, 19, lstBCCY.GetData());    // 19_bookccy
						grdCredit.SetGridText( grdCredit.rows - 1, 20, txtSubPK.GetData());    // 20_tco_buspartner_pk
						grdCredit.SetGridText( grdCredit.rows - 1, 21, txttac_abplcenter_pk.GetData());    // 21_tac_abplcenter_pk--
						grdCredit.SetGridText( grdCredit.rows - 1, 22, txtSubCd.GetData());    // 22 BUS ID
						grdCredit.SetGridText( grdCredit.rows - 1, 23, txtSubNm.GetData());    // 23 BUS NM
					}
		
				}
				//----------2 Retention-----------------------
				//  alert(txtReFAMT.GetData());
				  if( Number(txtReFAMT.GetData()) !=0)
				  {
					Description = 'Holding retention of ' + req_time + ' payment for (' + txtSubNm.GetData() + ') of (' + txtSubNoCd.GetData() + ')'  ;
					L_Description ='Giữ lại tiền bảo hành tiến độ lần ' + txtreqtime.GetData() + ' cho(' + txtSubNm.GetData() + ') của hợp đồng số (' + txtSubNoCd.GetData() + ')'  ;
					grdDebit.AddRow();
					grdDebit.SetGridText( grdDebit.rows - 1, 1, txt_acc_order_pk.GetData() );  //ACPK
					grdDebit.SetGridText( grdDebit.rows - 1, 3,2);    // 3 type ref
					grdDebit.SetGridText( grdDebit.rows - 1, 4, txt_acc_order_cd.GetData() );    //Account Code '6040110000' 
					grdDebit.SetGridText( grdDebit.rows - 1, 5, txt_acc_order_nm.GetData());    //Account Name  'S/E - Outside order cost'
					grdDebit.SetGridText( grdDebit.rows - 1, 6, lst_inv_CCY.GetData());    // ccy 
					grdDebit.SetGridText( grdDebit.rows - 1, 7, txt_inv_ERate.GetData());    // txt_inv_ERate
					grdDebit.SetGridText( grdDebit.rows - 1, 8, txtRe_invAMT.GetData());    // 8.Amount Trans
					grdDebit.SetGridText( grdDebit.rows - 1, 9, txtReAMT.GetData());    // 9 mount Book
					grdDebit.SetGridText( grdDebit.rows - 1, 10, Description);    // 10 Description
					grdDebit.SetGridText( grdDebit.rows - 1, 11, L_Description);    // 11 Local Description
				   // grdDebit.SetGridText( grdDebit.rows - 1, 13, txt_tecps_requestpayment_pk.GetData()); // 13 master pk
					grdDebit.SetGridText( grdDebit.rows - 1, 15, 'D');    // 15_DRCR 
					grdDebit.SetGridText( grdDebit.rows - 1, 17, txtBRate.GetData());    // txtBRate
					grdDebit.SetGridText( grdDebit.rows - 1, 19, lstBCCY.GetData());    // 19_bookccy
					grdDebit.SetGridText( grdDebit.rows - 1, 20, txtSubPK.GetData());    // 20_tco_buspartner_pk
					grdDebit.SetGridText( grdDebit.rows - 1, 21, txttac_abplcenter_pk.GetData());    // 21_tac_abplcenter_pk--
					grdDebit.SetGridText( grdDebit.rows - 1, 22, txtSubCd.GetData());    // 22 BUS ID
					grdDebit.SetGridText( grdDebit.rows - 1, 23, txtSubNm.GetData());    // 23 BUS NM

					grdCredit.AddRow();
					grdCredit.SetGridText( grdCredit.rows - 1, 1, 2161 );  //ACPK
					grdCredit.SetGridText( grdCredit.rows - 1, 3,2);    // 3 type ref 
					grdCredit.SetGridText( grdCredit.rows - 1, 4,'331100' );    //Account Code
					grdCredit.SetGridText( grdCredit.rows - 1, 5, 'A/P - DOMESTIC TRADE');    //Account Name
					grdCredit.SetGridText( grdCredit.rows - 1, 6, lst_inv_CCY.GetData());    // ccy 
					grdCredit.SetGridText( grdCredit.rows - 1, 7, txt_inv_ERate.GetData());    // txt_inv_ERate
					grdCredit.SetGridText( grdCredit.rows - 1, 8, txtRe_invAMT.GetData());    // 8.Amount Trans
					grdCredit.SetGridText( grdCredit.rows - 1, 9, txtReAMT.GetData());    // 9 mount Book
					grdCredit.SetGridText( grdCredit.rows - 1, 10, Description);    // 10 Description
					grdCredit.SetGridText( grdCredit.rows - 1, 11, L_Description);    // 11 Local Description
					//grdCredit.SetGridText( grdCredit.rows - 1, 13, txt_tecps_requestpayment_pk.GetData()); // 13 master pk
					grdCredit.SetGridText( grdCredit.rows - 1, 15, 'C');    // 15_DRCR 
					grdCredit.SetGridText( grdCredit.rows - 1, 17, txtBRate.GetData());    // txtBRate
					grdCredit.SetGridText( grdCredit.rows - 1, 19, lstBCCY.GetData());    // 19_bookccy
					grdCredit.SetGridText( grdCredit.rows - 1, 20, txtSubPK.GetData());    // 20_tco_buspartner_pk
					grdCredit.SetGridText( grdCredit.rows - 1, 21, txttac_abplcenter_pk.GetData());    // 21_tac_abplcenter_pk--
					grdCredit.SetGridText( grdCredit.rows - 1, 22, txtSubCd.GetData());    // 22 BUS ID
					grdCredit.SetGridText( grdCredit.rows - 1, 23, txtSubNm.GetData());    // 23 BUS NM
		
				}
				//----------End Retention-----------------------
				//----------3 Vat -------------------------------
				//alert(txtVATFAMT.GetData());
				  if( Number(txtVATFAMT.GetData()) !=0)
				  {
					Description = 'Input VAT-' +  txtOrderwork_nm.GetData();
					L_Description ='Thuế GTGT HH, DV mua vào: '  +  txtOrderwork_nm.GetData();
					grdDebit.AddRow();
					grdDebit.SetGridText( grdDebit.rows - 1, 1, 2368 );  //ACPK
					grdDebit.SetGridText( grdDebit.rows - 1, 3,3);    // 3 type ref
					grdDebit.SetGridText( grdDebit.rows - 1, 4,'133110' );    //Account Code
					grdDebit.SetGridText( grdDebit.rows - 1, 5, 'VAT INPUT ON PURCHASING & SERVICES');    //Account Name
					grdDebit.SetGridText( grdDebit.rows - 1, 6, lst_inv_CCY.GetData());    // ccy 
					grdDebit.SetGridText( grdDebit.rows - 1, 7, txt_inv_ERate.GetData());    // txt_inv_ERate
					grdDebit.SetGridText( grdDebit.rows - 1, 8, txtVAT_InvAMT.GetData());    // 8.Amount Trans
					grdDebit.SetGridText( grdDebit.rows - 1, 9, txtVATAMT.GetData());    // 9 mount Book
					grdDebit.SetGridText( grdDebit.rows - 1, 10, Description);    // 10 Description
					grdDebit.SetGridText( grdDebit.rows - 1, 11, L_Description);    // 11 Local Description
				   // grdDebit.SetGridText( grdDebit.rows - 1, 13, txt_tecps_requestpayment_pk.GetData()); // 13 master pk
					grdDebit.SetGridText( grdDebit.rows - 1, 15, 'D');    // 15_DRCR 
					grdDebit.SetGridText( grdDebit.rows - 1, 17, txtBRate.GetData());    // txtBRate
					grdDebit.SetGridText( grdDebit.rows - 1, 19, lstBCCY.GetData());    // 19_bookccy
					grdDebit.SetGridText( grdDebit.rows - 1, 20, txtSubPK.GetData());    // 20_tco_buspartner_pk
					grdDebit.SetGridText( grdDebit.rows - 1, 21, txttac_abplcenter_pk.GetData());    // 21_tac_abplcenter_pk--
					grdDebit.SetGridText( grdDebit.rows - 1, 22, txtSubCd.GetData());    // 22 BUS ID
					grdDebit.SetGridText( grdDebit.rows - 1, 23, txtSubNm.GetData());    // 23 BUS NM

					grdCredit.AddRow();
					grdCredit.SetGridText( grdCredit.rows - 1, 1, 2161 );  //ACPK
					grdCredit.SetGridText( grdCredit.rows - 1, 3,3);    // 3 type ref 
					grdCredit.SetGridText( grdCredit.rows - 1, 4,'331100' );    //Account Code
					grdCredit.SetGridText( grdCredit.rows - 1, 5, 'A/P - DOMESTIC TRADE');    //Account Name
					grdCredit.SetGridText( grdCredit.rows - 1, 6, lst_inv_CCY.GetData());    // ccy 
					grdCredit.SetGridText( grdCredit.rows - 1, 7, txt_inv_ERate.GetData());    // txt_inv_ERate
					grdCredit.SetGridText( grdCredit.rows - 1, 8, txtVAT_InvAMT.GetData());    // 8.Amount Trans
					grdCredit.SetGridText( grdCredit.rows - 1, 9, txtVATAMT.GetData());    // 9 mount Book
					grdCredit.SetGridText( grdCredit.rows - 1, 10, Description);    // 10 Description
					grdCredit.SetGridText( grdCredit.rows - 1, 11, L_Description);    // 11 Local Description
					//grdCredit.SetGridText( grdCredit.rows - 1, 13, txt_tecps_requestpayment_pk.GetData()); // 13 master pk
					grdCredit.SetGridText( grdCredit.rows - 1, 15, 'C');    // 15_DRCR 
					grdCredit.SetGridText( grdCredit.rows - 1, 17, txtBRate.GetData());    // txtBRate
					grdCredit.SetGridText( grdCredit.rows - 1, 19, lstBCCY.GetData());    // 19_bookccy
					grdCredit.SetGridText( grdCredit.rows - 1, 20, txtSubPK.GetData());    // 20_tco_buspartner_pk
					grdCredit.SetGridText( grdCredit.rows - 1, 21, txttac_abplcenter_pk.GetData());    // 21_tac_abplcenter_pk--
					grdCredit.SetGridText( grdCredit.rows - 1, 22, txtSubCd.GetData());    // 22 BUS ID
					grdCredit.SetGridText( grdCredit.rows - 1, 23, txtSubNm.GetData());    // 23 BUS NM
		
				}
				//----------End Vat-----------------------
				//----------4  Deduct advance-------------------------------
				// alert(txtAdvDeduct_FAMT.GetData());
				  if( Number(txtAdvDeduct_FAMT.GetData()) !=0)
				  {
					Description = 'Deduct advance of '  + req_time + ' payment for (' + txtSubNm.GetData() + ') of (' + txtSubNoCd.GetData() + ')'  ;
					L_Description ='Trừ tiền tạm ứng tiến độ lần ' + txtreqtime.GetData() + ' cho(' + txtSubNm.GetData() + ') của hợp đồng số (' + txtSubNoCd.GetData() + ')'  ;
					grdDebit.AddRow();
					grdDebit.SetGridText( grdDebit.rows - 1, 1, txt_acc_order_pk.GetData() );  //ACPK
					grdDebit.SetGridText( grdDebit.rows - 1, 3,4);    // 3 type ref
					grdDebit.SetGridText( grdDebit.rows - 1, 4, txt_acc_order_cd.GetData() );    //Account Code  '6040110000'
					grdDebit.SetGridText( grdDebit.rows - 1, 5, txt_acc_order_nm.GetData() );    //Account Name  'S/E - Outside order cost'
					grdDebit.SetGridText( grdDebit.rows - 1, 6, lst_inv_CCY.GetData());    // ccy 
					grdDebit.SetGridText( grdDebit.rows - 1, 7, txt_inv_ERate.GetData());    // txt_inv_ERate
					grdDebit.SetGridText( grdDebit.rows - 1, 8, txtAdvDeduct_invAMT.GetData());    // 8.Amount Trans
					grdDebit.SetGridText( grdDebit.rows - 1, 9, txtAdvDeduct_AMT.GetData());    // 9 mount Book
					grdDebit.SetGridText( grdDebit.rows - 1, 10, Description);    // 10 Description
					grdDebit.SetGridText( grdDebit.rows - 1, 11, L_Description);    // 11 Local Description
					//grdDebit.SetGridText( grdDebit.rows - 1, 13, txt_tecps_requestpayment_pk.GetData()); // 13 master pk
					grdDebit.SetGridText( grdDebit.rows - 1, 15, 'D');    // 15_DRCR 
					grdDebit.SetGridText( grdDebit.rows - 1, 17, txtBRate.GetData());    // txtBRate
					grdDebit.SetGridText( grdDebit.rows - 1, 19, lstBCCY.GetData());    // 19_bookccy
					grdDebit.SetGridText( grdDebit.rows - 1, 20, txtSubPK.GetData());    // 20_tco_buspartner_pk
					grdDebit.SetGridText( grdDebit.rows - 1, 21, txttac_abplcenter_pk.GetData());    // 21_tac_abplcenter_pk--
					grdDebit.SetGridText( grdDebit.rows - 1, 22, txtSubCd.GetData());    // 22 BUS ID
					grdDebit.SetGridText( grdDebit.rows - 1, 23, txtSubNm.GetData());    // 23 BUS NM

					grdCredit.AddRow();
					grdCredit.SetGridText( grdCredit.rows - 1, 1, 2163 );  //ACPK
					grdCredit.SetGridText( grdCredit.rows - 1, 3,4);    // 3 type ref 
					grdCredit.SetGridText( grdCredit.rows - 1, 4,'331300' );    //Account Code
					grdCredit.SetGridText( grdCredit.rows - 1, 5, 'ADVANCE TO VENDOR - DOMESTIC TRADE');    //Account Name
					grdCredit.SetGridText( grdCredit.rows - 1, 6, lst_inv_CCY.GetData());    // ccy 
					grdCredit.SetGridText( grdCredit.rows - 1, 7, txt_inv_ERate.GetData());    // txt_inv_ERate
					grdCredit.SetGridText( grdCredit.rows - 1, 8, txtAdvDeduct_invAMT.GetData());    // 8.Amount Trans
					grdCredit.SetGridText( grdCredit.rows - 1, 9, txtAdvDeduct_AMT.GetData());    // 9 mount Book
					grdCredit.SetGridText( grdCredit.rows - 1, 10, Description);    // 10 Description
					grdCredit.SetGridText( grdCredit.rows - 1, 11, L_Description);    // 11 Local Description
					//grdCredit.SetGridText( grdCredit.rows - 1, 13, txt_tecps_requestpayment_pk.GetData()); // 13 master pk
					grdCredit.SetGridText( grdCredit.rows - 1, 15, 'C');    // 15_DRCR 
					grdCredit.SetGridText( grdCredit.rows - 1, 17, txtBRate.GetData());    // txtBRate
					grdCredit.SetGridText( grdCredit.rows - 1, 19, lstBCCY.GetData());    // 19_bookccy
					grdCredit.SetGridText( grdCredit.rows - 1, 20, txtSubPK.GetData());    // 20_tco_buspartner_pk
					grdCredit.SetGridText( grdCredit.rows - 1, 21, txttac_abplcenter_pk.GetData());    // 21_tac_abplcenter_pk--
					grdCredit.SetGridText( grdCredit.rows - 1, 22, txtSubCd.GetData());    // 22 BUS ID
					grdCredit.SetGridText( grdCredit.rows - 1, 23, txtSubNm.GetData());    // 23 BUS NM
		
				}
				//---------- End 4 Deduct advance-----------------------
				//----------5  Withholding tax-------------------------------
				//alert(txtWithFAMT.GetData());
				  if( Number(txtWithFAMT.GetData()) !=0)
				  {
					Description = 'Holding withholding tax of '  + req_time + ' payment for (' + txtSubNm.GetData() + ') of (' + txtSubNoCd.GetData() + ')'  ;
					L_Description ='Giữ lại thuế nhà thầu tiến độ lần ' + txtreqtime.GetData() + ' cho(' + txtSubNm.GetData() + ') của hợp đồng số (' + txtSubNoCd.GetData() + ')'  ;
					grdDebit.AddRow();
					grdDebit.SetGridText( grdDebit.rows - 1, 1, txt_acc_order_pk.GetData() );  //ACPK
					grdDebit.SetGridText( grdDebit.rows - 1, 3,5);    // 3 type ref
					grdDebit.SetGridText( grdDebit.rows - 1, 4, txt_acc_order_cd.GetData() );    //Account Code '6040110000' 
					grdDebit.SetGridText( grdDebit.rows - 1, 5, txt_acc_order_nm.GetData() );    //Account Name  'S/E - Outside order cost'
					grdDebit.SetGridText( grdDebit.rows - 1, 6, lst_inv_CCY.GetData());    // ccy 
					grdDebit.SetGridText( grdDebit.rows - 1, 7, txt_inv_ERate.GetData());    // txt_inv_ERate
					grdDebit.SetGridText( grdDebit.rows - 1, 8, txtWith_InvAMT.GetData());    // 8.Amount Trans
					grdDebit.SetGridText( grdDebit.rows - 1, 9, txtWithAMT.GetData());    // 9 mount Book
					grdDebit.SetGridText( grdDebit.rows - 1, 10, Description);    // 10 Description
					grdDebit.SetGridText( grdDebit.rows - 1, 11, L_Description);    // 11 Local Description
				  //  grdDebit.SetGridText( grdDebit.rows - 1, 13, txt_tecps_requestpayment_pk.GetData()); // 13 master pk
					grdDebit.SetGridText( grdDebit.rows - 1, 15, 'D');    // 15_DRCR 
					grdDebit.SetGridText( grdDebit.rows - 1, 17, txtBRate.GetData());    // txtBRate
					grdDebit.SetGridText( grdDebit.rows - 1, 19, lstBCCY.GetData());    // 19_bookccy
					grdDebit.SetGridText( grdDebit.rows - 1, 20, txtSubPK.GetData());    // 20_tco_buspartner_pk
					grdDebit.SetGridText( grdDebit.rows - 1, 21, txttac_abplcenter_pk.GetData());    // 21_tac_abplcenter_pk--
					grdDebit.SetGridText( grdDebit.rows - 1, 22, txtSubCd.GetData());    // 22 BUS ID
					grdDebit.SetGridText( grdDebit.rows - 1, 23, txtSubNm.GetData());    // 23 BUS NM

					grdCredit.AddRow();
					grdCredit.SetGridText( grdCredit.rows - 1, 1, 2672 );  //ACPK
					grdCredit.SetGridText( grdCredit.rows - 1, 3,5);    // 3 type ref 
					grdCredit.SetGridText( grdCredit.rows - 1, 4,'2105910003' );    //Account Code
					grdCredit.SetGridText( grdCredit.rows - 1, 5, 'Withholding business income tax payable');    //Account Name
					grdCredit.SetGridText( grdCredit.rows - 1, 6, lst_inv_CCY.GetData());    // ccy 
					grdCredit.SetGridText( grdCredit.rows - 1, 7, txt_inv_ERate.GetData());    // txt_inv_ERate
					grdCredit.SetGridText( grdCredit.rows - 1, 8, txtWith_InvAMT.GetData());    // 8.Amount Trans
					grdCredit.SetGridText( grdCredit.rows - 1, 9, txtWithAMT.GetData());    // 9 mount Book
					grdCredit.SetGridText( grdCredit.rows - 1, 10, Description);    // 10 Description
					grdCredit.SetGridText( grdCredit.rows - 1, 11, L_Description);    // 11 Local Description
					//grdCredit.SetGridText( grdCredit.rows - 1, 13, txt_tecps_requestpayment_pk.GetData()); // 13 master pk
					grdCredit.SetGridText( grdCredit.rows - 1, 15, 'C');    // 15_DRCR 
					grdCredit.SetGridText( grdCredit.rows - 1, 17, txtBRate.GetData());    // txtBRate
					grdCredit.SetGridText( grdCredit.rows - 1, 19, lstBCCY.GetData());    // 19_bookccy
					grdCredit.SetGridText( grdCredit.rows - 1, 20, 2519);    // CUC THUE DONG NAI
					grdCredit.SetGridText( grdCredit.rows - 1, 21, txttac_abplcenter_pk.GetData());    // 21_tac_abplcenter_pk--
					grdCredit.SetGridText( grdCredit.rows - 1, 22, 'CUC001');    // 22_BUS_ID
					grdCredit.SetGridText( grdCredit.rows - 1, 23, 'Cục thuế Đồng Nai');    // 23_BUS_NM--
		
				}
				
				//---------- End 5  Withholding tax-------------------------------
				/*if (txtReqStatus.text != '')
				{
					alert(txtReqStatus.text);
					btnSave.SetEnable(false);
				}
				else
				{
					btnSave.SetEnable(true);
				}*/
      
}
//-------------------------------------------------------------------------------
function ReqAMT()
{
	dso_req_amt.Call();
}
//-------------------------------------------------------------------------------
function format_number(dec, fix) 
{
	fixValue = parseFloat(Math.pow(10,fix));
	rtn_value = parseInt(Math.round(dec * fixValue)) / fixValue;	
	return rtn_value ;
}
//--------------------------------------------------------------------------------
function Changbookamt()
{
	// Invoice
	var sum_deduct_amt = Number(txtRe_invAMT.GetData() ) + Number( txtWith_InvAMT.GetData()) +  Number(txtAdvDeduct_invAMT.GetData()) +  Number(txtVATDeduct_InvAMT.GetData());
	    txtTotalDe_InvAMT.SetDataText(sum_deduct_amt);
	var this_pay_amt  = Number(txtReq_Inv_AMT.GetData()) + Number(txtVAT_InvAMT.GetData())  - Number(txtTotalDe_InvAMT.GetData());
    txtThisPay_InvAMT.SetDataText(this_pay_amt);

    // booking 
    sum_deduct_amt = System.Round( Number(txtReAMT.GetData() ),2) + System.Round( Number( txtWithAMT.GetData()),2) + System.Round(  Number(txtAdvDeduct_AMT.GetData()),2) +  System.Round( Number(txtVATDeduct_AMT.GetData()),2);
	txtTotalDeAMT.SetDataText(sum_deduct_amt);
	this_pay_amt  = System.Round( Number(txtReqAMT.GetData()) ,2) + System.Round( Number(txtVATAMT.GetData()),2)  - System.Round( Number(txtTotalDeAMT.GetData()),2);
    txtThisPayAMT.SetDataText(this_pay_amt);
	
}
//--------------------------------------------------------------------------------
function OnChangeText()
{
//	alert();
	// caculate book amt

    var sum_deduct_famt = Number(txtReFAMT.GetData() ) + Number( txtWithFAMT.GetData()) +  Number(txtAdvDeduct_FAMT.GetData()) + Number(txtVATDeduct_FAMT.GetData());
	//alert(sum_deduct_famt);
    txtTotalDeFAMT.SetDataText(sum_deduct_famt);
	var this_pay_famt  = Number(txtReqFAMT.GetData()) + Number(txtVATFAMT.GetData())  - Number(txtTotalDeFAMT.GetData());
    txtThisPayFAMT.SetDataText(this_pay_famt);
    var book_amt = 0;
	for(var i=1; i< grdDebit.rows ; i++ )
	{
		grdDebit.SetGridText(i,17,txtBRate.GetData());
		if (txtBRate.GetData() != 0)
		{
			book_amt = Number( grdDebit.GetGridData(i,8)) * Number( grdDebit.GetGridData(i,7)) / Number(txtBRate.GetData());
			grdDebit.SetGridText(i,9,System.Round(book_amt,2));
            book_amt=0;
		}
        
	}
    for(var i=1; i< grdCredit.rows ; i++ )
	{
		grdCredit.SetGridText(i,17,txtBRate.GetData());

		if (txtBRate.GetData() != 0)
		{
			book_amt = Number( grdCredit.GetGridData(i,8)) * Number( grdCredit.GetGridData(i,7)) / Number(txtBRate.GetData());
			grdCredit.SetGridText(i,9,System.Round(book_amt,2));
			book_amt=0;
		}
	}
	if (lstBCCY.GetData() == 'USD')
	{
		if(Number(txtBRate.text) !=0 )
		{
			txtReqAMT.text = format_number( Number(txtReqFAMT.GetData()) * Number(txtOrderERate.GetData()) / Number(txtBRate.GetData()),2);
			txtVATAMT.text = format_number( Number(txtVATFAMT.GetData()) * Number(txtOrderERate.GetData()) / Number(txtBRate.GetData()),2);
            txtReAMT.text = format_number( Number(txtReFAMT.GetData()) * Number(txtOrderERate.GetData()) / Number(txtBRate.GetData()),2);
			txtWithAMT.text = format_number( Number(txtWithFAMT.GetData()) * Number(txtOrderERate.GetData()) / Number(txtBRate.GetData()),2);
			txtAdvDeduct_AMT.text = format_number( Number(txtAdvDeduct_FAMT.GetData()) * Number(txtOrderERate.GetData()) / Number(txtBRate.GetData()),2);
			txtVATDeduct_AMT.text = format_number( Number(txtVATDeduct_FAMT.GetData()) * Number(txtOrderERate.GetData()) / Number(txtBRate.GetData()),2);
            txtTotalDeAMT.text = format_number( Number(txtTotalDeFAMT.GetData()) * Number(txtOrderERate.GetData()) / Number(txtBRate.GetData()),2);
			txtThisPayAMT.text = format_number( Number(txtThisPayFAMT.GetData()) * Number(txtOrderERate.GetData()) / Number(txtBRate.GetData()),2);
        }

    }else{
		  
			txtReqAMT.text = format_number( Number(txtReqFAMT.GetData()) * Number(txtOrderERate.GetData()) * Number(txtBRate.GetData()),0);
			txtVATAMT.text = format_number( Number(txtVATFAMT.GetData()) * Number(txtOrderERate.GetData()) * Number(txtBRate.GetData()),0);
            txtReAMT.text = format_number( Number(txtReFAMT.GetData()) * Number(txtOrderERate.GetData()) * Number(txtBRate.GetData()),0);
			txtWithAMT.text = format_number( Number(txtWithFAMT.GetData()) * Number(txtOrderERate.GetData()) * Number(txtBRate.GetData()),0);
			txtAdvDeduct_AMT.text = format_number( Number(txtAdvDeduct_FAMT.GetData()) * Number(txtOrderERate.GetData()) * Number(txtBRate.GetData()),0);
			txtVATDeduct_AMT.text = format_number( Number(txtVATDeduct_FAMT.GetData()) * Number(txtOrderERate.GetData()) * Number(txtBRate.GetData()),0);
            txtTotalDeAMT.text = format_number( Number(txtTotalDeFAMT.GetData()) * Number(txtOrderERate.GetData()) * Number(txtBRate.GetData()),0);
			txtThisPayAMT.text = format_number( Number(txtThisPayFAMT.GetData()) * Number(txtOrderERate.GetData()) * Number(txtBRate.GetData()),0);
	}
    // caculate invoice amt
    if (lst_inv_CCY.GetData() == 'VND')
	{
		txtReq_Inv_AMT.text = format_number( Number(txtReqFAMT.GetData()) * Number(txtOrderERate.GetData()) ,0);
		txtVAT_InvAMT.text = format_number( Number(txtVATFAMT.GetData()) * Number(txtOrderERate.GetData()) ,0);
		txtRe_invAMT.text = format_number( Number(txtReFAMT.GetData()) * Number(txtOrderERate.GetData()),0);
		txtWith_InvAMT.text = format_number( Number(txtWithFAMT.GetData()) * Number(txtOrderERate.GetData()),0);
		txtAdvDeduct_invAMT.text = format_number( Number(txtAdvDeduct_FAMT.GetData()) * Number(txtOrderERate.GetData()),0);
		txtVATDeduct_InvAMT.text = format_number( Number(txtVATDeduct_FAMT.GetData()) * Number(txtOrderERate.GetData()),0);
		txtTotalDe_InvAMT.text = format_number( Number(txtTotalDeFAMT.GetData()) * Number(txtOrderERate.GetData()),0);
		txtThisPay_InvAMT.text = format_number( Number(txtThisPayFAMT.GetData()) * Number(txtOrderERate.GetData()) ,0);
		

    }else{
		  
		if(Number(txt_inv_ERate.GetData()) !=0 )
		{
			txtReq_Inv_AMT.text = format_number( Number(txtReqFAMT.GetData()) * Number(txtOrderERate.GetData()) / Number(txt_inv_ERate.GetData()),2);
			txtVAT_InvAMT.text = format_number( Number(txtVATFAMT.GetData()) * Number(txtOrderERate.GetData()) / Number(txt_inv_ERate.GetData()),2);
            txtRe_invAMT.text = format_number( Number(txtReFAMT.GetData()) * Number(txtOrderERate.GetData()) / Number(txt_inv_ERate.GetData()),2);
			txtWith_InvAMT.text = format_number( Number(txtWithFAMT.GetData()) * Number(txtOrderERate.GetData()) / Number(txt_inv_ERate.GetData()),2);
			txtAdvDeduct_invAMT.text = format_number( Number(txtAdvDeduct_FAMT.GetData()) * Number(txtOrderERate.GetData()) / Number(txt_inv_ERate.GetData()),2);
			txtVATDeduct_InvAMT.text = format_number( Number(txtVATDeduct_FAMT.GetData()) * Number(txtOrderERate.GetData()) / Number(txt_inv_ERate.GetData()),2);
            txtTotalDe_InvAMT.text = format_number( Number(txtTotalDeFAMT.GetData()) * Number(txtOrderERate.GetData()) / Number(txt_inv_ERate.GetData()),2);
			txtThisPay_InvAMT.text = format_number( Number(txtThisPayFAMT.GetData()) * Number(txtOrderERate.GetData()) / Number(txt_inv_ERate.GetData()),2);
        }	
	}


}
//-------------------------------------------------------------------------------------------------
function ChangeCB()
{
	Enablebutton();
	if (txtProjectPK.text != '')
	{
		if (lstPPDes.value == '01')
		{
			txtSeq.SetReadOnly(true);
			txtReqFAMT.SetReadOnly(false);
			txtReq_Inv_AMT.SetReadOnly(false);
		    txtReqAMT.SetReadOnly(false);
            txtDes.text = 'Advance payment for (' + txtSubNm.GetData() + ') of (' + txtSubNoCd.GetData() + ')'  ;
			txtLDes.text =  'Thanh toán tạm ứng cho (' + txtSubNm.GetData() + ') của hợp đồng số (' + txtSubNoCd.GetData() + ')'  ;

		}
		else{
			txtSeq.SetReadOnly(false);
			txtReqFAMT.SetReadOnly(true);
			txtReq_Inv_AMT.SetReadOnly(true);
			txtReqAMT.SetReadOnly(true);
			var req_time ='' ;
			switch(txtreqtime.GetData())
			{
				case '0':
				break;
				case '1':
				case '21':
					req_time = txtreqtime.GetData() + 'st' ;
				break;
                case '2':
				case '22':
					req_time = txtreqtime.GetData() + 'nd' ;
				break;
				case '3':
				case '23': 
				   req_time = txtreqtime.GetData() + 'rd' ;
				break;
				case '4':
				case '5':
				case '6':
				case '7':
				case '8':
				case '9':
				case '10':
				case '11':
				case '12':
				case '13':
				case '14':
				case '15':
				case '16':
				case '17':
				case '18':
				case '19':
				case '20':
				case '24':
				case '25':
				case '26':
				case '27':
				case '28':
				case '29':
				case '30':
					req_time = txtreqtime.GetData() + 'th' ;
				break;
				
			}
			txtDes.text =  req_time + ' payment for (' + txtSubNm.GetData() + ') of (' + txtSubNoCd.GetData() + ')'  ;
			txtLDes.text =  'Thanh toán tiến độ lần ' + txtreqtime.GetData() + ' cho(' + txtSubNm.GetData() + ') của hợp đồng số (' + txtSubNoCd.GetData() + ')'  ;
	    }

		dso_req_amt.Call();
	}
	else
	{
		alert('Please, select Project !!!');
	}
}
//----------------------------------------------------------------------------------------------------
function SetReqMonth()
{
    if (lstPPDes.value == '01')
	{
		// fixed - no change
		dtProFrom.acceptnull = "true";
		dtProTo.acceptnull = "true";
        dtProFrom.SetData('');
		dtProTo.SetData('');
		dtProFrom.acceptnull="false";
		dtProTo.acceptnull="false";
	}
}
//----------------------------------------------------------------------------------------------------
function OnShow() 
    {
        var vendor1 = document.all("_1");
        var vendor2 = document.all("_2");
        var vendor3 = document.all("_3");
        var vendor4 = document.all("_4");
        var vendor5 = document.all("_5");
        if (vendor1.style.display == "none" && vendor2.style.display == "none" && vendor3.style.display == "none" && vendor4.style.display == "none" && vendor5.style.display == "none") 
        {
            vendor1.style.display = "";
            vendor2.style.display = "";
            vendor3.style.display = "";
            vendor4.style.display = "";
            vendor5.style.display = "";
            imgup.src = "../../../system/images/up.gif";
        }
        else 
        {
            vendor1.style.display = "none";
            vendor2.style.display = "none";
            vendor3.style.display = "none";
            vendor4.style.display = "none";
            vendor5.style.display = "none";
            imgup.src = "../../../system/images/down.gif";
        }
    }
//----------------------------------------------------------------
function onDisplaybutton()
{
    switch(lblStatus.text)
	{
		case 'Saved':
			 btconfirm.SetEnable(true);
		break;

		case 'Confirmed':
			 btconfirm.SetEnable(false);
			 btnNew.SetEnable(true);
		break;
		case '':
		    btnNew.SetEnable(false);
		break;

	}
   
}
//----------------------------------------------------------------
function OnChangeCCY()
{
	dso_exrate.Call();
}
//----------------------------------------------------------------
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
            txt_tecps_requestpaymentd_pk.SetDataText(grdDebit.GetGridData(grdDebit.selrow, 0));
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
	/*    if (event.col == 9){
        
          var col_3='';
          col_3 = grdCredit.GetGridData(grdCredit.row,3);
         
          if(txtEACAB032.GetData()=='N' && col_3==1 ){
             grdCredit.row=-1;
            return;
           } 
        }
		*/
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
            txt_tecps_requestpaymentd_pk.SetDataText(grdCredit.GetGridData(grdCredit.selrow, 0));
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
//---------------------------------------------------------------
function ItemStyle()
{
	var ctrl = idGridItem.GetGridControl();
	var j = 1;
	var i = ctrl.rows - 1;
	if(i > 0){
	    OnCtrToggleLeft();
	}
	else{
	    OnCtrToggleRight();
	}
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
	
	   for(var i=1;i<idGridItem.rows;i++){
		 if(idGridItem.GetGridData( i, 8) == 'CONTRACT NOAP' && idGridItem.GetGridData( i, 9) == '' ){
			 idGridItem.SetGridText(i,  9, txt_TAC_CRSUBCONTRACT_cd.GetData()) ;//ITEM CODE
             idGridItem.SetGridText(i, 10, txt_TAC_CRSUBCONTRACT_nm.GetData()) ;//ITEM NAME
             idGridItem.SetGridText(i, 11, "TAC_CRSUBCONTRACT") ;//TABLE NAME 
             idGridItem.SetGridText(i, 12, txt_TAC_CRSUBCONTRACT_pk.GetData()) ;//TABLE PK 

		 }
		  if(idGridItem.GetGridData( i, 8) == 'CUSTOMER' && idGridItem.GetGridData( i, 9) == '' ){
			 idGridItem.SetGridText(i,  9, txtSubCd.GetData()) ;//ITEM CODE
             idGridItem.SetGridText(i, 10, txtSubNm.GetData()) ;//ITEM NAME
             idGridItem.SetGridText(i, 12, txtSubPK.GetData()) ;//TABLE PK 

		 }
		 if(idGridItem.GetGridData( i, 8) == 'PL UNIT' && idGridItem.GetGridData( i, 9) == '' ){
			 idGridItem.SetGridText(i,  9, txtProjectCd.GetData()) ;//ITEM CODE
             idGridItem.SetGridText(i, 10, txtProjectNm.GetData()) ;//ITEM NAME
             idGridItem.SetGridText(i, 12, txttac_abplcenter_pk.GetData()) ;//TABLE PK 

		 }
	   }
}

function SetDetailCtlItem()
{
  // alert(idGridItem.rows)
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
	            
	         // alert('itemal=' + itemal + ',itemal2=' + itemal2 + ',item=' + item); 
	        //  alert('item2=' + item2 + ',itemnm2=' + itemnm2 + ',itempk2=' + itempk2);
	           
	            if ((itemal == itemal2) && (item == '') && (txtEACAB018.GetData()=='Y'))
	            {
	            ///    alert('ww');
	                idGridItem.SetGridText( i ,  9, item2);
			        idGridItem.SetGridText( i , 10, itemnm2);
			        idGridItem.SetGridText( i , 12, itempk2);
	            }
	        }
	    }
    }
    if (txtDRCRtype.GetData() == 'D') 
    {
        grdDebit.SelectRow(txt_rowclick.text);
    }
    else
    {
        grdCredit.SelectRow(txt_rowclick.text);
    }
}
//----------------------------------------------------------------
function OnCtrToggleLeft()
{
    var left  = document.all("tdGrid");
    var right = document.all("tdControlItem");
    var imgArrow = document.all("imgArrow");
    
    right.style.display="";
    imgArrow.status = "collapse";
    left.style.width="60%";
    imgArrow.src = "../../../system/images/next_orange.gif";
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
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
}
//----------------------------------------------------------------
function OnSaveDr()
{
   /*  for (i = 1; i < grdDebit.rows; i++)
     {
        if (grdDebit.GetGridData(i,0) != '')
		{
			 if(!CheckDataIsValid()) return;
		}
	 }*/
    
    // SetItemToGridTmp();
    
    if ((txtDRCRtype.GetData() == 'D') && (grdDebit.rows > 1))
    {
        for (i = 1; i < grdDebit.rows; i++)
        {
            if ((grdDebit.GetGridData(i, 13) == "") && (grdDebit.GetGridData(i, 9) != ''))
            {
                grdDebit.SetGridText(i, 13, txt_tecps_requestpayment_pk.GetData());
                grdDebit.SetRowStatus(i, 0x20);
            }            
            if (grdDebit.GetGridData(i, 9) == '')
            {
                grdDebit.SetGridText(i, 13, txt_tecps_requestpayment_pk.GetData());
                grdDebit.SetGridText(i, 8, 0);
                grdDebit.SetGridText(i, 9, 0);
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
                if (grdDebit.GetGridData(i, 9) == '')
                {
                    grdDebit.SetGridText(i, 13, txt_tecps_requestpayment_pk.GetData());
                }
                grdDebit.SetGridText(i, 14, i - j);
            }
        }
        txt_rowclick.text = grdDebit.selrow;
        dso_kpcs319_dtl_debit.Call();
    }
}

function OnSaveCr()
{
   /*  for (i = 1; i < grdCredit.rows; i++)
     {
        if (grdCredit.GetGridData(i,0) != '')
		{
			 if(!CheckDataIsValid()) return;
		}
	 }
   */
   
    
   //  SetItemToGridTmp();
    
    if ((txtDRCRtype.GetData() == 'C') && (grdCredit.rows > 1))
    {
        for (i = 1; i < grdCredit.rows; i++)
        {
            if ((grdCredit.GetGridData(i, 13) == "") && (grdCredit.GetGridData(i, 9) != ''))
            {
                grdCredit.SetGridText(i, 13, txt_tecps_requestpayment_pk.GetData());
                grdCredit.SetRowStatus(i, 0x20);
            }
            if (grdCredit.GetGridData(i, 9) == '')
            {
                grdCredit.SetGridText(i, 13, txt_tecps_requestpayment_pk.GetData());
                grdCredit.SetGridText(i, 8, 0);
                grdCredit.SetGridText(i, 9, 0);
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
                if (grdCredit.GetGridData(i, 9) == '')
                {
                    grdCredit.SetGridText(i, 13, txt_tecps_requestpayment_pk.GetData());
                }
                grdCredit.SetGridText(i, 14, i - j);
            }
        }
        txt_rowclick.text = grdCredit.selrow;
        dso_kpcs319_dtl_credit.Call();
    }
}
//------------------------------------------------------------------------------------------------
function ClickItemControl()
{    
	var flg = "0";
	var ctrl = idGridItem.GetGridControl();
	
	if (idGridItem.GetGridData( ctrl.row, 2) == '-1')
	{
		flg = "2";
		var path = System.RootURL + '/form/61/05/61050020_popup2.aspx';
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
	    var fpath   = System.RootURL + "/form/61/05/61050080_popup.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=pm_sel_61050080_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
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
	    var fpath   = System.RootURL + "/form/61/05/61050080_popup2.aspx?contract_type=SALE&company=" + lstCompany.GetData();
        var object  = System.OpenModal(fpath , 900 , 600 , 'resizable:yes;status:yes'); 
        if ( object.length > 0 ){
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
    else if(idGridItem.GetGridData( idGridItem.row, 8) == 'CONTRACT NOAP'){
	    var fpath   = System.RootURL + "/form/61/05/61050080_popup2.aspx?contract_type=BUY";
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
				
				var fpath   = System.RootURL + "/form/61/05/61050080_popup.aspx?comm_code="+ "" + "&comm_nm=" + ls_str + "&company=" + lstCompany.GetData() + '&dsqlid=pm_sel_61050080_itemnm_popup&col_code=' + ls_temp +" CODE" + '&col_nm=' + ls_temp + " NAME";
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
					    var fpath   = System.RootURL + "/form/61/05/61050080_popup.aspx?comm_code="+ "" + "&comm_nm=" + "" + "&val1=" + ls_ccy + "&company="+ lstCompany.GetData() + '&dsqlid=pm_sel_61050080_bank_popup&col_code=' + 'Bank Code'  + '&col_nm=' + 'Bank Name';
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
					    
					    var fpath   = System.RootURL + "/form/61/05/61050080_popup.aspx?comm_code="+ "" + "&comm_nm=" + "" + "&val1=" + ls_ccy + "&company="+ lstCompany.GetData() + '&dsqlid=pm_sel_6105008_BFBENEFICIARY&col_code=' + ' Beneficiary Bank '  + '&col_nm=' + 'Account No';
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
							var fpath   = System.RootURL + "/form/61/05/61050080_popup3.aspx";
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
//----------------------ok-------------------------------------------------------
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
				  //  alert(grdDebit.GetGridData(grdDebit.row, 0));
                    idGridItem.SetGridText(i, 1, grdDebit.GetGridData(grdDebit.row, 0));
                    idGridItem.SetRowStatus(i, 0x20);
                }
                txtacpk.SetDataText(grdDebit.GetGridData(txt_rowclick.text, 1));
                txt_tecps_requestpaymentd_pk.SetDataText(grdDebit.GetGridData(txt_rowclick.text, 0));
            }
            else if (txtDRCRtype.GetData() == 'C')
            {
                if (idGridItem.GetGridData(i, 0) == '')
                {
                    idGridItem.SetGridText(i, 1, grdCredit.GetGridData(txt_rowclick.text, 0));
                    idGridItem.SetRowStatus(i, 0x20);
                }
                
                txtacpk.SetDataText(grdCredit.GetGridData(txt_rowclick.text, 1));
                txt_tecps_requestpaymentd_pk.SetDataText(grdCredit.GetGridData(txt_rowclick.text, 0));
            }
	    }
	    dso_upd_ctl_item.Call("");
    }
}
//---------------------ok-------------------------------------------
function OnTreament()
{
	
	SaveItemControl();
	
   /*if(txtDRCRtype.GetData() == 'C')
   {
      if (grdCredit.GetGridData(grdCredit.row,0) == '')
      {
		 OnSaveCr();
      }else
	  {
		SaveItemControl();
	  }
	 
   }
	else
	{
	 if (grdDebit.GetGridData(grdDebit.row,0) == '')
      {
		 OnSaveDr();
      }else
	  {
		SaveItemControl();
	  }
		
	}
  // */
}
//---------------------ok-------------------------------------------
function CanChange(){
    switch(lblStatus.GetData()){
       
        case "Saved": return true;
        case "Confirmed":alert("This voucher was confirmed. So you can not change !.\n Số phiếu này đã được xác nhận. Bạn không thể thay đổi !");
                 return false;
        break;
       
    }
    return true;
}
//----------------------------------------------------------------
function CheckDataIsValid(){
    if(!CanChange()) return false;
    
    if (txt_tecps_requestpayment_pk.GetData() == ''){
        alert('  Save Master and then Treament'+'\n'+'Bạn lưu lại trước sau đó Treament');
        return false;
    }
    //    Check Item Control
    if ((grdDebit.selrow < 1) && (grdCredit.selrow < 1)){
        return false;
    }
    var ctrl = idGridItem.GetGridControl();
	var j = 1;
	var i = ctrl.rows - 1;
	while (j <= i){
		var man         = idGridItem.GetGridData(j,6);
		var itemtitle   = idGridItem.GetGridData(j,8);
		var item        = idGridItem.GetGridData(j,9);
		if(man == "Y" & (item == "" || item == "-")){
			alert('           '+ itemtitle + ' is mandatory. Please input!!!'+'\n'+ itemtitle +' thông tin bắt buộc nhập. Vui lòng nhập vào!!!');
			return false;
		}
		j = j + 1;
	}
	return true;
}
//---------------------------------------------------------------
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
            dso_kpcs319_dtl_debit.Call();
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
                dso_kpcs319_dtl_credit.Call();
            }
        }
    }
}
//-------------------------------------------------------------------------------------------
function DBPopupClick_DR()
{
    if (event.col == 4)
	{
	    Popup_OnSelect_Acc('D');
    }
}

function DBPopupClick_CR()
{
    if (event.col == 4)
	{
	    Popup_OnSelect_Acc('C');
    }
}
//--------------------------------------------------------------------------------------------
function Popup_OnSelect_Acc(p_data)
{
    if(!CanChange()) return;
    var fpath   = System.RootURL + "/form/61/05/61050080_popup_Transaction.aspx?dsqlid=pm_sel_61050080_tran_acc" + "&p_type=";
	var aValue = System.OpenModal(  fpath , 750 , 550 , 'resizable:yes;status:yes');
		
	if (aValue != null)
	{
		//alert(p_data);
		 var tmp = aValue[0];
		if(p_data == 'D')
		{
			 grdDebit.SetGridText( grdDebit.selrow, 1, tmp[1]);
			 grdDebit.SetGridText( grdDebit.selrow, 4, tmp[2]);
			 grdDebit.SetGridText( grdDebit.selrow, 5, tmp[3]);
        }else{
		   alert(tmp[1]);
			grdCredit.SetGridText( grdCredit.selrow, 1, tmp[1]);//
			grdCredit.SetGridText( grdCredit.selrow, 4, tmp[2]);//
			grdCredit.SetGridText( grdCredit.selrow, 5, tmp[3]);//
		}
	}

  
}
//---------------------------------------------------------------
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
//----------------------------------------------------------------
function OnSumCR()
{
    var ctrl = grdCredit.GetGridControl();
    var sum_cr_famt = 0; 
    var sum_cr_amt  = 0;
    for (i = 1; i < ctrl.rows; i++)
	{
	     sum_cr_famt = format_number( sum_cr_famt,0) + format_number( Number(grdCredit.GetGridData(i, 8)),0);
	     sum_cr_amt  = format_number( sum_cr_amt,2)  + format_number( Number(grdCredit.GetGridData(i, 9)),2);
	}
	txtsum_total_cr_famt.text = "" + format_number(sum_cr_famt,2);
	txtsum_total_cr_amt.text = "" + format_number(sum_cr_amt,2);
}

function OnSumDR()
{
    var ctrl = grdDebit.GetGridControl();
    var sum_dr_famt = 0;
    var sum_dr_amt  = 0;
    for (i = 1; i < ctrl.rows; i++)
	{
	     sum_dr_famt =format_number( Number(sum_dr_famt),0) + format_number( Number(grdDebit.GetGridData(i, 8)),0);
	     sum_dr_amt  = format_number( Number(sum_dr_amt),2)  + format_number( Number(grdDebit.GetGridData(i, 9)),2);
	}
	txtsum_total_dr_famt.text = "" + format_number(sum_dr_famt,2);
	txtsum_total_dr_amt.text = "" + format_number(sum_dr_amt,2);
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
			sum_dr_famt = format_number( Number(sum_dr_famt),0) + format_number( Number(grdDebit.GetGridData(i, 8)),0);
			sum_dr_amt  = format_number( Number(sum_dr_amt) ,2)  + format_number(  Number(grdDebit.GetGridData(i, 9)) ,2);
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
			sum_cr_famt = format_number( Number(sum_cr_famt),0) + format_number( Number(grdCredit.GetGridData(i, 8)) ,0);
			sum_cr_amt  = format_number( Number(sum_cr_amt) ,2) + format_number( Number(grdCredit.GetGridData(i, 9)) ,2);
		}
	}
	txtsum_chk_cr_famt.SetDataText('' + sum_cr_famt);
	txtsum_chk_cr_amt.SetDataText(''  + sum_cr_amt);
	OnSumCR();
}
//----------------------------------------------------------------
function OnAutoYN(){

}
//----------------------------------------------------------------
function RowEditDR(){
     var book_amt = 0;
	if (event.col== 7 || event.col == 8 || event.col == 17)
	{
	    book_amt =0;
		if (Number( grdDebit.GetGridData(grdDebit.row,17)) !=0 )
		{
			book_amt = Number( grdDebit.GetGridData(grdDebit.row,8)) * Number( grdDebit.GetGridData(grdDebit.row,7)) / Number( grdDebit.GetGridData(grdDebit.row,17));
			book_amt = format_number(book_amt,2);
            grdDebit.SetGridText(grdDebit.row,9,System.Round(book_amt,2));
		}
		
	}
}
//----------------------------------------------------------------
function RowEditCR(){
	  var book_amt = 0;
	if (event.col== 7 || event.col == 8 || event.col == 17)
	{
	    book_amt =0;
		if (Number( grdCredit.GetGridData(grdCredit.row,17)) !=0 )
		{
			book_amt = Number( grdCredit.GetGridData(grdCredit.row,8)) * Number( grdCredit.GetGridData(grdCredit.row,7)) / Number( grdCredit.GetGridData(grdCredit.row,17));
			book_amt = format_number(book_amt,2);
            grdCredit.SetGridText(grdCredit.row,9,System.Round(book_amt,2));
		}
		
	}
}
//----------------------------------------------------------------
function makeslip()
{
	if (tac_hgtrh_pk.text != '')
	{
		alert('Already Confirm Slip ' + txtReqNo.text);
	}
	else
	{			
		if (confirm('Are you sure Make Slip for [' + txtReqNo.text + '] ?'))
		{
			if (txt_tecps_requestpayment_pk.text != '')
			{
				flag_update = true;
				txtAction.text = "INSERT";
				dso_MakeSlip.Call();
			}
		}
	}
}
//----------------------------------------------------------------
function OnNewDr()
{
   OnCtrToggleRight();
   Popup_OnNew('D');
}    
//-------------------------------------------------------------------------------------------------
function OnNewCr()
{
   OnCtrToggleRight();
   Popup_OnNew('C');
}
//-------------------------------------------- Detail event ----------------------------------------------
function Popup_OnNew(p_data)
{
    var i = 0;
    var fpath   = System.RootURL + "/form/61/05/61050080_popup_Transaction.aspx?dsqlid=pm_sel_61050080_tran_acc" + "&p_type=";
    aValue      = System.OpenModal(  fpath , 750 , 550 , 'resizable:yes;status:yes');	
    if ( aValue != null ) 
    {
        if (aValue.length > 0)
        {
            for(i=0; i<aValue.length; i++)
            {
                var tmp = aValue[i];
                if (tmp[1] != 0)
                {
                    if (p_data == 'D')
                    {
                        grdDebit.AddRow();
                        grdDebit.SetGridText( grdDebit.rows - 1, 15, 'D' );
					    grdDebit.SetGridText( grdDebit.rows - 1, 1, tmp[1]);    //ACPK
					    grdDebit.SetGridText( grdDebit.rows - 1, 4, tmp[2]);    //Account Code
					    grdDebit.SetGridText( grdDebit.rows - 1, 5, tmp[3]);    //Account Name
					   
					    grdDebit.SetGridText( grdDebit.rows - 1, 15, 'D');    // 15_DRCR 
						grdDebit.SetGridText( grdDebit.rows - 1, 17, txtBRate.GetData());    // txtBRate
						grdDebit.SetGridText( grdDebit.rows - 1, 19, lstBCCY.GetData());    // 19_bookccy
						grdDebit.SetGridText( grdDebit.rows - 1, 20, txtSubPK.GetData());    // 20_tco_buspartner_pk
						grdDebit.SetGridText( grdDebit.rows - 1, 21, txttac_abplcenter_pk.GetData());    // 21_tac_abplcenter_pk--
						grdDebit.SetGridText( grdDebit.rows - 1, 22, txtSubCd.GetData());    // 22 BUS ID
						grdDebit.SetGridText( grdDebit.rows - 1, 23, txtSubNm.GetData());    // 23 BUS NM
						grdDebit.SetGridText( grdDebit.rows - 1, 6, lst_inv_CCY.GetData());    // ccy 
						grdDebit.SetGridText( grdDebit.rows - 1, 7, txt_inv_ERate.GetData());    // txt_inv_ERate
                    }
                    else if (p_data == 'C')
                    {
                        grdCredit.DeselectRow(grdCredit.selrow);
                        grdCredit.AddRow();
                        grdCredit.SelectRow(grdCredit.rows - 1);
                        grdCredit.SetGridText( grdCredit.rows - 1, 15, 'C' );
					    grdCredit.SetGridText( grdCredit.rows - 1, 1, tmp[1]);  //ACPK
					    grdCredit.SetGridText( grdCredit.rows - 1, 4, tmp[2]);  //Account Code
					    grdCredit.SetGridText( grdCredit.rows - 1, 5, tmp[3]);  //Account Name
					    grdCredit.SetGridText( grdCredit.rows - 1, 17, txtBRate.GetData());    // txtBRate
						grdCredit.SetGridText( grdCredit.rows - 1, 19, lstBCCY.GetData());    // 19_bookccy
						grdCredit.SetGridText( grdCredit.rows - 1, 20, txtSubPK.GetData());    // 20_tco_buspartner_pk
						grdCredit.SetGridText( grdCredit.rows - 1, 21, txttac_abplcenter_pk.GetData());    // 21_tac_abplcenter_pk--
						grdCredit.SetGridText( grdCredit.rows - 1, 22, txtSubCd.GetData());    // 22 BUS ID
						grdCredit.SetGridText( grdCredit.rows - 1, 23, txtSubNm.GetData());    // 23 BUS NM
                        grdCredit.SetGridText( grdCredit.rows - 1, 6, lst_inv_CCY.GetData());    // ccy 
						grdCredit.SetGridText( grdCredit.rows - 1, 7, txt_inv_ERate.GetData());    // txt_inv_ERate
						
                    }
                }
            }
        }
    }
}

//----------------------------------------------------------------
</script>
<body>
<gw:data id="dso_req_amt" onreceive="OnDataReceive(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="pm_sel_61050080_req_amt"  > 
			<input> 
				<input bind="lstPPDes" />
				<input bind="tecps_substrp12000_pk" />
				<input bind="txtProjectPK" />
				<input bind="dtProFrom" />
				<input bind="dtProTo" />
			 </input>
			 <output>
				<output bind="txtReqFAMT"/>
				<output bind="txtVATFAMT"/>
                <output bind="txtReFAMT"/>
                <output bind="txtWithFAMT"/>
              	<output bind="txtAdvDeduct_FAMT"/>
				<output bind="txtVATDeduct_FAMT"/>
				<output bind="txtTotalDeFAMT"/>
                <output bind="txtThisPayFAMT"/>

				<output bind="txtActQty"/>
				<output bind="txtReqStatus"/>
				<output bind="txtvendorbasic_pk"/>

			 </output>
		</dso> 
	</xml>
</gw:data>
<!------------------------------------------------------------------>
<gw:data id="dso_adv_deduct_can" onreceive="OnDataReceive(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="pm_sel_61050080_get_advb4"  > 
			<input> 
			    <input bind="txtProjectPK" />
			    <input bind="tecps_substrp12000_pk" />
				 <input bind="dtReqDate" />
			</input>
			 <output>
				<output bind="txt_adv_deduct_can"/>
			 </output>
		</dso> 
	</xml>
</gw:data>
<!------------------------------------------------------------------>
<gw:data id="dso_exrate" onreceive="OnDataReceive(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="pm_sel_61050080_exrate"> 
			<input> 
				<input bind="txtProjectPK" />
				<input bind="txtCompanyPK"/>
				<input bind="lst_inv_CCY" />
				<input bind="dtReqDate" />
				<input bind="tecps_substrp12000_pk" />
			 </input>
			 <output>
				<output bind="txt_inv_ERate"/>
		     </output>
		</dso> 
	</xml>
</gw:data>
<gw:data id="dso_get_subcontract_info" onreceive="OnDataReceive(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="pm_sel_61050080_get_subinfo"> 
			<input> 
				<input bind="txtProjectPK" />
				<input bind="tecps_substrp12000_pk" />
				<input bind="txtCompanyPK"/>
				<input bind="dtReqDate"/>
				
			 </input>
			 <output>
				<output bind="txtSubPK"/>
				<output bind="txtSubCd"/>
				<output bind="txtSubNm"/>
				<output bind="lstOrderCCY"/>
                <output bind="tecps_orderingconttype_pk"/>
				<output bind="txtOrderwork_cd"/>
				<output bind="txtOrderwork_nm"/>
				<output bind="lstBCCY"/>
				<output bind="txtBRate"/>
                <output bind="txtOrderERate"/>
				<output bind="txt_TAC_CRSUBCONTRACT_pk"/>
				<output bind="txt_TAC_CRSUBCONTRACT_cd"/>
                <output bind="txt_TAC_CRSUBCONTRACT_nm"/>
			    <output bind="dtProFrom"/>
                <output bind="dtProTo"/>
			    <output bind="txt_edit_yn"/>
				<output bind="txt_acc_order_pk"/>
			    <output bind="txt_acc_order_cd"/>
			    <output bind="txt_acc_order_nm"/>

           	 </output>
		</dso> 
	</xml>
</gw:data>







<gw:data id="dso_MakeSlip" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="process" parameter="0,1,2,3" procedure="pm_pro_61050080_confirm"> 
			<input> 
				 <input bind="txtAction" />
				 <input bind="dtReqDate"/>
				 <input bind="dtReqDate" />
				 <input bind="txt_tecps_requestpayment_pk"/>
			</input>
			<output>
				 <output bind="txtStatus"/>
                 <output bind="txtSeq"/>
				 <output bind="lblStatus"/>
		   </output> 
		</dso> 
	</xml> 
</gw:data>
<!---------------------------------------------------------------------->
<gw:data id="dso_delete_all_detail" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="process" parameter="0" procedure="pm_upd_61050080_detail_all"> 
			<input> 
				 <input bind="txt_tecps_requestpayment_pk"/>
			</input>
			<output>
				 <output bind="txt_out_dd"/>
         
		   </output> 
		</dso> 
	</xml> 
</gw:data>
<!---------------------------------------------------------------------->
<gw:data id="dso_kpcs319_search" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso id="1" type="grid"    function="pm_sel_61050080_search"> 
			<input bind="grdSearch">                    
				<input bind="dtFrom" /> 
				<input bind="dtTo" /> 
				<input bind="txtProjectCdSearch" />
				<input bind="txtSubcontractSearch" />
			</input> 
			<output bind="grdSearch" /> 
		</dso> 
	</xml> 
</gw:data>
<gw:data id="dso_kpcs319_mst" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso type="control" parameter="0,3,6,9,12,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,56,57,58" function="pm_sel_61050080_mst" procedure="pm_upd_61050080_mst"> 
			<inout> 
		        <inout  bind="txt_tecps_requestpayment_pk" />
                 <inout  bind="txtSeq" />                 
				 <inout  bind="lblStatus" />  
				 <inout  bind="txtProjectPK" />                 
				 <inout  bind="txtProjectCd" />                 
				 <inout  bind="txtProjectNm" />                 
				 <inout  bind="tecps_substrp12000_pk" />                   
				 <inout  bind="txtSubNoCd" />                   
				 <inout  bind="txtSubNoNm" />                   
				 <inout  bind="txtSubPK" />                     
				 <inout  bind="txtSubCd" />                     
				 <inout  bind="txtSubNm" />
                 <inout  bind="tecps_orderingconttype_pk" />
				 <inout  bind="txtOrderwork_cd" />
				 <inout  bind="txtOrderwork_nm" />
                 <inout  bind="txtDes" />
				 <inout  bind="txtLDes" />
                 <inout  bind="txtReqNo" />   
                 <inout  bind="dtReqDate" /> 
				 <inout  bind="lstPPDes" /> 
				 <inout  bind="txtreqtime" />   
				 <inout  bind="dtProFrom" />                    
				 <inout  bind="dtProTo" />  
                 <inout  bind="txtReqRate" />                   
				 <inout  bind="txtAccRate" />  
                 <inout  bind="lstOrderCCY" />   
				 <inout  bind="txtOrderERate" />   
				 <inout  bind="lst_inv_CCY" />   
				 <inout  bind="txt_inv_ERate" />                    
				 <inout  bind="lstBCCY" />                       
				 <inout  bind="txtBRate" />   
				 <inout  bind="txtReqFAMT" />
				 <inout  bind="txtReq_Inv_AMT" />
				 <inout  bind="txtReqAMT" />
                 <inout  bind="txtVATFAMT" />
				 <inout  bind="txtVAT_InvAMT" />
				 <inout  bind="txtVATAMT" />
                 <inout  bind="txtReFAMT" />
				 <inout  bind="txtRe_invAMT" />
				 <inout  bind="txtReAMT" />
                 <inout  bind="txtWithFAMT" />
				 <inout  bind="txtWith_InvAMT" />
                 <inout  bind="txtWithAMT" />
                 <inout  bind="txtAdvDeduct_FAMT" />
                 <inout  bind="txtAdvDeduct_invAMT" />
				 <inout  bind="txtAdvDeduct_AMT" />
                 <inout  bind="txtVATDeduct_FAMT" />
				 <inout  bind="txtVATDeduct_InvAMT" />
				 <inout  bind="txtVATDeduct_AMT" />
                 <inout  bind="txtTotalDeFAMT" />
				 <inout  bind="txtTotalDe_InvAMT" />
				 <inout  bind="txtTotalDeAMT" />
				 <inout  bind="txtThisPayFAMT" />
				 <inout  bind="txtThisPay_InvAMT" />
                 <inout  bind="txtThisPayAMT" />
				 <inout  bind="txt_trhstatus" />

				 <output bind="txt_TAC_CRSUBCONTRACT_pk"/>
				 <output bind="txt_TAC_CRSUBCONTRACT_cd"/>
                 <output bind="txt_TAC_CRSUBCONTRACT_nm"/>
				 
			</inout>
		</dso> 
	</xml> 
</gw:data>
<gw:data id="dso_kpcs319_dtl_debit" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso id="1" type="grid"    function="pm_sel_61050080_dtl" parameter="0,1,3,6,7,8,9,10,11,13,15,17,19,20,21,22,23" procedure="pm_upd_61050080_dtl">  
			<input bind="grdDebit">                    
				<input bind="txt_tecps_requestpayment_pk" />
				<input bind="txtDRCRtype" />
			
				
            </input> 
			<output bind="grdDebit" /> 
		</dso> 
	</xml> 
</gw:data>
<gw:data id="dso_kpcs319_dtl_credit" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso id="1" type="grid"    function="pm_sel_61050080_dtl" parameter="0,1,3,6,7,8,9,10,11,13,15,17,19,20,21,22,23" procedure="pm_upd_61050080_dtl">  
			<input bind="grdCredit">                    
				<input bind="txt_tecps_requestpayment_pk" />
				<input bind="txtDRCRtype" />
			</input> 
			<output bind="grdCredit" /> 
		</dso> 
	</xml> 
</gw:data>
<!-------------------------------------------------------------------------------------------------------------->
 <gw:data id="dso_upd_ctl_item" onreceive="ItemStyle()">
        <xml>
            <dso type="grid" parameter="0,1,2,9,10,11,12" function="pm_sel_61050080_ctl_item" procedure="pm_upd_61050080_ctl_item">
                <input bind="idGridItem">
                    <input bind="txt_tecps_requestpaymentd_pk"/>
                    <input bind="txtacpk"/>
                    <input bind="txtDRCRtype"/>
                </input> 
                <output bind="idGridItem"/>
            </dso>
        </xml>
    </gw:data>
<!-------------------------------------------------------------------------------------------------------------->
 <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%;border-collapse: collapse" bordercolor="#00CCFF"  border="1">
	<tr style="width: 100%; height: 100%">
		<td style="width: 25%" id="left" >
			<table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
				<tr style="height:4%">
					<td>
						<fieldset style="padding:0">
							<table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
							    <tr>
									<td style="width: 10%" align="right">Date&nbsp;</td>
									<td style="width: 89%; white-space: nowrap"><gw:datebox id="dtFrom" lang="1" />~<gw:datebox id="dtTo" lang="1" /></td>
									<td style="width: 1%"><gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch(this)" /></td>
								</tr>
								<tr>
									<td style="width: 10%" align="right"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('project')">Project</a>&nbsp;</td>
									<td colspan="2"><gw:textbox id="txtProjectCdSearch" styles="width: 100%" onenterkey="OnSearch(this)" /></td>
								</tr>
								<tr>
									<td style="width: 10%; white-space: nowrap" align="right">Sub Cont. No.&nbsp;</td>
									<td colspan="2"><gw:textbox id="txtSubcontractSearch" styles="width: 100%" onenterkey="OnSearch(this)" /></td>
								</tr>
							</table>
						  </fieldset>
					</td>
				</tr>
				<tr style="height: 96%" valign="top">
					<td >
					<gw:grid   id='grdSearch' 
							header='_PK|Request No.|This Payment|CCY|_Confirm Date' 
							format='0|0|1|0|0'
							aligns='0|0|3|1|0' 
							check='||||0' 
							editcol='0|0|0|0|0' 
							widths='100|1200|2500|500|100' 
							sorting="T" 
							styles='width:100%; height:100%' 
							
							oncellclick="OnSearch(this)" />
					
					</td>
				</tr>
			</table>
		</td>
		<td style="width: 75%;" id="right" valign="top">
		   	<fieldset style="width: 100%; height: 100%; padding: 2">
			<table cellpadding="0" cellspacing="0" style="width: 100%;border-collapse: collapse" bordercolor="#00CCFF"  border="1">
				<tr style="background:#C5EFF1;" >
                    <td align="right" width="13%">Seq&nbsp;</td>
					<td width="87%" colspan="">
						<table  style="width: 100%" cellpadding="0" cellspacing="0">
							<tr width="100%">
                                <td align="" width="30%"><gw:textbox id="txtSeq" readonly="T"  styles="width: 100%"/></td>
                                <td width="10%" align="right">Status&nbsp;</td>
                                <td width="30%" align="left" ><gw:label id="lblStatus" styles="width: 100%; color:blue" text="Save"/></td>
								<td width="2%"><gw:button id="btnNew" 		img="new" 		alt="New" 			 	onclick="OnNew()" /></td>
								<td width="2%"><gw:button id="btnSave" 	img="save" 		alt="Save" 			 	onclick="OnSave()" /></td>
								<td width="2%"><gw:button id="btnDelete" 	img="delete" 	alt="Delete" 		 	onclick="OnDelete()" /></td>
								<td width="2%"><gw:button id="btconfirm" 	img="confirm" 	alt="Confirm" 		 	onclick="OnConfirm()"/></td>
                               
								<td width="2%"><gw:button id="btnCancel" 	img="cancel" 	alt="Cancel" 		 	onclick="OnCancel()" /></td>
								<td width="2%"><gw:button id="btnPrint1" 	img="excel" text="Print"	alt="Proposal Sheet" 	onclick="OnPrint('proposal')" /></td>
								<td width=""><gw:button id="btnPrint2" 	img="excel" text="Print"	alt="Accounting slip" 	onclick="OnPrint('slipentry')" /></td>
								 <td width="2%"><gw:button id="btmakeslip" 	img="makeSlip" text="Make Slip"  styles="width: 100%; color:blue;display:none"	 	onclick="makeslip()"/></td>
							</tr>
						</table>
                    </td>
				</tr>
                <tr style="background:#C5EFF1;">
                    <td width="13%" align="right"><a href="#" title="Click here to show Project" style="text-decoration: none" onClick="OnPopUp('project')">Project&nbsp;</a></td>
                    <td style="width:87%">
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="40%"><gw:textbox id="txtProjectCd" styles="width: 100%" csstype="mandatory" readonly="T"/></td>
                                <td width="60%"><gw:textbox id="txtProjectNm" styles="width: 100%" csstype="mandatory" readonly="T"/></td>
                                <td><gw:imgbtn id="btnonfirm" img="reset" alt="Reset" onclick="txtProjectCd.text='';txtProjectNm.text='';txtProjectPK.text='';" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="background:#C5EFF1">
					<td align="right"><a href="#" title="Click here to show Subcontract No." style="text-decoration: none" onClick="OnPopUp('subcontracno')">SubCont. No.&nbsp;</a></td>
					<td>
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="40%"><gw:textbox id="txtSubNoCd" styles="width: 100%" csstype="mandatory" readonly="T"/></td>
                                <td width="60%"><gw:textbox id="txtSubNoNm" styles="width: 100%" csstype="mandatory" readonly="T"/></td>
                                <td><gw:imgbtn id="btnonfirm" img="reset" alt="Reset" onclick="txtSubNoCd.text='';txtSubNoNm.text='';txtSubPK.text='';" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr style="background:#C5EFF1">
					<td align="right"><a href="#" title="Click here to show Subcontractor" style="text-decoration: none" onClick="OnPopUp('subcontractor')">Subcontractor&nbsp;</a></td>
					<td>
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="40%"><gw:textbox id="txtSubCd" styles="width: 100%" csstype="mandatory" readonly="T"/></td>
                                <td width="60%"><gw:textbox id="txtSubNm" styles="width: 100%" csstype="mandatory" readonly="T"/></td>
                                <td><gw:imgbtn id="btnonfirm" img="reset" alt="Reset" onclick="txtSubCd.text='';txtSubNm.text='';" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
				 <tr style="background:#C5EFF1">
					<td align="right"><a href="#" title="Outside Order Work" style="text-decoration: none" onClick="">Order work&nbsp;</a></td>
					<td>
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="40%"><gw:textbox id="txtOrderwork_cd" styles="width: 100%" csstype="mandatory" readonly="T"/></td>
                                <td width="60%"><gw:textbox id="txtOrderwork_nm" styles="width: 100%" csstype="mandatory" readonly="T"/><gw:textbox id="txtOrderwork_pk" styles="width: 100%; display:none" csstype="mandatory" readonly="T"/></td>
                                
                            </tr>
                        </table>
                    </td>
                </tr>
				 <tr id="_4" style="background:#C5EFF1" >
					<td  align="right">Description&nbsp;</td>
					<td ><gw:textbox id="txtDes" styles='width:100%' csstype="mandatory" onenterkey="" /></td>								
				</tr>				
				<tr id="_5" style="background:#C5EFF1" >
					<td  align="right">L.Description&nbsp;</td>
					<td ><gw:textbox id="txtLDes" styles='width:100%' csstype="mandatory" onenterkey="" /></td>
				</tr>
                <tr style="background:#C5EFF1">
                    <td align="right">Request No&nbsp;</td>
                    <td>
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="20%"><gw:textbox id="txtReqNo" csstype="mandatory" styles="width: 100%" /></td>
                                <td width="10%" align="right">Req Date&nbsp;</td>
                                <td width="10%"><gw:datebox id="dtReqDate" lang="1" /></td>
								<td width="20%"  align="right">Req. type&nbsp;</td>
								<td width="20%"><gw:list id="lstPPDes" styles='width:100%' onchange="ChangeCB()" /></td>	
								<td width="15%" align="right">Req times</td>
                                <td width="5%" align="left"><gw:textbox id="txtreqtime" styles="width: 100%" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                
                <tr style="background:#C5EFF1">
                    <td>
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width=""align="left"><img status="expand" id="imgup" src="../../../system/images/up.gif" style="cursor: hand;"  onclick="OnShow()" /></td>
                                <td width="100%" align="right">Progress date&nbsp;</td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="20%" ><gw:datebox id="dtProFrom"  type="date" lang="1" onchange="ChangeCB()"/></td>
                                <td width="10%"  align="center">~</td>
                                <td width="10%" align="left"><gw:datebox id="dtProTo" type="date" lang="1" onchange="ChangeCB()"/></td>
								<td width="20%" align="right"><a title="Request Rate" style="color:#333">Req Rate&nbsp;</a></td>
                                <td width="20%"><gw:textbox id="txtReqRate" type="number" format="#,###,###,###,###.##R" styles="width: 100%" /></td>
								<td width="15%" align="right">Acc Rate&nbsp;</td>
                                <td width="5%"><gw:textbox id="txtAccRate" type="number" format="#,###,###,###,###.##R" styles="width: 100%" /></td>
                            </tr>
                        </table>
						
                    </td>
                </tr>
               </fieldset>
               
               
               
               
				<tr style="background:#C5EFF1">
					
                    <td colspan="2">
					<fieldset style="width: 100%; height: 100%; padding: 2">
						<table border="0" cellpadding="0" cellspacing="0"  width="100%" style="width: 100%;border-collapse: collapse" bordercolor="#00CCFF"  border="1">
						<tr style="background:#C5EFF1">
							<td width="20%" colspan="2">&nbsp;</td>
							<td width="10%" align="right"><a title="Order Currency" style="color:#333">Order CCY&nbsp;</a></td>
							<td width="8%"><gw:list id="lstOrderCCY" styles='width:100%' onchange="OnChangeCCY()" /></td>
							<td width="8%"><gw:textbox id="txtOrderERate" type="number" format="#,###,###,###,###.##R" text="1" styles='width:100%' onenterkey="OnChangeText()" /></td>
							
							<td width="10%" align="right"><a title="Invoice Currency" style="color:#333">Invoice CCY&nbsp;</a></td>
							<td width="8%"><gw:list id="lst_inv_CCY" styles='width:100%' onchange="OnChangeCCY()" /></td>
							<td width="8%"><gw:textbox id="txt_inv_ERate" type="number" format="#,###,###,###,###.##R" text="1" styles='width:100%' onenterkey="OnChangeText()" /></td>
							<td width="10%" align="right">Book CCY</td>
						    <td width="8%"><gw:list id="lstBCCY" styles='width:100%' onchange="" /></td>
							<td width="8%"><gw:textbox id="txtBRate" type="number" format="#,###,###,###,###.##R" text="1" styles='width:90%' onenterkey="OnChangeText()" /></td>
						</tr>
						<tr style="background:#C5EFF1">
							<td width="20%" align="right">Progress Amt(1)</td>
							 <td width="1%"><gw:checkbox id="chk_1" value="F" onclick="OnAutoYN()" /></td>
							<td width="29%" colspan="3"><gw:textbox id="txtReqFAMT" type="number"   format="#,###,###,###,###.##R" styles='width:100%' onenterkey="OnChangeText()"/></td>
							<td width="29%" colspan="3"><gw:textbox id="txtReq_Inv_AMT" type="number"   format="#,###,###,###,###.##R" styles='width:100%'/></td>
							<td width="29%" colspan="3"><gw:textbox id="txtReqAMT" type="number"   format="#,###,###,###,###.##R" styles='width:100%'/></td>
						</tr>
						<tr>
							<td width="20%" align="right">Vat Amt(2)</td>
							 <td width="1%"><gw:checkbox id="chk_2" value="F" onclick="OnAutoYN()" /></td>
							<td width="29%" colspan="3"><gw:textbox id="txtVATFAMT" type="number"  readonly="T" format="#,###,###,###,###.##R" styles='width:100%'/></td>
							<td width="29%" colspan="3"><gw:textbox id="txtVAT_InvAMT" type="number"  readonly="T" format="#,###,###,###,###.##R" styles='width:100%'/></td>
							<td width="29%" colspan="3"><gw:textbox id="txtVATAMT" type="number"  readonly="T" format="#,###,###,###,###.##R" styles='width:100%'/></td>
						</tr>
						<tr>
							<td width="20%"align="right">Retention Amt(3)</td>
							 <td width="1%"><gw:checkbox id="chk_3" value="F" onclick="OnAutoYN()" /></td>
							<td width="29%" colspan="3"><gw:textbox id="txtReFAMT" type="number"  onenterkey="OnChangeText()" format="#,###,###,###,###.##R" styles='width:100%'/></td>
							<td width="29%" colspan="3"><gw:textbox id="txtRe_invAMT" type="number" onenterkey="Changbookamt()" format="#,###,###,###,###.##R" styles='width:100%'/></td>
							<td width="29%" colspan="3"><gw:textbox id="txtReAMT" type="number"  onenterkey="Changbookamt()" format="#,###,###,###,###.##R" styles='width:100%'/></td>
						</tr>
						<tr>
							<td width="20%" align="right">Withholding Tax Amt(4)</td>
							 <td width="1%"><gw:checkbox id="chk_4" value="F" onclick="OnAutoYN()" /></td>
							<td width="29%" colspan="3"><gw:textbox id="txtWithFAMT" type="number"  onenterkey="OnChangeText()"  format="#,###,###,###,###.##R" styles='width:100%'/></td>
							<td width="29%" colspan="3"><gw:textbox id="txtWith_InvAMT" type="number" onenterkey="Changbookamt()"   format="#,###,###,###,###.##R" styles='width:100%'/></td>
							<td width="29%" colspan="3"><gw:textbox id="txtWithAMT" type="number"  onenterkey="Changbookamt()"  format="#,###,###,###,###.##R" styles='width:100%'/></td>
						</tr>
						<tr>
							<td width="20%" align="right">Adv Deduct Amt(5)</td>
							 <td width="1%"><gw:checkbox id="chk_5" value="F" onclick="OnAutoYN()" /></td>
							<td width="29%" colspan="3"><gw:textbox id="txtAdvDeduct_FAMT" type="number"   onenterkey="OnChangeText();dso_adv_deduct_can.Call() "  format="#,###,###,###,###.##R" styles='width:100%'/></td>
							<td width="29%" colspan="3"><gw:textbox id="txtAdvDeduct_invAMT" type="number" onenterkey="Changbookamt()"  format="#,###,###,###,###.##R" styles='width:100%'/></td>
							<td width="29%" colspan="3"><gw:textbox id="txtAdvDeduct_AMT" type="number" onenterkey="Changbookamt()"  format="#,###,###,###,###.##R" styles='width:100%'/></td>
						</tr>
						<tr>
							<td width="20%" align="right">Vat Deduct Amt(6)</td>
							<td width="1%"><gw:checkbox id="chk_6" value="F" onclick="OnAutoYN()" /></td>
							<td width="29%" colspan="3"><gw:textbox id="txtVATDeduct_FAMT" type="number" onenterkey="OnChangeText()"  format="#,###,###,###,###.##R" styles='width:100%'/></td>
							<td width="29%" colspan="3"><gw:textbox id="txtVATDeduct_InvAMT" type="number"  onenterkey="Changbookamt()"  format="#,###,###,###,###.##R" styles='width:100%'/></td>
							<td width="29%" colspan="3"><gw:textbox id="txtVATDeduct_AMT" type="number" onenterkey="Changbookamt()"  format="#,###,###,###,###.##R" styles='width:100%'/></td>
						</tr>
						<tr>
							<td width="20%" colspan="2" align="right"><a title="Total Deduct AMT (7) = (3)+(4)+(5)+(6)" style="COLOR: #333">Total Deduct Amt(7)</a></td>
							<td width="29%" colspan="3"><gw:textbox id="txtTotalDeFAMT" type="number"  readonly="T" format="#,###,###,###,###.##R" styles='width:100%'/></td>
							<td width="29%" colspan="3"><gw:textbox id="txtTotalDe_InvAMT" type="number"  readonly="T" format="#,###,###,###,###.##R" styles='width:100%'/></td>
							<td width="29%" colspan="3"><gw:textbox id="txtTotalDeAMT" type="number"  readonly="T" format="#,###,###,###,###.##R" styles='width:100%'/></td>
						</tr>
						<tr>
							<td width="20%" colspan="2" align="right"><a title="This Payment (8) = (1)+(2)-(7)" style="COLOR: #333">This Payment (8)&nbsp;</a></td>
							<td width="29%" colspan="3"><gw:textbox id="txtThisPayFAMT" type="number"  onenterkey="OnChangeText()"   format="#,###,###,###,###.##R" styles='width:100%'/></td>
							<td width="29%" colspan="3"><gw:textbox id="txtThisPay_InvAMT" type="number"  readonly="T" format="#,###,###,###,###.##R" styles='width:100%'/></td>
							<td width="29%" colspan="3"><gw:textbox id="txtThisPayAMT" type="number"  readonly="T" format="#,###,###,###,###.##R" styles='width:100%'/></td>
						</tr>
					</table>
					</fieldset>
                  </td>
				</tr>
				<!------------------------------------------------------------------------------------------------------------------------------------------------------->
				  <tr >
					<td colspan="2" width="100%" >
						<table border="1" width="100%" cellpadding=0 cellspacing=0 bordercolor="#00FFFF">
							<tr>
								<td width="60%" valign=top id="tdGrid">
								  <table border="0" width="100%" cellpadding=0 cellspacing=0>
									<tr>
										<td width="5%">
                                                    <a onclick="OnSumDR()" href="#tips">Debit</a></td>
                                                <td width="20%">
                                                    <gw:textbox id="txtsum_chk_dr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                </td>
                                                <td width="20%">
                                                    <gw:textbox id="txtsum_chk_dr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                </td>
                                                <td width="5%" align="center">
                                                    Total</td>
                                                <td width="20%">
                                                    <gw:textbox id="txtsum_total_dr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                </td>
                                                <td width="20%">
                                                    <gw:textbox id="txtsum_total_dr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                </td>
                                                <td width="1%" align="right">
                                                    <gw:button id="btnNew_Dr" img="new" alt="New" styles="display:" onclick="OnNewDr()" />
                                                </td>
                                                <td width="1%" align="right">
                                                    <gw:button id="btnSave_Dr" img="save" alt="Save" onclick="OnSaveDr()" />
                                                </td>
                                                <td width="1%" align="right">
                                                    <gw:button id="btnDel_Dr" img="delete" styles="display:" alt="Delete" onclick="OnDelDr()" />
                                                </td>
									</tr>
									<tr >
									   <!--0_Pk|1_Acc_pk|2check|3 type ref|4.Acc.Code|5.Acc.Name|6.Ccy|7.Rate|8.Amount Trans|9.mount Book|10.Description|11.Local Description|12_Expense Type|13_m_pk|14_ODR|15_DRCR|16_ChkTreat|17.Book Rate|18Tmp Rate|19_bookccy|20_tco_buspartner_pk|21_tac_abplcenter_pk|22_BUS_ID|23_BUS_NM-->
										<td colspan="10" width="width: 100%">
											<gw:grid id="grdDebit" 
											header="_Pk|_Acc_pk|||Acc.Code|Acc.Name|Ccy|Rate|Amount Trans|Amount Book|Description|Local Description|_Expense Type|_m_pk|_ODR|DRCR|_ChkTreat|Book Rate|Tmp Rate|_bookccy|_tco_buspartner_pk|_tac_abplcenter_pk|_BUS_ID|_BUS_NM"
											format="0|0|3|0|0|0|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
											aligns="0|0|1|1|1|0|1|1|3|3|0|0|0|0|0|0|0|0|3|0|0|0|0|0"
											defaults="||||||VND||||||||||||||||0|0" 
											editcol="1|1|1|1|1|1|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1" 
											widths="0|0|250|300|1500|2000|700|1000|1800|1800|3000|2500|1000|1000|1000|800|0|1000|1000|0|0|0|0|0"
											styles="width:100%; height:130" 
											sorting="F"  
											oncelldblclick="DBPopupClick_DR()" 
											oncellclick="RowClick_DR()"
											onafteredit="RowEditDR()"
											/>
										</td>
									</tr>
									<tr>
										 <td width="5%" align="center">
                                                    <b><a onclick="OnSumCR()" href="#tips">Credit</a></td>
                                                <td width="20%">
                                                    <gw:textbox id="txtsum_chk_cr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                </td>
                                                <td width="20%">
                                                    <gw:textbox id="txtsum_chk_cr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##.##R" />
                                                </td>
                                                <td width="5%" align="center">
                                                    Total</td>
                                                <td width="20%">
                                                    <gw:textbox id="txtsum_total_cr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                </td>
                                                <td width="20%">
                                                    <gw:textbox id="txtsum_total_cr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                </td>
                                                <td width="1%" align="right">
                                                    <gw:button id="btnNew_Cr" img="New" styles="display:" alt="New credit" onclick="OnNewCr()" />
                                                </td>
                                                <td width="1%" align="right">
                                                    <gw:button id="btnSave_Cr" img="save" alt="Save" onclick="OnSaveCr()" />
                                                </td>
                                                <td width="1%" align="right">
                                                    <gw:button id="btnDel_Cr" img="delete" styles="display:"  alt="Delete" onclick="OnDelCr()" />
                                                </td>
                                               
                                            
                                                <td width="1%" align="right">
                                                    <img status="expand" id="imgArrow" src="../../../system/images/prev_orange.gif"
                                                        style="cursor: hand;" onclick="OnToggle_dtl()" /></img></td>
									</tr>
									<tr >
									<td colspan="10" width="width: 100%">
										<gw:grid id="grdCredit" 
										header="_Pk|_Acc_pk|||Acc.Code|Acc.Name|Ccy|Rate|Amount Trans|Amount Book|Description|Local Description|_Expense Type|_m_pk|_ODR|_DRCR|_ChkTreat|Book Rate|Tmp Rate|_bookccy|_tco_buspartner_pk|_tac_abplcenter_pk|_BUS_ID|_BUS_NM"
										format="0|0|3|0|0|0|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
										aligns="0|0|1|1|1|0|1|1|3|3|0|0|0|0|0|0|0|0|3|0|0|0|0|0"
										defaults="||||||VND|||||||||||||0|0|0|0|0" 
										editcol="1|1|1|1|1|1|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1" 
										widths="0|0|250|300|1500|2000|700|1000|1800|1800|3000|2500|1000|1000|1000|800|0|1000|1000|0|0|0|0|0"
										styles="width:100%; height:200" 
										sorting="F"
										oncelldblclick="DBPopupClick_CR()" 
										onafteredit="RowEditCR()"
										oncellclick="RowClick_CR()"
										/>
									</td>
								</tr>

								</table>
								
								</td>
								
								<td width="40%"  id="tdControlItem" style="display: " valign="top" >
									<table border="0" width="100%" cellpadding=0 cellspacing=0>
										<tr>
										  <td width="25%" align="Center"> Control Item</td>
										  <td width="50%" align="left"></td>
										  <td width="25%" align="right"><gw:icon id="btnTreament" img="in" text="Treatment" onclick="OnTreament()" styles="width:100%" /></td>
										</tr>
										<tr>
											<td colspan="3" width="100%" >
												 <gw:neogrid id="idGridItem" styles="width:100%;height:360" oncelldblclick="ClickItemControl()"
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
															
															<column title="TABLE PK" hidden='F'>
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
 
				<!------------------------------------------------------------------------------------------------------------------------------------------------------->
             
               		
				
			</table>
		</td>
	</tr>
</table>
<img status="expand" id="imgArrow1" src="../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onClick="OnToggle()" />
</body>
<gw:textbox id="txtProjectPK" 					styles="display:none"/>
<gw:textbox id="txt_tecps_requestpayment_pk" 	styles="display:none"/>
<gw:textbox id="txt_tecps_requestpaymentd_pk" 	styles="display:none"/>

<gw:textbox id="tecps_substrp12000_pk" 			styles="display:none"/>
<gw:textbox id="txtSubPK" 						styles="display:none"/>
<gw:textbox id="txtAdvance" 					styles="display:none""/>
<gw:textbox id="txtWith" 				styles="display:none""/>
<gw:textbox id="txtReten" 						styles="display:none""/>
<gw:textbox id="tecps_orderingconttype_pk"" 	styles="display:none"/>
<gw:textbox id="tac_hgtrh_pk" 					styles="display:none"/>
<gw:textbox id="txtStatus" 						styles="display:none"/>
<gw:textbox id="txtAction" 						styles="display:none"/>
<gw:textbox id="txtCompanyPK" 					styles="display:none"/>
<gw:textbox id="txtActQty"						styles='display:none' />
<gw:textbox id="txtReqStatus"					styles='display:none' />
<gw:textbox id="txtDRCRtype"					styles='display:none' />
<gw:textbox id="dtActual"			lang="1"		styles='display:none' />
<gw:textbox id="txtvendorbasic_pk" lang="1" styles='display:none' />
<gw:textbox id="txttac_abplcenter_pk" lang="1" styles='display:none' />
<gw:list id="lstCompany" value="" styles='width:100%;display:none' />
<gw:textbox id="txtacpk" lang="1" styles='display:none' />
<gw:textbox id="txt_rowclick" style="display: none" />
<gw:textbox id="txt_trhstatus" style="display: none " />
<gw:textbox id="txt_TAC_CRSUBCONTRACT_pk" lang="1" styles='display:none' />
<gw:textbox id="txt_TAC_CRSUBCONTRACT_cd" lang="1" styles='display:none' />
<gw:textbox id="txt_TAC_CRSUBCONTRACT_nm" lang="1" styles='display:none' />
<gw:textbox id="txt_adv_deduct_can" lang="1" styles='display:none' />
<gw:textbox id="txt_edit_yn" text='N' styles='display:none' />
<gw:textbox id="txtTAC_ABPL_pk" text='N' styles='display:none' />

<gw:textbox id="txt_out_dd" text='N' styles='display:none' />
<gw:textbox id="txtUserPk" text='N' styles='display:none' />
<gw:textbox id="txt_acc_order_pk" text='N' styles='display:none' />
<gw:textbox id="txt_acc_order_cd" text='N' styles='display:none' />
<gw:textbox id="txt_acc_order_nm" text='N' styles='display:none' />
  <gw:grid style="display: none" id="idGridTempItem" header="itemacctpk|itemal|item|itemnm|table_pk"
        format="0|0|0|0|0" aligns="0|0|0|0|0" defaults="||||" editcol="0|0|0|0|0" widths="1300|3500|3500|2000|0"
        styles="width:100%; height:100" sorting="F" param="0,1,2,3,4" />
</html>
