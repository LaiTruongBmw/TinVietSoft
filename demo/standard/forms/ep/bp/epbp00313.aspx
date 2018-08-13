<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>P/R CHECKING : TRANSFER DETAIL</title>
</head>
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
var G_PO_NO		= 0,
	G_PO_DATE	= 1,
	G_PR_D_PK	= 2,
	G_Seq		= 3,
	G_REF_NO	= 4,
	G_ITEM_CODE	= 5,
	G_ITEM_NAME	= 6,
	G_UOM		= 7,
	G_REQ_QTY	= 8,
	G_PO_QTY	= 9,	
	G_REMARK	= 10;

 //=========================================================================
 function BodyInit()
 { 
    txtPR_D_PK.text = "<%=Request.querystring("p_tlg_po_pr_d_pk")%>";
    dtFrom.value    = "<%=Request.querystring("p_req_dt")%>";
    lblRefNo.text   = "<%=Request.querystring("p_ref_no")%>";
	lblDept.text    = "<%=Request.querystring("p_dept_name")%>";
	
	OnFormatGrid();
	
    OnSearch();
 }      
 //=========================================================================
 function OnFormatGrid()
 {
 	  grdDetail.GetGridControl().MergeCells  = 2 ;	
      grdDetail.GetGridControl().MergeCol(0) = true ;	
      grdDetail.GetGridControl().MergeCol(1) = true ;   	
      grdDetail.GetGridControl().MergeCol(2) = true ;	
      grdDetail.GetGridControl().MergeCol(3) = true ;	
      grdDetail.GetGridControl().MergeCol(4) = true ;		
      grdDetail.GetGridControl().MergeCol(5) = true ;	
	  
	  var ctr = grdDetail.GetGridControl(); 
	  
	  ctr.ColFormat(G_REQ_QTY) = "#,###,###,###,###,###.##";  
	  ctr.ColFormat(G_PO_QTY)  = "#,###,###,###,###,###.##";	  
   	
 }
//=========================================================================
 function OnSearch(pos) 
 {            
 	data_epbp00313.Call('SELECT');
 }
//=========================================================================
function OnDataReceive()
{ 	   
    if ( grdDetail.rows > 1 )
    {
        grdDetail.SetCellBgColor( 1, G_ITEM_CODE, grdDetail.rows - 1, G_ITEM_NAME, 0xCCFFFF ); 
        
        grdDetail.SetCellBold( 1, G_PO_NO     , grdDetail.rows - 1, G_PO_NO     , true);  
        grdDetail.SetCellBold( 1, G_ITEM_CODE , grdDetail.rows - 1, G_ITEM_CODE , true);  
		
		grdDetail.GetGridControl().Cell( 7, 0, G_PO_QTY, grdDetail.rows - 1, G_PO_QTY)  = 0x3300cc;  	
		
		grdDetail.Subtotal( 0, 2,-1, '9');			                                
    } 		
}            
 
//=========================================================================
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_epbp00313" onreceive="OnDataReceive(this)">	
		<xml>	
			<dso	id="2"	type="grid"	parameter="0,1,2,3"	function="st_lg_SEL_epbp00313"	>	
				<input>
					<input	bind="txtPR_D_PK"	/>	
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
                <td style="width: 35%" align="center">
                    <gw:label id="lblDept" styles='width:100%;color:cc0000;font:9pt' />
                </td>
                <td style="width: 5%; white-space:nowrap" align="right">
                    Ref No
                </td>
                <td style="width: 15%" align="center">
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
                <gw:grid id='grdDetail' 
					header='Slip No|Tr Date|_PK|Seq|Ref No|Item Code|Item Name|UOM|Req Qty|Tr Qty|Remark'
                    format='0|4|0|0|0|0|0|0|0|0|0' 
					aligns='0|1|0|1|0|0|0|1|3|3|0' 					 
                    editcol='0|0|0|0|0|0|0|0|0|0|0' 
					widths='1500|1200|0|800|1200|1500|3000|800|1200|1200|1000'
                    sorting='T' styles='width:100%; height:100%' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtPR_D_PK" styles="width: 100%;display: none" />
</body>
</html>
