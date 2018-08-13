<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Budget Type Entry</title>
</head>

<script>

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_code  = "<%=Session("USER_ID")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;       
        
    var G1_BUDGET_PK    = 0,
		G1_SEQ          = 1,        
        G1_BUDGET_ID    = 2,
        G1_BUDGET_NAME  = 3,		 
		G1_REMARK       = 4;

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
     
 }
 
//===============================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_epbp00290.Call("SELECT");
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
			  			              
        break;
      }  
 }
 
//===============================================================================

 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 'grdDetail' :
                data_epbp00290.Call();
            break;
      }  

 }

//===============================================================================

 function OnDelete()
 {
		if ( grdDetail.GetGridData( grdDetail.row, G1_BUDGET_PK ) == "" ) 
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
 function OnDataReceive(obj)
 {
        switch (obj.id)
        {
            case 'data_epbp00290':
                if (grdDetail.rows > 1)
                {
                    grdDetail.SetCellBold( 1, G1_BUDGET_ID, grdDetail.rows - 1, G1_BUDGET_ID, true);
					
					grdDetail.SetCellBgColor( 1, G1_BUDGET_ID, grdDetail.rows - 1, G1_BUDGET_NAME, 0xCCFFFF );
                }
            break;
        }
 }   
//===============================================================================
 
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_epbp00290" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid"  parameter="0,1,2,3,4" function="st_lg_sel_epbp00290"  procedure="st_lg_upd_epbp00290" > 
                <input> 
                    <input bind="txtType" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 2%">             
            <td style="width: 10%" align="right">
                Type
            </td>
            <td style="width: 30%" align="right">
                <gw:textbox id="txtType" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
            </td>
            <td style="width: 55%" align="right">
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
        </tr>
        <tr style="height: 98%">
            <td colspan="11">
                <gw:grid id="grdDetail" header="_PK|Seq|Type Code|Type Name|Remark"
                    format='0|0|0|0|0' 
					aligns='1|0|0|0|0' 
					defaults='||||' 
					editcol="0|1|1|1|1"
                    widths='0|800|2000|3500|1000' styles="width:100%; height:100%"
                    sorting="T"  />
            </td>
        </tr>
    </table>
    <!------------------------------------------->
</body>
</html>
