<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP </title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>

    //=======================================================================
    var callerWindowObj = dialogArguments;
    function BodyInit() 
    {
        System.Translate(document);
    }
    //=======================================================================
    function OnReport() {
        callerWindowObj.OnReport(radType.value)
        this.close();
    }
    //=======================================================================
</script>
<body>
    <table border="0" style="height: 20%; width: 100%">
        <tr>
            <td colspan="3" style="font-size: large; color: Blue" align="center">
                W/H Stock Checking
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <br />
                <gw:button id="idBtnReport" img="excel" text="Print Report" styles='width:40%' onclick="OnReport()" />
            </td>
        </tr>
        <tr style="height: 70%">
            <td colspan="2" style="width: 60%">
                <gw:radio id="radType" value="ST01" styles="width:100%"> 
                    <br/><br/>
					<span value="ST01">W/H Stock Checking 2</span><br/><br/>
                    <span value="0">Prod Stock Report</span><br/><br/>
                    <span value="1">Prod Incoming Report</span><br/><br/>
                    <span value="2">Prod Outgoing Report</span><br/><br/>
                </gw:radio>
            </td>
            <td>
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
</html>
