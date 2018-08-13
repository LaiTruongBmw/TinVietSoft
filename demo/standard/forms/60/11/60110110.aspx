<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>A/R Balances</title>
  </head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
 
<script>

var lang = "<%=Session("SESSION_LANG")%>";
var g_tco_company_pk = "<%=Session("COMPANY_PK")%>";
function BodyInit()
{
    System.Translate(document);
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
	var ls_current     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
	var ls_date        = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
	var ls_Book_ccy    = "<%=CtlLib.SetListDataSQL("select a.code, a.code code_nm from tac_commcode_detail a, tac_commcode_master b where a.del_if = 0 and b.del_if = 0 and a.tac_commcode_master_pk = b.pk and b.id = 'ACBG0040' and a.def_yn = 'Y' ")%>";
	var ls_date1        = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL")%>";
	var ls_Type        = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACAB002') FROM DUAL")%>";
	var ls_report        = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('GFQC0019') FROM DUAL")%>";
	
	lstType.SetDataText(ls_Type);
    lstCompany.SetDataText(ls_data);
    lstCompany.value = g_tco_company_pk ;
    dtPay_duefr.SetDataText(ls_date_fr);
    lstBook_ccy.SetDataText(ls_Book_ccy);
    txtLang.SetDataText(lang);
    lstReport.SetDataText(ls_report);
    txtcust_nm.SetEnable(false);
    txtpl_nm.SetEnable(false);
    txtac_nm.SetEnable(false);
    
    SetGridData();
    txtseq.GetControl().focus();
	txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	dso_getCompany.Call();	
}

function SetGridData()
{
    var fg  = grid.GetGridControl();
        
    if (lstBook_ccy.GetData() == 'VND')
    {
        fg.ColFormat(14)    = "#,###,###,###,###,###,###,###,###.##R"; // A/r trans
        fg.ColFormat(15)    = "#,###,###,###,###,###,###,###,###R"; // A/R books
        fg.ColFormat(16)    = "#,###,###,###,###,###,###,###,###.##R"; // Recv Trans
        fg.ColFormat(17)    = "#,###,###,###,###,###,###,###,###,###R"; // Recv Books
        fg.ColFormat(18)    = "#,###,###,###,###,###,###,###,###.##R"; //Balance Trans
        fg.ColFormat(19)    = "#,###,###,###,###,###,###,###,###,###R"; // Balance books
    }
    else
    {
        fg.ColFormat(14)    = "#,###,###,###,###,###,###,###,###.##R"; // A/r trans
        fg.ColFormat(15)    = "#,###,###,###,###,###,###,###.##R"; // A/R books
        fg.ColFormat(16)    = "#,###,###,###,###,###,###,###,###.##R"; // Recv Trans
        fg.ColFormat(17)    = "#,###,###,###,###,###,###,###,###.##R"; // Recv Books
        fg.ColFormat(18)    = "#,###,###,###,###,###,###,###,###.##R"; //Balance Trans
        fg.ColFormat(19)    = "#,###,###,###,###,###,###,###,###.##R"; // Balance books
    }
}

function Reset_Cust()
{
    txtcust_cd.SetDataText("");
    txtcust_nm.SetDataText("");
    txtcust_pk.SetDataText("");
}

function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise
}

function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
	var x = c.toUpperCase().charCodeAt(0);
	event.keyCode = x;
}

function OnCheck()
{
    var std_dt, etd_dt ;
    std_dt = dtPay_duefr.GetData();
	etd_dt = dtPay_dueto.GetData();
	if (parseInt(etd_dt) < parseInt(std_dt))
	{
		alert(' End Pay Due Date can’t be earlier than start date!!!'+'\n'+'Ngày kết thúc không thể nhỏ hơn ngày bắt đầu!!!');
		return false;
	}
	return true;
}

function Popup_Cust()
{
    var fpath   = System.RootURL + '/standard/forms/60/08/60080030_popup_customer.aspx';
    var object  = System.OpenModal(fpath , 800 , 500 , 'resizable:yes;status:yes'); 
    if ( object != null )
    {
        if (object[1] != 0)
        {
            txtcust_pk.text    = object[0];
            txtcust_nm.text    = object[2];
            txtcust_cd.text    = object[1];
        }
    }
}


function OnSearch()
{
    if (!OnCheck()) return;
    grid.ClearData();
    dso_sel_ap_balance.Call('SELECT');
}

function OnPrint()
{
    /* var  url= System.RootURL + "/standard/reports/gf/ca/gfca00060.aspx?p_com_pk="+lstCompany.value+"&p_date_fr="+dtPay_duefr.value
        +"&p_date_to="+dtPay_dueto.value+"&p_tco_buspartner_pk="+txtcust_pk.text+"&p_tac_abacctcode_pk="+txtac_pk.text
        +"&p_tac_abplcenter_pk="+txtpl_pk.text+"&p_seq="+txtseq.text
        +"&p_voucher="+txtvoucher_no.text+"&p_invoice_no="+txtinvoice.text+"&p_type="+lstType.value
        +"&p_lang="+txtLang.text+"&p_style_no="+txtStyleNo.text;
        */
            if(lstReport.value == '20')
           {  
                 //   var  url= System.RootURL + "/standard/reports/gf/ca/gfca00060.aspx?p_com_pk="+lstCompany.value+"&p_date_fr="+dtPay_duefr.value + "&p_date_to=" + dtPay_dueto.value + "&p_type=" + lstType.value + "&p_tco_buspartner_pk=" + txtcust_pk.text ;
                    var  url= System.RootURL + "/standard/reports/60/11/rpt_60110110.aspx?p_com_pk="+lstCompany.value+"&p_date_fr="+dtPay_duefr.value + "&p_date_to=" + dtPay_dueto.value + "&p_type=" + lstType.value + "&p_tco_buspartner_pk=" + txtcust_pk.text ;
                   
            }        
            else if(lstReport.value == '30')
            {
               // var  url= System.RootURL + "/standard/reports/gf/ca/gfca00060_SubTotal_Customer.aspx?company_pk=" + lstCompany.value + "&to_date=" + dtPay_dueto.value + "&acc_cd=" + txtac_cd.GetData() + "&cust_pk=" + txtcust_pk.GetData() ;
                var  url= System.RootURL + "/standard/reports/60/11/rpt_60110110_SubTotal_Customer.aspx?company_pk=" + lstCompany.value + "&to_date=" + dtPay_dueto.value + "&acc_cd=" + txtac_cd.GetData() + "&cust_pk=" + txtcust_pk.GetData() ;
            }
            else if(lstReport.value == '40')
            {
                var  url= System.RootURL + "/standard/reports/gf/ca/gfca00060_SubTotal_Customer_Domestic.aspx?company_pk=" + lstCompany.value + "&to_date=" + dtPay_dueto.value + "&acc_cd=" + txtac_cd.GetData() + "&cust_pk=" + txtcust_pk.GetData() ;
            }

            System.OpenTargetPage( url, "newform" ); 
}

function Popup_PL()
{
    var fpath = System.RootURL + "/standard/forms/60/08/60080030_popup_bank.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ac_sel_60110110_pl_popup&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
    var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
    if ( object != null ) 
    {
        if (object[0] != 0)
        {
            txtpl_pk.SetDataText(object[2]); // PK
            txtpl_cd.SetDataText(object[0]); // Item Code
            txtpl_nm.SetDataText(object[1]); // Item Name Local
        }
    }
}

function Reset_PL()
{
    txtpl_pk.SetDataText("");
    txtpl_cd.SetDataText("");
    txtpl_nm.SetDataText("");
}

function Popup_Acc()
{
    var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ACNT.SP_SEL_ACCT_POPUP";
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

function Reset_Acc()
{
    txtac_cd.SetDataText("");
	txtac_nm.SetDataText("");
	txtac_pk.SetDataText("");
}

function OnPopup()
{
    var ctrl 	= grid.GetGridControl();
	var rows    = ctrl.Rows
	rows = rows - 1;
	var rownum  	= ctrl.Row;
	var colnum  	= ctrl.Col;
	if (rownum > 0)		 
	{
		if (event.col > 1)
		{
			var pk      = grid.GetGridData(ctrl.row, 1);
			var ls_arr  = "";
			for (i = 1; i < grid.rows; i++)
			{
			    ls_arr = ls_arr + ' ' + grid.GetGridData(i, 1);
			}
			
			var fpath   = System.RootURL + '/standard/forms/gf/ca/gfca00060_popup.aspx?PK_ROW=' + pk + '&ROW=' + ctrl.row + '&ROWS=' + rows + "&ARRAY_PK=" + ls_arr + "&compk=" + lstCompany.GetData() + "&date_fr=" + dtPay_duefr.GetData() +"&date_to=" + dtPay_dueto.GetData();
			var wWidth  = 950;
			var wHeight = 390;
			var x = Math.round((screen.availWidth - wWidth)/2);
			var y = Math.round((screen.availHeight - wHeight)/2);
			
			var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
			   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
			   "lef="+ x +",top=" + y;
			
			var object = System.OpenModal(fpath, wWidth, wHeight, features);
	    }
    }
}

function SetTotal()
{
    if (grid.rows > 1)
    {
        var ctrl = grid.GetGridControl();
	    var i = ctrl.rows - 1;
	    lblRecord.SetDataText(i);
    }
    else
    {
        lblRecord.SetDataText(0);
    }
}

function Popup_Type()
{
    var fpath   = System.RootURL + '/standard/forms/ag/ga/agga00090.aspx';
	var wWidth  = 950;
	var wHeight = 580;
	var x = Math.round((screen.availWidth - wWidth)/2);
	var y = Math.round((screen.availHeight - wHeight)/2);
	
	var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
	   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
	   "lef="+ x +",top=" + y;
			
    var object = System.OpenModal(fpath, wWidth, wHeight, features);
}

function Popup_Style()
{
	var i;
    var path = System.RootURL + '/standard/forms/fp/ab/PopUpGetOneItem.aspx' ;
    var aValue = System.OpenModal( path ,950 , 500 ,  'resizable:yes;status:yes') ;	
	if(aValue != null)
	{		
		txtStyleNo.text = aValue[2] ; // item name
		txtStyleNo_PK.text = aValue[0] ; // Item PK			
	}	
}

</script>
<body style="margin:0; padding:0;">

    <gw:data id="dso_sel_ap_balance" onreceive="SetTotal()">
        <xml>
            <dso type="grid" function="ac_sel_60110110_balance">
                <input bind="grid">
                    <input bind="lstCompany" />
                     <input bind="dtPay_duefr" />
                     <input bind="dtPay_dueto" />
                     <input bind="txtcust_pk" />
                     <input bind="txtac_pk" />
                     <input bind="txtpl_pk" />
                     <input bind="txtseq" />
                     <input bind="txtvoucher_no" />
                     <input bind="txtinvoice" />
					 <input bind="txtPONo" />
                     <input bind="lstType" />                     
					 <input bind="txtStyleNo" />
					 <input bind="txtLang" />
                </input>
                <output bind="grid"/>
            </dso>
        </xml>
    </gw:data>
<gw:data id="dso_getCompany" onreceive=""> 
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
    
<table width="100%" cellpadding="0" cellspacing="0" border="1" height="100%" >
<tr style="height:10%" >
    <td width="100%">
	    <table width="100%" cellpadding="0" cellspacing="0" border="0" height="100%" >
		<tr>
            <td width="100%">
	            <table width="100%" cellpadding="0" cellspacing="0" border="0" >
		        <tr>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="2%"></td>
                    <td width="10%"></td>
                    <td width="8%"></td>
                    <td width="12%"></td>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="8%"></td>
                    <td width="10%"></td>
                    <td width="5%"></td>
                    <td width="5%"></td>
                </tr>
                <tr >
                    <td align="right">Company&nbsp;</td>
                    <td colspan="3"><gw:list id="lstCompany" onChange="" styles='width:100%'></gw:list></td>
                    <td align="center"><a title="Click here to select Customer" onclick="Popup_Cust()" href="#tips">Partner&nbsp;</td>
                    <td colspan="3">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0" height="100%" >
                        <tr>
                            <td width="30%"><gw:textbox id="txtcust_cd" styles='width:100%'/></td>
                            <td width="60%"><gw:textbox id="txtcust_nm" styles='width:100%'/></td>
                            <td width="0%"><gw:textbox  id="txtcust_pk" styles='display:none'/></td>
                            <td width="5%"><gw:imgBtn   img="reset"	id="idResetTr"  alt="Reset" onclick="Reset_Cust()"/></td>
                        </tr>
                        </table>
                    </td>
                    <td align="right">SEQ&nbsp;</td>
                    <td colspan = 2><gw:textbox id="txtseq" styles="width:100%" onenterkey="OnSearch()" onkeypress="CheckNumeric()"/></td>
                    <td colspan = 2 align="center">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0" height="100%" >
                        <tr>
           			        <td >
           			        <gw:imgbtn id="btnSearch" img="Search" alt="Search"  onclick="OnSearch()" />
           			       </td>
                            <td ><gw:imgbtn id="btnPrint"     img="excel" text="Print"      styles='width:100%' onclick="OnPrint()"/></td>
                        </tr>
                        </table>
                    </td>
                </tr>
                <tr >
                    <td align="right">Trans/Balance&nbsp;</td>
                    <td><gw:datebox id="dtPay_duefr" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtPay_dueto" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center"><a title="Click here to select Account" onclick="Popup_Acc()" href="#tips">Account&nbsp;</td>
                    <td colspan="3">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0" height="100%" >
                        <tr>
                            <td width="30%"><gw:textbox id="txtac_cd" styles='width:100%'/></td>
                            <td width="60%"><gw:textbox id="txtac_nm" styles='width:100%'/></td>
                            <td width="0%"><gw:textbox  id="txtac_pk" styles='display:none'/></td>
                            <td width="5%"><gw:imgBtn   img="reset"	id="idResetAcc"  alt="Reset" onclick="Reset_Acc()"/></td>
                        </tr>
                        </table>
                    </td>
                    <td align="right">Voucher No&nbsp;</td>
                    <td colspan="2"><gw:textbox id="txtvoucher_no" styles="width:100%" onenterkey="OnSearch()"/></td>
                    <td colspan="2">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0" height="100%" >
                        <tr>
                            <td align="right" width="10%">Total</td>
                            <td align="center" width="80%"><gw:label id="lblRecord" text="0" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td> 
			                <td align="left" width="10%">vouchers</td>
                        </tr>
                        </table>
                    </td>
                </tr>
                <tr >
                    <td align="right"><a title="Click here to select Type" onclick="Popup_Type()" href="#tips">Type&nbsp;</td>
                    <td colspan="3"><gw:list id="lstType" onChange="OnSearch()" value ="" styles='width:100%'></gw:list></td>
                    <td align="center"><a title="Click here to select Profit & Loss(PL)" onclick="Popup_PL()" href="#tips">Profit & Loss(PL)&nbsp;</td>
                    <td colspan="3">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0" height="100%" >
                        <tr>
                            <td width="30%"><gw:textbox id="txtpl_cd" styles='width:100%'/></td>
                            <td width="60%"><gw:textbox id="txtpl_nm" styles='width:100%'/></td>
                            <td width="0%"><gw:textbox  id="txtpl_pk" styles='display:none'/></td>
                            <td width="5%"><gw:imgBtn   img="reset"	id="idResetPL"  alt="Reset" onclick="Reset_PL()"/></td>
                        </tr>
                        </table>
                    </td>
			        <td align="right">Invoice No&nbsp;</td>
			        <td colspan="2"><gw:textbox id="txtinvoice" styles="width:100%" onenterkey="OnSearch()"/></td>
                    <td colspan="2"></td>
                </tr>
				<tr >
					<td align="right"><a title="Click here to select Style No" onclick="Popup_Style()" href="#tips">Style No&nbsp;</td>
					<td align="left" colspan="3"><gw:textbox id="txtStyleNo" styles="width:100%" /></td>
					<td align="right" >CI No&nbsp;</td>
					<td colspan="3">
					                <table style="width:100%" cellpadding="0" cellspacing="0">
					                            <tr>
					                                        <td width="30%"><gw:textbox id="txtCINo" styles="width:100%" /></td> 
					                                        <td align="right" width="25%">Report Type</td>
					                                        <td width="45%"><gw:list id="lstReport" styles="width:100%" /></td>
					                            </tr>
					                </table>
					</td>
					
					<td align="right">PO No&nbsp;</td>
					<td colspan="2"><gw:textbox id="txtPONo" styles="width:100%" onenterkey="OnSearch()"/></td>
				</tr>
                </table>
            </td>
        </tr>
        </table>
    </td>
</tr>
<tr style="height:90%;" >
    <td width="100%">
        <gw:grid   
		    id="grid"
		    header  ='Row|Seq|Acc.Code|Acc.Name|Partner Code|Partner Name|Trans Date|Voucher No|Style No|Serial No|Invoice Date|Invoice No|Due Date|A/R Ccy|A/R Trans|A/R Books|Recv Trans|Recv Books|Balance Trans|Balance Books|Description|Local Description'
		    format  ='0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|0|0'
		    aligns  ='1|1|1|0|0|0|1|1|2|1|1|1|1|1|3|3|3|3|3|3|0|0'
		    defaults='|||||||||||||||||||||'
		    editcol ='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'  
		    widths  ='500|800|1000|2500|1500|2500|1200|2000|2500|1500|1500|1500|1200|1000|1500|1500|1500|1500|1500|1500|2000|2000'  
		    styles  ='width:100%; height:100%'
		    sorting ='T' 
		    group   ='T'
		    param   ="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21"
		    oncelldblclick="OnPopup()"
		    />
    </td>
</tr>
</table>
<gw:list    id="lstBook_ccy" 		 style="display:none"></gw:list>
<gw:textbox id="txtLang"             style="display:none" />
<gw:textbox id="txtStyleNo_PK"       style="display:none" />
<gw:textbox id="txtProposedByUserPk"  styles='display:none' />
</body>
</html>
