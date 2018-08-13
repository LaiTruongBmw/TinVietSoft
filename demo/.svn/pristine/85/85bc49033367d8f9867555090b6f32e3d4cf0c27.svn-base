<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>SALE ORDER ENTRY</title>
</head>
<script type="text/javascript">

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
    var  user_id    = "<%=Session("EMP_ID")%>" ;
	
    var arr_FormatNumber = new Array();     
    
	var G1_MASTER_PK			= 0;
	    
    var G2_DETAIL_PK            = 0,   
        G2_MASTER_PK            = 1,   
        G2_SO_ITEM_NO           = 2,   
        G2_SEQ_NUM              = 3,   
        G2_ITEM_PK              = 4,   
        G2_ITEM_CODE            = 5,   
        G2_ITEM_NAME            = 6,          
        G2_CUST_ITEM         	= 7,   
        G2_ST_QTY               = 8,   
        G2_ST_UOM               = 9, 
        G2_ORD_UNIT             = 10,   
        G2_ORD_QTY              = 11,   
        G2_ORD_UOM              = 12,   
        G2_LOT_UNIT             = 13,   
        G2_LOT_QTY              = 14,   
        G2_LOT_UOM              = 15,   
        G2_UNIT_PRICE           = 16, 
		G2_ITEM_AMOUNT			= 17,
		G2_DISC_AMOUNT			= 18,
		G2_TAX_AMOUNT  			= 19,
        G2_TOTAL_AMOUNT         = 20,   
        G2_ITEM_ETD             = 21,   
        G2_ITEM_ETA             = 22,           
        G2_REMARK               = 23;
		
 var t_view = 'false';       
 //============================================================================
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../../system/images/button/next.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="75%";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
 }

 //===================================================================================
 function BodyInit()
 {
      System.Translate(document);
      txtEmp_PK.text = user_pk;
      
 	  txtBillToCode.SetEnable(false);
      txtBillToName.SetEnable(false);
      txtDeliToCode.SetEnable(false);
      txtDeliToName.SetEnable(false);
      txtDeliLocName.SetEnable(false);
      txtEmpCode.SetEnable(false);
      txtEmpName.SetEnable(false);
	  
	  txtStyleID.SetEnable(false);
      txtStyleName.SetEnable(false);
	  
	  dtFromSearch.SetDataText(System.AddDate(dtToSearch.GetData(),-5));
	  //-----------------------------
	  BindingDataList()
	  //-----------------------------
      OnChangeTab();
      //-----------------------------           
	  AddOnClick('Master');
 }
//===========================================================
function BindingDataList()
{
    	var data="";    
            
        data = "DATA|1|SAVED|2|SUBMITTED|3|APPROVED|4|CANCEL||";
        lstStatusSearch.SetDataText(data);
        lstStatusSearch.value = '' ;
      
        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0250') FROM DUAL" )%>";    
        lstDeliMethod.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0260') FROM DUAL" )%>";    
        lstDeliTerm.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0210') FROM DUAL" )%>"; 
        lstExNation.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0220') FROM DUAL" )%>"; 
        lstDestNation.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGSA1030') FROM DUAL" )%>";    
        lstProductionType.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
        lstCurrency.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGSA1020') FROM DUAL" )%>";    
        lstOrderType.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0110') FROM DUAL" )%>";    
        lstPaymentMethod.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGSA1040') FROM DUAL" )%>"; 
        lstOrdPriority.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0120') FROM DUAL" )%>";    
        lstPaymentTerm.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('IEBS0020') FROM DUAL" )%>";    
        lstExPort.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('IEBS0021') FROM DUAL" )%>";    
        lstDestPort.SetDataText(data); 
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0130') FROM DUAL" )%>";    
        lstPriceType.SetDataText(data); 
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGSA1050') FROM DUAL" )%>";    
        lstStockType.SetDataText(data);        

		data = "data|0|0 %|5|5 %|10|10 %|15|15 %||";
    	lstTaxRate.SetDataText(data);     
    	lstTaxRate.value = '';   
		
		data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGSA1060') FROM DUAL" )%>";    
    	lstDiscountRate.SetDataText(data);     
    	lstDiscountRate.value = '';  		                           
		//--------------------------
}
  //==========================================================
 function FormatGrid()
 {
      var trl ;
      
      trl = grdDetail.GetGridControl();
      	
      trl.ColFormat(G2_ST_QTY )     = txtMaskSTQty.text;
	  trl.ColFormat(G2_ORD_UNIT)    = txtMaskOrderUnit.text;
      trl.ColFormat(G2_ORD_QTY )    = txtMaskOrderQty.text;
      trl.ColFormat(G2_LOT_UNIT)    = txtMaskLotUnit.text
      trl.ColFormat(G2_LOT_QTY)     = txtMaskLotQty.text; 
          
      trl.ColFormat(G2_UNIT_PRICE)  = txtMaskUnitPrice.text;
	  trl.ColFormat(G2_ITEM_AMOUNT) = txtMaskItemAmount.text;
	  trl.ColFormat(G2_DISC_AMOUNT) = txtMaskDiscountAmount.text;
      trl.ColFormat(G2_TAX_AMOUNT)  = txtMaskTaxAmount.text;
      trl.ColFormat(G2_TOTAL_AMOUNT)= txtMaskTotalAmount.text;      
      
      trl.FrozenCols = G2_ITEM_NAME ;
      
      arr_FormatNumber[G2_ST_QTY]     = txtSTQty.text;
	  arr_FormatNumber[G2_ORD_UNIT]   = txtOrderUnit.text;
      arr_FormatNumber[G2_ORD_QTY]    = txtOrderQty.text;
      arr_FormatNumber[G2_LOT_UNIT]   = txtLotUnit.text;
      arr_FormatNumber[G2_LOT_QTY]    = txtLotQty.text;
     
      arr_FormatNumber[G2_UNIT_PRICE]   = txtUnitPrice.text;
	  arr_FormatNumber[G2_ITEM_AMOUNT]  = txtItemAmount.text;
	  arr_FormatNumber[G2_DISC_AMOUNT]  = txtDiscountAmount.text;
      arr_FormatNumber[G2_TAX_AMOUNT]   = txtTaxAmount.text;      
      arr_FormatNumber[G2_TOTAL_AMOUNT] = txtTotalAmount.text;
	  
	  alert("Already set up basic information ! Now you can input data !");				    	        
 } 
 //==========================================================
 function OnChangeTab()
 {
 
    var strRad = radTab.GetData();
    
    var tab_Deli_Info       = document.all("Tab-Deli-Info");    
    var tab_Sale_Term       = document.all("Tab-Sale-Term");    
    var tab_Extension_Info  = document.all("Tab-Extension-Info"); 
    var tab_Remark			= document.all("Tab-Remark");
	
	switch (strRad)
	{
		case '1':
		    tab_Deli_Info.style.display      	= "";
		    tab_Sale_Term.style.display      	= "none";
		    tab_Extension_Info.style.display 	= "none";
			tab_Remark.style.display 			= "none";
		    
		    document.all("Deli-Info").style.color      	= "cc0000"; 
		    document.all("Sale-Term").style.color      	= "";
		    document.all("Extension-Info").style.color 	= ""; 
			document.all("Remark").style.color 			= "";
        break;
        
        case '2':
		    tab_Deli_Info.style.display      	= "none";
		    tab_Sale_Term.style.display      	= "";
		    tab_Extension_Info.style.display 	= "none"; 
			tab_Remark.style.display 			= "none";
		    
		    document.all("Deli-Info").style.color      	= ""; 
		    document.all("Sale-Term").style.color      	= "cc0000";
		    document.all("Extension-Info").style.color 	= "";
			document.all("Remark").style.color 			= "";			
        break;	
        
        case '3':
		    tab_Deli_Info.style.display      	= "none";
		    tab_Sale_Term.style.display      	= "none";
		    tab_Extension_Info.style.display 	= "";
			tab_Remark.style.display 			= "none";
		    
		    document.all("Deli-Info").style.color      	= ""; 
		    document.all("Sale-Term").style.color      	= "";
		    document.all("Extension-Info").style.color 	= "cc0000";
			document.all("Remark").style.color 			= "";			
        break; 

		case '4':
			tab_Deli_Info.style.display      	= "none";
		    tab_Sale_Term.style.display      	= "none";
		    tab_Extension_Info.style.display 	= "none";
			tab_Remark.style.display 			= "";
		    
		    document.all("Deli-Info").style.color      	= ""; 
		    document.all("Sale-Term").style.color      	= "";
		    document.all("Extension-Info").style.color 	= "";
			document.all("Remark").style.color 			= "cc0000";	
		break;
    } 
 }
  
  //============================================================================

 function OnSearch(pos)
 {
      switch (pos)         
      {		        
        case 'SOLIST' :			
			if ( t_view == 'false' ) 	
			{
				t_view = 'true';
			}
					
            data_dsbs00200.Call("SELECT");
        break;
		
        case 'MASTER' :  
            if ( grd_order_master.GetStatus() == 20 && t_view != 'true' )
            {								
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('MASTER');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData(grdSearch.row,0);
                    }  
					              
                    grd_order_master.Call("SELECT");
                }                
            } 
            else
            {	
				t_view = '';
				
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData(grdSearch.row,0);
                }
				else
				{
					txtMasterPK.text = '' ;
				}
				
                grd_order_master.Call("SELECT");
            }                       
        break;       
      }  
 }

 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
      switch (po_oData.id)         
      {
        case "grd_order_master" :
            if ( p_update == 1 )
            {
                p_update = 0 ;
				
                for ( var i = 1; i < grdDetail.rows ; i++ )
       		 	{
            		if ( grdDetail.GetGridData(i,G2_MASTER_PK) == "" )
            		{
                		grdDetail.SetGridText( i ,G2_MASTER_PK , txtMasterPK.text ) ;
           			}
        		}
				
                SetItemSequence();
				
                OnSave('DETAIL');
            }
            else
            {
                data_dsbs00200_2.Call('SELECT');
            } 
           
        break;
        
        case "data_dsbs00200_2" :     
            //------------------------------
            if (grdDetail.rows > 1) 
			{
				grdDetail.SetCellBold( 1, G2_ST_QTY,  grdDetail.rows - 1, G2_ST_QTY,  true);
            	grdDetail.SetCellBold( 1, G2_ORD_QTY, grdDetail.rows - 1, G2_ORD_QTY, true);
				grdDetail.SetCellBold( 1, G2_LOT_QTY, grdDetail.rows - 1, G2_LOT_QTY, true);
			
            	grdDetail.SetCellBgColor( 1, G2_ITEM_CODE, grdDetail.rows - 1, G2_ITEM_NAME, 0xCCFFFF );			
				grdDetail.SetCellBgColor( 1, G2_ORD_UNIT,  grdDetail.rows - 1, G2_ORD_UOM,   0xFFFFCC );
				
				lblTotalItem.text = grdDetail.rows-1 ;
				
				var total_qty = 0 ;
				
				for (var i=1 ; i<grdDetail.rows; i++)
				{
					total_qty = total_qty + Number(grdDetail.GetGridData( i, G2_ORD_QTY ));					 
				}

				lblTotalQty.text = total_qty;
            }
        break;
                
        case 'data_dsbs00200_4':
				if(txtBillToPK.text == '')
				{
					txtBillToPK.text   = txtDeliToPK.text;
					txtBillToCode.text = txtDeliToCode.text;
					txtBillToName.text = txtDeliToName.text; 					
				}
		break;
		
        case 'pro_dsbs00200_4':
              grd_order_master.Call('SELECT')
        break;        
		 
         case 'pro_dsbs00200_6':
             alert(txtReturnValue.text);
			 
			 grd_order_master.Call("SELECT");
         break;
		 
		 case 'pro_dsbs00200_1':
             alert(txtReturnValue.text);
			 
			 grd_order_master.Call("SELECT");		 
		 break;
		 
		 case'data_fpab00110_2':
		    if ( grdItem_Search.rows > 2 || grdItem_Search.rows == 1 )
            {
                
                var queryString = "?item_cd=" + url_encode(txtItemCD_Search.text)
                                              + "&item_nm="
                                              + url_encode(txtItemNM_Search.text);

                txtItemCD_Search.text   = '' ; 
                txtItemNM_Search.text   = '' ;                                     
                                         
                GetItem(queryString); 
                //-------------------                
            }
            else if ( grdItem_Search.rows == 2 )
            {
                if ( gPreviousRow > 0 )
                {
		            grdDetail.SetGridText( gPreviousRow, G2_ITEM_PK,   grdItem_Search.GetGridData( 1, 0) );//item_pk
		            grdDetail.SetGridText( gPreviousRow, G2_ITEM_CODE, grdItem_Search.GetGridData( 1, 1) );//item_id
		            grdDetail.SetGridText( gPreviousRow, G2_ITEM_NAME, grdItem_Search.GetGridData( 1, 2) );//item_name
		        }
		        grdItem_Search.ClearData();
		        gPreviousRow = -1 ;
		        //------------
            }
		 break;
		 case 'grd_order_default':
		      FormatGrid();  
		 break;

         case 'pro_dsbs00200_2':
		 
            grdDetail.SetGridText( cur_row, G2_UNIT_PRICE, System.Round( txtUPRICE.text, arr_FormatNumber[G2_UNIT_PRICE] ));
			//---------------
			InputProcess( G2_UNIT_PRICE, cur_row );                 
			//---------------			
            r_index++;
			
            if ( r_index < arr_data.length )
            {  
                txtSaleOrderPK.text = arr_data[r_index][0];
                txtItemGridPK.text  = arr_data[r_index][1];
                cur_row            = arr_data[r_index][2];
				
                pro_dsbs00200_2.Call();
            }
			//---------------	 
         break; 
		 
      }  
 }

//======================================================================================

 function AddOnClick(pos)
 {            
      switch (pos)         
      {		        
        case 'Master' :
            if ( grd_order_master.GetStatus() != 20 )
            {
                grd_order_master.StatusInsert();
				
                txtSoNo.SetDataText("**New Slip No**") ;
                
                txtEmpPK.text   = user_pk   ;
                txtEmpName.text = user_name ; 
                txtEmpCode.text = user_id   ; 
				               
                grd_order_default.Call("SELECT");
				
                grdDetail.ClearData();
                //----------------                              
            }
            else
            {
                alert("Already add new. Pls input data !!!");
            }
        break;
        
        case 'ITEM_PRICE' :
             
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00071.aspx?group_type=Y||Y|||' + '&p_partner_pk=' + txtDeliToPK.text;
	         var object = System.OpenModal( path , 950 , 600 ,  'resizable:yes;status:yes');
			  		        
	         if ( object != null )
	         {
               
                var arrTemp
                for( var i=0; i < object.length; i++)	  
                {	
                    arrTemp = object[i];
                   
                    grdDetail.AddRow();
                    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text) ;//master_pk
					
                    if(txtSoNo.text != "" && txtSoNo.text != "**New Slip No**" )
                    {
                        grdDetail.SetGridText( grdDetail.rows-1, G2_SO_ITEM_NO, txtSoNo.text+((grdDetail.rows-1)>9?(grdDetail.rows-1):("0"+(grdDetail.rows-1))));//sequence_item
                    }
					
                    grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ_NUM, grdDetail.rows-1 );//sequence		
					    	                   
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,   arrTemp[0]);//item_pk	    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE, arrTemp[1]);//item_code	    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME, arrTemp[2]);//item_name	                        
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ORD_UOM,   arrTemp[3]);//item_uom
					
                    grdDetail.SetGridText( grdDetail.rows-1, G2_UNIT_PRICE, arrTemp[4]);//unit price                   
                     
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_ETD, dtETD.value );//dtETD
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_ETA, dtETA.value );//dtETA                    
                }  	            
	         }	 	           
        break;
		
		case 'FREE_ITEM':
			var path = System.RootURL + '/standard/forms/fp/ab/fpab00070.aspx?group_type=Y||Y|||' ;
	         var object = System.OpenModal( path , 950 , 600 ,  'resizable:yes;status:yes');
			  		        
	         if ( object != null )
	         {
               
                var arrTemp
                for( var i=0; i < object.length; i++)	  
                {	
                    arrTemp = object[i];
                   
                    grdDetail.AddRow();
                    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text) ;//master_pk
					
                    if(txtSoNo.text != "" && txtSoNo.text != "**New Slip No**" )
                    {
                        grdDetail.SetGridText( grdDetail.rows-1, G2_SO_ITEM_NO, txtSoNo.text+((grdDetail.rows-1)>9?(grdDetail.rows-1):("0"+(grdDetail.rows-1))));//sequence_item
                    }
					
                    grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ_NUM, grdDetail.rows-1 );//sequence		
					    	                   
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,   arrTemp[0]);//item_pk	    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE, arrTemp[1]);//item_code	    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME, arrTemp[2]);//item_name	                        
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ORD_UOM,   arrTemp[5]);//item_uom
					
                    grdDetail.SetGridText( grdDetail.rows-1, G2_UNIT_PRICE, arrTemp[7]);//unit price                   
                     
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_ETD, dtETD.value );//dtETD
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_ETA, dtETA.value );//dtETA                    
                }  	            
	         }	 	  			
		break;
        
        case 'dsbs00212' :
 
             var path = System.RootURL + '/standard/forms/ds/bs/dsbs00212.aspx?group_type=Y||Y|||';
	         var object = System.OpenModal( path ,900 , 700 ,  'resizable:yes;status:yes');
	                 
	         if ( object != null )
	         {
                for( var i=0; i < object.length; i++)	  
                {	
                    var arrTemp = object[i];
                    	        
                    grdDetail.AddRow();
                    
                    grdDetail.SetGridText(grdDetail.rows-1,G2_MASTER_PK,txtMasterPK.text) ;//master_pk
                    	
                    if(txtSoNo.text != "" && txtSoNo.text != "**New Slip No**" )
                    {
                        grdDetail.SetGridText( grdDetail.rows-1, G2_SO_ITEM_NO, txtSoNo.text+((grdDetail.rows-1)>9?(grdDetail.rows-1):("0"+(grdDetail.rows-1))));//sequence_item
                    }
                    grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ_NUM, grdDetail.rows-1 );//sequence		    	                   
                    	    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,   arrTemp[0] );//item_pk	    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE, arrTemp[1] );//item_code	    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME, arrTemp[2] );//item_name	    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ORD_UOM,   arrTemp[3] );//item_uom
                    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ORD_UNIT,  1 );                 
                     
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_ETD,  dtETD.value );//dtETD
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_ETA,  dtETA.value );//dtETA

                 }		            
	         }	 	           
        break;  
        
        case 'Select-Item' :
             //-----------
             if ( txtStylePK.text == '' )
             {
                alert("Pls select Style first.");
                return;
             }           
             //-----------
             
             var path = System.RootURL + '/standard/forms/ds/bs/dsbs00215.aspx?tco_stitem_pk='+ txtStylePK.text+'&bill_to_pk='+ txtBillToPK.text;
	         var object = System.OpenModal( path ,950 , 600 ,  'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {
                for( var i=0; i < object.length; i++)	  
                {	
                    var arrTemp = object[i];
                    	        
                    grdDetail.AddRow();
                    
                    grdDetail.SetGridText(grdDetail.rows-1,G2_MASTER_PK,txtMasterPK.text) ;//master_pk
                    	
                    if(txtSoNo.text != "" && txtSoNo.text != "**New Slip No**" )
                    {
                        grdDetail.SetGridText( grdDetail.rows-1, G2_SO_ITEM_NO, txtSoNo.text+((grdDetail.rows-1)>9?(grdDetail.rows-1):("0"+(grdDetail.rows-1))));//sequence_item
                    }
                    grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ_NUM, grdDetail.rows-1 );//sequence		    	                   
                    	    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,   arrTemp[12] );//item_pk	    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE, arrTemp[13] );//item_code	    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME, arrTemp[14] );//item_name	    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ORD_UOM,   arrTemp[15] );//item_uom
                                        
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ORD_QTY,  arrTemp[17] );// Ord Qty                    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_LOT_QTY,  arrTemp[16] );// Lot Qty
					
					if ( Number(arrTemp[16])>0 )
					{
						grdDetail.SetGridText( grdDetail.rows-1, G2_LOT_UNIT, System.Round(Number(arrTemp[17])/Number(arrTemp[16]),arr_FormatNumber[G2_LOT_UNIT]) );// Lot Unit Qty
					}	
					else
					{
						grdDetail.SetGridText( grdDetail.rows-1, G2_ORD_UNIT, 1 );
					}
                 }
             }	
          break;                      
      }
 }
 
 //---------------------------------------------------------
 function OnPopUp(pos)
 {
      switch (pos)         
      {		        
        case 'BillTo' :
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AR";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {	         
	            txtBillToPK.text   = object[0];
                txtBillToCode.text = object[1];
                txtBillToName.text = object[2];                                              
	         }
	    break;
	         
        case 'DeliTo' :
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AR";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {
	            txtDeliToPK.text   = object[0];
                txtDeliToCode.text = object[1];
                txtDeliToName.text = object[2];               
                
	            txtBillToPK.text   = object[0];
                txtBillToCode.text = object[1];
                txtBillToName.text = object[2]; 
				
                data_dsbs00200_4.Call("SELECT");
	         }
	    break; 
	         
        case 'DeliLoc' :
             if ( txtDeliToPK.text != '' )
             {
                 var path = System.RootURL + '/standard/forms/fp/ab/fpab00180.aspx?partner_pk=' + txtDeliToPK.text + '&partner_id=' + url_encode(txtDeliToCode.text) + '&partner_name=' + url_encode(txtDeliToName.text) ;
	             var object = System.OpenModal( path ,900 , 550 ,  'resizable:yes;status:yes');
				 
	             if ( object != null )
	             {
	                txtDeliLocPK.text   = object[0];
                    txtDeliLocName.text = object[4];
	             }	
	         }
	         else
	         {
	            alert('Pls Select Deliery To first !!!');
	         }         
        break;
        
        case 'Emp' :
             
                 var path = System.RootURL + '/standard/forms/ch/ae/chae00010_search_emp.aspx';
	             var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	             if ( obj != null )
	             {
	                txtEmpPK.text   = obj[0];
	                txtEmpCode.text = obj[1];
                    txtEmpName.text = obj[2];
                 }	
	    break;
	    
	    case 'Style' :             
                 var path = System.RootURL + '/standard/forms/fp/ab/fpab00080.aspx?group_type=Y|Y||||';
	             var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	             if ( obj != null )
	             {
	                txtStylePK.text   = obj[0];
	                txtStyleID.text   = obj[1];
                    txtStyleName.text = obj[2];
                 }	
	    break;
	    
	    case 'Detail' :
	         var row  = event.row;
	         var col  = event.col;
	         
             if ( col == G2_ST_UOM && row != 0 )
             {
                   var path = System.RootURL + '/standard/forms/fp/ab/fpab00230.aspx';
	               var obj = System.OpenModal( path, 550, 500, 'resizable:yes;status:yes');
	               
	               if ( obj != null && obj[1] != grdDetail.GetGridData(row,col))
	               {
	                    grdDetail.SetGridText(row,col,obj[1]);
	                    ChangeUOM(row,G2_ST_UOM);
	               }	
                 
             }
             else if (col == G2_ORD_UOM &&  row!=0 )
             {
               /*var tco_item_pk = grdDetail.GetGridData(row, G2_ITEM_PK);
               var cus_uom =  grdDetail.GetGridData(row, G2_ST_UOM );
			   
               var path = System.RootURL + '/standard/forms/ds/bs/dsbs00201.aspx?tco_item_pk='+tco_item_pk+'&conv_uom='+ cus_uom;
	           var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
	               
	               if ( obj != null && obj[0] != grdDetail.GetGridData(row,col))
	               {
	                    grdDetail.SetGridText(row,G2_ORD_UOM,obj[0]);
	                    grdDetail.SetGridText(row,G2_ORD_UNIT,obj[2]);
	                    ChangeUOM(row,G2_ORD_UOM);
	               }	
			   */	   
			   var path = System.RootURL + '/standard/forms/fp/ab/fpab00230.aspx';
	           var obj = System.OpenModal( path, 550, 500, 'resizable:yes;status:yes');
				    
               grdDetail.SetGridText(row,G2_ORD_UOM,obj[1]); 
                 
             }
             else if (col == G2_LOT_UOM &&  row!=0 )
             {
                var tco_item_pk = grdDetail.GetGridData( row, G2_ITEM_PK);
                var cus_uom     = grdDetail.GetGridData( row, G2_ST_UOM );
                
                var path = System.RootURL + '/standard/forms/ds/bs/dsbs00201.aspx?tco_item_pk='+tco_item_pk+'&conv_uom='+ cus_uom;
	            var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
	               
	            if ( obj != null && obj[0] != grdDetail.GetGridData(row,col) )
	            {
	                grdDetail.SetGridText( row, G2_LOT_UOM,  obj[0]);
	                grdDetail.SetGridText( row, G2_LOT_UNIT, obj[2]);
	                    
	                ChangeUOM( row, G2_LOT_UOM);
	            }	                 
             }
            
			 else if ( col == G2_CUST_ITEM && row != 0 && grdDetail.GetGridData( row, G2_ITEM_PK) > 0 )   
			 {
			 		if ( txtDeliToPK.text == '' )
					{
						alert("PLS SELECT DELIVERY TO !");
						return;
					}
								 
                	var path = System.RootURL + '/standard/forms/ds/bs/dsbs00204.aspx';
	            	var obj = System.OpenModal( path , 600 , 300 , 'resizable:yes;status:yes', this);	
				
	            	if ( obj != null )
	            	{
	                	grdDetail.SetGridText( row, G2_CUST_ITEM, obj);
	            	}                              			 
			 }
          break;
		  
          case 'Dest_Nation':
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0220";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');	               
          break; 

 		  case 'Ex_Port':
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=IEBS0020";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');	                   
          break; 
		  		           
          case 'Dest_Port':
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=IEBS0021";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');	                 
          break;
		  
          case "Deli_Method":
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0250";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');	                                
          break;
		  
          case "Order_Type":
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGSA1020";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');			 	                                 
          break;
		  
          case "Price_type":
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0130";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');	                             
          break;
		  
          case "Payment_Method":
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0110";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');	                             
          break;
		  
          case "Payment_Term":
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0120";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');	                                 
          break;
		  
          case "Ex_Nation":
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0210";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');	                               
          break; 
		           
          case "Currency":
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0100";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');	                                
          break;        
		  
          case "Prod_Type":
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGSA1030";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');	                               
          break;    
		  
          case "Priority":
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGSA1040";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');	                                  
          break;                              		              
		  
          case 'Deli_Term':
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0260";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');	                         
          break;    
		  
		  case 'Report':			 
			  if( txtMasterPK.text != "" )
	          {
		           var path = System.RootURL + '/standard/forms/ds/bs/dsbs00217.aspx';
		           var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
 	          }
	          else
	          {
		           alert("Please, select one slip no to print!");
	          }	
		  break; 

		case 'FileAttachList':
	    	if(txtMasterPK.text !="")
            {
		         var fpath = System.RootURL + '/standard/forms/ds/bs/dsbs00218.aspx?master_pk=' + txtMasterPK.text ;
                 var aValue  = System.OpenModal(  fpath , 700 , 300 , 'resizable:yes;status:yes;scroll:no');                  
            }
            else
            {
                alert("Select one S/O to Attach file(s) list !!!")
            }
		break;   
		
      }         
 }  
 
 //---------------------------------------------------------
 function OnDeleteDetail()
 {
    var ctrl = grdDetail.GetGridControl();

	var row  = ctrl.row;
		
	if ( row < 0 ) 
	{			
			alert("Please select one row to delete .");
	}			
	else 
	{
		if ( grdDetail.GetGridData( ctrl.row, 0 ) == "" ) 
	    {						
		
				grdDetail.RemoveRow();					
		}			
		else 
		{
			if ( confirm( "Do you want to mark this row to delete?" ) ) 
			{
				grdDetail.DeleteRow();
			}
		}
	}

 }
 //---------------------------------------------------------
 function OnUnDeleteDetail() 
 {
		
	grdDetail.UnDeleteRow()
		
 }

 //---------------------------------------------------------
    var p_update = 0 ;
 //---------------------------------------------------------
 
 function OnSave(pos)
 {
    if (CheckSave())
    {
      switch (pos)         
      {		        
            case 'MASTER' :
                grd_order_master.Call();
                p_update = 1 ;
            break;
            
            case 'DETAIL' :
                data_dsbs00200_2.Call();
            break;
      }  
    }
 }
 //=================================================================================================
 function CheckSave()
 {
    for (i = 1; i< grdDetail.rows ; i++)
    {
        if (grdDetail.GetGridData(i,G2_ORD_QTY)=="" )
        {
            alert("Please, input quantity for row"+(i-1)+"!")
            return false;
        }
       
    }             
    return true
 }
 //=================================================================================================
 function ChangeUOM(row,col)
 {
    var dQuantity;
    if( col == G2_ST_UOM)
    {
         grdDetail.SetGridText(row,G2_ORD_UNIT,"")
         grdDetail.SetGridText(row,G2_ORD_QTY,"")
         grdDetail.SetGridText(row,G2_ORD_UOM,"")   
        
         grdDetail.SetGridText(row,G2_LOT_UNIT,"")
         grdDetail.SetGridText(row,G2_LOT_QTY,"")
         grdDetail.SetGridText(row,G2_LOT_UOM,"")
    }
    if ( col == G2_ORD_UOM )
    {       
       var vOrderUOM        = grdDetail.GetGridData( row, G2_ORD_UOM)  //UOM of Order
       var vORD_UNIT         = grdDetail.GetGridData( row, G2_ORD_UNIT)  //Rate of order's uom
       var vUOM             = grdDetail.GetGridData( row, G2_ST_UOM)  //UOM of Customer
       var vST_QTY    = grdDetail.GetGridData( row, G2_ST_QTY) //Quanity of customer's uom
        var dQuantity = grdDetail.GetGridData( row, G2_ST_QTY) 
        if (!isNaN(vORD_UNIT) &&  !isNaN(vST_QTY))
        {
            dQuantity = vORD_UNIT * vST_QTY;
           
        }else
        {
            dQuantity = vST_QTY ;
           
        }                
         grdDetail.SetGridText(row,G2_ORD_QTY,parseFloat(dQuantity).toFixed(arr_FormatNumber[G2_ORD_QTY])); 
         
         grdDetail.SetGridText(row,G2_LOT_UNIT,"")
         grdDetail.SetGridText(row,G2_LOT_QTY,"")
         grdDetail.SetGridText(row,G2_LOT_UOM,"")
        
    }  
    ///////////////////////////////////////////
     if ( col == G2_LOT_UOM )
    {
          
       var vORD_UNIT         = grdDetail.GetGridData( row, G2_LOT_UNIT)  //Rate of order's uom
       var vST_QTY    = grdDetail.GetGridData( row, G2_ORD_QTY) //Quanity of customer's uom
       dQuantity =0
        if (!isNaN(vORD_UNIT) &&  !isNaN(vST_QTY))
        {
            dQuantity = vORD_UNIT * vST_QTY;
           
        }else
        {
            dQuantity = vST_QTY ;
           
        }
          grdDetail.SetGridText(row,G2_LOT_QTY,parseFloat(dQuantity).toFixed(arr_FormatNumber[G2_LOT_QTY])); 
        
    }  
 }
 
 var gPreviousRow = -1 ;
 //=================================================================================================
 function CheckInput()
 {   
   var row, col;
   
   row = event.row;
   col = event.col;
         
   if ( col == G2_ST_QTY || col == G2_ORD_UNIT || col == G2_ORD_QTY || col == G2_LOT_UNIT || col == G2_LOT_QTY || col == G2_UNIT_PRICE || col == G2_ITEM_AMOUNT || col == G2_TAX_AMOUNT || col == G2_TOTAL_AMOUNT || col == G2_DISC_AMOUNT )
   {
        var dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
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
		//----------
 			if ( col == G2_ST_QTY || col == G2_ORD_UNIT )
			{
				var vORD_QTY = Number(grdDetail.GetGridData( row, G2_ORD_UNIT ))*Number(grdDetail.GetGridData( row, G2_ST_QTY ));
				grdDetail.SetGridText( row, G2_ORD_QTY, System.Round(vORD_QTY,arr_FormatNumber[G2_ORD_QTY]));
			}	
			
			if ( ( col == G2_ST_QTY || col == G2_ORD_UNIT || col == G2_ORD_QTY || col == G2_LOT_UNIT ) && Number(Number(grdDetail.GetGridData( row, G2_LOT_UNIT ))>0) ) 
			{
				var vLOT_QTY = Number(grdDetail.GetGridData( row, G2_ORD_QTY )) / Number(grdDetail.GetGridData( row, G2_LOT_UNIT ));
				grdDetail.SetGridText( row, G2_LOT_QTY, System.Round(vLOT_QTY,arr_FormatNumber[G2_LOT_QTY]));
			}
			
			if ( col == G2_ST_QTY || col == G2_ORD_UNIT || col == G2_ORD_QTY || col == G2_UNIT_PRICE )
			{
				var vITEM_AMT = Number(grdDetail.GetGridData( row, G2_ORD_QTY ))*Number(grdDetail.GetGridData( row, G2_UNIT_PRICE ));
				grdDetail.SetGridText( row, G2_ITEM_AMOUNT, System.Round(vITEM_AMT,arr_FormatNumber[G2_ITEM_AMOUNT]));
				
				var vDISC_AMT = Number(grdDetail.GetGridData( row, G2_ITEM_AMOUNT )) * Number(lstDiscountRate.value)/100;
				grdDetail.SetGridText( row, G2_DISC_AMOUNT, System.Round(vDISC_AMT,arr_FormatNumber[G2_DISC_AMOUNT]));
			}
			
			if ( col == G2_ST_QTY || col == G2_ORD_UNIT || col == G2_ORD_QTY || col == G2_UNIT_PRICE || col == G2_ITEM_AMOUNT || col == G2_DISC_AMOUNT )
			{			
				var vVAT_AMT = ( Number(grdDetail.GetGridData( row, G2_ITEM_AMOUNT )) - Number(grdDetail.GetGridData( row, G2_DISC_AMOUNT )) ) * Number(lstTaxRate.value)/100;
				grdDetail.SetGridText( row, G2_TAX_AMOUNT, System.Round(vVAT_AMT,arr_FormatNumber[G2_TAX_AMOUNT]));
			}
			
			if ( col == G2_ST_QTY || col == G2_ORD_UNIT || col == G2_ORD_QTY || col == G2_UNIT_PRICE || col == G2_ITEM_AMOUNT || col == G2_TAX_AMOUNT || col == G2_DISC_AMOUNT )
			{
				var vTOTAL_AMT = Number(grdDetail.GetGridData( row, G2_ITEM_AMOUNT )) + Number(grdDetail.GetGridData( row, G2_TAX_AMOUNT )) - Number(grdDetail.GetGridData( row, G2_DISC_AMOUNT ));
				grdDetail.SetGridText( row, G2_TOTAL_AMOUNT, System.Round(vTOTAL_AMT,arr_FormatNumber[G2_TOTAL_AMOUNT]));
			}
		//----------
		TotalAmount(); 		 
	}        
    else if (col == G2_SEQ_NUM)//edit sequence
    {
        var dNum =  grdDetail.GetGridData(row,col)
        
        if (!Number(dNum))
        {   
           grdDetail.SetGridText(row,col,"")
        }
        else
        {         
            if(txtSoNo.text != "" && txtSoNo.text != "**New Slip No**" )
            {
                grdDetail.SetGridText(row,G2_SO_ITEM_NO,txtSoNo.text+(dNum>9?dNum:("0"+dNum)));//sequence_item
            }
        }
    } 
    else if (col == G2_ITEM_CODE || col == G2_ITEM_NAME)
    {
        gPreviousRow = event.row ;
        if(col==G2_ITEM_CODE)
        {
            txtItemCD_Search.text         = grdDetail.GetGridData(gPreviousRow, G2_ITEM_CODE);
            txtItemNM_Search.text         = "";
        }
        else
        {
            txtItemCD_Search.text         = "";
            txtItemNM_Search.text         = grdDetail.GetGridData(gPreviousRow, G2_ITEM_NAME);
        }
               
        data_fpab00110_2.Call('SELECT');
    } 
 }
 //=====================================================================================
 function InputProcess(col,row)
 {   

   if ( col == G2_ST_QTY || col == G2_ORD_UNIT || col == G2_ORD_QTY || col == G2_LOT_UNIT || col == G2_LOT_QTY || col == G2_UNIT_PRICE || col == G2_ITEM_AMOUNT || col == G2_TAX_AMOUNT || col == G2_TOTAL_AMOUNT || col == G2_DISC_AMOUNT )
   {
        var dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
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
		//----------
 			if ( col == G2_ST_QTY || col == G2_ORD_UNIT )
			{
				var vORD_QTY = Number(grdDetail.GetGridData( row, G2_ORD_UNIT ))*Number(grdDetail.GetGridData( row, G2_ST_QTY ));
				grdDetail.SetGridText( row, G2_ORD_QTY, System.Round(vORD_QTY,arr_FormatNumber[G2_ORD_QTY]));
			}	
			
			if ( ( col == G2_ST_QTY || col == G2_ORD_UNIT || col == G2_ORD_QTY || col == G2_LOT_UNIT ) && Number(Number(grdDetail.GetGridData( row, G2_LOT_UNIT ))>0) ) 
			{
				var vLOT_QTY = Number(grdDetail.GetGridData( row, G2_ORD_QTY )) / Number(grdDetail.GetGridData( row, G2_LOT_UNIT ));
				grdDetail.SetGridText( row, G2_LOT_QTY, System.Round(vLOT_QTY,arr_FormatNumber[G2_LOT_QTY]));
			}
			
			if ( col == G2_ST_QTY || col == G2_ORD_UNIT || col == G2_ORD_QTY || col == G2_UNIT_PRICE )
			{
				var vITEM_AMT = Number(grdDetail.GetGridData( row, G2_ORD_QTY ))*Number(grdDetail.GetGridData( row, G2_UNIT_PRICE ));
				grdDetail.SetGridText( row, G2_ITEM_AMOUNT, System.Round(vITEM_AMT,arr_FormatNumber[G2_ITEM_AMOUNT]));
				
				var vDISC_AMT = Number(grdDetail.GetGridData( row, G2_ITEM_AMOUNT )) * Number(lstDiscountRate.value)/100;
				grdDetail.SetGridText( row, G2_DISC_AMOUNT, System.Round(vDISC_AMT,arr_FormatNumber[G2_DISC_AMOUNT]));
			}
			
			if ( col == G2_ST_QTY || col == G2_ORD_UNIT || col == G2_ORD_QTY || col == G2_UNIT_PRICE || col == G2_ITEM_AMOUNT || col == G2_DISC_AMOUNT )
			{			
				var vVAT_AMT = ( Number(grdDetail.GetGridData( row, G2_ITEM_AMOUNT )) - Number(grdDetail.GetGridData( row, G2_DISC_AMOUNT )) ) * Number(lstTaxRate.value)/100;
				grdDetail.SetGridText( row, G2_TAX_AMOUNT, System.Round(vVAT_AMT,arr_FormatNumber[G2_TAX_AMOUNT]));
			}
			
			if ( col == G2_ST_QTY || col == G2_ORD_UNIT || col == G2_ORD_QTY || col == G2_UNIT_PRICE || col == G2_ITEM_AMOUNT || col == G2_TAX_AMOUNT || col == G2_DISC_AMOUNT )
			{
				var vTOTAL_AMT = Number(grdDetail.GetGridData( row, G2_ITEM_AMOUNT )) + Number(grdDetail.GetGridData( row, G2_TAX_AMOUNT )) - Number(grdDetail.GetGridData( row, G2_DISC_AMOUNT ));
				grdDetail.SetGridText( row, G2_TOTAL_AMOUNT, System.Round(vTOTAL_AMT,arr_FormatNumber[G2_TOTAL_AMOUNT]));
			}
		//----------
		TotalAmount(); 		 
	}        
    
 }

 //=====================================================================================
 
 function TotalAmount()
 {
	   var vItemAmt = 0,vDiscountAmt = 0,vVatAmt = 0,vTotalAmt = 0, vOrdQty = 0 ;
	
       for (var i = 1; i<grdDetail.rows; i++)
       {
			//-----------------------------	   
            vItemAmt     =  vItemAmt     + Number(grdDetail.GetGridData(i, G2_ITEM_AMOUNT ));
			vDiscountAmt =  vDiscountAmt + Number(grdDetail.GetGridData(i, G2_DISC_AMOUNT ));
            vVatAmt      =  vVatAmt      + Number(grdDetail.GetGridData(i, G2_TAX_AMOUNT  ));
            vTotalAmt    =  vTotalAmt    + Number(grdDetail.GetGridData(i, G2_TOTAL_AMOUNT));
			
			vOrdQty      =  vOrdQty      + Number(grdDetail.GetGridData(i, G2_ORD_QTY));                   
       }       
	   
       txtOrdAmt.text      = vItemAmt     + "";
	   txtDiscountAmt.text = vDiscountAmt + "";
       txtTaxAmt.text      = vVatAmt      + "";
       txtTotalAmt.text    = vTotalAmt    + "";
	   
	   lblTotalQty.text = vOrdQty;
 }
 
  //==================================================================================

function SetItemSequence()//reset item sequence when OrderNO thay doi
{
    var items = grdDetail.rows
    for(var i =1 ; i<items ; i ++)
    {
        var val = grdDetail.GetGridData(i,G2_SEQ_NUM)
        grdDetail.SetGridText(i,G2_SO_ITEM_NO,txtSoNo.text + '-' + (val<10?("00"+val):val<100?("0"+val):val))
    }
}
  
//===========================================================================
 function OnDelete()
 {
    if ( confirm ( "Do you want to delete this order?" ) )
          {

            grd_order_master.StatusDelete();
            
            if (txtMasterPK.text!="")
            
                grd_order_master.Call()
                
            else
            
                alert("Please,Select a SO !")
         }
 }
//=====================================================================================
 
function Loading()
{
     var url = System.RootURL + '/standard/forms/ds/bs/dsbs00011_v01.aspx' ;
	 var obj = System.OpenModal( url ,1000 , 600 ,  'resizable:yes;status:yes'); 
}

//==============================================================================

function OnCopy(pos)
{
	switch(pos)
	{
		case 'Master' :
			if (txtMasterPK.text!="")
        	{ 
				if ( confirm('Do you want to copy this Sale Order ?') )
				{
            		pro_dsbs00200_4.Call();
				}	
        	}
			else
        	{
            	alert("Please, select one SO to copy!")
        	}		
		break;
		
		case 'Detail' :
		    var i, j, lNewRow;
		    for (i=1; i < grdDetail.rows ; i++)
		    {
		        if(grdDetail.GetGridControl().IsSelected(i))
		        {            
		            
		            grdDetail.AddRow();
		            
		            lNewRow = grdDetail.rows - 1;
		            
		            for ( j=0 ; j <= G2_REMARK ; j++)
		            {
		            
		                if ( j != G2_SO_ITEM_NO && j != G2_SEQ_NUM && j != G2_DETAIL_PK )
		                {
		                    grdDetail.SetGridText(lNewRow, j, grdDetail.GetGridData(i, j));
		                } 
		                 
		                if ( txtSoNo.text != "" && txtSoNo.text != "**New Slip No**" )
		                {
		                    grdDetail.SetGridText( lNewRow, G2_SO_ITEM_NO, txtSoNo.text+((grdDetail.rows-1)>9?(grdDetail.rows-1):("0"+(grdDetail.rows-1))));//sequence_item
		                }
		                //-----------------------------
		                grdDetail.SetGridText( lNewRow, G2_SEQ_NUM, grdDetail.rows-1 );//sequence
		                //-----------------------------
		            }
		        }
		    }   		
		break;
	}
}
//==============================================================================
function OnSubmit()
{
	if ( txtMasterPK.text != '' )
	{
       	if ( confirm("Do you want to submit this Order") )
       	{
           	pro_dsbs00200_1.Call();      
	   	}
	}   
}
 
//==============================================================================

function OnSetDate(pos)
{
    switch(pos)
    {
        case 'ETD' :
            if ( confirm('Do you want to reset ETD for grid.') )
            {
                for ( var i=1; i<grdDetail.rows; i++ )
                {
                    grdDetail.SetGridText( i, G2_ITEM_ETD, dtETD.value );
                } 
            }           
        break;
        
        case 'ETA' :
            if ( confirm('Do you want to reset ETA for grid.') )
            {        
                for ( var i=1; i<grdDetail.rows; i++ )
                {
                    grdDetail.SetGridText( i, G2_ITEM_ETA, dtETA.value );
                } 
            }           
        break;
    }
}
//==============================================================================
function OnReport(pos)
{
	switch(pos)
	{
		case 'CSZ-01' :
			if(txtMasterPK.text!="")
		    { 
				//var url =System.RootURL + "/standard/reports/ds/bs/rpt_dsbs00200.aspx?master_pk=" + txtMasterPK.text;
				var url =System.RootURL + "/standard/reports/ds/bs/rpt_dsbs00201.aspx?master_pk=" + txtMasterPK.text;
	    		System.OpenTargetPage(url);		        
			}
			else
			{
			    alert("Please select Order to report");
			}				 
		break;
		
		case 'SW-01':
			if(txtMasterPK.text!="")
		    { 
				//var url =System.RootURL + "/standard/reports/ds/bs/rpt_dsbs00201.xls";
				var url =System.RootURL + "/standard/reports/ds/bs/rpt_dsbs00201.aspx?master_pk=" + txtMasterPK.text;
	    		System.OpenTargetPage(url);		        
			}
			else
			{
			    alert("Please select Order to report");
			}
		break;
	}	    
}

 //============================================================================================== 
function OnChangeRate(pos)
{
	   var vItemAmt = 0,vDiscountAmt = 0,vVatAmt = 0,vTotalAmt = 0;
	   var dVatAmt  = 0,dDiscountAmt = 0,dTotalAmt = 0;
	   
       for (var i = 1; i<grdDetail.rows  ; i++)
       {
	   		if ( pos == 'DISCOUNT' )
			{
         		dDiscountAmt = Number(grdDetail.GetGridData( i, G2_ITEM_AMOUNT )) * Number(lstDiscountRate.value)/100;
				grdDetail.SetGridText( i, G2_DISC_AMOUNT, System.Round( dDiscountAmt, arr_FormatNumber[G2_DISC_AMOUNT] ) );
			}	
			//-----------------------------	   
         	dVatAmt = ( Number(grdDetail.GetGridData( i, G2_ITEM_AMOUNT )) - Number(grdDetail.GetGridData( i, G2_DISC_AMOUNT )) ) * Number(lstTaxRate.value)/100;
			grdDetail.SetGridText( i, G2_TAX_AMOUNT, System.Round( dVatAmt, arr_FormatNumber[G2_TAX_AMOUNT] ) );
			//-----------------------------
			dTotalAmt = Number(grdDetail.GetGridData( i, G2_ITEM_AMOUNT )) - Number(grdDetail.GetGridData( i, G2_DISC_AMOUNT )) + Number(grdDetail.GetGridData( i, G2_TAX_AMOUNT )) ;
			grdDetail.SetGridText( i, G2_TOTAL_AMOUNT, System.Round( dTotalAmt, arr_FormatNumber[G2_TOTAL_AMOUNT] ) );
			//-----------------------------	 
			   
            vItemAmt     = vItemAmt     + Number(grdDetail.GetGridData(i, G2_ITEM_AMOUNT ));
			vDiscountAmt = vDiscountAmt + Number(grdDetail.GetGridData(i, G2_DISC_AMOUNT ));
            vVatAmt      = vVatAmt      + Number(grdDetail.GetGridData(i, G2_TAX_AMOUNT  ));
            vTotalAmt    = vTotalAmt    + Number(grdDetail.GetGridData(i, G2_TOTAL_AMOUNT));                       
       }       
	   
       txtOrdAmt.text       = vItemAmt      ; 
	   txtDiscountAmt.text  = vDiscountAmt ;
       txtTaxAmt.text       = vVatAmt      ;
       txtTotalAmt.text     = vTotalAmt    ; 
} 

//===============================================================================================
function GetItem(p_querystring)
{
    var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00110.aspx" + p_querystring + "&group_type=Y|Y|Y|Y|Y|Y";
    var aValue  = window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');	
	
	if ( aValue != null ) 
	{
	    if ( gPreviousRow > 0 ) 
	    {	
		    grdDetail.SetGridText( gPreviousRow, G2_ITEM_PK,    aValue[0] );//spec_pk
		    grdDetail.SetGridText( gPreviousRow, G2_ITEM_CODE,  aValue[1] );//spec_id
		    grdDetail.SetGridText( gPreviousRow, G2_ITEM_NAME,  aValue[2] );//spec_name
		    
		    gPreviousRow = -1 ;		    
		}
	}
}
 //==============================================================================================  

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
//=================================================================================================
function OnProcess(pos)
{
    switch(pos)
    {
       
        case 'Price':
			if ( confirm('Do you want to get price for Item ?'))
            {
	            arr_data = new Array();
				
	            r_index = 0;
	            cur_row = 0;
				
	            for(var i = 1; i < grdDetail.rows; i++)
	            {
	               var arrTemp=new Array();
				   
	               if ( grdDetail.GetGridControl().isSelected(i) == true )
	               {
	                   arrTemp[arrTemp.length] = grdDetail.GetGridData(i,G2_MASTER_PK);
	                   arrTemp[arrTemp.length] = grdDetail.GetGridData(i,G2_ITEM_PK);
	                   arrTemp[arrTemp.length] = i;
	                   arr_data[arr_data.length] = arrTemp;
	               }
	            }
	            
	            if ( arr_data.length > 0 )
	            {
	                txtSaleOrderPK.text = arr_data[0][0];
	                txtItemGridPK.text  = arr_data[0][1];
	                cur_row             = arr_data[0][2];
					
	                pro_dsbs00200_2.Call();
	            }
			}	
        break;
    }
}
 //================================================================================================
 
</script>

<body style="margin:0 0 0 0; padding:0 0 0 0;">


    <!------------------------------------------------------------------>
    <table id="main" style="width:100%;height:100%;border:0" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td id="left" style="width:30%;height:100%" valign="top" rowspan="2">
                <div style="width:100%;height:100%" class="eco_line">
                    <table style="width:100%;height:100%;border:1;" cellpadding="0" cellspacing="0">
                        <tr style="padding-bottom:5px;padding-left:5px;padding-right:5px;padding-top:5px;" class="eco_bg">
                            <td align="left" style="white-space:nowrap">
								Records :
							</td>
                            <td align="left" style="width:25%">
                                <gw:label id="lbSearchRecords" styles='width:100%;color:cc0000;font:9pt;align:left' text='0' />
                            </td>
                            <td align="left" style="width:50%"></td>
                            <td>
								<gw:button id="btnOrderNoSearch" img="search" onclick="OnSearch('SOLIST')" />
							</td>
                        </tr>
                        <tr style="padding-left:5px;padding-right:5px;padding-top:5px;">
                            <td colspan="4" style="padding-top:3px;" class="eco_line_t">
                                <table style="width: 100%; height: 100%" border="0">
                                    <tr>
                                        <td>
                                            Date
                                        </td>
                                        <td style="white-space: nowrap">
                                            <gw:datebox id="dtFromSearch" lang="1" styles="width:100%" />
											~<gw:datebox id="dtToSearch" lang="1" styles="width:100%" />
                                        </td>
                                        <td></td>
                                    </tr>   
                                     <tr style="height: 2%">
                                        <td >
                                            No.
                                        </td>
                                        <td colspan=2 >
                                            <gw:textbox id="txtPOSlipNoSearch" styles="width:100%" onenterkey="OnSearch('SOLIST')" />
                                        </td>
                                    </tr>
									<tr style="height: 2%">
                                        <td >
                                            Status
                                        </td>
                                        <td colspan=2 >
                                            <gw:list id="lstStatusSearch" styles='width:100%' onchange="OnSearch('SOLIST')" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 96%">
                            <td colspan="4" style="height:100%" class="eco_line_t">
                                <gw:grid id="grdSearch" header="_PK|SO/PO No|Date|Partner|Style" format="0|0|4|0|0" aligns="0|0|1|0|0"
                                defaults="||||" editcol="0|0|0|0|0" widths="0|1500|1200|2000|1000" styles="width:100%; height:100%"
                                sorting="T" acceptnulldate="true" param="0,1,2,3,4" oncellclick="OnSearch('MASTER')" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td id="right" style="width: 70%" valign="top">
                <div style="width:100%;" class="eco_line">
                    <table style="width:100%;height:100%;border:0;padding:2 5 1 5" cellpadding="0" cellspacing="0" border="0">
                        <tr style="padding-bottom:2px;" class="eco_bg">
                            <td align="left">
                                <table style="height:100%">
                                    <tr>
                                        <td>Slip Status : </td>
                                        <td style="width:100px"><gw:label id="lbStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' /></td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td align="right">
                                <table style="height:100%">
                                    <tr>
                                        <td><gw:button id="idBtnSubmit" img="submit" text="Submit" onclick="OnProcess('Submit')" /></td>
                                        <td><gw:button id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew('Master')" /></td>
                                        <td><gw:button id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" /></td>
                                        <td><gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" /></td>
										<td><gw:button id="btnPrint" img="excel" alt="Report" text="Report" onclick="OnPrint()" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
						<tr style="height: 1%">
							<td colspan=3>
								<table style="width: 100%; height: 100%; background-color: #B4E7FF">
									<tr>
										<td style="white-space: nowrap;width: 40%" align="left">
											<gw:radio id="radTab" value="1" styles="width:100%" onchange="OnChangeTab()"> 
												<span value="1" id="Deli-Info">Delivery</span> 
												<span value="2" id="Sale-Term">Sales Term</span> 
												<span value="3" id="Extension-Info">Extension Info</span>
												<span value="4" id="Remark">Remark</span>
											</gw:radio>
										</td>
										
									</tr>
								</table>
							</td>
						</tr>		
                        <tr>
                            <td colspan="3" style="padding-top:3px;" class="eco_line_t">
                                <table style="width: 100%; height: 100%" border="0.5">
                                    <tr>
										<td align="left" style="width: 15%; white-space: nowrap">
                                            Order Date
                                        </td>
                                        <td style="width: 35%">
                                            <gw:datebox id="dtVoucherDate" lang="1" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" style="text-decoration: none;" class="eco_link">Charger</a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtChargerName" styles="width:100%" />
                                            <gw:textbox id="txtChargerPK" styles="display:none" />
                                        </td>
                                    </tr>
									<tr>
										<td align="left" style="width: 15%; white-space: nowrap">
                                            Voucher No
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtVoucherNo" onkeypress="ChangeUpper()" csstype="mandatory" styles="width:100%;" />
                                        </td>
                                        <td align="right" style="width: 15%">
											<a title="Supplier" onclick="OnPopUp('Supplier')" href="#tips" style="text-decoration: none" class="eco_link">Supplier</a>
                                            
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtSupplierPK" styles="width:100%;display:none" />
                                            <gw:textbox id="txtSupplierName" styles="width:100%" />
                                        </td>
                                    </tr>
									<tr>
										<td align="left" style="width: 15%; white-space: nowrap">
                                            W/H
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="cboWH" styles="width:100%;" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            Ref No
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtRefNo" styles="width:100%" />
                                        </td>
                                    </tr>
									<tr>
										<td align="left" style="width: 15%; white-space: nowrap">
                                            Remark
                                        </td>
                                        <td style="width: 35%">
                                           <gw:textbox id="txtRemark" styles="width:100%;" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            <a title="Requester" onclick="OnPopUp('Requester')" href="#tips" style="text-decoration: none;" class="eco_link">Requester</a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtReqEmpName" styles="width:100%;" />
                                            <gw:textbox id="txtReqEmpPK" styles="display=none" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
        <tr style="height: 96%">
            <td valign="top">
                <div style="width:100%;height:100%" class="eco_line">
                    <table style="width:100%;border:0;height:100%;" cellpadding="0" cellspacing="0" border="0">
                        <tr style="padding-bottom:2px;padding:2 5 1 5;" class="eco_bg">
                            <td align="left">
                                <table style="height:100%">
                                    <tr>
                                        <td>Records :</td>
                                        <td style="width:100px"><gw:label id="lbDtRecords" styles='width:100%;color:cc0000;font:9pt;align:left' text='0' /></td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td align="right">
                                <table style="height:100%">
                                    <tr>
                                        <!--img status="expand" id="imgMaster" alt="Show all column" src="../../../../system/images/close_popup.gif" style="cursor: hand;display:none" onclick="OnToggleGrid()" /-->
                                        <td><gw:button id="idBtnStandard" img="extend" style="display:none" text="Standard" onclick="OnToggleGrid(this)" /></td>
                                        <td><gw:button id="idBtnExtend" img="extend" text="Extend" onclick="OnToggleGrid(this)" /></td>
                                        <td><gw:button id="idBtnPO" img="popup" text="P/O" onclick="OnAddNew('PO')" /></td>
                                        <td><gw:button id="idBtnItem" img="item" text="Item" onclick="OnAddNew('FreeItem')" /></td>
                                        <td><gw:button id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height:96%;">
                            <td colspan="3" valign="top" class="eco_line_t">
                                <gw:grid id='grdDetail' header='_PK|_ST_OUTGO_REQ_M_PK|Seq|_Ref No|_ST_ITEM_PK|_ST Code|_ST Name|_ITEM_PK|Item Code|Item Name|Req Qty|UOM|U/P|Amount|Lot No|Description'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0|0|0|0|3|1|3|3|0|0'
                                check='||||||||||0n|||||' editcol='0|0|1|1|0|0|0|0|0|0|1|0|1|1|1|1' widths='0|0|800|1500|0|2000|2500|0|2000|2500|1200|1000|1200|1200|1500|1000'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" maxlen="100" styles='width:100%;display:none' />       
    <!--------------------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
	<!--------------------------------------------------------------------->
	<gw:textbox id="txtEmp_PK" maxlen="100" styles='width:100%;display:none' /> 
	<gw:textbox id="txtItemCD_Search" maxlen="100" styles='width:100%;display:none' /> 
	<gw:textbox id="txtItemNM_Search" maxlen="100" styles='width:100%;display:none' />
	<!--------------------------------------------------------------------->
	 <gw:textbox id="txtOrderQty"   styles='width:100%;display:none' />
     <gw:textbox id="txtUnitPrice"  styles='width:100%;display:none' />
     <gw:textbox id="txtItemAmount"  styles='width:100%;display:none' />
	 <gw:textbox id="txtDiscountAmount"   styles='width:100%;display:none' />
     <gw:textbox id="txtTaxAmount"   styles='width:100%;display:none' />
     <gw:textbox id="txtTotalAmount" styles='width:100%;display:none' />
     
     <gw:textbox id="txtSTQty"     styles='width:100%;display:none' />
     <gw:textbox id="txtOrderUnit" styles='width:100%;display:none' />
     <gw:textbox id="txtLotUnit"   styles='width:100%;display:none' />
     <gw:textbox id="txtLotQty"    styles='width:100%;display:none' />
     <!--------------------------------------------------------------------->
     <gw:textbox id="txtMaskOrderQty"   styles='width:100%;display:none' />
     <gw:textbox id="txtMaskUnitPrice"   styles='width:100%;display:none' />
     <gw:textbox id="txtMaskItemAmount"  styles='width:100%;display:none' />
	 <gw:textbox id="txtMaskDiscountAmount"   styles='width:100%;display:none' />
     <gw:textbox id="txtMaskTaxAmount"   styles='width:100%;display:none' />
     <gw:textbox id="txtMaskTotalAmount" styles='width:100%;display:none' />
     
     <gw:textbox id="txtMaskSTQty"     styles='width:100%;display:none' />
     <gw:textbox id="txtMaskOrderUnit" styles='width:100%;display:none' />
     <gw:textbox id="txtMaskLotUnit"   styles='width:100%;display:none' />
     <gw:textbox id="txtMaskLotQty"    styles='width:100%;display:none' />                
    <!--------------------------------------------------------------------->    
	<gw:grid id="grdItem_Search" header="pk|item_cd|item_nm" format="0|0|0" aligns="0|0|0"
    defaults="||" editcol="1|1|1" widths="0|0|0" styles="width:100%; height:200;display:none"
    sorting="F" param="0,1,2" />
	<!--------------------------------------------------------------------->
    <gw:textbox id="txtSaleOrderPK"    styles='width:100%;display:none' />  
    <gw:textbox id="txtItemGridPK"    styles='width:100%;display:none' />  
    <gw:textbox id="txtUPRICE"    styles='width:100%;display:none' />
	
	<gw:checkbox id="chkUser" defaultvalue="Y|N" value="N" styles='display:none' />
</body>
</html>
