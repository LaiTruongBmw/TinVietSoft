<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Prod Plan (Line)</title>
</head>

<script>
        
   var  G0_DATE		 	= 0,
		G0_SHIFT  		= 1,
		G0_LINE_PK  	= 2,
		G0_LINE_NAME	= 3,
        G0_ITEM_PK      = 4,
        G0_ITEM_CD      = 5,
        G0_ITEM_NM 	 	= 6,
        G0_DAY01_QTY    = 7,
        G0_DAY02_QTY    = 8,
        G0_DAY03_QTY    = 9,
        G0_DAY04_QTY    = 10,  
        G0_DAY05_QTY 	= 11,
        G0_DAY06_QTY 	= 12,
        G0_DAY07_QTY 	= 13,
        G0_DAY08_QTY 	= 14,
        G0_DAY09_QTY 	= 15,
        G0_DAY10_QTY 	= 16,
        G0_DAY11_QTY 	= 17,
        G0_DAY12_QTY 	= 18,
        G0_DAY13_QTY 	= 19,
        G0_DAY14_QTY 	= 20,
        G0_DAY15_QTY 	= 21,
        G0_DAY16_QTY 	= 22,
		G0_DAY17_QTY 	= 23,
		G0_DAY18_QTY 	= 24, 
		G0_DAY19_QTY 	= 25, 
		G0_DAY20_QTY 	= 26, 
		G0_DAY21_QTY 	= 27, 
		G0_DAY22_QTY 	= 28, 
		G0_DAY23_QTY 	= 29, 
		G0_DAY24_QTY 	= 30, 
		G0_DAY25_QTY 	= 31, 
		G0_DAY26_QTY 	= 32, 
		G0_DAY27_QTY 	= 33, 
		G0_DAY28_QTY 	= 34, 	
		G0_DAY29_QTY 	= 35,
		G0_DAY30_QTY 	= 36,
		G0_DAY31_QTY 	= 37,
		G0_SEQ			= 38,
		G0_VAL_01		= 39, 
		G0_VAL_02		= 40,
		G0_VAL_03		= 41,
		G0_WPROCESS_PK	= 42;	
		
   var  G1_ITEM_CODE 	= 0,
		G1_ITEM_NAME	= 1,
		G1_TYPE			= 2,
        G1_DAY01_QTY    = 3,
        G1_DAY02_QTY    = 4,
        G1_DAY03_QTY    = 5,
        G1_DAY04_QTY    = 6,  
        G1_DAY05_QTY 	= 7,
        G1_DAY06_QTY 	= 8,
        G1_DAY07_QTY 	= 9,
        G1_DAY08_QTY 	= 10,
        G1_DAY09_QTY 	= 11,
        G1_DAY10_QTY 	= 12,
        G1_DAY11_QTY 	= 13,
        G1_DAY12_QTY 	= 14,
        G1_DAY13_QTY 	= 15,
        G1_DAY14_QTY 	= 16,
        G1_DAY15_QTY 	= 17,
        G1_DAY16_QTY 	= 18,
		G1_DAY17_QTY 	= 19,
		G1_DAY18_QTY 	= 20, 
		G1_DAY19_QTY 	= 21, 
		G1_DAY20_QTY 	= 22, 
		G1_DAY21_QTY 	= 23, 
		G1_DAY22_QTY 	= 24, 
		G1_DAY23_QTY 	= 25, 
		G1_DAY24_QTY 	= 26, 
		G1_DAY25_QTY 	= 27, 
		G1_DAY26_QTY 	= 28, 
		G1_DAY27_QTY 	= 29, 
		G1_DAY28_QTY 	= 30, 	
		G1_DAY29_QTY 	= 31,
		G1_DAY30_QTY 	= 32,
		G1_DAY31_QTY 	= 33,
		G1_SEQ			= 34;	

   var  G2_ITEM_CODE 	= 0,
		G2_ITEM_NAME	= 1,
        G2_DAY01_QTY    = 2,
        G2_DAY02_QTY    = 3,
        G2_DAY03_QTY    = 4,
        G2_DAY04_QTY    = 5,  
        G2_DAY05_QTY 	= 6,
        G2_DAY06_QTY 	= 7,
        G2_DAY07_QTY 	= 8,
        G2_DAY08_QTY 	= 9,
        G2_DAY09_QTY 	= 10,
        G2_DAY10_QTY 	= 11,
        G2_DAY11_QTY 	= 12,
        G2_DAY12_QTY 	= 13,
        G2_DAY13_QTY 	= 14,
        G2_DAY14_QTY 	= 15,
        G2_DAY15_QTY 	= 16,
        G2_DAY16_QTY 	= 17,
		G2_DAY17_QTY 	= 18,
		G2_DAY18_QTY 	= 19, 
		G2_DAY19_QTY 	= 20, 
		G2_DAY20_QTY 	= 21, 
		G2_DAY21_QTY 	= 22, 
		G2_DAY22_QTY 	= 23, 
		G2_DAY23_QTY 	= 24, 
		G2_DAY24_QTY 	= 25, 
		G2_DAY25_QTY 	= 26, 
		G2_DAY26_QTY 	= 27, 
		G2_DAY27_QTY 	= 28, 
		G2_DAY28_QTY 	= 29, 	
		G2_DAY29_QTY 	= 30,
		G2_DAY30_QTY 	= 31,
		G2_DAY31_QTY 	= 32,		 
        G2_RE01_QTY    	= 33,
        G2_RE02_QTY    	= 34,
        G2_RE03_QTY    	= 35,
        G2_RE04_QTY    	= 36,  
        G2_RE05_QTY 	= 37,
        G2_RE06_QTY 	= 38,
        G2_RE07_QTY 	= 39,
        G2_RE08_QTY 	= 40,
        G2_RE09_QTY 	= 41,
        G2_RE10_QTY 	= 42,
        G2_RE11_QTY 	= 43,
        G2_RE12_QTY 	= 44,
        G2_RE13_QTY 	= 45,
        G2_RE14_QTY 	= 46,
        G2_RE15_QTY 	= 47,
        G2_RE16_QTY 	= 48,
		G2_RE17_QTY 	= 49,
		G2_RE18_QTY 	= 50, 
		G2_RE19_QTY 	= 51, 
		G2_RE20_QTY 	= 52, 
		G2_RE21_QTY 	= 53, 
		G2_RE22_QTY 	= 54, 
		G2_RE23_QTY 	= 55, 
		G2_RE24_QTY 	= 56, 
		G2_RE25_QTY 	= 57, 
		G2_RE26_QTY 	= 58, 
		G2_RE27_QTY 	= 59, 
		G2_RE28_QTY 	= 60, 	
		G2_RE29_QTY 	= 61,
		G2_RE30_QTY 	= 62,
		G2_RE31_QTY 	= 63,		
		G2_QTY_PER_DAY	= 64,
		G2_STOCK_QTY	= 65;		

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
		
		data = "<%=ESysLib.SetListDataSQL("SELECT DISTINCT a.pk, a.GROUP_ID || ' * ' || a.group_name  FROM tlg_pb_line_group a WHERE a.del_if = 0  ORDER BY 2 ") %>||" ;    
		lstLGroup.SetDataText(data); 
		lstLGroup.value = '' ; 		

		data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC0343') FROM DUAL" )%>||";    
		lstWorkShift.SetDataText(data);   
		lstWorkShift.value = '' ;
		
		data = "<%=ESysLib.SetListDataSQL("  SELECT pk, process_id || ' * ' || process_name FROM tlg_pb_process WHERE del_if = 0 AND use_yn = 'Y' ORDER BY seq, process_id ")%>||";
        lstProcess.SetDataText( data);
        lstProcess.value = '';

		data = "<%=ESysLib.SetListDataSQL(" SELECT pk, wp_id || ' * ' || wp_name FROM tlg_pb_work_process WHERE del_if = 0 AND use_yn = 'Y' AND wi_yn = 'Y' ORDER BY wp_id")%>";
        lstWorkProcess.SetDataText( data); 
		
		var strFormat = "###,###,###,###.##";
		var strNumber = 2;
		
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
					
		grdDetail.GetGridControl().MergeCells  = 2 ;	
		grdDetail.GetGridControl().MergeCol(0) = true ;	
		grdDetail.GetGridControl().MergeCol(1) = true ;   	
		grdDetail.GetGridControl().MergeCol(2) = true ;
		grdDetail.GetGridControl().MergeCol(3) = true ;
		grdDetail.GetGridControl().MergeCol(4) = true ;
		grdDetail.GetGridControl().MergeCol(5) = true ;
		grdDetail.GetGridControl().MergeCol(6) = true ;

		strFormat = "###,###,###,###";
		 
		var ctrl = grdTotal.GetGridControl();
		        		        
        ctrl.ColFormat(G1_DAY01_QTY) = strFormat;
        ctrl.ColFormat(G1_DAY02_QTY) = strFormat;
        ctrl.ColFormat(G1_DAY03_QTY) = strFormat;
        ctrl.ColFormat(G1_DAY04_QTY) = strFormat;
        ctrl.ColFormat(G1_DAY05_QTY) = strFormat;
        ctrl.ColFormat(G1_DAY06_QTY) = strFormat;
        ctrl.ColFormat(G1_DAY07_QTY) = strFormat;
        ctrl.ColFormat(G1_DAY08_QTY) = strFormat;
        ctrl.ColFormat(G1_DAY09_QTY) = strFormat;
        ctrl.ColFormat(G1_DAY10_QTY) = strFormat;
        ctrl.ColFormat(G1_DAY11_QTY) = strFormat;
        ctrl.ColFormat(G1_DAY12_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY13_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY14_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY15_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY16_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY17_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY18_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY19_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY20_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY21_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY22_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY23_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY24_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY25_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY26_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY27_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY28_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY29_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY30_QTY) = strFormat;
		ctrl.ColFormat(G1_DAY31_QTY) = strFormat;
		
    }	 
    //==============================================================================
    function OnSearch(objV)
    {    
        switch(objV)
        { 
	        case 'DETAIL':
			    data_fpip00140.Call('SELECT');
			break; 

			case 'HEADER':
			    data_fpip00140_date_header.Call('SELECT');
			break; 	
        }
    }
    
    //==============================================================================
    function OnDataReceive(objV)
    {
        switch(objV.id)
        {			 
            case 'data_fpip00140': 
			    if ( grdDetail.rows > 1 )
				{            		
					for ( var i=1; i<grdDetail.rows; i++ )
					{
						if ( grdDetail.GetGridData( i, G0_SEQ) == 2 )
						{
							grdDetail.SetCellBgColor( i, G0_DATE, i, G0_DAY31_QTY, 0xFFFFCC );                  
						}                    
					}	
				} 
            break;
			
			case 'data_fpip00140_1': 
			    if ( grdItem.rows > 1 )
				{    
					grdTotal.ClearData();
					
					for ( var i=1; i<grdItem.rows; i++ )
					{
						//---------------------
						grdTotal.AddRow();
						
						grdTotal.SetGridText( grdTotal.rows-1, G1_ITEM_CODE, grdItem.GetGridData( i, G2_ITEM_CODE ));
						grdTotal.SetGridText( grdTotal.rows-1, G1_ITEM_NAME, grdItem.GetGridData( i, G2_ITEM_NAME ));						
						grdTotal.SetGridText( grdTotal.rows-1, G1_TYPE, 'DELI' );
						
						for ( var t=0; t<31; t++)
						{
							grdTotal.SetGridText( grdTotal.rows-1, G1_DAY01_QTY + t, grdItem.GetGridData( i, G2_DAY01_QTY + t ));							
						}
						//---------------------
						grdTotal.AddRow();	
						
						grdTotal.SetGridText( grdTotal.rows-1, G1_ITEM_CODE, grdItem.GetGridData( i, G2_ITEM_CODE ));
						grdTotal.SetGridText( grdTotal.rows-1, G1_ITEM_NAME, grdItem.GetGridData( i, G2_ITEM_NAME ));
						grdTotal.SetGridText( grdTotal.rows-1, G1_TYPE, 'PROD' );
						
						for ( var t=0; t<31; t++)
						{
							grdTotal.SetGridText( grdTotal.rows-1, G1_DAY01_QTY + t, grdItem.GetGridData( i, G2_RE01_QTY + t ));							
						}
						//---------------------
						grdTotal.AddRow();	

						grdTotal.SetGridText( grdTotal.rows-1, G1_ITEM_CODE, grdItem.GetGridData( i, G2_ITEM_CODE ));
						grdTotal.SetGridText( grdTotal.rows-1, G1_ITEM_NAME, grdItem.GetGridData( i, G2_ITEM_NAME ));
						grdTotal.SetGridText( grdTotal.rows-1, G1_TYPE, 'STOCK' );	

						var tmp_qty = 0;		
						 
						tmp_qty = Number(grdItem.GetGridData( i, G2_STOCK_QTY )) + Number(grdTotal.GetGridData( grdTotal.rows-2, G1_DAY01_QTY )) - Number(grdTotal.GetGridData( grdTotal.rows-3, G1_DAY01_QTY )) ;
						 
						grdTotal.SetGridText( grdTotal.rows-1, G1_DAY01_QTY, tmp_qty );		
						
						for ( var t=1; t<31; t++)
						{
							 						 
							tmp_qty = Number(grdTotal.GetGridData( grdTotal.rows-1, G1_DAY01_QTY + t - 1 )) + Number(grdTotal.GetGridData( grdTotal.rows-2, G1_DAY01_QTY + t )) - Number(grdTotal.GetGridData( grdTotal.rows-3, G1_DAY01_QTY + t )) ;
														 
							grdTotal.SetGridText( grdTotal.rows-1, G1_DAY01_QTY + t, tmp_qty );							
						}
						//---------------------
						grdTotal.AddRow();	

						grdTotal.SetGridText( grdTotal.rows-1, G1_ITEM_CODE, grdItem.GetGridData( i, G2_ITEM_CODE ));
						grdTotal.SetGridText( grdTotal.rows-1, G1_ITEM_NAME, grdItem.GetGridData( i, G2_ITEM_NAME ));
						grdTotal.SetGridText( grdTotal.rows-1, G1_TYPE, 'DAYs' );	

						for ( var t=0; t<31; t++)
						{							 						
							tmp_qty = Number(grdTotal.GetGridData( grdTotal.rows-2, G1_DAY01_QTY + t )) / Number(grdItem.GetGridData( i, G2_QTY_PER_DAY )) ;
														 
							grdTotal.SetGridText( grdTotal.rows-1, G1_DAY01_QTY + t, tmp_qty );							
						}
						
						grdTotal.SetCellBgColor( grdTotal.rows-1, G1_TYPE, grdTotal.rows-1, G1_DAY31_QTY, 0xFFFFCC ); 						
						//---------------------
						grdTotal.GetGridControl().MergeCells  = 2 ;	
						grdTotal.GetGridControl().MergeCol(0) = true ;	
						grdTotal.GetGridControl().MergeCol(1) = true ;   							 		
					}	
				} 
            break;
			
			case 'data_fpip00140_date_header':
				
				
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
					
					grdTotal.SetGridText( 0, G1_DAY01_QTY, g_01_date);
                    grdTotal.SetGridText( 0, G1_DAY02_QTY, g_02_date);
                    grdTotal.SetGridText( 0, G1_DAY03_QTY, g_03_date);
                    grdTotal.SetGridText( 0, G1_DAY04_QTY, g_04_date);
                    grdTotal.SetGridText( 0, G1_DAY05_QTY, g_05_date);
                    grdTotal.SetGridText( 0, G1_DAY06_QTY, g_06_date);
                    grdTotal.SetGridText( 0, G1_DAY07_QTY, g_07_date);
                    grdTotal.SetGridText( 0, G1_DAY08_QTY, g_08_date);
                    grdTotal.SetGridText( 0, G1_DAY09_QTY, g_09_date);
                    grdTotal.SetGridText( 0, G1_DAY10_QTY, g_10_date);
					grdTotal.SetGridText( 0, G1_DAY11_QTY, g_11_date);
					grdTotal.SetGridText( 0, G1_DAY12_QTY, g_12_date);
					grdTotal.SetGridText( 0, G1_DAY13_QTY, g_13_date);
					grdTotal.SetGridText( 0, G1_DAY14_QTY, g_14_date);
					grdTotal.SetGridText( 0, G1_DAY15_QTY, g_15_date);
					grdTotal.SetGridText( 0, G1_DAY16_QTY, g_16_date);
					grdTotal.SetGridText( 0, G1_DAY17_QTY, g_17_date);
					grdTotal.SetGridText( 0, G1_DAY18_QTY, g_18_date);
					grdTotal.SetGridText( 0, G1_DAY19_QTY, g_19_date);
					grdTotal.SetGridText( 0, G1_DAY20_QTY, g_20_date);
					grdTotal.SetGridText( 0, G1_DAY21_QTY, g_21_date);
					grdTotal.SetGridText( 0, G1_DAY22_QTY, g_22_date);
					grdTotal.SetGridText( 0, G1_DAY23_QTY, g_23_date);
					grdTotal.SetGridText( 0, G1_DAY24_QTY, g_24_date);
					grdTotal.SetGridText( 0, G1_DAY25_QTY, g_25_date);
					grdTotal.SetGridText( 0, G1_DAY26_QTY, g_26_date);
					grdTotal.SetGridText( 0, G1_DAY27_QTY, g_27_date);
					grdTotal.SetGridText( 0, G1_DAY28_QTY, g_28_date);
					grdTotal.SetGridText( 0, G1_DAY29_QTY, g_29_date);
					grdTotal.SetGridText( 0, G1_DAY30_QTY, g_30_date);				
					grdTotal.SetGridText( 0, G1_DAY31_QTY, g_31_date);					
                    
                    //mark font color
                    if ( g_01_day == 'SUNDAY')
                    {                        
                        grdDetail.SetCellFontColor( 0, G0_DAY01_QTY, 0, G0_DAY01_QTY, 0x3300cc);
						grdTotal.SetCellFontColor(  0, G0_DAY01_QTY, 0, G0_DAY01_QTY, 0x3300cc);
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

 //===================================================================================
function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdDetail" :
            
                var event_col = event.col ;
                var event_row = event.row ;
				
                if ( event_col == G0_ITEM_CD && event_row > 0 )
                {					
					data_fpip00140_1.Call("SELECT");
                }
				 
            break;             
      }         
}   
 
 
    //==============================================================================
    function OnPopUp(pos)
    {
		switch(pos)
		{
			case 'REPORT':
				 
					var path = System.RootURL + '/form/fp/ip/fpip00144.aspx';
					var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
				        
			break;    
		}
    }
//===================================================================================================
function OnReport(para)
{
    switch(para)
    {      
		case 'ST01':
            var url =System.RootURL + "/reports/fp/ip/rpt_fpip00140_ST01.aspx?p_prod_date="+dtDate.value+"&p_work_process_pk="+lstWorkProcess.value; 
            System.OpenTargetPage(url);                  
        break;  				 		 
    }
}
    //==============================================================================
    function OnAddNew()
    {
		if ( lstLine.value == '' ) 
		{
			alert("PLS SELECT LINE !");			
			return;
		}
		else if ( lstWorkShift.value == '' )
		{
			alert("PLS SELECT WORK SHIFT !");			
			return;
		}
		else if ( lstWorkProcess.value == '' )
		{
			alert("PLS SELECT WORK PROCESS !");			
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
		            
				grdDetail.SetGridText( grdDetail.rows-1, G0_DATE, 	 	dtDate.value );  
					
				grdDetail.SetGridText( grdDetail.rows-1, G0_SHIFT, 		lstWorkShift.value );
				
				grdDetail.SetGridText( grdDetail.rows-1, G0_LINE_PK, 	lstLine.value     );  
				grdDetail.SetGridText( grdDetail.rows-1, G0_LINE_NAME, 	lstLine.GetText() );      

				grdDetail.SetGridText( grdDetail.rows-1, G0_ITEM_PK,    arrTemp[0]   );    
				grdDetail.SetGridText( grdDetail.rows-1, G0_ITEM_CD,	arrTemp[1]   ); 
				grdDetail.SetGridText( grdDetail.rows-1, G0_ITEM_NM,	arrTemp[2]   );
				
				grdDetail.SetGridText( grdDetail.rows-1, G0_WPROCESS_PK, lstWorkProcess.value );				 
		    }
		 }		 
		 
    }
	 
    //==============================================================================
    function OnSave()
    {
		if ( confirm("Do you want to save date ?") )
		{
			data_fpip00140.Call();
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
				pro_fpip00140_line.Call();
			break;
			
		case 'WorkProcess':
				pro_fpip00140_work_process.Call();
			break;
		}				
    }     	
	
//=================================================================================

function CheckInput()
{   
    var col, row
    
    col = event.col;
    row = event.row;
     
	//---------------------
    if ( col >= G0_DAY01_QTY && col <= G0_DAY31_QTY )
    {
		//-------------------------------------
		if ( grdDetail.GetGridData( row, G0_SEQ) == 2 )
		{ 
			if ( grdDetail.GetGridData( row, col ) == 'D' )
			{
				grdDetail.SetGridText( row, col, '21.99' );			
			}
			else if ( grdDetail.GetGridData( row, col ) == 'E' )
			{
				grdDetail.SetGridText( row, col, '14.66' );			
			}
			else if ( grdDetail.GetGridData( row, col ) == 'F' )
			{
				grdDetail.SetGridText( row, col, '7.33' );			
			}
			else if ( grdDetail.GetGridData( row, col ) == 'A' )
			{
				grdDetail.SetGridText( row, col, '21' );			
			}
			else if ( grdDetail.GetGridData( row, col ) == 'B' )
			{
				grdDetail.SetGridText( row, col, '16' );			
			}
			else if ( grdDetail.GetGridData( row, col ) == 'C' )
			{
				grdDetail.SetGridText( row, col, '8' );			
			}
		} //alert;
		//-------------------------------------
        var dQuantiy ;
         
        dQuantiy = grdDetail.GetGridData(row,col);
         		 
        if ( Number(dQuantiy) )
        {   
            if (dQuantiy > 0)
            {   
                grdDetail.SetGridText( row, col, System.Round(dQuantiy, arr_FormatNumber[col]) );
            }
            else
            {
                grdDetail.SetGridText( row, col, "");
            }
        }
		else if ( Number(dQuantiy) == 0 )
		{ 
		}		
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        }
    }
    //---------------------
	if ( grdDetail.GetGridData( row, G0_SEQ) == 2 )
	{
		var plan_qty = Number(grdDetail.GetGridData( row, col)) * Number(grdDetail.GetGridData( row, G0_VAL_03));
			
		grdDetail.SetGridText( row-1, col, System.Round( plan_qty, 0) );	
	}	
}
//==================================================================
 function OnToggle()
 {
    var tab_top  = document.all("tab_top");    
    var tab_bottom = document.all("tab_bottom");
	
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        tab_top.style.display="none";       
        imgArrow.status = "collapse";
        tab_bottom.style.height="99%";
        imgArrow.src = "../../../system/images/down.gif";
    }
    else
    {
        tab_top.style.display="";
        imgArrow.status = "expand";
        tab_bottom.style.height="40%";
        imgArrow.src = "../../../system/images/up.gif";
    }
 }    
  
	//==============================================================================
</script>

<body>
	<!---------------------------------------------------------------->
    <gw:data id="pro_fpip00140_work_process" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpip00140_work_process" > 
                <input>
                    <input bind="lstProcess" /> 
                </input> 
                <output>
                    <output bind="lstWorkProcess" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpip00140_line" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="list" procedure="<%=l_user%>lg_pro_fpip00140_line" > 
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
    <gw:data id="data_fpip00140_date_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpip00140_date_header"> 
                <input> 					
                    <input bind="dtDate" />
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpip00140" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id = "1" type = "grid" parameter ="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42" function = "<%=l_user%>lg_sel_fpip00140" procedure="<%=l_user%>lg_upd_fpip00140" > 
                <input >	
					<input bind="lstWorkProcess" />
					<input bind="lstLGroup" />
					<input bind="lstLine" />
                 	<input bind="dtDate" />
					<input bind="lstWorkShift" />
				    <input bind="txtItem" />                      
                </input> 
                 <output bind="grdDetail" />                      
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------>
    <gw:data id="data_fpip00140_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id = "1" type = "grid" parameter ="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42" function = "<%=l_user%>lg_sel_fpip00140_1"   > 
                <input >	
					
					<input bind="dtDate" />
					<input bind="lstWorkProcess" />		 
						
                </input> 
                 <output bind="grdItem" />                      
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
						<td style="width: 5%" align="left">
                            <img id="imgArrow" status="expand"  src="../../../system/images/up.gif"
                                style="cursor: hand" onclick="OnToggle()" />
						</td>
						<td style="width: 5%; white-space: nowrap" align="right">
                            Line
                        </td>
                        <td style="width: 10%" align="right">
                            <gw:list id="lstLGroup" styles="width: 100%" onchange="OnProcess('Line')" />
                        </td>                         
                        <td style="width: 15%">
                            <gw:list id="lstLine" styles="width: 100%" onchange="OnSearch('DETAIL')" />
                        </td>
						
						<td style="width: 5%; white-space: nowrap" align="right">
                            Process
                        </td>
						<td style="width: 10%" align="right">
                            <gw:list id="lstProcess" styles="width: 100%" onchange="OnProcess('WorkProcess')" />
                        </td>                         
                        <td style="width: 15%">
                            <gw:list id="lstWorkProcess" styles="width: 100%" onchange="" />
                        </td>
						
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Date
                        </td>
                        <td style="width: 5%; white-space: nowrap" align="left">
                            <gw:datebox id="dtDate" lang="1" type='date' onchange="OnSearch('HEADER')" />
                        </td>
						<td style="width: 10%; white-space: nowrap" align="right">
                            <gw:list id="lstWorkShift" styles='width:100%' onchange="OnSearch('DETAIL')" />
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
                            <gw:imgbtn id="btnNew" img="new" alt="New" onclick="OnAddNew()" />
                        </td>      
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>                                                
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" />
                        </td>
						<td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnReport" img="excel" alt="Report" onclick="OnPopUp('REPORT')" />
                        </td>
                    </tr>
                    
                    <tr style="height: 59%" id="tab_top" >
                        <td colspan="18">
                           <gw:grid id='grdDetail'
                                header='_Date|Shift|_LINE_PK|Line|_ITEM_PK|Item Code|Item Name|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|_SEQ|C/T|OEE|UPH|_WP_PK'
                                format='0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0'
                                aligns='0|0|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|0|0|0|0|0'                                 
                                editcol='0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0'
                                widths='0|800|0|1500|0|2000|2000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|0|800|800|800|0'
                                sorting='F'                             
                                styles='width:100%; height:100%'
								onafteredit="CheckInput()"
								oncelldblclick="OnGridCellDoubleClick(this)"
                                />
                        </td>
                    </tr>
					
					<tr style="height: 40%" id="tab_bottom" >
                        <td colspan="18">
                           <gw:grid id='grdTotal'
                                header='Item Code|Item Name|-|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|_SEQ'
                                format='0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0'
                                aligns='0|0|1|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|0'                                 
                                editcol='0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0'
                                widths='1500|2500|800|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|0'
                                sorting='F'                             
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
	<gw:grid id='grdItem'
		header='ITEM_CODE|ITEM_NAME|DAY_01|DAY_02|DAY_03|DAY_04|DAY_05|DAY_06|DAY_07|DAY_08|DAY_09|DAY_10|DAY_11|DAY_12|DAY_13|DAY_14|DAY_15|DAY_16|DAY_17|DAY_18|DAY_19|DAY_20|DAY_21|DAY_22|DAY_23|DAY_24|DAY_25|DAY_26|DAY_27|DAY_28|DAY_29|DAY_30|DAY_31|RE_01|RE_02|RE_03|RE_04|RE_05|RE_06|RE_07|RE_08|RE_09|RE_10|RE_11|RE_12|RE_13|RE_14|RE_15|RE_16|RE_17|RE_18|RE_19|RE_20|RE_21|RE_22|RE_23|RE_24|RE_25|RE_26|RE_27|RE_28|RE_29|RE_30|RE_31|QTY_PER_DAY|STOCK_QTY'
		format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
		aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
		check='|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'
		editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
		widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000' 
		styles='width:100%; display:none'
		/>	
	<!------------------------------------------------------------------------------------------->
</body>
</html>
