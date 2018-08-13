<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head>
    <title>ITEM ENTRY (UNIQUE SPEC)</title>
</head>

<script type="text/javascript" language="javascript">

var flag;

var G1_PK  = 0,
    G1_GROUP_PK = 3; 

var G2_tco_item_pk          = 0,
    G2_tco_stitem_pk        = 1,
    G2_tco_itemgrp_pk       = 2, 
    G2_item_code            = 3,
    G2_item_nm              = 4,
    G2_uom                  = 5,
    G2_spec1_id             = 6,
    G2_spec1_nm             = 7,
    G2_spec2_id             = 8,
    G2_spec2_nm             = 9,
    G2_spec3_id             = 10,
    G2_spec3_nm             = 11,
    G2_spec4_id             = 12,
    G2_spec4_nm             = 13,
    G2_spec5_id             = 14,
    G2_spec5_nm             = 15;
    
//------------------------------------------------------------
 function OnToggle()
{ 
    var left  = document.all("left");    
    var right = document.all("right");
    var imgArrow  = document.all("imgArrow");  
    
    if ( imgArrow.status == "expand" )
    {
        left.style.display     = "none";
        right.style.display    = "";                              
                
        imgArrow.status = "collapse";  
        imgArrow.src = "../../../../system/images/next_orange.gif";                              
    }
    else 
    {
        left.style.display     = "";
        right.style.display    = "";
        
        imgArrow.status = "expand";
        imgArrow.src = "../../../../system/images/prev_orange.gif";
    }
}
//------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);  // Translate to language session
    //----------------------------
   // grdItem.GetGridControl().FrozenCols() = 3
    BindingDataList();    
}
//------------------------------------------------------------
function BindingDataList()
{     
    var data = "<%=CtlLib.SetListDataSQL("select pk,grp_cd || ' - ' || grp_nm from tlg_it_itemgrp v where del_if = 0 and LEAF_YN ='Y' ORDER BY grp_cd")%>||Select ALL";   
    cboGroupQuery.SetDataText(data);
    cboGroupQuery.value = '' ; 
}


//-------------------------------------------------------------------------------------
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSTitem':
            data_agci00200.Call("SELECT");
        break;
        
        case 'grdItem':
            data_agci00200_1.Call("SELECT");
        break;        
    }
}
function OnSTItemSelect()
{
      txtSTItemPK.text = grdSTitem.GetGridData(grdSTitem.row,G1_PK)
      txtItemGrpPK.text = grdSTitem.GetGridData(grdSTitem.row,G1_GROUP_PK)
      OnSearch('grdItem')
}
//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_agci00200_1":        
           lblRecord.text = (grdItem.rows -1) + " record(s)."
        break;         
    }
}
 
//==============================================================================================

function OnAddNew()
{
    if(txtSTItemPK.text != "")
    {
      grdItem.AddRow()
    }else
    {
        alert("Please, select one ST item first!")
    }
}  

//==============================================================================================

function Validate()
{   
    if ( txtUOM.text == '' )
    {
        alert('Pls Select UOM first !!!');
        return false;
    }
    //----------------
    return true;
}

//==============================================================================================
function OnSave()
{    
    flag = 'save'    
    for(var i=0; i < grdItem.rows;i++)
    {
        if ( grdItem.GetGridData(i, G2_tco_item_pk) == '' )
        {
            grdItem.SetGridText(i, G2_tco_stitem_pk, txtSTItemPK.text);
            grdItem.SetGridText(i, G2_tco_itemgrp_pk, txtItemGrpPK.text);
        }    
    }
    data_agci00200_1.Call()
        
}
//==============================================================================================

function OnProcess(pos)
{
    switch(pos)
    {
        case 'ProcessData':
            if ( txtSTItemPK.text > 0 )
            {
                if ( confirm('Do you want to apply changes to all item?'))
                {
                    pro_agci00200.Call();                
                }    
            } 
            else
            {
                alert('Pls Select ST Item.');
            }           
        break;
    }
}

//==============================================================================================

 function OnDelete()
 {        
   
    if( confirm('Do you want to delete this Spec ?'))
    {   
        grdItem.DeleteRow();   
    }            
   
}
//==============================================================================================

 function OnUnDelete()
 {        
   
    if( confirm('Do you want to delete this Spec ?'))
    {   
        grdItem.UnDeleteRow();   
    }            
   
}
//==============================================================================================
 
function OnUnDelete()
{              
     grdItem.UnDeleteRow();
}

//==============================================================================================

var gPreviousRow = -1 ;
//-------------------------------------------------------------------------------------------------
function OnGridAfterEdit(oGrid)
{
      switch (oGrid.id)         
      {		        
            case "grdItem" :
                if ( event.col == G2_Spec_ID || event.col == G2_Spec_Name )
                {
                    gPreviousRow = event.row ;
                    
                    txtSpecGroupPK_Search.text      = oGrid.GetGridData(gPreviousRow, G2_TCO_SPECGRP_PK );
                    txtItemGroupPK_Search.text      = oGrid.GetGridData(gPreviousRow, G2_TCO_ITEMGRP_PK );
                    txtSpecID_Search.text           = oGrid.GetGridData(gPreviousRow, G2_Spec_ID        );
                    txtSpecName_Search.text         = oGrid.GetGridData(gPreviousRow, G2_Spec_Name      );
                           
                    data_agci00200_3.Call('SELECT');
                }
            break;
      }      
}
 
//==============================================================================================

</script>

<body>    
    <!------------------------------------------------------------------>
    <gw:data id="data_agci00200" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1" function="st_lg_sel_agci00200" > 
                <input>
                    <input bind="cboGroupQuery" /> 
                    <input bind="txtSTitemQuery" /> 
                    <input bind="chkActiveQuery" />                     
                </input> 
                <output bind="grdSTitem" /> 
            </dso> 
        </xml> 
    </gw:data>   
    <!---------------------------------------------------------------------->
    <gw:data id="data_agci00200_1" onreceive="OnDataReceive(this)"> 
        <xml> 
           <dso id="1" type="grid" user="comm" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15"  function="st_lg_sel_agci00200_1"  procedure="st_lg_upd_agci00200_1"> 
              <input  bind="grdItem">
                    <input bind="txtSTItemPK" /> 
                    <input bind="txtItemQuery" /> 
                </input> 
                <output bind="grdItem" />   
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
                            <gw:list id="cboGroupQuery" styles="width:100%" onchange="OnSearch('grdSTitem')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            ST Item</td>
                        <td style="width: 80%" colspan="2">
                            <gw:textbox id="txtSTitemQuery" styles="width:100%" onenterkey="OnSearch('grdSTitem')" />
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
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch('grdSTitem')" />
                        </td>
                    </tr>
                    <tr style="height: 97%">
                        <td colspan="3">
                            <gw:grid id="grdSTitem" header="_PK|Code|Name|_tco_itemgrp_pk" format="0|0|0|0" aligns="0|0|0|0" defaults="|||"
                                editcol="0|0|0|0" widths="0|1500|1200|0" styles="width:100%; height:100%" sorting="T"
                                param="0,1,2,3" oncellclick="OnSTItemSelect()" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 70%" align="center" id="right">
                <table style="height: 100%; width: 100%">
                     <tr>                        
                         <td style="width: 15%" align="right">
                            Item</td>
                        <td style="width: 50%" >
                            <gw:textbox id="txtItemQuery" styles="width:100%" onenterkey="OnSearch('grdItem')" />
                        </td>
                        <td style="width: 1%">
                             <gw:imgbtn id="btnSearch1" img="search" alt="Search" text="Search" onclick="OnSearch('grdItem')" />
                         </td>
                         <td style="width: 25%">
                            <gw:label id="lblRecord" styles='width:100%;color:cc0000;font:9pt;align:left' text='record(s)' />
                         </td>
                         <td style="width: 1%">
                             <gw:imgbtn id="btnNew" img="new" alt="New" text="New" onclick="OnAddNew()" />
                         </td>
                         <td style="width: 1%">
                             <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
                         </td>
                         <td style="width: 1%">
                             <gw:imgbtn id="btnUnDelete" img="udelete" alt="Un Delete" onclick="OnUnDelete()" />
                         </td>
                         <td style="width: 1%">
                             <gw:imgbtn id="btnUpdate" img="save" alt="Save" text="Save" onclick="OnSave()" />
                         </td>
                     </tr>
                     <tr style="height: 100%">
                         <td colspan="8">
                             <gw:grid id='grdItem'
                                header='_PK|_TCO_STITEM_PK|_TCO_ITEMGRP_PK|Item Code|Item Name|UOM|Spec Id|Spec Nm|Spec Id|Spec Nm|Spec Id|Spec Nm|Spec Id|Spec Nm|Spec Id|Spec Nm'
                                format='0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0'
                                aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                check='|||||||||||||||'
                                editcol='0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1'
                                widths='0|0|0|1500|2000|800|1500|2000|1500|2000|1500|2000|1500|2000|1500|2000'
                                sorting='T'
                                styles='width:100%; height:100%'
                                />
                         </td>
                     </tr>
                 </table>
            </td>
        </tr>
    </table>
</body>
<!--------------------------------------------------------------------------->
<gw:textbox id="txtSTItemPK" text="" style="display: none" />
<gw:textbox id="txtItemGrpPK" text="" style="display: none" />

<!--------------------------------------------------------->
<img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;
    position: absolute; left: 1; top: 0;" onclick="OnToggle()" /> 
<!--------------------------------------------------------->
</html>
