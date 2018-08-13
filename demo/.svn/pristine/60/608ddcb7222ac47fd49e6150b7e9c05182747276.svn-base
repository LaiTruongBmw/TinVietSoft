<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Bank Statement Sum</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script type="text/javascript" language="javascript">
var g_inquiry_type = 10;//Dates :10; Vouchers :20
function BodyInit()
{
    //grdSLByVoucher.style.display="none";
    System.Translate(document); 
    BindingDataList();
}

function BindingDataList()
{
    var ls_comp    = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_ccy       = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>||<All>"; 
    var ls_report   =  "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK006' and d.use_yn = 'Y' ORDER BY D.DEF_YN DESC, D.ORD ")%>";
    var ls_DepAcc = "<%=CtlLib.SetListDataSQL("SELECT '','<ALL>' FROM DUAL UNION ALL SELECT TO_CHAR(A.PK), A.BANK_ID FROM  TAC_ABDEPOMT A WHERE A.DEL_IF =0 AND  a.USE_YN='Y' ")%>";
    var ls_Bank = "<%=CtlLib.SetListDataSQL("SELECT '','<ALL>' FROM DUAL UNION ALL SELECT TO_CHAR(B.PK), PARTNER_NAME FROM TCO_BUSPARTNER B WHERE B.DEL_IF =0 AND B.PK IN (SELECT TCO_BUSPARTNER_PK FROM TAC_ABDEPOMT WHERE DEL_IF=0 AND  USE_YN='Y')")%>";
    var ls_searchby = "DATA|DEPOSIT|Deposit Account|BANK|Bank";
    var ls_bookccy = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
    lstCompany.SetDataText(ls_comp);
    lstSearchBy.SetDataText(ls_searchby);
    //lstDepositAccount.
    lstBookCcy. SetDataText(ls_bookccy);
    lstCurrency.SetDataText(ls_ccy);
    lstCurrency.value="";
    lstReportType.SetDataText(ls_report);
    //txtAC_CD.SetEnable(false);
    lstDepositAccount.SetDataText(ls_DepAcc);
    lstBankName.SetDataText(ls_Bank);
    lstBankName.value='';
    lstDepositAccount.value ='';
    onChangeSearchBy();
    var myDate=new Date();
    var fDate =""+myDate.getFullYear();
    if (myDate.getMonth()<9)
    {
            fDate=fDate+"0"+(myDate.getMonth()+1);
    }
    else
    {
            fDate=fDate+(myDate.getMonth()+1);
    }
    fDate=fDate+"01";
    dtbFrom.SetDataText(fDate);
    onChangeSearchBy();
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	dso_getCompany.Call();
}

function onChangeSearchBy()
{
	var cnd = lstSearchBy.value;
	if (cnd =="DEPOSIT")//Deposit Account
	{
		lblCmdText.text = "Deposit Account";
		lstDepositAccount.style.display='';
		lstBankName.style.display='none';
		grdBankAccount.style.display='none';
		grdDeposit.style.display='';
		grdBankAccount.ClearData();
		grdDeposit.ClearData();
		grdDepositSum.ClearData();
        FormatGridBottom();
		FormatDepositAccount(); 
        FormatDepositAccountSum();
		return;
	}
	if(cnd =="BANK")//Bank
	{
		lblCmdText.text = "Bank";
		lstDepositAccount.style.display="none";
		lstBankName.style.display="";
		grdDeposit.style.display='none';
		grdBankAccount.style.display='';
		grdBankAccount.ClearData();
		grdDeposit.ClearData();
		grdDepositSum.ClearData();
		FormatBankAccount();
        FormatDepositAccountSum();
        FormatGridBottom();
		return;
	}
	
}

function onCompanyChange()
{
    //grdDepositTmp.ClearData();
	//datGetDepositAccount.Call('');
}

function FormatDepositAccount()
{
    if(grdDeposit.rows <2)
	{
		grdDeposit.AddRow();
	}
	var fg=grdDeposit.GetGridControl();
	fg.FixedRows = 2;
	fg.FrozenCols = 5;
	fg.MergeCells = 5;
	fg.MergeRow(0) = true;
	fg.MergeCol(0) = true;
	fg.Cell(0, 0, 0, 0, 0) = "Bank PK";
	fg.MergeCol(1) = true;
	fg.Cell(0, 0, 1, 1, 1) = "No";
	fg.MergeCol(2) = true;
	fg.Cell(0, 0, 2, 1, 2) = "Bank No";
	fg.MergeCol(3) = true;
	fg.Cell(0, 0, 3, 1, 3) = "Bank Name";
	fg.MergeCol(4) = true;
	fg.Cell(0, 0, 4, 1, 4) = "CCY";
	fg.Cell(0, 0, 5, 0, 7) = "Opening Balance";
	fg.Cell(0, 1, 5, 1, 5) = "VND";
	fg.Cell(0, 1, 6, 1, 6) = "Other Ccy";
	fg.Cell(0, 1, 7, 1, 7) = "Books";
	
	fg.Cell(0, 0, 8, 0, 10) = "Deposit";
	fg.Cell(0, 1, 8, 1, 8) = "VND";
	fg.Cell(0, 1, 9, 1, 9) = "Other Ccy";
	fg.Cell(0, 1, 10, 1, 10) = "Books";
	
	fg.Cell(0, 0, 11, 0, 13) = "Withdrawal";
	fg.Cell(0, 1, 11, 1, 11) = "VND";
	fg.Cell(0, 1, 12, 1, 12) = "Other Ccy";
	fg.Cell(0, 1, 13, 1, 13) = "Books";
	
	fg.Cell(0, 0, 14, 0, 16) = "Closing Balance";
	fg.Cell(0, 1, 14, 1, 14) = "VND";
	fg.Cell(0, 1, 15, 1, 15) = "Other Ccy";
	fg.Cell(0, 1, 16, 1, 16) = "Books";
	
	fg.Cell(2, 0, 0, 0, fg.Cols - 1) = 4;
    fg.Cell(13, 0, 0, 1,fg.Cols - 1) = true; 

	
	fg.ColFormat(5) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(8) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(11) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(14) = "#,###,###,###,###,###,###,###";
	
    fg.ColFormat(6) = "#,###,###,###,###,###,###,###.##";
    fg.ColFormat(9) = "#,###,###,###,###,###,###,###.##";
    fg.ColFormat(12) = "#,###,###,###,###,###,###,###.##";
    fg.ColFormat(15) = "#,###,###,###,###,###,###,###.##";
	
	if (lstBookCcy.value=="VND")
	{
        fg.ColFormat(7) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(10) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(13) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(16) = "#,###,###,###,###,###,###,###";
	}
	else
	{
	    fg.ColFormat(7) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(10) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(13) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(16) = "#,###,###,###,###,###,###,###.##";
	}

	fg.ColAlignment(5) = flexAlignRightCenter;
	fg.ColAlignment(6) = flexAlignRightCenter;
	fg.ColAlignment(7) = flexAlignRightCenter;
	
	fg.ColAlignment(8) = flexAlignRightCenter;
	fg.ColAlignment(9) = flexAlignRightCenter;
	fg.ColAlignment(10) = flexAlignRightCenter;
	
	fg.ColAlignment(11) = flexAlignCenterCenter;
	fg.ColAlignment(12) = flexAlignRightCenter;
	fg.ColAlignment(13) = flexAlignRightCenter;
	
	fg.ColAlignment(14) = flexAlignRightCenter;
	fg.ColAlignment(15) = flexAlignRightCenter;
	fg.ColAlignment(16) = flexAlignRightCenter;
	
	fg.ColWidth(0)=0;//Opening Balance TRANS
	fg.ColWidth(1)=500;
	fg.ColWidth(2)=2000;
	fg.ColWidth(3)=2000;
	fg.ColWidth(4)=700;//CCY
	fg.ColWidth(5)=1500;
	fg.ColWidth(6)=1500;
	fg.ColWidth(7)=1500;
	fg.ColWidth(8)=1500;
	fg.ColWidth(9)=1500;
	fg.ColWidth(10)=1500;
	fg.ColWidth(11)=1500;
	fg.ColWidth(12)=1500;
	fg.ColWidth(13)=1500;
	fg.ColWidth(14)=1500;
	fg.ColWidth(15)=1500;
	fg.ColWidth(16)=1500;
	System.Translate(document); 
}

function FormatBankAccount()
{
    if(grdBankAccount.rows <2)
	{
		grdBankAccount.AddRow();
	}
	var fg=grdBankAccount.GetGridControl();
	fg.FixedRows = 2;
	fg.FrozenCols = 5;
	fg.MergeCells = 5;
	fg.MergeRow(0) = true;
	fg.MergeCol(0) = true;
	fg.Cell(0, 0, 0, 0, 0) = "Bank PK";
	fg.MergeCol(1) = true;
	fg.Cell(0, 0, 1, 1, 1) = "No";
	fg.MergeCol(2) = true;
	fg.Cell(0, 0, 2, 1, 2) = "Bank ID";
	fg.MergeCol(3) = true;
	fg.Cell(0, 0, 3, 1, 3) = "Bank Name";
	fg.MergeCol(4) = true;
	fg.Cell(0, 0, 4, 1, 4) = "CCY";
	fg.Cell(0, 0, 5, 0, 7) = "Opening Balance";
	fg.Cell(0, 1, 5, 1, 5) = "VND";
	fg.Cell(0, 1, 6, 1, 6) = "Other Ccy";
	fg.Cell(0, 1, 7, 1, 7) = "Books";
	
	fg.Cell(0, 0, 8, 0, 10) = "Deposit";
	fg.Cell(0, 1, 8, 1, 8) = "VND";
	fg.Cell(0, 1, 9, 1, 9) = "Other Ccy";
	fg.Cell(0, 1, 10, 1, 10) = "Books";
	
	fg.Cell(0, 0, 11, 0, 13) = "Withdrawal";
	fg.Cell(0, 1, 11, 1, 11) = "VND";
	fg.Cell(0, 1, 12, 1, 12) = "Other Ccy";
	fg.Cell(0, 1, 13, 1, 13) = "Books";
	
	fg.Cell(0, 0, 14, 0, 16) = "Closing Balance";
	fg.Cell(0, 1, 14, 1, 14) = "VND";
	fg.Cell(0, 1, 15, 1, 15) = "Other Ccy";
	fg.Cell(0, 1, 16, 1, 16) = "Books";
	
	fg.Cell(2, 0, 0, 0, fg.Cols - 1) = 4;
    fg.Cell(13, 0, 0, 1,fg.Cols - 1) = true; 

	
	fg.ColFormat(5) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(8) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(11) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(14) = "#,###,###,###,###,###,###,###";
	
    fg.ColFormat(6) = "#,###,###,###,###,###,###,###.##";
    fg.ColFormat(9) = "#,###,###,###,###,###,###,###.##";
    fg.ColFormat(12) = "#,###,###,###,###,###,###,###.##";
    fg.ColFormat(15) = "#,###,###,###,###,###,###,###.##";
	
	if (lstBookCcy.value=="VND")
	{
        fg.ColFormat(7) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(10) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(13) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(16) = "#,###,###,###,###,###,###,###";
	}
	else
	{
	    fg.ColFormat(7) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(10) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(13) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(16) = "#,###,###,###,###,###,###,###.##";
	}

	fg.ColAlignment(5) = flexAlignRightCenter;
	fg.ColAlignment(6) = flexAlignRightCenter;
	fg.ColAlignment(7) = flexAlignRightCenter;
	
	fg.ColAlignment(8) = flexAlignRightCenter;
	fg.ColAlignment(9) = flexAlignRightCenter;
	fg.ColAlignment(10) = flexAlignRightCenter;
	
	fg.ColAlignment(11) = flexAlignCenterCenter;
	fg.ColAlignment(12) = flexAlignRightCenter;
	fg.ColAlignment(13) = flexAlignRightCenter;
	
	fg.ColAlignment(14) = flexAlignRightCenter;
	fg.ColAlignment(15) = flexAlignRightCenter;
	fg.ColAlignment(16) = flexAlignRightCenter;
	
	fg.ColWidth(0)=0;//Opening Balance TRANS
	fg.ColWidth(1)=500;
	fg.ColWidth(2)=2000;
	fg.ColWidth(3)=2000;
	fg.ColWidth(4)=700;//CCY
	fg.ColWidth(5)=1500;
	fg.ColWidth(6)=1500;
	fg.ColWidth(7)=1500;
	fg.ColWidth(8)=1500;
	fg.ColWidth(9)=1500;
	fg.ColWidth(10)=1500;
	fg.ColWidth(11)=1500;
	fg.ColWidth(12)=1500;
	fg.ColWidth(13)=1500;
	fg.ColWidth(14)=1500;
	fg.ColWidth(15)=1500;
	fg.ColWidth(16)=1500;
	System.Translate(document); 
}

function FormatDepositAccountSum()
{
	if(grdDepositSum.rows <2)
	{
		grdDepositSum.AddRow();
	}
	
	var fg=grdDepositSum.GetGridControl();
	fg.FixedRows = 2;
	fg.MergeCells = 5;
	fg.MergeRow(0) = true;
	fg.Cell(0, 0, 0, 0, 2) = "Opening Balance";
	fg.Cell(0, 1, 0, 1, 0) = "VND";
	fg.Cell(0, 1, 1, 1, 1) = "Other Ccy";
	fg.Cell(0, 1, 2, 1, 2) = "Books";
	
	fg.Cell(0, 0, 3, 0, 5) = "Deposit";
	fg.Cell(0, 1, 3, 1, 3) = "VND";
	fg.Cell(0, 1, 4, 1, 4) = "Other Ccy";
	fg.Cell(0, 1, 5, 1, 5) = "Books";
	
	fg.Cell(0, 0, 6, 0, 8) = "Withdrawal";
	fg.Cell(0, 1, 6, 1, 6) = "VND";
	fg.Cell(0, 1, 7, 1, 7) = "Other Ccy";
	fg.Cell(0, 1, 8, 1, 8) = "Books";
	
	fg.Cell(0, 0, 9, 0, 11) = "Closing Balance";
	fg.Cell(0, 1, 9, 1, 9) = "VND";
	fg.Cell(0, 1, 10, 1, 10) = "Other Ccy";
	fg.Cell(0, 1, 11, 1, 11) = "Books";
	
	fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
	fg.Cell(13, 0, 0, 1,fg.Cols - 1) = true; 

    fg.ColWidth(0)=1500;
    fg.ColWidth(1)=1500;
    fg.ColWidth(2)=1500;
    fg.ColWidth(3)=1500; 
    fg.ColWidth(4)=1500;
    fg.ColWidth(5)=1500;
    fg.ColWidth(6)=1500;
    fg.ColWidth(7)=1500;
    fg.ColWidth(8)=1500;
    fg.ColWidth(9)=1500;
    fg.ColWidth(10)=1500;
    fg.ColWidth(11)=1500; 
   
    fg.ColFormat(0) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(3) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(6) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(9) = "#,###,###,###,###,###,###,###"; 
	
	fg.ColFormat(1) = "#,###,###,###,###,###,###,###.##";
	fg.ColFormat(4) = "#,###,###,###,###,###,###,###.##";
	fg.ColFormat(7) = "#,###,###,###,###,###,###,###.##";
	fg.ColFormat(10) = "#,###,###,###,###,###,###,###.##";
	
	if (lstBookCcy.value=="VND")
	{
        fg.ColFormat(2) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(5) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(8) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(11) = "#,###,###,###,###,###,###,###";
	}
	else
	{
	    fg.ColFormat(2) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(5) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(8) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(11) = "#,###,###,###,###,###,###,###.##";
	}

	fg.ColAlignment(0) = flexAlignRightCenter;
	fg.ColAlignment(1) = flexAlignRightCenter;
	fg.ColAlignment(2) = flexAlignRightCenter;
	fg.ColAlignment(3) = flexAlignRightCenter;
	fg.ColAlignment(4) = flexAlignRightCenter;
	fg.ColAlignment(5) = flexAlignRightCenter;
	fg.ColAlignment(6) = flexAlignRightCenter;
	fg.ColAlignment(7) = flexAlignRightCenter;
	fg.ColAlignment(8) = flexAlignRightCenter;
	fg.ColAlignment(9) = flexAlignRightCenter;
	fg.ColAlignment(10) = flexAlignRightCenter;
	fg.ColAlignment(11) = flexAlignRightCenter;
	System.Translate(document); 
}

function FormatGridBottom()
{
	if(grdBottom.rows <2)
	{
		grdBottom.AddRow();
	}
	
	var fg=grdBottom.GetGridControl();
	fg.FixedRows = 2;
	fg.MergeCells = 5;
    fg.MergeRow(0) = true;
    fg.MergeCol(0) = true;
	fg.Cell(0, 0, 0, 1, 0) = "No";

    fg.Cell(0, 0, 1, 0, 2) = "Account";
	fg.Cell(0, 1, 1, 1, 1) = "Code";
	fg.Cell(0, 1, 2, 1, 2) = "Name";
	
	fg.MergeCol(3) = true;
	fg.Cell(0, 0, 3, 1, 3) = "Ccy";
	
	fg.Cell(0, 0, 4, 0, 6) = "Openning";
	fg.Cell(0, 1, 4, 1, 4) = "VND";
	fg.Cell(0, 1, 5, 1, 5) = "USD";
	fg.Cell(0, 1, 6, 1, 6) = "Book Amount";
	
	fg.Cell(0, 0, 7, 0, 9) = "Debit";
	fg.Cell(0, 1, 7, 1, 7) = "VND";
	fg.Cell(0, 1, 8, 1, 8) = "USD";
	fg.Cell(0, 1, 9, 1, 9) = "Book Amount";

    fg.Cell(0, 0, 10, 0, 12) = "Credit";
	fg.Cell(0, 1, 10, 1, 10) = "VND";
	fg.Cell(0, 1, 11, 1, 11) = "USD";
	fg.Cell(0, 1, 12, 1, 12) = "Book Amount";

    fg.Cell(0, 0, 13, 0, 15) = "Closing";
	fg.Cell(0, 1, 13, 1, 13) = "VND";
	fg.Cell(0, 1, 14, 1, 14) = "USD";
	fg.Cell(0, 1, 15, 1, 15) = "Book Amount";

    
    fg.ColFormat(4) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(5) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(6) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(7) = "#,###,###,###,###,###,###,###"; 
    fg.ColFormat(8) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(9) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(10) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(11) = "#,###,###,###,###,###,###,###"; 
    fg.ColFormat(12) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(13) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(14) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(15) = "#,###,###,###,###,###,###,###"; 
	
//	if (lstBookCcy.value=="VND")
//	{
//        fg.ColFormat(2) = "#,###,###,###,###,###,###,###";
//		fg.ColFormat(5) = "#,###,###,###,###,###,###,###";
//		fg.ColFormat(8) = "#,###,###,###,###,###,###,###";
//		fg.ColFormat(11) = "#,###,###,###,###,###,###,###";
//	}
//	else
//	{
//	    fg.ColFormat(2) = "#,###,###,###,###,###,###,###.##";
//		fg.ColFormat(5) = "#,###,###,###,###,###,###,###.##";
//		fg.ColFormat(8) = "#,###,###,###,###,###,###,###.##";
//		fg.ColFormat(11) = "#,###,###,###,###,###,###,###.##";
//	}

//	fg.ColAlignment(0) = flexAlignRightCenter;
//	fg.ColAlignment(1) = flexAlignRightCenter;
//	fg.ColAlignment(2) = flexAlignRightCenter;
//	fg.ColAlignment(3) = flexAlignRightCenter;
//	fg.ColAlignment(4) = flexAlignRightCenter;
//	fg.ColAlignment(5) = flexAlignRightCenter;
//	fg.ColAlignment(6) = flexAlignRightCenter;
//	fg.ColAlignment(7) = flexAlignRightCenter;
//	fg.ColAlignment(8) = flexAlignRightCenter;
//	fg.ColAlignment(9) = flexAlignRightCenter;
//	fg.ColAlignment(10) = flexAlignRightCenter;
//	fg.ColAlignment(11) = flexAlignRightCenter;
//	System.Translate(document); 
}

function OnDataError(dsql)
{
	alert("ERROR "+ dsql.id+"-"+dsql.errmsg);
}

function OnDataReceive(objID)
{
	if (objID.id=="datDepositAccount")
	{
		FormatDepositAccount();
		datDepositAccountSum.Call('SELECT');
	}
	
	if (objID.id=="datDepositAccountSum")
	{
		FormatDepositAccountSum();
        dso_gridbottom.Call('SELECT');
	}
	/*Bank*/
	if (objID.id=="datBankAccount")
	{
		FormatBankAccount();
		for(i=2;i<grdBankAccount.rows;i++)
		{
		      tmp =  i-1;
		      grdBankAccount.SetGridText(i,1, ""+tmp);
		}
		datBankAccountSum.Call('SELECT');
	}
	
	if (objID.id=="datBankAccountSum")
	{
		FormatDepositAccountSum();
        dso_gridbottom.Call('SELECT');
	}

    if (objID.id=="dso_gridbottom")
	{
        FormatGridBottom();
        grdBottom.Subtotal (0,2 ,2, '4!5!6!7!8!9!10!11!12!13!14!15','',true,4,'Grand Total');
        grdBottom.SetGridText(grdBottom.rows-1,0,'');
        grdBottom.SetGridText(grdBottom.rows-1,1,'');
    }
	
	if ( objID.id=="datGetDepositAccount")
	{
	    strDeposit = 'DATA';
        for(i=1;i<grdDepositTmp.rows;i++)
        {
                strDeposit = strDeposit +'|' +grdDepositTmp.GetGridData(i,0)+'|'+ grdDepositTmp.GetGridData(i,1);
        }
        lstDepositAccount.SetDataText(strDeposit);

	}
	
}

function Trim(sString)
{
	while (sString.substring(0,1) == ' ')
	{
		sString = sString.substring(1, sString.length);
	}
	while (sString.substring(sString.length-1, sString.length) == ' ')
	{
		sString = sString.substring(0,sString.length-1);
	}
	return sString;
}


//---------------------------onSearch
function onSearch()
{
	
	var cnd = lstSearchBy.value;
	if (cnd =="DEPOSIT")//Deposit Account
	{
		datDepositAccount.Call('SELECT');
		return;
	}
	if(cnd =="BANK")//Bank
	{
		datBankAccount.Call('SELECT');
		return;
	}
	
}

function GetAccount()
{
    var fpath = System.RootURL + "/standard/forms/60/08/60080050_popup_Acc.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_SEL_60080080_ACCT_BANK";
    var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
    if ((object != null) &&(object[0]!="0"))
    {
        txtAC_PK.SetDataText("");
        txtAC_CD.SetDataText("");
        txtAC_PK.SetDataText(object[3]);
        txtAC_CD.SetDataText(object[0]);
    }
}

function resetAcc(ind)
{
    txtAC_PK.SetDataText("");
    txtAC_CD.SetDataText("");
}
//-----------------------------onPrint
function OnReport()
{
	if(lstReportType.value=='RPT')
	{
	 var url = '/standard/reports/60/08/60080080_rpt_gfka60110040.aspx?company_pk='+lstCompany.value+'&dtbFrom=' +dtbFrom.value+ '&dtbTo=' + dtbTo.value+'&status='+rdoSlipStatus.value+'&bookccy='+lstBookCcy.value;
            System.OpenTargetPage( System.RootURL+url , "newform" );
	}
	
	if(lstReportType.value=='CHB')
	{
	 var url = '/standard/reports/60/08/60080080_rpt_daily.aspx?company_pk='+lstCompany.value+'&dtbFrom=' +dtbFrom.value+ '&dtbTo=' + dtbTo.value+'&status='+rdoSlipStatus.value+'&bookccy='+lstBookCcy.value;
            System.OpenTargetPage( System.RootURL+url , "newform" );
	}
	if(lstReportType.value=='CCB')
	{
	 var url = '/standard/reports/60/08/60080080_daily_detail.aspx?company_pk='+lstCompany.value+'&dtbFrom=' +dtbFrom.value+ '&dtbTo=' + dtbTo.value+'&status='+rdoSlipStatus.value+'&bookccy='+lstBookCcy.value;
            System.OpenTargetPage( System.RootURL+url , "newform" );
	}
	if(lstReportType.value=='07')
	{
			var url = '/standard/reports/60/08/rpt_60080080_daily_detail_2.aspx?company_pk='+lstCompany.value+'&dtbFrom=' +dtbFrom.value+ '&dtbTo=' + dtbTo.value+'&status='+rdoSlipStatus.value+'&ccy='+lstCurrency.value+'&bank_pk='+lstDepositAccount.value;
            System.OpenTargetPage( System.RootURL+url , "newform" );
	}
	
	
}
</script>
<body>
<!-------------------------------------------------------------------------------------------->

 <gw:data id="dso_getCompany" onreceive=""> 
        <xml> 
            <dso type="list" procedure="ac_sel_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

<!-------------------------------------------------------------------------------------------->
<gw:data id="datDepositAccount" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
    <xml>
        <dso type="grid" function="ac_SEL_60080080_BANK_DEP_BAL">
            <input bind="grdDeposit">
                <input bind="lstCompany"/>
                <input bind="dtbFrom"/>
                <input bind="dtbTo"/>
                <input bind="lstDepositAccount"/> 
                <input bind="rdoSlipStatus"/>
                <input bind="lstCurrency"/>
            </input>
            <output bind="grdDeposit"/>
        </dso>
    </xml>
</gw:data> 

<gw:data id="datDepositAccountSum" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
    <xml>
        <dso type="grid" function="ac_SEL_60080080_BANK_BAL_SUM">
            <input bind="grdDepositSum">
                <input bind="lstCompany"/>
                <input bind="dtbFrom"/>
                <input bind="dtbTo"/>
                <input bind="lstDepositAccount"/> 
                <input bind="rdoSlipStatus"/>
                <input bind="lstCurrency"/>
            </input>
            <output bind="grdDepositSum"/>
        </dso>
    </xml>
</gw:data> 	

<gw:data id="datBankAccount" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
    <xml>
        <dso type="grid" function="ac_SEL_60080080_MONTH_BANK_BAL">
            <input bind="grdBankAccount">
                <input bind="lstCompany"/>
                <input bind="dtbFrom"/>
                <input bind="dtbTo"/>
                <input bind="lstBankName"/> 
                <input bind="rdoSlipStatus"/>
                <input bind="lstCurrency"/>
            </input>
            <output bind="grdBankAccount"/>
        </dso>
    </xml>
</gw:data> 

<gw:data id="dso_gridbottom" onreceive="OnDataReceive(this)" >
    <xml>
        <dso type="grid" function="ac_SEL_60080080">
            <input bind="grdBottom">
                <input bind="lstCompany"/>
                <input bind="dtbFrom"/>
                <input bind="dtbTo"/>
                <input bind="rdoSlipStatus"/>
            </input>
            <output bind="grdBottom"/>
        </dso>
    </xml>
</gw:data> 

<gw:data id="datBankAccountSum" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
    <xml>
        <dso type="grid" function="ac_SEL_60080080_MON_BANK_SUM">
            <input bind="grdDepositSum">
                <input bind="lstCompany"/>
                <input bind="dtbFrom"/>
                <input bind="dtbTo"/>
                <input bind="lstBankName"/> 
                <input bind="rdoSlipStatus"/>
                <input bind="lstCurrency"/>
            </input>
            <output bind="grdDepositSum"/>
        </dso>
    </xml>
</gw:data> 	

<gw:data id="datGetDepositAccount" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid" function="ac_SEL_60080080_BANK_LIST" > 
            <input bind="grdDepositTmp">
                <input bind="lstCompany" />
            </input>
            <output bind="grdDepositTmp"/>
        </dso> 
    </xml> 
</gw:data> 
	
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="right" width="9%">Company</td>
                        <td  width="21%"><gw:list id="lstCompany" styles="width:100%;" onchange="onCompanyChange()" ></gw:list></td>
                        <td width="8%" align="right">Search By</td>
                        <td width="23%">
                            <gw:list id="lstSearchBy" styles="width:100%;" onchange="onChangeSearchBy()" ></gw:list>
						</td>
						<!--
						<td width="9%" align="right"><b><a title="Click here to show Account" onclick="GetAccount()" href="#tips" >Account</a></b></td>
						<td width="18%">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="95%"><gw:textbox id="txtAC_PK" styles='display:none'></gw:textbox>
                                                <gw:textbox id="txtAC_CD" styles='width:100%;' csstype="mandatory"/>
                                <td><gw:imgBtn id="ibtnAccReset" img="reset"  alt="reset acc" onclick="resetAcc()" /></td>
                            </tr>
                        </table>
						</td>
						-->
						<td td width="11%" align="right"><gw:label id="lblCmdText" text="Deposit Account"></gw:label></td>
                        <td width="16%" >
                                <gw:list id="lstDepositAccount" styles="width:100%;" ></gw:list>
                                <gw:list id="lstBankName" styles="width:100%;" ></gw:list>
                        </td>
						 <td align="right" width="6%">Currency</td>
                        <td  width="6%"><gw:list id="lstCurrency" styles="width:100%;" ></gw:list></td>
                    </tr>
                    <tr>
			<td align="right">Proposed Date</td>
                        <td >
                                <table border="0" cellpadding="0" cellspacing="0"  width="100%">
                                <tr>
                                    <td width="45%" align="left"><gw:datebox id="dtbFrom" lang="<%=Application("Lang")%>" mode="01" onchange="" /></td>
                                    <td width="10%" align="center"><b>&nbsp;~&nbsp;</b></td>
                                    <td width="45%" align="right"><gw:datebox id="dtbTo" lang="<%=Application("Lang")%>" mode="01" onchange="" /></td>
                                </tr>
                                </table>
                        </td>
                        <td align="right">Slip Status</td>
                        <td align="left" >
                                <gw:radio id="rdoSlipStatus"  value="2" > 
                                    <span value="2" >Confirmed</span>
                                    <span value="0" >Approved</span>
                                </gw:radio >
                        </td>
                         <td align="right" >Report Type</td>
                        <td  colspan="2"><gw:list id="lstReportType" styles="width:100%;" ></gw:list></td>
                        <td align="right">
                            <table border="0" cellpadding="2" cellspacing="0">
                                <tr>
                                    <td><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"    onclick="onSearch()" /></td>
                                    <td><gw:imgBtn id="ibtnReport" img="printer"   alt="Print Report" onclick="OnReport()" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
          </td> 
       </tr>
      <tr>
        <td>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td>
                            
                    </td>
                </tr>
            </table>
        </td>
      </tr>
       
      <tr>
	  <td>
<gw:grid id='grdDeposit'
header='PK|STT|BANK_ID|BANK_NAME|CCY|O_MM_VND_BAL|O_MM_USD_BAL|O_MM_BOOK_BAL|DR_VND_BAL|DR_USD_BAL|DR_BOOK_BAL|CR_VND_BAL|CR_USD_BAL|CR_BOOK_BAL|CL_VND_BAL|CL_USD_BAL|CL_BOOK_BAL'
format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
defaults='||||||||||||||||'
editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
widths='0|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
sorting='T'
styles='width:100%; height:300'
/>
<gw:grid id='grdBankAccount'
header='C_PK|PARTNER_ID|PARTNER_NAME|CCY|O_MM_VND_BAL|O_MM_USD_BAL|O_MM_BOOK_BAL|DR_VND_BAL|DR_USD_BAL|DR_BOOK_BAL|CR_VND_BAL|CR_USD_BAL|CR_BOOK_BAL|CL_VND_BAL|CL_USD_BAL|CL_BOOK_BAL'
format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
defaults='|||||||||||||||'
editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
sorting='T'
styles='width:100%; height:300'
/>

            </td>
      </tr> 
	  
      <tr>
            <td>
            <gw:grid id='grdDepositSum'
header='O_MM_VND_BAL|O_MM_USD_BAL|O_MM_BOOK_BAL|DR_VND_BAL|DR_USD_BAL|DR_BOOK_BAL|CR_VND_BAL|CR_USD_BAL|CR_BOOK_BAL|CL_VND_BAL|CL_USD_BAL|CL_BOOK_BAL'
format='0|0|0|0|0|0|0|0|0|0|0|0'
aligns='0|0|0|0|0|0|0|0|0|0|0|0'
defaults='|||||||||||'
editcol='0|0|0|0|0|0|0|0|0|0|0|0'
widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
sorting='F'
styles='width:100%; height:120'
/>

            </td>
      </tr> 

       <tr>
            <td>
            <!--header='0.No|1.Code|2.Name|3.Ccy|4.VND|5.USD|6.Book Amount|7.VND|8.USD|9.Book Amount|10.VND|11.USD|12.Book Amount|13.VND|14.USD|15.Book Amount'-->
            <gw:grid id='grdBottom'
header='No|Code|Name|Ccy|VND|USD|Book Amount|VND|USD|Book Amount|VND|USD|Book Amount|VND|USD|Book Amount'
 format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
 aligns='1|0|0|1|3|3|3|3|3|3|3|3|3|3|3|3'
defaults='|||||||||||||||'
editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
widths='700|1500|2500|800|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000'
sorting='F'
styles='width:100%; height:200'
/>

            </td>
      </tr> 
</table>  
 <gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
<gw:textbox id="txtOpenBookAmt" text="0"  styles='display:none;'/>
<gw:textbox id="txtOpenTransAmt" text="0"  styles='display:none;'/>

<gw:textbox id="txtBankPK" text="0"  styles='display:none;'/>
<gw:textbox id="txtBankCCy" text="0"  styles='display:none;'/>
<gw:grid id='grdDepositTmp'
header='CCY|BANK_ID'
format='0|0'
aligns='0|0'
defaults='|'
editcol='1|1'
widths='0|0'
sorting='T'
styles='width:0; height:0;display:none;'
/>
<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
</body>
</html>
