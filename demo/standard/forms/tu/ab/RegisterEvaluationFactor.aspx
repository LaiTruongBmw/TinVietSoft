<!-- #include file="../../../system/lib/form.inc"  -->
<html>
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <table width="100%">
        <tr style="height:4%">
            <td>
                <table width="100%">
                    <tr>
                        <td>
                            Evaluation Group
                        </td>
                        <td width="3%"></td>
                        <td style="width: 20%">
                            <gw:list id="lstOrderType" styles="width:100%;" />
                        </td>
                        <td width="49%">
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="btnNew" img="new" alt="Add New" text="Add New" onclick="OnNew()" />
                        </td>
                        <td width="3%">
                            <gw:imgbtn id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
                        </td>
                        <td widh="3%">
                            <gw:imgbtn id="btnSave" img="Save" alt="Save" text="Save" onclick="onsave()"></gw:imgbtn>
                        </td>
                        <td wdth="3%">
                            <gw:imgbtn id="btnConfirm" img="confirm" alt="Confirm" text="Confirm" onclick="OnConfirm()"></gw:imgbtn>
                        </td>
                    </tr>
                </table>
            </td> 
        </tr>
        <tr style="height: 96%">
            <td colspan="6">
                <gw:grid id="grdOrderDetail" header='ELEMENT|CONTENTS|MBO Y/N|CONTENTS  DESCRIPTION|WEIGHT'
                    format='0|0|0|0|0' aligns='1|3|0|0|3' defaults='||||' editcol='0|0|1|1|1'
                    widths='0|2000|2000|3000|0' sorting='T' styles='width:100%; height:100%'
                    oncelldblclick="OnSelect()" />
            </td>
        </tr>
    </table>
</body>
</html>
