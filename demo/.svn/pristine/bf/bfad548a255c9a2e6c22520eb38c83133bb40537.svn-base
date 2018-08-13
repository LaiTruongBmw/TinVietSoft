<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>ST ITEM ENTRY UNIQUE SPEC</title>
</head>

<script>
  
 var G1_Group_PK = 0,
     G1_Group_CD = 1,
     G1_Group_NM = 2,
     G1_ITEM_UOM = 3;
        
 var G2_tco_grpspecgrp_pk = 0,
     G2_tco_stitemspec_pk = 1,
     G2_TCO_ITEMGRP_PK    = 2, 
     G2_GRP               = 3,
     G2_TCO_STITEM_PK     = 4,
     G2_SEQ               = 5,
     G2_TCO_SPECGRP_PK    = 6,
     G2_Spec_Group        = 7,
     G2_Mandatory         = 8,
     G2_TCO_SPEC_PK       = 9,
     G2_Spec_ID           = 10,
     G2_Spec_Name         = 11,
     G2_IDAUTO_YN         = 12,
     G2_SPEC_TYPE         = 13,
     G2_TYPE_YN           = 14,
     G2_STMAPPING_YN      = 15, 
     G2_Display_CD        = 16,
     G2_Display_Nm        = 17,
     G2_Prefix_Code       = 18,
     G2_Prefix_Name       = 19,
     G2_SUB_CODE_YN       = 20;       
     
 var G3_STITEM_PK   = 0,
     G3_Item_Grp_PK = 1,
     G3_Grp_CD      = 2,
     G3_Grp_NM      = 3,
     G3_Item_Code   = 4,
     G3_Item_Name   = 5,
     G3_Unit        = 6,
     G3_Description = 7;
  
//===============================================================
 function OnToggle()
 {
    var t_left  = document.all("t_left");
        
    var imgArrow = document.all("imgArrow");   
    
    if ( imgArrow.status == "expand" )
    {
        t_left.style.display="none";       
        imgArrow.status = "collapse";
        imgArrow.src = "../../../../system/images/button/next.gif";
    }
    else
    {
        t_left.style.display="";
        imgArrow.status = "expand";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
 }

//===============================================================
 function BodyInit()
 {        
        //---------------------------
        System.Translate(document);  // Translate to language session
        //----------------------
 } 

//===============================================================
  
 function F_OnCellClick(obj)
 {
    switch (obj.id)
    {
        case 'grdGroup' :
            if ( grdGroup.row > 0 )
            {
                txtGroupPK.text   = grdGroup.GetGridData( grdGroup.row, G1_Group_PK);
                lblGroupName.text = grdGroup.GetGridData( grdGroup.row, G1_Group_CD) + ' - ' + grdGroup.GetGridData( grdGroup.row, G1_Group_NM) ;
                txtSTItemPK.text  = '';
                
                OnSearch('grdItemList');
            }
        break;
        
        case 'grdItemList' :
            if ( txtGroupPK.text > 0 && grdItemList.row > 0 )
            {
                txtSTItemPK.text = grdItemList.GetGridData( grdItemList.row, G3_STITEM_PK);
                
                OnSearch('SpecList');
            }
        break;
    }
 }
      
 //===================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
        case 'Group' :
            data_agci00140.Call("SELECT");
        break;
        
        case 'SpecList' :         
            data_agci00140_1.Call("SELECT");                     
        break; 
          
        case 'grdItemList' :  
               
            if ( txtGroupPK.text > 0 )
            {
                data_agci00140_2.Call("SELECT");
            } 
            else
            {
                alert('Pls Select 1 Group !!!');
            }                       
        break;             
      }  
 }

 //===================================================================
 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {        		        
            case "data_agci00140_1" :
                if ( grdSpecList.rows > 1 )
                {
                    grdSpecList.SetCellBgColor( 1, G2_Spec_ID, grdSpecList.rows - 1, G2_Spec_Name, 0xCCFFFF );
                    
                    grdSpecList.SetCellBold( 1, G2_Spec_Group, grdSpecList.rows - 1, G2_Spec_Group, true);
                }
            break;
            
            case "data_agci00140_2" :
                lblCount.text = grdItemList.rows-1 + " item(s)." ;
                
                if ( grdItemList.rows > 1 )
                {            
                    grdItemList.SetCellBgColor( 1, G3_Item_Code, grdItemList.rows - 1, G3_Item_Name, 0xCCFFFF );
                }
                
                OnSearch('SpecList');
            break;
            
            case "pro_agci00140" :
                OnSearch('grdItemList');
            break;
      }  
 }
 
 //---------------------------------------------------------

 function CheckSpec()
 {
        txtItemSpecPK01.text = '' ; 
        txtItemSpecPK02.text = '' ;  
        txtItemSpecPK03.text = '' ;
        txtItemSpecPK04.text = '' ;
        txtItemSpecPK05.text = '' ;
        txtItemSpecPK06.text = '' ;
        txtItemSpecPK07.text = '' ;
        txtItemSpecPK08.text = '' ;
        txtItemSpecPK09.text = '' ;
        txtItemSpecPK10.text = '' ;           
    
        txtSpecPK01.text = '' ; 
        txtSpecPK02.text = '' ;  
        txtSpecPK03.text = '' ;
        txtSpecPK04.text = '' ;
        txtSpecPK05.text = '' ;
        txtSpecPK06.text = '' ;
        txtSpecPK07.text = '' ;
        txtSpecPK08.text = '' ;
        txtSpecPK09.text = '' ;
        txtSpecPK10.text = '' ;               
       
        for (var i=1; i<grdSpecList.rows; i++ )
        {   
              if ( grdSpecList.GetGridData( i, G2_TCO_SPEC_PK) == '' && grdSpecList.GetGridData( i, G2_Mandatory ) == 'Y' )
              {
                 alert('Pls select Spec for ' + grdSpecList.GetGridData( i, G2_Spec_Group) );
                 return false ;
              }
              else if ( i == 1 )
              {
                    txtItemSpecPK01.text   =  grdSpecList.GetGridData( i, G2_tco_stitemspec_pk );
                    txtSpecPK01.text       =  grdSpecList.GetGridData( i, G2_TCO_SPEC_PK       ); 
              }
              else if ( i == 2 )
              {
                    txtItemSpecPK02.text   =  grdSpecList.GetGridData( i, G2_tco_stitemspec_pk );
                    txtSpecPK02.text       =  grdSpecList.GetGridData( i, G2_TCO_SPEC_PK       ); 
              }
              else if ( i == 3 )
              {
                    txtItemSpecPK03.text   =  grdSpecList.GetGridData( i, G2_tco_stitemspec_pk );
                    txtSpecPK03.text       =  grdSpecList.GetGridData( i, G2_TCO_SPEC_PK       );
              }
              else if ( i == 4 )
              {
                    txtItemSpecPK04.text   =  grdSpecList.GetGridData( i, G2_tco_stitemspec_pk );
                    txtSpecPK04.text       =  grdSpecList.GetGridData( i, G2_TCO_SPEC_PK       );
              }
              else if ( i == 5 )
              {
                    txtItemSpecPK05.text   =  grdSpecList.GetGridData( i, G2_tco_stitemspec_pk );
                    txtSpecPK05.text       =  grdSpecList.GetGridData( i, G2_TCO_SPEC_PK       );

              }
              else if ( i == 6 )
              {
                    txtItemSpecPK06.text   =  grdSpecList.GetGridData( i, G2_tco_stitemspec_pk );
                    txtSpecPK06.text       =  grdSpecList.GetGridData( i, G2_TCO_SPEC_PK       );
 
              }
              else if ( i == 7 )
              {
                    txtItemSpecPK07.text   =  grdSpecList.GetGridData( i, G2_tco_stitemspec_pk );
                    txtSpecPK07.text       =  grdSpecList.GetGridData( i, G2_TCO_SPEC_PK       );
              }
              else if ( i == 8 )
              {
                    txtItemSpecPK08.text   =  grdSpecList.GetGridData( i, G2_tco_stitemspec_pk );
                    txtSpecPK08.text       =  grdSpecList.GetGridData( i, G2_TCO_SPEC_PK       ); 
              }
              else if ( i == 9 )
              {
                    txtItemSpecPK09.text   =  grdSpecList.GetGridData( i, G2_tco_stitemspec_pk );
                    txtSpecPK09.text       =  grdSpecList.GetGridData( i, G2_TCO_SPEC_PK       );
              }
              else if ( i == 10 )
              {
                    txtItemSpecPK10.text   =  grdSpecList.GetGridData( i, G2_tco_stitemspec_pk );
                    txtSpecPK10.text       =  grdSpecList.GetGridData( i, G2_TCO_SPEC_PK       );
              }     
       }
       return true ;  
 }
 
//============================================================
var gPreviousRow = -1 ;
//------------------------
function OnGridAfterEdit(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdSpecList" :

            break;
      }      
}
//==========================================================
function OnGridCellDoubleClick(oGrid)
{
      switch (oGrid.id)         
      {		                    
            case 'grdSpecList' :
                if ( event.row > 0 && ( event.col == G2_Spec_ID || event.col == G2_Spec_Name ) )
                {
					gPreviousRow = event.row;
					
					var queryString = "?pk=" + grdSpecList.GetGridData( gPreviousRow, G2_TCO_SPECGRP_PK);
                                                          
                    GetSpec(queryString);                             
                }
            break;
            
            case 'grdItemList' :
                var event_row = event.row ;
                var event_col = event.col ;
                
                if ( event_row > 0 && event_col == G3_Unit )
                {
                    var path = System.RootURL + '/form/fp/ab/fpab00230.aspx';
	                var obj = System.OpenModal( path ,550 , 500, 'resizable:yes;status:yes');
	               
	                if ( obj != null )
	                {
	                    grdItemList.SetGridText( event_row, event_col, obj[1] );
	                }	                
                }
            break;
      }      
   
}

//==========================================================
function GetSpec(p_querystring)
{
    var fpath = System.RootURL + "/standard/forms/fp/ab/fpab00540.aspx" + p_querystring;
    var aValue  = window.showModalDialog(  fpath , this , 'resizable:yes;toolbar=no;dialogWidth:45;dialogHeight:32');	
	
	if ( aValue != null ) 
	{	
		grdSpecList.SetGridText( gPreviousRow, G2_TCO_SPEC_PK, aValue[1] );//spec_pk
		grdSpecList.SetGridText( gPreviousRow, G2_Spec_ID,     aValue[2] );//spec_id
		grdSpecList.SetGridText( gPreviousRow, G2_Spec_Name,   aValue[3] );//spec_name
	}
}

//==========================================================

function OnDelete()
{

    if ( confirm ( "Do you want to delete this row?" ) )
    {
          grdItemList.DeleteRow()
    }

}
//-----------------------------------------------------------------------------------------------

function OnUnDelete()
{
          grdItemList.UnDeleteRow()

}

//================================================================
function OnAddNew(pos)
{
    switch (pos)
    {
        case 'grdSpecList' :
            txtSTItemPK.text = '' ;            
            OnSearch('SpecList');
        break;
        
        case 'grdItemList' :
            if ( grdGroup.row > 0 )
            {
                grdItemList.AddRow();
                grdItemList.SetGridText( grdItemList.rows-1, G3_Item_Grp_PK, grdGroup.GetGridData( grdGroup.row, G1_Group_PK ));
                grdItemList.SetGridText( grdItemList.rows-1, G3_Grp_CD,      grdGroup.GetGridData( grdGroup.row, G1_Group_CD ));      
                grdItemList.SetGridText( grdItemList.rows-1, G3_Grp_NM,      grdGroup.GetGridData( grdGroup.row, G1_Group_NM ));
                grdItemList.SetGridText( grdItemList.rows-1, G3_Unit,        grdGroup.GetGridData( grdGroup.row, G1_ITEM_UOM ));
            }
            else
            {
                alert('Pls select 1 group.');
            }    
        break;
    }
}

//================================================================
function OnSave(pos)
{
    switch (pos)         
    {		        
        case 'grdSpecList' :
            if ( CheckSpec(grdSpecList) == true && grdSpecList.rows > 1 )
            {
                pro_agci00140.Call();
            }
        break;
        
        case 'grdItemList' :
            data_agci00140_2.Call();
        break;     
    }  
}
 
//================================================================

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_agci00140" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="comm" function="st_lg_sel_agci00140" > 
                <input> 
                    <input bind="txtGroup" />                                       
                </input> 
                <output bind="grdGroup" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_agci00140_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="comm" function="st_lg_sel_agci00140_1"  > 
                <input>
                    <input bind="txtGroupPK" /> 
                    <input bind="txtSTItemPK" /> 
                </input> 
                <output bind="grdSpecList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_agci00140_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7" function="st_lg_sel_agci00140_2" procedure="st_lg_upd_agci00140_2" > 
                <input>
                    <input bind="txtGroupPK" /> 
                    <input bind="txtItem" /> 
                </input> 
                <output bind="grdItemList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_agci00140" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="st_lg_pro_agci00140" > 
                <input>
                    <input bind="txtItemSpecPK01" /> 
                    <input bind="txtItemSpecPK02" />
                    <input bind="txtItemSpecPK03" />
                    <input bind="txtItemSpecPK04" />
                    <input bind="txtItemSpecPK05" />
                    <input bind="txtItemSpecPK06" />
                    <input bind="txtItemSpecPK07" />
                    <input bind="txtItemSpecPK08" />
                    <input bind="txtItemSpecPK09" />
                    <input bind="txtItemSpecPK10" />               
                    <input bind="txtSpecPK01" /> 
                    <input bind="txtSpecPK02" />
                    <input bind="txtSpecPK03" />
                    <input bind="txtSpecPK04" />
                    <input bind="txtSpecPK05" />
                    <input bind="txtSpecPK06" />
                    <input bind="txtSpecPK07" />
                    <input bind="txtSpecPK08" />
                    <input bind="txtSpecPK09" />
                    <input bind="txtSpecPK10" />                
                    <input bind="txtGroupPK" />
                    <input bind="txtSTItemPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>            
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table border="1" style="height: 100%; width: 100%">
        <tr style="height: 50%">
            <td style="width: 35%" id="t_left">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td align="right" style="width: 10%; white-space: nowrap">
                            <b>Group</b>
                        </td>
                        <td style="width: 80%">
                            <gw:textbox id="txtGroup" styles='width:100%' onenterkey="OnSearch('Group')" />
                        </td>
                        <td style="width: 9%">
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch_1" onclick="OnSearch('Group')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="4">
                            <gw:grid id="grdGroup" header="_PK|Group Code|Group Name|_UOM" format="0|0|0|0" aligns="0|0|0|0"
                                defaults="|||" editcol="0|0|0|0" widths="0|1200|1500|0" styles="width:100%; height:100%"
                                sorting="T" acceptnulldate="true" oncellclick="F_OnCellClick(this)" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 65%" id="t_right">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%">
                            <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif"
                                style="cursor: hand;" onclick="OnToggle()" />
                        </td>
                        <td style="width: 80%" align="center">
                            <gw:label id="lblGroupName" styles='width:100%;color:cc0000;font:9pt' text=' --- ' />
                        </td>
                        <td style="width: 8%">
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn img="new" alt="Add New" id="btnAddNew_1" onclick="OnAddNew('grdSpecList') " />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn img="process" alt="Create Item Code" id="btnSave_1" onclick="OnSave('grdSpecList')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="5">
                            <gw:grid id='grdSpecList' header='_TCO_GRPSPECGRP_PK|_TCO_STITEMSPEC_PK|_TCO_ITEMGRP_PK|_GRP_CD|_TCO_STITEM_PK|SEQ|_TCO_SPECGRP_PK|Spec Grp|_MANDATORY|_TCO_SPEC_PK|Spec ID|Spec Name|_IDAUTO_YN|_SPEC_TYPE|_TYPE_YN|_STMAPPING_YN|Display CD|Display Nm|Prefix Code|Prefix Name|_SUB_CODE_YN'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|3|3|0|0|0' aligns='0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                editcol='0|0|0|0|0|0|0|0|0|0|1|1|0|0|0|0|0|0|0|0|0' widths='1000|1000|1000|2000|1000|800|1000|3000|1000|1000|1500|3000|1000|1000|1000|1000|1200|1200|1500|1500|1000'
                                sorting='T' onafteredit="OnGridAfterEdit(this)" oncelldblclick="OnGridCellDoubleClick(this)"
                                styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 50%" colspan="2">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td style="width: 10%" align="right">
                            <b>Item</b>
                        </td>
                        <td style="width: 40%">
                            <gw:textbox id="txtItem" styles='width:100%' onenterkey="OnSearch('grdItemList')" />
                        </td>
                        <td style="width: 45%" align="center">
                            <gw:label id="lblCount" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('grdItemList')" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn img="new" alt="Search" id="btnNew" onclick="OnAddNew('grdItemList')" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn img="udelete" alt="UnDelete" id="btnUnDelete" onclick="OnUnDelete()" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn img="Save" alt="Save" id="btnSave_2" onclick="OnSave('grdItemList')" />
                        </td>
                    </tr>
                    <tr style="height: 49%">
                        <td colspan="8">
                            <gw:grid id="grdItemList" header="_PK|_Grp_PK|Grp CD|Grp NM|Item Code|Item Name|Unit|Remark"
                                format="0|0|0|0|0" aligns="0|0|0|0|0|0|1|0" editcol="0|0|0|0|1|1|0|1" widths="0|0|1500|2000|2500|5000|800|1000"
                                styles="width:100%; height:100%" sorting="T" oncelldblclick="OnGridCellDoubleClick(this)"
                                oncellclick="F_OnCellClick(this)" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------------>
    <gw:grid id="grdSpec" header="pk|spec_id|spec_nm|spec_lnm|4|5|6|7|8|9|10|11" format="0|0|0|0|0|0|0|0|0|0|0|0"
        aligns="0|0|0|0|0|0|0|0|0|0|0|0" defaults="|||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0"
        widths="0|0|0|0|0|0|0|0|0|0|0|0" styles="width:100%; height:200; display:none"
        sorting="F" param="0,1,2,3,4,5,6,7,8,9,10,11" />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtGroupPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSTItemPK" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtSpecPK01" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK02" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK03" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK04" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK05" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK06" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK07" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK08" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK09" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtSpecPK10" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtItemSpecPK01" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK02" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK03" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK04" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK05" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK06" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK07" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK08" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK09" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecPK10" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtItemSpecType01" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType02" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType03" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType04" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType05" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType06" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType07" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType08" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType09" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtItemSpecType10" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtpur_yn" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------------>
    <gw:textbox id="txtItemDesc" text="Auto create from PO" styles='display:none' />
    <gw:textbox id="txtPO_date" style="display: none" />
    <gw:textbox id="txtCurr" style="display: none" />
    <!------------------------------------------------------------------------>
</body>
</html>
