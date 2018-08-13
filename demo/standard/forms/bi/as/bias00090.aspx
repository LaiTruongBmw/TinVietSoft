<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Stock Transfer Checking</title>
</head>
<script>

 var G_IN_DATE          = 0,
     G_SLIP_NO          = 1,
     G_REF_NO           = 2,
     G_SEQ              = 3,
     G_REQ_ITEM_CODE    = 4, 
     G_REQ_ITEM_NAME    = 5,
     G_ITEM_CODE        = 6,
     G_ITEM_NAME        = 7,
	 G_IN_UOM           = 8,
	 G_LOT_NO	        = 9,
	 G_REQ_QTY          = 10,
     G_IN_QTY           = 11,     
     G_UPRICE           = 12,
     G_ITEM_AMT         = 13,
     G_VAT_RATE         = 14,
     G_VAT_AMT          = 15,
     G_TOTAL_AMT        = 16,
     G_CCY              = 17,
     G_OUT_WH           = 18,
     G_IN_WH            = 19,
     G_OUT_PL           = 20,
     G_IN_PL            = 21,	
	 G_CHARGER	        = 22, 
     G_REMARK           = 23;
  
 //===============================================================
 function BodyInit()
 { 
    System.Translate(document);  // Translate to language session
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    
    //----------------
    
    FormatGrid();
 }
 //===============================================================

 function FormatGrid()
 {
         //----------------
        var data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 and use_yn='Y' order by wh_id ")%>||Select ALL";   
        lstOutWH.SetDataText(data);
        lstOutWH.value = '' ;
    
	    lstInWH.SetDataText(data);
        lstInWH.value = '' ;
		
        data = "data|10|Type 1|40|Type 4";
        lstReportType.SetDataText(data);  
        lstReportType.value = '10'; 

        data = "data|10|Grand Total|20|W/H Subtotal|30|W/H-Date Subtotal";
        lstGridType.SetDataText(data);  
        lstGridType.value = '10'; 
             
        grdItem.GetGridControl().MergeCells  = 2 ;	
        grdItem.GetGridControl().MergeCol(0) = true ;	
        grdItem.GetGridControl().MergeCol(1) = true ;   	
        grdItem.GetGridControl().MergeCol(2) = true ;	
        grdItem.GetGridControl().MergeCol(3) = true ;
        //------------
        var ctrl = grdItem.GetGridControl();
        ctrl.ColFormat(G_REQ_QTY)    = "###,###,###.###" ;
        ctrl.ColFormat(G_IN_QTY)     = "###,###,###.###" ;
        ctrl.ColFormat(G_UPRICE)     = "###,###,###.###" ;
        ctrl.ColFormat(G_ITEM_AMT)   = "###,###,###.###" ;
        ctrl.ColFormat(G_VAT_RATE)   = "###,###,###.###" ;
        ctrl.ColFormat(G_VAT_AMT)    = "###,###,###.###" ;
        ctrl.ColFormat(G_TOTAL_AMT)  = "###,###,###.###" ;

        var ctrl = grdItemGroup.GetGridControl();
        ctrl.ColFormat(G_REQ_QTY)    = "###,###,###.###" ;
        ctrl.ColFormat(G_IN_QTY)     = "###,###,###.###" ;
        ctrl.ColFormat(G_UPRICE)     = "###,###,###.###" ;
        ctrl.ColFormat(G_ITEM_AMT)   = "###,###,###.###" ;
        ctrl.ColFormat(G_VAT_RATE)   = "###,###,###.###" ;
        ctrl.ColFormat(G_VAT_AMT)    = "###,###,###.###" ;
        ctrl.ColFormat(G_TOTAL_AMT)  = "###,###,###.###" ;
 }

 //===============================================================
 
 function OnSearch(pos)
 {
    switch(radType.value)
    {
        case 'Item':
            data_bias00090.Call("SELECT");
        break;
        
        case 'Group':
            grdItemGroup.GridRefresh();
            data_bias00090_1.Call("SELECT");
        break;
        
    }
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
		            grdItem.style.display  = "";        		      
		            grdItemGroup.style.display = "none";		     
                break;
                
                case 'Group':
		            grdItem.style.display  = "none";        		      
		            grdItemGroup.style.display = "";			    	   		    
                break;	
            }                
        break;
    } 
 }
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'data_bias00090' :
			    if ( grdItem.rows > 1 )
		        {      
		            grdItem.SetCellBold( 1, G_OUT_WH,    grdItem.rows-1, G_IN_WH,     true);
		            grdItem.SetCellBold( 1, G_REF_NO,    grdItem.rows-1, G_REF_NO,    true);      
                    grdItem.SetCellBold( 1, G_REQ_ITEM_CODE, grdItem.rows-1, G_REQ_ITEM_CODE, true);
		            grdItem.SetCellBold( 1, G_ITEM_CODE, grdItem.rows-1, G_ITEM_CODE, true);
                    grdItem.SetCellBold( 1, G_REQ_QTY,    grdItem.rows-1, G_REQ_QTY,    true); 
		            grdItem.SetCellBold( 1, G_IN_QTY,    grdItem.rows-1, G_IN_QTY,    true); 
		            grdItem.SetCellBold( 1, G_ITEM_AMT,    grdItem.rows-1, G_ITEM_AMT,    true);
		            grdItem.SetCellBold( 1, G_TOTAL_AMT, grdItem.rows-1, G_TOTAL_AMT, true);
		            
		            if ( lstGridType.value == '10' )
		            {
		                grdItem.Subtotal( 0, 2, -1, '10!11!13!15!16');
		            }
		            else if ( lstGridType.value == '20' )
		            {
		                grdItem.Subtotal( 0, 2, 0, '10!11!13!15!16');
		            }
		            else if ( lstGridType.value == '30' )
		            {
		                grdItem.Subtotal( 0, 2, 1, '10!11!13!15!16');
		            } 	
		        }    
            break;            	            
      }	 
 }
 //===============================================================
 
function OnReport()
{     
    switch (lstReportType.value)
    {
        case '10' :   
            var url =System.RootURL + '/reports/bi/as/rpt_bias00090.aspx?p_out_warehouse_pk='+ lstOutWH.value + '&p_in_warehouse_pk=' + lstInWH.value + '&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_ref_no_vendor='+txtRefNoPL.text+'&p_item='+txtItem.text;
            window.open(url);                
        break;  
        
        case '20' :   
            var url =System.RootURL + '/reports/bi/as/rpt_bias00091.aspx?p_tin_warehouse_pk='+ lstOutWH.value + '&p_in_warehouse_pk=' + lstInWH.value + '&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_ref_no_vendor='+txtRefNoPL.text+'&p_item='+txtItem.text;
            window.open(url);                
        break;              
        
        case '30' :   
            var url =System.RootURL + '/reports/ep/fm/rpt_epfm00022.aspx?p_tin_warehouse_pk='+ lstOutWH.value + '&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_po_vendor='+ txtRefNoPL.text+'&p_item='+txtItem.text+'&p_tin_warehouse_name='+lstOutWH.GetText();
            window.open(url);                
        break; 

        case '40' :   
            var url =System.RootURL + '/reports/bi/as/rpt_bias00090_1.aspx?p_out_warehouse_pk='+ lstOutWH.value + '&p_in_warehouse_pk=' + lstInWH.value + '&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_ref_no_vendor='+txtRefNoPL.text+'&p_item='+txtItem.text;
            window.open(url);                
        break; 
    }     
} 
 //===============================================================

</script>
<body>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_bias00090" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bias00090" > 
                <input bind="grdItem" >                    
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                
                    <input bind="txtRefNoPL" />
                    <input bind="txtItem" />
					<input bind="lstOutWH" />
					<input bind="lstInWH" />
                </input>
                <output bind="grdItem" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_bias00090_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bias00090_1" > 
                <input bind="grdItemGroup" >                    
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                
                    <input bind="txtRefNoPL" />
                    <input bind="txtItem" />
					<input bind="lstOutWH" />
					<input bind="lstInWH" />
                </input>
                <output bind="grdItemGroup" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td style="width: 100%">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            No/Supplier
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:textbox id="txtRefNoPL" styles='width:100%' onenterkey="OnSearch('Detail')" />
                        </td>
                        <td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('Detail')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Report
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:list id="lstReportType" styles='width:100%;' />
                        </td>
                        <td align="right" style="white-space: nowrap; width: 5%">
                            <gw:imgbtn id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport()" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 5%" align="right">
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:radio id="radType" value="Item" styles="width:100%" onchange="OnChangeTab('radType')"> 
                                <span value="Item"  id="tab_POItem">Item</span> 
                                <span value="Group" id="tab_POGroup">Group</span> 
                            </gw:radio>
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Out W/H
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:list id="lstOutWH" styles="width:100%;" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            In W/H
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:list id="lstInWH" styles="width:100%;" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Sub Total
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:list id="lstGridType" styles='width:100%;' />
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Detail')" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 5%" align="left" colspan="7">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>
                <gw:grid id='grdItem' header='In Date|Slip No|Ref No|Seq|Req Item Code|Req Item Name|Item Code|Item Name|UOM|Lot No|Req Qty|In Qty|U/P|Item Amt|VAT(%)|VAT Amt|Total Amt|CCY|Out W/H|In W/H|Out P/L|In P/L|Charger|Remark'
                    format='4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='1|0|0|1|0|0|0|0|1|1|1|3|3|3|3|3|3|1|0|0|0|0|0|0'
                    check='|||||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='1200|1200|1200|800|1500|2500|1500|2500|800|1200|1200|1200|1200|1200|1000|1200|1200|800|2000|2000|2000|2000|1500|1000'
                    sorting='T' styles='width:100%; height:100%' />
                <gw:grid id='grdItemGroup' header='In Date|Slip No|Ref No|Seq|Req Item Code|Req Item Name|Item Code|Item Name|UOM|Lot No|Req Qty|In Qty|U/P|Item Amt|VAT(%)|VAT Amt|Total Amt|CCY|Out W/H|In W/H|Out P/L|In P/L|Charger|Remark'
                    format='4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='1|0|0|1|0|0|0|0|1|1|1|3|3|3|3|3|3|1|0|0|0|0|0|0'
                    check='|||||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='1200|1200|1200|800|1500|2500|1500|2500|800|1200|1200|1200|1200|1200|1000|1200|1200|800|2000|2000|2000|2000|1500|1000'
                    sorting='T' styles='width:100%; height:100%' group="T" />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
</body>
</html>
