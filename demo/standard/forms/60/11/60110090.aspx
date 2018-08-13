<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title> Installment Entry</title>
  </head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%> 
 
<script>
var g_company_pk = "<%=Session("COMPANY_PK")%>";
var click_tab0   = true;
var click_tab1   = true;
var click_tab2   = true;

function BodyInit()
{
    System.Translate(document);
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
    ls_date_fr = dtPay_duefr.value;
    ls_date_fr = ls_date_fr.substr(0, 4) + '01' + '01'; 
	var ls_Type        = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACAB002') FROM DUAL")%>";
	
	var ls_date        = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL")%>";
	var ls_Book_ccy    = "<%=CtlLib.SetListDataSQL("select a.code, a.code code_nm from tac_commcode_detail a, tac_commcode_master b where a.del_if = 0 and b.del_if = 0 and a.tac_commcode_master_pk = b.pk and b.id = 'ACBG0040' and a.def_yn = 'Y'")%>";
	
	lstBook_ccy.SetDataText(ls_Book_ccy);
	txt_date.SetDataText(ls_date);
	lstType.SetDataText(ls_Type);
    lstCompany.SetDataText(ls_data);
    lstCompany.value = g_company_pk ;	
    dtPay_duefr.SetDataText(ls_date_fr);
    dtPay_fr.SetDataText(ls_date_fr);
    
    txtcust_nm.SetEnable(false);
    txtpl_nm.SetEnable(false);
    
    lblRecord.SetDataText("0");
    txtchk.SetDataText("0");
    txttab.text = 0;
    SetGridData();
    Control_Menu();
    dso_sel_booksrate.Call();
    txtPONo.GetControl().focus();
	 txtProposedByUserPk.text = "<%=Session("USER_PK")%>";
    dso_getCompany.Call();
}
function OnDataReceive(obj)
{	
	if(obj.id=='dso_getCompany')
	{
		dso_sel_booksrate.Call();
	}

	
}

function SetGridData()
{
    var fg2 = grid_invoice.GetGridControl();
    
	
    if(lstBook_ccy.value == "VND")	
		fg2.ColFormat(11)   = "#,###,###,###,###,###,###,###,###,###R";    
	else
		fg2.ColFormat(11)   = "#,###,###,###,###,###,###,###,###.##R";    		
    fg2.ColFormat(9)    = "#,###,###,###,###,###,###,###,###,###R";
    fg2.ColFormat(10)   = "#,###,###,###,###,###,###,###,###.##R";    
}

function Reset_Cust()
{
    txtcust_cd.SetDataText("");
    txtcust_nm.SetDataText("");
    txtcust_pk.SetDataText("");
}

function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise
}

function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
	var x = c.toUpperCase().charCodeAt(0);
	event.keyCode = x;
}
function OnChkAll()
{
}

function OnCheck()
{
    var std_dt, etd_dt ;
    std_dt = dtPay_duefr.GetData();
	etd_dt = dtPay_dueto.GetData();
	if (parseInt(etd_dt) < parseInt(std_dt))
	{
		alert(' End Pay Due Date can’t be earlier than start date!!!'+'\n'+'Ngày kết thúc không thể nhỏ hơn ngày bắt đầu!!!');
		return false;
	}
	std_dt = dtPay_fr.GetData();
	etd_dt = dtPay_to.GetData();
	if (parseInt(etd_dt) < parseInt(std_dt))
	{
		alert(' End Pay Date can’t be earlier than start date!!!'+'\n'+'Ngày kết thúc không thể nhỏ hơn ngày bắt đầu!!!');
		return false;
	}
	if (txttab.GetData() == 2)
	{
	    if (txtseq.GetData() == '')
        {
            alert('    You must input SEQ to divide!!!'+'\n'+'Bạn hãy nhập số SEQ để phân ra!!!');
            return false;
        }
	}
	return true;
}

function OnSearch()
{
//--------------------------------------------    
    grid_invoice.ClearData();    
    OnCheckTab();
    if (OnCheck())
    {
                dso_sel_grd_payable_invoice.Call('SELECT');
    }
}

function OnCheckTab()
{
}

function Popup_Cust()
{
    var fpath   = System.RootURL + '/standard/forms/60/05/60050010_popup_4.aspx';
    var object  = System.OpenModal(fpath , 800 , 500 , 'resizable:yes;status:yes'); 
    if ( object != null )
    {
        if (object[1] != 0)
        {
            txtcust_pk.text    = object[0];
            txtcust_nm.text    = object[2];
            txtcust_cd.text    = object[1];
        }
    }
}

function Control_Menu()
{
    btnSelect.SetEnable(false);    
    btnChk.SetEnable(false);
    
    ibtnNew.SetEnable(false);
    ibtnSave.SetEnable(false);
    ibtnMerge.SetEnable(false);
	if(rbstatus.value == '2') // confirmed
	{
		btnSelect.SetEnable(false);
        ibtnNew.SetEnable(false);
        ibtnSave.SetEnable(false);
        ibtnMerge.SetEnable(false);
        btnSelect.SetEnable(true);        
        btnChk.SetEnable(true);		
	}
	else // unconfirmed
	{
		btnSelect.SetEnable(true);
		btnSelect.SetEnable(false);
        ibtnNew.SetEnable(true);
        ibtnSave.SetEnable(true);
        ibtnMerge.SetEnable(true);                
        btnChk.SetEnable(true);				
	}
}

function EnableTab(bool)
{
    click_tab0 = bool;
    click_tab1 = bool;
    click_tab2 = bool;
}

function onSearchTab()
{
    Control_Menu();
}

function OnChangeStatus()
{
    if (rbstatus.GetData() == 1)
    {
        lblDate.text = 'Trans Date';
    }
    else
    {
        lblDate.text = 'Pay Date';
    }
}

function OnConfirm()
{
    txtseq_str.text = "";
    txtindex.text   = "";
    var data;
	data = "";
	
	var index;
	index  = 0;
	
	if(index == 0)
	{
		alert('Please select check SEQ for confirm!!!'+'\n'+'  Bạn hãy chọn số SEQ để Confirm!!!')
		return;
	}
	else
	{
		if(confirm('Are you sure you want to confirm?'+'\n'+'Bạn có chắc Confirm số SEQ này?'))
		{	        
	        txtseq_str.text = data;
	        txtindex.text   = index;
	        dso_upd_confirm_cancel.Call();	
        }
    }
}

function OnConfirmCancel()
{
    txtseq_str.text = "";
    txtindex.text   = "";
    var data;
    var data1;
	data    = "";
	data1   = "";
	
	var index;
	index  = 0;
	
	if(index == 0)
	{
		alert('Please select check SEQ for cancel confirm!!!'+'\n'+'  Bạn hãy chọn số SEQ để Cancel Confirm!!!');
		return;
	}
	else
	{
		if(confirm('Are you sure you want to cancel confirm?'+'\n'+'Bạn có chắc Cancel Confirm số SEQ này?'))
		{
	        txtseq_str.text = data;
	        txtseq1_str.text = data1;
	        txtindex.text   = index;
	        dso_upd_confirm_cancel.Call();
        }
    }
}

function OnPrint()
{
    alert("Not Yet");
    return;
}

function Popup_PL()
{
    var fpath = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ac_sel_60110110_pl_popup&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
    var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
    if ( object != null ) 
    {
        if (object[0] != 0)
        {
            txtpl_pk.SetDataText(object[2]); // PK
            txtpl_cd.SetDataText(object[0]); // Item Code
            txtpl_nm.SetDataText(object[1]); // Item Name Local
        }
    }
}

function Reset_PL()
{
    txtpl_pk.SetDataText("");
    txtpl_cd.SetDataText("");
    txtpl_nm.SetDataText("");
}

function Popup_Type()
{
    var fpath   = System.RootURL + '/standard/forms/ag/ga/agga00090.aspx';
	var wWidth  = 950;
	var wHeight = 580;
	var x = Math.round((screen.availWidth - wWidth)/2);
	var y = Math.round((screen.availHeight - wHeight)/2);
	
	var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
	   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
	   "lef="+ x +",top=" + y;
			
    var object = System.OpenModal(fpath, wWidth, wHeight, features);
}

function OnPopupSlipEntry()
{
}

function SetTotal()
{
    
    if (grid_invoice.rows > 1)
    {
        var ctrl = grid_invoice.GetGridControl();	    
    
        ctrl.Cell(14, 1, 1, 1, 17) = false;
	    grid_invoice.SetCellBold(1, 1, 1, 17, true);
	    if (grid_invoice.rows == 2)
	    {
	        grid_invoice.SetCellBgColor(1, 0, 1, 17, Number('0X8B8B00'));
	        
	    }
	    else if ((grid_invoice.rows > 2) && (grid_invoice.GetGridData(grid_invoice.rows - 1, 11) != ""))
        {
            grid_invoice.SetCellBgColor(1, 0, 1, 17, Number('0X2FFFAD'));
            for (i = 2; i < grid_invoice.rows; i++)
            {
                grid_invoice.SetCellBgColor(i, 0, i, 17, Number('0XAD2FFF'));
            }
        }
        Control_Menu();
    }
}

function OnNew()
{
    if (grid_invoice.rows > 2 || grid_invoice.rows == 1) return ;
    for (i = 2; i < 4; i++)
    {
        grid_invoice.AddRow();
        for (j = 1; j < grid_invoice.cols - 5; j++)
        {
            grid_invoice.SetGridText(i, j, grid_invoice.GetGridData(1, j));
        }
    }
    
    grid_invoice.SetGridText(2, 12, grid_invoice.GetGridData(1, 12));
    for (i = 1; i < 4 ; i++)
    {
        if (i != 2)
        {
            grid_invoice.SetRowEditable(i, false);
        }
    }
    grid_invoice.SetCellBgColor(2, 0, 2, 17, Number('0XAD2FFF'));
    grid_invoice.SetCellBgColor(3, 0, 3, 17, Number('0X2FFFAD'));
}

function RowEdit()
{
    var l_tr_qty = 0, l_dr_qty = 0;
    if ((event.col == 10) && (event.row == 2) && (grid_invoice.rows == 4))
    {
        var tr_ccy          = grid_invoice.GetGridData(1, 8);
        var tr_ccy_book     = lstBook_ccy.GetData();
        var tr_rate_book    = grid_invoice.GetGridData(1, 15);
        if (tr_ccy == tr_ccy_book)
        {
            var tr_famt = Number(grid_invoice.GetGridData(1, 10));
            var tr_amt  = Number(grid_invoice.GetGridData(1, 11));
            var tr_rate = Number(grid_invoice.GetGridData(1, 9));
            var dr_famt = Number(grid_invoice.GetGridData(event.row, 10));
			
            if (!isFinite(dr_famt))
            {
                alert('Amount Transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tiền giao dịch là số. Bạn hãy kiểm tra lại dòng '+ (event.row) +'!!!')
                grid_invoice.SetGridText(2, 10, "");
                grid_invoice.SetGridText(2, 11, "");
                grid_invoice.SetGridText(3, 10, "");
                grid_invoice.SetGridText(3, 11, "");
                return false;
            }
            if (dr_famt >= tr_famt)
            {
                alert('Amount Transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tiền giao dịch là số. Bạn hãy kiểm tra lại dòng '+ (event.row) +'!!!')
                grid_invoice.SetGridText(2, 10, "");
                grid_invoice.SetGridText(2, 11, "");
                grid_invoice.SetGridText(3, 10, "");
                grid_invoice.SetGridText(3, 11, "");
                return false;
            }
            grid_invoice.SetGridText(2, 11, Number(dr_famt));
            grid_invoice.SetGridText(3, 10, Number(tr_famt - dr_famt));
            grid_invoice.SetGridText(3, 11, Number(tr_amt - dr_famt));
            l_tr_qty = Number(grid_invoice.GetGridData(1, 14));
            l_dr_qty = Number(grid_invoice.GetGridData(2, 14));
            grid_invoice.SetGridText(3, 14, Number(l_tr_qty - l_dr_qty));
        }
        else
        {
            var tr_famt = Number(grid_invoice.GetGridData(1, 10));
            var tr_amt  = Number(grid_invoice.GetGridData(1, 11));
            var tr_rate = Number(grid_invoice.GetGridData(1, 9));
            var dr_famt = Number(grid_invoice.GetGridData(event.row, 10));
			//alert(dr_famt);
            /*if (!isFinite(dr_famt))
            {
                alert('Amount Transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tiền giao dịch là số. Bạn hãy kiểm tra lại dòng '+ (event.row) +'!!!')
                grid_invoice.SetGridText(2, 10, "");
                grid_invoice.SetGridText(2, 11, "");
                grid_invoice.SetGridText(3, 10, "");
                grid_invoice.SetGridText(3, 11, "");
                return false;
            }*/
            if (dr_famt >= tr_famt)
            {
                alert('Amount Transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tiền giao dịch là số. Bạn hãy kiểm tra lại dòng '+ (event.row) +'!!!')
                grid_invoice.SetGridText(2, 10, "");
                grid_invoice.SetGridText(2, 11, "");
                grid_invoice.SetGridText(3, 10, "");
                grid_invoice.SetGridText(3, 11, "");
                return false;
            }
            grid_invoice.SetGridText(2, 11, FormatCalculate(lstBook_ccy.value, (dr_famt*(tr_rate/tr_rate_book))));
            grid_invoice.SetGridText(3, 10, Number(tr_famt - dr_famt));
            grid_invoice.SetGridText(3, 11, FormatCalculate(lstBook_ccy.value, Number(tr_amt) - Number(dr_famt*(tr_rate/tr_rate_book))));
            
        }
    }
    else if ((event.col == 11) && (event.row == 2) && (grid_invoice.rows == 4))
    {
        var tr_ccy          = grid_invoice.GetGridData(1, 8);
        var tr_ccy_rate          = grid_invoice.GetGridData(1, 9);
        var tr_ccy_book     = lstBook_ccy.GetData();
        var tr_rate_book    = grid_invoice.GetGridData(1, 15);

        var tr_amt  = Number(grid_invoice.GetGridData(1, 11));
        var dr_amt  = Number(grid_invoice.GetGridData(event.row, 11));
        /*if (!isFinite(dr_famt))
        {
            alert('Amount Transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tiền giao dịch là số. Bạn hãy kiểm tra lại dòng '+ (event.row) +'!!!')
            grid_invoice.SetGridText(2, 11, "");
            grid_invoice.SetGridText(3, 11, "");
            return false;
        }*/
        if (dr_amt >= tr_amt)
        {
            alert('Amount Transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tiền giao dịch là số. Bạn hãy kiểm tra lại dòng '+ (event.row) +'!!!')
            grid_invoice.SetGridText(2, 11, "");
            grid_invoice.SetGridText(3, 11, "");
            return false;
        }
        grid_invoice.SetGridText(3, 11, Number(tr_amt - dr_amt)); // books amt
        grid_invoice.SetGridText(2, 10, FormatCalculate(tr_ccy,Math.round(Number(dr_amt) * Number(tr_rate_book)) / Number(tr_ccy_rate) )); // trans amt
        grid_invoice.SetGridText(3, 10, FormatCalculate(tr_ccy,Math.round(Number(tr_amt - dr_amt) * Number(tr_rate_book)) / Number(tr_ccy_rate) )); // books amt
    }
    else if((event.col == 14) && (event.row == 2) && (grid_invoice.rows == 4))
    {
            l_tr_qty = Number(grid_invoice.GetGridData(1, 14));
            l_dr_qty = Number(grid_invoice.GetGridData(2, 14));
            grid_invoice.SetGridText(3, 14, Number(l_tr_qty - l_dr_qty) );        
    }
}

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

function OnSave()
{
    if (grid_invoice.rows > 3)
    {
        grid_invoice.SetRowStatus(1, 0);
        grid_invoice.SetRowStatus(2, 0x20);
        grid_invoice.SetRowStatus(3, 0);
        var tr_famt     = Number(grid_invoice.GetGridData(2, 10));
        var tr_amt      = Number(grid_invoice.GetGridData(2, 11));
        if (tr_famt == "")
        {
            alert('Trans is not null'+'\n'+'');
            return;
        }
        if (tr_amt == "")
        {
            alert('Trans is not null'+'\n'+'');
            return;
        }
        dso_sel_grd_payable_invoice.Call();
    }
}

function OnMerge()
{
    if ((grid_invoice.rows > 1) && (grid_invoice.GetGridData(2, 13)!= ''))
    {
        grid_invoice.SetRowStatus(1, 0x10);
        /*
        for (i = 2; i < grid_invoice.rows; i++)
        {
            grid_invoice.SetRowStatus(i, 0x40);
        }
        */
        txttac_carecv_pk.SetDataText(grid_invoice.GetGridData(1, 12)); //tac_carecv_pk
        txttac_carecv_pk_2.SetDataText(grid_invoice.GetGridData(2, 12)); //tac_carecv_pk
        dso_process_merge.Call();
    }
    else
    {
        alert('   You do not merge row!!!'+'\n'+'Bạn không thể gộp lại được!!!');
        return;
    }
}

function OnSelect()
{
    var aValue = new Array();
    for (i = 1; i < grid_invoice.rows; i++)
    {
        var v_check = grid_invoice.GetGridData(i, 0)
        if (v_check == "-1")
        {
            var tmp= new Array();
            tmp[tmp.length] = grid_invoice.GetGridData(i, 1);
            tmp[tmp.length] = grid_invoice.GetGridData(i, 4);
            tmp[tmp.length] = grid_invoice.GetGridData(i, 8);
            tmp[tmp.length] = grid_invoice.GetGridData(i, 9);
            tmp[tmp.length] = grid_invoice.GetGridData(i, 10);
            tmp[tmp.length] = grid_invoice.GetGridData(i, 11);
            tmp[tmp.length] = grid_invoice.GetGridData(i, 12);
            tmp[tmp.length] = grid_invoice.GetGridData(i, 13);
            tmp[tmp.length] = grid_invoice.GetGridData(i, 14);
            aValue[aValue.length]=tmp;
        }
    }
    window.returnValue = aValue ;
    window.close() ;
}

function OnSetBookRate()
{
    if (txtBookRate.GetData() == 0)
    {
        alert('You must type in day ratio: '+ txt_date.GetData() +'\n'+'Bạn hãy nhập tỉ giá ngày: '+ txt_date.GetData());
        return;
    }
}

function Popup_Style()
{
	var i;
    var path = System.RootURL + '/standard/forms/fp/ab/PopUpGetOneItem.aspx' ;
    var aValue = System.OpenModal( path ,950 , 500 ,  'resizable:yes;status:yes') ;	
	if(aValue != null)
	{		
		txtStyleNo.text = aValue[1] ; // item name
		txtStyleNo_PK.text = aValue[0] ; // Item PK			
	}	
}

function OnChangeStatus()
{
    if(rbstatus.value == "1") // Unconfirmed
    {
        ibtnNew.SetEnable(true);
        ibtnSave.SetEnable(true);
        ibtnMerge.SetEnable(true);
        OnSearch();
    }
    else if(rbstatus.value == "2")
    {
        ibtnNew.SetEnable(false);
        ibtnSave.SetEnable(false);
        ibtnMerge.SetEnable(false);        
        OnSearch();
    }
}

function Popup_Acct()
{
    var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "131" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ACNT.SP_SEL_ACCT_POPUP";
    var o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
	if (o != null)
	{
		if(o[0] != 0)
		{
            txtAccPK.SetDataText(o[3]);
            txtAccCode.SetDataText(o[0]);
            txtAccName.SetDataText(o[1]);
		}
	}
}

function Reset_ACCT()
{
    txtAccPK.SetDataText('');
    txtAccCode.SetDataText('');
    txtAccName.SetDataText('');    
}

</script>
<body style="margin:0; padding:0;">
<!--------------------------------------------------------------------->
    <gw:data id="dso_sel_grd_payable_invoice" onreceive="SetTotal()">
        <xml>
            <dso type="grid" parameter="1,10,11,12,13,14" function="ac_sel_60110090_collection_2" procedure="ac_upd_60110090_installment">
                <input bind="grid_invoice">
                    <input bind="lstCompany"/>
                    <input bind="rbstatus"/>
                    <input bind="txtseq"/>
                    <input bind="dtPay_duefr"/>
                    <input bind="dtPay_dueto"/>
                    <input bind="dtPay_fr"/>
                    <input bind="dtPay_to"/>
                    <input bind="txtcust_pk"/>
                    <input bind="txtvoucher_no"/>
                    <input bind="txtpl_pk"/>
                    <input bind="lstType"/>
                    <input bind="txttab"/>
					<input bind="txtStyleNo"/>
					<input bind="txtCIInv" />
					<input bind="txtPONo" />
					<input bind="txtQuantity" />
					<input bind="chkAll" />
					<input bind="txtAccPK" />
                </input>
                <output bind="grid_invoice"/>
            </dso>
        </xml>
    </gw:data>
<!--------------------------------------------------------------------->    
    <gw:data id="dso_upd_confirm_cancel" onreceive="OnSearch()"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60110090_payable_conf" > 
                <input> 
                     <input bind="txtseq_str"/>
                     <input bind="lstCompany"/>
                     <input bind="rbstatus"/>
                     <input bind="txtindex"/>
                     <input bind="dtPay_Date"/>
                     <input bind="txtseq1_str"/>
                     
                </input>
                <output>
                     <output bind="rbstatus"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!--------------------------------------------------------------------->     
    <gw:data id="dso_process_merge" onreceive="OnSearch()"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60110090_collect_merge" > 
                <input>                                          
                     <input bind="txttac_carecv_pk"/>
                     <input bind="txttac_carecv_pk_2"/>
                </input>
                <output>
                     <output bind="rbstatus"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!--------------------------------------------------------------------->    
    <gw:data id="dso_sel_booksrate" onreceive="OnSetBookRate()"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60110090_get_bookccy">
                <input> 
                     <input bind="lstCompany" />
                     <input bind="txt_date" />
                     <input bind="lstBook_ccy" />
                </input>  
                <output>
                     <output bind="txtBookRate" />
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
<!--------------------------------------------------------------------->    
<table width="100%" cellpadding="0" cellspacing="0" border="1" style="height:100%" >
<tr>
    <td width="100%">
	    <table width="100%" cellpadding="0" cellspacing="0" border="0" height="100%" >
		<tr>
            <td width="100%">
	            <table width="100%" cellpadding="0" cellspacing="0" border="0" height="100%">
		        <tr>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="2%"></td>
                    <td width="10%"></td>
                    <td width="8%"></td>
                    <td width="12%"></td>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="8%"></td>
                    <td width="10%"></td>
                    <td width="5%"></td>
                    <td width="5%"></td>
                </tr>
                <tr style="height:4%">
                    <td align="right">Company&nbsp;</td>
                    <td colspan="3"><gw:list id="lstCompany" onChange="OnSearch()" styles='width:100%'></gw:list></td>
                    <td align="center">Status&nbsp;</td>
                    <td colspan = 3>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td><gw:datebox id="dtPay_Date" onchange="" styles='width:85%' lang="1"/></td>
                            <td align="left"><gw:radio id="rbstatus" value="1" onchange="OnChangeStatus()"> 
					                <span value="1">UnConfirmed&nbsp;</span>
					                <span value="2">Confirmed</span>
                            </gw:radio>
                            </td>
                        </tr>
                        </table>
                    </td>
                    <td align="right">SEQ&nbsp;</td>
                    <td><gw:textbox id="txtseq" styles="width:100%" onenterkey="OnSearch()" onkeypress="CheckNumeric()"/></td>
                    <td colspan = 3>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="80%"></td>
                            <td><gw:imgBtn  id="ibtnSearch" img="search"    alt="Search"        onclick="OnSearch()"/></td>
                            <td><gw:imgBtn  id="ibtnNew"    img="new"       alt="New"           onclick="OnNew()"/></td>
				            <td><gw:imgBtn  id="ibtnSave"   img="save"      alt="Save"          onclick="OnSave()"/></td>
				            <td><gw:imgBtn  id="ibtnMerge"  img="test"      alt="Merge"         onclick="OnMerge()"/></td>
				            <td><gw:imgBtn  id="ibtnReport" img="printer"   alt="Print Acct"    onclick="OnPrint()"/></td>
                        </tr>
                        </table>
                    </td>
                </tr>
                <tr style="height:4%" >
                    <td align="right">Pay Due Date&nbsp;</td>
                    <td><gw:datebox id="dtPay_duefr" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtPay_dueto" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center"><a title="Click here to select Customer" onclick="Popup_Cust()" href="#tips">Customer&nbsp;</td>
                    <td colspan="3">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="30%"><gw:textbox id="txtcust_cd" styles='width:100%'/></td>
                            <td width="60%"><gw:textbox id="txtcust_nm" styles='width:100%'/></td>
                            <td width="0%"><gw:textbox  id="txtcust_pk" styles='display:none'/></td>
                            <td width="5%"><gw:imgBtn   img="reset"	id="idResetTr"  alt="Reset" onclick="Reset_Cust()"/></td>
                        </tr>
                        </table>
                    </td>
                    <td align="right">Voucher No&nbsp;</td>
                    <td><gw:textbox id="txtvoucher_no" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch()"/></td>
			        <td><gw:icon id="btnSelect"    img="in" text="Select"     styles='width:100%'  onclick="OnSelect()"/></td>
                    <td></td>
                </tr>
                <tr style="height:4%" >
                    <td align="right"><gw:label id="lblDate" text="Pay Date" />&nbsp;</td>
                    <td><gw:datebox id="dtPay_fr" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtPay_to" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center"><a title="Click here to select Profit & Loss(PL)" onclick="Popup_PL()" href="#tips">Profit & Loss(PL)&nbsp;</td>
                    <td colspan="3">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="30%"><gw:textbox id="txtpl_cd" styles='width:100%'/></td>
                            <td width="60%"><gw:textbox id="txtpl_nm" styles='width:100%'/></td>
                            <td width="0%"><gw:textbox  id="txtpl_pk" styles='display:none'/></td>
                            <td width="5%"><gw:imgBtn   img="reset"	id="idResetPL"  alt="Reset" onclick="Reset_PL()"/></td>
                        </tr>
                        </table>
                    </td>
			        <td align="right"><a title="Click here to select Type" onclick="Popup_Type()" href="#tips">Type&nbsp;</td>
                    <td><gw:list id="lstType" onChange="OnSearch()" value ="" styles='width:100%' /></td>
                    <td colspan = 3>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td align="center"  width="5%">Total&nbsp;</td>
                            <td align="center"  width="5%"><gw:label id="lblRecord" text="" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td> 
					        <td align="left"    width="5%">vouchers&nbsp;</td>
					        <td                 width="5%"><gw:icon id="btnChk"     img="in" text="ChkAll" styles='width:100%' onclick="OnChkAll()"/></td>
                        </tr>
                        </table>
                    </td>
                </tr>
				<tr style="height:4%" >
					<td align="right"><a title="Click here to select Style No" onclick="Popup_Style()" href="#tips">Style No&nbsp;</a></td>
					<td colspan="3" align="left"><gw:textbox id="txtStyleNo" styles="width:100%" /></td>
					<td colspan="1" align="right">CI Invoice&nbsp;</td>
					<td align="left" colspan="1" ><gw:textbox id="txtCIInv" onkeypress="Upcase()" styles="width:100%; " /></td>
					<td align="right">Quantity&nbsp;</td>
					<td align="left"><gw:textbox id="txtQuantity" styles="width:100%; " /></td>
					<td align="right">PO No&nbsp;</td>
					<td align="left" colspan="1" ><gw:textbox id="txtPONo" styles="width:100%" /></td>					
					<td align="right">All&nbsp;</td>
					<td colspan="2"><gw:checkbox id="chkAll" value = "T" onchange="OnSearch()" /></td>
				</tr>
				<tr style="height:4%" >
					<td align="right"><a title="Click here to select Account code" onclick="Popup_Acct()" href="#tips">Account code&nbsp;</a></td>
					<td colspan="1" align="left"><gw:textbox id="txtAccCode" styles="width:100%" /></td>
					<td colspan="3" align="right"><gw:textbox id="txtAccName" styles="width:100%" /></td>
					<td colspan="1" align="right"><gw:imgBtn id="btnReset" img="reset" alt="Reset" onclick="Reset_ACCT()" styles="width:100%" /></td>
				</tr>
                </table>
            </td>
        </tr>
        </table>
    </td>
</tr>

<tr style="height:76%" >
    <td width="100%">
        <table border=0 width="100%" cellpadding=0 cellspacing=0 height="100%" >
        <tr style="height:66%">
            <td>
                <gw:tab id="idTab_Child"  onpageactivate="onSearchTab()">
                    <table name="Installment Entry" width ="100%" cellpadding ="0" cellspacing ="0" border="1" height="100%" >
                            <tr style="height:92%">
				                <td width ="100%">
                                    <gw:grid   
                                        id="grid_invoice"
		                                header  ="Chk|Seq|Voucher Type|Voucher No|Prps Date|Appr.Date|Appr.No|Customer Name|Ccy|Rate|Amount Trans|Amount Books|_pk|_trd_pk|Qty|BK Rate|PO|Style"
		                                format  ="3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
		                                aligns  ="1|1|1|1|1|1|0|0|1|1|3|3|0|0|3|3|2|2"
		                                defaults="||||||||||||||||||"
		                                editcol ="0|0|0|0|0|0|0|0|0|0|1|1|0|0|1|0|0|0"
		                                widths  ="500|800|1300|1500|1200|1200|1000|2000|600|800|1400|1400|0|0|1400|1000|800|1200"
		                                styles  ="width:100%; height:100%"
		                                sorting ="T"
		                                acceptNullDate="T"
		                                onafteredit  = "RowEdit()"
                                    />
                                </td>
                            </tr>
                            <tr style="height:8%">
                                <td width ="100%">
                                    <table border=0 width="100%" cellpadding=0 cellspacing=0 height="100%" >
                                        <tr>
                                            <td width ="10%"></td>
                                            <td bgcolor="#008B8B" width ="5%"></td>
                                            <td width ="15%">&nbsp;&nbsp;&nbsp; ----   Total Balance    ----</td>
                                            <td width ="10%"></td>
                                            <td bgcolor="#FF2FAD" width ="5%"></td>
                                            <td width ="15%">&nbsp;&nbsp;&nbsp; ----   Received    ----</td>
                                            <td width ="10%"></td>
                                            <td bgcolor="#ADFF2F" width ="5%"></td>
                                            <td width ="15%">&nbsp;&nbsp;&nbsp; ----   Remain Balance    ----</td>
                                        </tr>
                                    </table>
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

<gw:textbox id="txtchk"                 style="display:none" />
<gw:textbox id="txttab"                 style="display:none" />
<gw:textbox id="txtseq_str"             style="display:none" />
<gw:textbox id="txtseq1_str"            style="display:none" />

<gw:textbox id="txtindex"               style="display:none" />
<gw:textbox id="txtStatus"              style="display:none" />

<gw:list    id="lstBook_ccy" 		   style="display:none" ></gw:list >
<gw:textbox id="txtBookRate"           style="display:none"  />
<gw:textbox id="txt_date"               style='display:none'/>
<gw:textbox id="txtStyleNo_PK"               style='display:none'/>
<gw:textbox id="txttac_carecv_pk"               style='display:none'/>
<gw:textbox id="txttac_carecv_pk_2"               style='display:none'/>
<gw:textbox id="txtAccPK"               style='display:none'/>
<gw:textbox id="txtProposedByUserPk"    style="display:none"/>
</body>
</html>