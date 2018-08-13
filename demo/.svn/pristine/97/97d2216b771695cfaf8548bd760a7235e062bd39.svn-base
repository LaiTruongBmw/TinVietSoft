<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>
    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">

var rowclick     = 0;
var rowclick_d   = 0;
var click_tab0   = true;
var click_tab1   = true;
var click_tab2   = true;
var click_tab3   = true;
var click_tab4   = true;

function BodyInit()
{
    System.Translate(document);
    BindingDataList();
}

function BindingDataList()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_data2    = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACBG0130') FROM DUAL")%>";
    var ls_date_fr  = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
    var ls_Book_ccy = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACBG0040','04','') FROM DUAL")%>";
    
    lstBook_ccy.SetDataText(ls_Book_ccy);
    lstCompany.SetDataText(ls_data);
    lstVoucherType.SetDataText(ls_data2);
    //lstVoucherType.SetDataText('PV');
    txtAP_Type.SetDataText('DO');
    lstVoucherType.SetEnable(false);
    
    lstCompany.SetEnable(false);
    dtTrDatefr.SetEnable(false);
    dtTrDateto.SetEnable(false);
    txtvoucher_no.SetEnable(false);
    txtseq.SetEnable(false);
    txtserial.SetEnable(false);
    txtinvoiceno.SetEnable(false);
    txtSerialNo.SetEnable(false);
    
    var l_transdate   = "<%=Request.querystring("transdate")%>";
    var l_invoicedate = "<%=Request.querystring("invoicedate")%>";
    var l_invoiceno   = "<%=Request.querystring("invoiceno")%>";
    var l_seq         = "<%=Request.querystring("seq")%>";
    var l_voucher_type= "<%=Request.querystring("voucher_type")%>";
    var l_compk       = "<%=Request.querystring("compk")%>";
    var l_voucher_no  = "<%=Request.querystring("voucher_no")%>";
    var l_status      = "<%=Request.querystring("status")%>";
    var l_pk          = "<%=Request.querystring("pk")%>";
    
    var ls_ddmmyyy    = l_transdate.substr(6,4) + l_transdate.substr(3,2) + l_transdate.substr(0,2);
    var ls_ddmmyyy2   = l_invoicedate.substr(6,4) + l_invoicedate.substr(3,2) + l_invoicedate.substr(0,2);
    
    lstCompany.SetDataText(l_compk);
    dtTrDatefr.SetDataText(ls_ddmmyyy);
    dtTrDateto.SetDataText(ls_ddmmyyy2);
    
    txtvoucher_no.SetDataText(l_voucher_no);
    txtseq.SetDataText(l_seq);
    txtinvoiceno.SetDataText(l_invoiceno);
    rbstatus.SetDataText(l_status);
    txtvenpk.SetDataText('');
    txt_pk.SetDataText(l_pk);
    lstVoucherType.SetDataText(l_voucher_type);
    
    grdMst.GetGridControl().FrozenCols = 11;
    grdDtl.GetGridControl().FrozenCols = 8;
    
    rbPO_YN.SetDataText('N');
    rbPO_YN.SetEnable(false);
    grdInfor.SetHeaderBold(true);
    
    <%=CtlLib.SetGridColumnComboFormat("grdMst", 2,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACBG0130' AND A.USE_IF = 1")%>;
    <%=CtlLib.SetGridColumnComboFormat("grdMst", 9,"SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
    <%=CtlLib.SetGridColumnComboFormat("grdMst",16,"SELECT A.CODE, A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACCR0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
    
    <%=CtlLib.SetGridColumnComboFormat("grdDtl", 8,"SELECT trim(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAR0190' AND A.USE_IF = 1")%>;
    <%=CtlLib.SetGridColumnComboFormat("grdDtl", 4,"SELECT trim(A.CODE), A.CODE_NM || ' - (' || A.NUM_VALUE1 || ')' FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0 AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACCR0160' AND A.USE_IF = 1 AND A.GRP_CODE = 'AP' ORDER BY A.NUM_VALUE1")%>;
    
    SetNumGrid();
    SetNumGridD();
    SetFormatGrid();
    
    if (l_seq == "")
    {
        ibtnPopup.SetEnable(false);
    }
    else
    {
        ibtnPopup.SetEnable(true);
    }
    
    txtVendorNM.SetEnable(false);
    txtVendorCD.SetEnable(false);
    txtDeliverNM.SetEnable(false);
    txtDeliverCD.SetEnable(false);
    txtChargerNM.SetEnable(false);
    txtChargerCD.SetEnable(false);
    txtContactNM.SetEnable(false);
    txtContactCD.SetEnable(false);
    
    txtUserPk.text="<%=Session("USER_PK")%>";
    txtDeptPK.text="<%=Session("DEPT_PK")%>";
    
    rowclick        = 0;
    lblStatus.text  = '';
    ClearData();
    dso_upd_grd_mst_ap_domestic.Call('SELECT');
}

function SetFormatGrid()
{
    var tempGrid1 = grdMst.GetGridControl();
    tempGrid1.FixedRows = 1;
    tempGrid1.MergeCells =5;
    tempGrid1.MergeRow(0) = true;
    tempGrid1.Cell(0, 0, 3, 0, 5)   = "Voucher No";
    tempGrid1.Cell(0, 0, 7, 0, 8)   = "Trans Date";
    tempGrid1.Cell(0, 0, 11, 0, 12) = "Invoice Date";
    tempGrid1.AllowUserResizing     = 0;
    tempGrid1.AutoResize = true;
}

function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
	var x = c.toUpperCase().charCodeAt(0);
	event.keyCode = x;
}

function SetNumGrid()
{
    var fg = grdMst.GetGridControl();
    fg.ColFormat(10) = "#,###,###,###,###,###,###,###,###R";
    fg.ColFormat(14) = "#,###,###,###,###,###,###,###,###.##R";
    fg.ColFormat(17) = "#,###,###,###,###,###,###,###,###.##R";
    
    if (lstBook_ccy.GetData() == 'VND')
    {
        fg.ColFormat(15) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(18) = "#,###,###,###,###,###,###,###,###R";
    }
    else
    {
        fg.ColFormat(15) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(18) = "#,###,###,###,###,###,###,###,###.##R";
    }    
}

function SetNumGridD()
{
    var fg = grdDtl.GetGridControl();
    fg.ColFormat(10) = "#,###,###,###,###,###,###,###,###R";
    fg.ColFormat(12) = "#,###,###,###,###,###,###,###,###.##R";
    fg.ColFormat(13) = "#,###,###,###,###,###,###,###,###.##R";
    //fg.ColFormat(14) = "#,###,###,###,###,###,###,###,###R";
    
    var fg1 = grdTaxAllocation.GetGridControl();
    fg1.ColFormat(3) = "#,###,###,###,###,###,###,###,###.##R";
    //fg1.ColFormat(4) = "#,###,###,###,###,###,###,###,###R";
    fg1.ColFormat(5) = "#,###,###,###,###,###,###,###,###.##R";
    //fg1.ColFormat(6) = "#,###,###,###,###,###,###,###,###R";
    
    var fg2 = grdTaxStorage.GetGridControl();
    fg2.ColFormat(3) = "#,###,###,###,###,###,###,###,###.##R";
    //fg2.ColFormat(4) = "#,###,###,###,###,###,###,###,###R";
    fg2.ColFormat(5) = "#,###,###,###,###,###,###,###,###.##R";
    //fg2.ColFormat(6) = "#,###,###,###,###,###,###,###,###R";
    
    var fg3 = grdTaxPL.GetGridControl();
    fg3.ColFormat(3) = "#,###,###,###,###,###,###,###,###.##R";
    fg3.ColFormat(4) = "#,###,###,###,###,###,###,###,###R";
    if (lstBook_ccy.GetData() == 'VND')
    {
        fg.ColFormat(14) = "#,###,###,###,###,###,###,###,###R";
        fg1.ColFormat(4) = "#,###,###,###,###,###,###,###,###R";
        fg1.ColFormat(6) = "#,###,###,###,###,###,###,###,###R";
        fg2.ColFormat(4) = "#,###,###,###,###,###,###,###,###R";
        fg2.ColFormat(6) = "#,###,###,###,###,###,###,###,###R";
        fg3.ColFormat(4) = "#,###,###,###,###,###,###,###,###R";
    }
    else
    {
        fg.ColFormat(14) = "#,###,###,###,###,###,###,###,###.##R";
        fg1.ColFormat(4) = "#,###,###,###,###,###,###,###,###.##R";
        fg1.ColFormat(6) = "#,###,###,###,###,###,###,###,###.##R";
        fg2.ColFormat(4) = "#,###,###,###,###,###,###,###,###.##R";
        fg2.ColFormat(6) = "#,###,###,###,###,###,###,###,###.##R";
        fg3.ColFormat(4) = "#,###,###,###,###,###,###,###,###.##R";
    }
}


function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise,
}

function onClick_PO()
{
    var fg = grdDtl.GetGridControl(); 
    if (txt_pk.GetData() == '')
    {
        ClearData();
        return;   
    }
    var ls_status   = grdMst.GetGridData(grdMst.selrow, 29);
    var ls_po       = grdMst.GetGridData(grdMst.selrow, 30);
    if (ls_po != '')
    {
        if (ls_po == 'N')
        {
            rbPO_YN.SetDataText('N');
            fg.ColWidth(1)  = "0";
            fg.ColWidth(9)  = "0";
            fg.ColWidth(11) = "0";
            return;
        }
        else if (ls_po == 'Y')
        {
            rbPO_YN.SetDataText('Y');
            fg.ColWidth(1)  = "1200";
            fg.ColWidth(9)  = "1200";
            fg.ColWidth(11) = "1200";
            return;
        }
    }
    if (rbPO_YN.GetData() == 'Y')
    {
        fg.ColWidth(1)  = "1200";
        fg.ColWidth(9)  = "1200";
        fg.ColWidth(11) = "1200";
    }
    else if(rbPO_YN.GetData() == 'N')
    {
        fg.ColWidth(1)  = "0";
        fg.ColWidth(9)  = "0";
        fg.ColWidth(11) = "0";
    }
}

function onSelectChange()
{
	if (rowclick != grdMst.selrow)
	{
	    for (i = 1; i < grdMst.rows; i++)
        {
            if (grdMst.selrow == i)
            {
                grdMst.SetCellBold(i,1,i,28,true);
            }
            else
            {
                grdMst.SetCellBold(i,1,i,28,false);
            }
        }
        rowclick        = grdMst.selrow;
        txt_row.text    = rowclick;
        lblSeq.text     = grdMst.GetGridData(grdMst.selrow, 6);
        lblTotal.text   = grdMst.GetGridData(grdMst.selrow, 15);
        lblTotal1.text  = grdMst.GetGridData(grdMst.selrow, 15);
        lblTotal2.text  = grdMst.GetGridData(grdMst.selrow, 15);
        txt_pk.text     = grdMst.GetGridData(grdMst.selrow, 0);
        rowclick_d      = 0;
        txtcur.text     = grdMst.GetGridData(grdMst.selrow, 9);
        
        var ls_status   = grdMst.GetGridData(grdMst.selrow, 29);
        var ls_po = grdMst.GetGridData(grdMst.selrow, 30);
        var fg = grdDtl.GetGridControl(); 
        if (ls_po == 'Y')
        {
            rbPO_YN.SetDataText('Y');
            fg.ColWidth(1)  = "1200";
            fg.ColWidth(9)  = "1200";
            fg.ColWidth(11) = "1200";
        }
        else if (ls_po == 'N')
        {
            rbPO_YN.SetDataText('N');
            fg.ColWidth(1)  = "0";
            fg.ColWidth(9)  = "0";
            fg.ColWidth(11) = "0";
        }
        SetLabel(ls_status);
        if (txt_pk.GetData() != '')
        {
            EnableTab(true);
            onSearchTab();
        }
    }
}

function SetLabel(p_data)
{
    switch (p_data)
    {
        case '1':
          lblStatus.text = 'Save';
          break;
        case '0':
          lblStatus.text = 'Approve';
          break;
        case '2':
          lblStatus.text = 'Comfirm';
          break;
        case '3':
          lblStatus.text = 'Cancel';
          break;
    }
    var ls_mstpk = grdMst.GetGridData(grdMst.selrow, 0)
    if (ls_mstpk != '')
    {
        if (grdMst.GetGridData(grdMst.selrow, 29) == 1)
        {
            onClick_PO();
        }
    }
    ClearData();
}


function ClearData()
{
    grdDtl.ClearData();
    grdTaxPL.ClearData();
    grdTaxStorage.ClearData();
    grdTaxAllocation.ClearData();
    grdInfor.SetData("");
    txtVendorPK.SetDataText("");
    txtVendorCD.SetDataText("");
    txtVendorNM.SetDataText("");
    txtDeliverPK.SetDataText("");
    txtDeliverCD.SetDataText("");
    txtDeliverNM.SetDataText("");
    txtChargerPK.SetDataText("");
    txtChargerCD.SetDataText("");
    txtChargerNM.SetDataText("");
    txtContactPK.SetDataText("");
    txtContactCD.SetDataText("");
    txtContactNM.SetDataText("");
    txtSerialNo.SetDataText("");
}

function onSelectChangeDtl()
{
	if (idTab_Child.GetCurrentPageNo() == 1)
    {
        if  (rowclick_d != grdDtl.selrow)
	    {
	        for (i = 1; i < grdDtl.rows; i++)
            {
                if (grdDtl.selrow == i)
                {
                    grdDtl.SetCellBold(i,1,i,18,true);
                }
                else
                {
                    grdDtl.SetCellBold(i,1,i,18,false);
                }
            }
            rowclick_d      = grdDtl.selrow;
        }
    }
    else if (idTab_Child.GetCurrentPageNo() == 2)
    {
        if  (rowclick_d != grdTaxAllocation.selrow)
	    {
	        for (i = 1; i < grdTaxAllocation.rows; i++)
            {
                if (grdTaxAllocation.selrow == i)
                {
                    grdTaxAllocation.SetCellBold(i,1,i,6,true);
                }
                else
                {
                    grdTaxAllocation.SetCellBold(i,1,i,6,false);
                }
            }
            rowclick_d      = grdTaxAllocation.selrow;
        }
    }
    else if (idTab_Child.GetCurrentPageNo() == 3)
    {
        if  (rowclick_d != grdTaxStorage.selrow)
	    {
	        for (i = 1; i < grdTaxStorage.rows; i++)
            {
                if (grdTaxStorage.selrow == i)
                {
                    grdTaxStorage.SetCellBold(i,1,i,6,true);
                }
                else
                {
                    grdTaxStorage.SetCellBold(i,1,i,6,false);
                }
            }
            rowclick_d      = grdTaxStorage.selrow;
        }
    }
    else if (idTab_Child.GetCurrentPageNo() == 4)
    {
        if  (rowclick_d != grdTaxPL.selrow)
	    {
	        for (i = 1; i < grdTaxPL.rows; i++)
            {
                if (grdTaxPL.selrow == i)
                {
                    grdTaxPL.SetCellBold(i,1,i,7,true);
                }
                else
                {
                    grdTaxPL.SetCellBold(i,1,i,7,false);
                }
            }
            rowclick_d      = grdTaxPL.selrow;
        }
    }
}

function EnableTab(bool)
{
    click_tab0 = bool;
    click_tab1 = bool;
    click_tab2 = bool;
    click_tab3 = bool;
    click_tab4 = bool;
}

function onSearchTab()
{
    rowclick_d = 0;
    if (txt_pk == '' ) return;
    if (idTab_Child.GetCurrentPageNo() == 0)
    {
        if (click_tab0 == true)
        {
            EnableTab(true);
            click_tab0 = false;
            dso_upd_ctl_cust.StatusUpdate();
            dso_sel_ctl_cust.Call('SELECT');
        }
    }
    else if (idTab_Child.GetCurrentPageNo() == 1)
    {
        if (click_tab1 == true)
        {
            EnableTab(true);
            click_tab1 = false;
            dso_upd_grd_dtl_ap_domestic.Call('SELECT');
        }
    }
    else if (idTab_Child.GetCurrentPageNo() == 2)
    {
        if (click_tab2 == true)
        {
            EnableTab(true);
            click_tab2 = false;
            dso_upd_grd_dtl_ap_domestic_allocation.Call('SELECT');
        }
    }
    else if (idTab_Child.GetCurrentPageNo() == 3)
    {
        if (click_tab3 == true)
        {
            EnableTab(true);
            click_tab3 = false;
            dso_upd_grd_dtl_ap_domestic_storage.Call('SELECT');
        }
    }
    else if (idTab_Child.GetCurrentPageNo() == 4)
    {
        if (click_tab4 == true)
        {
            EnableTab(true);
            click_tab4 = false;
            dso_upd_grd_dtl_ap_domestic_profit.Call('SELECT');            
        }
    }
}

function Popup_Expense()
{
    if (grdMst.selrow < 1)
    {
        return;
    }
    var fpath  = System.RootURL + "/standard/forms/60/09/60090040_expense_popup.aspx?tac_crda_pk=" + grdMst.GetGridData(grdMst.selrow, 0) + "&rate=" + grdMst.GetGridData(grdMst.selrow, 10) + "&status=" + grdMst.GetGridData(grdMst.selrow, 29) + "&txt_book=" + txtBookRate.GetData() + "&ccy=" + grdMst.GetGridData(grdMst.selrow, 9);
    var aValue = window.showModalDialog(fpath, this, 'titleb:0;resizable:no;status:no;dialogWidth:30;dialogHeight:8;dialogLeft:80;dialogTop:445;edge:sunken;scroll:yes;unadorned:yes;help:no');
    dso_upd_grd_dtl_ap_domestic_allocation.Call('SELECT');
}

function onSeachItem()
{
    dso_upd_grd_dtl_ap_domestic_item.Call('SELECT');
}

function onSaveItem()
{
    dso_upd_grd_dtl_ap_domestic_item.Call();
}

function onSetItem()
{
    var ctrl = grdInfor.GetGridControl();
	var j = 1;
	var i = ctrl.rows - 1;
	while (j <= i)
	{
        var ls_type = grdInfor.GetGridData(j,4);
        if (ls_type == "T" | ls_type== "C")
        {
            if(ls_type == "T")
            {
	            grdInfor.SetCellBgColor(j, 2, j, 9, 0xEFFFFF);
            }
            else
            {
	            grdInfor.SetCellBgColor(j, 2, j, 9, 0xF4E6E0);
            }
            grdInfor.SetRowEditable(j, false);
        }
		j = j + 1;
	}
}

function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {
        case "dso_upd_grd_mst_ap_domestic":
            grdMst.SelectRow(1);
        break;
        
        case "dso_upd_grd_dtl_ap_domestic_item":
            onSetItem();
        break;
    }
}

function onSearchTAcc()
{
    var ls_seq = grdMst.GetGridData(grdMst.selrow, 6);
    if ( ls_seq != '')
    {
        var pk      = ls_seq;
		var status  = txtStatus.text;
		
		var fpath   = System.RootURL + '/standard/forms/60/09/60090040_popup_TAcc.aspx?PK_ROW=' + pk + '&APPRCANCEL=' + status;
		var wWidth  = 950;
		var wHeight = 570;
		var x = Math.round((screen.availWidth - wWidth)/2);
		var y = Math.round((screen.availHeight - wHeight)/2);
			
		var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
		   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
		   "lef="+ x +",top=" + y;
		
		var object = System.OpenModal(fpath, wWidth, wHeight, features);
    }
}

function OnReportAcct()
{
    if (txtseq.text !='')
    {
        alert("Not yet :)");
    }
}

function OnReportRV()
{
    if (txtseq.text !='')
    {
        alert("Not yet :)");
    }
}

</script>

<body style="margin:0; padding:0;">
<!------------------------------------------------------------------------------------------------------->
    
    <gw:data id="dso_upd_grd_mst_ap_domestic" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60090040_grd_ap_history" >
                <input bind="grdMst">
                    <input bind="lstCompany"/>
                    <input bind="dtTrDatefr"/>
                    <input bind="dtTrDateto"/>
                    <input bind="lstVoucherType"/>
                    <input bind="txtvoucher_no"/>
                    <input bind="txtseq"/>
                    <input bind="txtserial"/>
                    <input bind="txtinvoiceno"/>
                    <input bind="txtvenpk"/>
                    <input bind="rbstatus"/>
                    <input bind="txtAP_Type"/>
                    <input bind="txt_pk"/>
                </input>
                <output bind="grdMst"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_upd_grd_dtl_ap_domestic" >
        <xml>
            <dso type="grid" parameter="0,1,4,5,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22" function="ac_sel_60090040_grd_dtl_ap" procedure="ac_upd_60090040_grd_dtl_ap">
                <input bind="grdDtl">
                    <input bind="txt_pk"/>
                </input>
                <output bind="grdDtl"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_upd_grd_dtl_ap_domestic_allocation" >
        <xml>
            <dso type="grid" function="ac_sel_60090040_ap_do_allocate">
                <input bind="grdTaxAllocation">
                    <input bind="txt_pk"/>
                </input>
                <output bind="grdTaxAllocation"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_upd_grd_dtl_ap_domestic_storage" >
        <xml>
            <dso type="grid" function="ac_sel_60090040_ap_do_storage">
                <input bind="grdTaxStorage">
                    <input bind="txt_pk"/>
                </input>
                <output bind="grdTaxStorage"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_upd_grd_dtl_ap_domestic_profit">
        <xml>
            <dso type="grid" parameter="0,5" function="ac_sel_60090040_ap_do_profit" procedure="ac_upd_60090040_ap_do_profit">
                <input bind="grdTaxPL">
                    <input bind="txt_pk"/>
                </input>
                <output bind="grdTaxPL"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_sel_ctl_cust" onreceive="onSeachItem()"> 
        <xml> 
            <dso type="control" function="ac_sel_60090040_ap_do_cust">
            <inout> 
                <inout bind="txt_pk"/>
                <inout bind="txtVendorPK"/>
                <inout bind="txtVendorCD"/>
                <inout bind="txtVendorNM"/>
                <inout bind="txtDeliverPK"/>
                <inout bind="txtDeliverCD"/>
                <inout bind="txtDeliverNM"/>
                <inout bind="txtChargerPK"/>
                <inout bind="txtChargerCD"/>
                <inout bind="txtChargerNM"/>
                <inout bind="txtContactPK"/>
                <inout bind="txtContactCD"/>
                <inout bind="txtContactNM"/>
                <inout bind="txtSerialNo"/>
            </inout> 
        </dso> 
        </xml> 
    </gw:data>
    
    <gw:data id="dso_upd_ctl_cust" onreceive="onSaveItem()"> 
        <xml> 
            <dso type="control" parameter="0,1,4,7,10,13" function="ac_sel_60090040_ap_do_cust" procedure="ac_upd_60090040_ap_do_cust">
            <inout> 
                <inout bind="txt_pk"/>
                <inout bind="txtVendorPK"/>
                <inout bind="txtVendorCD"/>
                <inout bind="txtVendorNM"/>
                <inout bind="txtDeliverPK"/>
                <inout bind="txtDeliverCD"/>
                <inout bind="txtDeliverNM"/>
                <inout bind="txtChargerPK"/>
                <inout bind="txtChargerCD"/>
                <inout bind="txtChargerNM"/>
                <inout bind="txtContactPK"/>
                <inout bind="txtContactCD"/>
                <inout bind="txtContactNM"/>
                <inout bind="txtSerialNo"/>
            </inout> 
        </dso> 
        </xml> 
    </gw:data>
    
    <gw:data id="dso_upd_grd_dtl_ap_domestic_item" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,4,5,6,7,8,9" function="ac_sel_60090040_ap_do_item" procedure="ac_upd_60090040_ap_do_item">
                <input bind="grdInfor">
                    <input bind="txt_pk"/>
                </input>
                <output bind="grdInfor"/>
            </dso>
        </xml>
    </gw:data>
    
<!------------------------------------------------------------------------------------------------------->
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td>
		<table width="100%"  border="1" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="10%"></td>
                    <td width="13%"></td>
                    <td width="10%"></td>
                    <td width="7%"></td>
                    <td width="6%"></td>
                    <td width="10%"></td>
                    <td width="2%"></td>
                    <td width="13%"></td>
                    <td width="10%"></td>
                    <td width="14%"></td>
                    <td width="2%"></td>
                    <td width="2%"></td>
                    <td width="2%"></td>
                    <td width="2%"></td>
                    <td width="2%"></td>
                    <td width="2%"></td>
                    <td width="2%"></td>
                </tr>
                <tr>
                    <td align="right">Company&nbsp;</td>
                    <td>
					    <gw:list id="lstCompany" styles='width:100%' onChange="onSearch()"></gw:list>
				    </td>
				    <td align="center">Voucher Type&nbsp;</td>
                    <td colspan="2"><gw:list id="lstVoucherType" onChange="OnChangeList()" styles="width:100%"></gw:list></td>
				    <td align="right">Voucher No&nbsp;</td>
					<td colspan="2"><gw:textbox id="txtvoucher_no" styles="width:100%" onenterkey="onSearch()"/></td>
					<td align="right" >Seq&nbsp;</td>
                    <td colspan="2"><gw:textbox id="txtseq" styles="width:100%" onenterkey="onSearch()" onkeypress="CheckNumeric()"/></td>
				    <td colspan="7">
				        <table width="100%" border="0" cellspacing="0" cellpadding="0">
				            <tr>
				                <td width="80%"></td>
				                <td ><gw:imgBtn id="ibtnPopup"  img="Popup"     alt="View T Account"onclick="onSearchTAcc()"/></td>
				                <td ><gw:imgBtn id="ibtnReport" img="printer"   alt="Print Acct"    onclick="OnReportAcct()" /></td>
					            <td ><gw:imgBtn id="btnReport1" img="printer"   alt="Print RV"      onclick="OnReportRV()" /></td>
				            </tr>
				        </table>
				    </td>
				</tr>
                <tr>
                    <td align="right">Trans Date&nbsp;</td>
                    <td><gw:datebox id="dtTrDatefr" lang="1" /></td>
                    <td align="center">Invoice Date&nbsp;</td>
                    <td colspan="2"><gw:datebox id="dtTrDateto" styles="width:100%" lang="1" /></td>
                    <td align="right">Serial No&nbsp;</td>
                    <td colspan="2"><gw:textbox id="txtserial" styles="width:100%" onenterkey=""/></td>
				    <td align="right">Invoice No&nbsp;</td>
                    <td colspan="2"><gw:textbox id="txtinvoiceno" styles="width:100%" onenterkey=""/></td>
                    <td align="right">Status&nbsp;</td>
                    <td align="center" colspan ="2"><gw:label id="lblStatus" text="" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td>    
                </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td width="100%" id="td1">
                <table border=0 width="100%" cellpadding=0 cellspacing=0 >
                <tr>
                    <td>
                        <gw:grid
                            id="grdMst"  
                            header  ="_Pk||Voucher Type|||Voucher No|SEQ|Trans Date||Ccy|Rate|Invoice Date||Invoice No|Amount Trans|Amount Books|Tax Rate|VAT Trans|VAT Books|_tr_abtrtypepk|Trs Code|Trs Type|_acpk|Acc.Code|Acc.Name|Decription|Local Description|Kor Description|_Compk|_Status|_PO|_UserPK|_DeptPK|_AP_Type|_BooksRate"
                            format  ="0|3|0|3|0|0|0|0|4|2|0|0|4|0|0|0|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                            aligns  ="0|1|1|1|1|1|1|1|0|1|1|1|0|1|3|3|1|3|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                            defaults="||PV|-1||||||VND|1||||||||||||||||||||||||"
                            editcol ="0|1|1|0|0|1|0|1|0|1|1|1|0|1|1|1|1|1|1|0|0|0|0|0|0|1|1|1|0|0|0|0|0|0|0"
                            widths  ="0|250|1400|250|500|1900|1000|1500|250|500|700|1500|250|1500|1800|1800|1000|1500|1500|0|1500|2500|0|1500|2500|2500|2500|0|0|0|0|0|0|0|0"
                            styles  ="width:100%; height:150"
                            sorting ="F"
                            acceptNullDate  = "T"
                            OnSelChange     = "onSelectChange()"
		    	            oncellclick     = "onSelectChange()"
                            />
                    </td>
                </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td width="100%" id="tdGrid">
                <table border=0 width="100%" cellpadding=0 cellspacing=0 >
                <tr>
                    <td>
                        <gw:tab id="idTab_Child"  onclick ="onSearchTab()" >
                            
                            <table name="Infomation more..." width ="100%" cellpadding ="0" cellspacing ="0" border="1" >
                            <tr>
                                <td width ="100%">
                                    <table width ="100%" cellpadding ="0" cellspacing ="0" border="0">
	                                <tr>
	                                    <td>
                                            <table border ="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td width="10%"></td>
                                                <td width="30%"></td>
                                                <td width="10%"></td>
                                                <td width="30%"></td>
                                                <td width="15%"></td>
                                                <td width="5%"></td>
                                            </tr>
                                            <tr>
                                                <td align="center"><a href="#tips">Vendor</a></td>
                                                <td>
                                                    <table border ="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td><gw:textbox id="txtVendorPK" styles="display:none;" onenterkey=""/></td>
                                                        <td width="30%"><gw:textbox id="txtVendorCD" styles="width:100%;" onenterkey=""/></td>
                                                        <td width="70%"><gw:textbox id="txtVendorNM" styles="width:100%;" onenterkey=""/></td>
                                                    </tr>
                                                    </table>
                                                </td>
                                                <td align="center"><a href="#tips">Deliver</a></td>
                                                <td>
                                                    <table border ="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td ><gw:textbox id="txtDeliverPK" styles="display:none;" onenterkey=""/></td>
                                                        <td width="30%"><gw:textbox id="txtDeliverCD" styles="width:100%;" onenterkey=""/></td>
                                                        <td width="70%"><gw:textbox id="txtDeliverNM" styles="width:100%;" onenterkey=""/></td>
                                                    </tr>
                                                    </table>
                                                </td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td align="center"><a href="#tips">Charger</a></td>
                                                <td>
                                                    <table border ="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td><gw:textbox id="txtChargerPK" styles="display:none;" onenterkey=""/></td>
                                                        <td width="30%"><gw:textbox id="txtChargerCD" styles="width:100%;" onenterkey=""/></td>
                                                        <td width="70%"><gw:textbox id="txtChargerNM" styles="width:100%;" onenterkey=""/></td>
                                                    </tr>
                                                    </table>
                                                </td>
                                                <td align="center"><a href="#tips">Contact</a></td>
                                                <td>
                                                    <table border ="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td ><gw:textbox id="txtContactPK" styles="display:none;" onenterkey=""/></td>
                                                        <td width="30%"><gw:textbox id="txtContactCD" styles="width:100%;" onenterkey=""/></td>
                                                        <td width="70%"><gw:textbox id="txtContactNM" styles="width:100%;" onenterkey=""/></td>
                                                    </tr>
                                                    </table>
                                                </td>
                                                <td colspan="2">
                                                    <table border ="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td width="35%" align="center">Serial No</td>
                                                        <td width="65%"><gw:textbox id="txtSerialNo" styles="width:100%;" onenterkey=""/></td>
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
                            <tr>
                                <td width ="100%">
                                    <gw:neogrid  id="grdInfor" styles="width:100%;height:153"> 
								        <XML>
									        <xmlblock>
    										
										    <column title="PK" hidden='T'>
											    <textbox type="number" format="######"/>
										    </column>

										    <column title="Item PK" hidden='T'>
											    <textbox type="number" format="######" />
										    </column>

										    <column title="Item Name" width='3500' editmode="0">
											    <textbox />
										    </column>

										    <column title="Item Local Name" width='3500' editmode="0">
											    <textbox />
										    </column>

										    <column title="InType" hidden='T'>
											    <textbox  />
										    </column>

										    <column title="DataType" hidden='T'>
											    <textbox />
										    </column>

										    <column title="Item"  width='3500'>
											    <multiple ref="5">
												    <textbox type="number" format="###,###C" value="" />
												    <textbox format="50" value="" />
												    <datebox type="day" format=""  lang="1" acceptnull="T"/>
												    <checkbox />	
												    <htmledit value="[New]" />				
											    </multiple>
										    </column>
    										
										    <column title="Mst_PK" hidden='T'>
											    <textbox/>
										    </column>
    										
										    <column title="Item_Table" hidden='T'>
											    <textbox  />
										    </column>
										    
										    <column title="Item_NM" width='3000' editmode="0">
											    <textbox  />
										    </column>

									    </xmlblock>
								    </xml>
							    </gw:neogrid>
                                </td>
                            </tr>
                            </table>
                            
				            <table name="Item Info" width ="100%" cellpadding ="0" cellspacing ="0" border="1" >
                            <tr>
				                <td >
		                            <table width ="100%" cellpadding ="0" cellspacing ="0" border="0">
		                                <tr>
	                                        <td width ="10%" align="right">SEQ&nbsp;</td>
	                                        <td width ="10%" align="left" ><gw:label id="lblSeq" text="" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td>
                                            <td width ="10%" align="right">Total&nbsp;</td>
	                                        <td width ="10%" align="left" ><gw:label id="lblTotal" text="" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td>
	                                        <td width ="25%"></td>
	                                        <td width ="10%" align="center">Get Item with</td>
                                            <td width ="15%" align="center">
                                                <table border ="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td>
                                                        <gw:radio id="rbPO_YN" value="N" onclick="onClick_PO()">
                                                            <span value="Y" >&nbsp;&nbsp;PO&nbsp;&nbsp;</span>
                                                            <span value="N" >&nbsp;No PO&nbsp;&nbsp;</span>
                                                        </gw:radio >
                                                    </td>
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
                                        header  ="_PK|PO|Item Code|Item Name|P.Type|_acpk|Acc.Code|Acc.Name|Unit|Actural Q'ty|Invoce Q'ty|Diff Q'ty|U/Price|Amount Trans|Amount Books|Desccription|Local Description|Kor Description|_pk_mst|_MAT_PK|_ItemPK|_Mat_Trans|_Mat_Books"
                                        format  ="0|0|0|0|2|0|0|0|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                        aligns  ="0|1|0|0|0|0|1|0|1|3|3|3|3|3|3|0|0|0|0|0|0|0|0"
                                        defaults="||||||||||||||||||||||"
                                        editcol ="0|0|0|0|1|1|0|0|1|0|1|0|1|1|1|1|1|1|0|0|0|0|0"
                                        widths  ="0|1000|1000|2000|1000|0|1000|2000|800|1200|1200|1200|1000|1500|1500|2000|2000|2000|0|0|0|0|0"
                                        styles  ="width:100%; height:200"
                                        sorting ="F"  
                                        OnSelChange     = "onSelectChangeDtl()" 
                                        />
                                </td>
                            </tr>
	                        </table>
	                            
	                        <table name="Allocation Tax" width ="100%" cellpadding ="0" cellspacing ="0" border="1" >
	                            <tr>
                                    <td width="100%">
                                        <table width ="100%" cellpadding ="0" cellspacing ="0" border="0">
		                                <tr>
		                                    <td>
                                                <table border ="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width ="10%" ><a title="Click here to Update Expensive" onclick="Popup_Expense()" href="#tips">Expensive</a></td>
                                                    <td width ="10%" align="left" ><gw:label id="lblExp"    text="" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td>
                                                    <td width ="10%" align="right">Total</td>
	                                                <td width ="10%" align="left" ><gw:label id="lblTotal1"  text="" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td>
	                                                <td width ="60%"></td>
                                                </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        </table> 
                                    </td>
                                </tr>
                                <tr>
                                    <td width ="100%">
                                        <gw:grid
                                        id      ="grdTaxAllocation"  
                                        header  ="_PK|Item Code|Item Name|Amount Trans|Amount Books|Allocation Trans|Allocation Books"
                                        format  ="0|0|0|0|0|0|0"
                                        aligns  ="0|0|0|3|3|3|3"
                                        defaults="||||||"
                                        editcol ="0|0|0|0|0|0|0"
                                        widths  ="0|1500|3500|2500|2500|2500|0"
                                        styles  ="width:100%; height:200"
                                        sorting ="F"
                                        OnSelChange     = "onSelectChangeDtl()" 
                                         />
                                    </td>
                                </tr>
	                        </table>
	                        
                            <table name="Storage Tax" width ="100%" cellpadding ="0" cellspacing ="0" border="1" >
                            <tr>
                                <td width="100%">
                                    <table width ="100%" cellpadding ="0" cellspacing ="0" border="0">
	                                <tr>
	                                    <td>
                                            <table border ="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td width ="10%" align="right">Storage</td>
                                                <td width ="10%" align="left" ><gw:label id="lblExp"    text="" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td>
                                                <td width ="10%" align="right">Total</td>
                                                <td width ="10%" align="left" ><gw:label id="lblTotal2"  text="" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td>
                                                <td width ="60%"></td>
                                            </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    </table> 
                                </td>
                            </tr>
                            <tr>
                                <td width ="100%">
                                    <gw:grid
                                        id      = "grdTaxStorage"  
                                        header  = "_PK|Item Code|Item Name|Amount Trans|Amount Books|Storage Trans|Storage Books"
                                        format  = "0|0|0|0|0|0|0"
                                        aligns  = "0|0|0|3|3|3|3"
                                        defaults= "||||||"
                                        editcol = "0|0|0|0|0|0|0"
                                        widths  = "0|1500|3500|2500|2500|2500|0"
                                        styles  = "width:100%; height:200"
                                        sorting = "F"
                                        OnSelChange     = "onSelectChangeDtl()" 
                                     />
                                </td>
                            </tr>
                            </table>
                            
                            <table name="Profit and Loss(P&L)" width ="100%" cellpadding ="0" cellspacing ="0" border="1" >
                            <tr>
                                <td width="100%">
                                    <table width ="100%" cellpadding ="0" cellspacing ="0" border="0">
	                                <tr>
	                                    <td>
                                            <table border ="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td width ="100%" align ="right" ></td>
                                            </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    </table> 
                                </td>
                            </tr>
                            <tr>
                                <td width ="100%">
                                    <gw:grid
                                        id      = "grdTaxPL"  
                                        header  = "_PK|Item Code|Item Name|Amount Trans|Amount Books|_PL_PK|PL Code|PL Name"
                                        format  = "0|0|0|0|0|0|0|0"
                                        aligns  = "0|0|0|3|3|0|0|0"
                                        defaults= "|||||||"
                                        editcol = "0|0|0|0|0|0|0|0"
                                        widths  = "0|1500|3500|2500|2500|0|2500|0"
                                        styles  = "width:100%; height:200"
                                        sorting = "F"
                                        OnSelChange     = "onSelectChangeDtl()" 
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
        </table>
    </td>
</tr>
</table>

<!------------------------------------------Textbox ẩn ----------------------------------------------->

<gw:textbox id="txtStatus"           style="display:none" />

<gw:textbox id="txtacpk"             style="display:none" />
<gw:textbox id="txt_rowclick"        style="display:none" />
<gw:textbox id="txt_count"           style="display:none" />
<gw:textbox id="txtcur"              style="display:none" />
<gw:textbox id="txtrate"             style="display:none" />
<gw:textbox id="txt_row"             style="display:none" />

<gw:textbox id="txt_date"            style="display:none" />
<gw:textbox id="txt_pk"              style="display:none" />

<gw:textbox id="txtseq_str"          style="display:none" />
<gw:textbox id="txtindex"            style="display:none" />

<gw:textbox id="txtUserPk"           style="display:none" />
<gw:textbox id="txtDeptPK"           style="display:none" />

<gw:textbox id="txtAP_Type"          style="display:none" />
<gw:textbox id="rbstatus"            style="display:none" />
<gw:textbox id="txtvenpk"            style="display:none" />

<gw:list    id="lstBook_ccy" 		 style="width:50%;display:none"></gw:list >
<gw:textbox id="txtBookRate"         style="display:none" />

<!---------------------------------------------------------------------------------------------------->
</body>
</html>