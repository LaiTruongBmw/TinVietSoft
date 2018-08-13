<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Partner Information</title>
</head>

<script>
var v_language = "<%=Session("SESSION_LANG")%>";

//==================================================================
         
function BodyInit()
{       
    System.Translate(document);
	
    txtPartnerPK.text = "<%=Request.querystring("partner_pk")%>";
    
	data_fpab00570.Call("SELECT");
}
 
 
//==================================================================
function OnDataReceive(obj)
{
}

//==================================================================

function OnSelect()
{
	var obj=new Array();
      
    obj[0] = txtPartnerPK.text;
	
	window.returnValue = obj ; 
	window.close();
}

//==================================================================         
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpab00570" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control"  function="st_lg_sel_fpab00570"> 
                <inout> 
	                 <inout bind="txtPartnerPK" />
	                 
	                 <inout bind="txtPartnerID" /> 
                     <inout bind="txtPartnerName" />  
                     <inout  bind="txtLname" />
                	 <inout  bind="txtFname" />                
                               
                	 <inout  bind="txtAddress1" />				
                	 <inout  bind="txtAddress2" />
                	 <inout  bind="txtAddress3" />           
					
					 <inout  bind="txtDescription" />
                	 <inout  bind="txtPhone" />
				
                	 <inout  bind="txtEmail" />				
                	 <inout  bind="txtFax" />
                	 <inout  bind="txtWebsie" />					               
                </inout>
            </dso> 
        </xml> 
    </gw:data>   
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%"> 
			<tr style="height: 1%">
				<td colspan=7>	             	 
				</td> 
				<td colspan=1>
	             	<gw:button id="idBtnSelect" img="2" text="Select" onclick="OnSelect()" />
				</td> 
	       </tr>   
           <tr style="height: 1%">
	            <td style="width: 5%; white-space: nowrap" align="right">
	                Partner
	            </td>
	            <td style="width: 95%; white-space: nowrap" colspan=7 >
					<gw:textbox id="txtPartnerPK" styles='width:100%;display:none' />
	                <gw:textbox id="txtPartnerID" styles="width:30%" csstype="mandatory"  />
	                <gw:textbox id="txtPartnerName" csstype="mandatory" styles="width:70%;" />
	            </td>
	        </tr>                    
            <tr style="height: 1%">
                <td style="width: 5%; white-space: nowrap" align="right">
                    F Name 1
                </td>
                <td colspan="7">
                    <gw:textbox id="txtLname" styles="width:100%;" csstype="" />
                </td>
            </tr>                    
            <tr style="height: 1%">
                <td style="width: 5%; white-space: nowrap" align="right">
                    F Name 2
                </td>
                <td colspan="7">
                    <gw:textbox id="txtFname" styles="width:100%;" csstype="" />
                </td>
            </tr>
            <tr style="height: 1%">
                <td style="width: 5%; white-space: nowrap" align="right">
                    Add 1
                </td>
                <td colspan="7">
                    <gw:textbox id="txtAddress1" styles="width:100%;" csstype="" />
                </td>
            </tr>
            <tr style="height: 1%">
                <td style="width: 5%; white-space: nowrap" align="right">
                    Add 2
                </td>
                <td colspan="7">
                    <gw:textbox id="txtAddress2" styles="width:100%;" csstype="" />
                </td>
            </tr>
            <tr style="height: 1%">
                <td style="width: 5%; white-space: nowrap" align="right">
                    Add 3
                </td>
                <td colspan="7">
                    <gw:textbox id="txtAddress3" styles="width:100%;" csstype="" />
                </td>
            </tr>
            <tr style="height: 1%">
                <td style="width: 5%" align="right">
                    Remark
                </td>
                <td colspan="7">
                    <gw:textbox id="txtDescription" styles="width:100%;" csstype="" />
                </td>
            </tr>
            <tr style="height: 1%">
                <td style="width: 5%" align="right">
                    Phone
                </td>                        
                <td width="20%">
                    <gw:textbox id="txtPhone" styles="width:100%;" csstype="" />
                </td>
                <td style="width: 5%; white-space: nowrap"  align="right">
                    Fax
                </td>
                <td width="20%">
                    <gw:textbox id="txtFax" styles="width:100%;" csstype="" />
                </td>
                <td style="width: 5%; white-space: nowrap"  align="right">
                    Email
                </td>
                <td width="20%">
                    <gw:textbox id="txtEmail" styles="width:100%;" csstype="" />
                </td>
                <td style="width: 5%; white-space: nowrap"  align="right">
                    Web site
                </td>
                <td width="20%">
                    <gw:textbox id="txtWebsie" styles="width:100%;" csstype="" />
                </td>                               
            </tr>                    
        </tr>
    </table>
    <!----------------------------------------------------------->
    
</body>
</html>
