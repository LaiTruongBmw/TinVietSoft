<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Monthly Production</title>
</head>

<script type="text/javascript" src="../../tutorial/google_control/jsapi.js"></script>

<script type="text/javascript" src="../../tutorial/google_control/columnchart.js"></script>

<script> 
	  google.load('visualization', '1', {packages: ['corechart']});
      google.setOnLoadCallback(OnComboChart);
//===============================================================================================
 function BodyInit()
 {   
    System.Translate(document);
    BindingDataList();

 } 
 //========================================================================
function BindingDataList()
{        
     var data = "<%=ESysLib.SetListDataSQL("SELECT pk, grp_cd || ' - ' || grp_nm FROM tlg_it_itemgrp WHERE del_if = 0 ORDER BY grp_cd" )%>";    
     lstFactory.SetDataText(data);
} 
//===============================================================================================
 function OnLoadData()
 {			
     data_chart.Call('SELECT');
 }

//===============================================================================================
 function OnDataReceive(obj)
 {
     switch(obj.id)
     {
            case "data_chart":             
			    OnComboChart();
            break;
     } 
 }
//===================================================================================
function OnComboChart()
{
        if(grdData.rows-1 == 0) return;
        var count = 0;
	    var data = new google.visualization.DataTable();
	    data.addColumn('string', 'Month');
	    for(var x = 1; x < grdData.cols-1; x++)
	    { 
	        if(grdData.GetGridData(1,x) != '')
	        {
	            data.addColumn('number', 'Group ' + x);
	            count++;
	        }
	    }
		
		data.addRows(grdData.rows);
		for(var i = 1; i < grdData.rows; i++)
		{
		    for( var a = 0; a <= count; a++)
		    {
		    	if(a==0)
				data.setValue(i-1,a,grdData.GetGridData(i,0)+"")
				else 
				data.setValue(i-1,a,grdData.GetGridData(i,a)*1);
		    }
		}

	    var options = {
          title : 'Product Selling Price',
          vAxis: {title: "Product Selling Quantity"},
          hAxis: {title: "Months"},
          seriesType: "line",
          series: {5: {type: "line"}},
          tooltip: { showColorCode : true }
        };
	
	    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	    chart.draw(data, options);
}
</script>

<body>
    <!--============================================= Search =====================================-->
    <gw:data id="data_chart" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	id="2"	type="grid"	parameter="0,1"	function="<%=l_user%>LG_SEL_FPRM00020"	>	
				<input>
					<input	bind="lstFactory"	/>	
					<input	bind="dtFrom"	/>	
				</input>	
				<output	bind="grdData"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!---------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 1%">
            <td style="width:8%">
                Item Group
            </td>
            <td style="width: 25%">
                <gw:list id="lstFactory" styles="width:100%;" />
            </td>
            <td style="width: 10%">
                <gw:datebox id="dtFrom" type="month" styles="width:100%" lang="<%=Session("Lang")%>" />
            </td>
            <td style="width: 60%">
                <gw:icon id="btnChart" img="2" text="Chart" styles='width:5%' onclick="OnLoadData()" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="4">
                <div id="chart_div" style="width: 100%; height: 100%">
                </div>
            </td>
        </tr>
    </table>
    <gw:grid id='grdData' header='MONTHS|C01|C02|C03|C04|C05|C06|C07|C08|C09|C10|C11|C12'
        format='0|1|1|1|1|1|1|1|1|1|1|1|1' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
        editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='0|0|0|0|0|0|0|0|0|0|0|0|0' sorting='T'
        autosize='T' styles='width:100%; height:100%; display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
