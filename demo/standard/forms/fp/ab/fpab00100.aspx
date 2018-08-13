<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Pop Up Get Sale Order Master Info</title>
</head>

<script>
//grdSOList
 var    iColBill_To_pk          = 0,
        iColBill_To1            = 1,
        iColBill_To2            = 2,
        iColOrd_Date            = 3,
        iColSO_No               = 4,
        iColOrd_Type            = 5,
        iColOrd_Status          = 6,
        iColSales_Type          = 7,
        iColOrd_Priority        = 8,
        G1_PO_No               = 9,
        iColCCY_Unit            = 10,
        iColSale_Rep            = 11,
        iColBuy_Rep             = 12,
        iColPay_Form            = 13,
        iColPay_Term            = 14,
        iColDeli_To_PK          = 15,
        iColDeli_To             = 16,
        iColDeli_To             = 17,
        iColDeli_Loc_PK         = 18,
        iColDeli_Loc            = 19,
        iColDeli_Method         = 20,
        iColDeli_Term           = 21,
        iColTax_rate            = 22,
        iColOrd_Amt             = 23,
        iColTotal_Amt           = 24,
        iColETD                 = 25,
        iColETA                 = 26,
        iColEmp_PK              = 27,
        iCOlEMP_ID              = 28,
        iColEMP_Name            = 29,
        iColClose_YN            = 30,
        iColDescription         = 31,
        G1_SO_PK     = 32;
  //    grdSOItemList

    var iCol2tsa_saleorderd_pk  = 0,
        iCol2SO_No              = 1,
        iCol2tco_item_pk        = 2,
        iCol2Item_Code          = 3,
        iCol2Item_Name          = 4,
        iCol2Cust_Item_Name     = 5,
        iCol2UOM                = 6,        
        iCol2UP                 = 7,
        iCol2Ord_Qty            = 8,
        iCol2VAT_Rate           = 9,
        iCol2Amount             = 10,
        iCol2Item_Status        = 11,
        iCol2ETD                = 12,
        iCol2ETA                = 13,
        iCol2Deli_Method        = 14,        
        iCol2TO_Req             = 15,
        iCol2TO_Plan            = 16,
        iCol2PP_Plan            = 17,
        iCol2BC_Qty             = 18,
        iCol2Prod_Qty           = 19,
        iCol2TO_Qty             = 20,
        iCol2Close_YN           = 21,
        iCol2Close_Date         = 22,
        iCol2Description        = 23;
     
        iCol2LotUnit            = 24,
        iCol2LotQty             = 25,
        iCol2Lot_uom            = 26,
        iCol2Weight             = 27,
        iCol2Weight_uom         = 28;
        
  // grdItemSelect 
    var iCol3UP                 = 7,
        iCol3Ord_Qty            = 8,
        iCol3Amount             = 10,
        iCol3TO_Req             = 15,
        iCol3TO_Plan            = 16,
        iCol3PP_Plan            = 17,
        iCol3BC_Qty             = 18,
        iCol3Prod_Qty           = 19,
        iCol3TO_Qty             = 20;
  

//===========================================================
 function BodyInit()
 {
        System.Translate(document);
	dtFromDate.SetDataText(System.AddDate(dtToDate.GetData(),-30));
	FormatGrid();
 } 
//===========================================================
 function FormatGrid()
 {
      var trl;
      //-------------------------------------------------
      trl = grdSOList.GetGridControl();	
      trl.ColFormat(iColOrd_Amt)            = "###,###,###,###,###.##";
      trl.ColFormat(iColTotal_Amt)          = "###,###,###,###,###.##";
      
      //-------------------------------------------------
      trl = grdSOItemList.GetGridControl();
      	
      trl.ColFormat(iCol2UP)                = "###,###,###,###,###.##";
      trl.ColFormat(iCol2Ord_Qty)           = "###,###,###,###,###.##";
      trl.ColFormat(iCol2Amount)            = "###,###,###,###,###.##";
      trl.ColFormat(iCol2TO_Req)            = "###,###,###,###,###.##";
      trl.ColFormat(iCol2TO_Plan)           = "###,###,###,###,###.##";
      trl.ColFormat(iCol2PP_Plan)           = "###,###,###,###,###.##";
      trl.ColFormat(iCol2BC_Qty)            = "###,###,###,###,###.##";
      trl.ColFormat(iCol2Prod_Qty)          = "###,###,###,###,###.##";
      trl.ColFormat(iCol2TO_Qty)            = "###,###,###,###,###.##";
      
  }
//==========================================================================
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
        case 1 :
            data_fpab00100.Call("SELECT");
        break;
        case 2 :         
            if ( grdSOList.row > 0 )
            {
                txtOrderPK.text = grdSOList.GetGridData(grdSOList.row,32);
                data_fpab00100_1.Call("SELECT");
            } 
            else
            {
                alert('Pls Select 1 Order !!!');
            }                       
        break;         
      }  
 }
 
//==========================================================================
 function OnDataReceive(po_oData)
 {
 
      switch (po_oData.id)         
      {
            case "data_fpab00100" :            
                txtOrderPK.text = '' ;
                data_fpab00100_1.Call('SELECT');                
            break;
            
            case "data_fpab00100_1" :        
                countItem();
            break;
      }  
 }
//=============================================================================== 
function OnGridCellDoubleClick(oGrid)
{
    var code_data = new Array();
    
    var rowNo = 0 ;

    if ( oGrid.row > 0 )
    {	  
        rowNo = oGrid.row ;
        
        code_data[0] = oGrid.GetGridData( rowNo, G1_SO_PK ); 
        code_data[1] = oGrid.GetGridData( rowNo, G1_PO_No );
        
        window.returnValue = code_data; 
        this.close();             
    }    	
}

//==========================================================================
function OnSelect()
{  
    var code_data = new Array();
    var array_po = '' , array_so_pk = '' ;
    var t = 0 ;
    
    for(var i = 1; i < grdSOList.rows && t <= 5; i++)
    {
        if( grdSOList.GetGridControl().isSelected(i) == true )
        {
            t = t + 1 ;            
            array_so_pk = array_so_pk + grdSOList.GetGridData( i, G1_SO_PK) + ',';        
            array_po    = array_po    + grdSOList.GetGridData( i, G1_PO_No) + ',';                                       
        }
    }  
    
    array_so_pk = array_so_pk.substring( 0, array_so_pk.length-1 );
    array_po    = array_po.substring( 0, array_po.length-1 );
    
    code_data[0] = array_so_pk ;
    code_data[1] = array_po ;
     
    window.returnValue = code_data;
    this.close();                	
}

//==========================================================================
function OnCancel()
{
    var code_data = new Array()
    
    for( var j=0 ; j < grdSOList.cols ; j++ )
    {
        code_data[j] = '' ;
    } 
	    
    window.returnValue = code_data; 
    this.close(); 	
}

//==============================================================================
function countItem()
{
    lblCount.text = grdSOItemList.rows-1 + " item(s)."
}

//==============================================================================
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00100" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="0,1,2" function="st_lg_sel_fpab00100" > 
                <input> 
                    <input bind="txtSONo" /> 
                    <input bind="dtFromDate" /> 
                    <input bind="dtToDate" />  
                </input> 
                <output bind="grdSOList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="data_fpab00100_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  parameter="0" function="st_lg_sel_fpab00100_1" > 
                <input> 
                    <input bind="txtOrderPK" /> 
                </input> 
                <output bind="grdSOItemList" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%">
        <tr style="height: 1%">
            <td align="right" style="width: 10%; white-space: nowrap">
                SO/PO NO</td>
            <td style="width: 20%">
                <gw:textbox id="txtSONo" styles='width:100%' csstype="mandatory" onenterkey="OnSearch(1)" />
            </td>
            <td align='right' style="width: 10%; white-space: nowrap">
                Order Date</td>
            <td style="width: 20%; white-space: nowrap">
                <gw:datebox id="dtFromDate" lang="1" />
                ~
                <gw:datebox id="dtToDate" lang="1" />
            </td>
            <td style="width: 37%">
            </td>
            <td style="width: 1%" align="right">
                <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch(1)" />
            </td>
            <td style="width: 1%" align="right">
                <gw:button id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel()" />
            </td>
            <td align="right" style="width: 1%">
                <gw:button id="btnSelect" img="select" alt="Select" onclick="OnSelect()" />
            </td>
        </tr>
        <tr id='top' style="height: 49%">
            <td colspan="8">
                <gw:grid id="grdSOList" header="_Bill_To_pk|Bill To|Bill To|Ord Date|SO No|Ord Type|Ord Status|Sales Type|Ord Priority|PO No|CCY Unit|Sale Rep|Buy Rep|Pay Form|Pay Term|_Deli_To_PK|Deli To|Deli To|_Deli_Loc_PK|Deli Loc|Deli Method|Deli Term|Tax rate|Ord Amt|Total Amt|ETD|ETA|_Emp_PK|EMP ID|EMP Name|Close YN|Description|_tsa_saleorder_p"
                    format="0|0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|4|4|0|0|0|3|0|0" aligns="0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|0|0|0|0|0|0"
                    defaults="|||||||||||||||||||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|1200|3000|1200|1500|2000|1500|1500|2000|1500|1500|2000|2000|2000|2000|0|0|0|0|0|0|0|0|0|0|1200|1200|0|0|2500|0|2500|0"
                    styles="width:100%; height:100%" sorting="T" acceptnulldate="true" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32"
                    onselchange="OnSearch(2)" oncelldblclick="OnGridCellDoubleClick(this)" />
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td colspan="7">
                <gw:label id="lblCount" styles="color: blue">item(s)</gw:label>
            </td>
        </tr>
        <tr style="height: 50%">
            <td colspan="8">
                <gw:grid id="grdSOItemList" header="_tsa_saleorderd_pk|SO No|_tco_item_pk|Item Code|Item Name|Cust Item Name|UOM|U/P|Ord Qty|VAT Rate|Amount|Item Status|ETD|ETA|Deli Method|T/O Req|T/O Plan|PP Plan|BC Qty|Prod Qty|T/O Qty|Close YN|Close Date|Description|_LOT_UNIT|_LOT_QTY|LOT_UOM|WEIGHT_QTY|WEIGHT_UOM"
                    format="0|0|0|0|0|0|0|1|1|1|1|0|0|0|0|1|1|1|1|1|1|3|4|0|0|0|0|0|0" aligns="0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0"
                    defaults="||||||||||||||||||||||||||||" editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="0|1700|0|1500|4000|2000|800|1000|1500|1500|1500|2000|1200|1200|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|0|0|0|0|0"
                    styles="width:100%; height:100%" sorting="F" acceptnulldate="T" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23" />
            </td>
        </tr>
    </table>
    <!------------------------------------------------------------------>
    <gw:textbox id="txtOrderPK" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------------------------------>
</body>
</html>
