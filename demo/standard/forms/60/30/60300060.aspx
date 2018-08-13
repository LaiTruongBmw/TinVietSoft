<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

 <script type="text/javascript" src="/gsys/system/controls/google/jsapi.js"></script>
 <script type="text/javascript" src="/gsys/system/controls/google/columnchart.js"></script>
<script>
var chart = null;
var data = null;
google.load('visualization', '1', {packages: ['corechart']});
//google.setOnLoadCallback(drawChart);

function BodyInit()
{
    OnSearch();
}   
function drawChart() {
        data = new google.visualization.DataTable();
        data.addColumn('string', 'Date');
        data.addColumn('number', 'DEF');
        data.addColumn('number', 'OOO');
		data.addColumn('number', 'Tentitive');
		data.addColumn('number', 'Commitment');
		data.addColumn('number', 'Allotment');
		data.addColumn('number', 'Waiting');
		data.addRows(grddata.rows);
		
		for (var i=1;i<grddata.rows;i++){ 
		    for(var j=0;j<7;j++){
				if(j==0)
				  data.setValue(i-1,j,grddata.GetGridData(i,0)+"")
				else 
				  data.setValue(i-1,j,grddata.GetGridData(i,j)*1);
			}
	    }

       var options = {
          title : 'Occupancy Chart',
		  width:800,
		  height:500,
          vAxis: {title: "Room"},
          hAxis: {title: "Date"},
          seriesType: "bars",
		  isStacked: true,
		  colors:['#9c3063','#de0000','#087d00','#ffff00','#00ffff','#f2c119'],
          series: {10: {type: "line"}}
        };
        chart_div.innerHTML =  "";
        chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
		//google.visualization.events.addListener(chart, 'select', selectHandler);

 }
 function selectHandler(e) {
 var item=chart.getSelection();
 var str = data.getFormattedValue(0, item[0].column);
  alert(str);
}
function OnDataReceive(obj){
	if(obj.id == "dsoChartData"){
		drawChart();
	}
}
function OnSearch(){
	dsoChartData.Call("SELECT");
}
</script>

<body style="margin: 0; padding: 0;">
    <!---------------------------------------------------------------------------------------------------------------->
	<gw:data id="dsoChartData" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="grid" function="st_ht_sel_60300060_chart" > 
                <input bind="grddata" > 
                    <input bind="dtDate" />
                </input> 
                <output bind="grddata" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table width="100%">
		<tr>
			
			<td rowspan="2" valign="top">
				<table width="400px" height="100%">
					<tr>
						<td valign="top">
							<gw:grid   
								id="grddata"  
								header="Date|DEF|OOO|Tentitive|Commitment|Allotment|Waiting"
								format="0|0|0|0|0|0|0"
								aligns="0|0|0|0|0|0|0"
								defaults="0|0|0|0|0|0|0"
								editcol="0|0|0|0|0|0|0"
								widths="0|0|0|0|0|0|0"
								styles="width:100%; height:500px;" 
								acceptNullDate="T"
								autosize="true"
								debug="false"
								sorting="T"    
							/> 
						</td>
					</tr>
				</table>
			</td>
			<td style="width:1%;white-space:nowrap;padding-right:5px">Start Date </td>
		    <td style="width:1%"><gw:datebox id="dtDate" type="date" styles="width:100%" lang="1" /></td>
			<td style="width:1%"><gw:icon id="idBtnDraw" img="in" text="Draw Chart" styles='width:100%' onclick="OnSearch()" /></td>
			<td>&nbsp;</td>
			
		</tr>
		<tr>
		    <td colspan="4" style="width:800px">
			   <div id="chart_div"></div>
			</td
		</tr>
	</table>
</body>
</html>
