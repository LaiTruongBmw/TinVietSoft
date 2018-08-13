<!-- #include file="../../../../system/lib/form.inc"  -->
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
</head>
<script>

var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    if (v_language!="ENG")
        System.Translate(document);
    idGrid.GetGridControl().ScrollTrack=true;
	txtCode.text="<%=request.QueryString("code")%>";
	txtID.text="<%=request.QueryString("id")%>";
	dat_Common_Code.Call("SELECT");
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
    if(obj.id=="dat_Common_Code")
    {
        for(var i=1;i<idGrid.rows;i++)
            if(txtCode.text==idGrid.GetGridData(i,0))
            {
                idGrid.SetCellBgColor(i, 0,i, 3, 0xcc99ff );
                idGrid.SetCellBold(i,0,i,3,true);    
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
       obj[0]=idGrid.GetGridData(irow,0); //pk
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
<gw:data id="dat_Common_Code" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="" function="ST_HR_SEL_HREM01001_1"> 
                <input bind="idGrid" >
                    <input bind="txtID" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>

<table align = top style='margin-left:10px' class="itable" cellspacing=0 cellpadding=0 border=0 style="width:100%;height:100%;">
 <tr>
	<td> 	
	    <table width="100%" height=7% cellspacing=0 cellpadding=0 >		
			<tr>
				<td align = top width=100%>Double click to choose</td>
  			</tr>
		</table>
		<table width="100%" height=93% border=1 cellspacing=0 cellpadding=0 >		
			<tr>
				<td align = top height=100% >					
					<gw:grid   
						id="idGrid"  
						header="Code|English|VietNamese|Korean"   
						format="0|0|0|0"  
						aligns="1|0|0|0"  
						defaults="|||"  
						editcol="0|0|0|0"  
						widths="700|2000|2000|2000"  
						styles="width:100%; height:100%"   
						sorting="T"   
						param="0,1,2,3,4" oncelldblclick="OnSelect()" /> 
	
  				</td>
  			</tr>
		</table>
	</td>		
</tr>	
</table>
<gw:textbox id="txtCode"  styles="display:none"/>
    <gw:textbox id="txtID" styles="display:none" >
</gw:textbox>
</body>
</html>
