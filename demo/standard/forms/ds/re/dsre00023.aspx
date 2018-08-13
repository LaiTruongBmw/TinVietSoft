<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>POPUP RETURN MESSAGE</title>
</head>

<script>

var callerWindowObj = dialogArguments;  

 //---------------------------------------------------------
 function BodyInit()
 {
 		//---------------------------
        System.Translate(document);  // Translate to language session
        //-------------------------	
 } 
//=====================================================================================================
function OnSelect()
{
    dialogArguments.txtResponse.text =  txtMessage.GetData();
    window.close();
}

</script>

<body> 
    
    <!------------------------------------------------------------------>
    <table cellpadding="0" cellspacing="0" border="1" style="height: 100%; width: 100%">
		<tr style="height: 1%" >
			<td>
				<table style="width: 100%; height: 100%; border: 2px solid #034D72; background-color:#CCFFFF">
				    <tr style="height:20%">
				        <td style="width: 15%; white-space:nowrap" align="left">Return Message </td>
				         <td style="width: 50%"> </td>
				        <td style="white-space:nowrap; width:5%">
				            <gw:button img="OK" text="OK" id="btnSelect" onclick="OnSelect()" />				            
				        </td>				        		        
				         <td style="white-space:nowrap ; width:5%">				            
				            <gw:button img="cancel" alt="Cancel" id="btnCancel" onclick="OnCancel()" />
				        </td>				        
				    </tr>                    
                    <tr style="height:70%" >                        
                        <td style="width: 65%; " align="center" colspan="4">							
							<gw:textarea id="txtMessage"   styles="width:100%; height:100%" > </gw:textarea> 
                        </td>
					</tr>                      
                    <tr style="height:10%">
                        <td></td>
                    </tr>
                </table>
			</td>
		</tr>	 
    </table>
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtPartItemPK" text="" styles='display:none' />
    <gw:textbox id="txtReturnValue" text="" styles='display:none' />
    <gw:textbox id="txtPartnerPK" styles='width:50%;color:cc0000;font:11pt'  />
    <gw:textbox id="txtItemPK" styles='width:50%;color:cc0000;font:11pt'  />
    <!------------------------------------------------------------------------>
</body>
</html>
