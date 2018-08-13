<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Genuwin</title>
</head>
<%  ESysLib.SetUser("acnt")%>

<script>
var click_dr = 0;
var click_cr = 0;
var _book_rate = 0;
var _Book_CCY = "VND";
var _book_col_format = "###,###.##R";
var AdminYN;
var flag_select = false;
AdminYN ="<%=Session("CODEADMIN_YN")%>";
var lang = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    System.Translate(document);

    dso_udp_ctl_mst_slip_entry.StatusInsert(); 
    
    txtsum_chk_dr_famt.SetEnable(false);
    txtsum_chk_dr_amt.SetEnable(false);
    txtsum_chk_cr_famt.SetEnable(false);
    txtsum_chk_cr_amt.SetEnable(false);
    txttransaction_name.SetEnable(false);
    txtProposedByUserID.SetEnable(false);
  
   
    txtLang.SetDataText(lang);
    
    btnReplicate.SetEnable(false);
    btnCancel.SetEnable(false);
    btnConfirm.SetEnable(false);
    btnCopy.SetEnable(false);
    
    <%=ESysLib.SetGridColumnComboFormat("grdDebit", 6,"SELECT A.CODE, A.CODE FROM COMM.TCO_ABCODE A, COMM.TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
    <%=ESysLib.SetGridColumnComboFormat("grdCredit", 6,"SELECT A.CODE, A.CODE FROM COMM.TCO_ABCODE A, COMM.TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;


    <%=ESysLib.SetGridColumnComboFormat("grdDebit", 12,"SELECT TRIM(A.CODE), A.CODE_NM FROM COMM.TCO_ABCODE A, COMM.TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0 AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0310' AND A.USE_IF = 1 UNION ALL SELECT '', '' FROM DUAL")%>;
    <%=ESysLib.SetGridColumnComboFormat("grdCredit", 12,"SELECT TRIM(A.CODE), A.CODE_NM FROM COMM.TCO_ABCODE A, COMM.TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0 AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0310' AND A.USE_IF = 1 UNION ALL SELECT '', '' FROM DUAL")%>;    
    
    _Book_CCY = "<%=ESysLib.SetDataSQL("select b.code, b.char_1  from tac_commcode_master a, tac_commcode_detail b where a.pk = b.tac_commcode_master_pk and a.id = 'ACBG0040' and b.def_yn = 'Y' and a.del_if = 0 and b.del_if = 0")%>";
    
    var a = _Book_CCY.split("|");
    if(a.length <=0) alert("Please setup book currency in common code.");
    _Book_CCY = a[0];
   // txtseq.GetControl().focus();
	     
    BindingDataList();
   
    
}
//-------------------------------------------------------------------------------------------------------------------------------
function BindingDataList()
{
    var ls_data     = "<%=ESysLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_data1    = "<%=ESysLib.SetListDataSQL("SELECT A.PK, A.org_NM FROM comm.TCO_org A WHERE (A.END_DATE >= '20080101' OR A.END_DATE IS NULL)")%>";
    //var ls_data2    = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACBG0130') FROM DUAL")%>";
   var ls_data2    = "<%=ESysLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'ACBG0130' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY ORD")%>"; 

    //var ls_data    = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE_COL('ACBG0130', 'CODE', 'NVL(NUM_3, 0)') FROM DUAL")%>";
    var ls_data3    ="<%=ESysLib.SetListDataSQL("SELECT D.CODE, NVL(D.NUM_3,'0') FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'ACBG0130' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY CODE")%>"; 
    var ls_data7    = "<%=ESysLib.SetDataSQL("SELECT DECODE(B.CODE, 'Y', 'T', 'F') FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACAB004' AND B.DEF_YN = 'Y' AND A.DEL_IF = 0 AND B.DEL_IF = 0")%>";
  
    lstCompany.SetDataText(ls_data);
    lstCompanySearch.SetDataText(ls_data);
    lstCompany.value = "<%=session("company_pk") %>";
    lstCompanySearch.value = "<%=session("company_pk") %>";
    lstDepartment.SetDataText(ls_data1);
    lstVoucherType.SetDataText(ls_data2);
    lstVoucherTypeSearch.SetDataText(ls_data2);
	lstVoucherTypePrint.SetDataText(ls_data3);
	chkauto_YN.SetDataText(ls_data7);
	
	
	 var ls_report = "<%=ESysLib.SetListDataFUNC("SELECT acnt.SF_A_GET_COMMONCODE('GFQC0016') FROM DUAL")%>";
	lstReport.SetDataText(ls_report);
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
    
    ls_data3    = "<%=ESysLib.SetListDataFUNC("SELECT sf_a_get_default ('EACAB018')   FROM DUAL")%>";
    var  arr  = ls_data3.split("|");
	txtEACAB018.SetDataText(arr[1]);  
	
	ls_data3    = "<%=ESysLib.SetListDataFUNC("SELECT sf_a_get_default ('EACAB032')   FROM DUAL")%>";
    arr  = ls_data3.split("|");
	txtEACAB032.SetDataText(arr[1]);  
    var dataStatus = "Data|0|Save|1|Approved|2|Confirmed|3|Cancel";
    lstStatusSearch.SetDataText(dataStatus);
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   dso_ctl_getProposedBy.Call("SELECT"); 
  
   
    
}
//-------------------------------------------------------------------------------------------------------------------------------
function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise,    
}
//-------------------------------------------------------------------------------------------------------------------------------
function OnToggle1()
 {
    var left  = document.all("idLEFT");    
    var right = document.all("idRIGHT");   
    var imgArrow = document.all("imgArrow");       
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/right1.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="70%";
        imgArrow.src = "../../../system/images/left1.gif";
    }
 }
 //-------------------------------------------------------------------------------------------------------------------------------
function Popup_OnNew(p_data)
{
    var i = 0;
    var fpath   = System.RootURL + "/form/gf/co/ffco002004.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + txttransaction_code.GetData() + "&val1=" + txttransaction_name.GetData() + "&val2=" + p_data + "&val3=" + lstCompany.GetData() + "&dsqlid=ACNT.SP_SEL_ACCOUNT_NEW_DRCR";
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
					    grdDebit.SetGridText( grdDebit.rows - 1, 10, txtDescription.text );         //Desc Eng
					    grdDebit.SetGridText( grdDebit.rows - 1, 11, txtLocalDescription.text );    //Desc Local
					    grdDebit.SetGridText( grdDebit.rows - 1, 13, txtseq.text );                 //SEQ
					    grdDebit.SetRowEditable(grdDebit.rows - 1, false);
					    click_dr = 0;					    					    					    
                        grdDebit.SetGridText( grdDebit.rows - 1, 17, GetBookExRate(_Book_CCY));
                    }
                    else if (p_data == 'C')
                    {
                        grdCredit.DeselectRow(grdCredit.selrow);
                        grdCredit.AddRow();
                        grdCredit.SelectRow(grdCredit.rows - 1);
                        grdCredit.SetGridText( grdCredit.rows - 1, 15, 'C' );
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
					        grdCredit.SetGridText( grdCredit.rows - 1, 3, '1' );
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
                        onSetData_CR(ls_ref);
					    grdCredit.SetGridText( grdCredit.rows - 1, 10, txtDescription.text );         //Desc Eng
					    grdCredit.SetGridText( grdCredit.rows - 1, 11, txtLocalDescription.text );    //Desc Local
					    grdCredit.SetGridText( grdCredit.rows - 1, 13, txtseq.text);                 //SEQ
					    grdCredit.SetRowEditable(grdCredit.rows - 1, false);
					    grdCredit.SetGridText( grdCredit.rows - 1, 17, GetBookExRate(_Book_CCY));
					    click_cr = 0;
                    }
                }
            }
        }
    }
} 
 //-------------------------------------------------------------------------------------------------------------------------------
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
        if ((grdCredit.GetGridData(i, 3) == p_ref) && (grdCredit.selrow != click_cr))
        {
            l_sum_cr = l_sum_cr + Number(grdCredit.GetGridData(i, 9));
        }
	}
	//grdCredit.SetGridText( grdCredit.rows - 1, 9, l_sum_dr - l_sum_cr);
	for (i = 1; i < grdCredit.rows; i++)
    {
        if (grdCredit.selrow == i)
        {
            grdCredit.SetCellBold(i,1,i,17,true);
            grdCredit.SetRowEditable(i, true);
        }
        else
        {
            grdCredit.SetCellBold(i,1,i,17,false);
            grdCredit.SetRowEditable(i, false);
        }
    }
}
 //-------------------------------------------------------------------------------------------------------------------------------
function Popup_OnSelect_Acc(p_data)
{
    if(!CanChange()) return;
    
    var fpath   = System.RootURL + "/form/gf/co/ffco002004.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + txttransaction_code.GetData() + "&val1=" + txttransaction_name.GetData() + "&val2=" + p_data + "&val3=" + lstCompany.GetData() + "&dsqlid=ACNT.SP_SEL_ACCOUNT_NEW_DRCR";
    aValue      =   System.OpenModal(  fpath , 750 , 550 , 'resizable:yes;status:yes');	
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
                    if ((p_data == 'D') && (txtStatus.GetData() == 1 || txtStatus.GetData() == ''))  
                    {
                        grdDebit.SetGridText( grdDebit.selrow, 15, 'D' );
					    grdDebit.SetGridText( grdDebit.selrow,  3, '1' );
					    grdDebit.SetGridText( grdDebit.selrow, 1, tmp[1]);
					    grdDebit.SetGridText( grdDebit.selrow, 4, tmp[4]);
					    grdDebit.SetGridText( grdDebit.selrow, 5, tmp[5]);
					    grdDebit.SetGridText( grdDebit.selrow, 16, GetBookExRate(_Book_CCY));
					    click_dr = 0;
                        click_cr = 0;
					    RowClick_DR();
                    }
                    else if ((p_data == 'C') && (txtStatus.GetData() == 1 || txtStatus.GetData() == ''))
                    {
                        grdCredit.SetGridText( grdCredit.selrow, 15, 'C' );//account type
					    grdCredit.SetGridText( grdCredit.selrow,  3, '1' );//
					    grdCredit.SetGridText( grdCredit.selrow, 1, tmp[1]);//
					    grdCredit.SetGridText( grdCredit.selrow, 4, tmp[4]);//
					    grdCredit.SetGridText( grdCredit.selrow, 5, tmp[5]);//
					    grdCredit.SetGridText( grdDebit.selrow, 16, GetBookExRate(_Book_CCY));
					    var ls_ref;
					    if (grdDebit.selrow != -1)
					    {
					        ls_ref = grdDebit.GetGridData(grdDebit.selrow, 3);
					    }
					    else
					    {
					        ls_ref = 1;
					    }
					    grdCredit.SetGridText(grdCredit.rows - 1, 3, ls_ref);
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
 //-------------------------------------------------------------------------------------------------------------------------------
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
	    
	    if (event.col == 9){
        
          var col_3='';
          col_3 = grdCredit.GetGridData(grdCredit.row,3);
         
          if(txtEACAB032.GetData()=='N' && col_3==1 ){
             grdCredit.row=-1;
            return;
           } 
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
            
            txthgtrd.SetDataText(grdCredit.GetGridData(grdCredit.selrow, 0));
            txt_rowclick.text = grdCredit.selrow;
            txt_drcr_type.SetDataText('C');
            
            click_dr = 0;
            click_cr = grdCredit.selrow;
           
        }
        
        OnCheckSumCR();
    }
}
 //-------------------------------------------------------------------------------------------------------------------------------
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
 //-------------------------------------------------------------------------------------------------------------------------------
function DBPopupClick_DR()
{
    if (event.col == 4)
	{
	    Popup_OnSelect_Acc('D');
    }
} 
 //-------------------------------------------------------------------------------------------------------------------------------
function RowEditDR()
{
    var dr_famt = 0;
    var dr_bamt = 0;
    var dr_rate = 0;
    var book_rate = 1;
    
    _book_rate = grdDebit.GetGridData(event.row, 17);
    if (event.col == 6 || event.col == 8 || event.col == 7 || event.col == 17)
    {
        txtcur.text = grdDebit.GetGridData(event.row, 6);
        txt_row.text = event.row;
        //alert(event.col);
        dr_famt = Number(grdDebit.GetGridData(event.row, 8));
        dr_bamt = Number(grdDebit.GetGridData(event.row, 9));
        if(dr_famt != 0.00 || dr_famt != 0)
        {
            grdDebit.SetGridText(event.row, 18, Math.round(Number((dr_bamt/dr_famt))));
        }
        book_rate = GetBookExRate(txtcur.text);
       if(event.col == 6)
       {
            grdDebit.SetGridText(event.row, 7, book_rate);
       }
        dr_rate = Number(grdDebit.GetGridData(event.row, 7));
        //alert('book_rate=' + book_rate + '  ,dr_famt=' + dr_famt + ',dr_bamt=' + dr_bamt);
       
        
        if(_book_col_format.indexOf(".")>0)
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
    OnSumDR();
} 
 //-------------------------------------------------------------------------------------------------------------------------------
 function onNew()
{
    if (dso_udp_ctl_mst_slip_entry.GetStatus() != 20)
    {
        dso_udp_ctl_mst_slip_entry.StatusInsert();
    }
    grdDebit.ClearData();
    grdCredit.ClearData();
    txtProposedByUserPk.text="<%=Session("USER_PK")%>";
    dso_ctl_getProposedBy.Call("SELECT");
    SetButtonCtl(true);
    SetButtonEnable();
  //  btnTreament.SetEnable(false);
 //   OnCtrToggleRight();
    txtsum_chk_dr_famt.SetDataText('');
    txtsum_chk_dr_amt.SetDataText('');
    txtsum_chk_cr_famt.SetDataText('');
    txtsum_chk_cr_amt.SetDataText('');
    txtsum_total_dr_famt.SetDataText('');
    txtsum_total_dr_amt.SetDataText('');
    txtsum_total_cr_famt.SetDataText('');
    txtsum_total_cr_amt.SetDataText('');
    btnReplicate.SetEnable(false);
    txttransaction_code.SetDataText('');
    txttransaction_name.SetDataText('');
    txtDescription.SetDataText('');
    txtLocalDescription.SetDataText('');
    var ls_data7    = "<%=ESysLib.SetDataSQL("SELECT DECODE(B.CODE, 'Y', 'T', 'F') FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'EACAB004' AND B.DEF_YN = 'Y' AND A.DEL_IF = 0 AND B.DEL_IF = 0")%>";
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
    txttransaction_code.GetControl().focus();
   
}

//-------------------------------------------------------------------------------------------------------------------------------
function OnToggle(pos)
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");   
    var imgArrow1 = document.all("imgArrow1");   
    var imgArrow2 = document.all("imgArrow2"); 
    
    if ( pos == '1' ) 
    { 
        if ( imgArrow1.status == "expand" && imgArrow2.status == "expand" )
        {
            left.style.display  ="none";
            right.style.display ="";      
            
            right.style.width  ="100%";
            
            imgArrow1.status = "collapse";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="none";
            imgArrow2.style.display="";                         
        }
        else if ( imgArrow1.status == "expand" && imgArrow2.status == "collapse" )
        {
            left.style.display  ="";
            right.style.display ="";
            
            left.style.width   ="50%";
            right.style.width  ="50%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
        }
    }    
    else
    {
        if ( imgArrow1.status == "expand" && imgArrow2.status == "expand" )
        {
            left.style.width ="100%";
            
            right.style.display ="";       
            right.style.display ="none";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "collapse";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="none";                        
        }
        else if ( imgArrow1.status == "collapse" && imgArrow2.status == "expand" )
        {
            left.style.display  ="";
            right.style.display ="";
                    
            left.style.width   ="50%";
            right.style.width  ="50%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
        }
    }    
}
//-------------------------------------------------------------------------------------------------------------------------------
function onSave()
{
    if (Check_Master_Ctl())
    {
        dso_udp_ctl_mst_slip_entry.Call();
    }
}
//-------------------------------------------------------------------------------------------------------------------------------
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
//-------------------------------------------------------------------------------------------------------------------------------
function Check_Master_Ctl()
{
    if(!CanChange()) return false;
    
    if (txttransaction_code.GetData() == '')
    {
        alert('  Transaction Type is not null.Please check again!!!'+'\n'+'Loại giao dịch không được rỗng. Bạn hãy kiểm tra lại!!!');
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
//-------------------------------------------------------------------------------------------------------------------------------
function OnSearch()
{
    dso_Search.Call("SELECT");
}
//-------------------------------------------------------------------------------------------------------------------------------
function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {
        case "dso_ctl_getProposedBy":
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
        
        case "dso_udp_ctl_mst_slip_entry":
            txttrans_code_tmp.text = txttransaction_code.GetData();
            SetButtonEnable();
             lstVoucherTypePrint.value = lstVoucherType.value;
            
            if (flag_select == true){
           
                txt_drcr_type.SetDataText('D');
                dso_upd_grd_dtl_slip_entry_dr.Call("SELECT");
            }
        break;
        
        case "dso_upd_grd_dtl_slip_entry_dr":
            OnCloseData();
            if (flag_select == true)
            {
                txt_drcr_type.SetDataText('C');
                dso_upd_grd_dtl_slip_entry_cr.Call("SELECT");
            }
            else{
                click_dr = 0;
                click_cr = 0;
                SaveItemControl();
            }           
            for (i=1;i<=grdDebit.rows-1;i++)
            {
                grdDebit.SetCellBgColor(i,17,i,17,Number(0XCDFAFF));
            }  
        break;
        
        case "dso_upd_grd_dtl_slip_entry_cr":
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
                grdCredit.SetCellBgColor(i,17,i,17,Number(0XCDFAFF));
            }  
        break;
                    
        break;
        case "dso_upd_confirm_cancel":
            SetButtonEnable();
            GridOnCellClick();
        break;
        case "dso_upd_replicate":
            SetButtonEnable();
            GridOnCellClick();
        break;
        case "dso_upd_copy":
            SetButtonEnable();
            GridOnCellClick();
        break;
        case "dso_get_exrate_list":
       
            _book_rate = GetBookExRate(_Book_CCY);
            lblBookRate.text = _book_rate;
           
            dso_Amt.Call("SELECT");
        break;
    }
}  
//-------------------------------------------------------------------------------------------------------------------------------
function OnUpdateBookRate()
{
    dso_get_exrate_list.Call();
}
//-------------------------------------------------------------------------------------------------------------------------------
function SaveItemControl()
{
    if (idGridItem.rows > 1)
	{
	    for (i = 1; i<idGridItem.rows; i++)
	    {
            if (txt_drcr_type.GetData() == 'D')
            {
                if ((idGridItem.GetGridData(i, 0) == '') && (idGridItem.GetGridData(i, 9) !='' ))
                {
                    idGridItem.SetGridText(i, 1, grdDebit.GetGridData(txt_rowclick.text, 0));
                    idGridItem.SetRowStatus(i, 0x20);
                }
                //idGridItem.SetGridText(i, 1, grdDebit.GetGridData(txt_rowclick.text, 0));
                txtacpk.SetDataText(grdDebit.GetGridData(txt_rowclick.text, 1));
                txthgtrd.SetDataText(grdDebit.GetGridData(txt_rowclick.text, 0));
            }
            else if (txt_drcr_type.GetData() == 'C')
            {
                if (idGridItem.GetGridData(i, 0) == '')
                {
                    idGridItem.SetGridText(i, 1, grdCredit.GetGridData(txt_rowclick.text, 0));
                    idGridItem.SetRowStatus(i, 0x20);
                }
                //idGridItem.SetGridText(i, 1, grdCredit.GetGridData(txt_rowclick.text, 0));
                txtacpk.SetDataText(grdCredit.GetGridData(txt_rowclick.text, 1));
                txthgtrd.SetDataText(grdCredit.GetGridData(txt_rowclick.text, 0));
            }
	    }
	    dso_upd_ctl_item.Call("");
    }
}
//-------------------------------------------------------------------------------------------------------------------------------
function GridOnCellClick()
{
    if ( grid_search.row > 0 )
    {
       
        txtseq.text = grid_search.GetGridData( grid_search.row,0);
       // gSave = false;
        dso_udp_ctl_mst_slip_entry.Call("SELECT");
        grdDebit.SetData("");
       flag_select = true; 
       // grdCredit3.SetData("");
    }
}
//-------------------------------------------------------------------------------------------------------------------------------
function OnSetDescriptionDetail()
{
    for (i = 1; i < grdDebit.rows; i++)
    {
        grdDebit.SetGridText( i, 10, txtDescription.GetData());
        grdDebit.SetGridText( i, 11, txtLocalDescription.GetData());
    }
    for (i = 1; i < grdCredit.rows; i++)
    {
        grdCredit.SetGridText( i, 10, txtDescription.GetData());
        grdCredit.SetGridText( i, 11, txtLocalDescription.GetData());
    }
}

//-------------------------------------------------------------------------------------------------------------------------------
function SetButtonEnable()
{
    
    if (txtStatus.GetData() == 1) // Save
    {
        btnConfirm.SetEnable(true);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(false);
        btnCopy.SetEnable(true);
        SetButtonCtl(true);
    }
    else if (txtStatus.GetData() == 2) // Comfirm
    {
        //alert('hehe');
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(true);
        btnReplicate.SetEnable(false);
        btnCopy.SetEnable(true);
        SetButtonCtl(false);
    }
    else if (txtStatus.GetData() == 3) // Cancel
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(true);
        btnCopy.SetEnable(false);
        SetButtonCtl(false);
    }
    else if (txtStatus.GetData() == '') // New
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(false);
        btnCopy.SetEnable(false);
        SetButtonCtl(true);
    }
    else if (txtStatus.GetData() == 0) // Approve
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(false);
        btnCopy.SetEnable(true);
        SetButtonCtl(false);
    }
    else if (txtStatus.GetData() == 4) // No Approve
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(false);
        btnCopy.SetEnable(false);
        SetButtonCtl(false);
    }
}
//-------------------------------------------------------------------------------------------------------------------------------
function SetButtonCtl(p_data)
{
    btnNew_Dr.SetEnable(p_data);
    btnSave_Dr.SetEnable(p_data);
    btnDel_Dr.SetEnable(p_data);
    btnUp_Dr.SetEnable(p_data);
    btnDown_Dr.SetEnable(p_data);
        
    btnNew_Cr.SetEnable(p_data);
    btnSave_Cr.SetEnable(p_data);
    btnDel_Cr.SetEnable(p_data);
    btnUp_Cr.SetEnable(p_data);
    btnDown_Cr.SetEnable(p_data);
   // btnTreament.SetEnable(p_data);
    ibtnDelete.SetEnable(p_data);
    ibtnSave.SetEnable(p_data);
}
//-------------------------------------------------------------------------------------------------------------------------------
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
//-------------------------------------------------------------------------------------------------------------------------------
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
//-------------------------------------------------------------------------------------------------------------------------------
function OnCloseData()
{
    for (i = 1; i < grdDebit.rows; i++)
    {
        grdDebit.SetGridText( i, 14, i);
        grdDebit.SetRowEditable(i, false);
    }
    for (i = 1; i < grdCredit.rows; i++)
    {
        grdCredit.SetGridText( i, 14, i);
        grdCredit.SetRowEditable(i, false);
    }
}
//-------------------------------------------------------------------------------------------------------------------------------
function RecordViewer_Dr()
{
            var ctrl 	= grdDebit.GetGridControl();
	        var rows    = ctrl.Rows;
	        rows = rows - 1;  
	      var tac_hgtrd_pk = '';
	     if(rows !=0)
	      { 
	                  
	                    tac_hgtrd_pk =  grdDebit.GetGridData(grdDebit.row, 0)
	                
	                    var path = System.RootURL + '/form/tutorial/ab/SlipEntry_Preview.aspx?tac_hgtrd_pk=' + tac_hgtrd_pk + '&row=' + grdDebit.row + '&_rows=' + rows + '&trans_cd=' +  txttransaction_code.text + '&trans_nm=' + txttransaction_name.text + '&company_pk=' + lstCompany.value;
                        var wWidth  = 700;
                        var wHeight = 768;
                        var x = Math.round((screen.availWidth - wWidth)/2);
                        var y = Math.round((screen.availHeight - wHeight)/2);
                        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
                           "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
                           "lef="+ x +",top=" + y;
                        this.name = "SlipEntry_Preview";
                        var object = System.OpenModal(path, wWidth, wHeight, features,window); 
           }
           else
           {
                    alert("Not data to show popup!!");
           }     
}
//-------------------------------------------------------------------------------------------------------------------------------
function GetRowPK(row_index)
{
    if((row_index < grdDebit.rows) && (row_index > 0))
    {
        return grdDebit.GetGridData(row_index, 0);
    }
    return -1;
}
//-------------------------------------------------------------------------------------------------------------------------------
function OnTransactionPopUp()
{
    if (txtStatus.GetData() != '')
    {
        alert('You can not change Transaction Type!!!'+'\n'+'Bạn không thể thay đổi loại giao dịch');
        return;
    }
    txttransaction_code.text = "";
    txttransaction_name.text = "";
    txtDescription.text      = "";
    txtLocalDescription.text = "";
    
    grdDebit.ClearData();
    grdCredit.ClearData();
    var path = System.RootURL + '/form/gf/hg/gfhg00010_transaction.aspx?compk='+ lstCompany.GetData();
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
					grdDebit.SetGridText( grdDebit.rows - 1, 10, txtDescription.text);         //Desc Eng
					grdDebit.SetGridText( grdDebit.rows - 1, 11, txtLocalDescription.text);    //Desc Local
					grdDebit.SetGridText( grdDebit.rows - 1, 13, txtseq.text);
					grdDebit.SetRowEditable(grdDebit.rows - 1, false);
					grdDebit.SetGridText( grdDebit.rows - 1, 17, GetBookExRate(_Book_CCY));
					
				}
				else if (tmp1[0] == "C")
				{
					grdCredit.AddRow();
					grdCredit.SetGridText( grdCredit.rows - 1,  3, '1' );
					grdCredit.SetGridText( grdCredit.rows - 1, 1, tmp1[2] ); //ACPK
					grdCredit.SetGridText( grdCredit.rows - 1, 4, tmp1[5] ); //Account Code
					grdCredit.SetGridText( grdCredit.rows - 1, 5, tmp1[6] ); //Account Name
					grdCredit.SetGridText( grdCredit.rows - 1, 10, txtDescription.text );       //Desc Eng
					grdCredit.SetGridText( grdCredit.rows - 1, 11, txtLocalDescription.text );  //Desc Local
					grdCredit.SetGridText( grdCredit.rows - 1, 13, txtseq.text);
					grdCredit.SetRowEditable(grdCredit.rows - 1, false);
					grdCredit.SetGridText( grdCredit.rows - 1, 17, GetBookExRate(_Book_CCY));
				}
			}
		}
	}
}
//-------------------------------------------------------------------------------------------------------------------------------
function onDelete()
{
    
    if (txtStatus.GetData() == '') // Save
    {
        return;
    }
    if (txtStatus.GetData() == 1) // Save
    {
        //var path = System.RootURL + '/form/gf/hg/gfhg00010_causecancel.aspx?com_pk='+ lstCompany.GetData() + '&seq=' + txtseq.GetData() + '&status=' + txtStatus.GetData() + '&userid=' + txtProposedByUserID.GetData() + '&usernm=' + txtProposedByUserName.GetData() + '&userpk=' + txtProposedByUserPk.GetData();
        var path = System.RootURL + '/form/gf/hg/gfhg00010_causecancel.aspx?com_pk='+ lstCompany.GetData() + '&seq=' + txtseq.GetData() + '&status=' + txtStatus.GetData() + '&userid=' + txtProposedByUserID.GetData() + '&usernm=' + txtProposedByUserName.GetData() + '&userpk=' + txtProposedByUserPk.GetData() + '&dsqlid=ACNT.SP_PRO_CTL_MST_CONFIRM_CANCEL';
        var object = System.OpenModal( path,  400 , 400,'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no');
        if ( object != null )
        {
            if (object[0] !=0)
            {
                txtseq.text = object[0];
                GridOnCellClick();
            }
        }
    }
    else
    {
        alert('You did not delete SEQ!!!'+'\n'+'Bạn không thể xóa SEQ này!!!');
        return false;
    }
}
//-------------------------------------------------------------------------------------------------------------------------------
function OnConfirm()
{
    if(!CanChange()) return;
    
    dso_upd_confirm.Call();
}
//-------------------------------------------------------------------------------------------------------------------------------
function OnCopy()
{
    dso_upd_copy.Call();
}
//-------------------------------------------------------------------------------------------------------------------------------
function OnReplicate()
{
    dso_upd_replicate.Call();
}
//-------------------------------------------------------------------------------------------------------------------------------
function OnConfirmCancel()
{
    var path = System.RootURL + '/form/gf/hg/gfhg00010_causecancel.aspx?com_pk='+ lstCompany.GetData() + '&seq=' + txtseq.GetData() + '&status=' + txtStatus.GetData() + '&userid=' + txtProposedByUserID.GetData() + '&usernm=' + txtProposedByUserName.GetData() + '&userpk=' + txtProposedByUserPk.GetData() + '&dsqlid=ACNT.SP_PRO_CTL_MST_CONFIRM_CANCEL' + '&table=TAC_HGTRH';
    var object = System.OpenModal( path,  400 , 400,'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no,copyhistory=no');
    if ( object != null )
    {
        if (object[0] !=0)
        {
            txtseq.text = object[0];
            GridOnCellClick();
        }
    }
}
//-------------------------------------------------------------------------------------------------------------------------------
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
//-------------------------------------------------------------------------------------------------------------------------------
function OnNewDr()
{
    if (txttransaction_code.GetData() != '')
    {
        //OnCtrToggleRight();
        Popup_OnNew('D');
    }
    else
    {
        alert('Please Choose Transaction Type!!!'+'\n'+'    Bạn hãy chọn loại giao dịch!!!');
        return;
    }
} 
//-------------------------------------------------------------------------------------------------------------------------------
function OnSaveDr()
{
    if(!CheckDataIsValid()) return;
    if ((txt_drcr_type.GetData() == 'D') && (grdDebit.rows > 1))
    {
        for (i = 1; i < grdDebit.rows; i++)
        {
            if ((grdDebit.GetGridData(i, 13) == "") && (grdDebit.GetGridData(i, 9) != ''))
            {
                grdDebit.SetGridText(i, 13, txtseq.GetData());
                grdDebit.SetRowStatus(i, 0x20);
            }            
            if (grdDebit.GetGridData(i, 9) == '')
            {
                grdDebit.SetGridText(i, 13, txtseq.GetData());
                grdDebit.SetGridText(i, 8, 0);
                grdDebit.SetGridText(i, 9, 0);
            }
            grdDebit.SetGridText(i, 15, 'D');
            if (grdDebit.GetGridData(i, 10) == "")
            {
                grdDebit.SetGridText(i, 10, txtDescription.GetData());
            }
            if (grdDebit.GetGridData(i, 11) == "")
            {
                grdDebit.SetGridText(i, 11, txtLocalDescription.GetData());
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
                    grdDebit.SetGridText(i, 13, txtseq.GetData());
                }
                grdDebit.SetGridText(i, 14, i - j);
            }
        }
        txt_rowclick.text = grdDebit.selrow;
        dso_upd_grd_dtl_slip_entry_dr.Call();
    }
}
//-------------------------------------------------------------------------------------------------------------------------------
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
                  
                  
                }
            }
            dso_upd_grd_dtl_slip_entry_dr.Call();
        }
    }
}
//-------------------------------------------------------------------------------------------------------------------------------
function OnUpDr()
{
	var lb_flag
    ctrl = grdDebit.GetGridControl();
	var rows = ctrl.Rows  - 1;
	
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
                
                grdDebit.SetCellBold(i,1,i,18,false);
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
//-------------------------------------------------------------------------------------------------------------------------------
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
//-------------------------------------------------------------------------------------------------------------------------------
function RowClick_DR()
{
    if (grdDebit.rows < 2)
    {
        return;
    }
	else
	{
	   // alert(grdDebit.row);
	  
	    if (grdDebit.selrow < 1)
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
             txtgridtac_abacctcode_pk.SetDataText(grdDebit.GetGridData(grdDebit.selrow,1));
            txthgtrd.SetDataText(grdDebit.GetGridData(grdDebit.selrow, 0));
            txt_rowclick.text = grdDebit.selrow;
            txt_drcr_type.SetDataText('D');
          
            click_dr = grdDebit.selrow;
            click_cr = 0;
           // dso_upd_ctl_item.Call("SELECT"); chua lam
        }
        
        OnCheckSumDR();
    }
}

//-------------------------------------------------------------------------------------------------------------------------------
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
//-------------------------------------------------------------------------------------------------------------------------------
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
//-------------------------------------------------------------------------------------------------------------------------------
function OnNewCr()
{
    if (txttransaction_code.GetData() != '')
    {
        
        Popup_OnNew('C');
    }
    else
    {
        alert('Please Choose Transaction Type!!!'+'\n'+'    Bạn hãy chọn loại giao dịch!!!');
        return;
    }
}
//-------------------------------------------------------------------------------------------------------------------------------

function CheckDataIsValid()
{
    if(!CanChange()) 
    return false;
    if (txtseq.GetData() == '')
    {
        alert(' Please save before master');
        return false;
    }
	return true;
}
//-------------------------------------------------------------------------------------------------------------------------------
function OnSaveCr()
{
    if(!CheckDataIsValid()) return;
    
  
    
    if ((txt_drcr_type.GetData() == 'C') && (grdCredit.rows > 1))
    {
        for (i = 1; i < grdCredit.rows; i++)
        {
            if ((grdCredit.GetGridData(i, 13) == "") && (grdCredit.GetGridData(i, 9) != ''))
            {
                grdCredit.SetGridText(i, 13, txtseq.GetData());
                grdCredit.SetRowStatus(i, 0x20);
            }
            if (grdCredit.GetGridData(i, 9) == '')
            {
                grdCredit.SetGridText(i, 13, txtseq.GetData());
                grdCredit.SetGridText(i, 8, 0);
                grdCredit.SetGridText(i, 9, 0);
            }
            grdCredit.SetGridText(i, 15, 'C');
            if (grdCredit.GetGridData(i, 10) == "")
            {
                grdCredit.SetGridText(i, 10, txtDescription.GetData());
            }
            if (grdCredit.GetGridData(i, 11) == "")
            {
                grdCredit.SetGridText(i, 11, txtLocalDescription.GetData());
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
                    grdCredit.SetGridText(i, 13, txtseq.GetData());
                }
                grdCredit.SetGridText(i, 14, i - j);
            }
        }
        txt_rowclick.text = grdCredit.selrow;
        dso_upd_grd_dtl_slip_entry_cr.Call();
    }
}
//-------------------------------------------------------------------------------------------------------------------------------
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
               
                  
                }
                dso_upd_grd_dtl_slip_entry_cr.Call();
            }
        }
    }
}
//-------------------------------------------------------------------------------------------------------------------------------
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
//-------------------------------------------------------------------------------------------------------------------------------
function RowEditCR()
{
    var cr_famt = 0;
    var cr_bamt = 0;
    var cr_rate = 0, book_rate = 1;
    _book_rate = grdCredit.GetGridData(event.row, 17);
    
    if (event.col == 6 || event.col == 8 || event.col == 7 || event.col == 17){
       
        cr_bamt = grdCredit.GetGridData(event.row, 9);
        cr_famt = Number(grdCredit.GetGridData(event.row, 8)); 
        if(cr_famt !=0 || cr_famt!=0.00)
        {      
            grdCredit.SetGridText(event.row, 18, Math.round(Number((cr_bamt/cr_famt))));
        }    
        ///alert(Math.round(Number((cr_bamt/cr_famt)*_book_rate)));
        txtcur.text = grdCredit.GetGridData(event.row, 6);
        txt_row.text = event.row;
        
        book_rate = GetBookExRate(txtcur.text);
        if(event.col == 6){
        grdCredit.SetGridText(event.row, 7, book_rate);}
        cr_rate = Number(grdCredit.GetGridData(event.row, 7));
         
        if(_book_col_format.indexOf(".")>0){
            var book_amt = (Number(cr_famt*(cr_rate/_book_rate)));
            book_amt = System.Round(book_amt,2);
            grdCredit.SetGridText(event.row, 9, book_amt);
        }
        else{
            grdCredit.SetGridText(event.row, 9, Math.round(Number(cr_famt*(cr_rate/_book_rate))));
        }
    }
    OnSumCR();
}
//-------------------------------------------------------------------------------------------------------------------------------
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
//-------------------------------------------------------------------------------------------------------------------------------
function DBPopupClick_CR()
{
    if (event.col == 4)
	{
	    Popup_OnSelect_Acc('C');
    }
}
//-------------------------------------------------------------------------------------------------------------------------------
function GetRowPK(row_index)
{
    if((row_index < grdDebit.rows) && (row_index > 0))
    {
        return grdDebit.GetGridData(row_index, 0);
    }
    return -1;
     
}
</script>

<body>
    <gw:data id="dso_Search" onreceive="OnDataReceive(this)">
    <xml>
        <dso type="grid" function="ACNT.sp_sel_gfhg00010_v1">
            <input bind="grid_search">
                <input bind="lstCompanySearch"/>
                <input bind="dtFr"/>
                <input bind="dtTo"/>
                <input bind="lstVoucherTypeSearch"/>
                <input bind="lstStatusSearch"/>
                <input bind="txtVoucherNoSearch"/>
                <input bind="txtSeq_S"/>
                <input bind="txtDesSearch"/>
            </input>
            <output bind="grid_search"/>
        </dso>
    </xml>
</gw:data>
    <!------------------------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_get_exrate_list" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="list" procedure="acnt.sp_sel_tac_abexrates_list"> 
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
    <!------------------------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_udp_ctl_mst_slip_entry" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17" function="ACNT.SP_SEL_CTL_MST_SLIP_ENTRY_v1" procedure="ACNT.SP_UDP_CTL_MST_SLIP_ENTRY">
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
                <inout bind="txttrans_pk"/>
                <inout bind="txttransaction_code"/>
                <inout bind="txttransaction_name"/>
                <inout bind="txtDescription"/>
                <inout bind="txtLocalDescription"/>
                <inout bind="lblStatus"/>
                <inout bind="txtEnclose"/>
            </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_ctl_getProposedBy" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="control" function= "ACNT.SP_GET_PROPOSED_BY_ID_NAME">
                <inout>
                    <inout bind="txtProposedByUserPk" />
                    <inout bind="txtProposedByUserID"/>
                    <inout bind="txtProposedByUserName"/>
                    <inout bind="lstDepartment"/>
                </inout>
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_Amt" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid"  function="acnt.rpt_sel_gfbr00030_2" >
                <input bind="grdAmt" >
                    <input bind="txtseq"/>
                </input>
                <output bind="grdAmt" />
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_sel_trans_debit" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2,3" function="acnt.SP_SEL_ACCOUNT_DRCR">
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
    <!------------------------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_sel_trans_credit" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2,3" function="acnt.SP_SEL_ACCOUNT_DRCR">
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
    <!------------------------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_upd_grd_dtl_slip_entry_dr" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,3,4,5,6,7,8,9,10,11,12,13,14,15,17,18" function="acnt.SP_SEL_GRD_DTL_SLIP_ENTRY" procedure="acnt.SP_UPD_GRD_DTL_SLIP_ENTRY">
                <input bind="grdDebit" >
                    <input bind="txtseq"/>
                    <input bind="txt_drcr_type"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="grdDebit" />
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_upd_grd_dtl_slip_entry_cr" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,3,4,5,6,7,8,9,10,11,12,13,14,15,17,18" function="acnt.SP_SEL_GRD_DTL_SLIP_ENTRY" procedure="acnt.SP_UPD_GRD_DTL_SLIP_ENTRY">
                <input bind="grdCredit">
                    <input bind="txtseq"/>
                    <input bind="txt_drcr_type"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="grdCredit"/>
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------------------->
     <gw:data id="dso_upd_copy" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ACNT.SP_AUTOTR_REGENERATE_COPY"> 
                <input> 
                     <input bind="txtseq"/>
                     <input bind="lstCompany"/>
                </input>
                <output>
                     <output bind="txtseq"/>
                     <output bind="txtStatus"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------------------->
      <gw:data id="dso_upd_confirm" onreceive="SetButtonEnable()"> 
        <xml> 
            <dso type="process" procedure="ACNT.SP_PRO_CTL_MST_CONFIRM" > 
                <input> 
                     <input bind="txtseq"/>
                     <input bind="lstCompany"/>
                </input>  
                <output>  
                     <output bind="txtStatus"/>
                     <output bind="txtvoucher_auto"/>
                     <output bind="txtvoucher_no"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------------------->
 <gw:data id="dso_upd_replicate" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="ACNT.SP_AUTOTR_REGENERATE"> 
                <input> 
                     <input bind="txtseq"/>
                     <input bind="lstCompany"/>
                </input>
                <output>
                     <output bind="txtseq"/>
                     <output bind="txtStatus"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>   
    <!------------------------------------------------------------------------------------------------------------------------------->    
 <gw:data id="dso_pro_get_transname" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ACNT.SP_PRO_GET_TRANS_NAME" > 
                <input> 
                     <input bind="txttransaction_code"/>
                     <input bind="lstCompany"/>
                </input>
                <output>
                     <output bind="txttransaction_name"/>
                     <output bind="txttrans_pk"/>
                     <output bind="txtDescription"/>
                     <output bind="txtLocalDescription"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
     <!------------------------------------------------------------------------------------------------------------------------------->    
    
       <gw:data id="dso_upd_confirm_cancel" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ACNT.SP_PRO_CTL_MST_CONFIRM_CANCEL" > 
                <input> 
                     <input bind="txtseq"/>
                     <input bind="lstCompany"/>
                </input>
                <output>
                     <output bind="txtStatus"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------------------------------------------------------->        
    <table style="height: 100%; width: 100%">
        <tr>
            <td style="background: white; width: 30%" id="idLEFT">
                <table style="height: 100%; width: 100%;" cellpadding="0" cellspacing="0">
                    <tr style="height: 5%; width: 100%">
                        <td>
                            <fieldset style="width: 100%">
                                <table style="width: 100%">
                                    <tr>
                                        <td align="right" width="20%">
                                            Company</td>
                                        <td colspan="3" width="80%">
                                            <gw:list id="lstCompanySearch" onchange="OnSearch()" styles="width:100%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20%" align="right">
                                            <a title="Entry date" style="color=#ffff00"><font color="#000000">Date</font></a></td>
                                        <td width="40%" align="left">
                                            <gw:datebox id="dtFr" lang="1" styles="width:100%;" />
                                        </td>
                                        <td align="center">
                                            ~</td>
                                        <td width="40%">
                                            <gw:datebox id="dtTo" lang="1" styles="width:100%;" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20%" align="right">
                                            <a title="Voucher type" style="color=#ffff00"><font color="#000000">Type</font></a></td>
                                        <td width="80%" colspan="3">
                                            <gw:list id="lstVoucherTypeSearch" onchange="OnSearch()" styles="width:100%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20%" align="right">
                                            <a title="Voucher status" style="color=#ffff00"><font color="#000000">Status</font></a></td>
                                        <td width="80%" colspan="3">
                                            <gw:list id="lstStatusSearch" onchange="OnSearch()" styles="width:100%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20%" align="right">
                                            <a title="Voucher No" style="color=#ffff00"><font color="#000000">VC.No</font></a></td>
                                        <td width="80%" colspan="4">
                                            <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                <tr>
                                                    <td width="45%">
                                                        <gw:textbox id="txtVoucherNoSearch" onenterkey="OnSearch()" onchange="OnSearch()"
                                                            styles="width:100%" />
                                                    </td>
                                                    <td align="right" width="15%">
                                                        Seq&nbsp;</td>
                                                    <td width="40%">
                                                        <gw:textbox id="txtSeq_S" onchange="OnSearch()" onenterkey="OnSearch()" onkeypress="CheckNumeric()"
                                                            styles="width:100%" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="20%" align="right">
                                            <a title="Voucher No" style="color=#ffff00"><font color="#000000">Desc</font></a></td>
                                        <td width="80%" colspan="3">
                                            <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                <tr>
                                                    <td width="100%">
                                                        <gw:textbox id="txtDesSearch" onenterkey="OnSearch()" onchange="OnSearch()" styles="width:100%" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btnSearch" img="Search" alt="Search" onclick="OnSearch()" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 95%; width: 100%">
                        <td colspan="5" valign="top" width="40%">
                            <gw:grid id="grid_search" header="Seq|Voucher No.|Entry Date|_Company|Trs Type|Trs Name|Amount|Description|Status|Prps By"
                                format="0|0|4|0|0|0|0|0|2|0" aligns="1|1|1|0|1|0|3|0|0|0" defaults="|||||||||"
                                editcol="0|0|0|0|0|0|0|0|0|0" widths="1000|1400|1200|1300|800|2500|2000|2000|900|0"
                                styles="width:100%; height:100%" acceptnulldate="T" sorting="T" oncellclick="GridOnCellClick()" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="background: white; width: 70%" id="idRIGHT">
                <table style="height: 100%; width: 100%; background: #BDE9FF;">
                    <tr style="height: 10%; width: 100%">
                        <td style="background: white" colspan="3">
                            <!--    <fieldset style="width:100%;padding-top:2;padding-bottom:5;padding-left:0;padding-right:0" >-->
                            <table style="width: 100%; background: #CCFFFF">
                                <tr>
                                    <td width="10%">
                                        Company</td>
                                    <td width="40%" colspan="5">
                                        <gw:list id="lstCompany" styles="width:100%;" />
                                    </td>
                                    <td width="3%" align="right">
                                        Seq</td>
                                    <td width="10%">
                                        <gw:textbox id="txtseq" styles="width:100%" />
                                    </td>
                                    <td width="11%" align="right">
                                        <a title="Proposed By" style="color=#ffff00"><font color="#000000">Prop. by</font></a></td>
                                    <td width="12%" colspan="2">
                                        <gw:textbox id="txtProposedByUserID" styles="width:100%" />
                                    </td>
                                    <td width="1%" align="right">
                                        <gw:imgbtn id="btnNewMST" img="new" alt="New" onclick="onNew()" />
                                    </td>
                                    <td width="1%" align="right">
                                        <gw:imgbtn id="ibtnSave" img="save" alt="Save" onclick="onSave()" />
                                    </td>
                                    <td width="1%" align="right">
                                        <gw:imgbtn id="ibtnDelete" img="delete" alt="Delete" onclick="onDelete()" />
                                    </td>
                                    <td width="1%" align="right">
                                        <gw:imgbtn id="btnConfirm" img="confirm" alt="Confirm" onclick="OnConfirm()" />
                                    </td>
                                    <td width="1%" align="right">
                                        <gw:imgbtn id="btnCopy" img="copy" alt="Copy" onclick="OnCopy()" />
                                    </td>
                                    <td width="1%" align="right">
                                        <gw:imgbtn id="btnReplicate" img="revert" alt="Replicate" onclick="OnReplicate()" />
                                    </td>
                                    <td width="1%" align="right">
                                        <gw:imgbtn id="btnCancel" img="cancel" alt="Cancel" onclick="OnConfirmCancel()" />
                                    </td>
                                    <td width="1%" align="right">
                                        <gw:imgbtn id="btnPrintMST" img="excel" alt="Print Accounting Slip" onclick="OnPrint(0)" />
                                    </td>
                                    <td width="1%" align="right">
                                        <gw:imgbtn id="btnPrint2lMST" img="excel" alt="Print Receiving Voucher" onclick="OnPrint(1)" />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10%">
                                        <a title="Department" style="color=#ffff00"><font color="#000000">Dept.</font></a></td>
                                    <td width="30%" colspan="5">
                                        <gw:list id="lstDepartment" styles="width:100%;" />
                                    </td>
                                    <td width="10%" align="right">
                                        Type</td>
                                    <td width="40%" colspan="4">
                                        <gw:list id="lstVoucherType" styles="width:100%;" onchange="OnchangeLstType()" />
                                    </td>
                                    <td width="10%" align="right" colspan="3">
                                        Reports</td>
                                    <td width="30%" colspan="9">
                                        <gw:list id="lstReport" styles="width:100%;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10%">
                                        <a title="Transaction date" style="color=#ffff00"><font color="#000000">Date</font></a></td>
                                    <td width="30%" colspan="5">
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td width="10%">
                                                    <gw:datebox id="dtDate" lang="1" onchange="OnUpdateBookRate()" />
                                                </td>
                                                <td width="10%">
                                                    <a title="Booking Exchange rate" style="color=#ffff00"><font color="#000000">B.Rate:</font></a></td>
                                                <td width="20%">
                                                    <gw:label id="lblBookRate" styles="width:100%;" />
                                                </td>
                                                <td width="15%" align="right">
                                                    Status:&nbsp</td>
                                                <td width="45%">
                                                    <gw:label id="lblStatus" styles="width:100%;" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="10%" align="right">
                                        <a onclick="OnTransactionPopUp()" href="#tips" title="Get Transaction type">Trs. type</a></td>
                                    <td width="40%" colspan="13">
                                        <table cellpadding="0" cellspacing="0" style="width: 100%">
                                            <tr>
                                                <td width="40%">
                                                    <gw:textbox id="txttransaction_code" csstype="mandatory" onkeypress="Upcase()" onenterkey="OnEnterTrans_Code()"
                                                        styles="width:100%;" />
                                                </td>
                                                <td width="60%">
                                                    <gw:textbox id="txttransaction_name" styles="width:100%;" csstype="mandatory" />
                                                </td>
                                                <td>
                                                    <gw:imgbtn img="reset" id="btnDown_D" alt="Reset" onclick="txttransaction_code.text='';txttransaction_name.text='';txttrans_pk.text='';" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10%">
                                        <a title="Transaction date" style="color: #ffff00"><font color="#000000">VC.No</font></a></td>
                                    <td width="20%" colspan="5">
                                        <table style="width: 100%" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="65%">
                                                    <gw:textbox id="txtvoucher_no" styles="width:100%;" />
                                                </td>
                                                <td width="30%">
                                                    <gw:textbox id="txtvoucher_auto" styles="width:100%;" />
                                                </td>
                                                <td>
                                                    <gw:checkbox id="chkauto_YN" value="T" onclick="OnAutoYN()" />
                                                </td>
                                                <td width="5%">
                                                    Auto</td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="10%" align="right">
                                        <a title="Description" style="color=#ffff00"><font color="#000000">Desc.</font></a></td>
                                    <td width="40%" colspan="13">
                                        <gw:textbox id="txtDescription" csstype="mandatory" styles="width:100%;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="10%">
                                        <a title="Enclose" style="color=#ffff00"><font color="#000000">Enclose</font></a></td>
                                    <td width="40%" colspan="5">
                                        <gw:textbox id="txtEnclose" lang="1" onchange="OnUpdateBookRate()" />
                                    </td>
                                    <td width="10%" colspan="1" align="right">
                                        <a title="Local Description" style="color=#ffff00"><font color="#000000">L.Desc.</font></a></td>
                                    <td width="40%" colspan="13">
                                        <gw:textbox id="txtLocalDescription" csstype="mandatory" styles="width:100%;" />
                                    </td>
                                </tr>
                            </table>
                            <!--   </fieldset>-->
                        </td>
                    </tr>
                    <tr style="height: 90%; width: 100%">
                        <td style="background: white; width: 49%" id="t-left">
                            <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
                                <tr style="width: 100%; height: 5%" valign="top">
                                    <td valign="top">
                                        <fieldset style="width: 100%; height: 100%;">
                                            <legend>
                                                <gw:imgbtn img="popup1" id="btnDow" alt="Single Record Viewer" onclick="RecordViewer_Dr()" />
                                                <b style="text-decoration: none; color=#0000ff"></b></legend>
                                            <table style="width: 100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="5%" align="center">
                                                        <a onclick="OnSumDR()" href="#tips">Debit</a></td>
                                                    <td width="21%">
                                                        <gw:textbox id="txtsum_chk_dr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                    </td>
                                                    <td width="21%">
                                                        <gw:textbox id="txtsum_chk_dr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                    </td>
                                                    <td width="11%" align="center">
                                                        Total</td>
                                                    <td width="21%">
                                                        <gw:textbox id="txtsum_total_dr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                    </td>
                                                    <td width="21%">
                                                        <gw:textbox id="txtsum_total_dr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btnNew_Dr" img="new" alt="New" onclick="OnNewDr()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btnSave_Dr" img="save" alt="Save" onclick="OnSaveDr()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btnDel_Dr" img="delete" alt="Delete" onclick="OnDelDr()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn img="up1" id="btnUp_Dr" alt="Up" onclick="OnUpDr()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn img="down11" id="btnDown_Dr" alt="Down" onclick="OnDownDr()" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr style="width: 100%; height: 95%">
                                    <td colspan="11">
                                        <gw:grid id="grdDebit" header="_Pk|_Acc_pk|||Acc.Code|Acc.Name|Ccy|Rate|Amount Trans|Amount Book|Description|Local Description|_Expense Type|_m_pk|_ODR|_DRCR|_ChkTreat|Book Rate|Tmp Rate"
                                            format="0|0|3|0|0|0|0|0|0|2|0|0|0|0|0|0|0|0|0" 
                                            aligns="0|0|1|1|1|0|1|1|3|3|0|0|0|0|0|0|0|0|3"
                                            defaults="||||||VND||||||||||||" 
                                            editcol="0|0|1|1|0|0|1|1|1|1|1|1|1|0|0|0|0|1|0"
                                            widths="0|0|250|300|1000|2000|700|1000|1800|1800|3000|2500|1000|1000|1000|800|0|1000|1000"
                                            styles="width:100%; height:100%" 
                                            sorting="F" 
                                            oncelldblclick="DBPopupClick_DR()" 
                                            oncellclick="RowClick_DR()" 
                                            onafteredit="RowEditDR()"
                                            onselchange="RowClick_DR()" />
                                            />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 2%; white-space: nowrap;" align="center">
                            <img status="expand" id="imgArrow1" src="../../../system/images/button/previous.gif"
                                style="cursor: hand; position: center" onclick="OnToggle('1')" />
                            <img status="expand" id="imgArrow2" src="../../../system/images/button/next.gif"
                                style="cursor: hand; position: center;" onclick="OnToggle('2')" />
                        </td>
                        <td style="background: white; width: 49%" id="t-right">
                            <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
                                <tr style="width: 100%; height: 5%" valign="top">
                                    <td valign="top">
                                        <fieldset style="width: 100%; height: 100%;">
                                            <legend>
                                                <gw:imgbtn img="popup1" id="btnDown" alt="Single Record Viewer" onclick="" />
                                                <b style="text-decoration: none; color=#0000ff"></b></legend>
                                            <table style="width: 100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="5%" align="center">
                                                        <a onclick="OnSumCR()" href="#tips">Credit</a></td>
                                                    <td width="21%">
                                                        <gw:textbox id="txtsum_chk_cr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                    </td>
                                                    <td width="21%">
                                                        <gw:textbox id="txtsum_chk_cr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                    </td>
                                                    <td width="11%" align="center">
                                                        Total</td>
                                                    <td width="21%">
                                                        <gw:textbox id="txtsum_total_cr_famt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                    </td>
                                                    <td width="21%">
                                                        <gw:textbox id="txtsum_total_cr_amt" styles="width:100%" type="number" format="#,###,###,###,###.##R" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btnNew_Cr" img="new" alt="New credit" onclick="OnNewCr()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btnSave_Cr" img="save" alt="Save" onclick="OnSaveCr()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btnDel_Cr" img="delete" alt="Delete" onclick="OnDelCr()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn img="up1" id="btnUp_Cr" alt="Up" onclick="OnUpCr()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn img="down11" id="btnDown_Cr" alt="Down" onclick="OnDownCr()" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr style="width: 100%; height: 95%">
                                    <td colspan="11">
                                        <gw:grid id="grdCredit" header="_Pk|_Acc_pk|||Acc.Code|Acc.Name|Ccy|Rate|Amount Trans|Amount Book|Description|Local Description|_Expense Type|_m_pk|_ODR|_DRCR|_ChkTreat|Book Rate|Tmp Rate"
                                            format="0|0|3|0|0|0|0|0|0|2|0|0|0|0|0|0|0|0|0" 
                                            aligns="0|0|1|1|0|0|1|1|3|3|0|0|0|0|0|0|0|0|3"
                                            defaults="||||||VND||||||||||||" 
                                            editcol="0|0|1|1|0|0|1|1|1|1|1|1|1|0|0|0|0|1|1"
                                            widths="0|0|250|300|1000|2000|700|1000|1800|1800|3000|2500|1000|1000|1000|800|0|1000|1000"
                                            styles="width:100%; height:100%" 
                                            sorting="F" 
                                            oncelldblclick="DBPopupClick_CR()"
                                            oncellclick="RowClick_CR()" 
                                            onafteredit="RowEditCR()" 
                                            onselchange="RowClick_CR()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../system/images/left1.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle1()" />
    <gw:list id="lstVoucherTypePrint" style="display: none" />
    <gw:list id="lstBookExRate" styles="width:100%;display:none" />
    <gw:textbox id="txtProposedByUserPk" style="display: none" />
    <gw:textbox id="txtCustomerPk" style="display: none" />
    <gw:textbox id="txt_DRCR" style="display: none" />
    <gw:textbox id="txtStatus"  style="display: " />
    <gw:textbox id="txttrans_pk" style="display: none" />
    <gw:textbox id="txttrans_code_tmp" style="display: none" />
    <gw:textbox id="txtacpk" style="display: none" />
    <gw:textbox id="txt_drcr_type" style="display: none" />
    <gw:textbox id="txt_rowclick" style="display: none" />
    <gw:textbox id="txt_count" style="display: none" />
    <gw:textbox id="txthgtrd" style="display: none" />
    <gw:textbox id="txtcur" style="display: none" />
    <gw:textbox id="txtrate" style="display: none" />
    <gw:textbox id="txt_row" style="display: none" />
    <gw:textbox id="txtLang" style="display: none" />
    <gw:textbox id="txtEACAB018" style="display: none" />
    <gw:textbox id="txtEACAB032" style="display: none" />
    <gw:textbox id="txtgridtac_abacctcode_pk" style="display: none" />
    <gw:textbox id="txtProposedByUserName" style="display: none" />
    <gw:grid id="grdAmt" header="Ccy|Amt" format="0|0" aligns="0|0" defaults="|" editcol="0|0"
        widths="800|1500" styles="width:200; height:100;display:none" sorting="F" />
</body>
</html>
