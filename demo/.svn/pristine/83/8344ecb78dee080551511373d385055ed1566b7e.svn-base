<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
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
        case 'radTab01':
            var strRad = radTab01.value;            
            switch (strRad)
            {
	            case '1':	
	                   var url = System.RootURL + '/standard/reports/ds/bs/rpt_dsbs00250.aspx?from_date=' + dtFrom1.value + '&to_date=' + dtTo1.value ;
            	       window.open(url);  
                break;    
                case '2':	
	                   var url = System.RootURL + '/standard/reports/ds/bs/rpt_dsbs00250_1.aspx?from_date=' + dtFrom1.value + '&to_date=' + dtTo1.value ;
            	       window.open(url);  
                break; 
				
                case '3':	
	                   var url = System.RootURL + '/standard/reports/ds/bs/rpt_dsbs00250_2.aspx?from_date=' + dtFrom1.value + '&to_date=' + dtTo1.value ;
            	       window.open(url);  
                break;  

				case '4':	
	                   var url = System.RootURL + '/standard/reports/ds/bs/rpt_dsbs00250_DR01.aspx?from_date=' + dtFrom1.value + '&to_date=' + dtTo1.value ;
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
                                        <gw:radio id="radTab01" value="1" style="color: #330066; font-size: small"> 
                                            <!-- <span value="1" id="T01-1">Balance of all Orders</span> <br /><br /><br />
                                             <span value="2" id="T01-2">All Order Receive</span> <br /><br /><br />
                                             <span value="3" id="T01-3">Partner Deli Balance</span> -->
											 
											 <span value="4" id="T01-4">Deli/Actual Compare</span>
                                         </gw:radio>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <gw:button img="excel" alt="Report" id="btnReport" onclick="OnChangeTab('radTab01')" />
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
