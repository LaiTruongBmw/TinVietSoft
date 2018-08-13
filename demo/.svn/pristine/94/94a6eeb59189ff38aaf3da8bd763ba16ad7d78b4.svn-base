<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>POP UP CREATE ITEM</title>
</head>

<script>
  
  var   G_PK                = 0,
        G_Item_Code         = 1,
        G_Item_Name         = 2,
        G_Local_Item_Name   = 3,
        G_Foreign_name      = 4,
        G_Unit              = 5,
        G_Lot_Qty           = 6,
        G_Price             = 7,
        G_LisPrice          = 8,
        G_StPrice           = 9,
        G_LmPrice           = 10,
        G_MkPrice           = 11,
        G_pur_type          = 12,
        G_volume            = 13,
        G_tin_warehouse_pk  = 14,
        G_partner_pk        = 15,
        G_partner_id        = 16,
        G_partner_name      = 17,
        G_Description       = 18,
        G_cnv_ratio         = 19,
        G_hs_code           = 20,
        G_uom_packing       = 21,
        G_pack_rate         = 22, 
        G_Lot_UOM           = 23,
        G_UOM_Weight        = 24,
        G_Lot_Weight        = 25;
  
 //---------------------------------------------------------
 function OnToggle()
 {
    var top  = document.all("top");    
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        top.style.display="none";       
        imgArrow.status = "collapse";
        imgArrow.src = "../../../../system/images/down.gif";
    }
    else
    {
        top.style.display="";
        imgArrow.status = "expand";
        imgArrow.src = "../../../../system/images/up.gif";
    }
 }

 //---------------------------------------------------------
 function BodyInit()
 {
    
       //-------------------------
    var p_group_type = "<%=Request.querystring("group_type")%>";
    var data = "";  
    
    data = "<%=CtlLib.SetListDataSQLPara("select pk, grp_nm from comm.tco_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and (PROD_YN ={0} or SALE_YN ={1} or MAT_YN ={2} or SUB_MAT_YN ={3} or SEMI_PROD_YN ={4} or PUR_YN ={5}) order by grp_nm ", Request.querystring("group_type")) %>";     
    lstGroup.SetDataText(data);   
    
    //-------------------------   
       
       
        var type = "<%=request.QueryString("type") %>"  ;
        var p_yn = "<%=Request.querystring("purchase_yn")%>";
        
        txtpur_yn.text = p_yn;
        //---------------------------
        System.Translate(document);  // Translate to language session
        //----------------------
        BindingDataList();
        MergeColumn();
        //----------------------
        txtItemDesc.text="Auto create from " + type;
        
        var po_date  = "<%=request.QueryString("po_date")%>";
        var currency = "<%=request.QueryString("currency")%>";
    
        txtPO_date.value = po_date; 
        txtCurr.text     = currency;
 } 

//-------------------------------------------------------------------------------------------
 function MergeColumn()
{
      grdSpecList.GetGridControl().MergeCells  = 2 ;	
      grdSpecList.GetGridControl().MergeCol(0) = true ;	
      grdSpecList.GetGridControl().MergeCol(1) = true ;   	
      grdSpecList.GetGridControl().MergeCol(2) = true ;	
      grdSpecList.GetGridControl().MergeCol(3) = true ;	
}

 //---------------------------------------------------------
 function SetStatus(pos)
 {
      switch (pos)         
      {		        
        case 1 :
            btnUnDeleteDetail.SetEnable(false);
            btnDeleteDetail.SetEnable(false);
            txtBillToCode.SetEnable(false);
            txtBillToName.SetEnable(false);
            txtDeliToCode.SetEnable(false);
            txtDeliToName.SetEnable(false);
            txtDeliLoc.SetEnable(false);
            txtEmpCode.SetEnable(false);
            txtEmpName.SetEnable(false);
        break;
      }  
 } 
 //--------------------------------------------------------- 
 function setColor()
 {
     var ctrl = grdSTItemList.GetGridControl()
     
	if ( ctrl.rows >= 2 )
	{
      		grdSTItemList.SetCellBgColor(1, 7, ctrl.rows - 1, 7, 0xd4d2ff );
      		grdSTItemList.SetCellBgColor(1, 8, ctrl.rows - 1, 8, 0xd4d2ff );
    }
 }
 //---------------------------------------------------------
 function BindingDataList()
 {    
        var data="";  
        
        if ( txtpur_yn.text == 'Y' )
        {
            data = "<%=CtlLib.SetListDataSQL("SELECT pk, grp_cd || ' - ' || grp_nm FROM comm.tco_itemgrp WHERE del_if = 0 AND leaf_yn = 'Y' AND prod_yn = 'N' ANd pur_yn = 'Y' union all select 0, 'Select All' from dual ") %>" ;    
        }    
        else
        {
            data = "<%=CtlLib.SetListDataSQL("SELECT pk, grp_cd || ' - ' || grp_nm FROM comm.tco_itemgrp WHERE del_if = 0 AND leaf_yn = 'Y'  and pur_yn='N' union all select 0, 'Select All' from dual ") %>" ;    
        }    
            
        lstGroup.SetDataText(data);
        lstGroup.value = 0 ;
 }        
 //---------------------------------------------------------
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
        case 1 :
            dsbs00012.Call("SELECT");
        break;
        case 2 :         
            if ( grdSTItemList.row > 0 )
            {
                txtSTItemPK.text   = grdSTItemList.GetGridData( grdSTItemList.row, 0);
                txtGroupPK.text    = grdSTItemList.GetGridData( grdSTItemList.row, 1);
                lblGroupName.text  = grdSTItemList.GetGridData( grdSTItemList.row, 3);
                lblSTItemCode.text = grdSTItemList.GetGridData( grdSTItemList.row, 7);
                lblSTItemName.text = grdSTItemList.GetGridData( grdSTItemList.row, 8);
                dsbs00012_2.Call("SELECT");
            } 
            else
            {
                alert('Pls Select 1 ST Item !!!');
            }                       
        break;   
        case 3 :         
            if ( grdSTItemList.row > 0 )
            {
                txtSTItemPK.text   = grdSTItemList.GetGridData( grdSTItemList.row, 0);
                txtGroupPK.text    = grdSTItemList.GetGridData( grdSTItemList.row, 1);
                lblGroupName.text  = grdSTItemList.GetGridData( grdSTItemList.row, 3);
                lblSTItemCode.text = grdSTItemList.GetGridData( grdSTItemList.row, 7);
                lblSTItemName.text = grdSTItemList.GetGridData( grdSTItemList.row, 8);
                if ( grdItemList.row > 0 )
                {
                    txtItemPK.text = grdItemList.GetGridData(grdItemList.row,0);
                }
                else
                {
                    txtItemPK.text = '' ;
                }
                dsbs00012_1.Call("SELECT");
            } 
            else
            {
                alert('Pls Select 1 ST Item !!!');
            }                       
        break;             
      }  
 }

 //---------------------------------------------------------
 function Reset(pos)
 {
      switch (pos)         
      {
        case 1 :
            txtGroupPK.text = '' ;
            txtItemPK.text = '' ; 
            lblGroupName.text = ' --- ' ; 
            lblSTItemCode.text = ' --- ' ; 
            lblSTItemName.text = ' --- ' ;      
        break;
        case 2 :
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
 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {
        case "dsbs00012" :
            Reset(1);
            setColor()
            dsbs00012_2.Call('SELECT');
        break;
        		        
        case "dsbs00012_3" :

            if ( grdSpec.rows > 2 || grdSpec.rows < 2 )
            {
                var queryString = "?pk=" + txt_tco_specgrp_pk.text
                                         + "&spec_id="
                                         + txtSpecID.text
                                         + "&p_spec_id="                                         
                                         + txtParentSpecID.text
                                         + "&spec_name="
                                         + txtSpecName.text
                                         + "&grp_pk="
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
                                        
                GetSpec(queryString); 
            }
            else
            {
                if ( gPreviousRow > 0 )
                {
		            grdSpecList.SetGridText( gPreviousRow, 11, grdSpec.GetGridData( 1, 0) );//spec_pk
		            grdSpecList.SetGridText( gPreviousRow, 12, grdSpec.GetGridData( 1, 1) );//spec_id
		            grdSpecList.SetGridText( gPreviousRow, 13, grdSpec.GetGridData( 1, 2) );//spec_name
		        }
		        grdSpec.ClearData();
		        gPreviousRow = -1 ;
            }
        break;

        case "dsbs00012_4" :
            dsbs00012_2.Call('SELECT');
        break;
        
        case "dsbs00012_2" :
            txtItemPK.text = '' ;
            dsbs00012_1.Call('SELECT');
        break;
        
      }  
 }
 
 //---------------------------------------------------------
 function AddOnClick(pos)
 {
      switch (pos)         
      {		        
        case 1 :
            txtItemPK.text = '' ;
            dsbs00012_1.Call('SELECT');
        break;
      }  
 }
 

 //---------------------------------------------------------
 
 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 1 :
                if ( CheckSpec(grdSpecList) == true && grdSpecList.rows > 1 )
                {
                    dsbs00012_4.Call();
                }
            break;
            case 2 :
                    dsbs00012_2.Call();
            break;      
      }  
 }
 //---------------------------------------------------------

 function CheckSpec(p_oGrid)
 {
       Reset(2);
       
       for (var i=1; i<p_oGrid.rows; i++ )
       {   
       /* 
            if ( p_oGrid.GetGridData(i,8) != 'ST' ) 
            {
            */
                  if ( p_oGrid.GetGridData(i,11) == '' && p_oGrid.GetGridData(i,9) == -1 && p_oGrid.GetGridData(i,8) != 'ST' )
                  {
                     alert('Pls select Spec for ' + p_oGrid.GetGridData(i,6) );
                     return false ;
                  }
                  else if ( i == 1 )
                  {
                        txtItemSpecType01.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK01.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK01.text       =  p_oGrid.GetGridData(i,11) 
                  }
                  else if ( i == 2 )
                  {
                        txtItemSpecType02.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK02.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK02.text       =  p_oGrid.GetGridData(i,11) 
                  }
                  else if ( i == 3 )
                  {
                        txtItemSpecType03.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK03.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK03.text =  p_oGrid.GetGridData(i,11) 
                  }
                  else if ( i == 4 )
                  {
                        txtItemSpecType04.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK04.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK04.text =  p_oGrid.GetGridData(i,11) 
                  }
                  else if ( i == 5 )
                  {
                        txtItemSpecType05.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK05.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK05.text =  p_oGrid.GetGridData(i,11) 
                  }
                  else if ( i == 6 )
                  {
                        txtItemSpecType06.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK06.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK06.text       =  p_oGrid.GetGridData(i,11) 
                  }
                  else if ( i == 7 )
                  {
                        txtItemSpecType07.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK07.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK07.text       =  p_oGrid.GetGridData(i,11) 
                  }
                  else if ( i == 8 )
                  {
                        txtItemSpecType08.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK08.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK08.text       =  p_oGrid.GetGridData(i,11) 
                  }
                  else if ( i == 9 )
                  {
                        txtItemSpecType09.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK09.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK09.text       =  p_oGrid.GetGridData(i,11) 
                  }
                  else if ( i == 10 )
                  {
                        txtItemSpecType10.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK10.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK10.text       =  p_oGrid.GetGridData(i,11) 
                  }     
                  else if ( i == 11 )
                  {
                        txtItemSpecType11.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK11.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK11.text       =  p_oGrid.GetGridData(i,11) 
                  }                  
                  else if ( i == 12 )
                  {
                        txtItemSpecType12.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK12.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK12.text       =  p_oGrid.GetGridData(i,11) 
                  }                  
                  else if ( i == 13 )
                  {
                        txtItemSpecType13.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK13.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK13.text       =  p_oGrid.GetGridData(i,11) 
                  }                  
                  else if ( i == 14 )
                  {
                        txtItemSpecType14.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK14.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK14.text       =  p_oGrid.GetGridData(i,11) 
                  }                  
                  else if ( i == 15 )
                  {
                        txtItemSpecType15.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK15.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK15.text       =  p_oGrid.GetGridData(i,11) 
                  }                  
                  else if ( i == 16 )
                  {
                        txtItemSpecType16.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK16.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK16.text       =  p_oGrid.GetGridData(i,11) 
                  }                  
                  else if ( i == 17 )
                  {
                        txtItemSpecType17.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK17.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK17.text       =  p_oGrid.GetGridData(i,11) 
                  }                  
                  else if ( i == 18 )
                  {
                        txtItemSpecType18.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK18.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK18.text       =  p_oGrid.GetGridData(i,11) 
                  }                  
                  else if ( i == 19 )
                  {
                        txtItemSpecType19.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK19.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK19.text       =  p_oGrid.GetGridData(i,11) 
                  }                  
                  else if ( i == 20 )
                  {
                        txtItemSpecType20.text =  p_oGrid.GetGridData(i,8)
                        txtItemSpecPK20.text   =  p_oGrid.GetGridData(i,10)
                        txtSpecPK20.text       =  p_oGrid.GetGridData(i,11) 
                  }                  
                               
         /*   }  */
       }
       return true ;  
 }
 
//-------------------------------------------------------------------------------------------------
function OnRemove()
{
  if(grdItemSelect.row > 0)
  {
    var col_val = grdItemSelect.GetGridData(grdItemSelect.row,0);
    grdItemSelect.RemoveRowAt(grdItemSelect.row);
    SetRowBackGroundColor(grdItemList,col_val,0x000000); 
    countItem()
  }
}

//-------------------------------------------------------------------------------------------------
function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for (var i=1; i<p_oGrid.rows; i++ )
   {
      if ( p_oGrid.GetGridData(i,0) == p_col_val )
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}

//-------------------------------------------------------------------------------------------------
function CheckDataExist(p_oGrid,p_value)
{
  for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData(i,0) == p_value)
      {
         return true;
      }
   }
   return false;
}

//---------------------------------------------------------
    var gPreviousRow = -1 ;
//-------------------------------------------------------------------------------------------------
function OnGridAfterEdit(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdSpecList" :
                if ( event.col == 12 || event.col == 13 )
                {
                    gPreviousRow = event.row ;
                    
                    txt_tco_specgrp_pk.text = oGrid.GetGridData(gPreviousRow, 4 );
                    txt_tco_itemgrp_pk.text = oGrid.GetGridData(gPreviousRow, 0 );
                    txtSpecID.text          = oGrid.GetGridData(gPreviousRow, 12);
                    txtSpecName.text        = oGrid.GetGridData(gPreviousRow, 13);
                    txtParentSpecID.text    = Get_Parent_Spec_ID(grdSpecList.GetGridData(gPreviousRow,14));
                    txtSTMappingYN.text     = oGrid.GetGridData(gPreviousRow, 15);
                           
                    dsbs00012_3.Call('SELECT');
                }
            break;
      }      
}
//-------------------------------------------------------------------------------------------------
function OnBFEdit(oGrid)
{
	 switch (oGrid.id)         
     {
	 	case "grdSpecList":
			if ( grdSpecList.GetGridData(event.row,8) == 'ST' )
			{
				grdSpecList.GetGridControl().Col = 3; 
			}
		break;
	 }
}

//-------------------------------------------------------------------------------------------------
function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdItemList" :
            
                var col_val = oGrid.GetGridData(event.row,0);
                if ( event.row > 0 && ( !CheckDataExist(grdItemSelect,col_val) ) )
                {
                    SetRowBackGroundColor(oGrid,col_val,0x0000FF);
                    
		            grdItemSelect.AddRow();
            		
		            for(var i=0;i<oGrid.cols;i++)
		            {
		              grdItemSelect.SetGridText(grdItemSelect.rows-1,i,oGrid.GetGridData(event.row,i));
		            }
                 }

                countItem();
            break;
            
            case "grdSpecList" :
				gPreviousRow = 0 ;
				
                if ( event.row > 0 && ( event.col == 12 || event.col == 13 ) && grdSpecList.GetGridData(event.row,8) == 'ITEM' )
                {
                    gPreviousRow = event.row;
					  
                    var queryString = "?pk=" + grdSpecList.GetGridData(gPreviousRow,4)
                                             + "&spec_id="
                                             + grdSpecList.GetGridData(gPreviousRow,12)
                                             + "&p_spec_id="
                                             + Get_Parent_Spec_ID(grdSpecList.GetGridData(gPreviousRow,14))
                                             + "&spec_name="
                                             + grdSpecList.GetGridData(gPreviousRow,13)
                                             + "&grp_pk="
                                             + grdSpecList.GetGridData(gPreviousRow,0)
                                             + "&stmapping_yn="
                                             + grdSpecList.GetGridData(gPreviousRow,15)
                                             + "&tco_stitem_pk="
                                             + txtSTItemPK.text;
                    GetSpec(queryString);                             
                }
            break;
      }      
   
}

//----------------------------------------------------------

function Get_Parent_Spec_ID(p_spec_pk)
{
  for(var i = 1; i < grdSpecList.rows; i++ )
   {
      if(grdSpecList.GetGridData(i, 4) == p_spec_pk)
      {
            return grdSpecList.GetGridData(i, 12) ;
      }
   }
   return '' ;
}

//----------------------------------------------------------

function GetSpec(p_querystring)
{
    var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00540.aspx" + p_querystring + "&add_new_spec=No";
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

//------------------------------------------------------------------------------------------------
function countItem()
{
    txtCount.text=grdItemSelect.rows-1 + " item(s)."
}

//-----------------------------------------------------------------------------------------------
function OnSelect(oGrid)
{
   var arr_data = new Array();
   
   if(oGrid.rows > 1)
   {
   
      for(var i=1;i<oGrid.rows;i++)
      {
         var arrTemp=new Array();
         
         for(var j=0;j<oGrid.cols;j++)
         {
            arrTemp[arrTemp.length]= oGrid.GetGridData(i,j);
         }
         
         arr_data[arr_data.length]= arrTemp;
      }
      
	  if ( arr_data !=null )
	  {
		window.returnValue =  arr_data;
		window.close();
	  }
	  else
	  {
	    alert("You have not selected data yet.");
	  }
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

//-----------------------------------------------------------------------------------------------
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00012" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="sale.sp_sel_dsbs00012" > 
                <input> 
                    <input bind="lstGroup" /> 
                    <input bind="txtSTItemCode_search" /> 
                    <input bind="txtpur_yn" />                                        
                </input> 
                <output bind="grdSTItemList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00012_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="sale.sp_sel_dsbs00012_1"  > 
                <input>
                    <input bind="txtGroupPK" /> 
                    <input bind="txtItemPK" />
                    <input bind="txtSTItemPK" /> 
                </input> 
                <output bind="grdSpecList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00012_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" parameter="0,6,23,24,25" function="sale.sp_sel_dsbs00012_2" procedure="sale.sp_upd_dsbs00012_2" > 
                <input>
                    <input bind="txtBussinessPartner_PK" /> 
                    <input bind="txtItemCode_search" /> 
                    <input bind="txtSTItemPK" />  
                    <input bind="txtPO_date" />
                    <input bind="txtCurr" />                   
                </input> 
                <output bind="grdItemList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00012_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="sale.sp_sel_dsbs00012_3"  > 
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
    <gw:data id="dsbs00012_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="sale.sp_pro_dsbs00012_4" > 
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
                    <output bind="txtReturnValue" />
                </output>            
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table cellpadding="0" cellspacing="0" border="1" style="height: 100%; width: 100%">
        <tr id='top'>
            <td style="height: 25%">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 15%">
                            <b>Group</b>
                        </td>
                        <td style="width: 35%">
                            <gw:list id="lstGroup" styles='width:100%' onchange="OnSearch(1)" />
                        </td>
                        <td align='right' style="width: 15%">
                            <b>Item</b>
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtSTItemCode_search" styles='width:100%' onenterkey="OnSearch(1)" />
                        </td>
                        <td align="right" style="width: 5%">
                            <gw:button img="search" alt="Search" id="btnSearch_1" onclick="OnSearch(1)" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="5">
                            <gw:grid id="grdSTItemList" header="_PK|_tco_itemgrp_pk|_Group Code|_Group Name|Model|_Item Type ID|_Item Type Name|ST Item Code|ST Item Name|UOM|Remark"
                                format="0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|1|0|1|0" defaults="|||||||||||"
                                editcol="0|0|0|0|0|0|0|0|0|0|0" widths="0|0|1200|1200|2000|1400|1500|1500|3500|800|0"
                                styles="width:100%; height:100%" sorting="T" acceptnulldate="true" param="0,1,2,3,4,5,6,7,8,9,10,11"
                                oncellclick="OnSearch(2)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 25%">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td align='right' style="width: 10%">
                            <b>Group :</b>
                        </td>
                        <td style="width: 15%">
                            <gw:label id="lblGroupName" styles='width:100%;color:cc0000;font:9pt' text=' --- ' />
                        </td>
                        <td align='right' style="width: 15%">
                            <b>ST Item Code :</b>
                        </td>
                        <td style="width: 15%">
                            <gw:label id="lblSTItemCode" styles='width:100%;color:cc0000;font:9pt' text=' --- ' />
                        </td>
                        <td align='right' style="width: 15%">
                            <b>ST Item Name :</b>
                        </td>
                        <td style="width: 28%">
                            <gw:label id="lblSTItemName" styles='width:100%;color:cc0000;font:9pt' text=' --- ' />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:button img="new" alt="Add New" id="btnAddNew_1" onclick="AddOnClick(1)" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:button img="save" alt="Create Item Code" id="btnSave_1" onclick="OnSave(1)" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="8">
                            <gw:grid id="grdSpecList" header="_tco_itemgrp_pk|_Grp Code|_Grp Name|Item Code|_tco_specgrp_pk|Seq|Spec Grp Nm|Spec Type|_Spec Type CODE|Mandatory|_tco_itemspec_pk|_tco_spec_pk|Spec ID|Spec Name|_P_PK|_stmapping_yn"
                                format="0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0" aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                defaults="|||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|1|1|0|0" widths="0|0|0|2500|0|800|2000|2000|0|0|0|0|0|0|0|0"
                                styles="width:100%; height:100%" sorting="T" acceptnulldate="true" oncelldblclick="OnGridCellDoubleClick(this)"
                                onafteredit="OnGridAfterEdit(this)" onbeforeedit="OnBFEdit(this)" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 50%">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            <b>Item</b>
                        </td>
                        <td style="width: 60%" colspan="2">
                            <gw:textbox id="txtItemCode_search" styles='width:100%' onenterkey="OnSearch(2)" />
                        </td>
                        <td style="width: 16%">
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:button img="search" alt="Search" id="btnSearch" onclick="OnSearch(2)" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:button img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:button img="udelete" alt="UnDelete" id="btnUnDelete" onclick="OnUnDelete()" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:button img="Save" alt="Save" id="btnSave_2" onclick="OnSave(2)" />
                        </td>
                    </tr>
                    <tr style="height: 49%">
                        <td colspan="8">
                            <gw:grid id="grdItemList" header="_PK|Item Code|Item Name|_Local Item Name|_Foreign name|Unit|Lot Qty|Price|_LisPrice|_StPrice|_LmPrice|_MkPrice|_pur_type|_volume|_tin_warehouse_pk|_partner_pk|_partner_id|_partner_name|Description|_cnv_ratio|_hs_code|_uom_packing|_pack_rate|Lot UOM|UOM Weight|Lot Weight|Item Weight"
                                format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                                aligns="0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                editcol="0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|0" 
                                widths="0|2500|5000|2500|1500|800|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                styles="width:100%; height:100%" sorting="T" oncelldblclick="OnGridCellDoubleClick(this)"
                                oncellclick="OnSearch(3)" />
                                
                                <!-- 
                                <gw:grid id="grdItemList" 
                                header="_PK|Item Code|Item Name|_Local Item Name|_Foreign name|Unit|
                                        _Quantity|Price|_LisPrice|_StPrice|_LmPrice|
                                        _MkPrice|_pur_type|_volume|_tin_warehouse_pk|_partner_pk|
                                        _partner_id|_partner_name|Description|_cnv_ratio|_hs_code|
                                        _uom_packing|_pack_rate|Lot UOM|UOM Weight|Lot Weight"
                                format="0|0|0|0|0|
                                        0|0|0|0|0|
                                        0|0|0|0|0|
                                        0|0|0|0|0|
                                        0|0|0|0|0" 
                                aligns="0|0|0|0|0|
                                        1|0|0|0|0|
                                        0|0|0|0|0|
                                        0|0|0|0|0|
                                        0|0|0|0|0"
                               editcol="0|0|0|0|0|
                                        1|0|0|0|0|
                                        0|0|0|0|0|
                                        0|0|0|0|0|
                                        0|0|0|0|0" 
                                        widths="0|2500|5000|2500|1500|
                                                800|0|0|0|0|
                                                0|0|0|0|0|
                                                0|0|0|0|0|
                                                0|0|0|0|0"
                                styles="width:100%; height:100%" sorting="T" oncelldblclick="OnGridCellDoubleClick(this)"
                                oncellclick="OnSearch(3)" />
                                -->
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="6" align="center">
                            <gw:label id="txtCount" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:button id="ibtnRemove" img="cancel" alt="Remove" onclick="OnRemove()" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:button img="select" alt="Select" id="Select" onclick="OnSelect(grdItemSelect)" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="8">
                            <gw:grid id="grdItemSelect" header="_PK|Item Code|Item Name|_Local Item Name|_Foreign name|Unit|Lot Qty|Price|_LisPrice|_StPrice|_LmPrice|_MkPrice|_pur_type|_volume|_tin_warehouse_pk|_partner_pk|_partner_id|_partner_name|Description|_cnv_ratio|_hs_code|_uom_packing|_pack_rate|Lot UOM|UOM Weight|Lot Weight|Item Weight"
                                format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                                aligns="0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                                widths="0|2500|5000|2500|1500|800|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                styles="width:100%; height:100%" sorting="T" oncelldblclick="OnGridCellDoubleClick(this)"  />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------>
    <img status="expand" id="imgArrow" src="../../../../system/images/up.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!------------------------------------------------------------------------>
    <gw:grid id="grdSpec" header="pk|spec_id|spec_nm|spec_lnm|4|5|6|7|8|9|10|11" format="0|0|0|0|0|0|0|0|0|0|0|0"
        aligns="0|0|0|0|0|0|0|0|0|0|0|0" defaults="|||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0"
        widths="0|0|0|0|0|0|0|0|0|0|0|0" styles="width:100%; height:200; display:none"
        sorting="F" param="0,1,2,3,4,5,6,7,8,9,10,11" />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtGroupPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSTItemPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSTMappingYN" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtBussinessPartner_PK" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txt_tco_itemgrp_pk" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txt_tco_specgrp_pk" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecID" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecName" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtParentSpecID" maxlen="100" styles='width:100%;display:none' />
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
    <gw:textbox id="txtpur_yn" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtItemDesc" text="Auto create from PO" styles='display:none' />
    <gw:textbox id="txtPO_date" style="display: none" />
    <gw:textbox id="txtCurr" style="display: none" />
    <!------------------------------------------------------------------------>
</body>
</html>
