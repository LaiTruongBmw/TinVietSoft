<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
    CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head runat="server">
    <title>SO Approve</title>
</head>

<script>
 
    var  user_pk =  "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>" ;
        //idGrid1
var     iColIssuer              = 2,
        iColMOrd_Qty            = 12,
        iColMOrd_QtyM           = 13,
        iColUnitPrice           = 18,
        iColMAmount             = 30,
        iColMReserved_Qty       = 31,
        iColMTake_Out_fromStock = 32,
        iColMFX_Rate            = 33,
        iColMVAT_Rate           = 35,
        iColItemStatus          = 37;
        //idGrid2
var     iColOrd_Qty             = 8,
        iColQrd_QtyM            = 9,
        iColUnit_Price          = 14,
        iColAmount              = 26,
        iColReserved_Qty        = 27,
        iColTake_Out_fromStock  = 28,
        iColFXRate              = 29,
        iColVATRate             = 31;
        //idGrid3
var     i3_Ord_Qty              = 12,
        i3_Ord_QtyM             = 13,
        i3_Amount               = 30,
        i3_Reserved_Qty         = 31,
        i3_Take_Out_fromStock   = 32,
        i3_FX_Rate              = 33,
        i3_VAT_Rate             = 35,
        i3_ItemStatus           = 37;        
 //---------------------------------------------------------
 function OnToggle()
 {
    var top  = document.all("top");    
    var imgArrow = document.all("imgArrow");   
    
    if(imgArrow.status == "expand")
    {
        top.style.display="none";       
        imgArrow.status = "collapse";
        imgArrow.src = "../../../../system/images/down.gif";
    }
    else
    {
        top.style.display="";
        imgArrow.status = "expand";
        imgArrow.src = "../../../../system/images/up.gif";
    }
 }
 
 //---------------------------------------------------------
 function BodyInit()
 {
    System.Translate(document); 
        idGrid1.GetGridControl().FrozenCols = 7;
        idGrid2.GetGridControl().FrozenCols = 5;
        //-----------------        
        txt_user_pk.text = user_pk;
        //-----------------
        //dtFrom.SetDataText(System.AddDate(dtTo.GetData(),-30));
        //-----------------
        BindingDataList();
        FormatGrid();
        //-----------------        
 } 

 //---------------------------------------------------------
 function BindingDataList()
 {         
    var sData="";
        
    sData = "DATA|O|Order Date|E|ETD";

    idList.SetDataText(sData);
    
        //--------------------------------------------------

    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM COMM.TCO_ABCODE a, COMM.TCO_ABCODEGRP b WHERE  b.ID='SAAB0080' AND a.TCO_ABCODEGRP_PK=b.PK and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM" ) %> ";       
    idGrid1.SetComboFormat(iColItemStatus,data);
    idGrid3.SetComboFormat(iColItemStatus,data);
    
    data = "data|ALL|Select ALL|1|1|2|2|3|3|4|4|5|5";
    lstSaleTeam.SetDataText(data);
    lstSaleTeam.value = 'ALL';
 }        
 
 
 //---------------------------------------------------------
 function OnSearch(pos)
 {
      switch (pos)         
      {		        
            case 1 :
                dsbs00013.Call("SELECT");
            break; 
            case 2 :
                dsbs00013_1.Call("SELECT");   
            break;     
            case 3:        
                dsbs00013_2.Call("SELECT");   
            break;     
      }  
 }

 //---------------------------------------------------------
 function OnDataReceive(po_oData)
 { 
      switch (po_oData.id)         
      {
            case "dsbs00013" :
                idGrid2.Refresh();
                dsbs00013_1.Call('SELECT');
                //add Total
                OnTotal();
            break;
            case "dsbs00013_1":
                idGrid3.Refresh();
                dsbs00013_2.Call('SELECT');
            break;            
      }  
 }
 
//------------------------------------------------------------------------------------------------
function OnSave(pos)
{
      switch (pos)         
      {	
            case 'Grid1' :
                dsbs00013.Call();
            break;
            case "Grid3":
                dsbs00013_2.Call();
      }          
}
 
//---------------------------------------------------------
 
 function OnExcel(pos)
 {
      switch (pos)         
      {		        
            case 'Approve' :

                var url =System.RootURL + '/standard/reports/ds/bs/dsbs00013.xls?dtApproveDate=' + dtApproveDate.value ;
                
		        System.OpenTargetPage(url);                 

            break;
            case 'SO_OTR' :
            
                var url =System.RootURL + '/standard/reports/ds/bs/dsbs00013_1.xls?idList=' + idList.value + '&dtFrom=' + dtFrom.value + '&dtTo=' + dtTo.value +'&txtOrderNo=' + txtOrderNo.text + '&txtItem=' + txtItem.text ;
                
		        System.OpenTargetPage(url);                 

            break;            
      }  
 }

//---------------------------------------------------------------

function OnApprove()
{
    for ( i = 1 ; i < idGrid1.rows ; i++ )
    {
        if ( idGrid1.GetGridControl().isSelected(i) == true )
        {

            idGrid1.SetGridText( i, iColItemStatus, '02') ;

        } 
    } 

}

//---------------------------------------------------------------
function FormatGrid()
{
    var ctrl ;
    
    ctrl = idGrid1.GetGridControl();
    
    ctrl.ColFormat(iColMOrd_Qty)            = "###,###,###.##" ;
    ctrl.ColFormat(iColMOrd_QtyM)           = "###,###,###.##" ;
    ctrl.ColFormat(iColMAmount)             = "###,###,###.##" ;
    ctrl.ColFormat(iColMReserved_Qty)       = "###,###,###.##" ;
    ctrl.ColFormat(iColMTake_Out_fromStock) = "###,###,###.##" ;    
    ctrl.ColFormat(iColMFX_Rate)            = "###,###,###.##" ;
    ctrl.ColFormat(iColMVAT_Rate)           = "###,###,###.##" ;
    ctrl.ColFormat(iColUnitPrice)           = "###,###,###.##" ;
    
    ctrl = idGrid2.GetGridControl();
    
    ctrl.ColFormat(iColOrd_Qty)             = "###,###,###.##" ;
    ctrl.ColFormat(iColQrd_QtyM)            = "###,###,###.##" ;
    ctrl.ColFormat(iColUnit_Price)          = "###,###,###.##" ;
    ctrl.ColFormat(iColAmount)              = "###,###,###.##" ;
    ctrl.ColFormat(iColReserved_Qty)        = "###,###,###.##" ;    
    ctrl.ColFormat(iColTake_Out_fromStock)  = "###,###,###.##" ;
    ctrl.ColFormat(iColFXRate)              = "###,###,###.##" ;
    ctrl.ColFormat(iColVATRate)             = "###,###,###.##" ; 
    
    ctrl = idGrid3.GetGridControl();
    
    ctrl.ColFormat(i3_Ord_Qty)            = "###,###,###.##" ;
    ctrl.ColFormat(i3_Ord_QtyM)           = "###,###,###.##" ;
    ctrl.ColFormat(i3_Amount)             = "###,###,###.##" ;
    ctrl.ColFormat(i3_Reserved_Qty)       = "###,###,###.##" ;
    ctrl.ColFormat(i3_Take_Out_fromStock) = "###,###,###.##" ;    
    ctrl.ColFormat(i3_FX_Rate)            = "###,###,###.##" ;
    ctrl.ColFormat(i3_VAT_Rate)           = "###,###,###.##" ;     
}
//---------------------------------------------------------------
function OnTotal()
{
    var i, ltotal1 = 0, ltotal2 = 0, ltotal3 = 0 ;
    for( i = 1; i < idGrid1.rows ; i++)
    {
        ltotal1 += parseFloat(idGrid1.GetGridData(i, iColMOrd_Qty));
        ltotal2 += parseFloat(idGrid1.GetGridData(i, iColMOrd_QtyM));
        ltotal3 += parseFloat(idGrid1.GetGridData(i, iColMAmount));
    }
    idGrid1.AddRow();
    idGrid1.SetGridText(i, iColIssuer,"TOTAL");
    idGrid1.SetCellBgColor(idGrid1.rows-1,0,idGrid1.rows-1,idGrid1.cols-1,0xA9EBD7);     
    idGrid1.SetGridText(idGrid1.rows - 1, iColMOrd_Qty,  ltotal1);
    idGrid1.SetGridText(idGrid1.rows - 1, iColMOrd_QtyM,  ltotal2);
    idGrid1.SetGridText(idGrid1.rows - 1, iColMAmount,  ltotal3);        
}
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00013" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"  parameter="1,37" function="sale.sp_sel_dsbs00013" procedure="sale.sp_upd_dsbs00013" > 
                <input> 
                    <input bind="idList" /> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
                    <input bind="txtOrderNo" />
                    <input bind="txtItem" />
                    <input bind="txtIssuer" />
                    <input bind="lstSaleTeam" />
                </input> 
                <output bind="idGrid1" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00013_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale" function="sale.sp_sel_dsbs00013_1" > 
                <input> 
                    <input bind="idList" /> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
                    <input bind="txtOrderNo" />
                    <input bind="txtItem" />
                    <input bind="txtIssuer" />
                    <input bind="lstSaleTeam" />
                </input> 
                <output bind="idGrid2" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="dsbs00013_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" user="sale"  parameter="1,37" function="sale.sp_sel_dsbs00013_2" procedure="sale.sp_upd_dsbs00013_2" > 
                <input> 
                    <input bind="idList" /> 
                    <input bind="dtFrom" /> 
                    <input bind="dtTo" />  
                    <input bind="txtOrderNo" />
                    <input bind="txtItem" />
                    <input bind="txtIssuer" />
                    <input bind="lstSaleTeam" />
                </input> 
                <output bind="idGrid3" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table width="100%">
        <tr>
            <td>
                <table width="100%">
                    <tr>
                        <td style="width: 10%">
                            <gw:list id="idList" styles="color:blue;width:100%" value="O" onchange="OnSearch(1)" />
                        </td>
                        <td style="width: 3%" align="right">
                            <b>From</b>
                        </td>
                        <td style="width: 9%">
                            <gw:datebox id="dtFrom" lang="<%=Session("Lang")%>" styles="width=80%" />
                        </td>
                        <td style="width: 3%" align="right">
                            <b>To</b>
                        </td>
                        <td style="width: 9%">
                            <gw:datebox id="dtTo" lang="<%=Session("Lang")%>" styles="width=80%" />
                        </td>
                        <td style="width: 6%" align="right">
                            <b>SO No</b>
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtOrderNo" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 5%" align="right">
                            Item
                        </td>
                        <td style="width: 17%" align="right">
                            <gw:textbox id="txtItem" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 5%" align="right">
                            Issuer
                        </td>
                        <td style="width: 10%" align="right">
                            <gw:textbox id="txtIssuer" styles="width:100%" onenterkey="OnSearch(1)" />
                        </td>
                        <td style="width: 3%" align="center">
                            <gw:button id="ibtnSearch" img="search" alt="Search" text="Get Order" onclick="OnSearch(1)" />
                        </td>
                        <td style="width: 5%" align="center">
                            <gw:button id="ibtnSave" img="save" alt="Save" onclick="OnSave('Grid1')" />
                        </td>
                        <td style="width: 5%" align="left">
                            <gw:button id="idBtnApprove" img="Approve" text="Approve" onclick="OnApprove()" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 10%" align="right">
                        </td>
                        <td style="width: 3%" align="right">
                        </td>
                        <td style="width: 9%">
                        </td>
                        <td style="width: 3%" align="right">
                        </td>
                        <td style="width: 9%">
                        </td>
                        <td style="width: 6%" align="right">
                        </td>
                        <td style="width: 10%">
                        </td>
                        <td style="width: 5%" align="right">
                        </td>
                        <td style="width: 17%" align="right">
                        </td>
                        <td style="width: 5%" align="right">
                            Team
                        </td>
                        <td style="width: 10%" align="right">
                            <gw:list id="lstSaleTeam" />
                        </td>
                        <td style="width: 3%" align="center">
                        </td>
                        <td style="width: 5%" align="center">
                        </td>
                        <td style="width: 5%" align="left">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr id='top'>
            <td>
                <table width="100%">
                    <tr>
                        <td>
                            <gw:grid id="idGrid1" header="No|_b.pk|Issuer|Ord Date|ETD|Ord Type|SO No|Deli To|Item Name|Pattern|Color|ST Unit|Ord Qty|Ord Qty(M)|Deli Loc|Note|Group Name|ST Item Code|Unit Price|Brand|Details PO No|Model|Stage|Order Type|Usage|Swatch|Bill To|Takeout Req date|Master PO No|Currency|Amount|Reserved Qty|Take Out from Stock|FX-Rate|VAT Y/N|VAT Rate|Approve date|Ord Status"
                                format="0|0|0|4|4|0|0|0|0|0|0|0|1|1|0|0|0|0|1|0|0|0|0|0|0|0|0|4|0|0|1|1|1|1|3|1|0|0"
                                acceptNullDate="true" 
                                aligns="0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|1|0|0|0|0|0|0|1|0"
                                editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                widths="0|1500|1500|1200|1200|1500|1500|1500|2500|0|3000|1000|1500|1500|2000|2000|3000|1500|1500|2000|1500|1500|1500|1000|1500|800|1000|1500|1500|1000|1500|1500|1000|1000|800|1000|1200|1000"
                                styles="width:100%; height:250" sorting="T" 
                                param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <gw:tab id="tab">
                <table name="Tab 1" width="100%">
                    <tr>
                        <td style="width: 10%" ></td>
                        <td style="width: 5%" align="right">
                            <gw:button id="ibtnExcel1" img="OTR" text="OTR" onclick="OnExcel('SO_OTR')" />
                        </td>  
                        <td style="width: 35%"></td>
                        <td style="width: 5%"></td>                       
                        <td style="width: 10%" ></td>

                        <td style="width: 5%" align="right">
                            <b>Approve Date</b>
                        </td>
                        <td style="width: 10%">
                            <gw:datebox id="dtApproveDate" lang="<%=Session("Lang")%>" />
                        </td>
                        <td style="width: 5%" align="right">
                        </td>
                        <td style="width: 10%">                            
                        </td>                       
                        <td style="width: 5%" align="right">
                            <gw:button id="ibtnExcel" img="excel" alt="Excel" onclick="OnExcel('Approve')" />
                        </td>                        
                    </tr>
                    <tr>
                        <td colspan=10>
                            <gw:grid id="idGrid2" header="Issuer|Ord Date|ETD|Ord Type|SO No|Deli To|Item Name|ST Unit|Ord Qty|Qrd Qty(M)|Deli Loc|Note|Group Name|ST Item Code|Unit Price|Brand|Details PO No|Model|Stage|Order Type|Usage|CS Date|Bill To|Takeout Req date|Master PO No|Currency|Amount|Reserved Qty|Take Out from Stock|FX-Rate|VAT Y/N|VAT Rate|Approve date|Ord Status|RP1|PRINT|EMBO|RP2|PERFORATION|PEARL|COLOR GROUP|PROD COLOR|BACK COLOR"
                                format='0|4|4|0|0|0|0|0|1|1|0|0|0|0|1|0|0|0|0|0|0|0|0|4|0|0|1|1|1|1|3|1|0|0|0|0|0|0|0|0|0|0|0'
                                aligns='0|1|1|1|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|1|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0'
                                editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                widths="1500|1500|1500|1500|2000|3500|3000|1000|1500|1500|3000|1500|2500|2000|1000|2000|1500|1500|1000|1500|1000|1000|2000|1500|1500|1000|1500|1500|1500|1000|800|1000|1700|1500|1000|1000|1000|1000|1000|1000|1000|1000|1000"
                                styles="width:100%; height:400" sorting="T" group='T' 
                                param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42" />
                        </td>
                    </tr>                    
                </table>                    
                <table name="Tab 2" width="100%">
                    <tr>
                        <td style="width: 95%" align="right">
                            <gw:button id="ibtnSave1" img="save" alt="Save" onclick="OnSave('Grid3')" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        <gw:grid id="idGrid3" header="No|_b.pk|Issuer|Ord Date|ETD|Ord Type|SO No|Deli To|Item Name|_St Spec|Item Spec|ST Unit|Ord Qty|Ord Qty(M)|Deli Loc|Note|Group Name|ST Item Code|Unit Price|Brand|Details PO No|Model|Stage|Order Type|Usage|Swatch|Bill To|Takeout Req date|Master PO No|Currency|Amount|Reserved Qty|Take Out from Stock|FX-Rate|VAT Y/N|VAT Rate|Approve date|Ord Status"
                            format="0|0|0|4|4|0|0|0|0|0|0|0|1|1|0|0|0|0|1|0|0|0|0|0|0|0|0|4|0|0|1|1|1|1|3|1|0|0"
                            aligns="0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|1|0|0|0|0|0|0|1|0"
                            editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                            widths="0|1500|1500|1200|1200|1500|1500|1500|2500|0|3000|1000|1500|1500|2000|2000|3000|1500|1500|2000|1500|1500|1500|1000|1500|800|1000|1500|1500|1000|1500|1500|1000|1000|800|1000|1200|1000"
                            styles="width:100%; height:400" sorting="T" param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37" />                        
                        </td>
                    </tr>
                </table>
                </gw:tab>
            </td>
        </tr>
    </table>
    <img status="expand" id="imgArrow" src="../../../../system/images/up.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
    <gw:textbox id="txtMaster_PK" style="display: none" />
    <gw:textbox id="txtReturnValue" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txt_user_pk" maxlen="100" styles='width:100%;display:none' />
</body>
</html>
