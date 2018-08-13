<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Goods Delivery Checking</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
    var G_PARTNER 		= 0,
	    G_ORDER_DT 		= 1,
		G_SLIP_NO 		= 2,
		G_DEST_NATION	= 3,
		G_DEST_PORT		= 4,
        G_PO_NO 		= 5,
		G_SEQ 			= 6,
        G_ITEM_CODE 	= 7,
        G_ITEM_NAME 	= 8,
        G_CUST_ITEM 	= 9,
        G_ORD_UOM 		= 10,
		G_ITEM_ETD 		= 11,
        G_ORD_QTY 		= 12,
        G_PROD_QTY 		= 13,
		G_REQ_QTY 		= 14,
        G_OUT_QTY 		= 15,
        G_RETURN_QTY 	= 16,
        G_DELI_BAL 		= 17,
		G_STOCK_BAL 	= 18,
        G_DAYS_LEFT 	= 19,
        G_SO_D_PK 		= 20,
		G_REMARK 		= 21;
    //---------------------------------------------------------
    function BodyInit() 
	{
        System.Translate(document);
        dtFrom.SetDataText(System.AddDate(dtTo.GetData(), -7));

        OnFormatGrid();
    }
    //------------------------------------------------------------------------------------------------
    function OnFormatGrid() 
	{
        var sData = "";
        sData = "DATA|O|Order Date|E|ETD|D|Out Date";
        idList.SetDataText(sData);
        idList.value = 'O';

        sData = "DATA|1|Days Left < 3|2|Days Left >= 3 & < 10||";
        lstType.SetDataText(sData);
        lstType.value = '';

        grdDetail.GetGridControl().MergeCells = 2;
        grdDetail.GetGridControl().MergeCol(0) = true;
        grdDetail.GetGridControl().MergeCol(1) = true;
        grdDetail.GetGridControl().MergeCol(2) = true;
        grdDetail.GetGridControl().MergeCol(3) = true;
        grdDetail.GetGridControl().MergeCol(4) = true;
        grdDetail.GetGridControl().MergeCol(5) = true;
        grdDetail.GetGridControl().MergeCol(6) = true;
        grdDetail.GetGridControl().MergeCol(7) = true;
        grdDetail.GetGridControl().MergeCol(8) = true;
        grdDetail.GetGridControl().MergeCol(9) = true;
        grdDetail.GetGridControl().MergeCol(10) = true;

        var trl;

        trl = grdDetail.GetGridControl();
        trl.ColFormat(G_ORD_QTY) 	= "###,###,###,###,###.##";
        trl.ColFormat(G_REQ_QTY) 	= "###,###,###,###,###.##";
        trl.ColFormat(G_PROD_QTY) 	= "###,###,###,###,###.##";
        trl.ColFormat(G_OUT_QTY) 	= "###,###,###,###,###.##";
        trl.ColFormat(G_RETURN_QTY) = "###,###,###,###,###.##";
        trl.ColFormat(G_DELI_BAL) 	= "###,###,###,###,###.##";
        trl.ColFormat(G_STOCK_BAL) 	= "###,###,###,###,###.##";

        grdDetail.GetGridControl().Cell(7, 0, G_DELI_BAL,  0, G_DELI_BAL ) = 0x3300cc;
        grdDetail.GetGridControl().Cell(7, 0, G_STOCK_BAL, 0, G_STOCK_BAL) = 0xCC0000;
    }
    //---------------------------------------------------------   
    function OnSearch() 
	{
        data_dscd00040.Call('SELECT')
    }
    //---------------------------------------------------------
    function OnDataReceive(obj) 
	{
        switch (obj.id) 
		{
            case 'data_dscd00040':
			
                if (grdDetail.rows > 1) 
				{
                    grdDetail.SetCellBold(1, G_PO_NO, grdDetail.rows - 1, G_PO_NO, true);
                    grdDetail.SetCellBold(1, G_ORD_QTY, grdDetail.rows - 1, G_ORD_QTY, true);
                    grdDetail.SetCellBold(1, G_DELI_BAL, grdDetail.rows - 1, G_DELI_BAL, true);
                }

                for (i = 1; i < grdDetail.rows; i++) 
				{
                    if (grdDetail.GetGridData(i, G_DAYS_LEFT) < 3 && Number(grdDetail.GetGridData(i, G_DELI_BAL)) > 0) 
					{
                        grdDetail.SetCellFontColor(i, G_SEQ, i, G_DELI_BAL, 0x3300cc);
                    }
                    else if (grdDetail.GetGridData(i, G_DAYS_LEFT) >= 3 && grdDetail.GetGridData(i, G_DAYS_LEFT) < 10 && Number(grdDetail.GetGridData(i, G_DELI_BAL)) > 0) 
					{
                        grdDetail.SetCellFontColor(i, G_SEQ, i, G_DELI_BAL, 0xFF0000);
                    }
                    else if (Number(grdDetail.GetGridData(i, G_DELI_BAL)) < 0) 
					{
                        grdDetail.SetCellFontColor(i, G_SEQ, i, G_DELI_BAL, 0xFF00FF);
                    }
                    else {
                        grdDetail.SetCellFontColor(i, G_SEQ, i, G_DELI_BAL, 0x000000);
                    }
                }

                grdDetail.Subtotal(0, 2, -1, '12!13!14!15!16!17!18');
				
            break;
        }
    }
    //==================================================================================================
    function OnDateChange() {
        var strRad = radSearchDate.GetData();

        switch (strRad) 
		{
            case 'a':
                dtFrom.SetDataText(System.AddDate(dtTo.GetData(), -7));
                break;
				
            case 'b':
                dtFrom.SetDataText(System.AddDate(dtTo.GetData(), -14));
                break;
				
            case 'c':
                dtFrom.SetDataText(System.AddDate(dtTo.GetData(), -30));
                break;
        }
    }

    //==================================================================================================
    function OnPopUp() 
	{
        if (grdDetail.row > 0) 
		{
            if (grdDetail.col == G_OUT_QTY) 
			{
                txt_SO_D_PK.text = grdDetail.GetGridData(grdDetail.row, G_SO_D_PK);
                txt_Ref_No.text = grdDetail.GetGridData(grdDetail.row, G_PO_NO) + ' ( ' + grdDetail.GetGridData(grdDetail.row, G_SLIP_NO) + ' - ' + grdDetail.GetGridData(grdDetail.row, G_SEQ) + ' ) ';

                var url = System.RootURL + '/standard/forms/ds/cd/dscd00041.aspx';
                var aValue = System.OpenModal(url, 800, 450, 'resizable:yes;status:yes', this);
            }
            else if (grdDetail.col == G_RETURN_QTY) 
			{
                txt_SO_D_PK.text = grdDetail.GetGridData(grdDetail.row, G_SO_D_PK);
                txt_Ref_No.text = grdDetail.GetGridData(grdDetail.row, G_PO_NO) + ' ( ' + grdDetail.GetGridData(grdDetail.row, G_SLIP_NO) + ' - ' + grdDetail.GetGridData(grdDetail.row, G_SEQ) + ' ) ';

                var url = System.RootURL + '/standard/forms/ds/cd/dscd00042.aspx';
                var aValue = System.OpenModal(url, 800, 450, 'resizable:yes;status:yes', this);
            }
            else if (grdDetail.col == G_PROD_QTY) 
			{
                txt_SO_D_PK.text = grdDetail.GetGridData(grdDetail.row, G_SO_D_PK);
                txt_Ref_No.text = grdDetail.GetGridData(grdDetail.row, G_PO_NO) + ' ( ' + grdDetail.GetGridData(grdDetail.row, G_SLIP_NO) + ' - ' + grdDetail.GetGridData(grdDetail.row, G_SEQ) + ' ) ';

                var url = System.RootURL + '/standard/forms/ds/cd/dscd00043.aspx';
                var aValue = System.OpenModal(url, 800, 450, 'resizable:yes;status:yes', this);
            }
            else if (grdDetail.col == G_REQ_QTY) 
			{
                txt_SO_D_PK.text = grdDetail.GetGridData(grdDetail.row, G_SO_D_PK);
                txt_Ref_No.text = grdDetail.GetGridData(grdDetail.row, G_PO_NO) + ' ( ' + grdDetail.GetGridData(grdDetail.row, G_SLIP_NO) + ' - ' + grdDetail.GetGridData(grdDetail.row, G_SEQ) + ' ) ';

                var url = System.RootURL + '/standard/forms/ds/cd/dscd00044.aspx';
                var aValue = System.OpenModal(url, 800, 450, 'resizable:yes;status:yes', this);
            }
        }
    }
    //==================================================================================================
    function OnReport(pos) 
	{
        switch (pos) 
		{
            case '1':
                var url = System.RootURL + "/standard/reports/ds/cd/rpt_dscd00040.aspx?p_date_type=" + idList.value + "&p_from_dt=" + dtFrom.value + "&p_to_dt=" + dtTo.value + "&p_slip_cust=" + url_encode(txtSlipCust.text) + "&p_item=" + url_encode(txtItem.text) + "&p_bal_yn=" + chkBal.value + "&p_req_bal=" + chkReqBal.value + "&p_type=" + lstType.value;
                System.OpenTargetPage(url);
                break;

            case '2':
                var url = System.RootURL + "/standard/reports/ds/cd/rpt_dscd00041.aspx?p_date_type=" + idList.value + "&p_from_dt=" + dtFrom.value + "&p_to_dt=" + dtTo.value + "&p_slip_cust=" + url_encode(txtSlipCust.text);
                System.OpenTargetPage(url);
                break;
        }
    }

    //==================================================================================================

    function url_encode(s) 
	{
        string = s.replace(/\r\n/g, "\n");
        var utftext = "";

        for (var n = 0; n < string.length; n++) 
		{

            var c = string.charCodeAt(n);

            if (c < 128) 
			{
                utftext += String.fromCharCode(c);
            }
            else if ((c > 127) && (c < 2048)) 
			{
                utftext += String.fromCharCode((c >> 6) | 192);
                utftext += String.fromCharCode((c & 63) | 128);
            }
            else 
			{
                utftext += String.fromCharCode((c >> 12) | 224);
                utftext += String.fromCharCode(((c >> 6) & 63) | 128);
                utftext += String.fromCharCode((c & 63) | 128);
            }
        }
        return escape(utftext);
    }
    //==================================================================================================
	
</script>
<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_dscd00040" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_dscd00040" > 
                <input> 
                    <input bind="idList" /> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
                    <input bind="txtSlipCust" />
                    <input bind="txtItem" />  
                    <input bind="chkBal" /> 
					<input bind="chkReqBal" />
                    <input bind="chkReq" />
					<input bind="lstType" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%; background-color: #CCFFFF">
        <tr id='top' style="height: 1%">
            <td style="width: 10%" align="right">
                <gw:list id="idList" styles="color:blue;width:100%" value="O" onchange="OnSearch()" />
            </td>
            <td style="width: 20%; white-space: nowrap" align="left">
                <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" styles="width=80%" />
                ~
                <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" styles="width=80%" />
            </td>
            <td style="width: 5%" align="right">
                Item
            </td>
			<td style="width: 30%">
                <gw:list id="lstItemGroup" styles='width:100%;' onchange="OnSearch()"  />
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="center">
                Slip/Cust
            </td>
            <td style="width: 20%" align="right">
                <gw:textbox id="txtSlipCust" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td style="width: 5%" align="right">
                Type
            </td>
            <td style="width: 15%" colspan="5">
                <gw:list id="lstType" styles="color:purple;width:100%" value="O" onchange="OnSearch()" />
            </td>
        </tr>
        <tr id='top' style="height: 1%">
            <td style="width: 30%; white-space: nowrap" align="center" colspan="2">
                <gw:radio id="radSearchDate" value="a" styles="width:100%" onchange="OnDateChange()"> 
                                    <span value="a">1 Week</span> 
                                    <span value="b">2 Weeks</span> 
                                    <span value="c">1 Month</span> 
                            </gw:radio>
            </td>
            <td style="width: 25%; white-space: nowrap" align="center" colspan="2">
                Bal<gw:checkbox id="chkBal" defaultvalue="Y|N" value="Y" onchange="OnSearch()" />
                Req Bal<gw:checkbox id="chkReqBal" defaultvalue="Y|N" value="N" onchange="OnSearch()" />
            </td>
            <td style="width: 25%; white-space: nowrap" align="center" colspan="2">
                Req<gw:checkbox id="chkReq" defaultvalue="Y|N" value="N" onchange="OnSearch()" />
            </td>
            <td style="width: 5%; white-space: nowrap">
            </td>
            <td style="white-space: nowrap">
            </td>
            <td style="width: 1%">
                <gw:button img="select" alt="View Detail" id="btnSelect1" onclick="OnPopUp()" />
            </td>
            <td style="width: 1%">
                <gw:button img="excel" alt="Report" id="btnReport01" onclick="OnReport('1')" />
            </td>
            <td style="width: 1%">
                <gw:button img="excel" alt="Report" id="btnReport02" onclick="OnReport('2')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnSearch" img="search" alt="Search" text="Get Order" onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="13">
                <gw:grid id='grdDetail' header='Partner|Order DT|Slip No|Dest Nation|Dest Port|P/O No|Seq|Item Code|Item Name|Cust Item Name|UOM|ETD|Ord Qty|Prod Qty|Prod Bal|Req Qty|Out Qty|Return Qty|Deli Bal|Stock Bal|Days left|_tsa_saleorder_d_pk|Remark'
                    format='0|4|0|0|0|0|0|0|0|0|0|4|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|1|0|0|0|0|1|0|0|0|1|1|3|3|3|3|3|3|3|3|1|0|0'
                    check='||||||||||||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='2500|1200|1200|1200|1200|1500|800|1500|2500|2000|800|1200|1200|1200|1200|1200|1200|1200|1200|1200|1000|0|1000'
                    acceptnulldate="T" sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <gw:textbox id="txt_SO_D_PK" styles="width:100%; display:none" />
    <gw:textbox id="txt_Ref_No" styles="width:100%; display:none" />
</body>
</html>
