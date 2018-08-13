<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Outgo Return Entry</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var G1_ST_OUTGO_RETURN_D_PK   = 0,
    G1_ST_OUTGO_RETURN_M_PK   = 1,
    G1_SEQ                    = 2,
    G1_REF_NO                 = 3,
    G1_REQ_ITEM_PK            = 4,
    G1_REQ_ITEM_CODE          = 5,
    G1_REQ_ITEM_NAME          = 6,
    G1_RETURN_ITEM_PK         = 7,
    G1_RETURN_ITEM_CODE       = 8,
    G1_RETURN_ITEM_NAME       = 9,    
    G1_REQ_QTY                = 10,
    G1_REQ_UOM                = 11,
    G1_RETURN_QTY             = 12,
    G1_RETURN_UOM             = 13, 
	G1_LOT_NO                 = 14,   
    G1_UNIT_PRICE             = 15,
    G1_ITEM_AMOUNT            = 16,
	G1_TAX_RATE				  = 17,
	G1_TAX_AMOUNT             = 18,
	G1_TOTAL_AMOUNT           = 19,	
    G1_REMARK                 = 20,
    G1_RTN_REQ_PK             = 21,
	G1_INCOME_D_PK			  = 22;

var flag ;
var arr_FormatNumber = new Array();  
//====================================================================================
function BodyInit()
{
    System.Translate(document); 
	
	txtEmpPK.text   = "<%=Session("EMPLOYEE_PK")%>"  ;
	txtUser_PK.text = "<%=session("USER_PK")%>";
	   
    txtChargerName.SetEnable(false);
    txtPartnerName.SetEnable(false);
    txtPLName.SetEnable(false);
    
    SetGridFormat();
	
    pro_bias00060_lst.Call();
	
    OnToggleGrid();
 }

//====================================================================================
 function SetGridFormat()
 { 
    var ldate;    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    
	//--------------------------------------
    var data="";
	//--------------------------------------
    data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
    lstCurrency.SetDataText(data);
	
    data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGIN0306') FROM DUAL" )%>||";    
    lstSlipType.SetDataText(data); 
	lstSlipType.value = ""; 	
	//--------------------------------------------
	 
    var ctrl = grdDetail.GetGridControl(); 
    
    ctrl.ColFormat(G1_REQ_QTY)     = "#,###,###,###,###,###.##";
    ctrl.ColFormat(G1_RETURN_QTY)  = "#,###,###,###,###,###.##";
    ctrl.ColFormat(G1_UNIT_PRICE)  = "#,###,###,###,###,###.##";
    ctrl.ColFormat(G1_ITEM_AMOUNT) = "#,###,###,###,###,###.##";
	ctrl.ColFormat(G1_TAX_RATE)    = "#,###,###,###,###,###";
	ctrl.ColFormat(G1_TAX_AMOUNT)  = "#,###,###,###,###,###.##";
	ctrl.ColFormat(G1_TOTAL_AMOUNT)= "#,###,###,###,###,###.##";
    
    arr_FormatNumber[G1_RETURN_QTY]  = 2;
    arr_FormatNumber[G1_UNIT_PRICE]  = 2;
    arr_FormatNumber[G1_ITEM_AMOUNT] = 2;
	arr_FormatNumber[G1_TAX_RATE] 	 = 0;
	arr_FormatNumber[G1_TAX_AMOUNT]  = 2;
	arr_FormatNumber[G1_TOTAL_AMOUNT]= 2;
 }
//====================================================================================
function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("img1"); 

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
        right.style.width="70%";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
}
//====================================================================================
function OnToggleGrid()
{
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";

		grdDetail.GetGridControl().ColHidden(G1_REQ_ITEM_CODE) = true ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_ITEM_NAME) = true ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_QTY)       = true ;
		grdDetail.GetGridControl().ColHidden(G1_REQ_UOM)       = true ;
		grdDetail.GetGridControl().ColHidden(G1_UNIT_PRICE)    = true ;
		grdDetail.GetGridControl().ColHidden(G1_ITEM_AMOUNT)   = true ;
		grdDetail.GetGridControl().ColHidden(G1_TAX_RATE)      = true ;
		grdDetail.GetGridControl().ColHidden(G1_TAX_AMOUNT)    = true ;
		grdDetail.GetGridControl().ColHidden(G1_TOTAL_AMOUNT)  = true ;
				
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
		grdDetail.GetGridControl().ColHidden(G1_UNIT_PRICE)    = false ;
		grdDetail.GetGridControl().ColHidden(G1_ITEM_AMOUNT)   = false ;
		grdDetail.GetGridControl().ColHidden(G1_TAX_RATE)      = false ;
		grdDetail.GetGridControl().ColHidden(G1_TAX_AMOUNT)    = false ;
		grdDetail.GetGridControl().ColHidden(G1_TOTAL_AMOUNT)  = false ;
						
		
        imgMaster.src = "../../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}
//====================================================================================
 
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_bias00060.Call('SELECT');
        break;
        
        case 'Master':
            if(grdSearch.rows>1)
            {
                txtMasterPK.text = grdSearch.GetGridData(grdSearch.row, 0);
                flag = 'view' ;
                data_bias00060_1.Call('SELECT');
            }
        break;
    }
}
//====================================================================================


function OnAddNew()
{             
    data_bias00060_1.StatusInsert();    
    txtSlipNo.text   = '***New Voucher***';
    //-------------------------------------------
    txtChargerName.text = "<%=Session("USER_NAME")%>";
    txtChargerPK.text   = "<%=Session("EMPLOYEE_PK")%>";
    //------------------------------------------- 
    grdDetail.ClearData(); 
    flag = "view";
}
//====================================================================================

function OnSave(pos)
{   
    switch(pos)
    { 
        case 'Master':
            flag = "save";      
            data_bias00060_1.Call();                            
        break;
		
        //----------------
        case 'Detail':
            data_bias00060_2.Call();
        break;
    }    
}
//====================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_bias00060_1":   
            if(flag == "save")
            {
                for(var i=1; i < grdDetail.rows;i++)
                {
                        if ( grdDetail.GetGridData( i, G1_ST_OUTGO_RETURN_M_PK) == '' )
                        {
                            grdDetail.SetGridText( i, G1_ST_OUTGO_RETURN_M_PK, txtMasterPK.text);
                        } 
                }
                data_bias00060_2.Call();
            }
            else
            {
                data_bias00060_2.Call('SELECT');
            }
        break;  
        case "data_bias00060": 
            if(grdSearch.rows > 1)
            { 
				lbSearchRecords.text = grdSearch.rows -1;
            }
        break;   
        case "data_bias00060_2":   
            if(grdDetail.rows > 1)
            {
				lblRowCount.text = grdDetail.rows -1 ;
                grdDetail.SetCellBold( 1, G1_RETURN_ITEM_CODE, grdDetail.rows - 1, G1_RETURN_ITEM_CODE, true);
                grdDetail.SetCellBold( 1, G1_RETURN_QTY      , grdDetail.rows - 1, G1_RETURN_QTY      , true);
                
                grdDetail.SetCellBgColor( 1, G1_REQ_ITEM_CODE , grdDetail.rows - 1, G1_REQ_ITEM_NAME , 0xCCFFFF );
				grdDetail.SetCellBgColor( 1, G1_TOTAL_AMOUNT ,  grdDetail.rows - 1, G1_TOTAL_AMOUNT ,  0xCCFFFF );
                
                for ( var i = 1 ; i < grdDetail.rows ; i++)
                {
                    if ( Number(grdDetail.GetGridData( i, G1_REQ_ITEM_PK)) > 0 && ( grdDetail.GetGridData( i, G1_REQ_ITEM_PK) != grdDetail.GetGridData( i, G1_RETURN_ITEM_PK) ) )
                    {
                        grdDetail.GetGridControl().Cell( 7, i, G1_RETURN_ITEM_CODE, i, G1_RETURN_ITEM_NAME ) = 0x3300cc;
                    }                    
                }                 
            }
            flag = "view";
        break;            
        //--------------------
        case 'pro_bias00060':
            alert(txtReturnValue.text);
            OnSearch('Master');
        break;  
        //--------------------
        case 'pro_bias00060_1':
             alert(txtReturnValue.text);
        break;     
        
        case 'pro_bias00060_lst':
        
            lstReWH.SetDataText(txtWHStr.text);
            lstWH.SetDataText(txtWHStr.text +"||");
            lstWH.value ='';

            OnAddNew();
        break; 
				
		case 'data_fpab00220_2':
			 if ( txtLGGroupCodeID.text == 'LGIN0306')
			 {
				 lstSlipType.SetDataText(txtLGCodeList.text);
				 lstSlipType.value = rtnLGCode;
			 }
		break;
    }
} 
//====================================================================================
function OnPopUp(obj)
{
    switch(obj)
    {
	
		case 'WAREHOUSE':
            var path = System.RootURL + '/standard/forms/fp/ab/fpab00240.aspx' ;
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                lstReWH.value = obj[0];                 
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
        //---------------------------
        case 'Partner':
            var path = System.RootURL + "/standard/forms/fp/ab/fpab00120.aspx?partner_type=AP";
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtPartnerName.text = obj[2];
                txtPartnerPK.text   = obj[0];
            }
        break; 
        //----------------------------
        case 'PL': 
            fpath  = System.RootURL + "/standard/forms/fp/ab/fpab00380.aspx";
            oValue = System.OpenModal( fpath , 800 , 400 , 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {
                txtPLPK.text   = oValue[6]; 
                txtPLName.text = oValue[2] + ' - ' + oValue[5] ;
            }
        break;
        //------------------------
        case 'Request':
                     var path = System.RootURL + '/standard/forms/bi/as/bias00061.aspx';
                     var object = System.OpenModal( path ,1000 , 600 ,  'resizable:yes;status:yes',this);
                     
                     if ( object != null )
                     {
                            var arrTemp;
	                        //-----------------                  
                            for ( var i=0; i< object.length; i++)
                            {
                               var arrTemp = object[i];
                                
                               grdDetail.AddRow();        
                               
                               grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ                   , grdDetail.rows-1);
                               grdDetail.SetGridText( grdDetail.rows-1, G1_ST_OUTGO_RETURN_D_PK  , ""); //master_pk
                               
                               grdDetail.SetGridText( grdDetail.rows-1, G1_ST_OUTGO_RETURN_M_PK  , txtMasterPK.text);
                               grdDetail.SetGridText( grdDetail.rows-1, G1_REF_NO                , arrTemp[3]);
                               grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_PK           , arrTemp[4]);
                               grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_CODE             , arrTemp[5]);    
                               grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_NAME             , arrTemp[6]);
                               
                               grdDetail.SetGridText( grdDetail.rows-1, G1_RETURN_ITEM_PK        , arrTemp[4]);
                               grdDetail.SetGridText( grdDetail.rows-1, G1_RETURN_ITEM_CODE      , arrTemp[5]);    
                               grdDetail.SetGridText( grdDetail.rows-1, G1_RETURN_ITEM_NAME      , arrTemp[6]);
                                
                               grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_QTY               , arrTemp[7]);
                               grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_UOM               , arrTemp[8]);
                               grdDetail.SetGridText( grdDetail.rows-1, G1_RETURN_QTY            , arrTemp[7]);
                               grdDetail.SetGridText( grdDetail.rows-1, G1_RETURN_UOM            , arrTemp[8]);
                                                         
                               grdDetail.SetGridText( grdDetail.rows-1, G1_LOT_NO                , arrTemp[9]);
                               grdDetail.SetGridText( grdDetail.rows-1, G1_REMARK           , arrTemp[10]); 
                            }             
                     }              
        break;
		//----------------------------
        case 'INCOME':
                 var path = System.RootURL + '/standard/forms/bi/as/bias00066.aspx?p_wh_pk=' + lstReWH.value ;
                 var object = System.OpenModal( path ,900 , 500 ,  'resizable:yes;status:yes');
				 
                 if ( object != null )
                 {                    
                        var arrTemp;
                        for( var i=0; i < object.length; i++)	  
                        {	
                                arrTemp = object[i];
                                    
                                grdDetail.AddRow();                            
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ              , grdDetail.rows-1);
								
								grdDetail.SetGridText( grdDetail.rows-1, G1_INCOME_D_PK      , arrTemp[3] );
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G1_REF_NO  		 , arrTemp[2]);
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G1_RETURN_ITEM_PK   , arrTemp[5]); 
                                grdDetail.SetGridText( grdDetail.rows-1, G1_RETURN_ITEM_CODE , arrTemp[6]);      
                                grdDetail.SetGridText( grdDetail.rows-1, G1_RETURN_ITEM_NAME , arrTemp[7]);      
                                grdDetail.SetGridText( grdDetail.rows-1, G1_RETURN_UOM       , arrTemp[8]);  

								grdDetail.SetGridText( grdDetail.rows-1, G1_UNIT_PRICE       , arrTemp[12]);
								grdDetail.SetGridText( grdDetail.rows-1, G1_INCOME_D_PK      , arrTemp[3] );

								txtPartnerPK.text 	= arrTemp[13];
								txtPartnerName.text = arrTemp[14]; 
								txtRefNo.text       = arrTemp[2] ;  
								
                        }
                 }              
        break;  
        //----------------------------
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
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ                   , grdDetail.rows-1);
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G1_ST_OUTGO_RETURN_M_PK  , txtMasterPK.text); //master_pk	    	                                               
                                                                
                                grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_PK           , arrTemp[0]);
                                grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_CODE         , arrTemp[1]);    
                                grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_NAME         , arrTemp[2]);
                                grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_UOM               , arrTemp[5]);
                                
                                grdDetail.SetGridText( grdDetail.rows-1, G1_RETURN_ITEM_PK        , arrTemp[0]); 
                                grdDetail.SetGridText( grdDetail.rows-1, G1_RETURN_ITEM_CODE      , arrTemp[1]);      
                                grdDetail.SetGridText( grdDetail.rows-1, G1_RETURN_ITEM_NAME      , arrTemp[2]);      
                                grdDetail.SetGridText( grdDetail.rows-1, G1_RETURN_UOM            , arrTemp[5]);                                                                            
                        }
                 }              
        break;  
        //------------------------------
        case 'Stock':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00410.aspx?group_type=Y|Y|Y|Y|Y|Y&warehouse=' + lstReWH.value ;
             var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
             if ( object != null )
             {
                    var arrTemp
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ                   , grdDetail.rows-1);                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ST_OUTGO_RETURN_M_PK  , txtMasterPK.text); //master_pk	 
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_PK           , arrTemp[3]);
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_CODE         , arrTemp[4]);    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_ITEM_NAME         , arrTemp[5]);
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_QTY               , arrTemp[7]);
                            grdDetail.SetGridText( grdDetail.rows-1, G1_REQ_UOM               , arrTemp[6]);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_RETURN_ITEM_PK        , arrTemp[3]); 
                            grdDetail.SetGridText( grdDetail.rows-1, G1_RETURN_ITEM_CODE      , arrTemp[4]);      
                            grdDetail.SetGridText( grdDetail.rows-1, G1_RETURN_ITEM_NAME      , arrTemp[5]);   
                            grdDetail.SetGridText( grdDetail.rows-1, G1_RETURN_QTY            , arrTemp[7]);   
                            grdDetail.SetGridText( grdDetail.rows-1, G1_RETURN_UOM            , arrTemp[6]);                                          
                            grdDetail.SetGridText( grdDetail.rows-1, G1_LOT_NO                , arrTemp[10]);
                    }		            
            }        
        break;      
        
        case 'Report':			 
			 if( txtMasterPK.text != "" )
	        {
		        var path = System.RootURL + '/standard/forms/bi/as/bias00062.aspx';
		        var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
 	        }
	        else
	        {
		        alert("Please, select one slip no to print!");
	        }	
		break;  
		
		
		case 'Slip-Type':
			 var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGIN0306";
	         var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes'); 

	         if ( object != null )
	         {	        	                   
	            if ( object[0] == 1 )
	            {
	                txtLGGroupCodeID.text = 'LGIN0306';
	                rtnLGCode             = object[1];
	                
                    data_fpab00220_2.Call("SELECT");                                
	            }
	            else
	            {
	                lstSlipType.value = object[1];      
	            }    	                
	         }   
		break;                
    }
}
//====================================================================================
function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdDetail" :
            
                var event_col = event.col ;
                var event_row = event.row ;

                 if ( event_col == G1_REQ_UOM )
                 {
                       var path = System.RootURL + '/standard/forms/fp/ab/fpab00230.aspx';
	                   var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                   if ( obj != null )
	                   {
	                        grdDetail.SetGridText( event_row, event_col, obj[1]);
	                   }	
                 }
                 //-------------------------
                 if ( event_col == G1_RETURN_UOM )
                 {
                       var path = System.RootURL + '/standard/forms/fp/ab/fpab00230.aspx';
	                   var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                   if ( obj != null )
	                   {
	                        grdDetail.SetGridText( event_row, event_col, obj[1]);
	                   }	
                 } 
                 //------------------------
                if ( event_col == G1_RETURN_ITEM_CODE || event_col == G1_RETURN_ITEM_NAME )
                 {
                       var path = System.RootURL + '/standard/forms/fp/ab/fpab00110.aspx?group_type=||Y|Y||';
                       var object = System.OpenModal( path , 800 , 600,  'resizable:yes;status:yes');
                       
                       if ( object != null )
                       {
                            grdDetail.SetGridText( event_row, G1_RETURN_ITEM_PK  ,   object[0] );
                            grdDetail.SetGridText( event_row, G1_RETURN_ITEM_CODE,   object[1] );
                            grdDetail.SetGridText( event_row, G1_RETURN_ITEM_NAME,   object[2] );
                       }                       
                 }                                 
            break;             
      }         
}
//====================================================================================
function OnDelete(obj)
{
    if(obj == "Master")
    {
        if(confirm('Do you want to delete this request?'))
        {
            flag = 'delete';
            data_bias00060_1.StatusDelete();
            data_bias00060_1.Call();
        }        
    }
    if(obj == "Detail")
    {
        if(confirm('Do you want to delete this Item?'))
        {
                if ( grdDetail.GetGridData( grdDetail.row, G1_ST_OUTGO_RETURN_D_PK ) == '' )
                {
                    grdDetail.RemoveRow();
                }
                else
                {  
                    grdDetail.DeleteRow();
                }    
        }        
    }
}
//====================================================================================
function OnUnDelete()
{
    grdDetail.UnDeleteRow();
}
//====================================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Confirm' :
            if ( confirm('Do you want to submit this Slip?'))
            {
                pro_bias00060.Call();
            }               
        break;
		
        case 'InCome':
             if ( txtMasterPK.text != '' )
            {
                if ( confirm('Do you want to make Incoming slip?'))
                {
                    pro_bias00060_1.Call();
                } 
            }         
        break;
    }
}
//========================================
function TotalAmount()
{ 
    //---------CALCULATE AMOUNT---------------- 
    var sumAmount = 0 ;

    for ( i=1; i<grdDetail.rows; i++ )
    {
        sumAmount = sumAmount + Number(grdDetail.GetGridData(i, G1_TOTAL_AMOUNT));
    }

    txtAmount.text = System.Round( sumAmount, 3) ;
} 
//===================================================================================================

function CheckInput()
{
      var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G1_RETURN_QTY || col == G1_UNIT_PRICE || col == G1_ITEM_AMOUNT || col == G1_TAX_RATE || col == G1_TAX_AMOUNT || col == G1_TOTAL_AMOUNT )
    {
         var dQuantity ;
        
        dQuantity =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantity))
        {   
            grdDetail.SetGridText( row, col, System.Round( dQuantity, arr_FormatNumber[col] ));
        }
		else
        {
            grdDetail.SetGridText(row,col,"") ;
        }
		//-----------------
       	if ( col == G1_RETURN_QTY || col == G1_UNIT_PRICE || col == G1_TAX_RATE )
        {
            dQuantiy = grdDetail.GetGridData( row, G1_RETURN_QTY) ;
            dPrice   = grdDetail.GetGridData( row, G1_UNIT_PRICE) ;
            
            var dAmount = dQuantiy * dPrice;
            
            grdDetail.SetGridText( row, G1_ITEM_AMOUNT, System.Round( dAmount, arr_FormatNumber[G1_ITEM_AMOUNT] ));
            
            var dVATAmount = 0 , dTotalAmount = 0 ;
            
            dVATAmount   = Number(grdDetail.GetGridData( row, G1_ITEM_AMOUNT )) * Number(grdDetail.GetGridData( row, G1_TAX_RATE )) / 100 ;                
            grdDetail.SetGridText( row, G1_TAX_AMOUNT, System.Round( dVATAmount, arr_FormatNumber[G1_TAX_AMOUNT] ) ) ;
            
            dTotalAmount = Number(grdDetail.GetGridData( row, G1_ITEM_AMOUNT )) + Number(grdDetail.GetGridData( row, G1_TAX_AMOUNT )) ;
            grdDetail.SetGridText( row, G1_TOTAL_AMOUNT, System.Round( dTotalAmount, arr_FormatNumber[G1_TOTAL_AMOUNT] ) ) ;               
        } 
        else if ( col == G1_ITEM_AMOUNT )
        {
            var dVATAmount   = Number(grdDetail.GetGridData( row, G1_ITEM_AMOUNT )) * Number(grdDetail.GetGridData( row, G1_TAX_RATE )) / 100 ;                
            grdDetail.SetGridText( row, G1_TAX_AMOUNT, System.Round( dVATAmount, arr_FormatNumber[G1_TAX_AMOUNT] ) ) ;
			
            var dTotalAmount = Number(grdDetail.GetGridData( row, G1_ITEM_AMOUNT )) + Number(grdDetail.GetGridData( row, G1_TAX_AMOUNT )) ;
            grdDetail.SetGridText( row, G1_TOTAL_AMOUNT, System.Round( dTotalAmount, arr_FormatNumber[G1_TOTAL_AMOUNT] ) ) ;         
        }
        else if ( col == G1_TAX_AMOUNT )
        {
            var dTotalAmount = Number(grdDetail.GetGridData( row, G1_ITEM_AMOUNT )) + Number(grdDetail.GetGridData( row, G1_TAX_AMOUNT )) ;
            grdDetail.SetGridText( row, G1_TOTAL_AMOUNT, System.Round( dTotalAmount, arr_FormatNumber[G1_TOTAL_AMOUNT] ) ) ;         
        }
            
        TotalAmount();  
    }
}

//===================================================================================================
function OnReport(para)
{
    switch(para)
    {
        case '0':
           // var url =System.RootURL + '/reports/bi/as/rpt_bias00060.aspx?master_pk=' + txtMasterPK.text ;
            var url =System.RootURL + '/reports/bi/as/rpt_bias00060_ST01.aspx?master_pk=' + txtMasterPK.text ;
	        window.open(url, "_blank"); 
        break;
    }
}

//===================================================================================================

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
    <!------------------------------------------------------------------->
    <gw:data id="data_bias00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="st_lg_sel_bias00060" > 
                <input>                     
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="txtVoucherSearch" />
                    <input bind="lstWh" />
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="pro_bias00060_lst" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_bias00060_lst" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="txtWHStr" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_bias00060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16" function="st_lg_sel_bias00060_1"  procedure="st_lg_upd_bias00060_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="lstReWH" />
                     <inout  bind="dtReDate" />  
                     <inout  bind="txtRefNo" />                         
                     <inout  bind="txtChargerPK" />
                     <inout  bind="txtChargerName" />
                     <inout  bind="txtRemark" />
                     <inout  bind="txtPartnerPK" />
                     <inout  bind="txtPartnerName" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="txtPLPK" />
                     <inout  bind="txtPLName" />
                     <inout  bind="lblStatus" />
                     <inout  bind="txtAmount" /> 
                     <inout  bind="lstCurrency" />  
                     <inout  bind="txtExRate" /> 
					 <inout  bind="lstSlipType" />  
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="data_bias00060_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22" function="st_lg_sel_bias00060_2" procedure="st_lg_upd_bias00060_2"> 
                <input> 
                    <input bind="txtMasterPK" />                
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bias00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bias00060" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="pro_bias00060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bias00060_1" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
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
                            <td><gw:button img="search" alt="Search" onclick="OnSearch('grdSearch')" /></td>
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
											~ <gw:datebox id="dtTo" lang="1" />
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            W/H
                                        </td>
                                        <td colspan="2">
                                            <gw:list id="lstWH" styles='width:100%' csstype="mandatory" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>                          
							                Slip No
                                        </td>
                                        <td colspan="2">                            
							                <gw:textbox id="txtVoucherSearch" styles="width:100%" onenterkey="OnSearch('grdSearch')" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 96%">
                            <td colspan="4" style="height:100%" class="eco_line_t">
                                <gw:grid id="grdSearch" header="_PK|Status|Slip No|Date|Partner" format="0|0|0|4|0"
                                aligns="0|1|0|1|0" defaults="|||||" editcol="0|0|0|0|0" widths="0|1200|1500|1200|1000"
                                styles="width:100%; height:100%" sorting="T" oncellclick="OnSearch('Master')" />
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
										<td align="left"> 
											<img status="expand" id="img1" src="../../../../system/images/button/previous.gif" style="cursor: hand"
													onclick="OnToggle()" />
										</td>
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
                                        <td>
											<gw:button id="idBtnSubmit" img="submit" text="Submit" onclick="OnProcess('Confirm')" />
										</td>
										
										<td>
											<gw:button id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew()" />
										</td>
										<td>
											<gw:button id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" />
										</td>
										<td>
											<gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
										</td>
										<td>
											<gw:button id="btnPrint" img="excel" alt="Report" text="Report" onclick="OnPopUp('Report')" />
										</td>
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
                                            <gw:datebox id="dtReDate" lang="1" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" class="eco_link"><b>Charger</b></a>
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
                                           <a title="Slip-Type" onclick="OnPopUp('Slip-Type')" href="#tips" style="color: #0000ff">
											<b>Slip Type</b></a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="lstSlipType" styles="width:100%" onchange="" />
                                        </td>
                                    </tr>
									<tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                            W/H
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="lstReWH" styles='width:100%' csstype="mandatory" />
                                        </td>
                                        <td align="right">
											Ref No
										</td>
										<td style="width: 40%" colspan="3">
											<gw:textbox id="txtRefNo" csstype="mandatory" styles="width:100%;" />
										</td>
                                    </tr>
									<tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                            <a title="Charger" onclick="OnPopUp('Partner')" href="#tips" class="eco_link"><b>
											Partner</b></a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtPartnerName" styles="width:100%" />
											<gw:textbox id="txtPartnerPK" styles="display:none" />
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
                                            Description
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtRemark" styles="width:100%;" />
                                        </td>
                                        <td align="right">
											
										</td>
										<td style="width: 40%" colspan="3">
											
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
                                        <td> </td>
                                        <td style="width:100px"></td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td align="right">
                                <table style="height:100%">
                                    <tr>
                                        <td style="width: 10%" align="left" colspan="6">
											<img status="expand" id="imgMaster" alt="Show all column" src="../../../../system/images/close_popup.gif"
                                            style="cursor: hand" onclick="OnToggleGrid()" />
										</td>
										<td  >
											<gw:button id="idBtnStock" img="popup" text="Stock" onclick="OnPopUp('Stock')" />
										</td>
										<td  >
											<gw:button id="idBtnFreeItem" img="item" text="Item" onclick="OnPopUp('FreeItem')" />
										</td>
										<td  >
											<gw:button id="idBtnRequest" img="popup" text="Request" onclick="OnPopUp('Request')" />
										</td>
										<td >
											<gw:button id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Detail')" />
										</td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height:96%;">
                            <td colspan="3" valign="top" class="eco_line_t">
                                <gw:grid id='grdDetail' 
								header='_d_pk|_m_pk|Seq|Ref No|_req_item_pk|Req Item Code|Req Item Name|_return_item_pk|Item Code|Item Name|Req Qty|UOM|Rtn Qty|UOM|Lot No|U/Price|Item Amt|Tax (%)|Tax Amt|Total Amt|Remark|_return_req_pk|_INCOME_D_PK'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|1|0|0|0|0|0|0|0|3|1|3|1|1|3|3|3|3|3|0|0|0'
                                check='||||||||||||||||||||||' 							 
								editcol='0|0|0|0|0|0|0|0|0|0|0|0|1|0|1|1|1|1|1|1|1|0|0'
                                widths='0|0|800|1500|0|1500|3500|0|1500|3500|1500|800|1500|800|1500|1200|1500|1200|1500|1500|1000|0|0'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick='OnGridCellDoubleClick(this)' />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="display:none"></gw:textbox>
    <gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
    <!------------------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
    <gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
    <gw:textbox id="txtWHStr" styles="width: 100%;display: none" />
    <!------------------------------------------------------------------->
	<gw:textbox id="txtLGCodeList" styles='display:none;width:100%' />
	<gw:textbox id="txtLGGroupCodeID" styles='display:none;width:100%' />
	<gw:checkbox id="chkUser" styles="color:blue;display:none" defaultvalue="Y|N" value="N" onchange="OnSearch('grdSearch')" />
	<gw:textbox id="txtPLPK" styles="display:none" />
    <gw:textbox id="txtPLName" styles="width:100%;display:none" />
	<gw:textbox id="txtAmount" styles="width:100%;display:none" type="number" format="#,###.###" csstype="mandatory" />
	<!------------------------------------------------------------------->
</body>
</html>
