<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Daily Entry Inquiry C.F</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script type="text/javascript" language="javascript">
var report_type = 0;//AS:10, NKC:20
var form_type = 20; //Trans+ book 10; book :20
var tab_index = 0;
function BodyInit()
{
   //<%CtlLib.SetGridColumnComboFormat("grdDebit", 6,"SELECT TRIM(A.CODE), A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY NUM_VALUE1")%>;
   
   
    txtSesion_company.text = "<%=session("company_pk")%>";
    if(txtAc_level.text=='6')
    {
        var ls_data = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
      //  lstCompany.SetDataText(ls_data);
    }
    else //if(txtAc_level.text=='3')
    {
       
    }
    
    BindingDataList();
}

function BindingDataList()
{
    System.Translate(document);
    var ls_data   = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_data2 = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='ACBG0040' AND D.DEF_YN ='Y' ")%>";
    var ls_data3 = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACAB058' and d.USE_YN ='Y' ")%>";
    var ls_lang     = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
    //lstCompany.SetDataText(ls_data);
    lstBookCcy.SetDataText(ls_data2); 
    lstDNDT.SetDataText(ls_data3);
    txtAccPKDr.SetEnable(false);
	txtAccCodeDr.SetEnable(false); 
	txtAccNameDr.SetEnable(false);
	txtAccPKCr.SetEnable(false);
	txtAccCodeCr.SetEnable(false); 
	txtAccNameCr.SetEnable(false); 
	txtCFPK.SetEnable(false); 
	txtCFCode.SetEnable(false);
	txtCFName.SetEnable(false); 
	txtICFPK.SetEnable(false); 
	txtICFCode.SetEnable(false);
	txtICFName.SetEnable(false); 
	lstLang.SetDataText(ls_lang);
	ls_lang.text = "<%= Session("SESSION_LANG") %>";
	
	
	ls_data2 = "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK043' and d.USE_YN ='Y' ORDER BY D.DEF_YN DESC, D.ORD ")%>";
	lstReportType.SetDataText(ls_data2);
	MergeCashFlowGrid(); 
    MergeHeaderGrid();
	txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	 dso_getCompany.Call();
    
}
function MergeCashFlowGrid()
{

        var fg1 = grdCFAmt.GetGridControl();
        fg1.Cell(13, 0, 1, 0,fg1.Cols - 1) = true; //Format all col merge : Fone = Bold		
        //fg.MergeCells =5;
        fg1.Cell(0,0,0,0,0)  = "No";
        fg1.Cell(0,0,1,0,1)  = "Print Seq";
        fg1.Cell(0,0,2,0,2)  = "Code";
        fg1.Cell(0,0,3,0,3)  = "Name";
        fg1.Cell(0,0,4,0,4)  = "Amount";
        fg1.ColWidth(0) = "800";
        fg1.ColWidth(1) = "0";
        fg1.ColWidth(2) = "800";
        fg1.ColWidth(3) = "7000";
        fg1.ColWidth(4) = "2000";
        
        fg1.ColAlignment(4) = flexAlignRightCenter;
        if (lstBookCcy.value=="VND")
        {
            fg1.ColFormat(4) = "#,###,###,###,###,###,###R"; 
        }
        else
        {
            fg1.ColFormat(4) = "#,###,###,###,###,###,###.##R"; 
        }
        
}
function MergeHeaderGrid()
{
        if(grdDailyCF.rows <2)
        {
            grdDailyCF.AddRow();
        } 
	    var fg = grdDailyCF.GetGridControl();
	    fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; //Format all col merge : Fone = Bold		
        fg.FixedRows = 2;
        fg.MergeCells =5;
		fg.MergeRow(0) = true;
        // Acc
        fg.MergeCol(0) = true;
        fg.Cell(0,0,0,1,0)  = "Chk";
        fg.ColWidth(0) = "500";
        
        fg.MergeCol(1) = true;
        fg.Cell(0,0,1,1,1)  = "No";
        fg.ColWidth(1) = "500";
        fg.ColWidth(2) = "0";//R_PK
        
        fg.MergeCol(3) = true;
        fg.Cell(0,0,3,1,3)  = "Seq";
        fg.ColWidth(3) = "800";//Seq
        fg.ColWidth(4) = "0";//TAC_HGTRD_PK
        fg.ColWidth(5) = "0";//TAC_ABACCTCODE_PK_DR
        fg.ColWidth(6) = "0";//TAC_ABACCTCODE_PK_CR
        fg.ColWidth(7) = "0";//DRCR_ORD
        
        fg.MergeCol(8) = true;
        fg.Cell(0,0,8,1,8)  = "Trans Date";
        fg.ColWidth(8) = "1100";
        
        fg.MergeCol(9) = true;
        fg.Cell(0,0,9,1,9)  = "Voucher No";
        fg.ColWidth(9) = "1400";
        
        fg.Cell(0,0,10,0,11)  = "Account Code";
        fg.Cell(0,1,10,1,10)  = "Debit";
        fg.Cell(0,1,11,1,11)  = "Credit";
        fg.ColWidth(10) = "900";
        fg.ColWidth(11) = "900";
        
        fg.MergeCol(12) = true;
        fg.Cell(0,0,12,1,12)="CF Code";
        fg.ColWidth(12) = "800";
        
        //fg.MergeCol(13) = true;
        fg.Cell(0,0,13,0,13)="CF Code";
        fg.Cell(0,1,13,1,13)="(Indirect)";
        fg.ColWidth(13) = "950";
		
		fg.Cell(0,0,14,0,14)="CF Code";
        fg.Cell(0,1,14,1,14)="(Internal)";
        fg.ColWidth(14) = "950";
        
        fg.Cell(0,0,15,0,16)  = "Amount";
        fg.Cell(0,1,15,1,15)  = "Trans";
        fg.Cell(0,1,16,1,16)  = "Books";
        fg.ColWidth(15) = "2000";
        fg.ColWidth(16) = "2000";
        
        fg.Cell(0,0,17,0,18)  = "Description";
        fg.Cell(0,1,17,1,17)  = "Foreign";
        fg.Cell(0,1,18,1,18)  = "Local";
        fg.ColWidth(17) = "1400";
        fg.ColWidth(18) = "1400";  
        
        fg.ColFormat(15) = "#,###,###,###,###,###,###.##R";
        fg.ColAlignment(15) = flexAlignRightCenter;
        fg.ColAlignment(16) = flexAlignRightCenter;
        if (lstBookCcy.value=="VND")
        {
            fg.ColFormat(16) = "#,###,###,###,###,###,###R"; 
        }
        else
        {
            fg.ColFormat(16) = "#,###,###,###,###,###,###.##R"; 
        }
}

function MergeCashFlowI_DGrid()
{

        var fg1 = grdCFAmtI_D.GetGridControl();
        fg1.Cell(13, 0, 1, 0,fg1.Cols - 1) = true; //Format all col merge : Fone = Bold		
        //fg.MergeCells =5;
        fg1.Cell(0,0,0,0,0)  = "No";
        fg1.Cell(0,0,1,0,1)  = "Print Seq";
        fg1.Cell(0,0,2,0,2)  = "Code";
        fg1.Cell(0,0,3,0,3)  = "Name";
        fg1.Cell(0,0,4,0,4)  = "Amount";
        fg1.ColWidth(0) = "800";
        fg1.ColWidth(1) = "0";
        fg1.ColWidth(2) = "800";
        fg1.ColWidth(3) = "7000";
        fg1.ColWidth(4) = "2000";
        
        fg1.ColAlignment(4) = flexAlignRightCenter;
        if (lstBookCcy.value=="VND")
        {
            fg1.ColFormat(4) = "#,###,###,###,###,###,###R"; 
        }
        else
        {
            fg1.ColFormat(4) = "#,###,###,###,###,###,###.##R"; 
        }
        
}
function onSearch()
{
   if (tabMain.GetCurrentPageNo()=="0")
   { 
        datDailyCF.Call("SELECT");
   }
   else if (tabMain.GetCurrentPageNo()=="1")
   {
        datCFAmount.Call("SELECT");
   }
   else if (tabMain.GetCurrentPageNo()=="2")
   {
        datCFAmountI_D.Call("SELECT");
   } 
   else if (tabMain.GetCurrentPageNo()=="3")
   {
        datDailyCF_ACCD.Call("SELECT");
   } 
   else
   {    
        datDailyCF_CUST.Call("SELECT");
   } 
}

function OnDataReceive(dsql_id)
{
    if (dsql_id.id =="datDailyCF")
   {
        chkAll.value="F";
        MergeHeaderGrid();
        setRowNo(); 
        datCFAmount.Call("SELECT");
   } 
   if(dsql_id.id =="datProcessAutoDailyCF")
   {
        alert("Process completed!");
        datDailyCF.Call("SELECT");
   }
   
   if (dsql_id.id =="datCFAmount")
   {
        MergeCashFlowGrid();
        setCFRowNo();
        datCFAmountI_D.Call("SELECT");
        
        
   }
   if (dsql_id.id =="datCFAmountI_D")
   {
        MergeCashFlowI_DGrid();
        setCFI_DRowNo();
       
   }
   
   
}

function setCFI_DRowNo()
{
   for(i=1;i< grdCFAmtI_D.rows;i++)
   {
        grdCFAmtI_D.SetGridText(i,0,""+i);
   }
}

function OnDataError(dsql_id)
{
   if (dsql_id.id =="datDailyCF")
   {
        alert(dsql_id.errmsg);
   } 
   if (dsql_id.id =="datDailyCF_ACCD")
   {
        alert(dsql_id.errmsg);
   } 
   if (dsql_id.id =="datCFAmount")
   {
        alert(dsql_id.errmsg);
   } 
   if(dsql_id.id =="datProcessAutoDailyCF")
   {
        alert("Process Failed!");
   }
}

function setRowNo()
{
   for(i=2;i< grdDailyCF.rows;i++)
   {
        grdDailyCF.SetGridText(i,1,""+(i-1));
   }
}


function setCFRowNo()
{
   for(i=1;i< grdCFAmt.rows;i++)
   {
        grdCFAmt.SetGridText(i,0,""+i);
   }
}

function onGridDbClick(index)
{
    var rownum =0;
    var ctrl = grdDailyCF.GetGridControl();
    rownum = ctrl.row;
  
    if ((rownum > 1) && (ctrl.col==12))
    {
        var fpath = System.RootURL + "/standard/forms/60/08/60080110_popup_acc_code.aspx?col_nm=Code Name&col_code=Code&company=" + lstCompany.value + '&comm_code=&comm_nm=&'+"&val1=" + '' + "&val2=" + '' + "&val3=" + '' + "&dsqlid=SP_SEL_CFCODE";
        var aValue = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
        if (aValue != null)
        {
            if(aValue[0] != "")
            {
                    grdDailyCF.SetGridText(rownum,12,""+aValue[0]);
            }
        } 
    }
   
   if ((rownum > 1) && (ctrl.col==13))
    {
        var fpath = System.RootURL + "/standard/forms/60/08/60080110_popup_acc_code.aspx?col_nm=Code Name&col_code=Code&company=" + lstCompany.value + '&comm_code=&comm_nm=&'+"&val1=" + '' + "&val2=" + '' + "&val3=" + '' + "&dsqlid=SP_SEL_CF_INDIRECTCODE";
        var aValue = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
        if (aValue != null)
        {
            if(aValue[0] != "")
            {
                    grdDailyCF.SetGridText(rownum,13,""+aValue[0]);
            }
        } 
    } 
}

function onResetAccDr()
{
    txtAccPKDr.text = "";
   txtAccCodeDr.text = ""; 
   txtAccNameDr.text = "";
    
}
function onResetAccCr()
{
   txtAccPKCr.text = "";
   txtAccCodeCr.text = ""; 
   txtAccNameCr.text = ""; 
}
function onResetCF()
{
    txtCFPK.text ="";
   txtCFCode.text = "";
   txtCFName.text = ""; 
}
function onResetICF()
{
   txtICFPK.text ="";
   txtICFCode.text = "";
   txtICFName.text = ""; 
}
function onGetCFCode()
{
    
    if (lstDNDT.value == "DN")
    {
        var fpath = System.RootURL + "/standard/forms/60/08/60080110_popup_acc_code.aspx?col_nm=Code Name&col_code=Code&company=" + lstCompany.value + '&comm_code=&comm_nm=&'+"&val1=" + '' + "&val2=" + '' + "&val3=" + '' + "&dsqlid=SP_SEL_CFCODE";
    }
    else if (lstDNDT.value == "CK")
    {
        var fpath = System.RootURL + "/standard/forms/60/08/60080110_popup_acc_code.aspx?col_nm=Code Name&col_code=Code&company=" + lstCompany.value + '&comm_code=&comm_nm=&'+"&val1=" + '' + "&val2=" + '' + "&val3=" + '' + "&dsqlid=SP_SEL_CFCODE_CK";
    }
    else
    {
        var fpath = System.RootURL + "/standard/forms/60/08/60080110_popup_acc_code.aspx?col_nm=Code Name&col_code=Code&company=" + lstCompany.value + '&comm_code=&comm_nm=&'+"&val1=" + '' + "&val2=" + '' + "&val3=" + '' + "&dsqlid=SP_SEL_CFCODE";
    }
    
     
        var aValue = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
        if (aValue != null)
        {
            if(aValue[0] != "")
            {
                 txtCFPK.text = aValue[2];
                 txtCFCode.text = aValue[0];
                 txtCFName.text = aValue[1];
                for (i = 2; i < grdDailyCF.rows; i++)
                {
                    if (grdDailyCF.GetGridData(i,0)=="-1")
                    {
                        grdDailyCF.SetGridText(i,12,txtCFCode.text);
                    }
                }  
            }
        } 
        else
        {
           txtCFPK.text ="";
           txtCFCode.text = "";
           txtCFName.text = ""; 
        }
}
function onGetIndirectCFCode()
{
    if (lstDNDT.value == "DN")
    {
        var fpath = System.RootURL + "/standard/forms/60/08/60080110_popup_acc_code.aspx?col_nm=Code Name&col_code=Code&company=" + lstCompany.value + '&comm_code=&comm_nm=&'+"&val1=" + '' + "&val2=" + '' + "&val3=" + '' + "&dsqlid=SP_SEL_CF_INDIRECTCODE";
    }
    else if (lstDNDT.value == "CK")
    {
        var fpath = System.RootURL + "/standard/forms/60/08/60080110_popup_acc_code.aspx?col_nm=Code Name&col_code=Code&company=" + lstCompany.value + '&comm_code=&comm_nm=&'+"&val1=" + '' + "&val2=" + '' + "&val3=" + '' + "&dsqlid=SP_SEL_CF_INDIRECTCODE";
    }
    else
    {
        var fpath = System.RootURL + "/standard/forms/60/08/60080110_popup_acc_code.aspx?col_nm=Code Name&col_code=Code&company=" + lstCompany.value + '&comm_code=&comm_nm=&'+"&val1=" + '' + "&val2=" + '' + "&val3=" + '' + "&dsqlid=SP_SEL_CF_INDIRECTCODE";
    }      
        var aValue = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
        if (aValue != null)
        {
            if(aValue[0] != "")
            {
                 txtICFPK.text = aValue[2];
                 txtICFCode.text = aValue[0];
                 txtICFName.text = aValue[1];
                for (i = 2; i < grdDailyCF.rows; i++)
                {
                    if (grdDailyCF.GetGridData(i,0)=="-1")
                    {
                        grdDailyCF.SetGridText(i,13,txtICFCode.text);
                    }
                }  
            }
        } 
        else
        {
           txtICFPK.text ="";
           txtICFCode.text = "";
           txtICFName.text = ""; 
        }
}
function onGetAccDr()
{
	var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=Y&val2=Y&val3=" +lstCompany.value + "&dsqlid=SP_SEL_ACCT_POPUP";
	o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
	if ((o != null)&& (o[0]!="0"))
	{
			txtAccPKDr.SetDataText(o[3]);
			txtAccCodeDr.SetDataText(o[0]);
			txtAccNameDr.SetDataText(o[1]);
	}
	else
	{
	       txtAccPKDr.text = "";
	       txtAccCodeDr.text = ""; 
	       txtAccNameDr.text = ""; 
	}
}
function onGetAccCr()
{
    	var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=Y&val2=Y&val3=" +lstCompany.value + "&dsqlid=SP_SEL_ACCT_POPUP";
	o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
	if ((o != null)&& (o[0]!="0"))
	{
			txtAccPKCr.SetDataText(o[3]);
			txtAccCodeCr.SetDataText(o[0]);
			txtAccNameCr.SetDataText(o[1]);
	}
	else
	{
	       txtAccPKCr.text = "";
	       txtAccCodeCr.text = ""; 
	       txtAccNameCr.text = ""; 
	}
}

function onSave()
{
    datDailyCF.Call('');
}
function checkAll()
{
    if (chkAll.value=="T")
   { 
        for (i = 2; i < grdDailyCF.rows; i++)
        {
            grdDailyCF.SetGridText(i,0,"-1");
        } 
    }
   else
   {
         for (i = 2; i < grdDailyCF.rows; i++)
        {
            grdDailyCF.SetGridText(i,0,"0");
        } 
   } 
}
function onProcess()
{
    if (confirm("Do you want to process direct code ?"))
   { 
        datProcessAutoDailyCF.Call(); 
    }
}
function onReport()
{
    
    switch (lstReportType.value)
    {
        case "1":
            url = '/standard/reports/gf/hg/gfhg00070.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
            url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value+'&AccDr='+txtAccPKDr.text+'&AccCr='+txtAccPKCr.text+'&DirectCode='+txtCFCode.text+'&IndirectCode='+txtICFCode.text;
        break;
        case "2":
            
        break;
         case "3":
            
        break;
        case "4":
            url = '/standard/reports/gf/hg/gfhg00070_Tab4.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
            url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value+'&AccDr='+txtAccPKDr.text+'&AccCr='+txtAccPKCr.text+'&DirectCode='+txtCFCode.text+'&IndirectCode='+txtICFCode.text;
        break;
        case "5":
            url = '/standard/reports/gf/hg/gfhg00070_Tab5.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
            url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value+'&AccDr='+txtAccPKDr.text+'&AccCr='+txtAccPKCr.text+'&DirectCode='+txtCFCode.text+'&IndirectCode='+txtICFCode.text;
       break;
        
    }
   System.OpenTargetPage( System.RootURL+url , 'newform' ); 
}
function OnChangeTab()
{
    
}
</script>
<body style="margin:0; padding:0;">
<gw:data id="datDailyCF" onreceive="OnDataReceive(this)"  >
    <xml> 
    <dso id="1" type="grid"  parameter="2,3,5,6,7,12,13,14,15"  function="ac_sel_60060080_daily_cf" procedure="ac_upd_60060080_daily_cf" >
       <input bind="grdDailyCF" >
            <input bind="lstCompany" />
            <input bind="txtSeq" />
            <input bind="txtVoucher_No" />
            <input bind="dtbFrom" />
            <input bind="dtbTo" />
            <input bind="txtAccPKDr" />
            <input bind="txtAccPKCr" />
            <input bind="rdoSlipStatus" />
            <input bind="txtCFCode" />
            <input bind="txtICFCode" />
            <input bind="lstDNDT" />
        </input> 
        <output bind="grdDailyCF" />
    </dso>
    </xml>
</gw:data>


<gw:data id="datCFAmount" onreceive="OnDataReceive(this)"  >
    <xml> 
    <dso id="2" type="grid"   function="ac_sel_60060080_cashflow" >
       <input bind="grdCFAmt" >
            <input bind="lstCompany" />
            <input bind="dtbFrom" />
            <input bind="dtbTo" />
            <input bind="rdoSlipStatus" />
            <input bind="lstLang" />
            <input bind="lstDNDT" />
            
        </input> 
        <output bind="grdCFAmt" />
    </dso>
    </xml>
</gw:data>

<gw:data id="datProcessAutoDailyCF" onreceive="OnDataReceive(this)"  >
    <xml> 
    <dso id="2" type="process" parameter="0,1,2,3" procedure="ac_pro_60060080_daily_cf" >
       <input >
            <input bind="lstCompany" />
            <input bind="dtbFrom" />
            <input bind="dtbTo" />
            <input bind="rdoSlipStatus" />
        </input> 
        <output>
                <input bind="txtReturn" />
        </output>
    </dso>
    </xml>
</gw:data>

<gw:data id="datCFAmountI_D" onreceive="OnDataReceive(this)"  >
    <xml> 
    <dso id="3" type="grid"  function="ac_sel_60060080_cashflow_i_d" >
       <input bind="grdCFAmtI_D" >
            <input bind="lstCompany" />
            <input bind="dtbFrom" />
            <input bind="dtbTo" />
            <input bind="rdoSlipStatus" />
            <input bind="lstLang" />
            <input bind="lstDNDT" />
        </input> 
        <output bind="grdCFAmtI_D" />
    </dso>
    </xml>
</gw:data>



<gw:data id="datDailyCF_ACCD" onreceive="OnDataReceive(this)" >
    <xml> 
    <dso id="1" type="grid" parameter="2,3,5,6,7,12,13,14,15"  function="ac_sel_60060080_daily_cf_accd">
       <input bind="grdDailyCF_ACCD" >
            <input bind="lstCompany" />
            <input bind="txtSeq" />
            <input bind="txtVoucher_No" />
            <input bind="dtbFrom" />
            <input bind="dtbTo" />
            <input bind="txtAccPKDr" />
            <input bind="txtAccPKCr" />
            <input bind="rdoSlipStatus" />
            <input bind="txtCFCode" />
            <input bind="txtICFCode" />
            <input bind="lstDNDT" />
        </input> 
        <output bind="grdDailyCF_ACCD" />
    </dso>
    </xml>
</gw:data>

<gw:data id="datDailyCF_CUST" onreceive="OnDataReceive(this)"  >
    <xml> 
    <dso id="1" type="grid"  parameter="2,3,5,6,7,12,13,14,15"  function="ac_sel_60060080_daily_cf_cust">
       <input bind="grdDailyCF_CUST" >
            <input bind="lstCompany" />
            <input bind="txtSeq" />
            <input bind="txtVoucher_No" />
            <input bind="dtbFrom" />
            <input bind="dtbTo" />
            <input bind="txtAccPKDr" />
            <input bind="txtAccPKCr" />
            <input bind="rdoSlipStatus" />
            <input bind="txtCFCode" />
            <input bind="txtICFCode" />
            <input bind="lstDNDT" />
        </input> 
        <output bind="grdDailyCF_CUST" />
    </dso>
    </xml>
</gw:data>

  <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="AC_pro_60020020_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	
  



<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="10%"></td>
                        <td width="20%"></td>
                        <td width="9%"></td>
                        <td width="18%"></td>
                        <td width="10%"></td>
                        
                        <td width="9%"></td>
                        <td width="20%"></td>
                        <td width="2%"></td>
                        <td width="2%"></td>
                    </tr> 
                    
                    <tr>
                        <td align="right" >Company</td>
                        <td ><gw:list id="lstCompany" styles="width:100%;" ></gw:list></td>
                        <td align="right">Voucher No/Seq</td>
                        <td><gw:textbox id="txtVoucher_No" styles="width:40%" onenterkey="onSearch()"/>
                        <gw:textbox id="txtSeq" styles="width:40%" onenterkey="onSearch()" /></td>
                       
                        <td >Language</td>
				        <td ><gw:list id="lstLang" onchange="OnChangeLang()" styles='width:100%' /></td>
                        <td>
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                       <td align="right" >Status</td>
                                        <td >
                                            <gw:radio id="rdoSlipStatus"  value="2" > 
                                                <span value="2" >Confirmed</span>
                                            </gw:radio >
                                        </td>
                                        
                                        
                                        
				                            
                                </tr>
                            </table>
                        </td>
                        <td><gw:imgBtn id="ibtnSearch" img="search" alt="Search" onclick="onSearch()" /></td>
                        <td><gw:imgBtn id="ibtnSearch" img="save" alt="Save" onclick="onSave()" /></td>
                    </tr>
                    <tr>
                         <td align="right">Proposed Date</td>
                        <td  align="left" >
                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="45%" align="left"><gw:datebox id="dtbFrom" lang="<%=Application("Lang")%>" mode="01" onchange="" /></td>
                                    <td width="10%" align="center"><b>&nbsp;~&nbsp;</b></td>
                                    <td width="45%" align="right"><gw:datebox id="dtbTo" lang="<%=Application("Lang")%>" mode="01" onchange="" /></td>
                                </tr>
                                </table>
                        </td>
                         <td align="center">Check All</td>
                        <td><gw:checkbox id="chkAll" value="F" onclick="checkAll()" /><gw:list id="lstDNDT" styles="width:100%;" ></gw:list></td>
                        <td  align="right" ><a onclick="onGetAccDr()" href="#" title="Get Account">Acc. Code Debit</a></td>
                        <td ><gw:textbox id="txtAccPKDr" styles="display:none;"/> <gw:textbox id="txtAccCodeDr" text="" maxlen = "6" styles='width:100%'/></td>
                        <td ><gw:textbox id="txtAccNameDr" text="" maxlen = "100" styles='width:100%'/></td>
                        <td ><gw:imgBtn id="btnResetAccDr" img="reset" alt="Reset Account" onclick="onResetAccDr()" /></td>  
                       <td><gw:imgBtn id="btnProcess" img="process" alt="Process" onclick="onProcess()" /></td>
                    </tr>
                    <tr>
                        <td align="right"><a onclick="onGetCFCode()" href="#" title="Get Code">Direct Code</a></td>
                        <td >
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                  <tr>
                                        <td width="30%"><gw:textbox id="txtCFPK" styles="display:none;"/> <gw:textbox id="txtCFCode" text=""  styles='width:100%'/></td>
                                        <td width="60%"><gw:textbox id="txtCFName"  maxlen = "100" styles='width:100%'/></td>
                                        <td width="10%"><gw:imgBtn id="btnResetCF" img="reset" alt="Reset CF" onclick="onResetCF()" /></td>    
                                </tr>
                            </table>
                        </td>
                        <td align="right"><a onclick="onGetIndirectCFCode()" href="#" title="Get Code">Indirect Code</a></td>
                        <td>
                                 <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                  <tr>
                                        <td width="30%"><gw:textbox id="txtICFPK" styles="display:none;"/> <gw:textbox id="txtICFCode" text=""  styles='width:100%'/></td>
                                        <td width="60%"><gw:textbox id="txtICFName"  maxlen = "100" styles='width:100%'/></td>
                                        <td width="10%"><gw:imgBtn id="btnIResetCF" img="reset" alt="Reset Indirect CF" onclick="onResetICF()" /></td>    
                                </tr>
                            </table>
                        </td>
                        <td align="right" ><a onclick="onGetAccCr()" href="#" title="Get Account">Acc. Code Credit</a></td>
                        <td ><gw:textbox id="txtAccPKCr" styles="display:none;"/> <gw:textbox id="txtAccCodeCr" text="" maxlen = "6" styles='width:100%'/></td>
                        <td ><gw:textbox id="txtAccNameCr" text="" maxlen = "100" styles='width:100%'/></td>
                        <td ><gw:imgBtn id="btnResetAccCr" img="reset" alt="Reset Account" onclick="onResetAccCr()" /></td>  
                        <td></td>
                    </tr>
                    
                    <tr>
                        <td align="right"></td>
                        <td >
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                  <tr>
                                        
                                </tr>
                            </table>
                        </td>
                        <td align="right"></td>
                        <td>
                                 <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                  <tr>
                                        
                                </tr>
                            </table>
                        </td>
                        <td align="right" ></td>
                        <td ></td>
                        <td ><gw:list id="lstReportType" styles="width:100%;" ></gw:list></td>
                        <td ></td>  
                        <td><gw:imgBtn id="btnReport" img="printer" alt="Report" onclick="onReport()" /></td>
                    </tr>
                    
                    
                    
            </table>            
        </td>
    </tr>
   </table> 
   
    <gw:tab id="tabMain" border=1 style="width:100%;" onpageactivate="" onclick ="OnChangeTab()"> 
   <table name="Daily Entry C.F Inquiry" width ="100%" cellpadding ="0" cellspacing ="0" border="1" >
          <tr>
                <td width ="100%">
                     <gw:grid id='grdDailyCF'
header='CHK|STT|R_PK|HPK|TAC_HGTRD_PK|TAC_ABACCTCODE_PK_DR|TAC_ABACCTCODE_PK_CR|DRCR_ORD|TR_DATE|VOUCHERNO|ACDR|ACCR|CF_CODE|ICF_CODE|CF Code Internal|TR_AMT|TR_BOOKAMT|REMARK2|REMARK'
format='3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|2|2|0|0'
defaults='||||||||||||||||||'
editcol='1|0|0|0|0|0|0|0|0|0|0|0|1|1|0|0|0|0|0'
widths='1000|1000|0|0|0|0|0|0|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
sorting='T'
styles='width:100%; height:360'
oncelldblclick='onGridDbClick()'
/>
            </td>
        </tr>
</table>
   <table name="Cash Flow Amount(Direct)" width ="100%" cellpadding ="0" cellspacing ="0" border="1" >
          <tr>
                <td width ="100%">
                        <gw:grid id = 'grdCFAmt'
                            header='No|_PRN_SEQ|Code|Name|Amount'
                            format='0|0|0|0|0'
                            aligns='0|0|0|0|0'
                            defaults='||||'
                            editcol='0|0|0|0|0'
                            widths='1000|0|1000|1000|1000'
                            sorting='T'
                            styles='width:100%; height:360'
                            />
                </td>
        </tr>
    </table>
    
    <table name="Cash Flow Amount(InDirect)" width ="100%" cellpadding ="0" cellspacing ="0" border="1" >
          <tr>
                <td width ="100%">
                        <gw:grid id = 'grdCFAmtI_D'
                            header='No|_PRN_SEQ|Code|Name|Amount'
                            format='0|0|0|0|0'
                            aligns='0|0|0|0|3'
                            defaults='||||'
                            editcol='0|0|0|0|0'
                            widths='1000|0|1000|1000|1000'
                            sorting='T'
                            styles='width:100%; height:360'
                            />
                </td>
        </tr>
    </table>
    
    
    
     <table name="Daily Entry C.F ACCD" width ="100%" cellpadding ="0" cellspacing ="0" border="1" >
          <tr>
                <td width ="100%">
                     <gw:grid id='grdDailyCF_ACCD'
                        header='Direct Code|InDirect Code|Debit Code|Debit Code|Credit Code|Credit Code|Amount'
                        format='0|0|0|0|0|0|1'
                        aligns='0|0|0|0|0|0|3'
                        defaults='|||||||'
                        editcol='1|1|0|0|0|0|0'
                        widths='1000|1000|1500|3000|1500|2000|3000|1000'
                        sorting='T'
                        styles='width:100%; height:360'
                        oncelldblclick='onGridDbClick()'
                        />
            </td>
        </tr>
    </table>

    <table name="Daily Entry C.F Partner" width ="100%" cellpadding ="0" cellspacing ="0" border="1" >
          <tr>
                <td width ="100%">
                     <gw:grid id='grdDailyCF_CUST'
                        header='Direct Code|InDirect Code|Debit Code|Credit Code|Partner ID|Partner Name|Amount'
                        format='0|0|0|0|0|0|1'
                        aligns='0|0|0|0|0|0|3'
                        defaults='|||||||'
                        editcol='1|1|0|0|0|0|0'
                        widths='1000|1000|1500|1500|1500|2000|3000|1000'
                        sorting='T'
                        styles='width:100%; height:360'
                        oncelldblclick='onGridDbClick()'
                        />
            </td>
        </tr>
    </table>
    
   </gw:tab>
   
    <gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
    <gw:textbox id="txtReturn"  styles='display:none;'/>
    <gw:textbox id="txtAc_level" styles='display:none' />
    <gw:textbox id="txtSesion_company" styles='display:none' />
<gw:textbox id="txtProposedByUserPk"  styles='display:none' />
   
</body>
</html>
