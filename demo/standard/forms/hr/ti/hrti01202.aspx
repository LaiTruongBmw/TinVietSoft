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
	txtTmp1.text="<%=request.QueryString("year")%>";
	idGrid.GetGridControl().ScrollTrack=true;
	datAllowance.Call("SELECT");
}
function allowance_grid_control(obj)
{
    var icol=6; //value of allowance col
        obj.SetGridText(0,icol,grdAllowance.GetGridData(1,0));
        obj.SetGridText(0,icol+1,grdAllowance.GetGridData(1,1));
        obj.SetGridText(0,icol+2,grdAllowance.GetGridData(1,2));
        obj.SetGridText(0,icol+3,grdAllowance.GetGridData(1,3));
        obj.SetGridText(0,icol+4,grdAllowance.GetGridData(1,4));
        obj.SetGridText(0,icol+5,grdAllowance.GetGridData(1,5));
        obj.SetGridText(0,icol+6,grdAllowance.GetGridData(1,6));
        obj.SetGridText(0,icol+7,grdAllowance.GetGridData(1,7));
        obj.GetGridControl().ColHidden(icol)=!(Number(grdAllowance.GetGridData(1,8)));
        obj.GetGridControl().ColHidden(icol+1)=!(Number(grdAllowance.GetGridData(1,9)));
        obj.GetGridControl().ColHidden(icol+2)=!(Number(grdAllowance.GetGridData(1,10)));
        obj.GetGridControl().ColHidden(icol+3)=!(Number(grdAllowance.GetGridData(1,11)));
        obj.GetGridControl().ColHidden(icol+4)=!(Number(grdAllowance.GetGridData(1,12)));
        obj.GetGridControl().ColHidden(icol+5)=!(Number(grdAllowance.GetGridData(1,13)));
        obj.GetGridControl().ColHidden(icol+6)=!(Number(grdAllowance.GetGridData(1,14)));
        obj.GetGridControl().ColHidden(icol+7)=!(Number(grdAllowance.GetGridData(1,15)));
      
}

function view_all()
{
    
}
function OnDataReceive(obj)
{ 
if(obj.id=="datAllowance")
    {allowance_grid_control(idGrid);
    dat_chba0007_02.Call('SELECT');
    }


  
    //if(obj.id=="dat_chba0007_01")
 //       idrecord.text=idGrid.rows-1+" Records."
}

</script>
<body>
<gw:data id="dat_chba0007_02" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="" function="ST_HR_SEL_HRTI01202_0"> 
                <input bind="idGrid" >
                    <input bind="iduser_pk" />
                    <input bind="txtTmp1" />
                 </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datAllowance" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid" function="hr.sp_sel_allowance_salary" > 
                <input bind="grdAllowance" >
                </input>
                <output  bind="grdAllowance" />
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
						header="Full Name|Emp ID|Join DT|Salary L1|Salary L2|Confirm DT|ALL1|ALL2|ALL3|ALL4|ALL5|ALL6|ALL7|ALL8"   
						format="0|0|4|1|1|4|1|1|1|1|1|1|1|1"  
						aligns="2|2|2|1|1|2|1|1|1|1|1|1|1|1"  
						defaults="|||||||||||||"  
						editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
						widths="3000|1500|1500|1000|1000|1500|1000|1000|1000|1000|1000|1000|1000|1000"  
						styles="width:100%; height:100%"   acceptNullDate
						sorting="T"   
						param="0,1,2,3"  /> 
	
  				</td>
  			</tr>
		</table>
	</td>		
</tr>	
</table>
<gw:grid   
    id="grdAllowance"  
    header="Code Name 1|Code Name 2|Code Name 3|Code Name 4|Code Name 5|Code Name 6|Code Name 7|Code Name 8|Display 1|Display 2|Display 3|Display 4|Display 5|Display 6|Display 7|Display 8"
    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
    aligns="0|2|2|1|0|0|1|1|2|1|0|0|0|0|0|0"  
    defaults="||||||||||||||"  
    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
    widths="0|1500|1600|1000|2500|1500|1700|1500|1700|1500|1500|1200|1200|1200|1200|1200"  
    styles="display:none" 
    sorting="T"    
/>
<gw:textbox id="txtTmp1" styles="display:none"/>
<gw:textbox id="txtTmp2" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>

</body>
</html>
