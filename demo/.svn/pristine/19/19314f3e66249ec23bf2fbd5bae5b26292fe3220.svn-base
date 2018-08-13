<!-- #include file="../../../system/lib/form.inc"  -->
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">

<script>
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
  System.Translate(document);
}
//-------------------------------------------
function OnPopUp(pos)
{
    switch(pos)
    {
        case'Overrall':
            var path = System.RootURL + '/form/61/04/61040050_Overall.aspx';
            var object = System.OpenModal( path ,700 , 170 , 'resizable:yes;status:yes');  
        break;
        case'Divide':
            var path = System.RootURL + '/form/61/04/61040050_Divide.aspx';
            var object = System.OpenModal( path ,900 , 300 , 'resizable:yes;status:yes');  
        break;
        
        case'LinkTo':
            var path = System.RootURL + '/form/61/04/61040050_LinktoMain.aspx';
            var object = System.OpenModal( path ,800 , 300 , 'resizable:yes;status:yes');  
        break;
        case'VerifyData':
            var path = System.RootURL + '/form/61/04/61040050_VerifyData.aspx';
            var object = System.OpenModal( path ,900 , 500 , 'resizable:yes;status:yes');  
        break;
        case'RecSubData':
            var path = System.RootURL + '/form/61/04/61040050_RecSubData.aspx';
            var object = System.OpenModal( path ,900 , 500 , 'resizable:yes;status:yes');  
        break;
        case'BudgetItemCode':
            var path = System.RootURL + '/form/61/04/61040050_BudgetItemCode.aspx';
            var object = System.OpenModal( path ,400 , 400 , 'resizable:yes;status:yes');  
        break;
        
        case'OutsideOrdWork':
            var path = System.RootURL + '/form/61/04/61040050_OutsideOrdWork.aspx';
            var object = System.OpenModal( path ,500 , 400 , 'resizable:yes;status:yes');  
        break;
        
        case'InqStanPBSCd':
            var path = System.RootURL + '/form/61/04/61040050_StandardPBSCode.aspx';
            var object = System.OpenModal( path ,500 , 400 , 'resizable:yes;status:yes');  
        break;
        
        case'ApplyStanCd':
            var path = System.RootURL + '/form/61/04/61040050_ApplyStandardCode.aspx';
            var object = System.OpenModal( path ,900 , 500 , 'resizable:yes;status:yes');  
        break;
        
    }
}

//-------------------------------------------

</script>

<body>
    <!------------------------------->
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="width: 100%; height: 5%">
            <td width="100%">
                <fieldset style="padding: 2; width: 100%; height: 100%">
                    <table border="1" width="100%" id="table2">
                        <tr>
                            <td width="30%">
                                <a href="#" style="text-decoration: none" onclick="OnPopUp('Overrall')">Overall Adjustment
                                    of Unit Price</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="30%">
                                <a href="#" style="text-decoration: none" onclick="OnPopUp('Divide')">Divide Main Contract
                                    Detail</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="30%">
                                <a href="#" style="text-decoration: none" onclick="OnPopUp('LinkTo')">Link to Main Contract
                                    Detail</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="30%">
                                <a href="#" style="text-decoration: none" onclick="OnPopUp('VerifyData')">Verify Data</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="30%">
                                <a href="#" style="text-decoration: none" onclick="OnPopUp('RecSubData')">Receive Subcontract
                                    Data</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="30%">
                                <a href="#" style="text-decoration: none" onclick="OnPopUp('BudgetItemCode')">Budget
                                    Item Code</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="30%">
                                <a href="#" style="text-decoration: none" onclick="OnPopUp('OutsideOrdWork')">Outside
                                    Order Work Item</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="30%">
                                <a href="#" style="text-decoration: none" onclick="OnPopUp('InqStanPBSCd')">Inquiry
                                    Standard PBS Code</a>
                            </td>
                        </tr>
                        <tr>
                            <td width="30%">
                                <a href="#" style="text-decoration: none" onclick="OnPopUp('ApplyStanCd')">Apply Standard
                                    Code</a>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>
    <gw:textbox id="iduser_pk" styles="display:none; " />
</body>
</html>
