<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>REVISION REGISTRATION</title>
</head>
<script type="text/javascript">

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
	
    var arr_FormatNumber = new Array();     
    
	var G1_MASTER_PK			= 0;
	    
    var G2_DETAIL_PK            = 0,   
        G2_MASTER_PK            = 1,  
        G2_TSA_SOD_PK           = 2,   
        G2_SO_ITEM_NO           = 3,   
        G2_SEQ_NUM              = 4,   
        G2_ITEM_PK              = 5,   
        G2_ITEM_CODE            = 6,   
        G2_ITEM_NAME           	= 7,          
        G2_CUST_ITEM            = 8,  
        G2_ST_QTY               = 9,  
        G2_ST_UOM               = 10, 
        G2_ORD_UNIT             = 11,   
        G2_ORD_QTY              = 12,   
        G2_ORD_UOM              = 13,   
        G2_LOT_UNIT             = 14,   
        G2_LOT_QTY              = 15,   
        G2_LOT_UOM              = 16,   
        G2_UNIT_PRICE          	= 17,
		G2_ITEM_AMOUNT		   	= 18,
		G2_TAX_AMOUNT  		    = 19, 
        G2_TOTAL_AMOUNT         = 20,   
        G2_ITEM_ETD             = 21,   
        G2_ITEM_ETA             = 22,          
        G2_REMARK               = 23 ;
		
 var t_view = 'false';       
 var l_item_pk="", l_item_code="", l_item_nm=""
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
      OnChangeTab();
      //-----------------------------       
      FormatGrid();  
      //-----------------------------  
	  AddOnClick('Master');
 }

  //==========================================================
 function FormatGrid()
 {
      var trl ;
      
      trl = grdDetail.GetGridControl();
      	
      trl.ColFormat(G2_ST_QTY )     = "###,###,###,###,###";
	  trl.ColFormat(G2_ORD_UNIT)    = "###,###,###,###,###.###";
      trl.ColFormat(G2_ORD_QTY )    = "###,###,###,###,###";
      trl.ColFormat(G2_LOT_UNIT)    = "###,###,###,###,###.###";
      trl.ColFormat(G2_LOT_QTY)     = "###,###,###,###,###"; 
          
      trl.ColFormat(G2_UNIT_PRICE)  = "###,###,###,###,###.######";
	  trl.ColFormat(G2_ITEM_AMOUNT) = "###,###,###,###,###.##";
      trl.ColFormat(G2_TAX_AMOUNT)  = "###,###,###,###,###.##";
      trl.ColFormat(G2_TOTAL_AMOUNT)= "###,###,###,###,###.##";      
      
      trl.FrozenCols = G2_ITEM_NAME ;
      
      arr_FormatNumber[G2_ST_QTY]     = 0;
	  arr_FormatNumber[G2_ORD_UNIT]   = 3;
      arr_FormatNumber[G2_ORD_QTY]    = 0;
      arr_FormatNumber[G2_LOT_UNIT]   = 3;
      arr_FormatNumber[G2_LOT_QTY]    = 0;
     
      arr_FormatNumber[G2_UNIT_PRICE]   = 6;
	  arr_FormatNumber[G2_ITEM_AMOUNT]  = 2;
      arr_FormatNumber[G2_TAX_AMOUNT]   = 2;      
      arr_FormatNumber[G2_TOTAL_AMOUNT] = 2;
	  
		var data="";    
      
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
		//--------------------------				    	        
 } 
 //==========================================================
 function OnChangeTab()
 {
 
    var strRad = radTab.GetData();
    
    var tab_Deli_Info       = document.all("Tab-Deli-Info");    
    var tab_Sale_Term       = document.all("Tab-Sale-Term");    
    var tab_Extension_Info  = document.all("Tab-Extension-Info"); 
         
	switch (strRad)
	{
		case '1':
		    tab_Deli_Info.style.display      = "";
		    tab_Sale_Term.style.display      = "none";
		    tab_Extension_Info.style.display = "none";
		    
		    document.all("Deli-Info").style.color      = "cc0000"; 
		    document.all("Sale-Term").style.color      = "";
		    document.all("Extension-Info").style.color = ""; 
        break;
        
        case '2':
		    tab_Deli_Info.style.display      = "none";
		    tab_Sale_Term.style.display      = "";
		    tab_Extension_Info.style.display = "none"; 
		    
		    document.all("Deli-Info").style.color      = ""; 
		    document.all("Sale-Term").style.color      = "cc0000";
		    document.all("Extension-Info").style.color = "";       
        break;	
        
        case '3':
		    tab_Deli_Info.style.display      = "none";
		    tab_Sale_Term.style.display      = "none";
		    tab_Extension_Info.style.display = "";
		    
		    document.all("Deli-Info").style.color      = ""; 
		    document.all("Sale-Term").style.color      = "";
		    document.all("Extension-Info").style.color = "cc0000";         
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
					
            data_dsre00030.Call("SELECT");
        break;
		
        case 'MASTER' :  
            if ( data_revision_m.GetStatus() == 20 && t_view != 'true' )
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
					              
                      pro_dsre00030_4.Call();
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
				
                 pro_dsre00030_4.Call();
            }                       
        break;       
      }  
 }

 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
      switch (po_oData.id)         
      {
        case "data_revision_m" :
            if ( p_update == 1 )
            {
                p_update = 0 ;
				
                for ( var i = 1; i < grdDetail.rows ; i++ )
       		 	{
            		if ( grdDetail.GetGridData(i,G2_MASTER_PK) == "" )
            		{
                		grdDetail.SetGridText( i ,G2_MASTER_PK , txtMasterPK.text ) ;
                		grdDetail.SetRowStatus( i, '32' ) ;                		
           			}
        		}				
               OnSave('DETAIL');
            }
            else
            {
                data_dsre00030_2.Call('SELECT');
            } 
           
        break;
        
        case "data_saleorder_m":
            data_saleorder_d.Call("SELECT");
        break;
        
        case "data_dsre00030_2" :     
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
                
        case 'data_dsre00030_4':
				if(txtBillToPK.text == '')
				{
					txtBillToPK.text   = txtDeliToPK.text;
					txtBillToCode.text = txtDeliToCode.text;
					txtBillToName.text = txtDeliToName.text; 					
				}
		break;
		
        case 'pro_dsre00030_4':             
              data_revision_m.Call('SELECT')
        break;        
		 
         case 'pro_dsre00030_6':
             alert(txtReturnValue.text);
			 
			 data_revision_m.Call("SELECT");
         break;
		 
		 case 'pro_dsre00030_1':
             alert(txtReturnValue.text);			 
			 data_revision_m.Call("SELECT");		 
		 break;
		 
		 case'pro_dsre00030_5':
		    
		    if (txtItemPK_Search.text=="" )
            {
                
                    var queryString = "?item_cd=" + url_encode(l_item_code)
                                              + "&item_nm="
                                              + url_encode(l_item_nm);

               
                    var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00110.aspx" + queryString + "&group_type=Y|Y|Y|Y|Y|Y";
                    var aValue  =  window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');	
                	
	                if ( aValue != null ) 
	                {
	                    if ( gPreviousRow > 0 ) 
	                    {	
		                    grdDetail.SetGridText( gPreviousRow, G2_ITEM_PK,    aValue[0] );//spec_pk
		                    grdDetail.SetGridText( gPreviousRow, G2_ITEM_CODE,  aValue[1] );//spec_id
		                    grdDetail.SetGridText( gPreviousRow, G2_ITEM_NAME,  aValue[2] );//spec_name
                		    	    
		                }
	                }                                 
                                                         
                                        
            }else
            {
                grdDetail.SetGridText( gPreviousRow, G2_ITEM_PK,   txtItemPK_Search.text);//spec_pk
                grdDetail.SetGridText( gPreviousRow, G2_ITEM_CODE, txtItemID_Search.text);//spec_id
                grdDetail.SetGridText( gPreviousRow, G2_ITEM_NAME, txtItemNM_Search.text );//spec_name
            }
            gPreviousRow = -1;
		 break;
      }  
 }

//======================================================================================

 function AddOnClick(pos)
 {            
      switch (pos)         
      {		        
        case 'Master' :
            if ( data_revision_m.GetStatus() != 20 )
            {
                data_revision_m.StatusInsert();
                if ( grdSearch.row > 0 )
                    {
                        txtSOPK.text = grdSearch.GetGridData(grdSearch.row,0);
                    }  
				data_saleorder_m.Call('SELECT')
                 
                txtEmpPK.text   = user_pk   ;
                txtEmpName.text = user_name ;                
                grdDetail.ClearData();
                //----------------                              
            }
            else
            {
                alert("Already add new. Pls input data !!!");
            }
        break;
        
        case 'PopUpGetItem' :
             
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00071.aspx?group_type=Y||Y|Y||'+ txtStylePK.text + '&p_partner_pk=' + txtBillToPK.text;
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
        
        case 'dsbs00212' :
 
             var path = System.RootURL + '/standard/forms/ds/bs/dsbs00212.aspx?group_type=Y|Y||||';
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
             
             var path = System.RootURL + '/standard/forms/ds/bs/dsbs00015.aspx?tco_stitem_pk='+ txtStylePK.text+'&partner_pk='+ txtDeliToPK.text;
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
                    	    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,    arrTemp[12] );//item_pk	    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE,      arrTemp[13] );//item_code	    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME,      arrTemp[14] );//item_name	    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ORD_UOM,      arrTemp[15] );//item_uom
                    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ORD_UNIT, 1   );
                    grdDetail.SetGridText( grdDetail.rows-1, G2_ORD_QTY, arrTemp[17] );//LOT Unit Qty                    
                    grdDetail.SetGridText( grdDetail.rows-1, G2_LOT_QTY, arrTemp[16] );// Lot Qty
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
				
                data_dsre00030_4.Call("SELECT");
	         }
	    break; 
	         
        case 'DeliLoc' :
             if ( txtDeliToPK.text != '' )
             {
                 var path = System.RootURL + '/standard/forms/fp/ab/fpab00180.aspx?partner_pk=' + txtDeliToPK.text + '&partner_id=' + txtDeliToCode.text + '&partner_name=' + txtDeliToName.text ;
	             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
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
					alert("PLS SELECT DELIVERY TO PARTNER !");
					return;
				}
				var tco_item_pk = grdDetail.GetGridData( row, G2_ITEM_PK);
                var path = System.RootURL + '/standard/forms/ds/bs/dsbs00204.aspx?item_pk='+tco_item_pk;
	            var obj = System.OpenModal( path , 500 , 300 , 'resizable:yes;status:yes', this);	
	            if(obj !="" )
	            {
	                grdDetail.SetGridText( row, G2_CUST_ITEM,obj);
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
          
          case "Item":
          if ( grdDetail.row > 0 ) 
	            {
                   var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00110.aspx?group_type=Y|Y|Y|Y|Y|Y";
                    var aValue  =  window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');	
                	
	                if ( aValue != null ) 
	                {
	                    	
		                    grdDetail.SetGridText( grdDetail.row, G2_ITEM_PK,    aValue[0] );//spec_pk
		                    grdDetail.SetGridText( grdDetail.row, G2_ITEM_CODE,  aValue[1] );//spec_id
		                    grdDetail.SetGridText( grdDetail.row, G2_ITEM_NAME,  aValue[2] );//spec_name                		    	    
		                
	                }  
	            }          	                             
          break;
                                                  
      }         
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
                 p_update = 1 ;
                data_revision_m.Call();
               
            break;
            
            case 'DETAIL' :                                
                data_dsre00030_2.Call();
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
         
   if ( col == G2_ST_QTY || col == G2_ORD_UNIT || col == G2_ORD_QTY || col == G2_LOT_UNIT || col == G2_LOT_QTY || col == G2_UNIT_PRICE || col == G2_ITEM_AMOUNT || col == G2_TAX_AMOUNT || col == G2_TOTAL_AMOUNT )
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
			
			if ( col == G2_ST_QTY || col == G2_ORD_UNIT || col == G2_ORD_QTY || col == G2_LOT_UNIT ) 
			{
				var vLOT_QTY = Number(grdDetail.GetGridData( row, G2_LOT_UNIT ))*Number(grdDetail.GetGridData( row, G2_ORD_QTY ));
				grdDetail.SetGridText( row, G2_LOT_QTY, System.Round(vLOT_QTY,arr_FormatNumber[G2_LOT_QTY]));
			}
			
			if ( col == G2_ST_QTY || col == G2_ORD_UNIT || col == G2_ORD_QTY || col == G2_UNIT_PRICE )
			{
				var vITEM_AMT = Number(grdDetail.GetGridData( row, G2_ORD_QTY ))*Number(grdDetail.GetGridData( row, G2_UNIT_PRICE ));
				grdDetail.SetGridText( row, G2_ITEM_AMOUNT, System.Round(vITEM_AMT,arr_FormatNumber[G2_ITEM_AMOUNT]));
			}
			
			if ( col == G2_ST_QTY || col == G2_ORD_UNIT || col == G2_ORD_QTY || col == G2_UNIT_PRICE || col == G2_ITEM_AMOUNT )
			{			
				var vVAT_AMT = Number(grdDetail.GetGridData( row, G2_ITEM_AMOUNT ))*Number(lstTaxRate.value)/100;
				grdDetail.SetGridText( row, G2_TAX_AMOUNT, System.Round(vVAT_AMT,arr_FormatNumber[G2_TAX_AMOUNT]));
			}
			
			if ( col == G2_ST_QTY || col == G2_ORD_UNIT || col == G2_ORD_QTY || col == G2_UNIT_PRICE || col == G2_ITEM_AMOUNT || col == G2_TAX_AMOUNT )
			{
				var vTOTAL_AMT = Number(grdDetail.GetGridData( row, G2_ITEM_AMOUNT )) + Number(grdDetail.GetGridData( row, G2_TAX_AMOUNT )) ;
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
   /* else if (col == G2_ITEM_CODE || col == G2_ITEM_NAME)
    {
        gPreviousRow = event.row ;
        if(col==G2_ITEM_CODE)
        {
            txtItemID_Search.text         = grdDetail.GetGridData(gPreviousRow, G2_ITEM_CODE);
            txtItemNM_Search.text         = "";
        }
        else
        {
            txtItemID_Search.text         = "";
            txtItemNM_Search.text         = grdDetail.GetGridData(gPreviousRow, G2_ITEM_NAME);
        }
        l_item_pk = "" 
        l_item_code = txtItemID_Search.text
        l_item_nm = txtItemNM_Search.text       
        pro_dsre00030_5.Call();    
    } */
 }

 //=====================================================================================
 
 function TotalAmount()
 {
	   var vItemAmt = 0,vVatAmt = 0,vTotalAmt = 0, vOrdQty = 0 ;
	
       for (var i = 1; i<grdDetail.rows  ; i++)
       {
			//-----------------------------	   
            vItemAmt  =  vItemAmt  + Number(grdDetail.GetGridData(i, G2_ITEM_AMOUNT ));
            vVatAmt   =  vVatAmt   + Number(grdDetail.GetGridData(i, G2_TAX_AMOUNT  ));
            vTotalAmt =  vTotalAmt + Number(grdDetail.GetGridData(i, G2_TOTAL_AMOUNT));
			
			vOrdQty   =  vOrdQty   + Number(grdDetail.GetGridData(i, G2_ORD_QTY));                   
       }       
	   
       txtOrdAmt.text   = vItemAmt  ;
       txtTaxAmt.text   = vVatAmt   ;
       txtTotalAmt.text = vTotalAmt ;
	   
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
    if ( confirm ( "Do you want to delete this Revision ?" ) )
          {

            data_revision_m.StatusDelete();
            
            if (txtMasterPK.text!="")
            
                data_revision_m.Call()
                
            else
            
                alert("Please,Select a SO !")
         }
 }

//==============================================================================
function OnSubmit()
{
	if ( txtMasterPK.text != '' )
	{
       	if ( confirm("Do you want to submit this Order") )
       	{
           	pro_dsre00030_1.Call();      
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


 //============================================================================================== 
function OnChangeRate()
{
	var vItemAmt = 0,vVatAmt = 0,vTotalAmt = 0;
	
       for (var i = 1; i<grdDetail.rows  ; i++)
       {
         	dVatAmt = Number(grdDetail.GetGridData( i, G2_ITEM_AMOUNT )) * Number(lstTaxRate.value)/100;
			grdDetail.SetGridText( i, G2_TAX_AMOUNT, System.Round( dVatAmt, arr_FormatNumber[G2_TAX_AMOUNT] ) );
			//-----------------------------
			dTotalAmt = Number(grdDetail.GetGridData( i, G2_ITEM_AMOUNT )) + Number(grdDetail.GetGridData( i, G2_TAX_AMOUNT )) ;
			grdDetail.SetGridText( i, G2_TOTAL_AMOUNT, System.Round( dTotalAmt, arr_FormatNumber[G2_TOTAL_AMOUNT] ) );
			//-----------------------------	   
            vItemAmt  =  vItemAmt  + Number(grdDetail.GetGridData(i, G2_ITEM_AMOUNT ));
            vVatAmt   =  vVatAmt   + Number(grdDetail.GetGridData(i, G2_TAX_AMOUNT  ));
            vTotalAmt =  vTotalAmt + Number(grdDetail.GetGridData(i, G2_TOTAL_AMOUNT));                       
       }       
	   
       txtItemAmt.text  = vItemAmt  ;
       txtVatAmt.text   = vVatAmt   ;
       txtTotalAmt.text = vTotalAmt ; 
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

 //================================================================================================
 
</script>

<body style="margin:0 0 0 0; padding:0 0 0 0;">
    <!------------------------------------------------------------------>
    <gw:data id="pro_dsre00030_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsre00030_4" > 
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
    <gw:data id="data_revision_m" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48" function="st_lg_sel_dsre00030_1" procedure="st_lg_upd_dsre00030_1"> 
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
                    <inout bind="txtAtt03" />
                    <inout bind="txtAtt04" />	
									                    
                    <inout bind="dtETD" />
                    <inout bind="dtETA" /> 
                    <inout bind="txtSOPK" />                                                       
                     
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_saleorder_m" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control"  function="st_lg_sel_dsre00030_1_SO" > 
                <inout> 
                    <inout bind="txtSOPK" />					
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
                    <inout bind="txtAtt03" />
                    <inout bind="txtAtt04" />	
									                    
                    <inout bind="dtETD" />
                    <inout bind="dtETA" /> 
                    
                </inout>
            </dso> 
        </xml> 
    </gw:data>
     <!------------------------------------------------------------------>
    <gw:data id="data_saleorder_d" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale"  function="st_lg_sel_dsre00030_2_SO"   > 
                <input> 
                    <input bind="txtSOPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
     <!------------------------------------------------------------------>
    <gw:data id="data_dsre00030" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"   parameter="0,1,2,3" function="st_lg_sel_dsre00030" > 
                <input> 
                    <input bind="dtFromSearch" /> 
                    <input bind="dtToSearch" /> 
                    <input bind="txtPOSlipNoSearch" />       
					<input bind="txtStylePartnerSearch" />           
                    <input bind="txtEmp_PK" />
                    <input bind="chkUser" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsre00030_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23" function="st_lg_sel_dsre00030_2"  procedure="st_lg_upd_dsre00030_2" > 
                <input> 
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsre00030_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="control" function="st_lg_sel_dsre00030_4" > 
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
    <gw:data id="pro_dsre00030_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsre00030_1" > 
                <input>
                     <input bind="txtMasterPK" />                       
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>   
   <!-----------------------------adjust item------------------------------------->
    <gw:data id="pro_dsre00030_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_dsre00030_5" > 
                <input>
                     <input bind="txtItemID_Search" />                       
                     <input bind="txtItemNM_Search" /> 
                </input> 
                <output> 
                    <output bind="txtItemPK_Search" />
                    <output bind="txtItemID_Search" />
                    <output bind="txtItemNM_Search" />
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
                        <td>
                             <gw:checkbox id="chkUser" defaultvalue="Y|N" value="Y" />User
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
                                    <td style="width: 30%">
                                        <gw:textbox id="txtSoNo" styles='width:100%' csstype="mandatory" onenterkey="SetItemSequence()" />
                                    </td>
                                    <td style="width: 23%; white-space: nowrap" align="center" colspan="2">
                                        <gw:label id="lstOrderStatus" styles='width:100%;color:cc0000;font:9pt'></gw:label>
                                    </td>  
									<td style="width: 1%" align="right">                                         
                                    </td>                                   
                                    <td style="width: 1%" align="left">                                        
                                    </td>
                                    <td style="width: 1%" align="right"> 
										<gw:button id="idBtnSubmit" img="process" text="Process" alt="Process Revision"
                                            onclick="OnSubmit()" />
                                    </td>
								     <td style="width: 1%" align="right">
                                        
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
                                            <span value="1" id="Deli-Info">Delivery Info</span> 
                                            <span value="2" id="Sale-Term">Sales Term Info</span> 
                                            <span value="3" id="Extension-Info">Extension Info</span>
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
                                            csstype="mandatory" onenterkey="OnChangeTextbox(this)" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Payment_Term')">Pay Term</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstPaymentTerm" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        <b>Buy Rep</b>
                                    </td>
                                    <td style="width: 35%" colspan=2 >
                                        <gw:textbox id="txtBuyReq" styles='width:100%' />
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
                                        <b>Tax Rate</b>
                                    </td>
                                    <td style="width: 25%"> 
										<gw:list id="lstTaxRate" styles='width:100%' onchange="OnChangeRate()" csstype="mandatory" />                                       
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
										Remark 1                                        
                                    </td>
                                    <td style="width: 25%" colspan=3 >                                    
                                        <gw:textbox id="txtAtt01" styles='width:100%' />
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
										Remark 2   
									</td>
									<td colspan=3>	                                  
                                        <gw:textbox id="txtAtt02" styles='width:100%' />
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
                                        Remark 3
                                    </td>
                                    <td style="width: 25%" colspan=3 >
										<gw:textbox id="txtAtt03" styles='width:100%' />                                                                 
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
										Remark 4
                                    </td>
                                    <td style="width: 25%" colspan=3 >
                                    	<gw:textbox id="txtAtt04" styles='width:100%' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 2%">
                                
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
                                    <td style="width: 13%">
                                    </td>
                                    <td style="width: 1%">                                        
                                    </td>      
                                     <td>
                                        <gw:button img="new" alt="Free Item" id="btnItem" onclick="OnPopUp('Item')" />
                                    </td>                                                               
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td>
                            <gw:grid id='grdDetail' 
								header='_REV_D_PK|_REV_M_PK|_SO_DETAIL_PK|S/O Item No|Seq|_ITEM_PK|Item Code|Item Name|Cust Item|_Cust Qty|_UOM|_ORD UNIT|Ord Qty|UOM|_Lot Unit|_Lot QTY|_UOM|U/Price|Item Amt|Tax Amt|Total Amt|ETD|ETA|Remark'
                                format='0|0|0|0|0|0|0|0|2|0|2|0|0|2|2|0|2|0|0|0|0|4|4|0'
                                aligns='0|0|0|0|1|0|0|0|0|3|1|3|3|1|3|3|1|3|3|3|3|1|1|0'
                                editcol='0|0|0|0|1|0|1|1|1|1|0|1|1|0|1|1|0|1|1|1|1|1|1|1'
                                widths='0|0|0|1600|500|0|2000|3000|1500|1200|800|1000|1200|800|1000|1200|800|1200|1200|1200|1200|1200|1200|1000'
                                sorting='T' styles='width:100%; height:100%' acceptnulldate="T" onafteredit="CheckInput()"
                                oncelldblclick="OnPopUp('Detail')" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>    
    <!------------------------------------------------------>
    <gw:textbox id="txtMasterPK" maxlen="100" styles='width:100%;display:none' />  
    <!------------------------------------------------------>
    <gw:textbox id="txtSOPK" maxlen="100" styles='width:100%;display:none' />       
    <!------------------------------------------------------>
    <gw:textbox id="txtReturnValue" styles='width:100%;display:none' />
	<!------------------------------------------------------>
	<gw:textbox id="txtEmp_PK" maxlen="100" styles='width:100%;display:none' /> 
	
	<gw:textbox id="txtItemPK_Search" maxlen="100" styles='width:100%;display:none' /> 
	<gw:textbox id="txtItemID_Search" maxlen="100" styles='width:100%;display:none' /> 
	<gw:textbox id="txtItemNM_Search" maxlen="100" styles='width:100%;display:none' />
		
</body>
</html>
