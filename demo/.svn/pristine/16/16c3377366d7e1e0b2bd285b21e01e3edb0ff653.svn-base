<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SL Partner Balance</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">

function BodyInit()
{
    System.Translate(document);
    txtAC_CD.SetEnable(false);
    txtAC_NM.SetEnable(false);
    txtTCO_BUSPARTNER_CD.SetEnable(false);
    txtTCO_BUSPARTNER_NM.SetEnable(false);
    BindingDataList();
    lstCCY.SetDataText("");
    rdoAMOUNT.value = "2";
    rdoTYPE.value = "D";
    rdoSTATUS.value = "2";
    
    OnDisplay();
    txtUser_Pk.text = "<%=Session("USER_PK")%>";
    dso_getCompany.Call();
}

function BindingDataList()
{
    var ls_comp         = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_ccy          = "<%=CtlLib.SetListDataFUNC("SELECT ac_F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>||Select All";
    var ls_report       =  "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK004' ORDER BY D.DEF_YN DESC, D.ORD ")%>";
    var ls_bookccy = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
    
    lstBookCcy.SetDataText(ls_bookccy);  
    lstCOMPANY.SetDataText(ls_comp);
    lstCCY.SetDataText(ls_ccy);
    lstREPORT.SetDataText(ls_report);
}
function MergeHeaderDate()
{
		var fg=grdDate.GetGridControl();
		if(fg.Rows < 2)
		{
		   grdDate.AddRow();     
		}
        fg.FixedRows = 2
        fg.MergeCells = 5
		fg.MergeRow(0) = true

        fg.Cell(0, 0, 6, 0, 7) = "Debit"  
		fg.Cell(0, 0, 8, 0, 9) = "Credit"  
		
		fg.Cell(0, 1, 6, 1) = "Transaction"
		fg.Cell(0, 1, 7, 1) = "Book"
		
		fg.Cell(0, 1, 8, 1) = "Transaction"
		fg.Cell(0, 1, 9, 1) = "Book"
		
		//fg.MergeCells = 3;
		fg.MergeCol(0) = true
        fg.Cell(0, 0, 0, 1, 0) = "Date"
        fg.Cell(0, 0, 2, 1, 3) = "Account"
        fg.Cell(0, 1, 2, 1, 2) = "Code"  
		fg.Cell(0, 1, 3, 1, 3) = "Name" 
		fg.MergeCol(4) = true
		fg.Cell(0, 0, 4, 1, 4) = "CCY"
		fg.MergeCol(5) = true
		fg.Cell(0, 0, 5, 1, 5) = "Opening Balance"
		fg.MergeCol(10) = true
		fg.Cell(0, 0, 11, 0, 12) = "Customer"
		fg.Cell(0, 1, 11, 1, 11) = "ID"
		fg.Cell(0, 1, 12, 1, 12) = "Name"
		
		if(rdoSTATUS.GetData()== 2){
			fg.Cell(0, 0, 10, 1, 10) = "CFM Balance"
		}
		else
		{
			fg.Cell(0, 0, 10, 1, 10) = "APP Balance"
		}
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		fg.ColWidth(0)=1200;
		fg.ColWidth(2)=1200;
		fg.ColWidth(3)=2800;
		fg.ColWidth(4)=500;
		fg.ColWidth(5)=1500;
		fg.ColWidth(6)=1500;
		fg.ColWidth(7)=1500;
		fg.ColWidth(8)=1500;
		fg.ColWidth(9)=1500;
		fg.ColWidth(10)=1500;
		var AmountType = rdoAMOUNT.GetData();
		if (AmountType == '1') // Trans & Books
		{
			fg.ColWidth(6)=1500;
			fg.ColWidth(8)=1500;
		} else if (AmountType == '2') // Only Books
		{
			fg.MergeCol(7) = true
        	fg.Cell(0, 0, 7, 1, 7) = "Debit"
			fg.MergeCol(9) = true
        	fg.Cell(0, 0, 9, 1, 9) = "Credit"
			fg.ColWidth(6)=0;
			fg.ColWidth(8)=0;
			fg.ColWidth(5)=2500;
			fg.ColWidth(7)=2500;
			fg.ColWidth(9)=2500;
		}
        else // Only Trans
		{
			fg.MergeCol(6) = true
        	fg.Cell(0, 0, 6, 1, 6) = "Debit"
			fg.MergeCol(8) = true
        	fg.Cell(0, 0, 8, 1, 8) = "Credit"
			fg.ColWidth(7)=0;
			fg.ColWidth(9)=0;
			fg.ColWidth(5)=2500;
			fg.ColWidth(6)=2500;
			fg.ColWidth(8)=2500;
		}
		fg.ColFormat(6) = "#,###,###,###,###,###,###.##R";
		fg.ColFormat(8) = "#,###,###,###,###,###,###.##R";
		
		if(lstBookCcy.GetData() == "VND")
        {
            fg.ColFormat(5) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(7) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(9) = "#,###,###,###,###,###,###R";
            fg.ColFormat(10) = "#,###,###,###,###,###,###R";
        }
        else
        {
            fg.ColFormat(5) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(7) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(9) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(10) = "#,###,###,###,###,###,###.##R";
        }
		//loadDateOpeningBalance();
}

function MergeHeaderVoucherSum()
{

        var fg=grdSumVoucher.GetGridControl();
		if(fg.Rows < 2)
		{
		   grdSumVoucher.AddRow();     
		}
        fg.FixedRows = 2
        fg.MergeCells = 5
		fg.MergeRow(0) = true
		
        fg.MergeCol(0) = true
        fg.Cell(0, 0,0, 1, 0) = "CCY"
		
		fg.Cell(0, 0, 1, 0, 2) = "Openning Book"
		fg.Cell(0, 1, 1, 1, 1) = "Debit"
		fg.Cell(0, 1, 2, 1, 2) = "Credit"
		
		fg.Cell(0, 0, 3, 0, 4) = "Openning Trans"
        fg.Cell(0, 1, 3, 1, 3) = "Debit"  
	    fg.Cell(0, 1, 4, 1, 4) = "Credit" 
		
	    fg.Cell(0, 1, 5, 0, 6)  = "Period Book"
	    fg.Cell(0, 1, 5, 1, 5) = "Debit"
		fg.Cell(0, 1, 6, 1, 6) = "Credit"
		
	    fg.Cell(0, 0, 7, 0, 8)  = "Period Trans"
	    fg.Cell(0, 1, 7, 1, 7) = "Debit"
		fg.Cell(0, 1, 8, 1, 8) = "Credit"
		
		fg.Cell(0, 0, 9, 0, 10)  = "Accumulate Book"
	    fg.Cell(0, 1, 9, 1, 9) = "Debit"
		fg.Cell(0, 1, 10, 1, 10) = "Credit"
		
		fg.Cell(0, 0, 11, 0, 12)  = "Accumulate Trans"
	    fg.Cell(0, 1, 11, 1, 11) = "Debit"
		fg.Cell(0, 1, 12, 1, 12) = "Credit"
		
		fg.Cell(0, 0, 13, 0, 14)  = "Closing Book"
	    fg.Cell(0, 1, 13, 1, 13) = "Debit"
		fg.Cell(0, 1, 14, 1, 14) = "Credit"
		
		fg.Cell(0, 0, 15, 0, 16)  = "Closing Trans"
	    fg.Cell(0, 1, 15, 1, 15) = "Debit"
		fg.Cell(0, 1, 16, 1, 16) = "Credit"
		
		var AmountType = rdoAMOUNT.GetData();
		if (AmountType == '1') // Trans & Books
		{
			fg.ColWidth(1)=2500;
			fg.ColWidth(2)=2500;
			fg.ColWidth(3)=2500;
			fg.ColWidth(4)=2500;
			fg.ColWidth(5)=2500;
			fg.ColWidth(6)=2500;
			fg.ColWidth(7)=2500;
			fg.ColWidth(8)=2500;
			fg.ColWidth(9)=2500;
			fg.ColWidth(10)=2500;
			fg.ColWidth(11)=2500;
			fg.ColWidth(12)=2500;
			fg.ColWidth(13)=2500;
			fg.ColWidth(14)=2500;
			fg.ColWidth(15)=2500;
			fg.ColWidth(16)=2500;
		} else if (AmountType == '2') // Only Books
		{
			fg.ColWidth(1)=2500;
			fg.ColWidth(2)=2500;
			fg.ColWidth(3)=0;
			fg.ColWidth(4)=0;
			fg.ColWidth(5)=2500;
			fg.ColWidth(6)=2500;
			fg.ColWidth(7)=0;
			fg.ColWidth(8)=0;
			fg.ColWidth(9)=2500;
			fg.ColWidth(10)=2500;
			fg.ColWidth(11)=0;
			fg.ColWidth(12)=0;
			fg.ColWidth(13)=2500;
			fg.ColWidth(14)=2500;
			fg.ColWidth(15)=0;
			fg.ColWidth(16)=0;
		}
        else // Only Trans
		{
			fg.ColWidth(1)=0;
			fg.ColWidth(2)=0;
			fg.ColWidth(3)=2500;
			fg.ColWidth(4)=2500;
			fg.ColWidth(5)=0;
			fg.ColWidth(6)=0;
			fg.ColWidth(7)=2500;
			fg.ColWidth(8)=2500;
			fg.ColWidth(9)=0;
			fg.ColWidth(10)=0;
			fg.ColWidth(11)=2500;
			fg.ColWidth(12)=2500;
			fg.ColWidth(13)=0;
			fg.ColWidth(14)=0;
			fg.ColWidth(15)=2500;
			fg.ColWidth(16)=2500;
		}
}		
function MergeHeaderVoucher()
{

        var fg=grdVoucher.GetGridControl();
		if(fg.Rows < 2)
		{
		   grdVoucher.AddRow();     
		}
        fg.FixedRows = 2
        fg.MergeCells = 5
		fg.MergeRow(0) = true
        fg.MergeCol(0) = true
        fg.Cell(0, 0,0, 1, 0) = "Seq"
		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Voucher No"
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Date"
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Approved by"
		fg.MergeCol(4) = true
		fg.Cell(0, 0, 4, 1, 4) = "CCY"
		fg.Cell(0, 0, 6, 0, 7) = "Account"
		fg.Cell(0, 1, 6, 1, 6) = "Code"
		fg.Cell(0, 1, 7, 1, 7) = "Name"
		
		fg.Cell(0, 0, 8, 0, 9) = "Opening Balance Book"
        fg.Cell(0, 1, 8, 1, 8) = "Debit"  
	    fg.Cell(0, 1, 9, 1, 9) = "Credit" 
		
	    fg.Cell(0, 1, 10, 0, 11)  = "Opening Balance Trans"
	    fg.Cell(0, 1, 10, 1, 10) = "Debit"
		fg.Cell(0, 1, 11, 1, 11) = "Credit"
		
	    fg.Cell(0, 0, 12, 0, 13)  = "Book"
	    fg.Cell(0, 1, 12, 1, 12) = "Debit"
		fg.Cell(0, 1, 13, 1, 13) = "Credit"
		
		fg.Cell(0, 0, 14, 0, 15)  = "Transaction"
	    fg.Cell(0, 1, 14, 1, 14) = "Debit"
		fg.Cell(0, 1, 15, 1, 15) = "Credit"
		
		fg.Cell(0, 0, 16, 0, 17) = "Closing Balance Book"
        fg.Cell(0, 1, 16, 1, 16) = "Debit"  
	    fg.Cell(0, 1, 17, 1, 17) = "Credit" 
		
	    fg.Cell(0, 0, 18, 0, 19)  = "Closing Balance Trans"
	    fg.Cell(0, 1, 18, 1, 18) = "Debit"
		fg.Cell(0, 1, 19, 1, 19) = "Credit"
		
	    fg.MergeCol(13) = true
		/*if(rdoSTATUS.GetData()== 2){
		    fg.Cell(0, 0, 13, 1, 13) = "CFM Balance"
		}
		else
		{
		    fg.Cell(0, 0, 13, 1, 13) = "APP Balance"
		}
	   	*/
		fg.Cell(0, 0, 21, 0, 22) = "Customer"
		fg.Cell(0, 1, 21, 1, 21) = "ID"  
	    fg.Cell(0, 1, 22, 1, 22) = "Name" 
	    
		fg.Cell(0, 0, 23, 0, 24) = "Description"
		fg.Cell(0, 1, 23, 1, 23) = "Foreigner"
		fg.Cell(0, 1, 24, 1, 24) = "Local"
		fg.MergeCol(25) = true
		fg.Cell(0, 0, 25, 1, 25) = "Control Item"
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		fg.ColWidth(0)=600;
		fg.ColWidth(1)=1100;
		fg.ColWidth(2)=1100;
		fg.ColWidth(3)=1200;
		fg.ColWidth(4)=500;
		fg.ColWidth(6)=1500;
		fg.ColWidth(7)=2500;
		fg.ColWidth(21)=1500;
		fg.ColWidth(22)=2500;
		fg.ColWidth(23)=2500;
		fg.ColWidth(24)=2500;
		fg.ColWidth(25)=2500;
		var AmountType = rdoAMOUNT.GetData();
		if (AmountType == '2') // Books
		{
			fg.ColWidth(8)=1500;
			fg.ColWidth(9)=1500;
			fg.ColWidth(10)=0;
			fg.ColWidth(11)=0;
			fg.ColWidth(12)=1500;
			fg.ColWidth(13)=1500;
			fg.ColWidth(14)=0;
			fg.ColWidth(15)=0;
			fg.ColWidth(16)=1500;
			fg.ColWidth(17)=1500;
			fg.ColWidth(18)=0;
			fg.ColWidth(19)=0;
		}
		else if (AmountType == '3') // trans
		{
			fg.ColWidth(8)=0;
			fg.ColWidth(9)=0;
			fg.ColWidth(10)=1500;
			fg.ColWidth(11)=1500;
			fg.ColWidth(12)=0;
			fg.ColWidth(13)=0;
			fg.ColWidth(14)=1500;
			fg.ColWidth(15)=1500;
			fg.ColWidth(16)=0;
			fg.ColWidth(17)=0;
			fg.ColWidth(18)=1500;
			fg.ColWidth(19)=1500;
		}
		else
		{
			
			fg.ColWidth(8)=1500;
			fg.ColWidth(9)=1500;
			fg.ColWidth(10)=1500;
			fg.ColWidth(11)=1500;
			fg.ColWidth(12)=1500;
			fg.ColWidth(13)=1500;
			fg.ColWidth(14)=1500;
			fg.ColWidth(15)=1500;
			fg.ColWidth(16)=1500;
			fg.ColWidth(17)=1500;
			fg.ColWidth(18)=1500;
			fg.ColWidth(19)=1500;
		}
		if(lstBookCcy.GetData() == "VND")
        {
            fg.ColFormat(8) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(9) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(10) = "#,###,###,###,###,###,###R";
            fg.ColFormat(11) = "#,###,###,###,###,###,###R";
			fg.ColFormat(12) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(13) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(14) = "#,###,###,###,###,###,###R";
            fg.ColFormat(15) = "#,###,###,###,###,###,###R";
			fg.ColFormat(16) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(17) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(18) = "#,###,###,###,###,###,###R";
            fg.ColFormat(19) = "#,###,###,###,###,###,###R";
        }
        else
        {
            fg.ColFormat(8) = "#,###,###,###,###,###.##R"; 
            fg.ColFormat(9) = "#,###,###,###,###,###.##R"; 
            fg.ColFormat(10) = "#,###,###,###,###,###.##R";
            fg.ColFormat(11) = "#,###,###,###,###,###.##R";
			fg.ColFormat(12) = "#,###,###,###,###,###.##R"; 
            fg.ColFormat(13) = "#,###,###,###,###,###.##R"; 
            fg.ColFormat(14) = "#,###,###,###,###,###.##R";
            fg.ColFormat(15) = "#,###,###,###,###,###.##R";
			fg.ColFormat(16) = "#,###,###,###,###,###.##R"; 
            fg.ColFormat(17) = "#,###,###,###,###,###.##R"; 
            fg.ColFormat(18) = "#,###,###,###,###,###.##R";
            fg.ColFormat(19) = "#,###,###,###,###,###.##R";
        }
		//loadVoucherOpeningBalance();
}
function MergeHeaderSum()
{
/*
		var fg=grdSum.GetGridControl();
		if(fg.Rows < 2)
		{
		   grdSum.AddRow();     
		}
        fg.FixedRows = 2
        fg.MergeCells = 5
		fg.MergeRow(0) = true

        fg.Cell(0, 0, 2, 0, 3) = "Debit"  
		fg.Cell(0, 0, 4, 0, 5) = "Credit"  
		
		fg.Cell(0, 1, 2, 1) = "Transaction"
		fg.Cell(0, 1, 3, 1) = "Book"
		
		fg.Cell(0, 1, 4, 1) = "Transaction"
		fg.Cell(0, 1, 5, 1) = "Book"
		
		fg.MergeCells = 3;
		fg.MergeCol(1) = true
        fg.Cell(0, 0, 1, 1, 1) = "Opening Balance"
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "CCY"
		fg.MergeCol(6) = true
		
		if(rdoSTATUS.GetData()== 2){
			fg.Cell(0, 0, 6, 1, 6) = "CFM Balance"
		}
		else
		{
			fg.Cell(0, 0, 6, 1, 6) = "APP Balance"
		}
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		if(rdoTYPE.GetData()== 'D'){
			fg.ColWidth(0)=1700;
			fg.ColWidth(1)=2000;
			fg.ColWidth(2)=1500;
			fg.ColWidth(3)=2500;
			fg.ColWidth(4)=1500;
			fg.ColWidth(5)=2500;
			fg.ColWidth(6)=2500;
		} 
		else {
			fg.ColWidth(0)=4500;
			fg.ColWidth(1)=1700;
			fg.ColWidth(2)=1500;
			fg.ColWidth(3)=1500;
			fg.ColWidth(4)=1500;
			fg.ColWidth(5)=1500;
			fg.ColWidth(6)=1500;
		}
		var AmountType = rdoAMOUNT.GetData();
		if (AmountType == '1')
		{
			fg.ColWidth(2)=1500;
			fg.ColWidth(4)=1500;
		} else
		{
			fg.MergeCol(3) = true
        	fg.Cell(0, 0, 3, 1, 3) = "Debit"
			fg.MergeCol(5) = true
        	fg.Cell(0, 0, 5, 1, 5) = "Credit"
			fg.ColWidth(2)=0;
			fg.ColWidth(4)=0;
			fg.ColWidth(1)=2500;
			fg.ColWidth(3)=2500;
			fg.ColWidth(5)=2500;
		}
		fg.ColFormat(2) = "#,###,###,###,###,###,###.##R";
		fg.ColFormat(4) = "#,###,###,###,###,###,###.##R";
		*/
		var fg=grdSum.GetGridControl();
		if(fg.Rows < 2)
		{
		   grdSum.AddRow();     
		}
		fg.FrozenCols = 1;
        fg.FixedRows = 2;
        fg.MergeCells = 5;
		fg.MergeRow(0) = true;

        fg.MergeCol(0) = true;
		fg.Cell(0, 0, 0, 1, 0) = "CCY";
		//fg.MergeCol(1) = true;
        fg.Cell(0, 0, 1, 0, 2) = "Opening Balance";
        fg.Cell(0, 1, 1, 1, 1) = "Transaction";
        fg.Cell(0, 1, 2, 1, 2) = "Book";
        
        fg.Cell(0, 0, 3, 0, 4) = "Transaction";
        fg.Cell(0, 1, 3, 1, 3) = "Debit";
        fg.Cell(0, 1, 4, 1, 4) = "Credit";
        
        fg.Cell(0, 0, 5, 0, 6) = "Books";
        fg.Cell(0, 1, 5, 1, 5) = "Debit";
        fg.Cell(0, 1, 6, 1, 6) = "Credit";
        
        fg.Cell(0, 0, 7, 0, 8) = "Acc. Transaction";
        fg.Cell(0, 1, 7, 1, 7) = "Debit";
        fg.Cell(0, 1, 8, 1, 8) = "Credit";
        
        fg.Cell(0, 0, 9, 0, 10) = "Acc. Book";
        fg.Cell(0, 1, 9, 1, 9) = "Debit";
        fg.Cell(0, 1, 10, 1, 10) = "Credit";
        
        fg.Cell(0, 0, 11, 0, 12) = "Closing Balance";
        fg.Cell(0, 1, 11, 1, 11) = "Transaction";
        fg.Cell(0, 1, 12, 1, 12) = "Book";
        
		fg.ColWidth(0)=1000;
		fg.ColWidth(1)=2000;
		fg.ColWidth(2)=2000;
		fg.ColWidth(3)=2000;
		fg.ColWidth(4)=2000;
		fg.ColWidth(5)=2000;
		fg.ColWidth(6)=2000;
		fg.ColWidth(7)=0;
		fg.ColWidth(8)=0;
		fg.ColWidth(9)=0;
		fg.ColWidth(10)=0;
		fg.ColWidth(11)=2000;
		fg.ColWidth(12)=2000;
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		var AmountType = rdoAMOUNT.GetData();
		if (AmountType == '2')//BOOK
		{   
			fg.ColWidth(1)=0;
			fg.ColWidth(3)=0;
			fg.ColWidth(4)=0;
			fg.ColWidth(7)=0;
			fg.ColWidth(8)=0;
			fg.ColWidth(11)=0;
			
			fg.ColWidth(2)=3000;
			fg.ColWidth(5)=3000;
		    fg.ColWidth(6)=3000;
		    fg.ColWidth(12)=3000;
		}
		else if (AmountType == '1') //trans & book
		{
		    fg.ColWidth(1)=1700;
			fg.ColWidth(3)=1700;
			fg.ColWidth(4)=1700;
			fg.ColWidth(7)=0;
			fg.ColWidth(8)=0;
			fg.ColWidth(11)=1700;
			fg.ColWidth(2)=1700;
			fg.ColWidth(5)=1700;
		    fg.ColWidth(6)=1700;
		    fg.ColWidth(12)=1700;
		}
        else
        {
            fg.ColWidth(2)=0;
			fg.ColWidth(5)=0;
			fg.ColWidth(6)=0;
//			fg.ColWidth(7)=3000;
//			fg.ColWidth(8)=3000;
			fg.ColWidth(12)=0;
			
			fg.ColWidth(1)=3000;
			fg.ColWidth(3)=3000;
		    fg.ColWidth(4)=3000;
		    fg.ColWidth(11)=3000;
        }
		
		if(lstBookCcy.GetData() == "VND")
        {
            fg.ColFormat(2) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(5) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(6) = "#,###,###,###,###,###,###R";
            fg.ColFormat(9) = "#,###,###,###,###,###,###R";
            fg.ColFormat(10) = "#,###,###,###,###,###,###R";
            fg.ColFormat(12) = "#,###,###,###,###,###,###R";  
        }
        else
        {
            //Book
            fg.ColFormat(2) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(5) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(6) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(9) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(10) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(12) = "#,###,###,###,###,###,###.##R";
        }
        fg.ColFormat(1) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(3) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(4) = "#,###,###,###,###,###,###.##R";
        fg.ColFormat(7) = "#,###,###,###,###,###,###.##R";
        fg.ColFormat(8) = "#,###,###,###,###,###,###.##R";
        fg.ColFormat(11) = "#,###,###,###,###,###,###.##R";
}	
function OnChangeAmountType()
{
	if (grdVoucher.style.display == 'none')
	{
		MergeHeaderDate();
	} else
	{
		MergeHeaderVoucher();
		MergeHeaderVoucherSum();
	}
	MergeHeaderSum();
}

function GetAccount()
{
    var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCOMPANY.value+'' + "&dsqlid=ac_sel_60080010_acct_partner";
    var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
    if ((object != null) && (object[0]!="0"))
    {
        txtAC_PK.SetDataText("");
        txtAC_CD.SetDataText("");
        txtAC_NM.SetDataText("");
        txtAC_PK.SetDataText(object[3]);
        txtAC_CD.SetDataText(object[0]);
        txtAC_NM.SetDataText(object[1]);
    }
}

function resetAcc(ind)
{
    txtAC_PK.SetDataText("");
    txtAC_CD.SetDataText("");
    txtAC_NM.SetDataText("");
   
}

function GetPartner()
{
    var path = System.RootURL + '/standard/forms/60/08/60080030_popup_customer.aspx';
    var object = System.OpenModal( path ,800 , 630 , 'resizable:yes;status:yes');
    if ( object != null )
    {
        if (object[0] != 0)
        {
            txtTCO_BUSPARTNER_PK.text = object[0];
            txtTCO_BUSPARTNER_CD.text = object[1];
            txtTCO_BUSPARTNER_NM.text = object[2];
        }
    }
}

function resetPartner()
{
    txtTCO_BUSPARTNER_PK.text = "";
    txtTCO_BUSPARTNER_CD.text = "";
    txtTCO_BUSPARTNER_NM.text = "";
}


function OnSearch()
{
//    if(txtAC_PK.text =="")
//    {
//        alert("Please select account");
//        return;
//    }
    
    dso_sel_cust_bal_sum.Call("SELECT");
}

function OnDisplay()
{
    if(rdoTYPE.GetData()== 'D')
   {
      date.style.display="";
      voucher.style.display="none";
	  sumdate.style.display='';
	  sumvoucher.style.display="none";
      MergeHeaderDate();
      
   }
   else
   {
      date.style.display="none";
      voucher.style.display="";
	  sumdate.style.display='none';
	  sumvoucher.style.display="";
      MergeHeaderVoucher();
	  MergeHeaderVoucherSum();
   } 
   
   MergeHeaderSum();
   //OnSearch(); 
}
function loadDateOpeningBalance(){
	var i,liRow;
	var llData;
	liRow = grdDate.rows
	for(i=3;i<liRow;i++){
		grdDate.SetGridText(i,5,grdDate.GetGridData(i-1,10));
	}
}

function loadVoucherOpeningBalance(){
	var i,liRow;
	var llData;
	liRow = grdVoucher.rows
	for(i=3;i<liRow;i++){
		grdVoucher.SetGridText(i,8,grdVoucher.GetGridData(i-1,13));
	}
}



function OnDataReceive(pObject)
{
    switch(pObject.id)
    {
        case "dso_sel_cust_bal_date":
            MergeHeaderDate();
            loadDateOpeningBalance();
            //dso_sel_cust_bal_sum.Call("SELECT");
        break;
        case "dso_sel_cust_bal_voucher":
            MergeHeaderVoucher();    
			MergeHeaderVoucherSum();
			
			var _Acc, _Cus;
			_Acc = grdVoucher.GetGridData(1,6);
			_Cus = grdVoucher.GetGridData(1,21);
			for(i = 2;i<grdVoucher.rows;i++)
			{
				if(_Acc != grdVoucher.GetGridData(i,6) || _Cus != grdVoucher.GetGridData(i,21))
				{
					grdVoucher.SetCellBgColor(i, 0, i, 25, 0xFF9966);
				}
				_Acc = grdVoucher.GetGridData(i,6);
				_Cus = grdVoucher.GetGridData(i,21);
			}
			dso_sel_cust_bal_voucher_sum.Call('SELECT');
        break;
		case "dso_sel_cust_bal_voucher_sum":
			MergeHeaderVoucherSum();
		break;
        case "dso_sel_cust_bal_sum":
            MergeHeaderSum();
            if(rdoTYPE.GetData()== 'D')
            {
                dso_sel_cust_bal_date.Call("SELECT");
            }
            else
            {
                dso_sel_cust_bal_voucher.Call("SELECT");
            }
        break;
    }
}

function OnReport()
{
//alert(lstREPORT.GetData());
    if (txtAC_PK.text=="")
   {
        alert("Please choose Account code!");
        return;
   } 

    if(confirm("Are you sure you want to report ?" ))
    {
        var url ="";
        switch (lstREPORT.GetData())
        {
            case 'S31-DN':
                url = '/standard/reports/gf/ka/gfka00050_soCTTT_S31_DN.aspx?com=' + lstCOMPANY.GetData() + '&sdate=' + txtFROM_DATE.GetData()+ '&edate=' + txtTO_DATE.GetData() + 
                    '&acc_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData();
					//url = '/standard/reports/60/08/rpt_60080350_soCTTT_S31_DN.aspx?com=' + lstCOMPANY.GetData() + '&sdate=' + txtFROM_DATE.GetData()+ '&edate=' + txtTO_DATE.GetData() + //excel new not yet
                    //'&acc_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData();//excel new not yet
					url = '/standard/reports/60/08/rpt_60080350_soCTTT_S31_DN_2.aspx?com=' + lstCOMPANY.GetData() + '&sdate=' + txtFROM_DATE.GetData()+ '&edate=' + txtTO_DATE.GetData() + 
                    '&acc_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+ '&amt_type=' + rdoAMOUNT.GetData();
                break;
            case 'S32-DN':
                url = '/standard/reports/gf/ka/gfka00050_soCTTT_S32_DN.aspx?com=' + lstCOMPANY.GetData() + '&sdate=' + txtFROM_DATE.GetData()+ '&edate=' + txtTO_DATE.GetData() + 
                    '&acc_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData();
                break;
               case 'S31-DN_enclose':
                url = '/standard/reports/gf/ka/gfka00050_soCTTT_S31_DN_Enclose.aspx?com=' + lstCOMPANY.GetData() + '&sdate=' + txtFROM_DATE.GetData()+ '&edate=' + txtTO_DATE.GetData() + 
                    '&acc_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData();
                break;
               case 'S32-DN_enclose':
                url = '/standard/reports/gf/ka/gfka00050_soCTTT_S32_DN_Enclose.aspx?com=' + lstCOMPANY.GetData() + '&sdate=' + txtFROM_DATE.GetData()+ '&edate=' + txtTO_DATE.GetData() + 
                    '&acc_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData();
                break; 
                case 'S31-DN2':
                    url = '/standard/reports/gf/ka/gfka00050_CTTT_NMNB-2_2.aspx?com=' + lstCOMPANY.GetData() + '&sdate=' + txtFROM_DATE.GetData()+ '&edate=' + txtTO_DATE.GetData() + 
                    '&acc_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData();
                break;
                case 'S32-DN2':
                 url = '/standard/reports/gf/ka/gfka00050_SCTTT_NMNT-2.aspx?com=' + lstCOMPANY.GetData() + '&sdate=' + txtFROM_DATE.GetData()+ '&edate=' + txtTO_DATE.GetData() + 
                    '&acc_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData();
                break;
                case 'AS':
                    url = '/standard/reports/gf/ka/gfka00050_AsForm_Voucher.aspx?com=' + lstCOMPANY.GetData() + '&sdate=' + txtFROM_DATE.GetData()+ '&edate=' + txtTO_DATE.GetData() + 
                    '&acc_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData();
                break;
        }    
        System.OpenTargetPage( System.RootURL+url , 'newform' )
    }

}
function RowClick1()
{
    var rows =0;
    var rownum =0;
    var colnum =0;
    var pk = 0;
    var status = "";
    var ls_arr = ""; 

    var ctrl = grdVoucher.GetGridControl();
    rows = ctrl.rows -1;
    
    rownum = ctrl.row;
    if (rownum > 1) 
    {       
        pk = grdVoucher.GetGridData(ctrl.row, 0);
        status = grdVoucher.GetGridData(ctrl.row, 21);
        //for (i = 2; i <= rows ; i++)
        //{   
        //     ls_arr = ls_arr + ' ' + grdVoucher.GetGridData(i, 0);
             
        //} 
        this.name = "60080070";
		alert(rownum);
        var fpath = System.RootURL + '/standard/forms/60/08/60080040_popup.aspx?PK_ROW=' + pk + '&ROW=' + rownum + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
        var wWidth = 950;
        var wHeight = 600;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +"lef="+ x +",top=" + y;
        var object = System.OpenModal(fpath, wWidth, wHeight, features, window);
    }
}
function GetRowPK(row_index){
    if((row_index < grdVoucher.rows) && (row_index > 1)){
        return grdVoucher.GetGridData(row_index, 0);
    }
    return -1;
}

function RowClick()
{
    var ctrl = grdVoucher.GetGridControl();
    var rows = ctrl.Rows
    rows = rows - 1;
    var rownum = ctrl.Row -1;
    var colnum = ctrl.Col;
    if (rownum > 0) 
    {
        //if (event.col > 1)
        //{
        
        var pk = grdVoucher.GetGridData(ctrl.row, 0);
        var status = grdVoucher.GetGridData(ctrl.row, 21);
        var ls_arr = "";
        //for (i = 2; i < grdVoucher.rows ; i++)
        //{
            //ls_arr = ls_arr + ' ' + grdVoucher.GetGridData(i, 0);
        //}
        var fpath = System.RootURL + '/standard/forms/60/08/60080040_popup.aspx?PK_ROW=' + pk + '&ROW=' + ctrl.Row + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
        var wWidth = 950;
        var wHeight = 600;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
        "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
        "lef="+ x +",top=" + y;
		this.name = "60080070";
        var object = System.OpenModal(fpath, wWidth, wHeight, features, window);
       // }
    }
}


</script>
<body style="margin:0; padding:0;">
<gw:data id="dso_sel_cust_bal_date" onreceive="OnDataReceive(this)">
    <xml>
        <dso type="grid" function="ac_sel_60080070_cus_bal_dt">
            <input bind="grdDate">
            <input bind="lstCOMPANY"/>
            <input bind="txtFROM_DATE"/>
            <input bind="txtTO_DATE"/>
            <input bind="txtAC_PK"/>
            <input bind="txtTCO_BUSPARTNER_PK"/>
            <input bind="rdoSTATUS"/>
            <input bind="lstCCY"/>

            </input>
            <output bind="grdDate"/>
        </dso>
    </xml>
</gw:data>

<gw:data id="dso_sel_cust_bal_voucher" onreceive="OnDataReceive(this)">
    <xml>
        <dso type="grid" function="ac_sel_60080070_luongtinh_v">
            <input bind="grdVoucher">
            <input bind="lstCOMPANY"/>
            <input bind="txtFROM_DATE"/>
            <input bind="txtTO_DATE"/>
            <input bind="txtAC_PK"/>
            <input bind="txtTCO_BUSPARTNER_PK"/>
            <input bind="rdoSTATUS"/>
            <input bind="lstCCY"/>
			<input bind="rdoAMOUNT"/>
            </input>
            <output bind="grdVoucher"/>
        </dso>
    </xml>
</gw:data>

<gw:data id="dso_sel_cust_bal_sum" onreceive="OnDataReceive(this)">
    <xml>
        <dso type="grid" function="ac_sel_60080070_cus_bal_sum">
            <input bind="grdDate">
            <input bind="lstCOMPANY"/>
            <input bind="txtFROM_DATE"/>
            <input bind="txtTO_DATE"/>
            <input bind="txtAC_PK"/>
            <input bind="txtTCO_BUSPARTNER_PK"/>
            <input bind="rdoSTATUS"/>
            <input bind="lstCCY"/>

            </input>
            <output bind="grdSum"/>
        </dso>
    </xml>
</gw:data>

<gw:data id="dso_sel_cust_bal_voucher_sum" onreceive="OnDataReceive(this)">
    <xml>
        <dso type="grid" function="ac_sel_60080350_voucher_sum">
            <input bind="grdSumVoucher">
            <input bind="lstCOMPANY"/>
            <input bind="txtFROM_DATE"/>
            <input bind="txtTO_DATE"/>
            <input bind="txtAC_PK"/>
            <input bind="txtTCO_BUSPARTNER_PK"/>
            <input bind="rdoSTATUS"/>
			<input bind="rdoAMOUNT"/>
            </input>
            <output bind="grdSumVoucher"/>
        </dso>
    </xml>
</gw:data>

<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60010020_1" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lstCOMPANY"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!------------------------------------------------------------------------------------------------------->
<table style="width:100%;height:100%" cellpadding="1" cellspacing="1" border="0">
    <tr style="height:2%">
        <td>
            <table width="100%" cellpadding="1" cellspacing="1" border="0">
                <tr>
                    <td width="12%"></td>
                    <td width="11%"></td>
                    <td width="2%"></td>
                    <td width="11%"></td>
                    <td width="12%"></td>
                    <td width="15%"></td>
                    <td width="21%"></td>
                    <td width="10%"></td>
                    <td width="3%"></td>
                    <td width="3%"></td>
                </tr>  
                <tr>
                    <td align="right">Company </td>
                    <td colspan="3"><gw:list id="lstCOMPANY" styles='width:100%'/></td>
                    <td align="right"><a title="Click here to show Account" onclick="GetAccount()" href="#tips" ><b>Account code&nbsp;</b></a></td>
                    <td colspan="3">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="95%"><gw:textbox id="txtAC_PK" styles='display:none'></gw:textbox>
                                                <gw:textbox id="txtAC_CD" styles='width:30%;height:22' csstype="mandatory"/>
                                                <gw:textbox id="txtAC_NM" styles='width:70%;height:22' csstype="mandatory"/></td>
                                <td><gw:imgBtn id="ibtnAccReset" img="reset"  alt="reset acc" onclick="resetAcc()" /></td>
                            </tr>
                        </table>
                    </td>
                    <td></td>
                </tr> 
                <tr>
                    <td align="right">Proposed Date</td>
                    <td align="left" ><gw:datebox id="txtFROM_DATE" styles='width:100%;height:22'  lang="<%=Session("Lang")%>"/></td>
                    <td align="center">~</td>
                    <td align="right"><gw:datebox id="txtTO_DATE" styles='width:100%;height:22'  lang="<%=Session("Lang")%>"/></td>
                    <td align="right"><a title="Click here to show customer" onclick="GetPartner()" href="#tips" ><b>Partner&nbsp;</b></a></td>
                    <td colspan="3">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="95%"><gw:textbox id="txtTCO_BUSPARTNER_PK" styles='display:none'></gw:textbox>
                                                <gw:textbox id="txtTCO_BUSPARTNER_CD" styles='width:30%;height:22'csstype="mandatory"/>
                                                <gw:textbox id="txtTCO_BUSPARTNER_NM" styles='width:70%;height:22' csstype="mandatory"/></td>
                                <td><gw:imgBtn id="ibtnCustReset" img="reset"  alt="reset partner" onclick="resetPartner()" /></td>
                            </tr>
                        </table>
                    </td>
                    <td align="center"></td>
                    <td align="center"></td>
                </tr>
                <tr>
                    <td align="right">Slip Status</td>
                    <td colspan="3"><gw:radio id="rdoSTATUS" value="2" onchange="OnSearch()" styles='height:22'>
                                    <span value="2">Confirmed</span>
                                    <span value="0">Approved</span>
                                    </gw:radio ></td>
                    <td align="right">Inquiry Type</td>
                    <td ><gw:radio id="rdoTYPE" value="2" onchange="OnDisplay()" styles='height:22'>
                                    <span value="D">Date&nbsp;</span>
                                    <span value="V">Voucher</span>
                                    </gw:radio ></td>
                    <td align="right">Currency</td>
                    <td><gw:list id="lstCCY" styles='width:100%' onchange="OnSearch()"/></td>
                    <td></td>
                </tr> 
                <tr>
                    <td align="right">Amount Type</td>
                    <td colspan="3">
                        <gw:radio id="rdoAMOUNT" value="2" onchange="OnChangeAmountType()" styles='height:22'>
                                    <span value="1">Trans & Book</span>
                                    <span value="2">Book</span>
                                    <span value="3">Trans</span>
                                    </gw:radio >
                    </td>
                    <td align="right">Report</td>
                    <td  colspan="3"><gw:list id="lstREPORT" styles='width:100%'/></td>
                    <td align="center"><gw:imgBtn id="ibtnSearch" img="search"  alt="Search" onclick="OnSearch()" /></td>
                    <td align="center"><gw:imgBtn id="ibtnReport" img="printer"   alt="Print Acct"    onclick="OnReport()" /></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="height:68%">
        <td width="100%">
	        <table style="width:100%;height:100%" cellpadding="0" cellspacing="0" border="0">
				<tr id="date" height="70%">
					<td>
						<gw:grid   
						    id="grdDate"  
						    header="Date|_ACC_PK|AC_CD|AC_NM|CCY|OpeningBalance|DebitTransAmount|DebitBookAmount|CreditTransAmount|CreditBookAmount|Balance|_Cust PK|Cust ID|Cust Name"   
						    format  ="4|0|0|0|0|1|1|1|1|1|1|0|0|0"  
						    aligns  ="0|0|0|0|0|3|3|3|3|3|3|0|0|0"  
						    defaults="|||||||||||||"  
						    acceptNullDate="T"
						    editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
						    widths  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
						    styles  ="width:100%; height:100%"   
						    sorting="T"/> 
					</td>
				</tr>
                <tr id="voucher" height="70%">
				<!--header="PK|VoucherNo|Date|User|CCY|_acc_pk|ac_cd|ac nm|OpeningBalance|DebitTransAmount|DebitBookAmount|CreditTransAmount|CreditBookAmount|Balance|cust_pk|cust_id|Partner|Remark|Remark2|Item"   -->
				<!--header="0.PK|1.VoucherNo|2.Date|3.User|4.CCY|5._acc_pk|6.ac_cd|7.ac nm|8.OB Book Dr|9.OB Book Cr|10.OB Trans Dr|11.OB Trans Cr|12.Book Dr|13.Book Cr|14.Trans Dr|15.Trans Cr|16.Closing Book Dr|17.Closing Book Cr|18.Closing Trans Dr|19.Closing Trans Cr|20.cust_pk|21.cust_id|22.Partner|23.Remark|24.Remark2|25.Item"   -->
                    <td>
                        <gw:grid   
						    id="grdVoucher"  
						    header="PK|VoucherNo|Date|User|CCY|_acc_pk|ac_cd|ac nm|OB Book Dr|OB Book Cr|OB Trans Dr|OB Trans Cr|Book Dr|Book Cr|Trans Dr|Trans Cr|Closing Book Dr|Closing Book Cr|Closing Trans Dr|Closing Trans Cr|_cust_pk|cust_id|Partner|Remark|Remark2|Item"   
						    format  ="0|0|4|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0"  
						    aligns  ="0|0|0|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|0|0|0|0|0|0"  
						    defaults="||||||||||||||||||||||||"  
						    acceptNullDate="T"
						    editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
						    widths  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
						    styles="width:100%; height:100%"   
						    sorting="T"
							oncelldblclick ="RowClick()" /> 
                    </td>
                </tr>
			</table>
        </td>
    </tr>
    <tr id='sumdate' style="height:30%">
		<td width="100%">
		    <gw:grid id='grdSum'
                header='CCY|OPEN_FBAL|OPEN_BAL|DR_FSUM|CR_FSUM|DR_SUM|CR_SUM|ACC_DR_FSUM|ACC_CR_FSUM|ACC_DR_SUM|ACC_CR_SUM|CLOSE_FBAL|CLOSE_BAL'
                format='0|1|1|1|1|1|1|1|1|1|1|1|1'
                aligns='0|3|3|3|3|3|3|3|3|3|3|3|3'
                defaults='||||||||||||'
                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0'
                widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                sorting='F'
                styles='width:100%; height:100%'
                />
		</td>
	</tr>
	<tr id='sumvoucher' style="height:30%">
		<td width="100%">
			<gw:grid id='grdSumVoucher'
			header='CCY|Openning DR Balance|Openning CR Balance|dr|cr|Debit Amount|Credit Amount|dr|cr|Acc. Debit Amount|Acc. Credit Amount|dr|cr|Closing DR Balance|Closing CR Balance|dr|cr'
			format='0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
			aligns='1|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
			defaults='||||||||||||||||'
		   editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
			widths='800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800|1800'
			styles  ="width:100%; height:100%"   
			sorting="T"
			oncelldblclick =""/> 
		</td>
	</tr>
</table>
<gw:textbox id="txtUser_Pk"  styles='display:none' />
<gw:textbox id="txtSUM"   style="display:none"/>
<gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
<gw:textbox id="txtAc_level"  styles='display:none' />
<gw:textbox id="txtSesion_company"  styles='display:none' />
</body>
</html>