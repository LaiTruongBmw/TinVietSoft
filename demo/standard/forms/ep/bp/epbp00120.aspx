<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>M/R ENTRY</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var  user_pk   =  "<%=Session("EMPLOYEE_PK")%>"  ;
var flag;

//-------------------
var G_MR_PK     = 0,
    G_MR_Date   = 1,
    G_MR_No     = 2,
    G_Ref_PO_No = 3;
    
var G1_MRD_PK       = 0,
    G1_TPR_POREQ_PK = 1,
    G1_Ref_No       = 2,
    G1_Group        = 3,
    G1_TCO_ITEM_PK  = 4,
    G1_Item_Code    = 5,
    G1_Item_Name    = 6,
    G1_Cons_Qty     = 7,
    G1_WH_Book      = 8,
    G1_PO_Book      = 9,
    G1_Req_Qty_01   = 10,
    G1_UOM_01       = 11,
    G1_Req_Qty_02   = 12,
    G1_UOM_02       = 13,
    G1_U_P          = 14,
    G1_Amount       = 15,
    G1_Description  = 16,
    G1_REF_TABLE    = 17,
    G1_REF_PK       = 18;
    
var G2_StockBook_PK     = 0,
    G2_TPR_POREQD_PK    = 1,
    G2_TCO_ITEM_PK      = 2,
    G2_Item_Code        = 3,
    G2_Item_Name        = 4,
    G2_TPR_LOTNO_PK     = 5,
    G2_Lot_No           = 6,
    G2_Book_Qty         = 7,
    G2_UOM              = 8,
    G2_WH_PK            = 9,
    G2_WH_ID            = 10,
    G2_PO_No            = 11;

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
                imgArrow.src = "../../../../system/images/next_orange.gif";
            }
            else
            {
                left.style.display="";
                imgArrow.status = "expand";
                right.style.width="80%";
                imgArrow.src = "../../../../system/images/prev_orange.gif";
            }        
        break; 
        
        case '2' :
            var info = document.all("info"); 

            if ( info.style.display == "none" )
            {
                info.style.display = "";
                
                radBook.style.display       = "" ;
                btnProcess.style.display    = "" ;
                btnAddNew01.style.display   = "" ;
                btnDelete01.style.display   = "" ;
                btnUnDelete01.style.display = "" ;
                btnSave01.style.display     = "" ;
                
                imgInfo.src = "../../../../system/images/down.gif";
            }
            else
            {
                info.style.display = "none";
                
                radBook.style.display       = "none" ;
                btnProcess.style.display    = "none" ;
                btnAddNew01.style.display   = "none" ;
                btnDelete01.style.display   = "none" ;
                btnUnDelete01.style.display = "none" ;
                btnSave01.style.display     = "none" ;
                                
                imgInfo.src = "../../../../system/images/up.gif";
            }        
        break;
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
        
    lstStatus.SetEnable(false);
    txtStaffID.SetEnable(false);
    txtStaffName.SetEnable(false);
    txtPLName.SetEnable(false);
    txtMRNo.SetEnable(false);
    txtPONo.SetEnable(false);
    //----------------------------------            
    OnChangeTab('radBook');
    OnChangeTab('radTab');
    //-------------------------

    BindingDataList();    
    //----------------------------------                
}
//============================================================================== 

 function BindingDataList()
 {      
     var data ;
     
     data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_LOGISTIC_CODE('LGIN0010') FROM DUAL")%>"; 
     lstStatus.SetDataText(data);
     lstStatus.value = "10";
     
     lstStatusSearch.SetDataText(data + "||Select ALL");
     lstStatusSearch.value = "";
    
     data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_LOGISTIC_CODE('LGIN0020') FROM DUAL")%>"; 
     data = data +"||";
     lstDeliLoc.SetDataText(data);
     lstDeliLoc.value ="";
     
     data = "<%=CtlLib.SetListDataSQL("select pk,org_nm from comm.tco_org a where del_if=0 order by org_nm")%>"; 
     data = data +"||";
     lstOrg.SetDataText(data);
     lstOrg.value="";
     
     data = "<%=CtlLib.SetListDataSQL("SELECT PK, LINE_NAME FROM prod.pb_LINE Where Del_if=0 ")%>";  
     data = data +"||";
     lstLine.SetDataText(data);       
     lstLine.value="";         
     
     data ="data|1|Req Qty 1|2|Req Qty 2"
     lstPriceBy.SetDataText(data);  
     lstPriceBy.value = 1; 
     
    var ctr = grdDetail.GetGridControl(); 
    
    ctr.ColFormat(G1_Cons_Qty) = "#,###,###,###,###,###.##";
    ctr.ColFormat(G1_WH_Book)  = "#,###,###,###,###,###.##";
    ctr.ColFormat(G1_PO_Book)  = "#,###,###,###,###,###.##";
      
    ctr.ColFormat(G1_Req_Qty_01) = "#,###,###,###,###,###.##";
    ctr.ColFormat(G1_Req_Qty_02) = "#,###,###,###,###,###.##";
    
    ctr.ColFormat(G1_U_P)    = "#,###,###,###,###,###.##";    
    ctr.ColFormat(G1_Amount) = "#,###,###,###,###,###.##"; 
    
    ctr = grdStockBook.GetGridControl();  
    ctr.ColFormat(G2_Book_Qty)    = "#,###,###,###,###,###.##";     
      
     
 }

 //===================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {        
        case 'delivery':
             var fpath = System.RootURL + "/standard/formsfp/ab/PopUpChangeCommonCode.aspx?code=PRCP0130";
             var obj  = System.OpenModal(  fpath , 800 , 600 , 'resizable:yes;status:yes');
	             if ( object != null )
	             {	        	                   
	                if(object[0]==1)
	                {
	                    txtComCodeID.text = 'PRCP0130';                                                 
                        iCodeID           = object[1];
                        
                        datGetNewCode.Call("SELECT");                
	                }
	                else
	                    lstDeliLoc.value = object[1];	            
	             }     
        break;
        
        case 'Charger':
            var path = System.RootURL + '/standard/formsch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtStaffName.text = obj[2];
                txtStaffID.text   = obj[1];
                txtStaffPK.text   = obj[0];
            }
        break; 

        case 'PL': // PL
            fpath  = System.RootURL + "/standard/formsbd/dp/bddp00012.aspx";
            oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {
                txtPLPK.text   = oValue[0]; 
                txtPLName.text = oValue[2];
            }
        break;                
                
        case 'FreeItem':
             var path = System.RootURL + '/standard/formsfp/ab/fpab00070.aspx?group_type=||Y|Y||';
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             if ( object != null )
             {
                    var arrTemp
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TPR_POREQ_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TCO_ITEM_PK, arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Item_Code,   arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Item_Name,   arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_UOM_01,      arrTemp[5]);//item_uom                            
                    }		            
             }        
        break;  
                
        case 'CreateItem':
             var path = System.RootURL + '/standard/formsds/bs/dsbs00012.aspx?group_type=||Y|Y||';
             var object = System.OpenModal( path , 1000 , 700 ,  'resizable:yes;status:yes');
             if ( object != null )
             {
                    var arrTemp
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TPR_POREQ_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_TCO_ITEM_PK, arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Item_Code,   arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_Item_Name,   arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_UOM_01,      arrTemp[5]);//item_uom                            
                    }		            
             }        
        break;   
        
        case 'StockBook':
            if ( txtPOReqDPK.text == '' || !(grdDetail.row > 0) )
            {
                alert('Pls select saved Req detail.');
            }
            //------------------
            if ( radBook.value == 1 )
            {
                 var path = System.RootURL + '/standard/formsfp/ab/fpab00290.aspx?item_code=' + grdDetail.GetGridData( grdDetail.row, G1_Item_Code);
                 var object = System.OpenModal( path , 900 , 600 ,  'resizable:yes;status:yes');
                 
                 if ( object != null )
                 {
                        var arrTemp;
                        for( var i=0; i < object.length; i++)	  
                        {	
                                arrTemp = object[i];
                                    
                                grdStockBook.AddRow();                            
                                
                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_TPR_POREQD_PK, txtPOReqDPK.text); //MR DETAIL PK	    	                                               
                                
                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_TCO_ITEM_PK, arrTemp[2]);//ITEM	    
                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_Item_Code,   arrTemp[3]);//CODE	    
                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_Item_Name,   arrTemp[4]);//NAME    
                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_UOM,         arrTemp[5]);//UOM                                                                

                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_TPR_LOTNO_PK, arrTemp[6]);//Lot No PK	    
                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_Lot_No,       arrTemp[7]);//Lot No 
                                                                
                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_WH_PK, arrTemp[0]);//WH Name	    
                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_WH_ID, arrTemp[1]);//WH ID
                                
                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_Book_Qty, arrTemp[12]);// Comm Qty                                                                                                                              
                        }		            
                 }                                          
            }
            else
            {
                 var path = System.RootURL + '/standard/formsfp/ab/fpab00300.aspx';
                 var object = System.OpenModal( path , 900 , 600 ,  'resizable:yes;status:yes');
                 
                 if ( object != null )
                 {
                        var arrTemp;
                        for( var i=0; i < object.length; i++)	  
                        {	
                                arrTemp = object[i];
                                    
                                grdStockBook.AddRow();                            
                                
                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_TPR_POREQD_PK, txtPOReqDPK.text); //MR DETAIL PK	    	                                               
                                
                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_TCO_ITEM_PK, arrTemp[2]);//ITEM	    
                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_Item_Code,   arrTemp[3]);//CODE	    
                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_Item_Name,   arrTemp[4]);//NAME    
                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_UOM,         arrTemp[5]);//UOM                                                                

                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_TPR_LOTNO_PK, arrTemp[6]);//Lot No PK	    
                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_Lot_No,       arrTemp[7]);//Lot No 
                                                                
                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_WH_PK, arrTemp[0]);//WH Name	    
                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_WH_ID, arrTemp[1]);//WH ID
                                
                                grdStockBook.SetGridText( grdStockBook.rows-1, G2_Book_Qty, arrTemp[12]);// Comm Qty                                                                                                                              
                        }		            
                 }                                          
            
            }
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

                 if ( event_col == G1_UOM_01 || event_col == G1_UOM_02 )
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
function OnNew()
{
    data_epbp00120_1.StatusInsert();
    
    txtAmount.text = ''
    //-------------------------------------------
    txtStaffName.text = "<%=Session("USER_NAME")%>";
    txtStaffID.text   = '' ;
    txtStaffPK.text   = "<%=Session("EMPLOYEE_PK")%>";
    //------------------------------------------- 
    grdDetail.ClearData();
    
    flag = "view"; 
}  

 //===================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_epbp00120.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_epbp00120_1.GetStatus() == 20 )
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
                    data_epbp00120_1.Call("SELECT");
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
                data_epbp00120_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_epbp00120_2.Call("SELECT");
        break;
        
        case 'grdStockBook': 
            if ( grdDetail.row > 0 )
            {           
                txtPOReqDPK.text = grdDetail.GetGridData( grdDetail.row, G1_MRD_PK) ;
            } 
            else
            {
                txtPOReqDPK.text = '' ;
            }
            
            data_epbp00120_3.Call("SELECT");   
        break;        
    }
}

//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_epbp00120_1": 
                   
            if ( flag == 'save')
            {
                for(var i=0; i < grdDetail.rows;i++)
                {
                    if ( grdDetail.GetGridData( i, G1_TPR_POREQ_PK) == '' )
                    {
                        grdDetail.SetGridText( i, G1_TPR_POREQ_PK, txtMasterPK.text);
                    }    
                }
                
                txtMRNoSearch.text = txtMRNo.text ;
                
                OnSave('Detail');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdDetail');   
            }
            
        break;
        
        case "data_epbp00120_2":

            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G1_Req_Qty_01, grdDetail.rows - 1, G1_Req_Qty_01,  true);
                grdDetail.SetCellBold( 1, G1_Req_Qty_02, grdDetail.rows - 1, G1_Req_Qty_02,  true);
            }                            
                    
            if ( flag != 'view' ) 
            {   
                OnSearch('grdSearch');
            }    
        break;

        case "data_epbp00120_3":
            if ( grdStockBook.rows > 1 )
            {
                grdStockBook.SetCellBold( 1, G2_Book_Qty, grdStockBook.rows - 1, G2_Book_Qty, true);
                grdStockBook.SetCellBold( 1, G2_PO_No, grdStockBook.rows - 1,    G2_PO_No,    true);
            }                              
        break;
                
        case "pro_epbp00120":
            alert(txtReturnValue.text); 
            //-----------
            OnSearch('grdMaster');
        break;
           
       case "pro_epbp00120_3":
            alert(txtReturnValue.text);
            //---------
            txtMasterPK.text = txtReturnPK.text ; 
            
            flag = 'view' ;
            data_epbp00120_1.Call("SELECT");
       break;
       
       case "pro_epbp00120_2":
            grdStockBook.SetComboFormat( G2_PO_No, txtReturnValue.text);
       break;       
       
       case "datDeptData":
           // lstDept.SetDataText(txtDeptData.text)    ;
           // alert(txtDeptData.text)
              obj=lstDept.GetControl()
		    if (obj.options.length ==2)
			    obj.options.selectedIndex=0;
		    else
			    obj.options.selectedIndex=obj.options.length-1;
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
                data_epbp00120_1.StatusDelete();
                data_epbp00120_1.Call();
            }   
        break;

        case 'Detail':
            if ( grdDetail.GetGridData( grdDetail.row, G1_MRD_PK ) == '' )
            {
                grdDetail.RemoveRow();
            }
            else
            {   
                grdDetail.DeleteRow();
            }              
        break; 
        
        case 'StockBook':
            if ( radBook.value == 1 )
            {
                if ( grdStockBook.GetGridData( grdStockBook.row, G2_StockBook_PK ) == '' )
                {
                    grdStockBook.RemoveRow();
                }
                else
                {   
                    grdStockBook.DeleteRow();
                }                              
            }
            else
            {
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

function Validate()
{   
    //---------------
    /*for( var i = 1; i < grdDetail.rows; i++)
    {
        //---------------        
        if ( Number(grdDetail.GetGridData(i, G1_Req_Qty)) == 0 )
        {
            alert("Input take in Qty. at " + i + ",pls!")
            return false;
        }
        //---------------
    }*/
    //----------------
    return true;
}

//==============================================================================
function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            if( Validate() )
            {
                flag='save';
                data_epbp00120_1.Call();                
            }            
        break;
        
        case 'Detail':        
            data_epbp00120_2.Call();
        break;
        
        case 'StockBook' :
            if ( radBook.value == 1 )
            {
                data_epbp00120_3.Call();
            }
            else
            {
            }    
        break;
    }
}

//==============================================================================

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G1_Cons_Qty || col == G1_WH_Book || col == G1_PO_Book || col == G1_Req_Qty_01 || col == G1_Req_Qty_02 || col == G1_U_P || col == G1_Amount )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
            if (dQuantiy >0)
            {
                grdDetail.SetGridText( row, col, parseFloat(dQuantiy+"").toFixed(2));
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
        if ( col == G1_Req_Qty_01 || col == G1_Req_Qty_02 || col == G1_U_P )
        {
            var dAmount;
            
            if ( lstPriceBy.value == '1' )
            {
                dAmount = Number(grdDetail.GetGridData( row, G1_Req_Qty_01 )) * Number(grdDetail.GetGridData( row, G1_U_P )) ;
            }
            else
            {
                dAmount = Number(grdDetail.GetGridData( row, G1_Req_Qty_02 )) * Number(grdDetail.GetGridData( row, G1_U_P )) ;
            }
            
            grdDetail.SetGridText( row, G1_Amount, parseFloat(dAmount+"").toFixed(2) ) ;
        }
        //------------------------
        TotalAmount();
    }
}
    
//====================================================

 function OnChangePriceBy()
 {
    var dAmount = 0 ;
    
    if ( lstPriceBy.value == '1' )
    { 
        for(var i=1 ; i<grdDetail.rows; i++)
        {
            dAmount = Number(grdDetail.GetGridData( i, G1_Req_Qty_01 )) * Number(grdDetail.GetGridData( i, G1_U_P )) ;                
            grdDetail.SetGridText( i, G1_Amount, parseFloat(dAmount+"").toFixed(2) ) ;        
        }
    }
    else
    {
        for(var i=1 ; i<grdDetail.rows; i++)
        {
            dAmount = Number(grdDetail.GetGridData( i, G1_Req_Qty_02 )) * Number(grdDetail.GetGridData( i, G1_U_P )) ;                
            grdDetail.SetGridText( i, G1_Amount, parseFloat(dAmount+"").toFixed(2) ) ;        
        }    
    }           
    //--------------
    TotalAmount();     
 }
 
//====================================================
function TotalAmount()
{ 
    //---------CALCULATE AMOUNT---------------- 
    var sumAmount = 0 ;

    for ( i=1; i<grdDetail.rows; i++ )
    {
        sumAmount = sumAmount + Number(grdDetail.GetGridData(i,G1_Amount));
    }

    txtAmount.text = sumAmount.toFixed(2)+"";
} 
//====================================================
 function OnReport()
 {
        if ( txtMasterPK.text != "" )
        { 
               var url =System.RootURL + '/standard/reports/ep/bp/epbp00120_YC.aspx?master_pk=' + txtMasterPK.text  ;
               System.OpenTargetPage(url);  
        }  
 }
 
//====================================================
 function OnProcess(pos)
 {
        switch (pos)
        {
                case 'SO_List' :
                    pro_epbp00120_2.Call();
                break;
                
                case 'Copy':
                     if ( txtMasterPK.text != '' )
                     {
                        pro_epbp00120_3.Call()
                     }else
                     {
                        alert('PLS SELECT SAVED MR !!!');
                     }        
                break;
                
                case 'Confirm' :
                    if ( txtMasterPK.text != '' )
                    {
                        pro_epbp00120.Call();
                    }
                    else
                    {
                        alert('PLS SELECT SAVED MR !!!');
                    }                
                break;                
        }
 } 
 //===================================================================================
 function OnChangeTab(pos)
 { 
    switch (pos)
    {
        case 'radBook' :
            var strRad = radBook.GetData();
                     
	        switch (strRad)
	        {
		        case '1':	
		            book_stock.style.color = "cc0000" ;	
		            book_po.style.color    = "" ;
		                
		            grdStockBook.style.display = ""; 
		            grdPOBook.style.display    = "none";		    
                break;
                
                case '2':
		            book_stock.style.color = "";	
		            book_po.style.color    = "cc0000";
		                
		            grdStockBook.style.display = "none"; 
		            grdPOBook.style.display    = "";	
                break;		        
            }               
        break;
        
        case 'radTab' :
            var strRad = radTab.GetData();
                     
	        switch (strRad)
	        {
		        case '1':		    
		            tab01.style.display = ""; 
		            tab02.style.display = "none";		    
                break;
                
                case '2':
		            tab01.style.display = "none"; 
		            tab02.style.display = "";	
                break;		        
            }             
        break;
    }    
 }

 //================================================================= 
</script>

<body>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00120" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso id="1" type="grid" user="prod" function="st_lg_sel_epbp00120" >
                <input  bind="grdSearch">
                    <input bind="txtMRNoSearch" />
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="lstStatusSearch" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00120_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="st_lg_sel_epbp00120_1" procedure="st_lg_upd_epbp00120_1">
                <input>
                    <inout bind="txtMasterPK" />
                    <inout bind="txtMRNo" />
                    <inout bind="dtDocDate" />
                    <inout bind="lstStatus" />
                    <inout bind="lstLine" />
                    <inout bind="txtStaffPK" />
                    <inout bind="txtStaffID" />
                    <inout bind="txtStaffName" />                    
                    <inout bind="txtArraySOPK" />                    
                    <inout bind="txtPONo" />      
                    <inout bind="txtDescription" />
                    <inout bind="lstOrg" />
                    <inout bind="lstDeliLoc" />
                    <inout bind="txtPLPK" />
                    <inout bind="txtPLName" />                                        
                    <inout bind="txtAmount" />
                </input>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00120_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="4" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" function="st_lg_sel_epbp00120_2" procedure="st_lg_upd_epbp00120_2"> 
                <input bind="grdDetail">
                    <input bind="txtMasterPK" />               
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00120_3" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="4" type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="st_lg_sel_epbp00120_3" procedure="st_lg_upd_epbp00120_3"> 
                <input bind="grdDetail">
                    <input bind="txtPOReqDPK" />               
                </input> 
                <output bind="grdStockBook" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="pro_epbp00120" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
             <dso id="1" type="process"  procedure="st_lg_pro_epbp00120"> 
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
    <gw:data id="datGetNewCode" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_new_commoncode" > 
                <input> 
                     <inout bind="txtMasterPK" />
                </input>
	           <output>
	                <output bind="txtCodeTemp" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_epbp00120_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="process"  procedure="st_lg_upd_epbp00120_3">
                <input> 
			        <input bind="txtMasterPK" />  		
			    </input> 
                <output>
                    <output bind="txtReturnValue" />
                    <output bind="txtReturnPK" />
                </output> 
            </dso>
        </xml>
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_epbp00120_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="process" procedure="st_lg_pro_epbp00120_2">
                <input> 
			        <input bind="txtArraySOPK" />  		
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
            <td id="left" style="width: 20%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 2%">
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
                    <tr style="height: 2%">
                        <td style="width: 20%; white-space: nowrap" align="right">
                            M/R No
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtMRNoSearch" styles="width: 100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 2%">
                        <td style="width: 20%" align="right">
                            Status
                        </td>
                        <td colspan="2">
                            <gw:list id="lstStatusSearch" styles="width: 100%" onchange="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|M/R Date|M/R No|P/O No" format="0|4|0|0" aligns="1|1|0|0"
                                defaults="|||" editcol="0|0|0|0" widths="0|1200|1200|0" styles="width:100%; height:100%"
                                sorting="T" oncellclick="OnSearch('grdMaster')" param="0,1,2,3" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 80%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            M/R No
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtMRNo" styles="width: 100%" csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 10%; white-space: nowrap">
                            M/R Date
                        </td>
                        <td style="width: 10%">
                            <gw:datebox id="dtDocDate" lang="<%=Application("Lang")%>" mode="01" />
                        </td>
                        <td align="right" style="width: 10%">
                            Status
                        </td>
                        <td style="width: 25%">
                            <gw:list id="lstStatus" styles="width: 100%" />
                        </td>
                        <td style="width: 5%">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="btnNewMST" img="new" alt="New" onclick="OnNew()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnCopy" img="copy" alt="Create The Same Request" onclick="OnCopy()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnDeleteMST" img="delete" alt="Delete" onclick="OnDelete('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSaveMST" img="save" alt="Save" onclick="OnSave('Master')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnConfirm" img="confirm" alt="Confirm" onclick="OnConfirm()" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="left" colspan="12">
                            <gw:radio id="radTab" value="1" styles="width:100%" onchange="OnChangeTab('radTab')">                      
                                <span id="tab_1" value="1">tab 1</span>                       
                                <span id="tab_2" value="2">tab 2</span>   			                                
		                    </gw:radio>
                        </td>
                    </tr>
                    <tr style="height: 1%" id="tab01">
                        <td colspan="12">
                            <table style="height: 100%; width: 100%; background-color: #CCFFFF">
                                <tr style="height: 30%">
                                    <td align="right" style="width: 10%">
                                        Line
                                    </td>
                                    <td style="width: 30%">
                                        <gw:list id="lstLine" styles="width:100%;" />
                                    </td>
                                    <td align="right" style="width: 10%">
                                        <a title="Charger" onclick="OnPopUp('Charger')" style="color: #0000ff; cursor: hand">
                                            <b>Charger</b></a>
                                    </td>
                                    <td align="right" style="width: 50%; white-space: nowrap">
                                        <gw:textbox id="txtStaffID" styles="width:20%" />
                                        <gw:textbox id="txtStaffName" styles="width:80%" />
                                        <gw:textbox id="txtStaffPK" styles="display:none" />
                                    </td>
                                </tr>
                                <tr style="height: 30%">
                                    <td align="right" style="width: 10%">
                                        P/O No
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtArraySOPK" styles="width: 100%;display: none" />
                                        <gw:textbox id="txtPONo" styles="width: 100%" />
                                    </td>
                                    <td align="right" style="width: 10%">
                                        Remark
                                    </td>
                                    <td style="width: 50%; white-space: nowrap">
                                        <gw:textbox id="txtDescription" styles="width:100%" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%" id="tab02">
                        <td colspan="12">
                            <table style="height: 100%; width: 100%; background-color: #CCFFFF">
                                <tr style="height: 30%">
                                    <td align="right" style="width: 10%">
                                        Organization
                                    </td>
                                    <td style="width: 30%">
                                        <gw:list id="lstOrg" styles="width:100%" />
                                    </td>
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                        <a title="Deli Location" onclick="OnPopUp('delivery')" style="color: #0000ff; cursor: hand">
                                            <b>Delivery Loc</b></a>
                                    </td>
                                    <td align="right" style="width: 40%" colspan="3">
                                        <gw:list id="lstDeliLoc" styles="width:100%;" />
                                    </td>
                                </tr>
                                <tr style="height: 30%">
                                    <td align="right" style="width: 10%; white-space: nowrap">
                                        <a title="PL" onclick="OnPopUp('PL')" style="color: #0000ff; cursor: hand"><b>P/L Center</b></a>
                                    </td>
                                    <td style="width: 30%">
                                        <gw:textbox id="txtPLName" styles="width: 100%" />
                                        <gw:textbox id="txtPLPK" styles="width: 100%;display: none" />
                                    </td>
                                    <td align="right" style="width: 10%">
                                        Price By
                                    </td>
                                    <td align="right" style="width: 20%">
                                        <gw:list id="lstPriceBy" styles='width:100%;' onchange="OnChangePriceBy()" />
                                    </td>
                                    <td align="right" style="width: 10%">
                                        Amount
                                    </td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtAmount" styles="width: 100%;color:Red" type="number" format="###,###,###.###" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="6" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%">
                            <gw:button id="idGetItem" img="popup" alt="Get Item" onclick="OnPopUp('FreeItem')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="idCreateItem" img="new" alt="Create Item" onclick="OnPopUp('CreateItem')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnDeleteDTL" img="delete" alt="Delete" onclick="OnDelete('Detail')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnUnDeleteDTL" img="UnDelete" alt="UnDelete" onclick="OnUnDelete()" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnReport" img="excel" alt="Print Request" onclick="OnReport()" />
                        </td>
                    </tr>
                    <tr style="height: 45%">
                        <td colspan="12">
                            <gw:grid id='grdDetail' header='_PK|_TPR_POREQ_PK|No|Group|_TCO_ITEM_PK|Item Code|Item Name|Cons Qty|W/H Book|P/O Book|Req Qty 01|UOM|_Req Qty 02|_UOM|U/P|Amount|Description|_REF_TABLE|_REF_PK'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|3|3|3|3|1|3|1|3|3|0|0|0'
                                defaults='||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|1|0|1|0|1|1|1|0|0'
                                widths='0|0|1000|1500|0|1500|2500|1200|1200|1200|1200|800|1200|800|1200|1200|1000|0|0'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)"
                                onclick="OnSearch('grdStockBook')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td>
                            <img alt="Booking Information" status="expand" id="imgInfo" src="../../../../system/images/down.gif"
                                style="cursor: hand;" onclick="OnToggle('2')" />
                        </td>
                        <td align="left" colspan="6">
                            <gw:radio id="radBook" value="1" styles="width:100%" onchange="OnChangeTab('radBook')">                      
                                <span id="book_stock" value="1">Stock Book</span>                       
                                <span id="book_po" value="2">P/O Book</span>   			                                
		                    </gw:radio>
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnProcess" img="process" alt="Set P/O for grid" onclick="OnProcess('SO_List')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnAddNew01" img="new" alt="Create Item" onclick="OnPopUp('StockBook')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnDelete01" img="delete" alt="Delete" onclick="OnDelete('StockBook')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnUnDelete01" img="UnDelete" alt="UnDelete" onclick="OnUnDelete('StockBook')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSave01" img="save" alt="Save" onclick="OnSave('StockBook')" />
                        </td>
                    </tr>
                    <tr style="height: 49%" id="info">
                        <td colspan="12">
                            <gw:grid id='grdStockBook' header='_PK|_TPR_POREQD_PK|_TCO_ITEM_PK|Item Code|Item Name|_TPR_LOTNO_PK|Lot No|Book Qty|UOM|_TIN_WAREHOUSE_PK|W/H ID|P/O No'
                                format='0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|1|3|1|0|0|0' defaults='|||||||||||'
                                editcol='0|0|0|0|0|0|0|1|0|0|0|1' widths='0|0|0|1500|3500|0|1500|1500|800|0|2000|2000'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)" />
                            <gw:grid id='grdPOBook' header='_PK|_TPR_POREQ_PK|No|Group|_TCO_ITEM_PK|Item Code|Item Name|Cons Qty|W/H Book|P/O Book|Req Qty 01|UOM|Req Qty 02|UOM|U/P|Amount|Description|_REF_TABLE|_REF_PK'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|3|3|3|3|1|3|1|3|3|0|0|0'
                                defaults='||||||||||||||||||' editcol='0|0|0|0|0|0|0|0|0|0|1|0|1|0|1|1|1|0|0'
                                widths='0|0|1000|1500|0|1500|2500|1200|1200|1200|1200|800|1200|800|1200|1200|1000|0|0'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
    <gw:textbox id="txtPOReqDPK" styles="width: 100%;display: none" />
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
    <!--------------------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle('1')" />
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtComCodeID" styles='width:100%;display:none' />
    <gw:textbox id="txtCodeTemp" styles='width:100%;display:none' />
    <gw:textbox id="txtUpperDept" styles='width:100%;display:none' />
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtReturnPK" styles="width: 100%;display: none" />
    <!--------------------------------------------------------------------------->
</body>
</html>
