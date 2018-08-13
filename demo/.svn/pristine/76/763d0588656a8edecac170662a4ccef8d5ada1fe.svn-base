<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Select Room Type</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 
    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ; 
 function BindingData()
 {
    txt_room_allocate_pk.text = '<%=Request.QueryString("p_room_allocate_pk") %>';
	var data = "<%=CtlLib.SetListDataSQL("SELECT A.* FROM (SELECT CODE, NAME FROM tco_commcode WHERE PARENT_CODE = 'FEES' and del_if=0 UNION SELECT 'ALL','SELECT ALL' FROM DUAL) A ORDER BY CODE")%>";
	lstServiceType.SetDataText(data);
	lstServiceType.value='ALL';
 }
 function BodyInit()
 {
	BindingData();
	OnSearch();
 }
 function OnSearch()
{
	data_htrm00010.Call("SELECT");
}
 
//=========================================================================
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
	var col_val = grdRFCUsing.GetGridData(event.row, 1 );
	
	if(grdRFCUsing.row > 0)
	{
	     if(CheckExist(grdRFCUsing.row) != true){
			grdRFCUsing2.AddRow();
			for(var i=0;i<grdRFCUsing.cols;i++)
			{
			  grdRFCUsing2.SetGridText(grdRFCUsing2.rows-1,i,grdRFCUsing.GetGridData(grdRFCUsing.row,i));
			}
		 }	
		 else{
			alert('This bill you already selected.');
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
function CheckExist(row){
   var pk = grdRFCUsing.GetGridData(row, 0 );
   var table_name = grdRFCUsing.GetGridData(row, 1 );
   
   for(var i=0;i<grdRFCUsing2.rows;i++)
	{
	  if(grdRFCUsing2.GetGridData(i,0)== pk && grdRFCUsing2.GetGridData(i,1) == table_name){
		return true;
	  }
	}
	return false;
}
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htrm00010" onreceive=""> 
        <xml>
           <dso  type="grid"   function="ht_sel_60250170_all_fees" >
                <input  bind="grdRFCUsing">
					<input bind="txt_room_allocate_pk" />
                    <input bind="lstServiceType" />
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
						    Services Type:
                        </td>
						<td style="width: 10%; white-space: nowrap">
                          <gw:list id="lstServiceType" onchange="OnSearch()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="center">
						    
                        </td>
						<td style="width: 5%" align="right"></td>
                        <td style="width: 10%" align="right"> </td>
                        <td style="width: 10%" align="right">
						<td style="width: 3%">
							   <gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelectGuestMst()" />
						 </td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:50%">
            <td>
                <gw:grid id='grdRFCUsing' 
				    header='_pk|_table_name|Invoice Date|Invoice#|Item|Amount(VND)|Ex_Rate|Amount(USD)'
                    format='0|0|4|0|0|-0|-0|-2' 
                    aligns='0|0|0|0|0|0|0|0'
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
		<tr style="height:40%">
            <td>
                <gw:grid id='grdRFCUsing2' 
				    header='_pk|_table_name|Invoice Date|Invoice#|Item|Amount(VND)|Ex_Rate|Amount(USD)'
                    format='0|0|4|0|0|-0|-0|-2' 
                    aligns='0|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T"
                    acceptnulldate="T" />
            </td>
        </tr>
    </table>
	<gw:textbox id="txt_room_allocate_pk" styles="display: none" />
    <!------------------------------------------------------------------>
</body>
</html>
