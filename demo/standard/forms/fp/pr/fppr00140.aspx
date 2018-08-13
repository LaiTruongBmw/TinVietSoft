<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Prod Incoming Checking</title>
</head>

<script>

 var G_WAREHOUSE 	= 0,
     G_IN_DATE   	= 1,
     G_SLIP_NO   	= 2,
     G_REF_NO    	= 3,
     G_SEQ       	= 4,
     G_ITEM_CODE 	= 5,
     G_ITEM_NAME 	= 6,
	 G_IN_UOM    	= 7,
     G_IN_QTY    	= 8,
     G_UNIT_PRICE	= 9,
	 G_ITEM_AMOUNT	= 10,
     G_LOT_NO    	= 11,
	 G_LINE		 	= 12,
	 G_CHARGER	 	= 13,
     G_REMARK    	= 14;
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
	txtUser_PK.text = "<%=session("USER_PK")%>";
    //----------------
    
    FormatGrid();
    OnChangeTab('radType');
	//----------------
	data_user_warehouse.Call();
 }
 //===============================================================

 function FormatGrid()
 {
         //----------------
		 
		data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||Select ALL";
		lstWHType.SetDataText(data);
		lstWHType.value = '';
		
        var data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 and PRODUCT_YN = 'Y' order by wh_id ")%>||Select ALL";   
        lstWH.SetDataText(data);
        lstWH.value = '' ;
    
        data = "data|10|Type 1|20|Type 2|30|Type 3|40|Type 4|50|DVP Deducts Qty";
        lstReportType.SetDataText(data);  
        lstReportType.value = '50'; 

		data = "<%=CtlLib.SetListDataSQL("select a.pk, lpad('-',level ,'-')||a.grp_cd || ' - ' || a.grp_nm from tlg_it_itemgrp a where a.del_if = 0 and a.use_yn='Y'  connect by prior a.pk = A.P_PK start with A.P_PK is null order siblings by grp_cd ")%>||";
    	lstGroup.SetDataText(data);
    	lstGroup.value = '';
		
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
        ctrl.ColFormat(G_IN_QTY) 		= "###,###,###.###" ;   
		ctrl.ColFormat(G_UNIT_PRICE) 	= "###,###,###.###" ; 	
		ctrl.ColFormat(G_ITEM_AMOUNT) 	= "###,###,###.###" ; 		
 }

 //===============================================================
 
 function OnSearch(pos)
 {
    switch(radType.value)
    {
        case 'Item':
            data_fppr00140.Call("SELECT");
        break;

        case 'Sum':
            data_fppr00140_2.Call("SELECT");
        break;
        
        case 'Group':
            grdGroup.GridRefresh();
            data_fppr00140_1.Call("SELECT");
        break;        
    }
 }
 
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'data_fppr00140' :
			    if ( grdItem.rows > 1 )
		        {      
		            grdItem.SetCellBold( 1, G_WAREHOUSE, grdItem.rows-1, G_WAREHOUSE, true);
		            grdItem.SetCellBold( 1, G_REF_NO,    grdItem.rows-1, G_REF_NO,    true);      
		            grdItem.SetCellBold( 1, G_ITEM_CODE, grdItem.rows-1, G_ITEM_CODE, true);
		            grdItem.SetCellBold( 1, G_IN_QTY,    grdItem.rows-1, G_IN_QTY,    true); 					
		            grdItem.SetCellBold( 1, G_LOT_NO,    grdItem.rows-1, G_LOT_NO,    true);
		             
		            if ( lstGridType.value == '10' )
		            {
		                grdItem.Subtotal( 0, 2, -1, '8!9!10');
		            }
		            else if ( lstGridType.value == '20' )
		            {
		                grdItem.Subtotal( 0, 2, 0, '8!9!10');
		            }
		            else if ( lstGridType.value == '30' )
		            {
		                grdItem.Subtotal( 0, 2, 1, '8!9!10');
		            } 	
		        }    
            break;  
			
			case 'data_fppr00140_2' :
			    if ( grdItem.rows > 1 )
		        {      
		            grdItem.SetCellBold( 1, G_WAREHOUSE, grdItem.rows-1, G_WAREHOUSE, true);
		            grdItem.SetCellBold( 1, G_REF_NO,    grdItem.rows-1, G_REF_NO,    true);      
		            grdItem.SetCellBold( 1, G_ITEM_CODE, grdItem.rows-1, G_ITEM_CODE, true);
		            grdItem.SetCellBold( 1, G_IN_QTY,    grdItem.rows-1, G_IN_QTY,    true); 
		            grdItem.SetCellBold( 1, G_LOT_NO,    grdItem.rows-1, G_LOT_NO,    true);
		             
		            if ( lstGridType.value == '10' )
		            {
		                grdItem.Subtotal( 0, 2, -1, '8!9!10');
		            }
		            else if ( lstGridType.value == '20' )
		            {
		                grdItem.Subtotal( 0, 2, 0, '8!9!10');
		            }
		            else if ( lstGridType.value == '30' )
		            {
		                grdItem.Subtotal( 0, 2, 1, '8!9!10');
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
            var url =System.RootURL + '/standard/reports/fp/pr/rpt_fppr00140.aspx?p_tin_warehouse_pk='+ lstWH.value +'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_ref_no_vendor='+txtRefNo.text+'&p_grp_pk='+lstGroup.value+'&p_item='+txtItem.text;
            window.open(url);                
        break;  
        
        case '20' :   
            var url =System.RootURL + '/standard/reports/fp/pr/rpt_fppr00141.aspx?p_wh_pk='+ lstWH.value +'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_ref_no_line='+ txtRefNo.text+ '&p_grp_pk='+lstGroup.value +'&p_item='+ txtItem.text ;
            window.open(url);                
        break;              
        
        case '30' :   
            var url =System.RootURL + '/standard/reports/fp/pr/rpt_fppr00142.aspx?p_tin_warehouse_pk='+ lstWH.value + '&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_po_vendor='+ txtRefNo.text +'&p_grp_pk='+lstGroup.value +'&p_item='+txtItem.text+'&p_tin_warehouse_name='+lstWH.GetText();
            window.open(url);                    
        break; 
        
         case '40' :   
            var url =System.RootURL + '/standard/reports/fp/pr/rpt_fppr00140_1.aspx?p_tin_warehouse_pk='+ lstWH.value + '&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_ref_no_pl='+ txtRefNo.text +'&p_grp_pk='+lstGroup.value +'&p_item='+txtItem.text+'&p_tin_warehouse_name='+lstWH.GetText();
            window.open(url);                    
            
            break;

        case '50':
            var url = System.RootURL + '/standard/reports/fp/pr/rpt_fppr00140_2.aspx?p_tin_warehouse_pk=' + lstWH.value + '&p_from_date=' + dtFrom.value + '&p_to_date=' + dtTo.value + '&p_ref_no_pl=' + txtRefNo.text + '&p_grp_pk=' + lstGroup.value + '&p_item=' + txtItem.text + '&p_tin_warehouse_name=' + lstWH.GetText();
            window.open(url);

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
		            grdGroup.style.display = "none";	
					
					grdItem.GetGridControl().ColHidden(G_IN_DATE) = false ;	
					grdItem.GetGridControl().ColHidden(G_SLIP_NO) = false ;	
					grdItem.GetGridControl().ColHidden(G_REF_NO)  = false ;	
					grdItem.GetGridControl().ColHidden(G_SEQ   )  = false ; 
					
					grdItem.GetGridControl().ColHidden(G_CHARGER) = false ;
					grdItem.GetGridControl().ColHidden(G_REMARK ) = false ; 					 	     
                break;
                
				case 'Sum':        		    
		            grdItem.style.display  = "";        		      
		            grdGroup.style.display = "none";	
					
					grdItem.GetGridControl().ColHidden(G_IN_DATE) = true ;	
					grdItem.GetGridControl().ColHidden(G_SLIP_NO) = true ;	
					grdItem.GetGridControl().ColHidden(G_REF_NO)  = true ;	
					grdItem.GetGridControl().ColHidden(G_SEQ   )  = true ;
					
					grdItem.GetGridControl().ColHidden(G_CHARGER) = true ;
					grdItem.GetGridControl().ColHidden(G_REMARK ) = true ;  
                break;
				
                case 'Group':
		            grdItem.style.display  = "none";        		      
		            grdGroup.style.display = "";			    	   		    
                break;	
            }                
        break;
    } 
 }
 
 //===============================================================

</script>

<body>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_fppr00140" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_fppr00140" > 
                <input bind="grdItem" >
                    <input bind="lstWH" />
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                
                    <input bind="txtRefNo" />
					<input bind="lstGroup" />
                    <input bind="txtItem" />
                </input>
                <output bind="grdItem" />
            </dso>
        </xml>
    </gw:data>	
    <!-------------------------------------------------------------------------->
    <gw:data id="data_fppr00140_2" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_fppr00140_2" > 
                <input bind="grdItem" >
                    <input bind="lstWH" />
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                
                    <input bind="txtRefNo" />
					<input bind="lstGroup" />
                    <input bind="txtItem" />
                </input>
                <output bind="grdItem" />
            </dso>
        </xml>
    </gw:data>	
    <!-------------------------------------------------------------------------->
    <gw:data id="data_fppr00140_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_fppr00140_1" > 
                <input bind="grdGroup" >
                    <input  bind="lstWH" />
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                
                    <input bind="txtRefNo" />
					<input bind="lstGroup" />
                    <input bind="txtItem" />
                </input>
                <output bind="grdGroup" />
            </dso>
        </xml>
    </gw:data>
	 <!---------------------------------------------------------------->
    <gw:data id="data_user_warehouse" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_fppr00140_user_wh" > 
                <input>
                    <input bind="txtUser_PK" /> 
					<input bind="lstWHType" />
                </input> 
                <output>
                    <output bind="lstWH" />
                </output>
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
                        <td style="width: 30%; white-space: nowrap" colspan=2 >
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            No/Line
                        </td>
                        <td style="width: 30%; white-space: nowrap" colspan=2 >
                            <gw:textbox id="txtRefNo" styles='width:100%' onenterkey="OnSearch('Detail')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Report
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:list id="lstReportType" styles='width:100%;' />
                        </td>
                        <td  style="white-space: nowrap; width: 5%">
                            <gw:button id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport()" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 5%" align="right">
                            W/H
                        </td>
						
						<td style="width: 20%; white-space: nowrap">
                            <gw:list id="lstWHType" styles="width:100%;" onchange="data_user_warehouse.Call()"/>
                        </td>
						
                        <td style="width: 20%; white-space: nowrap">
                            <gw:list id="lstWH" styles="width:100%;" />
                        </td>
						
                        <td style="width: 5%" align="right">
                            Item
                        </td>
						<td style="width: 20%; white-space: nowrap">
                            <gw:list id="lstGroup" styles='width:100%' />
                        </td>
                        <td style="width: 10%; white-space: nowrap">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('Detail')" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Sub Total
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:list id="lstGridType" styles='width:100%;' />
                        </td>
                        <td style="width: 5%" >
                            <gw:button id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Detail')" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 5%" align="left" colspan="9">
                            <gw:radio id="radType" value="Item" styles="width:100%" onchange="OnChangeTab('radType')"> 
                                <span value="Item"  id="tab_Item">by Slip</span> 
								<span value="Sum" id="tab_Sum">by Item</span> 
                                <span value="Group" id="tab_Group">Group</span> 
                            </gw:radio>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td>     
                <gw:grid id='grdItem'
                header='W/H Name|In Date|Slip No|Ref No|Seq|Item Code|Item Name|UOM|In Qty|U/Price|Item Amount|Lot No|Line|Charger|Remark'
                format='0|4|0|0|0|0|0|0|0|0|0|0|0|0|0'
                aligns='0|1|0|0|1|0|0|1|3|3|3|1|0|0|0'
                check='||||||||||||||'
                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                widths='1500|1200|1200|1200|800|1500|3500|800|1500|1500|1500|1500|1500|1500|2000'
                sorting='T'
                styles='width:100%; height:100%'
                />      
                				 
				<gw:grid id='grdGroup'
                header='W/H Name|In Date|Slip No|Ref No|Seq|Item Code|Item Name|UOM|In Qty|U/Price|Item Amount|Lot No|Line|Charger|Remark'
                format='0|4|0|0|0|0|0|0|0|0|0|0|0|0|0'
                aligns='0|1|0|0|1|0|0|1|3|3|3|1|0|0|0'
                check='||||||||||||||'
                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                widths='1500|1200|1200|1200|800|1500|3500|800|1500|1500|1500|1500|1500|1500|2000'
                sorting='T'
                styles='width:100%; height:100%'
				group ="T"
                />   
				
				                         
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
	<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
</body>
</html>
