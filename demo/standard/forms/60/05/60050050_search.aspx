<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>
    
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">


var click_dr = 0;
var click_cr = 0;

var flag_select = false;
var lang = "<%=Session("SESSION_LANG")%>";

function BodyInit()
{
    System.Translate(document);
    idGridItem.SetHeaderBold(true);
    dso_udp_ctl_mst_pay_pvp.StatusInsert();
    
    txtsum_chk_dr_famt.SetEnable(false);
    txtsum_chk_dr_amt.SetEnable(false);
    txtsum_chk_cr_famt.SetEnable(false);
    txtsum_chk_cr_amt.SetEnable(false);
    
    txtProposedByUserID.SetEnable(false);
    txtProposedByUserName.SetEnable(false);
    
    lstCompany.SetEnable(false);
    chkauto_YN.SetEnable(false);
    txtvoucher_auto.SetEnable(false);
    txtvoucher_no.SetEnable(false);
    txtseq.SetEnable(false);
    lstDepartment.SetEnable(false);
    dtDate.SetEnable(false);
    lstPayment.SetEnable(false);
    txtpay_person.SetEnable(false);
    txtEnclose.SetEnable(false);
    txtDescription.SetEnable(false);
    txtLocalDescription.SetEnable(false);
    txtsum_total_dr_famt.SetEnable(false);
    txtsum_total_cr_famt.SetEnable(false);
    txtsum_total_dr_amt.SetEnable(false);
    txtsum_total_cr_amt.SetEnable(false);
    
    btnPopupCust.SetEnable(false);
    btnResetCust.SetEnable(false);
    txtLang.SetDataText(lang);
    
    chkauto_YN.SetDataText('T');
    
    txtvoucher_auto.SetEnable(false);
    txtvoucher_auto.SetDataText('');
    txtcustid.SetEnable(false);
    txtcustnm.SetEnable(false);
    
    btnReplicate.SetEnable(false);
    btnCancel.SetEnable(false);
    btnConfirm.SetEnable(false);
    
    txtsum_diff_famt.SetEnable(false);
    txtsum_diff_amt.SetEnable(false);
    
    grdDebit.GetGridControl().FrozenCols = 6;
    grdCredit.GetGridControl().FrozenCols = 6;
    
    BindingDataList();
    
}

function BindingDataList()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_data1    = "<%=CtlLib.SetListDataSQL("SELECT A.PK, A.org_NM FROM TCO_org A WHERE del_if = 0 ")%>";
    var ls_data2    = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACBG0130') FROM DUAL")%>";
    
    <%=CtlLib.SetGridColumnComboFormat("grdDebit", 10,"SELECT A.CODE, A.CODE_NM FROM TCO_ABCODE A, COMM.TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0 AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACCR0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
    <%=CtlLib.SetGridColumnComboFormat("grdCredit", 10,"SELECT A.CODE, A.CODE_NM FROM TCO_ABCODE A, COMM.TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0 AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACCR0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
    
    lstCompany.SetDataText(ls_data);
    lstDepartment.SetDataText(ls_data1);
    lstVoucherType.SetDataText(ls_data2);
    //lstVoucherType.SetDataText('PC');
    lstVoucherType.SetEnable(false);
    //txttax_acc.SetDataText('333110');
    txtProposedByUserPk.text="<%=Session("USER_PK")%>";
    
    pk              = "<%=Request.querystring("PK_ROW")%>";
    row_index       = "<%=Request.querystring("ROW")%>";
    rows_index      = "<%=Request.querystring("ROWS")%>";
    var ls_str      = "<%=Request.querystring("ARRAY_PK")%>";
    
    //arr_pk = ls_str.split(' ');
	//var ls_temp = arr_pk[row_index];
	txtseq.SetDataText(pk);
	CheckKeySeq();
}

function OnPre()
{
    var callerWindowObj = dialogArguments;
	if(row_index < 2)
	{
		alert("First record...");
		row_index = 0;
	}
	else
	{
		row_index = parseInt(row_index) - 1;
		var row_pk = callerWindowObj.GetRowPK(row_index);
        txtseq.SetDataText(row_pk);
        CheckKeySeq();
	}
}

function OnNext()
{
    var callerWindowObj = dialogArguments;
	if (row_index == rows_index)
		alert("Last record...");
	else
	{
		row_index = parseInt(row_index) + 1;
		var row_pk = callerWindowObj.GetRowPK(row_index);
        txtseq.SetDataText(row_pk);
        CheckKeySeq();
	}
}

function OnToggle()
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

//------------------------------------- Master event ----------------------------------------------------
 
function CheckKeySeq()
{
    //if (txtseq.GetData() != '')
    //{
        txtDescription.SetDataText("");
        txtLocalDescription.SetDataText("");
        grdDebit.ClearData();
        grdCredit.ClearData();
        idGridItem.SetData("");
        
        txtsum_chk_dr_famt.text = 0;
        txtsum_chk_dr_amt.text = 0;
        txtsum_chk_cr_famt.text = 0;
        txtsum_chk_cr_amt.text = 0;
        txtsum_total_dr_famt.text = 0;
        txtsum_total_dr_amt.text = 0;
        txtsum_total_cr_famt.text = 0;
        txtsum_total_cr_amt.text = 0;
        txtsum_diff_famt.text = 0;
        txtsum_diff_amt.text = 0;
        
        flag_select = true;
        click_dr = 0;
        click_cr = 0;
        OnCtrToggleRight();
        //dso_udp_ctl_mst_pay_pvp.Call('SELECT');
        if (txtseq.GetData() != '')
        {
            dso_sel_ctl_mst_pay_pvp.Call('SELECT');
        }
        else
        {
            dso_udp_ctl_mst_pay_pvp.Call('SELECT');
        }
    //}
}
 
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
	                grdDebit.SetCellBold(i,1,i,19,true);
	                grdDebit.SetRowEditable(i, true);
                }
                else
                {
	                grdDebit.SetCellBold(i,1,i,19,false);
	                grdDebit.SetRowEditable(i, false);
                }
            }
            txtacpk.SetDataText(grdDebit.GetGridData(grdDebit.selrow, 1));
            txtbprvpvd.SetDataText(grdDebit.GetGridData(grdDebit.selrow, 0));
            var dr_ratevat  = grdDebit.GetGridData(grdDebit.selrow, 10);
            if (dr_ratevat != 'NO')
            {
                if (dr_ratevat != 1)
                {
                    txt_rate.SetDataText(grdDebit.GetGridData(grdDebit.selrow, 10));
                }
                else
                {
                    txt_rate.SetDataText('');
                }
            }
            else
            {
                txt_rate.SetDataText('');
            }
            txt_rowclick.text = grdDebit.selrow;
            txt_drcr_type.SetDataText('D');
            idGridItem.SetData("");
            click_dr = grdDebit.selrow;
            click_cr = 0;
            dso_sel_count_ctl_item.Call();
        }
        for (i = 1; i < grdCredit.rows; i++)
        {
            grdCredit.SetCellBold(i,1,i,19,false);
            grdCredit.SetRowEditable(i, false);
            grdCredit.DeselectRow(i);
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
	    if ((grdCredit.rows > 1) && (grdCredit.selrow < grdCredit.rows) && (grdCredit.selrow != click_cr))
	    {
            for (i = 1; i < grdCredit.rows; i++)
            {
                if (grdCredit.selrow == i)
                {
	                grdCredit.SetCellBold(i,1,i,19,true);
	                grdCredit.SetRowEditable(i, true);
                }
                else
                {
	                grdCredit.SetCellBold(i,1,i,19,false);
	                grdCredit.SetRowEditable(i, false);
                }
            }
            txtacpk.SetDataText(grdCredit.GetGridData(grdCredit.selrow, 1));
            txtbprvpvd.SetDataText(grdCredit.GetGridData(grdCredit.selrow, 0));
            var cr_ratevat  = grdCredit.GetGridData(grdCredit.selrow, 10);
            if (cr_ratevat != 'NO')
            {
                if (cr_ratevat != 1)
                {
                    txt_rate.SetDataText(grdCredit.GetGridData(grdCredit.selrow, 10));
                }
                else
                {
                    txt_rate.SetDataText('');
                }
            }
            else
            {
                txt_rate.SetDataText('');
            }
            txt_rowclick.text = grdCredit.selrow;
            txt_drcr_type.SetDataText('C');
            idGridItem.SetData("");
            click_dr = 0;
            click_cr = grdCredit.selrow;
            dso_sel_count_ctl_item.Call();
        }
        for (i = 1; i < grdDebit.rows; i++)
        {
            grdDebit.SetCellBold(i,1,i,19,false);
            grdDebit.SetRowEditable(i, false);
            grdDebit.DeselectRow(i);
        }
        OnCheckSumCR();
    }
}

function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {
        case "dso_sel_count_ctl_item":
                SetButtonEnable();
                dso_sel_control_new_item.Call('SELECT');
        break;
        
        case "dso_upd_grd_dtl_payment_dr":
            click_dr = 0;
            click_cr = 0;
            SaveItemControl();
        break;
        
        case "dso_upd_grd_dtl_payment_cr":
            click_dr = 0;
            click_cr = 0;
            SaveItemControl();
        break;
        
        case "dso_udp_ctl_mst_pay_pvp":
            SetButtonEnable();
            if (flag_select == true)
            {
                txt_drcr_type.SetDataText('D');
                dso_sel_grd_dtl_payment_dr.Call("SELECT");
            }
        break;
        
        case "dso_sel_ctl_mst_pay_pvp":
            SetButtonEnable();
            if (flag_select == true)
            {
                txt_drcr_type.SetDataText('D');
                dso_sel_grd_dtl_payment_dr.Call("SELECT");
            }
        break;
        
        case "dso_sel_grd_dtl_payment_dr":
            OnCloseData();
            SetNumGridDR();
            SetNumGridCR();
            if (flag_select == true)
            {
                txt_drcr_type.SetDataText('C');
                flag_select = false;
                dso_sel_grd_dtl_payment_cr.Call("SELECT");
            }
        break;   
    }
}

function SetButtonEnable()
{
    if (txtStatus.GetData() == 1) // Save
    {
        btnConfirm.SetEnable(true);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(false);
    }
    else if (txtStatus.GetData() == 2) // Comfirm
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(true);
        btnReplicate.SetEnable(false);
    }
    else if (txtStatus.GetData() == 3) // Cancel
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(true);
    }
    else if (txtStatus.GetData() == '') // New
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(false);
    }
    else if (txtStatus.GetData() == 0) // Approve
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(false);
    }
    else if (txtStatus.GetData() == 4) // No Approve
    {
        btnConfirm.SetEnable(false);
        btnCancel.SetEnable(false);
        btnReplicate.SetEnable(false);
    }
}

function ItemStyle()
{
	if (idGridItem.rows > 1)
	{
	    OnCtrToggleLeft();
	}
	else
	{
	    OnCtrToggleRight();
	}
	var ctrl = idGridItem.GetGridControl();
	var j = 1;
	var i = ctrl.rows - 1;
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
	for (i = 1; i < idGridItem.rows; i++)
    {
        if (idGridItem.GetGridData(i, 8) == 'CUSTOMER')
        {
            if (txtcustpk.GetData() != '')
            {
                if (idGridItem.GetGridData(i, 10) == '')
                {
                    idGridItem.SetGridText(i, 10, txtcustpk.GetData());
                    idGridItem.SetGridText(i,  9, txtcustnm.GetData());
                }
            }
        }
	}
}

function OnCloseData()
{
    for (i = 1; i < grdDebit.rows; i++)
    {
        grdDebit.SetGridText( i, 18, i);
        grdDebit.SetRowEditable(i, false);
    }
    for (i = 1; i < grdCredit.rows; i++)
    {
        grdCredit.SetGridText( i, 18, i);
        grdCredit.SetRowEditable(i, false);
    }
}

function SetNumGridDR()
{
    var fg=grdDebit.GetGridControl();
    fg.ColFormat(7) = "#,###,###,###,###,###,###,###,###R"; 
	fg.ColFormat(8) = "#,###,###,###,###,###,###,###,###.##R"; 
	fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###R"; 
	fg.ColFormat(11) = "#,###,###,###,###,###,###,###,###.##R"; 
	fg.ColFormat(12) = "#,###,###,###,###,###,###,###,###R"; 
	fg.ColFormat(13) = "#,###,###,###,###,###,###,###,###.##R"; 
	fg.ColFormat(14) = "#,###,###,###,###,###,###,###,###R"; 
}

function SetNumGridCR()
{
    var fg=grdCredit.GetGridControl();
    fg.ColFormat(7) = "#,###,###,###,###,###,###,###,###R"; 
	fg.ColFormat(8) = "#,###,###,###,###,###,###,###,###.##R"; 
	fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###R"; 
	fg.ColFormat(11) = "#,###,###,###,###,###,###,###,###.##R"; 
	fg.ColFormat(12) = "#,###,###,###,###,###,###,###,###R"; 
	fg.ColFormat(13) = "#,###,###,###,###,###,###,###,###.##R"; 
	fg.ColFormat(14) = "#,###,###,###,###,###,###,###,###R"; 
}

function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
	var x = c.toUpperCase().charCodeAt(0);
	event.keyCode = x;
}

function OnSumCR()
{
    var ctrl = grdCredit.GetGridControl();
    var sum_cr_famt = 0; 
    var sum_cr_amt  = 0;
    for (i = 1; i < ctrl.rows; i++)
	{
	     sum_cr_famt = sum_cr_famt + Number(grdCredit.GetGridData(i, 8)) + Number(grdCredit.GetGridData(i, 13));
	     sum_cr_amt  = sum_cr_amt  + Number(grdCredit.GetGridData(i, 9)) + Number(grdCredit.GetGridData(i, 14));
	}
	txtsum_total_cr_famt.SetDataText('' + sum_cr_famt);
	txtsum_total_cr_amt.SetDataText('' + sum_cr_amt);
}

function OnSumDR()
{
    var ctrl = grdDebit.GetGridControl();
    var sum_dr_famt = 0;
    var sum_dr_amt  = 0;
    for (i = 1; i < ctrl.rows; i++)
	{
	     sum_dr_famt = Number(sum_dr_famt) + Number(grdDebit.GetGridData(i, 8))+ Number(grdDebit.GetGridData(i, 13));
	     sum_dr_amt  = Number(sum_dr_amt)  + Number(grdDebit.GetGridData(i, 9))+ Number(grdDebit.GetGridData(i, 14));
	}
	txtsum_total_dr_famt.SetDataText('' + sum_dr_famt);
	txtsum_total_dr_amt.SetDataText('' + sum_dr_amt);
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
			sum_dr_famt = Number(sum_dr_famt) + Number(grdDebit.GetGridData(i, 8)) + Number(grdDebit.GetGridData(i, 13));
			sum_dr_amt  = Number(sum_dr_amt)  + Number(grdDebit.GetGridData(i, 9)) + Number(grdDebit.GetGridData(i, 14));
		}
	}
	txtsum_chk_dr_famt.SetDataText(''   + sum_dr_famt);
	txtsum_chk_dr_amt.SetDataText(''    + sum_dr_amt);
	OnSumDR();
	OnSumCR();
	txtsum_diff_famt.SetDataText('' + (Number(txtsum_total_dr_famt.text)-Number(txtsum_total_cr_famt.text)));
	txtsum_diff_amt.SetDataText('' + (Number(txtsum_total_dr_amt.text)-Number(txtsum_total_cr_amt.text)));
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
			sum_cr_famt = Number(sum_cr_famt) + Number(grdCredit.GetGridData(i, 8)) + Number(grdCredit.GetGridData(i, 13));
			sum_cr_amt  = Number(sum_cr_amt)  + Number(grdCredit.GetGridData(i, 9)) + Number(grdCredit.GetGridData(i, 14));
		}
	}
	txtsum_chk_cr_famt.SetDataText('' + sum_cr_famt);
	txtsum_chk_cr_amt.SetDataText(''  + sum_cr_amt);
	OnSumDR();
	OnSumCR();
	txtsum_diff_famt.SetDataText('' + (Number(txtsum_total_dr_famt.text)-Number(txtsum_total_cr_famt.text)));
	txtsum_diff_amt.SetDataText('' + (Number(txtsum_total_dr_amt.text)-Number(txtsum_total_cr_amt.text)));
}

function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise,    
}


function RowEditDR()
{
    var dr_famt = 0;
    var dr_rate = 0;
    if (event.col == 6)
    {
        RowChange('DR');
    }
    if (event.col == 6 || event.col == 8 || event.col == 7)
    {
        dr_rate = Number(grdDebit.GetGridData(event.row, 7));
        dr_famt = Number(grdDebit.GetGridData(event.row, 8));
        if (!isFinite(dr_rate))
        {
            alert('Rare transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tỉ giá giao dịch là số. Bạn hãy kiểm tra lại dòng '+ (event.row) +'!!!')
            return false;
        }
        if (!isFinite(dr_famt))
        {
            alert('Amount Transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tiền giao dịch là số. Bạn hãy kiểm tra lại dòng '+ (event.row) +'!!!')
            return false;
        }
        grdDebit.SetGridText(event.row, 9, Math.round(Number(dr_famt*dr_rate)));
    }
    if (event.col == 10)
    {
        dr_famt     = Number(grdDebit.GetGridData(event.row, 8));
        dr_amt      = Number(grdDebit.GetGridData(event.row, 9));
        
        // Set Rate To ITEM  Not Yet
        
        dr_ratevat  = grdDebit.GetGridData(event.row, 10);
        
        dr_vatfamt  = 0;
        dr_vatamt   = 0;
        if (dr_ratevat != 'NO')
        {
            if (dr_ratevat != 1)
            {
                dr_vatfamt  = Math.round(Number(dr_famt*dr_ratevat/100)*100)/100;
                dr_vatamt   = Math.round(Number(dr_amt*dr_ratevat/100)*100)/100;
                txt_rate.SetDataText(dr_ratevat);
                dso_sel_control_new_item.Call('SELECT');
            }
            else
            {
                txt_rate.SetDataText('');
                dso_sel_control_new_item.Call('SELECT');
            }
        }
        else
        {
            txt_rate.SetDataText('');
            dso_sel_control_new_item.Call('SELECT');
        }
        grdDebit.SetGridText(event.row, 11, dr_vatfamt);
        grdDebit.SetGridText(event.row, 12, dr_vatamt);
        grdDebit.SetGridText(event.row, 13, dr_vatfamt);
        grdDebit.SetGridText(event.row, 14, dr_vatamt);
    }
    OnSumDR();
}

function RowEditCR()
{
    var cr_famt = 0;
    var cr_rate = 0;
    if (event.col == 6)
    {
        RowChange('CR')
    }
    if (event.col == 6 || event.col == 8 || event.col == 7)
    {
        cr_rate = Number(grdCredit.GetGridData(event.row, 7));
        cr_famt = Number(grdCredit.GetGridData(event.row, 8));
        if (!isFinite(cr_rate))
        {
            alert('Rare transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tỉ giá giao dịch là số. Bạn hãy kiểm tra lại dòng '+ (event.row) +'!!!')
            return false;
        }
        if (!isFinite(cr_famt))
        {
            alert('Amount Transaction is number. Please check row '+ (event.row) +' again!!!'+'\n'+'Tiền giao dịch là số. Bạn hãy kiểm tra lại dòng '+ (event.row) +'!!!')
            return false;
        }
        grdCredit.SetGridText(event.row, 9, Math.round(Number(cr_famt*cr_rate)));
    }
    if (event.col == 10)
    {
        cr_famt     = Number(grdCredit.GetGridData(event.row, 8));
        cr_amt      = Number(grdCredit.GetGridData(event.row, 9));
        
        cr_ratevat  = grdCredit.GetGridData(event.row, 10);
        cr_vatfamt  = 0;
        cr_vatamt   = 0;
        if (cr_ratevat != 'NO')
        {
            if (cr_ratevat != 1)
            {   
                cr_vatfamt  = Math.round(Number(cr_famt*cr_ratevat/100)*100)/100;
                cr_vatamt   = Math.round(Number(cr_amt*cr_ratevat/100)*100)/100;
                txt_rate.SetDataText(cr_ratevat);
                dso_sel_control_new_item.Call('SELECT');        
            }
            else
            {
                txt_rate.SetDataText('');
                dso_sel_control_new_item.Call('SELECT');
            }
        }
        else
        {
            txt_rate.SetDataText('');
            dso_sel_control_new_item.Call('SELECT');
        }
        grdCredit.SetGridText(event.row, 11, cr_vatfamt);
        grdCredit.SetGridText(event.row, 12, cr_vatamt);
        grdCredit.SetGridText(event.row, 13, cr_vatfamt);
        grdCredit.SetGridText(event.row, 14, cr_vatamt);
        
    }
    OnSumCR();
}

function RowChange(p_data)
{
    txtcur.text     = '';
    txt_row.text    = '';
    if (p_data == 'DR')
    {
        txtcur.text = grdDebit.GetGridData(event.row, 6);
        txt_row.text = event.row;
        dso_get_rate_dr.Call();
    }
    else if (p_data == 'CR')
    {
        txtcur.text = grdCredit.GetGridData(event.row, 6);
        txt_row.text = event.row;
        dso_get_rate_cr.Call();
    }
}

function SetCurrent(p_data)
{
    var rate = 0;
    if (p_data == 'DR')
    {
        rate = txtrate.GetData();
        grdDebit.SetGridText(txt_row.text, 7, rate);
        var dr_famt = Number(grdDebit.GetGridData(txt_row.text, 8));
        grdDebit.SetGridText(txt_row.text, 9, Math.round(Number(dr_famt*rate)));
        OnSumDR();
    }
    else if (p_data == 'CR')
    {
        rate = txtrate.GetData();
        grdCredit.SetGridText(txt_row.text, 7, rate);
        var dr_famt = Number(grdCredit.GetGridData(txt_row.text, 8));
        grdCredit.SetGridText(txt_row.text, 9, Math.round(Number(dr_famt*rate)));
        OnSumCR();
    }
}


</script>
<body style="margin:0; padding:0;">

<!------------------------------------------------------------------------------------------------------->
 
 <gw:data id="dso_sel_ctl_mst_pay_pvp" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" function="ac_SEL_60050050_PAY_FR_HGTRH">
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
                <inout bind="lstPayment"/>
                <inout bind="txtpay_person"/>
                <inout bind="txtcustpk"/>
                <inout bind="txtcustid"/>
                <inout bind="txtcustnm"/>
                <inout bind="txtEnclose"/>
                <inout bind="txtDescription"/>
                <inout bind="txtLocalDescription"/>
                <inout bind="txtStatus"/>
                <inout bind="txttax_acc"/>
                <inout bind="txtseq1"/>
            </inout>
            </dso> 
        </xml> 
    </gw:data>
 
    <gw:data id="dso_udp_ctl_mst_pay_pvp" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" function="ac_SEL_60050050_PAY_VOUCHER">
            <inout> 
                <inout bind="txtseq1"/>
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
                <inout bind="lstPayment"/>
                <inout bind="txtpay_person"/>
                <inout bind="txtcustpk"/>
                <inout bind="txtcustid"/>
                <inout bind="txtcustnm"/>
                <inout bind="txtEnclose"/>
                <inout bind="txtDescription"/>
                <inout bind="txtLocalDescription"/>
                <inout bind="txtStatus"/>
                <inout bind="txttax_acc"/>
            </inout>
            </dso> 
        </xml> 
    </gw:data>
    
    <gw:data id="dso_sel_count_ctl_item" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="SP_PRO_GRD_DTL_CNT_PAYMENT" > 
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="txtacpk"/>
                     <input bind="txt_drcr_type"/>
                     <input bind="txtbprvpvd"/>
                     <input bind="txttax_acc"/>
                     <input bind="txt_rate"/>
                </input>  
                <output>  
                     <output bind="txt_count"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
 
 
    <gw:data id="dso_sel_control_new_item" onreceive="ItemStyle()">
        <xml>
            <dso type="grid" function="SP_SEL_GRD_CTL_ITEM_PAYMENT" >
                <input bind="idGridItem">
                    <input bind="lstCompany"/>
                    <input bind="txtacpk"/>
                    <input bind="txtbprvpvd"/>
                    <input bind="txt_drcr_type"/>
                    <input bind="txt_count"/>
                    <input bind="txttax_acc"/>
                    <input bind="txt_rate"/>
                </input>
                <output bind="idGridItem"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_sel_grd_dtl_payment_dr" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_SEL_60050050_popup_DTL_PAY">
                <input bind="grdDebit" >
                    <input bind="txtseq1"/>
                    <input bind="txt_drcr_type"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="grdDebit" />
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_sel_grd_dtl_payment_cr">
        <xml>
            <dso type="grid" function="ac_SEL_60050050_popup_DTL_PAY">
                <input bind="grdCredit">
                    <input bind="txtseq1"/>
                    <input bind="txt_drcr_type"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="grdCredit"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_upd_grd_dtl_payment_dr" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_SEL_60050050_popup_DTL_PAY" >
                <input bind="grdDebit" >
                    <input bind="txtseq1"/>
                    <input bind="txt_drcr_type"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="grdDebit" />
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_upd_grd_dtl_payment_cr" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_SEL_60050050_popup_DTL_PAY" >
                <input bind="grdCredit">
                    <input bind="txtseq1"/>
                    <input bind="txt_drcr_type"/>
                    <input bind="txtLang"/>
                </input>
                <output bind="grdCredit"/>
            </dso>
        </xml>
    </gw:data>
    
    
    <gw:data id="dso_upd_ctl_item" onreceive="ItemStyle()">
        <xml>
            <dso type="grid" function="ac_sel_60050050_ctl_item_paymt" >
                <input bind="idGridItem">
                    <input bind="lstCompany"/>
                    <input bind="txtbprvpvd"/>
                    <input bind="txtacpk"/>
                    <input bind="txt_drcr_type"/>
                    <input bind="txttax_acc"/>
                    <input bind="txt_rate"/>
                </input> 
                <output bind="idGridItem"/>
            </dso>
        </xml>
    </gw:data>
 
    <gw:data id="dso_get_rate_dr" onreceive="SetCurrent('DR')">
        <xml> 
            <dso type="process" procedure="ac_PRO_GET_RATE"> 
                <input> 
                     <input bind="dtDate"/>
                     <input bind="lstCompany"/>
                     <input bind="txtcur" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtrate"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dso_get_rate_cr" onreceive="SetCurrent('CR')">
        <xml> 
            <dso type="process" procedure="ac_PRO_GET_RATE"> 
                <input> 
                     <input bind="dtDate"/>
                     <input bind="lstCompany"/>
                     <input bind="txtcur" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtrate"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    
    <gw:data id="dso_get_rate_arap">
        <xml> 
            <dso type="process" procedure="ac_PRO_60050050_GET_RATE_ACC">
                <input> 
                     <input bind="lstVoucherType"/>
                </input>
                <output>
                     <output bind="txttax_acc"/>
               </output> 
            </dso> 
        </xml>
    </gw:data>
    
    <gw:data id="dso_upd_confirm" onreceive="SetButtonEnable()"> 
        <xml> 
            <dso type="process" procedure="ac_PRO_60050050_CONFIRM" > 
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
    
<!------------------------------------------------------------------------------------------------------->
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td>
		<table width="100%"  border="1" cellspacing="0" cellpadding="0">
        <tr>
            <td colspan="2">
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="13%"></td>
                    <td width="4%"></td>
                    <td width="13%"></td>
                    <td width="10%"></td>
                    <td width="6%"></td>
                    <td width="10%"></td>
                    <td width="2%"></td>
                    <td width="13%"></td>
                    <td width="8%"></td>
                    <td width="16%"></td>
                    <td width="2%"></td>
                    <td width="2%"></td>
                    <td width="2%"></td>
                    <td width="2%"></td>
                    <td width="2%"></td>
                    <td width="2%"></td>
                    <td width="2%"></td>
                </tr>
                <tr>
                    <td align="right">Company</td>
                    <td>
					    <gw:list id="lstCompany" value="" styles='width:100%'></gw:list>
				    </td>
				    <td align="right">Voucher No
					    <gw:checkbox id="chkauto_YN" value="T"  onclick="OnAutoYN()"/> 
				    </td>
                    <td colspan="2"><gw:list id="lstVoucherType" onChange="OnChangeList()" styles="width:100%"></gw:list></td>
				    <td><gw:textbox id="txtvoucher_auto" styles="width:100%"/></td>
					<td colspan="2"><gw:textbox id="txtvoucher_no" styles="width:100%"/></td>
					<td align="right">Seq</td>
                    <td><gw:textbox id="txtseq" styles="width:100%" onenterkey="CheckKeySeq()" onkeypress="CheckNumeric()"/></td>
                    <td ></td>
				    <td ></td>
				    <td colspan="6">
				        <table width="100%" border="0" cellspacing="0" cellpadding="0">
				            <tr>
				                <td width="45%"></td>								
				                <td><gw:imgBtn    img="back" alt="Back" id="btnBack" 	onclick="OnPre()"/></td>
				                <td><gw:imgBtn    img="next" alt="Next" id="btnNext" 	onclick="OnNext()" /></td>
				                <td width="45%"></td>
				            </tr>
				        </table>
				    </td>
				</tr>
                <tr>
                    <td align="right">Trans Date</td>
                    <td><gw:datebox id="dtDate" lang="1" /></td>
                    <td align="right">Department</td>
                    <td colspan="3">
					    <gw:list id="lstDepartment" styles="width:100%" value="ALL" ></gw:list>
				    </td>
				    <td></td>
                    <td align="right">Proposed By</td>
                    <td><gw:textbox id="txtProposedByUserID"    styles="width:100%"/></td>
                    <td><gw:textbox id="txtProposedByUserName"  styles="width:100%"/></td>
                    <td ></td>
                    <td colspan="2"><gw:icon id="btnConfirm"    img="in" text="Confirm"     onclick="OnConfirm()"       styles="width:100%"/></td>
				    <td colspan="2"><gw:icon id="btnCancel"     img="in" text="Cancel"      onclick="OnConfirmCancel()" styles="width:100%"/></td>  
				    <td colspan="2"><gw:icon id="btnReplicate"  img="in" text="Replicate"   onclick="OnReplicate()"     styles="width:100%"/></td>
				    
                </tr>
                <tr>
                    <td align="right">Payment Type</td>
                    <td><gw:list id="lstPayment" styles="width:100%" value="1"><data>Data|1|Payment|2|Receipt</data></gw:list></td>
                    <td align="right">Payment Person</td>
                    <td colspan="3"><gw:textbox id="txtpay_person" styles="width:100%"/></td>
                    <td align="right" colspan="2">Customer</td>
                    <td colspan="9">
                        <table border="0" cellpadding= "0" cellspacing= "0" width="100%">
                        <tr>
                            <td><gw:textbox id="txtcustpk" styles="Display:none"/></td>
                            <td width="40%"><gw:textbox id="txtcustid" styles="width:100%"/></td>
                            <td width="60%"><gw:textbox id="txtcustnm" styles="width:100%"/></td>
                            <td align="left"><gw:imgBtn id="btnPopupCust"   img="popup"     alt="Get Customer"  onclick="onCustPopUp()"/></td>
                            <td align="left"><gw:imgBtn id="btnResetCust"   img="reset"     alt="Reset"         onclick="onCustReset()"/></td>
                        </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right">Enclose</td>
                    <td><gw:textbox id="txtEnclose" styles="width:100%"/></td>
                    <td align="right">Description</td>
                    <td colspan="4"><gw:textbox id="txtDescription" styles="width:100%" csstype="mandatory"/></td>
                    <td align="right">Local Description</td>
                    <td colspan="9"><gw:textbox id="txtLocalDescription" styles="width:100%" csstype="mandatory"/></td>
                </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td width="60%" id="tdGrid">
                <table border=0 width="100%" cellpadding=0 cellspacing=0 >
                <tr>
                    <td>
				        <table  width ="100%" cellpadding ="0" cellspacing ="0" border="0" >
                        <tr>
				            <td>
		                        <table width ="100%" cellpadding ="0" cellspacing ="0" border="0">
		                            <tr>
	                                   <td width ="5%" align="center"><b><a onClick="OnSumDR()" href="#tips">Debit</a></td>				
	                                   <td width ="15%"><gw:textbox id="txtsum_chk_dr_famt" styles="width:100%"type="number" format="#,###,###,###,###.##R"/></td>
			                           <td width ="15%"><gw:textbox id="txtsum_chk_dr_amt" styles="width:100%"type="number" format="#,###,###,###,###R"/></td>
				                       <td width ="10%" align="center">Total</td>
				                       <td width ="15%"><gw:textbox id="txtsum_total_dr_famt"   styles="width:100%"  type="number" format="#,###,###,###,###.##R"/></td>
				                       <td width ="15%"><gw:textbox id="txtsum_total_dr_amt" styles="width:100%"  type="number" format="#,###,###,###,###R"/></td>
	                                   <td width ="3%" align ="right" ></td>
	                                   <td width ="3%" align ="right" ></td>
	                                   <td width ="3%" align ="right" ></td>
	                                   <td width ="3%" align ="right" ></td>
	                                   <td width ="3%" align ="right" ></td>
	                                   <td width ="3%"></td>
                                    </tr>
                                </table>                   
                            </td>
                        </tr>
	                    <tr>
                            <td width ="100%" >
                            <gw:grid
                                id="grdDebit"  
                                header  ="_Pk|_Acc_pk|||Acc.Code|Acc.Name|Ccy|Rate|Amount Trans|Amount Book|%VAT|VAT Trans|VAT Book|VAT Deduct Trans|VAT Deduct Book|Description|Local Description|_m_pk|_ODR|_DRCR"
                                format  ="0|0|3|0|0|0|0|0|0|2|0|0|0|0|0|0|0|0|0|0"
                                aligns  ="0|0|1|1|1|0|1|1|3|3|1|3|3|3|3|0|0|0|0|0"
                                defaults="||||||VND|||||||||||||"
                                editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                widths  ="0|0|250|300|1000|2000|700|1000|1800|1800|700|1800|1800|1800|1800|3000|2500|1000|1000|1000"
                                styles  ="width:100%; height:175"
                                sorting ="F"   
                                oncellclick  = "RowClick_DR()"
                                onentercell  = "RowClick_DR()"
                                onafteredit  = "RowEditDR()"
                                 />
                            </td>
                        </tr>
	                    </table>	
			        </td>
                  </tr>
                  <tr>
                    <td width="100%">
				        <table  width ="100%" cellpadding ="0" cellspacing ="0" border="0" >
				        <tr>
		                    <td>
		                        <table width ="100%" cellpadding ="0" cellspacing ="0" border="0">
		                            <tr>
	                                   <td width="5%" align="center"><a onClick="OnSumCR()" href="#tips">Credit</a></td>
	                                   <td width="15%"><gw:textbox id="txtsum_chk_cr_famt" styles="width:100%"type="number" format="#,###,###,###,###.##R"/> </td>
				                       <td width="15%"><gw:textbox id="txtsum_chk_cr_amt" styles="width:100%"type="number" format="#,###,###,###,###R"/> </td>                                        
				                       <td width="10%" align="center">Total</td>                    
				                       <td width="15%"><gw:textbox id="txtsum_total_cr_famt"  styles="width:100%" type="number" format="#,###,###,###,###.##R"/></td>                    
				                       <td width="15%"><gw:textbox id="txtsum_total_cr_amt" styles="width:100%"  type="number" format="#,###,###,###,###R"/></td>  
	                                   <td width="3%" align ="right" ></td>
	                                   <td width="3%" align ="right" ></td>
	                                   <td width="3%" align ="right" ></td>
	                                   <td width="3%" align ="right" ></td>
	                                   <td width="3%" align ="right" ></td>
	                                   <td width="3%" align ="right" ><img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;" onclick="OnToggle()" /></img></td>
                                    </tr>
                                </table>                   
                            </td>
                        </tr>
	                    <tr>
	                        <td width ="100%">
	                            <gw:grid
	                                id="grdCredit"  
						            header  ="_Pk|_Acc_pk|||Acc.Code|Acc.Name|Ccy|Rate|Amount Trans|Amount Book|%VAT|VAT Trans|VAT Book|VAT Deduct Trans|VAT Deduct Book|Description|Local Description|_m_pk|_ODR|_DRCR"
                                    format  ="0|0|3|0|0|0|0|0|0|2|0|0|0|0|0|0|0|0|0|0"
                                    aligns  ="0|0|1|1|1|0|1|1|3|3|1|3|3|3|3|0|0|0|0|0"
                                    defaults="||||||VND|||||||||||||"
                                    editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                    widths  ="0|0|250|300|1000|2000|700|1000|1800|1800|700|1800|1800|1800|1800|3000|2500|1000|1000|1000"
                                    styles  ="width:100%; height:145"
				                    sorting ="F"
				                    oncellclick  = "RowClick_CR()"
                                    onentercell  = "RowClick_CR()"
                                    onafteredit  = "RowEditCR()"
				                    />
                            </td>   
                        </tr>
                        <tr>
		                    <td>
		                        <table width ="100%" cellpadding ="0" cellspacing ="0" border="0">
		                            <tr>
	                                   <td width="5%"  bgcolor="bde9ff"></td>				
	                                   <td width="15%" bgcolor="bde9ff"></td>                                        
				                       <td width="15%" bgcolor="bde9ff"></td>                                        
				                       <td width="10%" bgcolor="bde9ff" align="center">Difference</td>
				                       <td width="15%" bgcolor="bde9ff"><gw:textbox id="txtsum_diff_famt"    styles="width:100%" type="number" format="#,###,###,###,###.##R"/></td>                    
				                       <td width="15%" bgcolor="bde9ff"><gw:textbox id="txtsum_diff_amt"     styles="width:100%" type="number" format="#,###,###,###,###R"/></td>  
	                                   <td width="3%" align ="right" bgcolor="bde9ff"></td>
	                                   <td width="3%" align ="right" bgcolor="bde9ff"></td>
	                                   <td width="3%" align ="right" bgcolor="bde9ff"></td>
	                                   <td width="3%" align ="right" bgcolor="bde9ff"></td>
	                                   <td width="3%" align ="right" bgcolor="bde9ff"></td>
	                                   <td width="3%" align ="right" bgcolor="bde9ff"></td>
                                    </tr>
                                </table>                   
                            </td>
                        </tr>
	                    </table>	
                    </td>
                </tr>
                </table>
            </td>
            <td width="40%" id="tdControlItem" style="display:none" valign="top">
                <table border="0" width="100%" cellpadding="0" cellspacing="0">
                    <tr>
                        <td width="100%">
                            <table border="0" width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="25%" align="Center">Control Item</td>
                                    <td width="50%" align="left"></td>
                                    <td width="25%" align="right"></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td width="100%"> 
							<gw:neogrid  id="idGridItem" styles="width:100%;height:360" > 
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

										<column title="Item"  width='2500' editmode="0" >
											<multiple ref="7"  >
												<textbox type="number" format="###,###C" value="" />
												<textbox format="50" value="" />
												<datebox type="day" format=""  lang="1" acceptnull="T"/>
												<checkbox />	
												<htmledit value="[New]" />				
											</multiple>
										</column>
										
										<column title="Item code" width='1500' editmode="0" >
											<textbox/>
										</column>
										
										<column title="ITEM NM" hidden='T'>
											<textbox  />
										</column>
										
										<column title="ITEM PK" hidden='T'>
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

<!------------------------------------------Textbox ẩn ----------------------------------------------->

<gw:textbox id="txtProposedByUserPk" style="display:none" />
<gw:textbox id="txt_DRCR"            style="display:none" />
<gw:textbox id="txtStatus"           style="display:none" />

<gw:textbox id="txttrans_code_tmp"   style="display:none" />
<gw:textbox id="txtacpk"             style="display:none" />
<gw:textbox id="txt_drcr_type"       style="display:none" />
<gw:textbox id="txt_rowclick"        style="display:none" />
<gw:textbox id="txt_count"           style="display:none" />
<gw:textbox id="txtbprvpvd"          style="display:none" />
<gw:textbox id="txtcur"              style="display:none" />
<gw:textbox id="txtrate"             style="display:none" />
<gw:textbox id="txt_row"             style="display:none" />
<gw:textbox id="txttax_acc"          style="display:none" />
<gw:textbox id="txtLang"             style="display:none" />

<gw:textbox id="txt_rate"           style="display:none" />
<gw:textbox id="txtseq1"            style="display:none" />

<gw:grid style="Display:none"
    id="idGridTempItem"
    header="itemacctpk|itemal|item|itemnm|table_pk"
    format="0|0|0|0|0"
    aligns="0|0|0|0|0"
    defaults="||||"
    editcol="0|0|0|0|0"
    widths="1300|3500|3500|2000|0"
    styles="width:100%; height:100"
    sorting="F"
    param="0,1,2,3,4"/>

<!---------------------------------------------------------------------------------------------------->
</body>
</html>