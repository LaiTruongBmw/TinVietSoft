<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>STOCK ADJUST IN</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
    <script>

        //============================================================================================
        function BodyInit() {
            System.Translate(document);
            var ldate;
            ldate = dtFrom.value;
            ldate = ldate.substr(0, 4) + ldate.substr(4, 2) + "01";
            dtFrom.value = ldate;

        }

        //============================================================================================

        function OnSearch() {
            data_bisl00040.Call("SELECT");
        }
        //============================================================================================
        function OnDataReceive(obj) {
            switch (obj.id) {
                case 'pro_bisl00040':
                    alert(txtReturnValue.text);
                    txtMasterPK.text = grdDetail.GetGridData(grdDetail.row, G1_PK);

                    data_bisl00040_2.Call();
                    break;
            }
        }
        //============================================================================================
        function OnSearchBC() {
            txtMasterPK.text = grdDetail.GetGridData(grdDetail.row, G1_PK);
            data_bisl00040_2.Call();
        }
    </script>
</head>
<body>
    <!------------------------------------------------------------------------>
    <!---------------------------------------------------------------->
    <gw:data id="data_bisl00040" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_bisl00040"> 
                <input> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />
                    <input bind="txtLabelNo" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------>
    <table width="100%" style="height: 100%" border="0">
        <tr style="height: 2%">
            <td width="4%" align="right">
                <b>Date</b>
            </td>
            <td width="5%">
                <gw:datebox id="dtFrom" lang="1" />
            </td>
            <td width="1%" align="center">
                <b>~</b>
            </td>
            <td width="5%">
                <gw:datebox id="dtTo" lang="1" />
            </td>
            <td style="white-space: nowrap; width: 8%" align="right">
                <b>Print Type</b>
            </td>
            <td width="25%">
                <gw:list id="lstPrintType" styles="width:100%" />
            </td>
            <td width="8%" align="right">
                <b>Label Type</b>
            </td>
            <td width="16%">
                <gw:list id="lstLabelType" styles="width:100%" />
            </td>
            <td align="right" style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Detail')" />
            </td>
        </tr>
        <tr style="height: 2%">
            <td style="white-space: nowrap; width: 5%" align="right">
                <b>Barcode No</b>
            </td>
            <td width="20%" colspan="3">
                <gw:textbox id="txtLabelNo" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td style="white-space: nowrap; width: 7%" align="right">
                <b>Item Code</b>
            </td>
            <td width="15%">
                <gw:textbox id="txtItemCode" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td style="white-space: nowrap; width: 10%" align="right">
                <b>Partner Name</b>
            </td>
            <td width="15%">
                <gw:textbox id="txtPartner_Name" styles="width:100%" onenterkey="OnSearch()" />
            </td>
        </tr>
        <tr style="height: 96%">
            <td colspan="9" style="width: 60%">
                <table width="100%" style="height: 100%" border="1">
                    <tr>
                        <td>
                            <gw:grid id='grdDetail' header='Item Barcode|Create Date|Lot No|In Time|In By|Out Time|Out By'
                                format='0|4|0|0|0|0|0' aligns='0|0|0|0|0|0|0' check='||||||' editcol='1|1|1|1|1|1|1'
                                widths='1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:list id="lstBookingCcy_Tmp" style="display: none"></gw:list>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="display:none;" />
<gw:textbox id="txtDate" styles="display:none;" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" />
<gw:textbox id="txtArrayPOPK" styles='width:100%;display:none' />
<!---------------------------------------------------------------------------------->
</html>
