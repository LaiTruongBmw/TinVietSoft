<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<head runat="server">
    <title>Stock Booking Approve</title>
</head>

<script>
 
    var  user_pk =  "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>" ;
    
    var  G1_TPR_MATCONS_PK   = 0 ,
         G1_Cons_No          = 1 ,
         G1_ConsItem_PK      = 2 ,
         G1_ConsItem_Code    = 3 ,
         G1_ConsItem_Nm      = 4 ,
         G1_ConsItem_Uom     = 5 ,
         G1_Adj_Qty          = 6 ,
         G1_Booked_Qty       = 7 ,
         G1_Booking_pk       = 8 ,
         G1_Book_No          = 9 ,
         G1_Doc_Dt           = 10 ,
         G1_Status           = 11 ,
         G1_bookItem_pk      = 12 ,
         G1_bookItem_Code    = 13 ,
         G1_bookItem_Name    = 14 ,
         G1_bookItem_UOM     = 15 ,
         G1_Lot_pk           = 16 ,
         G1_Lot_No           = 17 ,
         G1_WH_PK            = 18 ,
         G1_WH_ID           = 19 ,
         G1_WH_NM           = 20 ,
         G1_WH_Reser_PK     = 21 ,
         G1_WH_Reser_ID     = 22 ,
         G1_WH_Reser_NM     = 23 ,
         G1_Book_Dt         = 24 ,
         G1_Booking_Qty     = 25 ,
         G1_Reserve_Qty     = 26 ,
         G1_Stock_Qty       = 27 ,
         G1_Desc            = 28 ,
         G1_Emp_Pk          = 29 ,
         G1_Emp_id          = 30 ,
         G1_Emp_Name        = 31 ;
 //---------------------------------------------------------
     var tab2_book_item_pk      = 4,
         tab2_book_item_id      = 5,
         tab2_book_item_name    = 6,
         tab2_arrive_qty        = 10,
         tab2_con_mat_pk        = 13,
         tab2_con_mat_id        = 14,
         tab2_con_mat_name      = 15,  
         tab2_After_Adjust_Qty  = 17,
         tab2_Stock_WH          = 23,
         tab2_Reserve_Qty       = 31,
         tab2_Reserve_WH        = 34,
         tab2_booking_status    = 28,
         tab2_booking_qty       = 30;
         
 //---------------------------------------------------------
 function BodyInit()
 {
      //--------------------------------------
      idGrid1.GetGridControl().FrozenCols = G1_Adj_Qty ;
      idGrid2.GetGridControl().FrozenCols = G1_Adj_Qty ;
      //--------------------------------------
      txt_user_pk.text = user_pk;
      //--------------------------------------
      dtFrom.SetDataText( System.AddDate( dtTo.GetData() , -15) );
      dtTo.SetDataText(   System.AddDate( dtTo.GetData() , +15) );
      
      dtFrom_t2.SetDataText( System.AddDate( dtTo_t2.GetData() , -15) );
      dtTo_t2.SetDataText(   System.AddDate( dtTo_t2.GetData() , +15) );      
      //--------------------------------------
      BindingDataList();
      FormatGrid();
      //--------------------------------------
 } 

 //---------------------------------------------------------
 function BindingDataList()
 {         
    var data="";
    
     data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TCO_ABCODE a, TCO_ABCODEGRP b WHERE  b.ID='PRAB0090' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " )  %> " ; 
     idGrid1.SetComboFormat(G1_Status, data);
    
     idGrid2.SetComboFormat(G1_Status, data);
     idGrid1_t2.SetComboFormat(tab2_booking_status, data);
    
 }        
 
 //-----------------------------------------------------

function FormatGrid()
{
    //------------------------------------------------------
    var ctrl = idGrid1.GetGridControl();
    ctrl.ColFormat(G1_Adj_Qty)     = "###,###,###.##" ;
    ctrl.ColFormat(G1_Booked_Qty)  = "###,###,###.##" ; 
    ctrl.ColFormat(G1_Booking_Qty) = "###,###,###.##" ; 
    ctrl.ColFormat(G1_Reserve_Qty) = "###,###,###.##" ; 
    ctrl.ColFormat(G1_Stock_Qty)   = "###,###,###.##" ; 
    //------------------------------------------------------
    ctrl = idGrid2.GetGridControl();
    ctrl.ColFormat(G1_Adj_Qty)     = "###,###,###.##" ;
    ctrl.ColFormat(G1_Booked_Qty)  = "###,###,###.##" ; 
    ctrl.ColFormat(G1_Booking_Qty) = "###,###,###.##" ; 
    ctrl.ColFormat(G1_Reserve_Qty) = "###,###,###.##" ; 
    ctrl.ColFormat(G1_Stock_Qty)   = "###,###,###.##" ; 
    //------------------------------------------------------
    ctrl = idGrid1_t2.GetGridControl()
    
    ctrl.ColFormat(tab2_After_Adjust_Qty)= "###,###,###.##" ;
    ctrl.ColFormat(tab2_arrive_qty)      = "###,###,###.##" ; 
    ctrl.ColFormat(tab2_booking_qty)     = "###,###,###.##" ; 
    ctrl.ColFormat(tab2_Reserve_Qty)     = "###,###,###.##" ; 
    
    
    ctrl.MergeCells  = 2 ;
    ctrl.MergeCol(0) = true ;	
    ctrl.MergeCol(1) = true ; 
    ctrl.MergeCol(2) = true ;	
    ctrl.MergeCol(3) = true ; 
    ctrl.MergeCol(4) = true ;	
    ctrl.MergeCol(5) = true ; 
    ctrl.MergeCol(6) = true ;	
    ctrl.MergeCol(7) = true ; 
    ctrl.MergeCol(8) = true ; 
    ctrl.MergeCol(9) = true ; 
    ctrl.MergeCol(10) = true ;     
    ctrl.MergeCol(11) = true ; 
    ctrl.MergeCol(12) = true ; 
    ctrl.MergeCol(13) = true ;      
}

 //---------------------------------------------------------
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 1 :
                fpbp00100.Call("SELECT");
            break; 
            case 2 :
                fpbp00100_1.Call("SELECT");   
            break; 
            case 3:
                fpbp00100_2.Call("SELECT")
            break; 
            case 4:
                fpbp00100_3.Call("SELECT")
            break;            
      }  
 }

 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {            
            case "fpbp00100" :
                if ( idGrid1.rows > 1 )
                {            
                    for ( var i = 1 ; i <= idGrid1.rows - 1; i++ )
                    {
                        if ( idGrid1.GetGridData( i, G1_ConsItem_PK ) != idGrid1.GetGridData( i, G1_bookItem_pk ) )
                        {
                            idGrid1.GetGridControl().Cell( 7 , i , G1_bookItem_Code, i, G1_bookItem_Code ) = 0x3300cc;
                            idGrid1.GetGridControl().Cell( 7 , i , G1_bookItem_Name, i, G1_bookItem_Name ) = 0x3300cc;                    
                        }
                    }
                    //--------------------------------
                    idGrid1.SetCellBgColor( 1, G1_ConsItem_Code , idGrid1.rows - 1, G1_ConsItem_Code , 0xCCFFFF );
                    idGrid1.SetCellBgColor( 1, G1_ConsItem_Nm   , idGrid1.rows - 1, G1_ConsItem_Nm   , 0xCCFFFF );
                    idGrid1.SetCellBgColor( 1, G1_bookItem_Code , idGrid1.rows - 1, G1_bookItem_Code , 0xCCFFFF );
                    idGrid1.SetCellBgColor( 1, G1_bookItem_Name , idGrid1.rows - 1, G1_bookItem_Name , 0xCCFFFF );
                    
                    idGrid1.SetCellBgColor( 1, G1_Booked_Qty    , idGrid1.rows - 1, G1_Booked_Qty    , 0xd4d2ff );
                    idGrid1.SetCellBgColor( 1, G1_WH_Reser_NM   , idGrid1.rows - 1, G1_WH_Reser_NM   , 0xd4d2ff );                              
                    idGrid1.SetCellBgColor( 1, G1_Reserve_Qty   , idGrid1.rows - 1, G1_Reserve_Qty   , 0xd4d2ff );
                    //--------------------------------
                }    
                fpbp00100_1.Call('SELECT');
            break;
            
            case "fpbp00100_1" :
                if ( idGrid2.rows > 1 )
                {            
                    for ( var i = 1 ; i <= idGrid2.rows - 1; i++ )
                    {
                        if ( idGrid2.GetGridData( i, G1_ConsItem_PK ) != idGrid2.GetGridData( i, G1_bookItem_pk ) )
                        {
                            idGrid2.GetGridControl().Cell( 7 , i , G1_bookItem_Code, i, G1_bookItem_Code ) = 0x3300cc;
                            idGrid2.GetGridControl().Cell( 7 , i , G1_bookItem_Name, i, G1_bookItem_Name ) = 0x3300cc;                    
                        }
                    }
                    //--------------------------------
                    idGrid2.SetCellBgColor( 1, G1_ConsItem_Code , idGrid2.rows - 1, G1_ConsItem_Code , 0xCCFFFF );
                    idGrid2.SetCellBgColor( 1, G1_ConsItem_Nm   , idGrid2.rows - 1, G1_ConsItem_Nm   , 0xCCFFFF );
                    idGrid2.SetCellBgColor( 1, G1_bookItem_Code , idGrid2.rows - 1, G1_bookItem_Code , 0xCCFFFF );
                    idGrid2.SetCellBgColor( 1, G1_bookItem_Name , idGrid2.rows - 1, G1_bookItem_Name , 0xCCFFFF );
                    
                    idGrid2.SetCellBgColor( 1, G1_Booked_Qty   , idGrid2.rows - 1, G1_Booked_Qty  , 0xd4d2ff );
                    idGrid2.SetCellBgColor( 1, G1_WH_Reser_NM  , idGrid2.rows - 1, G1_WH_Reser_NM , 0xd4d2ff );                              
                    idGrid2.SetCellBgColor( 1, G1_Reserve_Qty  , idGrid2.rows - 1, G1_Reserve_Qty , 0xd4d2ff );
                    //--------------------------------
                }                          
            break;
              case "fpbp00100_2" :
                if ( idGrid1_t2.rows > 1 )
                {            
                    for ( var i = 1 ; i <= idGrid1_t2.rows - 1; i++ )
                    {
                        if ( idGrid1_t2.GetGridData( i, tab2_book_item_pk ) != idGrid1_t2.GetGridData( i, tab2_con_mat_pk ) )
                        {
                            idGrid1_t2.GetGridControl().Cell( 7 , i , tab2_book_item_id,   i, tab2_book_item_id )   = 0x3300cc;
                            idGrid1_t2.GetGridControl().Cell( 7 , i , tab2_book_item_name, i, tab2_book_item_name ) = 0x3300cc;                    
                        }
                    }
                    //--------------------------------
                    idGrid1_t2.SetCellBgColor( 1, tab2_book_item_id   , idGrid1_t2.rows - 1, tab2_book_item_id   , 0xCCFFFF );
                    idGrid1_t2.SetCellBgColor( 1, tab2_book_item_name , idGrid1_t2.rows - 1, tab2_book_item_name , 0xCCFFFF );
                    idGrid1_t2.SetCellBgColor( 1, tab2_con_mat_id     , idGrid1_t2.rows - 1, tab2_con_mat_id     , 0xCCFFFF );
                    idGrid1_t2.SetCellBgColor( 1, tab2_con_mat_name   , idGrid1_t2.rows - 1, tab2_con_mat_name   , 0xCCFFFF );
                    
                    idGrid1_t2.SetCellBgColor( 1, tab2_booking_qty , idGrid1_t2.rows - 1, tab2_booking_qty , 0xd4d2ff );
                    idGrid1_t2.SetCellBgColor( 1, tab2_Reserve_WH  , idGrid1_t2.rows - 1, tab2_Reserve_WH  , 0xd4d2ff );                              
                    idGrid1_t2.SetCellBgColor( 1, tab2_Reserve_Qty , idGrid1_t2.rows - 1, tab2_Reserve_Qty , 0xd4d2ff );
                    //--------------------------------
                }   
                 fpbp00100_3.Call('SELECT');                       
            break;
            
      }  
 }
 
 //---------------------------------------------------------
 
 function OnApprove(id)
 {
    switch(id)
    {
        case 1:
             for ( i = 1 ; i < idGrid1.rows ; i++ )
            {
                if ( idGrid1.GetGridControl().isSelected(i) == true )
                {
                    idGrid1.SetGridText( i, G1_Status, 'CF' ) ;
                    //-------------------------------
                    if ( Number(idGrid1.GetGridData( i, G1_Reserve_Qty )+"") == 0 )
                    {            
                        idGrid1.SetGridText( i, G1_Reserve_Qty , idGrid1.GetGridData( i, G1_Booking_Qty ) ) ;
                    }                  
                } 
            } 
        break;
        case 2:
             for ( i = 1 ; i < idGrid1_t2.rows ; i++ )
            {
                if ( idGrid1_t2.GetGridControl().isSelected(i) == true )
                {
                    idGrid1_t2.SetGridText( i, tab2_booking_status, 'CF' ) ;
                    //-------------------------------
                    if ( Number(idGrid1_t2.GetGridData( i, tab2_Reserve_Qty )+"") == 0 )
                    {            
                        idGrid1_t2.SetGridText( i, tab2_Reserve_Qty , idGrid1_t2.GetGridData( i, tab2_After_Adjust_Qty ) ) ;
                    }                  
                } 
            } 
        break;
    }
     
 }

 //---------------------------------------------------------
 
 function OnTransferStock(id)
 {
    switch(id)
    {
        case 1:
             for ( i = 1 ; i < idGrid1.rows ; i++ )
                {
                    if ( idGrid1.GetGridControl().isSelected(i) == true )
                    {
                        idGrid1.SetGridText( i, G1_Status, 'TS' ) ;
                        //-------------------------------
                        if ( Number(idGrid1.GetGridData( i, G1_Reserve_Qty )+"") == 0 )
                        {
                            idGrid1.SetGridText( i, G1_Reserve_Qty, idGrid1.GetGridData( i, G1_Booking_Qty ) ) ;
                        }
                        //-------------------------------    
                    } 
                }  
        break;
        case 2:
             for ( i = 1 ; i < idGrid1_t2.rows ; i++ )
                {
                    if ( idGrid1_t2.GetGridControl().isSelected(i) == true )
                    {
                        idGrid1_t2.SetGridText( i, tab2_booking_status, 'TS' ) ;
                        //-------------------------------
                        if ( Number(idGrid1_t2.GetGridData( i, tab2_Reserve_Qty )+"") == 0 )
                        {
                            idGrid1_t2.SetGridText( i, tab2_Reserve_Qty, idGrid1_t2.GetGridData( i, tab2_After_Adjust_Qty ) ) ;
                        }
                        //-------------------------------    
                    } 
                }  
        break;
    }
    
 }

 //---------------------------------------------------------
 
 function OnCancelBooking(id)
 {
    switch(id)
    {
        case 1:
            for ( i = 1 ; i < idGrid2.rows ; i++ )
                {
                    if ( idGrid2.GetGridControl().isSelected(i) == true )
                    {
                        idGrid2.SetGridText( i, G1_Status, 'CC' ) ;  
                    } 
                }   
        break;
        case 2:
                  for ( i = 1 ; i < idGrid1_t2.rows ; i++ )
                {
                    if ( idGrid1_t2.GetGridControl().isSelected(i) == true )
                    {
                        idGrid1_t2.SetGridText( i, tab2_booking_status, 'CC' ) ;  
                    } 
                }   
        break;
        
    }
    
 }
    
 //---------------------------------------------------------
 
 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 'idGrid1' :
                fpbp00100.Call();
            break;
            case 'idGrid2' :
                fpbp00100_1.Call();
            break;
            case 'idGrid3' :
                fpbp00100_2.Call();
            break;
            case 'idGrid4' :
                fpbp00100_3.Call();
            break;
            
      }  
 }
 
//---------------------------------------------------------
 
 function OnExcel(pos)
 {
      switch (pos)         
      {		        
            case 'Approve' :

                var url =System.RootURL + '/reports/ds/bs/fpbp00100.xls?idList=' + idList.value + '&dtFrom=' + dtFrom.value + '&dtTo=' + dtTo.value +'&txtSONo=' + txtSONo.text + '&txtItem=' + txtItem.text ;
                
		        window.open(url);                 

            break;
      }  
 }

//-----------------------------------------------------

function OnGridDblClick(obj)
{
    switch (obj.id)
    {
        case 'idGrid1' :
        
            var row,col
            
            col = event.col ;
            row = event.row ;
            
            if ( col == G1_WH_NM || col == G1_WH_Reser_NM )
            {
                 var path = System.RootURL + '/form/fp/ab/PopUpGetWareHouse.aspx';
                 var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');  
                             
                 if ( obj != null )
                 {            
		             idGrid1.SetGridText( row, col - 2,   obj[0]);//warehouse_pk
                     idGrid1.SetGridText( row, col - 1,   obj[1]);//warehouse_id	 
                     idGrid1.SetGridText( row, col ,      obj[2]);//warehouse_name         
  		         }
            }
            else if ( col == G1_Lot_No )
            {
            
                 var event_col = event.col ;
                 var event_row = event.row ;
                 var path = System.RootURL + '/form/ag/fp/agfp00050.aspx?item_pk='+ idGrid1.GetGridData(idGrid1.row, G1_bookItem_pk ) ;
                     path = path +'&item_code='+ idGrid1.GetGridData(idGrid1.row, G1_bookItem_Code) ;
                     path = path +'&item_name='+ idGrid1.GetGridData(idGrid1.row, G1_bookItem_Name) ;
                     path = path +'&item_uom=' + idGrid1.GetGridData(idGrid1.row, G1_bookItem_UOM) ;
                     
                 var obj = System.OpenModal( path , 800 , 500 ,  'resizable:yes;status:yes');
                 if ( obj != null )
                 {
                     idGrid1.SetGridText(event_row, G1_Lot_pk, obj[0]) ;//stock_pk	    	    
                     idGrid1.SetGridText(event_row, G1_Lot_No,       obj[1]) ;//stock_no
                 }	            
            }                     
            
        break;	
        
        case 'idGrid1_t2' :
        
            var row,col
            
            col = event.col ;
            row = event.row ;
            
            if ( col == tab2_Stock_WH || col == tab2_Reserve_WH )
            {
                 var path = System.RootURL + '/form/fp/ab/PopUpGetWareHouse.aspx';
                 var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');  
                             
                 if ( obj != null )
                 {            
		             idGrid1_t2.SetGridText( row, col - 2,   obj[0]);//warehouse_pk
                     idGrid1_t2.SetGridText( row, col - 1,   obj[1]);//warehouse_id	 
                     idGrid1_t2.SetGridText( row, col ,      obj[2]);//warehouse_name         
  		         }
            }
            else if ( col == G1_Lot_No )
            {
            
                 var event_col = event.col ;
                 var event_row = event.row ;
                 var path = System.RootURL + '/form/ag/fp/agfp00050.aspx?item_pk='+ idGrid1_t2.GetGridData(idGrid1_t2.row, G1_bookItem_pk ) ;
                     path = path +'&item_code='+ idGrid1_t2.GetGridData(idGrid1_t2.row, G1_bookItem_Code) ;
                     path = path +'&item_name='+ idGrid1_t2.GetGridData(idGrid1_t2.row, G1_bookItem_Name) ;
                     path = path +'&item_uom=' + idGrid1_t2.GetGridData(idGrid1_t2.row, G1_bookItem_UOM) ;
                     
                 var obj = System.OpenModal( path , 800 , 500 ,  'resizable:yes;status:yes');
                 if ( obj != null )
                 {
                     idGrid1_t2.SetGridText(event_row, G1_Lot_pk, obj[0]) ;//stock_pk	    	    
                     idGrid1_t2.SetGridText(event_row, G1_Lot_No,       obj[1]) ;//stock_no
                 }	            
            }                     
            
        break;		
    }
}
 
//-----------------------------------------------------
 
 function AfterEdit(obj)
 {
    var col, row

    switch (obj.id)
    {
        case 'idGrid1' :
	         var row  = event.row ;
	         var col  = event.col ; 
	         
            if ( col == G1_reserve_qty )
            {
                var dNum =  idGrid1.GetGridData(row,col) ; 

                !Number(dNum)?idGrid1.SetGridText(row,col,""):idGrid1.SetGridText(row,col,parseFloat(dNum+"").toFixed(3));
            }    

        break;
    }
 }        
//-----------------------------------------------------
         
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="fpbp00100" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="8,11,16,17,18,21,26,28,32,33,34,35,36" function="prod.sp_sel_fpbp00100" procedure="prod.sp_upd_fpbp00100" > 
                <input> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
                    <input bind="txtSONo" />
                    <input bind="txtItem" />
                </input> 
                <output bind="idGrid1" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fpbp00100_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="8,11,28,32,33,34,35,36" function="prod.sp_sel_fpbp00100_1" procedure="prod.sp_upd_fpbp00100_1" > 
                <input> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
                    <input bind="txtSONo" />
                    <input bind="txtItem" />
                </input> 
                <output bind="idGrid2" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------------------------PO Booking------------------------------->
    <gw:data id="fpbp00100_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="10,19,20,21,24,28,31,32,38,39,40,41,42,43" function="PROD.sp_sel_fpbp00100_2" procedure="prod.sp_upd_fpbp00100_2" > 
                <input> 
                    <input bind="dtFrom_t2" /> 
                    <input bind="dtTo_t2" />  
                    <input bind="txtSONo_t2" />
                    <input bind="txtItem_t2" />
                </input> 
                <output bind="idGrid1_t2" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="fpbp00100_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="8,11,28,32,33,34,35,36" function="prod.sp_sel_fpbp00100_3" procedure="prod.sp_upd_fpbp00100_3" > 
                <input> 
                    <input bind="dtFrom_t2" /> 
                    <input bind="dtTo_t2" />  
                    <input bind="txtSONo_t2" />
                    <input bind="txtItem_t2" />
                </input> 
                <output bind="idGrid2_t2" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:tab>
        <table style="height: 100%; width: 100%" name="Stock Booking">
        <tr style="height: 5%">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr style="height: 100%">
                        <td style="width: 10%" align="right">
                            Book date
                        </td>
                        <td style="width: 10%" align="right">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 10%" align="left">
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 10%" align="right">
                            <b>Book SO No</b>
                        </td>
                        <td style="width: 20%">
                            <gw:textbox id="txtSONo" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 10%" align="right">
                            Item
                        </td>
                        <td style="width: 20%" align="right">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Get Order" onclick="OnSearch(1)" />
                        </td>
                        <td style="width: 2%" align="RIGHT">
                            <gw:imgbtn id="ibtnSave1" img="save" alt="Save" onclick="OnSave('idGrid1')" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:icon id="idBtnApprove" img="in" text="Approve" styles='width:100%' onclick="OnApprove(1)" />
                        </td>
                        <td style="width: 4%" align="right">
                            <gw:icon id="idBtnTransferStock" img="in" text="Transfer Stock" styles='width:100%'
                                onclick="OnTransferStock(1)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id='top' style="height: 45%">
            <td>
            <gw:grid id='idGrid1'
            header='_TPR_MATCONS_PK|Cons No|_MAT_ITEM_PK|Item Code|Item Name|Mat Uom|Adjust Qty|Booked Qty|_TPR_MATBOOKING_PK|Book No|Doc Date|Booking Status|_TCO_ITEM_PK|Item Code|Item Name|UOM|_TPR_LOTNO_PK|Lot No|_STOCK_WH_PK|_STOCK_WH_ID|WH NM|_RESERVE_WH_PK|_RESERVE_WH_ID|RESERVE WH|Book Date|Booking Qty|Reserve Qty|REF Stock Qty|Description|_CHARGER_EMP_PK|_EMP_ID|Emp Name|_ATT01|_ATT02|_ATT03|_ATT04|_ATT05'
            format='0|0|0|0|0|0|1|1|0|1|4|0|0|0|0|0|0|0|0|0|0|0|0|0|4|1|1|1|0|0|0|0|0|0|0|0|0'
            aligns='0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
            defaults='||||||||||||||||||||||||||||||||||||'
            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0'
            widths='0|1500|0|1500|2000|1000|1500|1500|0|1500|1200|1500|0|1500|2000|1000|0|1500|0|0|1500|0|0|1500|1200|1500|1500|1500|2000|0|0|1500|0|0|0|0|0'
            sorting='T'
            styles='width:100%; height:100%'
            oncellclick ="OnSearch(2)"
            oncelldblclick="OnGridDblClick(this)"
            />
           </td>
        </tr>
        <tr style="height: 5%">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr style="height: 100%">
                        <td style="width: 10%">
                        </td>
                        <td style="width: 10%" align="center">
                        </td>
                        <td style="width: 10%" align="right">
                        </td>
                        <td style="width: 10%" align="center">
                        </td>
                        <td style="width: 10%" align="right">
                        </td>
                        <td style="width: 25%" align="center">
                        </td>
                        <td style="width: 10%">
                        </td>
                        <td style="width: 2%" align="RIGHT">
                            <gw:imgbtn id="ibtnSave2" img="save" alt="Save" onclick="OnSave('idGrid2')" />
                        </td>
                        <td style="width: 8%" align="right">
                            <gw:icon id="idBtnCancelBooking" img="in" text="Cancel Booking" styles='width:100%'
                                onclick="OnCancelBooking(1)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id="down" style="height: 45%">
            <td valign="top">
                <gw:grid id="idGrid2" 
                  header='_TPR_MATCONS_PK|Cons No|_MAT_ITEM_PK|Item Code|Item Name|Mat Uom|Adjust Qty|Booked Qty|_TPR_MATBOOKING_PK|Book No|Doc Date|Booking Status|_TCO_ITEM_PK|Item Code|Item Name|UOM|_TPR_LOTNO_PK|Lot No|_STOCK_WH_PK|_STOCK_WH_ID|WH NM|_RESERVE_WH_PK|_RESERVE_WH_ID|RESERVE WH|Book Date|Booking Qty|Reserve Qty|REF Stock Qty|Description|_CHARGER_EMP_PK|_EMP_ID|Emp Name|_ATT01|_ATT02|_ATT03|_ATT04|_ATT05'
                format='0|0|0|0|0|0|1|1|0|1|4|0|0|0|0|0|0|0|0|0|0|0|0|0|4|1|1|1|0|0|0|0|0|0|0|0|0'
                aligns='0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                defaults='||||||||||||||||||||||||||||||||||||'
                editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                widths='0|1500|0|1500|2000|1000|1500|1500|0|1500|1200|1500|0|1500|2000|1000|0|1500|0|0|1500|0|0|1500|1200|1500|1500|1500|2000|0|0|1500|0|0|0|0|0'
                sorting='T'
                styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    
    
     <table style="height: 100%; width: 100%" name="PO Booking">
        <tr style="height: 5%">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr style="height: 100%">
                        <td style="width: 10%" align="right">
                            Book date
                        </td>
                        <td style="width: 10%" align="right">
                            <gw:datebox id="dtFrom_t2" lang="<%=Session("Lang")%>" styles="width=80%" />
                        </td>
                        <td style="width: 10%" align="left">
                            ~<gw:datebox id="dtTo_t2" lang="<%=Session("Lang")%>" styles="width=80%" />
                        </td>
                        <td style="width: 10%" align="right">
                           Book SO No
                        </td>
                        <td style="width: 20%">
                           <gw:textbox id="txtSONo_t2" styles="width:100%" onenterkey="OnSearch(3)" />                          
                        </td>
                        <td style="width:10%" align="right">
                            Item
                        </td>
                        <td style="width:20%" align="right">
                            <gw:textbox id="txtItem_t2" styles="width:100%" onenterkey="OnSearch(3)" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:imgbtn id="ibtnSearch_t2" img="search" alt="Search" text="Get Order" onclick="OnSearch(3)" />
                        </td>
                        <td style="width: 2%" align="center">
                            <gw:imgbtn id="ibtnSave1_t2" img="save" alt="Save" onclick="OnSave('idGrid3')" />
                        </td>
                        <td style="width: 2%" align="right">
                            <gw:icon id="idBtnApprove_t2" img="in" text="Approve" styles='width:100%' onclick="OnApprove(2)" />
                        </td>
                        <td style="width: 4%" align="right">
                            <gw:icon id="idBtnTransferStock_t2" img="in" text="Transfer Stock" styles='width:100%'
                                onclick="OnTransferStock(2)" />
                        </td>
                    </tr>                  
                </table>
            </td>
        </tr>
        <tr id='Tr1' style="height: 45%">
            <td>
            <gw:grid id='idGrid1_t2'
            header='_REF_BUSS_PK|Buss Name|_Ref PO NO|Ref ETD|_TCO_ITEM_PK|Item Code|Item Name|UOM|Ref PO Qty|Ref Booked Qty|Arrive Qty|_TPR_MATCONS_PK|Cons NO|_MAT_ITEM_PK|Mat Code|Mat NM|UOM|After Adjust Qty|Mat Booked Qty|_TPR_LOTNO_PK|Lot No|_STOCK_WH_PK|_STOCK_WH_ID|Stock WH|_TPR_POBOOKING_PK|_TPR_PURORDD_PK|Book NO|Doc Dt|Booking Status|Booking Dt|Booking Qty|Reserve Qty|_RESERVE_WH_PK|_RESERVE_WH_ID|Reserve WH|_CHARGER_EMP_PK|_EMP_ID|Emp Nm|Description|_ATT01|_ATT02|_ATT03|_ATT04|_ATT05'
            format='0|0|0|4|0|0|0|0|1|1|1|0|0|0|0|0|0|1|1|0|0|0|0|0|0|0|0|4|0|4|1|1|0|0|0|0|0|0|0|0|0|0|0|0'
            aligns='0|0|0|0|0|0|0|1|3|3|3|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
            editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
            widths='0|1500|1500|1200|0|1500|2000|1000|1500|1500|1500|0|1500|0|1500|2000|1000|1500|1500|0|1500|0|0|1500|0|0|1500|1200|1500|1200|1500|1500|0|0|1500|0|0|1500|1500|0|0|0|0|0'
            sorting='T'
            styles='width:100%; height:100%'
            oncelldblclick="OnGridDblClick(this)"
             />
           </td>
        </tr>
        <tr style="height: 5%">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr style="height: 100%">
                        <td style="width: 94%">
                        </td>
                       
                        <td style="width: 2%" align="center">
                            <gw:imgbtn id="ibtnSave2_t2" img="save" alt="Save" onclick="OnSave('idGrid4')" />
                        </td>
                        <td style="width: 4%" align="right">
                            <gw:icon id="idBtnCancelBooking_t2" img="in" text="Cancel Booking" styles='width:100%'
                                onclick="OnCancelBooking(2)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id="Tr2" style="height: 45%">
            <td valign="top">
                <gw:grid id="idGrid2_t2" 
                header='_REF_BUSS_PK|Buss Name|_Ref PO NO|Ref ETD|_TCO_ITEM_PK|Item Code|Item Name|UOM|Ref PO Qty|Ref Booked Qty|Arrive Qty|_TPR_MATCONS_PK|Cons NO|_MAT_ITEM_PK|Mat Code|Mat NM|UOM|After Adjust Qty|Mat Booked Qty|_TPR_LOTNO_PK|Lot No|_STOCK_WH_PK|_STOCK_WH_ID|Stock WH|_TPR_POBOOKING_PK|_TPR_PURORDD_PK|Book NO|Doc Dt|Booking Status|Booking Dt|Booking Qty|Reserve Qty|_RESERVE_WH_PK|_RESERVE_WH_ID|Reserve WH|_CHARGER_EMP_PK|_EMP_ID|Emp Nm|Description|_ATT01|_ATT02|_ATT03|_ATT04|_ATT05'
                format='0|0|0|4|0|0|0|0|1|1|1|0|0|0|0|0|0|1|1|0|0|0|0|0|0|0|0|4|0|4|1|1|0|0|0|0|0|0|0|0|0|0|0|0'
                aligns='0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                widths='0|1500|1500|1200|0|1500|2000|1000|1500|1500|1500|0|1500|0|1500|2000|1000|1500|1500|0|1500|0|0|1500|0|0|1500|1200|1500|1200|1500|1500|0|0|1500|0|0|1500|1500|0|0|0|0|0'
                sorting='T'
                styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    </gw:tab>
    <!----------------------------------------------------------------------------------------------->
    <gw:textbox id="txtMaster_PK" style="display: none" />
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txt_user_pk" maxlen="100" styles='width:100%;display:none' />
    <!----------------------------------------------------------------------------------------------->
</body>
</html>
