<!-- #include file="../../../../system/lib/form.inc"  -->
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
    var ls_lang     = "<%=CtlLib.SetListDataFUNC("SELECT AC_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
    var ls_current  = "<%=CtlLib.SetListDataFUNC("SELECT AC_F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
    
    var ls_date     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
    var ls_month    = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(ADD_MONTHS(SYSDATE,-1), 'YYYYMM') FROM DUAL")%>";
    
    var ls_date_fr  = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
    var ls_date_to  = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(SYSDATE), 'YYYYMMDD') FROM DUAL")%>";
    
    var ls_Book_ccy = "<%=CtlLib.SetListDataFUNC("SELECT AC_F_COMMONCODE('ACBG0040','04','') FROM DUAL")%>";
    ls_trsdate      = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
	var dataAmountType  =  "<%=CtlLib.SetListDataSQL("select b.code, b.code_nm  from tac_commcode_master a, tac_commcode_detail b where a.pk = b.tac_commcode_master_pk and a.id = 'ACBG0198' and a.del_if = 0 and b.del_if = 0 and b.use_yn = 'Y' order by b.def_yn desc ")%>";
    lstAmountType.SetDataText(dataAmountType);
	lstAmountType.SetDataText('01');	
    txt_date.text   = ls_trsdate;
    txtrate.SetDataText('1');
    txtScale.SetDataText('1');
    lstCompany.SetDataText(ls_company);
    lstCompany.value = "<%=session("company_pk") %>";
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
    if (lstCurrent.GetData() == 'VND')
    {
        fg.ColFormat(8) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###R";
    }
    else
    {
        fg.ColFormat(8) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(9) = "#,###,###,###,###,###,###,###,###.##R";
    } 
    OnChangeDateType();
	OnChangeAmountType();
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	dso_getCompany.Call();
        
}
//-------------------------------------------------------------------------------------------------------------------
function OnChangeDateType(){
    CalculateFTDate();
    var quater = lstQuater.GetData();
    var yyyy = dtfrdate.text.substr(6,4);
    var mmyyyy = dtfrdate.text.substr(3,7);
    var acc_mmyyyy = dtfrdate.GetData();
    acc_mmyyyy = System.AddDate(acc_mmyyyy,-365);
    acc_mmyyyy = acc_mmyyyy.substr(4,2) +"/"+ acc_mmyyyy.substr(0,4);
    //alert(acc_mmyyyy)
    }
//-------------------------------------------------------------------------------------------------------------------
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
//-------------------------------------------------------------------------------------------------------------------
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
//-------------------------------------------------------------------------------------------------------------------
function OnChangeMonth(){
    //CalculateFTDate();
    OnChangeDateType();
}
//-------------------------------------------------------------------------------------------------------------------
function OnChangeQuater(){
    //CalculateFTDate();
    OnChangeDateType();
}
//-------------------------------------------------------------------------------------------------------------------
function OnChangeYear(){
    //CalculateFTDate();
    OnChangeDateType();
}
//-------------------------------------------------------------------------------------------------------------------
function onMergeHead()
{
    grid_bs.GetGridControl().FixedRows = 1;
    //grid_bs.GetGridControl().AllowUserResizing = 0;
    grid_bs.GetGridControl().AutoResize = true;
}

//-------------------------------------------------------------------------------------------------------------------
function onSearch()
{
    dso_sel_grd_balance_sheet.Call("SELECT");
}
//-------------------------------------------------------------------------------------------------------------------
function OnPrint()
{
	
		if(lstLang.GetData()=='ENG')
			{
				var url = System.RootURL + "/standard/reports/60/08/rpt_60081335_usd.aspx?p_tco_company_pk=" + lstCompany.value+"&p_from_month="+ dtfrdate.value+ "&p_to_month="+ dttodate.value+"&p_status="+rbstatus.value+"&p_scale="+txtScale.text+"&p_from_text="+dtfrdate.text+"&p_to_text="+dttodate.text+"&p_ccy="+lstCurrent.GetData()+'&p_lang='+lstLang.value+'&p_AmountType='+lstAmountType.value;
				System.OpenTargetPage(url); 
			}
		else if(lstLang.GetData()=='ENG-KOR')
			{
				var url = System.RootURL + "/standard/reports/60/08/rpt_60081335_eng_kor.aspx?p_tco_company_pk=" + lstCompany.value+"&p_from_month="+ dtfrdate.value+ "&p_to_month="+ dttodate.value+"&p_status="+rbstatus.value+"&p_scale="+txtScale.text+"&p_from_text="+dtfrdate.text+"&p_to_text="+dttodate.text+"&p_ccy="+lstCurrent.GetData()+'&p_lang='+lstLang.value+'&p_AmountType='+lstAmountType.value;
				System.OpenTargetPage(url); 
			}
		else if(lstLang.GetData()=='ENG-VIE-KOR')
			{
				var url = System.RootURL + "/standard/reports/60/08/rpt_60081335_eng_vn_kor.aspx?p_tco_company_pk=" + lstCompany.value+"&p_from_month="+ dtfrdate.value+ "&p_to_month="+ dttodate.value+"&p_status="+rbstatus.value+"&p_scale="+txtScale.text+"&p_from_text="+dtfrdate.text+"&p_to_text="+dttodate.text+"&p_ccy="+lstCurrent.GetData()+'&p_lang='+lstLang.value+'&p_AmountType='+lstAmountType.value;
				System.OpenTargetPage(url); 
			}
		else if(lstLang.GetData()=='KOR-VIE')
			{
				var url = System.RootURL + "/standard/reports/60/08/rpt_60081335_kor_vie.aspx?p_tco_company_pk=" + lstCompany.value+"&p_from_month="+ dtfrdate.value+ "&p_to_month="+ dttodate.value+"&p_status="+rbstatus.value+"&p_scale="+txtScale.text+"&p_from_text="+dtfrdate.text+"&p_to_text="+dttodate.text+"&p_ccy="+lstCurrent.GetData()+'&p_lang='+lstLang.value+'&p_AmountType='+lstAmountType.value;
				System.OpenTargetPage(url); 
			}
		else if(lstLang.GetData()=='KOR')
			{
				var url = System.RootURL + "/standard/reports/60/08/rpt_60081335_korean.aspx?p_tco_company_pk=" + lstCompany.value+"&p_from_month="+ dtfrdate.value+ "&p_to_month="+ dttodate.value+"&p_status="+rbstatus.value+"&p_scale="+txtScale.text+"&p_from_text="+dtfrdate.text+"&p_to_text="+dttodate.text+"&p_ccy="+lstCurrent.GetData()+'&p_lang='+lstLang.value+'&p_AmountType='+lstAmountType.value;
				System.OpenTargetPage(url); 
			}
		else if(lstLang.GetData()=='VIE')
			{
				var url = System.RootURL + "/standard/reports/60/08/rpt_60081335_vie.aspx?p_tco_company_pk=" + lstCompany.value+"&p_from_month="+ dtfrdate.value+ "&p_to_month="+ dttodate.value+"&p_status="+rbstatus.value+"&p_scale="+txtScale.text+"&p_from_text="+dtfrdate.text+"&p_to_text="+dttodate.text+"&p_ccy="+lstCurrent.GetData()+'&p_lang='+lstLang.value+'&p_AmountType='+lstAmountType.value;
				System.OpenTargetPage(url); 
			}
		else if(lstLang.GetData()=='ENG-VIE')
			{
				var url = System.RootURL + "/standard/reports/60/08/rpt_60081335_eng_vie.aspx?p_tco_company_pk=" + lstCompany.value+"&p_from_month="+ dtfrdate.value+ "&p_to_month="+ dttodate.value+"&p_status="+rbstatus.value+"&p_scale="+txtScale.text+"&p_from_text="+dtfrdate.text+"&p_to_text="+dttodate.text+"&p_ccy="+lstCurrent.GetData()+'&p_lang='+lstLang.value+'&p_AmountType='+lstAmountType.value;
				System.OpenTargetPage(url); 
			}
}

//-------------------------------------------------------------------------------------------------------------------
function trim(str)
{    if(!str || typeof str != 'string') 
       return null;    
       return str.replace(/^[\s]+/,'').replace(/[\s]+$/,'').replace(/[\s]{2,}/,' ');
}
//-------------------------------------------------------------------------------------------------------------------
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
//-------------------------------------------------------------------------------------------------------------------
function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise
}
//-------------------------------------------------------------------------------------------------------------------
function onSetMonth(p_bool)
{
    if (p_bool)
    {
        dtfrdate.style.display = '';
        dttodate.style.display = '';
    }
    else
    {
        dtfrdate.style.display = 'none';
        dttodate.style.display = 'none';
    }
}
//-------------------------------------------------------------------------------------------------------------------
function OnChangeCurrent()
{
    dso_get_rate.Call();
}

//-------------------------------------------------------------------------------------------------------------------
function OnChangeLang()
{
    switch(lstLang.GetData())
    {
        case "VIE":
            grid_bs.GetGridControl().ColHidden(0) = true;
            grid_bs.GetGridControl().ColHidden(1) = false;
            grid_bs.GetGridControl().ColHidden(2) = true;
            
            grid_bs.GetGridControl().ColHidden(3) = true;
            grid_bs.GetGridControl().ColHidden(4) = true;
            grid_bs.GetGridControl().ColHidden(5) = true;
            grid_bs.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
           
        break;
        case "ENG":
            grid_bs.GetGridControl().ColHidden(0) = false;
            grid_bs.GetGridControl().ColHidden(1) = true;
            grid_bs.GetGridControl().ColHidden(2) = true;
            
            grid_bs.GetGridControl().ColHidden(3) = true;
            grid_bs.GetGridControl().ColHidden(4) = true;
            grid_bs.GetGridControl().ColHidden(5) = true;
           
            grid_bs.GetGridControl().Cell(0, 0, 0, 0, 0) = "Item";
            
        break;
        case "KOR":
            grid_bs.GetGridControl().ColHidden(0) = true;
            grid_bs.GetGridControl().ColHidden(1) = true;
            grid_bs.GetGridControl().ColHidden(2) = false;
            
            grid_bs.GetGridControl().ColHidden(3) = true;
            grid_bs.GetGridControl().ColHidden(4) = true;
            grid_bs.GetGridControl().ColHidden(5) = true;
            grid_bs.GetGridControl().Cell(0, 0, 2, 0, 2) = "Item Korean";
        break;
        case "ENG-VIE":
        break;
        case "KOR-VIE":
           
             //--------Balance sheet            ------------------
            grid_bs.GetGridControl().ColHidden(0) = true;
            grid_bs.GetGridControl().ColHidden(1) = false;
            grid_bs.GetGridControl().ColHidden(2) = false;
            grid_bs.GetGridControl().ColHidden(3) = true;
            grid_bs.GetGridControl().ColHidden(4) = true;
            grid_bs.GetGridControl().ColHidden(5) = true;
           
            grid_bs.GetGridControl().Cell(0, 0, 2, 0, 2) = "Item Korean";
            grid_bs.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
             
        break;
        
         case "ENG-VIE-KOR":
            //--------Balance sheet          ------------------
            grid_bs.GetGridControl().ColHidden(0) = false;
            grid_bs.GetGridControl().ColHidden(1) = false;
            grid_bs.GetGridControl().ColHidden(2) = false;
            
            grid_bs.GetGridControl().ColHidden(3) = true;
            grid_bs.GetGridControl().ColHidden(4) = true;
            grid_bs.GetGridControl().ColHidden(5) = true;
            
            grid_bs.GetGridControl().Cell(0, 0, 2, 0, 2) = "Item Korean";
            grid_bs.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
            grid_bs.GetGridControl().Cell(0, 0, 0, 0, 0) = "Item";
                       
        break;
		case "ENG-KOR":
            //--------Balance sheet          ------------------
            grid_bs.GetGridControl().ColHidden(0) = false;
            grid_bs.GetGridControl().ColHidden(1) = true;
            grid_bs.GetGridControl().ColHidden(2) = false;
            
            grid_bs.GetGridControl().ColHidden(3) = false;
            grid_bs.GetGridControl().ColHidden(4) = false;
            grid_bs.GetGridControl().ColHidden(5) = false;
           
            grid_bs.GetGridControl().Cell(0, 0, 2, 0, 2) = "Item Korean";
            grid_bs.GetGridControl().Cell(0, 0, 1, 0, 1) = "Item Local";
            grid_bs.GetGridControl().Cell(0, 0, 0, 0, 0) = "Item";
          
        break;
    }
 }
//-------------------------------------------------------------------------------------------------------------------
function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {
        case "dso_trial_balance":
           dso_sel_grd_balance_sheet.Call("SELECT");
        break;
    }
}

//-------------------------------------------------------------------------------------------------------------------
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
	                grid_bs.SetCellBold(i, 0, i, 16, true);
                }
                else if (grid_bs.GetGridData(i,10)== "I")
                {
	                grid_bs.SetCellBold(i, 0, i, 16, false);
	                ctrl.Cell(14, i, 0, i, 10) = true; // Chu nghieng
	            }
	            else
	            {
	                ctrl.Cell(14, i, 0, i, 10) = false;
	                grid_bs.SetCellBold(i, 0, i, 16, false);
	            }
	            //set color
	            grid_bs.SetCellBgColor(i, 0, i, 16, Number(grid_bs.GetGridData(i, 11)));
	        }
	        OnChangeLang();
	    break;       
    }
}
//-------------------------------------------------------------------------------------------------------------------
function OnChangeAmountType()
{
	if(lstAmountType.value == '01')//book
    {
        grid_bs.GetGridControl().ColHidden(8) = false;
		grid_bs.GetGridControl().ColHidden(9) = false;
		grid_bs.GetGridControl().ColHidden(13) = false;
        grid_bs.GetGridControl().ColHidden(14) = false;
        grid_bs.GetGridControl().ColHidden(15) = false;
		grid_bs.GetGridControl().ColHidden(16) = true;
		
	}
	else if(lstAmountType.value == '02')//book & usd
    {
		grid_bs.GetGridControl().ColHidden(8) = false;
		grid_bs.GetGridControl().ColHidden(9) = false;
		grid_bs.GetGridControl().ColHidden(13) = false;
        grid_bs.GetGridControl().ColHidden(14) = false;
        grid_bs.GetGridControl().ColHidden(15) = true;
		grid_bs.GetGridControl().ColHidden(16) = true;
	}
	else if(lstAmountType.value == '03')//book & won
    {
		grid_bs.GetGridControl().ColHidden(8) = false;
		grid_bs.GetGridControl().ColHidden(9) = false;
		grid_bs.GetGridControl().ColHidden(13) = true;
        grid_bs.GetGridControl().ColHidden(14) = true;
        grid_bs.GetGridControl().ColHidden(15) = false;
		grid_bs.GetGridControl().ColHidden(16) = false;
	}
	else if(lstAmountType.value == '04')//usd
    {
		grid_bs.GetGridControl().ColHidden(8) = true;
		grid_bs.GetGridControl().ColHidden(9) = true;
		grid_bs.GetGridControl().ColHidden(13) = false;
        grid_bs.GetGridControl().ColHidden(14) = false;
        grid_bs.GetGridControl().ColHidden(15) = true;
		grid_bs.GetGridControl().ColHidden(16) = true;
	}
	else if(lstAmountType.value == '05')//won
    {
		grid_bs.GetGridControl().ColHidden(8) = true;
		grid_bs.GetGridControl().ColHidden(9) = true;
		grid_bs.GetGridControl().ColHidden(13) = true;
        grid_bs.GetGridControl().ColHidden(14) = true;
        grid_bs.GetGridControl().ColHidden(15) = false;
		grid_bs.GetGridControl().ColHidden(16) = false;
		
	}
	else if(lstAmountType.value == '06')//
    {
		grid_bs.GetGridControl().ColHidden(8) = false;
		grid_bs.GetGridControl().ColHidden(9) = false;
		grid_bs.GetGridControl().ColHidden(13) = false;
        grid_bs.GetGridControl().ColHidden(14) = false;
        grid_bs.GetGridControl().ColHidden(15) = false;
		grid_bs.GetGridControl().ColHidden(16) = false;
	}
}
</script>

<body style="margin: 0; padding: 0;">
<!------------------------------------------------------------------------>
 <gw:data id="dso_getCompany" onreceive=""> 
        <xml> 
            <dso type="list" procedure="ac_sel_company" > 
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
<!------------------------------------------------------------------------------->    
    <gw:data id="dso_sel_grd_balance_sheet" onreceive="onSetFont(this)">
        <xml>
            <dso type="grid" function="ac_sel_60081335_1">
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
<!------------------------------------------------------------------------------->
    <table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
        <tr height='4%'>
			<td>
				<fieldset style="padding: 2;width:100%; height:100%">
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
								<gw:imgbtn id="ibtnReport" img="excel" alt="Print Out report" onclick="OnPrint()" />
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
						<tr>
							<td align="right" colspan='10'>Amount Type</td>
							<td colspan='3'><gw:list id="lstAmountType" onChange="OnChangeAmountType()" /></td>
						</tr>
					</table>
				</fieldset> 
			</td>
		</tr>           
		<tr height='96%'>
			<td width="100%">
				<table align ="top"  cellspacing=0 cellpadding=0 border=0 style="width:100%;height:100%;" >
					<tr height='100%'>
						<!--0_Item|1.Item Local|2_Item Korea|3_English-Vietnamese|4_Korean-Vietnamese|5_English-Vietnamese-Korean|6.Code|7.Node|8.Closing|9.Oppening|10_Bold|11_Color-->
						<td width="100%">
							<gw:grid   
								id="grid_bs"
								header  ="_Item|Item Local|_Item Korea|_English-Vietnamese|_Korean-Vietnamese|_English-Vietnamese-Korean|Code|Node|Closing|Oppening|_Bold|_Color|_|Historical Cost|Depreciation|Remain|Oppening(WON)"
								format  ="0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1"  
								aligns  ="0|0|0|0|0|0|1|1|3|3|0|0|0|3|3|3|3"  
								defaults="||||||||||||||||"  
								editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
								widths  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
								styles  ="width:100%; height:100%"
								sorting="F" 
								autosize="T"
							/> 
						</td>
					</tr>
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
			</td>
		</tr>
	</table>
	<gw:list id="lstBook_ccy" style="width: 75%; display: none"></gw:list>
	<gw:textbox id="txt_date" style="display: none" />
	<gw:textbox id="txt_row" style="display: none" />
	<gw:textbox id="txt_tmp" style="display: none" />
	<gw:textbox id="txtDateType" style="display: none" />
	<gw:textbox id="txtFinancialType" style="display: none" />
	<gw:textbox id="txtProposedByUserPk"  styles='display:none'/>
</body>
</html>
