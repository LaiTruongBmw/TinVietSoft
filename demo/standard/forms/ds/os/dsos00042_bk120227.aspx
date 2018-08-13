<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Spec Mapping Popup</title>
</head>
<%  CtlLib.SetUser("prod")%>

<script> 
var G_PK                        = 0,
    G_TPR_STYLE_CONSUMPTION_PK  = 1,
    G_PROD_SPEC1_PK             = 2,
    G_PROD_SPEC2_PK             = 3,
    G_PROD_SPEC3_PK             = 4,
    G_PROD_SPEC4_PK             = 5,
    G_PROD_SPEC5_PK             = 6,
    G_MAT_SPEC1_PK              = 7,
	G_MAT_SPEC1_NM  			= 8,
    G_MAT_SPEC2_PK              = 9,
	G_MAT_SPEC2_NM 				= 10,
    G_MAT_SPEC3_PK              = 11,
	G_MAT_SPEC3_NM 				= 12,
    G_MAT_SPEC4_PK              = 13,
	G_MAT_SPEC4_NM 				= 14,
    G_MAT_SPEC5_PK              = 15,
	G_MAT_SPEC5_NM 				= 16,
    G_DESCRIPTION               = 17;

/****** grdSpecGrp ******/        
var G1_TYPE             = 0,
    G1_STITEM_PK     = 1,
    G1_TCO_SPECGRP_PK   = 2,
    G1_SEQ              = 3,
    G1_SPECGRP_NM       = 4,
    G1_COL_NUM          = 5;

/****** grdSpec ******/        
var G2_SPEC_PK  = 0,          
    G2_SPEC_NM  = 1;    

/****** grdProdGrpSpec ******/
var G3_CHK          = 0,
    G3_ST_PROD_PK   = 1,
    G3_SEQ          = 2,
    G3_SPECGRP_PK   = 3,
    G3_SPECGRP_NM   = 4;

/****** grdMatGrpSpec ******/          
var G4_Chk              = 0,
    G4_ST_MAT_PK        = 1,
    G4_Seq              = 2,
    G4_TCO_SPECGRP_PK   = 3,
    G4_Spec_Grp         = 4,
    G4_TCO_SPEC_PK      = 5,
    G4_Spec             = 6;
    
/****** grdMapSpecList ******/    
var G5_SpecPK = 0;   

/****** grdSpecSetting ******/
var G6_Spec_PK      = 0,
    G6_SpecGrp_PK   = 1,
    G6_SpecMap_PK   = 2; 
//=========================================================================    

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
        imgArrow.src = "../../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="50%";
        imgArrow.src = "../../../../system/images/prev_orange.gif";
    }
 } 
     
//=========================================================================    
function BodyInit()
{   
    System.Translate(document); 
    var p_style_cons_pk   = "<%=request.QueryString("style_cons_pk") %>"   ; 
    var p_tsa_saleorder_pk = "<%=request.QueryString("tsa_saleorder_pk") %>" ;
      
    txtStyleConsPK.text = p_style_cons_pk ;
    txtSO_PK.text       = p_tsa_saleorder_pk ;                  
    //-------------------------
    idBtnMap.SetEnable(false);
    txtProd.SetEnable(false);
    txtMat.SetEnable(false);
    //-------------------------
    
    FormatGrid(); 
    //-------------------------
    
    OnSearch('Style');        
}
//======================================================================
 function FormatGrid()
 {
        var data="";
        //----------------------
        data = "<%=CtlLib.SetListDataSQL("SELECT   a.code, a.code_nm FROM sale.lg_code a, sale.lg_code_group b WHERE b.GROUP_ID = 'LGPC0110' AND a.lg_code_group_pk = b.pk AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 ORDER BY a.ord ") %>" ;        
        lstMapSpec.SetDataText(data);   
        lstMapSpec.value = '1';      
 }  

//=========================================================================    
function OnDataReceive(obj)
{

    switch (obj.id)
    {
        case 'data_dsbs00122' :
            OnSearch('SpecGrp');
        break;

        case 'data_dsbs00122_1' :
            SetGrid();
        break;
        
        case 'data_dsbs00122_2' :
            if ( grdMapSpec.rows > 1 )
            {
                grdMapSpec.SetCellBgColor(1, G_PROD_SPEC1_PK, grdMapSpec.rows - 1, G_PROD_SPEC5_PK, 0xCCFFFF );
            }  
            
            idBtnMap.SetEnable(true);  
        break;
        
        case 'data_dsbs00122_3' :
            //---------------------------
            var s = "";
            
            for ( var i = 1; i < grdSpec.rows ; i++ )
            {    
                s += "#" + grdSpec.GetGridData( i, G2_SPEC_PK ) + ";" + grdSpec.GetGridData( i, G2_SPEC_NM ) + "|" ;
            }
            
            s = s.substring( 0, s.length-1 );
            //-----------------
            grdMapSpec.SetComboFormat( grdSpecGrp.GetGridData( specgrp_num - 1, G1_COL_NUM ), s);
     
            //=================================            
            specgrp_num = specgrp_num - 1 ;
           
            if ( specgrp_num > 1 )
            {
                txtSpecGrpPK.text = grdSpecGrp.GetGridData( specgrp_num - 1, G1_TCO_SPECGRP_PK );
                txtSTItemPK.text  = grdSpecGrp.GetGridData( specgrp_num - 1, G1_STITEM_PK   );
            
                data_dsbs00122_3.Call("SELECT");
            }
            else
            {
                data_dsbs00122_2.Call("SELECT");
            }
            //---------------------------                        
        break;

        case 'data_dsbs00122_4' :
            if ( grdProdGrpSpec.rows > 1 )
            {
                grdProdGrpSpec.SetGridText( 1, G3_CHK, -1 );
            } 
			       
            data_dsbs00122_5.Call("SELECT");
        break;
        
        case 'data_dsbs00122_5' :
            OnSearch('SpecList');
        break;

        case 'data_dsbs00122_6' :
            //----------------
            var col_prod_num ;
            var col_mat_num ; 
            //----------------
            
            if ( grdMapSpecList.rows > 1 )
            {
                //-------            
                for ( var i = 1; i < grdSpecGrp.rows ; i++ )
                {
                    if ( grdSpecGrp.GetGridData( i, G1_TYPE) == 'PROD' && grdSpecGrp.GetGridData( i, G1_TCO_SPECGRP_PK) == txtMapSpecGrpPK.text )
                    {
                        col_prod_num = grdSpecGrp.GetGridData( i, G1_COL_NUM);
                    }
                }
                //-------
                for ( var i = 1; i < grdMapSpecList.rows; i++ )
                {
                    if ( f_check_exist( col_prod_num, grdMapSpecList.GetGridData( i, G5_SpecPK)))
                    {
                
                        grdMapSpec.AddRow();
                        
                        grdMapSpec.SetGridText( grdMapSpec.rows -1 , G_TPR_STYLE_CONSUMPTION_PK, txtStyleConsPK.text );                    
                        grdMapSpec.SetGridText( grdMapSpec.rows-1, col_prod_num, grdMapSpecList.GetGridData( i, G5_SpecPK) );
                        //-------
                        for ( var j = 1; j < grdMatGrpSpec.rows ; j++ )
                        {
                            if ( grdMatGrpSpec.GetGridData( j, G4_TCO_SPEC_PK) != '' )
                            {
                                for ( var k = 1; k < grdSpecGrp.rows; k++ )
                                {
                                    if ( grdSpecGrp.GetGridData( k, G1_TYPE) == 'MAT' && grdSpecGrp.GetGridData( k, G1_TCO_SPECGRP_PK) == grdMatGrpSpec.GetGridData( j, G4_TCO_SPECGRP_PK))
                                    {
                                        col_mat_num = grdSpecGrp.GetGridData( k, G1_COL_NUM);
                                    }    
                                } 
                                
                                grdMapSpec.SetGridText( grdMapSpec.rows-1, col_mat_num, grdMatGrpSpec.GetGridData( j, G4_TCO_SPEC_PK) );
                            }
                        }
                    }                         
                    //--------                   
                }    
            }
        break; 
        
        case 'data_dsbs00122_7' :
        
            for ( var i=1; i<grdSpecGrp.rows; i++ )
            {
                for ( var t=1; t<grdSpecSetting.rows; t++ )
                {
                    if ( grdSpecSetting.GetGridData( t, G6_SpecGrp_PK) == grdSpecGrp.GetGridData( i, G1_TCO_SPECGRP_PK) )
                    {
                        for (var j=1; j<grdMapSpec.rows ; j++ )
                        {
                            if ( grdMapSpec.GetGridData( j, t_spec_mapping_col) ==  grdSpecSetting.GetGridData( t, G6_Spec_PK) )
                            {
                                grdMapSpec.SetGridText( j, grdSpecGrp.GetGridData( i, G1_COL_NUM ), grdSpecSetting.GetGridData( t, G6_SpecMap_PK) );
                            }
                        }
                    }                    
                }
            }
            
        break;       
    }
}
//=========================================================================    

function f_check_exist(prod_col_num, spec_pk)
{
    for ( var i=1; i<grdMapSpec.rows; i++ )
    {
        if (  grdMapSpec.GetGridData( i, prod_col_num ) == spec_pk )
        {
            return false;
        }
    }
    return true;
}

//=========================================================================    
function OnSearch(pos)
{
    switch (pos)
    {
        case 'Style' :
                data_dsbs00122.Call("SELECT");    
        break;
        
        case 'SpecGrp' :
                data_dsbs00122_1.Call("SELECT"); 
        break;
        
        case 'SpecList' :
            if ( specgrp_num > 1 )
            {
                txtSpecGrpPK.text = grdSpecGrp.GetGridData( specgrp_num - 1, G1_TCO_SPECGRP_PK );
                txtSTItemPK.text  = grdSpecGrp.GetGridData( specgrp_num - 1, G1_STITEM_PK   );
                
                data_dsbs00122_3.Call("SELECT"); 
            }    
        break;
        
        case 'ItemSpecGrp' :
            data_dsbs00122_4.Call("SELECT"); 
        break ; 
         
        case 'MapSpecList' :
            data_dsbs00122_6.Call("SELECT"); 
        break ; 
        
        case 'SpecSetting' :       
            data_dsbs00122_7.Call("SELECT");
        break;         
                
    }
}
//=========================================================================    
function OnSave()
{
    data_dsbs00122_2.Call();
}

//=========================================================================    
var specgrp_num ;

function SetGrid()
{
     var prod_spec_seq = 2;
     var mat_spec_seq  = 7;
     
     for ( var i = 1; i < grdSpecGrp.rows; i++ )
     {
        if ( grdSpecGrp.GetGridData( specgrp_num, G1_TYPE ) == 'PROD')
        { 
            //------------------------             
            grdMapSpec.GetGridControl().Cell( 0, 0, prod_spec_seq , 0, prod_spec_seq ) = grdSpecGrp.GetGridData( i, G1_SPECGRP_NM);
            //------------------------             
            grdMapSpec.GetGridControl().ColHidden(prod_spec_seq) = false ;
            //------------------------
            grdSpecGrp.SetGridText( i, G1_COL_NUM, prod_spec_seq);
            
            prod_spec_seq++ ; 
			specgrp_num++;
        } 
        else
        {
            //------------------------             
            grdMapSpec.GetGridControl().Cell( 0, 0, mat_spec_seq , 0, mat_spec_seq ) = grdSpecGrp.GetGridData( specgrp_num, G1_SPECGRP_NM);
            //------------------------             
            grdMapSpec.GetGridControl().ColHidden(mat_spec_seq) = false ;
            //------------------------
            grdSpecGrp.SetGridText( specgrp_num, G1_COL_NUM, mat_spec_seq);            
            mat_spec_seq = mat_spec_seq + 2 ; 
        }              
     }
     //-------------------
     
     OnSearch('ItemSpecGrp');
     //-------------------
}

//========================================================================= 

function OnAddNew()
{
    grdMapSpec.AddRow();
    grdMapSpec.SetGridText( grdMapSpec.rows -1 , G_TPR_STYLE_CONSUMPTION_PK, txtStyleConsPK.text );
} 
//========================================================================= 
 
function OnDelete()
{
	if ( grdMapSpec.GetGridData( grdMapSpec.row, G_PK ) == "" ) 
    {						
	
			grdMapSpec.RemoveRow();					
	}			
	else 
	{
		if ( confirm( "Do you want to mark this row to delete?" ) ) 
		{
			grdMapSpec.DeleteRow();
		}
	}  
}
//========================================================================= 
 
function OnUnDelete()
{
    grdMapSpec.UnDeleteRow();
}
//========================================================================= 

function OnGridCellDblClick(obj)
{
    e_row = event.row ;
    e_col = event.col ;

    switch (obj.id)
    {
        case 'grdMatGrpSpec':
            if ( e_col == G4_Spec )
            {
                var path = System.RootURL + "/standard/forms/fp/ab/fpab00090.aspx?specgrp_pk=" + grdMatGrpSpec.GetGridData( e_row, G4_TCO_SPECGRP_PK) + "&tco_stitem_pk=" + txtSTMatPK.text ;
                var object  = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:500px;dialogHeight:500px');	
                
                if ( object != null )
                {
                    grdMatGrpSpec.SetGridText( e_row, G4_TCO_SPEC_PK, object[2]); // spec_pk
                    grdMatGrpSpec.SetGridText( e_row, G4_Spec       , object[4]); // spec_nm
                }
            }    
        break;
    }
}
//========================================================================= 

function OnMapping()
{
    for ( var i=1; i< grdProdGrpSpec.rows; i++)
    {
        if ( grdProdGrpSpec.GetGridData( i, G3_CHK) == -1 )
        {
            txtMapSpecGrpPK.text = grdProdGrpSpec.GetGridData( i, G3_SPECGRP_PK );
            txtMapProdPK.text    = grdProdGrpSpec.GetGridData( i, G3_ST_PROD_PK     );
            
            OnSearch('MapSpecList');
            
            return;
        }
    }
}
//========================================================================= 
var t_spec_mapping_col;

function OnSetSpec()
{
    for ( var i=1; i< grdProdGrpSpec.rows; i++)
    {
        if ( grdProdGrpSpec.GetGridData( i, G3_CHK) == -1 )
        {
            txtMapSpecGrpPK.text = grdProdGrpSpec.GetGridData( i, G3_SPECGRP_PK );
            
            t_spec_mapping_col = 0;
            
            for ( var i=1; i<grdSpecGrp.rows ; i++)
            {
                if ( grdSpecGrp.GetGridData( i, G1_TCO_SPECGRP_PK) == txtMapSpecGrpPK.text )
                {
                    t_spec_mapping_col = grdSpecGrp.GetGridData( i, G1_COL_NUM);
                }
            }
            
            OnSearch('SpecSetting');
            
            return;
        }        
    }
    alert('Pls Chk product spec group.');
}

//========================================================================= 

</script>

<body>
    <!-----------  --------->
    <gw:data id="data_dsbs00122" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2" function="st_lg_sel_dsbs00122" > 
                <inout> 
                    <inout bind="txtStyleConsPK" />
                    <inout bind="txtSTProdPK" />
                    <inout bind="txtProd" />
                    <inout bind="txtSTMatPK" />
                    <inout bind="txtMat" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!-----------  --------->
    <gw:data id="data_dsbs00122_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod"  function="st_lg_sel_dsbs00122_1"  > 
                <input> 
                    <inout bind="txtSTProdPK" />
                    <inout bind="txtSTMatPK" /> 
                 </input> 
                 <output bind="grdSpecGrp" />                 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------  --------->
    <gw:data id="data_dsbs00122_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod"  function="st_lg_sel_dsbs00122_2" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" procedure="st_lg_upd_dsbs00122_2" > 
                <input> 
                    <inout bind="txtStyleConsPK" />
                    <inout bind="txtSO_PK" /> 
                 </input> 
                 <output bind="grdMapSpec" />                 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------  --------->
    <gw:data id="data_dsbs00122_3" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod"  function="st_lg_sel_dsbs00122_3"  > 
                <input> 
                    <inout bind="txtSpecGrpPK" /> 
                    <inout bind="txtSTItemPK" />
                 </input> 
                 <output bind="grdSpec" />                 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------  --------->
    <gw:data id="data_dsbs00122_4" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod"  function="st_lg_sel_dsbs00122_4"  > 
                <input> 
                    <inout bind="txtSTProdPK" />
                 </input> 
                 <output bind="grdProdGrpSpec" />                 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------  --------->
    <gw:data id="data_dsbs00122_5" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod"  function="st_lg_sel_dsbs00122_5"  > 
                <input> 
                    <inout bind="txtSTMatPK" />
                 </input> 
                 <output bind="grdMatGrpSpec" />                 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="data_dsbs00122_6" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod"  function="st_lg_sel_dsbs00122_6"  > 
                <input> 
                    <inout bind="txtMapSpecGrpPK" />
                    <inout bind="txtMapProdPK" />
                    <inout bind="txtStyleConsPK" />
                    <inout bind="txtSO_PK" />
                 </input> 
                 <output bind="grdMapSpecList" />                 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="data_dsbs00122_7" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="prod"  function="st_lg_sel_dsbs00122_7"  > 
                <input> 
                    <inout bind="txtMapSpecGrpPK" />
                    <inout bind="lstMapSpec" />
                 </input> 
                 <output bind="grdSpecSetting" />                 
            </dso> 
        </xml> 
    </gw:data>    
    <!------------------------------------------------------------------->
    <table style="height: 100%; width: 100%" border="1">
        <tr>
            <td style="width: 45%" id="left">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td>
                            <gw:textbox id="txtProd" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 49%">
                        <td>
                            <gw:grid id='grdProdGrpSpec' header='Chk|_ST_PROD_PK|Seq|_TCO_SPECGRP_PK|Spec Grp|_TCO_SPEC_PK|_Spec'
                                format='3|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0' defaults='||||||' editcol='0|0|0|0|0|0|0'
                                widths='600|1000|600|1000|2000|1000|1000' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td>
                            <gw:textbox id="txtMat" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 49%">
                        <td>
                            <gw:grid id='grdMatGrpSpec' header='_Chk|_ST_MAT_PK|Seq|_TCO_SPECGRP_PK|Spec Grp|_TCO_SPEC_PK|Spec'
                                format='3|0|0|0|0|0|0' aligns='0|0|1|0|0|0|0' defaults='||||||' editcol='0|0|0|0|0|0|0'
                                widths='600|1000|600|1000|2000|1000|1000' sorting='T' styles='width:100%; height:100%'
                                oncelldblclick='OnGridCellDblClick(this)' />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 55%" id="right">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td>
                            <table style="height: 100%; width: 100%">
                                <tr>
                                    <td style="width: 5%" align="right">
                                        <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand"
                                            onclick="OnToggle()" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        <gw:button id="idBtnMap" img="Mapping" text="Mapping" onclick="OnMapping()" />
                                    </td>
                                    <td style="width: 20%; white-space: nowrap">
                                    </td>
                                    <td style="width: 49%">
                                        <gw:list id="lstMapSpec" styles="color:red;width:100%" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="idBtnMapToGrid" img="Set Spec" text="Set Spec" onclick="OnSetSpec()" />
                                    </td>
                                    <td style="width: 15%; white-space: nowrap">
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="ibtnSearch" img="search" alt="Search" onclick="data_dsbs00122_2.Call('SELECT')" />
                                    </td>
                                    <td align="right" style="width: 1%">
                                        <gw:button id="ibtnAddNew" img="new" alt="Add new" onclick="OnAddNew()" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="ibtnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:button id="ibtnUnDelete" img="UnDelete" alt="UnDelete" onclick="OnUnDelete()" />
                                    </td>
                                    <td align="right" style="width: 1%">
                                        <gw:button id="ibtnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td style="width: 100%">
                            <gw:grid id='grdMapSpec' header='_PK|_TPR_STYLE_CONSUMPTION_PK|_PROD_SPEC1_PK|_PROD_SPEC2_PK|_PROD_SPEC3_PK|_PROD_SPEC4_PK|_PROD_SPEC5_PK|_MAT_SPEC1_PK|Mat 01|_MAT_SPEC2_PK|Mat 02|_MAT_SPEC3_PK|Mat 03|_MAT_SPEC4_PK|Mat 04|_MAT_SPEC5_PK|Mat 05|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' defaults='|||||||||||||||||'
                                editcol='0|0|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|1' widths='1000|1000|2000|2000|2000|2000|2000|0|2000|0|2000|0|2000|0|2000|0|2000|1000'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
<!--------------------------------------------------------------------------------------->
<gw:textbox id="txtSTMatPK" styles='width:100%;display:none' />
<gw:textbox id="txtSTProdPK" styles='width:100%;display:none' />
<gw:textbox id="txtSO_PK" maxlen="100" styles='width:100%;display:none' />
<!--------------------------------------------------------------------------------------->
<gw:textbox id="txtStyleConsPK" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtSTItemPK" maxlen="100" styles='width:100%;display:none' />
<gw:textbox id="txtSpecGrpPK" maxlen="100" styles='width:100%;display:none' />
<!--------------------------------------------------------------------------------------->
<gw:grid id='grdSpecGrp' header='Type|Tco_sttem_pk|TCO_SPECGRP_PK|SEQ|SPECGRP_NM|Col_num'
    format='0|0|0|0|0|0' aligns='0|0|0|0|0|0' defaults='|||||' editcol='1|1|1|1|1|1'
    widths='1000|1000|1000|1000|1000|1000' sorting='T' styles='width:100%; height:460; display:none' />
<!--------------------------------------------------------------------------------------->
<gw:grid id='grdSpec' header='PK|SPEC_NM' format='0|0' aligns='0|0' defaults='|'
    editcol='1|1' widths='1000|1000' sorting='T' styles='width:100%; height:460; display:none' />
<!--------------------------------------------------------------------------------------->
<gw:textbox id="txtMapSpecGrpPK" styles='width:100%;display:none' />
<gw:textbox id="txtMapProdPK" styles='width:100%;display:none' />
<!--------------------------------------------------------------------------------------->
<gw:grid id='grdMapSpecList' header='Spec_PK' format='0' aligns='0' editcol='1|1'
    widths='1000' sorting='T' styles='width:100%; height:460; display:none' />
<!--------------------------------------------------------------------------------------->
<gw:grid id='grdSpecSetting' header='SpecPK|SpecGrp_PK|Spec Name' format='0|0|0'
    aligns='0|0|0' defaults='||' editcol='1|1|1' widths='1000|1000|1000' sorting='T'
    styles='width:100%; height:460; display:none' />    
<!--------------------------------------------------------------------------------------->
</html>
