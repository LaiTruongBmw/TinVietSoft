<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>General Report</title>
</head>
<%  ESysLib.SetUser("inv")%>

<script>

var G3_Lot_No = 4 ;
//----------------------------------------------------------------------------------------

function BodyInit()
{
    //----------------
    var now = new Date(); 
    var lmonth, ldate;
    
    ldate = dtFrom_Ledger.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom_Ledger.value=ldate ;
    dtFrom_Monthly.value=ldate ;
    dtFrom_Ledger1.value=ldate;
    
    //----------------
    Include_Stock_No.style.display = "none" ;
    //----------------
    grdLedger.GetGridControl().FrozenCols  = 5 ;
    //----------------
    BindingDataList();
    SetGridFormat();
    //----------------    
}

//----------------------------------------------------------------------------------------

function BindingDataList()
{
    var data = "";
    //-----------------    
    
    data = "<%=ESysLib.SetGridColumnDataSQL("SELECT 'IN-' || code, code_nm FROM sale.lg_code a, sale.lg_code_group b WHERE a.lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGIN0050' AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 UNION SELECT 'OUT-' || code, code_nm FROM sale.lg_code a, sale.lg_code_group b WHERE a.lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGIN0060' AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 " ) %> ";       
    grdLedger.SetComboFormat(0,data);
    //-----------------    

    data = "<%=ESysLib.SetListDataSQL("select pk, grp_cd || '-' || grp_nm from comm.tco_itemgrp where del_if = 0 and use_yn = 'Y'")%>|ALL|Select ALL"; 
    
    lstGroup_Ledger.SetDataText(data);
    lstGroup_Ledger.value = 'ALL';
    lstGroup_Monthly.SetDataText(data);
    lstGroup_Monthly.value = 'ALL';
    //-----------------
    data = "<%=ESysLib.SetListDataFUNC("SELECT comm.F_LOGISTIC_CODE('LGIN0030') FROM DUAL" )%>|ALL|Select ALL";    
    lstWHType_Ledger.SetDataText(data);
    lstWHType_Ledger.value = 'ALL';
    lstWHType_Ledger1.SetDataText(data);
    lstWHType_Ledger1.value = 'ALL';
    lstWHType_Monthly.SetDataText(data);
    lstWHType_Monthly.value = 'ALL'; 
    //-----------------
    data = "<%=ESysLib.SetListDataSQL("select pk, wh_id || '-' || wh_name from inv.TIN_WAREHOUSE where del_if = 0 and use_yn='Y' order by wh_id ")%>|ALL|Select ALL"; 
    
    lstWH_Ledger.SetDataText(data);
    lstWH_Ledger.value = 'ALL';
    lstWH_Ledger1.SetDataText(data);
    lstWH_Ledger1.value = 'ALL';
    lstWH_Monthly.SetDataText(data);
    lstWH_Monthly.value = 'ALL';
    //-----------------
    
    data = "<%=ESysLib.SetListDataSQL(" SELECT 'IN-' || code, code_nm FROM sale.lg_code a, sale.lg_code_group b WHERE a.lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGIN0050' AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0 UNION SELECT 'OUT-' || code, code_nm FROM sale.lg_code a, sale.lg_code_group b WHERE a.lg_code_group_pk = b.pk AND b.GROUP_ID = 'LGIN0060' AND a.use_if = 'Y' AND a.del_if = 0 AND b.del_if = 0")%>|ALL|Select ALL"; 
    lstTransType_Ledger.SetDataText(data);
    lstTransType_Ledger.value = 'ALL' ;
    lstTransType_Ledger1.SetDataText(data);
    lstTransType_Ledger1.value = 'ALL' ;
    //-----------------
    
}

//---------------------------------------------------------------------------------------------------

function SetGridFormat()
{
    var ctr1 = grdLedger.GetGridControl(); 
    
    ctr1.ColFormat(8)  = "#,###,###,###,###,###.##";   

    ctr1.MergeCells  = 2 ;	
    ctr1.MergeCol(0) = true ;	
    ctr1.MergeCol(1) = true ;   	
    ctr1.MergeCol(2) = true ;	
    ctr1.MergeCol(3) = true ;	
    
    var ctr2 = grdMonthly1.GetGridControl(); 
    ctr2.ColFormat(4)  = "#,###,###,###,###,###.##";
    ctr2.ColFormat(5)  = "#,###,###,###,###,###.##";
    ctr2.ColFormat(6)  = "#,###,###,###,###,###.##";
    ctr2.ColFormat(7)  = "#,###,###,###,###,###.##";
    
    ctr2.MergeCells  = 2 ;	
    ctr2.MergeCol(0) = true ;    
    
    ctr2 = grdMonthly2.GetGridControl();
    ctr2.ColFormat(5)  = "#,###,###,###,###,###.##";
    ctr2.ColFormat(6)  = "#,###,###,###,###,###.##";
    ctr2.ColFormat(7)  = "#,###,###,###,###,###.##";
    ctr2.ColFormat(8)  = "#,###,###,###,###,###.##";
    
    ctr2.MergeCells  = 2 ;	
    ctr2.MergeCol(0) = true ;          
}

//---------------------------------------------------------------------------------------------------

function OnSearch(obj)
{
    switch(obj)
    {
        case '1':
           fpbp00080_4.Call('SELECT');
        break;
        case '3':
            if ( chkIncludeStockNo.value == 'N' )
            {
                 fpbp00080_2.Call('SELECT');  
            }
            else
            {
                 fpbp00080_3.Call('SELECT');
            }
        break;
       case '4':
            if(txtItemCode_Ledger1.text == "")
            {
                alert("Please input item code for searching.");
                return;
            }            
            fpbpItem00080_5.Call('SELECT');
        break;         
    }
}

//---------------------------------------------------------------------------------------------------

function OnPrint(obj)
{
    switch(obj)
    {
        case 'Monthly':
            var url =System.RootURL + '/reports/fp/bp/fpbp00080_Monthly.aspx?p_from_date='+ dtFrom_Monthly.value
            + '&p_to_date=' + dtTo_Monthly.value 
            + '&p_tin_warehouse_pk=' + lstWH_Monthly.value
            + '&p_tco_itemgrp_pk=' + lstGroup_Monthly.value
            + '&p_item=' + txtItem_Monthly.text;
            System.OpenTargetPage(url , 'newform');
        break;
        
        case '2':
            var url =System.RootURL + '/reports/ep/gm/epgm00030_2.xls?from_date=' + dtFrom_Monthly.value 
            + '&to_date=' + dtTo_Monthly.value 
            + '&wh_pk=' + lstWH_Monthly.value 
            + '&item_group_pk=' + lstGroup_Monthly.value 
            + '&item_code=' + txtItem_Monthly.text
            + '&trans_type=' + lstTransType_Monthly.value
            + '&warehouse=' + lstWH_Monthly.GetText() 
            + '&group=' + lstGroup_Monthly.GetText();
            window.open(url);
        break;
    }
}

//---------------------------------------------------------------------------------------------------

function OnGetItem(obj)
{
    switch(obj)
    {
        case '1':
            // var fpath = System.RootURL + "/form/fp/ab/fpab00110.aspx?group_type=Y|||||";
            var fpath = System.RootURL + "/form/fp/ab/fpab00110_tree.aspx";
            oValue = System.OpenModal( fpath , 900 , 550, 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {
                    txtItemPK_Ledger.SetDataText(oValue[0]);
                    txtItem_Ledger.SetDataText(oValue[1]);
            }
        break;
        
        case '2':
           // var fpath = System.RootURL + "/form/fp/ab/fpab00110.aspx?group_type=Y|||||";
            var fpath = System.RootURL + "/form/fp/ab/fpab00110_tree.aspx";
            oValue = System.OpenModal( fpath , 900 , 550, 'resizable:yes;status:yes');    
            
            if ( oValue != null )
            {
                    txtItemPK_Monthly.SetDataText(oValue[0]);
                    txtItem_Monthly.SetDataText(oValue[1]);
            }
        break;
        case '3':
            // var fpath = System.RootURL + "/form/fp/ab/fpab00110.aspx?group_type=Y|||||";
            var fpath = System.RootURL + "/form/fp/ab/fpab00110_tree.aspx";
            oValue = System.OpenModal( fpath , 900 , 550, 'resizable:yes;status:yes');
            
            if ( oValue != null )
            {
                    txtItemPK_Ledger.SetDataText(oValue[0]);
                    txtItemCode_Ledger1.SetDataText(oValue[1]);
                    txtItemName_Ledger1.SetDataText(oValue[2]);
            }
        break;
    }
}
function OnPopup(obj)
{       var fpath = System.RootURL + "/form/fp/ab/fpab00240.aspx";
        oValue = System.OpenModal( fpath , 900 , 550, 'resizable:yes;status:yes');
          
    switch(obj)
    {
        case '1':
               if ( oValue != null )
            {
                    lstWH_Ledger1.value=oValue[0];
           }
        break;
        
        case '2':
             
            if ( oValue != null )
            {
                    lstWH_Ledger.value =oValue[0];
             }
        break;
        case '3':
              
            if ( oValue != null )
            {
                    lstWH_Monthly.value=oValue[0];
              }
        break;
    }
}
//---------------------------------------------------------------------------------------------------

function ReceiveData(obj)
{
    switch(obj.id)
    {
        //case 'fpbp00080_4':
        //break;
        case 'fpbpItem00080_5':
            if(grdItemLedger.rows > 1)
            {
                txtItemName_Ledger1.text=grdItemLedger.GetGridData(1,8);
                lblBeginQty.text='Begin :'+grdItemLedger.GetGridData(1,9);
                grdItemLedger.Subtotal( 0, 2,-1, '5!6');
                grdItemLedger.SetGridText( grdItemLedger.rows-1, 7,   grdItemLedger.GetGridData( grdItemLedger.rows-2, 7));
            }
        break;
        case 'fpbp00080_2':
            lblRecord_Monthly.text = grdMonthly1.rows -1 + " record(s)";
            grdMonthly1.Subtotal( 1, 2,-1, '4!5!6!7!9!10!11');
        break; 
        case 'fpbp00080_3':
             lblRecord_Monthly.text = grdMonthly2.rows -1 + " record(s)";
          grdMonthly2.Subtotal( 1, 2,-1, '5!6!7!8');
            if ( grdMonthly2.rows > 1 )
            {
                grdMonthly2.SetCellBgColor( 1, G3_Lot_No, grdMonthly2.rows - 1, G3_Lot_No, 0xCCFFFF );
            }    
        break;
                
    }
}

//---------------------------------------------------------------------------------------------------

function OnChangeGridFormat()
{
    chkIncludeStockNo.value=='N'?Include_Stock_No.style.display="none":Include_Stock_No.style.display="";   
    chkIncludeStockNo.value=='N'?NotInclude_Stock_No.style.display="":NotInclude_Stock_No.style.display="none";
    OnSearch('In-Out-Monthly');
}
//---------------------------------------------------------------------------------------------------


</script>

<body>
    <!---------------------------------------------------------------->
    <gw:data id="fpbp00080_4" onreceive="ReceiveData(this)"> 
        <xml> 
            <dso id="1" type="grid" function="inv.sp_sel_fpbp00080_4" >  
                <input> 
                    <input bind="dtFrom_Ledger" />
                    <input bind="dtTo_Ledger" />
                    <input bind="lstWH_Ledger" />
                    <input bind="lstGroup_Ledger" />
                    <input bind="txtItem_Ledger" />
                    <input bind="lstTransType_Ledger" />
                </input> 
                <output bind="grdLedger" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="fpbp00080_2" onreceive="ReceiveData(this)"> 
        <xml> 
            <dso id="1" type="grid" function="inv.sp_sel_fpbp00080_2" > 
                <input> 
                    <input bind="dtFrom_Monthly" />
                    <input bind="dtTo_Monthly" />
                    <input bind="lstWH_Monthly" />
                    <input bind="lstGroup_Monthly" />
                    <input bind="txtItem_Monthly" />
                </input> 
                <output bind="grdMonthly1" /> 
            </dso> 
        </xml> 
    </gw:data>
   
    <!---------------------------------------------------------------->
    <gw:data id="fpbp00080_3" onreceive="ReceiveData(this)"> 
        <xml> 
            <dso id="1" type="grid" function="inv.sp_sel_fpbp00080_3" > 
                <input> 
                    <input bind="dtFrom_Monthly" />
                    <input bind="dtTo_Monthly" />
                    <input bind="lstWH_Monthly" />
                    <input bind="lstGroup_Monthly" />
                    <input bind="txtItem_Monthly" />
                </input> 
                <output bind="grdMonthly2" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="fpbp00080_5" onreceive=""> 
        <xml> 
            <dso  type="list" procedure="inv.sp_pro_fpbp00080" > 
                <input>
                    <input bind="lstWHType_Ledger" /> 
                </input> 
                <output>
                    <output bind="lstWH_Ledger" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="fpbp00080_6" onreceive=""> 
        <xml> 
            <dso  type="list" procedure="inv.sp_pro_fpbp00080" > 
                <input>
                    <input bind="lstWHType_Monthly" /> 
                </input> 
                <output>
                    <output bind="lstWH_Monthly" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <gw:data id="fpbpItem00080_5" onreceive="ReceiveData(this)"> 
        <xml> 
            <dso id="1" type="grid" function="inv.sp_sel_fpbp00080_5" > 
                <input> 
                    <input bind="dtFrom_Ledger1" />
                    <input bind="dtTo_Ledger1" />
                    <input bind="lstWH_Ledger1" />
                    <input bind="txtItemCode_Ledger1" />
                    <input bind="txtItem_SlipNo" />
                    <input bind="lstTransType_Ledger1" />
                </input> 
                <output bind="grdItemLedger" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------->
    <table style="height: 100%; width: 100%">
        <tr valign="top" style="height: 100%">
            <td style="width: 100%">
                <gw:tab id="idTab" style="width: 100%; height: 100%">
                <table style="height: 100%; width: 100%" border="1" name="Item In/Out Ledger">
                    <tr style="height: 1%">
                        <td>
                            <table style="height: 100%; width: 100%">
                                <tr style="height: 50%">
                                    <td style="width: 10%" align="right">
                                        Date</td>
                                    <td style="width: 20%" align="left">
                                        <gw:datebox id="dtFrom_Ledger1" lang="<%=Application("Lang")%>" />
                                        ~<gw:datebox id="dtTo_Ledger1" lang="<%=Application("Lang")%>" />
                                    </td>
                                    
                                    <td style="width: 10%" align="right">
                                        Trans.Type
                                    </td>
                                    <td style="width: 18%" align="center">
                                        <gw:list id="lstTransType_Ledger1" styles="width:100%" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        Slip No</td>
                                    <td style="width: 27%" colspan="2">
                                        <gw:textbox id="txtItem_SlipNo" styles="width:100%;" />
                                    </td>
                                    <td colspan="2"></td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnSearch_2" img="search" alt="Search" text="Search" onclick="OnSearch('4')" />
                                    </td>
                                    <td style="width: 1%">
                                        <gw:imgbtn id="btnPrint_2" img="excel" alt="Print" text="Print" onclick="OnPrint('Monthly')" />
                                    </td>
                                </tr>
                                <tr style="height: 50%">
                                    <td style="width: 10%;display:none" align="right">
                                        W/H Type</td>
                                    <td style="width: 20%;display:none">
                                        <gw:list id="lstWHType_Ledger1" styles="width:100%" onclick="fpbp00080_5.Call('SELECT')"/>
                                    </td>
                                    <td style="width: 5%" align="right">
                                        <b style="color: Blue; cursor: hand" onclick="OnPopup('1')">W/H</b></td>
                                    <td style="width: 20%">
                                        <gw:list id="lstWH_Ledger1" styles="width:100%" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        <b style="color: Blue; cursor: hand" onclick="OnGetItem('3')">Item</b></td>
                                    <td style="width: 25%" colspan="4">
                                        <gw:textbox id="txtItemCode_Ledger1" styles="width:30%;" />
                                        <gw:textbox id="txtItemName_Ledger1" styles="width:70%;" />
                                    </td>
                                    </td>
                                    <td style="width: 8%" align="right">
                                        <gw:label id="lblBeginQty" styles="color: blue"> BeginQty</gw:label>
                                    </td>
                                 </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td>
                            <!-- <gw:grid id="grdLedger" header="Date|Slip No|Client/Line/Project|Incoming|Outcoming|Out to Line|In from Line|Line Return|Supplier Return|Customer Return|Adjust|Move Out|Move In|Other In|Other Out|Current|Ware house|_tin_stocktr_pk|_End Bal"
                                format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|3|3|3|3|3|0|0|3|3|3|3|3|3|0|0|3"
                                defaults="||||||||||||||||||" editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
                                widths="1200|1100|2000|0|0|0|1300|1100|1500|1600|0|0|0|0|0|0|2000|0|0" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" /> -->
                            <gw:grid id='grdItemLedger' header='Warehouse|Stock Date|Slip No|_Lot No|Trans Type|Input Qty|Output Qty|Last Balance|_Item Name|_l_begin_qty'
                                format='0|4|0|0|0|0|0|0|0|0' aligns='0|0|0|0|0|3|3|3|0|0' defaults='|||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0' autosize="true"
                                widths='2500|1200|1400|1100|1000|1000|1500|800|0|0'
                                sorting='T' styles="width:100%; height:100%" />
                        </td>
                    </tr>
                </table>
                <table style="height: 100%; width: 100%" border="1" name="In/Out Ledger" id="TabInOutLedger">
                    <tr style="height: 1%">
                        <td>
                            <table style="height: 100%; width: 100%">
                                <tr style="height: 50%">
                                    <td style="width: 10%" align="right">
                                        Date</td>
                                    <td style="width: 20%" align="left">
                                        <gw:datebox id="dtFrom_Ledger" lang="<%=Application("Lang")%>" />
                                        ~<gw:datebox id="dtTo_Ledger" lang="<%=Application("Lang")%>" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        Group</td>
                                    <td style="width: 20%">
                                        <gw:list id="lstGroup_Ledger" styles="width:100%;" />
                                    </td>
                                    <td style="width: 10%" align="right">
                                        Trans. Type
                                    </td>
                                    <td style="width: 20%" align="center">
                                        <gw:list id="lstTransType_Ledger" styles="width:100%" />
                                    </td>
                                    <td style="width: 8%">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnSearch_1" img="search" alt="Search" text="Search" onclick="OnSearch('1')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnPrint_1" img="excel" alt="Print" text="Print" onclick="OnPrint('Monthly')" />
                                    </td>
                                </tr>
                                <tr style="height: 50%">
                                    <td style="width: 10%" align="right">
                                        W/H Type</td>
                                    <td style="width: 20%">
                                        <gw:list id="lstWHType_Ledger" styles="width:100%" onclick="fpbp00080_5.Call('SELECT')"/>
                                    </td>
                                    <td style="width: 5%" align="right">
                                        <b style="color: Blue; cursor: hand" onclick="OnPopup('2')">W/H</b></td>
                                    <td style="width: 20%">
                                        <gw:list id="lstWH_Ledger" styles="width:100%" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        <b style="color: Blue; cursor: hand" onclick="OnGetItem('1')">Item</b></td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtItem_Ledger" styles="width:100%;" />
                                    </td>
                                    <td style="width: 20%" colspan="3" align="center">
                                        <gw:label id="lblRecord_Ledger" styles="color: blue">record(s)</gw:label>
                                    </td>
                                 </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td>
                            <!-- <gw:grid id="grdLedger" header="Date|Slip No|Client/Line/Project|Incoming|Outcoming|Out to Line|In from Line|Line Return|Supplier Return|Customer Return|Adjust|Move Out|Move In|Other In|Other Out|Current|Ware house|_tin_stocktr_pk|_End Bal"
                                format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|3|3|3|3|3|0|0|3|3|3|3|3|3|0|0|3"
                                defaults="||||||||||||||||||" editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
                                widths="1200|1100|2000|0|0|0|1300|1100|1500|1600|0|0|0|0|0|0|2000|0|0" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" /> -->
                            <gw:grid id='grdLedger' header='Trans Type|W/H|Date|Slip No|Item Code|Item name|UOM|Lot No|QTY|Description|_TABLE_NAME|_TABLE_PK'
                                format='0|0|4|0|0|0|0|0|0|0|0|0' aligns='0|0|1|0|0|0|1|0|3|0|0|0' defaults='|||||||||||'
                                editcol='0|0|0|0|0|0|0|0|0|0|0|0' autosize="true"
                                widths='2000|2000|1200|2000|2000|3000|800|1500|1500|1000|1000|1000'
                                sorting='T' styles="width:100%; height:100%" />
                        </td>
                    </tr>
                </table>
                <table style="height: 100%; width: 100%" border="1" name="Item In/Out Monthly" id="TabInOutMonthly">
                    <tr style="height: 1%">
                        <td>
                            <table style="height: 100%; width: 100%">
                                <tr style="height: 50%">
                                    <td style="width: 10%" align="right">
                                        Date</td>
                                    <td style="width: 20%" align="left">
                                        <gw:datebox id="dtFrom_Monthly" lang="<%=Application("Lang")%>" />
                                        ~<gw:datebox id="dtTo_Monthly" lang="<%=Application("Lang")%>" /></td>
                                    <td style="width: 5%" align="right">
                                        Group</td>
                                    <td style="width: 20%">
                                        <gw:list id="lstGroup_Monthly" styles="width:100%;" />
                                    </td>
                                    <td style="width: 25%" align="center" colspan="2">
                                        <gw:checkbox id="chkIncludeStockNo" styles="color:blue" defaultvalue="Y|N" value="N"
                                            onchange="OnChangeGridFormat()">Show Stock No</gw:checkbox>
                                    </td>
                                    <td style="width: 5%">
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnSearch_Monthly" img="search" alt="Search" text="Search" onclick="OnSearch('3')" />
                                    </td>
                                    <td style="width: 1%" align="right">
                                        <gw:imgbtn id="btnPrint_Monthly" img="excel" alt="Print" text="Print" onclick="OnPrint('Monthly')" />
                                    </td>
                                </tr>
                                <tr style="height: 50%">
                                    <td style="width: 10%" align="right">
                                        W/H Type</td>
                                    <td style="width: 20%">
                                        <gw:list id="lstWHType_Monthly" styles="width:100%" onclick="fpbp00080_6.Call('SELECT')" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                       <b style="color: Blue; cursor: hand" onclick="OnPopup('3')">W/H</b></td>
                                    <td style="width: 20%">
                                        <gw:list id="lstWH_Monthly" styles="width:100%" />
                                    </td>
                                    <td style="width: 5%" align="right">
                                        <b style="color: Blue; cursor: hand" onclick="OnGetItem('2')">Item</b></td>
                                    <td style="width: 20%">
                                        <gw:textbox id="txtItem_Monthly" styles="width:100%;" />
                                    </td>
                                    <td colspan="6">
                                        <gw:label id="lblRecord_Monthly" styles="color: blue">record(s)</gw:label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="height: 99%" id="NotInclude_Stock_No">
                        <td>
                            <gw:grid id="grdMonthly1" header="Ware house|Item Code|Item Name|UOM|Begin|Input|Output|End|Unit Weight|Total Weight|Price|Amount"
                                format="0|0|0|0|0|0|0|0|0|0|0|0" aligns="0|0|0|1|3|3|3|3|3|3|3|3" editcol="0|0|0|0|0|0|0|0|0|0|0|0" 
                                widths="2000|2000|5000|1000|1500|1500|1500|1500|1500|1500|1500|1500" autosize="true"
                                styles="width:100%; height:100%" sorting="T"  autosize="true"/>
                        </td>
                    </tr>
                    <tr style="height: 98%" id="Include_Stock_No">
                        <td>
                            <gw:grid id="grdMonthly2" header="Ware house|Item Code|Item Name|UOM|Lot No|Begin|Input|Output|End"
                                format="0|0|0|0|0|0|0|0|0" aligns="0|0|0|1|1|3|3|3|3" editcol="0|0|0|0|0|0|0|0|0" autosize="true"
                                widths="2000|2000|5000|1000|1500|1500|1500|1500|1500" styles="width:100%; height:100%"
                                sorting="T" param="0,1,2,3,4,5,6,7,8" autosize="true"/>
                        </td>
                    </tr>
                </table>
                </gw:tab>
               </td>
        </tr>
    </table>
</body>
<!------------------------------------------------------->
<gw:textbox id="txtItemPK_Ledger" styles="display: none" />
<gw:textbox id="txtItemPK_Monthly" styles="display: none" />
<gw:textbox id="txtBegin" styles="display: none" />
<gw:textbox id="txtRecords" styles="display: none" />
<gw:textbox id="txtPage" styles="display: none" />
<!------------------------------------------------------->
</html>
