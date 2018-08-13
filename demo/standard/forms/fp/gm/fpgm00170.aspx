<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>W/I Process Balance 1</title>
</head>

<script>
   
var G1_CUST_NM    = 0,	 
	G1_PO_NO   	  = 1,
	G1_WI_DATE    = 2,
	G1_WI_NO	  =	3,		
    G1_ITEM_CODE  = 4,
    G1_ITEM_NAME  = 5, 	 		 
	G1_SPEC01_NM  = 6,		 
	G1_SPEC02_NM  = 7,	 
	G1_SPEC03_NM  = 8,	 
	G1_SPEC04_NM  = 9,	 
	G1_SPEC05_NM  = 10,				
	G1_WI_QTY	  = 11, 
	G1_PR_01_QTY  =	12,
	G1_BL_01_QTY  =	13,	
	G1_PR_02_QTY  =	14,
	G1_BL_02_QTY  =	15,	
    G1_PR_03_QTY  =	16,
	G1_BL_03_QTY  =	17,	
    G1_PR_04_QTY  =	18,
	G1_BL_04_QTY  =	19,	
	G1_PR_05_QTY  =	20,
	G1_BL_05_QTY  =	21,	
	G1_PR_06_QTY  =	22,
	G1_BL_06_QTY  =	23,	
    G1_PR_07_QTY  =	24,
	G1_BL_07_QTY  =	25,		
	G1_PR_08_QTY  =	26, 
	G1_BL_08_QTY  =	27,	
    G1_PR_09_QTY  =	28,
	G1_BL_09_QTY  =	29,	
    G1_PR_10_QTY  =	30,
	G1_BL_10_QTY  =	31;
	
var G2_PR_PK_01 = 0,	 
	G2_PR_PK_02 = 1,
	G2_PR_PK_03 = 2,
	G2_PR_PK_04 = 3,
	G2_PR_PK_05 = 4,
	G2_PR_PK_06 = 5,	
	G2_PR_PK_07 = 6,
	G2_PR_PK_08 = 7,
	G2_PR_PK_09 = 8,
	G2_PR_PK_10 = 9,	 
	G2_PR_NM_01 = 10,
	G2_PR_NM_02 = 11,		
	G2_PR_NM_03 = 12,	
	G2_PR_NM_04 = 13,
	G2_PR_NM_05 = 14,
	G2_PR_NM_06	= 15,
	G2_PR_NM_07	= 16,
	G2_PR_NM_08	= 17,
	G2_PR_NM_09	= 18,
	G2_PR_NM_10	= 19;
	 
//=============================================================================             
function BodyInit()
{       
    System.Translate(document); 
	 
    FormatGrid();        
    //-----------------     
	 
	OnSearch('SPEC_HEADER');
}
//=============================================================================           
function FormatGrid()
{
    var data ;
 
	data = "<%=ESysLib.SetListDataSQL("SELECT   pk, factory_id || ' - ' || factory_name FROM tlg_pr_factory WHERE del_if = 0 AND use_yn = 'Y' ORDER BY factory_id ")%>";   
    lstFactory.SetDataText(data);		 	    
    
    data = "data|10|G-Total|20|Cust-Total";
    lstGridType.SetDataText(data);  
    lstGridType.value = '10'; 
	         
    var ctrl = grdINOUT.GetGridControl();   
    
	ctrl.MergeCol(0)   = true;
	ctrl.MergeCol(1)   = true;
	ctrl.MergeCol(2)   = true;
	ctrl.MergeCol(3)   = true;
	ctrl.MergeCol(4)   = true;
	ctrl.MergeCol(5)   = true;
	ctrl.MergeCol(6)   = true;
	ctrl.MergeCol(7)   = true;
	ctrl.MergeCol(8)   = true;
	ctrl.MergeCol(9)   = true;
	ctrl.MergeCol(10)   = true;
	ctrl.MergeCol(11)   = true;	
				
	ctrl.ColFormat(G1_WI_QTY)  	 = "###,###,###" ; 
	ctrl.ColFormat(G1_PR_01_QTY) = "###,###,###" ;			
	ctrl.ColFormat(G1_BL_01_QTY) = "###,###,###" ;
	ctrl.ColFormat(G1_PR_02_QTY) = "###,###,###" ;
	ctrl.ColFormat(G1_BL_02_QTY) = "###,###,###" ;
	ctrl.ColFormat(G1_PR_03_QTY) = "###,###,###" ;
	ctrl.ColFormat(G1_BL_03_QTY) = "###,###,###" ;
	ctrl.ColFormat(G1_PR_04_QTY) = "###,###,###" ;		
	ctrl.ColFormat(G1_BL_04_QTY) = "###,###,###" ;
	ctrl.ColFormat(G1_PR_05_QTY) = "###,###,###" ;
	ctrl.ColFormat(G1_BL_05_QTY) = "###,###,###" ;
	ctrl.ColFormat(G1_PR_06_QTY) = "###,###,###" ;
	ctrl.ColFormat(G1_BL_06_QTY) = "###,###,###" ;		
	ctrl.ColFormat(G1_PR_07_QTY) = "###,###,###" ;
	ctrl.ColFormat(G1_BL_07_QTY) = "###,###,###" ;
	ctrl.ColFormat(G1_PR_08_QTY) = "###,###,###" ;
	ctrl.ColFormat(G1_BL_08_QTY) = "###,###,###" ;
	ctrl.ColFormat(G1_PR_09_QTY) = "###,###,###" ; 
	ctrl.ColFormat(G1_BL_09_QTY) = "###,###,###" ;
	ctrl.ColFormat(G1_PR_10_QTY) = "###,###,###" ;
	ctrl.ColFormat(G1_BL_10_QTY) = "###,###,###" ;
		 	
	ctrl.FrozenCols = G1_SPEC01_NM ; 	
			  	
}  
//============================================================================= 
					            
function OnSearch(id)
{
    switch(id)
    {      
		case 'SPEC_HEADER':							
			//---------------------
			data_fpgm00170_header.Call('SELECT');	
		break;
		         
        case 'BALANCE':           
            //---------------------  			     
            data_fpgm00170_2.Call('SELECT');			 
        break;  	
		
		case 'PR_HEADER':
		    //--------------------------
			data_fpgm00170_1.Call('SELECT');
		break;			 
    }
}
//=============================================================================
function OnColView(pos)
{
	switch(pos)
	{
		case "FIN":
			chkColFinish.value=='Y'?(grdINOUT.GetGridControl().ColHidden(G1_FIN_01)=false,grdINOUT.GetGridControl().ColHidden(G1_FIN_02)=false,grdINOUT.GetGridControl().ColHidden(G1_FIN_03)=false,grdINOUT.GetGridControl().ColHidden(G1_FIN_04)=false,grdINOUT.GetGridControl().ColHidden(G1_FIN_05)=false,grdINOUT.GetGridControl().ColHidden(G1_FIN_06)=false):(grdINOUT.GetGridControl().ColHidden(G1_FIN_01)=true,grdINOUT.GetGridControl().ColHidden(G1_FIN_02)=true,grdINOUT.GetGridControl().ColHidden(G1_FIN_03)=true,grdINOUT.GetGridControl().ColHidden(G1_FIN_04)=true,grdINOUT.GetGridControl().ColHidden(G1_FIN_05)=true,grdINOUT.GetGridControl().ColHidden(G1_FIN_06)=true);	 
			//--------	
		break;
		
		case "IN":
			chkColIn.value=='Y'?(grdINOUT.GetGridControl().ColHidden(G1_IN_01)=false,grdINOUT.GetGridControl().ColHidden(G1_IN_02)=false,grdINOUT.GetGridControl().ColHidden(G1_IN_03)=false,grdINOUT.GetGridControl().ColHidden(G1_IN_04)=false,grdINOUT.GetGridControl().ColHidden(G1_IN_05)=false,grdINOUT.GetGridControl().ColHidden(G1_IN_06)=false):(grdINOUT.GetGridControl().ColHidden(G1_IN_01)=true,grdINOUT.GetGridControl().ColHidden(G1_IN_02)=true,grdINOUT.GetGridControl().ColHidden(G1_IN_03)=true,grdINOUT.GetGridControl().ColHidden(G1_IN_04)=true,grdINOUT.GetGridControl().ColHidden(G1_IN_05)=true,grdINOUT.GetGridControl().ColHidden(G1_IN_06)=true);	 
			//--------	
		break;	
		
		case "IN_LINE":
			chkColInLine.value=='Y'?(grdINOUT.GetGridControl().ColHidden(G1_LINE_01)=false,grdINOUT.GetGridControl().ColHidden(G1_LINE_02)=false,grdINOUT.GetGridControl().ColHidden(G1_LINE_03)=false,grdINOUT.GetGridControl().ColHidden(G1_LINE_04)=false,grdINOUT.GetGridControl().ColHidden(G1_LINE_05)=false,grdINOUT.GetGridControl().ColHidden(G1_LINE_06)=false):(grdINOUT.GetGridControl().ColHidden(G1_LINE_01)=true,grdINOUT.GetGridControl().ColHidden(G1_LINE_02)=true,grdINOUT.GetGridControl().ColHidden(G1_LINE_03)=true,grdINOUT.GetGridControl().ColHidden(G1_LINE_04)=true,grdINOUT.GetGridControl().ColHidden(G1_LINE_05)=true,grdINOUT.GetGridControl().ColHidden(G1_LINE_06)=true);	 
			//--------	
		break;	
			
		case "WAIT":
			chkColWait.value=='Y'?(grdINOUT.GetGridControl().ColHidden(G1_REA_01)=false,grdINOUT.GetGridControl().ColHidden(G1_REA_02)=false,grdINOUT.GetGridControl().ColHidden(G1_REA_03)=false,grdINOUT.GetGridControl().ColHidden(G1_REA_04)=false,grdINOUT.GetGridControl().ColHidden(G1_REA_05)=false,grdINOUT.GetGridControl().ColHidden(G1_REA_06)=false):(grdINOUT.GetGridControl().ColHidden(G1_REA_01)=true,grdINOUT.GetGridControl().ColHidden(G1_REA_02)=true,grdINOUT.GetGridControl().ColHidden(G1_REA_03)=true,grdINOUT.GetGridControl().ColHidden(G1_REA_04)=true,grdINOUT.GetGridControl().ColHidden(G1_REA_05)=true,grdINOUT.GetGridControl().ColHidden(G1_REA_06)=true);	 
			//--------	
		break;							
	}
}  
//=============================================================================             
function OnDataReceive(obj)
{
    switch(obj.id)
    {              
        case 'data_fpgm00170_1':            
            if ( grdPRHeader.rows > 1 )
            {
				var fg = grdINOUT.GetGridControl();
								 
            	fg.MergeCells = 5 ;		
				
				fg.MergeRow(0) = true;
				
				//------------------------------------------------------------------
				fg.ColHidden(G1_PR_01_QTY) = true ;
				fg.ColHidden(G1_BL_01_QTY) = true ;
				fg.ColHidden(G1_PR_02_QTY) = true ;
				fg.ColHidden(G1_BL_02_QTY) = true ;
				fg.ColHidden(G1_PR_03_QTY) = true ;
				fg.ColHidden(G1_BL_03_QTY) = true ;
				fg.ColHidden(G1_PR_04_QTY) = true ;
				fg.ColHidden(G1_BL_04_QTY) = true ;
				fg.ColHidden(G1_PR_05_QTY) = true ;
				fg.ColHidden(G1_BL_05_QTY) = true ;
				fg.ColHidden(G1_PR_06_QTY) = true ;
				fg.ColHidden(G1_BL_06_QTY) = true ;
				fg.ColHidden(G1_PR_07_QTY) = true ;
				fg.ColHidden(G1_BL_07_QTY) = true ;
				fg.ColHidden(G1_PR_08_QTY) = true ;
				fg.ColHidden(G1_BL_08_QTY) = true ;
				fg.ColHidden(G1_PR_09_QTY) = true ;
				fg.ColHidden(G1_BL_09_QTY) = true ;
				fg.ColHidden(G1_PR_10_QTY) = true ;
				fg.ColHidden(G1_BL_10_QTY) = true ;
				 
				if ( grdPRHeader.GetGridData( 1, G2_PR_NM_01 ) != '' )
				{
					fg.Cell(0, 0, G1_PR_01_QTY, 0, G1_BL_01_QTY ) = grdPRHeader.GetGridData( 1, G2_PR_NM_01 );					 
					fg.ColHidden(G1_PR_01_QTY) = false ;	
					fg.ColHidden(G1_BL_01_QTY) = false ;		
				}	
				  
                if ( grdPRHeader.GetGridData( 1, G2_PR_NM_02 ) != '' )
				{
					fg.Cell(0, 0, G1_PR_02_QTY, 0, G1_BL_02_QTY ) = grdPRHeader.GetGridData( 1, G2_PR_NM_02 );					 
					fg.ColHidden(G1_PR_02_QTY) = false ;	
					fg.ColHidden(G1_BL_02_QTY) = false ;	
				}

				if ( grdPRHeader.GetGridData( 1, G2_PR_NM_03 ) != '' )
				{
					fg.Cell(0, 0, G1_PR_03_QTY, 0, G1_BL_04_QTY ) = grdPRHeader.GetGridData( 1, G2_PR_NM_03 );					 
					fg.ColHidden(G1_PR_03_QTY) = false ;
					fg.ColHidden(G1_BL_03_QTY) = false ;
				}

				if ( grdPRHeader.GetGridData( 1, G2_PR_NM_04 ) != '' )
				{
					fg.Cell(0, 0, G1_PR_04_QTY, 0, G1_BL_04_QTY ) = grdPRHeader.GetGridData( 1, G2_PR_NM_04 );					 
					fg.ColHidden(G1_PR_04_QTY) = false ;	
					fg.ColHidden(G1_BL_04_QTY) = false ;						
				}

				if ( grdPRHeader.GetGridData( 1, G2_PR_NM_05 ) != '' )
				{
					fg.Cell(0, 0, G1_PR_05_QTY, 0, G1_BL_05_QTY ) = grdPRHeader.GetGridData( 1, G2_PR_NM_05 );					 
					fg.ColHidden(G1_PR_05_QTY) = false ;
					fg.ColHidden(G1_BL_05_QTY) = false ;
				}

				if ( grdPRHeader.GetGridData( 1, G2_PR_NM_06 ) != '' )
				{
					fg.Cell(0, 0, G1_PR_06_QTY, 0, G1_BL_06_QTY ) = grdPRHeader.GetGridData( 1, G2_PR_NM_06 );					 
					fg.ColHidden(G1_PR_06_QTY) = false ;
					fg.ColHidden(G1_BL_06_QTY) = false ;
				}

				if ( grdPRHeader.GetGridData( 1, G2_PR_NM_07 ) != '' )
				{
					fg.Cell(0, 0, G1_PR_07_QTY, 0, G1_BL_07_QTY ) = grdPRHeader.GetGridData( 1, G2_PR_NM_07 );					 
					fg.ColHidden(G1_PR_07_QTY) = false ;	
					fg.ColHidden(G1_BL_07_QTY) = false ;
				}

				if ( grdPRHeader.GetGridData( 1, G2_PR_NM_08 ) != '' )
				{
					fg.Cell(0, 0, G1_PR_08_QTY, 0, G1_BL_08_QTY ) = grdPRHeader.GetGridData( 1, G2_PR_NM_08 );					 
					fg.ColHidden(G1_PR_08_QTY) = false ;	
					fg.ColHidden(G1_BL_08_QTY) = false ;
				}
				
				if ( grdPRHeader.GetGridData( 1, G2_PR_NM_09 ) != '' )
				{
					fg.Cell(0, 0, G1_PR_09_QTY, 0, G1_BL_09_QTY ) = grdPRHeader.GetGridData( 1, G2_PR_NM_09 );					 
					fg.ColHidden(G1_PR_09_QTY) = false ;
					fg.ColHidden(G1_BL_09_QTY) = false ;
				}

				if ( grdPRHeader.GetGridData( 1, G2_PR_NM_10 ) != '' )
				{
					fg.Cell(0, 0, G1_PR_10_QTY, 0, G1_BL_10_QTY ) = grdPRHeader.GetGridData( 1, G2_PR_NM_10 );					 
					fg.ColHidden(G1_PR_10_QTY) = false ;
					fg.ColHidden(G1_BL_10_QTY) = false ;
				}				
				//--------------------------------------------------------------------
							                   		
            }   
        
        break; 

		case 'data_fpgm00170_2': 
			if ( grdINOUT.rows > 1 )
			{
				grdINOUT.SetCellBold( 1, G1_ITEM_CODE, grdINOUT.rows-1, G1_ITEM_CODE, true);
				grdINOUT.SetCellBold( 1, G1_WI_QTY,    grdINOUT.rows-1, G1_WI_QTY,    true);	
				
                grdINOUT.SetCellBgColor( 2, G1_PR_01_QTY, grdINOUT.rows - 1, G1_PR_01_QTY, 0xCCFFFF );	
				grdINOUT.SetCellBgColor( 2, G1_BL_01_QTY, grdINOUT.rows - 1, G1_BL_01_QTY, 0xFFFFCC );	
                grdINOUT.SetCellBgColor( 2, G1_PR_02_QTY, grdINOUT.rows - 1, G1_PR_02_QTY, 0xCCFFFF );	
				grdINOUT.SetCellBgColor( 2, G1_BL_02_QTY, grdINOUT.rows - 1, G1_BL_02_QTY, 0xFFFFCC );
                grdINOUT.SetCellBgColor( 2, G1_PR_03_QTY, grdINOUT.rows - 1, G1_PR_03_QTY, 0xCCFFFF );	
				grdINOUT.SetCellBgColor( 2, G1_BL_03_QTY, grdINOUT.rows - 1, G1_BL_03_QTY, 0xFFFFCC );
                grdINOUT.SetCellBgColor( 2, G1_PR_04_QTY, grdINOUT.rows - 1, G1_PR_04_QTY, 0xCCFFFF );	
				grdINOUT.SetCellBgColor( 2, G1_BL_04_QTY, grdINOUT.rows - 1, G1_BL_04_QTY, 0xFFFFCC );
                grdINOUT.SetCellBgColor( 2, G1_PR_05_QTY, grdINOUT.rows - 1, G1_PR_05_QTY, 0xCCFFFF );	
				grdINOUT.SetCellBgColor( 2, G1_BL_05_QTY, grdINOUT.rows - 1, G1_BL_05_QTY, 0xFFFFCC );
                grdINOUT.SetCellBgColor( 2, G1_PR_06_QTY, grdINOUT.rows - 1, G1_PR_06_QTY, 0xCCFFFF );	
				grdINOUT.SetCellBgColor( 2, G1_BL_06_QTY, grdINOUT.rows - 1, G1_BL_06_QTY, 0xFFFFCC );
                grdINOUT.SetCellBgColor( 2, G1_PR_07_QTY, grdINOUT.rows - 1, G1_PR_07_QTY, 0xCCFFFF );	
				grdINOUT.SetCellBgColor( 2, G1_BL_07_QTY, grdINOUT.rows - 1, G1_BL_07_QTY, 0xFFFFCC );
                grdINOUT.SetCellBgColor( 2, G1_PR_08_QTY, grdINOUT.rows - 1, G1_PR_08_QTY, 0xCCFFFF );	
				grdINOUT.SetCellBgColor( 2, G1_BL_08_QTY, grdINOUT.rows - 1, G1_BL_08_QTY, 0xFFFFCC );
                grdINOUT.SetCellBgColor( 2, G1_PR_09_QTY, grdINOUT.rows - 1, G1_PR_09_QTY, 0xCCFFFF );	
				grdINOUT.SetCellBgColor( 2, G1_BL_09_QTY, grdINOUT.rows - 1, G1_BL_09_QTY, 0xFFFFCC );
                grdINOUT.SetCellBgColor( 2, G1_PR_10_QTY, grdINOUT.rows - 1, G1_PR_10_QTY, 0xCCFFFF );	
				grdINOUT.SetCellBgColor( 2, G1_BL_10_QTY, grdINOUT.rows - 1, G1_BL_10_QTY, 0xFFFFCC );				
				
				if ( lstGridType.value == '10' )
	            {
	                grdINOUT.Subtotal( 0, 2, -1, '11!12!13!14!15!16!17!18!19!20!21!22!23!24!25!26!27!28!29!30!31','###,###,###');							
	            }
	            else if ( lstGridType.value == '20' )
	            {
	                grdINOUT.Subtotal( 0, 2, 0, '11!12!13!14!15!16!17!18!19!20!21!22!23!24!25!26!27!28!29!30!31','###,###,###');							
	            }
			}		
        break;		

		case 'data_fpgm00170_1': 
			if ( grdPRHeader.rows > 1 )
			{
				txtPRPK_01.text  = grdPRHeader.GetGridData( 1, G2_PR_PK_01 );				 
				txtPRPK_02.text  = grdPRHeader.GetGridData( 1, G2_PR_PK_02 );				 
				txtPRPK_03.text  = grdPRHeader.GetGridData( 1, G2_PR_PK_03 );				 
				txtPRPK_04.text  = grdPRHeader.GetGridData( 1, G2_PR_PK_04 );		
				txtPRPK_05.text  = grdPRHeader.GetGridData( 1, G2_PR_PK_05 );
				txtPRPK_06.text  = grdPRHeader.GetGridData( 1, G2_PR_PK_06 );
				txtPRPK_07.text  = grdPRHeader.GetGridData( 1, G2_PR_PK_07 );
				txtPRPK_08.text  = grdPRHeader.GetGridData( 1, G2_PR_PK_08 );
				txtPRPK_09.text  = grdPRHeader.GetGridData( 1, G2_PR_PK_09 );
				txtPRPK_10.text  = grdPRHeader.GetGridData( 1, G2_PR_PK_10 );	
				
				OnSearch('BALANCE');
			}
			else
			{
				alert('There no process for this Factory .');
			}           
                     
        break;
		
        case 'data_fpgm00170_header':    
		
				grdINOUT.GetGridControl().ColHidden(G1_SPEC01_NM) = true ;
				grdINOUT.GetGridControl().ColHidden(G1_SPEC02_NM) = true ;
				grdINOUT.GetGridControl().ColHidden(G1_SPEC03_NM) = true ;
				grdINOUT.GetGridControl().ColHidden(G1_SPEC04_NM) = true ;
				grdINOUT.GetGridControl().ColHidden(G1_SPEC05_NM) = true ;
				 
				if ( grdHeader.rows>1 )
	            {
	                var col1     = grdHeader.GetGridData(1,2);
	                var dis_col1 = grdHeader.GetGridData(1,3);
	                var col2     = grdHeader.GetGridData(1,4);
	                var dis_col2 = grdHeader.GetGridData(1,5);
	                var col3     = grdHeader.GetGridData(1,6);
	                var dis_col3 = grdHeader.GetGridData(1,7);
	                var col4     = grdHeader.GetGridData(1,8);
	                var dis_col4 = grdHeader.GetGridData(1,9);
	                var col5     = grdHeader.GetGridData(1,10);
	                var dis_col5 = grdHeader.GetGridData(1,11);

					if(dis_col1!=0)
					{
						grdINOUT.SetGridText(0,G1_SPEC01_NM,col1);
						grdINOUT.GetGridControl().ColHidden(G1_SPEC01_NM) = false ;						
					}
					if (dis_col2!=0)
					{
						grdINOUT.SetGridText(0,G1_SPEC02_NM,col2);
						grdINOUT.GetGridControl().ColHidden(G1_SPEC02_NM) = false ;						
					}
					if (dis_col3!=0)
					{
						grdINOUT.SetGridText(0,G1_SPEC03_NM,col3);
						grdINOUT.GetGridControl().ColHidden(G1_SPEC03_NM) = false ;						
					}
					if (dis_col4!=0)
					{
						grdINOUT.SetGridText(0,G1_SPEC04_NM,col4);
						grdINOUT.GetGridControl().ColHidden(G1_SPEC04_NM) = false ;						
					}
					if (dis_col5!=0)
					{
						grdINOUT.SetGridText(0,G1_SPEC05_NM,col5);
						grdINOUT.GetGridControl().ColHidden(G1_SPEC05_NM) = false ;						
					}					
	            }
														         
				OnSearch('PR_HEADER');
        break;		   				  		           
    }
}

//============================================================================= 
function OnReport()
{    
    if(lstGridType.value =='10')
    {
    	 
    }
	else
    {
          
    }
} 

//=============================================================================    
function OnPopUp(pos)
{
	switch(pos)
	{
		case 'VIEW_DETAIL':
			if ( grdINOUT.row > 0 )			
			{
				var pr_pk = 0, ordplan_pk = 0;
				
				if (grdINOUT.col>=19&&grdINOUT.col<=24) 
				{
					pr_pk=txtPRPK_01.text ; 
				}
				else if (grdINOUT.col>=25&&grdINOUT.col<=30) 
				{
					pr_pk=txtPRPK_02.text ; 
				}
				else if (grdINOUT.col>=31&&grdINOUT.col<=36) 
				{
					pr_pk=txtPRPK_03.text ; 
				}
				else if (grdINOUT.col>=37&&grdINOUT.col<=42) 
				{
					pr_pk=txtPRPK_04.text ; 
				}
				else if (grdINOUT.col>=43&&grdINOUT.col<=48) 
				{
					pr_pk=txtPRPK_05.text ;
				}	
				else if (grdINOUT.col>=49&&grdINOUT.col<=54) 
				{
					pr_pk=txtPRPK_06.text ;
				}	
				
				ordplan_pk = grdINOUT.GetGridData( grdINOUT.row, G1_OPLAN_PK);
				
				if ( grdINOUT.col == G1_OUT_01 || grdINOUT.col == G1_OUT_02 || grdINOUT.col == G1_OUT_03 || grdINOUT.col == G1_OUT_04 || grdINOUT.col == G1_OUT_05 || grdINOUT.col == G1_OUT_06 )
				{
			 		var path = System.RootURL + '/form/fp/gm/fpgm00171.aspx?pr_pk='+ pr_pk +'&ordplan_pk='+ ordplan_pk;
	         		var object = System.OpenModal( path ,900 , 500 ,  'resizable:yes;status:yes',this);
				}
				else if ( grdINOUT.col == G1_IN_01 || grdINOUT.col == G1_IN_02 || grdINOUT.col == G1_IN_03 || grdINOUT.col == G1_IN_04 || grdINOUT.col == G1_IN_05 || grdINOUT.col == G1_IN_06 )
				{
			 		var path = System.RootURL + '/form/fp/gm/fpgm00173.aspx?pr_pk='+ pr_pk +'&ordplan_pk='+ ordplan_pk;
	         		var object = System.OpenModal( path ,900 , 500 ,  'resizable:yes;status:yes',this);				
				}
				else if ( grdINOUT.col == G1_FIN_01 || grdINOUT.col == G1_FIN_02 || grdINOUT.col == G1_FIN_03 || grdINOUT.col == G1_FIN_04 || grdINOUT.col == G1_FIN_05 || grdINOUT.col == G1_FIN_06 )
				{
			 		var path = System.RootURL + '/form/fp/gm/fpgm00172.aspx?pr_pk='+ pr_pk +'&ordplan_pk='+ ordplan_pk;
	         		var object = System.OpenModal( path ,900 , 500 ,  'resizable:yes;status:yes',this);				
				}	
				else if ( grdINOUT.col == G1_REA_01 || grdINOUT.col == G1_REA_02 || grdINOUT.col == G1_REA_03 || grdINOUT.col == G1_REA_04 || grdINOUT.col == G1_REA_05 || grdINOUT.col == G1_REA_06 )
				{
			 		var path = System.RootURL + '/form/fp/gm/fpgm00174.aspx?pr_pk='+ pr_pk +'&ordplan_pk='+ ordplan_pk;
	         		var object = System.OpenModal( path ,900 , 500 ,  'resizable:yes;status:yes',this);				
				}	
			}
			else
			{
				alert("PLS SELECT ONE ROW !!!");
			}	
		break;
	}	
}

//=============================================================================                    
</script>

<body>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpgm00170_2" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fpgm00170_2"  >
                <input bind="grdINOUT" >					 										           			      					
					<input bind="lstFactory" />	
					
					<input bind="dtFrom" />		
					<input bind="dtTo" />
					<input bind="txtPOCust" />				
			        <input bind="txtItem" /> 
					 
					<input bind="txtPRPK_01" />					   
					<input bind="txtPRPK_02" />					 
					<input bind="txtPRPK_03" />					 
					<input bind="txtPRPK_04" />
					<input bind="txtPRPK_05" /> 
					<input bind="txtPRPK_06" />		
					<input bind="txtPRPK_07" />
					<input bind="txtPRPK_08" />
					<input bind="txtPRPK_09" />
					<input bind="txtPRPK_10" />	
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpgm00170_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fpgm00170_1"  >
                <input bind="grdPRHeader" >					 					 						 													      			        
                </input>
                <output bind="grdPRHeader" />
            </dso>
        </xml>
    </gw:data>
   <!---------------------------------------------------------------->
    <gw:data id="data_fpgm00170_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpgm00170_header"> 
                <input bind="grdHeader"  > 
                </input> 
                <output bind="grdHeader" /> 
            </dso>            
        </xml> 
    </gw:data>	
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" name="Stock Status">
		<tr>
            <td style="width: 5%; white-space: nowrap" align="right">
                Factory
            </td>
            <td align="right" style="width: 15%; white-space: nowrap">
                <gw:list id="lstFactory" styles="width:100%" onchange="OnSearch('BALANCE')" />
            </td>
            <td align="right" style="width: 5%; white-space: nowrap">
                Date
            </td>
            <td align="left" style="white-space: nowrap;width: 15%">
                <gw:datebox id="dtFrom" lang="1" styles="width:100%" />
                ~<gw:datebox id="dtTo" lang="1" styles="width:100%" />
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                PO/Cust
            </td>
            <td style="width: 15%" align="right">
				<gw:textbox id="txtPOCust" maxlen="150" styles='width:100%' onenterkey="OnSearch('BALANCE')" />				                 
            </td>
            <td style="width: 5%; white-space: nowrap" align="right">
                Item
            </td>
            <td style="width: 15%">
                <gw:textbox id="txtItem" maxlen="150" styles='width:100%' onenterkey="OnSearch('BALANCE')" />
            </td>
			<td style="width: 2%" align="right" >                 
            </td>
			<td style="width: 5%; white-space: nowrap" align="center" >    
				  
            </td>  
			<td style="width: 5%; white-space: nowrap" >
                 
            </td>	    
            <td style="width: 5%; white-space: nowrap" >
                <gw:list id="lstGridType" styles='width:70' />
            </td>			
            <td style="width: 1%" align="right" >
                <gw:imgbtn img="search" alt="Search" id="btnSearch2" onclick="OnSearch('BALANCE')" />
            </td>
			<td style="width: 1%" align="right">
                <gw:imgbtn id="ibtnReport" img="excel" alt="Report" text="Report" onclick="OnReport()" />
            </td>
        </tr>	
		        
        <tr style="height: 98%">
            <td colspan="14">                 
					<gw:grid id='grdINOUT'
						header='PARTNER|P/O No|Doc Date|Slip No|Item Code|Item Name|-|-|-|-|-|W/I Qty|01|01|02|02|03|03|04|04|05|05|06|06|07|07|08|08|09|09|10|10'
						format='0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
						aligns='0|0|0|0|0|0|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
						editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
						widths='2000|1500|1200|1200|1500|3000|1000|1000|1000|1000|1000|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200'
						sorting='T' 
						styles='width:100%; height:100%'
					/>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------->
</body>
<!----------------------------------------------------------------------------------------------->
<gw:textbox id="txtPRPK_01" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtPRPK_02" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtPRPK_03" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtPRPK_04" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtPRPK_05" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtPRPK_06" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtPRPK_07" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtPRPK_08" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtPRPK_09" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtPRPK_10" maxlen="100" styles='width:100%;display:none' />
<!----------------------------------------------------------------------------------------------->
<gw:grid id='grdPRHeader' header='WH_PK_01|WH_PK_02|WH_PK_03|WH_PK_04|WH_PK_05|WH_PK_06|WH_PK_07|WH_PK_08|WH_PK_09|WH_PK_10|WH_NM_01|WH_NM_02|WH_NM_03|WH_NM_04|WH_NM_05|WH_NM_06|WH_NM_07|WH_NM_08|WH_NM_09|WH_NM_10'
    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
	aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
	widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
    styles='width:100%; height:460;display:none' />
<!----------------------------------------------------------------------------------------------->
<gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
       format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
       editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
       sorting='T' autosize='T' styles='width:100%; height:50%;display:none' /> 
<!----------------------------------------------------------------------------------------------->
</html>
