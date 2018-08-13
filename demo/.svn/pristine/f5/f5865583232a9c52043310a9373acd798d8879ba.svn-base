<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>IQC Request Entry</title>

<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

    <script>
//=====================================================================================
 var GS_PK  = 0 ;
 var ischangeData =0;
 var G1_Detail_PK         = 0,           
     G1_TPR_REQIQC_PK     = 1,
     G1_tpr_purordd_pk    = 2,
     G1_No                = 3,
     G1_Item_PK           = 4,
     G1_Item_Code         = 5,
     G1_Item_Name         = 6,
     G1_Spec1             = 7,
     G1_Spec2             = 8,
     G1_Spec3             = 9,
     G1_Spec4             = 10,
     G1_Spec5             = 11,
     G1_Unit              = 12,
     G1_tpr_lotno_pk      = 13,  
     G1_Lot_No            = 14,
     G1_Vendor_PK         = 15,
     G1_Vendor            = 16,
     G1_RECEIVE_FROM_PK   = 17,
     G1_Receiver_From     = 18,
     G1_Invoice_No        = 19,
     G1_Req_Qty           = 20, 
     G1_Iqc_Qty           = 21,     
     G1_Req_UOM           = 22,
     G1_req_weight        = 23,   
     G1_Weight_Qty        = 24,
     G1_Weight_UOM        = 25,
     G1_Lot_Qty           = 26,
     G1_Lot_UOM           = 27,
     G1_Roll_Num          = 28,  
     G1_Barcode_Qty       = 29,
     G1_item_width        = 30, 
     G1_width_uom         = 31,
     G1_Description       = 32,
     G1_i_weight          = 33; 
           
 var G3_pk              = 0,   
     G3_tpr_reqiqcd_pk  = 1,  
     G3_tco_item_pk     = 2,  
     G3_tpr_lotno_pk    = 3,   
     G3_lot_no          = 4,  
     G3_unit_lot_qty    = 5,   
     G3_item_uom        = 6,   
     G3_item_width      = 7   
     G3_width_uom       = 8,   
     G3_u_i_weight      = 9,   
     G3_unit_weight_qty = 10,   
     G3_weight_uom      = 11,   
     G3_lot_qty         = 12,   
     G3_lot_uom         = 13,   
     G3_total_lot_qty   = 14,   
     G3_actual_qty      = 15,   
     G3_total_weight    = 16
     
 var flag ; // 'view', 'save'
//========================================================================================
    function OnToggle()
    {
        var left = document.all("left"); 
        var right = document.all("right"); 
        var imgArrow = document.all("imgArrow"); 

        if(imgArrow.status == "expand"){
            left.style.display="none";
            imgArrow.status = "collapse";
            right.style.width="100%";
            imgArrow.src = "../../../system/images/next_orange.gif";
        }
        else{
            left.style.display="";
            imgArrow.status = "expand";
            right.style.width="75%";
            imgArrow.src = "../../../system/images/prev_orange.gif";
        }
    }
//========================================================================================

 function BodyInit()
 { 
    txtRequester.SetEnable(false);
    txtSupplier.SetEnable(false);
    //------------------------------
    dtbSearchFrom.SetDataText(System.AddDate(dtbSearchFrom.GetData(),-30));
    //------------------------------
    BindingDataList();
    FormatGrid();
    //------------------------------
 }
//========================================================================================
 
 function BindingDataList()
 {   
        var data ="<%= ESysLib.SetListDataSQL(" select pk,partner_id from tco_company where del_if = 0") %>";
        cboCompany.SetDataText(data);
        
        data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC0060') FROM DUAL" )%>";    
        lstIQCStatus.SetDataText(data);        
 }
//========================================================================================

 function FormatGrid()
 {
      var trl ;
      
      trl = grdDetail.GetGridControl(); 
      	  
      trl.ColFormat( G1_Iqc_Qty )    = "###,###,###,###,###.##";
      trl.ColFormat( G1_Req_Qty )    = "###,###,###,###,###.##";
      trl.ColFormat( G1_req_weight ) = "###,###,###,###,###.###";
      trl.ColFormat( G1_Weight_Qty ) = "###,###,###,###,###.###";
      trl.ColFormat( G1_Lot_Qty )    = "###,###,###,###,###.##";
      trl.ColFormat( G1_Roll_Num )   = "###,###,###,###,###";
      
      trl = grdLotDtl.GetGridControl();
      	        
      trl.ColFormat( G3_unit_lot_qty )    = "###,###,###,###,###.##";
      trl.ColFormat( G3_unit_weight_qty ) = "###,###,###,###,###.###";
      trl.ColFormat( G3_total_weight )    = "###,###,###,###,###.###";
      trl.ColFormat( G3_lot_qty )         = "###,###,###,###,###";
      trl.ColFormat( G3_total_lot_qty )   = "###,###,###,###,###.##";
      trl.ColFormat( G3_actual_qty )      = "###,###,###,###,###.##";
 } 
//========================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Requester':
            var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtRequester.text   = obj[2];
                txtRequesterPK.text = obj[0];
            }
        break; 
        
        case 'PO' :        
            var fpath = System.RootURL + "/form/fp/ab/fpab00020.aspx";
            var oValue = System.OpenModal( fpath , 1000 , 650 , 'resizable:yes;status:yes');

            if ( oValue != null )
            {
                   for ( var i=0; i<oValue.length;i++)
                    {
                        var aTemp = oValue[i];
                        grdDetail.AddRow();
                        
                        grdDetail.SetGridText(grdDetail.rows-1, G1_TPR_REQIQC_PK,  txtMasterPK.text); // Master PK
                        grdDetail.SetGridText(grdDetail.rows-1, G1_tpr_purordd_pk, aTemp[4]); //_tpr_purordd_pk
                        grdDetail.SetGridText(grdDetail.rows-1, G1_Item_PK,        aTemp[5]); // Item PK
                        grdDetail.SetGridText(grdDetail.rows-1, G1_Item_Code,      aTemp[6]); // Item Code
                        grdDetail.SetGridText(grdDetail.rows-1, G1_Item_Name,      aTemp[7]); // Item Name
                        grdDetail.SetGridText(grdDetail.rows-1, G1_Unit,           aTemp[8]); // Unit
                        grdDetail.SetGridText(grdDetail.rows-1, G1_Req_UOM,        aTemp[8]); // Req UOM 
                        
                        grdDetail.SetGridText(grdDetail.rows-1, G1_Req_Qty,        aTemp[11] - aTemp[17]);
                        grdDetail.SetGridText(grdDetail.rows-1, G1_Iqc_Qty,        aTemp[11] - aTemp[17]);
                        
                        grdDetail.SetGridText(grdDetail.rows-1, G1_Vendor_PK, aTemp[0]); //_TCO_BUSPARTNER_PK
                        grdDetail.SetGridText(grdDetail.rows-1, G1_Vendor,    aTemp[1]); // Vendor
                        grdDetail.SetGridText(grdDetail.rows-1, G1_No,        aTemp[22]); // PO No
 
                    }
            }        
        break;
                
        case 'Supplier' :
             var path = System.RootURL + "/form/fp/ab/fpab00120.aspx?partner_type=AP";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtSupplierPK.text   = object[0];
                txtSupplier.text     = object[2];                
	         }
        break;               
    }
}        
        
//========================================================================================
  
function OnNew()
{
    data_fpfo00120_1.StatusInsert();

    //-------------------------------------------
    cboCompany.value = "<%=Session("COMPANY_PK") %>";

    txtRequester.text    = "<%=Session("USER_NAME")%>";
    txtRequesterPK.text  = "<%=Session("EMPLOYEE_PK")%>";
    //------------------------------------------- 
    grdDetail.ClearData();
    grdLotDtl.ClearData();
    
    flag="view"; 
 
}  
//========================================================================================

function OnAddLotNo()
{
    if ( grdDetail.row > 0 && grdDetail.GetGridData( grdDetail.row, G1_Detail_PK) != '' )
    {
        
        grdLotDtl.AddRow();  
        grdLotDtl.SetGridText( grdLotDtl.rows-1, G3_tpr_reqiqcd_pk, grdDetail.GetGridData( grdDetail.row, G1_Detail_PK) );
        grdLotDtl.SetGridText( grdLotDtl.rows-1, G3_tco_item_pk,    grdDetail.GetGridData( grdDetail.row, G1_Item_PK  ) );
        grdLotDtl.SetGridText( grdLotDtl.rows-1, G3_u_i_weight,     grdDetail.GetGridData( grdDetail.row, G1_i_weight) );        
        grdLotDtl.SetGridText( grdLotDtl.rows-1, G3_weight_uom,     grdDetail.GetGridData( grdDetail.row, G1_Weight_UOM) );
        grdLotDtl.SetGridText( grdLotDtl.rows-1, G3_unit_lot_qty,   grdDetail.GetGridData( grdDetail.row, G1_Lot_Qty  ) );
             
        grdLotDtl.SetGridText( grdLotDtl.rows-1, G3_width_uom,      grdDetail.GetGridData( grdDetail.row, G1_width_uom) );        
        grdLotDtl.SetGridText( grdLotDtl.rows-1, G3_item_width,     grdDetail.GetGridData( grdDetail.row, G1_item_width) );
        
        grdLotDtl.SetGridText( grdLotDtl.rows-1, G3_item_uom,       grdDetail.GetGridData( grdDetail.row, G1_Req_UOM) );
        grdLotDtl.SetGridText( grdLotDtl.rows-1, G3_lot_uom,        grdDetail.GetGridData( grdDetail.row, G1_Lot_UOM  ) );
                
        grdLotDtl.SetGridText( grdLotDtl.rows-1, G3_unit_weight_qty, Number(grdLotDtl.GetGridData( grdLotDtl.rows-1, G3_u_i_weight)) * Number(grdLotDtl.GetGridData( grdLotDtl.rows-1, G3_unit_lot_qty))  );                        
        grdLotDtl.SetGridText( grdLotDtl.rows-1, G3_total_lot_qty, Number(grdLotDtl.GetGridData( grdLotDtl.rows-1, G3_unit_lot_qty)) *  Number(grdLotDtl.GetGridData( grdLotDtl.rows-1, G3_lot_qty)));           
        grdLotDtl.SetGridText( grdLotDtl.rows-1, G3_actual_qty, grdLotDtl.GetGridData( grdLotDtl.rows-1, G3_total_lot_qty));
        grdLotDtl.SetGridText( grdLotDtl.rows-1, G3_total_weight, Number(grdLotDtl.GetGridData( grdLotDtl.rows-1, G3_lot_qty)) *  Number(grdLotDtl.GetGridData( grdLotDtl.rows-1, G3_unit_weight_qty)));
        ischangeData =1;
    }  
    else
    {
        alert('Pls select saved iqc detail first.');
    }  
}
//========================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':            
            data_fpfo00120.Call("SELECT");
        break;
    
        case 'grdMaster':
            grdDetail.ClearData();
            grdLotDtl.ClearData();
            if ( data_fpfo00120_1.GetStatus() == 20 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, GS_PK );
                    }
                    else
                    {
                        txtMasterPK.text = '' ;
                    }
                    
                    flag = 'view' ;
                    data_fpfo00120_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, GS_PK );
                }
                else
                {
                    txtMasterPK.text = '' ;
                }
                flag = 'view' ;
                data_fpfo00120_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_fpfo00120_2.Call("SELECT");
        break;
         
        case 'grdLotDtl': 
            if ( grdDetail.row > 0 )
            {
                txtIQCDPK.text = grdDetail.GetGridData( grdDetail.row, G1_Detail_PK );
            }
            else
            {
                txtIQCDPK.text = '' ;
            }
            
            CheckChangeData();            
            if(ischangeData!=0)
            {
                if(confirm("Lot infomation has been changed. \n Do you want to save?"))
                {
                    if(OnValidateLotNO())
                        data_fpfo00120_3.Call('');
                }
                else
                {
                   data_fpfo00120_3.Call('SELECT');               
                } 
            }
            else
            {
               data_fpfo00120_3.Call('SELECT');               
            }         
        break;        
    }
}
//========================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case 'data_fpfo00120':
            if ( grdSearch.rows > 0 )
            {
                flag ='view';
                grdSearch.GetGridControl().Select(1,1,1,2);
                txtMasterPK.text = grdSearch.GetGridData(1, GS_PK );
                data_fpfo00120_1.Call('SELECT');
            }
        break;
        case "data_fpfo00120_1": 
                   
            if ( flag == 'save')
            {
                for(var i=0; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G1_TPR_REQIQC_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G1_TPR_REQIQC_PK, txtMasterPK.text);
                    }    
                }
                
                //txtVNoSearch.text = txtVoucherNo.text ;
                
                OnSave('Detail');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdDetail');   
            }
            
        break;
        
        case "data_fpfo00120_2":
            if ( flag != 'view' ) 
            {   
                OnSearch('grdSearch');
            }
            else
            {
                if ( grdDetail.rows > 1 )
                {
                    grdDetail.GetGridControl().Select(1,0,1,5);
                    txtIQCDPK.text = grdDetail.GetGridData(1, G1_Detail_PK );
                    OnSearch('grdLotDtl');
                }
            }
            
            if ( grdDetail.rows > 1 )
            {
                 grdDetail.SetCellBgColor( 1, G1_Lot_No, grdDetail.rows-1, G1_Lot_No, 0xCCFFFF );
                 grdDetail.SetCellBgColor( 1, G1_Item_Code, grdDetail.rows-1, G1_Item_Code, 0xCCFFFF );
                 
                 grdDetail.SetCellBold( 1, G1_Req_Qty,    grdDetail.rows-1, G1_Req_Qty,    true);  
                 grdDetail.SetCellBold( 1, G1_Weight_Qty, grdDetail.rows-1, G1_Weight_Qty, true); 
                 grdDetail.SetCellBold( 1, G1_Lot_Qty,    grdDetail.rows-1, G1_Lot_Qty,    true); 
            }
        break;   
        case "data_fpfo00120_3":
            if( ischangeData==1)
            {
                ischangeData = 0;
                if(txtIQCDPK.text !="")
                {
                    data_fpfo00120_3.Call('SELECT');
                }
            }
        break;   
    }
}

//========================================================================================

 function OnDelete(index)
 {        
    switch (index)
    {
        case 'Master':// delete master
            if(confirm('Do you want to delete this Voucher?'))
            {
                flag='delete';
                data_fpfo00120_1.StatusDelete();
                data_fpfo00120_1.Call();
            }   
        break;

        case 'Detail':
            if ( confirm( "Do you want to mark this row to delete?"))
            {
                if ( grdDetail.row > 0 )
                {
                    if ( grdDetail.GetGridData( grdDetail.row, G1_Detail_PK) == '' )
                    {
                        grdDetail.RemoveRow();
                    }
                    else
                    {
                        grdDetail.DeleteRow();
                    }
                }
            }          
        break;            
        case 'Lot NO':
            if ( confirm( "Do you want to mark this row to delete?"))
            {
                if ( grdLotDtl.row > 0 )
                {
                    if ( grdLotDtl.GetGridData( grdLotDtl.row, G3_pk) == '' )
                    {
                        grdLotDtl.RemoveRow();
                    }
                    else
                    {
                        grdLotDtl.DeleteRow();
                    }
                }
                UpdateIQCQty();
            }
        break;
    }     
}

//========================================================================================
function Validate()
{   
    //---------------
    for( var i = 1; i < grdDetail.rows; i++)
    {
        //---------------
        if ( Number(grdDetail.GetGridData(i, G1_Req_Qty)) == 0)
        {
            alert("Input IQC Qty. at " + i + ",pls!")
            return false;
        }
        //---------------
    }
    //----------------
    return true;
}
//========================================================================================

function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            if( Validate() )
            {
                data_fpfo00120_1.Call();
                flag='save';
            }            
        break;
        case 'Detail':        
            data_fpfo00120_2.Call();
        break;
        case 'LotNo':
            if(OnValidateLotNO())
                data_fpfo00120_3.Call();
        break;
    }
}

//========================================================================================

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G1_Req_Qty || col == G1_Weight_Qty || col == G1_Roll_Num || col == G1_Lot_Qty )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {   
                if ( col == G1_Roll_Num )
                {
                    grdDetail.SetGridText( row, col, parseFloat(dQuantiy+"").toFixed(0));
                }
                else if ( col == G1_Weight_Qty )
                {
                    grdDetail.SetGridText( row, col, parseFloat(dQuantiy+"").toFixed(5));
                }                
                else
                {
                    grdDetail.SetGridText( row, col, parseFloat(dQuantiy+"").toFixed(2));
                }    
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdDetail.SetGridText( row, col, "");
            }
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        } 
    }
}
//======================================================================
function CheckChangeData()
{
    ischangeData =0;
    for(i=1; i< grdLotDtl.rows; i++)
    {    
        ischangeData = Number(ischangeData) + Number(grdLotDtl.GetRowStatus(i));
    }
}
//======================================================================

function OnValidateLotNO()
{
    for(i=1; i< grdLotDtl.rows; i++)
    {
    
        if(grdLotDtl.GetRowStatus(i)!='64' )
        {
            if(grdLotDtl.GetGridData(i, G3_lot_no)=="")
            {
                alert("Please input lot no at row " + (i));
                return false;
            }
                      
            if( Number(grdLotDtl.GetGridData(i, G3_unit_lot_qty))==0)
            {
                alert("Please input unit lot qty at row " + (i));
                return false;
            }
            
            /*if(Number(grdLotDtl.GetGridData(i, G3_unit_weight_qty))==0)
            {
                alert("Please input unit weight qty at row " + (i));
                return false;
            }
            
            if(Number(grdLotDtl.GetGridData(i, G3_lot_qty))==0)
            {
                alert("Please input lot qty at row " + (i));
                return false;
            }
            */
            if(Number(grdLotDtl.GetGridData(i, G3_total_lot_qty))==0)
            {
                alert("Please input total lot qty at row " + (i));
                return false;
            }
            
            /*
            if(Number(grdLotDtl.GetGridData(i, G3_actual_qty))==0)
            {
                alert("Please input actual qty at row " + (i));
                return false;
            }
            
            if(Number(grdLotDtl.GetGridData(i, G3_total_weight))==0)
            {
                alert("Please input total weight at row " + (i));
                return false;
            }
            */
        }
    }
    return true;
}             
//======================================================================
function OnGridCellDoubleClick(oGrid)
{
    var  row, col ;
    
    row = event.row ;
    col = event.col ; 
    
    if ( col == G1_Req_UOM )
    {
           var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
           var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
           
           if ( obj != null )
           {
                grdDetail.SetGridText( row, col, obj[1]);
           }	    
    }
    else if ( col == G1_Item_Code )
    {
      var path   = System.RootURL + '/form/fp/ab/fpab00110.aspx?group_type=Y|Y||||';
      var object = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:600px');	
      
      if ( object != null )
      {
            grdDetail.SetGridText( row, G1_Item_PK, object[0]);
            grdDetail.SetGridText( row, G1_Item_Code,       object[1]);
            grdDetail.SetGridText( row, G1_Item_Name,       object[2]);
      }
    }      
}
//======================================================================
function OnGridLotNoCellDoubleClick(oGrid)
{
    var  row, col ;
    
    row = event.row ;
    col = event.col ; 
    
    if ( col == G3_lot_no )
    {
          var path   = System.RootURL + '/form/ag/fp/agfp00050.aspx?item_pk=' + grdLotDtl.GetGridData( row, G3_tco_item_pk ) ;
          var object = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:600px');	
          
          if ( object != null )
          {
                grdLotDtl.SetGridText( row, G3_tpr_lotno_pk, object[0]);
                grdLotDtl.SetGridText( row, G3_lot_no,       object[1]);
          }
    }       
    else if ( col == G3_item_uom || col == G3_weight_uom || col == G3_lot_uom || col == G3_width_uom)
    {
           var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
           var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
           
           if ( obj != null )
           {
                grdLotDtl.SetGridText( row, col, obj[1]);
           }	    
    }
}
//=====================================================================================
function OnAfterEditting()
{
    var row = event.row;
    var col = event.col;  
    ischangeData =1;
   if(row>0)
   {
       if(col== G3_unit_lot_qty || col == G3_lot_qty || col == G3_unit_lot_qty)
       {          
           grdLotDtl.SetGridText( row, G3_total_lot_qty, Number(grdLotDtl.GetGridData( row, G3_unit_lot_qty)) *  Number(grdLotDtl.GetGridData( row, G3_lot_qty)));           
           grdLotDtl.SetGridText( row, G3_actual_qty, grdLotDtl.GetGridData( row, G3_total_lot_qty));
           
           grdLotDtl.SetGridText( row, G3_unit_weight_qty, Number(grdLotDtl.GetGridData( row, G3_unit_lot_qty)) *  Number(grdLotDtl.GetGridData( row, G3_u_i_weight)));             
           grdLotDtl.SetGridText( row, G3_total_weight, Number(grdLotDtl.GetGridData( row, G3_lot_qty)) *  Number(grdLotDtl.GetGridData( row, G3_unit_weight_qty)));
       }     
       UpdateIQCQty();   
   }    
}
//=====================================================================================
function UpdateIQCQty()
{
   var sumReqQty=0;
   for (i=1; i<grdLotDtl.rows;i++)
   {
        if(grdLotDtl.GetRowStatus(i)<'64')
            sumReqQty = sumReqQty + Number(grdLotDtl.GetGridData( i, G3_actual_qty));   
   }
   
   grdDetail.SetGridText(grdDetail.row, G1_Iqc_Qty, sumReqQty);
   grdDetail.SetGridText(grdDetail.row, G1_Weight_Qty, sumReqQty * Number(grdDetail.GetGridData( grdDetail.row, G1_i_weight)));
}
//===================================================================================== 
function OnGridClickCell()
{
    if(grdDetail.row>0)
    {
        txtIQCDPK.text = grdDetail.GetGridData(grdDetail.row, G1_Detail_PK);
    }
    
    if(ischangeData!=0)
    {
        if(confirm("Lot infomation has been changed. \n Do you want to save?"))
        {
            data_fpfo00120_3.Call('');
        }
    }
    else
    {
        if(txtIQCDPK.text !="")
        {
            data_fpfo00120_3.Call('SELECT');
        }
    }
}
//===================================================================================== 
function OnExcelClick(index)
{
    switch(index)
    {
        case 1:
            var url = System.RootURL + "/reports/fp/fo/fpfo00120.aspx?tpr_reqiqc_pk=" + txtMasterPK.text + "&isMaster=1" ;
            System.OpenTargetPage(url); 
        break;
        case 2:
            var url = System.RootURL + "/system/ReportEngine.aspx?file=fp/fo/fpfo00120.rpt&procedure=prod.sp_rpt_fpfo00120&parameter=" + txtMasterPK.text + ",0&export_pdf=Y" ;              
            System.OpenTargetPage(url); 
        break;
    }
}
//======================================================================
function OnUnDelete(obj)
{
    switch(obj)
    {
        case 'Detail':
	        grdDetail.UnDeleteRow();
	    break;
	    case 'Lot NO':
	        grdLotDtl.UnDeleteRow();
	        UpdateIQCQty();
	    break;
	}
}
//======================================================================
function OnOpenLabel()
{
    if ( txtMasterPK.text != '' )
    {
        
        var path = System.RootURL + '/form/fp/fo/fpfo00121.aspx?iqcreq_pk=' + txtMasterPK.text +'&iqcreq_no=' + txtVoucherNo.text ;            
        //----------   
        var obj = System.OpenModal( path , 900 , 550, 'resizable:yes;status:yes');
        //----------
        data_fpfo00120_2.Call('SELECT');
    }
    else 
    {
        alert('Pls Save IQC Req first.');
    }  	    
} 

//======================================================================   
    
    </script>

</head>
<body>
    <!---------------------------------------------------------------------------------------------->
    <gw:data id="data_fpfo00120" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" function="<%= l_user %>lg_sel_fpfo00120" > 
                <input bind="grdSearch" >
                    <input bind="txtVNoSearch" />
				    <input bind="dtbSearchFrom" />
                    <input bind="dtbSearchTo" />
                </input>
                <output bind="grdSearch" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------------------------------->
    <gw:data id="data_fpfo00120_1" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="2" type="control" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10" function="<%= l_user %>lg_sel_fpfo00120_1" procedure = "<%= l_user %>lg_upd_fpfo00120_1"> 
                <input>
                        <inout bind="txtMasterPK" />
                        <inout bind="cboCompany" />
                        <inout bind="dtVoucherDate" />
                        <inout bind="txtVoucherNo" />
                        <inout bind="dtDeliDate" />
                        <inout bind="lstIQCStatus" />
                        <inout bind="txtRequesterPK" />                        
                        <inout bind="txtRequester" />
                        <inout bind="txtSupplierPK" />
                        <inout bind="txtSupplier" />
                        <inout bind="txtDescription" />
                </input>
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------------------------------->
    <gw:data id="data_fpfo00120_2" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30" function="<%= l_user %>lg_sel_fpfo00120_2" procedure = "<%= l_user %>lg_upd_fpfo00120_2" > 
                <input bind="grdDetail" >
                    <input bind="txtMasterPK" />
                </input>
                <output bind="grdDetail" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------------------------------->
    <gw:data id="data_fpfo00120_3" onreceive="OnDataReceive(this)">
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="<%= l_user %>lg_sel_fpfo00120_3" procedure = "<%= l_user %>lg_upd_fpfo00120_3" > 
                <input bind="grdLotDtl" >
                    <input bind="txtIQCDPK" />
                </input>
                <output bind="grdLotDtl" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------------------------------->
    <table border="1" style="height: 100%; width: 100%">
        <tr>
            <td style="width: 20%" id="left">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td align="right">
                            Date</td>
                        <td align="left" style="white-space: nowrap">
                            <gw:datebox id="dtbSearchFrom" lang="<%=Application("Lang")%>" mode="01" />
                            ~
                            <gw:datebox id="dtbSearchTo" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="white-space: nowrap">
                            Voucher No</td>
                        <td colspan="2">
                            <gw:textbox id="txtVNoSearch" styles="width:100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_pk|Voucher Date|Voucher No" format="0|4|0" aligns="0|0|0"
                                defaults="|||" editcol="0|0|0" widths="0|1400|1800" styles="width:100%; height:100%"
                                sorting="F" oncellclick="OnSearch('grdMaster')" param="0,1,2" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 80%" id="right">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Company</td>
                        <td style="width: 20%">
                            <gw:list id="cboCompany" styles="width:100%;"></gw:list>
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Voucher No</td>
                        <td style="width: 20%">
                            <gw:textbox id="txtVoucherNo" styles="width:100%;" csstype="mandatory" />
                        </td>
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Voucher Date</td>
                        <td style="width: 20%">
                            <gw:datebox id="dtVoucherDate" lang="<%=Application("Lang")%>" mode="01" styles="width:100%;background-color : #fffaaf;" />
                        </td>
                        <td style="width: 4%">
                        </td>
                        <td style="width: 1%">
                            <gw:icon id="idBtnLabel" img="2" text="Label" styles='width:100%' onclick="OnOpenLabel()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnExcel" img="excel" alt="Excel" text="Excel" onclick="OnExcelClick(1)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnExcel1" img="excel" alt="Print Card" text="Print Card" onclick="OnExcelClick(2)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnNew()" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right">
                            Deli Date</td>
                        <td>
                            <gw:datebox id="dtDeliDate" lang="<%=Application("Lang")%>" mode="01" styles="width:100%;background-color : #fffaaf;" />
                        </td>
                        <td align="right">
                            <%--Status--%>
                        </td>
                        <td>
                            <gw:list id="lstIQCStatus" styles="width:100%;display:none"></gw:list>
                        </td>
                        <td align="right" style="width: 10%">
                            <a title="Click here to select Requester" onclick="OnPopUp('Supplier')" href="#tips"
                                style="text-decoration: none; color=#0000ff"><b>Supplier</b></a>
                        </td>
                        <td colspan="8">
                            <gw:textbox id="txtSupplier" styles="width:100%;" onenterkey="" />
                            <gw:textbox id="txtSupplierPK" styles="display=none" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right">
                            Description
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtDescription" styles="width:100%;" />
                        </td>
                        <td align="right">
                            <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Requester')">Requester </b>
                        </td>
                        <td colspan="8">
                            <gw:textbox id="txtRequesterPK" styles="display:none;" />
                            <gw:textbox id="txtRequester" styles="width:100%;" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="left" style="white-space: nowrap" colspan="2">
                        </td>
                        <td colspan="2">
                        </td>
                        <td>
                        </td>
                        <td align="right" colspan="6">
                            <table style="height: 100%; width: 100%">
                                <tr align="right">
                                    <td style="width: 96%">
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="ibtnItemPO" img="in" text="P/O" alt="Get Item from PO" onclick="OnPopUp('PO')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            <gw:imgbtn id="btnDeleteD" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" />
                        </td>
                        <td>
                            <gw:imgbtn id="btnUDeleteD" img="udelete" alt="UnDelete" text="UnDelete" onclick="OnUnDelete('Detail')" />
                        </td>
                    </tr>
                    <tr style="height: 46%">
                        <td colspan="13">
                            <gw:grid id='grdDetail' header='_PK|_TPR_REQIQC_PK|_tpr_purordd_pk|No|_Item_PK|Item Code|Item Name|_Spec1|_Spec2|_Spec3|_Spec4|_Spec5|_Unit|_tpr_lotno_pk|_Lot No|_Vendor_PK|Vendor|_RECEIVE_FROM_PK|Deliver|Invoice No|PO Qty.|IQC. Qty|UOM|PO Weight|IQC Weight|W.UOM|_Lot Qty|_L.UOM|_Roll Num|_Barcode Qty|Item Width|Width UOM|Description|_i_weight'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|1|0|1|0|1|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|3|3|1|3|3|1|3|1|3|1|3|1|0|0'
                                editcol='0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|0|1|0|1|0|1|0|1|0|0|0' widths='0|0|0|1000|0|1500|2500|1000|1000|1000|1000|1000|800|0|1200|0|2000|0|2000|1500|1200|1200|1000|1200|1200|1000|1200|1000|1000|1200|1200|1200|1000|0'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)" onclick="OnSearch('grdLotDtl')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="9">
                        </td>
                        <td>
                            <gw:imgbtn id="btnAddLotNO" img="new" alt="Add Lot No" text="Add Lot No" onclick="OnAddLotNo()" />
                        </td>
                        <td>
                            <gw:imgbtn id="btnDeleteLotNO" img="delete" alt="Delete Lot No" text="Delete Lot No"
                                onclick="OnDelete('Lot NO')" />
                        </td>
                        <td>
                            <gw:imgbtn id="btnUdelLotNO" img="udelete" alt="Undelete Lot No" text="Undelete Lot No"
                                onclick="OnUnDelete('Lot NO')" />
                        </td>
                        <td>
                            <gw:imgbtn id="btnSaveLotNO" img="Save" alt="Save Lot No" text="Save Lot No" onclick="OnSave('LotNo')" />
                        </td>
                    </tr>
                    <tr style="height: 49%">
                        <td colspan="13">
                            <gw:grid id='grdLotDtl' 
                                header='_pk|_tpr_reqiqcd_pk|_tco_item_pk|_tpr_lotno_pk|Lot No|U/Lot Qty|Item UOM|Item Width|Width UOM|Item Weight|U/Lot Weight|Weight UOM|Lot Qty|Lot UOM|Total Lot Qty|_Actual Qty|_Total Weight'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                aligns='0|0|0|0|0|3|0|3|0|3|3|0|3|0|3|3|3'
                                defaults='||||||||||||||||'
                                editcol='0|0|0|0|1|1|0|1|0|0|1|0|1|0|1|1|1'
                                widths='0|0|0|0|1200|1000|1000|1200|1100|1200|1300|1200|1000|1000|1300|1300|1300'
                                sorting='T' styles='width:100%; height:100%' 
                              
                                onafteredit ="OnAfterEditting()"/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="display:none;" />
    <gw:textbox id="txtIQCDPK" styles="display:none;" />
    <gw:textbox id="txtIQCDTmpPK" text="" styles="display:none;" />
    <!---------------------------------------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!---------------------------------------------------------------------------------------------->
</body>
</html>
