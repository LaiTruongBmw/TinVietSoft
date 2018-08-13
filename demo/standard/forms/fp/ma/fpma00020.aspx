<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>PROPERTY ENTRY</title>
</head>

<script type="text/javascript" language="javascript">

var p_update = 0;

var G1_ASSET_PK   = 0,
    G1_ASSET_CODE = 1,
    G1_ASSET_NAME = 2;
      
var G2_PK                      = 0,
    G2_SEQ                     = 1,
    G2_ASSET_PK                = 2,
    G2_ITEM_CODE               = 3,
    G2_ITEM_NAME               = 4,
	G2_UOM					   = 5,
	G2_NAME_1				   = 6,
	G2_NAME_2				   = 7,
    G2_QTY                     = 8,  
	G2_TR_AMOUNT			   = 9,
	G2_TR_CCY				   = 10,
	G2_EX_RATE				   = 11,
	G2_ITEM_AMOUNT			   = 12,
    G2_REMARK                  = 13,
	G2_ATT01				   = 14,
    G2_PARENT_PK			   = 15;
	
var G3_PK                      = 0,
    G3_ASSET_PK                = 1,
    G3_MA_PROCESS_PK           = 2,
    G3_PROCESS_ID              = 3,
    G3_PROCESS_NAME            = 4,
    G3_MA_LAST_DATE            = 5,
    G3_MA_NEXT_DATE            = 6,
    G3_USE_YN                  = 7,
    G3_MA_TYPE                 = 8,
    G3_MA_VALUE                = 9;

var arr_FormatNumberAssetPart    = new Array();
var arr_FormatNumberAssetProcess = new Array();
        
//=================================================================================
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("img1");   
    
    if(imgArrow.status == "expand"){
        left.style.display="none";
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/button/next.gif";
    }
    else{
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="65%";
        imgArrow.src = "../../../system/images/button/previous.gif";
    }
 }    
//=================================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	    
	txtEmpPK.text = "<%=Session("EMPLOYEE_PK")%>"  ;
	//--------------------------------------
	txtSupplierPK.SetReadOnly(true);
    txtSupplierCode.SetReadOnly(true);
    txtSupplierName.SetReadOnly(true);
    
    txtWarrantyPartnerPK.SetReadOnly(true);
    txtWarrantyPartnerCode.SetReadOnly(true);
    txtWarrantyPartnerName.SetReadOnly(true); 
    
    txtDeptPK.SetReadOnly(true);
    txtDeptID.SetReadOnly(true);
    txtDeptName.SetReadOnly(true);
    
    txtChargerCode.SetReadOnly(true);
    txtChargerName.SetReadOnly(true);  
	
	txtItemCode.SetReadOnly(true);
    txtItemName.SetReadOnly(true); 
	//-------------------------------------- 
	FormFormat();
	
    OnChangeTab('radTab');     
    //--------------------------------------            
}
//=================================================================================
function FormFormat()
{  
     var data="";  
	 
	 data = "<%=ESysLib.SetListDataSQL("select pk, DEPT_ID || ' * '| | DEPT_NAME from TLG_PO_DEPT a where  del_if=0 order by DEPT_ID")%>";       
     lstSearchDept.SetDataText(data+"||");
     lstSearchDept.value="";
         
     data = "<%=ESysLib.SetListDataSQL("select pk, asset_type_code || ' * '| | asset_type_name from tlg_ma_asset_type a where  del_if=0 order by asset_type_code")%>";       
     lstAssetType.SetDataText(data+'||'); 

	 lstSearchAssType.SetDataText(data+'||');
     lstSearchAssType.value='';
	 	 	 		 	 
	 data = "<%=ESysLib.SetListDataSQL("select pk, grp_code || ' * '| | grp_name from tlg_ma_asset_group a where  del_if=0 order by grp_code")%>";       
     lstAssetGroup.SetDataText(data+'||');
	 
	 lstSearchAssGrp.SetDataText(data+'||');
     lstSearchAssGrp.value='';
	
	 data = "<%=ESysLib.SetListDataSQL("select  UOM_CODE, UOM_CODE  from TLG_IT_UOM where del_if=0  order by 1 ")%>";   
     lstUOM.SetDataText(data); 
          
     data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
     lstCCY.SetDataText(data);
     
     data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPC1130' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";
     grdAssetProcess.SetComboFormat(G3_MA_TYPE,data);
	 
	 data = "<%=ESysLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0100' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";
     grdAssetPart.SetComboFormat(G2_TR_CCY,data);
	 
	 data = "<%=ESysLib.SetGridColumnDataSQL("select  UOM_CODE, UOM_CODE  from TLG_IT_UOM where del_if=0  order by 1 " ) %> ";
     grdAssetPart.SetComboFormat(G2_UOM,data);	 
	 
	 data = "data|1|WAITING|2|RUNNING|3|UN-USE|4|REPAIRING|5|LOST|6|LENDING|7|LIQUIDATED||";
     lstStatusSearch.SetDataText(data); 
	 lstStatusSearch.value = '' ;
	 // PO TYPE
	 data = "<%=ESysLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGPO2001') FROM DUAL")%>||";  //po type
     lstPOType.SetDataText(data);
	 
	 data = "data|10|100% NEW|20|SECOND HAND||";
     lstAssetCategory.SetDataText(data); 
	 lstAssetCategory.value = '' ;
	 //-----------------------------
	 var ctrl = grdAssetPart.GetGridControl();
	 ctrl.ColFormat(G2_TR_AMOUNT)   = "###,###,###,###,###.##";
     ctrl.ColFormat(G2_QTY)         = "###,###,###,###,###";
	 ctrl.ColFormat(G2_ITEM_AMOUNT) = "###,###,###,###,###.##";
	 ctrl.ColFormat(G2_EX_RATE)     = "###,###,###,###,###.##";
	 
	 arr_FormatNumberAssetPart[G2_TR_AMOUNT]   = 2;
	 arr_FormatNumberAssetPart[G2_QTY]         = 0;
	 arr_FormatNumberAssetPart[G2_ITEM_AMOUNT] = 2;
	 arr_FormatNumberAssetPart[G2_EX_RATE]     = 2;
	 //-------
     ctrl = grdAssetProcess.GetGridControl();
     ctrl.ColFormat(G3_MA_VALUE) = "###,###,###,###,###";
	 
	 arr_FormatNumberAssetProcess[G3_MA_VALUE] = 0;
	 
}
 
//=================================================================================
function OnGridCellAfterEdit(objGrid)
{
    var col, row
    col = event.col
    row = event.row    
    switch(objGrid.id)
    {         
        case 'grdAssetProcess':
            if ( col == G3_MA_VALUE )
            {
                var dSeq ;
                
                dSeq =  objGrid.GetGridData(row,col) ;
                
                if (Number(dSeq))
                {   
                    if (dSeq >0)
                    {                 
						objGrid.SetGridText( row, col, System.Round( dSeq, arr_FormatNumberAssetProcess[col] ));                        
                    }
                    else
                    {
                        alert(" Value must greater than zero !!");
                        objGrid.SetGridText( row, col, "1");
                    }
                }
                else
                {
                    objGrid.SetGridText(row,col,"1") ;
                }     								 
            }			
			//-----------------
			if ( col == G3_MA_VALUE )
			{
                if(objGrid.GetGridData(row,G3_MA_LAST_DATE)=='')
                {
                    alert('Pls input last date');
                    return;
                }
			}	 
			//------------------         
        break;
		
		case 'grdAssetPart':
            if ( col == G2_QTY || col == G2_TR_AMOUNT || col == G2_ITEM_AMOUNT || col == G2_EX_RATE )
            {
                var dQuantiy =  objGrid.GetGridData(row,col) ;
                
                if (Number(dQuantiy))
                {   
                    if (dQuantiy >0)
                    {                        
                        objGrid.SetGridText( row, col, System.Round( dQuantiy, arr_FormatNumberAssetPart[col] ));  
                    }
                    else
                    {                      
                        objGrid.SetGridText( row, col, "");
                    }
                }
                else
        		{
            		objGrid.SetGridText(row,col,"") ;
        		} 
				
				if ( col == G2_TR_AMOUNT || col == G2_EX_RATE )
				{
					dQuantiy = objGrid.GetGridData( row, G2_TR_AMOUNT) * objGrid.GetGridData( row, G2_EX_RATE) ;
					objGrid.SetGridText( row, G2_ITEM_AMOUNT, System.Round( dQuantiy, arr_FormatNumberAssetPart[G2_ITEM_AMOUNT] )); 
				}
            }
			//------
            if ( col == G2_ITEM_AMOUNT )
			{
				AssetAmount();
			}
        break;		
    }
}     
 //=====================================================================================
 
 function AssetAmount()
 {
	   var vItemAmt = 0 ;
	
       for (var i = 1; i<grdAssetPart.rows; i++)
       {
            if(grdAssetPart.GetRowStatus(i) == 64)
            {
                txtAssetAmount.text = Number(txtAssetAmount.text) - Number( grdAssetPart.GetGridData(i, G2_ITEM_AMOUNT ));
            }
            else
            {
                vItemAmt = vItemAmt + Number( grdAssetPart.GetGridData(i, G2_ITEM_AMOUNT ));			 						              
            }
       }       
	    
       txtAssetAmount.text = vItemAmt + "" ;	 	 
 }
//=================================================================================
function OnAddNew(pos)
{
	switch(pos)
	{
		case 'ASSET' :
			if ( radTab.value == 2 )
			{ 
				if(txtAssetPK.text == '')
	            {
	                alert('Please Select Item!');   
	                return;
	            }					            
				
	            var path = System.RootURL + '/form/fp/ma/fpma00012.aspx';
		        var object = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes;');
				
		        if(object!=null)
		        {
		            var objGrid = grdAssetProcess;
	                objGrid.AddRow();
	                objGrid.SetGridText( objGrid.rows-1, G3_ASSET_PK      , txtAssetPK.text );
					
	                objGrid.SetGridText( objGrid.rows-1, G3_PROCESS_ID    , object[3] );
	                objGrid.SetGridText( objGrid.rows-1, G3_PROCESS_NAME  , object[4] );
	                objGrid.SetGridText( objGrid.rows-1, G3_MA_PROCESS_PK , object[0] );
	                objGrid.SetGridText( objGrid.rows-1, G3_MA_TYPE       , object[2] );
					
	                objGrid.SetGridText( objGrid.rows-1, G3_USE_YN        , -1 );
	            } 
			}	
			else	
			{
				if ( data_fpma00020_1.GetStatus() != 20 )
			    {
			        data_fpma00020_1.StatusInsert();
					
					txtAssetCode.text = "<<New Code>>";
					txtAssetName.text = "<<New Name>>";
					
					txtMAQty.text   = "1";
					chkPMS.value    = "Y";
					chkDeprSD.value = "Y";
					
			        grdAssetPart.ClearData();
			        grdAssetProcess.ClearData();
			    }
			    else
			    {
			        alert("Already add new. Pls input data !!!");
			    }			
			}		
		break;
		
		case 'MANY-ASSET':
   			var path = System.RootURL + "/form/fp/ma/fpma00130.aspx";
   			var object = System.OpenModal( path ,1000 , 550 ,  'resizable:yes;status:yes');		
		break;
		
		case 'FREE-PART':
   			if ( txtAssetPK.text == '' )
            {
                alert('Please Select Asset !');   
                return;
            }
			
			grdAssetPart.AddRow();	
			grdAssetPart.SetGridText( grdAssetPart.rows-1, G2_PARENT_PK , txtAssetPK.text );
			
		break;
			 
		case 'PART':
            if ( txtAssetPK.text == '' )
            {
                alert('Please Select Asset !');   
                return;
            }

	        var path = System.RootURL + '/form/fp/ma/fpma00022.aspx'; 
	        var object = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
			
	        if ( object != null )
	        {
	            var objGrid = grdAssetPart;
                for(var i = 0; i< object.length; i++)
                {                    					
                    var arrTemp = object[i];  
					
					objGrid.AddRow();     
					             
                    objGrid.SetGridText( objGrid.rows-1, G2_SEQ ,       objGrid.rows-1 );
                    objGrid.SetGridText( objGrid.rows-1, G2_ASSET_PK  , arrTemp[0]     );
                    objGrid.SetGridText( objGrid.rows-1, G2_ITEM_CODE , arrTemp[1]     );
                    objGrid.SetGridText( objGrid.rows-1, G2_ITEM_NAME , arrTemp[2]     );
					
					objGrid.SetGridText( objGrid.rows-1, G2_PARENT_PK , txtAssetPK.text );
                }
           }                
        
		break;
	}	    
}
 
//=================================================================================
function OnSave(pos)
{ 
      switch (pos)         
      {		        
            case 'MASTER' :
           
				if ( confirm("Do you want to save this asset?") )
				{
					p_update = 1;
                	data_fpma00020_1.Call();
				}	
            break; 
      }  
}
//=================================================================================
function OnCopy()
{
    if (txtAssetPK.text != "")
    {
		if ( confirm("Do you want to copy this Asset?") )
		{
        	pro_fpma00020_4.Call();
		}	
    }
    else
    {
        alert("Please Select one Asset to Copy !!!");
    }
}
//=================================================================================
function OnDataReceive(p_oData)
{
  	switch(p_oData.id)
  	{
	    case 'data_fpma00020':
			if ( grdAsset.rows > 1 )
			{
				grdAsset.SetCellBold( 1, G1_ASSET_CODE, grdAsset.rows - 1, G1_ASSET_CODE, true);
				grdAsset.SetCellBgColor( 1, G1_ASSET_CODE, grdAsset.rows - 1, G1_ASSET_CODE, 0xCCFFFF );
			}
			
	        lblRecord.text = (grdAsset.rows - 1) + ' (s)';
	    break;
		
	    case 'data_fpma00020_1':
	        if( p_update == 1 )
	        {
				data_fpma00020_2.Call();
			}
			else
			{		             
	             data_fpma00020_2.Call('SELECT');	    
	        }	       
	    break;
	    
	    case 'data_fpma00020_2':
	        lblTotalCount.text = grdAssetPart.rows - 1 + ' (s)';
			
	        if( p_update == 1 )
	        {
				var objGrid = grdAssetProcess;
                for(var i =0; i < objGrid.rows; i ++)
                {
                    if ( objGrid.GetGridData( i, G3_MA_LAST_DATE) == '')
                    {
                        alert('Pls choose last date!');
						p_update = 0;
                        return;
                    }
					//--------
                    if( objGrid.GetGridData(i, G3_MA_VALUE)=='')
                    {
                        alert('Pls input maintenance type value!');
						p_update = 0;
                        return;
                    }
                }
										
				data_fpma00020_3.Call();
			}
			else
			{		             
	            data_fpma00020_3.Call('SELECT');	    
	        }	
	    break;
		
		case  'data_fpma00020_3':
		
	        p_update = 0 ;
				         		
		break;
		
	    case'pro_fpma00020_4':
	        alert(txtValueReturn.text);
	    break;    
  	}
}
//=================================================================================
function OnDelete(pos) 
{
    if( radTab.GetData() == '1')//Xu ly cho Asset Info
    {
        switch (pos)
        {
             case 'DETAIL' :
                var objGrid = grdAssetPart;
	            if(objGrid.rows-1>0)
	            { 	        
	                if ( objGrid.GetGridData( objGrid.row, G2_PK ) == "" ) 
	                {						
				        objGrid.RemoveRow();
                        AssetAmount();					
		            }			
		            else 
		            {
			            objGrid.DeleteRow();
                        AssetAmount();
                    }
                }	   
	        break;
	        case 'MASTER':
	            if ( confirm ("Do you want to delete this asset?" ))
                {
                    data_fpma00020_1.StatusDelete();            
                    if (txtAssetPK.text!="")            
                        data_fpma00020_1.Call()                
                    else            
                        alert("Please,Select a Item !")
                }
	        break;    	   
        }
     }
     else// Xu ly cho Maintain Shedule 
     {
        var objGrid = grdAssetProcess;
        if(objGrid.rows-1>0)
        { 	        
            if ( objGrid.GetGridData( objGrid.row, G3_PK ) == "" ) 
            {						
    		
		        objGrid.RemoveRow();					
            }			
            else 
            {
	            objGrid.DeleteRow();
            }
        }	   
     }
}
//=================================================================================
    function OnReport(obj)
    {
        var url = '';
        switch(obj)
        {
            case 'AssetLabel':
                var arr_pk = "";
                var comma  = "";
                for(var i = 1; i < grdAsset.rows; i++)
                {
                    if ( grdAsset.GetGridControl().isSelected(i) == true )
                    {
                        arr_pk +=  comma + grdAsset.GetGridData( i, G1_ASSET_PK);
                        comma = ",";
                    }
                }
                url='/reports/fp/ma/rpt_fpma00020.aspx?p_asset_pk=' + arr_pk;
            break;
				
            case 'btnExcel2':
                url='/reports/fp/ip/rpt_fpip00030_1.aspx?p_factory_pk='+ lstLineGroup.value +'&p_from_date='+ dtDate.value;  
                break;
            default:
			
                return;
        }
		//----------------------------
        if(url != '')
        {
            window.open(System.RootURL+url);
        }
    }
//=================================================================================
function OnPopUp(pos)
{ 
    switch(pos)
    {
        case 'Charger':
            var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
            var obj = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
            if ( obj != null )
            {
                txtChargerName.text = obj[2];
                txtChargerCode.text = obj[1];
                txtChargerPK.text   = obj[0];
            }
        break;
		
        case 'Supplier':
            var path = System.RootURL + "/form/fp/ab/fpab00120.aspx?partner_type=AP";
	         var object = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
	         if ( object != null )
	         {
	            txtSupplierPK.text   = object[0];
	            txtSupplierCode.text = object[1];                
                txtSupplierName.text = object[2];                
	         }
        break;
		
        case 'Warranty_Partner':
             var path = System.RootURL + "/form/fp/ab/fpab00120.aspx?partner_type=AP";
             var object = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
             if ( object != null )
             {
                txtWarrantyPartnerPK.text   = object[0];
                txtWarrantyPartnerCode.text = object[1];                
                txtWarrantyPartnerName.text = object[2];                
             }
        break; 
		
		case 'Item':
             var path = System.RootURL + "/form/fp/ab/fpab00110.aspx?group_type=Y|Y|Y|Y|Y|Y";
             var object = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
             if ( object != null )
             {
                txtItemPK.text   = object[0];
                txtItemCode.text = object[1];                
                txtItemName.text = object[2];                
             }
        break; 	
		
		case 'EXP_01':
			 var fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
             var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
              
              if ( aValue != null )
              {      
                  txtExpACC01CODE.text = aValue[1] ;
                  txtExpACC01NAME.text = aValue[2] ; 
              }		
		break;	  
		case 'EXP_02':
			 var fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
             var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
              
              if ( aValue != null )
              {      
                  txtExpACC02CODE.text = aValue[1] ;
                  txtExpACC02NAME.text = aValue[2] ; 
              }		
		break;	  
		
		case 'EXP_03':
			 var fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
             var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
              
              if ( aValue != null )
              {      
                  txtExpACC03CODE.text = aValue[1] ;
                  txtExpACC03NAME.text = aValue[2] ; 
              }		
		break;	  
		
		case 'EXP_04':
			 var fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
             var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
              
              if ( aValue != null )
              {      
                  txtExpACC04CODE.text = aValue[1] ;
                  txtExpACC04NAME.text = aValue[2] ; 
              }		
		break;	  
		
		case 'EXP_05':
			 var fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
             var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
              
              if ( aValue != null )
              {      
                  txtExpACC05CODE.text = aValue[1] ;
                  txtExpACC05NAME.text = aValue[2] ; 
              }		
		break;

		case 'ASS_01':
			 var fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
             var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
              
              if ( aValue != null )
              {      
                  txtAssACC01CODE.text = aValue[1] ;
                  txtAssACC01NAME.text = aValue[2] ; 
              }		
		break;		
		
		case 'DEPR_01':
			 var fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
             var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
              
              if ( aValue != null )
              {      
                  txtDeprACC01CODE.text = aValue[1] ;
                  txtDeprACC01NAME.text = aValue[2] ; 
              }		
		break;	
		
		case 'FileAttachList':
		
	    	if(txtAssetPK.text !="")
            {
		         var fpath  = System.RootURL + '/form/fp/ma/fpma00024.aspx?master_pk=' + txtAssetPK.text;
                 var aValue = System.OpenModal(  fpath , 700 , 300 , 'resizable:yes;status:yes;scroll:no');                  
            }
            else
            {
                alert("Select one Asset to Attach file(s) list !!!")
            }
			
		break;              
    } 
} 
 
//=================================================================================
function OnSearch(pos)
{     
    switch(pos)
    {
        case'grdAsset':
            data_fpma00020.Call("SELECT");
        break;
        
        case 'MA_ASSET':
		
            p_update = 0;
									            		                                 
            if ( grdAsset.row > 0 )
            {
				txtAssetPK.text   = grdAsset.GetGridData( grdAsset.row, G1_ASSET_PK   );	
				   
                data_fpma00020_1.Call('SELECT');
            }
        break;
    }   
	
}
//=================================================================================
function  OnUndelete(objGrid)
{
    switch (objGrid.id)
     { 
          case 'grdAssetPart' :
            if(objGrid.rows-1 > 0) 
            {   
                objGrid.UnDeleteRow();
                AssetAmount();
            }  
           break;
     }
}
//=================================================================================
function OnGridCellDblClick(objGrid)
{
     var row,col 
     row = event.row;
     col = event.col;
     if(objGrid.rows>0)
     {
        var path = System.RootURL + '/form/fp/ma/fpma00021.aspx?ProcessPK=' + objGrid.GetGridData(row,G3_MA_PROCESS_PK) + "&ProcessID=" +  objGrid.GetGridData(row,G3_PROCESS_ID) + "&ProcessName=" +  objGrid.GetGridData(row,G3_PROCESS_NAME);
        var object  = System.OpenModal( path ,800 , 600 ,  'scroll:no;resizable:yes;status:yes');
    }
}                  
 
//=================================================================================

 function OnChangeTab(objtab)
 {    
    var p_Asset_Info       = document.all("p_Asset_Info");    
    var p_Maintain_Shedule = document.all("p_Maintain_Shedule"); 
	var p_Others_Info      = document.all("p_Others_Info");  
	
    switch ( radTab.GetData() )
	{
		case '1' :	
			
        	p_Asset_Info.style.display       = "";
        	p_Maintain_Shedule.style.display = "none";
			p_Others_Info.style.display      = "none";
		
        	document.all("Asset_Info").style.color       = "cc0000"; 
        	document.all("Maintain_Shedule").style.color = "";
			document.all("Others_Info").style.color      = "";		
		break;	
		
		case '2' :			 
			
	        p_Asset_Info.style.display       = "none";
	        p_Maintain_Shedule.style.display = "";
			p_Others_Info.style.display      = "none";
			
	        document.all("Asset_Info").style.color       = ""; 
	        document.all("Maintain_Shedule").style.color = "cc0000";
			document.all("Others_Info").style.color      = "";
		break;
		
		case '3' :			 
			
	        p_Asset_Info.style.display       = "none";
	        p_Maintain_Shedule.style.display = "none";
			p_Others_Info.style.display      = "";
			
	        document.all("Asset_Info").style.color       = ""; 
	        document.all("Maintain_Shedule").style.color = "";
			document.all("Others_Info").style.color      = "cc0000";
		break;		
    }     
 }
//========================================================================================
function OnViewPicture()
{
    if(txtAssetPK.text !="")
    {
          var path   = System.RootURL + '/form/fp/ma/fpma00023.aspx?pk=' + txtAssetPK.text;
          var object = System.OpenModal( path , 400 , 300, 'resizable:yes;status:yes');
   
    }else
    {
        alert("Select one Asset to view Image !!!")
    }
}
//========================================================================================
</script>

<body>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00020" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00020"> 
                <input bind="grdAsset" >
					<input bind="lstSearchDept" />
                    <input bind="lstSearchAssGrp" />
					<input bind="lstSearchAssType" />
                    <input bind="txtAssetSearch" /> 
					<input bind="lstStatusSearch" />					 					
                </input>
                <output  bind="grdAsset" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpma00020_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62" function="<%=l_user%>lg_sel_fpma00020_1"  procedure="<%=l_user%>lg_upd_fpma00020_1"> 
                <inout> 
                    <inout bind="txtAssetPK" />                 
                    <inout bind="txtAssetCode"/>
                    <inout bind="txtAssetName"/> 
                                    
                    <inout bind="lstUOM"/>
                    
                    <inout bind="dtWarrFrDate" />
                    <inout bind="dtWarrToDate" />
                    
                    <inout bind="txtSupplierPK"/>
                    <inout bind="txtSupplierCode"/>
                    <inout bind="txtSupplierName"/>  
                                      
                    <inout bind="txtWarrantyPartnerPK"/>
                    <inout bind="txtWarrantyPartnerCode"/>
                    <inout bind="txtWarrantyPartnerName"/>
                    
                    <inout bind="txtFN01"/>
                    <inout bind="txtFN02"/>
                    
                    <inout bind="txtChargerPK"/>
                    <inout bind="txtChargerCode"/>
                    <inout bind="txtChargerName"/>
                    
                    <inout bind="txtBrand"/>
                    
                    <inout bind="txtModel" />
                    
                    <inout bind="dtCheckingDate" />
                    <inout bind="chkPMS" />
                    <inout bind="txtSerialNumber" />
                    
                    <inout bind="dtUseFrDate"/>
                    <inout bind="dtUseToDate"/>
                    
                    <inout bind="txtAssetAmount" />
                    
                    <inout bind="lstCCY" />
                    
                    <inout bind="txtExRate" />
                    
                    <inout bind="txtDeptPK" />
                    <inout bind="txtDeptID" />
                    <inout bind="txtDeptName" />
                    
                    <inout bind="lstAssetType"/>
					<inout bind="lstAssetGroup"/>
                    
                    <inout bind="txtDescription"/>
                    <inout bind="lblStatus"/>
			 		
			 		<inout bind="dtDoc" />
					<inout bind="txtDocNo" />
					
					<inout bind="txtItemPK" />
					<inout bind="txtItemCode" />
					<inout bind="txtItemName" />
					
					<inout bind="txtMAQty" />
					<inout bind="lstPOType" />
					
					<inout bind="chkDeprSD" />
					<inout bind="txtAccSlipNo" />
					<inout bind="dtAccSlipDate" />
					
					<inout bind="txtExpACC01CODE" />
					<inout bind="txtExpACC01NAME" />
					
					<inout bind="txtExpACC02CODE" />
					<inout bind="txtExpACC02NAME" />
					
					<inout bind="txtExpACC03CODE" />
					<inout bind="txtExpACC03NAME" />
					
					<inout bind="txtExpACC04CODE" />
					<inout bind="txtExpACC04NAME" />
					
					<inout bind="txtExpACC05CODE" />
					<inout bind="txtExpACC05NAME" />
					
					<inout bind="txtInvoiceNo" />
					<inout bind="dtInvoiceDoc" />
					
					<inout bind="txtDocAmount" />
					<inout bind="lstAssetCategory" />
					
					<inout bind="txtAssACC01CODE" />
					<inout bind="txtAssACC01NAME" />
					
					<inout bind="txtDeprACC01CODE" />
					<inout bind="txtDeprACC01NAME" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpma00020_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3"  type="grid" user="prod" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="<%=l_user%>lg_sel_fpma00020_2" procedure="<%=l_user%>lg_upd_fpma00020_2" > 
                <input>
                    <input bind="txtAssetPK" /> 
                </input> 
                <output bind="grdAssetPart" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpma00020_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="4"  type="grid" user="prod" parameter="0,1,2,5,6,7,8,9" function="<%=l_user%>lg_sel_fpma00020_3" procedure="<%=l_user%>lg_upd_fpma00020_3" > 
                <input>
                    <input bind="txtAssetPK" /> 
                </input> 
                <output bind="grdAssetProcess" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="pro_fpma00020_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="<%=l_user%>lg_pro_fpma00020_4" > 
                <input>
                  <input bind="txtAssetPK" />
                  <input bind="txtEmpPK" />
                </input> 
                <output>
                <output bind="txtValueReturn" /> 
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr>
            <td style="width: 35%; height: 100%" id="left">
                <table id="LeftBottomTB" style="width: 100%; height: 100%">
                    <tr>
                        <td style="width: 5%; white-space: nowrap" align="right">
                            Dept
                        </td>
                        <td colspan="4">
                            <gw:list id="lstSearchDept" styles="width:100%" onchange="OnSearch('grdAsset')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap;" align="right">
                            Group
                        </td>
                        <td style="width: 95%" colspan="4">
                            <gw:list id="lstSearchAssGrp" styles="width:100%;" onchange="OnSearch('grdAsset')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%; white-space: nowrap;" align="right">
                            Type
                        </td>
                        <td style="width: 95%" colspan="4">
                            <gw:list id="lstSearchAssType" styles="width:100%;" onchange="OnSearch('grdAsset')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Asset
                        </td>
                        <td style="width: 95%" colspan="4">
                            <gw:textbox id="txtAssetSearch" styles='width:100%' onenterkey="OnSearch('grdAsset')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Status
                        </td>
                        <td style="width: 65%">
                            <gw:list id="lstStatusSearch" styles="width:100%;" onchange="OnSearch('grdAsset')" />
                        </td>
                        <td style="width: 25%; white-space: nowrap" align="center">
                            <gw:label img="new" id="lblRecord" styles="color:#CC0000;" text="(s)" />
                        </td>
                        <td style="width: 5%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch('grdAsset')" />
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="4">
                            <gw:grid id='grdAsset' header='_PK|Asset Code|Asset Name' format='1|0|0' aligns='0|0|0'
                                defaults='||' editcol='0|0|0' widths='0|1500|2000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('MA_ASSET')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 65%; height: 100%" align="center" valign="top" id="right">
                <table style="width: 100%; height: 100%">
                    <tr style="width: 100%; height: 1%">
                        <td style="width: 10%">
                            <img status="expand" id="img1" src="../../../system/images/button/previous.gif" style="cursor: hand;
                                position: static" onclick="OnToggle()" />
                        </td>
                        <td style="width: 50%; white-space: nowrap" align="center">
                            <gw:radio id="radTab" value="1" styles="width:100%" onchange="OnChangeTab('radTab')"> 
                                <span value="1" id="Asset_Info">Asset Info</span> 								 
                                <span value="2" id="Maintain_Shedule">Maintain Schedule</span> 
								<span value="3" id="Others_Info">Others Info</span> 
                            </gw:radio>
                        </td>
                        <td style="width: 30%" align="center">
                            <gw:label id="lblStatus" styles="width:100%;color:cc0000;font:9pt" text="-" />
                        </td>
                        <td style="width: 2%">
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnExcel" img="excel" alt="Print Asset Label" text="Print Asset Label"
                                onclick="OnReport('AssetLabel')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:icon id="idBtnAdd" img="2" text="Assets" styles='width:100%' onclick="OnAddNew('MANY-ASSET')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnPicture" img="attach" alt="Picture" onclick="OnViewPicture()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn id="btnFileAttachList" img="attach" alt="List File Attach" onclick="OnPopUp('FileAttachList')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="copy" alt="Copy" id="btnCopy" onclick="OnCopy()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="new" alt="New" id="btnNewTab1" onclick="OnAddNew('ASSET')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnDeleteTab1" img="delete" alt="Delete" text="Delete" onclick="OnDelete('MASTER')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSave" img="save" alt="Save" text="Save" onclick="OnSave('MASTER')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="12">
                            <hr noshade size="1" style="color: Silver" />
                        </td>
                    </tr>
                    <tr style="width: 100%; height: 1%">
                        <td style="width: 10%" align="right">
                            Asset
                        </td>
                        <td style="white-space: nowrap" colspan="5">
                            <gw:textbox id="txtAssetPK" maxlen="100" styles='width:100%;display:none' />
                            <gw:textbox id="txtAssetCode" csstype="mandatory" styles='width:30%' />
                            <gw:textbox id="txtAssetName" csstype="mandatory" styles='width:70%' />
                        </td>
                        <td colspan="2" align="right">
                            UOM
                        </td>
                        <td colspan="4">
                            <gw:list id="lstUOM" styles="width:100%" />
                        </td>
                    </tr>
                    <tr style="width: 100%; height: 1%">
                        <td style="width: 10%" align="right">
                            <a title="Item" onclick="OnPopUp('Item')" href="#tips" style="color: #0000ff"><b>Item</b></a>
                        </td>
                        <td style="white-space: nowrap" colspan="5">
                            <gw:textbox id="txtItemPK" maxlen="100" styles='width:100%;display:none' />
                            <gw:textbox id="txtItemCode" styles='width:30%' />
                            <gw:textbox id="txtItemName" styles='width:70%' />
                        </td>
                        <td colspan="2" align="right">
                            Qty
                        </td>
                        <td colspan="4">
                            <gw:textbox id="txtMAQty" styles='width:100%' type="number" format="###,###,###.##" />
                        </td>
                    </tr>
                    <tr style="width: 100%;">
                        <td colspan="12">
                            <%--Noi dung tab Asset Info--%>
                            <table id="p_Asset_Info" style="width: 100%; height: 100%">
								<tr style="width: 100%; height: 1%" >
									<td>
									
										<table style="width: 100%; height: 100%; background-color: #B4E7FF">
										 
	            		                     <tr style="height: 1%; background-color: #B4E7FF">
			                                    <td style="width: 5%; white-space: nowrap">
			                                        Dept
			                                    </td>
			                                    <td style="width: 45%; white-space: nowrap">
			                                        <gw:textbox id="txtDeptPK" maxlen="100" styles='width:100%;display:none' />
			                                        <gw:textbox id="txtDeptID" styles='width:30%' />
			                                        <gw:textbox id="txtDeptName" styles='width:70%' />
			                                    </td>
			                                    <td style="width: 5%">
			                                        Charger
			                                    </td>
			                                    <td style="width: 45%; white-space: nowrap;" colspan="2">
			                                        <gw:textbox id="txtChargerPK" maxlen="100" styles='width:100%;display:none' />
			                                        <gw:textbox id="txtChargerCode" styles='width:30%' />
			                                        <gw:textbox id="txtChargerName" styles='width:70%' />
			                                    </td>
			                                </tr>
			                                 <tr style="height: 1%; background-color: #B4E7FF">
			                                    <td style="width: 5%; white-space: nowrap" align="left">
			                                        Group
			                                    </td>
			                                    <td style="width: 45%; white-space: nowrap" align="left">
			                                        <gw:list id="lstAssetGroup" styles="width:100%;" onchange="" />
			                                    </td>
			                                    <td style="width: 5%; white-space: nowrap">
			                                        Use Date
			                                    </td>
			                                    <td style="width: 45%; white-space: nowrap;" colspan="2">
			                                        <gw:datebox id="dtUseFrDate" lang="<%=Session("Lang")%>" mode="01" onchange="" />
			                                        ~
			                                        <gw:datebox id="dtUseToDate" lang="<%=Session("Lang")%>" nullaccept="T" mode="01"
			                                            onchange="" />
			                                    </td>
			                                </tr>
	                		                <tr style="height: 1%; background-color: #B4E7FF">
			                                    <td colspan="11">
			                                        <hr noshade size="1" style="color: Silver" />
			                                    </td>
			                                </tr>
	                  		             	 <tr style="height: 1%; background-color: #B4E7FF">
			                                    <td style="width: 5%; white-space: nowrap" align="left">
			                                        Asset Type
			                                    </td>
			                                    <td style="width: 45%; white-space: nowrap" align="left">
			                                        <gw:list id="lstAssetType" styles="width:100%;" onchange="" />
			                                    </td>
			                                    <td style="width: 5%; white-space: nowrap">
			                                        Doc Amount 
			                                    </td>
			                                    <td style="width: 20%; white-space: nowrap" align="left" colspan=2 >
			                                        <gw:textbox id="txtDocAmount" csstype="mandatory" styles='width:100%' type="number"
			                                            format="###,###,###.##" onenterkey="" />
			                                    </td>
			                                    
			                                </tr>
	                       			         <tr style="height: 1%; background-color: #B4E7FF">
			                                    <td style="width: 5%; white-space: nowrap">
			                                        Asset Amt
			                                    </td>
			                                    <td style="width: 45%; white-space: nowrap;">
			                                        <gw:textbox id="txtAssetAmount" csstype="mandatory" styles='width:100%' type="number"
			                                            format="###,###,###.##" />
			                                    </td>
			                                    <td style="width: 5%; white-space: nowrap" align="left">
			                                        CCY
			                                    </td>
			                                    <td style="width: 20%; white-space: nowrap" align="left">
			                                        <gw:list id="lstCCY" styles="width:100%;" />
			                                    </td>
			                                    <td style="width: 25%; white-space: nowrap;">
			                                        <gw:textbox id="txtExRate" csstype="mandatory" styles='width:100%' type="number"
			                                            format="###,###,###.##" />
			                                    </td>
			                                </tr>
	                               
										</table>
									
									</td>
								</tr> 
								<tr style="width: 100%; height: 99%">
                                    <td >
                                        <table style="width: 100%; height: 100%">
                                            <tr style="width: 100%; height: 1%">
                                                <td style="width: 97%;" align="center">
                                                    <gw:label id="lblTotalCount" styles="width:100%;color:cc0000;font:9pt" text="0 record(s)!" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:icon id="idBtnAdd02" img="2" text="Parts" styles='width:100%' onclick="OnAddNew('PART')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn id="btnNew2" img="new" alt="New free part" text="New" onclick="OnAddNew('FREE-PART')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn id="btnDelete1" img="delete" alt="Delete" text="Delete" onclick="OnDelete('DETAIL')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn id="btnUnDelete1" img="udelete" onclick="OnUndelete(grdAssetPart)" />
                                                </td>
                                            </tr>
											<tr style="width: 100%; height: 99%">
                                    			<td colspan="7">
                                        			<gw:grid id='grdAssetPart' 
														header='_PK|Seq|_ASSET_PK|Part Code|Part Name|UOM|Name 1|Name 2|Qty|Tr Amt|CCY|Ex Rate|Item Amount|Remark|Att01|_PARENT_PK'
                                            			format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
														aligns='0|1|0|0|0|1|0|0|3|3|1|3|3|0|0|0' 
														editcol='0|1|0|1|1|1|1|1|1|1|1|1|1|1|1|0'
                                            			widths='0|800|0|2000|3000|800|1200|1200|1200|1500|800|1200|1500|1000|1000|0' sorting='T' styles='width:100%; height:100%'
                                            			onafteredit='OnGridCellAfterEdit(this)' />
                                    			</td>
                                			</tr>
                                        </table>
                                    </td>
                                </tr>                                
                            </table>
                            <%--Noi dung tab Maintance Shedule--%>
                            <table id="p_Maintain_Shedule" style="width: 100%; height: 100%">
                                <tr style="width: 100%; height: 99%;">
                                    <td style="width: 100%" colspan="3">
                                        <gw:grid id='grdAssetProcess' header='_PK|_ASSET_PK|_MA_PROCESS_PK|Process ID|Process Name|Last Date|_Next Date|Use|M/Type|M/Value'
                                            format='0|0|0|0|0|4|4|3|0|0' aligns='3|3|3|0|0|1|1|1|0|3' check='|||||||||' editcol='1|1|1|1|1|1|0|1|1|1'
                                            defaults='|||||||||1' widths='0|0|0|1500|3500|1200|1200|1000|1500|1000' sorting='T'
                                            styles='width:100%; height:100%' onafteredit='OnGridCellAfterEdit(this)' acceptnulldate="T"
                                            oncelldblclick="OnGridCellDblClick(this)" />
                                    </td>
                                </tr>
                            </table>
                            <%--Noi dung tab Others Info--%>
                            <table id="p_Others_Info" style="width: 100%; height: 100%; background-color: #B4E7FF">
								
								<tr style="height: 1%">
									<td colspan="4" >
										<table style="width: 100%; height: 100%" >
											<tr>
												<td style="width: 5%; white-space: nowrap" >
													Acc Slip No
												</td>
												<td style="width: 25%; white-space: nowrap" align="left">
			                                        <gw:textbox id="txtAccSlipNo" styles='width:100%' />
			                                    </td>											 
												<td style="width: 25%; white-space: nowrap" align="left">
			                                        <gw:datebox id="dtAccSlipDate" lang="<%=Session("Lang")%>" mode="01" onchange="" />
			                                    </td>	
												<td style="width: 5%; white-space: nowrap" >
													P/O Type
												</td>	
												<td style="width: 40%; white-space: nowrap" align="left">
			                                        <gw:list id="lstPOType" styles="width:100%;" />
			                                    </td>										
											</tr>
											<tr>
												<td style="width: 5%; white-space: nowrap" >
													Declare No
												</td>
												<td style="width: 25%; white-space: nowrap" align="left">
			                                        <gw:textbox id="txtDocNo" styles='width:100%' />
			                                    </td>											 
												<td style="width: 25%; white-space: nowrap" align="left">
			                                        <gw:datebox id="dtDoc" lang="<%=Session("Lang")%>" mode="01" onchange="" />
			                                    </td>	
												<td style="width: 5%; white-space: nowrap" >
													 
												</td>	
												<td style="width: 40%; white-space: nowrap" align="center">
			                                         <gw:checkbox id="chkPMS" styles="color:blue" defaultvalue="Y|N"
                                            			value="Y">PMS Y/N</gw:checkbox>
														
													 <gw:checkbox id="chkDeprSD" styles="color:blue" defaultvalue="Y|N"
                                            			value="Y">Depr Y/N</gw:checkbox>
			                                    </td>												
											</tr>
											<tr>
												<td style="width: 5%; white-space: nowrap" >
													Invoice No
												</td>
												<td style="width: 25%; white-space: nowrap" align="left">
			                                        <gw:textbox id="txtInvoiceNo" styles='width:100%' />
			                                    </td>											 
												<td style="width: 25%; white-space: nowrap" align="left">
			                                        <gw:datebox id="dtInvoiceDoc" lang="<%=Session("Lang")%>" mode="01" onchange="" />
			                                    </td>	
												<td style="width: 5%; white-space: nowrap" >
													 
												</td>	
												<td style="width: 40%; white-space: nowrap" align="center">
			                                         
			                                    </td>												
											</tr>
										</table>
									</td>
								</tr>
								
								<tr style="height: 1%; background-color: #B4E7FF">
                                    <td colspan="4">
                                        <hr noshade size="1" style="color: Silver" />
                                    </td>
                                </tr>
								
								<tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="left">                                        
										<a title="Expense ACC 1" onclick="OnPopUp('EXP_01')" href="#tips" style="color: #0000ff">
                                            <b>Exp ACC 1</b></a>
                                    </td>
                                    <td style="width: 45%; white-space: nowrap" align="left">
                                        <gw:textbox id="txtExpACC01CODE" styles='width:100%;display:none' />
										<gw:textbox id="txtExpACC01NAME" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%">
                                        <a title="Expense ACC 2" onclick="OnPopUp('EXP_02')" href="#tips" style="color: #0000ff">
                                            <b>Exp ACC 2</b></a>
                                    </td>
                                    <td style="width: 45%; white-space: nowrap">
                                        <gw:textbox id="txtExpACC02CODE" styles='width:100%;display:none' />
										<gw:textbox id="txtExpACC02NAME" styles='width:100%' />
                                    </td>
                                </tr>
								<tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="left">                                        
										<a title="Expense ACC 3" onclick="OnPopUp('EXP_03')" href="#tips" style="color: #0000ff">
                                            <b>Exp ACC 3</b></a>
                                    </td>
                                    <td style="width: 45%; white-space: nowrap" align="left">
                                        <gw:textbox id="txtExpACC03CODE" styles='width:100%;display:none' />
										<gw:textbox id="txtExpACC03NAME" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%">
                                        <a title="Expense ACC 4" onclick="OnPopUp('EXP_04')" href="#tips" style="color: #0000ff">
                                            <b>Exp ACC 4</b></a>
                                    </td>
                                    <td style="width: 45%; white-space: nowrap">
                                        <gw:textbox id="txtExpACC04CODE" styles='width:100%;display:none' />
										<gw:textbox id="txtExpACC04NAME" styles='width:100%' />
                                    </td>
                                </tr>
								<tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="left">                                        
										<a title="Expense ACC 5" onclick="OnPopUp('EXP_05')" href="#tips" style="color: #0000ff">
                                            <b>Exp ACC 5</b></a>
                                    </td>
                                    <td style="width: 45%; white-space: nowrap" align="left">
                                        <gw:textbox id="txtExpACC05CODE" styles='width:100%;display:none' />
										<gw:textbox id="txtExpACC05NAME" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%">
                                        
                                    </td>
                                    <td style="width: 45%; white-space: nowrap">
                                         
                                    </td>
                                </tr>
								<tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="left">                                        
										<a title="Asset Account" onclick="OnPopUp('ASS_01')" href="#tips" style="color: #0000ff">
                                            <b>Asset Acc</b></a>
                                    </td>
                                    <td style="width: 45%; white-space: nowrap" align="left">
                                        <gw:textbox id="txtAssACC01CODE" styles='width:100%;display:none' />
										<gw:textbox id="txtAssACC01NAME" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%">
                                        <a title="Depr Account" onclick="OnPopUp('DEPR_01')" href="#tips" style="color: #0000ff">
                                            <b>Depr Acc</b></a>
                                    </td>
                                    <td style="width: 45%; white-space: nowrap">
                                        <gw:textbox id="txtDeprACC01CODE" styles='width:100%;display:none' />
										<gw:textbox id="txtDeprACC01NAME" styles='width:100%' />
                                    </td>
                                </tr>
								
								<tr style="height: 1%; background-color: #B4E7FF">
                                    <td colspan="4">
                                        <hr noshade size="1" style="color: Silver" />
                                    </td>
                                </tr>
											
								<tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="left">
                                        F.Name 01
                                    </td>
                                    <td style="width: 45%; white-space: nowrap" align="left">
                                        <gw:textbox id="txtFN01" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%">
                                        F.Name 02
                                    </td>
                                    <td style="width: 45%; white-space: nowrap">
                                        <gw:textbox id="txtFN02" styles='width:100%' />
                                    </td>
                                </tr>

                                <tr style="height: 1%">
                                    <td style="width: 5%">
                                        <a title="Supplier" onclick="OnPopUp('Supplier')" href="#tips" style="color: #0000ff">
                                            <b>Supplier</b></a>
                                    </td>
                                    <td style="width: 45%; white-space: nowrap" align="left">
                                        <gw:textbox id="txtSupplierPK" maxlen="100" styles='width:100%;display:none' />
                                        <gw:textbox id="txtSupplierCode" styles='width:30%' />
                                        <gw:textbox id="txtSupplierName" styles='width:70%' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="left">
                                        <a title="Warranty Partner" onclick="OnPopUp('Warranty_Partner')" href="#tips" style="color: #0000ff">
                                            <b>Warr.Partner</b></a>
                                    </td>
                                    <td style="width: 45%">
                                        <gw:textbox id="txtWarrantyPartnerPK" maxlen="100" styles='width:100%;display:none' />
                                        <gw:textbox id="txtWarrantyPartnerCode" styles='width:30%' />
                                        <gw:textbox id="txtWarrantyPartnerName" styles='width:70%' />
                                    </td>
                                </tr>
                                
                                <tr style="height: 1%">
                                    <td style="width: 5%; white-space: nowrap" align="left">
                                        Brand
                                    </td>
                                    <td style="width: 45%; white-space: nowrap" align="left">
                                        <gw:textbox id="txtBrand" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%">
                                        Warr.Date
                                    </td>
                                    <td style="width: 45%; white-space: nowrap">
                                        <gw:datebox id="dtWarrFrDate" lang="<%=Session("Lang")%>" mode="01" onchange="" />
                                        ~
                                        <gw:datebox id="dtWarrToDate" lang="<%=Session("Lang")%>" mode="01" onchange="" />
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td style="width: 5%">
                                        Model
                                    </td>
                                    <td style="width: 45%; white-space: nowrap;">
                                        <gw:textbox id="txtModel" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap" align="left">
                                        Check Date
                                    </td>
                                    <td style="width: 45%; white-space: nowrap" align="left">
                                        <gw:datebox id="dtCheckingDate" lang="<%=Session("Lang")%>" mode="01" nullaccept="T"
                                            onchange="" />
                                        
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td style="width: 5%">
                                        S/N
                                    </td>
                                    <td style="width: 45%; white-space: nowrap;">
                                        <gw:textbox id="txtSerialNumber" styles='width:100%' />
                                    </td>
                                    <td style="width: 5%; white-space: nowrap;"> 
										Category
                                    </td>
                                    <td style="width: 45%; white-space: nowrap" align="left"> 
										<gw:list id="lstAssetCategory" styles="width:100%;"   />
                                    </td>
                                </tr>
                                <tr style="height: 95%">
                                    <td style="width: 5%">
                                        Remark
                                    </td>
                                    <td style="width: 100%" colspan="3">
                                        <gw:textarea id="txtDescription" styles="width:100%;height:99%;border:1px solid;border-color:#6B9EB8;background-color:#FFFFFF" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------->
    <gw:textbox id="txtValueReturn" styles='width:100%;display:none' />
    <gw:textbox id="txtEmpPK" styles='width:100%;display:none' />
    <!--------------------------------------------------------->
</body>
</html>
