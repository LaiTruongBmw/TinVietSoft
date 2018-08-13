<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>PURCHASING REQUEST ENTRY</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var flag;

//-------------------
var G_PR_PK     = 0,
    G_PR_DATE   = 1,
    G_STATUS    = 2,
    G_PR_NO     = 3,
	G_DELI_LOC	= 4;
    
var G1_NULL_01   = 0,
    G1_PR_D_PK   = 1,
    G1_PR_M_PK   = 2,    
    G1_SEQ       = 3,
    G1_ITEM_PK   = 4,
    G1_ITEM_CODE = 5,
    G1_ITEM_NAME = 6,
    G1_REQ_QTY   = 7,
    G1_UOM       = 8,             
    G1_UPRICE    = 9,
    G1_ITEM_AMT  = 10,
	G1_TAX_RATE	 = 11,
	G1_TAX_AMT	 = 12,
	G1_TOTAL_AMT = 13,
    G1_STOCK_QTY = 14,
    G1_EXPECT_QTY= 15,
	G1_ETD_FROM  = 16,
    G1_ETD_TO    = 17,
    G1_TABLE_NAME= 18,
    G1_TABLE_PK  = 19,    
    G1_REMARK    = 20; 

var rtnLGCode = '' ;
var arr_FormatNumber = new Array();
//======================================================================

function OnToggle(pos)
{
    switch (pos)
    {
        case '1':
            var left = document.all("left"); 
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
                right.style.width="80%";
                imgArrow.src = "../../../../system/images/button/previous.gif";
            }        
        break; 
    }    
}

//======================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	
	txtLang.text = "<%=Session("SESSION_LANG")%>";
    //---------------------------------- 
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    //---------------------------------- 

    txtRequesterID.SetEnable(false);
    txtRequesterName.SetEnable(false);
       
    txtPLCode.SetEnable(false);
    txtPLName.SetEnable(false);
    	
    //-------------------------
    BindingDataList();   
	
	OnChangeTab(); 
    //---------------------------------- 
    OnAddNew('Master');               
}
//============================================================================== 

 function BindingDataList()
 {      
     var data ;    
          
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPO1001') FROM DUAL")%>"; 
     lstDeliLoc.SetDataText(data);      	 
	 
	 data = "<%=CtlLib.SetListDataSQL("select pk,DEPT_ID || ' * '|| DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by SEQ, DEPT_ID")%>"; 
     lstDept.SetDataText(data);
     lstDeptS.SetDataText(data+"||Select All");
     lstDeptS.value=""; 
     	 
	 data = "<%=CtlLib.SetListDataSQL("select pk, BG_TYPE_ID || ' * ' || BG_TYPE_NAME from TLG_PO_BUDGET_TYPE a where  del_if=0 order by BG_TYPE_ID")%>||"; 
     lstBudgetType.SetDataText(data);
     lstBudgetType.value=""; 
	 
	 data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
     lstCCY.SetDataText(data);             
     
     var ctr = grdDetail.GetGridControl(); 
          
     ctr.ColFormat(G1_REQ_QTY)   = "#,###,###,###,###,###.##";
     ctr.ColFormat(G1_UPRICE)    = "#,###,###,###,###,###.##";    
     ctr.ColFormat(G1_ITEM_AMT)  = "#,###,###,###,###,###.##";
	 ctr.ColFormat(G1_TAX_RATE)  = "#,###,###,###,###,###";
	 ctr.ColFormat(G1_TAX_AMT)   = "#,###,###,###,###,###.##";
	 ctr.ColFormat(G1_TOTAL_AMT) = "#,###,###,###,###,###.##"; 
	 	      
	 ctr.ColFormat(G1_STOCK_QTY)  = "#,###,###,###,###,###.##";
	 ctr.ColFormat(G1_EXPECT_QTY) = "#,###,###,###,###,###.##";    
	 
     arr_FormatNumber[G1_REQ_QTY]   = 2;
	 arr_FormatNumber[G1_UPRICE]    = 2;
	 arr_FormatNumber[G1_ITEM_AMT]  = 2;   
	 arr_FormatNumber[G1_TAX_RATE]  = 0;  
	 arr_FormatNumber[G1_TAX_AMT]   = 2; 
	 arr_FormatNumber[G1_TOTAL_AMT] = 2; 
 }

 //===================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {        
            case 'DeliLoc':
                 var path = System.RootURL + '/standard/formsfp/ab/fpab00220.aspx?code_group=LGPO1001';
	             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

	             if ( object != null )
	             {	        	                   
	                    if ( object[0] == 1 )
	                    {
	                        txtLGGroupCodeID.text = 'LGPO1001';
	                        rtnLGCode             = object[1];
        	                
                            data_fpab00220_2.Call("SELECT");                                
	                    }
	                    else
	                    {
	                        lstDeliLoc.value = object[1];        
	                    }    
	             }                
    	        
            break;

            case 'Dept':
                 var path = System.RootURL + '/standard/formsep/bp/epbp00200.aspx';
	             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');         
            break;
           
		   case 'Supplier' :
             var path = System.RootURL + "/standard/formsfp/ab/fpab00120.aspx?partner_type=AP";
	         var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtSupplierPK.text   = object[0];
                txtSupplierName.text = object[2];                   
	         }
        break;
		         
        case 'Requester':
            var path = System.RootURL + '/standard/formsch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtRequesterName.text = obj[2];
                txtRequesterID.text   = obj[1];
                txtRequesterPK.text   = obj[0];
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
                 
        case 'Report':			 
			 if( txtMasterPK.text != "" )
	        {
		        var path = System.RootURL + '/standard/formsep/bp/epbp00013.aspx';
		        var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
 	        }
	        else
	        {
		        alert("Please, select one slip no to print!");
	        }	
		break; 
		
		case 'PUR-TYPE' :
			 var path = System.RootURL + "/standard/formsep/bp/epbp00290.aspx";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');	         	           
		break;    		                                                                 
    }	       
}

 //===================================================================================
function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdDetail" :
            
                var event_col = event.col ;
                var event_row = event.row ;

                 if ( event_col == G1_UOM || event_col == G1_ETD_TO )
                 {
                       var path = System.RootURL + '/standard/formsfp/ab/fpab00230.aspx';
	                   var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                   if ( obj != null )
	                   {
	                        grdDetail.SetGridText( event_row, event_col, obj[1]);
	                   }	
                 }
            break;             
      }         
}   
 
 //===================================================================================
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':
            data_epbp00010_1.StatusInsert();
            
            txtPRNo.text   = '***New PR***';
            txtItemAmt.text = '';            
            //-------------------------------------------
            txtRequesterName.text = "<%=Session("USER_NAME")%>";
            txtRequesterID.text   = '' ;
            txtRequesterPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            flag = "view";        
        break;
        
        case 'FreeItem':
             var path = System.RootURL + '/standard/formsfp/ab/fpab00070.aspx?group_type=|Y|||Y|Y';
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             if ( object != null )
             {
                    var arrTemp
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1); 	
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PR_M_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_PK,   arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE, arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME, arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_UOM,       arrTemp[5]);//item_uom     
							
							grdDetail.SetGridText( grdDetail.rows-1, G1_UPRICE,    arrTemp[6]);//pur price                       
                    }		            
             }        
        break;  
                
        case 'CreateItem':
            var path = System.RootURL + '/standard/formsds/bs/dsbs00212.aspx?group_type=|Y|||Y|Y';
	         var object = System.OpenModal( path ,900 , 700 ,  'resizable:yes;status:yes');
	                 
	         if ( object != null )
	         {
                for( var i=0; i < object.length; i++)	  
                {	
                    var arrTemp = object[i];
                    	        
                    grdDetail.AddRow();                            
                            
                    grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                           
                    grdDetail.SetGridText( grdDetail.rows-1, G1_PR_M_PK, txtMasterPK.text); //master_pk	    	                                               
                        
                    grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_PK,   arrTemp[0]);//item_pk	    
                    grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE, arrTemp[1]);//item_code	    
                    grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME,  arrTemp[2]);//item_name	    
                    grdDetail.SetGridText( grdDetail.rows-1, G1_UOM,        arrTemp[3]);//item_uom       
                }		            
	         }	 	
             
        break; 
            
        case 'Stock':
             var path = System.RootURL + '/standard/formsfp/ab/fpab00410.aspx?group_type=|Y|||Y|Y';
             var object = System.OpenModal( path , 900 , 600 ,  'resizable:yes;status:yes');
             if ( object != null )
             {
                    var arrTemp
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PR_M_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_PK,   arrTemp[3]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE, arrTemp[4]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME, arrTemp[5]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_UOM,    arrTemp[6]);//item_uom       
							
							grdDetail.SetGridText( grdDetail.rows-1, G1_STOCK_QTY, arrTemp[8]);//stock_qty                           
                    }		            
             }        
        break;     
        
        case 'BudgetItem':
             var path = System.RootURL + '/standard/formsep/bp/epbp00012.aspx?group_type=|Y|||Y|Y&dept_pk='+lstDept.value;
             var object = System.OpenModal( path ,950 , 600 ,  'resizable:yes;status:yes');
             if ( object != null )
             {
                    var arrTemp
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1); 	
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PR_M_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_PK,   arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE, arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME, arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_UOM,       arrTemp[5]);//item_uom                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_QTY,   arrTemp[6]);//qty   
                            grdDetail.SetGridText( grdDetail.rows-1, G1_UPRICE,    arrTemp[7]);//unit price   
                    }		            
             }        
        break;  

		case 'ITEMPRICE' :
             var path = System.RootURL + '/standard/formsfp/ab/fpab00074.aspx?group_type=|Y|||Y|Y' + '&p_partner_pk=' + txtSupplierPK.text;
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_PR_M_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_PK, 	arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE, 	arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME, 	arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_UOM,     	arrTemp[3]);//item_uom  
							
                            grdDetail.SetGridText( grdDetail.rows-1, G1_UPRICE,     arrTemp[4]);//pur price                         
                    }		            
             }        
        break;
    }
}  

 //===================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_epbp00010.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_epbp00010_1.GetStatus() == 20 && grdDetail.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, 0 );
                    }
                    else
                    {
                        txtMasterPK.text = '';
                    }
                    
                    flag = 'view' ;
                    data_epbp00010_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, 0 );
                }
                else
                {
                    txtMasterPK.text = '';
                }  
                              
                flag = 'view' ;
                data_epbp00010_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_epbp00010_2.Call("SELECT");
        break;
    
    }
}

//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_epbp00010":
            if ( grdSearch.rows > 1 )
            {
                grdSearch.SetCellBgColor( 1, G_PR_NO, grdSearch.rows - 1, G_PR_NO, 0xCCFFFF);
            }                               
        break;
            
        case "data_epbp00010_1": 
                   
            if ( flag == 'save')
            {
                for(var i=0; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G1_PR_M_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G1_PR_M_PK, txtMasterPK.text);
                    }    
                }                
                
                OnSave('Detail');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdDetail');   
            }            
        break;
        
        case "data_epbp00010_2":

            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G1_ITEM_CODE, grdDetail.rows - 1, G1_ITEM_CODE, true);  
				              
				grdDetail.SetCellBgColor( 1, G1_ITEM_CODE , grdDetail.rows - 1, G1_ITEM_NAME  , 0xCCFFFF );
				grdDetail.SetCellBgColor( 1, G1_STOCK_QTY , grdDetail.rows - 1, G1_EXPECT_QTY , 0xCCFFFF );
            }  
            //--------------------------------
        break;   
                   
        case "pro_epbp00010":
            alert(txtReturnValue.text); 
            //-----------
            data_epbp00010_1.Call("SELECT");
        break; 
        
        case "pro_epbp00010_1":
            alert(txtReturnValue.text); 
            //-----------        
            OnSearch('grdDetail');       
        break;
        
		case 'pro_epbp00010_2':
            alert(txtReturnValue.text);
			OnSearch('grdSearch');
        break;  
		
        case "data_fpab00220_2":
             if ( txtLGGroupCodeID.text == 'LGPO1001')
             {
                lstDeliLoc.SetDataText(txtLGCodeList.text);
                lstDeliLoc.value = rtnLGCode;                      
             }
             else if ( txtLGGroupCodeID.text == 'LGPO1002')
             {
                lstDept.SetDataText(txtLGCodeList.text);
                lstDept.value = rtnLGCode;                      
             }
         break;         
              
    }
}

//==============================================================================
 function OnDelete(index)
 {        
    switch (index)
    {
        case 'Master':// delete master
            if ( confirm('Do you want to delete this Voucher?'))
            {
                flag='delete';
                data_epbp00010_1.StatusDelete();
                data_epbp00010_1.Call();
            }   
        break;

        case 'Detail':
            if ( grdDetail.GetGridData( grdDetail.row, G1_PR_D_PK ) == '' )
            {
                grdDetail.RemoveRow();
            }
            else
            {   
                grdDetail.DeleteRow();
            }              
        break; 
     
    }     
}
//==============================================================================
 
function OnUnDelete()
{              
     grdDetail.UnDeleteRow();
}

//==============================================================================
function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            flag='save';
            data_epbp00010_1.Call();                
        break;
        
        case 'Detail':        
            data_epbp00010_2.Call();
        break;
        
    }
}

//==============================================================================

function CheckInput()
{   
    var col, row;
    
    col = event.col;
    row = event.row;
    
    if ( col == G1_REQ_QTY || col == G1_UPRICE || col == G1_ITEM_AMT || col == G1_TAX_RATE || col == G1_TAX_AMT || col == G1_TOTAL_AMT )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText( row, col, System.Round( dQuantiy+"", arr_FormatNumber[col] ));
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
        //------------------------
		var dAmount, dVATAmount, dTotalAmount;
		
        if ( col == G1_REQ_QTY || col == G1_UPRICE )
        {                       
            dAmount = Number(grdDetail.GetGridData( row, G1_REQ_QTY )) * Number(grdDetail.GetGridData( row, G1_UPRICE ));                       
            grdDetail.SetGridText( row, G1_ITEM_AMT, System.Round(dAmount+"", arr_FormatNumber[G1_ITEM_AMT]) );
			
			dVATAmount = Number(grdDetail.GetGridData( row, G1_ITEM_AMT )) * Number(grdDetail.GetGridData( row, G1_TAX_RATE )) / 100;
			grdDetail.SetGridText( row, G1_TAX_AMT, System.Round(dVATAmount+"", arr_FormatNumber[G1_TAX_AMT]) );
			
			dTotalAmount = Number(grdDetail.GetGridData( row, G1_ITEM_AMT )) + Number(grdDetail.GetGridData( row, G1_TAX_AMT )) ;
			grdDetail.SetGridText( row, G1_TOTAL_AMT, System.Round(dTotalAmount+"", arr_FormatNumber[G1_TOTAL_AMT]) );
        }
		else if ( col == G1_ITEM_AMT || col == G1_TAX_RATE )
		{
			dVATAmount = Number(grdDetail.GetGridData( row, G1_ITEM_AMT )) * Number(grdDetail.GetGridData( row, G1_TAX_RATE )) / 100;
			grdDetail.SetGridText( row, G1_TAX_AMT, System.Round(dVATAmount+"", arr_FormatNumber[G1_TAX_AMT]) );
			
			dTotalAmount = Number(grdDetail.GetGridData( row, G1_ITEM_AMT )) + Number(grdDetail.GetGridData( row, G1_TAX_AMT )) ;
			grdDetail.SetGridText( row, G1_TOTAL_AMT, System.Round(dTotalAmount+"", arr_FormatNumber[G1_TOTAL_AMT]) );			
		}
		else if ( col == G1_TAX_AMT )
		{
			dTotalAmount = Number(grdDetail.GetGridData( row, G1_ITEM_AMT )) + Number(grdDetail.GetGridData( row, G1_TAX_AMT )) ;
			grdDetail.SetGridText( row, G1_TOTAL_AMT, System.Round(dTotalAmount+"", arr_FormatNumber[G1_TOTAL_AMT]) );			
		}
        //------------------------
        TotalAmount();
    }
}
   
//====================================================
function TotalAmount()
{ 
    //---------CALCULATE AMOUNT---------------- 
    var sumItemAmount = 0, sumTaxAmount = 0, sumTotalAmount = 0 ;

    for ( i=1; i<grdDetail.rows; i++ )
    {		
        sumItemAmount  = sumItemAmount  + Number( grdDetail.GetGridData( i, G1_ITEM_AMT  ));
		sumTaxAmount   = sumTaxAmount   + Number( grdDetail.GetGridData( i, G1_TAX_AMT   ));
		sumTotalAmount = sumTotalAmount + Number( grdDetail.GetGridData( i, G1_TOTAL_AMT ));
    }

    txtItemAmt.text  = System.Round( sumItemAmount  +"", arr_FormatNumber[G1_ITEM_AMT]  );
	txtTaxAmt.text   = System.Round( sumTaxAmount   +"", arr_FormatNumber[G1_TAX_AMT]   );
	txtTotalAmt.text = System.Round( sumTotalAmount +"", arr_FormatNumber[G1_TOTAL_AMT] );
} 
//====================================================
 function OnReport(para)
 {
    switch(para)
    {
        case '0':
            if ( txtMasterPK.text != "" )
            { 
                 //var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00011.aspx?master_pk=' + txtMasterPK.text  ;
                 //window.open(url, "_blank");
				 var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00010_st01.aspx?master_pk=' + txtMasterPK.text  ;
                 window.open(url, "_blank");
            }         
        break;
		
        case '1':
            if ( txtMasterPK.text != "" )
            { 
                 var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00010_SONGWOL.aspx?master_pk=' + txtMasterPK.text  ;
                 window.open(url, "_blank");
            }         
        break;
		
		case '2':
            if ( txtMasterPK.text != "" )
            { 
                 var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00010_SAMIL.aspx?master_pk=' + txtMasterPK.text  ;
                 window.open(url, "_blank");
            }         
        break;	
		
		case '3':
            if ( txtMasterPK.text != "" )
            { 
                 var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00010_AMB_2.aspx?master_pk=' + txtMasterPK.text  ;
                 window.open(url, "_blank");
            }         
        break;	
		
		case '4':
            if ( txtMasterPK.text != "" )
            { 
                 var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00010_AMB_1.aspx?master_pk=' + txtMasterPK.text  ;
                 window.open(url, "_blank");
            }         
        break;

		case '5':
            if ( txtMasterPK.text != "" )
            { 
                 var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00010_during.aspx?master_pk=' + txtMasterPK.text  ;
                 window.open(url, "_blank");
            }         
        break;		
    }
 }
 
//=================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Confirm' :
            if ( confirm('Do you want to confirm this P/R?'))
            {
                pro_epbp00010.Call();
            }    
        break; 
		
        case 'PO' :
            if ( confirm('Do you want to create PO for this P/R?'))
            {
                pro_epbp00010_1.Call();
            }    
        break;
		
		case 'OUT_REQ' :
            if ( confirm('Do you want to create Out Req for this P/R?'))
            {
                pro_epbp00010_1.Call();
            }    
        break;
		
		case 'COPY' :
		    if ( txtMasterPK.text == "" )
		    {
		        alert("Please select one PO to copy !!!");
		    }
		    else
		    { 
				if ( confirm('Do you want to copy this P/O ?') )
				{ 
		        	pro_epbp00010_2.Call();
				}	
		    }   
        break;        
    }
}

//====================================================================
function OnChangeTab()
{ 
    var tab_pr_info   = document.all("tab_pr_info"); 
    var tab_pr_amount = document.all("tab_pr_amount"); 
    
    switch (radTab.value)
    {
        case '1':
            tab_pr_info.style.display   = "";
            tab_pr_amount.style.display = "none";         
        break;
        
        case '2' :
            tab_pr_info.style.display   = "none";
            tab_pr_amount.style.display = "";
        break;               
    }
}  
//================================================================= 

</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="pro_epbp00010" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00010" > 
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
    <gw:data id="pro_epbp00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00010_1" > 
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
    <gw:data id="pro_epbp00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00010_2" > 
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
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00010" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso id="1" type="grid" function="st_lg_sel_epbp00010" >
                <input  bind="grdSearch">                    
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="txtSearchNo" />
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
					<input bind="lstDeptS" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00010_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26" function="st_lg_sel_epbp00010_1" procedure="st_lg_upd_epbp00010_1">
                <input>
                    <inout bind="txtMasterPK" />
                    <inout bind="txtPRNo" />
                    <inout bind="dtReqDate" />
                    <inout bind="lbStatus" />                    
                    <inout bind="txtRequesterPK" />
                    
                    <inout bind="txtRequesterID" />
                    <inout bind="txtRequesterName" />   
                    <inout bind="txtArrSOpk" />     
                    <inout bind="txtPORef" />                                
                    
                    <inout bind="txtItemAmt" />            
                                                            
                    <inout bind="txtPLPK" />
                    <inout bind="txtPLCode" />
                    <inout bind="txtPLName" /> 
                    <inout bind="txtLinePK" /> 
                    <inout bind="txtLineNm" />  
                                                         
                    <inout bind="lstDeliLoc" />   
                    <inout bind="lstCCY" /> 
					<inout bind="lstDept" />
                    <inout bind="txtDescription" />  
                       
					<inout bind="dtETDFrom" />
					<inout bind="dtETDTo" />
					
					<inout bind="txtExRate" />
					<inout bind="txtTaxAmt" />
					<inout bind="txtTotalAmt" />  
					
					<inout bind="txtSupplierPK" />
					<inout bind="txtSupplierName" />
					
					<inout bind="lstBudgetType" />                                                                                                                  
                </input>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00010_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="4" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20" function="st_lg_sel_epbp00010_2" procedure="st_lg_upd_epbp00010_2"> 
                <input bind="grdDetail">
                    <input bind="txtMasterPK" />  
					<input bind="txtLang" />            
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 20%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Date</td>
                        <td align="left" style="white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~<gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%; white-space: nowrap" align="right">
                            Req. Dept
                        </td>
                        <td>
                            <gw:list id="lstDeptS" styles="width:100%" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%; white-space: nowrap" align="right">
                            P/R No
                        </td>
                        <td colspan="1">
                            <gw:textbox id="txtSearchNo" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                        <td>
                            <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdSearch')">User
							</gw:checkbox>
                        </td>
                    </tr>
					<tr>
						<td colspan="3">
                            <table style="height: 1%">
                                <tr style="height: 1%">
                                    <td style="width: 10%">
                                        <gw:button id="idBtnCopy" img="copy" text="Copy" onclick="OnProcess('COPY')" />
                                    </td>
                                    <td style="width: 10%">
                                        <gw:button id="idBtnPO" img="P/O" text="P/O" onclick="OnProcess('PO')" />
                                    </td>
									<td style="width: 10%">
                                        <gw:button id="idBtnOutReq" img="Out Req" text="Out Req" onclick="OnProcess('OUT_REQ')" />
                                    </td>
                                    <td>
                                    </td>
                                </tr>
                            </table>
                        </td>
					</tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|P/R Date|Status|P/R No|Deli Location" format="0|4|0|0|0"
                                aligns="1|1|1|0|0" defaults="||||" editcol="0|0|0|0|0" widths="0|1200|1200|1200|1300"
                                styles="width:100%; height:100%" sorting="T" oncellclick="OnSearch('grdMaster')"
                                param="0,1,2,3" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 80%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 1%">
                            <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif" style="cursor: hand"
                                onclick="OnToggle('1')" />
                        </td>
                        <td align="right" style="width: 9%; white-space: nowrap">
                            P/R No
                        </td>
                        <td style="width: 35%">
                            <gw:textbox id="txtPRNo" styles="width: 100%" csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            Req Date
                        </td>
                        <td style="width: 10%">
                            <gw:datebox id="dtReqDate" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td align="center" style="width: 25%">
                            <gw:label id="lbStatus" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td style="width: 6%">
                        </td>
                        <td style="width: 1%">
                            <gw:button id="idBtnConfirm" img="Submit" text="Submit" onclick="OnProcess('Confirm')" />
                        </td>                                                 
                        <td style="width: 1%" align="right">
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
                            <a title="Requester" onclick="OnPopUp('Requester')" style="color: #0000ff; cursor: hand">
                                            Requester</a>
                        </td>
                        <td style="width: 30%;white-space:nowrap">
                            <gw:textbox id="txtRequesterPK" styles="display:none" />
                            <gw:textbox id="txtRequesterID" styles="width:30%;display:none" />
                            <gw:textbox id="txtRequesterName" styles="width:100%" />
                        </td>
                        <td align="right" style="width: 10%">
                            Remark
                        </td>
                        <td style="width: 25%" colspan="10">
                            <gw:textbox id="txtDescription" styles="width:100%" />
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td style="width: 1%" valign="middle" align="left">
                        </td>
                        <td colspan="9">
                            <gw:radio id="radTab" value="1" styles="width:100%" onchange="OnChangeTab()"> 
                                <span value="1" id="1">P/R Info</span> 
                                <span value="2" id="2">Amount/Budget</span>                            
                            </gw:radio>
                        </td> 
						<td style="width: 1%">
                            <gw:button id="btnReport" img="excel" alt="Print Request" onclick="OnPopUp('Report')" />
                        </td>                        
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="13">
                            <table style="height: 100%; width: 100%; background-color: #CCFFFF" id="tab_pr_info" >
								<tr>
									<td align="right" style="width: 5%; white-space: nowrap">
										<a title="Purchase Type" onclick="OnPopUp('PUR-TYPE')" href="#tips" style="color: #0000ff">
                                            B/Type
										</a>										
									</td>
									<td style="width: 45%">
										 <gw:list id="lstBudgetType" styles='width:100%;' />
									</td>		
									<td align="right" style="width: 5%">
										<a title="Supplier" onclick="OnPopUp('Supplier')" href="#tips" style="color: #0000ff">
                                                        Supplier</a>
									</td>
									<td style="width: 45%">
										<gw:textbox id="txtSupplierName" styles="width:100%;" onenterkey="" />
                                        <gw:textbox id="txtSupplierPK" styles="display:none" />
									</td>										
								</tr>
                                <tr style="height: 30%">
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        <a title="Dept" onclick="OnPopUp('Dept')" style="color: #0000ff; cursor: hand">
                                            Dept</a>
                                    </td>
                                    <td style="width: 45%; white-space: nowrap">
                                        <gw:list id="lstDept" styles="width:100%" />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
										<a title="Deli Location" onclick="OnPopUp('DeliLoc')" style="color: #0000ff; cursor: hand">
                                            Deli Loc</a>
                                        
                                    </td>
                                    <td style="width: 45%; white-space: nowrap">
										<gw:list id="lstDeliLoc" styles="width:100%" />
                                        
                                    </td>
                                </tr>
                                <tr style="height: 30%">
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        ETD
                                    </td>
                                    <td align="left" style="width: 45%">
                                       <gw:datebox id="dtETDFrom" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                                        ~
                                        <gw:datebox id="dtETDTo" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                                    </td>
                                    <td align="right" style="width: 5%">
                                        <a title="PLCenter" onclick="OnPopUp('PLCenter')" style="color: #0000ff; cursor: hand">
                                            P/L</a>
                                    </td>
                                    <td align="right" style="width: 45%; white-space: nowrap">
                                          <gw:textbox id="txtPLPK" styles="display: none" />
                                          <gw:textbox id="txtPLCode" styles="width: 30%" />
                                          <gw:textbox id="txtPLName" styles="width: 70%" />
                                    </td>
                                </tr>                                                    
                            </table>
							<table style="height: 100%; width: 100%" id="tab_pr_amount" >
								<tr>
									<td align="right" style="width: 10%">
										Ex-Rate
									</td>
									<td style="width: 20%">
										<gw:list id="lstCCY" styles='width:100%;' />
									</td>
									<td align="right" style="width: 20%">
                                        <gw:textbox id="txtExRate" styles="width: 100% " type="number" format="###,###,###.###" />
                                    </td>
									<td align="right" style="width: 10%">										 
									</td>
									<td style="width: 40%">
										 
									</td>									 								 
								</tr>	
								<tr>
									<td align="right" style="width: 10%; white-space: nowrap">
										Item Amount
									</td>									 
									<td align="right" style="width: 40%" colspan=2 >
                                        <gw:textbox id="txtItemAmt" styles="width: 100% " type="number" format="###,###,###.###" />
                                    </td>
									<td style="width: 50%" colspan=2 >
									</td>									 
								</tr>							
								<tr>
									<td align="right" style="width: 10%; white-space: nowrap">
										Tax Amount
									</td>									 
									<td align="right" style="width: 40%" colspan=2 >
                                        <gw:textbox id="txtTaxAmt" styles="width: 100% " type="number" format="###,###,###.###" />
                                    </td>
									<td style="width: 50%" colspan=2>
									</td>									 
								</tr>
								<tr>
									<td align="right" style="width: 10%; white-space: nowrap">
										Total Amount
									</td>									 
									<td align="right" style="width: 40%" colspan=2 >
                                        <gw:textbox id="txtTotalAmt" styles="width: 100% " type="number" format="###,###,###.###" />
                                    </td>
									<td style="width: 50%" colspan=2>
									</td>									 
								</tr>
							</table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="13">
                            
                                        <table style="width: 100%; height: 100%">
                                            <tr>
                                                <td style="width: 94%">
                                                </td>
												
                                                <td style="width: 1%">
                                                    <gw:button id="btnItemPrice" img="ITEM/PRICE" text="ITEM/PRICE" onclick="OnAddNew('ITEMPRICE')" />
                                                </td>
												
                                                <td style="width: 1%">
                                                    <gw:button id="btnFreeItem" img="Free Item" text="Free Item" onclick="OnAddNew('FreeItem')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:button id="btnStock" img="Stock" text="Stock" onclick="OnAddNew('Stock')" />
                                                    
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:button id="btnBudget" img="Budget" text="Budget" onclick="OnAddNew('BudgetItem')" />
                                                </td>
                                                <td style="width: 1%">
                                                     <gw:button id="btnCrtDTL" img="process" alt="Create Item" onclick="OnAddNew('CreateItem')" />
                                                    <!-- <gw:button id="idBtnSOCons" img="S/O Cons" text="S/O Cons" onclick="OnAddNew('SOCons')" /> -->
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:button id="btnDeleteDTL" img="delete" alt="Delete" onclick="OnDelete('Detail')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:button id="btnUnDeleteDTL" img="udelete" alt="UnDelete" onclick="OnUnDelete()" />
                                                </td>
                                                <td style="width: 1%">
                                                </td>
                                            </tr>
                                        </table>                                    
                        </td>
                    </tr>
                    <tr style="height: 96%">
                        <td colspan="13">
                            <gw:grid id='grdDetail' 
								header='_Null|_PK|_PO_PR_M_PK|Seq|_TCO_ITEM_PK|Item Code|Item Name|Req Qty|UOM|U/Price|Item Amt|Tax(%)|Tax Amt|Total Amt|Stock Qty|Expect Qty|ETD From|ETD To|_REF_TABLE_NAME|_REF_TABLE_PK|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|4|4|0|0|0' 
								aligns='0|0|0|1|0|0|0|3|1|3|3|3|3|3|3|3|1|1|0|0|0'
                                check='||||||||||||||||||||' 
								editcol='0|0|0|1|0|0|0|1|0|1|1|1|1|1|0|0|1|1|0|0|1'
                                widths='0|0|0|800|0|1500|3000|1200|800|1200|1200|1000|1200|1200|1200|1200|1200|1200|0|0|0'
                                styles='width:100%; height:100%' sorting='T' onafteredit="CheckInput()" acceptnulldate="T" />
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
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtLGCodeList" styles='display:none;width:100%' />
    <gw:textbox id="txtLGGroupCodeID" styles='display:none;width:100%' />
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtArrSOpk" styles="width: 100%;display: none" />
    <gw:textbox id="txtPORef" styles="width: 100%;display: none" />
    <gw:textbox id="txtLinePK" styles='display:none;width:100%' />
    <gw:textbox id="txtLineNm" styles='display:none;width:100%' />
	
	<gw:textbox id="txtLang" styles='display:none;width:100%' />
</body>
</html>
