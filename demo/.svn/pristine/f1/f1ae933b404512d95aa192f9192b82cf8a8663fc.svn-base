<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Production Report 2</title>
</head>

<script>
//============================================================================
function BodyInit() 
{
    System.Translate(document); 
}
//============================================================================    
function OnChangeTab(pos)
{
    switch(pos)
    {
        case 'radTab':
            var strRad = radTab.value;            
            switch (strRad)
            {
	            case '1':	
	                   var url = System.RootURL + '/reports/fp/ma/rpt_fpma00320.aspx?p_from_date=' + dtFrom1.value + '&p_to_date=' + dtTo1.value ;
            	       window.open(url);  
                break;         
            }                
        break;              
    } 
}
//============================================================================    
	 
</script>

<body>
    <!-----------------------------APPROVE CUT result----------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 10%">
        </tr>
        <tr style="height: 90%">
            <td style="width: 20%">
            </td>
            <td style="width: 60%">
                <table style="width: 100%; height: 100%; border: 1px solid #034D72">
                    <tr style="height: 1%">
                        <td align="center" style="border: 1px solid #034D72; width: 100%" colspan="2">
                            <b style="color: #CC0066; font-size: medium">REPORTS</b>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="2" style="">
                            <table style="width: 100%; height: 100%" border="0">
                                <tr>
                                    <td>
                                        Date
                                    </td>
                                    <td>
                                        <gw:datebox id="dtFrom1" lang="1" />
                                        ~
                                        <gw:datebox id="dtTo1" lang="1" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 5%">
                        <td style="border: 1px solid #034D72; background-color: #FFFFDD" colspan="2">
                            <table style="width: 100%; height: 100%" border="0">
                                <tr>
                                    <td style="width: 690px">
                                        <gw:radio id="radTab" value="1" style="color: #330066; font-size: small"> 
                                             <span value="1" id="rad1">-</span> <br /><br /><br />
                                         </gw:radio>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <gw:imgbtn img="excel" alt="Report" id="btnReport" onclick="OnChangeTab('radTab')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 20%">
            </td>
        </tr>
        <tr style="height: 10%">
        </tr>
    </table>
</body>
<gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
<!------------------------------------------------------------------------------------>
</html>
