<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>P/R CHECKING</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var G_TLG_PO_PR_D_PK    = 0,
    G_ITEM_CODE         = 1,
    G_ITEM_NAME         = 2,
    G_REF_NO            = 3,
    G_REQ_QTY           = 4,
    G_PO_QTY            = 5,
    G_IN_QTY            = 6,
    G_UNIT_PRICE        = 7,
    G_PO_UOM            = 8,
    G_PO_AMT            = 9,
    G_VAT_RATE          = 10,
    G_VAT_AMOUNT        = 11,
    G_OTHERS_EXPENSE    = 12,
    G_TOTAL_AMT         = 13,
    G_DESCRIPTION       = 14;
             
             
             
             
             
 //=========================================================================
 function BodyInit()
 { 
    txt_tlg_po_pr_d_pk.text = "<%=Request.querystring("p_tlg_po_pr_d_pk")%>";
    dtFrom.value = "<%=Request.querystring("p_req_dt")%>";
    lblRefNo.text = "<%=Request.querystring("p_ref_no")%>";
    data_epbp00092.Call('SELECT');
 } 
 //=========================================================================
 function BindingDataList()
 {          
 }        
 //=========================================================================
 function OnFormatGrid()
 {
 }
//=========================================================================
 function OnSearch(pos)
 {            
 }
//=========================================================================
function OnDataReceive()
{   
    for ( var i=1; i<grdDetail.rows; i++ )
    {
        grdDetail.SetCellBgColor( i, G_IN_QTY  , grdDetail.rows - 1    , G_IN_QTY , 0xCCFFFF ); 
        
        grdDetail.SetCellBold( i, G_ITEM_NAME   , grdDetail.rows - 1, G_ITEM_NAME   , true);  
        grdDetail.SetCellBold( i, G_REQ_QTY     , grdDetail.rows - 1, G_REQ_QTY     , true);                            
        grdDetail.SetCellBold( i, G_PO_QTY      , grdDetail.rows - 1, G_PO_QTY      , true); 
        grdDetail.SetCellBold( i, G_PO_AMT      , grdDetail.rows - 1, G_PO_QTY      , true);
        grdDetail.SetCellBold( i, G_TOTAL_AMT   , grdDetail.rows - 1, G_TOTAL_AMT   , true);           
    } 
}            
//=========================================================================
function OnPopup()
{
} 
//=========================================================================
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_epbp00092" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	id="2"	type="grid"	parameter="0,1,2,3"	function="st_lg_SEL_EPBP00090_2"	>	
				<input>
					<input	bind="txt_tlg_po_pr_d_pk"	/>	
				</input>	
				<output	bind="grdDetail"	/>	
			</dso>	
		</xml>	
	</gw:data>
    <!----------------------------------------------------------------------->
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td>
                <td align="right" style="width: 5%; white-space: nowrap">
                    Req Date
                </td>
                <td style="width: 20%; white-space: nowrap">
                    <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                </td>
                <td style="width: 5%" align="right">
                    Dept
                </td>
                <td style="width: 35%" align="right">
                    <gw:label id="lblDept" styles='width:100%;color:cc0000;font:9pt' />
                </td>
                <td style="width: 5%; white-space: nowrap" align="right">
                    Ref No
                </td>
                <td style="width: 15%" align="right">
                    <gw:label id="lblRefNo" styles='width:100%;color:cc0000;font:9pt' />
                </td>
                <td style="width: 13%; white-space: nowrap" align="center">
                </td>
                <td style="width: 1%" align="right">
                </td>
                <td style="width: 1%" align="right">
                </td>
            </td>
        </tr>
        <tr style="height: 99%">
            <td colspan="10">
                <gw:grid id='grdDetail' header='_pk|Item Code|Item Name|Ref No|Req Qty|PO Qty|In Qty|Unit Price|UOM|PO Amt|Vat|Vat Amt|Others Expense|Total Amt|Description'
                    format='0|0|0|0|1|1|1|1|0|1|1|1|1|1|0' aligns='0|0|0|0|0|0|0|0|1|0|0|0|0|0|0'
                    check='||||||||||||||' editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1' widths='0|1200|2200|1000|1000|1000|1000|1000|800|1000|1000|1000|1200|1200|1000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txt_tlg_po_pr_d_pk" styles="width: 100%;display: none" />
</body>
</html>
