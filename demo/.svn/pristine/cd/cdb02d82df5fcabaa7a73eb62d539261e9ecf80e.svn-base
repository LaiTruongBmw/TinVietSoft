<!-- #include file="../../../../system/lib/form.inc"  -->
<% CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Time machine info</title>
</head>
<script>
var d0,d1,d2
var v_language = "<%=Session("SESSION_LANG")%>";
function BodyInit()
{
    idGrid.GetGridControl().ScrollTrack=true;
    if (v_language!="ENG")
        System.Translate(document);
	idEmp_id.text="<%=request.QueryString("emp_id")%>";
	d0=txtdt0.text="<%=request.QueryString("work_dt")%>";
	d1=txtdt1.text="<%=request.QueryString("dt1")%>";
	d2=txtdt2.text="<%=request.QueryString("dt2")%>";
	
	data_hrti01601_0.Call("SELECT");
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
    data_hrti01601_0.Call("SELECT");
    
}
function OnDataReceive(obj)
{
    if(obj.id=="data_hrti01601_0")
    {
        for(var i=1;i<idGrid.rows;i++)
            if(d1==idGrid.GetGridData(i,5)||d2==idGrid.GetGridData(i,5))
            {
                idGrid.SetCellBgColor(i, 0,i, 4, 0xF7EFE1 );
                idGrid.SetCellBold(i,0,i,4,true);    
             }   
    }
}
function onCellChange()
{
    var ctrl=idGrid.GetGridControl();
    var flag=0;
    if(ctrl.col==5||ctrl.col==6)
    {
        for(var i=1;i<ctrl.rows;i++)
        {
            if(idGrid.GetGridData(i,ctrl.col)=='-1')
                flag+=1;
            if(flag>1)
            {
                alert("You only can check one for in or out");
                return;
            }        
         }       
    }
}

function OnOK()
{
    var ctrl=idGrid.GetGridControl();
    var flag=0;
    var obj= Array();
    obj[0]="";
    obj[1]="";
    obj[2]="";
    obj[3]="";
    for(var i=1;i<ctrl.rows;i++)
    {
        if(idGrid.GetGridData(i,5)=='-1')
        {
            obj[0]=idGrid.GetGridData(i,3); //dt
            obj[1]=idGrid.GetGridData(i,4); //time
            flag+=1;
        }    
        if(flag>1)
        {
            alert("You only can check one for in time");
            return;
        }        
     }       
    flag=0; 
    for(var i=1;i<ctrl.rows;i++)
    {
        if(idGrid.GetGridData(i,6)=='-1')//for out
        {
            obj[2]=idGrid.GetGridData(i,3); //dt
            obj[3]=idGrid.GetGridData(i,4); //time
            flag+=1;
        }    
        if(flag>1)
        {
            alert("You only can check one for out time");
            return;
        }        
     }      
	window.returnValue = obj; 
	window.close();
}

</script>
<body>
<gw:data id="data_hrti01601_0" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="" function="ST_HR_SEL_HRTI01601_0"> 
                <input bind="idGrid" >
                    <input bind="idEmp_id" />
					<input bind="txtdt0" />
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
	    
		<table width="100%" height=100%>		
			<tr>
				<td align = top height=100%>					
					<gw:grid   
						id="idGrid"  
						header="Mã Máy CC|Mã Nhân Viên|Thẻ Chấm Công|Ngày Quét|Thời Gian Quét|_Set In|_Set Out|Ngày Tạo Dữ Liệu|_Time Type|_Day Type"   
						format="0|0|0|4|0|3|3|0|0|0"  
						aligns="0|0|0|0|0|0|0|0|0|0"  
						defaults="|||||||||"  
						editcol="0|0|0|0|0|0|0|0|0|0"  
						widths="1000|1300|1300|1300|1000|1000|1000|2000|1500|1300"  
						styles="width:100%; height:90%"   
						sorting="T" 
						autosize= true
						param="0,1,2,3,4,5" oncellclick="onCellChange()"/> 
	
  				</td>
  			</tr>
		</table>
		<table width="100%" height=10%>		
			<tr>
			    <td width="40%"></td>
				<td width="20%"><gw:icon id="idBtnSet"  styles='width:90%' img="in"  text="OK"  onclick="OnOK()"/></td>
				<td width="40%"></td>
  			</tr>
		</table>
	</td>		
</tr>	
</table>
<gw:textbox id="txtdt0" styles="display:none"/>
<gw:textbox id="txtdt1" styles="display:none"/>
<gw:textbox id="txtdt2" styles="display:none"/>
<gw:textbox id="idEmp_id" styles="display:none"/>

</body>
</html>
