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


function BodyInit()
{
    System.Translate(document);
    BindingDataList();
    //lstTRADE.SetDataText("ALL");
    lstRATE.SetDataText("ALL");
    
    lstLang.SetDataText("VIE");
    txtSUM_NET.SetEnable(false);
    txtSUM_VAT.SetEnable(false);
    ls_trsdate      = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
    txt_date.text   = ls_trsdate;
    txt_row.text    = 0;
    //OnChangCompany();
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	dso_getCompany.Call();

    
}

function BindingDataList()
{
    var ls_comp     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_ccy      = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
    var ls_rate     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACCR0110','03','') FROM DUAL")%>|ALL|All Types";
    var ls_trade    = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('CODC0120','01','') FROM DUAL")%>|ALL|All Types";    
    var ls_lang      = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('HRAB0180','02','') FROM DUAL")%>";
    var dataLstType = "Data|1|Monthly|2|Quarter|3|Year|4|As current"; 
    rdoType.SetDataText(dataLstType); 
    lstLang.SetDataText(ls_lang);
    lstCompany.SetDataText(ls_comp);
    //lstTRADE.SetDataText(ls_trade);
    lstRATE.SetDataText(ls_rate);
    lstCurrent.SetDataText(ls_ccy); 
    var dataLstVoucher = "Data|1|Voucher No|2|Voucher APP"; ////not onsearch,but only print value report
    lstvoucher.SetDataText(dataLstVoucher); ///not onsearch,but only print value report
    var data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
    arr  = data.split("|");
	lblBookccy.SetDataText(arr[1]);
	var dataStatus = "Data|2|Confirmed|0|Approved"; 
    lstStatus.SetDataText(dataStatus);
    lstStatus.value=2; 
    var dataVATTypeInOut = "Data|1|IN|2|OUT"; 
    lstTypeINOUT.SetDataText(dataVATTypeInOut); 
    txtTaxRate.SetDataText("ALL");
    //alert(lstRATE.GetText());
}

function OnChangCompany()
{
    sel_busplace.Call();
}

function OnResetInvoice()
{
    if(event.keyCode == 27){
        txtINVOICENO.SetDataText("");
    }

}
function OnSearch()
{
    dso_sel_grd_vat_inquiry.Call("SELECT");
}
function OnSum()
{

    var ctrl = grid.GetGridControl();
    var sum_net = 0;
    var sum_amt = 0;
    for(i = 1; i<ctrl.Rows; i++)
    {
        
        sum_net = sum_net + Number(grid.GetGridData(i,15));
        sum_amt = sum_amt + Number(grid.GetGridData(i,16));
    }
    
    txtSUM_NET.SetDataText(""+sum_net);
    txtSUM_VAT.SetDataText(""+sum_amt);
    lblRECORD.text = (ctrl.Rows -1);
}

function OnSearchCust()
{
	var path = System.RootURL + '/standard/forms/60/05/60050010.aspx';
	var object = System.OpenModal( path ,800, 600, 'resizable:yes;status:yes');
	if ( object != null )
	{
	    if (object[0] != 0)
        {
            txtCUST_PK.text = object[0];
            txtCUST_NM.text = object[2];
            txtCUST_ID.text = object[1];
        }
    }
}

function OnResetCust()
{   
    //esc:27
    if(event.keyCode == 27){
        txtCUST_PK.SetDataText("");
        txtCUST_NM.SetDataText("");
        txtCUST_ID.SetDataText("");
    }
}
function OnReport()
{
    if(confirm("Are you sure you want to report ?" ))
    {
        //alert(rdoVAT_TYPE.GetData());
        if(lstTypeINOUT.GetData()=="1")
        {
            switch (lstLang.GetData())
            {
                case "VIE":
                    var url = '/standard/reports/gf/lv/gflv00020_rpt_VAT_In1.aspx?compk=' + lstCompany.GetData();
                     url = url + '&month=' + dtMonth.GetData() + '&vat_type=' + lstTypeINOUT.GetData();
                     url = url + '&vat_rate='+ txtTaxRate.GetData() +  '&ccy=' + lstCurrent.GetData();
                     url = url + '&status=' + lstStatus.GetData() + '&custpk=' + txtCUST_PK.GetData();
                     url = url + '&invoiceno=' + txtINVOICENO.text + '&ac_cd=' + txtAC_CD.text;
                     url = url + '&txtSeq=' + txtSeq.GetData() + '&voucherno=' + txtVoucherNo.text;
                     url = url + '&BalType=' + rdoType.GetData() + '&p_dtfr=' + dtfrdate.GetData() + '&p_dtto=' + dttodate.GetData() + '&voucher_type=' + lstvoucher.GetData(); 
              
                    break;
                case "ENG":
                    var url = '/standard/reports/gf/lv/gflv00020_rpt_VAT_In_ENG.aspx?com=' + lstCompany.GetData() + '&yyyymm=' + dtMonth.GetData() + '&status=' + lstStatus.GetData() + '&vat_rate='+ txtTaxRate.GetData() + '&ccy=' + lstCurrent.GetData() + '&cust_pk=' + txtCUST_PK.GetData()+'&acc_pk='+txtac_pk.text;
                    break;
            }
        }       
        else
        {
            switch (lstLang.GetData())
            {
                case "VIE":
                    //var url = '/standard/reports/gf/lv/gflv00020_rpt_VAT_Out.aspx?com=' + lstCompany.GetData() + '&yyyymm=' + dtMonth.GetData() + '&status=' + lstStatus.GetData() + '&vat_rate='+ txtTaxRate.GetData() + '&ccy=' + lstCurrent.GetData() + '&cust_pk=' + txtCUST_PK.GetData()+'&acc_pk='+txtac_pk.text;
                     var url = '/standard/reports/gf/lv/gflv00020_rpt_VAT_Out.aspx?compk=' + lstCompany.GetData();
                     url = url + '&month=' + dtMonth.GetData() + '&vat_type=' + lstTypeINOUT.GetData();
                     url = url + '&vat_rate='+ txtTaxRate.GetData() +  '&ccy=' + lstCurrent.GetData();
                     url = url + '&status=' + lstStatus.GetData() + '&custpk=' + txtCUST_PK.GetData();
                     url = url + '&invoiceno=' + txtINVOICENO.text + '&ac_cd=' + txtAC_CD.text;
                     url = url + '&txtSeq=' + txtSeq.GetData() + '&voucherno=' + txtVoucherNo.text;
                     url = url + '&BalType=' + rdoType.GetData() + '&p_dtfr=' + dtfrdate.GetData() + '&p_dtto=' + dttodate.GetData() + '&voucher_type=' + lstvoucher.GetData(); 
              
                    break;
                case "ENG":
                    var url = '/standard/reports/gf/lv/gflv00020_rpt_VAT_Out_ENG.aspx?com=' + lstCompany.GetData() + '&yyyymm=' + dtMonth.GetData() + '&status=' + lstStatus.GetData() + '&vat_rate='+ txtTaxRate.GetData() + '&ccy=' + lstCurrent.GetData() + '&cust_pk=' + txtCUST_PK.GetData()+'&acc_pk='+txtac_pk.text;
                    break;
            }
            //var url = '/standard/reports/gf/lv/gflv00020_rpt_VAT_Out.aspx?com=' + lstCOMPANY.GetData() + '&yyyymm=' + txtMonth.GetData() + '&status=' + rdoSTATUS.GetData() + '&vat_rate='+ lstRATE.GetData() + '&ccy=' + lstCCY.GetData() + '&cust_pk=' + txtCUST_PK.GetData();
        }
        //alert(url);
        System.OpenTargetPage( System.RootURL+url , 'newform' )
    }
    
}
function OnReport2()
{
    
      
        if(lstTypeINOUT.GetData()=="1")
        {
            
            //var url = '/standard/reports/gf/lv/gflv00400_import_VAT_in.aspx?com=' + lstCompany.GetData() + '&yyyymm=' + dtMonth.GetData() + '&status=' + lstStatus.GetData() + '&vat_rate='+ lstRATE.GetData() + '&ccy=' + lstCurrent.GetData() + '&cust_pk=' + txtCUST_PK.GetData()+'&acc_pk='+txtac_pk.text;
      //  var url = '/standard/reports/gf/lv/gflv00400_import_VAT_in.aspx?com=' + lstCompany.GetData() + '&yyyymm=' + dtMonth.GetData() + '&status=' + lstStatus.GetData() + '&vat_rate='+ lstRATE.GetData() + '&ccy=' + lstCurrent.GetData() + '&cust_pk=' + txtCUST_PK.GetData()+'&acc_pk='+txtac_pk.text + '&voucher_type=' + lstvoucher.GetData(); 
          var url = '/standard/reports/gf/lv/gflv00040_ExciseTaxesInquiry_In.aspx?compk=' + lstCompany.GetData() + '&month=' + dtMonth.GetData() + '&vat_type=' + lstTypeINOUT.value + '&vat_rate='+ lstRATE.GetData() + '&ccy=' + lstCurrent.GetData() + '&status=' + lstStatus.GetData()   + '&custpk=' + txtCUST_PK.GetData() + '&invoiceno=' + txtINVOICENO.text + '&ac_cd=' + txtAC_CD.text + '&tac_hgtrh_pk=' + txtSeq.text + '&voucherno=' + txtVoucherNo.text + '&balance_type=' + rdoType.value +'&dtfr=' + dtfrdate.value + '&dtto=' + dttodate.value;    
        }
        else
        {
           // var url = '/standard/reports/gf/lv/gflv00400_import_VAT_Out.aspx?com=' + lstCompany.GetData() + '&yyyymm=' + dtMonth.GetData() + '&status=' + lstStatus.GetData() + '&vat_rate='+ lstRATE.GetData() + '&ccy=' + lstCurrent.GetData() + '&cust_pk=' + txtCUST_PK.GetData()+'&acc_pk='+txtac_pk.text;
              var url = '/standard/reports/gf/lv/gflv00040_ExciseTaxesInquiry_Out.aspx?compk=' + lstCompany.GetData() + '&month=' + dtMonth.GetData() + '&vat_type=' + lstTypeINOUT.value + '&vat_rate='+ lstRATE.GetData() + '&ccy=' + lstCurrent.GetData() + '&status=' + lstStatus.GetData()   + '&custpk=' + txtCUST_PK.GetData() + '&invoiceno=' + txtINVOICENO.text + '&ac_cd=' + txtAC_CD.text + '&tac_hgtrh_pk=' + txtSeq.text + '&voucherno=' + txtVoucherNo.text + '&balance_type=' + rdoType.value +'&dtfr=' + dtfrdate.value + '&dtto=' + dttodate.value;
        }
        
        System.OpenTargetPage( System.RootURL+url , 'newform' )
   
    
}
function RowClick()
{
    var rows =0;
    var rownum =0;
    var colnum =0;
    var pk = 0;
    var status = "";
    var ls_arr = ""; 

    var ctrl = grid.GetGridControl();
    rows = ctrl.Rows;
    rows = rows - 1;
    rownum = ctrl.row;
    pk = grid.GetGridData(ctrl.row, 1);
    status = grid.GetGridData(ctrl.row, 6);
//    for (i = 1; i < grid.rows; i++)
//    {
//        ls_arr = ls_arr + ' ' + grid.GetGridData(i, 1);
//    } 

    if (rownum > 0) 
    {
        var fpath = System.RootURL + '/standard/forms/gf/hg/gfhg00020_popup.aspx?PK_ROW=' + pk + '&ROW=' + rownum + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
        var wWidth = 950;
        var wHeight = 600;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +"lef="+ x +",top=" + y;
        this.name = "gflv00020";
        var object = System.OpenModal(fpath, wWidth, wHeight, features, window);
    }
}

function GetRowPK(row_index){
    if((row_index < grid.rows) && (row_index > 1)){
        return grid.GetGridData(row_index, 1);
    }
    return -1;
}

function OnDataReceive(obj)
{   
    if(obj.id =="dso_getCompany")
    {
       	OnChangeDateType();
    }
}
function OnGetAccount(){
    var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60120170_acct_popup";    o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes');	
    if (o != null)
	{
		if(o[0] != 0)
		{
		    txtAC_CD.SetDataText(o[0]);
			txtAC_Name.SetDataText(o[1]);
			txtac_pk.SetDataText(o[3]);
		}
    }
}
function OnGetCust()
{
    var path = System.RootURL + '/standard/forms/60/08/60080030_popup_customer.aspx';
    var object = System.OpenModal( path ,800 , 630 , 'resizable:yes;status:yes');
    if ( object != null )
    {
        if (object[0] != 0)
        {
            txtCUST_PK.text = object[0];
            txtCUST_ID.text = object[1];
            txtCUST_NM.text = object[2];
        }
    }
}
function OnResetAccount(){
    if(event.keyCode == 27){
        txtAC_CD.SetDataText("");
	    txtAC_Name.SetDataText("");
	    txtac_pk.SetDataText("");
    }
}
function OnChangeDateType()
{
    CalculateFTDate();
    /*var quater = lstQuater.GetData();
    var yyyy = dtfrdate.text.substr(6,4);
    var mmyyyy = dtfrdate.text.substr(3,7);
    var acc_mmyyyy = dtfrdate.GetData();
    acc_mmyyyy = System.AddDate(acc_mmyyyy,-365);
    acc_mmyyyy = acc_mmyyyy.substr(4,2) +"/"+ acc_mmyyyy.substr(0,4);*/
    if(rdoType.GetData() == 1){
        txtDateType.text = "M";
        lblDateType.text = "Month:";
        dtMonth.style.display = "";
        dtYear.style.display = "none";
        lstQuater.style.display = "none";
        
    }
    else if(rdoType.GetData() == 2){
        txtDateType.text = "Q";
        lblDateType.text = "Quater:";
        dtMonth.style.display = "none";
        dtYear.style.display = "";
        lstQuater.style.display = "";
        CalculateFTDate();
    }
    else if(rdoType.GetData() == 3){
        txtDateType.text = "Y";
        lblDateType.text = "Year:";
        dtMonth.style.display = "none";
        dtYear.style.display = "";
        lstQuater.style.display = "none";
    }
}
function CalculateFTDate(){
    //1:Month, 2:Quater, 3:Year
    var yyyymm,yyyy, mm, quater;
    //month
    if(rdoType.GetData() == 1){
        yyyymm = dtMonth.GetData();
        yyyy = yyyymm.substr(0,4);
        mm = yyyymm.substr(4,2);
        dtfrdate.SetDataText(yyyy+mm+"01");
        dttodate.SetDataText(yyyy+mm+LastDayOfMonth(yyyymm));
    }
    //quater
    else if(rdoType.GetData() == 2){
        yyyy = dtYear.GetData();
        quater = lstQuater.GetData();
        if(quater == 1){
            dtfrdate.SetDataText(yyyy + "0101");    
            dttodate.SetDataText(yyyy + "0331");    
        }
        else if(quater == 2){
            dtfrdate.SetDataText(yyyy + "0401");    
            dttodate.SetDataText(yyyy + "0630");    
        }
        else if(quater == 3){
            dtfrdate.SetDataText(yyyy + "0701");    
            dttodate.SetDataText(yyyy + "0930");    
        }
        else if(quater == 4){
            dtfrdate.SetDataText(yyyy + "1001");    
            dttodate.SetDataText(yyyy + "1231");    
        }
    }
    //year
    else if(rdoType.GetData() == 3){
        yyyy = dtYear.GetData();
        dtfrdate.SetDataText(yyyy + "0101");    
        dttodate.SetDataText(yyyy + "1231"); 
    }
    OnSearch();
}
function LastDayOfMonth(p_yyyymm){
    mm = p_yyyymm.substr(4,2);
    yyyy = p_yyyymm.substr(0,4);
    mm = parseInt(mm,10);
    switch(mm)
    {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
          return 31;
          break;
        case 4:
        case 6:
        case 9: 
        case 11:
        return 30;
          break;
        default: 
        if((yyyy%4 == 0)&&(yyyy%100 > 0)){
            return 29;
        }
        else
        {
            return 28;
        }
    }
    return -1;//invalid month
}
function OnChangeQuater()
{
    OnChangeDateType();
}
function OnChangeYear()
{
    OnChangeDateType();
}
function OnChangeMonth()
{
    OnChangeDateType();
}
function OnChangeCurrent()
{
    dso_get_rate.Call();
}
function resetCust()
{
    txtCUST_PK.text = "";
    txtCUST_ID.text = "";
    txtCUST_NM.text = "";
}
function resetAcc()
{
    txtAC_CD.text = "";
	txtAC_Name.text = "";
	txtac_pk.text = "";
}
function OnchangeListTaxRate()
{
    
    txtTaxRate.text = lstRATE.GetData();
    OnSearch();
}
function OnPrintTest()
{
        //if(lstTypeINOUT.GetData()=="1")
        //{
            
            var url = '/standard/reports/gf/lv/gflv00400_import_VAT_in.aspx?com=' + lstCompany.GetData() + '&yyyymm=' + dtMonth.GetData() + '&status=' + lstStatus.GetData() + '&vat_rate='+ lstRATE.GetData() + '&ccy=' + lstCurrent.GetData() + '&cust_pk=' + txtCUST_PK.GetData()+'&acc_pk='+txtac_pk.text;
            System.OpenTargetPage( System.RootURL+url , 'newform' ); 
        //}

}
</script>

<body style="margin: 0; padding: 0;">
    <gw:data id="dso_get_rate" >
        <xml> 
            <dso type="process" procedure="SP_PRO_GET_RATE"> 
                <input> 
                     <input bind="txt_date"/>
                     <input bind="lstCompany"/>
                     <input bind="lstCurrent" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtrate1"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_sel_grd_vat_inquiry" onreceive="OnSum()">
        <xml>
            <dso type="grid" function="sp_sel_gflv00040_1">
                <input bind="grid">
                    <input bind="lstCompany"/>
                    <input bind="dtMonth"/>
                    <input bind="lstTypeINOUT"/>
                    <input bind="txtTaxRate"/>
                    <input bind="lstCurrent"/>
                    <input bind="lstStatus"/>
                    <input bind="txtCUST_PK"/>
                    <input bind="txtINVOICENO"/>
                    <input bind="txtAC_CD"/>
                    <input bind="txtSeq"/>
                    <input bind="txtVoucherNo"/>
                    <input bind="rdoType"/>
                    <input bind="dtfrdate"/>
                    <input bind="dttodate"/>
                </input>
                <output bind="grid"/>
            </dso>
        </xml>
    </gw:data>
   <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_6008180_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td style="width:5%">
                Company</td>
            <td  style="width:27%;">
                <gw:list id="lstCompany" onchange="OnChangeList()" styles='width:100%' />
            </td>
            <td style="width:5%">
                &nbsp;Balance</td>
            <td style="width:12%">
               <gw:list id="rdoType" styles="width:100%;" onchange="OnChangeDateType()" />
            </td>
            <td>
                &nbsp;<gw:label id="lblDateType" text="Month:" styles="width:100%;font-weight:600;" />
            </td>
            <td style="width:19%">
                <gw:list id="lstQuater" styles="width:100%;" onchange="OnChangeQuater()">
                                                    <data>Data|1|I|2|II|3|III|4|IV</data>
                                                </gw:list>
            </td>
            <td style="width:5%">
                <gw:datebox id="dtYear" type="year" lang="1" styles="display:none" onchange="OnChangeYear()" />
            </td>
            <td style="width:5%"><gw:datebox id="dtMonth" type="month" lang="1" onchange="OnChangeMonth()" /></td>
            <td style="width:8%">
                <gw:datebox id="dtfrdate" type="date" lang="1" onchange="OnSearch"/>
            </td>
            <td style="width:8%" colspan=2>
                <gw:datebox id="dttodate" type="date" lang="1" onchange="OnSearch" />
            </td>
            <td style="width:3%" colspan="2" align="right">
                <gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
            <td style="width:2%">
                <gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnReport()" />
            </td>
        </tr>
        <tr>
            <td style="width:5%">
                Language</td>
            <td style="width:20%" colspan="1">
                <gw:list id="lstLang" onchange="OnSearch()" styles='width:100%' />
            </td>
            <td style="width:5%">
                &nbsp;Status</td>
            <td style="width:25%">
                <gw:list id="lstStatus" onchange="OnSearch()"/> 
            </td>
            <td style="width:5%">
                &nbsp;Currency</td>
            <td style="width:15%">
                <gw:list id="lstCurrent" onchange="OnChangeCurrent()" styles='width:100%' />
            </td>
            <td style="width:8%">
                &nbsp;Ex Rate</td>
            <td style="width:2%">
                <gw:textbox id="txtrate" text="1" styles='width:100%' type="number" format="###,###.##R" />
            </td>
            <td style="width:8%">
                <gw:textbox id="txtrate1" text="1" styles='width:100%' type="number" format="###,###.##R"
                    onenterkey="OnSearch()" />
            </td>
            <td>Unit</td>
            <td style="width:5%" colspan="1">
                 <gw:textbox id="txtScale" styles='width:100%' type="number" format="###,###,###R"
                    onenterkey="OnSearch()" /></td>
                    
            <!--<td style="width:3%">
                <gw:textbox id="txtScale" styles='width:100%' type="number" format="###,###,###R"
                    onenterkey="onSearch()" />
            </td>-->
            <td style="width:3%">
                <gw:label id="lblBookccy" styles="width:100%;color:red; font-weight:700;" />
            </td>
            <td style="width:2%"><gw:imgbtn id="ibtnReport2" img="printer" alt="Print" onclick="OnReport2()" /></td>
        </tr>
        <tr>
            <td style="width:5%">Tax.Rate</td>
            <td style="width:25%"><gw:list id="lstRATE" styles='width:100%' onchange="OnchangeListTaxRate()" /></td>
            <td style="width:1%" >&nbsp;Report.Type</td>
            <td style="width:1%"><gw:list id="lstReporttype" styles='width:100%' onchange="OnSearch()" /></td>
            <td style="width:5%" align="right">&nbsp;VAT.Type</td>
            <td><gw:list id="lstTypeINOUT" onchange="OnSearch()"/></td>
            <td style="width:5%" ><a href="#" onclick="OnGetAccount()" title="Get account">&nbsp;Account</a></td>
            <td style="width:25%" colspan="5"><gw:textbox id="txtAC_CD" styles="width:30%" onkeypress="OnResetAccount()" onenterkey="OnSearch()" /><gw:textbox id="txtAC_Name" styles="width:70%" /></td>
             <td style="width:1%"><gw:imgBtn id="ibtnAccReset" styles='width=20%' img="reset"  alt="reset acc" onclick="resetAcc()" /></td>
            
        </tr>
        <tr>
            <td style="width:5%">Voucher No</td>
            <td style="width:25%"><gw:textbox id="txtVoucherNo" onenterkey="OnSearch()" styles="width:100%" /></td>
            <td style="width:5%">&nbsp;Invoice.No</td>
            <td style="width:25%"><gw:textbox id="txtINVOICENO" styles='width:100%' onenterkey="OnSearch()" onkeypress="OnResetInvoice()" /></td>
            <td style="width:1%">&nbsp;SEQ</td>
            <td style="width:1%"><gw:textbox id="txtSeq" onenterkey="OnSearch()" /></td>
            <td style="width:5%"><a href="#" onclick="OnGetCust()" title="Get customer(press Esc key to reset)">&nbsp;Customer</a></td>
            <td style="width:25%" colspan="5"><gw:textbox id="txtCUST_ID" styles='width=30%' onkeypress="OnResetCust()" onenterkey="OnSearch()" /><gw:textbox id="txtCUST_NM" styles='width=70%' /></td>
            <td style="width:1%"><gw:imgBtn id="ibtnCust" styles='width=20%' img="reset"  alt="reset Cust" onclick="resetCust()" /></td>
           
        </tr>
        <tr>
            <td style="width:5%" colspan="8" align="left"></td>
            <td style="width:5%" align="right">Voucher</td>
            <td style="width:5%" colspan="3"><gw:list id="lstvoucher"/></td>
        </tr>

        <tr style="height: 90%" valign="top">
		    <!--0.NO|2.Seq|3_pk|4_comp_pk|5_VAT type|6.Seri No|7.Invoice date|8.Invoice No|9_cust_pk|10.Cust Name|11.Tax code|12.Address|13.Item|14.Quantity|15.Unit Price|16.Ccy|17.Rate|18.Net Amt| 19.VAT Amt|20.Voucher No|21.Trs. date|22.User-->
            <td colspan="13">
                <gw:grid id="grid" 
                    header="NO|Seq|_pk|_comp_pk|_VAT type|Seri No|Invoice date|Invoice No|_cust_pk|Cust Name|Tax code|Address|Item|Quantity|Unit Price|Ccy|Rate|Net Amt| VAT Amt|Voucher No|Trs. date|User"
                    format="1|0|1|1|0|0|0|0|0|0|0|0|0|0|1|1|0|1|1|0|4|0" 
                    aligns="1|1|0|0|0|1|1|0|0|0|0|0|0|3|3|1|1|3|3|0|1|0"
                    acceptnulldate="T" 
                    defaults="|||||||||||||||||||||" 
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="600|600|0|0|0|1200|1600|1600|0|2500|1500|2500|2500|1500|1500|600|800|1800|1800|1800|1200|1200"
                    styles="width:100%; height:360" 
                    sorting="T" 
                    oncelldblclick="RowClick()" />
            </td>
        </tr>
        <tr style="height: 2%" valign="top">
            <td>
                Total</td>
            <td>
                <gw:label id="lblRECORD" text="0" />
            </td>
            <td>
                <font color="red">Invoices&nbsp;</td>
            <td align="right" colspan="2">
                Sum Net Amt&nbsp;</td>
            <td colspan="2">
                <gw:textbox id="txtSUM_NET" type="number" format="#,###,###,###,###R"></gw:textbox>
            </td>
            <td>
            </td>
            <td align="right">
                Sum VAT Amt&nbsp;</td>
            <td colspan="4">
                <gw:textbox id="txtSUM_VAT" type="number" format="#,###,###,###,###R"></gw:textbox>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------------------------------------->
    <gw:textbox id="txtCUST_PK" styles='display:none'></gw:textbox>
    <gw:textbox id="txtac_pk" styles='display:none'></gw:textbox>
    <gw:textbox id="txtDateType" style="display: none" />
    <gw:textbox id="txt_row" style="display: none" />
    <gw:textbox id="txt_date" style="display: none" />
    <gw:textbox id="txtTaxRate" style="display: " />
		<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
</body>
</html>