<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>ST ITEM ENTRY</title>
</head>

<script type="text/javascript" language="javascript">

var flag;

var G1_PK = 0; 

var G2_tco_grpspecgrp_pk    = 0,
    G2_tco_stitemspec_pk    = 1,
    G2_TCO_ITEMGRP_PK       = 2, 
    G2_GRP                  = 3,
    G2_TCO_STITEM_PK        = 4,
    G2_SEQ                  = 5,
    G2_TCO_SPECGRP_PK       = 6,
    G2_Spec_Group           = 7,
    G2_Mandatory            = 8,
    G2_TCO_SPEC_PK          = 9,
    G2_Spec_ID              = 10,
    G2_Spec_Name            = 11,
    G2_Spec_LName           = 12,
    G2_Spec_FName           = 13,
    G2_IDAUTO_YN            = 14,
    G2_SPEC_TYPE            = 15,
    G2_TYPE_YN              = 16,
    G2_STMAPPING_YN         = 17,
    G2_Display_CD           = 18,
    G2_Display_Nm           = 19,
    G2_Prefix_Code          = 20,
    G2_Prefix_Name          = 21,
    G2_SUB_CODE_YN          = 22;
    
//---------------------------------------------------------
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand"){
        left.style.display="none";
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../../system/images/next_orange.gif";
    }
    else{
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="70%";
        imgArrow.src = "../../../../system/images/prev_orange.gif";
    }
 }

//------------------------------------------------------------

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	
    txtUser_PK.text = "<%=session("USER_PK")%>";
  
    //----------------------------
    txtGroupCode.SetEnable(false);
    txtGroupName.SetEnable(false); 
       
    txtWHAccCode.SetEnable(false); 
    txtWHAccNM.SetEnable(false);     
    txtRevenueAccCode.SetEnable(false);
    txtRevenueAccNM.SetEnable(false);
    txtExpenseAccCode.SetEnable(false);
    txtExpenseAccNM.SetEnable(false);

    txtHSCodeID.SetEnable(false);
    txtHSCodeName.SetEnable(false); 
                    
    txtUOM.SetEnable(false);
    //----------------------------
    lst_agci00150_4.Call();
	
    BindingDataList();    
}
//------------------------------------------------------------
function BindingDataList()
{     
    
    var data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || ' * ' || wh_name  from TLG_IN_WAREHOUSE where del_if = 0 and use_yn='Y'")%>";   
    cboWH.SetDataText(data);         
    
    data = "<%=CtlLib.SetListDataSQL("select  UOM_CODE, UOM_CODE  from TLG_IT_UOM where del_if=0  order by 1")%>";   
    cboUOM_WT.SetDataText(data);
    cboUOM_LOT.SetDataText(data);
      
}
//--------------------------------------------------------------------------------------------------
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'UOM':
               var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
               var obj = System.OpenModal( path ,550 , 500,  'resizable:yes;status:yes');
               if ( obj != null )
               {
                    txtUOM.text = obj[1];
               }	
        break;   
        
        case 'Group':
 
               if ( txtMasterPK.text != '' )
               {
                    if (!confirm('Change Group for Item may cause problem. Do you want change Group for item : ' + txtSTItemCode.text + ' ?'))
                    {
                        return;
                    }
               } 
               
               var path = System.RootURL + '/form/ag/ci/agci00151.aspx?company_pk='+ cboCompanyList.value;
               var obj = System.OpenModal( path ,800 , 600,  'resizable:yes;status:yes');
               
               if ( obj != null )
               {
                    txtItemGroupPK.text = obj[0]; // GROUP PK
                    txtGroupCode.text   = obj[1]; // GROUP CODE
                    txtGroupName.text   = obj[2]; // GROUP NAME
                    
                    txtUOM.text      = obj[10]; //UOM
                    cboUOM_WT.value  = obj[11]; //Weight UOM
                    cboUOM_LOT.value = obj[12]; //Lot UOM
                    
                    cboWH.value           = obj[7]; // WH PK
                    txtGrpCD_Display.text = obj[9]; // GrpCD Display YN
										       
                    if ( obj[9] == 'Y' )
                    {
                        txtSTItemCode.text = txtGroupCode.text;
                    }                 
                    //-----------------
                    if ( Number(obj[6]) > 0 )
                    {
                        chkAutoYN.value = 'Y';                        
                    }
                    else
                    {
                        chkAutoYN.value = 'N';
                    }
                    //-----------------
                    OnAutoYNChange();
                    //-----------------
                    OnSearch('grdSpec');
               }
                              	
        break;                                      
        
        case 'WH_ACC':
            fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
            var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
            
            if ( aValue != null )
            {      
                txtWHAccPK.SetDataText(  aValue[0] );
                txtWHAccCode.SetDataText( aValue[1] );
                txtWHAccNM.SetDataText(   aValue[2] );
            }		
        break; 
        
        case 'Revenue_ACC':
            fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
            var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
            
            if ( aValue != null )
            {      
                txtRevenueAccPK.SetDataText(   aValue[0] );
                txtRevenueAccCode.SetDataText( aValue[1] );
                txtRevenueAccNM.SetDataText(   aValue[2] );
            }		
        break;    
        
        case 'Expense_ACC':
            fpath = System.RootURL + '/form/fp/ab/fpab00490.aspx';
            var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
            
            if ( aValue != null )
            {      
                txtExpenseAccPK.SetDataText(   aValue[0] );
                txtExpenseAccCode.SetDataText( aValue[1] );
                txtExpenseAccNM.SetDataText(   aValue[2] );
            }		
        break;     
        
        case 'HS_CODE':
            fpath = System.RootURL + '/form/fp/ab/fpab00390.aspx';
            var aValue  = System.OpenModal(  fpath , 550 , 500 , 'resizable:yes;status:yes');
            
            if ( aValue != null )
            {      
                txtHSCodePK.SetDataText(   aValue[1] );
                txtHSCodeID.SetDataText(   aValue[2] );
                txtHSCodeName.SetDataText( aValue[3] );
            }		
        break;                              
                        
    }	       
} 

//-------------------------------------------------------------------------------------
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSTitem':
            data_agci00150.Call("SELECT");
        break;
        
        case 'grdMaster':            
            if ( data_agci00150_1.GetStatus() == 20 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdSTitem.row > 0 )
                    {
                        txtMasterPK.text = grdSTitem.GetGridData( grdSTitem.row, G1_PK );
                    }
                    flag = 'view' ;
                    data_agci00150_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdSTitem.row > 0 )
                {
                    txtMasterPK.text = grdSTitem.GetGridData( grdSTitem.row, G1_PK );
                }
                flag = 'view' ;
                data_agci00150_1.Call("SELECT");
            }                                     
        break;
        
        case 'grdSpec':
            data_agci00150_2.Call("SELECT");
        break;
        
    }
}
//====================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_agci00150_1":
         
			imgUploadFile.SetDataText(txtSTItemPhotoPK.text );
            
            if ( flag == 'save')
            {
                for(var i=0; i < grdSpec.rows;i++)
                {
                    if ( grdSpec.GetGridData( i, G2_TCO_STITEM_PK) == '' )
                    {
                        grdSpec.SetGridText( i, G2_TCO_STITEM_PK, txtMasterPK.text);
                    }    
                }
                OnSave('Spec');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdSpec');   
            }
            
            OnAutoYNChange();
        break; 
              
        case "data_agci00150_2":
            if ( flag != 'view' ) 
            {
                //txtSTitemQuery.text = txtSTItemCode.text ;  
                //OnSearch('grdSTitem');
            }    
        break;   
        
        case "data_agci00150_3": 
            if ( grdSpec_Search.rows > 2 || grdSpec_Search.rows == 1 )
            {
                var queryString = "?pk=" + txtSpecGroupPK_Search.text
                                         + "&spec_id="
                                         + url_encode(txtSpecID_Search.text)
                                         + "&spec_name="
                                         + url_encode(txtSpecName_Search.text)
                                         + "&grp_pk="
                                         + txtItemGroupPK_Search.text;
                
                txtSpecGroupPK_Search.text  = '' ;                         
                txtSpecID_Search.text       = '' ;
                txtSpecName_Search.text     = '' ; 
                txtItemGroupPK_Search.text  = '' ;                                     
                                         
                GetSpec(queryString); 
                //-------------------                
            }
            else if ( grdSpec_Search.rows == 2 )
            {
                if ( gPreviousRow > 0 )
                {
		            grdSpec.SetGridText( gPreviousRow, G2_TCO_SPEC_PK, grdSpec_Search.GetGridData( 1, 0) );//spec_pk
		            grdSpec.SetGridText( gPreviousRow, G2_Spec_ID,     grdSpec_Search.GetGridData( 1, 1) );//spec_id
		            grdSpec.SetGridText( gPreviousRow, G2_Spec_Name,   grdSpec_Search.GetGridData( 1, 2) );//spec_name
		        }
		        grdSpec_Search.ClearData();
		        gPreviousRow = -1 ;
		        //------------
		        GenerateItem();
		        //------------
            }             
        break;
        
        case "pro_agci00150":
            OnSearch('grdMaster');
        break;   
        
        case "lst_agci00150_4":
		 
            cboCompanyList.SetDataText(txtReturnValue.text);    
            cboCompanyList.value = "<%=session("COMPANY_PK")%>";
			        
            lst_agci00150_5.Call();
        break;                   
    }
}

//====================================================================================

function GetSpec(p_querystring)
{

    var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00540.aspx" + p_querystring + "&add_new_spec=No";
    var aValue  = window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');	
	
	if ( aValue != null ) 
	{
	    if ( gPreviousRow > 0 ) 
	    {	
		    grdSpec.SetGridText( gPreviousRow, G2_TCO_SPEC_PK, aValue[1] );//spec_pk
		    grdSpec.SetGridText( gPreviousRow, G2_Spec_ID,     aValue[2] );//spec_id
		    grdSpec.SetGridText( gPreviousRow, G2_Spec_Name,   aValue[3] );//spec_name
		    grdSpec.SetGridText( gPreviousRow, G2_Spec_LName,   aValue[4] );//spec_lname
		    grdSpec.SetGridText( gPreviousRow, G2_Spec_FName,   aValue[5] );//spec_fname
		    
		    gPreviousRow = -1 ;
	        //------------
	        GenerateItem();
	        //------------		    
		}
	}
}

//====================================================================================

function OnAddNew()
{
    var l_item_group_pk = txtItemGroupPK.text;
    var l_group_code = txtGroupCode.text;
    var l_group_name = txtGroupName.text; 
	var l_chkAutoYN  = chkAutoYN.value;
	var l_grpcd_display = txtGrpCD_Display.text;
	
    var l_uom = txtUOM.text; 
    var l_uom_wt = cboUOM_WT.value; 
    var l_uom_lot = cboUOM_LOT.value; 
    var l_lot_qty = txtLot_qty.text; 
    var l_lot_weight = txtLot_weight.text; 
    var l_weight = txtWeight.text;
    var l_wh_pk = cboWH.value;   
	
    data_agci00150_1.StatusInsert();
	
    txtItemGroupPK.text = l_item_group_pk; // GROUP PK
    txtGroupCode.text   = l_group_code;
    txtGroupName.text   = l_group_name; // GROUP NAME    	
	                             
    txtUOM.text      = l_uom;  //UOM
    cboUOM_WT.value  = l_uom_wt; //Weight UOM
    cboUOM_LOT.value = l_uom_lot; //Lot UOM
    
    txtLot_qty.text    = l_lot_qty;  // Lot Qty
    txtLot_weight.text = l_lot_weight; // Lot Weight
    txtWeight.text     = l_weight; // Weight
    
    cboWH.value = l_wh_pk; // WH PK
		
    //-------------------------------------------
   
    chkAutoYN.value = l_chkAutoYN ;  
    chkActive.value = 'Y' ;
    
    imgUploadFile.SetDataText(txtSTItemPhotoPK.text);
    //------------------------------------------- 
    
	txtSTItemCode.text = '' ;	
	if ( l_grpcd_display == 'Y' )
	{
		txtSTItemCode.text = txtGroupCode.text ;
	}
	
	OnSearch('grdSpec');
	
    flag="view"; 
}  

//====================================================================================

function Validate()
{   
    if ( txtItemGroupPK.text == '' )
    {
        alert('Pls Select Group first !!!');
        return false;
    }
    else if ( txtUOM.text == '' )
    {
        alert('Pls Select UOM first !!!');
        return false;
    }
    //----------------
    return true;
}

//====================================================================================

function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            if ( Validate() )
            {
                txtSTItemPhotoPK.SetDataText(imgUploadFile.oid);
                
                flag='save';
                data_agci00150_1.Call();                
            }            
        break;
        
        case 'Spec':        
            data_agci00150_2.Call();
        break;       
    }
}

//====================================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'ProcessData':
            if ( txtMasterPK.text > 0 )
            {
                if ( confirm('Do you want to apply changes to all item?'))
                {
                    pro_agci00150.Call();                
                }    
            } 
            else
            {
                alert('Pls Select ST Item.');
            }           
        break;
    }
}

//====================================================================================
 function OnDelete(index)
 {        
    switch (index)
    {
        case 'Master':// delete master
            if(confirm('Do you want to delete this ST ITEM?'))
            {
                flag='delete';
                data_agci00150_1.StatusDelete();
                data_agci00150_1.Call();
            }   
        break;

        case 'Spec':
            if( confirm('Do you want to delete this Spec ?'))
            {   
                grdSpec.DeleteRow();   
            }            
        break;            

    }     
}
//====================================================================================
 
function OnUnDelete()
{              
     grdSpec.UnDeleteRow();
}

//====================================================================================
var gPreviousRow = -1 ;
//-------------------------------------------------------------------------------------------------
function OnGridAfterEdit(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdSpec" :
                if ( event.col == G2_Spec_ID || event.col == G2_Spec_Name )
                {
                    gPreviousRow = event.row ;
                    
                    txtSpecGroupPK_Search.text      = oGrid.GetGridData(gPreviousRow, G2_TCO_SPECGRP_PK );
                    txtItemGroupPK_Search.text      = oGrid.GetGridData(gPreviousRow, G2_TCO_ITEMGRP_PK );
                    txtSpecID_Search.text           = oGrid.GetGridData(gPreviousRow, G2_Spec_ID        );
                    txtSpecName_Search.text         = oGrid.GetGridData(gPreviousRow, G2_Spec_Name      );
                           
                    data_agci00150_3.Call('SELECT');
                }
            break;
      }      
}

//====================================================================================-

function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdSpec" :
                if ( event.row > 0 && ( event.col == G2_Spec_ID || event.col == G2_Spec_Name ) )
                {
                    gPreviousRow = event.row;
                    
                    var queryString = "?pk=" + grdSpec.GetGridData( gPreviousRow, G2_TCO_SPECGRP_PK)
                                             + "&spec_id="
                                             + url_encode(grdSpec.GetGridData( gPreviousRow, G2_Spec_ID))
                                             + "&spec_name="
                                             + url_encode(grdSpec.GetGridData( gPreviousRow, G2_Spec_Name))
                                             + "&grp_pk="
                                             + grdSpec.GetGridData( gPreviousRow, G2_TCO_ITEMGRP_PK);
                                                          
                    GetSpec(queryString);                             
                }
            break;
      }      
   
}

//====================================================================================

function OnAutoYNChange()
{
    if ( chkAutoYN.value == 'Y')        
    {           
        txtSTItemCode.SetEnable(false);
    }
    else
    {
        txtSTItemCode.SetEnable(true);
        //------------
        //GenerateItem(); 
    }                
}

//====================================================================================

function GenerateItem()
{
      var strCD = " ";
      var strNM = " ";
      var strFNM = " ";
      var strLNM = " ";
      
      if ( txtGrpCD_Display.text == 'Y' )
      {
            strCD = txtGroupCode.text ;
      }
      else
      {
            strCD = '' ;
      }
      //---------------------------------  
      strNM = '' ;      
      
      for(var i=1; i<grdSpec.rows; i++)
      {
            //=================================================================           
            if ( grdSpec.GetGridData( i, G2_Display_CD ) == -1 )
            {
                //----- For Code -----------------------------
                if ( grdSpec.GetGridData( i, G2_Prefix_Code ).toUpperCase() == 'BLANK' )
                {
                    strCD = strCD + ' ' + grdSpec.GetGridData( i, G2_Spec_ID ) ;
                }
                else if ( grdSpec.GetGridData( i, G2_Prefix_Code ) == '' )
                {
                    strCD = strCD + grdSpec.GetGridData( i, G2_Spec_ID ) ; 
                }
                else
                {
                    strCD = strCD + grdSpec.GetGridData( i, G2_Prefix_Code ) + grdSpec.GetGridData( i, G2_Spec_ID ) ;                 
                }            
            } 
            //=================================================================           
            if ( grdSpec.GetGridData( i, G2_Display_Nm ) == -1 )
            {                            
                //----- For Name -----------------------------
                if ( grdSpec.GetGridData( i, G2_Prefix_Name ).toUpperCase() == 'BLANK' )
                {
                    strNM = strNM + ' ' + grdSpec.GetGridData( i, G2_Spec_Name ) ;
                    strLNM = strLNM + ' ' + grdSpec.GetGridData( i, G2_Spec_LName ) ;
                    strFNM = strFNM + ' ' + grdSpec.GetGridData( i, G2_Spec_FName ) ;
                }
                else if ( grdSpec.GetGridData( i, G2_Prefix_Name ) == '' )
                {
                    strNM = strNM + grdSpec.GetGridData( i, G2_Spec_Name ) ; 
                    strLNM = strLNM + grdSpec.GetGridData( i, G2_Spec_LName ) ; 
                    strFNM = strFNM + grdSpec.GetGridData( i, G2_Spec_FName ) ; 
                }
                else 
                {
                    strNM = strNM + grdSpec.GetGridData( i, G2_Prefix_Name ) + grdSpec.GetGridData( i, G2_Spec_Name ) ; 
                    strLNM = strLNM + grdSpec.GetGridData( i, G2_Prefix_Name ) + grdSpec.GetGridData( i, G2_Spec_LName ) ; 
                    strFNM = strFNM + grdSpec.GetGridData( i, G2_Prefix_Name ) + grdSpec.GetGridData( i, G2_Spec_FName ) ; 
                }                
                //------------------------                
            }
            //=================================================================           
      }

    //------------------
    if ( chkAutoYN.value == 'N' )
    {    
        txtSTItemCode.text = strCD ; 
    }
    //------------------
    txtSTItemName.text = strNM ;         
    //------------------
    txtLName.text = strLNM ;   
    txtFName.text = strFNM ;   
}
//=========================================================================

function url_encode(s) 
{
	string = s.replace(/\r\n/g,"\n");
	var utftext = "";

	for (var n = 0; n < string.length; n++) 
	{

		var c = string.charCodeAt(n);

		if (c < 128) 
		{
			utftext += String.fromCharCode(c);
		}
		else if ((c > 127) && (c < 2048)) 
		{
			utftext += String.fromCharCode((c >> 6) | 192);
			utftext += String.fromCharCode((c & 63) | 128);
		}
		else 
		{
			utftext += String.fromCharCode((c >> 12) | 224);
			utftext += String.fromCharCode(((c >> 6) & 63) | 128);
			utftext += String.fromCharCode((c & 63) | 128);
		}
	}
	return escape(utftext);
}

//====================================================================================
    
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="lst_agci00150_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_agci00150_4" > 
                <input> 
                    <input bind="txtUser_PK" />
                </input>
	           <output>
	                <output bind="txtReturnValue" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
     <!------------------------------------------------------------------>
    <gw:data id="lst_agci00150_5" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="st_lg_sel_agci00150_5" > 
                <input> 
                    <input bind="cboCompanyList" />
                </input>
	           <output>
	                <output bind="cboGroupQuery" /> 
	           </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_agci00150" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_agci00150" > 
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
    <gw:data id="data_agci00150" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1" function="st_lg_sel_agci00150" > 
                <input>
                    <input bind="cboCompanyList" /> 
                    <input bind="cboGroupQuery" /> 
                    <input bind="txtSTitemQuery" /> 
                    <input bind="chkActiveQuery" />                     
                </input> 
                <output bind="grdSTitem" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_agci00150_1" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33" function="st_lg_sel_agci00150_1"  procedure="st_lg_upd_agci00150_1"> 
            <inout> 
                 <inout  bind="txtMasterPK" /> 
                 <inout  bind="txtItemGroupPK" />
                 <inout  bind="txtGroupCode" />
                 <inout  bind="txtGroupName" /> 
                  
                 <inout  bind="chkAutoYN" />
                 <inout  bind="txtSTItemCode" />
                 <inout  bind="txtSTItemName" />
                 
                 <inout  bind="txtWHAccPK" />
                 <inout  bind="txtWHAccCode" />
                 
                 <inout  bind="txtWHAccNM" />
                 
                 <inout  bind="txtUOM" />
                 <inout  bind="chkActive" />
                 <inout  bind="dtaFrom" />
                 <inout  bind="dtaTo" />
                 <inout  bind="cboWH" />
                 <inout  bind="txtDescription" />
                 <inout  bind="txtSTItemPhotoPK" />
                 <inout  bind="cboUOM_WT" />
                 <inout  bind="txtWeight" />
                 <inout  bind="cboUOM_LOT" />
                 <inout  bind="txtLot_qty" />
                 <inout  bind="txtLot_weight" />
                 <inout  bind="txtGrpCD_Display" />
                 
		        <inout  bind="txtExpenseAccPK" />
		        <inout  bind="txtExpenseAccCode" />
		        <inout  bind="txtExpenseAccNM" />
		        
		        <inout  bind="txtRevenueAccPK" />
		        <inout  bind="txtRevenueAccCode" />
		        <inout  bind="txtRevenueAccNM" />	
		        
		         <inout  bind="txtHSCodePK" />
		         <inout  bind="txtHSCodeID" />
		         <inout  bind="txtHSCodeName" /> 
		         <inout  bind="txtLName" />	
		         <inout  bind="txtFName" />	
		         	                         
            </inout>
        </dso> 
    </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_agci00150_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19"  function="st_lg_sel_agci00150_2"  procedure="st_lg_upd_agci00150_2"> 
              <input  bind="grdSpec">
                    <input bind="txtItemGroupPK" /> 
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdSpec" />   
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_agci00150_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="st_lg_sel_agci00150_3"  > 
                <input>
                    <input bind="txtSpecGroupPK_Search" /> 
                    <input bind="txtItemGroupPK_Search" />
                    <input bind="txtSpecID_Search" />
                    <input bind="txtSpecName_Search" />
                </input> 
                <output bind="grdSpec_Search" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr style="height: 100%">
            <td style="width: 30%" id="left">
                <table style="width: 100%; height: 100%">
                    <tr  style="height: 1%">
                         <td style="width: 20%" align="right">
                            Company
                        </td>
                        <td style="width: 80%" colspan="2">
                            <gw:list id="cboCompanyList" styles="width:100%" onchange="lst_agci00150_5.Call()" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Group
                        </td>
                        <td style="width: 80%" colspan="2">
                            <gw:list id="cboGroupQuery" styles="width:100%" onchange="OnSearch('grdSTitem')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Item
                        </td>
                        <td style="width: 80%" colspan="2">
                            <gw:textbox id="txtSTitemQuery" styles="width:100%" onenterkey="OnSearch('grdSTitem')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Active
                        </td>
                        <td style="width: 79%">
                            <gw:checkbox id="chkActiveQuery" styles="align:left" defaultvalue="Y|N" value="Y"
                                onchange="" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSTitem')" />
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="3">
                            <gw:grid id="grdSTitem" header="_PK|Code|Name" format="0|0|0" aligns="0|0|0" defaults="||"
                                editcol="0|0|0" widths="0|1500|1200" styles="width:100%; height:100%" sorting="T"
                                param="0,1,2" oncellclick="OnSearch('grdMaster')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 70%" align="center" id="right">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%">                               
                                <tr>
                                    <td style="width: 10%" align="right">
                                        <a title="Click here to select Group Code" href="#tips" style="text-decoration: none;
                                            color: #0000ff" onclick="OnPopUp('Group')"><b>Group</b></a>
                                    </td>
                                    <td style="width: 60%; white-space: nowrap"  colspan="2">
                                        <gw:textbox id="txtItemGroupPK" styles='width:100%;display:none' />
                                        <gw:textbox id="txtGroupCode" styles='width:25%' csstype="mandatory" />
                                        <gw:textbox id="txtGroupName" styles='width:75%' csstype="mandatory" />
                                    </td>
                                    <td style="width: 30%">
                                        <table style="width: 100%; height: 100%">
                                            <tr>												 
                                                <td style="width:96%">                                                
                                                    <gw:icon id="idBtnSaveChange" img="2" text="Apply for Items" styles='width:1%'
                                                        onclick="OnProcess('ProcessData')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew()" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete('Master')" />
                                                </td>
                                                <td style="width: 1%">
                                                    <gw:imgbtn id="btnUpdate" img="save" alt="Save" text="Save" onclick="OnSave('Master')" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>                                                                            
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        Item Code
                                    </td>
                                    <td style="width: 60%; white-space: nowrap" colspan="2">
                                        <gw:textbox id="txtSTItemCode" csstype="mandatory" styles="width:75%" />
                                        <gw:checkbox id="chkAutoYN" defaultvalue="Y|N" styles="width:10%" onchange="OnAutoYNChange()">Auto Seq</gw:checkbox>
                                    </td>
                                    <td style="width: 30%" rowspan="9">
                                        <gw:image id="imgUploadFile" table_name="TLG_IT_STITEMPHOTO" procedure="st_lg_SYS_INSERT_PICTURE_STITEM" view="/binary/ViewFile.aspx"
                                            post="/binary/PostFile.aspx" styles="width:99%;height:100%" style='border: 1px solid #1379AC' />
										 
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        Item Name
                                    </td>
                                    <td style="width: 60%" colspan="2">
                                        <gw:textbox id="txtSTItemName" csstype="mandatory" styles="width:100%" />
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        L Name
                                    </td>
                                    <td style="width: 60%" colspan="2">
                                        <gw:textbox id="txtLName" csstype="mandatory" styles="width:100%" />
                                    </td>
                                     
                                </tr>
                                <tr>
                                    <td style="width: 10%;white-space:nowrap" align="right">
                                        F Name
                                    </td>
                                    <td style="width: 60%" colspan="2">
                                        <gw:textbox id="txtFName" csstype="mandatory" styles="width:100%" />
                                    </td>
                                     
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        <a title="Click here to select UOM" href="#tips" style="text-decoration: none; color=#0000ff"
                                            onclick="OnPopUp('UOM')"><b>UOM</b></a>
                                    </td>
                                    <td style="width: 60%" colspan="2">
                                        <gw:textbox id="txtUOM" styles='width:30%' csstype="mandatory" />
                                        <gw:checkbox id="chkActive" defaultvalue="Y|N" />
                                        Active
                                        <gw:datebox id="dtaFrom" lang="<%=Application("Lang")%>" mode="01" />
                                        ~
                                        <gw:datebox id="dtaTo" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        Remark
                                    </td>
                                    <td style="width: 60%" colspan="2">
                                        <gw:textbox id="txtDescription" styles='width:100%' />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td>
                            <gw:tab>
                            <table style="height: 100%; width: 100%" name="ST Spec">
                                <tr>
                                    <td style="width: 98%">
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSubDelete" img="delete" alt="Delete" onclick="OnDelete('Spec')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnSubUndelete" img="udelete" alt="Undelete" onclick="OnUndelete()" />
                                    </td>
                                </tr>
                                <tr style="height: 100%">
                                    <td colspan="3">
                                        <gw:grid id='grdSpec' header='_TCO_GRPSPECGRP_PK|_TCO_STITEMSPEC_PK|_TCO_ITEMGRP_PK|_GRP_CD|_TCO_STITEM_PK|SEQ|_TCO_SPECGRP_PK|Spec Grp|_MANDATORY|_TCO_SPEC_PK|Spec ID|Spec Name|_Spec_LName|_Spec_FName|_IDAUTO_YN|_SPEC_TYPE|_TYPE_YN|_STMAPPING_YN|Display CD|Display Nm|Prefix Code|Prefix Name|_SUB_CODE_YN'
                                            format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|3|0|0|0' 
                                            aligns='0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                            editcol='0|0|0|0|0|0|0|0|0|0|1|1|0|0|0|0|0|0|0|0|0|0|0'
                                            widths='1000|1000|1000|2000|1000|800|1000|3000|1000|1000|1500|3000|0|0|1000|1000|1000|1000|1200|1200|1500|1500|1000'
                                            sorting='T' onafteredit="OnGridAfterEdit(this)" oncelldblclick="OnGridCellDoubleClick(this)"
                                            styles='width:100%; height:100%' />
                                    </td>
                                </tr>
                            </table>
                            <table style="height: 100%; width: 100%" name="Physical Attribute">
                                <tr style="height: 50%">
                                    <td valign="top">
                                        <fieldset style="padding: 10; width: 40%">
                                            <legend><font color="black" size="2"><b>Weight</b></font></legend>
                                            <table style="height: 100%; width: 100%">
                                                <tr>
                                                    <td style="width: 50%">
                                                        Unit of Measure</td>
                                                    <td style="width: 50%">
                                                        <gw:list id="cboUOM_WT" styles="width:100%;"></gw:list>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 50%">
                                                        Unit Weight</td>
                                                    <td style="width: 50%">
                                                        <gw:textbox id="txtWeight" styles="width:100%;" type="number" format="#,###,###,###,###.#####R" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                                <tr style="height: 50%">
                                    <td valign="top">
                                          <fieldset style="padding: 2; width: 40%">
                                            <legend><font color="black" size="2"><b>Lot </b></font></legend>
                                            <table width="100%" cellpadding="1" cellspacing="2" border="0">
                                              <tr>
                                                <td width="50%">&nbsp;&nbsp;Unit of Measure</td>
                                                <td width="50%" colspan="1" align=left><gw:list id="cboUOM_LOT" styles="width:100%" /></td>
                                              </tr>
                                               <tr>
                                                <td width="50%">&nbsp;&nbsp;Quantity</td>
                                                <td width="50%" colspan="1" align=left><gw:textbox id="txtLot_qty" type="number" format="#,###,###,###,###.#####R" styles="width:100%" /></td>
                                              </tr>
                                               <tr>
                                                <td width="50%">&nbsp;&nbsp; Weight</td>
                                                <td width="50%" colspan="1" align=left><gw:textbox id="txtLot_weight" type="number" format="#,###,###,###,###.#####R" styles="width:100%" /></td>
                                              </tr>
                                            </table>
                                            </fieldset>
                                    </td>
                                </tr>
                            </table>  
                            <table style="height: 100%; width: 100%" name="Account">
                                <tr style="height:1%">
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        <a title="Click here to select account code" onclick="OnPopUp('Expense_ACC')" href="#tips"
                                            style="text-decoration: none; color=#0000ff"><b>Expense ACC</b>
                                    </td>
                                    <td style="width: 60%; white-space: nowrap" colspan="2">
                                        <gw:textbox id="txtExpenseAccCode" styles="width=30%" />
                                        <gw:textbox id="txtExpenseAccNM" styles="width=70%" />
                                        <gw:textbox id="txtExpenseAccPK" styles="display:none" />
                                    </td>
                                </tr>
                                <tr style="height:1%">
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        <a title="Click here to select account code" onclick="OnPopUp('Revenue_ACC')" href="#tips"
                                            style="text-decoration: none; color=#0000ff"><b>Revenue ACC</b>
                                    </td>
                                    <td style="width: 60%; white-space: nowrap" colspan="2">
                                        <gw:textbox id="txtRevenueAccCode" styles="width=30%" />
                                        <gw:textbox id="txtRevenueAccNM" styles="width=70%" />
                                        <gw:textbox id="txtRevenueAccPK" styles="display:none" />
                                    </td>
                                </tr>
                                <tr style="height:1%">
                                    <td style="width: 10%" align="right">
                                        <a title="Click here to select account code" onclick="OnPopUp('WH_ACC')" href="#tips"
                                            style="text-decoration: none; color=#0000ff"><b>W/H ACC</b>
                                    </td>
                                    <td style="width: 60%; white-space: nowrap" colspan="2">
                                        <gw:textbox id="txtWHAccCode" styles="width=30%" />
                                        <gw:textbox id="txtWHAccNM" styles="width=70%" />
                                        <gw:textbox id="txtWHAccPK" styles="display:none" />
                                    </td>
                                </tr>
                                <tr style="height:1%">
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        <a onclick="OnPopUp('HS_CODE')" href="#tips" style="color=#0000ff">H/S Code
                                    </td>
                                    <td style="width: 60%; white-space: nowrap" colspan="2">
                                        <gw:textbox id="txtHSCodeID" styles="width=30%" />
                                        <gw:textbox id="txtHSCodeName" styles="width=70%" />
                                        <gw:textbox id="txtHSCodePK" styles="display:none" />
                                    </td>
                                </tr>
                                <tr style="height:1%">
                                    <td style="width: 10%" align="right">
                                        W/H
                                    </td>
                                    <td colspan="2">
                                        <gw:list id="cboWH" styles="width:100%" />
                                    </td>
                                </tr>
                                <tr style="height:99%">
                                </tr>
                            </table>                    
                            </gw:tab>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------>
<gw:grid id="grdSpec_Search" header="pk|spec_id|spec_nm" format="0|0|0" aligns="0|0|0"
    defaults="||" editcol="1|1|1" widths="0|0|0" styles="width:100%; height:200; display:none"
    sorting="F" param="0,1,2" />
<!--------------------------------------------------------------------------->
<gw:textbox id="txtMasterPK" text="" style="display: none" />
<gw:textbox id="txtReturnValue" text="" style="display: none" />
<!--------------------------------------------------------------------------->
<gw:textbox id="txtGrpCD_Display" text="" style="display: none" />
<!--------------------------------------------------------------------------->
<gw:textbox id="txtSpecGroupPK_Search" text="" style="display: none" />
<gw:textbox id="txtItemGroupPK_Search" text="" style="display: none" />
<gw:textbox id="txtSpecID_Search" text="" style="display: none" />
<gw:textbox id="txtSpecName_Search" text="" style="display: none" />
<!--------------------------------------------------------->
<gw:textbox id="txtSTItemPhotoPK" text="" style="display: none" />
<!--------------------------------------------------------->
<img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;
    position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
<!--------------------------------------------------------->
<gw:textbox id="txtUser_PK" text="" style="display: none" />
</html>
