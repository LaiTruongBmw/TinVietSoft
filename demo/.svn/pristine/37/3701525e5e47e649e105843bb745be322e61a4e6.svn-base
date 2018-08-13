<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>

<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<%-- ReSharper disable once UnusedLocals --%>
<script>
var icol = 0;
var g_pk            = icol++,
    g_ac_cd         = icol++,
    g_ac_nm         = icol++,
    g_local_nm      = icol++,
    g_kor_nm        = icol++,
    g_tac_abpl_pk   = icol++,
    g_pl_cd         = icol++,
    g_pl_nm         = icol++,
    g_dr_op         = icol++,
    g_cr_op         = icol++,
    g_dr_ps         = icol++,
    g_cr_ps         = icol++,
    g_dr_acc        = icol++,
    g_cr_acc        = icol++,
    g_dr_bl         = icol++,
    g_cr_bl         = icol++,
    g_bold_yn       = icol++,
    g_color         = icol++,
    g_ac_level      = icol++,
    g_begin_amount  = icol++,
    g_in_amount     = icol++,
    g_out_amount    = icol++,
    g_end_amount    = icol++,
    g_begin_gap     = icol++,
    g_in_gap        = icol++,
    g_out_gap       = icol++,
    g_end_gap       = icol++;

 
function BodyInit()
{
    window.System.Translate(document);
    var lsCompany = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var lsLang = "<%=CtlLib.SetListDataFUNC("SELECT AC_A_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
    
    var lsLevel   = "<%=CtlLib.SetListDataFUNC("SELECT AC_F_COMMONCODE('ACAB0020','','') FROM DUAL")%>||";
    var lsPossum  = "DATA|Y|Posting|N|Summary||";
    var lsDate     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
    var dataAccType  =  "<%=CtlLib.SetListDataFUNC("SELECT AC_A_GET_COMMONCODE('EACBK020') FROM DUAL")%>";
    window.lstAccType.SetDataText(dataAccType); 
    var dataStatus = "Data|0|Approved|2|Confirmed"; 
    window.lstStatus.SetDataText(dataStatus); 
    window.lstStatus.SetDataText("2"); 
    window.txt_date.SetDataText(lsDate);
    window.lstCompany.SetDataText(lsCompany);
   
    window.lstLang.SetDataText(lsLang);
    window.lstLevel.SetDataText(lsLevel);
    window.lstPostSum.SetDataText(lsPossum);
    MergeHeader();
    window.txtac_nm.SetEnable(false);
    window.lstLevel.SetDataText("");
    window.lstPostSum.SetDataText("");
    window.idGrid.GetGridControl().FrozenCols = 5;
    window.txtac_cd.GetControl().focus();
    OnLang();
    OnChangeMonth();
    onGroupByChange();
	window.txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	dso_getCompany.Call();
    
}

function OnLang() {
    if(window.lstLang.value === "ENG")
    {
        idGrid.GetGridControl().ColHidden(2) = false;
        idGrid.GetGridControl().ColHidden(3) = true;
        idGrid.GetGridControl().ColHidden(4) = true;
    }
    else if(window.lstLang.value === "VIE")
    {
        idGrid.GetGridControl().ColHidden(2) = true;
        idGrid.GetGridControl().ColHidden(3) = false;
        idGrid.GetGridControl().ColHidden(4) = true;
    }
    else if(window.lstLang.value === "KOR")
    {
        idGrid.GetGridControl().ColHidden(2) = true;
        idGrid.GetGridControl().ColHidden(3) = true;
        idGrid.GetGridControl().ColHidden(4) = false;
    }
    else if(window.lstLang.value === "ENG-KOR")
    {
        idGrid.GetGridControl().ColHidden(2) = false;
        idGrid.GetGridControl().ColHidden(3) = true;
        idGrid.GetGridControl().ColHidden(4) = false;
    }
    else if(window.lstLang.value === "ENG-VIE")
    {
        idGrid.GetGridControl().ColHidden(2) = false;
        idGrid.GetGridControl().ColHidden(3) = false;
        idGrid.GetGridControl().ColHidden(4) = true;
    }
    else if(window.lstLang.value === "ENG-VIE-KOR")
    {
        idGrid.GetGridControl().ColHidden(2) = false;
        idGrid.GetGridControl().ColHidden(3) = false;
        idGrid.GetGridControl().ColHidden(4) = false;
    }
    else if(window.lstLang.value === "KOR-VIE")
    {
        idGrid.GetGridControl().ColHidden(2) = true;
        idGrid.GetGridControl().ColHidden(3) = false;
        idGrid.GetGridControl().ColHidden(4) = false;
    }
}

function onSearch() {
    OnLang();
    window.txtac_cd.GetControl().focus();
    window.idGrid.ClearData();
    if (window.txtac_cd.GetData() === "") {
        window.txtac_nm.SetDataText("");
    }

    MergeHeader();
    dso_sel_trial_balance.Call('SELECT');
}

function MergeHeader() {
    if (window.idGrid.rows < 2) {
        window.idGrid.AddRow();
    }

    var fg = window.idGrid.GetGridControl();
    fg.FixedRows = 2;
    fg.MergeCells = 5;
    fg.MergeRow(0) = true;
    fg.MergeCol(1) = true;
    fg.Cell(0, 0, 1, 1, 1) = "Code";
    fg.MergeCol(2) = true;
    fg.Cell(0, 0, 2, 1, 2) = "Account Name";
    fg.MergeCol(3) = true;
    fg.Cell(0, 0, 3, 1, 3) = "Account Name (Local)";
    fg.MergeCol(4) = true;
    fg.Cell(0, 0, 4, 1, 4) = "Account Name (Kor)";

    fg.Cell(0, 0, g_pl_cd, 0, g_pl_nm) = "Profit & Loss";
    fg.Cell(0, 0, g_dr_op, 0, g_cr_op) = "Beginning";
    fg.Cell(0, 0, g_dr_ps, 0, g_cr_ps) = "Period";
    fg.Cell(0, 0, g_dr_acc, 0, g_cr_acc) = "Cumulative(Book)";
    fg.Cell(0, 0, g_dr_bl, 0, g_cr_bl) = "Ending";

    fg.Cell(0, 1, g_pl_cd, 1, g_pl_cd) = "Code";
    fg.Cell(0, 1, g_pl_nm, 1, g_pl_nm) = "Name";
    fg.Cell(0, 1, g_dr_op, 1) = "Debit";
    fg.Cell(0, 1, g_cr_op, 1) = "Credit";
    fg.Cell(0, 1, g_dr_ps, 1) = "Debit";
    fg.Cell(0, 1, g_cr_ps, 1) = "Credit";
    fg.Cell(0, 1, g_dr_acc, 1) = "Debit";
    fg.Cell(0, 1, g_cr_acc, 1) = "Credit";
    fg.Cell(0, 1, g_dr_bl, 1) = "Debit";
    fg.Cell(0, 1, g_cr_bl, 1) = "Credit";
    
    fg.Cell(0, 0, g_begin_amount, 0, g_end_amount) = "Inventory";
    fg.Cell(0, 1, g_begin_amount, 1) = "Begin";
    fg.Cell(0, 1, g_in_amount, 1) = "In";
    fg.Cell(0, 1, g_out_amount, 1) = "Out";
    fg.Cell(0, 1, g_end_amount, 1) = "End";

    fg.Cell(0, 0, g_begin_gap, 0, g_end_gap) = "GAP";
    fg.Cell(0, 1, g_begin_gap, 1) = "Begin";
    fg.Cell(0, 1, g_in_gap, 1) = "In";
    fg.Cell(0, 1, g_out_gap, 1) = "Out";
    fg.Cell(0, 1, g_end_gap, 1) = "End";
}

function onReport() {
}

function onSetColor() {
    var ctrl = idGrid.GetGridControl();
    for (i = 1; i < ctrl.Rows; i++) {

        if (idGrid.GetGridData(i, g_bold_yn) === "B") {
            ctrl.Cell(14, i, 1, i, ctrl.cols - 1) = false;
            idGrid.SetCellBold(i, 1, i, g_bold_yn, true);
        } else if (idGrid.GetGridData(i, 21) === "I") {
            idGrid.SetCellBold(i, 1, i, 20, false);
            ctrl.Cell(14, i, 1, i, 20) = true; // Chu nghieng
        } else {
            ctrl.Cell(14, i, 1, i, 20) = false;
            idGrid.SetCellBold(i, 1, i, 22, false);
        }

        //idGrid.SetCellBgColor(i, g_begin_amount, i, g_end_amount, Number(0XFF0000));

        for (var j = g_begin_gap; j <= g_end_gap; j++) {
            if (Number(idGrid.GetGridData(i, j)) < 0) {
                idGrid.SetCellFontColor(i, j, i, j, Number(0X0000FF));
            }
        }
    }
    MergeHeader();
}


function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise
}

function onEnter()
{
    dso_pro_acc.Call();
}

function OnChangeList()
{
    dso_pro_acc.Call();
}

function OnChangeCurrent()
{
    dso_get_rate.Call();
}

function Reset_Acc()
{
    txtac_cd.text = "";
    txtac_nm.text = "";
    txtac_pk.text = "";
}

function Reset_PL() {
    txtpl_pk.SetDataText("");
    txtpl_cd.SetDataText("");
    txtpl_nm.SetDataText("");
}

function Popup_Acc()
{
    var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_acct_popup";
    o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes');	
    if (o != null)
	{
		if(o[0] != 0)
		{
		    txtac_cd.SetDataText(o[0]);
			txtac_nm.SetDataText(o[1]);
			txtac_pk.SetDataText(o[3]);
		}
    }
}
function Popup_PL() {
    var fpath = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code=" + "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
    var object = System.OpenModal(fpath, 600, 500, 'resizable:yes;status:yes');
    if (object != null) {
        if (object[0] != 0) {
            txtpl_pk.SetDataText(object[2]); // PK
            txtpl_cd.SetDataText(object[0]); // Item Code
            txtpl_nm.SetDataText(object[1]); // Item Name Local
        }
    }
}
function OnPopupDailySL() {
    
    var ctrl = idGrid.GetGridControl();
    var rows = ctrl.Rows
    rows = rows - 1;
    var rownum = ctrl.Row;
    var colnum = ctrl.Col;
    if (rownum > 1 && colnum <= g_cr_bl) {
        if (event.col > 1) {
            var ac_pk = idGrid.GetGridData(ctrl.row, g_pk);
            var ac_nm = idGrid.GetGridData(ctrl.row, g_ac_nm);
            var fpath = System.RootURL + '/standard/forms/60/08/60080050_p1.aspx?ac_pk=' + ac_pk + '&ac_nm=' + ac_nm + '&compk=' + lstCompany.GetData() + '&status=' + lstStatus.GetData() + '&lang=' + lstLang.GetData() + '&cur=ALL' + '&date_fr=' + dtFrom.GetData() + '&date_to=' + dtTo.GetData() + '&type_month=';
            fpath = fpath + '&ac_cd=' + idGrid.GetGridData(ctrl.row, g_ac_cd) + '&ad_nm1=' + idGrid.GetGridData(ctrl.row, g_ac_nm);
            var wWidth = 950;
            var wHeight = 500;
            var x = Math.round((screen.availWidth - wWidth) / 2);
            var y = Math.round((screen.availHeight - wHeight) / 2);
            var features = "";
            var object = System.OpenModal(fpath, wWidth, wHeight, features);
        }
    }
}

function onGroupByChange() {
    if (window.lstGroupByPL.value === "0")
    {
        idGrid.GetGridControl().ColHidden(g_pl_cd) = true;
        idGrid.GetGridControl().ColHidden(g_pl_nm) = true;
    }
    else
    {
        idGrid.GetGridControl().ColHidden(g_pl_cd) = false;
        idGrid.GetGridControl().ColHidden(g_pl_nm) = false;
    }
}

function OnChangeRadio()
{
    onSearch();
}
function OnChangeMonth()
{
    var yyyymm = window.dtMonth.GetData();
    var yyyy = yyyymm.substr(0,4);
    var mm = yyyymm.substr(4,2);
    window.dtFrom.SetDataText(yyyy+mm+"01");
    window.dtTo.SetDataText(yyyy+mm+LastDayOfMonth(yyyymm));
}

function LastDayOfMonth(p_yyyymm) {
    mm = p_yyyymm.substr(4, 2);
    yyyy = p_yyyymm.substr(0, 4);
    mm = parseInt(mm, 10);
    switch (mm) {
    case 1:
    case 3:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
        return 31;
    case 4:
    case 6:
    case 9:
    case 11:
        return 30;
    default:
        if ((yyyy % 4 == 0) && (yyyy % 100 > 0)) {
            return 29;
        } else {
            return 28;
        }
    } //invalid month
}

</script>
<body style="margin:0; padding:0;">
	<!------------------------------------------------------------------------>
 <gw:data id="dso_getCompany" onreceive=""> 
        <xml> 
            <dso type="list" procedure="ac_sel_60010020_1" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------------>
    <gw:data id="dso_sel_trial_balance" onreceive="onSetColor()">
        <xml>
            <dso type="grid" function="ac_sel_60170510" >
                    <input bind="idGrid">
                    <input bind="lstCompany"/>
                    <input bind="dtFrom"/>
					<input bind="dtTo"/>
                    <input bind="lstStatus"/>
                    <input bind="lstLevel"/>
                    <input bind="lstPostSum"/>
                    <input bind="txtac_cd"/>
                    <input bind="lstAccType"/>
                    <input bind="lstGroupByPL"/>
                </input>
                <output bind="idGrid"/>
            </dso>
        </xml>
    </gw:data>

    <gw:data id="dso_pro_acc" onreceive="onSearch()">
        <xml> 
            <dso type="process" procedure="ac_sel_account" > 
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="txtac_cd"/>
                     <input bind="lstLang"/>
                </input>
                <output>
                     <output bind="txtac_pk"/>
                     <output bind="txt_temp"/>
                     <output bind="txtac_nm"/>
               </output>
            </dso> 
        </xml> 
    </gw:data>
    
<table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
<tr style='height:6%'>
    <td width="100%">
        <fieldset style='padding:0'>
        <table width="100%" cellpadding="1" cellspacing="1" border="0">
        <tr>
            <td width="5%"></td>
	        <td width="5%"></td>
	        <td width="5%"></td>
	        <td width="5%"></td>
	        <td width="5%"></td> 
	        <td width="5%"></td>

	        <td width="5%"></td>
	        <td width="5%"></td>
	        <td width="5%"></td>
	        <td width="5%"></td>
	        <td width="5%"></td>
	        <td width="5%"></td>
	        <td width="5%"></td>

	        <td width="5%"></td>
	        <td width="5%"></td> 
	        <td width="5%"></td>
	        <td width="5%"></td>
	        <td width="5%"></td>
	        <td width="8%"></td>
	        <td width="2%"></td>
	    </tr>
	    <tr>
	        <td align="left">&nbsp;&nbsp;Company&nbsp;</td>
            <td colspan="2"><gw:list id="lstCompany" onChange ="onSearch()" styles='width:100%'></gw:list></td>
            <td colspan="2"></td>
            <td align="left"><a title="Click here to select Ex.Rate" onclick="Popup_Acc()" href="#tips" style="text-decoration: none; color=#0000ff"><b>&nbsp;&nbsp;Acc.Code&nbsp;</b></a></td>
	        <td colspan="7">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="28%"><gw:textbox id="txtac_cd" styles='width:100%' onkeypress="CheckNumeric()" onenterkey="onEnter()"/></td>
                    <td width=" 2%"></td>
                    <td width="65%"><gw:textbox id="txtac_nm" styles='width:100%'/></td>
                    <td width="0%"><gw:textbox  id="txtac_pk" styles='display:none'/></td>
                    <td width="5%"><gw:imgBtn   img="reset"	id="idResetAcc"  alt="Reset" onclick="Reset_Acc()"/></td>
                </tr>
                </table>
	        </td>
            <td colspan="2"><gw:list id="lstGroupByPL" onchange="onGroupByChange()"><data>DATA|0|Group by Acount|1|Group by Account & PL</data></gw:list></td>
            <td colspan="5"></td>
	    </tr>
	     <tr>
	        <td align="left">&nbsp;&nbsp;Month&nbsp;</td>
            <td colspan="4" align="center">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td><gw:label id="lblRecord"   text=""/></td>
                    <td><gw:datebox id="dtMonth" type="month" onchange="OnChangeMonth();"/></td>
                    <td><gw:datebox id="dtFrom" lang="1" /></td>
					<td>~</td>
					<td><gw:datebox id="dtTo" lang="1" /></td>
                    <td><gw:label id="lblRecord1"  text=""/></td>
                </tr>
                </table>
            </td>
             <td align="left"><a title="Click here to select Profit & Loss(PL)" onclick="Popup_PL()" href="#tips" style="text-decoration: none; color:#0000ff"><b>&nbsp;&nbsp;PL</b></td>
             <td colspan="7">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td width="28%"><gw:textbox id="txtpl_cd" styles='width:100%'/></td>
                    <td width=" 2%"></td>
                    <td width="65%"><gw:textbox id="txtpl_nm" styles='width:100%'/></td>
                    <td width=""><gw:textbox  id="txtpl_pk" styles='display:none'/></td>
                    <td width=" 5%"><gw:imgBtn   img="reset"	id="idResetPL"  alt="Reset" onclick="Reset_PL()"/></td>
                </tr>
                </table>
            </td>
             <td colspan="5"></td>
            <td align="right"><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"        onclick="onSearch()"/></td>
            <td align="left"><gw:imgBtn id="ibtnReport" img="printer"   alt="Print"  onclick="onReport()"/></td>
	    </tr>
	     <tr>
	        
            
	    </tr>
	    </table>
        </fieldset>
	</td>
</tr>
<tr style='height:94%'>
	<td width="100%">
	    <table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
        <tr style='height:75%'>
            <td>
                <gw:grid   
				    id="idGrid"  
                    header="_PK|AC_CD|AC_NM|LOCAL_NM|KOR_NM|_TAC_ABPL_PK|PL_CD|PL_NM|DR_OP|_CR_OP|DR_PS|CR_PS|_DR_ACC|_CR_ACC|DR_BL|_CR_BL|_BOLD_YN|_COLOR|_AC_LEVEL|BEGIN_AMOUNT|IN_AMOUNT|OUT_AMOUNT|END_AMOUNT|BEGIN_GAP|IN_GAP|OUT_GAP|END_GAP"
				    format="0|0|0|0|0|0|0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0"  
 			        aligns="1|2|2|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3"
				    widths="400|0|3000|3000|3000|3000|1200|3000|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800"  
				    styles="width:100%; height:100%"
				    sorting="T"
				    oncelldblclick="OnPopupDailySL()"
				    /> 
            </td>
        </tr>
        </table>
	</td>
</tr>
</table>
<gw:list id="lstLevel" onChange="OnChangeList()"  styles="display:none"/>
<gw:list id="lstLang" onChange="OnChangeList()" styles="display:none"/>
<gw:list id="lstStatus" onchange="onSearch()"styles="display:none"/> 
<gw:list id="lstPostSum" onChange="OnChangeList()" styles="display:none"/>
<gw:list id="lstAccType" onChange ="onSearch()"  styles='width:100%;display:none'></gw:list>
<gw:textbox id="txt_temp"       styles='display:none'/>
<gw:textbox id="txt_row"        styles='display:none'/>
<gw:textbox id="txt_date"       styles='display:none'/>
<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>

</body>
</html>

