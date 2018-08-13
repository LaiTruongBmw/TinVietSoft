<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>P/O Checking 2</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
    var G_PARTNER 	    = 0,
	    G_PO_DATE 	    = 1,
		G_PO_NO	        = 2,
        G_SEQ 	        = 3,                        
		G_ITEM_CODE		= 4,
        G_ITEM_NAME     = 5,
        G_UOM           = 6,
        G_ETD_FROM      = 7,
        G_PO_QTY 	    = 8,
		G_IN_QTY 	    = 9,
		G_RET_QTY       = 10, 
		G_PO_BAL 	    = 11,
        G_DAY_LEFT 	    = 12,         
        G_PO_PO_D_PK 	= 13,         
        G_DATE_01 	    = 14,		 
        G_QTY_01        = 15,
        G_DATE_02 	    = 16,		 
        G_QTY_02        = 17,
        G_DATE_03 	    = 18,		 
        G_QTY_03        = 19,
        G_DATE_04 	    = 20,		 
        G_QTY_04        = 21,
        G_DATE_05 	    = 22,		 
        G_QTY_05        = 23,
        G_DATE_06 	    = 24,		 
        G_QTY_06        = 25,
        G_DATE_07 	    = 26,		 
        G_QTY_07        = 27;
		
    //======================================================================
    function BodyInit() 
	{        
	    System.Translate(document);
        dtFrom.SetDataText(System.AddDate(dtTo.GetData(), -7));
        
        OnFormatGrid();
    }
	//======================================================================
    function OnFormatGrid() 
	{ 
		//------------
		var data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from TLG_IT_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||";
    	lstGroup.SetDataText(data);
    	lstGroup.value = '';
		//------------				 
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
        trl.ColFormat(G_PO_QTY)   = "###,###,###,###,###.##";         
        trl.ColFormat(G_IN_QTY)   = "###,###,###,###,###.##"; 
		trl.ColFormat(G_RET_QTY)  = "###,###,###,###,###.##";    
        trl.ColFormat(G_PO_BAL)   = "###,###,###,###,###.##";
		trl.ColFormat(G_QTY_01)   = "###,###,###,###,###.##";
		trl.ColFormat(G_QTY_02)   = "###,###,###,###,###.##";
		trl.ColFormat(G_QTY_03)   = "###,###,###,###,###.##";
		trl.ColFormat(G_QTY_04)   = "###,###,###,###,###.##";
		trl.ColFormat(G_QTY_05)   = "###,###,###,###,###.##";
		trl.ColFormat(G_QTY_06)   = "###,###,###,###,###.##";
		trl.ColFormat(G_QTY_07)   = "###,###,###,###,###.##";
				 
		grdDetail.GetGridControl().Cell( 7, 0, G_PO_BAL,  0, G_PO_BAL  ) = 0x3300cc;							
    }
    //======================================================================
     function OnSearch() 
	{
        data_epbp00100.Call('SELECT')
    }
    //======================================================================
    function OnDataReceive(obj) 
	{
        switch (obj.id) 
		{
            case 'data_epbp00100':  
				if (grdDetail.rows > 1)
                {
                    grdDetail.SetCellBold( 1, G_PO_NO,  grdDetail.rows-1, G_PO_NO,  true);                
                    grdDetail.SetCellBold( 1, G_PO_QTY, grdDetail.rows-1, G_PO_QTY, true);   
					grdDetail.SetCellBold( 1, G_PO_BAL, grdDetail.rows-1, G_PO_BAL, true);  
					
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
            break;
        }
    }	 
   
    //==================================================================================================
    function OnPopUp() 
	{
        if (grdDetail.row > 0) 
		{
			if ( grdDetail.col == G_IN_QTY )
			{
	            txt_PO_D_PK.text = grdDetail.GetGridData( grdDetail.row, G_PO_PO_D_PK);
				txt_Ref_No.text  = grdDetail.GetGridData( grdDetail.row, G_PO_NO ) + ' - ' + grdDetail.GetGridData( grdDetail.row, G_SEQ) ;
				
	            var url = System.RootURL + '/standard/formsep/bp/epbp00101.aspx';
	            var aValue = System.OpenModal(url, 800, 450, 'resizable:yes;status:yes', this);
			}	
			else if ( grdDetail.col == G_RET_QTY )
			{
	            txt_PO_D_PK.text = grdDetail.GetGridData( grdDetail.row, G_PO_PO_D_PK);
				txt_Ref_No.text  = grdDetail.GetGridData( grdDetail.row, G_PO_NO ) + ' - ' + grdDetail.GetGridData( grdDetail.row, G_SEQ) ;
				
	            var url = System.RootURL + '/standard/formsep/bp/epbp00102.aspx';
	            var aValue = System.OpenModal(url, 800, 450, 'resizable:yes;status:yes', this);
			
			}		 
        }
    }
    //==================================================================================================
    function OnReport(pos) 
	{
		switch(pos)
		{
			case '1' :
				var url = System.RootURL + "/standard/reports/ds/cd/rpt_dscd00100.aspx?p_date_type=" + idList.value + "&p_from_dt=" + dtFrom.value + "&p_to_dt=" + dtTo.value + "&p_slip_cust=" + url_encode(txtSlipCust.text) + "&p_item=" + url_encode(txtItem.text) + "&p_bal_yn=" + chkBal.value + "&p_type=" + lstType.value;
        		System.OpenTargetPage(url);									
			break;
			
			case '2' :
				var url = System.RootURL + "/standard/reports/ds/cd/rpt_dscd00041.aspx?p_date_type=" + idList.value + "&p_from_dt=" + dtFrom.value + "&p_to_dt=" + dtTo.value + "&p_slip_cust=" + url_encode(txtSlipCust.text) ;
        		System.OpenTargetPage(url);
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
    <gw:data id="data_epbp00100" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"   function="st_lg_sel_epbp00100" > 
                <input> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
                    <input bind="txtSlipCust" />
					<input bind="lstGroup" />
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
			<td style="width: 5%; white-space: nowrap" align="right">
                P/O Date
            </td>
            <td style="width: 15%; white-space: nowrap" align="left">
                <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" styles="width=80%" />
                ~
                <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" styles="width=80%" />
            </td>
            <td style="width: 5%" align="right">
                Item
            </td>
			<td style="width: 25%; white-space: nowrap">
				<gw:list id="lstGroup" styles='width:100%' /> 
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
            <td style="width: 13%" align="center">
                Bal<gw:checkbox id="chkBal" defaultvalue="Y|N" value="Y" onchange="OnSearch()" />
            </td>
			<td style="width: 1%" align="right">
				<gw:button img="select" alt="View Detail" id="btnSelect1" onclick="OnPopUp()" />
			</td>
            <td style="width: 1%" align="right">
                <gw:button id="btnSearch" img="search" alt="Search" text="Get Order" onclick="OnSearch()" />
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="14">
                <gw:grid id='grdDetail' header='Partner Name|P/O Date|P/O No|Seq|Item Code|Item Name|UOM|ETD From|P/O Qty|In Qty|Return Qty|P/O Bal|Days Left|_PO_PO_D_PK|Date|Qty|Date|Qty|Date|Qty|Date|Qty|Date|Qty|Date|Qty|Date|Qty'
                    format='0|4|0|0|0|0|0|4|0|0|0|0|0|0|4|0|4|0|4|0|4|0|4|0|4|0|4|0' 
					aligns='0|1|0|1|0|0|1|1|3|3|3|3|1|0|1|3|1|3|1|3|1|3|1|3|1|3|1|3'
                    check='|||||||||||||||||||||||||||' 
					editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    widths='2000|1200|1500|600|1500|3500|800|1200|1200|1200|1200|1200|1000|0|1200|1000|1200|1000|1200|1000|1200|1000|1200|1000|1200|1000|1200|1000'
                    sorting='T'  styles='width:100%; height:100%'acceptnulldate="T" />
            </td>
        </tr>
    </table>
    <gw:textbox id="txt_PO_D_PK" styles="width:100%; display:none" />
    <gw:textbox id="txt_Ref_No" styles="width:100%; display:none" />
</body>
</html>
