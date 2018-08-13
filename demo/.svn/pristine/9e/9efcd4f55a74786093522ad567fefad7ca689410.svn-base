<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>P/O ENTRY</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var flag;
//======================================================================
var G_PK         = 0 ;
                 
var G1_PO_D_PK   	= 0,
    G1_SEQ       	= 1, 
	G1_REF_NO   	= 2,   
    G1_REQ_ITEM_PK  = 3,
    G1_REQ_ITEM_CD  = 4,
    G1_REQ_ITEM_NM  = 5,
    G1_PO_ITEM_PK   = 6,
    G1_PO_ITEM_CD   = 7,
    G1_PO_ITEM_NM   = 8,        
    G1_REQ_QTY      = 9,
    G1_REQ_UOM      = 10,
	G1_PO_QTY       = 11,
    G1_PO_UOM       = 12,
    G1_UPRICE       = 13,
	G1_DISCOUNT_AMT	= 14,
    G1_PO_AMT       = 15,
    G1_VAT_RATE     = 16,
    G1_VAT_AMT      = 17,
    G1_OTHERS_EXP   = 18,
    G1_TOTAL_AMT    = 19,
    G1_ETD_FROM     = 20,
    G1_ETD_TO       = 21,
    G1_ETA_FROM     = 22,
    G1_ETA_TO       = 23,
    G1_PO_STOCK_QTY = 24,
	G1_PO_EXPECT_QTY= 25,	
    G1_DEPT_NM      = 26,
	G1_ATT01		= 27,
	G1_ATT02		= 28,
	G1_ATT03		= 29,
    G1_REMARK       = 30,
    G1_PR_D_PK      = 31,
    G1_PARENT_PK    = 32,
    G1_QUO_PK       = 33,   
    G1_PO_M_PK      = 34; 

var t_view = 'false';
     
var rtnLGCode = '' ;
var arr_FormatNumber = new Array();
//======================================================================

function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("imgArrow"); 

    if ( imgArrow.status == "expand")
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

//======================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	
	txtLang.text = "<%=Session("SESSION_LANG")%>";
    //---------------------------------- 
	txtEmpPK.text  = "<%=Session("EMPLOYEE_PK")%>"  ;
	txtUserPK.text = "<%=session("USER_PK")%>";
	//---------------------------------- 
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;      
    //----------------------------------            
         
    txtStaffName.SetEnable(false);
    txtDeliverName.SetEnable(false);
    txtShipToName.SetEnable(false);
    txtSupplierName.SetEnable(false);
    txtDeliverName.SetEnable(false);
    txtBillToName.SetEnable(false); 
 
    txtPLCode.SetEnable(false);
    txtPLName.SetEnable(false);
    //---------------------------------- 
               
    BindingDataList();
	
    OnChangeTab();
    OnToggleGrid();
    //------------------------- 
	OnSearch('COMPANY');	
	
	           
}
//======================================================================
function BindingDataList()
{
     var data ;

     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPO2003') FROM DUAL")%>|StandardPO|STANDARD P/O";  //report type
     lstReportType.SetDataText(data);
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPO2002') FROM DUAL")%>||";  //carrier
     lstDeliType.SetDataText(data);
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPO2001') FROM DUAL")%>||";  //po type
     lstPOType.SetDataText(data);
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0110') FROM DUAL")%>||";  //payment form
     lstPaymentMethod.SetDataText(data);
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0120') FROM DUAL")%>||";  //payment term
     lstPaymentTerm.SetDataText(data);
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
     lstCurrency.SetDataText(data);  
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0130') FROM DUAL" )%>||";    
     lstPriceType.SetDataText(data);
	 //----------------------- 
	 data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0210') FROM DUAL" )%>"; 
     lstExNation.SetDataText(data);
		
     //-----------------------
	 
     data = "<%=CtlLib.SetListDataSQL("select pk,DEPT_ID || ' * '|| DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>||"; 
     lstDept.SetDataText(data);  
     lstDept.value = '' ;
     //-----------------------
	 
}
//=========================================================
 function FormFormat()
 {      
    
     //-----------------------
     var ctr = grdDetail.GetGridControl(); 
    
     ctr.ColFormat(G1_PO_QTY)  = txtMaskPOQTy.text;
     ctr.ColFormat(G1_REQ_QTY) = txtMaskReqQty.text;
	 
	 ctr.ColFormat(G1_PO_STOCK_QTY)  = txtMaskPOQTy.text;
	 ctr.ColFormat(G1_PO_EXPECT_QTY) = txtMaskPOQTy.text;
     
     ctr.ColFormat(G1_UPRICE)       = txtMaskPOPrice.text;
     ctr.ColFormat(G1_PO_AMT)       = txtMaskPOAmount.text;     
     ctr.ColFormat(G1_VAT_RATE)     = txtMaskItemRate.text;
     ctr.ColFormat(G1_TOTAL_AMT)    = txtMaskTotalAmt.text;  
     ctr.ColFormat(G1_VAT_AMT)      = txtMaskTaxAmount.text;
     ctr.ColFormat(G1_OTHERS_EXP)   = txtMaskOthers.text;
	 ctr.ColFormat(G1_DISCOUNT_AMT) = txtMaskOthers.text;
     
     arr_FormatNumber[G1_PO_QTY]  = txtForPOQTy.text;
     arr_FormatNumber[G1_REQ_QTY] = txtForReqQTy.text;
	 
	 arr_FormatNumber[G1_PO_STOCK_QTY]  = txtForPOQTy.text;
	 arr_FormatNumber[G1_PO_EXPECT_QTY] = txtForPOQTy.text;
     
     arr_FormatNumber[G1_UPRICE]       = txtForPOPrice.text;
     arr_FormatNumber[G1_PO_AMT]       = txtForItemAmount.text;
     arr_FormatNumber[G1_VAT_RATE]     = txtForItemRate.text;
     arr_FormatNumber[G1_TOTAL_AMT]    = txtForTotalAmt.text;
     arr_FormatNumber[G1_VAT_AMT]      = txtForTaxAmount.text;
     arr_FormatNumber[G1_OTHERS_EXP]   = txtForOthers.text;  
     arr_FormatNumber[G1_DISCOUNT_AMT] = txtForOthers.text; 	 
	 
	 alert("Already set up basic information ! Now you can input data !"); 
     
 }
//======================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Charger':
            var path = System.RootURL + '/standard/forms/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtStaffName.text = obj[2];
                txtStaffPK.text   = obj[0];
            }
        break;         

        case 'Supplier' :
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AP";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {
	            txtSupplierPK.text   = object[0];
                txtSupplierName.text = object[2];
                
                if ( txtDeliverPK.text == '' )
                {
                    txtDeliverPK.text   = object[0];
                    txtDeliverName.text = object[2]; 
                } 
                if ( txtBillToPK.text == '' )
                {
                    txtBillToPK.text = object[0];
                    txtBillToName.text = object[2];
                }
                
                
                lstPaymentMethod.value = object[34];
                lstPaymentTerm.value   = object[35];
                lstPOType.value        = object[36];              
	         }
        break;
                
        case 'Deliver' :
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AP";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtDeliverPK.text   = object[0];
                txtDeliverName.text = object[2];                
	         }
        break;
                
        case 'Bill_To' :
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AP";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtBillToPK.text   = object[0];
                txtBillToName.text = object[2];  
                if ( txtSupplierPK.text == '' )
                {
                    txtSupplierPK.text = object[0];
                    txtSupplierName.text = object[2];
                }
	         }
        break;
        
        case 'Ship_To' :
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AR";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtShipToPK.text   = object[0];
                txtShipToName.text = object[2];  
	         }
        break;
        
        case 'PLCenter': // PL
            fpath  = System.RootURL + "/standard/forms/fp/ab/fpab00380.aspx";
            oValue = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {                
                txtPLPK.text        = oValue[3];
                txtPLCode.text      = oValue[4];
                txtPLName.text      = oValue[5];
            }
        break;  

        case 'PO': // Array P/O No
            fpath  = System.RootURL + "/standard/forms/fp/ab/fpab00330.aspx";
            oValue = System.OpenModal( fpath , 800 , 500 , 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {
                txtRefTablePK.text = oValue[0]; 
                txtRefNo.text      = oValue[1];
            }
        break;           
                                 
        case 'PaymentMethod':        
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0110";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {	        	                   
	            if ( object[0] == 1 )
	            {
	                txtLGGroupCodeID.text = 'LGCM0110';
	                rtnLGCode             = object[1];
	                
                    data_fpab00220_2.Call("SELECT");                                
	            }
	            else
	            {
	                lstPaymentMethod.value = object[1];      
	            }    	                
	         }                
        break;  

		case 'Ex_Nation':        
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0210";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {	        	                   
	            if ( object[0] == 1 )
	            {
	                txtLGGroupCodeID.text = 'LGCM0210';
	                rtnLGCode             = object[1];
	                
                    data_fpab00220_2.Call("SELECT");                                
	            }
	            else
	            {
	                lstExNation.value = object[1];      
	            }    	                
	         }                
        break;  		

        case 'PriceType':        
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0130";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {	        	                   
	            if ( object[0] == 1 )
	            {
	                txtLGGroupCodeID.text = 'LGCM0130';
	                rtnLGCode             = object[1];
	                
                    data_fpab00220_2.Call("SELECT");                                
	            }
	            else
	            {
	                lstPriceType.value = object[1];      
	            }    	                
	         }                
        break;   
        
        case 'PaymentTerms':
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGCM0120";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {	        	                   
	            if ( object[0] == 1 )
	            {
	                txtLGGroupCodeID.text = 'LGCM0120';
	                rtnLGCode             = object[1];
	                
                    data_fpab00220_2.Call("SELECT");                                
	            }
	            else
	            {
	                lstPaymentTerm.value = object[1];      
	            }    	                
	         }                              
        break;    
                
        case 'POType':
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGPO2001";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {	        	                   
	            if ( object[0] == 1 )
	            {
	                txtLGGroupCodeID.text = 'LGPO2001';
	                rtnLGCode             = object[1];
	                
                    data_fpab00220_2.Call("SELECT");                                
	            }
	            else
	            {
	                lstPOType.value = object[1];      
	            }    	                
	         }                
        break;  
        
        case 'DeliType':
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGPO2002";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {	        	                   
	            if ( object[0] == 1 )
	            {
	                txtLGGroupCodeID.text = 'LGPO2002';
	                rtnLGCode             = object[1];
	                
                    data_fpab00220_2.Call("SELECT");                                
	            }
	            else
	            {
	                lstDeliType.value = object[1];      
	            }    	                
	         }                
        break;  
        
        case 'ReportType':
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGPO2003";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
	         
	         if ( object != null )
	         {	        	                   
	            if ( object[0] == 1 )
	            {
	                txtLGGroupCodeID.text = 'LGPO2003';
	                rtnLGCode             = object[1];
	                
                    data_fpab00220_2.Call("SELECT");                                
	            }
	            else
	            {
	                lstReportType.value = object[1];      
	            }    	                
	         }                
        break;  
        
        case 'Report':
            if ( txtMasterPK.text != ''  )
            {
                 var count = 0;
                 for(var i = 0; i < grdSearch.rows; i++)
                 {
                    if(grdSearch.GetGridControl().isSelected(i) == true)
                    {
                        count++;
                    }
                    if(count > 10)
                    {
                        alert('Allowing only select up to 10 suppliers');
                        return;
                    }
                 }
                var path = System.RootURL + '/standard/forms/ep/bp/epbp00113.aspx';
		        var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
            }
            else
            {
                alert('PLS SELECT ONE P/O.');
            }          
        break;    

		case 'FileAttachList':
	    	if(txtMasterPK.text !="")
            {
		         var fpath = System.RootURL + '/standard/forms/ep/bp/epbp00116.aspx?master_pk=' + txtMasterPK.text ;
                 var aValue  = System.OpenModal(  fpath , 700 , 300 , 'resizable:yes;status:yes;scroll:no');                  
            }
            else
            {
                alert("Select one P/O to Attach file(s) list !!!")
            }
		break; 	
		
		case 'Dept':
                 var path = System.RootURL + '/standard/forms/ep/bp/epbp00200.aspx';
	             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');         
        break;
    }	       
}
 
//======================================================================
  
function OnAddNew(pos)
{
     switch (pos)
    {
        case 'Master':              
            data_epbp00110_1.StatusInsert();

            txtPONo.text   = '***New P/O***';
            
            if ( txtStaffPK.text == '' )
            {
                txtStaffName.text = "<%=Session("USER_NAME")%>";
                txtStaffPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            }  
            grdDetail.ClearData();  
            //-------------------------------------------            
            
            data_sel_epbp00110_3.Call("SELECT");   
            //------------------------------------------- 
                                    
            flag = "view";        
        break;
		//==========================================
		case 'DETAIL':                          
			grdDetail.AddRow();
			
			grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, 	grdDetail.rows-1   );	
			
			grdDetail.SetGridText( grdDetail.rows-1, G1_PO_M_PK, txtMasterPK.text); //master_pk				
        break; 
		//==========================================
        case 'PR' :
             var path = System.RootURL + '/standard/forms/ep/bp/epbp00111.aspx';
             var object = System.OpenModal( path ,1000 , 550 ,  'resizable:yes;status:yes', this);
             
             if ( object != null )
             {
                    var arrTemp;                   
                    
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_M_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_PK, arrTemp[7]);//item_pk
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_ITEM_PK,  arrTemp[7]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_ITEM_CD, arrTemp[8]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_ITEM_NM, arrTemp[9]);//item_name	
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_QTY,  arrTemp[12]);//balance qty   
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_UOM,  arrTemp[13]);//item_uom 
							
							grdDetail.SetGridText( grdDetail.rows-1, G1_UPRICE, arrTemp[14] );// unit price
							InputProcess( G1_UPRICE, grdDetail.rows-1 );
							
							grdDetail.SetGridText( grdDetail.rows-1, G1_VAT_RATE, Number(txtTaxRate.text) );
							InputProcess( G1_VAT_RATE, grdDetail.rows-1 );
							  							 							 
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_QTY, arrTemp[12]);//  
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_UOM, arrTemp[13]);//   
                                                      
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PR_D_PK, arrTemp[5] );//P/R Detail PK 
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REF_NO,  arrTemp[1] + '-' + arrTemp[6] ); // M/R Detail No  																																			                          
                    }		      					 
             }        
        break;
                
        case 'FreeItem' :
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00070.aspx?group_type=|Y|||Y|Y';
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_M_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_ITEM_PK, arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_ITEM_CD, arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_ITEM_NM, arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_UOM,     arrTemp[5]);//item_uom 
							
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REMARK,     arrTemp[9]);//Remark 

												
							
                            grdDetail.SetGridText( grdDetail.rows-1, G1_UPRICE,     arrTemp[6]);//pur price 
							InputProcess( G1_UPRICE, grdDetail.rows-1 );
							
							grdDetail.SetGridText( grdDetail.rows-1, G1_VAT_RATE, Number(txtTaxRate.text) );
							InputProcess( G1_VAT_RATE, grdDetail.rows-1 );                          
                    }		            
             }        
        break;
		
		case 'ITEMPRICE' :
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00074.aspx?group_type=|Y|||Y|Y' + '&p_partner_pk=' + txtSupplierPK.text;
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_M_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_ITEM_PK, arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_ITEM_CD, arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_ITEM_NM, arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_UOM,     arrTemp[3]);//item_uom  
							
                            grdDetail.SetGridText( grdDetail.rows-1, G1_UPRICE,     arrTemp[4]);//pur price 
							InputProcess( G1_UPRICE, grdDetail.rows-1 );
							
							grdDetail.SetGridText( grdDetail.rows-1, G1_VAT_RATE, Number(txtTaxRate.text) );
							InputProcess( G1_VAT_RATE, grdDetail.rows-1 );                          
                    }		            
             }        
        break;
		
        case 'STOCK':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00290.aspx?group_type=|Y|||Y|Y';
             var object = System.OpenModal( path, 800, 600, 'resizable:yes;status:yes');
             
             if ( object != null )
             {
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_M_PK, txtMasterPK.text); //master_pk	    	                                               
                                                         
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_ITEM_PK, arrTemp[1]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_ITEM_CD, arrTemp[2]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_ITEM_NM, arrTemp[3]);//item_name
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_QTY, arrTemp[7]);// 	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_UOM, arrTemp[4]);//                                                                                                                                                                   
                    }		            
             }        
        break;		
		
		case 'STOCK_STATUS':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00730.aspx?group_type=|Y|||Y|Y';
             var object = System.OpenModal( path, 800, 600, 'resizable:yes;status:yes');
             
             if ( object != null )
             {
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_M_PK, txtMasterPK.text); //master_pk	    	                                               
                                                         
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_ITEM_PK, arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_ITEM_CD, arrTemp[2]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_ITEM_NM, arrTemp[3]);//item_name
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_QTY, arrTemp[16]);// 	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PO_UOM, arrTemp[4]);//                                                                                                                                                                   
                    }		            
             }        
        break;		
                    
    }
}  

//======================================================================

function SetTaxRate()
{
		for ( var i=1; i < grdDetail.rows; i++ )
		{			 
				grdDetail.SetGridText( i, G1_VAT_RATE, Number(txtTaxRate.text) );
				InputProcess( G1_VAT_RATE, i );			 
		}
}
//======================================================================
function OnSearch(pos)
{  
    switch (pos)
    {
        case 'grdSearch':
			if ( t_view == 'false' ) 	
			{
				t_view = 'true';
			}
			
            data_epbp00110.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_epbp00110_1.GetStatus() == 20 && grdDetail.rows > 1 && t_view != 'true' )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_PK );
                    }
                    flag = 'view' ;
                    data_epbp00110_1.Call("SELECT");
                }                
            } 
            else
            {
				t_view = '';
				
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_PK );
                }
                else
                {
                    txtMasterPK.text = '' ;
                }
                
                flag = 'view' ;
                data_epbp00110_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_epbp00110_2.Call("SELECT");
        break;
		
		case 'COMPANY':
			data_epbp00110_4.Call(); 
		break;
		
		case 'DEPT':
			data_epbp00110_5.Call();
			
		break;
    }
}

//======================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_epbp00110_1": 
                   
            if ( flag == 'save')
            {
                for(var i=1; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G1_PO_M_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G1_PO_M_PK, txtMasterPK.text);
                    } 
                }
                //----------------------------
                OnSave('Detail');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdDetail');   
            }
            
        break;
        
        case "data_epbp00110_2":
	        if ( grdDetail.rows > 1 )
	        {
	            grdDetail.SetCellBold( 1, G1_PO_ITEM_CD, grdDetail.rows - 1, G1_PO_ITEM_CD,  true);
	            
                grdDetail.SetCellBold( 1, G1_PO_QTY,  grdDetail.rows - 1, G1_PO_QTY,  true);
                grdDetail.SetCellBold( 1, G1_REQ_QTY, grdDetail.rows - 1, G1_REQ_QTY, true);
                
                grdDetail.SetCellBold( 1, G1_TOTAL_AMT, grdDetail.rows - 1, G1_TOTAL_AMT, true);               
                
                grdDetail.SetCellBgColor( 1, G1_REQ_ITEM_CD , grdDetail.rows - 1, G1_REQ_ITEM_NM , 0xCCFFFF );
				
				grdDetail.SetCellBgColor( 1, G1_PO_STOCK_QTY ,  grdDetail.rows - 1, G1_PO_STOCK_QTY ,  0xCCFFFF );
				grdDetail.SetCellBgColor( 1, G1_PO_EXPECT_QTY , grdDetail.rows - 1, G1_PO_EXPECT_QTY , 0xCCFFFF );
				
                var qty = 0;
                for ( var i = 1 ; i < grdDetail.rows ; i++)
                {
                    qty += Number(grdDetail.GetGridData( i, G1_PO_QTY ))
                    if ( Number(grdDetail.GetGridData( i, G1_REQ_ITEM_PK)) > 0 && ( grdDetail.GetGridData( i, G1_REQ_ITEM_PK) != grdDetail.GetGridData( i, G1_PO_ITEM_PK) ) )
                    {
                        grdDetail.GetGridControl().Cell( 7, i, G1_PO_ITEM_CD, i, G1_PO_ITEM_NM ) = 0x3300cc;
                    }
                }        
	        }  
	        else
	        {
	            qty = 0;
	        } 
	        //lblTotalQty.text = addCommas(qty);
	        //lblRowCount.text = addCommas(grdDetail.rows - 1);
        break;
        
        case "data_fpab00220_2":
             if ( txtLGGroupCodeID.text == 'LGCM0110')
             {
                lstPaymentMethod.SetDataText(txtLGCodeList.text);
                lstPaymentMethod.value = rtnLGCode;                      
             }
             else if ( txtLGGroupCodeID.text == 'LGCM0130')
             {
                lstPriceType.SetDataText(txtLGCodeList.text);  
                lstPriceType.value = rtnLGCode;                      
             }
             else if ( txtLGGroupCodeID.text == 'LGCM0120')
             {
                lstPaymentTerm.SetDataText(txtLGCodeList.text);  
                lstPaymentTerm.value = rtnLGCode;                      
             }              
             else if ( txtLGGroupCodeID.text == 'LGPO2001')
             {
                lstPOType.SetDataText(txtLGCodeList.text);  
                lstPOType.value = rtnLGCode;                      
             }                            
             else if ( txtLGGroupCodeID.text == 'LGPO2002')
             {
                lstDeliType.SetDataText(txtLGCodeList.text);  
                lstDeliType.value = rtnLGCode;                      
             } 
             else if ( txtLGGroupCodeID.text == 'LGPO2003')
             {
                lstReportType.SetDataText(txtLGCodeList.text);  
                lstReportType.value = rtnLGCode;                      
             }  
			 else if ( txtLGGroupCodeID.text == 'LGCM0210')
             {
                lstExNation.SetDataText(txtLGCodeList.text);  
                lstExNation.value = rtnLGCode;                      
             }			 
         break;                
         
         case 'pro_epbp00110':
            data_epbp00110.Call("SELECT");
         break; 
         
         case 'pro_epbp00110_4' :
            OnSearch('grdDetail');
         break;   
         
         case 'data_sel_epbp00110_3':
            FormFormat();
         break;     
         
         case 'pro_epbp00110_2':
            alert(txtReturnValue.text);
         break; 
		  
         case 'pro_epbp00110_3':
            alert(txtReturnValue.text);
         break; 
		 
         case 'pro_epbp00110_1':
		 
            grdDetail.SetGridText( cur_row, G1_UPRICE, System.Round( txtUPRICE.text, arr_FormatNumber[G1_UPRICE] ));
			//---------------
			InputProcess( G1_UPRICE, cur_row );                 
			//---------------			
            r_index++;
			
            if ( r_index < arr_data.length )
            {  
                txtPO_ITEM_PK.text = arr_data[r_index][0];
                txtUOM.text        = arr_data[r_index][1];
                cur_row            = arr_data[r_index][2];
				
                pro_epbp00110_1.Call();
            }
			//---------------	 
         break; 
		 
		 case 'data_epbp00110_4':
			//-------------------
			cboCompany.SetDataText(txtReturnValue.text);
			cboSearchCompany.SetDataText(txtReturnValue.text+"||");
			
			cboCompany.value = "<%=session("COMPANY_PK")%>";
			cboSearchCompany.value = "<%=session("COMPANY_PK")%>" ;
			//-------------------
			OnSearch('DEPT');
		 break;	
		 
		 case 'data_epbp00110_5':
			//-------------------
			lstDept.SetDataText(txtReturnValue.text);
			cboSearchDept.SetDataText(txtReturnValue.text+"||");
			cboSearchDept.value = '';
			//-------------------		 
			OnAddNew('Master');
		 break;		
    }
}

//======================================================================

 function OnDelete(index)
 {        
    switch (index)
    {
        case 'Master':// delete master
            if ( txtMasterPK.text != '' )
            {
                if(confirm('Do you want to delete this Voucher?'))
                {
                    flag='delete';
                    data_epbp00110_1.StatusDelete();
                    data_epbp00110_1.Call();
                } 
            }  
        break;

        case 'Detail':
            if ( grdDetail.row > 0 )
            {
                if(confirm('Do you want to delete this Item?'))
                {
                    if ( grdDetail.GetGridData( grdDetail.row, G1_PO_D_PK ) == '' )
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

    }     
}
//======================================================================
 
function OnUnDelete()
{              
     grdDetail.UnDeleteRow();
}
//======================================================================

function Validate()
{  
    
    if ( txtSupplierPK.text == '' )
    {
        
        alert('Pls select Supplier first !!!');
        return false ;
    } 
    //---------------
    for( var i = 1; i < grdDetail.rows; i++)
    {
        //---------------
        if ( Number(grdDetail.GetGridData( i, G1_PO_QTY)) == 0)
        {
            alert("Input PO Qty. at " + i + ",pls!")
            return false;
        }
    }
    //----------------
    return true;
}

//======================================================================
function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            
            if ( Validate())
            {
                flag = 'save';
                data_epbp00110_1.Call();
            }    
                    
        break;
        
        case 'Detail':        
            data_epbp00110_2.Call();
        break;
    }
}
//======================================================================
function InputProcess( col, row )
{
    var dPOAmount = 0 , dVATAmount = 0 , dOthersExp = 0, dTotalAmount = 0 ;    
    
    if ( col == G1_PO_QTY || col == G1_REQ_QTY || col == G1_UPRICE || col == G1_DISCOUNT_AMT || col == G1_PO_AMT || col == G1_VAT_RATE || col == G1_TOTAL_AMT||col == G1_VAT_AMT || col == G1_OTHERS_EXP)
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData( row, col) ;
        
        if (Number(dQuantiy))
        {   
                            
            grdDetail.SetGridText( row, col, System.Round( grdDetail.GetGridData(row, col), arr_FormatNumber[col] ) );                 
            
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        }                
    }
    //---- CALCULATE AMOUNT ------
    if ( chkAutoCal.value == 'Y' )
    {      
        if ( col == G1_PO_QTY || col == G1_UPRICE || col == G1_DISCOUNT_AMT )
        {                 
            dPOAmount = Number(grdDetail.GetGridData( row, G1_PO_QTY )) * Number(grdDetail.GetGridData( row, G1_UPRICE )) - Number(grdDetail.GetGridData( row, G1_DISCOUNT_AMT ));                            			               
            grdDetail.SetGridText( row, G1_PO_AMT, System.Round( dPOAmount, arr_FormatNumber[G1_PO_AMT] )) ;
			 
            dVATAmount   = Number(grdDetail.GetGridData( row, G1_PO_AMT )) * Number(grdDetail.GetGridData( row, G1_VAT_RATE )) / 100 ;                    
            grdDetail.SetGridText( row, G1_VAT_AMT, System.Round( dVATAmount, arr_FormatNumber[G1_VAT_AMT] )) ;
           
            dTotalAmount = Number(grdDetail.GetGridData( row, G1_PO_AMT )) + Number(grdDetail.GetGridData( row, G1_VAT_AMT )) +  Number(grdDetail.GetGridData( row, G1_OTHERS_EXP)) ;           
            grdDetail.SetGridText( row, G1_TOTAL_AMT, System.Round( dTotalAmount, arr_FormatNumber[G1_TOTAL_AMT] )) ;                  
        }		 
        else if ( col == G1_PO_AMT || col == G1_VAT_RATE )
        {
            dVATAmount   = Number(grdDetail.GetGridData( row, G1_PO_AMT )) * Number(grdDetail.GetGridData( row, G1_VAT_RATE )) / 100 ;                   
			grdDetail.SetGridText( row, G1_VAT_AMT, System.Round( dVATAmount, arr_FormatNumber[G1_VAT_AMT] )) ;
            
            dTotalAmount = Number(grdDetail.GetGridData( row, G1_PO_AMT )) + Number(grdDetail.GetGridData( row, G1_VAT_AMT )) + Number(grdDetail.GetGridData( row, G1_OTHERS_EXP));
            grdDetail.SetGridText( row, G1_TOTAL_AMT, System.Round( dTotalAmount, arr_FormatNumber[G1_TOTAL_AMT] )) ;         
        }
        else if ( col == G1_VAT_AMT || col == G1_OTHERS_EXP )
        {
            dTotalAmount = Number(grdDetail.GetGridData( row, G1_PO_AMT )) + Number(grdDetail.GetGridData( row, G1_VAT_AMT )) + Number(grdDetail.GetGridData( row, G1_OTHERS_EXP));
            grdDetail.SetGridText( row, G1_TOTAL_AMT, System.Round( dTotalAmount, arr_FormatNumber[G1_TOTAL_AMT] )) ;     
        }        
        //--------------   
        TotalAmount();
    }    	
}
//======================================================================

function CheckInput()
{       
    InputProcess(  event.col, event.row  );
}
//====================================================

function TotalAmount()
{ 
    //---------CALCULATE AMOUNT---------------- 
    var sumDisAmount = 0 , sumPOAmount = 0 , sumVATAmount = 0 , sumOthExpense = 0 , sumTotalAmount = 0;

    for (var i=1; i<grdDetail.rows; i++ )
    {
		sumDisAmount   = sumDisAmount   + Number(grdDetail.GetGridData( i, G1_DISCOUNT_AMT ));
        sumPOAmount    = sumPOAmount    + Number(grdDetail.GetGridData( i, G1_PO_AMT       ));
        sumVATAmount   = sumVATAmount   + Number(grdDetail.GetGridData( i, G1_VAT_AMT      ));
		sumOthExpense  = sumOthExpense  + Number(grdDetail.GetGridData( i, G1_OTHERS_EXP   ));
        sumTotalAmount = sumTotalAmount + Number(grdDetail.GetGridData( i, G1_TOTAL_AMT    ));
    }
  
	txtDisAmount.text   = System.Round( sumDisAmount,   txtForOthers.text     ) + "";
    txtPOAmount.text    = System.Round( sumPOAmount,    txtForItemAmount.text ) + "";
    txtVATAmount.text   = System.Round( sumVATAmount,   txtForTaxAmount.text  ) + "";
	txtOthExpense.text  = System.Round( sumOthExpense,  txtForOthers.text     ) + "";
    txtTotalAmount.text = System.Round( sumTotalAmount, txtForTotalAmt.text   ) + "";
} 

//===================================================================================================
function OnReport(para)
{
    switch(para)
    {
        
        case '1':
             var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00112.aspx?p_po_pk="+txtMasterPK.text; 
             System.OpenTargetPage(url);            
        break;                   
		
		case '3':             
             var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00110_dorco.aspx?p_po_pk="+txtMasterPK.text; 
             System.OpenTargetPage(url);            
        break;    
        
        case '4':             
             var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00114.aspx?p_po_pk="+txtMasterPK.text; 
             System.OpenTargetPage(url);            
        break; 
				
		case '5':             
             var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00110_samil.aspx?p_po_pk="+txtMasterPK.text; 
             System.OpenTargetPage(url);            
        break;   		   
        
        case '6':
             var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00110_SW.aspx?p_po_pk="+txtMasterPK.text; 
             System.OpenTargetPage(url);         
        break;
        
        case '7':
             var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00115.aspx?p_po_pk="+txtMasterPK.text; 
             System.OpenTargetPage(url);         
        break; 

		case '8':
             var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00116.aspx?p_po_pk="+txtMasterPK.text; 
             System.OpenTargetPage(url);         
        break; 	

		case '9':
             var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00117.aspx?p_po_pk="+txtMasterPK.text; 
             System.OpenTargetPage(url);         
        break;

        case '10':
             var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00110_during.aspx?p_po_pk="+txtMasterPK.text; 
             System.OpenTargetPage(url);         
        break;

		case 'DUR02':
             var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00110_DUR02.aspx?p_po_pk="+txtMasterPK.text; 
             System.OpenTargetPage(url);         
        break;		

		case '11':
             var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00111_during.aspx?p_po_pk="+txtMasterPK.text; 
             System.OpenTargetPage(url);         
        break;	

		case '12':
             var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00112_during.aspx?p_po_pk="+txtMasterPK.text; 
             System.OpenTargetPage(url);         
        break;	

		case 'YJ01':
             var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00110_YJ01.aspx?p_po_po_m_pk="+txtMasterPK.text; 
             System.OpenTargetPage(url);  

		 break;  	 
        case 'YJ02':
              var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00112_YJ01.aspx?p_po_po_m_pk="+txtMasterPK.text; 
             System.OpenTargetPage(url);               
        break; 
                                  
		case 'ST01':
            var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00110_ST01.aspx?p_po_m_pk="+txtMasterPK.text; 
            System.OpenTargetPage(url);                  
        break;  		
		
		case 'ST02':
             var p_po_pk = "";
             var p_comma = "";
             for(var i = 0; i < grdSearch.rows; i++)
             {
                if(grdSearch.GetGridControl().isSelected(i) == true)
                {
                    p_po_pk += p_comma + grdSearch.GetGridData( i, 0);
                    p_comma = ",";
                }
             }
             var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00110_ST02.aspx?p_po_pk="+p_po_pk; 
             System.OpenTargetPage(url);            
        break;  
		
		case 'ST03':
            var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00110_ST03.aspx?p_po_m_pk="+txtMasterPK.text; 
            System.OpenTargetPage(url);                  
        break;

		case '0':
             var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00111.aspx?p_po_pk="+txtMasterPK.text; 
             System.OpenTargetPage(url);             
        break; 		
    }
}
 
//====================================================================
function OnChangeTab()
{ 
    var info     = document.all("info"); 
    var shipment = document.all("shipment"); 
    var payment  = document.all("payment");
    
    switch (radTab.value)
    {
        case '1':
            info.style.display     = "";
            shipment.style.display = "none"; 
            payment.style.display  = "none";           
        break;
        
        case '2' :
            info.style.display     = "none";
            shipment.style.display = "";
            payment.style.display  = "none"; 
        break;
        
        case '3' :
            info.style.display     = "none";
            shipment.style.display = "none";
            payment.style.display  = ""; 
        break;        
    }
} 

var arr_data = new Array();
var cur_row = 0;
var r_index = 0;
//======================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Submit' :             
            if ( confirm('Do you want to submit this P/O ?'))
            {
                pro_epbp00110.Call();
            }                         
        break;
               
        case 'Income' :
            if ( confirm('Do you want to make Stock Income for this PO ?'))
            {        
                pro_epbp00110_3.Call();
            }    
        break;
        
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
	                   arrTemp[arrTemp.length] = grdDetail.GetGridData(i,G1_PO_ITEM_PK);
	                   arrTemp[arrTemp.length] = grdDetail.GetGridData(i,G1_PO_UOM);
	                   arrTemp[arrTemp.length] = i;
					   
	                   arr_data[arr_data.length] = arrTemp;
	               }
	            }
	            
	            if ( arr_data.length > 0 )
	            {
	                txtPO_ITEM_PK.text = arr_data[0][0];
	                txtUOM.text        = arr_data[0][1];
	                cur_row            = arr_data[0][2];
					
	                pro_epbp00110_1.Call();
	            }
			}	
        break;
		
		case 'Grouping' :
			if ( confirm('Do you want to grouping Item ?') )
            {
				pro_epbp00110_4.Call();
			}		
		break;
		
		case 'CAL-AMOUNT':
			if ( confirm('Do you want to auto calculate Amount ?') )
            {
				for ( var i=1; i < grdDetail.rows; i++ )
				{			 					 
					InputProcess( G1_UPRICE, i );			 
				}
			}
		break;
		
		case 'DVD_DISCOUNT_AMT':
			if ( confirm('Do you want to divide Discount Amount ?') )
            {
				var sumDisAmount = 0 , sumPOAmount = 0 , sumRemainAmount = 0 , divide_amt = 0 ;
				
				sumDisAmount    = Number(txtDisAmount.text);
				sumRemainAmount = Number(txtDisAmount.text);
				
				for ( var i=1; i < grdDetail.rows; i++ )
				{			 					 
					sumPOAmount = sumPOAmount + Number(grdDetail.GetGridData( i, G1_PO_AMT )); 	 
				}
				//----------------------
				if ( Number(sumPOAmount) != 0 )  
				{
					divide_amt = Number(sumDisAmount) / Number(sumPOAmount);
				}
				else
				{
					divide_amt = Number(sumDisAmount);
				}
				//----------------------
				for ( var i=1; i < grdDetail.rows; i++ )
				{	
					if ( sumRemainAmount > 0 )
					{
						if ( Number(sumRemainAmount) > System.Round(Number(divide_amt)*Number(grdDetail.GetGridData( i, G1_PO_AMT )), arr_FormatNumber[G1_DISCOUNT_AMT]) )
						{										 
							grdDetail.SetGridText( i, G1_DISCOUNT_AMT, System.Round(Number(divide_amt)*Number(grdDetail.GetGridData( i, G1_PO_AMT )), arr_FormatNumber[G1_DISCOUNT_AMT])) ;					 					
						}
						else					
						{
							grdDetail.SetGridText( i, G1_DISCOUNT_AMT, System.Round( sumRemainAmount, arr_FormatNumber[G1_DISCOUNT_AMT] )) ;	
						}
					
						InputProcess( G1_DISCOUNT_AMT, i );	
					
						sumRemainAmount = Number(sumRemainAmount) - Number(grdDetail.GetGridData( i, G1_DISCOUNT_AMT ));
					}	
				}
			}
		break;
		
		case 'DVD_OTHERS_EXPENSE':
			if ( confirm('Do you want to divide Others Expense ?') )
            {
				var sumOthExpense = 0 , sumPOAmount = 0 , sumRemainAmount = 0 , divide_amt = 0 ;
				
				sumOthExpense   = Number(txtOthExpense.text);
				sumRemainAmount = Number(txtOthExpense.text);
				
				for ( var i=1; i < grdDetail.rows; i++ )
				{			 					 
					sumPOAmount = sumPOAmount + Number(grdDetail.GetGridData( i, G1_PO_AMT )); 	 
				}
				//----------------------
				if ( Number(sumPOAmount) != 0 )  
				{
					divide_amt = Number(sumOthExpense) / Number(sumPOAmount);
				}
				else
				{
					divide_amt = Number(sumOthExpense);
				}
				//----------------------
				for ( var i=1; i < grdDetail.rows; i++ )
				{	
					if ( sumRemainAmount > 0 )
					{
						if ( Number(sumRemainAmount) > System.Round(Number(divide_amt)*Number(grdDetail.GetGridData( i, G1_PO_AMT )), arr_FormatNumber[G1_OTHERS_EXP]) )
						{										 
							grdDetail.SetGridText( i, G1_OTHERS_EXP, System.Round(Number(divide_amt)*Number(grdDetail.GetGridData( i, G1_PO_AMT )), arr_FormatNumber[G1_OTHERS_EXP]) ) ;					 					
						}
						else					
						{
							grdDetail.SetGridText( i, G1_OTHERS_EXP, System.Round( sumRemainAmount, arr_FormatNumber[G1_OTHERS_EXP] )) ;	
						}
					
						InputProcess( G1_OTHERS_EXP, i );	
					
						sumRemainAmount = Number(sumRemainAmount) - Number(grdDetail.GetGridData( i, G1_OTHERS_EXP ));
					}	
				}
			}
		break;
		
    }
}
//======================================================================
function OnToggleGrid()
{
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";

		grdDetail.GetGridControl().ColHidden(G1_REQ_ITEM_CD) = true ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_ITEM_NM) = true ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_QTY)     = true ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_UOM)     = true ;
		grdDetail.GetGridControl().ColHidden(G1_ETD_TO)      = true ;
		grdDetail.GetGridControl().ColHidden(G1_ETA_TO)      = true ;
		
		grdDetail.GetGridControl().ColHidden(G1_ATT01)      = true ;
		grdDetail.GetGridControl().ColHidden(G1_ATT02)      = true ;
		grdDetail.GetGridControl().ColHidden(G1_ATT03)      = true ;
		
		grdDetail.GetGridControl().ColHidden(G1_DISCOUNT_AMT) = true ;
		grdDetail.GetGridControl().ColHidden(G1_OTHERS_EXP)   = true ;
		
        imgMaster.src = "../../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";
		
    }
    else
    {
        imgMaster.status = "expand";
        
		grdDetail.GetGridControl().ColHidden(G1_REQ_ITEM_CD) = false;
		grdDetail.GetGridControl().ColHidden(G1_REQ_ITEM_NM) = false ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_QTY)     = false ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_UOM)     = false ;
		grdDetail.GetGridControl().ColHidden(G1_ETD_TO)      = false ;
		grdDetail.GetGridControl().ColHidden(G1_ETA_TO)      = false ;	

		grdDetail.GetGridControl().ColHidden(G1_ATT01)      = false ;
		grdDetail.GetGridControl().ColHidden(G1_ATT02)      = false ;
		grdDetail.GetGridControl().ColHidden(G1_ATT03)      = false ;
		
		grdDetail.GetGridControl().ColHidden(G1_DISCOUNT_AMT) = false ;
		grdDetail.GetGridControl().ColHidden(G1_OTHERS_EXP)   = false ;		
		
        imgMaster.src = "../../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}
//==========================================================================
function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdDetail" :
            
                var event_col = event.col ;
                var event_row = event.row ;

                 if ( event_col == G1_PO_UOM || event_col == G1_REQ_UOM )
                 {
                       var path = System.RootURL + '/standard/forms/fp/ab/fpab00640.aspx?p_item_pk=' + grdDetail.GetGridData( event_row, G1_PO_ITEM_PK ) + '&p_uom=' + grdDetail.GetGridData( event_row, G1_PO_UOM );
	                   var obj = System.OpenModal( path ,400 , 300, 'resizable:yes;status:yes');
    	               
	                   if ( obj != null )
	                   {
	                        grdDetail.SetGridText( event_row, event_col, obj[0]);
	                   }	
                 }
                 else if ( event_col == G1_PO_ITEM_CD || event_col == G1_PO_ITEM_NM )
                 {
                       var path = System.RootURL + '/standard/forms/fp/ab/fpab00110.aspx?group_type=|Y|||Y|Y';
                       var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                       
                       if ( object != null )
                       {
                            grdDetail.SetGridText( event_row, G1_PO_ITEM_PK,   object[0] );
                            grdDetail.SetGridText( event_row, G1_PO_ITEM_CD, object[1] );
                            grdDetail.SetGridText( event_row, G1_PO_ITEM_NM, object[2] );
                       }                       
                 }
            break;             
      }         
}   
 //===================================================================================
function OnCopy()
{
    if(txtMasterPK.text=="")
    {
        alert("Please select one PO to copy !!!");
    }
    else
    {
        pro_epbp00110_2.Call();
    }
}
//====================================================================================
function addCommas(nStr)
{
	nStr += '';
	x = nStr.split('.');
	x1 = x[0];
	x2 = x.length > 1 ? '.' + x[1] : '';
	var rgx = /(\d+)(\d{3})/;
	while (rgx.test(x1))
	{
		x1 = x1.replace(rgx, '$1' + ',' + '$2');
	}
	return x1 + x2;
}
//====================================================================================

</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00220_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_fpab00220_2" > 
                <input> 
                    <input bind="txtLGGroupCodeID" />
                </input>
	           <output>
	                <output bind="txtLGCodeList" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------->
    <gw:data id="data_sel_epbp00110_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28" function="st_lg_sel_epbp00110_3"> 
                <inout> 

	                 <inout bind="txtMasterPK" />
			
                     <inout  bind="txtRemark" />
                     
                     <inout  bind="txtSupplierPK" />
                     <inout  bind="txtSupplierName" />
                     
                     <inout  bind="txtBillToPK" />
                     <inout  bind="txtBillToName" />
                                           
                     <inout  bind="lstCurrency" />         
                   
                     <inout  bind="txtDeliverPK" /> 
                     <inout  bind="txtDeliverName" />                      
                    
					
                     <inout  bind="txtSaleRep" />
                     
                     <inout  bind="txtShipToPK" /> 
                     <inout  bind="txtShipToName" /> 
					 
					 
                    
                     <inout  bind="txtBuyRep" /> 
                  
                     <inout  bind="lstDeliType" />
                                  
                     <inout  bind="txtPLPK" /> 
                     <inout  bind="txtPLCode" />                      
                     <inout  bind="txtPLName" />
					 
                     <inout  bind="lstPOType" />                       
                     <inout  bind="lstPaymentTerm" />
                     <inout  bind="lstPriceType" />
                     <inout  bind="txtExRate" />
                     <inout  bind="lstPaymentMethod" />    
                     <inout  bind="txtContractNo" />   
                    
                     <inout bind="txtForPOQTy" />  
                     <inout bind="txtForPOPrice" /> 
                     <inout bind="txtForItemAmount" /> 
                     
                     <inout bind="txtForItemRate" /> 
                     <inout bind="txtForTaxAmount" /> 
                     <inout bind="txtForOthers" /> 
                     <inout bind="txtForTotalAmt" /> 
                     <inout bind="txtForReqQTy" />  
                     
                     <inout bind="txtMaskPOQTy" />  
                     <inout bind="txtMaskPOPrice" /> 
                     <inout bind="txtMaskPOAmount" /> 
                     
                     <inout bind="txtMaskItemRate" /> 
                     <inout bind="txtMaskTaxAmount" /> 
                     <inout bind="txtMaskOthers" /> 
                     <inout bind="txtMaskTotalAmt" /> 
                     <inout bind="txtMaskReqQty" /> 
					                      
                     <inout bind="chkAutoCal" /> 
                              
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00110" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso id="1" type="grid"  function="st_lg_sel_epbp00110" >
                <input  bind="grdSearch">
					<input bind="cboSearchCompany" />
					<input bind="cboSearchDept" />
					<input bind="dtFrom" />
                    <input bind="dtTo" />
					<input bind="txtPartnerSearch" />
                    <input bind="txtPONoSearch" />					                    
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00110_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46" function="st_lg_sel_epbp00110_1" procedure="st_lg_upd_epbp00110_1">
                <input>                         
                    <inout bind="txtMasterPK" />
                    <inout bind="txtPONo" />
                    <inout bind="dtPODate" />
                    <tnout bind="lblStatus" />
                    <inout bind="txtStaffPK" />
					
                    <inout bind="txtStaffName" />  
                    <inout bind="txtRefTablePK" />
                    <inout bind="txtRefNo" />
                    <inout bind="lstReportType" /> 
                    <inout bind="txtRemark" /> 
					
                    <inout bind="txtSupplierPK" /> 
                    <inout bind="txtSupplierName" />
                    <inout bind="txtBillToPK" />
                    <inout bind="txtBillToName" />                  
                    <inout bind="lstCurrency" />   
					                 
                    <inout bind="lstExNation" />					
					<inout bind="txtDisAmount" />
                    <inout bind="txtPOAmount" />   
                    <inout bind="txtVATAmount" />
					<inout bind="txtOthExpense" />					
					
                    <inout bind="txtTotalAmount" />					
                    <inout bind="dtETDFrom" />					
                    <inout bind="dtETDTo" />  
                    <inout bind="dtETAFrom" />
                    <inout bind="dtETATo" />  
					
                    <inout bind="txtDeliverPK" />
                    <inout bind="txtDeliverName" /> 					                                     
                    <inout bind="txtBuyRep" />
                    <inout bind="txtShipToPK" />
                    <inout bind="txtShipToName" />  
					
                    <inout bind="txtSaleRep" />                                   
                    <inout bind="txtPLPK" />					
                    <inout bind="txtPLCode" />
                    <inout bind="txtPLName" />                                                                                                      
                    <inout bind="txtContractNo" />   
					
                    <inout bind="lstPaymentMethod" />
                    <inout bind="lstPaymentTerm" />					
                    <inout bind="lstPriceType" />  
                    <inout bind="txtExRate" />
                    <inout bind="lstPOType" />
					
                    <inout bind="lstDeliType" />
                    <inout bind="lstDept" />					
					<inout bind="txtTaxRate" />					
					<inout bind="dtContractDate" />
					<inout bind="txtDocNo" />
					
					<inout bind="dtDocDate" />					
					<inout bind="cboCompany" />					
                </input>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00110_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="4" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34" function="st_lg_sel_epbp00110_2" procedure="st_lg_upd_epbp00110_2"> 
                <input bind="grdDetail">
                    <input bind="txtMasterPK" /> 
					<input bind="txtLang" />              
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_epbp00110" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00110" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="pro_epbp00110_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00110_2" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="pro_epbp00110_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00110_3" > 
                <input>
                    <input bind="txtMasterPK" /> 
                    <input bind="txtEmpPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="pro_epbp00110_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00110_4" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>	 
    <!--------------------------------------------------------------------------->
    <gw:data id="pro_epbp00110_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00110_1" > 
                <input>
                    <input bind="txtSupplierPK" /> 
                    <input bind="txtPO_ITEM_PK" />
                    <input bind="txtUOM" />
                </input> 
                <output>
                    <output bind="txtUPRICE" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------>
    <gw:data id="data_epbp00110_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_epbp00110_4" > 
                <input> 
                    <input bind="txtUserPK" />
                </input>
	           <output>
	                <output bind="txtReturnValue" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>	
	<!------------------------------------------------------------------>
    <gw:data id="data_epbp00110_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_epbp00110_5" > 
                <input> 
					<input bind="cboCompany" />
                    <input bind="txtUserPK" />
                </input>
	           <output>
	                <output bind="txtReturnValue" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>	 	
    <!--------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 25%">
                <table style="width: 100%; height: 100%">
					<tr style="height: 2%">
                        <td style="width: 10%" align="right">
                            Company
                        </td>
                        <td style="width: 89%; white-space: nowrap" colspan=2 >
                            <gw:list id="cboSearchCompany" styles="width:100%" onchange="data_epbp00110_5.Call()" />
                        </td>                        
                    </tr>
					<tr style="height: 2%">
                        <td style="width: 10%" align="right">
                            Dept
                        </td>
                        <td style="width: 89%; white-space: nowrap" colspan=2 >
                            <gw:list id="cboSearchDept" styles="width:100%" />
                        </td>                        
                    </tr>
                    <tr style="height: 2%">
                        <td style="width: 10%" align="right">
                            Date
                        </td>
                        <td style="width: 89%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~
                            <gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td style="width: 10%" align="right">
                            Supplier
                        </td>
                        <td style="width: 89%; white-space: nowrap">
                            <gw:textbox id="txtPartnerSearch" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                        <td style="width: 1%">
                        </td>
                    </tr>
                    <tr style="height: 2%" align="right">
                        <td style="width: 10%; white-space: nowrap">
                            P/O No.
                        </td>
                        <td colspan="1">
                            <gw:textbox id="txtPONoSearch" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                        <td>
                           
                        </td>
                    </tr>
                   
                    <tr>
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|P/O Date|Status|P/O - Ref No|Supplier" format="0|4|0|0|0"
                                aligns="1|1|1|0|0" defaults="||||" editcol="0|0|0|0|0" widths="0|1200|1200|2000|3000"
                                styles="width:100%; height:100%" sorting="T" oncellclick="OnSearch('grdMaster')"
                                param="0,1,2,3" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 75%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width: 5%">
                            <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                style="cursor: hand" onclick="OnToggle()" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            P/O No
                        </td>
                        <td style="width: 35%">
                            <gw:textbox id="txtPONo" styles="width: 100%" csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            P/O Date
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtPODate" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td style="width: 20%" align="center" colspan="5">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="idBtnSubmit" img="submit" text="Submit" onclick="OnProcess('Submit')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnNewMST" img="new" alt="New" onclick="OnAddNew('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnDeleteMST" img="delete" alt="Delete" onclick="OnDelete('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSaveMST" img="save" alt="Save" onclick="OnSave('Master')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%" colspan="2">
                            <a onclick="OnPopUp('Charger')" href="#tips"  class="eco_link" class="eco_link" >Charger</a>
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtStaffName" styles="width:100%" />
                            <gw:textbox id="txtStaffPK" styles="display:none" />
                        </td>
                        <td align="right" style="width: 10%">
                            Company
                        </td>
                        <td style="width: 25%" colspan="11">
                            <gw:list id="cboCompany" styles="width:100%" onchange="data_epbp00110_5.Call()" />
                        </td>
						 
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 1%" valign="middle" align="left">
                        </td>
                        <td colspan="5">
                            <gw:radio id="radTab" value="1" styles="width:100%" onchange="OnChangeTab()"> 
                                <span value="1" id="1">P/O Info</span> 
                                <span value="2" id="2">Delivery</span>
                                <span value="3" id="3">Payment</span>
                            </gw:radio>
                        </td>
                        <td>
                        </td>                        
                        <td colspan="5" align="right" style="white-space: nowrap">
                            <gw:list id="lstReportType" styles='width:100%;display:none' csstype="mandatory" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnPOSheet2" img="excel" alt="PO Sheet" onclick="OnPopUp('Report')" />
                        </td>
						<td style="width: 1%">						 
                            <gw:button id="btnFileAttachList" img="attach" alt="List File Attach" onclick="OnPopUp('FileAttachList')" />                    
                        </td>
                    </tr>
                    <tr style="height: 1%" id="info">
                        <td colspan="14">
                            <table style="height: 100%; width: 100%; background-color: #CCFFFF" border="0">
                                <tr style="height: 1%">
                                    <td colspan="7">
                                        <table style="width: 100%; height: 100%">
                                            <tr>
                                                <td align="right" style="width: 5%; white-space: nowrap">
                                                    <a title="Supplier" onclick="OnPopUp('Supplier')" href="#tips" style="color: #0000ff">
                                                        Supplier</a>
                                                </td>
                                                <td style="width: 45%">
                                                    <gw:textbox id="txtSupplierName" styles="width:100%;" onenterkey="" />
                                                    <gw:textbox id="txtSupplierPK" styles="display:none" />
                                                </td>
                                                <td align="right" style="width: 5%; white-space: nowrap">
                                                    <a onclick="OnPopUp('Bill_To')" href="#tips" style="color: #0000ff">Bill to</a>
                                                </td>
                                                <td style="width: 45%">
                                                    <gw:textbox id="txtBillToName" styles="width:100%;" />
                                                    <gw:textbox id="txtBillToPK" styles="display:none" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <a title="SO Master" onclick="OnPopUp('PO')" href="#tips" style="color: #0000ff">Ref
                                            No</a>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtRefNo" styles="width: 100%" />
                                        <gw:textbox id="txtRefTablePK" styles="width: 100%;display: none" />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Ex-Rate
                                    </td>
                                    <td style="width: 15%">
                                        <gw:list id="lstCurrency" styles="width:100%;" />
                                    </td>
                                    <td style="width: 15%">
                                        <gw:textbox id="txtExRate" type="number" format="#,###,###,###,###.##R" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Dis Amt
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtDisAmount" type="number" format="#,###,###,###,###.###R" styles="width:100%;" onenterkey="OnProcess('DVD_DISCOUNT_AMT')"  />
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        <a title="Dept" onclick="OnPopUp('Dept')" style="color: #0000ff; cursor: hand">
                                            Dept</a>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstDept" styles='width:100%;' />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Tax Rate
                                    </td>
                                    <td style="width: 30%" colspan="2">
                                        <gw:textbox id="txtTaxRate" type="number" format="#,###,###,###,###.###R" styles="width:100%;"
                                            onenterkey="SetTaxRate()" />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        P/O Amt
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtPOAmount" type="number" format="#,###,###,###,###.###R" styles="width:100%;" />
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td align="right" style="width: 5%; white-space: nowrap">
										Remark
                                    </td>
                                    <td style="width: 25%" colspan="4" rowspan="3" >
										 
										<gw:textarea id="txtRemark" styles='width:100%;height:95%' />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Tax Amt
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtVATAmount" type="number" format="#,###,###,###,###.###R" styles="width:100%;" />
                                    </td>
                                </tr>
								
								<tr style="height: 1%">
                                    <td align="right" style="width: 5%; white-space: nowrap">
										 
                                    </td>
                                    
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Oth Exp
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtOthExpense" type="number" format="#,###,###,###,###.###R" styles="width:100%;" onenterkey="OnProcess('DVD_OTHERS_EXPENSE')" />
                                    </td>
                                </tr>
								
								<tr style="height: 1%">
                                    <td align="right" style="width: 5%; white-space: nowrap">
										 
                                    </td>
                                    
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Total Amt
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtTotalAmount" type="number" format="#,###,###,###,###.###R" styles="width:100%;" />
                                    </td>
                                </tr>
								
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%" id="shipment">
                        <td colspan="14">
                            <table style="height: 100%; width: 100%; background-color: #CCFFFF" border="0">
                                <tr style="height: 1%">
                                    <td align="right" style="width: 5%">
                                        <a title="Deliver" onclick="OnPopUp('Deliver')" href="#tips" style="color: #0000ff">
                                            Deliver</a>
                                    </td>
                                    <td style="width: 65%" colspan="3">
                                        <gw:textbox id="txtDeliverName" styles="width:100%;" onenterkey="" />
                                        <gw:textbox id="txtDeliverPK" styles="display=none" />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Sale Rep
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtSaleRep" styles="width:100%;" />
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td align="right" style="width: 5%">
                                        <a title="Ship To" onclick="OnPopUp('Ship_To')" href="#tips" style="color: #0000ff">
                                            Ship to</a>
                                    </td>
                                    <td style="width: 65%" colspan="3">
                                        <gw:textbox id="txtShipToName" styles="width:100%;" onenterkey="" />
                                        <gw:textbox id="txtShipToPK" styles="display=none" />
                                    </td>
                                    <td align="right" style="width: 5%">
                                        Buy Rep
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtBuyRep" styles="width:100%;" />
                                    </td>
                                </tr>
								<tr>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnPopUp('Ex_Nation')">Ex Nation</b>
                                    </td>
                                    <td style="width: 30%; white-space: nowrap">
                                        <gw:list id="lstExNation" styles='width:100%' onchange="" />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="right">
                                        <a onclick="OnPopUp('DeliType')" href="#tips" style="color: #0000ff">Deli Type</a>
                                    </td>
                                    <td style="width: 30%; white-space: nowrap">
                                        <gw:list id="lstDeliType" styles="width:100%;" /> 
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                         
                                    </td>
                                    <td style="width: 25%">
                                         
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        ETD
                                    </td>
                                    <td style="width: 30%; white-space: nowrap">
                                        <gw:datebox id="dtETDFrom" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                                        ~
                                        <gw:datebox id="dtETDTo" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        ETA
                                    </td>
                                    <td style="width: 30%; white-space: nowrap">
                                        <gw:datebox id="dtETAFrom" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                                        ~
                                        <gw:datebox id="dtETATo" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        
                                    </td>
                                    <td style="width: 25%">
                                        
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%" id="payment">
                        <td colspan="14">
                            <table style="height: 100%; width: 100%; background-color: #CCFFFF" border="0">
                                <tr style="height: 1%">
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        <a title="PLCenter" onclick="OnPopUp('PLCenter')" style="color: #0000ff; cursor: hand">
                                            P/L</a>
                                    </td>
                                    <td colspan="3" style="white-space: nowrap">
                                        <gw:textbox id="txtPLPK" styles="display: none" />
                                        <gw:textbox id="txtPLCode" styles="width: 30%" />
                                        <gw:textbox id="txtPLName" styles="width: 70%" />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap;">
                                        Contract
                                    </td>
                                    <td style="width: 15%">
                                        <gw:textbox id="txtContractNo" styles="width: 100%" />
                                    </td>
                                    <td style="width: 10%; white-space: nowrap">
                                        <gw:datebox id="dtContractDate" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        <a onclick="OnPopUp('POType')" href="#tips" style="color: #0000ff">P/O Type</a>
                                    </td>
                                    <td style="width: 30%">
                                        <gw:list id="lstPOType" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        <a onclick="OnPopUp('PaymentTerms')" href="#tips" style="color: #0000ff">Pay Term</a>
                                    </td>
                                    <td style="width: 30%">
                                        <gw:list id="lstPaymentTerm" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Doc No
                                    </td>
                                    <td style="width: 15%">
                                        <gw:textbox id="txtDocNo" styles="width: 100%" />
                                    </td>
                                    <td style="width: 10%; white-space: nowrap">
                                        <gw:datebox id="dtDocDate" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        <a onclick="OnPopUp('PriceType')" href="#tips" style="color: #0000ff">Price Type</a>
                                    </td>
                                    <td style="width: 30%">
                                        <gw:list id="lstPriceType" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        <a onclick="OnPopUp('PaymentMethod')" href="#tips" style="color: #0000ff">Pay Method</a>
                                    </td>
                                    <td style="width: 30%">
                                        <gw:list id="lstPaymentMethod" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 5%">
                                    </td>
                                    <td style="width: 25%" conspan="2">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
					<tr  style="height: 96%">
						<td colspan="14" valign="top">
							<div style="width:100%;height:100%" class="eco_line">
								<table style="width:100%;border:0;height:100%;" cellpadding="0" cellspacing="0" border="0">
									<tr style="padding-bottom:2px;padding:2 5 1 5" class="eco_bg">
										
										<td>&nbsp;</td>
										<td align="right">
											<table style="height:100%">
												<tr>
													<td style="width: 10%">
														<img status="expand" id="imgMaster" alt="Show all column" src="../../../../system/images/close_popup.gif"
															style="cursor: hand" onclick="OnToggleGrid()" />
													<td align="center" style="width: 23%; white-space: nowrap">
														<gw:checkbox id="chkAutoCal" onchange="" defaultvalue="Y|N" value="Y" />
														Auto Cal
													</td>
													<td>
														<gw:button id="idGetFreeItem" img="item" text="ITEM" alt="Free Item" onclick="OnAddNew('FreeItem')" />
													</td>
													<td>
														<gw:button id="btnNewD" img="new" alt="New" text="New" onclick="OnAddNew('DETAIL')" />
													</td>
													<td >
														<gw:button id="btnDeleteDTL" img="delete" alt="Delete" onclick="OnDelete('Detail')" />
													</td>
													<td >
														<gw:button id="btnGroupItem" img="process" styles='display:none' alt="Group Item" onclick="OnProcess('GroupItem')" />
													</td>		
												</tr>
											</table>
										</td>
									</tr>
									<tr style="height:96%;">
										<td colspan="3" valign="top" class="eco_line_t">
											<gw:grid id='grdDetail' 
											header='_PK|Seq|Ref No|_Req_Item_PK|Req Item Code|Req Item Name|_PO_ITEM_PK|P/O Item Code|P/O Item Name|Req Qty|UOM|P/O Qty|UOM|U/Price|Dis Amt|P/O Amt|VAT(%)|VAT Amt|Others Exp|Total Amt|ETD From|ETD To|ETA From|ETA To|Stock Qty|Expect Qty|Dept|Att01|Att02|Att03|Remark|_PO_MR_D_PK|_PARENT_PK|_QUO_PK|_PO_PO_M_PK'
											format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|4|4|4|0|0|0|0|0|0|0|0|0|0|0' 
											aligns='0|1|0|0|0|0|0|0|0|3|1|3|1|3|3|3|3|3|3|3|1|1|1|1|3|3|0|0|0|0|0|0|0|0|0'
											check='||||||||||||||||||||||||||||||||||' 
											editcol='0|1|1|0|0|0|0|0|0|1|0|1|0|1|1|1|1|1|1|1|1|1|1|1|0|0|0|1|1|1| 1|0|0|0|0'
											widths='0|800|1200|0|2000|2500|0|2000|2500|1500|800|1300|800|1300|1500|1500|1200|1500|1500|1500|1200|1200|1200|1200|1300|1300|1500|1000|1000|1000|1000|0|0|0|0'
											sorting='T' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)"
											acceptnulldate='T' styles='width:100%; height:100%' />
										</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
    <gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
	<gw:textbox id="txtUserPK" styles="width: 100%;display: none" />
	
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtLGCodeList" styles='display:none;width:100%' />
    <gw:textbox id="txtLGGroupCodeID" styles='display:none;width:100%' />
    <gw:textbox id="txtForPOQTy" styles='display:none;width:100%' />
    <gw:textbox id="txtForReqQTy" styles='display:none;width:100%' />
    <gw:textbox id="txtForPOPrice" styles='display:none;width:100%' />
    <gw:textbox id="txtForItemAmount" styles='display:none;width:100%' />
    <gw:textbox id="txtForItemRate" styles='display:none;width:100%' />
    <gw:textbox id="txtForTaxAmount" styles='display:none;width:100%' />
    <gw:textbox id="txtForOthers" styles='display:none;width:100%' />
    <gw:textbox id="txtForTotalAmt" styles='display:none;width:100%' />
    <gw:textbox id="txtMaskPOQTy" styles='display:none;width:100%' />
    <gw:textbox id="txtMaskReqQty" styles='display:none;width:100%' />
    <gw:textbox id="txtMaskPOPrice" styles='display:none;width:100%' />
    <gw:textbox id="txtMaskPOAmount" styles='display:none;width:100%' />
    <gw:textbox id="txtMaskItemRate" styles='display:none;width:100%' />
    <gw:textbox id="txtMaskTaxAmount" styles='display:none;width:100%' />
    <gw:textbox id="txtMaskOthers" styles='display:none;width:100%' />
    <gw:textbox id="txtMaskTotalAmt" styles='display:none;width:100%' />
    <!---------------------------------------------------------------------------> 
    <gw:textbox id="txtUPRICE" styles='display:none;width:100%' />
    <gw:textbox id="txtPO_ITEM_PK" styles='display:none;width:100%' />
    <gw:textbox id="txtUOM" styles='display:none;width:100%' />
    <gw:textbox id="txtCount" type="number" format="#,###,###,###,###.###R" styles='display:none;width:100%' />
    <gw:textbox id="txtLang" styles='display:none;width:100%' />
	
	 <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="N" onchange="OnSearch('grdSearch')" />
	<!--------------------------------------------------------------------------->
</body>
</html>
