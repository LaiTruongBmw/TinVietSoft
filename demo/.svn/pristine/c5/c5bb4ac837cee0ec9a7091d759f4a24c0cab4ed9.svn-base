<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Stock Transfer</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

//-----------------------------------------------------

//=================================================================================
var G1_DETAIL_PK        = 0,
    G1_Seq              = 1,
    G1_Ref_No           = 2,
    G1_REQ_ITEM_PK      = 3,
    G1_Req_Item_Code    = 4,
    G1_Req_Item_Name    = 5,
    G1_TRANS_ITEM_PK    = 6,
    G1_TRANS_ITEM_CODE  = 7,
    G1_TRANS_ITEM_NAME  = 8,
    G1_Req_Qty          = 9,
    G1_Req_UOM          = 10,
    G1_TRANS_QTY        = 11,
    G1_TRANS_UOM        = 12,
    G1_UP               = 13,
    G1_Amount           = 14,
    G1_VAT_Rate         = 15,
    G1_VAT_Amount       = 16,
    G1_Total_Amount     = 17,
    G1_Lot_No           = 18,
    G1_NULL_01          = 19,
    G1_Description      = 20,
    G1_MASTER_PK        = 21,
    G1_NULL_02          = 22,
    G1_NULL_03          = 23;
    
 //===============================================================================================
function BodyInit()
 {
    System.Translate(document);  // Translate to language session    

    txtSlipNo.SetEnable(false);
    txtChargerName.SetEnable(false);
    txtOUT_PLName.SetEnable(false);
    txtIN_PLName.SetEnable(false);    
   
    //----------------------------    
    BindingDataList();    
    //----------------------------         
    SetGridFormat();   

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
	
    OnSearch('grdMaster');
 }
 //==================================================================================
 
 function BindingDataList()
 { 
     var data = ""; 
     //-----------------------      
     data = "<%=CtlLib.SetListDataSQL("SELECT pk,wh_name  FROM tlg_in_warehouse  WHERE del_if = 0  ORDER BY wh_name  ASC" )%>";    
     lstOutWH.SetDataText(data); 
     lstInWH.SetDataText(data);      
     //--------------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT lg_f_logistic_code('LGCM0100') FROM DUAL" )%>";    
     lstCurrency.SetDataText(data);                
 }
//=============================================================================================
 function SetGridFormat()
 {
    var ctr = grdDetail.GetGridControl(); 
    
    ctr.ColFormat(G1_Req_Qty)   = "#,###,###,###,###,###.###";
    ctr.ColFormat(G1_TRANS_QTY) = "#,###,###,###,###,###.###";
    ctr.ColFormat(G1_UP)        = "#,###,###,###,###,###";
    ctr.ColFormat(G1_Amount)    = "#,###,###,###,###,###";
    ctr.ColFormat(G1_VAT_Rate)     = "#,###,###,###,###,###";
    ctr.ColFormat(G1_VAT_Amount)   = "#,###,###,###,###,###";
    ctr.ColFormat(G1_Total_Amount) = "#,###,###,###,###,###";
     
 }

//=============================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdMaster':
            data_bias00021_1.Call("SELECT");                         
        break;
        
        case 'grdDetail':            
            data_bias00021_2.Call("SELECT");
        break;
    }
}
//=============================================================================================
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "pro_bias00021":
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();
        break;
		
		case "pro_bias00021_1":
            alert(txtReturnValue.text);
            window.returnValue = 1; 
            this.close();
        break;
            
        case "data_bias00021_1": 
 
            //---------------------------- 
            OnSearch('grdDetail');   
                            
        break;

        case "data_bias00021_2":
           
            if ( grdDetail.rows > 1 )
            {
	            grdDetail.SetCellBold( 1, G1_TRANS_ITEM_CODE, grdDetail.rows - 1, G1_TRANS_ITEM_CODE,  true);
	            
                grdDetail.SetCellBold( 1, G1_Req_Qty,   grdDetail.rows - 1, G1_Req_Qty,   true);
                grdDetail.SetCellBold( 1, G1_TRANS_QTY, grdDetail.rows - 1, G1_TRANS_QTY, true);
                grdDetail.SetCellBold( 1, G1_UP,        grdDetail.rows - 1, G1_Amount,    true);
                grdDetail.SetCellBold( 1, G1_VAT_Rate,     grdDetail.rows - 1, G1_VAT_Rate,     true);
                grdDetail.SetCellBold( 1, G1_VAT_Amount,   grdDetail.rows - 1, G1_VAT_Amount,   true);
                grdDetail.SetCellBold( 1, G1_Total_Amount, grdDetail.rows - 1, G1_Total_Amount, true);
                
                grdDetail.SetCellBold( 1, G1_Ref_No, grdDetail.rows - 1, G1_Ref_No, true);
                
                grdDetail.SetCellBgColor( 1, G1_Req_Item_Code , grdDetail.rows - 1, G1_Req_Item_Name , 0xCCFFFF );
                
                for ( var i = 1 ; i < grdDetail.rows ; i++)
                {
                    if ( Number(grdDetail.GetGridData( i, G1_REQ_ITEM_PK)) > 0 && ( grdDetail.GetGridData( i, G1_REQ_ITEM_PK) != grdDetail.GetGridData( i, G1_TRANS_ITEM_PK) ) )
                    {
                        grdDetail.GetGridControl().Cell( 7, i, G1_TRANS_ITEM_CODE, i, G1_TRANS_ITEM_NAME ) = 0x3300cc;
                    }                    
                }        
                //--------------------------------                
            }         
        break;        
   }            
}


//======================================================================
function OnProcess(pos)
{
    switch(pos)
    {
        case 'Approve' :
            if ( confirm('Do you want to approve this Slip?'))
            {
                pro_bias00021.Call();
            }               
        break;
		
		case 'Cancel' :
            if ( confirm('Do you want to cancel this Slip?'))
            {
                pro_bias00021_1.Call();
            }               
        break;		
    }
} 
//=================================================================================
</script>

<body>
    <!------------------------------------------------------------------------->
    <gw:data id="data_bias00021_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15" function="st_lg_sel_bias00021_1" > 
                <inout>             
                     <inout  bind="txtMasterPK" />
                     <inout  bind="txtSlipNo" />
                     <inout  bind="dtTransDate" />  
                     <inout  bind="lblStatus" />                         
                     <inout  bind="txtChargerPK" />
                     <inout  bind="txtChargerName" />
                     <inout  bind="lstOutWH" />
                     <inout  bind="lstInWH" />
                     <inout  bind="txtOUT_PLPK" />
                     <inout  bind="txtOUT_PLName" />
                     <inout  bind="txtIN_PLPK" />
                     <inout  bind="txtIN_PLName" />
                     <inout  bind="txtRefNo" />
                     <inout  bind="txtRemark" />
                     <inout  bind="txtAmount" /> 
                     <inout  bind="lstCurrency" />
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_bias00021_2" onreceive="OnDataReceive(this)"> 
        <xml>                                   
            <dso id="3" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23" function="st_lg_sel_bias00021_2" > 
                <input bind="grdDetail">                    
                    <input bind="txtMasterPK" /> 
                </input> 
                <output bind="grdDetail" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="pro_bias00021" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bias00020_3" > 
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
    <gw:data id="pro_bias00021_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_bias00020_4" > 
                <input>
                    <input bind="txtMasterPK" /> 
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>	
    <!-------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" border="0">
        <tr style="height: 1%">
            <td align="right" style="width: 10%; white-space: nowrap">
                Slip No
            </td>
            <td style="width: 25%">
                <gw:textbox id="txtSlipNo" csstype="mandatory" styles="width:100%;" />
            </td>
            <td align="right" style="width: 5%; white-space: nowrap">
                Date
            </td>
            <td style="width: 10%" align="left">
                <gw:datebox id="dtTransDate" lang="1" />
            </td>
            <td align="right" style="width: 10%">
            </td>
            <td style="width: 40%" align="center">
                <gw:label id="lblStatus" styles='width:100%;color:cc0000;font:9pt;align:left' text='status' />
            </td>
            <td style="width: 5%">
            </td>
            <td style="width: 1%" align="right">
            </td>
            <td style="width: 1%" align="right">
            </td>
            <td style="width: 1%">
            </td>
            <td style="width: 1%">
            </td>
            <td style="width: 1%">
                <gw:button id="btnApprove" img="Approve" text="Approve" onclick="OnProcess('Approve')" />
				<gw:button id="btnCancel" img="Cancel" text="Cancel" onclick="OnProcess('Cancel')" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 10%" align="right">
                Ref No
            </td>
            <td colspan="3">
                <gw:textbox id="txtRefNo" styles="width:100%;" />
            </td>
            <td align="right" style="width: 10%">
                Charger
            </td>
            <td colspan="7">
                <gw:textbox id="txtChargerName" styles="width:100%" />
                <gw:textbox id="txtChargerPK" styles="display:none" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td align="right" style="width: 10%; white-space: nowrap">
                Out W/H
            </td>
            <td style="white-space: nowrap" colspan="3">
                <gw:list id="lstOutWH" styles='width:100%' csstype="mandatory" />
            </td>
            <td align="right" style="width: 10%; white-space: nowrap">
                In W/H
            </td>
            <td style="white-space: nowrap" colspan="7">
                <gw:list id="lstInWH" styles='width:100%' csstype="mandatory" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td align="right" style="width: 10%; white-space: nowrap">
                Out P/L
            </td>
            <td style="white-space: nowrap" colspan="3">
                <gw:textbox id="txtOUT_PLPK" styles="display:none" />
                <gw:textbox id="txtOUT_PLName" styles="width:100%" />
            </td>
            <td align="right" style="width: 10%; white-space: nowrap">
                In P/L
            </td>
            <td colspan="7">
                <gw:textbox id="txtIN_PLPK" styles="display:none" />
                <gw:textbox id="txtIN_PLName" styles="width:100%" />
            </td>
        </tr>
        <tr style="height: 1%">
            <td style="width: 10%; white-space: nowrap" align="right">
                Total AMT
            </td>
            <td colspan="2" style="white-space: nowrap">
                <gw:textbox id="txtAmount" styles="width:100%;" type="number" format="#,###.###"
                    csstype="mandatory" />
            </td>
            <td>
                <gw:list id="lstCurrency" styles="width:100%" onchange="" />
            </td>
            <td style="width: 10%" align="right">
                Remark
            </td>
            <td colspan="9">
                <gw:textbox id="txtRemark" styles="width:100%;" />
            </td>
        </tr>         
        <tr style="height: 97%">
            <td colspan="12">
                <gw:grid id='grdDetail' header='_PK|Seq|Ref No|_REQ_ITEM_PK|Req Item Code|Req Item Name|_TRANS_ITEM_PK|Trans Item Code|Trans Item Name|Req Qty|UOM|Trans Qty|UOM|U/P|Amount|VAT(%)|VAT Amount|Total Amount|Lot No|_NULL_01|Description|_ST_TRANSFER_M_PK|_NULL_02|_NULL_03'
                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0' aligns='0|1|1|0|0|0|0|0|0|3|1|3|1|3|3|3|3|3|1|1|0|0|0|0'
                    check='|||||||||||||||||||||||' editcol='0|1|1|0|0|0|0|0|0|1|0|1|0|1|1|1|1|1|1|1|1|0|0|0'
                    widths='0|800|1000|0|1500|2000|0|1500|2000|1200|1000|1200|1000|1500|1500|1500|1500|1500|1500|1500|1000|0|0|0'
                    sorting='T' styles='width:100%; height:100%' onafteredit="CheckInput()" oncelldblclick="OnGridCellDoubleClick(this)" />
                />
            </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------------------------------>
<gw:textbox id="txtMasterPK" styles="display:none;" />
<gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
<!---------------------------------------------------------------------------------->
</html>
