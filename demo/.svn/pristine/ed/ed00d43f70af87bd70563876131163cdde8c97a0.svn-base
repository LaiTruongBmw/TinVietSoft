<!-- #include file="../../../../system/lib/form.inc"  -->
<html>
<head>
    <title>User</title>
</head>
<%  
CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
//=========================================================================================
function BodyInit()
{
   var callerWindowObj = dialogArguments;
   txtWH_PK.text = callerWindowObj.txtWH_PK.text;
   lblWH.text = callerWindowObj.txtWH_NAME.text;
   System.Translate(document); 
   agds00092.Call('SELECT');
}
</script>

<body>
    <!----------------------------------------------------------------------------------->
    <gw:data id="agds00092"> 
	<xml> 
		<dso type="grid" function="st_lg_sel_agds00090_5"  > 
			<input bind="grdUser" >	
			    <input bind="txtWH_PK" />			    							
			</input> 
			<output bind="grdUser" /> 
		</dso> 
	</xml> 
    </gw:data>
    <!-------------------------------------------------------------------------------------->
    <table name="User Line Mapping" class="table" width="100%" style="height: 100%" border="1">
        <tr style="height: 100%">
            <td>
                <table width="100%" style="height: 100%">
                    <tr style="height: 5%">
                        <td width="10%">
                            <b><gw:label id="lblWH" styles='width:100%;color:cc0000;font:9pt' /></b>
                        </td>
                    </tr>
                    <tr style="height: 95%">
                        <td colspan="4">
                            <gw:grid id='grdUser' header='_PK|User ID|User Name|Dept Name|Position Name|From W/H|To W/H|Close W/H' format='0|0|0|0|0|3|3|3'
                                aligns='0|0|0|0|0|0|0|0' check='|||||||' editcol='0|0|0|0|0|0|0|0' widths='0|1200|2500|4000|1300|1000|1000|1000'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------------------->
    <gw:textbox id="txtWH_PK" text="" styles="display:none" />
</body>
</html>
