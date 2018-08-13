<!-- #include file="../../../system/lib/form.inc"  -->
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Overall Adjustment of Unit Price</title>
</head>
<script>
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
  System.Translate(document);
  
}
//-------------------------------------------
function OnSearch()
{
    
	
}

//-------------------------------------------
function OnSelect()
{
    

    
}

</script>

<body>
    <!------------------------------->
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="width: 100%; height: 5%">
            <td style="width: 92%">
            </td>
            <td style="width: 4%">
                <gw:imgbtn id="ibtnUpdate" img="save" alt="Save" onclick="OnSave()" />
            </td>
            <td style="width: 4%">
                <gw:imgbtn id="ibtnCancel" img="cancel" alt="Close" />
            </td>
        </tr>
        <tr style="width: 100%; height: 95%">
            <td width="100%" colspan="3">
                <table style="width: 100%; height: 100%" border="1">
                    <tr style="height: 1%">
                        <td style="width: 25%" align="center">
                            Adjustment Basis</td>
                        <td style="width: 75%" align="center">
                            Adjustment Method</td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 25%" align="center">
                            Unit Price of Main Contract</td>
                        <td style="width: 75%">
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 1%">
                                    <td style="width: 10%; white-space: nowrap">
                                        Material Cost
                                    </td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtMaterialCost" styles='width:100%' />
                                    </td>
                                    <td style="width: 1%">
                                        %
                                    </td>
                                    <td style="width: 10%; white-space: nowrap">
                                        Labor Cost
                                    </td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtLaborCost" styles='width:100%' />
                                    </td>
                                    <td style="width: 1%">
                                        %
                                    </td>
                                    <td style="width: 10%; white-space: nowrap">
                                        Expenses
                                    </td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtExpenses" styles='width:100%' />
                                    </td>
                                    <td style="width: 1%">
                                        %
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td style="width: 25%" align="center">
                            Applied to</td>
                        <td style="width: 75%">
                            <table style="width: 100%; height: 100%" border="1">
                                <tr style="height: 1%">
                                    <td style="width: 65%; white-space: nowrap">
                                        <table style="width: 100%; height: 100%">
                                            <tr>
                                                <td style="width: 10%">
                                                    SubContract
                                                </td>
                                                <td style="width: 55%">
                                                    <gw:textbox id="txtSubContCode" styles='width:30%' />
                                                    <gw:textbox id="txtSubContName" styles='width:69%' />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 35%">
                                        <gw:radio id="radTab" value="1" styles="width:100%" > 
                                            <span value="1" id="Span1">Selected rows </span> 
								            <span value="2" id="Span2">Selected Work Division</span>
								            <span value="3" id="Span3">All Budget Detail </span>
                                        </gw:radio>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="iduser_pk" styles="display:none; " />
</body>
</html>
