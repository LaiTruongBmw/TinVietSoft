<!-- #include file="../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>STOCK CLOSING</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script language="javascript" type="text/javascript">
//-----------------------------------------------------
 
var flag;

var G_PK    = 0 ;
//---------------------------------------------------------
var G1_MASTER_PK    = 0,        
    G1_ITEM_PK      = 1,
	G1_GROUP		= 2,
    G1_ITEM_CODE    = 3,
    G1_ITEM_NAME    = 4,    
    G1_UNIT_PRICE   = 5,
    G1_MEAL_QTY    	= 6,
    G1_MEAL_AMOUNT 	= 7,    
    G1_REMARK       = 8;
	
var G2_DETAIL_PK    = 0,        
    G2_MASTER_PK    = 1,
	G2_PARTNER_PK	= 2,
    G2_PARTNER_ID   = 3,
    G2_PARTNER_NAME = 4,    
    G2_UNIT_PRICE   = 5,
    G2_MEAL_QTY    	= 6,
	G2_ACT_QTY		= 7,
    G2_MEAL_AMOUNT 	= 8,    
	G2_DIS_RATE		= 9,
	G2_DIS_AMOUNT	= 10,
	G2_AR_AMOUNT	= 11,
	G2_TAX_RATE		= 12,
	G2_TAX_AMOUNT	= 13,
	G2_TOTAL_AMOUNT	= 14,
    G2_REMARK       = 15;	
    
    var arr_FormatNumber = new Array();

//===================================================================================
function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("imgArrow"); 

    if(imgArrow.status == "expand")
	{
    left.style.display="none";
    imgArrow.status = "collapse";
    right.style.width="100%";
    imgArrow.src = "../../../system/images/button/next.gif";
    }
    else{
    left.style.display="";
    imgArrow.status = "expand";
    right.style.width="75%";
    imgArrow.src = "../../../system/images/button/previous.gif";
    }
}

//===================================================================================

function BodyInit()
{  
    System.Translate(document);  // Translate to language session    
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    //----------------------------
    
    BindingDataList();    
     
    //----------------------------
 }
 
 //======================================================================================
 
function BindingDataList()
{  
    var data ;
     
    data = "<%=ESysLib.SetListDataSQL("select pk,BRANCH_ID || ' * '|| BRANCH_NAME from TLG_CO_DL_BRANCH a where del_if=0 order by BRANCH_ID" )%>";    
    lstBranchSlip.SetDataText(data);
    
    lstBranchSearch.SetDataText(data+'||');         
     //-----------------------  
	data = "<%=ESysLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGCO0101') FROM DUAL" )%>";    
    lstARPeriod.SetDataText(data); 
	//-----------------------
	
    var ctrl = grdDetail.GetGridControl(); 
    
    ctrl.ColFormat(G1_UNIT_PRICE)  = "#,###,###,###,###,###";
    ctrl.ColFormat(G1_MEAL_QTY)    = "#,###,###,###,###,###";
    ctrl.ColFormat(G1_MEAL_AMOUNT) = "#,###,###,###,###,###";
              
    arr_FormatNumber[G1_UNIT_PRICE] 	= 0;
    arr_FormatNumber[G1_MEAL_QTY] 		= 0;
    arr_FormatNumber[G1_MEAL_AMOUNT] 	= 0;
	
    ctrl = grdAR.GetGridControl(); 
    
    ctrl.ColFormat(G2_UNIT_PRICE)  = "#,###,###,###,###,###";
    ctrl.ColFormat(G2_MEAL_QTY)    = "#,###,###,###,###,###";
    ctrl.ColFormat(G2_ACT_QTY) 	   = "#,###,###,###,###,###";
	ctrl.ColFormat(G2_MEAL_AMOUNT) = "#,###,###,###,###,###";
	ctrl.ColFormat(G2_DIS_RATE)    = "#,###,###,###,###,###";
	ctrl.ColFormat(G2_DIS_AMOUNT)  = "#,###,###,###,###,###";
	ctrl.ColFormat(G2_AR_AMOUNT)   = "#,###,###,###,###,###";
	ctrl.ColFormat(G2_TAX_RATE)    = "#,###,###,###,###,###";
	ctrl.ColFormat(G2_TAX_AMOUNT)  = "#,###,###,###,###,###";
	ctrl.ColFormat(G2_TOTAL_AMOUNT)= "#,###,###,###,###,###";
	
              
    arr_FormatNumber[G2_UNIT_PRICE] 	= 0;
    arr_FormatNumber[G2_MEAL_QTY] 		= 0;
    arr_FormatNumber[G2_ACT_QTY] 		= 0;	
    arr_FormatNumber[G2_MEAL_AMOUNT] 	= 0;
    arr_FormatNumber[G2_DIS_RATE] 		= 0;
    arr_FormatNumber[G2_DIS_AMOUNT] 	= 0;	
    arr_FormatNumber[G2_AR_AMOUNT] 		= 0;
	arr_FormatNumber[G2_TAX_RATE] 		= 0;
	arr_FormatNumber[G2_TAX_AMOUNT] 	= 0;
	arr_FormatNumber[G2_TOTAL_AMOUNT] 	= 0;
}
  
//=====================================================================================
function OnProcess(pos)
{
     switch(pos)
     {
        case 'LoadData' :
            if ( confirm('Do you want to close data.') )
            {              
                pro_bico20060.Call();
            }    
        break;    
        
        case 'Release' :
            if ( txtMasterPK.text != '' )
            {        
                if ( confirm('Do you want to release data.') )
                {
                    pro_bico20060_2.Call();
                }
            }
            else
            {
                alert('Pls select data');
            }                     
        break;   
        
        case 'Submit':
            if ( txtMasterPK.text != '' )
            {
                pro_bico20060_confirm.Call();
            }
            else
            {
                alert('Pls select data');
            }    
        break;
        
		case 'Cancel':
            if ( txtMasterPK.text != '' )
            {
                pro_bico20060_cancel.Call();
            }
            else
            {
                alert('Pls select data');
            }    
        break;
		
        case 'Price':
            pro_bico20060_3.Call();
        break;
		
		case 'PO-PRICE':
			if ( confirm('Are you sure to get P/O price ?') )
			{
            	pro_bico20060_4.Call();
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
            data_bico20060.Call("SELECT");
        break;
    
        case 'Master':
            if ( grdVouchers.row > 0 )
            {
                txtMasterPK.text = grdVouchers.GetGridData( grdVouchers.row, G_PK );
            }
            
            data_bico20060_1.Call("SELECT");
        break;
        
        case 'grdDetail':            
            data_bico20060_2.Call("SELECT");
        break;			
		
		case 'Item':
			data_bico20060_2.Call("SELECT");
		break;
    }
}

//===============================================================================

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_bico20060_1": 
            OnSearch('grdDetail');                
        break;

        case "data_bico20060_2":          
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G1_MEAL_QTY, grdDetail.rows - 1, G1_MEAL_QTY, true);	
                
                grdDetail.SetCellBold( 1, G1_ITEM_CODE, grdDetail.rows - 1, G1_ITEM_CODE, true);	
               
                grdDetail.Subtotal( 0, 2, -1, '6!7');					
            }    
            //---------------------- 
			 
			if ( flag == "save" )
			{
				flag = '';
				
				data_bico20060_3.Call();				
			}
			else
			{
				data_bico20060_3.Call("SELECT");	
			}	
        break;
		
		case "data_bico20060_3":            
            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G1_MEAL_QTY, grdDetail.rows - 1, G1_MEAL_QTY, true);	
                
                grdDetail.SetCellBold( 1, G1_ITEM_CODE, grdDetail.rows - 1, G1_ITEM_CODE, true);	
                
                grdDetail.Subtotal( 0, 2, -1, '9!10!11!12!13!14!15!16');		
            }    
            //----------------------                
        break;
        
        case 'pro_bico20060':
			OnSearch('grdDetail');
		break;

        case 'pro_bico20060_confirm':
            alert(txtReturnValue.text);            
			OnSearch('Master');
		break;	
		
        case 'pro_bico20060_2':
            alert(txtReturnValue.text);            
			OnSearch('Master');
		break;	
						 
		case 'pro_bico20060_4':
			alert(txtReturnValue.text);
		break; 		
   }            
}

var flag = '';
//===================================================================================
function OnSave()
{
    if ( txtMasterPK.text != '' )
    {
		flag = 'save';
		
        data_bico20060_1.Call();        
    }
    else
    {
        alert('Pls select data first.');
    }
} 

//=================================================================================

function CheckInput(obj)
{   
	switch(obj.id)
	{
		case 'grdDetail':
			var col, row
			
			col = event.col;
			row = event.row;
			
			if ( col == G1_UNIT_PRICE && col == G1_MEAL_QTY && col == G1_MEAL_AMOUNT )
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
						grdDetail.SetGridText( row, col, "0");
					}
				}
				else
				{
					grdDetail.SetGridText(row,col,"0") ;
				}  				 
			} 		
		break;
		
		case 'grdAR':
			var col, row;
			
			col = event.col;
			row = event.row;
			 
			if ( col == G2_UNIT_PRICE || col == G2_MEAL_QTY || col == G2_ACT_QTY || col == G2_MEAL_AMOUNT || col == G2_DIS_RATE || col == G2_DIS_AMOUNT || col == G2_AR_AMOUNT || col == G2_TAX_RATE || col == G2_TAX_AMOUNT || col == G2_TOTAL_AMOUNT )
			{
				var dQuantiy ;
				
				dQuantiy =  grdAR.GetGridData(row,col) ;
				
				if (Number(dQuantiy))
				{   
					if (dQuantiy >0)
					{
						grdAR.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumber[col] ));
					}
					else
					{						 
						grdAR.SetGridText( row, col, "0");
					}
				}
				else
				{
					grdAR.SetGridText(row,col,"0") ;
				} 
				
				//----------------------Calculate Amount -----
			    if ( col == G2_UNIT_PRICE  || col ==  G2_MEAL_QTY || col ==  G2_ACT_QTY )
				{
					var d_meal_amount = Number(grdAR.GetGridData( row, G2_ACT_QTY)) * Number(grdAR.GetGridData( row, G2_UNIT_PRICE)) ;								
					grdAR.SetGridText( row, G2_MEAL_AMOUNT, System.Round( d_meal_amount, arr_FormatNumber[G2_MEAL_AMOUNT]));
					
					var d_dis_amount = Number(grdAR.GetGridData( row, G2_MEAL_AMOUNT)) * Number(grdAR.GetGridData( row, G2_DIS_RATE))/100;					
					grdAR.SetGridText( row, G2_DIS_AMOUNT, System.Round( d_dis_amount, arr_FormatNumber[G2_DIS_AMOUNT]));
					
					var d_ar_amount = Number(grdAR.GetGridData( row, G2_MEAL_AMOUNT)) - Number(grdAR.GetGridData( row, G2_DIS_AMOUNT)) ;					
					grdAR.SetGridText( row, G2_AR_AMOUNT, System.Round( d_ar_amount, arr_FormatNumber[G2_AR_AMOUNT]));
					
					var d_tax_amount =  Number(grdAR.GetGridData( row, G2_AR_AMOUNT)) * Number(grdAR.GetGridData( row, G2_TAX_RATE))/100;									
					grdAR.SetGridText( row, G2_TAX_AMOUNT, System.Round( d_tax_amount, arr_FormatNumber[G2_TAX_AMOUNT]));
					
					var d_total_amount =  Number(grdAR.GetGridData( row, G2_AR_AMOUNT)) + Number(grdAR.GetGridData( row, G2_TAX_AMOUNT));									
					grdAR.SetGridText( row, G2_TOTAL_AMOUNT, System.Round( d_total_amount, arr_FormatNumber[G2_TOTAL_AMOUNT]));					
					
				} 
				else if ( col == G2_MEAL_AMOUNT || col == G2_DIS_RATE )
				{
					var d_dis_amount = Number(grdAR.GetGridData( row, G2_MEAL_AMOUNT)) * Number(grdAR.GetGridData( row, G2_DIS_RATE))/100;					
					grdAR.SetGridText( row, G2_DIS_AMOUNT, System.Round( d_dis_amount, arr_FormatNumber[G2_DIS_AMOUNT]));
					
					var d_ar_amount = Number(grdAR.GetGridData( row, G2_MEAL_AMOUNT)) - Number(grdAR.GetGridData( row, G2_DIS_AMOUNT)) ;					
					grdAR.SetGridText( row, G2_AR_AMOUNT, System.Round( d_ar_amount, arr_FormatNumber[G2_AR_AMOUNT]));
					
					var d_tax_amount =  Number(grdAR.GetGridData( row, G2_AR_AMOUNT)) * Number(grdAR.GetGridData( row, G2_TAX_RATE))/100;									
					grdAR.SetGridText( row, G2_TAX_AMOUNT, System.Round( d_tax_amount, arr_FormatNumber[G2_TAX_AMOUNT]));
					
					var d_total_amount =  Number(grdAR.GetGridData( row, G2_AR_AMOUNT)) + Number(grdAR.GetGridData( row, G2_TAX_AMOUNT));									
					grdAR.SetGridText( row, G2_TOTAL_AMOUNT, System.Round( d_total_amount, arr_FormatNumber[G2_TOTAL_AMOUNT]));					
				} 
				else if ( col == G2_DIS_AMOUNT  )
				{
					var d_ar_amount = Number(grdAR.GetGridData( row, G2_MEAL_AMOUNT)) - Number(grdAR.GetGridData( row, G2_DIS_AMOUNT)) ;					
					grdAR.SetGridText( row, G2_AR_AMOUNT, System.Round( d_ar_amount, arr_FormatNumber[G2_AR_AMOUNT]));
					
					var d_tax_amount =  Number(grdAR.GetGridData( row, G2_AR_AMOUNT)) * Number(grdAR.GetGridData( row, G2_TAX_RATE))/100;									
					grdAR.SetGridText( row, G2_TAX_AMOUNT, System.Round( d_tax_amount, arr_FormatNumber[G2_TAX_AMOUNT]));
					
					var d_total_amount =  Number(grdAR.GetGridData( row, G2_AR_AMOUNT)) + Number(grdAR.GetGridData( row, G2_TAX_AMOUNT));									
					grdAR.SetGridText( row, G2_TOTAL_AMOUNT, System.Round( d_total_amount, arr_FormatNumber[G2_TOTAL_AMOUNT]));					
				}				 
				else if ( col == G2_AR_AMOUNT || col == G2_TAX_RATE )
				{					
					var d_tax_amount =  Number(grdAR.GetGridData( row, G2_AR_AMOUNT)) * Number(grdAR.GetGridData( row, G2_TAX_RATE))/100;									
					grdAR.SetGridText( row, G2_TAX_AMOUNT, System.Round( d_tax_amount, arr_FormatNumber[G2_TAX_AMOUNT]));
					
					var d_total_amount =  Number(grdAR.GetGridData( row, G2_AR_AMOUNT)) + Number(grdAR.GetGridData( row, G2_TAX_AMOUNT));									
					grdAR.SetGridText( row, G2_TOTAL_AMOUNT, System.Round( d_total_amount, arr_FormatNumber[G2_TOTAL_AMOUNT]));					
				}
				else if ( col == G2_TAX_AMOUNT )
				{
					var d_total_amount =  Number(grdAR.GetGridData( row, G2_AR_AMOUNT)) + Number(grdAR.GetGridData( row, G2_TAX_AMOUNT));									
					grdAR.SetGridText( row, G2_TOTAL_AMOUNT, System.Round( d_total_amount, arr_FormatNumber[G2_TOTAL_AMOUNT]));					
				}
				
				TotalAmount();	
			} 				
		break;
	}	
}

//===================================================================================
function TotalAmount()
{ 
    //---------CALCULATE AMOUNT---------------- 
    var sumItemAmount = 0 , sumDisAmount = 0 , sumARAmount = 0 , sumTaxAmount = 0 , sumTotalAmount = 0;

    for (var i=1; i<grdAR.rows; i++ )
    {
		sumItemAmount  	= sumItemAmount   	+ Number(grdAR.GetGridData( i, G2_MEAL_AMOUNT  ));
        sumDisAmount   	= sumDisAmount    	+ Number(grdAR.GetGridData( i, G2_DIS_AMOUNT   ));
        sumARAmount   	= sumARAmount   	+ Number(grdAR.GetGridData( i, G2_AR_AMOUNT    ));
		sumTaxAmount  	= sumTaxAmount  	+ Number(grdAR.GetGridData( i, G2_TAX_AMOUNT   ));
        sumTotalAmount 	= sumTotalAmount 	+ Number(grdAR.GetGridData( i, G2_TOTAL_AMOUNT ));
    }
  
	txtItemAmount.text     = System.Round( sumItemAmount,  0 ) + "";
    txtDiscountAmount.text = System.Round( sumDisAmount,   0 ) + "";
    txtARAmount.text   	   = System.Round( sumARAmount,    0 ) + "";
	txtTaxAmount.text  	   = System.Round( sumTaxAmount,   0 ) + "";
    txtTotalAmount.text    = System.Round( sumTotalAmount, 0 ) + "";
}  
 
//===================================================================================
function OnDelete()
{
    grdDetail.DeleteRow();
}
//===================================================================================

function OnReport(pos)
{
    switch(pos)
    {		
		case 'ST01':
			var url =System.RootURL + '/reports/bi/co/rpt_bico20060_ST01.aspx?master_pk=' + txtMasterPK.text ;
            window.open(url, "_blank");   
		break;		      
    }
}

//===================================================================================
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'FreeItem':
			if ( txtMasterPK.text != '' )
			{			
             	var path = System.RootURL + '/form/fp/ab/fpab00070.aspx?group_type=|Y|||Y|Y';
             	var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
				
             	if ( object != null )
            	{
                    var arrTemp
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1); 	
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_PK,   arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE, arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME, arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G1_UOM,       arrTemp[5]);//item_uom                            
                    }		            
            	}  
			}	      
        break;  
 	}		
}	

//===================================================================================
function OnCal(pos)
{
	switch(pos)
	{
		case 'DIS_RATE':
			var d_discount_amount = Number(txtItemAmount.text) * Number(txtDiscountRate.text) / 100 ; 
			
			txtDiscountAmount.text = d_discount_amount;
			
			OnCal('AR_AMT');
		break;
		
		case 'DIS_AMT':
			OnCal('AR_AMT');
		break;
		
		case 'AR_AMT':
			var d_ar_amount = Number(txtItemAmount.text) - Number(txtDiscountAmount.text);
			
			txtARAmount.text = d_ar_amount;
			
			OnCal('TAX_RATE');
		break;
		
		case 'TAX_RATE':
			var d_tax_amount = Number(txtARAmount.text) * Number(txtTaxRate.text) / 100 ; 
			
			txtTaxAmount.text = d_tax_amount;
			
			OnCal('TOTAL_AMT');
		break;
		
		case 'TAX_AMT':
			OnCal('TOTAL_AMT');
		break;
		
		case 'TOTAL_AMT':
			var d_total_amount = Number(txtARAmount.text) + Number(txtTaxAmount.text);  
			
			txtTotalAmount.text = d_total_amount;
		break;
	}	
}
//===================================================================================
function OnPopUp(pos)
{
	switch(pos)
	{
		case 'Report':
			if( txtMasterPK.text != "" )
	        {
		        var path = System.RootURL + '/form/bi/co/bico20061.aspx';
		        var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
 	        }
	        else
	        {
		        alert("Please, select one slip no to print!");
	        }	
		break;
	}
}
//===================================================================================
</script>

<body>    
    <!-----------------------grdVouchers---------------------------------------->
    <gw:data id="data_bico20060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1" function="<%=l_user%>lg_sel_bico20060" > 
                <input>                      
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" /> 
                    <input bind="lstBranchSearch" />
                </input> 
                <output bind="grdVouchers" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_bico20060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="<%=l_user%>lg_sel_bico20060_1" procedure="<%=l_user%>lg_upd_bico20060_1" > 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="lstBranchSlip" />   
                     <inout  bind="dtProcessDate" />                                            
                     <inout  bind="lbStatus" /> 
					
					 <inout  bind="txtItemAmount" />
					 <inout  bind="txtDiscountRate" />	
					 <inout  bind="txtDiscountAmount" />	
					 <inout  bind="txtARAmount" />	
					 <inout  bind="txtTaxRate" />
					 <inout  bind="txtTaxAmount" />
					 <inout  bind="txtTotalAmount" />

					 <inout  bind="lstARPeriod"	/>
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_bico20060_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8" function="<%=l_user%>lg_sel_bico20060_2" > 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
					<input bind="txtItem" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!------------------------------------------------------------------>
    <gw:data id="data_bico20060_3" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="<%=l_user%>lg_sel_bico20060_3" procedure="<%=l_user%>lg_upd_bico20060_3" > 
                <input bind="grdAR">                    
                    <input bind="txtMasterPK" /> 					 
                </input> 
                <output bind="grdAR" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_bico20060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_bico20060" > 
                <input>
                     <input bind="lstBranchSlip" />
                     <input bind="dtProcessDate" />										 
                </input> 
                <output> 
                    <output bind="txtMasterPK" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->
    <gw:data id="pro_bico20060_confirm" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_bico20060_confirm" > 
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
    <gw:data id="pro_bico20060_cancel" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_bico20060_cancel" > 
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
    <gw:data id="pro_bico20060_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_bico20060_2" > 
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
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 25%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Date
                        </td>
                        <td style="width: 94%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~<gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdVouchers')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%">
							Branch
                        </td>
                        <td colspan="1">
                            <gw:list id="lstBranchSearch" styles="width:100%;" />
                        </td>						 
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdVouchers" header="_PK|Date|Status|Branch" format="0|4|0|0" aligns="0|1|1|0"
                                defaults="|||" editcol="0|0|0|0" widths="0|1200|1000|1000" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2,3" oncellclick="OnSearch('Master')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 75%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="background-color: #B4E7FF" colspan="4">
                            <table style="width: 100%; height: 100%" border="0">
                                <tr>
                                    <td style="width: 1%">
                                        <gw:icon id="btnRelease" img="2" text="UnClose" alt="Release Closing Data" styles='width:100%'
                                            onclick="OnProcess('Release')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnLoadData" img="2" text="Close" alt="Load Closing Data"
                                            styles='width:100%' onclick="OnProcess('LoadData')" />
                                    </td>
                                    <td style="width: 96%" align="center">	
										<gw:label id="lbStatus" styles='width:100%;color:cc0000;font:9pt;align:center' text='-' />									
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnCancel" img="2" text="Cancel" alt="Cancel" styles='width:100%' onclick="OnProcess('Cancel')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:icon id="btnSubmit" img="2" text="Confirm" alt="Submit" styles='width:100%' onclick="OnProcess('Submit')" />
                                    </td>
									<td style="width: 1%">
                                        <gw:imgbtn id="btnPrint" img="excel" alt="Print" text="Print" onclick="OnPopUp('Report')" />
                                    </td> 
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
						<td style="width: 50%" rowspan=3 >
							<table style="width: 100%; height: 100%" border = 0 >
								<tr >
									<td style="width: 5%; white-space: nowrap">
										Item Amount
									</td>
									<td align="right" style="width: 95%; white-space: nowrap" >
			                            <gw:textbox id="txtItemAmount" styles="width:100%" type="number"  format="###,###.###"  />
			                        </td>																	
								</tr>								 
								<tr >
									<td style="width: 5%; white-space: nowrap">
										Discount Amount
									</td>
									<td align="right" style="width: 95%; white-space: nowrap" >
			                            <gw:textbox id="txtDiscountAmount" styles="width:100%" type="number" format="###,###.###" onenterkey="OnCal('DIS_AMT')"  />
			                        </td>																	
								</tr>
								<tr >
									<td style="width: 5%; white-space: nowrap">
										A/R Amount
									</td>
									<td align="right" style="width: 95%; white-space: nowrap" >
			                            <gw:textbox id="txtARAmount" styles="width:100%" type="number" format="###,###.###"  onenterkey="OnCal('AR_AMT')"  />
			                        </td>																	
								</tr>
								 
								<tr >
									<td style="width: 5%; white-space: nowrap">
										Tax Amount
									</td>
									<td align="right" style="width: 95%" >
			                            <gw:textbox id="txtTaxAmount" styles="width:100%" type="number" format="###,###.###" onenterkey="OnCal('TAX_AMT')" />
			                        </td>																	
								</tr>
								<tr >
									<td style="width: 5%; white-space: nowrap">
										Total Amount
									</td>
									<td align="right" style="width: 95%" >
			                            <gw:textbox id="txtTotalAmount" styles="width:100%" type="number" format="###,###.###" onenterkey="OnCal('TOTAL_AMT')" />
			                        </td>																	
								</tr>
							</table>
						</td>
                    </tr>
                    <tr style="height: 2%; background-color: #B4E7FF "  >						 
                        <td align="right" style="width: 5%">
                            Branch
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstBranchSlip" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width: 20%">
                            <gw:datebox id="dtProcessDate" lang="1" />
                        </td>                                               						
                    </tr>
					
					<tr style="height: 2%; background-color: #B4E7FF "  >						 
                        <td align="right" style="width: 5%; white-space: nowrap">
                            A/R Period
                        </td>
                        <td style="width: 20%">
                            <gw:list id="lstARPeriod" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align="right" style="width: 5%; white-space: nowrap">                            
                        </td>
                        <td style="width: 20%">                             
                        </td>                                               						
                    </tr>  					
					 
                    <tr style="height: 2%"> 
						<td colspan=7>
							<table style="width: 100%; height: 100%" border="0">
                                <tr>
									<td style="width: 5%" align="left">
			                            <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif"
			                                style="cursor: hand" onclick="OnToggle()" />
			                        </td>
			                        <td align="right" style="width: 5%; white-space: nowrap">
			                            Item
			                        </td>
			                        <td align="right" style="width: 40%" >
			                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch('Item')" />
			                        </td>
			                        <td  style="width: 1%" >
			                            <gw:imgbtn id="btnSearch2" img="search" alt="Search" text="Search" onclick="OnSearch('Item')" />
			                        </td>
			                        <td style="width: 1%" >			                             
			                        </td>										
									<td style="width: 46%">			                            
			                        </td>																			
									<td style="width: 1%">			                           
			                        </td>																		 
			                        <td align="right" style="width: 1%">										 
			                        </td>										
								</tr>
							</table>	
						</td>                       																
                    </tr>
                    <tr style="height: 44%">
                        <td colspan="7">
                            <gw:grid id='grdDetail' 
								header='_M_PK|_ITEM_PK|Group|Item Code|Item Name|Unit Price|Meal Qty|Meal Amount|Remark'
                                format='0|0|0|0|0|0|0|0|0' 
								aligns='0|0|0|0|0|3|3|3|0'
                                editcol='0|0|0|0|0|0|0|0|0' 
								widths='0|0|2000|2000|3500|1500|1500|1500|1000'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput(this)" />
                        </td>
                    </tr>
					
					<tr style="height: 50%">
                        <td colspan="7">
                            <gw:grid id='grdAR' 
								header='_D_PK|_MASTER_PK|_PartnerPK|Partner ID|Partner Name|Unit Price|Meal Qty|Act Qty|Meal Amount|Discount(%)|Dis Amount|A/R Amount|Tax(%)|Tax Amount|Total Amount|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|0'
                                editcol='0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1' 
								widths='0|0|2000|2000|3500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1000'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput(this)" />																 
			   
                        </td>
                    </tr>
					
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="display:none;" />
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtReturnValue" styles="width:100%; display:none" />
<gw:textbox id="txtDiscountRate" styles="width:100%;display:none" type="number"  format="###,###.###" onenterkey="OnCal('DIS_RATE')"  />
<gw:textbox id="txtTaxRate" styles="width:100%;display:none" type="number"  format="###,###.###"  onenterkey="OnCal('TAX_RATE')" />
<!---------------------------------------------------------------------------------->
</html>
