<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Manager report</title>
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
	  grd_Y_1.AddRow()
	  SetGridHeader_D_1();
	  var lmonth, ldate,l_year;
		
		ldate = dtFrom.value ; 
		l_year = Number(ldate.substr(0,4) );
		
		if(ldate.substr(4,2)=='12')
		{
			l_year = Number(l_year) -1;
			lmonth = Number(ldate.substr(4,2)) -1;
			
		}else if(ldate.substr(4,2)=='01')
		{
			lmonth = '12';
		}else
		{
			lmonth = Number(ldate.substr(4,2)) -1 ;
			if(lmonth<10)
			{
				lmonth = '0'+lmonth;
			}
			
		}
		ldate = l_year + lmonth + '01' ;          
		dtFrom.value=ldate ; 

	  SetGridHeader_W_1();
	  SetGridHeader_Y_1();
	  //dat_bico20080_emp_grp.Call("SELECT");
 }
 
 function Binding()
 {
	var data;
	data = "<%=ESysLib.SetListDataSQL("select pk,branch_id || ' * '|| branch_name from tlg_co_dl_branch a where del_if=0 order by branch_id")%>||ALL";
	lstBranch.SetDataText(data);
	lstBranch.value = '';
 }
 
 function OnDataReceive(obj)
 {
	switch(obj.id){
		
		case "dat_bico20080_grd_y_1":
			grd_Y_1.Subtotal( 1, 2,-1, '5!6!7!8!9!10'); 
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
					
					if(typeof(grddata.GetGridData(i,4))!="undefined" &&grddata.GetGridData(i,4)!="" && grddata.GetGridData(i,4)!=null) 
					{
						data.setValue(i-1,4,grddata.GetGridData(i,4)*1);//value show of line 2
						var formatter = new google.visualization.NumberFormat( { pattern: '###,###,###.##', negativeParens: true})//format
						data.setValue(i-1,5,formatter.formatValue(grddata.GetGridData(i,4)*1));//node line 2
						data.setValue(i-1,6,formatter.formatValue(grddata.GetGridData(i,3)*1));//node line 2
					}
					else
					{
						data.setValue(i,4,null);
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
	grd_D_1.SetCellBold(0,4,1,63,true);
	fg.FrozenCols = 4;
	
    fg.FixedRows = 2;
    fg.FixCols=1;
    fg.MergeCells = 5; /**/
	
	fg.MergeCol(0) = true;
    fg.Cell(0, 0, 0, 1, 0) = "No";

	fg.MergeCol(1) = true;
    fg.Cell(0, 0, 1, 1, 1) = "Branch";
	
	fg.MergeCol(2) = true;
	fg.Cell(0, 0, 2, 1, 2) = "Month";
	
	fg.MergeCol(3) = true;
	fg.Cell(0, 0, 3, 1, 3) = "From DT";	
	fg.Cell(0, 0, 4, 1, 4) = "To DT";
	
	fg.Cell(0, 0, 5, 0, 9) = "Logistic";
	fg.Cell(0, 1, 6, 1, 6) = "Revenue";
	fg.Cell(0, 1, 7, 1, 7) = "Food-Material";
	fg.Cell(0, 1, 8, 1, 8) = "General Cost";
	fg.Cell(0, 1, 9, 1, 9) = "Labor Cost";
	
	fg.Cell(0, 0,10, 0,18) = "Accounting";
	fg.Cell(0, 0,11, 1,11) = "Revenue";
	fg.Cell(0, 0,12, 1,12) = "Revenue Canteen";
	fg.Cell(0, 0,13, 1,13) = "Revenue-Minimark;
	fg.Cell(0, 0,14, 1,14) = "Revenue-Others";
	fg.Cell(0, 0,15, 1,15) = "Food-Material";
	fg.Cell(0, 0,16, 1,16) = "Non-food";
	fg.Cell(0, 0,17, 1,17) = "Labor";
	fg.Cell(0, 0,18, 1,18) = "Quantity";
	

}

 </script>
<body>
    	
	<!------------------------------------------------------------------>
    <gw:data id="dat_bico20080_grd_y_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_bico202010_grd_y_1"> 
                <input> 
					<input bind="lstBranch" />
                    <input bind="dtFrom" /> 
					<input bind="dtTo" />
                </input> 
                <output bind="grd_y_1" /> 
            </dso> 
        </xml> 
    </gw:data>
	
    <table style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td style="width: 1%" align="right">
                Branch
            </td>
			<td style="width: 15%" align="right">
                <gw:list id="lstGroup" styles="width:100%;display:none" />
				<gw:list id="lstBranch" styles="width:100%;" />
            </td>
			<td style="width: 1%" align="right">
                Month
            </td>
            <td style="width: 1%;white-space:nowrap" align="left">               
				<gw:datebox id="dtFrom" lang="1"  type="month" width="10%" /> ~ <gw:datebox id="dtTo"  type="month" lang="1" width="10%" />
            </td>
            <td style="width: 1%" align="left">
                <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="dat_bico20080_grd_y_1.Call('SELECT');" />
            </td>            
			<td style="width: 50%" align="right">
                &nbsp;
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="11" valign="top">					
					<table name="Monthly" class="table" width="100%" style="height: 100%;" CELLPADDING = "0"  CELLPADDING = "0" border="0">
						<tr>
							<td valign="top">
								<gw:grid 	id="grd_Y_1"
											header	="No|Branch|Month|From DT|To Date|1|2|3|4|5|6|7|8|9|10|11|12|13" 
											format  ="0|0|0|4|4|-0|-0|-0|-0|-0|-0|-0|0|0|0|0|0|0" 
											aligns  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
											defaults="|||||||||||||||||" 
											editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
											widths	="700|1500|1500|1500|1500|2000|2000|2000|2000|2000|4000|2000|2000|2000|2000|2000|2000|2000" 
											sorting='F'
											styles="width:100%; height:100%"
											/>
							</td>
						</tr>
					</table>			
            </td>
        </tr>
    </table>
	<gw:textbox id="txtGroup" styles="width: 100%;display: none" />
</body>
</html>
