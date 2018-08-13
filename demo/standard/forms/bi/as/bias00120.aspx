<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Transfer Req Entry</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>

//-----------------------------------------------------

var flag;

var G1_MASTER_PK = 0,
    G1_STATUS    = 1,
    G1_SLIP_NO   = 2,
    G1_DATE      = 3,
    G1_REF_NO    = 4;

//=================================================================================
var G2_DETAIL_PK        = 0,
    G2_SEQ              = 1,
    G2_REF_NO           = 2,    
    G2_REQ_ITEM_PK      = 3,
    G2_REQ_ITEM_CODE    = 4,
    G2_REQ_ITEM_NAME    = 5,   
	G2_REQ_UOM          = 6, 
    G2_REQ_QTY          = 7,    
    G2_UNIT_PRICE       = 8,
    G2_ITEM_AMT         = 9,
    G2_VAT_RATE         = 10,
    G2_VAT_AMT          = 11,
    G2_TOTAL_AMT        = 12,
    G2_LOT_NO           = 13,   
    G2_REMARK           = 14,
    G2_MASTER_PK        = 15,
	G2_PO_PO_PK         = 16;
     
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
    txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
	
	txtLang.text = "<%=Session("SESSION_LANG")%>";
    
    txtSlipNo.SetEnable(false);
    txtChargerName.SetEnable(false);
    txtOUT_PLName.SetEnable(false);
    txtIN_PLName.SetEnable(false);    
    
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate = dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    //----------------------------        
	SetGridFormat();
	  
    dso_wh_list_out.Call();
    //----------------------------   
	            
    OnToggleGrid();
      
    //----------------------------
    OnAddNew('Master');
 }
 
 //==================================================================================
 
 function SetGridFormat()
 {
    var data = ""; 
     
    data = "<%=CtlLib.SetListDataFUNC("SELECT lG_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
    lstCurrency.SetDataText(data);
	
	data = "data|1|Transfer|2|Rework";
    lstTrType.SetDataText(data);   
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGIN0305') FROM DUAL" )%>";    
    lstSlipType.SetDataText(data);          
	//---------------------------  
    var ctr = grdDetail.GetGridControl(); 
         
    ctr.ColFormat(G2_REQ_QTY)    = "#,###,###,###,###,###.###";
    ctr.ColFormat(G2_UNIT_PRICE) = "#,###,###,###,###,###";
    ctr.ColFormat(G2_ITEM_AMT)   = "#,###,###,###,###,###";
    ctr.ColFormat(G2_VAT_RATE)   = "#,###,###,###,###,###";
    ctr.ColFormat(G2_VAT_AMT)    = "#,###,###,###,###,###";
    ctr.ColFormat(G2_TOTAL_AMT)  = "#,###,###,###,###,###";
    
     
    arr_FormatNumber[G2_REQ_QTY] = 3;
     
    arr_FormatNumber[G2_UNIT_PRICE] = 0;
    arr_FormatNumber[G2_ITEM_AMT]   = 0;
    arr_FormatNumber[G2_VAT_RATE]   = 0;
    arr_FormatNumber[G2_VAT_AMT]    = 0;
    arr_FormatNumber[G2_TOTAL_AMT]  = 0;      
 }

//==================================================================================
  
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':              
            data_bias00120_1.StatusInsert();
            
            txtSlipNo.text   = '***New Voucher***';
            //-------------------------------------------
            txtChargerName.text = "<%=Session("USER_NAME")%>";
            txtChargerPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            
            flag = "view";        
        break;  
        //==========================================
        case 'FreeItem':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00070.aspx?group_type=|Y|||Y|Y';//purchase_yn=Y
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk	    	                                                                                                        
                                                   
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_ITEM_PK,   arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_ITEM_CODE, arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_ITEM_NAME, arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_UOM,       arrTemp[5]);//item_uom
                            grdDetail.SetGridText( grdDetail.rows-1, G2_UNIT_PRICE,    arrTemp[7]);//Price                            
                    }
                    TotalAmount();	
             }        
        break;     
        //=================================
        case 'Stock':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00410.aspx?group_type=Y|Y|Y|Y|Y|Y&warehouse='+lstOutWH.value;//purchase_yn=Y
             var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
             if ( object != null )
             {
                    var arrTemp
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);
                            //=================================================================
                            grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                                                        
							grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_QTY, arrTemp[8]);                                                   
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_ITEM_PK,   arrTemp[3]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_ITEM_CODE, arrTemp[4]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_ITEM_NAME, arrTemp[5]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_UOM,       arrTemp[6]);//item_uom 
							
                            grdDetail.SetGridText( grdDetail.rows-1, G2_LOT_NO, arrTemp[10]);//item_uom                         
                    }
					
                    TotalAmount();		            
            } 
        break; 
        //=========================================
        case 'PO2':
             var path = System.RootURL + '/standard/forms/bi/as/bias00012.aspx';
             var object = System.OpenModal( path ,1000 , 600 ,  'resizable:yes;status:yes',this);
             
             if ( object != null )
             {
                    var arrTemp;
	                //-----------------                  
                    for ( var i=0; i< object.length; i++)
                    {
                        var arrTemp = object[i];
                        
                        grdDetail.AddRow();
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ,       grdDetail.rows-1);
                        grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G2_REF_NO,  arrTemp[22]);
                                               
                        grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_ITEM_PK,   arrTemp[6]);
                        grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_ITEM_CODE, arrTemp[7]);
                        grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_ITEM_NAME, arrTemp[8]);    
                        grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_QTY,       arrTemp[9]);
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G2_REQ_UOM,  arrTemp[10]);
                        grdDetail.SetGridText( grdDetail.rows-1, G2_UNIT_PRICE, arrTemp[13]);
                        grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_AMT,   arrTemp[14]);
                        grdDetail.SetGridText( grdDetail.rows-1, G2_VAT_RATE,   arrTemp[15]);
                        
                        grdDetail.SetGridText( grdDetail.rows-1, G2_VAT_AMT,   arrTemp[16] );
                        grdDetail.SetGridText( grdDetail.rows-1, G2_TOTAL_AMT, arrTemp[17] );  
						
						grdDetail.SetGridText( grdDetail.rows-1, G2_PO_PO_PK, arrTemp[1] ); // PO DETAIL PK                                                                                   
                    } 
					
                    TotalAmount();             
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
            data_bias00120.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_bias00120_1.GetStatus() == 20 && grdDetail.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G1_MASTER_PK );
                    }
                    flag = 'view' ;
                    data_bias00120_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G1_MASTER_PK );
                }
                
                flag = 'view' ;
                data_bias00120_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_bias00120_2.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_bias00120_1": 
            if ( flag == 'save')
            {
                for(var i=1; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G2_MASTER_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G2_MASTER_PK, txtMasterPK.text);
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

        case "data_bias00120_2":
           
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G2_REQ_ITEM_CODE, grdDetail.rows - 1, G2_REQ_ITEM_CODE,  true);	            
              
                grdDetail.SetCellBold( 1, G2_REQ_QTY,   grdDetail.rows - 1, G2_REQ_QTY,   true);                
                grdDetail.SetCellBold( 1, G2_TOTAL_AMT, grdDetail.rows - 1, G2_TOTAL_AMT, true);                
                grdDetail.SetCellBold( 1, G2_REF_NO,    grdDetail.rows - 1, G2_REF_NO,    true);                               
                //--------------------------------                
            }         
        break;

        case 'pro_bias00120':
            alert(txtReturnValue.text);
            
			flag = 'view' ;
            data_bias00120_1.Call("SELECT");
        break; 
            //===================
        case 'dso_wh_list_out':  
            lstSearchOutWH.SetDataText(txtWHStr.text +"||");
            lstSearchOutWH.value = '';		          
            lstOutWH.SetDataText(txtWHStr.text +"||");
            lstOutWH.value = '';
			//------------------- 
            dso_wh_list_in.Call();       
        break;  
		
        case 'dso_wh_list_in':
            lstSearchInWH.SetDataText(txtWHStr.text +"||");
            lstSearchInWH.value = '';
            lstInWH.SetDataText(txtWHStr.text +"||");
            lstInWH.value = '';
        break;         
        
		case 'pro_bias00120_1':
			alert("Copy finish.");
			
			flag = 'view' ;
            data_bias00120.Call("SELECT");
		break;    
		
		case 'pro_bias00120_2':
			alert(txtReturnValue.text);
		break;    
		case 'data_bias00120':
			if(grdSearch.rows > 1)
			{
				lbSearchRecords.text = grdSearch.rows -1 ;
			}
		break;
		    
   }            
}

//--------------------------------------------------------------------------------------------------
function OnPopUp(pos)
{
    switch(pos)
    {
	
		case 'OUT_WH':
            var path = System.RootURL + '/standard/forms/fp/ab/fpab00240.aspx' ;
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                lstOutWH.value = obj[0];                 
            }
        break;
		
		case 'IN_WH':
            var path = System.RootURL + '/standard/forms/fp/ab/fpab00240.aspx' ;
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                lstInWH.value = obj[0];                 
            }
        break;
			
        case 'Charger':
            var path = System.RootURL + '/standard/forms/co/lg/colg00100.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtChargerName.text = obj[2];
                txtChargerPK.text   = obj[0];
            }
        break;            
        
        case 'IN_PL': // PL
            fpath  = System.RootURL + "/standard/forms/fp/ab/fpab00380.aspx";
            oValue = System.OpenModal( fpath , 800 , 400 , 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {
                txtIN_PLPK.text   = oValue[6]; 
                txtIN_PLName.text = oValue[2] + ' - ' + oValue[5] ;
            }
        break;
        
        case 'OUT_PL': // PL
            fpath  = System.RootURL + "/standard/forms/fp/ab/fpab00380.aspx";
            oValue = System.OpenModal( fpath , 800 , 400 , 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {
                txtOUT_PLPK.text   = oValue[6]; 
                txtOUT_PLName.text = oValue[2] + ' - ' + oValue[5] ;
            }
        break;  
		 
        case 'Report': // PL
            if( txtMasterPK.text != "" )
	        {
		        var path = System.RootURL + '/standard/forms/bi/as/bias00124.aspx';
		        var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
 	        }
	        else
	        {
		        alert("Please, select one slip no to print!");
	        }	
        break;  
		      
 		case 'SlipType':
             var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGIN0305";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');	                   
        break;                
    }	       
}
//=================================================================================
function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':           
            if(flag == 'delete')
            {
                data_bias00120_2.Call();
            }
            else
            {
                if( Validate() )
                {
                    data_bias00120_1.Call();
                    flag='save';
                } 
            }
        break;
        
        case 'Detail':        
            data_bias00120_2.Call();
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

                 if ( event_col == G2_REQ_UOM )
                 {
                       var path = System.RootURL + '/standard/forms/fp/ab/fpab00230.aspx';
	                   var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                   if ( obj != null )
	                   {
	                        grdDetail.SetGridText( event_row, event_col, obj[1]);
	                   }	
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
                data_bias00120_1.StatusDelete();
                data_bias00120_1.Call();
            }   
        break;

        case 'Detail':
            if(confirm('Do you want to delete this Item?'))
            {
                if ( grdDetail.GetGridData( grdDetail.row, G2_DETAIL_PK ) == '' )
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
        if ( Number(grdDetail.GetGridData( i, G2_REQ_QTY)) == 0 )
        {
            alert("Input trans Qty. at " + i + ",pls!")
            return false;
        }
    }
    return true;
}

//=================================================================================

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G2_REQ_QTY || col == G2_UNIT_PRICE || col == G2_ITEM_AMT || col == G2_VAT_RATE || col == G2_VAT_AMT ||col == G2_TOTAL_AMT )
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
        if ( col == G2_REQ_QTY || col == G2_UNIT_PRICE || col == G2_VAT_RATE )
        {
            dQuantiy = grdDetail.GetGridData( row, G2_REQ_QTY) ;
            dPrice   = grdDetail.GetGridData( row, G2_UNIT_PRICE) ;
            
            var dAmount = dQuantiy * dPrice;
            
            grdDetail.SetGridText( row, G2_ITEM_AMT, System.Round( dAmount, arr_FormatNumber[G2_ITEM_AMT] ));
            
            var dVATAmount = 0 , dTotalAmount = 0 ;
            
            dVATAmount   = Number(grdDetail.GetGridData( row, G2_ITEM_AMT )) * Number(grdDetail.GetGridData( row, G2_VAT_RATE )) / 100 ;                
            grdDetail.SetGridText( row, G2_VAT_AMT, System.Round( dVATAmount, arr_FormatNumber[G2_VAT_AMT] ) ) ;
            
            dTotalAmount = Number(grdDetail.GetGridData( row, G2_ITEM_AMT )) + Number(grdDetail.GetGridData( row, G2_VAT_AMT )) ;
            grdDetail.SetGridText( row, G2_TOTAL_AMT, System.Round( dTotalAmount, arr_FormatNumber[G2_TOTAL_AMT] ) ) ;               
        } 
        else if ( col == G2_ITEM_AMT )
        {
            var dVATAmount   = Number(grdDetail.GetGridData( row, G2_ITEM_AMT )) * Number(grdDetail.GetGridData( row, G2_VAT_RATE )) / 100 ;                
            grdDetail.SetGridText( row, G2_VAT_AMT, System.Round( dVATAmount, arr_FormatNumber[G2_VAT_AMT] ) ) ;
            var dTotalAmount = Number(grdDetail.GetGridData( row, G2_ITEM_AMT )) + Number(grdDetail.GetGridData( row, G2_VAT_AMT )) ;
            grdDetail.SetGridText( row, G2_Total_Amt, System.Round( dTotalAmount, arr_FormatNumber[G2_Total_Amt] ) ) ;         
        }
        else if ( col == G2_VAT_AMT )
        {
            var dTotalAmount = Number(grdDetail.GetGridData( row, G2_ITEM_AMT )) + Number(grdDetail.GetGridData( row, G2_VAT_AMT )) ;
            grdDetail.SetGridText( row, G2_TOTAL_AMT, System.Round( dTotalAmount, arr_FormatNumber[G2_TOTAL_AMT] ) ) ;         
        }
            
        TotalAmount();                  
    }      
}
//====================================================
function TotalAmount()
{ 
    //---------CALCULATE AMOUNT---------------- 
    var sumAmount = 0 ;

    for ( i=1; i<grdDetail.rows; i++ )
    {
        sumAmount = sumAmount + Number(grdDetail.GetGridData(i,G2_TOTAL_AMT));
    }

    txtAmount.text = System.Round( sumAmount, 3) ;
} 

//======================================================================
function OnToggleGrid()
{
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";		
		
		grdDetail.GetGridControl().ColHidden(G2_UNIT_PRICE) = true ;
		grdDetail.GetGridControl().ColHidden(G2_ITEM_AMT)   = true ;
		grdDetail.GetGridControl().ColHidden(G2_VAT_RATE)   = true ;
		grdDetail.GetGridControl().ColHidden(G2_VAT_AMT)    = true ;
		grdDetail.GetGridControl().ColHidden(G2_TOTAL_AMT)  = true ;
		
        imgMaster.src = "../../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";
		
    }
    else
    {
        imgMaster.status = "expand";
        
		grdDetail.GetGridControl().ColHidden(G2_UNIT_PRICE) = false ;
		grdDetail.GetGridControl().ColHidden(G2_ITEM_AMT)   = false ;
		grdDetail.GetGridControl().ColHidden(G2_VAT_RATE)   = false ;
		grdDetail.GetGridControl().ColHidden(G2_VAT_AMT)    = false ;
		grdDetail.GetGridControl().ColHidden(G2_TOTAL_AMT)  = false ;					
		
        imgMaster.src = "../../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}
//--------------------------------------------------------------------- 
function OnSelectInWHChange()
{
	if(lstOutWH.value == lstInWH.value)
	{
		alert("In WH and Out WH is the same.");
		lstInWH.value = "";
	}
}
//=================================================================================
function OnPrint()
{  
    if(txtMasterPK.text != "")
    {
        //var url =System.RootURL + '/reports/bi/as/rpt_bias00120.aspx?master_pk=' + txtMasterPK.text ;
        var url =System.RootURL + '/reports/bi/as/rpt_bias00120_droco.aspx?master_pk=' + txtMasterPK.text ;
	    window.open(url, "_blank"); 
	}
	else
	{
	    alert("Pls select one slip.");
	}
}
//==================================================================================
function OnReport(pos)
{
    switch(pos)
    {
        case '0':
		    var url =System.RootURL + '/reports/bi/as/rpt_bias00120.aspx?master_pk=' + txtMasterPK.text ;
	    	window.open(url, "_blank"); 
		
             
        break;
		
		case '1':
		    var url =System.RootURL + '/reports/bi/as/rpt_bias00120_AMB.aspx?master_pk=' + txtMasterPK.text ;
	    	window.open(url, "_blank"); 		             
        break;
		
		case '2':
		    var url =System.RootURL + '/reports/bi/as/rpt_bias00120_AMB.aspx?master_pk=' + txtMasterPK.text ;
	    	window.open(url, "_blank"); 		             
        break;
        
    }
}
//======================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Submit' :
            if ( confirm('Do you want to submit this Slip?'))
            {
                pro_bias00120.Call();
            }               
        break; 
		   
        case 'Copy' :
            if ( txtMasterPK.text != '' )
            {
                if ( confirm('Do you want to make a copy for this slip?'))
                {
                    pro_bias00120_1.Call();
                } 
            } 
			else
			{
				alert("PLS SELECT ONE SLIP.");
			}			                 
        break; 	 
		
		case 'TRANSFER' :
            if ( txtMasterPK.text != '' )
            {
                if ( confirm('Do you want to auto make a transfer slip for this request?'))
                {
                    pro_bias00120_2.Call();
                } 
            } 
			else
			{
				alert("PLS SELECT ONE SLIP.");
			}			                 
        break; 	    
    }
}
//=================================================================================
</script>
<body>
    <!---------------------------------------------------------------->
    <gw:data id="dso_wh_list_out" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_bias00120_3" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="txtWHStr" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="dso_wh_list_in" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_bias00120_4" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="txtWHStr" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------------grdSearch---------------------------------------->
    <gw:data id="data_bias00120" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1,2,3,4,5" function="st_lg_sel_bias00120" > 
                <input>
					<input bind="lstSearchOutWH" />
                    <input bind="lstSearchInWH" />  
                    <input bind="txtNoSearch" /> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />
                    <input bind="txtEmpPK" /> 
					<input bind="chkUser" /> 
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_bias00120_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" function="st_lg_sel_bias00120_1"  procedure="st_lg_upd_bias00120_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="dtTransDate" />  
                     <inout  bind="lblStatus" />                         
                     <inout  bind="txtChargerPK" />
                     <inout  bind="txtChargerName" />
                     <inout  bind="lstOutWH" />
                     <inout  bind="lstInWH" />
                     <inout  bind="txtOUT_PLPK" />
                     <inout  bind="txtOUT_PLName" />
                     <inout  bind="txtIN_PLPK" />
                     <inout  bind="txtIN_PLName" />
                     <inout  bind="txtRefNo" />
                     <inout  bind="txtRemark" />
                     <inout  bind="txtAmount" /> 
                     <inout  bind="lstCurrency" />
                     <inout  bind="txtExRate" />
					 <inout  bind="lstTrType" />
                     <inout  bind="lstSlipType" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_bias00120_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="st_lg_sel_bias00120_2"   procedure="st_lg_upd_bias00120_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" />
					<input bind="txtLang" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bias00120" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bias00120" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------COPY------------------------------------------>
    <gw:data id="pro_bias00120_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_bias00120_1" > 
                <input>
                    <inout bind="txtMasterPK" />
					<inout bind="txtEmpPK" />
                </input> 
                <output> 
                     <output bind="txtMasterPK" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!--------------------------AUTO TRANSFER SLIP------------------------------------------>
    <gw:data id="pro_bias00120_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_bias00120_2" > 
                <input>
                    <inout bind="txtMasterPK" />
					<inout bind="txtEmpPK" />
                </input> 
                <output> 
                     <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!-------------------------------------------------------------------------------->
    <table id="main" style="width:100%;height:100%;border:0" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td id="left" style="width:30%;height:100%" valign="top" rowspan="2">
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
                                        <td>
                                            Out W/H
                                        </td>
                                        <td colspan="2">
											<gw:list id="lstSearchOutWH" styles='width:100%' csstype="mandatory" onchange="OnSearch('grdSearch')" />
                                        </td>
                                    </tr>
									<tr>
                                        <td>
                                            In W/H
                                        </td>
                                        <td colspan="2">
											<gw:list id="lstSearchInWH" styles='width:100%' csstype="mandatory" onchange="OnSearch('grdSearch')" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>                          
							                No.
                                        </td>
                                        <td colspan="2">                            
							                <gw:textbox id="txtNoSearch" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Item
                                        </td>
                                        <td colspan=2>
                                            <gw:textbox id="txtItemSearch" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                                        </td>
                                        
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 96%">
                            <td colspan="4" style="height:100%" class="eco_line_t">
                               <gw:grid id="grdSearch" header="_PK|Status|Slip/Ref No|Date|Out W/H" format="0|0|0|4|0"
                                aligns="0|1|0|1|0" defaults="||||" editcol="0|0|0|0|0" widths="0|1200|1500|1200|1000"
                                styles="width:100%; height:100%" sorting="T" param="0,1,2,3,4" oncellclick="OnSearch('grdMaster')" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td id="right" style="width: 70%" valign="top">
                <div style="width:100%;" class="eco_line">
                    <table style="width:100%;height:100%;border:0;padding:2 5 1 5" cellpadding="0" cellspacing="0" border="0">
                        <tr style="padding-bottom:2px" class="eco_bg">
                            <td align="left">
                                <table style="height:100%">
                                    <tr>
                                        <td>Slip Status : </td>
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
										<td><gw:button id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnPopUp('Report')" /></td>
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
                                            <gw:datebox id="dtTransDate" lang="1" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" class="eco_link"><b>
												Charger</b></a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtChargerName" styles="width:100%" />
											<gw:textbox id="txtChargerPK" styles="display:none" />
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
									<tr style="height: 1%">
										<td align="left" style="width: 15%; white-space: nowrap">
											<a title="WareHouse" onclick="OnPopUp('OUT_WH')" href="#tips" class="eco_link">
												<b>Out W/H</b></a>
										</td>
										<td style="width: 35%;white-space: nowrap" >
											<gw:list id="lstOutWH" styles='width:100%' csstype="mandatory" onchange="OnSelectInWHChange()" />
										</td>
										<td align="right" style="width: 15%; white-space: nowrap">
											<a title="WareHouse" onclick="OnPopUp('IN_WH')" href="#tips" class="eco_link">
												<b>In W/H</b></a>
										</td>
										<td style="width: 35%; white-space: nowrap" >
											<gw:list id="lstInWH" styles='width:100%' csstype="mandatory" onchange="OnSelectInWHChange()" />
										</td>
									</tr>
									<tr style="height: 1%">
										<td style="width: 15%; white-space: nowrap" align="left">
											Total AMT
										</td>
										<td style="width: 35%;white-space: nowrap">
											<gw:textbox id="txtAmount" styles="width:100%;" type="number" format="#,###.###"
												csstype="mandatory" />
										</td>
										<td style="width: 15%; white-space: nowrap" align="right">
											Ex-Rate
										</td>
										<td style="width: 35%">
                                            <table style="width: 100%">
												<tr>
													<td style="width: 50%">
														<gw:list id="lstCurrency" styles="width:100%" onchange="" />
													</td>
													<td style="width: 50%">
														<gw:textbox id="txtExRate" styles="width:100%;" type="number" format="#,###,###.###" />
													</td>
												</tr>
											</table>
                                        </td>
										
									</tr>
									<tr style="height: 1%">
										<td style="width: 15%" align="left">
											Tr Type
										</td>
										<td  style="width: 35%;white-space: nowrap">
											<gw:list id="lstTrType" styles='width:100%' />
										</td>
										<td style="width: 15%;white-space: nowrap" align="right">
											Remark
										</td>
										<td style="width: 35%;white-space: nowrap">
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
                            <td align="left" style="white-space:nowrap">
                                <table style="height:100%">
                                    <tr>
                                        <td>Records :</td>
                                        <td style="width:100px"><gw:label id="lblRowCount" styles='width:100%;color:cc0000;font:9pt' text='' type="number" format="###,###.##" /></td>
                                        <td>Qty : </td>
                                        <td style="width:100px"><gw:label id="lblTotalQty" styles='width:100%;color:cc0000;font:9pt' text='' type="number" format="###,###.##" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td align="right">
                                <table style="height:100%">
                                    <tr>
										
                                        <td  style="width: 1%">
											<gw:button id="idBtnStock" img="popup" text="STOCK" onclick="OnAddNew('Stock')" />
										</td>
										<td  style="width: 1%">
											<gw:button id="idBtnPO" img="popup" text="P/O" onclick="OnAddNew('PO2')" />
										</td>
										<td  style="width: 1%">
											<gw:button id="idBtnFreeItem" img="item" text="ITEM" onclick="OnAddNew('FreeItem')" />
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
                                <gw:grid id='grdDetail' header='_PK|Seq|Ref No|_REQ_ITEM_PK|Req Item Code|Req Item Name|UOM|Req Qty|U/P|Item Amt|Tax(%)|Tax Amt|Total Amt|Lot No|Remark|_ST_TRANSFER_M_PK|_PO_D_PK'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|1|1|0|0|0|1|3|3|3|3|3|3|1|0|0|0'
                                check='||||||||||||||||||||||||' 
							   editcol='0|1|1|0|0|0|0|1|1|1|1|1|1|1|1|0|0'
                                widths='0|800|1500|0|1500|3000|800|1200|1200|1200|1000|1200|1200|1500|1000|0|0'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------------>
    <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
    <gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
    <gw:textbox id="txtWHStr" styles="width: 100%;display: none" />
    <gw:textbox id="txtLang" styles='width:100%;display:none' />
	
	<gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="N" onchange="OnSearch('grdSearch')"></gw:checkbox>
	<gw:textbox id="txtOUT_PLPK" styles="display:none" />
    <gw:textbox id="txtOUT_PLName" styles="width:100%;display:none" />
	<gw:textbox id="txtIN_PLPK" styles="display:none" />
    <gw:textbox id="txtIN_PLName" styles="display:none;width:100%" />
	<gw:list id="lstSlipType" styles="width:100%" />
	<img status="expand" id="imgMaster" alt="Show all column" src="../../../../system/images/close_popup.gif"
                                            style="cursor: hand;display:none" onclick="OnToggleGrid()" />
	<!--------------------------------------------------------------------------->
</body>
</html>
