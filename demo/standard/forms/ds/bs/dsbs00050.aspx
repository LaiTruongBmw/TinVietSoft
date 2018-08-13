<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>SO HISTORY</title>
</head>

<script>

    var  user_pk    = "<%=Session("EMPLOYEE_PK")%>" ;
  //  var  user_code = "<%=Session("USER_ID")%>" ;
    var  user_name  = "<%=Session("USER_NAME")%>" ;
        
    var  vLoginLevel        =  1;
        
    var iCol_G1_SO_pk         = 4 ,
        iCol_G2_SO_detail_pk  = 4 ;
      
 //---------------------------------------------------------
 function OnToggle()
 {
    var left  = document.all("left");    
    var right = document.all("right");   
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="75%";
        imgArrow.src = "../../../../system/images/prev_orange.gif";
    }
 }

 //---------------------------------------------------------
 function BodyInit()
 {
    System.Translate(document); 
   BindingDataList();
 }
 
 //---------------------------------------------------------
 function FormatGrid()
 {
      var trl
      trl=grdDetail.GetGridControl();	
      trl.ColFormat(iCol_ST_Qty )           = "###,###,###,###,###.###";
      trl.ColFormat(iCol_Ord_Qty)           = "###,###,###,###,###.###";
      trl.ColFormat(iCol_UP)                = "###,###,###,###,###.###";
      trl.ColFormat(iCol_Tax)               = "###,###,###,###,###.###";
      trl.ColFormat(iCol_Amount)            = "###,###,###,###,###.###";
      trl.ColFormat(iCol_Deli_Req)          = "###,###,###,###,###.###";
      trl.ColFormat(iCol_Deli_Plan )        = "###,###,###,###,###.###";
      trl.ColFormat(iCol_Prod_Plan_Qty)     = "###,###,###,###,###.###";
      trl.ColFormat(iCol_TO)                = "###,###,###,###,###.###";
      trl.ColFormat(iCol_Prod_Qty)          = "###,###,###,###,###.###";
 }
 
  //---------------------------------------------------------
 function BindingDataList()
 {    
        var data="";    
        data = "<%=CtlLib.SetListDataFUNC("SELECT comm.F_COMMONCODE('SAAB0080','','') FROM DUAL" )%>";    
        lstOrderStatus1.SetDataText(data);
        
        grdHistSO.GetGridControl().FrozenCols = 6
        grdHistSOD.GetGridControl().FrozenCols = 6
  }        
 
 //---------------------------------------------------------
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
        case 1 ://search saleorder
            dsbs00050.Call("SELECT");
        break;
        case 2: //search master history
        {
            txtOrderPK.text = grdSearch.GetGridData(event.row,0)
            dsbs00050_1.Call("SELECT");
        }
      }  
 }

 //---------------------------------------------------------
 function OnDataReceive(obj)
 {
    if(obj.id=="dsbs00050_1")
    {
        SetHightLight(grdHistSO)
        dsbs00050_2.Call("SELECT")
    }
    if(obj.id=="dsbs00050_2")
    {
        SetHightLight(grdHistSOD)
    }
 }
//------------------------------------------------------------------------------
function SetHightLight(grid)
{
    var vNewItem = 0
    var col, color,next,cur; 
    if (grid.id=="grdHistSO")
    {
        col = iCol_G1_SO_pk
    }else
    {
       col = iCol_G2_SO_detail_pk
    }
    
    for ( var i = 1 ; i < grid.rows - 1 ; )
        {
             cur = i;
             next = i+1;
             if(vNewItem % 2 ==0)
                    {
                        color = 0xCCFFFF;
                    }else
                    {
                        color = 0xCCFFCC;
                    }
             while(grid.GetGridData(cur, col)== grid.GetGridData(next,col))// if same so or same so detail
             {    
                   grid.GetGridControl().Cell( 6 , next , 0 , next, grid.cols - 1) = color;
                   for ( var j = 1; j <= grid.cols - 1 ; j++)
                        {
                            if ( grid.GetGridData( next, j) != grid.GetGridData( i, j) )
                            {
                                 grid.SetCellBold( next, j, next, j, true);
                                 grid.GetGridControl().Cell( 7 , next , j ,next,j ) = 0x3300cc;
                            }
                        }
                    next ++;
                    if (next > grid.rows - 1)
                    break;
             }
             i = next;
             vNewItem = vNewItem +1
        }
}

</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00050" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" function="sale.sp_sel_dsbs00050"   > 
                <input> 
                    <input bind="txtPOSONo" /> 
                    <input bind="dtFromOrderDate" /> 
                    <input bind="dtToOrderDate" /> 
                    <input bind="lstOrderStatus1" /> 
                </input> 
                <output bind="grdSearch" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00050_1" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" function="sale.sp_sel_dsbs00050_1"   > 
                <input> 
                    <input bind="txtOrderPK" /> 
                </input> 
                <output bind="grdHistSO" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00050_2" onreceive="OnDataReceive(this)"> 
        <xml>                                                               
            <dso id="1" type="grid" user="sale" function="sale.sp_sel_dsbs00050_2"   > 
                <input> 
                    <input bind="txtOrderPK" /> 
                </input> 
                <output bind="grdHistSOD" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <form id="form1" runat="server">
        <table style="width: 100%; height: 100%" border="1">
            <tr style="height: 100%">
                <td id='left' style="width: 25%">
                    <table style="width: 100%; height: 100%" border="0">
                        <tr style="height: 2%">
                            <td align="right" style="width: 30%">
                                <b>Date</b>
                            </td>
                            <td style="width: 79%; white-space: nowrap">
                                <gw:datebox id="dtFromOrderDate" lang="1" styles="width:100%" />
                                ~<gw:datebox id="dtToOrderDate" lang="1" styles="width:100%" />
                            </td>
                            <td style="width: 1%" align='right'>
                                <gw:button id="btnOrderNoSearch" img="search" onclick='OnSearch(1)' />
                            </td>
                        </tr>
                        <tr style="height: 2%">
                            <td align="right" style="width: 30%">
                                <b>PO/SO No</b></td>
                            <td colspan="2">
                                <gw:textbox id="txtPOSONo" csstype="mandatory" styles="width:100%" onenterkey="OnSearch(1)" />
                            </td>
                        </tr>
                        <tr style="height: 2%">
                            <td align="right" style="width: 30%">
                                Status
                            </td>
                            <td colspan="2">
                                <gw:list id="lstOrderStatus1" styles='width:100%' onchange="OnSearch(1)" />
                            </td>
                        </tr>
                        <tr style="height: 94%">
                            <td colspan="3">
                                <gw:grid id="grdSearch" header="_PK|SO No|Order DT|PO No" format="0|0|0|0" aligns="0|0|1|0"
                                    defaults="|||" editcol="0|0|0|0" widths="0|1500|1200|1000" styles="width:100%; height:100%"
                                    sorting="T" acceptnulldate="true" param="0,1,2,3" oncellclick="OnSearch(2)" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td id='right' style="width: 75%">
                    <table style="width: 100%; height: 100%">
                        <tr style="height: 40%">
                            <td>
                                <gw:grid id="grdHistSO" header="Crt Date|Crt By|Description|_PK|_hi_tsa_saleorder_pk|_tsa_so_revision_pk|Notes|Order Date|Slip No|Odr status|_BILL_TO_PK|Bill To Id|Bill To Name|_DELI_TO_PK|Deli To Id|Deli To Name|Deli Method|Deli Term|_DELI_LOC_PK|Deli Loc|Ex Nation|Dest Nation|PO No|Export|Dest Port|Description|Sale Type|Ccy Unit|_EMP_PK|Emp Id|Emp Name|Tax Rate|Oder Type|Pay Form|Sale Rep|Ord Priority|Pay Term|Buy Rep|Ord AMT|Total AMT|ETD|ETA|Exchange Rate|Price Type|Stock Type|Att01|Att02|Att03|Att04|Att05|Att06|Att07|_hightlight|Remark"
                                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|1|1|0|0|1|0|0|0|0|0|0|0|0|0|0|0'
                                    aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    widths='2000|1200|2000|0|0|0|2000|1200|1500|1500|0|1500|2500|0|1500|2500|1500|1500|0|1500|1500|1500|1500|1500|1500|2000|1500|1000|0|1500|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1200|1200|1500|1500|1500|1000|1000|1000|1000|1000|1000|1000|0|1000'
                                    sorting='F' styles='width:100%; height:100%' />
                            </td>
                        </tr>
                        <tr style="height: 60%">
                            <td>
                                <gw:grid id="grdHistSOD" header='Crt Date|Crt By|Description|_PK|_TSA_SALEORDERD_PK|_TSA_SALEORDER_PK|_tsa_sod_revision_pk|Notes|So Item No|_Seq Num|_TCO_ITEM_PK|Item Code|Item Name|Cust Item NM|ST Order Qty|ST Unit|Order Qty|Item Unit|Unit Price|Vate Rate|Amount|Ord Item Type|Deli Item Method|Item ETD|Item ETA|T/O Req Qty|T/O Plan Qty|Prod Plan Qty|T/O Qty|Prod Qty|Description|Ord Item Status|Att01|Att02|Att03|Att04|Att05|Att06|Att07|Att08|Att09|Att10|Att11|_hightlight|Remark'
                                    format='0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|1|0|1|1|1|0|0|0|0|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|1|0|0|0|0|0|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    widths='2000|1200|2000|0|0|0|0|2000|1500|1000|0|1500|2500|2000|1500|1000|1500|1000|1500|1500|1500|1500|1500|1200|1200|1500|1500|1500|1500|1500|2000|1500|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|0|1000'
                                    sorting='F' styles='width:100%; height:100%' />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
    <!------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <!------------------------------------------->
    <gw:textbox id="txtOrderPK" maxlen="100" styles='width:100%;display:none' />
    <!------------------------------------------->
</body>
</html>
