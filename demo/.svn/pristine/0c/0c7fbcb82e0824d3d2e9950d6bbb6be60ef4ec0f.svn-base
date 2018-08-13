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
   

 var G_INDATE		= 0,
     G_SLIP_NO		= 1,
     G_REF_NO		= 2,
     G_SEQ			= 3,
     G_ITEM_CODE	= 4,
     G_ITEM_NAME	= 5,
	 G_EX_ITEM_CODE = 6,
	 G_EX_ITEM_NAME = 7,
     G_OUT_QTY		= 8,
     G_OUT_UOM		= 9,
     G_EX_QTY		= 10,
     G_EX_UOM		= 11,
	 G_OUT_LOT_NO   = 12,
	 G_EX_LOT_NO	= 13,
	 G_WH_NAME	    = 14,
	 G_PLC_NM		= 15,
	 G_DESCRIPTION	= 16;

  
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
        lstExWH.SetDataText(data);
        lstExWH.value = '' ;    
		
        data = "data|10|Type 1";
        lstReportType.SetDataText(data);  
        lstReportType.value = '10'; 

        data = "data|10|Grand Total|20|Date Subtotal";
        lstGridType.SetDataText(data);  
        lstGridType.value = '10'; 
             
        grdItem.GetGridControl().MergeCells  = 2 ;	
        grdItem.GetGridControl().MergeCol(0) = true ;	
        grdItem.GetGridControl().MergeCol(1) = true ;   	
        grdItem.GetGridControl().MergeCol(2) = true ;	
        grdItem.GetGridControl().MergeCol(3) = true ;
        //------------
        var ctrl = grdItem.GetGridControl();
        ctrl.ColFormat(G_OUT_QTY)	 = "###,###,###.###" ;
        ctrl.ColFormat(G_EX_QTY)     = "###,###,###.###" ;
 }

 //===============================================================
 
 function OnSearch(pos)
 {
    switch(pos)
    {
        case 'Detail':
            data_bias00080.Call("SELECT");
        break;     
    }
 }
 
 //===============================================================
 function OnDataReceive(obj)
 {
      switch (obj.id)         
      {
            case 'data_bias00080' :
			    if ( grdItem.rows > 1 )
		        {      
		            grdItem.SetCellBold( 1, G_ITEM_CODE		,    grdItem.rows-1, G_ITEM_CODE	,    true);
		            grdItem.SetCellBold( 1, G_EX_ITEM_CODE  ,    grdItem.rows-1, G_EX_ITEM_CODE ,    true);      
		            grdItem.SetCellBold( 1, G_OUT_QTY		,	 grdItem.rows-1, G_OUT_QTY		,	 true);
		            grdItem.SetCellBold( 1, G_EX_QTY		,    grdItem.rows-1, G_EX_QTY		,    true); 
		            grdItem.SetCellBold( 1, G_WH_NAME		,    grdItem.rows-1, G_WH_NAME		,    true);
		            
					for ( var i=1; i<grdItem.rows; i++ )
					{
						// OUT
						grdItem.SetCellBgColor( i, G_ITEM_CODE	, i, G_ITEM_CODE	, 0xCCFFFF ); 
						grdItem.SetCellBgColor( i, G_ITEM_NAME	, i, G_ITEM_NAME	, 0xCCFFFF );
						grdItem.SetCellBgColor( i, G_OUT_QTY	, i, G_OUT_QTY		, 0xCCFFFF );
						grdItem.SetCellBgColor( i, G_OUT_UOM	, i, G_OUT_UOM		, 0xCCFFFF );
						grdItem.SetCellBgColor( i, G_OUT_LOT_NO	, i, G_OUT_LOT_NO	, 0xCCFFFF );
						// EX
						grdItem.SetCellBgColor( i, G_EX_ITEM_CODE	, i, G_EX_ITEM_CODE	, 0xCCEEFF ); 
						grdItem.SetCellBgColor( i, G_EX_ITEM_NAME	, i, G_EX_ITEM_NAME	, 0xCCEEFF );
						grdItem.SetCellBgColor( i, G_EX_QTY			, i, G_EX_QTY		, 0xCCEEFF );
						grdItem.SetCellBgColor( i, G_EX_UOM			, i, G_EX_UOM		, 0xCCEEFF );
						grdItem.SetCellBgColor( i, G_EX_LOT_NO		, i, G_EX_LOT_NO	, 0xCCEEFF );
					} 

		            if ( lstGridType.value == '10' )
		            {
		                grdItem.Subtotal( 0, 2, -1, '8!10');
		            }
		            else if ( lstGridType.value == '20' )
		            {
		                grdItem.Subtotal( 0, 2, 0, '8!10');
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
            var url =System.RootURL + '/reports/bi/as/rpt_bias00080.aspx?p_ex_warehouse_pk='+ lstExWH.value +'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_ref_no_pl='+txtRefNoPL.text+'&p_out_item='+txtItem.text+'&p_ex_item='+txtExItem.text;
            window.open(url);                
        break;  
        
        case '20' :   
         /*    var url =System.RootURL + '/reports/ep/fm/rpt_epfm00021.aspx?p_tin_warehouse_pk='+ lstOutWH.value +'&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value;
            window.open(url);   */              
        break;              
        
        case '30' :   
         /*    var url =System.RootURL + '/reports/ep/fm/rpt_epfm00022.aspx?p_tin_warehouse_pk='+ lstOutWH.value + '&p_from_date='+ dtFrom.value +'&p_to_date='+ dtTo.value +'&p_po_vendor='+ txtRefNoPL.text+'&p_item='+txtItem.text+'&p_tin_warehouse_name='+lstOutWH.GetText();
            window.open(url);    */             
        break; 
    }     
} 
 //===============================================================

</script>

<body>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_bias00080" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bias00080" > 
                <input bind="grdItem" >                    
				    <input bind="dtFrom" />
                    <input bind="dtTo" />                
                    <input bind="txtRefNoPL" />
                    <input bind="txtItem" />
					<input bind="txtExItem" />
					<input bind="lstExWH" />
                </input>
                <output bind="grdItem" />
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
                            Ref No/PL
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:textbox id="txtRefNoPL" styles='width:100%' onenterkey="OnSearch('Detail')" />
                        </td>
						
						<td style="width: 5%;white-space:nowrap" align="right">
                            Ex W/H
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:list id="lstExWH" styles="width:100%" csstype="mandatory" onchange="OnSearch('Detail')" />
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
                            
                        </td>
						
                        <td style="width: 5%; white-space: nowrap" align="right">
                           Out Item
                        </td>
                        <td style="width: 20%; white-space: nowrap"  >
							<gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('Detail')" /> 
                        </td>
                       
					    <td style="width: 5%; white-space: nowrap" align="right">
                             Ex Item
                        </td>
                        <td style="width: 20%; white-space: nowrap"  >
                            
							<gw:textbox id="txtExItem" styles="width:100%" onenterkey="OnSearch('Detail')" />
                        </td>
						
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Sub Total
                        </td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:list id="lstGridType" styles='width:100%;' onchange="OnSearch('Detail')" />
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
				<gw:grid id='grdItem'
				header='Ex Date|Slip No|Ref No|Seq|Out Item Code|Out Item Name|Ex Item Code|Ex Item Name|Out Qty|Out UOM|Ex Qty|Ex UOM|Out Lot No|Ex Lot No|WH Name|P/L NM|Description'
				format='4|0|0|0|0|0|0|0|1|0|1|0|0|0|0|0|0'
				aligns='0|1|0|1|0|0|0|0|0|1|0|1|0|0|0|0|0'
				check='||||||||||||||||'
				editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
				widths='1200|1000|1000|800|1500|2000|1500|2000|1200|850|1000|850|1200|1200|2000|1200|1000'
				sorting='T'
				styles='width:100%; height:100%'
				/>             
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
</body>
</html>
