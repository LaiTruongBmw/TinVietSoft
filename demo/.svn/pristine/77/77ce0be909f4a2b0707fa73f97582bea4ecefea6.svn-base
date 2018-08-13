<!-- #include file="../../../../system/lib/form.inc"  -->
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Absence Info</title>
</head>
<script>

var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    if (v_language!="ENG")
        System.Translate(document);
	txtEmp_PK.text="<%=request.QueryString("emp_pk")%>"; 
	txtYear.text="<%=request.QueryString("year")%>";
	dat_Used_ALE.Call("SELECT");
}


</script>
<body>
<gw:data id="dat_Used_ALE"  > 
        <xml> 
            <dso  type="grid"   function="ST_HR_SEL_HREM01002_1"> 
                <input bind="grdALE" >
                    <input bind="txtEmp_PK" />
                    <input bind="txtYear" />
                </input>
                <output  bind="grdALE" />
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------------------>
<table align = top style='margin-left:10px' class="itable" cellspacing=0 cellpadding=0 border=0 style="width:100%;height:100%;">
<tr>
	<td> 	
	    <table width="100%" height=7% cellspacing=0 cellpadding=0 >		
			<tr>
				<td align ="center" width=100%><b style="color:#FF0066; font-size:15"> USED ANNUAL LEAVE</b></td>
  			</tr>
		</table>
		<table width="100%" height=93% border=1 cellspacing=0 cellpadding=0 >		
			<tr>
				<td align = top height=100% >					
					<gw:grid   
                        id="grdALE"  
                        header="Emp ID|Full Name|Month|Count"
                        format="0|0|0|1"  
                        aligns="1|0|1|0"  
                        defaults="|||"  
                        editcol="0|0|0|0"  
                        widths="1300|2700|1200|1600"  
                        styles="width:100%; height:100%" 
                        sorting="T"  
                        /> 
  				</td>
  			</tr>
		</table>
	</td>		
</tr>	

</table>
<gw:textbox id="txtEmp_PK"  styles="display:none"/>
<gw:textbox id="txtYear"  styles="display:none"/>
</body>
</html>
