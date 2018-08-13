<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Process Entry</title>

    <script type="text/javascript" src="../../tutorial/google_control/jsapi.js"></script>

</head>
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script type="text/javascript">
google.load("visualization", "1", {packages:['corechart']});

//----------grdProcess-----
var G1_DATE           = 0,
    G1_AGV            = 1,
    G1_MON_01         = 2,
    G1_MON_02         = 3,
    G1_MON_03         = 4,
    G1_MON_04         = 5, 
    G1_MON_05         = 6, 
    G1_MON_06         = 7,
    G1_MON_07         = 8,
	G1_MON_08         = 9,
	G1_MON_09         = 10,
	G1_MON_10         = 11,
	G1_MON_11         = 12,
	G1_MON_12         = 13;
//---------------
   
//=======================================================================
function BodyInit()
{
    System.Translate(document);
    //------------------
    BindingDataList();
}

//=======================================================================
function OnChangedTab()
{
	var i = tab_01.GetCurrentPageNo();
	if(i==0)
	{
	    var l_ReportType = lst_ReportType.value;
	
        if ( l_ReportType == "23" )// month production
        {
           OnDraw('Monthly Production');
           
        }
	    else if  (l_ReportType == "27"  )//WIP stock
        {
            OnDraw('Wip Stock');	
           
        }
        else if(l_ReportType == "28")//Monthly Stock
        {
           OnDraw('Monthly Stock qty');	
            
        }
        else if  (l_ReportType == "25"  )//MR Average Yarn Count
        {
            OnDraw1('MR Average Yarn Count');	
           
        }
        else if(l_ReportType == "24")//MR Spinining Result
        {
           OnDraw1('MR Spinining Result');	
            
        }
		
	}
}

//=======================================================================
function OnDraw(arg_Title)
{
  tbl_1.style.width="100%";		
//if(grddata.rows>1)
//{ 
var l_width=tbl_1.offsetWidth*0.87;
//if(td_chart1.style.width=="80%")
//l_width=l_width*0.70;
var  l_height=tbl_1.offsetHeight*0.87;
//	if(chart_detail.style.height=="10%")
	//l_height=l_height*0.80;

//	if(lstChart.value=='1'||lstChart.value=='2'||lstChart.value=='3'||lstChart.value=='4')
//	{
	
			var data = new google.visualization.DataTable();
			data.addColumn('string', 'Month');
			for (var i=1; i<grd_Data.rows; i++)
			{
				data.addColumn('number', grd_Data.GetGridData(i,0));
			}
			//alert(grd_Data.cols - 3);
			data.addRows(grd_Data.cols - 2);
			for (var i=2; i<grd_Data.cols-2; i++)
			{
				for (var j=0; j<grd_Data.rows; j++)
			    {
			        if( j==0)
			        {
			            data.setValue(i-1,j,grd_Data.GetGridData(0,i).substr(4,2) + "");
			        }
			        else
				         if(typeof(grd_Data.GetGridData(j,i)) !== 'undefined' && grd_Data.GetGridData(j,i) != null && grd_Data.GetGridData(j,i) != "")
				            data.setValue(i-1,j,grd_Data.GetGridData(j,i)*1);
				        else
				            data.setValue(i-1,j,null);
				}
			}
			
//			  data.addColumn('string', 'Month');
//				data.addColumn('number', '2012');
//				data.addColumn('number', '2011');
//				data.addColumn('number', '2010');
				//data.addRows(grd_Data.rows);
				//grddata.SetGridText(0,5,"Total");
				//grddata.SetGridText(0,6,"Male");
				//grddata.SetGridText(0,7,"Female");
				//grddata.GetGridControl().ColHidden(7)=false;
//		   data.setValue(0,0,"1");
//		   data.setValue(0,1,1);
//		   data.setValue(0,2,2);
//		   data.setValue(0,3,3);
//		   
//		   data.setValue(1,0,"2");
//		   data.setValue(1,1,10);
//		   data.setValue(1,2,50);
//		   data.setValue(1,3,100);
//			for (var i=1;i<grd_Data.rows;i++)
//			{ 
//			    for(var j=0;j<4;j++)
//				{
//				    if(j==0)
//					    data.setValue(i-1,j,grd_Data.GetGridData(i,0)+"vvv");
//				    else 
//				    {
//				        data.setValue(i-1,j,grd_Data.GetGridData(i,j)*1);
//				        //grddata.SetGridText(i,j+4,grddata.GetGridData(i,j));
//				    }
//				
//				}				
//			}
			chart_div.innerHTML = ""; 
//		var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));	
		var chart = new google.visualization.LineChart(document.getElementById('chart_div'));	
		//if(lstChart.value=='1')
		//chart.draw(data, {width: l_width, height: l_height, legend: 'bottom', title: 'Employees Quantity Chart',vAxis: {title: "persons"},hAxis: {title: "Month"}});
		//if(lstChart.value=='2')
		//chart.draw(data, {width: l_width, height: l_height, legend: 'bottom', title: 'Seniority Average Chart',vAxis: {title: "months"},hAxis: {title: "Month"}});
		//if(lstChart.value=='3')
//		chart.draw(data, {width: l_width, height: l_height, legend: 'bottom', title: 'Monthly Stock qty',vAxis: {title: "Qty"},hAxis: {title: "Month"}});
		chart.draw(data, {
							curveType: "none",
							width: l_width, 
							height: l_height, 
							legend:{position:'top',alignment:'end'}, 
							title: arg_Title,//'Monthly Stock qty',
							titleTextStyle:{fontSize:24},
							vAxis: {
							         title: "Qty", 
							         format:'#,###.##',
							         gridlines:{count:10},
							         showTextEvery:2
							        },
							hAxis: {title: "Month"},
							//tooltip:{trigger:'focus'},
							chartArea:{width:'auto',height:'auto'},
							pointSize:5,
							interpolateNulls:false
						 }
					);
		//if(lstChart.value=='4')
		//chart.draw(data, {width: l_width, height: l_height, legend: 'bottom', title: 'Resign Employees Chart',vAxis: {title: "persons"},hAxis: {title: "Month"}});
		//google.visualization.events.addListener(chart, 'select', function() { 
		//alert("rows "+chart.getSelection()[0].row +" col" +chart.getSelection()[0].column)
		//txtvalue.text=grddata.GetGridData(chart.getSelection()[0].row+1,chart.getSelection()[0].column);
		//alert(txtvalue.text);
		//txtcol.text=chart.getSelection()[0].column;
		//alert(txtcol.text);
		//txtmonth.text=grddata.GetGridData(chart.getSelection()[0].row+1,4);
		//grddata.SelectRow(chart.getSelection()[0].row+1);
		//if(txtmonth.text!='-1' && txtcol.text!='-1'&& imgArrow2.status != "expand" )
		//id_detail.Call("SELECT");
		//});
		
//	}
//	
//	
//	if(lstChart.value=='5')
//	{
//	
//			var data = new google.visualization.DataTable();
//			  data.addColumn('string', 'Month');
//				data.addColumn('number', 'Total');
//				data.addColumn('number', 'Average');
//				grddata.SetGridText(0,5,"Total");
//				grddata.SetGridText(0,6,"Avegare");
//				grddata.GetGridControl().ColHidden(7)=true;
//				data.addRows(grddata.rows);
//				
//			for (var i=1;i<grddata.rows;i++)
//			{ for(var j=0;j<3;j++)
//				{
//				if(j==0)
//					data.setValue(i-1,j,grddata.GetGridData(i,0)+"");
//				else 
//					{data.setValue(i-1,j,grddata.GetGridData(i,j)*1);
//					 grddata.SetGridText(i,j+4,grddata.GetGridData(i,j));
//					}
//				
//				}
//				
//			}
//			chart_div.innerHTML = ""; 
//		var chart = new google.visualization.AreaChart(document.getElementById('chart_div'));	
//		chart.draw(data, {width: l_width, height: l_height, legend: 'bottom', title: 'Factory Labour cost(Million VND)',vAxis: {title: "persons"},hAxis: {title: "Month"}});
//		google.visualization.events.addListener(chart, 'select', function() { 
//		//alert("rows "+chart.getSelection()[0].row +" col" +chart.getSelection()[0].column)
//		txtvalue.text=grddata.GetGridData(chart.getSelection()[0].row+1,chart.getSelection()[0].column);
//		//alert(txtvalue.text);
//		txtcol.text=chart.getSelection()[0].column;
//		//alert(txtcol.text);
//		txtmonth.text=grddata.GetGridData(chart.getSelection()[0].row+1,4);
//		grddata.SelectRow(chart.getSelection()[0].row+1);
//		if(txtmonth.text!='-1' && txtcol.text!='-1' && imgArrow2.status != "expand" )
//		id_detail.Call("SELECT");
//		});
//		
//	}
//auto_resize_column(grddata,0,grddata.cols-1,9);   	
//}
 
}


//=======================================================================
function OnDraw1(arg_Title)
{
    tbl_1.style.width="100%";		
    var l_width=tbl_1.offsetWidth*0.87;
    var  l_height=tbl_1.offsetHeight*0.87;

	
			var data = new google.visualization.DataTable();
			data.addColumn('string', 'Month');
			data.addColumn('number', "Avg 2010");
			data.addColumn('number', "Avg 2011");
			data.addColumn('number', "Avg 2012");
			for (var i=1; i<grd_Data.rows; i++)
			{
				data.addColumn('number', grd_Data.GetGridData(i,0));
			}
			

			data.addRows(grd_Data.cols - 1);
			
//			data.setValue(0,0,'Avg');
//			data.setValue(0,1, 352.99 *1);
//			data.setValue(0,2, 353.44  *1);
//			data.setValue(0,3, 336.44  *1);
//			data.setValue(0,4, null);
//			data.setValue(0,5, null);
//			data.setValue(0,6, null);
//			
			
			for (var i=1; i<grd_Data.cols-2; i++)
			{
			    if(i==1)
			    {
			        data.setValue(0,0,grd_Data.GetGridData(0,i)+ "");
			        if(typeof(grd_Data.GetGridData(1,i)) !== 'undefined' && grd_Data.GetGridData(1,i) != null && grd_Data.GetGridData(1,i) != "")
		                data.setValue(0,1,grd_Data.GetGridData(1,i)*1);
		            else
		                data.setValue(0,1,null);
		            
		            if(typeof(grd_Data.GetGridData(2,i)) !== 'undefined' && grd_Data.GetGridData(2,i) != null && grd_Data.GetGridData(2,i) != "")
		                data.setValue(0,2,grd_Data.GetGridData(2,i)*1);
		            else
		                data.setValue(0,2,null);
		                
		            if(typeof(grd_Data.GetGridData(3,i)) !== 'undefined' && grd_Data.GetGridData(3,i) != null && grd_Data.GetGridData(3,i) != "")
		                data.setValue(0,3,grd_Data.GetGridData(3,i)*1);
		            else
		                data.setValue(0,3,null);
		                
		            data.setValue(0,4, null);
        			data.setValue(0,5, null);
        			data.setValue(0,6, null);
			    }
			    else
			    {
				    for (var j=0; j<grd_Data.rows; j++)
			        {
			            if( j==0)
			            {
			                data.setValue(i,j,grd_Data.GetGridData(0,i).substr(4,2) + "");
			            }
			            else
			                if(typeof(grd_Data.GetGridData(j,i)) !== 'undefined' && grd_Data.GetGridData(j,i) != null && grd_Data.GetGridData(j,i) != "")
				                data.setValue(i,j+3,grd_Data.GetGridData(j,i)*1);
				            else
				                data.setValue(i,j+3,null);
				    }
				}
			}
		chart_div.innerHTML = ""; 
		var chart = new google.visualization.LineChart(document.getElementById('chart_div'));	
		chart.draw(data, {
							curveType: "none",
							width: l_width, 
							height: l_height, 
							legend:{position:'top',alignment:'end'}, 
							title: arg_Title,//'Monthly Stock qty',
							titleTextStyle:{fontSize:24},
							vAxis: {
							         title: "Qty", 
							         format:'#,###.##',
							         gridlines:{count:10},
							         showTextEvery:2
							        },
							hAxis: {title: "Month"},
							//tooltip:{trigger:'focus'},
							chartArea:{width:'auto',height:'auto'},
							pointSize:5,
							interpolateNulls:false,
							series:{
							            0:{
							                visibleInLegend: false,
							                color:'#3366cc'
							              }, 
							            1:{
							                visibleInLegend: false,
							                color:'#dc3912'
							              },
							            2:{
							                visibleInLegend: false,
							                color:'#ff9900'
							              },
							            3:{color:'#3366cc'},
							            4:{color:'#dc3912'},
							            5:{color:'#ff9900'}						            
							        }
						 }
					);
 
}
//=======================================================================
function BindingDataList()
{
    var data=""; 
       
    //data = "<%=ESysLib.SetListDataSQL("select pk,grp_cd || ' - ' || grp_nm from tlg_it_itemgrp v where del_if = 0 and LEAF_YN ='Y' and ( prod_yn = 'Y' or sale_yn = 'Y' ) ORDER BY grp_cd")%>";   
    //lstGroup.SetDataText(data);
    //----------------------
    
    data ="Data|23|Monthly Production|27|WIP Stock|28|Monthly Stock|25|MR Average Yarn Count|24|MR Spinining Result"
    lst_ReportType.SetDataText( data); 
	OnChangeReportType();

    //-----------------------    
    //data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GRouP b WHERE  b.group_ID='LGPC0341' AND a.TLG_LG_CODE_GRouP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM" )%> " ; 
    //grdWorkProcess.SetComboFormat(G2_WP_Type,data);   
    
    var ctrl = grd_Data.GetGridControl();
    ctrl.ColFormat(G1_MON_01) = "###,###,###.##" ;                          
	ctrl.ColFormat(G1_MON_02) = "###,###,###.##" ;
	ctrl.ColFormat(G1_MON_03) = "###,###,###.##" ;
	ctrl.ColFormat(G1_MON_04) = "###,###,###.##" ;
	ctrl.ColFormat(G1_MON_05) = "###,###,###.##" ;
	ctrl.ColFormat(G1_MON_06) = "###,###,###.##" ;
	ctrl.ColFormat(G1_MON_07) = "###,###,###.##" ;
	ctrl.ColFormat(G1_MON_08) = "###,###,###.##" ;
	ctrl.ColFormat(G1_MON_09) = "###,###,###.##" ;
	ctrl.ColFormat(G1_MON_10) = "###,###,###.##" ;
	ctrl.ColFormat(G1_MON_11) = "###,###,###.##" ;
	ctrl.ColFormat(G1_MON_12) = "###,###,###.##" ;
	
	data = "<%=ESysLib.SetListDataSQL("SELECT   a.pk, a.wh_id  || ' * ' || a.wh_name FROM tlg_in_warehouse a WHERE a.del_if = 0 AND a.use_yn = 'Y' ORDER BY a.wh_id")%>";
	lst_WH_Mon_Prod.SetDataText( data + "|| Select All");
    lst_WH_Mon_Prod.value = '';
    
    lst_WH_Wip_Stock.SetDataText( data + "|| Select All");
    lst_WH_Wip_Stock.value = '';
    
    lst_WH_Monthly_Stock.SetDataText( data + "|| Select All");
    lst_WH_Monthly_Stock.value = '';
    
    lst_WH_MR_Average_Yarn_Count.SetDataText( data + "|| Select All");
    lst_WH_MR_Average_Yarn_Count.value = '';
    
    lst_WH_MR_Spinining_Result.SetDataText( data + "|| Select All");
    lst_WH_MR_Spinining_Result.value = '';
	
}

//=======================================================================
function OnSearch(pos)
{
	switch ( pos )
	{
	    case 'DATA':
	        var l_ReportType = lst_ReportType.value;
	        if ( l_ReportType == "23" )// month production
            {
                data_test_28_MonthlyProduction.Call('SELECT');
               
            }
	        else if  (l_ReportType == "27"  )//WIP stock
            {
               data_test_28_Wip_Stock.Call('SELECT');
               
            }
            else if(l_ReportType == "28")//Monthly Stock
            {
                data_test_28_Monthly_Stock.Call('SELECT');
                
            }
            else if(l_ReportType=="25")//MR Average Yarn Count
            {
                data_test_28_MR_Average_Yarn_Count.Call('SELECT');
            }
            else if(l_ReportType=="24")//MR Spinining Result
            {
                data_test_28_MR_Spinining_Result.Call('SELECT');
            }
	    break;
		case 'grdProcess' :
			data_fpib00070.Call('SELECT');
		break;
		
		case 'grdWorkProcess' :
		    if (grdProcess.row>0)
		    {
		        txtProcessPK.text = grdProcess.GetGridData( grdProcess.row, G1_Process_PK );
		    }
		    else
		    {
		        txtProcessPK.text = '' ;
		    }
		    
			data_fpib00070_1.Call('SELECT');
		break;

		case 'grdSTItem' :
			data_fpib00070_2.Call('SELECT');
	    break;
	    
		case 'grdMapping' :
		    if ( grdSTItem.row > 0 )
		    {
			    txtSTItemPK.text = grdSTItem.GetGridData( grdSTItem.row, G3_STItem_PK );
			}
			else
			{
			    txtSTItemPK.text = '' ;
			}	
					
			data_fpib00070_3.Call('SELECT');
	    break;
	  case "WH":
		
	  break;
	}
}
//=======================================================================
function OnChangeReportType()
{
	var _tr_MonthlyProduction       = document.all("tr_MonthlyProduction");    
    var _tr_WIPStock      			= document.all("tr_WIPStock");    
    var _tr_MonthlyStock      		= document.all("tr_MonthlyStock"); 
    var _tr_MR_Average_Yarn_Count	= document.all("tr_MR_Average_Yarn_Count"); 
    var _tr_MR_Spinining_Result  	= document.all("tr_MR_Spinining_Result"); 
	var l_ReportType = lst_ReportType.value;
	
    if ( l_ReportType == "23" )// month production
    {
        _tr_MonthlyProduction.style.display = "";
        _tr_WIPStock.style.display      	= "none";
		_tr_MonthlyStock.style.display ="none";
		_tr_MR_Average_Yarn_Count.style.display ="none";
		_tr_MR_Spinining_Result.style.display ="none";
		grd_Data.GetGridControl().ColHidden(G1_AGV) = true;
       
    }
	else if  (l_ReportType == "27"  )//WIP stock
    {
        _tr_MonthlyProduction.style.display      	= "none";
        _tr_WIPStock.style.display      	= "";
		_tr_MonthlyStock.style.display = "none"
		_tr_MR_Average_Yarn_Count.style.display ="none";
		_tr_MR_Spinining_Result.style.display ="none";
		grd_Data.GetGridControl().ColHidden(G1_AGV) = true;
       
    }
    else if(l_ReportType == "28")//Monthly Stock
    {
        _tr_MonthlyProduction.style.display      	= "none";
        _tr_WIPStock.style.display      	= "none";
        _tr_MonthlyStock.style.display      	= "";
        _tr_MR_Average_Yarn_Count.style.display ="none";
		_tr_MR_Spinining_Result.style.display ="none";
		grd_Data.GetGridControl().ColHidden(G1_AGV) = true;
        
    }
    else if(l_ReportType == "25")//MR Average Yarn Count
    {
        _tr_MonthlyProduction.style.display      	= "none";
        _tr_WIPStock.style.display      	= "none";
        _tr_MonthlyStock.style.display      	= "none";
        _tr_MR_Average_Yarn_Count.style.display ="";
		_tr_MR_Spinining_Result.style.display ="none";
		grd_Data.GetGridControl().ColHidden(G1_AGV) = false;
        
    }
     else if(l_ReportType == "24")//MR Spinining Result
    {
        _tr_MonthlyProduction.style.display      	= "none";
        _tr_WIPStock.style.display      	= "none";
        _tr_MonthlyStock.style.display      	= "none";
        _tr_MR_Average_Yarn_Count.style.display ="none";
		_tr_MR_Spinining_Result.style.display ="";
		grd_Data.GetGridControl().ColHidden(G1_AGV) = false;
        
    }
}

//=======================================================================
function OnDataReceive(obj)
{
	switch ( obj.id )
	{
	    case 'data_test_28_MonthlyProduction' ://monthly production
	         OnDraw('Monthly Production');	
	    break;
	    
		case 'data_test_28_Wip_Stock'://Wip Stock
            OnDraw('Wip Stock');	
		break;
		
		case 'data_test_28_Monthly_Stock' ://monthly stock
		    OnDraw('Monthly Stock qty');		
		break;
			
		case "data_test_28_MR_Average_Yarn_Count"://MR Average Yarn Count
		    OnDraw1("MR Average Yarn Count");
		break;
		
		case "data_test_28_MR_Spinining_Result"://MR Spinining Result
		    OnDraw1("MR Spinining Result");
		break;
    }
}

//=======================================================================
function OnReportClick()
{
    var array_line_group_pk = "" ;
    var t_link = "";
    
        for ( var i = 1; i < grdProcess.rows ; i++ )
        {
            if ( grdProcess.GetGridControl().isSelected(i) == true )
            {
                array_line_group_pk = array_line_group_pk + t_link + grdProcess.GetGridData( i, G1_Process_PK);
                t_link = ',' ;
            }       
        }   
    var url =System.RootURL + '/reports/fp/ib/rpt_fpib00070.aspx?array_line_group_pk=' + array_line_group_pk ;
	window.open(url);
}
//=======================================================================

</script>

<body>
    <!--------------------------------------------------------------->
    <gw:data id="data_test_28_MonthlyProduction" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7" function="<%=l_user%>lg_sel_test_28_MonthlyProd"> 
			    <input bind="grdProcess" > 
			        <input bind="lst_WH_Mon_Prod" />			
			        <input bind="dt_Mon_Mon_Prod_From" />
			        <input bind="dt_Mon_Mon_Prod_To" />
			    </input> 
			    <output bind="grd_Data" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!--------------------------------------------------------------->
    <gw:data id="data_test_28_Wip_Stock" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7" function="<%=l_user%>lg_sel_test_28_Wip_Stock"> 
			    <input bind="grdProcess" > 
			        <input bind="lst_WH_Wip_Stock" />			
			        <input bind="dt_Mon_Wip_Stock_From" />
			        <input bind="dt_Mon_Wip_Stock_To" />
			    </input> 
			    <output bind="grd_Data" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!--------------------------------------------------------------->
    <gw:data id="data_test_28_Monthly_Stock" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7" function="<%=l_user%>lg_sel_test_28_Monthly_Stock"> 
			    <input bind="grdProcess" > 
			        <input bind="lst_WH_Monthly_Stock" />			
			        <input bind="dt_Mon_Monthly_Stock_From" />
			        <input bind="dt_Mon_Monthly_Stock_To" />
			    </input> 
			    <output bind="grd_Data" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!--------------------------------------------------------------->
    <gw:data id="data_test_28_MR_Average_Yarn_Count" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="<%=l_user%>lg_sel_test_28_4" > 
			    <input bind="grd_Data" > 
			        <input bind="lst_WH_MR_Average_Yarn_Count" />			
			        <input bind="dt_Mon_MR_Average_Yarn_Count_From" />			
			        <input bind="dt_Mon_MR_Average_Yarn_Count_To" />			
			    </input> 
			    <output bind="grd_Data" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_test_28_MR_Spinining_Result" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" function="<%=l_user%>lg_sel_test_28_5" > 
			    <input bind="grd_Data" > 
			         <input bind="lst_WH_MR_Spinining_Result" />	
			         <input bind="dt_Mon_MR_Spinining_Result_From" />	
			         <input bind="dt_Mon_MR_Spinining_Result_To" />		
			    </input> 
			    <output bind="grd_Data" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!----------------------------------------------------------------
    <gw:data id="data_fpib00070_3" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7" function="<%=l_user%>lg_sel_fpib00070_3"  procedure="<%=l_user%>lg_upd_fpib00070_3"  > 
			    <input bind="grdMapping" > 
			        <input bind="txtSTItemPK" />			
			    </input> 
			    <output bind="grdMapping" /> 
		    </dso> 
	    </xml> 
    </gw:data>-->
    <!------------------------------------------------------------------------------>
    <table id="tbl_1" name="tbl_1" style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td>
                <table id="tbl_Header" cellpadding="0" cellspacing="0">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Report Type
                        </td>
                        <td style="width: 15%" align="left">
                            <gw:list id="lst_ReportType" styles="width:100%" onchange="OnChangeReportType()" />
                        </td>
                        <td style="width: 77%">
                            <table id="tbl_Condition" style="width: 100%;" cellpadding="0" cellspacing="0">
                                <tr id="tr_MonthlyProduction">
                                    <td style="width: 100%;">
                                        <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="width: 5%;" align="right">
                                                    W/H
                                                </td>
                                                <td style="width: 25%;" align="left">
                                                    <gw:list id="lst_WH_Mon_Prod" style="width: 100%;" />
                                                </td>
                                                <td style="width: 5%;" align="right">
                                                    Month
                                                </td>
                                                <td style="width: 30%; white-space: nowrap;" align="left">
                                                    <gw:datebox id="dt_Mon_Mon_Prod_From" type="month" lang="<%=session("lang")%>" />
                                                    ~
                                                    <gw:datebox id="dt_Mon_Mon_Prod_To" type="month" lang="<%=session("lang")%>" />
                                                </td>
                                                <td style="width: 35%;" align="right">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr id="tr_WIPStock">
                                    <td style="width: 100%;">
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="width: 5%;" align="right">
                                                    W/H
                                                </td>
                                                <td style="width: 25%;" align="left">
                                                    <gw:list id="lst_WH_Wip_Stock" style="width: 100%;" />
                                                </td>
                                                <td style="width: 5%;" align="right">
                                                    Month
                                                </td>
                                                <td style="width: 30%; white-space: nowrap;" align="left">
                                                    <gw:datebox id="dt_Mon_Wip_Stock_From" type="year" lang="<%=session("lang")%>" />
                                                    ~
                                                    <gw:datebox id="dt_Mon_Wip_Stock_To" type="year" lang="<%=session("lang")%>" />
                                                </td>
                                                <td style="width: 35%;" align="right">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr id="tr_MonthlyStock">
                                    <td style="width: 100%;">
                                        <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="width: 5%;" align="right">
                                                    W/H
                                                </td>
                                                <td style="width: 25%;" align="left">
                                                    <gw:list id="lst_WH_Monthly_Stock" style="width: 100%;" />
                                                </td>
                                                <td style="width: 5%;" align="right">
                                                    Month
                                                </td>
                                                <td style="width: 30%; white-space: nowrap;" align="left">
                                                    <gw:datebox id="dt_Mon_Monthly_Stock_From" type="year" lang="<%=session("lang")%>" />
                                                    ~
                                                    <gw:datebox id="dt_Mon_Monthly_Stock_To" type="year" lang="<%=session("lang")%>" />
                                                </td>
                                                <td style="width: 35%;" align="right">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr id="tr_MR_Average_Yarn_Count">
                                    <td style="width: 100%;">
                                        <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="width: 5%;" align="right">
                                                    W/H
                                                </td>
                                                <td style="width: 25%;" align="left">
                                                    <gw:list id="lst_WH_MR_Average_Yarn_Count" style="width: 100%;" />
                                                </td>
                                                <td style="width: 5%;" align="right">
                                                    Month
                                                </td>
                                                <td style="width: 30%; white-space: nowrap;" align="left">
                                                    <gw:datebox id="dt_Mon_MR_Average_Yarn_Count_From" type="year" lang="<%=session("lang")%>" />
                                                    ~
                                                    <gw:datebox id="dt_Mon_MR_Average_Yarn_Count_To" type="year" lang="<%=session("lang")%>" />
                                                </td>
                                                <td style="width: 35%;" align="right">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr id="tr_MR_Spinining_Result">
                                    <td style="width: 100%;">
                                        <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td style="width: 5%;" align="right">
                                                    W/H
                                                </td>
                                                <td style="width: 25%;" align="left">
                                                    <gw:list id="lst_WH_MR_Spinining_Result" style="width: 100%;" />
                                                </td>
                                                <td style="width: 5%;" align="right">
                                                    Month
                                                </td>
                                                <td style="width: 30%; white-space: nowrap;" align="left">
                                                    <gw:datebox id="dt_Mon_MR_Spinining_Result_From" type="year" lang="<%=session("lang")%>" />
                                                    ~
                                                    <gw:datebox id="dt_Mon_MR_Spinining_Result_To" type="year" lang="<%=session("lang")%>" />
                                                </td>
                                                <td style="width: 35%;" align="right">
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnReport1" img="excel" alt="Many reports" text="Many reports" onclick="OnPrint(1)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnReport2" img="excel" alt="Item W/H" text="Item W/H" onclick="OnPrint(2)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('DATA')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <!-- <gw:tab id="idTab" onpageactivate=""> -->
                <gw:tab id="tab_01" onpageactivate="" onclick="OnChangedTab()">
    <table id="tab_Chart" name="Chart" class="table" style="width: 100%; height: 100%; margin:0 0 0 0; padding:0 0 0 0; overflow:visible;" border="1" cellpadding="0" cellspacing="0" >
        <tr>
            <td style=" margin:0 0 0 0; padding:0 0 0 0;" >
                <div id="chart_div" style="display:table-cell; overflow:visible;"></div>
            </td>
        </tr>      
       
    </table>
    <table id="tab_Data" name="Data" class="table" style="width: 100%; height: 100%" border="1">
        <tr>
            
            <td style="width: 100%">
                
                           <gw:grid id='grd_Data'
								header='Date|Agv|Mon 01|Mon 02|Mon 03|Mon 04|Mon 05|Mon 06|Mon 07|Mon 08|Mon 09|Mon 10|Mon 11|Mon 12|'
								format='0|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
								aligns='1|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
								check='||||||||||||||'
								editcol='0|0|0|0|0|0|1|0|0|0|0|0|0|0|0'
								widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
								sorting='T'
								autosize='T' 
								styles='width:100%; height:100%'
								/>
                       
            </td>
        </tr>
    </table>
    </gw:tab>
                <!-- </gw:tab> -->
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
    <gw:textbox id="txtProcessPK" text="" styles="display:none" />
    <gw:textbox id="txtSTItemPK" text="" styles="display:none" />
    <!----------------------------------------------------------->
</body>
</html>
