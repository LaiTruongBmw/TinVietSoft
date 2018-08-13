<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser("APP_DBUSER")%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Detail info</title>
</head>
<script>
var d1,d2
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    //if (v_language!="ENG")
        System.Translate(document);
	idDept.text="<%=request.QueryString("p_dept_nm")%>";
	txtdept_pk.text="<%=request.QueryString("p_dept")%>";
	txtFrom.text="<%=request.QueryString("p_from")%>";
	txtTo.text="<%=request.QueryString("p_to")%>";
	idDetail.text="<%=request.QueryString("p_flag")%>";
	txtKind.text="<%=request.QueryString("p_kind")%>";
	txtPos.text="<%=request.QueryString("p_pos")%>";
	idtmp_nm.text="<%=request.QueryString("p_pos_nm")%>";
	txtMainCol.text="<%=request.QueryString("main_col")%>"
	if(idtmp_nm.text=="")
	    idtmp_nm.text="Department";
	else
	{
	    idtmp_nm.text="Position";
	    idDept.text="<%=request.QueryString("p_pos_nm")%>";
	} 
	dat_dms_emp_popup.Call("SELECT");
	
	
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
    dat_chba0002_01.Call("SELECT");
    
}
function OnDataReceive(obj)
{
    if(obj.id=="dat_dms_emp_popup")
    {
        idRecord.text=idGrid.rows-1 +" Records"
        auto_resize_column(idGrid,0,idGrid.cols-1,0);
        
    }
}
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
function onPrint(obj)
{
    obj.GetGridControl().PrintGrid(idDetail.text.text,true,0,0,360);//PrintGrid [ DocName As String ], [ hien thi dialog may in As Boolean ], [ kieu in dung hay ngang As Integer ], [ canh trai phai As Long ], [ canh tren duoi As Long ]
}


</script>
<body>
<gw:data id="dat_dms_emp_popup" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0" function="ST_HR_SEL_HRMR00101_0" > 
                <input bind="idGrid" >
                    <input bind="txtFrom" />
                    <input bind="txtTo" />
                    <input bind="txtdept_pk" />
                    <input bind="txtKind" />
                    <input bind="txtPos" />
                    <input bind="txtMainCol" />
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
			    <td colspan=2 align=left style="width:10%;border:0"><font size=3><gw:label id="idtmp_nm" text=" " styles="width:100%" ></font></gw:label></font></td>
				<td colspan=4 align=left style="width:20%;border:0;color=red;"><font size=3><gw:label id="idDept" text=" " styles="width:100%" ></font></gw:label></td>
				<td colspan=3 align=left style="width:15%;border:0"><font size=3>Detail for</font></td>
				<td colspan=7 align=left style="width:35%;border:0;color=red;"><font size=3><gw:label id="idDetail" text=" " styles="width:100%" ></font></gw:label></td>
				<td align=right style="width:5%;border:0"><gw:imgBtn id="ibtnRpt" alt="Print" img="printer" text="Report" onclick="onPrint(idGrid)" /></td>
				<td colspan=3 align=right style="width:15%;border:0"><font size=3><gw:label id="idRecord" text=" " styles="width:100%" ></font></gw:label></td>
  			</tr>
		</table>
		<table width="100%" height=95%>		
			<tr>
				<td align = top height=100%>					
					<gw:grid   
						id="idGrid"  
						header="Organization|Work Group|Emp ID|Full Name|Join Date|Left Date|Sex|Status|Position|Seniority(M)|Age(Y)"   
						format="0|0|0|0|0|0|0|0|0|0|0"  
						aligns="0|0|0|0|0|0|0|0|0|0|0"  
						defaults="||||||||||"  
						editcol="0|0|0|0|0|0|0|0|0|0|0"  
						widths="2500|2500|1500|1500|1000|1000|1500|1500|1500|1000"  
						styles="width:100%; height:100%"   
						sorting="T"   /> 
	
  				</td>
  			</tr>
		</table>
	</td>		
</tr>	
</table>
<gw:textbox id="txtdept_pk" styles="display:none"/>
<gw:textbox id="txtFrom" styles="display:none"/>
<gw:textbox id="txtTo" styles="display:none"/>
<gw:textbox id="txtKind" styles="display:none"/>
<gw:textbox id="txtPos" styles="display:none"/>
<gw:textbox id="txtMainCol" styles="display:none"/>

</body>
</html>
