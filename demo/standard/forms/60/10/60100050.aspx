<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>External Payment List</title>
</head>
<script>
    var  user_pk = "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>"  ;
    var  g_user_pk = "<%=Session("USER_PK")%>"  ;
	
var G_CHK = 0,	
	G_PPK = 1,
	G_HPK = 2,
	G_INVOICE_NO = 3,
	G_VOUCHER_NO = 4,
	G_TR_DATE = 5,
	G_SIGN_DATE = 6,
	G_TR_DATE_SEQ = 7,
	G_PL_NM = 8,
	G_TR_REMARK = 9,
	G_TR_REMARK2 = 10,
	G_CUST_ID = 11,
	G_CUST_NM = 12,
	G_TR_FAMT = 13,
	G_TR_AMT = 14,
	G_AMOUNT_USD = 15,
	G_AMOUNT_VND = 16,
	G_DUE_DATE = 17,
	G_BEN_NAME = 18,
	G_BEN_BANK = 19,
	G_BenefiAcctNo = 20,
	G_CreditAccount = 21;
	
//------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
	auto_resize_column(idGrid,0,idGrid.cols-1,9);
    BindingDataList();
}
//------------------------------------------------------------------------
function BindingDataList()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    idCOM.SetDataText(ls_data);
	ls_data     = "<%=CtlLib.SetListDataSQL("select pk, bank_id from tac_abdepomt where del_if = 0 and use_yn = 'Y' order by bank_id asc")%>|0|Select All";
	idBankAcc.SetDataText(ls_data);
	idBankAcc.value = 0;
	if(idGrid.rows < 2)
	idGrid.AddRow();
	MergeHeaderGrid();	
	idCUST_NM.SetEnable(false);
	idCUST_CD.SetEnable(false);
	idBENEFICIARY_NM.SetEnable(false);
	idBENEFICIARY_CD.SetEnable(false);
	//search();	
	idBtnSave.SetEnable(false);
	idBtnConfirm.SetEnable(false);
	txtUser_Pk.SetDataText(g_user_pk);
	dso_getCompany.Call();
}
//------------------------------------------------------------------------
function OnDataReceive(iObj)
{
	if(iObj.id == "gfep00060")
	{
		MergeHeaderGrid();
	}	
	else if(iObj.id == "gfep00060_1")
	{
		MergeHeaderGrid();
		OnRecv_search();
	}
	else if(iObj.id == "gfep00060_3")
	{
		MergeHeaderGrid();
		OnRecv_search();		
	}
	else if(iObj.id == "gfep00060_4")
	{
		MergeHeaderGrid();
		OnRecv_search();		
	}
    else if(iObj.id == 'dso_upd_paydate')
    {
        gfep00060.Call('SELECT');
    }
    else if(iObj.id == 'dso_confirm_payment')
    {
        idSTATUS.value = 'Y';
        gfep00060_1.Call('SELECT');
    }
}
//------------------------------------------------------------------------
function OnPopUp(iCase)
{
	
	var path    = System.RootURL + '/standard/forms/gf/co/ffbp00031.aspx';
	var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
	switch(iCase)
	{
		case '1':
			if ( object != null )
			{
				if (object[0] != 0)
				{
					idCUST_PK.text = object[0];
					idCUST_NM.text = object[2];
					idCUST_CD.text = object[1];
				}
			}		
		break;
	}	
}
//------------------------------------------------------------------------
function search()
{
	if(idSTATUS.value == "Y")
	{
		gfep00060_1.Call("SELECT");
	}	
	else 
	{
		gfep00060.Call("SELECT");
	}
}
//------------------------------------------------------------------------
function OnRecv_search()
{
	//idData_Dsql_Finished.Call("SELECT");
	var ctrl = idGrid.GetGridControl();
	var i = ctrl.rows - 2;
	lblRecord.SetDataText( i);
	//Check all
	idChkAll.value = 'F';
	CheckAll();
}
//------------------------------------------------------------------------
function MergeHeaderGrid()
{
		

		var fg = idGrid.GetGridControl(); 	    
        fg.FixedRows = 2
        fg.MergeCells =5	
		fg.MergeRow(0) = true
		
		fg.MergeCol(G_CHK) = true
		fg.Cell(0, 0, G_CHK, 1, G_CHK) = "CHK"	
		
		fg.MergeCol(G_PPK) = true
		fg.Cell(0, 0, G_PPK, 1, G_PPK) = "PPK"	
		
		fg.MergeCol(G_HPK) = true
		fg.Cell(0, 0, G_HPK, 1, G_HPK) = "Seq"	
		
		fg.MergeCol(G_INVOICE_NO) = true
		fg.Cell(0, 0, G_INVOICE_NO, 1, G_INVOICE_NO) = "Invoice No"	
		
		fg.MergeCol(G_VOUCHER_NO) = true
		fg.Cell(0, 0, G_VOUCHER_NO, 1, G_VOUCHER_NO) = "Voucher No"	

		
		fg.MergeCol(G_TR_DATE) = true
		fg.Cell(0, 0, G_TR_DATE, 1, G_TR_DATE) = "Payment Date"	
		
		fg.MergeCol(G_SIGN_DATE) = true
		fg.Cell(0, 0, G_SIGN_DATE, 1, G_SIGN_DATE) = "Approved Date"	
			
		//_TAC_ABACCTCODE_PK
		fg.MergeCol(G_TR_DATE_SEQ) = true
		fg.Cell(0, 0, G_TR_DATE_SEQ, 1, G_TR_DATE_SEQ) = "Approved No"	
		
		//_TAC_ABACCTCODE_PK
		fg.MergeCol(G_PL_NM) = true
		fg.Cell(0, 0, G_PL_NM, 1, G_PL_NM) = "Project Name"	
		
		 //Remark	    
		 /*
	    fg.Cell(0, 0, 8, 0, 9)  = "Description"   //fg.Cell(0,row, from_col, row, to_col)		
	    fg.Cell(0, 1, 8, 1) = "Foreign"
	    fg.Cell(0, 1, 9, 1) = "Local"	
	    */
	    fg.MergeCol(G_TR_REMARK) = true
		fg.Cell(0, 0, G_TR_REMARK, 1, G_TR_REMARK) = "Description"	
		//Customer
		/*
		fg.Cell(0, 0, 10, 0, 11)  = "Customer"   //fg.Cell(0,row, from_col, row, to_col)		
	    fg.Cell(0, 1, 10, 1) = "Code"
	    fg.Cell(0, 1, 11, 1) = "Name"	
	    */
	    fg.MergeCol(G_CUST_NM) = true
	    fg.Cell(0, 0, G_CUST_NM, 1,G_CUST_NM) = "Customer Name"	
		//Amt
		fg.Cell(0, 0, G_TR_FAMT, 0, G_TR_AMT)  = "By Tranfer"   //fg.Cell(0,row, from_col, row, to_col)		
	    fg.Cell(0, 1, G_TR_FAMT, 1) = "USD"
	    fg.Cell(0, 1, G_TR_AMT, 1) = "VND"		
				
		//Amt
		fg.Cell(0, 0, G_AMOUNT_USD, 0, G_AMOUNT_VND)  = "By Cash"   //fg.Cell(0,row, from_col, row, to_col)		
	    fg.Cell(0, 1, G_AMOUNT_USD, 1) = "USD"
	    fg.Cell(0, 1, G_AMOUNT_VND, 1) = "VND"	
		
		//TRTYPE_PK
		fg.MergeCol(G_DUE_DATE) = true
		fg.Cell(0, 0, G_DUE_DATE, 1, G_DUE_DATE) = "Books Amount"
		
		//TRTYPE_PK
		fg.MergeCol(G_BEN_NAME) = true
		fg.Cell(0, 0, G_BEN_NAME, 1, G_BEN_NAME) = "Beneficicary Name"
		
		//TRTYPE_BANK
		fg.MergeCol(G_BEN_BANK) = true
		fg.Cell(0, 0, G_BEN_BANK, 1, G_BEN_BANK) = "Beneficicary Bank"
		
		fg.MergeCol(G_BenefiAcctNo) = true
		fg.Cell(0, 0, G_BenefiAcctNo, 1, G_BenefiAcctNo) = "Benefi. Acct. No"

		fg.MergeCol(G_CreditAccount) = true
		fg.Cell(0, 0, G_CreditAccount, 1, G_CreditAccount) = "Credit Account"
		
	   	fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4; 
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; //Format all col merge : Fone = Bold
		
		//idData_dsql_sliprate.Call("SELECT")
		/*fg.ColWidth(G_CHK) = 500;//chk
		fg.ColWidth(G_PPK) = 0;	// ppk			
		fg.ColWidth(G_HPK) = 1000; //seq
		fg.ColWidth(G_INVOICE_NO) = 2000; //inv
		fg.ColWidth(G_VOUCHER_NO) = 1500; //vocuher
		fg.ColWidth(G_TR_DATE) = 1300; //Payment Date
		fg.ColWidth(G_SIGN_DATE) = 0; //Approved Date
		fg.ColWidth(G_TR_DATE_SEQ) = 0;//Approved No
		fg.ColWidth(G_PL_NM) = 2000; //Project Name"
		
		fg.ColWidth(G_TR_REMARK) = 2500;	 //Foreign
		fg.ColWidth(G_TR_REMARK2) = 0;//Local
		
		fg.ColWidth(G_CUST_ID) = 0; //cust id
		fg.ColWidth(G_CUST_NM) = 2500; //cust nm
		
		fg.ColWidth(G_TR_FAMT) = 1600;		//bank usd	
		fg.ColWidth(G_TR_AMT) = 1600;		//bank vnd		
		
		fg.ColWidth(G_AMOUNT_USD) = 1600;//cash usd	
		fg.ColWidth(G_AMOUNT_VND) = 1600;//cash vnd	
		
		fg.ColWidth(G_DUE_DATE) = 1500; // books 
		fg.ColWidth(G_BEN_NAME) = 2000; //Bene name
		fg.ColWidth(G_BEN_BANK) = 3000;//Ben Bank
		fg.ColWidth(G_BenefiAcctNo) = 3000;//Debit Acct.
		fg.ColWidth(G_CreditAccount) = 3000;//Credit Acct.

		fg.ColFormat(G_TR_FAMT) = "###,###,###,###.##";	
		fg.ColFormat(G_TR_AMT) = "###,###,###,###";	
		fg.ColFormat(G_INVOICE_DATE) = "###,###,###,###.##";	
		fg.ColFormat(G_INVOICE_NO) = "###,###,###,###.##";	
		fg.ColFormat(G_DUE_DATE) = "###,###,###,###.##";
		//CheckAll();
		*/
		auto_resize_column(idGrid,0,idGrid.cols-1,9);
}

function auto_resize_column(obj,col1,col2,font_size)
{
    if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}

//---------------------------------------------------
function onchangeBank()
{
	idPrintType.value = "0";
	if(idSTATUS.GetData() == "N")
		gfep00060.Call("SELECT");
	else
		gfep00060_1.Call("SELECT");
}
//---------------------------------------------------
function onDomesticOversea()
{
	idGrid.ClearData();
	if (idPrintType.value =="0")
	{
		if(idSTATUS.GetData() == "N")
			gfep00060.Call("SELECT");
		else
			gfep00060_1.Call("SELECT");
		return;
	}
	var sheet_type = idBankAcc.GetData();
	if (sheet_type ==0)
	{
		alert("Please chose a bank account first");
		return;
	}
	
	var sheet_type_text = idBankAcc.GetText();
	var tmpTypeSheetArr = new Array();
	tmpTypeSheetArr = sheet_type_text.split(' ');
	bankStr = tmpTypeSheetArr[0].toString().substr(0,3);

	if (idPrintType.GetData() =="1")//Domestic
	{	
		switch(bankStr)
		{
			case "VCB":
				break;
			case "KEB":
				gfep00060_2.Call("SELECT");
				break;
			case "WRB":
				gfep00060_2.Call("SELECT");
				break;
			case "SHB":
				gfep00060_4.Call("SELECT");
				break;
		}		
	}
	else if (idPrintType.GetData() =="2")//Oversea
	{
		
		switch(bankStr)
		{
			case "VCB":
				break;
			case "KEB":
				gfep00060_3.Call("SELECT");
				break;
			case "WRB":
				gfep00060_3.Call("SELECT");
				break;
			case "SHB":
				gfep00060_5.Call("SELECT");
				break;
		}
	}
	//alert(System.RootURL+url);			
}
//---------------------------------------------------
function onDomesticOversea()
{

	idGrid.ClearData();
	if (idPrintType.value =="0")
	{
		if(idSTATUS.GetData() == "N")
			gfep00060.Call("SELECT");
		else
			gfep00060_1.Call("SELECT");
		return;
	}
	var sheet_type = idBankAcc.GetData();
	if (sheet_type ==0)
	{
		alert("Please chose a bank account first");
		return;
	}
	
	var sheet_type_text = idBankAcc.GetText();
	var tmpTypeSheetArr = new Array();
	tmpTypeSheetArr = sheet_type_text.split(' ');
	bankStr = tmpTypeSheetArr[0].toString().substr(0,3);

	if (idPrintType.GetData() =="1")//Domestic
	{	
		switch(bankStr)
		{
			case "VCB":
				break;
			case "KEB":
				gfep00060_4.Call("SELECT");
				break;
			case "WRB":
				gfep00060_2.Call("SELECT");
				break;
			case "SHB":
				gfep00060_4.Call("SELECT");
				break;
		}		
	}
	else if (idPrintType.GetData() =="2")//Oversea
	{	
		switch(bankStr)
		{
			case "VCB":
				break;
			case "KEB":
				gfep00060_3.Call("SELECT");
				break;
			case "WRB":
				gfep00060_3.Call("SELECT");
				break;
			case "SHB":
				gfep00060_5.Call("SELECT");
				break;
		}
	}
	//alert(System.RootURL+url);		
}
//---------------------------------------------------
function OnPrintVoucherSheet()
{
	var sheet_type = idBankAcc.GetData();
	var PkArr = '';
	var strComma = '';
	var i ;
	for (i=2;i<idGrid.rows;i++)
	{
		if (idGrid.GetGridData(i,G_CHK) == "-1")
		{
			PkArr = PkArr + strComma + idGrid.GetGridData(i,G_PPK);
			strComma = ',';
		}			
	}
	if (PkArr=='' )
	{
		alert("Select a payment to print");
		return;
	}	
	else if(idBankAcc.GetData() == "0" )
	{
		alert("Select a bank id to report data");
		return;	    
	}
	if(confirm("Are you sure you want to print ?" ))
	{		
		var url = System.RootURL + '/standard/reports/gf/ep/gfep00060_voucher_rpt.aspx?compk=' + idCOM.GetData() + '&custpk=' + idCUST_PK.GetData() + '&bankpk=' + idBankAcc.GetData() + '&sdt=' + idSDT.GetData() + '&edt=' + idEDT.GetData() + "&crt_by=" + user_name ;
		//var sheet_type = idBankAcc.GetData();
		//var url = System.RootURL + '/standard/reports/gf/ep/wabf016000_sheetType_rpt_70.aspx?pk=' + PkArr + '&bankPK=' + sheet_type;
		System.OpenTargetPage(url,'newform');
	}
}
//---------------------------------------------------
function OnPrintTransfer()
{
	var idCom = idCOM.GetData();
	var sheet_type = idBankAcc.GetData();
	var url = '';
	//if (idSTATUS.value !="Y")
	//{
		//alert("Cannot print payable voucher");
		//return;
	//}
	/*	
	if (sheet_type ==0)
	{
		alert("Please chose a bank account before printing");
		return;
	}
	*/
	if(txtACPK_CR.text != "")
	{
	    if(idBankAcc.value == '0')
	    {
	        alert('Select bank id to print out transfer list!');
	        return ;
	    }
    }
    else
    {
	    if(idBankAcc.value == '0')
	    {
	        alert('Select bank id to print out transfer list!');
	        return ;
	    }
    }	 
    var ctrl = idGrid.GetGridControl();
    var PkArr = '';
    var strComma = '';
    for (i=2;i<idGrid.rows;i++)
    {
	    if (idGrid.GetGridData(i,G_CHK) == "-1")
	    {
		    PkArr = PkArr + strComma + idGrid.GetGridData(i,G_HPK);
		    strComma = ',';
	    }		
    }
    if (PkArr=='')
    {
	    alert("Select a payment to print");
	    return;
    }
    url = '/standard/reports/gf/ep/gfep00060_remittance_1.aspx?date_fr=' + idSDT.value + "&date_to=" + idEDT.value + "&compk=" + idCOM.GetData() + "&credit_acpk=" + txtACPK_CR.text + "&bank_id=" + idBankAcc.value + "&pay_date=" + dtPayDT.value ;
    System.OpenTargetPage( System.RootURL+url , 'newform' )	;	       
}
//---------------------------------------------------
function OnPrintSheet()
{
var idCom = idCOM.GetData();
var sheet_type = idBankAcc.GetData();
var url = '';
if (idSTATUS.value !="Y")
{
	alert("Cannot print payable voucher");
	return;
}
if (sheet_type ==0)
{
	alert("Please chose a bank account before printing");
	return;
}
var ctrl = idGrid.GetGridControl();
var PkArr = '';
var strComma = '';
for (i=2;i<idGrid.rows;i++)
{
	if (idGrid.GetGridData(i,G_CHK) == "-1")
	{
		PkArr = PkArr + strComma + idGrid.GetGridData(i,G_PPK);
		strComma = ',';
	}	
}
//var yourname= prompt("PK list_" ,PkArr);	
if (PkArr=='')
{
	alert("Select a payment to print");
	return;
}
var sheet_type_text = idBankAcc.GetText();
var tmpTypeSheetArr = new Array();
tmpTypeSheetArr = sheet_type_text.split(' ');
bankStr = tmpTypeSheetArr[0].toString().substr(0,3);

if (idPrintType.GetData() =="0") //Select All
{
	if (bankStr =="VCB")
	{
		url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_10.aspx?pk=' + PkArr + '&bankPK=' + sheet_type;
	}
	else
	{
		alert("Please chose a print type");
		return;
	}
}

if (idPrintType.GetData() =="1")//Domestic
		{
		
			switch(bankStr)
			{
				case "VCB":
					url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_10.aspx?pk=' + PkArr + '&bankPK=' + sheet_type;
					break;
				case "KEB":
					url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_60.aspx?pk=' + PkArr + '&bankPK=' + sheet_type;
					break;
				case "WRB":
					url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_40.aspx?pk=' + PkArr + '&bankPK=' + sheet_type;
					break;
				case "SHB":
					url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_70.aspx?pk=' + PkArr + '&bankPK=' + sheet_type;
					break;
			}
			
		}
		else if (idPrintType.GetData() =="2")//Oversea
		{
			
			switch(bankStr)
			{
				case "VCB":
					url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_10.aspx?pk=' + PkArr + '&bankPK=' + sheet_type;
					break;
				case "KEB":
					url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_20.aspx?pk=' + PkArr + '&bankPK=' + sheet_type;
					break;
				case "WRB":
					url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_30.aspx?pk=' + PkArr + '&bankPK=' + sheet_type + "&bank_usd_tp=21&bank_vnd_tp=22&cash_usd_tp=11&cash_vnd_tp=12";
					break;
				case "SHB":
					url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_50.aspx?pk=' + PkArr + '&bankPK=' + sheet_type;
					break;
			}
		}
		//alert(System.RootURL+url);
		System.OpenTargetPage( System.RootURL+url , 'newform' )	;	

/*
		if  (idSDT.value != idEDT.value)
		{
			alert('The payment date must be the same');
			return;
		}
		if (flgCust=='' || flgBank=='' )
		{
			alert('Please click on Update before printing');
			return;
		}

		//check for empty grid
		var sheet_type = idBankAcc.GetText();
		var idCom = idCOM.GetData();
		var idCust = flgCust;//idCUST_PK.text;
		var idDate = idSDT.value;
		var idBank = flgBank;//idTAC_BFBENEFICIARY_PK.text;
		var url  ;
		var bankStr = '';
		var tmpTypeSheetArr = new Array();
		tmpTypeSheetArr = sheet_type.split(' ');
		bankStr = tmpTypeSheetArr[0].toString().substr(0,3);
		//alert(bankStr+"---"+tmpTypeSheetArr[1]);
		if (tmpTypeSheetArr[1]=="VND")
		{
			switch(bankStr)
			{
				case "VCB":
					url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_10.xls?com='+idCom+'&cust='+idCust+'&dtDate='+idDate+'&Bank='+idBank;
					break;
				case "KEB":
					url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_20.xls?com='+idCom+'&cust='+idCust+'&dtDate='+idDate+'&Bank='+idBank;
					break;
				case "WRB":
					break;
				case "SHB":
					break;
			}
			
		}
		else if (tmpTypeSheetArr[1]=="USD")
		{
			switch(bankStr)
			{
				case "VCB":
					url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_10.xls?com='+idCom+'&cust='+idCust+'&dtDate='+idDate+'&Bank='+idBank;
					break;
				case "KEB":
					url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_20.xls?com='+idCom+'&cust='+idCust+'&dtDate='+idDate+'&Bank='+idBank;
					break;
			}
		}
		
		*/
		/*
		switch (sheet_type)
		{
			case "10"://payment VCB
					url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_10.xls?com='+idCom+'&cust='+idCust+'&dtDate='+idDate+'&Bank='+idBank;
					break;
			case "20": //Application for overseas remittance
					 url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_20.xls?com='+idCom+'&cust='+idCust+'&dtDate='+idDate+'&Bank='+idBank;
					break;
			case "30": // Application for remittance - Woori bank -oversea
				     url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_30.xls?com='+idCom+'&cust='+idCust+'&dtDate='+idDate+'&Bank='+idBank;
					break;
			case "40":// Withdrawal -woori
					url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_40.xls?com='+idCom+'&cust='+idCust+'&dtDate='+idDate+'&Bank='+idBank;
					break;
			case "50": //Application for remittance - Shinhan bank
					url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_50.xls?com='+idCom+'&cust='+idCust+'&dtDate='+idDate+'&Bank='+idBank;
					break;
			case "60" ://KEB Diamond
					url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_60.xls?com='+idCom+'&cust='+idCust+'&dtDate='+idDate+'&Bank='+idBank;
					break;
			case  "70" ://Widthrawal-shinhan
					url = '/standard/reports/gf/ep/wabf016000_sheetType_rpt_70.xls?com='+idCom+'&cust='+idCust+'&dtDate='+idDate+'&Bank='+idBank;
					break;
			default :
					alert('Please choose a sheet type');
					break;
		}
		System.OpenTargetPage( System.RootURL+url , 'newform' )	;	
		*/		  	
}
//-------------------------------------------------
var chkAll =true;

function CheckAll()
{    
	
	if (idChkAll.value=='T') //check all
	{		
		chkAll = false;
		//idChkAll.SetData("T");		
		for (i=2;i<idGrid.rows;i++)
		{
			//if (idGrid.GetGridData(i, 20)!="")
			//{
				idGrid.SetGridData(i,G_CHK,"-1");
		}
	}
	else //uncheck all
	{
		chkAll = true;
		//alert('unckeck');
		//idChkAll.SetData("F");		
		for (i=2;i<idGrid.rows;i++)
		{
			idGrid.SetGridText(i,G_CHK, "0");
		}		
	}	
}
//-------------------------------------------------
function OnPrintPayableList()
{
	var rqt = "?l_compk=" + idCOM.GetData() + '&l_seq=&l_paydue_fr=&l_paydue_to=&l_datefr=' + idSDT.GetData() + '&l_dateto=' + idEDT.GetData() + '&l_tco_buspartner_pk=' + idCUST_PK.GetData() + '&l_voucher_no=' + idVOUCHERNO.GetData() + '&l_tac_abplcenter_pk=&l_type=AL&l_pay_date=&bal_opt=3';
	var url =System.RootURL + '/standard/reports/gf/ep/gfep00020_paylist_cfm.aspx' + rqt;
	if (confirm("Are you sure you want to report ?" ))
	{
		System.OpenTargetPage(url, 'newform');
		return;
	}
}
//-------------------------------------------------
function OnResetCust()
{
	idCUST_PK.text = "";
	idCUST_CD.text = "";
	idCUST_NM.text = "";
}
//-------------------------------------------------
function OnCreditAccount()
{
    var fpath   = System.RootURL + "/standard/forms/gf/co/ffco002004.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=G35&val1=Advance To Vendor&val2=C&val3=" + idCOM.GetData() + "&dsqlid=SP_SEL_ACCOUNT_NEW_DRCR";
    var object      = System.OpenModal(  fpath , 750 , 550 , 'resizable:yes;status:yes');	    
    if(object != null) 
    {
        var tmp = new Array();
        tmp = object[0];
        if(tmp[1] != "0")
        {
            txtACPK_CR.SetDataText(tmp[1]);//acc_pk
            txtACCD_CR.SetDataText(tmp[4]); //acc_cd
            txtACNM_CR.SetDataText( tmp[5]);//acc_nm
        }
    }
}
//-------------------------------------------------
function Reset_CreditAcc()
{
    txtACPK_CR.SetDataText("");
    txtACCD_CR.SetDataText("");
    txtACNM_CR.SetDataText("");
}
//-------------------------------------------------
function OnPrint()
{
    if(lstReport.value == "0")
    {
        OnPrintVoucherSheet();
    }
    else if(lstReport.value == "1")
    {
        OnPrintTransfer();
    }
    else if(lstReport.value == "2")
    {
        OnPrintPayableList();
    }
    else if(lstReport.value == "3")
    {
        var i, l_seq = "";
        for(i = 2; i < idGrid.rows; i++)
        {
            if(idGrid.GetGridData(i, G_CHK) == '-1')
            {
                l_seq = idGrid.GetGridData(i, G_HPK);
            }
        }
        if(l_seq != "")
        {
		    var url =System.RootURL + '/standard/reports/gf/hg/60080010_envn.aspx?seq=' + l_seq;
		    if(confirm("Are you sure you want to report ?" ))
		    {
			    System.OpenTargetPage( url , 'newform' );
			    return;
		    }                
        }		    
    }        
}
//-------------------------------------------------
function OnSave()
{
    var i, n = 0, strComma = '', PkArr = '';
    for( i = 2; i < idGrid.rows; i++)
    {
        if(idGrid.GetGridData(i, G_CHK) =="-1")
        {            
            n = n +1;
			PkArr = PkArr + strComma + idGrid.GetGridData(i,G_HPK);
			strComma = ',';            
        }
    }
    if(confirm("Are you sure you want to update the payment date is " + dtPayDT.text + "?" ))
    {
        if(PkArr =="")
        {
            alert("Please you select the seq to print accounting slip!");
            return ;
        }
        else
        {
            txt_index.text = n;
            //l_data = l_data.substr(0, l_data.length - 1);
            //alert(PkArr);
            txt_str.SetDataText( PkArr);
            dso_upd_paydate.Call();
        }
    }
}
//-------------------------------------------------
function OnConfirm()
{
    var i , n = 0, strComma = "", PkArr = '';
    for(i = 2; i < idGrid.rows; i++)
    {
        if(idGrid.GetGridData(i, G_CHK) == "-1")
        {            
			PkArr = PkArr + strComma + idGrid.GetGridData(i,G_HPK);
			strComma = ',';            
            n = n + 1;
        }
    }
    if(n == 0)
    {
        alert("Please you select the seq to confirm!");
        return ;
    }
    if(confirm("Are you sure you want to confirm the selected payment slip?"))
    {
        txt_index.text = n;        
        txt_str.SetDataText( PkArr);
        var fpath = System.RootURL + '/standard/forms/gf/ep/gfep00090_get_transfer_date.aspx?dtPayDT=' + dtPayDT.GetData();
        var wWidth = 500;
        var wHeight = 260;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
        "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
        "lef="+ x +",top=" + y;

        var object = System.OpenModal(fpath, wWidth, wHeight, features);                        
        if(object != null )
        {
            var arr = new Array();
            arr = object ;
            if(arr[0] != '0')
            {
                dtPayDT.SetDataText(object[0]); // Transfer Date
				
				idVOUCHERNO.SetDataText(object[1]); // voucher no
                dso_confirm_payment.Call();
            }               
        }                
    }
}
//-------------------------------------------------
function OnChangeStatus()
{
    if(idSTATUS.value == 'N')
    {
        idBtnConfirm.SetEnable(true);
        idBtnSave.SetEnable(true);
    }
    else if(idSTATUS.value == 'Y')
    {
        idBtnConfirm.SetEnable(false);
        idBtnSave.SetEnable(false);        
    }
    search();
}
//-------------------------------------------------
</script>

<body>    
<!--dso_payment_Save-->
  <gw:data id="gfep00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="AC_SEL_60100050" > 
                <input bind="idGrid" >                 
                    <input bind="idCOM" />
                    <input bind="idCUST_PK" />
                    <input bind="idSDT" />
                    <input bind="idEDT" />
					<input bind="idVOUCHERNO" />
					<input bind="idBankAcc" />
					<input bind="txtBank_USD_tp" />
					<input bind="txtBank_VND_tp" />
					<input bind="txtCash_USD_tp" />
					<input bind="txtCash_VND_tp" />
                    <input bind="txtSeq" />															
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>   
	<!--dso_payment_Confirm-->
<!-------------------------------------------------------------------->	
  <gw:data id="gfep00060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="AC_sel_60100050_Grid_" > 
                <input bind="idGrid" >                 
                    <input bind="idCOM" />
                    <input bind="idCUST_PK" />
                    <input bind="idSDT" />
                    <input bind="idEDT" />
					<input bind="idVOUCHERNO" />
					<input bind="idBankAcc" />
					<input bind="txtBank_USD_tp" />
					<input bind="txtBank_VND_tp" />
					<input bind="txtCash_USD_tp" />
					<input bind="txtCash_VND_tp" />
					<input bind="txtSeq" />										
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>   
<!--dso_WR_KEB_Domestic-->    
<!-------------------------------------------------------------------->	
  <gw:data id="gfep00060_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="AC_SEL_60100050_3" > 
                <input bind="idGrid" >                 
                    <input bind="idCOM" />
                    <input bind="idCUST_PK" />
                    <input bind="idSDT" />
                    <input bind="idEDT" />
					<input bind="idVOUCHERNO" />
					<input bind="idBankAcc" />
					<input bind="txtBank_USD_tp" />
					<input bind="txtBank_VND_tp" />
					<input bind="txtCash_USD_tp" />
					<input bind="txtCash_VND_tp" />										
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>       
<!--dso_WR_KEB_Oversea-->	
<!-------------------------------------------------------------------->	
  <gw:data id="gfep00060_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="AC_SEL_60100050_4" > 
                <input bind="idGrid" >                 
                    <input bind="idCOM" />
                    <input bind="idCUST_PK" />
                    <input bind="idSDT" />
                    <input bind="idEDT" />
					<input bind="idVOUCHERNO" />
					<input bind="idBankAcc" />
					<input bind="txtBank_USD_tp" />
					<input bind="txtBank_VND_tp" />
					<input bind="txtCash_USD_tp" />
					<input bind="txtCash_VND_tp" />					
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>       
<!--dsql_paid_SH_Domestic-->	
<!-------------------------------------------------------------------->	
  <gw:data id="gfep00060_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="AC_SEL_60100050_5" > 
                <input bind="idGrid" >                 
                    <input bind="idCOM" />
                    <input bind="idCUST_PK" />
                    <input bind="idSDT" />
                    <input bind="idEDT" />
					<input bind="idVOUCHERNO" />
					<input bind="idBankAcc" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>       
<!--dsql_paid_SH_Domestic-->	
<!-------------------------------------------------------------------->	
  <gw:data id="gfep00060_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="AC_SEL_60100050_6" > 
                <input bind="idGrid" >                 
                    <input bind="idCOM" />
                    <input bind="idCUST_PK" />
                    <input bind="idSDT" />
                    <input bind="idEDT" />
					<input bind="idVOUCHERNO" />
					<input bind="idBankAcc" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>       
<!-------------------------------------------------------------------->	
    <gw:data id="dso_confirm_payment" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_PRO_60100050_CONFIRM_PAY_2" > 
                <input> 
                     <input bind="txt_str"/>
                     <input bind="idCOM"/>
                     <input bind="txt_index"/>		
                     <input bind="dtPayDT"/>    
					 <input bind="idVOUCHERNO"/>    					 
                </input>  
                <output>  
                     <output bind="txtStatus"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!-------------------------------------------------------------------->	
    <gw:data id="dso_upd_paydate" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="AC_UPD_60100050_PAYMENT" > 
                <input> 
                     <input bind="txt_str"/>
                     <input bind="idCOM"/>
                     <input bind="txt_index"/>
                     <input bind="dtPayDT"/>
                </input>  
                <output>  
                     <output bind="txtStatus"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!-------------------------------------------------------------------->	
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="AC_SEL_60100050_getCOM" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="idCOM"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>        
<!-------------------------------------------------------------------->	
<table class="table" style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0" ID="Table1">
    <tr>
        <td style="width:10%;"></td> <!-- Company -->   
        <td style="width:18%;"></td>
        <td style="width:5%;"></td> 
        <td style="width:12%;"></td> <!-- Status -->
        <td style="width:10%;"></td> <!-- Seq -->
        <td style="width:10%;"></td>
        <td style="width:10%;"></td> <!-- Customer -->
        <td style="width:8%;"></td>
        <td style="width:15%;"></td>
        <td style="width:2%;"></td>  <!-- Reset -->
    </tr>
    <tr height='2%'>
        <td align="right">Company</td>
        <td><gw:list id="idCOM" styles='width:100%' /></td>
        <td align="right">Status</td>
        <td align=left><gw:radio id="idSTATUS" value="Y" onchange="OnChangeStatus()"> 
														<span value="N" >Saved</span>
														<span value="Y" >Confirmed</span>
													</gw:radio >
        </td>							
        <td align="right">Seq</td>						
        <td align="left"><gw:textbox id="txtSeq" styles="width:100%;" onenterkey="search()" /></td>
        <td width="10%" bgcolor="" align="right"><font color="black" ><a title="Click to select Customer" href="#tips" onclick="OnPopUp('1')"><b>Customer</b></a></font></td>
        <td><gw:textbox id="idCUST_CD" styles='width:100%'/></td>
        <td><gw:textbox id="idCUST_NM" styles='width:100%'/></td>
        <td width="5%" align="left"><gw:imgBtn id="ibtnResetClient" img="reset"  alt="reset Customer" onclick="OnResetCust()" /></td>
    </tr>
    <tr height='2%'>
        <td align="right">Pay Date</td>
        <td align="left"><gw:datebox id="idSDT" 	onchange="" styles='width:85%'  lang="<%=Session("Lang")%>"/></td>
        <td align="left">~</td>
        <td align="right"><gw:datebox id="idEDT" 	onchange=""styles='width:85%'  lang="<%=Session("Lang")%>"/></td>
        <td align="right">Voucher No</td>
        <td><gw:textbox id="idVOUCHERNO" styles='width:100%'/></td>
        <td align="right"><a title="Click here to select account code" href="#tips" onclick="OnCreditAccount()">Credit Acc.</a></td>
        <td align="left"><gw:textbox id="txtACCD_CR" styles='width:100%' /></td>
        <td align="left"><gw:textbox id="txtACNM_CR" styles='width:100%' /></td>
        <td><gw:imgBtn   img="reset"	id="idResetAccCR"  alt="Reset" onclick="Reset_CreditAcc()"/></td>
    </tr>
    <tr height='2%'>
        <td align="right"><font color="black" ><b>Bank Account</b></font></td>
        <td><gw:list id="idBankAcc" onChange="onchangeBank()" styles='width:100%;' /></td>
        <td align="right">Report</td>
        <td>
            <gw:list id="lstReport" >
                <data>DATA|0|Voucher Thanh toán|1|Transfer List|2|Payable List|3|Accounting Slip</data>
            </gw:list>
        </td>
        <td align="right" >Transfer Date</td>									            
        <td><gw:datebox id="dtPayDT" csstype="mandatory" lang="1" /></td>
        <td colspan="1"></td>
        <td colspan="3">
			<table  width="100%" ID="Table5">
					<tr>										 
						<td width="10%" align="left"><gw:imgBtn id="idSearch"   	img="search" 	alt="search" 	text="Search" 		onclick="search()"/></td>
						<td width="15%" align="left"><gw:imgBtn	id="idBtnSave"  	img="save" 	text="Save"	onclick="OnSave()" /></td>
						<td width="30%" align="left"><gw:icon 	id="idBtnConfirm" 	img="in" 		text="Confirm" onclick="OnConfirm()" /></td>
						<td width="30%" align="left"><gw:icon 	id="idBtnCancel" 	img="in" 		text="Cancel" onclick="OnCancel()" styles='display:none;' /></td>
						<td width="15%" align=left><gw:imgBtn id="ibtnPrint" 		img="printer" 	alt="Payable List" 					onclick="OnPrint()" /></td>									
					</tr>
				</table>            
        </td>
    </tr>
    <tr height='2%'>
        <td bgcolor="" align="right"><font color="black" ><b>Check All</b></font></td>
        <td align="left"><gw:checkbox id="idChkAll" value="T" onchange="CheckAll()" /> </td>
	    <td align="right"><b><gw:label id="lblRecord" text="" style="width:100%" /></b></td>    	
	    <td align="left" >&nbsp;<b>Records</b></td>					        
    </tr>                          
	<tr height='92%'>		
		<td colspan=10>
			<!-- Table2 contain detail grid -->
			<gw:grid   
					id="idGrid"  
					header="CHK|_PPK|HPK|INVOICE_NO|VOUCHER_NO|TR_DATE|SIGN_DATE|TR_DATE_SEQ|PL_NM|TR_REMARK|_TR_REMARK2 |_CUST_ID|CUST_NM|TR_FAMT|TR_AMT|AMOUNT_USD|AMOUNT_VND|DUE_DATE|BEN_NAME|BEN_BANK|Benefi. Acct No|Credit Account"   
					format="3|0|0|0|0|4|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
					aligns="0|0|0|0|0|1|1|0|0|0|0|0|0|3|3|3|3|3|0|0|1|0"  
					defaults="|||||||||||||||||||||"  
					editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0"  
					widths="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
					styles="width:100%; height:100%"   
					sorting="T"   
					autosize="T"
					param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20" 						
				/> 						
		</td>
	</tr>	
    
</table>
<gw:textbox id="txtBank_USD_tp" text="03" styles="display:none;" />
<gw:textbox id="txtBank_VND_tp" text="04" styles="display:none;" />
<gw:textbox id="txtCash_USD_tp" text="01" styles="display:none;" />
<gw:textbox id="txtCash_VND_tp" text="02" styles="display:none;" />
<gw:list id="idPrintType" style='width:75%; display:none;' > 
<data>DATA|0|Select All|1|Domestic|2|Oversea</data> 
</gw:list >
<gw:textbox id="txtACPK_CR" styles="display:none;" />
<gw:textbox id="txt_index" styles="display:none;" />
<gw:textbox id="txt_str" styles="display:none;" />
<gw:textbox id="txtStatus" styles="display:none;" />
<gw:textbox id="idCUST_PK" text=""  styles="display:none"/>
<gw:textbox id="idTAC_BFBENEFICIARY_PK" text=""  styles="display:none"/>									
<gw:textbox id="idBENEFICIARY_CD" styles='width:25%;display:none;'/>
<gw:textbox id="idBENEFICIARY_NM" styles='width:74%;display:none;'/>
<gw:textbox id="txtUser_Pk" styles='width:74%;display:none;'/>
</body>
</html>