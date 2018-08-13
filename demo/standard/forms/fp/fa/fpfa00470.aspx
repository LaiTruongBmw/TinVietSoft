<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>fpfa00470</title>
</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>


//==============================================================================================
function BodyInit()
{
	
}

//====================================================================
function OnPrint()
{
    var url =System.RootURL + "/reports/fp/fa/rpt_fpfa00480.aspx";
	System.OpenTargetPage(url); 
}
</script>

<html>
<body>
<!------------------------------------------------------------------------------------------>
	
<!------------------------------------------------------------------------------------------>	 
<table width="100%" style="height:100%"  border="0" cellpadding="0" cellspacing="0">  
    <tr>
        <td id="t-left" style="width: 30%">
             <gw:imgbtn id="btnExcel" img="excel" alt="Print" text="Print" onclick="OnPrint()" />
        </td>
    </tr> 
</table>
</body>
</html>