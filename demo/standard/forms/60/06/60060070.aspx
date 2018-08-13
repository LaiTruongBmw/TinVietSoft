 <!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Daily Entry Inquiry</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script type="text/javascript" language="javascript">
var report_type = 0;//AS:10, NKC:20
var form_type = 60; //Trans+ book 10; book :20
var tab_index = 0;
function BodyInit()
{
   //a
    
    var ls_data = "<%=CtlLib.SetListDataSQL("SELECT 0 C1,'Select ALL' C2  FROM DUAL UNION ALL SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data);
    
   BindingDataList();
    
   txtACCD.SetEnable(false);
   txtACNM.SetEnable(false);
   txtPLC_CD.SetEnable(false);
   txtPLC_NM.SetEnable(false);
   txtTCO_BUSPARTNER_CD.SetEnable(false);
   txtTCO_BUSPARTNER_NM.SetEnable(false);
    
}

function BindingDataList()
{
    System.Translate(document);
    
    var ls_data1 = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='COAB0070' and d.use_yn = 'Y' ORDER BY D.DEF_YN DESC, D.ORD")%>";
    var ls_data2 = "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK005' ORDER BY D.DEF_YN DESC, D.ORD ")%>";
    var ls_data3 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
    var ls_Amount = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='ACBG0170' and d.use_yn = 'Y' ORDER BY D.DEF_YN DESC, D.ORD")%>";
    
    //var ls_Amount = "DATA|1|Trans & Book|2|Book|3|Trans";
    
        
    
    
    ls_data = "<%=CtlLib.SetListDataFUNC("SELECT AC_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
    lstLanguage.SetDataText(ls_data1);
    lstReportType.SetDataText(ls_data2);
    lstBookCcy.SetDataText(ls_data3);
    
    lstAmount.SetDataText(ls_Amount);
    var data = "<%=CtlLib.SetListDataFUNC("SELECT AC_GET_COMMONCODE('ACBG0130') FROM DUAL")%>";
    lstVCType.SetDataText(data+ "|ALL|Select ALL");
    lstVCType.SetDataText("ALL");
//   format grid detail
//   grdDailyInquiry 
   grdDailyInquiry.AddRow();
   MergeHeaderGrid();
   FormatGridCol();
   txtTotalDebit.SetEnable(false);
   txtTotalCredit.SetEnable(false);
      
    txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	 dso_getCompany.Call();
}

function MergeHeaderGrid()
{
	    var fg = grdDailyInquiry.GetGridControl();
	    fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true; //Format all col merge : Fone = Bold		
        fg.FixedRows = 2;
        fg.MergeCells =5;
		fg.MergeRow(0) = true;
        // Acc
        fg.MergeCol(0) = true;
        fg.Cell(0,0,0,1,0)  = "Seq";
        fg.MergeCol(1) = true;
        fg.Cell(0,0,1,1,1)  = "Trans Date";
        fg.MergeCol(2) = true;
        fg.Cell(0,0,2,1,2)  = "Voucher No";
        
        fg.Cell(0,0,3,0,4) = "Account";
        fg.Cell(0,1,3,1,3) = "Code";
        fg.Cell(0,1,4,1,4) = "Name";
        
        fg.Cell(0,0,5,0,6) = "Trans Amt";
        fg.Cell(0,1,5,1,5) = "Debit";
        fg.Cell(0,1,6,1,6) = "Credit";
        
        fg.Cell(0,0,7,0,8) = "Books Amt";
        fg.Cell(0,1,7,1,7) = "Debit";
        fg.Cell(0,1,8,1,8) = "Credit";
        
        fg.Cell(0,0,9,0,10) = "Description";
        fg.Cell(0,1,9,1,9) = "Foreign";
        fg.Cell(0,1,10,1,10) = "Local";
        //Paertner
        fg.MergeCol(13) = true;
        fg.Cell(0,0,13,1,13) = "Partner ID";
        //Cost center
        fg.MergeCol(14) = true;
        fg.Cell(0,0,14,1,14) = "Cost Center";
        
        fg.Cell(0,0,15,0,16) = "Partner";
        fg.Cell(0,1,15,1,15) = "Code";
        fg.Cell(0,1,16,1,16) = "Name";
        
        fg.Cell(0,0,17,0,18) = "PL Center";
        fg.Cell(0,1,17,1,17) = "Code";
        fg.Cell(0,1,18,1,18) = "Name";

		fg.Cell(0,0,21,0,22) = "Employee";
        fg.Cell(0,1,21,1,21) = "Code";
        fg.Cell(0,1,22,1,22) = "Name";
        System.Translate(document);
}


function FormatGridCol()
{
        var fg = grdDailyInquiry.GetGridControl();
        fg.ColWidth(0) = "800";//Seq
        fg.ColWidth(1) = "1100";//Trans Date
        fg.ColWidth(2) = "1100";//Voucher No
        fg.ColWidth(3) = "1200";//Account Code
        fg.ColWidth(4) = "2000";//Account Name
        
        if (form_type==10)//Trans +book
        {
            fg.ColWidth(5) = "1500";
            fg.ColWidth(6) = "1500";
            fg.ColWidth(7) = "1500";
            fg.ColWidth(8) = "1500";
        }
         else if(form_type==20)//book
        {
            fg.ColWidth(5) = "0";
            fg.ColWidth(6) = "0";
            fg.ColWidth(7) = "1500";
            fg.ColWidth(8) = "1500";
        }
        else if(form_type==30)
        {
            fg.ColWidth(5) = "1500";
            fg.ColWidth(6) = "1500";
            fg.ColWidth(7) = "0";
            fg.ColWidth(8) = "0";
        }
        
         fg.ColWidth(9) = "2000";
         fg.ColWidth(10) = "3000";
         fg.ColWidth(11) = "1500";
}
function OnResetAccount()
{
	txtACPK.text ='';
	txtACCD.text ='';
	txtACNM.text ='';
}
function OnResetPLCenter()
{
	txtPLC_PK.text ='';
	txtPLC_CD.text ='';
	txtPLC_NM.text ='';
}
function ResetPartner()
{
    txtTCO_BUSPARTNER_PK.text = "";
    txtTCO_BUSPARTNER_CD.text = "";
    txtTCO_BUSPARTNER_NM.text = "";
}

function onSearch()
{
    if (tab_index ==0)
   { 
        datDaily_Entry_Inquiry.Call("SELECT");
    }
   else
   {
        datDaily_Entry_Inquiry_Sum.Call("SELECT");
   } 
}

function OnPopUp(pname)
{
    if (pname=='ACCT')
   {
         var fpath = System.RootURL + "/standard/forms/60/06/60060070_account.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=AC_SEL_ACCD_PL";
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
        var fpath   = System.RootURL + "/standard/forms/60/06/60060070_pl_unit.aspx?";          
            var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
            if ( object != null )  
            {
                if (object[0] != 0)
                {
                    txtPLC_PK.text = object;     // Center PK
                    dat_PLUNIT.Call();
                }            
            }        
   }
   if(pname=='CUSTOMER')
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
}

function OnDataReceive(dsql_id)
{
    if (dsql_id.id =="datDaily_Entry_Inquiry")
   {
        MergeHeaderGrid();
        FormatGridCol();    
		var grd = grdDailyInquiry.GetGridControl();
		grd.AutoSizeMode = 0;
		//grd.AutoSize(g_formual,g_formual);
		grd.AutoSize(0,3);
		grd.AutoSize(5,8);
		grd.AutoSize(15);
		grd.AutoSize(17);		
        datDaily_Entry_Inquiry_TotalDC.Call();
   } 
}

function onChangeFormat()
{
      if (lstAmount.value =="1")//Trans & Books
        {
            form_type=10;
        }
       else if(lstAmount.value =="2")//Books
        {//sp_sel_gfka00220_2
        FormatGridCol();
        }
}
function OnDataError(dsql_id)
{
     if (dsql_id.id =="datDaily_Entry_Inquiry")
   {
        
   } 
   if (dsql_id.id =="datDaily_Entry_Inquiry_TotalDC")
   {
        alert(dsql_id.errmsg);
   } 
}


function OnChangeTab()
{
	var i = tabMain.GetCurrentPageNo();
	tab_index =  i;
}

function GetRowPK(row_index)
{
    if(tabMain.GetCurrentPageNo()=='0')
    {
        if((row_index < grdDailyInquiry.rows) && (row_index > 0)){
            return grdDailyInquiry.GetGridData(row_index, 0);
        }        
    }
    else if(tabMain.GetCurrentPageNo()=='1')
    {
    //grdDailyInquirySum
        if((row_index < grdDailyInquirySum.rows) && (row_index > 0)){
            return grdDailyInquirySum.GetGridData(row_index, 0);
        }            
    }
    
    return -1;
}

function onGridDbClick(index)
{
    var rows =0;
    var rownum =0;
 
    var pk = 0;
    var status = "";
    var ls_arr = ""; 
    if (index == 0)
   {
        var ctrl = grdDailyInquiry.GetGridControl();
        rows = ctrl.Rows;
        rows = rows - 2;
        rownum = ctrl.row;
        pk = grdDailyInquiry.GetGridData(ctrl.row, 0);
        status = grdDailyInquiry.GetGridData(ctrl.row, 11);

   }
   if (index == 1)
   {
         var ctrl = grdDailyInquirySum.GetGridControl();
        rows = ctrl.Rows;
        rows = rows - 1;
        rownum = ctrl.row;
        pk = grdDailyInquirySum.GetGridData(ctrl.row, 0);
        status = grdDailyInquirySum.GetGridData(ctrl.row, 6);

   } 
   
    if(index == 0)
    {
        this.name = "gfhg00050_0";
    }
    else
    {
        this.name = "gfhg00050_1";
    }
   
    if (rownum > 0) 
    {
        var fpath = System.RootURL + '/standard/forms/gf/hg/gfhg00020_popup.aspx?PK_ROW=' + pk + '&ROW=' + rownum + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
        var wWidth = 950;
        var wHeight = 600;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);
        
        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +"lef="+ x +",top=" + y;
        var object = System.OpenModal(fpath, wWidth, wHeight, features, window);
    }
   
}

function OnReport(lang)
{
    
    switch(lang)
    {
        case "ENG":
        
            
                var url ="";
                switch (lstReportType.value)
                {
                    case "AS":
                        url = '/standard/reports/gf/hg/gfhg00050_DailyEntryInq_ENG.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                        url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value+'&Lang='+lstLanguage.value + '&Account=' + txtACPK.text + '&customer=' + txtTCO_BUSPARTNER_PK.text + '&plunit=' + txtPLC_PK.text+'&p_list_amount='+lstAmount.value;
                    break;
					case "AS_2":
                        url = '/standard/reports/60/06/rpt_60060070_asform.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                        url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value+'&Lang='+lstLanguage.value + '&Account=' + txtACPK.text + '&customer=' + txtTCO_BUSPARTNER_PK.text + '&plunit=' + txtPLC_PK.text+'&Desc='+txtDescription.text+'&Voucher_type='+lstVCType.value;
                    break;
                    case "S03a-DN":
                        url ='/standard/reports/gf/hg/gfhg00050_SoNKC_S03a-DN_ENG.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                        url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value;
                    break;
                     case "S03a-DN-TNDN":
                        url ='/standard/reports/gf/hg/gfhg00050_SoNKC_S03a-DN-TNDN.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                        url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value;
                    break;
                    case "S03a-DN-PHT":
                         url ='/standard/reports/gf/hg/gfhg00050_SoNKC_S03a-DN_phieuHToan.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                         url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value;
                    break;
                    case "tmp":
                         url ='/standard/reports/gf/hg/gfhg00050_SoNKC_S03a-DN-TNDN(Invalid).aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                         url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value;
                   break;
                   case "S03a-DN-NB":
                        url ='/standard/reports/gf/hg/gfhg00050_SoNKC_S03a-DN_ENG_CostCenter.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                        url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value;                   
                        //alert('test');                        
                   break ;                   
                }
               System.OpenTargetPage( System.RootURL+url , 'newform' ); 
     break;
     case "VIE":
         if(confirm("Are you sure you want to report ?" ))
            {
                var url ="";
                switch (lstReportType.value)
                {
                    case "AS":
                        url = '/standard/reports/gf/hg/gfhg00050_DailyEntryInq_VN.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                        url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value+'&Lang='+lstLanguage.value+'&p_list_amount='+lstAmount.value;
                    break;
                    case "S03a-DN":
                        url ='/standard/reports/gf/hg/gfhg00050_SoNKC_S03a-DN_VIE.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                        url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value;
                    break;
                     case "S03a-DN-TNDN":
                        url ='/standard/reports/gf/hg/gfhg00050_SoNKC_S03a-DN-TNDN.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                        url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value;
                    break;
                    case "S03a-DN-PHT":
                         url ='/standard/reports/gf/hg/gfhg00050_SoNKC_S03a-DN_phieuHToan.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                         url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value;
                    break;
                    case "tmp":
                         url ='/standard/reports/gf/hg/gfhg00050_SoNKC_S03a-DN-TNDN(Invalid).aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                         url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value;
                    break;
                   case "S03a-DN-NB":
                        url ='/standard/reports/gf/hg/gfhg00050_SoNKC_S03a-DN_ENG_CostCenter.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                        url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value;                   
                        //alert('test');                        
                   break ;       
                   case "S03a-DN_CUST":
                        url ='/standard/reports/gf/hg/gfhg00050_SoNKC_S03a-DN_VIE_CUST.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                        url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value;
                        url= url+'&acpk='+txtACPK.text+'&partner_pk='+txtTCO_BUSPARTNER_PK.text+'&vctype='+lstVCType.value;
                    break;   
					case "S03a-DN_CUST_PL":
                        url ='/standard/reports/gf/hg/gfhg00050_SoNKC_S03a-DN_VIE_CUST_PL.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                        url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value;
                        url= url+'&acpk='+txtACPK.text+'&partner_pk='+txtTCO_BUSPARTNER_PK.text+'&vctype='+lstVCType.value;
                    break;   			
                }
               System.OpenTargetPage( System.RootURL+url , 'newform' ); 
            } 
     break;
     
     case "ENG-VIE":
         if(confirm("Are you sure you want to report ?" ))
            {
                var url ="";
                switch (lstReportType.value)
                {
                    case "AS":
                        url = '/standard/reports/gf/hg/gfhg00050_DailyEntryInq_VN.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                        url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value+'&Lang='+lstLanguage.value+'&p_list_amount='+lstAmount.value;
                    break;
                    case "S03a-DN":
                        url ='/standard/reports/gf/hg/gfhg00050_SoNKC_S03a-DN.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                        url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value;
                    break;
                     case "S03a-DN-TNDN":
                        url ='/standard/reports/gf/hg/gfhg00050_SoNKC_S03a-DN-TNDN.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                        url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value;
                    break;
                    case "S03a-DN-PHT":
                         url ='/standard/reports/gf/hg/gfhg00050_SoNKC_S03a-DN_phieuHToan.aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                         url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value;
                    break;
                    case "tmp":
                         url ='/standard/reports/gf/hg/gfhg00050_SoNKC_S03a-DN-TNDN(Invalid).aspx?DateFrom=' + dtbFrom.value+'&DateTo=' +dtbTo.value+'&Voucher='+txtVoucher_No.text;
                         url= url+'&Seq='+txtSeq.text+'&Company='+lstCompany.value+'&Status='+rdoSlipStatus.value+'&BookCcy='+lstBookCcy.value;
                    break;
                }
               System.OpenTargetPage( System.RootURL+url , 'newform' ); 
            } 
     break;
  } 
   
}
</script>
<body style="margin:0; padding:0;">

<gw:data id="datDaily_Entry_Inquiry" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
        <xml>
            <dso type="grid"  function="ac_sel_60080050_daily_inquiry">
                <input bind="grdDailyInquiry">
                    <input bind="lstCompany"/>
                    <input bind="dtbFrom"/>
                    <input bind="dtbTo"/>
                    <input bind="txtACPK" />
                    <input bind="txtTCO_BUSPARTNER_PK" />
                    <input bind="txtPLC_PK" />
                    <input bind="rdoSlipStatus"/>
                    <input bind="txtVoucher_No"/>
                    <input bind="txtSeq"/>
                    <input bind="txtDescription"/>
                    <input bind="lstLanguage"/>
                    <input bind="lstVCType"/>
                </input>
                <output bind="grdDailyInquiry"/>
 
            </dso>
        </xml>
    </gw:data>
   
   <gw:data id="datDaily_Entry_Inquiry_Sum" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
        <xml>
            <dso type="grid"  function="AC_SEL_60060070_SUM">
                <input bind="grdDailyInquirySum">
                    <input bind="lstCompany"/>
                    <input bind="dtbFrom"/>
                    <input bind="dtbTo"/>
                    <input bind="rdoSlipStatus"/>
                    <input bind="txtVoucher_No"/>
                    <input bind="txtSeq"/>
                    <input bind="lstLanguage"/>
                    <input bind="lstVCType"/>
                </input>
                <output bind="grdDailyInquirySum"/>
            </dso>
        </xml>
    </gw:data> 
   
   <gw:data id="datDaily_Entry_Inquiry_TotalDC" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
        <xml>
            <dso type="process"  procedure ="AC_SEL_60060070_TOTAL_DC" >
            <input>
            <input bind="lstCompany" />
            <input bind="dtbFrom"/>
            <input bind="dtbTo" />
            <input bind="rdoSlipStatus" />
            <input bind="txtVoucher_No"/>
            <input bind="txtSeq" />
            </input>
            <output>
            <output bind="txtTotalDebit" />
            <output bind="txtTotalCredit" />
            </output>
            </dso>
        </xml>
    </gw:data>  
<gw:data id="dat_PLUNIT" onreceive=""  > 
        <xml>
            <dso  type="process"   procedure="AC_SEL_PL_UNIT"  > 
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
  
 
<table width="100%">
      <tr>
      <td>
      <fieldset>
     
            <table width="100%" border="0" cellpadding="0" cellspacing="0" >
            <tr>
                <td align="right" width="5%" >Company</td>
                 <td width="10%"><gw:list id="lstCompany" styles="width:100%;" ></gw:list></td>
            <td align="right" width="10%" ><a title="Click here to show Account" onclick="OnPopUp('ACCT')" href="#tips" ><b>Acc. Code</b></a></td>
            <td width="30%">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td width="95%">
                                                    <gw:textbox id="txtACCD" text="" styles='width:30%' /> 
                                                    <gw:textbox id="txtACNM" text="" styles='width:70%' /></td>
                                    <td><gw:imgBtn id="ibtnAccReset" img="reset"  alt="reset acc" onclick="OnResetAccount()" /></td>
                                </tr>
                            </table>
            </td>
            <td align="right" width="10%">Voucher No</td>
            <td  width="20%" ><gw:textbox id="txtVoucher_No" styles="width:100%"  onenterkey="onSearch()"/></td>
            
             <td align="right"  >Seq</td>
             <td width="15%" colspan="4"><gw:textbox id="txtSeq" styles="width:100%" onenterkey="onSearch()"  /></td>
            <td ><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"    onclick="onSearch()" /></td>
               
                <td ><gw:imgBtn id="ibtnReport" img="printer"   alt="Print Acct" onclick="OnReport(lstLanguage.GetData())" /></td>
            </tr>
            <tr>
                <td align="right" width="5%">Proposed Date</td>
                
                    <td  align="left" width="10%">
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td  ><gw:datebox id="dtbFrom" lang="<%=Application("Lang")%>" mode="01"  /></td>
                                        <td  ><b>~&nbsp;&nbsp;&nbsp;&nbsp;</b></td>
                                        <td  ><gw:datebox id="dtbTo" lang="<%=Application("Lang")%>" mode="01"  /></td>
                                    </tr>
                                    </table>
                 </td>
               
               <td align="right" width="10%"><a title="Click here to show customer" onclick="OnPopUp('CUSTOMER')" href="#tips" ><b>Partner</b></a></td>
                        <td width="30%">
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td width="95%" ><gw:textbox id="txtTCO_BUSPARTNER_PK" styles='display:none'></gw:textbox>
                                                     <gw:textbox id="txtTCO_BUSPARTNER_CD" styles='width:30%'/>
                                                     <gw:textbox id="txtTCO_BUSPARTNER_NM" styles='width:70%' /></td>
                                    <td><gw:imgBtn id="ibtnCustReset" img="reset"  alt="reset partner" onclick="ResetPartner()" /></td>
                                </tr>
                            </table>
                        </td>
                   <td align="right" width="10%">Amount</td>
                        <td width="20%"><gw:list id="lstAmount" styles="width:100%" onchange="onChangeFormat()"></gw:list></td>
                     <td  align="right"  >Language</td>
                    <td  width="15%" colspan="6"><gw:list id="lstLanguage" styles="width:100%" ></gw:list></td>   
            </tr>
            <tr>
              <td align="right" width="5%">Status</td>
                                        <td width="10%">
                                            <gw:radio id="rdoSlipStatus"  value="2" > 
                                                <span value="3" >All&nbsp;</span>
                                                <span value="1" >Saved&nbsp;</span>
                                                <span value="2" >Confirmed&nbsp;</span>
                                                <span value="0" >Approved&nbsp;&nbsp;</span>
                                            </gw:radio >
                                        </td>  
                                        
                 <td align="right" width="10%"><a title="Click here to select PL Unit" onclick="OnPopUp('CENTER')" href="#tips">PL Unit</a>&nbsp;</td>
                        <td width="30%"> 
                         <table width="100%" cellpadding="0" cellspacing="0" border="0">
                         <tr>
                         
                            <td width="95%"> <gw:textbox id="txtPLC_CD"  styles='width:30%' />
                                             <gw:textbox id="txtPLC_NM"  styles='width:70%' />
                                             <gw:textbox id="txtPLC_PK" styles="display:none; " /></td>
                                             <td align="right"><gw:imgbtn img="reset" alt="Reset" id="btnResetPLCenter" onclick="OnResetPLCenter()" /></td> 
                            </tr>
                            </table>
                        </td>
                        
                <td align="right" width="10%" >Report Type</td>
                <td width="20%" ><gw:list id="lstReportType" styles="width:100%;" ></gw:list></td> 
                
                <td align="right">Description</td>
                <td width="15%" colspan="6"><gw:textbox id="txtDescription" styles="width:100%"  onenterkey="onSearch()"/></td>
                                                                          
            </tr>    
             <tr>
              <td align="right" width="5%">Voucher Type</td>
                                        <td width="10%"><gw:list id="lstVCType" style="width:100%"  onchange="onSearch()"  /></td>  
                                        
                 <td align="right" width="10%"></td>
                        <td width="30%"> 
                         <table width="100%" cellpadding="0" cellspacing="0" border="0">
                         <tr>
                         
                            <td width="95%"> </td> 
                            </tr>
                            </table>
                        </td>
                        
                <td align="right" width="10%" ></td>
                <td width="20%" ></td> 
                
                <td align="right"></td>
                <td width="15%" colspan="6"></td>
                                                                          
            </tr>           
                   
             </table>
             </fieldset>
      </td>
      </tr>
    </table>
   
   <gw:tab id="tabMain" border=1 style="width:100%;" onpageactivate="" onclick ="OnChangeTab()">    
    <table name="Daily Entry Inquiry" border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
        <!--0.Seq|1.Trans Date|2.Voucher No|3.AC_CD|4.AC_NAME|5.TRANSAMTD|6.BOOKAMTD|7.TRANSAMTC|8.BOOKAMTC|9.REMARK|10.REMARK2
            |11_ORD|12_Status|13_Partner ID|14_Cost Center|15.CUS_CODE|16.CUS_NAME|17.ENTER_CODE|18.CENTER_NAME|19.EMP_ID|20.EMP_NM-->
            <td>
                    <gw:grid id='grdDailyInquiry'
                            header='Seq|Trans Date|Voucher No|AC_CD|AC_NAME|TRANSAMTD|BOOKAMTD|TRANSAMTC|BOOKAMTC|REMARK|REMARK2|_ORD|_Status|_Partner ID|_Cost Center|CUS_CODE|CUS_NAME|CENTER_CODE|CENTER_NAME|_EMP_ID|_EMP_NM|EMP_ID|EMP_nm'
                            format='0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                            aligns='0|0|0|0|0|3|3|3|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                            defaults='|||||||||||||||||||||0|0'
                            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                            widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|2000|2000|0|0|1000|1000|1000|1000|1000|1000|0|0|1000|2000'
                            sorting='T'
                            styles='width:100%; height:360'
                           oncelldblclick="onGridDbClick(0)" 
                            />
        </td>
    </tr> 
   <tr>
		<td >
			<table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#81d7f3" style="border-collapse: collapse">
				<tr>
				    <td width="11%" bgcolor="bde9ff"></td>
					<td width="28%" bgcolor="bde9ff" align="center">Total Books Amt</td>
					<td width="13%"><gw:textbox id="txtTotalDebit" format="#,###,###,###,###.##R" styles="width:100%;text-align: Right" type="number" /> </td>
					<td width="14%"><gw:textbox id="txtTotalCredit" format="#,###,###,###,###.##R" styles="width:100%;text-align: Right" type="number" /> </td>
					<td width="11%" bgcolor="bde9ff" align="center"></td>
					<td width="25%" bgcolor="bde9ff"></td>
				</tr>
			</table>
		</td>
	</tr> 
    </table>   
   
   <table name="Daily Entry Inquiry Sum By Seq" border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>
        <gw:grid id='grdDailyInquirySum'
            header='Seq|Trans Date|Voucher No|Total Books Amt (CR)|Total Books Amt (DR)|Diff Amount|_Status'
            format='0|4|0|0|0|0|0'
            aligns='0|0|0|3|3|3|0'
            defaults='||||||'
            editcol='0|0|0|0|0|0|0'
            widths='1000|2000|2500|2500|2500|1500|0'
            sorting='T'
            acceptNullDate="T"
            styles='width:100%; height:360'
            oncelldblclick="onGridDbClick(1)" 
            />
            </td>
       </tr>     
  </table>
   </gw:tab>


 
   
   
<gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
<gw:textbox id="txtACPK" styles="display:none; " />
<gw:textbox id="txtAc_level" styles='display:none' />
<gw:textbox id="txtSesion_company" styles='display:none' />
<gw:textbox id="txtProposedByUserPk"  styles='display:none' />
</body>
</html>
