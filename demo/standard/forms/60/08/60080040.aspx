<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Daily S/L</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script type="text/javascript" language="javascript">
var g_inquiry_type = 10;//Dates :10; Vouchers :20
var Ispopup='';
header='Proposed Date|Ccy|Oppeing Balance|Debit Trans|Credit Trans|Debit Books|Credit Books|Closing Balance|_Date'
var g_D_Proposed_Date = 0,
	g_D_Ccy = 1,
	g_D_Opening_Balance = 2,
	g_D_Debit_Trans = 3,
	g_D_Credit_Trans = 4,
	g_D_Debit_Books = 5,
	g_D_Credit_Books = 6,
	g_D_Closing_Balance = 7,
	g_D_Date = 8;
	
var g_V_Seq = 0,	
	g_V_Voucher_No = 1,	
	g_V_Proposed_Date = 2,	
	g_V_Proposed_By = 3,	
	g_V_Ccy = 4,	
	g_V_Opening_Balance = 5,	
	g_V_Trans_Debit = 6,	
	g_V_Trans_Credit = 7,	
	g_V_Books_Debit = 8,	
	g_V_Books_Credit = 9,	
	g_V_CFM_Balance = 10,	
	g_V_Customer_Name = 11,	
	g_V_Description_Foreign = 12,	
	g_V_Description_Local = 13,	
	g_V_tr_date_filter = 14;
	
var g_S_CCY = 0,	
	g_S_OPENING_BALANCE = 1,
	g_S_DEBIT_TRANS_AMOUNT = 2,
	g_S_DEBIT_BOOK_AMOUNT = 3,
	g_S_CREDIT_TRANS_AMOUNT = 4,
	g_S_CREDIT_BOOK_AMOUNT = 5,
	g_S_CLOSING_BALANCE = 6,
	g_S_OB = 7;
function BodyInit()
{
    System.Translate(document);
    _Voucher.style.display="none";
    BindingDataList();
    FormatSumGrid() ;
    FormatDateGrid();
    txtUser_Pk.text = "<%=Session("USER_PK")%>";
   dso_getCompany.Call();
}

function BindingDataList()
{
    var ls_data   = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_data1 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE_NM  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='HRAB0180' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 order by code_nm")%>";
    var ls_data3 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
    var ls_data4 = "<%=CtlLib.SetListDataSQL("SELECT 'ALL' C1,'<All>' C2  FROM DUAL UNION ALL SELECT C1,C2 FROM ( SELECT TRIM(A.CODE) C1, A.CODE C2 FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0 AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY NUM_VALUE1)")%>";
    var ls_data5 = "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK002' and d.use_yn = 'Y' ORDER BY D.DEF_YN DESC, D.ORD ")%>";
    var ls_data6 ="<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_LNM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACAB021'  ORDER BY D.DEF_YN DESC, D.ORD")%>";
    var ls_Circulars = "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='AC150001' ORDER BY D.DEF_YN DESC")%>";
lstCirculars.SetDataText(ls_Circulars);
	lstCompany.SetDataText(ls_data);
   lstCompany.value="<%=session("company_pk") %>"; 
    lstLanguage.SetDataText(ls_data1); 
    lstBookCcy.SetDataText(ls_data3); 
    lstCurrency.SetDataText(ls_data4); 
    lstReportType.SetDataText(ls_data5); 
    lstRptOption.SetDataText(ls_data6); 
    txtAccCode.SetEnable(false); 
    txtAccName.SetEnable(false);
}

function onGetAcc()
{
var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_sel_60030010_sum_parent";
var aValue = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
        if (aValue != null)
        {
            if(aValue[0] != 0)
            {
                txtAccCode.SetDataText(aValue[0]);
                txtAccName.SetDataText(aValue[1]);
                txtAccPK.SetDataText(aValue[3]);
            }
        }
}

function onResetAcc()
{
        txtAccPK.text = '';
        txtAccCode.text = '';
        txtAccName.text = '';
}

function onChangeFormat()
{
        if (rdoAmountType.value==1)//Trans & Books
        {
            if (g_inquiry_type==10)//Dates :10; 
            {
                var fg=grdSLByDate.GetGridControl();
                fg.ColWidth(g_D_Debit_Trans)=2000;
			    fg.ColWidth(g_D_Credit_Trans)=2000;
			    fg.ColWidth(g_D_Debit_Books)=2000;
			    fg.ColWidth(g_D_Credit_Books)=2000; 
            }
            if (g_inquiry_type==20)//Vouchers :20
            {
                var fg =  grdSLByVoucher.GetGridControl();
                fg.ColWidth(g_V_Trans_Debit)=1500;
                fg.ColWidth(g_V_Trans_Credit)=1500;
                fg.ColWidth(g_V_Books_Debit)=1500;
                fg.ColWidth(g_V_Books_Credit)=1500; 
            }
          
        }
        else if (rdoAmountType.value==2)//2: Books
        {
             if (g_inquiry_type==10)//Dates :10; 
            {
                 var fg=grdSLByDate.GetGridControl();
                fg.ColWidth(g_D_Debit_Trans)=0;
			    fg.ColWidth(g_D_Credit_Trans)=0;
			    fg.ColWidth(g_D_Debit_Books)=3000;
			    fg.ColWidth(g_D_Credit_Books)=3000; 
            }
            if (g_inquiry_type==20)//Vouchers :20
            {
                var fg =  grdSLByVoucher.GetGridControl();
                fg.ColWidth(g_V_Trans_Debit)= 0;
                fg.ColWidth(g_V_Trans_Credit)= 0;
                fg.ColWidth(g_V_Books_Debit)=1500;
                fg.ColWidth(g_V_Books_Credit)=1500; 
            }
        }
        else//trans
        {
             if (g_inquiry_type==10)//Dates :10; 
            {
                 var fg=grdSLByDate.GetGridControl();
                fg.ColWidth(g_D_Debit_Books)=0;
			    fg.ColWidth(g_D_Credit_Books)=0;
			    fg.ColWidth(g_D_Debit_Trans)=3000;
			    fg.ColWidth(g_D_Credit_Trans)=3000; 
            }
            if (g_inquiry_type==20)//Vouchers :20
            {
                var fg =  grdSLByVoucher.GetGridControl();
                fg.ColWidth(g_V_Books_Debit)= 0;
                fg.ColWidth(g_V_Books_Credit)= 0;
                fg.ColWidth(g_V_Trans_Debit)=1500;
                fg.ColWidth(g_V_Trans_Credit)=1500; 
            }
        }
          FormatSumGrid();
}

function FormatDateGrid()
{
        if(grdSLByDate.rows <2)
       {
            grdSLByDate.AddRow();
       } 
        var fg=grdSLByDate.GetGridControl();
		
        fg.FixedRows = 2;
        fg.MergeCells = 5;
		fg.MergeRow(0) = true;

		fg.MergeCol(g_D_Proposed_Date) = true;
        fg.Cell(0, 0, g_D_Proposed_Date, 1, g_D_Proposed_Date) = "Date";
		fg.MergeCol(g_D_Ccy) = true;
		fg.Cell(0, 0, g_D_Ccy, 1, g_D_Ccy) = "CCY";
		fg.MergeCol(g_D_Opening_Balance) = true;
		fg.Cell(0, 0, g_D_Opening_Balance, 1, g_D_Opening_Balance) = "Opening Balance";
		
		fg.Cell(0, 0, g_D_Debit_Trans, 0, g_D_Credit_Trans) = "Trans";  
		fg.Cell(0, 0, g_D_Debit_Books, 0, g_D_Credit_Books) = "Books";
		
		fg.Cell(0, 1, g_D_Debit_Trans, 1) = "Debit";
		fg.Cell(0, 1, g_D_Credit_Trans, 1) = "Credit";
		
		fg.Cell(0, 1, g_D_Debit_Books, 1) = "Debit";
		fg.Cell(0, 1, g_D_Credit_Books, 1) = "Credit";
		
		fg.MergeCol(g_D_Closing_Balance) = true;
		
		if(rdoSlipStatus.value== "2"){
			fg.Cell(0, 0, g_D_Closing_Balance, 1, g_D_Closing_Balance) = "CFM Balance";
		}
		if (rdoSlipStatus.value== "0"){
			fg.Cell(0, 0, g_D_Closing_Balance, 1, g_D_Closing_Balance) = "APP Balance";
		}
		if (rdoSlipStatus.value== "4"){
			fg.Cell(0, 0, g_D_Closing_Balance, 1, g_D_Closing_Balance) = "NAPP Balance";
		}
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		fg.ColWidth(g_D_Proposed_Date)=1500;
		fg.ColWidth(g_D_Ccy)=800;
		fg.ColWidth(g_D_Opening_Balance)=2000;
		
		fg.ColWidth(g_D_Debit_Trans)=2000;
		fg.ColWidth(g_D_Credit_Trans)=2000;
		
		fg.ColWidth(g_D_Debit_Books)=2000;
		fg.ColWidth(g_D_Credit_Books)=2000;
		
		fg.ColWidth(g_D_Closing_Balance)=2000;
		fg.ColWidth(g_D_Date)=0;
		var AmountType = rdoAmountType.GetData();
		if (AmountType == '1') // Trans & Books
		{
			fg.ColWidth(g_D_Debit_Trans)=2000;
			fg.ColWidth(g_D_Credit_Trans)=2000;
			fg.ColWidth(g_D_Debit_Books)=2000;
			fg.ColWidth(g_D_Credit_Books)=2000;
		} else // Only Books
		{
			fg.ColWidth(g_D_Debit_Trans)=0;
			fg.ColWidth(g_D_Credit_Trans)=0;
			fg.ColWidth(g_D_Debit_Books)=3000;
			fg.ColWidth(g_D_Credit_Books)=3000;
		}
		/*if (lstBookCcy.value=="VND")
		{
		    fg.ColFormat(2) = "#,###,###,###,###";
		    fg.ColFormat(5) = "#,###,###,###,###";
		    fg.ColFormat(6) = "#,###,###,###,###";
		    fg.ColFormat(7) = "#,###,###,###,###";
		}
		else
		{
		    fg.ColFormat(2) = "#,###,###,###,###.##";
		    fg.ColFormat(5) = "#,###,###,###,###.##";
		    fg.ColFormat(6) = "#,###,###,###,###.##";
		    fg.ColFormat(7) = "#,###,###,###,###.##";
		}
		
		fg.ColFormat(3) = "#,###,###,###,###.##";
		fg.ColFormat(4) = "#,###,###,###,###.##";
		*/
		fg.ColAlignment(g_D_Opening_Balance) = flexAlignRightCenter;
		fg.ColAlignment(g_D_Debit_Trans) = flexAlignRightCenter;
		fg.ColAlignment(g_D_Credit_Trans) = flexAlignRightCenter;
		fg.ColAlignment(g_D_Debit_Books) = flexAlignRightCenter;
		fg.ColAlignment(g_D_Credit_Books) = flexAlignRightCenter;
		fg.ColAlignment(g_D_Closing_Balance) = flexAlignRightCenter;
		
		//fg.ColAlignment(i) = flexAlignRightCenter;
}

function FormatVoucherGrid()
{
        if(grdSLByVoucher.rows <2)
        {
            grdSLByVoucher.AddRow();
        } 
        var fg =  grdSLByVoucher.GetGridControl();
        fg.FixedRows = 2;
        fg.MergeCells = 5;
        fg.FrozenCols = g_V_Opening_Balance;

        fg.MergeRow(0) = true;

        fg.MergeCol(g_V_Seq) = true;
        fg.Cell(0, 0, g_V_Seq, 1, g_V_Seq) = "Seq";

        fg.MergeCol(g_V_Voucher_No) = true;
        fg.Cell(0, 0, g_V_Voucher_No, 1, g_V_Voucher_No) = "Voucher No";
        
        fg.MergeCol(g_V_Proposed_Date) = true;
        fg.Cell(0, 0, g_V_Proposed_Date, 1, g_V_Proposed_Date) = "Proposed Date";
        
        fg.MergeCol(g_V_Proposed_By) = true;
        fg.Cell(0, 0, g_V_Proposed_By, 1, g_V_Proposed_By) = "Proposed By";
        
        fg.MergeCol(g_V_Ccy) = true;
        fg.Cell(0, 0, g_V_Ccy, 1, g_V_Ccy) = "Ccy";
        
        fg.MergeCol(g_V_Opening_Balance) = true;
        fg.Cell(0, 0, g_V_Opening_Balance, 1, g_V_Opening_Balance) = "Opening Balance";
        
        fg.Cell(0,0,g_V_Trans_Debit,0,g_V_Trans_Credit) = "Trans";
        fg.Cell(0,1,g_V_Trans_Debit,1,g_V_Trans_Debit) = "Debit";
        fg.Cell(0,1,g_V_Trans_Credit,1,g_V_Trans_Credit) = "Credit";
        
        fg.Cell(0,0,g_V_Books_Debit,0,g_V_Books_Credit) = "Books";
        fg.Cell(0,1,g_V_Books_Debit,1,g_V_Books_Debit) = "Debit";
        fg.Cell(0,1,g_V_Books_Credit,1,g_V_Books_Credit) = "Credit";
        
        fg.MergeCol(g_V_CFM_Balance) = true;
        fg.Cell(0, 0, g_V_CFM_Balance, 1, g_V_CFM_Balance) = "CFM Balance";
        
        fg.MergeCol(g_V_Customer_Name) = true;
        fg.Cell(0, 0, g_V_Customer_Name, 1, g_V_Customer_Name) = "Customer Name";
        
        fg.Cell(0,0,g_V_Description_Foreign,0,g_V_Description_Local) = "Description";
        fg.Cell(0,1,g_V_Description_Foreign,1,g_V_Description_Foreign) = "Foreign";
        fg.Cell(0,1,g_V_Description_Local,1,g_V_Description_Local) = "Local";
        
       fg.ColWidth(g_V_Seq)=600;
		fg.ColWidth(g_V_Voucher_No)=1500;
		fg.ColWidth(g_V_Proposed_Date)=1100;
		fg.ColWidth(g_V_Proposed_By)=1200;
		fg.ColWidth(g_V_Ccy)=500;
		fg.ColWidth(g_V_Opening_Balance)=1700;
		fg.ColWidth(g_V_Trans_Debit)=1500;
		fg.ColWidth(g_V_Trans_Credit)=1500;
		fg.ColWidth(g_V_Books_Debit)=1500;
		fg.ColWidth(g_V_Books_Credit)=1500;
		fg.ColWidth(g_V_CFM_Balance)=2000;
		fg.ColWidth(g_V_Customer_Name)=1500;
		fg.ColWidth(g_V_Description_Foreign)=1500;
		fg.ColWidth(g_V_Description_Local)=1500;
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		var AmountType = rdoAmountType.GetData();
		if (AmountType == '1') // Trans & Books
		{
			fg.ColWidth(g_V_Trans_Debit)=1500;
		    fg.ColWidth(g_V_Trans_Credit)=1500;
		    fg.ColWidth(g_V_Books_Debit)=1500;
		    fg.ColWidth(g_V_Books_Credit)=1500;
		} else // Only Books
		{
			fg.ColWidth(g_V_Trans_Debit)= 0;
		    fg.ColWidth(g_V_Trans_Credit)= 0;
		    fg.ColWidth(g_V_Books_Debit)=1500;
		    fg.ColWidth(g_V_Books_Credit)=1500;
		}
		/*if (lstBookCcy.value=="VND")
		{
		    fg.ColFormat(5) = "#,###,###,###,###";
		    fg.ColFormat(8) = "#,###,###,###,###";
		    fg.ColFormat(9) = "#,###,###,###,###";
		    fg.ColFormat(10) = "#,###,###,###,###";
		}
		else
		{
		    fg.ColFormat(5) = "#,###,###,###,###.##";
		    fg.ColFormat(8) = "#,###,###,###,###.##";
		    fg.ColFormat(9) = "#,###,###,###,###.##";
		    fg.ColFormat(10) = "#,###,###,###,###.##"; 
		}
		fg.ColFormat(6) = "#,###,###,###,###.##";
		fg.ColFormat(7) = "#,###,###,###,###.##";
		*/
		fg.ColAlignment(g_V_Opening_Balance) = flexAlignRightCenter;
		fg.ColAlignment(g_V_Trans_Debit) = flexAlignRightCenter;
		fg.ColAlignment(g_V_Trans_Credit) = flexAlignRightCenter;
		fg.ColAlignment(g_V_Books_Debit) = flexAlignRightCenter;
		fg.ColAlignment(g_V_Books_Credit) = flexAlignRightCenter;
		fg.ColAlignment(g_V_CFM_Balance) = flexAlignRightCenter;
		
}
function FormatSumGrid()
{
     if(grdSLSum.rows <2)
       {
            grdSLSum.AddRow();
       } 
        var fg=grdSLSum.GetGridControl();
		
        fg.FixedRows = 2;
		fg.MergeRow(0) = true;
        fg.MergeCells = 3;
		fg.MergeCol(g_S_CCY) = true;
		fg.Cell(0, 0, g_S_CCY, 1, g_S_CCY) = "Opening Balance";
		
		
		fg.MergeCol(g_S_OPENING_BALANCE) = true;
		fg.Cell(0, 0, g_S_OPENING_BALANCE, 1, g_S_OPENING_BALANCE) = "Ccy";
		
		fg.Cell(0, 0, g_S_DEBIT_TRANS_AMOUNT, 0, g_S_DEBIT_BOOK_AMOUNT) = "Trans";  
		fg.Cell(0, 0, g_S_CREDIT_TRANS_AMOUNT, 0, g_S_CREDIT_BOOK_AMOUNT) = "Books";
		
		fg.Cell(0, 1, g_S_DEBIT_TRANS_AMOUNT, 1) = "Debit";
		fg.Cell(0, 1, g_S_DEBIT_BOOK_AMOUNT, 1) = "Credit";
		
		fg.Cell(0, 1, g_S_CREDIT_TRANS_AMOUNT, 1) = "Debit";
		fg.Cell(0, 1, g_S_CREDIT_BOOK_AMOUNT, 1) = "Credit";
		
		fg.MergeCol(g_S_CLOSING_BALANCE) = true;
		
		if(rdoSlipStatus.value== "2"){
			fg.Cell(0, 0, g_S_CLOSING_BALANCE, 1, g_S_CLOSING_BALANCE) = "CFM Balance";
		}
		if (rdoSlipStatus.value== "0"){
			fg.Cell(0, 0, g_S_CLOSING_BALANCE, 1, g_S_CLOSING_BALANCE) = "APP Balance";
		}
		if (rdoSlipStatus.value== "4"){
			fg.Cell(0, 0, g_S_CLOSING_BALANCE, 1, g_S_CLOSING_BALANCE) = "NAPP Balance";
		}
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		fg.ColWidth(g_S_CCY)=2300;
		fg.ColWidth(g_S_OPENING_BALANCE)=2000;
		
		fg.ColWidth(g_S_CLOSING_BALANCE)=2000;
		fg.ColWidth(g_S_OB)=0;
		var AmountType = rdoAmountType.GetData();
		if (AmountType == '1') // Trans & Books
		{
			fg.ColWidth(g_S_DEBIT_TRANS_AMOUNT)=2000;
			fg.ColWidth(g_S_DEBIT_BOOK_AMOUNT)=2000;
			fg.ColWidth(g_S_CREDIT_TRANS_AMOUNT)=2000;
			fg.ColWidth(g_S_CREDIT_BOOK_AMOUNT)=2000;
		} else if (AmountType == '2') // Only Books
		{
			fg.ColWidth(g_S_DEBIT_TRANS_AMOUNT)=0;
			fg.ColWidth(g_S_DEBIT_BOOK_AMOUNT)=0;
			fg.ColWidth(g_S_CREDIT_TRANS_AMOUNT)=3000;
			fg.ColWidth(g_S_CREDIT_BOOK_AMOUNT)=3000;
		}
        else//trans
		{
			fg.ColWidth(g_S_CREDIT_TRANS_AMOUNT)=0;
			fg.ColWidth(g_S_CREDIT_BOOK_AMOUNT)=0;
			fg.ColWidth(g_S_DEBIT_TRANS_AMOUNT)=3000;
			fg.ColWidth(g_S_DEBIT_BOOK_AMOUNT)=3000;
		}
		if (lstBookCcy.value=="VND")
		{
		    fg.ColFormat(g_S_CCY) = "#,###,###,###,###";
		    fg.ColFormat(g_S_CREDIT_TRANS_AMOUNT) = "#,###,###,###,###";
		    fg.ColFormat(g_S_CREDIT_BOOK_AMOUNT) = "#,###,###,###,###";
		    fg.ColFormat(g_S_CLOSING_BALANCE) = "#,###,###,###,###";
		}
		else
		{
		    fg.ColFormat(g_S_CCY) = "#,###,###,###,###.##";
		    fg.ColFormat(g_S_CREDIT_TRANS_AMOUNT) = "#,###,###,###,###.##";
		    fg.ColFormat(g_S_CREDIT_BOOK_AMOUNT) = "#,###,###,###,###.##";
		    fg.ColFormat(g_S_CLOSING_BALANCE) = "#,###,###,###,###.##";		    
		}
		
		fg.ColFormat(g_S_DEBIT_TRANS_AMOUNT) = "#,###,###,###,###.##";
		fg.ColFormat(g_S_DEBIT_BOOK_AMOUNT) = "#,###,###,###,###.##";
	
		
		fg.ColAlignment(g_S_CCY) = flexAlignRightCenter;
		fg.ColAlignment(g_S_DEBIT_TRANS_AMOUNT) = flexAlignRightCenter;
		fg.ColAlignment(g_S_DEBIT_BOOK_AMOUNT) = flexAlignRightCenter;
		fg.ColAlignment(g_S_CREDIT_TRANS_AMOUNT) = flexAlignRightCenter;
		fg.ColAlignment(g_S_CREDIT_BOOK_AMOUNT) = flexAlignRightCenter;
		fg.ColAlignment(g_S_CLOSING_BALANCE) = flexAlignRightCenter;
		
}
function onSearch()
{  
        if(Trim(txtAccPK.text)=="")
       {
         alert('Please select an account ');
         return;
       }
      if (rdoInquiryType.value=="1")//Report type is Date
      {
            _Date.style.display="";
            grdSLByDate.ClearData();
            _Voucher.style.display="none";
            g_inquiry_type =10;
            FormatDateGrid();
      }
      if (rdoInquiryType.value=="2")//Report type is Voucher
      {
            _Date.style.display="none";
            _Voucher.style.display="";
            grdSLByVoucher.ClearData();
            g_inquiry_type =20;
            FormatVoucherGrid();
      }
      
      datSLSum.Call('SELECT');
      //grdSLByDate.
}

function ReplaceACharacter(vStr,vChar)
{
    var i;
	for(i=0;i<vStr.length;i++)
	{
		if(vStr.substr(i,1)== vChar)
		{
			vStr=vStr.replace(vChar,"");
		}
	}
	return vStr;
}


function OnDataReceive(dsql)
{
    if (dsql.id=="datSLSum")
   {
        FormatSumGrid();
         if(grdSLSum.rows > 2)
       {	
		    txtOpenBalance.text = parseFloat(ReplaceACharacter(Trim(grdSLSum.GetGridData(2,g_S_CCY)),","));
       }else{
   		    txtOpenBalance.text = 0;
       }
      //Merge Balance column
      
       
        if(g_inquiry_type==10)
        {
            datSLByDate.Call('SELECT');
        }
        if(g_inquiry_type==20)
        {
            datSLByVoucher.Call('SELECT');
        }
        return;
   } 
   if(dsql.id=="datSLByDate")
   {
         FormatDateGrid();
         makeOpenBalanceByDate();
   }
   
   if(dsql.id=="datSLByVoucher")
   {
         FormatVoucherGrid();
         makeOpenBalanceByVoucher();
   }
}

function makeOpenBalanceByDate()
{
    if (grdSLByDate.rows >2)
   {
        for(i=3;i<grdSLByDate.rows;i++)
        {
            grdSLByDate.SetGridText(i,g_D_Opening_Balance,grdSLByDate.GetGridData(i-1,g_D_Closing_Balance));
        }
   } 
}

function makeOpenBalanceByVoucher()
{
    if (grdSLByVoucher.rows >2)
   {
        for(i=3;i<grdSLByVoucher.rows;i++)
        {
            grdSLByVoucher.SetGridText(i,g_V_Opening_Balance,grdSLByVoucher.GetGridData(i-1,g_V_CFM_Balance));
        }
   } 
}


function OnDataError(dsql)
{
  //alert(dsql.id);
}

function RowClick()
{
   var rows =0;
    var rownum =0;
    var colnum =0;
    var pk = 0;
    var status = "";
    var ls_arr = ""; 

    var ctrl = grdSLByVoucher.GetGridControl();
    rows = ctrl.Rows;
    rows = rows - 1;
    rownum = ctrl.row;
    pk = grdSLByVoucher.GetGridData(ctrl.row, g_V_Seq);
    tatus = grdSLByVoucher.GetGridData(ctrl.row, g_V_Trans_Debit);
//    for (i = 1; i < grdSLByVoucher.rows; i++)
//    {
//        ls_arr = ls_arr + ' ' + grdSLByVoucher.GetGridData(i, 0);
//    } 

    if (rownum > 0) 
    {
        var fpath = System.RootURL + '/standard/forms/60/08/60080040_popup.aspx?PK_ROW=' + pk + '&ROW=' + rownum + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
        var wWidth = 950;
        var wHeight = 600;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +"lef="+ x +",top=" + y;
        this.name = "60080040" ;        
        var object = System.OpenModal(fpath, wWidth, wHeight, features, window);
    }
}

function GetRowPK(row_index){
    if((row_index < grdSLByVoucher.rows) && (row_index > 0)){
        return grdSLByVoucher.GetGridData(row_index, 0);
    }
    return -1;
}


function OnReport(lang)
{
switch(lang)
    {
        case "VIE":
                    if(Trim(txtAccPK.text)=="")
                   {
                     alert('Please select an account ');
                     return;
                   }
               var rqt = "";
               rqt = "?company_pk="+lstCompany.value+'&account_pk='+txtAccPK.text+'&dtbFrom='+dtbFrom.value+'&dtbTo='+dtbTo.value+'&ccy='+lstCurrency.value+'&status='+rdoSlipStatus.value+'&bookccy='+lstBookCcy.value+'&rptOption='+lstRptOption.value+'&circulars='+lstCirculars.value;
               
               //Nhat ky chi tien
               if (lstReportType.value=="S03a2-DN")
               {
                        //var s = new String(txtAccCode.text)
		                //if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		               // {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoNKchitienS03a2-DN.aspx'+rqt;
                             //   System.OpenTargetPage( url , 'newform' );
                               // return;
							//	 var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoNKchitien_DN_Viet.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		               // }
		              //  else
		               // {
		              //      alert("This is not payment acount code");
		               //    return; 
		             //   }
                        
               }
               //Nhat ky thu tien
                if (lstReportType.value=="S03a1-DN")
               {
                      /*  var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoNKthutienS03a1-DN.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                } */
		               var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoNKthutienS03a1-DN.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;   
								//var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoNKthutien_DN_Viet.aspx'+rqt;
                                //System.OpenTargetPage( url , 'newform' );
                                //return; 
								
               }
               //So quy tien mat
                if (lstReportType.value=="S07-DN")
               {
                      /*  var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_Soquy_S07-DN.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }*/
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_Soquy_S07-DN.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;      
					//  var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_Soquy_DN_Viet.aspx'+rqt;
                    //System.OpenTargetPage( url , 'newform' );
                    //return;
               }
			   

               //So quy chi tiet tien mat
               if (lstReportType.value=="S07a-DN")
               {
                 /*        var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoKToanCTquy_S07a-DN.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  */
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoKToanCTquy_S07a-DN.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;    
					//var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoquyCTTM_DN_Viet.aspx'+rqt;
                    //System.OpenTargetPage( url , 'newform' );
                    //return; 
               }
               
               //T So quy chi tiet tien mat
               if (lstReportType.value=="TSQCTTM")
               {
                   /*    var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SCTQT.aspx'+rqt; gfka00020_T_SCTQT
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  */
		             var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SCTQT.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;    
					//  var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TSoQuyCTTM_Viet.aspx'+rqt;
                    //System.OpenTargetPage( url , 'newform' );
                    //return;    
               }
               
               //So cai
                if (lstReportType.value=="S01-DN")
               {
                     /*   var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                } 
		               */
            		    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return; 
							//var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_Socai_DN_Viet.aspx'+rqt;
                            //System.OpenTargetPage( url , 'newform' );
                            //return;
							
               }
               //T so cai
                if (lstReportType.value=="TGL")
               {
                    /* var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SOCAI.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
		                
		            */
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SOCAI.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;   
					 //var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TSocai_Viet.aspx'+rqt;
                    //System.OpenTargetPage( url , 'newform' );
                    //return;
               }
               
               //Daily SL
               
               if (lstReportType.value=="AS")
               {
                    var url ="";
                    if (lstBookCcy.value==lstCurrency.value)
                    {
                        url =System.RootURL + '/standard/reports/gf/ka/gfka00020_DailySL.aspx'+rqt;
                     }
                     else
                     {
                            url =System.RootURL + '/standard/reports/gf/ka/gfka00020_DailySL_CCY_VIE.aspx'+rqt;
                     }
                    System.OpenTargetPage( url , 'newform' );
                    return;
               }
               
               
               //Tai khoan doi ung phat sinh no
                 if (lstReportType.value=="S01-DN-DR")
               {
                  /*  var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_TKDUPSN.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                        }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return;  rpt_60080040_TKDUPSN_Viet
		                }  */
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_TKDUPSN.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;   
					// var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TKDUPSN_Viet.aspx'+rqt;
                    //System.OpenTargetPage( url , 'newform' );
                    //return;    
               }
               //Tai khoan doi ung phat sinh co
                  if (lstReportType.value=="S01-DN-CR")
               {
                  /*       var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_TKDUPSC.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                        }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  */
		            //var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TKDUPSCo_Viet.aspx'+rqt;
					var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_TKDUPSC.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;     
               }
              //Tai khoan doi ung tong phat sinh no
                if (lstReportType.value=="TGL-DR")
               {
                    /* var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_taikhoan_doiung_tongphatsinh_1.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                          }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                } */
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_taikhoan_doiung_tongphatsinh_1.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;   
					//  var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TKDUTongPSN_Viet.aspx'+rqt;
                    //System.OpenTargetPage( url , 'newform' );
                    //return; 
               }
               //Tai khoan doi ung tong phat sinh co
                if (lstReportType.value=="TGL-CR")
               {
                   /*  var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_taikhoan_doiung_tongphatsinh_2.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                         }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                } */ 
		             var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_taikhoan_doiung_tongphatsinh_2.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;    
					//   var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TKDUTongPSNCo_Viet.aspx'+rqt;
                    //System.OpenTargetPage( url , 'newform' );
                    //return;    
               }
               
               if (lstReportType.value=="S08DN2")
               {
		            /*var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoguitienNH.aspx'+rqt; //?company_pk=" + lstCompany.value +  "&bank_pk=0" + "&dtbFrom=" + dtbFrom.value + "&dtbTo=" + dtbTo.value + "&ccy=" + lstCurrency.value + "&status=" + rdoSlipStatus.value + "&bookccy=" + lstBookCcy.value + "&account_pk=" + txtAccPK.GetData();
                    System.OpenTargetPage( url , 'newform' );
                    return;    */
					var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_NH_S07-DN.aspx'+rqt; //?company_pk=" + lstCompany.value +  "&bank_pk=0" + "&dtbFrom=" + dtbFrom.value + "&dtbTo=" + dtbTo.value + "&ccy=" + lstCurrency.value + "&status=" + rdoSlipStatus.value + "&bookccy=" + lstBookCcy.value + "&account_pk=" + txtAccPK.GetData();
                    System.OpenTargetPage( url , 'newform' );
                    return;   
               }
               if (lstReportType.value=="S38-DN") //Sổ chi tiết tài khoản
               {
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00160_SoChitietTK_S38-DN_VIE.aspx'+rqt; //?company_pk=" + lstCompany.value +  "&bank_pk=0" + "&dtbFrom=" + dtbFrom.value + "&dtbTo=" + dtbTo.value + "&ccy=" + lstCurrency.value + "&status=" + rdoSlipStatus.value + "&bookccy=" + lstBookCcy.value + "&account_pk=" + txtAccPK.GetData();
                    System.OpenTargetPage( url , 'newform' );
                    return;    
					//   var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoChiTietTK_viet.aspx'+rqt; //?company_pk=" + lstCompany.value +  "&bank_pk=0" + "&dtbFrom=" + dtbFrom.value + "&dtbTo=" + dtbTo.value + "&ccy=" + lstCurrency.value + "&status=" + rdoSlipStatus.value + "&bookccy=" + lstBookCcy.value + "&account_pk=" + txtAccPK.GetData();
                    //System.OpenTargetPage( url , 'newform' );
                    //return;    
               }
               if (lstReportType.value=="S38-DN2") //Sổ chi tiết tài khoản 2
               {
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00160_SoChitietTK_S38-DN2_VIE.aspx'+rqt; //?company_pk=" + lstCompany.value +  "&bank_pk=0" + "&dtbFrom=" + dtbFrom.value + "&dtbTo=" + dtbTo.value + "&ccy=" + lstCurrency.value + "&status=" + rdoSlipStatus.value + "&bookccy=" + lstBookCcy.value + "&account_pk=" + txtAccPK.GetData();
                    System.OpenTargetPage( url , 'newform' );
                    return;    
               }
               if(lstReportType.value == 'S01-DN-CT')
               {
                    //alert('test');
            		    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN_CostCenter.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;                    
			   }
			   if(lstReportType.value == 'S01-DN-BIZ-CC')
               {
                    //alert('test');
            		    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN_BIZ-CC.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;                    
			   }
			   
			   	
    break;
    case "ENG":
         
          
          if(Trim(txtAccPK.text)=="")
                   {
                     alert('Please select an account ');
                     return;
                   }
               var rqt = "";
               rqt = "?company_pk="+lstCompany.value+'&account_pk='+txtAccPK.text+'&dtbFrom='+dtbFrom.value+'&dtbTo='+dtbTo.value+'&ccy='+lstCurrency.value+'&status='+rdoSlipStatus.value+'&bookccy='+lstBookCcy.value+'&rptOption='+lstRptOption.value+'&circulars='+lstCirculars.value;
               
        if(lstReportType.value == 'S01-DN-BIZ-CC')
               {
                    //alert('test');
            		    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN_BIZ-CC.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;                    
			   }
		//So cai
		if (lstReportType.value=="S38-DN2") //Sổ chi tiết tài khoản 2
               {
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00160_SoChitietTK_S38-DN2_VIE.aspx'+rqt; //?company_pk=" + lstCompany.value +  "&bank_pk=0" + "&dtbFrom=" + dtbFrom.value + "&dtbTo=" + dtbTo.value + "&ccy=" + lstCurrency.value + "&status=" + rdoSlipStatus.value + "&bookccy=" + lstBookCcy.value + "&account_pk=" + txtAccPK.GetData();
                    System.OpenTargetPage( url , 'newform' );
                    return;    
               }    
       if (lstReportType.value=="S38-DN") //Sổ chi tiết tài khoản
               {
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00160_SoChitietTK_S38-DN_ENG.aspx'+rqt; //?company_pk=" + lstCompany.value +  "&bank_pk=0" + "&dtbFrom=" + dtbFrom.value + "&dtbTo=" + dtbTo.value + "&ccy=" + lstCurrency.value + "&status=" + rdoSlipStatus.value + "&bookccy=" + lstBookCcy.value + "&account_pk=" + txtAccPK.GetData();
                  //  System.OpenTargetPage( url , 'newform' );
                  //  return;    
				//	   var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoChiTietTK_viet.aspx'+rqt; //?company_pk=" + lstCompany.value +  "&bank_pk=0" + "&dtbFrom=" + dtbFrom.value + "&dtbTo=" + dtbTo.value + "&ccy=" + lstCurrency.value + "&status=" + rdoSlipStatus.value + "&bookccy=" + lstBookCcy.value + "&account_pk=" + txtAccPK.GetData();
                    System.OpenTargetPage( url , 'newform' );
                    return;    
               }
	   if (lstReportType.value=="S01-DN")
       {
            var s = new String(txtAccCode.text)
           /* if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
                {
                    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;
                }
             else
                {
                    alert("This is not payment acount code");
                   return; 
                }     
    		   */
    	    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN_Eng.aspx'+rqt;
            System.OpenTargetPage( url , 'newform' );
            return;
			
			//var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_Socai_DN_Eng.aspx'+rqt;
            //System.OpenTargetPage( url , 'newform' );
            //return;
			
       }
         //Nhat ky thu tien
                if (lstReportType.value=="S03a1-DN")
               {
                    /*    var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoNKthutienS03a1-DN_Eng.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  */
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoNKthutienS03a1-DN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return   
					// var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoNKthutien_DN_Eng.aspx'+rqt;
                    //System.OpenTargetPage( url , 'newform' );
                    //return 
               }
			   //So cai Customer
	   if (lstReportType.value=="S01-DN-BUS")
       {
            var s = new String(txtAccCode.text)
           /* if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
                {
                    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;
                }
             else
                {
                    alert("This is not payment acount code");
                   return; 
                }     
    		  */ 
    	    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN-BUS_Eng.aspx'+rqt;
            System.OpenTargetPage( url , 'newform' );
            return;
       }
	   if (lstReportType.value=="S01-DN-BUS-PL")
       {
            var s = new String(txtAccCode.text)
           /* if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
                {
                    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;
                }
             else
                {
                    alert("This is not payment acount code");
                   return; 
                }     
    		  */ 
    	    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN-BUS-PL_Eng.aspx'+rqt;
            System.OpenTargetPage( url , 'newform' );
            return;
       }
				//So quy tien mat BUS
                if (lstReportType.value=="S07-DN-BUS")
               {
                    /*    var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_Soquy_S07-DN_Eng.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  */
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_Soquy_S07-DN-BUS_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;   
               }
			   if (lstReportType.value=="TGL_BUS")
               {
                    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SOCAI_Eng_Partner.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;    
               }
               //Nhat ky chi tien
               if (lstReportType.value=="S03a2-DN")
               {
                     /*   var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoNKchitienS03a2-DN_Eng.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }*/
                   var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoNKchitienS03a2-DN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;    
					//var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoNKchitien_DN_Eng.aspx'+rqt;
                    //System.OpenTargetPage( url , 'newform' );
                    //return;					
               }
                //So quy tien mat
                if (lstReportType.value=="S07-DN")
               {
                    /*    var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_Soquy_S07-DN_Eng.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  */
					var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_Soquy_S07-DN_Eng.aspx'+rqt;	
		            //var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_Soquy_DN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;   
               }
			   //So quy tien mat
                if (lstReportType.value=="S07-DN-TB")
               {
                    /*    var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_Soquy_S07-DN_Eng.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  */
					var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_Soquy_S07-DN_TB_Eng.aspx'+rqt;	
		            //var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_Soquy_DN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;   
               }
                //So quy chi tiet tien mat
               if (lstReportType.value=="S07a-DN")
               {
                   /*      var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoKToanCTquy_S07a-DN_Eng.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                } 
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoKToanCTquy_S07a-DN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;   
					 var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoquyCTTM_DN_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;*/ 
					var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoKToanCTquy_S07a-DN_Eng.aspx'+rqt;
					 //var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TSoQuyCTTM_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;
               }
               //T so cai
               if (lstReportType.value=="TGL")
               {
                   /* var s = new String (txtAccCode.text)
                      if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {   
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SOCAI_Eng.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                        }
                        else
                        {
                            alert("This is not payment acount code");
		                   return; 
                        }
                      */  
                    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SOCAI_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;  
					/* var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TSocai_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;*/
               }
                //T So quy chi tiet tien mat
               if (lstReportType.value=="TSQCTTM")
               {
                    /*    var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
		                        var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SCTQT_Eng.aspx'+rqt;
                                System.OpenTargetPage( url , 'newform' );
                                return;
		                }
		                else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                } */
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SCTQT_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;    
					//var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TSoQuyCTTM_Eng.aspx'+rqt;
                    //System.OpenTargetPage( url , 'newform' );
                    //return; 
               }
               //Tai khoan doi ung phat sinh no
                 if (lstReportType.value=="S01-DN-DR")
               {
                   /* var s = new String(txtAccCode.text)
                     if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_TKDUPSN_Eng.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                        }
                    else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }*/
		           //var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TKDUPSN_Eng.aspx'+rqt;
				   var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_TKDUPSN_Eng.aspx'+rqt;
                   System.OpenTargetPage( url , 'newform' );
                   return;           
               }
                //Tai khoan doi ung phat sinh co
                  if (lstReportType.value=="S01-DN-CR")
               {
                     /*    var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_TKDUPSC_Eng.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                        }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  */
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_TKDUPSC_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;   
					// var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TKDUPSCo_Eng.aspx'+rqt;
                    //System.OpenTargetPage( url , 'newform' );
                    //return; 
               }
                //Tai khoan doi ung tong phat sinh no
                if (lstReportType.value=="TGL-DR")
               {
                   /*  var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_taikhoan_doiung_tongphatsinh_1_Eng.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                          }
                         else
		                {
		                    alert("This is not payment acount code"); 
		                   return; 
		                } */
		             var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_taikhoan_doiung_tongphatsinh_1_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;     
					//  var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TKDUTongPSN_Eng.aspx'+rqt;
                    //System.OpenTargetPage( url , 'newform' );
                    //return; 
               }
                //Tai khoan doi ung tong phat sinh co
                if (lstReportType.value=="TGL-CR")
               {
                   /*  var s = new String(txtAccCode.text)
		                if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		                {*/
                            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_taikhoan_doiung_tongphatsinh_2_Eng.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;
                        /* }
                         else
		                {
		                    alert("This is not payment acount code");
		                   return; 
		                }  
		               */
		          /* var url =System.RootURL + '/standard/reports/gf/ka/rpt_60080040_TKDUTongPSNCo_Eng.aspx'+rqt;
                    System.OpenTargetPage( url , 'newform' );
                    return;    */ 
					//var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_TKDUTongPSNCo_Eng.aspx'+rqt;
                    //System.OpenTargetPage( url , 'newform' );
                    //return; 					
               }
                if (lstReportType.value=="S08DN2")
               {
		            /*var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoguitienNH.aspx'+rqt; //company_pk=" + lstCompany.value +  "&bank_pk=0" + "&dtbFrom=" + dtbFrom.value + "&dtbTo=" + dtbTo.value + "&ccy=" + lstCurrency.value + "&status=" + rdoSlipStatus.value + "&bookccy=" + lstBookCcy.value + "&account_pk=" + txtAccPK.GetData();
                    System.OpenTargetPage( url , 'newform' );
                    return;    */
					var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_NH_S07-DN.aspx'+rqt; //?company_pk=" + lstCompany.value +  "&bank_pk=0" + "&dtbFrom=" + dtbFrom.value + "&dtbTo=" + dtbTo.value + "&ccy=" + lstCurrency.value + "&status=" + rdoSlipStatus.value + "&bookccy=" + lstBookCcy.value + "&account_pk=" + txtAccPK.GetData();
                    System.OpenTargetPage( url , 'newform' );
                    return;   
               }
               
                //Daily SL
               
               if (lstReportType.value=="AS")
               {
                    var url ="";
                    if (lstBookCcy.value==lstCurrency.value)
                    {
                        url =System.RootURL + '/standard/reports/gf/ka/gfka00020_DailySL.aspx'+rqt;
                     }
                     else
                     {
                            url =System.RootURL + '/standard/reports/gf/ka/gfka00020_DailySL_CCY.aspx'+rqt;
                     }
                    System.OpenTargetPage( url , 'newform' );
                    return;
               }
               if(lstReportType.value == 'S01-DN-CT')
               {
                    //alert('test');
            		    var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN_CostCenter.aspx'+rqt;
                            System.OpenTargetPage( url , 'newform' );
                            return;   
							//var url =System.RootURL + '/standard/reports/60/08/rpt_60080040_SoCai_VND_center.aspx'+rqt;
                            //System.OpenTargetPage( url , 'newform' );
                           //return; 							
								
			   }	               
    break;
 }
}
</script>
<body>
   <gw:data id="datSLSum" onreceive="OnDataReceive(this)" >
        <xml>
            <dso type="grid"  function="ac_sel_60080040_daily_sl_sum">
                <input bind="grdSLSum">
                    <input bind="lstCompany"/>
                    <input bind="txtAccPK"/>
                    <input bind="dtbFrom"/>
                    <input bind="dtbTo"/>
                    <input bind="rdoSlipStatus"/>
                    <input bind="lstCurrency"/>
                </input>
                <output bind="grdSLSum"/>
            </dso>
        </xml>
    </gw:data> 
   <gw:data id="datSLByDate" onreceive="OnDataReceive(this)" >
        <xml>
            <dso type="grid"  function="ac_sel_60080040_daily_sl_date">
                <input bind="grdSLByDate">
                    <input bind="lstCompany"/>
                    <input bind="txtAccPK"/>
                    <input bind="dtbFrom"/>
                    <input bind="dtbTo"/>
                    <input bind="rdoSlipStatus"/>
                    <input bind="lstCurrency"/>
                    <input bind="txtOpenBalance"/>
                </input>
                <output bind="grdSLByDate"/>
            </dso>
        </xml>
    </gw:data>  
   
      <gw:data id="datSLByVoucher" onreceive="OnDataReceive(this)" >
        <xml>
            <dso type="grid"  function="ac_sel_60080040_daily_sl_vc">
                <input bind="grdSLByVoucher">
                    <input bind="lstCompany"/>
                    <input bind="txtAccPK"/>
                    <input bind="dtbFrom"/>
                    <input bind="dtbTo"/>
                    <input bind="rdoSlipStatus"/>
                    <input bind="lstCurrency"/>
					<input bind="txtOpenBalance_trans"/>
                    <input bind="txtOpenBalance"/>
                    <input bind="txtVoucher_No"/>
                    <input bind="txtSeq"/>
                </input>
                <output bind="grdSLByVoucher"/>
            </dso>
        </xml>
    </gw:data>   

<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60080040_1" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<table style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr style="height:2%">
        <td>
            <fieldset style="padding:0">
                <table border="0" cellpadding="1" cellspacing="1" width="100%">
                    <tr>
                        <td align="right" width="13%">Company</td>
                        <td  width="22%"><gw:list id="lstCompany" styles="width:100%;" ></gw:list></td>
                        <td width="12%" align="right" valign="middle"><a onclick="onGetAcc()" href="#" title="Get Account">Account Code</a></td>
                        <td width="32%" >
                            <table border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
                                <tr>
                                    <td width="30%"><gw:textbox id="txtAccCode" text="" maxlen = "6" styles='width:100%'/> </td>
                                    <td width="70%"><gw:textbox id="txtAccName" text="" maxlen = "100" styles='width:100%'/></td>
                                    <td width=""><gw:imgBtn id="btnResetAcc" img="reset" alt="Reset Account" onclick="onResetAcc()" /></td>
                                </tr>
                            </table>
                        </td>
                        <td align="right" width="9%">Language</td>
                        <td  width="12%"><gw:list id="lstLanguage" styles="width:100%;" ></gw:list></td>
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
                        <td align="right"  valign="middle">Inquiry Type</td>
                        <td width="">
                                <gw:radio id="rdoInquiryType"  value="1"> 
                                        <span value="1" > Dates</span>
                                        <span value="2" >Vouchers</span>
                                 </gw:radio >
                        </td>
                        
                        <td align="right">Currency</td>
                        <td><gw:list id="lstCurrency" styles="width:100%;" ></gw:list></td>
                    </tr>
                    <tr>
                        <td align="right">Slip Status</td>
                        <td  align="left">
                                <gw:radio id="rdoSlipStatus"  value="2" > 
                                    <span value="2" >Confirmed</span>
                                    <span value="0" >Approved</span>
                                </gw:radio >
                        </td>
                        <td align="right"  valign="middle">Amount Type</td>
                        <td >
                                 <gw:radio id="rdoAmountType"  value="2" onchange="onChangeFormat()"> 
                                        <span value="1" >Trans & Books</span>
                                        <span value="2" > Books</span>
                                        <span value="3" > Trans</span>
                                 </gw:radio >
                        </td>
                        <td align="right" width="">Voucher No</td>
                        <td colspan="">
                            <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                <tr>
                                    <td width="100%"><gw:textbox id="txtVoucher_No" onenterkey="onSearch()" styles='width:100%'/> </td>
                                    <td><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"    onclick="onSearch()" /></td>
                                </tr>
                            </table>
                        </td>
                        
                    </tr>
                    <tr>
                        <td align="right" width="">Report Option</td>
                        <td  width=""><gw:list id="lstRptOption" styles="width:100%;" ></gw:list></td>
                        <td align="right" >Report Type </td>
						<td  colspan="">
                            <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                <tr>
									<td width="70%"><gw:list id="lstReportType" styles="width:100%;" /></td>
									<td align='right' style='white-space:nowrap'>Circulars</td>
									<td width="30%"><gw:list id="lstCirculars" onchange="" styles='width:100%' /></td>
								</tr>
                            </table>
                        </td>
                        
                        <td align="right" width="">Seq</td>
                        <td  colspan="">
                            <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                <tr>
                                    <td width="100%"><gw:textbox id="txtSeq" onenterkey="onSearch()"  styles='width:100%'/> </td>
                                    <td><gw:button id="ibtnReport" img="excel"  text="Print" alt="Print Report" onclick="OnReport(lstLanguage.GetData())" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </fieldset>
          </td> 
       </tr>
      <tr id="_Date" style="height:40%">
            <td>
           <gw:grid id='grdSLByDate'
        header='Proposed Date|Ccy|Oppeing Balance|Debit Trans|Credit Trans|Debit Books|Credit Books|Closing Balance|_Date'
        format='4|0|1|1|1|1|1|1|0'
        aligns='1|1|2|2|2|2|2|2|2'
        defaults='||||||||'
        editcol='0|0|0|0|0|0|0|0|0'
        widths='1000|1000|1000|1000|1000|1000|1000|1000|0'
        sorting='T'
        acceptNullDate="T"
        styles='width:100%; height:100%'
        />
        
        
            </td>
      </tr> 
      <tr id="_Voucher" style="height:40%">
            <td>
                    <gw:grid id='grdSLByVoucher'
        header='PK|VOUCHERNO|TR_DATE|USER_ID|CCY|OPENINGBALANCE|DEBITTRANSAMOUNT|CREDITTRANSAMOUNT|DEBITBOOKAMOUNT|CREDITBOOKAMOUNT|CLOSINGBALANCE|CUSTOMER|REMARK|remark2|_tr_date_filter'
        format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0'
        aligns='1|0|1|1|1|2|2|2|2|2|2|0|0|0|0'
        defaults='||||||||||||||'
        editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
        widths='1000|2000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T'
        acceptNullDate="T"
        styles='width:100%; height:100%;'
        oncelldblclick ="RowClick()"
        />
            </td>
      </tr>
      <tr style="height:18%">
            <td>
           <gw:grid id='grdSLSum'
        header='CCY|OPENINGBALANCE|DEBITTRANSAMOUNT|DEBITBOOKAMOUNT|CREDITTRANSAMOUNT|CREDITBOOKAMOUNT|CLOSINGBALANCE|_OB'
        format='0|1|1|1|1|1|1|1'
        aligns='1|1|2|2|2|2|2|2'
        defaults='|||||||'
        editcol='0|0|0|0|0|0|0|0'
        widths='1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T'
        styles='width:100%; height:100%;'
        />
            </td>
      </tr> 
</table>  
 <gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
<gw:textbox id="txtAccPK" styles="display:none;"/> 
<gw:textbox id="txtOpenBalance" styles="display:none;" /> 
<gw:textbox id="txtOpenBalance_trans" styles="display:none;" /> 
 <gw:textbox id="txtUser_Pk"  styles='display:none' />
</body>
</html>
