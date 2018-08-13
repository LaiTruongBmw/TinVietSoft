<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head>
    <title>W/H Closing Checking 2</title>
</head>

<script>
 
var G1_WH           = 0, 
    G1_Date         = 1,    
    G1_GROUP        = 2,
    G1_ITEM_CODE    = 3
    G1_ITEM_NAME    = 4,
    G1_UOM          = 5,
    G1_LOT_NO       = 6,
    G1_BEGIN_QTY    = 7
    G1_BEGIN_AMOUNT = 8,
    G1_IN_QTY       = 9,
    G1_IN_AMOUNT    = 10,
    G1_OUT_QTY      = 11,   
    G1_OUT_AMOUNT   = 12,
    G1_END_QTY      = 13,
    G1_END_AMOUNT   = 14;
  
 //===============================================================
 function BodyInit()
 { 
    System.Translate(document);  // Translate to language session
    //----------------

    FormatGrid();
    OnChangeTab('GRID');
    //----------------    
 }
 //===============================================================

 function FormatGrid()
 {
 		var data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||Select ALL";    
    	lstWHType.SetDataText(data);
    	lstWHType.value = '';
		
    	data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||";     
    	lstItemGroup.SetDataText(data);
   	 	lstItemGroup.value = '';			
     
        data = "data|10|Type 1|20|Type 2|30|Type 3|40|Type 4";
        lstReportType.SetDataText(data);  
        lstReportType.value = '10'; 
		
		data = "data|1|Lot No|5|Item|2|Group|3|ST Item|4|W/H Account";
        lstDataType.SetDataText(data);  
        lstDataType.value = '1';

        data = "data|10|Grand Total|20|W/H Subtotal|30|WH/Date Subtotal|40|Group";
        lstGridType.SetDataText(data);  
        lstGridType.value = '40'; 
             
        grdStockItem.GetGridControl().MergeCells  = 2 ;	
        grdStockItem.GetGridControl().MergeCol(0) = true ;	
        grdStockItem.GetGridControl().MergeCol(1) = true ;   	
        grdStockItem.GetGridControl().MergeCol(2) = true ;	
        //------------
        var ctrl = grdStockItem.GetGridControl();
         ctrl.ColFormat(G1_BEGIN_QTY)    = "#,###,###,###,###,###.###";
         ctrl.ColFormat(G1_BEGIN_AMOUNT) = "#,###,###,###,###,###.###";
         ctrl.ColFormat(G1_IN_QTY)       = "#,###,###,###,###,###.###";        
         ctrl.ColFormat(G1_IN_AMOUNT)    = "#,###,###,###,###,###.###";
         ctrl.ColFormat(G1_OUT_QTY)      = "#,###,###,###,###,###.###";
         ctrl.ColFormat(G1_OUT_AMOUNT)   = "#,###,###,###,###,###.###";
         ctrl.ColFormat(G1_END_QTY)      = "#,###,###,###,###,###.###";
         ctrl.ColFormat(G1_END_AMOUNT)   = "#,###,###,###,###,###.###";                  
 }

 //===============================================================
 
 function OnSearch(pos)
 {
    switch (pos)
    {
        case 'Item':
            data_bimc00020.Call("SELECT");
        break;      
    }
 }
 
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'data_bimc00020' :
			    if ( grdStockItem.rows > 1 )
		        { 
                    grdStockItem.SetCellBold( 1, G1_WH,        grdStockItem.rows - 1, G1_WH,        true);			                   
                    grdStockItem.SetCellBold( 1, G1_BEGIN_QTY, grdStockItem.rows - 1, G1_BEGIN_QTY, true);	
                    grdStockItem.SetCellBold( 1, G1_IN_QTY,    grdStockItem.rows - 1, G1_IN_QTY,    true);
                    grdStockItem.SetCellBold( 1, G1_OUT_QTY,   grdStockItem.rows - 1, G1_OUT_QTY,   true);
                    grdStockItem.SetCellBold( 1, G1_END_QTY,   grdStockItem.rows - 1, G1_END_QTY,   true);
                    
                    grdStockItem.SetCellBold( 1, G1_ITEM_CODE, grdStockItem.rows - 1, G1_ITEM_CODE, true);			
		            
		            if ( lstGridType.value == '10' )
		            {
		                grdStockItem.Subtotal( 0, 2, -1, '7!8!9!10!11!12!13!14');
		            }
		            else if ( lstGridType.value == '20' )
		            {
		                grdStockItem.Subtotal( 0, 2, 0, '7!8!9!10!11!12!13!14');
		            }
		            else if ( lstGridType.value == '30' )
		            {
		                grdStockItem.Subtotal( 0, 2, 1, '7!8!9!10!11!12!13!14');
		            } 
					else if ( lstGridType.value == '40' )
		            {
		                grdStockItem.Subtotal( 0, 2, 2, '7!8!9!10!11!12!13!14');
		            } 	                
		        }    
            break;  
			
			case 'pro_bimc00020' :
				lstWH.value = '';
			break;         	            
      }	 
 }
 //===============================================================
 
function OnReport()
{    
      var url =System.RootURL + '/reports/bi/mc/rpt_bimc00020_3.aspx?from_date='+dtFrom.value+'&to_date='+dtTo.value+'&wh_type='+lstWHType.value+'&wh_pk='+lstWH.value+'&item_group='+lstItemGroup.value+'&item_no='+txtItem.text;
      window.open(url); 
      
//    if(lstReportType.value == 10)
//    {
//        var url =System.RootURL + '/reports/bi/sc/rpt_bimc00020.aspx?p_tin_warehouse_pk='+ lstWH.value +'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_item='+txtItem.text;
//        window.open(url); 
//     }
//     
//     if(lstReportType.value == 20)
//     {   
//        var url =System.RootURL + '/reports/bi/sc/rpt_bisc00011.aspx?p_tin_warehouse_pk='+ lstWH.value +'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_item='+txtItem.text;
//        window.open(url);         
//     }  
//     
//     if(lstReportType.value == 30)
//     {   
//        var url =System.RootURL + '/reports/bi/sc/rpt_bisc00012.aspx?p_tin_warehouse_pk='+ lstWH.value +'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value ;
//        window.open(url);         
//     }  

//     if(lstReportType.value == 40)
//     {   
//		var url =System.RootURL + '/reports/bi/sc/rpt_bisc00013.aspx?p_item='+ txtItem.text +'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value ;
//        window.open(url);         
//     }  
}
 
 //===============================================================
 function OnChangeTab(pos)
 {
    switch(pos)
    {
        case 'GRID':
            var strRad = lstDataType.value;
                     
	        switch (strRad)
	        {		                        
                case '1':
					grdStockItem.GetGridControl().ColHidden(G1_GROUP)  = false; 
					grdStockItem.GetGridControl().ColHidden(G1_LOT_NO) = true;
					grdStockItem.GetGridControl().ColHidden(G1_UOM)    = false ;
					
					grdStockItem.GetGridControl().Cell(0, 0, G1_ITEM_CODE, 0, G1_ITEM_CODE) = "Item Code";
					grdStockItem.GetGridControl().Cell(0, 0, G1_ITEM_NAME, 0, G1_ITEM_NAME) = "Item Name";					  
                break;
				
				case '5':
					grdStockItem.GetGridControl().ColHidden(G1_GROUP)  = false; 
					grdStockItem.GetGridControl().ColHidden(G1_LOT_NO) = false;
					grdStockItem.GetGridControl().ColHidden(G1_UOM)    = false ;
					
					grdStockItem.GetGridControl().Cell(0, 0, G1_ITEM_CODE, 0, G1_ITEM_CODE) = "Item Code";
					grdStockItem.GetGridControl().Cell(0, 0, G1_ITEM_NAME, 0, G1_ITEM_NAME) = "Item Name";					  
                break;					
				
				case '2':  
					grdStockItem.GetGridControl().ColHidden(G1_GROUP)  = true ;      		    
					grdStockItem.GetGridControl().ColHidden(G1_LOT_NO) = true ;
					grdStockItem.GetGridControl().ColHidden(G1_UOM)    = true ;					
					
					grdStockItem.GetGridControl().Cell(0, 0, G1_ITEM_CODE, 0, G1_ITEM_CODE) = "Group Code";
					grdStockItem.GetGridControl().Cell(0, 0, G1_ITEM_NAME, 0, G1_ITEM_NAME) = "Group Name";
                break;
				
 				case '3':
					grdStockItem.GetGridControl().ColHidden(G1_GROUP)  = false;
					grdStockItem.GetGridControl().ColHidden(G1_LOT_NO) = true ; 
					grdStockItem.GetGridControl().ColHidden(G1_UOM)    = false ;
					
					grdStockItem.GetGridControl().Cell(0, 0, G1_ITEM_CODE, 0, G1_ITEM_CODE) = "ST Code";
					grdStockItem.GetGridControl().Cell(0, 0, G1_ITEM_NAME, 0, G1_ITEM_NAME) = "ST Name";					 
                break;

				case '4':  
					grdStockItem.GetGridControl().ColHidden(G1_GROUP)  = false ;      		    
					grdStockItem.GetGridControl().ColHidden(G1_LOT_NO) = true ;
					grdStockItem.GetGridControl().ColHidden(G1_UOM)    = true ;					
					
					grdStockItem.GetGridControl().Cell(0, 0, G1_ITEM_CODE, 0, G1_ITEM_CODE) = "A/C Code";
					grdStockItem.GetGridControl().Cell(0, 0, G1_ITEM_NAME, 0, G1_ITEM_NAME) = "A/C Name";
                break;				
            }                
        break;
    } 
 }
//=================================================================
var vITEM_ID;

function OnPopUp(pos)
{	
		    if (grdStockItem.row >0)
		    {
		        vITEM_ID = grdStockItem.GetGridData( grdStockItem.row, G1_ITEM_CODE );
		    }
			else
		    {
		        vITEM_ID="";
		    }
			
			var url = System.RootURL + '/standard/forms/bi/sc/bimc00021.aspx';
			var aValue  = System.OpenModal(  url , 950, 500, 'resizable:yes;status:yes', this);
}

 //=================================================================
</script>

<body>
	<!---------------------------------------------------------------->
    <gw:data id="pro_bimc00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="st_lg_pro_bimc00020" > 
                <input>
                    <input bind="lstWHType" /> 
                </input> 
                <output>
                    <output bind="lstWH" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_bimc00020" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bimc00020" > 
                <input bind="grdStockItem" >
					<input bind="lstWHType" />
                    <input bind="lstWH" />
				    <input bind="dtFrom" />
                    <input bind="dtTo" />   
                    <input bind="lstItemGroup" />                                 
                    <input bind="txtItem" />
					<input bind="lstDataType" />
                </input>
                <output bind="grdStockItem" />
            </dso>
        </xml>
    </gw:data>    
    <!-------------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td style="width: 70%">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01"   />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01"   />
                        </td>
                        <td style="width: 5%" align="right">
                            W/H
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:list id="lstWHType" styles="width:100%" onclick="pro_bimc00020.Call('SELECT')" />							 
                        </td>
						 <td style="width: 25%; white-space: nowrap" colspan="2">                           
							<gw:list id="lstWH" styles='width:100%' csstype="mandatory" onchange="OnSearch('Item')" />
                        </td>
                        
                        <td align="right" style="white-space: nowrap; width: 5%">
                            Report
                        </td>
                        <td align="right" style="white-space: nowrap; width: 20%">
                            <gw:list id="lstReportType" styles='width:100%;' />
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport()" />
                        </td>                       
                    </tr>
                    <tr style="height: 2%">
						<td style="width: 5%" align="right">
                            Date
                        </td>
                        <td align="center" >
							<gw:list id="lstDataType" styles="width:100%" onchange="OnChangeTab('GRID')" />                           
                        </td>
                        <td style="width: 5%" align="right">
                            Item
                        </td>
						<td style="width: 15%; white-space: nowrap"  >
                            <gw:list id="lstItemGroup" styles="width:100%" onclick="OnSearch('Item')" />
                        </td>
                        <td style="width: 20%; white-space: nowrap"  >
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('Item')" />
                        </td>
                        <td style="width: 5%" align="center">
                            <u><b style="color: purple; cursor: hand" onclick="OnPopUp('HIST')">History</b></u>
                        </td>
                        <td align="right" style="white-space: nowrap; width: 5%">
                            Sub Total
                        </td>
                        <td align="right" style="white-space: nowrap; width: 20%">
                            <gw:list id="lstGridType" styles='width:100%;' />
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Item')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:grid id='grdStockItem' header='W/H|Date|Group|Item Code|Item Name|UOM|Lot No|Begin Qty|Begin Amount|In Qty|In Amount|Out Qty|Out Amount|End Qty|End Amount'
                    format='0|4|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|1|0|0|0|1|1|3|3|3|3|3|3|3|3'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1500|1200|1500|1500|2500|1000|1500|1500|1500|1500|1500|1500|1500|1500|1500'
                    sorting='T' styles='width:100%; height:100%' />                
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
</body>
</html>
