<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>CREATE ITEM BOM</title>
</head>

<script>

var G2_GROUP_PK		= 0,
	G2_ITEM_CODE	= 1,
	G2_SPECGRP_PK	= 2,
	G2_SEQ			= 3,
	G2_SPECGRP_NAME	= 4,
	G2_SPEC_TYPE	= 5,
	G2_MANDATORY	= 6,
	G2_ITEMSPEC_PK	= 7,
	G2_SPEC_PK		= 8,
	G2_SPEC_ID		= 9,
	G2_SPEC_NAME	= 10; 
	
var   G_ITEM_PK   = 0,
      G_ITEM_CODE = 1,
      G_ITEM_NAME = 2,        
      G_UOM       = 3;	
	
 var gPreviousRow = -1 ;              
 var callerWindowObj = dialogArguments;    
 var l_status = 'SAVE'       
//===================================================================================
 function BodyInit()
 {
        System.Translate(document);
        txtItemPK.text  = dialogArguments.txtChildPK.text
        txtSTItemPK.text  =  dialogArguments.txtSTChildPK.text
        lblSTItem.text = dialogArguments.txtSTChildNM.text
	    //-------------------------
        txtpur_yn.text = 'N';           
        MergeColumn();
        //---------------------- 
        OnSearch('grdSpecList');       
 } 

//===================================================================================
 function MergeColumn()
 {
      grdSpecList.GetGridControl().MergeCells  = 2 ;	
      grdSpecList.GetGridControl().MergeCol(0) = true ;	
      grdSpecList.GetGridControl().MergeCol(1) = true ;   	
      grdSpecList.GetGridControl().MergeCol(2) = true ;	
      grdSpecList.GetGridControl().MergeCol(3) = true ;	
      
      
 }



 //---------------------------------------------------------
 function BindingDataList()
 {    
        var data="";  
          
        data = "<%=ESysLib.SetListDataSQL("SELECT pk, grp_cd || ' - ' || grp_nm FROM comm.tco_itemgrp WHERE del_if = 0 AND leaf_yn = 'Y' AND prod_yn = 'Y' union all select 0, 'Select All' from dual ") %>" ;    
        lstGroup.SetDataText(data);
        lstGroup.value = 0 ;
 }        
 
 //---------------------------------------------------------
 function OnSearch(pos)
 {
 
      switch (pos)         
      {        
        case 'grdItemList' :         
            //--------------------------
            data_fphb00011_1.Call("SELECT");
        break; 
        
        case 'grdSpecList':    
            data_fphb00011.Call('SELECT');
        break;  
        
         case 'ITEM_SPEC':           
                        
            if ( grdItemList.row > 0 )
            {
                txtItemPK.text = grdItemList.GetGridData(grdItemList.row,0);
            }
            else
            {
                txtItemPK.text = '' ;
            }
            data_fphb00011.Call('SELECT');
        break;  
        
         
      }  
 }
 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {
        case "data_fphb00011_1":
            if ( grdSpecList.rows > 1 )
	             {
      		            grdSpecList.SetCellBgColor(1, G2_SPEC_ID, grdSpecList.rows - 1, G2_SPEC_NAME, 0xCCFFFF );
                 }
        break;
        //Call list of item after create new item
        case   "data_fphb00011":
            if(l_status == 'SAVE')
            {
                l_status ='SEARCH'
                OnSearch("grdItemList")
            }
        break;
        
        case   "data_dsbs00212_4":
            OnSearch("grdSpecList")
        break;
        
        case "data_fphb00011_2" :

            if ( grdSpec.rows > 2 || grdSpec.rows < 2 )
            {
                var queryString = "?pk=" + txt_tco_specgrp_pk.text
                                         + "&spec_id="
                                         + url_encode(txtSpecID.text )                                      
                                         + "&spec_name="
                                         + url_encode(txtSpecName.text);
                                     
                txt_tco_specgrp_pk.text = '' ;
                txtSpecID.text          = '' ; 
                txtSpecName.text        = '' ;                                       
                                        
                GetSpec(queryString); 
            }
            else
            {
                if ( gPreviousRow > 0 )
                {
		            grdSpecList.SetGridText( gPreviousRow, G2_SPEC_PK,   grdSpec.GetGridData( 1, 0) );//spec_pk
		            grdSpecList.SetGridText( gPreviousRow, G2_SPEC_ID,   grdSpec.GetGridData( 1, 1) );//spec_id
		            grdSpecList.SetGridText( gPreviousRow, G2_SPEC_NAME, grdSpec.GetGridData( 1, 2) );//spec_name
		        }
		        grdSpec.ClearData();
		        gPreviousRow = -1 ;
            }
        break;
        
      }  
      
 }
 
  //---------------------------------------------------------
 function FindSpec(grid)
 {
    
     if ( grdSpec.rows > 2 || grdSpec.rows < 2 )
            {
                gPreviousRow = grid.row ;
               var queryString = "?pk=" + txt_tco_specgrp_pk.text
                                         + "&spec_id="
                                         + txtSpecID.text
                                         + "&p_spec_id="                                         
                                         + txtParentSpecID.text
                                         + "&spec_name="
                                         + txtSpecName.text
                                         + "&grp_pk="
                                         + txt_tco_itemgrp_pk.text
                                         + grdSpecList.GetGridData(gPreviousRow,0)
                                         + "&stmapping_yn="
                                         + grdSpecList.GetGridData(gPreviousRow,15)
                                         + "&tco_stitem_pk"
                                         + txtSTItemPK.text;
                
                txt_tco_itemgrp_pk.text = '' ;                         
                txt_tco_specgrp_pk.text = '' ;
                txtSpecID.text          = '' ; 
                txtSpecName.text        = '' ;
                txtParentSpecID.text    = '' ;
                txtSTMappingYN.text     = '' ;                                                        
                                         
                var fpath = System.RootURL + "/form/fp/ab/fpab00540.aspx" + queryString + "&add_new_spec=No";
                    var aValue  = window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');	
                	
	                if ( aValue != null ) 
	                {	
		                grid.SetGridText( gPreviousRow, G5_tco_spec_pk , aValue[1]);//spec_pk
		                grid.SetGridText( gPreviousRow, G5_Spec_ID     , aValue[5]);//spec_id
		                grid.SetGridText( gPreviousRow, G5_Spec_Name   , aValue[6]);//spec_name
	                }
            }
            else
            {
                if ( gPreviousRow > 0 )
                {
		            grid.SetGridText( gPreviousRow, 11, grdSpec.GetGridData( 1, 0) );//spec_pk
		            grid.SetGridText( gPreviousRow, 12, grdSpec.GetGridData( 1, 1) );//spec_id
		            grid.SetGridText( gPreviousRow, 13, grdSpec.GetGridData( 1, 2) );//spec_name
		        }
		        grdSpec.ClearData();
		        gPreviousRow = -1 ;
            }
 }
//-----------------------------------------------------------
 function Find_Heigher_Level( value, row)
 {
    var i= row;
    
    if ( grdBOM.GetGridData(row,G4_Level)=="1") 
        return 0;
    else
        while ( i>=1 )
        {
            if (grdBOM.GetGridData( i,G4_Level )== value-1 )
                return i;
            i=i-1
        }
 }

 //---------------------------------------------------------
 function AddOnClick(pos)
 {
      switch (pos)         
      {		        
        case 1 :
             txtItemPK.text = '' ;
             data_fphb00011.Call('SELECT');
        break;
      }  
 }
 

 //---------------------------------------------------------
 
 function OnSave(pos)
 {
      switch (pos)         
      {		        
            
             case 'grdSpecList' :
                if ( CheckSpec(grdSpecList) == true && grdSpecList.rows > 1 )
                {
                    l_status ='SAVE';
                    data_dsbs00212_4.Call();
                }
            break;
           case 'REPAIR-ITEM' :
                    data_fphb00011_1.Call();
           break;  
      }  
 }
 
  //---------------------------------------------------------
 function Reset(pos)
 {
     
                txtItemPK_Spec1.text = '' ;
                txtItemSpecPK01.text = '' ; 
                txtItemSpecPK02.text = '' ;  
                txtItemSpecPK03.text = '' ;
                txtItemSpecPK04.text = '' ;
                txtItemSpecPK05.text = '' ;
                txtItemSpecPK06.text = '' ;
                txtItemSpecPK07.text = '' ;
                txtItemSpecPK08.text = '' ;
                txtItemSpecPK09.text = '' ;
                txtItemSpecPK10.text = '' ;    
                txtItemSpecPK11.text = '' ;
                txtItemSpecPK12.text = '' ;
                txtItemSpecPK13.text = '' ;
                txtItemSpecPK14.text = '' ;
                txtItemSpecPK15.text = '' ;
                txtItemSpecPK16.text = '' ;
                txtItemSpecPK17.text = '' ;
                txtItemSpecPK18.text = '' ;
                txtItemSpecPK19.text = '' ;
                txtItemSpecPK20.text = '' ;        
            
                txtSpecPK01.text = '' ; 
                txtSpecPK02.text = '' ;  
                txtSpecPK03.text = '' ;
                txtSpecPK04.text = '' ;
                txtSpecPK05.text = '' ;
                txtSpecPK06.text = '' ;
                txtSpecPK07.text = '' ;
                txtSpecPK08.text = '' ;
                txtSpecPK09.text = '' ;
                txtSpecPK10.text = '' ; 
                txtSpecPK11.text = '' ; 
                txtSpecPK12.text = '' ; 
                txtSpecPK13.text = '' ; 
                txtSpecPK14.text = '' ; 
                txtSpecPK15.text = '' ; 
                txtSpecPK16.text = '' ; 
                txtSpecPK17.text = '' ; 
                txtSpecPK18.text = '' ; 
                txtSpecPK19.text = '' ; 
                txtSpecPK20.text = '' ;     
                
                txtItemSpecType01.text = '' ; 
                txtItemSpecType02.text = '' ;  
                txtItemSpecType03.text = '' ;
                txtItemSpecType04.text = '' ;
                txtItemSpecType05.text = '' ;
                txtItemSpecType06.text = '' ;
                txtItemSpecType07.text = '' ;
                txtItemSpecType08.text = '' ;
                txtItemSpecType09.text = '' ;
                txtItemSpecType10.text = '' ;   
                txtItemSpecType11.text = '' ;
                txtItemSpecType12.text = '' ;
                txtItemSpecType13.text = '' ;
                txtItemSpecType14.text = '' ;
                txtItemSpecType15.text = '' ;
                txtItemSpecType16.text = '' ;
                txtItemSpecType17.text = '' ;
                txtItemSpecType18.text = '' ;
                txtItemSpecType19.text = '' ;
                txtItemSpecType20.text = '' ;   
                  
      
 }
 
 //---------------------------------------------------------

 function CheckSpec(p_oGrid)
 {
       Reset();
       
       for (var i=1; i<p_oGrid.rows; i++ )
       {         
                  if ( p_oGrid.GetGridData( i, G2_SPEC_ID) == '' && p_oGrid.GetGridData( i, G2_MANDATORY) == -1 && p_oGrid.GetGridData( i, G2_SPEC_TYPE) != 'ST' )
                  {
                     alert('Pls select Spec for ' + p_oGrid.GetGridData(i,6) );
                     return false ;
                  }
                  else if ( i == 1 )
                  {
                        txtItemSpecType01.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK01.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK01.text       = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  );  
                  }
                  else if ( i == 2 )
                  {
                        txtItemSpecType02.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK02.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK02.text       = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  ); 
                  }
                  else if ( i == 3 )
                  {
                        txtItemSpecType03.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK03.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK03.text = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  ); 
                  }
                  else if ( i == 4 )
                  {
                        txtItemSpecType04.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK04.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK04.text = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  ); 
                  }
                  else if ( i == 5 )
                  {
                        txtItemSpecType05.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK05.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK05.text = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  ); 
                  }
                  else if ( i == 6 )
                  {
                        txtItemSpecType06.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK06.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK06.text       = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  ); 
                  }
                  else if ( i == 7 )
                  {
                        txtItemSpecType07.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK07.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK07.text       = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  ); 
                  }
                  else if ( i == 8 )
                  {
                        txtItemSpecType08.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK08.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK08.text       = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  ); 
                  }
                  else if ( i == 9 )
                  {
                        txtItemSpecType09.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK09.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK09.text       = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  ); 
                  }
                  else if ( i == 10 )
                  {
                        txtItemSpecType10.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK10.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK10.text       = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  ); 
                  }     
                  else if ( i == 11 )
                  {
                        txtItemSpecType11.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK11.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK11.text       = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  ); 
                  }                  
                  else if ( i == 12 )
                  {
                        txtItemSpecType12.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK12.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK12.text       = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  ); 
                  }                  
                  else if ( i == 13 )
                  {
                        txtItemSpecType13.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK13.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK13.text       = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  ); 
                  }                  
                  else if ( i == 14 )
                  {
                        txtItemSpecType14.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK14.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK14.text       = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  ); 
                  }                  
                  else if ( i == 15 )
                  {
                        txtItemSpecType15.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK15.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK15.text       = p_oGrid.GetGridData( i, G2_SPEC_PK     );
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  );  
                  }                  
                  else if ( i == 16 )
                  {
                        txtItemSpecType16.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK16.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK16.text       = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  ); 
                  }                  
                  else if ( i == 17 )
                  {
                        txtItemSpecType17.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK17.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK17.text       = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  ); 
                  }                  
                  else if ( i == 18 )
                  {
                        txtItemSpecType18.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK18.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK18.text       = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  ); 
                  }                  
                  else if ( i == 19 )
                  {
                        txtItemSpecType19.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK19.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK19.text       = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  ); 
                  }                  
                  else if ( i == 20 )
                  {
                        txtItemSpecType20.text = p_oGrid.GetGridData( i, G2_SPEC_TYPE   );
                        txtItemSpecPK20.text   = p_oGrid.GetGridData( i, G2_ITEMSPEC_PK );
                        txtSpecPK20.text       = p_oGrid.GetGridData( i, G2_SPEC_PK     ); 
                        txtGroupPK.text  = p_oGrid.GetGridData( i, G2_GROUP_PK  ); 
                  }                                                 
       }
       return true ;  
 }
 //=================================================================================================

function GetSpec(p_querystring)
{
    var fpath = System.RootURL + "/form/fp/ab/fpab00540.aspx" + p_querystring;
    var aValue  = window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');	
	
	if ( aValue != null ) 
	{	
		grdSpecList.SetGridText( gPreviousRow, G2_SPEC_PK ,   aValue[1]);//spec_pk
		grdSpecList.SetGridText( gPreviousRow, G2_SPEC_ID ,   aValue[5]);//spec_id
		grdSpecList.SetGridText( gPreviousRow, G2_SPEC_NAME , aValue[6]);//spec_name	 
	}
}

 
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
      
       switch (oGrid.id)         
      {		        
              case "grdSpecList" :	
                gPreviousRow = grdSpecList.row;
                 var v_col = event.col;			
                if ( gPreviousRow > 0 && ( v_col == G2_SPEC_ID || v_col == G2_SPEC_NAME ) && grdSpecList.GetGridData( gPreviousRow, G2_SPEC_TYPE) == 'ITEM' )
                {
                    var queryString = "?pk=" + grdSpecList.GetGridData( gPreviousRow, G2_SPECGRP_PK )
                                             + "&spec_id="
                                             + url_encode(grdSpecList.GetGridData( gPreviousRow, G2_SPEC_ID ))                                           
                                             + "&spec_name="
                                             + url_encode(grdSpecList.GetGridData( gPreviousRow, G2_SPEC_NAME ));
                    GetSpec(queryString);                             
                }
             break;            
	                 
      }      
   
}
//------------------------------------------------------
var grdSpeck = ""

//=========================================================================================
function OnGridAfterEdit(oGrid)
{
    var v_col = event.col;
    var row = event.row;
    if ( oGrid.GetGridData(event.row,G2_SPEC_TYPE) == 'ST' )
		{
			oGrid.GetGridControl().Col = G2_SEQ; 	
		}
        else {
             if ( v_col == G2_SPEC_ID || v_col == G2_SPEC_NAME )
            {
                txt_tco_specgrp_pk.text = oGrid.GetGridData( row, G2_SPECGRP_PK );
                txtSpecID.text          = oGrid.GetGridData( row, G2_SPEC_ID    );
                txtSpecName.text        = oGrid.GetGridData( row, G2_SPEC_NAME  );
                       
                data_fphb00011_2.Call('SELECT');
            }
         }

}
//=========================================================================================
function OnBFEdit(oGrid)
{
	 switch (oGrid.id)         
     {
	 	case "grdSpecList":
			if ( grdSpecList.GetGridData(event.row,G2_SPEC_TYPE) == 'ST' )
			{
				grdSpecList.GetGridControl().Col = G2_SEQ; 
			}
		break;
	 }
}

//-----------------------------------------------------------------------------------------------

function OnDelete()
{

    if ( confirm ( "Do you want to delete this row?" ) )
    {
          grdItemList.DeleteRow()
    }

}

//-----------------------------------------------------------------------------------------------
function OnUnDelete()
{
          grdItemList.UnDeleteRow()

}
//================================================================================================
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
//================================================================================================

function OnSelectItem()
{
    var aValue = new Array();
        aValue[0] = grdItemList.GetGridData( grdItemList.row, G_ITEM_PK);
        aValue[1] = grdItemList.GetGridData( grdItemList.row, G_ITEM_CODE) 
        aValue[2] = grdItemList.GetGridData( grdItemList.row, G_ITEM_NAME) 
        aValue[3] = grdItemList.GetGridData( grdItemList.row, G_UOM) 
     window.returnValue = aValue; 
	 window.close();       
}

</script>

<body>
     
       <gw:data id="data_dsbs00212_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_dsbs00212_4" > 
                <input>
                  <input bind="txtItemSpecPK01" /> 
                    <input bind="txtItemSpecPK02" />
                    <input bind="txtItemSpecPK03" />
                    <input bind="txtItemSpecPK04" />
                    <input bind="txtItemSpecPK05" />
                    <input bind="txtItemSpecPK06" />
                    <input bind="txtItemSpecPK07" />
                    <input bind="txtItemSpecPK08" />
                    <input bind="txtItemSpecPK09" />
                    <input bind="txtItemSpecPK10" /> 
                    <input bind="txtItemSpecPK11" />
                    <input bind="txtItemSpecPK12" />
                    <input bind="txtItemSpecPK13" />
                    <input bind="txtItemSpecPK14" />
                    <input bind="txtItemSpecPK15" />
                    <input bind="txtItemSpecPK16" />
                    <input bind="txtItemSpecPK17" />
                    <input bind="txtItemSpecPK18" />
                    <input bind="txtItemSpecPK19" />
                    <input bind="txtItemSpecPK20" />               
                    <input bind="txtSpecPK01" /> 
                    <input bind="txtSpecPK02" />
                    <input bind="txtSpecPK03" />
                    <input bind="txtSpecPK04" />
                    <input bind="txtSpecPK05" />
                    <input bind="txtSpecPK06" />
                    <input bind="txtSpecPK07" />
                    <input bind="txtSpecPK08" />
                    <input bind="txtSpecPK09" />
                    <input bind="txtSpecPK10" />
                    <input bind="txtSpecPK11" />
                    <input bind="txtSpecPK12" />
                    <input bind="txtSpecPK13" />
                    <input bind="txtSpecPK14" />
                    <input bind="txtSpecPK15" />
                    <input bind="txtSpecPK16" />
                    <input bind="txtSpecPK17" />
                    <input bind="txtSpecPK18" />
                    <input bind="txtSpecPK19" />
                    <input bind="txtSpecPK20" />
                    <input bind="txtItemSpecType01" /> 
                    <input bind="txtItemSpecType02" />
                    <input bind="txtItemSpecType03" />
                    <input bind="txtItemSpecType04" />
                    <input bind="txtItemSpecType05" />
                    <input bind="txtItemSpecType06" />
                    <input bind="txtItemSpecType07" />
                    <input bind="txtItemSpecType08" />
                    <input bind="txtItemSpecType09" />
                    <input bind="txtItemSpecType10" />  
                    <input bind="txtItemSpecType11" /> 
                    <input bind="txtItemSpecType12" />
                    <input bind="txtItemSpecType13" />
                    <input bind="txtItemSpecType14" />
                    <input bind="txtItemSpecType15" />
                    <input bind="txtItemSpecType16" />
                    <input bind="txtItemSpecType17" />
                    <input bind="txtItemSpecType18" />
                    <input bind="txtItemSpecType19" />
                    <input bind="txtItemSpecType20" />                  
                    <input bind="txtGroupPK" />
                    <input bind="txtItemPK" />
                    <input bind="txtSTItemPK" />
                    <input bind="txtItemDesc" />
                </input> 
                <output>
                    <output bind="txtItemPK" />
                </output>  
            </dso> 
        </xml> 
    </gw:data>
   <!------------------------------------------------------------------>
    <gw:data id="data_fphb00011" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="<%=l_user%>lg_sel_fphb00011"  > 
                <input>
                    <input bind="txtSTItemPK" /> 
                    <input bind="txtItemPK" />                     
                </input> 
                <output bind="grdSpecList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fphb00011_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" parameter="0,1,2,3" function="<%=l_user%>lg_sel_fphb00011_1" procedure="<%=l_user%>lg_upd_fphb00011_1" > 
                <input>
					<input bind="txtSTItemPK" />
                    <input bind="txtItemSearch" />               
                </input> 
                <output bind="grdItemList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fphb00011_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="<%=l_user%>lg_sel_fphb00011_2"  > 
                <input>
                    <input bind="txt_tco_specgrp_pk" /> 
                    <input bind="txtSpecID" />
                    <input bind="txtSpecName" />
                </input> 
                <output bind="grdSpec" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
   
      <table style="height: 100%;width: 100%">
          <tr style="height:5%">
              <td style="width: 98%" colspan='5' align='left' >
                 <gw:label id="lblSTItem" styles='width:100%;color:cc0000;font:9pt' text=' --- ' />
              </td>
              <td align="right" style="width: 1%">
                  <gw:imgbtn img="new" alt="Add New" id="btnAddNew_1" onclick="AddOnClick(1)" />
              </td>
              <td align="right" style="width: 1%">
                  <gw:imgbtn img="process" alt="Create Item Code" id="btnSave_1" onclick="OnSave('grdSpecList')" />
              </td>
          </tr>
          <tr style="height: 45%">
              <td colspan="8">
                  <gw:grid id="grdSpecList" header="_tco_itemgrp_pk|Item Code|_tco_specgrp_pk|Seq|Spec Grp Nm|Spec Type|Mandatory|_tco_itemspec_pk|_tco_spec_pk|Spec ID|Spec Name"
                    format="0|0|0|0|0|0|3|0|0|0|0" aligns="0|0|0|1|0|1|0|0|0|0|0" defaults="||||||||||"
                    editcol="0|0|0|0|0|0|0|0|0|1|1" widths="0|2500|0|800|2500|1000|1200|0|0|1500|1000"
                    styles="width:100%; height:100%" sorting="T" acceptnulldate="true" 
                    oncelldblclick="OnGridCellDoubleClick(this)"
                    onafteredit="OnGridAfterEdit(this)" 
                    onbeforeedit="OnBFEdit(this)"
                    param="0,1,2,3,4,5,6,7,8,9,10" />
              </td>
          </tr>
           <tr style="height: 5%">
                <td style="width: 10%" align="right">
                    <b>Item</b>
                </td>
                <td style="width: 40%" >
                    <gw:textbox id="txtItemSearch" styles='width:100%' onenterkey="OnSearch('grdItemList')" />
                </td>
                <td style="width: 40%">
                </td>
                <td align="right" style="width: 1%">
                    <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('grdItemList')" />
                </td>
                <td align="right" style="width: 1%">
                    <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
                </td>
                <td align="right" style="width: 1%">
                    <gw:imgbtn img="udelete" alt="UnDelete" id="btnUnDelete" onclick="OnUnDelete()" />
                </td>
                <td align="right" style="width: 1%">
                    <gw:imgbtn img="Save" alt="Save" id="btnSave_2" onclick="OnSave('REPAIR-ITEM')" />
                </td>
            </tr>
            <tr style="height: 45%">
                <td colspan="7">
                    <gw:grid id="grdItemList" header="_PK|Item Code|Item Name|UOM" format="0|0|0|0" aligns="0|0|0|1"
                        editcol="0|1|1|0" widths="0|2000|5000|800" styles="width:100%; height:100%" sorting="T"
                        oncelldblclick="OnSelectItem()" oncellclick="OnSearch('ITEM_SPEC')" />
                </td>
            </tr>
      </table>
             
      <!------------------------------------------------------------------------>
    <gw:grid id="grdSpec" header="pk|spec_id|spec_nm|spec_lnm" format="0|0|0|0" aligns="0|0|0|0"
        defaults="|||" editcol="1|1|1|1" widths="0|0|0|0" styles="width:100%; height:200; display:none"
        sorting="F" param="0,1,2,3" />
       <gw:textbox id="txtSTMappingYN" maxlen="100" styles='width:100%;display:none' />
     <!------------------------------------------------------------------------>
    <gw:textbox id="txt_tco_itemgrp_pk" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txt_tco_specgrp_pk" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecID" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecName" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtParentSpecID" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtpur_yn" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtPage" styles="display: none" />
    <!------------------------------------------------------------------------>
     <gw:textbox id="txtItemPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSTItemPK_ForBOM" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtReturnItemPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnItemCode" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnItemName" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtReturnUOM" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtSTItemPK" maxlen="100" styles='width:100%;display:none' />
    
    <!------------------------------------------------------------------------>
    <gw:textbox id="txt_Tco_Item_PK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txt_StrLevel" styles='width:100%;display:none' />
    <gw:textbox id="txt_StrParent_PK" styles='width:100%;display:none' />
    <gw:textbox id="txt_StrChild_PK" styles='width:100%;display:none' />
    <gw:textbox id="txt_StrItem_PK" styles='width:100%;display:none' />
    <gw:textbox id="txt_StrItemUOM" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtSpecPK01" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK02" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK03" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK04" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK05" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK06" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK07" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK08" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK09" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK10" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK11" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK12" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK13" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK14" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK15" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK16" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK17" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK18" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK19" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK20" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtItemSpecPK01" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK02" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK03" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK04" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK05" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK06" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK07" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK08" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK09" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK10" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK11" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK12" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK13" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK14" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK15" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK16" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK17" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK18" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK19" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK20" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtItemSpecType01" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType02" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType03" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType04" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType05" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType06" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType07" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType08" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType09" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType10" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType11" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType12" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType13" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType14" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType15" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType16" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType17" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType18" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType19" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType20" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtGroupPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSTItemPK_Spec1" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemPK_Spec1" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemDesc" text="Auto create from ITEM BOM" styles='display:none' />
   </body>
</html>

