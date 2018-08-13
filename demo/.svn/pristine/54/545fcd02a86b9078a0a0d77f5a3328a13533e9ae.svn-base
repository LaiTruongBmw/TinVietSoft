<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Maintenance History</title>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
</head>

<script type="text/javascript" language="javascript">

var p_update = 0;
var G0_PK                   = 0,
    G0_ITEM_CODE            = 1,
    G0_ITEM_NAME            = 2,
    G0_UOM                  = 3;
    
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
        
//=================================================================================
 function OnToggle()
 {
 
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand"){
        left.style.display="none";
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/right1.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="75%";
        imgArrow.src = "../../../system/images/left1.gif";
    }
 }    
//=================================================================================

function BodyInit()
{
    System.Translate(document);  // Translate to language session
    BindingDataList();
    OnSearch(grdAsset);
}
//=================================================================================
function BindingDataList()
{  
     var data="";   
     data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || ' - ' || grp_nm from tlg_it_itemgrp where del_if = 0 and use_yn='Y' and leaf_yn = 'Y' and ( SALE_YN ='Y' or PUR_YN ='Y' or PROD_YN ='Y' or SEMI_PROD_YN ='Y' or MAT_YN ='Y' or SUB_MAT_YN = 'Y'  ) order by grp_nm ") %>||";
     lstAssetGroup.SetDataText(data);   
     lstAssetGroup.value="";
}


//=================================================================================
function OnDataReceive(p_oData)
{
  switch(p_oData.id)
  {
    case 'data_fpma00040':
        lblRecord.text = (grdAsset.rows - 1) + ' record(s)';
    break;
            
    case 'data_fpma00040_1':
        lblRecord2.text = grdAssetHistory.rows - 1 + ' Record(s)';
    break;
    
  }
}
//=================================================================================
function OnPopUp(pos)
{ 
    switch(pos)
    {
        default:
        break;
    }
 
} 

//=================================================================================
function OnSearch(objGrid)
{     
    switch(objGrid.id)
    {
        case'grdAsset':
            data_fpma00040.Call("SELECT");
        break;
        case 'grdAssetHistory':
        break;
        default:        
        break;
    }   
	
}
//=================================================================================
function OnGridCellClick(objGrid)
{
    var col = event.col;
    var row = event.row;
    if(objGrid.rows > 0 )
    {
        txtAssetPK.text = objGrid.GetGridData(row,G0_PK);
    }
    if( txtAssetPK.text  == '')
    {
        return ;
    }
    data_fpma00040_1.Call('SELECT');    
}
//=================================================================================
</script>

<body>
    <!------------------------------------------------------------------------------->
    <gw:data id="data_fpma00040" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="<%=l_user%>lg_sel_fpma00040"> 
                <input bind="grdAsset" >
                    <input bind="lstAssetGroup" />
                    <input bind="txtItemSearch" />
                    <input bind="ckRevision" />  
                </input>
                <output  bind="grdAsset" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <gw:data id="data_fpma00040_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3"  type="grid" user="prod" function="<%=l_user%>lg_sel_fpma00040_1" > 
                <input>
                    <input bind="txtAssetPK" /> 
                </input> 
                <output bind="grdAssetHistory" />
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------->
    <table border="1" style="width: 100%; height: 100%">
        <tr>
            <td style="width: 30%; height: 100%" id="left">
                <table id="LeftBottomTB" style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%; white-space: nowrap;" align="right">
                            Group
                        </td>
                        <td style="width: 80%" colspan="2">
                            <gw:list id="lstAssetGroup" styles="width:100%;" onchange="OnSearch(grdAsset)" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Asset
                        </td>
                        <td style="width: 80%" colspan="2">
                            <gw:textbox id="txtItemSearch" styles='width:100%' onenterkey="OnSearch(grdAsset)" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%; white-space: nowrap;" align="right">
                            Revision
                        </td>
                        <td style="width: 79%;">
                            <gw:checkbox id="ckRevision" styles="align:left" defaultvalue="Y|N" value="Y" onchange="OnSearch(grdAsset)" />
                        </td>
                        <td style="width: 1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch(grdAsset)" />
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id='grdAsset' header='_PK|Asset|Asset Name|UOM' format='1|0|0|0' aligns='0|0|0|1'
                                defaults='|||' editcol='0|0|0|0' widths='1000|1200|2200|200' sorting='T' styles='width:100%; height:100%'
                                oncellclick='OnGridCellClick(this)' />
                        </td>
                    </tr>
                    <tr style="height: 1%" align="center">
                        <td colspan="3">
                            <gw:label img="new" id="lblRecord" styles="font-weight: bold; color:#CC0000;" text="0 record(s)" />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 70%; height: 100%" align="center" valign="top" id="right">
                <table style="width: 100%; height: 100%">
                    <tr style="width: 100%; height: 1%">
                        <td>
                            <table style="width: 100%; height: 100%">
                                <tr>
                                    <td style="width: 1%">
                                        <gw:textbox id="txtAssetPK" maxlen="100" styles='width:100%;display:none' />
                                    </td>
                                    <td style="width: 70%">
                                        &nbsp;
                                    </td>
                                    <td style="width: 26%">
                                        <gw:label img="new" id="lblRecord2" styles="font-weight: bold; color:#CC0000;" text="0 record(s)" />
                                    </td>
                                    <td style="width: 1%">
                                    </td>
                                    <td style="width: 1%">
                                        
                                    </td>
                                    <td style="width: 1%">
                                        
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="width: 100%; height: 99%">
                        <td>
                            <gw:grid id='grdAssetHistory' 
                                header='_ASSET_PK|Asset Code|Asset Name|_MA_PROCESS_PK|Process Id|Process Name|Req Date|Ma.Date'
                                format='0|0|0|0|0|0|4|4' aligns='0|0|0|0|0|0|1|1' check='|||||||' editcol='1|1|1|1|1|1|1|1'
                                widths='1000|1200|3000|1000|1200|3000|1200|1200' sorting='T' defaults='|||||||'
                                styles='width:100%; height:100%'
                                acceptnulldate="T" />
                        </td>
                    </tr>
                </table>
                
            </td>
        </tr>
    </table>
    
    <!--------------------------------------------------------->
    <img alt="expand" status="expand" id="imgArrow" src="../../../system/images/left1.gif"
        style="cursor: hand; position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!--------------------------------------------------------->
</body>
</html>
