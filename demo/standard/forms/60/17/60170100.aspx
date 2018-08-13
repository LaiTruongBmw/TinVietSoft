<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<% CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1"  runat="server">
    <title>Takeout Mat Slip(E.B)</title>
</head>

<script>

    var  user_pk        = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name      = "<%=Session("USER_NAME")%>" ;
    var  user_id        = "<%=Session("USER_ID")%>" ;  
    var g_option = '';



    var flag;

    // index of grdDetail

var stt = 0;
var g_tac_stockmm_pk 		= stt++,           
    g_stock_no              = stt++,
	g_tr_date               = stt++,
	g_tac_hgtrh_pk			= stt++,
	g_tco_item_pk			= stt++,
	g_ItemCode				= stt++,
	g_ItemName				= stt++,
	g_Unit					= stt++,
	g_Qty					= stt++,
	g_Price                 = stt++,
	g_TransAmount			= stt++,
	g_BookAmount			= stt++,
    g_DebitAccPK            = stt++,
	g_DebitAccCode			= stt++,
	g_DebitAccName		    = stt++,
    g_CreditAccPK           = stt++,
	g_CreditAccCode         = stt++,
	g_CreditAccName         = stt++,
    g_Description           = stt++,
	g_LocalDesc				= stt++,
	g_tin_wh_pk				= stt++,
	g_WH					= stt++,
	g_tac_abpl_pk			= stt++,
	g_PLCode				= stt++,
	g_PLName                = stt++,
    g_TPR_LINE_PK           = stt++,
    g_TCO_BUSPARTNER_PK     = stt++,
    g_Trans                 = stt++,
    g_TrIn_Type             = stt++,
    g_TrOut_Type            = stt++,
    g_TR_STATUS             = stt++,
    g_STD_YM                = stt++,
    g_TCO_COMPANY_PK        = stt++,
    g_tr_table_nm           = stt++,
    g_tr_table_pk           = stt++;

 
//-----------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
    btnMakeSlip.SetEnable(false);
    btnCancelSlip.SetEnable(false);        
    OnFormatGrid();
    
}
//-----------------------------------------------------
function BindingDataList()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data);

    data = "<%=CtlLib.SetListDataSQL("SELECT DISTINCT CODE, CODE AS NAME FROM tac_commcode_detail A WHERE A.DEL_IF = 0 AND A.TAC_COMMCODE_MASTER_PK = 1726")%>";
    lstCurrency.SetDataText(data);
    lstCurrency.value = "VND";
    

    data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_name wh_name FROM tlg_in_warehouse WHERE del_if = 0 and use_yn = 'Y' ORDER BY wh_name  ASC" )%>||Select All";
    lstWH.SetDataText(data);
    lstWH.value = '';

    ChangeCurrency();
	//lstVoucherType.SetDataText(ls_data);
	//lstVoucherType.value = "AJI";
	//lstCurrency.text = l_book_ccy;

    txtDebitCode.SetEnable(false); 
    txtDebitName.SetEnable(false);
    lstCurrency.SetEnable(true);
    onMonthChange();
    
}
    //-----------------------------------------------------
    function checkInput() {
        var col, row;

        col = event.col;
        row = event.row;
		var v_round=0;
		if (lstCurrency.text != "VND")
        {	
			v_round=2;
		}
		if (col == g_Qty || col == g_Price || col == g_BookAmount) {
            var quantity = Number(grdDetail.GetGridData(row, g_Qty));
            var price = Number(grdDetail.GetGridData(row, g_Price));
            var bookAmt = Number(grdDetail.GetGridData(row, g_BookAmount));
            var bookAmtCall = Number(grdDetail.GetGridData(row, g_Qty)) * Number(grdDetail.GetGridData(row, g_Price));
            

            //if (Math.abs(Number(bookAmt) - Number(bookAmtCall)) > 10) 
			//{
                if (col == g_Qty || col == g_Price || bookAmt == 0) {
                    grdDetail.SetGridText(row, g_BookAmount, System.Round(bookAmtCall,v_round));
                }
                else if (col == g_BookAmount && quantity > 0) {//Tính lại giá
                    var priceCall = bookAmt / quantity;
                    priceCall = System.Round(priceCall, 2);

                    grdDetail.SetGridText(row, g_Price, System.Round(priceCall, v_round));
                }
            //}
        }
    }

function OnPopup(iObj)
{
    switch(iObj)
    {
        case 'Credit Account':
            var path = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=&comm_code=&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value + '' + "&dsqlid=ac_sel_600100150_v2_acc";
            var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
            if (object != null) {
                txtCreditCode.text = object[0];
                txtCreditName.text = object[1];
                txtCreditPK.text = object[3];
            }
            break;

        case 'Debit Account':
            var path = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=&comm_code=&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value + '' + "&dsqlid=ac_sel_600100150_v2_acc";
            var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');
            if (object != null) {
                txtDebitCode.text = object[0];
                txtDebitName.text = object[1];
                txtDebitPK.text = object[3];
            }
            break;

        case 'PL':
		var fpath   = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
        var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
        if ( object != null )  
        {
            if (object[0] != 0)
            {
                txtPLPK.text = object[2]; 		// PL_PK
                txtPLCD.text = object[0] ;     // PL Code
                txtPLNM.text = object[1];     // PL Name
            }            
        }        
        break;

        case "Item":
            var path = System.RootURL + '/standard/forms/fp/ab/fpab00070.aspx?group_type=|Y|||Y|Y';//purchase_yn=Y
            var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');

            if (object != null) {
                var arrTemp;
                for (var i = 0; i < object.length; i++) {
                    arrTemp = object[i];

                    txtItemPK.text = arrTemp[0];
                    txtItemCode.text = arrTemp[1];
                    txtItemName.text = arrTemp[2];
                }
            }
            break;
    }        
}
//-----------------------------------------------------
function onSearch()
{
    if (lstTrans.value === "I13") {
        lstVoucherType.value = "AJI";
    }
    else {
        lstVoucherType.value = "AJO";
    }

    data_ac_sel_60170100_detail.Call("SELECT");
}

//-----------------------------------------------------
function OnFormatGrid()
{
    var ctrl                                = grdDetail.GetGridControl();
    if (lstCurrency.text == "VND")
	{
        ctrl.ColFormat(g_TransAmount) = "###,###,###,###,###R";
        ctrl.ColFormat(g_BookAmount) = "###,###,###,###,###R";
		ctrl.ColHidden(g_TransAmount) = true;
    }
	else
	{
        ctrl.ColFormat(g_TransAmount) = "###,###,###,###,###.##R";
        ctrl.ColFormat(g_BookAmount) =  "###,###,###,###,###.##R";
	}		
    ctrl.ColFormat(g_Qty) = "###,###,###,###,###.##R";
    ctrl.ColFormat(g_Price) = "###,###,###,###,###.######R";
}
    //-----------------------------------------------------
function ChangeCurrency() {
    var ctrl = grdDetail.GetGridControl();

    if (lstCurrency.value == "VND") {
        ctrl.ColHidden(g_TransAmount) = true;
    }
    else {
        ctrl.ColHidden(g_TransAmount) = false;
    }
}

function OnDataReceive(iObj)
{
    switch (iObj.id) {
        case 'data_ac_sel_60170100_detail':
            OnFormatGrid();
            OnUpdateHeader();
            OnShowConSum();
            lblRecord.text = (grdDetail.rows-1) + " records";
            break;

        case 'data_ac_pro_60170100_Slip':
            txtStatus.text = txtReturn.text;
            //console.log(txtStatus.text);
            data_ac_sel_60170100_detail.Call("SELECT");
            break;
    }
}
//-----------------------------------------------------
function OnDtlPopup()
{
    var lrow = event.row ;
    var lcol = event.col;
    var i;
    var fpath;
    if(lcol == g_DebitAccCode)
    {
        fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=SP_SEL_ACCT_POPUP";
        var o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
   	 if (o !=null)
        {               
            var tmp = o[0];
            if( tmp != null  )
            {
	      grdDetail.SetGridText(lrow, g_DebitAccPK, o[3]);
                grdDetail.SetGridText(lrow, g_DebitAccCode, o[0]);
                grdDetail.SetGridText(lrow, g_DebitAccName, o[1]);
				
            }
        }                                
    }
    else if (lcol == g_CreditAccCode) {
        fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=SP_SEL_ACCT_POPUP";
        var o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
   	 if (o !=null)
        {               
            var tmp = o[0];
            if (tmp != null ) {
                grdDetail.SetGridText(lrow, g_CreditAccPK, o[3]);
                grdDetail.SetGridText(lrow, g_CreditAccCode, o[0]);
                grdDetail.SetGridText(lrow, g_CreditAccName, o[1]);
            }
        }
    }
    else if(lcol == g_PLCode)
    {
        fpath = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
        var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
        if ( object != null )  
        {
            if (object[0] != 0)
            {
                grdDetail.SetGridText(lrow, g_tac_abpl_pk, object[2]);
                grdDetail.SetGridText(lrow, g_PLCode, object[0]);
                grdDetail.SetGridText(lrow, g_PLName, object[1]);
            }            
        }            
    }
    else if (lcol === g_ItemCode) {
        OnAddNew("ChangeItem");
    }

    else if (lcol == g_WH) {

        var path = System.RootURL + '/standard/forms/fp/ab/fpab00240.aspx';
        var obj = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');

        if (obj != null) {
            //lstWH.value = obj[0];

            grdDetail.SetGridText(lrow, g_tin_wh_pk, obj[0]);
            grdDetail.SetGridText(lrow, g_WH, obj[2]);

        }
    }
}

//-----------------------------------------------------
function OnShowConSum()
{
    if (grdDetail.rows > 1) {
        txtTac_hgtrh_pk.text = grdDetail.GetGridData(grdDetail.rows - 1, g_tac_hgtrh_pk);

        lblSeq.text = txtTac_hgtrh_pk.text;

        if (Trim(txtTac_hgtrh_pk.text) != "") {
            btnMakeSlip.SetEnable(false);
            btnCancelSlip.SetEnable(true);
        }
        else {
            btnMakeSlip.SetEnable(true);
            btnCancelSlip.SetEnable(false);
        }
    }
    else {
        lblSeq.text = "";
        txtTac_hgtrh_pk.text = "";
    }
}
//-----------------------------------------------------
function OnMakeSlip() {
    txtMakeCancel.text = 'MakeSlip';
    data_ac_pro_60170100_Slip.Call();
}
//-----------------------------------------------------
function OnCancelSlip() {
    txtMakeCancel.text = 'Cancel';
    data_ac_pro_60170100_Slip.Call();
}
//-----------------------------------------------------
function OnUpdateHeader() {
    if (grdDetail.rows > 1) {
        ctrl = grdDetail.GetGridControl();

        var desc = grdDetail.GetGridData(ctrl.rows - 1, g_Description);
        txtDesc.text = desc;
    }
}

function onUpdateDetail() {

    for (var i = 1; i < grdDetail.rows; i++) {
        var strTable_NM = grdDetail.GetGridData(i, g_tr_table_nm);

        if (strTable_NM.toString().toUpperCase() == "TAC_STOCKTR" || strTable_NM == "") {
            grdDetail.SetGridText(i, g_TCO_COMPANY_PK, lstCompany.value);
            grdDetail.SetGridText(i, g_Trans, lstTrans.value);

            grdDetail.SetGridText(i, g_TrIn_Type, lstTrans.value.toString().substring(0, 1) == "I" ? "13" : "");
            grdDetail.SetGridText(i, g_TrOut_Type, lstTrans.value.toString().substring(0,1) == "O" ? "13" : "");

            grdDetail.SetGridText(i, g_Description, txtDesc.text);
            grdDetail.SetGridText(i, g_tr_date, dtTransDate.value);

            grdDetail.SetGridText(i, g_stock_no, dtMonth.value);
            grdDetail.SetGridText(i, g_STD_YM, dtMonth.value);

            grdDetail.SetGridText(i, g_TR_STATUS, '0');

            grdDetail.SetGridText(i, g_Description, txtDesc.text);
        }
    }
}

function carryDetail() {
    if (grdDetail.rows > 2) {

        grdDetail.SetGridText(grdDetail.rows - 1, g_DebitAccPK, grdDetail.GetGridData(grdDetail.rows - 2, g_DebitAccPK));
        grdDetail.SetGridText(grdDetail.rows - 1, g_DebitAccCode, grdDetail.GetGridData(grdDetail.rows - 2, g_DebitAccCode));
        grdDetail.SetGridText(grdDetail.rows - 1, g_DebitAccName, grdDetail.GetGridData(grdDetail.rows - 2, g_DebitAccName));

        grdDetail.SetGridText(grdDetail.rows - 1, g_CreditAccPK, grdDetail.GetGridData(grdDetail.rows - 2, g_CreditAccPK));
        grdDetail.SetGridText(grdDetail.rows - 1, g_CreditAccCode, grdDetail.GetGridData(grdDetail.rows - 2, g_CreditAccCode));
        grdDetail.SetGridText(grdDetail.rows - 1, g_CreditAccName, grdDetail.GetGridData(grdDetail.rows - 2, g_CreditAccName));

        grdDetail.SetGridText(grdDetail.rows - 1, g_tac_abpl_pk, grdDetail.GetGridData(grdDetail.rows - 2, g_tac_abpl_pk));
        grdDetail.SetGridText(grdDetail.rows - 1, g_PLCode, grdDetail.GetGridData(grdDetail.rows - 2, g_PLCode));    
        grdDetail.SetGridText(grdDetail.rows - 1, g_PLName, grdDetail.GetGridData(grdDetail.rows - 2, g_PLName));
        grdDetail.SetGridText(grdDetail.rows - 1, g_tin_wh_pk, grdDetail.GetGridData(grdDetail.rows - 2, g_tin_wh_pk));
        grdDetail.SetGridText(grdDetail.rows - 1, g_WH, grdDetail.GetGridData(grdDetail.rows - 2, g_WH));
        grdDetail.SetGridText(grdDetail.rows - 1, g_TR_STATUS, grdDetail.GetGridData(grdDetail.rows - 2, g_TR_STATUS));
        grdDetail.SetGridText(grdDetail.rows - 1, g_STD_YM, grdDetail.GetGridData(grdDetail.rows - 2, g_STD_YM));
        grdDetail.SetGridText(grdDetail.rows - 1, g_stock_no, grdDetail.GetGridData(grdDetail.rows - 2, g_stock_no));
        grdDetail.SetGridText(grdDetail.rows - 1, g_tr_date, grdDetail.GetGridData(grdDetail.rows - 2, g_tr_date));

        grdDetail.SetGridText(grdDetail.rows - 1, g_Description, grdDetail.GetGridData(grdDetail.rows - 2, g_Description));
        grdDetail.SetGridText(grdDetail.rows - 1, g_LocalDesc, grdDetail.GetGridData(grdDetail.rows - 2, g_LocalDesc));
    }
}
function OnAddNew(iCase) {
    switch (iCase) {
        
        case 'DETAIL':
            grdDetail.AddRow();
            carryDetail();
            onUpdateDetail();
            break;

        case 'FreeItem':
            var path = System.RootURL + '/standard/forms/fp/ab/fpab00070.aspx?group_type=|Y|||Y|Y';//purchase_yn=Y
            var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');

            if (object != null) {
                var arrTemp;
                for (var i = 0; i < object.length; i++) {
                    arrTemp = object[i];

                    grdDetail.AddRow();
                    onUpdateDetail();

                    grdDetail.SetGridText(grdDetail.rows - 1, g_tco_item_pk, arrTemp[0]);//item_pk	    
                    grdDetail.SetGridText(grdDetail.rows - 1, g_ItemCode, arrTemp[1]);//item_code	    
                    grdDetail.SetGridText(grdDetail.rows - 1, g_ItemName, arrTemp[2]);//item_name	    
                    grdDetail.SetGridText(grdDetail.rows - 1, g_Unit, arrTemp[5]);//item_uom
                }
            }
            break;

        case 'ChangeItem':
            var path = System.RootURL + '/standard/forms/fp/ab/fpab00070.aspx?group_type=|Y|||Y|Y';//purchase_yn=Y
            var object = System.OpenModal(path, 800, 600, 'resizable:yes;status:yes');

            if (object != null) {
                var arrTemp;
                for (var i = 0; i < object.length; i++) {
                    arrTemp = object[i];
                    if (i == 1)
                        break;
                    grdDetail.SetGridText(grdDetail.rows - 1, g_tco_item_pk, arrTemp[0]);//item_pk	    
                    grdDetail.SetGridText(grdDetail.rows - 1, g_ItemCode, arrTemp[1]);//item_code	    
                    grdDetail.SetGridText(grdDetail.rows - 1, g_ItemName, arrTemp[2]);//item_name	    
                    grdDetail.SetGridText(grdDetail.rows - 1, g_Unit, arrTemp[5]);//item_uom
                }
            }
            break;

        case 'copy_detail':
            var i, j;
            for (i = 1; i < grdDetail.rows ; i++) {
                if (grdDetail.GetGridControl().IsSelected(i)) {
                    
                    grdDetail.AddRow();

                    for (j = 0 ; j <= grdDetail.col - 1 ; j++) {
                        if (j != g_tac_stockmm_pk) {
                            grdDetail.SetGridText(grdDetail.rows - 1, j, grdDetail.GetGridData(i, j));
                        }
                    }
                    onUpdateDetail();
                }
            }
            break;
    }
}

function formCheckValid(){
    if (txtVoucherNo.text === ''){
        alert("Please input Voucher No");
        return false;
    }
    return true;
}

function OnSave() {
    if (txtTac_hgtrh_pk.text == "") {
        data_ac_sel_60170100_detail.Call();
    }
    else {
        alert("Already made slip!");
    }
}

function OnDelete(index) {

    if (txtTac_hgtrh_pk.text == "") {
        grdDetail.DeleteRow();
        data_ac_sel_60170100_detail.Call();
    }
    else {
        alert("Already made slip!");
    }
}

function OnSetGrid(idobj) {
    var fg = grdDetail.GetGridControl();
    switch (idobj) {
        case "DebitAccount":
            for (i = 1 ; i < grdDetail.rows; i++) {
                if (fg.isSelected(i) == true) {

                    grdDetail.SetGridText(i, g_DebitAccPK, txtDebitPK.text);
                    grdDetail.SetGridText(i, g_DebitAccCode, txtDebitCode.text);
                    grdDetail.SetGridText(i, g_DebitAccName, txtDebitName.text);
                    
                }
            }
            break;
        case "CreditAccount":
            for (i = 1 ; i < grdDetail.rows ; i++) {
                if (fg.isSelected(i) == true) {
                    
                    grdDetail.SetGridText(i, g_CreditAccPK, txtCreditPK.text);
                    grdDetail.SetGridText(i, g_CreditAccCode, txtCreditCode.text);
                    grdDetail.SetGridText(i, g_CreditAccName, txtCreditName.text);
                }
            }
            break;

        case "VoucherNo":
            for (i = 1 ; i < grdDetail.rows ; i++) {
                grdDetail.SetGridText(i, g_stock_no, txtVoucherNo.text);
            }
            break;
        case "PL":
            for (i = 1 ; i < grdDetail.rows ; i++) {
                if (fg.isSelected(i) == true) {
                    grdDetail.SetGridText(i, g_tac_abpl_pk, txtPLPK.text);
                    grdDetail.SetGridText(i, g_PLCode, txtPLCD.text);
                    grdDetail.SetGridText(i, g_PLName, txtPLNM.text);
                }
            }
            break;

        case "Warehouse":
            for (i = 1 ; i < grdDetail.rows ; i++) {
                if (fg.isSelected(i) == true) {
                    grdDetail.SetGridText(i, g_tin_wh_pk, lstWH.value);
                    grdDetail.SetGridText(i, g_WH, lstWH.GetText());
                }
            }
            break;
    }
}

function OnReset_SetGrid(idobj) {
    switch (idobj) {

        case "CreditAccount":
            txtCreditCode.SetDataText("");
            txtCreditName.SetDataText("");
            txtCreditPK.SetDataText("");
            break;
        
        case "DebitAccount":
            txtDebitCode.SetDataText("");
            txtDebitName.SetDataText("");
            txtDebitPK.SetDataText("");
            break;
        case "PL":
            txtPLCD.SetDataText("");
            txtPLNM.SetDataText("");
            txtPLPK.SetDataText("");
            break;
        case "Item":
            txtItemPK.SetDataText("");
            txtItemCode.SetDataText("");
            txtItemName.SetDataText("");
            break;
    }
}

String.prototype.padLeft = function (paddingChar, length) {

    var s = new String(this);

    if ((this.length < length) && (paddingChar.toString().length > 0)) {
        for (var i = 0; i < (length - this.length) ; i++)
            s = paddingChar.toString().charAt(0).concat(s);
    }

    return s;
};


function onMonthChange() {
    var date = new Date(dtMonth.value.substring(0, 4), dtMonth.value.substring(4, 6), 0);
    var strDate = date.getFullYear().toString() + (date.getMonth() + 1).toString().padLeft('0', 2) + date.getDate().toString().padLeft('0', 2);
    dtTransDate.value = strDate;
    txtVoucherNo.text = strDate;
    //onSearch();
}
//-----------------------------------------------------
</script>
<body>
<!---------------------------------------------------Ta----->
<gw:data id="data_ac_sel_60170100_detail" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32" function="ac_sel_60170100_detail" procedure ="ac_upd_60170100_detail"> 
            <input bind="grdDetail" > 
                    <input bind="txtTac_hgtrh_pk" /> 
                    <input bind="dtMonth" />
                    <input bind="lstTrans" /> 
                    <input bind="lstDataType" /> 
                    <input bind="txtItemPK" /> 
                    <input bind="txtItemCode" /> 
                    <input bind="txtItemName" /> 
                    <input bind="lstWH" /> 
             </input> 
            <output bind="grdDetail" /> 
        </dso> 
    </xml> 
</gw:data>

<gw:data id="data_ac_pro_60170100_Slip" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="process" procedure ="ac_pro_60170100_Slip"> 
            <input> 
                    <input bind="lstCompany" />     
                    <input bind="dtTransDate" />     
                    <input bind="lstTrans" />     
                    <input bind="txtDesc" />     
                    <input bind="txtVoucherNo" />  
                    <input bind="lstVoucherType" />  
                    <input bind="txtauto_yn" />  
                    <input bind="txtMakeCancel" /> 
             </input> 
            
             <output>
                     <output bind="txtReturn"/>
            </output>
        </dso> 
    </xml> 
</gw:data>

<!-------------------------------------------------------->
    <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%" >
        <tr>
            <td>
                <table border="1" cellpadding="0" cellspacing="0" width="100%" height="100%" >
                    <tr>
                        <td style="width:78%; ">			                        
                            <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%" >
                                <tr style="height:1%" >

                                    <td style="width: 8%" align="right"></td>
                                    <td style="width: 4%"></td>
                                    <td style="width: 2%" align="left"></td>		
                                    <td style="width: 4%" align="left"></td>		
                                    <td style="width: 2%"></td>

                                    <td style="width: 6%"></td>
                                    <td style="width: 5%" align="right" colspan ="2"></td>
                                    <td style="width: 10%" align="right" colspan="2"></td>      
                                    <td style="width: 8%" align="right"></td>
                                    <td style="width:9%" align="left" colspan="1" ></td>
                                    <td style="width:2%"></td>

                                    <td style="width: 3%" align="right" colspan="2"></td> 
                                    <td style="width:5%" align="left" ></td>         
                                    <td style="width: 2%" align="right"></td>

                                    <td style="width: 5%"></td>
                                    <td style="width: 3%"></td>   
                                    <td style="width: 3%"></td>   
                                    
                                    <td style="width: 3%"></td>
                                    <td style="width: 2%"></td>
                                    <td style="width: 2%"></td>
                                    <td style="width: 1%"></td>
                                    <td style="width: 1%"></td>
                                    <td style="width: 1%"></td>
                                    <td style="width: 5%"></td>
                                </tr>

                                <tr style="height:1%">
                                    <td align="left">&nbsp;Month&nbsp;</td>
                                    <td><gw:datebox id="dtMonth" type="month" lang="1" onchange="onMonthChange()"/></td>
                                    <td align="right" colspan="2">Trans Type</td>
                                    <td colspan="2" align="right">
                                        <gw:list id="lstTrans" styles="width:100%" onchange="onSearch()"><data>data|I13|Adjust in|O13|Adjust out|I20|Product in</data></gw:list>
                                    </td>
                                    <td align="right">Data input&nbsp;</td>
                                    <td colspan="3" align="right">
                                        <gw:list id="lstDataType" styles="width:100%" value=""><data>data||All|01|From Logistics|02|From Acc|03|Not in begin, input|04|By hand</data></gw:list>
                                    </td>
                                    <td align="right" ><a title="Click here to select PL" onclick="OnPopup('PL')" href="#tips">PL&nbsp;</a></td>
								    <td  align="left" ><gw:textbox id="txtPLCD" styles="width:100%;" /></td>
                                    <td></td>
								    <td  align="left" colspan="5"  ><gw:textbox id="txtPLNM" styles="width:100%;" /></td>			
								    <td  align="left" ><gw:imgBtn id="btnRSet_FromPL" img="reset" onclick="OnReset_SetGrid('PL')" /></td>
								    <td  align="left" ><gw:icon id="btnFill_FromPL" text="Fill" onclick="OnSetGrid('PL')" /></td>
                                    <td align="right"><gw:imgBtn id="btnSearch" img="search" alt="Search" onclick="onSearch()" /></gw:btn></td>
                                    <td align="center" ><gw:label id="lblSeq" styles='width:100%;color:cc0000;font:9pt;align:left' text='' /></td>
                                    <td></td>
                                    <td colspan="2"><gw:icon id="btnMakeSlip" text="Make Slip" onclick="OnMakeSlip()" /></td>
                                    <td colspan="2"><gw:icon id="btnCancelSlip" text="Cancel Slip" onclick="OnCancelSlip()" /></td>
                                    
                                </tr>
                                <tr style="width:1%">
                                    <td align="left">&nbsp;Description&nbsp;</td>                        
                                    <td align="right" colspan="9" ><gw:textbox id="txtDesc" text="" styles="width:100%" onenterkey="onUpdateDetail()"/></td>    
                                    <td align="right" ><a title="Click here to select Item" onclick="OnPopup('Item')" href="#tips">Item&nbsp;</a></td>      
                                    <td align="right"><gw:textbox id="txtItemCode" text="" styles="width:100%"onenterkey="onSearch()"/></td>   
                                    <td><gw:textbox id="txtItemPK" text="" styles="width:100%;display:none"/></td> 
                                    <td align="right" colspan="5"><gw:textbox id="txtItemName" text="" styles="width:100%" onenterkey="onSearch()"/></td> 
                                    <td  align="left" ><gw:imgBtn id="btnRSet_Item" img="reset" onclick="OnReset_SetGrid('Item')" /></td>   
                                    <td align="left" >WH&nbsp;&nbsp;</td>
                                    <td colspan="6" align="left" ><gw:list id="lstWH" styles="width:100%; " <%--onchange="OnSearch()"--%> /></td>	
                                    <td align="center" ><gw:icon id="btnFillWareHouse" text="Fill" onclick="OnSetGrid('Warehouse')" /></td>			

                                </tr>
                                <tr>
                                    <td align="left"><a title="Click here to select Debit account" onclick="OnPopup('Debit Account')" href="#tips">&nbsp;Account Debit&nbsp;</a></td>
								    <td align="left"><gw:textbox id="txtDebitCode" styles="width: 100%" /></td>
                                    <td></td>
								    <td align="left"  colspan="5"  ><gw:textbox id="txtDebitName" styles="width: 100%"  /></td>			
								    <td align="left" ><gw:imgBtn id="btnRSet_DebitCode" img="reset" onclick="OnReset_SetGrid('DebitAccount')" /></td>
								    <td align="left" ><gw:icon id="btnFill_Debit" text="Fill" onclick="OnSetGrid('DebitAccount')" /></td>
                                           
                                    <td align="right" ><a title="Click here to select Credit account" onclick="OnPopup('Credit Account')" href="#tips">Account Credit</a></td>
								    <td align="left" ><gw:textbox id="txtCreditCode" styles="width: 100%"  /></td>
                                    <td></td>
								    <td align="left" colspan="5"><gw:textbox id="txtCreditName" styles="width: 100%"  /></td>			
								    <td align="left" ><gw:imgBtn id="btnRSet_CreditCode" img="reset" onclick="OnReset_SetGrid('CreditAccount')" /></td>
								    <td align="left" ><gw:icon id="btnFill_Credit" text="Fill" onclick="OnSetGrid('CreditAccount')" /></td>
                                    <td align="center" colspan="2">
                                        <gw:icon id="idBtnFreeItem" img="2" text="ITEM" styles='width:80%' onclick="OnAddNew('FreeItem')" />
                                    </td>
									<td style="width: 2%"align="center"><gw:imgbtn id="btnNewD" img="new" alt="New" text="New" onclick="OnAddNew('DETAIL')" /></td>
									<td style="width: 2%"align="center"><gw:imgbtn id="btnCopy" img="copy" alt="Copy" text="Copy" onclick="OnAddNew('copy_detail')" /></td>									
                                    <td style="width: 2%"align="center"><gw:imgbtn id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" /></td>
                                    <td style="width: 2%"align="center"><gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" /></td>
                                    <td><gw:label id="lblRecord"  text="" maxlen = "100" styles="color:red;width:90%;font-weight: bold;font-size:9" /></td>
						
                                </tr>
                                <tr style="height:1%">
                                    <td colspan="27"></td>
                                </tr>

                                <tr style="height:95%">
                                    <td colspan="27">
                                        <gw:grid id="grdDetail"
                                        header="_tac_stockmm_pk|_STOCKTR_NO|_tr_date|_tac_hgtrh_pk|_tco_item_pk|Item Code|Item Name|Unit|Q'ty|UPrice|Trans Amount|Book Amount|_tac_acct_pk|Debit Acc|_Acc. Name|_Credit_PK|Credit Acc|_Credit Acc|_Description|_Local Desc|_tin_wh_pk|WH|_tac_abpl_pk|PL Code|PL Name|_TPR_LINE_PK|_TCO_BUSPARTNER_PK|_TRANS|_TRIN_TYPE|_TROUT_TYPE|_TR_STATUS|_STD_YM|_TCO_COMPANY_PK|_TR_TABLE_NM|_TR_TABLE_PK"
                                        format='0|0|0|0|0|0|0|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        aligns='0|0|0|0|0|0|0|1|3|3|3|3|0|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        defaults='||||||||||||||||||||||||||||||||||' 
                                        editcol='0|0|0|0|0|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                        widths='0|0|0|0|0|1600|3000|800|1500|1700|1800|1800|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                                        acceptNullDate='T'										
                                        sorting='T' styles='width:100%; height:100%'
                                        oncelldblclick="OnDtlPopup()" 
                                        onafteredit="checkInput()"                                    
                                        />                                                                                                                                  
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
    </table>   
    
                
    <gw:datebox id="dtTransDate" lang="1" styles="width:100%;" /> 
    <gw:textbox id="txtVoucherNo" styles="width:100%:display:none" onblur="OnSetGrid('VoucherNo')" onenterkey="OnSetGrid('VoucherNo')"/>

    <gw:textbox id="txtauto_yn" text="Y" styles="width:100%:display:none" />
    <gw:list id="lstCurrency" styles="width:100%;display:none" />

    <gw:list id="lstCompany" styles="width:100%;display:none" />
    <gw:list id="lstVoucherType" text="" styles="width:100%;display:none"><data>data|AJI|Adjust in|AJO|Adjust out</data></gw:list>
    <gw:textbox id="txtTransPK" styles="display:none" />   
    <gw:textbox id="txtTransCD" text="" styles="width:100%;display:none" csstype="mandatory" />
    <gw:textbox id="txtTransNM" text="" styles="width:100%;display:none" csstype="mandatory" /> 
    <gw:textbox id="txtTac_hgtrh_pk" styles="display:none" />    
    <gw:textbox id="txtTotalAmt" styles="display:none" />    
    <gw:textbox id="txttac_omcost_pricer_pk" styles="display:none" />    
    <gw:textbox id="txtPLPK" styles="display:none" />
    <gw:textbox id="txtStatus" styles="display:none" />
    <gw:textbox id="txttrans_dt" styles="display:none" />
    <gw:textbox id="txttrans_dt_TO" styles="display:none" />
    <gw:textbox id="txtCreditPK" style="display:none" />
    <gw:textbox id="txtDebitPK" style="display:none" />
    <gw:textbox id="txtReturn" style="display:none" />
    <gw:textbox id="txtMakeCancel" style="display:none" />
    <gw:checkbox id="chkAuto_YN" value='T' styles="width:100%;display:none" />
</body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                