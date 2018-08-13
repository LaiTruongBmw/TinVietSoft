<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
 
<head>
    <title>Lot # Entry</title>
</head>

<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script type="text/javascript" language="javascript">

var flag;

var G2_tin_lotno_pk         = 0,
    G2_rec                  = 1,
    G2_pallet               = 2, 
    G2_so_item_no           = 3,
    G2_lotno                = 4,
    G2_take_in              = 5,
    G2_etd                  = 6,
    G2_tco_item_pk          = 7,
    G2_item_id              = 8,
    G2_item_nm              = 9,
    G2_uom                  = 10,
    G2_partner_id           = 11,
    G2_partner_name         = 12,
    G2_prod_type            = 13,
    G2_close_yn             = 14;
//------------------------------------------------------------
function BodyInit()
{
    System.Translate(document); 
    BindingDataList();
}
//------------------------------------------------------------
function BindingDataList()
{     
    var data = "<%=ESysLib.SetListDataSQL("select pk,grp_cd || ' - ' || grp_nm from tlg_it_itemgrp v where del_if = 0 and LEAF_YN ='Y' ORDER BY grp_cd")%>||Select ALL";   
    cboGroupQuery.SetDataText(data);
    cboGroupQuery.value = '' ;        
}

//-------------------------------------------------------------------------------------
function OnSearch(pos)
{
   
    data_bisl00060.Call("SELECT");                    
    
}
//--------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_bisl00060":
            if(grdLot.rows - 1>0)
            {
               grdLot.SetCellBgColor( 1, G2_rec , grdLot.rows - 1, G2_pallet , 0xCCFFFF ); 
               grdLot.SetCellBgColor( 1, G2_prod_type  , grdLot.rows - 1, G2_close_yn  , 0xCCFFFF ); 
            }
            lblRecord.text = grdLot.rows -1 + " record(s)."
        break;
       
    }
}

//-----------------------------------------------------------------------

function OnAddNew()
{
   if(txtItemPK.text=="")
   {
        alert("please Select Item !");
   }
   else
   {
        grdLot.AddRow();
        grdLot.SetGridText(grdLot.rows-1,4,txtItemPK.text)
        grdLot.SetCellBgColor( 1, 1 , grdLot.rows - 1, 1 , 0xCCFFFF );
   }
    
    flag="view"; 
}  

//-------------------------------------------------------------------------------------

function OnSave(pos)
{    
    
      data_bisl00060.Call();
}

//------------------------------------------------------------------------------------------------

 function OnDelete()
{
    if( grdLot.row >= 1 )
    { 
        if ( grdLot.GetGridData( grdLot.row,0 ) == '' ) 
        {
            grdLot.RemoveRow();
        }
        else
        {
            grdLot.DeleteRow();
        }  
    }
}
//------------------------------------------------------------------------------------- 
 
function OnUnDelete()
{              
     grdSpec.UnDeleteRow();
}

//---------------------------------------------------------
var gPreviousRow = -1 ;


//----------------------------------------------------------
    
</script>

<body>  
    <!---------------------------------------------------------------------->
    <gw:data id="data_bisl00060" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid"  function="INV.sp_sel_bisl00060" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14" procedure="INV.sp_upd_bisl00060" >
                <input bind="grdLot" > 
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="txtPartner" />
                    <input bind="cboGroupQuery" />
                    <input bind="txtItemQuery" />
                    <input bind="txtLot" />
                    <input bind="chkClose" />
                </input>
                <output bind="grdLot" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------->
    <table  style="width: 100%; height: 100%">
           <tr style="height: 5%">     
                 <td style="width: 10%" align="left">                
                    In Date
                 </td>
                <td style="width: 20%" style="white-space:nowrap" >
                    <gw:datebox id="dtFrom" styles="width:100%" lang="<%=Session("Lang")%>" />
                    &nbsp; ~&nbsp;
                    <gw:datebox id="dtTo" styles="width:100%" lang="<%=Session("Lang")%>" />
                </td>
                 <td style="width: 10%" align="right">
                    Partner</td>
                <td style="width: 25%" colspan="2">
                    <gw:textbox id="txtPartner" styles="width:100%" onenterkey="OnSearch()" />
                </td>      
               

                 <td style="width: 10%" align="right">
                    Colse YN</td>
                <td style="width: 20%">
                    <gw:checkbox id="chkClose" styles="align:left" defaultvalue="Y|N" value="N"
                        onchange="" />
                </td>
                <td colspan="3">
                </td>
                <td style="width: 1%"  align="right">
                    <gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
                </td>
            </tr>
            <tr style="height: 5%">
                 <td style="width: 10%" align="right">
                    Group</td>
                <td style="width: 20%" >
                    <gw:list id="cboGroupQuery" styles="width:100%" onchange="OnSearch()" />
                </td>

                 <td style="width: 10%" align="right">
                    Item</td>
                <td style="width: 25%" colspan="2">
                    <gw:textbox id="txtItemQuery" styles="width:100%" onenterkey="OnSearch()" />
                </td>
                  <td style="width: 10%" align="right">
                    Lot No</td>
                <td style="width: 20%" colspan="5">
                    <gw:textbox id="txtLot" styles="width:100%" onenterkey="OnSearch()" />
                </td>
                
            </tr>
           <tr>
                <td colspan="6" > </td>
                <td>
                        <gw:label id="lblRecord" styles='width:100%;color:cc0000;font:9pt;align:left' text='' />
             
                </td>
                <td style="width: 1%">
                    
                </td>
                <td style="width: 1%">
                    <gw:imgbtn id="btnDelete" img="delete" alt="Delete" text="Delete" onclick="OnDelete()" />
                </td>
                <td style="width: 1%">
                    <gw:imgbtn id="btnUpdate" img="save" alt="Save" text="Save" onclick="OnSave()" />
                </td>
                <td style="width: 1%">
                    <gw:imgbtn id="btnSubUndelete" img="udelete" alt="Undelete" onclick="OnUndelete()" />
                </td>
           </tr>
            <tr style="height: 90%">
                <td colspan="12">
                       <gw:grid id='grdLot'
                        header='_PK|REC|PALLET|SO ITEM NO|LOT NO|TakeIn DATE|ETD|_TCO_ITEM_PK|Item ID|Item Name|UOM|Partner ID|Partner Name|Prod Type|Close YN'
                        format='0|0|0|0|0|4|4|0|0|0|0|0|0|0|3'
                        aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                        check='||||||||||||||'
                        editcol='0|1|1|0|0|1|1|0|0|0|0|0|0|1|1'
                        widths='0|1500|1500|1500|1500|1200|1200|0|1500|2500|800|1500|2000|1500|1000'
                        sorting='T'
                        autosize='T' 
                        styles='width:100%; height:100%'
                        />
                </td>
           </tr>
    </table>
</body>
<!--------------------------------------------------------------------------->
<gw:textbox id="txtMasterPK" text="" style="display: none" />
<gw:textbox id="txtItemPK" text="" style="display: none" />
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
</html>
