<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Material Booking</title>
</head>

<script>
 var  user_pk = "<%=Session("EMPLOYEE_PK")%>"  ;
 var  user_name = "<%=Session("USER_NAME")%>"  ;
  
/*grdSOCons*/
var so_Cons_qty         = 6,
    so_After_qty        = 7,
    so_Booked_qty       = 8,
    so_MR_qty           = 9,
    so_PO_qty           = 10,
    so_In_qty           = 11,
    so_Out_qty          = 12;
/*grdDetailCons*/
var  
    detail_sod_no       = 0,
    detail_mas_tbl      = 1,
    detail_mas_pk       = 2,
    detail_de_tbl       = 3,
    detail_de_pk        = 4,
    detail_prod_pk      = 5,
    detail_prod_code    = 6,
    detail_prod_nm      = 7,
    detail_prod_uom     = 8,
    detail_prod_qty     = 9,
    detail_mat_pk       = 10,
    detail_mat_code     = 11,
    detail_mat_nm       = 12,
    detail_mat_uom      = 13,
    detail_sourc_type   = 14,
    detail_BOM_Qty      = 15,
    detail_Cons_qty     = 16,
    detail_After_qty    = 17,
    detail_Booked_qty   = 18,
    detail_MR_qty       = 19,
    detail_PO_qty       = 20,
    detail_In_qty       = 21,
    detail_Out_qty      = 22;
    detail_PK           = 24;
    
/**********TAB 2**********/
/*grdCons_t2*/
var  
    t2_Cons_Sel             = 0,
    t2_Cons_PK              = 1,
    t2_Cons_SO_no           = 2,
    t2_Cons_prod_qty        = 11,
    t2_Cons_mat_code        = 13,
    t2_Cons_Cons_qty        = 16,
    t2_Cons_After_qty       = 17,
    t2_Cons_Booked_qty      = 18,
    t2_Cons_MR_qty          = 19,
    t2_Cons_PO_qty          = 20,
    t2_Cons_In_qty          = 21,
    t2_Cons_Out_qty         = 22;
/*grdBookingSt*/
var st_book_no          = 1,
    st_doc_date         = 2,
    st_status           = 3,
    st_tpr_matcons_pk   = 4,
    st_item_pk          = 5,
    st_item_code        = 6,
    st_item_nm          = 7,
    st_uom              = 8,
    st_lotno_pk         = 9,
    st_lotno            = 10,
    st_ref_qty          = 11,
    st_wh_pk            = 12,
    st_wh_id            = 13,
    st_wh_nm            = 14,
    st_book_dt          = 18,
    st_book_qty         = 19,
    st_emp_pk           = 21,
    st_emp_nm           = 23;   
    
/*grdBookingPo*/
var po_book_no          = 1,
    po_status           = 3,
    po_tpr_matcons_pk   = 4,
    po_tpr_purordd_pk   = 5,
    po_item_pk          = 6,
    po_item_code        = 7,
    po_item_nm          = 8,
    po_item_uom         = 9,
    po_book_qty         = 11,
    po_ref_no           = 13,
    po_refbuss_pk       = 14,
    po_buss_nm          = 15 ,
    po_ref_etd          = 16,
    po_ref_po_qty       = 17,
    po_ref_booked_qty   = 18,
    po_emp_pk           = 19,
    po_emp_nm           = 21;

//---------------------------------------------------------
 
function BodyInit()
{
     FormatGrid();
     //-------------------
     OnRadioChange(1);
     OnRadioChange(2);
     //-------------------    
     txtEmpPK.text = user_pk;
     //-------------------

}

//-----------------------------------------------------

function FormatGrid()
{
    var trl ;
    var data ;
    /*grdSOCons*/
    trl = grdSOCons.GetGridControl();
    trl.ColFormat(so_Cons_qty )                = "###,###,###,###,###.##";
    trl.ColFormat(so_After_qty )               = "###,###,###,###,###.##";
    trl.ColFormat(so_Booked_qty )              = "###,###,###,###,###.##";
    trl.ColFormat(so_MR_qty )                  = "###,###,###,###,###.##";
    trl.ColFormat(so_PO_qty )                  = "###,###,###,###,###.##";
    trl.ColFormat(so_In_qty )                  = "###,###,###,###,###.##";
    trl.ColFormat(so_Out_qty )                 = "###,###,###,###,###.##";
    trl.FrozenCols = 5;
    /*grdDetailCons*/
    trl = grdDetailCons.GetGridControl(); 
    trl.ColFormat(detail_BOM_Qty)             = "###,###,###,###,###.####";
    trl.ColFormat(detail_prod_qty)             = "###,###,###,###,###.##";
    trl.ColFormat(detail_Cons_qty)             = "###,###,###,###,###.##";
    trl.ColFormat(detail_After_qty)            = "###,###,###,###,###.##";
    trl.ColFormat(detail_Booked_qty)           = "###,###,###,###,###.##";
    trl.ColFormat(detail_MR_qty)               = "###,###,###,###,###.##";
    trl.ColFormat(detail_PO_qty)               = "###,###,###,###,###.##";
    trl.ColFormat(detail_In_qty)               = "###,###,###,###,###.##";
    trl.ColFormat(detail_Out_qty)              = "###,###,###,###,###.##";
    trl.MergeCells  = 2 ;
    trl.MergeCol(0) = true ;	
    trl.MergeCol(1) = true ; 
    trl.MergeCol(2) = true ;	
    trl.MergeCol(3) = true ; 
    trl.MergeCol(4) = true ;	
    trl.MergeCol(5) = true ; 
    trl.MergeCol(6) = true ;	
    trl.MergeCol(7) = true ; 
    trl.MergeCol(8) = true ; 
    trl.MergeCol(9) = true ; 
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TCO_ABCODE a, TCO_ABCODEGRP b WHERE  b.ID='PRAB0080' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " )%>" ; 
    grdDetailCons.SetComboFormat(detail_sourc_type,data);
    
    data = "<%=ESysLib.SetListDataFUNC("SELECT F_COMMONCODE('SAAB0080','','') FROM DUAL" )%>|ALL|Select ALL";    
    lstOrderStatus1.SetDataText(data);
    lstOrderStatus1.value = 'ALL' ;


    /*************************TAB 2*******************************/
    trl = grdCons_t2.GetGridControl(); 
    trl.ColFormat(t2_Cons_prod_qty)             = "###,###,###,###,###.##";
    trl.ColFormat(t2_Cons_Cons_qty)             = "###,###,###,###,###.##";
    trl.ColFormat(t2_Cons_After_qty)            = "###,###,###,###,###.##";
    trl.ColFormat(t2_Cons_Booked_qty)           = "###,###,###,###,###.##";
    trl.ColFormat(t2_Cons_MR_qty)               = "###,###,###,###,###.##";
    trl.ColFormat(t2_Cons_PO_qty)               = "###,###,###,###,###.##";
    trl.ColFormat(t2_Cons_In_qty)               = "###,###,###,###,###.##";
    trl.ColFormat(t2_Cons_Out_qty)              = "###,###,###,###,###.##";
    trl.FrozenCols = 1;
    /*grdBookingSt*/
    trl = grdBookingSt.GetGridControl(); 
    trl.ColFormat(st_book_qty)             = "###,###,###,###,###.##";
    trl.ColFormat(st_ref_qty)              = "###,###,###,###,###.##";
     /*grdBookingPO*/
    trl = grdBookingPO.GetGridControl(); 
    trl.ColFormat(po_book_qty)             = "###,###,###,###,###.##";
    trl.ColFormat(po_ref_po_qty)           = "###,###,###,###,###.##";
    trl.ColFormat(po_ref_booked_qty)       = "###,###,###,###,###.##";
       
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TCO_ABCODE a, TCO_ABCODEGRP b WHERE b.ID='PRAB0090' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> " ; 
    
    grdBookingSt.SetComboFormat(st_status, data); 
    grdBookingPO.SetComboFormat(po_status, data); 
   }
//----------------------------------------------------- 
   
 function OnProcess(id)
 {
    switch (id)
    {
        case 1:
             /*Make Consumption*/
              if ( grdSearch.row > 0 )
                {
                    txtOrderPK.text = grdSearch.GetGridData(grdSearch.row,0);
                }
             fpbp00090.Call();
        break;
        case 2:
             /*Create MR*/
              if ( grdSOCons.row > 0 )
                {
                    txtOrderPK.text = grdSearch.GetGridData(grdSearch.row,0);
                }
             fpbp00090_0.Call();
        break;
        
    }    
 }
 //-------------------------Insert new consumption for so detail---------------------------
function AddConsumption()
{
    if( grdDetailCons.rows > 1)
    {
        if(grdDetailCons.row > 0)
        {
           var sod_no,sod_pk,prod_pk, prod_code, prod_name, prod_uom, prod_qty
           
           sod_no    = grdDetailCons.GetGridData( grdDetailCons.row, detail_sod_no    );
           sod_pk    = grdDetailCons.GetGridData( grdDetailCons.row, detail_de_pk     );
           prod_pk   = grdDetailCons.GetGridData( grdDetailCons.row, detail_prod_pk   );
           prod_code = grdDetailCons.GetGridData( grdDetailCons.row, detail_prod_code );
           prod_name = grdDetailCons.GetGridData( grdDetailCons.row, detail_prod_nm   );
           prod_uom  = grdDetailCons.GetGridData( grdDetailCons.row, detail_prod_uom  );
           prod_qty  = grdDetailCons.GetGridData( grdDetailCons.row, detail_prod_qty  );
           /***************************/
            var path = System.RootURL + "/form/fp/ab/PopUpGetItem.aspx?";
	        var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	        var arrTemp;
	        if (obj!=null)
	        {
	            for(var i =0 ; i < obj.length; i++)
	            {
	                arrTemp = obj[i];
	                grdDetailCons.AddRow()
	                 
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_sod_no,  sod_no);
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_mas_tbl, 'TSA_SALEORDER');
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_mas_pk,  txtOrderPK.text);
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_de_tbl,  'TSA_SALEORDERD');
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_de_pk,   sod_pk);
	                
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_prod_pk,   prod_pk);
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_prod_code, prod_code);
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_prod_nm,   prod_name);
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_prod_uom,  prod_uom);
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_prod_qty,  prod_qty);
	                 
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_mat_pk,   arrTemp[0]);
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_mat_code, arrTemp[1]);
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_mat_nm,   arrTemp[2]);
	                grdDetailCons.SetGridText( grdDetailCons.rows-1, detail_mat_uom,  arrTemp[5]);
	                
                }
           }
        }else
        {
            alert("Please select product you want to insert consumption!!")
        }
        
    }
   
}
//-----------------------------------------------------
function OnRadioChange(obj)
 {
    switch(obj)
    {
        case 1:
             if(rbFlag.value==0)
            {
              tblSO.style.display       = "" ;
              tblSO.style.tblItem       = "none" ;
              btnSave.style.display     = "none" ;
              btnUDelete1.style.display = "none" ;
              btnDelete1.style.display  = "none" ;
              btnAdd1.style.display     = "none" ;
              idBtnBOM.style.display    = "none" ;
              idBtnCrtMR.style.display  = "" ;
              //------------
              sOI.style.color       = "";
              sSO.style.color       = "red";              
            }
            else
            {
              tblSO.style.display       ="none" ;
              tblSO.style.tblItem       ="" ;
              btnSave.style.display     ="" ;
              btnUDelete1.style.display ="" ;
              btnDelete1.style.display  ="" ;
              btnAdd1.style.display     ="" ;
              idBtnBOM.style.display    ="" ;
              idBtnCrtMR.style.display  ="none" ;
              //-------------
              sOI.style.color       = "red";
              sSO.style.color       = "";               
            }
            //----------
            OnSearch(2);
            //----------
        break;
        
        case 2:
             if(rbFlag_t2.value==0)
            {
              Stock.style.display   = "" ;
              PO.style.tblItem      = "none" ;
              
              sPO.style.color       = "";
              sST.style.color       = "red";
            }
            else
            {
              Stock.style.display   = "none" ;
              PO.style.tblItem      = "" ;
              
              sPO.style.color       = "red" ;   
              sST.style.color       = "";       
            }
            //---------
            OnSearch(5);
            //---------
        break;
    }
    
 } 
//-----------------------------------------------------

function OnSearch(pos)
{
    switch (pos)
    {
        case 1 ://Search SO
            dsbs00010.Call("SELECT")
        break;
        case 2 ://Search SO Consumption 
           if ( grdSearch.row > 0 )
                {
                    txtOrderPK.text = grdSearch.GetGridData(grdSearch.row,0);
                }
                if (rbFlag.value==0)//Search SO Consumption 
                {
                    fpbp00090_2.Call("SELECT")
                }else
                {
                    fpbp00090_1.Call("SELECT") //Search SO Detail Consumption
                }
        break;
         
        /*Tab 2*/
        case 4://Seach consumption
            fpbp00090_3.Call("SELECT");
        break;
        case 5: // Search Booking 
           if (grdCons_t2.row>0)
            txtConsumption_pk.text = grdCons_t2.GetGridData(grdCons_t2.row,t2_Cons_PK)
           if(event.col != t2_Cons_Sel)
           {
                if(rbFlag_t2.value==0)
                {
                    fpbp00090_4.Call("SELECT")
                }else
                {
                    fpbp00090_5.Call("SELECT")
                }
           }
        break;		
    }
}

//----------------------------------------------------- 
function OnPopup()
{
    /*TAB 2*/
   var path =""
   var obj = null
   var vid = rbFlag_t2.value;
   if (vid==0)// Get Item From Stock
   {
        var item_code =""
         if(grdCons_t2.row>0)
          {
                 item_code = grdCons_t2.GetGridData(grdCons_t2.row,t2_Cons_mat_code)
          }
           path = System.RootURL + "/form/fp/ab/PopUpGetCommonStock.aspx?purchase_yn=Y&item_code="+item_code;
	         obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( obj != null )
	         {	       
	            var index =0;
	            var request_qty,stock_qty
	            stock_qty =0
	            for( var i=1 ; i<grdCons_t2.rows  ; i++ )
	            {
	               
	                if(grdCons_t2.GetGridData(i,t2_Cons_Sel)==-1)
	                {
	                    if (Number(grdCons_t2.GetGridData(i,t2_Cons_Booked_qty)))
	                        request_qty = grdCons_t2.GetGridData(i,t2_Cons_After_qty) - grdCons_t2.GetGridData(i,t2_Cons_Booked_qty)
	                    else
	                     request_qty = grdCons_t2.GetGridData(i,t2_Cons_After_qty) 
	                     while(parseFloat(request_qty)>0)
	                     {
	                        if (index < obj.length)
	                         {
	                            var arrTemp = obj[index];
	                            if (parseFloat(stock_qty)<=0)
	                                stock_qty = arrTemp[9]
	                             if(parseFloat(stock_qty)>0)
    	                        {
    	                            grdBookingSt.AddRow();
    	                            grdBookingSt.SetGridText( grdBookingSt.rows -1, st_book_no ,grdCons_t2.GetGridData(i,t2_Cons_SO_no) );
    	                            grdBookingSt.SetGridText( grdBookingSt.rows -1, st_status ,"WT" );
    	                            grdBookingSt.SetGridText( grdBookingSt.rows -1, st_tpr_matcons_pk,grdCons_t2.GetGridData(i,t2_Cons_PK)); 
    	                            grdBookingSt.SetGridText( grdBookingSt.rows -1, st_item_pk,arrTemp[3]); 
    	                            grdBookingSt.SetGridText( grdBookingSt.rows -1, st_item_code,arrTemp[4]); 
    	                            grdBookingSt.SetGridText( grdBookingSt.rows -1, st_item_nm,arrTemp[5]); 
    	                            grdBookingSt.SetGridText( grdBookingSt.rows -1, st_uom,arrTemp[6]); 
    	                            grdBookingSt.SetGridText( grdBookingSt.rows -1, st_lotno_pk,arrTemp[7]);
    	                            grdBookingSt.SetGridText( grdBookingSt.rows -1, st_lotno,arrTemp[8]); 
    	                            grdBookingSt.SetGridText( grdBookingSt.rows -1, st_ref_qty,arrTemp[9]); 
    	                            grdBookingSt.SetGridText( grdBookingSt.rows -1, st_wh_pk,arrTemp[0]); 
    	                            grdBookingSt.SetGridText( grdBookingSt.rows -1, st_wh_id,arrTemp[1]);
    	                            grdBookingSt.SetGridText( grdBookingSt.rows -1, st_wh_nm,arrTemp[2]);
    	                            
    	                            grdBookingSt.SetGridText(grdBookingSt.rows -1 , st_book_qty, parseFloat(request_qty)>=parseFloat(stock_qty)?stock_qty:request_qty);
    	                            
    	                            grdBookingSt.SetGridText(grdBookingSt.rows -1 , st_emp_pk, user_pk   );
    	                            grdBookingSt.SetGridText(grdBookingSt.rows -1 , st_emp_nm, user_name );
    	                            /*------------*/
    	                            if (parseFloat(request_qty)>=parseFloat(stock_qty))
    	                            {
    	                                request_qty = request_qty - stock_qty;
    	                                stock_qty = 0
    	                                index ++;
    	                            }else
    	                            {
    	                                stock_qty = stock_qty - request_qty;
    	                                request_qty = 0
    	                            }
    	                            
    	                        } else
    	                        {
    	                            index ++;
    	                        }
    	                         
	                         }else
	                         {
	                            return;
	                         }
	                     }
	            
	                }
	            } 	                   
	                        
	         }  
   }else                    // Get Item From PO
   {
         var item_code =""
           if(grdCons_t2.row>0)
          {
                 item_code = grdCons_t2.GetGridData(grdCons_t2.row,t2_Cons_mat_code)
          }
           path = System.RootURL + "/form/fp/ab/fpab00020.aspx";
	         obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( obj != null )
	         {	       
	            var index =0;
	            var request_qty,stock_qty
	            stock_qty = 0;
	            for( var i=1 ; i<grdCons_t2.rows  ; i++ )
	            {
	                if(grdCons_t2.GetGridData(i,t2_Cons_Sel)==-1)
	                {
	                    if (Number(grdCons_t2.GetGridData(i,t2_Cons_Booked_qty)))
	                        request_qty = grdCons_t2.GetGridData(i,t2_Cons_After_qty) - grdCons_t2.GetGridData(i,t2_Cons_Booked_qty)
	                    else
	                     request_qty = grdCons_t2.GetGridData(i,t2_Cons_After_qty)     
	                      while(parseFloat(request_qty)>0)
	                     {
	                         if (index < obj.length)
	                         {
	                            var arrTemp = obj[index]; 
	                            if (parseFloat(stock_qty)<=0)                                                       //if quantity of stock after mapping >0 then continue to map
	                                stock_qty = arrTemp[11] 
	                             if(parseFloat(stock_qty)>0)
    	                        {
    	                            grdBookingPO.AddRow();
    	                            grdBookingPO.SetGridText(grdBookingPO.rows -1 , st_book_no ,grdCons_t2.GetGridData(i,t2_Cons_SO_no));
    	                            grdBookingPO.SetGridText(grdBookingPO.rows -1 , po_status ,"WT");
    	                            grdBookingPO.SetGridText(grdBookingPO.rows -1 , po_tpr_matcons_pk,grdCons_t2.GetGridData(i,t2_Cons_PK)); 
    	                            grdBookingPO.SetGridText(grdBookingPO.rows -1 , po_tpr_purordd_pk,arrTemp[4]); 
    	                            grdBookingPO.SetGridText(grdBookingPO.rows -1 , po_item_pk,arrTemp[5]); 
    	                            grdBookingPO.SetGridText(grdBookingPO.rows -1 , po_item_code,arrTemp[6]); 
    	                            
    	                            grdBookingPO.SetGridText(grdBookingPO.rows -1 , po_item_nm,arrTemp[7]); 
    	                            grdBookingPO.SetGridText(grdBookingPO.rows -1 , po_item_uom,arrTemp[8]); 
    	                             if (parseFloat(request_qty)>=parseFloat(stock_qty))
    	                            {
    	                                
    	                                 grdBookingPO.SetGridText(grdBookingPO.rows -1 , po_book_qty,stock_qty);
    	                            }else
    	                            {
    	                                grdBookingPO.SetGridText(grdBookingPO.rows -1 , po_book_qty,request_qty);
    	                            }
    	                            grdBookingPO.SetGridText(grdBookingPO.rows -1 , po_ref_no,arrTemp[3]); //PO no
    	                            grdBookingPO.SetGridText(grdBookingPO.rows -1 , po_refbuss_pk,arrTemp[0]);
    	                            grdBookingPO.SetGridText(grdBookingPO.rows -1 , po_buss_nm,arrTemp[1]);
    	                            grdBookingPO.SetGridText(grdBookingPO.rows -1 , po_ref_etd,arrTemp[9]);
    	                            
    	                            grdBookingPO.SetGridText(grdBookingPO.rows -1 , po_ref_po_qty,arrTemp[11]);
    	                            grdBookingPO.SetGridText(grdBookingPO.rows -1 , po_ref_booked_qty,arrTemp[13]);
    	                          
    	                            grdBookingPO.SetGridText(grdBookingPO.rows -1 , po_emp_pk,user_pk);
    	                            grdBookingPO.SetGridText(grdBookingPO.rows -1 , po_emp_nm,user_name);
    	                            /*------------*/
    	                            if (parseFloat(request_qty)>=parseFloat(stock_qty))
    	                            {
    	                                request_qty = request_qty - stock_qty;
    	                                stock_qty = 0
    	                                index ++;
    	                            }else
    	                            {
    	                                stock_qty = stock_qty - request_qty;
    	                                request_qty = 0
    	                            }
    	                            
    	                        } else
    	                        {
    	                            index ++;
    	                        }
    	                         
	                         }else
	                         {
	                            return;
	                         }
	                     }
	            
	                }
	            } 	                   
	                        
	         } 
   }
  
}
 function AfterEdit(obj)
 {
    var col, row

    switch (obj.id)
    {
        case 'grdBooking' :
	         var row  = event.row ;
	         var col  = event.col ; 
	         
            if ( col == iCol_booking_qty )
            {
                var dNum =  grdBooking.GetGridData(row,col) ; 

                !Number(dNum)?grdBooking.SetGridText(row,col,""):grdBooking.SetGridText(row,col,parseFloat(dNum+"").toFixed(3));
            }    

        break;
    }
 }        
function  OnSave(id)
{
    switch(id)
    {
        case 1:                                                     //Adjust consumption
            fpbp00090_1.Call();
        break;
        case 2:
            if(rbFlag_t2.value ==0)
                fpbp00090_4.Call();
            else
                fpbp00090_5.Call();
        break;
    }
}
//-----------------------------------
function OnDelete_t2()
{
    var gird =null
    if(rbFlag_t2.value ==0)
    {
        grid = grdBookingSt
    }else
    {
        grid = grdBookingPO
    }
     if(grid.row>0)
    {
        if ( grid.GetGridData( grid.row, 0 ) == "" ) 
		        {						
					    grid.RemoveRow();					
			    }			
			    else 
			    {
				    if ( confirm( "Do you want to mark this row to delete?" ) ) 
				    {
					    grid.DeleteRow();
				    }
		        }
    }
}
function OnUnDelete_t2()
{
     var gird =null
    if(rbFlag_t2.value ==0)
    {
        grid = grdBookingSt
    }else
    {
        grid = grdBookingPO
    }
 
     if ( grid.GetRowStatus( grid.row ) >= 64)
     {
        grid.UnDeleteRow()
     }
}
//-----------------------------------
    function OnDelete_t1()
    {
        
         if(grdDetailCons.row>0)
        {
            if ( grdDetailCons.GetGridData( grdDetailCons.row, detail_PK ) == "" ) 
		            {						
					        grdDetailCons.RemoveRow();					
			        }			
			        else 
			        {
				        if ( confirm( "Do you want to mark this row to delete?" ) ) 
				        {
					        grdDetailCons.DeleteRow();
				        }
		            }
        }
    }
function OnUnDelete_t1()
{
   
     if ( grdDetailCons.GetRowStatus( grdDetailCons.row ) >= 64)
     {
        grdDetailCons.UnDeleteRow()
     }
}
//-----------------------------------------------------
function MakeBOM()
{
      
   var path = System.RootURL + "/form/fp/hb/fphb00010.aspx";
   if (grdDetailCons.row>0)
   {
        var prod_pk,prod_code,prod_name
        prod_pk = grdDetailCons.GetGridData(grdDetailCons.row,detail_prod_pk);
        prod_code = grdDetailCons.GetGridData(grdDetailCons.row,detail_prod_code);
        prod_name = grdDetailCons.GetGridData(grdDetailCons.row,detail_prod_nm);
        path = path + "?item_pk="+prod_pk+"&item_code="+prod_code+"&item_nm=" +prod_name
   }
   var	obj = System.OpenModal( path ,1000 , 600 ,  'resizable:yes;status:yes');
}
//-----------------------------------------------------------
function OnDataReceive(obj)
 {
   switch (obj.id)
   {
        case "fpbp00090":                                       //after make consumption
            alert(txtResult.text)
            /*Call Search SO Consumption*/
            OnSearch(2)
        break;
         case  "fpbp00090_0":                                       //after make consumption
            alert(txtResult.text)
            /*Call Search SO Consumption*/
            OnSearch(2)
        break;
        case "fpbp00090_3":
            txtConsumption_pk.text = "";
        break;
   }
 }
 
 //---------------------------------------------------------
function OnReport()
{
       if (txtOrderPK.text !="")
        {
            var url =System.RootURL + '/reports/fp/bp/fpbp00090.aspx?SO_PK=' +  txtOrderPK.text ;
            window.open(url); 
        }
        else
        {
            alert("Please select a SO to print Consumption!");
        } 
    //---------------------- 
     
}
</script>

<body>
    <!-------------------------Material Consumption---------------------------->
    <!-----Search SO----->
    <gw:data id="dsbs00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"   parameter="0,1,2,3" function="lg_sel_dsbs00010" > 
                <input> 
                    <input bind="dtFromOrderDate" /> 
                    <input bind="dtToOrderDate" /> 
                    <input bind="txtPOSONo" />
                    <input bind="txtStyleSearch" /> 
                    <input bind="lstOrderStatus1" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------End----------->
    <!-----Search SO Consumption----->
    <gw:data id="fpbp00090_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"     function="PROD.sp_sel_fpbp00090_2" > 
                <input> 
                    <input bind="txtOrderPK" /> 
                </input> 
                <output bind="grdSOCons" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------End----------->
    <!-----Search SOD Consumption----->
    <gw:data id="fpbp00090_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24"   function="PROD.sp_sel_fpbp00090_1"  procedure="prod.sp_upd_fpbp00090_1"> 
                <input> 
                    <input bind="txtOrderPK" /> 
                </input> 
                <output bind="grdDetailCons" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------End----------->
    <!-----Calculate Consumption----->
    <gw:data id="fpbp00090" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="PROD.SP_PRO_FPBP00090" > 
                <input>
                     <input bind="txtOrderPK" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------End----------->
    <!-----Delete Consumption----->
    <gw:data id="fpbp00090_0" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="PROD.SP_PRO_FPBP00090_1" > 
                <input>
                     <input bind="txtOrderPK" />
                     <input bind="txtEmpPK" />   
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------End----------->
    <!-------------------------Material Booking---------------------------->
    <!-----Search SO Consumption----->
    <gw:data id="fpbp00090_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"     function="PROD.sp_sel_fpbp00090_3" > 
                <input> 
                    <input bind="dtFromOrderDate_t2" />   
                    <input bind="dtToOrderDate_t2" />   
                    <input bind="txtConsNo_t2" /> 
                    <input bind="txtSItem_t2" /> 
                    <input bind="ckBalance" /> 
                </input> 
                <output bind="grdCons_t2" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------End----------->
    <!-----Search Booking from Stock----->
    <gw:data id="fpbp00090_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29"    function="PROD.sp_sel_fpbp00090_4"  procedure="PROD.sp_upd_fpbp00090_4"> 
                <input> 
                    <input bind="txtConsumption_pk" /> 
                    <input bind="dtFromDate_t2" />   
                    <input bind="dtToDate_t2" />   
                    <input bind="txtSONo_t2" /> 
                    <input bind="txtItem_t2" /> 
                </input> 
                <output bind="grdBookingSt" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------End----------->
    <!-----Search Booking from Stock----->
    <gw:data id="fpbp00090_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27"   function="PROD.sp_sel_fpbp00090_5" procedure="PROD.sp_upd_fpbp00090_5" > 
                <input> 
                    <input bind="txtConsumption_pk" /> 
                    <input bind="dtFromDate_t2" />   
                    <input bind="dtToDate_t2" />   
                    <input bind="txtSONo_t2" /> 
                    <input bind="txtItem_t2" /> 
                </input> 
                <output bind="grdBookingPO" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------End----------->
    <!-- <gw:tab id="tab" style="width: 100%; height: 100%"> -->
    <gw:tab id="tab" style="width: 100%; height: 100%">
    <table style="width: 100%; height: 100%" name="Mat Cons" border="1">
        <tr style="height: 100%">
            <td style="width: 25%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
                        <td align="right" style="width: 30%">
                            <b>Date</b>
                        </td>
                        <td style="width: 79%">
                            <gw:datebox id="dtFromOrderDate" lang="1" styles="width:100%" />
                            ~<gw:datebox id="dtToOrderDate" lang="1" styles="width:100%" />
                        </td>
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnOrderNoSearch" img="search" onclick='OnSearch(1)' />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td align="right" style="width: 30%">
                            <b>PO/SO No</b></td>
                        <td colspan="2">
                            <gw:textbox id="txtPOSONo" csstype="mandatory" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td align="right" style="width: 30%">
                            Status
                        </td>
                        <td colspan="2">
                            <gw:list id="lstOrderStatus1" styles='width:100%' onchange="OnSearch(1)" />
                        </td>
                    </tr>
                    <tr style="height: 94%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|SO No|Order DT|PO No" format="0|0|4|0" aligns="0|0|1|0"
                                defaults="|||" editcol="0|0|0|0" widths="0|1500|1200|1000" styles="width:100%; height:100%"
                                sorting="T" acceptNullDate="true" param="0,1,2,3" oncellclick="OnSearch(2)" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 85%">
                <table style="width: 100%; height: 100%; border: 0">
                    <tr style="height: 2%">
                        <td style="width: 84%" align="left">
                            <gw:radio id="rbFlag" value="0" onchange="OnRadioChange(1)"> 
                                <span value="0" id="sSO">Sale Order Consumption</span>
                                <span value="1" id="sOI" >Order Item Consumption</span>
                            </gw:radio>
                        </td>
                        <td align="right" style="width: 2%">
                            <gw:icon id="idBtnCons" img="in" text="Load Consumption" styles='width:100%' onclick="OnProcess(1)" />
                        </td>
                        <td align="right" style="width: 2%">
                            <gw:imgbtn id="btnAdd1" img="new" alt="Add Consumption" onclick="AddConsumption()" />
                        </td>
                        <td align="right" style="width: 2%">
                            <gw:imgbtn id="btnDelete1" img="delete" alt="Delete Consumption" onclick="OnDelete_t1()" />
                        </td>
                        <td align="right" style="width: 2%">
                            <gw:imgbtn id="btnUDelete1" img="Udelete" alt="UnDelete Consumption" onclick="OnUnDelete_t1()" />
                        </td>
                        <td align="right" style="width: 2%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save Consumption" onclick="OnSave(1)" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:icon id="idBtnCrtMR" img="in" text="Create MR" styles='width:100%' onclick="OnProcess(2)" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:icon id="idBtnBOM" img="in" text="Make BOM" styles='width:100%' onclick="MakeBOM()" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:imgbtn img="excel" alt="Print Consumption" id="btnReport" onclick="OnReport()" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="9">
                            <table name="Sale Order" style="width: 100%; height: 100%;" id="tblSO">
                                <tr>
                                    <td style="width: 100%">
                                        <gw:grid id='grdSOCons' header='_MASTER_TABLE|_MASTER_PK|_MAT_ITEM_PK|Mat Code|Mat Name|UOM|Cons Qty|After Adjust Qty|Booked Qty|MR Qty|PO Qty|_In Qty|Out Qty'
                                            format='0|0|0|0|0|0|1|1|1|1|1|1|0' aligns='0|0|0|0|0|1|0|0|0|0|0|0|0' defaults='||||||||||||'
                                            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0' widths='0|0|0|1500|3000|1000|1500|1500|1500|1500|1500|1500|1500'
                                            sorting='T' styles='width:100%; height:100%' />
                                    </td>
                                </tr>
                            </table>
                            <table name="Item" style="width: 100%; height: 100%; border: 0" id="tblItem">
                                <tr>
                                    <td>
                                        <gw:grid id='grdDetailCons' header='SOD No|_MASTER_TABLE|_MASTER_PK|_DETAIL_TABLE|_DETAIL_PK|_PRODUCT_ITEM_PK|Prod Code|Prod Name|UOM|Qty|_MAT_ITEM_PK|Mat Code|Mat Name|UOM|Sourcing Type|BOM Qty|Cons Qty|After Adjust Qty|Booked Qty|MR Qty|PO QTY|_IN Qty|OUT Qty|Description|_PK'
                                            format='0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|1|1|1|1|1|1|1|1|1|0' aligns='0|0|0|0|0|0|0|0|1|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0'
                                            defaults='|||||||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0'
                                            widths='1500|0|0|0|0|0|1500|2500|1000|1500|0|1500|2500|1000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|0'
                                            sorting='T' styles='width:100%; height:100%' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table style="height: 100%; width: 100%" name="Mat Booking" border="1">
        <tr style="height: 5%">
            <td style="width: 40%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 5%">
                        <td align="right" style='width: 15%'>
                            <b>Date</b>
                        </td>
                        <td style='width: 35%'>
                            <gw:datebox id="dtFromOrderDate_t2" lang="1" styles="width:100%" />
                            ~<gw:datebox id="dtToOrderDate_t2" lang="1" styles="width:100%" />
                        </td>
                        <td style="width: 10%">
                        </td>
                        <td style="width: 39%" align="center">
                            <gw:checkbox id="ckBalance" defaultvalue="Y|N" value="Y" />
                            Balance
                        </td>
                        <td style="width: 1%" align='right'>
                            <gw:imgbtn id="btnConsSearch_t2" img="search" onclick='OnSearch(4)' />
                        </td>
                    </tr>
                    <tr>
                        <td align="right" style="width: 15%">
                            <b>Cons No</b></td>
                        <td style="width: 35%">
                            <gw:textbox id="txtConsNo_t2" styles="width:100%" onenterkey="OnSearch(4)" />
                        </td>
                        <td align="right" style="width: 10%">
                            <b>Item</b></td>
                        <td style="width: 40%" colspan="2">
                            <gw:textbox id="txtSItem_t2" styles="width:100%" onenterkey="OnSearch(4)" />
                        </td>
                    </tr>
                    <tr style="height: 95%">
                        <td style="width: 100%" colspan="5">
                            <gw:grid id='grdCons_t2' header='Chk|_PK|SO No|_MASTER_TABLE|_MASTER_PK|_DETAIL_TABLE|_DETAIL_PK|_PRODUCT_ITEM_PK|Prod Code|_Prod Name|_UOM|_Prod QTY|_MAT_ITEM_PK|Mat Code|Mat Name|UOM|Cons Qty|Adjust Qty|Booked Qty|MR Qty|PO Qty|IN Qty|OUT Qty|Description'
                                format='3|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|1|1|1|1|1|1|1|0' aligns='0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|1|0|0|0|0|0|0|0|0'
                                defaults='|||||||||||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                                widths='500|0|1500|0|0|0|0|0|1500|2000|0|0|0|1500|2500|1000|1500|1500|1500|1500|1500|1500|1500|2000'
                                sorting='T' oncellclick="OnSearch(5)" styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 60%">
                <!--              <gw:tab  id="tab2" onpageactivate="OnSearch(5)"  style="width: 100%; height: 100%"  > -->
                <table name="Stock Booking" width="100%" style="height: 100%; border: 0">
                    <tr style="height: 1%">
                        <td style="width: 100%">
                            <table width="100%" style="height: 100%; border: 0">
                                <tr style="height: 100%">
                                    <td style="width: 10%" align="right">
                                        Date
                                    </td>
                                    <td style="width: 20%">
                                        <gw:datebox id="dtFromDate_t2" lang="1" styles="width:100%" />
                                        ~<gw:datebox id="dtToDate_t2" lang="1" styles="width:100%" />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        Book No
                                    </td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtSONo_t2" text="" styles="width:100%" />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        Item
                                    </td>
                                    <td style="width: 29%">
                                        <gw:textbox id="txtItem_t2" text="" styles="width:100%" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSearch_t2" img="search" alt="Search" onclick="OnSearch(5)" />
                                    </td>
                                </tr>
                                <tr style="height: 2%">
                                    <td colspan="7" style="width: 100%">
                                        <table style="width: 100%; height: 100%;" border="0">
                                            <tr>
                                                <td style="width: 92%" align="left" >
                                                    <gw:radio id="rbFlag_t2" value="0" onchange="OnRadioChange(2)"> 
                                                            <span value="0" id="sST" >Stock Booking</span>
                                                            <span value="1" id="sPO" >PO Booking</span>
                                                        </gw:radio>
                                                </td>
                                                <td style="width: 2%" align="right">
                                                    <gw:imgbtn id="btnAdd_t2" img="new" alt="Booking Form Stock" onclick="OnPopup()" />
                                                </td>
                                                <td style="width: 2%" align="right">
                                                    <gw:imgbtn id="btnDelete_t2" img="delete" alt="Delete Booking" onclick="OnDelete_t2()" />
                                                </td>
                                                <td style="width: 2%" align="right">
                                                    <gw:imgbtn id="btnUDelete_t2" img="UDelete" alt="UnDelete" onclick="OnUnDelete_t2()" />
                                                </td>
                                                <td style="width: 2%" align="right">
                                                    <gw:imgbtn id="btnSave_t2" img="save" alt="Save Booking" onclick="OnSave(2)" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 99%" id="Stock">
                        <td style="width: 100%">
                            <gw:grid id='grdBookingSt' header='_PK|Book No|Doc Date|Status|_TPR_MATCONS_PK|_TCO_ITEM_PK|Item Code|Item Name|UOM|_TPR_LOTNO_PK|Lot No|Ref Stock Qty|_STOCK_WH_PK|WH ID|WH NM|_RESERVE_WH_PK|_RESERVE_WH_ID|Reserve WH|Booking Date|Booking Qty|Reserve Qty|_CHARGER_EMP_PK|_EMP_ID|_EMP_NM|Description|_ATT01|_ATT02|_ATT03|_ATT04|_ATT05'
                                format='0|0|4|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|4|1|1|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                defaults='|||||||||||||||||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                                widths='0|1500|1200|1000|0|0|1500|2000|1000|0|1500|1500|0|0|1500|0|0|1500|1200|1500|1500|0|0|1500|2000|0|0|0|0|0'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                    <tr style="height: 99%" id="PO">
                        <td style="width: 100%">
                            <gw:grid id='grdBookingPO' header='_PK|Book No|Doc Date|Status|_TPR_MATCONS_PK|_TPR_PURORDD_PK|_TCO_ITEM_PK|Item Code|Item Name|UOM|Book Date|Book Qty|Reserve Qty|REF PO|_REFBUSS_PK|Buss Name|REF ETD|REF PO Qty|REF Booked Qty|_CHARGER_EMP_PK|_emp_id|Charger|Description|_ATT01|_ATT02|_ATT03|_ATT04|_ATT05'
                                format='0|0|4|0|0|0|0|0|0|0|4|1|1|0|0|0|4|1|1|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                defaults='|||||||||||||||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                                widths='0|1500|1200|1000|0|0|0|1500|2000|1000|1200|1500|1500|1500|0|2000|1200|1500|1500|0|0|2000|2000|0|0|0|0|0'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    </gw:tab>
    <!-- </gw:tab> -->
    <!------------------------------------------------------------------------>
    <gw:textbox id="txt_tsa_saleorderd_pk" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtOrderPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtResult" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtEmpPK" maxlen="100" styles='width:100%;display:none' />
    <!----------------TAB 2-------------------->
    <gw:textbox id="txtConsumption_pk" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------>
    <gw:textbox id="txtStyleSearch" maxlen="100" styles='width:100%;display:none' />
</body>
</html>
