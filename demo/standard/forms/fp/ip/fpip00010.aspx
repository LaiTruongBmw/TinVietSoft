<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Production Plan Exchange</title>
</head>

<script>
    var G_PP_ORDPLAN_PK = 0,
        G_REF_PO_NO     = 1,
        G_ITEM_CODE     = 2,
		G_ITEM_NAME		= 3,
        G_SPEC01_PK     = 4,
        G_SPEC02_PK     = 5,
        G_SPEC03_PK     = 6,
        G_SPEC04_PK     = 7,
        G_SPEC05_PK     = 8,
        G_SPEC          = 9,
        G_ORDPLAN_QTY   = 10,
        G_ROUTING_GROUP = 11,
        G_SUM_PLAN_QTY  = 12;
	 
//==============================================================================================
    function BodyInit() 
	{
        System.Translate(document);  // Translate to language session
        BindingDataList();
    }
//==============================================================================================
    function BindingDataList() 
	{
        var data;
		
        data = "<%=ESysLib.SetListDataSQL("select pk, factory_name from tlg_PR_factory where del_if = 0 and use_yn='Y' order by factory_NAME")%>||";
        lstFactory.SetDataText( data);
        lstFactory.value = '' ;

    	var trl;
    	trl = grdDetail.GetGridControl();	
    	trl.ColFormat(G_ORDPLAN_QTY)  = "###,###,###,###,###.##";    
    	trl.ColFormat(G_SUM_PLAN_QTY) = "###,###,###,###,###.##";    
		
		arr_FormatNumber[G_SUM_PLAN_QTY] = 2;	
			
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
		
		grdDetail.GetGridControl().Cell( 7, 0, G_ROUTING_GROUP, 0, G_ROUTING_GROUP ) = 0x3300cc;		
    }
//==============================================================================================
    function OnSearch() 
	{
        data_fpip00010.Call('SELECT');
    }
  
//==============================================================================================
    function OnDataReceive(obj) 
	{
        switch (obj.id) 
		{
            case 'data_fpip00010':
			
                if (grdDetail.rows > 1) 
				{ 
					grdDetail.SetCellBold(1, G_REF_PO_NO,     grdDetail.rows - 1, G_REF_PO_NO,     true);
                    grdDetail.SetCellBold(1, G_ITEM_CODE,     grdDetail.rows - 1, G_ITEM_CODE,     true);
                    grdDetail.SetCellBold(1, G_ORDPLAN_QTY,   grdDetail.rows - 1, G_ORDPLAN_QTY,   true);
                    grdDetail.SetCellBold(1, G_ROUTING_GROUP, grdDetail.rows - 1, G_ROUTING_GROUP, true);
					
					grdDetail.SetCellBgColor( 1, G_ITEM_CODE ,     grdDetail.rows - 1, G_ITEM_NAME ,     0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G_ROUTING_GROUP , grdDetail.rows - 1, G_ROUTING_GROUP , 0xCCFFFF );
					
					grdDetail.GetGridControl().Cell( 7, 1, G_SUM_PLAN_QTY, grdDetail.rows - 1, G_SUM_PLAN_QTY ) = 0x3300cc;
                }
            break;
        }
    }
//==============================================================================================  
	function OnExchangeResult()
	{
			 if ( lstFactory.value == '' )
			 {
			  		alert("PLS SELECT FACTORY FIRST.");
					return;
			 }
			 else if ( !(grdDetail.row > 0))
			 {
			 		alert("PLS SELECT ONE ORDER PLAN.");
					return;
			 }
			 
			 txtOrdPlanPK.text = grdDetail.GetGridData( grdDetail.row, G_PP_ORDPLAN_PK );
			 txtSpec01PK.text = grdDetail.GetGridData( grdDetail.row, G_SPEC01_PK );
			 txtSpec02PK.text = grdDetail.GetGridData( grdDetail.row, G_SPEC02_PK );
			 txtSpec03PK.text = grdDetail.GetGridData( grdDetail.row, G_SPEC03_PK );
			 txtSpec04PK.text = grdDetail.GetGridData( grdDetail.row, G_SPEC04_PK );
			 txtSpec05PK.text = grdDetail.GetGridData( grdDetail.row, G_SPEC05_PK );
			  
			 lblStyle.text  = grdDetail.GetGridData( grdDetail.row, G_ITEM_CODE ) + ' / ' + grdDetail.GetGridData( grdDetail.row, G_ITEM_NAME );
			  
			 lblPOSpec.text = grdDetail.GetGridData( grdDetail.row, G_REF_PO_NO ) + ' ( ' + grdDetail.GetGridData( grdDetail.row, G_SPEC ) + ' ) ';
			 
             var path = System.RootURL + '/form/fp/ip/fpip00011.aspx';
             var object = System.OpenModal( path ,500 , 250 ,  'resizable:yes;status:yes',this); 
	}
//==============================================================================================  
</script>

<body>
    <!-------------------------------------------------------------------------->
    <gw:data id="data_fpip00010" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpip00010"  > 
                <input bind="grdDetail" >   
                    <input bind="lstFactory" />               
				    <input bind="txtStyle" />
					<input bind="txtSpec" />
					<input bind="chkRunning" />
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>
    <!-------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
			<td align="right" style="width: 5%; white-space: nowrap">
				Fac
			</td>
			<td style="width: 20%">
				<gw:list id="lstFactory" text="" styles="width:100%" onchange="OnSearch()"/>
			</td>
			<td style="width: 5%" align="right">
				PO/Style
			</td>
			<td style="width: 20%">
				<gw:textbox id="txtStyle" styles='width:100%' onenterkey="OnSearch()" />
			</td>
			<td style="width: 5%" align="right">
				Spec
			</td>
			<td style="width: 20%">
				<gw:textbox id="txtSpec" styles='width:100%' onenterkey="OnSearch()" />
			</td>			
			<td style="width: 22%" align="center">
				Live
                <gw:checkbox id="chkRunning" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch()"></gw:checkbox>	
			</td>
			<td style="width: 1%" align="right">				 
			</td> 			
			<td style="width: 1%">
				<gw:icon id="idBtnExchange" img="2" text="Exchange Result" styles='width:100%' onclick="OnExchangeResult()" />
			</td>
			<td style="width: 1%" align="right">
				<gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
			</td>			                  
        </tr>
        <tr style="height: 98%">
            <td colspan=10>
                <gw:grid id='grdDetail' header='_pp_ordplan_pk|P/O No|Style Code|Style Name|_spec01_pk|_spec02_pk|_spec03_pk|_spec04_pk|_spec05_pk|Spec|Ord Qty|R/G|Plan Qty'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|3|1|3'  
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|1500|1500|2500|0|0|0|0|0|2000|1200|1500|1200'
                    sorting='T' styles='width:100%; height:100%'   />
            </td>
        </tr>
    </table>
    <!-------------------------------------------------------------------------->
	<gw:textbox id="txtOrdPlanPK" styles='width:100%;display:none' />
	<gw:textbox id="txtSpec01PK" styles='width:100%;display:none' />
	<gw:textbox id="txtSpec02PK" styles='width:100%;display:none' />
	<gw:textbox id="txtSpec03PK" styles='width:100%;display:none' />
	<gw:textbox id="txtSpec04PK" styles='width:100%;display:none' />
	<gw:textbox id="txtSpec05PK" styles='width:100%;display:none' />
	
	<gw:textbox id="lblStyle" styles='width:100%;display:none' />
	<gw:textbox id="lblPOSpec" styles='width:100%;display:none' />
</body>
</html>
