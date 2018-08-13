<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml"> 
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Stock Imcoming Checking</title>
</head>

<script>

 var G_WH       = 0,
     G_IN_DATE  = 1,
     G_SLIP_NO  = 2,
	 G_IN_TYPE  = 3,
     G_REF_NO   = 4,
     G_SEQ      = 5,
     G_ITEM_CODE= 6,
     G_ITEM_NAME= 7,     
     G_IN_UOM   = 8,
	 G_LOT_NO	= 9,
	 G_IN_QTY   = 10,
     G_UPRICE   = 11,
     G_ITEM_AMT = 12,
     G_VAT_RATE = 13,
     G_VAT_AMT  = 14,
     G_TOTAL_AMT= 15,
     G_CYY      = 16,
     G_SEL_CCY  = 17,
     G_SUPPLIER = 18,
     G_PL       = 19,
	 G_CHARGER  = 20,
     G_REMARK   = 21;
  
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
    OnChangeCurr();
	OnChangeTab('radType');
	 
    //pro_bini00020_2.Call();
   
 }
 //===============================================================

 function FormatGrid()
 {
         //----------------
        var data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 and use_yn='Y' order by wh_id ")%>||Select ALL";   
        lstWH.SetDataText(data);
        lstWH.value = '' ;
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||Select ALL";    
        lstWHType.SetDataText(data);
		lstWHType.value = '' ;
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
        lstCurrency.SetDataText(data);
        lstCurrency.value = "USD";    

        data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGIN0301') FROM DUAL" )%>||SELECT ALL";    
        lstInType.SetDataText(data);
		lstInType.value = "";

        data = "<%=CtlLib.SetListDataSQL("select v.CHA_VALUE2,v.CODE_NM from vlg_code v where v.group_id='LGCM0050' and v.CHA_VALUE1='bini00020' and v.NUM_VALUE2=1 order by nvl(v.NUM_VALUE1,0)")%>";
        lstReportType.SetDataText(data);
    
       

        data = "data|10|Grand Total|20|W/H Subtotal|30|W/H-Date Subtotal|40|Slip Subtotal";
        lstGridType.SetDataText(data);  
        lstGridType.value = '10'; 
        
		data = "<%=CtlLib.SetListDataSQL("select a.pk, lpad('-',level ,'-')||a.grp_cd || ' - ' || a.grp_nm from tlg_it_itemgrp a where a.del_if = 0 and a.use_yn='Y'  connect by prior a.pk = A.P_PK start with A.P_PK is null order siblings by grp_cd ")%>||";
    	lstGroup.SetDataText(data);
    	lstGroup.value = '';
		
        grdItem.GetGridControl().MergeCells  = 2 ;	
        grdItem.GetGridControl().MergeCol(0) = true ;	
        grdItem.GetGridControl().MergeCol(1) = true ;   	
        grdItem.GetGridControl().MergeCol(2) = true ;	
        grdItem.GetGridControl().MergeCol(3) = true ;
        //------------
        var ctrl = grdItem.GetGridControl();
		
        ctrl.ColFormat(G_IN_QTY)    = "###,###,###.###" ;
        ctrl.ColFormat(G_UPRICE)    = "###,###,###.###" ;
        ctrl.ColFormat(G_ITEM_AMT)  = "###,###,###.###" ;
        ctrl.ColFormat(G_VAT_RATE)  = "###,###,###.###" ;
        ctrl.ColFormat(G_VAT_AMT)   = "###,###,###.###" ;
        ctrl.ColFormat(G_TOTAL_AMT) = "###,###,###.###" ;
        ctrl.ColFormat(G_SEL_CCY )  = "###,###,###.###" ;
        
		grdItem.GetGridControl().Cell( 7 , 0 , G_SEL_CCY , 0, G_SEL_CCY ) = 0x3300cc; 
		
 }

 //===============================================================
 
 function OnSearch(pos)
 {
    switch(radType.value)
    {
        case 'Item':
            data_bini00020.Call("SELECT");
        break;
        
        case 'Group':
            grdGroup.GridRefresh();
			grdGroup.SetGridText(0,G_SEL_CCY+1,lstCurrency.value +" Amt");
			
            data_bini00020_1.Call("SELECT");
        break;        
    }
 }
 
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'data_bini00020' :
			    if ( grdItem.rows > 1 )
		        {      
		            grdItem.SetCellBold( 1, G_WH,        grdItem.rows-1, G_WH,        true);
		            grdItem.SetCellBold( 1, G_REF_NO,    grdItem.rows-1, G_REF_NO,    true);      
		            grdItem.SetCellBold( 1, G_ITEM_CODE, grdItem.rows-1, G_ITEM_CODE, true);
		            grdItem.SetCellBold( 1, G_IN_QTY,    grdItem.rows-1, G_IN_QTY,    true); 
		            grdItem.SetCellBold( 1, G_ITEM_AMT,  grdItem.rows-1, G_ITEM_AMT,  true);
		            grdItem.SetCellBold( 1, G_TOTAL_AMT, grdItem.rows-1, G_TOTAL_AMT, true);
		            grdItem.SetCellBold( 1, G_SEL_CCY,   grdItem.rows-1, G_SEL_CCY,   true);
		           
                    grdItem.GetGridControl().Cell( 7 , 1 , G_SEL_CCY , grdItem.rows-1, G_SEL_CCY ) = 0x3300cc;                        
                    
		            if ( lstGridType.value == '10' )
		            {
		                grdItem.Subtotal( 0, 2, -1, '10!12!14!15!17');
		            }
		            else if ( lstGridType.value == '20' )
		            {
		                grdItem.Subtotal( 0, 2, 0, '10!12!14!15!17');
		            }
		            else if ( lstGridType.value == '30' )
		            {
		                grdItem.Subtotal( 0, 2, 1, '10!12!14!15!17');
		            } 	
                    else if ( lstGridType.value == '40' )
		            {
		                grdItem.Subtotal( 0, 2, 2, '10!12!14!15!17');
		            } 	
		            
		            //data_bini00020_1.Call("SELECT");
		        }    
            break;            	            
      }	 
 }
 //===============================================================
 
function OnReport()
{    
    var url =System.RootURL + '/standard/reports/bi/ni/'+lstReportType.value+'?p_tin_warehouse_pk='+ lstWH.value +'&p_whtype='+lstWHType.value+'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_ref_no_vendor='+url_encode(txtRefNoSupplier.text)+'&p_item='+url_encode(txtItem.text)+'&lstGridType='+lstGridType.value;
            window.open(url);  
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
 function OnChangeCurr()
 {
    	grdItem.SetGridText(0,G_SEL_CCY,lstCurrency.value +" Amt")
    	grdGroup.SetGridText(0,G_SEL_CCY+1,lstCurrency.value +" Amt")
 }
 //===============================================================
 
 function OnCheckDate()
 {
 	if ( chkDate.value == 'N' )
	{
		dtFrom.SetEnable(false);
		dtTo.SetEnable(false);
	}
	else
	{
		dtFrom.SetEnable(true);
		dtTo.SetEnable(true);	
	}
 }
 //===============================================================
 function url_encode(s) 
{
	string = s.replace(/\r\n/g,"\n");
	var utftext = "";

	for (var n = 0; n < string.length; n++) 
	{

		var c = string.charCodeAt(n);

		if (c < 128) 
		{
			utftext += String.fromCharCode(c);
		}
		else if ((c > 127) && (c < 2048)) 
		{
			utftext += String.fromCharCode((c >> 6) | 192);
			utftext += String.fromCharCode((c & 63) | 128);
		}
		else 
		{
			utftext += String.fromCharCode((c >> 12) | 224);
			utftext += String.fromCharCode(((c >> 6) & 63) | 128);
			utftext += String.fromCharCode((c & 63) | 128);
		}
	}
	return escape(utftext);
}

//====================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
		case 'POP':		 
            var path = System.RootURL + '/standard/forms/bi/ni/bini00010.aspx' ;
			var obj = System.OpenModal( path ,950 , 550 ,  'resizable:yes;status:yes');           
        break; 
	}
}		
//====================================================================================
</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
    <!-------------------------------------------------------------------------->
    <gw:data id="data_bini00020" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bini00020" > 
                <input bind="grdItem" >
                    <input bind="lstWHType" />
                    <input bind="lstWH" />
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                
                    <input bind="txtRefNoSupplier" />
					<input bind="lstGroup" />
                    <input bind="txtItem" />
                    <input bind="lstCurrency" />
					<input bind="lstInType" />
					<input bind="chkDate" />
                </input>
                <output bind="grdItem" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_bini00020_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bini00020_1" > 
                <input bind="grdGroup" >
                    <input bind="lstWHType" />
                    <input bind="lstWH" />
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                
                    <input bind="txtRefNoSupplier" />
					<input bind="lstGroup" />
                    <input bind="txtItem" />
                    <input bind="lstCurrency" />
					<input bind="lstInType" />
					<input bind="chkDate" />
                </input>
                <output bind="grdGroup" />
            </dso>
        </xml>
    </gw:data>
     <!---------------------------------------------------------------->
    <gw:data id="pro_bini00020_2" onreceive=""> 
        <xml> 
            <dso  type="list" procedure="st_lg_pro_bini00020" > 
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
    <table id="main" border="0" style="width: 100%; height: 100%" class="eco_line" cellpadding="0" cellspacing="0">
        <tr style="height: 7%" class="eco_bg">
            <td style="width: 100%">
                <table style="height:100%;" cellpadding="2" cellspacing="1">
                    <tr style="border:0;width:100%;height:7%" >
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=13 width="13%" style="border:0"  align="left" >
							Warehouse
						</td>
						<td colspan=20 width="20%" style="border:0"  align="left" >
							 <gw:list id="lstWH" styles="width:100%;" />
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
							<gw:button id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('Detail')" />
						</td>
						<td colspan=10 width="10%" style="border:0" align="left" >
							<gw:button id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport()" />
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
							 <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('Detail')" />
						</td>
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=12 style="border:0" width="12%" align="left" >
							 Supplier
						</td>
						<td colspan=20 style="border:0" width="20%"  align="left" >
							<gw:textbox id="txtRefNoSupplier" styles='width:100%' onenterkey="OnSearch('Detail')" />
						</td>
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=10 width="10%" style="border:0" align="left" > 
							Sub Total
						</td>
						<td colspan=20 width="20%" style="border:0"> 
							<gw:list id="lstGridType" styles='width:100%;' />
						</td>
					</tr>
                    <tr style="border:0.5;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=12 width="12%" style="border:0"  align="left" >
							
						</td>
						<td colspan=20 width="20%" style="border:0"  align="left" >
							 <gw:radio id="radType" value="Item" styles="width:100%" onchange="OnChangeTab('radType')"> 
                                <span value="Item"  id="tab_Item">Item</span> 
                                <span value="Group" id="tab_Group">Group</span> 
                            </gw:radio>
						</td>
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=12 style="border:0" width="12%" align="left" >
							In-Type
						</td>
						<td colspan=20 style="border:0" width="20%"  align="left" >
							<gw:list id="lstInType" styles="width:100%" onchange="" />
						</td>
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=10 width="10%" style="border:0" align="left" > 
							Currentcy
						</td>
						<td colspan=20 width="20%" style="border:0"> 
							<gw:list id="lstCurrency" styles='width:100%' onchange="OnChangeCurr()" />
						</td>
					</tr>
                </table>
            </td>
        </tr>
        <tr style="height: 85%">
            <td class="eco_line_t">
                <gw:grid id='grdItem' header='W/H|In Date|Slip No|In Type|Ref No|Seq|Item Code|Item Name|UOM|Lot No|In Qty|U/P|Amount|VAT(%)|VAT Amt|Total Amt|CCY|-|Supplier|P/L|Charger|Remark'
                    format='0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|1|0|0|0|1|0|0|1|1|3|3|3|3|3|3|1|3|0|0|0|0'
                    check='|||||||||||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='2000|1200|1200|1200|1200|800|1500|2500|800|1200|1200|1200|1200|1200|1200|1200|800|1200|2000|2000|1500|1000'
                    sorting='T' styles='width:100%; height:100%' />
                    
                <gw:grid id='grdGroup' header='W/H|In Date|Slip No|In Type|Ref No|Seq|Item Code|Item Name|UOM|Lot No|In Qty|U/P|Amount|VAT(%)|VAT Amt|Total Amt|CCY|-|Supplier|P/L|Charger|Remark'
                    format='0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|1|0|0|0|1|0|0|1|1|3|3|3|3|3|3|1|3|0|0|0|0'
                    check='|||||||||||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='2000|1200|1200|1200|1200|800|1500|2500|800|1200|1200|1200|1200|1200|1200|1200|800|1200|2000|2000|1500|1000'
                    sorting='T' styles='width:100%; height:100%'  group="T" />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
	<gw:checkbox id="chkDate" styles="color:blue;display:none" defaultvalue="Y|N" value="Y" onclick="OnCheckDate()"/>
	<gw:list id="lstGroup" styles='width:100%;display:none' />
	<gw:list id="lstWHType" styles="width:100%;display:none" />
	<gw:list id="lstReportType" styles='width:100%;display:none' />
</body>
</html>
