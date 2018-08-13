<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Reports S/W 1</title>
</head>

<script>
     
    var G1_SLIP_NO		= 0,
		G1_DOC_DATE		= 1,
		G1_ITEM_CODE    = 2,
        G1_ITEM_NAME    = 3,       
		G1_MAT_QTY		= 4,
		G1_PROD_QTY		= 5,
        G1_REMAIN_QTY   = 6; 
//================================================================

 function BodyInit()
 {
      System.Translate(document);
      //----------------------------- 
      FormatGrid();    
	  
	  OnSearch('DETAIL');
 
 }
//================================================================

 function FormatGrid()
 { 
      var trl;   
      //-------------------------------------------------
      trl = grdDetail.GetGridControl();
	  	
      trl.ColFormat(G1_MAT_QTY)    = "###,###,###,###,###.##";
	  trl.ColFormat(G1_PROD_QTY)   = "###,###,###,###,###.##";
	  trl.ColFormat(G1_REMAIN_QTY) = "###,###,###,###,###.##";
	  	  
      //-------------------------------------------------  
	 var data = "<%=ESysLib.SetListDataSQL("SELECT pk ,line_id || ' - ' || line_name  FROM tlg_pb_line  WHERE del_if = 0  ORDER BY line_id" )%>||Select All";    
     lstLine.SetDataText(data);
     lstLine.value = '';          
 }        
 
//=======================================================================
 function OnSearch(pos)
 {
		data_fpgm10010.Call('SELECT');
 }
 
//========================================================================
 function OnDataReceive(obj)
 { 
      switch (obj.id)         
      {		            			                                 
            case "data_fpgm10010" :
	            if ( grdDetail.rows > 1 )
	            {
					grdDetail.SetCellBold( 1, G1_ITEM_CODE, grdDetail.rows-1, G1_ITEM_CODE, true);					 
					//----------
					
					grdDetail.SetCellBgColor( 1, G1_MAT_QTY,  grdDetail.rows-1, G1_MAT_QTY,  0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G1_PROD_QTY, grdDetail.rows-1, G1_PROD_QTY, 0xFFFFCC ); 
					
					grdDetail.GetGridControl().Cell( 7, 1, G1_REMAIN_QTY, grdDetail.rows-1, G1_REMAIN_QTY ) = 0x3300cc;					 
					//----------
	            }        
            break;             
      }  
 }
 
//=========================================================================


</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpgm10010" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="<%=l_user%>lg_sel_fpgm10010" > 
			    <input bind="grdDetail" >	
					<input bind="dtFrom" />	
					<input bind="dtTo" />	
					<input bind="lstLine" />		         
			    </input> 
			    <output bind="grdDetail" /> 
		    </dso> 
	    </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td align="right" style="width: 5%">
				Date
            </td>
            <td style="width: 30%; white-space: nowrap">
				<gw:datebox id="dtFrom" lang="1" width="10%" /> ~ <gw:datebox id="dtTo" lang="1" width="10%" />
            </td>
            <td align="right" style="width: 5%; white-space: nowrap">
				Line
            </td>
            <td style="width: 30%; white-space: nowrap">
				<gw:list id="lstLine" styles="width:100%;" />
            </td>            
            <td style="width: 29%" align='right'>                
            </td>             
            <td align="right" style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="11">
                <gw:grid id='grdDetail' 
					header='Slip No|Doc Date|Item Code|Item Name|Mat Qty|Prod Qty|Remain Qty'
                    format='0|4|0|0|0|0|0' 
					aligns='0|1|0|0|3|3|3' 
					defaults='||||||'
                    editcol='0|0|0|0|0|0|0' 
					widths='1500|1200|1500|2500|1500|1500|1500' sorting='T'
                    styles='width:100%; height:100%'  />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
