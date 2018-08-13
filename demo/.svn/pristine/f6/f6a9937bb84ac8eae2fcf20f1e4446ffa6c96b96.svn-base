<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Draw Chart</title>
</head>
      <script type="text/javascript" src="../../tu/google_control/jsapi.js"></script>
	  <!--<script type="text/javascript" src="../../tutorial/google_control/areachart.js"></script>-->
	


<script>


var strcodereturn;
var user;
var v_language = "<%=Session("SESSION_LANG")%>";
var reward_pk="";
var check_init=0;
google.load("visualization", "1", {packages:["columnchart"]});
google.setOnLoadCallback(OnDraw); 
	


function BodyInit()
{    


dtFrom.value=((dtTo.value.substr(0,4)*1-1) + dtTo.value.substr(4,2));
	  id_search.Call("SELECT");
	  
}   
//----------------------------------

function OnDraw()
{ 
	management.style.width="100%";		
	if(grddata.rows>1)
{ var l_width=management.offsetWidth*0.90;
if(td_chart1.style.width=="80%")
l_width=l_width*0.70;
var  l_height=management.offsetHeight*0.90;
	if(chart_detail.style.height=="10%")
	l_height=l_height*0.80;

	if(lstChart.value=='1'||lstChart.value=='2'||lstChart.value=='3'||lstChart.value=='4')
	{
	
			var data = new google.visualization.DataTable();
			  data.addColumn('string', 'Month');
				data.addColumn('number', 'Total');
				data.addColumn('number', 'Male');
				data.addColumn('number', 'Female');
				data.addRows(grddata.rows);
				grddata.SetGridText(0,1,"Total");
				grddata.SetGridText(0,2,"Male");
				grddata.SetGridText(0,3,"Female");
				grddata.GetGridControl().ColHidden(3)=false;
				
			for (var i=1;i<grddata.rows;i++)
			{ for(var j=0;j<4;j++)
				{
				if(j==0)
					data.setValue(i-1,j,grddata.GetGridData(i,0).substr(4,2)+"");
				else 
				{data.setValue(i-1,j,grddata.GetGridData(i,j)*1);
				//grddata.SetGridText(i,j+4,grddata.GetGridData(i,j));
				}
				
				}
				
			}
			chart_div.innerHTML = ""; 
		var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));	
		if(lstChart.value=='1')
		chart.draw(data, {width: l_width, height: l_height, legend: 'bottom', title: (v_language =="ENG")?"Employees Quantity Chart":"BIỂU ĐỒ SỐ LƯỢNG NHÂN VIÊN",vAxis: {title: "persons"},hAxis: {title: "Month"}});
		if(lstChart.value=='2')
		chart.draw(data, {width: l_width, height: l_height, legend: 'bottom', title: 'Seniority Average Chart',vAxis: {title: "months"},hAxis: {title: "Month"}});
		if(lstChart.value=='3')
		chart.draw(data, {width: l_width, height: l_height, legend: 'bottom', title: 'Average labour cost(thousand VND)',vAxis: {title: "VND"},hAxis: {title: "Month"}});
		if(lstChart.value=='4')
		chart.draw(data, {width: l_width, height: l_height, legend: 'bottom', title: 'Resign Employees Chart',vAxis: {title: "persons"},hAxis: {title: "Month"}});
		google.visualization.events.addListener(chart, 'select', function() { 
		//alert("rows "+chart.getSelection()[0].row +" col" +chart.getSelection()[0].column)
		txtvalue.text=grddata.GetGridData(chart.getSelection()[0].row+1,chart.getSelection()[0].column);
		//alert(txtvalue.text);
		txtcol.text=chart.getSelection()[0].column;
		//alert(txtcol.text);
		txtmonth.text=grddata.GetGridData(chart.getSelection()[0].row+1,0);
		grddata.SelectRow(chart.getSelection()[0].row+1);
		if(txtmonth.text!='-1' && txtcol.text!='-1'&& imgArrow2.status != "expand" )
		id_detail.Call("SELECT");
		});
		
	}
	
	
	if(lstChart.value=='5')
	{
	
			var data = new google.visualization.DataTable();
			  data.addColumn('string', 'Month');
				data.addColumn('number', 'Total');
				data.addColumn('number', 'Average');
				grddata.SetGridText(0,1,"Total");
				grddata.SetGridText(0,2,"Avegare");
				grddata.GetGridControl().ColHidden(3)=true;
				data.addRows(grddata.rows);
				
			for (var i=1;i<grddata.rows;i++)
			{ for(var j=0;j<3;j++)
				{
				if(j==0)
					data.setValue(i-1,j,grddata.GetGridData(i,0).substr(4,2)+"");
				else 
					{data.setValue(i-1,j,grddata.GetGridData(i,j)*1);
					 //grddata.SetGridText(i,j+4,grddata.GetGridData(i,j));
					}
				
				}
				
			}
			chart_div.innerHTML = ""; 
		var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));	
		chart.draw(data, {width: l_width, height: l_height, legend: 'bottom', title: 'Factory Labour cost(Million VND)',vAxis: {title: "persons"},hAxis: {title: "Month"}});
		google.visualization.events.addListener(chart, 'select', function() { 
		//alert("rows "+chart.getSelection()[0].row +" col" +chart.getSelection()[0].column)
		txtvalue.text=grddata.GetGridData(chart.getSelection()[0].row+1,chart.getSelection()[0].column);
		//alert(txtvalue.text);
		txtcol.text=chart.getSelection()[0].column;
		//alert(txtcol.text);
		txtmonth.text=grddata.GetGridData(chart.getSelection()[0].row+1,0);
		grddata.SelectRow(chart.getSelection()[0].row+1);
		if(txtmonth.text!='-1' && txtcol.text!='-1' && imgArrow2.status != "expand" )
		id_detail.Call("SELECT");
		});
		
	}
	
		
auto_resize_column(grddata,0,grddata.cols-1,9);   	
}
 
}

//----------------------------------------------------
//----------------------------------------------
function OnDataReceive(obj)
{   
	if(obj.id=="id_search")
	 {
	 
	 OnDraw();
	 }
	if(obj.id=="id_detail")
	{txtmonth.text="-1";
	 txtcol.text="-1";
	 lblRecord.text=(grdEmployee.rows-1)+" rec(s)";
	 auto_resize_column(grdEmployee,0,grdEmployee.cols-1,9);    
	}
	
}

function OnSerch()
{id_search.Call("SELECT");
}
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}

function OnToggle(n,obj)
{  
    
			if(obj.status == "expand")
			{
				
				obj.status = "collapse";
				obj.src = "../../../../system/images/close_popup.gif";
				
				
				if(n==1)
				{
				 td_chart1.style.width="80%";		
				 td_chart2.style.width="20%";		
				}
				else
				{chart_detail.display="none";
				chart_detail.style.height="10%";
				}
				
			}
			else if(obj.status == "collapse")
			{
				
				obj.status = "expand";
				obj.src = "../../../../system/images/iconmaximize.gif";
				if(n==1)
				{
				 td_chart1.style.width="100%";		
				 td_chart2.style.width="20%";		
				}
				else
				{chart_detail.display="";
				lblRecord.text="";
				chart_detail.style.height="0%";
				}
				
			}
	OnDraw();
    
}
//------------------------------------------------
function ShowDetail()
{   if(grddata.row>0)
        {if(grddata.col>=2)
        txtcol.text=grddata.col;
        else 
        txtcol.text="1";
        
		txtmonth.text=grddata.GetGridData(grddata.row,0);
		
		id_detail.Call("SELECT");
		}
}
</script>
<body >
<!-------------------data control----------------------->
<!------------------------------------->
<!------------------------------------------>

<gw:data id="id_search" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" function="ST_HR_SEL_HRMR01200_0" > 
                <input bind="grddata" > 
                    <input bind="lstChart" />
					<input bind="dtFrom" />
					<input bind="dtTo" />
                </input> 
                <output bind="grddata" /> 
            </dso> 
        </xml> 
    </gw:data>
<!-------------------data control----------------------->
<gw:data id="id_detail" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" function="ST_HR_SEL_HRMR01200_1" > 
                <input bind="grdEmployee" > 
                    <input bind="lstChart" />
					<input bind="txtcol" />
					<input bind="txtmonth" />
				</input> 
                <output bind="grdEmployee" /> 
            </dso> 
        </xml> 
    </gw:data>


   <table name="Management"  id="management" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;">
        <tr style="width:100%;height:0%" valign="top" h >
            			<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
						<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
						<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
						<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
						<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
						<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
						<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
						<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
						<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
						<td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td><td width="2%"></td>
					</tr>	
					<tr style="border:0;width:100%;height:5%" valign="center" >
                        <td colspan="5" style="border:0;" align="right" >List Chart</td>
                        <td colspan="10"  style="border:0;" align="left" >
                         <gw:list  id="lstChart" value='1' maxlen = "100" styles='width:100%'onchange="" >
                            <data>
                                |1|Employees Quantity|2|Average Seniority|3|Average labour cost |4|Resign Chart|5|Factory labour Cost
                            </data>
                        </gw:list>
                        </td>
                         <td colspan="5" style="border:0;" align="right">From </td>
				        <td  colspan="4" style="border:0;"><gw:datebox id="dtFrom" value='201201'  type="month" styles="width:100%" lang="<%=Session("Lang")%>" /></td>
				        <td  colspan="1" style="border:0;" align="center">~</b></td>
				        <td colspan="4" style="border:0;"><gw:datebox id="dtTo"  type="month"  styles="width:100%" lang="<%=Session("Lang")%>" /></td>
                        <td colspan="5" style="border:0;" align="right"><gw:icon id="idBtnDraw" img="in" text="Draw Chart" styles='width:100%' onclick="OnSerch()" /></td>
						<td colspan="16" style="border:0;" align="right"><img status="expand" id="imgArrow1" src="../../../../system/images/iconmaximize.gif" alt="Show Chart data"  style="cursor:hand" onclick="OnToggle(1,imgArrow1)"  /></td>
                        
                    </tr>					
                 
					<tr style="border:1;width:100%;height:90%" valign="top">
                        <td colspan=50 style="width:100%;height:100%;"> 
                            <table width="100%" id="tblMaster" style="height:100%" border=1 cellpadding="0" cellspacing="0">
                                <tr style="border:1;width:100%;height:80%" valign="top">
                                    <td  id="td_chart1" width=100%  align=center>
									
								
								<div id="chart_div"></div>
								
                                    
                                     </td>
									  
									  <td id="td_chart2" width=0%  align=center>
									  
									  <gw:grid   
                                        id="grddata"  
                                        header="Month|row1|row2|_row3"
                                        format="5|1|1|1"
                                        aligns="0|0|0|0"
                                        defaults="|||"
                                        editcol="0|0|0|0"
                                        widths="1000|1000|1000|1000"
                                        styles="width:100%; height:100%" 
								        acceptNullDate="T"
										autosize="true"
										debug="false"
                                        sorting="T"    
										oncellclick="ShowDetail()" 
										onafteredit=""
                                        /> 
										
									  </td>
                                 </tr>
								 <tr style="border:0;width:100%;height:5%" valign="top">
                                    <td colspan=2 align=right style="whitespace:nowrap">
									<gw:label id="lblRecord"  text="" maxlen = "100" styles="color:red;width:90%;font-weight: bold;font-size:13" />									
									<img status="expand" id="imgArrow2" src="../../../../system/images/iconmaximize.gif" alt="Show Chart data detail"  style="cursor:hand" onclick="OnToggle(2,imgArrow2)"  />
									
									</td>
                                 </tr>
								 <tr id="chart_detail" style="border:1;width:100%;height:0%" valign="top">
                                
									<td  colspan=2>
									<gw:grid   
                                id="grdEmployee"  
                                header="_PK|Organization|Group|Emp ID|Full Name|Sex|Join Date|Left Date|Seniority|Total Salary|Position|Job|Age"   
							   format="0|0|0|0|0|0|4|4|1|1|0|0|0"
                               aligns="0|0|0|0|0|0|0|0|1|1|0|0|0"
                                defaults="||||||||||||"
                               editcol="0|0|0|0|0|0|0|0|0|0|0|0|0"
                                widths="0|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|1000"
                                styles="width:100%; height:100%"   
                                acceptNullDate
                                sorting="T"                                
                                /> 	
							
								
                                    
                                     </td>
                                 </tr>
								 
                             </table>
                             
                        </td>
                    </tr>
				</table>
          
	

</body>
<gw:textbox id="txtDeptData" styles="display:none"/>
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="txtUpperDept_1" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtReport_tmp" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txtEmp_PK" styles="display:none"/>
<gw:textbox id="txtTimes" styles="display:none"/>
<gw:textbox id="txtCompany_pk" text="" styles="display:none"  />
<gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtvalue" text="-1" styles="display:none"  />
<gw:textbox id="txtcol" text="-1" styles="display:none"  />
<gw:textbox id="txtmonth" text="-1" styles="display:none"  />
<gw:textbox id="txtFlag_View" text="" styles="display:none"  /> 
</html>
