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
                 
var G1_REV_PO_D_PK  = 0,
    G1_REV_PO_M_PK 	= 1,
    G1_PO_D_PK   	= 2,  
    G1_Seq       	= 3, 
    G1_REQ_ITEM_PK  = 4,
    G1_REQ_ITEM_CD  = 5,
    G1_REQ_ITEM_NM  = 6,
    G1_PO_ITEM_PK   = 7,
    G1_PO_ITEM_CD   = 8,  
    G1_PO_ITEM_NM   = 9,     
    G1_REQ_QTY      = 10,
    G1_REQ_UOM      = 11,
	G1_PO_QTY       = 12,
    G1_PO_UOM       = 13,
    G1_UPRICE       = 14,
    G1_PO_AMT       = 15,
    G1_VAT_RATE     = 16,
    G1_VAT_AMT      = 17,
    G1_OTHERS_EXP   = 18,
    G1_TOTAL_AMT    = 19,
    G1_ETD_FROM     = 20,
    G1_ETD_TO       = 21,
    G1_ETA_FROM     = 22,
    G1_ETA_TO       = 23,
    G1_Ref_No       = 24,
    G1_NULL_02      = 25,
    G1_Remark       = 26,
    G1_PR_D_PK      = 27,
    G1_PARENT_PK    = 28, 
    G1_NULL_03      = 29,  
    G1_PO_M_PK      = 30;

var t_view = 'false';
     
var rtnLGCode = '' ;

var arr_FormatNumber = new Array();
//======================================================================

function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("imgArrow"); 

    if(imgArrow.status == "expand"){
    left.style.display="none";
    imgArrow.status = "collapse";
    right.style.width="100%";
    imgArrow.src = "../../../../system/images/button/next.gif";
    }
    else{
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
    //---------------------------------- 
	
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;      
    //----------------------------------            
    
    txtPONo.SetEnable(false);
    txtStaffName.SetEnable(false);
    txtDeliverName.SetEnable(false);
    txtShipToName.SetEnable(false);
    txtSupplierName.SetEnable(false);
    txtDeliverName.SetEnable(false);
    txtBillToName.SetEnable(false); 
 
    txtPLCode.SetEnable(false);
    txtPLName.SetEnable(false);
    //---------------------------------- 
               
    BindingDataList()    
    OnChangeTab();
    OnToggleGrid();
    //------------------------- 
    data_pbp00230_format.Call('SELECT');
           
}
//======================================================================
function BindingDataList()
{
     var data ;

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
     
     data = "<%=CtlLib.SetListDataSQL("select pk,DEPT_ID || ' * '|| DEPT_NAME from tlg_PO_DEPT a where  del_if=0 order by DEPT_ID")%>||"; 
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
     ctr.ColFormat(G1_REQ_QTY) = txtMaskPOQTy2.text;
     
     ctr.ColFormat(G1_UPRICE)     = txtMaskPOPrice.text;
     ctr.ColFormat(G1_PO_AMT)     = txtMaskPOAmount.text;     
     ctr.ColFormat(G1_VAT_RATE)   = txtMaskItemRate.text;
     ctr.ColFormat(G1_TOTAL_AMT)  = txtMaskTotalAmt.text;  
     ctr.ColFormat(G1_VAT_AMT)    = txtMaskTaxAmount.text;
     ctr.ColFormat(G1_OTHERS_EXP) = txtMaskOthers.text;
     
     arr_FormatNumber[G1_PO_QTY]  = txtForPOQTy.text;
     arr_FormatNumber[G1_REQ_QTY] = txtForReqQTy.text;
     
     arr_FormatNumber[G1_UPRICE]     = txtForPOPrice.text;
     arr_FormatNumber[G1_PO_AMT]     = txtForItemAmount.text;
     arr_FormatNumber[G1_VAT_RATE]   = txtForItemRate.text;
     arr_FormatNumber[G1_TOTAL_AMT]  = txtForTotalAmt.text;
     arr_FormatNumber[G1_VAT_AMT]    = txtForTaxAmount.text;
     arr_FormatNumber[G1_OTHERS_EXP] = txtForOthers.text;       
     
 }
//======================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Charger':
            var path = System.RootURL + '/standard/formsch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtStaffName.text = obj[2];
                txtStaffPK.text   = obj[0];
            }
        break;         

        case 'Supplier' :
             var path = System.RootURL + "/standard/formsfp/ab/fpab00120.aspx?partner_type=AP";
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
             var path = System.RootURL + "/standard/formsfp/ab/fpab00120.aspx?partner_type=AP";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtDeliverPK.text   = object[0];
                txtDeliverName.text = object[2];                
	         }
        break;
                
        case 'Bill_To' :
             var path = System.RootURL + "/standard/formsfp/ab/fpab00120.aspx?partner_type=AP";
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
             var path = System.RootURL + "/standard/formsfp/ab/fpab00120.aspx?partner_type=AR";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtShipToPK.text   = object[0];
                txtShipToName.text = object[2];  
	         }
        break;
        
        case 'PLCenter': // PL
            fpath  = System.RootURL + "/standard/formsfp/ab/fpab00380.aspx";
            oValue = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {                
                txtPLPK.text        = oValue[3];
                txtPLCode.text      = oValue[4];
                txtPLName.text      = oValue[5];
            }
        break;  

        case 'PO': // Array P/O No
            fpath  = System.RootURL + "/standard/formsfp/ab/fpab00330.aspx";
            oValue = System.OpenModal( fpath , 800 , 500 , 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {
                txtRefTablePK.text = oValue[0]; 
                txtRefNo.text      = oValue[1];
            }
        break;           
                                 
        case 'PaymentMethod':        
             var path = System.RootURL + "/standard/formsfp/ab/fpab00220.aspx?code_group=LGCM0110";
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

        case 'PriceType':        
             var path = System.RootURL + "/standard/formsfp/ab/fpab00220.aspx?code_group=LGCM0130";
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
             var path = System.RootURL + "/standard/formsfp/ab/fpab00220.aspx?code_group=LGCM0120";
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
             var path = System.RootURL + "/standard/formsfp/ab/fpab00220.aspx?code_group=LGPO2001";
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
             var path = System.RootURL + "/standard/formsfp/ab/fpab00220.aspx?code_group=LGPO2002";
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
             var path = System.RootURL + "/standard/formsfp/ab/fpab00220.aspx?code_group=LGPO2003";
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
                var path = System.RootURL + '/standard/formsep/bp/epbp00113.aspx';
		        var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
            }
            else
            {
                alert('PLS SELECT ONE P/O.');
            }          
        break;                                                                              
    }	       
}
 
//======================================================================
  
function OnAddNew(pos)
{
     switch (pos)
    {
        case 'Master':     
        
            if ( data_revision_m.GetStatus() != 20 )
            {
                data_revision_m.StatusInsert();
                
				if ( grdSearch.row > 0 )
                {
                    txtPOPK.text = grdSearch.GetGridData(grdSearch.row,0);
                }  
				
				data_PO_M.Call('SELECT');                				                                
                //----------------                              
            }
            else
            {
                alert("Already add new. Pls input data !!!");
            }
            
        break;
                    
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
			
            data_epbp00230.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_revision_m.GetStatus() == 20  && t_view != 'true' )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtPOPK.text = grdSearch.GetGridData( grdSearch.row, G_PK );
                    }
                    flag = 'view' ;
                    pro_epbp00230.Call();
                }                
            } 
            else
            {
				t_view = '';
				
                if ( grdSearch.row > 0 )
                {
                    txtPOPK.text = grdSearch.GetGridData( grdSearch.row, G_PK );
                }
                else
                {
                    txtMasterPK.text = '' ;
                }
                
                flag = 'view' ;
                pro_epbp00230.Call();
            }                               
        break;
        
        case 'grdDetail':            
            data_revision_d.Call("SELECT");
        break;
    }
}

//======================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_revision_m": 
                   
            if ( flag == 'save')
            {
                flag = 'view';
                //----------------------------
                OnSave('Detail');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdDetail');   
            }
            
        break;
        
        case "data_epbp00230_2":
	        if ( grdDetail.rows > 1 )
	        {
	            grdDetail.SetCellBold( 1, G1_PO_ITEM_CD, grdDetail.rows - 1, G1_PO_ITEM_CD,  true);
	            
                grdDetail.SetCellBold( 1, G1_PO_QTY,  grdDetail.rows - 1, G1_PO_QTY,  true);
                grdDetail.SetCellBold( 1, G1_REQ_QTY, grdDetail.rows - 1, G1_REQ_QTY, true);
                
                grdDetail.SetCellBold( 1, G1_TOTAL_AMT, grdDetail.rows - 1, G1_TOTAL_AMT, true);               
                
                grdDetail.SetCellBgColor( 1, G1_REQ_ITEM_CD , grdDetail.rows - 1, G1_REQ_ITEM_NM , 0xCCFFFF );
                
                for ( var i = 1 ; i < grdDetail.rows ; i++)
                {
                    if ( Number(grdDetail.GetGridData( i, G1_REQ_ITEM_PK)) > 0 && ( grdDetail.GetGridData( i, G1_REQ_ITEM_PK) != grdDetail.GetGridData( i, G1_PO_ITEM_PK) ) )
                    {
                        grdDetail.GetGridControl().Cell( 7, i, G1_PO_ITEM_CD, i, G1_PO_ITEM_NM ) = 0x3300cc;
                    }
                }        
                //--------------------------------
	        }   
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
                                                 
         break;                
         
         case 'pro_epbp00230':
                 data_revision_m.Call('SELECT')
         break; 
         case 'data_PO_M':
            data_PO_D.Call('SELECT')
         break;
         
         case 'data_pbp00230_format':
            FormFormat();
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
                    data_revision_m.StatusDelete();
                    data_revision_m.Call();
                } 
            }  
        break;

    }     
}

//======================================================================

function Validate()
{  
    
    if ( txtSupplierPK.text == '' )
    {
        
        alert('Pls select Supplier first !!!');
        return false ;
    }    
    
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
                data_revision_m.Call();
            }    
                    
        break;
        
        case 'Detail':  
             for(var i=1; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G1_REV_PO_D_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G1_REV_PO_M_PK, txtMasterPK.text);
                        
                        grdDetail.SetRowStatus( i, '32' ) ;  
                    } 
                }
            data_revision_d.Call();
        break;
    }
}

//======================================================================

function CheckInput()
{   
    var dPOAmount = 0 , dVATAmount = 0 , dOthersExp = 0, dTotalAmount = 0 ;
    var col, row;
    
    col = event.col;
    row = event.row ; 
    
    if ( col == G1_PO_QTY || col == G1_REQ_QTY || col == G1_UPRICE || col == G1_PO_AMT || col == G1_VAT_RATE || col == G1_TOTAL_AMT||col == G1_VAT_AMT || col == G1_OTHERS_EXP)
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData( row, col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >=0)
            {                    
                grdDetail.SetGridText( row, col, System.Round( grdDetail.GetGridData(row, col), arr_FormatNumber[col] ) );                 
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
    //---- CALCULATE AMOUNT ------
    if ( chkAutoCal.value == 'Y' )
    {      
        if ( col == G1_PO_QTY || col == G1_UPRICE )
        {                 
            dPOAmount = Number(grdDetail.GetGridData( row, G1_PO_QTY )) * Number(grdDetail.GetGridData( row, G1_UPRICE )) ;                            			               
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
//====================================================

function TotalAmount()
{ 
    //---------CALCULATE AMOUNT---------------- 
    var sumPOAmount = 0 , sumVATAmount = 0 , sumTotalAmount = 0 ;

    for (var i=1; i<grdDetail.rows; i++ )
    {
        sumPOAmount    = sumPOAmount    + Number(grdDetail.GetGridData( i, G1_PO_AMT    ));
        sumVATAmount   = sumVATAmount   + Number(grdDetail.GetGridData( i, G1_VAT_AMT   ));
        sumTotalAmount = sumTotalAmount + Number(grdDetail.GetGridData( i, G1_TOTAL_AMT ));
    }
  
    txtPOAmount.text    = System.Round( sumPOAmount,    txtForItemAmount.text ) + "";
    txtVATAmount.text   = System.Round( sumVATAmount,   txtForTaxAmount.text  ) + "";
    txtTotalAmount.text = System.Round( sumTotalAmount, txtForTotalAmt.text   ) + "";
} 

//===================================================================================================
function OnReport(para)
{
    switch(para)
    {
        case '0':
             var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00111.aspx?p_po_pk="+txtMasterPK.text; 
             System.OpenTargetPage(url);             
        break;     
        
        case '1':
             var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00112.aspx?p_po_pk="+txtMasterPK.text; 
             System.OpenTargetPage(url);            
        break; 
        
        case '2':
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
             var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00113.aspx?p_po_pk="+p_po_pk; 
             System.OpenTargetPage(url);            
        break;         
    }
}
//======================================================================
function OnPrint()
{
    switch (lstReportType.value)
    {
        case 'CT1' :
            if ( txtMasterPK.text != ''  )
            {
                var url =System.RootURL + '/standard/reports/ep/bp/epbp00230_1.aspx?txtMasterPK='+txtMasterPK.text ;
                window.open(url);
            }
            else
            {
                alert('PLS SELECT ONE P/O.');
            }
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

//======================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Submit' :             
            if ( confirm('Do you want to submit this PO Revision?'))
            {
                pro_epbp00230_1.Call();
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
		grdDetail.GetGridControl().ColHidden(G1_REQ_QTY)      = true ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_UOM)         = true ;
		grdDetail.GetGridControl().ColHidden(G1_ETD_TO)        = true ;
		grdDetail.GetGridControl().ColHidden(G1_ETA_TO)        = true ;
		
        imgMaster.src = "../../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";
		
    }
    else
    {
        imgMaster.status = "expand";
        
		grdDetail.GetGridControl().ColHidden(G1_REQ_ITEM_CD) = false;
		grdDetail.GetGridControl().ColHidden(G1_REQ_ITEM_NM) = false ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_QTY)      = false ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_UOM)         = false ;
		grdDetail.GetGridControl().ColHidden(G1_ETD_TO)        = false ;
		grdDetail.GetGridControl().ColHidden(G1_ETA_TO)        = false ;				
		
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
                       var path = System.RootURL + '/standard/formsfp/ab/fpab00230.aspx';
	                   var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                   if ( obj != null )
	                   {
	                        grdDetail.SetGridText( event_row, event_col, obj[1]);
	                   }	
                 }
                 else if ( event_col == G1_PO_ITEM_CD || event_col == G1_PO_ITEM_NM )
                 {
                       var path = System.RootURL + '/standard/formsfp/ab/fpab00110.aspx?group_type=|Y|||Y|Y';
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

//====================================================================================
</script>

<body>
      <!--------------------------------------->
    <gw:data id="data_pbp00230_format" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control"  function="st_lg_sel_epbp00230_5"> 
                <inout> 

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
                     <inout bind="txtMaskPOQTy2" /> 
					 
					 <inout bind="chkAutoCal" />
                              
                </inout>
            </dso> 
        </xml> 
    </gw:data>
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
      <!------------------------------------------------------------------>
    <gw:data id="pro_epbp00230" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_epbp00230" > 
                <input>
                    <inout bind="txtPOPK" />
                </input> 
                <output> 
                     <output bind="txtMasterPK" />
                </output>
            </dso> 
        </xml> 
    </gw:data>     
    <!--------------------------------------->
    <gw:data id="data_PO_M" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27" function="st_lg_sel_epbp00230_1"> 
                <inout> 

	                 <inout bind="txtPOPK" />
			         
			         <inout bind="txtPONo" />
                     <inout bind="dtPODate" />
                     <tnout bind="lblStatus" />
                     <inout bind="txtStaffPK" />
                     <inout bind="txtStaffName" />  
                     <inout bind="txtRefTablePK" />
                     <inout bind="txtRefNo" />                     
                     <inout  bind="txtRemark" />
                     <inout  bind="txtSupplierPK" />
                     
                     <inout  bind="txtSupplierName" />                     
                     <inout  bind="txtBillToPK" />
                     <inout  bind="txtBillToName" />                                           
                     <inout  bind="lstCurrency" />  
                    <inout bind="txtNULL01" /> 
                    <inout bind="txtPOAmount" />   
                    <inout bind="txtVATAmount" /> 
                    <inout bind="txtTotalAmount" />
                    <inout bind="dtETDFrom" />
                    <inout bind="dtETDTo" />  
                    
                    <inout bind="dtETAFrom" />
                    <inout bind="dtETATo" />  
                     <inout  bind="txtDeliverPK" /> 
                     <inout  bind="txtDeliverName" /> 
                     <inout  bind="txtBuyRep" />
                     <inout  bind="txtShipToPK" /> 
                     <inout  bind="txtShipToName" /> 
                     <inout  bind="txtSaleRep" />                   
                     <inout  bind="lstDeliType" />                                  
                     <inout  bind="txtPLPK" />                      
                     <inout  bind="txtPLCode" />
                                           
                     <inout  bind="txtPLName" />					 
                     <inout  bind="lstPOType" />                       
                     <inout  bind="lstPaymentTerm" />
                     <inout  bind="lstPriceType" />
                     <inout  bind="txtExRate" />
                     <inout  bind="txtContractNo" />                      
                     <inout  bind="lstPaymentMethod" />    
                     <inout bind="lstDept" /> 
                              
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00230" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso id="1" type="grid" user="prod" function="st_lg_sel_epbp00230" >
                <input  bind="grdSearch">
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
    <gw:data id="data_revision_m" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39" function="st_lg_sel_epbp00230_2" procedure="st_lg_upd_epbp00230_2">
                <input>                         
                    <inout bind="txtMasterPK" />
                    <inout bind="txtPONo" />
                    <inout bind="dtPODate" />
                    <tnout bind="lblStatus" />
                    <inout bind="txtStaffPK" />
                    <inout bind="txtStaffName" />  
                    <inout bind="txtRefTablePK" />
                    <inout bind="txtRefNo" />                    
                    <inout bind="txtRemark" /> 
                    <inout bind="txtSupplierPK" /> 
                    
                    <inout bind="txtSupplierName" />
                    <inout bind="txtBillToPK" />
                    <inout bind="txtBillToName" />
                    <inout bind="lstCurrency" />                    
                    <inout bind="txtNULL01" /> 
                    <inout bind="txtPOAmount" />   
                    <inout bind="txtVATAmount" /> 
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
                    <inout bind="lstDeliType" />                                     
                    <inout bind="txtPLPK" />
                    <inout bind="txtPLCode" />
                    
                    
                    <inout bind="txtPLName" />                     
                    <inout  bind="lstPOType" />                       
                    <inout  bind="lstPaymentTerm" />
                    <inout  bind="lstPriceType" />
                    <inout  bind="txtExRate" />                                                                 
                    <inout  bind="txtContractNo" /> 
                    <inout bind="lstPaymentMethod" />                   
                    
                    <inout bind="lstDept" />
                    <inout bind="txtPOPK" />
                </input>
            </dso>
        </xml>
    </gw:data>
   <!--------------------------------------------------------------------------->
    <gw:data id="data_revision_d" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="4" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29" function="st_lg_sel_epbp00230_4" procedure="st_lg_upd_epbp00230_4"> 
                <input bind="grdDetail">
                    <input bind="txtMasterPK" />               
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_PO_D" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="4" type="grid" user="prod"  function="st_lg_sel_epbp00230_3" > 
                <input bind="grdDetail">
                    <input bind="txtPOPK" />               
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_epbp00230_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00230_1" > 
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
    <gw:data id="pro_epbp00230_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00230_2" > 
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
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 25%">
                <table style="width: 100%; height: 100%">
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
                            <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdSearch')">User
							</gw:checkbox>
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
                        <td style="width: 20%" align="center" colspan=5 >
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                                                                                 
                        <td style="width: 1%">
                            <gw:button id="idBtnSubmit" img="Submit" text="Submit" onclick="OnProcess('Submit')" />
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
                            <a onclick="OnPopUp('Charger')" href="#tips" style="color: #0000ff">Charger</a>
                        </td>
                        <td style="width: 30%">
                            <gw:textbox id="txtStaffName" styles="width:100%" />
                            <gw:textbox id="txtStaffPK" styles="display:none" />
                        </td>
                        <td align="right" style="width: 10%">
                            Remark
                        </td>
                        <td style="width: 25%" colspan="10">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
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
                        <td align="right" style="white-space: nowrap">
                           
                        </td>
                        <td colspan="5" align="right" style="white-space: nowrap">
                            
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnPOSheet" img="excel" alt="PO Sheet" onclick="OnPrint()" />
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
                                        <gw:list id="lstCurrency" styles="width:100%;"   />
                                    </td>
                                    <td style="width: 15%">
                                        <gw:textbox id="txtExRate" type="number" format="#,###,###,###,###.##R" styles="width:100%;" />
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
                                    </td>
                                    <td style="width: 25%">
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Tax Rate
                                    </td>
                                    <td style="width: 30%" colspan="2">
                                        <gw:textbox id="txtTaxRate" type="number" format="#,###,###,###,###.###R" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        VAT Amt
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtVATAmount" type="number" format="#,###,###,###,###.###R" styles="width:100%;" />
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Dept
                                    </td>
                                    <td style="width: 25%" colspan="4">
                                        <gw:list id="lstDept" styles='width:100%;' />
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
                                        <a onclick="OnPopUp('DeliType')" href="#tips" style="color: #0000ff">Deli Type</a>
                                    </td>
                                    <td style="width: 25%">
                                        <gw:list id="lstDeliType" styles="width:100%;" />
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
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        Contract No
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtContractNo" styles="width: 100%" />
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
                                    </td>
                                    <td style="width: 25%">
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
                                    <td style="width: 25%">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="14">
                            <table style="height: 100%; width: 100%">
                                <tr>
                                    <td style="width: 1%">
                                        <img status="expand" id="imgMaster" alt="Show all column" src="../../../../system/images/close_popup.gif"
                                            style="cursor: hand" onclick="OnToggleGrid()" />
                                    </td>
                                    <td style="width: 60%; white-space: nowrap" align="left">
                                    </td>
                                    <td align="right" style="width: 24%; white-space: nowrap">
                                        <gw:checkbox id="chkAutoCal" onchange="" defaultvalue="Y|N" value="Y" />
                                        Auto Cal
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 94%">
                        <td colspan="14">
                            <gw:grid id='grdDetail' header='_rev_po_d_pk|_rev_po_m_pk|_PK|Seq|_Req_Item_PK|Req Item Code|Req Item Name|_PO_ITEM_PK|P/O Item Code|P/O Item Name|Req Qty|UOM|P/O Qty|UOM|U/Price|P/O Amt|VAT(%)|VAT Amt|Others Exp|Total Amt|ETD From|ETD To|ETA From|ETA To|Ref No|_Null02|Remark|_PO_MR_D_PK|_PARENT_PK|_Null03|_PO_PO_M_PK'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|-2|-2|0|0|0|4|4|4|4|0|0|0|0|0|0|0' aligns='0|0|0|1|0|0|0|0|0|0|3|1|3|1|3|3|3|3|3|3|1|1|1|1|0|0|0|0|0|0|0'
                                check='||||||||||||||||||||||||||||||' editcol='0|0|0|1|0|0|0|0|0|0|1|0|1|0|1|1|1|1|1|1|1|1|1|1|0|0|1|0|0|0|0'
                                widths='0|0|0|1000|0|2000|2500|0|2000|2500|1500|1000|1500|1000|1500|1500|1000|1500|1500|1500|1200|1200|1200|1200|1200|1500|1000|0|0|0|0'
                                sorting='T' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)"
                                acceptnulldate='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />    
    <gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
    <!------------------------------------------------------>
    <gw:textbox id="txtPOPK" maxlen="100" styles='width:100%;display:none' />   
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
    <gw:textbox id="txtMaskPOQTy2" styles='display:none;width:100%' />
    <gw:textbox id="txtMaskPOPrice" styles='display:none;width:100%' />
    <gw:textbox id="txtMaskPOAmount" styles='display:none;width:100%' />
    <gw:textbox id="txtMaskItemRate" styles='display:none;width:100%' />
    <gw:textbox id="txtMaskTaxAmount" styles='display:none;width:100%' />
    <gw:textbox id="txtMaskOthers" styles='display:none;width:100%' />
    <gw:textbox id="txtMaskTotalAmt" styles='display:none;width:100%' />
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtNULL01" styles='display:none;width:100%' />
</body>
</html>
