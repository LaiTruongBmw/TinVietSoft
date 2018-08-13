<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Select Room Type</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
  var start_col=2;
    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
 function OnSearch()
 {
    dtDate.SetDataText("<%=Request.QueryString("start_date")%>");
    data_htrm00010.Call("SELECT");
 }
 function BodyInit()
 {
	txtNo.text="1";
	OnSearch();
 }
 function ResetHeader(){
    BuildHeader(grdRFCUsing);
	BuildHeader2(grdRFCUsing2);
	SetColorColumn(grdRFCUsing);
	SetColorColumn(grdRFCUsing2);
	SetColorColumnSatSun();
 } 
 function SetColorColumn(ctrl)
 {
	  for (var row = 1; row < ctrl.rows; row ++ )
           for (var col_master = 2; col_master < ctrl.cols ; col_master ++ )
                  {
                         var value_col_mst = ctrl.GetGridData(row, col_master);
						 if(value_col_mst < 0)
						 {
							ctrl.SetCellBgColor(row, col_master, row, col_master, 0x5c5ccd);//
						 }
				   }
 }
 function SetColorColumnSatSun()
 {  
     var value_col_mst;
	 for (var col_master = 2; col_master < grdRFCUsing.cols ; col_master ++ )
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
//=========================================================================
function BuildHeader(ctrl){
	var first_days=Number(ctrl.GetGridData(2,33));
	var last_day=Number(ctrl.GetGridData(2,34));
	var first_day=Number(ctrl.GetGridData(2,35));
	var cur_month=Number(ctrl.GetGridData(1,36));
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
	//ctrl.GetGridControl().TopRow=ctrl.rows-1;
} 
function BuildHeader2(ctrl){
    ctrl.ClearData();
	var first_days=Number(grdRFCUsing.GetGridData(2,33));
	var last_day=Number(grdRFCUsing.GetGridData(2,34));
	var first_day=Number(grdRFCUsing.GetGridData(2,35));
	var cur_month=Number(grdRFCUsing.GetGridData(1,36));
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
			ctrl.SetGridText(0,i+2+first_days,i+"/"+cur_month);
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
	//ctrl.GetGridControl().TopRow=ctrl.rows-1;
} 
function OnSelect(oGrid){
	
 var arr_data = new Array();
   
   if(oGrid.rows > 1)
   {   
      for(var i=1;i<oGrid.rows;i++){
         var arrTemp=new Array();
         
         for(var j=0;j<oGrid.cols;j++){
            arrTemp[arrTemp.length]= oGrid.GetGridData(i,j);
         }
         
         arr_data[arr_data.length]= arrTemp;
      }
      
	  if ( arr_data !=null ){
		window.returnValue =  arr_data;
		window.close();
	  }else{
	    alert("You have not selected data yet.");
	  }
   }	  
}	
function OnSelectGuestMst()
{
   if(event.row <=1) return;
   
	var rownum;
	rownum=Number(txtNo.text);
	var col_val = grdRFCUsing.GetGridData(event.row, 1 );
	
	if(grdRFCUsing.row != -1)
	{
		for(var j=2;j<=rownum+1;j++)
		{
			grdRFCUsing2.AddRow();
			for(var i=0;i<grdRFCUsing.cols;i++)
			{
			  grdRFCUsing2.SetGridText(grdRFCUsing2.rows-1,i,grdRFCUsing.GetGridData(grdRFCUsing.row,i));
			}
		}
	}
	lbRecord.text= grdRFCUsing2.rows-1 + " row(s)";
}
function OnRemove()
{
  if(grdRFCUsing2.row > 0)
  {
    grdRFCUsing2.RemoveRowAt(grdRFCUsing2.row);
  }
  lbRecord.text= grdRFCUsing2.rows-1 + " row(s)";	
}
function OnShowDetailBK()
{
    if(grdRFCUsing.row > 0)
    {
	   var select_date = grdRFCUsing.GetGridData(0,grdRFCUsing.col);
	   
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
	   
       var path = System.RootURL + "/standard/forms/ht/rm/htrm00010_popup1.aspx?d=" + select_date+"&type="+ type;
	   //alert(path)
       var object = System.OpenModal( path ,600 ,500 ,  'resizable:yes;status:yes');
    }
}
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htrm00010" onreceive="ResetHeader();"> 
        <xml>
           <dso  type="grid"   function="st_ht_sel_60240010_popup" >
                <input  bind="grdRFCUsing">
                    <input bind="dtDate" />
                </input> 
                <output bind="grdRFCUsing" /> 
            </dso> 
        </xml> 
    </gw:data>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 5%">
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
						    <gw:icon text="Show detail booking" id="btnShow" onclick="OnShowDetailBK()" />
                        </td>
						<td style="width: 5%" align="right">No</td>
                        <td style="width: 10%" align="right"> <gw:textbox id="txtNo" type="number" format="###,###,###,###" styles='width:100%' /></td>
                        <td style="width: 10%" align="right">
						<td style="width: 3%">
							   <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelectGuestMst()" />
						 </td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:40%">
            <td>
                <gw:grid id='grdRFCUsing' 
				    header='Type|Total|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|_16|_17|_18|_19|_20|_21|_22|_23|_24|_25|_26|_27|_28|_29|_30|_31|_first_days|_last_day|_current_day|_month'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                    aligns='0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    sorting='T' styles='width:100%; height:100%' autosize="T"
                    acceptnulldate="T" oncelldblclick="OnSelectGuestMst()"/>
            </td>
        </tr>
		<tr style="height: 3%">
		    <td>
				<table style="width: 100%; height: 100%">
					<tr>
						<td style="width: 20%; white-space:nowrap" align="center">
                            <gw:label id="lbRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
						<td style="width:74%"  colspan="11">
						</td>
						<td style="width: 3%">
							 <gw:imgbtn id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
						 </td>
						 <td style="width: 3%">
							   <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdRFCUsing2)" />
						 </td>
					</tr>
				</table>
			</td>
            
        </tr>
		<tr style="height:50%">
            <td>
                <gw:grid id='grdRFCUsing2' 
				    header='Type|Total|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|_16|_17|_18|_19|_20|_21|_22|_23|_24|_25|_26|_27|_28|_29|_30|_31|_first_days|_last_day|_current_day|_month'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
                    aligns='0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    sorting='T' styles='width:100%; height:100%' autosize="T"
                    acceptnulldate="T" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
