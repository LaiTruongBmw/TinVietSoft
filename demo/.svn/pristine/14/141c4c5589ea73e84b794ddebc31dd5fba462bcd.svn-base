<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var g_user_pk = "<%=Session("USER_PK") %>";
function BodyInit()
{
    System.Translate(document); 
    txtLang.text="<%=Session("SESSION_LANG") %>"; 
    BindingData(); 
   OnDisplay();
   txtUser_Pk.text = g_user_pk;
dso_getCompany.Call();
}
//------------------------------------------------------------------------
function BindingData()
{
        
    var ls_data  = "<%=CtlLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if = 0")%>";
    var ls_data2 = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK011' ORDER BY D.DEF_YN DESC, D.ORD")%>"; 
    var ls_data3 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
    var ls_ccy   = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>||Select All";
    var ls_bookccy = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
    var language = "<%=CtlLib.SetListDataFUNC("SELECT ac_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
    var report = "<%=CtlLib.SetListDataFUNC("SELECT ac_GET_COMMONCODE('EACBK036') FROM DUAL")%>";
    lstCcy.SetDataText(ls_ccy);
    lstCcy.value="";
    lstBookCcy.SetDataText(ls_bookccy);
    lstCompany.SetDataText(ls_data);
    
    lstLanguage.SetDataText(language);
    lstREPORT.SetDataText(report);
    rdoAMOUNT.value = "2";
    rdoTYPE.value = "D";
    rdoSTATUS.value = "0";
    
    
}
//------------------------------------------------------------------------
function OnPopUp(pname)
{
    if (pname=='ACCT')
   {
        var fpath = System.RootURL + "/standard/forms/60/08/60080050_popup_Acc.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_SEL_60080190_ACCD_PL";
        var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
        if ((object != null) &&(object[0]!="0"))
    {
        txtACPK.SetDataText(object[3]);
        txtACCD.SetDataText(object[0]);
        txtACNM.SetDataText(object[1]);
    }
   }
   if (pname=='CENTER')
   {
        var fpath   = System.RootURL + "/standard/forms/60/01/60010080_plcenter.aspx?";
           
          var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
            // var object=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
       
            if ( object != null )  
            {
                if (object[0] != 0)
                {
                    txtPLC_PK.text = object;     // Center PK
                    dat_gfka00220_1.Call();
                }            
            }        
   }
    if (pname=='PL')
   {
          
          var fpath   = System.RootURL + "/standard/forms/60/01/60010080_popup_plunit.aspx?";
           
          var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
            // var object=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
          var tmp;
            if ( object != null )  
            {
                if (object[0] != 0)
                {
                    txtPLPK.text=object;     // Center PK
                    dat_gfka00220_2.Call();
                }            
            }    
   }
    
}


function OnSearch()
{
   dso_sel_PL_bal_sum.Call("SELECT");
}

function OnDataReceive(pObject)
{
    switch(pObject.id)
    {
        case "dso_date":
            MergeHeaderDate();
            loadDateOpeningBalance();
            //dso_sel_cust_bal_sum.Call("SELECT");
        break;
        case "dso_voucher":
            MergeHeaderVoucher();    
            loadVoucherOpeningBalance();
            //dso_sel_cust_bal_sum.Call("SELECT");    
        break;
        case "dso_sel_PL_bal_sum":
            MergeHeaderSum();
            if(rdoTYPE.GetData()== 'D')
            {
                dso_date.Call("SELECT");
            }
            else
            {
                dso_voucher.Call("SELECT");
            }
        break;
    }
}
//--------------------------------------------------
function MergeHeaderDate()
{
		var fg=grdDate.GetGridControl();
		/*if(fg.Rows < 2)
		{
		   //grdDate.AddRow();     
		}*/
       //fg.FixedRows = 2
       // fg.MergeCells = 5
	//	fg.MergeRow(0) = true

//        fg.Cell(0, 0, 6, 0, 7) = "Debit"  
//		fg.Cell(0, 0, 8, 0, 9) = "Credit"  
		
		fg.Cell(0, 0, 6, 0, 6) = "Trans.Debit"
		fg.MergeCol(6) = true
		
		fg.Cell(0, 0, 7, 0, 7) = "Book Debit"
		fg.MergeCol(8) = true
		
		fg.Cell(0, 0, 8, 0, 8) = "Trans.Credit"
		fg.MergeCol(9) = true
		
		fg.Cell(0, 0, 9, 0, 9) = "Book Credit"
		fg.MergeCol(10) = true
		//fg.MergeCells = 3;
		
		fg.MergeCol(0) = true
        fg.Cell(0, 0, 0, 0, 0) = "Date"
        fg.MergeCol(1) = true
        
       // fg.Cell(0, 0, 2, 1, 3) = "Account"
        fg.Cell(0, 0, 2, 0, 2) = "Acc.Code"  
        fg.MergeCol(2) = true
        
		fg.Cell(0, 0, 3, 0, 3) = "Acc.Name" 
		fg.MergeCol(3) = true
		
		fg.Cell(0, 0, 4, 0, 4) = "CCY"
		fg.MergeCol(4) = true
		
		fg.Cell(0, 0, 5, 0, 5) = "Opening Balance"
		fg.MergeCol(5) = true
		
		//fg.Cell(0, 0, 12, 1, 13) = "PL Unit"
		fg.Cell(0, 0, 12, 0, 12) = "PL Code"
		fg.MergeCol(12) = true
		
		fg.Cell(0, 0, 13, 0, 13) = "PL Name"
		fg.MergeCol(13) = true
		
		fg.Cell(0, 0, 14, 0, 14) = "Center Code"
		fg.MergeCol(14) = true
		
		fg.Cell(0, 0, 15, 0, 15) = "Center Name"
		fg.MergeCol(15) = true
		
		if(rdoSTATUS.GetData()== 2){
			fg.Cell(0, 0, 10, 0, 10) = "CFM Balance"
		}
		else
		{
			fg.Cell(0, 0, 10, 0, 10) = "APP Balance"
		}
		
		fg.Cell(2, 0, 0, 0, fg.Cols - 1) = 4;
		fg.Cell(13, 0, 1, 0,fg.Cols - 1) = true; 
		
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
		
		fg.ColWidth(12)=1500;
		fg.ColWidth(13)=2000;
		fg.ColWidth(14)=1500;
		fg.ColWidth(15)=2000;
		var AmountType = rdoAMOUNT.GetData();
		if (AmountType == '1') // Trans & Books
		{
			fg.ColWidth(6)=1500;
			fg.ColWidth(8)=1500;
		} else if (AmountType == '2') // Only Books
		{
			fg.MergeCol(7) = true
        	fg.Cell(0, 0, 7, 0, 7) = "Debit"
			fg.MergeCol(9) = true
        	fg.Cell(0, 0, 9, 0, 9) = "Credit"
			fg.ColWidth(6)=0;
			fg.ColWidth(8)=0;
			fg.ColWidth(5)=2500;
			fg.ColWidth(7)=2500;
			fg.ColWidth(9)=2500;
		}
        else// Only trans
		{
			fg.MergeCol(6) = true
        	fg.Cell(0, 0, 6, 0, 6) = "Debit"
			fg.MergeCol(8) = true
        	fg.Cell(0, 0, 8, 0, 8) = "Credit"
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
		fg.MergeCol(0) = true
		
		fg.Cell(0, 0, 1, 1, 1) = "Voucher No"
		fg.MergeCol(1) = true
		
		fg.Cell(0, 0, 2, 1, 2) = "Date"
		fg.MergeCol(2) = true
		
		fg.Cell(0, 0, 3, 1, 3) = "Approved by"
		fg.MergeCol(3) = true
		fg.Cell(0, 0, 4, 1, 4) = "CCY"
		fg.MergeCol(4) = true
		
		fg.Cell(0, 0, 6, 1, 6) = "Acc.Code"
		fg.MergeCol(6) = true
		
		fg.Cell(0, 0, 7, 1, 7) = "Acc.Name"
		fg.MergeCol(7) = true
		
		
		fg.Cell(0, 0, 8, 1, 8) = "Opening Balance"
		fg.MergeCol(8) = true
		
		
	    fg.Cell(0, 0, 9, 1, 9)  = "Trans Debit"
	    fg.MergeCol(9) = true
	    fg.Cell(0, 0, 10, 1, 10) = "Books Debit"
		fg.MergeCol(10) = true
	    fg.Cell(0, 0, 11, 1, 11)  = "Trans Credit"
	    fg.MergeCol(11) = true
	    fg.Cell(0, 0, 12, 1, 12) = "Books Credit"
	    fg.MergeCol(13) = true
	    
		if(rdoSTATUS.GetData()== 2){
		    fg.Cell(0, 0, 13, 1, 13) = "CFM Balance"
		}
		else
		{
		    fg.Cell(0, 0, 13, 1, 13) = "APP Balance"
		}
	   	
		//fg.Cell(0, 0, 15, 0, 16) = "PL Unit"
		fg.Cell(0, 0, 15, 1, 15) = "PL Code"  
		fg.MergeCol(15) = true
	    fg.Cell(0, 0, 16, 1, 16) = "PL Name" 
	    fg.MergeCol(16) = true
		//fg.Cell(0, 0, 17, 0, 18) = "Description"
		fg.Cell(0, 0, 17, 1, 17) = "Foreigner Description"
		fg.MergeCol(17) = true
		fg.Cell(0, 0, 18, 1, 18) = "Local Description"
		fg.MergeCol(18) = true
		fg.Cell(0, 0, 19, 1, 19) = "Control Item"
		fg.MergeCol(19) = true
		
		fg.Cell(0, 0, 20, 1, 20) = "Center Code"
		fg.MergeCol(20) = true
		
		fg.Cell(0, 0, 21, 1, 21) = "Center Name"
		fg.MergeCol(21) = true
		fg.Cell(2, 0, 0, 0, fg.Cols - 1) = 4;
		fg.Cell(13, 0, 1, 0,fg.Cols - 1) = true; 
		
		
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
		fg.ColWidth(20)=2000;
		fg.ColWidth(21)=2500;
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
        else if (AmountType == '3') // trans
		{
			fg.MergeCol(9) = true
        	fg.Cell(0, 0, 9, 1, 9) = "Debit"
        	fg.MergeCol(11) = true
        	fg.Cell(0, 0, 11, 1, 11) = "Credit"
			fg.ColWidth(10)=0;
			fg.ColWidth(12)=0;
			
		}
		fg.ColFormat(9) = "#,###,###,###,###,###,###.##R";
		fg.ColFormat(11) = "#,###,###,###,###,###,###.##R";
		
		if(lstBookCcy.GetData() == "VND")
        {
            fg.ColFormat(8) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(10) = "#,###,###,###,###,###,###R"; 
            fg.ColFormat(12) = "#,###,###,###,###,###,###R";
            fg.ColFormat(13) = "#,###,###,###,###,###,###R";
        }
        else
        {
            fg.ColFormat(8) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(10) = "#,###,###,###,###,###,###.##R"; 
            fg.ColFormat(12) = "#,###,###,###,###,###,###.##R";
            fg.ColFormat(13) = "#,###,###,###,###,###,###.##R";
        }
		//loadVoucherOpeningBalance();
}
function MergeHeaderSum()
{

		var fg=grdSum.GetGridControl();
		if(fg.Rows < 2)
		{
		   grdSum.AddRow();     
		}
	//	fg.FrozenCols = 1;
        fg.FixedRows = 2;
        fg.MergeCells = 5;
	//	fg.MergeRow(0) = true;

        fg.MergeCol(0) = true;
		fg.Cell(0, 0, 0, 1, 0) = "CCY";
		//fg.MergeCol(1) = true;
      //  fg.Cell(0, 0, 1, 0, 2) = "Opening Balance";
        fg.Cell(0, 0, 1, 1, 1) = "Opening Trans";
        fg.MergeCol(1) = true;
        fg.Cell(0, 0, 2, 1, 2) = "Opening Book";
        fg.MergeCol(2) = true;
       // fg.Cell(0, 0, 3, 0, 4) = "Transaction";
        fg.Cell(0, 0, 3, 1, 3) = "Trans Debit";
        fg.MergeCol(3) = true;
        fg.Cell(0, 0, 4, 1, 4) = "Trans Credit";
        fg.MergeCol(4) = true;
        
       // fg.Cell(0, 0, 5, 0, 6) = "Books";
        fg.Cell(0, 0, 5, 1, 5) = "Books Debit";
        fg.MergeCol(5) = true;
        fg.Cell(0, 0, 6, 1, 6) = "Books Credit";
        fg.MergeCol(6) = true;
        //fg.Cell(0, 0, 7, 0, 8) = "Acc. Transaction";
        fg.Cell(0, 0, 7, 1, 7) = "Acc.Trans Debit";
        fg.MergeCol(7) = true;
        fg.Cell(0, 0, 8, 1, 8) = "Acc.Trans Credit";
        fg.MergeCol(8) = true;
        //fg.Cell(0, 0, 9, 0, 10) = "Acc. Book";
        fg.Cell(0, 0, 9, 1, 9) = "Acc.Book Debit";
        fg.MergeCol(9) = true;
        fg.Cell(0, 0, 10, 1, 10) = "Acc.Book Credit";
        fg.MergeCol(10) = true;
        //fg.Cell(0, 0, 11, 0, 12) = "Closing Balance";
        fg.Cell(0, 0, 11, 1, 11) = "Closing Trans";
        fg.MergeCol(11) = true;
        fg.Cell(0, 0, 12, 1, 12) = "Closing Book";
        fg.MergeCol(12) = true;
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
		fg.Cell(2, 0, 0, 0, fg.Cols - 1) = 4;
		fg.Cell(13, 0, 1, 0,fg.Cols - 1) = true; 
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
		else if (AmountType == '1')
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
			fg.ColWidth(9)=0;
			fg.ColWidth(10)=0;
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
	}
	MergeHeaderSum();
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
        status = grdVoucher.GetGridData(ctrl.row, 15);
        //for (i = 2; i <= rows ; i++)
        //{   
        //     ls_arr = ls_arr + ' ' + grdVoucher.GetGridData(i, 0);
             
        //} 
        this.name = "gfka00050";
        var fpath = System.RootURL + '/standard/forms/60/08/60080050_popup.aspx?PK_ROW=' + pk + '&ROW=' + rownum + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
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
        var status = grdVoucher.GetGridData(ctrl.row, 15);
        var ls_arr = "";
        //for (i = 2; i < grdVoucher.rows ; i++)
        //{
            //ls_arr = ls_arr + ' ' + grdVoucher.GetGridData(i, 0);
        //}
        var fpath = System.RootURL + '/standard/forms/60/08/60080050_popup.aspx?PK_ROW=' + pk + '&ROW=' + ctrl.Row + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
        var wWidth = 950;
        var wHeight = 600;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
        "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
        "lef="+ x +",top=" + y;
		this.name = "gfka00050";
        var object = System.OpenModal(fpath, wWidth, wHeight, features, window);
       // }
    }
}
function OnPrint() 
{         
	if(lstREPORT.value=='AS')
	{
		var url =System.RootURL + '/standard/reports/60/08/rpt_60080020_SL_PL.aspx?p_compk=' +lstCompany.value + '&p_from=' + txtFROM_DATE.value + '&p_to=' + txtTO_DATE.value+ '&p_acc_pk='+txtACPK.text+ '&p_plcenter='+txtPLC_PK.text+ '&p_plunit='+txtPLPK.text+ '&p_status='+rdoSTATUS.value+ '&p_ccy='+lstCcy.value;
	}	
	else if(lstREPORT.value=='01')
	{
		var url =System.RootURL + '/standard/reports/60/08/rpt_60080200_expense_monthly.aspx?p_compk=' +lstCompany.value + '&p_from=' + txtFROM_DATE.value + '&p_to=' + txtTO_DATE.value+ '&p_acc_pk='+txtACPK.text+ '&p_plcenter='+txtPLC_PK.text+ '&p_plunit='+txtPLPK.text+ '&p_status='+rdoSTATUS.value+ '&p_ccy='+lstCcy.value;
	}	
	System.OpenTargetPage(url);
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
  <gw:data id="dat_gfka00220_1" onreceive=""  > 
        <xml>
            <dso  type="process"   procedure="ac_sel_60080190"  > 
                <input>
                    <input bind="txtPLC_PK" />
                </input> 
                <output>
                    <output bind="txtPLC_CD" />
                    <output bind="txtPLC_NM" />
                </output>
            </dso> 
        </xml> 
   </gw:data>
     <gw:data id="dat_gfka00220_2" onreceive=""  > 
        <xml>
            <dso  type="process"   procedure="ac_sel_60080190_2"  > 
                <input>
                    <input bind="txtPLPK" />
                </input> 
                <output>
                    <output bind="txtPLCD" />
                    <output bind="txtPLNM" />
                </output>
            </dso> 
        </xml> 
   </gw:data>
   <!----------------------------------------------------------------------->
   <gw:data id="dso_sel_PL_bal_sum" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080200_plsum">
                <input bind="grdDetail">
                    <input bind="lstCompany"/>
                    <input bind="txtFROM_DATE"/>
                    <input bind="txtTO_DATE"/>
                    <input bind="txtACPK"/>
                    <input bind="txtPLC_PK"/>
                    <input bind="txtPLPK"/>
                    <input bind="rdoSTATUS"/>
                    <input bind="lstCcy"/>
                </input>
                <output bind="grdSum"/>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------------------------------->
    <gw:data id="dso_date" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080200_1">
                <input bind="grdDetail">
                    <input bind="lstCompany"/>
                    <input bind="txtFROM_DATE"/>
                    <input bind="txtTO_DATE"/>
                    <input bind="txtACPK"/>
                    <input bind="txtPLC_PK"/>
                    <input bind="txtPLPK"/>
                    <input bind="rdoSTATUS"/>
                    <input bind="lstCcy"/>

                </input>
                <output bind="grdDate"/>
        </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="dso_voucher" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60080200">
                <input bind="grdDetail">
                    <input bind="lstCompany"/>
                    <input bind="txtFROM_DATE"/>
                    <input bind="txtTO_DATE"/>
                    <input bind="txtACPK"/>
                    <input bind="txtPLC_PK"/>
                    <input bind="txtPLPK"/>
                    <input bind="rdoSTATUS"/>
                    <input bind="lstCcy"/>

                </input>
                <output bind="grdVoucher"/>
        </dso>
        </xml>
    </gw:data>


            <table style="width:100%;height:100%" cellpadding="0" cellspacing="0" border="0">
                <tr style="width:100;height:10%">
                   <td>
                        <fieldset >
                             <table width="100%" border="0" cellpadding="0" cellspacing="1" >
           
                <tr >
                    <td align="right" width="12%" >Company&nbsp;</td>
                    <td  colspan="3" width="15%">
                        <gw:list id="lstCompany" styles="width:100%" />
                    </td>
                    <td align="right" width="15%"><a title="Click here to select Account Code" onclick="OnPopUp('ACCT')" href="#tips">Account Code</a>&nbsp;</td>
                    <td  width="30%">
                        <table style="width:100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="30%"><gw:textbox id="txtACCD" readonly="true" text="" styles="width:100%" /></td>
                                <td width="70%"><gw:textbox id="txtACNM" readonly="true" text="" styles="width:100%" /></td>
                                <td ><gw:imgbtn img="reset" alt="Reset Account Code" id="btnResetAcc" onclick="txtACCD.text='';txtACNM.text='';txtACPK.text='';" /></td>
                            </tr>
                        </table>
                    </td>
                    <td align="right"  width="13%">Currency&nbsp;</td>
                    <td width="15%"><gw:list id="lstCcy" styles="width:100%" onchange="OnSearch()"/></td>  
                    
                    <td ><gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch()" /></td>
                    <td ><gw:imgbtn img="excel" alt="Print" id="btnPrint11" onclick="OnPrint()" /></td>        
                </tr>
                <tr>
                    <td align="right" >Date&nbsp;</td> 
                    <td align="left" ><gw:datebox id="txtFROM_DATE" styles='width:100%;height:22'  lang="<%=Session("Lang")%>"/></td>
                    <td align="center">~</td>
                    <td align="right"><gw:datebox id="txtTO_DATE" styles='width:100%;height:22'  lang="<%=Session("Lang")%>"/></td>
                    <td align="right" styles="width: 100%"><a title="Click here to select PL Center" onclick="OnPopUp('CENTER')" href="#tips">PL Center</a>&nbsp;</td>
                    <td > 
                        <table style="width:100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="30%"><gw:textbox id="txtPLC_CD" readonly="true"  styles="width:100%" /></td>
                                <td width="70%"><gw:textbox id="txtPLC_NM" readonly="true"  styles="width:100%" /></td>
                                <td align="right"><gw:imgbtn img="reset" alt="Reset" id="btnResetPLCenter" onclick="txtPLC_CD.text='';txtPLC_NM.text='';txtPLC_PK.text='';" /></td> 
                            </tr>
                        </table>
                    </td>
                    <td  align="right">Language</td>
                    <td colspan="3"><gw:list id="lstLanguage" styles="width:100%" /></td>
                </tr>
                
               <tr>
                    <td  align="right">Status &nbsp;</td>
                    <td colspan="3"  > <gw:radio id="rdoSTATUS"  value="0" > 
                                    <span value="2" >Confirmed</span>
                                    <span value="0" >Approved</span>
                                </gw:radio >
                   </td>               
                   <td align="right" ><a title="Click here to select PL Unit" onclick="OnPopUp('PL')" href="#tips">PL Unit</a>&nbsp;</td>
                    <td  >
                        
                        
                        <table style="width:100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="30%"><gw:textbox id="txtPLCD"  readonly="true" styles="width:100%" /></td>
                                <td width="70%"><gw:textbox id="txtPLNM" readonly="true"  styles="width:100%" /></td>
                                <td align="right"><gw:imgbtn img="reset" alt="Reset" id="btnResetPLUnit" onclick="txtPLCD.text='';txtPLNM.text='';txtPLPK.text='';" /></td>
                            </tr>
                        </table>
                    </td>
                    <td align="right">Inquiry Type</td>
                    <td colspan="3"><gw:radio id="rdoTYPE" value="2" onchange="OnDisplay()" styles='height:22'>
                                    <span value="D">Date&nbsp;</span>
                                    <span value="V">Voucher</span>
                                    </gw:radio ></td>
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
                    <td  colspan="5"><gw:list id="lstREPORT" styles='width:100%'onclick="onPrint(2)"/></td>
               </tr>
            </table>     
                        </fieldset>
                   </td>
                </tr>
                <tr style="width:100%;height:60%">
                    <td >
                        <table style="width:100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    
                                </td>
                            </tr>
                        </table>
                    <!--header='0.Seq|1.Voucher No|2.Profit Name|3.Proposed Date|4.Proposed By|5.CCY|6.Transaction|7.Book|8.Transaction|9.Book|10.CFM Balance|11.Remark'-->
                                <gw:grid   
						    id="grdDate"  
						    header="Date|_ACC_PK|AC_CD|AC_NM|CCY|OpeningBalance|DebitTransAmount|DebitBookAmount|CreditTransAmount|CreditBookAmount|Balance|_Cust PK|Cust ID|Cust Name|PLC Code|PLC Name"   
						    format  ="4|0|0|0|0|1|1|1|1|1|1|0|0|0|0|0"  
						    aligns  ="0|0|0|0|0|3|3|3|3|3|3|0|0|0|0|0"  
						    defaults="|||||||||||||||"  
						    acceptnulldate="T"
						    editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
						    widths  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
						    styles  ="width:100%; height:100%"   
						    sorting="T"
						    /> 
							<gw:grid   
						    id="grdVoucher"  
						    header="PK|VoucherNo|Date|User|CCY|_acc_pk|ac_cd|ac nm|OpeningBalance|DebitTransAmount|DebitBookAmount|CreditTransAmount|CreditBookAmount|Balance|_cust_pk|cust_id|Partner|Remark|Remark2|Item|Center code|Center name"   
						    format  ="0|0|4|0|0|0|0|0|1|1|1|1|1|1|0|0|0|0|0|0|0|0"  
						    aligns  ="0|0|0|0|0|0|0|0|3|3|3|3|3|3|0|0|0|0|0|0|0|0"  
						    defaults="||||||||||||||||||||"  
						    acceptnulldate="T"
						    editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
						    widths  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
						    styles="width:100%; height:100%"   
						    sorting="T"
							oncelldblclick ="RowClick()" 
							/> 
                                
                            </td>
                </tr>
                 <tr style="width:100%;height:30%">
                    <td >
                    <!--header='0.Seq|1.Voucher No|2.Profit Name|3.Proposed Date|4.Proposed By|5.CCY|6.Transaction|7.Book|8.Transaction|9.Book|10.CFM Balance|11.Remark'-->
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
            </table>
            <gw:textbox id="txtLang" styles="display:none; " text="<%=Session("SESSION_LANG") %>"/>
            <gw:textbox id="txtACPK" styles="display:none; " />
            <gw:textbox id="txtPLC_PK" styles="display:none; " />
            <gw:textbox id="txtPLPK" styles="display:none; " />
            <gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
<gw:textbox id="txtAc_level"  styles='display:none' />
         <gw:textbox id="txtSesion_company"  styles='display:none' />
<gw:textbox id="txtUser_Pk" styles="display:none;" />
  </body>
</html>