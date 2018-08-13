<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 
function BodyInit()
{
    System.Translate(document);
    var ls_company = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_type    = "DATA|G|General Ledger";
    var ls_lang    = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('HRAB0180','02','') FROM DUAL")%>";
    var ls_current = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
    var ls_date     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
    var ls_month    = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(ADD_MONTHS(SYSDATE,-1), 'YYYYMM') FROM DUAL")%>";
    txt_date.SetDataText(ls_date);
    txtrate1.SetDataText('1');
    dtfrmonth.SetDataText(ls_month);
    lstCompany.SetDataText(ls_company);
    ls_type= "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE1('ACBG0020','','') FROM DUAL")%>||";
    lstFinancial.SetDataText(ls_type);
    lstLang.SetDataText(ls_lang);
    lstCurrent.SetDataText(ls_current);
    var data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
    arr  = data.split("|");
    txt_bccy.SetDataText(arr[1]);
	MergeHeader();
    MergeHeaderSum();
    txtrate.SetDataText("1");
    txtrate.SetEnable(false);
    idGrid.GetGridControl().FrozenCols = 3;
    idGrid_sum.GetGridControl().FrozenCols = 1;
    Formatgrid();
}
//------------------------------------------------------------------------------------
function Formatgrid()
{
 
    var fg = idGrid.GetGridControl();
    var fg1 = idGrid_sum.GetGridControl();
   
    if (txt_bccy.GetData()=="VND")
    {
        fg1.ColFormat(1) = "#,###,###,###,###,###,###R"; 
        fg1.ColFormat(2) = "#,###,###,###,###,###,###R"; 
        fg1.ColFormat(3) = "#,###,###,###,###,###,###R"; 
        fg1.ColFormat(4) = "#,###,###,###,###,###,###R"; 
        fg1.ColFormat(5) = "#,###,###,###,###,###,###R"; 
        fg1.ColFormat(6) = "#,###,###,###,###,###,###R"; 
        fg1.ColFormat(7) = "#,###,###,###,###,###,###R"; 
        fg1.ColFormat(8) = "#,###,###,###,###,###,###R"; 
       
        
        fg.ColFormat(3) = "#,###,###,###,###,###,###R"; 
        fg.ColFormat(4) = "#,###,###,###,###,###,###R"; 
        fg.ColFormat(5) = "#,###,###,###,###,###,###R"; 
        fg.ColFormat(6) = "#,###,###,###,###,###,###R"; 
        fg.ColFormat(7) = "#,###,###,###,###,###,###R"; 
        fg.ColFormat(8) = "#,###,###,###,###,###,###R"; 
        fg.ColFormat(9) = "#,###,###,###,###,###,###R"; 
        fg.ColFormat(10) = "#,###,###,###,###,###,###R"; 
    }
    else
    {
        fg.ColFormat(3) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(4) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(5) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(6) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(7) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(8) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(9) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(10) = "#,###,###,###,###,###,###.##R"; 
        
        fg1.ColFormat(1) = "#,###,###,###,###,###,###.##R"; 
        fg1.ColFormat(2) = "#,###,###,###,###,###,###.##R"; 
        fg1.ColFormat(3) = "#,###,###,###,###,###,###.##R"; 
        fg1.ColFormat(4) = "#,###,###,###,###,###,###.##R"; 
        fg1.ColFormat(5) = "#,###,###,###,###,###,###.##R"; 
        fg1.ColFormat(6) = "#,###,###,###,###,###,###.##R"; 
        fg1.ColFormat(7) = "#,###,###,###,###,###,###.##R"; 
        fg1.ColFormat(8) = "#,###,###,###,###,###,###.##R"; 
    }
        
}
//------------------------------------------------------------------------------------
function onCheckMonth()
{
    if (rdoType.GetData() == 2)
    {        
        if (Number(dttomonth.GetData()) < Number(dtfrmonth.GetData()))
        {
            alert("From Month does not greater than To Month. Please choose again!!!"+'\n'+"");
            return false;
        }
    }
    return true
}

function onSearch()
{
    if(rdoType.GetData() == 1)
    {
        dtfrmonth.style.display = 'none';
        lblRecord.style.width="60"
        lblRecord1.style.width="66"
        idGrid.GetGridControl().ColHidden(9)  = true;
		idGrid.GetGridControl().ColHidden(10) = true;
		idGrid_sum.GetGridControl().ColHidden(7) = true;
		idGrid_sum.GetGridControl().ColHidden(8) = true;
		txt_check.text = 2;
    }
    else
    {
        dtfrmonth.style.display = '';
        lblRecord.style.width   ="0%"
        lblRecord1.style.width  ="0%"
        idGrid.GetGridControl().ColHidden(9)  = false;
		idGrid.GetGridControl().ColHidden(10) = false;
		idGrid_sum.GetGridControl().ColHidden(7) = false;
		idGrid_sum.GetGridControl().ColHidden(8) = false;
		txt_check.text = 0;
    }
    if (!onCheckMonth()) return;
   // txtac_cd.GetControl().focus(); 
    idGrid.ClearData();
    idGrid_sum.ClearData();
    /*if (txtac_cd.GetData() == '')
    {
        txtac_nm.SetDataText("");
    }
    */
    MergeHeader();
    MergeHeaderSum();
    dso_sel_trial_balance_monthly.Call('SELECT');
    /*if(rdoType.GetData() == 1)
    {
		dso_sel_trial_balance_monthly.Call('SELECT');
    }
    else
    {
        dso_sel_trial_balance.Call('SELECT');
    }*/
}

function MergeHeader()
{
	if (idGrid.rows < 2)
	{
	    idGrid.AddRow();
	}
	if(rdoType.GetData() == 1) //monthly
	{
		var fg=idGrid.GetGridControl();
		fg.FixedRows = 2
		fg.MergeCells = 5
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 3, 0, 4) = "Beginning Balance"  
		fg.Cell(0, 0, 5, 0, 6) = "Period Balance" 
		fg.Cell(0, 0, 7, 0, 8) = "Ending Balance"
		
		fg.Cell(0, 1, 3, 1) 	= "Debit"
		fg.Cell(0, 1, 4, 1 ) 	= "Credit"
		fg.Cell(0, 1, 5, 1) 	= "Debit"
		fg.Cell(0, 1, 6, 1 ) 	= "Credit"
		fg.Cell(0, 1, 7, 1) 	= "Debit"
		fg.Cell(0, 1, 8, 1 ) 	= "Credit"
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Ctrl"
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Account Name"
		
		idGrid.GetGridControl().ColHidden(9) = true;
		idGrid.GetGridControl().ColHidden(10) = true;
	}
	else if(rdoType.GetData() == 2) //period
	{
		var fg=idGrid.GetGridControl();
		fg.FixedRows    = 2
		fg.MergeCells   = 5
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 3, 0, 4)  = "Beginning Balance"  
		fg.Cell(0, 0, 5, 0, 6)  = "Period Balance" 
		fg.Cell(0, 0, 7, 0, 8)  = "Cumulative"
		fg.Cell(0, 0, 9, 0, 10) = "Ending Balance"
		
		fg.Cell(0, 1, 3, 1) 	= "Debit"
		fg.Cell(0, 1, 4, 1 ) 	= "Credit"
		fg.Cell(0, 1, 5, 1) 	= "Debit"
		fg.Cell(0, 1, 6, 1 ) 	= "Credit"
		fg.Cell(0, 1, 7, 1) 	= "Debit"
		fg.Cell(0, 1, 8, 1 ) 	= "Credit"
		fg.Cell(0, 1, 9, 1) 	= "Debit"
		fg.Cell(0, 1, 10, 1 ) 	= "Credit"
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Ctrl"
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Account Name"
		idGrid.GetGridControl().ColHidden(9) = false;
		idGrid.GetGridControl().ColHidden(10) = false;
	}
}

function MergeHeaderSum()
{
	if (idGrid_sum.rows < 2)
	{
	    idGrid_sum.AddRow();
	}
	if(rdoType.GetData() == 1) //monthly
	{
		var fg=idGrid_sum.GetGridControl();
		fg.FixedRows = 2
		fg.MergeCells = 4
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 1, 0, 2) = "Beginning Balance"  
		fg.Cell(0, 0, 3, 0, 4) = "Period Balance" 
		fg.Cell(0, 0, 5, 0, 6) = "Ending Balance"
		
		fg.Cell(0, 1, 1, 1) 	= "Debit"
		fg.Cell(0, 1, 2, 1 ) 	= "Credit"
		fg.Cell(0, 1, 3, 1) 	= "Debit"
		fg.Cell(0, 1, 4, 1 ) 	= "Credit"
		fg.Cell(0, 1, 5, 1) 	= "Debit"
		fg.Cell(0, 1, 6, 1 ) 	= "Credit"
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "TOTAL"
		
		idGrid_sum.GetGridControl().ColHidden(7) = true;
		idGrid_sum.GetGridControl().ColHidden(8) = true;
	}
	else if(rdoType.GetData() == 2) //period
	{
		var fg=idGrid_sum.GetGridControl();
		fg.FixedRows  = 2
		fg.MergeCells = 4
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 1, 0, 2) = "Beginning Balance"  
		fg.Cell(0, 0, 3, 0, 4) = "Period Balance" 
		fg.Cell(0, 0, 5, 0, 6) = "Cumulative"
		fg.Cell(0, 0, 7, 0, 8) = "Ending Balance"
		
		fg.Cell(0, 1, 1, 1) 	= "Debit"
		fg.Cell(0, 1, 2, 1 ) 	= "Credit"
		fg.Cell(0, 1, 3, 1) 	= "Debit"
		fg.Cell(0, 1, 4, 1 ) 	= "Credit"
		fg.Cell(0, 1, 5, 1) 	= "Debit"
		fg.Cell(0, 1, 6, 1 ) 	= "Credit"
		fg.Cell(0, 1, 7, 1) 	= "Debit"
		fg.Cell(0, 1, 8, 1 ) 	= "Credit"
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0)  = "TOTAL"
		
		idGrid_sum.GetGridControl().ColHidden(7) = false;
		idGrid_sum.GetGridControl().ColHidden(8) = false;
	}	
}

function onReport()
{
     if(rdoType.value == 2)
        { 
            var url = '/standard/reports/gf/ff/gfff00010_TrialBalance_IFRS.aspx?p_compk='+ lstCompany.value + '&p_kind=' + lstFinancial.value;
	        url =   url + '&p_lang=' + lstLang.value + '&p_date_fr='+ dtfrmonth.value + '&p_date_to=' + dttomonth.value + '&p_status=';
	        url =   url + rbstatus.value + '&p_current=' + lstCurrent.value + '&p_rate=' + txtrate1.text + '&p_check=' + txt_check.text;
	        System.OpenTargetPage( System.RootURL+url , "newform" );
	    } else
	    {
	        var url = '/standard/reports/gf/ff/gfff00010_TrialBalance_IFRS_M.aspx?p_compk='+ lstCompany.value + '&p_kind=' + lstFinancial.value;
	        url =   url + '&p_lang=' + lstLang.value + '&p_date_fr='+ dtfrmonth.value + '&p_date_to=' + dttomonth.value + '&p_status=';
	        url =   url + rbstatus.value + '&p_current=' + lstCurrent.value + '&p_rate=' + txtrate1.text + '&p_check=' + txt_check.text;
	        System.OpenTargetPage( System.RootURL+url , "newform" );
	    }   
}

function onSetColor()
{
    var ctrl = idGrid.GetGridControl();
    for (i = 1; i < ctrl.Rows; i++)
	{
	    if(idGrid.GetGridData(i,11)== "B")
        {
	        ctrl.Cell(14, i, 1, i, 12) = false;
	        idGrid.SetCellBold(i, 1, i, 12, true);
        }
        else if (idGrid.GetGridData(i,11)== "I")
        {
	        idGrid.SetCellBold(i, 1, i, 12, false);
	        ctrl.Cell(14, i, 1, i, 12) = true; // Chu nghieng
	    }
	    else
	    {
	        ctrl.Cell(14, i, 1, i, 12) = false;
	        idGrid.SetCellBold(i, 1, i, 12, false);
	    }
	    idGrid.SetCellBgColor(i, 0, i, 12, Number(idGrid.GetGridData(i, 12)));
	}
	MergeHeader();
	if(rdoType.GetData() == 1)
    {
	    txt_check.text = 3;
	    dso_sel_trial_balance_monthly_sum.Call('SELECT');
	}
	else
	{
	    txt_check.text = 1;
	    dso_sel_trial_balance_sum.Call('SELECT');
	}
}

function onMergeSum()
{
    MergeHeaderSum();
    idGrid_sum.SetGridText(2, 0, '');   
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
   /// dso_pro_acc.Call();
}

function OnChangeList()
{
  //  dso_pro_acc.Call();
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

function Popup_Acc()
{
    var fpath = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=SP_SEL_ACCT_POPUP";
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

function Popup_Cur()
{
    var fpath = System.RootURL + "/standard/forms/ag/ga/agga00010.aspx";
    o = System.OpenModal( fpath , 950 , 550 , 'resizable:yes;status:yes');
    if (o != null)
	{
		if(o[0] != 0)
		{
		}
    }
}

function OnPopupDailySL()
{
  /*  var ctrl 	= idGrid.GetGridControl();
	var rows    = ctrl.Rows
	rows = rows - 1;
	var rownum  	= ctrl.Row;
	var colnum  	= ctrl.Col;
	if (rownum > 1)		 
	{
		if (event.col > 1)
		{
			var ac_pk   = idGrid.GetGridData(ctrl.row, 1);
			var ac_nm   = idGrid.GetGridData(ctrl.row, 2);
			var fpath   = System.RootURL + '/standard/forms/gf/ka/gfka00100_popup.aspx?ac_pk='+ ac_pk + '&ac_nm=' + ac_nm + '&compk=' + lstCompany.GetData() + '&status=' + rbstatus.GetData() + '&lang='+ lstLang.GetData() + '&cur=' + lstCurrent.GetData() + '&date_fr=' + dtfrmonth.GetData() + '&date_to=' + dttomonth.GetData() + '&type_month=' + rdoType.GetData();
			    fpath = fpath + '&ac_cd=' + idGrid.GetGridData(ctrl.row, 13) + '&ad_nm1=' + idGrid.GetGridData(ctrl.row, 14) ;
			var wWidth  = 950;
			var wHeight = 500;
			var x = Math.round((screen.availWidth - wWidth)/2);
			var y = Math.round((screen.availHeight - wHeight)/2);
			
			var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
			   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
			   "lef="+ x +",top=" + y;
			
			var object = System.OpenModal(fpath, wWidth, wHeight, features);
	    }
    }*/
}

function OnChangeRadio()
{
    onSearch();
}

</script>
<body style="margin:0; padding:0;">

    <gw:data id="dso_sel_trial_balance" onreceive="onSetColor()">
        <xml>
            <dso type="grid" function="SP_SEL_gfff00010_1" >
                <input bind="idGrid">
                    <input bind="lstCompany"/>
                    <input bind="lstFinancial"/>
                    <input bind="lstLang"/>
                    <input bind="dtfrmonth"/>
                    <input bind="dttomonth"/>
                    <input bind="rbstatus"/>
                    <input bind="lstCurrent"/>
                    <input bind="txtrate1"/>
                    <input bind="txt_check"/>
                </input>
               <output bind="idGrid"/>
            </dso>
        </xml>
    </gw:data>

    <gw:data id="dso_sel_trial_balance_sum" onreceive="onMergeSum()">
        <xml>
            <dso type="grid" function="SP_SEL_gfff00010_1" >
                <input bind="idGrid_sum">
                    <input bind="lstCompany"/>
                    <input bind="lstFinancial"/>
                    <input bind="lstLang"/>
                    <input bind="dtfrmonth"/>
                    <input bind="dttomonth"/>
                    <input bind="rbstatus"/>
                    <input bind="lstCurrent"/>
                    <input bind="txtrate1"/>
                    <input bind="txt_check"/>
                </input>
                <output bind="idGrid_sum"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_sel_trial_balance_monthly" onreceive="onSetColor()">
        <xml>
            <dso type="grid" function="SP_SEL_gfff00010_1" >
                <input bind="idGrid">
                    <input bind="lstCompany"/>
                    <input bind="lstFinancial"/>
                    <input bind="lstLang"/>
                    <input bind="dtfrmonth"/>
                    <input bind="dttomonth"/>
                    <input bind="rbstatus"/>
                    <input bind="lstCurrent"/>
                    <input bind="txtrate1"/>
                    <input bind="txt_check"/>
                </input>
                <output bind="idGrid"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_sel_trial_balance_monthly_sum" onreceive="onMergeSum()">
        <xml>
            <dso type="grid" function="SP_SEL_gfff00010_1" >
                <input bind="idGrid_sum">
                    <input bind="lstCompany"/>
                    <input bind="lstFinancial"/>
                    <input bind="lstLang"/>
                    <input bind="dtfrmonth"/>
                    <input bind="dttomonth"/>
                    <input bind="rbstatus"/>
                    <input bind="lstCurrent"/>
                    <input bind="txtrate1"/>
                    <input bind="txt_check"/>
                </input>
                <output bind="idGrid_sum"/>
            </dso>
        </xml>
    </gw:data>
    
    <!--gw:data id="dso_pro_acc" onreceive="onSearch()">
        <xml> 
            <dso type="process" procedure="SP_PRO_SEL_ACCOUNT" > 
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
    </gw:data-->
    
    <gw:data id="dso_get_rate" onreceive="onSearch()">
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
    
<table width="100%" cellpadding="0" cellspacing="0" border="1">
<tr>
    <td width="100%">
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
	        <td width="8%"></td>
	        <td width="10%"></td>
	        <td width="14%"></td>
	        <td width="20%"></td>
	        <td width="8%"></td> 
	        <td width="8%"></td>
	        <td width="8%"></td>
	        <td width="11%"></td>
	        <td width="11%"></td>
	    </tr>
	    <tr>
	        <td align="right">Company&nbsp;</td>
            <td><gw:list id="lstCompany" onChange="OnChangeList()"  styles='width:100%'></gw:list></td>
            <td align="right">Financial Statement</td>
            <td><gw:list id="lstFinancial" onChange="OnChangeList()" /></td>
            <td align="right">Language&nbsp;</td>
            <td><gw:list id="lstLang" onChange="OnChangeList()" /></td>
            <td align="right">Balance</td>
            <td colspan="2"><gw:radio id="rdoType" value="2" onchange="OnChangeRadio()"> 
					<span value="1" ><font color="black" >Monthly</font></span>
					<span value="2" ><font color="black" >Period</font></span>
				</gw:radio >
			</td>
			 <td colspan="3" align="right">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="90%"></td>
                    <td ><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"        onclick="onSearch()"/></td>
                    <td ><gw:imgBtn id="ibtnReport" img="printer"   alt="Print"         onclick="onReport()"/></td>
                </tr>
                </table>
	        </td>
	    </tr>
	    <tr>
	        <td align="right">Month</td>
            <td align="center">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td><gw:label id="lblRecord"   text=""/></td>
                    <td><gw:datebox id="dtfrmonth" type="month" /></td>
                    <td><gw:datebox id="dttomonth" type="month" /></td>
                    <td><gw:label id="lblRecord1"  text=""/></td>
                </tr>
                </table>
            </td>
            <td colspan ="2">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="10%" align="right">Status</td>
                    <td width="90%" align="center"><gw:radio id="rbstatus" value="2" onchange="onSearch()"> 
					        <span value="2">Confirmed</span>
					        <span value="0">Approved</span>
					        </gw:radio>
                    </td>
                </tr>
                </table>
            </td>
            
            <td align="right">Current</td>
            <td><gw:list id="lstCurrent" onChange="OnChangeCurrent()"  styles='width:100%'></gw:list></td>
            <td align="right">Ex. Rate</td>
            <td colspan="2">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="40%"> <gw:textbox id="txtrate"  styles='width:100%' type="number" format="###,###.##R" /> </td>
                    <td align="center">&nbsp;:&nbsp;</td>
                    <td width="40%"> <gw:textbox id="txtrate1" styles='width:100%' type="number" format="###,###.##R" onenterkey="onSearch()"/> </td>
                    <td ><gw:imgBtn   img="popup"	id="idSearch" alt="Popup" onclick="Popup_Cur()"/></td> 
                </tr>
                </table>
            </td>
	    </tr>
	    <!--tr>
	        <td align="right">Level&nbsp;</td>
	        <td align="center">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="45%"><gw:list id="lstLevel" onChange="OnChangeList()"  /></td>
                    <td width="10%">Posting/Summary&nbsp;</td>
                    <td width="45%"><gw:list id="lstPostSum" onChange="OnChangeList()" /></td>
                </tr>
                </table>
	        </td>
	        <td align="right">Account Code&nbsp;</td>
	        <td colspan="3">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="30%"><gw:textbox id="txtac_cd" styles='width:100%' onkeypress="CheckNumeric()" onenterkey="onEnter()"/></td>
                    <td width="60%"><gw:textbox id="txtac_nm" styles='width:100%'/></td>
                    <td width="0%"><gw:textbox  id="txtac_pk" styles='display:none'/></td>
                    <td width="5%"><gw:imgBtn   img="popup"	id="idSearchAcc" alt="Popup" onclick="Popup_Acc()"/></td> 
                    <td width="5%"><gw:imgBtn   img="reset"	id="idResetAcc"  alt="Reset" onclick="Reset_Acc()"/></td>
                </tr>
                </table>
	        </td>
	        <td colspan="3" align="right">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="90%"></td>
                    <td ><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"        onclick="onSearch()"/></td>
                    <td ><gw:imgBtn id="ibtnReport" img="printer"   alt="Print"         onclick="onReport()"/></td>
                </tr>
                </table>
	        </td>
	    </tr-->
	    </table>
	</td>
</tr>
<tr>
	<td width="100%">
	    <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <!--0.Ctrl|1_PK|2.Account Name|3.Begin Bal(Debt)|4.Begin Bal(Cret)|5.Debit|6.Credit|7.cal bal(Debt)|8.cal bal(Cret)|9.Ending bal(Debt)|10.Ending bal(Cret)|11_B|12_COLOR-->
            <td>
                <gw:grid   
				    id="idGrid"  
				    header="_Ctrl|_PK|Account Name|Begin Bal(Debt)|Begin Bal(Cret)|Debit|Credit|cal bal(Debt)|cal bal(Cret)|Ending bal(Debt)|Ending bal(Cret)|_B|_COLOR"
				    format="3|0|0|1|0|0|0|0|0|0|0|0|0"  
 			        aligns="1|1|2|3|3|3|3|3|3|3|3|0|0"
				    defaults="||||||||||||"  
				    editcol="1|0|0|0|0|0|0|0|0|0|0|0|0"  
				    widths="400|0|3000|1800|1800|1800|1800|1800|1800|1800|0|0"  
				    styles="width:100%; height:340"
				    sorting="T"
				    oncelldblclick="OnPopupDailySL()"
				    /> 
            </td>
        </tr>
        <tr>
         <!--0.Total|1.Begin Bal(Debt)|2.Begin Bal(Cret)|3.Debit|4.Credit|5.cal bal(Debt)|6.cal bal(Cret)|7.Ending bal(Debt)|8.Ending bal(Cret)-->
            <td>
                <gw:grid   
				id="idGrid_sum"
				header="Total|Begin Bal(Debt)|Begin Bal(Cret)|Debit|Credit|cal bal(Debt)|cal bal(Cret)|Ending bal(Debt)|Ending bal(Cret)"   
				format="0|0|0|0|0|0|0|0|0"  
 			    aligns="1|3|3|3|3|3|3|3|3"
				defaults="|||||||||"
				editcol="0|0|0|0|0|0|0|0|0"
				widths="3400|1800|1800|1800|1800|1800|1800|1800|1800"  
				styles="width:100%; height:73"   
				sorting="F" /> 
            </td>
        </tr>
        </table>
	</td>
</tr>
</table>

<gw:textbox id="txt_check"      styles='display:'/>
<gw:textbox id="txt_temp"       styles='display:none'/>
<gw:textbox id="txt_row"        styles='display:none'/>
<gw:textbox id="txt_date"       styles='display:none'/>
<gw:textbox id="txt_bccy"       styles='display:none'/>
</body>
</html>

