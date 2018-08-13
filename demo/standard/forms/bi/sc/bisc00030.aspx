<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head>
    <title>Invenroty reports</title>
</head>

<script type="text/javascript">
//============================================================================
  function BodyInit() 
  {
      System.Translate(document); 
      var ldate;

      ldate = dtFrom01.value;
      ldate = ldate.substr(0, 4) + ldate.substr(4, 2) + '01';
	  
      dtFrom01.value = ldate;
	  dtFrom02.value = ldate;
	  dtFrom03.value = ldate;
      //-------------------
      var data;
      data = "<%=CtlLib.SetListDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE b.GROUP_ID='LGIN0210' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " )%>" ; 
      lstWHType03.SetDataText(data);

      var data;
      data = "<%=CtlLib.SetListDataSQL("SELECT a.pk, a.wh_id || ' * ' || a.wh_name FROM tlg_in_warehouse a where a.del_if = 0 ORDER BY a.wh_id " )%>" ; 
      lstWareHouse.SetDataText(data);		
       
  }
//============================================================================    
 function OnReport(pos)
 {
    switch(pos)
    {
        case 'radTab01':
            var strRad = radTab01.GetData();  
			              
	        switch (strRad)
	        {
		        case '1' :	
						var url = System.RootURL + '/standard/reports/bi/sc/rpt_bisc00031.aspx?p_from_date=' + dtFrom01.value + '&p_wh_pk=' + lstWareHouse.value + '&p_wh_name=' + lstWareHouse.GetText();				
                		window.open(url);  
                break; 	
                case '2' :	                        
						var url = System.RootURL + '/standard/reports/bi/sc/rpt_bisc00032.aspx?to_date=' + dtTo02.value + '&warehouse_pk=' + lstWareHouse.value + '&warehouse_name=' + lstWareHouse.GetText();			
                		window.open(url);  
                break;					
                case '3' : // kg
                case '4' : // carton
			            var url = System.RootURL + '/standard/reports/bi/sc/rpt_bisc00033.aspx?p_from_date=' + dtFrom03.value + '&p_to_date=' + dtTo03.value + '&p_wh_pk=' + lstWareHouse.value + '&p_report_type=' + strRad;				 
                		window.open(url);
				break;  						  				   					 					             
            }                
        break;     
		
        case 'radTab02':
            var strRad = radTab02.GetData();  
			              
	        switch (strRad)
	        {		         
				case '1' :
						var url = System.RootURL + '/standard/reports/bi/sc/rpt_bisc00030_DR04.aspx?p_from_date=' + dtFrom02.value + '&p_to_date=' + dtTo02.value;
                		window.open(url);
				break;	

				case '2' :
						var url = System.RootURL + '/standard/reports/bi/sc/rpt_bisc00030_DR03.aspx?p_from_date=' + dtFrom02.value + '&p_to_date=' + dtTo02.value;
                		window.open(url);
				break;
				
				case 'DR05' :
						var url = System.RootURL + '/standard/reports/bi/sc/rpt_bisc00030_DR05.aspx?p_from_date=' + dtFrom02.value + '&p_to_date=' + dtTo02.value;
                		window.open(url);
				break;
				
				case '3' :
						var url = System.RootURL + '/standard/reports/bi/sc/rpt_bisc00030_DR02.aspx?p_from_date=' + dtFrom02.value + '&p_to_date=' + dtTo02.value;
                		window.open(url);
				break;
											
				case '5' :
						var url = System.RootURL + '/standard/reports/bi/sc/rpt_bisc00030_DR01.aspx?p_from_date=' + dtFrom02.value + '&p_to_date=' + dtTo02.value;
                		window.open(url);
				break;	

				case '6' :
						var url = System.RootURL + '/standard/reports/bi/sc/rpt_bisc00030_DR06.aspx?p_from_date=' + dtFrom02.value + '&p_to_date=' + dtTo02.value;
                		window.open(url);
				break;				
            }                
        break; 
				
		case 'radTab03':
            var strRad = radTab03.GetData();  
			              
	        switch (strRad)
	        {		       
				case '1' :
			            var url = System.RootURL + '/standard/reports/bi/sc/rpt_bisc00030.aspx?p_from_date=' + dtFrom03.value + '&p_to_date=' + dtTo03.value + '&p_wh_type=' + lstWHType03.value;				 
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
                            <b style="color: #CC0066; font-size: medium">INVENTORY REPORTS</b>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="2" style="">
                            <table style="width: 100%; height: 100%" border="0">
                               <tr>
                                    <td align="right" style="width: 5%">
                                        Date
                                    </td>
                                    <td style="width: 45%" align="left">
                                        <gw:datebox id="dtFrom01" lang="1" />
                                        ~
                                        <gw:datebox id="dtTo01" lang="1" />
                                    </td>
									<td style="width: 5%" align="right" >
                                        W/H
                                    </td>
                                    <td style="width: 45%" align="left">
                                        <gw:list id="lstWareHouse" styles="width:100%;" />
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
                                             <span value="1" id="T01-1">Sum Daily Closing</span></br>	
											 
											 										 								 
                                         </gw:radio>
                                    </td>
                                </tr>								 
                                <tr>
                                    <td align="center">
                                        <gw:button img="excel" alt="Report" id="btnReport" onclick="OnReport('radTab01')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>                   										
					<tr style="height: 1%">
                        <td colspan="2" style="">
                            <table style="width: 100%; height: 100%" border="0">
                               <tr>
                                    <td align="right">
                                        Date
                                    </td>
                                    <td>
                                        <gw:datebox id="dtFrom02" lang="1" />
                                        ~
                                        <gw:datebox id="dtTo02" lang="1" />
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
                                         <gw:radio id="radTab02" value="1" style="color: #330066; font-size: small">                                              
											 <span value="1" id="T02-1">DURING : Production Status </span> </br>
											 <span value="2" id="T02-2">DURING : Product W/H Status 1 </span> </br>
											 <span value="DR05" id="T02-4">DURING : Product W/H Status 2 </span> </br>
											 <span value="3" id="T02-3">DURING : Material Status </span> </br>
											 <span value="5" id="T02-5">DURING : Material In/Out </span> </br>
											 
											 <span value="6" id="T02-6">DURING : Delivery Actual Compare</span> </br>											 
                                         </gw:radio>
                                    </td>
                                </tr>								 
                                <tr>
                                    <td align="center">
                                        <gw:button img="excel" alt="Report" id="btnReport" onclick="OnReport('radTab02')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>                  
 					<tr style="height: 1%">
                        <td colspan="2" style="">
                            <table style="width: 100%; height: 100%" border="0">
                               <tr>
                                    <td align="right" style="width: 5%">
                                        Date
                                    </td>
                                    <td style="width: 45%; white-space:nowrap" align="left">
                                        <gw:datebox id="dtFrom03" lang="1" />
                                        ~
                                        <gw:datebox id="dtTo03" lang="1" />
                                    </td>
									<td style="width: 5%; white-space:nowrap" align="right" >
                                        W/H Type
                                    </td>
                                    <td style="width: 45%" align="left">
                                        <gw:list id="lstWHType03" styles="width:100%;" />
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
                                         <gw:radio id="radTab03" value="1" style="color: #330066; font-size: small">                                               
											 <span value="1" id="T03-1">P/L Daily Report</span></br>	
                                         </gw:radio>
                                    </td>
                                </tr>								 
                                <tr>
                                    <td align="center">
                                        <gw:button img="excel" alt="Report" id="btnReport" onclick="OnReport('radTab03')" />
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
