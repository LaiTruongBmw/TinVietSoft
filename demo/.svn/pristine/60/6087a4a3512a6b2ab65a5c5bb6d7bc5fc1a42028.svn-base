<!-- #include file="../../../../system/lib/form.inc"  -->
<% CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Absence Code Info</title>
</head>
<script>
var flag;
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    idGrid.GetGridControl().ScrollTrack=true;
    ////if (v_language!="ENG")
        System.Translate(document);
	idabs_code.text="<%=request.QueryString("abs_code")%>"
	flag="<%=request.QueryString("flag")%>"
	dat_chba0002_03.Call("SELECT")
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
    if(obj.id=="dat_chba0002_03")
    {
        for(var i=1;i<idGrid.rows;i++)
            if(idabs_code.text==idGrid.GetGridData(i,0))
            {
                idGrid.SetCellBgColor(i, 0,i, 6, 0xcc99ff );
                idGrid.SetCellBold(i,0,i,6,true);    
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
        if(idGrid.GetGridData(irow,0)=="04")
        {
            alert("This reason not allow here.\n Lý do thai sản không được phép chọn ở đây");
            obj=null;
            return;
        }
        else
            {obj[0]=idGrid.GetGridData(irow,0); //pk
			obj[1]=idGrid.GetGridData(irow,6); //short-name
			}
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
<gw:data id="dat_chba0002_03" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="" function="ST_HR_SEL_HRCO00600_0"> 
                <input bind="idGrid" >
                    <input bind="idabs_code" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>

<table align = top style='margin-left:10px' class="itable" cellspacing=0 cellpadding=0 border=0 style="width:100%;height:100%;">
 <tr>
	<td> 	
	    <table width="100%" height=7% cellspacing=0 cellpadding=0>		
			<tr>
				<td align = top width=100%><b style="color:#FF0066;font-size:15"> <%If Request.QueryString("flag") = 1 Then Response.Write("Double click to choose.")%></b></td>
  			</tr>
		</table>
		<table width="100%" border=1 height=93% cellspacing=0 cellpadding=0>		
			<tr>
				<td align = top height=100%>					
					<gw:grid   
						id="idGrid"  
						header="Code|English|VietNamese|Korean|Company pay|Ins Pay|Short Name"   
						format="0|0|0|0|0|0|0"  
						aligns="1|0|0|0|0|0|0"  
						defaults="||||||"  
						editcol="0|0|0|0|0|0|0"  
						widths="700|2500|2500|1000|1500|1000|1500"  
						styles="width:100%; height:100%"   
						sorting="T"   
						param="0,1,2,3,4,5,6,7" oncelldblclick="OnSelect()" /> 
	
  				</td>
  			</tr>
		</table>
	</td>		
</tr>	
</table>
<gw:textbox id="idabs_code" styles="display:none"/>

</body>
</html>
