<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<% CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>FG Incomming</title>
</head>

<script>
   
    var  user_pk   = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name = "<%=Session("USER_NAME")%>" ;
    var  user_id   = "<%=Session("USER_ID")%>" ;
//-----------------------------------------------------
var p_update = 0 ; // status of save master or not
var bStatus =0
//---------------------------------------------------------
var iCol_PK                 = 0 ,
    iCol_take_in_pk         = 1 ,
    iCol_TAC_ABACCTCODE_PK  = 2 ,
    iCol_Acount_Code        = 3 ,
    iCol_Acount_Name        = 4 ,
    iCol_TCO_ITEM_PK        = 5 ,
    iCol_Item_Code          = 6 ,
    iCol_Item_Name          = 7 ,
    iCol_UOM                = 8 ,
    iCol_Take_In_Qty        = 9 ,
    iCol_TIN_WAREHOUSE_PK   = 10 ,
    iCol_Ware_House         = 11 ,
    iCol_company            = 12 ,
    iCol_Close              = 13,
    iCol_Slip_No            = 14,
    iCol_TIN_STOCKTR_PK     = 15;

//---------------------------------------------------------
 /*excel cols*/
    var xls_acc_code =1,
        xls_acc_name =2,
        xls_item_code =3,
        xls_item_nm =4,
        xls_uom =5,
        xls_qty =6,
        xls_warehouse =7,
        xls_company = 8;
 /*excel cols*/   
 
 //--------------------------------------------------------
 
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="70%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
 }
 
//-----------------------------------------------------

function BodyInit()
{
    BindingDataList() ;
    System.Translate(document);
	var l_fr = dtToDate.value ;
	l_fr = l_fr.substr(0, 6) + "01";
    dtFromDate.SetDataText(l_fr);
    AddOnClick(1) ;
    SetStatus();
    txtTransCode.SetEnable(false);    
    txtTransName.SetEnable(false);
    txtDebitCode.SetEnable(false);    
    txtDebitName.SetEnable(false);
    chkAuto_YN.value = 'F';
    txtSlipNo1.SetEnable(true);
	var ls_data = "<%=CtlLib.SetListDataSQL("select TRIM(CODE) code, A.code_nm FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'EACAB049' and a.code <> 'O1' ")%>";	
	lstGetData.SetDataText(ls_data);
	lstOption.value = '1';	
}

//-----------------------------------------------------
 function BindingDataList()
 {
     var data="";  
    //----------------------------   
    data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || '-' || wh_name as wh_name FROM tlg_in_warehouse WHERE del_if = 0 and use_yn = 'Y' ORDER BY wh_name ASC " )%>||Select All" ;    
    lstWH.SetDataText(data); 
     
    data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 ")%>";
    lstCompany.SetDataText( data);
    //----------------------------
    var ctrl = grdDetail.GetGridControl();
    ctrl.ColFormat(iCol_Take_In_Qty) = "###,###,###.##R" ;   
    // set data for trans type
    var ls_trtype_pk, ls_trtype_code, ls_trtype_nm ;
    ls_trtype_pk = "<%=CtlLib.SetDataSQL("select pk from tac_abtrtype where TRIM(TR_TYPE) = 'Y011' and del_if = 0 ")%>";
    ls_trtype_code = 'Y011';
    ls_trtype_nm = "<%=CtlLib.SetDataSQL("select TR_TPNM from tac_abtrtype where TRIM(TR_TYPE) = 'Y011' and del_if = 0 ")%>";
    txtTransCode.text = ls_trtype_code;
    txtTransName.text = ls_trtype_nm;
    txtabtypetr_pk.text = ls_trtype_pk;    
    // set data for employee, dept
    pro_fmgf00060_4.Call();   
 }
 //---------------------------------------------------------
 function SetStatus()
 {
    btnUnDelete_1.SetEnable(false);
    btnDelete_1.SetEnable(false);
 } 
//-----------------------------------------------------
function OnSearch(pos)
{
    switch (pos)
    {
        case 1 :        
            fmgf00060.Call("SELECT")            
        break;        
        case 2 :        
            txtMasterPK.text = grdSearch.GetGridData(event.row,0);
            txtSEQ.text = grdSearch.GetGridData(event.row, 4);
            
            fmgf00060_1.Call("SELECT")            
        break;
    }
}
//-----------------------------------------------------
function OnDataReceive(obj)
{
    var takein_qty  = 0;
    switch (obj.id)
    {
        case "fmgf00060_1" :
                if(txtAprove.GetData() == "Y")
                {
                    idBtnClose.SetEnable(false);                                
                }
                else
                {
                    idBtnClose.SetEnable(true);
                }        
                // master save -- > call save details
               if (p_update == 1 )
               {
                    SetParentPKtoGrid();
                    fmgf00060_2.Call();
                    p_update = 0 ;               
               }
               else
               {
                    fmgf00060_2.Call("SELECT");
               }
        break;
        case "fmgf00060_2":
           //-------------------------
            var iNumRecord = grdDetail.rows-1 ;
            
            if (iNumRecord>0)
            {
                btnDelete_1.SetEnable(true)
            }
            else
            {
                 btnDelete_1.SetEnable(false)
                 btnUnDelete_1.SetEnable(true)
            }
            //------------------------
            for ( i = 1 ; i < grdDetail.rows ; i++ )
            {
                if ( grdDetail.GetGridData( i, iCol_Close ) == -1 )
                {
                    grdDetail.GetGridControl().Cell( 7 , i , 0 , i, iCol_Close ) = 0x808080;      
                }
                if( grdDetail.GetGridData(i, iCol_Take_In_Qty) != '') 
                {
                    takein_qty += Number(grdDetail.GetGridData(i, iCol_Take_In_Qty)) ;
                }
            }                         
            grdDetail.AddRow();
            grdDetail.SetCellBgColor(grdDetail.rows-1, 0, grdDetail.rows-1, grdDetail.cols - 1, 0xA9EBD7);
            grdDetail.SetGridText(grdDetail.rows - 1, iCol_Acount_Code, 'TOTAL'); 
            grdDetail.SetGridText(grdDetail.rows - 1, iCol_Take_In_Qty, takein_qty); 
            
            //------------------------
            ButtonStatus();
        break;
        case "fmgf00060_3":
           //-------------------------
            var iNumRecord = grdDetail.rows-1 ;
            
            if (iNumRecord>0)
            {
                btnDelete_1.SetEnable(true)
            }
            else
            {
                 btnDelete_1.SetEnable(false)
                 btnUnDelete_1.SetEnable(true)
            }
            //------------------------
            for ( i = 1 ; i < grdDetail.rows ; i++ )
            {
                if ( grdDetail.GetGridData( i, iCol_Close ) == -1 )
                {
                    grdDetail.GetGridControl().Cell( 7 , i , 0 , i, iCol_Close ) = 0x808080;      
                } 
            } 
            //------------------------
        break;
        case "pro_fmgf00060":
            alert(txtReturnValue.text);
            fmgf00060_3.Call("SELECT");
        break;        
         case "pro_fmgf00060_1":
            alert(txtReturnValue.text);
            fmgf00060_3.Call("SELECT");
        break;
        case 'pro_fmgf00060_2':                
            alert(txtReturnValue.text);
            idBtnClose.SetEnable(false);
            fmgf00060.Call("SELECT");
        break ;
        case 'fmgf00060':
            if(grdSearch.rows > 1)
            {
				var i, l_tot_qty = 0;
				txtTotQty.SetDataText(l_tot_qty);
				for( i = 1; i < grdSearch.rows; i++)
				{
					l_tot_qty += Number(grdSearch.GetGridData(i, 5));
					if(grdSearch.GetGridData(i, 6) == '-1') // Approved = Yes
					{
						grdSearch.SetCellBgColor(i , 0, i, grdSearch.cols-1, 0xA9EBD7);
					}
				}
				txtTotQty.SetDataText(l_tot_qty);
                txtMasterPK.text = grdSearch.GetGridData(1, 0);
                txtSEQ.text = grdSearch.GetGridData(1, 4);
            }   
			
            //fmgf00060_2.Call('SELECT');
        break ;     
    }
}
//-----------------------------------------------------
 
 function SetParentPKtoGrid()
 {
        for ( i = 1; i < grdDetail.rows ; i++ )
        {
            if ( grdDetail.GetGridData(i,iCol_take_in_pk ) == "" )
            {
                grdDetail.SetGridText( i ,iCol_take_in_pk  , txtMasterPK.text ) ;
            }
        }
 }
 
 //-----------------------------------------------------
 
function AddOnClick(obj)
{
    // add new master
      switch (obj)         
      {	  
            case 1  :    
            // add new master
                
                if ( fmgf00060_1.GetStatus() != 20 )
                {
                    fmgf00060_1.StatusInsert() ;
                    
                    txtSlipNo1.text = "**New Slip No**";
                    grdDetail.ClearData();
                }
                else
                {
                    alert('Already Add New. Pls Input data !!!');
                }
                ButtonStatus();
            break;

     //add detail 
            case 2  :    
            // add detail      
            if(lstGetData.value == "GI")
            {
            
            }
            else if(lstGetData.value == "ED")
            {          
	         var path = System.RootURL + '/standard/forms/fp/ab/fpab00040.aspx?purchase_yn=N';
	         var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
	         if ( obj != null )
	         {
	                var arrTemp
                    for( var i=0; i < obj.length; i++)	  
                    {	
                            arrTemp = obj[i];
                                 
                            grdDetail.AddRow();
                            
                            grdDetail.SetGridText( grdDetail.rows-1, iCol_TAC_ABACCTCODE_PK , arrTemp[19]);//acount_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, iCol_Acount_Code, arrTemp[20]);//acount_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, iCol_Acount_Name, arrTemp[21]);//acount_name	
                            
                            grdDetail.SetGridText( grdDetail.rows-1, iCol_TCO_ITEM_PK,   arrTemp[0]);//item_pk	    
                            grdDetail.SetGridText( grdDetail.rows-1, iCol_Item_Code, arrTemp[1]);//item_code	    
                            grdDetail.SetGridText( grdDetail.rows-1, iCol_Item_Name, arrTemp[2]);//item_name	    
                            grdDetail.SetGridText( grdDetail.rows-1, iCol_UOM,   arrTemp[5]);//item_uom  
                            
                            grdDetail.SetGridText( grdDetail.rows-1, iCol_TIN_WAREHOUSE_PK, arrTemp[14] );//warehouse_pk	 
                            grdDetail.SetGridText( grdDetail.rows-1, iCol_Ware_House,   lstWH.GetText() );//warehouse_name  
                    }		            
	         }	
	         ButtonStatus(); 	              
            }	         
            break;	  	        
     }         
}
//-----------------------------------------------------
function OnChangeItem()
{
    var col, row
    
    col = event.col
    row = event.row
    
    if ( col == iCol_Ware_House)
    {
         var path = System.RootURL + '/standard/forms/fp/ab/PopUpGetWareHouse.aspx';
         var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
                       
         if ( obj != null )
         {
             grdDetail.SetGridText( row, iCol_TIN_WAREHOUSE_PK, obj[0] );//warehouse_pk	 
             grdDetail.SetGridText( row, iCol_Ware_House,   obj[2] );//warehouse_name         
	      }
    }
    else if(col ==iCol_Item_Code ||col ==iCol_Item_Name )
    {
         var path = System.RootURL + '/standard/forms/fm/gf/PopUpGetOneItem.aspx?purchase_yn=N';
             var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
             if ( obj != null )
             {
                grdDetail.SetGridText( row, iCol_TCO_ITEM_PK ,   obj[0]);//item_pk	    
                grdDetail.SetGridText( row, iCol_Item_Code, obj[1]);//item_code	    
                grdDetail.SetGridText( row, iCol_Item_Name, obj[2]);//item_name	    
                grdDetail.SetGridText( row, iCol_UOM,    obj[5]);//st_item_uom  
                grdDetail.SetGridText( row, iCol_TIN_WAREHOUSE_PK, obj[14] );//warehouse_pk	 
                grdDetail.SetGridText( row, iCol_Ware_House,   lstWH.GetText() );//warehouse_name                                                                           
             }	
    }
    else if(col==iCol_Acount_Code ||col==iCol_Acount_Name)
    {
		var fpath = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "155" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ACNT.SP_SEL_ACCT_POPUP";
		o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
		if (o != null)
		{
			if(o[0] != 0)
			{
				grdDetail.SetGridText( row, iCol_TAC_ABACCTCODE_PK ,   o[3]);//acount_pk
				grdDetail.SetGridText( row, iCol_Acount_Code, o[0]);//acount_code	    
				grdDetail.SetGridText( row, iCol_Acount_Name, o[1]);//acount_name
			}			
		}		
    }
}
//-----------------------------------------------------

function SaveOnClick(pos)
{
      switch (pos)         
      {	  
            case 1  :                
                if ( CheckSaveMaster() )
                {
                    fmgf00060_1.Call();
                    p_update = 1 ;
                }
            break ;
       }            
}

//-----------------------------------------------------
function CheckSaveMaster()
{
    if(Trim(chkAuto_YN.value) == 'F')
    {
        if(Trim(txtSlipNo1.text) == "" || Trim(txtSlipNo1.text)=="**New Slip No**" )
        {
            alert('Please enter the TakeIn No!!!');
            txtSlipNo1.GetControl().focus();
            return false ;                
        }
    }
	if(Trim(txttac_abacctcode_pk.text) == "")
	{
		alert('Please input account code for Credit account!!!');
		return false;
	}
    for (i = 1; i< grdDetail.rows ; i++)
    {
        if(grdDetail.GetGridData(i, iCol_Acount_Code)!="TOTAL")
        {
            if (grdDetail.GetGridData(i,iCol_Take_In_Qty)=="")
            {
                alert("Please, input quantity for row " + i + " !!!")
                grdDetail.DeselectRow(grdDetail.row);
                grdDetail.SelectRow(i);
                return false;
            }
            if (Trim(grdDetail.GetGridData(i, iCol_TAC_ABACCTCODE_PK))=="")
            {
                    alert("Please, input Account for row "+i+" !!!")
                    grdDetail.DeselectRow(grdDetail.row);
                    grdDetail.SelectRow(i);
                    return false;
            }
            if (grdDetail.GetGridData(i,iCol_Ware_House )=="")
            {
                    alert("Please, input Warehouse for row "+i+" !!!");
                    grdDetail.DeselectRow(grdDetail.row);
                    grdDetail.SelectRow(i);
                    return false;
            }
        }
    }    
    return true; // entered data valid
}
//----------------------Detail--------------------------------------
function OnDelete(obj)
 {
      switch (obj)         
      {	  
            case 1  :  

                var ctrl = grdDetail.GetGridControl();
	            var n    = ctrl.rows;
	            var row  = ctrl.row;
            	
	            if ( row < 0 ) 
	            {			
			            alert("Please select a Record to delete .");
	            }			
	            else 
	            {
		            if ( grdDetail.GetGridData( ctrl.row, iCol_PK ) == "" ) 
		            {						
        				
					            grdDetail.RemoveRow();					
			        }        			
			        else if(grdDetail.GetGridData(ctrl.row, iCol_Close) == '-1')
			        {
			            alert('Cannot delete because the slip has been processed');
			            return ;
			        }
		           else if ( confirm( "Do you want to mark this row to delete?" ) ) 
		           {
			            {
				            grdDetail.DeleteRow();
			            }
			            checkData();
		            }
	            }
	            
	        break;
	            
            case 0  :  
                var i ;
                for ( i = 1; i < grdDetail.rows ; i++)
                {
                    if(grdDetail.GetGridData(i, iCol_Close) == '-1')
                    {
                        alert('Cannot delete because the slip has been processed');
                        return ;
                    }    
                }     
                if ( confirm ( "Do you want to delete this request?" ) )
                {

                    fmgf00060_1.StatusDelete();
                    
                    if (txtMasterPK.text!="")                    
	                    fmgf00060_1.Call();    	                
	                else
    	            
	                    alert("Please,Select a FG Take in !")
 	             }
     	         
     	    break; 
      } 	        
 }

//---------------------------------------------------------
 function OnUnDelete() 
 {

	var ctrl = grdDetail.GetGridControl();

	var row  = ctrl.row;

		if ( row > 0 )
		{
			if ( grdDetail.GetGridData( ctrl.row, iCol_PK) == "" ) 
			{
			}
			else 
			{				
				if ( confirm ( "Do you want to undelete?" ) ) 
				{				
					grdDetail.UnDeleteRow()
				}
				checkData();
			}
		}
}

//---------------------------------------------------------

function editDetail()
{
   //check data valid
  var col, row
    col = event.col
    row = event.row
    if (col==iCol_Take_In_Qty)
    {
        dQuantiy =  grdDetail.GetGridData(row,col)
        if ( !Number(dQuantiy) )
        { 
             grdDetail.SetGridText(row,col,"")
        }
        else
        {
            if (parseFloat(dQuantiy+"")<0)
                 grdDetail.SetGridText(row,col,"")
        }
    }
}
//----------------------------------------------------------
function checkData() 
{
    
	var ctrl = grdDetail.GetGridControl();
	var n    = ctrl.rows;
	var row  = ctrl.row;	
	
	if ( n > 1 ) 
	{	
		if ( row > 0 ) 
		
		{			
			if ( grdDetail.GetRowStatus( ctrl.row ) >= 64 ) 
			{
				btnDelete_1.SetEnable(false);
				btnUnDelete_1.SetEnable(true);
			}
			else 
			{
				btnDelete_1.SetEnable(true);
				btnUnDelete_1.SetEnable(false);
			}
		}	
	}
	ButtonStatus();	
}
//-------------------------check file exist----------------
function CheckFilesExist(filepath)
{
    if (Trim(filepath)=='') 
    {
        alert("Please, select an excel source file!!")
        return false;
    }
	//test file exist
	var fso = new ActiveXObject("Scripting.FileSystemObject");		

    if (!fso.FileExists(filepath))    
      {
        alert(filepath+" doesn't exist.");        
        return false;
      }	
    return true;
}
//-------------------------read data form exel file ----------------
function ReadFiles()
{
   
    grdDetail.ClearData();
    var fl = document.getElementById("idtext").value;  
    if(CheckFilesExist(fl))
    {
        var excel = new ActiveXObject("Excel.Application");
        var excel_file = excel.Workbooks.Open(fl);
        var excel_sheet = excel.Worksheets("Sheet1");
        var file_name = excel_file.Name
        var maxRow
        maxRow = excel.Worksheets("Sheet1").UsedRange.Rows.Count
        if(maxRow>0)
       {
         var lrow,lcol,data
         /*lrow =1 is header*/
         for(lrow=2; lrow<= maxRow ; lrow++) 
         {               
               grdDetail.AddRow()   
               data = excel_sheet.Cells(lrow,xls_acc_code).Value;
               grdDetail.SetGridText(grdDetail.rows-1,iCol_Acount_Code,data);
               data = excel_sheet.Cells(lrow,xls_acc_name).Value;
               grdDetail.SetGridText(grdDetail.rows-1,iCol_Acount_Name,data);
               data = excel_sheet.Cells(lrow,xls_item_code).Value;
               grdDetail.SetGridText(grdDetail.rows-1,iCol_Item_Code,data);
               data = excel_sheet.Cells(lrow,xls_item_nm).Value;
               grdDetail.SetGridText(grdDetail.rows-1,iCol_Item_Name,data);
               data = excel_sheet.Cells(lrow,xls_uom).Value;
               grdDetail.SetGridText(grdDetail.rows-1,iCol_UOM,data);
               data = excel_sheet.Cells(lrow,xls_qty).Value;
               grdDetail.SetGridText(grdDetail.rows-1,iCol_Take_In_Qty,data);
               data = excel_sheet.Cells(lrow,xls_warehouse).Value;
               grdDetail.SetGridText(grdDetail.rows-1,iCol_Ware_House,data);
               data = excel_sheet.Cells(lrow,xls_company).Value;
               grdDetail.SetGridText(grdDetail.rows-1,iCol_company,data);
          }
       }
       excel.Workbooks.Close   ;
    }     
}
//---------------------------------------------------------------
// Confirm the vouchers
function OnClose()
{
    if(grdSearch.row < 1 )
    {
        alert('Please choose the Slip to close...');
        return ;
    }
    for ( i = 1 ; i < grdDetail.rows -1 ; i++ )
    {
        if( grdDetail.GetGridData( i, iCol_Close) == '-1')
        {
            alert('The Slip has already closed...Must unclose the Slip firstly!!!');
            return ;
        }
    }
    if(Trim(txtabtypetr_pk.text) == '')
    {
        alert('Please choose transaction group ...');
        return false ;
    }
    if(Trim(txttac_abacctcode_pk.text) == '')
    {
        alert('Please choose debit account ...');
        return false ;
    }
    txtClose_YN.text = '-1';
    pro_fmgf00060_2.Call();    
}
//---------------------------------------------------------------
// Cancel the vouchers has already confirmed
// Cancel the vouchers has already confirmed
function OnUnClose()
{
    if(grdSearch.row < 1 )
    {
        alert('Please choose the Slip to close...');
        return ;
    }

    for ( i = 1 ; i < grdDetail.rows - 1 ; i++ )
    {
        if( grdDetail.GetGridData( i, iCol_Close) == '0')
        {
            alert("The Slip hasn't been already unclosed...Must close the Slip firstly!!!");
            return ;
        }
    }
    txtClose_YN.text = '0';
    pro_fmgf00060_5.Call();
}

//---------------------------------------------------------------
///Load data from Production Result 
function OnLoadData() 
{
    if(lstOption.value == '1')
    {
         var path = System.RootURL + '/standard/forms/fm/gf/fmgf00060_Popop.aspx?tin_wh_pk=' + lstWH.value + '&tr_date=' + dtDate.value ;
         var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
         if ( obj != null )
         {            
            var i ;
            for( i = 0; i < obj.length; i++)
            {                
                var v_Arr = obj[i];
                //alert(v_Arr.length);
                grdDetail.AddRow();
                grdDetail.SetGridText(grdDetail.rows - 1, iCol_take_in_pk, txtMasterPK.GetData()); // Takein Master
                grdDetail.SetGridText(grdDetail.rows - 1, iCol_TAC_ABACCTCODE_PK, v_Arr[12]); // Tac_abacctcode_pk
                grdDetail.SetGridText(grdDetail.rows - 1, iCol_Acount_Code, v_Arr[13]); // Account Code
                grdDetail.SetGridText(grdDetail.rows - 1, iCol_Acount_Name, v_Arr[14]); // Account Name
                grdDetail.SetGridText(grdDetail.rows - 1, iCol_TCO_ITEM_PK, v_Arr[11]); // Tco_item_pk
                grdDetail.SetGridText(grdDetail.rows - 1, iCol_Item_Code, v_Arr[1]); // Item Code
                grdDetail.SetGridText(grdDetail.rows - 1, iCol_Item_Name, v_Arr[2]); // Item Name
                grdDetail.SetGridText(grdDetail.rows - 1, iCol_UOM, v_Arr[3]); // Item UOM
                grdDetail.SetGridText(grdDetail.rows - 1, iCol_Take_In_Qty, v_Arr[4]); // Q'ty
                grdDetail.SetGridText(grdDetail.rows - 1, iCol_TIN_WAREHOUSE_PK, v_Arr[10]); // Tin_warehouse_pk
                grdDetail.SetGridText(grdDetail.rows - 1, iCol_Ware_House, v_Arr[5]); // Warehouse name
                grdDetail.SetGridText(grdDetail.rows - 1, iCol_company, lstCompany.value ); // Warehouse name     
                grdDetail.SetGridText(grdDetail.rows - 1, iCol_Slip_No, v_Arr[0] ); // Slip No 
                                               
                grdDetail.SetGridText(grdDetail.rows - 1, iCol_TIN_STOCKTR_PK, v_Arr[15] ); // TIN_STOCKTR_PK
            }
         }		
    }
    else
    {         
        pro_fmgf00060.Call();
    }        
}

//---------------------------------------------------------------
// Cancel data from Production Result if has error
function OnUnLoadData()
{
    pro_fmgf00060_1.Call();
}
//---------------------------------------------------------------
// Only print out the confirmed vouchers
function OnExcel()
{
    if(Trim(txtMasterPK.text) == '')
        alert('Please choose the Slip No to print out...');
    else
    {        
        var url =System.RootURL + '/standard/reports/fm/gf/fmgf00060.aspx?tac_fgtakein_pk=' + txtMasterPK.text + '&company_pk=' + lstCompany.value ;
        System.OpenTargetPage(url); 
    }
}
//---------------------------------------------------------------
// Pop up on Trans Type and Debit Account columns
function OnPopUp(iObj)
{
    switch(iObj)
    {
        case 'Trans Type':
            var path = System.RootURL + '/standard/forms/gf/hg/gfhg00010_transaction.aspx?compk='+ lstCompany.value;
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            if( object != null )
            {
		        var tmp = object[0];
		        if (tmp[1] != null)
		        {
		            txtTransCode.text = tmp[1];
		            txtTransName.text = tmp[2];
		            txtabtypetr_pk.text = tmp[0];
                }                
            }
        break ;                    
    case 'Debit Account':
        var fpath   = System.RootURL + "/standard/forms/gf/co/ffco002004.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + txtTransCode.text + "&val1=" + txtTransName.text + "&val2=C" + "&val3=" + lstCompany.value + "&dsqlid=ACNT.SP_SEL_ACCOUNT_NEW_DRCR" ;
        var object  =   System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	        
        if(object!=null)
        {               
            var tmp = object[0];
            if( tmp != null && Trim(tmp[1]) != '' )
            {
                txtDebitCode.text = tmp[4];
                txtDebitName.text = tmp[5];
                txttac_abacctcode_pk.text = tmp[1] ;                    
            }
        }                                                    
    break ;    
    }
}
//---------------------------------------------------------------
function OnGridCellDblClick(iObj)
{
    var lcol = event.col;
    var lrow = event.row ;
    if( lcol == 4 && Trim(grdSearch.GetGridData(lrow, lcol)) != '' )
    {
        var pk = grdSearch.GetGridData(lrow, 4);
        //var status = grdSearch.GetGridData(lrow, G1TR_STATUS);

        var fpath = System.RootURL + '/standard/forms/gf/br/gfbr00030_popup.aspx?PK_ROW=' + pk + '&APPRCANCEL=2';
        var wWidth = 950;
        var wHeight = 565;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);

        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
        "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
        "lef="+ x +",top=" + y;

        var object = System.OpenModal(fpath, wWidth, wHeight, features);                
    }            
}
//---------------------------------------------------------------
// process auto-generate voucher_no or not
function OnAutoYNChange()
{
    if(chkAuto_YN.value == 'T')
    {
        txtSlipNo1.SetEnable(false);
    }
    else
    {
        txtSlipNo1.SetEnable(true);
        txtSlipNo1.GetControl().focus();
    }
}
//---------------------------------------------------------------
function ButtonStatus()
{
    var i;
    btnNew_1.SetEnable(true);
    btnDelete_1.SetEnable(true);
    btnDelete.SetEnable(true);
    btnUpdate.SetEnable(true);
    for(i = 1; i < grdDetail.rows - 1; i++)
    {
        if(grdDetail.GetGridData(i, iCol_Close) == '-1')
        {
            btnNew_1.SetEnable(false);
            btnDelete_1.SetEnable(false);
            btnDelete.SetEnable(false);
            btnUpdate.SetEnable(false);
            break ;
        }
    }    
}
//---------------------------------------------------------------
</script>

<body>
    <!-------------------------------user right ------------------------------->
    <gw:data id="fmgf00060" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="acnt.sp_sel_fmgf00060" > 
                    <input bind="grdSearch" > 
                         <input bind="txtSlipNo" /> 
                         <input bind="dtFromDate" /> 
                         <input bind="dtToDate" /> 
                     </input> 
                    <output bind="grdSearch" /> 
                </dso> 
            </xml> 
        </gw:data>
    <!-------------------------------user right ------------------------------->
    <gw:data id="fmgf00060_1" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso  type="control" function="acnt.sp_sel_fmgf00060_1" parameter="0,1,2,3,4" procedure="acnt.sp_upd_fmgf00060_1" > 
                    <inout > 
                         <inout bind="txtMasterPK" /> 
                         <inout bind="txtSlipNo1" /> 
                         <inout bind="dtDate" /> 
						 <inout bind="lstCompany" /> 
						 <inout bind="txttac_abacctcode_pk" />
						 <inout bind="txtDebitCode" /> 
						 <inout bind="txtDebitName" />	
						 <inout bind="txtAprove" />						 
                    </inout> 
                 </dso> 
            </xml> 
        </gw:data>
    <!-------------------------------------------------------------->
    <gw:data id="fmgf00060_2" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="acnt.sp_sel_fmgf00060_2" parameter ="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" procedure="acnt.sp_upd_fmgf00060_2"> 
                    <input bind="grdDetail" > 
                         <input bind="txtMasterPK" /> 
                    </input> 
                    <output bind="grdDetail" /> 
                </dso> 
            </xml> 
     </gw:data>
    <!-------------------------------------------------------------->
    <gw:data id="fmgf00060_3" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid" function="acnt.sp_sel_fmgf00060_3" > 
                    <input bind="grdDetail" > 
                         <input bind="dtDate" /> 
                    </input> 
                    <output bind="grdDetail" /> 
                </dso> 
            </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_fmgf00060" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="ACNT.sp_pro_fmgf00060" > 
                <input>
					<input bind="lstCompany" />	
                    <input bind="dtDate" />
					<input bind="lstWH" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>            
            </dso> 
        </xml> 
    </gw:data>

	
    <!------------------------------------------------------------------>
    <gw:data id="pro_fmgf00060_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="ACNT.sp_pro_fmgf00060_1" > 
                <input>
                    <input bind="dtDate" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>            
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------->
    <gw:data id="pro_fmgf00060_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="ACNT.sp_pro_fmgf00060_2" > 
                <input>
                    <input bind="lstCompany" /> 
                    <input bind="txtMasterPK" /> 
                    <input bind="txtSlipNo1" /> 
                    <input bind="dtDate" /> 
                    <input bind="txtClose_YN" />
                    <input bind="txtabtypetr_pk" />
                    <input bind="txttac_abacctcode_pk" />  
                    <input bind="txtSEQ" />
                    <input bind="txtVoucherType" />                      
                    <input bind="chkAuto_YN" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>            
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------->
    <gw:data id="pro_fmgf00060_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ACNT.sp_pro_fmgf00060_4" > 
                <input>
                    <input bind="lstCompany" /> 
                </input> 
                <output>
                    <output bind="txttac_abacctcode_pk" />
                    <output bind="txtDebitCode" />
                    <output bind="txtDebitName" />
                </output>            
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------->
    <gw:data id="pro_fmgf00060_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ACNT.sp_pro_fmgf00060_5" > 
                <input>
                    <input bind="txtTac_Hgtrh" /> 
	     <input bind="txtMasterPK" /> 					
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>            
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------->

    <table class="table" width="100%" cellpadding="0" cellspacing="0" border="1" style="height:100%" >
        <tr style="height:100%" >
            <td id="left" style="width: 30%" valign="top" >
                <!-- Table1 contain master buttons and text box -->
                <table width="100%" border="0" cellpadding="0" cellspacing="0" style="height:100%" >
                    <tr style="height:5%">
                        <td style="width: 100%;" >
                            <table width="100%" style="height: 100%" cellpadding="0" cellspacing="0" >
                                <tr>
                                    <td align="right" style="width: 25%">Take In No</td>
                                    <td style="width: 60%">
                                        <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%" />
                                    </td>
                                    <td style="width: 20%" align='right'>
                                        <gw:imgbtn id="btnSearch1" img="search" onclick='OnSearch(1)' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height:5%"  >
                        <td style="width: 100%">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" style="height:100%" >
                                <tr>
                                    <td align="right" style="width: 25%">Take In Date</td>
                                    <td style="width: 40%"><gw:datebox id="dtFromDate" lang="1" /></td>
                                    <td style="width: 40%">~<gw:datebox id="dtToDate" lang="1" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
					<tr style="height:4%"  >
                        <td style="width: 100%">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" style="height:100%" >
                                <tr>					
									<td align="right" style="width: 40%">Total Qty</td>
									<td colspan="1" style="width: 60%" align="right">
										<gw:textbox id="txtTotQty" type="number" format="###,###,###R" styles="width:100%" />
									</td>						
								</tr>	
							</table>
						</td>	
					</tr>
                    <tr style="height:90%" >
                        <td>
                            <gw:grid id="grdSearch" 
							header="_PK|Slip No|Take In Date|Acc.Voucher No|SEQ|Q'ty|Approve" 
							format="0|0|0|0|0|0|3" 
							aligns="0|0|1|0|0|3|1"
                            defaults="||||||" 
							editcol="0|0|0|0|0|0|0" 
							widths="0|2000|1200|1600|1000|1400|500" 
							styles="width:100%; height:100%"
                            sorting="T" 
							acceptNullDate="true" 
							oncellclick="OnSearch(2)" 
							oncelldblclick="OnGridCellDblClick(this)" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 70%; height:100%" valign="top">
                <table style="width: 100%; height:100%" cellpadding="0" cellspacing="0" border="0" >
                    <tr style="height:5%" >
                        <td>
                            <table style="width: 100%; height:100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 10%" align="right">Take In No</td>
                                    <td align="right" style="width:3%; "><gw:checkbox id="chkAuto_YN" onchange="OnAutoYNChange()" /></td >
                                    <td style="width: 15%">
                                        <gw:textbox id="txtSlipNo1" csstype="mandatory" styles="width:100%" />
                                    </td>
                                    <td style="width: 10%" align="right">Take In Date</td>
                                    <td style="width: 10%" align="right">
                                        <gw:datebox id="dtDate" lang="1" styles="width:100%" />
                                    </td>
                                    <td align="right" style="width: 10%">File Path</td>
                                    <td style="width: 27%">
                                        <input type="file" id="idtext" styles="width:100%" onchange="ReadFiles()" onkeypress="ReadFiles()"><br>
                                    </td>
                                    <td style="width: 3%" align="right">
                                        <gw:imgbtn id="btnNew" img="new" alt="New Reurn Goods" text="Add" onclick="AddOnClick(1)" />
                                    </td>
                                    <td style="width: 3%" align="right">
                                        <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete(0)" />
                                    </td>
                                    <td style="width: 3%" align="right">
                                        <gw:imgbtn id="btnUpdate" img="save" alt="Save" text="Save" onclick="SaveOnClick(1)" />
                                    </td>
                                    <td style="width: 3%" align="right">
                                        <gw:imgbtn id="btnPrint" img="excel" alt="Report" text="Report" onclick="OnExcel()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height:1%" >
                        <td style="width: 100%">
                            <hr noshade size="2" width="100%" style="color: Silver">
                        </td>
                    </tr>
                    <tr style="height:10%" >
                        <td>
                            <table style="width: 100%; height:100%" border="0" cellpadding="0" cellspacing="0" >
                                <tr style="height:50%">
                                    <td style="width: 10%" align="right">Company</td>
                                    <td style="width: 15%">
                                        <gw:list id="lstCompany" styles="width: 100%" />
                                    </td>
                                    <td align="right" style="width: 10%">Take In WH</td>
                                    <td align="right" style="width: 15%">
                                        <gw:list id="lstWH" styles='width:100%' />
                                    </td>
                                    <td style="width: 3%">
                                    </td>
                                    <td style="width: 8%">                                        
                                        <gw:icon id="idBtnClose" img="in" text="Confirm" styles='width:100%' onclick="OnClose()" />
                                    </td>
                                    <td style="width: 8%">
                                        <gw:icon id="idBtnUnClose" img="in" text="Cancel" styles='width:100%' onclick="OnUnClose()" />                                        
                                    </td>
                                    <td style="width: 8%">                                        
                                        <gw:icon id="idBtnLoad" img="in" text="Load" styles='width:100%;' onclick="OnLoadData()" />
                                    </td>
                                    <td style="width: 8%">
                                        <gw:icon id="idBtnUnLoad" img="in" text="CancelLoad" styles='width:100%;display:none;' onclick="OnUnLoadData()" />                                        
                                    </td>
                                    <td align="right" style="width: 5%">
                                        <gw:imgbtn id="btnNew_1" img="new" alt="New From Item" text="Add" onclick="AddOnClick(2)" />
                                    </td>
                                    <td align="right" style="width: 5%">
                                        <gw:imgbtn id="btnDelete_1" img="delete" alt="Delete" text="Delete" onclick="OnDelete(1)" />
                                    </td>
                                    <td align="right" style="width: 5%">
                                        <gw:imgbtn id="btnUnDelete_1" img="udelete" alt="Undelete" text="Undelete" onclick="OnUnDelete()" />
                                    </td>
                                </tr>
                                <tr style="height:50%">
                                    <td style="width: 10%" align="right"><a title="Click here to select transaction type" onclick="OnPopUp('Trans Type')" href="#tips">Trans Type</a></td>
                                    <td style="width: 15%"><gw:textbox id="txtTransCode" styles="width:100%;" /></td>
                                    <td align="right" style="width: 25%" colspan="2">                                        
                                        <gw:textbox id="txtTransName" styles="width:100%;" />
                                    </td>
                                    <td style="width: 11%" colspan="2" align="right">
                                        <a title="Click here to select transaction type" onclick="OnPopUp('Debit Account')" href="#tips">Credit Account</a>                                        
                                    </td>
                                    <td style="width: 8%" align="left">                                        
                                        <gw:textbox id="txtDebitCode" styles="width:100%;" />
                                    </td>
                                    <td style="width: 31%" colspan="5" align="left">                                        
                                        <gw:textbox id="txtDebitName" styles="width:100%;" />
                                    </td>
                                </tr>
								
                            </table>
                        </td>
                    </tr>
                    <tr style="height:4%" >
                        <td>
                            <table style="width: 100%; height:100%" border="0" cellpadding="0" cellspacing="0" >
								<tr>
									<td style="width:10%" align="right" >Get Data</td>
									<td style="width:20%" align="left" ><gw:list id="lstGetData" styles="width:100%" /></td>
									<td style="width:10%" align="right">Period</td>
									<td style="width:20%" align="left">
									    <gw:list id="lstOption" >
									        <data>DATA|0|Month|1|Slip</data>
									    </gw:list>
									</td>
								</tr>
							</table>
						</td>	
					</tr>
					<tr style="height:80%">
                        <td style="border-bottom:1.0pt solid silver; border-right:1.0pt solid silver">
                            <gw:grid id="grdDetail" 
                                header="_PK|_p_take_in_pk|_TAC_ABACCTCODE_PK|Account Code|Account Name|_TCO_ITEM_PK|Item Code|Item Name|UOM|TakeIn Qty|_TIN_WAREHOUSE_PK|Warehouse|_company|Close|Slip No|_TIN_STOCKTR_PK"
                                format="0|0|0|0|0|0|0|0|0|1|0|0|0|3|0|0" 
                                aligns="0|0|0|0|0|0|0|0|1|0|0|0|0|0|1|0" 
                                defaults="|||||||||||||||"
                                editcol="0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0" 
                                widths="0|0|0|1500|2000|0|1500|2000|1000|1500|0|2000|0|800|1700|0"
                                sorting="T" 
                                styles="width:100%; height:100%" 
                                onafteredit="editDetail()" 
                                oncelldblclick="OnChangeItem()"
                                oncellclick="checkData()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!----------------------------------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif"
        style="cursor: hand; position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!----------------------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles='width:100%;display:none' />
    <!----------------------------------------------------------------------------------------->
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtabtypetr_pk" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txttac_abacctcode_pk" styles='width:100%;display:none' />    
    <gw:textbox id="txtClose_YN" styles='width:100%;display:none' />
    <gw:textbox id="txtSEQ" styles='display:none' />
    <gw:textbox id="txtVoucherType" text="NTP" styles='display:none' />
    <gw:textbox id="txtAprove" styles='display:none' />
<gw:textbox id="txtTac_Hgtrh" styles='display:none' />
    <!----------------------------------------------------------------------------------------->
</body>
</html>