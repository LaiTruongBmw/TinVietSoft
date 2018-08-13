<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  ESysLib.SetUser("prod")%>
<head runat="server">
    <title>Stock Booking Approve</title>
</head>

<script>
 
    var  user_pk =  "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>" ;
    
    var  G1_doc_date            = 0 ,
         G1_SO_Item_No          = 1 ,
         G1_Bill_To_Name        = 2 ,
         G1_SO_Item_PK          = 3 ,
         G1_SO_Item_Code        = 4 ,
         G1_SO_Item_Name        = 5 ,
         G1_SO_Item_UOM         = 6 ,
         G1_Ord_Qty             = 7 ,
         G1_tco_item_pk         = 8 ,
         G1_item_code           = 9 ,
         G1_item_name           = 10 ,
         G1_uom                 = 11 ,
         G1_tpr_lotno_pk        = 12 ,
         G1_Lot_No              = 13 ,
         G1_Stock_SO_No         = 14 ,
         G1_tin_warehouse_pk    = 15 ,
         G1_WH_ID               = 16 ,
         G1_WH_NM               = 17 ,
         G1_reserve_wh_pk       = 18 ,
         G1_reserve_wh_id       = 19 ,
         G1_reserve_wh_nm       = 20 ,
         G1_book_date           = 21 ,
         G1_booking_qty         = 22 ,  
         G1_reserve_qty         = 23 ,
         G1_Booking_Status      = 24 ,
         G1_Description         = 25 ,
         G1_charger_emp_pk      = 26 ,
         G1_emp_id              = 27 ,
         G1_emp_name            = 28 ,
         G1_Att01               = 29 ,
         G1_Att02               = 30 ,
         G1_Att03               = 31 ,
         G1_Att04               = 32 ,
         G1_Att05               = 33 ,        
         G1_tsa_saleorderd_pk   = 34 ,
         G1_tpr_stockbooking_pk = 35 ;                      
         
    //   columns of grid idGrid2
    var  G2_doc_date            = 0 ,
         G2_SO_Item_No          = 1 ,
         G2_Bill_To_Name        = 2 ,
         G2_SO_Item_PK          = 3 ,
         G2_SO_Item_Code        = 4 ,
         G2_SO_Item_Name        = 5 ,
         G2_SO_Item_UOM         = 6 ,
         G2_Ord_Qty             = 7 ,
         G2_tco_item_pk         = 8 ,
         G2_item_code           = 9 ,
         G2_item_name           = 10 ,
         G2_uom                 = 11 ,
         G2_tpr_lotno_pk        = 12 ,
         G2_Lot_No              = 13 ,
         G2_Stock_SO_No         = 14 ,
         G2_tin_warehouse_pk    = 15 ,
         G2_WH_ID               = 16 ,
         G2_WH_NM               = 17 ,
         G2_reserve_wh_pk       = 18 ,
         G2_reserve_wh_id       = 19 ,
         G2_reserve_wh_nm       = 20 ,
         G2_book_date           = 21 ,
         G2_booking_qty         = 22 ,  
         G2_reserve_qty         = 23 ,
         G2_Booking_Status      = 24 ,
         G2_Description         = 25 ,
         G2_charger_emp_pk      = 26 ,
         G2_emp_id              = 27 ,
         G2_emp_name            = 28 ,
         G2_Att01               = 29 ,
         G2_Att02               = 30 ,
         G2_Att03               = 31 ,
         G2_Att04               = 32 ,
         G2_Att05               = 33 ,        
         G2_tsa_saleorderd_pk   = 34 ,
         G2_tpr_stockbooking_pk = 35 ;             
 //---------------------------------------------------------
 function OnToggle()
 {
    var top  = document.all("top");    
    var imgArrow = document.all("imgArrow");   
    if(imgArrow.status == "expand")
    {
        top.style.display="none";       
        imgArrow.status = "collapse";
        imgArrow.src = "../../../system/images/down.gif";
    }
    else
    {
        top.style.display="";
        imgArrow.status = "expand";
        imgArrow.src = "../../../system/images/up.gif";
   }
 }
 
 //---------------------------------------------------------
 function BodyInit()
 {
      //--------------------------------------
      idGrid1.GetGridControl().FrozenCols = G1_Bill_To_Name ;
      idGrid2.GetGridControl().FrozenCols = G2_Bill_To_Name ;
      //--------------------------------------
      txt_user_pk.text = user_pk;
      //--------------------------------------
      dtFrom.SetDataText( System.AddDate( dtTo.GetData() , -15) );
      dtTo.SetDataText(   System.AddDate( dtTo.GetData() , +15) );
      //--------------------------------------
      BindingDataList();
      FormatGrid();
      //--------------------------------------
 } 

 //---------------------------------------------------------
 function BindingDataList()
 {         
    var data="";
    
     data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='PRAB0090' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " )  %> " ; 
     idGrid1.SetComboFormat(G1_Booking_Status, data);
    
     idGrid2.SetComboFormat(G2_Booking_Status, data);

 }        
 
 //-----------------------------------------------------

function FormatGrid()
{
    //------------------------------------------------------
    var ctrl = idGrid1.GetGridControl();
    ctrl.ColFormat(G1_Ord_Qty)     = "###,###,###.##" ;
    ctrl.ColFormat(G1_booking_qty) = "###,###,###.##" ; 
    ctrl.ColFormat(G1_reserve_qty) = "###,###,###.##" ; 
    //------------------------------------------------------
    var ctrl = idGrid2.GetGridControl();
    ctrl.ColFormat(G2_Ord_Qty)     = "###,###,###.##" ;
    ctrl.ColFormat(G2_booking_qty) = "###,###,###.##" ; 
    ctrl.ColFormat(G2_reserve_qty) = "###,###,###.##" ;
    //------------------------------------------------------     
}

 //---------------------------------------------------------
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 1 :
                fpbp00060.Call("SELECT");
            break; 
            case 2 :
                fpbp00060_1.Call("SELECT");   
            break;             
      }  
 }

 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {            
            case "fpbp00060" :
                if ( idGrid1.rows > 1 )
                {            
                    for ( var i = 1 ; i <= idGrid1.rows - 1; i++ )
                    {
                        if ( idGrid1.GetGridData( i, G1_SO_Item_PK ) != idGrid1.GetGridData( i, G1_tco_item_pk ) )
                        {
                            idGrid1.GetGridControl().Cell( 7 , i , G1_item_code, i, G1_item_code ) = 0x3300cc;
                            idGrid1.GetGridControl().Cell( 7 , i , G1_item_name, i, G1_item_name ) = 0x3300cc;                    
                        }
                    }
                    //--------------------------------
                    idGrid1.SetCellBgColor( 1, G1_SO_Item_Code , idGrid1.rows - 1, G1_SO_Item_Code , 0xCCFFFF );
                    idGrid1.SetCellBgColor( 1, G1_SO_Item_Name , idGrid1.rows - 1, G1_SO_Item_Name , 0xCCFFFF );
                    idGrid1.SetCellBgColor( 1, G1_item_code    , idGrid1.rows - 1, G1_item_code    , 0xCCFFFF );
                    idGrid1.SetCellBgColor( 1, G1_item_name    , idGrid1.rows - 1, G1_item_name    , 0xCCFFFF );
                    
                    idGrid1.SetCellBgColor( 1, G1_Ord_Qty       , idGrid1.rows - 1, G1_Ord_Qty       , 0xd4d2ff );
                    idGrid1.SetCellBgColor( 1, G1_reserve_wh_nm , idGrid1.rows - 1, G1_reserve_wh_nm , 0xd4d2ff );                              
                    idGrid1.SetCellBgColor( 1, G1_reserve_qty   , idGrid1.rows - 1, G1_reserve_qty   , 0xd4d2ff );
                    //--------------------------------
                }    
                fpbp00060_1.Call('SELECT');
            break;
            
            case "fpbp00060_1" :
                if ( idGrid2.rows > 1 )
                {
                    for ( var i = 1 ; i <= idGrid2.rows - 1; i++ )
                    {
                        if ( idGrid2.GetGridData( i, G2_SO_Item_PK ) != idGrid2.GetGridData( i, G2_tco_item_pk ) )
                        {
                            idGrid2.GetGridControl().Cell( 7 , i , G2_item_code, i, G2_item_code ) = 0x3300cc;
                            idGrid2.GetGridControl().Cell( 7 , i , G2_item_name, i, G2_item_name ) = 0x3300cc;                    
                        }
                    }
                    //--------------------------------
                    idGrid2.SetCellBgColor( 1, G2_SO_Item_Code , idGrid2.rows - 1, G2_SO_Item_Code , 0xCCFFFF );
                    idGrid2.SetCellBgColor( 1, G2_SO_Item_Name , idGrid2.rows - 1, G2_SO_Item_Name , 0xCCFFFF );
                    idGrid2.SetCellBgColor( 1, G2_item_code    , idGrid2.rows - 1, G2_item_code    , 0xCCFFFF );
                    idGrid2.SetCellBgColor( 1, G2_item_name    , idGrid2.rows - 1, G2_item_name    , 0xCCFFFF );            

                    idGrid2.SetCellBgColor( 1, G2_Ord_Qty       , idGrid2.rows - 1, G2_Ord_Qty       , 0xd4d2ff );
                    idGrid2.SetCellBgColor( 1, G2_reserve_wh_nm , idGrid2.rows - 1, G2_reserve_wh_nm , 0xd4d2ff );                             
                    idGrid2.SetCellBgColor( 1, G2_reserve_qty   , idGrid2.rows - 1, G2_reserve_qty   , 0xd4d2ff );
                    //--------------------------------  
                }                          
            break;
            
      }  
 }
 
 //---------------------------------------------------------
 
 function OnApprove()
 {
    for ( i = 1 ; i < idGrid1.rows ; i++ )
    {
        if ( idGrid1.GetGridControl().isSelected(i) == true )
        {
            idGrid1.SetGridText( i, G1_Booking_Status, 'CF' ) ;
            //-------------------------------
            if ( Number(idGrid1.GetGridData( i, G1_reserve_qty )+"") == 0 )
            {            
                idGrid1.SetGridText( i, G1_reserve_qty , idGrid1.GetGridData( i, G1_booking_qty ) ) ;
            }                  
        } 
    }   
 }

 //---------------------------------------------------------
 
 function OnTransferStock()
 {
    for ( i = 1 ; i < idGrid1.rows ; i++ )
    {
        if ( idGrid1.GetGridControl().isSelected(i) == true )
        {
            idGrid1.SetGridText( i, G1_Booking_Status, 'TS' ) ;
            //-------------------------------
            if ( Number(idGrid1.GetGridData( i, G1_reserve_qty )+"") == 0 )
            {
                idGrid1.SetGridText( i, G1_reserve_qty, idGrid1.GetGridData( i, G1_booking_qty ) ) ;
            }
            //-------------------------------    
        } 
    }   
 }

 //---------------------------------------------------------
 
 function OnCancelBooking()
 {
    for ( i = 1 ; i < idGrid2.rows ; i++ )
    {
        if ( idGrid2.GetGridControl().isSelected(i) == true )
        {
            idGrid2.SetGridText( i, G2_Booking_Status, 'CC' ) ;  
        } 
    }   
 }
    
 //---------------------------------------------------------
 
 function OnSave(pos)
 {
      switch (pos)         
      {		        
            case 'idGrid1' :
                fpbp00060.Call();
            break;
            case 'idGrid2' :
                fpbp00060_1.Call();
            break;
            
      }  
 }
 
//---------------------------------------------------------
 
 function OnExcel(pos)
 {
      switch (pos)         
      {		        
            case 'Approve' :

                var url =System.RootURL + '/reports/ds/bs/fpbp00060.xls?idList=' + idList.value + '&dtFrom=' + dtFrom.value + '&dtTo=' + dtTo.value +'&txtSONo=' + txtSONo.text + '&txtItem=' + txtItem.text ;
                
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
            
            if ( col == G1_WH_NM || col == G1_reserve_wh_nm )
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
                 var path = System.RootURL + '/form/ag/fp/agfp00050.aspx?item_pk='+ idGrid1.GetGridData(idGrid1.row, G1_tco_item_pk ) ;
                     path = path +'&item_code='+ idGrid1.GetGridData(idGrid1.row, G1_item_code) ;
                     path = path +'&item_name='+ idGrid1.GetGridData(idGrid1.row, G1_item_name) ;
                     path = path +'&item_uom=' + idGrid1.GetGridData(idGrid1.row, G1_uom) ;
                     
                 var obj = System.OpenModal( path , 800 , 500 ,  'resizable:yes;status:yes');
                 if ( obj != null )
                 {
                     idGrid1.SetGridText(event_row, G1_tpr_lotno_pk, obj[0]) ;//stock_pk	    	    
                     idGrid1.SetGridText(event_row, G1_Lot_No,       obj[1]) ;//stock_no
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
    <gw:data id="fpbp00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="12,13,15,18,23,24,25,29,30,31,32,33,35" function="prod.sp_sel_fpbp00060" procedure="prod.sp_upd_fpbp00060" > 
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
    <gw:data id="fpbp00060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="24,25,29,30,31,32,33,35" function="prod.sp_sel_fpbp00060_1" procedure="prod.sp_upd_fpbp00060_1" > 
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
    <!------------------------------------------------------------------>
    <table style="height: 100%; width: 100%">
        <tr style="height: 5%">
            <td>
                <table style="height: 100%; width: 100%">
                    <tr style="height: 100%">
                        <td style="width: 10%" align="right">
                            Book date
                        </td>
                        <td style="width: 10%" align="right">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" styles="width=80%" />
                        </td>
                        <td style="width: 10%" align="left">
                            ~<gw:datebox id="dtTo" lang="<%=Session("Lang")%>" styles="width=80%" />
                        </td>
                        <td style="width: 8%" align="right">
                            <b>Book SO No</b>
                        </td>
                        <td style="width: 12%">
                            <gw:textbox id="txtSONo" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 20%" align="right">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Get Order" onclick="OnSearch(1)" />
                        </td>
                        <td style="width: 5%" align="center">
                            <gw:imgbtn id="ibtnSave1" img="save" alt="Save" onclick="OnSave('idGrid1')" />
                        </td>
                        <td style="width: 5%" align="right">
                            <gw:icon id="idBtnApprove" img="in" text="Approve" styles='width:100%' onclick="OnApprove()" />
                        </td>
                        <td style="width: 10%" align="right">
                            <gw:icon id="idBtnTransferStock" img="in" text="Transfer Stock" styles='width:100%'
                                onclick="OnTransferStock()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id='top' style="height: 45%">
            <td>
                <gw:grid id="idGrid1" header="Doc Date|Book SO No|Customer|_SO_ITEM_PK|_So Item Code|So Item Name|UOM|Ord Qty|_TCO_ITEM_PK|_Item Code|Item Name|UOM|_TPR_LOTNO_PK|Stock No|Stock SO No|_TIN_WAREHOUSE_PK|_WH_ID|Stock WH|_RESERVE_WH_PK|_WH_ID|Book WH|Book Date|Book Qty|Reserved Qty|Status|Description|_CHARGER_EMP_PK|_Emp ID|Emp Name|_ATT01|_ATT02|_ATT03|_ATT04|_ATT05|_TSA_SALEORDERD_PK|_PK"
                    format="4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    aligns="1|0|0|0|0|0|1|3|0|0|0|1|0|0|0|0|0|0|0|0|0|1|3|3|0|0|0|0|0|0|0|0|0|0|0|0"
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|0|0|0|1|1|1|1|1|0|0"
                    widths="1200|2000|2000|1000|1000|4000|800|1500|1000|1000|4000|800|1000|1500|2000|1000|1000|1500|1000|1000|1500|1500|1500|1500|1200|1500|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000"
                    styles="width:100%; height:100%" oncelldblclick="OnGridDblClick(this)" sorting="T"
                    onafteredit="AfterEdit(this)" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35" />
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
                        <td style="width: 5%" align="center">
                            <gw:imgbtn id="ibtnSave2" img="save" alt="Save" onclick="OnSave('idGrid2')" />
                        </td>
                        <td style="width: 10%" align="right">
                            <gw:icon id="idBtnCancelBooking" img="in" text="Cancel Booking" styles='width:100%'
                                onclick="OnCancelBooking()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id="down" style="height: 45%">
            <td valign="top">
                <gw:grid id="idGrid2" header="Doc Date|Book SO No|Customer|_SO_ITEM_PK|_So Item Code|So Item Name|UOM|Ord Qty|_TCO_ITEM_PK|_Item Code|Item Name|UOM|_TPR_LOTNO_PK|Stock No|Stock SO No|_TIN_WAREHOUSE_PK|_WH_ID|Stock WH|_RESERVE_WH_PK|_WH_ID|Book WH|Book Date|Book Qty|Reserved Qty|Status|Description|_CHARGER_EMP_PK|_Emp ID|Emp Name|_ATT01|_ATT02|_ATT03|_ATT04|_ATT05|_TSA_SALEORDERD_PK|_PK"
                    format="4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    aligns="1|0|0|0|0|0|1|3|0|0|0|1|0|0|0|0|0|0|0|0|0|1|3|3|0|0|0|0|0|0|0|0|0|0|0|0"
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|1|1|1|1|1|0|0"
                    widths="1200|2000|2000|1000|1000|4000|800|1500|1000|1000|4000|800|1000|1500|2000|1000|1000|1500|1000|1000|1500|1500|1500|1500|1200|1500|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000"
                    styles="width:100%; height:100%" sorting="T" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35" />
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../system/images/up.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <gw:textbox id="txtMaster_PK" style="display: none" />
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txt_user_pk" maxlen="100" styles='width:100%;display:none' />
    <!----------------------------------------------------------------------------------------------->
</body>
</html>
