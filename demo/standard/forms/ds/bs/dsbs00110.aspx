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

<script>

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
    
    var col_update ; // cot can update qty 
            
    var G_PK                = 0,
        G_TSA_SALEORDER_PK  = 1,
        G_SEQ_NUMBER        = 2,
        G_TCO_STITEM_PK     = 3,
        G_SPEC1_PK          = 4,
        G_SPEC1_CD          = 5,
        G_SPEC1_NM          = 6,
        G_SPEC2_PK          = 7,
        G_SPEC2_CD          = 8,
        G_SPEC2_NM          = 9,
        G_SPEC3_PK          = 10,
        G_SPEC3_CD          = 11,
        G_SPEC3_NM          = 12,
        G_SPEC4_PK          = 13,
        G_SPEC4_CD          = 14,
        G_SPEC4_NM          = 15,
        G_ADJ               = 16,
        G_SIZE1_QTY         = 17,
        G_SIZE2_QTY         = 18,
        G_SIZE3_QTY         = 19,
        G_SIZE4_QTY         = 20,
        G_SIZE5_QTY         = 21,
        G_SIZE6_QTY         = 22,
        G_SIZE7_QTY         = 23,
        G_TOTAL_QTY         = 24,
        G_UNIT_PRICE        = 25,
        G_AMOUNT            = 26;
       
 //---------------------------------------------------------
 var iCodeID = "" ;
 
 //---------------------------------------------------------
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
        imgArrow.src = "../../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="75%";
        imgArrow.src = "../../../../system/images/prev_orange.gif";
    }
 }

 //---------------------------------------------------------
 function BodyInit()
 {
    System.Translate(document); 
      OnChangeTab();
      //-----------------------------      
      dtFromOrderDate.SetDataText(System.AddDate(dtToOrderDate.GetData(),-5));
      //-----------------------------
      SetStatus(1);
      //-----------------------------                  
      txtStyleID.SetEnable(false);
      txtStyleName.SetEnable(false);
      //----------------------------- 
      BindingDataList();
      FormatGrid();
      //-----------------------------        
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
		    
		    document.all("Deli-Info").style.color      = "red"; 
		    document.all("Sale-Term").style.color      = "";
		    document.all("Extension-Info").style.color = ""; 
        break;
        
        case '2':
		    tab_Deli_Info.style.display      = "none";
		    tab_Sale_Term.style.display      = "";
		    tab_Extension_Info.style.display = "none"; 
		    
		    document.all("Deli-Info").style.color      = ""; 
		    document.all("Sale-Term").style.color      = "red";
		    document.all("Extension-Info").style.color = "";       
        break;	
        
        case '3':
		    tab_Deli_Info.style.display      = "none";
		    tab_Sale_Term.style.display      = "none";
		    tab_Extension_Info.style.display = "";
		    
		    document.all("Deli-Info").style.color      = ""; 
		    document.all("Sale-Term").style.color      = "";
		    document.all("Extension-Info").style.color = "red";         
        break;        
    } 
 }

 //==================================================================
 function SetStatus(pos)
 {
      switch (pos)         
      {		        
        case 1 :
            txtBillToCode.SetEnable(false);
            txtBillToName.SetEnable(false);
            txtDeliToCode.SetEnable(false);
            txtDeliToName.SetEnable(false);
            txtDeliLoc.SetEnable(false);
            txtEmpCode.SetEnable(false);
            txtEmpName.SetEnable(false);
            txtSoNo.SetEnable(false);
            
            lstOrderStatus2.SetEnable(false);
        break;
      }  
 } 

 //---------------------------------------------------------
 function FormatGrid()
 {
      var trl ;
      
      trl = grdDetail.GetGridControl();
      	
      trl.ColFormat(G_SIZE1_QTY) = "###,###,###,###,###";
      trl.ColFormat(G_SIZE2_QTY) = "###,###,###,###,###";
      trl.ColFormat(G_SIZE3_QTY) = "###,###,###,###,###"; 
      trl.ColFormat(G_SIZE4_QTY) = "###,###,###,###,###";     
      trl.ColFormat(G_SIZE5_QTY) = "###,###,###,###,###";
      trl.ColFormat(G_SIZE6_QTY) = "###,###,###,###,###";
      trl.ColFormat(G_SIZE7_QTY) = "###,###,###,###,###";
      trl.ColFormat(G_TOTAL_QTY) = "###,###,###,###,###";
      
      trl.ColFormat(G_UNIT_PRICE) = "###,###,###,###,###.##";
      trl.ColFormat(G_AMOUNT)     = "###,###,###,###,###.##";
 }
 
  //---------------------------------------------------------
 function BindingDataList()
 {    
        var data="";    
            
        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0080','','') FROM DUAL" )%>|ALL|Select ALL";    
        lstOrderStatus1.SetDataText(data);
        lstOrderStatus1.value = 'ALL' ;

        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0080','','') FROM DUAL" )%>";    
        lstOrderStatus2.SetDataText(data);
        lstOrderStatus2.value = '10'
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0030','','') FROM DUAL" )%>";    
        lstDeliMethod.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0040','','') FROM DUAL" )%>";    
        lstDeliTerm.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('COAB0080','','') FROM DUAL" )%>";    
        lstExNation.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('COAB0080','','') FROM DUAL" )%>";    
        lstDestNation.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0070','','') FROM DUAL" )%>";    
        lstSaleType.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('ACAB0110','','') FROM DUAL" )%>";    
        lstCurrency.SetDataText(data);
        lstCurrency.value = "USD";
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0050','','') FROM DUAL" )%>";    
        lstOrdType.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0170','','') FROM DUAL" )%>";    
        lstPayForm.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0110','','') FROM DUAL" )%>";    
        lstOrdPriority.SetDataText(data);
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0180','','') FROM DUAL" )%>";    
        lstPayTerm.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0010','','') FROM DUAL" )%>";    
        lstExPort.SetDataText(data);

        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0020','','') FROM DUAL" )%>";    
        lstDestPort.SetDataText(data); 
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0100','','') FROM DUAL" )%>";    
        lstPriceType.SetDataText(data); 
        
        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0120','','') FROM DUAL" )%>";    
        lstStockType.SetDataText(data);        
                  
        data = "data|1|1|2|2|3|3|4|4|5|5|6|6";
        lstSaleTeam.SetDataText(data);  
            
        data ="data|1|Order Qty|2|Lot Qty|3|Weight"
        lstPriceBy.SetDataText(data);  
        lstPriceBy.value = 3;  
  }        
 
 //---------------------------------------------------------
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
        case 1 :
            data_dsbs00110.Call("SELECT");
        break;
        case 2 :  
                              
            if ( data_dsbs00110_1.GetStatus() == 20 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave(1);
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtOrderPK.text = grdSearch.GetGridData(grdSearch.row,0);
                    }                
                    data_dsbs00110_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtOrderPK.text = grdSearch.GetGridData(grdSearch.row,0);
                }
                data_dsbs00110_1.Call("SELECT");
            }                       
        break;       
      }  
 }

 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 {
      switch (po_oData.id)         
      {
        case "data_dsbs00110_1" :
            if ( p_update == 1 )
            {
                p_update = 0 ;
                SetParentPKtoGrid();

                OnSave(2);
            }
            else
            {
                data_dsbs00110_2.Call('SELECT');
            } 
           
        break;
        
        case "data_dsbs00110_2" :
            if ( grdDetail.rows > 1 )
            {
                grdDetail.Subtotal( 0, 2, -1, '16!17!18!19!20!21!22!23!24!26');
            }
        break;
        
        case "pro_dsbs00110_1" :
            alert(txtresult.text);
        break;
                        
        case "datGetNewCode":
             if(txtComCodeID.text == 'COAB0080')
             {
                lstDestNation.SetDataText(txtCodeTemp.text);  
                lstDestNation.value = iCodeID;                      
             }
             else 
             if(txtComCodeID.text == 'SAAB0020')
             {
                lstDestPort.SetDataText(txtCodeTemp.text);  
                lstDestPort.value = iCodeID;                      
             }         
             else 
             if(txtComCodeID.text == 'SAAB0030')
             {
                lstDeliMethod.SetDataText(txtCodeTemp.text);  
                lstDeliMethod.value = iCodeID;                      
             }                          
             else 
             if(txtComCodeID.text == 'SAAB0050')
             {
                lstOrdType.SetDataText(txtCodeTemp.text);  
                lstOrdType.value = iCodeID;                      
             }         
             else 
             if(txtComCodeID.text == 'SAAB0100')
             {
                lstPriceType.SetDataText(txtCodeTemp.text);  
                lstPriceType.value = iCodeID;                      
             }         
             else
             if(txtComCodeID.text == 'SAAB0170')
             {
                lstPayForm.SetDataText(txtCodeTemp.text);  
                lstPayForm.value = iCodeID;                      
             }         
             else
             if(txtComCodeID.text == 'SAAB0180')
             {
                lstPayTerm.SetDataText(txtCodeTemp.text);  
                lstPayTerm.value = iCodeID;                      
             }         
             else
             if(txtComCodeID.text == 'COAB0080')
             {
                lstExNation.SetDataText(txtCodeTemp.text);  
                lstExNation.value = iCodeID;                      
             }         
             else
             if(txtComCodeID.text == 'ACAB0110')
             {
                lstCurrency.SetDataText(txtCodeTemp.text);  
                lstCurrency.value = iCodeID;                      
             }         
             else
             if(txtComCodeID.text == 'SAAB0070')
             {
                lstSaleType.SetDataText(txtCodeTemp.text);  
                lstSaleType.value = iCodeID;                      
             }              
             else
             if(txtComCodeID.text == 'SAAB0110')
             {
                lstOrdPriority.SetDataText(txtCodeTemp.text);  
                lstOrdPriority.value = iCodeID;                      
             }         
             else
             if(txtComCodeID.text == 'SAAB0010')
             {
                lstExPort.SetDataText(txtCodeTemp.text);  
                lstExPort.value = iCodeID;                      
             }  
             else
             if(txtComCodeID.text == 'SAAB0040')
             {
                lstDeliTerm.SetDataText(txtCodeTemp.text);  
                lstDeliTerm.value = iCodeID;                      
             }                     
         break;  
      }  
 }

 //------------------------------------------------------------------
 
 function SetParentPKtoGrid()
 {
        for ( i = 2; i < grdDetail.rows -1  ; i++ )
        {
            if ( grdDetail.GetGridData( i, G_TSA_SALEORDER_PK) == "" )
            {
                grdDetail.SetGridText( i, G_TSA_SALEORDER_PK , txtOrderPK.text ) ;
            }
        }
 }
  
  var step = 1 ;
 //---------------------------------------------------------
 function AddOnClick(pos)
 {
      switch (pos)         
      {		        
            case 'Master' :
                if ( data_dsbs00110_1.GetStatus() != 20 )
                {
                    data_dsbs00110_1.StatusInsert();
                    txtSoNo.SetDataText("**New Slip No**") ;
                    lstOrderStatus2.value = '10'
                    lstOrderStatus2.SetEnable(true);
                    
                    txtEmpPK.text = user_pk ;
                    txtEmpName.text = user_name ;
                    
                    lstSaleTeam.value = '' ;
                    txtSaleRep.text = '' ;
                    
                    grdDetail.ClearData();
                    //----------------
                }
                else
                {
                    alert("Already add new. Pls input data !!!");
                }
            break;
      }
 }
 
 //---------------------------------------------------------
 function OnPopUp(pos, col)
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
                
                if ( txtDeliToPK.text == '' )
                {
	                txtDeliToPK.text   = object[0];
                    txtDeliToCode.text = object[1];
                    txtDeliToName.text = object[2];
                    txtDeliToPK1.text  = object[0];
                    data_dsbs00110_4.Call("SELECT");
                }
              
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
                txtDeliToPK1.text  = object[0];
                data_dsbs00110_4.Call("SELECT");
	         }
	    break; 
	         
        case 'DeliLoc' :
             if ( txtDeliToPK.text != '' )
             {
                 var path = System.RootURL + '/standard/forms/fp/ab/fpab00180.aspx?partner_pk=' + txtDeliToPK.text + '&partner_id=' + txtDeliToCode.text + '&partner_name=' + txtDeliToName.text ;
	             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	             if ( object != null )
	             {
	                txtDeliLocPK.text = object[0];
                    txtDeliLoc.text   = object[4] ;
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
             
                 var path = System.RootURL + '/standard/forms/fp/ab/fpab00080.aspx?sale_yn=Y';
	             var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	             if ( obj != null )
	             {
	                txtStylePK.text   = obj[0];
	                txtStyleID.text   = obj[1];
                    txtStyleName.text = obj[2];
                 }	
	    break;
	    
          case 'Dest Nation':
             var path = System.RootURL + "/standard/forms/fp/ab/PopUpChangeCommonCode.aspx?code=COAB0080";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {	        	                   
	            if(object[0]==1)
	            {
	                txtComCodeID.text = 'COAB0080';
	                iCodeID           = object[1];
	                
                    datGetNewCode.Call("SELECT");                                
	            }
	            else
	                lstDestNation.value = object[1];        
	         }                
          break;          
          case 'Dest Port':
             var path = System.RootURL + "/standard/forms/fp/ab/PopUpChangeCommonCode.aspx?code=SAAB0020";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {	        	                   
	            if(object[0]==1)
	            {
	                txtComCodeID.text = 'SAAB0020';
	                iCodeID           = object[1];
	                
                    datGetNewCode.Call("SELECT");                                                                  
	            }
	            else
	                lstDestPort.value = object[1];	            
	         }                
          break;
          case "Deli Method":
             var path = System.RootURL + "/standard/forms/fp/ab/PopUpChangeCommonCode.aspx?code=SAAB0030";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {	        	                   
	            if(object[0]==1)
	            {
	                txtComCodeID.text = 'SAAB0030';
	                iCodeID           = object[1];
	                
                    datGetNewCode.Call("SELECT");                                
	            }
	            else
	                lstDeliMethod.value = object[1];	            
	         }                          
          break;
          case "Ord Type":
             var path = System.RootURL + "/standard/forms/fp/ab/PopUpChangeCommonCode.aspx?code=SAAB0050";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {	        	                   
	            if(object[0]==1)
	            {
	                txtComCodeID.text = 'SAAB0050';
	                iCodeID           = object[1];
	                
	                datGetNewCode.Call("SELECT");                                                                  
	            }
	            else
	                lstOrdType.value = object[1];	            
	         }                          
          break;
          case "Price type":
             var path = System.RootURL + "/standard/forms/fp/ab/PopUpChangeCommonCode.aspx?code=SAAB0100";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {	        	                   
	            if(object[0]==1)
	            {
	                txtComCodeID.text = 'SAAB0100';
	                iCodeID           = object[1];
                    
                    datGetNewCode.Call("SELECT");                                                                  
	            }
	            else
	                lstPriceType.value = object[1];	            
	         }                          
          break;
          case "Pay Way":
             var path = System.RootURL + "/standard/forms/fp/ab/PopUpChangeCommonCode.aspx?code=SAAB0170";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {	        	                   
	            if(object[0]==1)
	            {
	                txtComCodeID.text = 'SAAB0170';                                                    
                    iCodeID           = object[1]; 
                    
                    datGetNewCode.Call("SELECT");             
	            }
	            else
	                lstPayForm.value = object[1];	            
	         }                          
          break;
          case "Pay Term":
             var path = System.RootURL + "/standard/forms/fp/ab/PopUpChangeCommonCode.aspx?code=SAAB0180";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {	        	                   
	            if(object[0]==1)
	            {
	                txtComCodeID.text = 'SAAB0180';                                                   
                    iCodeID           = object[1]; 
                    
                    datGetNewCode.Call("SELECT");              
	            }
	            else
	                lstPayTerm.value = object[1];	            
	         }                          
          break;
          case "Ex Nation":
             var path = System.RootURL + "/standard/forms/fp/ab/PopUpChangeCommonCode.aspx?code=COAB0080";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {	        	                   
	            if(object[0]==1)
	            {
	                txtComCodeID.text = 'COAB0080';                                                    
                    iCodeID           = object[1]; 
                    
                    datGetNewCode.Call("SELECT");             
	            }
	            else
	                lstExNation.value = object[1];	            
	         }                          
          break;          
          case "Currency":
             var path = System.RootURL + "/standard/forms/fp/ab/PopUpChangeCommonCode.aspx?code=ACAB0110";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {	        	                   
	            if(object[0]==1)
	            {
	                txtComCodeID.text = 'ACAB0110';                                                  
                    iCodeID           = object[1];
                    
                    datGetNewCode.Call("SELECT");                                    
	            }
	            else
	                lstCurrency.value = object[1];	            
	         }                          
          break;        
          case "Production Type":
             var path = System.RootURL + "/standard/forms/fp/ab/PopUpChangeCommonCode.aspx?code=SAAB0070";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {	        	                   
	            if(object[0]==1)
	            {
	                txtComCodeID.text = 'SAAB0070';                                                 
                    iCodeID           = object[1];
                    
                    datGetNewCode.Call("SELECT");                
	            }
	            else
	                lstSaleType.value = object[1];	            
	         }                          
          break;    
          case "Priority":
             var path = System.RootURL + "/standard/forms/fp/ab/PopUpChangeCommonCode.aspx?code=SAAB0110";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {	        	                   
	            if(object[0]==1)
	            {
	                txtComCodeID.text = 'SAAB0110';                                                 
                    iCodeID           = object[1];
                    
                    datGetNewCode.Call("SELECT");                
	            }
	            else
	                lstOrdPriority.value = object[1];	            
	         }                          
          break;                              
          case 'Ex Port':
             var path = System.RootURL + "/standard/forms/fp/ab/PopUpChangeCommonCode.aspx?code=SAAB0010";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {	        	                   
	            if(object[0]==1)
	            {
	                txtComCodeID.text = 'SAAB0010';
	                iCodeID           = object[1];
	                
                    datGetNewCode.Call("SELECT");                                                                  
	            }
	            else
	                lstExPort.value = object[1];	            
	         }                
          break;    
          case 'Deli Term':
             var path = System.RootURL + "/standard/forms/fp/ab/PopUpChangeCommonCode.aspx?code=SAAB0040";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {	        	                   
	            if(object[0]==1)
	            {
	                txtComCodeID.text = 'SAAB0040';
	                iCodeID           = object[1];
	                
                    datGetNewCode.Call("SELECT");                                                                  
	            }
	            else
	                lstDeliTerm.value = object[1];	            
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
            case 1 :
                data_dsbs00110_1.Call();
                p_update = 1 ;
            break;
            
            case 2 :
                data_dsbs00110_2.Call();
            break;
      }  
    }
 }
 //------------------------------------------------------------------
 function CheckSave()
 {
    return true
 }
 //------------------------------------------------------------------
 function CheckInput()
 {   
    var  row, col 
        
    row = event.row ;
    col = event.col ;    
        
    if ( col == G_SIZE1_QTY  || col == G_SIZE2_QTY || col == G_SIZE3_QTY || col == G_SIZE4_QTY || col == G_SIZE5_QTY || col == G_SIZE6_QTY || col == G_SIZE7_QTY || col == G_TOTAL_QTY || col == G_UNIT_PRICE || col == G_AMOUNT)
    {      
        var dQuantiy
        
        dQuantiy =  grdDetail.GetGridData(row,col)
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                
                if ( col == col == G_SIZE1_QTY  || col == G_SIZE2_QTY || col == G_SIZE3_QTY || col == G_SIZE4_QTY || col == G_SIZE5_QTY || col == G_SIZE6_QTY || col == G_SIZE7_QTY  )
                {
                     grdDetail.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed())
                }else
                {
                    grdDetail.SetGridText(row,col,parseFloat(dQuantiy+"").toFixed(2));
                }
            }
            else
            {
                alert(" Value must greater than zero !!");
                grdDetail.SetGridText(row,col,"")
            }
        }
        else
        {
            grdDetail.SetGridText(row,col,"")
        }
    } 
 }
  //------------------------------------------------------------------
 function ResetAmount(row)
 {
            var dQty, dPrice, dRate ,dAmount
            dAmount  = 0
            //--------calculate amount---------------//
            if(lstPriceBy.value ==1)
            {
                dQty     = grdDetail.GetGridData( row, G1_ord_qty    );
            }else
            {
                if(lstPriceBy.value ==2)
                {
                    dQty  = grdDetail.GetGridData( row, G1_lot_qty    );
                }else
                {
                     dQty  = grdDetail.GetGridData( row, G1_weight_qty    );
                }
            }
            
            dPrice   = grdDetail.GetGridData( row, G1_unit_price );
            
            if( dQty != ""&& dPrice != "")
            {    
                dAmount = dQty * dPrice;
                //-----tax rate------//
                dRate = grdDetail.GetGridData( row, G1_vat_rate);
                if (dRate=="")
                {
                    dRate = 0 ;
                }
                //-------------------
                dAmount = dAmount + dAmount*dRate/100
                grdDetail.SetGridText( row, G1_amount, parseFloat(dAmount+"").toFixed(3));
            }
            else
            {
                grdDetail.SetGridText(row, G1_amount, "");
            }   
           
            TotalAmount(); 
 }
 
 //------------------------------------------------------------------
 
 function TotalAmount()
 {
    var sumOder,sum ,QtyCol
    sum =0
    sumOder =0
    QtyCol = G1_ord_qty;
    
    if(lstPriceBy.value ==1)
        {
         QtyCol = G1_ord_qty;
        }
    else
    {
        if(lstPriceBy.value ==2)
        {
             QtyCol = G1_lot_qty;
        }else
        {
             QtyCol = G1_weight_qty;
        }
    }
    
    for(i=1; i<grdDetail.rows; i++ )
    {
        var dValueOder ,dValueTotal
        
       dValueTotal = grdDetail.GetGridData(i,G1_amount) ;
       
       if ( Number(dValueTotal) )
       {
            sum = sum + parseFloat(dValueTotal);
          
            dValueOder =  grdDetail.GetGridData(i,QtyCol) * grdDetail.GetGridData(i,G1_unit_price)
            sumOder = sumOder + dValueOder
       }
       
    }
    txtTotalAmt.text = sum.toFixed(3)+""
    txtOrdAmt.text = sumOder.toFixed(3)+""
 }
 
//---------------------------------------------------------
 function OnDelete()
 {
    if ( confirm ( "Do you want to delete this order?" ) )
          {

            data_dsbs00110_1.StatusDelete();
            
            if (txtOrderPK.text!="")
            
                data_dsbs00110_1.Call()
                
            else
            
                alert("Please,Select a SO !")
         }
 }
 //----------------------------Print SO--------------------
 function OnReportClick(obj)
 {
    if ( obj == 'ProductionReq' )//sale order
    {
        if (txtOrderPK.text!="")
        { 	          
              var url = System.RootURL + "/system/ReportEngineSubReport.aspx?file=ds/bs/dsbs00010.rpt&procedure=sale.sp_rpt_dsbs00010|sale.sp_rpt_dsbs00010_1&parameter=" + txtOrderPK.text + "|" + txtOrderPK.text ;              
	          System.OpenTargetPage(url); 
        }       
        else
        {    
              alert("Please,Select a SO to print !");
        }
    }
 }

//------------------------------------------------------------------------------
 
function Loading()
{
     var url = System.RootURL + '/standard/forms/ds/bs/dsbs00011_v01.aspx' ;
	 var obj = System.OpenModal( url ,1000 , 600 ,  'resizable:yes;status:yes'); 
}

//------------------------------------------------------------------------------
function OnSubmit()
{

    pro_dsbs00110_1.Call();

}

//==================================================================
function OnPopUpSpec(pos)
{
    e_row = event.row ;
    e_col = event.col ;
    
    switch (pos)         
    {		        
        case 'GetSpec' :
            if ( e_col == G_SPEC2_CD )
            {
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00090.aspx?specgrp_pk=" + specgrp_pk ;
                var object  = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:500px;dialogHeight:500px');	
                
                if ( object != null )
                {
                    grdDetail.SetGridText( e_row, e_col -1 , object[2]);
                    grdDetail.SetGridText( e_row, e_col    , object[3]);
                }
            }
            if ( e_col == G_SPEC3_CD )
            {
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00090.aspx?specgrp_pk=" + specgrp_pk ;
                var object  = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:500px;dialogHeight:500px');	
                
                if ( object != null )
                {
                    grdDetail.SetGridText( e_row, e_col -1 , object[2]);
                    grdDetail.SetGridText( e_row, e_col    , object[3]);
                }
            }
            if ( e_col == G_SPEC4_CD )
            {
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00090.aspx?specgrp_pk=" + specgrp_pk ;
                var object  = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:500px;dialogHeight:500px');	
                
                if ( object != null )
                {
                    grdDetail.SetGridText( e_row, e_col -1 , object[2]);
                    grdDetail.SetGridText( e_row, e_col    , object[3]);
                }
            }                        
        break;
    }  
} 
//==================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00110_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,7,10,11,12,14,15,16,17,18,19,20,21,22,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48" function="sale.sp_sel_dsbs00110_1" procedure="sale.sp_upd_dsbs00110_1"> 
                <inout> 
                    <inout bind="txtOrderPK" />
                    <inout bind="dtOrderDate" />  
                    <inout bind="txtSoNo" />
                    <inout bind="lstOrderStatus2" />
                    <inout bind="txtBillToPK" />
                    <inout bind="txtBillToCode" />
                    <inout bind="txtBillToName" />           
                    <inout bind="txtDeliToPK" />
                    <inout bind="txtDeliToCode" />
                    <inout bind="txtDeliToName" /> 
                    <inout bind="lstDeliMethod" />
                    <inout bind="lstDeliTerm" />        
                    <inout bind="txtDeliLocPK" />  
                    <inout bind="txtDeliLoc" />  
                    <inout bind="lstExNation" />  
                    <inout bind="lstDestNation" />       
                    <inout bind="txtPONum" /> 
                    <inout bind="lstExPort" />
                    <inout bind="lstDestPort" />  
                    <inout bind="txtRemark" />
                    <inout bind="lstSaleType" />
                    <inout bind="lstCurrency" /> 
                    <inout bind="txtEmpPK" />
                    <inout bind="txtEmpCode"/>
                    <inout bind="txtEmpName"/>
                    <inout bind="txtTaxRate" /> 
                    <inout bind="lstOrdType" />
                    <inout bind="lstPayForm" /> 
                    <inout bind="txtSaleRep" /> 
                    <inout bind="lstOrdPriority" />  
                    <inout bind="lstPayTerm" />
                    <inout bind="txtBuyReq" />  
                    <inout bind="txtOrdAmt" />
                    <inout bind="txtTotalAmt" /> 
                    <inout bind="dtETD" />
                    <inout bind="dtETA" />
                    <inout bind="txtExchangeRate" />    
                    <inout bind="lstPriceType" /> 
                    <inout bind="lstStockType" />               
                    <inout bind="txtAtt01" />
                    <inout bind="txtAtt02" />
                    <inout bind="txtAtt03" />
                    <inout bind="lstSaleTeam" />
                    <inout bind="txtAtt05" />
                    <inout bind="lstPriceBy" />
                    <inout bind="txtStylePK" />
                    <inout bind="txtStyleID" />
                    <inout bind="txtStyleName" />
                    <inout bind="dtPODate" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00110" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"   parameter="0,1,2,3" function="sale.sp_sel_dsbs00110" > 
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
    <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00110_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26" function="sale.sp_sel_dsbs00110_2"  procedure="sale.sp_upd_dsbs00110_2" > 
                <input> 
                    <input bind="txtOrderPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dsbs00110_4" onreceive=""> 
        <xml> 
            <dso  type="control" function="sale.sp_sel_dsbs00110_4" > 
                <inout>
                    <inout bind="txtDeliToPK1"/>
                    <inout bind="txtDeliLocPK"/>
                    <inout bind="txtDeliLoc"/>
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="datGetNewCode" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="prod.sp_sel_new_commoncode" > 
                <input> 
                    <input bind="txtComCodeID" />
                </input>
	           <output>
	                <output bind="txtCodeTemp" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_dsbs00110_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="sale.sp_pro_dsbs00110_1" > 
                <input>
                     <input bind="txtOrderPK" /> 
                </input> 
                <output> 
                    <output bind="txtresult" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id='left' style="width: 25%">
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
                            <gw:button id="btnOrderNoSearch" img="search" onclick='OnSearch(1)' />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td align="right" style="width: 20%; white-space: nowrap">
                            <b>PO/SO No</b></td>
                        <td colspan="2">
                            <gw:textbox id="txtPOSONo" csstype="mandatory" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td align="right" style="width: 20%; white-space: nowrap">
                            Style</td>
                        <td colspan="2">
                            <gw:textbox id="txtStyleSearch" styles="width:100%" onenterkey="OnSearch(1)" />
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
                            <gw:grid id="grdSearch" header="_PK|Po No|Style|SO No" format="0|0|0|0" aligns="0|0|0|0"
                                defaults="|||" editcol="0|0|0|0" widths="0|1000|2000|1000" styles="width:100%; height:100%"
                                sorting="T" acceptnulldate="true" param="0,1,2,3" oncellclick="OnSearch(2)" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id='right' style="width: 75%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        <b>Ord Date</b>
                                    </td>
                                    <td style="width: 10%">
                                        <gw:datebox id="dtOrderDate" lang="1" styles='width:80%' />
                                    </td>
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        <b>So No</b>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtSoNo" styles='width:100%' csstype="mandatory" onenterkey="SetItemSequence()" />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        Status
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstOrderStatus2" styles='width:100%' />
                                    </td>
                                    <td style="width: 1%" align="left">
                                        <gw:button id="idBtnSubmit" img="Submit" text="Submit" alt="Submit Order"
                                            onclick="OnSubmit()" />
                                    </td>
                                    <td style="width: 3%">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button id="idBtnImportSO" img="Import SO" text="Import SO" onclick="Loading()" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button img="new" alt="New" id="btnAdd" onclick="AddOnClick('Master')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button img="save" alt="Save" id="btnUpdate" onclick="OnSave(1)" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button img="excel" alt="Print Production Request Form" id="btnPrintRequest" onclick="OnReportClick('ProductionReq')" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="white-space: nowrap" align="left">
                                        <gw:radio id="radTab" value="1" styles="width:100%" onchange="OnChangeTab()"> 
                                            <span value="1" id="Deli-Info">Delivery Info</span> 
                                            <span value="2" id="Sale-Term">Sales Term Info</span> 
                                            <span value="3" id="Extension-Info">Extension Info</span>
                                        </gw:radio>
                                    </td>
                                    <td align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Style',1)">Style</b>
                                    </td>
                                    <td colspan="9" style="white-space: nowrap">
                                        <gw:textbox id="txtStylePK" styles='display:none' />
                                        <gw:textbox id="txtStyleID" styles='width:30%' />
                                        <gw:textbox id="txtStyleName" styles='width:70%' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td>
                            <table id="Tab-Deli-Info" style="width: 100%; height: 100%">
                                <tr>
                                    <td colspan="6">
                                        <table style="width: 100%; height: 100%">
                                            <tr>
                                                <td style="width: 10%" align="right">
                                                    <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('BillTo',1)">Bill To </b>
                                                </td>
                                                <td style="width: 40%; white-space: nowrap">
                                                    <gw:textbox id="txtBillToCode" csstype="mandatory" styles='width:30%' />
                                                    <gw:textbox id="txtBillToName" csstype="mandatory" styles='width:70%' />
                                                </td>
                                                <td style="width: 10%" align="right">
                                                    <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('DeliTo',1)">Deli To </b>
                                                </td>
                                                <td style="width: 40%; white-space: nowrap">
                                                    <gw:textbox id="txtDeliToCode" csstype="mandatory" styles='width:30%' />
                                                    <gw:textbox id="txtDeliToName" csstype="mandatory" styles='width:70%' />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Deli Method',1)">Deli Method
                                        </b>
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstDeliMethod" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Deli Term',1)">Deli Term </b>
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstDeliTerm" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('DeliLoc',1)">Deli Loc </b>
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtDeliLoc" csstype="mandatory" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Ex Nation',1)">Ex Nation</b>
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstExNation" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Dest Nation',1)">Dest Nation
                                        </b>
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstDestNation" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        <b>PO Num</b>
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtPONum" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Ex Port',1)">Ex Port </b>
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstExPort" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Dest Port',1)">Dest Port </b>
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstDestPort" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        <b>PO Date</b>
                                    </td>
                                    <td style="width: 30%">
                                        <gw:datebox id="dtPODate" lang="1" styles='width:80%' />
                                    </td>
                                </tr>
                            </table>
                            <table id="Tab-Sale-Term" style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 10%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Ord Type',1)">Order Type</b>
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstOrdType" styles='width:100%' />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Price type',1)">Price type</b>
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstPriceType" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Emp',1)">Employee </b>
                                    </td>
                                    <td style="width: 30%; white-space: nowrap">
                                        <gw:textbox id="txtEmpCode" csstype="mandatory" styles='width:30%' />
                                        <gw:textbox id="txtEmpName" csstype="mandatory" styles='width:70%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        <b>Order Amt</b>
                                    </td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtOrdAmt" styles='width:100%' csstype="mandatory" type="number"
                                            format="###,###.###" />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Pay Way',1)">Pay Way </b>
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstPayForm" styles='width:100%' />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        <b>Sale Rep</b>
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtSaleRep" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        <b>Tax Rate</b>
                                    </td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtTaxRate" styles='width:100%' type="number" format="###,###.###"
                                            csstype="mandatory" />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Pay Term',1)">Pay Term </b>
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstPayTerm" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        <b>Buy Rep</b>
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtBuyReq" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        <b>Total Amt </b>
                                    </td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtTotalAmt" styles='width:100%' type="number" format="###,###.###"
                                            csstype="mandatory" />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Currency',1)">Currency</b>
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstCurrency" styles='width:100%' />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        Ex-Rate
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtExchangeRate" csstype="mandatory" type="number" format="###,###.###"
                                            styles='width:100%' text='950 ' />
                                    </td>
                                </tr>
                            </table>
                            <table id="Tab-Extension-Info" style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 10%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Priority',1)">Priority</b>
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstOrdPriority" styles='width:100%' />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        Price by
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstPriceBy" styles='width:100%;' onchange="OnChangePriceBy()" />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        Remark 1
                                    </td>
                                    <td style="white-space: nowrap; width: 30%" align="right">
                                        <gw:textbox id="txtAtt01" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Production Type',1)">Prod
                                            Type</b>
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstSaleType" styles='width:100%' />
                                    </td>
                                    <td style="width: 10%" align="right">
                                    </td>
                                    <td style="width: 20%">
                                    </td>
                                    <td style="width: 10%" align="right">
                                        Remark 2
                                    </td>
                                    <td style="width: 30%" align="right">
                                        <gw:textbox id="txtAtt03" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        Stock Type</td>
                                    <td style="width: 20%">
                                        <gw:list id="lstStockType" styles='width:100%' />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        Sale Team
                                    </td>
                                    <td style="width: 20%">
                                        <gw:list id="lstSaleTeam" styles='width:100%;' />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        Remark 4
                                    </td>
                                    <td style="width: 30%" align="right">
                                        <gw:textbox id="txtAtt05" styles='width:100%' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        Approve Date</td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtAtt02" styles='width:100%' />
                                    </td>
                                    <td style="width: 10%" align="right">
                                    </td>
                                    <td style="width: 20%">
                                    </td>
                                    <td style="width: 10%" align="right">
                                        Remark 5
                                    </td>
                                    <td style="width: 30%" align="right">
                                        <gw:textbox id="txtRemark" styles='width:100%' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr style="height: 2%">
                                    <td style="width: 10%" align="right">
                                        <b>Ship Date</b>
                                    </td>
                                    <td style="width: 10%" align="left">
                                        <gw:datebox id="dtETD" lang="1" />
                                    </td>
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        <b>Cancel Date</b>
                                    </td>
                                    <td style="width: 10%" align="left">
                                        <gw:datebox id="dtETA" lang="1" />
                                    </td>
                                    <td style="width: 15%; white-space: nowrap">
                                    </td>
                                    <td style="width: 15%" align="right">
                                        <b></b>
                                    </td>
                                    <td style="width: 10%; white-space: nowrap" align="center">
                                    </td>
                                    <td style="width: 10%" align="right">
                                    </td>
                                    <td style="width: 3%">
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button img="delete" alt="Delete" id="btnDeleteDetail" onclick="OnDeleteDetail()" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:button img="udelete" alt="Un Delete" id="btnUnDeleteDetail" onclick="OnUnDeleteDetail()" />
                                    </td>
                                </tr>
                                <tr style="height: 98%">
                                    <td colspan="16">
                                        <gw:grid id='grdDetail' header='_PK|_TSA_SALEORDER_PK|Seq|_TCO_STITEM_PK|_SPEC1_PK|STYLE #|_SPEC1_NM|_SPEC2_PK|S.C|SCHOOL|_SPEC3_PK|COLOR|_SPEC3_NM|_SPEC4_PK|LICENSING|_SPEC4_NM|ADJ|S|M|L|XL|2XL|3XL|4XL|TOTAL|PRICE|AMOUNT'
                                            format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3'
                                            defaults='||||||||||||||||||||||||||' editcol='0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1'
                                            widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                                            sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick="OnPopUpSpec('GetSpec')" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!------------------------------------------->
    <gw:textbox id="txtOrderPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtBillToPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtDeliToPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtDeliToPK1" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtDeliLocPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtEmpPK" maxlen="100" styles='width:100%;display:none' />
    <!------------------Convert UOM------------------------->
    <gw:textbox id="txtOrderUOM" styles='width:100%;display:none' />
    <gw:textbox id="txtUOM" styles='width:100%;display:none' />
    <gw:textbox id="txtQtyOfOderUOM" styles='width:100%;display:none' />
    <gw:textbox id="txtQtyAfterConvert" styles='width:100%;display:none' />
    <!------------------------------------------->
    <gw:textbox id="txtComCodeID" styles='width:100%;display:none' />
    <gw:textbox id="txtCodeTemp" styles='width:100%;display:none' />
    <!------------------------------------------->
    <gw:textbox id="txtQtyFormat" styles='width:100%;display:none' />
    <gw:textbox id="txtNumberOfDecimal" styles='width:100%;display:none' />
    <!-------------------------------------------->
    <gw:textbox id="txtresult" styles='width:100%;display:none' />
    <gw:textbox id="txtItem_pk" styles='width:100%;display:none' />
</body>
</html>
