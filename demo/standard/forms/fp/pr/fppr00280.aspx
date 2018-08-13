<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Prod Daily Input</title>
</head>

<script>
        
   var  G0_PLAN_TYPE	= 0,
		G0_DATE			= 1,
		G0_SHIFT		= 2,
        G0_LINE_PK      = 3,
        G0_LINE_NAME    = 4,
        G0_WH_PK 		= 5,
        G0_WH_NAME    	= 6,
        G0_ITEM_PK      = 7,
        G0_ITEM_CD      = 8,
        G0_ITEM_NM 		= 9,  
        G0_DAY01_QTY 	= 10,
        G0_DAY02_QTY 	= 11,
        G0_DAY03_QTY 	= 12,
        G0_DAY04_QTY 	= 13,
        G0_DAY05_QTY 	= 14,
        G0_DAY06_QTY 	= 15,
        G0_DAY07_QTY 	= 16,
        G0_DAY08_QTY 	= 17,
        G0_DAY09_QTY 	= 18,
        G0_DAY10_QTY 	= 19,
        G0_DAY11_QTY 	= 20,
        G0_DAY12_QTY 	= 21,
		G0_DAY13_QTY 	= 22,
		G0_DAY14_QTY 	= 23, 
		G0_DAY15_QTY 	= 24, 
		G0_DAY16_QTY 	= 25, 
		G0_DAY17_QTY 	= 26, 
		G0_DAY18_QTY 	= 27, 
		G0_DAY19_QTY 	= 28, 
		G0_DAY20_QTY 	= 29, 
		G0_DAY21_QTY 	= 30, 
		G0_DAY22_QTY 	= 31, 
		G0_DAY23_QTY 	= 32, 
		G0_DAY24_QTY 	= 33, 	
		G0_DAY25_QTY 	= 34,
		G0_DAY26_QTY 	= 35,
		G0_DAY27_QTY 	= 36,
		G0_DAY28_QTY 	= 37,
		G0_DAY29_QTY 	= 38,
		G0_DAY30_QTY 	= 39,
		G0_DAY31_QTY 	= 40;	

	var arr_FormatNumber = new Array();  

    //==============================================================================
     function BodyInit()
     {  
        System.Translate(document);         		      		
						
		OnFormatGrid(); 

		OnSearch('HEADER');		
     } 

	//==============================================================================
    function OnFormatGrid()
    {   	
		var data = "";
		
		data = "<%=ESysLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name FROM tlg_in_warehouse  where del_if=0 order by wh_id")%>";
        data = data + '||';		
        lstWarehouse.SetDataText( data);
        lstWarehouse.value = '';

		data = "<%=ESysLib.SetListDataSQL("SELECT DISTINCT a.pk, a.GROUP_ID || ' * ' || a.group_name  FROM tlg_pb_line_group a WHERE a.del_if = 0  ORDER BY 2 ") %>||" ;    
		lstLGroup.SetDataText(data); 
		lstLGroup.value = '' ; 		

		data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC0343') FROM DUAL" )%>||";    
		lstWorkShift.SetDataText(data);   
	 
		data = "data|1|IN|2|OUT";
		lstType.SetDataText(data); 
		lstType.value = 1;
	
		var strFormat = "###,###,###,###";
		var strNumber = 0;
		
		var ctrl = grdDetail.GetGridControl();
		        		        
        ctrl.ColFormat(G0_DAY01_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY02_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY03_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY04_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY05_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY06_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY07_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY08_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY09_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY10_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY11_QTY) = strFormat;
        ctrl.ColFormat(G0_DAY12_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY13_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY14_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY15_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY16_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY17_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY18_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY19_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY20_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY21_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY22_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY23_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY24_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY25_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY26_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY27_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY28_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY29_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY30_QTY) = strFormat;
		ctrl.ColFormat(G0_DAY31_QTY) = strFormat;
		
		arr_FormatNumber[G0_DAY01_QTY] = strNumber;
		arr_FormatNumber[G0_DAY02_QTY] = strNumber;
		arr_FormatNumber[G0_DAY03_QTY] = strNumber;
		arr_FormatNumber[G0_DAY04_QTY] = strNumber;
		arr_FormatNumber[G0_DAY05_QTY] = strNumber;
		arr_FormatNumber[G0_DAY06_QTY] = strNumber;
		arr_FormatNumber[G0_DAY07_QTY] = strNumber;
		arr_FormatNumber[G0_DAY08_QTY] = strNumber;
		arr_FormatNumber[G0_DAY09_QTY] = strNumber;
		arr_FormatNumber[G0_DAY10_QTY] = strNumber;
		arr_FormatNumber[G0_DAY11_QTY] = strNumber;
		arr_FormatNumber[G0_DAY12_QTY] = strNumber;
		arr_FormatNumber[G0_DAY13_QTY] = strNumber;
		arr_FormatNumber[G0_DAY14_QTY] = strNumber;
		arr_FormatNumber[G0_DAY15_QTY] = strNumber;
		arr_FormatNumber[G0_DAY16_QTY] = strNumber;
		arr_FormatNumber[G0_DAY17_QTY] = strNumber;
		arr_FormatNumber[G0_DAY18_QTY] = strNumber;
		arr_FormatNumber[G0_DAY19_QTY] = strNumber;
		arr_FormatNumber[G0_DAY20_QTY] = strNumber;
		arr_FormatNumber[G0_DAY21_QTY] = strNumber;
		arr_FormatNumber[G0_DAY22_QTY] = strNumber;
		arr_FormatNumber[G0_DAY23_QTY] = strNumber;
		arr_FormatNumber[G0_DAY24_QTY] = strNumber;
		arr_FormatNumber[G0_DAY25_QTY] = strNumber;
		arr_FormatNumber[G0_DAY26_QTY] = strNumber;
		arr_FormatNumber[G0_DAY27_QTY] = strNumber;
		arr_FormatNumber[G0_DAY28_QTY] = strNumber;
		arr_FormatNumber[G0_DAY29_QTY] = strNumber;
		arr_FormatNumber[G0_DAY30_QTY] = strNumber;
		arr_FormatNumber[G0_DAY31_QTY] = strNumber;
    }	 
    //==============================================================================
    function OnSearch(objV)
    {    
        switch(objV)
        { 
	        case 'DETAIL':
			    data_fppr00280.Call('SELECT');
			break; 

			case 'HEADER':
			    data_fppr00280_date_header.Call('SELECT');
			break; 	
        }
    }
    
    //==============================================================================
    function OnDataReceive(objV)
    {
        switch(objV.id)
        {			 
            case 'data_fppr00280': 
			    if ( grdDetail.rows > 1 )
				{            		
					grdDetail.SetCellBgColor( 1, G0_DAY01_QTY, grdDetail.rows - 1, G0_DAY01_QTY, 0xCCFFFF ); 
					grdDetail.SetCellBgColor( 1, G0_DAY03_QTY, grdDetail.rows - 1, G0_DAY03_QTY, 0xCCFFFF ); 
					grdDetail.SetCellBgColor( 1, G0_DAY05_QTY, grdDetail.rows - 1, G0_DAY05_QTY, 0xCCFFFF ); 
					grdDetail.SetCellBgColor( 1, G0_DAY07_QTY, grdDetail.rows - 1, G0_DAY07_QTY, 0xCCFFFF ); 
					grdDetail.SetCellBgColor( 1, G0_DAY09_QTY, grdDetail.rows - 1, G0_DAY09_QTY, 0xCCFFFF ); 
					grdDetail.SetCellBgColor( 1, G0_DAY11_QTY, grdDetail.rows - 1, G0_DAY11_QTY, 0xCCFFFF ); 
					grdDetail.SetCellBgColor( 1, G0_DAY13_QTY, grdDetail.rows - 1, G0_DAY13_QTY, 0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G0_DAY15_QTY, grdDetail.rows - 1, G0_DAY15_QTY, 0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G0_DAY17_QTY, grdDetail.rows - 1, G0_DAY17_QTY, 0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G0_DAY19_QTY, grdDetail.rows - 1, G0_DAY19_QTY, 0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G0_DAY21_QTY, grdDetail.rows - 1, G0_DAY21_QTY, 0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G0_DAY23_QTY, grdDetail.rows - 1, G0_DAY23_QTY, 0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G0_DAY25_QTY, grdDetail.rows - 1, G0_DAY25_QTY, 0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G0_DAY27_QTY, grdDetail.rows - 1, G0_DAY27_QTY, 0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G0_DAY29_QTY, grdDetail.rows - 1, G0_DAY29_QTY, 0xCCFFFF );
					grdDetail.SetCellBgColor( 1, G0_DAY31_QTY, grdDetail.rows - 1, G0_DAY31_QTY, 0xCCFFFF );						
				} 
            break;
			
			case 'data_fppr00280_date_header':
				
				
				if(grdHeader.rows > 1)
                {//SUNDAY  
                    var Day_SUNDAY = 'SUNDAY';
					
                    var g_01_day  = grdHeader.GetGridData( 1, 0).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_01_date = grdHeader.GetGridData( 2, 0);  								
                    var g_02_day  = grdHeader.GetGridData( 1, 1).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_02_date = grdHeader.GetGridData( 2, 1); 					
                    var g_03_day  = grdHeader.GetGridData( 1, 2).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_03_date = grdHeader.GetGridData( 2, 2); 										
                    var g_04_day  = grdHeader.GetGridData( 1, 3).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_04_date = grdHeader.GetGridData( 2, 3); 					
                    var g_05_day  = grdHeader.GetGridData( 1, 4).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_05_date = grdHeader.GetGridData( 2, 4); 									
                    var g_06_day  = grdHeader.GetGridData( 1, 5).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_06_date = grdHeader.GetGridData( 2, 5); 					
                    var g_07_day  = grdHeader.GetGridData( 1, 6).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_07_date = grdHeader.GetGridData( 2, 6); 									
                    var g_08_day  = grdHeader.GetGridData( 1, 7).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_08_date = grdHeader.GetGridData( 2, 7); 					
                    var g_09_day  = grdHeader.GetGridData( 1, 8).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_09_date = grdHeader.GetGridData( 2, 8); 									
                    var g_10_day  = grdHeader.GetGridData( 1, 9).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_10_date = grdHeader.GetGridData( 2, 9);
 					var g_11_day  = grdHeader.GetGridData( 1,10).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_11_date = grdHeader.GetGridData( 2,10); 
                    var g_12_day  = grdHeader.GetGridData( 1,11).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_12_date = grdHeader.GetGridData( 2,11);
 					var g_13_day  = grdHeader.GetGridData( 1,12).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_13_date = grdHeader.GetGridData( 2,12); 
                    var g_14_day  = grdHeader.GetGridData( 1,13).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_14_date = grdHeader.GetGridData( 2,13); 
					var g_15_day  = grdHeader.GetGridData( 1,14).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_15_date = grdHeader.GetGridData( 2,14); 
                    var g_16_day  = grdHeader.GetGridData( 1,15).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_16_date = grdHeader.GetGridData( 2,15); 
					var g_17_day  = grdHeader.GetGridData( 1,16).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_17_date = grdHeader.GetGridData( 2,16); 
                    var g_18_day  = grdHeader.GetGridData( 1,17).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_18_date = grdHeader.GetGridData( 2,17); 
					var g_19_day  = grdHeader.GetGridData( 1,18).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_19_date = grdHeader.GetGridData( 2,18); 
					var g_20_day  = grdHeader.GetGridData( 1,19).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_20_date = grdHeader.GetGridData( 2,19);
					var g_21_day  = grdHeader.GetGridData( 1,20).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_21_date = grdHeader.GetGridData( 2,20);
					var g_22_day  = grdHeader.GetGridData( 1,21).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_22_date = grdHeader.GetGridData( 2,21);
					var g_23_day  = grdHeader.GetGridData( 1,22).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_23_date = grdHeader.GetGridData( 2,22);
					var g_24_day  = grdHeader.GetGridData( 1,23).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_24_date = grdHeader.GetGridData( 2,23);
					var g_25_day  = grdHeader.GetGridData( 1,24).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_25_date = grdHeader.GetGridData( 2,24);				
					var g_26_day  = grdHeader.GetGridData( 1,25).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_26_date = grdHeader.GetGridData( 2,25);					
					var g_27_day  = grdHeader.GetGridData( 1,26).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_27_date = grdHeader.GetGridData( 2,26);
					var g_28_day  = grdHeader.GetGridData( 1,27).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_28_date = grdHeader.GetGridData( 2,27);
					var g_29_day  = grdHeader.GetGridData( 1,28).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_29_date = grdHeader.GetGridData( 2,28);
					var g_30_day  = grdHeader.GetGridData( 1,29).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_30_date = grdHeader.GetGridData( 2,29);
					var g_31_day  = grdHeader.GetGridData( 1,30).replace(/^\s\s*/, '').replace(/\s\s*$/, '');
                    var g_31_date = grdHeader.GetGridData( 2,30);
					
                    grdDetail.GetGridControl().ColHidden(G0_DAY01_QTY) = false ;
                    grdDetail.GetGridControl().ColHidden(G0_DAY02_QTY) = false ;
                    grdDetail.GetGridControl().ColHidden(G0_DAY03_QTY) = false ;
                    grdDetail.GetGridControl().ColHidden(G0_DAY04_QTY) = false ;
                    grdDetail.GetGridControl().ColHidden(G0_DAY05_QTY) = false ;
                    grdDetail.GetGridControl().ColHidden(G0_DAY06_QTY) = false ;
                    grdDetail.GetGridControl().ColHidden(G0_DAY07_QTY) = false ;
                    grdDetail.GetGridControl().ColHidden(G0_DAY08_QTY) = false ;
                    grdDetail.GetGridControl().ColHidden(G0_DAY09_QTY) = false ;
                    grdDetail.GetGridControl().ColHidden(G0_DAY10_QTY) = false ;
					grdDetail.GetGridControl().ColHidden(G0_DAY11_QTY) = false ;
					grdDetail.GetGridControl().ColHidden(G0_DAY12_QTY) = false ;
					grdDetail.GetGridControl().ColHidden(G0_DAY13_QTY) = false ;
					grdDetail.GetGridControl().ColHidden(G0_DAY14_QTY) = false ;
					grdDetail.GetGridControl().ColHidden(G0_DAY15_QTY) = false ;
					grdDetail.GetGridControl().ColHidden(G0_DAY16_QTY) = false ;
					grdDetail.GetGridControl().ColHidden(G0_DAY17_QTY) = false ;
					grdDetail.GetGridControl().ColHidden(G0_DAY18_QTY) = false ;
					grdDetail.GetGridControl().ColHidden(G0_DAY19_QTY) = false ;
					grdDetail.GetGridControl().ColHidden(G0_DAY20_QTY) = false ;
					grdDetail.GetGridControl().ColHidden(G0_DAY21_QTY) = false ;
					grdDetail.GetGridControl().ColHidden(G0_DAY22_QTY) = false ;
                    grdDetail.GetGridControl().ColHidden(G0_DAY23_QTY) = false ;
					grdDetail.GetGridControl().ColHidden(G0_DAY24_QTY) = false ;
					grdDetail.GetGridControl().ColHidden(G0_DAY25_QTY) = false ;	
					grdDetail.GetGridControl().ColHidden(G0_DAY26_QTY) = false ;	
					grdDetail.GetGridControl().ColHidden(G0_DAY27_QTY) = false ;	
					grdDetail.GetGridControl().ColHidden(G0_DAY28_QTY) = false ;
					grdDetail.GetGridControl().ColHidden(G0_DAY29_QTY) = false ;
					grdDetail.GetGridControl().ColHidden(G0_DAY30_QTY) = false ;
					grdDetail.GetGridControl().ColHidden(G0_DAY31_QTY) = false ;
                    //Add text date
                    grdDetail.SetGridText( 0, G0_DAY01_QTY, g_01_date);
                    grdDetail.SetGridText( 0, G0_DAY02_QTY, g_02_date);
                    grdDetail.SetGridText( 0, G0_DAY03_QTY, g_03_date);
                    grdDetail.SetGridText( 0, G0_DAY04_QTY, g_04_date);
                    grdDetail.SetGridText( 0, G0_DAY05_QTY, g_05_date);
                    grdDetail.SetGridText( 0, G0_DAY06_QTY, g_06_date);
                    grdDetail.SetGridText( 0, G0_DAY07_QTY, g_07_date);
                    grdDetail.SetGridText( 0, G0_DAY08_QTY, g_08_date);
                    grdDetail.SetGridText( 0, G0_DAY09_QTY, g_09_date);
                    grdDetail.SetGridText( 0, G0_DAY10_QTY, g_10_date);
					grdDetail.SetGridText( 0, G0_DAY11_QTY, g_11_date);
					grdDetail.SetGridText( 0, G0_DAY12_QTY, g_12_date);
					grdDetail.SetGridText( 0, G0_DAY13_QTY, g_13_date);
					grdDetail.SetGridText( 0, G0_DAY14_QTY, g_14_date);
					grdDetail.SetGridText( 0, G0_DAY15_QTY, g_15_date);
					grdDetail.SetGridText( 0, G0_DAY16_QTY, g_16_date);
					grdDetail.SetGridText( 0, G0_DAY17_QTY, g_17_date);
					grdDetail.SetGridText( 0, G0_DAY18_QTY, g_18_date);
					grdDetail.SetGridText( 0, G0_DAY19_QTY, g_19_date);
					grdDetail.SetGridText( 0, G0_DAY20_QTY, g_20_date);
					grdDetail.SetGridText( 0, G0_DAY21_QTY, g_21_date);
					grdDetail.SetGridText( 0, G0_DAY22_QTY, g_22_date);
					grdDetail.SetGridText( 0, G0_DAY23_QTY, g_23_date);
					grdDetail.SetGridText( 0, G0_DAY24_QTY, g_24_date);
					grdDetail.SetGridText( 0, G0_DAY25_QTY, g_25_date);
					grdDetail.SetGridText( 0, G0_DAY26_QTY, g_26_date);
					grdDetail.SetGridText( 0, G0_DAY27_QTY, g_27_date);
					grdDetail.SetGridText( 0, G0_DAY28_QTY, g_28_date);
					grdDetail.SetGridText( 0, G0_DAY29_QTY, g_29_date);
					grdDetail.SetGridText( 0, G0_DAY30_QTY, g_30_date);				
					grdDetail.SetGridText( 0, G0_DAY31_QTY, g_31_date);
                    
                    //mark font color
                    if ( g_01_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY01_QTY, 0, G0_DAY01_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY01_QTY, 0, G0_DAY01_QTY, 0x000000);
                    }
                    if ( g_02_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY02_QTY, 0, G0_DAY02_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY02_QTY, 0, G0_DAY02_QTY, 0x000000);
                    }
                    if ( g_03_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY03_QTY, 0, G0_DAY03_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY03_QTY, 0, G0_DAY03_QTY, 0x000000);
                    }
                    if ( g_04_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY04_QTY, 0, G0_DAY04_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY04_QTY, 0, G0_DAY04_QTY, 0x000000);
                    }
                    if ( g_05_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY05_QTY, 0, G0_DAY05_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY05_QTY, 0, G0_DAY05_QTY, 0x000000);
                    }
                    if ( g_06_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY06_QTY, 0, G0_DAY06_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY06_QTY, 0, G0_DAY06_QTY, 0x000000);
                    }
                    if ( g_07_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY07_QTY, 0, G0_DAY07_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY07_QTY, 0, G0_DAY07_QTY, 0x000000);
                    }
                    if ( g_08_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY08_QTY, 0, G0_DAY08_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY08_QTY, 0, G0_DAY08_QTY, 0x000000);
                    }
                    if ( g_09_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY09_QTY, 0, G0_DAY09_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY09_QTY, 0, G0_DAY09_QTY, 0x000000);
                    }
                    if ( g_10_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY10_QTY, 0, G0_DAY10_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY10_QTY, 0, G0_DAY10_QTY, 0x000000);
                    } 
					if ( g_11_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY11_QTY, 0, G0_DAY11_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY11_QTY, 0, G0_DAY11_QTY, 0x000000);
                    }
                    if ( g_12_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY12_QTY, 0, G0_DAY12_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY12_QTY, 0, G0_DAY12_QTY, 0x000000);
                    }
					if ( g_13_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY13_QTY, 0, G0_DAY13_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY13_QTY, 0, G0_DAY13_QTY, 0x000000);
                    }
					if ( g_14_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY14_QTY, 0, G0_DAY14_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY14_QTY, 0, G0_DAY14_QTY, 0x000000);
                    }
					if ( g_15_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY15_QTY, 0, G0_DAY15_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY15_QTY, 0, G0_DAY15_QTY, 0x000000);
                    }
					if ( g_16_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY16_QTY, 0, G0_DAY16_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY16_QTY, 0, G0_DAY16_QTY, 0x000000);
                    }
					if ( g_17_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY17_QTY, 0, G0_DAY17_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY17_QTY, 0, G0_DAY17_QTY, 0x000000);
                    }
					if ( g_18_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY18_QTY, 0, G0_DAY18_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY18_QTY, 0, G0_DAY18_QTY, 0x000000);
                    }
					if ( g_19_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY19_QTY, 0, G0_DAY19_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY19_QTY, 0, G0_DAY19_QTY, 0x000000);
                    }
					if ( g_20_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY20_QTY, 0, G0_DAY20_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY20_QTY, 0, G0_DAY20_QTY, 0x000000);
                    }
					if ( g_21_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY21_QTY, 0, G0_DAY21_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY21_QTY, 0, G0_DAY21_QTY, 0x000000);
                    }
					if ( g_22_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY22_QTY, 0, G0_DAY22_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY22_QTY, 0, G0_DAY22_QTY, 0x000000);
                    }
					if ( g_23_day  == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY23_QTY, 0, G0_DAY23_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY23_QTY, 0, G0_DAY23_QTY, 0x000000);
                    }
					if ( g_24_day  == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY24_QTY, 0, G0_DAY24_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY24_QTY, 0, G0_DAY24_QTY, 0x000000);
                    }
					if ( g_25_day  == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY25_QTY, 0, G0_DAY25_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY25_QTY, 0, G0_DAY25_QTY, 0x000000);
                    }
					if ( g_26_day  == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY26_QTY, 0, G0_DAY26_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY26_QTY, 0, G0_DAY26_QTY, 0x000000);
                    }
					if ( g_27_day  == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY27_QTY, 0, G0_DAY27_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY27_QTY, 0, G0_DAY27_QTY, 0x000000);
                    }
					if ( g_28_day  == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY28_QTY, 0, G0_DAY28_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY28_QTY, 0, G0_DAY28_QTY, 0x000000);
                    }
					if ( g_29_day  == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY29_QTY, 0, G0_DAY29_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY29_QTY, 0, G0_DAY29_QTY, 0x000000);
                    }
					if ( g_30_day  == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY30_QTY, 0, G0_DAY30_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY30_QTY, 0, G0_DAY30_QTY, 0x000000);
                    }
					if ( g_31_day  == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY31_QTY, 0, G0_DAY31_QTY, 0x3300cc);
                    }
                    else
                    {
                        grdDetail.SetCellFontColor( 0, G0_DAY31_QTY, 0, G0_DAY31_QTY, 0x000000);
                    }
                }
				
				OnSearch('DETAIL');
				
			break;
			
        }
    }
 
    //==============================================================================
    function OnReport(obj)
    {
        var url = '';
		
        switch(obj.id)
        {
            case 'btnExcel1':
                url='/reports/fp/ip/rpt_fppr00280.aspx?p_factory_pk='+ lstLGroup.value +'&p_from_date='+ dtDate.value;
            break;
            
			case 'btnExcel2':
                url='/reports/fp/ip/rpt_fppr00280_1.aspx?p_factory_pk='+ lstLGroup.value +'&p_from_date='+ dtDate.value;  
            break;
            
			default:
                return;
        }
		
        if(url != '')
        {
            window.open(System.RootURL+url);
        }
    }
    //==============================================================================
    function OnAddNew(pos)
    {
		switch(pos)
		{
			case 'ITEM':
				if ( lstWorkShift.value == '' )
				{
					alert("PLS SELECT SHIFT !");			
					return;
				}
				else if ( lstLine.value == '' ) 
				{
					alert("PLS SELECT LINE !");			
					return;
				}
				else if ( lstWarehouse.value == '' ) 
				{
					alert("PLS SELECT WAREHOUSE !");			
					return;
				}
				//----------------------------
				var url = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=Y|Y|Y|Y|Y|Y';
				var obj= System.OpenModal( url, 1000, 600, 'resizable:yes;status:yes', this); 
			 
				if( obj != null )
				{
					var arrTemp;
				
					for ( var i = 0 ; i< obj.length ; i++)
					{
						arrTemp = obj[i];
									 
						grdDetail.AddRow();
						
						grdDetail.SetGridText( grdDetail.rows-1, G0_PLAN_TYPE, 	lstType.value); 	
						grdDetail.SetGridText( grdDetail.rows-1, G0_DATE, 	 	dtDate.value );  
						grdDetail.SetGridText( grdDetail.rows-1, G0_SHIFT, 	 	lstWorkShift.value );
						
						grdDetail.SetGridText( grdDetail.rows-1, G0_LINE_PK, 	lstLine.value     );  
						grdDetail.SetGridText( grdDetail.rows-1, G0_LINE_NAME, 	lstLine.GetText() );      

						grdDetail.SetGridText( grdDetail.rows-1, G0_WH_PK, 		lstWarehouse.value     );  
						grdDetail.SetGridText( grdDetail.rows-1, G0_WH_NAME, 	lstWarehouse.GetText() );      
					
						grdDetail.SetGridText( grdDetail.rows-1, G0_ITEM_PK,    arrTemp[0]   );    
						grdDetail.SetGridText( grdDetail.rows-1, G0_ITEM_CD,	arrTemp[1]   ); 
						grdDetail.SetGridText( grdDetail.rows-1, G0_ITEM_NM,	arrTemp[2]   );
					 
					}
				}
			break; 
		}	
		 
    }
	 
    //==============================================================================
    function OnSave()
    {
		if ( confirm("Do you want to save date ?") )
		{
			data_fppr00280.Call();
		}	
    }
    //==============================================================================
    function OnDelete()
    {
		if ( grdDetail.row > 0 )
		{
			if ( confirm("Do you want to delete this item?") )
			{
				for ( i=G0_DAY01_QTY; i<=G0_DAY31_QTY; i++)
				{
					grdDetail.SetGridText( grdDetail.row, i, 0);       
				}	
			}	
		}	
    }
	//==============================================================================
    function OnProcess(pos)	
    {
		switch(pos)
		{
			case 'Line':
				pro_fppr00280_line.Call();
			break;
		}				
    }     	
	//==============================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00280_line" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fppr00280_line" > 
                <input>
                    <input bind="lstLGroup" /> 
                </input> 
                <output>
                    <output bind="lstLine" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!---------------------------------------------------------------->
    <gw:data id="data_fppr00280_date_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fppr00280_date_header"> 
                <input> 					
                    <input bind="dtDate" />
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00280" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id = "1" type = "grid" parameter ="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40" function = "<%=l_user%>lg_sel_fppr00280" procedure="<%=l_user%>lg_upd_fppr00280" > 
                <input >	
					<input bind="lstType" />
					<input bind="lstLGroup" />
					<input bind="lstLine" />
                    <input bind="lstWarehouse" /> 					
					<input bind="dtDate" />
					<input bind="lstWorkShift" />
                    <input bind="txtItem" />                      
                </input> 
                 <output bind="grdDetail" />                      
            </dso> 
        </xml> 
    </gw:data>
  
    <!------------------------------------------------------------------>
    <table style="height: 100%; width: 100%" border="1">
        <tr style="height: 50%" id="tab_top">
            <td>
                <table style="height: 100%; width: 100%; text-align: left; vertical-align: top;"
                    border="0">					  
                    <tr style="height: 1%">						 
                        <td style="width: 5%; white-space: nowrap" align="right">
                            <gw:list id="lstType" styles='width:50' onchange="OnSearch('HEADER')" />
                        </td>                        					
						<td style="width: 5%; white-space: nowrap" align="right">
                            Line
                        </td>
                        <td style="width: 10%" align="right">
                            <gw:list id="lstLGroup" styles="width: 100%" onchange="OnProcess('Line')" />
                        </td>                         
                        <td style="width: 15%">
                            <gw:list id="lstLine" styles="width: 100%" onchange="" />
                        </td>
						<td style="width: 5%; white-space: nowrap" align="right">
                            W/H
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="right">
                            <gw:list id="lstWarehouse" styles='width:100%' onchange="" />
                        </td>						
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="left">
                            <gw:datebox id="dtDate" lang="1" type='date' onchange="OnSearch('HEADER')" />
                        </td>
						<td style="width: 10%; white-space: nowrap" align="right">
                            <gw:list id="lstWorkShift" styles='width:100%' onchange="" />
                        </td>	
                        <td style="width: 5%" align="right">
                            Item
                        </td>						
                        <td style="width: 10%" align="right">
                             <gw:textbox id="txtItem" styles='width:100%' onenterkey="OnSearch('DETAIL')" />
                        </td>                       
						<td style="width: 1%" align="right"> 							                     
                        </td>                                           
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('DETAIL')" />
                        </td>						 
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnNew" img="new" alt="New" onclick="OnAddNew('ITEM')" />
                        </td>      
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>                                                
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                    <tr style="height: 49%">
                        <td colspan="16">
                           <gw:grid id='grdDetail'
                                header='_PLAN_TYPE|_Date|Shift|_LINE_PK|Line|_WH_PK|W/H Name|_ITEM_PK|Item Code|Item Name|_1|_2|_3|_4|_5|_6|_7|_8|_9|_10|_11|_12|_13|_14|_15|_16|_17|_18|_19|_20|_21|_22|_23|_24|_25|_26|_27|_28|_29|_30|_31'
                                format='0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                                aligns='0|0|0|0|0|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'                                 
                                editcol='0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                                widths='0|0|1000|0|1500|0|2000|0|1500|2000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                                sorting='T'                             
                                styles='width:100%; height:100%'
                                />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>        
    </table>  
    <!------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
	<!------------------------------------------------------------------------------------------->
    <gw:grid id='grdHeader' header='COL0|COL1|COL2|COL3|COL4|COL5|COL6|COL7|COL8|COL9|COL10|COL11|COL12|COL13|COL14|COL15|COL16|COL17|COL18|COL19|COL20|COL21|COL22|COL23|COL24|COL25|COL26|COL27|COL28|COL29|COL30'
        format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
		aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
		editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
        widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' autosize='T'
        styles='width:100%; height:50%; display:none' />
	<!------------------------------------------------------------------------------------------->
</body>
</html>
