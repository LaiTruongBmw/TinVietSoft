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

    <script type="text/javascript" src="../../tutorial/google_control/areachart.js"></script>

    <script type="text/javascript" src="../../tutorial/google_control/columnchart.js"></script>

    <script type="text/javascript">

    var parent_code   = "<%=request.QueryString("parent_code") %>"  ; 
    var offset        = "<%=request.QueryString("offset") %>"  ;
    var rows_Display  = "<%=request.QueryString("rows_Display") %>"  ;    
           
    google.load("visualization", "1", {packages:["columnchart"]});
    google.setOnLoadCallback(drawChart);
 //=============================================================     
function OnDataReceive(obj)
{
    if ( obj.id == "data_fpgm00062_1" )
    {

        var lastViewRow = Number(offset) + Number(rows_Display) <= grdGrade.rows-1 ? Number(offset) + Number(rows_Display) - 1 : grdGrade.rows-1;
        
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'GradeName');
        
        //------Set Header -----------------
        for ( var mon = 2 ; mon <= grdHeader.GetGridData(1,0) ; mon++ )
        {
            data.addColumn('number',grdHeader.GetGridData(1,mon) );
        }
        
        //------Set Value
        data.addRows(Number(lastViewRow)-Number(offset)+1);

        var k = 0 ;

        for(var i = offset; i<= lastViewRow ; i++ )
        {
            data.setValue(k, 0,grdGrade.GetGridData(i,0));
            
            for (var mon =1 ; mon < grdHeader.GetGridData(1,0) ; mon ++)
            {
                data.setValue(k, mon,Number(grdGrade.GetGridData(i,mon)+"") );
            }
            k=k+1;
        }

        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        chart.draw(data, {width: 900, height: 300, is3D: true, titleColor:'white', backgroundColor:'black', legendBackgroundColor:'black', legendTextColor:'white', title: 'Monitoring Display'});
    }
    else
    {
        data_fpgm00062_1.Call("SELECT");
    }
}
//=======================================================================
function drawChart() 
{
    chart_div.innerHTML = ""; 

    txtParentID.text  = parent_code;
    
    data_fpgm00062.Call('SELECT');
}
//=======================================================================

    </script>

</head>
<body>
    <!------------------------------------------------------------------------------------>
    <gw:data id="data_fpgm00062_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpgm00062_1" > 
                <input bind="grdGrade" > 
                    <input bind="txtParentID" />
                </input> 
                <output bind="grdGrade" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------>
    <gw:data id="data_fpgm00062" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0" function="<%=l_user%>lg_sel_fpgm00062" > 
                <input bind="grdHeader">        
                    <input bind="txtParentID" /> 
                </input> 
                <output bind="grdHeader" /> 
            </dso> 
        </xml> 
    </gw:data>    
    <!------------------------------------------------------------------------------------>
    <table style="width: 100%; height: 100%; background-color: Black">
        <tr style="height: 100%">
            <td>
                <div id="chart_div" style="background-color: Black">
                </div>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------------>

<gw:textbox id="txtParentID" styles="width:100%;display:none;" />
<!------------------------------------------------------------------------------------>
<gw:grid id='grdGrade' header='grade_code|Value01|Value02|Value03|Value04|Value05|Value06'
    format='0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0' defaults='||||||' editcol='1|1|1|1|1|1|1'
    widths='1000|1000|1000|1000|1000|1000|1000' sorting='T' styles='width:100%; height:100%;display:none' />
<!------------------------------------------------------->
<gw:grid id='grdHeader' header='Column Num|Column Nm|VALUE01_NM|VALUE02_NM|VALUE03_NM|VALUE04_NM|VALUE05_NM|VALUE06_NM'
    format='0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0' defaults='|||||||' editcol='1|1|1|1|1|1|1|1'
    widths='1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' styles='width:100%; height:460;display:none' />
<!------------------------------------------------------------------------------------>
</html>
