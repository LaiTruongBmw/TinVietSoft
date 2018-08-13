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
    var ls_lang    = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('HRAB0180','02','') FROM DUAL")%>";
    var ls_current = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
    var ls_level   = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0020','','') FROM DUAL")%>||";
    var ls_possum  = "DATA|Y|Posting|N|Summary||";
    var ls_date     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
    var ls_month    = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(ADD_MONTHS(SYSDATE,-1), 'YYYYMM') FROM DUAL")%>";
    var dataAmtType = "Data|1|Transaction|2|Book|3|Trans & Book"; 
    lstAmtType.SetDataText(dataAmtType);
    lstAmtType.value=2;
    var dataAccType  =  "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACBK020') FROM DUAL")%>";
    lstAccType.SetDataText(dataAccType); 
    var dataStatus = "Data|0|Approved|2|Confirmed"; 
    lstStatus.SetDataText(dataStatus); 
    lstStatus.SetDataText("2"); 
    var dataBalance = "Data|1|Monthly|2|Period"; 
    lstBalance.SetDataText(dataBalance); 
    lstBalance.value=2;
    txt_date.SetDataText(ls_date);
    txtrate1.SetDataText('1');
    dtfrmonth.SetDataText(ls_month);
    lstCompany.SetDataText(ls_company);
    lstFinancial.SetDataText(ls_type);
    lstLang.SetDataText(ls_lang);
    lstCurrent.SetDataText(ls_current);
    var data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
    arr  = data.split("|");
	lstCurrent.SetDataText(arr[1]);
    lstLevel.SetDataText(ls_level);
    lstPostSum.SetDataText(ls_possum);
    MergeHeader();
    MergeHeaderSum();
    txtrate.SetDataText("1");
    txtrate.SetEnable(false);
    txtac_nm.SetEnable(false);
    lstLevel.SetDataText("");
    lstPostSum.SetDataText("");
    idGrid.GetGridControl().FrozenCols = 3;
    idGrid_sum.GetGridControl().FrozenCols = 1;
    txtac_cd.GetControl().focus();
	var fg = idGrid.GetGridControl();
	var fgsum= idGrid_sum.GetGridControl();
    if (lstCurrent.GetData() == 'VND')
    {
       
        fg.ColFormat(4) = "#,###,###,###,###,###,###,###,###R";
		fg.ColFormat(5) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(6) = "#,###,###,###,###,###,###,###,###R";
		fg.ColFormat(7) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(8) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###R";
		fg.ColFormat(10) = "#,###,###,###,###,###,###,###,###R";
		fg.ColFormat(11) = "#,###,###,###,###,###,###,###,###R";
		fg.ColFormat(12) = "#,###,###,###,###,###,###,###,###R";
		fg.ColFormat(13) = "#,###,###,###,###,###,###,###,###R";
		fg.ColFormat(14) = "#,###,###,###,###,###,###,###,###R";
		fg.ColFormat(15) = "#,###,###,###,###,###,###,###,###R";
		fg.ColFormat(16) = "#,###,###,###,###,###,###,###,###R";
		fg.ColFormat(17) = "#,###,###,###,###,###,###,###,###R";
		fg.ColFormat(18) = "#,###,###,###,###,###,###,###,###R";
		fg.ColFormat(19) = "#,###,###,###,###,###,###,###,###R";

		fgsum.ColFormat(1) = "#,###,###,###,###,###,###,###,###R";
        fgsum.ColFormat(2) = "#,###,###,###,###,###,###,###,###R";
        fgsum.ColFormat(3) = "#,###,###,###,###,###,###,###,###R";
        fgsum.ColFormat(4) = "#,###,###,###,###,###,###,###,###R";
        fgsum.ColFormat(5) = "#,###,###,###,###,###,###,###,###R";
        fgsum.ColFormat(6) = "#,###,###,###,###,###,###,###,###R";
        fgsum.ColFormat(7) = "#,###,###,###,###,###,###,###,###R";
        fgsum.ColFormat(8) = "#,###,###,###,###,###,###,###,###R";
        fgsum.ColFormat(9) = "#,###,###,###,###,###,###,###,###R";
        fgsum.ColFormat(10) = "#,###,###,###,###,###,###,###,###R";
        fgsum.ColFormat(11) = "#,###,###,###,###,###,###,###,###R";
        fgsum.ColFormat(12) = "#,###,###,###,###,###,###,###,###R";
        fgsum.ColFormat(13) = "#,###,###,###,###,###,###,###,###R";
        fgsum.ColFormat(14) = "#,###,###,###,###,###,###,###,###R";
        fgsum.ColFormat(15) = "#,###,###,###,###,###,###,###,###R";
        fgsum.ColFormat(16) = "#,###,###,###,###,###,###,###,###R";
    }
    else
    {
        
        fg.ColFormat(4) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(5) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(6) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(7) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(8) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(10) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(11) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(12) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(13) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(14) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(15) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(16) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(17) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(18) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(19) = "#,###,###,###,###,###,###,###,###.##R";

		fgsum.ColFormat(1) = "#,###,###,###,###,###,###,###,###.##R";
        fgsum.ColFormat(2) = "#,###,###,###,###,###,###,###,###.##R";
        fgsum.ColFormat(3) = "#,###,###,###,###,###,###,###,###.##R";
        fgsum.ColFormat(4) = "#,###,###,###,###,###,###,###,###.##R";
        fgsum.ColFormat(5) = "#,###,###,###,###,###,###,###,###.##R";
        fgsum.ColFormat(6) = "#,###,###,###,###,###,###,###,###.##R";
        fgsum.ColFormat(7) = "#,###,###,###,###,###,###,###,###.##R";
        fgsum.ColFormat(8) = "#,###,###,###,###,###,###,###,###.##R";
        fgsum.ColFormat(9) = "#,###,###,###,###,###,###,###,###.##R";
        fgsum.ColFormat(10) = "#,###,###,###,###,###,###,###,###.##R";
        fgsum.ColFormat(11) = "#,###,###,###,###,###,###,###,###.##R";
        fgsum.ColFormat(12) = "#,###,###,###,###,###,###,###,###.##R";
        fgsum.ColFormat(13) = "#,###,###,###,###,###,###,###,###.##R";
        fgsum.ColFormat(14) = "#,###,###,###,###,###,###,###,###.##R";
        fgsum.ColFormat(15) = "#,###,###,###,###,###,###,###,###.##R";
        fgsum.ColFormat(16) = "#,###,###,###,###,###,###,###,###.##R";
       
    }    
        
}
 
function onCheckMonth()
{
    if (lstBalance.GetData() == 2)
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

    if(lstBalance.GetData() == 1)
    {
        dtfrmonth.style.display = 'none';
        lblRecord.style.width="60"
        lblRecord1.style.width="66"
        //hide colum in detail
        idGrid_sum.GetGridControl().ColHidden(9) = true;
		idGrid_sum.GetGridControl().ColHidden(10) = true;
		idGrid_sum.GetGridControl().ColHidden(11) = true;
		idGrid_sum.GetGridControl().ColHidden(12) = true;
		
		//hide colum in master
		idGrid.GetGridControl().ColHidden(11) = true;
		idGrid.GetGridControl().ColHidden(12) = true;
		idGrid.GetGridControl().ColHidden(13) = true;
		idGrid.GetGridControl().ColHidden(14) = true;
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
    txtac_cd.GetControl().focus(); 
    idGrid.ClearData();
    idGrid_sum.ClearData();
    if (txtac_cd.GetData() == '')
    {
        txtac_nm.SetDataText("");
    }
    
    MergeHeader();
    MergeHeaderSum();
    if(lstBalance.GetData() == 1)
    {
		dso_sel_trial_balance_monthly.Call('SELECT');
    }
    else
    {
        dso_sel_trial_balance.Call('SELECT');
    }
    
}
function HideColBookSum()
	{
	    idGrid_sum.GetGridControl().ColHidden(1) = true;
		idGrid_sum.GetGridControl().ColHidden(2) = true;
	    idGrid_sum.GetGridControl().ColHidden(5) = true;
		idGrid_sum.GetGridControl().ColHidden(6) = true;
		
	    idGrid_sum.GetGridControl().ColHidden(9) = true;
		idGrid_sum.GetGridControl().ColHidden(10) = true;
		idGrid_sum.GetGridControl().ColHidden(13) = true;
		idGrid_sum.GetGridControl().ColHidden(14) = true;
	}
	function AppearColBookSum()
	{
	    idGrid_sum.GetGridControl().ColHidden(1) = false;
		idGrid_sum.GetGridControl().ColHidden(2) = false;
	    idGrid_sum.GetGridControl().ColHidden(5) = false;
		idGrid_sum.GetGridControl().ColHidden(6) = false;
		
	    idGrid_sum.GetGridControl().ColHidden(9) = false;
		idGrid_sum.GetGridControl().ColHidden(10) = false;
		idGrid_sum.GetGridControl().ColHidden(13) = false;
		idGrid_sum.GetGridControl().ColHidden(14) = false;
	}
	function HideColTransSum()
	{
	    idGrid_sum.GetGridControl().ColHidden(3) = true;
		idGrid_sum.GetGridControl().ColHidden(4) = true;
	    idGrid_sum.GetGridControl().ColHidden(7) = true;
		idGrid_sum.GetGridControl().ColHidden(8) = true;
		
	    idGrid_sum.GetGridControl().ColHidden(11) = true;
		idGrid_sum.GetGridControl().ColHidden(12) = true;
		idGrid_sum.GetGridControl().ColHidden(15) = true;
		idGrid_sum.GetGridControl().ColHidden(16) = true;
	}
//------------------------------------------------------------------------------------
	function AppearColTransSum()
	{
	    idGrid_sum.GetGridControl().ColHidden(3) = false;
		idGrid_sum.GetGridControl().ColHidden(4) = false;
	    idGrid_sum.GetGridControl().ColHidden(7) = false;
		idGrid_sum.GetGridControl().ColHidden(8) = false;
		
	    idGrid_sum.GetGridControl().ColHidden(11) = false;
		idGrid_sum.GetGridControl().ColHidden(12) = false;
		idGrid_sum.GetGridControl().ColHidden(15) = false;
		idGrid_sum.GetGridControl().ColHidden(16) = false;
	}
function MergeHeader()
{
	if (idGrid.rows < 2)
	{
	    idGrid.AddRow();
	}
//------------------------------------------------------------------------------------
	function HideColBook()
	{
	    idGrid.GetGridControl().ColHidden(4) = true;
		idGrid.GetGridControl().ColHidden(5) = true;
	    idGrid.GetGridControl().ColHidden(6) = true;
		idGrid.GetGridControl().ColHidden(7) = true;
		
	    idGrid.GetGridControl().ColHidden(12) = true;
		idGrid.GetGridControl().ColHidden(13) = true;
		idGrid.GetGridControl().ColHidden(16) = true;
		idGrid.GetGridControl().ColHidden(17) = true;
	}
//------------------------------------------------------------------------------------
	function AppearColBook()
	{
	    idGrid.GetGridControl().ColHidden(4) = false;
		idGrid.GetGridControl().ColHidden(5) = false;
	    idGrid.GetGridControl().ColHidden(8) = false;
		idGrid.GetGridControl().ColHidden(9) = false;
		
	    idGrid.GetGridControl().ColHidden(12) = false;
		idGrid.GetGridControl().ColHidden(13) = false;
		idGrid.GetGridControl().ColHidden(16) = false;
		idGrid.GetGridControl().ColHidden(17) = false;
	}
//------------------------------------------------------------------------------------
	function HideColTrans()
	{
	    idGrid.GetGridControl().ColHidden(6) = true;
		idGrid.GetGridControl().ColHidden(7) = true;
	    idGrid.GetGridControl().ColHidden(10) = true;
		idGrid.GetGridControl().ColHidden(11) = true;
		
	    idGrid.GetGridControl().ColHidden(14) = true;
		idGrid.GetGridControl().ColHidden(15) = true;
		idGrid.GetGridControl().ColHidden(18) = true;
		idGrid.GetGridControl().ColHidden(19) = true;
	}
//------------------------------------------------------------------------------------
	function AppearColTrans()
	{
	    idGrid.GetGridControl().ColHidden(6) = false;
		idGrid.GetGridControl().ColHidden(7) = false;
	    idGrid.GetGridControl().ColHidden(10) = false;
		idGrid.GetGridControl().ColHidden(11) = false;
		
	    idGrid.GetGridControl().ColHidden(14) = false;
		idGrid.GetGridControl().ColHidden(15) = false;
		idGrid.GetGridControl().ColHidden(18) = false;
		idGrid.GetGridControl().ColHidden(19) = false;
	}
	
	if((lstBalance.GetData() == 1) && (lstAmtType.GetData() == 3)) //monthly && Trans && Book
	{
		var fg=idGrid.GetGridControl();
		fg.FixedRows = 2
		fg.MergeCells = 5
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 4, 0, 5) = "Beginning Balance(Book)"  
		fg.Cell(0, 0, 6, 0, 7) = "Beginning Balance(Trans)"  
		fg.Cell(0, 0, 8, 0, 9) = "Period Balance(Book)" 
		fg.Cell(0, 0, 10, 0, 11) = "Period Balance(Trans)"
		fg.Cell(0, 0, 12, 0, 13) = "Ending Balance(Book)"
		fg.Cell(0, 0, 14, 0, 15) = "Ending Balance(Trans)"
		
		fg.Cell(0, 1, 4, 1) 	= "Debit"
		fg.Cell(0, 1, 5, 1 ) 	= "Credit"
		fg.Cell(0, 1, 6, 1) 	= "Debit"
		fg.Cell(0, 1, 7, 1 ) 	= "Credit"
		fg.Cell(0, 1, 8, 1) 	= "Debit"
		fg.Cell(0, 1, 9, 1 ) 	= "Credit"
		fg.Cell(0, 1, 10, 1) 	= "Debit"
		fg.Cell(0, 1, 11, 1 ) 	= "Credit"
		fg.Cell(0, 1, 12, 1) 	= "Debit"
		fg.Cell(0, 1, 13, 1 ) 	= "Credit"
		fg.Cell(0, 1, 14, 1) 	= "Debit"
		fg.Cell(0, 1, 15, 1 ) 	= "Credit"
		
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Ctrl"
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Acc. Code"
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Account Name"
		AppearColTrans();
		AppearColBook();
		idGrid.GetGridControl().ColHidden(12) = true;
		idGrid.GetGridControl().ColHidden(13) = true;
		idGrid.GetGridControl().ColHidden(14) = true;
		idGrid.GetGridControl().ColHidden(15) = true;
		
	}
	else if((lstBalance.GetData() == 1) && (lstAmtType.GetData() == 2)) //monthly && Book 
	{
		var fg=idGrid.GetGridControl();
		fg.FixedRows = 2
		fg.MergeCells = 5
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 4, 0, 5) = "Beginning Balance(Book)"  
		fg.Cell(0, 0, 6, 0, 7) = "Beginning Balance(Trans)"  
		fg.Cell(0, 0, 8, 0, 9) = "Period Balance(Book)" 
		fg.Cell(0, 0, 10, 0, 11) = "Period Balance(Trans)"
		fg.Cell(0, 0, 12, 0, 13) = "Ending Balance(Book)"
		fg.Cell(0, 0, 14, 0, 15) = "Ending Balance(Trans)"
		
		fg.Cell(0, 1, 4, 1) 	= "Debit"
		fg.Cell(0, 1, 5, 1 ) 	= "Credit"
		fg.Cell(0, 1, 6, 1) 	= "Debit"
		fg.Cell(0, 1, 7, 1 ) 	= "Credit"
		fg.Cell(0, 1, 8, 1) 	= "Debit"
		fg.Cell(0, 1, 9, 1 ) 	= "Credit"
		fg.Cell(0, 1, 10, 1) 	= "Debit"
		fg.Cell(0, 1, 11, 1 ) 	= "Credit"
		fg.Cell(0, 1, 12, 1) 	= "Debit"
		fg.Cell(0, 1, 13, 1 ) 	= "Credit"
		fg.Cell(0, 1, 14, 1) 	= "Debit"
		fg.Cell(0, 1, 15, 1 ) 	= "Credit"
		
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Ctrl"
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Acc. code"
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Account Name"
		//hide column Cumulative
		idGrid.GetGridControl().ColHidden(12) = true;
		idGrid.GetGridControl().ColHidden(13) = true;
		idGrid.GetGridControl().ColHidden(14) = true;
		idGrid.GetGridControl().ColHidden(15) = true;
		//hide column Transaction
		HideColTrans();
		AppearColBook();
	}
	else if((lstBalance.GetData() == 1) && (lstAmtType.GetData() == 1)) //monthly && Trans 
	{
		var fg=idGrid.GetGridControl();
		fg.FixedRows = 2
		fg.MergeCells = 5
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 4, 0, 5) = "Beginning Balance(Book)"  
		fg.Cell(0, 0, 6, 0, 7) = "Beginning Balance(Trans)"  
		fg.Cell(0, 0, 8, 0, 9) = "Period Balance(Book)" 
		fg.Cell(0, 0, 10, 0, 11) = "Period Balance(Trans)"
		fg.Cell(0, 0, 12, 0, 13) = "Ending Balance(Book)"
		fg.Cell(0, 0, 14, 0, 15) = "Ending Balance(Trans)"
		
		fg.Cell(0, 1, 4, 1) 	= "Debit"
		fg.Cell(0, 1, 5, 1 ) 	= "Credit"
		fg.Cell(0, 1, 6, 1) 	= "Debit"
		fg.Cell(0, 1, 7, 1 ) 	= "Credit"
		fg.Cell(0, 1, 8, 1) 	= "Debit"
		fg.Cell(0, 1, 9, 1 ) 	= "Credit"
		fg.Cell(0, 1, 10, 1) 	= "Debit"
		fg.Cell(0, 1, 11, 1 ) 	= "Credit"
		fg.Cell(0, 1, 12, 1) 	= "Debit"
		fg.Cell(0, 1, 13, 1 ) 	= "Credit"
		fg.Cell(0, 1, 14, 1) 	= "Debit"
		fg.Cell(0, 1, 15, 1 ) 	= "Credit"
		
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Ctrl"
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Acc. Name"
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Account Name"
		//hide column Cumulative
		idGrid.GetGridControl().ColHidden(12) = true;
		idGrid.GetGridControl().ColHidden(13) = true;
		idGrid.GetGridControl().ColHidden(14) = true;
		idGrid.GetGridControl().ColHidden(15) = true;
		//hide column Transaction
		HideColBook();
		AppearColTrans();
	}
	else if(lstBalance.GetData() == 2 && (lstAmtType.GetData() == 1)) //period
	{
		var fg=idGrid.GetGridControl();
		fg.FixedRows    = 2
		fg.MergeCells   = 5
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 4, 0, 5) = "Beginning Balance(Book)"  
		fg.Cell(0, 0, 6, 0, 7) = "Beginning Balance(Trans)"  
		fg.Cell(0, 0, 8, 0, 9) = "Period Balance(Book)" 
		fg.Cell(0, 0, 10, 0, 11) = "Period Balance(Trans)"
		fg.Cell(0, 0, 12, 0, 13)  = "Cumulative(Book)"
		fg.Cell(0, 0, 14, 0, 15)  = "Cumulative(Trans)"
		fg.Cell(0, 0, 16, 0, 17) = "Ending Balance(Book)"
		fg.Cell(0, 0, 18, 0, 19) = "Ending Balance(Trans)"
		
		fg.Cell(0, 1, 4, 1) 	= "Debit"
		fg.Cell(0, 1, 5, 1 ) 	= "Credit"
		fg.Cell(0, 1, 6, 1) 	= "Debit"
		fg.Cell(0, 1, 7, 1 ) 	= "Credit"
		fg.Cell(0, 1, 8, 1) 	= "Debit"
		fg.Cell(0, 1, 9, 1 ) 	= "Credit"
		fg.Cell(0, 1, 10, 1) 	= "Debit"
		fg.Cell(0, 1, 11, 1 ) 	= "Credit"
		fg.Cell(0, 1, 12, 1) 	= "Debit"
		fg.Cell(0, 1, 13, 1 ) 	= "Credit"
		fg.Cell(0, 1, 14, 1) 	= "Debit"
		fg.Cell(0, 1, 15, 1 ) 	= "Credit"
		fg.Cell(0, 1, 16, 1) 	= "Debit"
		fg.Cell(0, 1, 17, 1 ) 	= "Credit"
		fg.Cell(0, 1, 18, 1) 	= "Debit"
		fg.Cell(0, 1, 19, 1 ) 	= "Credit"
		
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Ctrl"
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Acc. Code"
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Account Name"
		HideColBook();
		AppearColTrans();
		idGrid.GetGridControl().ColHidden(12) = true;
		idGrid.GetGridControl().ColHidden(13) = true;
		idGrid.GetGridControl().ColHidden(14) = false;
		idGrid.GetGridControl().ColHidden(15) = false;
	}
	else if(lstBalance.GetData() == 2 && (lstAmtType.GetData() == 2)) //period
	{
		var fg=idGrid.GetGridControl();
		fg.FixedRows    = 2
		fg.MergeCells   = 5
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 4, 0, 5) = "Beginning Balance(Book)"  
		fg.Cell(0, 0, 6, 0, 7) = "Beginning Balance(Trans)"  
		fg.Cell(0, 0, 8, 0, 9) = "Period Balance(Book)" 
		fg.Cell(0, 0, 10, 0, 11) = "Period Balance(Trans)"
		fg.Cell(0, 0, 12, 0, 13)  = "Cumulative(Book)"
		fg.Cell(0, 0, 14, 0, 15)  = "Cumulative(Trans)"
		fg.Cell(0, 0, 16, 0, 17) = "Ending Balance(Book)"
		fg.Cell(0, 0, 18, 0, 19) = "Ending Balance(Trans)"
		
		fg.Cell(0, 1, 4, 1) 	= "Debit"
		fg.Cell(0, 1, 5, 1 ) 	= "Credit"
		fg.Cell(0, 1, 6, 1) 	= "Debit"
		fg.Cell(0, 1, 7, 1 ) 	= "Credit"
		fg.Cell(0, 1, 8, 1) 	= "Debit"
		fg.Cell(0, 1, 9, 1 ) 	= "Credit"
		fg.Cell(0, 1, 10, 1) 	= "Debit"
		fg.Cell(0, 1, 11, 1 ) 	= "Credit"
		fg.Cell(0, 1, 12, 1) 	= "Debit"
		fg.Cell(0, 1, 13, 1 ) 	= "Credit"
		fg.Cell(0, 1, 14, 1) 	= "Debit"
		fg.Cell(0, 1, 15, 1 ) 	= "Credit"
		fg.Cell(0, 1, 16, 1) 	= "Debit"
		fg.Cell(0, 1, 17, 1 ) 	= "Credit"
		fg.Cell(0, 1, 18, 1) 	= "Debit"
		fg.Cell(0, 1, 19, 1 ) 	= "Credit"
		
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Ctrl"
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Acc. Code"
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Account Name"
		HideColTrans();
		AppearColBook();
		idGrid.GetGridControl().ColHidden(12) = false;
		idGrid.GetGridControl().ColHidden(13) = false;
		idGrid.GetGridControl().ColHidden(14) = true;
		idGrid.GetGridControl().ColHidden(15) = true;
	}
	else if(lstBalance.GetData() == 2 && (lstAmtType.GetData() == 3)) //period
	{
		var fg=idGrid.GetGridControl();
		fg.FixedRows    = 2
		fg.MergeCells   = 5
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 4, 0, 5) = "Beginning Balance(Book)"  
		fg.Cell(0, 0, 6, 0, 7) = "Beginning Balance(Trans)"  
		fg.Cell(0, 0, 8, 0, 9) = "Period Balance(Book)" 
		fg.Cell(0, 0, 10, 0, 11) = "Period Balance(Trans)"
		fg.Cell(0, 0, 12, 0, 13)  = "Cumulative(Book)"
		fg.Cell(0, 0, 14, 0, 15)  = "Cumulative(Trans)"
		fg.Cell(0, 0, 16, 0, 17) = "Ending Balance(Book)"
		fg.Cell(0, 0, 18, 0, 19) = "Ending Balance(Trans)"
		
		fg.Cell(0, 1, 4, 1) 	= "Debit"
		fg.Cell(0, 1, 5, 1 ) 	= "Credit"
		fg.Cell(0, 1, 6, 1) 	= "Debit"
		fg.Cell(0, 1, 7, 1 ) 	= "Credit"
		fg.Cell(0, 1, 8, 1) 	= "Debit"
		fg.Cell(0, 1, 9, 1 ) 	= "Credit"
		fg.Cell(0, 1, 10, 1) 	= "Debit"
		fg.Cell(0, 1, 11, 1 ) 	= "Credit"
		fg.Cell(0, 1, 12, 1) 	= "Debit"
		fg.Cell(0, 1, 13, 1 ) 	= "Credit"
		fg.Cell(0, 1, 14, 1) 	= "Debit"
		fg.Cell(0, 1, 15, 1 ) 	= "Credit"
		fg.Cell(0, 1, 16, 1) 	= "Debit"
		fg.Cell(0, 1, 17, 1 ) 	= "Credit"
		fg.Cell(0, 1, 18, 1) 	= "Debit"
		fg.Cell(0, 1, 19, 1 ) 	= "Credit"
		
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Ctrl"
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Acc. Code"
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Account Name"
		AppearColTrans();
		AppearColBook();
		idGrid.GetGridControl().ColHidden(12) = false;
		idGrid.GetGridControl().ColHidden(13) = false;
		idGrid.GetGridControl().ColHidden(14) = false;
		idGrid.GetGridControl().ColHidden(15) = false;
	}
}
//------------------------------------------------------------------------------------
function MergeHeaderSum()
{
	if (idGrid_sum.rows < 2)
	{
	    idGrid_sum.AddRow();
	}
	if(lstBalance.GetData() == 1 && lstAmtType.GetData() == 1) //monthly
	{
		var fg=idGrid_sum.GetGridControl();
		fg.FixedRows  = 2
		fg.MergeCells = 4
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 1, 0, 2) = "Beginning Balance(Book)"  
		fg.Cell(0, 0, 3, 0, 4) = "Beginning Balance(Trans)"
		fg.Cell(0, 0, 5, 0, 6) = "Period Balance(Book)" 
		fg.Cell(0, 0, 7, 0, 8) = "Period Balance(Trans)" 
		fg.Cell(0, 0, 9, 0, 10) = "Ending Balance(Book)"
		fg.Cell(0, 0, 11, 0, 12) = "Ending Balance(Trans)"
		
		fg.Cell(0, 1, 1, 1) 	= "Debit"
		fg.Cell(0, 1, 2, 1 ) 	= "Credit"
		fg.Cell(0, 1, 3, 1) 	= "Debit"
		fg.Cell(0, 1, 4, 1 ) 	= "Credit"
		fg.Cell(0, 1, 5, 1) 	= "Debit"
		fg.Cell(0, 1, 6, 1 ) 	= "Credit"
		fg.Cell(0, 1, 7, 1) 	= "Debit"
		fg.Cell(0, 1, 8, 1 ) 	= "Credit"
		fg.Cell(0, 1, 9, 1) 	= "Debit"
		fg.Cell(0, 1, 10, 1 ) 	= "Credit"
		fg.Cell(0, 1, 11, 1) 	= "Debit"
		fg.Cell(0, 1, 12, 1 ) 	= "Credit"
		
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "TOTAL"
		
		
		HideColBookSum();
		AppearColTransSum();
		idGrid_sum.GetGridControl().ColHidden(9) = true;
		idGrid_sum.GetGridControl().ColHidden(10) = true;
		idGrid_sum.GetGridControl().ColHidden(11) = true;
		idGrid_sum.GetGridControl().ColHidden(12) = true;
       
	}
	else if(lstBalance.GetData() == 1 && lstAmtType.GetData() == 2) //monthly
	{
		var fg=idGrid_sum.GetGridControl();
		fg.FixedRows  = 2
		fg.MergeCells = 4
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 1, 0, 2) = "Beginning Balance(Book)"  
		fg.Cell(0, 0, 3, 0, 4) = "Beginning Balance(Trans)"
		fg.Cell(0, 0, 5, 0, 6) = "Period Balance(Book)" 
		fg.Cell(0, 0, 7, 0, 8) = "Period Balance(Trans)" 
		fg.Cell(0, 0, 9, 0, 10) = "Ending Balance(Book)"
		fg.Cell(0, 0, 11, 0, 12) = "Ending Balance(Trans)"
		
		fg.Cell(0, 1, 1, 1) 	= "Debit"
		fg.Cell(0, 1, 2, 1 ) 	= "Credit"
		fg.Cell(0, 1, 3, 1) 	= "Debit"
		fg.Cell(0, 1, 4, 1 ) 	= "Credit"
		fg.Cell(0, 1, 5, 1) 	= "Debit"
		fg.Cell(0, 1, 6, 1 ) 	= "Credit"
		fg.Cell(0, 1, 7, 1) 	= "Debit"
		fg.Cell(0, 1, 8, 1 ) 	= "Credit"
		fg.Cell(0, 1, 9, 1) 	= "Debit"
		fg.Cell(0, 1, 10, 1 ) 	= "Credit"
		fg.Cell(0, 1, 11, 1) 	= "Debit"
		fg.Cell(0, 1, 12, 1 ) 	= "Credit"
		
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "TOTAL"
		HideColTransSum();
		AppearColBookSum();
		idGrid_sum.GetGridControl().ColHidden(9) = true;
		idGrid_sum.GetGridControl().ColHidden(10) = true;
		idGrid_sum.GetGridControl().ColHidden(11) = true;
		idGrid_sum.GetGridControl().ColHidden(12) = true;
	}
	else if(lstBalance.GetData() == 1 && lstAmtType.GetData() == 3) //monthly
	{
		var fg=idGrid_sum.GetGridControl();
		fg.FixedRows  = 2
		fg.MergeCells = 4
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 1, 0, 2) = "Beginning Balance(Book)"  
		fg.Cell(0, 0, 3, 0, 4) = "Beginning Balance(Trans)"
		fg.Cell(0, 0, 5, 0, 6) = "Period Balance(Book)" 
		fg.Cell(0, 0, 7, 0, 8) = "Period Balance(Trans)" 
		fg.Cell(0, 0, 9, 0, 10) = "Ending Balance(Book)"
		fg.Cell(0, 0, 11, 0, 12) = "Ending Balance(Trans)"
		
		fg.Cell(0, 1, 1, 1) 	= "Debit"
		fg.Cell(0, 1, 2, 1 ) 	= "Credit"
		fg.Cell(0, 1, 3, 1) 	= "Debit"
		fg.Cell(0, 1, 4, 1 ) 	= "Credit"
		fg.Cell(0, 1, 5, 1) 	= "Debit"
		fg.Cell(0, 1, 6, 1 ) 	= "Credit"
		fg.Cell(0, 1, 7, 1) 	= "Debit"
		fg.Cell(0, 1, 8, 1 ) 	= "Credit"
		fg.Cell(0, 1, 9, 1) 	= "Debit"
		fg.Cell(0, 1, 10, 1 ) 	= "Credit"
		fg.Cell(0, 1, 11, 1) 	= "Debit"
		fg.Cell(0, 1, 12, 1 ) 	= "Credit"
		
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "TOTAL"
		AppearColTransSum();
		AppearColBookSum();
		
		idGrid_sum.GetGridControl().ColHidden(9) = true;
		idGrid_sum.GetGridControl().ColHidden(10) = true;
		idGrid_sum.GetGridControl().ColHidden(11) = true;
		idGrid_sum.GetGridControl().ColHidden(12) = true;
	}
	else if(lstBalance.GetData() == 2 && lstAmtType.GetData() == 1) //period
	{
		var fg=idGrid_sum.GetGridControl();
		fg.FixedRows  = 2
		fg.MergeCells = 4
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 1, 0, 2) = "Beginning Balance(Book)"  
		fg.Cell(0, 0, 3, 0, 4) = "Beginning Balance(Trans)"
		fg.Cell(0, 0, 5, 0, 6) = "Period Balance(Book)" 
		fg.Cell(0, 0, 7, 0, 8) = "Period Balance(Trans)" 
		fg.Cell(0, 0, 9, 0, 10) = "Cumulative(Book)"
		fg.Cell(0, 0, 11, 0, 12) = "Cumulative(Trans)"
		fg.Cell(0, 0, 13, 0, 14) = "Ending Balance(Book)"
		fg.Cell(0, 0, 15, 0, 16) = "Ending Balance(Trans)"
		
		fg.Cell(0, 1, 1, 1) 	= "Debit"
		fg.Cell(0, 1, 2, 1 ) 	= "Credit"
		fg.Cell(0, 1, 3, 1) 	= "Debit"
		fg.Cell(0, 1, 4, 1 ) 	= "Credit"
		fg.Cell(0, 1, 5, 1) 	= "Debit"
		fg.Cell(0, 1, 6, 1 ) 	= "Credit"
		fg.Cell(0, 1, 7, 1) 	= "Debit"
		fg.Cell(0, 1, 8, 1 ) 	= "Credit"
		fg.Cell(0, 1, 9, 1) 	= "Debit"
		fg.Cell(0, 1, 10, 1 ) 	= "Credit"
		fg.Cell(0, 1, 11, 1) 	= "Debit"
		fg.Cell(0, 1, 12, 1 ) 	= "Credit"
		fg.Cell(0, 1, 13, 1) 	= "Debit"
		fg.Cell(0, 1, 14, 1 ) 	= "Credit"
		fg.Cell(0, 1, 15, 1) 	= "Debit"
		fg.Cell(0, 1, 16, 1 ) 	= "Credit"
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0)  = "TOTAL"
		HideColBookSum();
		AppearColTransSum();
		idGrid_sum.GetGridControl().ColHidden(9) = true;
		idGrid_sum.GetGridControl().ColHidden(10) = true;
		idGrid_sum.GetGridControl().ColHidden(11) = false;
		idGrid_sum.GetGridControl().ColHidden(12) = false;
	}
	else if(lstBalance.GetData() == 2 && lstAmtType.GetData() == 2) //period
	{
		var fg=idGrid_sum.GetGridControl();
		fg.FixedRows  = 2
		fg.MergeCells = 4
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 1, 0, 2) = "Beginning Balance(Book)"  
		fg.Cell(0, 0, 3, 0, 4) = "Beginning Balance(Trans)"
		fg.Cell(0, 0, 5, 0, 6) = "Period Balance(Book)" 
		fg.Cell(0, 0, 7, 0, 8) = "Period Balance(Trans)" 
		fg.Cell(0, 0, 9, 0, 10) = "Cumulative(Book)"
		fg.Cell(0, 0, 11, 0, 12) = "Cumulative(Trans)"
		fg.Cell(0, 0, 13, 0, 14) = "Ending Balance(Book)"
		fg.Cell(0, 0, 15, 0, 16) = "Ending Balance(Trans)"
		
		fg.Cell(0, 1, 1, 1) 	= "Debit"
		fg.Cell(0, 1, 2, 1 ) 	= "Credit"
		fg.Cell(0, 1, 3, 1) 	= "Debit"
		fg.Cell(0, 1, 4, 1 ) 	= "Credit"
		fg.Cell(0, 1, 5, 1) 	= "Debit"
		fg.Cell(0, 1, 6, 1 ) 	= "Credit"
		fg.Cell(0, 1, 7, 1) 	= "Debit"
		fg.Cell(0, 1, 8, 1 ) 	= "Credit"
		fg.Cell(0, 1, 9, 1) 	= "Debit"
		fg.Cell(0, 1, 10, 1 ) 	= "Credit"
		fg.Cell(0, 1, 11, 1) 	= "Debit"
		fg.Cell(0, 1, 12, 1 ) 	= "Credit"
		fg.Cell(0, 1, 13, 1) 	= "Debit"
		fg.Cell(0, 1, 14, 1 ) 	= "Credit"
		fg.Cell(0, 1, 15, 1) 	= "Debit"
		fg.Cell(0, 1, 16, 1 ) 	= "Credit"
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0)  = "TOTAL"
		HideColTransSum();
		AppearColBookSum();
		idGrid_sum.GetGridControl().ColHidden(9) = false;
		idGrid_sum.GetGridControl().ColHidden(10) = false;
		idGrid_sum.GetGridControl().ColHidden(11) = true;
		idGrid_sum.GetGridControl().ColHidden(12) = true;
	}	
	else if(lstBalance.GetData() == 2 && lstAmtType.GetData() == 3) //period
	{
		var fg=idGrid_sum.GetGridControl();
		fg.FixedRows  = 2
		fg.MergeCells = 4
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 1, 0, 2) = "Beginning Balance(Book)"  
		fg.Cell(0, 0, 3, 0, 4) = "Beginning Balance(Trans)"
		fg.Cell(0, 0, 5, 0, 6) = "Period Balance(Book)" 
		fg.Cell(0, 0, 7, 0, 8) = "Period Balance(Trans)" 
		fg.Cell(0, 0, 9, 0, 10) = "Cumulative(Book)"
		fg.Cell(0, 0, 11, 0, 12) = "Cumulative(Trans)"
		fg.Cell(0, 0, 13, 0, 14) = "Ending Balance(Book)"
		fg.Cell(0, 0, 15, 0, 16) = "Ending Balance(Trans)"
		
		fg.Cell(0, 1, 1, 1) 	= "Debit"
		fg.Cell(0, 1, 2, 1 ) 	= "Credit"
		fg.Cell(0, 1, 3, 1) 	= "Debit"
		fg.Cell(0, 1, 4, 1 ) 	= "Credit"
		fg.Cell(0, 1, 5, 1) 	= "Debit"
		fg.Cell(0, 1, 6, 1 ) 	= "Credit"
		fg.Cell(0, 1, 7, 1) 	= "Debit"
		fg.Cell(0, 1, 8, 1 ) 	= "Credit"
		fg.Cell(0, 1, 9, 1) 	= "Debit"
		fg.Cell(0, 1, 10, 1 ) 	= "Credit"
		fg.Cell(0, 1, 11, 1) 	= "Debit"
		fg.Cell(0, 1, 12, 1 ) 	= "Credit"
		fg.Cell(0, 1, 13, 1) 	= "Debit"
		fg.Cell(0, 1, 14, 1 ) 	= "Credit"
		fg.Cell(0, 1, 15, 1) 	= "Debit"
		fg.Cell(0, 1, 16, 1 ) 	= "Credit"
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0)  = "TOTAL"
		AppearColTransSum();
		AppearColBookSum();
		idGrid_sum.GetGridControl().ColHidden(9) = false;
		idGrid_sum.GetGridControl().ColHidden(10) = false;
		idGrid_sum.GetGridControl().ColHidden(11) = false;
		idGrid_sum.GetGridControl().ColHidden(12) = false;
	}		
}
//------------------------------------------------------------------------------------
function onReport()
{
    if (confirm("Do you want to print report ?"))
   { 
        var _check = 0;
      
        var url = '/standard/reports/gf/ka/gfka00370.aspx?company_pk='+ lstCompany.value + '&dtfrom=' + dtfrmonth.value;
	    url =   url + '&dtto=' + dttomonth.value + '&status='+ lstStatus.value + '&ccy=' + lstCurrent.value + '&rate=';
	    url =   url + txtrate1.text + '&level=' + lstLevel.value + '&post=' + lstPostSum.value + '&accd=' + txtac_cd.text;
	    url =   url + '&rptType=' + lstBalance.value + '&language=' + lstLang.value + '&check=' + _check + '&acctype=' + lstAccType.value;
	    System.OpenTargetPage( System.RootURL+url , "newform" );
	}    
}
//------------------------------------------------------------------------------------
function onSetColor()
{
    var ctrl = idGrid.GetGridControl();
    for (i = 1; i < ctrl.Rows; i++)
	{
	    
	    if(idGrid.GetGridData(i,20)== "B")
        {
	        ctrl.Cell(14, i, 1, i, 21) = false;
	        idGrid.SetCellBold(i, 1, i, 21, true);
        }
        else if (idGrid.GetGridData(i,20)== "I")
        {
	        idGrid.SetCellBold(i, 1, i, 21, false);
	        ctrl.Cell(14, i, 1, i, 21) = true; // Chu nghieng
	    }
	    else
	    {
	        ctrl.Cell(14, i, 1, i, 21) = false;
	        idGrid.SetCellBold(i, 1, i, 21, false);
	    }
	    idGrid.SetCellBgColor(i, 0, i, 21, Number(idGrid.GetGridData(i, 21)));
	}
	MergeHeader();
	if(lstBalance.GetData() == 1)
    {
	    txt_check.text = 3;
	    dso_sel_trial_balance_monthly_sum.Call('SELECT');
	}
	
	else if(lstBalance.GetData() == 2)
	{
	    txt_check.text = 1;
	    dso_sel_trial_balance_sum.Call('SELECT');
	}
}
//------------------------------------------------------------------------------------
function onMergeSum()
{
    MergeHeaderSum();
    idGrid_sum.SetGridText(2, 0, '');   
}
//------------------------------------------------------------------------------------
function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise
}
//------------------------------------------------------------------------------------
function onEnter()
{
    dso_pro_acc.Call();
}
//------------------------------------------------------------------------------------
function OnChangeList()
{
    dso_pro_acc.Call();
}
//------------------------------------------------------------------------------------
function OnChangeCurrent()
{
    dso_get_rate.Call();
}
//------------------------------------------------------------------------------------
function Reset_Acc()
{
    txtac_cd.text = "";
    txtac_nm.text = "";
    txtac_pk.text = "";
}
//------------------------------------------------------------------------------------
function Popup_Acc()
{
    var fpath = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=AC_SEL_ACCT_POPUP";
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
//------------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------------
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
			var fpath   = System.RootURL + '/standard/forms/gf/ka/gfka00100_popup.aspx?ac_pk='+ ac_pk + '&ac_nm=' + ac_nm + '&compk=' + lstCompany.GetData() + '&status=' + lstStatus.GetData() + '&lang='+ lstLang.GetData() + '&cur=' + lstCurrent.GetData() + '&date_fr=' + dtfrmonth.GetData() + '&date_to=' + dttomonth.GetData() + '&type_month=' + lstBalance.GetData();
			    fpath = fpath + '&ac_cd=' + idGrid.GetGridData(ctrl.row, 21) + '&ad_nm1=' + idGrid.GetGridData(ctrl.row, 22) ;
			var wWidth  = 950;
			var wHeight = 500;
			var x = Math.round((screen.availWidth - wWidth)/2);
			var y = Math.round((screen.availHeight - wHeight)/2);
			
			var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
			   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
			   "lef="+ x +",top=" + y;
			
			var object = System.OpenModal(fpath, wWidth, wHeight, features);
	    }
    }
}
//------------------------------------------------------------------------------------
function OnChangeRadio()
{
    onSearch();
}

</script>
<body style="margin:0; padding:0;">
    <gw:data id="dso_sel_trial_balance" onreceive="onSetColor()">
        <xml>
            <dso type="grid" function="sp_sel_gfka00350" >
                <input bind="idGrid">
                    <input bind="lstCompany"/>
                    <input bind="lstLang"/>
                    <input bind="dtfrmonth"/>
                    <input bind="dttomonth"/>
                    <input bind="lstStatus"/>
                    <input bind="lstCurrent"/>
                    <input bind="txtrate1"/>
                    <input bind="lstLevel"/>
                    <input bind="lstPostSum"/>
                    <input bind="txtac_cd"/>
                    <input bind="txt_check"/>
                    <input bind="lstAccType"/>
                </input>
                <output bind="idGrid"/>
            </dso>
        </xml>
    </gw:data>
<!------------------------------------------------------------------------->
    <gw:data id="dso_sel_trial_balance_sum" onreceive="onMergeSum()">
        <xml>
            <dso type="grid" function="sp_sel_gfka00350_1" >
                <input bind="idGrid_sum">
                    <input bind="lstCompany"/>
                    <input bind="lstLang"/>
                    <input bind="dtfrmonth"/>
                    <input bind="dttomonth"/>
                    <input bind="lstStatus"/>
                    <input bind="lstCurrent"/>
                    <input bind="txtrate1"/>
                    <input bind="lstLevel"/>
                    <input bind="lstPostSum"/>
                    <input bind="txtac_cd"/>
                    <input bind="txt_check"/>
                    <input bind="lstAccType"/>
                </input>
                <output bind="idGrid_sum"/>
            </dso>
        </xml>
    </gw:data>
<!------------------------------------------------------------------------->    
    <gw:data id="dso_sel_trial_balance_monthly" onreceive="onSetColor()">
        <xml>
            <dso type="grid" function="sp_sel_gfka00350" >
                <input bind="idGrid">
                    <input bind="lstCompany"/>
                    <input bind="lstLang"/>
                    <input bind="dtfrmonth"/>
                    <input bind="dttomonth"/>
                    <input bind="lstStatus"/>
                    <input bind="lstCurrent"/>
                    <input bind="txtrate1"/>
                    <input bind="lstLevel"/>
                    <input bind="lstPostSum"/>
                    <input bind="txtac_cd"/>
                    <input bind="txt_check"/>
                    <input bind="lstAccType"/>
                </input>
                <output bind="idGrid"/>
            </dso>
        </xml>
    </gw:data>
<!------------------------------------------------------------------------->    
    <gw:data id="dso_sel_trial_balance_monthly_sum" onreceive="onMergeSum()">
        <xml>
            <dso type="grid" function="sp_sel_gfka00350_1" >
                <input bind="idGrid_sum">
                    <input bind="lstCompany"/>
                    <input bind="lstLang"/>
                    <input bind="dtfrmonth"/>
                    <input bind="dttomonth"/>
                    <input bind="lstStatus"/>
                    <input bind="lstCurrent"/>
                    <input bind="txtrate1"/>
                    <input bind="lstLevel"/>
                    <input bind="lstPostSum"/>
                    <input bind="txtac_cd"/>
                    <input bind="txt_check"/>
                    <input bind="lstAccType"/>
                </input>
                <output bind="idGrid_sum"/>
            </dso>
        </xml>
    </gw:data>
<!------------------------------------------------------------------------->    
    <gw:data id="dso_pro_acc" onreceive="onSearch()">
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
    </gw:data>
<!------------------------------------------------------------------------->    
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
<!------------------------------------------------------------------------->    
<table width="100%" cellpadding="0" cellspacing="0" border="1">
<tr>
    <td width="100%">
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
	        <td width="5%"></td>
	        <td width="24%"></td>
	        <td width="5%"></td>
	        <td width="11%"></td>
	        <td width="8%"></td> 
	        <td width="13%"></td>
	        <td width="7%"></td>
	        <td width="13%"></td>
	        <td width="5%"></td>
	        <td width="9%"></td>
	        
	    </tr>
	    <tr>
	        <td align="right">Company&nbsp;</td>
            <td><gw:list id="lstCompany" onChange ="onSearch()" styles='width:100%'></gw:list></td>
            <td align="right">Amt.Type</td>
            <td><gw:list id="lstAmtType" onChange ="onSearch()"  styles='width:100%'></gw:list></td>
            <td align="right">Financial Statement</td>
            <td><gw:list id="lstFinancial" onChange="OnChangeList()" /></td>
            <td align="right">Language&nbsp;</td>
            <td><gw:list id="lstLang" onChange="OnChangeList()" /></td>
            <td align="right">Balance</td>
			<td colspan="2"><gw:list id="lstBalance" onchange="OnChangeRadio()" /></td>
	    </tr>
	     <tr>
	        <td>Month</td>
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
            
                    <td align="right">Status</td>
                    <td><gw:list id="lstStatus" onchange="onSearch()"/> 
					</td>       
            <td align="right">Current</td>
            <td><gw:list id="lstCurrent" onChange="OnChangeCurrent()"  styles='width:100%'></gw:list></td>
            <td align="right"><a title="Click here to select Ex.Rate" onclick="Popup_Cur()" href="#tips" style="text-decoration: none; color=#0000ff"><b>Ex.Rate</b></a></td>
            <td > <gw:textbox id="txtrate"  styles='width:20%' type="number" format="###,###.##R" /> <gw:textbox id="txtrate1" styles='width:80%' type="number" format="###,###.##R" onenterkey="onSearch()"/></td>
            <td align="right">Level&nbsp;</td>
	        <td colspan="2"><gw:list id="lstLevel" onChange="OnChangeList()"  /></td>
	    </tr>
	     <tr>
	        <td align="right"><a title="Click here to select Ex.Rate" onclick="Popup_Acc()" href="#tips" style="text-decoration: none; color=#0000ff"><b>Acc.Code&nbsp;</b></a></td>
	        <td colspan="3">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="35%"><gw:textbox id="txtac_cd" styles='width:100%' onkeypress="CheckNumeric()" onenterkey="onEnter()"/></td>
                    <td width="60%"><gw:textbox id="txtac_nm" styles='width:100%'/></td>
                    <td width="0%"><gw:textbox  id="txtac_pk" styles='display:none'/></td>
                    <td width="5%"><gw:imgBtn   img="reset"	id="idResetAcc"  alt="Reset" onclick="Reset_Acc()"/></td>
                </tr>
                </table>
	        </td>
                    <td >Posting/Summary&nbsp;</td>
                    <td ><gw:list id="lstPostSum" onChange="OnChangeList()" /></td>
            <td align="right">Acc.Type</td>
            <td colspan="2"><gw:list id="lstAccType" onChange ="onSearch()"  styles='width:100%'></gw:list></td>
           <td align="right"><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"        onclick="onSearch()"/></td>
           <td ><gw:imgBtn id="ibtnReport" img="printer"   alt="Print"  onclick="onReport()"/></td>
	    </tr>
	    </table>
	</td>
</tr>
<tr>
	<td width="100%">
	    <table width="100%" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <!--0.Ctrl|1_PK|2.Account Name|3.Begin Bal(Debt)|4.Begin Bal(Cret)|5.Debit|6.Credit|7.cal bal(Debt)|8.cal bal(Cret)|9.Ending bal(Debt)|10.Ending bal(Cret)|11_B|12_COLOR|13_ac_cd|14_ac_nm-->
            <td>
                <gw:grid   
				    id="idGrid"  
				    header="Ctrl|_PK|Acc. Code|Account Name|Begin Bal(Debt)|Begin Bal(Cret)|Debit|Credit|cal bal(Debt)|cal bal(Cret)|Ending bal(Debt)|Ending bal(Cret)|Beginbal(Book)|Period_(Book)|ending_bal_(Book)|Cal_bal_(Book)|qq|qq2|qqq|qq3|_B|_COLOR|_ac_cd|_ac_nm"
				    format="3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
 			        aligns="1|1|2|2|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|0|0"
				    defaults="||||||||||||||||||||||||"  
				    editcol="1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
				    widths="400|0|800|2500|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|0|0|0|0"  
				    styles="width:100%; height:340"
				    sorting="T"
				    oncelldblclick="OnPopupDailySL()"
				    /> 
            </td>
        </tr>
        <tr>
            <td>
                <gw:grid   
				id="idGrid_sum"
				header="Total|Begin Bal(Debt)|Begin Bal(Cret)|Debit|Credit|cal bal(Debt)|cal bal(Cret)|Ending bal(Debt)|Ending bal(Cret)|Begin Bal(Debt_Trans)|Begin Bal(Cret_Trans)|Begin Bal(Cret_Trans)|Begin Bal(Cret_Trans)|Begin Bal(Cret_Trans)|Begin Bal(Cret_Trans)|Begin Bal(Cret_Trans)|Begin Bal(Cret_Trans)"   
				format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
 			    aligns="1|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3"
				defaults="||||||||||||||||"
				editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				widths="3400|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800"  
				styles="width:100%; height:73"   
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

</body>
</html>

