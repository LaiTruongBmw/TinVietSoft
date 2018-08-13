<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
 <%CtlLib.SetUser(Session("APP_DBUSER"))%>
 
<script>
var lang = "";
var g_company_pk = "";
var g_user_pk = "";
function BodyInit()
{
    lang = "<%=Session("SESSION_LANG")%>";
    g_company_pk = "<%=Session("COMPANY_PK")%>";
    g_user_pk = "<%=Session("USER_PK")%>";

    System.Translate(document);
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
	var ls_current     = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
	var ls_date        = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
	var ls_Book_ccy    = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACBG0040','04','') FROM DUAL")%>";
	var ls_date1        = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL")%>";
	var ls_Type = "DATA|PAY|Payable|PAID|Payment";
	var ls_Report_Type = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACBK047') FROM DUAL ")%>";	
    	
    lstCompany.SetDataText(ls_data);
    lstCompany.value = g_company_pk ;
    dtPay_duefr.SetDataText(ls_date_fr);
    lstBook_ccy.SetDataText(ls_Book_ccy);
    txtLang.SetDataText(lang);
    lstType.SetDataText(ls_Type);
    lstType.value = "PAY";
    lstReport_Type.SetDataText(ls_Report_Type);
    
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
//    var fg  = grid.GetGridControl();
//        
//    if (lstBook_ccy.GetData() == 'VND')
//    {
//        fg.ColFormat(12)    = "#,###,###,###,###,###,###,###,###.##R";
//        fg.ColFormat(14)    = "#,###,###,###,###,###,###,###,###.##R";
//        fg.ColFormat(16)    = "#,###,###,###,###,###,###,###,###.##R";
//        fg.ColFormat(13)    = "#,###,###,###,###,###,###,###,###,###R";
//        fg.ColFormat(15)    = "#,###,###,###,###,###,###,###,###,###R";
//        fg.ColFormat(17)    = "#,###,###,###,###,###,###,###,###,###R";
//    }
//    else
//    {
//        fg.ColFormat(12)    = "#,###,###,###,###,###,###,###,###,###R";
//        fg.ColFormat(14)    = "#,###,###,###,###,###,###,###,###,###R";
//        fg.ColFormat(16)    = "#,###,###,###,###,###,###,###,###,###R";
//        fg.ColFormat(13)    = "#,###,###,###,###,###,###,###,###.##R";
//        fg.ColFormat(15)    = "#,###,###,###,###,###,###,###,###.##R";
//        fg.ColFormat(17)    = "#,###,###,###,###,###,###,###,###.##R";
//    }
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
    var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx?com_pk=' + lstCompany.GetData();
	var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
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
    if(lstReport_Type.value=='AS')
    {
        var  url= System.RootURL + "/standard/reports/60/09/rpt_60090190.aspx?p_com_pk="+lstCompany.value+"&p_date_fr="+dtPay_duefr.value
        +"&p_date_to="+dtPay_dueto.value+"&p_tco_buspartner_pk="+txtcust_pk.text+"&p_tac_abacctcode_pk="+txtac_pk.text
        +"&p_tac_abplcenter_pk="+txtpl_pk.text+"&p_seq="+txtseq.text
        +"&p_voucher="+txtvoucher_no.text+"&p_invoice_no="+txtinvoice.text+"&p_type="+lstType.value
        +"&p_Trans_Amt="+txtTrAmt.text+'&p_Partner_Cd='+txtcust_cd.text+'&p_Partner_Nm='+txtcust_nm.text+'&p_Acc_Cd='+txtac_cd.text+'&p_Acc_Nm='+txtac_nm.text;
        System.OpenTargetPage( url, "_blank" );
    }
	else if(lstReport_Type.value=="01")
	{
        var  url= System.RootURL + "/standard/reports/60/09/rpt_60090190_AgedPay_Over_DueDate.aspx?p_com_pk="+lstCompany.value+"&p_from_date="+dtPay_duefr.value
        +"&p_to_date="+dtPay_dueto.value+"&p_tco_buspartner_pk="+txtcust_pk.text+"&p_acc_pk="+txtac_pk.text ;
        System.OpenTargetPage( url, "_blank" );	
	}	
	else if(lstReport_Type.value=="02")
	{
        var  url= System.RootURL + "/standard/reports/60/09/rpt_60090190_AgingPayment.aspx?p_com_pk="+lstCompany.value+"&p_from_date="+dtPay_duefr.value
        +"&p_to_date="+dtPay_dueto.value+"&p_tco_buspartner_pk="+txtcust_pk.text+"&p_acc_pk="+txtac_pk.text ;
        System.OpenTargetPage( url, "_blank" );	
	}	

}

function Popup_PL()
{
    var path = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?dsqlid=ac_sel_pl_popup_plpk&company=" + lstCompany.value + "&col_code=PL Code&col_nm=PL Name" ;
    var object = System.OpenModal(path , 600 , 500 , 'resizable:yes;status:yes'); 
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
  
   var fpath =System.RootURL + "/standard/forms/60/08/60080050_popup_Acc.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=AC_SEL_ACCT_POPUP";
	o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;')
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
    var lcol = event.col;
    var lrow = event.row ;
    if(lrow < 1)
        return ;
    if(lstType.value == "PAY")
    {
        var pk = grid.GetGridData(lrow, 1 ); // Seq
        var status = grid.GetGridData(lrow, 17 ); //Status

        var fpath = System.RootURL + '/standard/forms/60/09/60090190_popup.aspx?PK_ROW=' + pk + '&APPRCANCEL=' + status;
        var wWidth = 950;
        var wHeight = 565;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
        "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
        "lef="+ x +",top=" + y;

        var object = System.OpenModal(fpath, wWidth, wHeight, features);                        
    }           
    else if( lstType.value == "PAID")
    {
        var pk = grid.GetGridData(lrow, 8 ); // Seq
        var status = grid.GetGridData(lrow, 17 ); //Status

        var fpath = System.RootURL + '/standard/forms/60/09/60090190_popup.aspx?PK_ROW=' + pk + '&APPRCANCEL=' + status;
        var wWidth = 950;
        var wHeight = 565;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
        "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
        "lef="+ x +",top=" + y;

        var object = System.OpenModal(fpath, wWidth, wHeight, features);                            
    }
}

function SetTotal()
{
    if (grid.rows > 1)
    {
        var ctrl = grid.GetGridControl();
	    var i = ctrl.rows - 1;
	    //lblRecord.SetDataText(i);
    }
    else
    {
        //lblRecord.SetDataText(0);
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
//----------------------------------------------------------------------------
function OnDataReceive(iObj)
{
    if(iObj.id=='dso_getCompany')
    {
        
    }
    else if(iObj.id=='dso_sel_ap_balance')
    {
        var ctrl = grid.GetGridControl();
        ctrl.ColFormat(4) = "###,###,###,###.##R";
        ctrl.ColFormat(5) = "###,###,###,###.##R";
        ctrl.ColFormat(11) = "###,###,###,###.##R";
        ctrl.ColFormat(12) = "###,###,###,###.##R";    
        
        var i, v_tot_pay_famt = 0, v_tot_pay_amt = 0, v_tot_tr_famt = 0, v_tot_tr_amt = 0;
        for( i = 1; i < grid.rows; i++)
        {
            v_tot_tr_famt += Number(grid.GetGridData(i, 4));
            v_tot_tr_amt += Number(grid.GetGridData(i, 5));
            v_tot_pay_famt += Number(grid.GetGridData(i, 11));
            v_tot_pay_amt += Number(grid.GetGridData(i, 12));
            if(Number(grid.GetGridData(i, 8)) > 0)
            {
                grid.SetCellBgColor( i, 8, i, grid.cols-1,0xA9EBD7);        
            }
        }    
        grid.AddRow();
        grid.SetCellBgColor(grid.rows-1, 0, grid.rows-1, grid.cols-1,0xA9EBD7);
        grid.SetGridText(grid.rows - 1, 4, v_tot_tr_famt);
        grid.SetGridText(grid.rows - 1, 5, v_tot_tr_amt);        
        grid.SetGridText(grid.rows - 1, 11, v_tot_pay_famt);
        grid.SetGridText(grid.rows - 1, 12, v_tot_pay_amt);
        grid.SetCellBold(grid.rows-1, 0, grid.rows-1, grid.cols-1,true);
    }
}
//----------------------------------------------------------------------------
</script>
<body style="margin:0; padding:0;">

    <gw:data id="dso_sel_ap_balance" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_SEL_60090190">
                <input bind="grid">
                    <input bind="lstCompany"/>
                     <input bind="dtPay_duefr"/>
                     <input bind="dtPay_dueto"/>
                     <input bind="txtcust_pk"/>                     
                     <input bind="txtpl_pk"/>
                     <input bind="txtac_pk"/>
                     <input bind="txtseq"/>
                     <input bind="txtvoucher_no"/>
                     <input bind="txtinvoice"/>
                     <input bind="lstType"/>
                     <input bind="txtTrAmt"/>
                </input>
                <output bind="grid"/>
            </dso>
        </xml>
    </gw:data>

<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_company" > 
                <input> 
                     <input bind="txtUserPK"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>    
<table style="width:100%;height:100%" cellpadding="0" cellspacing="0">
<tr style="height:6%">
    <td width="100%">
        <fieldset style="padding:0">
	        <table width="100%" cellpadding="1" cellspacing="1" border="0">                                                                                                                                                                                                                         <tr>
                <tr>
                    <td align="right" width="10%">Company</td>
                    <td colspan="3" width="20%"><gw:list id="lstCompany" onChange="" styles='width:100%'></gw:list></td>
                    <td align="right" width="15%"><a title="Click here to select Customer" onclick="Popup_Cust()" href="#tips">Partner</td>
                    <td colspan="" width="28%">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="35%"><gw:textbox id="txtcust_cd" styles='width:100%'/></td>
                            <td width="65%"><gw:textbox id="txtcust_nm" styles='width:100%'/></td>
                            <td width=""><gw:textbox  id="txtcust_pk" styles='display:none'/></td>
                            <td width=""><gw:imgBtn   img="reset"	id="idResetTr"  alt="Reset" onclick="Reset_Cust()"/></td>
                        </tr>
                        </table>
                    </td>
                    <td align="right" width="10%">SEQ</td>
                    <td width="10%"><gw:textbox id="txtseq" styles="width:100%" onenterkey="OnSearch()" onkeypress="CheckNumeric()"/></td>
           			<td >
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width=""><gw:imgbtn id="btnSearch"    img="search" alt="Search"  styles='width:100%' onclick="OnSearch()"/></td>
                                <td width=""><gw:imgbtn id="btnPrint"     img="excel" alt="Print"      style='width:100%; display:;' onclick="OnPrint()"/></td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right">Trans Date</td>
                    <td><gw:datebox id="dtPay_duefr" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtPay_dueto" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="right"><a title="Click here to select Account" onclick="Popup_Acc()" href="#tips">Account</td>
                    <td >
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="35%"><gw:textbox id="txtac_cd" styles='width:100%'/></td>
                            <td width="65%"><gw:textbox id="txtac_nm" styles='width:100%'/></td>
                            <td width=""><gw:textbox  id="txtac_pk" styles='display:none'/></td>
                            <td width=""><gw:imgBtn   img="reset"	id="idResetAcc"  alt="Reset" onclick="Reset_Acc()"/></td>
                        </tr>
                        </table>
                    </td>
                    <td align="right">Voucher No</td>
                    <td colspan='2'><gw:textbox id="txtvoucher_no" styles="width:100%" onenterkey="OnSearch()"/></td>
                    
                </tr>
                <tr>
                    <td align="right">Type</td>
                    <td colspan="3"><gw:list id="lstType" onChange="OnSearch()" value ="" styles='width:100%'></gw:list></td>
                    <td align="right"><a title="Click here to select Profit & Loss(PL)" onclick="Popup_PL()" href="#tips">Profit & Loss(PL)</td>
                    <td >
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="35%"><gw:textbox id="txtpl_cd" styles='width:100%'/></td>
                            <td width="65%"><gw:textbox id="txtpl_nm" styles='width:100%'/></td>
                            <td width=""><gw:textbox  id="txtpl_pk" styles='display:none'/></td>
                            <td width=""><gw:imgBtn   img="reset"	id="idResetPL"  alt="Reset" onclick="Reset_PL()"/></td>
                        </tr>
                        </table>
                    </td>
			        <td align="right">Invoice No</td>
			        <td colspan="2"><gw:textbox id="txtinvoice" styles="width:100%" onenterkey="OnSearch()"/></td>                
                </tr>
                <tr>
                    <td align="right" width="">Trans Amount</td> 
			        <td colspan="3"><gw:textbox id="txtTrAmt" styles="width:100%" onenterkey="OnSearch()"/></td> 
                    <td align="right">Report Type</td>
                    <td colspan='4'><gw:list id="lstReport_Type" onChange="" value ="" styles='width:100%'></gw:list></td>
                </tr>
            </table>
        </fieldset>
    </td>
</tr>
<tr style="height:94%">
    <td width="100%">
    <!--header  ='0.Row|1.Seq|2.Voucher No|3.Trans Date|4.Trans Amt|5.Book Amt|6.Seq|7.Voucher No|8.Pay Date|9.Trans Amt|10.Book Amt|11.Partner Code|12.Partner Name|13.Description|14.Local Description'-->
        <gw:grid   
		    id="grid"		    
		    header  ='Row|Seq|Voucher No|Trans Date|Trans Amt|Book Amt|Acc. Code|Acc. Name|Seq|Voucher No|Pay Date|Trans Amt|Book Amt|Partner Code|Partner Name|Description|Local Description|_Status'
		    format  ='0|0|0|4|0|0|0|0|0|0|4|0|0|0|0|1|0|0'
		    aligns  ='1|1|1|0|3|3|1|2|0|1|1|3|3|1|1|3|3|1'
		    defaults='|||||||||||||||||'
		    editcol ='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'  
		    widths  ='500|800|1500|1200|2000|2000|1200|2400|1000|1500|1200|1800|1800|1500|1800|1800|1800|0'  
		    styles  ='width:100%; height:100%'
		    acceptNullDate="T"
		    sorting ='T' 
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