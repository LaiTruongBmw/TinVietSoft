<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>AP Register History</title>
    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">

function BodyInit()
{
    System.Translate(document);
    BindingDataList();
}

function BindingDataList()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    
    var ls_date_fr  = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
    var ls_Book_ccy = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACBG0040','04','') FROM DUAL")%>";
    var ls_AP_type  = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('CODC0120','01','') FROM DUAL")%>";
    
    var ls_data4    = "<%=CtlLib.SetListDataSQL("SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B  WHERE A.PK     = B.TAC_COMMCODE_MASTER_PK AND A.ID     = 'ACBG0130' AND A.DEL_IF = 0  AND B.DEL_IF = 0  AND B.USE_YN ='Y' AND A.TCO_COMPANY_PK="+ Session("COMPANY_PK") +"  ORDER BY CODE, B.CODE_NM")%>";
    
    lstBook_ccy.SetDataText(ls_Book_ccy);
    lstCompany.SetDataText(ls_data);
    lstVoucherType.SetDataText(ls_data4);
	//lstVoucherType.value="AP";
    //lstVoucherType.SetDataText(ls_data4);
    txtAP_Type.SetDataText('DO');
    lstAPType.SetDataText(ls_AP_type);
    
    txtvennm.SetEnable(false);
    grdMst.GetGridControl().FrozenCols = 9;
    txtseq.GetControl().focus();
    dtTrDatefr.SetDataText(ls_date_fr);
    
    <%=CtlLib.SetGridColumnComboFormat("grdMst", 2,"SELECT TRIM(A.CODE), A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACBG0130' AND A.USE_IF = 1")%>;
    <%=CtlLib.SetGridColumnComboFormat("grdMst", 9,"SELECT A.CODE, A.CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
    <%=CtlLib.SetGridColumnComboFormat("grdMst",16,"SELECT A.CODE, A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACCR0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
    
    SetNumGrid();
    //SetFormatGrid();
    //ibtnPopup.SetEnable(false);
    
    txtUserPk.text="<%=Session("USER_PK")%>";
    txtDeptPK.text="<%=Session("DEPT_PK")%>";
    ls_trsdate      = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY') FROM DUAL")%>";
    txt_date.text   = ls_trsdate;
    dso_getCompany.Call();
}

function SetFormatGrid()
{
    var tempGrid1 = grdMst.GetGridControl();
    tempGrid1.FixedRows = 1;
    tempGrid1.MergeCells =5;
    tempGrid1.MergeRow(0) = true;
    //tempGrid1.Cell(0, 0, 3, 0, 5)   = "Voucher No";
    //tempGrid1.Cell(0, 0, 7, 0, 8)   = "Trans Date";
    //tempGrid1.Cell(0, 0, 11, 0, 12) = "Invoice Date";
    //tempGrid1.AllowUserResizing     = 0;
    //tempGrid1.AutoResize = true;
}


function Popup_Acc()
{
    var fpath = System.RootURL + "/standard/forms/60/09/60090020_account_popup.aspx?comm_nm=" + "" + "&comm_code=" + "210101" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.value + "&dsqlid=ac_sel_60090010_acn_ap_popup";
    o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;'); 
    if (o != null)
    {
        if(o[0] != 0)
        {
            grdMst.SetGridText(txt_row.text, 24, o[3]);
            grdMst.SetGridText(txt_row.text, 25, o[0]);
            grdMst.SetGridText(txt_row.text, 26, o[1]);
        }
    }
}

function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
	var x = c.toUpperCase().charCodeAt(0);
	event.keyCode = x;
}

function SetNumGrid()
{
    /*
    var fg = grdMst.GetGridControl();
    fg.ColFormat(10) = "#,###,###,###,###,###,###,###,###R";
    fg.ColFormat(14) = "#,###,###,###,###,###,###,###,###.##R";
    fg.ColFormat(15) = "#,###,###,###,###,###,###,###,###R";
    fg.ColFormat(17) = "#,###,###,###,###,###,###,###,###.##R";
    fg.ColFormat(18) = "#,###,###,###,###,###,###,###,###R";
    */
    var fg = grdMst.GetGridControl();
    fg.ColFormat(11) = "#,###,###,###,###,###,###,###,###R";
    fg.ColFormat(17) = "#,###,###,###,###,###,###,###,###.##R";
    fg.ColFormat(20) = "#,###,###,###,###,###,###,###,###.##R";
    
    if (lstBook_ccy.GetData() == 'VND')
    {
        fg.ColFormat(18) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(21) = "#,###,###,###,###,###,###,###,###R";
    }
    else
    {
        fg.ColFormat(18) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(21) = "#,###,###,###,###,###,###,###,###.##R";
    }    
}

function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise,
}

function SetLabel(p_data)
{
    switch (p_data)
    {
        case '1':
          lblStatus.text = 'Save';
          break;
        case '0':
          lblStatus.text = 'Approve';
          break;
        case '2':
          lblStatus.text = 'Comfirm';
          break;
        case '3':
          lblStatus.text = 'Cancel';
          break;
    }
}

function onSearch()
{
    rowclick        = 0;
    lblStatus.text  = '';
    dso_upd_grd_mst_ap_domestic.Call('SELECT');
}

function Check_Button()
{
    if (grdMst.rows < 2)
    {
        ibtnPopup.SetEnable(false);
    }
    else
    {
        var ls_seq = grdMst.GetGridData(grdMst.selrow, 6);
        if ( ls_seq != '')
        {
            ibtnPopup.SetEnable(true);
        }
        else
        {
            ibtnPopup.SetEnable(false);
        }
    }
}


function OnReportAcct()
{
    if (txtseq.text !='')
    {
        alert("Not yet :)");
    }
}

function OnReportRV()
{
    var url = System.RootURL + "/standard/reports/gf/da/gfda00060.aspx?com_pk=" + lstCompany.value + "&from_date=" + dtTrDatefr.value + "&to_date=" + dtTrDateto.value + "&voucher_type=" + lstVoucherType.value + "&status=" + rbstatus.value + "&voucher_no=" + txtvoucher_no.text ;
    url += "&serial_no=" + txtserial.text + "&seq=" + txtseq.text + "&invoice_no=" + txtinvoiceno.text + "&vendor_pk=" + txtvenpk.text + "&origin=" + lstAPType.value;	
    System.OpenTargetPage(url);        
}
function OnChangeRb()
{
    var ls_status;
    if (rbstatus.GetData() == '')
    {
        ls_status = 0
    }
    else
    {
        ls_status = rbstatus.GetData();
    }
    onSearch();
}

function DBPopupClick()
{
    var ls_transdate    =   grdMst.GetGridData(grdMst.selrow, 7);
    var ls_invoicedate  =   grdMst.GetGridData(grdMst.selrow, 11);
    var ls_invoiceno    =   grdMst.GetGridData(grdMst.selrow, 12);
    var ls_seq          =   grdMst.GetGridData(grdMst.selrow, 6);
    var ls_voucher_type =   grdMst.GetGridData(grdMst.selrow, 2);
    var ls_compk        =   lstCompany.GetData();
    var ls_voucher_no   =   grdMst.GetGridData(grdMst.selrow, 5);
    var ls_status       =   rbstatus.GetData();
    var ls_pk           =   grdMst.GetGridData(grdMst.selrow, 0);
    if (lstAPType.GetData() == 'DO')
    {
        var fpath   = System.RootURL + '/standard/forms/60/09/60090040_popup_DO.aspx?transdate=' + ls_transdate + '&invoicedate=' + ls_invoicedate + '&invoiceno='+ ls_invoiceno + '&seq='+ ls_seq + '&voucher_type='+ ls_voucher_type + '&compk='+ ls_compk + '&voucher_no='+ ls_voucher_no + '&status=' + ls_status + '&pk=' + ls_pk;
    }
    else
    {
        var fpath   = System.RootURL + '/standard/forms/60/09/60090040_popup_OS.aspx?transdate=' + ls_transdate + '&invoicedate=' + ls_invoicedate + '&invoiceno='+ ls_invoiceno + '&seq='+ ls_seq + '&voucher_type='+ ls_voucher_type + '&compk='+ ls_compk + '&voucher_no='+ ls_voucher_no + '&status=' + ls_status + '&pk=' + ls_pk;;
    }
    var wWidth  = 950;
	var wHeight = 450;
	var x = Math.round((screen.availWidth - wWidth)/2);
	var y = Math.round((screen.availHeight - wHeight)/2);
		
	var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
	   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
	   "lef="+ x +",top=" + y;
	
	var object = System.OpenModal(fpath, wWidth, wHeight, features);
}

function onSearchCust(iObj)
{
    if(iObj == 'SearchVendor')
    {
	    var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx?AP=Y';
	    var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
	    if ( object != null )
	    {
	        if (object[0] != 0)
            {
                txtvenpk.text = object[0];
                txtvenid.text = object[1];
                txtvennm.text = object[2];
            }
        }
    }    
}
function ResetCust()
{
	txtvenpk.text = "";
	txtvenid.text = "";
	txtvennm.text = "";
}
function OnDataReceive(iObj)
{
    if(iObj.id == 'dso_upd_grd_mst_ap_domestic')
    {
	    var i ;
	    var l_tot_net_tr_amt = 0, l_tot_net_bk_amt = 0, l_tot_vat_tr_amt = 0, l_tot_vat_bk_amt = 0 ;
	    if(iObj.id == "dso_upd_grd_mst_ap_domestic")	
	    {
		    for(i = 1; i < grdMst.rows; i++)
		    {
			    l_tot_net_tr_amt += Number(grdMst.GetGridData(i, 16));
			    l_tot_net_bk_amt += Number(grdMst.GetGridData(i, 17));
			    l_tot_vat_tr_amt += Number(grdMst.GetGridData(i, 20));
			    l_tot_vat_bk_amt += Number(grdMst.GetGridData(i, 21));
		    }		
		    grdMst.AddRow();
		    grdMst.SetCellBgColor(grdMst.rows-1, 0,grdMst.rows-1,grdMst.cols-1,0xA9EBD7);
		    grdMst.SetGridText(grdMst.rows - 1, 16, l_tot_net_tr_amt);
		    grdMst.SetGridText(grdMst.rows - 1, 17, l_tot_net_bk_amt);
		    grdMst.SetGridText(grdMst.rows - 1, 20, l_tot_vat_tr_amt);
		    grdMst.SetGridText(grdMst.rows - 1, 21, l_tot_vat_bk_amt);
		    grdMst.SetGridText(grdMst.rows - 1, 2, '');
	    }
    }	    
    else if(dso_getCompany)
    {
    
    }
}
</script>

<body style="margin:0; padding:0;">
<!------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_upd_grd_mst_ap_domestic" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60090040_mst_ap">
                <input bind="grdMst">
                    <input bind="lstCompany"/>
                    <input bind="dtTrDatefr"/>
                    <input bind="dtTrDateto"/>
                    <input bind="lstVoucherType"/>
                    <input bind="txtvoucher_no"/>
                    <input bind="txtseq"/>
                    <input bind="txtserial"/>
                    <input bind="txtinvoiceno"/>
                    <input bind="txtvenpk"/>
                    <input bind="rbstatus"/>
                    <input bind="lstAPType"/>
                </input>
                <output bind="grdMst"/>
            </dso>
        </xml>
    </gw:data>
<!------------------------------------------------------------------------------------------------------->
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60090040" > 
                <input> 
                     <input bind="txtUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!------------------------------------------------------------------------------------------------------->    
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td>
		<table width="100%"  border="1" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="10%"></td>
                    <td width="7%"></td>
                    <td width="16%"></td>
                    <td width="7%"></td>
                    <td width="6%"></td>
                    <td width="10%"></td>
                    <td width="2%"></td>
                    <td width="13%"></td>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="2%"></td>
                    <td width="2%"></td>
                    <td width="2%"></td>
                    <td width="2%"></td>
                    <td width="2%"></td>
                    <td width="4%"></td>
                    <td width="4%"></td>
                </tr>
                <tr>
                    <td align="right">Company&nbsp;</td>
                    <td>
					    <gw:list id="lstCompany" styles='width:100%' onChange="onSearch()"></gw:list>
				    </td>
				    <td align="center">Voucher Type&nbsp;</td>
                    <td colspan="2"><gw:list id="lstVoucherType" onChange="OnChangeList()" styles="width:100%"></gw:list></td>
				    <td align="right">Voucher No&nbsp;</td>
					<td colspan="2"><gw:textbox id="txtvoucher_no" styles="width:100%" onenterkey="onSearch()"/></td>
					<td align="right" >Seq&nbsp;</td>
                    <td colspan="2"><gw:textbox id="txtseq" styles="width:100%" onenterkey="onSearch()" onkeypress="CheckNumeric()"/></td>
				    <td colspan="7">
				        <table width="100%" border="0" cellspacing="0" cellpadding="0">
				            <tr>
				                <td width="80%"></td>
				                <td ><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"        onclick="onSearch()"/></td>
				                <td ><gw:imgBtn id="ibtnReport" img="printer"   alt="Print Acct"    onclick="OnReportRV" /></td>
					            <td ><gw:imgBtn id="btnReport1" img="printer"   alt="Print RV" style="display:none; "     onclick="OnReportAcct()" /></td>
				            </tr>
				        </table>
				    </td>
				</tr>				
                <tr>
                    <td align="right">Trans Date&nbsp;</td>
                    <td><gw:datebox id="dtTrDatefr" lang="1" /></td>
                    <td align="center">~</td>
                    <td colspan="2"><gw:datebox id="dtTrDateto" styles="width:100%" lang="1" /></td>
                    <td align="right">Serial No&nbsp;</td>
                    <td colspan="2"><gw:textbox id="txtserial" styles="width:100%" onenterkey="onSearch()"/></td>
				    <td align="right">Invoice No&nbsp;</td>
                    <td colspan="2"><gw:textbox id="txtinvoiceno" styles="width:100%" onenterkey="onSearch()"/></td>
                    <td align="right">Origin&nbsp;</td>
                    <td colspan="5"><gw:list id="lstAPType" onChange="" styles="width:100%"></gw:list></td>
                </tr>
                <tr>
                    <td align="right">Status&nbsp;</td>
			        <td colspan="4" align="left"><gw:radio id="rbstatus" value="1" onchange="OnChangeRb()"> 
					        <span value=" ">All</span>
					        <span value="1">Saved</span>
					        <span value="2">Confirmed</span>
					        <span value="0">Approved</span>
					        <span value="3">Cancel</span>
                            </gw:radio>
                    </td>
                    <td align="right">Vendor&nbsp;</td>
                    <td colspan="5">
                        <table border="0" cellpadding= "0" cellspacing= "0" width="100%">
                        <tr>
                            <td><gw:textbox id="txtvenpk" styles="Display:none"/></td>
                            <td width="30%"><gw:textbox id="txtvenid" styles="width:100%"/></td>
                            <td width="70%"><gw:textbox id="txtvennm" styles="width:100%"/></td>
                            <td align="left"><gw:imgBtn id="btnPopupven"   img="popup"     alt="Get Vendor"     onclick="onSearchCust('SearchVendor')"/></td>
                            <td align="left"><gw:imgBtn id="btnResetven"   img="reset"     alt="Reset"          onclick="ResetCust()"/></td>
                        </tr>
                        </table>
                    </td>
                    <td align="right">Status&nbsp;</td>
                    <td align="center" colspan ="2"><gw:label id="lblStatus" text="" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td>
                </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td width="100%" id="td1">
                <table border=0 width="100%" cellpadding=0 cellspacing=0 >
                <tr>
                    <td>
                        <gw:grid
                            id="grdMst"  
                            header  ="_Pk||Voucher Type|||Voucher No|SEQ|Trans Date||Ccy|Rate|Partner ID|Partner Name|Serial No|Invoice Date||Invoice No|Amount Trans|Amount Books|_AP_COST|Tax Rate|VAT Trans|VAT Books|_tr_abtrtypepk|Trs Code|Trs Type|_acpk|Acc.Code|Acc.Name|Decription|Local Description|_Kor Description|_Compk|_Status|_PO|_UserPK|_DeptPK|_AP_Type|_BooksRate|Declaration No|Declaration Date"
                            format  ="0|3|0|3|0|0|0|0|4|2|0|0|0|0|0|4|0|0|0|3|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4"
                            aligns  ="0|1|1|1|1|1|1|1|0|1|1|0|0|0|0|0|1|3|3|0|1|3|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                            editcol ="0|1|1|0|0|1|0|1|0|1|1|1|0|1|1|0|1|0|1|1|1|0|0|0|0|0|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0"
                            widths  ="0|250|1400|250|500|1900|1000|1500|250|500|700|1500|1300|2000|250|1500|1800|1800|0|1000|1500|1500|0|1500|2500|0|1500|2500|2500|2500|0|0|0|0|0|0|0|0|1600|1600"
                            styles  ="width:100%; height:665"
                            sorting ="T"
							autosize="T"
                            acceptNullDate  = "T"
                            oncelldblclick  = "DBPopupClick()"
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

<!------------------------------------------Textbox ẩn ----------------------------------------------->

<gw:textbox id="txtStatus"           style="display:none" />

<gw:textbox id="txtacpk"             style="display:none" />
<gw:textbox id="txt_rowclick"        style="display:none" />
<gw:textbox id="txt_count"           style="display:none" />
<gw:textbox id="txtcur"              style="display:none" />
<gw:textbox id="txtrate"             style="display:none" />
<gw:textbox id="txt_row"             style="display:none" />

<gw:textbox id="txt_date"            style="display:none" />
<gw:textbox id="txt_pk"              style="display:none" />

<gw:textbox id="txtseq_str"          style="display:none" />
<gw:textbox id="txtindex"            style="display:none" />

<gw:textbox id="txtUserPk"           style="display:none" />
<gw:textbox id="txtDeptPK"           style="display:none" />

<gw:textbox id="txtAP_Type"          style="display:none" />

<gw:list    id="lstBook_ccy" 		 style="width:50%;display:none"></gw:list >
<gw:textbox id="txtBookRate"         style="display:none" />

<!---------------------------------------------------------------------------------------------------->
</body>
</html>