<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>

<script>
var G_Item          =0,
    G_Item_Local    =1,
    G_Item_Korean   =2,
    G_Code          =3,
    G_Header        =4,
    G_Font_Stype    =5,
    G_Prn_Color     =6,
    G_Jan           =7,
    G_Feb           =8,
    G_Mar           =9,
    G_Apr           =10,
    G_May           =11,
    G_June          =12,
    G_July          =13,
    G_Aug           =14,
    G_Sep           =15,
    G_Oct           =16,
    G_Nov           =17,
    G_Dec           =18;
var emp_id = "<%=Session("LOGIN_ID")%>";
function BodyInit()
{
    System.Translate(document);
    
    var ls_company  = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    
    var ls_lang     = "<%=CtlLib.SetListDataFUNC("SELECT ac_A_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
    var ls_current  = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
    
    var ls_date     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
    var ls_month    = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(ADD_MONTHS(SYSDATE,-1), 'YYYYMM') FROM DUAL")%>";
    
    var ls_date_fr  = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
    var ls_date_to  = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(SYSDATE), 'YYYYMMDD') FROM DUAL")%>";
    
    var ls_Book_ccy = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACBG0040','04','') FROM DUAL")%>";
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
    var data = "<%=CtlLib.SetListDataFUNC("SELECT ac_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
    arr  = data.split("|");
	lblBookccy.SetDataText(arr[1]);
	
    onMergeHead();
    txt_row.text    = 0;
    txtScale.GetControl().focus();
    
    var fg = grid_ic.GetGridControl();
    
    if (lstCurrent.GetData() == 'VND')
    {
        fg.ColFormat(G_Jan)  = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(G_Feb)  = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(G_Mar)  = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(G_Apr)  = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(G_May)  = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(G_June) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(G_July) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(G_Aug)  = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(G_Sep)  = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(G_Oct)  = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(G_Nov)  = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(G_Dec)  = "#,###,###,###,###,###,###,###,###R";
    }
    else
    {
        fg.ColFormat(G_Jan)  = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(G_Feb)  = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(G_Mar)  = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(G_Apr)  = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(G_May)  = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(G_June) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(G_July) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(G_Aug)  = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(G_Sep)  = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(G_Oct)  = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(G_Nov)  = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(G_Dec)  = "#,###,###,###,###,###,###,###,###.##R";
    }
    
    fg.Cell(0, 0, G_Jan, 0, G_Jan)   = "Jan - " + dtYear.GetData();
    fg.Cell(0, 0, G_Feb, 0, G_Feb)   = "Feb - " + dtYear.GetData();
    fg.Cell(0, 0, G_Mar, 0, G_Mar)   = "Mar - " + dtYear.GetData();
    fg.Cell(0, 0, G_Apr, 0, G_Apr)   = "Apr - " + dtYear.GetData();
    fg.Cell(0, 0, G_May, 0, G_May)   = "May - " + dtYear.GetData();
    fg.Cell(0, 0, G_June, 0, G_June) = "June - " + dtYear.GetData();
    fg.Cell(0, 0, G_July, 0, G_July) = "July - " + dtYear.GetData();
    fg.Cell(0, 0, G_Aug, 0, G_Aug)   = "Aug - " + dtYear.GetData();
    fg.Cell(0, 0, G_Sep, 0, G_Sep)   = "Sep - " + dtYear.GetData();
    fg.Cell(0, 0, G_Oct, 0, G_Oct)   = "Oct - " + dtYear.GetData();
    fg.Cell(0, 0, G_Nov, 0, G_Nov)   = "Nov - " + dtYear.GetData();
    fg.Cell(0, 0, G_Dec, 0, G_Dec)   = "Dec - " + dtYear.GetData();
    
    OnChangeDateType();
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	dso_getCompany.Call();
}
function OnChangeDateType(){
    CalculateFTDate();
    //var quater = lstQuater.GetData();
    //var yyyy = dtfrdate.text.substr(6,4);
    //var mmyyyy = dtfrdate.text.substr(3,7);
    //var acc_mmyyyy = dtfrdate.GetData();
    //acc_mmyyyy = System.AddDate(acc_mmyyyy,-365);
    //acc_mmyyyy = acc_mmyyyy.substr(4,2) +"/"+ acc_mmyyyy.substr(0,4);
    /*
    if(idTab_Child.GetCurrentPageNo() == 0){
        if(rdoType.GetData() == 1){
            txtDateType.text = "M";
            lblDateType.text = "Month:";
            //dtMonth.style.display = "";
            dtYear.style.display = "none";
            lstQuater.style.display = "none";
        }
        else if(rdoType.GetData() == 2){
            txtDateType.text = "Q";
            lblDateType.text = "Quater:";
            //dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstQuater.style.display = "";
        }
        else if(rdoType.GetData() == 3){
            txtDateType.text = "Y";
            lblDateType.text = "Year:";
            //dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstQuater.style.display = "none";
        }
      }
    else if(idTab_Child.GetCurrentPageNo() == 1){
        if(rdoType.GetData() == 1){
            txtDateType.text = "M";
            lblDateType.text = "Month:";
            //dtMonth.style.display = "";
            dtYear.style.display = "none";
            lstQuater.style.display = "none";
            //grid_ic.SetGridText(0,9,"Month("+mmyyyy+")");//this period        
            //grid_ic.SetGridText(0,10,"Month("+acc_mmyyyy+")");//this period of previous year
            //grid_ic.SetGridText(0,11,"Acc Month("+yyyy+")");//accumulate from beginning of year to this period
            //grid_ic.SetGridText(0,12,"Acc Month("+(yyyy-1)+")");//accumulate from beginning of previous year to this period - 1 year
            //var obj = grid_ic.GetGridControl();
        }
        else if(rdoType.GetData() == 2){
            txtDateType.text = "Q";
            lblDateType.text = "Quater:";
            //dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstQuater.style.display = "";
            //grid_ic.SetGridText(0,9,"Quater "+quater+ " of " + yyyy);//this period        
            //grid_ic.SetGridText(0,10,"Quater "+quater+" of " + (yyyy-1));//this period of previous year
            //grid_ic.SetGridText(0,11,"Acc of Quater "+quater+ " of " + yyyy);//accumulate from beginning of year to this period
            //grid_ic.SetGridText(0,12,"Acc of Quater "+quater+ " of " + (yyyy-1));//accumulate from beginning of previous year to this period - 1 year
            //var obj = grid_ic.GetGridControl();
        }
        else if(rdoType.GetData() == 3){
            txtDateType.text = "Y";
            lblDateType.text = "Year:";
            //dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstQuater.style.display = "none";
            //grid_ic.SetGridText(0,9,"This Year("+yyyy+")");//this period        
            //grid_ic.SetGridText(0,10,"Last Year("+(yyyy-1)+")");//this period of previous year
            //grid_ic.SetGridText(0,11,"");//accumulate from beginning of year to this period
            //grid_ic.SetGridText(0,12,"");//accumulate from beginning of previous year to this period - 1 year
             //var obj = grid_ic.GetGridControl();
        }
      
     } else if(idTab_Child.GetCurrentPageNo() == 2){
        if(rdoType.GetData() == 1){ 
         
            txtDateType.text = "M";
            lblDateType.text = "Month:";
            //dtMonth.style.display = "";
            dtYear.style.display = "none";
            lstQuater.style.display = "none";
            //grid_cf_di.SetGridText(0,9,"Month("+mmyyyy+")");//this period        
            //grid_cf_di.SetGridText(0,10,"Month("+acc_mmyyyy+")");//this period of previous year
            //grid_cf_di.SetGridText(0,11,"Acc Month("+mmyyyy+")");//accumulate from beginning of year to this period
            //grid_cf_di.SetGridText(0,12,"Acc Month("+acc_mmyyyy+")");//accumulate from beginning of previous year to this period - 1 year
        }
        else if(rdoType.GetData() == 2){
            txtDateType.text = "Q";
            lblDateType.text = "Quater:";
            //dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstQuater.style.display = "";
            //grid_cf_di.SetGridText(0,9,"Quater "+quater+ " of " + yyyy);//this period        
            //grid_cf_di.SetGridText(0,10,"Quater "+quater+ " of " + (yyyy-1));//this period of previous year
            //grid_cf_di.SetGridText(0,11,"Acc of Quater "+quater+ " of " + yyyy);//accumulate from beginning of year to this period
            //grid_cf_di.SetGridText(0,12,"Acc of Quater "+quater+ " of " + (yyyy-1));//accumulate from beginning of previous year to this period - 1 year
        }
        else if(rdoType.GetData() == 3){
            txtDateType.text = "Y";
            lblDateType.text = "Year:";
            //dtMonth.style.display = "none";
            dtYear.style.display = "";
            lstQuater.style.display = "none";
            //grid_cf_di.SetGridText(0,9,"This Year("+yyyy+")");//this period        
            //grid_cf_di.SetGridText(0,10,"Last Year("+(yyyy-1)+")");//this period of previous year
            //grid_cf_di.SetGridText(0,11,"");//accumulate from beginning of year to this period
            //grid_cf_di.SetGridText(0,12,"");//accumulate from beginning of previous year to this period - 1 year
        }
     }
    */
}
function CalculateFTDate(){
    /*
    //1:Month, 2:Quater, 3:Year
    var yyyymm,yyyy, mm, quater;
    //month
    if(rdoType.GetData() == 1){
        //yyyymm = dtMonth.GetData();
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
    onSearch();*/
}
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
function OnChangeMonth(){
    //CalculateFTDate();
    OnChangeDateType();
}
function OnChangeQuater(){
    //CalculateFTDate();
    OnChangeDateType();
}
function OnChangeYear(){
    OnChangeDateType();
    //onSearch();
}
function onMergeHead()
{
    grid_ic.GetGridControl().FixedRows = 1;
    grid_ic.GetGridControl().AutoResize = true;
}

function onSearch()
{
    ibtnSearch.SetEnable(false);
    ibtnReport.SetEnable(false);
    dtYear.SetEnable(false);
    lstCurrent.SetEnable(false);
    rbstatus.SetEnable(false);
    lstCompany.SetEnable(false);
    
    dso_sel_grd_income.Call("SELECT");
}

function trim(str)
{    if(!str || typeof str != 'string') 
       return null;    
       return str.replace(/^[\s]+/,'').replace(/[\s]+$/,'').replace(/[\s]{2,}/,' ');
}
function onReport()
{
	if(lstLang.value=="VIE")
	{
		var url = System.RootURL + '/standard/reports/60/26/rpt_60260020_ic_vie.aspx?p_year='+dtYear.value+'&p_tco_company_pk='+lstCompany.value+'&p_scale='+txtScale.text+'&p_ccy='+lstCurrent.value+'&p_exrate='+txtrate1.text+'&p_status='+rbstatus.value+'&p_language='+lstLang.value;
		System.OpenTargetPage(url); 
	}
	else
	{
		var url = System.RootURL + '/standard/reports/60/26/rpt_60260020_eng_vie_kor_ic_yearly.aspx?p_year='+dtYear.value+'&p_tco_company_pk='+lstCompany.value+'&p_scale='+txtScale.text+'&p_ccy='+lstCurrent.value+'&p_exrate='+txtrate1.text+'&p_status='+rbstatus.value+'&p_language='+lstLang.value;
		System.OpenTargetPage(url); 
	}
}


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

function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise
}

function onEnter()
{
    
}

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

function OnChangeList()
{
    /*
    if (txtFinancialType.GetData() == '21')
    {
        idTab_Child.SetPage(0);
        onSetMonth(true);
    }
    else if (txtFinancialType.GetData() == '22')
    {
        idTab_Child.SetPage(1);
        onSetMonth(false);
    }
    else if (txtFinancialType.GetData() == '24')
    {
        idTab_Child.SetPage(2);
        onSetMonth(false);
    }*/
    onSearch();
}

function OnChangeCurrent()
{
    dso_get_rate.Call();
}

function onSetDataList()
{
    if (idTab_Child.GetCurrentPageNo() == 0)
    {
        txtFinancialType.SetDataText('21');
    }
    else if (idTab_Child.GetCurrentPageNo() == 1)
    {
        txtFinancialType.SetDataText('22');
    }
    else if (idTab_Child.GetCurrentPageNo() == 2)
    {
        txtFinancialType.SetDataText('24');
    }
   
    OnChangeDateType();
}

function OnChangeLang()
{   
    
    switch(lstLang.GetData())
    {
        case "ENG-KOR":
            grid_ic.GetGridControl().ColHidden(G_Item)          = false;
            grid_ic.GetGridControl().ColHidden(G_Item_Local)    = true;
            grid_ic.GetGridControl().ColHidden(G_Item_Korean)   = false;
            grid_ic.GetGridControl().Cell(0, 0, G_Item, 0, G_Item) = "Item";
            grid_ic.GetGridControl().Cell(0, 0, G_Item_Korean, 0, G_Item_Korean) = "Item Korean";
        break;
        case "VIE":
            grid_ic.GetGridControl().ColHidden(G_Item)          = true;
            grid_ic.GetGridControl().ColHidden(G_Item_Local)    = false;
            grid_ic.GetGridControl().ColHidden(G_Item_Korean)   = true;
            grid_ic.GetGridControl().Cell(0, 0, G_Item_Local, 0, G_Item_Local) = "Item Local";
        break;
        case "ENG":
            grid_ic.GetGridControl().ColHidden(G_Item)          = false;
            grid_ic.GetGridControl().ColHidden(G_Item_Local)    = true;
            grid_ic.GetGridControl().ColHidden(G_Item_Korean)   = true;
            grid_ic.GetGridControl().Cell(0, 0, G_Item, 0, G_Item) = "Item";
        break;
        case "KOR":
            grid_ic.GetGridControl().ColHidden(G_Item)          = true;
            grid_ic.GetGridControl().ColHidden(G_Item_Local)    = true;
            grid_ic.GetGridControl().ColHidden(G_Item_Korean)   = false;
            grid_ic.GetGridControl().Cell(0, 0, G_Item_Korean, 0, G_Item_Korean) = "Item Korean";
        break;
        case "ENG-VIE":
            grid_ic.GetGridControl().ColHidden(G_Item)          = false;
            grid_ic.GetGridControl().ColHidden(G_Item_Local)    = false;
            grid_ic.GetGridControl().ColHidden(G_Item_Korean)   = true;
            grid_ic.GetGridControl().Cell(0, 0, G_Item, 0, G_Item) = "Item ";
            grid_ic.GetGridControl().Cell(0, 0, G_Item_Local, 0, G_Item_Local) = "Item Local";
        break;
        case "KOR-VIE":
            grid_ic.GetGridControl().ColHidden(G_Item)          = true;
            grid_ic.GetGridControl().ColHidden(G_Item_Local)    = false;
            grid_ic.GetGridControl().ColHidden(G_Item_Korean)   = false;
            grid_ic.GetGridControl().Cell(0, 0, G_Item_Korean, 0, G_Item_Korean) = "Item Korean";
            grid_ic.GetGridControl().Cell(0, 0, G_Item_Local, 0, G_Item_Local) = "Item Local";
        break;
        case "ENG-VIE-KOR":
            grid_ic.GetGridControl().ColHidden(G_Item)          = false;
            grid_ic.GetGridControl().ColHidden(G_Item_Local)    = false;
            grid_ic.GetGridControl().ColHidden(G_Item_Korean)   = false;
            grid_ic.GetGridControl().Cell(0, 0, G_Item_Korean, 0, G_Item_Korean) = "Item Korean";
            grid_ic.GetGridControl().Cell(0, 0, G_Item_Local, 0, G_Item_Local) = "Item Local";
            grid_ic.GetGridControl().Cell(0, 0, G_Item, 0, G_Item) = "Item";
        break;
    }
    
    grid_ic.GetGridControl().Cell(0, 0, G_Jan, 0, G_Jan)   = "Jan - " + dtYear.GetData();
    grid_ic.GetGridControl().Cell(0, 0, G_Feb, 0, G_Feb)   = "Feb - " + dtYear.GetData();
    grid_ic.GetGridControl().Cell(0, 0, G_Mar, 0, G_Mar)   = "Mar - " + dtYear.GetData();
    grid_ic.GetGridControl().Cell(0, 0, G_Apr, 0, G_Apr)   = "Apr - " + dtYear.GetData();
    grid_ic.GetGridControl().Cell(0, 0, G_May, 0, G_May)   = "May - " + dtYear.GetData();
    grid_ic.GetGridControl().Cell(0, 0, G_June, 0, G_June) = "June - " + dtYear.GetData();
    grid_ic.GetGridControl().Cell(0, 0, G_July, 0, G_July) = "July - " + dtYear.GetData();
    grid_ic.GetGridControl().Cell(0, 0, G_Aug, 0, G_Aug) = "Aug - " + dtYear.GetData();
    grid_ic.GetGridControl().Cell(0, 0, G_Sep, 0, G_Sep) = "Sep - " + dtYear.GetData();
    grid_ic.GetGridControl().Cell(0, 0, G_Oct, 0, G_Oct) = "Oct - " + dtYear.GetData();
    grid_ic.GetGridControl().Cell(0, 0, G_Nov, 0, G_Nov) = "Nov - " + dtYear.GetData();
    grid_ic.GetGridControl().Cell(0, 0, G_Dec, 0, G_Dec) = "Dec - " + dtYear.GetData();
}

function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {
        case "dso_trial_balance":
            /*
            if (txtFinancialType.GetData() == '21')
            {
                //dso_sel_grd_balance_sheet.Call("SELECT");
            }
            else if (txtFinancialType.GetData() == '22')
            {
                dso_sel_grd_income.Call("SELECT");
            }
            else if (txtFinancialType.GetData() == '23')
            {
            
            }*/
        break;
        case "dso_get_rate":
            /*
            dso_sel_grd_income.Call("SELECT");
            if(idTab_Child.GetCurrentPageNo()=="1")
            {
                dso_sel_grd_income.Call("SELECT");
            }*/
        break;
    }
}
function OnDataError(p_oData){
    switch(p_oData.id)
    {
        case "dso_sel_grd_income":
            alert(p_oData.errmsg);
            ibtnSearch.SetEnable(true);
	        ibtnReport.SetEnable(true);
	        dtYear.SetEnable(true);
	        lstCurrent.SetEnable(true);
	        rbstatus.SetEnable(true);
	        lstCompany.SetEnable(true);
        break;
    }
}

function onSetFont(p_oData)
{
    switch(p_oData.id)
    {
        case "dso_sel_grd_income":
            var ctrl = grid_ic.GetGridControl();
            
            for (i = 1; i < ctrl.Rows; i++)
	        {   
	            if(grid_ic.GetGridData(i,G_Font_Stype)== "B")
                {
	                ctrl.Cell(14, i, G_Item, i, G_Dec) = false;
	                grid_ic.SetCellBold(i, G_Item, i, G_Dec, true);
                }
                else if (grid_ic.GetGridData(i,G_Font_Stype)== "I")
                {
	                grid_ic.SetCellBold(i, G_Item, i, G_Dec, false);
	                ctrl.Cell(14, i, G_Item, i, G_Dec) = true; // Chu nghieng
	            }
	            else
	            {
	                ctrl.Cell(14, i, G_Item, i, G_Dec) = false;
	                grid_ic.SetCellBold(i, G_Item, i, G_Dec, false);
	            }
	            //set color
	            grid_ic.SetCellBgColor(i, G_Item, i, G_Dec, Number(grid_ic.GetGridData(i, G_Prn_Color)));
	        }
	        
	        ibtnSearch.SetEnable(true);
	        ibtnReport.SetEnable(true);
	        dtYear.SetEnable(true);
	        lstCurrent.SetEnable(true);
	        rbstatus.SetEnable(true);
	        lstCompany.SetEnable(true);
	        
	        OnChangeLang();
        break;
    }
}

</script>

<body style="margin: 0; padding: 0;">
<!------------------------------------------------------------------------>
 <gw:data id="dso_getCompany" onreceive=""> 
        <xml> 
            <dso type="list" procedure="ac_sel_gfac00100_1" > 
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
            <dso type="process" procedure="ac_PRO_GET_RATE"> 
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
    <gw:data id="dso_sel_grd_income" onreceive="onSetFont(this)" onerror="OnDataError(this)">
        <xml>
            <dso type="grid" function="ac_sel_60200020_ic">
                <input bind="grid_ic">
                    <input bind="dtYear"/>
                    <input bind="lstCompany"/>
                    <input bind="txtScale"/>
                    <input bind="lstCurrent"/>
                    <input bind="txtrate1"/>
                    <input bind="rbstatus"/>
                </input>
                <output bind="grid_ic"/>
            </dso>
        </xml>
    </gw:data>
    <table width="100%" cellpadding="0" cellspacing="0" border="1" style="height:100%">
        <tr>
            <td width="100%" valign="top">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td valign="top">
                            <table border="0" width="100%" id="table1">
	                            <tr>
		                            <td valign="top">
		                                <fieldset style="padding: 2;width:100%; height:100%">
		                                    <table border="0" width="100%" id="table2">
			                                    <tr>
				                                    <td width="5%">Company</td>
				                                    <td width="20%" colspan=1>
				                                        <gw:list id="lstCompany" onchange="OnChangeList()" styles='width:100%' />
				                                    </td>
				                                    <td width="5%"></td>
				                                    <td width="25%"> 
                                                    </td>
                                                    <td width="5%">
                                                        <gw:label id="lblDateType" text="Year:" styles="width:100%;font-weight:600;" />
                                                    </td>
                                                    <td width="10%">
                                                        <gw:datebox id="dtYear" type="year" lang="1" styles="display:none" onchange="OnChangeYear()"/>
                                                    </td>
                                                    <td width="10%" colspan=2>
                                                    </td>
                                                    <td width="10%">
                                                        <!--gw:datebox id="dtfrdate" type="date" lang="1" /-->
                                                    </td>
                                                    <td width="10%" colspan=2>
                                                        <!--gw:datebox id="dttodate" type="date" lang="1" /-->
                                                    </td>
                                                    <td width="3%">
                                                        <gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="onSearch()" />
                                                    </td>
                                                    <td width="3%">
                                                        <gw:imgbtn id="ibtnReport" img="excel" alt="Print" onclick="onReport()" />
                                                    </td>
                                                    <!-------------------------------Fyzas---------------------------------->
			                                    </tr>
			                                    <tr>
				                                    <td width="5%">Language</td>
				                                    <td width="20%" colspan=1><gw:list id="lstLang" onchange="OnChangeLang()" styles='width:100%' /></td>
				                                    <td width="5%">Status</td>
				                                    <td width="25%"> 
				                                        <gw:radio id="rbstatus" value="2" onchange="onSearch()"> 
		                                                    <span value="2">Confirmed</span>
		                                                    <span value="0">Approved</span>
		                                                </gw:radio>
                                                    </td>
                                                    <td width="5%">Currency</td>
                                                     <td width="10%">
                                                        <gw:list id="lstCurrent" onchange="OnChangeCurrent()" styles='width:100%' />
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
		                                </fieldset> 
		                            </td>
	                            </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td width="100%">
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td width="100%">
                                        <table align ="top"  cellspacing=0 cellpadding=0 border=0 style="width:100%;height:100%;" >
                                            <tr valign="top">
                                                <td width="100%">
                                                    <gw:grid   
							                            id="grid_ic"
					                                    header  ="_Item|Item Local|_Item Korean|_Code|_Header|_Font_Stype|_Prn_Color|Jan|Feb|Mar|Apr|May|June|July|Aug|Sep|Oct|Nov|Dec"
					                                    format  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
					                                    aligns  ="0|0|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3"  
					                                    defaults="||||||||||||||||||"  
					                                    editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
					                                    widths  ="5000|5000|2000|1000|1000|1000|1000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000"  
					                                    styles  ="width:100%; height:430"
					                                    sorting="F" 
					                                    /> 
                                                </td>
                                            </tr>
                                        </table>
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