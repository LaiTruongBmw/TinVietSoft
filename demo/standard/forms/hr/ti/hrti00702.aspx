<!-- #include file="../../../../system/lib/form.inc"  -->
<% CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Work Shift information</title>
</head>
<script>

var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    idGrid.GetGridControl().ScrollTrack=true;
    //if (v_language!="ENG")
        System.Translate(document);
	idShift.text="<%=request.QueryString("shift")%>"
	iduser_pk.text = "<%=session("USER_PK")%>";
     
	dat_chba0002_02.Call("SELECT")
}

function DSOReceive( dsoinfo  )
{

	if ( dsoinfo.errno > 0 )
	{
		alert( dsoinfo.errmsg );
		return ;
	}	
}
function OnDataReceive(obj)
{
    if(obj.id=="dat_chba0002_02")
    {
        for(var i=1;i<idGrid.rows;i++)
            if(idShift.text==idGrid.GetGridData(i,6))
            {
                idGrid.SetCellBgColor(i, 0,i, 8, 0x3366FF );
                idGrid.SetCellBold(i,0,i,8,true);    
             }   
    }
}
function OnSelect()
{
    
    var obj= Array();
    var irow;
    irow=idGrid.row;
    if (irow>0) 
    {
        obj[0]=idGrid.GetGridData(irow,6); //pk
    }    
    else 
    {
        obj=null;
    }
	window.returnValue = obj; 
	window.close();
}

</script>
<body>
<gw:data id="dat_chba0002_02" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="" function="ST_HR_SEL_HRTI00702_0"> 
                <input bind="idGrid" >
                    <input bind="idShift" />
                    <input bind="iduser_pk" />
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
				<td align = top width=100%><b style="color:Red">Double click to choose.</b></td>
  			</tr>
		</table>
		<table width="100%" height=95%>		
			<tr>
				<td align = top height=100%>					
					<gw:grid   
						id="idGrid"  
						header="Shift|Start|End|Start Meal|End Meal|During day|_WS_PK|WT Plus|Start OT"   
						format="0|0|0|0|0|0|0|0|0"  
						aligns="0|0|0|0|0|0|0|0|0"  
						defaults="||||||||"  
						editcol="0|0|0|0|0|0|0|0"  
						widths="500|1000|1000|1000|1000|1000|0|1000|1000"  
						styles="width:100%; height:100%"   
						sorting="T"   
						param="0,1,2,3,4,5,6,7,8" oncelldblclick="OnSelect()" /> 
	
  				</td>
  			</tr>
		</table>
	</td>		
</tr>	
</table>
<gw:textbox id="idShift" styles="display:none"/>
<gw:textbox id="txtEmp_PK" styles="display:none"/>
    <gw:textbox id="iduser_pk" styles="display:none"/>
    

</body>
</html>
