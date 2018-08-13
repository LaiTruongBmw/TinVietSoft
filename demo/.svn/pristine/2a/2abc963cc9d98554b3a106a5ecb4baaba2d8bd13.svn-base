<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>Goods Delivery Checking</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
    var G_PARTNER 	= 0,
	    G_ORDER_DT 	= 1,
		G_SLIP_NO 	= 2,
        G_PO_NO 	= 3,                        
		G_SEQ		= 4,
        G_ITEM_CODE = 5,
        G_ITEM_NAME = 6,
        G_CUST_ITEM = 7,
        G_ORD_UOM 	= 8,
		G_ITEM_ETD 	= 9,
        G_ORD_QTY 	= 10,         
        G_OUT_QTY 	= 11,         
        G_DELI_BAL 	= 12,		 
        G_DAYS_LEFT = 13,
        G_SO_D_PK 	= 14,
		G_DATE_01 	= 15,
		G_QTY_01 	= 16,
		G_DATE_02 	= 17,
		G_QTY_02	= 18,
		G_DATE_03 	= 19,
		G_QTY_03 	= 20,
		G_DATE_04 	= 21,
		G_QTY_04 	= 22,
		G_DATE_05 	= 23,
		G_QTY_05 	= 24,
		G_DATE_06 	= 25,
		G_QTY_06 	= 26,
		G_DATE_07 	= 27,
		G_QTY_07 	= 28;		
		
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
		var sData = "";
        sData = "DATA|O|Order Date|E|ETD";
        idList.SetDataText(sData);
        idList.value = 'O';

		sData = "DATA|1|Days Left < 3|2|Days Left >= 3 & < 10||";
        lstType.SetDataText(sData);
        lstType.value = '';
						 
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
        trl.ColFormat(G_ORD_QTY)  = "###,###,###,###,###.##";         
        trl.ColFormat(G_OUT_QTY)  = "###,###,###,###,###.##";     
        trl.ColFormat(G_DELI_BAL) = "###,###,###,###,###.##";
		trl.ColFormat(G_QTY_01)   = "###,###,###,###,###.##";
		trl.ColFormat(G_QTY_02)   = "###,###,###,###,###.##";
		trl.ColFormat(G_QTY_03)   = "###,###,###,###,###.##";
		trl.ColFormat(G_QTY_04)   = "###,###,###,###,###.##";
		trl.ColFormat(G_QTY_05)   = "###,###,###,###,###.##";
		trl.ColFormat(G_QTY_06)   = "###,###,###,###,###.##";
		trl.ColFormat(G_QTY_07)   = "###,###,###,###,###.##";
				 
		grdDetail.GetGridControl().Cell( 7, 0, G_DELI_BAL,  0, G_DELI_BAL  ) = 0x3300cc;							
    }
    //---------------------------------------------------------   
     function OnSearch() 
	{
        data_dscd00100.Call('SELECT')
    }
    //---------------------------------------------------------
    function OnDataReceive(obj) 
	{
        switch (obj.id) 
		{
            case 'data_dscd00100':  
			 	if (grdDetail.rows > 1)
                {
                    grdDetail.SetCellBold( 1, G_PO_NO,    grdDetail.rows-1, G_PO_NO,    true);                
                    grdDetail.SetCellBold( 1, G_ORD_QTY,  grdDetail.rows-1, G_ORD_QTY,  true);   
					grdDetail.SetCellBold( 1, G_DELI_BAL, grdDetail.rows-1, G_DELI_BAL, true);  
					
					grdDetail.SetCellBgColor( 1, G_DATE_01, grdDetail.rows - 1, G_QTY_01, 0xFFFFCC );   
					grdDetail.SetCellBgColor( 1, G_DATE_02, grdDetail.rows - 1, G_QTY_02, 0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G_DATE_03, grdDetail.rows - 1, G_QTY_03, 0xFFFFCC );  
					grdDetail.SetCellBgColor( 1, G_DATE_04, grdDetail.rows - 1, G_QTY_04, 0xCCFFFF ); 
					grdDetail.SetCellBgColor( 1, G_DATE_05, grdDetail.rows - 1, G_QTY_05, 0xFFFFCC );
					grdDetail.SetCellBgColor( 1, G_DATE_06, grdDetail.rows - 1, G_QTY_06, 0xCCFFFF );    
					grdDetail.SetCellBgColor( 1, G_DATE_07, grdDetail.rows - 1, G_QTY_07, 0xFFFFCC );
					
					grdDetail.SetCellFontColor( 1, G_DATE_01, grdDetail.rows - 1, G_DATE_01, 0xFF3300);
					grdDetail.SetCellFontColor( 1, G_DATE_02, grdDetail.rows - 1, G_DATE_02, 0xFF3300);
					grdDetail.SetCellFontColor( 1, G_DATE_03, grdDetail.rows - 1, G_DATE_03, 0xFF3300);
					grdDetail.SetCellFontColor( 1, G_DATE_04, grdDetail.rows - 1, G_DATE_04, 0xFF3300);
					grdDetail.SetCellFontColor( 1, G_DATE_05, grdDetail.rows - 1, G_DATE_05, 0xFF3300);
					grdDetail.SetCellFontColor( 1, G_DATE_06, grdDetail.rows - 1, G_DATE_06, 0xFF3300);
					grdDetail.SetCellFontColor( 1, G_DATE_07, grdDetail.rows - 1, G_DATE_07, 0xFF3300);
					   
                }
				        
                for (i = 1; i < grdDetail.rows; i++) 
				{                     					
                    if ( grdDetail.GetGridData(i, G_DAYS_LEFT) < 3 && Number(grdDetail.GetGridData(i, G_DELI_BAL)) > 0 ) 
					{
                        grdDetail.SetCellFontColor(i, G_SEQ, i, G_DELI_BAL, 0x3300cc);
                    }
                    else if ( grdDetail.GetGridData(i, G_DAYS_LEFT) >= 3 && grdDetail.GetGridData(i, G_DAYS_LEFT) < 10 && Number(grdDetail.GetGridData(i, G_DELI_BAL)) > 0 ) 
					{
                        grdDetail.SetCellFontColor(i, G_SEQ, i, G_DELI_BAL, 0xFF0000);
                    }
                    else if ( Number(grdDetail.GetGridData(i, G_DELI_BAL)) < 0 ) 
					{
                        grdDetail.SetCellFontColor(i, G_SEQ, i, G_DELI_BAL, 0xFF00FF);
                    }
                    else 
					{
                        grdDetail.SetCellFontColor(i, G_SEQ, i, G_DELI_BAL, 0x000000);
                    } 
				}
				
				grdDetail.Subtotal( 0, 2,-1, '10!11!12'); 
				
            break;
        }
    }	 
    //==================================================================================
	
	function OnPopUp(pos)
	{
		switch(pos)
	    {
			case 'Report':				 
			    var path = System.RootURL + '/standard/forms/ds/cd/dscd00101.aspx';
			    var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);		 	         
			break;
		}	
	}
	
	//==================================================================================
	function OnReport(pos)
	{
	    switch(pos)
	    {
			 
	        case '1':
	            var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00100.aspx?date_type=' + idList.value + '&from_dt=' + dtFrom.value + '&to_dt=' + dtTo.value + '&slip_cust=' + txtSlipCust.text + '&item=' + txtItem.text + '&chkBal=' + chkBal.value + '&chkReq=' + chkReq.value + '&type=' + lstType.value;
		        window.open(url, "_blank"); 
	        break;
			
			case '2':
	            var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00101.aspx?date_type=' + idList.value + '&from_dt=' + dtFrom.value + '&to_dt=' + dtTo.value + '&slip_cust=' + txtSlipCust.text + '&item=' + txtItem.text + '&chkBal=' + chkBal.value + '&type=' + lstType.value;
		        window.open(url, "_blank"); 
	        break;
						         
	    }
	}	 
    
	
	//==================================================================================================
	
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
	//==================================================================================================
	
</script>

<body>
	<!------------------------------------------------------------------>
    <gw:data id="data_dscd00100" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_dscd00100" > 
                <input> 
                    <input bind="idList" /> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
                    <input bind="txtSlipCust" />
                    <input bind="txtItem" />  
                    <input bind="chkBal" /> 
					<input bind="chkReq" /> 
					<input bind="lstType" />              					 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" >
        <tr id='top' style="height: 1%">            
                        <td style="width: 10%" align="right">
                            <gw:list id="idList" styles="color:blue;width:100%" value="O" onchange="OnSearch()" />
                        </td>                        
                        <td style="width: 20%; white-space: nowrap" align="left">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" styles="width=80%" />
                            ~                        
                            <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" styles="width=80%" />
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
						<td style="width: 5%" align="right">
                            Type
                        </td>
                        <td style="width: 15%" colspan=5 >
                            <gw:list id="lstType" styles="color:purple;width:100%" value="O" onchange="OnSearch()" />
                        </td> 						
                        <td style="width: 8%; white-space: nowrap" align="center">
                            Bal<gw:checkbox id="chkBal" defaultvalue="Y|N" value="Y" onchange="OnSearch()" /> 
							Req<gw:checkbox id="chkReq" defaultvalue="Y|N" value="N" onchange="OnSearch()" /> 
                        </td>						                         
                        <td style="width: 1%" align="right">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Get Order" onclick="OnSearch()" />
                        </td>  
						<td style="width: 1%" align="right">
                            <gw:button id="btnExcel" img="excel" alt="Report" text="Reports" onclick="OnPopUp('Report')" />
                        </td>                  
        </tr>       
        <tr style="height: 99%">
            <td colspan="15">
                <gw:grid id='grdDetail' 
					header='Partner|Order DT|Slip No|P/O No|Seq|Item Code|Item Name|Cust Item Name|UOM|ETD|Ord Qty|Out Qty|Deli Bal|Days left|_tsa_saleorder_d_pk|Date|Qty|Date|Qty|Date|Qty|Date|Qty|Date|Qty|Date|Qty|Date|Qty'
                    format='0|4|0|0|0|0|0|0|0|4|0|0|0|0|0|4|0|4|0|4|0|4|0|4|0|4|0|4|0' 
					aligns='0|1|0|0|1|0|0|0|1|1|3|3|3|1|0|1|3|1|3|1|3|1|3|1|3|1|3|1|3'
                    check='||||||||||||||||||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='2500|1200|1200|1500|800|1500|2500|2000|800|1200|1200|1200|1200|1000|0|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200'
					acceptnulldate="T"
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <gw:textbox id="txt_SO_D_PK" styles="width:100%; display:none"/>
	<gw:textbox id="txt_Ref_No" styles="width:100%; display:none"/>
</body>
</html>
