<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Cutting WI Entry I</title>
</head>

<script>

var G1_Chk             = 0,
    G1_SO_PK           = 1,
    G1_Slip_No         = 2,
    G1_PO_No           = 3,
    G1_TCO_STITEM_PK   = 4,
    G1_Item_Code       = 5,
    G1_Item_Name       = 6,
    G1_Total_Order_Qty = 7,
    G1_Cutting_WI_Qty  = 8,
    G1_Cutting_Balance = 9;
    
var G2_Style_PK             = 0,
    G2_Style_Code           = 1,   
    G2_MAT_PK               = 2,
    G2_MAT_CODE             = 3,
    G2_MAT_NAME             = 4,
    G2_SPEC1                = 5,
    G2_SPEC2                = 6,
    G2_SPEC3                = 7,
    G2_PATTERN_GRP_PK       = 8,
    G2_PATTERN_GROUP        = 9,
    G2_Cutting_Balance      = 10,
    G2_Mat_Qty              = 11,
    G2_Mat_Unit_Qty         = 12;
    
var G3_PK           = 0,
    G3_WI_No        = 1,
    G3_Date         = 2,
    G3_ARRAY_SO_PK  = 3,
    G3_PO_No        = 4,
    G3_TPR_LINE_PK  = 5,
    G3_Line_ID      = 6,
    G3_Line_Name    = 7, 
    G3_CHARGER_PK   = 8,
    G3_Emp_Name     = 9,
    G3_Status       = 10, 
    G3_Description  = 11;  
    
var G4_WI_CUTTING_INS_PK     = 0,
    G4_STYLE_PK              = 1,
    G4_Style_Code            = 2,
    G4_MAT_PK                = 3,
    G4_Mat_Code              = 4,
    G4_Spec1                 = 5,
    G4_Spec2                 = 6,
    G4_Spec3                 = 7,
    G4_PATTERN_GRP_PK        = 8,
    G4_Pattern_Group         = 9,
    G4_Lot_ID                = 10,
    G4_Ord_Qty               = 11,
    G4_Ord_Bal_Qty           = 12,
    G4_Lot_Qty               = 13,
    G4_Size_1                = 14,
    G4_Size_2                = 15,
    G4_Size_3                = 16,
    G4_Size_4                = 17,
    G4_Size_5                = 18,
    G4_Size_6                = 19,
    G4_Size_7                = 20,
    G4_Size_8                = 21,
    G4_Size_9                = 22,
    G4_Size_10               = 23,
    G4_WI_Qty                = 24,
    G4_Mat_Unit_Qty          = 25,      
    G4_Mat_Gross_Qty         = 26,
    G4_Mat_Length            = 27,
    G4_Mat_Width             = 28,
    G4_Actual_Qty            = 29,
    G4_Description           = 30,
    G4_PK                    = 31,
    G4_SO_PO_PK              = 32,   
    G4_SO_PO                 = 33;
         
//===================================================================================           

function OnToggle(pos)
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");
    var imgArrow  = document.all("imgArrow");  
    var imgArrow1 = document.all("imgArrow1");   
    var imgArrow2 = document.all("imgArrow2"); 
    
    if ( pos == '1' ) 
    { 
        if ( imgArrow1.status == "expand" && imgArrow2.status == "expand" )
        {
            left.style.display     = "none";
            right.style.display    = "";                              
            
            right.style.width  ="99%";
            
            imgArrow1.status = "collapse";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="none";
            imgArrow2.style.display="";
            imgArrow.style.display ="none";                         
        }
        else if ( imgArrow1.status == "expand" && imgArrow2.status == "collapse" )
        {
            left.style.display     = "";
            right.style.display    = "";
            
            left.style.width   ="48%";
            right.style.width  ="48%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
            imgArrow.style.display = "";
        }
    }    
    else
    {
        if ( imgArrow1.status == "expand" && imgArrow2.status == "expand" )
        {
            left.style.width ="99%";
            
            right.style.display    = "";       
            right.style.display    = "none";            
            
            imgArrow1.status = "expand";
            imgArrow2.status = "collapse";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="none";
            imgArrow.style.display ="";                        
        }
        else if ( imgArrow1.status == "collapse" && imgArrow2.status == "expand" )
        {
            left.style.display  ="";
            right.style.display ="";            
                    
            left.style.width   ="48%";
            right.style.width  ="48%";
            
            imgArrow1.status = "expand";
            imgArrow2.status = "expand";
            
            imgArrow1.style.display="";
            imgArrow2.style.display="";
            imgArrow.style.display ="";
        }
    }    
}
//===================================================================================           
    function BodyInit()
    {
        dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-30));
        dtFrom1.SetDataText(System.AddDate(dtTo1.GetData(),-30));
        
        FormatGrid();
        
        OnChangeGrid();
        //------------------

     }
//=======================================================================
 function FormatGrid()
 {
        var ctrl = grdWI.GetGridControl();
        
        ctrl.ColFormat(G4_Ord_Qty)       = "###,###,###" ;
        ctrl.ColFormat(G4_Ord_Bal_Qty)   = "###,###,###" ;
        ctrl.ColFormat(G4_Lot_Qty)       = "###,###,###" ;
        ctrl.ColFormat(G4_Size_1)        = "###,###,###" ;
        ctrl.ColFormat(G4_Size_2)        = "###,###,###" ;
        ctrl.ColFormat(G4_Size_3)        = "###,###,###" ;
        ctrl.ColFormat(G4_Size_4)        = "###,###,###" ;
        ctrl.ColFormat(G4_Size_5)        = "###,###,###" ;
        ctrl.ColFormat(G4_Size_6)        = "###,###,###" ;
        ctrl.ColFormat(G4_Size_7)        = "###,###,###" ;
        ctrl.ColFormat(G4_Size_8)        = "###,###,###" ;
        ctrl.ColFormat(G4_Size_9)        = "###,###,###" ;
        ctrl.ColFormat(G4_Size_10)       = "###,###,###" ;
        ctrl.ColFormat(G4_WI_Qty)        = "###,###,###" ;
        ctrl.ColFormat(G4_Mat_Unit_Qty)  = "###,###,###.#####" ;
        ctrl.ColFormat(G4_Mat_Gross_Qty) = "###,###,###.##" ;
        ctrl.ColFormat(G4_Mat_Length)    = "###,###,###.##" ;
        ctrl.ColFormat(G4_Mat_Width)     = "###,###,###.##" ;
        ctrl.ColFormat(G4_Actual_Qty)    = "###,###,###.##" ;
        
        var ctrl = grdMatCons.GetGridControl();
        
        ctrl.ColFormat(G2_Cutting_Balance) = "###,###,###" ;
        ctrl.ColFormat(G2_Mat_Qty)         = "###,###,###.##" ;
        ctrl.ColFormat(G2_Mat_Unit_Qty)    = "###,###,###.#####" ;
        
        var ctrl = grdSO.GetGridControl();
        
        ctrl.ColFormat(G1_Total_Order_Qty) = "###,###,###" ;
        ctrl.ColFormat(G1_Cutting_WI_Qty)  = "###,###,###" ;
        ctrl.ColFormat(G1_Cutting_Balance) = "###,###,###" ;
                
 }
//=======================================================================================
 function OnSearch(id)
 {
        switch(id)
        {
            case 'grdSO': //search WI
                data_fpcw00100.Call('SELECT')
            break;
            
            case 'MatCons':
                if ( event.col == G1_Chk )
                {
                    var strSOPK = ""; 
                    var strSOPO = "";
                    var strCon  = "";                    
                            
                    for ( var i = 1 ; i < grdSO.rows; i++ )
                    {
                        if ( grdSO.GetGridData( i, G1_Chk ) == '-1' )
                        {
                            strSOPK = strSOPK + strCon + grdSO.GetGridData( i, G1_SO_PK );
                            strSOPO = strSOPO + strCon + grdSO.GetGridData( i, G1_PO_No );
                            strCon   = ","; 
                            //-------------------------------------               
                        }
                        //-----------------------------
                    } 
                    //-----------------------------
                    txtSOPK.text = strSOPK ;
                    txtSOPO.text = strSOPO ;    
                 }  
                //-----------------------------
                
                if ( document.all("grdMatCons").style.display == "" )
                {
                    data_fpcw00100_1.Call('SELECT');
                }
                else
                {
                    data_fpcw00100_5.Call('SELECT');
                }                   
            break;  
            
            case 'grdWIMaster': //search WI
                data_fpcw00100_2.Call('SELECT');
            break;  
            
            case 'grdWI':
            
                if ( grdWIMaster.row > 0 )
                { 
                    txtWIMasterPK.text = grdWIMaster.GetGridData( grdWIMaster.row, G3_PK);
                }
                else
                {
                    txtWIMasterPK.text = '' ;
                }               
                 //------------

                 if ( CheckGridEdit(grdWI) )
                 {
                    if ( confirm("Detail information has modified. \n Do you want to save? ") )
                    {
                        OnSave('grdWI');
                        return;
                    }
                 }
                                
                data_fpcw00100_3.Call('SELECT');    
            break;                                                    
        }
 }
 //==============================================================

function CheckGridEdit(o_Grid)
{
    for ( i = 1; i<o_Grid.rows; i++ )
    {
        if ( o_Grid.GetRowStatus(i) > 0 )
        {
            return true;
        }        
    }
    
    return false;
}
//=======================================================================================
 function OnDataReceive(obj)
 {            
        switch(obj.id)
        {
            case "pro_fpcw00100":
                alert(txtReturnValue.text);
            break;
            
            case "pro_fpcw00100_1":
                alert(txtReturnValue.text);
            break;
                                   
            case "data_fpcw00100_1":
                if ( grdMatCons.rows > 1 )
                {
                    grdMatCons.SetCellBold( 1, G2_MAT_CODE,      grdMatCons.rows - 1, G2_MAT_CODE,      true);
                    grdMatCons.SetCellBold( 1, G2_PATTERN_GROUP, grdMatCons.rows - 1, G2_PATTERN_GROUP, true);  
                    grdMatCons.SetCellBold( 1, G2_Mat_Qty,       grdMatCons.rows - 1, G2_Mat_Qty,       true);
                }              
            break; 
            
            case "data_fpcw00100_2":
                OnSearch('grdWIDetail');
            break; 
            
            case "data_fpcw00100_3":
                //------------------
                grdWI.GetGridControl().Cell( 7, 0, G4_Size_1,        0, G4_Size_10       ) = 0xCC00CC;
                grdWI.GetGridControl().Cell( 7, 0, G4_Mat_Gross_Qty, 0, G4_Mat_Gross_Qty ) = 0x3300cc;
                grdWI.GetGridControl().Cell( 7, 0, G4_Actual_Qty,    0, G4_Actual_Qty    ) = 0x3300cc; 
                //------------------            
                if ( grdWI.rows > 1 )
                {
                    for ( var i=1 ; i<grdWI.rows; i++)
                    {
                        if ( i%2==0 )
                        {
                            grdWI.SetCellBgColor( i, G4_Style_Code, i, grdWI.cols - 1, 0x99FFAA );                             
                        }
                    }
                    //----------
                    grdWI.SetCellBold( 1, G4_Mat_Code,      grdWI.rows - 1, G4_Mat_Code,      true);
                    grdWI.SetCellBold( 1, G4_Pattern_Group, grdWI.rows - 1, G4_Lot_ID,        true);
                    grdWI.SetCellBold( 1, G4_Mat_Gross_Qty, grdWI.rows - 1, G4_Mat_Gross_Qty, true);
                    grdWI.SetCellBold( 1, G4_Actual_Qty,    grdWI.rows - 1, G4_Actual_Qty,    true);
                    
                    grdWI.GetGridControl().Cell( 7, 0, G4_Lot_Qty, grdWI.rows - 1, G4_Lot_Qty ) = 0x3300cc;
                    grdWI.GetGridControl().Cell( 7, 0, G4_WI_Qty,  grdWI.rows - 1, G4_WI_Qty  ) = 0x3300cc;
                }
                                
            break; 
            
            case "data_fpcw00100_5":
                data_fpcw00100_6.Call("SELECT");
            break;                                                         
        }
 }

//=========================================================================================
 function OnMergeHeader()
 {
 }
//========================================================================
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'grdWIMaster':
        
                grdWIMaster.AddRow();
                grdWIMaster.SetGridText( grdWIMaster.rows-1, G3_CHARGER_PK, "<%=Session("EMPLOYEE_PK")%>" );
                grdWIMaster.SetGridText( grdWIMaster.rows-1, G3_Emp_Name,   "<%=Session("USER_NAME")%>"   );
                
        break;
        
        case 'grdWI':
        
            if ( txtWIMasterPK.text == '' )
            {
                alert('Pls Select one WI Master first.');
                return;
            }   
                 
	        for (i = 0; i<grdMatCons.GetGridControl().SelectedRows ; i++)
	        {
		        var row = grdMatCons.GetGridControl().SelectedRow(i);
        		
                if ( row > 0 )
                {
	                grdWI.AddRow();
            		
	                grdWI.SetGridText( grdWI.rows-1, G4_WI_CUTTING_INS_PK, txtWIMasterPK.text );
	                grdWI.SetGridText( grdWI.rows-1, G4_STYLE_PK,   grdMatCons.GetGridData( row, G2_Style_PK  ) );
	                grdWI.SetGridText( grdWI.rows-1, G4_Style_Code, grdMatCons.GetGridData( row, G2_Style_Code) );
	                
	                grdWI.SetGridText( grdWI.rows-1, G4_MAT_PK,   grdMatCons.GetGridData( row, G2_MAT_PK  ) );
	                grdWI.SetGridText( grdWI.rows-1, G4_Mat_Code, grdMatCons.GetGridData( row, G2_MAT_CODE) );
	                grdWI.SetGridText( grdWI.rows-1, G4_Spec1,    grdMatCons.GetGridData( row, G2_SPEC1   ) );
	                grdWI.SetGridText( grdWI.rows-1, G4_Spec2,    grdMatCons.GetGridData( row, G2_SPEC2   ) );
	                grdWI.SetGridText( grdWI.rows-1, G4_Spec3,    grdMatCons.GetGridData( row, G2_SPEC3   ) );
	                
	                grdWI.SetGridText( grdWI.rows-1, G4_PATTERN_GRP_PK, grdMatCons.GetGridData( row, G2_PATTERN_GRP_PK) );
	                grdWI.SetGridText( grdWI.rows-1, G4_Pattern_Group,  grdMatCons.GetGridData( row, G2_PATTERN_GROUP ) );
	                
	                grdWI.SetGridText( grdWI.rows-1, G4_Ord_Qty,       grdMatCons.GetGridData( row, G2_Cutting_Balance) );
	                grdWI.SetGridText( grdWI.rows-1, G4_Ord_Bal_Qty,   grdMatCons.GetGridData( row, G2_Cutting_Balance) );
	                
	                grdWI.SetGridText( grdWI.rows-1, G4_Mat_Unit_Qty,  grdMatCons.GetGridData( row, G2_Mat_Unit_Qty ) );
	                grdWI.SetGridText( grdWI.rows-1, G4_Mat_Gross_Qty, grdMatCons.GetGridData( row, G2_Mat_Qty      ) );
	                grdWI.SetGridText( grdWI.rows-1, G4_Actual_Qty,    grdMatCons.GetGridData( row, G2_Mat_Qty      ) );
	                
	                grdWI.SetGridText( grdWI.rows-1, G4_SO_PO_PK, txtSOPK.text );
	                grdWI.SetGridText( grdWI.rows-1, G4_SO_PO,    txtSOPO.text );
	                
	                grdWI.SetGridText( grdWI.rows-1, G4_Lot_ID, grdWI.rows-1 );
                }
	        }

        break;        
    }
}
//========================================================================

function OnSave(pos)
{
    switch (pos)
    {
        case 'grdMatCons':
            data_fpcw00100_2.Call();
        break;
        
        case 'grdWI':
            data_fpcw00100_3.Call();
        break;        
    }
} 

//========================================================================

function OnProcess(pos)
{
    switch (pos)
    {
        case 'Confirm':
            if ( txtWIMasterPK.text != '' ) 
            {
                pro_fpcw00100.Call();
            }    
            else
            {
                alert('Pls Select one WI Master.');
            }
        break;
        
        case 'Cancel':
            if ( txtWIMasterPK.text != '' ) 
            {
                pro_fpcw00100_1.Call();
            }    
            else
            {
                alert('Pls Select one WI Master.');
            }        
        break;  
        
        case 'WI_QTY':
             for ( var i=1; i<grdWI.rows; i++)
             {
                 var wi_qty =  Number(grdWI.GetGridData( i, G4_Lot_Qty) ) * ( Number( grdWI.GetGridData( i, G4_Size_1) ) + Number( grdWI.GetGridData( i, G4_Size_2) ) + Number( grdWI.GetGridData( i, G4_Size_3) ) + Number( grdWI.GetGridData( i, G4_Size_4) ) + Number( grdWI.GetGridData( i, G4_Size_5) ) + Number( grdWI.GetGridData( i, G4_Size_6) ) + Number( grdWI.GetGridData( i, G4_Size_7) ) + Number( grdWI.GetGridData( i, G4_Size_8) ) + Number( grdWI.GetGridData( i, G4_Size_9) ) + Number( grdWI.GetGridData( i, G4_Size_10) ) );
                 var balance_qty = Number(grdWI.GetGridData( i, G4_Ord_Qty) ) - Number(wi_qty); 

                 grdWI.SetGridText( i, G4_WI_Qty,      parseFloat(wi_qty+"").toFixed()      ); 
                 grdWI.SetGridText( i, G4_Ord_Bal_Qty, parseFloat(balance_qty+"").toFixed() );
             }      
        break;          
    }
}

//========================================================================
 function CheckInput()
 {   
    var  row, col 
        
    row = event.row ;
    col = event.col ;    
          
    if ( col == G4_Lot_Qty || col == G4_Size_1 || col == G4_Size_2 || col == G4_Size_3 || col == G4_Size_4 || col == G4_Size_5 || col == G4_Size_6 || col == G4_Size_7 || col == G4_Size_8 || col == G4_Size_9 || col == G4_Size_10 || col == G4_Mat_Unit_Qty || col == G4_Mat_Length || col == G4_Mat_Width || col == G4_Actual_Qty || col == G4_Mat_Gross_Qty )
    {      
        var dQuantiy
        
        dQuantiy =  grdWI.GetGridData(row,col)
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                if ( col == G4_Lot_Qty || col == G4_Size_1 || col == G4_Size_2 || col == G4_Size_3 || col == G4_Size_4 || col == G4_Size_5 || col == G4_Size_6 || col == G4_Size_7 || col == G4_Size_8 || col == G4_Size_9 || col == G4_Size_10 )
                {
                    grdWI.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(0));
                }
                else if ( col == G4_Mat_Length || col == G4_Mat_Unit_Qty || col == G4_Mat_Width || col == G4_Actual_Qty )
                {
                    grdWI.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(2));
                }    
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdWI.SetGridText(row,col,"")
            }
        }
        else
        {
            grdWI.SetGridText(row,col,"")
        }
        
        //---------------------------------------------
        if ( col == G4_Mat_Length || col == G4_Lot_Qty || col == G4_Size_1 || col == G4_Size_2 || col == G4_Size_3 || col == G4_Size_4 || col == G4_Size_5 || col == G4_Size_6 || col == G4_Size_7 || col == G4_Size_8 || col == G4_Size_9 || col == G4_Size_10 ) 
        {       
             var wi_qty =  Number(grdWI.GetGridData( row, G4_Lot_Qty) ) * ( Number( grdWI.GetGridData( row, G4_Size_1) ) + Number( grdWI.GetGridData( row, G4_Size_2) ) + Number( grdWI.GetGridData( row, G4_Size_3) ) + Number( grdWI.GetGridData( row, G4_Size_4) ) + Number( grdWI.GetGridData( row, G4_Size_5) ) + Number( grdWI.GetGridData( row, G4_Size_6) ) + Number( grdWI.GetGridData( row, G4_Size_7) ) + Number( grdWI.GetGridData( row, G4_Size_8) ) + Number( grdWI.GetGridData( row, G4_Size_9) ) + Number( grdWI.GetGridData( row, G4_Size_10) ) );
             var balance_qty = Number(grdWI.GetGridData( row, G4_Ord_Qty) ) - Number(wi_qty); 

             grdWI.SetGridText( row, G4_WI_Qty,      parseFloat(wi_qty+"").toFixed()      ); 
             grdWI.SetGridText( row, G4_Ord_Bal_Qty, parseFloat(balance_qty+"").toFixed() );
             
             var mat_unit_qty  = Number(grdWI.GetGridData( row, G4_Mat_Unit_Qty));
             var mat_gross_qty = Number(wi_qty) * Number(mat_unit_qty);
             
             grdWI.SetGridText( row, G4_Mat_Gross_Qty, parseFloat(mat_gross_qty+"").toFixed(2)); 
             
             var mat_actual_qty =  Number(grdWI.GetGridData( row, G4_Mat_Length) ) * Number( grdWI.GetGridData( row, G4_Lot_Qty) ) ;
             
             grdWI.SetGridText( row, G4_Actual_Qty, parseFloat(mat_actual_qty+"").toFixed(2));      
                              
        } 
        else if ( col == G4_Mat_Unit_Qty ) 
        {
             var mat_unit_qty  = Number(grdWI.GetGridData( row, G4_Mat_Unit_Qty));
             var mat_gross_qty = Number(grdWI.GetGridData( row, G4_WI_Qty)) * Number(mat_unit_qty);
             
             grdWI.SetGridText( row, G4_Mat_Gross_Qty, parseFloat(mat_gross_qty+"").toFixed(2));                          
        }          
    } 
 }
//========================================================================

function OnPopUp(pos)
{
      switch (pos)         
      {		        
            case 'WIMaster' :
                 row_num = event.row;
                 col_num = event.col;
                 
                 if ( col_num == G3_Line_ID || col_num == G3_Line_Name )
                 {
                     var path = System.RootURL + "/form/fp/ab/fpab00200.aspx";
	                 var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
    	             
	                 if ( object != null )
	                 {
	                       grdWIMaster.SetGridText( row_num, G3_TPR_LINE_PK, object[0] );
	                       grdWIMaster.SetGridText( row_num, G3_Line_ID,     object[2] );
	                       grdWIMaster.SetGridText( row_num, G3_Line_Name,   object[3] ); 
	                 }
	             }
                 else if ( col_num == G3_Emp_Name )
                 {
                     var event_col = event.col ;
                     var event_row = event.row ;
                      
                     var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
	                 var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	                 
	                 if ( obj != null )
	                 {
                         grdWIMaster.SetGridText(event_row, G3_CHARGER_PK, obj[0] ); //emp_pk
                         grdWIMaster.SetGridText(event_row, G3_Emp_Name,   obj[2] ); //emp_id
                     }	                
                 }	                 
            break;
            
            case 'MatChecking' :

                 var path = System.RootURL + "/form/fp/ab/fpab00170.aspx";
                 var object = System.OpenModal( path ,950 ,650 ,'resizable:yes;status:yes');
	             
                 if ( object != null )
                 {
                 }
   
            break;
            
      }      
}

//========================================================================

function OnAddLot()
{
    if ( grdWI.row > 0 && Number(grdWI.GetGridData( grdWI.row, G4_Ord_Bal_Qty)) > 0 )
    {
        grdWI.AddRow();
        
        grdWI.SetGridText( grdWI.rows-1, G4_WI_CUTTING_INS_PK, txtWIMasterPK.text );
        
        grdWI.SetGridText( grdWI.rows-1, G4_STYLE_PK,   grdWI.GetGridData( grdWI.row, G4_STYLE_PK  ));
        grdWI.SetGridText( grdWI.rows-1, G4_Style_Code, grdWI.GetGridData( grdWI.row, G4_Style_Code));
        
        grdWI.SetGridText( grdWI.rows-1, G4_MAT_PK,   grdWI.GetGridData( grdWI.row, G4_MAT_PK  ));
        grdWI.SetGridText( grdWI.rows-1, G4_Mat_Code, grdWI.GetGridData( grdWI.row, G4_Mat_Code));
        grdWI.SetGridText( grdWI.rows-1, G4_Spec1,    grdWI.GetGridData( grdWI.row, G4_Spec1   ));
        grdWI.SetGridText( grdWI.rows-1, G4_Spec2,    grdWI.GetGridData( grdWI.row, G4_Spec2   ));
        grdWI.SetGridText( grdWI.rows-1, G4_Spec3,    grdWI.GetGridData( grdWI.row, G4_Spec3   ));
        
        grdWI.SetGridText( grdWI.rows-1, G4_PATTERN_GRP_PK, grdWI.GetGridData( grdWI.row, G4_PATTERN_GRP_PK));
        grdWI.SetGridText( grdWI.rows-1, G4_Pattern_Group,  grdWI.GetGridData( grdWI.row, G4_Pattern_Group ));
        
        grdWI.SetGridText( grdWI.rows-1, G4_Ord_Qty,     grdWI.GetGridData( grdWI.row, G4_Ord_Bal_Qty ));
        grdWI.SetGridText( grdWI.rows-1, G4_Ord_Bal_Qty, grdWI.GetGridData( grdWI.row, G4_Ord_Bal_Qty ));
        
        grdWI.SetGridText( grdWI.rows-1, G4_Mat_Unit_Qty,  grdWI.GetGridData( grdWI.row, G4_Mat_Unit_Qty ));
        
        grdWI.SetGridText( grdWI.rows-1, G4_SO_PO_PK, grdWI.GetGridData( grdWI.row, G4_SO_PO_PK ));
        grdWI.SetGridText( grdWI.rows-1, G4_SO_PO,    grdWI.GetGridData( grdWI.row, G4_SO_PO    ));
        
        var sum_qty = Number( grdWI.GetGridData( grdWI.row, G4_Mat_Unit_Qty )) * Number( grdWI.GetGridData( grdWI.row, G4_Ord_Bal_Qty )) ;

        grdWI.SetGridText( grdWI.rows-1, G4_Mat_Gross_Qty, parseFloat(sum_qty+"").toFixed(2) );
        grdWI.SetGridText( grdWI.rows-1, G4_Actual_Qty,    parseFloat(sum_qty+"").toFixed(2) );
        
        grdWI.SetGridText( grdWI.rows-1, G4_Lot_ID, grdWI.rows-1 );
        
        grdWI.SetCellBgColor( grdWI.rows-1, G4_Style_Code, grdWI.rows-1, grdWI.cols - 2, 0xCCFFFF );     
    }
    else
    {
        alert('Add new Lot for balance qty > 0 only.');
    }
}
//========================================================================
function OnDelete(pos)
{
    switch (pos)
    {
        case 'grdWI' :
            if ( grdWI.GetGridData( grdWI.row, G4_PK) == '' )
            {
                grdWI.RemoveRow();
            }
			else
			{
			    grdWI.DeleteRow();
			}					
        break;
        
        case 'grdWIMaster':
            if ( grdWIMaster.GetGridData( grdWIMaster.row, G3_PK) == '' )
            {
                grdWIMaster.RemoveRow();
            }
			else
			{
			    grdWIMaster.DeleteRow();
			}					        
        break;
    }
}
//====================================================================
function OnUnDelete(pos)
{
    switch (pos)
    {
        case 'grdWI' :
            grdWI.UnDeleteRow();					
        break;
        
        case 'grdWIMaster':
            grdWIMaster.UnDeleteRow();
        break;
    }
}
//====================================================================
 function OnChangeGrid()
 { 
    var strRad = radSearchGrid.GetData();
	
	switch (strRad)
	{
		case '1':  
            document.all("grdMatCons").style.display = "";
            document.all("grdReq").style.display     = "none";
            document.all("grdCut").style.display     = "none";
			//--------------------------
        break;
        case '2':
            document.all("grdMatCons").style.display = "none";
            document.all("grdReq").style.display     = ""; 
            document.all("grdCut").style.display     = "";   
			//--------------------------
        break; 
    }
}
//========================================================================

function OnReport(pos)
{
    switch(pos)
    {
        case 'WI':
            if ( Number(txtWIMasterPK.text) > 0 )
            {
                var  url= System.RootURL + "/reports/fp/cw/rpt_fpcw00100.aspx?workins_pk=" + txtWIMasterPK.text;
	            System.OpenTargetPage( url, "_blank" );
            }
        break;
    }
}

//==========================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpcw00100" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fpcw00100" > 
                <input>
                    <input bind="txtWIMasterPK" />  
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fpcw00100_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fpcw00100_1" > 
                <input>
                    <input bind="txtWIMasterPK" />  
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpcw00100" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpcw00100" > 
                <input bind="grdSO" >     
                    <input bind="dtFrom" />             
				    <input bind="dtTo" />
				    <input bind="txtSOPOStyle" />
				    <input bind="chkBalance" />
                </input>
                <output bind="grdSO" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpcw00100_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpcw00100_1" > 
                <input bind="grdMatCons" >     
                    <input bind="txtSOPK" />          
				</input>
                <output bind="grdMatCons" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpcw00100_2" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_fpcw00100_2"  procedure="<%=l_user%>lg_upd_fpcw00100_2" > 
                <input bind="grdWIMaster" >     
                    <input bind="dtFrom1" /> 
                    <input bind="dtTo1" />         
				</input>
                <output bind="grdWIMaster" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpcw00100_3" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33" function="<%=l_user%>lg_sel_fpcw00100_3"  procedure="<%=l_user%>lg_upd_fpcw00100_3" > 
                <input bind="grdWI" >     
                    <input bind="txtWIMasterPK" />          
				</input>
                <output bind="grdWI" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpcw00100_5" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpcw00100_5" > 
                <input bind="grdReq" >     
                    <input bind="txtSOPK" />          
				</input>
                <output bind="grdReq" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <gw:data id="data_fpcw00100_6" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpcw00100_6" > 
                <input bind="grdCut" >     
                    <input bind="txtSOPK" />          
				</input>
                <output bind="grdCut" />
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr>
            <td style="width: 48%" id="t-left">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Date</td>
                        <td style="width: 20%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            PO/SO/Style
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtSOPOStyle" maxlen="100" styles='width:100%' onenterkey="OnSearch('grdSO')" />
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="center">
                            Balance
                            <gw:checkbox id="chkBalance" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdSO')"></gw:checkbox>
                        </td>
                        <td style="width: 4%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('grdSO')" />
                        </td>
                    </tr>
                    <tr style="height: 44%">
                        <td colspan="7">
                            <gw:grid id='grdSO' header='Chk|_PK|SO No|PO No|_TCO_STITEM_PK|Item Code|Item Name|Ord Qty|Cutting WI|Cutting Bal'
                                format='3|0|0|0|0|0|0|1|1|1' aligns='0|0|0|0|0|0|0|3|3|3' defaults='|||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0' widths='600|0|1500|1500|0|1500|3500|1200|1200|1200'
                                sorting='T' styles='width:100%; height:100%' oncellclick="OnSearch('MatCons')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="6">
                            <gw:radio id="radSearchGrid" value="1" styles="width:100%" onchange="OnChangeGrid()"> 
                                <span value="1">Cons</span> 
                                <span value="2">Balance</span> 
                            </gw:radio>
                        </td>
                        <td>
                            <gw:imgbtn img="search" alt="Search" id="btnSearch1" onclick="OnSearch('MatCons')" />
                        </td>
                    </tr>
                    <tr style="height: 54%">
                        <td colspan="7">
                            <gw:grid id='grdMatCons' header='_Style_PK|Style Code|_MAT_PK|Mat Code|Mat Name|Spec1|_Spec2|_Spec3|_TPR_PATTERN_GROUP_PK|Group|Balance Qty|Mat Qty|Unit Qty'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|1|3|3|3' defaults='||||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' widths='1000|1500|1000|1500|3000|1000|1000|1000|1000|1200|1200|1200|1200'
                                sorting='T' styles='width:100%; height:100%' />
                            <gw:grid id='grdReq' header='Group|Mat|S|M|L|XL|2XL|3XL|4XL|_8|_9|_10' format='0|0|0|0|0|0|0|0|0|0|0|0'
                                aligns='0|0|1|1|1|1|1|1|1|1|1|1' defaults='|||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='1500|1500|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T'
                                styles='width:100%; height:50%' />
                            <gw:grid id='grdCut' header='Group|Mat|S|M|L|XL|2XL|3XL|4XL|_8|_9|_10' format='0|0|0|0|0|0|0|0|0|0|0|0'
                                aligns='0|0|1|1|1|1|1|1|1|1|1|1' defaults='|||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0'
                                widths='1500|1500|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000' sorting='T'
                                styles='width:100%; height:50%' />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 2%; white-space: nowrap" align="center">
                <img status="expand" id="imgArrow1" src="../../../system/images/button/previous.gif"
                    style="cursor: hand; position: center" onclick="OnToggle('1')" />
                <img status="expand" id="imgArrow2" src="../../../system/images/button/next.gif"
                    style="cursor: hand; position: center" onclick="OnToggle('2')" /></td>
            <td style="width: 48%" id="t-right">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 15%; white-space: nowrap" align="left">
                            <gw:datebox id="dtFrom1" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtTo1" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="Search" alt="Search" id="btnSearch1" onclick="OnSearch('grdWIMaster')" />
                        </td>
                        <td style="width: 72%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:icon id="idBtnConfirm" img="2" text="Confirm" alt="Confirm" styles='width:100%'
                                onclick="OnProcess('Confirm')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:icon id="idBtnCancel" img="2" text="Cancel" alt="Cancel" styles='width:100%'
                                onclick="OnProcess('Cancel')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="excel" alt="Export WI" id="btnExportWI" onclick="OnReport('WI')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="new" alt="Add New" id="btnAddNew1" onclick="OnAddNew('grdWIMaster')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDelete1" onclick="OnDelete('grdWIMaster')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="udelete" alt="Un Delete" id="btnUnDelete1" onclick="OnUnDelete('grdWIMaster')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave('grdMatCons')" />
                        </td>
                    </tr>
                    <tr style="height: 19%">
                        <td colspan="11">
                            <gw:grid id='grdWIMaster' header='_PK|WI No|Date|_ARRAY_SO_PK|_P/O No|_TPR_LINE_PK|Line ID|Line Name|_CHARGER_PK|Emp Name|Status|Description'
                                format='0|0|4|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|0|0|0|0|0' defaults='|||||||||||'
                                editcol='0|1|1|0|0|0|0|0|0|0|0|1' widths='1000|1200|1200|1000|1000|1500|1000|1500|1000|1500|1000|1000'
                                sorting='T' styles='width:100%; height:100%' onclick="OnSearch('grdWI')" oncelldblclick="OnPopUp('WIMaster')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="11">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 1%">
                                        <img id="imgArrow" src="../../../system/images/button/icons_button/next.gif" style="cursor: hand"
                                            onclick="OnAddNew('grdWI')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="idBtnMatChecking" img="2" text="Mat Checking" alt="Material Checking"
                                            styles='width:100%' onclick="OnPopUp('MatChecking')" />
                                    </td>
                                    <td style="width: 94%" align="right">
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="idBtnAddLot" img="2" text="Add Lot" alt="Add New Lot" styles='width:100%'
                                            onclick="OnAddLot()" />
                                    </td>
                                     
                                    
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="delete" alt="Delete" id="btnDelete2" onclick="OnDelete('grdWI')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="udelete" alt="Un Delete" id="btnUnDelete2" onclick="OnUnDelete('grdWI')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="idBtnCal" img="2" text="*" alt="Calculate WI" styles='width:100%'
                                            onclick="OnProcess('WI_QTY')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="save" alt="Save" id="btnSave2" onclick="OnSave('grdWI')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 40%">
                        <td colspan="11">
                            <gw:grid id='grdWI' header='_WI_CUTTING_INS_PK|_STYLE_PK|Style Code|_MAT_PK|Mat Code|Spec1|_Spec2|_Spec3|_TPR_PATTERN_GROUP_PK|Group|Lot ID|Cut Req|Balance|Lot Qty|S|M|L|XL|2XL|3XL|4XL|_Size 8|_Size 9|_Size 10|WI Qty|Unit Qty|Gross Qty|_Mat Length|_Mat Width|_Actual Qty|Description|_PK|_SO_PO_PK|P/O No'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                aligns='0|0|0|0|0|0|0|0|0|1|1|3|3|3|1|1|1|1|1|1|1|1|1|1|3|3|3|3|3|3|0|0|0|0'
                                defaults='|||||||||||||||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|1|0|0|1|1|1|1|1|1|1|1|1|1|1|0|1|1|1|1|1|1|1|0|0'
                                widths='0|0|1500|0|1500|1000|1000|1000|0|1500|1200|1200|1200|1200|800|800|800|800|800|800|800|800|800|800|1200|1200|1200|1200|1200|1200|1200|0|0|0'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------------------------->
<gw:textbox id="txtSOPK" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtSOPO" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtWIMasterPK" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
<!------------------------------------------------------------------------------------------------->
</html>
