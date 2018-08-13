<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>POP UP SAVE ORDER DETAIL</title>
</head>

<script> 
//--Spec Group List
var     G1_SEQ              = 0,
        G1_TCO_SPECGRP_PK   = 1,
        G1_SPECGRP_NM       = 2;
        
//--Spec Size List 
var     G2_SPEC_SIZE_PK     = 0,
        G2_Size_ID          = 1,
        G2_Size_NM          = 2;
//--Grid Save
var     G3_Spec1_PK    = 0,
        G3_Spec2_PK    = 1,
        G3_Spec3_PK    = 2,
        G3_Spec4_PK    = 3,
        G3_Spec5_PK    = 4,
        G3_Spec6_PK    = 5,
        G3_Spec7_PK    = 6,
        G3_Spec8_PK    = 7,
        G3_Spec9_PK    = 8,
        G3_Spec10_PK   = 9,
        G3_Spec11_PK   = 10,
        G3_ORD_QTY     = 11,
        G3_TCO_STITEM_PK = 12,
        G3_TSA_SALEORDER_PK = 13; 
              
//-- Detail 
var     G4_No           = 0,        
        G4_Spec1_pk     = 1,
        G4_Spec1        = 2,        
        G4_Spec2_pk     = 3,
        G4_Spec2        = 4,              
        G4_Spec3_pk     = 5,
        G4_Spec3        = 6,     
        G4_Spec4_pk     = 7,
        G4_Spec4        = 8,      
        G4_Spec5_pk     = 9,
        G4_Spec5        = 10,      
        G4_Spec6_pk     = 11,
        G4_Spec6        = 12,       
        G4_Spec7_pk     = 13,
        G4_Spec7        = 14,       
        G4_Spec8_pk     = 15,
        G4_Spec8        = 16,       
        G4_Spec9_pk     = 17,
        G4_Spec9        = 18,       
        G4_Spec10_pk    = 19,
        G4_Spec10       = 20,       
        G4_SizeSpec1_PK = 21,
        G4_SizeSpec1    = 22,       
        G4_SizeSpec2_PK = 23,
        G4_SizeSpec2    = 24,       
        G4_SizeSpec3_PK = 25,
        G4_SizeSpec3    = 26,       
        G4_SizeSpec4_PK = 27,
        G4_SizeSpec4    = 28,       
        G4_SizeSpec5_PK = 29,
        G4_SizeSpec5    = 30,       
        G4_SizeSpec6_PK = 31,
        G4_SizeSpec6    = 32,       
        G4_SizeSpec7_PK = 33,
        G4_SizeSpec7    = 34,       
        G4_SizeSpec8_PK = 35,
        G4_SizeSpec8    = 36,       
        G4_SizeSpec9_PK = 37,
        G4_SizeSpec9    = 38,      
        G4_SizeSpec10_PK= 39,
        G4_SizeSpec10   = 40;
        
//--Item List       
var     G5_SPECGRP1_PK  = 0,
        G5_SPEC1_PK     = 1,
        G5_SPEC1_ID     = 2,
        G5_SPECGRP2_PK  = 3,
        G5_SPEC2_PK     = 4,
        G5_SPEC2_ID     = 5,
        G5_SPECGRP3_PK  = 6,
        G5_SPEC3_PK     = 7,
        G5_SPEC3_ID     = 8,
        G5_SPECGRP4_PK  = 9,
        G5_SPEC4_PK     = 10,
        G5_SPEC4_ID     = 11,
        G5_SPECGRP5_PK  = 12,
        G5_SPEC5_PK     = 13,
        G5_SPEC5_ID     = 14,
        G5_SPECGRP6_PK  = 15,
        G5_SPEC6_PK     = 16,
        G5_SPEC6_ID     = 17,
        G5_SPECGRP7_PK  = 18,
        G5_SPEC7_PK     = 19,
        G5_SPEC7_ID     = 20,
        G5_SPECGRP8_PK  = 21,
        G5_SPEC8_PK     = 22,
        G5_SPEC8_ID     = 23,
        G5_SPECGRP9_PK  = 24,
        G5_SPEC9_PK     = 25,
        G5_SPEC9_ID     = 26,
        G5_SPECGRP10_PK = 27,
        G5_SPEC10_PK    = 28,
        G5_SPEC10_ID    = 29,
        G5_ORD_QTY      = 30; 
        
var     specgrp_list  = new Array();
var     specitem_list = new Array();            
 //==================================================================
 function BodyInit()
 {
    System.Translate(document); 
        //----------------------
        txtSONo.SetEnable(false);
        txtSTItemCode.SetEnable(false);
        txtSTItemName.SetEnable(false);
        //----------------------
        var p_tsa_saleorder_pk = "<%=Request.querystring("tsa_saleorder_pk")%>"; 
        var p_pop_up           = "<%=Request.querystring("pop_up")%>";               
        
        if ( p_pop_up == 'Y' )
        {
            if ( Number(p_tsa_saleorder_pk) > 0 )
            {            
                txtOrdMasterPK.text = Number(p_tsa_saleorder_pk);
                data_dsbs00016.Call("SELECT");
            }
            else
            {
                alert('Pls select Saved Order first.');
            }
        }
        else
        {
            trsearch_condition = document.all("search_condition");
            trsearch_condition.style.display = "none";
            
            txtOrdMasterPK.text = Number(p_tsa_saleorder_pk);
            data_dsbs00016.Call("SELECT");
        }    
        //----------------------        
 } 

 //==================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
        case 'Refresh' :         
            //--------------------
            data_dsbs00016_3.Call("SELECT");                    
        break;                        
      }  
 }

 //==================================================================
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {
            case "data_dsbs00016" :
                if ( txtSizeSpecGroupPK.text == '' )
                {
                    alert("PLS SELECT SIZE SPEC FOR THIS GROUP.");
                }
                else
                {
                    data_dsbs00016_1.Call("SELECT");
                } 
            break;
            
            case "data_dsbs00016_1" :
                //--------------------        
                SetGridSpecGroup();
                //--------------------
                data_dsbs00016_2.Call("SELECT");
            break;
            
            case "data_dsbs00016_2" :
                SetGridSize();
                //--------------------
                data_dsbs00016_3.Call("SELECT");
            break ;
            
            case "data_dsbs00016_3" :
               //--------------------------------
                SetGridQty(); 
                //--------------------------------
                grdDetail.GetGridControl().AutoSize( 0, G4_Spec10, false, 0 );                           
            break; 
            
            case "data_dsbs00016_4" :
                //--------------------
                data_dsbs00016_3.Call("SELECT");            
            break;         
      }  
 }

 //==================================================================

function SetGridSpecGroup()
{
    for ( var i = 1; i < grdSpecGrpList.rows ; i++ )
    {
        if ( grdSpecGrpList.GetGridData( i, G1_SEQ ) == '1' ) 
        {
            grdDetail.GetGridControl().ColHidden(G4_Spec1) = false ;
            grdDetail.GetGridControl().Cell(0, 0, G4_Spec1, 0, G4_Spec1) = grdSpecGrpList.GetGridData( i, G1_SPECGRP_NM );
            
            specgrp_list[1] = grdSpecGrpList.GetGridData( i, G1_TCO_SPECGRP_PK ) ;
        }
        else if ( grdSpecGrpList.GetGridData( i, G1_SEQ ) == '2' ) 
        {
            grdDetail.GetGridControl().ColHidden(G4_Spec2) = false ;
            grdDetail.GetGridControl().Cell(0, 0, G4_Spec2, 0, G4_Spec2) = grdSpecGrpList.GetGridData( i, G1_SPECGRP_NM );        
            
            specgrp_list[2] = grdSpecGrpList.GetGridData( i, G1_TCO_SPECGRP_PK ) ;            
        }
        else if ( grdSpecGrpList.GetGridData( i, G1_SEQ ) == '3' ) 
        {
            grdDetail.GetGridControl().ColHidden(G4_Spec3) = false ;
            grdDetail.GetGridControl().Cell(0, 0, G4_Spec3, 0, G4_Spec3) = grdSpecGrpList.GetGridData( i, G1_SPECGRP_NM );        
            
            specgrp_list[3] = grdSpecGrpList.GetGridData( i, G1_TCO_SPECGRP_PK ) ;            
        }
        else if ( grdSpecGrpList.GetGridData( i, G1_SEQ ) == '4' ) 
        {
            grdDetail.GetGridControl().ColHidden(G4_Spec4) = false ;
            grdDetail.GetGridControl().Cell(0, 0, G4_Spec4, 0, G4_Spec4) = grdSpecGrpList.GetGridData( i, G1_SPECGRP_NM );        
            
            specgrp_list[4] = grdSpecGrpList.GetGridData( i, G1_TCO_SPECGRP_PK ) ;            
        }
        else if ( grdSpecGrpList.GetGridData( i, G1_SEQ ) == '5' ) 
        {
            grdDetail.GetGridControl().ColHidden(G4_Spec5) = false ;
            grdDetail.GetGridControl().Cell(0, 0, G4_Spec5, 0, G4_Spec5) = grdSpecGrpList.GetGridData( i, G1_SPECGRP_NM );        
            
            specgrp_list[5] = grdSpecGrpList.GetGridData( i, G1_TCO_SPECGRP_PK ) ;            
        }
        else if ( grdSpecGrpList.GetGridData( i, G1_SEQ ) == '6' ) 
        {
            grdDetail.GetGridControl().ColHidden(G4_Spec6) = false ;
            grdDetail.GetGridControl().Cell(0, 0, G4_Spec6, 0, G4_Spec6) = grdSpecGrpList.GetGridData( i, G1_SPECGRP_NM );       
            
            specgrp_list[6] = grdSpecGrpList.GetGridData( i, G1_TCO_SPECGRP_PK ) ;            
        }
        else if ( grdSpecGrpList.GetGridData( i, G1_SEQ ) == '7' ) 
        {
            grdDetail.GetGridControl().ColHidden(G4_Spec7) = false ;
            grdDetail.GetGridControl().Cell(0, 0, G4_Spec7, 0, G4_Spec7) = grdSpecGrpList.GetGridData( i, G1_SPECGRP_NM );        
            
            specgrp_list[7] = grdSpecGrpList.GetGridData( i, G1_TCO_SPECGRP_PK ) ;            
        }
        else if ( grdSpecGrpList.GetGridData( i, G1_SEQ ) == '8' ) 
        {
            grdDetail.GetGridControl().ColHidden(G4_Spec8) = false ;
            grdDetail.GetGridControl().Cell(0, 0, G4_Spec8, 0, G4_Spec8) = grdSpecGrpList.GetGridData( i, G1_SPECGRP_NM );        
            
            specgrp_list[8] = grdSpecGrpList.GetGridData( i, G1_TCO_SPECGRP_PK ) ;            
        }
        else if ( grdSpecGrpList.GetGridData( i, G1_SEQ ) == '9' ) 
        {
            grdDetail.GetGridControl().ColHidden(G4_Spec9) = false ;
            grdDetail.GetGridControl().Cell(0, 0, G4_Spec9, 0, G4_Spec9) = grdSpecGrpList.GetGridData( i, G1_SPECGRP_NM );        
            
            specgrp_list[9] = grdSpecGrpList.GetGridData( i, G1_TCO_SPECGRP_PK ) ;            
        }
        else if ( grdSpecGrpList.GetGridData( i, G1_SEQ ) == '10' ) 
        {
            grdDetail.GetGridControl().ColHidden(G4_Spec10) = false ;
            grdDetail.GetGridControl().Cell(0, 0, G4_Spec10, 0, G4_Spec10) = grdSpecGrpList.GetGridData( i, G1_SPECGRP_NM );        
            
            specgrp_list[10] = grdSpecGrpList.GetGridData( i, G1_TCO_SPECGRP_PK ) ;            
        }                                                                
    }   
}
//==================================================================

function SetGridSize()
{
    for ( var i = 1; i < grdSizeList.rows ; i++ )
    {
        grdDetail.GetGridControl().ColHidden( G4_SizeSpec1 + 2*i - 2) = false ;
        grdDetail.GetGridControl().Cell(7, 0, G4_SizeSpec1 + 2*i - 2, 0, G4_SizeSpec1 + 2*i - 2) = 0x3300cc;
        grdDetail.GetGridControl().Cell(0, 0, G4_SizeSpec1 + 2*i - 2, 0, G4_SizeSpec1 + 2*i - 2) = grdSizeList.GetGridData( i, G2_Size_NM );                                                                   
    }   
}

//==================================================================

function SetGridQty()
{
    grdDetail.ClearData();
    
    var chk_item_row = 0 ;
    var new_row      = 0 ;
    var size_spec_pk ; 
        
    for ( var i = 1; i < grdItem.rows; i++ )
    {
        new_row      = 0 ;
        size_spec_pk = 0 ;

        if ( grdItem.GetGridData( i, G5_SPECGRP1_PK) == specgrp_list[1] && grdItem.GetGridData( i, G5_SPECGRP1_PK) != txtSizeSpecGroupPK.text && grdItem.GetGridData( i, G5_SPECGRP1_PK) != '' )        
        {
            var j = 0;
            while ( j < grdDetail.rows-1 )
            {
                j++;
                if ( grdDetail.GetGridData( j, G4_Spec1_pk) == grdItem.GetGridData( i, G5_SPEC1_PK) )
                {
                    chk_item_row = j ;
                }
            }
            
            if ( chk_item_row == 0 )
            {
                grdDetail.AddRow();
                grdDetail.SetGridText( grdDetail.rows-1, G4_No , grdDetail.rows-1);
                
                if ( grdItem.GetGridData( i, G5_SPECGRP1_PK) != txtSizeSpecGroupPK.text )
                {
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec1_pk, grdItem.GetGridData( i, G5_SPEC1_PK) );
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec1,    grdItem.GetGridData( i, G5_SPEC1_ID) );
                }
                else
                {
                    size_spec_pk = grdItem.GetGridData( i, G5_SPEC1_PK);
                }
                if ( grdItem.GetGridData( i, G5_SPECGRP2_PK) != txtSizeSpecGroupPK.text )
                {
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec2_pk, grdItem.GetGridData( i, G5_SPEC2_PK) );
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec2,    grdItem.GetGridData( i, G5_SPEC2_ID) );
                } 
                else
                {
                    size_spec_pk = grdItem.GetGridData( i, G5_SPEC2_PK);
                }                               
                if ( grdItem.GetGridData( i, G5_SPECGRP3_PK) != txtSizeSpecGroupPK.text )
                {                
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec3_pk, grdItem.GetGridData( i, G5_SPEC3_PK) );
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec3,    grdItem.GetGridData( i, G5_SPEC3_ID) );
                } 
                else
                {
                    size_spec_pk = grdItem.GetGridData( i, G5_SPEC3_PK);
                }                               
                if ( grdItem.GetGridData( i, G5_SPECGRP4_PK) != txtSizeSpecGroupPK.text )
                {                
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec4_pk, grdItem.GetGridData( i, G5_SPEC4_PK) );
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec4,    grdItem.GetGridData( i, G5_SPEC4_ID) );
                }
                else
                {
                    size_spec_pk = grdItem.GetGridData( i, G5_SPEC4_PK);
                }                                
                if ( grdItem.GetGridData( i, G5_SPECGRP5_PK) != txtSizeSpecGroupPK.text )
                {                
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec5_pk, grdItem.GetGridData( i, G5_SPEC5_PK) );
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec5,    grdItem.GetGridData( i, G5_SPEC5_ID) );
                }
                else
                {
                    size_spec_pk = grdItem.GetGridData( i, G5_SPEC5_PK);
                }                                
                if ( grdItem.GetGridData( i, G5_SPECGRP6_PK) != txtSizeSpecGroupPK.text )
                {                
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec6_pk, grdItem.GetGridData( i, G5_SPEC6_PK) );
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec6,    grdItem.GetGridData( i, G5_SPEC6_ID) );
                }
                else
                {
                    size_spec_pk = grdItem.GetGridData( i, G5_SPEC6_PK);
                }                                
                if ( grdItem.GetGridData( i, G5_SPECGRP7_PK) != txtSizeSpecGroupPK.text )
                {                
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec7_pk, grdItem.GetGridData( i, G5_SPEC7_PK) );
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec7,    grdItem.GetGridData( i, G5_SPEC7_ID) );
                } 
                else
                {
                    size_spec_pk = grdItem.GetGridData( i, G5_SPEC7_PK);
                }                               
                if ( grdItem.GetGridData( i, G5_SPECGRP8_PK) != txtSizeSpecGroupPK.text )
                {                
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec8_pk, grdItem.GetGridData( i, G5_SPEC8_PK) );
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec8,    grdItem.GetGridData( i, G5_SPEC8_ID) );
                }
                else
                {
                    size_spec_pk = grdItem.GetGridData( i, G5_SPEC8_PK);
                }                                
                if ( grdItem.GetGridData( i, G5_SPECGRP9_PK) != txtSizeSpecGroupPK.text )
                {                
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec9_pk, grdItem.GetGridData( i, G5_SPEC9_PK) );
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec9,    grdItem.GetGridData( i, G5_SPEC9_ID) );
                }
                else
                {
                    size_spec_pk = grdItem.GetGridData( i, G5_SPEC9_PK);
                }                                
                if ( grdItem.GetGridData( i, G5_SPECGRP10_PK) != txtSizeSpecGroupPK.text )
                {                
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec10_pk, grdItem.GetGridData( i, G5_SPEC10_PK) );
                    grdDetail.SetGridText( grdDetail.rows-1, G4_Spec10,    grdItem.GetGridData( i, G5_SPEC10_ID) );
                }
                else
                {
                    size_spec_pk = grdItem.GetGridData( i, G5_SPEC10_PK);
                }                
                new_row = grdDetail.rows-1;
                chk_item_row = new_row ;
            }
        }
        else if ( grdItem.GetGridData( i, G5_SPECGRP1_PK) != '' )
        {
            size_spec_pk = grdItem.GetGridData( i, G5_SPEC1_PK);
        }         
        //---------Spec 2
        if ( grdItem.GetGridData( i, G5_SPECGRP2_PK) == specgrp_list[2] && grdItem.GetGridData( i, G5_SPECGRP2_PK) != txtSizeSpecGroupPK.text && grdItem.GetGridData( i, G5_SPECGRP2_PK) != '' )        
        {
            if ( chk_item_row != 0 && new_row == 0 )
            {
                if ( grdDetail.GetGridData( chk_item_row, G4_Spec2_pk) != grdItem.GetGridData( i, G5_SPEC2_PK) )
                {
                    var j = chk_item_row;
                    chk_item_row = 0 ;
                    
                    while ( j < grdDetail.rows-1 )
                    {
                        j++;
                        if ( grdDetail.GetGridData( j, G4_Spec1_pk) == grdItem.GetGridData( i, G5_SPEC1_PK) && grdDetail.GetGridData( j, G4_Spec2_pk) == grdItem.GetGridData( i, G5_SPEC2_PK) )
                        {
                            chk_item_row = j ;
                        }
                    }
            
                    if ( chk_item_row == 0 )
                    {
                        grdDetail.AddRow();
                        grdDetail.SetGridText( grdDetail.rows-1, G4_No , grdDetail.rows-1);
                        
                        if ( grdItem.GetGridData( i, G5_SPECGRP1_PK) != txtSizeSpecGroupPK.text )
                        {
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec1_pk, grdItem.GetGridData( i, G5_SPEC1_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec1,    grdItem.GetGridData( i, G5_SPEC1_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC1_PK);
                        }
                        if ( grdItem.GetGridData( i, G5_SPECGRP2_PK) != txtSizeSpecGroupPK.text )
                        {
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec2_pk, grdItem.GetGridData( i, G5_SPEC2_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec2,    grdItem.GetGridData( i, G5_SPEC2_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC2_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP3_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec3_pk, grdItem.GetGridData( i, G5_SPEC3_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec3,    grdItem.GetGridData( i, G5_SPEC3_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC3_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP4_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec4_pk, grdItem.GetGridData( i, G5_SPEC4_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec4,    grdItem.GetGridData( i, G5_SPEC4_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC4_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP5_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec5_pk, grdItem.GetGridData( i, G5_SPEC5_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec5,    grdItem.GetGridData( i, G5_SPEC5_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC5_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP6_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec6_pk, grdItem.GetGridData( i, G5_SPEC6_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec6,    grdItem.GetGridData( i, G5_SPEC6_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC6_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP7_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec7_pk, grdItem.GetGridData( i, G5_SPEC7_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec7,    grdItem.GetGridData( i, G5_SPEC7_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC7_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP8_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec8_pk, grdItem.GetGridData( i, G5_SPEC8_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec8,    grdItem.GetGridData( i, G5_SPEC8_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC8_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP9_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec9_pk, grdItem.GetGridData( i, G5_SPEC9_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec9,    grdItem.GetGridData( i, G5_SPEC9_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC9_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP10_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec10_pk, grdItem.GetGridData( i, G5_SPEC10_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec10,    grdItem.GetGridData( i, G5_SPEC10_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC10_PK);
                        }                
                        new_row = grdDetail.rows-1;
                        chk_item_row = new_row ; 
                    }                       
                }
            }  
        }  
        else if ( grdItem.GetGridData( i, G5_SPECGRP2_PK) != '' )
        {
            size_spec_pk = grdItem.GetGridData( i, G5_SPEC2_PK);
        }         
        //--------- spec 3
        if ( grdItem.GetGridData( i, G5_SPECGRP3_PK) == specgrp_list[3] && grdItem.GetGridData( i, G5_SPECGRP3_PK) != txtSizeSpecGroupPK.text && grdItem.GetGridData( i, G5_SPECGRP3_PK) != '' )        
        {
            if ( chk_item_row != 0 && new_row == 0 )
            {
                if ( grdDetail.GetGridData( chk_item_row, G4_Spec3_pk) != grdItem.GetGridData( i, G5_SPEC3_PK) )
                {
                    var j = chk_item_row;
                    chk_item_row = 0 ;
                    
                    while ( j < grdDetail.rows-1 )
                    {
                        j++;
                        if ( grdDetail.GetGridData( j, G4_Spec1_pk) == grdItem.GetGridData( i, G5_SPEC1_PK) && grdDetail.GetGridData( j, G4_Spec2_pk) == grdItem.GetGridData( i, G5_SPEC2_PK) && grdDetail.GetGridData( j, G4_Spec3_pk) == grdItem.GetGridData( i, G5_SPEC3_PK) )
                        {
                            chk_item_row = j ;
                        }
                    }
            
                    if ( chk_item_row == 0 )
                    {
                        grdDetail.AddRow();
                        grdDetail.SetGridText( grdDetail.rows-1, G4_No , grdDetail.rows-1);
                        
                        if ( grdItem.GetGridData( i, G5_SPECGRP1_PK) != txtSizeSpecGroupPK.text )
                        {
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec1_pk, grdItem.GetGridData( i, G5_SPEC1_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec1,    grdItem.GetGridData( i, G5_SPEC1_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC1_PK);
                        }
                        if ( grdItem.GetGridData( i, G5_SPECGRP2_PK) != txtSizeSpecGroupPK.text )
                        {
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec2_pk, grdItem.GetGridData( i, G5_SPEC2_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec2,    grdItem.GetGridData( i, G5_SPEC2_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC2_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP3_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec3_pk, grdItem.GetGridData( i, G5_SPEC3_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec3,    grdItem.GetGridData( i, G5_SPEC3_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC3_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP4_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec4_pk, grdItem.GetGridData( i, G5_SPEC4_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec4,    grdItem.GetGridData( i, G5_SPEC4_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC4_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP5_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec5_pk, grdItem.GetGridData( i, G5_SPEC5_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec5,    grdItem.GetGridData( i, G5_SPEC5_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC5_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP6_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec6_pk, grdItem.GetGridData( i, G5_SPEC6_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec6,    grdItem.GetGridData( i, G5_SPEC6_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC6_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP7_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec7_pk, grdItem.GetGridData( i, G5_SPEC7_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec7,    grdItem.GetGridData( i, G5_SPEC7_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC7_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP8_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec8_pk, grdItem.GetGridData( i, G5_SPEC8_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec8,    grdItem.GetGridData( i, G5_SPEC8_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC8_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP9_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec9_pk, grdItem.GetGridData( i, G5_SPEC9_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec9,    grdItem.GetGridData( i, G5_SPEC9_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC9_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP10_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec10_pk, grdItem.GetGridData( i, G5_SPEC10_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec10,    grdItem.GetGridData( i, G5_SPEC10_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC10_PK);
                        }                
                        new_row = grdDetail.rows-1;
                        chk_item_row = new_row ; 
                    }  
                }
            }  
        }  
        else if ( grdItem.GetGridData( i, G5_SPECGRP3_PK) != '' )
        {
            size_spec_pk = grdItem.GetGridData( i, G5_SPEC3_PK);
        }         
        //----------Spec 4
        if ( grdItem.GetGridData( i, G5_SPECGRP4_PK) == specgrp_list[4] && grdItem.GetGridData( i, G5_SPECGRP4_PK) != txtSizeSpecGroupPK.text && grdItem.GetGridData( i, G5_SPECGRP4_PK) != '' )        
        {
            if ( chk_item_row != 0 && new_row == 0 )
            {
                if ( grdDetail.GetGridData( chk_item_row, G4_Spec4_pk) != grdItem.GetGridData( i, G5_SPEC4_PK) )
                {
                    var j = chk_item_row;
                    chk_item_row = 0 ;
                    
                    while ( j < grdDetail.rows-1 )
                    {
                        j++;
                        if ( grdDetail.GetGridData( j, G4_Spec1_pk) == grdItem.GetGridData( i, G5_SPEC1_PK) && grdDetail.GetGridData( j, G4_Spec2_pk) == grdItem.GetGridData( i, G5_SPEC2_PK) && grdDetail.GetGridData( j, G4_Spec3_pk) == grdItem.GetGridData( i, G5_SPEC3_PK) && grdDetail.GetGridData( j, G4_Spec4_pk) == grdItem.GetGridData( i, G5_SPEC4_PK) )
                        {
                            chk_item_row = j ;
                        }
                    }
            
                    if ( chk_item_row == 0 )
                    {
                        grdDetail.AddRow();
                        grdDetail.SetGridText( grdDetail.rows-1, G4_No , grdDetail.rows-1);
                        
                        if ( grdItem.GetGridData( i, G5_SPECGRP1_PK) != txtSizeSpecGroupPK.text )
                        {
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec1_pk, grdItem.GetGridData( i, G5_SPEC1_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec1,    grdItem.GetGridData( i, G5_SPEC1_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC1_PK);
                        }
                        if ( grdItem.GetGridData( i, G5_SPECGRP2_PK) != txtSizeSpecGroupPK.text )
                        {
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec2_pk, grdItem.GetGridData( i, G5_SPEC2_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec2,    grdItem.GetGridData( i, G5_SPEC2_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC2_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP3_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec3_pk, grdItem.GetGridData( i, G5_SPEC3_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec3,    grdItem.GetGridData( i, G5_SPEC3_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC3_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP4_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec4_pk, grdItem.GetGridData( i, G5_SPEC4_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec4,    grdItem.GetGridData( i, G5_SPEC4_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC4_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP5_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec5_pk, grdItem.GetGridData( i, G5_SPEC5_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec5,    grdItem.GetGridData( i, G5_SPEC5_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC5_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP6_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec6_pk, grdItem.GetGridData( i, G5_SPEC6_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec6,    grdItem.GetGridData( i, G5_SPEC6_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC6_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP7_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec7_pk, grdItem.GetGridData( i, G5_SPEC7_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec7,    grdItem.GetGridData( i, G5_SPEC7_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC7_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP8_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec8_pk, grdItem.GetGridData( i, G5_SPEC8_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec8,    grdItem.GetGridData( i, G5_SPEC8_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC8_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP9_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec9_pk, grdItem.GetGridData( i, G5_SPEC9_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec9,    grdItem.GetGridData( i, G5_SPEC9_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC9_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP10_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec10_pk, grdItem.GetGridData( i, G5_SPEC10_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec10,    grdItem.GetGridData( i, G5_SPEC10_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC10_PK);
                        }                
                        new_row = grdDetail.rows-1;
                        chk_item_row = new_row ; 
                    }  
                }
            }  
        }
        else if ( grdItem.GetGridData( i, G5_SPECGRP4_PK) != '' )
        {
            size_spec_pk = grdItem.GetGridData( i, G5_SPEC4_PK);
        }         
        //----------Spec 5 
        if ( grdItem.GetGridData( i, G5_SPECGRP5_PK) == specgrp_list[5] && grdItem.GetGridData( i, G5_SPECGRP3_PK) != txtSizeSpecGroupPK.text && grdItem.GetGridData( i, G5_SPECGRP5_PK) != '' )        
        {
            if ( chk_item_row != 0 && new_row == 0 )
            {
                if ( grdDetail.GetGridData( chk_item_row, G4_Spec5_pk) != grdItem.GetGridData( i, G5_SPEC5_PK) )
                {
                    var j = chk_item_row;
                    chk_item_row = 0 ;
                    
                    while ( j < grdDetail.rows-1 )
                    {
                        j++;
                        if ( grdDetail.GetGridData( j, G4_Spec1_pk) == grdItem.GetGridData( i, G5_SPEC1_PK) && grdDetail.GetGridData( j, G4_Spec2_pk) == grdItem.GetGridData( i, G5_SPEC2_PK) && grdDetail.GetGridData( j, G4_Spec3_pk) == grdItem.GetGridData( i, G5_SPEC3_PK) && grdDetail.GetGridData( j, G4_Spec4_pk) == grdItem.GetGridData( i, G5_SPEC4_PK) && grdDetail.GetGridData( j, G4_Spec5_pk) == grdItem.GetGridData( i, G5_SPEC5_PK) )
                        {
                            chk_item_row = j ;
                        }
                    }
            
                    if ( chk_item_row == 0 )
                    { 
                        grdDetail.AddRow();
                        grdDetail.SetGridText( grdDetail.rows-1, G4_No , grdDetail.rows-1);
                        
                        if ( grdItem.GetGridData( i, G5_SPECGRP1_PK) != txtSizeSpecGroupPK.text )
                        {
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec1_pk, grdItem.GetGridData( i, G5_SPEC1_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec1,    grdItem.GetGridData( i, G5_SPEC1_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC1_PK);
                        }
                        if ( grdItem.GetGridData( i, G5_SPECGRP2_PK) != txtSizeSpecGroupPK.text )
                        {
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec2_pk, grdItem.GetGridData( i, G5_SPEC2_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec2,    grdItem.GetGridData( i, G5_SPEC2_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC2_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP3_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec3_pk, grdItem.GetGridData( i, G5_SPEC3_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec3,    grdItem.GetGridData( i, G5_SPEC3_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC3_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP4_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec4_pk, grdItem.GetGridData( i, G5_SPEC4_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec4,    grdItem.GetGridData( i, G5_SPEC4_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC4_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP5_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec5_pk, grdItem.GetGridData( i, G5_SPEC5_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec5,    grdItem.GetGridData( i, G5_SPEC5_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC5_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP6_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec6_pk, grdItem.GetGridData( i, G5_SPEC6_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec6,    grdItem.GetGridData( i, G5_SPEC6_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC6_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP7_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec7_pk, grdItem.GetGridData( i, G5_SPEC7_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec7,    grdItem.GetGridData( i, G5_SPEC7_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC7_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP8_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec8_pk, grdItem.GetGridData( i, G5_SPEC8_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec8,    grdItem.GetGridData( i, G5_SPEC8_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC8_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP9_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec9_pk, grdItem.GetGridData( i, G5_SPEC9_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec9,    grdItem.GetGridData( i, G5_SPEC9_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC9_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP10_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec10_pk, grdItem.GetGridData( i, G5_SPEC10_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec10,    grdItem.GetGridData( i, G5_SPEC10_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC10_PK);
                        }                
                        new_row = grdDetail.rows-1;
                        chk_item_row = new_row ; 
                    }  
                }
            }  
        } 
        else if ( grdItem.GetGridData( i, G5_SPECGRP5_PK) != '' )
        {
            size_spec_pk = grdItem.GetGridData( i, G5_SPEC5_PK);
        }                 
        //----------Spec 6
        if ( grdItem.GetGridData( i, G5_SPECGRP6_PK) == specgrp_list[6] && grdItem.GetGridData( i, G5_SPECGRP6_PK) != txtSizeSpecGroupPK.text && grdItem.GetGridData( i, G5_SPECGRP6_PK) != '' )        
        {
            if ( chk_item_row != 0 && new_row == 0 )
            {
                if ( grdDetail.GetGridData( chk_item_row, G4_Spec6_pk) != grdItem.GetGridData( i, G5_SPEC6_PK) )
                {
                    var j = chk_item_row;
                    chk_item_row = 0 ;
                    
                    while ( j < grdDetail.rows-1 )
                    {
                        j++;
                        if ( grdDetail.GetGridData( j, G4_Spec1_pk) == grdItem.GetGridData( i, G5_SPEC1_PK) && grdDetail.GetGridData( j, G4_Spec2_pk) == grdItem.GetGridData( i, G5_SPEC2_PK) && grdDetail.GetGridData( j, G4_Spec3_pk) == grdItem.GetGridData( i, G5_SPEC3_PK) && grdDetail.GetGridData( j, G4_Spec4_pk) == grdItem.GetGridData( i, G5_SPEC4_PK) && grdDetail.GetGridData( j, G4_Spec5_pk) == grdItem.GetGridData( i, G5_SPEC5_PK) && grdDetail.GetGridData( j, G4_Spec6_pk) == grdItem.GetGridData( i, G5_SPEC6_PK)  )
                        {
                            chk_item_row = j ;
                        }
                    }
            
                    if ( chk_item_row == 0 )
                    {
                        grdDetail.AddRow();
                        grdDetail.SetGridText( grdDetail.rows-1, G4_No , grdDetail.rows-1);
                        
                        if ( grdItem.GetGridData( i, G5_SPECGRP1_PK) != txtSizeSpecGroupPK.text )
                        {
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec1_pk, grdItem.GetGridData( i, G5_SPEC1_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec1,    grdItem.GetGridData( i, G5_SPEC1_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC1_PK);
                        }
                        if ( grdItem.GetGridData( i, G5_SPECGRP2_PK) != txtSizeSpecGroupPK.text )
                        {
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec2_pk, grdItem.GetGridData( i, G5_SPEC2_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec2,    grdItem.GetGridData( i, G5_SPEC2_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC2_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP3_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec3_pk, grdItem.GetGridData( i, G5_SPEC3_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec3,    grdItem.GetGridData( i, G5_SPEC3_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC3_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP4_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec4_pk, grdItem.GetGridData( i, G5_SPEC4_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec4,    grdItem.GetGridData( i, G5_SPEC4_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC4_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP5_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec5_pk, grdItem.GetGridData( i, G5_SPEC5_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec5,    grdItem.GetGridData( i, G5_SPEC5_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC5_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP6_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec6_pk, grdItem.GetGridData( i, G5_SPEC6_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec6,    grdItem.GetGridData( i, G5_SPEC6_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC6_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP7_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec7_pk, grdItem.GetGridData( i, G5_SPEC7_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec7,    grdItem.GetGridData( i, G5_SPEC7_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC7_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP8_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec8_pk, grdItem.GetGridData( i, G5_SPEC8_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec8,    grdItem.GetGridData( i, G5_SPEC8_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC8_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP9_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec9_pk, grdItem.GetGridData( i, G5_SPEC9_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec9,    grdItem.GetGridData( i, G5_SPEC9_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC9_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP10_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec10_pk, grdItem.GetGridData( i, G5_SPEC10_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec10,    grdItem.GetGridData( i, G5_SPEC10_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC10_PK);
                        }                
                        new_row = grdDetail.rows-1;
                        chk_item_row = new_row ; 
                    }  
                }
            }  
        } 
        else if ( grdItem.GetGridData( i, G5_SPECGRP6_PK) != '' )
        {
            size_spec_pk = grdItem.GetGridData( i, G5_SPEC6_PK);
        }                 
        //----------Spec 7
        if ( grdItem.GetGridData( i, G5_SPECGRP7_PK) == specgrp_list[7] && grdItem.GetGridData( i, G5_SPECGRP7_PK) != txtSizeSpecGroupPK.text && grdItem.GetGridData( i, G5_SPECGRP7_PK) != '' )        
        {
            if ( chk_item_row != 0 && new_row == 0 )
            {
                if ( grdDetail.GetGridData( chk_item_row, G4_Spec7_pk) != grdItem.GetGridData( i, G5_SPEC7_PK) )
                {
                    var j = chk_item_row;
                    chk_item_row = 0 ;
                    
                    while ( j < grdDetail.rows-1 )
                    {
                        j++;
                        if ( grdDetail.GetGridData( j, G4_Spec1_pk) == grdItem.GetGridData( i, G5_SPEC1_PK) && grdDetail.GetGridData( j, G4_Spec2_pk) == grdItem.GetGridData( i, G5_SPEC2_PK) && grdDetail.GetGridData( j, G4_Spec3_pk) == grdItem.GetGridData( i, G5_SPEC3_PK) && grdDetail.GetGridData( j, G4_Spec4_pk) == grdItem.GetGridData( i, G5_SPEC4_PK) && grdDetail.GetGridData( j, G4_Spec5_pk) == grdItem.GetGridData( i, G5_SPEC5_PK) && grdDetail.GetGridData( j, G4_Spec6_pk) == grdItem.GetGridData( i, G5_SPEC6_PK) && grdDetail.GetGridData( j, G4_Spec7_pk) == grdItem.GetGridData( i, G5_SPEC7_PK) )
                        {
                            chk_item_row = j ;
                        }
                    }
            
                    if ( chk_item_row == 0 )
                    {
                        grdDetail.AddRow();
                        grdDetail.SetGridText( grdDetail.rows-1, G4_No , grdDetail.rows-1);
                        
                        if ( grdItem.GetGridData( i, G5_SPECGRP1_PK) != txtSizeSpecGroupPK.text )
                        {
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec1_pk, grdItem.GetGridData( i, G5_SPEC1_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec1,    grdItem.GetGridData( i, G5_SPEC1_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC1_PK);
                        }
                        if ( grdItem.GetGridData( i, G5_SPECGRP2_PK) != txtSizeSpecGroupPK.text )
                        {
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec2_pk, grdItem.GetGridData( i, G5_SPEC2_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec2,    grdItem.GetGridData( i, G5_SPEC2_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC2_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP3_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec3_pk, grdItem.GetGridData( i, G5_SPEC3_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec3,    grdItem.GetGridData( i, G5_SPEC3_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC3_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP4_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec4_pk, grdItem.GetGridData( i, G5_SPEC4_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec4,    grdItem.GetGridData( i, G5_SPEC4_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC4_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP5_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec5_pk, grdItem.GetGridData( i, G5_SPEC5_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec5,    grdItem.GetGridData( i, G5_SPEC5_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC5_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP6_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec6_pk, grdItem.GetGridData( i, G5_SPEC6_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec6,    grdItem.GetGridData( i, G5_SPEC6_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC6_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP7_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec7_pk, grdItem.GetGridData( i, G5_SPEC7_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec7,    grdItem.GetGridData( i, G5_SPEC7_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC7_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP8_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec8_pk, grdItem.GetGridData( i, G5_SPEC8_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec8,    grdItem.GetGridData( i, G5_SPEC8_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC8_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP9_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec9_pk, grdItem.GetGridData( i, G5_SPEC9_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec9,    grdItem.GetGridData( i, G5_SPEC9_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC9_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP10_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec10_pk, grdItem.GetGridData( i, G5_SPEC10_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec10,    grdItem.GetGridData( i, G5_SPEC10_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC10_PK);
                        }                
                        new_row = grdDetail.rows-1;
                        chk_item_row = new_row ; 
                    }  
                }
            }  
        }
        else if ( grdItem.GetGridData( i, G5_SPECGRP7_PK) != '' )
        {
            size_spec_pk = grdItem.GetGridData( i, G5_SPEC7_PK);
        }                         
        //----------Spec 8
        if ( grdItem.GetGridData( i, G5_SPECGRP8_PK) == specgrp_list[8] && grdItem.GetGridData( i, G5_SPECGRP8_PK) != txtSizeSpecGroupPK.text && grdItem.GetGridData( i, G5_SPECGRP8_PK) != '' )        
        {
            if ( chk_item_row != 0 && new_row == 0 )
            {
                if ( grdDetail.GetGridData( chk_item_row, G4_Spec8_pk) != grdItem.GetGridData( i, G5_SPEC8_PK) )
                {
                    var j = chk_item_row;
                    chk_item_row = 0 ;
                    
                    while ( j < grdDetail.rows-1 )
                    {
                        j++;
                        if ( grdDetail.GetGridData( j, G4_Spec1_pk) == grdItem.GetGridData( i, G5_SPEC1_PK) && grdDetail.GetGridData( j, G4_Spec2_pk) == grdItem.GetGridData( i, G5_SPEC2_PK) && grdDetail.GetGridData( j, G4_Spec3_pk) == grdItem.GetGridData( i, G5_SPEC3_PK) && grdDetail.GetGridData( j, G4_Spec4_pk) == grdItem.GetGridData( i, G5_SPEC4_PK) && grdDetail.GetGridData( j, G4_Spec5_pk) == grdItem.GetGridData( i, G5_SPEC5_PK) && grdDetail.GetGridData( j, G4_Spec6_pk) == grdItem.GetGridData( i, G5_SPEC6_PK) && grdDetail.GetGridData( j, G4_Spec7_pk) == grdItem.GetGridData( i, G5_SPEC7_PK) && grdDetail.GetGridData( j, G4_Spec8_pk) == grdItem.GetGridData( i, G5_SPEC8_PK) )
                        {
                            chk_item_row = j ;
                        }
                    }
            
                    if ( chk_item_row == 0 )
                    {
                        grdDetail.AddRow();
                        grdDetail.SetGridText( grdDetail.rows-1, G4_No , grdDetail.rows-1);
                        
                        if ( grdItem.GetGridData( i, G5_SPECGRP1_PK) != txtSizeSpecGroupPK.text )
                        {
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec1_pk, grdItem.GetGridData( i, G5_SPEC1_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec1,    grdItem.GetGridData( i, G5_SPEC1_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC1_PK);
                        }
                        if ( grdItem.GetGridData( i, G5_SPECGRP2_PK) != txtSizeSpecGroupPK.text )
                        {
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec2_pk, grdItem.GetGridData( i, G5_SPEC2_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec2,    grdItem.GetGridData( i, G5_SPEC2_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC2_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP3_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec3_pk, grdItem.GetGridData( i, G5_SPEC3_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec3,    grdItem.GetGridData( i, G5_SPEC3_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC3_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP4_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec4_pk, grdItem.GetGridData( i, G5_SPEC4_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec4,    grdItem.GetGridData( i, G5_SPEC4_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC4_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP5_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec5_pk, grdItem.GetGridData( i, G5_SPEC5_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec5,    grdItem.GetGridData( i, G5_SPEC5_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC5_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP6_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec6_pk, grdItem.GetGridData( i, G5_SPEC6_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec6,    grdItem.GetGridData( i, G5_SPEC6_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC6_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP7_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec7_pk, grdItem.GetGridData( i, G5_SPEC7_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec7,    grdItem.GetGridData( i, G5_SPEC7_ID) );
                        } 
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC7_PK);
                        }                               
                        if ( grdItem.GetGridData( i, G5_SPECGRP8_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec8_pk, grdItem.GetGridData( i, G5_SPEC8_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec8,    grdItem.GetGridData( i, G5_SPEC8_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC8_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP9_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec9_pk, grdItem.GetGridData( i, G5_SPEC9_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec9,    grdItem.GetGridData( i, G5_SPEC9_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC9_PK);
                        }                                
                        if ( grdItem.GetGridData( i, G5_SPECGRP10_PK) != txtSizeSpecGroupPK.text )
                        {                
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec10_pk, grdItem.GetGridData( i, G5_SPEC10_PK) );
                            grdDetail.SetGridText( grdDetail.rows-1, G4_Spec10,    grdItem.GetGridData( i, G5_SPEC10_ID) );
                        }
                        else
                        {
                            size_spec_pk = grdItem.GetGridData( i, G5_SPEC10_PK);
                        }                
                        new_row = grdDetail.rows-1;
                        chk_item_row = new_row ; 
                    }  
                }
            }  
        }
        else if ( grdItem.GetGridData( i, G5_SPECGRP8_PK) != '' )
        {
            size_spec_pk = grdItem.GetGridData( i, G5_SPEC8_PK);
        }                 
        //----------Spec 9
        //----------Spec 10 
        //-----------------
        for ( var k = 1; k < grdSizeList.rows; k++ )
        {
            
            if ( grdSizeList.GetGridData( k, G2_SPEC_SIZE_PK ) == size_spec_pk )
            {
                var t_qty = Number(grdDetail.GetGridData( chk_item_row, G5_ORD_QTY));
                 
                grdDetail.SetGridText( chk_item_row, G4_SizeSpec1_PK + 2*k - 2, size_spec_pk                                        );
                grdDetail.SetGridText( chk_item_row, G4_SizeSpec1 + 2*k - 2,    t_qty + Number(grdItem.GetGridData( i, G5_ORD_QTY)) );
            }
        }
        //-----------------                                                                      
    }   
}
//==================================================================
function OnPopUp(pos)
{
    e_row = event.row ;
    e_col = event.col ;
    
    switch (pos)         
    {		        
        case 'GetSpec' :
            if ( e_col > G4_Spec1_pk && e_col <= G4_Spec10 )
            {
                var specgrp_pk; 
                if ( e_col == G4_Spec1 )
                {
                    specgrp_pk = specgrp_list[1];
                }
                else if ( e_col == G4_Spec2 )
                {
                    specgrp_pk = specgrp_list[2];
                }
                else if ( e_col == G4_Spec3 )
                {
                    specgrp_pk = specgrp_list[3];
                }
                else if ( e_col == G4_Spec4 )
                {
                    specgrp_pk = specgrp_list[4];
                }
                else if ( e_col == G4_Spec5 )
                {
                    specgrp_pk = specgrp_list[5];
                }
                else if ( e_col == G4_Spec6 )
                {
                    specgrp_pk = specgrp_list[6];
                }
                else if ( e_col == G4_Spec7 )
                {
                    specgrp_pk = specgrp_list[7];
                }
                else if ( e_col == G4_Spec8 )
                {
                    specgrp_pk = specgrp_list[8];
                }
                else if ( e_col == G4_Spec9 )
                {
                    specgrp_pk = specgrp_list[9];
                }
                else if ( e_col == G4_Spec10 )
                {
                    specgrp_pk = specgrp_list[10];
                }   
                                                                                                                                             
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00090.aspx?specgrp_pk=" + specgrp_pk ;
                var object  = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:500px;dialogHeight:500px');	
                
                if ( object != null )
                {
                    grdDetail.SetGridText( e_row, e_col -1 , object[2]);
                    grdDetail.SetGridText( e_row, e_col    , object[3]);
                }
            }
        break;
    }  
} 
//==================================================================

function OnAddNew()
{
    if ( grdDetail.row > 0 )
    {
        grdDetail.AddRow();
        grdDetail.SetGridText( grdDetail.rows-1, G4_No , grdDetail.rows-1 );
        
        for ( var i = G4_Spec1_pk; i <= G4_Spec10 ; i++ )
        {
            grdDetail.SetGridText( grdDetail.rows-1, i , grdDetail.GetGridData( grdDetail.row, i) );
        } 
    } 
    else
    {
        grdDetail.AddRow();
        grdDetail.SetGridText( grdDetail.rows-1, G4_No , grdDetail.rows-1 );    
    }    
}
//==================================================================
function CheckInput(obj)
{
    switch (obj.id)
    {
        case "grdDetail":
            var  row, col ;
            
            row = event.row ;
            col = event.col ; 
            
            if ( col >= G4_Size1 && col <= G4_Size10 )
            {
                var dQuantiy
                
                dQuantiy =  grdDetail.GetGridData(row,col);
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {                        
                        grdItemList.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(2));
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        grdItemList.SetGridText(row,col,"")
                    }
                }
                else
                {
                    grdItemList.SetGridText(row,col,"")
                }
                //---------------------------------------
            } 
        break;
    }                    
}

//==================================================================
function OnSave()
{
    grdSave.ClearData();
    
    for ( var i = 1 ; i < grdDetail.rows; i++)
    {   
        for ( var j = G4_SizeSpec1_PK; j <= G4_SizeSpec10_PK ; j =j+2)
        {
            var chk = 0 ;
            var size_row = ( j - 21 + 2 ) / 2 ;
            
            if ( size_row < grdSizeList.rows )
            {
                for (var k = 1; k < grdSave.rows; k++)
                {
                    if ( grdSave.GetGridData( k, G3_Spec1_PK) == grdDetail.GetGridData( i, G4_Spec1_pk) 
                        && grdSave.GetGridData( k, G3_Spec2_PK) == grdDetail.GetGridData( i, G4_Spec2_pk) 
                        && grdSave.GetGridData( k, G3_Spec3_PK) == grdDetail.GetGridData( i, G4_Spec3_pk) 
                        && grdSave.GetGridData( k, G3_Spec4_PK) == grdDetail.GetGridData( i, G4_Spec4_pk) 
                        && grdSave.GetGridData( k, G3_Spec5_PK) == grdDetail.GetGridData( i, G4_Spec5_pk) 
                        && grdSave.GetGridData( k, G3_Spec6_PK) == grdDetail.GetGridData( i, G4_Spec6_pk) 
                        && grdSave.GetGridData( k, G3_Spec7_PK) == grdDetail.GetGridData( i, G4_Spec7_pk) 
                        && grdSave.GetGridData( k, G3_Spec8_PK) == grdDetail.GetGridData( i, G4_Spec8_pk) 
                        && grdSave.GetGridData( k, G3_Spec9_PK) == grdDetail.GetGridData( i, G4_Spec9_pk) 
                        && grdSave.GetGridData( k, G3_Spec10_PK) == grdDetail.GetGridData( i, G4_Spec10_pk) 
                        && grdSave.GetGridData( k, G3_Spec11_PK) == grdSizeList.GetGridData( size_row, G2_SPEC_SIZE_PK ) )
                    {
                        /* 
                        grdSave.GetGridData( k, G3_Spec1_PK)  == grdDetail.GetGridData( i, G4_Spec1_pk) && 
                        grdSave.GetGridData( k, G3_Spec2_PK)  == grdDetail.GetGridData( i, G4_Spec2_pk) && 
                        grdSave.GetGridData( k, G3_Spec3_PK)  == grdDetail.GetGridData( i, G4_Spec3_pk) && 
                        grdSave.GetGridData( k, G3_Spec4_PK)  == grdDetail.GetGridData( i, G4_Spec4_pk) && 
                        grdSave.GetGridData( k, G3_Spec5_PK)  == grdDetail.GetGridData( i, G4_Spec5_pk) && 
                        grdSave.GetGridData( k, G3_Spec6_PK)  == grdDetail.GetGridData( i, G4_Spec6_pk) && 
                        grdSave.GetGridData( k, G3_Spec7_PK)  == grdDetail.GetGridData( i, G4_Spec7_pk) && 
                        grdSave.GetGridData( k, G3_Spec8_PK)  == grdDetail.GetGridData( i, G4_Spec8_pk) && 
                        grdSave.GetGridData( k, G3_Spec9_PK)  == grdDetail.GetGridData( i, G4_Spec9_pk) && 
                        grdSave.GetGridData( k, G3_Spec10_PK) == grdDetail.GetGridData( i, G4_Spec10_pk) && 
                        grdSave.GetGridData( k, G3_Spec11_PK) == grdSizeList.GetGridData( size_row, G2_SPEC_SIZE_PK )
                        */
                        chk = 1 ;
                        var t_qty = Number(grdSave.GetGridData( k, G3_ORD_QTY));

                        grdSave.SetGridText( k, G3_ORD_QTY, t_qty + Number(grdDetail.GetGridData( i, j+1)));
                     }
                }

                if ( chk == 0 )
                {                
                    grdSave.AddRow();
                    grdSave.SetGridText( grdSave.rows-1, G3_Spec1_PK, grdDetail.GetGridData( i, G4_Spec1_pk) );
                    grdSave.SetGridText( grdSave.rows-1, G3_Spec2_PK, grdDetail.GetGridData( i, G4_Spec2_pk) );
                    grdSave.SetGridText( grdSave.rows-1, G3_Spec3_PK, grdDetail.GetGridData( i, G4_Spec3_pk) );
                    grdSave.SetGridText( grdSave.rows-1, G3_Spec4_PK, grdDetail.GetGridData( i, G4_Spec4_pk) );
                    grdSave.SetGridText( grdSave.rows-1, G3_Spec5_PK, grdDetail.GetGridData( i, G4_Spec5_pk) );
                    grdSave.SetGridText( grdSave.rows-1, G3_Spec6_PK, grdDetail.GetGridData( i, G4_Spec6_pk) );
                    grdSave.SetGridText( grdSave.rows-1, G3_Spec7_PK, grdDetail.GetGridData( i, G4_Spec7_pk) );
                    grdSave.SetGridText( grdSave.rows-1, G3_Spec8_PK, grdDetail.GetGridData( i, G4_Spec8_pk) );
                    grdSave.SetGridText( grdSave.rows-1, G3_Spec9_PK, grdDetail.GetGridData( i, G4_Spec9_pk) );
                    grdSave.SetGridText( grdSave.rows-1, G3_Spec10_PK,grdDetail.GetGridData( i, G4_Spec10_pk));

                    grdSave.SetGridText( grdSave.rows-1, G3_Spec11_PK, grdSizeList.GetGridData( size_row, G2_SPEC_SIZE_PK ));
                    
                    grdSave.SetGridText( grdSave.rows-1, G3_ORD_QTY,          grdDetail.GetGridData( i, j+1 ));
                    grdSave.SetGridText( grdSave.rows-1, G3_TCO_STITEM_PK,    txtSTItemPK.text    );     
                    grdSave.SetGridText( grdSave.rows-1, G3_TSA_SALEORDER_PK, txtOrdMasterPK.text );     
                }
            }   
        }
    }
    
    //-----------
    data_dsbs00016_4.Call();
    //-----------
}
//==================================================================

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="data_dsbs00016" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="control" user="prod" function="sale.sp_sel_dsbs00016"  > 
                <inout> 
                    <inout bind="txtOrdMasterPK" />
                    <inout bind="txtSONo" />
                    <inout bind="txtSTItemPK" />  
                    <inout bind="txtSTItemCode" />
                    <inout bind="txtSTItemName" />
                    <inout bind="txtSizeSpecGroupSeq" />
                    <inout bind="txtSizeSpecGroupPK" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_dsbs00016_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="sale.sp_sel_dsbs00016_1"  > 
                <input>
                    <input bind="txtSTItemPK" />
                </input> 
                <output bind="grdSpecGrpList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00016_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"  function="sale.sp_sel_dsbs00016_2"   > 
                <input>
                    <input bind="txtSTItemPK" />
                </input> 
                <output bind="grdSizeList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00016_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"  function="sale.sp_sel_dsbs00016_3"   > 
                <input>
                    <input bind="txtOrdMasterPK" />
                    <input bind="txtSTItemPK" />
                </input> 
                <output bind="grdItem" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00016_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="sale.sp_sel_dsbs00016_4" procedure="sale.sp_upd_dsbs00016_4"  > 
                <input>
                    <input bind="txtOrdMasterPK" />
                </input> 
                <output bind="grdSave" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="height: 100%; width: 100%">
        <tr style="height: 1%">
            <td id="search_condition">
                <table style="height: 100%; width: 100%">
                    <tr>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            SO No
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtSONo" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align='right' style="width: 5%; white-space: nowrap">
                            ST Item
                        </td>
                        <td style="width: 60%; white-space: nowrap">
                            <gw:textbox id="txtSTItemPK" maxlen="100" styles='width:100%;display:none' />
                            <gw:textbox id="txtSTItemCode" styles='width:30%' csstype="mandatory" />
                            <gw:textbox id="txtSTItemName" styles='width:70%' csstype="mandatory" />
                        </td>
                        <td style="width: 7%">
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:button img="search" alt="Search" id="btnSearch" onclick="OnSearch('Refresh')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button img="new" alt="Add" id="btnAdd" onclick="OnAddNew()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button img="save" alt="Save" id="btnSave" onclick="OnSave()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id='grdDetail' header='No|_1|_2|_3|_4|_5|_6|_7|_8|_9|_10|_11|_12|_13|_14|_15|_16|_17|_18|_19|_20|_21|_22|_23|_24|_25|_26|_27|_28|_29|_30|_31|_32|_33|_34|_35|_36|_37|_38|_39|_40'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    aligns='1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|0|3|0|3|0|3|0|3|0|3|0|3|0|3|0|3|0|3'
                    defaults='||||||||||||||||||||||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick="OnPopUp('GetSpec')" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------>
    <gw:grid id='grdSpecGrpList' header='SEQ|TCO_SPECGRP_PK|SPECGRP_NM' format='0|0|0'
        aligns='0|0|0' defaults='||' editcol='1|1|1' widths='1000|1000|1000' sorting='T'
        styles='width:100%; height:460;display:none' />
    <!------------------------------------------------------------------------>
    <gw:grid id='grdSizeList' header='PK|SPEC_ID|SPEC_NM' format='0|0|0' aligns='0|0|0'
        defaults='||' editcol='1|1|1' widths='1000|1000|1000' sorting='T' styles='width:100%; height:200;display:none' />
    <!------------------------------------------------------------------------>
    <gw:grid id='grdItem' header='SPECGRP_PK|SPEC_PK|SPEC_ID|SPECGRP_PK|SPEC_PK|SPEC_ID|SPECGRP_PK|SPEC_PK|SPEC_ID|SPECGRP_PK|SPEC_PK|SPEC_ID|SPECGRP_PK|SPEC_PK|SPEC_ID|SPECGRP_PK|SPEC_PK|SPEC_ID|SPECGRP_PK|SPEC_PK|SPEC_ID|SPECGRP_PK|SPEC_PK|SPEC_ID|SPECGRP_PK|SPEC_PK|SPEC_ID|SPECGRP_PK|SPEC_PK|SPEC_ID|ORD_QTY'
        format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
        defaults='||||||||||||||||||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
        widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' styles='width:100%; height:460;display:none' />
    <!------------------------------------------------------------------------>
    <gw:grid id='grdSave' header='1|2|3|4|5|6|7|8|9|10|11|ORD_QTY|ST_ITEM_PK|ORDER_PK'
        format='0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1'
        widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
        sorting='T' styles='width:100%; height:460;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtOrdMasterPK" styles='width:100%;display:none' />
    <gw:textbox id="txtSizeSpecGroupPK" styles='width:100%;display:none' />
    <gw:textbox id="txtSizeSpecGroupSeq" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
</body>
</html>
