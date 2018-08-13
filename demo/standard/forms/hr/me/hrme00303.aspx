<!-- #include file="../../../../system/lib/form.inc"  -->
 <%CtlLib.SetUser("SALE")%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>

    //=======================================================================
    var callerWindowObj = dialogArguments;

    function BodyInit() {
        System.Translate(document);
        //radType.value = "";
        //-------------------------
    }
    //=======================================================================
    function OnClickAdd() {
        var aData = new Array();
        aData[0] = radType.value;
        //alert(aData[0]);
        
        window.returnValue = aData;
        this.close();
    }
    //=======================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <table style="width:100%;height:100%" >
        <tr style="height: 20%">
            <td style="font-size: medium; color: Blue;width:100%" align="center">
                ADD NEW MEAL CHECKING</td>
        </tr>
        <tr style="height: 70%">
            <td style="width: 100%" align="left">
                <gw:radio id="radType" value="1" styles="width:100%" onchange="OnClickAdd()"> 
				
					<span value="IN">Employees of Company</span> <br/>
					<span value="OUT">Out of Company</span> <br/>
					
                </gw:radio>
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
</html>
