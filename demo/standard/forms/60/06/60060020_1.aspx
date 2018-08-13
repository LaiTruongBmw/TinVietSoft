<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Cancel cause</title>
  </head>
  
<script>
function BodyInit()
{
    System.Translate(document);
    var ls_seq      = "<%=Request.querystring("seq")%>";
    txt_seq.SetDataText(ls_seq);
    txt_userid.SetEnable(false);
	txt_usernm.SetEnable(false);
	dso_ctl_gfhg00020_1.Call("SELECT");
	
}

function OnCancel()
{
	var code_data=new Array()
	code_data[0] = 0;
	window.returnValue = code_data; 
	this.close();
}


</script>
<body>

   
    
    <gw:data id ="dso_ctl_gfhg00020_1">
        <xml>
            <dso type="control" function= "AC_sel_60060020_1_1">
                <inout>
                    <inout bind="txt_seq" />
                    <inout bind="txt_userid"/>
                    <inout bind="txt_usernm"/>
                    <inout bind="txt_cause"/>
                </inout>
            </dso>
        </xml>
    </gw:data>
    

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
									
									<td><gw:icon id="idBtnSelect" img="in" text="Exit"  styles="width:100"  onclick="OnCancel()"/></td> 
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

<gw:textbox id="txt_seq"              style="display:none"/>

</body>
</html>
