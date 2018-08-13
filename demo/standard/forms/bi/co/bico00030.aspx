<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Cost Reports</title>
</head>

<script type="text/javascript">
//==============================================================================    
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
}
//==============================================================================
function BindingDataList()
{    
     var data="";  
	 
	 data = "<%=ESysLib.SetListDataSQL("select pk, CENTER_ID || ' * '| | CENTER_NAME from TLG_CO_COST_CENTER a where  del_if=0 order by CENTER_ID")%>";       
     lstCostGroup01.SetDataText(data);	 	  
}  
//==============================================================================
function OnReports(pos)
{
    switch(pos)
    {
        case 'radTab02':
			if ( radTab02.value == "1" )
			{
				var url = System.RootURL + '/reports/bi/co/rpt_bico00039.aspx?p_from_date=' + dtFrom02.value + '&p_to_date=' + dtTo02.value;
            	window.open(url);           
			}	
        break;                    
    }
}
//============================================================================
</script>

<body>
    <!------------------------------------------------------------------------------------>
    <table style="width: 100%; height: 100%; border: 3px solid #034D72">
        <tr style="height: 5%">
			<td colspan=4 ></td>
        </tr>
        <tr style="height: 90%">
            <td style="width: 5%">
            </td>
            <td style="width: 45%">
                <table style="width: 100%; height: 100%; background-color: #FFFFDD; border: 1px solid #034D72">				
					<tr style="height: 10%">
						<td style="width: 100%; white-space: nowrap" align="center" >
								<b style="color: #CC0066; font-size: medium">Department Cost</b>
						</td>						 
					</tr>
					<tr style="height: 1%">
                        <td colspan="8">
                            <hr noshade size="1" style="color: Silver" />
                        </td>
                    </tr>
					<tr style="height: 10%">
						<td style="" align="center" >
							<table style="width: 100%; height: 100%">
								<tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Date
                                    </td>
                                    <td style="width: 94%; white-space: nowrap" align="left" colspan=2 >
                                        <gw:datebox id="dtFrom01" lang="1" />
                                        ~
                                        <gw:datebox id="dtTo01" lang="1" />
                                    </td>                                                                        
                                </tr>	
								<tr>                                    
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Group
                                    </td>
                                    <td style="width: 45%; white-space: nowrap" align="left" colspan=2 >
                                        <gw:list id="lstCostGroup01" styles="width:100%" />
                                    </td>
                                </tr>	                                								 
								<tr>                                                                  
                                    <td colspan=4 style="width: 1%; white-space: nowrap" align="center">
                                        <gw:imgbtn img="excel" alt="Report" id="btnReport01" onclick="OnChangeTab('radTab')" />
                                    </td>
                                </tr>
								<tr>
                                    <td colspan=4 style=" " >
                                         <gw:radio id="radTab01" value="1" style="color: #330066; font-size: small"> 
                                             <span value="1" id="T01-1">Reports for Cost Group</span></br>	
											 <span value="1" id="T01-1">Reports details for Cost Group</span></br> 								 								 
                                         </gw:radio>
                                    </td>
                                </tr>
																	 								 					 
                            </table>	 
						</td>						 
					</tr>
					<tr style="height: 1%">
                        <td colspan="8">
                            <hr noshade size="1" style="color: Silver" />
                        </td>
                    </tr>                     					 
					<tr style="height: 80%">
						<td style="width: 100%; white-space: nowrap" align="center" >
								 
						</td>						 
					</tr>						                    
                </table>
            </td>
			<td style="width: 45%">
                <table style="width: 100%; height: 100%; border: 1px solid #034D72; background-color: #DDFFFF">
					<tr style="height: 10%">
						<td style="width: 100%; white-space: nowrap" align="center" >
								<b style="color: #CC0066; font-size: medium">Finish Product</b>
						</td>						 
					</tr>
					<tr style="height: 1%">
                        <td colspan="8">
                            <hr noshade size="1" style="color: Silver" />
                        </td>
                    </tr>
					<tr style="height: 10%">
						<td style="" align="center" >
							<table style="width: 100%; height: 100%">
								<tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Date
                                    </td>
                                    <td style="width: 94%; white-space: nowrap" align="left" colspan=2 >
                                        <gw:datebox id="dtFrom02" lang="1" />
                                        ~
                                        <gw:datebox id="dtTo02" lang="1" />
                                    </td>                                                                        
                                </tr>									                                								 
								<tr>                                                                  
                                    <td colspan=4 style="width: 1%; white-space: nowrap" align="center">
                                        <gw:imgbtn img="excel" alt="Report" id="btnReport02" onclick="OnReports('radTab02')" />
                                    </td>
                                </tr>
								<tr>
                                    <td colspan=4 style=" " >
                                         <gw:radio id="radTab02" value="1" style="color: #330066; font-size: small"> 
                                             <span value="1" id="T02-1">Monthly</span></br>												 						 								 
                                         </gw:radio>
                                    </td>
                                </tr>
																	 								 					 
                            </table>	 
						</td>						 
					</tr>
					<tr style="height: 1%">
                        <td colspan="8">
                            <hr noshade size="1" style="color: Silver" />
                        </td>
                    </tr>                     					 
					<tr style="height: 80%">
						<td style="width: 100%; white-space: nowrap" align="center" >
								 
						</td>						 
					</tr>		
                </table>
            </td>
            <td style="width: 5%">
            </td>
        </tr>
        <tr style="height: 5%">
			<td colspan=4 ></td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------------>
</html>
