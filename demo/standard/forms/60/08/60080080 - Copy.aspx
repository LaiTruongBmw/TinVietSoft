<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Monthly Partner Balance</title>
    
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">

function BodyInit()
{

    //txtAC_CD.SetEnable(false);
    txtAC_NM.SetEnable(false);
    txtTCO_BUSPARTNER_CD.SetEnable(false);
    txtTCO_BUSPARTNER_NM.SetEnable(false);
    BindingDataList();
    lstCCY.SetDataText("");
    rdoAMOUNT.value = "2";
    rdoSTATUS.value = "2";
    var ls_bookccy = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
    lstBookCcy.SetDataText(ls_bookccy);  
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
    txtFROM_DATE.SetDataText(fDate);
 
    MergeHeaderPartner();
    MergeHeaderSum();
    MergeHeaderPartnerBook(); 
    MergeHeaderSumBook();
    System.Translate(document); 

    txtUser_Pk.text = "<%=Session("USER_PK")%>";
    dso_getCompany.Call();
}

function BindingDataList()
{
    var ls_comp    = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_ccy       = "<%=CtlLib.SetListDataFUNC("SELECT AC_F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>||Select All";
    var ls_search   = "<%=CtlLib.SetListDataFUNC("SELECT 'P|Period|M|Month' FROM DUAL")%>";
    var ls_report   = "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK003' ORDER BY D.DEF_YN DESC, D.ORD ")%>";
    var ls_partner_type = "<%=CtlLib.SetListDataFUNC("SELECT AC_F_COMMONCODE('CODC0010','','') FROM DUAL")%>|ALL|--Select All--"; 
    var ls_data1     = "<%=CtlLib.SetListDataFUNC("SELECT AC_A_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
    lstLanguage.SetDataText(ls_data1);
    lstCOMPANY.SetDataText(ls_comp);
    lstCCY.SetDataText(ls_ccy);
    lstLanguage.SetDataText('VIE');
    lstREPORT.SetDataText(ls_report);
    lstSEARCH.SetDataText(ls_search);
    lstPartnerType.SetDataText(ls_partner_type);
	lstPartnerType.value = 'ALL';
}
function MergeHeaderPartner()
{
		var fg=grdPartner.GetGridControl();
		if(fg.Rows < 2)
		{
		   grdPartner.AddRow();     
		}
		fg.FrozenCols = 6;
        fg.FixedRows = 2;
		fg.MergeRow(0) = true;
		
		fg.MergeCells = 5;
		fg.MergeCol(0) = true;//TCO_BUSPARTNER_PK
		fg.MergeCol(1) = true;//TAC_ABACCTCODE_PK
		fg.Cell(0, 0, 2, 0, 3) = "Partner";
        fg.Cell(0, 1, 2, 1, 2) = "ID";
        fg.Cell(0, 1, 3, 1, 3) = "Name";
        fg.MergeCol(4) = true;//ACCD
        fg.Cell(0, 0, 4, 1, 4) = "Acc. Code";
        fg.MergeCol(5) = true;//
        fg.Cell(0, 0, 5, 1, 5) = "Ccy";
        
        fg.Cell(0, 0, 6, 0, 7) = "Opening Balance";
        fg.Cell(0, 1, 6, 1, 6) = "Transaction";
        fg.Cell(0, 1, 7, 1, 7) = "Book";
        
        fg.Cell(0, 0, 8, 0, 9) = "Transaction";
        fg.Cell(0, 1, 8, 1, 8) = "Debit";
        fg.Cell(0, 1, 9, 1, 9) = "Credit";
        
        fg.Cell(0, 0, 10, 0, 11) = "Books";
        fg.Cell(0, 1, 10, 1, 10) = "Debit";
        fg.Cell(0, 1, 11, 1, 11) = "Credit";
        
        fg.Cell(0, 0, 12, 0, 13) = "Acc. Transaction";
        fg.Cell(0, 1, 12, 1, 12) = "Debit";
        fg.Cell(0, 1, 13, 1, 13) = "Credit";
        
        fg.Cell(0, 0, 14, 0, 15) = "Acc. Book";
        fg.Cell(0, 1, 14, 1, 14) = "Debit";
        fg.Cell(0, 1, 15, 1, 15) = "Credit";
        
        fg.Cell(0, 0, 16, 0, 17) = "Closing Balance";
        fg.Cell(0, 1, 16, 1, 16) = "Transaction";
        fg.Cell(0, 1, 17, 1, 17) = "Book";
        
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		fg.ColWidth(0) =0;
		fg.ColWidth(1) =0;
		fg.ColWidth(2) =1000;
		fg.ColWidth(3) =3000;
		fg.ColWidth(4) =0;
		fg.ColWidth(5) =500;//CCY
		
		fg.ColWidth(6)=1700;
		fg.ColWidth(7)=1700;
		fg.ColWidth(8)=1700;
		fg.ColWidth(9)=1700;
		fg.ColWidth(10)=1700;
		fg.ColWidth(11)=1700;
		fg.ColWidth(12)=1700;
		fg.ColWidth(13)=1700;
		fg.ColWidth(14)=1700;
		fg.ColWidth(15)=1700;
		fg.ColWidth(16)=1700;
		fg.ColWidth(17)=1700;
		
		
		var AmountType = rdoAMOUNT.GetData();
		if (AmountType == '2')
		{   
			fg.ColWidth(6)=0;
			fg.ColWidth(8)=0;
			fg.ColWidth(9)=0;
			fg.ColWidth(12)=0;
			fg.ColWidth(13)=0;
			fg.ColWidth(16)=0;
		}
		else
		{
		    fg.ColWidth(6)=1700;
			fg.ColWidth(8)=1700;
			fg.ColWidth(9)=1700;
			fg.ColWidth(12)=1700;
			fg.ColWidth(13)=1700;
			fg.ColWidth(16)=1700;
		}
		
		if(lstBookCcy.GetData() == "VND")
        {
            fg.ColFormat(7) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(10) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(11) = "#,###,###,###,###,###,###R";
            fg.ColFormat(14) = "#,###,###,###,###,###,###R";
            fg.ColFormat(15) = "#,###,###,###,###,###,###R";
            fg.ColFormat(17) = "#,###,###,###,###,###,###R";  
        }
        else
        {
            //Book
            fg.ColFormat(7) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(10) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(11) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(14) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(15) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(17) = "#,###,###,###,###,###,###.##R";
        }
        fg.ColFormat(6) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(8) = "#,###,###,###,###,###,###.##R"; 
        fg.ColFormat(9) = "#,###,###,###,###,###,###.##R";
        fg.ColFormat(12) = "#,###,###,###,###,###,###.##R";
        fg.ColFormat(13) = "#,###,###,###,###,###,###.##R";
        fg.ColFormat(16) = "#,###,###,###,###,###,###.##R";
}

function MergeHeaderPartnerBook()
{
		var fg=grdPartnerBook.GetGridControl();
		if(fg.Rows < 2)
		{
		   grdPartnerBook.AddRow();     
		}
		fg.FrozenCols = 4;
        fg.FixedRows = 2;
		fg.MergeRow(0) = true;
		
		fg.MergeCells = 5;
		fg.MergeCol(0) = true;//TCO_BUSPARTNER_PK
		fg.MergeCol(1) = true;//TAC_ABACCTCODE_PK
		fg.Cell(0, 0, 2, 0, 3) = "Partner";
        fg.Cell(0, 1, 2, 1, 2) = "ID";
        fg.Cell(0, 1, 3, 1, 3) = "Name";
        fg.MergeCol(4) = true;//ACCD
        fg.Cell(0, 0, 4, 1, 4) = "Acc. Code";

        
        fg.Cell(0, 0, 5, 0, 5) = "Opening Balance";
        fg.Cell(0, 1, 5, 1, 5) = "Book";
        
        fg.Cell(0, 0, 6, 0, 7) = "Books";
        fg.Cell(0, 1, 6, 1, 6) = "Debit";
        fg.Cell(0, 1, 7, 1, 7) = "Credit";
        
        fg.Cell(0, 0, 8, 0, 9) = "Acc. Book";
        fg.Cell(0, 1, 8, 1, 8) = "Debit";
        fg.Cell(0, 1, 9, 1, 9) = "Credit";
        
        fg.Cell(0, 0, 10, 0, 10) = "Closing Balance";
        fg.Cell(0, 1, 11, 1, 11) = "Book";
        
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		fg.ColWidth(0) =0;
		fg.ColWidth(1) =0;
		fg.ColWidth(2) =1000;
		fg.ColWidth(3) =3000;
		fg.ColWidth(4) =0;
		fg.ColWidth(5)=1700;
		fg.ColWidth(6)=1700;
		fg.ColWidth(7)=1700;
		fg.ColWidth(8)=1700;
		fg.ColWidth(9)=1700;
		fg.ColWidth(10)=1700;
		if(lstBookCcy.GetData() == "VND")
        {
            fg.ColFormat(5) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(6) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(7) = "#,###,###,###,###,###,###R";
            fg.ColFormat(8) = "#,###,###,###,###,###,###R";
            fg.ColFormat(9) = "#,###,###,###,###,###,###R";
            fg.ColFormat(10) = "#,###,###,###,###,###,###R";  
        }
        else
        {
            //Book
            fg.ColFormat(5) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(6) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(7) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(8) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(9) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(10) = "#,###,###,###,###,###,###.##R";
        }
}

function MergeHeaderSum()
{
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
        fg.Cell(0, 0, 1, 0, 2) = "Số đầu kỳ";
        fg.Cell(0, 1, 1, 1, 1) = "Phát sinh";
        fg.Cell(0, 1, 2, 1, 2) = "Ghi sổ";
        
        fg.Cell(0, 0, 3, 0, 4) = "Phát sinh";
        fg.Cell(0, 1, 3, 1, 3) = "Nợ";
        fg.Cell(0, 1, 4, 1, 4) = "Có";
        
        fg.Cell(0, 0, 5, 0, 6) = "Ghi sổ";
        fg.Cell(0, 1, 5, 1, 5) = "Nợ";
        fg.Cell(0, 1, 6, 1, 6) = "Có";
        
        fg.Cell(0, 0, 7, 0, 8) = "Lũy kế phát sinh";
        fg.Cell(0, 1, 7, 1, 7) = "Nợ";
        fg.Cell(0, 1, 8, 1, 8) = "Có";
        
        fg.Cell(0, 0, 9, 0, 10) = "Lũy kế ghi sổ";
        fg.Cell(0, 1, 9, 1, 9) = "Nợ";
        fg.Cell(0, 1, 10, 1, 10) = "Có";
        
        fg.Cell(0, 0, 11, 0, 12) = "Số cuối kỳ";
        fg.Cell(0, 1, 11, 1, 11) = "Phát sinh";
        fg.Cell(0, 1, 12, 1, 12) = "Ghi sổ";
        
		fg.ColWidth(0)=700;
		fg.ColWidth(1)=2000;
		fg.ColWidth(2)=2000;
		fg.ColWidth(3)=2000;
		fg.ColWidth(4)=2000;
		fg.ColWidth(5)=2000;
		fg.ColWidth(6)=2000;
		fg.ColWidth(7)=2000;
		fg.ColWidth(8)=2000;
		fg.ColWidth(9)=2000;
		fg.ColWidth(10)=2000;
		fg.ColWidth(11)=2000;
		fg.ColWidth(12)=2000;
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		var AmountType = rdoAMOUNT.GetData();
		if (AmountType == '2')
		{   
			fg.ColWidth(1)=0;
			fg.ColWidth(3)=0;
			fg.ColWidth(4)=0;
			fg.ColWidth(7)=0;
			fg.ColWidth(8)=0;
			fg.ColWidth(11)=0;
		}
		else
		{
		    fg.ColWidth(1)=2000;
			fg.ColWidth(3)=2000;
			fg.ColWidth(4)=2000;
			fg.ColWidth(7)=2000;
			fg.ColWidth(8)=2000;
			fg.ColWidth(11)=2000;
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
function MergeHeaderSumBook()
{
		var fg=grdSumBook.GetGridControl();
		if(fg.Rows < 2)
		{
		   grdSumBook.AddRow();     
		}
        fg.FixedRows = 2;
        fg.MergeCells = 5;
		fg.MergeRow(0) = true;

        fg.Cell(0, 0, 0, 0, 0) = "Số đầu kỳ";
        fg.Cell(0, 1, 0, 1, 0) = "Ghi sổ";
        
        fg.Cell(0, 0, 1, 0, 2) = "Ghi sổ";
        fg.Cell(0, 1, 1, 1, 1) = "Nợ";
        fg.Cell(0, 1, 2, 1, 2) = "Có";
        
        fg.Cell(0, 0, 3, 0, 4) = "Lũy kế Ghi sổ";
        fg.Cell(0, 1, 3, 1, 3) = "Nợ";
        fg.Cell(0, 1, 4, 1, 4) = "Có";
        
        fg.Cell(0, 0, 5, 0, 5) = "Số cuối kỳ";
        fg.Cell(0, 1, 5, 1, 5) = "Ghi sổ";
        
		fg.ColWidth(0)=5700;
		fg.ColWidth(1)=1700;
		fg.ColWidth(2)=1700;
		fg.ColWidth(3)=1700;
		fg.ColWidth(4)=1700;
		fg.ColWidth(5)=1700;
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 0, 0, 1,fg.Cols - 1) = true; 
		
		if(lstBookCcy.GetData() == "VND")
        {
            fg.ColFormat(0) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(1) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(2) = "#,###,###,###,###,###,###R";
            fg.ColFormat(3) = "#,###,###,###,###,###,###R";
            fg.ColFormat(4) = "#,###,###,###,###,###,###R";
            fg.ColFormat(5) = "#,###,###,###,###,###,###R";  
        }
        else
        {
            //Book
            fg.ColFormat(0) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(1) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(2) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(3) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(4) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(5) = "#,###,###,###,###,###,###.##R";
        }
       
}	
function OnChangeAmountType()
{
	MergeHeaderPartner();
	MergeHeaderSum();
}

function GetAccount()
{
    var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCOMPANY.value+'' + "&dsqlid=ac_sel_60080010_acct_partner";
    var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
    if ((object != null) &&(object[0]!="0"))
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
    var object = System.OpenModal( path ,800 , 620 , 'resizable:yes;status:yes');
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
    if (tabMain.GetCurrentPageNo()=="0" || tabMain.GetCurrentPageNo()=="1")
    {
        if((txtAC_PK.text=="") &&(txtTCO_BUSPARTNER_PK.text==""))
       {
            alert("Please select an account code or partner!");
            return;
       } 
    }   
   
   if (tabMain.GetCurrentPageNo()=="0")
   { 
        dso_sel_monthly_cust_bal.Call("SELECT");
   }
   else if (tabMain.GetCurrentPageNo()=="1")
   {
        dso_sel_monthly_cust_bal2.Call("SELECT");
   }
   else if (tabMain.GetCurrentPageNo()=="2")
   {
        dso_sel_monthly_cust_bal3.Call("SELECT");
   } 
   else if (tabMain.GetCurrentPageNo()=="3")
   {
        dso_sel_monthly_cust_bal4.Call("SELECT");
   } 
   else
   {
        dso_sel_monthly_cust_bal5.Call("SELECT");
   } 
}


function loadDateOpeningBalance(){
	var i,liRow;
	var llData;
	liRow = grdPartner.rows
	for(i=3;i<liRow;i++){
		grdPartner.SetGridText(i,2,grdPartner.GetGridData(i-1,8));
	}
}


function OnDataReceive(pObject)
{
    switch(pObject.id)
    {
        case "dso_sel_monthly_cust_bal":
            MergeHeaderPartner();
            if(txtAC_PK.text=="")
            {
                grdPartner.GetGridControl().ColWidth(4) =800;
            }
            else
            {
                grdPartner.GetGridControl().ColWidth(4) =0;
            }
            dso_sel_cust_bal_sum.Call("SELECT");
        break;
        
        case "dso_sel_cust_bal_sum":
            MergeHeaderSum();
        break;
        
        case "dso_sel_monthly_cust_bal2":
            MergeHeaderPartnerBook();
             if(txtAC_PK.text=="")
            {
                grdPartnerBook.GetGridControl().ColWidth(4) =800;
            }
            else
            {
                grdPartnerBook.GetGridControl().ColWidth(4) =0;
            }
            dso_sel_cust_bal_sum2.Call("SELECT");
        break;
        
        case "dso_sel_cust_bal_sum2":
            MergeHeaderSumBook();
        break;
        case "dso_sel_monthly_cust_bal4":
            dso_sel_monthly_cust_bal4_sum.Call("SELECT");
        break;
        
        case "dso_sel_monthly_cust_bal5":
            dso_sel_cust_bal_sum5.Call("SELECT");
        break;
    }
}

/*function OnReport()
{
   if(txtAC_PK.text=="")
   {
        alert("Please choose account code");
        return;
   } 
   var url="";
    if(confirm("Are you sure you want to report ?" ))
    {
            switch (lstREPORT.value)
            {
                case 'AS':
                        url = '/standard/reports/gf/ka/gfka60110060_rpt.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                break;
               case 'TB':
                        url = '/standard/reports/gf/ka/gfka60110060_ccy.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                break; 
               case 'OB':
                        url = '/standard/reports/gf/ka/gfka60110060_book.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                break; 
                  }
        System.OpenTargetPage( System.RootURL+url , 'newform' );
    }

}*/
function OnReport(lang)
{
switch(lang)
    {
        case "VIE":
                 if (tabMain.GetCurrentPageNo()!="2")
                 { 
                    if(txtAC_PK.text=="")
                    {
                        alert("Please choose account code");
                        return;
                    } 
                    switch (lstREPORT.value)
                    {
                        case 'AS':
                            url = '/standard/reports/gf/ka/gfka60110060_rpt.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                            System.OpenTargetPage( System.RootURL+url , 'newform' );
                        break;
                        case 'TB':
                            url = '/standard/reports/gf/ka/gfka60110060_ccy.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                            System.OpenTargetPage( System.RootURL+url , 'newform' );
                        break; 
                        case 'OB':
                            url = '/standard/reports/gf/ka/gfka60110060_book_vie.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                            System.OpenTargetPage( System.RootURL+url , 'newform' );
                        break; 
                    }
                    
                 }  
                 else
                 {
                    switch (lstREPORT.value)
                    {
                        case 'AL':
                            url = '/standard/reports/gf/ka/gfka60110060_book_accd_vie.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_CD.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                            System.OpenTargetPage( System.RootURL+url , 'newform' );
                        break; 
                        case 'AS':
                            alert("Chọn report in tất cả tài khoản");
                        break;
                        case 'TB':
                            alert("Chọn report in tất cả tài khoản");
                        break; 
                        case 'OB':
                            alert("Chọn report in tất cả tài khoản");
                        break; 
                    }
                 } 
    break;
    case "ENG":
                if(txtAC_PK.text=="")
                {
                    alert("Please choose account code");
                    return;
                } 

                switch (lstREPORT.value)
                {
                    case 'AS':
                        url = '/standard/reports/gf/ka/gfka60110060_rpt.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                    break;
                    case 'TB':
                        url = '/standard/reports/gf/ka/gfka60110060_ccy.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                    break; 
                    case 'OB':
                        url = '/standard/reports/gf/ka/gfka60110060_book.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                    break; 
                    case 'AL':
                        url = '/standard/reports/gf/ka/gfka60110060_book_accd_vie.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                    break; 
                }
                System.OpenTargetPage( System.RootURL+url , 'newform' );
               
    break;
 }
}
function OnDisplayMonth()
{
    
}

function OnShowDetail()
{
    var ctrl = grdPartner.GetGridControl();
    if (ctrl.row >1)
    {
        //var comp_pk     = lstCOMPANY.text;
        //var from_date   = txtFROM_DATE.text;
        //var to_date     = txtTO_DATE.text;
        //var acc_pk      = txtAC_PK.text;
        var cust_pk     = grdPartner.GetGridData(ctrl.row,0);
        var cust_id     = grdPartner.GetGridData(ctrl.row,2);
        var cust_nm     = grdPartner.GetGridData(ctrl.row,3);
        var status      = rdoSTATUS.value;
        var ccy         = grdPartner.GetGridData(ctrl.row,5);
        var acc_pk  = txtAC_PK.text;
        var acc_cd =  txtAC_CD.text;
        if (acc_pk=="")
        {
            acc_cd = grdPartner.GetGridData(ctrl.row,4);
        }
        var fpath = System.RootURL + '/standard/forms/60/08/60080080_popup.aspx?comp_pk=' + lstCOMPANY.value + '&from_date=' + txtFROM_DATE.value + '&to_date=' + txtTO_DATE.value + "&acc_pk=" + acc_pk + '&acc_cd=' + acc_cd +'&acc_nm=' + txtAC_NM.text + "&cust_pk=" + cust_pk + "&cust_id=" + cust_id + "&cust_nm=" + cust_nm + "&status=" + rdoSTATUS.value + "&ccy=" + ccy ;
        //alert(fpath);
        var wWidth = 1000;
        var wHeight = 500;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +"lef="+ x +",top=" + y;
        var object = System.OpenModal(fpath, wWidth, wHeight, features);
    }
    
}

function OnChangeTab()
{
}

function OnShowDetailBook()
{
    var ctrl = grdPartnerBook.GetGridControl();
    if (ctrl.row >1)
    {
        //var comp_pk     = lstCOMPANY.text;
        //var from_date   = txtFROM_DATE.text;
        //var to_date     = txtTO_DATE.text;
        //var acc_pk      = txtAC_PK.text;
        var cust_pk     = grdPartnerBook.GetGridData(ctrl.row,0);
        var cust_id     = grdPartnerBook.GetGridData(ctrl.row,2);
        var cust_nm     = grdPartnerBook.GetGridData(ctrl.row,3);
        var status      = rdoSTATUS.value;
        var ccy         = grdPartnerBook.GetGridData(ctrl.row,5);
        var acc_pk  = txtAC_PK.text;
        var acc_cd =  txtAC_CD.text;
        if (acc_pk=="")
        {
            acc_cd = grdPartnerBook.GetGridData(ctrl.row,4);
        }
        var fpath = System.RootURL + '/standard/forms/60/08/60080080_popup.aspx?comp_pk=' + lstCOMPANY.value + '&from_date=' + txtFROM_DATE.value + '&to_date=' + txtTO_DATE.value + "&acc_pk=" + acc_pk + '&acc_cd=' + acc_cd +'&acc_nm=' + txtAC_NM.text + "&cust_pk=" + cust_pk + "&cust_id=" + cust_id + "&cust_nm=" + cust_nm + "&status=" + rdoSTATUS.value + "&ccy=";
        //alert(fpath);
        var wWidth = 1000;
        var wHeight = 500;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +"lef="+ x +",top=" + y;
        var object = System.OpenModal(fpath, wWidth, wHeight, features);
    }
}
</script>
<body style="margin:0; padding:0;">
    <gw:data id="dso_sel_monthly_cust_bal" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080080_mon_cust_bal">
                <input bind="grdPartner">
                    <input bind="lstCOMPANY"/>
                    <input bind="txtFROM_DATE"/>
                    <input bind="txtTO_DATE"/>
                    <input bind="txtAC_PK"/>
                    <input bind="txtTCO_BUSPARTNER_PK"/>
                    <input bind="rdoSTATUS"/>
                    <input bind="lstCCY"/>
                    <input bind="lstPartnerType"/>
                </input>
                <output bind="grdPartner"/>
            </dso>
        </xml>
    </gw:data>
    
    
    <gw:data id="dso_sel_cust_bal_sum" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080080_mon_cust_bal_s">
                  <input bind="grdSum">
                    <input bind="lstCOMPANY"/>
                    <input bind="txtFROM_DATE"/>
                    <input bind="txtTO_DATE"/>
                    <input bind="txtAC_PK"/>
                    <input bind="txtTCO_BUSPARTNER_PK"/>
                    <input bind="rdoSTATUS"/>
                    <input bind="lstCCY"/>
                    <input bind="lstPartnerType"/>
                </input>
                <output bind="grdSum"/>
            </dso>
        </xml>
    </gw:data>
   
   <gw:data id="dso_sel_monthly_cust_bal2" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080080_mo_cust_bal2">
                <input bind="grdPartnerBook">
                    <input bind="lstCOMPANY"/>
                    <input bind="txtFROM_DATE"/>
                    <input bind="txtTO_DATE"/>
                    <input bind="txtAC_PK"/>
                    <input bind="txtTCO_BUSPARTNER_PK"/>
                    <input bind="rdoSTATUS"/>
                    <input bind="lstCCY"/>
                    <input bind="lstPartnerType"/>
                </input>
                <output bind="grdPartnerBook"/>
            </dso>
        </xml>
    </gw:data>
    
    
    <gw:data id="dso_sel_cust_bal_sum2" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080080_mo_cust_bal_s2">
                  <input bind="grdSumBook">
                    <input bind="lstCOMPANY"/>
                    <input bind="txtFROM_DATE"/>
                    <input bind="txtTO_DATE"/>
                    <input bind="txtAC_PK"/>
                    <input bind="txtTCO_BUSPARTNER_PK"/>
                    <input bind="rdoSTATUS"/>
                    <input bind="lstCCY"/>
                    <input bind="lstPartnerType"/>
                </input>
                <output bind="grdSumBook"/>
            </dso>
        </xml>
    </gw:data> 
    
    <gw:data id="dso_sel_monthly_cust_bal3" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080080_mo_cust_bal3">
                <input bind="grdPartnerACCD">
                    <input bind="lstCOMPANY"/>
                    <input bind="txtFROM_DATE"/>
                    <input bind="txtTO_DATE"/>
                    <input bind="txtAC_CD"/>
                    <input bind="txtTCO_BUSPARTNER_PK"/>
                    <input bind="rdoSTATUS"/>
                    <input bind="lstPartnerType"/>
                    
                </input>
                <output bind="grdPartnerACCD"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_sel_monthly_cust_bal4" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080080_mo_cust_bal4">
                <input bind="grdPartnerAC">
                    <input bind="lstCOMPANY"/>
                    <input bind="txtFROM_DATE"/>
                    <input bind="txtTO_DATE"/>
                    <input bind="txtAC_CD"/>
                    <input bind="txtTCO_BUSPARTNER_PK"/>
                    <input bind="rdoSTATUS"/>
                    <input bind="lstPartnerType"/>
                    
                </input>
                <output bind="grdPartnerAC"/>
            </dso>
        </xml>
    </gw:data>
     <gw:data id="dso_sel_monthly_cust_bal4_sum" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080080_mo_cust_bal_s4">
                <input bind="grdSumAC">
                    <input bind="lstCOMPANY"/>
                    <input bind="txtFROM_DATE"/>
                    <input bind="txtTO_DATE"/>
                    <input bind="txtAC_CD"/>
                    <input bind="txtTCO_BUSPARTNER_PK"/>
                    <input bind="rdoSTATUS"/>
                    <input bind="lstPartnerType"/>
                    
                </input>
                <output bind="grdSumAC"/>
            </dso>
        </xml>
    </gw:data>
    
    
    <gw:data id="dso_sel_monthly_cust_bal5" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080080_mo_cust_bal5">
                <input bind="grdPartnerTR">
                    <input bind="lstCOMPANY"/>
                    <input bind="txtFROM_DATE"/>
                    <input bind="txtTO_DATE"/>
                    <input bind="txtAC_PK"/>
                    <input bind="txtTCO_BUSPARTNER_PK"/>
                    <input bind="rdoSTATUS"/>
                    <input bind="lstCCY"/>
                    <input bind="lstPartnerType"/>
                </input>
                <output bind="grdPartnerTR"/>
            </dso>
        </xml>
    </gw:data>
    
    <gw:data id="dso_sel_cust_bal_sum5" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080080_mo_cust_bal_s5">
                  <input bind="grdSumTR">
                    <input bind="lstCOMPANY"/>
                    <input bind="txtFROM_DATE"/>
                    <input bind="txtTO_DATE"/>
                    <input bind="txtAC_PK"/>
                    <input bind="txtTCO_BUSPARTNER_PK"/>
                    <input bind="rdoSTATUS"/>
                    <input bind="lstCCY"/>
                    <input bind="lstPartnerType"/>
                </input>
                <output bind="grdSumTR"/>
            </dso>
        </xml>
    </gw:data>
   
<!------------------------------------------------------------------------------------------------------->
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
<table width="100%" cellpadding="0" cellspacing="0" border="1">
    <tr>
        <td>
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td width="10%"></td>
                    <td width="9%"></td>
                    <td width="3%"></td>
                    <td width="9%"></td>
                    
                    <td width="11%"></td>
                    <td width="15%"></td>
                    <td width="9%"></td>
                    <td width="17%"></td>
                    <td width="7%"></td>
                    <td width="10%"></td>
                </tr>  
                <tr>
                    <td align="right">Company</td>
                    <td colspan="3"><gw:list id="lstCOMPANY" styles='width:100%'/></td>
                    <td align="right"><b><a title="Click here to show Account" onclick="GetAccount()" href="#tips" >Account code</a></b></td>
                    <td colspan="3">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="95%"><gw:textbox id="txtAC_PK" styles='display:none'></gw:textbox>
                                                <gw:textbox id="txtAC_CD" styles='width:30%;' csstype="mandatory" onenterkey="OnSearch()"/>
                                                <gw:textbox id="txtAC_NM" styles='width:70%;' csstype="mandatory"/></td>
                                <td><gw:imgBtn id="ibtnAccReset" img="reset"  alt="reset acc" onclick="resetAcc()" /></td>
                            </tr>
                        </table>
                    </td>
                    
                    <td align="right" width="6%">Language</td>
                    <td  ><gw:list id="lstLanguage" styles="width:100%;" ></gw:list></td>
                    <td align="center"><gw:imgBtn id="ibtnSearch" img="search"  alt="Search" onclick="OnSearch()" /></td>
                </tr> 
                <tr>
                    <td align="right">Proposed Date</td>
                    <td align="left" ><gw:datebox id="txtFROM_DATE" styles='width:100%;'  lang="<%=Session("Lang")%>"/></td>
                    <td align="center">~</td>
                    <td align="right"><gw:datebox id="txtTO_DATE" styles='width:100%;'  lang="<%=Session("Lang")%>"/></td>
                    <td align="right"><a title="Click here to show customer" onclick="GetPartner()" href="#tips" ><b>Partner&nbsp;</b></a></td>
                    <td colspan="3">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="95%"><gw:textbox id="txtTCO_BUSPARTNER_PK" styles='display:none'></gw:textbox>
                                                <gw:textbox id="txtTCO_BUSPARTNER_CD" styles='width:30%;'csstype="mandatory"/>
                                                <gw:textbox id="txtTCO_BUSPARTNER_NM" styles='width:70%;' csstype="mandatory"/></td>
                                <td><gw:imgBtn id="ibtnCustReset" img="reset"  alt="reset partner" onclick="resetPartner()" /></td>
                            </tr>
                        </table>
                    </td>
                   <td align="right">Currency</td>
                    <td><gw:list id="lstCCY" styles='width:100%'/></td>
                    <td align="left"><gw:imgBtn id="ibtnReport" img="printer"   alt="Print Acct"    onclick="OnReport(lstLanguage.GetData())" /></td>
                </tr>
                <tr>
                    <td align="right">Slip Status</td>
                    <td colspan="3"><gw:radio id="rdoSTATUS" value="2" onchange="OnSearch()" >
                                    <span value="2">Confirmed</span>
                                    <span value="0">Approved</span>
                                    </gw:radio ></td>
                    <td align="right">Amount Type</td>
                    <td colspan="2">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="75%">
                                <gw:radio id="rdoAMOUNT" value="2" onchange="OnChangeAmountType()" >
                                    <span value="1">Trans & Book</span>
                                    <span value="2">Book</span>
                                    </gw:radio >
                                </td>
                                <td align="right" width="25%">Report</td>
                            </tr>
                        </table>
                    </td>
                    <td><gw:list id="lstREPORT" styles='width:100%'/></td>
                    <td align="right">Partner Type</td>
                    <td><gw:list id="lstPartnerType" styles='width:100%'/></td>
                </tr> 
            </table>
        </td>
    </tr>
   </table> 
   <gw:tab id="tabMain" border=1 style="width:100%;" onpageactivate="" onclick ="OnChangeTab()"> 
    <form name="Transaction Amount" id="form1" >
	        <table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
					
					<gw:grid id='grdPartner'
                            header='_TCO_BUSPARTNER_PK|_TAC_ABACCTCODE_PK|PARTNER_ID|PARTNER_NAME|ACCD|CCY|OPEN_FBAL|OPEN_BAL|DR_FSUM|CR_FSUM|DR_SUM|CR_SUM|ACC_DR_FSUM|ACC_CR_FSUM|ACC_DR_SUM|ACC_CR_SUM|CLOSE_FBAL|CLOSE_BAL'
                            format='0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1'
                            aligns='0|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3'
                            defaults='|||||||||||||||||'
                            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                            widths='0|0|1005|1005|1005|1005|1005|1005|1005|1005|1005|1005|1005|1005|1005|1005|1005|1005'
                            styles  ="width:100%; height:270"   
                            sorting="T"
                            oncelldblclick ="OnShowDetail()"/> 

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
                            styles='width:100%; height:80'
                            />
		            </td>
	            </tr>
            </table>
            </form>
        <form name="Booking Amount" id="form2" >
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
					<gw:grid id='grdPartnerBook'
                            header='_TCO_BUSPARTNER_PK|_TAC_ABACCTCODE_PK|PARTNER_ID|PARTNER_NAME|ACCD|OPEN_BAL|DR_SUM|CR_SUM|ACC_DR_SUM|ACC_CR_SUM|CLOSE_BAL'
                            format='0|0|0|0|0|0|0|0|0|0|0'
                            aligns='0|0|0|0|0|3|3|3|3|3|3'
                            defaults='||||||||||'
                            editcol='1|1|1|1|1|1|1|1|1|1|1'
                            widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                            styles  ="width:100%; height:270"   
                            sorting="T"
                            oncelldblclick ="OnShowDetailBook()"/> 

					</td>
				</tr>
                <tr>
		            <td width="100%">
		            <gw:grid id='grdSumBook'
                        header='OPEN_BAL|DR_SUM|CR_SUM|ACC_DR_SUM|ACC_CR_SUM|CLOSE_BAL'
                        format='0|0|0|0|0|0'
                        aligns='3|3|3|3|3|3'
                        defaults='|||||'
                        editcol='0|0|0|0|0|0'
                        widths='1000|1000|1000|1000|1000|1000'
                        sorting='F'
                        styles='width:100%; height:80'
                        />
		            </td>
	            </tr>
            </table>
        </form>
        
        
        <form name="Account Code & Customer" id="form3" >
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
					<gw:grid id='grdPartnerACCD'
                            header='_TCO_BUSPARTNER_PK|_TAC_ABACCTCODE_PK|Partner ID|Partner Name|Account Code|Openning DR Balance|Openning CR Balance|Debit Amount|Credit Amount|Acc. Debit Amount|Acc. Credit Amount|Closing DR Balance|Closing CR Balance'
                            format='0|0|0|0|0|1|1|1|1|1|1|1|1'
                            aligns='0|0|0|0|0|3|3|3|3|3|3|3|3'
                            defaults='||||||||||||||'
                            editcol='1|1|1|1|1|1|1|1|1|1|1|1|1'
                            widths='0|0|1000|3000|1500|1800|1800|1800|1800|1800|1800|1800|1800'
                            styles  ="width:100%; height:270"   
                            sorting="T"
                            oncelldblclick ="OnShowDetailBook()"/> 

					</td>
				</tr>
                
            </table>
        </form>
        
        <form name="Account Code" id="form4" >
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
					<gw:grid id='grdPartnerAC'
                            header='_TCO_BUSPARTNER_PK|_TAC_ABACCTCODE_PK|_Partner ID|_Partner Name|Account Code|Openning DR Balance|Openning CR Balance|Debit Amount|Credit Amount|Acc. Debit Amount|Acc. Credit Amount|Closing DR Balance|Closing CR Balance'
                            format='0|0|0|0|0|1|1|1|1|1|1|1|1'
                            aligns='0|0|0|0|0|3|3|3|3|3|3|3|3'
                            defaults='||||||||||||||'
                            editcol='1|1|1|1|1|1|1|1|1|1|1|1|1'
                            widths='0|0|1000|3000|1500|1800|1800|1800|1800|1800|1800|1800|1800'
                            styles  ="width:100%; height:270"   
                            sorting="T"
                            oncelldblclick ="OnShowDetailBook()"/> 

					</td>
				</tr>
				<tr>
		            <td width="100%">
		                <gw:grid id='grdSumAC'
                            header='_CCY|Openning DR Balance|Openning CR Balance|Debit Amount|Credit Amount|Acc. Debit Amount|Acc. Credit Amount|Closing DR Balance|Closing CR Balance'
                            format='0|1|1|1|1|1|1|1|1'
                            aligns='0|3|3|3|3|3|3|3|3'
                            defaults='||||||||'
                            editcol='0|0|0|0|0|0|0|0|0'
                            widths='1000|1800|1800|1800|1800|1800|1800|1800|1800'
                            sorting='F'
                            styles='width:100%; height:80'
                            />
		            </td>
	            </tr>
                
            </table>
        </form>
        
        
            <form name="Trans In/De" id="form5" >
	        <table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td>
					
					<gw:grid id='grdPartnerTR'
                            header='_TCO_BUSPARTNER_PK|_TAC_ABACCTCODE_PK|Partner ID|Partner Name|Account Code|CCY|Số dư đầu kỳ|_OPEN_BAL|PS nợ|PS Có|_DR_SUM|_CR_SUM|Lũy kế Nợ|Lũy kế Có|_ACC_DR_SUM|_ACC_CR_SUM|Số cuối kỳ|_CLOSE_BAL'
                            format='0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1'
                            aligns='0|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3'
                            defaults='|||||||||||||||||'
                            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                            widths='0|0|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500'
                            styles  ="width:100%; height:270"   
                            sorting="T"
                            oncelldblclick ="OnShowDetail()"/> 

					</td>
				</tr>
				<tr>
		            <td width="100%">
		                <gw:grid id='grdSumTR'
                            header='CCY|OPEN_FBAL|OPEN_BAL|DR_FSUM|CR_FSUM|DR_SUM|CR_SUM|ACC_DR_FSUM|ACC_CR_FSUM|ACC_DR_SUM|ACC_CR_SUM|CLOSE_FBAL|CLOSE_BAL'
                            format='0|1|1|1|1|1|1|1|1|1|1|1|1'
                            aligns='0|3|3|3|3|3|3|3|3|3|3|3|3'
                            defaults='||||||||||||'
                            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0'
                            widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                            sorting='F'
                            styles='width:100%; height:80'
                            />
		            </td>
	            </tr>
                
            </table>
            </form>
    
        </gw:tab>

<gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
<gw:textbox id="txtSUM"   style="display:none"/>

<gw:textbox id="txtAc_level"  styles='display:none' />
         <gw:textbox id="txtSesion_company"  styles='display:none' />
         <gw:textbox id="txtUser_Pk"  styles='display:none' />
<gw:list id="lstSEARCH" styles='width:100%;display:none' onchange="OnDisplayMonth()"/>
<!---------------------------------------------------------------------------------------------------->
</body>
</html>