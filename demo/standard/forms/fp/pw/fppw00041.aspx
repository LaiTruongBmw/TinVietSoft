<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Process W/I List</title>
</head>

<script>

    var user_pk   = "<%=Session("EMPLOYEE_PK")%>" 
    var user_name = "<%=Session("USER_NAME")%>" 
    
    var flag = 0 ;
    
    var G1_MASTER_PK	= 0,
		G1_CLOSE_YN     = 1,
        G1_LINE    		= 2,
        G1_PO_NO      	= 3, 
        G1_STYLE_CODE   = 4,
        G1_STYLE_NAME   = 5,  
        G1_WI_QTY       = 6,
		G1_SPEC			= 7,	
		G1_DESC		    = 8; 
//================================================================

 function BodyInit()
 {
    System.Translate(document);
      //----------------------------- 
      FormatGrid();
	  
	  data_fppw00041.Call("SELECT");
           
 }
//================================================================

 function FormatGrid()
 { 
      var trl;   
      //-------------------------------------------------
      trl = grdDetail.GetGridControl();	
      trl.ColFormat(G1_WI_QTY) = "###,###,###,###,###";

      //-------------------------------------------------
      
      data = "<%=ESysLib.SetListDataSQL("SELECT   pk, GROUP_ID || ' - ' || group_name  FROM prod.pb_line_group WHERE del_if = 0 ORDER BY GROUP_ID ") %>||Select ALL" ;    
      lstLineGroup.SetDataText(data); 
      lstLineGroup.value = '' ;
      //-------------------------------------------------               
 }        
 
//=======================================================================
 function OnSearch(pos)
 {
	data_fppw00041.Call('SELECT');
 }
 
//========================================================================
 function OnDataReceive(obj)
 { 
      switch (obj.id)         
      {		            			                                 
            case "data_fppw00041" :
	            if ( grdDetail.rows > 1 )
	            {
	                grdDetail.SetCellBgColor( 1, G1_PO_NO, grdDetail.rows - 1, G1_PO_NO, 0xCCFFFF );
					
	                grdDetail.SetCellBold( 1, G1_STYLE_CODE, grdDetail.rows-1, G1_STYLE_CODE, true);
					grdDetail.SetCellBold( 1, G1_LINE,       grdDetail.rows-1, G1_LINE,       true);
					grdDetail.SetCellBold( 1, G1_WI_QTY,     grdDetail.rows-1, G1_WI_QTY,     true);
					
					grdDetail.Subtotal( 0, 2, -1, '6','###,###,###');
	            }        
            break;             
      }  
 }

//==========================================================================

 function CheckInput(obj)
 { 
    var  row, col;
   
    switch (obj.id)
    {
        case 'grdDetail':
            row = event.row ;
            col = event.col ;    
            
            if ( col == G1_WI_QTY )
            {
                var dQuantiy;
                
                dQuantiy =  grdDetail.GetGridData(row,col)
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {
                        grdDetail.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(0));
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdDetail.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdDetail.SetGridText(row,col,"")
                }                
            }         
        break;		 
    }        
 }
//=========================================================================

function OnSave()
{
	data_fppw00041.Call();
}
//=========================================================================

 function OnUnDelete() 
 {
		grdDetail.UnDeleteRow();
 }
//=========================================================================
 
 function OnDelete()
 {
      	grdDetail.DeleteRow();  	        
 }
//=========================================================================


</script>

<body>
	 <!------------------------------------------------------------------>
    <gw:data id="data_fppw00041" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8" function="<%=l_user%>lg_sel_fppw00041" procedure="<%=l_user%>lg_upd_fppw00041" > 
			    <input bind="grdDetail" >	
					<input bind="lstLineGroup" />
					<input bind="txtStylePO" />
			    </input> 
			    <output bind="grdDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 1%">                                  
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Line Grp</td>
                                    <td style="width: 30%; white-space: nowrap">
                                        <gw:list id="lstLineGroup" styles='width:100%' csstype="mandatory" onchange="OnSearch()" />
                                    </td>
									<td style="width: 5%" align="right">
                                        Style/PO
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtStylePO" styles='width:100%' onenterkey="OnSearch()"/>
                                    </td>									                                                      
									<td style="width: 26%" align="right">										
            						</td>
									<td style="width: 1%" align='right'>
                                        <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
                                    </td>
									<td style="width: 1%" align="right">
                                        <gw:imgbtn img="delete" alt="Delete" id="btnDel" onclick="OnDelete()" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="udelete" alt="UnDelete" id="btnUnDel" onclick="OnUnDelete()" />
                                    </td>									
            						<td align="right" style="width: 1%">
                						<gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" />
            						</td>									
                                </tr>   
			 					<tr style="height: 99%">
			                        <td colspan=9>
			                            <gw:grid id='grdDetail' 
											header='_PK|Close|Line|P/O No|Style Code|Style Name|W/I Qty|Spec|_Description'
			                                format='0|3|0|0|0|0|0|0|0' 
											aligns='0|1|0|0|0|0|3|1|0'
											defaults='||||||||'
			                                editcol='0|1|0|0|0|0|1|0|1' 
											widths='0|800|1200|1500|2000|2000|1500|1500|0'
			                                sorting='T' styles='width:100%; height:100%' 
											onafteredit="CheckInput(this)" />
			                        </td>
			                    </tr>								                             
                            </table>
           
	<!------------------------------------------------------------------> 	
</body>
</html>
