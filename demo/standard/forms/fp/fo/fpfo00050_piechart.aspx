<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
  <head>
    <script type="text/javascript" src="../../tutorial/google_control/jsapi.js"></script>
    <script type="text/javascript" src="../../tutorial/google_control/piechart.js"></script>
    <script type="text/javascript">
    var type = "<%=request.QueryString("dtType") %>"  ;
    var from = "<%=request.QueryString("dtFrom") %>"  ;
    var to = "<%=request.QueryString("dtTo") %>"  ;
    var orderNo = "<%=request.QueryString("orderNo") %>"  ;
     
     google.load("visualization", "1", {packages:["piechart"]});
     google.setOnLoadCallback(drawChart);
      function drawChart() 
      {
        lstType.text = type
        txtFrom.text = from
        txtTo.text = to
        orderNo.text = orderNo
        fpep00050.Call('SELECT') ;        
      }
    function OnDataReceive(obj)
    {
        var data = new google.visualization.DataTable();
         data.addColumn('string', 'Defect Type');
         data.addColumn('number', 'Defect Type Quantity');
         data.addRows(grdDefect.rows-1);
        for (var i =1 ; i< grdDefect.rows; i ++)
        {
            data.setValue(i-1, 0, grdDefect.GetGridData(i,0)+"");
            data.setValue(i-1, 1, Number(grdDefect.GetGridData(i,1)));
        }
        
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, {width: 400, height: 300, is3D: true, title: 'OQC DEFECT'});
    }
    </script>
  </head>

  <body>
         <gw:data id="fpep00050" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpfo00050_1" > 
                    <input bind="grdDefect" > 
                        <input bind="lstType" /> 
                        <input bind="txtFrom" /> 
                        <input bind="txtTo" />  
                        <input bind="orderNo" />
                       
                    </input> 
                    <output bind="grdDefect" /> 
                </dso> 
            </xml> 
        </gw:data>
        
        <table width="100%" style="height:100%">
            <tr style="height:95%">
                <td >
                        <div id="chart_div"></div>
                </td>
            </tr>
        </table>
  </body>
      <gw:textbox id="lstType" styles="width:100%;display:none;"  />
      <gw:textbox id="txtFrom" styles="width:100%;display:none;"  />
      <gw:textbox id="txtTo" styles="width:100%;display:none;"  />
      <gw:textbox id="orderNo" styles="width:100%;display:none;"  />
      
      <gw:grid id='grdDefect' 
        header='defecttype|1'
        format='0|0'
        aligns='0|0'
        defaults='||'
        editcol='1|1'
        widths='1000|1000'
        sorting='T'
        styles='width:100%; height:100%;display:none' />
</html>