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
        
    var G1_PK           = 0,
        G1_DEPT_PK      = 1,
		G1_SEQ          = 2,
        G1_WH_PK 	    = 3,
		G1_REMARK   	= 4;

 //---------------------------------------------------------
 function BodyInit()
 {
      System.Translate(document);	 
	  
      txtDeptPK.text  =  "<%=Request.querystring("p_dept_pk")%>";
      
      //--------------  
      FormatGrid();
      //--------------
      OnSearch('grdDetail');
 }
 
//===============================================================================
 function FormatGrid()
 {
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT pk, wh_id || ' * ' || wh_name wh_name FROM tlg_in_warehouse WHERE del_if = 0 AND use_yn = 'Y' ORDER BY wh_name ASC" )%>|#;" ; 
    grdDetail.SetComboFormat(G1_WH_PK,data); 
 }
//===============================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_epbp00202_1.Call('SELECT');
            break;     
            
      }  
 }
//===============================================================================
 function OnAddNew(pos)
 {
      switch (pos)         
      {		                
        case 'grdDetail' :       
              
              grdDetail.AddRow();
              grdDetail.SetGridText( grdDetail.rows-1, G1_DEPT_PK, txtDeptPK.text);	 
        break;
        
      }  
 }
//===============================================================================
 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_epbp00202_1.Call();
            break;
                      
      }  
 }
//===============================================================================

 function OnDelete(pos)
 {
    switch(pos)
    {
        case 'grdDetail':
		    if ( grdDetail.GetGridData( grdDetail.row, G1_DEPT_PK ) == "" ) 
	        {						
				    grdDetail.RemoveRow();					
		    }			
		    
        break;
         
    }
 }
//===============================================================================

 function OnUnDelete(pos)
 {
    if(pos == "grdDetail")
    {
        grdDetail.UnDeleteRow();
    }
    
 }  
//===============================================================================
 function OnDataReceive(obj)
 {
        switch (obj.id)
        {
            case 'data_epbp00202_1':
                 
            break;
                      
        }
 }   
//===============================================================================
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_epbp00202_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid"  parameter="0,1,2,3,4" function="st_lg_SEL_EPBP00202_1"  procedure="st_lg_UPD_EPBP00202_1" > 
                <input> 
                    <input bind="txtDeptPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>    
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="left">
                
            </td>
            <td style="width: 100%" align="right">
                
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="new" alt="New" id="btnAddNew" onclick="OnAddNew('grdDetail')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="delete" alt="Delete" id="btnDelete" onclick="OnDelete('grdDetail')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="UnDelete" alt="Un Delete" id="btnUnDelete" onclick="OnUnDelete('grdDetail')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="save" alt="Save" id="btnSave" onclick="OnSave('grdDetail')" />
            </td>
        </tr>
        <tr style="height: 49%">
            <td colspan="10">
                <gw:grid id='grdDetail' header='_PK|_Dept_pk|Seq|Warehouse|Remark' 
				format='0|0|0|0|0' 
				aligns='0|0|0|0|0'
                check='||||' 
				editcol='0|0|1|1|1' 
				widths='0|0|800|2500|1500' 
				sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
        
    </table>
	<gw:textbox id="txtDeptPK" styles="width: 100%;display: none" />
</body>
</html>
