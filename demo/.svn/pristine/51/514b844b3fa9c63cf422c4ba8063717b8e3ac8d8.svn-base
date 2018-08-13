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
    var data = "<%=CtlLib.SetGridColumnDataSQL(" SELECT   w.pk, w.partner_name FROM  tco_company w WHERE w.del_if = 0 ORDER BY w.partner_id" )%>" ; 
    grdDetail.SetComboFormat(G1_Company,data); 

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
                fpab00550.Call("SELECT");
            break;     
      }  
 }

 //==========================================================================================
 function OnAddNew(pos)
 {
      switch (pos)         
      {		                
        case 'grdDetail' :       
             
              grdDetail.AddRow();	 	           
        break;
      }  
 }
 
 //==========================================================================================

 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                fpab00550.Call();
            break;
      }  

 }

 //==========================================================================================

 function OnDelete()
 {
		if ( grdDetail.GetGridData( grdDetail.row, G1_PK ) == "" ) 
	    {						
				grdDetail.RemoveRow();					
		}			
		else 
		{
			if ( confirm( "Do you want to mark this row to delete?" ) ) 
			{
				grdDetail.DeleteRow();
			}
		}
 }
 
 //==========================================================================================

 function OnUnDelete()
 {
        grdDetail.UnDeleteRow();
 }
 
 //==========================================================================================
 function CheckInput()
 {   
 
 }
 
 //==========================================================================================
 
 function OnPopUp(pos)
{
    switch(pos)
    {
        case 'dept':
            var path = System.RootURL + '/form/ep/bp/epbp00021.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
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
            case 'fpab00550':
                if (grdDetail.rows>1)
                {
                    grdDetail.SetCellBold( 1, G1_Code, grdDetail.rows - 1, G1_Code, true);
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
    <gw:data id="fpab00550" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" parameter="0,1,2,3,4" function="st_lg_sel_fpab00550"  procedure="st_lg_upd_fpab00550" > 
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
                Department
            </td>
            <td style="width: 40%" align="right">
                <gw:textbox id="txtDept" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
            </td>
            <td style="width: 45%" align="right">
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="search" alt="Search" id="btnSearch" onclick="OnSearch('grdDetail')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="new" alt="New" id="btnAddNew" onclick="OnAddNew('grdDetail')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="udelete" alt="Un Delete" id="btnUnDelete" onclick="OnUnDelete()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="save" alt="Save" id="btnSave" onclick="OnSave('grdDetail')" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="cancel" alt="Cancel" id="btnCancel" onclick="OnCancel()" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="11">
                <gw:grid id="grdDetail" header="Company|_PK|Dept Code|Dept Name|Remark"
                    format='0|0|0|0|0' aligns='0|0|0|0|0' defaults='||||' editcol="0|0|1|1|1"
                    widths='2000|0|1200|3500|1600' styles="width:100%; height:100%"
                    sorting="T" oncelldblclick="OnCellDoubleClick('grdDetail')" />
            </td>
        </tr>
    </table>
    <!------------------------------------------->
</body>
</html>
