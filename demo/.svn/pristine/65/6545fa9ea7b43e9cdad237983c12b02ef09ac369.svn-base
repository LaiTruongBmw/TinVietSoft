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
   
    data_htrm00010.Call("SELECT");
 }
 function BodyInit()
 {
	txt_client_pk.text= "<%=Session("CLIENT_PK")%>" ;
	OnSearch();
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
   if(event.row < 1) return;
 
	var col_val = grdRFCUsing.GetGridData(event.row, 1 );
	
	if(grdRFCUsing.row != -1)
	{
		/*for(var j=2;j<=grdRFCUsing.rows;j++)
		{*/
			grdRFCUsing2.AddRow();
			for(var i=0;i<grdRFCUsing.cols;i++)
			{
			  grdRFCUsing2.SetGridText(grdRFCUsing2.rows-1,i,grdRFCUsing.GetGridData(grdRFCUsing.row,i));
			}
		//}
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
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_htrm00010" onreceive=""> 
        <xml>
           <dso  type="grid"   function="ac_sel_60100100_popup" >
                <input  bind="grdRFCUsing">
                    <input bind="txtUserID_Employee_Name" />
					<input bind="txt_client_pk" />
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
						    User ID/Employee
                        </td>
						<td style="width: 10%; white-space: nowrap">
                            <gw:textbox id="txtUserID_Employee_Name" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="center">
						    
                        </td>
						<td style="width: 5%" align="right"></td>
                        <td style="width: 10%" align="right"> </td>
                        <td style="width: 10%" align="right">
						<td style="width: 3%">
							  
						 </td>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height:40%">
            <td>
                <gw:grid id='grdRFCUsing' 
				    header='_EMPLOYEE_PK|Employee ID|Employee Name|_User_PK|User ID|Tel|Mobile|Living Address'
                    format='0|0|0|0|0|0|0|0' 
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
		<tr style="height:50%">
            <td>
                <gw:grid id='grdRFCUsing2' 
				    header='_EMPLOYEE_PK|Employee ID|Employee Name|_User_PK|User ID|Tel|Mobile|Living Address'
                    format='0|0|0|0|0|0|0|0' 
                    aligns='0|0|0|0|0|0|0|0'
                    sorting='T' styles='width:100%; height:100%' autosize="T"
                    acceptnulldate="T" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
	<gw:textbox id="txt_client_pk" style="display:none"/>
</body>
</html>
