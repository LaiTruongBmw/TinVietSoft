<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Reports</title>
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
    //-------------------------
}  
//=======================================================================
function OnReport()
{
    callerWindowObj.OnReport(radType.value)      
    this.close(); 	
}
//=======================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <table style="width:100%;height:100%" >
        <tr style="height: 20%">
            <td style="font-size: large; color: Blue;width:100%" align="center">
                W/H Stock Checking</td>
        </tr>
        <tr style="height: 10%">
            <td align="center" style="width: 100%">
                <gw:button id="idBtnOk" img="excel" text="Print Report" styles='width:50%' onclick="OnReport()" />
            </td>
        </tr>
        <tr style="height: 70%">
            <td style="width: 100%" align="left">
                <gw:radio id="radType" value="ST01" styles="width:100%"> 
                    
                    <span value="2">Item Group - Quantity</span> <br/>
                    <span value="3">Item       - Others In/Out</span> <br/>
                    <span value="4">Item Group - Others In/Out</span> <br/>   								 
					
					
					<span value="6">Other Report</span> <br/> 

					
                </gw:radio>
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
</html>
