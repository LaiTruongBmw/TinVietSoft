<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Daily S/L</title>
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<script type="text/javascript" language="javascript">
var g_inquiry_type = 10;//Dates :10; Vouchers :20

function BodyInit()
{
    System.Translate(document);
    grdSLByVoucher.style.display="none";
    
    var l_ac_pk     = "<%=Request.querystring("ac_pk")%>";
    var l_ac_nm     = "<%=Request.querystring("ac_nm")%>";
    var l_ac_cd1     = "<%=Request.querystring("ac_cd")%>";
    var l_ac_nm1     = "<%=Request.querystring("ad_nm1")%>";
    
    var l_compk     = "<%=Request.querystring("compk")%>";
    var l_lang      = "<%=Request.querystring("lang")%>";
    var l_status    = "<%=Request.querystring("status")%>";
    var l_cur       = "<%=Request.querystring("cur")%>";
    var ls_datefr   = "<%=Request.querystring("date_fr")%>";
    var l_dateto    = "<%=Request.querystring("date_to")%>";
    var l_typemonth = "<%=Request.querystring("type_month")%>";
    
    
    var ls_data  = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_data1 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE_NM  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='HRAB0180' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 order by code_nm")%>";
    var ls_data3 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
    var ls_data4 = "<%=CtlLib.SetListDataSQL("SELECT 'ALL' C1,'<All>' C2  FROM DUAL UNION ALL SELECT C1,C2 FROM ( SELECT TRIM(A.CODE) C1, A.CODE C2 FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0 AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY NUM_VALUE1)")%>";
   // var ls_data5 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE_NM  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0140' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and cha_value1 = '60110020' order by code_nm")%>";
    var ls_data5 = "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK002' ORDER BY D.DEF_YN DESC, D.ORD ")%>";
    var ls_data6 ="<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_LNM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACAB021'  ORDER BY D.DEF_YN DESC, D.ORD")%>"; 
    
    if (l_typemonth == 1)
    {
        ls_datefr = l_dateto + '01';
        var lastdate    = daysInMonth(l_dateto.substr(4,2), l_dateto.substr(0,4));
        var ls_dateto = l_dateto + lastdate;
    }
    else
    {
        ls_datefr = ls_datefr + '01';
        var lastdate    = daysInMonth(l_dateto.substr(4,2), l_dateto.substr(0,4));
        var ls_dateto = l_dateto + lastdate;
    }
    
    lstCompany.SetDataText(ls_data);
    lstLanguage.SetDataText(ls_data1); 
    lstBookCcy.SetDataText(ls_data3); 
    lstCurrency.SetDataText(ls_data4); 
    lstReportType.SetDataText(ls_data5);
    lstRptOption.SetDataText(ls_data6);  
    txtAccCode.SetEnable(false); 
    txtAccName.SetEnable(false);
    dtbFrom.SetDataText(ls_datefr);
    dtbTo.SetDataText(ls_dateto);
    lstCompany.SetDataText(l_compk);
    
    //var l_ac_cd = l_ac_nm.substr(0, 6);
    ///var l_length = l_ac_nm.length;
    txtAccCode.SetDataText(l_ac_cd1);
    txtAccName.SetDataText(l_ac_nm);
    //txtAccName.SetDataText(l_ac_nm.substr(7, l_length));
    txtAccPK.SetDataText(l_ac_pk);
    
    lstLanguage.SetDataText(l_lang);
    rdoSlipStatus.SetDataText(l_status);
    lstCurrency.SetDataText(l_cur);
    FormatSumGrid() ;
    FormatDateGrid();
    dso_pro_acc.Call();
}

function daysInMonth(month,year) 
{
    var m = [31,28,31,30,31,30,31,31,30,31,30,31];
    if (month != 2) return m[month - 1];
    if (year%4 != 0) return m[1];
    if (year%100 == 0 && year%400 != 0) return m[1];
    return m[1] + 1;
}

function onGetAcc()
{
    var fpath = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=SP_SEL_ACCT_SUM_PARENT";
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
                fg.ColWidth(3)=2000;
			    fg.ColWidth(4)=2000;
			    fg.ColWidth(5)=2000;
			    fg.ColWidth(6)=2000; 
            }
            if (g_inquiry_type==20)//Vouchers :20
            {
                var fg =  grdSLByVoucher.GetGridControl();
                fg.ColWidth(6)=1500;
                fg.ColWidth(7)=1500;
                fg.ColWidth(8)=1500;
                fg.ColWidth(9)=1500; 
            }
          
        }
        else//2: Books
        {
             if (g_inquiry_type==10)//Dates :10; 
            {
                 var fg=grdSLByDate.GetGridControl();
                fg.ColWidth(3)=0;
			    fg.ColWidth(4)=0;
			    fg.ColWidth(5)=3000;
			    fg.ColWidth(6)=3000; 
            }
            if (g_inquiry_type==20)//Vouchers :20
            {
                var fg =  grdSLByVoucher.GetGridControl();
                fg.ColWidth(6)= 0;
                fg.ColWidth(7)= 0;
                fg.ColWidth(8)=1500;
                fg.ColWidth(9)=1500; 
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

		fg.MergeCol(0) = true;
        fg.Cell(0, 0, 0, 1, 0) = "Date";
		fg.MergeCol(1) = true;
		fg.Cell(0, 0, 1, 1, 1) = "CCY";
		fg.MergeCol(2) = true;
		fg.Cell(0, 0, 2, 1, 2) = "Opening Balance";
		
		fg.Cell(0, 0, 3, 0, 4) = "Trans";  
		fg.Cell(0, 0, 5, 0, 6) = "Books";
		
		fg.Cell(0, 1, 3, 1) = "Debit";
		fg.Cell(0, 1, 4, 1) = "Credit";
		
		fg.Cell(0, 1, 5, 1) = "Debit";
		fg.Cell(0, 1, 6, 1) = "Credit";
		
		fg.MergeCol(7) = true;
		
		if(rdoSlipStatus.value== "2"){
			fg.Cell(0, 0, 7, 1, 7) = "CFM Balance";
		}
		if (rdoSlipStatus.value== "0"){
			fg.Cell(0, 0, 7, 1, 7) = "APP Balance";
		}
		if (rdoSlipStatus.value== "4"){
			fg.Cell(0, 0, 7, 1, 7) = "NAPP Balance";
		}
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		fg.ColWidth(0)=1500;
		fg.ColWidth(1)=800;
		fg.ColWidth(2)=2000;
		
		fg.ColWidth(3)=2000;
		fg.ColWidth(4)=2000;
		
		fg.ColWidth(5)=2000;
		fg.ColWidth(6)=2000;
		
		fg.ColWidth(7)=2000;
		fg.ColWidth(8)=0;
		var AmountType = rdoAmountType.GetData();
		if (AmountType == '1') // Trans & Books
		{
			fg.ColWidth(3)=2000;
			fg.ColWidth(4)=2000;
			fg.ColWidth(5)=2000;
			fg.ColWidth(6)=2000;
		} else // Only Books
		{
			fg.ColWidth(3)=0;
			fg.ColWidth(4)=0;
			fg.ColWidth(5)=3000;
			fg.ColWidth(6)=3000;
		}
		if (lstBookCcy.value=="VND")
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
		
		fg.ColAlignment(2) = flexAlignRightCenter;
		fg.ColAlignment(3) = flexAlignRightCenter;
		fg.ColAlignment(4) = flexAlignRightCenter;
		fg.ColAlignment(5) = flexAlignRightCenter;
		fg.ColAlignment(6) = flexAlignRightCenter;
		fg.ColAlignment(7) = flexAlignRightCenter;
		
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
        fg.FrozenCols = 5;

        fg.MergeRow(0) = true;

        fg.MergeCol(0) = true;
        fg.Cell(0, 0, 0, 1, 0) = "Seq";

        fg.MergeCol(1) = true;
        fg.Cell(0, 0, 1, 1, 1) = "Voucher No";
        
        fg.MergeCol(2) = true;
        fg.Cell(0, 0, 2, 1, 2) = "Proposed Date";
        
        fg.MergeCol(3) = true;
        fg.Cell(0, 0, 3, 1, 3) = "Proposed By";
        
        fg.MergeCol(4) = true;
        fg.Cell(0, 0, 4, 1, 4) = "Ccy";
        
        fg.MergeCol(5) = true;
        fg.Cell(0, 0, 5, 1, 5) = "Oppeing Balance";
        
        fg.Cell(0,0,6,0,7) = "Trans";
        fg.Cell(0,1,6,1,6) = "Debit";
        fg.Cell(0,1,7,1,7) = "Credit";
        
        fg.Cell(0,0,8,0,9) = "Books";
        fg.Cell(0,1,8,1,8) = "Debit";
        fg.Cell(0,1,9,1,9) = "Credit";
        
        fg.MergeCol(10) = true;
        fg.Cell(0, 0, 10, 1, 10) = "CFM Balance";
        
        fg.MergeCol(11) = true;
        fg.Cell(0, 0, 11, 1, 11) = "Customer Name";
        
        fg.Cell(0,0,12,0,13) = "Description";
        fg.Cell(0,1,12,1,12) = "Foreign";
        fg.Cell(0,1,13,1,13) = "Local";
        
       fg.ColWidth(0)=600;
		fg.ColWidth(1)=1100;
		fg.ColWidth(2)=1100;
		fg.ColWidth(3)=1200;
		fg.ColWidth(4)=500;
		fg.ColWidth(5)=1700;
		fg.ColWidth(6)=1500;
		fg.ColWidth(7)=1500;
		fg.ColWidth(8)=1500;
		fg.ColWidth(9)=1500;
		fg.ColWidth(10)=2000;
		fg.ColWidth(11)=1500;
		fg.ColWidth(12)=1500;
		fg.ColWidth(13)=1500;
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		var AmountType = rdoAmountType.GetData();
		if (AmountType == '1') // Trans & Books
		{
			fg.ColWidth(6)=1500;
		    fg.ColWidth(7)=1500;
		    fg.ColWidth(8)=1500;
		    fg.ColWidth(9)=1500;
		} else // Only Books
		{
			fg.ColWidth(6)= 0;
		    fg.ColWidth(7)= 0;
		    fg.ColWidth(8)=1500;
		    fg.ColWidth(9)=1500;
		}
		if (lstBookCcy.value=="VND")
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
		
		fg.ColAlignment(5) = flexAlignRightCenter;
		fg.ColAlignment(6) = flexAlignRightCenter;
		fg.ColAlignment(7) = flexAlignRightCenter;
		fg.ColAlignment(8) = flexAlignRightCenter;
		fg.ColAlignment(9) = flexAlignRightCenter;
		fg.ColAlignment(10) = flexAlignRightCenter;
		
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
		fg.MergeCol(0) = true;
		fg.Cell(0, 0, 0, 1, 0) = "Opening Balance";
		
		
		fg.MergeCol(1) = true;
		fg.Cell(0, 0, 1, 1, 1) = "Ccy";
		
		fg.Cell(0, 0, 2, 0, 3) = "Trans";  
		fg.Cell(0, 0, 4, 0, 5) = "Books";
		
		fg.Cell(0, 1, 2, 1) = "Debit";
		fg.Cell(0, 1, 3, 1) = "Credit";
		
		fg.Cell(0, 1, 4, 1) = "Debit";
		fg.Cell(0, 1, 5, 1) = "Credit";
		
		fg.MergeCol(6) = true;
		
		if(rdoSlipStatus.value== "2"){
			fg.Cell(0, 0, 6, 1, 6) = "CFM Balance";
		}
		if (rdoSlipStatus.value== "0"){
			fg.Cell(0, 0, 6, 1, 6) = "APP Balance";
		}
		if (rdoSlipStatus.value== "4"){
			fg.Cell(0, 0, 6, 1, 6) = "NAPP Balance";
		}
		
		fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
		fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; 
		
		fg.ColWidth(0)=2300;
		fg.ColWidth(1)=2000;
		
		fg.ColWidth(6)=2000;
		fg.ColWidth(7)=0;
		var AmountType = rdoAmountType.GetData();
		if (AmountType == '1') // Trans & Books
		{
			fg.ColWidth(2)=2000;
			fg.ColWidth(3)=2000;
			fg.ColWidth(4)=2000;
			fg.ColWidth(5)=2000;
		} else // Only Books
		{
			fg.ColWidth(2)=0;
			fg.ColWidth(3)=0;
			fg.ColWidth(4)=3000;
			fg.ColWidth(5)=3000;
		}
		if (lstBookCcy.value=="VND")
		{
		    fg.ColFormat(0) = "#,###,###,###,###";
		    fg.ColFormat(4) = "#,###,###,###,###";
		    fg.ColFormat(5) = "#,###,###,###,###";
		    fg.ColFormat(6) = "#,###,###,###,###";
		}
		else
		{
		    fg.ColFormat(0) = "#,###,###,###,###.##";
		    fg.ColFormat(4) = "#,###,###,###,###.##";
		    fg.ColFormat(5) = "#,###,###,###,###.##";
		    fg.ColFormat(6) = "#,###,###,###,###.##";		    
		}
		
		fg.ColFormat(2) = "#,###,###,###,###.##";
		fg.ColFormat(3) = "#,###,###,###,###.##";
	
		
		fg.ColAlignment(0) = flexAlignRightCenter;
		fg.ColAlignment(2) = flexAlignRightCenter;
		fg.ColAlignment(3) = flexAlignRightCenter;
		fg.ColAlignment(4) = flexAlignRightCenter;
		fg.ColAlignment(5) = flexAlignRightCenter;
		fg.ColAlignment(6) = flexAlignRightCenter;
		
}
function onSearch()
{  
        if(Trim(txtAccPK.text)=="")
       {
         alert('Please select an account');
         return;
       }
       //  alert(txtAccPK.GetData());
      if (rdoInquiryType.value=="1")//Report type is Date
      {
            grdSLByDate.style.display="";
            grdSLByDate.ClearData();
            grdSLByVoucher.style.display="none";
            g_inquiry_type =10;
            FormatDateGrid();
      }
      if (rdoInquiryType.value=="2")//Report type is Voucher
      {
            grdSLByDate.style.display="none";
            grdSLByVoucher.style.display="";
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
		    txtOpenBalance.text = parseFloat(ReplaceACharacter(Trim(grdSLSum.GetGridData(2,0)),","));
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
            grdSLByDate.SetGridText(i,2,grdSLByDate.GetGridData(i-1,7));
        }
   } 
}

function makeOpenBalanceByVoucher()
{
    if (grdSLByVoucher.rows >2)
   {
        for(i=3;i<grdSLByVoucher.rows;i++)
        {
            grdSLByVoucher.SetGridText(i,5,grdSLByVoucher.GetGridData(i-1,10));
        }
   } 
}


function OnDataError(dsql)
{
alert(dsql.id);
}

function RowClick()
{
   var rows =0;
    var rownum =0;
    var colnum =0;
    var pk = 0;
    var status = "";

    var ctrl = grdSLByVoucher.GetGridControl();
    rows = ctrl.Rows;
    rows = rows - 1;
    rownum = ctrl.row;
    pk = grdSLByVoucher.GetGridData(ctrl.row, 0);
    tatus = grdSLByVoucher.GetGridData(ctrl.row, 6);

    if (rownum > 0) 
    {
        var fpath = System.RootURL + '/standard/forms/gf/hg/gfhg00020_popup.aspx?PK_ROW=' + pk + '&ROW=' + rownum + '&ROWS=' + rows + '&APPRCANCEL=' + status;
        var wWidth = 950;
        var wHeight = 600;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +"lef="+ x +",top=" + y;
        this.name = "gfka00100_popup";
        var object = System.OpenModal(fpath, wWidth, wHeight, features, window);
    }
}

function GetRowPK(row_index){
    if((row_index < grdSLByVoucher.rows) && (row_index > 0)){
        return grdSLByVoucher.GetGridData(row_index, 0);
    }
    return -1;
}


function OnReport()
{
/*
   var rqt = "";
   rqt = "?company_pk="+lstCompany.value+'&account_pk='+txtAccPK.text+'&dtbFrom='+dtbFrom.value+'&dtbTo='+dtbTo.value+'&ccy='+lstCurrency.value+'&status='+rdoSlipStatus.value+'&bookccy='+lstBookCcy.value+'&rptOption='+lstRptOption.value;
   //Nhat ky chi tien
   if (lstReportType.value=="NKCT")
   {
            var s = new String(txtAccCode.text)
		    if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		    {
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoNKchitienS03a2-DN.aspx'+rqt;
                    window.open(url);
                    return;
		    }
		    else
		    {
		        alert("This is not payment acount code");
		       return; 
		    }
            
   }
   //Nhat ky thu tien
    if (lstReportType.value=="NKTT")
   {
            var s = new String(txtAccCode.text)
		    if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		    {
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoNKthutienS03a1-DN.aspx'+rqt;
                    window.open(url);
                    return;
		    }
		    else
		    {
		        alert("This is not payment acount code");
		       return; 
		    }  
   }
   //So quy tien mat
    if (lstReportType.value=="SQTM")
   {
            var s = new String(txtAccCode.text)
		    if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		    {
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_Soquy_S07-DN.aspx'+rqt;
                    window.open(url);
                    return;
		    }
		    else
		    {
		        alert("This is not payment acount code");
		       return; 
		    }  
   }
   //So quy chi tiet tien mat
   if (lstReportType.value=="SQCTTM")
   {
            var s = new String(txtAccCode.text)
		    if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		    {
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoKToanCTquy_S07a-DN.aspx'+rqt;
                    window.open(url);
                    return;
		    }
		    else
		    {
		        alert("This is not payment acount code");
		       return; 
		    }  
   }
   
   //T So quy chi tiet tien mat
   if (lstReportType.value=="TSQCTTM")
   {
            var s = new String(txtAccCode.text)
		    if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		    {
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SCTQT.aspx'+rqt;
                    window.open(url);
                    return;
		    }
		    else
		    {
		        alert("This is not payment acount code");
		       return; 
		    }  
   }
   
   //So cai
    if (lstReportType.value=="GL")
   {
            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN.aspx'+rqt;
            window.open(url);
            return;
		   
   }
   //T so cai
    if (lstReportType.value=="TGL")
   {
            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SOCAI.aspx'+rqt;
            window.open(url);
            return;
   }
   
   //Daily SL
    if (lstReportType.value=="DSL")
   {
            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_DailySL.aspx'+rqt;
            window.open(url);
            return;
		   
   }
   */
  if(Trim(txtAccPK.text)=="")
       {
         alert('Please select an account');
         return;
       }
   var rqt = "";
   rqt = "?company_pk="+lstCompany.value+'&account_pk='+txtAccPK.text+'&dtbFrom='+dtbFrom.value+'&dtbTo='+dtbTo.value+'&ccy='+lstCurrency.value+'&status='+rdoSlipStatus.value+'&bookccy='+lstBookCcy.value+'&rptOption='+lstRptOption.value;
   
   //Nhat ky chi tien
   if (lstReportType.value=="S03a2-DN")
   {
            var s = new String(txtAccCode.text)
		    if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		    {
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoNKchitienS03a2-DN.aspx'+rqt;
                   // System.OpenTargetPage( url , 'newform' );
				   	 window.open( url , 'newform'  );
                    return;
		    }
		    else
		    {
		        alert("This is not payment acount code");
		       return; 
		    }
            
   }
   //Nhat ky thu tien
    if (lstReportType.value=="S03a1-DN")
   {
            var s = new String(txtAccCode.text)
		    if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		    {
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoNKthutienS03a1-DN.aspx'+rqt;
                   // System.OpenTargetPage( url , 'newform' );
				   	 window.open( url , 'newform'  );
                    return;
		    }
		    else
		    {
		        alert("This is not payment acount code");
		       return; 
		    }  
   }
   //So quy tien mat
    if (lstReportType.value=="S07-DN")
   {
            var s = new String(txtAccCode.text)
		    if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		    {
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_Soquy_S07-DN.aspx'+rqt;
                   // System.OpenTargetPage( url , 'newform' );
				   	 window.open( url , 'newform'  );
                    return;
		    }
		    else
		    {
		        alert("This is not payment acount code");
		       return; 
		    }  
   }
   //So quy chi tiet tien mat
   if (lstReportType.value=="S07a-DN")
   {
            var s = new String(txtAccCode.text)
		    if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		    {
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SoKToanCTquy_S07a-DN.aspx'+rqt;
                    //System.OpenTargetPage( url , 'newform' );
						 window.open( url , 'newform'  );
                    return;
		    }
		    else
		    {
		        alert("This is not payment acount code");
		       return; 
		    }  
   }
   
   //T So quy chi tiet tien mat
   if (lstReportType.value=="TSQCTTM")
   {
            var s = new String(txtAccCode.text)
		    if ((s.substr(0,3)=="111")||(s.substr(0,3)=="112"))
		    {
		            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SCTQT.aspx'+rqt;
                  //  System.OpenTargetPage( url , 'newform' );
						 window.open( url , 'newform'  );
                    return;
		    }
		    else
		    {
		        alert("This is not payment acount code");
		       return; 
		    }  
   }
   
   //So cai
    if (lstReportType.value=="S01-DN")
   {
            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_SocaiNKC_S03b-DN.aspx'+rqt;
           // System.OpenTargetPage( url , 'newform' );
		   	 window.open( url , 'newform'  );
            return;
		   
   }
   //T so cai
    if (lstReportType.value=="TGL")
   {
            var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SOCAI.aspx'+rqt;
           // System.OpenTargetPage( url , 'newform' );
		   	 window.open( url , 'newform'  );
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
        // System.OpenTargetPage( url , 'newform' );
		 window.open( url , 'newform'  );
        return;
   }
   
}
</script>
<body style="margin:0; padding:0;">

   <gw:data id="datSLSum" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
        <xml>
            <dso type="grid"  function="AC_SEL_60200010_DAILY_SL_SUM">
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
   <gw:data id="datSLByDate" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
        <xml>
            <dso type="grid"  function="AC_sel_60200010_daily_sl_date">
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
   
      <gw:data id="datSLByVoucher" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
        <xml>
            <dso type="grid"  function="AC_Sel_60200010_Daily_Sl_Vc">
                <input bind="grdSLByVoucher">
                    <input bind="lstCompany"/>
                    <input bind="txtAccPK"/>
                    <input bind="dtbFrom"/>
                    <input bind="dtbTo"/>
                    <input bind="rdoSlipStatus"/>
                    <input bind="lstCurrency"/>
                    <input bind="txtOpenBalance"/>
                </input>
                <output bind="grdSLByVoucher"/>
            </dso>
        </xml>
    </gw:data>   
    
    <gw:data id="dso_pro_acc" onreceive="onSearch()">
        <xml> 
            <dso type="process" procedure="AC_PRO_60200010_ACCOUNT" > 
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="txtAccCode"/>
                     <input bind="lstLanguage"/>
                </input>
                <output>
                     <output bind="txtAccPK"/>
                     <output bind="txt_temp"/>
                     <output bind="txtAccName"/>
               </output>
            </dso> 
        </xml> 
    </gw:data>
	
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="right" width="10%">Company</td>
                        <td  width="23%"><gw:list id="lstCompany" styles="width:100%;" ></gw:list></td>
                        <td width="9%" align="right">Account Code</td>
                        <td width="45%" colspan="3">
                            <table border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
                                <tr>
                                    <td width="25%"><gw:textbox id="txtAccCode" text=""  styles='width:100%'/> </td>
                                    <td width="70%"><gw:textbox id="txtAccName" text=""  styles='width:100%'/></td>
                                    <td width="5%"><gw:imgBtn id="btnResetAcc" img="reset" alt="Reset Account" onclick="onResetAcc()" /></td>
                                </tr>
                            </table>
                        </td>
                        <td align="right" width="6%">Language</td>
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
                         <td colspan="3">
                            <table border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
                                <tr>
                                    <td width="35%">
                                        <gw:radio id="rdoInquiryType"  value="1"> 
                                                <span value="1" >Dates</span>
                                                <span value="2" >Vouchers</span>
                                         </gw:radio >
                                    </td>
                                    <td align="right" width="20%">Report Option</td>
                                    <td  width="45%"><gw:list id="lstRptOption" styles="width:100%;" ></gw:list></td> 
                                </tr> 
                            </table>
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
                        <td align="right">Amount Type</td>
                        <td colspan="3">
                        <table border="0" cellpadding="0" cellspacing="0" style="width:100%;" >
                                <tr>
                                <td valign="middle" width="40%">
                                 <gw:radio id="rdoAmountType"  value="2" onchange="onChangeFormat()"> 
                                        <span value="1" >Trans & Books</span>
                                        <span value="2" > Books</span>
                                 </gw:radio >
                        </td>
                        <td align="right"  width="15%">Report </td>
                        <td   width="45%"><gw:list id="lstReportType" styles="width:100%;" ></gw:list></td>
                                </tr>
                                </table>
                        </td>
                        
                        <td ></td>
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
                   <gw:grid id='grdSLByDate'
                        header  ='Proposed Date|Ccy|Oppeing Balance|Debit Trans|Credit Trans|Debit Books|Credit Books|Closing Balance|_Date'
                        format  ='4|0|1|1|1|1|1|1|0'
                        aligns  ='1|1|2|2|2|2|2|2|2'
                        defaults='||||||||'
                        editcol ='0|0|0|0|0|0|0|0|0'
                        widths  ='1000|1000|1000|1000|1000|1000|1000|1000|0'
                        sorting ='T'
                        styles  ='width:100%; height:280'
                    />
                    <gw:grid id='grdSLByVoucher'
                        header  ='PK|VOUCHERNO|TR_DATE|USER_ID|CCY|OPENINGBALANCE|DEBITTRANSAMOUNT|CREDITTRANSAMOUNT|DEBITBOOKAMOUNT|CREDITBOOKAMOUNT|CLOSINGBALANCE|CUSTOMER|REMARK|remark2|_tr_date_filter'
                        format  ='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0'
                        aligns  ='1|0|1|1|1|2|2|2|2|2|2|0|0|0|0'
                        defaults='||||||||||||||'
                        editcol ='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                        widths  ='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                        sorting ='T'
                        styles  ='width:100%; height:280;'
                        oncelldblclick ="RowClick()"
                    />
        
            </td>
      </tr> 
      <tr>
            <td>
                <gw:grid id='grdSLSum'
                    header  ='CCY|OPENINGBALANCE|DEBITTRANSAMOUNT|DEBITBOOKAMOUNT|CREDITTRANSAMOUNT|CREDITBOOKAMOUNT|CLOSINGBALANCE|_OB'
                    format  ='0|1|1|1|1|1|1|1'
                    aligns  ='1|1|2|2|2|2|2|2'
                    defaults='|||||||'
                    editcol ='0|0|0|0|0|0|0|0'
                    widths  ='1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting ='T'
                    styles='width:100%; height:120;'
                />
            </td>
      </tr> 
</table>  

<gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
<gw:textbox id="txtAccPK" styles="display:none;"/> 
<gw:textbox id="txtOpenBalance" styles="display:none;" /> 

<gw:textbox id="txt_temp" styles="display:none;" /> 

</body>
</html>
