<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Genuwin</title>
    
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">

function BodyInit()
{
    System.Translate(document);
    BindingDataList();    
    comp_pk     =   "<%=Request.querystring("comp_pk")%>";
    from_date   =   "<%=Request.querystring("from_date")%>";
    to_date     =   "<%=Request.querystring("to_date")%>";
    acc_pk      =   "<%=Request.querystring("acc_pk")%>";
    acc_cd      =   "<%=Request.querystring("acc_cd")%>";
    acc_nm      =   "<%=Request.querystring("acc_nm")%>";
    cust_pk     =   "<%=Request.querystring("cust_pk")%>";
    cust_id     =   "<%=Request.querystring("cust_id")%>";
    cust_nm     =   "<%=Request.querystring("cust_nm")%>";
    status      =   "<%=Request.querystring("status")%>";    
    ccy         =   "<%=Request.querystring("ccy")%>";
    
    lstCompany.value       = ""+comp_pk;
    txtFROM_DATE.value   = ""+from_date;
    txtTO_DATE.value         =""+ to_date;
    txtAC_PK.text             = ""+acc_pk;
    txtAC_CD.text             = ""+acc_cd;
    txtAC_NM.text            = ""+acc_nm;
    txtTCO_BUSPARTNER_PK.text   = ""+cust_pk;
    txtTCO_BUSPARTNER_CD.text   = ""+cust_id;
    txtTCO_BUSPARTNER_NM.text   = ""+cust_nm;
    rdoSTATUS.value      = ""+status;
    lstCCY.value              = ""+ccy;
    
    txtAC_CD.SetEnable(false);
    txtAC_NM.SetEnable(false);
    txtTCO_BUSPARTNER_CD.SetEnable(false);
    txtTCO_BUSPARTNER_NM.SetEnable(false);
    rdoTYPE.value ="V";
    if(rdoTYPE.GetData()== 'D')
   {
      grdDate.style.display="";
      grdVoucher.style.display="none";
      MergeHeaderDate();
      
   }
   else
   {
      grdDate.style.display="none";
      grdVoucher.style.display="";
      MergeHeaderVoucher();
   } 
   MergeHeaderSum();
   datGetAccountInfo.Call(); 
}

function BindingDataList()
{
    var ls_comp   = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_ccy      = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>||Select All";
    var ls_bookccy = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>"; 
     var ls_report       =  "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK004' ORDER BY D.DEF_YN DESC, D.ORD ")%>";
    lstCompany.SetDataText(ls_comp);
    lstCCY.SetDataText(ls_ccy);
    lstBookCcy.SetDataText(ls_bookccy);  
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
		} else // Only Books
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
		fg.ColFormat(6) = "#,###,###,###,###,###,###.##R";
		fg.ColFormat(8) = "#,###,###,###,###,###,###.##R";
		//loadDateOpeningBalance();
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
		fg.MergeCol(8) = true
		fg.Cell(0, 0, 8, 1, 8) = "Opening Balance"
		/*"PK0|VoucherNo1|Date2|User3|CCY4|_acc_pk5|ac_cd6|ac nm7|
OpeningBalance8|DebitTransAmount9|DebitBookAmount10|CreditTransAmount1|CreditBookAmount2|Balance3|
cust_pk4|cust_id5|Partner6|Remark7 |Remark2 8|Item 9"
  */
        fg.Cell(0, 0, 9, 0, 10) = "Debit"  
	    fg.Cell(0, 0, 11, 0, 12) = "Credit" 
		
	    fg.Cell(0, 1, 9, 1, 9)  = "Transaction"
	    fg.Cell(0, 1, 10, 1, 10) = "Books"
		
	    fg.Cell(0, 1, 11, 1, 11)  = "Transaction"
	    fg.Cell(0, 1, 12, 1, 12) = "Books"
	    fg.MergeCol(13) = true
		if(rdoSTATUS.GetData()== 2){
		    fg.Cell(0, 0, 13, 1, 13) = "CFM Balance"
		}
		else
		{
		    fg.Cell(0, 0, 13, 1, 13) = "APP Balance"
		}
	   	
		fg.Cell(0, 0, 15, 0, 16) = "Customer"
		fg.Cell(0, 1, 15, 1, 15) = "ID"  
	    fg.Cell(0, 1, 16, 1, 16) = "Name" 
	    
		fg.Cell(0, 0, 17, 0, 18) = "Description"
		fg.Cell(0, 1, 17, 1, 17) = "Foreigner"
		fg.Cell(0, 1, 18, 1, 18) = "Local"
		fg.MergeCol(19) = true
		fg.Cell(0, 0, 19, 1, 19) = "Control Item"
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		
		fg.ColWidth(0)=600;
		fg.ColWidth(1)=1100;
		fg.ColWidth(2)=1100;
		fg.ColWidth(3)=1200;
		fg.ColWidth(4)=500;
		fg.ColWidth(6)=1500;
		fg.ColWidth(7)=2500;
		fg.ColWidth(8)=1500;
		fg.ColWidth(9)=1500;
		fg.ColWidth(10)=1500;
		fg.ColWidth(11)=1500;
		fg.ColWidth(12)=1500;
		fg.ColWidth(13)=1500;
		fg.ColWidth(14)=0;
		fg.ColWidth(15)=1500;
		fg.ColWidth(16)=2500;
		fg.ColWidth(17)=2500;
		fg.ColWidth(18)=2500;
		fg.ColWidth(19)=2500;
		var AmountType = rdoAMOUNT.GetData();
		if (AmountType == '2') // Books
		{
			fg.MergeCol(10) = true
        	fg.Cell(0, 0, 10, 1, 10) = "Debit"
        	fg.MergeCol(12) = true
        	fg.Cell(0, 0, 12, 1, 12) = "Credit"
			fg.ColWidth(9)=0;
			fg.ColWidth(11)=0;
			
		}
		fg.ColFormat(9) = "#,###,###,###,###,###,###.##R";
		fg.ColFormat(11) = "#,###,###,###,###,###,###.##R";
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
		else
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
	}
	MergeHeaderSum();
}

function OnSearch()
{
    if(txtAC_PK.text =="")
    {
        alert("Please select account");
        return;
    }
    
    if(rdoTYPE.GetData()== 'D')
    {
        
        dso_sel_cust_bal_date.Call("SELECT");
    }
    else
    {
        dso_sel_cust_bal_voucher.Call("SELECT");
    }
}

function OnDisplay()
{
    if(rdoTYPE.GetData()== 'D')
   {
      grdDate.style.display="";
      grdVoucher.style.display="none";
      MergeHeaderDate();
      
   }
   else
   {
      grdDate.style.display="none";
      grdVoucher.style.display="";
      MergeHeaderVoucher();
   } 
   
   MergeHeaderSum();
   OnSearch(); 
}
function loadDateOpeningBalance(){
	var i,liRow;
	var llData;
	liRow = grdDate.rows
	for(i=3;i<liRow;i++){
		grdDate.SetGridText(i,2,grdDate.GetGridData(i-1,7));
	}
}

function loadVoucherOpeningBalance(){
	var i,liRow;
	var llData;
	liRow = grdVoucher.rows
	for(i=3;i<liRow;i++){
		grdVoucher.SetGridText(i,5,grdVoucher.GetGridData(i-1,10));
	}
}

function OnDataReceive(pObject)
{
    switch(pObject.id)
    {
        case "datGetAccountInfo":
            datGetPartnerInfo.Call();
        break;
        case "datGetPartnerInfo":
            OnSearch();
        break;
        case "dso_sel_cust_bal_date":
            MergeHeaderDate();
            dso_sel_cust_bal_sum.Call("SELECT");
        break;
        case "dso_sel_cust_bal_voucher":
            MergeHeaderVoucher();    
            dso_sel_cust_bal_sum.Call("SELECT");    
        break;
        case "dso_sel_cust_bal_sum":
            MergeHeaderSum();
        break;
    }
}

//-------------------------------------------------------------------------
function RowClick()
{
	var rows =0;
	var rownum =0;
	var colnum =0;
	var pk = 0;
	var status = "";
	var ls_arr = ""; 

	var ctrl = grdVoucher.GetGridControl();
	rows = ctrl.Rows;
	rows = rows - 2;
	rownum = ctrl.row-1;
	pk = grdVoucher.GetGridData(ctrl.row, 0);
		
//	for (i = 2; i < grdVoucher.rows; i++)
//	{
//		ls_arr = ls_arr + ' ' + grdVoucher.GetGridData(i, 0);
//	} 
	
	if (rownum > 0) 
	{
		var fpath = System.RootURL + '/standard/forms/60/08/60080050_popup.aspx?PK_ROW=' + pk + '&ROW=' + rownum + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=";
		var wWidth = 950;
		var wHeight = 600;
		var x = Math.round((screen.availWidth - wWidth)/2);
		var y = Math.round((screen.availHeight - wHeight)/2);

		var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +"lef="+ x +",top=" + y;
		this.name = "gfka00051";
		var object = System.OpenModal(fpath, wWidth, wHeight, features, window);
	}    
}

function GetRowPK(row_index){
    if((row_index < grdVoucher.rows) && (row_index > 0)){
        return grdVoucher.GetGridData(row_index, 0);
    }
    return -1;
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
                url = '/standard/reports/gf/ka/gfka00050_soCTTT_S31_DN.aspx?com=' + lstCompany.GetData() + '&sdate=' + txtFROM_DATE.GetData()+ '&edate=' + txtTO_DATE.GetData() + 
                    '&acc_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData();
                break;
            case 'S32-DN':
                url = '/standard/reports/gf/ka/gfka00050_soCTTT_S32_DN.aspx?com=' + lstCompany.GetData() + '&sdate=' + txtFROM_DATE.GetData()+ '&edate=' + txtTO_DATE.GetData() + 
                    '&acc_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData();
                break;
               case 'S31-DN_enclose':
                url = '/standard/reports/gf/ka/gfka00050_soCTTT_S31_DN_Enclose.aspx?com=' + lstCompany.GetData() + '&sdate=' + txtFROM_DATE.GetData()+ '&edate=' + txtTO_DATE.GetData() + 
                    '&acc_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData();
                break;
               case 'S32-DN_enclose':
                url = '/standard/reports/gf/ka/gfka00050_soCTTT_S32_DN_Enclose.aspx?com=' + lstCompany.GetData() + '&sdate=' + txtFROM_DATE.GetData()+ '&edate=' + txtTO_DATE.GetData() + 
                    '&acc_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData();
                break; 
                
        }    
        System.OpenTargetPage( System.RootURL+url , 'newform' )
    }

}
//-------------------------------------------------------------------------
</script>
<body style="margin:0; padding:0;">

<gw:data id="datGetAccountInfo" onreceive="OnDataReceive(this)"  > 
	<xml> 
		<dso type="process" user="acnt" parameter="0,1,2,3"   procedure = "ac_sel_60080060_popup_object" > 
			<input >
				<input bind="lstCompany" /> 
				<input bind="txtAC_PK" />
				<input bind="txtAC_CD" /> 
				<input bind="txtObj_Type1" /> 
			</input>
			<output>
				<output bind="txtAC_PK" />
				<output bind="txtAC_CD" />
				<output bind="txtAC_NM" /> 
			</output>
		</dso> 
	</xml> 
</gw:data> 

<gw:data id="datGetPartnerInfo" onreceive="OnDataReceive(this)"  > 
	<xml> 
		<dso type="process" user="acnt"  parameter="0,1,2,3"   procedure = "ac_sel_60080060_popup_object" > 
			<input >
				<input bind="lstCompany" /> 
				<input bind="txtTCO_BUSPARTNER_PK" />
				<input bind="txtTCO_BUSPARTNER_CD" /> 
				<input bind="txtObj_Type2" /> 
			</input>
			<output>
				<output bind="txtTCO_BUSPARTNER_PK" />
				<output bind="txtTCO_BUSPARTNER_CD" />
				<output bind="txtTCO_BUSPARTNER_NM" /> 
			</output>
		</dso> 
	</xml> 
</gw:data> 

<gw:data id="dso_sel_cust_bal_date" onreceive="OnDataReceive(this)">
<xml>
<dso type="grid" function="ac_SEL_60080060_CUST_BAL_DATE">
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
<dso type="grid" function="ac_SEL_60080060_CUST_BAL_VOUCH">
<input bind="grdDate">
<input bind="lstCOMPANY"/>
<input bind="txtFROM_DATE"/>
<input bind="txtTO_DATE"/>
<input bind="txtAC_PK"/>
<input bind="txtTCO_BUSPARTNER_PK"/>
<input bind="rdoSTATUS"/>
<input bind="lstCCY"/>

</input>
<output bind="grdVoucher"/>
</dso>
</xml>
</gw:data>

<gw:data id="dso_sel_cust_bal_sum" onreceive="OnDataReceive(this)">
<xml>
<dso type="grid" function="ac_SEL_60080060_CUST_BAL_SUM">
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
<!------------------------------------------------------------------------------------------------------->

<table width="100%" cellpadding="0" cellspacing="0" border="1">
    <tr>
        <td>
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td width="13%"></td>
                    <td width="14%"></td>
                    <td width="2%"></td>
                    <td width="14%"></td>
                    <td width="12%"></td>
                    <td width="12%"></td>
                    <td width="30%"></td>
                    <td width="3%"></td>
                </tr>  
                <tr>
                    <td align="right">Company</td>
                    <td colspan="3"><gw:list id="lstCompany" styles='width:100%'/></td>
                    <td align="right"><b>Account code&nbsp;</b></td>
                    <td>
                            <gw:textbox id="txtAC_PK" styles='display:none'></gw:textbox>
                            <gw:textbox id="txtAC_CD" styles='width:100%;' csstype="mandatory"/>
                     </td>
                     <td><gw:textbox id="txtAC_NM" styles='width:100%;' csstype="mandatory"/></td>
                    <td></td>
                </tr> 
                <tr>
                    <td align="right">Proposed Date</td>
                    <td align="left" ><gw:datebox id="txtFROM_DATE" styles='width:80%;'  lang="<%=Session("Lang")%>"/></td>
                    <td align="center">~</td>
                    <td align="right"><gw:datebox id="txtTO_DATE" styles='width:80%;'  lang="<%=Session("Lang")%>"/></td>
                    <td align="right"><b>Partner </b></td>
                    <td >
                        <gw:textbox id="txtTCO_BUSPARTNER_PK" styles='display:none'></gw:textbox>
                        <gw:textbox id="txtTCO_BUSPARTNER_CD" styles='width:100%;' csstype="mandatory"/>
                    </td>
                    <td><gw:textbox id="txtTCO_BUSPARTNER_NM" styles='width:100%;' csstype="mandatory"/></td>
                    <td align="center"><gw:imgBtn id="ibtnSearch" img="search"  alt="Search" onclick="OnSearch()" /></td>
                </tr>
                <tr>
                    <td align="right">Slip Status</td>
                    <td colspan="3">
                            <gw:radio id="rdoSTATUS" value="2" onchange="OnSearch()" >
                                    <span value="2">Confirmed&nbsp;</span>
                                    <span value="0">Approved&nbsp;</span>
                                    </gw:radio ></td>
                    <td align="right">Inquiry Type</td>
                    <td  colspan="2">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                        <td width="50%">
                                                <gw:radio id="rdoTYPE" value="2" onchange="OnDisplay()">
                                                        <span value="D">Date&nbsp;</span>
                                                        <span value="V">Vouchers</span>
                                                </gw:radio > 
                                        </td>
                                       <td width="20%" align="right">Currency &nbsp; &nbsp;</td>
                                       <td width="30%"><gw:list id="lstCCY" styles='width:100%' onchange="OnSearch()"/></td>
                                </tr>
                        </table>
                    </td>
                    <td></td>
                </tr> 
                <tr>
                    <td align="right">Amount Type</td>
                    <td colspan="3">
                            <gw:radio id="rdoAMOUNT" value="2" onchange="OnChangeAmountType()" >
                                    <span value="1">Trans & Book</span>
                                    <span value="2">Book</span>
                             </gw:radio >
                    </td>
                    <td align="right">Report &nbsp;</td>
                    <td colspan="2"><gw:list id="lstREPORT" styles='width:100%'/></td>
                    <td><gw:imgBtn id="ibtnReport" img="printer"   alt="Print Acct"    onclick="OnReport()" /></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td width="100%">
						<gw:grid   
						    id="grdDate"  
						    header="Date|_ACC_PK|AC_CD|AC_NM|CCY|OpeningBalance|DebitTransAmount|DebitBookAmount|CreditTransAmount|CreditBookAmount|Balance|_Cust PK|Cust ID|Cust Name"   
						    format  ="4|0|0|0|0|1|1|1|1|1|1|0|0|0"  
						    aligns  ="0|0|0|0|0|3|3|3|3|3|3|0|0|0"  
						    defaults="|||||||||||||"  
						    acceptNullDate="T"
						    editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
						    widths  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
						    styles  ="width:100%; height:280"   
						    sorting="T"/> 
							<gw:grid   
						    id="grdVoucher"  
						    header="PK|VoucherNo|Date|User|CCY|_acc_pk|ac_cd|ac nm|OpeningBalance|DebitTransAmount|DebitBookAmount|CreditTransAmount|CreditBookAmount|Balance|cust_pk|cust_id|Partner|Remark|Remark2|Item"   
						    format  ="0|0|4|0|0|0|0|0|1|1|1|1|1|1|0|0|0|0|0|0"  
						    aligns  ="0|0|0|0|0|0|0|0|3|3|3|3|3|3|0|0|0|0|0|0"  
						    defaults="||||||||||||||||||"  
						    acceptNullDate="T"
						    editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
						    widths  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
						    styles="width:100%; height:280"   
						    sorting="T"
							oncelldblclick ="RowClick()" /> 
					</td>
    </tr>
    <tr>
		<td width="100%">
			<gw:grid id='grdSum'
                header='CCY|OPEN_FBAL|OPEN_BAL|DR_FSUM|CR_FSUM|DR_SUM|CR_SUM|ACC_DR_FSUM|ACC_CR_FSUM|ACC_DR_SUM|ACC_CR_SUM|CLOSE_FBAL|CLOSE_BAL'
                format='0|1|1|1|1|1|1|1|1|1|1|1|1'
                aligns='0|3|3|3|3|3|3|3|3|3|3|3|3'
                defaults='||||||||||||'
                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0'
                widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                sorting='F'
                styles='width:100%; height:100'
                />
		</td>
	</tr>
</table>

<gw:textbox id="txtSUM"   style="display:none"/>
<gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
	<gw:textbox id="txtObj_Type1"  styles="display:none"  text="ACCOUNT_CODE" />
	<gw:textbox id="txtObj_Type2"  styles="display:none"  text="PARTNER"  />
<!---------------------------------------------------------------------------------------------------->
</body>
</html>