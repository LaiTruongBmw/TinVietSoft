<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Production Monitoring</title>
</head>

<script>
   
var G1_CUST_PK	  = 0,
	G1_CUST_NM    = 1,
	G1_OPLAN_PK	  = 2,
	G1_PO_NO   	  = 3,
	G1_ITEM_PK    = 4,    
    G1_ITEM_CODE  = 5,
    G1_ITEM_NAME  = 6, 	 	
	G1_SPEC01_PK  = 7,
	G1_SPEC01_NM  = 8,	
	G1_SPEC02_PK  = 9,
	G1_SPEC02_NM  = 10,
	G1_SPEC03_PK  = 11,
	G1_SPEC03_NM  = 12,
	G1_SPEC04_PK  = 13,
	G1_SPEC04_NM  = 14,
	G1_SPEC05_PK  = 15,
	G1_SPEC05_NM  = 16,				
	G1_ORD_QTY	  = 17, 
	G1_PLAN_QTY   =	18,	 	 
	G1_FIN_01     = 19,  
    G1_IN_01      = 20,
    G1_OUT_01     = 21,
	G1_LINE_01	  = 22,
	G1_REA_01	  = 23,
    G1_BAL_01     = 24,			
	G1_FIN_02     = 25, 
    G1_IN_02      = 26,
    G1_OUT_02     = 27,
	G1_LINE_02    = 28,
	G1_REA_02	  = 29,
    G1_BAL_02     = 30,			
	G1_FIN_03     = 31, 
    G1_IN_03      = 32,
    G1_OUT_03     = 33,
	G1_LINE_03    = 34,
	G1_REA_03	  = 35,
    G1_BAL_03     = 36,		
	G1_FIN_04     = 37,	 
    G1_IN_04      = 38,
    G1_OUT_04     = 39,
	G1_LINE_04    = 40,
	G1_REA_04	  = 41,
    G1_BAL_04     = 42,			
	G1_FIN_05     = 43, 
    G1_IN_05      = 44,
    G1_OUT_05     = 45,
	G1_LINE_05    = 46,
	G1_REA_05	  = 47,
    G1_BAL_05     = 48,			
	G1_FIN_06     = 49, 
    G1_IN_06      = 50,
    G1_OUT_06     = 51,
	G1_LINE_06    = 52,
	G1_REA_06	  = 53,
    G1_BAL_06     = 54;
	
var G2_PR_PK_01 = 0,	 
	G2_PR_PK_02 = 1,
	G2_PR_PK_03 = 2,
	G2_PR_PK_04 = 3,
	G2_PR_PK_05 = 4,
	G2_PR_PK_06 = 5,	 
	G2_PR_NM_01 = 6,
	G2_PR_NM_02 = 7,		
	G2_PR_NM_03 = 8,	
	G2_PR_NM_04 = 9,
	G2_PR_NM_05 = 10,
	G2_PR_NM_06	= 11;
	 
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

    data = "<%=ESysLib.SetListDataSQL("select UOM_CODE , UOM_CODE from tlg_it_uom a where ( UOM_CODE = 'KG' or UOM_CODE = 'PCS' ) and  a.del_if=0 order by 1")%>"; 
    lstUOM.SetDataText(data);	 	 	    
    
    data = "data|10|G-Total|20|Cust-Total";
    lstGridType.SetDataText(data);  
    lstGridType.value = '10'; 
	
    data = "data|10|Wait>0|20|Prod Bal>0||";
    lstSearchType.SetDataText(data);  
    lstSearchType.value = ''; 	
    	
    var ctrl = grdINOUT.GetGridControl();   
    
	ctrl.ColFormat(G1_ORD_QTY)  = "###,###,###" ; 
	ctrl.ColFormat(G1_PLAN_QTY) = "###,###,###" ;
	
	ctrl.ColFormat(G1_FIN_01)   = "###,###,###" ;     
    ctrl.ColFormat(G1_IN_01)    = "###,###,###" ;
	ctrl.ColFormat(G1_OUT_01)   = "###,###,###" ;
	ctrl.ColFormat(G1_LINE_01)  = "###,###,###" ;
	ctrl.ColFormat(G1_REA_01)   = "###,###,###" ;
	ctrl.ColFormat(G1_BAL_01)   = "###,###,###" ;	
    
	ctrl.ColFormat(G1_FIN_02)   = "###,###,###" ;   
    ctrl.ColFormat(G1_IN_02)    = "###,###,###" ;
	ctrl.ColFormat(G1_OUT_02)   = "###,###,###" ;
	ctrl.ColFormat(G1_LINE_02)  = "###,###,###" ;
	ctrl.ColFormat(G1_REA_02)   = "###,###,###" ;
	ctrl.ColFormat(G1_BAL_02)   = "###,###,###" ;
    
	ctrl.ColFormat(G1_FIN_03)   = "###,###,###" ;    
    ctrl.ColFormat(G1_IN_03)    = "###,###,###" ; 
	ctrl.ColFormat(G1_OUT_03)   = "###,###,###" ;
	ctrl.ColFormat(G1_LINE_03)  = "###,###,###" ;
	ctrl.ColFormat(G1_REA_03)   = "###,###,###" ;
	ctrl.ColFormat(G1_BAL_03)   = "###,###,###" ;
     	
	ctrl.ColFormat(G1_FIN_04)   = "###,###,###" ;     
    ctrl.ColFormat(G1_IN_04)    = "###,###,###" ;
	ctrl.ColFormat(G1_OUT_04)   = "###,###,###" ;
	ctrl.ColFormat(G1_LINE_04)  = "###,###,###" ;
	ctrl.ColFormat(G1_REA_04)   = "###,###,###" ;
	ctrl.ColFormat(G1_BAL_04)   = "###,###,###" ;	
	
	ctrl.ColFormat(G1_FIN_05)   = "###,###,###" ;  
    ctrl.ColFormat(G1_IN_05)    = "###,###,###" ; 
	ctrl.ColFormat(G1_OUT_05)   = "###,###,###" ;
	ctrl.ColFormat(G1_LINE_05)  = "###,###,###" ;
	ctrl.ColFormat(G1_REA_05)   = "###,###,###" ;
	ctrl.ColFormat(G1_BAL_05)   = "###,###,###" ;
    
	ctrl.ColFormat(G1_FIN_06)   = "###,###,###" ;   
    ctrl.ColFormat(G1_IN_06)    = "###,###,###" ;
	ctrl.ColFormat(G1_OUT_06)   = "###,###,###" ;
	ctrl.ColFormat(G1_LINE_06)  = "###,###,###" ;
	ctrl.ColFormat(G1_REA_06)   = "###,###,###" ;
	ctrl.ColFormat(G1_BAL_06)   = "###,###,###" ;	
	
	ctrl.FrozenCols = G1_FIN_01 ; 	
		 	  	
}  
//============================================================================= 

var col1, col2, col3, col4, col5;
					            
function OnSearch(id)
{
    switch(id)
    {      
		case 'SPEC_HEADER':							
			//---------------------
			data_fpgm00070_header.Call('SELECT');	
		break;
		         
        case 'BALANCE':           
            //---------------------  			     
            data_fpgm00070_1.Call('SELECT');			 
        break;  	
		
		case 'PR_HEADER':
		    //--------------------------
			data_fpgm00070.Call('SELECT');
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
        case 'data_fpgm00070_1':            
            if ( grdINOUT.rows > 1 )
            {
				var fg = grdINOUT.GetGridControl();
				
				fg.FixedRows  = 2 ;
            	fg.MergeCells = 5 ;	
				
				fg.MergeCol(0)   = true;
				fg.MergeCol(1)   = true;
				fg.MergeCol(2)   = true;
				fg.MergeCol(3)   = true;
				fg.MergeCol(4)   = true;
							 
				fg.MergeCol(G1_CUST_NM)   = true;
				fg.MergeCol(G1_PO_NO)     = true;
				fg.MergeCol(G1_ITEM_CODE) = true;
				fg.MergeCol(G1_ITEM_NAME) = true;
				
				fg.MergeCol(G1_SPEC01_NM) = true;
				fg.MergeCol(G1_SPEC02_NM) = true;
				fg.MergeCol(G1_SPEC03_NM) = true;
				fg.MergeCol(G1_SPEC04_NM) = true;
				fg.MergeCol(G1_SPEC05_NM) = true;
				 
				fg.MergeCol(G1_ORD_QTY)   = true;
				fg.MergeCol(G1_PLAN_QTY)  = true;
				
				fg.Cell(0, 0, G1_CUST_NM,   1, G1_CUST_NM   ) = "Cust Name";
                fg.Cell(0, 0, G1_PO_NO,     1, G1_PO_NO     ) = "P/O No";  
				              
                fg.Cell(0, 0, G1_ITEM_CODE, 1, G1_ITEM_CODE ) = "Item Code";                 
                fg.Cell(0, 0, G1_ITEM_NAME, 1, G1_ITEM_NAME ) = "Item Name";
				
				fg.Cell(0, 0, G1_ORD_QTY,   1, G1_ORD_QTY   ) = "Ord Qty";
				fg.Cell(0, 0, G1_PLAN_QTY,  1, G1_PLAN_QTY  ) = "Plan Qty";
				
				fg.Cell(0, 0, G1_SPEC01_NM, 1, G1_SPEC01_NM ) = col1;	
				fg.Cell(0, 0, G1_SPEC02_NM, 1, G1_SPEC02_NM ) = col2;	
				fg.Cell(0, 0, G1_SPEC03_NM, 1, G1_SPEC03_NM ) = col3;	
				fg.Cell(0, 0, G1_SPEC04_NM, 1, G1_SPEC04_NM ) = col4;	
				fg.Cell(0, 0, G1_SPEC05_NM, 1, G1_SPEC05_NM ) = col5;	
																											
				fg.MergeRow(0) = true;
				
				//------------------------------------------------------------------
				fg.ColHidden(G1_FIN_01)   = true ;
				fg.ColHidden(G1_IN_01)    = true ;
				fg.ColHidden(G1_OUT_01)   = true ;
				fg.ColHidden(G1_LINE_01)  = true ;
				fg.ColHidden(G1_REA_01)   = true ;
				fg.ColHidden(G1_BAL_01)   = true ;
					
				if ( grdPRHeader.GetGridData( 1, G2_PR_NM_01 ) != '' )
				{
					fg.Cell(0, 0, G1_FIN_01, 0, G1_BAL_01 ) = grdPRHeader.GetGridData( 1, G2_PR_NM_01 );
					fg.Cell(0, 1, G1_FIN_01,   1 ) = "Finish" ;
                	fg.Cell(0, 1, G1_IN_01,    1 ) = "In" ;
                	fg.Cell(0, 1, G1_OUT_01,   1 ) = "Out" ;
					fg.Cell(0, 1, G1_LINE_01,  1 ) = "In Line" ;
					fg.Cell(0, 1, G1_REA_01,   1 ) = "Wait" ;
					fg.Cell(0, 1, G1_BAL_01,   1 ) = "Plan Bal" ;
					
					chkColFinish.value =='Y'?fg.ColHidden(G1_FIN_01) =false:fg.ColHidden(G1_FIN_01) =true;
					chkColIn.value     =='Y'?fg.ColHidden(G1_IN_01)  =false:fg.ColHidden(G1_IN_01)  =true;
					fg.ColHidden(G1_OUT_01)=false;
					chkColInLine.value =='Y'?fg.ColHidden(G1_LINE_01)=false:fg.ColHidden(G1_LINE_01)=true;
					chkColWait.value   =='Y'?fg.ColHidden(G1_REA_01) =false:fg.ColHidden(G1_REA_01) =true;
					fg.ColHidden(G1_BAL_01)=false ;
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_FIN_02)   = true ;
				fg.ColHidden(G1_IN_02)    = true ;
				fg.ColHidden(G1_OUT_02)   = true ;
				fg.ColHidden(G1_LINE_02)  = true ;
				fg.ColHidden(G1_REA_02)   = true ;
				fg.ColHidden(G1_BAL_02)   = true ;
					
				if ( grdPRHeader.GetGridData( 1, G2_PR_NM_02 ) != '' )
				{
					fg.Cell(0, 0, G1_FIN_02, 0, G1_BAL_02 ) = grdPRHeader.GetGridData( 1, G2_PR_NM_02 );
					fg.Cell(0, 1, G1_FIN_02,   1 ) = "Finish" ;
                	fg.Cell(0, 1, G1_IN_02,    1 ) = "In" ;
                	fg.Cell(0, 1, G1_OUT_02,   1 ) = "Out" ;
					fg.Cell(0, 1, G1_LINE_02,  1 ) = "In Line" ;
					fg.Cell(0, 1, G1_REA_02,   1 ) = "Wait" ;
					fg.Cell(0, 1, G1_BAL_02,   1 ) = "Plan Bal" ;
					
					chkColFinish.value =='Y'?fg.ColHidden(G1_FIN_02) =false:fg.ColHidden(G1_FIN_02) =true;
					chkColIn.value     =='Y'?fg.ColHidden(G1_IN_02)  =false:fg.ColHidden(G1_IN_02)  =true;
					fg.ColHidden(G1_OUT_02)=false;
					chkColInLine.value =='Y'?fg.ColHidden(G1_LINE_02)=false:fg.ColHidden(G1_LINE_02)=true;
					chkColWait.value   =='Y'?fg.ColHidden(G1_REA_02) =false:fg.ColHidden(G1_REA_02) =true;
					fg.ColHidden(G1_BAL_02)=false ;
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_FIN_03)   = true ;
				fg.ColHidden(G1_IN_03)    = true ;
				fg.ColHidden(G1_OUT_03)   = true ;
				fg.ColHidden(G1_LINE_03)  = true ;
				fg.ColHidden(G1_REA_03)   = true ;
				fg.ColHidden(G1_BAL_03)   = true ;
					
				if ( grdPRHeader.GetGridData( 1, G2_PR_NM_03 ) != '' )
				{
					fg.Cell(0, 0, G1_FIN_03, 0, G1_BAL_03 ) = grdPRHeader.GetGridData( 1, G2_PR_NM_03 );
					fg.Cell(0, 1, G1_FIN_03,   1 ) = "Finish" ;
                	fg.Cell(0, 1, G1_IN_03,    1 ) = "In" ;
                	fg.Cell(0, 1, G1_OUT_03,   1 ) = "Out" ;
					fg.Cell(0, 1, G1_LINE_03,  1 ) = "In Line" ;
					fg.Cell(0, 1, G1_REA_03,   1 ) = "Wait" ;
					fg.Cell(0, 1, G1_BAL_03,   1 ) = "Plan Bal" ;
					
					chkColFinish.value =='Y'?fg.ColHidden(G1_FIN_03) =false:fg.ColHidden(G1_FIN_03) =true;
					chkColIn.value     =='Y'?fg.ColHidden(G1_IN_03)  =false:fg.ColHidden(G1_IN_03)  =true;
					fg.ColHidden(G1_OUT_03)=false;
					chkColInLine.value =='Y'?fg.ColHidden(G1_LINE_03)=false:fg.ColHidden(G1_LINE_03)=true;
					chkColWait.value   =='Y'?fg.ColHidden(G1_REA_03) =false:fg.ColHidden(G1_REA_03) =true;
					fg.ColHidden(G1_BAL_03)=false ;
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_FIN_04)   = true ;
				fg.ColHidden(G1_IN_04)    = true ;
				fg.ColHidden(G1_OUT_04)   = true ;
				fg.ColHidden(G1_LINE_04)  = true ;
				fg.ColHidden(G1_REA_04)   = true ;
				fg.ColHidden(G1_BAL_04)   = true ;
					
				if ( grdPRHeader.GetGridData( 1, G2_PR_NM_04 ) != '' )
				{
					fg.Cell(0, 0, G1_FIN_04, 0, G1_BAL_04 ) = grdPRHeader.GetGridData( 1, G2_PR_NM_04 );
					fg.Cell(0, 1, G1_FIN_04,   1 ) = "Finish" ;
                	fg.Cell(0, 1, G1_IN_04,    1 ) = "In" ;
                	fg.Cell(0, 1, G1_OUT_04,   1 ) = "Out" ;
					fg.Cell(0, 1, G1_LINE_04,  1 ) = "In Line" ;
					fg.Cell(0, 1, G1_REA_04,   1 ) = "Wait" ;
					fg.Cell(0, 1, G1_BAL_04,   1 ) = "Plan Bal" ;
					
					chkColFinish.value =='Y'?fg.ColHidden(G1_FIN_04) =false:fg.ColHidden(G1_FIN_04) =true;
					chkColIn.value     =='Y'?fg.ColHidden(G1_IN_04)  =false:fg.ColHidden(G1_IN_04)  =true;
					fg.ColHidden(G1_OUT_04)=false;
					chkColInLine.value =='Y'?fg.ColHidden(G1_LINE_04)=false:fg.ColHidden(G1_LINE_04)=true;
					chkColWait.value   =='Y'?fg.ColHidden(G1_REA_04) =false:fg.ColHidden(G1_REA_04) =true;
					fg.ColHidden(G1_BAL_04)=false ;
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_FIN_05)   = true ;
				fg.ColHidden(G1_IN_05)    = true ;
				fg.ColHidden(G1_OUT_05)   = true ;
				fg.ColHidden(G1_LINE_05)  = true ;
				fg.ColHidden(G1_REA_05)   = true ;
				fg.ColHidden(G1_BAL_05)   = true ;
					
				if ( grdPRHeader.GetGridData( 1, G2_PR_NM_05 ) != '' )
				{
					fg.Cell(0, 0, G1_FIN_05, 0, G1_BAL_05 ) = grdPRHeader.GetGridData( 1, G2_PR_NM_05 );
					fg.Cell(0, 1, G1_FIN_05,   1 ) = "Finish" ;
                	fg.Cell(0, 1, G1_IN_05,    1 ) = "In" ;
                	fg.Cell(0, 1, G1_OUT_05,   1 ) = "Out" ;
					fg.Cell(0, 1, G1_LINE_05,  1 ) = "In Line" ;
					fg.Cell(0, 1, G1_REA_05,   1 ) = "Wait" ;
					fg.Cell(0, 1, G1_BAL_05,   1 ) = "Plan Bal" ;
					
					chkColFinish.value =='Y'?fg.ColHidden(G1_FIN_05) =false:fg.ColHidden(G1_FIN_05) =true;
					chkColIn.value     =='Y'?fg.ColHidden(G1_IN_02)  =false:fg.ColHidden(G1_IN_05)  =true;
					fg.ColHidden(G1_OUT_05)=false;
					chkColInLine.value =='Y'?fg.ColHidden(G1_LINE_02)=false:fg.ColHidden(G1_LINE_05)=true;
					chkColWait.value   =='Y'?fg.ColHidden(G1_REA_02) =false:fg.ColHidden(G1_REA_05) =true;
					fg.ColHidden(G1_BAL_05)=false ;
				}	
				//--------------------------------------------------------------------
				//------------------------------------------------------------------
				fg.ColHidden(G1_FIN_06)   = true ;
				fg.ColHidden(G1_IN_06)    = true ;
				fg.ColHidden(G1_OUT_06)   = true ;
				fg.ColHidden(G1_LINE_06)  = true ;
				fg.ColHidden(G1_REA_06)   = true ;
				fg.ColHidden(G1_BAL_06)   = true ;
					
				if ( grdPRHeader.GetGridData( 1, G2_PR_NM_06 ) != '' )
				{
					fg.Cell(0, 0, G1_FIN_06, 0, G1_BAL_06 ) = grdPRHeader.GetGridData( 1, G2_PR_NM_06 );
					fg.Cell(0, 1, G1_FIN_06,   1 ) = "Finish" ;
                	fg.Cell(0, 1, G1_IN_06,    1 ) = "In" ;
                	fg.Cell(0, 1, G1_OUT_06,   1 ) = "Out" ;
					fg.Cell(0, 1, G1_LINE_06,  1 ) = "In Line" ;
					fg.Cell(0, 1, G1_REA_06,   1 ) = "Wait" ;
					fg.Cell(0, 1, G1_BAL_06,   1 ) = "Prod Bal" ;
					
					chkColFinish.value =='Y'?fg.ColHidden(G1_FIN_06) =false:fg.ColHidden(G1_FIN_06) =true;
					chkColIn.value     =='Y'?fg.ColHidden(G1_IN_06)  =false:fg.ColHidden(G1_IN_06)  =true;
					fg.ColHidden(G1_OUT_06)=false;
					chkColInLine.value =='Y'?fg.ColHidden(G1_LINE_06)=false:fg.ColHidden(G1_LINE_06)=true;
					chkColWait.value   =='Y'?fg.ColHidden(G1_REA_06) =false:fg.ColHidden(G1_REA_06) =true;
					fg.ColHidden(G1_BAL_06)=false ;
				}	
				//--------------------------------------------------------------------
							    
                grdINOUT.SetCellBold( 1, G1_ITEM_CODE, grdINOUT.rows-1, G1_ITEM_CODE, true);					                
                
				grdINOUT.SetCellBgColor( 2, G1_ORD_QTY, grdINOUT.rows - 1, G1_PLAN_QTY, 0xFFFFCC );	
				
                grdINOUT.SetCellBgColor( 2, G1_FIN_01, grdINOUT.rows - 1, G1_BAL_01, 0xCCFFFF );			
				grdINOUT.SetCellBgColor( 2, G1_FIN_03, grdINOUT.rows - 1, G1_BAL_03, 0xCCFFFF );	
				grdINOUT.SetCellBgColor( 2, G1_FIN_05, grdINOUT.rows - 1, G1_BAL_05, 0xCCFFFF );	
				
				if ( lstGridType.value == '10' )
	            {
	                grdINOUT.Subtotal( 0, 2, -1, '17!18!19!20!21!22!23!24!25!26!27!28!29!30!31!32!33!34!35!36!37!38!39!40!41!42!43!44!45!46!47!48!49!50!51!52!53!54','###,###,###.##');							
	            }
	            else if ( lstGridType.value == '20' )
	            {
	                grdINOUT.Subtotal( 0, 2, 0, '17!18!19!20!21!22!23!24!25!26!27!28!29!30!31!32!33!34!35!36!37!38!39!40!41!42!43!44!45!46!47!48!49!50!51!52!53!54','###,###,###.##');							
	            }				
            }   
        
        break;    

		case 'data_fpgm00070': 
			if ( grdPRHeader.rows > 1 )
			{
				txtPRPK_01.text  = grdPRHeader.GetGridData( 1, G2_PR_PK_01 );				 
				txtPRPK_02.text  = grdPRHeader.GetGridData( 1, G2_PR_PK_02 );				 
				txtPRPK_03.text  = grdPRHeader.GetGridData( 1, G2_PR_PK_03 );				 
				txtPRPK_04.text  = grdPRHeader.GetGridData( 1, G2_PR_PK_04 );		
				txtPRPK_05.text  = grdPRHeader.GetGridData( 1, G2_PR_PK_05 );
				txtPRPK_06.text  = grdPRHeader.GetGridData( 1, G2_PR_PK_06 );		 						
				
				OnSearch('BALANCE');
			}
			else
			{
				alert('There no process for this factory .');
			}           
                     
        break;
		
        case 'data_fpgm00070_header':    
		
		if(grdHeader.rows>1)
	            {
	                col1     = grdHeader.GetGridData(1,2);
	                var dis_col1 = grdHeader.GetGridData(1,3);
	                col2     = grdHeader.GetGridData(1,4);
	                var dis_col2 = grdHeader.GetGridData(1,5);
	                col3     = grdHeader.GetGridData(1,6);
	                var dis_col3 = grdHeader.GetGridData(1,7);
	                col4     = grdHeader.GetGridData(1,8);
	                var dis_col4 = grdHeader.GetGridData(1,9);
	                col5     = grdHeader.GetGridData(1,10);
	                var dis_col5 = grdHeader.GetGridData(1,11);
					
					var fg = grdINOUT.GetGridControl();
					
	                if(dis_col1!=0)
	                {
						fg.ColHidden(G1_SPEC01_NM) = false ;
							                     
						lbSpecGrp01.text = col1;
						chkSpecGrp01.value = 'Y';
						chkSpecGrp01.style.display = "";							                    
	                }
					else
					{
						chkSpecGrp01.style.display = "none";
					}
					
	                if (dis_col2!=0)
	                {	 
						fg.ColHidden(G1_SPEC02_NM) = false ;
						                    
						lbSpecGrp02.text = col2;
						chkSpecGrp02.value = 'Y';
						chkSpecGrp02.style.display = "";
	                }
					else
					{
						chkSpecGrp02.style.display = "none";
					} 	
					
	                if (dis_col3!=0)
	                {	
						fg.ColHidden(G1_SPEC03_NM) = false ; 
						                   
						lbSpecGrp03.text = col3;
						chkSpecGrp03.value = 'Y';
						chkSpecGrp03.display = "";
	                }
					else
					{
						chkSpecGrp03.style.display = "none";
					} 	
					
	                if (dis_col4!=0)
	                {	     
						fg.ColHidden(G1_SPEC04_NM) = false ;
						                    
						lbSpecGrp04.text = col4;
						chkSpecGrp04.value = 'Y';
						chkSpecGrp04.display = "";
	                }
					else
					{
						chkSpecGrp04.style.display = "none";
					} 	
					
	                if (dis_col5!=0)
	                {	
						fg.ColHidden(G1_SPEC05_NM) = false ;
						                  
						lbSpecGrp05.text = col5;
						chkSpecGrp05.value = 'Y';
						chkSpecGrp05.display = "";                   
	                }
					else
					{
						chkSpecGrp05.style.display = "none";
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
			 		var path = System.RootURL + '/form/fp/gm/fpgm00071.aspx?pr_pk='+ pr_pk +'&ordplan_pk='+ ordplan_pk;
	         		var object = System.OpenModal( path ,900 , 500 ,  'resizable:yes;status:yes',this);
				}
				else if ( grdINOUT.col == G1_IN_01 || grdINOUT.col == G1_IN_02 || grdINOUT.col == G1_IN_03 || grdINOUT.col == G1_IN_04 || grdINOUT.col == G1_IN_05 || grdINOUT.col == G1_IN_06 )
				{
			 		var path = System.RootURL + '/form/fp/gm/fpgm00073.aspx?pr_pk='+ pr_pk +'&ordplan_pk='+ ordplan_pk;
	         		var object = System.OpenModal( path ,900 , 500 ,  'resizable:yes;status:yes',this);				
				}
				else if ( grdINOUT.col == G1_FIN_01 || grdINOUT.col == G1_FIN_02 || grdINOUT.col == G1_FIN_03 || grdINOUT.col == G1_FIN_04 || grdINOUT.col == G1_FIN_05 || grdINOUT.col == G1_FIN_06 )
				{
			 		var path = System.RootURL + '/form/fp/gm/fpgm00072.aspx?pr_pk='+ pr_pk +'&ordplan_pk='+ ordplan_pk;
	         		var object = System.OpenModal( path ,900 , 500 ,  'resizable:yes;status:yes',this);				
				}	
				else if ( grdINOUT.col == G1_REA_01 || grdINOUT.col == G1_REA_02 || grdINOUT.col == G1_REA_03 || grdINOUT.col == G1_REA_04 || grdINOUT.col == G1_REA_05 || grdINOUT.col == G1_REA_06 )
				{
			 		var path = System.RootURL + '/form/fp/gm/fpgm00074.aspx?pr_pk='+ pr_pk +'&ordplan_pk='+ ordplan_pk;
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
    <gw:data id="data_fpgm00070_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fpgm00070_1"  >
                <input bind="grdINOUT" >					 										           			      
					<input bind="txtPOCust" />				
			        <input bind="txtItem01" />
					<input bind="lstSearchType" />
					<input bind="dtFrom" />		
					<input bind="dtTo" />
					<input bind="lstUOM" />
						
					<input bind="chkSpecGrp01" />
					<input bind="chkSpecGrp02" />
					<input bind="chkSpecGrp03" />
					<input bind="chkSpecGrp04" />
					<input bind="chkSpecGrp05" />
											
					<input bind="txtPRPK_01" />					   
					<input bind="txtPRPK_02" />					 
					<input bind="txtPRPK_03" />					 
					<input bind="txtPRPK_04" />
					<input bind="txtPRPK_05" /> 
					<input bind="txtPRPK_06" />															      			        
                </input>
                <output bind="grdINOUT" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpgm00070" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_SEL_fpgm00070"  >
                <input bind="grdPRHeader" >					 					 						 													      			        
                </input>
                <output bind="grdPRHeader" />
            </dso>
        </xml>
    </gw:data>
   <!---------------------------------------------------------------->
    <gw:data id="data_fpgm00070_header" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpgm00070_header"> 
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
                <gw:textbox id="txtItem01" maxlen="150" styles='width:100%' onenterkey="OnSearch('BALANCE')" />
            </td>
			<td style="width: 2%" align="right" >                 
            </td>
			<td style="width: 5%; white-space: nowrap" align="center" >    
				 <gw:list id="lstSearchType" styles='width:70' />
            </td>  
			<td style="width: 5%; white-space: nowrap" >
                <gw:list id="lstUOM" styles='width:70' />
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
		<tr>
			<td colspan=14 >
				<table style="width: 100%; height: 100%" >
					<tr>	
						<td style="width: 8%; white-space: nowrap" align="right">	
							<gw:label id="lbSpecGrp01" styles='width:100%;color:cc0000;font:9pt'></gw:label>									                 
			            </td>			             
			            <td style="width: 9%; white-space: nowrap" align="left">								 					
			                <gw:checkbox id="chkSpecGrp01" defaultvalue="Y|N" value="N" onclick="OnSearch('BALANCE')"  />
			            </td>	
						<td style="width: 8%; white-space: nowrap" align="right">	
							<gw:label id="lbSpecGrp02" styles='width:100%;color:cc0000;font:9pt'></gw:label>									                 
			            </td>			            
			            <td style="width: 9%; white-space: nowrap" align="left">													 
			                <gw:checkbox id="chkSpecGrp02" defaultvalue="Y|N" value="N" onclick="OnSearch('BALANCE')"  />
			            </td>	
						<td style="width: 8%; white-space: nowrap" align="right">	
							<gw:label id="lbSpecGrp03" styles='width:100%;color:cc0000;font:9pt'></gw:label>									                 
			            </td>			            
			            <td style="width: 9%; white-space: nowrap" align="left">							 
			                <gw:checkbox id="chkSpecGrp03" defaultvalue="Y|N" value="N" onclick="OnSearch('BALANCE')"   />
			            </td>	
						<td style="width: 8%; white-space: nowrap" align="right">	
							<gw:label id="lbSpecGrp04" styles='width:100%;color:cc0000;font:9pt'></gw:label>									                 
			            </td>			            
			            <td style="width: 9%; white-space: nowrap" align="left">							 
			                <gw:checkbox id="chkSpecGrp04" defaultvalue="Y|N" value="N" onclick="OnSearch('BALANCE')"  />
			            </td>	
						<td style="width: 8%; white-space: nowrap" align="right">	
							<gw:label id="lbSpecGrp05" styles='width:100%;color:cc0000;font:9pt'></gw:label>									                 
			            </td>			          
			            <td style="width: 9%; white-space: nowrap" align="left">							 
			                <gw:checkbox id="chkSpecGrp05" defaultvalue="Y|N" value="N" onclick="OnSearch('BALANCE')"   />
			            </td> 
						<td style="width: 10%; white-space: nowrap" align="center">
							Fin<gw:checkbox id="chkColFinish" defaultvalue="Y|N" value="Y" onclick="OnColView('FIN')"  />
							In<gw:checkbox id="chkColIn" defaultvalue="Y|N" value="Y" onclick="OnColView('IN')"  />
							In Line<gw:checkbox id="chkColInLine" defaultvalue="Y|N" value="Y" onclick="OnColView('IN_LINE')"  />
							Wait<gw:checkbox id="chkColWait" defaultvalue="Y|N" value="Y" onclick="OnColView('WAIT')"  />
						</td> 
						<td style="width: 5%; white-space: nowrap" align="right">
							<gw:imgbtn img="select" alt="View Detail" id="btnSelect1" onclick="OnPopUp('VIEW_DETAIL')" />
						</td>   					
					</tr>
				</table>
			</td>        
        </tr>               
        <tr style="height: 98%">
            <td colspan="14">
                <gw:grid id='grdINOUT' 
					header='_CUST_PK|Cust Name|_PLAN_PK|P/O No|_ITEM_PK|Item Code|Item Name|_Spec 01 PK|_Spec 01|_Spec 02 PK|_Spec 02|_Spec 03 PK|_Spec 03|_Spec 04 PK|_Spec 04|_Spec 05 PK|_Spec 05|Ord Qty|Plan Qty|01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|15|16|17|18|19|30|31|32|33|34|35|36' 
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
					aligns='0|0|0|0|0|0|0|0|1|0|1|0|1|0|1|0|1|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'							 				 
					widths='0|2000|0|1500|0|1500|3000|0|1000|0|1000|0|1000|0|1000|0|1000|1200|1200|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' styles='width:100%; height:100%' />
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
<!----------------------------------------------------------------------------------------------->
<gw:grid id='grdPRHeader' header='WH_PK_01|WH_PK_02|WH_PK_03|WH_PK_04|WH_PK_05|WH_PK_06|WH_NM_01|WH_NM_02|WH_NM_03|WH_NM_04|WH_NM_05|WH_NM_06'
    format='0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
    styles='width:100%; height:460;display:none' />
<!----------------------------------------------------------------------------------------------->
<gw:grid id='grdHeader' header='_PK|_GRID_TYPE|Col1 Header|Col1 Display|Col2 Header|Col2 Display|Col3 Header|Col3 Display|Col4 Header|Col4 Display|Col5 Header|Col5 Display|Remark'
       format='0|0|0|3|0|3|0|3|0|3|0|3|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' check='||||||||||||'
       editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
       sorting='T' autosize='T' styles='width:100%; height:50%;display:none' /> 
<!----------------------------------------------------------------------------------------------->
</html>
