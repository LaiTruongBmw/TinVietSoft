<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>Daily Stock Checking</title>
</head>

<script>

    var G1_GRAND_TOTAL = 0,
        G1_CUSTOMER = 1,
        G1_SO_NO = 2,
        G1_PO_NO = 3,
        G1_ITEM_CODE = 4,
        G1_STYLE = 5,
        G1_MATERIAL = 6,
        G1_SIZE = 7,
        G1_PATERN = 8,
        G1_COLOR = 9,
        G1_UNIT =10,
        G1_ORDER_QTY = 11,
        G1_BALANCE = 12,
        G1_DAY_01 = 13,
        G1_DAY_02 = 14,
        G1_DAY_03 = 15,
        G1_DAY_04 = 16,
        G1_DAY_05 = 17,
        G1_DAY_06 = 18,
        G1_DAY_07 = 19,
        G1_DAY_08 = 20,
        G1_DAY_09 = 21,
        G1_DAY_10 = 22,
        G1_T_DELIVERY = 23,
        G1_T_PROD = 24,
        G1_BAL_PROD = 25,
        G1_T_TAKEOUT = 26,
        G1_BAL_TAKEOUT = 27;
        

    var G2_DAY_01 = 0,
        G2_DAY_02 = 1,
        G2_DAY_03 = 2,
        G2_DAY_04 = 3,
        G2_DAY_05 = 4,
        G2_DAY_06 = 5,
        G2_DAY_07 = 6,
        G2_DAY_08 = 7,
        G2_DAY_09 = 8,
        G2_DAY_10 = 9,
        G2_HEADER_01 = 10,
        G2_HEADER_02 = 11,
        G2_HEADER_03 = 12,
        G2_HEADER_04 = 13,
        G2_HEADER_05 = 14,
        G2_HEADER_06 = 15,
        G2_HEADER_07 = 16,
        G2_HEADER_08 = 17,
        G2_HEADER_09 = 18,
        G2_HEADER_10 = 19;

    //=============================================================================             
    function BodyInit() {
        System.Translate(document);

        grdINOUT.GetGridControl().ScrollTrack = true;
        grdINOUT.GetGridControl().FrozenCols = 5;
        //grdINOUT.GetGridControl().ColHidden(1) = true;
        //FormatGrid();

        //-----------------     

       OnSearch('HEADER');
    }
    //=============================================================================           
    function FormatGrid() {
        var data;

        data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||Select ALL";
    lstWHType.SetDataText(data);
    lstWHType.value = '';

    data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from tlg_in_warehouse where del_if = 0 and use_yn='Y' order by wh_id")%>";
    lstWarehouse.SetDataText(data + "||");
    lstWarehouse.value = '';

    data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||";
    lstGroup.SetDataText(data);
    lstGroup.value = '';

    data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    lstLang.SetDataText(data);
    lstLang.value = "<%=Session("SESSION_LANG")%>";

    data = "data|10|Qty|20|Ref Qty|30|ALL";
    lstType.SetDataText(data);
    lstType.value = '10';

    var ctrl = grdINOUT.GetGridControl();

    ctrl.ColFormat(G1_BEGIN_QTY) = "###,###,###.##";
    ctrl.ColFormat(G1_IN_01) = "###,###,###.##";
    ctrl.ColFormat(G1_OUT_01) = "###,###,###.##";
    ctrl.ColFormat(G1_IN_02) = "###,###,###.##";
    ctrl.ColFormat(G1_OUT_02) = "###,###,###.##";
    ctrl.ColFormat(G1_IN_03) = "###,###,###.##";
    ctrl.ColFormat(G1_OUT_03) = "###,###,###.##";
    ctrl.ColFormat(G1_IN_04) = "###,###,###.##";
    ctrl.ColFormat(G1_OUT_04) = "###,###,###.##";
    ctrl.ColFormat(G1_IN_05) = "###,###,###.##";
    ctrl.ColFormat(G1_OUT_05) = "###,###,###.##";
    ctrl.ColFormat(G1_IN_06) = "###,###,###.##";
    ctrl.ColFormat(G1_OUT_06) = "###,###,###.##";
    ctrl.ColFormat(G1_IN_07) = "###,###,###.##";
    ctrl.ColFormat(G1_OUT_07) = "###,###,###.##";
    ctrl.ColFormat(G1_IN_08) = "###,###,###.##";
    ctrl.ColFormat(G1_OUT_08) = "###,###,###.##";
    ctrl.ColFormat(G1_IN_09) = "###,###,###.##";
    ctrl.ColFormat(G1_OUT_09) = "###,###,###.##";
    ctrl.ColFormat(G1_IN_10) = "###,###,###.##";
    ctrl.ColFormat(G1_OUT_10) = "###,###,###.##";
    ctrl.ColFormat(G1_END_QTY) = "###,###,###.##";

    ctrl.MergeCells = 2;

    ctrl.MergeCol(0) = true;
    ctrl.MergeCol(1) = true;
    ctrl.MergeCol(2) = true;
    ctrl.MergeCol(3) = true;
    ctrl.MergeCol(4) = true;

    ctrl.FrozenCols = G1_ITEM_NAME;

}
//=============================================================================             
function OnSearch(id) {
    switch (id) {
        case 'BALANCE':
            //---------------------  			     
            data_dscd00110_1.Call('SELECT');
            break;

        case 'HEADER':
            //--------------------------
            data_dscd00110.Call('SELECT');
            break;
    }
}

//=============================================================================             
function OnDataReceive(obj) {
    switch (obj.id)
    {
        case 'data_dscd00110_1':
            if (grdINOUT.rows > 1)
            {
                var fg = grdINOUT.GetGridControl();

                fg.MergeRow(0) = true;
                fg.Cell(0, 0, G1_DAY_01, 0, G1_DAY_01) = grdHeader.GetGridData(1, G2_HEADER_01);
                fg.Cell(0, 0, G1_DAY_02, 0, G1_DAY_02) = grdHeader.GetGridData(1, G2_HEADER_02);
                fg.Cell(0, 0, G1_DAY_03, 0, G1_DAY_03) = grdHeader.GetGridData(1, G2_HEADER_03);
                fg.Cell(0, 0, G1_DAY_04, 0, G1_DAY_04) = grdHeader.GetGridData(1, G2_HEADER_04);
                fg.Cell(0, 0, G1_DAY_05, 0, G1_DAY_05) = grdHeader.GetGridData(1, G2_HEADER_05);
                fg.Cell(0, 0, G1_DAY_06, 0, G1_DAY_06) = grdHeader.GetGridData(1, G2_HEADER_06);
                fg.Cell(0, 0, G1_DAY_07, 0, G1_DAY_07) = grdHeader.GetGridData(1, G2_HEADER_07);
                fg.Cell(0, 0, G1_DAY_08, 0, G1_DAY_08) = grdHeader.GetGridData(1, G2_HEADER_08);
                fg.Cell(0, 0, G1_DAY_09, 0, G1_DAY_09) = grdHeader.GetGridData(1, G2_HEADER_09);
                fg.Cell(0, 0, G1_DAY_10, 0, G1_DAY_10) = grdHeader.GetGridData(1, G2_HEADER_10);

                grdINOUT.SetCellBold(1, G1_ITEM_CODE, grdINOUT.rows - 1, G1_ITEM_CODE, true);

                grdINOUT.SetCellBgColor(1, G1_DAY_01, grdINOUT.rows - 1, G1_DAY_01, 0xCCFFFF);
                grdINOUT.SetCellBgColor(1, G1_DAY_02, grdINOUT.rows - 1, G1_DAY_02, 0xCCFFFF);
                grdINOUT.SetCellBgColor(1, G1_DAY_03, grdINOUT.rows - 1, G1_DAY_03, 0xCCFFFF);
                grdINOUT.SetCellBgColor(1, G1_DAY_04, grdINOUT.rows - 1, G1_DAY_04, 0xCCFFFF);
                grdINOUT.SetCellBgColor(1, G1_DAY_05, grdINOUT.rows - 1, G1_DAY_05, 0xCCFFFF);
                grdINOUT.SetCellBgColor(1, G1_DAY_06, grdINOUT.rows - 1, G1_DAY_06, 0xCCFFFF);
                grdINOUT.SetCellBgColor(1, G1_DAY_07, grdINOUT.rows - 1, G1_DAY_07, 0xCCFFFF);
                grdINOUT.SetCellBgColor(1, G1_DAY_08, grdINOUT.rows - 1, G1_DAY_08, 0xCCFFFF);
                grdINOUT.SetCellBgColor(1, G1_DAY_09, grdINOUT.rows - 1, G1_DAY_09, 0xCCFFFF);
                grdINOUT.SetCellBgColor(1, G1_DAY_10, grdINOUT.rows - 1, G1_DAY_10, 0xCCFFFF);

                grdINOUT.SetCellBgColor(1, G1_DAY_01, grdINOUT.rows - 1, G1_DAY_01, 0xFFFFCC);
                grdINOUT.SetCellBgColor(1, G1_DAY_02, grdINOUT.rows - 1, G1_DAY_02, 0xFFFFCC);
                grdINOUT.SetCellBgColor(1, G1_DAY_03, grdINOUT.rows - 1, G1_DAY_03, 0xFFFFCC);
                grdINOUT.SetCellBgColor(1, G1_DAY_04, grdINOUT.rows - 1, G1_DAY_04, 0xFFFFCC);
                grdINOUT.SetCellBgColor(1, G1_DAY_05, grdINOUT.rows - 1, G1_DAY_05, 0xFFFFCC);
                grdINOUT.SetCellBgColor(1, G1_DAY_06, grdINOUT.rows - 1, G1_DAY_06, 0xFFFFCC);
                grdINOUT.SetCellBgColor(1, G1_DAY_07, grdINOUT.rows - 1, G1_DAY_07, 0xFFFFCC);
                grdINOUT.SetCellBgColor(1, G1_DAY_08, grdINOUT.rows - 1, G1_DAY_08, 0xFFFFCC);
                grdINOUT.SetCellBgColor(1, G1_DAY_09, grdINOUT.rows - 1, G1_DAY_09, 0xFFFFCC);
                grdINOUT.SetCellBgColor(1, G1_DAY_10, grdINOUT.rows - 1, G1_DAY_10, 0xFFFFCC);

                var ctr = grdINOUT.GetGridControl();
                ctr.OutlineBar = 2;

                for (var itotal = 11; itotal <= 27; itotal++)
                {                    
                    ctr.SubTotal(2, 0, itotal, '', 0x99FF99, 0x000000, '1', 'Grand Total', '', true);
                    //alert(1);
                }

                ctr.MergeCells  = 3;                ctr.MergeCol(0) = true;                ctr.MergeCol(1) = true;                ctr.MergeCol(2) = true;                ctr.MergeCol(3) = true;

            }
            break;

        case 'data_dscd00110':
            if (grdHeader.rows > 1) {
                var fg = grdINOUT.GetGridControl();

                fg.MergeRow(0) = true;
                fg.Cell(0, 0, G1_DAY_01, 0, G1_DAY_01) = grdHeader.GetGridData(1, G2_HEADER_01);
                fg.Cell(0, 0, G1_DAY_02, 0, G1_DAY_02) = grdHeader.GetGridData(1, G2_HEADER_02);
                fg.Cell(0, 0, G1_DAY_03, 0, G1_DAY_03) = grdHeader.GetGridData(1, G2_HEADER_03);
                fg.Cell(0, 0, G1_DAY_04, 0, G1_DAY_04) = grdHeader.GetGridData(1, G2_HEADER_04);
                fg.Cell(0, 0, G1_DAY_05, 0, G1_DAY_05) = grdHeader.GetGridData(1, G2_HEADER_05);
                fg.Cell(0, 0, G1_DAY_06, 0, G1_DAY_06) = grdHeader.GetGridData(1, G2_HEADER_06);
                fg.Cell(0, 0, G1_DAY_07, 0, G1_DAY_07) = grdHeader.GetGridData(1, G2_HEADER_07);
                fg.Cell(0, 0, G1_DAY_08, 0, G1_DAY_08) = grdHeader.GetGridData(1, G2_HEADER_08);
                fg.Cell(0, 0, G1_DAY_09, 0, G1_DAY_09) = grdHeader.GetGridData(1, G2_HEADER_09);
                fg.Cell(0, 0, G1_DAY_10, 0, G1_DAY_10) = grdHeader.GetGridData(1, G2_HEADER_10);

                txtDay01.text = grdHeader.GetGridData(1, G2_DAY_01);
                txtDay02.text = grdHeader.GetGridData(1, G2_DAY_02);
                txtDay03.text = grdHeader.GetGridData(1, G2_DAY_03);
                txtDay04.text = grdHeader.GetGridData(1, G2_DAY_04);
                txtDay05.text = grdHeader.GetGridData(1, G2_DAY_05);
                txtDay06.text = grdHeader.GetGridData(1, G2_DAY_06);
                txtDay07.text = grdHeader.GetGridData(1, G2_DAY_07);
                txtDay08.text = grdHeader.GetGridData(1, G2_DAY_08);
                txtDay09.text = grdHeader.GetGridData(1, G2_DAY_09);
                txtDay10.text = grdHeader.GetGridData(1, G2_DAY_10);

                OnSearch('BALANCE');
            }
            else {
                alert('Pls check search date .');
            }

            break;
    }
}
//============================================================================= 
function OnPopUp(pos) {
    switch (pos)
    {
        case '1':
            var path = System.RootURL + '/standard/reports/ds/cd/rpt_dscd00110_1_ens.aspx';            
            break;
        case '2':
            var path = System.RootURL + '/standard/reports/ds/cd/rpt_dscd00110_2_ens.aspx';
            break;
        case '3':
            var path = System.RootURL + '/standard/reports/ds/cd/rpt_dscd00110_3_ens.aspx';
            break;
    }
    path += '?p_so_no=' + txtSONo.text + '&p_cus_id=' + txtCusID.text + '&p_item=' + txtItemCode.text;
    path += '&p_day01=' + txtDay01.text + '&p_day10=' + txtDay10.text;
    System.OpenTargetPage(path);
}
//============================================================================= 
function OnReport(pos) {
    switch (pos) {
        case 'ST01':
            var url = System.RootURL + "/standard/reports/ds/cd/rpt_dscd00120_ST01.aspx?p_wh_pk=" + lstWarehouse.value + "&p_group_pk=" + lstGroup.value + "&p_item=" + txtItem.text + "&p_date=" + txtDate.value;
            System.OpenTargetPage(url);
            break;

        case 'ST02':
            var url = System.RootURL + "/standard/reports/ds/cd/rpt_dscd00120_ST02.aspx?p_wh_pk=" + lstWarehouse.value + "&p_group_pk=" + lstGroup.value + "&p_item=" + txtItem.text + "&p_date=" + txtDate.value;
            System.OpenTargetPage(url);
            break;

    }

}
//=============================================================================                       
</script>

<body>
    <!---------------------------------------------------------------->
   
    <!--------------------------------------------------------------------->
    
    <gw:data id="data_dscd00110_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="st_lg_SEL_dscd00110_1_ENS"  >
                <input bind="grdINOUT" >		
			        <input bind="txtSONo" />
                    <input bind="txtCusID" />
                    <input bind="txtItemCode" />
					<input bind="txtDay01" />
					<input bind="txtDay02" />  
					<input bind="txtDay03" />
					<input bind="txtDay04" /> 
					<input bind="txtDay05" />
					<input bind="txtDay06" /> 
					<input bind="txtDay07" />
					<input bind="txtDay08" /> 	
					<input bind="txtDay09" /> 
					<input bind="txtDay10" /> 							
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data> 
    <!--------------------------------------------------------------------->
    <gw:data id="data_dscd00110" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="st_lg_SEL_dscd00110_ens"  >
                <input bind="grdHeader" >
					<input bind="idDate" />					 								 													      			       
                </input>
                <output bind="grdHeader" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Stock Status">
        <tr>
            <td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td>
            <td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td>
            <td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td>
            <td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td>
            <td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td>
            <td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td>
            <td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td>
            <td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td>
            <td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td>
            <td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td><td style="width:2%"></td>
        </tr>
        <tr>
            <td colspan="5" align="right">
                Date
            </td>
            <td colspan="5" align="right">
                <gw:datebox id="idDate" lang="1" onchange="OnSearch('HEADER')" type="date" />
            </td>            
            <td colspan="5" align="right">
                S/O No
            </td>
            <td colspan="5" align="right">
               <gw:textbox id="txtSONo" maxlen="100" styles='width:100%' onenterkey="OnSearch('BALANCE')" />
            </td>
            <td colspan="5" align="right" >
				CusID/Name                
            </td>
            <td colspan="5" style="width: 13%">
                <gw:textbox id="txtCusID" maxlen="100" styles='width:100%' onenterkey="OnSearch('BALANCE')" />
            </td>
            <td colspan="5" align="right">
                Item Code                
            </td>
            <td  colspan="5">
                <gw:textbox id="txtItemCode" maxlen="100" styles='width:100%' onenterkey="OnSearch('BALANCE')" />
                
            </td>
            <td  colspan="1">                
                <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('BALANCE')" />
            </td>
            <td colspan="1" align="right">                
                <gw:button id="ibtnReport1" img="excel" alt="Delivery Report" text="Delivery Report" onclick="OnPopUp('1')" />
            </td>
            <td colspan="1" align="right">                
                <gw:button id="ibtnReport2" img="excel" alt="Delivery Schedule" text="Delivery Schedule" onclick="OnPopUp('2')" />
            </td>
            <td colspan="1" align="right">                
                <gw:button id="ibtnReport3" img="excel" alt="Report" text="Report" onclick="OnPopUp('3')" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="50">
                <gw:grid id='grdINOUT' 
                    header='|Customer|S/O No|P/O No|Item Code|Style|Material|Size|Patern|Color|Unit|Order Qty|Balance|01|02|03|04|05|06|07|_08|_09|_10|T.Delivery|T.Product|Bal.Prod|T.Takeout|Bal.Takeout'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='1500|1500|1500|1500|3000|1500|1500|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
</body>
<gw:textbox id="txtDay01" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtDay02" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtDay03" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtDay04" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtDay05" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtDay06" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtDay07" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtDay08" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtDay09" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtDay10" maxlen="100" styles='width:100%;display:none' />

<gw:grid id='grdHeader' 
	header='L_DAY_01|L_DAY_02|L_DAY_03|L_DAY_04|L_DAY_05|L_DAY_06|L_DAY_07|L_DAY_08|L_DAY_09|L_DAY_10|DAY01|DAY02|DAY03|DAY04|DAY05|DAY06|DAY07|DAY08|DAY09|DAY10'
    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
	aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
	widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|0|0|0|0|0|0'
    styles='width:100%; height:460' />
</html>
