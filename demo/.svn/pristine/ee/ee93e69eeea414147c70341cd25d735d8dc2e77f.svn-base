<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Receivable List Check</title>
  </head>
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
 
<script>

var g_company_pk = '';
var click_tab0   = true;
var click_tab1   = true;
var click_tab2   = true;
g_company_pk = <%=Session("COMPANY_PK") %> ;
function BodyInit()
{
    System.Translate(document);
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
    ls_date_fr = dtPay_duefr.value;
    ls_date_fr = ls_date_fr.substr(0, 4) + '01' + '01'; 
	var ls_Type        = "<%=CtlLib.SetListDataFUNC("SELECT AC_GET_COMMONCODE('EACAB002') FROM DUAL")%>";
	
	var ls_date        = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL")%>";
	var ls_Book_ccy    = "<%=CtlLib.SetListDataSQL("select a.code, a.code code_nm from tac_commcode_detail a, tac_commcode_master b where a.del_if = 0 and b.del_if = 0 and a.tac_commcode_master_pk = b.pk and b.id = 'ACBG0040' and a.def_yn = 'Y'")%>";
	
	lstBook_ccy.SetDataText(ls_Book_ccy);
	txt_date.SetDataText(ls_date);
	lstType.SetDataText(ls_Type);
    lstCompany.SetDataText(ls_data);	
    lstCompany.value = g_company_pk ;
    dtPay_duefr.SetDataText(ls_date_fr);
    dtPay_fr.SetDataText(ls_date_fr);
    
    txtcust_nm.SetEnable(false);
    txtpl_nm.SetEnable(false);
    
    lblRecord.SetDataText("0");
    txtchk.SetDataText("0");
    txttab.text = 0;
    SetGridData();
    Control_Menu();    
    txtPONo.GetControl().focus();
	txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	dso_getCompany.Call();	
}

function SetGridData()
{
    var fg  = grid_amount.GetGridControl();    
    
    
//    fg.ColFormat(15)    = "#,###,###,###,###,###,###,###,###,###R";
//    fg.ColFormat(16)    = "#,###,###,###,###,###,###,###,###.##R";
//	if(lstBook_ccy.value == "VND")
//	    fg.ColFormat(17)    = "#,###,###,###,###,###,###,###,###,###R";
//	else
//		fg.ColFormat(17)    = "#,###,###,###,###,###,###,###,###.##R";	
	
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

function OnChkAll()
{
    if (grid_amount.rows > 1)
    {
        if (txtchk.GetData() == 0)
        {
            btnChk.text="UnChk";
            txtchk.SetDataText("1");
            for (i = 1; i< grid_amount.rows; i++)
            {
                grid_amount.SetGridText(i, 0, -1);
            }
        }
        else
        {
            btnChk.text="ChkAll";
            txtchk.SetDataText("0");
            for (i = 1; i< grid_amount.rows; i++)
            {
                grid_amount.SetGridText(i, 0, 0);
            }
        }
    }
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
	std_dt = dtPay_fr.GetData();
	etd_dt = dtPay_to.GetData();
	if (parseInt(etd_dt) < parseInt(std_dt))
	{
		alert(' End Pay Date can’t be earlier than start date!!!'+'\n'+'Ngày kết thúc không thể nhỏ hơn ngày bắt đầu!!!');
		return false;
	}
	if (txttab.GetData() == 2)
	{
	    if (txtseq.GetData() == '')
        {
            alert('    You must input SEQ to divide!!!'+'\n'+'Bạn hãy nhập số SEQ để phân ra!!!');
            return false;
        }
	}
	return true;
}

function OnSearch()
{
//--------------------------------------------
    grid_amount.ClearData();
    OnCheckTab();
    if (OnCheck())
    {
        if (txttab.GetData() == 0)
        {
            dso_sel_grd_payable_amount.Call('SELECT');
        }
        else if (txttab.GetData() == 1)
        {
            dso_sel_grd_payable_payment.Call('SELECT');
        }
        else if (txttab.GetData() == 2)
        {
            if (txtseq.GetData() != '')
            {
                dso_sel_grd_payable_invoice.Call('SELECT');
            }
        }
    }
}

function OnCheckTab()
{
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

function Control_Menu()
{
    lblRecord.SetDataText(grid_amount.rows - 1);
    OnFormatGrid();
}

function onSearchTab()
{
    OnSearch();
    Control_Menu();
}

function OnChangeStatus()
{
    if (rbstatus.GetData() == 1)
    {
        lblDate.text = 'Trans Date';
    }
    else
    {
        lblDate.text = 'Pay Date';
    }
}

function OnConfirm()
{
    txtseq_str.text = "";
    txtindex.text   = "";
    var data;
	data = "";
	var ctrl 	= grid_amount.GetGridControl();
	var rows 	= ctrl.Rows;
	var index;
	index  = 0;
	
	for (i=1; i<ctrl.Rows; i++)
	{
		var tmp = grid_amount.GetGridData(i, 0);
		if (tmp == "-1")
		{
			data  = grid_amount.GetGridData(i, 16)+ "," + data ;
			index = index + 1 ;
		}
	}
	if(index == 0)
	{
		alert('Please select check SEQ for confirm!!!'+'\n'+'  Bạn hãy chọn số SEQ để Confirm!!!')
		return;
	}
	else
	{
		if(confirm('Are you sure you want to confirm?'+'\n'+'Bạn có chắc Confirm số SEQ này?'))
		{	        
	        txtseq_str.text = data;
	        txtindex.text   = index;
	        dso_upd_confirm_cancel.Call();	
        }
    }
}

function OnPrint()
{
    alert("Not Yet");
    return;
}

function Popup_PL()
{
    var fpath = System.RootURL + "/standard/forms/60/09/60090010_CtrItem2.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=AC_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
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

function OnPopupSlipEntry()
{
    var ctrl 	= grid_amount.GetGridControl();
	var rows    = ctrl.Rows
	rows = rows - 1;
	var rownum  	= ctrl.Row;
	var colnum  	= ctrl.Col;
	if (rownum > 0)		 
	{
		if (event.col > 0)
		{
			var pk      = grid_amount.GetGridData(ctrl.row, 1);
			var status  = 0;
			var ls_arr = "";
			for (i = 1; i < grid_amount.rows; i++)
			{
			    ls_arr = ls_arr + ' ' + grid_amount.GetGridData(i, 1);
			}
			
			var fpath   = System.RootURL + '/standard/forms/60/09/60090030_popup.aspx?PK_ROW=' + pk + '&ROW=' + ctrl.row + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
			var wWidth  = 950;
			var wHeight = 580;
			var x = Math.round((screen.availWidth - wWidth)/2);
			var y = Math.round((screen.availHeight - wHeight)/2);
			
			var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
			   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
			   "lef="+ x +",top=" + y;
			
			var object = System.OpenModal(fpath, wWidth, wHeight, features);
	    }
    }
}

function FormatCalculate(ccy, pnum)
{
	var rValue =0 ;
	if(ccy == "VND")
	{
		rValue = Math.round(Number(pnum));
	}
	else
	{
		rValue = Math.round(Number(pnum) * 100)/100;
	}	
	return rValue;
}

function OnCancel()
{
    var code_data=new Array();
	tmp= new Array();
	tmp[0]       = 0;
	tmp[1]       = 0;
	code_data[0] = tmp;	
	window.returnValue = code_data; 
	this.close();
}

function OnSetBookRate()
{
    if (txtBookRate.GetData() == 0)
    {
        alert('You must type in day ratio: '+ txt_date.GetData() +'\n'+'Bạn hãy nhập tỉ giá ngày: '+ txt_date.GetData());
        return;
    }
}

function Popup_Style()
{
	var i;
    var path = System.RootURL + '/standard/forms/60/11/60110190_popup_get_one_item.aspx' ;
    var aValue = System.OpenModal( path ,950 , 500 ,  'resizable:yes;status:yes') ;	
	if(aValue != null)
	{		
		txtStyleNo.text = aValue[1] ; // item name
		txtStyleNo_PK.text = aValue[0] ; // Item PK			
	}	
}

function OnSave()
{
    var i;
    for(i = 1; i < grid_amount.rows ; i++)
    {
        if(grid_amount.GetGridData(i, 0)=="-1")
        {
            grid_amount.SetRowStatus(i, 0x10);
        }
        else
        {
            grid_amount.SetRowStatus(i, 0);
        }
    }
    dso_sel_grd_payable_amount.Call();
}

function OnCheckAll()
{
    var i;
    if(chkAll.value == 'T')
    {
        for(i = 1; i < grid_amount.rows ; i++)
        {
            grid_amount.SetGridText(i, 0, '-1');
        }
    }        
}

function OnFormatGrid()
{
    var fg = grid_amount.GetGridControl();
    fg.ColFormat(8) = "###,###,###,###.##R";
    if(lstBook_ccy.value =="VND")
        fg.ColFormat(9) = "###,###,###,###,###R";
    else
        fg.ColFormat(9) = "###,###,###,###,###.##R";
}
function OnDataReceive(obj)
	{
		switch(obj)
		{
			case 'dso_getCompany':
			
			break;
		}
	}

</script>
<body style="margin:0; padding:0;">
<!--------------------------------------------------------------------->
    <gw:data id="dso_sel_grd_payable_amount" onreceive="Control_Menu()">
        <xml>
            <dso type="grid" function="AC_SEL_60110040_COLLEC_1" parameter="8,9,15,16,17" procedure="ac_upd_60110040_collec_1">
                <input bind="grid_amount">
                    <input bind="lstCompany"/>
                    <input bind="rbstatus"/>
                    <input bind="txtseq"/>
                    <input bind="dtPay_duefr"/>
                    <input bind="dtPay_dueto"/>
                    <input bind="dtPay_fr"/>
                    <input bind="dtPay_to"/>
                    <input bind="txtcust_pk"/>
                    <input bind="txtvoucher_no"/>
                    <input bind="txtpl_pk"/>
                    <input bind="lstType"/>                    
					<input bind="txtStyleNo"/>
					<input bind="txtCIInv" />
					<input bind="txtPONo" />
					<input bind="txtQuantity" />				
				    <input bind="lstBalOpt" />										    
                </input>
                <output bind="grid_amount"/>
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
<!--------------------------------------------------------------------->    
<table width="100%" cellpadding="0" cellspacing="0" border="1" style="height:100%" >
<tr>
    <td width="100%">
	    <table width="100%" cellpadding="0" cellspacing="0" border="0" height="100%" >
		<tr>
            <td width="100%">
	            <table width="100%" cellpadding="0" cellspacing="0" border="0" height="100%">
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
                <tr style="height:6%">
                    <td align="right">Company</td>
                    <td colspan="3"><gw:list id="lstCompany" onChange="OnSearch()" styles='width:100%'></gw:list></td>
                    <td align="center">Status</td>
                    <td colspan = 3>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td><gw:datebox id="dtPay_Date" onchange="" styles='width:85%' lang="1"/></td>
                            <td align="left"><gw:radio id="rbstatus" value="1" onchange="OnSearch()"> 
					                <span value="1">UnConfirmed</span>
					                <span value="2">Confirmed</span>
                            </gw:radio>
                            </td>
                        </tr>
                        </table>
                    </td>
                    <td align="right">SEQ</td>
                    <td><gw:textbox id="txtseq" styles="width:100%" onenterkey="OnSearch()" onkeypress="CheckNumeric()"/></td>
                    <td colspan = 3>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="80%"></td>
                            <td><gw:imgBtn  id="ibtnSearch" img="search"    alt="Search"        onclick="OnSearch()"/></td>
                            <td><gw:imgBtn  id="ibtnNew"    img="new"       alt="New"           onclick="OnNew()" style="display:none;" /></td>
				            <td><gw:imgBtn  id="ibtnSave"   img="save"      alt="Save"          onclick="OnSave()" /></td>
				            <td><gw:imgBtn  id="ibtnMerge"  img="test"      alt="Merge"         onclick="OnMerge()" style="display:none;" /></td>
				            <td><gw:imgBtn  id="ibtnReport" img="printer"   alt="Print Acct"    onclick="OnPrint()" style="display:none;" /></td>
                        </tr>
                        </table>
                    </td>
                </tr>
                <tr style="height:6%" >
                    <td align="right">Recv Due Date</td>
                    <td><gw:datebox id="dtPay_duefr" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtPay_dueto" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center"><a title="Click here to select Customer" onclick="Popup_Cust()" href="#tips">Customer</td>
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
                    <td align="right">Voucher No</td>
                    <td><gw:textbox id="txtvoucher_no" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch()"/></td>
                    <td align="right">Check All</td>
                    <td align="left"><gw:checkbox id="chkAll" value="F" onchange="OnCheckAll()" /></td>
                </tr>
                <tr style="height:6%" >
                    <td align="right">Recv Date</td>
                    <td><gw:datebox id="dtPay_fr" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtPay_to" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center"><a title="Click here to select Profit & Loss(PL)" onclick="Popup_PL()" href="#tips">Profit & Loss(PL)</td>
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
			        <td align="right">Type</td>
                    <td><gw:list id="lstType" onChange="OnSearch()" value ="" styles='width:100%' /></td>
                    <td colspan = 3>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td align="center"  width="5%">Total</td>
                            <td align="center"  width="5%"><gw:label id="lblRecord" text="" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td> 
					        <td align="left"    width="5%">vouchers</td>
					        <td                 width="5%"><gw:icon id="btnChk"     img="in" text="ChkAll" style='width:100%;display:none;' onclick="OnChkAll()"/></td>
                        </tr>
                        </table>
                    </td>
                </tr>
				<tr style="height:6%" >
					<td align="right"><a title="Click here to select Style No" onclick="Popup_Style()" href="#tips">Style No</a></td>
					<td colspan="3" align="left"><gw:textbox id="txtStyleNo" styles="width:100%" /></td>
					<td colspan="1" align="right">CI Invoice</td>
					<td align="left" colspan="1" ><gw:textbox id="txtCIInv" onkeypress="Upcase()" styles="width:100%; " /></td>
					<td align="right">Quantity</td>
					<td align="left"><gw:textbox id="txtQuantity" styles="width:100%; " /></td>
					<td align="right">PO No</td>
					<td align="left" colspan="1" ><gw:textbox id="txtPONo" styles="width:100%" /></td>					
					<td align="right"></td>
					<td align="right"><gw:list id="lstBalOpt" styles="width:100%" onchange="OnSearch()" >
					    <data>DATA|0|> 0|1|= 0</data>
					</gw:list>
					</td>
				</tr>
                </table>
            </td>
        </tr>
        </table>
    </td>
</tr>

<tr style="height:76%" >
    <td width="100%">
        <table border=0 width="100%" cellpadding=0 cellspacing=0 height="100%" >
        <tr style="height:66%">
            <td>                
                    <table name="Receivable" width ="100%" cellpadding ="0" cellspacing ="0" border="1" height="100%" >
                        <tr>
                            <td width ="100%">
                                <gw:grid   
		                            id="grid_amount"
		                            header  ="Chk|Seq|Voucher No|Trans Date|Account code|Account Name|Cust Code|Cust Name|Trans Amt|Books Amt|Invoice No|Serial No|Invoice Date|Order No|Style Name|_tac_carecv_pk|Received|Remark|_Annex Date|_Annex No"
		                            format  ="3|0|0|4|0|0|0|0|0|0|0|0|4|0|0|0|3|0|4|0"
		                            aligns  ="1|0|0|1|0|0|0|0|3|3|0|0|0|0|0|0|1|0|1|1"
		                            defaults="|||||||||||||||||||"
		                            editcol ="1|0|0|0|0|0|0|0|1|1|0|0|0|0|0|0|1|1|0|0"
		                            widths  ="500|1000|1500|1200|1300|2000|1300|1800|1400|1400|1400|1400|1400|1400|1600|0|800|1500|1200|1000"
		                            styles  ="width:100%; height:100%"
		                            sorting ="T"
		                            acceptNullDate="T"
		                            oncelldblclick=""
		                            />
                            </td>
                        </tr>
                    </table>
    </td>
</tr>
</table>

<gw:textbox id="txtchk"                 style="display:none" />
<gw:textbox id="txttab"                 style="display:none" />
<gw:textbox id="txtseq_str"             style="display:none" />
<gw:textbox id="txtseq1_str"            style="display:none" />

<gw:textbox id="txtindex"               style="display:none" />
<gw:textbox id="txtStatus"              style="display:none" />

<gw:list    id="lstBook_ccy" 		   style="display:none" ></gw:list >
<gw:textbox id="txtBookRate"           style="display:none"  />
<gw:textbox id="txt_date"               style='display:none'/>
<gw:textbox id="txtStyleNo_PK"               style='display:none'/>
<gw:textbox id="txtProposedByUserPk"  styles='display:none' />
</body>
</html>