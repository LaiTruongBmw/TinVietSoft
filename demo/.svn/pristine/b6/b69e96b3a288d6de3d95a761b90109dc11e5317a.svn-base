<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>POP </title>
</head>
<%  
    ESysLib.SetUser("SALE")
    Dim l_user As String
    l_user = "sale."
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
    callerWindowObj.OnReport(radType.value,dtFrom.value)      
    this.close(); 	
}
//=======================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <table style="width:100%;height:100%" >
        <tr style="height: 20%">
            <td style="font-size: large; color: Blue;width:100%" align="center">
                Fabrication Reports</td>
        </tr>
        <tr style="height: 10%">
            <td align="center" style="width: 100%">
                <gw:icon id="idBtnOk" img="2" text="Print Report" styles='width:50%' onclick="OnReport()" />
            </td>
        </tr>
        <tr style="height: 70%">
            <td style="width: 100%" align="left">
                <gw:radio id="radType" value="CHECK-LIST-2" styles="width:100%"> 
					<span value="SUMMARY">Summary Report 1</span> <br/><br/>
					<span value="PLAN_RESULT">Plan/Result</span> <br/><br/>
                    <span value="DAILY">Daily Report</span>   <gw:datebox id="dtFrom" lang="1" />   <br/><br/>
					<span value="CHECK-LIST-1">Check List Detail</span> <br/><br/>
                    <span value="CHECK-LIST-2">Check List Summary</span> <br/>
                </gw:radio>
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
</html>
