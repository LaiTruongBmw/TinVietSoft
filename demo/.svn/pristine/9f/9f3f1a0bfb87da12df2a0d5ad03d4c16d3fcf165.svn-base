<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Prod Incoming Entry</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>

//-----------------------------------------------------

var flag;

var G_PK        = 0,
    G_Status    = 1,
    G_SLip_No   = 2,
    G_Date      = 3,
    G_Line      = 4;

//=================================================================================
var G2_DETAIL_PK   = 0,
    G2_MASTER_PK   = 1,
    G2_SEQ         = 2,
    G2_REF_NO      = 3,
    G2_ITEM_PK     = 4,
    G2_ITEM_CODE   = 5,
    G2_ITEM_NAME   = 6,
    G2_IN_QTY      = 7,
    G2_IN_UOM      = 8,
	G2_REF_QTY	   = 9,
	G2_REF_UOM     = 10,
    G2_UNIT_PRICE  = 11,
    G2_AMOUNT      = 12,
    G2_LOT_NO      = 13,
	G2_START_TIME  = 14, 		
	G2_END_TIME	   = 15,
	G2_WORK_TIME   = 16,	
    G2_REMARK      = 17,
    G2_TABLE_PK    = 18,
    G2_TABLE_NM    = 19,
	G2_SO_D_PK	   = 20; 
    
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
	//----------------------------
    txtSlipNo.SetEnable(false);     
    txtStaffID.SetEnable(false);
    txtStaffName.SetEnable(false);
    //-------------------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;   
    //----------------------------         
    SetGridFormat();  
	//----------------------------
	data_user_line.Call();
    //----------------------------
    OnAddNew('Master');
 }	
 //==================================================================================
 
 function SetGridFormat()
 {    
     var data = ""; 
     
     data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn='Y' ORDER BY wh_name  ASC" )%>";    
     lstWH.SetDataText(data);
     
     data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' * ' || wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 and use_yn='Y' ORDER BY wh_name  ASC" )%>";    
     lstWH_Search.SetDataText(data);

     data = "<%=CtlLib.SetListDataSQL("SELECT pk,line_id || ' * ' || line_name  FROM tlg_pb_line  WHERE del_if = 0 and use_yn='Y'  ORDER BY line_id  ASC" )%>||";    
     lstSlipLine.SetDataText(data);   
	 
	 data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC0020') FROM DUAL" )%>||";    
     lstWorkShift.SetDataText(data);  

	 data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC0020') FROM DUAL" )%>||";    
     lstWorkShiftSearch.SetDataText(data); 
  	 lstWorkShiftSearch.value = '' ;

	 data = "<%=CtlLib.SetListDataSQL("SELECT pk, wp_id || ' * ' || wp_name  FROM tlg_pb_work_process WHERE del_if = 0 AND use_yn = 'Y' AND use_yn = 'Y' ORDER BY wp_id ASC" )%>||";    
	 lstWorkProcess.SetDataText(data); 
	 //----------------------------  
	 data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPC0503') FROM DUAL" )%>||";    
     lstSlipType.SetDataText(data); 
	 lstSlipType.value = "";
	 //----------------------------
     var ctr = grdDetail.GetGridControl(); 
    
     ctr.ColFormat(G2_IN_QTY)     = "#,###,###,###,###,###.##"; 
	 ctr.ColFormat(G2_REF_QTY)    = "#,###,###,###,###,###.##"; 
     ctr.ColFormat(G2_UNIT_PRICE) = "#,###,###,###,###,###.#####"; 
     ctr.ColFormat(G2_AMOUNT)     = "#,###,###,###,###,###.##"; 

     ctr.ColEditMask(G2_START_TIME) = "99:99";
     ctr.ColEditMask(G2_END_TIME)   = "99:99";
	
     arr_FormatNumber[G2_IN_QTY]     = 2;   
	 arr_FormatNumber[G2_REF_QTY]    = 2;
     arr_FormatNumber[G2_UNIT_PRICE] = 5;      
     arr_FormatNumber[G2_AMOUNT]     = 2;   
 }
 //==================================================================================
  
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'Master':              
            data_fppr00020_1.StatusInsert();
            
            txtSlipNo.text   = '***New Voucher***';
            //-------------------------------------------
            txtStaffName.text = "<%=Session("USER_NAME")%>";
            txtStaffPK.text   = "<%=Session("EMPLOYEE_PK")%>";
            //------------------------------------------- 
            grdDetail.ClearData();
            
            flag = "view";        
        break; 
		
		//==========================================
		case 'DETAIL':                          
			grdDetail.AddRow();
			
			grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, 	grdDetail.rows-1   );	
			
			grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk				
        break; 
		
        case 'SO':
            var path = System.RootURL + '/standard/forms/fp/pr/fppr00021.aspx';//purchase_yn=Y
            var object = System.OpenModal( path ,1200 , 600 ,  'resizable:yes;status:yes');
			
            if(object != null)
            {
                var arrTemp;

                for( var i=0; i < object.length; i++)	  
                {	
                            arrTemp = object[i];                                
                            grdDetail.AddRow();  
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_REF_NO,    arrTemp[3]);//item_pk
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,   arrTemp[5]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE, arrTemp[6]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME, arrTemp[7]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_IN_UOM,    arrTemp[8]);//item_uom   
							
							grdDetail.SetGridText( grdDetail.rows-1, G2_IN_QTY,   arrTemp[13]);//prod bal
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_TABLE_PK,    arrTemp[0]);  
                            grdDetail.SetGridText( grdDetail.rows-1, G2_TABLE_NM,    arrTemp[14]);  
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SO_D_PK,     arrTemp[0]);  
                 }
            }             
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
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,   arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE, arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME, arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_IN_UOM,    arrTemp[5]);//item_uom
							
							grdDetail.SetGridText( grdDetail.rows-1, G2_UNIT_PRICE, arrTemp[8]);//item_uom
                    }		            
             }        
        break;  
        
        case 'Packing':
             var path = System.RootURL + '/standard/forms/fp/pr/fppr00021.aspx';//purchase_yn=Y
             var object = System.OpenModal( path ,1100 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,   arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE, arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME, arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_IN_UOM,    arrTemp[5]);//item_uom
                    }		            
             }        
        break;   
		
        case 'WI':
             var path = System.RootURL + '/standard/forms/fp/pr/fppr00024.aspx';//purchase_yn=Y
             var object = System.OpenModal( path ,950 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk	    	                                               
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,   arrTemp[5]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE, arrTemp[6]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME, arrTemp[7]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_IN_UOM,    arrTemp[8]);//item_uom
							
							grdDetail.SetGridText( grdDetail.rows-1, G2_IN_QTY,   arrTemp[11]);//item_uom
							
							grdDetail.SetGridText( grdDetail.rows-1, G2_TABLE_PK, arrTemp[0] );//table pk
							grdDetail.SetGridText( grdDetail.rows-1, G2_TABLE_NM, arrTemp[14]);//table name
                    }		            
             }        
        break; 

        case 'SCAN':
             var path = System.RootURL + '/standard/forms/fp/ab/fpab00700.aspx?group_type=Y|Y|Y|Y|Y|Y&trans_type=I'; 
             var object = System.OpenModal( path ,1000 , 600 ,  'resizable:yes;status:yes');
             
             if ( object != null )
             {                    
                    var arrTemp;
                    for( var i=0; i < object.length; i++)	  
                    {	
                            arrTemp = object[i];
                                
                            grdDetail.AddRow();                            
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_SEQ, grdDetail.rows-1);
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_MASTER_PK, txtMasterPK.text); //master_pk	    	

							grdDetail.SetGridText( grdDetail.rows-1, G2_REF_NO, arrTemp[2] ); //master_pk	    	                							
                            
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_PK,   arrTemp[3]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_CODE, arrTemp[4]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, G2_ITEM_NAME, arrTemp[5]);//item_name	 
							
                            grdDetail.SetGridText( grdDetail.rows-1, G2_IN_UOM,    arrTemp[6]);//item_uom							
							grdDetail.SetGridText( grdDetail.rows-1, G2_IN_QTY,    arrTemp[7]);//item_uom
							
							grdDetail.SetGridText( grdDetail.rows-1, G2_LOT_NO,   arrTemp[9]);//lot no
							
							grdDetail.SetGridText( grdDetail.rows-1, G2_REMARK,   arrTemp[1]);//bc seq
							
							grdDetail.SetGridText( grdDetail.rows-1, G2_TABLE_PK, arrTemp[0] );//table pk
							grdDetail.SetGridText( grdDetail.rows-1, G2_TABLE_NM, arrTemp[11]);//table name
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
            data_fppr00020.Call("SELECT");
        break;
    
        case 'grdMaster':
        
            if ( data_fppr00020_1.GetStatus() == 20 && grdDetail.rows > 1 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSearch.row > 0 )
                    {
                        txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_PK );
                    }
                    flag = 'view' ;
                    data_fppr00020_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSearch.row > 0 )
                {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G_PK );
                }
                else
                {
                    txtMasterPK.text = '' ;
                }
                
                flag = 'view' ;
                data_fppr00020_1.Call("SELECT");
            }                               
        break;
        
        case 'grdDetail':            
            data_fppr00020_2.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "data_fppr00020_1": 
        
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

        case "data_fppr00020_2":
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G2_ITEM_CODE, grdDetail.rows - 1, G2_ITEM_CODE,  true);	            
                grdDetail.SetCellBold( 1, G2_IN_QTY, grdDetail.rows - 1, G2_IN_QTY, true);                
                grdDetail.SetCellBold( 1, G2_REF_NO, grdDetail.rows - 1, G2_REF_NO, true);
                
                grdDetail.SetCellBgColor( 1, G2_ITEM_CODE , grdDetail.rows - 1, G2_ITEM_NAME , 0xCCFFFF );       
                //-------------------------------
               var sumAmount =0
                for(var i =1 ; i<grdDetail.rows; i++ )
                 {
                    sumAmount = sumAmount + Number(grdDetail.GetGridData(i,G2_IN_QTY));
                }
                lblSumQty.text = sumAmount;
            }                  
        break;

        case 'pro_fppr00020':
            alert(txtReturnValue.text);
			//------------------
            flag = 'view' ;
            data_fppr00020_1.Call("SELECT");					
        break;    
		  
        case 'pro_fppr00020_3':
            alert(txtReturnValue.text);
            //OnSearch('grdMaster');
        break;  		
        //========================
       	
		case 'data_user_line':
			lstSearchLine.SetDataText(txtLineStr.text +"||");
            lstSearchLine.value = '';		          
            lstSlipLine.SetDataText(txtLineStr.text);
			
			data_user_warehouse.Call();
		break;
		
		case 'data_user_warehouse':			 
            lstWH.SetDataText(txtWHStr.text);
            lstWH_Search.SetDataText(txtWHStr.text);
		break;		
   }            
}

//==================================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Charger':
            var path = System.RootURL + '/standard/forms/co/lg/colg00100.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');

            if ( obj != null )
            {
                txtStaffName.text = obj[2];
                txtStaffID.text   = obj[1];
                txtStaffPK.text   = obj[0];
            }
        break; 
		
        case 'Report':
            if( txtMasterPK.text != "" )
	        {
		        var path = System.RootURL + '/standard/forms/fp/pr/fppr00023.aspx';
		        var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
 	        }
	        else
	        {
		        alert("Please, select one slip no to print!");
	        }	
        break; 

		case 'Slip_Type':			 
			 var path = System.RootURL + "/standard/forms/fp/ab/fpab00220.aspx?code_group=LGPC0503";
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
             pro_fppr00020.Call();           
        break;   
        
        case 'Deli' :
            if ( txtMasterPK.text != '' )
            {
                if ( confirm('Do you want to make outgoing slip?'))
                {
                    var path = System.RootURL + '/standard/forms/fp/pr/fppr00022.aspx?line_pk='+lstSlipLine.value;
                    var obj = System.OpenModal( path ,500 , 100 ,  'resizable:yes;status:yes');
                    if(obj!= null)
                    {
                        txtLinePK.text = obj[0];
                        pro_fppr00020_3.Call();
                    }
                } 
            }
			else
			{
				alert("PLS SELECT ONE SLIP.");
			}			                  
        break;     

		case 'COPY':
			if (txtMasterPK.text!="")
			{ 
				if ( confirm('Do you want to copy this Prod Income ?') )
				{
					pro_fppr00020_1.Call();
				}	
			}
			else
			{
				alert("Please, select one Prod Income to copy!")
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
                data_fppr00020_1.Call();
                flag='save';
            }            
        break;
        
        case 'Detail':        
            data_fppr00020_2.Call();
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

                if ( event_col == G2_IN_UOM )
                {
                    var path = System.RootURL + '/standard/forms/fp/ab/fpab00230.aspx';
	                var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
    	               
	                if ( obj != null )
	                {
	                    grdDetail.SetGridText( event_row, event_col, obj[1]);
	                }	
                }
				else if ( event_col == G2_LOT_NO )
				{
					var path = System.RootURL + '/standard/forms/fp/ab/fpab00690.aspx?item_pk=' + grdDetail.GetGridData( event_row, G2_ITEM_PK ) + '&item_code=' + grdDetail.GetGridData( event_row, G2_ITEM_CODE ) + '&item_name=' + grdDetail.GetGridData( event_row, G2_ITEM_NAME ) + '&lot_no=' + grdDetail.GetGridData( event_row, G2_LOT_NO ) + '&line_pk=' + lstSlipLine.value + '&line_name=' + lstSlipLine.GetText() ;
                    var object = System.OpenModal( path , 800 , 400,  'resizable:yes;status:yes');
                      
					if ( object != null )
                    {
						grdDetail.SetGridText( event_row, G2_LOT_NO, object[0] );
					}						
				}
				else if ( event_col == G2_IN_QTY )
				{
					var path = System.RootURL + '/standard/forms/fp/ab/fpab00770.aspx?p_table_pk=' + grdDetail.GetGridData( event_row, G2_DETAIL_PK ) + '&p_table_name=TLG_PR_PROD_INCOME_D&p_io_type=I'  ;
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
                data_fppr00020_1.StatusDelete();
                data_fppr00020_1.Call();
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
    /*for( var i = 1; i < grdDetail.rows; i++)
    {
        //---------------
        if ( Number(grdDetail.GetGridData( i, G2_IN_QTY)) == 0 )
        {
            alert("Input take in Qty. at " + i + ",pls!")
            return false;
        }
        //---------------
    }*/
    //----------------
    return true;
}

//=================================================================================

function CheckInput()
{   
    var col, row
    
    col = event.col
    row = event.row  
  
    if ( col == G2_IN_QTY || col == G2_UNIT_PRICE )
    {
        var dQuantiy ;
         
        dQuantiy = eval(grdDetail.GetGridData(row,col));
          
        if ( Number(dQuantiy) )
        {   
            if (dQuantiy >0)
            {   
                grdDetail.SetGridText( row, col, System.Round(dQuantiy, arr_FormatNumber[col]) );
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
        
        var total_amount =   Number(grdDetail.GetGridData( row, G2_IN_QTY) ) * Number( grdDetail.GetGridData( row, G2_UNIT_PRICE) ) ;     
        grdDetail.SetGridText( row, G2_AMOUNT, System.Round(total_amount, arr_FormatNumber[G2_AMOUNT]));
    }
	//----------------
	cIdx = event.col;
    
    if ( cIdx == G2_START_TIME || cIdx == G2_END_TIME )
	{
		tmpIN = grdDetail.GetGridData(event.row,cIdx)
		
		if ( tmpIN.length == 0 )
		{
			grdDetail.SetGridText(event.row, cIdx, "")
			
		}
		if( ( tmpIN.length !=4 ) && ( tmpIN.length !=0 ) )
		{
			alert("Input In time is not correct type.(type: hh:mm)")
			grdDetail.SetGridText(event.row,cIdx,'')
			return;
		}
		if((Number(tmpIN.substr(0,2))>=24)||(Number(tmpIN.substr(0,2))<0))
		{
			alert("Input In time(Hour) is not correct type.(00<= hh <= 23)")
			grdDetail.SetGridText(event.row,cIdx,'')
			return;
		}
		if((Number(tmpIN.substr(2,2))>=60)||(Number(tmpIN.substr(2,2))<0))
		{
			alert("Input In time(Minute) is not correct type.(00<= hh < 59)")
			grdDetail.SetGridText(event.row,cIdx,'')
			return;
		}
		if(tmpIN.length>0)
		{
		    tmpIN=tmpIN.substr(0,2)+":"+tmpIN.substr(2,2)
		    grdDetail.SetGridText(event.row,cIdx,tmpIN)
		}    
	}
      
}

//=================================================================================
function OnPrint(pos)
{
    var url =System.RootURL + '/standard/reports/fp/pr/rpt_fppr00020.aspx?master_pk='+ txtMasterPK.text;
	window.open(url);
}
//==================================================================================
function OnReport(pos)
{
    switch(pos)
    {
        case '0':
            var url =System.RootURL + '/standard/reports/fp/pr/rpt_fppr00021.aspx?master_pk='+ txtMasterPK.text;
	        window.open(url);
        break;
		
        case '1':
            var url =System.RootURL + '/standard/reports/fp/pr/rpt_fppr00022_DORCO.aspx?master_pk='+ txtMasterPK.text ;
	        window.open(url);
        break;
        
        case '2':
            var url =System.RootURL + '/standard/reports/fp/pr/rpt_fppr00020_1.aspx?master_pk='+ txtMasterPK.text + '&p_tin_warehouse_name='+ lstWH.GetText() + '&p_date='+ dtVoucherDate.value ;
	        window.open(url);
        break;		

		case 'DOR01':
            var url =System.RootURL + '/standard/reports/fp/pr/rpt_fppr00020_DOR01.aspx?master_pk='+ txtMasterPK.text ;
	        window.open(url);
        break;	
    }
}
 
//=================================================================================

</script>
<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
    <!---------------------------------------------------------------->
    <gw:data id="data_user_line" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_fppr00020_user_line" > 
                <input>
                    <input bind="txtUser_PK" /> 
                </input> 
                <output>
                    <output bind="txtLineStr" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_fppr00020_1" > 
                <input>
                     <inout bind="txtMasterPK" />
                </input> 
                <output>
                    <output bind="txtMasterPK" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00020_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_fppr00020_3" > 
                <input>
                    <input bind="txtMasterPK" /> 
                    <input bind="txtLinePK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="data_user_warehouse" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_fppr00020_user_wh" > 
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
    <gw:data id="data_fppr00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" parameter="0,1" function="st_lg_sel_fppr00020" > 
                <input> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
					<input bind="lstSearchLine" />               
                    <input bind="txtNoSearch" />  
					<input bind="txtEmpPK" />  
					<input bind="chkUser" />                  
                    <input bind="lstWH_Search" />
					<input bind="lstWorkShiftSearch" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_fppr00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="st_lg_sel_fppr00020_1"  procedure="st_lg_upd_fppr00020_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="dtVoucherDate" /> 

                     <inout  bind="txtRefNo" />
                                             
                     <inout  bind="txtStaffPK" />
                     <inout  bind="txtStaffID" />
                     <inout  bind="txtStaffName" />
                     
                     <inout  bind="lstSlipLine" /> 
                     <inout  bind="lstWH" />
                                          
                     <inout  bind="txtRemark" /> 
                     <inout  bind="lblStatus" />   
					 
					 <inout  bind="lstWorkShift" /> 
					 
					 <inout  bind="lstWorkProcess" />
					 <inout  bind="lstSlipType" />	
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fppr00020_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20" function="st_lg_sel_fppr00020_2"   procedure="st_lg_upd_fppr00020_2"> 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_fppr00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_fppr00020" > 
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
                                            W/H
                                        </td>
                                        <td colspan="2">
                                            <gw:list id="lstWH_Search" styles='width:100%' csstype="mandatory" />
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
                                            Line
                                        </td>
                                        <td colspan=2>
                                            <gw:list id="lstSearchLine" styles='width:100%' />
                                        </td>
                                        
                                    </tr>
									<tr>
                                        <td>
                                            W/Shift
                                        </td>
                                        <td colspan=2>
                                            <gw:list id="lstWorkShiftSearch" styles='width:100%'  />
                                        </td>
                                        
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 96%">
                            <td colspan="4" style="height:100%" class="eco_line_t">
                                <gw:grid id="grdSearch" header="_PK|Status|Slip No|Date|Line" format="0|0|0|4|0"
                                aligns="0|1|0|1|0" defaults="||||" editcol="0|0|0|0|0" widths="0|1000|1200|1200|1500"
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
                                        <td>Status : </td>
                                        <td style="width:100px"><gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' /></td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td align="right">
                                <table style="height:100%">
                                    <tr>
                                        <td>
											<gw:button id="idBtnSubmit" img="submit" text="Submit"  onclick="OnProcess('Submit')" />
										</td>
										<td>
											<gw:button id="btnPrint" img="excel" alt="Print" styles="display:none" text="Print" onclick="OnPopUp('Report')" />
										</td>
										<td >
											<gw:button id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew('Master')" />
										</td>
										<td>
											<gw:button id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" />
										</td>
										<td>
											<gw:button id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
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
                                             <gw:datebox id="dtVoucherDate" lang="1" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            <a title="Charger" onclick="OnPopUp('Charger')" href="#tips" class="eco_link"><b>Charger</b></a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:textbox id="txtStaffName" styles="width:100%" />
											<gw:textbox id="txtStaffID" styles="display:none" />
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
                                            <gw:textbox id="txtRefNo" styles="width:100%" />
                                        </td>
                                    </tr>
									<tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                            Line
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="lstSlipLine" styles='width:100%' csstype="mandatory" />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            W/H
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="lstWH" styles='width:100%' csstype="mandatory" />
                                        </td>
                                    </tr>
									<tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                            W/Shift
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="lstWorkShift" styles='width:100%'  />
                                        </td>
                                        <td align="right" style="width: 15%">
                                            W/Process
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="lstWorkProcess" styles='width:100%'  />
                                        </td>
                                    </tr>
									<tr>
                                        <td align="left" style="width: 15%; white-space: nowrap">
                                            <a title="Slip-Type" onclick="OnPopUp('Slip_Type')" href="#tips" class="eco_link">
											<b>Slip-Type</b></a>
                                        </td>
                                        <td style="width: 35%">
                                            <gw:list id="lstSlipType" styles="width:100%" onchange="" />
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
                            <td align="left" style="white-space:nowrap">
                                <table style="height:100%">
                                    <tr>
										<td style="width: 10%" align="left">
											<img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
												style="cursor: hand" onclick="OnToggle()" />
										</td>
                                        <td>Records :</td>
                                        <td style="width:100px"><gw:label id="lblRowCount" styles='width:100%;color:cc0000;font:9pt' text='' type="number" format="###,###.##" /></td>
                                        <td>Qty : </td>
                                        <td style="width:100px"><gw:label id="lblSumQty" styles='width:100%;color:blue;font:9pt;align:left' /></td>
                                    </tr>
                                </table>
                            </td>
                            <td>&nbsp;</td>
                            <td align="right">
                                <table style="height:100%">
                                    <tr>
                                        <td  style="width: 1%">
                                        <gw:button id="idBtnWI" img="popup" text="W/I" styles='width:100%' onclick="OnAddNew('WI')" />
                                    </td>
                                    <td  style="width: 1%">
                                        <gw:button id="idBtnSO" img="popup" text="S/ORDER" styles='width:100%' onclick="OnAddNew('SO')" />
                                    </td>
                                    <td  style="width: 1%">
                                        <gw:button id="idBtnFreeItem" img="item" text="ITEM" styles='width:100%' onclick="OnAddNew('FreeItem')" />
                                    </td>
									<td style="width: 1%">
										<gw:button id="btnNewD" img="new" alt="New" text="New" onclick="OnAddNew('DETAIL')" />
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
                                <gw:grid id='grdDetail' header='_PK|_MASTER_PK|Seq|Ref No|_ITEM_PK|Item Code|Item Name|In Qty|UOM|Ref Qty|UOM|U/Price|Amount|Lot No|Start Time|End Time|Work Time|Remark|_table_pk|_table_nm|_so_d_pk'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
								aligns='0|0|1|1|0|0|0|3|1|3|1|3|3|1|1|1|3|0|0|0|0'
                                check='||||||||||||||||||||' 
								editcol='0|0|1|1|0|0|0|1|0|1|0|1|1|1|1|1|1|1|0|0|0' 
								widths='0|0|1000|1500|0|2000|3000|1500|1000|1500|1000|1500|1500|1500|1200|1200|1200|1000|0|0|0'
                                sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)" />
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
<!---------------------------------------------------------------------------------->
<gw:textbox id="txtLineStr" styles="width: 100%;display: none" />
<gw:textbox id="txtWHStr" styles="width: 100%;display: none" />
<gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
<gw:textbox id="txtLinePK" styles="width: 100%;display: none" />
<gw:textbox id="txtUser_PK" styles="width: 100%;display: none" />
 <gw:checkbox id="chkUser" styles="color:blue;display:none" defaultvalue="Y|N" value="N" onchange="OnSearch('grdSearch')" />
</html>
