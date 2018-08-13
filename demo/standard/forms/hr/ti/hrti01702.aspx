<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Reports</title>
</head>
<% CtlLib.SetUser(Session("APP_DBUSER"))%>


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

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
    <!---------------------------------------------------------------->
    <table style="width:100%;height:100%" >
        <tr style="height: 20%">
            <td colspan=3 style="font-size: large; color: Blue;width:100%" align="center">
                Report List</td>
        </tr>
		<tr >
            <td style="width: 45%" align="center" >
                
			</td>
			<td style="width: 10%" align="center" >
                <gw:button id="idBtnOk" img="excel" text="Report" onclick="OnReport()" align="center" />
			</td>
			<td style="width: 45%" align="center" >
                
			</td>
        </tr>
        
        <tr style="height: 60%">
            <td colspan=3 style="width: 100%" align="center">
                <gw:radio id="radType" value="2" styles="width:100%"> 
					<span value="2">One Sheet</span><br/>
					<span value="1">Multi Sheet</span><br/>
                </gw:radio>
            </td>
			
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
</html>
