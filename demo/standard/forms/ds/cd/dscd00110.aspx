<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>G/D PLAN CHECKING</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
    var G_PARTNER 	= 0,	     		 
        G_REF_NO 	= 1,                        
		G_SO_ITEM_NO= 2,
        G_ITEM_CODE = 3,
        G_ITEM_NAME = 4,
        G_UOM 		= 5,
		G_DATE 		= 6,
        G_PLAN_QTY 	= 7,
        G_LOT_NO 	= 8,
        G_OUT_QTY 	= 9,
        G_RETURN_QTY= 10,
        G_BAL_QTY 	= 11,         
        G_SO_D_PK 	= 12;
    //---------------------------------------------------------
    function BodyInit() 
	{        
	    System.Translate(document);
        dtFrom.SetDataText(System.AddDate(dtTo.GetData(), -7));
        
        OnFormatGrid();
    }
	 //------------------------------------------------------------------------------------------------
   function OnFormatGrid() 
	{ 		 
		grdDetail.GetGridControl().MergeCells  = 2 ;	
		grdDetail.GetGridControl().MergeCol(0) = true;
        grdDetail.GetGridControl().MergeCol(1) = true;
        grdDetail.GetGridControl().MergeCol(2) = true;
        grdDetail.GetGridControl().MergeCol(3) = true;
        grdDetail.GetGridControl().MergeCol(4) = true;
        grdDetail.GetGridControl().MergeCol(5) = true;
        grdDetail.GetGridControl().MergeCol(6) = true;
        grdDetail.GetGridControl().MergeCol(7) = true;
        grdDetail.GetGridControl().MergeCol(8) = true;
        grdDetail.GetGridControl().MergeCol(9) = true;
        grdDetail.GetGridControl().MergeCol(10) = true;
		
        var trl;

        trl = grdDetail.GetGridControl();
        trl.ColFormat(G_PLAN_QTY)   = "###,###,###,###,###";
        trl.ColFormat(G_OUT_QTY)    = "###,###,###,###,###";         
        trl.ColFormat(G_RETURN_QTY) = "###,###,###,###,###";
        trl.ColFormat(G_BAL_QTY)    = "###,###,###,###,###";
		
		//--------------------------------- 
    	data = "data|10|Grand Total|20|Partner|30|Ref No";
    	lstGridType.SetDataText(data);  
    	lstGridType.value = '10'; 
    }
    //---------------------------------------------------------   
    function OnSearch() 
	{
        data_dscd00110.Call('SELECT')
    }
    //---------------------------------------------------------
    function OnDataReceive(obj) 
	{
        switch (obj.id) 
		{
            case 'data_dscd00110':  
			 	if (grdDetail.rows > 1)
                {
                    grdDetail.SetCellBold( 1, G_SO_ITEM_NO, grdDetail.rows-1, G_SO_ITEM_NO, true);                
                    grdDetail.SetCellBold( 1, G_PLAN_QTY,   grdDetail.rows-1, G_PLAN_QTY,   true);   
					grdDetail.SetCellBold( 1, G_BAL_QTY,    grdDetail.rows-1, G_BAL_QTY,    true);  
					
					if ( lstGridType.value == '10' )
		        	{
		        		grdDetail.Subtotal( 0, 2, -1, '7!9!10!11');
		        	}
		        	else if ( lstGridType.value == '20' )
		        	{
		            	grdDetail.Subtotal( 0, 2, 0, '7!9!10!11');
		        	} 
					else if ( lstGridType.value == '30' )
		        	{
		            	grdDetail.Subtotal( 0, 2, 1, '7!9!10!11');
		        	}             
                }				                        
            break;
        }
    }
	//==================================================================================================
    function OnDateChange() 
	{
        var strRad = radSearchDate.GetData();

        switch (strRad) 
		{
            case 'a':
                dtFrom.SetDataText(System.AddDate(dtTo.GetData(), -7));
            break;
            case 'b':
                dtFrom.SetDataText(System.AddDate(dtTo.GetData(), -14));
            break;
            case 'c':
                dtFrom.SetDataText(System.AddDate(dtTo.GetData(), -30));
            break;
        }
    }
   
    //==================================================================================================
    function OnReport() 
	{
        var url = System.RootURL + "/standard/reports/ds/cd/rpt_dscd00110.aspx?p_from_dt=" + dtFrom.value + "&p_to_dt=" + dtTo.value + "&p_slip_cust=" + txtSlipCust.text + "&p_item=" + txtItem.text + "&p_bal_yn=" + chkDetail.value;
        System.OpenTargetPage(url); 
    }
	
</script>

<body>
	<!------------------------------------------------------------------>
    <gw:data id="data_dscd00110" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="st_lg_sel_dscd00110" > 
                <input>           
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
                    <input bind="txtSlipCust" />
                    <input bind="txtItem" />  
                    <input bind="chkDetail" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr id='top' style="height: 1%">
            
                        <td style="width: 5%" align="right">
                            Date
                        </td>                        
                        <td style="width: 25%; white-space: nowrap" align="left">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" styles="width=80%" />
                            ~                        
                            <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" styles="width=80%" />
                        </td>
                        <td style="width: 20%; background-color: #CCFFFF; white-space: nowrap" align="center" >
                            <gw:radio id="radSearchDate" value="a" styles="width:100%" onchange="OnDateChange()"> 
                                    <span value="a">1 Week</span> 
                                    <span value="b">2 Weeks</span> 
                                    <span value="c">1 Month</span> 
                            </gw:radio>
                        </td>
                        <td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 15%">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="center">
                            Slip/Cust
                        </td>
                        <td style="width: 15%" align="right">
                            <gw:textbox id="txtSlipCust" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 7%; white-space: nowrap" align="center">
                            Detail<gw:checkbox id="chkDetail" defaultvalue="Y|N" value="N" onchange="OnSearch()" />
                        </td>
                        
                        <td style="width: 1%"><gw:button img="excel" alt="Report" id="btnReport" onclick="OnReport()" /></td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Get Order" onclick="OnSearch()" />
                        </td>
                     	<td style="width: 1%"> 
							<gw:list id="lstGridType" styles='width:100;' />                            
                        </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="13">
                <gw:grid id='grdDetail' 
					header='Partner|Ref No|S/O Item No|Item Code|Item Name|UOM|Date|Plan Qty|Lot No|Out Qty|Return Qty|Bal Qty|_tsa_saleorder_d_pk'
                    format='0|0|0|0|0|0|4|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|1|1|3|1|3|3|3|0'
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='2500|1500|1500|1500|3500|800|1200|1500|1500|1500|1500|1500|0'
					acceptnulldate="T"
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>     
</body>
</html>
