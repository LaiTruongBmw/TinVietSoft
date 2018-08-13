<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>

<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 
function BodyInit()
{
    System.Translate(document);
    var ls_company = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_type    = "DATA|G|General Ledger";
    var ls_lang    = "<%=CtlLib.SetListDataFUNC("SELECT AC_A_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
    
    var ls_level   = "<%=CtlLib.SetListDataFUNC("SELECT AC_F_COMMONCODE('ACAB0020','','') FROM DUAL")%>||";
    var ls_possum  = "DATA|Y|Posting|N|Summary||";
    var ls_date     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
    var ls_month    = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(ADD_MONTHS(SYSDATE,-1), 'YYYYMM') FROM DUAL")%>";
    var dataAccType  =  "<%=CtlLib.SetListDataFUNC("SELECT AC_A_GET_COMMONCODE('EACBK020') FROM DUAL")%>";
	var dataAmountType  =  "<%=CtlLib.SetListDataSQL("select b.code, b.code_nm  from tac_commcode_master a, tac_commcode_detail b where a.pk = b.tac_commcode_master_pk and a.id = 'ACBG0198' and a.del_if = 0 and b.del_if = 0 and b.use_yn = 'Y' order by b.def_yn desc ")%>";
	
    lstAccType.SetDataText(dataAccType); 
	lstAmountType.SetDataText(dataAmountType); 
    var dataStatus = "Data|0|Approved|2|Confirmed"; 
    lstStatus.SetDataText(dataStatus); 
    lstStatus.SetDataText("2"); 
    txt_date.SetDataText(ls_date);
    lstCompany.SetDataText(ls_company);
   
    lstLang.SetDataText(ls_lang);
    lstLevel.SetDataText(ls_level);
    lstPostSum.SetDataText(ls_possum);
    MergeHeader();
    MergeHeaderSum();
    txtac_nm.SetEnable(false);
    lstLevel.SetDataText("");
    lstPostSum.SetDataText("");
    idGrid.GetGridControl().FrozenCols = 5;
    idGrid_sum.GetGridControl().FrozenCols = 1;
    txtac_cd.GetControl().focus();
    OnLang();
	OnChangeMonth();
	OnChangeAmountType();
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	dso_getCompany.Call();
        
}

function OnLang()
{
    if(lstLang.value == 'ENG')
    {
        idGrid.GetGridControl().ColHidden(2) = false;
        idGrid.GetGridControl().ColHidden(3) = true;
        idGrid.GetGridControl().ColHidden(4) = true;
    }
    else if(lstLang.value == 'VIE')
    {
        idGrid.GetGridControl().ColHidden(2) = true;
        idGrid.GetGridControl().ColHidden(3) = false;
        idGrid.GetGridControl().ColHidden(4) = true;
    }
    else if(lstLang.value == 'KOR')
    {
        idGrid.GetGridControl().ColHidden(2) = true;
        idGrid.GetGridControl().ColHidden(3) = true;
        idGrid.GetGridControl().ColHidden(4) = false;
    }
    else if(lstLang.value == 'ENG-KOR')
    {
        idGrid.GetGridControl().ColHidden(2) = false;
        idGrid.GetGridControl().ColHidden(3) = true;
        idGrid.GetGridControl().ColHidden(4) = false;
    }
    else if(lstLang.value == 'ENG-VIE')
    {
        idGrid.GetGridControl().ColHidden(2) = false;
        idGrid.GetGridControl().ColHidden(3) = false;
        idGrid.GetGridControl().ColHidden(4) = true;
    }
    else if(lstLang.value == 'ENG-VIE-KOR')
    {
        idGrid.GetGridControl().ColHidden(2) = false;
        idGrid.GetGridControl().ColHidden(3) = false;
        idGrid.GetGridControl().ColHidden(4) = false;
    }
    else if(lstLang.value == 'KOR-VIE')
    {
        idGrid.GetGridControl().ColHidden(2) = true;
        idGrid.GetGridControl().ColHidden(3) = false;
        idGrid.GetGridControl().ColHidden(4) = false;
    }
}

function onSearch()
{

    OnLang();

    //if (!onCheckMonth()) return;
    txtac_cd.GetControl().focus(); 
    idGrid.ClearData();
    idGrid_sum.ClearData();
    if (txtac_cd.GetData() == '')
    {
        txtac_nm.SetDataText("");
    }
    
    MergeHeader();
    MergeHeaderSum();
    
   dso_sel_trial_balance.Call('SELECT');
   
    
}
function HideColBookSum()
	{
	    idGrid_sum.GetGridControl().ColHidden(1) = true;
		idGrid_sum.GetGridControl().ColHidden(2) = true;
	    idGrid_sum.GetGridControl().ColHidden(5) = true;
		idGrid_sum.GetGridControl().ColHidden(6) = true;
		
	    //idGrid_sum.GetGridControl().ColHidden(9) = true;
		//idGrid_sum.GetGridControl().ColHidden(10) = true;
		//idGrid_sum.GetGridControl().ColHidden(13) = true;
		//idGrid_sum.GetGridControl().ColHidden(14) = true;
	}
	function AppearColBookSum()
	{
	    idGrid_sum.GetGridControl().ColHidden(1) = false;
		idGrid_sum.GetGridControl().ColHidden(2) = false;
	    idGrid_sum.GetGridControl().ColHidden(5) = false;
		idGrid_sum.GetGridControl().ColHidden(6) = false;
		
	    //idGrid_sum.GetGridControl().ColHidden(9) = false;
		//idGrid_sum.GetGridControl().ColHidden(10) = false;
		//idGrid_sum.GetGridControl().ColHidden(13) = false;
		//idGrid_sum.GetGridControl().ColHidden(14) = false;
	}
	function HideColTransSum()
	{
	    idGrid_sum.GetGridControl().ColHidden(3) = true;
		idGrid_sum.GetGridControl().ColHidden(4) = true;
	    idGrid_sum.GetGridControl().ColHidden(7) = true;
		idGrid_sum.GetGridControl().ColHidden(8) = true;
		
	    //idGrid_sum.GetGridControl().ColHidden(11) = true;
		//idGrid_sum.GetGridControl().ColHidden(12) = true;
		//idGrid_sum.GetGridControl().ColHidden(15) = true;
		//idGrid_sum.GetGridControl().ColHidden(16) = true;
	}
	function AppearColTransSum()
	{
	    idGrid_sum.GetGridControl().ColHidden(3) = false;
		idGrid_sum.GetGridControl().ColHidden(4) = false;
	    idGrid_sum.GetGridControl().ColHidden(7) = false;
		idGrid_sum.GetGridControl().ColHidden(8) = false;
		
	    //idGrid_sum.GetGridControl().ColHidden(11) = false;
		//idGrid_sum.GetGridControl().ColHidden(12) = false;
		//idGrid_sum.GetGridControl().ColHidden(15) = false;
		//idGrid_sum.GetGridControl().ColHidden(16) = false;
	}
function MergeHeader()
{
	if (idGrid.rows < 2)
	{
	    idGrid.AddRow();
	}
	function HideColBook()
	{
		/*
	    idGrid.GetGridControl().ColHidden(5) = true;
		idGrid.GetGridControl().ColHidden(6) = true;
	    idGrid.GetGridControl().ColHidden(9) = true;
		idGrid.GetGridControl().ColHidden(10) = true;
		
	    idGrid.GetGridControl().ColHidden(13) = true;
		idGrid.GetGridControl().ColHidden(14) = true;
		idGrid.GetGridControl().ColHidden(17) = true;
		idGrid.GetGridControl().ColHidden(18) = true;
		*/
	}
	function AppearColBook()
	{
		/*
	    idGrid.GetGridControl().ColHidden(5) = false;
		idGrid.GetGridControl().ColHidden(6) = false;
	    idGrid.GetGridControl().ColHidden(9) = false;
		idGrid.GetGridControl().ColHidden(10) = false;
		
	    idGrid.GetGridControl().ColHidden(13) = false;
		idGrid.GetGridControl().ColHidden(14) = false;
		idGrid.GetGridControl().ColHidden(17) = false;
		idGrid.GetGridControl().ColHidden(18) = false;
		*/
	}
	function HideColTrans()
	{
	/*
	    idGrid.GetGridControl().ColHidden(7) = true;
		idGrid.GetGridControl().ColHidden(8) = true;
	    idGrid.GetGridControl().ColHidden(11) = true;
		idGrid.GetGridControl().ColHidden(12) = true;
		
	    idGrid.GetGridControl().ColHidden(15) = true;
		idGrid.GetGridControl().ColHidden(16) = true;
		idGrid.GetGridControl().ColHidden(19) = true;
		idGrid.GetGridControl().ColHidden(20) = true;
		*/
	}
	function AppearColTrans()
	{
		/*
	    idGrid.GetGridControl().ColHidden(7) = false;
		idGrid.GetGridControl().ColHidden(8) = false;
	    idGrid.GetGridControl().ColHidden(11) = false;
		idGrid.GetGridControl().ColHidden(12) = false;
		
	    idGrid.GetGridControl().ColHidden(15) = false;
		idGrid.GetGridControl().ColHidden(16) = false;
		idGrid.GetGridControl().ColHidden(19) = false;
		idGrid.GetGridControl().ColHidden(20) = false;
		*/
	}
	
	
		var fg=idGrid.GetGridControl();
		fg.FixedRows    = 2
		fg.MergeCells   = 5
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 5, 0, 6) = "Beginning Balance(Book)"
		fg.Cell(0, 1, 5, 1) 	= "Debit"
		fg.Cell(0, 1, 6, 1 ) 	= "Credit"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 7, 0, 8) = "Beginning Balance(USD)" 
		fg.Cell(0, 1, 7, 1) 	= "Debit"
		fg.Cell(0, 1, 8, 1 ) 	= "Credit"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 9, 0, 10)= "Beginning Balance(WON)" 
		fg.Cell(0, 1, 9, 1) 	= "Debit"
		fg.Cell(0, 1, 10, 1 ) 	= "Credit"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 11,0, 12) = "Period Balance(Book)" 
		fg.Cell(0, 1, 11, 1) 	= "Debit"
		fg.Cell(0, 1, 12, 1 ) 	= "Credit"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 13, 0, 14)  = "Period Balance(USD)"
		fg.Cell(0, 1, 13, 1) 	= "Debit"
		fg.Cell(0, 1, 14, 1 ) 	= "Credit"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 15, 0, 16)  = "Period Balance(WON)"
		fg.Cell(0, 1, 15, 1) 	= "Debit"
		fg.Cell(0, 1, 16, 1 ) 	= "Credit"
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 17, 0, 18) = "Cumulative(Book)"
		fg.Cell(0, 1, 17, 1) 	= "Debit"
		fg.Cell(0, 1, 18, 1 ) 	= "Credit"
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 19, 0, 20) = "Cumulative(USD)"
		fg.Cell(0, 1, 19, 1) 	= "Debit"
		fg.Cell(0, 1, 20, 1 ) 	= "Credit"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 21, 0, 22) = "Cumulative(WON)"		
		fg.Cell(0, 1, 21, 1 ) 	= "Debit"
		fg.Cell(0, 1, 22, 1) 	= "Credit"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 23, 0, 24) ="Ending Balance(Book)"
		fg.Cell(0, 1, 23, 1 ) 	= "Debit"
		fg.Cell(0, 1, 24, 1) 	= "Credit"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 25, 0, 26) ="Ending Balance(USD)"
		fg.Cell(0, 1, 25, 1 ) 	= "Debit"
		fg.Cell(0, 1, 26, 1) 	= "Credit"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 27, 0, 28) = "Ending Balance(WON)"
		fg.Cell(0, 1, 27, 1 ) 	= "Debit"
		fg.Cell(0, 1, 28, 1) 	= "Credit"
		
		
		
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Ctrl"
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Account Name"
        fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Account Name (Local)"
        fg.MergeCol(4) = true
		fg.Cell(0, 0, 4, 1, 4) = "Account Name (Kor)"
		HideColTrans();
		AppearColBook();
		idGrid.GetGridControl().ColHidden(13) = false;
		idGrid.GetGridControl().ColHidden(14) = false;
		//idGrid.GetGridControl().ColHidden(15) = true;
		//idGrid.GetGridControl().ColHidden(16) = true;
	
}

function OnChangeAmountType()
{
	if(lstAmountType.value == '01')//book
    {
        idGrid.GetGridControl().ColHidden(5) = false;
		idGrid.GetGridControl().ColHidden(6) = false;
		idGrid.GetGridControl().ColHidden(7) = true;
        idGrid.GetGridControl().ColHidden(8) = true;
        idGrid.GetGridControl().ColHidden(9) = true;
		idGrid.GetGridControl().ColHidden(10) = true;
		
		idGrid.GetGridControl().ColHidden(11) = false;
		idGrid.GetGridControl().ColHidden(12) = false;
        idGrid.GetGridControl().ColHidden(13) = true;
        idGrid.GetGridControl().ColHidden(14) = true;
		idGrid.GetGridControl().ColHidden(15) = true;
        idGrid.GetGridControl().ColHidden(16) = true;
		
		idGrid.GetGridControl().ColHidden(17) = false;
        idGrid.GetGridControl().ColHidden(18) = false;
		idGrid.GetGridControl().ColHidden(19) = true;
		idGrid.GetGridControl().ColHidden(20) = true;
        idGrid.GetGridControl().ColHidden(21) = true;
        idGrid.GetGridControl().ColHidden(22) = true;
		
		idGrid.GetGridControl().ColHidden(23) = false;
		idGrid.GetGridControl().ColHidden(24) = false;
		idGrid.GetGridControl().ColHidden(25) = true;
		idGrid.GetGridControl().ColHidden(26) = true;
        idGrid.GetGridControl().ColHidden(27) = true;
        idGrid.GetGridControl().ColHidden(28) = true;
		
		//============================================================================
		idGrid_sum.GetGridControl().ColHidden(1) = false;
		idGrid_sum.GetGridControl().ColHidden(2) = false;
		idGrid_sum.GetGridControl().ColHidden(3) = true;
        idGrid_sum.GetGridControl().ColHidden(4) = true;
        idGrid_sum.GetGridControl().ColHidden(5) = true;
		idGrid_sum.GetGridControl().ColHidden(6) = true;
		
		idGrid_sum.GetGridControl().ColHidden(7) = false;
		idGrid_sum.GetGridControl().ColHidden(8) = false;
        idGrid_sum.GetGridControl().ColHidden(9) = true;
        idGrid_sum.GetGridControl().ColHidden(10) = true;
		idGrid_sum.GetGridControl().ColHidden(11) = true;
        idGrid_sum.GetGridControl().ColHidden(12) = true;
		
		idGrid_sum.GetGridControl().ColHidden(13) = false;
        idGrid_sum.GetGridControl().ColHidden(14) = false;
		idGrid_sum.GetGridControl().ColHidden(15) = true;
		idGrid_sum.GetGridControl().ColHidden(16) = true;
        idGrid_sum.GetGridControl().ColHidden(17) = true;
        idGrid_sum.GetGridControl().ColHidden(18) = true;
		
		idGrid_sum.GetGridControl().ColHidden(19) = false;
		idGrid_sum.GetGridControl().ColHidden(20) = false;
		idGrid_sum.GetGridControl().ColHidden(21) = true;
		idGrid_sum.GetGridControl().ColHidden(22) = true;
        idGrid_sum.GetGridControl().ColHidden(23) = true;
        idGrid_sum.GetGridControl().ColHidden(24) = true;
    }
	else if(lstAmountType.value == '02')//book & usd
    {
        idGrid.GetGridControl().ColHidden(5) = false;
		idGrid.GetGridControl().ColHidden(6) = false;
		idGrid.GetGridControl().ColHidden(7) = false;
        idGrid.GetGridControl().ColHidden(8) = false;
        idGrid.GetGridControl().ColHidden(9) = true;
		idGrid.GetGridControl().ColHidden(10) = true;
		
        idGrid.GetGridControl().ColHidden(11) = false;
		idGrid.GetGridControl().ColHidden(12) = false;
		idGrid.GetGridControl().ColHidden(13) = false;
        idGrid.GetGridControl().ColHidden(14) = false;
		idGrid.GetGridControl().ColHidden(15) = true;
        idGrid.GetGridControl().ColHidden(16) = true;
		
		idGrid.GetGridControl().ColHidden(17) = false;
		idGrid.GetGridControl().ColHidden(18) = false;
        idGrid.GetGridControl().ColHidden(19) = false;
		idGrid.GetGridControl().ColHidden(20) = false;
        idGrid.GetGridControl().ColHidden(21) = true;
        idGrid.GetGridControl().ColHidden(22) = true;
		
		idGrid.GetGridControl().ColHidden(23) = false;
		idGrid.GetGridControl().ColHidden(24) = false;
		idGrid.GetGridControl().ColHidden(25) = false;
		idGrid.GetGridControl().ColHidden(26) = false;
        idGrid.GetGridControl().ColHidden(27) = true;
        idGrid.GetGridControl().ColHidden(28) = true;
		//============================================================================
		idGrid_sum.GetGridControl().ColHidden(1) = false;
		idGrid_sum.GetGridControl().ColHidden(2) = false;
		idGrid_sum.GetGridControl().ColHidden(3) = false;
        idGrid_sum.GetGridControl().ColHidden(4) = false;
        idGrid_sum.GetGridControl().ColHidden(5) = true;
		idGrid_sum.GetGridControl().ColHidden(6) = true;
		
		idGrid_sum.GetGridControl().ColHidden(7) = false;
		idGrid_sum.GetGridControl().ColHidden(8) = false;
        idGrid_sum.GetGridControl().ColHidden(9) = false;
        idGrid_sum.GetGridControl().ColHidden(10) = false;
		idGrid_sum.GetGridControl().ColHidden(11) = true;
        idGrid_sum.GetGridControl().ColHidden(12) = true;
		
		idGrid_sum.GetGridControl().ColHidden(13) = false;
        idGrid_sum.GetGridControl().ColHidden(14) = false;
		idGrid_sum.GetGridControl().ColHidden(15) = false;
		idGrid_sum.GetGridControl().ColHidden(16) = false;
        idGrid_sum.GetGridControl().ColHidden(17) = true;
        idGrid_sum.GetGridControl().ColHidden(18) = true;
		
		idGrid_sum.GetGridControl().ColHidden(19) = false;
		idGrid_sum.GetGridControl().ColHidden(20) = false;
		idGrid_sum.GetGridControl().ColHidden(21) = false;
		idGrid_sum.GetGridControl().ColHidden(22) = false;
        idGrid_sum.GetGridControl().ColHidden(23) = true;
        idGrid_sum.GetGridControl().ColHidden(24) = true;
    }
	else if(lstAmountType.value == '03')//book & won
    {
        idGrid.GetGridControl().ColHidden(5) = false;
		idGrid.GetGridControl().ColHidden(6) = false;
		idGrid.GetGridControl().ColHidden(7) = true;
        idGrid.GetGridControl().ColHidden(8) = true;
        idGrid.GetGridControl().ColHidden(9) = false;
		idGrid.GetGridControl().ColHidden(10) = false;
		
		idGrid.GetGridControl().ColHidden(11) = false;
		idGrid.GetGridControl().ColHidden(12) = false;
        idGrid.GetGridControl().ColHidden(13) = true;
        idGrid.GetGridControl().ColHidden(14) = true;
		idGrid.GetGridControl().ColHidden(15) = false;
        idGrid.GetGridControl().ColHidden(16) = false;
		
		idGrid.GetGridControl().ColHidden(17) = false;
        idGrid.GetGridControl().ColHidden(18) = false;
		idGrid.GetGridControl().ColHidden(19) = true;
		idGrid.GetGridControl().ColHidden(20) = true;
        idGrid.GetGridControl().ColHidden(21) = false;
        idGrid.GetGridControl().ColHidden(22) = false;
		
		idGrid.GetGridControl().ColHidden(23) = false;
		idGrid.GetGridControl().ColHidden(24) = false;
		idGrid.GetGridControl().ColHidden(25) = true;
		idGrid.GetGridControl().ColHidden(26) = true;
        idGrid.GetGridControl().ColHidden(27) = false;
        idGrid.GetGridControl().ColHidden(28) = false;
		//============================================================================
		idGrid_sum.GetGridControl().ColHidden(1) = false;
		idGrid_sum.GetGridControl().ColHidden(2) = false;
		idGrid_sum.GetGridControl().ColHidden(3) = true;
        idGrid_sum.GetGridControl().ColHidden(4) = true;
        idGrid_sum.GetGridControl().ColHidden(5) = false;
		idGrid_sum.GetGridControl().ColHidden(6) = false;
		
		idGrid_sum.GetGridControl().ColHidden(7) = false;
		idGrid_sum.GetGridControl().ColHidden(8) = false;
        idGrid_sum.GetGridControl().ColHidden(9) = true;
        idGrid_sum.GetGridControl().ColHidden(10) = true;
		idGrid_sum.GetGridControl().ColHidden(11) = false;
        idGrid_sum.GetGridControl().ColHidden(12) = false;
		
		idGrid_sum.GetGridControl().ColHidden(13) = false;
        idGrid_sum.GetGridControl().ColHidden(14) = false;
		idGrid_sum.GetGridControl().ColHidden(15) = true;
		idGrid_sum.GetGridControl().ColHidden(16) = true;
        idGrid_sum.GetGridControl().ColHidden(17) = false;
        idGrid_sum.GetGridControl().ColHidden(18) = false;
		
		idGrid_sum.GetGridControl().ColHidden(19) = false;
		idGrid_sum.GetGridControl().ColHidden(20) = false;
		idGrid_sum.GetGridControl().ColHidden(21) = true;
		idGrid_sum.GetGridControl().ColHidden(22) = true;
        idGrid_sum.GetGridControl().ColHidden(23) = false;
        idGrid_sum.GetGridControl().ColHidden(24) = false;
    }
	else if(lstAmountType.value == '04')//usd
    {
		idGrid.GetGridControl().ColHidden(5) = true;
        idGrid.GetGridControl().ColHidden(6) = true;
        idGrid.GetGridControl().ColHidden(7) = false;
        idGrid.GetGridControl().ColHidden(8) = false;
        idGrid.GetGridControl().ColHidden(9) = true;
		idGrid.GetGridControl().ColHidden(10) = true;
		
		idGrid.GetGridControl().ColHidden(11) = true;
        idGrid.GetGridControl().ColHidden(12) = true;
        idGrid.GetGridControl().ColHidden(13) = false;
        idGrid.GetGridControl().ColHidden(14) = false;
		idGrid.GetGridControl().ColHidden(15) = true;
        idGrid.GetGridControl().ColHidden(16) = true;
		
		idGrid.GetGridControl().ColHidden(17) = true;
        idGrid.GetGridControl().ColHidden(18) = true;
        idGrid.GetGridControl().ColHidden(19) = false;
		idGrid.GetGridControl().ColHidden(20) = false;
        idGrid.GetGridControl().ColHidden(21) = true;
        idGrid.GetGridControl().ColHidden(22) = true;
		
		idGrid.GetGridControl().ColHidden(23) = true;
        idGrid.GetGridControl().ColHidden(24) = true;
		idGrid.GetGridControl().ColHidden(25) = false;
		idGrid.GetGridControl().ColHidden(26) = false;
        idGrid.GetGridControl().ColHidden(27) = true;
        idGrid.GetGridControl().ColHidden(28) = true;
		//============================================================================
		idGrid_sum.GetGridControl().ColHidden(1) = true;
		idGrid_sum.GetGridControl().ColHidden(2) = true;
		idGrid_sum.GetGridControl().ColHidden(3) = false;
        idGrid_sum.GetGridControl().ColHidden(4) = false;
        idGrid_sum.GetGridControl().ColHidden(5) = true;
		idGrid_sum.GetGridControl().ColHidden(6) = true;
		
		idGrid_sum.GetGridControl().ColHidden(7) = true;
		idGrid_sum.GetGridControl().ColHidden(8) = true;
        idGrid_sum.GetGridControl().ColHidden(9) = false;
        idGrid_sum.GetGridControl().ColHidden(10) = false;
		idGrid_sum.GetGridControl().ColHidden(11) = true;
        idGrid_sum.GetGridControl().ColHidden(12) = true;
		
		idGrid_sum.GetGridControl().ColHidden(13) = true;
        idGrid_sum.GetGridControl().ColHidden(14) = true;
		idGrid_sum.GetGridControl().ColHidden(15) = false;
		idGrid_sum.GetGridControl().ColHidden(16) = false;
        idGrid_sum.GetGridControl().ColHidden(17) = true;
        idGrid_sum.GetGridControl().ColHidden(18) = true;
		
		idGrid_sum.GetGridControl().ColHidden(19) = true;
		idGrid_sum.GetGridControl().ColHidden(20) = true;
		idGrid_sum.GetGridControl().ColHidden(21) = false;
		idGrid_sum.GetGridControl().ColHidden(22) = false;
        idGrid_sum.GetGridControl().ColHidden(23) = true;
        idGrid_sum.GetGridControl().ColHidden(24) = true;
    }
	else if(lstAmountType.value == '05')//won
    {
        idGrid.GetGridControl().ColHidden(5) = true;
        idGrid.GetGridControl().ColHidden(6) = true;
        idGrid.GetGridControl().ColHidden(7) = true;
        idGrid.GetGridControl().ColHidden(8) = true;
        idGrid.GetGridControl().ColHidden(9) = false;
		idGrid.GetGridControl().ColHidden(10) = false;
		
		idGrid.GetGridControl().ColHidden(11) = true;
        idGrid.GetGridControl().ColHidden(12) = true;
        idGrid.GetGridControl().ColHidden(13) = true;
        idGrid.GetGridControl().ColHidden(14) = true;
		idGrid.GetGridControl().ColHidden(15) = false;
        idGrid.GetGridControl().ColHidden(16) = false;
		
		idGrid.GetGridControl().ColHidden(17) = true;
        idGrid.GetGridControl().ColHidden(18) = true;
        idGrid.GetGridControl().ColHidden(19) = true;
		idGrid.GetGridControl().ColHidden(20) = true;
        idGrid.GetGridControl().ColHidden(21) = false;
        idGrid.GetGridControl().ColHidden(22) = false;
		
		idGrid.GetGridControl().ColHidden(23) = true;
        idGrid.GetGridControl().ColHidden(24) = true;
		idGrid.GetGridControl().ColHidden(25) = true;
		idGrid.GetGridControl().ColHidden(26) = true;
        idGrid.GetGridControl().ColHidden(27) = false;
        idGrid.GetGridControl().ColHidden(28) = false;
		//============================================================================
		idGrid_sum.GetGridControl().ColHidden(1) = true;
		idGrid_sum.GetGridControl().ColHidden(2) = true;
		idGrid_sum.GetGridControl().ColHidden(3) = true;
        idGrid_sum.GetGridControl().ColHidden(4) = true;
        idGrid_sum.GetGridControl().ColHidden(5) = false;
		idGrid_sum.GetGridControl().ColHidden(6) = false;
		
		idGrid_sum.GetGridControl().ColHidden(7) = true;
		idGrid_sum.GetGridControl().ColHidden(8) = true;
        idGrid_sum.GetGridControl().ColHidden(9) = true;
        idGrid_sum.GetGridControl().ColHidden(10) = true;
		idGrid_sum.GetGridControl().ColHidden(11) = false;
        idGrid_sum.GetGridControl().ColHidden(12) = false;
		
		idGrid_sum.GetGridControl().ColHidden(13) = true;
        idGrid_sum.GetGridControl().ColHidden(14) = true;
		idGrid_sum.GetGridControl().ColHidden(15) = true;
		idGrid_sum.GetGridControl().ColHidden(16) = true;
        idGrid_sum.GetGridControl().ColHidden(17) = false;
        idGrid_sum.GetGridControl().ColHidden(18) = false;
		
		idGrid_sum.GetGridControl().ColHidden(19) = true;
		idGrid_sum.GetGridControl().ColHidden(20) = true;
		idGrid_sum.GetGridControl().ColHidden(21) = true;
		idGrid_sum.GetGridControl().ColHidden(22) = true;
        idGrid_sum.GetGridControl().ColHidden(23) = false;
        idGrid_sum.GetGridControl().ColHidden(24) = false;
    }
	else if(lstAmountType.value == '06')//
    {
        idGrid.GetGridControl().ColHidden(5) = false;
        idGrid.GetGridControl().ColHidden(6) = false;
        idGrid.GetGridControl().ColHidden(7) = false;
        idGrid.GetGridControl().ColHidden(8) = false;
        idGrid.GetGridControl().ColHidden(9) = false;
		idGrid.GetGridControl().ColHidden(10) = false;
		
		idGrid.GetGridControl().ColHidden(11) = false;
        idGrid.GetGridControl().ColHidden(12) = false;
        idGrid.GetGridControl().ColHidden(13) = false;
        idGrid.GetGridControl().ColHidden(14) = false;
		idGrid.GetGridControl().ColHidden(15) = false;
        idGrid.GetGridControl().ColHidden(16) = false;
		
		idGrid.GetGridControl().ColHidden(17) = false;
        idGrid.GetGridControl().ColHidden(18) = false;
        idGrid.GetGridControl().ColHidden(19) = false;
		idGrid.GetGridControl().ColHidden(20) = false;
        idGrid.GetGridControl().ColHidden(21) = false;
        idGrid.GetGridControl().ColHidden(22) = false;
		
		idGrid.GetGridControl().ColHidden(23) = false;
        idGrid.GetGridControl().ColHidden(24) = false;
		idGrid.GetGridControl().ColHidden(25) = false;
		idGrid.GetGridControl().ColHidden(26) = false;
        idGrid.GetGridControl().ColHidden(27) = false;
        idGrid.GetGridControl().ColHidden(28) = false;
		
		//============================================================================
		idGrid_sum.GetGridControl().ColHidden(1) = false;
		idGrid_sum.GetGridControl().ColHidden(2) = false;
		idGrid_sum.GetGridControl().ColHidden(3) = false;
        idGrid_sum.GetGridControl().ColHidden(4) = false;
        idGrid_sum.GetGridControl().ColHidden(5) = false;
		idGrid_sum.GetGridControl().ColHidden(6) = false;
		
		idGrid_sum.GetGridControl().ColHidden(7) = false;
		idGrid_sum.GetGridControl().ColHidden(8) = false;
        idGrid_sum.GetGridControl().ColHidden(9) = false;
        idGrid_sum.GetGridControl().ColHidden(10) = false;
		idGrid_sum.GetGridControl().ColHidden(11) = false;
        idGrid_sum.GetGridControl().ColHidden(12) = false;
		
		idGrid_sum.GetGridControl().ColHidden(13) = false;
        idGrid_sum.GetGridControl().ColHidden(14) = false;
		idGrid_sum.GetGridControl().ColHidden(15) = false;
		idGrid_sum.GetGridControl().ColHidden(16) = false;
        idGrid_sum.GetGridControl().ColHidden(17) = false;
        idGrid_sum.GetGridControl().ColHidden(18) = false;
		
		idGrid_sum.GetGridControl().ColHidden(19) = false;
		idGrid_sum.GetGridControl().ColHidden(20) = false;
		idGrid_sum.GetGridControl().ColHidden(21) = false;
		idGrid_sum.GetGridControl().ColHidden(22) = false;
        idGrid_sum.GetGridControl().ColHidden(23) = false;
        idGrid_sum.GetGridControl().ColHidden(24) = false;
    }
}

function MergeHeaderSum()
{
	if (idGrid_sum.rows < 2)
	{
	    idGrid_sum.AddRow();
	}
	
		var fg=idGrid_sum.GetGridControl();
		fg.FixedRows  = 2
		fg.MergeCells = 4
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 1, 0, 2) = "Beginning Balance(Book)"  
		fg.Cell(0, 1, 1, 1) 	= "Debit"
		fg.Cell(0, 1, 2, 1 ) 	= "Credit"
		fg.Cell(0, 0, 3, 0, 4) = "Beginning Balance(USD)"  
		fg.Cell(0, 1, 3, 1) 	= "Debit"
		fg.Cell(0, 1, 4, 1 ) 	= "Credit"
		fg.Cell(0, 0, 5, 0, 6) = "Beginning Balance(WON)"  
		fg.Cell(0, 1, 5, 1) 	= "Debit"
		fg.Cell(0, 1, 6, 1 ) 	= "Credit"
		
		fg.Cell(0, 0, 7, 0, 8) = "Period Balance(Book)" 
		fg.Cell(0, 1, 7, 1) 	= "Debit"
		fg.Cell(0, 1, 8, 1 ) 	= "Credit"
		fg.Cell(0, 0, 9, 0, 10) = "Period Balance(USD)" 
		fg.Cell(0, 1, 9, 1) 	= "Debit"
		fg.Cell(0, 1, 10, 1 ) 	= "Credit"
		fg.Cell(0, 0, 11, 0, 12) = "Period Balance(WON)" 
		fg.Cell(0, 1, 11, 1) 	= "Debit"
		fg.Cell(0, 1, 12, 1 ) 	= "Credit"
		
		fg.Cell(0, 0, 13, 0, 14) = "Cumulative(Book)"
		fg.Cell(0, 1, 13, 1) 	= "Debit"
		fg.Cell(0, 1, 14, 1 ) 	= "Credit"
		fg.Cell(0, 0, 15, 0, 16) = "Cumulative(USD)"
		fg.Cell(0, 1, 15, 1) 	= "Debit"
		fg.Cell(0, 1, 16, 1 ) 	= "Credit"
		fg.Cell(0, 0, 17, 0, 18) = "Cumulative(WON)"
		fg.Cell(0, 1, 17, 1) 	= "Debit"
		fg.Cell(0, 1, 18, 1 ) 	= "Credit"
		
		fg.Cell(0, 0, 19, 0, 20) = "Ending Balance(Book)"
		fg.Cell(0, 1, 19, 1) 	= "Debit"
		fg.Cell(0, 1, 20, 1 ) 	= "Credit"
		fg.Cell(0, 0, 21, 0, 22) = "Ending Balance(USD)"
		fg.Cell(0, 1, 21, 1) 	= "Debit"
		fg.Cell(0, 1, 22, 1 ) 	= "Credit"
		fg.Cell(0, 0, 23, 0, 24) = "Ending Balance(WON)"
		fg.Cell(0, 1, 23, 1) 	= "Debit"
		fg.Cell(0, 1, 24, 1 ) 	= "Credit"
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0)  = "TOTAL"
}

function onReport()
{
   
        var _check = 0;
      
        var url = '/standard/reports/60/08/rpt_60080380_Trial_balance.aspx?p_tco_company_pk='+ lstCompany.value + '&p_lang='+ lstLang.value + '&p_date_fr=' +dtFrom.value+ '&p_date_to=' +  dtTo.value  + '&p_status='+ lstStatus.value + '&p_level=' + lstLevel.value + '&p_possum=' + lstPostSum.value + '&p_accd=' + txtac_cd.text + '&p_pacctype=' + lstAccType.value+'&amounttype='+lstAmountType.value;
	    System.OpenTargetPage( System.RootURL+url , "newform" );
	   
}

function onSetColor()
{
    var ctrl = idGrid.GetGridControl();
    for (i = 1; i < ctrl.Rows; i++)
	{
	    
	    if(idGrid.GetGridData(i,29)== "B")
        {
	        ctrl.Cell(14, i, 1, i, 30) = false;
	        idGrid.SetCellBold(i, 1, i, 30, true);
        }
        else if (idGrid.GetGridData(i,29)== "I")
        {
	        idGrid.SetCellBold(i, 1, i, 30, false);
	        ctrl.Cell(14, i, 1, i, 30) = true; // Chu nghieng
	    }
	    else
	    {
	        ctrl.Cell(14, i, 1, i, 20) = false;
	        idGrid.SetCellBold(i, 1, i, 30, false);
	    }
	    idGrid.SetCellBgColor(i, 0, i, 34, Number(idGrid.GetGridData(i, 30)));
	}
	MergeHeader();
	
	    txt_check.text = 1;
	    dso_sel_trial_balance_sum.Call('SELECT');
	
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
function OnPopupDailySL()
{
    var ctrl 	= idGrid.GetGridControl();
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
			var fpath   = System.RootURL + '/standard/forms/60/08/60080050_p1.aspx?ac_pk='+ ac_pk + '&ac_nm=' + ac_nm + '&compk=' + lstCompany.GetData() + '&status=' + lstStatus.GetData() + '&lang='+ lstLang.GetData() + '&cur=ALL' +  '&date_fr=' + dtFrom.GetData() + '&date_to=' + dtTo.GetData() + '&type_month=';
			//    alert(fpath);
				fpath = fpath + '&ac_cd=' + idGrid.GetGridData(ctrl.row, 23) + '&ad_nm1=' + idGrid.GetGridData(ctrl.row, 24) ;
			var wWidth  = 950;
			var wHeight = 500;
			var x = Math.round((screen.availWidth - wWidth)/2);
			var y = Math.round((screen.availHeight - wHeight)/2);
			var features="";
			//var features = "toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes," + 
			  // "scrollbars=no,resizable=yes,copyhistory=no,width="+wWidth+",height="+wHeight +
			  // "lef="+ x +",top=" + y;
			
			var object = System.OpenModal(fpath, wWidth, wHeight, features);
	    }
    }
}

function OnChangeRadio()
{
    onSearch();
}
function OnChangeMonth()
{
    var yyyymm = dtMonth.GetData();
    var yyyy = yyyymm.substr(0,4);
    var mm = yyyymm.substr(4,2);
    dtFrom.SetDataText(yyyy+mm+"01");
    dtTo.SetDataText(yyyy+mm+LastDayOfMonth(yyyymm));
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
            <dso type="grid" function="ac_sel_60080380_trialbal_usd" >
                    <input bind="idGrid">
                    <input bind="lstCompany"/>
                    <input bind="dtFrom"/>
					<input bind="dtTo"/>
                    <input bind="lstStatus"/>
					<input bind="txtac_cd"/>
                    <input bind="lstLevel"/>
                    <input bind="lstPostSum"/>
                    <input bind="lstAccType"/>
                </input>
                <output bind="idGrid"/>
            </dso>
        </xml>
    </gw:data>

    <gw:data id="dso_sel_trial_balance_sum" onreceive="onMergeSum()">
        <xml>
            <dso type="grid" function="ac_sel_60080380_trialbal_sum" >
                    <input bind="idGrid">
                    <input bind="lstCompany"/>
                    <input bind="dtFrom"/>
					<input bind="dtTo"/>
                    <input bind="lstStatus"/>
					<input bind="txtac_cd"/>
                    <input bind="lstLevel"/>
                    <input bind="lstPostSum"/>
                    <input bind="lstAccType"/>
                </input>
                <output bind="idGrid_sum"/>
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
	        <td align="right" >Company</td>
            <td><gw:list id="lstCompany" onChange ="onSearch()" styles='width:100%'></gw:list></td>
		    <td align="right" >Language</td>
            <td><gw:list id="lstLang" onChange="OnChangeList()" /></td>
            <td align="right" >Amount Type</td>
            <td><gw:list id="lstAmountType" onChange="OnChangeAmountType()" /></td>
	    </tr>
	     <tr>
	        <td align='right' width='10%'>Month</td>
            <td >
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td><gw:datebox id="dtMonth" type="month" lang="1" onchange="OnChangeMonth();"/></td>
                    <td><gw:datebox id="dtFrom" lang="1" /></td>
					<td>~</td>
					<td><gw:datebox id="dtTo" lang="1" /></td>
                    <td width='100%'></td>
                </tr>
                </table>
            </td>
			
			<td align="right" width='20%'>Acc.Type</td>
            <td colspan="" width='20%'><gw:list id="lstAccType" onChange ="onSearch()"  styles='width:100%'></gw:list></td>
			<td align="right" width='15%'>Status</td>
			<td width='15%'><gw:list id="lstStatus" onchange="onSearch()"/></td> 
			<td ><gw:button id="ibtnReport" img="excel"   alt="Print"  onclick="onReport()"/></td>
	    </tr>
	     <tr>
	        <td align="right"><a title="Click here to select Ex.Rate" onclick="Popup_Acc()" href="#tips" style="text-decoration: none; color=#0000ff"><b>Acc.Code</b></a></td>
	        <td colspan="">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="35%"><gw:textbox id="txtac_cd" styles='width:100%' onkeypress="CheckNumeric()" onenterkey="onEnter()"/></td>
                    <td width="60%"><gw:textbox id="txtac_nm" styles='width:100%'/></td>
                    <td width="0%"><gw:textbox  id="txtac_pk" styles='display:none'/></td>
                    <td width="5%"><gw:imgBtn   img="reset"	id="idResetAcc"  alt="Reset" onclick="Reset_Acc()"/></td>
                </tr>
                </table>
	        </td>
			<td align="right">Posting/Summary</td>
			<td ><gw:list id="lstPostSum" onChange="OnChangeList()" /></td>
			<td align="right" width='10%'>Level</td>
	        <td colspan="" width='10%'><gw:list id="lstLevel" onChange="OnChangeList()"  /></td>
           <td align="right"><gw:button id="ibtnSearch" img="search"    alt="Search"        onclick="onSearch()"/></td>
           
	    </tr>
	    </table>
        </fieldset>
	</td>
</tr>
<tr style='height:94%'>
	<td width="100%">
	    <table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
        <tr style='height:75%'>
            <!--0.Ctrl|1_PK|2.Account Name|3.Begin Bal(Debt)|4.Begin Bal(Cret)|5.Debit|6.Credit|7.cal bal(Debt)|8.cal bal(Cret)|9.Ending bal(Debt)|10.Ending bal(Cret)|11_B|12_COLOR|13_ac_cd|14_ac_nm-->
            <td>
                <gw:grid  
				    id="idGrid"
				    header="Ctrl|_PK|Account Name|Account Name|Account Name|Begin Bal(Debt)|Begin Bal(Cret)|c|d|c|d|c|d|c||||||||||||||||_|_|_|_|_"
				    format="3|0|0|0|0|-0|-0|1|1|1|1|-0|-0|1|1|1|1|-0|-0|1|1|1|1|-0|-0|1|1|1|1|0|0|0|0|0"  
 			        aligns="1|1|2|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|0|0"  
				    widths="400|0|3000|3000|3000|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|0|0"
				    styles="width:100%; height:100%"
				    sorting="T"
				    oncelldblclick="OnPopupDailySL()"
				    /> 
            </td>
        </tr>
        <tr style='height:25%'>
            <td>
                <gw:grid   
				id="idGrid_sum"
				header="Total|O_Dr|O_cr|O_Dr|O_cr|O_Dr|O_cr|P_Dr|P_cr|P_Dr|P_cr|P_Dr|P_cr|C_Dr|C_cr|C_Dr|C_cr|C_Dr|C_cr|E_Dr|E_cr|E_Dr|E_cr|E_Dr|E_cr"   
				format="0|0|0|1|1|1|1|0|0|1|1|1|1|0|0|1|1|1|1|0|0|1|1|1|1"  
 			    aligns="1|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3"
			   editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				widths="3400|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800"  
				styles="width:100%; height:100%" 
				sorting="F" /> 

				
            </td>
        </tr>
        </table>
	</td>
</tr>
</table>

<gw:textbox id="txt_check"      styles='display:none'/>
<gw:textbox id="txt_temp"       styles='display:none'/>
<gw:textbox id="txt_row"        styles='display:none'/>
<gw:textbox id="txt_date"       styles='display:none'/>
<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>

</body>
</html>

