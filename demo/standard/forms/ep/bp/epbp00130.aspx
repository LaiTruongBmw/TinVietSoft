<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PURCHASE BUDGET CHECKING</title>
</head>
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<script>
 
    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;

 var G1_PO_DEPT_PK      = 0,
     G1_DEPT_ID         = 1,
     G1_DEPT_NAME       = 2,
     G1_TCO_ITEMGRP_PK  = 3,
     G1_TCO_ITEM_PK     = 4,
     G1_ITEM_CODE       = 5,
     G1_ITEM_NAME       = 6,
     G1_BUDGET_AMOUNT   = 7,
     G1_PO_AMOUNT       = 8,
     G1_AMOUNT_BALANCE  = 9,
     G1_TR_CCY          = 10,
     G1_BUDGET_ITEM     = 11,
     G1_PO_QTY          = 12,
     G1_ITEM_BALANCE    = 13;
 //=========================================================================
 function BodyInit()
 {
    System.Translate(document);
      //----------------------
      BindingDataList();
      OnFormatGrid();    
 } 
 //=========================================================================
 function BindingDataList()
 {            
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
      grdMaster.GetGridControl().MergeCol(9) = true ;	
      grdMaster.GetGridControl().MergeCol(10) = true ;		
      grdMaster.GetGridControl().MergeCol(11) = true ;	
    //--------------------------------------------------------
    
      trl = grdMaster.GetGridControl();
    
      trl.ColFormat(G1_BUDGET_AMOUNT)   = "###,###,###,###,###.##";
      trl.ColFormat(G1_PO_AMOUNT)       = "###,###,###.##";
      trl.ColFormat(G1_AMOUNT_BALANCE)  = "###,###,###.##";
	  
	  trl.ColFormat(G1_BUDGET_ITEM)     = "###,###,###.##";
	  trl.ColFormat(G1_PO_QTY)          = "###,###,###.##";
      trl.ColFormat(G1_ITEM_BALANCE)    = "###,###,###.##";
               
 }
//=========================================================================
 function OnSearch()
 {
    data_epbp00130.Call('SELECT');        
 }

//=========================================================================
function OnDataReceive(po_oData)
{
      switch (po_oData.id)         
      {		        
            case 'data_epbp00130' :
                lbRecord.text = grdMaster.rows-1 + " row(s)";   
				
                var ldept = "";             
                if ( grdMaster.rows > 1 )
                {
					grdMaster.SetCellBold( 1, G1_DEPT_ID,        grdMaster.rows - 1, G1_DEPT_ID,        true);
					grdMaster.SetCellBold( 1, G1_ITEM_CODE,      grdMaster.rows - 1, G1_ITEM_CODE,      true);
                    grdMaster.SetCellBold( 1, G1_AMOUNT_BALANCE, grdMaster.rows - 1, G1_AMOUNT_BALANCE, true);
                    grdMaster.SetCellBold( 1, G1_ITEM_BALANCE,   grdMaster.rows - 1, G1_ITEM_BALANCE,   true);
					
					grdMaster.SetCellBgColor( 1, G1_BUDGET_AMOUNT, grdMaster.rows - 1, G1_AMOUNT_BALANCE, 0xCCFFFF ); 
					grdMaster.SetCellBgColor( 1, G1_BUDGET_ITEM,   grdMaster.rows - 1, G1_ITEM_BALANCE,   0xCCFFFF );
					
					/*ldept = grdMaster.GetGridData(1,G1_PO_DEPT_PK);
					
					for(var i =2 ; i<grdMaster.rows; i++)
					{
					    if(ldept != grdMaster.GetGridData(i,G1_PO_DEPT_PK))
					    {
					      ldept = grdMaster.GetGridData(i,G1_PO_DEPT_PK);
					      grdMaster.SetCellBgColor( i-1, G1_DEPT_ID,   i-1, G1_ITEM_BALANCE,  0x60A4FA );
					    }
					}
					grdMaster.SetCellBgColor( grdMaster.rows -1, G1_DEPT_ID,   grdMaster.rows -1, G1_ITEM_BALANCE,   0x60A4FA );*/
                }  
				   
            break;         
      }      
}          

//=========================================================================
function OnPrint()
{
    var url =System.RootURL + "/standard/reports/ep/bp/rpt_epbp00130.aspx?p_date="+ dtFrom.value + "&p_dept=" + txtDept.text + "&p_item=" + txtItem.text; 
    System.OpenTargetPage(url); 
}

//=========================================================================
 function OnGridCellDblClick()
{
    var row,col 
    row = event.row;
    col = event.col;
    
    if ( col == G1_DEPT_ID || col == G1_DEPT_NAME )
    {
            var path = System.RootURL + '/standard/formsep/bp/epbp00131.aspx?p_po_dept_pk='+ grdMaster.GetGridData(row,G1_PO_DEPT_PK) + '&p_tco_itemgrp_pk=' + grdMaster.GetGridData(row,G1_TCO_ITEMGRP_PK) + '&p_tco_item_pk=' + grdMaster.GetGridData(row,G1_TCO_ITEM_PK);
            var object  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:400px');
    }
}
//=========================================================================
</script>

<body>
    <!----------------------------------------------------------------------->
    <gw:data id="data_epbp00130" onreceive="OnDataReceive(this)"> 
        <xml>
           <dso  type="grid" user="prod"  function="st_lg_sel_epbp00130" >
                <input  bind="grdMaster">
                    <input bind="dtFrom" />
                    <input bind="txtDept" />
                    <input bind="txtItem" />
                </input> 
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 5%">
            <td>
                <table style="width: 100%; height: 100%" border="0">
                    <tr>
                        <td align="right" style="width: 5%; white-space: nowrap">
                            Date
                        </td>
                        <td style="width: 10%; white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 5%" align="right">
                            Dept
                        </td>
                        <td style="width: 15%" align="right">
                            <gw:textbox id="txtDept" styles="width:100%" />
                        </td>
                        <td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 15%" align="right">
                            <gw:textbox id="txtItem" styles="width:100%" />
                        </td>
                        <td style="width: 100%; white-space: nowrap" align="center">
                            <gw:label id="lbRecord" styles='width:100%;color:cc0000;font:9pt'>record(s)</gw:label>
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="excel" alt="Report" id="btnReport" onclick="OnPrint()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button id="ibtnSearch1" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 95%">
            <td>
                <gw:grid id='grdMaster' header='_po_dept_pk|Dept ID|Dept Name|_tco_itemgrp_pk|_tco_item_pk|Item Code|Item Name|Budget Amount|P/O Amount|Amount Balance|CCY|Budget Item|P/O Qty|Item Balance'
                    format='0|0|0|0|0|0|0|1|1|1|0|0|1|1' 
					aligns='0|0|0|0|0|0|0|0|0|0|1|3|0|0' 
					check='|||||||||||||'
                    editcol='1|1|1|1|1|1|1|0|0|0|1|1|0|0' 
					widths='0|1500|2500|0|0|1500|2500|1500|1500|1500|800|1200|1200|1200'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick='OnGridCellDblClick(this)' />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
</body>
</html>
