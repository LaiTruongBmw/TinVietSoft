<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Popup by Dept</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>
 
    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;

    var G1_PO_DATE      = 0,
        G1_PO_NO        = 1,
        G1_SEQ          = 2,
        G1_TCO_ITEM_PK  = 3,
        G1_ITEM_CODE    = 4,
        G1_ITEM_NAME    = 5,
        G1_UOM          = 6,
        G1_TOTAL_AMT    = 7,
        G1_PO_QTY       = 8;
 //=========================================================================
 function BodyInit()
 {
    System.Translate(document);
      //----------------------
      txt_po_dept_pk.text =  "<%=Request.querystring("p_po_dept_pk")%>";
      txt_tco_itemgrp_pk.text =  "<%=Request.querystring("p_tco_itemgrp_pk")%>";
      txt_tco_item_pk.text =  "<%=Request.querystring("p_tco_item_pk")%>";
      OnFormatGrid();    
 }   
 
 //=========================================================================
 function OnFormatGrid()
 {
    var trl ;
    
    //grdMaster.GetGridControl().Cell( 7, 0, G1_Status, 0, G1_Status) = 0x3300cc;
    //--------------------------------------------------------
      grdMaster.GetGridControl().MergeCells  = 2 ;	
      grdMaster.GetGridControl().MergeCol(0) = true ;	
      grdMaster.GetGridControl().MergeCol(1) = true ;   	
      grdMaster.GetGridControl().MergeCol(2) = true ;	
      grdMaster.GetGridControl().MergeCol(3) = true ;	
      grdMaster.GetGridControl().MergeCol(4) = true ;		
      grdMaster.GetGridControl().MergeCol(5) = true ;	
      grdMaster.GetGridControl().MergeCol(6) = true ;	
      grdMaster.GetGridControl().MergeCol(7) = true ;   	
      grdMaster.GetGridControl().MergeCol(8) = true ;
    //--------------------------------------------------------
    
      trl = grdMaster.GetGridControl();
    
      trl.ColFormat(G1_TOTAL_AMT) = "###,###,###,###,###.##";
      trl.ColFormat(G1_PO_QTY)    = "###,###,###.##";
            
 }
//=========================================================================
 function OnSearch()
 {
    data_epbp00131.Call('SELECT');        
 }

//=========================================================================
function OnDataReceive(po_oData)
{
      switch (po_oData.id)         
      {		        
            case 'data_epbp00130' :
                lbRecord.text = grdMaster.rows-1 + " row(s)";
                
                if ( grdMaster.rows > 1 )
                {
                    grdMaster.SetCellBold( 1, G1_BUDGET_AMOUNT, grdMaster.rows - 1, G1_BUDGET_AMOUNT, true);
                    grdMaster.SetCellBold( 1, G1_PO_AMOUNT,   grdMaster.rows - 1, G1_PO_AMOUNT,   true);
                    grdMaster.SetCellBold( 1, G1_AMOUNT_BALANCE,   grdMaster.rows - 1, G1_AMOUNT_BALANCE,   true);
                    grdMaster.SetCellBold( 1, G1_PO_QTY,   grdMaster.rows - 1, G1_PO_QTY,   true);
                    grdMaster.SetCellBold( 1, G1_ITEM_BALANCE,   grdMaster.rows - 1, G1_ITEM_BALANCE,   true);
                }            
                lbRecord.text = grdMaster.rows-1 + " row(s)";     
            break;         
      }      
}          

//------------------------------------------------------------------------------
function OnPrint()
{
    var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00130.aspx?p_date="+ dtFrom.value + "&p_dept=" + txtDept.text + "&p_item=" + txtItem.text; 
    System.OpenTargetPage(url); 
}
//=========================================================================
 
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_epbp00130" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid" user="prod"  function="st_lg_sel_epbp00131" >
                <input  bind="grdMaster">
                    <input bind="txt_po_dept_pk" />
                    <input bind="txt_tco_itemgrp_pk" />
                    <input bind="txt_tco_item_pk" />
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 100%">
            <td>
               <gw:grid id='grdMaster'
header='PO Date|PO No|Seq|_po_item_pk|Item Code|Item Name|UOM|Total Amt|PO Qty'
format='4|0|1|0|0|0|0|1|1'
aligns='0|0|0|0|0|0|0|0|0'
check='||||||||'
editcol='1|1|1|1|1|1|1|1|1'
widths='1200|1000|800|0|1800|2500|1000|1500|1500'
sorting='T'
styles='width:100%; height:100%'
/>
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txt_po_dept_pk" styles="width: 100%;display: none" />
    <gw:textbox id="txt_tco_itemgrp_pk" styles="width: 100%;display: none" />
    <gw:textbox id="txt_tco_item_pk" styles="width: 100%;display: none" />
</body>
</html>
