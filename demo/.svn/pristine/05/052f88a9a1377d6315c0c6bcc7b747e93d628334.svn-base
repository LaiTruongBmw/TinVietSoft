<!-- #include file="../../../../system/lib/form.inc"  -->
<% CtlLib.SetUser(Session("APP_DBUSER"))%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Work Shift information</title>
</head>
<script>

var v_language = "<%=Session("SESSION_LANG")%>";
var init_from;
function BodyInit()
{
    System.Menu.LoadDictionaryForPopup(System.Menu.OnGetID(window.location.toString()));
	init_from = setInterval(function(){ if(System.Menu.init_lang == "Y")BodyProcess(); }, 1000);
}
function BodyProcess(){
	clearInterval(init_from);
	System.Translate_V2(document, System.Menu.GetMenuPS());
	idGrid.GetGridControl().ScrollTrack=true;
    ////if (v_language!="ENG")
        System.Translate(document);
	idShift.text="<%=request.QueryString("shift")%>"
	
	dat_agbh0005_01.Call("SELECT")
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
    if(obj.id=="dat_agbh0005_01")
    {
        for(var i=1;i<idGrid.rows;i++)
            if(idShift.text==idGrid.GetGridData(i,6))
            {
                idGrid.SetCellBgColor(i, 0,i, 5, 0x3366FF );
                idGrid.SetCellBold(i,0,i,5,true);    
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
<body bgcolor='#FFFFFF' style="overflow:hidden;">
<gw:data id="dat_agbh0005_01" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="" function="ST_HR_SEL_HRCO00200_0"> 
                <input bind="idGrid" >
                    <input bind="idShift" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>

<table align = top cellspacing=0 cellpadding=0 border="0" style="width:100%;height:100%;">
 <tr>
	<td> 	
	    <table width="100%" height=5% cellspacing=0 cellpadding=0>		
			<tr>
				<td align = top width=99% style="height:30px"><b style="color:Red">Work shift information</b></td>
				<% 
					IF Session("CODEADMIN_YN").ToString() = "Y" AND Session("SESSION_LANG").ToString() = "ENG" THEN
				%>
					<td><gw:button img="search" alt="Dictionary" id="Dictionary" text="Dic" onclick="System.GetDataLanguage_Popup(document,window.location.toString(),'<%=Session("SESSION_LANG")%>','<%=Session("CODEADMIN_YN")%>');" /></td>
				<% END IF %>
  			</tr>
		</table>
		<table width="100%" height=95% cellspacing=0 cellpadding=0>		
			<tr>
				<td align = top height=100% width="100%">					
					<gw:grid   
						id="idGrid"  
						header="Shift|Start|End|Start Meal|End Meal|During day|_WS_PK|WT Plus|Start OT"   
						format="0|0|0|0|0|0|0|0|0"  
						aligns="0|0|0|0|0|0|0|0|0"  
						defaults="||||||||"  
						editcol="0|0|0|0|0|0|0|0|0"  
						widths="500|1000|1000|1000|1000|1000|0|1000|1000"  
						styles="width:100%; height:100%"   
						sorting="T"   
						param="0,1,2,3,4,5,6,7" /> 
	
  				</td>
  			</tr>
		</table>
	</td>		
</tr>	
</table>
<gw:textbox id="idShift" styles="display:none"/>

</body>
</html>
