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
        
	var G_PK        = 0,
    	G_DATE      = 1,
		G_DEPR_ID	= 2,
    	G_USE_YN    = 3,
    	G_DESC      = 4;		

 //==========================================================================================
 function BodyInit()
 {
      System.Translate(document);
      
	  dtFrom.SetDataText(System.AddDate(dtTo.GetData(), -90));
      //--------------  
      FormatGrid();
      //--------------
      OnSearch('grdDetail');
 }
 
 //==========================================================================================
 function FormatGrid()
 {
 
 }
 
 //==========================================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_fpab00600.Call("SELECT");
            break;     
      }  
 }
 
 //==========================================================================================
 function OnCellDoubleClick(pos)
 {
      switch (pos)         
      {		      
	       case 'grdDetail' :
	            var code_data = new Array();       
	    
	            if ( grdDetail.row > 0 )
	            {
                    for( j=0 ; j<grdDetail.cols ; j++ )
                    {
                        code_data[j] = grdDetail.GetGridData(grdDetail.row , j );
                    } 
	            }
	            else
	            {
                    for( j=0 ; j<grdDetail.cols ; j++ )
                    {
                        code_data[j] = '';
                    } 	    
	            }
	            //----------------------------
	            window.returnValue = code_data; 
	            this.close(); 
            break;
       }     
 }  
 
 //==========================================================================================
 function OnDataReceive(obj)
 {
        switch (obj.id)
        {
            case 'fpab00600':
                if (grdDetail.rows>1)
                {
                    grdDetail.SetCellBold( 1, G_DEPR_ID, grdDetail.rows - 1, G_DEPR_ID, true);
                }
            break;
        }
 }  
 //===========================================================================================
 function OnCancel()
 {
    var code_data=new Array()
    
    for( j=0 ; j < grdDetail.cols ; j++ )
    {
        code_data[j] = '' ;
    } 
	    
    window.returnValue = code_data; 
    this.close();
 } 
 //==========================================================================================
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00600" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" parameter="0,1,2,3,4" function="st_lg_sel_fpab00600"  > 
                <input> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td style="width:5%">
				Date
			</td>
            <td style="width:25%;white-space:nowrap">
				<gw:datebox id="dtFrom" lang="1" width="10%" /> 
				~ 
				<gw:datebox id="dtTo" lang="1" width="10%" />
			</td>
			<td style="width:68%">				 
			</td>
            <td style="width: 1%" align="right">
                <gw:button img="search" alt="Search" id="btnSearch" onclick="OnSearch('grdDetail')" />
            </td>             
            <td style="width: 1%" align="right">
                <gw:button img="cancel" alt="Cancel" id="btnCancel" onclick="OnCancel()" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="11">
				<gw:grid id='grdDetail'
                header='_PK|Date|Depr ID|_Use|Remark'
                format='0|4|0|3|0'
                aligns='0|0|1|0|0'
                check='||||'
                editcol='0|0|0|0|0'
                widths='0|1200|1500|800|1500'
                sorting='T'
                styles='width:100%; height:100%'
				oncelldblclick="OnCellDoubleClick('grdDetail')" 
                />				 
            </td>
        </tr>
    </table>
    <!------------------------------------------->
</body>
</html>
