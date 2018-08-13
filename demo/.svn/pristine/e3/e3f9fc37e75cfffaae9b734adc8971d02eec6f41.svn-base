<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<head id="Head1" runat="server">
    <title>W/H Stock Checking 9</title>
</head>

<script>
   
var G1_GRP_PK	  = 0,
	G1_GRP_CODE   = 1,
	G1_ITEM_PK    = 2,    
    G1_ITEM_CODE  = 3,
    G1_ITEM_NAME  = 4, 	 	
	G1_UOM		  = 5,	 
    G1_BEGIN      = 6,
    G1_DR_IN      = 7,
    G1_OT_IN      = 8,
    G1_TR_01      = 9,
	G1_TR_02      = 10,
    G1_TR_03      = 11,
    G1_TR_04      = 12,
    G1_TR_05      = 13,
	G1_TR_06      = 14,
    G1_TR_07      = 15,
    G1_TR_08      = 16,
    G1_TR_09      = 17,
	G1_TR_10      = 18,
	G1_TR_11      = 19,
	G1_TR_12      = 20,
	G1_TR_13      = 21,
	G1_TR_14      = 22,
	G1_TR_15      = 23,
	G1_TR_16      = 24,
	G1_TR_17      = 25,
	G1_TR_18      = 26,
	G1_TR_19      = 27,
	G1_TR_20      = 28,
    G1_OT_OUT     = 29,
    G1_END        = 30;
	
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
	G2_WH_PK_11 = 10,
	G2_WH_PK_12 = 11,
	G2_WH_PK_13 = 12,
	G2_WH_PK_14 = 13,
	G2_WH_PK_15 = 14,
	G2_WH_PK_16 = 15,
	G2_WH_PK_17 = 16,
	G2_WH_PK_18 = 17,
	G2_WH_PK_19 = 18,
	G2_WH_PK_20 = 19,
	G2_WH_NM_01 = 20,
	G2_WH_NM_02 = 21,		
	G2_WH_NM_03 = 22,	
	G2_WH_NM_04 = 23,
	G2_WH_NM_05 = 24,
	G2_WH_NM_06	= 25,
	G2_WH_NM_07	= 26,
	G2_WH_NM_08	= 27,
	G2_WH_NM_09	= 28,
	G2_WH_NM_10	= 29,
	G2_WH_NM_11	= 30,
    G2_WH_NM_12	= 31,
	G2_WH_NM_13	= 32,
	G2_WH_NM_14	= 33,
	G2_WH_NM_15	= 34,
	G2_WH_NM_16	= 35,
	G2_WH_NM_17	= 36,
	G2_WH_NM_18	= 37,
	G2_WH_NM_19	= 38,
	G2_WH_NM_20	= 39;
	 
//=============================================================================             
function BodyInit()
{       
    System.Translate(document); 
	
    FormatGrid();	            
    //-----------------
    BindReportList();
}
//=============================================================================           
function FormatGrid()
{
    var data ;
	
	data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name from TLG_in_warehouse where del_if = 0 and use_yn='Y' order by wh_id")%>";
	lstWH.SetDataText( data + "||");
    lstWH.value = '';
 	
    data = "<%=CtlLib.SetListDataSQL("select pk, grp_cd || ' * ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn = 'Y' order by grp_cd ")%>||";     
    lstItemGroup.SetDataText(data);
    lstItemGroup.value = '';	
    
    data = "data|VIE|VIE|ENG|ENG|KOR|KOR";
    lstLang.SetDataText(data);      
    lstLang.value = "<%=Session("SESSION_LANG")%>";	
	
    data = "data|10|Grand Total|20|Group Subtotal";
    lstGridType.SetDataText(data);  
    lstGridType.value = '10'; 
    		
    var ctrl = grdINOUT.GetGridControl();   
      
    ctrl.ColFormat(G1_BEGIN) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_DR_IN) = "###,###,###.##" ;
	ctrl.ColFormat(G1_OT_IN) = "###,###,###.##" ;
	ctrl.ColFormat(G1_TR_01) = "###,###,###.##" ;	
    ctrl.ColFormat(G1_TR_02) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_TR_03) = "###,###,###.##" ;
	ctrl.ColFormat(G1_TR_04) = "###,###,###.##" ;
	ctrl.ColFormat(G1_TR_05) = "###,###,###.##" ;
    ctrl.ColFormat(G1_TR_06) = "###,###,###.##" ;    
    ctrl.ColFormat(G1_TR_07) = "###,###,###.##" ; 
	ctrl.ColFormat(G1_TR_08) = "###,###,###.##" ;
	ctrl.ColFormat(G1_TR_09) = "###,###,###.##" ;
    ctrl.ColFormat(G1_TR_10) = "###,###,###.##" ; 
	ctrl.ColFormat(G1_TR_11) = "###,###,###.##" ; 
	ctrl.ColFormat(G1_TR_12) = "###,###,###.##" ; 
	ctrl.ColFormat(G1_TR_13) = "###,###,###.##" ; 
	ctrl.ColFormat(G1_TR_14) = "###,###,###.##" ; 
	ctrl.ColFormat(G1_TR_15) = "###,###,###.##" ; 
	ctrl.ColFormat(G1_TR_16) = "###,###,###.##" ; 
	ctrl.ColFormat(G1_TR_17) = "###,###,###.##" ; 
	ctrl.ColFormat(G1_TR_18) = "###,###,###.##" ; 
	ctrl.ColFormat(G1_TR_19) = "###,###,###.##" ; 
	ctrl.ColFormat(G1_TR_20) = "###,###,###.##" ;     
    ctrl.ColFormat(G1_OT_OUT)= "###,###,###.##" ;
	ctrl.ColFormat(G1_END)   = "###,###,###.##" ;	 
	
	ctrl.FrozenCols = G1_ITEM_NAME ; 	
		 	  	
}  
//=============================================================================             
function OnSearch(id)
{
    switch(id)
    {               
        case 'BALANCE':           
            //---------------------  			     
            data_bisc00180_1.Call('SELECT');			 
        break;  	
		
		case 'HEADER':
		    //--------------------------
			data_bisc00180_WH.Call('SELECT');
		break;			 
    }
}
  
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {              
        case 'data_bisc00180_1':   
			       
            if ( grdINOUT.rows > 1 )
            {
				var fg = grdINOUT.GetGridControl();
				
				fg.FixedRows  = 2 ;
            	fg.MergeCells = 5 ;
				
				fg.MergeCol(G1_GRP_CODE)  = true;
				fg.MergeCol(G1_ITEM_CODE) = true;
				fg.MergeCol(G1_ITEM_NAME) = true;
				fg.MergeCol(G1_UOM)       = true;
				
				fg.MergeCol(G1_BEGIN)  = true;
				fg.MergeCol(G1_DR_IN)  = true;
				fg.MergeCol(G1_OT_IN)  = true;
				fg.MergeCol(G1_OT_OUT) = true;
				fg.MergeCol(G1_END)    = true;
				
                fg.Cell(0, 0, G1_GRP_CODE,  1, G1_GRP_CODE  ) = "Group";                
                fg.Cell(0, 0, G1_ITEM_CODE, 1, G1_ITEM_CODE ) = "Item Code";                 
                fg.Cell(0, 0, G1_ITEM_NAME, 1, G1_ITEM_NAME ) = "Item Name";
				fg.Cell(0, 0, G1_UOM,       1, G1_UOM       ) = "UOM";
				
				fg.Cell(0, 0, G1_BEGIN,  1, G1_BEGIN  ) = "Begin";
				fg.Cell(0, 0, G1_DR_IN,  1, G1_DR_IN  ) = "D/R In";
				fg.Cell(0, 0, G1_OT_IN,  1, G1_OT_IN  ) = "O/T In";
				fg.Cell(0, 0, G1_OT_OUT, 1, G1_OT_OUT ) = "O/T Out";
				fg.Cell(0, 0, G1_END,    1, G1_END    ) = "End";
				
				fg.MergeRow(0) = true;
				
				fg.Cell(0, 0, G1_TR_01, 0, G1_TR_20 ) = "Transfer Out";				
				//------------------------------------------------------------------
				 
				fg.ColHidden(G1_TR_01) = true ;				 
					 
				if ( grdHeader.GetGridData( 1, G2_WH_NM_01 ) != '' )
				{ 
					fg.Cell(0, 1, G1_TR_01, 1, G1_TR_01 ) = grdHeader.GetGridData( 1, G2_WH_NM_01 );					 
					 
					fg.ColHidden(G1_TR_01) = false ;	 			 
				} 	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_02) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_02 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_02, 1, G1_TR_02 ) = grdHeader.GetGridData( 1, G2_WH_NM_02 );					 
					
					fg.ColHidden(G1_TR_02) = false ;					 
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_03) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_03 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_03, 1, G1_TR_03 ) = grdHeader.GetGridData( 1, G2_WH_NM_03 );					 
					
					fg.ColHidden(G1_TR_03) = false ;					 
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_04) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_04 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_04, 1, G1_TR_04 ) = grdHeader.GetGridData( 1, G2_WH_NM_04 );					 
					
					fg.ColHidden(G1_TR_04) = false ;					 
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_05) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_05 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_05, 1, G1_TR_05 ) = grdHeader.GetGridData( 1, G2_WH_NM_05 );					 
					
					fg.ColHidden(G1_TR_05) = false ;					 
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_06) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_06 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_06, 1, G1_TR_06 ) = grdHeader.GetGridData( 1, G2_WH_NM_06 );					 
					
					fg.ColHidden(G1_TR_06) = false ;					 
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_07) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_07 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_07, 1, G1_TR_07 ) = grdHeader.GetGridData( 1, G2_WH_NM_07 );					 
					
					fg.ColHidden(G1_TR_07) = false ;					 
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_08) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_08 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_08, 1, G1_TR_08 ) = grdHeader.GetGridData( 1, G2_WH_NM_08 );					 
					
					fg.ColHidden(G1_TR_08) = false ;					 
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_09) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_09 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_09, 1, G1_TR_09 ) = grdHeader.GetGridData( 1, G2_WH_NM_09 );					 
					
					fg.ColHidden(G1_TR_09) = false ;					 
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_10) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_10 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_10, 1, G1_TR_10 ) = grdHeader.GetGridData( 1, G2_WH_NM_10 );					 
					
					fg.ColHidden(G1_TR_10) = false ;					 
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_11) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_11 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_11, 1, G1_TR_11 ) = grdHeader.GetGridData( 1, G2_WH_NM_11 );					 
					
					fg.ColHidden(G1_TR_11) = false ;					 
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_12) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_12 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_12, 1, G1_TR_12 ) = grdHeader.GetGridData( 1, G2_WH_NM_12 );					 
					
					fg.ColHidden(G1_TR_12) = false ;					 
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_13) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_13 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_13, 1, G1_TR_13 ) = grdHeader.GetGridData( 1, G2_WH_NM_13 );					 
					
					fg.ColHidden(G1_TR_13) = false ;					 
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_14) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_14 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_14, 1, G1_TR_14 ) = grdHeader.GetGridData( 1, G2_WH_NM_14 );					 
					
					fg.ColHidden(G1_TR_14) = false ;					 
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_15) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_15 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_15, 1, G1_TR_15 ) = grdHeader.GetGridData( 1, G2_WH_NM_15 );					 
					
					fg.ColHidden(G1_TR_15) = false ;					 
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_16) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_16 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_16, 1, G1_TR_16 ) = grdHeader.GetGridData( 1, G2_WH_NM_16 );					 
					
					fg.ColHidden(G1_TR_16) = false ;					 
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_17) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_17 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_17, 1, G1_TR_17 ) = grdHeader.GetGridData( 1, G2_WH_NM_17 );					 
					
					fg.ColHidden(G1_TR_17) = false ;					 
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_18) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_18 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_18, 1, G1_TR_18 ) = grdHeader.GetGridData( 1, G2_WH_NM_18 );					 
					
					fg.ColHidden(G1_TR_18) = false ;					 
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_19) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_19 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_19, 1, G1_TR_19 ) = grdHeader.GetGridData( 1, G2_WH_NM_19 );					 
					
					fg.ColHidden(G1_TR_19) = false ;					 
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_TR_20) = true ;				 
					
				if ( grdHeader.GetGridData( 1, G2_WH_NM_20 ) != '' )
				{
					fg.Cell(0, 1, G1_TR_20, 1, G1_TR_20 ) = grdHeader.GetGridData( 1, G2_WH_NM_20 );					 
					
					fg.ColHidden(G1_TR_20) = false ;					 
				}	
				//--------------------------------------------------------------------
							    
                grdINOUT.SetCellBold( 1, G1_ITEM_CODE, grdINOUT.rows-1, G1_ITEM_CODE, true);							                
                
				if ( grdINOUT.rows>2)
				{
					grdINOUT.SetCellBgColor( 2, G1_DR_IN, grdINOUT.rows - 1, G1_OT_IN,  0xCCFFFF );			
					grdINOUT.SetCellBgColor( 2, G1_TR_01, grdINOUT.rows - 1, G1_OT_OUT, 0xFFFFCC );	
				} 
				 	
				if ( lstGridType.value == '10' )
	            {
	                grdINOUT.Subtotal( 0, 2, -1, '6!7!8!9!10!11!12!13!14!15!16!17!18!19!20!21!22!23!24!25!26!27!28!29!30','###,###,###.##');							
	            }
	            else if ( lstGridType.value == '20' )
	            {
	                grdINOUT.Subtotal( 0, 2, 0, '6!7!8!9!10!11!12!13!14!15!16!17!18!19!20!21!22!23!24!25!26!27!28!29!30','###,###,###.##');							
	            }
				 
            }            
        break;    

		case 'data_bisc00180_WH': 
		 
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
				txtWHPK_11.text  = grdHeader.GetGridData( 1, G2_WH_PK_11 );
				txtWHPK_12.text  = grdHeader.GetGridData( 1, G2_WH_PK_12 );
				txtWHPK_13.text  = grdHeader.GetGridData( 1, G2_WH_PK_13 );
				txtWHPK_14.text  = grdHeader.GetGridData( 1, G2_WH_PK_14 );
				txtWHPK_15.text  = grdHeader.GetGridData( 1, G2_WH_PK_15 );
				txtWHPK_16.text  = grdHeader.GetGridData( 1, G2_WH_PK_16 );
				txtWHPK_17.text  = grdHeader.GetGridData( 1, G2_WH_PK_17 );
				txtWHPK_18.text  = grdHeader.GetGridData( 1, G2_WH_PK_18 );
				txtWHPK_19.text  = grdHeader.GetGridData( 1, G2_WH_PK_19 );
				txtWHPK_20.text  = grdHeader.GetGridData( 1, G2_WH_PK_20 );
				 
				OnSearch('BALANCE');
			}
			else
			{
				alert('There no warehouse for this Out W/H .');
			}           
                     
        break;   				  		           
    }
}
//============================================================================= 
function OnPopUp(pos){
    switch (pos)
    {
        case 'REPORT':
		    var url = System.RootURL + '/standard/forms/fp/ab/fpab00790.aspx?group_id=LGCM0050&cha_value2=bisc00180';
			var rtnData = System.OpenModal(  url , 500, 200, 'resizable:yes;status:yes;', this);
			lstReportType.SetDataText(rtnData);
			
		break;
    }
}
//============================================================================= 
function OnReport()
{    
    var url =System.RootURL + '/standard/reports/bi/sc/' + lstReportType.value + 
                              '?p_lang='+ lstLang.value +
                              '&p_wh_pk='+ lstWH.value  + 
                              '&p_item_grp_pk=' + lstItemGroup.value +
                              '&p_item=' + txtItem.text +
                              '&p_from_date=' + dtFrom.value +
                              '&p_to_date=' + dtTo.value + 
                              '&p_wh_pk_1=' + txtWHPK_01.text +
                              '&p_wh_pk_2=' + txtWHPK_02.text +
                              '&p_wh_pk_3=' + txtWHPK_03.text +
                              '&p_wh_pk_4=' + txtWHPK_04.text + 
                              '&p_wh_pk_5=' + txtWHPK_05.text +
                              '&p_wh_pk_6=' + txtWHPK_06.text +
                              '&p_wh_pk_7=' + txtWHPK_07.text +
                              '&p_wh_pk_8=' + txtWHPK_08.text + 
                              '&p_wh_pk_9=' + txtWHPK_09.text +
                              '&p_wh_pk_10=' + txtWHPK_10.text +
                              '&p_wh_pk_11=' + txtWHPK_11.text +
                              '&p_wh_pk_12=' + txtWHPK_12.text + 
                              '&p_wh_pk_13=' + txtWHPK_13.text +
                              '&p_wh_pk_14=' + txtWHPK_14.text +
                              '&p_wh_pk_15=' + txtWHPK_15.text +
                              '&p_wh_pk_16=' + txtWHPK_16.text + 
                              '&p_wh_pk_17=' + txtWHPK_17.text +
                              '&p_wh_pk_18=' + txtWHPK_18.text +
                              '&p_wh_pk_19=' + txtWHPK_19.text +
                              '&p_wh_pk_20=' + txtWHPK_20.text ;
			
    window.open(url); 
} 
//=============================================================================
function BindReportList(){
	data = "<%=CtlLib.SetListDataSQL("select v.CHA_VALUE2,v.CODE_NM from vlg_code v where v.group_id='LGCM0050' and v.CHA_VALUE1='bisc00180' order by nvl(v.NUM_VALUE1,0)")%>";
    lstReportType.SetDataText(data);
}              
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bisc00180_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="st_lg_SEL_bisc00180_1"  >
                <input bind="grdINOUT" >
					<input bind="lstLang" />
					<input bind="lstWH" />
					<input bind="lstItemGroup" />				
			        <input bind="txtItem" />				
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
					<input bind="txtWHPK_11" />	
					<input bind="txtWHPK_12" />	
					<input bind="txtWHPK_13" />	
					<input bind="txtWHPK_14" />	
					<input bind="txtWHPK_15" />	
					<input bind="txtWHPK_16" />	
					<input bind="txtWHPK_17" />	
					<input bind="txtWHPK_18" />	
					<input bind="txtWHPK_19" />
					<input bind="txtWHPK_20" />					
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_bisc00180_WH" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="st_lg_SEL_bisc00180_WH"  >
                <input bind="grdHeader" >					 
					<input bind="lstWH" />	
					<input bind="dtFrom" />		
					<input bind="dtTo" />							
                </input>
                <output bind="grdHeader" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Stock Status">
        <tr style="width: 100%; height: 0%">
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
        <tr style="width: 100%; height: 1%">
            <td colspan="5" style="white-space: nowrap" align="right">
                Group
            </td>
            <td colspan="30" align="right">
                <gw:list id="lstItemGroup" styles="width: 100%" />
            </td>
            <td colspan="5" style="white-space: nowrap" align="right">
                Item
            </td>
            <td colspan="20">
                <gw:textbox id="txtItem" maxlen="100" styles='width:100%' onenterkey="OnSearch('HEADER')" />
            </td>
            <td colspan="5" align="right">
                Lang
            </td>
            <td colspan="10">
                <gw:list id="lstLang" styles='width:100%' />
            </td>
            <td colspan="7" style="white-space: nowrap" align="right"  >
                Subtotal
            </td>
            <td colspan="10" style="white-space: nowrap" align="center"  >
                <gw:list id="lstGridType" styles='width:100%;' />
            </td>
            <td colspan="6" style="white-space: nowrap">
            </td>
            <td colspan="2">
                <gw:button img="search" alt="Search" id="btnSearch2" onclick="OnSearch('HEADER')" />
            </td>
        </tr>
        <tr style="width: 100%; height: 1%">
            <td colspan="5" style="white-space: nowrap" align="right">
                W/H
            </td>
            <td colspan="30" align="right">
                <gw:list id="lstWH" styles="width:100%" />
            </td>
            <td colspan="5" align="right">
                Date
            </td>
            <td colspan="20" align="left" style="white-space: nowrap">
                <gw:datebox id="dtFrom" lang="1" styles="width:100%" />
                ~<gw:datebox id="dtTo" lang="1" styles="width:100%" />
            </td>
            <td colspan="15" align="right">
            </td>
            <td colspan="7" align="right">
                <b style="color: green; cursor: hand" onclick="OnPopUp('REPORT')"><u>Reports List</u></b>
            </td>
            <td colspan="16">
                <gw:list id="lstReportType" styles='width:100%' />
            </td>
            <td colspan="2" align="right">
                <gw:button id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport()" />
            </td>
            
        </tr>
        <tr style="height: 98%">
            <td colspan="100">
                <gw:grid id='grdINOUT' 
					header='_GRP_PK|Group|_ITEM_PK|Item Code|Item Name|UOM|01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|1|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					widths='0|1500|0|1500|3000|800|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200'
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
<gw:textbox id="txtWHPK_11" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_12" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_13" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_14" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_15" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_16" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_17" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_18" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_19" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWHPK_20" maxlen="100" styles='width:100%;display:none' />

<gw:grid id='grdHeader' 
	header='WH_PK_01|WH_PK_02|WH_PK_03|WH_PK_04|WH_PK_05|WH_PK_06|WH_PK_07|WH_PK_08|WH_PK_09|WH_PK_10|WH_PK_01|WH_PK_02|WH_PK_03|WH_PK_04|WH_PK_05|WH_PK_06|WH_PK_07|WH_PK_08|WH_PK_09|WH_PK_10|WH_NM_01|WH_NM_02|WH_NM_03|WH_NM_04|WH_NM_05|WH_NM_06|WH_NM_07|WH_NM_08|WH_NM_09|WH_NM_10|WH_NM_01|WH_NM_02|WH_NM_03|WH_NM_04|WH_NM_05|WH_NM_06|WH_NM_07|WH_NM_08|WH_NM_09|WH_NM_10'
    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
	aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
	widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
    styles='width:100%; height:460;display:none' />
</html>
