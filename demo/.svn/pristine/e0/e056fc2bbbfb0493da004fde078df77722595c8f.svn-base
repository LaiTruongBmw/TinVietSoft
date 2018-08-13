<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP </title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
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
                Reports</td>
        </tr>
        <tr style="height: 10%">
            <td align="center" style="width: 100%">
                <gw:icon id="idBtnOk" img="2" text="Print" styles='width:50%' onclick="OnReport()" />
            </td>
        </tr>
        <tr style="height: 70%">
            <td style="width: 100%" align="left">
                <gw:radio id="radType" value="ST03" styles="width:100%"> 
					
                    <span value="ST01">ST 01</span> <br/>
					<span value="ST02">ST 02</span> <br/>
					<span value="ST03">ST 03</span> <br/>
					<span value="ST04">ST 04</span> <br/>
					<span value="ST05">ST 05</span> <br/>
					<span value="ST06">ST 06</span> <br/>
					<span value="ST07">ST 07</span> <br/>
					<span value="ST08">ST 08</span> <br/>
					<span value="ST09">ST 09</span> <br/>
					<span value="ST10">ST 10</span> <br/>
					 
                </gw:radio>
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
</html>
