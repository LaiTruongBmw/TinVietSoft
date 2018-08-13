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
                PO Report</td>
        </tr>
        <tr style="height: 10%">
            <td align="center" style="width: 100%">
                <gw:button id="idBtnOk" img="excel" text="Print Report" onclick="OnReport()" />
            </td>
        </tr>
        <tr style="height: 70%">
            <td style="width: 100%" align="left">
                <gw:radio id="radType" value="YJ01" styles="width:100%"> 
				
					<span value="ST01">ST : ONE P/O</span> <br/>
					<span value="ST02">ST : MANY P/O</span> <br/>
					<span value="ST03">ST : TYPE 3</span> <br/>
									    				
					<span value="10">DURING : LOCAL 1</span> <br/>
					<span value="DUR02">DURING : LOCAL 2</span> <br/>
					<span value="12">DURING : IMPORT 1</span> <br/>
					
					<span value="11">DURING : COMPARE</span> <br/>

					<span value="YJ01">YJ : TYPE 1</span> <br/>
					<span value="YJ02">YJ : TYPE 2</span> <br/>
					
					<span value="3">DORCO</span> <br/>
					                    
                    <span value="6">PURCHASING ORDER (SW)</span> <br/>
                    <span value="7">PURCHASING ORDER 2 (SW)</span> <br/>
					
                    <span value="1">PURCHASING ORDER WITHOUT SPEC</span> <br/>
                    
					<span value="5">GROUP BY DEPT</span> <br/>
                    <span value="4">TOTAL AMOUNT BY PO QTY</span> <br/>
										 
					<span value="8">YS : PURCHASING ORDER</span> <br/>
					<span value="9">YS : PURCHASING ORDER</span> <br/>
															
					<span value="AMB1"> AMB 1</span> <br/>
                    <span value="AMB2"> AMB 2</span> <br/> 
                </gw:radio>
            </td>
        </tr>
    </table>
</body>
<!---------------------------------------------------------------------->
</html>
