<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Seach List</title>
  </head>
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
    System.Translate(document);
    var  g_user_id = "<%=Session("USER_ID")%>" ;
    var  g_user_name = "<%=Session("USER_NAME")%>" ;
    var  g_user_pk = "<%=Session("USER_PK")%>" ;
    txt_userpk.SetDataText(g_user_pk);
    txt_userid.SetDataText(g_user_id);
    txt_usernm.SetDataText(g_user_name);
//	dso_ctl_getProposedBy.Call("SELECT");
	
}

function OnOK()
{
	if (txt_cause.GetData() == "")
	{
		alert('Please enter reason for cancelling...'+'\n'+'Bạn hãy nhập lý do hủy số SEQ này...');
		return;
    }
    else
    {
        OnRecv();
    }
}

function OnCancel()
{
	var code_data=new Array()
	code_data[0] = 0;
	window.returnValue = code_data; 
	this.close();
}

function OnRecv()
{
    var code_data = new Array();
    code_data[0]  = txt_cause.GetData();
    window.returnValue = code_data;
	this.close();
}

</script>
<body>

<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="1">
  <tr> 
    <td width="100%" height="100%">
    	<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="0">
            <tr height="15%">
	            <td class="itable_title">
			        <table class="table" cellspacing="0" cellpadding="0" width="100%" height="100%">
						<tr>
							<td class="table_title" width="30%" align="right">Cancelled by</td>
							<td class="table_content" width="70%" >
							<gw:textbox id="txt_userpk" styles="width:40%;height:25" style="Display:None"/>
							<gw:textbox id="txt_userid" styles="width:40%;height:25" />
							<gw:textbox id="txt_usernm" styles="width:60%;height:25" />
							</td>
		                </tr>
				    </table>
		        </td>
	    	</tr>
	    	
	    	<tr height="80%"> 
	    		<td>
	    			<table class="table" cellspacing="0" cellpadding="0" width="100%" height="100%">
	    				<tr>
	    				    <td height="80%"><gw:textarea id="txt_cause" styles="width:100%;height:100%;" maxlen=120 ></gw:textarea></td>
	    				</tr>
		            </table>
            	<td>
	    	</tr>
	    	
		    <tr height="5">
				<td>
			    <table border=1 cellspacing="0" cellpadding="0" width="100%">
					<tr align="center"> 
					    <td>
					    	<table>
					    	    <tr>
									<td><gw:icon id="idBtnSelect" img="in" text="OK"    styles="width:100"  onclick="OnOK()" /></td> 
									<td><gw:icon id="idBtnSelect_1" img="in" text="EXIT"  styles="width:100"  onclick="OnCancel()"/></td> 
								</tr>
							</table>	
						<td>	
					</tr>
				</table>
				</td>
			</tr>
		</table>  
    </td>
	</tr>
</table>

<gw:textbox id="txt_compk"            style="display:none"/>
<gw:textbox id="txt_seq"              style="display:none"/>
<gw:textbox id="txt_status"           style="display:none"/>
<gw:textbox id="txtProposedByUserName"  styles="display:none"/>
<gw:list    id="lstDepartment"          styles="display:none" value="ALL" ></gw:list>
<gw:textbox id="txt_trtablenm"          style="display:none"/>
</body>
</html>
