<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>W/H Stock Checking 4</title>
</head>

<script>
   
var G1_GRP_PK	  = 0,
	G1_GRP_CODE   = 1,
	G1_ITEM_PK    = 2,    
    G1_ITEM_CODE  = 3,
    G1_ITEM_NAME  = 4, 	 	
	G1_UOM		  = 5,	 
    G1_BEGIN_01   = 6,
    G1_IN_01      = 7,
    G1_OUT_01     = 8,
    G1_END_01     = 9,
	G1_BEGIN_02   = 10,
    G1_IN_02      = 11,
    G1_OUT_02     = 12,
    G1_END_02     = 13,
	G1_BEGIN_03   = 14,
    G1_IN_03      = 15,
    G1_OUT_03     = 16,
    G1_END_03     = 17,
	G1_BEGIN_04   = 18,
    G1_IN_04      = 19,
    G1_OUT_04     = 20,
    G1_END_04     = 21,
	G1_BEGIN_05   = 22,
    G1_IN_05      = 23,
    G1_OUT_05     = 24,
    G1_END_05     = 25,
	G1_BEGIN_06   = 26,
    G1_IN_06      = 27,
    G1_OUT_06     = 28,
    G1_END_06     = 29,
	G1_BEGIN_07   = 30,
    G1_IN_07      = 31,
    G1_OUT_07     = 32,
    G1_END_07     = 33,
	G1_BEGIN_08   = 34,
    G1_IN_08      = 35,
    G1_OUT_08     = 36,
    G1_END_08     = 37,
	G1_BEGIN_09   = 38,
    G1_IN_09      = 39,
    G1_OUT_09     = 40,
    G1_END_09     = 41,
	G1_BEGIN_10   = 42,
    G1_IN_10      = 43,
    G1_OUT_10     = 44,
    G1_END_10     = 45;
	
var G2_WH_PK_01 = 0,	 
	G2_WH_PK_02 = 1,
	G2_WH_PK_03 = 2,
	G2_WH_PK_04 = 3,
	G2_WH_PK_05 = 4,
	G2_WH_PK_06 = 5,
	G2_WH_PK_07 = 6,	 
	G2_WH_PK_08 = 7,	
	G2_WH_PK_09 = 8,	
	G2_WH_PK_10 = 9,	
	G2_WH_NM_01 = 10,
	G2_WH_NM_02 = 11,		
	G2_WH_NM_03 = 12,	
	G2_WH_NM_04 = 13,
	G2_WH_NM_05 = 14,
	G2_WH_NM_06	= 15,
	G2_WH_NM_07	= 16,
	G2_WH_NM_08	= 17,
	G2_WH_NM_09	= 18,
	G2_WH_NM_10	= 19;
	 
//=============================================================================             
function BodyInit()
{       
    System.Translate(document); 
    FormatGrid();
	BindReportList();	
}
//=============================================================================           
function FormatGrid()
{
    var data ;
 
	data = "<%=CtlLib.SetListDataSQL("SELECT   pk, strg_id || ' * ' || strg_name FROM tlg_in_storage WHERE del_if = 0 AND use_yn = 'Y' ORDER BY strg_id ")%>||";   
    lstStorage.SetDataText(data);
	lstStorage.value = "";	

	data = "<%=CtlLib.SetListDataFUNC("SELECT LG_F_LOGISTIC_CODE('LGIN0210') FROM DUAL" )%>||";
    lstWHType.SetDataText(data);
    lstWHType.value = '';	 	 
	
    data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' * ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||";     
    lstItemGroup01.SetDataText(data);
    lstItemGroup01.value = '';	
    
    data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    lstLang1.SetDataText(data);      
    lstLang1.value = "<%=Session("SESSION_LANG")%>";	
	
    data = "data|10|Grand Total|20|Group Subtotal";
    lstGridType.SetDataText(data);  
    lstGridType.value = '10'; 
    		
    var ctrl = grdINOUT.GetGridControl();   
      
    ctrl.ColFormat(G1_BEGIN_01) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_IN_01)    = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_01)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_01)   = "###,###,###.##" ;	
    ctrl.ColFormat(G1_BEGIN_02) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_IN_02)    = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_02)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_02)   = "###,###,###.##" ;
    ctrl.ColFormat(G1_BEGIN_03) = "###,###,###.##" ;    
    ctrl.ColFormat(G1_IN_03)    = "###,###,###.##" ; 
	ctrl.ColFormat(G1_OUT_03)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_03)   = "###,###,###.##" ;
    ctrl.ColFormat(G1_BEGIN_04) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_IN_04)    = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_04)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_04)   = "###,###,###.##" ;	
	ctrl.ColFormat(G1_BEGIN_05) = "###,###,###.##" ;    
    ctrl.ColFormat(G1_IN_05)    = "###,###,###.##" ; 
	ctrl.ColFormat(G1_OUT_05)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_05)   = "###,###,###.##" ;
    ctrl.ColFormat(G1_BEGIN_06) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_IN_06)    = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_06)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_06)   = "###,###,###.##" ;	
    ctrl.ColFormat(G1_BEGIN_07) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_IN_07)    = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_07)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_07)   = "###,###,###.##" ;			 
	ctrl.ColFormat(G1_BEGIN_08) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_IN_08)    = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_08)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_08)   = "###,###,###.##" ; 
	ctrl.ColFormat(G1_BEGIN_09) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_IN_09)    = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_09)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_09)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_BEGIN_10) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_IN_10)    = "###,###,###.##" ;
	ctrl.ColFormat(G1_OUT_10)   = "###,###,###.##" ;
	ctrl.ColFormat(G1_END_10)   = "###,###,###.##" ;	
	
	ctrl.FrozenCols = G1_ITEM_NAME ; 	
		 	  	
}  
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    {               
        case 'BALANCE':           
            //---------------------  			     
            data_bisc00100_1.Call('SELECT');			 
        break;  	
		
		case 'HEADER':
		    //--------------------------
			data_bisc00100.Call('SELECT');
		break;			 
    }
}
  
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {              
        case 'data_bisc00100_1':   
			       
            if ( grdINOUT.rows > 1 )
            {
				var fg = grdINOUT.GetGridControl();
				
				fg.FixedRows  = 2 ;
            	fg.MergeCells = 5 ;
				
				fg.MergeCol(G1_GRP_CODE)  = true;
				fg.MergeCol(G1_ITEM_CODE) = true;
				fg.MergeCol(G1_ITEM_NAME) = true;
				fg.MergeCol(G1_UOM)       = true;
				
                fg.Cell(0, 0, G1_GRP_CODE,  1, G1_GRP_CODE  ) = "Group";                
                fg.Cell(0, 0, G1_ITEM_CODE, 1, G1_ITEM_CODE ) = "Item Code";                 
                fg.Cell(0, 0, G1_ITEM_NAME, 1, G1_ITEM_NAME ) = "Item Name";
				fg.Cell(0, 0, G1_UOM,       1, G1_UOM       ) = "UOM";
				
				fg.MergeRow(0) = true;
				 
				//------------------------------------------------------------------
				fg.ColHidden(G1_BEGIN_01) = true ;
				fg.ColHidden(G1_IN_01)    = true ;
				fg.ColHidden(G1_OUT_01)   = true ;
				fg.ColHidden(G1_END_01)   = true ;
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_01 ) != '' )
				{
					fg.Cell(0, 0, G1_BEGIN_01, 0, G1_END_01 ) = grdHeader.GetGridData( 1, G2_WH_NM_01 );
					fg.Cell(0, 1, G1_BEGIN_01, 1 ) = "Begin" ;
                	fg.Cell(0, 1, G1_IN_01,    1 ) = "In" ;
                	fg.Cell(0, 1, G1_OUT_01,   1 ) = "Out" ;
					fg.Cell(0, 1, G1_END_01,   1 ) = "End" ;
					
					fg.ColHidden(G1_BEGIN_01) = false ;
					fg.ColHidden(G1_IN_01)    = false ;
					fg.ColHidden(G1_OUT_01)   = false ;
					fg.ColHidden(G1_END_01)   = false ;
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_BEGIN_02) = true ;
				fg.ColHidden(G1_IN_02)    = true ;
				fg.ColHidden(G1_OUT_02)   = true ;
				fg.ColHidden(G1_END_02)   = true ;
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_02 ) != '' )
				{
					fg.Cell(0, 0, G1_BEGIN_02, 0, G1_END_02 ) = grdHeader.GetGridData( 1, G2_WH_NM_02 );
					fg.Cell(0, 1, G1_BEGIN_02, 1 ) = "Begin" ;
                	fg.Cell(0, 1, G1_IN_02,    1 ) = "In" ;
                	fg.Cell(0, 1, G1_OUT_02,   1 ) = "Out" ;
					fg.Cell(0, 1, G1_END_02,   1 ) = "End" ;
					
					fg.ColHidden(G1_BEGIN_02) = false ;
					fg.ColHidden(G1_IN_02)    = false ;
					fg.ColHidden(G1_OUT_02)   = false ;
					fg.ColHidden(G1_END_02)   = false ;
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_BEGIN_03) = true ;
				fg.ColHidden(G1_IN_03)    = true ;
				fg.ColHidden(G1_OUT_03)   = true ;
				fg.ColHidden(G1_END_03)   = true ;
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_03 ) != '' )
				{
					fg.Cell(0, 0, G1_BEGIN_03, 0, G1_END_03 ) = grdHeader.GetGridData( 1, G2_WH_NM_03 );
					fg.Cell(0, 1, G1_BEGIN_03, 1 ) = "Begin" ;
                	fg.Cell(0, 1, G1_IN_03,    1 ) = "In" ;
                	fg.Cell(0, 1, G1_OUT_03,   1 ) = "Out" ;
					fg.Cell(0, 1, G1_END_03,   1 ) = "End" ;
					
					fg.ColHidden(G1_BEGIN_03) = false ;
					fg.ColHidden(G1_IN_03)    = false ;
					fg.ColHidden(G1_OUT_03)   = false ;
					fg.ColHidden(G1_END_03)   = false ;
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_BEGIN_04) = true ;
				fg.ColHidden(G1_IN_04)    = true ;
				fg.ColHidden(G1_OUT_04)   = true ;
				fg.ColHidden(G1_END_04)   = true ;
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_04 ) != '' )
				{
					fg.Cell(0, 0, G1_BEGIN_04, 0, G1_END_04 ) = grdHeader.GetGridData( 1, G2_WH_NM_04 );
					fg.Cell(0, 1, G1_BEGIN_04, 1 ) = "Begin" ;
                	fg.Cell(0, 1, G1_IN_04,    1 ) = "In" ;
                	fg.Cell(0, 1, G1_OUT_04,   1 ) = "Out" ;
					fg.Cell(0, 1, G1_END_04,   1 ) = "End" ;
					
					fg.ColHidden(G1_BEGIN_04) = false ;
					fg.ColHidden(G1_IN_04)    = false ;
					fg.ColHidden(G1_OUT_04)   = false ;
					fg.ColHidden(G1_END_04)   = false ;
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_BEGIN_05) = true ;
				fg.ColHidden(G1_IN_05)    = true ;
				fg.ColHidden(G1_OUT_05)   = true ;
				fg.ColHidden(G1_END_05)   = true ;
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_05 ) != '' )
				{
					fg.Cell(0, 0, G1_BEGIN_05, 0, G1_END_05 ) = grdHeader.GetGridData( 1, G2_WH_NM_05 );
					fg.Cell(0, 1, G1_BEGIN_05, 1 ) = "Begin" ;
                	fg.Cell(0, 1, G1_IN_05,    1 ) = "In" ;
                	fg.Cell(0, 1, G1_OUT_05,   1 ) = "Out" ;
					fg.Cell(0, 1, G1_END_05,   1 ) = "End" ;
					
					fg.ColHidden(G1_BEGIN_05) = false ;
					fg.ColHidden(G1_IN_05)    = false ;
					fg.ColHidden(G1_OUT_05)   = false ;
					fg.ColHidden(G1_END_05)   = false ;
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_BEGIN_06) = true ;
				fg.ColHidden(G1_IN_06)    = true ;
				fg.ColHidden(G1_OUT_06)   = true ;
				fg.ColHidden(G1_END_06)   = true ;
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_06 ) != '' )
				{
					fg.Cell(0, 0, G1_BEGIN_06, 0, G1_END_06 ) = grdHeader.GetGridData( 1, G2_WH_NM_06 );
					fg.Cell(0, 1, G1_BEGIN_06, 1 ) = "Begin" ;
                	fg.Cell(0, 1, G1_IN_06,    1 ) = "In" ;
                	fg.Cell(0, 1, G1_OUT_06,   1 ) = "Out" ;
					fg.Cell(0, 1, G1_END_06,   1 ) = "End" ;
					
					fg.ColHidden(G1_BEGIN_06) = false ;
					fg.ColHidden(G1_IN_06)    = false ;
					fg.ColHidden(G1_OUT_06)   = false ;
					fg.ColHidden(G1_END_06)   = false ;
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_BEGIN_07) = true ;
				fg.ColHidden(G1_IN_07)    = true ;
				fg.ColHidden(G1_OUT_07)   = true ;
				fg.ColHidden(G1_END_07)   = true ;
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_07 ) != '' )
				{
					fg.Cell(0, 0, G1_BEGIN_07, 0, G1_END_07 ) = grdHeader.GetGridData( 1, G2_WH_NM_07 );
					fg.Cell(0, 1, G1_BEGIN_07, 1 ) = "Begin" ;
                	fg.Cell(0, 1, G1_IN_07,    1 ) = "In" ;
                	fg.Cell(0, 1, G1_OUT_07,   1 ) = "Out" ;
					fg.Cell(0, 1, G1_END_07,   1 ) = "End" ;
					
					fg.ColHidden(G1_BEGIN_07) = false ;
					fg.ColHidden(G1_IN_07)    = false ;
					fg.ColHidden(G1_OUT_07)   = false ;
					fg.ColHidden(G1_END_07)   = false ;
				}
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				 
				fg.ColHidden(G1_BEGIN_08) = true ;
				fg.ColHidden(G1_IN_08)    = true ;
				fg.ColHidden(G1_OUT_08)   = true ;
				fg.ColHidden(G1_END_08)   = true ;
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_08 ) != '' )
				{
					fg.Cell(0, 0, G1_BEGIN_08, 0, G1_END_08 ) = grdHeader.GetGridData( 1, G2_WH_NM_08 );
					fg.Cell(0, 1, G1_BEGIN_08, 1 ) = "Begin" ;
                	fg.Cell(0, 1, G1_IN_08,    1 ) = "In" ;
                	fg.Cell(0, 1, G1_OUT_08,   1 ) = "Out" ;
					fg.Cell(0, 1, G1_END_08,   1 ) = "End" ;
					
					fg.ColHidden(G1_BEGIN_08) = false ;
					fg.ColHidden(G1_IN_08)    = false ;
					fg.ColHidden(G1_OUT_08)   = false ;
					fg.ColHidden(G1_END_08)   = false ;
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_BEGIN_09) = true ;
				fg.ColHidden(G1_IN_09)    = true ;
				fg.ColHidden(G1_OUT_09)   = true ;
				fg.ColHidden(G1_END_09)   = true ;
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_09 ) != '' )
				{
					fg.Cell(0, 0, G1_BEGIN_09, 0, G1_END_09 ) = grdHeader.GetGridData( 1, G2_WH_NM_09 );
					fg.Cell(0, 1, G1_BEGIN_09, 1 ) = "Begin" ;
                	fg.Cell(0, 1, G1_IN_09,    1 ) = "In" ;
                	fg.Cell(0, 1, G1_OUT_09,   1 ) = "Out" ;
					fg.Cell(0, 1, G1_END_09,   1 ) = "End" ;
					
					fg.ColHidden(G1_BEGIN_09) = false ;
					fg.ColHidden(G1_IN_09)    = false ;
					fg.ColHidden(G1_OUT_09)   = false ;
					fg.ColHidden(G1_END_09)   = false ;
				}
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_BEGIN_10) = true ;
				fg.ColHidden(G1_IN_10)    = true ;
				fg.ColHidden(G1_OUT_10)   = true ;
				fg.ColHidden(G1_END_10)   = true ;
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_10 ) != '' )
				{
					fg.Cell(0, 0, G1_BEGIN_10, 0, G1_END_10 ) = grdHeader.GetGridData( 1, G2_WH_NM_10 );
					fg.Cell(0, 1, G1_BEGIN_10, 1 ) = "Begin" ;
                	fg.Cell(0, 1, G1_IN_10,    1 ) = "In" ;
                	fg.Cell(0, 1, G1_OUT_10,   1 ) = "Out" ;
					fg.Cell(0, 1, G1_END_10,   1 ) = "End" ;
					
					fg.ColHidden(G1_BEGIN_10) = false ;
					fg.ColHidden(G1_IN_10)    = false ;
					fg.ColHidden(G1_OUT_10)   = false ;
					fg.ColHidden(G1_END_10)   = false ;
				}
				//--------------------------------------------------------------------
                if (grdINOUT.rows > 2)
                {
                    grdINOUT.SetCellBold( 1, G1_ITEM_CODE, grdINOUT.rows-1, G1_ITEM_CODE, true);							                
                    
                    grdINOUT.SetCellBgColor( 2, G1_BEGIN_01, grdINOUT.rows - 1, G1_END_01, 0xCCFFFF );			
				    grdINOUT.SetCellBgColor( 2, G1_BEGIN_03, grdINOUT.rows - 1, G1_END_03, 0xCCFFFF );	
				    grdINOUT.SetCellBgColor( 2, G1_BEGIN_05, grdINOUT.rows - 1, G1_END_05, 0xCCFFFF );	
				    grdINOUT.SetCellBgColor( 2, G1_BEGIN_07, grdINOUT.rows - 1, G1_END_07, 0xCCFFFF );
				    grdINOUT.SetCellBgColor( 2, G1_BEGIN_09, grdINOUT.rows - 1, G1_END_09, 0xCCFFFF );
				}
				
				if ( lstGridType.value == '10' )
	            {
	                grdINOUT.Subtotal( 0, 2, -1, '6!7!8!9!10!11!12!13!14!15!16!17!18!19!20!21!22!23!24!25!26!27!28!29!30!31!32!33!34!35!36!37!38!39!40!41!42!43!44!45','###,###,###.##');							
	            }
	            else if ( lstGridType.value == '20' )
	            {
	                grdINOUT.Subtotal( 0, 2, 0, '6!7!8!9!10!11!12!13!14!15!16!17!18!19!20!21!22!23!24!25!26!27!28!29!30!31!32!33!34!35!36!37!38!39!40!41!42!43!44!45','###,###,###.##');							
	            }
            }            
        break;    

		case 'data_bisc00100': 
		 
			if ( grdHeader.rows > 1 )
			{
				txtWHPK_01.text  = grdHeader.GetGridData( 1, G2_WH_PK_01 );				 
				txtWHPK_02.text  = grdHeader.GetGridData( 1, G2_WH_PK_02 );				 
				txtWHPK_03.text  = grdHeader.GetGridData( 1, G2_WH_PK_03 );				 
				txtWHPK_04.text  = grdHeader.GetGridData( 1, G2_WH_PK_04 );		
				txtWHPK_05.text  = grdHeader.GetGridData( 1, G2_WH_PK_05 );
				txtWHPK_06.text  = grdHeader.GetGridData( 1, G2_WH_PK_06 );	
				txtWHPK_07.text  = grdHeader.GetGridData( 1, G2_WH_PK_07 );
				txtWHPK_08.text  = grdHeader.GetGridData( 1, G2_WH_PK_08 );		 						
				txtWHPK_09.text  = grdHeader.GetGridData( 1, G2_WH_PK_09 );
				txtWHPK_10.text  = grdHeader.GetGridData( 1, G2_WH_PK_10 );
				 
				OnSearch('BALANCE');
			}
			else
			{
				alert('There no warehouse for this Storage .');
			}           
                     
        break;   				  		           
    }
}
//============================================================================= 
function OnPopUp(pos){
    switch (pos)
    {
        case 'REPORT':
		    var url = System.RootURL + '/standard/forms/fp/ab/fpab00790.aspx?group_id=LGCM0050&cha_value2=bisc00100';
			var rtnData = System.OpenModal(  url , 500, 200, 'resizable:yes;status:yes;', this);
			lstReportType.SetDataText(rtnData);
			
		break;
    }
}
//============================================================================= 
function OnReport()
{    
    var url =System.RootURL + "/standard/reports/bi/sc/" + lstReportType.value +
                              "?p_lang=" + lstLang1.value +
                              "&p_item_grp=" + lstItemGroup01.value +
                              "&p_item=" + txtItem01.text +
                              "&p_rad_type=" + radType.value +
                              "&p_dt_from=" + dtFrom.value +
                              "&p_dt_to=" + dtTo.value +
                              "&p_wh_pk_1=" + txtWHPK_01.text +
                              "&p_wh_pk_2=" + txtWHPK_02.text +
                              "&p_wh_pk_3=" + txtWHPK_03.text +
                              "&p_wh_pk_4=" + txtWHPK_04.text +
                              "&p_wh_pk_5=" + txtWHPK_05.text +
                              "&p_wh_pk_6=" + txtWHPK_06.text +
                              "&p_wh_pk_7=" + txtWHPK_07.text +
                              "&p_wh_pk_8=" + txtWHPK_08.text +
                              "&p_wh_pk_9=" + txtWHPK_09.text +
                              "&p_wh_pk_10=" + txtWHPK_10.text +
                              "&p_storage=" + lstStorage.value;
    window.open(url);  
} 
//=============================================================================
function BindReportList(){
    data = "<%=CtlLib.SetListDataSQL("select v.CHA_VALUE2,v.CODE_NM from vlg_code v where v.group_id='LGCM0050' and v.CHA_VALUE1='bisc00100' order by nvl(v.NUM_VALUE1,0)")%>";
    lstReportType.SetDataText(data);
}            
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bisc00100_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="st_lg_SEL_bisc00100_1"  >
                <input bind="grdINOUT" >
					<input bind="lstLang1" />										           			      
					<input bind="lstItemGroup01" />				
			        <input bind="txtItem01" />
					<input bind="radType" />
					<input bind="dtFrom" />		
					<input bind="dtTo" />							
					<input bind="txtWHPK_01" />					   
					<input bind="txtWHPK_02" />					 
					<input bind="txtWHPK_03" />					 
					<input bind="txtWHPK_04" />
					<input bind="txtWHPK_05" /> 
					<input bind="txtWHPK_06" />	
					<input bind="txtWHPK_07" />	
					<input bind="txtWHPK_08" />
					<input bind="txtWHPK_09" />
					<input bind="txtWHPK_10" />													      			        
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bisc00100" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="st_lg_SEL_bisc00100"  >
                <input bind="grdHeader" >					 
					<input bind="lstStorage" />			
					<input bind="lstWHType" />		
                </input>
                <output bind="grdHeader" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Stock Status">
        <tr style="height: 0%">
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
            <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
        </tr>
        <tr>
            <td colspan="5" style="white-space: nowrap" align="right">
                Group
            </td>
            <td colspan="30" align="right">
                <gw:list id="lstItemGroup01" styles="width: 100%" />
            </td>
            <td colspan="5" style="white-space: nowrap" align="right">
                Item
            </td>
            <td colspan="25">
                <gw:textbox id="txtItem01" maxlen="100" styles='width:100%' onenterkey="OnSearch('HEADER')" />
            </td>
            <td colspan="5" align="right">
                Lang
            </td>
            <td colspan="8">
                <gw:list id="lstLang1" styles='width:100%' />
            </td>
            <td colspan="2" style="white-space: nowrap">
            </td>
            <td colspan="5" style="white-space:nowrap" align="right">
                Sub Total
            </td>
            <td colspan="13" style="white-space: nowrap" align="right">
                <gw:list id="lstGridType" styles='width:100%;' />
            </td>
            <td colspan="2">
                <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('HEADER')" />
            </td>
        </tr>
        <tr>
            <td colspan="5" style="white-space: nowrap" align="right">
                W/H
            </td>
			<td colspan="15" align="right">
                <gw:list id="lstStorage" styles="width:100%" />
            </td>
			<td colspan="15" align="right">
                <gw:list id="lstWHType" styles="width:100%" />
            </td>
            <td colspan="5" align="right">
                Date
            </td>
            <td colspan="25" align="left" style="white-space: nowrap">
                <gw:datebox id="dtFrom" lang="1" styles="width:100%" />
                ~<gw:datebox id="dtTo" lang="1" styles="width:100%" />
            </td>
            <td colspan="13" style="white-space: nowrap" align="center">
                <gw:radio id="radType" value="ITEM" styles="width:100%"> 
				     <span value="ST" id="Span01">ST</span> 
				     <span value="ITEM" id="Spqn02">Item</span> 									      
				 </gw:radio>
            </td>
            <td colspan="2" style="white-space: nowrap">
            </td>
            <td colspan="5" style="white-space:nowrap" align="right">
                <b style="color: green; cursor: hand" onclick="OnPopUp('REPORT')"><u>Reports List</u></b>
            </td>
            <td colspan="13" style="white-space: nowrap" align="right">
                <gw:list id="lstReportType" styles='width:100%' />
            </td>
            <td colspan="2" align="right">
                <gw:button id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport()" />
            </td>
        </tr>
        <tr style="height: 98%">
            <td colspan="100">
                <gw:grid id='grdINOUT' header='_GRP_PK|Group|_ITEM_PK|Item Code|Item Name|UOM|01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|33|33|34|35|36|37|38|39|40'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|1|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='0|1500|0|1500|3000|800|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
</body>
<gw:textbox id="txtWHPK_01" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_02" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_03" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_04" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_05" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_06" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_07" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_08" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_09" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_10" maxlen="100" styles='width:100%;display:none' />

<gw:grid id='grdHeader' header='WH_PK_01|WH_PK_02|WH_PK_03|WH_PK_04|WH_PK_05|WH_PK_06|WH_PK_07|WH_PK_08|WH_PK_09|WH_PK_10|WH_NM_01|WH_NM_02|WH_NM_03|WH_NM_04|WH_NM_05|WH_NM_06|WH_NM_07|WH_NM_08|WH_NM_09|WH_NM_10'
    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
    styles='width:100%; height:460;display:none' />
</html>
