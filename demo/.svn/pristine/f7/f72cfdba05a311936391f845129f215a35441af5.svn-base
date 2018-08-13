<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>ITEM ENTRY</title>
</head>

<script type="text/javascript" language="javascript">

var flag;

var G1_PK ; 

var G2_tco_grpspecgrp_pk    = 0,
    G2_tco_itemspec_pk      = 1,
    G2_TCO_ITEMGRP_PK       = 2, 
    G2_GRP                  = 3,
    G2_TCO_ITEM_PK          = 4,
    G2_SEQ                  = 5,
    G2_TCO_SPECGRP_PK       = 6,
    G2_Spec_Group           = 7,
    G2_Mandatory            = 8,
    G2_TCO_SPEC_PK          = 9,
    G2_Spec_ID              = 10,
    G2_Spec_Name            = 11,
    G2_IDAUTO_YN            = 12,
    G2_SPEC_TYPE            = 13,
    G2_TYPE_YN              = 14,
    G2_STMAPPING_YN         = 15, 
    G2_Display_CD           = 16,
    G2_Display_Nm           = 17,
    G2_Prefix_Code          = 18,
    G2_Prefix_Name          = 19,
    G2_SUB_CODE_YN          = 20;
    
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
    
    //----------------------------
    txtGroupCode.SetEnable(false);
    txtGroupName.SetEnable(false);
    
    txtSTItemCode.SetEnable(false);
    txtSTItemName.SetEnable(false);
    
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
    
    BindingDataList();    
}
//------------------------------------------------------------
function BindingDataList()
{     
    var data = "<%=CtlLib.SetListDataSQL("select pk,grp_cd || ' - ' || grp_nm from comm.tco_itemgrp v where del_if = 0 and LEAF_YN ='Y' ORDER BY grp_cd")%>|ALL|Select ALL";   
    cboGroupQuery.SetDataText(data);
    cboGroupQuery.value = 'ALL' ; 
    
    data = "<%=CtlLib.SetListDataSQL("select pk, wh_id || '-' || wh_name  from inv.TIN_WAREHOUSE where del_if = 0 and use_yn='Y'")%>";   
    cboWH.SetDataText(data);
    
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT A.CODE, A.CODE_NM FROM COMM.TCO_ABCODE A, comm.TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'COAB0180' AND A.USE_IF = 1" )  %> " ; 
    grdSpec.SetComboFormat(G2_SPEC_TYPE,data);    
    
    data = "<%=CtlLib.SetListDataSQL("select  UOM_CODE, UOM_CODE || '-' || UOM_NM from TCO_UOM where del_if=0  order by UOM_CODE")%>";   
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
               
               var path = System.RootURL + '/form/ag/ci/agci00111.aspx';
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
                    //-----------------
                    OnSearch('grdSpec');
               }
                              	
        break;                                   

        case 'STItem':
 
               if ( txtMasterPK.text != '' )
               {
                    if (!confirm('Change ST Item for Item may cause problem. Do you want change Group for item : ' + txtSTItemCode.text + ' ?'))
                    {
                        return;
                    }
               } 
               
               var path = System.RootURL + '/form/fp/ab/fpab00080.aspx?group_type=Y|Y|Y|Y|Y|Y&group_pk='+ txtItemGroupPK.text ;
               var obj = System.OpenModal( path ,800 , 600,  'resizable:yes;status:yes');
               
               if ( obj != null )
               {
                    txtItemGroupPK.text = obj[3]; // GROUP PK
                    txtGroupName.text   = obj[4]; // GROUP NAME
                    
                    txtSTItemPK.text    = obj[0]; // ST Item PK
                    txtSTItemCode.text  = obj[1]; // ST Item Code
                    txtSTItemName.text  = obj[2]; // ST Item Name   
                    
                    
                    txtUOM.text      = obj[5];  //UOM
                    cboUOM_WT.value  = obj[20]; //Weight UOM
                    cboUOM_LOT.value = obj[19]; //Lot UOM
                    
                    txtLot_qty.text    = obj[6];  // Lot Qty
                    txtLot_weight.text = obj[21]; // Lot Weight
                    txtWeight.text     = obj[22]; // Weight
                    
                    cboWH.value = obj[14]; // WH PK
                                    
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
        case 'grdItem':
            data_agci00100.Call("SELECT");
        break;
        
        case 'grdMaster':            
            if ( data_agci00100_1.GetStatus() == 20 )
            {
                if ( confirm('Do you want to save first !!!'))
                {
                    OnSave('Master');
                }
                else
                {
                    if ( grdItem.row > 0 )
                    {
                        txtMasterPK.text = grdItem.GetGridData( grdItem.row, G1_PK );
                    }
                    flag = 'view' ;
                    data_agci00100_1.Call("SELECT");
                }                
            } 
            else
            {
                if ( grdItem.row > 0 )
                {
                    txtMasterPK.text = grdItem.GetGridData( grdItem.row, G1_PK );
                }
                flag = 'view' ;
                data_agci00100_1.Call("SELECT");
            }                                     
        break;
        
        case 'grdSpec':
            data_agci00100_2.Call("SELECT");
        break;
        
    }
}
//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_agci00100_1":
         
            imgItem.SetDataText(txtItemPhotoPK.text );
            
            if ( flag == 'save')
            {
                for(var i=0; i < grdSpec.rows;i++)
                {
                    if ( grdSpec.GetGridData( i, G2_TCO_ITEM_PK) == '' )
                    {
                        grdSpec.SetGridText( i, G2_TCO_ITEM_PK, txtMasterPK.text);
                    }    
                }
                OnSave('Spec');                
            }
            else
            {
                //---------------------------- 
                OnSearch('grdSpec');   
            }
            
        break; 
              
        case "data_agci00100_2":
            //----------
            for ( var i = 1; i < grdSpec.rows; i++)
            {
                if ( grdSpec.GetGridData( i, G2_tco_itemspec_pk) == '' )
                {
                    grdSpec.SetCellBgColor( i, 0, i, grdSpec.cols - 1, 0xCCFFFF );
                }
            }
            //----------
            if ( flag != 'view' ) 
            {
                //txtItemQuery.text = txtItemCode.text ;  
                //OnSearch('grdItem');
            }    
        break;   
        
        case "data_agci00100_3": 
            if ( grdSpec_Search.rows > 2 || grdSpec_Search.rows == 1 )
            {
                var queryString = "?pk=" + txtSpecGroupPK_Search.text
                                         + "&spec_id="
                                         + txtSpecID_Search.text
                                         + "&spec_name="
                                         + txtSpecName_Search.text
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
    }
}

//----------------------------------------------------------

function GetSpec(p_querystring)
{

    var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00540.aspx" + p_querystring + "&add_new_spec=No";
    var aValue  = window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');	
	
	if ( aValue != null ) 
	{
	    if ( gPreviousRow > 0 ) 
	    {	
		    grdSpec.SetGridText( gPreviousRow, G2_TCO_SPEC_PK, aValue[1] );//spec_pk
		    grdSpec.SetGridText( gPreviousRow, G2_Spec_ID,     aValue[5] );//spec_id
		    grdSpec.SetGridText( gPreviousRow, G2_Spec_Name,   aValue[6] );//spec_name
		    
		    gPreviousRow = -1 ;
	        //------------
	        GenerateItem();
	        //------------		    
		}
	}
}

//-----------------------------------------------------------------------

function OnAddNew()
{
    data_agci00100_1.StatusInsert();
    //-------------------------------------------     
    chkActive.value = 'Y' ;
    
    imgItem.SetDataText(txtItemPhotoPK.text);
    //------------------------------------------- 
    grdSpec.ClearData();
    
    flag="view"; 
}  

//-------------------------------------------------------------------------------------

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

//-------------------------------------------------------------------------------------

function OnSave(pos)
{    
    switch(pos)
    { 
        case 'Master':
            if ( Validate() )
            {
                txtItemPhotoPK.SetDataText(imgItem.oid);
                
                flag='save';
                data_agci00100_1.Call();                
            }            
        break;
        
        case 'Spec':        
            data_agci00100_2.Call();
        break;
    }
}

//------------------------------------------------------------------------------------------------

 function OnDelete(index)
 {        
    switch (index)
    {
        case 'Master':// delete master
            if(confirm('Do you want to delete this ITEM?'))
            {
                flag='delete';
                data_agci00100_1.StatusDelete();
                data_agci00100_1.Call();
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
//------------------------------------------------------------------------------------- 
 
function OnUnDelete()
{              
     grdSpec.UnDeleteRow();
}

//---------------------------------------------------------
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
                           
                    data_agci00100_3.Call('SELECT');
                }
            break;
      }      
}
//-------------------------------------------------------------------------------------------------

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
                                             + grdSpec.GetGridData( gPreviousRow, G2_Spec_ID)
                                             + "&spec_name="
                                             + grdSpec.GetGridData( gPreviousRow, G2_Spec_Name)
                                             + "&grp_pk="
                                             + grdSpec.GetGridData( gPreviousRow, G2_TCO_ITEMGRP_PK);
                                                          
                    GetSpec(queryString);                             
                }
            break;
      }      
   
}

//----------------------------------------------------------
function GenerateItem()
{
      var strCD = " ";
      var strNM = " ";
      
      //---------------------------------
      strCD = txtSTItemCode.text ;  
      strNM = txtSTItemName.text ;      
      
      for(var i=1; i<grdSpec.rows; i++)
      {
            //=================================================================           
            if ( grdSpec.GetGridData( i, G2_Display_CD ) == -1 && grdSpec.GetGridData( i, G2_SPEC_TYPE ) != 'ST' )
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
            if ( grdSpec.GetGridData( i, G2_Display_Nm ) == -1 && grdSpec.GetGridData( i, G2_SPEC_TYPE ) != 'ST' )
            {                            
                //----- For Name -----------------------------
                if ( grdSpec.GetGridData( i, G2_Prefix_Name ).toUpperCase() == 'BLANK' )
                {
                    strNM = strNM + ' ' + grdSpec.GetGridData( i, G2_Spec_Name ) ;
                }
                else if ( grdSpec.GetGridData( i, G2_Prefix_Name ) == '' )
                {
                    strNM = strNM + grdSpec.GetGridData( i, G2_Spec_Name ) ; 
                }
                else 
                {
                    strNM = strNM + grdSpec.GetGridData( i, G2_Prefix_Name ) + grdSpec.GetGridData( i, G2_Spec_Name ) ; 
                }                
                //------------------------                
            }
            //=================================================================           
      }

    //------------------
    txtItemCode.text = strCD ; 
    //------------------
    txtItemName.text = strNM ;         
    //------------------
}
//----------------------------------------------------------
    
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_agci00100" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1" function="comm.sp_sel_agci00100" > 
                <input>
                    <input bind="cboGroupQuery" /> 
                    <input bind="txtItemQuery" /> 
                    <input bind="chkActiveQuery" />                     
                </input> 
                <output bind="grdItem" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_agci00100_1" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32" function="COMM.sp_sel_agci00100_1"  procedure="comm.sp_upd_agci00100_1"> 
            <inout> 
                 <inout  bind="txtMasterPK" /> 
                 <inout  bind="txtItemGroupPK" />
                 <inout  bind="txtGroupCode" />
                 <inout  bind="txtGroupName" /> 
                 <inout  bind="txtSTItemPK" />
                 <inout  bind="txtSTItemCode" />
                 <inout  bind="txtSTItemName" />
                 <inout  bind="txtItemCode" />
                 <inout  bind="txtItemName" />
                 <inout  bind="txtWHAccPK" />
                 <inout  bind="txtWHAccCode" />
                 
                 <inout  bind="txtWHAccNM" />
                 
                 <inout  bind="txtUOM" />
                 <inout  bind="chkActive" />
                 <inout  bind="dtaFrom" />
                 <inout  bind="dtaTo" />
                 <inout  bind="cboWH" />
                 <inout  bind="txtDescription" />
                 <inout  bind="txtItemPhotoPK" />
                 <inout  bind="cboUOM_WT" />
                 <inout  bind="txtWeight" />
                 <inout  bind="cboUOM_LOT" />
                 <inout  bind="txtLot_qty" />
                 <inout  bind="txtLot_weight" />
                 
		         <input  bind="txtExpenseAccPK" />
		         <input  bind="txtExpenseAccCode" />
		         <input  bind="txtExpenseAccNM" />
		        
		         <input  bind="txtRevenueAccPK" />
		         <input  bind="txtRevenueAccCode" />
		         <input  bind="txtRevenueAccNM" /> 
		         
		         <input  bind="txtHSCodePK" />
		         <input  bind="txtHSCodeID" />
		         <input  bind="txtHSCodeName" /> 		                         
            </inout>
        </dso> 
    </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_agci00100_2" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19"  function="comm.sp_sel_agci00100_2"  procedure="comm.sp_upd_agci00100_2"> 
                <input  bind="grdSpec">
                    <input bind="txtItemGroupPK" /> 
                    <input bind="txtSTItemPK" />
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdSpec" />   
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_agci00100_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="comm.sp_sel_agci00100_3"  > 
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
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Group</td>
                        <td style="width: 80%" colspan="2">
                            <gw:list id="cboGroupQuery" styles="width:100%" onchange="OnSearch('grdItem')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Item</td>
                        <td style="width: 80%" colspan="2">
                            <gw:textbox id="txtItemQuery" styles="width:100%" onenterkey="OnSearch('grdItem')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Active</td>
                        <td style="width: 79%">
                            <gw:checkbox id="chkActiveQuery" styles="align:left" defaultvalue="Y|N" value="Y"
                                onchange="" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdItem')" />
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="3">
                            <gw:grid id="grdItem" header="_PK|Code|Name" format="0|0|0" aligns="0|0|0" defaults="||"
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
                                            color=#0000ff" onclick="OnPopUp('Group')"><b>Group</b></a>
                                    </td>
                                    <td style="width: 60%; white-space: nowrap">
                                        <gw:textbox id="txtItemGroupPK" styles='width:100%;display:none' />
                                        <gw:textbox id="txtGroupCode" styles='width:25%' csstype="mandatory" />
                                        <gw:textbox id="txtGroupName" styles='width:75%' csstype="mandatory" />
                                    </td>
                                    <td style="width: 30%">
                                        <table style="width: 100%; height: 100%">
                                            <tr>
                                                <td style="width: 96%">
                                                </td>
                                                <td style="width: 1%">
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
                                        <a title="Click here to select ST Item" href="#tips" style="text-decoration: none;
                                            color=#0000ff" onclick="OnPopUp('STItem')"><b>ST Item</b></a>
                                    </td>
                                    <td style="width: 60%; white-space: nowrap">
                                        <gw:textbox id="txtSTItemPK" styles='width:100%;display:none' />
                                        <gw:textbox id="txtSTItemCode" styles='width:25%' csstype="mandatory" />
                                        <gw:textbox id="txtSTItemName" styles='width:75%' csstype="mandatory" />
                                    </td>
                                    <td style="width: 30%" rowspan="10">
                                        <gw:image id="imgItem" table_name="TCO_ITEMPHOTO" oid="0" view="/binary/ViewFile.aspx"
                                            post="/binary/PostFile.aspx" styles="width:99%;height:100%" style='border: 1px solid #1379AC' />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        Item Code
                                    </td>
                                    <td style="width: 60%; white-space: nowrap">
                                        <gw:textbox id="txtItemCode" csstype="mandatory" styles="width:100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        Item Name
                                    </td>
                                    <td style="width: 60%">
                                        <gw:textbox id="txtItemName" csstype="mandatory" styles="width:100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        <a title="Click here to select UOM" href="#tips" style="text-decoration: none; color=#0000ff"
                                            onclick="OnPopUp('UOM')"><b>UOM</b></a>
                                    </td>
                                    <td style="width: 60%">
                                        <gw:textbox id="txtUOM" styles='width:30%' csstype="mandatory" />
                                        <gw:checkbox id="chkActive" defaultvalue="Y|N" />
                                        Active
                                        <gw:datebox id="dtaFrom" lang="<%=Application("Lang")%>" mode="01" />
                                        ~
                                        <gw:datebox id="dtaTo" lang="<%=Application("Lang")%>" mode="01" nullaccept />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        <a title="Click here to select account code" onclick="OnPopUp('Expense_ACC')" href="#tips"
                                            style="text-decoration: none; color=#0000ff"><b>Expense ACC</b>
                                    </td>
                                    <td style="width: 60%; white-space: nowrap">
                                        <gw:textbox id="txtExpenseAccCode" styles="width=30%" />
                                        <gw:textbox id="txtExpenseAccNM" styles="width=70%" />
                                        <gw:textbox id="txtExpenseAccPK" styles="display:none" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        <a title="Click here to select account code" onclick="OnPopUp('Revenue_ACC')" href="#tips"
                                            style="text-decoration: none; color=#0000ff"><b>Revenue ACC</b>
                                    </td>
                                    <td style="width: 60%; white-space: nowrap">
                                        <gw:textbox id="txtRevenueAccCode" styles="width=30%" />
                                        <gw:textbox id="txtRevenueAccNM" styles="width=70%" />
                                        <gw:textbox id="txtRevenueAccPK" styles="display:none" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        <a title="Click here to select account code" onclick="OnPopUp('WH_ACC')" href="#tips"
                                            style="text-decoration: none; color=#0000ff"><b>W/H ACC</b>
                                    </td>
                                    <td style="width: 60%; white-space: nowrap">
                                        <gw:textbox id="txtWHAccCode" styles="width=30%" />
                                        <gw:textbox id="txtWHAccNM" styles="width=70%" />
                                        <gw:textbox id="txtWHAccPK" styles="display:none" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        <a onclick="OnPopUp('HS_CODE')" href="#tips" style="color=#0000ff">H/S Code
                                    </td>
                                    <td style="width: 60%; white-space: nowrap" >
                                        <gw:textbox id="txtHSCodeID" styles="width=30%" />
                                        <gw:textbox id="txtHSCodeName" styles="width=70%" />
                                        <gw:textbox id="txtHSCodePK" styles="display:none" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        W/H
                                    </td>
                                    <td style="width: 60%; white-space: nowrap">
                                        <gw:list id="cboWH" styles="width:100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 10%" align="right">
                                        Description
                                    </td>
                                    <td style="width: 60%">
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
                                        <gw:grid id='grdSpec' header='_TCO_GRPSPECGRP_PK|_TCO_ITEMSPEC_PK|_TCO_ITEMGRP_PK|_GRP_CD|_TCO_STITEM_PK|SEQ|_TCO_SPECGRP_PK|Spec Grp|_MANDATORY|_TCO_SPEC_PK|Spec ID|Spec Name|_IDAUTO_YN|Spec Type|_TYPE_YN|_STMAPPING_YN|Display CD|Display Nm|Prefix Code|Prefix Name|_SUB_CODE_YN'
                                            format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|3|0|0|0' 
                                            aligns='0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                            editcol='0|0|0|0|0|0|0|0|0|0|1|1|0|0|0|0|0|0|0|0|0'
                                            widths='1000|1000|1000|2000|1000|800|1000|3000|1000|1000|1500|3000|1000|1200|1000|1000|1200|1200|1500|1500|1000'
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
                                                        <gw:textbox id="txtWeight" styles="width:100%;" />
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
                                                <td width="50%" colspan="1" align=left><gw:textbox id="txtLot_qty" type="number" format="#,###,###,###,###.##R" styles="width:100%" /></td>
                                              </tr>
                                               <tr>
                                                <td width="50%">&nbsp;&nbsp; Weight</td>
                                                <td width="50%" colspan="1" align=left><gw:textbox id="txtLot_weight" type="number" format="#,###,###,###,###.##R" styles="width:100%" /></td>
                                              </tr>
                                            </table>
                                            </fieldset>
                                    </td>
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
<!--------------------------------------------------------------------------->
<gw:textbox id="txtGrpCD_Display" text="" style="display: none" />
<!--------------------------------------------------------------------------->
<gw:textbox id="txtSpecGroupPK_Search" text="" style="display: none" />
<gw:textbox id="txtItemGroupPK_Search" text="" style="display: none" />
<gw:textbox id="txtSpecID_Search" text="" style="display: none" />
<gw:textbox id="txtSpecName_Search" text="" style="display: none" />
<!--------------------------------------------------------->
<gw:textbox id="txtItemPhotoPK" text="" style="display: none" />
<!--------------------------------------------------------->
<img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;
    position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
<!--------------------------------------------------------->
</html>
