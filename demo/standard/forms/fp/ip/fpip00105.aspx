<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>W/I</title>
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
    callerWindowObj.OnPrint(radType.value)      
    this.close(); 	
}
//=======================================================================
</script>

<body>
    <table style="width: 100%; height: 100%">
        <tr style="height: 20%" align="center">
            <td colspan="3" style="font-size: large; color: purple" align="center">
                PRODUCTION PLAN REPORTS
            </td>
        </tr>
        <tr style="height: 2%">
            <td align="center" style="width: 20%">
                <gw:icon id="idBtnOk" img="2" text="Print Report" styles='width:50%' onclick="OnReport()" />
            </td>
        </tr>
        <tr style="height: 70%">
            <td colspan="1" style="width: 60%">
                <gw:radio id="radType" value="0" styles="width:100%"> 
				<span value="0">Reports 01  ( SW )</span> <br/>
				<span value="1">Reports 02  ( SW )</span> <br/>
				<!--<span value="2">Delivery Voucher (Type 2)</span> <br/>
				<span value="3">Delivery Voucher (Type 3)</span> <br/>                                              
				<span value="4">Delivery Voucher (Type 4)</span> <br/>
				<span value="5"></span> <br/>-->
			</gw:radio>
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
</html>
