<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>

<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 
<script>
var G_Ctrl = 0,
	G_PK = 1,
	G_Acc_Nm_Eng = 2,
	G_Acc_Nm_Vie = 3,
	G_Acc_Nm_Kor = 4,
	G_BeginBal_Dr = 5,
	G_BeginBal_Cr = 6,
	G_BeginBal_Trans_Dr = 7,
	G_BeginBal_Trans_Cr = 8,
	G_Period_Dr = 9,
	G_Period_Cr = 10,
	G_Period_Trans_Dr = 11,
	G_Period_Trans_Cr = 12,
	G_Cumula_Dr = 13,
	G_Cumula_Cr = 14,
	G_Cumula_Trans_Dr = 15,
	G_Cumula_Trans_Cr = 16,
	G_EndBal_Dr = 17,
	G_EndBal_Cr = 18,
	G_EndBal_Trans_Dr = 19,
	G_EndBal_Trans_Cr = 20,
	G_Font = 21,
	G_Color = 22,
	G_Acc_Cd = 23,
	G_Acc_Nm = 24;
	
	
var GS_Total = 0,
	GS_BeginBal_Dr = 1,
	GS_BeginBal_Cr = 2,
	GS_BeginBal_Trans_Dr = 3,
	GS_BeginBal_Trans_Cr = 4,
	GS_Period_Dr = 5,
	GS_Period_Cr = 6,
	GS_Period_Trans_Dr = 7,
	GS_Period_Trans_Cr = 8,
	GS_Cumula_Dr = 9,
	GS_Cumula_Cr = 10,
	GS_Cumula_Trans_Dr = 11,
	GS_Cumula_Trans_Cr = 12,
	GS_EndBal_Dr = 13,
	GS_EndBal_Cr = 14;
	GS_EndBal_Trans_Dr = 15,
	GS_EndBal_Trans_Cr = 16;
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
	var ls_bookccy  =  "<%=CtlLib.SetListDataSQL("select code, b.code from tac_commcode_master a, tac_commcode_detail b where a.pk = b.tac_commcode_master_pk and a.id = 'ACBG0040' and a.del_if = 0 and b.del_if = 0 and b.def_yn ='Y'")%>";
    lstAccType.SetDataText(dataAccType); 
	var dataAmtType = "Data|1|Transaction|2|Book|3|Trans & Book"; 
	lstAmtType.SetDataText(dataAmtType);
	lstAmtType.value=2;
	ls_data      = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
	lstCurrent.SetDataText(ls_data);
	lstBookCcy.SetDataText(ls_bookccy);
    var dataStatus = "Data|0|Approved|2|Confirmed"; 
    lstStatus.SetDataText(dataStatus); 
    lstStatus.SetDataText("2"); 
    txt_date.SetDataText(ls_date);
    lstCompany.SetDataText(ls_company);
   txtrate.SetDataText("1");
    txtrate.SetEnable(false);
    lstLang.SetDataText(ls_lang);
    lstLevel.SetDataText(ls_level);
    lstPostSum.SetDataText(ls_possum);
    MergeHeader();
    MergeHeaderSum();
    txtac_nm.SetEnable(false);
    lstLevel.SetDataText("");
    lstPostSum.SetDataText("");
    idGrid.GetGridControl().FrozenCols = G_BeginBal_Dr;
    idGrid_sum.GetGridControl().FrozenCols = GS_BeginBal_Dr;
    txtac_cd.GetControl().focus();
    OnLang();
	OnChangeMonth();
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	dso_getCompany.Call();
        
}

function OnChangeCurrent()
{
    dso_get_rate.Call();
}

function OnLang()
{
    if(lstLang.value == 'ENG')
    {
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Eng) = false;
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Vie) = true;
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Kor) = true;
    }
    else if(lstLang.value == 'VIE')
    {
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Eng) = true;
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Vie) = false;
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Kor) = true;
    }
    else if(lstLang.value == 'KOR')
    {
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Eng) = true;
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Vie) = true;
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Kor) = false;
    }
    else if(lstLang.value == 'ENG-KOR')
    {
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Eng) = false;
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Vie) = true;
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Kor) = false;
    }
    else if(lstLang.value == 'ENG-VIE')
    {
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Eng) = false;
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Vie) = false;
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Kor) = true;
    }
    else if(lstLang.value == 'ENG-VIE-KOR')
    {
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Eng) = false;
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Vie) = false;
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Kor) = false;
    }
    else if(lstLang.value == 'KOR-VIE')
    {
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Eng) = true;
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Vie) = false;
        idGrid.GetGridControl().ColHidden(G_Acc_Nm_Kor) = false;
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

function MergeHeader()
{
	MergeHeaderSum();
	if (idGrid.rows < 2)
	{
	    idGrid.AddRow();
	}
	
	
	var fg=idGrid.GetGridControl();
		fg.FixedRows    = 2
		fg.MergeCells   = 5
		fg.MergeRow(G_Ctrl) = true
		fg.Cell(0, 0, G_BeginBal_Dr, 0, G_BeginBal_Cr) = "Beginning Balance(Book)"  
		fg.Cell(0, 0, G_BeginBal_Trans_Dr, 0, G_BeginBal_Trans_Cr) = "Beginning Balance(Trans)"  
		fg.Cell(0, 0, G_Period_Dr, 0, G_Period_Cr) = "Period Balance(Book)" 
		fg.Cell(0, 0, G_Period_Trans_Dr, 0, G_Period_Trans_Cr) = "Period Balance(Trans)"
		fg.Cell(0, 0, G_Cumula_Dr, 0, G_Cumula_Cr)  = "Cumulative(Book)"
		fg.Cell(0, 0, G_Cumula_Trans_Dr, 0, G_Cumula_Trans_Cr)  = "Cumulative(Trans)"
		fg.Cell(0, 0, G_EndBal_Dr, 0, G_EndBal_Cr) = "Ending Balance(Book)"
		fg.Cell(0, 0, G_EndBal_Trans_Dr, 0, G_EndBal_Trans_Cr) = "Ending Balance(Trans)"
		
		fg.Cell(0, 1, G_BeginBal_Dr, 1) 	= "Debit"
		fg.Cell(0, 1, G_BeginBal_Cr, 1 ) 	= "Credit"
		fg.Cell(0, 1, G_BeginBal_Trans_Dr, 1) 	= "Debit"
		fg.Cell(0, 1, G_BeginBal_Trans_Cr, 1 ) 	= "Credit"
		fg.Cell(0, 1, G_Period_Dr, 1) 	= "Debit"
		fg.Cell(0, 1, G_Period_Cr, 1 ) 	= "Credit"
		fg.Cell(0, 1, G_Period_Trans_Dr, 1) 	= "Debit"
		fg.Cell(0, 1, G_Period_Trans_Cr, 1 ) 	= "Credit"
		fg.Cell(0, 1, G_Cumula_Dr, 1) 	= "Debit"
		fg.Cell(0, 1, G_Cumula_Cr, 1 ) 	= "Credit"
		fg.Cell(0, 1, G_Cumula_Trans_Dr, 1) 	= "Debit"
		fg.Cell(0, 1, G_Cumula_Trans_Cr, 1 ) 	= "Credit"
		fg.Cell(0, 1, G_EndBal_Dr, 1) 	= "Debit"
		fg.Cell(0, 1, G_EndBal_Cr, 1 ) 	= "Credit"
		fg.Cell(0, 1, G_EndBal_Trans_Dr, 1) 	= "Debit"
		fg.Cell(0, 1, G_EndBal_Trans_Cr, 1 ) 	= "Credit"
		
		
		fg.MergeCol(G_Ctrl) = true
		fg.Cell(0, 0, G_Ctrl, 1, G_Ctrl) = "Ctrl"
		fg.MergeCol(G_Acc_Nm_Eng) = true
		fg.Cell(0, 0, G_Acc_Nm_Eng, 1, G_Acc_Nm_Eng) = "Account Name"
        fg.MergeCol(G_Acc_Nm_Vie) = true
		fg.Cell(0, 0, G_Acc_Nm_Vie, 1, G_Acc_Nm_Vie) = "Account Name (Local)"
        fg.MergeCol(G_Acc_Nm_Kor) = true
		fg.Cell(0, 0, G_Acc_Nm_Kor, 1, G_Acc_Nm_Kor) = "Account Name (Kor)"
		/*idGrid.GetGridControl().ColHidden(13) = false;
		idGrid.GetGridControl().ColHidden(14) = false;
		idGrid.GetGridControl().ColHidden(15) = true;
		idGrid.GetGridControl().ColHidden(16) = true;	
	*/
	
	if(lstAmtType.value=='1')//trans
	{
		fg.ColHidden(G_BeginBal_Dr) = true;
		fg.ColHidden(G_BeginBal_Cr) = true;
		fg.ColHidden(G_Period_Dr) = true;
		fg.ColHidden(G_Period_Cr) = true;
		fg.ColHidden(G_Cumula_Dr) = true;
		fg.ColHidden(G_Cumula_Cr) = true;
		fg.ColHidden(G_EndBal_Dr) = true;
		fg.ColHidden(G_EndBal_Cr) = true;
		
		fg.ColHidden(G_BeginBal_Trans_Dr) = false;
		fg.ColHidden(G_BeginBal_Trans_Cr) = false;
		fg.ColHidden(G_Period_Trans_Dr) = false;
		fg.ColHidden(G_Period_Trans_Cr) = false;
		fg.ColHidden(G_Cumula_Trans_Dr) = true;
		fg.ColHidden(G_Cumula_Trans_Cr) = true;
		fg.ColHidden(G_EndBal_Trans_Dr) = false;
		fg.ColHidden(G_EndBal_Trans_Cr) = false;
	}
	else if(lstAmtType.value=='2')//book
	{
		fg.ColHidden(G_BeginBal_Trans_Dr) = true;
		fg.ColHidden(G_BeginBal_Trans_Cr) = true;
		fg.ColHidden(G_Period_Trans_Dr) = true;
		fg.ColHidden(G_Period_Trans_Cr) = true;
		fg.ColHidden(G_Cumula_Trans_Dr) = true;
		fg.ColHidden(G_Cumula_Trans_Cr) = true;
		fg.ColHidden(G_EndBal_Trans_Dr) = true;
		fg.ColHidden(G_EndBal_Trans_Cr) = true;
		
		fg.ColHidden(G_BeginBal_Dr) = false;
		fg.ColHidden(G_BeginBal_Cr) = false;
		fg.ColHidden(G_Period_Dr) = false;
		fg.ColHidden(G_Period_Cr) = false;
		fg.ColHidden(G_Cumula_Dr) = true;
		fg.ColHidden(G_Cumula_Cr) = true;
		fg.ColHidden(G_EndBal_Dr) = false;
		fg.ColHidden(G_EndBal_Cr) = false;
	}
	else
	{
		fg.ColHidden(G_BeginBal_Trans_Dr) = false;
		fg.ColHidden(G_BeginBal_Trans_Cr) = false;
		fg.ColHidden(G_Period_Trans_Dr) = false;
		fg.ColHidden(G_Period_Trans_Cr) = false;
		fg.ColHidden(G_Cumula_Trans_Dr) = true;
		fg.ColHidden(G_Cumula_Trans_Cr) = true;
		fg.ColHidden(G_EndBal_Trans_Dr) = false;
		fg.ColHidden(G_EndBal_Trans_Cr) = false;
		fg.ColHidden(G_BeginBal_Dr) = false;
		fg.ColHidden(G_BeginBal_Cr) = false;
		fg.ColHidden(G_Period_Dr) = false;
		fg.ColHidden(G_Period_Cr) = false;
		fg.ColHidden(G_Cumula_Dr) = true;
		fg.ColHidden(G_Cumula_Cr) = true;
		fg.ColHidden(G_EndBal_Dr) = false;
		fg.ColHidden(G_EndBal_Cr) = false;
	}
	
		if(lstBookCcy.GetData() == "VND")
        {
            fg.ColFormat(G_BeginBal_Dr) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(G_BeginBal_Cr) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(G_BeginBal_Trans_Dr) = "#,###,###,###,###,###,###R";
            fg.ColFormat(G_BeginBal_Trans_Cr) = "#,###,###,###,###,###,###R";
			fg.ColFormat(G_Period_Dr) = "#,###,###,###,###,###,###R";
			fg.ColFormat(G_Period_Cr) = "#,###,###,###,###,###,###R";
			fg.ColFormat(G_Period_Trans_Dr) = "#,###,###,###,###,###,###R";
			fg.ColFormat(G_Period_Trans_Cr) = "#,###,###,###,###,###,###R";
			fg.ColFormat(G_Cumula_Dr) = "#,###,###,###,###,###,###R";
			fg.ColFormat(G_Cumula_Cr) = "#,###,###,###,###,###,###R";
			fg.ColFormat(G_Cumula_Trans_Dr) = "#,###,###,###,###,###,###R";
			fg.ColFormat(G_Cumula_Trans_Cr) = "#,###,###,###,###,###,###R";
			fg.ColFormat(G_EndBal_Dr) = "#,###,###,###,###,###,###R";
			fg.ColFormat(G_EndBal_Cr) = "#,###,###,###,###,###,###R";
			fg.ColFormat(G_EndBal_Trans_Dr) = "#,###,###,###,###,###,###R";
			fg.ColFormat(G_EndBal_Trans_Cr) = "#,###,###,###,###,###,###R";
        }
        else
        {
            fg.ColFormat(G_BeginBal_Dr) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(G_BeginBal_Cr) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(G_BeginBal_Trans_Dr) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(G_BeginBal_Trans_Cr) = "#,###,###,###,###,###,###.##R";
			fg.ColFormat(G_Period_Dr) = "#,###,###,###,###,###,###.##R";
			fg.ColFormat(G_Period_Cr) = "#,###,###,###,###,###,###.##R";
			fg.ColFormat(G_Period_Trans_Dr) = "#,###,###,###,###,###,###.##R";
			fg.ColFormat(G_Period_Trans_Cr) = "#,###,###,###,###,###,###.##R";
			fg.ColFormat(G_Cumula_Dr) = "#,###,###,###,###,###,###.##R";
			fg.ColFormat(G_Cumula_Cr) = "#,###,###,###,###,###,###.##R";
			fg.ColFormat(G_Cumula_Trans_Dr) = "#,###,###,###,###,###,###.##R";
			fg.ColFormat(G_Cumula_Trans_Cr) = "#,###,###,###,###,###,###.##R";
			fg.ColFormat(G_EndBal_Dr) = "#,###,###,###,###,###,###.##R";
			fg.ColFormat(G_EndBal_Cr) = "#,###,###,###,###,###,###.##R";
			fg.ColFormat(G_EndBal_Trans_Dr) = "#,###,###,###,###,###,###.##R";
			fg.ColFormat(G_EndBal_Trans_Cr) = "#,###,###,###,###,###,###.##R";
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
		fg.MergeRow(GS_Total) = true
		fg.Cell(0, 0, GS_BeginBal_Dr, 0, GS_BeginBal_Cr) = "Beginning Balance(Book)"  
		fg.Cell(0, 0, GS_BeginBal_Trans_Dr, 0, GS_BeginBal_Trans_Cr) = "Beginning Balance(Trans)"
		fg.Cell(0, 0, GS_Period_Dr, 0, GS_Period_Cr) = "Period Balance(Book)" 
		fg.Cell(0, 0, GS_Period_Trans_Dr, 0, GS_Period_Trans_Cr) = "Period Balance(Trans)" 
		fg.Cell(0, 0, GS_Cumula_Dr, 0, GS_Cumula_Cr) = "Cumulative(Book)"
		fg.Cell(0, 0, GS_Cumula_Trans_Dr, 0, GS_Cumula_Trans_Cr) = "Cumulative(Trans)"
		fg.Cell(0, 0, GS_EndBal_Dr, 0, GS_EndBal_Cr) = "Ending Balance(Book)"
		fg.Cell(0, 0, GS_EndBal_Trans_Dr, 0, GS_EndBal_Trans_Cr) = "Ending Balance(Trans)"
		
		fg.Cell(0, 1, GS_BeginBal_Dr, 1) 	= "Debit"
		fg.Cell(0, 1, GS_BeginBal_Cr, 1 ) 	= "Credit"
		fg.Cell(0, 1, GS_Period_Dr, 1) 	= "Debit"
		fg.Cell(0, 1, GS_Period_Cr, 1 ) 	= "Credit"
		fg.Cell(0, 1, GS_Cumula_Dr, 1) 	= "Debit"
		fg.Cell(0, 1, GS_Cumula_Cr, 1 ) 	= "Credit"
		fg.Cell(0, 1, GS_EndBal_Dr, 1) 	= "Debit"
		fg.Cell(0, 1, GS_EndBal_Cr, 1 ) 	= "Credit"
		
		fg.Cell(0, 1, GS_BeginBal_Trans_Dr, 1) 	= "Debit"
		fg.Cell(0, 1, GS_BeginBal_Trans_Cr, 1 ) 	= "Credit"
		fg.Cell(0, 1, GS_Period_Trans_Dr, 1) 	= "Debit"
		fg.Cell(0, 1, GS_Period_Trans_Cr, 1 ) 	= "Credit"
		fg.Cell(0, 1, GS_Cumula_Trans_Dr, 1) 	= "Debit"
		fg.Cell(0, 1, GS_Cumula_Trans_Cr, 1 ) 	= "Credit"
		fg.Cell(0, 1, GS_EndBal_Trans_Dr, 1) 	= "Debit"
		fg.Cell(0, 1, GS_EndBal_Trans_Cr, 1 ) 	= "Credit"
		
		fg.MergeCol(GS_Total) = true
		fg.Cell(0, 0, GS_Total, 1, GS_Total)  = "TOTAL"
		
		
		if(lstAmtType.value=='1')//trans
	{
		fg.ColHidden(GS_BeginBal_Dr) = true;
		fg.ColHidden(GS_BeginBal_Cr) = true;
		fg.ColHidden(GS_Period_Dr) = true;
		fg.ColHidden(GS_Period_Cr) = true;
		fg.ColHidden(GS_Cumula_Dr) = true;
		fg.ColHidden(GS_Cumula_Cr) = true;
		fg.ColHidden(GS_EndBal_Dr) = true;
		fg.ColHidden(GS_EndBal_Cr) = true;
		
		fg.ColHidden(GS_BeginBal_Trans_Dr) = false;
		fg.ColHidden(GS_BeginBal_Trans_Cr) = false;
		fg.ColHidden(GS_Period_Trans_Dr) = false;
		fg.ColHidden(GS_Period_Trans_Cr) = false;
		fg.ColHidden(GS_Cumula_Trans_Dr) = true;
		fg.ColHidden(GS_Cumula_Trans_Cr) = true;
		fg.ColHidden(GS_EndBal_Trans_Dr) = false;
		fg.ColHidden(GS_EndBal_Trans_Cr) = false;
	}
	else if(lstAmtType.value=='2')//book
	{
		fg.ColHidden(GS_BeginBal_Trans_Dr) = true;
		fg.ColHidden(GS_BeginBal_Trans_Cr) = true;
		fg.ColHidden(GS_Period_Trans_Dr) = true;
		fg.ColHidden(GS_Period_Trans_Cr) = true;
		fg.ColHidden(GS_Cumula_Trans_Dr) = true;
		fg.ColHidden(GS_Cumula_Trans_Cr) = true;
		fg.ColHidden(GS_EndBal_Trans_Dr) = true;
		fg.ColHidden(GS_EndBal_Trans_Cr) = true;
		
		fg.ColHidden(GS_BeginBal_Dr) = false;
		fg.ColHidden(GS_BeginBal_Cr) = false;
		fg.ColHidden(GS_Period_Dr) = false;
		fg.ColHidden(GS_Period_Cr) = false;
		fg.ColHidden(GS_Cumula_Dr) = true;
		fg.ColHidden(GS_Cumula_Cr) = true;
		fg.ColHidden(GS_EndBal_Dr) = false;
		fg.ColHidden(GS_EndBal_Cr) = false;
	}
	else
	{
		fg.ColHidden(GS_BeginBal_Trans_Dr) = false;
		fg.ColHidden(GS_BeginBal_Trans_Cr) = false;
		fg.ColHidden(GS_Period_Trans_Dr) = false;
		fg.ColHidden(GS_Period_Trans_Cr) = false;
		fg.ColHidden(GS_Cumula_Trans_Dr) = true;
		fg.ColHidden(GS_Cumula_Trans_Cr) = true;
		fg.ColHidden(GS_EndBal_Trans_Dr) = false;
		fg.ColHidden(GS_EndBal_Trans_Cr) = false;
		fg.ColHidden(GS_BeginBal_Dr) = false;
		fg.ColHidden(GS_BeginBal_Cr) = false;
		fg.ColHidden(GS_Period_Dr) = false;
		fg.ColHidden(GS_Period_Cr) = false;
		fg.ColHidden(GS_Cumula_Dr) = true;
		fg.ColHidden(GS_Cumula_Cr) = true;
		fg.ColHidden(GS_EndBal_Dr) = false;
		fg.ColHidden(GS_EndBal_Cr) = false;
	}
		if(lstBookCcy.GetData() == "VND")
        {
            fg.ColFormat(GS_BeginBal_Dr) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(GS_BeginBal_Cr) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(GS_Period_Dr) = "#,###,###,###,###,###,###R";
            fg.ColFormat(GS_Period_Cr) = "#,###,###,###,###,###,###R";
			fg.ColFormat(GS_Cumula_Dr) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(GS_Cumula_Cr) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(GS_EndBal_Dr) = "#,###,###,###,###,###,###R";
            fg.ColFormat(GS_EndBal_Cr) = "#,###,###,###,###,###,###R";
			
			fg.ColFormat(GS_BeginBal_Trans_Dr) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(GS_BeginBal_Trans_Cr) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(GS_Period_Trans_Dr) = "#,###,###,###,###,###,###R";
            fg.ColFormat(GS_Period_Trans_Cr) = "#,###,###,###,###,###,###R";
			fg.ColFormat(GS_Cumula_Trans_Dr) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(GS_Cumula_Trans_Cr) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(GS_EndBal_Trans_Dr) = "#,###,###,###,###,###,###R";
            fg.ColFormat(GS_EndBal_Trans_Cr) = "#,###,###,###,###,###,###R";
        }
        else
        {
            fg.ColFormat(GS_BeginBal_Dr) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(GS_BeginBal_Cr) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(GS_Period_Dr) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(GS_Period_Cr) = "#,###,###,###,###,###,###.##R";
			fg.ColFormat(GS_Cumula_Dr) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(GS_Cumula_Cr) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(GS_EndBal_Dr) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(GS_EndBal_Cr) = "#,###,###,###,###,###,###.##R";
			
			fg.ColFormat(GS_BeginBal_Trans_Dr) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(GS_BeginBal_Trans_Cr) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(GS_Period_Trans_Dr) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(GS_Period_Trans_Cr) = "#,###,###,###,###,###,###.##R";
			fg.ColFormat(GS_Cumula_Trans_Dr) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(GS_Cumula_Trans_Cr) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(GS_EndBal_Trans_Dr) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(GS_EndBal_Trans_Cr) = "#,###,###,###,###,###,###.##R";
        }
}

function onReport()
{
   
        var _check = 0;
      
        var url = '/standard/reports/60/08/rpt_60080050_Trial_balance.aspx?p_tco_company_pk='+ lstCompany.value + '&p_lang='+ lstLang.value + '&p_date_fr=' +dtFrom.value+ '&p_date_to=' +  dtTo.value  + '&p_status='+ lstStatus.value + '&p_level=' + lstLevel.value + '&p_possum=' + lstPostSum.value + '&p_accd=' + txtac_cd.text + '&p_pacctype=' + lstAccType.value+ '&p_ccy=' + lstCurrent.value+ '&p_ex_rate=' + txtrate1.text;
	    System.OpenTargetPage( System.RootURL+url , "newform" );
	   
}

function onSetColor()
{
    var ctrl = idGrid.GetGridControl();
    for (i = 1; i < ctrl.Rows; i++)
	{
	    
	    if(idGrid.GetGridData(i,G_Font)== "B")
        {
	        ctrl.Cell(14, i, 1, i, 20) = false;
	        idGrid.SetCellBold(i, G_Ctrl, i, G_Acc_Nm, true);
        }
        else if (idGrid.GetGridData(i,G_Font)== "I")
        {
	        idGrid.SetCellBold(i, G_Ctrl, i, G_EndBal_Trans_Cr, false);
	        ctrl.Cell(14, i, 1, i, 20) = true; // Chu nghieng
	    }
	    else
	    {
	        ctrl.Cell(14, i, 1, i, 20) = false;
	        idGrid.SetCellBold(i, G_Ctrl, i, G_Acc_Nm, false);
	    }
	    idGrid.SetCellBgColor(i, G_Ctrl, i, G_Acc_Nm, Number(idGrid.GetGridData(i, G_Color)));
	}
	MergeHeader();
	auto_resize_column(idGrid,0,idGrid.cols-1,9);
	    txt_check.text = 1;
	    dso_sel_trial_balance_sum.Call('SELECT');
	
}

function onMergeSum()
{
    MergeHeaderSum();
    idGrid_sum.SetGridText(2, 0, '');   
	auto_resize_column(idGrid_sum,0,idGrid_sum.cols-1,9);
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
    o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;scroll:no;');	
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
			var ac_pk   = idGrid.GetGridData(ctrl.row, G_PK);
			var ac_nm   = idGrid.GetGridData(ctrl.row, G_Acc_Nm_Eng);
			var fpath   = System.RootURL + '/standard/forms/60/08/60080050_p1.aspx?ac_pk='+ ac_pk + '&ac_nm=' + ac_nm + '&compk=' + lstCompany.GetData() + '&status=' + lstStatus.GetData() + '&lang='+ lstLang.GetData() + '&cur=ALL' +  '&date_fr=' + dtFrom.GetData() + '&date_to=' + dtTo.GetData() + '&type_month=';
			//    alert(fpath);
				fpath = fpath + '&ac_cd=' + idGrid.GetGridData(ctrl.row, G_Acc_Cd) + '&ad_nm1=' + idGrid.GetGridData(ctrl.row, G_Acc_Nm) ;
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
function auto_resize_column(obj,col1,col2,font_size)
{
    if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
</script>
<body style="margin:0; padding:0;">
	<!------------------------------------------------------------------------>
 <gw:data id="dso_getCompany" onreceive="OnChangeCurrent();"> 
        <xml> 
            <dso type="list" procedure="ac_sel_company_all" > 
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
            <dso type="grid" function="ac_sel_60080050_detail" >
                    <input bind="idGrid">
                    <input bind="lstCompany"/>
                    <input bind="lstLang"/>
                    <input bind="dtFrom"/>
					<input bind="dtTo"/>
                    <input bind="lstStatus"/>
                    <input bind="lstLevel"/>
                    <input bind="lstPostSum"/>
                    <input bind="txtac_cd"/>
                    <input bind="lstAccType"/>
					<input bind="lstCurrent"/>
                    <input bind="txtrate1"/>
                </input>
                <output bind="idGrid"/>
            </dso>
        </xml>
    </gw:data>

    <gw:data id="dso_sel_trial_balance_sum" onreceive="onMergeSum()">
        <xml>
            <dso type="grid" function="ac_sel_60080050_sum" >
                    <input bind="idGrid">
                    <input bind="lstCompany"/>
                    <input bind="lstLang"/>
                    <input bind="dtFrom"/>
					<input bind="dtTo"/>
                    <input bind="lstStatus"/>
                    <input bind="lstLevel"/>
                    <input bind="lstPostSum"/>
                    <input bind="txtac_cd"/>
                    <input bind="lstAccType"/>
					<input bind="lstCurrent"/>
                    <input bind="txtrate1"/>
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
    
    <gw:data id="dso_get_rate" onreceive="onSearch()">
        <xml> 
            <dso type="process" procedure="ac_PRO_GET_RATE"> 
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
<table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
<tr style='height:6%'>
    <td width="100%">
        <fieldset style='padding:0'>
        <table width="100%" cellpadding="1" cellspacing="1" border="0">
        <tr>
	        <td width="12%"></td>
	        <td width="20%"></td>
	        <td width="10%"></td>
	        <td width="15%"></td>
	        <td width="13%"></td> 
	        <td width="30%"></td>
	        <td width=""></td>
	        <td width=""></td>
	    </tr>
	    <tr>
	        <td align="right">Company&nbsp;</td>
            <td><gw:list id="lstCompany" onChange ="onSearch()" styles='width:100%'></gw:list></td>
			<td align="right">Level&nbsp;</td>
	        <td colspan=""><gw:list id="lstLevel" onChange="OnChangeList()"  /></td>
			<td align="right">Language&nbsp;</td>
            <td><gw:list id="lstLang" onChange="OnChangeList()" /></td>
			<td ><gw:imgBtn id="ibtnReport" img="printer"   alt="Print"  onclick="onReport()"/></td>
	    </tr>
	     <tr>
	        <td align='right'>Month</td>
            <td align="center">
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
            
                    <td align="right">Status</td>
                    <td><gw:list id="lstStatus" onchange="onSearch()"/> 
					</td> 
			<td align="right">Amt.Type</td>
            <td><gw:list id="lstAmtType" onChange ="onSearch()"  styles='width:100%'></gw:list></td>
			
	    </tr>
	     <tr>
	        <td align="right"><a title="Click here to select Ex.Rate" onclick="Popup_Acc()" href="#tips" style="text-decoration: none; color=#0000ff"><b>Acc.Code&nbsp;</b></a></td>
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
			<td align='right'><a title="Posting/Summary" style="text-decoration: none; color:black">P/S</a></td>
			<td ><gw:list id="lstPostSum" onChange="OnChangeList()" /></td><td align="right">Acc.Type</td>
            <td colspan=""><gw:list id="lstAccType" onChange ="onSearch()"  styles='width:100%'></gw:list></td>
           <td align="right"><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"        onclick="onSearch()"/></td>
           
	    </tr>
		<tr>
			<td colspan='3' align="right">Current</td>
            <td><gw:list id="lstCurrent" onChange="OnChangeCurrent()"  styles='width:100%'></gw:list></td>
            <td align="right"><a title="Click here to select Ex.Rate" onclick="Popup_Cur()" href="#tips" style="text-decoration: none; color=#0000ff"><b>Ex.Rate</b></a></td>
            <td > <gw:textbox id="txtrate"  styles='width:20%' type="number" format="###,###.##R" /> <gw:textbox id="txtrate1" styles='width:80%' type="number" format="###,###.##R" onenterkey="onSearch()"/></td>
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
				    header="Ctrl|_PK|Account Name|Account Name|Account Name|Begin Bal(Debt)|Begin Bal(Cret)|Debit|Credit|cal bal(Debt)|cal bal(Cret)|Ending bal(Debt)|Ending bal(Cret)|Beginbal(Book)|Period_(Book)|ending_bal_(Book)|Cal_bal_(Book)|qq|qq2|qqq|qq3|_B|_COLOR|_ac_cd|_ac_nm"
				    format="3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
 			        aligns="1|1|2|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|0"
				    widths="400|0|3000|3000|3000|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|0|0|0|0"  
				    styles="width:100%; height:100%"
				    sorting="T"
					autosize="T"
				    oncelldblclick="OnPopupDailySL()"
				    /> 
            </td>
        </tr>
        <tr style='height:25%'>
            <td>
                <gw:grid   
				id="idGrid_sum"
				header="Total|Begin Bal(Debt)|Begin Bal(Cret)|Begin Bal(Debt) trans|Begin Bal(Cret) trans|Debit|Credit|Debit trans|Credit trans|cal bal(Debt)|cal bal(Cret)|cal bal(Debt) trans|cal bal(Cret) trans|Ending bal(Debt)|Ending bal(Cret)|Ending bal(Debt) trans|Ending bal(Cret) trans"   
				format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
 			    aligns="1|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3"
			   editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				widths="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
				styles="width:100%; height:100%"   
				autosize="T"
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
<gw:list id="lstBookCcy" onChange="" styles='display:none'/>
</body>
</html>

