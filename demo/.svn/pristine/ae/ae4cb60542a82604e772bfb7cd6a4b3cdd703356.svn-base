<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>S/L for Deposit</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script type="text/javascript" language="javascript">
var g_inquiry_type = 10;//Dates :10; Vouchers :20
var g_user_pk = "<%=Session("USER_PK") %>";
function BodyInit()
{
    //grdSLByVoucher.style.display="none";
    BindingDataList();

     txtUser_Pk.text = g_user_pk;
	dso_getCompany.Call();
     
}

function BindingDataList()
{
    System.Translate(document);
    var ls_data   = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_data1 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE_NM  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='HRAB0180' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 order by code_nm")%>";
    var ls_data3 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
    var ls_data4 = "<%=CtlLib.SetListDataSQL("SELECT 'ALL' C1,'<All>' C2  FROM DUAL UNION ALL SELECT C1,C2 FROM ( SELECT TRIM(A.CODE) C1, A.CODE C2 FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0 AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY NUM_VALUE1)")%>";
       /*
    var ls_data5 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE_NM  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0140' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and cha_value1 = '60110020' order by code_nm")%>";
      */
    var ls_data5 = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACBK001') FROM DUAL")%>";
    var ls_Circulars = "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='AC150001' ORDER BY D.DEF_YN DESC")%>";
lstCirculars.SetDataText(ls_Circulars);

    lstCompany.SetDataText(ls_data);
    lstLanguage.SetDataText(ls_data1); 
    lstBookCcy.SetDataText(ls_data3); 
    lstCurrency.SetDataText(ls_data4); 
    lstReportType.SetDataText(ls_data5); 
	FormatSumGrid();
	FormatDepositDateGrid();
	FormatDepositVoucherGrid();
	if (idSearchby.value=="0") //Search by bank;
	{
		if (rdoInquiryType.value=="1")//Date
		{
			_Date.style.display="";
			_Voucher.style.display = "none";
		}
		else//voucher
		{
			_Date.style.display="none";
			_Voucher.style.display = "";
		}		
	}
	txtAC_CD.SetEnable(false);
	
}

function onChangeSearchBy()
{
	var cnd = idSearchby.value;
	if (cnd =="0")//Deposit Account
	{
		lblCmdText.text = "Deposit Account";
		lstDepositAcct.style.display="";
		//lstDepositAcct.style.display="none";//currency
		//lstDepositAcct.style.display="none";//account code
		//lstDepositAcct.style.display="none";//bank
		return;
	}
	if(cnd =="1")//Currency
	{
		lblCmdText.value = "Currency";
		lstDepositAcct.style.display="none";
		return;
	}
	if(cnd =="2")//Account Code
	{
		lblCmdText.text = "Account Code";
		lstDepositAcct.style.display="none";
		return;
	}
	if(cnd =="3")//Bank
	{
		lblCmdText.text = "Bank";
		lstDepositAcct.style.display="none";
		return;
	}
}

function FormatSumGrid()
{
	if(grdSLSum.rows <2)
	{
		grdSLSum.AddRow();
	}
	var fg=grdSLSum.GetGridControl();
	
	fg.FixedRows = 2;
	fg.MergeCells = 5;
	fg.MergeRow(0) = true;
	fg.Cell(0, 0, 0, 0, 1) = "Opening Balance";
	fg.Cell(0, 1, 0, 1, 0) = "Books";
	fg.Cell(0, 1, 1, 1, 1) = "Trans";
	
	fg.MergeCol(2) = true;
	fg.Cell(0, 0, 2, 1, 2) = "Ccy";
	
	fg.Cell(0, 0, 3, 0, 5) = "Trans";  
	fg.Cell(0, 0, 6, 0, 8) = "Books";
	
	fg.Cell(0, 1, 3, 1) = "Deposit";
	fg.Cell(0, 1, 4, 1) = "Withdrawal";
	fg.Cell(0, 1, 5, 1) = "Balance";
	
	fg.Cell(0, 1, 6, 1) = "Deposit";
	fg.Cell(0, 1, 7, 1) = "Withdrawal";
	fg.Cell(0, 1, 8, 1) = "Balance";
	
	fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
	fg.Cell(13, 0, 0, 1,fg.Cols - 1) = true; 
	
	
	fg.ColWidth(2)=800;//Ccy
	
	fg.ColWidth(8)=0;
	fg.ColWidth(0)=1800;//Opening Balance BOOKS
	var AmountType = rdoAmountType.GetData();
	if (AmountType == '1') // Trans & Books
	{
		fg.ColWidth(1)=1800;//Opening Balance TRANS
		fg.ColWidth(3)=2000;
		fg.ColWidth(4)=2000;
		fg.ColWidth(5)=2000;
		fg.ColWidth(6)=2000;
		fg.ColWidth(7)=2000;
		fg.ColWidth(8)=2000;
	} else // Only Books
	{
		fg.ColWidth(1)=0;//Opening Balance TRANS
		fg.ColWidth(3)=0;
		fg.ColWidth(4)=0;
		fg.ColWidth(5)=0;
		fg.ColWidth(6)=3000;
		fg.ColWidth(7)=3000;
		fg.ColWidth(8)=3000;
	}
	if (lstBookCcy.value=="VND")
	{
        fg.ColFormat(0) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(6) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(7) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(8) = "#,###,###,###,###,###,###,###";
	}
	else
	{
	    fg.ColFormat(0) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(6) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(7) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(8) = "#,###,###,###,###,###,###,###.##";
	}
	
	if(txtBankCCy.text == "VND")
	{
		fg.ColFormat(1) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(3) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(4) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(5) = "#,###,###,###,###,###,###,###";
	}
	else
	{
		fg.ColFormat(1) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(3) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(4) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(5) = "#,###,###,###,###,###,###,###.##";
	}
	
	
	fg.ColAlignment(0) = flexAlignRightCenter;
	fg.ColAlignment(1) = flexAlignRightCenter;
	fg.ColAlignment(2) = flexAlignCenterCenter;
	fg.ColAlignment(3) = flexAlignRightCenter;
	fg.ColAlignment(4) = flexAlignRightCenter;
	fg.ColAlignment(5) = flexAlignRightCenter;
	fg.ColAlignment(6) = flexAlignRightCenter;
	fg.ColAlignment(7) = flexAlignRightCenter;
	fg.ColAlignment(8) = flexAlignRightCenter;
}

function FormatDepositVoucherGrid()
{
	var fg=grdSLDepositVoucher.GetGridControl();
	if(grdSLDepositVoucher.rows <2)
	{
		grdSLDepositVoucher.AddRow();
	} 
	fg.FixedRows = 2;
	fg.MergeCells = 5;
	fg.MergeRow(0) = true;
	fg.MergeCol(0) = true;
	fg.Cell(0, 0, 0, 1, 0) = "Seq";

	fg.MergeCol(1) = true;
	fg.Cell(0, 0, 1, 1, 1) = "Voucher No";
	
	fg.MergeCol(2) = true;
	fg.Cell(0, 0, 2, 1, 2) = "Prs Date";  
	fg.MergeCol(3) = true;
	fg.Cell(0, 0, 3, 1, 3) = "Prs By";
	fg.MergeCol(4) = true;
	fg.Cell(0, 0, 4, 1, 4) = "CCY";
	
	fg.Cell(0, 0, 5, 0, 7) = "Trans";
	fg.Cell(0, 0, 8, 0, 10) = "Books";
	fg.Cell(0, 1, 5, 1) = "Deposit";
	fg.Cell(0, 1, 6, 1) = "Withdrawal";
	fg.Cell(0, 1, 7, 1) = "Balance";
	
	fg.Cell(0, 1, 8, 1) = "Deposit";
	fg.Cell(0, 1, 9, 1) = "Withdrawal";
	fg.Cell(0, 1, 10, 1) = "Balance";
	
	fg.MergeCol(11) = true;
	fg.Cell(0, 0, 11, 1) = "Customer Name";
	
	fg.Cell(0, 0, 12, 0, 13) = "Description";
	fg.Cell(0, 1, 12, 1) = "Foreign";
	fg.Cell(0, 1, 13, 1) = "Local";
	
	fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
	fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
	
	fg.ColWidth(0)=800;//Seq
	fg.ColWidth(1)=1800;//Voucher No
	fg.ColWidth(2)=1100;//Proposed Date
	fg.ColWidth(3)=1100;//Proposed By
	fg.ColWidth(4)=800;//Ccy
	
	fg.ColWidth(11)=1500;//Customer Name
	fg.ColWidth(12)=1200;//Description-Foreign
	fg.ColWidth(13)=1100;//Description-Local
	
	var AmountType = rdoAmountType.GetData();
	if (AmountType == '1') // Trans & Books
	{
		fg.ColWidth(5)=1500;
		fg.ColWidth(6)=1500;
		fg.ColWidth(7)=1500;
		fg.ColWidth(8)=1500;
		fg.ColWidth(9)=1500;
		fg.ColWidth(10)=1500;
	} else // Only Books
	{
		fg.ColWidth(5)=0;
		fg.ColWidth(6)=0;
		fg.ColWidth(7)=0;
		fg.ColWidth(8)=2000;
		fg.ColWidth(9)=2000;
		fg.ColWidth(10)=2000;
	}
	if (lstBookCcy.value=="VND")
	{	
		fg.ColFormat(8) = "#,###,###,###,###";
		fg.ColFormat(9) = "#,###,###,###,###";
		fg.ColFormat(10) = "#,###,###,###,###";
	}
	else
	{
		fg.ColFormat(8) = "#,###,###,###,###.##";
		fg.ColFormat(9) = "#,###,###,###,###.##";
		fg.ColFormat(10) = "#,###,###,###,###.##";
	}
	
	if(txtBankCCy.text == "VND")
	{
		fg.ColFormat(5) = "#,###,###,###,###";
		fg.ColFormat(6) = "#,###,###,###,###";
		fg.ColFormat(7) = "#,###,###,###,###";
	}
	else
	{
		fg.ColFormat(5) = "#,###,###,###,###.##";
		fg.ColFormat(6) = "#,###,###,###,###.##";
		fg.ColFormat(7) = "#,###,###,###,###.##";
	}
	
	fg.ColAlignment(5) = flexAlignRightCenter;
	fg.ColAlignment(6) = flexAlignRightCenter;
	fg.ColAlignment(7) = flexAlignRightCenter;
	fg.ColAlignment(8) = flexAlignRightCenter;
	fg.ColAlignment(9) = flexAlignRightCenter;
	fg.ColAlignment(10) = flexAlignRightCenter;
	
}
function onChangeFormat()
{
	var fgSum=grdSLSum.GetGridControl();
	
	
	if (rdoAmountType.value==1)//Trans & Books
	{
		if (idSearchby.value=="0") //Search by bank;
		{
			fgSum.ColWidth(1)=1800;
			fgSum.ColWidth(2)=800;
			fgSum.ColWidth(3)=2000;
			fgSum.ColWidth(4)=2000;
			fgSum.ColWidth(5)=2000;
			fgSum.ColWidth(6)=2000;
			fgSum.ColWidth(7)=2000;
			fgSum.ColWidth(8)=2000;
			if (rdoInquiryType.value=="1")//Date
			{
				var fg=grdSLDepositDate.GetGridControl();
				fg.ColWidth(3)=1500;
				fg.ColWidth(4)=1500;
				fg.ColWidth(5)=1500;
				fg.ColWidth(6)=1500;
				fg.ColWidth(7)=1500;
				fg.ColWidth(8)=1500;
			}
			else//voucher
			{
				var fg=grdSLDepositVoucher.GetGridControl();
				fg.ColWidth(5)=1500;
				fg.ColWidth(6)=1500;
				fg.ColWidth(7)=1500;
				fg.ColWidth(8)=1500;
				fg.ColWidth(9)=1500;
				fg.ColWidth(10)=1500;
			}
		}
	}
	else if (rdoAmountType.value==2)//2: Books
	{
		if (idSearchby.value=="0") //Search by bank;
		{
			fgSum.ColWidth(1)=0;
			fgSum.ColWidth(3)=0;
			fgSum.ColWidth(4)=0;
			fgSum.ColWidth(5)=0;
			fgSum.ColWidth(6)=3000;
			fgSum.ColWidth(7)=3000;
			fgSum.ColWidth(8)=3000;
			if (rdoInquiryType.value=="1")//Date
			{
				var fg=grdSLDepositDate.GetGridControl();
				fg.ColWidth(3)=0;
				fg.ColWidth(4)=0;
				fg.ColWidth(5)=0;
				fg.ColWidth(6)=2000;
				fg.ColWidth(7)=2000;
				fg.ColWidth(8)=2000;
			}
			else//voucher
			{
				var fg=grdSLDepositVoucher.GetGridControl();
				fg.ColWidth(5)=0;
				fg.ColWidth(6)=0;
				fg.ColWidth(7)=0;
				fg.ColWidth(8)=2000;
				fg.ColWidth(9)=2000;
				fg.ColWidth(10)=2000;
			}
		}
	}
    else //trans
	{
		if (idSearchby.value=="0") //Search by bank;
		{
			fgSum.ColWidth(0)=0;
			fgSum.ColWidth(3)=3000;
			fgSum.ColWidth(4)=3000;
			fgSum.ColWidth(5)=3000;
			fgSum.ColWidth(6)=0;
			fgSum.ColWidth(7)=0;
			fgSum.ColWidth(8)=0;
			if (rdoInquiryType.value=="1")//Date
			{
				var fg=grdSLDepositDate.GetGridControl();
				fg.ColWidth(3)=2000;
				fg.ColWidth(4)=2000;
				fg.ColWidth(5)=2000;
				fg.ColWidth(6)=0;
				fg.ColWidth(7)=0;
				fg.ColWidth(8)=0;
			}
			else//voucher
			{
				var fg=grdSLDepositVoucher.GetGridControl();
				fg.ColWidth(8)=0;
				fg.ColWidth(9)=0;
				fg.ColWidth(10)=0;
				fg.ColWidth(5)=2000;
				fg.ColWidth(6)=2000;
				fg.ColWidth(7)=2000;
			}
		}
	}
}

function FormatDepositDateGrid()
{
	var fg=grdSLDepositDate.GetGridControl();
	if(grdSLDepositDate.rows <2)
	{
		grdSLDepositDate.AddRow();
	}
	fg.FixedRows = 2;
	fg.MergeCells = 5;
	fg.MergeRow(0) = true;
	fg.MergeCol(0) = true;
	fg.Cell(0, 0, 0, 1, 0) = "Proposed Date";

	fg.MergeCol(1) = true;
	fg.Cell(0, 0, 1, 1, 1) = "Ccy";
	
	fg.MergeCol(2) = true;
	fg.Cell(0, 0, 2, 1, 2) = "Opening Balance";  
	
	fg.Cell(0, 0, 3, 0, 5) = "Trans";
	fg.Cell(0, 0, 6, 0, 8) = "Books";
	fg.Cell(0, 1, 3, 1) = "Deposit";
	fg.Cell(0, 1, 4, 1) = "Withdrawal";
	fg.Cell(0, 1, 5, 1) = "Balance";
	
	fg.Cell(0, 1, 6, 1) = "Deposit";
	fg.Cell(0, 1, 7, 1) = "Withdrawal";
	fg.Cell(0, 1, 8, 1) = "Balance";
	
	fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
	fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
	
	fg.ColWidth(0)=1500;//Proposed Date
	fg.ColWidth(1)=800;//Ccy
	fg.ColWidth(2)=2000;//Opening Balance
	
	var AmountType = rdoAmountType.GetData();
	if (AmountType == '1') // Trans & Books
	{
		fg.ColWidth(3)=1500;
		fg.ColWidth(4)=1500;
		fg.ColWidth(5)=1500;
		fg.ColWidth(6)=1500;
		fg.ColWidth(7)=1500;
		fg.ColWidth(8)=1500;
		
	} else // Only Books
	{
		fg.ColWidth(3)=0;
		fg.ColWidth(4)=0;
		fg.ColWidth(5)=0;
		fg.ColWidth(6)=2000;
		fg.ColWidth(7)=2000;
		fg.ColWidth(8)=2000;
	}
	if (lstBookCcy.value=="VND")
	{
		fg.ColFormat(6) = "#,###,###,###,###";
		fg.ColFormat(7) = "#,###,###,###,###";
		fg.ColFormat(8) = "#,###,###,###,###";
	}
	else
	{
		fg.ColFormat(6) = "#,###,###,###,###.##";
		fg.ColFormat(7) = "#,###,###,###,###.##";
		fg.ColFormat(8) = "#,###,###,###,###.##";
	}
	
	if(txtBankCCy.text == "VND")
	{
		fg.ColFormat(2) = "#,###,###,###,###";
		fg.ColFormat(3) = "#,###,###,###,###";
		fg.ColFormat(4) = "#,###,###,###,###";
		fg.ColFormat(5) = "#,###,###,###,###";
	}
	else
	{
		fg.ColFormat(2) = "#,###,###,###,###.##";
		fg.ColFormat(3) = "#,###,###,###,###.##";
		fg.ColFormat(4) = "#,###,###,###,###.##";
		fg.ColFormat(5) = "#,###,###,###,###.##";
	}
	
	fg.ColAlignment(2) = flexAlignRightCenter;
	fg.ColAlignment(3) = flexAlignRightCenter;
	fg.ColAlignment(4) = flexAlignRightCenter;
	fg.ColAlignment(5) = flexAlignRightCenter;
	fg.ColAlignment(6) = flexAlignRightCenter;
	fg.ColAlignment(7) = flexAlignRightCenter;
	fg.ColAlignment(8) = flexAlignRightCenter;
}

function OnDataError(dsql)
{
	alert("ERROR "+ dsql.id+"-"+dsql.errmsg);
}

function onCompanyChange()
{
    grdDepositTmp.ClearData();
	datGetDepositAccount.Call();
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
function OnDataReceive(objID)
{
	if (objID.id=="datSLSum")
	{
		FormatSumGrid();
		if (grdSLSum.rows>2)
		{
			txtOpenBookAmt.text  = Trim(grdSLSum.GetGridData(2,0));
			txtOpenTransAmt.text = Trim(grdSLSum.GetGridData(2,1));
		}
		else
		{
			txtOpenBookAmt.text  = "0";
			txtOpenTransAmt.text = "0";
		}
		//for(i=2;i<grdSLSum.rows;i++)
		//{
			
		//}	
        
		if (rdoInquiryType.value=="1")//Date
		{
			_Voucher.style.display ="none";
			_Date.style.display = "";
			datSLDeposit_Date.Call('SELECT');
		}
		else //Voucher
		{
            _Voucher.style.display ="";
			_Date.style.display = "none";
			datSLDeposit_Voucher.Call('SELECT');
		}
	}
	if (objID.id=="datSLDeposit_Voucher")
	{
		FormatDepositVoucherGrid();
	}
	if (objID.id=="datSLDeposit_Date")
	{
		FormatDepositDateGrid();
		FillOpeningGridDate();
	}
if (objID.id=="dso_getCompany")
	{
		onCompanyChange();
	}
	

	if (objID.id=="datGetDepositAccount")
	{
	    strDeposit = 'DATA';
	    for(i=1;i<grdDepositTmp.rows;i++)
	    {
	        strDeposit = strDeposit +'|' +grdDepositTmp.GetGridData(i,0)+'|'+ grdDepositTmp.GetGridData(i,1);
	    }
	    lstDepositAcct.SetDataText(strDeposit);
//        if(txtAc_level.text=='3')
//         {
//            datCompany.Call();
//         }
	}
    
}

function onGridVoucherDbClick()
{
	var rows =0;
	var rownum =0;
	var colnum =0;
	var pk = 0;
	var status = "";
	var ls_arr = ""; 

	var ctrl = grdSLDepositVoucher.GetGridControl();
	rows = ctrl.Rows;
	rows = rows - 2;
	rownum = ctrl.row-1;
	pk = grdSLDepositVoucher.GetGridData(ctrl.row, 0);
		
	for (i = 2; i < grdSLDepositVoucher.rows; i++)
	{
		ls_arr = ls_arr + ' ' + grdSLDepositVoucher.GetGridData(i, 0);
	} 
	
	if (rownum > 0) 
	{
		var fpath = System.RootURL + '/standard/forms/60/08/60080050_popup.aspx?PK_ROW=' + pk + '&ROW=' + rownum + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
		var wWidth = 950;
		var wHeight = 600;
		var x = Math.round((screen.availWidth - wWidth)/2);
		var y = Math.round((screen.availHeight - wHeight)/2);

		var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +"lef="+ x +",top=" + y;
		this.name = "gfka00030";
		var object = System.OpenModal(fpath, wWidth, wHeight, features, window);
	}
}

function GetRowPK(row_index){
    if((row_index < grdSLDepositVoucher.rows) && (row_index > 0)){
        return grdSLDepositVoucher.GetGridData(row_index, 0);
    }
    return -1;
}

function FillOpeningGridDate()
{
	var i =0;
	if(grdSLDepositDate.rows >2)
	{
		grdSLDepositDate.SetGridText(2,2,""+txtOpenBookAmt.text);
		for(i=3;i<grdSLDepositDate.rows;i++)
		{
			grdSLDepositDate.SetGridText(i,2,""+grdSLDepositDate.GetGridData(i-1,8));
		}
		
	}
}
//---------------------------onSearch
function onSearch()
{
    if (txtAC_CD.text=="")
   {
        alert("Please chose account code!");
        return;
   } 
	var strTmp = ""+lstDepositAcct.value;
	var bankpk = strTmp.substring(0,strTmp.indexOf(","));
	var ccy = strTmp.substring(strTmp.indexOf(",")+1);
	txtBankPK.text  = bankpk;
	txtBankCCy.text = ccy;
	datSLSum.Call('SELECT');
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
	var strTmp = ""+lstDepositAcct.value;
		var bankpk = strTmp.substring(0,strTmp.indexOf(","));
		var ccy = strTmp.substring(strTmp.indexOf(",")+1);
	if(lstReportType.value=='S08-DN')
	{
		if (ccy ==lstBookCcy.value)
		{
				var url = '/standard/reports/gf/ka/gfka00160_SotienguiNH_S08DN2.aspx?company_pk='+lstCompany.value+'&bank_pk='+bankpk+'&dtbFrom=' +dtbFrom.value+ '&dtbTo=' + dtbTo.value+'&ccy=ALL&status='+rdoSlipStatus.value+'&bookccy='+lstBookCcy.value+'&account_pk='+txtAC_PK.text+'&circulars='+lstCirculars.value;
				System.OpenTargetPage( System.RootURL+url , "newform" );
		}
		else
		{
				var url = '/standard/reports/gf/ka/gfka00160_SotienguiNH_S08DN.aspx?company_pk='+lstCompany.value+'&bank_pk='+bankpk+'&dtbFrom=' +dtbFrom.value+ '&dtbTo=' + dtbTo.value+'&ccy=ALL&status='+rdoSlipStatus.value+'&bookccy='+lstBookCcy.value+'&account_pk='+txtAC_PK.text+'&circulars='+lstCirculars.value;
				System.OpenTargetPage( System.RootURL+url , "newform" );
		}
	}
	else if(lstReportType.value=='S08-DN-CUST')	
	{
		var url = '/standard/reports/gf/ka/gfka00160_SotienguiNH_S08DN2_Cust.aspx?company_pk='+lstCompany.value+'&bank_pk='+bankpk+'&dtbFrom=' +dtbFrom.value+ '&dtbTo=' + dtbTo.value+'&ccy=ALL&status='+rdoSlipStatus.value+'&bookccy='+lstBookCcy.value+'&account_pk='+txtAC_PK.text+'&circulars='+lstCirculars.value;
		System.OpenTargetPage( System.RootURL+url , "newform" );
	}
}
</script>
<body>
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_gfac00100_1" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!---------------------------------------------------------------------->
<gw:data id="dso_acc_info" onreceive=""> 
	<xml>                                                               
		<dso id="1" type="process" procedure="ac_pro_60080090"  > 
			<input> 
				<input bind="lstDepositAcct" />
			</input>
			 <output>
				<output bind="txtAC_PK"/>
				<output bind="txtAC_CD"/>
                <output bind="txt_ac_nm"/>
                
			 </output>
		</dso> 
	</xml>
</gw:data>
<!---------------------------------------------------------------------->
<gw:data id="datGetDepositAccount" onreceive="OnDataReceive(this)" > 
	<xml> 
		<dso id="1" type="grid"  function="ac_SEL_60080080_BANK_LIST" > 
		<input bind="grdDepositTmp">
			<input bind="lstCompany" />
		</input>
		<output bind="grdDepositTmp"/>
		</dso> 
	</xml> 
</gw:data> 

<gw:data id="datSLSum" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
        <xml>
            <dso type="grid"  function="ac_SEL_60080090_SL_DEPO_SUM">
                <input bind="grdSLSum">
                    <input bind="lstCompany"/>
                    <input bind="txtBankPK"/>
                    <input bind="dtbFrom"/>
                    <input bind="dtbTo"/>
                    <input bind="rdoSlipStatus"/>
                    <input bind="lstCurrency"/>
					<input bind="txtVoucherNo"/>
					<input bind="txtSeq"/>
					<input bind="txtAC_PK"/>
                </input>
                <output bind="grdSLSum"/>
            </dso>
        </xml>
    </gw:data> 

	<gw:data id="datSLDeposit_Voucher" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
        <xml>
            <dso type="grid"  function="ac_sel_60080090_Dep_Voucher">
                <input bind="grdSLDepositVoucher">
                    <input bind="lstCompany"/>
                    <input bind="txtBankPK"/>
                    <input bind="dtbFrom"/>
                    <input bind="dtbTo"/>
                    <input bind="rdoSlipStatus"/>
                    <input bind="lstCurrency"/>
					<input bind="txtVoucherNo"/>
					<input bind="txtSeq"/>
					<input bind="lstLanguage"/>
					<input bind="txtOpenTransAmt"/>
                    <input bind="txtOpenBookAmt"/>
                    <input bind="txtAC_PK"/>
                </input>
                <output bind="grdSLDepositVoucher"/>
            </dso>
        </xml>
    </gw:data>  
	
	<gw:data id="datSLDeposit_Date" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
        <xml>
            <dso type="grid"  function="ac_sel_60080090_Deposit_Date">
                <input bind="grdSLDepositDate">
                    <input bind="lstCompany"/>
                    <input bind="txtBankPK"/>
                    <input bind="dtbFrom"/>
                    <input bind="dtbTo"/>
                    <input bind="rdoSlipStatus"/>
                    <input bind="lstCurrency"/>
					<input bind="txtVoucherNo"/>
					<input bind="txtSeq"/>
					<input bind="lstLanguage"/>
					<input bind="txtOpenTransAmt"/>
                    <input bind="txtOpenBookAmt"/>
                    <input bind="txtAC_PK"/>
                </input>
                <output bind="grdSLDepositDate"/>
            </dso>
        </xml>
    </gw:data>  
	

<table style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr style="height:2%">
        <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="right" width="9%">Company</td>
                        <td  width="21%"><gw:list id="lstCompany" styles="width:100%;" onchange="onCompanyChange()" ></gw:list></td>
                        <td width="10%" align="right"><b><gw:label2 id="lblCmdText">Deposit Account </gw:label2></b></td>
                        <td width="18%">
                            <gw:list id="lstDepositAcct" styles="width:100%;" onchange="dso_acc_info.Call();" ></gw:list>
						</td>
						<td width="10%" align="right"><b><a title="Click here to show Account" onclick="GetAccount()" href="#tips" >Account</a></b></td>
						<td width="18%">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="95%"><gw:textbox id="txtAC_PK" styles='display:none'></gw:textbox>
                                                <gw:textbox id="txtAC_CD" styles='width:100%;' csstype="mandatory"/>
                                <td><gw:imgBtn id="ibtnAccReset" img="reset"  alt="reset acc" onclick="resetAcc()" /></td>
                            </tr>
                        </table>
						</td>
                        <td align="right" width="7%">Language</td>
                        <td  width="7%"><gw:list id="lstLanguage" styles="width:100%;" ></gw:list></td>
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
                        <td align="right">Inquiry Type</td>
                        <td >
                                <gw:radio id="rdoInquiryType"  value="1"> 
                                        <span value="1" > Date</span>
                                        <span value="2" >Voucher</span>
                                 </gw:radio >
                        </td>
                        <td align="right" >Voucher No</td>
                        <td >
							<table border="0" cellspacing="0" cellpadding="0" width="100%">
								<tr>
									<td width="50%"><gw:textbox id="txtVoucherNo" text=""  styles='width:100%'/></td>
									<td width="15%">&nbsp;Seq</td>
									<td width="35%"><gw:textbox id="txtSeq" text=""  styles='width:100%'/></td>
								</tr>
							</table>
						
						</td>
                        <td align="right">Currency</td>
                        <td><gw:list id="lstCurrency" styles="width:100%;" ></gw:list></td>
						
						<td><gw:imgBtn id="ibtnReport" img="printer"   alt="Print Report" onclick="OnReport()" /></td>
                    </tr>
                    <tr>
                        <td align="right">Slip Status</td>
                        <td align="left" >
                                <gw:radio id="rdoSlipStatus"  value="2" > 
                                    <span value="2" >Confirmed</span>
                                    <span value="0" >Approved</span>
                                </gw:radio >
                        </td>
                        <td align="right" style="vertical-align:middle;color:#000000;">Amount Type</td>
                        <td >
                                 <gw:radio id="rdoAmountType"  value="2" onchange="onChangeFormat()"> 
                                        <span value="1" >Trans & Books</span>
                                        <span value="2" > Books</span>
                                        <span value="3" > Trans</span>
                                 </gw:radio >
                        </td>
                        <td align="right" >Report Type </td>
                        <td  colspan=""><gw:list id="lstReportType" styles="width:100%;" ></gw:list></td>
                        <td align="right" >Circulars</td>
                        <td  colspan=""><gw:list id="lstCirculars" styles="width:100%;" ></gw:list></td>
						<td><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"    onclick="onSearch()" /></td>
                    </tr>
                </table>
          </td> 
       </tr>
      <tr id="_Date" style="height:39%">
	  <td>
<gw:grid id='grdSLDepositDate'
header='TRANS_DATE|CCY|OPENING_AMT|IN_AMT|OUT_AMT|BAL_AMT|IN_BAMT|OUT_BAMT|BAL_BAMT'
format='0|0|0|0|0|0|0|0|0'
aligns='0|0|0|0|0|0|0|0|0'
defaults='||||||||'
editcol='0|0|0|0|0|0|0|0|0'
widths='1000|1000|1000|1000|1000|1000|1000|1000|1000'
sorting='T'
acceptNullDate="T"
styles='width:100%; height:100%'
/>
			
            </td>
      </tr> 
	  <tr id="_Voucher" style="height:39%">
        <td>
            <gw:grid id='grdSLDepositVoucher'
header='H_PK|VOUCHERNO|TRANS_DATE|PRS_DATE|PRS_BY|IN_AMT|OUT_AMT|BAL_AMT|IN_BAMT|OUT_BAMT|BAL_BAMT|CUST_NAME|REMARK|REMARK2|_TR_DATE'
format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
defaults='||||||||||||||'
editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
sorting='T'
styles='width:100%; height:100%'
acceptNullDate="T"
oncelldblclick="onGridVoucherDbClick()" 
/>
</td>
      </tr>
      <tr style="height:20%">
            <td>
	<gw:grid id='grdSLSum'
header='OPEN_BOOKS|OPEN_TRANS|CCY|DEBIT_TRANS_AMT|CREDIT_TRANS_AMT|BAL_TRANS_AMT|DEBIT_BOOK_AMT|CREDIT_BOOK_AMT|BAL_BOOK_AMT'
format='0|0|0|0|0|0|0|0|0'
aligns='2|1|2|2|2|2|2|2|2'
defaults='||||||||'
editcol='0|0|0|0|0|0|0|0|0'
widths='1455|1000|1000|1000|1000|1000|1000|1000|1000'
sorting='F'
styles='width:100%; height:100%'
/>
            </td>
      </tr> 
</table>  
 <gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
<gw:textbox id="txtOpenBookAmt" text="0"  styles='display:none;'/>
<gw:textbox id="txtOpenTransAmt" text="0"  styles='display:none;'/>

<gw:textbox id="txtBankPK" text="0"  styles='display:none;'/>
<gw:textbox id="txtBankCCy" text="0"  styles='display:none;'/>
<gw:textbox id="txt_ac_nm" text="0"  styles='display:none;'/>

<gw:list id="idSearchby" value = "0" styles="display:none; onchange="onChangeSearchBy()" >
<data>|0|Deposit Account</data>
</gw:list>


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
<gw:textbox id="txtAc_level"  styles='display:none' />
         <gw:textbox id="txtSesion_company"  styles='display:none' />
<gw:textbox id="txtUser_Pk" styles="display:none;" />
</body>
</html>
