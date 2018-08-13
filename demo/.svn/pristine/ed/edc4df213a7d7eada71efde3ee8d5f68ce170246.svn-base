<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Department</title>
</head>

<script>

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_code  = "<%=Session("USER_ID")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;       
        
    var G1_Company          = 0,
        G1_PK               = 1,
        G1_Code             = 2,
        G1_Name             = 3,
        G1_Remark           = 4;

 //==========================================================================================
 function BodyInit()
 {
      System.Translate(document);
     
      //--------------  
      FormatGrid();
      //--------------
      OnSearch('grdDetail');
 }
 
 //==========================================================================================
 function FormatGrid()
 {
    
    data = "<%=CtlLib.SetListDataSQL("select pk, partner_name from  TCO_COMPANY where DEL_IF = 0 ")%>||Select ALL";
    lstCompany.SetDataText(data);  
    lstCompany.value="";
 }
 
 //==========================================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                fpab00580.Call("SELECT");
            break;     
      }  
 }  
 
 //==========================================================================================
 function OnSelect(oGrid)
 {
     var arr_data = new Array();
   
     if ( oGrid.rows > 1 )
     {   
	 	  //-------------------------------------
	      for ( var i=1; i<oGrid.rows; i++ )
	      {
		  	 	if ( oGrid.GetGridControl().isSelected(i) == true ) 
			 	{
	         		var arrTemp=new Array();
	         
	         		for( var j=0; j<oGrid.cols; j++ )
	         		{
	            		arrTemp[arrTemp.length]= oGrid.GetGridData(i,j);
	         		}
	         
	         		arr_data[arr_data.length]= arrTemp;
			  	}		
	      }
       	  //-------------------------------------
		  if ( arr_data !=null )
		  {
			window.returnValue =  arr_data;
			window.close();
		  }
		  else
		  {
		    alert("You have not selected data yet.");
		  }
		  //-------------------------------------
   	 }	  
 }  
 
 //==========================================================================================
 function OnDataReceive(obj)
 {
        switch (obj.id)
        {
            case 'fpab00580':
                if (grdDetail.rows>1)
                {
                    grdDetail.SetCellBold( 1, G1_Code, grdDetail.rows - 1, G1_Code, true);
                }
            break;
        }
 }  
 
 //==========================================================================================
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="fpab00580" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" parameter="0,1,2,3,4" function="st_lg_sel_fpab00580"  procedure="st_lg_upd_fpab00580" > 
                <input> 
                    <input bind="txtDept" /> 
                    <input bind="lstCompany" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td style="width: 10%" align="right">
                Company
            </td>
            <td style="width: 40%" align="right">
                <gw:list id="lstCompany" styles="width:100%;" />
            </td>
            <td style="width: 10%" align="right">
                Dept
            </td>
            <td style="width: 30%" align="right">
                <gw:textbox id="txtDept" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
            </td>
            <td style="width: 8%" align="right">
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="search" alt="Search" id="btnSearch" onclick="OnSearch('grdDetail')" />
            </td>           
            <td style="width: 1%" align="right">
                <gw:button img="select" alt="Select" id="btnSelect" onclick="OnSelect(grdDetail)" />
            </td>             
        </tr>
        <tr style="height: 98%">
            <td colspan="11">
                <gw:grid id="grdDetail" header="Company|_PK|Dept Code|Dept Name|Remark"
                    format='0|0|0|0|0' aligns='0|0|0|0|0' defaults='||||' editcol="0|0|0|0|0"
                    widths='2000|0|1200|3500|1600' styles="width:100%; height:100%"
                    sorting="T" />
            </td>
        </tr>
    </table>
    <!------------------------------------------->
</body>
</html>
