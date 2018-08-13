<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
 
<script>

var lang = "<%=Session("SESSION_LANG")%>";
var g_company_pk = "<%=Session("COMPANY_PK")%>";
var g_user_pk = "<%=Session("USER_PK")%>";
function BodyInit()
{
    System.Translate(document);
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
	var ls_current     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
	var ls_date        = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
	var ls_Book_ccy    = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACBG0040','04','') FROM DUAL")%>";
	var ls_date1        = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL")%>";
	var ls_Type        = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACAB001') FROM DUAL")%>";
	
    lstCompany.SetDataText(ls_data);
    //lstCompany.value = g_company_pk ;
    dtPay_duefr.SetDataText(ls_date_fr);
    lstBook_ccy.SetDataText(ls_Book_ccy);
    txtLang.SetDataText(lang);
    lstType.SetDataText(ls_Type);
    lstType.value = "AP";
    txtcust_nm.SetEnable(false);
    txtpl_nm.SetEnable(false);
    txtac_nm.SetEnable(false);
    
    SetGridData();
    txtUserPK.SetDataText(g_user_pk);
    txtseq.GetControl().focus();
    dso_getCompany.Call();
}

function SetGridData()
{
    var fg  = grid.GetGridControl();
        
    if (lstBook_ccy.GetData() == 'VND')
    {
        fg.ColFormat(12)    = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(14)    = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(16)    = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(13)    = "#,###,###,###,###,###,###,###,###,###R";
        fg.ColFormat(15)    = "#,###,###,###,###,###,###,###,###,###R";
        fg.ColFormat(17)    = "#,###,###,###,###,###,###,###,###,###R";
    }
    else
    {
        fg.ColFormat(12)    = "#,###,###,###,###,###,###,###,###,###R";
        fg.ColFormat(14)    = "#,###,###,###,###,###,###,###,###,###R";
        fg.ColFormat(16)    = "#,###,###,###,###,###,###,###,###,###R";
        fg.ColFormat(13)    = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(15)    = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(17)    = "#,###,###,###,###,###,###,###,###.##R";
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
/*    var std_dt, etd_dt ;
    std_dt = dtPay_duefr.GetData();
	etd_dt = dtPay_dueto.GetData();
	if (parseInt(etd_dt) < parseInt(std_dt))
	{
		alert(' End Pay Due Date can’t be earlier than start date!!!'+'\n'+'Ngày kết thúc không thể nhỏ hơn ngày bắt đầu!!!');
		return false;
	}
*/	
	return true;
}

function Popup_Cust()
{
    var fpath   = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx?com_pk=' + lstCompany.GetData();
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
    var  url= System.RootURL + "/standard/reports/gf/da/gfda00090.aspx?p_com_pk="+lstCompany.value+"&p_date_fr="+dtPay_duefr.value
        +"&p_date_to="+dtPay_dueto.value+"&p_tco_buspartner_pk="+txtcust_pk.text+"&p_tac_abacctcode_pk="+txtac_pk.text
        +"&p_tac_abplcenter_pk="+txtpl_pk.text+"&p_seq="+txtseq.text
        +"&p_voucher="+txtvoucher_no.text+"&p_invoice_no="+txtinvoice.text+"&p_type="+lstType.value
        +"&p_lang="+txtLang.text;
        System.OpenTargetPage( url, "_blank" );
}

function Popup_PL()
{
    var fpath = System.RootURL + "/standard/forms/60/09/60090010_CtrItem2.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=ac_sel_60090010_popup_item&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
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
    var fpath = System.RootURL + "/standard/forms/60/09/60090050_popup.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60090050_popup";
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
			
			var fpath   = System.RootURL + '/standard/forms/60/09/60090050_1_popup.aspx?PK_ROW=' + pk + '&ROW=' + ctrl.row + '&ROWS=' + rows + "&ARRAY_PK=" + ls_arr + "&compk=" + lstCompany.GetData() + "&date_fr=" + dtPay_duefr.GetData() +"&date_to=" + dtPay_dueto.GetData();
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
    var fpath   = System.RootURL + '/standard/forms/60/09/60090050_1_popup.aspx';
	var wWidth  = 950;
	var wHeight = 580;
	var x = Math.round((screen.availWidth - wWidth)/2);
	var y = Math.round((screen.availHeight - wHeight)/2);
	
	var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
	   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
	   "lef="+ x +",top=" + y;
			
    var object = System.OpenModal(fpath, wWidth, wHeight, features);
}
//----------------------------------------------------------------------------
function OnDataReceive(iObj)
{
    if(iObj.id=='dso_getCompany')
    {
    }
}
//----------------------------------------------------------------------------
</script>
<body style="margin:0; padding:0;">

    <gw:data id="dso_sel_ap_balance" onreceive="SetTotal()">
        <xml>
            <dso type="grid" function="ac_sel_60090050_ap_balance">
                <input bind="grid">
                    <input bind="lstCompany"/>
                     <input bind="dtPay_duefr"/>
                     <input bind="dtPay_dueto"/>
                     <input bind="txtcust_pk"/>
                     <input bind="txtac_pk"/>
                     <input bind="txtpl_pk"/>
                     <input bind="txtseq"/>
                     <input bind="txtvoucher_no"/>
                     <input bind="txtinvoice"/>
                     <input bind="lstType"/>
                     <input bind="txtLang"/>
                </input>
                <output bind="grid"/>
            </dso>
        </xml>
    </gw:data>

<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_gfac00100_1" > 
                <input> 
                     <input bind="txtUserPK"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>    
<table width="100%" cellpadding="0" cellspacing="0" border="1">
<tr>
    <td width="100%">
	    <table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
            <td width="100%">
	            <table width="100%" cellpadding="0" cellspacing="0" border="0">
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
                <tr>
                    <td align="right">Company&nbsp;</td>
                    <td colspan="3"><gw:list id="lstCompany" onChange="" styles='width:100%'></gw:list></td>
                    <td align="center"><a title="Click here to select Customer" onclick="Popup_Cust()" href="#tips">Partner&nbsp;</td>
                    <td colspan="3">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
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
                    <td colspan = 2>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
           			        <td width="50%"><gw:icon id="btnSearch"    img="in" text="Search"     styles='width:100%' onclick="OnSearch()"/></td>
                            <td width="50%"><gw:icon id="btnPrint"     img="in" text="Print"      styles='width:100%' onclick="OnPrint()"/></td>
                        </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right">Trans Date&nbsp;</td>
                    <td><gw:datebox id="dtPay_duefr" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtPay_dueto" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center"><a title="Click here to select Account" onclick="Popup_Acc()" href="#tips">Account&nbsp;</td>
                    <td colspan="3">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
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
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td align="right" width="10%">Total</td>
                            <td align="center" width="80%"><gw:label id="lblRecord" text="0" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td> 
			                <td align="left" width="10%">vouchers</td>
                        </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right">Type&nbsp;</td>
                    <td colspan="3"><gw:list id="lstType" onChange="OnSearch()" value ="" styles='width:100%'></gw:list></td>
                    <td align="center"><a title="Click here to select Profit & Loss(PL)" onclick="Popup_PL()" href="#tips">Profit & Loss(PL)&nbsp;</td>
                    <td colspan="3">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
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
                </table>
            </td>
        </tr>
        </table>
    </td>
</tr>
<tr>
    <td width="100%">
        <gw:grid   
		    id="grid"
		    
		    header  ='Row|Seq|Acc.Code|Acc.Name|Partner Code|Partner Name|Trans Date|Voucher No|Serial No|Invoice Date|Invoice No|Due Date|A/P Ccy|A/P Trans|A/P Books|Pay Trans|Pay Books|Balance Trans|Balance Books|Description|Local Description'
		    format  ='0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|0|0'
		    aligns  ='1|1|1|0|0|0|1|1|1|1|1|1|1|3|3|3|3|3|3|0|0'
		    defaults='||||||||||||||||||||'
		    editcol ='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'  
		    widths  ='500|800|1000|2500|1500|2500|1200|2000|1500|1500|1500|1200|1000|1500|1500|1500|1500|1500|1500|2000|2000'  
		    styles  ='width:100%; height:400'
		    sorting ='T' 
		    group   ='T'
		    param   ="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20"
		    oncelldblclick="OnPopup()"
		    />
    </td>
</tr>
</table>

<gw:list    id="lstBook_ccy" 		 style="display:none"></gw:list>
<gw:textbox id="txtLang"             style="display:none" />
<gw:textbox id="txtUserPK"             style="display:none" />
</body>
</html>
