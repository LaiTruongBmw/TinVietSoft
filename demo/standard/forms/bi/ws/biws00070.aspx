<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>STOCK EVALUATION</title>
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
//'_PK|_OPEN_M_PK|_Seq|_Ref No|_ITEM_PK|Location|Item Code|Item Name|UOM|Lot No|_Begin Qty|_Begin Amount|_In Qty|_In Amount|_Out Qty|_Out Amount
//|Stock Qty|_Stock Amount|Check Qty|_Check Amount|Adjust Qty|_Adjust Amount|Barcode|Remark'
var G1_DETAIL_PK    = 0, 
    G1_MASTER_PK    = 1,
    G1_SEQ          = 2,
	G1_REF_NO       = 3,
    G1_ITEM_PK      = 4,
	G1_LOCATION		= 5,
    G1_ITEM_CODE    = 6,
    G1_ITEM_NAME    = 7,
    G1_UOM          = 8,
    G1_LOT_NO       = 9,
	G1_BEGIN_QTY	= 10,
	G1_BEGIN_AMOUNT	= 11,
	G1_IN_QTY		= 12,
	G1_IN_AMOUNT	= 13,
	G1_OUT_QTY		= 14,
	G1_OUT_AMOUNT	= 15,
	G1_STOCK_QTY    = 16,
    G1_STOCK_AMOUNT = 17,
    G1_CHECK_QTY    = 18,
    G1_CHECK_AMOUNT = 19,
    G1_ADJUST_QTY   = 20,
    G1_ADJUST_AMOUNT= 21,
	G1_BARCODE      = 22; 
    G1_REMARK       = 23;   
	
var arr_FormatNumber = new Array(); 
//var check_init=0;
var check_init=1;
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
	var data="";  
	
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
	
	data = "<%=CtlLib.SetListDataSQL("select pk, WH_ID || ' * '| | WH_NAME from TLG_IN_WAREHOUSE a where  del_if=0 order by WH_ID ")%>||";
	
    lstWHSearch.SetDataText( data);
    lstWHSearch.value = '' ;
	
	lstWarehouse.SetDataText( data);
    lstWarehouse.value = '' ;
	
	//data = "data|01|Report Type 1|02|Lost Barcode";
	data = "data|01|Report Type 1";
    lstReportType.SetDataText(data);
	lstReportType.value='01'; 
    BindingDataList(); 
	
 }
 
 //======================================================================================
 
 function BindingDataList()
 {  
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
    if (check_init==1)
    {
        switch (pos)
        {   
            case 'Master' :         
                data_biws00070_1.StatusInsert();
                 
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
                 var path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=|Y|||Y|Y';
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
                 var path = System.RootURL + '/form/fp/ab/fpab00410.aspx?group_type=Y|Y|Y|Y|Y|Y&warehouse=' + lstWarehouse.value ;
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
}  

//=====================================================================================
function OnSearch(pos)
{
    if (check_init==1)
    {
        switch (pos)
        {
            case 'grdVouchers':
				
                data_biws00070.Call("SELECT");
            break;
        
            case 'Master':
            
                if ( data_biws00070_1.GetStatus() == 20 && grdDetail.rows > 1 )
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
                        data_biws00070_1.Call("SELECT");
                    }                
                } 
                else
                {
                    if ( grdVouchers.row > 0 )
                    {
                        txtMasterPK.text = grdVouchers.GetGridData( grdVouchers.row, G_PK );
                    }
                    flag = 'view' ;
                    data_biws00070_1.Call("SELECT");    
                }                            
            break;
            
            case 'grdDetail':            
                data_biws00070_2.Call("SELECT");
            break;
        }
    }
}

//===============================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
		case "data_biws00070" :
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
		
        case "data_biws00070_1": 
            //-------------------        
            if ( flag == "save" )
            {
               for (var i = 1; i<grdDetail.rows; i++)   
               {
                    grdDetail.SetGridText(i, G1_MASTER_PK,  txtMasterPK.GetData());  
               }                                     
               //---------------------   
               OnSave('data_biws00070_2');                
            }
            else
            {                
                OnSearch('grdDetail');                  
            } 
                
        break;

        case "data_biws00070_2":
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
        
        
        
   }            
}

 function ChangeColorItem(lstctl) 
 {
        var slevel1, slevel2, slevel3,slevel4;
        for (var i = 0; i < lstctl.options.length; i++)
        {
            slevel1 = lstctl.options.item(i).text.substr(0, 1);
            slevel2 = lstctl.options.item(i).text.substr(0, 3);
            slevel3 = lstctl.options.item(i).text.substr(0, 5);
            slevel4 = lstctl.options.item(i).text.substr(0, 7);
            if (slevel4 != ".......")
            {
                if(slevel3==".....")
                {
                    lstctl.options.item(i).style.color = "FF00FF";
                }
                else  
                {
                    if (slevel2 == "...")
                    {
                        lstctl.options.item(i).style.color = "0066CC";
                    }
                    else
                    {
                        if (slevel1 == ".")
                            lstctl.options.item(i).style.color = "FF4500";  //FF3333
                    }
                }                
            }
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
    if (check_init==1)
    {
        switch(pos)
        {
            case 'Charger':
                var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
                var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

                if ( obj != null )
                {
                    txtChargerName.text = obj[2];
                    txtChargerPK.text   = obj[0];
                }
            break;    
            
            case 'Report':			 
			     if( txtMasterPK.text != "" )
	            {
		            var path = System.RootURL + '/form/bi/sa/bisa00011.aspx';
		            var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
 	            }
	            else
	            {
		            alert("Please, select one slip no to print!");
	            }	
		    break;  	
    		
		    case 'AjItem':
                var path = System.RootURL + '/form/bi/sa/bisa00012.aspx?master_pk=' + txtMasterPK.text ;            
			    var object = System.OpenModal( path ,1200, 600 ,  'resizable:yes;status:yes',this);
            break;   	
        }	      
    } 
}

//===============================================================================

function OnSave(pos)
{    
    if (check_init==1)
    {
        switch(pos)
        { 
            case 'Master':
                data_biws00070_1.Call();
                flag='save';        
            break;
            
            case 'data_biws00070_2':
                data_biws00070_2.Call();
            break;
        }
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
                       var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
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
    if (check_init==1)
    {
        switch (index)
        {
            case 'Voucher':// delete master       
                if(confirm('Do you want to delete this Voucher?'))
                {
                    flag='delete';
                    data_biws00070_1.StatusDelete();
                    data_biws00070_1.Call();
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
}
//===================================================================================
 
function OnUnDelete()
{             
    if (check_init==1) 
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


//===================================================================================
function OnReport(pos)
{
    if (check_init==1)
	{
	    switch (pos)
	    {
		    case '0':
			    var url =System.RootURL + "/reports/bi/sa/rpt_bisa00010.aspx?p_sa_stock_eval_m_pk=" + txtMasterPK.text + '&p_item=' + txtItem.text; 
			    System.OpenTargetPage(url); 		
		    break;
    		
		    case '1':
			    var url =System.RootURL + "/reports/bi/sa/rpt_bisa00011.aspx?p_sa_stock_eval_m_pk=" + txtMasterPK.text + '&p_item=' + txtItem.text; 
			    System.OpenTargetPage(url); 			
		    break;
	    }
    }
}

function OnReport_N()
{
	var typeReport=lstReportType.value;
	if(typeReport=='01'){
		var url =System.RootURL + "/reports/bi/sa/rpt_biws00070_01.aspx?p_sa_stock_eval_m_pk=" + txtMasterPK.text + '&p_item=' + txtItem.text; 
		System.OpenTargetPage(url);
	}
	if(typeReport=='02'){
		var url =System.RootURL + "/reports/bi/sa/rpt_biws00070_02.aspx?p_sa_stock_eval_m_pk=" + txtMasterPK.text + '&p_item=' + txtItem.text; 
		System.OpenTargetPage(url);
	}
    
}	



function OnShowDetail()
{
    if(event.col== G1_ITEM_CODE || event.col==G1_ITEM_NAME)
    {
        var path = System.RootURL + '/form/fp/ic/fpic00010_01.aspx?p_master_pk='+txtMasterPK.text+'&p_item_pk='+grdDetail.GetGridData(event.row,G1_ITEM_PK);
	    var obj = System.OpenModal( path ,1000 , 800, 'resizable:yes;status:yes');
	}
	if(event.col== G1_BARCODE)
    {
        var path = System.RootURL + '/form/fp/ab/fpab00780.aspx?p_master_pk='+ txtMasterPK.text+'&p_detail_pk=' + grdDetail.GetGridData( grdDetail.row, G1_DETAIL_PK) +'&p_detail_nm=TLG_SA_STOCK_EVAL_D';
		var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
        //OnSearch('grdMaster');    
	}
}

//===================================================================================
</script>

<body>

    <!-----------------------grdVouchers---------------------------------------->
    <gw:data id="data_biws00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1" function="st_lg_sel_biws00070" > 
                <input>                      
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="lstWHSearch" />
					<input bind="txtItem01" />
					<input bind="txtEmpPK" />
					<input bind="chkUser" />					 
                </input> 
                <output bind="grdVouchers" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_biws00070_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control"  function="st_lg_sel_biws00070_1"  > 
                <inout>             
                     <inout  bind="txtMasterPK" />
					 <inout  bind="txtSlipNo" />
                     <inout  bind="dtStockDate" />                         
                     <inout  bind="txtChargerPK" />
                     <inout  bind="txtChargerName" />
                     <inout  bind="lbStatus" />
                     <inout  bind="lstWarehouse" />
                     <inout  bind="txtRemark" />                       
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_biws00070_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid"  function="st_lg_sel_biws00070_2"   > 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                    <input bind="txtItem" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    
    <!-------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 30%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            Date
                        </td>
                        <td style="width: 89%">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~<gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdVouchers')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%">W/H</td>
                        <td colspan="2">
                            <gw:list id="lstWHSearch" styles="width:100%;" />
                        </td>                        
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%">
                            Item
                        </td>
                        <td colspan="1">
                            <gw:textbox id="txtItem01" styles="width:100%;" onenterkey="OnSearch('grdVouchers')"/>
                        </td>
                        <td>
                            <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnSearch('grdVouchers')">User
							</gw:checkbox>
                        </td>
                    </tr>						 			
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdVouchers" header="_PK|Slip No|Date|_Status|W/H" format="0|0|4|0|0" aligns="0|0|0|1|0"
                                defaults="||||" editcol="0|0|0|0|0" widths="0|1500|1200|1000|0" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2,3,4" oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 70%">
                <table style="width: 100%; height: 100%">
                    <tr style="border:0;width:100%;height:1%" valign="center" >
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                        <td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td><td style="width:1%"></td>
                    </tr>
                    <tr style="height: 2%">					
						<td align="right" colspan=15>Slip No</td>
                        <td colspan=25>
                            <gw:textbox id="txtSlipNo" styles="width:100%;" /> 
                        </td>						       
						<td align="right" colspan=10></td>
                        <td align="right" colspan=10>Date</td>
                        <td colspan=10>
                            <gw:datebox id="dtStockDate" lang="1" />
                        </td>
						
                        <td colspan=26 align="center"  >
                            <gw:label id="lbStatus" styles='width:100%;color:cc0000;font:9pt;align:center' text='-' />
                        </td>
                        
                    </tr>
                    <tr style="height: 2%">
						<td align="right" colspan=15>W/H</td>
                        <td colspan=35 >
                            <gw:list id="lstWarehouse" styles='width:100%' csstype="mandatory" />
                        </td>
						<td align="right" colspan=10>Charger</td>
                        <td colspan=20 >
                            <gw:textbox id="txtChargerName" styles="width:100%" />
                            <gw:textbox id="txtChargerPK" styles="display:none" />
                        </td>	
                        <td colspan=17 align="center"><gw:list id="lstReportType" styles='width:100%;' /></td>	
                         <td colspan=3>
                            <gw:imgbtn id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnReport_N()" />
                        </td>				                                              
                    </tr>										
					
					<tr style="height: 1%">
					
					   <td colspan=15 align="right">
                            Remark
                        </td>
                        <td colspan=85>
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>						                                            
                     											
					</tr>
                    <tr style="height: 2%">
                        <td colspan="100">
                            <table>
                                <tr>
                                    <td style="width: 5%" align="left">
                                        <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                            style="cursor: hand" onclick="OnToggle()" />
                                    </td>
                                    <td style="width: 5%" align="left">
                                      
                                    </td>
									
									<td style="width: 10%" align="right">
                                        Item
                                    </td>                                     
                                    <td style="width: 30%; white-space: nowrap" >
                                        <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('grdDetail')" />
                                    </td>
                                    <td style="width: 5%">
                                        <gw:imgbtn id="btnSearch_1" img="search" alt="Search" text="Search" onclick="OnSearch('grdDetail')" />
                                    </td>
									<td style="width: 5%" align="left">
                                      
                                    </td>
									<td style="width: 20%; white-space: nowrap" colspan=2 >
                                        Stock Qty :
                                        <gw:label id="lblTotalQty1" styles='width:100%;color:cc0000;font:9pt' text='' type="number"
                                            format="###,###.##" />
                                    </td>
                                    
                                    <td style="width: 20%; white-space: nowrap"  >
                                        Check Qty :
                                        <gw:label id="lblTotalQty2" styles='width:100%;color:cc0000;font:9pt' text='' type="number"
                                            format="###,###.##" />
                                    </td>
									
									<td align="right" style="width: 5%">&nbsp;</td>
									
									<td align="right" style="width: 1%">
                                        <gw:imgbtn id="btnProcess" img="process" alt="Process" text="Process" styles='display:none' onclick="Calculate()" />
                                    </td>									
                                    <td align="right" style="width: 1%" >
                                        <gw:imgbtn img="new" alt="New" id="btnNew1" styles='display:none' onclick="OnAddNew('Detail')" />
                                    </td>                                                                    
                                    <td align="right" style="width: 1%">
                                        <gw:imgbtn id="btnGetFreeItem" img="popup" alt="Get free Item" styles='width:100%;display:none' text="Get free Item" onclick="OnAddNew('FreeItem')" />
                                    </td>
									<td align="right" style="width: 1%">
                                        <gw:imgbtn id="btnGetStockItem" img="popup" alt="Get Stock Item" text="Get Stock Item" styles='width:100%;display:none' onclick="OnAddNew('StockItem')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnDeleteItem" img="delete" alt="Delete" text="Delete" styles='display:none' onclick="OnDelete('GridItem')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnUnDelete" img="udelete" alt="Undelete" text="Undelete" styles='display:none' onclick="OnUnDelete()" />
                                    </td>
                                </tr>
                                
								 
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 94%">
                        <td colspan="100">
                            <gw:grid id='grdDetail' 
								header='_PK|_OPEN_M_PK|_Seq|_Ref No|_ITEM_PK|Location|Item Code|Item Name|UOM|Lot No|_Begin Qty|_Begin Amount|_In Qty|_In Amount|_Out Qty|_Out Amount|_Stock Qty|_Stock Amount|Check Qty|_Check Amount|_Adjust Qty|_Adjust Amount|Barcode|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|1|0|0|0|0|0|1|1|3|3|3|3|3|3|3|3|3|3|3|3|1|0'                                  
								editcol='0|0|1|1|0|0|0|0|0|1|0|0|0|0|0|0|0|0|1|1|1|1|0|1' 
								widths='0|0|800|1500|0|2000|2000|3000|1000|1200|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1000|1000'
                                sorting='T' onafteredit="CheckInput()" 
                                oncelldblclick="OnShowDetail()"
								styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
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
<gw:textbox id="txtFlag" styles="width: 100%;display: none" />

</html>