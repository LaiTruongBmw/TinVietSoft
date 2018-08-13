<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Status</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
    var G_ITEM_PK			= 0,
		G_GRP_NM			= 1,
		G_ITEM_CODE			= 2,
		G_ITEM_NAME			= 3,
		G_UOM				= 4,
		G_PR_REQ_QTY		= 5,
		G_PR_BOOK_QTY		= 6,
		G_PR_REQ_BAL		= 7,
		G_PO_QTY			= 8,
		G_INCOME_QTY		= 9,
		G_PO_BAL			= 10,
		G_STOCK_QTY			= 11,
		G_STOCK_BOOK_QTY	= 12,
		G_STOCK_BAL			= 13,
		G_ORDER_PO_QTY		= 14,
		G_MIN_QTY			= 15,
		G_ORDER_MIN_QTY		= 16;
    //---------------------------------------------------------
    function BodyInit() 
	{
        System.Translate(document);        

        OnFormatGrid();
    }
    //------------------------------------------------------------------------------------------------
    function OnFormatGrid() 
	{         
		var p_group_type = "<%=Request.querystring("group_type")%>";
	
		var data = "";  
    
		data = "<%=CtlLib.SetListDataSQLPara("select a.pk, lpad('-',level ,'-')||a.grp_cd || ' - ' || a.grp_nm from tlg_it_itemgrp a where a.del_if = 0 and a.use_yn='Y' and ( SALE_YN ={0} or PUR_YN ={1} or PROD_YN ={2} or SEMI_PROD_YN ={3} or MAT_YN ={4} or SUB_MAT_YN = {5}  ) connect by prior a.pk = A.P_PK start with A.P_PK is null order siblings by grp_cd ", Request.querystring("group_type")) %>||";     
		lstGroup.SetDataText(data);   
		lstGroup.value="";
	
        grdDetail.GetGridControl().MergeCells = 2;
        grdDetail.GetGridControl().MergeCol(0) = true;
        grdDetail.GetGridControl().MergeCol(1) = true;
        grdDetail.GetGridControl().MergeCol(2) = true;
        grdDetail.GetGridControl().MergeCol(3) = true;

        var trl;

        trl = grdDetail.GetGridControl();
        trl.ColFormat(G_PR_REQ_QTY) 	= "###,###,###,###,###.##";
        trl.ColFormat(G_PR_BOOK_QTY) 	= "###,###,###,###,###.##";
        trl.ColFormat(G_PR_REQ_BAL) 	= "###,###,###,###,###.##";
        trl.ColFormat(G_PO_QTY) 		= "###,###,###,###,###.##";
        trl.ColFormat(G_INCOME_QTY) 	= "###,###,###,###,###.##";
        trl.ColFormat(G_PO_BAL) 		= "###,###,###,###,###.##";
        trl.ColFormat(G_STOCK_QTY) 		= "###,###,###,###,###.##";
		trl.ColFormat(G_STOCK_BOOK_QTY) = "###,###,###,###,###.##";
		trl.ColFormat(G_STOCK_BAL) 		= "###,###,###,###,###.##";
		trl.ColFormat(G_ORDER_PO_QTY) 	= "###,###,###,###,###.##";
		trl.ColFormat(G_MIN_QTY) 		= "###,###,###,###,###.##";
		trl.ColFormat(G_ORDER_MIN_QTY) 	= "###,###,###,###,###.##";

        grdDetail.GetGridControl().Cell(7, 0, G_ORDER_PO_QTY,  0, G_ORDER_PO_QTY  ) = 0x3300cc;
        grdDetail.GetGridControl().Cell(7, 0, G_ORDER_MIN_QTY, 0, G_ORDER_MIN_QTY ) = 0x3300cc;
    }
    //---------------------------------------------------------   
    function OnSearch() 
	{
        data_fpab00730.Call('SELECT')
    }
    //---------------------------------------------------------
    function OnDataReceive(obj) 
	{
        switch (obj.id) 
		{
            case 'data_fpab00730':
			
                if (grdDetail.rows > 1) 
				{
                    grdDetail.SetCellBold( 1, G_ITEM_CODE, 	 	grdDetail.rows-1, G_ITEM_CODE,    	true);
                   
					grdDetail.SetCellBold( 1, G_PR_REQ_BAL,  	grdDetail.rows-1, G_PR_REQ_BAL, 	true);
					grdDetail.SetCellBold( 1, G_PO_BAL,  		grdDetail.rows-1, G_PO_BAL,  	 	true);
					grdDetail.SetCellBold( 1, G_STOCK_BAL,  	grdDetail.rows-1, G_STOCK_BAL, 	 	true);
					grdDetail.SetCellBold( 1, G_ORDER_MIN_QTY,  grdDetail.rows-1, G_ORDER_MIN_QTY,  true);					

					grdDetail.SetCellBgColor( 1, G_PR_REQ_QTY,  	grdDetail.rows - 1, G_PR_REQ_BAL,   	0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G_PO_QTY, 			grdDetail.rows - 1, G_PO_BAL, 			0xFFFFCC );	
					grdDetail.SetCellBgColor( 1, G_STOCK_QTY,   	grdDetail.rows - 1, G_STOCK_BAL,    	0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G_ORDER_PO_QTY, 	grdDetail.rows - 1, G_ORDER_MIN_QTY, 	0xFFFFCC );
                }

                for (i = 1; i < grdDetail.rows; i++) 
				{
                    if ( grdDetail.GetGridData(i, G_ORDER_MIN_QTY) > 0 ) 
					{
                        grdDetail.SetCellFontColor(i, G_ORDER_MIN_QTY, i, G_ORDER_MIN_QTY, 0x3300cc);
                    }
                    /*else if (grdDetail.GetGridData(i, G_DAYS_LEFT) >= 3 && grdDetail.GetGridData(i, G_DAYS_LEFT) < 10 && Number(grdDetail.GetGridData(i, G_DELI_BAL)) > 0) 
					{
                        grdDetail.SetCellFontColor(i, G_SEQ, i, G_DELI_BAL, 0xFF0000);
                    }
                    else if (Number(grdDetail.GetGridData(i, G_DELI_BAL)) < 0) 
					{
                        grdDetail.SetCellFontColor(i, G_SEQ, i, G_DELI_BAL, 0xFF00FF);
                    }
                    else {
                        grdDetail.SetCellFontColor(i, G_SEQ, i, G_DELI_BAL, 0x000000);
                    }*/
                }

                grdDetail.Subtotal(0, 2, -1, '5!6!7!8!9!10!11!12!13!14!15!16');
				
            break;
        }
    }
        
    //==================================================================================================
    function OnReport(pos) 
	{
        switch (pos) 
		{
            case '1':
                var url = System.RootURL + "/reports/ds/cd/rpt_fpab00730.aspx?p_date_type=" + idList.value + "&p_from_dt=" + dtFrom.value + "&p_to_dt=" + dtTo.value + "&p_slip_cust=" + url_encode(txtSlipCust.text) + "&p_item=" + url_encode(txtItem.text) + "&p_bal_yn=" + chkBal.value + "&p_req_bal=" + chkReqBal.value + "&p_type=" + lstType.value;
                System.OpenTargetPage(url);
                break;

            case '2':
                var url = System.RootURL + "/reports/ds/cd/rpt_fpab00731.aspx?p_date_type=" + idList.value + "&p_from_dt=" + dtFrom.value + "&p_to_dt=" + dtTo.value + "&p_slip_cust=" + url_encode(txtSlipCust.text);
                System.OpenTargetPage(url);
                break;
        }
    }

    //==================================================================================================

    function url_encode(s) 
	{
        string = s.replace(/\r\n/g, "\n");
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
    <gw:data id="data_fpab00730" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_fpab00730" > 
                <input> 
                    <input bind="lstItemGroup" /> 
                    <input bind="txtItem" />  
					<input bind="chkBal" />	
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        
		<tr id='top' style="height: 1%">
            <td style="width: 5%; white-space: nowrap" align="right"  >
                Item
            </td> 
			<td style="width: 30%">
                <gw:list id="lstItemGroup" styles='width:100%;' onchange="OnSearch()"  />
            </td>
            <td style="width: 20%">
                <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch()" />
            </td>
            <td style="width: 45%; white-space: nowrap" align="center"  >
                Req<gw:checkbox id="chkBal" defaultvalue="Y|N" value="N" onchange="OnSearch()" />
            </td>
			<td style="width: 5%; white-space: nowrap">
				<gw:button id="btnSearch" img="search" alt="Search" text="Get Order" onclick="OnSearch()" />
			</td>						 	
        </tr>
         
        <tr style="height: 99%">
            <td colspan="13">
                 
				<gw:grid id='grdDetail'
					header='_Item_PK|Group|Item Code|Item Name|UOM|_P/R Req Qty|_P/R Book Qty|P/R Req Bal|_P/O Qty|_Income Qty|P/O Bal|_Stock Qty|_Stock Book|Stock Bal|Need Qty|Safe Qty|Order Qty'
					format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
					aligns='0|0|0|0|1|3|3|3|3|3|3|3|3|3|3|3|3'
					check='||||||||||||||||'
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
					widths='1500|2000|1500|2500|800|1300|1300|1300|1300|1300|1300|1300|1300|1300|1300|1300|1300'
					sorting='T'					 
					styles='width:100%; height:100%'
					/>

            </td>
        </tr>
    </table>
    
</body>
</html>
