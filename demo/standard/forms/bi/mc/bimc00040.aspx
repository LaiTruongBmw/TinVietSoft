<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head>
    <title>W/H Closing Checking</title>
</head>

<script>
 
var G1_WH           = 0, 
    G1_Date         = 1,    
    G1_GROUP        = 2,
    G1_ITEM_CODE    = 3
    G1_ITEM_NAME    = 4,
    G1_UOM          = 5,
    G1_LOT_NO       = 6,
	G1_UPRICE		= 7,
    G1_BEGIN_QTY    = 8,
    G1_BEGIN_AMOUNT = 9,
	G1_DR_IN_QTY  	= 10,
	G1_OT_IN_QTY	= 11,
    G1_IN_QTY       = 12,
    G1_IN_AMOUNT    = 13,
	G1_DR_OUT_QTY	= 14,
	G1_OT_OUT_QTY	= 15,
    G1_OUT_QTY      = 16,   
    G1_OUT_AMOUNT   = 17,
    G1_END_QTY      = 18,
    G1_END_AMOUNT   = 19;
  
 //===============================================================
 function BodyInit()
 { 
    System.Translate(document);  // Translate to language session
    //----------------

    FormatGrid();
    OnChangeTab('radType');
    //----------------
	
	OnSetGrid();    
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
     
        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_get_report_lst2('bimc00040',1) FROM DUAL" )%>"; 
        lstReportType.SetDataText(data);  
        

        data = "data|10|Grand Total|20|W/H Subtotal|30|WH/Date Subtotal|40|Group";
        lstGridType.SetDataText(data);  
        lstGridType.value = '40'; 
             
        grdStockItem.GetGridControl().MergeCells  = 2 ;	
        grdStockItem.GetGridControl().MergeCol(0) = true ;	
        grdStockItem.GetGridControl().MergeCol(1) = true ;   	
        grdStockItem.GetGridControl().MergeCol(2) = true ;	
        //------------
        var ctrl = grdStockItem.GetGridControl();
		ctrl.ColFormat(G1_UPRICE)       = "#,###,###,###,###,###.###";
        ctrl.ColFormat(G1_BEGIN_QTY)    = "#,###,###,###,###,###.###";
        ctrl.ColFormat(G1_BEGIN_AMOUNT) = "#,###,###,###,###,###.###";
		ctrl.ColFormat(G1_DR_IN_QTY)    = "#,###,###,###,###,###.###";
		ctrl.ColFormat(G1_OT_IN_QTY)    = "#,###,###,###,###,###.###";
        ctrl.ColFormat(G1_IN_QTY)       = "#,###,###,###,###,###.###";        
        ctrl.ColFormat(G1_IN_AMOUNT)    = "#,###,###,###,###,###.###";
		ctrl.ColFormat(G1_DR_OUT_QTY)   = "#,###,###,###,###,###.###";
		ctrl.ColFormat(G1_OT_OUT_QTY)   = "#,###,###,###,###,###.###";
        ctrl.ColFormat(G1_OUT_QTY)      = "#,###,###,###,###,###.###";
        ctrl.ColFormat(G1_OUT_AMOUNT)   = "#,###,###,###,###,###.###";
        ctrl.ColFormat(G1_END_QTY)      = "#,###,###,###,###,###.###";
        ctrl.ColFormat(G1_END_AMOUNT)   = "#,###,###,###,###,###.###";  
        
        var ctrl = grdStockGroup.GetGridControl();
		ctrl.ColFormat(G1_UPRICE)       = "#,###,###,###,###,###.###";
        ctrl.ColFormat(G1_BEGIN_QTY)    = "#,###,###,###,###,###.###";
        ctrl.ColFormat(G1_BEGIN_AMOUNT) = "#,###,###,###,###,###.###";         
		ctrl.ColFormat(G1_DR_IN_QTY)    = "#,###,###,###,###,###.###";
		ctrl.ColFormat(G1_OT_IN_QTY)    = "#,###,###,###,###,###.###";
		ctrl.ColFormat(G1_IN_QTY)       = "#,###,###,###,###,###.###";  		       
        ctrl.ColFormat(G1_IN_AMOUNT)    = "#,###,###,###,###,###.###";
		ctrl.ColFormat(G1_DR_OUT_QTY)   = "#,###,###,###,###,###.###";
		ctrl.ColFormat(G1_OT_OUT_QTY)   = "#,###,###,###,###,###.###";		 
        ctrl.ColFormat(G1_OUT_QTY)      = "#,###,###,###,###,###.###";
        ctrl.ColFormat(G1_OUT_AMOUNT)   = "#,###,###,###,###,###.###";
        ctrl.ColFormat(G1_END_QTY)      = "#,###,###,###,###,###.###";
        ctrl.ColFormat(G1_END_AMOUNT)   = "#,###,###,###,###,###.###";        
 }

 //===============================================================
 
 function OnSearch(pos)
 {
    switch(radType.value)
    {
        case 'Item':
            data_bimc00040.Call("SELECT");
        break;
        
        case 'Group':
            grdStockGroup.GridRefresh();
            data_bimc00040_1.Call("SELECT");
        break;
        
    }
 }
 
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'data_bimc00040' :
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
		                grdStockItem.Subtotal( 0, 2, -1, '8!9!10!11!12!13!14!15!16!17!18!19');
		            }
		            else if ( lstGridType.value == '20' )
		            {
		                grdStockItem.Subtotal( 0, 2, 0, '8!9!10!11!12!13!14!15!16!17!18!19');
		            }
		            else if ( lstGridType.value == '30' )
		            {
		                grdStockItem.Subtotal( 0, 2, 1, '8!9!10!11!12!13!14!15!16!17!18!19');
		            } 
					else if ( lstGridType.value == '40' )
		            {
		                grdStockItem.Subtotal( 0, 2, 2, '8!9!10!11!12!13!14!15!16!17!18!19');
		            } 	                
		        }    
            break;  
			
			case 'pro_bimc00040' :
				lstWarehouse.value = '';
			break;         	            
      }	 
 }
 
 //===============================================================

function OnPopUp(pos)
{
	switch(pos)
	{
	
		case 'REPORT':
			var path = System.RootURL + '/standard/forms/bi/mc/bimc00042.aspx';
			var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);				
		break;
		
	}	
}

 //===============================================================
 
function OnReport()
{   
	
	var url =System.RootURL + '/reports/bi/mc/'+lstReportType.value+'?p_wh_type='+ lstWHType.value +'&p_tin_warehouse_pk='+ lstWarehouse.value +'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value + '&p_item_grp_pk='+lstItemGroup.value +'&p_item='+txtItem.text;
	//alert(url);
			window.open(url); 	
	
	/*switch(pos)
	{
		case '10':
			var url =System.RootURL + '/reports/bi/mc/rpt_bimc00040.aspx?p_wh_type='+ lstWHType.value +'&p_tin_warehouse_pk='+ lstWarehouse.value +'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_item='+txtItem.text;
			window.open(url); 			
		break;
		
		case '20':
			var url =System.RootURL + '/reports/bi/mc/rpt_bimc00041.aspx?p_tin_warehouse_pk='+ lstWarehouse.value +'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_item='+txtItem.text;
			window.open(url);   			
		break;
		
		case '30':
			var url =System.RootURL + '/reports/bi/mc/rpt_bimc00042.aspx?p_tin_warehouse_pk='+ lstWarehouse.value +'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value ;
			window.open(url);  			
		break;	

		case '40':
			var url =System.RootURL + '/reports/bi/mc/rpt_bimc00043.aspx?p_item='+ txtItem.text +'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value ;
			window.open(url);   			
		break;	
		
		case '41':
			var url =System.RootURL + "/reports/bi/mc/rpt_bimc00045.aspx?p_from_date="+dtFrom.value+ "&p_to_date=" + dtTo.value ;
				url = url + "&p_wh_type=" + lstWHType.value + "&p_wh=" + lstWarehouse.value + "&p_wh_name=" + lstWarehouse.GetText() ;
				url = url + "&p_item_grp=" + lstItemGroup.value + "&p_item=" + txtItem.text ;
			window.open(url);			
		break;	

		case '50':
			var url =System.RootURL + '/reports/bi/mc/rpt_bimc00040_bkvn.aspx?p_item='+ txtItem.text +'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_tin_warehouse_pk='+ lstWarehouse.value +'&p_item_grp_pk='+lstItemGroup.value ;
			window.open(url);       			
		break;	

		case 'ST01':
			var url =System.RootURL + '/reports/bi/mc/rpt_bimc00040_ST01.aspx?p_wh_type='+ lstWHType.value +'&p_wh_pk='+ lstWarehouse.value +'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_item_grp_pk='+ lstItemGroup.value +'&p_item='+ txtItem.text ;
			window.open(url);       			
		break;
		
		case 'FOSE01':
			var url =System.RootURL + '/reports/bi/mc/rpt_bimc00040_FOSE01.aspx?p_wh_type='+ lstWHType.value +'&p_wh_pk='+ lstWarehouse.value +'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_item_grp_pk='+ lstItemGroup.value +'&p_item='+ txtItem.text ;
			window.open(url);       			
		break;
	}*/
	 
}
 
 //===============================================================
 function OnChangeTab(pos)
 {
    switch(pos)
    {
        case 'radType':
            var strRad = radType.GetData();
                     
	        switch (strRad)
	        {
		        case 'Item':        		    
		            grdStockItem.style.display  = "";        		      
		            grdStockGroup.style.display = "none";		     
                break;
                
                case 'Group':
		            grdStockItem.style.display  = "none";        		      
		            grdStockGroup.style.display = "";			    	   		    
                break;	
            }                
        break;
    } 
 }
 
 //=============================================================================

function OnSetGrid()
{ 
	if ( chkDetail.value == 'Y' )
	{
		 grdStockItem.GetGridControl().ColHidden(G1_DR_IN_QTY)  = false ;
         grdStockItem.GetGridControl().ColHidden(G1_OT_IN_QTY)  = false ;

		 grdStockItem.GetGridControl().ColHidden(G1_DR_OUT_QTY) = false ;
         grdStockItem.GetGridControl().ColHidden(G1_OT_OUT_QTY) = false ;
	}
	else
	{
		 grdStockItem.GetGridControl().ColHidden(G1_DR_IN_QTY)  = true ;
         grdStockItem.GetGridControl().ColHidden(G1_OT_IN_QTY)  = true ;

		 grdStockItem.GetGridControl().ColHidden(G1_DR_OUT_QTY) = true ;
         grdStockItem.GetGridControl().ColHidden(G1_OT_OUT_QTY) = true ;
	}
}

 //=================================================================
</script>

<body>
	<!---------------------------------------------------------------->
    <gw:data id="pro_bimc00040" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="st_lg_pro_bimc00040" > 
                <input>
                    <input bind="lstWHType" /> 
                </input> 
                <output>
                    <output bind="lstWarehouse" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_bimc00040" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bimc00040" > 
                <input bind="grdStockItem" >
					<input bind="lstWHType" />
                    <input bind="lstWarehouse" />
				    <input bind="dtFrom" />
                    <input bind="dtTo" />   
                    <input bind="lstItemGroup" />                                 
                    <input bind="txtItem" />
                </input>
                <output bind="grdStockItem" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_bimc00040_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bimc00040_1" > 
                <input bind="grdStockGroup" >
					<input bind="lstWHType" />
                    <input bind="lstWarehouse" />                
				    <input bind="dtFrom" />
                    <input bind="dtTo" /> 
					<input bind="lstItemGroup" />
                    <input bind="txtItem" />
                </input>
                <output bind="grdStockGroup" />
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
                            <gw:list id="lstWHType" styles="width:100%" onclick="pro_bimc00040.Call('SELECT')" />							 
                        </td>
						 <td style="width: 25%; white-space: nowrap">                           
							<gw:list id="lstWarehouse" styles='width:100%' csstype="mandatory" onchange="OnSearch('POItem')" />
                        </td>
                        <td align="right" style="white-space: nowrap; width: 5%">
                            Report
                        </td>
                        <td align="right" style="white-space: nowrap; width: 20%">
                            <gw:list id="lstReportType" styles='width:100%;' />
                        </td>
                        <td style="width: 5%" align="right">
							<gw:imgbtn id="ibtnReport" img="excel" alt="report" text="Report" onclick="OnReport()" /> 	
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td style="width: 25%; white-space: nowrap" align="center" colspan="2">
                            <gw:radio id="radType" value="Item" styles="width:100%" onchange="OnChangeTab('radType')"> 
                                <span value="Item"  id="tab_POItem">Item</span> 
                                <span value="Group" id="tab_POGroup">Group</span> 
                            </gw:radio>
							<gw:checkbox id="chkDetail" styles="color:red" defaultvalue="Y|N" value="N" onchange="OnSetGrid()">Detail</gw:checkbox>
                        </td>
                        <td style="width: 5%" align="right">
                            Item
                        </td>
						<td style="width: 15%; white-space: nowrap"  >
                            <gw:list id="lstItemGroup" styles="width:100%" onclick="OnSearch('POItem')" />
                        </td>
                        <td style="width: 25%; white-space: nowrap"  >
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('POItem')" />
                        </td>
                        <td align="right" style="white-space: nowrap; width: 5%">
                            Sub Total
                        </td>
                        <td align="right" style="white-space: nowrap; width: 20%">
                            <gw:list id="lstGridType" styles='width:100%;' />
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('POItem')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:grid id='grdStockItem' header='W/H|Date|Group|Item Code|Item Name|UOM|Lot No|U/Price|Begin Qty|Begin Amount|D/R In|O/T In|In Qty|In Amount|D/R Out|O/T Out|Out Qty|Out Amount|End Qty|End Amount'
                    format='0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|1|0|0|0|1|1|3|3|3|3|3|3|3|3|3|3|3|3|3'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1500|1200|1500|1500|2500|1000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500'
                    sorting='T' styles='width:100%; height:100%' />
                <gw:grid id='grdStockGroup' header='W/H|Date|Group|Item Code|Item Name|UOM|Lot No|U/Price|Begin Qty|Begin Amount|D/R In|O/T In|In Qty|In Amount|D/R Out|O/T Out|Out Qty|Out Amount|End Qty|End Amount'
                    format='0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|1|0|0|0|1|1|3|3|3|3|3|3|3|3|3|3|3|3|3'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1500|1200|1500|1500|2500|1000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500'
                    sorting='T' styles='width:100%; height:100%' group="T" />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
</body>
</html>
