
<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>M/R CHECKING</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 var start_col=0;
    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
 function OnSearch(obj)
 {
    if(obj=='1')
	{
		dso_htfo00710.Call("SELECT");
	}
	if(obj=='2')
	{
		var l_date=grdRFCUsing.GetGridData(0, grdRFCUsing.col);
			l_date_end =l_date.substring(1, 2);
		var	l_year=dtDate.value;
		var	l_year_end =l_year.substring(0, 4);
			if(l_date_end !='/')
			{
				//txt_grdRFCUsing2_Date.text=l_date.substring(0, 2);
				if(l_date.length ==5)
				{
					txt_grdRFCUsing2_Date.text=l_year_end+""+l_date.substring(3,5)+""+l_date.substring(0, 2);
				}
				else
				{
					txt_grdRFCUsing2_Date.text=l_year_end+""+'0'+""+l_date.substring(3,4)+""+l_date.substring(0, 2);
				}
			}
			else
			{
				if(l_date.length ==4)
				{
					txt_grdRFCUsing2_Date.text=l_year_end+""+l_date.substring(2,4)+""+'0'+l_date.substring(0, 1);
				}
				else
				{
					txt_grdRFCUsing2_Date.text=l_year_end+""+'0'+l_date.substring(2,3)+""+'0'+l_date.substring(0, 1);
				}
			}
		
		//alert(txt_grdRFCUsing2_Date.text);
		dso_htfo00710_dtl.Call("SELECT");
	}
 }
 function BodyInit()
 {  //alert("This form is updating. Please come back later.")
	OnSearch('1');
 }
 function ResetHeader(){
    BuildHeader(grdRFCUsing);
	SetColorColumnSatSun();
 } 
 function SetColorColumnSatSun()
 {  
     var value_col_mst;
	 for (var col_master = 0; col_master < grdRFCUsing.cols ; col_master ++ )
	  {
			 value_col_mst = grdRFCUsing.GetGridData(1, col_master);
			 if(value_col_mst == "FRI")
			 {
				  grdRFCUsing.SetCellBgColor(1, col_master, grdRFCUsing.rows-1, col_master, 0xFFBF00);//		
                  //grdRFCUsing2.SetCellBgColor(1, col_master, grdRFCUsing2.rows-1, col_master, 0xFFBF00);//						  
			 }
			 else if(value_col_mst == "SAT")
			 {
					grdRFCUsing.SetCellBgColor(1, col_master, grdRFCUsing.rows-1, col_master, 0xFF8000);//
					//grdRFCUsing2.SetCellBgColor(1, col_master, grdRFCUsing2.rows-1, col_master, 0xFF8000);//
			 }
	   }
 }
 function FormatRowSumTotal()
 {
	var fg=grdRFCUsing.GetGridControl();
	fg.ColFormat(0) = "#,###,###,###,###,###,###";
	fg.ColFormat(1) = "#,###,###,###,###,###,###";
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
 }
 
 
//=========================================================================
function BuildHeader(ctrl){
	var first_days=Number(ctrl.GetGridData(2,31));
	var last_day=Number(ctrl.GetGridData(2,32));
	var first_day=Number(ctrl.GetGridData(2,33));
	var cur_month=Number(grdRFCUsing.GetGridData(1,34));
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
/*function OnReport(obj)
 {
    if(obj=='1')
	{
		
	}
 }
*/
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="dso_htfo00710" onreceive="ResetHeader();"> 
        <xml>
           <dso  type="grid"   function="ht_sel_60250210" >
                <input  bind="grdRFCUsing">
                    <input bind="dtDate" />
                </input> 
                <output bind="grdRFCUsing" /> 
            </dso> 
        </xml> 
    </gw:data>
	<gw:data id="dso_htfo00710_dtl" onreceive=""> 
        <xml>
           <dso  type="grid"   function="ht_sel_60250210_detail" >
                <input  bind="grdRFCUsing2">
                    <input bind="txt_grdRFCUsing2_Date" />
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
                            <gw:datebox id="dtDate" lang="1" onchange="OnSearch('1')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="center">
						    <gw:imgBtn img="search" onclick="OnSearch('1')" />
                        </td>
						<td style="width: 5%; white-space: nowrap" align="center">
						    
                        </td>
                        <td style="width: 5%" align="right">
							
                        </td>
						<td style="width: 2%" align="right"></td>
						<td style="width: 10%" align="right">
							
						</td>
						<td style="width: 10%" align="right">
							
						</td>
						<td style="width: 5%" align="center"></td>
						<td style="width: 8%" align="center"></td>
						<td style="width: 25%" align="right"></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 22%">
            <td>
                <gw:grid id='grdRFCUsing' 
				    header='1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|_first_days|_last_day|_current_day|_month'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                    aligns='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    sorting='T' styles='width:100%; height:100%' autosize="T"
                    acceptnulldate="T" oncellclick="OnSearch('2')"  />
            </td>
        </tr>
		
		<tr style="height: 76%">
            <td>
                <gw:grid id='grdRFCUsing2' 
				    header='Folio#|Last Name|First Name|Room Type|Room#|Arrival|Departure|Adult|Child|Extra Bed'
                    format='0|0|0|0|0|4|4|0|0|0' 
                    aligns='0|0|0|0|0|0|0|0|0|0'
					autosize="T"
                    sorting='T' styles='width:100%; height:100%' 
                    acceptnulldate="T" />
            </td>
        </tr>
    </table>
	<gw:textbox id="txt_grdRFCUsing2_Date"  text="0" styles="display:none"  />
    <!------------------------------------------------------------------>
</body>
</html>
