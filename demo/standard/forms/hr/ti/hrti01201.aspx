<!-- #include file="../../../../system/lib/form.inc"  -->
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Absence Annual leave info</title>
</head>
<script>

var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    //if (v_language!="ENG")
        System.Translate(document);
	iduser_pk.text="<%=request.QueryString("emp_pk")%>";
	txtTmp1.text="<%=request.QueryString("mon")%>";
	txtTmp2.text="<%=request.QueryString("flag")%>";
	idGrid.GetGridControl().ScrollTrack=true;
	dat_chba0007_01.Call("SELECT");
}


function view_all()
{
    txtTmp2.text="3";
    dat_chba0007_01.Call("SELECT");
    
}
function OnDataReceive(obj)
{
    if (obj.id == "dat_chba0007_01")
        idrecord.text = idGrid.rows - 1;
}

</script>
<body>
<gw:data id="dat_chba0007_01" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="" function="ST_HR_SEL_HRTI01201_0"> 
                <input bind="idGrid" >
                    <input bind="iduser_pk" />
                    <input bind="txtTmp1" />
                    <input bind="txtTmp2" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>

<table align = top class="itable" cellspacing=0 cellpadding=0 border=1 style="width:100%;height:100%;">
 <tr>
	<td> 	
	    <table width="100%" height=5%>		
			<tr>
				<td align=left width=80%><a class="eco_link" title="Click here to show all" onclick="view_all()" href="#tips" style="text-decoration: none; color=#0000ff" style="font-size=16;"><u><b>Annual leave used (Click here to view all)</b></u></a></td>
				<td align=right width=20%><b><gw:label id="idrecord" styles="width:100%;color:red"></gw:label></b></td>
  			</tr>
		</table>
		<table width="100%" height=95%>		
			<tr>
				<td align = top height=100%>					
					<gw:grid   
						id="idGrid"  
						header="Full Name|Emp ID|Absence Date|Time"   
						format="0|0|0|0"  
						aligns="0|0|0|0"  
						defaults="|||"  
						editcol="0|0|0|0"  
						widths="3000|1500|1500|500"  
						styles="width:100%; height:100%"   
						sorting="T"   
						param="0,1,2,3"  /> 
	
  				</td>
  			</tr>
		</table>
	</td>		
</tr>	
</table>
<gw:textbox id="txtTmp1" styles="display:none"/>
<gw:textbox id="txtTmp2" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>

</body>
</html>
