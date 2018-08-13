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
		G2_REF_NO			    = 4,	
        G2_ITEM_PK              = 5,   
        G2_ITEM_CODE            = 6,   
        G2_ITEM_NAME            = 7,          
        G2_CUST_ITEM         	= 8,   
        G2_ST_QTY               = 9,   
        G2_ST_UOM               = 10, 
        G2_ORD_UNIT             = 11,   
        G2_ORD_QTY              = 12,   
        G2_ORD_UOM              = 13,   
        G2_LOT_UNIT             = 14,   
        G2_LOT_QTY              = 15,   
        G2_LOT_UOM              = 16,   
        G2_UNIT_PRICE           = 17, 
		G2_ITEM_AMOUNT			= 18,
		G2_DISC_AMOUNT			= 19,
		G2_TAX_AMOUNT  			= 20,
        G2_TOTAL_AMOUNT         = 21,   
        G2_ITEM_ETD             = 22,   
        G2_ITEM_ETA             = 23,           
        G2_REMARK               = 24;
		
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

		data = "<%=CtlLib.SetListDataSQL("SELECT pk ,factory_id || ' - ' || factory_name FROM tlg_pr_factory WHERE del_if = 0 and use_yn = 'Y' ORDER BY factory_id" )%>||"; 
		lstFactory.SetDataText(data);
		lstFactoryS.SetDataText(data);
		lstFactoryS.value='';
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
	
	var tr_ctr_grd_dt  = document.all("tr_ctr_grd_dt"); 
	
    var tr_grd_dt	   = document.all("tr_grd_dt");
	
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
			
			tr_ctr_grd_dt.style.display      	= "";
		    tr_grd_dt.style.display      	    = "";	
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
			
			tr_ctr_grd_dt.style.display      	= "";
		    tr_grd_dt.style.display      	    = "";	
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
			
			tr_ctr_grd_dt.style.display      	= "";
		    tr_grd_dt.style.display      	    = "";
			 	
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
			
			tr_ctr_grd_dt.style.display      	= "none";
		    tr_grd_dt.style.display      	    = "none";	
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
                cur_row             = arr_data[r_index][2];
				
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
	         var object = System.OpenModal( path ,1000 , 700 ,  'resizable:yes;status:yes');
	                 
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
		
		case 'REPORT':
			var path = System.RootURL + '/standard/forms/ds/bs/dsbs00219.aspx';
			var object = System.OpenModal( path ,400, 300 , 'resizable:yes;status:yes',this); 
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
		
		case 'SUBMIT':
			if ( txtMasterPK.text != '' )
			{
				if ( confirm("Do you want to submit this Order") )
				{
					pro_dsbs00200_1.Call();      
				}
			}   
		break;
    }
}

//================================================================================================

function OnReport(pos)
{
	switch(pos)
	{
		
		
		case 'ST02':
			
		break;

		case 'ST03':
			
		break;
		
		case 'YJ01':
			var url =System.RootURL + '/standard/reports/ds/bs/rpt_dsbs00200_YJ01.aspx?p_parent_pk='+ txtMasterPK.text ;
			window.open(url); 
		break;
		
		case 'YJ02':
			var url =System.RootURL + '/standard/reports/ds/bs/rpt_dsbs00200_YJ02.aspx?p_parent_pk='+ txtMasterPK.text ;
			window.open(url); 			
		break;
		
		case 'YJ03':
			var url =System.RootURL + '/standard/reports/ds/bs/rpt_dsbs00200_YJ03.aspx?p_parent_pk='+ txtMasterPK.text ;
			window.open(url); 			
		break;
	}

}

 //================================================================================================
 
</script>

<body style="margin:0 0 0 0; padding:0 0 0 0;">
    <!------------------------------------------------------------------>
    <gw:data id="pro_dsbs00200_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsbs00200_4" > 
                <input>
                    <inout bind="txtMasterPK" />
                </input> 
                <output> 
                     <output bind="txtMasterPK" />
                </output>
            </dso> 
        </xml> 
    </gw:data>         
    <!------------------------------------------------------------------>
    <gw:data id="grd_order_master" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63" function="st_lg_sel_dsbs00200_1" procedure="st_lg_upd_dsbs00200_1"> 
                <inout> 
                    <inout bind="txtMasterPK" />
					
                    <inout bind="dtOrderDate" />  
                    <inout bind="txtSoNo" />
                    <inout bind="lstOrderStatus" />					
					<inout bind="txtStylePK" />
                    <inout bind="txtStyleID" />
					
                    <inout bind="txtStyleName" />					
                    <inout bind="txtBillToPK" />
                    <inout bind="txtBillToCode" />
                    <inout bind="txtBillToName" />           
                    <inout bind="txtDeliToPK" />
					
                    <inout bind="txtDeliToCode" />
                    <inout bind="txtDeliToName" /> 
                    <inout bind="lstDeliMethod" />
                    <inout bind="lstDeliTerm" />        
                    <inout bind="txtDeliLocPK" /> 
					 
                    <inout bind="txtDeliLocName" />  
                    <inout bind="lstExNation" />  
                    <inout bind="lstDestNation" />       
                    <inout bind="txtPONum" /> 
                    <inout bind="lstExPort" />
					
                    <inout bind="lstDestPort" />  
					<inout bind="dtPODate" />					
					<inout bind="lstOrderType" />
					<inout bind="lstPriceType" />
					<inout bind="lstPaymentMethod" />
					
					<inout bind="lstPaymentTerm" />					
					<inout bind="txtEmpPK" />
                    <inout bind="txtEmpCode"/>
                    <inout bind="txtEmpName"/>					
					<inout bind="txtOrdAmt" />
					
					<inout bind="txtTaxAmt" />
					<inout bind="txtTotalAmt" />					
					<inout bind="lstTaxRate" />
					<inout bind="lstCurrency" />
					<inout bind="txtExchangeRate" />	
									
                    <inout bind="txtSaleRep" />
					<inout bind="txtBuyReq" />                    
					<inout bind="lstOrdPriority" />
                    <inout bind="lstProductionType" />
                    <inout bind="lstStockType" /> 
					
                    <inout bind="txtRemark" /> 
                    <inout bind="txtAtt01" />
                    <inout bind="txtAtt02" />
                    <inout bind="txtContractNo" />
                    <inout bind="dtContractDate" />	
									         
                    <inout bind="txtAtt05" />
                    <inout bind="txtAtt06" />
                    <inout bind="txtAtt07" />
                    <inout bind="txtAtt08" />					
                    <inout bind="txtAtt09" />
					
                    <inout bind="txtAtt10" />
                    <inout bind="txtAtt11" />
                    <inout bind="txtAtt12" />																 
                    <inout bind="dtETD" />
                    <inout bind="dtETA" />                                                       
                     
					<inout bind="txtDiscountAmt" /> 
					<inout bind="lstDiscountRate" />
					
					<inout bind="txtProdRemarks" /> 					
					<inout bind="txtMarkingRemarks" /> 
					<inout bind="txtFinishingRemarks" /> 					
					<inout bind="txtPackingRemarks" /> 
					<inout bind="txtShippingRemarks" /> 
					<inout bind="lstFactory" /> 
					
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="grd_order_default" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" function="st_lg_sel_dsbs00200_default" > 
                <inout> 
                    <inout bind="txtDeliToPK" />
                    <inout bind="txtDeliToCode" />
                    <inout bind="txtDeliToName" /> 
                    
                    <inout bind="txtBillToPK" />
                    <inout bind="txtBillToCode" />
                    <inout bind="txtBillToName" />  
                    
                    <inout bind="lstDeliMethod" />
                    <inout bind="lstDeliTerm" />
                    
                    <inout bind="txtDeliLocPK" /> 
                    <inout bind="txtDeliLocName" /> 
                    
                    <inout bind="lstExNation" />  
                    <inout bind="lstDestNation" /> 
                    
                    
                    <inout bind="lstExPort" />
                    <inout bind="lstDestPort" />
                      
                    <inout bind="lstOrderType" />
					<inout bind="lstPriceType" />
					
					<inout bind="lstPaymentMethod" />
					<inout bind="lstPaymentTerm" />		
						  
                    <inout bind="lstCurrency" />  
					
                    <inout bind="lstOrdPriority" />
					
					<inout bind="lstTaxRate" />
					
                    <inout bind="lstProductionType" />                    
                    <inout bind="lstStockType" />
                     
                     <inout  bind="txtOrderQty" /> 
                     <inout  bind="txtUnitPrice" /> 
                     <inout  bind="txtItemAmount" /> 					 
                     <inout  bind="txtTaxAmount" /> 
                     <inout  bind="txtTotalAmount" />  
                     
                     <inout  bind="txtSTQty" /> 
                     <inout  bind="txtOrderUnit" /> 
                     <inout  bind="txtLotUnit" /> 
                     <inout  bind="txtLotQty" />    
					 <inout  bind="txtDiscountAmount" />       
                     
                     <inout  bind="txtMaskOrderQty" /> 
                     <inout  bind="txtMaskUnitPrice" /> 
                     <inout  bind="txtMaskItemAmount" /> 					 
                     <inout  bind="txtMaskTaxAmount" /> 
                     <inout  bind="txtMaskTotalAmount" />  
                     
                     <inout  bind="txtMaskSTQty" /> 
                     <inout  bind="txtMaskOrderUnit" /> 
                     <inout  bind="txtMaskLotUnit" /> 
                     <inout  bind="txtMaskLotQty" />                
					 <inout  bind="txtMaskDiscountAmount" />
					 
					 <inout  bind="lstDiscountRate" />
                    
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00200" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"   parameter="0,1,2,3" function="st_lg_sel_dsbs00200" > 
                <input> 
                    <input bind="dtFromSearch" /> 
                    <input bind="dtToSearch" /> 
                    <input bind="txtPOSlipNoSearch" />       
					<input bind="txtStylePartnerSearch" />           
                    <input bind="lstStatusSearch" />
                    <input bind="txtEmp_PK" />
                    <input bind="chkUser" />
					<input bind="lstFactoryS" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00200_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24" function="st_lg_sel_dsbs00200_2"  procedure="st_lg_upd_dsbs00200_2" > 
                <input> 
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00200_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="control" function="st_lg_sel_dsbs00200_4" > 
                <inout>
                    <inout bind="txtDeliToPK"/>
                    <inout bind="txtDeliLocPK"/>
                    <inout bind="txtDeliLocName"/>
                    <inout bind="txtBillToPK"/>
                    <inout bind="txtBillToCode"/>
                    <inout bind="txtBillToName"/>
					<inout bind="lstOrderType" />					
					<inout bind="lstCurrency" />
					<inout bind="lstTaxRate" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>   
    <!------------------------------------------------------------------>
    <gw:data id="pro_dsbs00200_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsbs00200_1" > 
                <input>
                     <input bind="txtMasterPK" />                       
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>   
    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00110_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="st_lg_sel_fpab00110_2"  > 
                <input>
                    <input bind="txtItemCD_Search" />
                    <input bind="txtItemNM_Search" />
                </input> 
                <output bind="grdItem_Search" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_dsbs00200_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dsbs00200_5" > 
                <input>
                    <input bind="txtSaleOrderPK" />
                    <input bind="txtItemGridPK" />
                </input> 
                <output>
                    <output bind="txtUPRICE" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id='left' style="width: 25%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 30%">
                            <b>Date</b>
                        </td>
                        <td style="width: 79%">
                            <gw:datebox id="dtFromSearch" lang="1" styles="width:100%" />
                            ~<gw:datebox id="dtToSearch" lang="1" styles="width:100%" />
                        </td>
                        
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 20%; white-space: nowrap">
                            <b>PO/SO No</b>
                        </td>
                        <td >
                            <gw:textbox id="txtPOSlipNoSearch" styles="width:100%" onenterkey="OnSearch('SOLIST')" />
                        </td>
                        <td style="width: 1%" align='left'>
                            <gw:button id="btnOrderNoSearch" img="search" onclick="OnSearch('SOLIST')" />
                        </td>
                    </tr>    
					<tr style="height: 1%">
                        <td align="right" style="width: 20%; white-space: nowrap">
                            <b>Style/Partner</b>
                        </td>
                        <td >
                            <gw:textbox id="txtStylePartnerSearch" styles="width:100%" onenterkey="OnSearch('SOLIST')" />
                        </td>
                        <td style="width: 1%" align='left'>
                             
                        </td>
                    </tr>   
					<tr style="height: 1%">
                        <td align="right" style="width: 20%; white-space: nowrap">
                            <b>Factory</b>
                        </td>
                        <td >
                            <gw:list id="lstFactoryS" styles='width:100%' onchange="OnSearch('SOLIST')" />
                        </td>
                        <td style="width: 1%" align='left'>
                             
                        </td>
                    </tr>   								
                    <tr style="height: 1%">
                        <td align="right" style="width: 30%">
                            Status
                        </td>
                        <td >
                            <gw:list id="lstStatusSearch" styles='width:100%' onchange="OnSearch('SOLIST')" />
                        </td>
                        <td>
                             <gw:checkbox id="chkUser" defaultvalue="Y|N" value="Y" />User
                        </td>
                    </tr>
					<tr>
						<td align="right" style="width: 30%"  >
							<gw:button id="idBtnCopySO" img="copy" text="Copy" onclick="OnCopy('Master')" />
						</td>
						<td colspan=2 >
						</td>
					</tr>
                    <tr style="height: 96%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|SO/PO No|Date|Partner|Style" format="0|0|4|0|0" aligns="0|0|1|0|0"
                                defaults="||||" editcol="0|0|0|0|0" widths="0|1500|1200|2000|1000" styles="width:100%; height:100%"
                                sorting="T" acceptnulldate="true" param="0,1,2,3,4" oncellclick="OnSearch('MASTER')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id='right' style="width: 75%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr>
								    <td style="width: 5%; white-space: nowrap" align="left">										
										<img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                		style="cursor: hand" onclick="OnToggle()" />
									</td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Ord Date</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:datebox id="dtOrderDate" lang="1" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>S/O No</b>
                                    </td>
                                    <td style="width: 40%">
                                        <gw:textbox id="txtSoNo" styles='width:100%' csstype="mandatory" onenterkey="SetItemSequence()" />
                                    </td>
                                    <td style="width: 13%; white-space: nowrap" align="center" colspan="2">
                                        <gw:label id="lstOrderStatus" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                                    </td>  
									<td style="width: 1%" align="right">                                         
                                    </td>                                   
                                    <td style="width: 1%" align="left"> 
										<gw:button img="excel" alt="Report" onclick="OnPopUp('REPORT')" />
                                    </td>
                                    <td style="width: 1%" align="right"> 
										<gw:button id="idBtnSubmit" img="submit" text="Submit" alt="Submit Order" 
                                            onclick="OnProcess('SUBMIT')" />
                                    </td>
									<td style="width: 1%" align="left">
										<gw:button id="btnFileAttachList" img="attach" alt="List File Attach" onclick="OnPopUp('FileAttachList')" />          
                                    </td>
                                     <td style="width: 1%" align="right">
                                        <gw:button img="excel" alt="Report" styles='display:none' id="btnReport" onclick="OnPopUp('Report')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button img="new" alt="New" id="btnAdd" onclick="AddOnClick('Master')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button img="save" alt="Save" id="btnUpdate" onclick="OnSave('MASTER')" />
                                    </td>                                                                        
                                </tr>                                
                            </table>
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td>
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
                                    <td style="white-space: nowrap;width: 5%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Style')">Style</b>
                                    </td>
                                    <td style="white-space: nowrap;width: 55%">
                                        <gw:textbox id="txtStylePK" styles='display:none' />
                                        <gw:textbox id="txtStyleID" styles='width:30%' />
                                        <gw:textbox id="txtStyleName" styles='width:70%' />
                                    </td>
                                </tr>
							</table>
						</td>
					</tr>		
                    <tr style="height: 1%">
                        <td valign="top">
                            <table id="Tab-Deli-Info" style="width: 100%; height: 100%">
                                <tr>
                                    <td colspan="6">
                                        <table style="width: 100%; height: 100%" border=0 >
                                            <tr>
                                                <td style="width: 5%; white-space: nowrap" align="right">
                                                    <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('DeliTo')">Deli To </b>
                                                </td>
                                                <td style="width: 45%; white-space: nowrap">
													<gw:textbox id="txtDeliToPK" maxlen="100" styles='width:100%;display:none' />
                                                    <gw:textbox id="txtDeliToCode" csstype="mandatory" styles='width:30%' />
                                                    <gw:textbox id="txtDeliToName" csstype="mandatory" styles='width:70%' />
                                                </td>
                                                <td style="width: 5%; white-space: nowrap" align="right">
                                                    <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('BillTo')">Bill To </b>
                                                </td>
                                                <td style="width: 45%; white-space: nowrap;" >
													<gw:textbox id="txtBillToPK" maxlen="100" styles='width:100%;display:none' />
                                                    <gw:textbox id="txtBillToCode" csstype="mandatory" styles='width:30%' />
                                                    <gw:textbox id="txtBillToName" csstype="mandatory" styles='width:70%' />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Deli_Method')">Deli Method
                                        </b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstDeliMethod" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Deli_Term')">Deli Term
                                        </b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstDeliTerm" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('DeliLoc')">Deli Loc
                                        </b>
                                    </td>
                                    <td style="width: 35%">
										<gw:textbox id="txtDeliLocPK" maxlen="100" styles='width:100%;display:none' />
                                        <gw:textbox id="txtDeliLocName" csstype="mandatory" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Ex_Nation')">Ex Nation</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstExNation" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Dest_Nation')">Dest Nation
                                        </b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstDestNation" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>P/O Num</b>
                                    </td>
                                    <td style="width: 35%">
                                        <gw:textbox id="txtPONum" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Ex_Port')">Ex Port </b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstExPort" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Dest_Port')">Dest Port
                                        </b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstDestPort" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>P/O Date</b>
                                    </td>
                                    <td style="width: 35%">
                                        <gw:datebox id="dtPODate" lang="1" styles='width:80%' />
                                    </td>
                                </tr>
                            </table>
                            <table id="Tab-Sale-Term" style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Order_Type')">Ord Type</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstOrderType" styles='width:100%' onchange="OnChangeList(this)" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Price_type')">Price type</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstPriceType" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Emp')">Employee </b>
                                    </td>
                                    <td style="width: 35%; white-space: nowrap" colspan=2 >
										<gw:textbox id="txtEmpPK" maxlen="100" styles='width:100%;display:none' />
                                        <gw:textbox id="txtEmpCode" csstype="mandatory" styles='width:30%' />
                                        <gw:textbox id="txtEmpName" csstype="mandatory" styles='width:70%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Order Amt</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtOrdAmt" styles='width:100%' csstype="mandatory" type="number"
                                            format="###,###.###" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Payment_Method')">Pay Method</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstPaymentMethod" styles='width:100%' />
                                    </td>
									<td style="width: 5%; white-space: nowrap" align="right">
                                        Factory
                                    </td>
                                    <td style="width: 25%" colspan='4'>
                                        <gw:list id="lstFactory" styles='width:100%' />
                                    </td>
                                   
                                </tr>
								<tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Disc Amt</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtDiscountAmt" styles='width:100%' csstype="mandatory" type="number"
                                            format="###,###.###" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Payment_Term')">Pay Term</b>
                                    </td>
                                    <td style="width: 25%">
                                         <gw:list id="lstPaymentTerm" styles='width:100%' onchange="" />
                                    </td>
									
									 <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Sale Rep</b>
                                    </td>
                                    <td style="width: 35%" colspan=2 >
                                        <gw:textbox id="txtSaleRep" styles='width:100%' />
                                    </td>
									
                                   
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Tax Amt
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtTaxAmt" styles='width:100%' type="number" format="###,###.###"
                                            csstype="mandatory"   />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                         <b>Tax Rate</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstTaxRate" styles='width:100%' onchange="OnChangeRate('TAX')" csstype="mandatory" />     
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Ex-Rate
                                    </td>
                                    <td style="width: 15%; white-space: nowrap">
										<gw:list id="lstCurrency" styles='width:100%' />
									</td>
									<td style="width: 20%; white-space: nowrap">	
                                        <gw:textbox id="txtExchangeRate" csstype="mandatory" type="number" format="###,###.###"
                                            styles='width:100%' text='' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b>Total Amt </b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtTotalAmt" styles='width:100%' type="number" format="###,###.###"
                                            csstype="mandatory" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                         Disc-Rate
                                    </td>
                                    <td style="width: 25%"> 
										 <gw:list id="lstDiscountRate" styles='width:100%' onchange="OnChangeRate('DISCOUNT')" csstype="mandatory" />                                   
                                    </td>
                                     <td style="width: 5%; white-space: nowrap" align="right">
                                         <b>Buy Rep</b>
                                    </td>
                                    <td style="width: 35%" colspan=2 >
                                         <gw:textbox id="txtBuyReq" styles='width:100%' />
                                    </td>
									<td style="width: 20%; white-space: nowrap">	
                                        
                                    </td>
                                </tr>
                            </table>
                            <table id="Tab-Extension-Info" style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Priority')">Priority</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstOrdPriority" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right"> 
										Contract No                                       
                                    </td>
                                    <td style="width: 25%" colspan=3 >                                    
                                        <gw:textbox id="txtContractNo" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Prod_Type')">Prod Type</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstProductionType" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right"  >
										Contract Date 
									</td>
									<td colspan=3>	                                  
                                        <gw:datebox id="dtContractDate" lang="1" styles='width:80%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Stock Type
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstStockType" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                         Remark 1
                                    </td>
                                    <td style="width: 25%" colspan=3 >
										 <gw:textbox id="txtAtt01" styles='width:100%' />                                                               
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Remark
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtRemark" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%" align="right">
										 Remark 2 
                                    </td>
                                    <td style="width: 25%" colspan=3 >
                                    	 <gw:textbox id="txtAtt02" styles='width:100%' />
                                    </td>
                                </tr>
                            </table>
							<table id="Tab-Remark" style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Remark 5
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtAtt05" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right"> 
										Remark 09                                        
                                    </td>
                                    <td style="width: 25%" colspan=3 >                                    
                                        <gw:textbox id="txtAtt09" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Remark 6
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtAtt06" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right"  >
										Remark 10   
									</td>
									<td colspan=3>	                                  
                                        <gw:textbox id="txtAtt10" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Remark 7
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtAtt07" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Remark 11
                                    </td>
                                    <td style="width: 25%" colspan=3 >
										<gw:textbox id="txtAtt11" styles='width:100%' />                                                                
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Remark 8 
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtAtt08" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%" align="right">
										Remark 12
                                    </td>
                                    <td style="width: 25%" colspan=3 >
                                    	<gw:textbox id="txtAtt12" styles='width:100%' />
                                    </td>
                                </tr>
								<tr style="height: 4%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Prod Remarks
                                    </td>                               
                                    <td style="width: 25%" colspan=5 >
                                    	<gw:textarea id="txtProdRemarks" styles='width:100%;height:80' />
                                    </td>
                                </tr> 
								<tr style="height: 4%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Marking Remarks
                                    </td>                               
                                    <td style="width: 25%" colspan=5 >
                                    	<gw:textarea id="txtMarkingRemarks" styles='width:100%;height:80' />
                                    </td>
                                </tr> 
								<tr style="height: 4%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Finishing Marks
                                    </td>                               
                                    <td style="width: 25%" colspan=5 >
                                    	<gw:textarea id="txtFinishingRemarks" styles='width:100%;height:80' />
                                    </td>
                                </tr> 
								<tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Packing Remarks
                                    </td>                               
                                    <td style="width: 25%" colspan=5 >
                                    	<gw:textarea id="txtPackingRemarks" styles='width:100%;height:80' />
                                    </td>
                                </tr>
								<tr>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        Shipping Remarks
                                    </td>                               
                                    <td style="width: 25%" colspan=5 >
                                    	<gw:textarea id="txtShippingRemarks" styles='width:100%;height:80' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%" >
                        <td  style='width:100%' id="tr_ctr_grd_dt">
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td align="left">
                                        <table style="width: 100%; height: 100%">
                                            <tr>
                                                <td style="width: 5%">
                                                    <gw:button img="process" alt="Get Price to Item" id="btnGetPrice" onclick="OnProcess('Price')" />
                                                </td>
                                                <td style="width: 5%" align="right">
                                                    ETD
                                                </td>
                                                <td style="width: 15%" align="left">
                                                    <gw:datebox id="dtETD" lang="1" onchange="OnSetDate('ETD')" />
                                                </td>
                                                <td style="width: 5%" align="right">
                                                    ETA
                                                </td>
                                                <td style="width: 15%" align="left">
                                                    <gw:datebox id="dtETA" lang="1" onchange="OnSetDate('ETA')" />
                                                </td>                                    
                                                <td style="width: 5%; white-space: nowrap" align="right">
                                                    Items :
                                                </td>
                                                <td style="width: 20%; white-space: nowrap" align="center">
                                                    <gw:label id="lblTotalItem" styles='width:100%;color:cc0000;font:9pt' text='' />
                                                </td>
                                                <td style="width: 5%; white-space: nowrap" align="right">
                                                    Qty :
                                                </td>
                                                <td style="width: 20%; white-space: nowrap" align="center">
                                                    <gw:label id="lblTotalQty" styles='width:100%;color:cc0000;font:9pt' text='' type="number"
                                                        format="###.###,###.##" />
                                                </td>
                                                <td style="width:20%">&nbsp;</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <table style="width: 100%; height: 100%">
                                            <tr>
                                                <td style="width:20%">&nbsp;</td>
                                                <td style="width: 1%">
										            <gw:button id="idBtnCopy" img="copy" text="Copy" onclick="OnCopy('Detail')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:button img="new_sub" alt="Select Item" id="btnSelectItem" onclick="AddOnClick('Select-Item')" />
                                                </td>
                                                <td style="width: 1%" align="right">
                                                    <gw:button img="process" alt="Create and Get Item from ST Item" id="btnCreateItem" onclick="AddOnClick('dsbs00212')" />
                                                </td>
                                                <td style="width: 1%" align="right">
                                                    <gw:button img="new" alt="Item Price" id="btnAddDetail" onclick="AddOnClick('ITEM_PRICE')" />
                                                </td>
									            <td style="width: 1%" align="right">
                                                    <gw:button img="new" alt="Free Item" id="btnAddDetail" onclick="AddOnClick('FREE_ITEM')" />
                                                </td>
                                                <td style="width: 1%" align="right">
                                                    <gw:button img="delete" alt="Delete" id="btnDeleteDetail" onclick="OnDeleteDetail()" />
                                                </td>
                                                <td style="width: 1%" align="right">
                                                    <gw:button img="udelete" alt="Un Delete" id="btnUnDeleteDetail" onclick="OnUnDeleteDetail()" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>		
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 97%" id="tr_grd_dt">
                        <td>
                            <gw:grid id='grdDetail' 
								header='_DETAIL_PK|_MASTER_PK|S/O Item No|Seq|Ref No|_ITEM_PK|Item Code|Item Name|Cust Item|_Cust Qty|_UOM|_ORD UNIT|Ord Qty|UOM|Lot Unit|Lot Qty|UOM|U/Price|Item Amt|Dist Amt|Tax Amt|Total Amt|ETD|ETA|Remark|_item_type|_Levl'
                                format='0|0|0|0|0|0|0|0|2|0|2|0|0|2|2|0|2|0|0|0|0|0|4|4|0|0|0'
                                aligns='0|0|0|1|0|0|0|0|0|3|1|3|3|1|3|3|1|3|3|3|3|3|1|1|0|0|0'
                                editcol='0|0|0|1|1|0|1|1|1|1|0|1|1|0|1|1|0|1|1|1|1|1|1|1|1|0|0'
                                widths='0|0|1600|500|1200|0|2000|3000|1500|1200|800|1000|1200|800|1000|1200|800|1200|1200|1200|1200|1200|1200|1200|1000|100|100'
                                sorting='T' styles='width:100%; height:100%' acceptnulldate="T" onafteredit="CheckInput()"
                                oncelldblclick="OnPopUp('Detail')" />
                        </td>
                    </tr>
                </table>
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
</body>
</html>
