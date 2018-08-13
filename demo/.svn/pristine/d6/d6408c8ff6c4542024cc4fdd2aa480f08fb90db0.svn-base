<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>Reports S/W 2</title>
</head>
<script>

    var G1_PROD_DATE    = 0,
		G1_LINE_ID      = 1,
		G1_COMPONENT_ID = 2,
		G1_YARN         = 3, 
		G1_ITEM_NAME    = 4,
		G1_TG_TREO      = 5,
		G1_TG_NOI_SOI   = 6,
		G1_CARD_ID      = 7;
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
	  	
      /*trl.ColFormat(G1_WI_QTY)   = "###,###,###,###,###.##";
	  trl.ColFormat(G1_INPUT_M)  = "###,###,###,###,###.##";
	  trl.ColFormat(G1_INPUT_KG) = "###,###,###,###,###.##";*/
	  	  
      //-------------------------------------------------  
	 var data = "<%=ESysLib.SetListDataSQL("SELECT pk ,PROCESS_ID || ' * ' || process_name  FROM tlg_pb_process  WHERE del_if = 0  ORDER BY PROCESS_ID" )%>||Select All";    
     lstProcess.SetDataText(data);
     lstProcess.value = '';          
 }        
 
//=======================================================================
 function OnSearch(pos)
 {
		data_fpgm10020.Call('SELECT');
 }
 
//========================================================================
 function OnDataReceive(obj)
 { 
      switch (obj.id)         
      {		            			                                 
            case "data_fpgm10020" :
	            if ( grdDetail.rows > 1 )
	            {
					grdDetail.SetCellBold( 1, G1_ITEM, grdDetail.rows-1, G1_ITEM, true);					 
					//----------					
					/*grdDetail.SetCellBgColor( 1, G1_INPUT_M,  grdDetail.rows-1, G1_INPUT_M,     0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G1_MC,       grdDetail.rows-1, G1_OUTPUT_DATE, 0xFFFFCC ); 
										 
					grdDetail.GetGridControl().Cell( 7, 1, G1_OUTPUT_DATE, grdDetail.rows-1, G1_OUTPUT_DATE ) = 0x3300cc;	
					grdDetail.GetGridControl().Cell( 7, 1, G1_SIZ_DATE,    grdDetail.rows-1, G1_SIZ_DATE )    = 0x3300cc;		
					grdDetail.GetGridControl().Cell( 7, 1, G1_INPUT_DATE,  grdDetail.rows-1, G1_INPUT_DATE )  = 0x3300cc;		*/		 
					//----------
	            }        
            break;             
      }  
 }
 
//=========================================================================


</script>
<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpgm10020" onreceive="OnDataReceive(this)"> 
	    <xml> 
		    <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="<%=l_user%>lg_sel_fpgm10030" > 
			    <input bind="grdDetail" >	
					<input bind="lstProcess" />	
					<input bind="dtFrom" />	
					<input bind="dtTo" />							         
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
                <gw:datebox id="dtFrom" lang="1" width="10%" />
                ~
                <gw:datebox id="dtTo" lang="1" width="10%" />
            </td>
            <td align="right" style="width: 5%; white-space: nowrap">
                Process
            </td>
            <td style="width: 30%; white-space: nowrap">
                <gw:list id="lstProcess" styles="width:100%;" />
            </td>
            <td style="width: 29%" align='right'>
            </td>
            <td align="right" style="width: 1%">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="11">
                <gw:grid id='grdDetail' header='Prod Date|Line ID|Component ID|Yarn|Item Name|TG Treo|TG Noi Soi|Card ID'
                    format='4|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0' check='|||||||' editcol='1|1|1|1|1|1|1|1'
                    widths='1200|1500|1500|1100|2200|1300|1300|1000' sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
