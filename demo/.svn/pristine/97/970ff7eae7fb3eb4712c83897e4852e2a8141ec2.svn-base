<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Expense Inquiry</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">

function BodyInit()
{
    System.Translate(document);
	//dtFrom.SetDataText("201301"); dtFrom"/>dtTo
    BindingDataList();
	
    var std_ym = "<%=CtlLib.SetDataSQL("select max (std_ym)  from TAC_ICMMCLOSE where del_if = 0 and close_yn = 'Y'")%>";
	if(std_ym != ""){
		dtFrom.SetDataText(std_ym.substring(0,4)+"01");
		dtTo.SetDataText(std_ym);
	}
}

function BindingDataList()
{
    var ls_comp  = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_ccy  = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>||Select All";
    var ls_report   =  "<%=CtlLib.SetListDataSQL(" SELECT CODE, CODE_NM  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0020' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0  and code like '1%' order by a.DEF_YN desc , code ")%>";
    var ls_bookccy = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y'  ")%>";
    var ls_lang = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='COAB0070' and d.use_yn = 'Y' ORDER BY D.DEF_YN DESC, D.ORD")%>"
    var ls_search_type = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACAB066' and d.use_yn = 'Y' ORDER BY D.DEF_YN DESC, D.ORD")%>"
    var ls_date     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
    lstBookCcy.SetDataText(ls_bookccy); 
    lstReport_Type.SetDataText(ls_search_type);  
	lstReport_Type.value = "YP";
    lstCompany.SetDataText(ls_comp);
    lstCurrency.SetDataText(ls_ccy);
    lstFormType.SetDataText(ls_report);
    lstLanguage.SetDataText(ls_lang);
	lstLanguage.value='ENG-KOR';
   txtRate1.SetEnable(false); 
   lstCurrency.value=lstBookCcy.value;
   txtCurrDate.SetDataText(ls_date);
   MergeExpenseDetail(); 
   getRate();
    /* var ls_report       = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACBG0140','','') FROM DUAL")%>";*/
}

function MergeExpenseDetail()
{
    var fg=grdExpenseDetail.GetGridControl();
    fg.MergeCells = 5;
	fg.MergeRow(0) = true;
	fg.ColWidth(0)=1000;//Code
	fg.FrozenCols = 4;
	if (lstLanguage.value=='VIE')
	{
	    fg.ColWidth(1)=0;//Code English
	    fg.ColWidth(2)=2000;//Code Vietnamese
	    fg.ColWidth(3)=0;//Code Korean
	}
	else if (lstLanguage.value=='KOR')
	{
	    fg.ColWidth(1)=0;//Code English
	    fg.ColWidth(2)=0;//Code Vietnamese
	    fg.ColWidth(3)=2000;//Code Korean
	}
	else
	{
	    fg.ColWidth(1)=2000;//Code English
	    fg.ColWidth(2)=0;//Code Vietnamese
	    fg.ColWidth(3)=0;//Code Korean
	}
	fg.ColWidth(8)=1500;//Accumulate
	fg.ColWidth(9)=1500;//Jan
	fg.ColWidth(10)=1500;//Feb
	fg.ColWidth(11)=1500;//Mar
	fg.ColWidth(12)=1500;//Apr
	fg.ColWidth(13)=1500;//May
	fg.ColWidth(14)=1500;//Jun
	fg.ColWidth(15)=1500;//Jul
	fg.ColWidth(16)=1500;//Aug
	fg.ColWidth(17)=1500;//Sep
	fg.ColWidth(18)=1500;//Oct
	fg.ColWidth(19)=1500;//Nov
	fg.ColWidth(20)=1500;//Dec
	fg.ColWidth(21)=0;//TAC_ABACCTCODE_PK
	fg.ColAlignment(0) = flexAlignCenterCenter;
	fg.ColAlignment(8) = flexAlignRightCenter;
	fg.ColAlignment(9) = flexAlignRightCenter;
	fg.ColAlignment(10) = flexAlignRightCenter;
	fg.ColAlignment(11) = flexAlignRightCenter;
	fg.ColAlignment(12) = flexAlignRightCenter;
	fg.ColAlignment(13) = flexAlignRightCenter;
	fg.ColAlignment(14) = flexAlignRightCenter;
	fg.ColAlignment(15) = flexAlignRightCenter;
	fg.ColAlignment(16) = flexAlignRightCenter;
	fg.ColAlignment(17) = flexAlignRightCenter;
	fg.ColAlignment(18) = flexAlignRightCenter;
	fg.ColAlignment(19) = flexAlignRightCenter;
	fg.ColAlignment(20) = flexAlignRightCenter;
}

function onChangeLanguage()
{
    var fg=grdExpenseDetail.GetGridControl();
   if (lstLanguage.value=='VIE')
	{
	    fg.ColWidth(1)=0;//Code English
	    fg.ColWidth(2)=5000;//Code Vietnamese
	    fg.ColWidth(3)=0;//Code Korean
	}
	else if (lstLanguage.value=='KOR')
	{
	    fg.ColWidth(1)=0;//Code English
	    fg.ColWidth(2)=0;//Code Vietnamese
	    fg.ColWidth(3)=5000;//Code Korean
	}
	else if (lstLanguage.value=='ENG')
	{
	    fg.ColWidth(1)=5000;//Code English
	    fg.ColWidth(2)=0;//Code Vietnamese
	    fg.ColWidth(3)=0;//Code Korean
	}
	else if (lstLanguage.value=='KOR-VIE')
	{
	    fg.ColWidth(1)=0;//Code English
	    fg.ColWidth(2)=4000;//Code Vietnamese
	    fg.ColWidth(3)=4000;//Code Korean
	}
	else if (lstLanguage.value=='ENG-VIE')
	{
	    fg.ColWidth(1)=4000;//Code English
	    fg.ColWidth(2)=4000;//Code Vietnamese
	    fg.ColWidth(3)=0;//Code Korean
	}
	else if (lstLanguage.value=='ENG-VIE-KOR')
	{
	    fg.ColWidth(1)=2000;//Code English
	    fg.ColWidth(2)=2000;//Code Vietnamese
	    fg.ColWidth(3)=2000;//Code Korean
	}
	
	else //ENG-KOR
	{
	    fg.ColWidth(1)=4000;//Code English
	    fg.ColWidth(2)=0;//Code Vietnamese
	    fg.ColWidth(3)=4000;//Code Korean
	} 
    
}

function onFormatGridData()
{
	var ctrl = grdExpenseDetail.GetGridControl();
	if (lstCurrency.value=="VND")
	{
	    ctrl.ColFormat(8)  = "#,###,###,###,###,###,###,###,###R";
	    ctrl.ColFormat(9)  = "#,###,###,###,###,###,###,###,###R";
	    ctrl.ColFormat(10) = "#,###,###,###,###,###,###,###,###R";
	    ctrl.ColFormat(11) = "#,###,###,###,###,###,###,###,###R";
	    ctrl.ColFormat(12) = "#,###,###,###,###,###,###,###,###R";
	    ctrl.ColFormat(13) = "#,###,###,###,###,###,###,###,###R";
	    ctrl.ColFormat(14) = "#,###,###,###,###,###,###,###,###R";
	    ctrl.ColFormat(15) = "#,###,###,###,###,###,###,###,###R";
	    ctrl.ColFormat(16) = "#,###,###,###,###,###,###,###,###R";
	    ctrl.ColFormat(17) = "#,###,###,###,###,###,###,###,###R";
	    ctrl.ColFormat(18) = "#,###,###,###,###,###,###,###,###R";
	    ctrl.ColFormat(19) = "#,###,###,###,###,###,###,###,###R";
	    ctrl.ColFormat(20) = "#,###,###,###,###,###,###,###,###R";
	}
	else
	{
	    ctrl.ColFormat(8)  = "#,###,###,###,###,###,###,###,###.##R";
	    ctrl.ColFormat(9)  = "#,###,###,###,###,###,###,###,###.##R";
	    ctrl.ColFormat(10) = "#,###,###,###,###,###,###,###,###.##R";
	    ctrl.ColFormat(11) = "#,###,###,###,###,###,###,###,###.##R";
	    ctrl.ColFormat(12) = "#,###,###,###,###,###,###,###,###.##R";
	    ctrl.ColFormat(13) = "#,###,###,###,###,###,###,###,###.##R";
	    ctrl.ColFormat(14) = "#,###,###,###,###,###,###,###,###.##R";
	    ctrl.ColFormat(15) = "#,###,###,###,###,###,###,###,###.##R";
	    ctrl.ColFormat(16) = "#,###,###,###,###,###,###,###,###.##R";
	    ctrl.ColFormat(17) = "#,###,###,###,###,###,###,###,###.##R";
	    ctrl.ColFormat(18) = "#,###,###,###,###,###,###,###,###.##R";
	    ctrl.ColFormat(19) = "#,###,###,###,###,###,###,###,###.##R";
	    ctrl.ColFormat(20) = "#,###,###,###,###,###,###,###,###.##R";
	}
	for (i = 1; i < ctrl.Rows; i++)
	{
		if(grdExpenseDetail.GetGridData(i,5)== "B")
		{
			ctrl.Cell(14, i, 0, i, 21) = false;
			grdExpenseDetail.SetCellBold(i, 0, i, 21, true);
		}
		else if (grdExpenseDetail.GetGridData(i,5)== "I")
		{
			grdExpenseDetail.SetCellBold(i, 0, i, 21, false);
			ctrl.Cell(14, i, 0, i, 21) = true; // Chu nghieng
		}
		else
		{
			ctrl.Cell(14, i, 0, i, 21) = false;
			grdExpenseDetail.SetCellBold(i, 0, i, 21, false);
		}
		grdExpenseDetail.SetCellBgColor(i, 0, i, 21, Number(grdExpenseDetail.GetGridData(i, 6)));
	}
	
	if(lstReport_Type.value == "YP"){
		var yyyy, mm, vl = dtTo.value;
		yyyy = Number(vl.substring(0,4));
		mm = Number(vl.substring(4,6));
		
		var start_cl = 8;
		for(var idx = 1; idx <= 12; idx++){
			grdExpenseDetail.SetGridText(0,start_cl + idx,mm.toString() + '/' + yyyy.toString());
			if(mm == 1){mm=12;yyyy--;}else{mm--;}
		}
	} else{
		grdExpenseDetail.SetGridText(0,9,"Jan");
		grdExpenseDetail.SetGridText(0,10,"Feb");
		grdExpenseDetail.SetGridText(0,11,"Mar");
		grdExpenseDetail.SetGridText(0,12,"Apr");
		grdExpenseDetail.SetGridText(0,13,"May");
		grdExpenseDetail.SetGridText(0,14,"Jun");
		grdExpenseDetail.SetGridText(0,15,"Jul");
		grdExpenseDetail.SetGridText(0,16,"Aug");
		grdExpenseDetail.SetGridText(0,17,"Sep");
		grdExpenseDetail.SetGridText(0,18,"Oct");
		grdExpenseDetail.SetGridText(0,19,"Nov");
		grdExpenseDetail.SetGridText(0,20,"Dec");
	}/**/
    HiddenColumn();
    onChangeLanguage();
}
function HiddenColumn(){
    var obj=grdExpenseDetail.GetGridControl();
	var qty_clshow;
	if(grdExpenseDetail.rows>1)
	{
		qty_clshow = Number(grdExpenseDetail.GetGridData(1, 22));
	}
    for(var idx = 9; idx < 21; idx++){
        if(lstReport_Type.value == "YP"){
            if((idx - 9) < qty_clshow){
                obj.ColWidth(idx) = 2000;
            }else{
                obj.ColWidth(idx) = 0;
            }
        }else{
            obj.ColWidth(idx) = 2000;
        }
        
    }
/*
var mm = Number(dtTo.value) - Number(dtFrom.value) + 1;
var obj=grdExpenseDetail.GetGridControl();
    //show
	for(var i=0;i< mm ; i++) {
	    obj.ColWidth(i+9) = 2000;
	}
	//hidden
	for(var i=(mm+9);i< grdExpenseDetail.cols-3 ; i++) {
	    obj.ColWidth(i) = 0;
	}
	
	//recalculate accumulate
	for(var i=1;i< grdExpenseDetail.rows ; i++) {
	    var accum_qty = 0;
		for(var j=0;j< mm ; j++) {
		var tmp = Number(RemoveComma(grdExpenseDetail.GetGridData(i, j+9)));
	      accum_qty += tmp;
	    }
	//
	    grdExpenseDetail.SetGridText(i,8,accum_qty);
	}*/
}
function getRate()
{
    datGetRate.Call();
}

function onReceiveRate()
{
    if ((txtRate2.text =="")||(txtRate2.text=="0"))
   {
        txtRate2.text ="1";
   } 
   onSearch();
}

function onPrintReport2()
{
    if(lstReport_Type.value=='MC')
    {
        var url = '/standard/reports/gf/ka/';
        var isPrint = 1;
        url+='gfka00130_2.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
    }
    else if(lstReport_Type.value=='Y')
    {
        var url = '/standard/reports/gf/ka/';
        var isPrint = 1;
        url+='gfka00130_rpt.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
//        if (isPrint==1)
//        {
//            if (confirm("Do you want to print report ?"))
//           { 
//                System.OpenTargetPage( System.RootURL+url , "newform");
//            }
//        } 
    }else if(lstReport_Type.value=='YP'){
		var url = '/standard/reports/gf/ka/';
		var isPrint = 1;
        url+='gfka00130_rpt_yp.aspx?p_comp_pk='+lstCompany.value+'&p_month_from='+dtFrom.value + '&p_status=' + rbstatus.value + '&p_report_type=' + lstFormType.value + '&p_rate1=' + txtRate1.text+ '&p_rate2=' + txtRate2.text+ '&p_rate3=' + txtRate3.text+'&p_lang='+lstLanguage.value+'&p_month_to='+dtTo.value;
		//alert(url);
	}
    System.OpenTargetPage( System.RootURL+url , "newform");
}

function onPrintReport()
{
   var url = '/standard/reports/gf/ka/';
   var isPrint = 1;
    url+='gfka00130_rpt.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
    if (isPrint==1)
    {
        if (confirm("Do you want to print report ?"))
       { 
            System.OpenTargetPage( System.RootURL+url , "newform");
        }
    } 

   /*switch  (lstFormType.value)
   {
        case "13" ://Production Expense
            if (lstLanguage.value =="ENG-VIE-KOR")//ALL
            {
                url+='gfka60110130_production_expense.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
            }
            else
            {
                url+='gfka60110130_production_expense_lang.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
            }
            isPrint = 1;
            break;
        
       case "14" ://Sale & Admin Expense
             if (lstLanguage.value =="ENG-VIE-KOR")//ALL
                {
                    url+='gfka60110130_sale_admin_espense.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
                }
                else
                {
                    url+='gfka60110130_sale_admin_espense_lang.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
                }
               isPrint = 1; 
               break;
         case "15" ://Manufacture Cost
                 if (lstLanguage.value =="ENG-VIE-KOR")//ALL
                    {
                        url+='gfka60110130_manufacture.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
                    }
                    else
                    {
                        url+='gfka60110130_manufacture_lang.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
                    }
              isPrint = 1;
              break;
          case "16" ://Profit & Loss
                if (lstLanguage.value =="ENG-VIE-KOR")//ALL
                {
                    url+='gfka60110130_profitloss.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
                }
                else if (lstLanguage.value =="KOR-VIE")//
                {
                    url+='gfka60110130_profitloss_lang_2.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
                } 
                else if (lstLanguage.value =="ENG-VIE")//
                {
                    url+='gfka60110130_profitloss_lang_2.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
                } 
                else
                {
                    url+='gfka60110130_profitloss_lang.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
                } 
              isPrint = 1; 
              break; 
           case "17" ://Expense
            if (lstLanguage.value =="ENG-VIE-KOR")//ALL
            {
                url+='gfka60110130_expense.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
            }
            else
            {
                url+='gfka60110130_expense_lang.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
            }
            isPrint = 1;
            break;   
           case "18" ://Detail for Cash Flows
            if (lstLanguage.value =="ENG-VIE-KOR")//ALL
            {
                url+='gfka60110130_expense.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
            }
            else
            {
                url+='gfka60110130_expense_lang.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
            }
            isPrint = 1;
            break;    
           case "19" ://Irregular
            if (lstLanguage.value =="ENG-VIE-KOR")//ALL
            {
                url+='gfka60110130_expense.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
            }
            else
            {
                url+='gfka60110130_expense_lang.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
            }
            isPrint = 1;
            break;     
           case "1A" ://Financial
            if (lstLanguage.value =="ENG-VIE-KOR")//ALL
            {
                url+='gfka60110130_expense.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
            }
            else
            {
                url+='gfka60110130_expense_lang.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
            }
            isPrint = 1;
            break;     
           case "1B" ://Selling Expense
            if (lstLanguage.value =="ENG-VIE-KOR")//ALL
            {
                url+='gfka60110130_expense.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
            }
            else
            {
                url+='gfka60110130_expense_lang.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
            }
            isPrint = 1;
            break;    
           case "1C" ://Direct employees
            if (lstLanguage.value =="ENG-VIE-KOR")//ALL
            {
                url+='gfka60110130_expense.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
            }
            else
            {
                url+='gfka60110130_expense_lang.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
            }
            isPrint = 1;
            break;        
            
            case "1D" ://Summary Cost
            if (lstLanguage.value =="ENG-VIE-KOR")//ALL
            {
                url+='gfka60110130_expense.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
            }
            else
            {
                url+='gfka60110130_expense_lang.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
            }
            isPrint = 1;
            break;   
            case "1E" ://Admin Expense
            if (lstLanguage.value =="ENG-VIE-KOR")//ALL
            {
                url+='gfka60110130_expense.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
            }
            else
            {
                url+='gfka60110130_expense_lang.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
            }
            isPrint = 1;
            break;        
   }
   if (isPrint==1)
   {
        if (confirm("Do you want to print report ?"))
       { 
            System.OpenTargetPage( System.RootURL+url , "newform");
        }
   } 
   
     if (lstFormType.value=="10")//Trial Balances
   {
        url = 'gfka00100_AllAcc.aspx?company_pk='+ lstCompany.value + '&dtfrom=' + dtfrmonth.value;
	    url =   url + '&dtto=' + dttomonth.value + '&status='+ rbstatus.value + '&ccy=' + lstCurrent.value + '&rate=';
	    url =   url + txtrate1.text + '&level=' + lstLevel.value + '&post=' + lstPostSum.value + '&accd=' + txtac_cd.text;
	    url =   url + '&rptType=' + rdoType.value;
	    System.OpenTargetPage( System.RootURL+url , "newform" );
        
   } 
  
    if (lstFormType.value=="13")//Production Expense
   {
        if (lstLanguage.value =="")//ALL
        {
            url+='gfka60110130_production_expense.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
        }
        else
        {
            url+='gfka60110130_production_expense_lang.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
        }
   }
   
    if (lstFormType.value=="14")//Sale & Admin Expense
   {
        if (lstLanguage.value =="")//ALL
        {
            url+='gfka60110130_sale_admin_espense.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
        }
        else
        {
            url+='gfka60110130_sale_admin_espense_lang.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
        }
   } 
   
    if (lstFormType.value=="15")//Manufacture Cost
   {
        if (lstLanguage.value =="")//ALL
        {
            url+='gfka60110130_manufacture.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
        }
        else
        {
            url+='gfka60110130_manufacture_lang.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
        }
   } 
   
    if (lstFormType.value=="16")//Profit & Loss
   {
        if (lstLanguage.value =="")//ALL
        {
            url+='gfka60110130_profitloss.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
        }
        else
        {
            url+='gfka60110130_profitloss_lang.aspx?Company='+lstCompany.value+'&rptMonth='+dtFrom.value+'&rbstatus='+rbstatus.value+'&lstFormType='+lstFormType.value+'&txtRate1='+txtRate1.text+'&txtRate2='+txtRate2.text+'&txtRate3='+txtRate3.text+'&lang='+lstLanguage.value+'&lstCurrency='+lstCurrency.value;
        }
   } 
     */
    
}
function onSearch()
{
    if ((txtRate2.text=="")||(txtRate2.text=="0"))
   {
        txtRate2.text=="1";
   }
   
   if ((txtRate3.text=="")||(txtRate3.text=="0"))
   {
        txtRate3.text=="1";
   }
   
   if(lstReport_Type.value == "YP"){
		datExpenseDown.Call('SELECT');
   }else{datExpenseInquiry.Call('SELECT');}
}
function onDataErr(obj)
{
    if (obj.id=="datGetRate")
   {
        alert("Error on get rate!");
        return;
   } 
   else
   {
        alert("Load data error!");
        return;
   }
}

function OnPopupDailySL()
{
    var ctrl = grdExpenseDetail.GetGridControl();
    var yyyy, mm, vl;
		//yyyy = Number(vl.substring(0,4));
		//mm = Number(vl.substring(4,6));
    if(lstReport_Type.value == "YP"){
        if(ctrl.col > 8 && ctrl.col < 21){
            if(grdExpenseDetail.GetGridData(ctrl.row, ctrl.col) == "" || grdExpenseDetail.GetGridData(ctrl.row, 21) == ""){return false;}
            else{
                if(grdExpenseDetail.GetGridData(0, ctrl.col).length == 6) 
                    vl = '0' + grdExpenseDetail.GetGridData(0, ctrl.col);
                else vl =grdExpenseDetail.GetGridData(0, ctrl.col);

                mm = vl.substring(0,2); yyyy = vl.substring(3,7);
                vl = yyyy + mm;
               
                var fpath = System.RootURL + '/standard/forms/gf/ka/gfka00130_popup.aspx?p_comp_pk='+ lstCompany.value + '&p_month=' + vl + '&p_status=' + rbstatus.value  + '&p_rate1=' + txtRate1.text+ '&p_rate2=' + txtRate2.text+ '&p_rate3=' + txtRate3.text + '&pk=' + grdExpenseDetail.GetGridData(ctrl.row, 21);
		        var wWidth = 950;
		        var wHeight = 500;

                var x = Math.round((screen.availWidth - wWidth)/2);
		        var y = Math.round((screen.availHeight - wHeight)/2);

		        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
		        "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
		        "lef="+ x +",top=" + y;

		        var object = System.OpenModal(fpath, wWidth, wHeight, features);
            }
        }
    }

        /*
        var ctrl = grdExpenseDetail.GetGridControl();
        var rows = ctrl.Rows
        rows = rows - 1;
        var rownum = ctrl.Row;
        var colnum = ctrl.Col;
         var ac_pk = grdExpenseDetail.GetGridData(ctrl.row, 21)
        if (rownum > 0) 
        {
	        if ( ac_pk!='')
	        {
		        var ac_nm = grdExpenseDetail.GetGridData(ctrl.row, 0);
		        var fpath = System.RootURL + '/standard/forms/gf/ka/gfka00100_popup.aspx?ac_pk='+ ac_pk + '&ac_nm=' + ac_nm + '&compk=' + lstCompany.GetData() + '&status=' + rbstatus.GetData() + '&lang='+ lstLanguage.GetData() + '&cur=' + lstCurrency.GetData() + '&date_fr=' + dtFrom.GetData() + '&date_to=' + dtFrom.GetData() + '&type_month=1';
		        var wWidth = 950;
		        var wHeight = 500;
		        var x = Math.round((screen.availWidth - wWidth)/2);
		        var y = Math.round((screen.availHeight - wHeight)/2);

		        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
		        "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
		        "lef="+ x +",top=" + y;

		        var object = System.OpenModal(fpath, wWidth, wHeight, features);
	        }
        }/**/
}
</script>
<body>

<gw:data id="datGetRate" onreceive="onReceiveRate()" >
	<xml> 
		<dso type="process" procedure="ac_PRO_GET_RATE"> 
			<input> 
				<input bind="txtCurrDate"/>
				<input bind="lstCompany"/>
				<input bind="lstCurrency" />
				<input bind="txt_row"/>
			</input>
			<output>
				<output bind="txtRate2"/>
				<output bind="txt_row"/>
			</output> 
			</dso> 
	</xml> 
</gw:data>

 <gw:data id="datExpenseInquiry" onreceive="onFormatGridData()" >
        <xml>
            <dso type="grid" function="ac_SEL_EXPENSE_INQ">
                <input bind="grdExpenseDetail">
                    <input bind="lstCompany"/>
                    <input bind="dtFrom"/>
                    <input bind="rbstatus"/>
                    <input bind="lstFormType"/>
                    <input bind="txtRate1"/>
                    <input bind="txtRate2"/>
                    <input bind="txtRate3"/>
                </input>
                <output bind="grdExpenseDetail"/>
            </dso>
        </xml>
</gw:data>
	
<gw:data id="datExpenseDown" onreceive="onFormatGridData()" >
        <xml>
            <dso type="grid" function="ac_sel_gfka00130_down">
                <input bind="grdExpenseDetail">
                    <input bind="lstCompany"/>
                    <input bind="dtTo"/>
                    <input bind="rbstatus"/>
                    <input bind="lstFormType"/>
                    <input bind="txtRate1"/>
                    <input bind="txtRate2"/>
                    <input bind="txtRate3"/>
                    <input bind="dtFrom"/>
                </input>
                <output bind="grdExpenseDetail"/>
            </dso>
        </xml>
    </gw:data>
<!------------------------------------------------------------------------------------------------------->
<table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
    <tr height='6%'>
        <td>
            <table width="100%" cellpadding="1" cellspacing="1" border="0">
               
                <tr>
                    <td align="right" width='10%'>Company </td>
                    <td colspan='2'><gw:list id="lstCompany" styles='width:100%'/></td>
                    <td align="right" width='20%'>Financial Statement </td>
                    <td width='20%'><gw:list id="lstFormType" styles='width:100%' onchange='onSearch()'/></td>
                    <td width='15%' align="right">Language</td>
                    <td width='35%' colspan="4"><gw:list id="lstLanguage" styles='width:100%' onchange='onChangeLanguage()'/></td>
					<td><gw:imgBtn id="idBtnSearch" alt="Search" img="Search" text="Search" onclick="onSearch()" /></td>
                                       
                </tr> 
                <tr>
                    <td align="right">Month</td> 
                    <td><gw:datebox  id="dtFrom" lang="1" type="month" onchange='onSearch()' /></td>
					<td><gw:datebox  id="dtTo" lang="1" type="month" onchange='onSearch()' /></td>
					<td align='right'>Slip Status </td>
					<td>
						<gw:radio id="rbstatus" value="2" onchange='onSearch()'> 
						<span value="2">Confirmed</span>
						<span value="0">Approved</span>
						</gw:radio>
					</td>
                    <td align="right">Currency</td>
					<td>
						<table width='100%' cellpadding='0' cellspacing='0'>
							<tr>
								<td width='20%'><gw:list id="lstCurrency" styles="width:100%;" onchange='getRate()'></gw:list></td>
								<td width='20%' align="right" style='white-space:nowrap'>Ex. Rate</td>
								<td width='20%'><gw:textbox id="txtRate1" styles="withd:100%" text="1" type="number" format="###,###.##R"   /></td>
								<td width='20%'><gw:textbox id="txtRate2" styles="withd:100%" text="1" type="number" format="###,###.##R"   onenterkey="onSearch()" /></td>
								<td width='20%'><gw:textbox id="txtRate3" styles="withd:100%" text="1" type="number" format="###,###.##R"   onenterkey="onSearch()" /></td>
							</tr>
						</table>
					</td>
                </tr>
                <tr>
                    <td align="right" colspan='6'>Type</td>
                    <td colspan='4'><gw:list id="lstReport_Type" styles="width:100%;"  onchange='onSearch()' ></gw:list></td>
					<td><gw:button  id="idBtnPrint" alt="Report" img="excel" text="Print" onclick="onPrintReport2()" /></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr height='94%'>
					<td>
						<gw:grid id='grdExpenseDetail'
header='_Code|Item|Item|Item|_PRN_LR|_FONT_STYPE|_PRN_COLOR|_FORMULAR|Accumulate|Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec|_PK|_MMBetween|'
format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
defaults='|||||||||||||||||||||0|0|0'
editcol='1|1|1|1|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0'
widths='1000|1000|1000|1000|0|0|0|1000|2000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|0|0|0'
sorting='T'
styles='width:100%; height:100%'
oncelldblclick="OnPopupDailySL()"
/>
					</td>
    </tr>
</table>

<gw:textbox id="txtSUM"   style="display:none"/>
<gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
<gw:textbox id="txtCurrDate"       styles='display:none'/>
<gw:textbox id="txt_row"        styles='display:none'/>
</body>
</html>