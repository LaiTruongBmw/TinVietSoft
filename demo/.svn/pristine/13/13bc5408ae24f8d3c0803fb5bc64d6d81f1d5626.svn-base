<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Goods Delivery Entry</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//-----------------------------------------------------
var flag;

var G_MASTER_PK = 0,
    G_STATUS    = 1,
    G_SLIP_NO   = 2,
    G_DATE      = 3,
    G_PARTNER   = 4;		 

//=================================================================================
var G1_DETAIL_PK        = 0,
    G1_SEQ              = 1,
    G1_REF_NO           = 2,
    G1_REQ_ITEM_PK      = 3,
    G1_REQ_ITEM_CODE    = 4,
    G1_REQ_ITEM_NAME    = 5,
    G1_OUT_ITEM_PK      = 6,
    G1_OUT_ITEM_CODE    = 7,
    G1_OUT_ITEM_NAME    = 8,
    G1_REQ_QTY          = 9,
    G1_REQ_UOM          = 10,
    G1_OUT_QTY          = 11,
    G1_OUT_UOM          = 12,
    G1_UNIT_PRICE       = 13,
    G1_ITEM_AMOUNT      = 14,
    G1_VAT_RATE         = 15,
    G1_VAT_AMOUNT       = 16,
    G1_TOTAL_AMOUNT     = 17,
    G1_LOT_NO           = 18,
    G1_WH_PK            = 19,
    G1_WH_NAME          = 20,
	G1_GD_TYPE 			= 21,
	G1_ATT01			= 22,
	G1_ATT02			= 23,
	G1_ATT03			= 24,
    G1_REMARK           = 25,
    G1_MASTER_PK        = 26,
    G1_SO_D_PK          = 27,
    G1_REQ_D_PK         = 28,
	G1_TABLE_PK			= 29,
	G1_TABLE_NM			= 30,
	G1_PARENT_PK		= 31;
    
var arr_FormatNumber = new Array();    
 //===============================================================================================
function OnToggle()
{ 
    var left  = document.all("t-left");    
    var right = document.all("t-right");
    var imgArrow  = document.all("imgArrow");  
    
    if ( imgArrow.status == "expand" )
    {
        left.style.display     = "none";
        right.style.display    = "";                              
                
        imgArrow.status = "collapse";  
        imgArrow.src = "../../../../system/images/button/next.gif";                              
    }
    else 
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
}

 //===============================================================================================
function BodyInit()
 {
 	
    System.Translate(document);  // Translate to language session    
	
    txtUser_PK.text = "<%=session("USER_PK")%>";
    txtUserWH_PK.text = "<%=session("USER_PK")%>";
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
	     
    txtStaffName.SetEnable(false);
    txtCustomerName.SetEnable(false);      
    txtDeliLocName.SetEnable(false); 
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    //---------------------------- 
    BindingDataList();    
    OnToggleGrid();
    //---------------
    data_dscd00070_wh.Call('SELECT');
 }
 //==================================================================================
 
 function BindingDataList()
 { 
     var data = "";  
     //----------------------------
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
     lstCurrency.SetDataText(data);    	 
	 //----------------------------  
	 data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGIN0304') FROM DUAL" )%>||";    
     lstSlipType.SetDataText(data); 
	 lstSlipType.value = "";

     data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE b.GROUP_ID = 'LGSA7020' AND a.TLG_LG_CODE_GROUP_PK = b.PK AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 ORDER BY a.CODE, a.CODE_NM " )%>" ; 
	 data = data + "|#;";
     grdDetail.SetComboFormat(G1_GD_TYPE,data); 
	
	 var ctr = grdDetail.GetGridControl(); 
    
     ctr.ColFormat(G1_REQ_QTY) = "#,###,###,###,###,###.##";
     ctr.ColFormat(G1_OUT_QTY) = "#,###,###,###,###,###.##";
    
     ctr.ColFormat(G1_UNIT_PRICE)   = "#,###,###,###,###,###.###";
     ctr.ColFormat(G1_ITEM_AMOUNT)  = "#,###,###,###,###,###.##";
     ctr.ColFormat(G1_VAT_RATE)     = "#,###,###,###,###,###";
     ctr.ColFormat(G1_VAT_AMOUNT)   = "#,###,###,###,###,###.##";
     ctr.ColFormat(G1_TOTAL_AMOUNT) = "#,###,###,###,###,###.##";
    
     arr_FormatNumber[G1_REQ_QTY] = 2;
     arr_FormatNumber[G1_OUT_QTY] = 2;
     
     arr_FormatNumber[G1_UNIT_PRICE]   = 3;
     arr_FormatNumber[G1_ITEM_AMOUNT]  = 2;
     arr_FormatNumber[G1_VAT_RATE]     = 0;
     arr_FormatNumber[G1_VAT_AMOUNT]   = 2;
     arr_FormatNumber[G1_TOTAL_AMOUNT] = 2;                 
 }

 //==================================================================================
  
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':              
            data_dscd00070_1.StatusInsert();
            
            txtSlipNo.text   = '***New Voucher***';
            //-------------------------------------------
            txtStaffName.text = "<%=Session("USER_NAME")%>";
            txtStaffPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            
            flag = "view";        
        break;  
        
        case 'FreeItem':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00070.aspx?group_type=Y||Y|Y||';//purchase_yn=Y
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_PK, arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_CODE,   arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_NAME,   arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_UOM,         arrTemp[5]);//item_uom
                            grdDetail.SetGridText( grdDetail.rows-1, G1_UNIT_PRICE,             arrTemp[7]);//Price                            
                    }	
             }        
        break;                    
        
		case 'SALEORDER':
			 /*
             var path = System.RootURL + '/standard/forms/ds/cd/dscd00031.aspx';
             var object = System.OpenModal( path ,1050 , 600 ,  'resizable:yes;status:yes',this);
			 
 			 if ( object != null )
             {
                    var arrTemp;
	                //-----------------                  
                    for ( var i=0; i< object.length; i++)
                    {
                        var arrTemp = object[i];
                        
                        grdDetail.AddRow();
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                        grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REF_NO,  arrTemp[16]);//SO ITEM NO
                        grdDetail.SetGridText( grdDetail.rows-1, G1_SO_D_PK, arrTemp[15]);//SO D PK	

                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_PK,   arrTemp[9]);//req_pk    						
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_CODE, arrTemp[10]);//item_code	    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_NAME, arrTemp[11]);//item_name
						grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_PK,   arrTemp[2]);//item_pk
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_CODE, arrTemp[3]);//item_code	    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_NAME, arrTemp[4]);//item_name
						                        
						grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_QTY, arrTemp[12]);
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_QTY, arrTemp[7]); 	    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_UOM, arrTemp[14]); 
						grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_UOM, arrTemp[5]); 
						
						grdDetail.SetGridText( grdDetail.rows-1, G1_UNIT_PRICE, arrTemp[13]); 												
						
						if ( chkAutoCal.value == 'Y' )
                        {
                            var row = grdDetail.rows-1;
                                                    
                            var dQuantiy = grdDetail.GetGridData( row, G1_OUT_QTY) ;
                            var dPrice   = grdDetail.GetGridData( row, G1_UNIT_PRICE) ;
                            
                            var dAmount = dQuantiy * dPrice;
                            
                            grdDetail.SetGridText( row, G1_ITEM_AMOUNT, System.Round( dAmount, arr_FormatNumber[G1_ITEM_AMOUNT] ));
                            
                            var dVATAmount = 0 , dTotalAmount = 0 ;
                            
                            dVATAmount   = Number(grdDetail.GetGridData( row, G1_ITEM_AMOUNT )) * Number(grdDetail.GetGridData( row, G1_VAT_RATE )) / 100 ;                
                            grdDetail.SetGridText( row, G1_VAT_AMOUNT, System.Round( dVATAmount, arr_FormatNumber[G1_VAT_AMOUNT] ) ) ;
                            
                            dTotalAmount = Number(grdDetail.GetGridData( row, G1_ITEM_AMOUNT )) + Number(grdDetail.GetGridData( row, G1_VAT_AMOUNT )) ;
                            grdDetail.SetGridText( row, G1_TOTAL_AMOUNT, System.Round( dTotalAmount, arr_FormatNumber[G1_TOTAL_AMOUNT] ) ) ;  
                        }
                        else
                        {
                            
                        }  
						
						grdDetail.SetGridText( grdDetail.rows-1, G1_LOT_NO,  arrTemp[6]); 
						grdDetail.SetGridText( grdDetail.rows-1, G1_WH_PK,   arrTemp[0]);    
						grdDetail.SetGridText( grdDetail.rows-1, G1_WH_NAME, arrTemp[1]);  
						
						txtCustomerPK.text   = arrTemp[17];
						txtCustomerName.text = arrTemp[18];			                                                                                                                                             
                    }  
					
					TotalAmount();                                
             } */   
			 
			 if ( txtCustomerPK.text == '' )
			 {
			 	alert("PLS SELECT THE BUYER FIRST !!!");
			 	return;
			 }
			 
			 var path = System.RootURL + '/standard/forms/ds/cd/dscd00074.aspx';
             var object = System.OpenModal( path ,1050 , 600 ,  'resizable:yes;status:yes',this);
			 
 			 if ( object != null )
             {
                    var arrTemp;
	                //-----------------                  
                    for ( var i=0; i< object.length; i++)
                    {
                        var arrTemp = object[i];
                        
                        grdDetail.AddRow();
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                        grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REF_NO,  arrTemp[1] );//SO ITEM NO
                        grdDetail.SetGridText( grdDetail.rows-1, G1_SO_D_PK, arrTemp[11]);//SO D PK	

						grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_PK,   arrTemp[2]);//req_pk    						
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_CODE, arrTemp[3]);//item_code	    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_NAME, arrTemp[4]);//item_name

						grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_PK,   arrTemp[2]);//item_pk
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_CODE, arrTemp[3]);//item_code	    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_NAME, arrTemp[4]);//item_name
						
						txtDeliLocPK.text	= arrTemp[12];
						txtDeliLocName.text = arrTemp[13];
						                        
						if ( Number(arrTemp[10]) > 0 )
						{
                        	grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_QTY, arrTemp[10] ); 							    
						}
						else
						{
							grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_QTY, arrTemp[9]  );
						}
							
						grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_UOM, arrTemp[5]);   
						
						grdDetail.SetGridText( grdDetail.rows-1, G1_REMARK, arrTemp[14]);                                                                                                                                                                    
                    }                                 
             }
			              			 
	    break;

		case 'RESULT' :
			 if ( txtCustomerPK.text == '' )
			 {
			 	alert("PLS SELECT THE BUYER FIRST !!!");
			 	return;
			 }
			 
			 var path = System.RootURL + '/standard/forms/ds/cd/dscd00076.aspx';
             var object = System.OpenModal( path ,1050 , 600 ,  'resizable:yes;status:yes',this);
			 
 			 if ( object != null )
             {
                    var arrTemp;
	                //-----------------                  
                    for ( var i=0; i< object.length; i++)
                    {
                        var arrTemp = object[i];
                        
                        grdDetail.AddRow();
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                        grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REF_NO,  arrTemp[1]);//SO ITEM NO
                        grdDetail.SetGridText( grdDetail.rows-1, G1_SO_D_PK, arrTemp[11]);//SO D PK	

						grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_PK,   arrTemp[2]);//item_pk
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_CODE, arrTemp[3]);//item_code	    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_NAME, arrTemp[4]);//item_name
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_QTY, arrTemp[10]); 	    
						grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_UOM, arrTemp[5]);   
						
						grdDetail.SetGridText( grdDetail.rows-1, G1_REMARK, arrTemp[12]);                                                                                                                                                                    
                    }                                 
             }
			              			 
	    break;
				
		case 'REQ':
             var path = System.RootURL + '/standard/forms/ds/cd/dscd00072.aspx';
             var object = System.OpenModal( path ,1050 , 600 ,  'resizable:yes;status:yes',this);
			 
 			 if ( object != null )
             {
                    var arrTemp;
	                //-----------------                  
                    for ( var i=0; i< object.length; i++)
                    {
                        var arrTemp = object[i];
                        
                        grdDetail.AddRow();
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, arrTemp[1]);
                        grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REF_NO,   arrTemp[2]);//SO ITEM NO
                        grdDetail.SetGridText( grdDetail.rows-1, G1_SO_D_PK,  arrTemp[24]);//SO D PK	
						grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_D_PK, arrTemp[0]);//REQ D PK	

                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_PK,   arrTemp[3]);//req_pk    
						grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_PK,   arrTemp[3]);//item_pk
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_CODE, arrTemp[4]);//item_code	    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_NAME, arrTemp[5]);//item_name
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_CODE, arrTemp[4]);//item_code	    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_NAME, arrTemp[5]);//item_name
                        
						grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_QTY, arrTemp[9]);
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_QTY, arrTemp[9]); 	    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_UOM, arrTemp[10]); 
						grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_UOM, arrTemp[10]); 
						
						grdDetail.SetGridText( grdDetail.rows-1, G1_LOT_NO,  arrTemp[18]); 
						grdDetail.SetGridText( grdDetail.rows-1, G1_WH_PK,   arrTemp[19]);    
						grdDetail.SetGridText( grdDetail.rows-1, G1_WH_NAME, arrTemp[20]);  							                                                                                                                                               
                    }                                 
             }                 			 
	    break;	
		
		case 'STOCK':
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00410.aspx?group_type=Y|Y|Y|Y|Y|Y";
             var object = System.OpenModal( path ,900 , 550 ,  'resizable:yes;status:yes',this);
			 
 			 if ( object != null )
             {
                    var arrTemp;
	                //-----------------                  
                    for ( var i=0; i< object.length; i++)
                    {
                        var arrTemp = object[i];
                        
                        grdDetail.AddRow();
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ,       grdDetail.rows-1 );
                        grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text ); //master_pk
  
						grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_PK,   arrTemp[3]);//item_pk
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_CODE, arrTemp[4]);//item_code	    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_NAME, arrTemp[5]);//item_name
						grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_UOM,       arrTemp[6]); 
												
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_QTY, arrTemp[8]); 	
												
						grdDetail.SetGridText( grdDetail.rows-1, G1_LOT_NO,  arrTemp[10]); 
						grdDetail.SetGridText( grdDetail.rows-1, G1_WH_PK,   arrTemp[1]);    
						grdDetail.SetGridText( grdDetail.rows-1, G1_WH_NAME, arrTemp[2]);  							                                                                                                                                               
                    }                                 
             }                 			 
	    break;	

		case 'SCAN':
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00700.aspx?group_type=Y|Y|Y|Y|Y|Y";
             var object = System.OpenModal( path ,900 , 550 ,  'resizable:yes;status:yes',this);
			 
 			 if ( object != null )
             {
                    var arrTemp;
	                //-----------------                  
                    for ( var i=0; i< object.length; i++)
                    {
                        var arrTemp = object[i];
                        
                        grdDetail.AddRow();
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ,       grdDetail.rows-1 );
                        grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text ); //master_pk
						
						grdDetail.SetGridText( grdDetail.rows-1, G1_REF_NO, arrTemp[2] ); //master_pk
  
						grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_PK,   arrTemp[3]);//item_pk
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_CODE, arrTemp[4]);//item_code	    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_NAME, arrTemp[5]);//item_name
						grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_UOM,       arrTemp[6]); 
												
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_QTY, arrTemp[7]); 	
												
						grdDetail.SetGridText( grdDetail.rows-1, G1_LOT_NO,  arrTemp[8]);
						
						grdDetail.SetGridText( grdDetail.rows-1, G1_REMARK,  arrTemp[1]);
						
						grdDetail.SetGridText( grdDetail.rows-1, G1_TABLE_PK, arrTemp[0] );    
						grdDetail.SetGridText( grdDetail.rows-1, G1_TABLE_NM, arrTemp[11]);  							                                                                                                                                               
                    }                                 
             }                 			 
	    break;

		case 'REQ_STOCK':
             var path = System.RootURL + '/standard/forms/ds/cd/dscd00071.aspx?group_type=Y|Y|Y|Y|Y|Y';
             var object = System.OpenModal( path ,900 , 550 ,  'resizable:yes;status:yes',this);
			 
 			 if ( object != null )
             {
                    var arrTemp;
	                //-----------------                  
                    for ( var i=0; i< object.length; i++)
                    {
                        var arrTemp = object[i];
                        
                        grdDetail.AddRow();
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ,       grdDetail.rows-1 );
                        grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text ); //master_pk											
						
						grdDetail.SetGridText( grdDetail.rows-1, G1_REF_NO, arrTemp[1] ); //master_pk
  
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_PK,   arrTemp[2] );//item_pk
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_CODE, arrTemp[3]);//item_code	    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_NAME, arrTemp[4]);//item_name
  
						grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_PK,   arrTemp[9]);//item_pk3
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_CODE, arrTemp[10]);//item_cod4e	    
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_ITEM_NAME, arrTemp[11]);//item_name5
						grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_UOM,       arrTemp[12]); 
												
                        grdDetail.SetGridText( grdDetail.rows-1, G1_OUT_QTY, arrTemp[7]); 	
												
						grdDetail.SetGridText( grdDetail.rows-1, G1_LOT_NO,  arrTemp[8]);
						
						grdDetail.SetGridText( grdDetail.rows-1, G1_SO_D_PK, arrTemp[13]);//SO D PK	
						
						grdDetail.SetGridText( grdDetail.rows-1, G1_WH_PK,   arrTemp[14] ); 						
						grdDetail.SetGridText( grdDetail.rows-1, G1_WH_NAME, arrTemp[15] );						
						
						grdDetail.SetGridText( grdDetail.rows-1, G1_REMARK, arrTemp[16]);      							                                                                                                                                               
                    }                                 
             }                 			 
	    break;		
		
    }
}  

//=============================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_dscd00070.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_dscd00070_1.GetStatus() == 20 && grdDetail.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_MASTER_PK );
                    }
                    flag = 'view' ;
                    data_dscd00070_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_MASTER_PK );
                }
                
                flag = 'view' ;
                data_dscd00070_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_dscd00070_2.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
		case "data_dscd00070": 
			lbSearchRecords.text = addCommas(grdSearch.rows - 1);	  
		break;
        case "data_dscd00070_1": 
            if ( flag == 'save')
            {
                for(var i=1; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G1_MASTER_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G1_MASTER_PK, txtMasterPK.text);
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

        case "data_dscd00070_2":
           
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G1_OUT_ITEM_CODE, grdDetail.rows - 1, G1_OUT_ITEM_CODE,  true);
	            
                grdDetail.SetCellBold( 1, G1_REQ_QTY, grdDetail.rows - 1, G1_REQ_QTY, true);
                grdDetail.SetCellBold( 1, G1_OUT_QTY, grdDetail.rows - 1, G1_OUT_QTY, true);
                
                grdDetail.SetCellBold( 1, G1_TOTAL_AMOUNT, grdDetail.rows - 1, G1_TOTAL_AMOUNT, true);                
                
                grdDetail.SetCellBgColor( 1, G1_REQ_ITEM_CODE , grdDetail.rows - 1, G1_REQ_ITEM_NAME , 0xCCFFFF );
                				 
                //--------------------------------   
				for ( var i=1; i<grdDetail.rows; i++ )
				{
					if ( grdDetail.GetGridData( i, G1_SO_D_PK)>0 ) 
					{
						grdDetail.SetCellBgColor( 1, G1_SEQ , i, G1_SEQ , 0xFFFFCC );
					}
					//----------------------------
					if ( grdDetail.GetGridData( i, G1_PARENT_PK)>0 ) 
					{
						grdDetail.SetCellBgColor( 1, G1_DETAIL_PK , i, G1_PARENT_PK , 0xFFFFCC );
					} 
				}				
            }  
			lblRowCount.text = addCommas(grdDetail.rows - 1);
			loadSum();       
        break;

        case 'pro_dscd00070':
            alert(txtReturnValue.text);
            
			flag = 'view' ;
            data_dscd00070_1.Call("SELECT");
				
        break;   
        
        case 'pro_dscd00070_1':
            alert(txtReturnValue.text);
        break; 		
		
		case 'pro_dscd00070_2':
            alert(txtReturnValue.text);
        break; 
		
        case 'pro_dscd00070_4' :
            OnSearch('grdDetail');
        break;  
		 
        case 'pro_dscd00070_5':
            alert(txtReturnValue.text);
        break;

		case 'pro_dscd00070_6':
            alert(txtReturnValue.text);
        break;
		
		case 'data_fpab00220_2':		 
			 if ( txtLGGroupCodeID.text == 'LGIN0304' )
			 {
				 lstSlipType.SetDataText(txtLGCodeList.text);
				 lstSlipType.value = rtnLGCode;
			 }
		break;	
		
		case 'pro_dscd00070_3':
			 
            switch(txtRadValue.text)
            {
                case '0':			 
                     var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00070_ST.aspx?master_pk='+ txtMasterPK.text +'&print_time=1';			 
                     System.OpenTargetPage(url); 			 
                break;
                case '1':
                     var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00070_HAPPY_01.aspx?master_pk='+ txtMasterPK.text;
                     System.OpenTargetPage(url); 
                break;
                case '2':
                     var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00070_HAPPY_02.aspx?master_pk='+ txtMasterPK.text;
                     System.OpenTargetPage(url); 
                break;
        		/*
                case '1':
                     var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00070_DW.aspx?master_pk='+ txtMasterPK.text;
                     window.open(url); 
                break;
        		
                case '2':
                    var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00070_DW_02.aspx?master_pk='+ txtMasterPK.text;
	                window.open(url);   
                break;
        		
                case '3':
                     var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00070_DW_03.aspx?master_pk='+ txtMasterPK.text;
	                 window.open(url); 
                break;
        		
                case '4':
                    var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00070_DW_04.aspx?master_pk='+ txtMasterPK.text;
	                window.open(url); 
                break;
				*/	
				case '5':
                    var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00073.aspx?master_pk='+ txtMasterPK.text;
	                window.open(url); 
                break;
				
				case '6':
                    var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00074.aspx?master_pk='+ txtMasterPK.text;
	                window.open(url); 
                break;
				
				case '7':
                    var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00075.aspx?master_pk='+ txtMasterPK.text;
	                window.open(url); 
                break;
				
				case '8':
                    var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00071.aspx?master_pk='+ txtMasterPK.text;
	                window.open(url); 
                break;
                
				case '9':
                    var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00070_KB.aspx?master_pk='+ txtMasterPK.text;
	                window.open(url); 
                break;
                
                case '10':
					var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00070_KB_3.aspx?master_pk='+ txtMasterPK.text;
					window.open(url);                     
                break;
                
				case '11':
                    var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00070_KB_1.aspx?master_pk='+ txtMasterPK.text;
	                window.open(url); 
                break;

				case '12':
                    var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00070_KB_4.aspx?master_pk='+ txtMasterPK.text;
	                window.open(url); 
                break;	

				case '13':
                    var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00070_DURING_01.aspx?master_pk='+ txtMasterPK.text;
	                window.open(url); 
                break;	
					case '14':
                    var url =System.RootURL + '/standard/reports/ds/cd/rpt_dscd00070_kb01.aspx?master_pk='+ txtMasterPK.text;
	                window.open(url); 
                break;	
            }    
        break; 	
		
        case 'data_dscd00070_wh':
		
            lstWH.SetDataText(txtWHStr.text +"||");
			lstWH.value = "";
            lstWH2.SetDataText(txtWHStr.text +"||");
            lstWH2.value = "";
            //-------------------
			
	        txtMasterPK.text = "<%=Request.querystring("outgo_m_pk")%>";
        	
	        if ( Number(txtMasterPK.text) > 0 )
	        {
		        OnToggle();
		        flag = 'view' ;
                data_dscd00070_1.Call("SELECT");
	        }
	        else
	        {	
    	        OnAddNew('Master');
	        }	
        break;		            
   }            
}

//--------------------------------------------------------------------------------------------------
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

        case 'Customer' :
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AR";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtCustomerPK.text   = object[0];
                txtCustomerName.text = object[2];  
				
				
				data_dscd00070_4.Call("SELECT");              
	         }
        break; 
		
		case 'Slip_Type':			 
			 var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGIN0304";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes'); 

	         if ( object != null )
	         {	        	                   
	            if ( object[0] == 1 )
	            {
	                txtLGGroupCodeID.text = 'LGIN0304';
	                rtnLGCode             = object[1];
	                
                    data_fpab00220_2.Call("SELECT");                                
	            }
	            else
	            {
	                lstSlipType.value = object[1];      
	            }    	                
	         }   
		break;	
		
 		case 'DeliLoc' :
             if ( txtCustomerPK.text != '' )
             {
                 var path = System.RootURL + '/standard/forms/fp/ab/fpab00180.aspx?partner_pk=' + txtCustomerPK.text + '&partner_name=' + url_encode(txtCustomerName.text) ;
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

		case 'GD_Type':			 
			 var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGSA0720";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes'); 
		break; 		
    }	       
}
//======================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Submit' :
            if ( txtMasterPK.text != '' )
            {        
                if ( confirm('Do you want to submit this Slip?'))
                {
                    pro_dscd00070.Call();
                } 
            }                          
        break;                 
        
        case 'Return' :
            if ( txtMasterPK.text != '' )
            {
                if ( confirm('Do you want to make Return slip?'))
                {
                    pro_dscd00070_2.Call();
                } 
            }                  
        break; 
		
        case 'Trans' :
            if ( txtMasterPK.text != '' )
            {
                if ( confirm('Do you want to make Transfer slip?'))
                {
                    pro_dscd00070_2.Call();
                } 
            }                  
        break;
		
		case 'Income' :
            if ( txtMasterPK.text != '' )
            {
                if ( confirm('Do you want to make Income slip?'))
                {
                    pro_dscd00070_6.Call();
                } 
            }                  
        break;			
		
        case 'Copy' :
            if ( txtMasterPK.text != '' )
            {
                if ( confirm('Do you want to copy this slip?'))
                {
                    pro_dscd00070_5.Call();
                } 
            }                  
        break;    
		
		case 'Grouping' :
			
			if ( txtMasterPK.text != '' )
            {
				var path = System.RootURL + '/standard/forms/ds/cd/dscd00077.aspx';
				var object = System.OpenModal( path ,400 , 200 ,  'resizable:yes;status:yes',this);
			}
			else
			{
				alert("PLS SELECT ONE SLIP.");
			}
		break;
                    
    }
}
//=================================================================================
function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            if( Validate() )
            {
                data_dscd00070_1.Call();
                flag='save';
            }            
        break;
        
        case 'Detail':        
            data_dscd00070_2.Call();
        break;
    }
}

//=================================================================================

function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdDetail" :
            
                 var event_col = event.col ;
                 var event_row = event.row ;
				 
				 if ( event_row == 0 )
				 {
				 	   return;
				 }

                 if ( event_col == G1_REQ_UOM || event_col == G1_OUT_UOM )
                 {
                       var path = System.RootURL + '/standard/forms/fp/ab/fpab00230.aspx';
	                   var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                   if ( obj != null )
	                   {
	                        grdDetail.SetGridText( event_row, event_col, obj[1]);
	                   }	
                 }
                 else if ( event_col == G1_OUT_ITEM_CODE || event_col == G1_OUT_ITEM_NAME )
                 {
                       var path = System.RootURL + '/standard/forms/fp/ab/fpab00110.aspx?group_type=||Y|Y||';
                       var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                       
                       if ( object != null )
                       {
                            grdDetail.SetGridText( event_row, G1_OUT_ITEM_PK, object[0] );
                            grdDetail.SetGridText( event_row, G1_OUT_ITEM_CODE,   object[1] );
                            grdDetail.SetGridText( event_row, G1_OUT_ITEM_NAME,   object[2] );
                       }                       
                 }
				 else if ( event_col == G1_WH_NAME )
                 {
                       var path = System.RootURL + '/standard/forms/fp/ab/fpab00240.aspx';
                       var object = System.OpenModal( path , 600 , 400,  'resizable:yes;status:yes');
                       
                       if ( object != null )
                       {
                            grdDetail.SetGridText( event_row, G1_WH_PK,   object[0] );
                            grdDetail.SetGridText( event_row, G1_WH_NAME, object[2] );
                       }                       
                 }
				 else if ( event_col == G1_SEQ )
                 {
                       var path = System.RootURL + '/standard/forms/fp/ab/fpab00710.aspx?sale_order_d_pk=' + grdDetail.GetGridData( grdDetail.row, G1_SO_D_PK) ;
                       var object = System.OpenModal( path , 600 , 400,  'resizable:yes;status:yes');                                            
                 }
				else if ( event_col == G1_OUT_QTY )
                {
					var path = System.RootURL + '/standard/forms/fp/ab/fpab00770.aspx?p_table_pk=' + grdDetail.GetGridData( event_row, G1_DETAIL_PK ) + '&p_table_name=TLG_GD_OUTGO_D&p_io_type=O';
					var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');                      					  
                }
            break;             
      }         
}   

//=================================================================================

function OnDelete(index)
 {        
    switch (index)
    {
        case 'Master':// delete master
            if(confirm('Do you want to delete this Voucher?'))
            {
                flag='delete';
                data_dscd00070_1.StatusDelete();
                data_dscd00070_1.Call();
            }   
        break;

        case 'Detail':
            if(confirm('Do you want to delete this Item?'))
            {
                if ( grdDetail.GetGridData( grdDetail.row, G1_DETAIL_PK ) == '' )
                {
                    grdDetail.RemoveRow();
                }
                else
                {   
                    grdDetail.DeleteRow();
                }    
            }            
        break;            

    }     
}
//=================================================================================
 
function OnUnDelete()
{              
     grdDetail.UnDeleteRow();
}

//=================================================================================
function Validate()
{   
    //---------------
    for( var i = 1; i < grdDetail.rows; i++)
    {
        //---------------
        if ( Number(grdDetail.GetGridData( i, G1_OUT_QTY)) == 0 )
        {
            alert("Input out qty. at " + i + ",pls!")
            return false;
        }
        //---------------
    }
    if(txtCustomerPK.text=="")
    {
        alert("Please Select Deli To first !")
        return false;
    }
    //----------------
    return true;
}

//=================================================================================

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G1_REQ_QTY || col == G1_OUT_QTY || col == G1_UNIT_PRICE || col == G1_ITEM_AMOUNT || col == G1_VAT_RATE || col == G1_VAT_AMOUNT ||col == G1_TOTAL_AMOUNT )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
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
        //----------------------Calculate Amount -----
        if ( chkAutoCal.value == 'Y' )
        {
            if ( col == G1_OUT_QTY || col == G1_UNIT_PRICE || col == G1_VAT_RATE )
            {
                dQuantiy = grdDetail.GetGridData( row, G1_OUT_QTY) ;
                dPrice   = grdDetail.GetGridData( row, G1_UNIT_PRICE) ;
                
                var dAmount = dQuantiy * dPrice;
                
                grdDetail.SetGridText( row, G1_ITEM_AMOUNT, System.Round( dAmount, arr_FormatNumber[G1_ITEM_AMOUNT] ));
                
                var dVATAmount = 0 , dTotalAmount = 0 ;
                
                dVATAmount   = Number(grdDetail.GetGridData( row, G1_ITEM_AMOUNT )) * Number(grdDetail.GetGridData( row, G1_VAT_RATE )) / 100 ;                
                grdDetail.SetGridText( row, G1_VAT_AMOUNT, System.Round( dVATAmount, arr_FormatNumber[G1_VAT_AMOUNT] ) ) ;
                
                dTotalAmount = Number(grdDetail.GetGridData( row, G1_ITEM_AMOUNT )) + Number(grdDetail.GetGridData( row, G1_VAT_AMOUNT )) ;
                grdDetail.SetGridText( row, G1_TOTAL_AMOUNT, System.Round( dTotalAmount, arr_FormatNumber[G1_TOTAL_AMOUNT] ) ) ;               
            } 
            else if ( col == G1_ITEM_AMOUNT )
            {
                var dVATAmount   = Number(grdDetail.GetGridData( row, G1_ITEM_AMOUNT )) * Number(grdDetail.GetGridData( row, G1_VAT_RATE )) / 100 ;                
                grdDetail.SetGridText( row, G1_VAT_AMOUNT, System.Round( dVATAmount, arr_FormatNumber[G1_VAT_AMOUNT] ) ) ;
				
                var dTotalAmount = Number(grdDetail.GetGridData( row, G1_ITEM_AMOUNT )) + Number(grdDetail.GetGridData( row, G1_VAT_AMOUNT )) ;
                grdDetail.SetGridText( row, G1_TOTAL_AMOUNT, System.Round( dTotalAmount, arr_FormatNumber[G1_TOTAL_AMOUNT] ) ) ;         
            }
            else if ( col == G1_VAT_AMOUNT )
            {
                var dTotalAmount = Number(grdDetail.GetGridData( row, G1_ITEM_AMOUNT )) + Number(grdDetail.GetGridData( row, G1_VAT_AMOUNT )) ;
                grdDetail.SetGridText( row, G1_TOTAL_AMOUNT, System.Round( dTotalAmount, arr_FormatNumber[G1_TOTAL_AMOUNT] ) ) ;         
            }
                
            TotalAmount();  
        }                    
    }      
}
//====================================================
function TotalAmount()
{ 
    //---------CALCULATE AMOUNT---------------- 
    var sumItemAmount  = 0 ;
	var sumTaxAmount   = 0 ;
	var sumTotalAmount = 0 ;

    for ( i=1; i<grdDetail.rows; i++ )
    {
		sumItemAmount  = sumItemAmount  + Number(grdDetail.GetGridData( i, G1_ITEM_AMOUNT ));
		sumTaxAmount   = sumTaxAmount   + Number(grdDetail.GetGridData( i, G1_VAT_AMOUNT  ));
        sumTotalAmount = sumTotalAmount + Number(grdDetail.GetGridData( i, G1_TOTAL_AMOUNT));
    }

	txtItemAmt.text  = System.Round( sumItemAmount,  3) + "" ;
	txtTaxAmt.text   = System.Round( sumTaxAmount,   3) + "" ;
    txtTotalAmt.text = System.Round( sumTotalAmount, 3) + "" ;
} 

//======================================================================
function OnToggleGrid()
{
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";

		grdDetail.GetGridControl().ColHidden(G1_REQ_ITEM_CODE) = true ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_ITEM_NAME) = true ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_QTY)       = true ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_UOM)       = true ;
		
		grdDetail.GetGridControl().ColHidden(G1_UNIT_PRICE)  = true ;
		grdDetail.GetGridControl().ColHidden(G1_ITEM_AMOUNT) = true ;
		grdDetail.GetGridControl().ColHidden(G1_VAT_RATE)    = true ;
		grdDetail.GetGridControl().ColHidden(G1_VAT_AMOUNT)  = true ;
		grdDetail.GetGridControl().ColHidden(G1_TOTAL_AMOUNT)= true ;
		
		grdDetail.GetGridControl().ColHidden(G1_ATT01)= true ;
		grdDetail.GetGridControl().ColHidden(G1_ATT02)= true ;
		grdDetail.GetGridControl().ColHidden(G1_ATT03)= true ;
		
        imgMaster.src = "../../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";
		
    }
    else
    {
        imgMaster.status = "expand";
        
		grdDetail.GetGridControl().ColHidden(G1_REQ_ITEM_CODE) = false ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_ITEM_NAME) = false ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_QTY)       = false ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_UOM)       = false ;				
		
		grdDetail.GetGridControl().ColHidden(G1_UNIT_PRICE)  = false ;
		grdDetail.GetGridControl().ColHidden(G1_ITEM_AMOUNT) = false ;
		grdDetail.GetGridControl().ColHidden(G1_VAT_RATE)    = false ;
		grdDetail.GetGridControl().ColHidden(G1_VAT_AMOUNT)  = false ;
		grdDetail.GetGridControl().ColHidden(G1_TOTAL_AMOUNT)= false ;
		
		grdDetail.GetGridControl().ColHidden(G1_ATT01)= false ;
		grdDetail.GetGridControl().ColHidden(G1_ATT02)= false ;
		grdDetail.GetGridControl().ColHidden(G1_ATT03)= false ;		
				
        imgMaster.src = "../../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}
//=================================================================================
function OnPrint()
{      
	if( txtMasterPK.text != "" )
	{
		var path = System.RootURL + '/standard/forms/ds/cd/dscd00075.aspx';
		var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
 	}
	else
	{
		alert("Please, select one delivery voucher to print!");
	}	
	
	//OnReport('5');
}
//=================================================================================
function OnReport(para1,para2)
{    
    txtReportType.text = para1 ;
    txtRadValue.text = para2 ;
	
    pro_dscd00070_3.Call();
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
//====================================================================================
function loadSum()
{
		var t_item_qty      = 0  ;
		var t_temp_item_pk  = "" ;
		var t_item_count    = 0  ;
		var t_uom           = "" ;
		
		for ( var i=1; i<grdDetail.rows; i++)				
		{						 
			t_item_qty = Number(t_item_qty) + Number(grdDetail.GetGridData( i, G1_OUT_QTY)) ;
				
			t_uom = grdDetail.GetGridData( i, G1_OUT_UOM);      
			 
			if ( t_temp_item_pk != grdDetail.GetGridData( i, G1_OUT_ITEM_PK) )
			{
				t_item_count    = t_item_count + 1 ;
				t_temp_item_pk  = grdDetail.GetGridData( i, G1_OUT_ITEM_PK) ;
			}						
		}
		
		lbItemQty.text = addCommas(t_item_qty)   + " (" + t_uom + ")";
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
//=================================================================================
</script>

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
	<!-----------------------grdSearch---------------------------------------->
    <gw:data id="data_dscd00070_wh" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_dscd00070_wh" > 
                <input>
                    <input bind="txtUserWH_PK" /> 
                </input> 
                <output>
                    <output bind="txtWHStr" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------------grdSearch---------------------------------------->
    <gw:data id="data_dscd00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3,4" function="st_lg_sel_dscd00070" > 
                <input>                      
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
					<input bind="txtSearchNo" />
					<input bind="txtItem" />
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
					<input bind="lstWH" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_dscd00070_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20" function="st_lg_sel_dscd00070_1"  procedure="st_lg_upd_dscd00070_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="dtVoucherDate" />
					 <inout  bind="lblStatus" />
					 <inout  bind="txtRefNo" />                          
                     <inout  bind="txtStaffPK" />
                     <inout  bind="txtStaffName" />                                       
                     <inout  bind="txtCustomerPK" />
                     <inout  bind="txtCustomerName" />
					 <inout  bind="txtDeliLocPK" />
                     <inout  bind="txtDeliLocName" />
					 <inout  bind="txtItemAmt" /> 
					 <inout  bind="txtTaxAmt" /> 
					 <inout  bind="txtTotalAmt" /> 
                     <inout  bind="lstCurrency" />  
                     <inout  bind="txtExRate" />					 
                     <inout  bind="txtRemark" />   
					 <inout  bind="lstSlipType" />   
					 <inout  bind="lstWH2" />                                                                                         
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_dscd00070_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31" function="st_lg_sel_dscd00070_2"   procedure="st_lg_upd_dscd00070_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_dscd00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00070" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_dscd00070_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00070_1" > 
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
    <gw:data id="data_dscd00070_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="control" function="st_lg_sel_dscd00070_4" > 
                <inout>
                    <inout bind="txtCustomerPK"/>
                    <inout bind="txtDeliLocPK"/>
                    <inout bind="txtDeliLocName"/> 				
					<inout bind="lstCurrency" />					 
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
    <!---------------------------------------------------------------->
    <gw:data id="pro_dscd00070_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00070_3" > 
                <input>
                    <input bind="txtReportType" /> 
                    <input bind="txtSlipNo" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_dscd00070_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00070_2" > 
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
	
    <!------------------------------------------------------------------>
    <gw:data id="pro_dscd00070_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00070_5" > 
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
	
	<!------------------------------------------------------------------>
    <gw:data id="pro_dscd00070_6" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_dscd00070_6" > 
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
	
    <!------------------------------------------------------------------>
    <table id="main" style="width:100%;height:100%;border:0" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td id="t-left" style="width:30%;height:100%" valign="top" rowspan="2">
                <div style="width:100%;height:100%" class="eco_line">
                    <table style="width:100%;height:100%;border:1;" cellpadding="0" cellspacing="0">
                        <tr style="padding-bottom:5px;padding-left:5px;padding-right:5px;padding-top:5px;" class="eco_bg">
                            <td align="left" style="white-space:nowrap">Records :</td>
                            <td align="left" style="width:25%">
                                <gw:label id="lbSearchRecords" styles='width:100%;color:cc0000;font:9pt;align:left' text='0' />
                            </td>
                            <td></td>
                            <td><gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" /></td>
                        </tr>
                        <tr style="padding-left:5px;padding-right:5px;padding-top:5px;">
                            <td colspan="4" style="padding-top:3px;" class="eco_line_t">
                                <table style="width: 100%; height: 100%" border="0">
                                    <tr>
                                        <td>
                                            Date
                                        </td>
                                        <td style="white-space: nowrap">
                                           <gw:datebox id="dtFrom" lang="1" />
											~
											<gw:datebox id="dtTo" lang="1" />
                                        </td>
                                        <td></td>
                                    </tr>
									<tr>
										<td >
											W/H
										</td>
										<td colspan="2">
											<gw:list id="lstWH" styles='width:100%' csstype="mandatory" />
										</td>
									</tr>
                                    <tr>
                                        <td>
                                            Item
                                        </td>
                                        <td colspan="2">
                                            <gw:textbox id="txtItem" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>                          
							                Partner/No.
                                        </td>
                                        <td colspan="2">                            
							                <gw:textbox id="txtSearchNo" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                                        </td>
                                    </tr>
                                    
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 96%">
                            <td colspan="4" style="height:100%" class="eco_line_t">
                                <gw:grid id="grdSearch" header="_PK|Status|Slip/Ref No|Date|Partner" format="0|0|0|4|0"
                                aligns="0|1|0|1|0" defaults="||||" editcol="0|0|0|0|0" widths="0|1000|1200|1200|1500"
                                styles="width:100%; height:100%" sorting="T" param="0,1,2,3,4" oncellclick="OnSearch('grdMaster')" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td id="t-right" style="width: 70%" valign="top">
                <div style="width:100%;" class="eco_line">
                    <table style="width:100%;height:100%;border:0;padding:2 5 1 5" cellpadding="0" cellspacing="0" border="0">
                        <tr style="padding-bottom:2px" class="eco_bg">
                            <td align="left">
                                <table style="height:100%">
                                    <tr>
                                        <td>Status : </td>
                                        <td style="width:100px">
											<gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' />
										</td>
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
										<td><gw:button id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnPrint()" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3" style="padding-top:3px;" class="eco_line_t">
                                <table style="width: 100%; height: 100%" border="0">
                                    <tr>
										<td align="left" style="width: 15%; white-space: nowrap">
                                            Date
                                        </td>
                                        <td style="width: 35%">
                                            <gw:datebox id="dtVoucherDate" lang="1" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" class="eco_link"><b>Charger</b></a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtStaffName" styles="width:100%" />
											<gw:textbox id="txtStaffPK" styles="display:none" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                            Slip No
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                           Ref No
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtRefNo" styles="width:100%;" />
                                        </td>
                                    </tr>
									<tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                            <a title="Out-Type" onclick="OnPopUp('Slip_Type')" href="#tips" class="eco_link">
											<b>Out-Type</b></a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="lstSlipType" styles="width:100%" onchange="" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            <a title="Deli To" onclick="OnPopUp('Customer')" href="#tips" class="eco_link">
												<b>Deli To</b></a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtCustomerPK" styles="display:none" />
											<gw:textbox id="txtCustomerName" styles="width:100%" />
                                        </td>
                                    </tr>
									<tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                            <b style=" cursor: hand" onclick="OnPopUp('DeliLoc')" class="eco_link">Deli Loc
											</b>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtDeliLocPK" maxlen="100" styles='width:100%;display:none' />
											<gw:textbox id="txtDeliLocName" styles='width:100%' />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            Ex-Rate
                                        </td>
                                        <td style="width: 35%">
                                            <table style="width: 100%">
												<tr>
													<td style="width: 50%">
														<gw:list id="lstCurrency" styles="width:100%" onchange="" />
													</td>
													<td style="width: 50%">
														<gw:textbox id="txtExRate" styles="width:100%;" type="number" format="#,###.###" />
													</td>
												</tr>
											</table>
                                        </td>
                                    </tr>
									<tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                            W/H
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="lstWH2" styles='width:100%' csstype="mandatory" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                           Remark
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtRemark" styles="width:100%;" />
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
                        <tr style="padding-bottom:2px;padding:2 5 1 5" class="eco_bg">
                            <td align="left" style="width:50%">
                                <table style="height:100%">
                                    <tr>
										<td style="width: 10%" align="left">
											<img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                                        style="cursor: hand" onclick="OnToggle()" />
										</td>
										<td style="width: 1%">
											<img status="expand" id="imgMaster" alt="Show all column" src="../../../../system/images/close_popup.gif"
                                                        style="cursor: hand" onclick="OnToggleGrid()" />
										</td>
                                        <td>Records :</td>
                                        <td style="width:100px" align="left"><gw:label id="lblRowCount" styles='width:100%;color:cc0000;font:9pt' text='' type="number" format="###,###.##" /></td>
                                        
										<td style="width: 20%; white-space: nowrap" align="center">
											<gw:label id="lbItemQty" styles='width:100%;color:cc0000;font:9pt'>-</gw:label>
										</td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right" style="width:50%" >
                                <table style="height:100%">
                                    <tr>
                                        <td  style="width: 1%;display:none"> 
											<gw:button id="idBtnREQSTOCK" img="REQ/STOCK" text="REQ/STOCK" onclick="OnAddNew('REQ_STOCK')" />                                      
										</td>
										<td  style="width: 1%;display:none">
											<gw:button id="idBtnReSULT" img="RESULT" text="RESULT" onclick="OnAddNew('RESULT')" />                                      
										</td>
										<td  style="width: 1%">
                                             <gw:button id="idBtnREQ" img="popup" text="Request" onclick="OnAddNew('REQ')" />
                                        </td>
										<td  style="width: 1%">
											<gw:button id="idBtnSaleOrder" img="popup" text="S/ORDER" sonclick="OnAddNew('SALEORDER')" />
										</td>
										<td  style="width: 1%">
											<gw:button id="idBtnStock" img="popup" text="STOCK" onclick="OnAddNew('STOCK')" />
										</td>
										<td style="width: 1%">
											<gw:button id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" />
										</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height:96%;">
                            <td colspan="3" valign="top" class="eco_line_t">
                                <gw:grid id='grdDetail' header='_PK|Seq|Ref No|_REQ_ITEM_PK|Req Item Code|Req Item Name|_OUTGO_ITEM_PK|Out Item Code|Out Item Name|Req Qty|UOM|Out Qty|UOM|U/P|Item Amt|Tax (%)|Tax Amt|Total Amt|Lot No|_WH_PK|W/H|G/D Type|Att01|Att02|Att03|Remark|_MASTER_PK|_SO_D_PK|_REQ_D_PK|_TABLE_PK|_TABLE_NM|_PARENT_PK'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|1|1|0|0|0|0|0|0|3|1|3|1|3|3|3|3|3|1|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                check='|||||||||||||||||||||||||||||||' 
								editcol='0|1|1|0|0|0|0|0|0|1|0|1|0|1|1|1|1|1|1|0|0|1|1|1|1|1|0|0|0|0|0|0'
                                widths='0|800|1500|0|1500|3000|0|1500|3000|1200|800|1200|800|1200|1500|1200|1500|1500|1500|0|1500|1200|1500|1500|1500|1000|0|0|0|0|0|0'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" 
								oncelldblclick="OnGridCellDoubleClick(this)"
                                acceptnulldate='T' />
							
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="display:none;" />
<gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtUserWH_PK" styles="width: 100%;display: none" />
<gw:textbox id="txtWHStr" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtLGCodeList" styles='display:none;width:100%' />
<gw:textbox id="txtLGGroupCodeID" styles='display:none;width:100%' />
<gw:textbox id="txtReportType" styles='display:none;width:100%' />
<gw:textbox id="txtRadValue" styles='display:none;width:100%' />
<!---------------------------------------------------------------------------------->
<gw:checkbox id="chkUser" styles="color:blue;display:none" defaultvalue="Y|N" value="N" onchange="OnSearch('grdSearch')" />
<gw:textbox id="txtTotalAmt" styles="width:100%;display:none" type="number" format="#,###.###" csstype="mandatory" />
<gw:textbox id="txtTaxAmt" styles="width:100%;display:none" type="number" format="#,###.###" csstype="mandatory" />
<gw:textbox id="txtItemAmt" styles="width:100%;display:none" type="number" format="#,###.###"  csstype="mandatory" />
<gw:checkbox id="chkAutoCal" styles="width:100%;display:none" onchange="" defaultvalue="Y|N" value="Y" />
</html>
