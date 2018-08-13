<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Item Spec Mapping</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
//---------grdSTItem------
var G1_STItem_PK          =  0 ;
    G1_ITEMGRP_PK         =  1 ;
    G1_STItem_Code        =  7 ;
    G1_STItem_Name        =  8 ;
    G1_STItem_UOM         =  9 ;
//---------grdSpec----    
var G2_pk           = 0,
    G2_Spec_ID      = 1,
    G2_Spec_Name    = 2;
//---------grdMapping------
var G3_stitem_pk    = 0,
    G3_pk           = 4,
    G3_seq          = 5,    
    G3_group_nm     = 6,
    G3_spec_pk      = 7,
    G3_spec_code    = 8,
    G3_spec_name    = 9;

//-----------------------------------------------   
function BodyInit()
{
    BindingDataList();
}
//---------------------------------------------------------
function BindingDataList()
{ 
    System.Translate(document); 
    var data ;
    
    data = "<%=CtlLib.SetListDataSQL(" SELECT p.pk, p.grp_cd || ' * ' || p.grp_nm FROM tlg_it_itemgrp p WHERE p.del_if = 0 AND p.leaf_yn = 'Y' order by p.grp_cd ")%>||Select ALL"; 
    cboItemGroup.SetDataText(data);
    cboItemGroup.value = '' ;
    //-----------------------------
}
//---------------------------------------------------------

function OnSearch(pos)
{
    switch(pos)
    {
        case 'grdSTItem' :
            agci00090.Call('SELECT');
        break;
        
        case 'grdSpec' :
            //-------------------------
            if ( grdSTItem.row > 0 )
            {
                txtSTItemPK.text = grdSTItem.GetGridData( grdSTItem.row, G1_STItem_PK  );
            }  
            else
            {
                txtSTItemPK.text = '';
            }          
            //-------------------------        
            agci00090_1.Call("SELECT");
        break;
 
        case 'grdMapping' :
            //-------------------------
            if ( grdSTItem.row > 0 )
            {
                txtSTItemPK.text = grdSTItem.GetGridData( grdSTItem.row, G1_STItem_PK  );
            }  
            else
            {
                txtSTItemPK.text = '';
            }          
            //-------------------------
            agci00090_2.Call("SELECT");
            //-------------------------
        break;
                
    }     
}

//-------------------------------------------------------------- 

function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {
        case "agci00090":
            agci00090_3.Call();
        break;

        case "agci00090_3":
        
            cboSpecGrp_Mapping.SetDataText(txtSpecGroupList.text);
            cboSpecGrp_Search.SetDataText(txtSpecGroupList.text + '|ALL|SELECT ALL');
            cboSpecGrp_Search.value = 'ALL' ;
            grdSpec.ClearData();
            
            OnSearch('grdMapping');
        break;
        
        case "agci00090_2":
             lblRowCount.SetDataText( "" + (grdMapping.GetGridControl().Rows - 1 ) );
        break;
    }
}

//-------------------------------------------------------
function OnSave()
{
    if (confirm("Do you want to save?"))
    {
        agci00090_2.Call();
    }
}

//-------------------------------------------------------
function OnDelete()
{
    if (confirm("Do you want to delete this record ?"))
    {
        grdMapping.DeleteRow();        
    }
}

//-------------------------------------------------------
function OnMapping()
{
    var r_pk       = "";
    var r_specId   = "";
    var r_specName = "";
    var r_group    = "";
    var r_client   = "";
    var r_rows     = "";
    //----------------------------------------------------
    if ( grdSTItem.row > 0 )
    {
        txtSTItemPK.text = grdSTItem.GetGridData( grdSTItem.row, G1_STItem_PK ) ;
    }
    else
    {
        alert("Please select an item first!");
        return;
    } 
//==================================================================================================     
    var ctrl = grdSpec.GetGridControl();
    
    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
    {
        r_pk       = grdSpec.GetGridData( ctrl.SelectedRow(i), G2_pk        );
        r_specId   = grdSpec.GetGridData( ctrl.SelectedRow(i), G2_Spec_ID   );
        r_specName = grdSpec.GetGridData( ctrl.SelectedRow(i), G2_Spec_Name );
        
        r_check = 0;
        //----------------------------------------
        for(var j = 1; j < grdMapping.GetGridControl().Rows; j++)
        {
            if (( grdMapping.GetGridData( j, G3_stitem_pk) == txtSTItemPK.text ) && ( grdMapping.GetGridData( j, G3_spec_pk) == r_pk ))
            {
                r_check = 1;
            }
        }
       //----------------------------------------
        if ( r_check == 0 )
        {
            grdMapping.AddRow(); 
            
            grdMapping.SetGridText( grdMapping.rows - 1, G3_stitem_pk, txtSTItemPK.text );//StItem_PK
            grdMapping.SetGridText( grdMapping.rows - 1, G3_spec_pk,   r_pk             );
            
            grdMapping.SetGridText( grdMapping.rows - 1, G3_seq, getMaxSeq(cboSpecGrp_Mapping.GetText())+1); //master_pk	    	                                               
            
            grdMapping.SetGridText( grdMapping.rows - 1, G3_group_nm , cboSpecGrp_Mapping.GetText()     );
            grdMapping.SetGridText( grdMapping.rows - 1, G3_spec_code, r_specId         );
            grdMapping.SetGridText( grdMapping.rows - 1, G3_spec_name, r_specName       );
        }
    }
}

//==================================================================================================

function onAutoClick()
{
   var fpath = System.RootURL + "/standard/forms/ag/ci/agci00091.aspx"
   
   if ( grdSTItem.rows >1 )
   {
        if (grdSTItem.row>0)
        {
            fpath = fpath + "?item_pk="+grdSTItem.GetGridData(grdSTItem.row,G1_STItem_PK)+"&item_code="+grdSTItem.GetGridData(grdSTItem.row,G1_STItem_Code)+"&item_nm="+grdSTItem.GetGridData(grdSTItem.row,G1_STItem_Name);
        }
        
   }
   oValue = System.OpenModal( fpath , 800 , 600, 'resizable:yes;status:yes');

}

//==================================================================================================
function getMaxSeq(grp)
{   
    var value = 0
    var items = grdMapping.rows
    if (items<1)
    {
         return value;
    }
    else
    {
        for(var i =1 ; i<items ; i ++)
        {
            if(grdMapping.GetGridData(i,G3_group_nm)==grp)
            {
                if ( Number( grdMapping.GetGridData(i,G3_seq) ) > value )
                {
                    value = Number( grdMapping.GetGridData(i,G3_seq) )
                }
            }
        }
        return value
    }
}  
//==================================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case '1':
               var path = System.RootURL + '/form/ag/ci/agci00020.aspx?specgrp=' + cboSpecGrp_Mapping.GetText();
               var object  = window.showModalDialog( path , this , 'resizable:yes;toolbar=no;dialogWidth:750px;dialogHeight:500px');	               
        break; 
    }
}
//==================================================================================================

</script>

<body>
    <!-----------------grdTCO_STITEM ---------------------------------------->
    <gw:data id="agci00090" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"   parameter="0,1,2" function="st_lg_sel_agci00090" > 
                <input bind="grdSTItem" > 
                   <input bind="cboItemGroup" />
                   <input bind="txtItem" /> 
                </input> 
                <output bind="grdSTItem" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------grdSpec ---------------------------------------->
    <gw:data id="agci00090_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="2" type="grid" user="comm" parameter="0,1,2" function="st_lg_sel_agci00090_1" > 
                <input bind="grdSpec" > 
                    <input bind="txtSTItemPK" />
                    <input bind="cboSpecGrp_Mapping" />
                    <input bind="txtSpec" /> 
                </input> 
                <output bind="grdSpec" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!-----------------agci00090_2 ---------------------------------------->
    <gw:data id="agci00090_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7,8,9,10" function="st_lg_sel_agci00090_2" procedure = "st_lg_upd_agci00090_2"> 
                <input bind="grdMapping" > 
                    <input bind="cboSpecGrp_Search" /> 
                    <input bind="txtSTItemPK" /> 
                </input> 
                <output bind="grdMapping" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------->
    <gw:data id="agci00090_3" onreceive="OnDataReceive(this)" onerror="OnError(this)"> 
        <xml> 
            <dso id="4" type="process" user="comm" parameter="0" procedure = "st_lg_sel_agci00090_3"> 
                <input >
                    <input bind="cboItemGroup" />
                </input>
                <output>
                    <output bind="txtSpecGroupList" /> 
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table border="1" style="height: 100%; width: 100%" id="Table1">
        <tr style="height: 100%">
            <td style="width: 45%">
                <table style="height: 100%; width: 100%">
                    <tr style="height: 1%">
                        <td style="width: 15%" align="right">
                            <b>Group </b>
                        </td>
                        <td style="width: 84%">
                            <gw:list id="cboItemGroup" styles='width:100%' onchange="OnSearch('grdSTItem')" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="ibtnSearchGroup" img="search" alt="Search" text="Search" onclick="OnSearch('grdSTItem')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right">
                            <b>ST Item </b>
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtItem" styles='width:100%' csstype="mandatory" onenterkey="OnSearch('grdSTItem')" />
                        </td>
                    </tr>
                    <tr style="height: 48%">
                        <td colspan="3">
                            <gw:grid id='grdSTItem' header='_PK|_TCO_ITEMGRP_PK|_GRP_CD|_GRP_NM|_MODEL_NAME|_ITEMTYPE_ID|_ITEMTYPE_NAME|ST Item Code|ST Item Name|UOM|Description'
                                format='0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|1|0' editcol='0|0|0|0|0|0|0|0|0|0|0'
                                widths='1000|1000|1000|1000|1000|1000|1000|1500|3500|800|1000' sorting='T' styles='width:100%; height:100%'
                                oncellclick="OnSearch('grdMapping')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td colspan="3">
                            <table border="0">
                                <tr>
                                    <td align="right" style="width: 15%; white-space: nowrap">
                                        <b>Spec-Group</b>
                                    </td>
                                    <td style="width: 35%">
                                        <gw:list id="cboSpecGrp_Mapping" styles="width:100%;" onchange="OnSearch('grdSpec')" />
                                    </td>
                                    <td align="right" style="width: 10%">
                                        <a href="#tips" onclick="OnPopUp('1')" style="text-decoration: none;
                                            color=#0000ff" title="Click here to input Spec "><b>Spec</b></a>
                                    </td>
                                    <td style="width: 36%">
                                        <gw:textbox id="txtSpec" csstype="mandatory" styles='width:100%' onenterkey="OnSearch('grdSpec')" />
                                    </td>
                                    <td style="width: 2%">
                                        <gw:imgbtn id="ibtnSearchSpecGroup" img="search" alt="Search" text="Search" onclick="OnSearch('grdSpec')" />
                                    </td>
                                    <td style="width: 2%">
                                        <gw:imgbtn id="ibtnMapping" img="select" alt="Mapping" onclick="OnMapping()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 49%">
                        <td colspan="3">
                            <gw:grid id="grdSpec" header="_pk|Spec ID|Spec Name" format="0|0|0" aligns="0|0|0"
                                defaults="|||" editcol="0|0|0" widths="0|1500|2000" styles="width:100%; height:100%"
                                sorting="T" oncelldblclick="OnMapping()" param="0,1,2,3,4" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 55%">
                <table style="height: 100%; width: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width: 20%; white-space: nowrap">
                            <b>Spec group</b>
                        </td>
                        <td style="width: 50%; white-space: nowrap">
                            <gw:list id="cboSpecGrp_Search" styles="width:100%;" onchange="OnSearch('grdMapping')"></gw:list>
                        </td>
                        <td style="width: 20%; white-space: nowrap" align="right">
                            <gw:label id="lblRowCount" styles='width:100%'></gw:label>
                        </td>
                        <td style="width: 6%; white-space: nowrap" align="left">
                            <b>rows </b>
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:icon id="ibtnGenerate" alt="Auto Generate Item" text="Generate Item" onclick="onAutoClick()" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn id="ibtnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdMapping')" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn id="ibtnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
                        </td>
                        <td align="right" style="width: 1%">
                            <gw:imgbtn id="ibtnSave" img="save" alt="Save" text="Save" onclick="OnSave()" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="8">
                            <gw:grid id='grdMapping' header='_TCO_STITEM_PK|_Item Code|_Item Name|_UOM|_PK|SEQ|GRP NM|_TCO_SPEC_PK|Spec ID|Spec NM|Description'
                                format='0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|1|0|1|0|0|0|0|0' defaults='||||||||||'
                                editcol='0|0|0|0|0|1|0|1|1|1|1' widths='0|1500|2000|1000|0|1000|1500|0|1500|2000|2000'
                                sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!---------------------------------------------------------------------->
    <gw:textbox id="txtSTItemPK" styles='width:100%;display:none;' />
    <gw:textbox id="txtSpecGroupList" styles='width:100%;display:none;' />
    <!---------------------------------------------------------------------->
</body>
</html>
