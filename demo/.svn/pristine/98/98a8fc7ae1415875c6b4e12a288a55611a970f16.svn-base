<!-- #include file="../../../../system/lib/form.inc"  -->
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Time summary</title>
</head>
<script>
var d1,d2
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    //if (v_language!="ENG")
        System.Translate(document);
	iduser_pk.text="<%=request.QueryString("emp_pk")%>";
	txtdt1.text="<%=request.QueryString("dt")%>";
	idGrid.GetGridControl().ScrollTrack=true;
	if(txtdt1.text.length>4)
	    idRecord.text="Time summary in: "+ txtdt1.text.substr(4,2)+"/"+txtdt1.text.substr(0,4);
	else
	     idRecord.text="Time summary in: "+txtdt1.text;
	
	dat_chba0003_02.Call("SELECT");
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
    if(obj.id=="dat_chba0003_02")
    {
         var wt,ot,nt,hr
         wt=ot=nt=ht=0;
        for(var i=1;i<idGrid.rows;i++)
        {
           if(!isNaN(idGrid.GetGridData(i,5)))
                wt+=Number(idGrid.GetGridData(i,5));
           if(!isNaN(idGrid.GetGridData(i,6)))
                ot+=Number(idGrid.GetGridData(i,6));
           if(!isNaN(idGrid.GetGridData(i,7)))
                nt+=Number(idGrid.GetGridData(i,7));
           if(!isNaN(idGrid.GetGridData(i,8)))
                ht+=Number(idGrid.GetGridData(i,8));               
        }   
        idGrid.AddRow();
        idGrid.SetGridText(idGrid.rows-1,0,"Total"); 
        idGrid.SetGridText(idGrid.rows-1,5,wt); 
        idGrid.SetGridText(idGrid.rows-1,6,ot);
        idGrid.SetGridText(idGrid.rows-1,7,nt);
        idGrid.SetGridText(idGrid.rows-1,8,ht);
        idGrid.SetCellBgColor(idGrid.rows-1, 0,idGrid.rows-1, 8, 0x3366FF );
        idGrid.SetCellBold(idGrid.rows-1,0,idGrid.rows-1,8,true);
        
    }
    
}

</script>
<body>
<gw:data id="dat_chba0003_02" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="" function="ST_HR_SEL_HRTI00802_0"> 
                <input bind="idGrid" >
                    <input bind="iduser_pk" />
                    <input bind="txtdt1" />
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
				<td align=center style="width:100%"><gw:label id="idRecord" text="" styles="width:100%" ></gw:label></td>
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
<gw:textbox id="iduser_pk" styles="display:none"/>

</body>
</html>
