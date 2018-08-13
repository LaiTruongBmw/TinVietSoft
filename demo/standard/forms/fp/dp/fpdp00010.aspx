<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>Cutting Pattern</title>
</head>

<script type="text/javascript" language="javascript">
//------------grdDetail----------

var G1_PK           = 0,
    G1_Patterm_ID   = 1,
    G1_Patterm_Nm   = 2;
     
 var G2_Pattern_ID              = 0,
     G2_PATTERN_NAME            = 1,
     G2_Group                   = 2,
     G2_TPR_PATTERN_GRPCOM_PK   = 3,
     G2_Component_ID            = 4,
     G2_Component_Name          = 5,
     G2_Size                    = 6,
     G2_Cut_Qty                 = 7,
     G2_CUTTING_MASTER_PK       = 8,
     G2_PK                      = 9;
 
 var G3_PATTERN_ID          = 0,
     G3_PATTERN_NAME        = 1,
     G3_PATTERN_GROUP_ID    = 2,
     G3_PK                  = 3,
     G3_COMPONENT_ID        = 4,
     G3_COMPONENT_NAME      = 5,
     G3_P_SIZE_SPEC_PK      = 6,
     G3_QTY                 = 7;
     
 var v_update = 0;
 
 //====================================================  
function BodyInit()
{ 
    System.Translate(document);
     BindingDataList();  
     OnGridFormat();
}
 //====================================================  
function BindingDataList()
{    
      var data="";
            
      data = "<%=ESysLib.SetGridColumnDataSQL(" SELECT  a.pk, a.spec_id FROM tlg_it_spec a WHERE a.del_if = 0 AND a.tlg_it_specgrp_pk IN ( SELECT MAX (b.pk) FROM tlg_it_specgrp b WHERE b.del_if = 0 and SPECGRP_NM = 'SIZE'/* AND specgrp_type = '20'*/ ) ORDER BY spec_seq" ) %> ";             
      grdCuttingPattern.SetComboFormat( G2_Size, data);
      
      data = "<%=ESysLib.SetListDataSQL(" SELECT  a.pk, a.spec_id FROM tlg_it_spec a WHERE a.del_if = 0 AND a.tlg_it_specgrp_pk IN ( SELECT MAX (b.pk) FROM tlg_it_specgrp b WHERE b.del_if = 0 AND SPECGRP_NM = 'SIZE'/* AND specgrp_type = '20'*/) ORDER BY spec_seq ")%>";     
      lstSize.SetDataText(data); 
      
      data = "<%=ESysLib.SetListDataSQL("SELECT   pk, pattern_id || ' - ' || pattern_name FROM tlg_pt_pattern WHERE del_if = 0 ORDER BY pattern_id ")%>";     
      lstPattern.SetDataText(data);                      
}
 //====================================================  
function OnGridFormat()
{
      var trl;
                  
      trl = grdCuttingPattern.GetGridControl();
      trl.ColFormat(G2_Cut_Qty)  = "###,###,###,###,###"; 
}
//==========================================================================    
function OnSearch(id)
{      
       switch(id)
       {
            case 'PatternList' :    //Seach pattern
                 data_fpdp00010.Call('SELECT');
                 SetMasterPKtoGrid();
            break;  
            
            case 'Pattern' : 
                SetMasterPKtoGrid();
                 //Patterm Master
                 if ( grdSearch.row > 0 )
                 {
                    txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G1_PK);
                 }
                 else
                 {
                    txtMasterPK.text = '';
                 } 
                 //------------------------
                 flag_update = '';  
                 //-----------------------
                 data_fpdp00010_1.Call('SELECT');
                 //-----------------------
            break;
            
            case 'grdComponent' :
                 if ( grdComponentGroup.row > 0 ) 
                 {
                    txtGroupComponentPK.text = grdComponentGroup.GetGridData( grdComponentGroup.row, G2_PK);
                 }
                 else
                 {
                    txtGroupComponentPK.text = '' ;
                 }
                 //------------
                 
                 data_fpdp00010_3.Call('SELECT');  
            break;
            
            case 'PatternComponent' :
                 data_fpdp00010_3.Call('SELECT');  
            break;            
       }
}
//==============================================================
function OnNew(id)
{
    switch(id)
    {
        case 'Pattern':                                           //New Detail
            data_fpdp00010_1.StatusInsert();
        break;
        
        case 'ComponentGroup':        //New Component Group
                SetMasterPKtoGrid();
                
                if ( txtMasterPK.text != '' )
                {
                     var path = System.RootURL + '/form/fp/dp/fpdp00110.aspx?popup_yn=Y';
                     var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
                     
                     if ( object != null )
                     {
                        for( var i=0; i < object.length; i++) 
                        {
                              grdCuttingPattern.AddRow(); 
                              
                              grdCuttingPattern.SetGridText( grdCuttingPattern.rows-1, G2_TPR_PATTERN_GRPCOM_PK, object[i][1] );
                              grdCuttingPattern.SetGridText( grdCuttingPattern.rows-1, G2_Component_ID, object[i][3] );
                              grdCuttingPattern.SetGridText( grdCuttingPattern.rows-1, G2_Component_Name,     object[i][4] );
                              grdCuttingPattern.SetGridText( grdCuttingPattern.rows-1, G2_Cut_Qty,     object[i][5] );
                              grdCuttingPattern.SetGridText( grdCuttingPattern.rows-1, G2_CUTTING_MASTER_PK, txtMasterPK.text )
                               
                              grdCuttingPattern.SetGridText( grdCuttingPattern.rows-1, G2_Pattern_ID,lstPattern.GetText() );                               
                              grdCuttingPattern.SetGridText( grdCuttingPattern.rows-1, G2_PATTERN_NAME,lstPattern.GetText());  
                              grdCuttingPattern.SetGridText( grdCuttingPattern.rows-1, G2_Size, lstSize.value);                          
                              
                        }  
                     }
                }
            
        break;
     
 
        case 'grdComponent':        //New Component 
            if ( grdComponentGroup.row > 0 )
            {
                if ( txtGroupComponentPK.text != '' )
                {
                     var path = System.RootURL + '/form/fp/dp/fpdp00020.aspx';
                     var object = System.OpenModal( path ,900 , 600 ,  'resizable:yes;status:yes');
                     
                     if ( object != null )
                     {
                        for( var i=0; i < object.length; i++) 
                        {
                              grdComponent.AddRow(); 
                               
                              grdComponent.SetGridText( grdComponent.rows-1, G3_Component_Group_PK, txtGroupComponentPK.text );
                              grdComponent.SetGridText( grdComponent.rows-1, G3_tco_component_pk, object[i][0] );
                              grdComponent.SetGridText( grdComponent.rows-1, G3_Component_ID,     object[i][1] );
                              grdComponent.SetGridText( grdComponent.rows-1, G3_Component_NM,     object[i][2] );
                              grdComponent.SetGridText( grdComponent.rows-1, G3_Component_Type,   object[i][4] );                               
                              grdComponent.SetGridText( grdComponent.rows-1, G3_PICTURE_PK,       object[i][6] ); 
                        }  
                     }
                }
                else
                {
                    alert('Pls Save this Group first.');
                }
            }
            else
            {
                alert('Pls select one saved Component Group.');
            }
        break;
       
    }
   
}
//==============================================================
var flag_update ;
//==============================================================
function OnSave(id)
{
    switch (id)
    {
        case 'Pattern':
            flag_update = 'update' ;
            data_fpdp00010_1.Call();
        break;
        
        case 'ComponentGroup':
            data_fpdp00010_2.Call();
        break;          
            
    }
}
//==============================================================
function OnDelete(obj)
{
    if ( obj == 'Pattern' )
    {
        if ( confirm ( "Do you want to delete this order?" ) )
        {
            if ( txtMasterPK != "")
            {
                data_fpdp00010_1.StatusDelete();
                data_fpdp00010_1.Call();
            }    
            else
            {
                alert("Please,Select a SO !");
            }    
        }
    }
    else 
    {
          if ( obj.row > 0 )
          {
                if ( obj.GetGridData( obj.row, 8 ) == "" ) 
                {						
		                obj.RemoveRow();	
                }			
                else 
                {
	                if ( confirm( "Do you want to mark this row to delete?" ) ) 
	                {
		                obj.DeleteRow();
		                data_fpdp00010_2.Call();
	                }
                }       
          }
    }  
}
//==============================================================
    function OnUnDelete()
    {
          var ctrl =  grdMaster.GetGridData()  
          var row  = ctrl.row; 
          
          if ( row > 0 )
          {
                grdMaster.UnDeleteRow();
          }
    }

//==============================================================================
function OnDataReceive(obj)
{   
    switch(obj.id)
    {
        case 'data_fpdp00010_1':
        
             if ( flag_update == 'update' )
             {
                OnSave('ComponentGroup');
             }
             else
             {
                data_fpdp00010_2.Call("SELECT");
             } 
               
        break;
        case 'data_fpdp00010_3':
            //--------------------------------
            for ( var i = 1; i < grdTmp.rows; i ++ )
            {
                 var check_exist = '0';
                 for ( var j = 1; j < grdCuttingPattern.rows; j++ )
                 {
                     if ( grdTmp.GetGridData( i, G3_PK ) == grdCuttingPattern.GetGridData( j, G2_TPR_PATTERN_GRPCOM_PK ) && grdTmp.GetGridData( i, G3_P_SIZE_SPEC_PK ) == grdCuttingPattern.GetGridData( j, G2_Size ) )
                     {
                        check_exist = '1';
                     }
                 }
                 
                 if ( check_exist == '0' ) 
                 {
                     grdCuttingPattern.AddRow();
                     grdCuttingPattern.SetGridText( grdCuttingPattern.rows-1, G2_CUTTING_MASTER_PK, txtMasterPK.text );
                     
                     grdCuttingPattern.SetGridText( grdCuttingPattern.rows-1, G2_Pattern_ID,   grdTmp.GetGridData( i, G3_PATTERN_ID       ) );
                     grdCuttingPattern.SetGridText( grdCuttingPattern.rows-1, G2_PATTERN_NAME, grdTmp.GetGridData( i, G3_PATTERN_NAME     ) );
                     grdCuttingPattern.SetGridText( grdCuttingPattern.rows-1, G2_Group,        grdTmp.GetGridData( i, G3_PATTERN_GROUP_ID ) );
                     
                     grdCuttingPattern.SetGridText( grdCuttingPattern.rows-1, G2_TPR_PATTERN_GRPCOM_PK,    grdTmp.GetGridData( i, G3_PK ) );
                     
                     grdCuttingPattern.SetGridText( grdCuttingPattern.rows-1, G2_Component_ID,   grdTmp.GetGridData( i, G3_COMPONENT_ID   ) );
                     grdCuttingPattern.SetGridText( grdCuttingPattern.rows-1, G2_Component_Name, grdTmp.GetGridData( i, G3_COMPONENT_NAME ) );
                     grdCuttingPattern.SetGridText( grdCuttingPattern.rows-1, G2_Size,           grdTmp.GetGridData( i, G3_P_SIZE_SPEC_PK ) );
                     grdCuttingPattern.SetGridText( grdCuttingPattern.rows-1, G2_Cut_Qty,        grdTmp.GetGridData( i, G3_QTY            ) );
                 }
            }
        break;        
       
    }
}
//==================================================
 function SetMasterPKtoGrid()
 {
    if ( txtMasterPK.text != '' )
    {
        for (var i = 1; i < grdCuttingPattern.rows ; i++ )
        {
            if ( grdCuttingPattern.GetGridData( i, G2_CUTTING_MASTER_PK) == "" )
            {
                grdCuttingPattern.SetGridText( i, G2_CUTTING_MASTER_PK, txtMasterPK.text) ;
            }
        }
    }    
 }
//==============================================================================

function findItem()
{
    var path = System.RootURL + '/form/fp/ab/fpab00080.aspx?sale_yn=Y&prod_yn=Y'
        var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');

        if( object != null )
        {
            txtSTItemPK.text   = object[0];
            txtSTItemCode.text = object[1];
            txtSTItemName.text = object[2];
        }
}
function findMatItem()
{
    if ( radSearchItem.GetData() == '1' )
    {
        var path = System.RootURL + '/form/fp/ab/fpab00080.aspx?pur_yn=Y&prod_yn=Y'
        var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');

        if( object != null )
        {
            txtSTMatPK.text = object[0];
            txtMatPK.text   = '';
            txtMatCode.text = object[1];
            txtMatName.text = object[2];
        }
    }
    else
    if ( radSearchItem.GetData() == '2' )
    {
        var path = System.RootURL + '/form/fp/ab/fpab00110.aspx?pur_yn=Y&prod_yn=Y'
        var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');

        if( object != null )
        {
            txtMatPK.text   = object[0];
            txtSTMatPK.text = '';
            txtMatCode.text = object[1];
            txtMatName.text = object[2];
        }
     }
}
//---------------------------------------------------------------------
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
        right.style.width="65%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
 }              
//======================================================================
function OnAttachFile()
{
     var pattern_pk, picture_pk ;
     picture_pk = txtItemPhotoPK.GetData();
     var path = System.RootURL + '/form/fp/dp/fpdp00065.aspx?picture_pk=' + picture_pk ;
     var object = System.OpenModal( path , 400 , 400 ,  'resizable:yes;status:yes');
     {
         if(object!= null)
         {
             txtItemPhotoPK.SetDataText(object[0]);
         }
     }
 }
//----------------------------------------------------------------------
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpdp00010" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid"   function="<%=l_user%>lg_sel_fpdp00010"  > 
                <input> 
                    <input bind="txtPattern" />
                    <input bind="txtStyle" />
                    <input bind="chkUseYNSearch" /> 
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpdp00010_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17" function="<%=l_user%>lg_sel_fpdp00010_1" procedure="<%=l_user%>lg_upd_fpdp00010_1"> 
                <inout> 
                    <inout bind="txtMasterPK" />
                    <inout bind="txtPatternID" />   
                    <inout bind="txtPatternName" />
                    <inout bind="txtSTItemPK"  />
                    <inout bind="txtSTItemCode"  />
                    <inout bind="txtSTItemName" />
                    <inout bind="chkUseYN" />
                    <inout bind="txtItemPhotoPK" />
                    <inout bind="txtSTMatPK"/>
                    <inout bind="txtMatPK"/>
                    <inout bind="txtMatCode" />
                    <inout bind="txtMatName" />
                    <inout bind="txtNetQty" />
                    <inout bind="txtLossQty" />
                    <inout bind="txtGrossQty" />
                    <inout bind="txtWidth" />
                    <inout bind="txtHeight" />
                    <inout bind="txtTotal" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpdp00010_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9" function="<%=l_user%>lg_sel_fpdp00010_2" procedure="<%=l_user%>lg_upd_fpdp00010_2" > 
                <input> 
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdCuttingPattern" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpdp00010_3" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid"  function="<%=l_user%>lg_sel_fpdp00010_3" > 
                <input> 
                    <input bind="lstPattern" />
                    <input bind="lstSize" /> 
                </input> 
                <output bind="grdTmp" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------Search Pattern Master---------------------------------->
    <table name="Pattern Type Entry" border="1" style="height: 100%; width: 100%">
        <tr style="height: 100%">
            <td id="left" style="width: 35%" valign="top" rowspan="2">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%; white-space: nowrap" align="right">
                            ID/Name
                        </td>
                        <td style="width: 79%">
                            <gw:textbox id="txtPattern" styles='width:100%' onenterkey="OnSearch('PatternList')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('PatternList')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%; white-space: nowrap" align="right">
                            Style
                        </td>
                        <td style="width: 79%">
                            <gw:textbox id="txtStyle" styles='width:100%' onenterkey="OnSearch('PatternList')" />
                        </td>
                        <td style="white-space: nowrap">
                            Use<gw:checkbox id="chkUseYNSearch" defaultvalue="Y|N" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id='grdSearch' header='_PK|Pattern ID|Pattern Name|_TCO_STITEM_PK|Style Code|Style Name'
                                format='0|0|0|0|0|0' aligns='0|0|0|0|0|0' defaults='|||||' editcol='0|0|0|0|0|0'
                                widths='1000|1200|1500|1000|1500|1000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('Pattern')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 65%; height: 60%">
                <table style="height: 100%; width: 100%">
                    <tr>
                        <td colspan="10">
                            <table style="height: 100%; width: 100%">
                                <tr style="height: 1%">
                                    <td style="width: 10%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="findItem()">Style </b>
                                    </td>
                                    <td style="white-space: nowrap" colspan="3">
                                        <gw:textbox id="txtSTItemPK" styles='width:100%;display:none' />
                                        <gw:textbox id="txtSTItemCode" styles='width:25%' csstype="mandatory" />
                                        <gw:textbox id="txtSTItemName" styles='width:75%' csstype="mandatory" />
                                    </td>
                                    <td style="width: 5%">
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                    <td style="width: 1%" align="right">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="new" alt="New" id="btnAdd1" onclick="OnNew('Pattern')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="delete" alt="Delete" id="btnDelete1" onclick="OnDelete('Pattern')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn img="save" alt="Save" id="btnSave1" onclick="OnSave('Pattern')" />
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td style="width: 10%; white-space: nowrap" align="right">
                                        Pattern ID
                                    </td>
                                    <td style="width: 25%">
                                        <gw:textbox id="txtPatternID" maxlen="100" styles='width:100%' />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        Name
                                    </td>
                                    <td style="width: 35%">
                                        <gw:textbox id="txtPatternName" maxlen="100" styles='width:100%' />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="OnAttachFile()">Picture </b>
                                    </td>
                                    <td style="white-space: nowrap" colspan="6" align="center">
                                        Use YN
                                        <gw:checkbox id="chkUseYN" defaultvalue="Y|N" value="Y" />
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td style="width: 10%" align="right">
                                        <b style="color: #1b2ff2; cursor: hand" onclick="findMatItem()">Mat </b>
                                    </td>
                                    <td style="white-space: nowrap" colspan="3">
                                        <gw:textbox id="txtMatPK" styles='width:100%;display:none' />
                                        <gw:textbox id="txtSTMatPK" styles='width:100%;display:none' />
                                        <gw:textbox id="txtMatCode" styles='width:25%' csstype="mandatory" />
                                        <gw:textbox id="txtMatName" styles='width:75%' csstype="mandatory" />
                                    </td>
                                    <td style="white-space: nowrap; white-space: nowrap" colspan="6" align="center">
                                        <gw:radio id="radSearchItem" value="1" styles="width:100%">                      
			                                <span value="1">ST Item</span>                       
			                                <span value="2">Item</span>    			                                
        			                    </gw:radio>
                                    </td>
                                </tr>
                                <tr style="height: 1%">
                                    <td colspan="10">
                                        <table style="width: 100%; height: 100%" border="1">
                                            <tr>
                                                <td style="width: 5%" align="center">
                                                </td>
                                                <td style="width: 15%" align="center">
                                                    Net
                                                </td>
                                                <td style="width: 15%" align="center">
                                                    Loss
                                                </td>
                                                <td style="width: 15%" align="center">
                                                    Gross
                                                </td>
                                                <td style="width: 15%" align="center">
                                                    Width
                                                </td>
                                                <td style="width: 15%" align="center">
                                                    Height
                                                </td>
                                                <td style="width: 20%" align="center">
                                                    Total (M2)
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 5%" align="center">
                                                </td>
                                                <td style="width: 15%" align="center">
                                                    <gw:textbox id="txtNetQty" format="###,###,###,###,###.##" type="number" maxlen="100"
                                                        styles='width:100%' />
                                                </td>
                                                <td style="width: 15%" align="center">
                                                    <gw:textbox id="txtLossQty" format="###,###,###,###,###.##" type="number" maxlen="100"
                                                        styles='width:100%' />
                                                </td>
                                                <td style="width: 15%" align="center">
                                                    <gw:textbox id="txtGrossQty" format="###,###,###,###,###.##" type="number" maxlen="100"
                                                        styles='width:100%' />
                                                </td>
                                                <td style="width: 15%" align="center">
                                                    <gw:textbox id="txtWidth" format="###,###,###,###,###.##" type="number" maxlen="100"
                                                        styles='width:100%' />
                                                </td>
                                                <td style="width: 15%" align="center">
                                                    <gw:textbox id="txtHeight" format="###,###,###,###,###.##" type="number" maxlen="100"
                                                        styles='width:100%' />
                                                </td>
                                                <td style="width: 20%" align="center">
                                                    <gw:textbox id="txtTotal" format="###,###,###,###,###.##" type="number" maxlen="100"
                                                        styles='width:100%' />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 1%" align="right">
                        <td style="width: 10%" align="left">
                            <img status="expand" id="imgArrow" src="../../../system/images/prev_orange.gif" style="cursor: hand"
                                onclick="OnToggle()" />
                        </td>
                        <td colspan="9">
                            <hr noshade size="2" style="color: Silver" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%; white-space: nowrap" align="right">
                            Style Pattern
                        </td>
                        <td style="width: 35%">
                            <gw:list id="lstPattern" styles="width:100%" />
                        </td>
                        <td style="width: 10%" align="right">
                            Size
                        </td>
                        <td style="width: 35%">
                            <gw:list id="lstSize" styles="width:100%" />
                        </td>
                        <td style="width: 5%" align="left">
                            <gw:imgbtn img="process" alt="Add Pattern Group" id="btnCreate" onclick="OnSearch('PatternComponent')" />
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%" align="right">
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="new" alt="New" id="btnAdd3" onclick="OnNew('ComponentGroup')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDelete3" onclick="OnDelete(grdCuttingPattern)" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:imgbtn img="Udelete" alt="Un Delete" id="btnUDelete3" onclick="OnUnDelete('grdCuttingPattern')" />
                        </td>
                    </tr>
                    <tr style="height: 96%">
                        <td colspan="10">
                            <gw:grid id='grdCuttingPattern' header='Pattern ID|Pattern Name|Group ID|_tpr_pattern_grpcom_pk|Component ID|Component Name|Size|Qty|_tpr_pattern_cutting_pk|_pk'
                                format='0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|1|0|0' defaults='|||||||||'
                                editcol='0|0|0|0|0|0|1|1|0|0' widths='1350|1300|1200|1000|1300|2000|1000|280|0|0'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        
    </table>
</body>
<!------------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtGroupComponentPK" maxlen="100" styles='width:100%;display:none' />
<!------------------------------------------------------------------------------------>
<gw:grid id='grdTmp' header='PATTERN_ID|PATTERN_NAME|PATTERN_GROUP_ID|PK|COMPONENT_ID|COMPONENT_NAME|P_SIZE_SPEC_PK|QTY'
    format='0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0' defaults='|||||||' editcol='1|1|1|1|1|1|1|1'
    widths='1000|1000|1000|1000|1000|1000|1000|1000' sorting='T' styles='width:100%; height:460; display:none' />
<!------------------------------------------------------------------------------------>
<gw:textbox id="txtItemPhotoPK" text="" style="display: none" />
<gw:textbox id="p_pattern_id" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="p_pattern_nm" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="p_net_qty" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="p_loss_rate" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="p_cons_qty" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="p_unit" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="p_picture" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="p_component_type" maxlen="100" styles='width:100%;display:none' />
<!------------------------------------------------------------------------------------>
</html>
