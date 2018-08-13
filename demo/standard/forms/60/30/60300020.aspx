<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>FO Hotel Print Bill Log</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>

var G1_PK                           = 0,
    G1_INVOCIE_NO                   = 1,
    G1_INVOICE_DATE                 = 2,
    G1_GUEST                        = 3,
    G1_FIRST_PRINT_TOTAL            = 4,
    G1_LAST_PRINT_TOTAL             = 5,
    G1_GAP_AMOUNT                   = 6,
    G1_SERVICES_RATE                = 7,
    G1_SERVICES_AMT                 = 8,
    G1_VAT_RATE                     = 9,
    G1_VAT_AMT                      = 10,
    G1_DISCOUNT_RATE                = 11,
    G1_DISCOUNT_VAT                 = 12,
    G1_ROOM_NO                      = 13,
    G1_GUEST_NAME                   = 14,
    
    G2_PK                           = 0,
    G2_PRINT_SEQ                    = 1,
    G2_INVOCIE_NO                   = 2,
    G2_INVOICE_DATE                 = 3,
    G2_TOTAL_DUE                    = 4,
    G2_SERVICES_RATE                = 5,
    G2_SERVICES_AMT                 = 6,
    G2_VAT_RATE                     = 7,
    G2_VAT_AMT                      = 8,
    G2_DISCOUNT_RATE                = 9,
    G2_DISCOUNT_AMT                 = 10,
    G2_ROOM_NO                      = 11,
    G2_GUEST_NAME                   = 12;

    
function BodyInit()
{
    grdInvoices.GetGridControl().FrozenCols = 6;
    l_crt_by = "<%=Session("User_ID")%>";
    dat_Invoices.Call("SELECT");
}
function OnSearch()
{
    if (txtPrintQty.text == '' || txtPrintQty.text == '0')
        txtPrintQty.text = '2';

    if(rbstatus.value == '0')
        dat_Invoices.Call("SELECT");
    else
        dat_Invoices_M.Call("SELECT");    
}

function OnSelect(){
     if(rbstatus.value == '0'){
        document.getElementById("sl0").style.display = '';
        document.getElementById("sl1").style.display = 'none';
        dat_Invoices.Call("SELECT");
    }else{
        document.getElementById("sl0").style.display = 'none';
        document.getElementById("sl1").style.display = '';   
        dat_Invoices_M.Call("SELECT");
    }
}

function OnReport()
{
    var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ja/rt/jart00050_cash_summary_daily.rpt&procedure=sp_sel_jart00050_report&parameter="+dtTranFrom.GetData()+","+dtTranTo.GetData();   
     System.OpenTargetPage(url); 
}
function OnPrintBill(){
   if(grdInvoices.row > 1){
        var pk=grdInvoices.GetGridData(grdInvoices.row,0);
		/*
        var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ja/rt/jart0050_invoice.rpt&procedure=sp_rpt_jart00050_invoice&parameter="+
	        pk+","+l_crt_by;   
	    System.OpenTargetPage(url); */
		var url =System.RootURL + '/standard/reports/ht/fo/rpt_htfo00050_print_Hotel_Golf.aspx?p_tcm_inovice_pk='+pk;
		System.OpenTargetPage(url);
	}		 
	else{
	    alert("Please select one invoice to print.");
	    return;
	}   
}
function OnDataRec(obj)
{
    switch(obj.id)
	{
		case 'dat_Invoices_M':
		case 'dat_Invoices':
		     txtCount.text=grdInvoices.rows-1 + " Bill(s).";
             if (grdInvoices.rows > 1)
                tcm_inovice_pk.text = grdInvoices.GetGridData(1, 0);

			 grdInvoices.Subtotal( 1, 2, -1,'3!4!5!6!8!10!12');
			 
			var set_color = 0x2626CD;
            for(var idx = grdInvoices.rows - 1; idx > 1; idx--)
            {
                if(Number(grdInvoices.GetGridData(idx, G1_FIRST_PRINT_TOTAL)) > Number(grdInvoices.GetGridData(idx, G1_LAST_PRINT_TOTAL)))
                    grdInvoices.SetCellBgColor(idx, G1_LAST_PRINT_TOTAL, idx, G1_LAST_PRINT_TOTAL, set_color);
            }
            dat_Master.Call("SELECT");
		break;
        case 'dat_Master':
            txtCount1.text = grdMaster.rows-1 + " row(s).";	

            var set_color = 0x2626CD;
            for(row = grdMaster.rows - 1; row > 1; row--)
            {
                for(col = G2_TOTAL_DUE; col <= G2_GUEST_NAME; col++)
                {
                        if (grdMaster.GetGridData(row, col) != grdMaster.GetGridData(row - 1, col))
                            grdMaster.SetCellBgColor(row, col, row, col, set_color);
                }
            }

            if (grdMaster.rows > 1)
            {
                tcm_invoice_log_pk.text  = grdMaster.GetGridData(1, G2_PK);
                dat_Details.Call("SELECT");
            }
        break;
        case 'dat_Details':
            txtCount2.text = grdDetails.rows-1 + " row(s).";
        break;
    }
}

function OnExcel(){
	if(grdInvoices.rows > 1){
	  var url = System.RootURL + '/standard/reports/ja/rt/jart00050.aspx?dtfr='+dtTranFrom.GetData()+'&dtTo='+dtTranTo.GetData();
	  System.OpenTargetPage(url); 
	}
}

function OnClick(n)
{
    switch (n) 
    {
        case 1:
            if (grdInvoices.rows > 1)
                tcm_inovice_pk.text = grdInvoices.GetGridData(grdInvoices.row, 0);
                dat_Master.Call("SELECT");
        break;
        case 2:
             if (grdMaster.rows > 1)
            {
                tcm_invoice_log_pk.text  = grdMaster.GetGridData(grdMaster.row, 0);
                dat_Details.Call("SELECT");
            }
        break;        
    }
}
</script>

<body>
<gw:data id="dat_Invoices" onreceive="OnDataRec(this)"> 
    <xml> 
        <dso  type="grid" function="st_ht_sel_60300020_1"> 
            <input bind="grdInvoices"> 
				<input bind="dtTranFrom" /> 
                <input bind="dtTranTo" /> 
                <input bind="txtInvoiceNo" /> 
                <input bind="txtPrintQty" />
            </input> 
            <output bind="grdInvoices"></output>
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dat_Invoices_M" onreceive="OnDataRec(this)"> 
    <xml> 
        <dso  type="grid" function="st_ht_sel_60300020_1" > 
            <input bind="grdSummaryReport"> 
				<input bind="dtMonth" /> 
                <input bind="dtTranTo" /> 
                <input bind="txtInvoiceNo" /> 
                <input bind="txtPrintQty" />
            </input> 
            <output bind="grdInvoices"></output>
        </dso> 
    </xml> 
</gw:data>

<gw:data id="dat_Master" onreceive="OnDataRec(this)"> 
    <xml> 
        <dso  type="grid" function="st_ht_sel_60300020_2" > 
            <input bind="grdMaster"> 
				<input bind="tcm_inovice_pk" /> 
            </input> 
            <output bind="grdMaster"></output>
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dat_Details" onreceive="OnDataRec(this)"> 
    <xml> 
        <dso  type="grid"  function="st_ht_sel_60300020_3"> 
            <input bind="grdDetails"> 
				<input bind="tcm_invoice_log_pk" />
            </input> 
            <output bind="grdDetails"></output>
        </dso> 
    </xml> 
</gw:data>
    <!----------------------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="width: 100%; height: 1%">
            <td width="100%">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>                        
                        <td>
                            <fieldset style="padding: 2; width: 100%; height: 100%">
                                <table border="0" width="100%" id="table2">
                                    <tr>
                                        <td align="right" width="14%">
                                            <gw:radio id="rbstatus" value="0" onchange="OnSelect()"> 
                                                <span value="0">Date</span>
                                                <span value="1">Month</span>
                                            </gw:radio>
                                        </td>
                                        <td width="18%" id="sl0">
                                            <gw:datebox id="dtTranFrom" lang="1" onchange="OnSearch()" />~<gw:datebox id="dtTranTo" lang="1" onchange="OnSearch()" />
                                        </td>
                                        <td width="18%" id="sl1" style="display:none">
                                             <gw:datebox id="dtMonth" type="month" lang="1" onchange="OnSelect()"/>
                                        </td>
                                        <td align="right" width="10%">
                                            Invoice#</td>
                                        <td width="20%">
                                            <gw:textbox id="txtInvoiceNo" lang="1" onenterkey="OnSearch()" />
                                        </td>
                                        <td align="right" width="10%">
                                            Print Qty >=</td>
                                        <td width="5%">
                                            <gw:textbox id="txtPrintQty" text="2" lang="1" onenterkey="OnSearch()" />
                                        </td>
                                        <td style="width: 5%;display:none">
												<gw:icon id="idBtnPrintBill" img="2" text="Print Bill" styles='width:100%' onclick="OnPrintBill()" />
										</td>
                                        <td width="3%">
                                            <gw:imgbtn id="btnSearch1" img="search" width="100%" img="in" text="search" onclick="OnSearch()" />
                                        </td>
                                        <td align="right" style="width:6%;white-space:nowrap;">
                                            <b>Total Record</b></td>
                                        <td style="width: 30%" align="center"><gw:label id="txtCount" /></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>                               
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 100%; height: 33%">
            <td width="100%">
                <table align="top" cellspacing="0" cellpadding="0" border="0" style="width: 100%;
                    height: 100%;">
                    <tr valign="top">
                        <td width="100%">
                            <gw:grid id="grdInvoices" 
                                header="_PK|Invocie No|Invoice Date|Guest|First Print Total|Last Print Total|Gap Amount|Services Rate|Services AMT|VAT Rate|VAT AMT|Discount Rate|Discount AMT|Room No|Guest Name" 
			                    format="0|0|4|0|-0|-0|-0|0|-0|0|-0|0|-0|0|0"
			                    aligns="0|1|0|1|0|0|0|1|0|1|0|1|0|1|0"
			                    styles="width:100%;height:100%"
			                    autosize='T'
			                    acceptnulldate="T" oncellclick="OnClick(1)" debug = "false"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 100%; height: 1%">
            <td width="100%">
            </td>
        </tr>
        <tr style="width: 100%; height: 3%">
            <td width="100%">
                <fieldset style="padding: 2; width: 100%; height: 100%">
                <table align="top" cellspacing="0" cellpadding="0" border="0" style="width: 100%;
                    height: 100%;">
                    <tr valign="top">                        
                        <td width="80%" align="center"> Master Bill
                        </td>
                        <td width="20%" align="right">
                            <gw:label id="txtCount1" text="0 row(s)" />
                        </td>
                    </tr>
                </table>
                </fieldset>
            </td>
        </tr>
        <tr style="width: 100%; height: 1%">
            <td width="100%">
            </td>
        </tr>
        <tr style="width: 100%; height: 30%">
            <td width="100%">
                <table align="top" cellspacing="0" cellpadding="0" border="0" style="width: 100%;
                    height: 100%;">
                    <tr valign="top">
                        <td width="100%">
                            <gw:grid id="grdMaster"                             
                                header="_PK|Print#|Invocie No|Invoice Date|Total DUE|Services Rate|Services AMT|VAT Rate|VAT AMT|Discount Rate|Discount AMT|Room No|Guest Name" 
			                    format="0|0|0|4|-0|0|-0|0|-0|0|-0|0|0"
			                    aligns="0|1|1|1|0|1|0|1|0|1|0|1|0"
			                    styles="width:100%;height:100%"
                                sorting="T" autosize="T" oncellclick="OnClick(2)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 100%; height: 1%">
            <td width="100%">
            </td>
        </tr>
        <tr style="width: 100%; height: 3%">
            <td width="100%">
                <fieldset style="padding: 2; width: 100%; height: 100%">
                <table align="top" cellspacing="0" cellpadding="0" border="0" style="width: 100%;
                    height: 100%;">
                    <tr valign="top">                        
                        <td width="80%" align="center"> Details Bill
                        </td>
                        <td width="20%" align="right">
                            <gw:label id="txtCount2" text="0 row(s)" />
                        </td>
                    </tr>
                </table>
                </fieldset>
            </td>
        </tr>
        <tr style="width: 100%; height: 1%">
            <td width="100%">
            </td>
        </tr>
        <tr style="width: 100%; height: 30%">
            <td width="100%">
                <table align="top" cellspacing="0" cellpadding="0" border="0" style="width: 100%;
                    height: 100%;">
                    <tr valign="top">
                        <td width="100%">
                            <gw:grid id="grdDetails" 
                                header="Item Seq|Item Description|Unit|Price|Q.ty|AMT(VND)|AMT(USD)"
                                format="0|0|0|-0|-2|-0|-2"
								aligns="1|0|1|0|0|0|0"
                                editcol="0|0|0|0|0|0|0"
                                styles="width:100%; height:100%"
                                sorting="T" autosize="T"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="tcm_inovice_pk" style="display: none" />
    <gw:textbox id="tcm_invoice_log_pk" style="display: none" />
</body>
</html>
