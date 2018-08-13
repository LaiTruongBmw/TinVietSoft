﻿<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>


<script>

var emp_id = "<%=Session("LOGIN_ID")%>";
function BodyInit()
{
    System.Translate(document);
        
    var ls_company  = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    //var ls_type     = "<=CtlLib.SetListDataSQL("SELECT TRIM(A.CODE), A.CODE_NM FROM COMM.TCO_ABCODE A, COMM.TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACBG0020' AND A.USE_IF = 1 AND CODE IN ('21', '22', '23') ORDER BY ORD")%>";
    
    var ls_lang     = "<%=CtlLib.SetListDataFUNC("SELECT AC_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
    var ls_current  = "<%=CtlLib.SetListDataFUNC("SELECT AC_F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
    
    var ls_date     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
    var ls_month    = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(ADD_MONTHS(SYSDATE,-1), 'YYYYMM') FROM DUAL")%>";
    
    var ls_date_fr  = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
    var ls_date_to  = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(SYSDATE), 'YYYYMMDD') FROM DUAL")%>";
    
    var ls_Book_ccy = "<%=CtlLib.SetListDataFUNC("SELECT AC_F_COMMONCODE('ACBG0040','04','') FROM DUAL")%>";
    ls_trsdate      = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
    
    txt_date.text   = ls_trsdate;
    txtrate.SetDataText('1');
    txtScale.SetDataText('1');
    lstCompany.SetDataText(ls_company);
    lstCompany.value = "<%=session("company_pk") %>";
    txtFinancialType.SetDataText("21");
    lstLang.SetDataText(ls_lang);
    lstCurrent.SetDataText(ls_current);
    lstBook_ccy.SetDataText(ls_Book_ccy);
    lstCurrent.SetDataText(lstBook_ccy.GetData());
    lstLang.SetDataText('VIE');
    var data = "<%=CtlLib.SetListDataFUNC("SELECT AC_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
    arr  = data.split("|");
	lblBookccy.SetDataText(arr[1]);
	
    onMergeHead();
    txt_row.text    = 0;
    txtScale.GetControl().focus();
    
    var fg = grid_bs.GetGridControl();
    if (lblBookccy.GetData() == 'VND')
    {
        fg.ColFormat(8) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###R";
    }
    else
    {
        fg.ColFormat(8) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###.##R";
    }    
    
    var fg = grid_ic.GetGridControl();
    if (lblBookccy.GetData() == 'VND')
    {
        fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(10) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(11) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(12) = "#,###,###,###,###,###,###,###,###R";
    }
    else
    {
        fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(10) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(11) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(12) = "#,###,###,###,###,###,###,###,###.##R";
    }
  
    var fg = grid_cf_di.GetGridControl();
    if (lblBookccy.GetData() == 'VND')
    {
        fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(10) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(11) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(12) = "#,###,###,###,###,###,###,###,###R";
    }
    else
    {
        fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(10) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(11) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(12) = "#,###,###,###,###,###,###,###,###.##R";
    }
    
    OnChangeDateType();
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	dso_getCompany.Call();
        
}
//-------------------------------------------------------------------------
function OnChangeDateType(){
    CalculateFTDate();
    var quater = lstQuater.GetData();
    var yyyy = dtfrdate.text.substr(6,4);
    var mmyyyy = dtfrdate.text.substr(3,7);
    var acc_mmyyyy = dtfrdate.GetData();
    acc_mmyyyy = System.AddDate(acc_mmyyyy,-365);
    acc_mmyyyy = acc_mmyyyy.substr(4,2) +"/"+ acc_mmyyyy.substr(0,4);
    //alert(acc_mmyyyy)
    if(idTab_Child.GetCurrentPageNo() == 0){
        if(rdoType.GetData() == 1){
            txtDateType.text = "M";
            lblDateType.text = "Month:";
            dtMonth.style.display = "";
            dtYear.style.display = "none";
            lstQuater.style.display = "none";
        }
        else if(rdoType.GetData() == 2){
            txtDateType.text = "Q";
            lblDateType.text = "Quater:";
            dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstQuater.style.display = "";
        }
        else if(rdoType.GetData() == 3){
            txtDateType.text = "Y";
            lblDateType.text = "Year:";
            dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstQuater.style.display = "none";
        }
      }
    else if(idTab_Child.GetCurrentPageNo() == 1){
        if(rdoType.GetData() == 1){
            txtDateType.text = "M";
            lblDateType.text = "Month:";
            dtMonth.style.display = "";
            dtYear.style.display = "none";
            lstQuater.style.display = "none";
            grid_ic.SetGridText(0,9,"Month("+mmyyyy+")");//this period        
            grid_ic.SetGridText(0,10,"Month("+acc_mmyyyy+")");//this period of previous year
            grid_ic.SetGridText(0,11,"Acc Month("+yyyy+")");//accumulate from beginning of year to this period
            grid_ic.SetGridText(0,12,"Acc Month("+(yyyy-1)+")");//accumulate from beginning of previous year to this period - 1 year
            var obj = grid_ic.GetGridControl();
           // obj.ColHidden(11) = true;
            //obj.ColHidden(12) = false;
        }
        else if(rdoType.GetData() == 2){
            txtDateType.text = "Q";
            lblDateType.text = "Quater:";
            dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstQuater.style.display = "";
            grid_ic.SetGridText(0,9,"Quater "+quater+ " of " + yyyy);//this period        
            grid_ic.SetGridText(0,10,"Quater "+quater+" of " + (yyyy-1));//this period of previous year
            grid_ic.SetGridText(0,11,"Acc of Quater "+quater+ " of " + yyyy);//accumulate from beginning of year to this period
            grid_ic.SetGridText(0,12,"Acc of Quater "+quater+ " of " + (yyyy-1));//accumulate from beginning of previous year to this period - 1 year
            var obj = grid_ic.GetGridControl();
           //obj.ColHidden(11) = false;
           //obj.ColHidden(12) = false;
        }
        else if(rdoType.GetData() == 3){
            txtDateType.text = "Y";
            lblDateType.text = "Year:";
            dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstQuater.style.display = "none";
            grid_ic.SetGridText(0,9,"This Year("+yyyy+")");//this period        
            grid_ic.SetGridText(0,10,"Last Year("+(yyyy-1)+")");//this period of previous year
            grid_ic.SetGridText(0,11,"");//accumulate from beginning of year to this period
            grid_ic.SetGridText(0,12,"");//accumulate from beginning of previous year to this period - 1 year
             var obj = grid_ic.GetGridControl();
           // obj.ColHidden(11) = true;
           // obj.ColHidden(12) = true;
        }
      
     } else if(idTab_Child.GetCurrentPageNo() == 2){
        if(rdoType.GetData() == 1){ 
         
            txtDateType.text = "M";
            lblDateType.text = "Month:";
            dtMonth.style.display = "";
            dtYear.style.display = "none";
            lstQuater.style.display = "none";
            grid_cf_di.SetGridText(0,9,"Month("+mmyyyy+")");//this period        
            grid_cf_di.SetGridText(0,10,"Month("+acc_mmyyyy+")");//this period of previous year
            grid_cf_di.SetGridText(0,11,"Acc Month("+mmyyyy+")");//accumulate from beginning of year to this period
            grid_cf_di.SetGridText(0,12,"Acc Month("+acc_mmyyyy+")");//accumulate from beginning of previous year to this period - 1 year
        }
        else if(rdoType.GetData() == 2){
            txtDateType.text = "Q";
            lblDateType.text = "Quater:";
            dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstQuater.style.display = "";
            grid_cf_di.SetGridText(0,9,"Quater "+quater+ " of " + yyyy);//this period        
            grid_cf_di.SetGridText(0,10,"Quater "+quater+ " of " + (yyyy-1));//this period of previous year
            grid_cf_di.SetGridText(0,11,"Acc of Quater "+quater+ " of " + yyyy);//accumulate from beginning of year to this period
            grid_cf_di.SetGridText(0,12,"Acc of Quater "+quater+ " of " + (yyyy-1));//accumulate from beginning of previous year to this period - 1 year
        }
        else if(rdoType.GetData() == 3){
            txtDateType.text = "Y";
            lblDateType.text = "Year:";
            dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstQuater.style.display = "none";
            grid_cf_di.SetGridText(0,9,"This Year("+yyyy+")");//this period        
            grid_cf_di.SetGridText(0,10,"Last Year("+(yyyy-1)+")");//this period of previous year
            grid_cf_di.SetGridText(0,11,"");//accumulate from beginning of year to this period
            grid_cf_di.SetGridText(0,12,"");//accumulate from beginning of previous year to this period - 1 year
        }
     }
    
}
//--------------------------------------------------------------------------
function CalculateFTDate(){
    //1:Month, 2:Quater, 3:Year
    var yyyymm,yyyy, mm, quater;
    //month
    if(rdoType.GetData() == 1){
        yyyymm = dtMonth.GetData();
        yyyy = yyyymm.substr(0,4);
        mm = yyyymm.substr(4,2);
        dtfrdate.SetDataText(yyyy+mm+"01");
        dttodate.SetDataText(yyyy+mm+LastDayOfMonth(yyyymm));
    }
    //quater
    else if(rdoType.GetData() == 2){
        yyyy = dtYear.GetData();
        quater = lstQuater.GetData();
        if(quater == 1){
            dtfrdate.SetDataText(yyyy + "0101");    
            dttodate.SetDataText(yyyy + "0331");    
        }
        else if(quater == 2){
            dtfrdate.SetDataText(yyyy + "0401");    
            dttodate.SetDataText(yyyy + "0630");    
        }
        else if(quater == 3){
            dtfrdate.SetDataText(yyyy + "0701");    
            dttodate.SetDataText(yyyy + "0930");    
        }
        else if(quater == 4){
            dtfrdate.SetDataText(yyyy + "1001");    
            dttodate.SetDataText(yyyy + "1231");    
        }
    }
    //year
    else if(rdoType.GetData() == 3){
        yyyy = dtYear.GetData();
        dtfrdate.SetDataText(yyyy + "0101");    
        dttodate.SetDataText(yyyy + "1231"); 
    }
    onSearch();
}
//---------------------------------------------------------------
function LastDayOfMonth(p_yyyymm){
    mm = p_yyyymm.substr(4,2);
    yyyy = p_yyyymm.substr(0,4);
    mm = parseInt(mm,10);
    switch(mm)
    {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
          return 31;
          break;
        case 4:
        case 6:
        case 9: 
        case 11:
        return 30;
          break;
        default: 
        if((yyyy%4 == 0)&&(yyyy%100 > 0)){
            return 29;
        }
        else
        {
            return 28;
        }
    }
    return -1;//invalid month
}
//------------------------------------------------------------------
function OnChangeMonth(){
    //CalculateFTDate();
    OnChangeDateType();
}
//------------------------------------------------------------------
function OnChangeQuater(){
    //CalculateFTDate();
    OnChangeDateType();
}
//------------------------------------------------------------------
function OnChangeYear(){
    //CalculateFTDate();
    OnChangeDateType();
}
//------------------------------------------------------------------
function onMergeHead()
{
    grid_bs.GetGridControl().FixedRows = 1;
    //grid_bs.GetGridControl().AllowUserResizing = 0;
    grid_bs.GetGridControl().AutoResize = true;
    grid_bs_sum.GetGridControl().FixedRows = 1;
    //grid_bs_sum.GetGridControl().AllowUserResizing = 0;
    grid_bs_sum.GetGridControl().AutoResize = true;
    grid_ic.GetGridControl().FixedRows = 1;
    //grid_ic.GetGridControl().AllowUserResizing = 0;
    grid_ic.GetGridControl().AutoResize = true;
    grid_cf_di.GetGridControl().FixedRows = 1;
    //grid_cf.GetGridControl().AllowUserResizing = 0;
    grid_cf_di.GetGridControl().AutoResize = true;
}
//---------------------------------------------------------------
function onSearch()
{
    //if (!onCheckMonth()) return;
    if(txtFinancialType.GetData() == '21'){
       dso_sel_grd_balance_sheet.Call("SELECT");
    }
    else if(txtFinancialType.GetData() == '25'){
  
        dso_sel_grd_income.Call("SELECT");
    }
    else if(txtFinancialType.GetData() == '23'){
   
        dso_sel_grd_cf.Call("SELECT");
    }
    else if(txtFinancialType.GetData() == '23_1'){
 
        dso_gfka00080_1.Call("SELECT");
    }
    else if(txtFinancialType.GetData() == '24'){
  
        dso_gfka00080_2.Call("SELECT");
    }
}
//---------------------------------------------------------------------
function trim(str)
{    if(!str || typeof str != 'string') 
       return null;    
       return str.replace(/^[\s]+/,'').replace(/[\s]+$/,'').replace(/[\s]{2,}/,' ');
}
//------------------------------------------------------------------------
function onReport(lang)
{
     var r,f_nm;
     switch(lang)
    {
        case "VIE":
             r='?p_kind='+txtFinancialType.GetData()+'&p_status='+rbstatus.value+'&p_tco_company_pk='+lstCompany.GetData()+'&p_date_fr='+dtfrdate.GetData() + '&p_date_to='+ dttodate.GetData()+ '&p_date_type='+txtDateType.GetData() + '&p_quarter=' + lstQuater.value+"&p_Scale="+txtScale.GetData()+"&p_ccy="+lstCurrent.GetData();
             r= r + '&p_rate=' + txtrate1.GetData() + '&p_month=' + dtMonth.GetData();  
             var x=txtFinancialType.GetData();
            switch(x)
            {
                case "21": // balance sheet
                    switch(rdoType.GetData())
                    {
                       case "1"://Monthly
                              var url = '/standard/reports/gf/ka/gfka00080_BS_VIE.aspx?p_status='+ rbstatus.GetData() +'&p_company_pk=' + lstCompany.GetData() + '&p_date_f=' + dtfrdate.GetData() + '&p_date_t=' + dttodate.GetData() + '&p_kind=' + txtFinancialType.GetData() + '&p_crt_by=' + emp_id+"&p_ccy="+lstCurrent.GetData() + "&p_Scale="+txtScale.GetData();
                              System.OpenTargetPage( System.RootURL+url , "newform" );
                        break;
                        case "2"://Quarter
                            var url = '/standard/reports/gf/ka/gfka00080_BS_VIE.aspx?p_status='+ rbstatus.GetData() +'&p_company_pk=' + lstCompany.GetData() + '&p_date_f=' + dtfrdate.GetData() + '&p_date_t=' + dttodate.GetData() + '&p_kind=' + txtFinancialType.GetData() + '&p_crt_by=' + emp_id+"&p_ccy="+lstCurrent.GetData()+ "&p_Scale="+txtScale.GetData();
                              System.OpenTargetPage( System.RootURL+url , "newform" ); 
                        break;
                        case "3"://Year
                             var url = '/standard/reports/gf/ka/gfka00080_BS_VIE.aspx?p_status='+ rbstatus.GetData() +'&p_company_pk=' + lstCompany.GetData() + '&p_date_f=' + dtfrdate.GetData() + '&p_date_t=' + dttodate.GetData() + '&p_kind=' + txtFinancialType.GetData() + '&p_crt_by=' + emp_id+"&p_ccy="+lstCurrent.GetData()+ "&p_Scale="+txtScale.GetData();
                              System.OpenTargetPage( System.RootURL+url , "newform" );
                        break;
                    }
                break;
                case "25": // Income statement
                    switch(rdoType.value)
                    {
                        case "1"://Monthly
                            // f_nm='gfka00080_IC_PERIOD_VIE.aspx';
							 f_nm='gfka00080_IC_M_VIE.aspx';
                        break;
                        case "2"://Quarter
                            f_nm='gfka00080_IC_QUARTER_VIE.aspx';  
                        break;
                        case "3"://Year
                             f_nm='gfka00080_IC_YEAR_VIE.aspx';   
                        break;
                    }
					 var url='/standard/reports/gf/ka/'+f_nm+r; 
                  
                    System.OpenTargetPage( System.RootURL+url , "newform" );
                break;
               
                case "24": // Cash Flow(Direct method)
                    switch(rdoType.value)
                    {
                        case "1"://Monthly
                             f_nm='gfka00080_CF_DI_M_vie.aspx';
                        break;
                        case "2"://Quarter
                            r=r+"&p_quarter="+lstQuater.GetData(); 
                            f_nm='gfka00080_CF_DI_Q_vie.aspx';  
                        break;
                        case "3"://Year
                             f_nm='gfka00080_CF_DI_Y_vie.aspx'; 
                        break;
                    }
                     var url='/standard/reports/gf/ka/'+f_nm+r;       
                    System.OpenTargetPage( System.RootURL+url , "newform" );
                break;
            }
        break;
        case "ENG":
            r='?p_kind='+txtFinancialType.GetData()+'&p_status='+rbstatus.value+'&p_tco_company_pk='+lstCompany.GetData()+'&p_date_fr='+dtfrdate.GetData() + '&p_date_to='+ dttodate.GetData()+ '&p_date_type='+txtDateType.GetData() + '&p_quarter=' + lstQuater.value+"&p_Scale="+txtScale.GetData()+"&p_ccy="+lstCurrent.GetData();
             r= r + '&p_rate=' + txtrate1.GetData() + '&p_month=' + dtMonth.GetData();  
            var x=txtFinancialType.GetData();
             x=Number(x);
			 //alert(x);
            switch(x)
            {
                case 21: // balance sheet
                  r='?p_kind='+txtFinancialType.GetData()+'&p_status='+rbstatus.value+'&p_tco_company_pk='+lstCompany.GetData()+'&p_date_fr='+dtfrdate.GetData() + '&p_date_to='+ dttodate.GetData()+ '&p_date_type='+txtDateType.GetData()+"&p_Scale="+txtScale.GetData()+"&p_ccy="+lstCurrent.GetData();
                    r= r + '&p_rate=' + txtrate1.GetData() + '&p_month=' + dtMonth.GetData() + "&p_Scale="+txtScale.GetData();  
                    switch(rdoType.value)
                    {
                    
                        case "1"://Monthly
                              var url = '/standard/reports/gf/ka/gfka00080_BS_ENG.aspx?p_status='+ rbstatus.GetData() +'&p_company_pk=' + lstCompany.GetData() + '&p_date_f=' + dtfrdate.GetData() + '&p_date_t=' + dttodate.GetData() + '&p_kind=' + txtFinancialType.GetData() + '&p_crt_by=' + emp_id+"&p_ccy="+lstCurrent.GetData()+ "&p_Scale="+txtScale.GetData(); 
                              System.OpenTargetPage( System.RootURL+url , "newform" );
                        break;
                        case "2"://Quarter
                            var url = '/standard/reports/gf/ka/gfka00080_BS_ENG.aspx?p_status='+ rbstatus.GetData() +'&p_company_pk=' + lstCompany.GetData() + '&p_date_f=' + dtfrdate.GetData() + '&p_date_t=' + dttodate.GetData() + '&p_kind=' + txtFinancialType.GetData() + '&p_crt_by=' + emp_id+"&p_ccy="+lstCurrent.GetData();
                              System.OpenTargetPage( System.RootURL+url , "newform" ); 
                        break;
                        case "3"://Year
                             var url = '/standard/reports/gf/ka/gfka00080_BS_ENG.aspx?p_status='+ rbstatus.GetData() +'&p_company_pk=' + lstCompany.GetData() + '&p_date_f=' + dtfrdate.GetData() + '&p_date_t=' + dttodate.GetData() + '&p_kind=' + txtFinancialType.GetData() + '&p_crt_by=' + emp_id+"&p_ccy="+lstCurrent.GetData();
                              System.OpenTargetPage( System.RootURL+url , "newform" );
                        break;
                    }
                break;
                case 25: // Income statement

				 switch(rdoType.value)
                    {
                        case "1"://Monthly
                            // f_nm='gfka00080_IC_PERIOD_VIE.aspx';
							 f_nm='gfka00080_IC_M_ENG.aspx';
                        break;
                        case "2"://Quarter
                            f_nm='gfka00080_IC_QUARTER_ENG.aspx';  
                        break;
                        case "3"://Year
                             f_nm='gfka00080_IC_YEAR_ENG.aspx';   
                        break;
                    }
					 var url='/standard/reports/gf/ka/'+f_nm+r; 
                  
                    System.OpenTargetPage( System.RootURL+url , "newform" );
                break;
                
                case 24: // Cash Flow(Direct method)
                    switch(rdoType.value)
                    {
                        case "1"://Monthly
                             f_nm='gfka00080_CF_DI_M_ENG.aspx';
                        break;
                        case "2"://Quarter
                            r=r+"&p_quarter="+lstQuater.GetData(); 
                            f_nm='gfka00080_CF_DI_Q_ENG.aspx';  
                        break;
                        case "3"://Year
                             f_nm='gfka00080_CF_DI_Y_ENG.aspx'; 
                        break;
                    }
                     var url='/standard/reports/gf/ka/'+f_nm+r;       
                    System.OpenTargetPage( System.RootURL+url , "newform" );
                break;
            }
        break;
         case "KOR":
            r='?p_kind='+txtFinancialType.GetData()+'&p_status='+rbstatus.value+'&p_tco_company_pk='+lstCompany.GetData()+'&p_date_fr='+dtfrdate.GetData() + '&p_date_to='+ dttodate.GetData()+ '&p_date_type='+txtDateType.GetData()+"&p_Scale="+txtScale.GetData()+"&p_ccy="+lstCurrent.GetData();
            r= r + '&p_rate=' + txtrate1.GetData() + '&p_month=' + dtMonth.GetData();  
            r=r+"&p_quarter="+lstQuater.GetData(); 
            var x=txtFinancialType.GetData();
             x=Number(x);
            switch(x)
            {
                case 21: // balance sheet
                    switch(rdoType.value)
                    {
                        case "1"://Monthly
                              var url = '/standard/reports/gf/ka/gfka00080_BS_KOR.aspx?p_status='+ rbstatus.GetData() +'&p_company_pk=' + lstCompany.GetData() + '&p_date_f=' + dtfrdate.GetData() + '&p_date_t=' + dttodate.GetData() + '&p_kind=' + txtFinancialType.GetData() + '&p_crt_by=' + emp_id+"&p_ccy="+lstCurrent.GetData() +"&p_Scale="+txtScale.GetData();
                              System.OpenTargetPage( System.RootURL+url , "newform" );
                        break;
                        case "2"://Quarter
                            var url = '/standard/reports/gf/ka/gfka00080_BS_KOR.aspx?p_status='+ rbstatus.GetData() +'&p_company_pk=' + lstCompany.GetData() + '&p_date_f=' + dtfrdate.GetData() + '&p_date_t=' + dttodate.GetData() + '&p_kind=' + txtFinancialType.GetData() + '&p_crt_by=' + emp_id+"&p_ccy="+lstCurrent.GetData();
                              System.OpenTargetPage( System.RootURL+url , "newform" ); 
                        break;
                        case "3"://Year
                             var url = '/standard/reports/gf/ka/gfka00080_BS_KOR.aspx?p_status='+ rbstatus.GetData() +'&p_company_pk=' + lstCompany.GetData() + '&p_date_f=' + dtfrdate.GetData() + '&p_date_t=' + dttodate.GetData() + '&p_kind=' + txtFinancialType.GetData() + '&p_crt_by=' + emp_id+"&p_ccy="+lstCurrent.GetData();
                              System.OpenTargetPage( System.RootURL+url , "newform" );
                        break;
                    }
                break;
                case 25: // Income statement
                    switch(rdoType.value)
                    {
                        case "1"://Monthly
                             f_nm='/standard/reports/gf/ka/gfka00080_IC_M_KOR.aspx'+r;
                             System.OpenTargetPage( System.RootURL+f_nm , "newform" );
                        break;
                        case "2"://Quarter
p='?p_kind='+txtFinancialType.GetData()+'&p_status='+rbstatus.value+'&p_tco_company_pk='+lstCompany.GetData()+'&p_date_fr='+dtfrdate.GetData() + '&p_date_to='+ dttodate.GetData()+ '&p_date_type='+txtDateType.GetData()+ '&p_quarter=' + lstQuater.value +"&p_Scale="+txtScale.GetData()+"&p_ccy="+lstCurrent.GetData();
p= p + '&p_rate=' + txtrate1.GetData() + '&p_month=' + dtMonth.GetData();  
            p=p+"&p_quarter="+lstQuater.GetData(); 
                            f_nm='/standard/reports/gf/ka/gfka00080_IC_QUARTER_KOR.aspx'+p;  
                             System.OpenTargetPage( System.RootURL+f_nm , "newform" );
                        break;
                        case "3"://Year
                             f_nm='/standard/reports/gf/ka/gfka00080_IC_YEAR_KOR.aspx'+r;   
                              System.OpenTargetPage( System.RootURL+f_nm , "newform" );
                        break;
                    }
                break;
              
                case 24: // Cash Flow (Direct method)
                    switch(rdoType.value)
                    {
                        case "1"://Monthly
                            f_nm='gfka00080_CF_DI_M_KOR.aspx';
                        break;
                        case "2"://Quarter
                            f_nm='gfka00080_CF_DI_Q_KOR.aspx';    
                        break;
                        case "3"://Year
                            f_nm='gfka00080_CF_DI_Y_KOR.aspx';  
                        break;
                    }
                     var url='/standard/reports/gf/ka/'+f_nm+r;       
                     System.OpenTargetPage( System.RootURL+url , "newform" );
                break;
            }
        break;
        case "ENG-VIE":
            r='?p_kind='+txtFinancialType.GetData()+'&p_status='+rbstatus.value+'&p_tco_company_pk='+lstCompany.GetData()+'&p_date_fr='+dtfrdate.GetData() + '&p_date_to='+ dttodate.GetData()+ '&p_date_type='+txtDateType.GetData()+"&p_Scale="+txtScale.GetData()+"&p_ccy="+lstCurrent.GetData();
             r= r + '&p_rate=' + txtrate1.GetData() + '&p_month=' + dtMonth.GetData();   
             var x=txtFinancialType.GetData();
             x=Number(x);
            switch(x)
            {
                case 21:
                    switch(rdoType.value)
                    {
                        case "1"://Monthly
                             var url = '/standard/reports/gf/ka/gfka00080_BS_ENG_VIE.aspx?p_status='+ rbstatus.GetData() +'&p_company_pk=' + lstCompany.GetData() + '&p_date_f=' + dtfrdate.GetData() + '&p_date_t=' + dttodate.GetData() + '&p_kind=' + txtFinancialType.GetData() + '&p_crt_by=' + emp_id+"&p_ccy="+lstCurrent.GetData() +"&p_Scale="+txtScale.GetData();
                              System.OpenTargetPage( System.RootURL+url , "newform" );
                        break;
                        case "2"://Quarter
                           // f_nm='gfka00080_CF_QUARTER_KOR.aspx';    
                        break;
                        case "3"://Year
                             //f_nm='gfka00080_CF_KOR.aspx';  
                        break;
                    }
                     //var url='/standard/reports/gf/ka/'+f_nm+r;       
                   // System.OpenTargetPage( System.RootURL+url , "newform" );
                break;
               case 25: // Income statement

				 switch(rdoType.value)
                    {
                        case "1"://Monthly
                            // f_nm='gfka00080_IC_PERIOD_VIE.aspx';
							 f_nm='gfka00080_IC_M_ENG_VIE.aspx';
                        break;
                        case "2"://Quarter
                            f_nm='gfka00080_IC_QUARTER_ENG_VIE.aspx';  
                        break;
                        case "3"://Year
                             f_nm='gfka00080_IC_YEAR_ENG_VIE.aspx';   
                        break;
                    }
					 var url='/standard/reports/gf/ka/'+f_nm+r; 
                  
                    System.OpenTargetPage( System.RootURL+url , "newform" );
                break;
                 case 24: // Cash Flow (Direct method)
                    switch(rdoType.value)
                    {
                        case "1"://Monthly
                            f_nm='gfka00080_CF_DI_M_ENG_VIE.aspx';
                        break;
                        case "2"://Quarter
                            f_nm='gfka00080_CF_DI_Q_ENG_VIE.aspx';    
                        break;
                        case "3"://Year
                            f_nm='gfka00080_CF_DI_Y_ENG_VIE.aspx';  
                        break;
                    }
                     var url='/standard/reports/gf/ka/'+f_nm+r;       
                     System.OpenTargetPage( System.RootURL+url , "newform" );
                break;
            }
        break;
        case "KOR-VIE":
            r='?p_kind='+txtFinancialType.GetData()+'&p_status='+rbstatus.value+'&p_tco_company_pk='+lstCompany.GetData()+'&p_date_fr='+dtfrdate.GetData() + '&p_date_to='+ dttodate.GetData()+ '&p_date_type='+txtDateType.GetData()+"&p_Scale="+txtScale.GetData()+"&p_ccy="+lstCurrent.GetData();
             r= r + '&p_rate=' + txtrate1.GetData() + '&p_month=' + dtMonth.GetData();   
             var x=txtFinancialType.GetData();
             x=Number(x);
            switch(x)
            {
                case 21:
                    switch(rdoType.value)
                    {
                        case "1"://Monthly
                             var url = '/standard/reports/gf/ka/gfka00080_BS_KOR_VIE.aspx?p_status='+ rbstatus.GetData() +'&p_company_pk=' + lstCompany.GetData() + '&p_date_f=' + dtfrdate.GetData() + '&p_date_t=' + dttodate.GetData() + '&p_kind=' + txtFinancialType.GetData() + '&p_crt_by=' + emp_id+"&p_ccy="+lstCurrent.GetData() +"&p_Scale="+txtScale.GetData();
                              System.OpenTargetPage( System.RootURL+url , "newform" );
                        break;
                        case "2"://Quarter
                           // f_nm='gfka00080_CF_QUARTER_KOR.aspx';    
                        break;
                        case "3"://Year
                             //f_nm='gfka00080_CF_KOR.aspx';  
                        break;
                    }
                     //var url='/standard/reports/gf/ka/'+f_nm+r;       
                   // System.OpenTargetPage( System.RootURL+url , "newform" );
                break;
               case 25: // Income statement

				 switch(rdoType.value)
                    {
                        case "1"://Monthly
                            // f_nm='gfka00080_IC_PERIOD_VIE.aspx';
							 f_nm='gfka00080_IC_M_VIE_KOR.aspx';
                        break;
                        case "2"://Quarter
                            f_nm='gfka00080_IC_QUARTER_KOR_VIE.aspx';  
                        break;
                        case "3"://Year
                             f_nm='gfka00080_IC_YEAR_KOR_VIE.aspx';   
                        break;
                    }
					 var url='/standard/reports/gf/ka/'+f_nm+r; 
                  
                    System.OpenTargetPage( System.RootURL+url , "newform" );
                break;
                case 24: // Cash Flow (Direct method)
                    switch(rdoType.value)
                    {
                        case "1"://Monthly
                            f_nm='gfka00080_CF_DI_M_Kor_Vie.aspx';
                        break;
                        case "2"://Quarter
                            f_nm='gfka00080_CF_DI_Q_Kor_Vie.aspx';    
                        break;
                        case "3"://Year
                            f_nm='gfka00080_CF_DI_Y_Kor_Vie.aspx';  
                        break;
                    }
                     var url='/standard/reports/gf/ka/'+f_nm+r;       
                     System.OpenTargetPage( System.RootURL+url , "newform" );
                break;
            }
        break;
        case "ENG-VIE-KOR":
            r='?p_kind='+txtFinancialType.GetData()+'&p_status='+rbstatus.value+'&p_tco_company_pk='+lstCompany.GetData()+'&p_date_fr='+dtfrdate.GetData() + '&p_date_to='+ dttodate.GetData()+ '&p_date_type='+txtDateType.GetData()+"&p_Scale="+txtScale.GetData()+"&p_ccy="+lstCurrent.GetData();
             r= r + '&p_rate=' + txtrate1.GetData() + '&p_month=' + dtMonth.GetData();   
             var x=txtFinancialType.GetData();
             x=Number(x);
            switch(x)
            {
                case 21:
                    switch(rdoType.value)
                    {
                        case "1"://Monthly
                             var url = '/standard/reports/gf/ka/gfka00080_BS_ENG_VIE_KOR.aspx?p_status='+ rbstatus.GetData() +'&p_company_pk=' + lstCompany.GetData() + '&p_date_f=' + dtfrdate.GetData() + '&p_date_t=' + dttodate.GetData() + '&p_kind=' + txtFinancialType.GetData() + '&p_crt_by=' + emp_id+"&p_ccy="+lstCurrent.GetData() +"&p_Scale="+txtScale.GetData();
                              System.OpenTargetPage( System.RootURL+url , "newform" );
                        break;
                        case "2"://Quarter
                           // f_nm='gfka00080_CF_QUARTER_KOR.aspx';    
                        break;
                        case "3"://Year
                             //f_nm='gfka00080_CF_KOR.aspx';  
                        break;
                    }
                     //var url='/standard/reports/gf/ka/'+f_nm+r;       
                   // System.OpenTargetPage( System.RootURL+url , "newform" );
                break;
               case 25: // Income statement

				 switch(rdoType.value)
                    {
                        case "1"://Monthly
                            // f_nm='gfka00080_IC_PERIOD_VIE.aspx';
							 f_nm='gfka00080_IC_M_ENG_VIE_KOR.aspx';
                        break;
                        case "2"://Quarter
                            f_nm='gfka00080_IC_QUARTER_ENG_VIE_KOR.aspx';  
                        break;
                        case "3"://Year
                             f_nm='gfka00080_IC_YEAR_ENG_VIE_KOR.aspx';   
                        break;
                    }
					 var url='/standard/reports/gf/ka/'+f_nm+r; 
                  
                    System.OpenTargetPage( System.RootURL+url , "newform" );
                break;
                case 24: // Cash Flow (Direct method)
                    switch(rdoType.value)
                    {
                        case "1"://Monthly
                            f_nm='gfka00080_CF_DI_M_ENG_VIE_KOR.aspx';
                        break;
                        case "2"://Quarter
                            f_nm='gfka00080_CF_DI_Q_ENG_VIE_KOR.aspx';    
                        break;
                        case "3"://Year
                            f_nm='gfka00080_CF_DI_Y_ENG_VIE_KOR.aspx';  
                        break;
                    }
                     var url='/standard/reports/gf/ka/'+f_nm+r;       
                     System.OpenTargetPage( System.RootURL+url , "newform" );
                break;
            }
        break;
        case "ENG-KOR":
            r='?p_kind='+txtFinancialType.GetData()+'&p_status='+rbstatus.value+'&p_tco_company_pk='+lstCompany.GetData()+'&p_date_fr='+dtfrdate.GetData() + '&p_date_to='+ dttodate.GetData()+ '&p_date_type='+txtDateType.GetData()+"&p_Scale="+txtScale.GetData()+"&p_ccy="+lstCurrent.GetData();
             r= r + '&p_rate=' + txtrate1.GetData() + '&p_month=' + dtMonth.GetData();   
             var x=txtFinancialType.GetData();
             x=Number(x);
            switch(x)
            {
                case 21:
                    switch(rdoType.value)
                    {
                        case "1"://Monthly
                             var url = '/standard/reports/gf/ka/gfka00080_BS_ENG_KOR.aspx?p_status='+ rbstatus.GetData() +'&p_company_pk=' + lstCompany.GetData() + '&p_date_f=' + dtfrdate.GetData() + '&p_date_t=' + dttodate.GetData() + '&p_kind=' + txtFinancialType.GetData() + '&p_crt_by=' + emp_id+"&p_ccy="+lstCurrent.GetData() +"&p_Scale="+txtScale.GetData();
                              System.OpenTargetPage( System.RootURL+url , "newform" );
                        break;
                        case "2"://Quarter
                           // f_nm='gfka00080_CF_QUARTER_KOR.aspx';    
                        break;
                        case "3"://Year
                             //f_nm='gfka00080_CF_KOR.aspx';  
                        break;
                    }
                     //var url='/standard/reports/gf/ka/'+f_nm+r;       
                   // System.OpenTargetPage( System.RootURL+url , "newform" );
                break;
               case 25: // Income statement

				 switch(rdoType.value)
                    {
                        case "1"://Monthly
                            // f_nm='gfka00080_IC_PERIOD_VIE.aspx';
							 f_nm='gfka00080_IC_M_ENG_KOR.aspx';
                        break;
                        case "2"://Quarter
                            f_nm='gfka00080_IC_QUARTER_ENG_KOR.aspx';  
                        break;
                        case "3"://Year
                             f_nm='gfka00080_IC_YEAR_ENG_KOR.aspx';   
                        break;
                    }
					 var url='/standard/reports/gf/ka/'+f_nm+r; 
                    System.OpenTargetPage( System.RootURL+url , "newform" );
                break;
                 case 24: // Cash Flow (Direct method)
                    switch(rdoType.value)
                    {
                        case "1"://Monthly
                            f_nm='gfka00080_CF_DI_M_ENG_KOR.aspx';
                        break;
                        case "2"://Quarter
                            f_nm='gfka00080_CF_DI_Q_ENG_KOR.aspx';    
                        break;
                        case "3"://Year
                            f_nm='gfka00080_CF_DI_Y_ENG_KOR.aspx';  
                        break;
                    }
                     var url='/standard/reports/gf/ka/'+f_nm+r;       
                     System.OpenTargetPage( System.RootURL+url , "newform" );
                break;
            }
        break;
    }
}
//-------------------------------------------------------------------------------
function onSetColor()
{
    var ctrl = idGrid.GetGridControl();
    for (i = 1; i < ctrl.Rows; i++)
	{
	    if(idGrid.GetGridData(i,11)== "B")
        {
	        ctrl.Cell(14, i, 1, i, 12) = false;
	        idGrid.SetCellBold(i, 1, i, 12, true);
        }
        else if (idGrid.GetGridData(i,11)== "I")
        {
	        idGrid.SetCellBold(i, 1, i, 12, false);
	        ctrl.Cell(14, i, 1, i, 12) = true; // Chu nghieng
	    }
	    else
	    {
	        ctrl.Cell(14, i, 1, i, 12) = false;
	        idGrid.SetCellBold(i, 1, i, 12, false);
	    }
	    idGrid.SetCellBgColor(i, 0, i, 12, Number(idGrid.GetGridData(i, 12)));
	}
}
//----------------------------------------------------------------------
function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise
}
//------------------------------------------------------------------------
function onEnter()
{
    
}
//-------------------------------------------------------------------------
function onSetMonth(p_bool)
{
    if (p_bool)
    {
        dtfrdate.style.display = '';
        dttodate.style.display = '';
        //dtfrmonth.style.display = 'none';
        //dttomonth.style.display = 'none';
    }
    else
    {
        dtfrdate.style.display = 'none';
        dttodate.style.display = 'none';
        //dtfrmonth.style.display = '';
        //dttomonth.style.display = '';
    }
}
//-----------------------------------------------------------------------------
function OnChangeList()
{
    if (txtFinancialType.GetData() == '21')
    {
        idTab_Child.SetPage(0);
        onSetMonth(true);
    }
    else if (txtFinancialType.GetData() == '25')
    {
        idTab_Child.SetPage(1);
        onSetMonth(false);
    }
    else if (txtFinancialType.GetData() == '24')
    {
        idTab_Child.SetPage(2);
        onSetMonth(false);
    }
}
//--------------------------------------------------------------------------------
function OnChangeCurrent()
{
    dso_get_rate.Call();
}
//-------------------------------------------------------------------------------
function onSetDataList()
{
    if (idTab_Child.GetCurrentPageNo() == 0)
    {
        txtFinancialType.SetDataText('21');
    }
    else if (idTab_Child.GetCurrentPageNo() == 1)
    {
        txtFinancialType.SetDataText('25');
    }
    else if (idTab_Child.GetCurrentPageNo() == 2)
    {
        txtFinancialType.SetDataText('24');
    }
   
    OnChangeDateType();
}
//-----------------------------------------------------------------------------
function OnChangeLang()
{
    switch(lstLang.GetData())
    {
        case "VIE":
            grid_ic.GetGridControl().ColHidden(0) = true;
            grid_ic.GetGridControl().ColHidden(1) = false;
            grid_ic.GetGridControl().ColHidden(2) = true;
            
            grid_ic.GetGridControl().ColHidden(3) = true;
            grid_ic.GetGridControl().ColHidden(4) = true;
            grid_ic.GetGridControl().ColHidden(5) = true;
            
            grid_ic.GetGridControl().ColWidth(0)  = "0";
            grid_ic.GetGridControl().ColWidth(1)  = "4200";
            grid_ic.GetGridControl().ColWidth(2)  = "0";
            grid_ic.GetGridControl().ColWidth(3)  = "0";
            grid_ic.GetGridControl().ColWidth(4)  = "0";
            grid_ic.GetGridControl().ColWidth(5)  = "0";
            grid_ic.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
            
            //-----------------------------------------------
             // BS
           
            grid_bs.GetGridControl().ColHidden(0) = true;
            grid_bs.GetGridControl().ColHidden(1) = false;
            grid_bs.GetGridControl().ColHidden(2) = true;
            
            grid_bs.GetGridControl().ColHidden(3) = true;
            grid_bs.GetGridControl().ColHidden(4) = true;
            grid_bs.GetGridControl().ColHidden(5) = true;
            
            grid_bs.GetGridControl().ColWidth(0)  = "0";
            grid_bs.GetGridControl().ColWidth(1)  = "4200";
            grid_bs.GetGridControl().ColWidth(2)  = "0";
            grid_bs.GetGridControl().ColWidth(3)  = "0";
            grid_bs.GetGridControl().ColWidth(4)  = "0";
            grid_bs.GetGridControl().ColWidth(5)  = "0";
            grid_bs.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
            
           
             //--------Cash flow direct method------------------
            grid_cf_di.GetGridControl().ColHidden(0) = true;
            grid_cf_di.GetGridControl().ColHidden(1) = false;
            grid_cf_di.GetGridControl().ColHidden(2) = true;
            
            grid_cf_di.GetGridControl().ColHidden(3) = true;
            grid_cf_di.GetGridControl().ColHidden(4) = true;
            grid_cf_di.GetGridControl().ColHidden(5) = true;
            
            grid_cf_di.GetGridControl().ColWidth(0)  = "0";
            grid_cf_di.GetGridControl().ColWidth(1)  = "4200";
            grid_cf_di.GetGridControl().ColWidth(2)  = "0";
            grid_cf_di.GetGridControl().ColWidth(3)  = "0";
            grid_cf_di.GetGridControl().ColWidth(4)  = "0";
            grid_cf_di.GetGridControl().ColWidth(5)  = "0";
            grid_cf_di.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
            //---------------------------------------------------
           
        break;
        case "ENG":
           // income statement
                       
            grid_ic.GetGridControl().ColHidden(0) = false;
            grid_ic.GetGridControl().ColHidden(1) = true;
            grid_ic.GetGridControl().ColHidden(2) = true;
            
            grid_ic.GetGridControl().ColHidden(3) = true;
            grid_ic.GetGridControl().ColHidden(4) = true;
            grid_ic.GetGridControl().ColHidden(5) = true;
            
            grid_ic.GetGridControl().ColWidth(0)  = "4200";
            grid_ic.GetGridControl().ColWidth(1)  = "0";
            grid_ic.GetGridControl().ColWidth(2)  = "0";
            grid_ic.GetGridControl().ColWidth(3)  = "0";
            grid_ic.GetGridControl().ColWidth(4)  = "0";
            grid_ic.GetGridControl().ColWidth(5)  = "0";
            grid_ic.GetGridControl().Cell(0, 0, 0, 0, 0) = "Item";
           
      
            
             // bs
           
            
            grid_bs.GetGridControl().ColHidden(0) = false;
            grid_bs.GetGridControl().ColHidden(1) = true;
            grid_bs.GetGridControl().ColHidden(2) = true;
            
            grid_bs.GetGridControl().ColHidden(3) = true;
            grid_bs.GetGridControl().ColHidden(4) = true;
            grid_bs.GetGridControl().ColHidden(5) = true;
            
            grid_bs.GetGridControl().ColWidth(0)  = "4200";
            grid_bs.GetGridControl().ColWidth(1)  = "0";
            grid_bs.GetGridControl().ColWidth(2)  = "0";
            grid_bs.GetGridControl().ColWidth(3)  = "0";
            grid_bs.GetGridControl().ColWidth(4)  = "0";
            grid_bs.GetGridControl().ColWidth(5)  = "0";
            grid_bs.GetGridControl().Cell(0, 0, 0, 0, 0) = "Item";
          
            //--------Cash flow direct method------------------
            grid_cf_di.GetGridControl().ColHidden(0) = false;
            grid_cf_di.GetGridControl().ColHidden(1) = true;
            grid_cf_di.GetGridControl().ColHidden(2) = true;
            
            grid_cf_di.GetGridControl().ColHidden(3) = true;
            grid_cf_di.GetGridControl().ColHidden(4) = true;
            grid_cf_di.GetGridControl().ColHidden(5) = true;
            
            grid_cf_di.GetGridControl().ColWidth(0)  = "4200";
            grid_cf_di.GetGridControl().ColWidth(1)  = "0";
            grid_cf_di.GetGridControl().ColWidth(2)  = "0";
            grid_cf_di.GetGridControl().ColWidth(3)  = "0";
            grid_cf_di.GetGridControl().ColWidth(4)  = "0";
            grid_cf_di.GetGridControl().ColWidth(5)  = "0";
            grid_cf_di.GetGridControl().Cell(0, 0, 0, 0, 0) = "Item";
            //---------------------------------------------------
            
        break;
        case "KOR":
           // income statement
           
           
            //--------Balance sheet      ------------------
            grid_bs.GetGridControl().ColHidden(0) = true;
            grid_bs.GetGridControl().ColHidden(1) = true;
            grid_bs.GetGridControl().ColHidden(2) = false;
            
            grid_bs.GetGridControl().ColHidden(3) = true;
            grid_bs.GetGridControl().ColHidden(4) = true;
            grid_bs.GetGridControl().ColHidden(5) = true;
            
            grid_bs.GetGridControl().ColWidth(0)  = "0";
            grid_bs.GetGridControl().ColWidth(1)  = "0";
            grid_bs.GetGridControl().ColWidth(2)  = "4200";
            grid_bs.GetGridControl().ColWidth(3)  = "0";
            grid_bs.GetGridControl().ColWidth(4)  = "0";
            grid_bs.GetGridControl().ColWidth(5)  = "0";
            grid_bs.GetGridControl().Cell(0, 0, 2, 0, 2) = "Item Korean";
            //--------Incomce statement      ------------------
            grid_ic.GetGridControl().ColHidden(0) = true;
            grid_ic.GetGridControl().ColHidden(1) = true;
            grid_ic.GetGridControl().ColHidden(2) = false;
            
            grid_ic.GetGridControl().ColHidden(3) = true;
            grid_ic.GetGridControl().ColHidden(4) = true;
            grid_ic.GetGridControl().ColHidden(5) = true;
            
            grid_ic.GetGridControl().ColWidth(0)  = "0";
            grid_ic.GetGridControl().ColWidth(1)  = "0";
            grid_ic.GetGridControl().ColWidth(2)  = "4200";
            grid_ic.GetGridControl().ColWidth(3)  = "0";
            grid_ic.GetGridControl().ColWidth(4)  = "0";
            grid_ic.GetGridControl().ColWidth(5)  = "0";
            grid_ic.GetGridControl().Cell(0, 0, 2, 0, 2) = "Item Korean";
          
            //--------Cash flow direct method------------------
            grid_cf_di.GetGridControl().ColHidden(0) = true;
            grid_cf_di.GetGridControl().ColHidden(1) = true;
            grid_cf_di.GetGridControl().ColHidden(2) = false;
            
            grid_cf_di.GetGridControl().ColHidden(3) = true;
            grid_cf_di.GetGridControl().ColHidden(4) = true;
            grid_cf_di.GetGridControl().ColHidden(5) = true;
            
            grid_cf_di.GetGridControl().ColWidth(0)  = "0";
            grid_cf_di.GetGridControl().ColWidth(1)  = "0";
            grid_cf_di.GetGridControl().ColWidth(2)  = "4200";
            grid_cf_di.GetGridControl().ColWidth(3)  = "0";
            grid_cf_di.GetGridControl().ColWidth(4)  = "0";
            grid_cf_di.GetGridControl().ColWidth(5)  = "0";
            grid_cf_di.GetGridControl().Cell(0, 0, 2, 0, 2) = "Item Korean";
        break;
        case "ENG-VIE":
           // income statement
           
            //--------Income statement             ------------------
            grid_ic.GetGridControl().ColHidden(0) = false;
            grid_ic.GetGridControl().ColHidden(1) = false;
            grid_ic.GetGridControl().ColHidden(2) = true;
            
            grid_ic.GetGridControl().ColHidden(3) = true;
            grid_ic.GetGridControl().ColHidden(4) = true;
            grid_ic.GetGridControl().ColHidden(5) = true;
            
            grid_ic.GetGridControl().ColWidth(0)  = "4200";
            grid_ic.GetGridControl().ColWidth(1)  = "4200";
            grid_ic.GetGridControl().ColWidth(2)  = "0";
            grid_ic.GetGridControl().ColWidth(3)  = "0";
            grid_ic.GetGridControl().ColWidth(4)  = "0";
            grid_ic.GetGridControl().ColWidth(5)  = "0";
            grid_ic.GetGridControl().Cell(0, 0, 0, 0, 0) = "Item ";
            grid_ic.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
            //--------Balance sheet              ------------------
            grid_bs.GetGridControl().ColHidden(0) = false;
            grid_bs.GetGridControl().ColHidden(1) = false;
            grid_bs.GetGridControl().ColHidden(2) = true;
            
            grid_bs.GetGridControl().ColHidden(3) = true;
            grid_bs.GetGridControl().ColHidden(4) = true;
            grid_bs.GetGridControl().ColHidden(5) = true;
            
            grid_bs.GetGridControl().ColWidth(0)  = "4200";
            grid_bs.GetGridControl().ColWidth(1)  = "4200";
            grid_bs.GetGridControl().ColWidth(2)  = "0";
            grid_bs.GetGridControl().ColWidth(3)  = "0";
            grid_bs.GetGridControl().ColWidth(4)  = "0";
            grid_bs.GetGridControl().ColWidth(5)  = "0";
            grid_bs.GetGridControl().Cell(0, 0, 0, 0, 0) = "Item ";
            grid_bs.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
           
             //--------Cash flow direct method------------------
            grid_cf_di.GetGridControl().ColHidden(0) = false;
            grid_cf_di.GetGridControl().ColHidden(1) = false;
            grid_cf_di.GetGridControl().ColHidden(2) = true;
            
            grid_cf_di.GetGridControl().ColHidden(3) = true;
            grid_cf_di.GetGridControl().ColHidden(4) = true;
            grid_cf_di.GetGridControl().ColHidden(5) = true;
            
            grid_cf_di.GetGridControl().ColWidth(0)  = "4200";
            grid_cf_di.GetGridControl().ColWidth(1)  = "4200";
            grid_cf_di.GetGridControl().ColWidth(2)  = "0";
            grid_cf_di.GetGridControl().ColWidth(3)  = "0";
            grid_cf_di.GetGridControl().ColWidth(4)  = "0";
            grid_cf_di.GetGridControl().ColWidth(5)  = "0";
            grid_cf_di.GetGridControl().Cell(0, 0, 0, 0, 0) = "Item ";
            grid_cf_di.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
            //---------------------------------------------------
        break;
        case "KOR-VIE":
           
             //--------Balance sheet            ------------------
            grid_bs.GetGridControl().ColHidden(0) = true;
            grid_bs.GetGridControl().ColHidden(1) = false;
            grid_bs.GetGridControl().ColHidden(2) = false;
            
            grid_bs.GetGridControl().ColHidden(3) = true;
            grid_bs.GetGridControl().ColHidden(4) = true;
            grid_bs.GetGridControl().ColHidden(5) = true;
            
            grid_bs.GetGridControl().ColWidth(0)  = "0";
            grid_bs.GetGridControl().ColWidth(1)  = "4200";
            grid_bs.GetGridControl().ColWidth(2)  = "4200";
            grid_bs.GetGridControl().ColWidth(3)  = "0";
            grid_bs.GetGridControl().ColWidth(4)  = "0";
            grid_bs.GetGridControl().ColWidth(5)  = "0";
            grid_bs.GetGridControl().Cell(0, 0, 2, 0, 2) = "Item Korean";
            grid_bs.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
             //--------Income statement            ------------------
            grid_ic.GetGridControl().ColHidden(0) = true;
            grid_ic.GetGridControl().ColHidden(1) = false;
            grid_ic.GetGridControl().ColHidden(2) = false;
            
            grid_ic.GetGridControl().ColHidden(3) = true;
            grid_ic.GetGridControl().ColHidden(4) = true;
            grid_ic.GetGridControl().ColHidden(5) = true;
            
            grid_ic.GetGridControl().ColWidth(0)  = "0";
            grid_ic.GetGridControl().ColWidth(1)  = "4200";
            grid_ic.GetGridControl().ColWidth(2)  = "4200";
            grid_ic.GetGridControl().ColWidth(3)  = "0";
            grid_ic.GetGridControl().ColWidth(4)  = "0";
            grid_ic.GetGridControl().ColWidth(5)  = "0";
            grid_ic.GetGridControl().Cell(0, 0, 2, 0, 2) = "Item Korean";
            grid_ic.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
            
             //--------Cash flow Direct method------------------
            grid_cf_di.GetGridControl().ColHidden(0) = true;
            grid_cf_di.GetGridControl().ColHidden(1) = false;
            grid_cf_di.GetGridControl().ColHidden(2) = false;
            
            grid_cf_di.GetGridControl().ColHidden(3) = true;
            grid_cf_di.GetGridControl().ColHidden(4) = true;
            grid_cf_di.GetGridControl().ColHidden(5) = true;
            
            grid_cf_di.GetGridControl().ColWidth(0)  = "0";
            grid_cf_di.GetGridControl().ColWidth(1)  = "4200";
            grid_cf_di.GetGridControl().ColWidth(2)  = "4200";
            grid_cf_di.GetGridControl().ColWidth(3)  = "0";
            grid_cf_di.GetGridControl().ColWidth(4)  = "0";
            grid_cf_di.GetGridControl().ColWidth(5)  = "0";
            grid_cf_di.GetGridControl().Cell(0, 0, 2, 0, 2) = "Item Korean";
            grid_cf_di.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
        break;
        
         case "ENG-VIE-KOR":
           
            //--------Balance sheet          ------------------
            grid_bs.GetGridControl().ColHidden(0) = false;
            grid_bs.GetGridControl().ColHidden(1) = false;
            grid_bs.GetGridControl().ColHidden(2) = false;
            
            grid_bs.GetGridControl().ColHidden(3) = true;
            grid_bs.GetGridControl().ColHidden(4) = true;
            grid_bs.GetGridControl().ColHidden(5) = true;
            
            grid_bs.GetGridControl().ColWidth(0)  = "4200";
            grid_bs.GetGridControl().ColWidth(1)  = "5000";
            grid_bs.GetGridControl().ColWidth(2)  = "4200";
            grid_bs.GetGridControl().ColWidth(3)  = "0";
            grid_bs.GetGridControl().ColWidth(4)  = "0";
            grid_bs.GetGridControl().ColWidth(5)  = "0";
            grid_bs.GetGridControl().Cell(0, 0, 2, 0, 2) = "Item Korean";
            grid_bs.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
            grid_bs.GetGridControl().Cell(0, 0, 0, 0, 0) = "Item";
             //--------Income statement          ------------------
            grid_ic.GetGridControl().ColHidden(0) = false;
            grid_ic.GetGridControl().ColHidden(1) = false;
            grid_ic.GetGridControl().ColHidden(2) = false;
            
            grid_ic.GetGridControl().ColHidden(3) = true;
            grid_ic.GetGridControl().ColHidden(4) = true;
            grid_ic.GetGridControl().ColHidden(5) = true;
            
            grid_ic.GetGridControl().ColWidth(0)  = "4200";
            grid_ic.GetGridControl().ColWidth(1)  = "4200";
            grid_ic.GetGridControl().ColWidth(2)  = "4200";
            grid_ic.GetGridControl().ColWidth(3)  = "0";
            grid_ic.GetGridControl().ColWidth(4)  = "0";
            grid_ic.GetGridControl().ColWidth(5)  = "0";
            grid_ic.GetGridControl().Cell(0, 0, 2, 0, 2) = "Item Korean";
            grid_ic.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
            grid_ic.GetGridControl().Cell(0, 0, 0, 0, 0) = "Item";
            
            //--------Cash flow Direct method------------------
            grid_cf_di.GetGridControl().ColHidden(0) = false;
            grid_cf_di.GetGridControl().ColHidden(1) = false;
            grid_cf_di.GetGridControl().ColHidden(2) = false;
            
            grid_cf_di.GetGridControl().ColHidden(3) = true;
            grid_cf_di.GetGridControl().ColHidden(4) = true;
            grid_cf_di.GetGridControl().ColHidden(5) = true;
            
            grid_cf_di.GetGridControl().ColWidth(0)  = "4200";
            grid_cf_di.GetGridControl().ColWidth(1)  = "4200";
            grid_cf_di.GetGridControl().ColWidth(2)  = "4200";
            grid_cf_di.GetGridControl().ColWidth(3)  = "0";
            grid_cf_di.GetGridControl().ColWidth(4)  = "0";
            grid_cf_di.GetGridControl().ColWidth(5)  = "0";
            grid_cf_di.GetGridControl().Cell(0, 0, 2, 0, 2) = "Item Korean";
            grid_cf_di.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
            grid_cf_di.GetGridControl().Cell(0, 0, 0, 0, 0) = "Item";
        break;
		case "ENG-KOR":
           
            //--------Balance sheet          ------------------
            grid_bs.GetGridControl().ColHidden(0) = false;
            grid_bs.GetGridControl().ColHidden(1) = true;
            grid_bs.GetGridControl().ColHidden(2) = false;
            
            grid_bs.GetGridControl().ColHidden(3) = false;
            grid_bs.GetGridControl().ColHidden(4) = false;
            grid_bs.GetGridControl().ColHidden(5) = false;
            
            grid_bs.GetGridControl().ColWidth(0)  = "4200";
            grid_bs.GetGridControl().ColWidth(1)  = "0";
            grid_bs.GetGridControl().ColWidth(2)  = "4200";
            grid_bs.GetGridControl().ColWidth(3)  = "0";
            grid_bs.GetGridControl().ColWidth(4)  = "0";
            grid_bs.GetGridControl().ColWidth(5)  = "0";
            grid_bs.GetGridControl().Cell(0, 0, 2, 0, 2) = "Item Korean";
            grid_bs.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
            grid_bs.GetGridControl().Cell(0, 0, 0, 0, 0) = "Item";
             //--------Income statement          ------------------
            grid_ic.GetGridControl().ColHidden(0) = false;
            grid_ic.GetGridControl().ColHidden(1) = true;
            grid_ic.GetGridControl().ColHidden(2) = false;
            
            grid_ic.GetGridControl().ColHidden(3) = false;
            grid_ic.GetGridControl().ColHidden(4) = false;
            grid_ic.GetGridControl().ColHidden(5) = false;
            
            grid_ic.GetGridControl().ColWidth(0)  = "4200";
            grid_ic.GetGridControl().ColWidth(1)  = "0";
            grid_ic.GetGridControl().ColWidth(2)  = "4200";
            grid_ic.GetGridControl().ColWidth(3)  = "0";
            grid_ic.GetGridControl().ColWidth(4)  = "0";
            grid_ic.GetGridControl().ColWidth(5)  = "0";
            grid_ic.GetGridControl().Cell(0, 0, 2, 0, 2) = "Item Korean";
            grid_ic.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
            grid_ic.GetGridControl().Cell(0, 0, 0, 0, 0) = "Item";
            
            //--------Cash flow Direct method------------------
            grid_cf_di.GetGridControl().ColHidden(0) = false;
            grid_cf_di.GetGridControl().ColHidden(1) = true;
            grid_cf_di.GetGridControl().ColHidden(2) = false;
            
            grid_cf_di.GetGridControl().ColHidden(3) = false;
            grid_cf_di.GetGridControl().ColHidden(4) = false;
            grid_cf_di.GetGridControl().ColHidden(5) = false;
            
            grid_cf_di.GetGridControl().ColWidth(0)  = "4200";
            grid_cf_di.GetGridControl().ColWidth(1)  = "0";
            grid_cf_di.GetGridControl().ColWidth(2)  = "4200";
            grid_cf_di.GetGridControl().ColWidth(3)  = "0";
            grid_cf_di.GetGridControl().ColWidth(4)  = "0";
            grid_cf_di.GetGridControl().ColWidth(5)  = "0";
            grid_cf_di.GetGridControl().Cell(0, 0, 2, 0, 2) = "Item Korean";
            grid_cf_di.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
            grid_cf_di.GetGridControl().Cell(0, 0, 0, 0, 0) = "Item";
        break;
    }
   
}
//---------------------------------------------------------------
function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {
        case "dso_trial_balance":
            if (txtFinancialType.GetData() == '21')
            {
                dso_sel_grd_balance_sheet.Call("SELECT");
            }
            else if (txtFinancialType.GetData() == '25')
            {
                dso_sel_grd_income.Call("SELECT");
            }
        break;
        case "dso_get_rate":
            if(idTab_Child.GetCurrentPageNo()=="1")
            {
                dso_sel_grd_income.Call("SELECT");
            }
        break;
    }
}
//---------------------------------------------------------------------
function onSetFont(p_oData)
{
    switch(p_oData.id)
    {
        case "dso_sel_grd_balance_sheet":
            var ctrl = grid_bs.GetGridControl();
            for (i = 1; i < ctrl.Rows; i++)
	        {
	            if(grid_bs.GetGridData(i,10)== "B")
                {
	                ctrl.Cell(14, i, 0, i, 10) = false;
	                grid_bs.SetCellBold(i, 0, i, 10, true);
                }
                else if (grid_bs.GetGridData(i,10)== "I")
                {
	                grid_bs.SetCellBold(i, 0, i, 10, false);
	                ctrl.Cell(14, i, 0, i, 10) = true; // Chu nghieng
	            }
	            else
	            {
	                ctrl.Cell(14, i, 0, i, 10) = false;
	                grid_bs.SetCellBold(i, 0, i, 10, false);
	            }
	            //set color
	            grid_bs.SetCellBgColor(i, 0, i, 11, Number(grid_bs.GetGridData(i, 11)));
	        }
	        OnChangeLang();
	        grid_bs_sum.AddRow();
	        grid_bs_sum.AddRow();
        break;
        
        case "dso_sel_grd_income":
            var ctrl = grid_ic.GetGridControl();
            for (i = 1; i < ctrl.Rows; i++)
	        {
	            if(grid_ic.GetGridData(i,8)== "B")
                {
	                ctrl.Cell(14, i, 0, i, 13) = false;
	                grid_ic.SetCellBold(i, 0, i, 13, true);
                }
                else if (grid_ic.GetGridData(i,8)== "I")
                {
	                grid_ic.SetCellBold(i, 0, i, 13, false);
	                ctrl.Cell(14, i, 0, i, 13) = true; // Chu nghieng
	            }
	            else
	            {
	                ctrl.Cell(14, i, 0, i, 13) = false;
	                grid_ic.SetCellBold(i, 0, i, 13, false);
	            }
	            //set color
	            grid_ic.SetCellBgColor(i, 0, i, 13, Number(grid_ic.GetGridData(i, 13)));
	        }
        break;
        
       
        case "dso_gfka00080_2":
         
            var ctrl = grid_cf_di.GetGridControl();
            
            for (i = 1; i < ctrl.Rows; i++)
            {
                if(grid_cf_di.GetGridData(i,8)== "B")
                {
                    ctrl.Cell(14, i, 0, i, 11) = false;
                    grid_cf_di.SetCellBold(i, 0, i, 11, true);
                }
                else if (grid_cf_di.GetGridData(i,8)== "I")
                {
                    grid_cf_di.SetCellBold(i, 0, i, 11, false);
                    ctrl.Cell(14, i, 0, i, 11) = true; // Chu nghieng
                }
                else
                {
                    ctrl.Cell(14, i, 0, i, 11) = false;
                    grid_cf_di.SetCellBold(i, 0, i, 11, false);
                }
                //set color
                grid_cf_di.SetCellBgColor(i, 0, i, 13, Number(grid_cf_di.GetGridData(i, 13)));
             }
            
        break;
    }
}
//-------------------------------------------------------------------------------
function OnPrint()
{
	
			if(lstLang.GetData()=='VIE'&& txtFinancialType.GetData()=="21")
					{
						var url = System.RootURL + "/standard/reports/60/08/rpt_60081336_vie.aspx?p_tco_company_pk=" + lstCompany.value+"&p_from_month="+ dtfrdate.value+ "&p_to_month="+ dttodate.value+"&p_status="+rbstatus.value+"&p_scale="+txtScale.text+"&p_from_text="+dtfrdate.text+"&p_to_text="+dttodate.text+"&p_ccy="+lstCurrent.GetData()+'&p_lang='+lstLang.value+"&p_text_company="+lstCompany.GetData();
						System.OpenTargetPage(url); 
					}
			if(lstLang.GetData()=='ENG'&& txtFinancialType.GetData()=="21")
					{
						var url = System.RootURL + "/standard/reports/60/08/rpt_60081336_eng.aspx?p_tco_company_pk=" + lstCompany.value+"&p_from_month="+ dtfrdate.value+ "&p_to_month="+ dttodate.value+"&p_status="+rbstatus.value+"&p_scale="+txtScale.text+"&p_from_text="+dtfrdate.text+"&p_to_text="+dttodate.text+"&p_ccy="+lstCurrent.GetData()+'&p_lang='+lstLang.value+"&p_text_company="+lstCompany.GetData();
						System.OpenTargetPage(url); 
					}
			if(lstLang.GetData()=='KOR' && txtFinancialType.GetData()=="21")
					{
						var url = System.RootURL + "/standard/reports/60/08/rpt_60081336_kor.aspx?p_tco_company_pk=" + lstCompany.value+"&p_from_month="+ dtfrdate.value+ "&p_to_month="+ dttodate.value+"&p_status="+rbstatus.value+"&p_scale="+txtScale.text+"&p_from_text="+dtfrdate.text+"&p_to_text="+dttodate.text+"&p_ccy="+lstCurrent.GetData()+'&p_lang='+lstLang.value+"&p_text_company="+lstCompany.GetData();
						System.OpenTargetPage(url); 
					}
			if(txtFinancialType.GetData()=="21" && lstLang.GetData()=='ENG-VIE-KOR'||lstLang.GetData()=='ENG-KOR'||lstLang.GetData()=='ENG-VIE'||lstLang.GetData()=='KOR-VIE')
					{
						var url = System.RootURL + "/standard/reports/60/08/rpt_60081336_eng_vie_kor.aspx?p_tco_company_pk=" + lstCompany.value+"&p_from_month="+ dtfrdate.value+ "&p_to_month="+ dttodate.value+"&p_status="+rbstatus.value+"&p_scale="+txtScale.text+"&p_from_text="+dtfrdate.text+"&p_to_text="+dttodate.text+"&p_ccy="+lstCurrent.GetData()+'&p_lang='+lstLang.value+"&p_text_company="+lstCompany.GetData();
						System.OpenTargetPage(url); 
					}
			
		
			if(txtFinancialType.GetData()=="25")
					{
						var url = System.RootURL + "/standard/reports/60/08/rpt_60081336_IC.aspx?p_form_type=" + txtFinancialType.GetData()+"&p_status="+ rbstatus.value+ "&p_tco_company_pk="+ lstCompany.value+"&p_date_fr="+dtfrdate.value+"&p_date_to="+dttodate.value+
						"&p_date_type="+txtDateType.value+"&p_scale="+txtScale.text+"&p_ccy="+lstCurrent.value+"&p_exrate="+txtrate1.GetData()+"&p_month="+dtMonth.value+						
						"&p_from_text="+dtfrdate.text+"&p_to_text="+dttodate.text+"&p_text_ccy="+lstCurrent.GetData()+'&p_lang='+lstLang.value;
						System.OpenTargetPage(url); 																								
						
					}
			if(txtFinancialType.GetData()=="24"&& lstLang.GetData()=='ENG-VIE-KOR'||lstLang.GetData()=='ENG-KOR'||lstLang.GetData()=='ENG-VIE'||lstLang.GetData()=='KOR-VIE')					{
						var url = System.RootURL + "/standard/reports/60/08/rpt_60081336_CF_DI.aspx?p_kind=" + txtFinancialType.GetData()+"&p_status="+ rbstatus.value+ "&p_tco_company_pk="+ lstCompany.value+"&p_date_fr="+dtfrdate.value+"&p_date_to="+dttodate.value+
						"&p_date_type="+txtDateType.value+"&p_scale="+txtScale.text+"&p_ccy="+lstCurrent.value+"&p_exrate="+txtrate1.GetData()+"&p_month="+dtMonth.value+						
						"&p_from_text="+dtfrdate.text+"&p_to_text="+dttodate.text+"&p_text_ccy="+lstCurrent.GetData()+'&p_lang='+lstLang.value;
						System.OpenTargetPage(url); 																								
						
					}
			if(txtFinancialType.GetData()=="24"&& lstLang.GetData()=='VIE')				
					{
						var url = System.RootURL + "/standard/reports/60/08/rpt_60081336_CF_DI_VIE.aspx?p_kind=" + txtFinancialType.GetData()+"&p_status="+ rbstatus.value+ "&p_tco_company_pk="+ lstCompany.value+"&p_date_fr="+dtfrdate.value+"&p_date_to="+dttodate.value+
						"&p_date_type="+txtDateType.value+"&p_scale="+txtScale.text+"&p_ccy="+lstCurrent.value+"&p_exrate="+txtrate1.GetData()+"&p_month="+dtMonth.value+						
						"&p_from_text="+dtfrdate.text+"&p_to_text="+dttodate.text+"&p_text_ccy="+lstCurrent.GetData()+'&p_lang='+lstLang.value;
						System.OpenTargetPage(url); 																								
						
					}
}
</script>

<body style="margin: 0; padding: 0;">
<!------------------------------------------------------------------------>
 <gw:data id="dso_getCompany" onreceive=""> 
        <xml> 
            <dso type="list" procedure="ac_sel_company_consolidate" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------------>

    <gw:data id="dso_get_rate" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="AC_PRO_GET_RATE"> 
                <input> 
                     <input bind="txt_date"/>
                     <input bind="lstCompany"/>
                     <input bind="lstCurrent" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtrate1"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    
    <gw:data id="dso_sel_grd_balance_sheet" onreceive="onSetFont(this)">
        <xml>
            <dso type="grid" function="ac_sel_60081336_BS_consol">
                <input bind="grid_bs">
                    <input bind="lstCompany"/>
					<input bind="dtfrdate" />
                    <input bind="dttodate"/>
					 <input bind="rbstatus"/>
                    <input bind="txtScale"/>
                </input>
                <output bind="grid_bs"/>
            </dso>
        </xml>
    </gw:data>
    <gw:data id="dso_sel_grd_income" onreceive="onSetFont(this)">
        <xml>
            <dso type="grid" function="ac_sel_60081336_ic_consol">
                <input bind="grid_ic">
                    <input bind="txtFinancialType"/>
                    <input bind="rbstatus"/>
                    <input bind="lstCompany"/>
                    <input bind="dtfrdate" />
                    <input bind="dttodate"/>
                    <input bind="txtDateType"/>
                    <input bind="txtScale"/>
                    <input bind="lstCurrent"/>
                    <input bind="txtrate1"/>
                    <input bind="dtMonth"/>
                </input>
                <output bind="grid_ic"/>
            </dso>
        </xml>
    </gw:data>
   
     <!---------------Cash flow(Direct method)-------------------------------------------------->
    <gw:data id="dso_gfka00080_2" onreceive="onSetFont(this)">
        <xml>
            <dso type="grid" function="ac_sel_60081336_cf_consol">
                <input bind="grid_cf_di">
                    <input bind="txtFinancialType"/>
                    <input bind="rbstatus"/>
                    <input bind="lstCompany"/>
                    <input bind="dtfrdate" />
                    <input bind="dttodate"/>
                    <input bind="txtDateType"/>
                    <input bind="txtScale"/>
                    <input bind="lstCurrent"/>
                    <input bind="txtrate1"/>
                    <input bind="dtMonth"/>
                </input>
                <output bind="grid_cf_di"/>
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------------------->
    <table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td width="100%">
              
                <table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
                    <tr height='4%'>
                        <td>
                            <table border="0" width="100%" id="table1">
	                            <tr>
		                            <td><fieldset style="padding: 2;width:100%; height:100%">
		                                <table border="0" width="100%" id="table2">
			                            <tr>
				                            <td width="5%">Company</td>
				                            <td width="20%" colspan=1><gw:list id="lstCompany" onchange="OnChangeList()" styles='width:100%' /></td>
				                            <td width="5%">Balance</td>
				                            <td width="25%"> <gw:radio id="rdoType" value="1" onchange="OnChangeDateType()"> 
                                                <span value="1" ><font color="black" >Monthly &nbsp;</font></span>
                                                <span value="2" ><font color="black" >Quarter</font></span>
                                                <span value="3" ><font color="black" >Year</font></span>
                                              </gw:radio>
                                            </td>
                                            <td width="5%"><gw:label id="lblDateType" text="Month:" styles="width:100%;font-weight:600;" /></td>
                                             <td width="10%">
                                                <gw:list id="lstQuater" styles="width:100%;" onchange="OnChangeQuater()" >
                                                    <data>Data|1|I|2|II|3|III|4|IV</data>
                                                </gw:list>
                                            </td>
                                            <td width="10%" colspan=2>
                                                <gw:datebox id="dtYear" type="year" lang="1" styles="display:none" onchange="OnChangeYear()"/>
                                                <gw:datebox id="dtMonth" type="month" lang="1" onchange="OnChangeMonth()"/>
                                            </td>
                                           
                                            <td width="10%">
                                                <gw:datebox id="dtfrdate" type="date" lang="1" />
                                            </td>
                                            <td width="10%" colspan=2>
                                                <gw:datebox id="dttodate" type="date" lang="1" />
                                            </td>
                                            <td width="3%">
                                                <gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="onSearch()" />
                                            </td>
                                            <td width="3%">
                                                <gw:imgbtn id="ibtnReport" img="excel" alt="Print" onclick="OnPrint()" />
                                            </td>
				                           
			                            </tr>
			                            <tr>
				                            <td width="5%">Language</td>
				                            <td width="20%" colspan=1><gw:list id="lstLang" onchange="OnChangeLang()" styles='width:100%' /></td>
				                            <td width="5%">Status</td>
				                            <td width="25%"> <gw:radio id="rbstatus" value="2" onchange="onSearch()"> 
		                                        <span value="2">Confirmed</span>
		                                        <span value="0">Approved</span>
		                                        </gw:radio>
                                            </td>
                                            <td width="5%"></td>
                                             <td width="10%">
                                                <gw:list id="lstCurrent" onchange="OnChangeCurrent()" styles='width:100%;display:none' />
                                            </td>
                                            <td width="8%" align=right>Ex Rate</td>
                                           
                                            <td width="2%"><gw:textbox id="txtrate" styles='width:100%' type="number" format="###,###.##R" /></td>
                                            <td width="10%"> <gw:textbox id="txtrate1" text="1" styles='width:100%' type="number" format="###,###.##R"
                                             onenterkey="onSearch()" /></td>
                                            <td width="3%" align=right>Unit</td>
                                            <td width="3%"><gw:textbox id="txtScale" styles='width:100%' type="number" format="###,###,###R"
                                              onenterkey="onSearch()" />
                                            </td>
                                             <td width="3%" colspan=2><gw:label id="lblBookccy" styles="width:100%;color:red; font-weight:700;" /></td>
			                            </tr>
		                            </table>
		                            </fieldset> </td>
	                            </tr>
                            </table>
                        </td>
                    </tr>
                    <tr height='96%'>
                        <td width="100%">
                            <table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td width="100%">
                                        <gw:tab id="idTab_Child" onpageactivate="onSetDataList()">
                    <table name="Balance Sheet(QD15)"  align ="top"  cellspacing=0 cellpadding=0 border=0 style="width:100%;height:100%;" >
                        <tr valign="top" height='100%'>
                            <!--0_Item|1.Item Local|2_Item Korea|3_English-Vietnamese|4_Korean-Vietnamese|5_English-Vietnamese-Korean|6.Code|7.Node|8.Closing|9.Oppening|10_Bold|11_Color-->
                            <td width="100%">
                                <gw:grid   
								        id="grid_bs"
						                header  ="_Item|Item Local|_Item Korea|_English-Vietnamese|_Korean-Vietnamese|_English-Vietnamese-Korean|Code|Node|Closing|Oppening|_Bold|_Color"
						                format  ="0|0|0|0|0|0|0|0|0|0|0|0"  
						                aligns  ="0|0|0|0|0|0|1|1|3|3|0|0"  
						                defaults="|||||||||||"  
						                editcol ="0|0|0|0|0|0|0|0|0|0|0|0"  
						                widths  ="5000|0|0|0|0|0|900|1000|2100|2000|0|0"  
						                styles  ="width:100%; height:100%"
						                sorting="F" 
						                /> 
                            </td>
                        </tr height=''> 
                        <tr valign="top" style="display: none" >
                            <td width="100%">
                                <gw:grid   
								        id      ="grid_bs_sum"
						                header  ="Balance|Total Assets|Total Resources|Difference"
						                format  ="0|0|0|0"  
						                aligns  ="0|0|0|1"
						                defaults="|||"  
						                editcol ="0|0|0|0"
						                widths  ="4500|4200|4200|3000"  
						                styles  ="width:100%; height:100%"
						                sorting="F" 
						                /> 
                            </td>
                        </tr>
                    </table>
                    <table name="Income Statement(QD15)"  align ="top"  cellspacing=0 cellpadding=0 border=0 style="width:100%;height:100%;" >    
                        <tr height='100%' valign="top">
                            <!--0_Item|1.Item Local|2_Item Korea|3_English-Vietnamese|4_Korean-Vietnamese|5_English-Vietnamese-Korean|6.Code|7.Node|8_Font Type|9.This Period|10.Previous Period|11.Accum Of Year|12.Accum Of Previous Year|13_Color-->
                            <td width="100%">
                            <gw:grid   
							    id="grid_ic"  
					            header  ="_Item|Item Local|_Item Korea|_English-Vietnamese|_Korean-Vietnamese|_English-Vietnamese-Korean|Code|Node|_Font Type|This Period|Previous Period|Accum Of Year|Accum Of Previous Year|_Color"
					            format  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					            aligns  ="0|0|0|0|0|0|1|1|1|3|3|3|3|3"
					            defaults="|||||||||||||"
					            editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					            widths  ="8000|4200|0|0|0|0|900|900|1000|2000|2000|2000|2000|0"
					            styles  ="width:100%; height:100%"
					            sorting="F" 
					            /> 
                            </td>
                        </tr>
                    </table>
                   
                    <table name="Cash Flows Direct(QD15)"  align ="top"  cellspacing=0 cellpadding=0 border=0 style="width:100%;height:100%;" >    
                        <tr valign="top">
                            <!--0.Item Local|1_Item|2_Item Korea|3.English-Vietnamese|4.Korean-Vietnamese|5.English-Vietnamese-Korean|6.Code|7.Node|8_Font Type|9.This Period|10.Previous Period|11_Accum Of Year|12_Accum Of Previous Year|13_Color-->
                            <td width="100%">
                                <gw:grid   
							        id="grid_cf_di"  
					                header  ="_Item|Item Local|_Item Korea|_English-Vietnamese|_Korean-Vietnamese|_English-Vietnamese-Korean|Code|Node|_Font Type|This Period|Previous Period|_Accum Of Year|_Accum Of Previous Year|_Color"
					                format  ="0|0|0|0|0|0|0|0|0|0|0|0|0"
					                aligns  ="0|0|0|0|0|0|1|1|3|3|3|3|3"
					                defaults="||||||||||||"
					                editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0"
					                widths  ="8000|8000|0|0|0|0|1400|1400|1000|2000|2000|2500|2500"
					                styles  ="width:100%; height:100%"
					                sorting="F" 
                                    /> 
                            </td>
                        </tr>
                    </table>
                </gw:tab>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <gw:list id="lstBook_ccy" style="width: 75%; display: none"></gw:list>
                <gw:textbox id="txt_date" style="display: none" />
                <gw:textbox id="txt_row" style="display: none" />
                <gw:textbox id="txt_tmp" style="display: none" />
                <gw:textbox id="txtDateType" style="display: none" />
                <gw:textbox id="txtFinancialType" style="display: none" />
				<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
</body>
</html>
