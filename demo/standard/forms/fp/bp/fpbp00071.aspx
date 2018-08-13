<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Pop up Create Barcode</title>
</head>
<%  ESysLib.SetUser("prod")
  
%>
<script>
var     iBCList_tpr_bcprint_pk      = 0,
        iBCList_print_date          = 1,
        iBCList_print_emp_pk        = 2,
        iBCList_print_emp_name      = 3,
        iBCList_print_type          = 4,
        iBCList_tco_item_pk         = 5,
        iBCList_item_code           = 6,
        iBCList_item_name           = 7,
        iBCList_item_uom            = 8,
        iBCList_print_qty           = 9,
        iBCList_batch_num           = 10,
        iBCList_lot_qty             = 11,
        iBCList_lot_uom             = 12,
        iBCList_print_times         = 13,
        iBCList_description         = 14,
        iBCList_tsa_saleorderd_pk   = 15,
        iBCList_stock_no            = 16,
        iBCList_tpr_lotno_pk        = 17,
        iBCList_att01               = 18,
        iBCList_att02               = 19, 
        iBCList_att03               = 20,
        iBCList_att04               = 21,
        iBCList_att05               = 22,
        iBCList_att06               = 23,
        iBCList_att07               = 24,
        iBCList_att08               = 25,
        iBCList_att09               = 26,
        iBCList_att10               = 27;
        iBCList_stock_adjd_pk               = 28;
        iBCList_seq                 =29;
        
        var user_pk, user_name
function BodyInit()
{
  txtStockAdj_pk.text =  "<%=Request.querystring("stockadjust")%>";
  user_pk = "<%=Request.querystring("user_pk")%>";
  user_name = "<%=Request.querystring("user_name")%>";
  txtEmp_pk.text =  user_pk;
  grdItem.GetGridControl().FrozenCols =3
  grdSOD.GetGridControl().FrozenCols = 4
  grdPrintBCList.GetGridControl().FrozenCols = 8
  fpbp00071_1.Call("SELECT")
  data = "DATA|O|Order Date|E|ETD";
  idList.SetDataText(data);
}
////------------------------------------------------------------------------------------------------
function OnAdd()
{
    var ctr1 = grdItem.GetGridControl()
    var ctr2 = grdSOD.GetGridControl()
     if (ctr1.SelectedRows >0 && ctr2.SelectedRows >0 )
    {
          grdPrintBCList.AddRow()
          var lRow = grdPrintBCList.rows -1;
          grdPrintBCList.SetGridText(lRow, iBCList_print_emp_pk  , user_pk) ;//user_pk	    	    
          grdPrintBCList.SetGridText(lRow, iBCList_print_emp_name, user_name) ;//user_name
          grdPrintBCList.SetGridText(lRow, iBCList_tco_item_pk   , grdItem.GetGridData( ctr1.SelectedRow(0), 0 )) ;//item_pk
          grdPrintBCList.SetGridText(lRow, iBCList_item_code     , grdItem.GetGridData( ctr1.SelectedRow(0), 2   )) ;//item_code
          grdPrintBCList.SetGridText(lRow, iBCList_item_name     , grdItem.GetGridData( ctr1.SelectedRow(0), 3   )) ;//item_name
          grdPrintBCList.SetGridText(lRow, iBCList_item_uom      , grdItem.GetGridData( ctr1.SelectedRow(0), 4        )) ;//UOM  
          grdPrintBCList.SetGridText(lRow, iBCList_lot_qty       , grdItem.GetGridData( ctr1.SelectedRow(0), 5 ) ) ;//LOT QTY  
          grdPrintBCList.SetGridText(lRow, iBCList_print_qty     , grdItem.GetGridData( ctr1.SelectedRow(0), 5 ) ) ;//Print Qty        
          grdPrintBCList.SetGridText(lRow, iBCList_lot_uom       , grdSOD.GetGridData( ctr2.SelectedRow(0), 5        )) ;//LOT UOM
          grdPrintBCList.SetGridText(lRow, iBCList_print_times       , 1) ;//Print time
          grdPrintBCList.SetGridText(lRow, iBCList_tpr_lotno_pk      , grdItem.GetGridData( ctr1.SelectedRow(0), 6 )) ;//Stock PK
          grdPrintBCList.SetGridText(lRow, iBCList_stock_no     , grdItem.GetGridData( ctr1.SelectedRow(0), 7 )) ;//Stock PK
          grdPrintBCList.SetGridText(lRow, iBCList_att01      , grdSOD.GetGridData( ctr2.SelectedRow(0), 1 )) ;//SO No
          grdPrintBCList.SetGridText(lRow, iBCList_tsa_saleorderd_pk, grdSOD.GetGridData( ctr2.SelectedRow(0), 0)) ;// sale order detail pk
          grdPrintBCList.SetGridText(lRow, iBCList_stock_adjd_pk ,grdItem.GetGridData( ctr1.SelectedRow(0), 8) ) ;// addjust detail pk
          grdPrintBCList.SetGridText(lRow, iBCList_seq ,grdItem.GetGridData( ctr1.SelectedRow(0), 1) ) ;// addjust detail pk
          grdPrintBCList.SetGridText(lRow, iBCList_att01 ,grdSOD.GetGridData( ctr2.SelectedRow(0), 1) ) ;// so no 
          grdItem.RemoveRowAt(ctr1.SelectedRow(0));
          //grdSOD.RemoveRowAt(ctr2.SelectedRow(0));
    }else
    {
        alert("Please mapping an item with a saleorder detail to print barcode!")
    }
}
function OnDataReceive(obj)
{
    if(obj.id=="fpbp00071_3")
    {
       fpbp00071_4.Call();
    }
    if(obj.id=="fpbp00071_4")
    {
        alert(txtReturnValue.text)
    }
}
function FindItem()
{
    var row, col, value
    row = event.row
    value = grdItem.GetGridData(row,0)
    var ctr = grdSOD.GetGridControl()
    for (var j=1; j<grdSOD.rows; j ++)
    {
        ctr.SelectionMode = 3
        ctr.IsSelected(i) = 0
    }
    for(var i=1; i<grdSOD.rows; i ++)
    { 
          if (grdSOD.GetGridData(i,2)==value)
            {
                ctr.SelectionMode = 3
                ctr.IsSelected(i) = 1
                ctr.TopRow = i
                break;
            }
     }
}
function OnSearch()
{
   fpbp00071_2.Call('SELECT')
}
function Process()
{
    fpbp00071_3.Call()
}
function OnDetlete()
{
    
    var ctr1 = grdPrintBCList.GetGridControl()
    if (grdPrintBCList.GetGridData(ctr1.SelectedRow(0),iBCList_tpr_bcprint_pk)=="")
    {
        grdItem.AddRow();
        var lRow = grdItem.rows -1;
        grdItem.SetGridText(lRow,0,grdPrintBCList.GetGridData(ctr1.SelectedRow(0),iBCList_tco_item_pk))
        grdItem.SetGridText(lRow,1,grdPrintBCList.GetGridData(ctr1.SelectedRow(0),iBCList_seq))
        grdItem.SetGridText(lRow,2,grdPrintBCList.GetGridData(ctr1.SelectedRow(0),iBCList_item_code))
        grdItem.SetGridText(lRow,3,grdPrintBCList.GetGridData(ctr1.SelectedRow(0),iBCList_item_name))
        grdItem.SetGridText(lRow,4,grdPrintBCList.GetGridData(ctr1.SelectedRow(0),iBCList_item_uom))
        grdItem.SetGridText(lRow,5,grdPrintBCList.GetGridData(ctr1.SelectedRow(0),iBCList_print_qty ))
        grdItem.SetGridText(lRow,6,grdPrintBCList.GetGridData(ctr1.SelectedRow(0),iBCList_tpr_lotno_pk ))
        grdItem.SetGridText(lRow,7,grdPrintBCList.GetGridData(ctr1.SelectedRow(0),iBCList_stock_no))
        grdItem.SetGridText(lRow,8,grdPrintBCList.GetGridData(ctr1.SelectedRow(0),iBCList_stock_adjd_pk))
        grdPrintBCList.RemoveRowAt(grdPrintBCList.GetGridControl().SelectedRow(0))
    }
}
</script>

<body>
     <!------------------------------------------------------------------>
    <gw:data id="fpbp00071_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  function="prod.sp_sel_fpbp00071_1" > 
                <input> 
                    <input bind="txtStockAdj_pk" /> 
                </input> 
                <output bind="grdItem" /> 
            </dso> 
        </xml> 
    </gw:data>
      <!------------------------------------------------------------------>
      <gw:data id="fpbp00071_2" onreceive="OnDataReceive(this)"> 
            <xml> 
                <dso id="1" type="grid"  function="prod.sp_sel_fpbp00071_2"> 
                    <input bind="grdSOD" > 
                        <input bind="idList" /> 
                        <input bind="dtFromDate" /> 
                        <input bind="dtToDate" />  
                        <input bind="txtSoNo" />
                        <input bind="chkBalance" />
                     </input> 
                    <output bind="grdSOD" /> 
                </dso> 
            </xml> 
        </gw:data>
       <!------------------------------------------------------------------>
    <gw:data id="fpbp00071_3" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="prod"  function="prod.sp_sel_fpbp00071_3"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28"  procedure="prod.sp_upd_fpbp00071_3" > 
                <input> 
                    <input bind="txtStockAdj_pk" /> 
                </input> 
                <output bind="grdPrintBCList" /> 
            </dso> 
        </xml> 
    </gw:data>
      <!------------------------------------------------------------------>
    <gw:data id="fpbp00071_4" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="prod.sp_upd_fpbp00071_4" > 
                <input>
                    <input bind="txtStockAdj_pk" /> 
                    <input bind="txtEmp_pk" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>            
            </dso> 
        </xml> 
    </gw:data>
     
    <table width="100%" style=" height:100%" border=1>
        <tr>
            <td colspan=2>
                <table>
                    <tr>
                         <td style="width: 10%">
                              <gw:list id="idList" styles="color:blue;width:100%" value="O" onchange="OnSearch(1)" />
                         </td>
                        <td style="width: 6%;border-width:0" align="right">
                            Date
                        </td>
                        <td style="width: 8%;border-width:0" align="right" >
                            <gw:datebox id="dtFromDate" lang="1" styles="width:100%" />
                        </td>
                        <td style="width: 3%;border-width:0" align="center">
                        ~
                        </td>
                        <td style="width: 8%;border-width:0" align="right">
                            <gw:datebox id="dtToDate" lang="1" styles="width:100%" />
                        </td>     
                         <td width="5%" style="border-width:0" align="right">
                            <b>SO No </b>
                        </td>
                        <td width="10%" style="border-width:0">
                            <gw:textbox id="txtSoNo" styles="width:100%" />
                        </td>    
                         <td width="5%" align="right" style="border-width:0">
                            <b>Balance</b>
                        </td>
                        <td style="width: 4%" align="right" style="border-width:0">
                        <gw:checkbox id="chkBalance" defaultvalue="Y|N" value="Y" />
                        </td>
                        <td width="5%" align="right" style="border-width:0;border-right-width:0">
                            <gw:imgbtn img="new" alt="Add Item to Print Barcode" id="btnNew" onclick="OnAdd()" />
                        </td>
                        <td width="5%" align="right" style="border-width:0;border-right-width:0">
                            <gw:imgbtn img="search" alt="Search SO detail" id="btnSearch" onclick="OnSearch()" />
                        </td>
          
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td  style=" height:5%;border-width:0">
                  Item List
            </td>
            <td  style="border-width:0" >
                   Sale order Details List
            </td>        
        </tr>
        <tr>
            <td style=" height:40%;width:30% " >
                            <gw:grid id='grdItem'
                            header='_ITEM_PK|Seq|Item Code|Item Name|UOM|Qty|_LOT_NO_PK|_Stock No|_pk|_tin_wh_pk'
                            format='0|0|0|0|1|0|0|0|0'
                            aligns='0|0|0|0|0|0|0|0|0'
                            defaults='||||||||'
                            editcol='0|0|0|0|0|0|0|0|0'
                            widths='0|500|1500|2500|1000|1500|0|0|0'
                            sorting='T'
                            styles='width:100%; height:100%'
                            oncellclick="FindItem()"
                            />
            </td>
            <td style=" height:40%;width:70% " >
                        <gw:grid id='grdSOD'
                            header='_PK|Order No|_ITEM_PK|Item Code|Item Name|UOM|Order Qty|Status|ETD|ETA|BC_Qty|Prod Qty|T/O Qty|Description'
                            format='0|0|0|0|0|0|1|0|4|4|1|1|1|0'
                            aligns='0|0|0|0|0|1|0|0|0|0|0|0|0|0'
                            defaults='|||||||||||||'
                            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                            widths='0|1500|0|1500|2500|1200|1500|1500|1200|1200|1500|1500|1500|1500'
                            sorting='T'
                            styles='width:100%; height:100%'     />
            </td>
        <tr/>

        <tr style=" height:5%;border-width:0">
            <td colspan=2>
                <table>
                    <tr>
                         <td >Print Items List</td>
                         <td width="5%" align="right" style="border-width:0;border-right-width:0">
                            <gw:imgbtn img="delete" alt="Delete" id="btnDelete" onclick="OnDetlete()" />
                        </td>
                        <td width="5%" align="right" style="border-width:0;border-right-width:0">
                            <gw:icon text="Create Barcode" id="btnCreateBC" onclick="Process()" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style=" height:40%;">
                <td  style=" height:80%" colspan=2>
                         <gw:grid id="grdPrintBCList" header="_PK|_Print Date|_PRINT_EMP_PK|_EMP|_Print Type|_tco_item_pk|Item Code|Item Name|UOM|Print Qty|_Batch Num|Lot Qty|Lot UOM|Print times|Description|_SaleOrderD_pk|Stock No|_tpr_lotno_pk|SO Num|Holding Period|Att03|att04|att05|att06|att07|att08|att09|att10|_adjust_detail_pk|_seq|_tin_wh_pk"
                            format="0|4|0|0|0|0|0|0|0|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                            aligns="0|0|0|0|0|0|0|0|1|3|0|3|1|3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                            defaults="|||||||||||||||||||||||||||||" 
                            editcol="0|1|0|1|0|0|0|0|0|1|1|1|1|1|1|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1"
                            widths=" 1000|1000|1000|1000|1000|1000|1500|2500|800|1000|1000|1000|800|1000|1200|1000|1500|1200|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|0|0"
                            styles="width:100%; height:100%" sorting="T" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28"
                            oncellclick="OnSearch(4)" onafteredit="CheckValid()" oncelldblclick="OnPopUp('grdPrintBCList')" />
               </td>
        </tr>
    </table>
    <gw:textbox id="txtPartnerPK" style="display: none" />
    <gw:textbox id="txtPur_YN" style="display: none" />
    <gw:textbox id="txtStockAdj_pk" style="display: none" />
    <gw:textbox id="txtEmp_pk" style="display: none" />
    <gw:textbox id="txtReturnValue" style="display: none" />
</body>
</html>
