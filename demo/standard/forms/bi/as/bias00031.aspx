<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Income Return Entry</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var G_ST_OUTGO_RETURN_D_PK   = 0,
    G_ST_OUTGO_RETURN_M_PK   = 1,
    G_SEQ                    = 2,
    G_REF_NO                 = 3,
    G_NULL_01           	 = 4,
    G_NULL_02              	 = 5,
    G_NULL_03              	 = 6,
    G_RETURN_ITEM_PK         = 7,
    G_RETURN_ITEM_CODE       = 8,
    G_RETURN_ITEM_NAME       = 9,    
    G_NULL_04                = 10,
    G_NULL_05                = 11,
    G_RETURN_QTY             = 12,
    G_RETURN_UOM             = 13,
    G_LOT_NO                 = 14,
    G_NULL_06                = 15,
    G_NULL_07                = 16, 
    G_REMARK                 = 17;

//====================================================================================
function BodyInit()
{
    System.Translate(document); 
    txtSlipNo.SetEnable(false);
    txtChargerName.SetEnable(false);
    txtPLName.SetEnable(false);
    
    SetGridFormat();
    BindingDataList();
    
    txtMasterPK.text = "<%=Request.querystring("trans_pk")%>";  
	
	p_type = "<%=Request.querystring("type")%>";  
	
	if ( p_type == 'APPROVE' )
	{ 
		btnCancel.style.display = "none";
	}
	else
	{
		btnApprove.style.display = "none";
	}
	
    OnSearch('Master');
     
 }
//====================================================================================

function BindingDataList()
{
    
    var data="";

    data = "<%=CtlLib.SetListDataSQL(" SELECT   a.pk, a.line_id || ' - ' || a.line_name FROM tlg_pb_line a WHERE a.del_if = 0 ORDER BY a.line_id ")%>";     
    lstLine.SetDataText(data); 
            
    data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_name  FROM tlg_in_warehouse  WHERE del_if = 0  ORDER BY wh_name  ASC" )%>||";       
    lstReWH.SetDataText(data); 
}
//====================================================================================
 function SetGridFormat()
 {
    var ctrl = grdDetail.GetGridControl(); 
         
    ctrl.ColFormat(G_RETURN_QTY) = "#,###,###,###,###,###.##";
 }
//======================================================== 
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
            data_bias00031.Call('SELECT');
        break;
        
        case 'Master':
            data_bias00031_1.Call('SELECT');
        break;
    }
}
//====================================================================================
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "data_bias00031_1":   
               data_bias00031_2.Call('SELECT');
        break;  
        //----------------------
        case "data_bias00031_2":   
            if(grdDetail.rows > 1)
            {
                grdDetail.SetCellBold( 1, G_RETURN_ITEM_CODE , grdDetail.rows - 1, G_RETURN_ITEM_CODE ,  true);
   
                grdDetail.SetCellBold( 1, G_RETURN_QTY, grdDetail.rows - 1, G_RETURN_QTY,  true);                                        
            }
        break;               
        //----------------------
        case "pro_bias00031":
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();
        break; 
		//----------------------
        case "pro_bias00031_1":
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();
        break;         
    }
} 
//====================================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Approve' :
            if ( confirm('Do you want to approve this Slip?'))
            {
                pro_bias00031.Call();
            }               
        break;
		
		case 'Cancel' :
			if ( confirm('Do you want to cancel this Slip?'))
            {
                pro_bias00031_1.Call();
            } 
		break;
    }
}
//=================
</script>

<body>
    <!------------------------------------------------------------------------->
    <gw:data id="data_bias00031_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="st_lg_sel_bias00031_1"  procedure="st_lg_upd_bias00031_1"> 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="lstReWH" />
                     <inout  bind="dtReDate" />  
                     <inout  bind="txtRefNo" />                         
                     <inout  bind="txtChargerPK" />
                     <inout  bind="txtChargerName" />
                     <inout  bind="txtRemark" />
                     <inout  bind="lstLine" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="txtPLPK" />
                     <inout  bind="txtPLName" />
                     <inout  bind="lblStatus" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <gw:data id="data_bias00031_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="st_lg_sel_bias00031_2" procedure="st_lg_upd_bias00031_2"> 
                <input> 
                    <input bind="txtMasterPK" />                
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bias00031" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bias00030" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
	<!---------------------------------------------------------------->
    <gw:data id="pro_bias00031_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bias00030_1" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="1">
        <tr>
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
                        <td style="width: 100%" colspan="6" align="center"><gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='' />
                        </td>
                   
                        <td>
                            <gw:button id="btnApprove" img="approve" text="Approve" onclick="OnProcess('Approve')" />
							<gw:button id="btnCancel" img="cancel" text="Cancel" onclick="OnProcess('Cancel')" />
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
                        <td colspan="6">
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
                            Line
                        </td>
                        <td colspan="6">
                            <gw:list id="lstLine" styles='width:100%' csstype="mandatory" />
                        </td>
                    </tr>
                    <tr style="height: 1%">
                        <td style="white-space: nowrap">
                            Remark
                        </td>
                        <td colspan="3">
                            <gw:textbox id="txtRemark" styles="width:100%;" />
                        </td>
                        <td align="right">
                            P/L
                        </td>
                        <td colspan="6">
                            <gw:textbox id="txtPLPK" styles="display:none" />
                            <gw:textbox id="txtPLName" styles="width:100%" />
                        </td>
                    </tr>                    
                    <tr style="height: 95%">
                        <td colspan="11">
                             <gw:grid id='grdDetail' 
							 	header='_d_pk|_m_pk|Seq|Ref No|_null_01|_null_02|_null_03|_req_return_pk|Item Code|Item Name|_null_04|_null_05|Return Qty|UOM|Lot No|_null_06|_null_07|Remark'
                                format='0|0|0|0|0|0|0|0|0|0|1|0|1|0|0|0|0|0' 
								aligns='0|0|1|0|0|0|0|0|0|0|0|1|0|1|0|0|0|0'
                                check='|||||||||||||||||' 
								editcol='0|0|0|0|0|0|0|0|0|0|1|0|1|0|1|1|1|1' 
								widths='0|0|500|1500|0|0|0|0|1500|3500|0|0|1500|800|1500|1000|1000|1000'
                                sorting='T' styles='width:100%; height:100%'                                 
                                />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="display:none"></gw:textbox>
    <!------------------------------------------------------------------->
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
    <!------------------------------------------------------------------->
</body>
</html>
