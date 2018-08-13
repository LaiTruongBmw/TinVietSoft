<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
 
<head>
    <title>Stock Lot Closing</title>
</head>

<%  
    ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

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
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else{
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="70%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
 }

//------------------------------------------------------------

function BodyInit()
{
    System.Translate(document); 
    Stitem.style.color = "red"; 
    BindingDataList();
       
}
//------------------------------------------------------------
function BindingDataList()
{     
    var data = "<%=ESysLib.SetListDataSQL("select pk,grp_cd || ' - ' || grp_nm from tlg_it_itemgrp v where del_if = 0 and LEAF_YN ='Y' ORDER BY grp_cd")%>|ALL|Select ALL";   
    cboGroupQuery.SetDataText(data);
    cboGroupQuery.value = 'ALL' ;        
}
//-------------------------------------------------------------------------------------
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdItem':
            data_bisl00020.Call("SELECT");
        break;
        
        case 'grdLot':            
            txtItemPK.text=grdItem.GetGridData(grdItem.row,0);
            txtStyleSearch.text=grdItem.GetGridData(grdItem.row,3);
            data_bisl00020_1.Call("SELECT");                    
        break;     
    }
}
//--------------------------------------------------------------------------------------
function OnChangeTab()
 {
    var strRad = radStyleSearch.GetData();
             
	switch (strRad)
	{
		case '2':
		    Stitem.style.color = "red"; 
		    Item.style.color = "";  
        break;
        
        case '1':
		    Stitem.style.color = ""; 
		    Item.style.color = "red";   		    
        break;      
    } 
 }
//-------------------------------------------------------------------------------------
function OnClose()
{
    if(grdLot.row >=1)
    {
         if (!confirm('Are you sure want to close ?'))
            {
               return;
            }              
        data_bisl00020_1.Call();
    }
    else
    {
        alert("Don't have any lot to close !!");
     }
}
//-------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
   
}
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_bisl00020" onreceive="OnDataReceive()"> 
        <xml> 
            <dso id="1" type="grid" parameter="0,1,2,3" function="INV.sp_sel_bisl00020" > 
                <input>
                    <input bind="cboGroupQuery" /> 
                    <input bind="txtItemQuery" /> 
                    <input bind="chkActiveQuery" />
                    <input bind="radStyleSearch"   />                  
                </input> 
                <output bind="grdItem" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_bisl00020_1">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13" function="inv.sp_sel_bisl00020_1" procedure="inv.sp_upd_bisl00020_1" >
                <input bind="grdLot" > 
                    <input bind="txtItemPK" />
                    <input bind="txtStyleSearch" />
                </input>
                <output bind="grdLot" />
            </dso>
        </xml>
    </gw:data>
    <!---------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr style="height: 100%">
            <td style="width: 30%" id="left">
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td>
                        </td>
                        <td colspan="2">
                            &nbsp;
                            <gw:radio id="radStyleSearch" value="2" styles="width:100%" onchange="OnSearch('grdItem'),OnChangeTab()"> 
                                <span value="2" id="Stitem">Stitem</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <span value="1" id="Item">Item</span> 
                            </gw:radio>
                        </td>
                    </tr>
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
                            <gw:grid id='grdItem' header='_PK|Item Code|Item Name|_Style_Search' format='0|0|0'
                                aligns='0|0|0' defaults='||' editcol='1|1|1' widths='0|1800|1000' sorting='T'
                                styles='width:100%; height:100%' oncellclick="OnSearch('grdLot')" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 70%" align="center" id="right">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width: 3%">
                        </td>
                        <td style="width: 15%">
                        </td>
                        <td style="width: 15%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 5%">
                           <gw:icon id="icoClose" text="Close" onclick="OnClose()" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="7">
                            <gw:grid id='grdLot' header='_PK|Close Y/N|Lot No|Lot Date|End Balance|Expire Day|Partner Name|Ware House|ATT01|ATT02|ATT03|ATT04|ATT05'
                                format='0|3|0|0|0|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|0|0' defaults='|||||||||||||'
                                editcol='1|1|1|1|1|1|1|1|1|1|1|1|1' widths='0|1000|1300|1200|1200|1200|1400|1400|1000|1000|1000|1000|1000'
                                sorting='T' styles='width:100%; height:100%' />
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
<gw:textbox id="txtStyleSearch" text="" style="display: none" />
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
<img status="expand" id="imgArrow" src="../../../system/images/prev_orange.gif" style="cursor: hand;
    position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
<!--------------------------------------------------------->
</html>
