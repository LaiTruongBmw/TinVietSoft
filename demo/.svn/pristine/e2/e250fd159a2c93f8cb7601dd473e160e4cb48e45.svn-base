<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>CHECK PRICE</title>
</head>
<script type="text/javascript">
 
//===================================================================================
 function BodyInit()
 {
      System.Translate(document);      
      //-----------------------------
 
 }
   
//=================================================================================================
function OnProcess(pos)
{
    switch(pos)
    {
		case 'Approve':
			if ( confirm('Do you want to process price ?') )
			{
				window.returnValue = radPriceType.value; 				
			}	
			
			window.close(); 	
		break;

		case 'Cancel':
			window.returnValue = ''; 
		    window.close();   
		break;	
    } 
}
 
//================================================================================================
 
</script>

<body style="margin:0 0 0 0; padding:0 0 0 0;">
    
    <!------------------------------------------------------------------>
   
                <table style="width: 100%; height: 100%" border="0">
				
						
					
                    <tr style="height: 50%">
                        <td>
                            <table style="width: 100%; height: 100%">
								<tr style="height: 50%">
                         
                                    <td style="width: 30%" align="right">
										 
                                    </td>                                      
									<td style="width: 40%;white-space: nowrap" align="center" colspan=2 >  
										<gw:radio id="radPriceType" value="PUR" styles="width:100%" >
											<span value="SALE" id="SALE">Sale Price</span> 
											<span value="PUR" id="PUR">Purchase Price</span>											
											<span value="PROD" id="PROD">Prod Price</span>                             						
										</gw:radio> 
                                    </td>                                                                                                             
									<td style="width: 30%">                                         
                                    </td>								 
								</tr>	
					
                                <tr>
								     
                                    <td style="width: 30%">                                         
                                    </td>                                      
									<td style="width: 20%" align="center">  
										<gw:button id="btnApprove" img="Approve" text="Approve" onclick="OnProcess('Approve')" />
                                    </td>                                                                        
                                    <td style="width: 20%" align="center">                                        
                                        <gw:button id="btnCancel" img="cancel" text="Cancel" onclick="OnProcess('Cancel')" />
                                    </td> 
									<td style="width: 30%">                                         
                                    </td>
									
                                </tr>                                
                            </table>
                        </td>
                    </tr>					 
                    
                </table>
             
    <!--------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" maxlen="100" styles='width:100%;display:none' />       
    <!--------------------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />	  
	<!--------------------------------------------------------------------->  
	<gw:textbox id="txtCancelChargerPK" styles='width:100%;display:none'>	 
</body>
</html>
