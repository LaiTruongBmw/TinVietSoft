<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Production Reports 2</title>
</head>

 
<script type="text/javascript">

 //============================================================================
 function BodyInit() 
 {
     System.Translate(document); 
    var data;
        
    data = "<%=ESysLib.SetListDataSQL("select pk, wp_id || ' - ' || wp_name from tlg_pb_work_process where del_if = 0 and use_yn='Y' order by wp_id")%>";
    lstWP.SetDataText(data);
	data = "<%=ESysLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and wh_type ='04' and use_yn='Y' ORDER BY wh_name  ASC" )%>";    
     lstWH1.SetDataText(data);
	
 }
 //============================================================================    
 function OnReports(pos)
 {
    switch(pos)
    {
        case 'radTab01':
            var strRad = radTab01.GetData();                
	        switch (strRad)
	        {
		        case '1':	
		               var url = System.RootURL + '/reports/fp/pr/rpt_fppr00080.aspx?prod_date=' + dtFrom1.value ;
                	   window.open(url);  
                break;  
				case '2':	
		               var url = System.RootURL + '/reports/fp/pr/rpt_fppr00080_fose01.aspx?prod_date=' + dtFrom1.value ;
                	   window.open(url);  
                break;  				
            }                
        break;   
		
		case 'radTab02':
            var strRad = radTab02.GetData();                
	        switch (strRad)
	        {
		        case '1':	
		               var url = System.RootURL + '/reports/fp/pr/rpt_fppr00081.aspx?factory_pk=' + lstFactory2.value + '&from_dt=' + dtFrom2.value + '&to_dt=' + dtTo2.value + '&factory_name=' + lstFactory2.GetText();
                	   window.open(url);  
                break; 

				case '2':	
		               var url = System.RootURL + '/reports/fp/pr/rpt_fppr00080_02.aspx?p_factory_pk=' + lstFactory2.value + '&p_from_date=' + dtFrom2.value + '&p_to_date=' + dtTo2.value + '&factory_name=' + lstFactory2.GetText();
                	   window.open(url);  
                break; 
				
            }                
        break;   	

		case 'radTab03':
            var strRad = radTab03.GetData();                
	        switch (strRad)
	        {
		        case '1':	
		               var url = System.RootURL + '/reports/fp/pr/rpt_fppr00082_songwol.aspx?wp_pk=' + lstWP.value + '&from_dt=' + dtFrom3.value + '&to_dt=' + dtTo3.value + '&wp_name=' + lstWP.GetText();
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
                                    </td>
										 <td style="width: 35%">
                                        <gw:list id="lstWh1" styles="width:100%" />
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
                                             <span value="1" id="T0101">Daily Produciton Report (SnJ)</span> </br>											  
                                             <span value="2" id="T0102">Nhat Ky Suat An </span> </br>											  
                                         </gw:radio>

										 
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <gw:imgbtn img="excel" alt="Report" id="btnReport" onclick="OnReports('radTab01')" />
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
                                        <gw:datebox id="dtFrom2" lang="1" />
                                        ~
                                        <gw:datebox id="dtTo2" lang="1" />
                                    </td>
                                    <td>
                                        Fact
                                    </td>
                                    <td style="width: 35%">
                                        <gw:list id="lstFactory2" styles="width:100%" />
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
                                        <gw:radio id="radTab02" value="1" style="color: #330066; font-size: small"> 
                                            <span value="1" id="T0201">1. Production Result (Type 1)</span></br>  
											<span value="2" id="T0202">2. Production Result (Type 2)</span></br>     											 
                                         </gw:radio>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <gw:imgbtn img="excel" alt="Report" id="btnReport" onclick="OnReports('radTab02')" />
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
                                        W/P
                                    </td>
                                    <td style="width: 35%">
                                        <gw:list id="lstWP" styles="width:100%" />
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
                                        <gw:radio id="radTab03" value="1" style="color: #330066; font-size: small"> 
                                             <span value="1" id="T0301">1. Process</span></br>                                              
                                         </gw:radio>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <gw:imgbtn img="excel" alt="Report" id="btnReport" onclick="OnReports('radTab03')" />
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
