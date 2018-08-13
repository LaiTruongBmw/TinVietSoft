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
        
    var G1_SEQ        = 0,
        G1_DEPT_PK    = 1,
        G1_DEPT_ID    = 2,
        G1_DEPT_NAME  = 3,
		G1_COMP_PK    = 4,        
        G1_EXP_PK     = 5,
        G1_EXP_ACC    = 6,
        G1_REV_PK     = 7,
        G1_REV_ACC    = 8,
        G1_DEPR_PK    = 9,
        G1_DEPR_ACC   = 10,
        G1_PL_PK      = 11,
        G1_PL_NM      = 12,
		G1_COST_PK    = 13,
		G1_COST_NM    = 14,
		G1_PARENT_PK  = 15,
		G1_PARENT_ID  = 16,
        G1_WH_PK      = 17,
        G1_PMS_YN     = 18,
		G1_REMARK     = 19;

 //---------------------------------------------------------
 function BodyInit()
 {
      System.Translate(document);
     
      //--------------  
      FormatGrid();
      //--------------
      OnSearch('grdDetail');
 }
 
//===============================================================================
 function FormatGrid()
 {
    var data = "<%=CtlLib.SetGridColumnDataSQL(" SELECT   w.pk, w.partner_name FROM tco_company w WHERE w.del_if = 0 ORDER BY w.partner_id" )%>" ; 
    grdDetail.SetComboFormat(G1_COMP_PK,data); 

    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT pk, wh_id || ' * ' || wh_name wh_name FROM tlg_in_warehouse WHERE del_if = 0 AND use_yn = 'Y' ORDER BY wh_name ASC" )%>|#;" ; 
    grdDetail.SetComboFormat(G1_WH_PK,data); 

    data = "<%=CtlLib.SetListDataSQL("select pk, partner_name from TCO_COMPANY where DEL_IF = 0 ")%>||Select ALL";
    lstCompany.SetDataText(data);  
    lstCompany.value="";
 }
 
//===============================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_epbp00200.Call("SELECT");
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
			  
			  grdDetail.SetGridText( grdDetail.rows-1, G1_COMP_PK, lstCompany.value );	           
        break;
      }  
 }
 
//===============================================================================

 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_epbp00200.Call();
            break;
      }  

 }

//===============================================================================

 function OnDelete()
 {
		if ( grdDetail.GetGridData( grdDetail.row, G1_DEPT_PK ) == "" ) 
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
 
//===============================================================================

 function OnUnDelete()
 {
        grdDetail.UnDeleteRow();
 }
 
//===============================================================================
 function CheckInput()
 {   
//    var col, row ;
//    var dQuantity, dVolume , dLength, dWidth, dHeight ;
//    //-------------
//    col = event.col ;
//    row = event.row ;  
//    //-------------  
//  
//    if ( col == G1_Length || col == G1_Width || col == G1_Height )
//    {  
//        //------------------------
//        dQuantity = grdDetail.GetGridData( row, col) ;               
//        Number(dQuantity)?grdDetail.SetGridText( row, col, parseFloat(dQuantity+"").toFixed(2) ):grdDetail.SetGridText( row, col, 0); 
//        //------------------------
//        dLength   = grdDetail.GetGridData( row, G1_Length) ;
//        dWidth    = grdDetail.GetGridData( row, G1_Width) ;
//        dHeight   = grdDetail.GetGridData( row, G1_Height) ;
//        
//        dVolume   = dLength * dWidth * dHeight ;
//        
//        grdDetail.SetGridText( row, G1_Volume, parseFloat(dVolume+"").toFixed(2) );
//        //------------------------
//    }   
//    else if ( col == G1_Weight || col == G1_Thickness )
//    {
//        dQuantity =  grdDetail.GetGridData( row, col) ;               
//        Number(dQuantity)?grdDetail.SetGridText( row, col, parseFloat(dQuantity+"").toFixed(2) ):grdDetail.SetGridText( row, col, 0); 
//    } 
//    else if ( col == G1_Volume )
//    {
//        dQuantity =  grdDetail.GetGridData( row, col) ;               
//        Number(dQuantity)?grdDetail.SetGridText( row, col, parseFloat(dQuantity+"").toFixed(3) ):grdDetail.SetGridText( row, col, 0); 
//    }     
 }
  
//===============================================================================
 function OnCellDoubleClick(pos)
 {
      switch (pos)         
      {		      
	       case 'grdDetail' :
	             var row  = event.row;
	             var col  = event.col;
                 if (col == G1_EXP_ACC &&  row != 0 )
                 {
                       var fpath = System.RootURL + '/standard/formsfp/ab/fpab00490.aspx';
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
                        
                        if ( aValue != null )
                        {      
                            grdDetail.SetGridText(row,G1_EXP_PK,aValue[0]); 
                            grdDetail.SetGridText(row,G1_EXP_ACC,aValue[2]); 
                        }		               
                 }
                 else if (col == G1_REV_ACC &&  row != 0 )
                 {
                       var fpath = System.RootURL + '/standard/formsfp/ab/fpab00490.aspx';
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
                        
                        if ( aValue != null )
                        {      
                            grdDetail.SetGridText(row,G1_REV_PK,aValue[0]); 
                            grdDetail.SetGridText(row,G1_REV_ACC,aValue[2]); 
                        }		               
                 }
                 else if (col == G1_DEPR_ACC &&  row != 0 )
                 {
                       var fpath = System.RootURL + '/standard/formsfp/ab/fpab00490.aspx';
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
                        
                        if ( aValue != null )
                        {      
                            grdDetail.SetGridText(row,G1_DEPR_PK,aValue[0]); 
                            grdDetail.SetGridText(row,G1_DEPR_ACC,aValue[2]); 
                        }		               
                 }
                 else if (col == G1_PL_NM &&  row != 0 )
                 {
                       var fpath = System.RootURL + '/standard/formsfp/ab/fpab00560.aspx';
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
                        
                        if ( aValue != null )
                        {      
                            grdDetail.SetGridText(row,G1_PL_PK,aValue[6]); 
                            grdDetail.SetGridText(row,G1_PL_NM,aValue[5]); 
                        }		               
                 }
				 else if (col == G1_COST_NM &&  row != 0 )
                 {
                       var fpath = System.RootURL + '/standard/formsfp/ab/fpab00380.aspx';
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
                        
                        if ( aValue != null )
                        {      
                            grdDetail.SetGridText(row,G1_COST_PK,aValue[6]); 
                            grdDetail.SetGridText(row,G1_COST_NM,aValue[5]); 
                        }		               
                 }
                 else if((col == G1_DEPT_ID || col == G1_DEPT_NAME) && row != 0)
                 {
                       var fpath = System.RootURL + '/standard/formsep/bp/epbp00201.aspx?p_dept_pk=' + grdDetail.GetGridData( row, G1_DEPT_PK) + '&p_dept_name=' + grdDetail.GetGridData( row, G1_DEPT_NAME);
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
                 }
                 else if(col == G1_PARENT_ID && row != 0)
                 {
                       var fpath = System.RootURL + '/standard/formsfp/ab/fpab00550.aspx';
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');  
                        if ( aValue != null )
                        {
                            grdDetail.SetGridText(row, G1_PARENT_PK, aValue[1]);
                            grdDetail.SetGridText(row, G1_PARENT_ID, aValue[2]);
                        }                  
                 }
				 else if(col == G1_WH_PK && row != 0)
                 {
                       var fpath = System.RootURL + '/standard/formsep/bp/epbp00202.aspx?p_dept_pk=' + grdDetail.GetGridData( row, G1_DEPT_PK) ;
                       var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');                                          
                 }
            break;
       }     
 }  
 
//===============================================================================
 function OnDataReceive(obj)
 {
        switch (obj.id)
        {
            case 'data_epbp00200':
                if (grdDetail.rows > 1)
                {
                    grdDetail.SetCellBold( 1, G1_DEPT_ID, grdDetail.rows - 1, G1_DEPT_ID, true);
					
					grdDetail.SetCellBgColor( 1, G1_DEPT_ID, grdDetail.rows - 1, G1_DEPT_NAME, 0xCCFFFF );
                }
            break;
        }
 }   
//===============================================================================
function OnReport()
{
	var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00200.aspx"; 
	System.OpenTargetPage(url); 
}
//===============================================================================
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_epbp00200" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="st_lg_sel_epbp00200"  procedure="st_lg_upd_epbp00200" > 
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
            <td style="width: 30%" align="right">
                <gw:list id="lstCompany" styles="width:100%;" />
            </td>
            <td style="width: 10%" align="right">
                Department
            </td>
            <td style="width: 30%" align="right">
                <gw:textbox id="txtDept" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
            </td>
            <td style="width: 15%" align="right">
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
                <gw:button img="UnDelete" alt="Un Delete" id="btnUnDelete" onclick="OnUnDelete()" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button img="save" alt="Save" id="btnSave" onclick="OnSave('grdDetail')" />
            </td>
			<td style="width: 1%" align="right">
				<gw:button img="excel" alt="Report" id="btnReport" onclick="OnReport()" />   
			</td>
        </tr>
        <tr style="height: 98%">
            <td colspan="11">
                <gw:grid id="grdDetail" header="Seq|_PK|Dept Code|Dept Name|Company|_Expense PK|Expense ACC|_Revenue PK|Revenue ACC|_Depr PK|Depr ACC|_PL PK|P/L|_COST_PK|C/Center|_Parent PK|Parent Dept|Warehouse|PMS Y/N|Remark"
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|2|3|0' 
					aligns='1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					defaults='|||||||||||||||||||' 
					editcol="1|0|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths='800|0|2000|3500|1500|0|2000|0|2000|0|2000|0|2000|0|2000|0|2000|2000|1000|1000' styles="width:100%; height:100%"
                    sorting="T" onafteredit="CheckInput()" oncelldblclick="OnCellDoubleClick('grdDetail')" />
            </td>
        </tr>
    </table>
    <!------------------------------------------->
</body>
</html>
