<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Production Reports 1</title>
</head>

<script type="text/javascript">
    //============================================================================
    function BodyInit() 
    {
        System.Translate(document); 
        var ldate;

        ldate = dtFrom2.value;
        ldate = ldate.substr(0, 4) + ldate.substr(4, 2) + '01';
		dtFrom2.value = ldate;
        dtFrom3.value = ldate;
        
        var data;
        
        data = "<%=ESysLib.SetListDataSQL("select pk, wp_id || ' - ' || wp_name from tlg_pb_work_process where del_if = 0 and use_yn='Y' order by wp_id")%>";
        lstWorkProcess2.SetDataText(data);
        
        data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from tlg_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>";
        lstFactory3.SetDataText( data);
        
        lstFactory2.SetDataText( data);
       // lstFactory3.value = '' ;
		
        lstFactory4.SetDataText( data);
        //lstFactory4.value = '' ;			
		
		data = "data|1|1|2|2";
        lstPage4.SetDataText(data);
    }
    //============================================================================    
 function OnChangeTab(pos)
 {
    switch(pos)
    {
        case 'radTab':
            var strRad = radTab.GetData();                
	        switch (strRad)
	        {
		        case '1':	
		               var url = System.RootURL + '/reports/fp/pr/rpt_fppr00095.aspx?prod_date=' + dtFrom2.value + '&work_process_pk=' + lstWorkProcess2.                    value + '&factory_pk=' + lstFactory2.value + '&factory_name=' + lstFactory2.GetText();
                	window.open(url);  
                break;                
            }                
        break;
        
        case 'radTab01':
            var strRad = radTab01.GetData();                
	        switch (strRad)
	        {
		        case '1':	
		              var url = System.RootURL + '/reports/fp/pr/rpt_fppr00093.aspx?p_from_date=' + dtFrom3.value + '&p_factory=' + lstFactory3.value + '&p_factory_name=' + lstFactory3.GetText();
                	System.OpenTargetPage(url);
                break;          
                
                case '2':	
		              var url = System.RootURL + '/reports/fp/pr/rpt_fppr00097.aspx?p_from_date=' + dtFrom3.value + '&p_factory_pk=' + lstFactory3.value + '&p_factory_name=' + lstFactory3.GetText();
                	System.OpenTargetPage(url);	
                break;
                
                case '3':	
		              var url = System.RootURL + '/reports/fp/pr/rpt_fppr00098.aspx?p_from_date=' + dtFrom3.value + '&p_to_date=' + dtTo3.value + '&p_factory_pk=' + lstFactory3.value + '&p_factory_name=' + lstFactory3.GetText();
                	System.OpenTargetPage(url);	
                break;
				
				case '4':	
		              var url = System.RootURL + '/reports/fp/pr/rpt_fppr00091.aspx?p_from_date=' + dtFrom3.value + '&p_factory_pk=' + lstFactory3.value + '&p_factory_name=' + lstFactory3.GetText();
                	System.OpenTargetPage(url);	
                break;				      
            }   
        break;
        
        case 'radTab02':
            var strRad = radTab02.GetData();                
	        switch (strRad)
	        {
		        case '1':	
					var url = System.RootURL + '/reports/fp/pr/rpt_fppr00094_2.aspx?from_date=' + dtFrom4.value + '&factory_pk=' + lstFactory4.value + '&factory_name=' + lstFactory4.GetText() + '&p_spec_chk=' + chkSpec.value + '&p_page=' + lstPage4.value;
                	window.open(url);   		           
                break;          
                
                case '2':	
		             var url = System.RootURL + '/reports/fp/pr/rpt_fppr00094_4.aspx?from_date=' + dtFrom4.value + '&factory_pk=' + lstFactory4.value + '&factory_name=' + lstFactory4.GetText()+ '&p_spec_chk=' + chkSpec.value + '&p_page=' + lstPage4.value;
                	window.open(url);
                break;                                    
                
				case '3':	
		            var url = System.RootURL + '/reports/fp/pr/rpt_fppr00092.aspx?plan_date=' + dtFrom4.value + '&factory_pk=' + lstFactory4.value + '&factory_name=' + lstFactory4.GetText()+ '&p_spec_chk=' + chkSpec.value + '&p_page=' + lstPage4.value;
                	window.open(url);
                break; 
								
                case '4':	
		           var url = System.RootURL + '/reports/fp/pr/rpt_fppr00099.aspx?plan_date=' + dtFrom4.value + '&factory_pk=' + lstFactory4.value + '&factory_name=' + lstFactory4.GetText() + '&p_spec_chk=' + chkSpec.value;
                	window.open(url);
                break;                          
                                  				
				case '5':	
		            var url = System.RootURL + '/reports/fp/pr/rpt_fppr00096.aspx?plan_date=' + dtFrom4.value + '&factory_pk=' + lstFactory4.value + '&factory_name=' + lstFactory4.GetText()+ '&p_spec_chk=' + chkSpec.value;
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
                                        <gw:datebox id="dtFrom2" lang="1" />
                                        &nbsp;~&nbsp;
                                        <gw:datebox id="dtTo2" lang="1" />
                                    </td>
                                    <td>
                                        Fact
                                    </td>
                                    <td style="width: 35%">
                                        <gw:list id="lstFactory2" styles="width:100%" />
                                    </td>
                                    <td>
                                        W/P
                                    </td>
                                    <td style="width: 30%">
                                        <gw:list id="lstWorkProcess2" styles="width:100%" />
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
                                             <span value="1" id="Span1">1. W/P Balance</span>
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
                    <tr style="height: 1%">
                        <td colspan="2" style="">
                            <table style="width: 100%; height: 100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td>
                                        Date
                                    </td>
                                    <td>
                                        <gw:datebox id="dtFrom3" lang="1" />
                                        ~
                                        <gw:datebox id="dtTo3" lang="1" />
                                    </td>
                                    <td>
                                        Fact
                                    </td>
                                    <td style="width: 35%">
                                        <gw:list id="lstFactory3" styles="width:100%" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 10%">
                        <td style="border: 1px solid #034D72; background-color: #FFFFDD" colspan="2">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 690px">
                                        <gw:radio id="radTab01" value="1" style="color: #330066; font-size: small"> 
                                             <span value="1" id="Span1">1. Line Hourly Target/Result</span></br>
                                             <span value="2" id="Span2">2. Sewing Hourly Result</span></br>
                                             <span value="3" id="Span3">3. Line Work Schedule</span></br>
											 <span value="4" id="Span4">4. Sewing Daily Target</span>
                                         </gw:radio>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <gw:imgbtn img="excel" alt="Report" id="btnReport" onclick="OnChangeTab('radTab01')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="2" style="">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 5%">
                                        Date
                                    </td>
                                    <td style="width: 10%">
                                        <gw:datebox id="dtFrom4" lang="1" />
                                    </td>
                                    <td style="width: 10%; white-space: nowrap" align="center">
										Spec
                                        <gw:checkbox id="chkSpec" styles="color:blue" defaultvalue="Y|N" value="Y"></gw:checkbox>
                                    </td>
                                    
									<td style="width: 5%">
                                        Page
                                    </td>
                                    <td style="width: 10%">
                                        <gw:list id="lstPage4" styles="width:100%" />
                                    </td>
									 
                                    <td style="width: 5%">
                                        Fact
                                    </td>
                                    <td style="width: 55%">
                                        <gw:list id="lstFactory4" styles="width:100%" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 15%">
                        <td style="border: 1px solid #034D72; background-color: #FFFFDD" colspan="2">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 690px">
                                        <gw:radio id="radTab02" value="1" style="color: #330066; font-size: small"> 
                                             <span value="1" id="Span4">1. P/O Component Balance</span></br>
                                             <span value="2" id="Span5">2. R/G Component Balance</span></br>
											 <span value="3" id="Span6">3. Daily Shortage Component</span></br>
                                             <span value="4" id="Span7">4. Cutting/Preparation/Sewing Balance</span></br>                                             
											 <span value="5" id="Span8">5. Cutting/Preparation/Handle</span>
                                         </gw:radio>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <gw:imgbtn img="excel" alt="Report" id="btnReport" onclick="OnChangeTab('radTab02')" />
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
