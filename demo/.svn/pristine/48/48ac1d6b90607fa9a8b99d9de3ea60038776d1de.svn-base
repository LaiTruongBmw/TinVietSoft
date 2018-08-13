<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>STOCK ADJUST OUT</title>
</head>

<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script language="javascript" type="text/javascript">
//-----------------------------------------------------

var flag;

var G_PK      = 0,
	G_SLIP_NO = 1,
	G_STATUS  = 3;
//---------------------------------------------------------
var G1_DETAIL_PK    = 0, 
    G1_MASTER_PK    = 1,
    G1_SEQ          = 2,
	G1_REF_NO       = 3,
    G1_ITEM_PK      = 4,
    G1_ITEM_CODE    = 5,
    G1_ITEM_NAME    = 6,
    G1_UOM          = 7,
    G1_LOT_NO       = 8,
	G1_BEGIN_QTY	= 9,
	G1_BEGIN_AMOUNT	= 10,
	G1_IN_QTY		= 11,
	G1_IN_AMOUNT	= 12,
	G1_OUT_QTY		= 13,
	G1_OUT_AMOUNT	= 14,
	G1_STOCK_QTY    = 15,
    G1_STOCK_AMOUNT = 16,
    G1_CHECK_QTY    = 17,
    G1_CHECK_AMOUNT = 18,
    G1_ADJUST_QTY   = 19,
    G1_ADJUST_AMOUNT= 20,
    G1_REMARK       = 21;   
	
var arr_FormatNumber = new Array(); 
//===================================================================================
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
    right.style.width="70%";
    imgArrow.src = "../../../../system/images/button/previous.gif";
    }
}

//===================================================================================

function BodyInit()
{  
    System.Translate(document);  // Translate to language session    
	
	
    txtUser_PK.text = "<%=Session("USER_PK")%>";
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
    //----------  
    txtChargerName.SetEnable(false);
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    //----------------------------
   
    BindingDataList(); 
	
    dso_wh_list.Call();
    //----------------------------
    
	OnToggleGrid();
    OnAddNew('Master');
 }
 
 //======================================================================================
 
 function BindingDataList()
 {  
     var data ;
     
     data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id||' * ' || wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn = 'Y' ORDER BY wh_name  ASC" )%>";    
     lstWarehouse.SetDataText(data);
     
     data = data + '||' ;
     lstWHSearch.SetDataText(data);
     lstWHSearch.value = '' ;      
      
     data = "DATA|10|10 * PARTIAL ADJUST (W/O AMOUNT)|20|20 * ITEM OUT OF LIST = 0 (W/O AMOUNT)|21|21 * ITEM OUT OF LIST = STOCK (W/O AMOUNT)|30|30 * PARTIAL ADJUST (WITH AMOUNT)|40|40 * ITEM OUT OF LIST = 0 (WITH AMOUNT)";    
     lstLoadType.SetDataText(data);
     lstLoadType.value = "10";
	 
	 data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
     lstCurrency.SetDataText(data);   
     //-----------------------  
     
     var ctrl = grdDetail.GetGridControl(); 
    
     ctrl.ColFormat(G1_BEGIN_QTY)     = "#,###,###,###,###,###.##";
	 ctrl.ColFormat(G1_BEGIN_AMOUNT)  = "#,###,###,###,###,###.##";
	 ctrl.ColFormat(G1_IN_QTY)        = "#,###,###,###,###,###.##";
	 ctrl.ColFormat(G1_IN_AMOUNT)     = "#,###,###,###,###,###.##";
	 ctrl.ColFormat(G1_OUT_QTY)       = "#,###,###,###,###,###.##";
	 ctrl.ColFormat(G1_OUT_AMOUNT)    = "#,###,###,###,###,###.##";
     ctrl.ColFormat(G1_STOCK_QTY)     = "#,###,###,###,###,###.##";
     ctrl.ColFormat(G1_STOCK_AMOUNT)  = "#,###,###,###,###,###.##";
     ctrl.ColFormat(G1_CHECK_QTY)     = "#,###,###,###,###,###.##";
     ctrl.ColFormat(G1_CHECK_AMOUNT)  = "#,###,###,###,###,###.##";
     ctrl.ColFormat(G1_ADJUST_QTY)    = "#,###,###,###,###,###.##";        
     ctrl.ColFormat(G1_ADJUST_AMOUNT) = "#,###,###,###,###,###.##";    

	arr_FormatNumber[G1_STOCK_QTY]    	= 2;
	arr_FormatNumber[G1_STOCK_AMOUNT] 	= 2;
		
	arr_FormatNumber[G1_CHECK_QTY]    	= 2;
	arr_FormatNumber[G1_CHECK_AMOUNT] 	= 2;
	
	arr_FormatNumber[G1_ADJUST_QTY]   	= 2;
	arr_FormatNumber[G1_ADJUST_AMOUNT]	= 2;
 }
 
 //======================================================================================
  
function OnAddNew(pos)
{
    switch (pos)
    {   
        case 'Master' :         
            data_bisa00020_1.StatusInsert();
             
			txtSlipNo.text = "<< New Slip >>";
            //-------------------------------------------
            txtChargerName.text = "<%=Session("USER_NAME")%>";
            txtChargerPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            
            flag = "view"; 
        break;
            
        case 'Detail' :         
            grdDetail.AddRow();
        break;              
            
        case 'FreeItem':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00070.aspx?group_type=|Y|||Y|Y';
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {
                    var arrTemp
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1 ); //master_pk	  
                             
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_PK, 	 arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE,   arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME,   arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_UOM,         arrTemp[5]);//item_uom                                                       
                    }		            
             }        
        break;  

		case 'StockItem':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00410.aspx?group_type=Y|Y|Y|Y|Y|Y&warehouse=' + lstWarehouse.value ;
             var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {
                    var arrTemp
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1 ); //master_pk	  
                             
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_PK, 	arrTemp[3] );//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE,  arrTemp[4] );//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME,  arrTemp[5] );//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_UOM,        arrTemp[6] );//item_uom
							grdDetail.SetGridText( grdDetail.rows-1, G1_LOT_NO,		arrTemp[10]);//lot no							 		
                    }		            
             }        
        break; 
    }         
}  

//=====================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdVouchers':
            data_bisa00020.Call("SELECT");
        break;
    
        case 'Master':
        
            if ( data_bisa00020_1.GetStatus() == 20 && grdDetail.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdVouchers.row > 0 )
                    {
                        txtMasterPK.text = grdVouchers.GetGridData( grdVouchers.row, G_PK );
                    }
                    flag = 'view' ;
                    data_bisa00020_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdVouchers.row > 0 )
                {
                    txtMasterPK.text = grdVouchers.GetGridData( grdVouchers.row, G_PK );
                }
                flag = 'view' ;
                data_bisa00020_1.Call("SELECT");    
            }                            
        break;
        
        case 'grdDetail':            
            data_bisa00020_2.Call("SELECT");
        break;
    }
}

//===============================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
		case "data_bisa00020" :
			for (var i = 1; i<grdVouchers.rows; i++)   
            {
				var l_status = grdVouchers.GetGridData( i, G_STATUS );
				   
				if ( l_status == "2" )//Submit
                {
                    grdVouchers.SetCellBgColor( i, G_SLIP_NO , i, G_SLIP_NO , 0xCCFFFF ); // vang
                }  
                else if ( l_status == "3" )//Approve
                {
                    grdVouchers.SetCellBgColor( i, G_SLIP_NO , i, G_SLIP_NO , 0xB8FECA ); // xanh
                }    
                else if (l_status == "4" )// Cancel
                {
                    grdVouchers.SetCellBgColor( i, G_SLIP_NO , i, G_SLIP_NO , 0xEEEEEE ); // xam
                }                   
            }   
		break;
		
        case "data_bisa00020_1": 
            //-------------------        
            if ( flag == "save" )
            {
               for (var i = 1; i<grdDetail.rows; i++)   
               {
                    grdDetail.SetGridText(i, G1_MASTER_PK,  txtMasterPK.GetData());  
               }                                     
               //---------------------   
               OnSave('data_bisa00020_2');                
            }
            else
            {                
                OnSearch('grdDetail');                  
            } 
                
        break;

        case "data_bisa00020_2":
            if ( flag != 'view' ) 
            {
                OnSearch('grdVouchers');
            }             
            //----------------------
            
            if ( grdDetail.rows - 1 > 0 )
            {
                grdDetail.GetGridControl().Cell( 7, 1, G1_ADJUST_QTY, grdDetail.rows - 1, G1_ADJUST_AMOUNT ) = 0x3300cc;
            
                grdDetail.SetCellBold( 1, G1_STOCK_QTY,  grdDetail.rows - 1, G1_STOCK_QTY,  true);	
                grdDetail.SetCellBold( 1, G1_CHECK_QTY,  grdDetail.rows - 1, G1_CHECK_QTY,   true);
                grdDetail.SetCellBold( 1, G1_ADJUST_QTY, grdDetail.rows - 1, G1_ADJUST_QTY, true);
                
                grdDetail.SetCellBgColor( 1, G1_CHECK_QTY , grdDetail.rows - 1, G1_CHECK_AMOUNT , 0xCCFFFF );                
                
                grdDetail.SetCellBold( 1, G1_ITEM_CODE, grdDetail.rows - 1, G1_ITEM_CODE, true);			
            }    
			
            var total1 = 0;
            var total2 = 0;
			
            for (var i=1;i<grdDetail.rows;i++)
            {
                
                total1 = total1 + Number(grdDetail.GetGridData(i,G1_STOCK_QTY));
                total2 = total2 + Number(grdDetail.GetGridData(i,G1_CHECK_QTY));
            }
             
            lblTotalQty1.text = addCommas(total1);
            lblTotalQty2.text = addCommas(total2);
            //----------------------                
        break;
        
        case 'pro_bisa00020':
			alert(txtReturnValue.text);		
					
			OnSearch('grdDetail');
		break;
		
		case 'pro_bisa00020_2':
			alert(txtReturnValue.text);		
					
			OnSearch('grdDetail');
		break;
		
        case 'pro_bisa00050_1':
            alert(txtReturnValue.text);
            
			OnSearch('Master');
		break;	
		
		 case 'dso_wh_list':
            lstWarehouse.SetDataText(txtWHStr.text);
            lstWHSearch.SetDataText(txtWHStr.text +"||");
            lstWHSearch.value =''
         break;	
   }            
}
//===============================================================================
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
//===============================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Charger':
            var path = System.RootURL + '/standard/forms/co/lg/colg00100.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtChargerName.text = obj[2];
                txtChargerPK.text   = obj[0];
            }
        break;    
        
        case 'Import':
            var path = System.RootURL + '/standard/forms/bi/sa/bisa00010_import.xls';
            window.open(path, "_blank");
        break;    

		case 'Report':			 
			 if( txtMasterPK.text != "" )
	        {
		        var path = System.RootURL + '/standard/forms/bi/sa/bisa00021.aspx';
		        var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
 	        }
	        else
	        {
		        alert("Please, select one slip no to print!");
	        }	
		break;  	
		
		case 'AjItem':
            var path = System.RootURL + '/standard/forms/bi/sa/bisa00022.aspx?master_pk=' + txtMasterPK.text ;            
			var object = System.OpenModal( path ,1200, 600 ,  'resizable:yes;status:yes',this);
        break;   	
    }	       
}

//===============================================================================

function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            data_bisa00020_1.Call();
            flag='save';        
        break;
        
        case 'data_bisa00020_2':
            data_bisa00020_2.Call();
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
                
                if ( event_col == G1_UOM )
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
  
//===================================================================================

 function OnDelete(index)
 {        
    switch (index)
    {
        case 'Voucher':// delete master       
            if(confirm('Do you want to delete this Voucher?'))
            {
                flag='delete';
                data_bisa00020_1.StatusDelete();
                data_bisa00020_1.Call();
            }           
        break;

        case 'GridItem':
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
//===================================================================================
 
function OnUnDelete()
{              
     grdDetail.UnDeleteRow();
}

//===================================================================================

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
    
    if ( col == G1_CHECK_QTY || col == G1_ADJUST_QTY || col == G1_CHECK_AMOUNT || col == G1_ADJUST_AMOUNT )
    {
        var dQuantiy ;
        
        dQuantiy =  grdDetail.GetGridData(row,col) ;
        
        if (Number(dQuantiy))
        {   
			if ( col == G1_CHECK_QTY )	
			{	
            	if ( dQuantiy >0 )
            	{
                	grdDetail.SetGridText( row, col, System.Round(dQuantiy, arr_FormatNumber[col]));
            	}
            	else
            	{
                	alert(" Value must greater than zero !!");
                	grdDetail.SetGridText( row, col, "");
            	}
			}
			else
			{
				grdDetail.SetGridText( row, col, System.Round(dQuantiy, arr_FormatNumber[col]));		
			}		
        }
        else
        {
            grdDetail.SetGridText(row,col,"") ;
        }     
    }
    //----------------------Calculate Adjust Qty-----
    if ( col == G1_CHECK_QTY )
    {
        var dStockQty  = Number(grdDetail.GetGridData( row, G1_STOCK_QTY)) ;
        var dCheckQty  = Number(grdDetail.GetGridData( row, G1_CHECK_QTY)) ;
           
        var dAdjust = Number(dCheckQty) - Number(dStockQty);
        
        grdDetail.SetGridText( row, G1_ADJUST_QTY, System.Round(dAdjust, arr_FormatNumber[G1_ADJUST_QTY]));  
        
        //var total_amount =   Number(grdDetail.GetGridData( row, G1_CHECK_QTY) ) * Number( grdDetail.GetGridData( row, G1_CHECK_PRICE) ) ;     
        //grdDetail.SetGridText( row, G1_CHECK_AMOUNT, System.Round(total_amount,arr_FormatNumber[G1_CHECK_PRICE])); 
                 
    }   
    //------------------------------------------------
	/*if ( col == G1_CHECK_PRICE )
    {
            
        var total_amount =   Number(grdDetail.GetGridData( row, G1_CHECK_QTY) ) * Number( grdDetail.GetGridData( row, G1_CHECK_PRICE) ) ;     
        grdDetail.SetGridText( row, G1_CHECK_AMOUNT, System.Round(total_amount,arr_FormatNumber[G1_CHECK_PRICE])); 
                 
    }*/
    else if ( col == G1_CHECK_AMOUNT )
    {
        var dStockAmount  = Number(grdDetail.GetGridData( row, G1_STOCK_AMOUNT)) ;
        var dCheckAMount  = Number(grdDetail.GetGridData( row, G1_CHECK_AMOUNT)) ;
           
        var dAdjust = Number(dCheckAMount) - Number(dStockAmount);
        
        grdDetail.SetGridText( row, G1_ADJUST_AMOUNT, System.Round(dAdjust, arr_FormatNumber[G1_ADJUST_AMOUNT]));               
    } 
    //----------------------
}
//===================================================================================
function Calculate()
{
	for ( var i=1; i<grdDetail.rows; i++)
	{		
			var dStockQty  = Number(grdDetail.GetGridData( i, G1_STOCK_QTY)) ;
			var dCheckQty  = Number(grdDetail.GetGridData( i, G1_CHECK_QTY)) ;
	
			var dAdjust = Number(dCheckQty) - Number(dStockQty);

			grdDetail.SetGridText( i, G1_ADJUST_QTY, System.Round(dAdjust, arr_FormatNumber[G1_ADJUST_QTY])); 					 
	}
}
//===================================================================================

function OnProcess(pos)
{
    switch(pos)
    {
        case 'LoadStock':
            if ( txtMasterPK.text != '' )
            {
                if ( confirm("Do you want to load stock ?") )
                {            
                    pro_bisa00020.Call();
                }    
            }
            else
            {
                alert("Pls save slip first.");
            }
        break;
        
		case 'LoadEval':
            if ( txtMasterPK.text != '' )
            {
                if ( confirm("Do you want to load stock ?") )
                {            
                    pro_bisa00020_2.Call();
                }    
            }
            else
            {
                alert("Pls save slip first.");
            }
        break;
		
        case 'Submit':
            if ( txtMasterPK.text != '' )
            {
                if ( confirm("Do you want to submit this slip?") )
                {
                    pro_bisa00020_1.Call();
                }    
            }
            else
            {
                alert("Pls select one slip first.");
            }
        break;
    }
}

//===================================================================================
function OnReport(pos)
{
	switch (pos)
	{
		case '0':
			var url =System.RootURL + "/reports/bi/sa/rpt_bisa00020.aspx?p_sa_stock_adjust_m_pk=" + txtMasterPK.text + '&p_item=' + txtItem.text; 
			System.OpenTargetPage(url); 		
		break;
		
		case '1':
			var url =System.RootURL + "/reports/bi/sa/rpt_bisa00021.aspx?p_sa_stock_adjust_m_pk=" + txtMasterPK.text + '&p_item=' + txtItem.text; 
			System.OpenTargetPage(url); 			
		break;
	}
    
}

//======================================================================
function OnToggleGrid()
{
    if(imgMaster.status == "expand")
    {
        imgMaster.status = "collapse";

		grdDetail.GetGridControl().ColHidden(G1_BEGIN_QTY)    = true ;
		grdDetail.GetGridControl().ColHidden(G1_BEGIN_AMOUNT) = true ;
		grdDetail.GetGridControl().ColHidden(G1_IN_QTY)       = true ;
		grdDetail.GetGridControl().ColHidden(G1_IN_AMOUNT)    = true ;
		grdDetail.GetGridControl().ColHidden(G1_OUT_QTY)      = true ;
		grdDetail.GetGridControl().ColHidden(G1_OUT_AMOUNT)   = true ;		
		
        imgMaster.src = "../../../../system/images/iconmaximize.gif";
		imgMaster.alt="Show all column";
		
    }
    else
    {
        imgMaster.status = "expand";
        
		grdDetail.GetGridControl().ColHidden(G1_BEGIN_QTY)    = false ;
		grdDetail.GetGridControl().ColHidden(G1_BEGIN_AMOUNT) = false ;
		grdDetail.GetGridControl().ColHidden(G1_IN_QTY)       = false ;
		grdDetail.GetGridControl().ColHidden(G1_IN_AMOUNT)    = false ;	
		grdDetail.GetGridControl().ColHidden(G1_OUT_QTY)      = false ;
		grdDetail.GetGridControl().ColHidden(G1_OUT_AMOUNT)   = false ;						
		
        imgMaster.src = "../../../../system/images/close_popup.gif";
		imgMaster.alt="Hide unuse column";
    }
}

//===================================================================================
</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="dso_wh_list" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_bisa00020_3" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="txtWHStr" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------------grdVouchers---------------------------------------->
    <gw:data id="data_bisa00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1" function="st_lg_sel_bisa00020" > 
                <input>                      
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="lstWHSearch" />
					<input bind="txtItem01" />
					<input bind="txtEmpPK" />
					<input bind="chkUser" />
					<input bind="radAdjType" />
                </input> 
                <output bind="grdVouchers" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_bisa00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="st_lg_sel_bisa00020_1"  procedure="st_lg_upd_bisa00020_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
					 <inout  bind="txtSlipNo" />
                     <inout  bind="dtStockDate" />                         
                     <inout  bind="txtChargerPK" />
                     <inout  bind="txtChargerName" />
                     <inout  bind="lbStatus" />
                     <inout  bind="lstWarehouse" />
					 <inout  bind="lstCurrency" />
					 <inout  bind="txtExRate" />
                     <inout  bind="txtRemark" />  
                     <inout  bind="lstLoadType" /> 
					 <inout  bind="radAdjType" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_bisa00020_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21" function="st_lg_sel_bisa00020_2"   procedure="st_lg_upd_bisa00020_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                    <input bind="txtItem" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_bisa00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_bisa00020" > 
                <input>
					 <input bind="txtMasterPK" />
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_bisa00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_bisa00020_1" > 
                <input>
					 <input bind="txtMasterPK" />
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!-------------------------------------------------------------------->
    <gw:data id="pro_bisa00020_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_bisa00020_2" > 
                <input>
					 <input bind="txtMasterPK" />
                </input> 
                <output> 
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
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
                            <td><gw:button id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdVouchers')" /></td>
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
											~<gw:datebox id="dtTo" lang="1" />
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            W/H
                                        </td>
                                        <td colspan="2">
                                            <gw:list id="lstWHSearch" styles="width:100%;" />
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>
                                            Item
                                        </td>
                                        <td colspan=2>
                                            <gw:textbox id="txtItem01" styles="width:100%;" />
                                        </td>
                                    </tr>
									<tr style="height: 1%">
										<td colspan="3" align="center" >                            
											<gw:radio id="radAdjType" value="1" styles="width:100%" > 
												<span value="3" id="IN_OUT">IN/OUT</span>
												<span value="1" id="IN">IN ADJUST</span> 
												<span value="2" id="OUT">OUT ADJUST</span>                             						
											</gw:radio>
										</td>
									</tr>	
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 96%">
                            <td colspan="4" style="height:100%" class="eco_line_t">
                                <gw:grid id="grdVouchers" header="_PK|Slip No|Date|_Status|W/H" format="0|0|4|0|0" aligns="0|0|0|1|0"
                                defaults="||||" editcol="0|0|0|0|0" widths="0|1500|1200|1000|0" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2,3,4" oncellclick="OnSearch('Master')" />
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
                                        <td>Status : </td>
                                        <td style="width:100px">
											<gw:label id="lbStatus" styles='width:100%;color:cc0000;font:9pt;align:center' text='-' />
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
                                        <td><gw:button id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Voucher')" /></td>
                                        <td><gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" /></td>
										<td><gw:button id="btnPrint" img="excel" alt="Print" text="Report" onclick="OnPopUp('Report')" /></td>
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
                                            <gw:datebox id="dtStockDate" lang="1" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            
                                        </td>
                                        <td style="width: 35%">
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                            Slip No
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtSlipNo" styles="width:100%;" /> 
                                        </td>
                                        <td align="right" style="width: 15%">
                                             <a title="Employee" onclick="OnPopUp('Charger')" href="#tips">Charger</a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtChargerName" styles="width:100%" />
											<gw:textbox id="txtChargerPK" styles="display:none" />
                                        </td>
                                    </tr>
									<tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                            W/H
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="lstWarehouse" styles='width:100%' csstype="mandatory" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                           Remark
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtRemark" styles="width:100%;" />
                                        </td>
                                    </tr>
									<tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                            Adj Type
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="lstLoadType" styles='width:100%' csstype="mandatory" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                           CCY
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
										<td style="width: 5%" align="right">
											Item
										</td>                                     
										<td style="width: 30%; white-space: nowrap" colspan = 2>
											<gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
										</td>
										<td style="width: 5%">
											<gw:imgbtn id="btnSearch_1" img="search" alt="Search" text="Search" onclick="OnSearch('grdDetail')" />
										</td>
                                        <td>Records :</td>
                                        <td style="width:100px"><gw:label id="lblRowCount" styles='width:100%;color:cc0000;font:9pt' text='' type="number" format="###,###.##" /></td>
                                        <td>Qty : </td>
                                        <td style="width:100px">
											<gw:label id="lblTotalQty1" styles='width:100%;color:cc0000;font:9pt' text='' type="number" format="###,###.##" />
										</td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td align="right">
                                <table style="height:100%">
                                    <tr>
                                        <td style="white-space:nowrap;display:none"></td>
                                        <td> <gw:button id="idBtnLoadStock" img="Load Stock" text="Load Stock" onclick="OnProcess('LoadStock')" />	</td>
										<td> <gw:button id="idBtnLoadEval" img="Load Eval" text="Load Eval" onclick="OnProcess('LoadEval')" />	</td>
                                        <td><gw:button id="btnDeleteItem" img="delete" alt="Delete" text="Delete" onclick="OnDelete('GridItem')" /></td>
                                        
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height:96%;">
                            <td colspan="3" valign="top" class="eco_line_t">
                                <gw:grid id='grdDetail' 
								header='_PK|_OPEN_M_PK|Seq|Ref No|_ITEM_PK|Item Code|Item Name|UOM|Lot No|Begin Qty|Begin Amount|In Qty|In Amount|Out Qty|Out Amount|Stock Qty|Stock Amount|Check Qty|Check Amount|Adjust Qty|Adjust Amount|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|1|0|0|0|0|1|1|3|3|3|3|3|3|3|3|3|3|3|3|0'                                  
								editcol='0|0|1|1|0|0|0|0|1|0|0|0|0|0|0|0|0|1|1|1|1|1' 
								widths='0|0|800|1500|0|2000|3000|1000|1200|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1000'
                                sorting='T' onafteredit="CheckInput()" 
								styles='width:100%; height:100%' />
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
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
<gw:textbox id="txtWHStr" styles="width: 100%;display: none" />

<gw:checkbox id="chkUser" styles="color:blue;display:none" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdVouchers')"></gw:checkbox>
<img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                                        style="cursor: hand;display:none" onclick="OnToggle()" />
<img status="expand" id="imgMaster" alt="Show all column" src="../../../../system/images/close_popup.gif"
                                                        style="cursor: hand;display:none" onclick="OnToggleGrid()" />
<gw:label id="lblTotalQty2" styles='width:100%;color:cc0000;font:9pt;display:none' text='' type="number" format="###,###.##" />
</html>