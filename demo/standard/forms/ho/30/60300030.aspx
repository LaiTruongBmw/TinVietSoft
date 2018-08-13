<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>FO Hotel Print Bill Log</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var grd1_col_pk                 = 0,
    grd1_col_slip_no            = 1,
    grd1_col_slip_date          = 2,
    grd1_col_guest_name         = 3,
    grd1_col_room_no            = 4,
    grd1_col_arrival_date       = 5,
    grd1_col_departure_date     = 6,
    grd1_col_no_of_nights       = 7,
    grd1_col_hotel_supply_amt   = 8,
    grd1_col_service_amt        = 9,
    grd1_col_vat_amt            = 10,
    grd1_col_deposit_amt        = 11,
    grd1_col_discount_amt       = 12,
    grd1_col_hotel_total_amt    = 13,
    grd1_col_golf_amt           = 14,
    grd1_col_total_bill_amt     = 15,
    grd1_col_print_time         = 16,
    grd1_col_print_type         = 17,
    grd1_col_print_seq          = 18,
    grd1_col_ex_rate            = 19,
    grd1_col_status             = 20,
    grd1_col_customer_name      = 21,
    grd1_col_customer_addr      = 22,
    grd1_col_tax_code           = 13,
    grd1_col_payment_methoad    = 14,
    grd1_col_room_sent_amt      = 15,
    grd1_col_confirm_msg        = 16;
    
function BodyInit()
{
    /*data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM tco_commcode WHERE PARENT_CODE = 'PTYPE' and del_if=0")%>";
    grdSummaryReport.SetComboFormat(26,data);//payment method*/
    grdSummaryReport.GetGridControl().FrozenCols = 6;
    l_crt_by = "<%=Session("User_ID")%>";
    dat_SummaryReport.Call("SELECT");
}
function OnSearch()
{
    if (txtPrintQty.text == '' || txtPrintQty.text == '0')
        txtPrintQty.text = '2';

    if(rbstatus.value == '0')
        dat_SummaryReport.Call("SELECT");
    else
        dat_SummaryReport_M.Call("SELECT");    
}

function OnSelect(){
     if(rbstatus.value == '0'){
        document.getElementById("sl0").style.display = '';
        document.getElementById("sl1").style.display = 'none';
        dat_SummaryReport.Call("SELECT");
    }else{
        document.getElementById("sl0").style.display = 'none';
        document.getElementById("sl1").style.display = '';   
        dat_SummaryReport_M.Call("SELECT");
    }
}

function OnReport()
{
    var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ja/rt/jart00050_cash_summary_daily.rpt&procedure=sp_sel_jart00050_report&parameter="+dtTranFrom.GetData()+","+dtTranTo.GetData();   
     System.OpenTargetPage(url); 
}
function OnPrintBill(){
   if(grdSummaryReport.row > 1){
        var pk=grdSummaryReport.GetGridData(grdSummaryReport.row,0);
		/*
        var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ja/rt/jart0050_invoice.rpt&procedure=sp_rpt_jart00050_invoice&parameter="+
	        pk+","+l_crt_by;   
	    System.OpenTargetPage(url); */
		var url =System.RootURL + '/reports/ht/fo/rpt_htfo00050_print_Hotel_Golf.aspx?p_tht_room_allocate_pk='+pk;
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
		case 'dat_SummaryReport_M':
		case 'dat_SummaryReport':
		     txtCount.text=grdSummaryReport.rows-1 + " Bill(s).";
             if (grdSummaryReport.rows > 1)
                tht_room_allocate_pk.text = grdSummaryReport.GetGridData(1, 0);

			 grdSummaryReport.Subtotal( 1, 2, -1,'7!8!9!10!11!12!13!14!15!16!17!18!19!20!21!22!23!24!25!26!27');
			 
			 var set_color = 0x2626CD;
            for(var idx = grdSummaryReport.rows - 1; idx > 1; idx--)
            {
                if(Number(grdSummaryReport.GetGridData(idx, 8)) > Number(grdSummaryReport.GetGridData(idx, 9)))
                    grdSummaryReport.SetCellBgColor(idx, 9, idx, 9, set_color);
            }
             dat_SummaryReport1.Call("SELECT");
		break;
		case 'dat_updatePackage':
		     txtCount.text = grdSummaryReport.rows-1 + " Bill(s).";	
			 grdSummaryReport.Subtotal( 1, 2, -1,'4!5!6!7!8!9!10!11!12!13!14!15!16!17!18!19!20!21!22!23!24!25!30');
		break;
        case 'dat_SummaryReport1':
            txtCount1.text = grdSummaryReport1.rows-1 + " row(s).";	

            var set_color = 0x2626CD;
            for(row = grdSummaryReport1.rows - 1; row > 1; row--)
            {
                for(col = 1; col <= 27; col++)
                {
                    //if (col != grd1_col_print_time)
                    //{
                        if (grdSummaryReport1.GetGridData(row, col) != grdSummaryReport1.GetGridData(row - 1, col))
                            grdSummaryReport1.SetCellBgColor(row, col, row, col, set_color);
                    //}
                }
            }

            if (grdSummaryReport1.rows > 1)
            {
                tht_fohotel_bill_pk.text  = grdSummaryReport1.GetGridData(1, grd1_col_pk);
                dat_SummaryReport2.Call("SELECT");
            }
        break;
        case 'dat_SummaryReport2':
            txtCount2.text = grdSummaryReport2.rows-1 + " row(s).";
        break;
    }
}
function OnSave()
{
//    if(grdSummaryReport.row !='-1')
//	{
//		if(grdSummaryReport.GetGridData(grdSummaryReport.row,26) =='-1')//check
//		{
//			if(confirm("Are you sure undo checkout?"))
//			{
//				dat_SummaryReport.Call();
//			}
//		}
//	}
//	else
//		{
//			alert("You must check one Locker to undo checkout.");
//		}
}
function OnSave_Package()
{
//    if(grdSummaryReport.row !='-1')
//	{
//		dat_updatePackage.Call();	
//	}
//	else
//		{
//			alert("You must check one Locker to save package.");
//		}
}
function OnChangeRoom()
{  
	//if(grdSummaryReport.col == 28)  //col =28-->room_no 
	//{
        // mr phuc
//        var path = System.RootURL + "/form/ja/rt/jart00050_change_room_popup.aspx?encode_yn=Y&p_visitorfee_golfer_pk="+grdSummaryReport.GetGridData(grdSummaryReport.row, 27);
//        var object = System.OpenModal( path , 500 , 100 ,  'resizable:yes;status:yes',window);
    //}   
}

function OnExcel(){
	if(grdSummaryReport.rows > 1){
	  var url = System.RootURL + '/reports/ja/rt/jart00050.aspx?dtfr='+dtTranFrom.GetData()+'&dtTo='+dtTranTo.GetData();
	  System.OpenTargetPage(url); 
	}
}

function OnClick(n)
{
    switch (n) 
    {
        case 1:
            if (grdSummaryReport.rows > 1)
                tht_room_allocate_pk.text = grdSummaryReport.GetGridData(grdSummaryReport.row, 0);
                dat_SummaryReport1.Call("SELECT");
        break;
        case 2:
             if (grdSummaryReport1.rows > 1)
            {
                tht_fohotel_bill_pk.text  = grdSummaryReport1.GetGridData(grdSummaryReport1.row, grd1_col_pk);
                dat_SummaryReport2.Call("SELECT");
            }
        break;        
    }
}
</script>

<body>
<gw:data id="dat_SummaryReport" onreceive="OnDataRec(this)"> 
    <xml> 
        <dso  type="grid" parameter="26,27"  function="ht_sel_60300030_1"  > 
            <input bind="grdSummaryReport"> 
				<input bind="dtTranFrom" /> 
                <input bind="dtTranTo" /> 
                <input bind="txtLockerNo" /> 
                <input bind="txtPrintQty" />
            </input> 
            <output bind="grdSummaryReport"></output>
        </dso> 
    </xml> 
</gw:data>

<gw:data id="dat_SummaryReport_M" onreceive="OnDataRec(this)"> 
    <xml> 
        <dso  type="grid" parameter="26,27"  function="ht_sel_60300030_1" > 
            <input bind="grdSummaryReport"> 
				<input bind="dtMonth" /> 
                <input bind="dtTranTo" /> 
                <input bind="txtLockerNo" /> 
                <input bind="txtPrintQty" />
            </input> 
            <output bind="grdSummaryReport"></output>
        </dso> 
    </xml> 
</gw:data>

<gw:data id="dat_updatePackage" onreceive="OnDataRec(this)"> 
    <xml> 
        <dso  type="grid" parameter="27,31"  function="sp_sel_jart00050_form" procedure="sp_upd_jart00050_package" > 
            <input bind="grdSummaryReport"> 
				<input bind="dtTranFrom" /> 
                <input bind="dtTranTo" /> 
                <input bind="txtLockerNo" /> 
            </input> 
            <output bind="grdSummaryReport"></output>
        </dso> 
    </xml> 
</gw:data>

<gw:data id="dat_SummaryReport1" onreceive="OnDataRec(this)"> 
    <xml> 
        <dso  type="grid" function="ht_sel_60300030_2" > 
            <input bind="grdSummaryReport1"> 
				<input bind="tht_room_allocate_pk" /> 
            </input> 
            <output bind="grdSummaryReport1"></output>
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dat_SummaryReport2" onreceive="OnDataRec(this)"> 
    <xml> 
        <dso  type="grid"  function="ht_sel_60300030_3"> 
            <input bind="grdSummaryReport2"> 
				<input bind="tht_fohotel_bill_pk" />
            </input> 
            <output bind="grdSummaryReport2"></output>
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
                                            Room#/Guest Name</td>
                                        <td width="20%">
                                            <gw:textbox id="txtLockerNo" lang="1" onenterkey="OnSearch()" />
                                        </td>
                                        <td align="right" width="10%">
                                            Print Qty >=</td>
                                        <td width="5%">
                                            <gw:textbox id="txtPrintQty" text="2" lang="1" onenterkey="OnSearch()" />
                                        </td>
                                        <td width="2%">
                                        </td>
                                        <td style="width: 5%">
												<gw:icon id="idBtnPrintBill" img="2" text="Print Bill" styles='width:100%' onclick="OnPrintBill()" />
										</td>
                                        <td width="3%">
                                            <gw:imgbtn id="btnSearch1" img="search" width="100%" img="in" text="search" onclick="OnSearch()" />
                                        </td>
                                        <td style="width: 3%;display:none">
                                            <gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnReport()" />
                                        </td>
                                        <td style="width: 3%;display:none" align="right">
                                            <gw:icon id="btnSave" img="2" text="Undo Checkout" styles='width:100%' onclick="OnSave()" />
                                        </td>
                                        <td style="width: 5%;display:none">
											<gw:icon id="btnSavePackage" img="2" text="Save Package" styles='width:100%' onclick="OnSave_Package()" />
										</td>
										<td style="width: 3%;display:none" align="right">
                                            <gw:imgBtn id="btnExcel" img="excel" alt="Cash Summary Daily" onclick="OnExcel()" />
                                        </td>
                                        <td align="right" style="width: 16%">
                                            <b>Total Record</b></td>
                                        <td style="width: 20%" align="center">
                                            <gw:label id="txtCount" />
                                        </td>
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
                            <gw:grid id="grdSummaryReport" 
                                header="_PK|Room#|Invoice No|Last Name|First Name|Checkin|Checkout|Night|First Print Total|Last Print Total|Gap Amount|Actual Payed|Return(VND)|Cash (VND)|Cash(USD)|Credit Card(VND)|Credit Card(USD)|AR(VND)|Room Charge|Restaurant|Minibar|Laudry|Telephone|Others|Other Golf|Package Golf|Advance|Adjust|Pay Method|Customer" 
			                    format="0|0|0|0|0|4|4|-0|-0|-0|-0|-0|-0|-0|1|-0|1|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0|0"
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
                            <gw:grid id="grdSummaryReport1"                             
                                header="_pk|Slip No|Slip Date|Guest Name|Room No|Arrival Date|Departure Date|Nights|Hotel Supply AMT|SVC AMT|VAT AMT|Deposit AMT|Total AMT|Total AMT USD|Print Time|Print Type|Print Seq|Ex. Rate|Status|Customer Name|Customer Addr|Tax|Payment Method|room_sent_amt|Confirm Msg"
                                format		="0|0|4|0|0|4|4|0|-0|-0|-0|-0|-0|-0|-0|0|0|0|-0|0|0|0|0|0|-0|0"
								aligns		="0|0|0|0|1|1|1|1|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0"
								editcol		="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                styles="width:100%; height:100%"
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
                            <gw:grid id="grdSummaryReport2" 
                                header="Seq|Date|Item Description|Ref No|AMT(VND)|AMT(USD)"
                                format="0|4|0|0|-0|-0"
								aligns="0|0|0|0|0|0"
                                editcol="0|0|0|0|0|0"
                                styles="width:100%; height:100%"
                                sorting="T" autosize="T"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="tht_room_allocate_pk" style="display: none" />
    <gw:textbox id="tht_fohotel_bill_pk" style="display: none" />
</body>
</html>
