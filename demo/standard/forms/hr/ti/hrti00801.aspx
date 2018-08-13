<!-- #include file="../../../../system/lib/form.inc"  -->
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Time machine info</title>
</head>
<script>
var d1,d2
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    //if (v_language!="ENG")
        System.Translate(document);
	idEmp_id.text="<%=request.QueryString("emp_id")%>";
	d1=txtdt1.text="<%=request.QueryString("dt1")%>";
	d2=txtdt2.text="<%=request.QueryString("dt2")%>";
	idGrid.GetGridControl().ScrollTrack=true;
	dat_chba0003_01.Call("SELECT");
}

function DSOReceive( dsoinfo  )
{

	if ( dsoinfo.errno > 0 )
	{
		alert( dsoinfo.errmsg );
		return ;
	}	
}
function view_all()
{
    txtdt1.text=txtdt1.text.substr(0,6)+""+"01";
    txtdt2.text=txtdt1.text.substr(0,6)+""+"31";
    dat_chba0003_01.Call("SELECT");
    
}
function OnDataReceive(obj)
{
    if(obj.id=="dat_chba0003_01")
    {
        for(var i=1;i<idGrid.rows;i++)
            if(d1==idGrid.GetGridData(i,5)||d2==idGrid.GetGridData(i,5))
            {
                idGrid.SetCellBgColor(i, 0,i, 4, 0xF7EFE1 );
                idGrid.SetCellBold(i,0,i,4,true);    
             }   
    }
}

</script>
<body>
<gw:data id="dat_chba0003_01" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="" function="ST_HR_SEL_HRTI00801_0"> 
                <input bind="idGrid" >
                    <input bind="idEmp_id" />
                    <input bind="txtdt1" />
                    <input bind="txtdt2" />
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
				<td align=Center width=100%><a class="eco_link" title="Click here to show all" onclick="view_all()" href="#tips" style="text-decoration: none; color=#0000ff" style="font-size=16;">Click here to view all in month</a></td>
  			</tr>
		</table>
		<table width="100%" height=95%>		
			<tr>
				<td align = top height=100%>					
					<gw:grid   
						id="idGrid"  
						header="Emp ID|Card ID|Date|In|Out|WT|OT|NT|HT"   
						format="0|0|0|0|0|0|0|0|0"  
						aligns="0|0|0|0|0|0|0|0|0"  
						defaults="||||||||"  
						editcol="0|0|0|0|0|0|0|0|0"  
						widths="1500|1500|1500|1000|800|800|800|800|800"  
						styles="width:100%; height:90%"   
						sorting="T" /> 
	
  				</td>
  			</tr>
		</table>
	</td>		
</tr>	
</table>
<gw:textbox id="txtdt1" styles="display:none"/>
<gw:textbox id="txtdt2" styles="display:none"/>
<gw:textbox id="idEmp_id" styles="display:none"/>

</body>
</html>
