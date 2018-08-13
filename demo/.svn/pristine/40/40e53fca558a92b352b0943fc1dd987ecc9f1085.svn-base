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

 var G_WAREHOUSE	= 0,
	 G_SUPPLIER     = 1,
     G_DATE      	= 2,
     G_SLIP_NO      = 3,
     G_SEQ          = 4,
	 G_REF_NO		= 5,
     G_ITEM_CODE    = 6,
     G_ITEM_NAME    = 7,
     G_UOM          = 8,
     G_PO_QTY       = 9,
     G_IN_QTY       = 10,      
     G_UNIT_PRICE   = 11,
	 G_ITEM_AMOUNT	= 12,
     G_TAX_AMOUNT   = 13,
     G_TOTAl_AMOUNT = 14,     
     G_CCY          = 15,	 
     G_REMARK       = 16;
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
    //----------------    
 }
 //===============================================================

 function FormatGrid()
 {
		//------------
		data = "<%=CtlLib.SetListDataSQL("select a.pk, lpad('-',level ,'-')||a.grp_cd || ' - ' || a.grp_nm from tlg_it_itemgrp a where a.del_if = 0 and a.use_yn='Y' connect by prior a.pk = A.P_PK start with A.P_PK is null order siblings by grp_cd ")%>||";
    	lstGroup.SetDataText(data);
    	lstGroup.value = '';
		//------------
		data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||Select ALL";
		lstWHType.SetDataText(data);
		lstWHType.value = '';

		data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from TLG_in_warehouse where del_if = 0 and use_yn='Y' order by wh_id")%>";
		lstWarehouse.SetDataText( data + "||");
		lstWarehouse.value = '';
        //------------     
        grdDetail.GetGridControl().MergeCells  = 2 ;	
        grdDetail.GetGridControl().MergeCol(0) = true ;	
        grdDetail.GetGridControl().MergeCol(1) = true ;   	
        grdDetail.GetGridControl().MergeCol(2) = true ;	
		grdDetail.GetGridControl().MergeCol(3) = true ;	
		grdDetail.GetGridControl().MergeCol(4) = true ;	
        //------------
        var ctrl = grdDetail.GetGridControl();
        ctrl.ColFormat(G_PO_QTY)     	= "###,###,###.##" ;
        ctrl.ColFormat(G_IN_QTY)     	= "###,###,###.##" ;
        ctrl.ColFormat(G_UNIT_PRICE)    = "###,###,###" ;
        ctrl.ColFormat(G_ITEM_AMOUNT)   = "###,###,###" ;
        ctrl.ColFormat(G_TAX_AMOUNT)    = "###,###,###" ;
        ctrl.ColFormat(G_TOTAl_AMOUNT)  = "###,###,###" ;

 }

 //===============================================================
 
 function OnSearch(pos)
 {
    if(pos == 'Item')
    {
        data_bini00040.Call("SELECT");
    }
 }
 
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'data_bini00040' :
			    if ( grdDetail.rows > 1 )
		        {            		            		           
		            grdDetail.Subtotal( 0, 2, -1, '9!10!12!13!14');
		           
		        }    
            break;           	            
      }	 
 }
 //===============================================================
 
function OnReport()
{       	
	
	var url =System.RootURL + '/standard/reports/bi/ni/rpt_bini00040_1.aspx?p_wh_type=' + lstWHType.value + '&p_wh_pk=' + lstWarehouse.value + '&p_from_dt=' + dtFrom.value + '&p_to_dt=' + dtTo.value + '&p_po_vendor=' + txtPOVendor.text + '&p_itemgrp_pk=' + lstGroup.value + '&p_item=' + txtItem.text;
	window.open(url); 		
	
}
 //=================================================================
 
 function OnPopUp(pos)
 {
	switch(pos)
	{
		case 'REPORT':
			var path = System.RootURL + '/standard/forms/bi/ni/bini00041.aspx';       		
			var object = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:30;dialogHeight:20');				
		break;
	}
 }
 
 //=================================================================
</script>
<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
	<!---------------------------------------------------------------->
    <gw:data id="pro_bini00040" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="st_lg_pro_bini00040" >
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
    <gw:data id="data_bini00040" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bini00040" > 
                <input bind="grdDetail" >
					<input bind="lstWHType" />
					<input bind="lstWarehouse" />
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                
                    <input bind="txtPOVendor" />
					<input bind="lstGroup" />
                    <input bind="txtItem" />					 
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
	<table id="main" border="0" style="width: 100%; height: 100%" class="eco_line" cellpadding="0" cellspacing="0">
        <tr style="height: 7%" class="eco_bg">
            <td style="width: 100%" align="right">
                <table style="height:100%;" cellpadding="2" cellspacing="1">
					
                    <tr style="border:0;width:100%;height:7%" valign="center" class="eco_bg" >
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=13 width="13%" style="border:0"  align="left" >
							Warehouse
						</td>
						<td colspan=20 width="20%" style="border:0"  align="left" >
							 <gw:list id="lstWarehouse" styles='width:100%;' />
						</td>
						<td colspan=10 style="border:0" width="10%" align="center" >
							 Date
						</td>
						<td colspan=15 width="15%" style="border:0" align="right" >
							<gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" onchange="" />
						</td>
						<td colspan=15 width="15%" style="border:0" align="left" >
							<gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" onchange="" />
						</td>
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=10 width="10%" style="border:0" align="left" > 
						
						</td>
						<td colspan=10 width="10%" style="border:0" align="center" >
							<gw:button id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Item')" />
						</td>
						<td colspan=10 width="10%" style="border:0" align="left" >
							<gw:button id="ibtnReport" styles="" img="excel" alt="Report" text="Report" onclick="OnReport()" /> 
						</td>
					</tr>
                </table>
            </td>
        </tr>
        <tr style="height: 8%">
            <td style="width: 100%" class="eco_line_t">
                <table style="width: 100%; height: 100%" cellpadding="2" cellspacing="1" border="0">
					<tr style="border:0.5;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=12 width="12%" style="border:0"  align="left" >
							Item Name/Code
						</td>
						<td colspan=20 width="20%" style="border:0"  align="left" >
							 <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('Item')" />
						</td>
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=12 style="border:0" width="12%" align="left" >
							 Supplier
						</td>
						<td colspan=20 style="border:0" width="20%"  align="left" >
							<gw:textbox id="txtPOVendor" styles='width:100%' onenterkey="OnSearch('Item')" />
						</td>
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=10 width="10%" style="border:0" align="left" > 
							
						</td>
						<td colspan=20 width="20%" style="border:0"> 
							
						</td>
					</tr>
                    
                </table>
            </td>
        </tr>
        <tr style="height: 85%">
            <td class="eco_line_t">
                <gw:grid id='grdDetail' 
					header='W/H|Supplier|Date|Slip No|Seq|Ref No|Item Code|Item Name|UOM|P/O Qty|In Qty|U/Price|Item Amount|Tax Amount|Total Amount|CCY|Remark'
                    format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|1|0|1|0|0|0|1|3|3|3|3|3|3|1|0'
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='2000|2000|1200|1200|800|1500|1500|3000|800|1200|1200|1200|1500|1500|1500|800|1000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <gw:list id="lstWHType" styles='width:100%;display:none'  />
	<gw:list id="lstGroup" styles='width:100%;display:none' />
    <!-------------------------------------------------------------------------->
</body>
</html>
