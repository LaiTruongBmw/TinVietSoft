<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>P/R CHECKING 2</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
 
    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
    
 var G1_ASSET        = 0,
     G1_MODEL        = 1,   
     G1_QTY_01       = 2,
	 G1_QTY_02       = 3,
     G1_QTY_03       = 4,
	 G1_QTY_04       = 5,
     G1_QTY_05       = 6,
	 G1_QTY_06       = 7,
     G1_QTY_07       = 8,
	 G1_QTY_08       = 9,
     G1_QTY_09       = 10,
	 G1_QTY_10       = 11,
     G1_QTY_11       = 12,
	 G1_QTY_12       = 13,
     G1_QTY_13       = 14,
	 G1_QTY_14       = 15,
     G1_QTY_15       = 16,
	 G1_QTY_16       = 17,
     G1_QTY_17       = 18,
	 G1_QTY_18       = 19,
     G1_QTY_19       = 20,
	 G1_QTY_20       = 21,
	 G1_QTY_21       = 22,
	 G1_QTY_22       = 23,
	 G1_QTY_23       = 24,
	 G1_QTY_24       = 25,
	 G1_QTY_25		 = 26;
   
 //=========================================================================
 function BodyInit()
 {
      System.Translate(document);	        
      //----------------------       
      OnFormatGrid();
      //----------------------
	  OnSearch('HEADER');  
 } 
  
 //=========================================================================
 function OnFormatGrid()
 {       
	  var ctr = grdDetail.GetGridControl(); 
      
	  ctr.FrozenCols = G1_QTY_01 ;
	  	 
      ctr.ColFormat(G1_QTY_01) = "#,###,###,###,###,###";     
	  ctr.ColFormat(G1_QTY_02) = "#,###,###,###,###,###";
	  ctr.ColFormat(G1_QTY_03) = "#,###,###,###,###,###";
	  ctr.ColFormat(G1_QTY_04) = "#,###,###,###,###,###";
	  ctr.ColFormat(G1_QTY_05) = "#,###,###,###,###,###";
	  ctr.ColFormat(G1_QTY_06) = "#,###,###,###,###,###";
	  ctr.ColFormat(G1_QTY_07) = "#,###,###,###,###,###";
	  ctr.ColFormat(G1_QTY_08) = "#,###,###,###,###,###";
	  ctr.ColFormat(G1_QTY_09) = "#,###,###,###,###,###";
	  ctr.ColFormat(G1_QTY_10) = "#,###,###,###,###,###";
	  ctr.ColFormat(G1_QTY_11) = "#,###,###,###,###,###";
	  ctr.ColFormat(G1_QTY_12) = "#,###,###,###,###,###";	
	  ctr.ColFormat(G1_QTY_13) = "#,###,###,###,###,###";	
	  ctr.ColFormat(G1_QTY_14) = "#,###,###,###,###,###";	
	  ctr.ColFormat(G1_QTY_15) = "#,###,###,###,###,###";	
	  ctr.ColFormat(G1_QTY_16) = "#,###,###,###,###,###";	
	  ctr.ColFormat(G1_QTY_17) = "#,###,###,###,###,###";	
	  ctr.ColFormat(G1_QTY_18) = "#,###,###,###,###,###";	
	  ctr.ColFormat(G1_QTY_19) = "#,###,###,###,###,###";	
	  ctr.ColFormat(G1_QTY_20) = "#,###,###,###,###,###";	
	  ctr.ColFormat(G1_QTY_21) = "#,###,###,###,###,###";	
	  ctr.ColFormat(G1_QTY_22) = "#,###,###,###,###,###";	
	  ctr.ColFormat(G1_QTY_23) = "#,###,###,###,###,###";	  
	  ctr.ColFormat(G1_QTY_24) = "#,###,###,###,###,###";	
	  ctr.ColFormat(G1_QTY_25) = "#,###,###,###,###,###";	
      //--------------------------------------------------------
      ctr.MergeCells  = 2 ;	
      ctr.MergeCol(0) = true ;	
      ctr.MergeCol(1) = true ;   	
      ctr.MergeCol(2) = true ;	
      ctr.MergeCol(3) = true ;	
           
      var data = "<%=ESysLib.SetListDataSQL("select pk, asset_Type_code || ' * ' || asset_type_name from tlg_ma_asset_type where del_if = 0 order by asset_Type_code  ") %>||";
      lstAssetType.SetDataText(data);   
      lstAssetType.value=""; 
	 
	  data = "<%=ESysLib.SetListDataSQL("select pk, grp_code || ' * ' || grp_name from tlg_ma_asset_group where del_if = 0 order by grp_code  ") %>||";
      lstAssetGroup.SetDataText(data);   
      lstAssetGroup.value="";    
 }
//=========================================================================
 function OnSearch(pos)
 {
 		switch(pos)
		{
			case 'DETAIL' :
				data_fpma00330_1.Call("SELECT");
			break;
			
			case 'HEADER' :
				pro_fpma00330.Call();
			break;
		}        	    	   		                           
 }

//=========================================================================
function OnDataReceive(po_oData)
{
      switch (po_oData.id)         
      {		        
            case 'data_fpma00330_1' :                             				 
                if ( grdDetail.rows > 1 )
                {
                     
					grdDetail.SetCellBgColor( 2, G1_QTY_01, grdDetail.rows - 1, G1_QTY_01, 0xFFFFCC );
					grdDetail.SetCellBgColor( 2, G1_QTY_03, grdDetail.rows - 1, G1_QTY_03, 0xFFFFCC );
					grdDetail.SetCellBgColor( 2, G1_QTY_05, grdDetail.rows - 1, G1_QTY_05, 0xFFFFCC );
					grdDetail.SetCellBgColor( 2, G1_QTY_07, grdDetail.rows - 1, G1_QTY_07, 0xFFFFCC );
					grdDetail.SetCellBgColor( 2, G1_QTY_09, grdDetail.rows - 1, G1_QTY_09, 0xFFFFCC );
					grdDetail.SetCellBgColor( 2, G1_QTY_11, grdDetail.rows - 1, G1_QTY_11, 0xFFFFCC );		
					grdDetail.SetCellBgColor( 2, G1_QTY_13, grdDetail.rows - 1, G1_QTY_13, 0xFFFFCC );	
					grdDetail.SetCellBgColor( 2, G1_QTY_15, grdDetail.rows - 1, G1_QTY_15, 0xFFFFCC );	
					grdDetail.SetCellBgColor( 2, G1_QTY_17, grdDetail.rows - 1, G1_QTY_17, 0xFFFFCC );	
					grdDetail.SetCellBgColor( 2, G1_QTY_19, grdDetail.rows - 1, G1_QTY_19, 0xFFFFCC );	
					grdDetail.SetCellBgColor( 2, G1_QTY_21, grdDetail.rows - 1, G1_QTY_21, 0xFFFFCC );	
					grdDetail.SetCellBgColor( 2, G1_QTY_23, grdDetail.rows - 1, G1_QTY_23, 0xFFFFCC );				
					
					grdDetail.Subtotal( 1, 2,-1, '2!3!4!5!6!7!8!9!10!11!12!13!14!15!16!17!18!19!20!21!22!23!24!25!26');
                }                 
            break; 
			
			case 'pro_fpma00330' :
								
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_01, 0, G1_QTY_01 ) = txtDept01.text; 
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_02, 0, G1_QTY_02 ) = txtDept02.text; 
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_03, 0, G1_QTY_03 ) = txtDept03.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_04, 0, G1_QTY_04 ) = txtDept04.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_05, 0, G1_QTY_05 ) = txtDept05.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_06, 0, G1_QTY_06 ) = txtDept06.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_07, 0, G1_QTY_07 ) = txtDept07.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_08, 0, G1_QTY_08 ) = txtDept08.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_09, 0, G1_QTY_09 ) = txtDept09.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_10, 0, G1_QTY_10 ) = txtDept10.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_11, 0, G1_QTY_11 ) = txtDept11.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_12, 0, G1_QTY_12 ) = txtDept12.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_13, 0, G1_QTY_13 ) = txtDept13.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_14, 0, G1_QTY_14 ) = txtDept14.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_15, 0, G1_QTY_15 ) = txtDept15.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_16, 0, G1_QTY_16 ) = txtDept16.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_17, 0, G1_QTY_17 ) = txtDept17.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_18, 0, G1_QTY_18 ) = txtDept18.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_19, 0, G1_QTY_19 ) = txtDept19.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_20, 0, G1_QTY_20 ) = txtDept20.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_21, 0, G1_QTY_21 ) = txtDept21.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_22, 0, G1_QTY_22 ) = txtDept22.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_23, 0, G1_QTY_23 ) = txtDept23.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_24, 0, G1_QTY_24 ) = txtDept24.text;
				grdDetail.GetGridControl().Cell(0, 0, G1_QTY_25, 0, G1_QTY_25 ) = txtDept25.text;
				
			break;                
      }      
}            
  
//========================================================================= 
function OnPopUp(pos)
{
	switch(pos)
	{		 
		case 'Report':
		    var path = System.RootURL + '/form/ep/bp/epbp00273.aspx';
            var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
		break;
	}
}
//========================================================================= 
function OnReport()
{
    var url  =System.RootURL + "/reports/fp/ma/rpt_fpma00330.aspx?p_tlg_ma_asset_type_pk="+ lstAssetType.value; 
        url += "&p_tlg_ma_asset_group_pk=" + lstAssetGroup.value + "&p_asset=" + txtAsset.text ;
        url += "&p_type=" + lstAssetType.GetText() + "&p_group=" + lstAssetGroup.GetText();
    System.OpenTargetPage(url);        
}
//========================================================================= 
</script>

<body>     
	<!------------------------------------------------------------------>
    <gw:data id="pro_fpma00330" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="<%=l_user%>lg_pro_fpma00330" > 
                <input> 
                    <input bind="txtDept01" />
                </input>
	           <output>
	                <output bind="txtDept01" /> 
					<output bind="txtDept02" />
					<output bind="txtDept03" />
					<output bind="txtDept04" />
					<output bind="txtDept05" />
					<output bind="txtDept06" />
					<output bind="txtDept07" />
					<output bind="txtDept08" />
					<output bind="txtDept09" />
					<output bind="txtDept10" />
					<output bind="txtDept11" />
					<output bind="txtDept12" />
					<output bind="txtDept13" />
					<output bind="txtDept14" />
					<output bind="txtDept15" />
					<output bind="txtDept16" />
					<output bind="txtDept17" />
					<output bind="txtDept18" />
					<output bind="txtDept19" />
					<output bind="txtDept20" />
					<output bind="txtDept21" />
					<output bind="txtDept22" />
					<output bind="txtDept23" />
					<output bind="txtDept24" />
					<output bind="txtDept25" />
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="data_fpma00330_1" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid"   function="<%=l_user%>lg_sel_fpma00330_1" >
                <input  bind="grdDetail">
					<input bind="lstAssetType" />
                    <input bind="lstAssetGroup" />
                    <input bind="txtAsset" />                    
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>     
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 5%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
						<td align="right" style="width: 5%; white-space: nowrap">
							Type
						</td>
						<td style="width: 25%" align="right">
                            <gw:list id="lstAssetType" styles="width: 100%" onchange="OnSearch('DETAIL')" />
                        </td>  
                        <td align="right" style="width: 5%; white-space: nowrap">
							Group
						</td>
						<td style="width: 25%" align="right">
                            <gw:list id="lstAssetGroup" styles="width: 100%" onchange="OnSearch('DETAIL')" />
                        </td>  
                        <td style="width: 5%" align="right">
                            Asset
                        </td>                                              
                        <td style="width: 25%" align="right">
                            <gw:textbox id="txtAsset" styles="width:100%" onenterkey="OnSearch('DETAIL')" />
                        </td>	
						<td style="width: 8%" align="right">                             
                        </td>					 												                       
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch('DETAIL')" />
                        </td>
						<td style="width: 1%" align="right">
                            <gw:imgbtn id="ibtnReport" img="excel" alt="Report" onclick="OnReport()" />
                        </td> 
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
            <td>
                <gw:grid id='grdDetail' 
					header='Asset Name|Model|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'                   
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='2000|1500|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200||1200|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' />                
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
	<gw:textbox id="txtDept01" styles="width:100%;display:none" />
	<gw:textbox id="txtDept02" styles="width:100%;display:none" />
	<gw:textbox id="txtDept03" styles="width:100%;display:none" />
	<gw:textbox id="txtDept04" styles="width:100%;display:none" />
	<gw:textbox id="txtDept05" styles="width:100%;display:none" />
	<gw:textbox id="txtDept06" styles="width:100%;display:none" />
	<gw:textbox id="txtDept07" styles="width:100%;display:none" />
	<gw:textbox id="txtDept08" styles="width:100%;display:none" />
	<gw:textbox id="txtDept09" styles="width:100%;display:none" />
	<gw:textbox id="txtDept10" styles="width:100%;display:none" />
	<gw:textbox id="txtDept11" styles="width:100%;display:none" />
	<gw:textbox id="txtDept12" styles="width:100%;display:none" />
	<gw:textbox id="txtDept13" styles="width:100%;display:none" />
	<gw:textbox id="txtDept14" styles="width:100%;display:none" />
	<gw:textbox id="txtDept15" styles="width:100%;display:none" />
	<gw:textbox id="txtDept16" styles="width:100%;display:none" />
	<gw:textbox id="txtDept17" styles="width:100%;display:none" />
	<gw:textbox id="txtDept18" styles="width:100%;display:none" />
	<gw:textbox id="txtDept19" styles="width:100%;display:none" />
	<gw:textbox id="txtDept20" styles="width:100%;display:none" />
	<gw:textbox id="txtDept21" styles="width:100%;display:none" />
	<gw:textbox id="txtDept22" styles="width:100%;display:none" />
	<gw:textbox id="txtDept23" styles="width:100%;display:none" />
	<gw:textbox id="txtDept24" styles="width:100%;display:none" />	
	<gw:textbox id="txtDept25" styles="width:100%;display:none" />
	<!------------------------------------------------------------------>
</body>
</html>
