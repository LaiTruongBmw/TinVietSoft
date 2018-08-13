<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>P/O Checking</title>
</head>

<script>
 
 var G_SUPPLIER     = 0,
     G_PO_DATE      = 1,
     G_PO_NO        = 2,
     G_SEQ          = 3,
	 G_REF_NO		= 4,
     G_ITEM_CODE    = 5,
     G_ITEM_NAME    = 6,
     G_UOM          = 7,
     G_PO_QTY       = 8,
	 G_SUBMIT_QTY	= 9,
     G_IN_QTY       = 10,
     G_BAL_QTY      = 11,
     G_UP           = 12,
     G_ITEM_AMT     = 13,
     G_VAT_RATE     = 14,
     G_VAT_AMT      = 15,
     G_TOTAL_AMT    = 16,
     G_CCY          = 17,
	 G_DEPT			= 18,
     G_REMARK       = 19;
	 
var  company_pk = "<%=Session("COMPANY_PK")%>" ;   
 //===============================================================
 function BodyInit()
 { 
 
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    //-----------------
    System.Translate(document);  // Translate to language session
    //----------------
    FormatGrid();
    OnChangeTab('radType');
    //----------------    
 }
 //===============================================================

 function FormatGrid()
 {
        var data = "data|10|Type 1|30|Type 2|60|Type 3|40|Supplier Group"; // tam thoi bo kieu 2, 5
 
        lstReportType.SetDataText(data);  
        lstReportType.value = '10'; 

        data = "data|10|Grand Total|20|Supplier Subtotal|30|Supplier/Date Subtotal";
        lstGridType.SetDataText(data);  
        lstGridType.value = '10'; 
		//------------
		data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from TLG_IT_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||";
    	lstGroup.SetDataText(data);
    	lstGroup.value = '';
		//----------------------- 
		data = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 order by partner_name")%>||";
		lstCompany.SetDataText(data);
		lstCompany.value = company_pk ;    	
        //------------ 
		data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGGS0106') FROM DUAL" )%>||";    
		lstPartnerType.SetDataText(data);
		lstPartnerType.value = "" ;
		//------------ 
        grdPOItem.GetGridControl().MergeCells  = 2 ;	
        grdPOItem.GetGridControl().MergeCol(0) = true ;	
        grdPOItem.GetGridControl().MergeCol(1) = true ;   	
        grdPOItem.GetGridControl().MergeCol(2) = true ;	
        //------------
        var ctrl = grdPOItem.GetGridControl();
        ctrl.ColFormat(G_PO_QTY)    = "###,###,###.###" ;
		ctrl.ColFormat(G_SUBMIT_QTY)= "###,###,###.###" ;
        ctrl.ColFormat(G_IN_QTY)    = "###,###,###.###" ;
        ctrl.ColFormat(G_BAL_QTY)   = "###,###,###.###" ;
        ctrl.ColFormat(G_UP)        = "###,###,###.###" ;
        ctrl.ColFormat(G_ITEM_AMT)  = "###,###,###.###" ;
        ctrl.ColFormat(G_VAT_RATE)  = "###,###,###.###" ;
        ctrl.ColFormat(G_VAT_AMT)   = "###,###,###.###" ;
        ctrl.ColFormat(G_TOTAL_AMT) = "###,###,###.###" ;
        
        var ctrl = grdPOGroup.GetGridControl();
        ctrl.ColFormat(G_PO_QTY)    = "###,###,###.###" ;
        ctrl.ColFormat(G_UP)        = "###,###,###.###" ;
        ctrl.ColFormat(G_ITEM_AMT)  = "###,###,###.###" ;        
        ctrl.ColFormat(G_VAT_RATE)  = "###,###,###.###" ;   
        ctrl.ColFormat(G_VAT_AMT)   = "###,###,###.###" ;     
        ctrl.ColFormat(G_TOTAL_AMT) = "###,###,###.###" ;        
 }

 //===============================================================
 
 function OnSearch(pos)
 {
    switch(radType.value)
    {
        case 'Item':
            data_epbp00040.Call("SELECT");
        break;
        
        case 'Group':
            grdPOGroup.GridRefresh();
            data_epbp00040_2.Call("SELECT");
        break;
    }
 }
 
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'data_epbp00040' :
			    if ( grdPOItem.rows > 1 )
		        {            
		            grdPOItem.SetCellBold( 1, G_ITEM_CODE, grdPOItem.rows-1, G_ITEM_CODE, true);
		            grdPOItem.SetCellBold( 1, G_PO_QTY,    grdPOItem.rows-1, G_PO_QTY,    true); 
		            grdPOItem.SetCellBold( 1, G_TOTAL_AMT,    grdPOItem.rows-1, G_TOTAL_AMT,    true);
		            
		            if ( lstGridType.value == '10' )
		            {
		                grdPOItem.Subtotal( 0, 2, -1, '8!9!10!11!13!16');
		            }
		            else if ( lstGridType.value == '20' )
		            {
		                grdPOItem.Subtotal( 0, 2, 0, '8!9!10!11!13!16');
		            }
		            else if ( lstGridType.value == '30' )
		            {
		                grdPOItem.Subtotal( 0, 2, 1, '8!9!10!11!13!16');
		            } 	
		        }    
            break;           	            
      }	 
 }
 //===============================================================
 
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
		            grdPOItem.style.display  = "";        		      
		            grdPOGroup.style.display = "none";		     
                break;
                
                case 'Group':
		            grdPOItem.style.display  = "none";        		      
		            grdPOGroup.style.display = "";			    	   		    
                break;	
            }                
        break;
    } 
 }
 
 //=================================================================
 function OnPopUp(pos)
{
    switch(pos)
    {             
        case 'Report':			 
		        var path = System.RootURL + '/standard/formsep/bp/epbp00041.aspx';
		        var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
		break; 
		
			                                                                 
    }	       
}

 //=================================================================
 function OnReport(para)
 {
    switch(para)
    {
        case '0':
             
                //var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00040.aspx?p_company_pk='+ lstCompany.value +'&p_from_date='+ dtFrom.value + '&p_to_date=' + dtTo.value + '&p_po_vendor=' + txtPOVendor.text + '&p_item_group_pk=' + lstGroup.value +'&p_item=' + txtItem.text ;
				//window.open(url);  
				 var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00040_st01.aspx?p_company_pk='+ lstCompany.value +'&p_from_date='+ dtFrom.value + '&p_to_date=' + dtTo.value + '&p_po_vendor=' + txtPOVendor.text + '&p_item_group_pk=' + lstGroup.value +'&p_item=' + txtItem.text + '&p_partner_type=' + lstPartnerType.value ;
                 window.open(url, "_blank");       
        break;
		
       
    }
 }
 

</script>

<body>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_epbp00040" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_epbp00040" > 
                <input bind="grdPOItem" >
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                
                    <input bind="txtPOVendor" />
					<input bind="lstGroup" />
                    <input bind="txtItem" />
                    <input bind="lstCompany" />
					<input bind="lstPartnerType" />
                </input>
                <output bind="grdPOItem" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_epbp00040_2" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_epbp00040_2" > 
                <input bind="grdPOGroup" >
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                
                    <input bind="txtPOVendor" />
					<input bind="lstGroup" />
                    <input bind="txtItem" />
                    <input bind="lstCompany" />
					<input bind="lstPartnerType" />
                </input>
                <output bind="grdPOGroup" />
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
                        <td style="width: 15%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" onchange="" />
                        </td>
                        <td style="width: 5%" align="right">
                            PO/Supplier
                        </td>
                        <td style="width: 15%; white-space: nowrap">
                            <gw:list id="lstCompany" styles='width:100%' onchange="OnSearch('POItem')" />
                        </td>
						<td style="width: 15%; white-space: nowrap">
                            <gw:list id="lstPartnerType" styles='width:100%' onchange="OnSearch('POItem')" />
                        </td>
                        <td style="white-space: nowrap; width: 20%" align="right" colspan="2">
                            <gw:textbox id="txtPOVendor" styles='width:100%' onenterkey="OnSearch('POItem')" />
                        </td>
                        <td align="right" style="white-space: nowrap; width: 5%">
                            Report
                        </td>
                        <td align="right" style="white-space: nowrap; width: 10%">
                            <gw:list id="lstReportType" styles='width:100%;' />
                        </td>
                        <td style="width: 10%" align="right">
                            <gw:button id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnPopUp('Report')" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td style="width: 20%" align="center" colspan="2">
                            <gw:radio id="radType" value="Item" styles="width:100%" onchange="OnChangeTab('radType')"> 
                                <span value="Item"  id="tab_POItem">Item</span> 
                                <span value="Group" id="tab_POGroup">Group</span> 
                            </gw:radio>
                        </td>
                        <td style="width: 5%" align="right">
                            Group
                        </td>
                        <td style="width: 30%; white-space: nowrap" colspan=2>
                            <gw:list id="lstGroup" styles='width:100%' />
                        </td>
                        <td style="width: 20%; white-space: nowrap" colspan="2">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('POItem')" />
                        </td>
                        <td align="right" style="white-space: nowrap; width: 5%">
                            Sub Total
                        </td>
                        <td align="right" style="white-space: nowrap; width: 10%">
                            <gw:list id="lstGridType" styles='width:100%;' />
                        </td>
                        <td style="width: 10%" align="right">
                            <gw:button id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('POItem')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="2">
                <gw:grid id="grdPOItem" header="Supllier|P/O Date|P/O No|Seq|Ref No|Item Code|Item Name|UOM|P/O Qty|Submit Qty|In Qty|Bal Qty|U/P|P/O Amount|VAT Rate|VAT Amount|Amount|CCY|Dept|Remark"
                    format="0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					aligns="0|1|0|1|0|0|0|1|3|3|3|3|3|3|3|3|3|1|0|0"
                    defaults="|||||||||||||||||||" 
					editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="2000|1200|1200|800|1200|1500|2500|1000|1200|1200|1200|1200|1800|1200|1200|1800|1000|2500|1000"
                    styles="width:100%; height:100%" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17" />
                <gw:grid id="grdPOGroup" header="Supllier|P/O Date|P/O No|Seq|Ref No|Group|Item Name|P/O Qty|UOM|U/P|P/O Amount|VAT Rate|VAT Amount|Amount|Currency|Remark"
                    format="0|4|0|0|0|0|0|1|0|1|1|1|1|1|0|0" aligns="0|1|0|1|0|0|0|3|1|3|3|3|3|3|1|0"
                    defaults="||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" widths="2000|1200|1200|800|1200|1500|2500|1200|1000|1200|1800|1200|1200|1800|1200|1000"
                    styles="width:100%; height:100%" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17"
                    group="T" />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
</body>
</html>
