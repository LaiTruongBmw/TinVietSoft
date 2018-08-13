<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
 
<script>

var pk, row_index, rows_index;
var arr_pk = new Array();
row_index   = 0;
rows_index  = 0;

function BodyInit()
{
    System.Translate(document);
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
	var ls_current     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
	var ls_date        = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
	var ls_Book_ccy    = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACBG0040','04','') FROM DUAL")%>";
	var ls_date1        = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL")%>";
	
	lstCompany.SetDataText(ls_data);
    dtPay_duefr.SetDataText(ls_date_fr);
    lstBook_ccy.SetDataText(ls_Book_ccy);
    
    txtcust_nm.SetEnable(false);
    txtpl_nm.SetEnable(false);
    txtac_nm.SetEnable(false);
    
    SetGridData();
    pk              = "<%=Request.querystring("PK_ROW")%>";
    row_index       = "<%=Request.querystring("ROW")%>";
    rows_index      = "<%=Request.querystring("ROWS")%>";
    var ls_str      = "<%=Request.querystring("ARRAY_PK")%>";
    var l_date_fr   = "<%=Request.querystring("date_fr")%>";
    var l_date_to   = "<%=Request.querystring("date_to")%>";
    var l_com_pk    = "<%=Request.querystring("compk")%>";
    
    lstCompany.SetDataText(l_com_pk);
    dtPay_duefr.SetDataText(l_date_fr);
    dtPay_dueto.SetDataText(l_date_to);
    
    arr_pk = ls_str.split(' ');
	var ls_temp = arr_pk[row_index];
	txtseq.SetDataText(ls_temp);
    txtseq.GetControl().focus();
    dso_sel_ap_balance_popup.Call('SELECT');
}

function SetGridData()
{
    var fg  = grid.GetGridControl();
        
    if (lstBook_ccy.GetData() == 'VND')
    {
        fg.ColFormat(5)    = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(6)    = "#,###,###,###,###,###,###,###,###,###R";
    }
    else
    {
        fg.ColFormat(5)    = "#,###,###,###,###,###,###,###,###,###R";
        fg.ColFormat(6)    = "#,###,###,###,###,###,###,###,###.##R";
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
    var fpath   = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx';
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
    dso_sel_ap_balance_popup.Call('SELECT');
}

function OnPrint()
{
    alert("Not Yet");
    return;
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

function OnPre()
{
	if(row_index < 2)
	{
		alert("First record...");
		row_index = 0;
	}
	else
	{
		row_index = parseInt(row_index) - 1;
		var ls_temp = arr_pk[row_index];
        txtseq.SetDataText(ls_temp);
        dso_sel_ap_balance_popup.Call('SELECT');
	}
}

function OnNext()
{
	if (row_index == rows_index)
		alert("Last record...");
	else
	{
		row_index = parseInt(row_index) + 1;
		var ls_temp = arr_pk[row_index];
        txtseq.SetDataText(ls_temp);
        dso_sel_ap_balance_popup.Call('SELECT');
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

function onSearchTAcc()
{
    var ls_seq = grid.GetGridData(grid.selrow, 1);
    if ( ls_seq != '')
    {
        var pk      = ls_seq;
		var status  = '2';
		
		var fpath   = System.RootURL + '/standard/forms/60/09/60090040_popup_TAcc.aspx?PK_ROW=' + pk + '&APPRCANCEL=' + status;
		var wWidth  = 950;
		var wHeight = 570;
		var x = Math.round((screen.availWidth - wWidth)/2);
		var y = Math.round((screen.availHeight - wHeight)/2);
			
		var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
		   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
		   "lef="+ x +",top=" + y;
		
		var object = System.OpenModal(fpath, wWidth, wHeight, features);
    }
}


</script>
<body style="margin:0; padding:0;">

    <gw:data id="dso_sel_ap_balance_popup" onreceive="SetTotal()">
        <xml>
            <dso type="grid" function="ac_sel_60110050_ar_bal_popup">
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
                </input>
                <output bind="grid"/>
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
                            <td width="45%"></td>
           			        <td><gw:imgBtn    img="back" alt="Back" id="btnBack" 	onclick="OnPre()"/></td>
				            <td><gw:imgBtn    img="next" alt="Next" id="btnNext" 	onclick="OnNext()"/></td>
				            <td width="45%"></td>
                        </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right">Trans/Balance&nbsp;</td>
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
                            <td width="50%"><gw:icon id="btnSearch"    img="in" text="Search"     styles='width:100%' onclick="OnSearch()"/></td>
                            <td width="50%"><gw:icon id="btnPrint"     img="in" text="Print"      styles='width:100%' onclick="OnPrint()"/></td>
                        </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right">Type&nbsp;</td>
                    <td colspan="3"><gw:list id="lstType" onChange="" value ="" styles='width:100%'></gw:list></td>
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
		    header  ='Row|Seq|Trans Date|Voucher No|Iovoice No|Pay Trans|Pay Books|Description|Local Description'
		    format  ='0|0|0|0|0|0|0|0|0'
		    aligns  ='1|1|1|0|0|3|3|0|0'
		    defaults='||||||||'
		    editcol ='0|0|0|0|0|0|0|0|0'
		    widths  ='500|800|1500|2000|1500|1500|1500|2500|0'
		    styles  ='width:100%; height:300'
		    sorting ='F'
		    oncelldblclick="onSearchTAcc()"
		    />
    </td>
</tr>
</table>

<gw:list    id="lstBook_ccy" 		    style="display:none"></gw:list>

</body>
</html>
