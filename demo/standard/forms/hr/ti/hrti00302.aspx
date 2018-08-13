<!-- #include file="../../../../system/lib/form.inc"  -->
<% CtlLib.SetUser(Session("APP_DBUSER"))%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>

var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{   
   
    //if (v_language!="ENG")
        System.Translate(document);	
    datWorkSchedule_view.Call("SELECT");
}
function OnDataReceive(obj)
{
	var i,max_dt=0;
	if(obj.id=="datWorkSchedule_view")
	{
		for(i=1;i<grdView.rows;i++)
				if(max_dt<Number(grdView.GetGridData(i,2)))
					max_dt=Number(grdView.GetGridData(i,2))
					
		for(i=1;i<grdView.rows;i++)
			if(max_dt>Number(grdView.GetGridData(i,2)))
				grdView.SetCellBgColor( i, 0,i, 2, 0xd4d2ff );
		
		
				
	}
	
}
</script>

<body bgcolor='#FFFFFF' style="overflow:hidden;">
<gw:data id="datWorkSchedule_view" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="" function="ST_HR_SEL_HRTI00302_0" > 
                <input bind="grdView" >
                </input>
                <output  bind="grdView" />
            </dso> 
        </xml> 
</gw:data>
<table id="tbl" style="width:100%;height:100%" cellpadding="0" cellspacing="0" valign="top" border="0" >	
	<tr style="height:100%">
		<td id="master" width="100%">
			<gw:grid   
			id="grdView"  
			header="Group|Latest Schedule Date|_dt"   
			format="0|0|0"  
			aligns="0|0|0"  
			defaults="||"  
			editcol="0|0|0"  
			widths="3000|3000|0"  
			styles="width:100%; height:100%"   
			sorting="T"   
			param="0,1,2" 
			oncellclick     = "" />
		</td>
	</tr>	
</table>
</body>
</html>

