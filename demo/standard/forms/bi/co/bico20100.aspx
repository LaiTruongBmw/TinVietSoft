<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Department</title>
</head>
<script type="text/javascript" src="../../tutorial/google_control/jsapi.js"></script>
<script type="text/javascript" src="../../tutorial/google_control/areachart.js"></script>
<script>

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_code  = "<%=Session("USER_ID")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;       
        
    var G1_OTHER_COST_D_PK  = 0,
        G1_TR_DATE   		= 1,
        G1_BRANCH_PK    	= 2,
        G1_COST_TYPE  		= 3,
		G1_ITEM_AMOUNT    	= 4,        
        G1_PROCESS_YN    	= 5,
		G1_VALID_FROM		= 6,
		G1_VALID_TO			= 7,
        G1_REMARK    		= 8;
		
	google.load("visualization", "1", {packages:["corechart"]});
	google.setOnLoadCallback(OnDraw); 
	
 function BodyInit()
 {
      System.Translate(document);
	  Binding();
	  SetGridHeader_D_1();
	  SetGridHeader_W_1();
	  SetGridHeader_Y_1();
	  dat_bico20090_menu_grp.Call("SELECT");
 }
 
 function Binding()
 {
	var data;
	data = "<%=ESysLib.SetListDataSQL("select pk, branch_id || ' * ' || branch_name name from tlg_co_dl_branch a where del_if = 0 order by branch_id")%>||ALL";
	lstBranch.SetDataText(data);
	lstBranch.value = '';
 }
 
 function OnDataReceive(obj)
 {
	switch(obj.id){
		case "dat_bico20090_menu_grp":
			lstGroup.SetDataText(txtGroup.text);
			lstGroup.value ='';
		break;
		case "dat_bico20100_grd_d_1":
			SetGridHeader_D_1();
			dat_bico20100_grd_w_1.Call("SELECT");
		break;
		case "dat_bico20100_grd_w_1":
			SetGridHeader_W_1();
			dat_bico20100_grd_y_1.Call("SELECT");
		break;
		case "dat_bico20100_grd_y_1":
			SetGridHeader_Y_1();
			dat_bico20100_grd_d_p.Call("SELECT");
		break;
		case "dat_bico20100_grd_d_p":
			OnDraw();
		break;
	}
 }
 
function OnDraw()
{
	management.style.width="100%";		
	if(grddata.rows > 1)
	{ var l_width=management.offsetWidth*0.50;
		if(td_chart1.style.width=="100%")
			l_width=l_width*0.50;
		var  l_height=management.offsetHeight*0.90;
		
		var data = new google.visualization.DataTable();
				data.addColumn('string', 'Month');
			  
				data.addColumn('number', 'MASAN')//ve node
				data.addColumn({type:'string',role:'tooltip'});//show amount node
				data.addColumn({type: 'string', role: 'annotation'});////show amount node dua chuot den node
				
				data.addColumn('number', 'DORCO')//ve node
				data.addColumn({type:'string',role:'tooltip'});//show amount node
				data.addColumn({type: 'string', role: 'annotation'});////show amount node dua chuot den node /**/
				//data.addColumn('number', 'CM40');//ghi chu bieu tuong(1)
				data.addRows(grddata.rows);
				
			for (var i=1;i<grddata.rows;i++)
			{ 
					data.setValue(i-1,0,grddata.GetGridData(i,0)+"");//month
				
					if(typeof(grddata.GetGridData(i,1))!="undefined" &&grddata.GetGridData(i,1)!="" &&  grddata.GetGridData(i,1)!=null) 
					{
						data.setValue(i-1,1,grddata.GetGridData(i,2)*1);//value show of line 1////ve node
						var formatter = new google.visualization.NumberFormat( { pattern: '###,###,###.##', negativeParens: true})//format
						data.setValue(i-1,2,formatter.formatValue(grddata.GetGridData(i,2)*1));//node line 1//show amount node
						data.setValue(i-1,3,formatter.formatValue(grddata.GetGridData(i,1)*1));//node line 1//show amount node dua chuot den node
					}
					else
					{
						data.setValue(i,1,null);
					}
					
					if(typeof(grddata.GetGridData(i,3))!="undefined" &&grddata.GetGridData(i,3)!="" && grddata.GetGridData(i,3)!=null) 
					{
						data.setValue(i-1,4,grddata.GetGridData(i,4)*1);//value show of line 2
						var formatter = new google.visualization.NumberFormat( { pattern: '###,###,###.##', negativeParens: true})//format
						data.setValue(i-1,5,formatter.formatValue(grddata.GetGridData(i,4)*1));//node line 2
						data.setValue(i-1,6,formatter.formatValue(grddata.GetGridData(i,3)*1));//node line 2
					}
					else
					{
						data.setValue(i,3,null);
					} /**/
			}
		
		document.getElementById('chart_div').innerHTML = ""; 
		var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));	
		
		chart.draw(data, {width: '500px', height: l_height, legend: 'bottom', 
		title: 'Labor Cost',titleTextStyle: { fontSize: 10 , bold:false},
		vAxis: {title: "",titleTextStyle: {italic: false}},
		hAxis: {title: "",titleTextStyle: {italic: false}}}); /**/
		/*
		google.visualization.events.addListener(chart, 'select', function() { 
		//alert("rows "+chart.getSelection()[0].row +" col" +chart.getSelection()[0].column)
		txtvalue.text=grddata.GetGridData(chart.getSelection()[0].row+1,chart.getSelection()[0].column);
		//alert(txtvalue.text);
		txtcol.text=chart.getSelection()[0].column;
		//alert(txtcol.text);
		txtmonth.text=grddata.GetGridData(chart.getSelection()[0].row+1,0);
		grddata.SelectRow(chart.getSelection()[0].row+1);
		}); /**/
	}
}

 
function SetGridHeader_D_1()
{
	var fg =grd_D_1.GetGridControl(); 
	if(grd_D_1.rows == 1) grd_D_1.AddRow();
	grd_D_1.SetCellBold(0,2,1,67,true);
	fg.FrozenCols =6;
	
    fg.FixedRows = 2;
    fg.FixCols=1;
    fg.MergeCells = 5; /**/
	
	fg.MergeCol(0) = true;
    fg.Cell(0, 0, 0, 1, 0) = "Branch";

	fg.MergeCol(1) = true;
    fg.Cell(0, 0, 1, 1, 1) = "Menu Type";
	
	fg.Cell(0, 0, 2, 1, 2) = "총매출";
	fg.Cell(0, 0, 3, 1, 3) = "인당 매출";
	fg.Cell(0, 0, 4, 1, 4) = "총매출";
	fg.Cell(0, 0, 5, 1, 5) = "인당 매출";
	fg.Cell(0, 0, 6, 1, 6) = "총매출";
	fg.Cell(0, 0, 7, 1, 7) = "인당 매출";
	fg.Cell(0, 0, 8, 1, 8) = "총매출";
	fg.Cell(0, 0, 9, 1, 9) = "인당 매출";
	fg.Cell(0, 0,10, 1,10) = "총매출";
	fg.Cell(0, 0,11, 1,11) = "인당 매출";
	fg.Cell(0, 0,12, 1,12) = "총매출";
	fg.Cell(0, 0,13, 1,13) = "인당 매출";
	fg.Cell(0, 0,14, 1,14) = "총매출";
	fg.Cell(0, 0,15, 1,15) = "인당 매출";
	fg.Cell(0, 0,16, 1,16) = "총매출";
	fg.Cell(0, 0,17, 1,17) = "인당 매출";
	fg.Cell(0, 0,18, 1,18) = "총매출";
	fg.Cell(0, 0,19, 1,19) = "인당 매출";
	fg.Cell(0, 0,20, 1,20) = "총매출";
	fg.Cell(0, 0,21, 1,21) = "인당 매출";
	fg.Cell(0, 0,22, 1,22) = "총매출";
	fg.Cell(0, 0,23, 1,23) = "인당 매출";
	fg.Cell(0, 0,24, 1,24) = "총매출";
	fg.Cell(0, 0,25, 1,25) = "인당 매출";
	fg.Cell(0, 0,26, 1,26) = "총매출";
	fg.Cell(0, 0,27, 1,27) = "인당 매출";
	fg.Cell(0, 0,28, 1,28) = "총매출";
	fg.Cell(0, 0,29, 1,29) = "인당 매출";
	fg.Cell(0, 0,30, 1,30) = "총매출";
	fg.Cell(0, 0,31, 1,31) = "인당 매출";
	fg.Cell(0, 0,32, 1,32) = "총매출";
	fg.Cell(0, 0,33, 1,33) = "인당 매출";
	fg.Cell(0, 0,34, 1,34) = "총매출";
	fg.Cell(0, 0,35, 1,35) = "인당 매출";
	fg.Cell(0, 0,36, 1,36) = "총매출";
	fg.Cell(0, 0,37, 1,37) = "인당 매출";
	fg.Cell(0, 0,38, 1,38) = "총매출";
	fg.Cell(0, 0,39, 1,39) = "인당 매출";
	fg.Cell(0, 0,40, 1,40) = "총매출";
	fg.Cell(0, 0,41, 1,41) = "인당 매출";
	fg.Cell(0, 0,42, 1,42) = "총매출";
	fg.Cell(0, 0,43, 1,43) = "인당 매출";
	fg.Cell(0, 0,44, 1,44) = "총매출";
	fg.Cell(0, 0,45, 1,45) = "인당 매출";
	fg.Cell(0, 0,46, 1,46) = "총매출";
	fg.Cell(0, 0,47, 1,47) = "인당 매출";
	fg.Cell(0, 0,48, 1,48) = "총매출";
	fg.Cell(0, 0,49, 1,49) = "인당 매출";
	fg.Cell(0, 0,50, 1,50) = "총매출";
	fg.Cell(0, 0,51, 1,51) = "인당 매출";
	fg.Cell(0, 0,52, 1,52) = "총매출";
	fg.Cell(0, 0,53, 1,53) = "인당 매출";
	fg.Cell(0, 0,54, 1,54) = "총매출";
	fg.Cell(0, 0,55, 1,55) = "인당 매출";
	fg.Cell(0, 0,56, 1,56) = "총매출";
	fg.Cell(0, 0,57, 1,57) = "인당 매출";
	fg.Cell(0, 0,58, 1,58) = "총매출";
	fg.Cell(0, 0,59, 1,59) = "인당 매출";
	fg.Cell(0, 0,60, 1,60) = "총매출";
	fg.Cell(0, 0,61, 1,61) = "인당 매출";
	fg.Cell(0, 0,62, 1,62) = "총매출";
	fg.Cell(0, 0,63, 1,63) = "인당 매출";
	fg.Cell(0, 0,64, 1,64) = "총매출";
	fg.Cell(0, 0,65, 1,65) = "인당 매출";
	fg.Cell(0, 0,66, 1,66) = "총매출";
	fg.Cell(0, 0,67, 1,67) = "인당 매출";
	
	fg.MergeRow(0) = true;
	fg.Cell(0, 0, 2, 0, 3) 	= "Sum Cost";
	fg.Cell(0, 0, 4, 0, 5) 	= "Avg Cost";
	fg.Cell(0, 0, 6, 0, 7) 	= "Day 1";
	fg.Cell(0, 0, 8, 0, 9) 	= "Day 2";
	fg.Cell(0, 0,10, 0,11) 	= "Day 3";
	fg.Cell(0, 0,12, 0,13) 	= "Day 4";
	fg.Cell(0, 0,14, 0,15) 	= "Day 5";
	fg.Cell(0, 0,16, 0,17) 	= "Day 6";
	fg.Cell(0, 0,18, 0,19) 	= "Day 7";
	fg.Cell(0, 0,20, 0,21) 	= "Day 8";
	fg.Cell(0, 0,22, 0,23) 	= "Day 9";
	fg.Cell(0, 0,24, 0,25) 	= "Day 10";
	fg.Cell(0, 0,26, 0,27) 	= "Day 11";
	fg.Cell(0, 0,28, 0,29) 	= "Day 12";
	fg.Cell(0, 0,30, 0,31) 	= "Day 13";
	fg.Cell(0, 0,32, 0,33) 	= "Day 14";
	fg.Cell(0, 0,34, 0,35) 	= "Day 15";
	fg.Cell(0, 0,36, 0,37) 	= "Day 16";
	fg.Cell(0, 0,38, 0,39) 	= "Day 17";
	fg.Cell(0, 0,40, 0,41) 	= "Day 18";
	fg.Cell(0, 0,42, 0,43) 	= "Day 19";
	fg.Cell(0, 0,44, 0,45) 	= "Day 20";
	fg.Cell(0, 0,46, 0,47) 	= "Day 21";
	fg.Cell(0, 0,48, 0,49) 	= "Day 22";
	fg.Cell(0, 0,50, 0,51) 	= "Day 23";
	fg.Cell(0, 0,52, 0,53) 	= "Day 24";
	fg.Cell(0, 0,54, 0,55) 	= "Day 25";
	fg.Cell(0, 0,56, 0,57) 	= "Day 26";
	fg.Cell(0, 0,58, 0,59) 	= "Day 27";
	fg.Cell(0, 0,60, 0,61) 	= "Day 28";
	fg.Cell(0, 0,62, 0,63) 	= "Day 29";
	fg.Cell(0, 0,64, 0,65) 	= "Day 30";
	fg.Cell(0, 0,66, 0,67) 	= "Day 31";
}

function SetGridHeader_W_1()
{
	var fg =grd_W_1.GetGridControl(); 
	if(grd_W_1.rows == 1) grd_W_1.AddRow();
	grd_W_1.SetCellBold(0,2,1,17,true);
	fg.FrozenCols = 6;
	
    fg.FixedRows = 2;
    fg.FixCols=1;
    fg.MergeCells = 5; /**/
	
	fg.MergeCol(0) = true;
    fg.Cell(0, 0, 0, 1, 0) = "Branch";

	fg.MergeCol(1) = true;
    fg.Cell(0, 0, 1, 1, 1) = "Menu Type";
	
	fg.Cell(0, 0, 2, 1, 2) = "총매출";
	fg.Cell(0, 0, 3, 1, 3) = "인당 매출";
	fg.Cell(0, 0, 4, 1, 4) = "총매출";
	fg.Cell(0, 0, 5, 1, 5) = "인당 매출";
	fg.Cell(0, 0, 6, 1, 6) = "총매출";
	fg.Cell(0, 0, 7, 1, 7) = "인당 매출";
	fg.Cell(0, 0, 8, 1, 8) = "총매출";
	fg.Cell(0, 0, 9, 1, 9) = "인당 매출";
	fg.Cell(0, 0,10, 1,10) = "총매출";
	fg.Cell(0, 0,11, 1,11) = "인당 매출";
	fg.Cell(0, 0,12, 1,12) = "총매출";
	fg.Cell(0, 0,13, 1,13) = "인당 매출";
	fg.Cell(0, 0,14, 1,14) = "총매출";
	fg.Cell(0, 0,15, 1,15) = "인당 매출";
	fg.Cell(0, 0,16, 1,16) = "총매출";
	fg.Cell(0, 0,17, 1,17) = "인당 매출";
	
	fg.MergeRow(0) = true;
	fg.Cell(0, 0, 2, 0, 3) 	= "Sum Cost";
	fg.Cell(0, 0, 4, 0, 5) 	= "Avg Cost";
	fg.Cell(0, 0, 6, 0, 7) 	= "Week 1";
	fg.Cell(0, 0, 8, 0, 9) 	= "Week 2";
	fg.Cell(0, 0,10, 0,11) 	= "Week 3";
	fg.Cell(0, 0,12, 0,13) 	= "Week 4";
	fg.Cell(0, 0,14, 0,15) 	= "Week 5";
	fg.Cell(0, 0,16, 0,17) 	= "Week 6";
}

function SetGridHeader_Y_1()
{
	var fg =grd_Y_1.GetGridControl(); 
	if(grd_Y_1.rows == 1) grd_Y_1.AddRow();
	grd_Y_1.SetCellBold(0,2,1,29,true);
	fg.FrozenCols = 6;
	
    fg.FixedRows = 2;
    fg.FixCols=1;
    fg.MergeCells = 5; /**/
	
	fg.MergeCol(0) = true;
    fg.Cell(0, 0, 0, 1, 0) = "Branch";

	fg.MergeCol(1) = true;
    fg.Cell(0, 0, 1, 1, 1) = "Menu Type";
	
	fg.Cell(0, 0, 2, 1, 2) = "총매출";
	fg.Cell(0, 0, 3, 1, 3) = "인당 매출";
	fg.Cell(0, 0, 4, 1, 4) = "총매출";
	fg.Cell(0, 0, 5, 1, 5) = "인당 매출";
	fg.Cell(0, 0, 6, 1, 6) = "총매출";
	fg.Cell(0, 0, 7, 1, 7) = "인당 매출";
	fg.Cell(0, 0, 8, 1, 8) = "총매출";
	fg.Cell(0, 0, 9, 1, 9) = "인당 매출";
	fg.Cell(0, 0,10, 1,10) = "총매출";
	fg.Cell(0, 0,11, 1,11) = "인당 매출";
	fg.Cell(0, 0,12, 1,12) = "총매출";
	fg.Cell(0, 0,13, 1,13) = "인당 매출";
	fg.Cell(0, 0,14, 1,14) = "총매출";
	fg.Cell(0, 0,15, 1,15) = "인당 매출";
	fg.Cell(0, 0,16, 1,16) = "총매출";
	fg.Cell(0, 0,17, 1,17) = "인당 매출";
	fg.Cell(0, 0,18, 1,18) = "총매출";
	fg.Cell(0, 0,19, 1,19) = "인당 매출";
	fg.Cell(0, 0,20, 1,20) = "총매출";
	fg.Cell(0, 0,21, 1,21) = "인당 매출";
	fg.Cell(0, 0,22, 1,22) = "총매출";
	fg.Cell(0, 0,23, 1,23) = "인당 매출";
	fg.Cell(0, 0,24, 1,24) = "총매출";
	fg.Cell(0, 0,25, 1,25) = "인당 매출";
	fg.Cell(0, 0,26, 1,26) = "총매출";
	fg.Cell(0, 0,27, 1,27) = "인당 매출";
	fg.Cell(0, 0,28, 1,28) = "총매출";
	fg.Cell(0, 0,29, 1,29) = "인당 매출";
	
	fg.MergeRow(0) = true;
	fg.Cell(0, 0, 2, 0, 3) 	= "Sum Cost";
	fg.Cell(0, 0, 4, 0, 5) 	= "Avg Cost";
	fg.Cell(0, 0, 6, 0, 7) 	= "Month 1";
	fg.Cell(0, 0, 8, 0, 9) 	= "Month 2";
	fg.Cell(0, 0,10, 0,11) 	= "Month 3";
	fg.Cell(0, 0,12, 0,13) 	= "Month 4";
	fg.Cell(0, 0,14, 0,15) 	= "Month 5";
	fg.Cell(0, 0,16, 0,17) 	= "Month 6";
	fg.Cell(0, 0,18, 0,19) 	= "Month 7";
	fg.Cell(0, 0,20, 0,21) 	= "Month 8";
	fg.Cell(0, 0,22, 0,23) 	= "Month 9";
	fg.Cell(0, 0,24, 0,25) 	= "Month 10";
	fg.Cell(0, 0,26, 0,27) 	= "Month 11";
	fg.Cell(0, 0,28, 0,29) 	= "Month 12";
}
 </script>
<body>
    <!------------------------------------------------------------------>
    <gw:data id="dat_bico20100_grd_d_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_bico20100_grd_d_1"> 
                <input> 
					<input bind="lstBranch" />
                    <input bind="dtMonth" /> 
					<input bind="lstGroup" />
					<input bind="radType" />
                </input> 
                <output bind="grd_D_1" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------>
    <gw:data id="dat_bico20100_grd_w_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_bico20100_grd_w_1"> 
                <input> 
					<input bind="lstBranch" />
                    <input bind="dtMonth" /> 
					<input bind="lstGroup" />
					<input bind="radType" />
                </input> 
                <output bind="grd_W_1" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------>
    <gw:data id="dat_bico20100_grd_y_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_bico20100_grd_y_1"> 
                <input> 
					<input bind="lstBranch" />
                    <input bind="dtMonth" /> 
					<input bind="lstGroup" />
					<input bind="radType" />
                </input> 
                <output bind="grd_y_1" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------>
    <gw:data id="dat_bico20100_grd_d_p" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_bico20100_grd_d_p"> 
                <input> 
					<input bind="lstBranch" />
                    <input bind="dtMonth" /> 
					<input bind="lstGroup" />
					<input bind="radType" />
                </input> 
                <output bind="grddata" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
	<gw:data id="dat_bico20090_menu_grp" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="list" procedure="<%=l_user%>lg_sel_bico20090_menu_grp" > 
				<input>
					<input bind="lstBranch" /> 
					<input bind="dtMonth" />
				</input> 
				<output>
					<output bind="txtGroup" />
				</output>
			</dso> 
		</xml> 
	</gw:data>
    <table style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td style="width: 10%" align="right">
                Branch
            </td>
            <td style="width: 15%" align="right">
                <gw:list id="lstBranch" styles="width:100%;" onchange='dat_bico20090_menu_grp.Call("SELECT");' />
            </td>
			<td style="width: 10%" align="right">
                Menu Type
            </td>
            <td style="width: 15%" align="right">
                <gw:list id="lstGroup" styles="width:100%;" />
            </td>
            <td style="width: 5%" align="right">
                Month
            </td>
            <td style="width: 15%" align="left">
                <gw:datebox id="dtMonth" type="month" lang="1"  onchange='dat_bico20090_menu_grp.Call("SELECT");' />
            </td>
            <td style="width: 15%; white-space: nowrap" align="center">
				<gw:radio id="radType" value="1" styles="width:100%" onchange="dat_bico20100_grd_d_1.Call('SELECT');">                      
					<span id="rdbranch" value="1">By Branch</span>
					<span id="rdgroup" value="2">By Menu Type</span>
				</gw:radio>
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="dat_bico20100_grd_d_1.Call('SELECT');" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="11" valign="top">
				<gw:tab id="tab">
					<table name="Graphic" class="table" width="100%" style="height: 100%;" CELLPADDING = "0"  CELLPADDING = "0" border="0">
						<tr>
							<td valign="top">
								<table name="Management"  id="management" width="100%" cellpadding="0" cellspacing="0" border="0" style="width:100%;height:100%;">
									<tr style="width:100%;" valign="top" >
										<td  id="td_chart1" align="left">
											<gw:grid id="grddata"  
												header="Day|MASAN|MASAN|DORCO|DORCO"
												format="0|0|0|0|0"
												aligns="0|0|0|0|0"
												defaults="||||"
												editcol="0|0|0|0|0"
												widths="0|0|0|0|0"
												styles="width:100%; height:100%;display:none" /> 
											<div id="chart_div"></div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<table name="Daily" class="table" width="100%" style="height: 100%;" CELLPADDING = "0"  CELLPADDING = "0" border="0">
						<tr>
							<td valign="top">
								<gw:grid 	id="grd_D_1"
											header	="Branch|Menu Type|01|02|_03|_04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45|46|47|48|49|50|51|52|53|54|55|56|57|58|59|60|61|62|63|64|65|66" 
											format  ="0|0|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2"
											aligns  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
											defaults="|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||" 
											editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
											widths	="1500|3000|1200|2000|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500" 
											sorting='F'
											styles="width:100%; height:100%"
											/>
							</td>
						</tr>
					</table>
					<table name="Weekly" class="table" width="100%" style="height: 100%;" CELLPADDING = "0"  CELLPADDING = "0" border="0">
						<tr>
							<td valign="top">
								<gw:grid 	id="grd_W_1"
											header	="Branch|Menu Type|01|02|_03|_04|05|06|07|08|09|10|11|12|13|14|15|16" 
											format  ="0|0|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2"
											aligns  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
											defaults="|||||||||||||||||" 
											editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
											widths	="1500|3000|1200|2000|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500" 
											sorting='F'
											styles="width:100%; height:100%"
											/>
							</td>
						</tr>
					</table>
					<table name="Monthly" class="table" width="100%" style="height: 100%;" CELLPADDING = "0"  CELLPADDING = "0" border="0">
						<tr>
							<td valign="top">
								<gw:grid 	id="grd_Y_1"
											header	="Branch|Menu Type|01|02|_03|_04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28" 
											format  ="0|0|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2|-0|-2"
											aligns  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
											defaults="|||||||||||||||||||||||||||||" 
											editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
											widths	="1500|3000|1200|2000|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500|1200|1500" 
											sorting='F'
											styles="width:100%; height:100%"
											/>
							</td>
						</tr>
					</table>
				</gw:tab>
            </td>
        </tr>
    </table>
	<gw:textbox id="txtGroup" styles="width: 100%;display: none" />
</body>
</html>
