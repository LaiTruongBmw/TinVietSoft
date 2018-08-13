<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>M/R CHECKING</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 var start_col=3; 
    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
 function OnSearch()
 {
    data_htrm00010.Call("SELECT");
 }
 function BodyInit()
 {  //alert("This form is updating. Please come back later.")
	txtDays.text='10';
	OnSearch();
 }
 function ResetHeader(){
    BuildHeader(grdRFCUsing);
	//grdRFCUsing.SetCellBgColor(1, 0, grdRFCUsing.rows-1, 32, 0x5c5ccd);//
	
	grdRFCUsing.SetCellBgColor(2, 0, 2, 33, 0x90EE90);//
	
	grdRFCUsing.SetCellBgColor(4, 0, 4, 33, 0x90EE90);//
	
	grdRFCUsing.SetCellBgColor(6, 0, 6, 33, 0x90EE90);//
	
	grdRFCUsing.SetCellBgColor(8, 0, 8, 33, 0x90EE90);//
	
	grdRFCUsing.SetCellBgColor(10, 0, 10, 33, 0x90EE90);//
	
	grdRFCUsing.Subtotal( 0, 2, -1, '2!3!4!5!6!7!8!9!10!11!12!13!14!15!16!17!18!19!20!21!22!23!24!25!26!27!28!29!30!31!32!33');
	//ResumTotal();
	SetColorColumn();
	FormatRowSumTotal();
	
	data_htrm00010_2.Call("SELECT");
 } 
 function ResumTotal(){
    var colSumm=0;
	for(var i=2;i<=33;i++){
	   colSumm = 0; 
	   for(var j=2;j<=10;j++){
			colSumm += Number(grdRFCUsing.GetGridData(j,i));
	   }
	   grdRFCUsing.SetGridText(18,i, colSumm);
	   
	}
 }
 function SetColorColumn()
 {
	  for (var row = 1; row < grdRFCUsing.rows; row ++ ){
           for (var col_master = 2; col_master < grdRFCUsing.cols ; col_master ++ )
                  {
                         var value_col_mst = grdRFCUsing.GetGridData(row, col_master);
						 if(value_col_mst < 0)
						 {
							grdRFCUsing.SetCellFontColor(row, col_master, row, col_master, 0x0000FF);//
						 }
				   }
		grdRFCUsing.SetCellBgColor(row, 2, row, 2, 0x555ccd);//		   
		}		   
 }
 function SetColorColumnSatSun()
 {  
     var value_col_mst;
	 for (var col_master = 3; col_master < grdRFCUsing.cols ; col_master ++ )
	  {
			 value_col_mst = grdRFCUsing.GetGridData(1, col_master);
			 if(value_col_mst == "FRI")
			 {
				  //grdRFCUsing.SetCellBgColor(1, col_master, grdRFCUsing.rows-1, col_master, 0xFFBF00);//		
                  //grdRFCUsing2.SetCellBgColor(1, col_master, grdRFCUsing2.rows-1, col_master, 0xFFBF00);//	
                  grdRFCUsing.SetCellFontColor(1, col_master, 1, col_master, 0x0000FF);//				  
			 }
			 else if(value_col_mst == "SAT")
			 {
					//grdRFCUsing.SetCellBgColor(1, col_master, grdRFCUsing.rows-1, col_master, 0xFF8000);//
					//grdRFCUsing2.SetCellBgColor(1, col_master, grdRFCUsing2.rows-1, col_master, 0xFF8000);//
					grdRFCUsing.SetCellFontColor(1, col_master, 1, col_master, 0x0000FF);//
			 }else if(value_col_mst == "SUN")
			 {
					//grdRFCUsing.SetCellBgColor(1, col_master, grdRFCUsing.rows-1, col_master, 0xFF8000);//
					//grdRFCUsing2.SetCellBgColor(1, col_master, grdRFCUsing2.rows-1, col_master, 0xFF8000);//
					grdRFCUsing.SetCellFontColor(1, col_master, 1, col_master, 0x0000FF);//
			 }
	   }
 }
 function FormatRowSumTotal()
 {
	var fg=grdRFCUsing.GetGridControl();
	fg.ColFormat(2) = "#,###,###,###,###,###,###";
	fg.ColFormat(3) = "#,###,###,###,###,###,###";
	fg.ColFormat(4) = "#,###,###,###,###,###,###";
	fg.ColFormat(5) = "#,###,###,###,###,###,###";
	fg.ColFormat(6) = "#,###,###,###,###,###,###";
	fg.ColFormat(7) = "#,###,###,###,###,###,###";
	fg.ColFormat(8) = "#,###,###,###,###,###,###";
	fg.ColFormat(9) = "#,###,###,###,###,###,###";
	fg.ColFormat(10) = "#,###,###,###,###,###,###";
	fg.ColFormat(11) = "#,###,###,###,###,###,###";
	fg.ColFormat(12) = "#,###,###,###,###,###,###";
	fg.ColFormat(13) = "#,###,###,###,###,###,###";
	fg.ColFormat(14) = "#,###,###,###,###,###,###";
	fg.ColFormat(15) = "#,###,###,###,###,###,###";
	fg.ColFormat(16) = "#,###,###,###,###,###,###";
	fg.ColFormat(17) = "#,###,###,###,###,###,###";
	fg.ColFormat(18) = "#,###,###,###,###,###,###";
	fg.ColFormat(19) = "#,###,###,###,###,###,###";
	fg.ColFormat(20) = "#,###,###,###,###,###,###";
	fg.ColFormat(21) = "#,###,###,###,###,###,###";
	fg.ColFormat(22) = "#,###,###,###,###,###,###";
	fg.ColFormat(23) = "#,###,###,###,###,###,###";
	fg.ColFormat(24) = "#,###,###,###,###,###,###";
	fg.ColFormat(25) = "#,###,###,###,###,###,###";
	fg.ColFormat(26) = "#,###,###,###,###,###,###";
	fg.ColFormat(27) = "#,###,###,###,###,###,###";
	fg.ColFormat(28) = "#,###,###,###,###,###,###";
	fg.ColFormat(29) = "#,###,###,###,###,###,###";
	fg.ColFormat(30) = "#,###,###,###,###,###,###";
	fg.ColFormat(31) = "#,###,###,###,###,###,###";
	fg.ColFormat(32) = "#,###,###,###,###,###,###";
	fg.ColFormat(33) = "#,###,###,###,###,###,###";
 }
 
 
//=========================================================================
function BuildHeader(ctrl){
	var first_days=Number(ctrl.GetGridData(2,34));
	var last_day=Number(ctrl.GetGridData(2,35));
	var first_day=Number(ctrl.GetGridData(2,36));
	var cur_month=Number(grdRFCUsing.GetGridData(1,37));
	var col_idx;
	var obj = ctrl.GetGridControl();
	if(first_day > 1){
	    //alert(first_days +":"+last_day+":"+first_day)
		for(var i=0;i<=first_days;i++){
			ctrl.SetGridText(0,i+start_col,first_day+i+"/"+cur_month); 
			ctrl.SetCellBgColor(0, i+start_col, 0, i+start_col,0xFFE9BD);//orginal header back ground color
		}
		if(cur_month < 12){
			cur_month += 1;
		}
		else{
			cur_month = 1;
		}
		for(var i=1;i<=(31-first_days);i++){
			ctrl.SetGridText(0,i+start_col+first_days,i+"/"+cur_month);
			ctrl.SetCellBgColor(0, i+first_days+start_col, 0, i+first_days+start_col,0X5DFBF6);
		}
		obj.ColHidden(30+start_col) = false;
		obj.ColHidden(29+start_col) = false;
		obj.ColHidden(28+start_col) = false;
	}
	else
	{
		for(var i=0;i<=30;i++){
			ctrl.SetGridText(0,i+start_col,i+1+"/"+cur_month);
			ctrl.SetCellBgColor(0, i+start_col, 0, i+start_col,0xFFE9BD);
		}
		
		if(cur_month == 2){
		    
			obj.ColHidden(30+start_col) = true;
			obj.ColHidden(29+start_col) = true;
			obj.ColHidden(28+start_col) = true;
		}
		else if(cur_month == 4 || cur_month == 6 || cur_month == 11){
			obj.ColHidden(30+start_col) = true;
		}else{
			obj.ColHidden(30+start_col) = false;
			obj.ColHidden(29+start_col) = false;
			obj.ColHidden(28+start_col) = false;
		}
	}
}

//-----------------------grid2
function ResetHeader2(){
    BuildHeader(grdRFCUsing2);
	//grdRFCUsing.SetCellBgColor(1, 0, grdRFCUsing.rows-1, 32, 0x5c5ccd);//
	
	grdRFCUsing2.SetCellBgColor(2, 0, 2, 33, 0x90EE90);//
	
	grdRFCUsing2.SetCellBgColor(4, 0, 4, 33, 0x90EE90);//
	
	grdRFCUsing2.SetCellBgColor(6, 0, 6, 33, 0x90EE90);//
	
	//grdRFCUsing2.SetCellBgColor(8, 0, 8, 32, 0xFFCCCC);//
	
	//grdRFCUsing2.Subtotal( 0, 2, -1, '2!3!4!5!6!7!8!9!10!11!12!13!14!15!16!17!18!19!20!21!22!23!24!25!26!27!28!29!30!31!32!33');
	
	SetColorColumn2();
	FormatRowSumTotal2();
	SetColorColumnSatSun();
 } 
 function SetColorColumn2()
 {
	  for (var row = 1; row < grdRFCUsing2.rows; row ++ ){
           for (var col_master = 2; col_master < grdRFCUsing2.cols ; col_master ++ )
                  {
                         var value_col_mst = grdRFCUsing2.GetGridData(row, col_master);
						 if(value_col_mst < 0)
						 {
							grdRFCUsing2.SetCellFontColor(row, col_master, row, col_master, 0x0000FF);//
						 }
				   }
		grdRFCUsing2.SetCellBgColor(row, 2, row, 2, 0x555ccd);//		   
		}		   
 }
 function FormatRowSumTotal2()
 {
	var fg2=grdRFCUsing2.GetGridControl();
	fg2.ColFormat(2) = "#,###,###,###,###,###,###";
	fg2.ColFormat(3) = "#,###,###,###,###,###,###";
	fg2.ColFormat(4) = "#,###,###,###,###,###,###";
	fg2.ColFormat(5) = "#,###,###,###,###,###,###";
	fg2.ColFormat(6) = "#,###,###,###,###,###,###";
	fg2.ColFormat(7) = "#,###,###,###,###,###,###";
	fg2.ColFormat(8) = "#,###,###,###,###,###,###";
	fg2.ColFormat(9) = "#,###,###,###,###,###,###";
	fg2.ColFormat(10) = "#,###,###,###,###,###,###";
	fg2.ColFormat(11) = "#,###,###,###,###,###,###";
	fg2.ColFormat(12) = "#,###,###,###,###,###,###";
	fg2.ColFormat(13) = "#,###,###,###,###,###,###";
	fg2.ColFormat(14) = "#,###,###,###,###,###,###";
	fg2.ColFormat(15) = "#,###,###,###,###,###,###";
	fg2.ColFormat(16) = "#,###,###,###,###,###,###";
	fg2.ColFormat(17) = "#,###,###,###,###,###,###";
	fg2.ColFormat(18) = "#,###,###,###,###,###,###";
	fg2.ColFormat(19) = "#,###,###,###,###,###,###";
	fg2.ColFormat(20) = "#,###,###,###,###,###,###";
	fg2.ColFormat(21) = "#,###,###,###,###,###,###";
	fg2.ColFormat(22) = "#,###,###,###,###,###,###";
	fg2.ColFormat(23) = "#,###,###,###,###,###,###";
	fg2.ColFormat(24) = "#,###,###,###,###,###,###";
	fg2.ColFormat(25) = "#,###,###,###,###,###,###";
	fg2.ColFormat(26) = "#,###,###,###,###,###,###";
	fg2.ColFormat(27) = "#,###,###,###,###,###,###";
	fg2.ColFormat(28) = "#,###,###,###,###,###,###";
	fg2.ColFormat(29) = "#,###,###,###,###,###,###";
	fg2.ColFormat(30) = "#,###,###,###,###,###,###";
	fg2.ColFormat(31) = "#,###,###,###,###,###,###";
	fg2.ColFormat(32) = "#,###,###,###,###,###,###";
	fg2.ColFormat(33) = "#,###,###,###,###,###,###";
 } 
 function BuildHeader2(ctrl){
	var first_days=Number(ctrl.GetGridData(1,34));
	var last_day=Number(ctrl.GetGridData(1,35));
	var first_day=Number(ctrl.GetGridData(1,36));
	var cur_month=Number(grdRFCUsing.GetGridData(1,37));
	var col_idx;
	if(first_day > 1){
	    //alert(first_days +":"+last_day+":"+first_day)
		for(var i=0;i<=first_days;i++){
			ctrl.SetGridText(0,i+start_col,first_day+i+"/"+cur_month); 
			ctrl.SetCellBgColor(0, i+start_col, 0, i+start_col,0xFFE9BD);//orginal header back ground color
		}
		if(cur_month < 12){
			cur_month += 1;
		}
		else{
			cur_month = 1;
		}
		for(var i=1;i<=(31-first_days);i++){
			ctrl.SetGridText(0,i+start_col+first_days,i+"/"+cur_month);
			ctrl.SetCellBgColor(0, i+first_days+start_col, 0, i+first_days+start_col,0X5DFBF6);
		}
		
	}
	else
	{
		for(var i=0;i<=30;i++){
			ctrl.SetGridText(0,i+start_col,i+1+"/"+cur_month);
			ctrl.SetCellBgColor(0, i+start_col, 0, i+start_col,0xFFE9BD);
		}
	}
}
 //---------------end--------grid2
function OnShowDetailBK()
{
    if(grdRFCUsing.row > 0)
    {
	   var select_date = grdRFCUsing.GetGridData(0,grdRFCUsing.col);
	   select_date = select_date.split("/");
	   select_date = select_date[0];
	   var type = grdRFCUsing.GetGridData(grdRFCUsing.row,0);
	   
	   var dd = dtDate.GetData().substr(6,2);
	   var mm = dtDate.GetData().substr(4,2);
	   var yyyy = dtDate.GetData().substr(0,4);
	   
	   if (Number(select_date) >= Number(dd)){
			if(Number(select_date) < 10){
				select_date = "0" + Number(select_date);
			}
	   }
	   else{
			mm = Number(mm) + 1;
			if(mm > 12){
				yyyy = Number(yyyy) + 1;
				mm = "01";
			}
			if(Number(select_date) < 10){
				select_date = "0" + Number(select_date);
			}
			if(Number(mm) < 10){
				mm = "0" + Number(mm);
			}
	   }
	   select_date = "" + yyyy + mm + select_date;
	   
       var path = System.RootURL + "/standard/forms/ho/24/60240030_popup1.aspx?d=" + select_date+"&type="+ type;
	   //alert(path)
       var object = System.OpenModal( path ,1000 ,500 ,  'resizable:yes;status:yes');
    }
}
function OnReport(obj)
 {
    if(obj=='1')
	{
		if(grdRFCUsing.rows > 1)
		{
			 var url = '/standard/reports/ho/24/rpt_60240030_room_availability.aspx?p_date='+dtDate.value; 
			System.OpenTargetPage( System.RootURL+url , "newform" );
		}
	}
	if(obj=='2')
	{
		var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/fo/rpt_htfo00170.rpt&procedure=ht_rpt_60240030_hse_kping3&parameter=" + ''+","+ '';
		System.OpenTargetPage(url);  
	}
	if(obj=='3')
	{
		 var url = '/standard/reports/ho/24/rpt_60240030_OCC_Forecast.aspx?p_date='+dtDate.value+'&p_days='+txtDays.text; 
		System.OpenTargetPage( System.RootURL+url , "newform" );
	}	
 }

</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htrm00010" onreceive="ResetHeader();"> 
        <xml>
           <dso  type="grid"   function="ht_sel_60240030" >
                <input  bind="grdRFCUsing">
                    <input bind="dtDate" />
                </input> 
                <output bind="grdRFCUsing" /> 
            </dso> 
        </xml> 
    </gw:data>
	<gw:data id="data_htrm00010_2" onreceive="ResetHeader2();"> 
        <xml>
           <dso  type="grid"   function="ht_sel_60240030_note" >
                <input  bind="grdRFCUsing2">
                    <input bind="dtDate" />
                </input> 
                <output bind="grdRFCUsing2" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 2%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 10%" align="right">
						    Start date:
                        </td>
						<td style="width: 10%; white-space: nowrap">
                            <gw:datebox id="dtDate" lang="1" onchange="OnSearch()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="center">
						    <gw:imgBtn img="search" onclick="data_htrm00010.Call('SELECT');" />
                        </td>
						<td style="width: 5%; white-space: nowrap" align="center">
						    <gw:icon text="Show detail booking" id="btnShow" onclick="OnShowDetailBK()" />
                        </td>
                        <td style="width: 5%" align="right">
							<gw:imgbtn id="btnReport1" img="excel" alt="Room Availability" onclick="OnReport('1')" />
                        </td>
						<td style="width: 2%" align="right"></td>
						<td style="width: 1%" align="right"  >
							<gw:icon text="Out Of Order" id="btnOOO" onclick="OnReport('2')" styles='width:100%;display:none' /> 
						</td>
						<td style="width: 10%" align="right">
							<gw:icon text="OCCUPANCY FORECAST" id="btnOC_ForeCast" onclick="OnReport('3')" /> 
						</td>
						<td style="width: 5%" align="center">Days:</td>
						<td style="width: 8%" align="center"><gw:textbox id="txtDays" onenterkey=""  /></td>
						<td style="width: 25%" align="right"></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 56%">
            <td>
                <gw:grid id='grdRFCUsing' 
				    header='Code|Name|Total|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|_first_days|_last_day|_current_day|_month'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                    aligns='0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    sorting='T' styles='width:100%; height:100%' autosize="T"
                    acceptnulldate="T" />
            </td>
        </tr>
		
		<tr style="height: 42%">
            <td>
                <gw:grid id='grdRFCUsing2' 
				    header='Code|Name|_Total|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|_first_days|_last_day|_current_day'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                    aligns='0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
					autosize="T"
                    sorting='T' styles='width:100%; height:100%' 
                    acceptnulldate="T" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
