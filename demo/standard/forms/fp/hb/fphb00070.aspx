<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml"> 

<head  >
    <title>CREATE ITEM BOM</title>
</head>

<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

 var    vPage = 0 ;

 var    G1_PK            = 0 ,
        G1_ItemGroupPK   = 1 ,
        
        G1_STItemCode    = 7 ,
        G1_STItemName    = 8 ;
 
 var    G3_PK            = 0 ;
  
 var    G5_ItemGroupPK      = 0 ,
        G5_Grp_Code         = 1 ,
        G5_Grp_Name         = 2 ,
        G5_Item_Code        = 3 ,
        G5_tco_specgrp_pk   = 4 ,
        G5_Seq              = 5 ,
        G5_Spec_Grp_Nm      = 6 ,
        G5_Spec_Type        = 7 ,
        G5_Spec_Type_CODE   = 8 ,
        G5_Mandatory        = 9 ,
        G5_tco_itemspec_pk  = 10 ,
        G5_tco_spec_pk      = 11 , 
        G5_Spec_ID          = 12 ,
        G5_Spec_Name        = 13 , 
        G5_P_PK             = 14 , 
        G5_stmapping_yn     = 15 ;    
         
 var    G4_Level         = 0 ; 
        G4_ParentPK      = 1 ,
        G4_ItemPK        = 3 ,
        G4_STItemCode    = 4 ,
        G4_STItemName    = 5 ,
        G4_SourcingType  = 7 ,
        G4_ReqQty        = 9 ,
        G4_LossType      = 10 ,
        G4_LossRate      = 11 ,
        G4_LossBand1     = 12 ,
        G4_LossRate1     = 13 ,
        G4_LossBand2     = 14 ,
        G4_LossRate2     = 15 ,
        G4_Description   = 16 ,
        G4_tco_item_pk   = 17 ,
        G4_ItemCode      = 18 ,
        G4_ItemName      = 19 ,
        G4_UOM           = 20 ;        
        
 
function LoadDataPage(obj,init)
{
   if (obj.style.cursor == 'hand'||init==1)
   {
        switch(obj.id)
        {
            case 'page1':
                if (vPage>0)
                {
                    ObjectStatus(page1,0)
                    ObjectStatus(page2,1)
                    ObjectStatus(page3,1)
                    currentPage =1
                }
            break;
            case 'page2':
                ObjectStatus(page1,1)
                ObjectStatus(page2,0)
                ObjectStatus(page3,1)
                currentPage =2
            break;
            case 'page3':
                ObjectStatus(page1,1)
                ObjectStatus(page2,1)
                ObjectStatus(page3,0)
                currentPage =3
            break;
        }
        var page =  obj.innerText
        txtPage.text = page
        currentPage = page
        
        fphb00070_4.Call("SELECT");
    }
}
//---------------------------------------------------------------------------------------------------
function setPage(pPage)
{
     
        ObjectStatus(pagePrev,2)
        switch(vPage)
        {
            case 0:
                 page1.innerText = 1;
                 page2.innerText = "";
                 page3.innerText = "";
                 ObjectStatus(page1,2)
                 ObjectStatus(pageNext,2)
            break;   
            case 1:
                 page1.innerText = 1;
                 page2.innerText = "";
                 page3.innerText = "";
                 ObjectStatus(page1,0)   
                 ObjectStatus(pageNext,2)   
            break;   
            case 2:
                 page1.innerText = 1;
                 page2.innerText = 2;
                 page3.innerText = "";
                 ObjectStatus(pageNext,2)   
            break;
            case 3:
                 page1.innerText = 1;
                 page2.innerText = 2;
                 page3.innerText = 3;
                 ObjectStatus(pageNext,2)   
            break;
            default:
                page1.innerText = 1;
                page2.innerText = 2;
                page3.innerText = 3;
                ObjectStatus(pageNext,1)            
        }
}
function PrevPage()
{
     var lastPage =  page3.innerText
     var firstPage =  page1.innerText
      if(firstPage > 1 && pagePrev.style.cursor == 'hand')
      {
            page1.innerText = parseInt(page1.innerText + "") -1;
            page2.innerText = parseInt(page2.innerText+ "") -1;
            page3.innerText = parseInt(page3.innerText+ "") -1;
            CurrentState(page1)
            CurrentState(page2)
            CurrentState(page3)
            if (page3.innerText < vPage)
            {
                ObjectStatus(pageNext,1)
            }
             if (page1.innerText == 1)
            {
                ObjectStatus(pagePrev,2)
            }
        }
     
}
function NextPage()
{
  var lastPage =  page3.innerText
    if(lastPage < vPage && pageNext.style.cursor =='hand')
        {
            page1.innerText = parseInt(page1.innerText + "") +1;
            page2.innerText = parseInt(page2.innerText+ "") +1;
            page3.innerText = parseInt(page3.innerText+ "") +1;
            CurrentState(page1)
            CurrentState(page2)
            CurrentState(page3)
            if (page3.innerText==vPage)
            {
                ObjectStatus(pageNext,2)
                }
             if (page1.innerText != '1')
            {
                ObjectStatus(pagePrev,1)
            }
        }
    
}
function CurrentState(obj)
{
     if(obj.innerText == currentPage)
    {
          ObjectStatus(obj,0)
    }else
    {
        ObjectStatus(obj,1)
    }
}
function ObjectStatus(obj,status)
{
    if (status==0)
    {
        obj.style.cursor ='none';
        obj.style.color = 'red';
    }else
    {
        if (status==1)
        {
            obj.style.cursor ='hand';
            obj.style.color = 'blue';
        }else
        {
            obj.style.cursor ='none';
            obj.style.color = 'gray';
        }
    }
}

 //---------------------------------------------------------
 function BodyInit()
 {
        System.Translate(document);
       // OnToggle();
        //-------------------------	
	    setPage(vPage);
	    //-------------------------
        txtpur_yn.text = 'N';
        //----------------------
        BindingDataList();
        FormatGrid();
        
        MergeColumn();
        //----------------------
        
 } 

//-------------------------------------------------------------------------------------------
 function MergeColumn()
{
      grdSpecList.GetGridControl().MergeCells  = 2 ;	
      grdSpecList.GetGridControl().MergeCol(0) = true ;	
      grdSpecList.GetGridControl().MergeCol(1) = true ;   	
      grdSpecList.GetGridControl().MergeCol(2) = true ;	
      grdSpecList.GetGridControl().MergeCol(3) = true ;	
      
      grdSpecList2.GetGridControl().MergeCells  = 2 ;	
      grdSpecList2.GetGridControl().MergeCol(0) = true ;	
      grdSpecList2.GetGridControl().MergeCol(1) = true ;   	
      grdSpecList2.GetGridControl().MergeCol(2) = true ;	
      grdSpecList2.GetGridControl().MergeCol(3) = true ;	
      
}

//-------------------------------------------------------------------------------------------

 function FormatGrid()
 {    
        var data = "" ;  
          
        data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='PRAB0080' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " )%>" ; 
        grdBOM.SetComboFormat( G4_SourcingType, data);

        data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='PRAB0230' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " )%>" ; 
        grdBOM.SetComboFormat( G4_LossType, data);
 
        data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='PRAB0080' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " )%>" ; 
        grdBOM2.SetComboFormat( G4_SourcingType, data);

        data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='PRAB0230' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " )%>" ; 
        grdBOM2.SetComboFormat( G4_LossType, data);
    
        var trl = grdBOM.GetGridControl();
        
        trl.ColFormat(G4_ReqQty)              = "###,###,###,###,###.##";
        trl.ColFormat(G4_LossRate)            = "###,###,###,###,###.##";
        trl.ColFormat(G4_LossRate1)           = "###,###,###,###,###.##";
        trl.ColFormat(G4_LossRate2)           = "###,###,###,###,###.##";        
        
        trl = grdBOM2.GetGridControl();
        
        trl.ColFormat(G4_ReqQty)              = "###,###,###,###,###.##";
        trl.ColFormat(G4_LossRate)            = "###,###,###,###,###.##";
        trl.ColFormat(G4_LossRate1)           = "###,###,###,###,###.##";
        trl.ColFormat(G4_LossRate2)           = "###,###,###,###,###.##";        
        
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
        case 'grdBOM2' :
            if ( grdItemList.row > 0 )
            {
                txt_Tco_Item_PK.text = grdItemList.GetGridData( grdItemList.row, G3_PK );
            }
            else
            {
                txt_Tco_Item_PK.text = '' ;
            }    
            fphb00070_5.Call("SELECT");
        break;
      		        
        case 'grdSTItemList' :
            fphb00070.Call("SELECT");
        break;
 
        case 'grdItemList' :         
            if ( grdSTItemList.row > 0 )
            {
                txtSTItemPK.text    = grdSTItemList.GetGridData( grdSTItemList.row, G1_PK );
            } 
            else
            {
                txtSTItemPK.text    = '' ;
            }
            //--------------------------
            fphb00070_3.Call("SELECT");
        break; 
               
        case 'grdBOM' :         
            if ( grdSTItemList.row > 0 )
            {
                txtSTItemPK.text    = grdSTItemList.GetGridData( grdSTItemList.row, G1_PK );
            } 
            else
            {
                txtSTItemPK.text    = '' ;
            }
            //--------------------------
            fphb00070_1.Call("SELECT");
        break; 
        
        case 'grdSpecList2' :
            //--------------------------
            if ( grdBOM.row > 0 )
            {
                txtSTItemPK_ForBOM.text  = grdBOM.GetGridData( grdBOM.row, G4_ItemPK      );
                txtItemPK.text           = grdBOM.GetGridData( grdBOM.row, G4_tco_item_pk );
            }
            else
            {
                txtSTItemPK_ForBOM.text  = '' ;
                txtItemPK.text           = '' ;            
            }
            //--------------------------
            fphb00070_2.Call("SELECT");
        break;
        
        case 'grdSpecList':
            if ( grdSTItemList.row > 0 )
            {
                txtSTItemPK_Spec1.text = grdSTItemList.GetGridData( grdSTItemList.row, G1_PK          );
                txtGroupPK.text        = grdSTItemList.GetGridData( grdSTItemList.row, G1_ItemGroupPK );
            }
                        
            if ( grdItemList.row > 0 )
            {
                txtItemPK_Spec1.text = grdItemList.GetGridData(grdItemList.row,0);
            }
            else
            {
                txtItemPK_Spec1.text = '' ;
            }
            dsbs00012_1.Call('SELECT')
        break;        
          
      }  
 }
 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {
        case "fphb00070" :            
                if ( grdSTItemList.rows >= 2 )
	            {
      		           grdSTItemList.SetCellBgColor(1, G1_STItemCode, grdSTItemList.rows - 1, G1_STItemName, 0xd4d2ff );
                }
                //------------------
                OnSearch('grdItemList');            
        break;
        		        
        case "fphb00070_1" :
                //-----------------
                //---Set Color
	            if ( grdBOM.rows >= 2 )
	            {
      		        grdBOM.SetCellBgColor(1, G4_STItemCode, grdBOM.rows - 1, G4_STItemName, 0xd4d2ff );
      		        
      		        grdBOM.SetCellBgColor(1, G4_ItemCode,   grdBOM.rows - 1, G4_ItemName,   0xCCFFFF );
                }
                //-----------------
                //--- Set "level" for Grid
                var i,j ;
                var ctl = grdBOM.GetGridControl();
                var old_row = 0 ;
                
                ctl.OutlineBar = 5;

                for ( i = 1; i < grdBOM.rows; i++)              
                {   
                     j = Find_Heigher_Level(grdBOM.GetGridData(i, G4_Level), i);
                     
                     ctl.IsSubtotal(i)      = true;
                     ctl.RowOutlineLevel(i) = j;
                }
                //-----------
                OnSearch('grdSpecList');
        break;
 
        case "fphb00070_2" :            
                 if ( grdSpecList2.rows > 1 )
	             {
      		            grdSpecList2.SetCellBgColor(1, G5_Spec_ID, grdSpecList2.rows - 1, G5_Spec_Name, 0xCCFFFF );
                 }
                //------------------          
        break;

        case "fphb00070_3" :           
                //------------------
                vPage = Math.ceil(Number(lblRecord2.text) / 50) 
                setPage(vPage)
                lblRecord2.text = lblRecord2.text + " record(s)";
                txtPage.text = 1;
                page1.innerText = '1';
                currentPage = 1;
                LoadDataPage(page1,1) 
                //------------------          
        break;
         
        case "fphb00070_4" :            
                OnSearch('grdBOM');
                //------------------          
        break;
       
        case "pro_fphb00070" :            
                if ( grdBOM.row > 0 && txtReturnItemPK.text != '' )
                {
                    grdBOM.SetGridText( grdBOM.row, G4_tco_item_pk, txtReturnItemPK.text   );
                    grdBOM.SetGridText( grdBOM.row, G4_ItemCode,    txtReturnItemCode.text );
                    grdBOM.SetGridText( grdBOM.row, G4_ItemName,    txtReturnItemName.text );
                    grdBOM.SetGridText( grdBOM.row, G4_UOM,         txtReturnUOM.text      );
                    
                    OnSearch('grdSpecList2');
                }           
        break;
        case "pro_fphb00070_1":
            OnSearch('grdBOM2');
        break;
        case "fphb00070_5" :  
                //-----------------
                //---Set Color
	            if ( grdBOM2.rows >= 2 )
	            {
      		        grdBOM2.SetCellBgColor(1, G4_STItemCode, grdBOM2.rows - 1, G4_STItemName, 0xCCFFFF );      		        
                }
                //-----------------
                //--- Set "level" for Grid
                var i,j ;
                var ctl = grdBOM2.GetGridControl();
                
                ctl.OutlineBar = 5;

                for ( i = 1; i < grdBOM2.rows; i++)              
                { 
                
                    if ( grdBOM2.GetGridData( i, G4_Level) == "1" ) 
                    {
                        j = 0 ;
                    }    
                    else
                    {
                   
                        var t = i ;
                        while ( t>=1 )
                        {
                            if ( grdBOM2.GetGridData( t,G4_Level )== grdBOM2.GetGridData( i, G4_Level )-1 )
                            {
                                j = t;
                                //----
                                t = 1 ;
                            }    
                            t = t-1 ;
                        }
                        
                    }
                     
                    ctl.IsSubtotal(i)      = true;
                    ctl.RowOutlineLevel(i) = j;
                }
                //-----------
        break;
        case "dsbs00012_2" :
            txtItemPK_Spec1.text = '' ;
            dsbs00012_1.Call('SELECT');
        break;
        case "dsbs00012_1":
            if ( grdSpecList.rows > 1 )
	             {
      		            grdSpecList.SetCellBgColor(1, G5_Spec_ID, grdSpecList.rows - 1, G5_Spec_Name, 0xCCFFFF );
                 }
        break;
        //Call list of item after create new item
        case   "dsbs00012_4":
            OnSearch("grdItemList")
        break;
        //Auto find Spec if user input wrong spec id
         case "dsbs00012_3" :
            if(grdSpeck == "grdSpecList")
                FindSpec(grdSpecList)
            else if(grdSpeck == "grdSpecList2")
                FindSpec(grdSpecList2)
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
             txtItemPK_Spec1.text = '' ;
             dsbs00012_1.Call('SELECT');
        break;
      }  
 }
 

 //---------------------------------------------------------
 
 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 'grdSpecList2' :
                if ( CheckSpec(grdSpecList2) == true && grdSpecList2.rows > 1 )
                {
                    pro_fphb00070.Call();
                }
            break;
             case 'grdSpecList' :
                if ( CheckSpec(grdSpecList) == true && grdSpecList.rows > 1 )
                {
                    dsbs00012_4.Call();
                }
            break;
      }  
 }
 
  //---------------------------------------------------------
 function Reset(pos)
 {
      switch (pos)         
      {
            case 2 :
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
                  
        break;
      }
 }
 
 //---------------------------------------------------------

 function CheckSpec(p_oGrid)
 {
       Reset(2);
       
       for (var i=1; i<p_oGrid.rows; i++ )
       {   
          if ( p_oGrid.GetGridData(i, G5_tco_spec_pk) == '' && p_oGrid.GetGridData(i, G5_Mandatory ) == -1 && p_oGrid.GetGridData(i, G5_Spec_Type_CODE ) != 'ST' )
          {
             alert('Pls select Spec for ' + p_oGrid.GetGridData(i, G5_Spec_Grp_Nm) );
             return false ;
          }
          else if ( i == 1 )
          {
                txtItemSpecType01.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK01.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK01.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }
          else if ( i == 2 )
          {
                txtItemSpecType02.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK02.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK02.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }
          else if ( i == 3 )
          {
                txtItemSpecType03.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK03.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK03.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }
          else if ( i == 4 )
          {
                txtItemSpecType04.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK04.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK04.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }
          else if ( i == 5 )
          {
                txtItemSpecType05.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK05.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK05.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }
          else if ( i == 6 )
          {
                txtItemSpecType06.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK06.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK06.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }
          else if ( i == 7 )
          {
                txtItemSpecType07.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK07.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK07.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }
          else if ( i == 8 )
          {
                txtItemSpecType08.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK08.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK08.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }
          else if ( i == 9 )
          {
                txtItemSpecType09.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK09.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK09.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }
          else if ( i == 10 )
          {
                txtItemSpecType10.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK10.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK10.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }     
          else if ( i == 11 )
          {
                txtItemSpecType11.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK11.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK11.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }                  
          else if ( i == 12 )
          {
                txtItemSpecType12.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK12.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK12.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }                  
          else if ( i == 13 )
          {
                txtItemSpecType13.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK13.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK13.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }                  
          else if ( i == 14 )
          {
                txtItemSpecType14.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK14.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK14.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }                  
          else if ( i == 15 )
          {
                txtItemSpecType15.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK15.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK15.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }                  
          else if ( i == 16 )
          {
                txtItemSpecType16.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK16.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK16.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }                  
          else if ( i == 17 )
          {
                txtItemSpecType17.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK17.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK17.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }                  
          else if ( i == 18 )
          {
                txtItemSpecType18.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK18.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK18.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }                  
          else if ( i == 19 )
          {
                txtItemSpecType19.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK19.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK19.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }                  
          else if ( i == 20 )
          {
                txtItemSpecType20.text =  p_oGrid.GetGridData(i, G5_Spec_Type_CODE)
                txtItemSpecPK20.text   =  p_oGrid.GetGridData(i, G5_tco_itemspec_pk)
                txtSpecPK20.text       =  p_oGrid.GetGridData(i, G5_tco_spec_pk) 
          }                  
       }
       return true ;  
 }
 
//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdBOM" :
                var col = event.col ;
                var row = event.row ;
            
                if ( row >= 1 && ( col == G4_STItemCode || col == G4_STItemName || col == G4_ItemCode || col == G4_ItemName ) )
                {  
                    var fpath   = System.RootURL + "/form/fp/hb/fphb00071.aspx?ParentPK=" + grdBOM.GetGridData( row, G4_ParentPK ) + "&ChildPK=" + grdBOM.GetGridData( row, G4_ItemPK ) + "&Parent=" + grdSTItemList.GetGridData( grdSTItemList.row, G1_STItemCode ) + " - " + grdSTItemList.GetGridData( grdSTItemList.row, G1_STItemName ) + "&Child=" + grdBOM.GetGridData( row, G4_STItemCode ) + " - " + grdBOM.GetGridData( row, G4_STItemName );
                    var aValue  = System.OpenModal( fpath , 900 , 600 ,  'resizable:yes;status:yes' );	
                    	
                    if ( aValue != null ) 
                    {	
	                    grdBOM.SetGridText( row, G4_tco_item_pk, aValue[11]);//tco_item_pk
	                    grdBOM.SetGridText( row, G4_ItemCode,    aValue[12]);//Item Code
	                    grdBOM.SetGridText( row, G4_ItemName,    aValue[13]);//Item Name
	                    grdBOM.SetGridText( row, G4_UOM,         aValue[14]);//UOM
                    } 
                }               
	        break;   
	        
            case "grdSpecList2" :
                var col = event.col ;
                var row = event.row ;
                
                if ( row > 0 && ( col == 12 || col == 13 ) )
                {
                   
                    var queryString = "?pk=" + grdSpecList2.GetGridData( row, G5_tco_specgrp_pk )
                                             + "&spec_id="
                                             + grdSpecList2.GetGridData( row, G5_Spec_ID )
                                             + "&p_spec_id="
                                             + Get_Parent_Spec_ID(grdSpeck,grdSpecList2.GetGridData( row, G5_P_PK ))
                                             + "&spec_name="
                                             + grdSpecList2.GetGridData( row, G5_Spec_Name )
                                             + "&grp_pk="
                                             + grdSpecList2.GetGridData( row, G5_ItemGroupPK )
                                             + "&stmapping_yn="
                                             + grdSpecList2.GetGridData( row, G5_stmapping_yn )
                                             + "&tco_stitem_pk="
                                             + txtSTItemPK_ForBOM.text;
                    
                    var fpath = System.RootURL + "/form/fp/ab/fpab00540.aspx" + queryString + "&add_new_spec=No";
                    var aValue  = window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');	
                	
	                if ( aValue != null ) 
	                {	
		                grdSpecList2.SetGridText( row, G5_tco_spec_pk , aValue[1]);//spec_pk
		                grdSpecList2.SetGridText( row, G5_Spec_ID     , aValue[5]);//spec_id
		                grdSpecList2.SetGridText( row, G5_Spec_Name   , aValue[6]);//spec_name
	                }
                             
                }
	        break;  
	        case "grdSpecList" :
	            if ( event.row > 0 && ( event.col == 12 || event.col == 13 ) )
                {
                    gPreviousRow = event.row;
                    var queryString = "?pk=" + grdSpecList.GetGridData(gPreviousRow,4)
                                             + "&spec_id="
                                             + grdSpecList.GetGridData(gPreviousRow,12)
                                             + "&p_spec_id="
                                             + Get_Parent_Spec_ID(grdSpeck,grdSpecList.GetGridData(gPreviousRow,14))
                                             + "&spec_name="
                                             + grdSpecList.GetGridData(gPreviousRow,13)
                                             + "&grp_pk="
                                             + grdSpecList.GetGridData(gPreviousRow,0)
                                             + "&stmapping_yn="
                                             + grdSpecList.GetGridData(gPreviousRow,15)
                                             + "&tco_stitem_pk="
                                             + txtSTItemPK.text;
                    var fpath = System.RootURL + "/form/fp/ab/fpab00540.aspx" + queryString + "&add_new_spec=No";
                    var aValue  = window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');	
                   //aValue  = System.OpenModal( fpath ,500 , 600 ,  'resizable:yes' );	
                	
	                if ( aValue != null ) 
	                {	
		                grdSpecList.SetGridText(gPreviousRow,11 ,aValue[1]);//spec_pk
		                grdSpecList.SetGridText(gPreviousRow,12 ,aValue[5]);//spec_id
		                grdSpecList.SetGridText(gPreviousRow,13 ,aValue[6]);//spec_name
		                //AutoMakeName();
	                }                           
                }
            break;           
	                 
      }      
   
}
//------------------------------------------------------
var grdSpeck = ""
function OnGridAfterEdit(oGrid)
{
         grdSpeck = oGrid.id
         if ( event.col == 12 || event.col == 13  )
        {
            gPreviousRow = event.row ;
            
            txt_tco_specgrp_pk.text = oGrid.GetGridData(gPreviousRow, 4 );
            txt_tco_itemgrp_pk.text = oGrid.GetGridData(gPreviousRow, 0 );
            txtSpecID.text          = oGrid.GetGridData(gPreviousRow, 12);
            txtSpecName.text        = oGrid.GetGridData(gPreviousRow, 13);
            txtParentSpecID.text    = Get_Parent_Spec_ID(grdSpeck,grdSpecList.GetGridData(gPreviousRow,14));
            txtSTMappingYN.text     = oGrid.GetGridData(gPreviousRow, 15);
                   
            dsbs00012_3.Call('SELECT');
        }

}
//----------------------------------------------------------

function Get_Parent_Spec_ID(grid,p_spec_pk)
{
   for(var i = 1; i < grid.rows; i++ )
   {
      if(grid.GetGridData(i, G5_tco_specgrp_pk ) == p_spec_pk)
      {
            return grid.GetGridData(i, G5_Spec_ID ) ;
      }
   }
   return '' ;
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

//-----------------------------------------------------------------------------------------------

function OnProcess()
{
      if ( CheckProcess()==true && grdItemList.row > 0 )
      {
            txt_Tco_Item_PK.text = grdItemList.GetGridData( grdItemList.row, G3_PK );            
            pro_fphb00070_1.Call();
      }
}

//-----------------------------------------------------------------------------------------------

function CheckProcess()
{
    //-----------------------
    txt_StrLevel.text     = '' ;
    txt_StrParent_PK.text = '' ;
    txt_StrChild_PK.text  = '' ;
    txt_StrItem_PK.text   = '' ;
    txt_StrItemUOM.text   = '' ;
    //-----------------------
    for ( var i = 1 ; i < grdBOM.rows ; i++ )
    {
        if ( grdBOM.GetGridData( i, G4_tco_item_pk ) == '' )
        {
            alert('Pls select item for ' + grdBOM.GetGridData( i, G4_STItemName ) ) + ' !!!' ;
            return false ;
        }
        else
        {
            txt_StrLevel.text     = txt_StrLevel.text     + ',' + grdBOM.GetGridData( i, G4_Level       ) ;
            txt_StrParent_PK.text = txt_StrParent_PK.text + ',' + grdBOM.GetGridData( i, G4_ParentPK    ) ;
            txt_StrChild_PK.text  = txt_StrChild_PK.text  + ',' + grdBOM.GetGridData( i, G4_ItemPK      ) ;   
            txt_StrItem_PK.text   = txt_StrItem_PK.text   + ',' + grdBOM.GetGridData( i, G4_tco_item_pk ) ;
            txt_StrItemUOM.text   = txt_StrItemUOM.text   + ',' + grdBOM.GetGridData( i, G4_UOM         ) ;
        }        
    }
    return true;
}

//-----------------------------------------------------------------------------------------------

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="fphb00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="0" type="grid" user="prod" function="<%=l_user%>lg_sel_fphb00070" > 
                <input> 
                    <input bind="lstGroup" /> 
                    <input bind="txtSTItem_search" /> 
                    <input bind="txtpur_yn" />                                        
                </input> 
                <output bind="grdSTItemList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fphb00070_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod" function="<%=l_user%>lg_sel_fphb00070_1" > 
                <input> 
                    <input bind="txtSTItemPK" />                                        
                </input> 
                <output bind="grdBOM" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fphb00070_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" user="prod" function="<%=l_user%>lg_sel_fphb00070_2"  > 
                <input>
                    <input bind="txtSTItemPK_ForBOM" />
                    <input bind="txtItemPK" />
                </input> 
                <output bind="grdSpecList2" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="fphb00070_3" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso  type="process" procedure="<%=l_user%>lg_sel_fphb00070_3" > 
                  <input bind="idGrid" > 
                    <input bind="txtItem_search" />
                    <input bind="txtSTItemPK" />
                  </input> 
                  <output>
                    <output bind="lblRecord2" /> 
                  </output>
           </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fphb00070_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" user="prod" function="<%=l_user%>lg_sel_fphb00070_4"  > 
                <input>
                    <input bind="txtItem_search" />
                    <input bind="txtSTItemPK" />
                    <input bind="txtPage" />
                </input> 
                <output bind="grdItemList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------Search ITEM BOM----------------------------------->
    <gw:data id="fphb00070_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" user="prod" function="<%=l_user%>lg_sel_fphb00070_5"  > 
                <input>
                    <input bind="txt_Tco_Item_PK" />
                </input> 
                <output bind="grdBOM2" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_fphb00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fphb00070" > 
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
                    <input bind="txtItemPK" />
                    <input bind="txtSTItemPK_ForBOM" />
                </input> 
                <output>
                    <output bind="txtReturnItemPK" />
                    <output bind="txtReturnItemCode" />
                    <output bind="txtReturnItemName" />
                    <output bind="txtReturnUOM" />
                </output>            
            </dso> 
        </xml> 
    </gw:data>
     <!------------------------------------------------------------------>
    <gw:data id="dsbs00012_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_dsbs00012_4" > 
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
                    <input bind="txtItemPK_Spec1" />
                    <input bind="txtSTItemPK_Spec1" />
                    <input bind="txtItemDesc" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>            
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------Create BOM---------------------------------->
    <gw:data id="pro_fphb00070_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fphb00070_1" > 
                <input>
                    <input bind="txt_Tco_Item_PK" /> 
                    <input bind="txt_StrLevel" />
                    <input bind="txt_StrParent_PK" />
                    <input bind="txt_StrChild_PK" />
                    <input bind="txt_StrItem_PK" />
                    <input bind="txt_StrItemUOM" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>            
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------->
    <gw:data id="dsbs00012_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="<%=l_user%>lg_sel_dsbs00012_1"  > 
                <input>
                    <input bind="txtGroupPK" /> 
                    <input bind="txtItemPK_Spec1" />
                    <input bind="txtSTItemPK_Spec1" /> 
                </input> 
                <output bind="grdSpecList" /> 
            </dso> 
        </xml> 
    </gw:data>
     <!------------------------------------------------------------------>
    <gw:data id="dsbs00012_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="<%=l_user%>lg_sel_dsbs00012_3"  > 
                <input>
                    <input bind="txt_tco_specgrp_pk" /> 
                    <input bind="txt_tco_itemgrp_pk" />
                    <input bind="txtSpecID" />
                    <input bind="txtSpecName" />
                    <input bind="txtParentSpecID" />
                    <input bind="txtSTItemPK" />
                    <input bind="txtSTMappingYN" />
                </input> 
                <output bind="grdSpec" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 45%">
            <td style="width: 35%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
                        <td align="right" style="width: 10%">
                            <b>Group</b>
                        </td>
                        <td style="width: 35%">
                            <gw:list id="lstGroup" styles='width:100%' onchange="OnSearch('grdSTItemList')" />
                        </td>
                        <td align='right' style="width: 10%">
                            <b>Item</b>
                        </td>
                        <td style="width: 40%">
                            <gw:textbox id="txtSTItem_search" styles='width:100%' onenterkey="OnSearch('grdSTItemList')" />
                        </td>
                        <td align="right" style="width: 5%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch_1" onclick="OnSearch('grdSTItemList')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="5">
                            <gw:grid id="grdSTItemList" header="_PK|_tco_itemgrp_pk|_Group Code|_Group Name|_Model|_Item Type ID|_Item Type Name|ST Item Code|ST Item Name|UOM|Remark"
                                format="0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|1|0|1|0" defaults="|||||||||||"
                                editcol="0|0|0|0|0|0|0|0|0|0|0" widths="0|0|1200|1200|2000|1400|1500|1500|3000|800|0"
                                styles="width:100%; height:100%" sorting="T" acceptnulldate="true" param="0,1,2,3,4,5,6,7,8,9,10,11"
                                oncellclick="OnSearch('grdItemList')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 30%">
                <table style="height: 100%">
                    <tr style="height: 5%">
                        <td style="width: 90%"></td>
                        <td align="right" style="width: 5%">
                            <gw:imgbtn img="new" alt="Add New" id="btnAddNew_1" onclick="AddOnClick(1)" />
                        </td>
                        <td align="right" style="width: 5%">
                            <gw:imgbtn img="save" alt="Create Item Code" id="btnSave_1" onclick="OnSave('grdSpecList')" />
                        </td>
                    </tr>
                    <tr style="height: 95%">
                        <td colspan="3">
                            <gw:grid id="grdSpecList" header="_tco_itemgrp_pk|_Grp Code|_Grp Name|_Item Code|_tco_specgrp_pk|Seq|Spec Grp Nm|Spec Type|_Spec Type CODE|Mandatory|_tco_itemspec_pk|_tco_spec_pk|Spec ID|Spec Name|_P_PK|_stmapping_yn"
                                format="0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                defaults="|||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|1|1|0|0" widths="0|0|0|2500|0|800|2000|2000|0|0|0|0|0|0|0|0"
                                styles="width:100%; height:100%" sorting="T" acceptnulldate="true" oncelldblclick="OnGridCellDoubleClick(this)"
                                onafteredit="OnGridAfterEdit(this)" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 35%">
                <table width="100%" style="height: 100%">
                    <tr align="right" style="height: 2%">
                        <td style="width: 10%;" align="right">
                            Item
                        </td>
                        <td style="width: 45%;" align="right">
                            <gw:textbox id="txtItem_search" styles='width:100%' onenterkey="OnSearch('grdItemList')" />
                        </td>
                        <td style="width: 30%;" align="center">
                            <gw:label id="lblRecord2" styles="color: blue">record(s)</gw:label>
                        </td>
                        <td style="width: 3%;" align="right">
                            <b id="pagePrev" style="color: Blue; cursor: hand" onclick="PrevPage()"><u><< </u></b>
                        </td>
                        <td width="3%" align="center" style="color: gray; cursor: none">
                            <b><u id="page1" style="color: Blue; cursor: hand" onclick="LoadDataPage(this,0)">1
                            </u></b>
                        </td>
                        <td width="3%" align="center">
                            <b><u style="color: Blue; cursor: hand" onclick="LoadDataPage(this,0)" id="page2"></u>
                            </b>
                        </td>
                        <td width="3%" align="center">
                            <b><u id="page3" style="color: Blue; cursor: hand;" onclick="LoadDataPage(this,0)"></u>
                            </b>
                        </td>
                        <td style="width: 3%;" align="left">
                            <b id="pageNext" style="color: gray; cursor: none" onclick="NextPage()"><u>>> </u></b>
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="8">
                            <gw:grid id="grdItemList" header="_PK|Item Code|Item Name|_Local Item Name|_Foreign name|Unit|_Quantity|Price|_LisPrice|_StPrice|_LmPrice|_MkPrice|_pur_type|_volume|_tin_warehouse_pk|_partner_pk|_partner_id|_partner_name|Description"
                                format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                defaults="|||||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                widths="0|1500|3000|2500|1500|800|0|0|0|0|0|0|0|0|0|0|0|0|0" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2,3,4,5,5,6,7" oncelldblclick="OnGridCellDoubleClick(this)"
                                oncellclick="OnSearch('grdBOM2')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 55%">
            <td colspan="3">
                <table style="height: 100%; width: 100%" border=1 cellpadding=0; cellspacing=0>
                    <tr>
                        <td style="width: 50%" id="i_left">
                            <gw:grid id='grdBOM' header='Level|_PARENT_PK|Seq|_ITEM_PK|Item Code|Item Name|UOM|_Sourcing Type|_Phantom_YN|Req Qty|Loss Type|Loss Rate|_Loss Band1|_Loss Rate1|_Loss Band2|_Loss Rate2|_Description|_tco_item_pk|Item Code|Item Name|UOM'
                                format='0|0|0|0|0|0|0|0|3|1|0|1|0|1|0|1|0|0|0|0|0' aligns='0|0|1|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|1'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='800|0|600|0|1500|2000|600|1500|1000|1000|1000|1000|1500|1500|1500|1500|2000|1000|1200|1500|600'
                                sorting='T' styles='width:100%; height:100%' oncelldblclick="OnGridCellDoubleClick(this)"
                                oncellclick="OnSearch('grdSpecList2')" />
                        </td>
                            <td style="width: 50%;height:100%" >
                             <gw:tab id="tab"  > 
                                    
                                    <table name="Item BOM" style="height: 100%; width: 100%" >
                                            <tr style="height: 2%">
                                                <td align="left" style="width: 2%">
                                                    <gw:imgbtn img="process" alt="Process" id="btnProcess" onclick="OnProcess()" />
                                                </td>
                                                <td align="right" style="width: 2%">
                                                </td>
                                                <td align="right" style="width: 98%">
                                                </td>
                                            </tr>
                                            <tr style="height: 98%">
                                                <td colspan="3">
                                                    <gw:grid id='grdBOM2' header='Level|_PARENT_PK|Seq|_ITEM_PK|Item Code|Item Name|UOM|_Sourcing Type|_Phantom_YN|Req Qty|Loss Type|Loss Rate|_Loss Band1|_Loss Rate1|_Loss Band2|_Loss Rate2|_Description'
                                                        format='0|0|0|0|0|0|0|0|3|1|0|1|0|1|0|1|0' aligns='0|0|1|0|0|0|1|0|0|0|0|0|0|0|0|0|0'
                                                        editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' widths='800|0|600|0|1500|2000|600|1500|1000|1000|1000|1000|1500|1500|1500|1500|2000'
                                                        sorting='T' styles='width:100%; height:100%' />
                                                </td>
                                            </tr>
                                         </table>
                                          <table name="Create Item" style="height: 100%; width: 100%" >
                                            <tr style="height: 2%">
                                                <td align="right" style="width: 98%">
                                                </td>
                                                <td align="right" style="width: 2%">
                                                    <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="" />
                                                </td>
                                                <td align="right" style="width: 2%">
                                                    <gw:imgbtn img="save" alt="Save" id="btnSave" onclick="OnSave('grdSpecList2')" />
                                                </td>
                                            </tr>
                                            <tr style="height: 98%">
                                                <td colspan="3">
                                                    <gw:grid id="grdSpecList2" header="_tco_itemgrp_pk|_Grp Code|_Grp Name|Item Code|_tco_specgrp_pk|Seq|Spec Grp Nm|Spec Type|_Spec Type CODE|Mandatory|_tco_itemspec_pk|_tco_spec_pk|Spec ID|Spec Name|_P_PK|_stmapping_yn"
                                                        format="0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                                        defaults="|||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|1|1|0|0" widths="0|0|0|1500|0|800|2000|2000|0|0|0|0|1500|0|0|0"
                                                        styles="width:100%; height:100%" sorting="T" oncelldblclick="OnGridCellDoubleClick(this)"
                                                        onafteredit="OnGridAfterEdit(this)" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" />
                                                </td>
                                            </tr>
                                        </table>
                             </gw:tab>
                        </td>
                       
                    </tr>
                </table>
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
