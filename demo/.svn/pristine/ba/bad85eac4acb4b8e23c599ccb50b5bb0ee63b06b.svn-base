<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>
    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">
var  g_user_pk = "<%=Session("USER_PK")%>" ;
function BodyInit()
{
	System.Translate(document);
    BindingDataList();
    MergeHeader();
	txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	dso_getCompany.Call();
}

function BindingDataList()
{
    var ls_comp         = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_voucher      = "<%=CtlLib.SetListDataSQL("select a.code, a.code_nm from tac_commcode_detail a, tac_commcode_master b where  a.del_if = 0 and    b.del_if = 0 and a.tac_commcode_master_pk = b.pk and b.id = 'ACBG0130' and a.code in ('AR', 'XTP')")%>";
    var ls_tr_type		= "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('CODC0120','01','') FROM DUAL")%>|ALL|ALL";

    lstCOMPANY.SetDataText(ls_comp);
    lstVOUCHER_TYPE.SetDataText(ls_voucher);
    lstTR_TYPE.SetDataText(ls_tr_type);
    lstVOUCHER_TYPE.SetDataText("AR");
    txtFROM_DATE.text = "01" + txtTO_DATE.text.substr(2,8);
    var ls_data      = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('GFQC0027') FROM DUAL")%>";
    lstReport.SetDataText(ls_data);
    txtUser_Pk.SetDataText(g_user_pk);
    dso_getCompany.Call();
}
function GetCustomer()
{
    var fpath   = System.RootURL + "/standard/forms/60/08/60080030_popup_customer.aspx";
    var object  = System.OpenModal(fpath , 700 , 600 , 'resizable:yes;status:yes'); 
    if ( object != null )  
    {
        if (object[0] != "")
        {
            txtCUST_PK.text = object[0];
            txtCUST_ID.text = object[1];
            txtCUST_NM.text = object[2];
                
         }
     }
}

function OnResetCust(ind)
{
    txtCUST_PK.text = "";
    txtCUST_ID.text = "";
    txtCUST_NM.text = "";
}

function OnSearch()
{
	dso_upd_tac_crca.Call("SELECT");
}

function OnPoupClick()
{
	if(grdMaster.row > 1)
	{
		var mst_pk = grdMaster.GetGridData(grdMaster.row,0);
		var fpath   = System.RootURL + "/standard/forms/gf/ca/gfca00030_view.aspx?mst_pk=" + mst_pk;
        var object  = System.OpenModal(fpath , 1000 , 600 , 'resizable:yes;status:yes');	
	}	
}

function MergeHeader()
{
	var fg=grdMaster.GetGridControl();
	
	if(fg.rows == 1)
	{
		grdMaster.AddRow();
	}
	fg.FixedRows = 2; 
	fg.MergeCells = 5; 
	fg.MergeRow(0) = true;
	
	fg.MergeCol(1) = true;
	fg.Cell(0, 0, 1, 1, 1) = "SEQ";
	fg.Cell(0, 0, 2, 0, 3) = "VOUCHER";
	fg.Cell(0, 1, 2, 1, 2) = "Type";
	fg.Cell(0, 1, 3, 1, 3) = "NO";
	fg.MergeCol(4) = true;
	fg.Cell(0, 0, 4, 1, 4) = "DATE";
	fg.MergeCol(5) = true;
	fg.Cell(0, 0, 5, 1, 5) = "CCY";
	fg.MergeCol(6) = true;
	fg.Cell(0, 0, 6, 1, 6) = "RATE";
	fg.Cell(0, 0, 8, 0, 10) = "INVOICE";
	fg.Cell(0, 1, 8, 1, 8) = "Serial";
	fg.Cell(0, 1, 9, 1, 9) = "Invoice date";
	fg.Cell(0, 1, 10, 1, 10) = "Invoice No";
	fg.Cell(0, 0, 12, 0, 13) = "CUSTOMER";
	fg.Cell(0, 1, 12, 1, 12) = "ID";
	fg.Cell(0, 1, 13, 1, 13) = "Name";
	fg.Cell(0, 0, 14, 0, 15) = "NET AMOUNT";
	fg.Cell(0, 1, 14, 1, 14) = "Transaction";
	fg.Cell(0, 1, 15, 1, 15) = "Book";
	fg.Cell(0, 0, 16, 0, 17) = "EXPORT TAX AMOUNT";
	fg.Cell(0, 1, 16, 1, 16) = "Transaction";
	fg.Cell(0, 1, 17, 1, 17) = "Book";
	fg.Cell(0, 0, 18, 0, 20) = "VAT AMOUNT";
	fg.Cell(0, 1, 18, 1, 18) = "Rate";
	fg.Cell(0, 1, 19, 1, 19) = "Transaction";
	fg.Cell(0, 1, 20, 1, 20) = "Book";
	fg.Cell(0, 0, 22, 0, 23) = "ACCOUNT";
	fg.Cell(0, 1, 22, 1, 22) = "Code";
	fg.Cell(0, 1, 23, 1, 23) = "Name";
	fg.Cell(0, 0, 24, 0, 26) = "DESCRIPTION";
	fg.Cell(0, 1, 24, 1, 24) = "English";
	fg.Cell(0, 1, 25, 1, 25) = "Local";
	fg.Cell(0, 1, 26, 1, 26) = "Contract NoAR";
	fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;  
	fg.Cell(13, 1, 1, 1,fg.Cols - 1) = true;
	
    fg.ColWidth(0) =0;
	fg.ColWidth(1) =900;
	fg.ColWidth(2) =1400;
	fg.ColWidth(3) =1500;
	fg.ColWidth(4) =1500;
	fg.ColWidth(5) =800;
	fg.ColWidth(6) =1500;
	fg.ColWidth(7) =0;
	fg.ColWidth(8) =1500;
	fg.ColWidth(9) =1500;
	fg.ColWidth(10) =1500;
	fg.ColWidth(11) =1500;
	fg.ColWidth(12) =1800;
	fg.ColWidth(13) =2800;
	fg.ColWidth(14) =1800;
	fg.ColWidth(15) =1800;
	fg.ColWidth(16) =1800;
	fg.ColWidth(17) =1800;
	fg.ColWidth(18) =1000;
	fg.ColWidth(19) =1800;
	fg.ColWidth(20) =1800;
	fg.ColWidth(21) =1800;
	fg.ColWidth(23) =2500;
	fg.ColWidth(24) =2500;
	fg.ColWidth(25) =2500;
	fg.ColWidth(26) =2500;
	fg.ColWidth(27) =0;
	
	lblRECORD.text = grdMaster.rows -2;
	//grdMaster.setFixedCols(7);
	//grdMaster.setFixedRows(2);
	var i, l_tot_net_trans = 0, l_tot_net_book = 0, l_export_trans = 0, l_export_book = 0;
	var l_tot_vat_trans = 0, l_tot_vat_book = 0;
	for(i = 2; i < grdMaster.rows; i++)
	{
	    l_tot_net_trans += Number(grdMaster.GetGridData(i, 14));
	    l_tot_net_book += Number(grdMaster.GetGridData(i, 15 ));
	    l_export_trans += Number(grdMaster.GetGridData(i, 16 ));
	    l_export_book += Number(grdMaster.GetGridData(i, 17 ));
	    l_tot_vat_trans += Number(grdMaster.GetGridData(i, 19 ));
	    l_tot_vat_book += Number(grdMaster.GetGridData(i, 20 ));
	}
	grdMaster.AddRow();
	grdMaster.SetCellBgColor(grdMaster.rows-1,0,grdMaster.rows-1,grdMaster.cols-1,0xA9EBD7);
	grdMaster.SetGridText(grdMaster.rows - 1, 14, l_tot_net_trans);
	grdMaster.SetGridText(grdMaster.rows - 1, 15, l_tot_net_book);
	grdMaster.SetGridText(grdMaster.rows - 1, 16, l_export_trans);
	grdMaster.SetGridText(grdMaster.rows - 1, 17, l_export_book);
	grdMaster.SetGridText(grdMaster.rows - 1, 19, l_tot_vat_trans);
	grdMaster.SetGridText(grdMaster.rows - 1, 20, l_tot_vat_book);
	grdMaster.SetGridText(grdMaster.rows - 1, 4, '');
	grdMaster.SetGridText(grdMaster.rows - 1, 10, '');
}
//-----------------------------------------------------------------------------------
// Report Bang thong ke hang ban'
function OnExcel()
{  
    var iCase = lstReport.value ;
	switch(iCase)
	{
		case '2':
			//var url = System.RootURL + '/standard/reports/gf/ca/gfca00030.aspx?p_seq=' + txtSEQ.text + '&p_comp=' + lstCOMPANY.value + '&p_from=' + txtFROM_DATE.value + '&p_to=' + txtTO_DATE.value + '&p_voucher_type=' + lstVOUCHER_TYPE.value + '&p_voucherno=' + txtVOUCHER_NO.text + '&p_serial_no=' + txtSERIAL_NO.text + '&p_invoceno=' + txtINVOICE_NO.text + '&p_tr_type=' + lstTR_TYPE.value + '&p_cust_pk=' + txtCUST_PK.text + '&p_cust_id=' + txtCUST_ID.text + '&p_status=' + rdoSTATUS.value ; 
			var url = System.RootURL + '/standard/reports/60/11/rpt_60110060_SUM.aspx?p_seq=' + txtSEQ.text + '&p_comp=' + lstCOMPANY.value + '&p_from=' + txtFROM_DATE.value + '&p_to=' + txtTO_DATE.value + '&p_voucher_type=' + lstVOUCHER_TYPE.value + '&p_voucherno=' + txtVOUCHER_NO.text + '&p_serial_no=' + txtSERIAL_NO.text + '&p_invoceno=' + txtINVOICE_NO.text + '&p_tr_type=' + lstTR_TYPE.value + '&p_cust_pk=' + txtCUST_PK.text + '&p_cust_id=' + txtCUST_ID.text + '&p_status=' + rdoSTATUS.value ; 
			System.OpenTargetPage(url);        
			break ;
		case '1':
			//var url = System.RootURL + '/standard/reports/gf/ca/ARHistoryDetails.aspx?tac_hgtrh_pk=' + txtSEQ.text + '&tco_company_pk=' + lstCOMPANY.value + '&tr_date_fr=' + txtFROM_DATE.value + '&tr_date_to=' + txtTO_DATE.value + '&voucherno=' + txtVOUCHER_NO.text + '&serial_no=' + txtSERIAL_NO.text + '&invoceno=' + txtINVOICE_NO.text + '&tr_type=' + lstTR_TYPE.value + '&tco_buspartner_pk=' + txtCUST_PK.text + '&tr_status=' + rdoSTATUS.value ; 
			var url = System.RootURL + '/standard/reports/60/11/rpt_60110060_Details.aspx?tac_hgtrh_pk=' + txtSEQ.text + '&tco_company_pk=' + lstCOMPANY.value + '&tr_date_fr=' + txtFROM_DATE.value + '&tr_date_to=' + txtTO_DATE.value + '&voucherno=' + txtVOUCHER_NO.text + '&serial_no=' + txtSERIAL_NO.text + '&invoceno=' + txtINVOICE_NO.text + '&tr_type=' + lstTR_TYPE.value + '&tco_buspartner_pk=' + txtCUST_PK.text + '&tr_status=' + rdoSTATUS.value ; 
			System.OpenTargetPage(url);        			
			break ;	
        case '3':
			//var url = System.RootURL + '/standard/reports/gf/ca/gfca00030_VAT.aspx?tco_company_pk=' + lstCOMPANY.value + '&tr_date_fr=' + txtFROM_DATE.value + '&tr_date_to=' + txtTO_DATE.value ;
			var url = System.RootURL + '/standard/reports/60/11/rpt_60110060_VAT.aspx?tco_company_pk=' + lstCOMPANY.value + '&tr_date_fr=' + txtFROM_DATE.value + '&tr_date_to=' + txtTO_DATE.value ;
			System.OpenTargetPage(url);        						        
            break;			
	}
}
//-----------------------------------------------------------------------------------
</script>

<body style="margin:0; padding:0;">
<!------------------------------------------------------->
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
	<gw:data id="dso_upd_tac_crca" onreceive="MergeHeader()">
        <xml>
            <dso type="grid" function="ac_select_60110060_crca_his">
                <input bind="grdMaster">
                    <input bind="txtSEQ"/>
                    <input bind="lstCOMPANY"/>
                    <input bind="txtFROM_DATE"/>
                    <input bind="txtTO_DATE"/>
                    <input bind="lstVOUCHER_TYPE"/>
                    <input bind="txtVOUCHER_NO"/>
                    <input bind="txtSERIAL_NO"/>
                    <input bind="txtINVOICE_NO"/>
                    <input bind="lstTR_TYPE"/>
                    <input bind="txtCUST_PK"/>
                    <input bind="txtCUST_ID"/>
                    <input bind="rdoSTATUS"/>
                </input>
                <output bind="grdMaster"/>
            </dso> 
        </xml>
    </gw:data>
    
<table width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		<td>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="8%"></td>
                    <td width="12%"></td>
                    <td width="8%"></td>
                    <td width="12%"></td>
                    <td width="8%"></td>
                    <td width="12%"></td>
                    <td width="8%"></td>
                    <td width="12%"></td>
                    <td width="8%"></td>
                    <td width="6%"></td>
                    <td width="6%"></td>
				</tr>
				<tr>
					<td align="right"><b>Company&nbsp;</b></td>
                    <td ><gw:list id="lstCOMPANY" styles='width:100%' /></td>
                    <td align="right"><b>Voucher Type&nbsp;</b></td>
                    <td ><gw:list id="lstVOUCHER_TYPE" styles='width:100%' /></td>
                    <td align="right"><b>Voucher No&nbsp;</b></td>
                    <td ><gw:textbox id="txtVOUCHER_NO"  styles='width:100%;height:22'/></td>
                    <td align="right"><b>Seq&nbsp;</b></td>
                    <td ><gw:textbox id="txtSEQ"  styles='width:100%;height:22'/></td>
                    <td align="center"><gw:imgBtn id="ibtnSearch" img="Search"  alt="Search"  onclick="OnSearch()"/></td>
                    <td colspan="2"><gw:list id="lstReport" /></td>
				</tr>
				<tr>
                    <td align="right"><b>Trans. Date&nbsp;</b></td>
                    <td ><gw:datebox id="txtFROM_DATE" styles='width:100%'  lang="<%=Session("Lang")%>"/></td>
                    <td align="center"><b>~&nbsp;</b></td>
                    <td ><gw:datebox id="txtTO_DATE" styles='width:100%'  lang="<%=Session("Lang")%>"/></td>
                    <td align="right"><b>Serial No&nbsp;</b></td>
                    <td><gw:textbox id="txtSERIAL_NO" styles='width:100%;height:22'/></td>
                    <td align="right"><b>Invoice No&nbsp;</b></td>
                    <td ><gw:textbox id="txtINVOICE_NO"  styles='width:100%;height:22'/></td>
                    <td align="right"><gw:button id="btnExcel" img="excel"text="Print" alt="Print" onclick="OnExcel()" /></td>
                    <td align="center"><font color="red"><b><gw:label id="lblRECORD" text="0" /></b></font></td>
                    <td ><font color="red"><b>&nbsp;Records</b></font></td>
                    
                </tr>
                <tr>
                    <td align="right"><b>Slip Status&nbsp;</b></td>
                    <td colspan="3"><gw:radio id="rdoSTATUS" value="1" onchange="OnSearch()">
                                    <span value="ALL">All</span>                                    
                                    <span value="2">Confirmed</span>
                                    <span value="0">Approved</span>                                    
                                    <span value="3">Cancaled</span>
                                    </gw:radio ></td>
                    <td align="right"><a title="Click here to show Customer" onclick="GetCustomer()" href="#tips" ><b>Customer&nbsp;</b></a></td>
                    <td colspan="3">
                        <table width="100% cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="36%">
                                    <gw:textbox id="txtCUST_ID"  styles='width=100%;height:22'></gw:textbox>                                                
                                </td>
                                <td width="60%">
                                    <gw:textbox id="txtCUST_NM"  styles='width=100%;height:22'></gw:textbox>
                                </td>
                                <td width="4%"><gw:imgBtn id="ibtnResetCustomer" img="reset"   alt="reset"         onclick="OnResetCust()"/></td>
                            </tr>
                        </table>
                    </td>    
                    <td align="right"><b>Origin&nbsp;</b></td>
                    <td colspan="2"><gw:list id="lstTR_TYPE" styles='width:100%' onchange="OnSearch()"/></td>
                    
                </tr>
			</table>	
		</td>	
	</tr>
	<tr>
		<td>
			<gw:grid
				id="grdMaster"
				header  ="_PK(0)| SEQ(1)| VOUCHER_TYPE(2)| VOUCHERNO(3)| TR_DATE(4)|TR_CCY(5)| TR_RATE(6)| BK_RATE(7)|SERIAL_NO(8)| INVOICE_DATE(9)| INVOICE_NO(10)|_TCO_BUSPARTNER_PK(11)| PARTNER_ID(12)| PARTNER_NAME(13)|TOT_NET_TR_AMT(14)| TOT_NET_BK_AMT(15)|TOT_EX_TAX_TR_AMT(16)| TOT_EX_TAX_BK_AMT(17)|VAT_RATE(18)|TOT_VAT_TR_AMT(19)| TOT_VAT_BK_AMT(20)|_TAC_ABACCTCODE_PK(21)| AC_CD(22)|AC_NM(23)|REMARK(24)| REMARK2(25)|ContractNoAR(26)| _TCO_COMPANY_PK(27)"
				format  ="1|0|0|2|4|0|1|1|0|4|0|1|0|0|1|1|1|1|1|1|1|0|0|0|0|0|0|0"
				aligns  ="0|0|0|0|0|0|3|3|0|0|0|3|0|3|3|3|3|3|3|3|3|0|0|0|0|0|0|0"
				defaults="||||||||||||||||||||||||||"
				editcol ="0|0|1|1|1|1|1|0|1|1|1|1|1|0|1|1|1|1|1|1|1|1|0|0|0|0|0|1"
				widths  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				styles  ="width:100%; height:300"
				oncelldblclick=""
				acceptNullDate="T"
				sorting ="T" />        
		</td>
	</tr>
</table>	
<gw:textbox id="txtCUST_PK"  styles='display:none' />
<gw:textbox id="txtUser_Pk"  styles='display:none' />
<gw:textbox id="txtProposedByUserPk"  styles='display:none' />

</body>
</html>