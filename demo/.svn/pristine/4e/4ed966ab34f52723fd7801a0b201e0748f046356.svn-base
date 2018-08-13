<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>S/O Consumption</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>

    var G1_SO_PK = 0,
    G1_Order_DT = 1,
    G1_PO_No = 2,
    G1_Style = 3,
    G1_PR_No = 4;

    var G_TSA_SALEORDER_PK = 0,
    G_MAT_PK = 1,
    G_Mat_Code = 2,
    G_Mat_Name = 3,
    G_Gross_Qty = 4,
    G_UOM = 5,
    G_Weight = 6,
    G_W_UOM = 7,
    G_Description = 8;

    //===============================================================
    function BodyInit() {
        //---------------------------
        txtRefPONo.SetEnable(false);
        dtFrom.SetDataText(System.AddDate(dtTo.GetData(), -30));
        //---------------------------     

        FormatGrid();
    }

    //===============================================================
    function FormatGrid() {
        var ctrl;

        ctrl = grdDetail.GetGridControl();

        ctrl.ColFormat(G_Gross_Qty) = "###,###,###.##";
        ctrl.ColFormat(G_Weight) = "###,###,###.##";

    }

    //===============================================================
    function OnSearch(pos) {
        if (pos == 'grdSearch') {
            data_dsos00010.Call("SELECT");
        }
        else if (pos == 'grdDetail') {
            if (grdSearch.row > 0) {
                txtOrderPK.text = grdSearch.GetGridData(grdSearch.row, G1_SO_PK);
                txtRefPONo.text = grdSearch.GetGridData(grdSearch.row, G1_PO_No);

                data_dsos00010_2.Call("SELECT");
            }
            else {
                alert('Pls select one SO.');
            }
        }
    }

    //===============================================================
    function OnDataReceive(p_oData) {
        switch (p_oData.id) {
            case 'pro_dsos00010':
                alert(txtReturnValue.text);

                OnSearch('grdDetail');
                break;

            case 'pro_dsos00010_1':
                alert(txtReturnValue.text);

                OnSearch('grdSearch');
                break;

            case 'pro_dsos00010_2':
                alert(txtReturnValue.text);
                break;

            case 'pro_dsos00010_3':
                alert(txtReturnValue.text);
                break;

            case 'data_dsos00010':
                for (var i = 1; i < grdSearch.rows; i++) {
                    if (grdSearch.GetGridData(i, G1_PR_No) != '') {
                        grdSearch.SetCellBgColor(i, 0, i, grdSearch.cols - 1, 0xCCFFFF);
                    }
                }
                break;

            case 'data_dsos00010_2':
                lblRecord.text = grdDetail.rows - 1 + " record(s)";
                break;
        }
    }
    //===============================================================

    function OnProcess(pos) {
        if (txtOrderPK.text != '') {
            switch (pos) {
                case 'Cons':
                    txtOrderListPK.text = '';

                    for (i = 0; i < grdSearch.GetGridControl().SelectedRows; i++) {
                        var row = grdSearch.GetGridControl().SelectedRow(i);
                        txtOrderListPK.text = txtOrderListPK.text + "," + grdSearch.GetGridData(row, G1_SO_PK);
                    }

                    txtOrderListPK.text = txtOrderListPK.text.substr(1);

                    if (txtOrderListPK.text != '') {
                        pro_dsos00010.Call();
                    }
                    else {
                        alert("Please select one order to make consumption!!!");
                    }
                    break;

                case 'TOReq':
                    var path = System.RootURL + "/standard/forms/ds/os/dsos00011.aspx";
                    var object = System.OpenModal(path, 600, 350, 'resizable:yes;status:yes');
                    break;

                case 'MR':

                    txtOrderListPK.text = '';

                    for (i = 0; i < grdSearch.GetGridControl().SelectedRows; i++) {
                        var row = grdSearch.GetGridControl().SelectedRow(i);
                        txtOrderListPK.text = txtOrderListPK.text + "," + grdSearch.GetGridData(row, G1_SO_PK);
                    }

                    txtOrderListPK.text = txtOrderListPK.text.substr(1);

                    if (txtOrderListPK.text != '') {
                        pro_dsos00010_1.Call();
                    }
                    else {
                        alert("Please select one order to make consumption!!!");
                    }
                    break;

                case 'Cancel_MR':

                    txtOrderListPK.text = '';

                    for (i = 0; i < grdSearch.GetGridControl().SelectedRows; i++) {
                        var row = grdSearch.GetGridControl().SelectedRow(i);
                        txtOrderListPK.text = txtOrderListPK.text + "," + grdSearch.GetGridData(row, G1_SO_PK);
                    }

                    txtOrderListPK.text = txtOrderListPK.text.substr(1);

                    if (txtOrderListPK.text != '') {
                        pro_dsos00010_3.Call();
                    }
                    else {
                        alert("Please select one order to make consumption!!!");
                    }
                    break;

            }
        }
        else {
            alert('Pls select one Sale Order.');
        }
    }

    //===============================================================
    function OnPrint() {
        var url = System.RootURL + '/standard/reports/ds/os/rpt_dsos00010.aspx?p_tsa_saleorder_pk=' + txtOrderPK.text;
        window.open(url);
    }
</script>

<body>
    <!--------------------------------------------------------->
    <gw:data id="data_dsos00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"   parameter="0,1,2,3" function="st_lg_sel_dsos00010" > 
                <input> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="txtSearchNo" />                     
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------->
    <gw:data id="data_dsos00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" function="st_lg_sel_dsos00010_2" > 
                  <input > 
                          <input bind="txtOrderPK" />                 
                  </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------->
    <gw:data id="pro_dsos00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsos00010" > 
                <input>
                     <input bind="txtOrderListPK" /> 
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------->
    <gw:data id="pro_dsos00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsos00010_1" > 
                <input>
                     <input bind="txtOrderListPK" /> 
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------->
    <gw:data id="pro_dsos00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsos00010_2" > 
                <input>
                     <input bind="txtOrderListPK" /> 
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------->
    <gw:data id="pro_dsos00010_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsos00010_3" > 
                <input>
                     <input bind="txtOrderListPK" /> 
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td style="width: 35%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
                        <td align="right" style="width: 20%">
                            <b>Date</b>
                        </td>
                        <td style="width: 79%">
                            <gw:datebox id="dtFrom" lang="1" styles="width:100%" />
                            ~<gw:datebox id="dtTo" lang="1" styles="width:100%" />
                        </td>
                        <td style="width: 1%" align='right'>
                            <gw:button id="btnSearch01" img="search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td align="right" style="width: 20%; white-space: nowrap">
                            Search No
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtSearchNo" styles="width:100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 94%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|Date|P/O No|Style|P/R No" format="0|4|0|0|0"
                                aligns="0|1|0|0|0" defaults="||||" editcol="0|0|0|0|0" widths="0|1200|1500|1500|1000"
                                styles="width:100%; height:100%" sorting="T" acceptnulldate="true" param="0,1,2,3,4"
                                oncellclick="OnSearch('grdDetail')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 65%; height: 99%">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td colspan="5">
                            <table style="width: 100%; height: 100%; background-color: #B4E7FF">
                                <tr style="height: 1%">
                                    <td style="width: 97%; white-space: nowrap" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnPrint()" />
                                    </td>
                                    <td style="width: 1%; white-space: nowrap">
                                        <gw:button id="idBtnTOReq" img="Make Outgoing Req" text="Make Outgoing Req" onclick="OnProcess('TOReq')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="idBtnMR" img="Make P/R" text="Make P/R"  onclick="OnProcess('MR')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="idBtnCancelMR" img="Cancel P/R" text="Cancel P/R" onclick="OnProcess('Cancel_MR')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%; white-space: nowrap" align="right">
                            SO/PO No
                        </td>
                        <td style="width: 40%">
                            <gw:textbox id="txtRefPONo" styles="width:100%" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="idBtnConsLoading" img="Load Cons" text="Load Cons" onclick="OnProcess('Cons')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSearch02" img="search" alt="Search" onclick="OnSearch('grdDetail')" />
                        </td>
                        <td style="width: 38%" align="center">
                            <gw:label id="lblRecord" styles="color: blue">record(s)</gw:label>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="5">
                            <gw:grid id='grdDetail' header='_TSA_SALEORDER_PK|_MAT_PK|Mat Code|Mat Name|Gross Qty|UOM|Weight|W.UOM|Description'
                                format='0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|3|1|3|1|0' defaults='||||||||' editcol='0|0|0|0|0|0|0|0|0'
                                widths='1000|1000|2000|3500|1200|1000|1200|1000|1000' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------->
<gw:textbox id="txtOrderPK" styles="width:100%; display:none" />
<gw:textbox id="txtOrderListPK" styles="width:100%; display:none" />
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" />
<!------------------------------------------------------------------->
</html>
