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
		G1_WI_DATE      = 1,
        G1_LINE    		= 2,
        G1_PO_NO      	= 3, 
        G1_STYLE_CODE   = 4,
        G1_STYLE_NAME   = 5,  
        G1_WI_QTY       = 6,
		G1_WI_NO		= 7; 
//================================================================

 function BodyInit()
 {
    System.Translate(document);
      //-----------------------------      
      dtWIFromDate.SetDataText(System.AddDate(dtWIToDate.GetData(),-30)); 
      //----------------------------- 
      FormatGrid();
	  
	  data_fppw00013.Call("SELECT");
           
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
	data_fppw00013.Call('SELECT');
 }
//======================================================================
function OnSelect(oGrid)
{
        var code_data = new Array();       
	    
	    if ( oGrid.row > 0 )
	    {
            for( j=0 ; j<oGrid.cols ; j++ )
            {
                code_data[j] = oGrid.GetGridData(oGrid.row , j );
            } 
	    }
	    else
	    {
            for( j=0 ; j<oGrid.cols ; j++ )
            {
                code_data[j] = '';
            } 	    
	    }
	    //----------------------------
	    window.returnValue = code_data; 
	    this.close(); 	
}
//======================================================================
function OnCancel(oGrid)
{
    var code_data=new Array()
    
    for( j=0 ; j < oGrid.cols ; j++ )
    {
        code_data[j] = '' ;
    } 
	    
    window.returnValue = code_data; 
    this.close(); 	
}
//========================================================================
 function OnDataReceive(obj)
 { 
      switch (obj.id)         
      {		            			                                 
            case "data_fppw00013" :
	            if ( grdDetail.rows > 1 )
	            {
	                grdDetail.SetCellBgColor( 1, G1_PO_NO, grdDetail.rows - 1, G1_PO_NO, 0xCCFFFF );
					
	                grdDetail.SetCellBold( 1, G1_STYLE_CODE, grdDetail.rows-1, G1_STYLE_CODE, true);
					grdDetail.SetCellBold( 1, G1_LINE,       grdDetail.rows-1, G1_LINE,       true);
					grdDetail.SetCellBold( 1, G1_WI_QTY,     grdDetail.rows-1, G1_WI_QTY,     true);
	            }        
            break;             
      }  
 }

//=========================================================================
</script>

<body>
	 <!------------------------------------------------------------------>
    <gw:data id="data_fppw00013" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid"  function="<%=l_user%>lg_sel_fppw00013"  > 
			    <input bind="grdDetail" >
					<input bind="dtWIFromDate" />
			        <input bind="dtWIToDate" />		
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
                                    <td align="right" style="width: 5%">
                                        Date</td>
                                    <td style="width: 30%; white-space: nowrap">
                                        <gw:datebox id="dtWIFromDate" lang="1" styles="width:80%" />
                                        ~
                                        <gw:datebox id="dtWIToDate" lang="1" styles="width:80%" />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Line Grp</td>
                                    <td style="width: 30%; white-space: nowrap">
                                        <gw:list id="lstLineGroup" styles='width:100%' csstype="mandatory" onchange="OnSearch()" />
                                    </td>
									<td style="width: 5%" align="right">
                                        Style/PO
                                    </td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtStylePO" styles='width:100%' onenterkey="OnSearch()"/>
                                    </td>
                                    <td style="width: 3%" align='right'>
                                        <gw:imgbtn id="btnSearch01" img="search" alt="Search W/I List" onclick="OnSearch()" />
                                    </td>
									<td style="width: 1%" align="right">
                						<gw:imgbtn id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel(grdDetail)" />
            						</td>
            						<td align="right" style="width: 1%">
                						<gw:imgbtn id="btnSelect" img="select" alt="Select" onclick="OnSelect(grdDetail)" />
            						</td>									
                                </tr>   
			 					<tr style="height: 99%">
			                        <td colspan=9>
			                            <gw:grid id='grdDetail' 
											header='_PK|Date|Line|P/O No|Style Code|Style Name|W/I Qty|W/I No'
			                                format='0|4|0|0|0|0|0|0' 
											aligns='0|1|0|0|0|0|3|0'
											defaults='|||||||'
			                                editcol='0|0|0|0|0|0|0|0' 
											widths='0|1200|1500|1500|2000|2000|1500|0'
			                                sorting='T' styles='width:100%; height:100%' 
											oncelldblclick="OnSelect(grdDetail)" />
			                        </td>
			                    </tr>								                             
                            </table>
           
	<!------------------------------------------------------------------> 	
</body>
</html>
