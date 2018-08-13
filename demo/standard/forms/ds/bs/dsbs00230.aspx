<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Sale Summary</title>
</head>
<script>

    var G1_CUST_PK = 0,
 	 G1_CUST_ID = 1,
	 G1_CUST_NAME = 2;

    var G2_SLIP_NO = 0,
 	 G2_OUT_DATE = 1,
	 G2_PO_NO = 2,
	 G2_SEQ = 3,
	 G2_ITEM_CODE = 4,
	 G2_ITEM_NAME = 5,
	 G2_SIZE = 6,
	 G2_COLOR = 7,
	 G2_UOM = 8,
	 G2_OUT_QTY = 9,
	 G2_U_PRICE = 10,
	 G2_ITEM_AMOUNT = 11,
	 G2_TAX_AMOUNT = 12,
	 G2_TOTAL_AMOUNT = 13,
	 G2_CCY = 14;

    var GT3_SLIP_NO = 0,
 	 GT3_OUT_DATE = 1,
	 GT3_PO_NO = 2,
	 GT3_SEQ = 3,
	 GT3_ITEM_CODE = 4,
	 GT3_ITEM_NAME = 5,
	 GT3_SIZE = 6,
	 GT3_COLOR = 7,
	 GT3_UOM = 8,
	 GT3_OUT_QTY = 9,
	 GT3_U_PRICE = 10,
	 GT3_ITEM_AMOUNT = 11,
	 GT3_TAX_AMOUNT = 12,
	 GT3_TOTAL_AMOUNT = 13,
	 GT3_CCY = 14;

    var G3_CCY_01 = 0,
	 G3_CUST_ID = 1,
 	 G3_CUST_NAME = 2,
	 G3_SALE_TYPE = 3,
	 G3_ITEM_TYPE = 4,
	 G3_ITEM_AMOUNT = 5,
	 G3_TAX_AMOUNT = 6,
	 G3_TOTAL_AMOUNT = 7,
	 G3_CCY = 8;

    var G_ITEM_CCY_01 = 0,
	G_ITEM_ITEM_CODE = 1,
	G_ITEM_ITEM_NAME = 2,
	G_ITEM_UOM = 3,
	G_ITEM_OUT_QTY = 4,
	G_ITEM_ITEM_AMOUNT = 5,
	G_ITEM_TAX_AMOUNT = 6,
	G_ITEM_TOTAL_AMOUNT = 7,
	G_ITEM_CCY = 8;

    //===============================================================
    function BodyInit() {
        System.Translate(document);  // Translate to language session

        var now = new Date();
        var lmonth, ldate;

        ldate = dtFrom.value;
        ldate = ldate.substr(0, 4) + ldate.substr(4, 2) + '01';
        dtFrom.value = ldate;
        //----------------
        FormatGrid();
        //----------------  
        OnChangeMonth();
    }
    //===============================================================

    function FormatGrid() {
        grdDetail.GetGridControl().ColFormat(G2_OUT_QTY) = "###,###,###,###,###.##";
        grdDetail.GetGridControl().ColFormat(G2_U_PRICE) = "###,###,###,###,###.######";
        grdDetail.GetGridControl().ColFormat(G2_ITEM_AMOUNT) = "###,###,###,###,###.##";
        grdDetail.GetGridControl().ColFormat(G2_TAX_AMOUNT) = "###,###,###,###,###.##";
        grdDetail.GetGridControl().ColFormat(G2_TOTAL_AMOUNT) = "###,###,###,###,###.##";

        grdDetailTab3.GetGridControl().ColFormat(GT3_OUT_QTY) = "###,###,###,###,###.##";
        grdDetailTab3.GetGridControl().ColFormat(GT3_U_PRICE) = "###,###,###,###,###.######";
        grdDetailTab3.GetGridControl().ColFormat(GT3_ITEM_AMOUNT) = "###,###,###,###,###.##";
        grdDetailTab3.GetGridControl().ColFormat(GT3_TAX_AMOUNT) = "###,###,###,###,###.##";
        grdDetailTab3.GetGridControl().ColFormat(GT3_TOTAL_AMOUNT) = "###,###,###,###,###.##";

        grdCustomer.GetGridControl().ColFormat(G3_ITEM_AMOUNT) = "###,###,###,###,###.##";
        grdCustomer.GetGridControl().ColFormat(G3_TAX_AMOUNT) = "###,###,###,###,###.##";
        grdCustomer.GetGridControl().ColFormat(G3_TOTAL_AMOUNT) = "###,###,###,###,###.##";

        grdByItem.GetGridControl().ColFormat(G_ITEM_OUT_QTY) = "###,###,###,###,###";
        grdByItem.GetGridControl().ColFormat(G_ITEM_ITEM_AMOUNT) = "###,###,###,###,###.##";
        grdByItem.GetGridControl().ColFormat(G_ITEM_TAX_AMOUNT) = "###,###,###,###,###.##";
        grdByItem.GetGridControl().ColFormat(G_ITEM_TOTAL_AMOUNT) = "###,###,###,###,###.##";

        var data = "data|ITEM|by ITEM|GROUP|by GROUP||";
        lstItemTypeTab2.SetDataText(data);
        lstItemTypeTab2.value = '';

        lstItemTypeTab4.SetDataText(data);
        lstItemTypeTab4.value = '';

        grdCustomer.GetGridControl().MergeCells = 2;
        grdCustomer.GetGridControl().MergeCol(0) = true;
        grdCustomer.GetGridControl().MergeCol(1) = true;
        grdCustomer.GetGridControl().MergeCol(2) = true;
        grdCustomer.GetGridControl().MergeCol(3) = true;
        grdCustomer.GetGridControl().MergeCol(4) = true;
    }

    //===============================================================
    function OnSearch(pos) {
        switch (pos) {
            case 'Detail_Tab1':
                if (grdSearch.row > 0) {
                    txtPartnerPK.text = grdSearch.GetGridData(grdSearch.row, G1_CUST_PK);
                    data_dsbs00230_1.Call("SELECT");
                }
                else {
                    grdDetail.ClearData();
                }

                break;

            case 'Detail_Tab3':

                data_dsbs00230_4.Call("SELECT");

                break;

            case 'Search_Tab1':
                data_dsbs00230.Call("SELECT");
                break;

            case 'Search_Tab3':
                data_dsbs00230_3.Call("SELECT");
                break;

            case 'Detail_Tab2':
                data_dsbs00230_2.Call("SELECT");
                break;

            case 'BY-ITEM':
                data_dsbs00231.Call("SELECT");
                break;

        }
    }
    //===============================================================
    function OnDataReceive(obj) {
        switch (obj.id) {
            case 'data_dsbs00230_1':
                if (grdDetail.rows > 1) {
                    grdDetail.Subtotal(0, 2, -1, '9!11!12!13');
                }
                break;

            case 'data_dsbs00230_4':
                if (grdDetailTab3.rows > 1) {
                    grdDetailTab3.Subtotal(0, 2, -1, '9!11!12!13');
                }
                break;

            case 'data_dsbs00230_2':
                grdCustomer.Subtotal(0, 2, 0, '5!6!7');
                break;

            case 'data_dsbs00231':
                grdByItem.Subtotal(0, 2, 0, '5!6!7');
                break;
        }
    }
    //===============================================================

    function OnReport(para) {
        if (para == 1) {
            var url = System.RootURL + '/standard/reports/ds/bs/rpt_dsbs00230.aspx?p_partner_pk=' + txtPartnerPK.text
           + '&p_from_date=' + dtFrom.value
           + '&p_to_date=' + dtTo.value
           + '&p_po=' + txtPOTab1.text
           + '&p_item=' + txtItemTab1.text;

            System.OpenTargetPage(url);
        }
        else if (para == 2) {

        }
        else if (para == 3) {
            var url = System.RootURL + '/standard/reports/ds/bs/rpt_dsbs00230_1.aspx?p_from_dt=' + dtFrom_Date.value
            + '&p_to_dt=' + dtTo_Date.value
            + '&p_cust=' + txtCustTab2.text
            + '&p_item=' + txtItemTab2.text;
            + '&p_item_type=' + lstItemTypeTab2.value;
            System.OpenTargetPage(url);
        }
        else if (para == 4) {
            var url = System.RootURL + '/standard/reports/ds/bs/rpt_dsbs00230_2.aspx?p_from_dt=' + dtFrom_DateTab4.value
            + '&p_to_dt=' + dtTo_Date.value
            + '&p_item=' + txtItemTab4.text
            + '&p_item_type=' + lstItemTypeTab4.value;
            System.OpenTargetPage(url);
        }
    }
    //===============================================================
    function OnChangeTab(pos) {
        switch (pos) {

        }
    }
    //===============================================================

    function OnCheckDate() {
        if (chkDate.value == 'N') {
            dtFrom.SetEnable(false);
            dtTo.SetEnable(false);
        }
        else {
            dtFrom.SetEnable(true);
            dtTo.SetEnable(true);
        }
    }
    //=================================================================
    function OnChangeMonth(pos) {
        switch (pos) {
            case 'BY-ALL-CUST':
                pro_dsbs00230.Call();
                break;

            case 'BY-ITEM':
                pro_dsbs00230_1.Call();
                break;
        }
    }

    //================================================================================
    function OnTreeClk() {
        var obj = event.srcElement.GetCurrentNode();

        txtDivisionPK.text = '' + obj.oid;

        OnSearch('Detail_Tab3');
    }

    //=================================================================
 
</script>
<body>
    <!-------------------------------------------------------------------------->
    <gw:data id="pro_dsbs00230" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsbs00230" > 
                <input>
                    <input bind="dtMonth" />
                </input> 
                <output>
                    <output bind="dtFrom_Date" />
                    <output bind="dtTo_Date" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_dsbs00230_2" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_dsbs00230_2" > 
                <input bind="grdCustomer" >
				    <input bind="dtFrom_Date" />
                    <input bind="dtTo_Date" />                
					<input bind="txtCustTab2" />
					<input bind="txtItemTab2" />
					<input bind="lstItemTypeTab2" />
                </input>
                <output bind="grdCustomer" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_dsbs00230" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_dsbs00230" > 
                <input bind="grdSearch" >
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                                
					<input bind="txtCustTab1" />					 				
                </input>
                <output bind="grdSearch" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_dsbs00230_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_dsbs00230_1" > 
                <input bind="grdDetail" >
                    <input bind="txtPartnerPK" />
				    <input bind="dtFrom" />
                    <input bind="dtTo" />        
                    <input bind="txtPOTab1" />  
					<input bind="txtItemTab1" />                       				 
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_dsbs00230_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="tree" function="st_lg_sel_dsbs00230_3" > 
                <input>
                    <input bind="txtDivTab3" />
                </input>
                <output bind="oTree" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_dsbs00230_4" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_dsbs00230_4" > 
                <input bind="grdDetailTab3" >
                    <input bind="txtDivisionPK" />
				    <input bind="dtFromTab3" />
                    <input bind="dtToTab3" />        
                    <input bind="txtPOTab3" />  
					<input bind="txtItemTab3" />                       				 
                </input>
                <output bind="grdDetailTab3" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="pro_dsbs00230_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsbs00230" > 
                <input>
                    <input bind="dtMonthTab4" />
                </input> 
                <output>
                    <output bind="dtFrom_DateTab4" />
                    <output bind="dtTo_DateTab4" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_dsbs00231" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_dsbs00231" > 
                <input bind="grdByItem" >
				    <input bind="dtFrom_DateTab4" />
                    <input bind="dtTo_DateTab4" />                				 
					<input bind="txtItemTab4" />
					<input bind="lstItemTypeTab4" />
                </input>
                <output bind="grdByItem" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:tab>
    <table border="1" style="width: 100%; height: 100%" name="By One Customer">
        <tr style="height: 2%">
            <td style="width: 25%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 90%; white-space: nowrap" >
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" onchange="" />                            
                        </td>
						<td style="width: 5%" align="right">
                            <gw:button id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Search_Tab1')" />
                        </td>
                    </tr>                    
                    <tr>
                        <td style="width: 5%" align="right">
                            Cust
                        </td>
                        <td style="width: 20%; white-space: nowrap" colspan="2">
                            <gw:textbox id="txtCustTab1" styles='width:100%' onenterkey="OnSearch('Search_Tab1')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id='grdSearch' header='_CUST_PK|Partner ID|Partner Name' format='0|0|0'
                                aligns='0|0|0' check='||' editcol='1|1|1' widths='0|1200|1000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('Detail_Tab1')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 60%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">  
						<td style="width: 5%">
                            P/O
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtPOTab1" styles='width:100%' onenterkey="OnSearch('Detail_Tab1')" />
                        </td>						                      
                        <td style="width: 5%">
                            Item
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtItemTab1" styles='width:100%' onenterkey="OnSearch('Detail_Tab1')" />
                        </td>
						<td style="width: 5%" align="right" >                             
                        </td>
                        <td style="width: 25%">                            
                        </td>
						<td style="width: 9%">
						</td>
                        <td style="width: 1%" align="right">
                            <gw:button img="excel" alt="Report" id="btnReport1" onclick="OnReport('1')" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8">
                            <gw:grid id='grdDetail' 
								header='Slip No|Out Date|P/O No|Seq|Item Code|Item Name|_Size|_Color|UOM|Out Qty|U/Price|Item Amount|Tax Amount|Total Amount|CCY'
                                format='0|4|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|1|0|0|0|0|1|1|1|3|3|3|3|3|1' 
								check='||||||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								widths='1500|1200|1500|800|1500|2500|1500|1500|800|1200|1200|1500|1500|1500|800'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
	<table border="1" style="width: 100%; height: 100%" name="By Division">
        <tr style="height: 2%">
            <td style="width: 25%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 90%; white-space: nowrap" >
                            <gw:datebox id="dtFromTab3" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                            ~
                            <gw:datebox id="dtToTab3" lang="<%=Application("Lang")%>" mode="01" onchange="" />                            
                        </td>
						<td style="width: 5%" align="right">
                            <gw:button id="ibtnSearchTab3" img="search" alt="Search" text="Search" onclick="OnSearch('Search_Tab3')" />
                        </td>
                    </tr>                    
                    <tr>
                        <td style="width: 5%" align="right">
                            Div
                        </td>
                        <td style="width: 20%; white-space: nowrap" colspan="2">
                            <gw:textbox id="txtDivTab3" styles='width:100%' onenterkey="OnSearch('Search_Tab3')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:tree id="oTree" style="width: 100%; height: 100%; overflow: auto;" onclicknode="OnTreeClk()" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 60%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">  
						<td style="width: 5%">
                            P/O
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtPOTab3" styles='width:100%' onenterkey="OnSearch('Detail_Tab3')" />
                        </td>						                      
                        <td style="width: 5%">
                            Item
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtItemTab3" styles='width:100%' onenterkey="OnSearch('Detail_Tab3')" />
                        </td>
						<td style="width: 5%" align="right" >                             
                        </td>
                        <td style="width: 25%">                            
                        </td>
						<td style="width: 9%">
						</td>
                        <td style="width: 1%" align="right">
                            <gw:button img="excel" alt="Report" id="btnReport2" onclick="OnReport('2')" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="8">
                            <gw:grid id='grdDetailTab3' 
								header='Slip No|Out Date|P/O No|Seq|Item Code|Item Name|_Size|_Color|UOM|Out Qty|U/Price|Item Amount|Tax Amount|Total Amount|CCY'
                                format='0|4|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|1|0|0|0|0|1|1|1|3|3|3|3|3|1' 
								check='||||||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								widths='1500|1200|1500|800|1500|2500|1500|1500|800|1200|1200|1500|1500|1500|800'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table border="1" style="width: 100%; height: 100%" name="By All Customer"> 
                    <tr style="height: 1%">
						<td>
							<table style="width: 100%; height: 100%">
								<tr>
			 						<td style="width: 5%">
			                            Month
			                        </td>
			                        <td style="width: 5%">
			                            <gw:datebox id="dtMonth" text="" maxlen="10" type="month" lang="<%=Session("Lang")%>"
			                                onchange="OnChangeMonth('BY-ALL-CUST')" />
			                        </td>
			                        <td style="width: 5%" align="right">
			                            Date
			                        </td>
			                        <td style="width: 20%; white-space: nowrap">
			                            <gw:datebox id="dtFrom_Date" text="" maxlen="10" type="date" lang="<%=Session("Lang")%>" />                                              
								  		~
			                            <gw:datebox id="dtTo_Date" text="" maxlen="10" type="date" lang="<%=Session("Lang")%>" />
			                        </td>
			                        <td style="width: 5%" align="right" >
			                            Customer
			                        </td>
			                        <td style="width: 20%">
			                            <gw:textbox id="txtCustTab2" styles='width:100%' onenterkey="OnSearch('Detail_Tab2')" />
			                        </td>
									<td style="width: 5%" align="right" >
			                            Item
			                        </td>
			                        <td style="width: 20%">
			                            <gw:textbox id="txtItemTab2" styles='width:100%' onenterkey="OnSearch('Detail_Tab2')" />
			                        </td>		
									<td style="width: 13%">
										<gw:list id="lstItemTypeTab2" styles='width:100%' />
									</td>
                                    <td style="width: 1%">
                                        <gw:button img="excel" alt="Report" id="btnReport3" onclick="OnReport('3')" />   
                                    </td>
			                        <td style="width: 1%">
			                            <gw:button id="ibtnSearch2" img="search" alt="Search" text="Search" onclick="OnSearch('Detail_Tab2')" />
			                        </td>								
								</tr>
							</table>
						</td>                       
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="11">
                            <gw:grid id='grdCustomer' header='_CCY|Customer ID|Customer Name|Sale Type|Item Type|Item Amount|Tax Amount|Total Amount|CCY'
                                format='0|0|0|0|0|0|0|0|0' 
								aligns='0|0|0|1|0|3|3|3|1' 
								check='||||||||' 
								editcol='0|0|0|0|0|0|0|0|0'
                                widths='0|1500|4000|1500|1500|1500|1500|1500|1000' 
								sorting='T' 
								styles='width:100%; height:100%' />
                        </td>
                    </tr>                
    </table>
	<table border="1" style="width: 100%; height: 100%" name="By Item"> 
                    <tr style="height: 1%">
						<td>
							<table style="width: 100%; height: 100%">
								<tr>
			 						<td style="width: 5%">
			                            Month
			                        </td>
			                        <td style="width: 5%">
			                            <gw:datebox id="dtMonthTab4" text="" maxlen="10" type="month" lang="<%=Session("Lang")%>"
			                                onchange="OnChangeMonth('BY-ITEM')" />
			                        </td>
			                        <td style="width: 5%" align="right">
			                            Date
			                        </td>
			                        <td style="width: 20%; white-space: nowrap">
			                            <gw:datebox id="dtFrom_DateTab4" text="" maxlen="10" type="date" lang="<%=Session("Lang")%>" />                                              
								  		~
			                            <gw:datebox id="dtTo_DateTab4" text="" maxlen="10" type="date" lang="<%=Session("Lang")%>" />
			                        </td>
			                       
									<td style="width: 5%" align="right" >
			                            Item
			                        </td>
			                        <td style="width: 20%">
			                            <gw:textbox id="txtItemTab4" styles='width:100%' onenterkey="OnSearch('BY-ITEM')" />
			                        </td>		
									<td style="width: 10%">
										<gw:list id="lstItemTypeTab4" styles='width:100%' />
									</td>
									
									<td style="width: 28%" align="right" >
			                             
			                        </td>
			                        <td style="width: 1%">
			                             <gw:button img="excel" alt="Report" id="btnReport4" onclick="OnReport('4')" /> 
			                        </td>
									
			                        <td style="width: 1%">
			                            <gw:button id="ibtnSearchTab4" img="search" alt="Search" text="Search" onclick="OnSearch('BY-ITEM')" />
			                        </td>								
								</tr>
							</table>
						</td>                       
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="11">
                            <gw:grid id='grdByItem' header='_CCY|Item Code|Item Name|UOM|Out Qty|Item Amount|Tax Amount|Total Amount|CCY'
                                format='0|0|0|0|0|0|0|0|0' 
								aligns='0|0|0|1|3|3|3|3|1' 
								check='||||||||' 
								editcol='0|0|0|0|0|0|0|0|0'
                                widths='0|1500|4000|1500|1500|1500|1500|1500|1000' 
								sorting='T' 
								styles='width:100%; height:100%' />
                        </td>
                    </tr>                
    </table>
    </gw:tab>
    <!-------------------------------------------------------------------------->
    <gw:textbox id="txtPartnerPK" styles='width:100%;display:none' />
    <gw:textbox id="txtDivisionPK" styles="width:100%;display:none" />
    <!-------------------------------------------------------------------------->
</body>
</html>
