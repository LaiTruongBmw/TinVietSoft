<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Outgo Return Request</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
var G2_PK                           = 0,
    G2_ST_OUTGO_RETURN_REQ_M_PK     = 1,
    G2_SEQ                          = 2,
    G2_REF_NO                       = 3,
    G2_REQ_ITEM_PK                  = 4,
    G2_ITEM_CODE                    = 5,
    G2_ITEM_NAME                    = 6,
    G2_REQ_QTY                      = 7,
    G2_REQ_UOM                      = 8,
    G2_LOT_NO                       = 9,
    G2_DESCRIPTION                  = 10;
   
var user_name = "<%=Session("USER_NAME")%>"   ;
var user_pk   = "<%=Session("EMPLOYEE_PK")%>" ;
var comp_pk   = "<%=Session("COMPANY_PK") %>" ;
var arr_FormatNumber = new Array();  
var flag ;
//====================================================================================
function BodyInit()
{
    System.Translate(document); 
    txtSlipNo.SetEnable(false);
    txtChargerName.SetEnable(false);
    txtPartnerName.SetEnable(false);
    txtPLName.SetEnable(false);
    
    SetGridFormat();
    BindingDataList();
    lstWH.value = "";
    
    OnSearch("grdSearch");
 }
//====================================================================================

function BindingDataList()
{
    var ldate;    
    ldate=dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value=ldate ;
    
    var data="";
        
    data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_name  FROM tlg_in_warehouse  WHERE del_if = 0  ORDER BY wh_name  ASC" )%>||";    
    lstWH.SetDataText(data);       
    lstReWH.SetDataText(data); 
}
//====================================================================================
 function SetGridFormat()
 {
    var ctrl = grdDetail.GetGridControl(); 
    
    ctrl.ColFormat(G2_REQ_QTY) = "#,###,###,###,###,###.##";    
    arr_FormatNumber[G2_REQ_QTY]   = 2;
 }
//====================================================================================

function OnToggle()
{
    var left = document.all("left"); 
    var right = document.all("right"); 
    var imgArrow = document.all("img1"); 

    if(imgArrow.status == "expand")
    {
        left.style.display="none";
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../../system/images/button/next.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="80%";
        imgArrow.src = "../../../../system/images/button/previous.gif";
    }
}
//==================================================================================== 
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_bias00061.Call('SELECT');
        break;
        //------------------
        case 'Master':
            txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, 0 );
            data_bias00061_1.Call('SELECT');
        break;
    }
}
//====================================================================================

function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_bias00061_1":   
            if(flag == "save")
            { 
                for(var i=1; i < grdDetail.rows;i++)
                {
                        if ( grdDetail.GetGridData( i, G2_PK) == '' )
                        {
                            grdDetail.SetGridText( i, G2_PK, txtMasterPK.text);
                        } 
                }
                    data_bias00061_2.Call();
            }
            else
            {
               data_bias00061_2.Call('SELECT');
            }
        break;  
        //----------------------
        case "data_bias00061_2":   
            if(grdDetail.rows > 1)
            {
                grdDetail.SetCellBold( 1, G2_ITEM_CODE, grdDetail.rows - 1, G2_ITEM_CODE,  true);
                grdDetail.SetCellBold( 1, G2_REQ_QTY, grdDetail.rows - 1, G2_REQ_QTY,  true);
            }
        break;           
    }
}
 
//====================================================================================
function OnSelect(pos)
{
    var arr_data = new Array();
    
    switch (pos)
    {
        case 'Partial' :
            // the last row is sub total --> no need to select 
            for(var i = 1; i < grdDetail.rows; i++ )
            {
                if ( grdDetail.GetGridControl().isSelected(i) == true )
                {
                     var arrTemp = new Array();
                         
                     for( var j = 0; j < grdDetail.cols; j++ )
                     {
                          arrTemp[arrTemp.length]= grdDetail.GetGridData(i,j);
                     }
                         
                     arr_data[arr_data.length]= arrTemp;
                }
            }
        break;
        
        case 'ALL' :
            var arr_data = new Array();
            // the last row is sub total --> no need to select 
            for(var i = 1; i < grdDetail.rows; i++ )
            {
                 var arrTemp = new Array();
                     
                 for( var j = 0; j < grdDetail.cols; j++ ) 
                 {
                      arrTemp[arrTemp.length]= grdDetail.GetGridData(i,j);
                 }
                     
                 arr_data[arr_data.length]= arrTemp;
            }            
        break;        
    }
              
    window.returnValue =  arr_data;
    window.close();
            
}
//====================================================================================

</script>

<body>
    <!------------------------------------------------------------------->
    <gw:data id="data_bias00061" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" function="sale.lg_sel_bias00061" > 
                <input>                     
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
                    <input bind="txtVoucherSearch" />
                    <input bind="lstWh" />
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------->
    <gw:data id="data_bias00061_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11" function="sale.lg_sel_bias00061_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="lstReWH" />
                     <inout  bind="dtReDate" />  
                     <inout  bind="txtRefNo" />                         
                     <inout  bind="txtChargerPK" />
                     <inout  bind="txtChargerName" />
                     <inout  bind="txtRemark" />
                     <inout  bind="txtPartnerPK" />
                     <inout  bind="txtPartnerName" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="txtPLPK" />
                     <inout  bind="txtPLName" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="data_bias00061_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10" function="sale.lg_sel_bias00061_2"> 
                <input> 
                    <input bind="txtMasterPK" />                
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 25%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 30%" align="right">
                            Date
                        </td>
                        <td style="width: 69%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~<gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td style="width: 1%">
                            <gw:button img="search" alt="Search" onclick="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            W/H
                        </td>
                        <td style="width: 95%" colspan="2">
                            <gw:list id="lstWH" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 30%; white-space: nowrap" align="right">
                            Slip No
                        </td>
                        <td colspan="2">
                            <gw:textbox id="txtVoucherSearch" styles="width:100%" onenterkey="OnSearch('grdSearch')" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|Return Date|Ref No" format="0|4|0" aligns="1|0|0"
                                defaults="||" editcol="0|0|0" widths="0|1500|0" styles="width:100%; height:100%"
                                sorting="T" oncellclick="OnSearch('Master')" param="0,1,2" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 75%">
                <table style="width: 100%; height: 100%" border="0">
                    <tr style="height: 1%">
                        <td style="width: 5%" align="right">
                            Slip No
                        </td>
                        <td style="width: 25%">
                            <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" />
                        </td>
                        <td style="width: 2%">
                            Date
                        </td>
                        <td>
                            <gw:datebox id="dtReDate" lang="1" />
                        </td>
                        <td style="width: 100%" colspan="2" align="center">
                            <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='' />
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                        <td style="width: 1%">
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right">
                            Ref No
                        </td>
                        <td style="width: 40%" colspan="3">
                            <gw:textbox id="txtRefNo" csstype="mandatory" styles="width:100%;" />
                        </td>
                        <td style="width: 5%" align="right">
                            Charger
                        </td>
                        <td colspan="5">
                            <gw:textbox id="txtChargerName" styles="width:100%" />
                            <gw:textbox id="txtChargerPK" styles="display:none" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td align="right">
                            W/H
                        </td>
                        <td colspan="3">
                            <gw:list id="lstReWH" styles='width:100%' csstype="mandatory" />
                        </td>
                        <td align="right">
                            Partner
                        </td>
                        <td colspan="5">
                            <gw:textbox id="txtPartnerName" styles="width:100%" />
                            <gw:textbox id="txtPartnerPK" styles="display:none" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="white-space: nowrap">
                            Description
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
                        <td align="right">
                            P/L
                        </td>
                        <td colspan="5">
                            <gw:textbox id="txtPLPK" styles="display:none" />
                            <gw:textbox id="txtPLName" styles="width:100%" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="width: 10%" align="left" colspan="5">
                            <img status="expand" id="img1" src="../../../../system/images/button/previous.gif" style="cursor: hand"
                                onclick="OnToggle()" />
                        </td>
                        <td style="width: 1%" align="right" colspan="3">
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSelect" img="Select" text="Select" onclick="OnSelect('Partial')" />
                        </td>
                        <td style="width: 1%">
                            <gw:button id="btnSelectALL" img="Select All" text="Select ALL" onclick="OnSelect('ALL')" />
                        </td>
                    </tr>
                    <tr style="height: 95%">
                        <td colspan="10">
                            <gw:grid id='grdDetail' header='_pk|_st_outgo_return_req_m_pk|Seq|Ref No|_req_item_pk|Item Code|Item Name|Req Qty|Req Uom|Lot No|Description'
                                format='0|0|0|0|0|0|0|1|2|0|0' aligns='0|0|1|0|0|0|0|0|1|0|0' editcol='0|0|0|0|0|0|0|0|0|0|0'
                                widths='0|0|500|1000|0|1200|2500|1000|1000|1000|1200' sorting='T' styles='width:100%; height:100%' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="display:none"></gw:textbox>
    <!------------------------------------------------------------------->
    <!------------------------------------------------------------------->
</body>
</html>
