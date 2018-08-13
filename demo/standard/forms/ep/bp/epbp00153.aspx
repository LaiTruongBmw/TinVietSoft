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
     
var G1_PR_D_PK   	= 0,
    G1_PR_M_PK   	= 1,    
    G1_SEQ       	= 2,
    G1_ITEM_PK   	= 3,
    G1_ITEM_CODE 	= 4,
    G1_ITEM_NAME 	= 5,    
    G1_UOM       	= 6,   
	G1_REQ_QTY   	= 7,	
    G1_UPRICE    	= 8,
    G1_ITEM_AMT  	= 9,
	G1_TAX_RATE	 	= 10,
	G1_TAX_AMT	 	= 11,
	G1_TOTAL_AMT 	= 12,    
	G1_DELI_DATE  	= 13,
    G1_DELI_TIME 	= 14,
	G1_SUPPLIER_PK	= 15,
	G1_SUPPLIER_NAME= 16,
	G1_STOCK_QTY 	= 17,	
	G1_ITEM_TYPE	= 18,
    G1_REMARK    	= 19; 

var rtnLGCode = '' ;
 
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
	txtUserPK.text = "<%=session("USER_PK")%>";
	
    txtRequesterID.SetEnable(false);
    txtRequesterName.SetEnable(false);
    	
    //-------------------------
    BindingDataList();   
	
	OnChangeTab(); 
    //---------------------------------- 
	pro_epbp00360_5.Call();
	
                
}
//============================================================================== 

 function BindingDataList()
 {      
     var data ;    
          
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPO1001') FROM DUAL")%>"; 
     lstDeliLoc.SetDataText(data);      	 
	 
	 data = "<%=CtlLib.SetListDataSQL("select pk,DEPT_ID || ' * '|| DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>"; 
     lstDept.SetDataText(data);
     lstDeptS.SetDataText(data+"||Select All");
     lstDeptS.value=""; 
    
	 data = "DATA|06:00|06:00|07:00|07:00|08:00|08:00||"; 
     lstTime.SetDataText(data);     
	 
	 data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPO2001') FROM DUAL")%>||";  //po type
     lstPOType.SetDataText(data);
	 lstPOType.value="";
	 
	 data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
     lstCCY.SetDataText(data);             
     
	 data = "<%=CtlLib.SetGridColumnDataSQL(" SELECT a.CODE, a.CODE || ' ' || a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPO1040' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> |#;";       
	 grdDetail.SetComboFormat(G1_ITEM_TYPE,data);
		
     var ctr = grdDetail.GetGridControl(); 
          
     ctr.ColFormat(G1_REQ_QTY)   = "#,###,###,###,###,###.##";
     ctr.ColFormat(G1_UPRICE)    = "#,###,###,###,###,###.##";    
     ctr.ColFormat(G1_ITEM_AMT)  = "#,###,###,###,###,###.##";
	 ctr.ColFormat(G1_TAX_RATE)  = "#,###,###,###,###,###";
	 ctr.ColFormat(G1_TAX_AMT)   = "#,###,###,###,###,###.##";
	 ctr.ColFormat(G1_TOTAL_AMT) = "#,###,###,###,###,###.##"; 
	 	      
	 ctr.ColFormat(G1_STOCK_QTY)  = "#,###,###,###,###,###.##"; 
	 
 }

 //===================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {                     					
 
			case 'Report':			 
				if( txtMasterPK.text != "" )
				{
					var path = System.RootURL + '/standard/formsep/bp/epbp00363.aspx';
					var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
				}
				else
				{
					alert("Please, select one slip no to print!");
				}	
			break; 	

			case 'ITEM_TYPE':				 
				var path = System.RootURL + "/standard/formsfp/ab/fpab00220.aspx?code_group=LGPO1040";
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

                 if ( event_col == G1_UOM )
                 {
                       var path = System.RootURL + '/standard/formsfp/ab/fpab00230.aspx';
	                   var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                   if ( obj != null )
	                   {
	                        grdDetail.SetGridText( event_row, event_col, obj[1]);
	                   }	
                 }
				 else if ( event_col == G1_ITEM_CODE || event_col == G1_ITEM_NAME )
				 {
						var path = System.RootURL + '/standard/formsfp/ab/fpab00120.aspx?partner_type=AP';
						var obj  = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');    	               					
						
						if ( obj != null )
						{	
							var arrTemp;
							
							for( var i=0; i < obj.length; i++)	  
							{													
								arrTemp = obj[i];
								
								if ( i == 0 )
								{							
									grdDetail.SetGridText( event_row, G1_ITEM_PK,   arrTemp[0]);//item_pk	    
									grdDetail.SetGridText( event_row, G1_ITEM_CODE, arrTemp[1]);//item_code	    
									grdDetail.SetGridText( event_row, G1_ITEM_NAME, arrTemp[2]);//item_name	    
									grdDetail.SetGridText( event_row, G1_UOM,       arrTemp[3]);//item_uom     
									
									grdDetail.SetGridText( event_row, G1_UPRICE,    arrTemp[4]);//pur price  
									
									grdDetail.SetGridText( event_row, G1_DELI_DATE, dtDeliDate.value );
									grdDetail.SetGridText( event_row, G1_DELI_TIME, lstTime.value    );
									
									grdDetail.SetGridText( event_row, G1_SUPPLIER_PK,   arrTemp[7]);
									grdDetail.SetGridText( event_row, G1_SUPPLIER_NAME, arrTemp[8]);
								}
								else
								{		
									grdDetail.AddRow();                            
									
									grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1); 	
									
									grdDetail.SetGridText( grdDetail.rows-1, G1_PR_M_PK, txtMasterPK.text); //master_pk	    	                                               
									
									grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_PK,   arrTemp[0]);//item_pk	    
									grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE, arrTemp[1]);//item_code	    
									grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME, arrTemp[2]);//item_name	    
									grdDetail.SetGridText( grdDetail.rows-1, G1_UOM,       arrTemp[3]);//item_uom     
									
									grdDetail.SetGridText( grdDetail.rows-1, G1_UPRICE,    arrTemp[4]);//pur price  
									
									grdDetail.SetGridText( grdDetail.rows-1, G1_DELI_DATE, dtDeliDate.value );
									grdDetail.SetGridText( grdDetail.rows-1, G1_DELI_TIME, lstTime.value    );
									
									grdDetail.SetGridText( grdDetail.rows-1, G1_SUPPLIER_PK,   arrTemp[7]);
									grdDetail.SetGridText( grdDetail.rows-1, G1_SUPPLIER_NAME, arrTemp[8]);
								}		
							}
						}					
				 }
				 else if ( event_col == G1_SUPPLIER_NAME )
				 {
						var path = System.RootURL + "/standard/formsfp/ab/fpab00120.aspx?partner_type=AP";
						var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         
						if ( object != null )
						{ 
							grdDetail.SetGridText( event_row, G1_SUPPLIER_PK	  , object[0] );
							grdDetail.SetGridText( event_row, G1_SUPPLIER_NAME , object[2] );
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

		case 'QUOTATION':
             var path = System.RootURL + '/standard/formsfp/ab/fpab00074.aspx?group_type=Y|Y|Y|Y|Y|Y';
             var object = System.OpenModal( path , 1000 , 600 ,  'resizable:yes;status:yes');
			 
             if ( object != null )
             {
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                        arrTemp = object[i];
                                
                        grdDetail.AddRow();                            
									
						grdDetail.SetGridText( grdDetail.rows-1, G1_SEQ, grdDetail.rows-1); 	
									
						grdDetail.SetGridText( grdDetail.rows-1, G1_PR_M_PK, txtMasterPK.text); //master_pk	    	                                               
									
						grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_PK,   arrTemp[0]);//item_pk	    
						grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_CODE, arrTemp[1]);//item_code	    
						grdDetail.SetGridText( grdDetail.rows-1, G1_ITEM_NAME, arrTemp[2]);//item_name	    
						grdDetail.SetGridText( grdDetail.rows-1, G1_UOM,       arrTemp[3]);//item_uom     
									
						grdDetail.SetGridText( grdDetail.rows-1, G1_UPRICE,    arrTemp[4]);//pur price  
									
						grdDetail.SetGridText( grdDetail.rows-1, G1_DELI_DATE, dtDeliDate.value );
						grdDetail.SetGridText( grdDetail.rows-1, G1_DELI_TIME, lstTime.value    );
									
						grdDetail.SetGridText( grdDetail.rows-1, G1_SUPPLIER_PK,   arrTemp[7]);
						grdDetail.SetGridText( grdDetail.rows-1, G1_SUPPLIER_NAME, arrTemp[8]);
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
       
        case 'grdMaster':
        
            data_epbp00360_1.Call("SELECT");                                         
        break;
        
        case 'grdDetail':            
            data_epbp00360_2.Call("SELECT");
        break;
    
    }
}

//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {        
        case "data_epbp00360_1": 
                   
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
        
        case "data_epbp00360_2":

            if ( grdDetail.rows > 1 )
            {
                grdDetail.SetCellBold( 1, G1_ITEM_CODE, grdDetail.rows - 1, G1_ITEM_CODE, true);  
				              
				grdDetail.SetCellBgColor( 1, G1_ITEM_CODE , grdDetail.rows - 1, G1_ITEM_NAME  , 0xCCFFFF );
            }  
            //--------------------------------
        break;   
                   
        case "pro_epbp00360":
            alert(txtReturnValue.text); 
            //-----------
            data_epbp00360_1.Call("SELECT");
        break; 
        
        case "pro_epbp00360_1":
            alert(txtReturnValue.text); 
            //-----------        
            OnSearch('grdDetail');       
        break;
        
		case 'pro_epbp00360_2':
            alert(txtReturnValue.text);
			OnSearch('grdSearch');
        break;  
		        
		case 'pro_epbp00360_5':
			OnSearch('Master');   
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
                data_epbp00360_1.StatusDelete();
                data_epbp00360_1.Call();
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
            data_epbp00360_1.Call();                
        break;
        
        case 'Detail':        
            data_epbp00360_2.Call();
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
                 //var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00361.aspx?master_pk=' + txtMasterPK.text  ;
                 //window.open(url, "_blank");
				 var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00360_st01.aspx?master_pk=' + txtMasterPK.text  ;
                 window.open(url, "_blank");
            }         
        break;
		
        case '1':
            if ( txtMasterPK.text != "" )
            { 
                 var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00360_SONGWOL.aspx?master_pk=' + txtMasterPK.text  ;
                 window.open(url, "_blank");
            }         
        break;
		
		case '2':
            if ( txtMasterPK.text != "" )
            { 
                 var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00360_SAMIL.aspx?master_pk=' + txtMasterPK.text  ;
                 window.open(url, "_blank");
            }         
        break;	
		
		case '3':
            if ( txtMasterPK.text != "" )
            { 
                 var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00360_AMB_2.aspx?master_pk=' + txtMasterPK.text  ;
                 window.open(url, "_blank");
            }         
        break;	
		
		case '4':
            if ( txtMasterPK.text != "" )
            { 
                 var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00360_AMB_1.aspx?master_pk=' + txtMasterPK.text  ;
                 window.open(url, "_blank");
            }         
        break;

		case '5':
            if ( txtMasterPK.text != "" )
            { 
                 var url =System.RootURL + '/standard/reports/ep/bp/rpt_epbp00360_during.aspx?master_pk=' + txtMasterPK.text  ;
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
                pro_epbp00360.Call();
            }    
        break; 		 		 

		case 'SET_DATE':
			for ( var i=1; i<grdDetail.rows; i++)
			{
				if ( grdDetail.GetGridControl().isSelected(i) == true )
				{
					grdDetail.SetGridText( i, G1_DELI_DATE, dtDeliDate.value );
					grdDetail.SetGridText( i, G1_DELI_TIME, lstTime.value    );
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
    <gw:data id="pro_epbp00360" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00360" > 
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
    <gw:data id="pro_epbp00360_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00360_1" > 
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
    <gw:data id="pro_epbp00360_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00360_2" > 
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
    <gw:data id="data_epbp00360_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="st_lg_sel_epbp00360_1" procedure="st_lg_upd_epbp00360_1">
                <input>
                    <inout bind="txtMasterPK" />
                    <inout bind="txtPRNo" />
                    <inout bind="dtReqDate" />
                    <inout bind="lbStatus" />                    
                    <inout bind="txtRequesterPK" />
                    
                    <inout bind="txtRequesterID" />
                    <inout bind="txtRequesterName" />   

                    <inout bind="txtRefNo" />                                
                    
                    <inout bind="txtItemAmt" />            
                                                         
                    <inout bind="lstDeliLoc" />   
                    <inout bind="lstCCY" /> 
					<inout bind="lstDept" />
                    <inout bind="txtDescription" />  
                       
					<inout bind="dtDeliDate" />
					
					<inout bind="txtExRate" />
					<inout bind="txtTaxAmt" />
					<inout bind="txtTotalAmt" />  
					
					<inout bind="lstPOType" />                                                                                                                  
                </input>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------->
    <gw:data id="data_epbp00360_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="4" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19" function="st_lg_sel_epbp00360_2" procedure="st_lg_upd_epbp00360_2"> 
                <input bind="grdDetail">
                    <input bind="txtMasterPK" />  
					<input bind="txtLang" />
					<input bind="txtItemDetail" />
					<input bind="txtSupplierDetail" />
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
	<!---------------------------------------------------------------->
    <gw:data id="pro_epbp00360_5" onreceive="OnDataReceive(this)">
        <xml>
            <dso  type="list" procedure="st_lg_pro_epbp00360_5" >
                <input>
                    <input bind="txtUserPK" />
                </input>
                <output>
                    <output bind="lstDept" />
                </output>
            </dso>
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>            
            <td id="right" style="width: 80%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 1%">
                             
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
                                <span value="2" id="2">Amount</span>                            
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
																				
									</td>
									<td style="width: 45%">
										 
									</td>		
									<td align="right" style="width: 5%">
										 
									</td>
									<td style="width: 45%">
										
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
                                        Ref No
                                    </td>
                                    <td align="left" style="width: 45%">                                       
										<gw:textbox id="txtRefNo" styles="width: 100%" />
                                    </td>
                                    <td align="right" style="width: 5%; white-space: nowrap">
                                        <a title="Purchase Type" onclick="OnPopUp('PO-TYPE')" href="#tips" style="color: #0000ff">
                                            P/O Type
										</a>
                                    </td>
                                    <td align="right" style="width: 45%; white-space: nowrap">
                                         <gw:list id="lstPOType" styles='width:100%;' />
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
                                                <td style="width: 5%;white-space: nowrap">
													Deli Date
                                                </td>
												<td style="width: 15%">
													<gw:datebox id="dtDeliDate" lang="1" />
                                                </td>
												<td style="width: 15%">
													<gw:list id="lstTime" styles="width:70" />
												</td>
												<td style="width: 1%" align="left">
													<gw:button id="btnCrtDTL" img="process" alt="Create Item" onclick="OnProcess('SET_DATE')" />
												</td>
												<td style="width: 5%;white-space: nowrap";>
													Item
                                                </td>
												<td style="width: 15%">
													<gw:textbox id="txtItemDetail" styles="width: 150" />
												</td>
												<td style="width: 5%;white-space: nowrap";>
													Supplier
                                                </td>
												<td style="width: 15%">
													<gw:textbox id="txtSupplierDetail" styles="width: 150" />
												</td>
												<td>
													<gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdDetail')" />
												</td>
												<td style="width: 5%"></td>
												<td style="width: 5%; white-space: nowrap" align="left">
													<b style="color: purple; cursor: hand" onclick="OnPopUp('ITEM_TYPE')">Item Type</b>
												</td>
                                                <td style="width: 1%">
                                                    <gw:button id="btnFreeItem" img="Free Item" text="Free Item" onclick="OnAddNew('FreeItem')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:button id="btnStock" img="Stock" text="Stock" onclick="OnAddNew('Stock')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:button id="btnItemPrice" img="Quotation" text="Quotation" onclick="OnAddNew('QUOTATION')" />
                                                </td>                                                
                                                <td style="width: 1%">
                                                    <gw:button id="btnDeleteDTL" img="delete" alt="Delete" onclick="OnDelete('Detail')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:button id="btnUnDeleteDTL" img="UnDelete" alt="UnDelete" onclick="OnUnDelete()" />
                                                </td>                                                
                                            </tr>
                                        </table>                                    
                        </td>
                    </tr>
                    <tr style="height: 96%">
                        <td colspan="13">
                            <gw:grid id='grdDetail' 
								header='_PK|_PO_PR_M_PK|Seq|_TCO_ITEM_PK|Item Code|Item Name|UOM|Req Qty|U/Price|Item Amt|Tax(%)|Tax Amt|Total Amt|Deli Date|Deli Time|_SUPPLIER_PK|Supplier Name|Stock Qty|Item Type|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|4|0|0|0|0|0|0' 
								aligns='0|0|1|0|0|0|1|3|3|3|3|3|3|1|1|0|0|3|0|0'
                                check='|||||||||||||||||||' 
								editcol='0|0|1|0|0|0|1|1|1|1|1|1|1|1|1|0|0|0|1|1'
                                widths='0|0|800|0|1500|3000|800|1200|1200|1200|1200|1200|1200|1200|1000|0|2000|1200|1200|0'
                                styles='width:100%; height:100%' sorting='T' 
								onafteredit="CheckInput()" acceptnulldate="T" 
								oncelldblclick="OnGridCellDoubleClick(this)"								 		
								/>
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
	<gw:textbox id="txtUserPK" styles="width: 100%;display: none" />
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtLGCodeList" styles='display:none;width:100%' />
    <gw:textbox id="txtLGGroupCodeID" styles='display:none;width:100%' />
    <!--------------------------------------------------------------------------->
										
	<gw:textbox id="txtLang" styles='display:none;width:100%' />
</body>
</html>
