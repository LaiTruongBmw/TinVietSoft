<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>

<script language="JavaScript" src="../../../../system/lib/md5.js"></script>

<script>

function BodyInit()
{
   txtUserID.text = "<%=Session("USER_ID")%>";
   lblMsg.text = "<%=Request.QueryString("msg") %>" 
   txtUserID.SetEnable(false);
}

function form_reset()
{
	txtOldPassword.text = '';
	txtNewPassword.text = '';
	txtConfirmPassword.text = '';
}
function changePwd()
{
	if(checkData()==true){
	//set data to grid
	    txtOldPasswordEnc.text = b64_md5(txtOldPassword.text);
	    txtNewPasswordEnc.text = b64_md5(txtNewPassword.text);
	    
	    dataUserPassword.Call();		
		
	}
}

function OnDataReceive(dso)
{
    if(dso.id == "dataUserPassword")
    {
       alert(txtResult.text);
       System.AppLogout();
    }
    
}

function checkData()
{
    var s;
    
    if(txtNewPassword.text.length < 4 ){
        alert("The Minimum Password Length must be 4 characters.");
        return false;
    }
    
	if (txtOldPassword.text == '') {
		alert('Please input Old password');
		return false
	}	
	if (txtNewPassword.text == '') {
		alert('Please input New password');
		return false
	}
	if (txtConfirmPassword.text == '') {
		alert('Please input confirm new password');
		return false
	}	
	if (txtNewPassword.text != txtConfirmPassword.text) {
		alert('New password and Confirm password doesnot match.');
		return false;
	}	
	
	return true;
}
</script>

<body>
    <gw:data id="dataUserPassword" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="process" procedure="ST_GS_PRO_GSAU00400_0" > 
            <input> 
                <input bind="txtUserID" />
                <input bind="txtOldPasswordEnc" />
                <input bind="txtNewPasswordEnc" />
            </input>
	       <output>
	            <output bind="txtResult" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>
    <table align="center" width="100%" height="100%">
        <tr>
            <td>
                <table align="center" cellspacing="0" cellpadding="0" border="1" style="width: 70%;
                    height: 60%; border-color: #6B9EB8">
                    <tr>
                        <td>
                            <b><gw:label id="lblMsg" styles="color:red" /></b>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table align="center" cellspacing="0" cellpadding="0" border="0">
                                <tr>
                                    <td width="140" style='font-size: 12px;'>
                                        <b>User ID </font>
                                    </td>
                                    <td colspan="2" align="center">
                                        <gw:textbox  styles="width:140;height:18;font size:12;color:blue" csstype="mandatory"
                                            id="txtUserID" />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="7" colspan="3">
                                    </td>
                                </tr>
                                <tr>
                                    <td width="140" style='font-size: 12px'>
                                        <b>Old Password </font>
                                    </td>
                                    <td colspan="2" align="center">
                                        <gw:textbox styles="width:200;height:18;font size:12" id="txtOldPassword"
                                            passwd />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="7" colspan="3">
                                    </td>
                                </tr>
                                <tr>
                                    <td width="140" style='font-size: 12px'>
                                        <b>New Password </font>
                                    </td>
                                    <td colspan="2" align="center">
                                        <gw:textbox  styles="width:200;height:18;font size:12" id="txtNewPassword"
                                            passwd />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="7" colspan="3">
                                    </td>
                                </tr>
                                <tr>
                                    <td width="140" style='font-size: 12px'>
                                        <b>Confirm Password </font>
                                    </td>
                                    <td colspan="2" align="center">
                                        <gw:textbox  styles="width:200;height:18;font size:12" id="txtConfirmPassword"
                                            passwd />
                                    </td>
                                </tr>
                                <tr style="height:50">
                                <td colspan="3" style="color:red"><b color="red">Password length atleast 6 characters.</b></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td width="50">
                                        <gw:button id="btnSave" img="save"  alt="Save" text="Save" onclick="changePwd()" />
                                    </td>
                                    <td width="50" align="right">
                                        <gw:button id="btnCancel" img="reset" alt="Reset" text="Reset" onclick="form_reset()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox maxlen="10" styles="width:140;height:18;font size:12;display:none" id="txtResult" />
    <gw:textbox maxlen="10" styles="width:140;height:18;font size:12;display:none" id="txtOldPasswordEnc" />
    <gw:textbox maxlen="10" styles="width:140;height:18;font size:12;display:none" id="txtNewPasswordEnc" />
</body>
</html>
