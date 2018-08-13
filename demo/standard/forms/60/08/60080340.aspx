<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>

<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 var idGrid_Account_code=0,
idGrid_account_name=1,
idGrid_local_nm=2,
idGrid_kor_nm=3,
idGrid_pl_cd=4,
idGrid_pl_nm=5,
idGrid_plc_cd=6,
idGrid_plc_nm=7,
idGrid_dr_op=8,
idGrid_cr_op=9,
idGrid_dr_op1=10,
idGrid_cr_op1=11,
idGrid_dr_ps=12,
idGrid_cr_ps=13,
idGrid_dr_ps1=14,
idGrid_cr_ps1=15,
idGrid_dr_acc=16,
idGrid_cr_acc=17,
idGrid_dr_acc1=18,
idGrid_cr_acc1=19,
idGrid_dr_bl=20,
idGrid_cr_bl=21,
idGrid_dr_bl1=22,
idGrid_cr_bl1=23,
idGrid_bold_yn=24,
idGrid_color=25,
idGrid_tac_abacctcode_pk=26,
idGrid_ltac_abplcenter_pk=27;

function BodyInit()
{
    System.Translate(document);
    var ls_company = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_type    = "DATA|G|General Ledger";
    var ls_lang    = "<%=CtlLib.SetListDataFUNC("SELECT AC_A_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
    
    var ls_level   = "<%=CtlLib.SetListDataFUNC("SELECT AC_F_COMMONCODE('ACAB0020','','') FROM DUAL")%>||";
    var ls_possum  = "DATA|Y|Posting|N|Summary||";
    var ls_date     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
    var ls_month    = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(ADD_MONTHS(SYSDATE,-1), 'YYYYMM') FROM DUAL")%>";
    var dataAccType  =  "<%=CtlLib.SetListDataFUNC("SELECT AC_A_GET_COMMONCODE('EACBK020') FROM DUAL")%>";
    lstAccType.SetDataText(dataAccType); 
    var dataStatus = "Data|0|Approved|2|Confirmed"; 
    lstStatus.SetDataText(dataStatus); 
    lstStatus.SetDataText("2"); 
    txt_date.SetDataText(ls_date);
    lstCompany.SetDataText(ls_company);
   
    lstLang.SetDataText(ls_lang);
    lstLevel.SetDataText(ls_level);
    lstPostSum.SetDataText(ls_possum);
    MergeHeader();
 
    txtac_nm.SetEnable(false);
    lstLevel.SetDataText("");
    lstPostSum.SetDataText("");
   // idGrid.GetGridControl().FrozenCols = 5;
   
    txtac_cd.GetControl().focus();
    OnLang();
	OnChangeMonth();
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	dso_getCompany.Call();
        
}

function OnLang()
{
    /*if(lstLang.value == 'ENG')
    {
        idGrid.GetGridControl().ColHidden(2) = false;
        idGrid.GetGridControl().ColHidden(3) = true;
        idGrid.GetGridControl().ColHidden(4) = true;
    }
    else if(lstLang.value == 'VIE')
    {
        idGrid.GetGridControl().ColHidden(2) = true;
        idGrid.GetGridControl().ColHidden(3) = false;
        idGrid.GetGridControl().ColHidden(4) = true;
    }
    else if(lstLang.value == 'KOR')
    {
        idGrid.GetGridControl().ColHidden(2) = true;
        idGrid.GetGridControl().ColHidden(3) = true;
        idGrid.GetGridControl().ColHidden(4) = false;
    }
    else if(lstLang.value == 'ENG-KOR')
    {
        idGrid.GetGridControl().ColHidden(2) = false;
        idGrid.GetGridControl().ColHidden(3) = true;
        idGrid.GetGridControl().ColHidden(4) = false;
    }
    else if(lstLang.value == 'ENG-VIE')
    {
        idGrid.GetGridControl().ColHidden(2) = false;
        idGrid.GetGridControl().ColHidden(3) = false;
        idGrid.GetGridControl().ColHidden(4) = true;
    }
    else if(lstLang.value == 'ENG-VIE-KOR')
    {
        idGrid.GetGridControl().ColHidden(2) = false;
        idGrid.GetGridControl().ColHidden(3) = false;
        idGrid.GetGridControl().ColHidden(4) = false;
    }
    else if(lstLang.value == 'KOR-VIE')
    {
        idGrid.GetGridControl().ColHidden(2) = true;
        idGrid.GetGridControl().ColHidden(3) = false;
        idGrid.GetGridControl().ColHidden(4) = false;
    }*/
}

function onSearch()
{

    OnLang();

    //if (!onCheckMonth()) return;
    txtac_cd.GetControl().focus(); 
    idGrid.ClearData();
  
    if (txtac_cd.GetData() == '')
    {
        txtac_nm.SetDataText("");
    }
   
    
   dso_60080340.Call('SELECT');
   
    
}

	

function MergeHeader()
{
	if (idGrid.rows < 2)
	{
	    idGrid.AddRow();
	}
	/*function HideColBook()
	{
	    idGrid.GetGridControl().ColHidden(5) = true;
		idGrid.GetGridControl().ColHidden(6) = true;
	    idGrid.GetGridControl().ColHidden(9) = true;
		idGrid.GetGridControl().ColHidden(10) = true;
		
	    idGrid.GetGridControl().ColHidden(13) = true;
		idGrid.GetGridControl().ColHidden(14) = true;
		idGrid.GetGridControl().ColHidden(17) = true;
		idGrid.GetGridControl().ColHidden(18) = true;
	}
	function AppearColBook()
	{
	    idGrid.GetGridControl().ColHidden(5) = false;
		idGrid.GetGridControl().ColHidden(6) = false;
	    idGrid.GetGridControl().ColHidden(9) = false;
		idGrid.GetGridControl().ColHidden(10) = false;
		
	    idGrid.GetGridControl().ColHidden(13) = false;
		idGrid.GetGridControl().ColHidden(14) = false;
		idGrid.GetGridControl().ColHidden(17) = false;
		idGrid.GetGridControl().ColHidden(18) = false;
	}
	function HideColTrans()
	{
	    idGrid.GetGridControl().ColHidden(7) = true;
		idGrid.GetGridControl().ColHidden(8) = true;
	    idGrid.GetGridControl().ColHidden(11) = true;
		idGrid.GetGridControl().ColHidden(12) = true;
		
	    idGrid.GetGridControl().ColHidden(15) = true;
		idGrid.GetGridControl().ColHidden(16) = true;
		idGrid.GetGridControl().ColHidden(19) = true;
		idGrid.GetGridControl().ColHidden(20) = true;
	}
	function AppearColTrans()
	{
	    idGrid.GetGridControl().ColHidden(7) = false;
		idGrid.GetGridControl().ColHidden(8) = false;
	    idGrid.GetGridControl().ColHidden(11) = false;
		idGrid.GetGridControl().ColHidden(12) = false;
		
	    idGrid.GetGridControl().ColHidden(15) = false;
		idGrid.GetGridControl().ColHidden(16) = false;
		idGrid.GetGridControl().ColHidden(19) = false;
		idGrid.GetGridControl().ColHidden(20) = false;
	}*/
	
	
		var fg=idGrid.GetGridControl();
		fg.FixedRows    = 2
		fg.MergeCells   = 5
		fg.MergeRow(0) = true
		
		fg.Cell(0, 1, 4, 1 ) 	= "Code"
		fg.Cell(0, 1, 5, 1 ) 	= "Name"
		fg.Cell(0, 1, 6, 1) 	= "Code"
		fg.Cell(0, 1, 7, 1 ) 	= "Name"
		fg.Cell(0, 1, 8, 1) 	= "Debit"
		fg.Cell(0, 1, 9, 1 ) 	= "Credit"
		fg.Cell(0, 1, 12, 1) 	= "Debit"
		fg.Cell(0, 1, 13, 1 ) 	= "Credit"
		fg.Cell(0, 1, 16, 1) 	= "Debit"
		fg.Cell(0, 1, 17, 1 ) 	= "Credit"
		fg.Cell(0, 1, 20, 1) 	= "Debit"
		fg.Cell(0, 1, 21, 1 ) 	= "Credit"
		
				
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Acc.Code"
		fg.MergeCol(1) = true
		fg.Cell(0, 0, 1, 1, 1) = "Acc.Name"		
        fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Acc Name (Local)"
        fg.MergeCol(3) = true
		fg.Cell(0, 0, 3, 1, 3) = "Acc Name (Kor)"
		fg.MergeCol(4) = true
		fg.Cell(0, 0, 4, 0, 5) = "PL "
		fg.MergeCol(5) = true
		fg.Cell(0, 0, 6, 0, 7) = "PL Center"
		fg.MergeCol(6) = true
		fg.Cell(0, 0, 8, 0, 9) = "Beginning Balance(Book)" 	
	
		fg.Cell(0, 0, 12, 0, 13) = "Period Balance(Book)"	
		
		fg.Cell(0, 0, 16, 0, 17)  = "Cumulative(Book)"
		
		fg.Cell(0, 0, 20, 0, 21) = "Ending Balance(Book)"
		
		
		//fg.ColWidth(2)=1700;
		////fg.ColWidth(3)=1700;
		//fg.ColWidth(4)=1700;
		fg.ColWidth(5)=1500;
		fg.ColWidth(6)=1500;
		fg.ColWidth(7)=1500;
		fg.ColWidth(8)=1500;
		fg.ColWidth(9)=1500;
		fg.ColWidth(10)=1500;
		fg.ColWidth(11)=1500;
		fg.ColWidth(12)=1500;
		fg.ColWidth(13)=1500;
		fg.ColWidth(14)=1500;
		fg.ColWidth(15)=1500;
	
}

function onReport()
{
   
        var _check = 0;
      
        var url = '/standard/reports/60/08/rpt_60080050_Trial_balance.aspx?p_tco_company_pk='+ lstCompany.value + '&p_lang='+ lstLang.value + '&p_date_fr=' +dtFrom.value+ '&p_date_to=' +  dtTo.value  + '&p_status='+ lstStatus.value + '&p_level=' + lstLevel.value + '&p_possum=' + lstPostSum.value + '&p_accd=' + txtac_cd.text + '&p_pacctype=' + lstAccType.value;
	    System.OpenTargetPage( System.RootURL+url , "newform" );
	   
}

function onSetColor()
{
	MergeHeader();
    var ctrl = idGrid.GetGridControl();
    for (i = 1; i < ctrl.Rows; i++)
	{
	    
	    if(idGrid.GetGridData(i,idGrid_bold_yn)== "B")
        {
	        ctrl.Cell(14, i, 1, i, idGrid_bold_yn) = false;
	        idGrid.SetCellBold(i, 1, i, idGrid_bold_yn, true);
        }
        else if (idGrid.GetGridData(i,idGrid_bold_yn)== "I")
        {
	        idGrid.SetCellBold(i, 1, i, idGrid_bold_yn, false);
	        ctrl.Cell(14, i, 1, i, idGrid_bold_yn) = true; // Chu nghieng
	    }
	    else
	    {
	        ctrl.Cell(14, i, 1, i, idGrid_bold_yn) = false;
	        idGrid.SetCellBold(i, 1, i, idGrid_bold_yn, false);
	    }
	    idGrid.SetCellBgColor(i, 0, i, idGrid_bold_yn, Number(idGrid.GetGridData(i, idGrid_color)));
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
    dso_pro_acc.Call();
}

function OnChangeList()
{
    dso_pro_acc.Call();
}

function OnChangeCurrent()
{
    dso_get_rate.Call();
}

function Reset_Acc()
{

    txtac_cd.text = "";
    txtac_nm.text = "";
    txtac_pk.text = "";
}
function Reset_PL()
{
 
    txtpl_cd.text = "";
    txt_PLC_CD.text = "";
    
}
function OnDataReceive(obj)
{ 
   if(obj.id=='dso_60080340')
   {
		onSetColor();
		auto_resize_column(idGrid,0,idGrid.cols-1,9);
   }
    
}

function Popup()
	{
			var fpath = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code=" + "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=AC_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
			var object = System.OpenModal(fpath, 600, 500, 'resizable:yes;status:yes');
			{
			if (object != null) 
				{
				if (object[0] != 0) 
					{
						txtpl_cd.SetDataText(object[0]);
						txt_PLC_CD.SetDataText(object[3]);
						l_pl_nm=object[1];
						l_plc_nm=object[4];
					} 
				}
			}
		
	}
function Popup_Acc()
{
    var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_acct_popup";
    o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes');	
    if (o != null)
	{
		if(o[0] != 0)
		{
		    txtac_cd.SetDataText(o[0]);
			txtac_nm.SetDataText(o[1]);
			txtac_pk.SetDataText(o[3]);
		}
    }
}
function OnPopupDailySL()
{
    var ctrl 	= idGrid.GetGridControl();
	var rows    = ctrl.Rows
	rows = rows - 1;
	var rownum  	= ctrl.Row;
	var colnum  	= ctrl.Col;
	if (rownum > 1)		 
	{
		if (event.col > 1)
		{
			var ac_pk   = idGrid.GetGridData(ctrl.row, 1);
			var ac_nm   = idGrid.GetGridData(ctrl.row, 2);
			var fpath   = System.RootURL + '/standard/forms/60/08/60080050_p1.aspx?ac_pk='+ ac_pk + '&ac_nm=' + ac_nm + '&compk=' + lstCompany.GetData() + '&status=' + lstStatus.GetData() + '&lang='+ lstLang.GetData() + '&cur=ALL' +  '&date_fr=' + dtFrom.GetData() + '&date_to=' + dtTo.GetData() + '&type_month=';
			//    alert(fpath);
				fpath = fpath + '&ac_cd=' + idGrid.GetGridData(ctrl.row, 23) + '&ad_nm1=' + idGrid.GetGridData(ctrl.row, 24) ;
			var wWidth  = 950;
			var wHeight = 500;
			var x = Math.round((screen.availWidth - wWidth)/2);
			var y = Math.round((screen.availHeight - wHeight)/2);
			var features="";
			//var features = "toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes," + 
			  // "scrollbars=no,resizable=yes,copyhistory=no,width="+wWidth+",height="+wHeight +
			  // "lef="+ x +",top=" + y;
			
			var object = System.OpenModal(fpath, wWidth, wHeight, features);
	    }
    }
}

function OnChangeRadio()
{
    onSearch();
}
function OnChangeMonth()
{
    var yyyymm = dtMonth.GetData();
    var yyyy = yyyymm.substr(0,4);
    var mm = yyyymm.substr(4,2);
    dtFrom.SetDataText(yyyy+mm+"01");
    dtTo.SetDataText(yyyy+mm+LastDayOfMonth(yyyymm));
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

function OnPrint()
{
	
	 var url = '/standard/reports/60/08/rpt_60080340_trial_bl.aspx?p_tco_company_pk='+ lstCompany.value + '&p_lang='+ lstLang.value + '&p_date_fr=' +dtFrom.value+ '&p_date_to=' +  dtTo.value  + '&p_status='+ lstStatus.value + '&p_level=' + lstLevel.value + '&p_possum=' + lstPostSum.value + '&p_accd=' + txtac_cd.text + '&p_pacctype=' + lstAccType.value+"&p_from_text="+dtFrom.text+"&p_to_text="+dtTo.text+'&p_lstAccType='+lstAccType.text;
	    System.OpenTargetPage( System.RootURL+url , "newform" ); 
 } 

function ongrid_celldblclick(obj)
{
    var path;
    var object;
	if (event.row < 1) return;
	var row = event.row;
	
    if (obj.id == "idGrid" )  //Acc 
    {
        var path = System.RootURL + "/standard/forms/60/08/60080340_popup.aspx?status=" + lstStatus.value + "&company=" + lstCompany.value + "&from=" + dtFrom.value + "&to=" + dtTo.value + '&ac_pk=' + idGrid.GetGridData(idGrid.row,idGrid_tac_abacctcode_pk) + "&ac_cd=" + idGrid.GetGridData(idGrid.row,idGrid_Account_code) + "&ac_nm=" + idGrid.GetGridData(idGrid.row,idGrid_account_name) + "&pl_center=" + idGrid.GetGridData(idGrid.row,idGrid_plc_cd) + "&pl_center_nm=" + idGrid.GetGridData(idGrid.row,idGrid_plc_nm) + "&pl_unit=" + idGrid.GetGridData(idGrid.row,idGrid_pl_cd) + "&pl_unit_nm=" + idGrid.GetGridData(idGrid.row,idGrid_pl_nm);
        object   = System.OpenModal( path , 1024 , 768 , 'resizable:yes;status:yes');	
        
    }
} 
function auto_resize_column(obj,col1,col2,font_size)
{
    if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
</script>
<body style="margin:0; padding:0;">
	<!------------------------------------------------------------------------>
 <gw:data id="dso_getCompany" onreceive=""> 
        <xml> 
            <dso type="list" procedure="ac_sel_60010020_1" > 
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
	<gw:data id='dso_60080340'  onreceive='OnDataReceive(this)'>
<xml>
 <dso type='grid' function='ac_sel_60080340_detail_pl' >

<input bind='idGrid' >
 <input bind='lstCompany' />
 <input bind='lstLang' />
 <input bind='dtFrom' />
 <input bind='dtTo' />
 <input bind='lstStatus' />
 <input bind='lstLevel' />
 <input bind='lstPostSum' />
 <input bind='txtac_cd' />
 <input bind='lstAccType' />
 <input bind='txtpl_cd' />
 <input bind='txt_PLC_CD' />
</input>
<output bind='idGrid'/>
</dso>
</xml>
</gw:data>
   
    
    <gw:data id="dso_pro_acc" onreceive="onSearch()">
        <xml> 
            <dso type="process" procedure="ac_sel_account" > 
                <input> 
                     <input bind="lstCompany"/>
                     <input bind="txtac_cd"/>
                     <input bind="lstLang"/>
                </input>
                <output>
                     <output bind="txtac_pk"/>
                     <output bind="txt_temp"/>
                     <output bind="txtac_nm"/>
               </output>
            </dso> 
        </xml> 
    </gw:data>
    
    
<table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
<tr style='height:6%'>
    <td width="100%">
        <fieldset style='padding:0'>
        <table width="100%" cellpadding="1" cellspacing="1" border="0">
        <tr>
	        <td width="5%"></td>
	        <td width="24%"></td>
	        <td width="5%"></td>
	        <td width="11%"></td>
	        <td width="8%"></td> 
	        <td width="13%"></td>
	        <td width="7%"></td>
	        <td width="13%"></td>
	        <td width="5%"></td>
	        <td width="9%"></td>
	        
	    </tr>
	    <tr>
	        <td align="right">Company&nbsp;</td>
            <td><gw:list id="lstCompany" onChange ="onSearch()" styles='width:100%'></gw:list></td>
                           <td align="right">Language&nbsp;</td>
            <td><gw:list id="lstLang" onChange="OnChangeList()" /></td>
			
			 <td align="right">  PL &nbsp;</td>
			<td id='idpl_cd' width="20%"><gw:textbox id="txtpl_cd" onenterkey="onSearch()" styles='width:100%' /></td>
			<td id='idpl_nm' width="40%" colspan="4"><gw:textbox id="txt_PLC_CD" styles='width:100%'/></td>
			<td id='idbt_pl' width="5%"><gw:imgBtn   img="popup"	id="idSearchCust" alt="Popup" onclick="Popup()"/></td> 
			<td width="5%"><gw:imgBtn   img="reset"	id="idResetPLC"  alt="Reset" onclick="Reset_PL()"/></td>
           
	    </tr>
	     <tr>
	        <td>Month</td>
            <td align="center">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td><gw:label id="lblRecord"   text=""/></td>
                    <td><gw:datebox id="dtMonth" lang="1" type="month" onchange="OnChangeMonth();"/></td>
                    <td><gw:datebox id="dtFrom" lang="1"  /></td>
					<td>~</td>
					<td><gw:datebox id="dtTo" lang="1" /></td>
                    <td><gw:label id="lblRecord1"  text=""/></td>
                </tr>
                </table>
            </td>
					<td align="right">Status</td>
					<td width="15%"><gw:list id="lstStatus" onchange="onSearch()"/></td> 
					<td width="10%" align="right">Acc.Type</td>
					<td width="55%" colspan="5"> <gw:list id="lstAccType" onChange ="onSearch()"  styles='width:100%'></gw:list> </td>			
					<td colspan="2"><gw:button id="ibtnReport" img="excel"  text="Print" alt="Print out report file excel"  onclick="OnPrint()"/></td>
	    </tr>
	     <tr>
	        <td align="right"><a title="Click here to select Ex.Rate" onclick="Popup_Acc()" href="#tips" style="text-decoration: none; color=#0000ff"><b>Acc.Code&nbsp;</b></a></td>
	        <td colspan="3">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="35%"><gw:textbox id="txtac_cd" styles='width:100%' onkeypress="CheckNumeric()" onenterkey="onEnter()"/></td>
                    <td width="60%"><gw:textbox id="txtac_nm" styles='width:100%'/></td>
                    <td width="0%"><gw:textbox  id="txtac_pk" styles='display:none'/></td>
                    <td width="5%"><gw:imgBtn   img="reset"	id="idResetAcc"  alt="Reset" onclick="Reset_Acc()"/></td>
                </tr>
                </table>
	        </td>
			<td >Posting/Summary&nbsp;</td>
			
			
			
			<td colspan="6">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
					 <td width="35%"> <gw:list id="lstPostSum" onChange ="OnChangeList()"  styles='width:100%'></gw:list> </td>
					 <td width="10%">Level&nbsp;</td>
				<td width="55%" colspan='2'><gw:list id="lstLevel" onChange="OnChangeList()"  /></td>
                    
                </tr>
                </table>
	        </td>
			
			
           <td align="right"><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"        onclick="onSearch()"/></td>
           <td ><gw:imgBtn id="ibtnReport" img="printer"   alt="Print"  styles='display:none' onclick="onReport()"/></td>
	    </tr>
	    </table>
        </fieldset>
	</td>
</tr>
<tr style='height:94%'>
	<td width="100%">
	    <table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
        <tr style='height:75%'>
            <!--0.Ctrl|1_PK|2.Account Name|3.Begin Bal(Debt)|4.Begin Bal(Cret)|5.Debit|6.Credit|7.cal bal(Debt)|8.cal bal(Cret)|9.Ending bal(Debt)|10.Ending bal(Cret)|11_B|12_COLOR|13_ac_cd|14_ac_nm-->
            <td>
			  <gw:grid 
id='idGrid'
header='Account code|Account Name|local_nm|kor_nm|pl_cd|pl_nm|plc_cd|plc_nm|dr_op|cr_op|_dr_op1|_cr_op1|dr_ps|cr_ps|_dr_ps1|_cr_ps1|dr_acc|cr_acc|_dr_acc1|_cr_acc1|dr_bl|cr_bl|_dr_bl1|_cr_bl1|_bold_yn|_color|_tac_abacctcode_pk|_ltac_abplcenter_pk'
format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
aligns='2|2|2|2|2|2|2|2|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|2|2|2|2'
editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
defaults='|||||||||||||||||||||||||||'
widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
check='|||||||||||||||||||||||||||'
sorting='T'
autosize='T'
styles='width:100%;height:100%;'
oncelldblclick='ongrid_celldblclick(this);'
/>

       </td>
        </tr>
       
        </table>
	</td>
</tr>
</table>

<gw:textbox id="txt_check"      styles='display:none'/>
<gw:textbox id="txt_temp"       styles='display:none'/>
<gw:textbox id="txt_row"        styles='display:none'/>
<gw:textbox id="txt_date"       styles='display:none'/>
<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>

</body>
</html>

