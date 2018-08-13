<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  
	CtlLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>
<head id="Head1" runat="server">
    <title>Suplier Price</title>
</head>

<script>
var G1_PK               = 0,
    G1_TCO_ITEM_PK      = 1,
    G1_ITEM_CODE        = 2,
    G1_ITEM_NAME        = 3,
    G1_TCO_BUSPARTNER_PK= 4,
    G1_PARTNER_NAME     = 5,
    G1_LEADS_DAY        = 6,
    G1_PAYMENT_TERM     = 7,
    G1_PAYMENT_METHOD   = 8,
    G1_DELI_TYPE        = 9,
    G1_ST_PRICE         = 10,
    G1_CCY              = 11,
    G1_DESCRIPTION      = 12;
    var callerWindowObj = dialogArguments;     
    var select_row      = callerWindowObj.grdDetail.row;
    var p_grdGrid = callerWindowObj.grdDetail
//====================================================  
function BodyInit()
 {
    System.Translate(document);
    var  data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0120' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdMaster.SetComboFormat(G1_PAYMENT_TERM,data); 
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0110' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdMaster.SetComboFormat(G1_PAYMENT_METHOD,data); 
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGPO2002' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdMaster.SetComboFormat(G1_DELI_TYPE,data);     
    data = "<%=CtlLib.SetGridColumnDataSQL("SELECT a.CODE, a.CODE_NM FROM TLG_LG_CODE a, TLG_LG_CODE_GROUP b WHERE  b.GROUP_ID='LGCM0100' AND a.TLG_LG_CODE_GROUP_PK=b.PK and a.use_if = 'Y' and a.del_if = 0 and b.del_if = 0 ORDER BY a.CODE , a.CODE_NM " ) %> ";       
    grdMaster.SetComboFormat(G1_CCY,data);  
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGCM0110') FROM DUAL")%>||";  //payment form
     lstPaymentMethod.SetDataText(data);
     //----------------------- 
     data = "<%=CtlLib.SetListDataFUNC("SELECT LG_f_logistic_code('LGCM0120') FROM DUAL")%>||";  //payment term
     lstPaymentTerm.SetDataText(data);
    
    var p_pay_term = callerWindowObj.lstPaymentTerm.value;
    lstPaymentTerm.value = p_pay_term;
    var p_pay_method = callerWindowObj.lstPaymentMethod.value;
    lstPaymentMethod.value = p_pay_method;
    var p_supplier_pk = callerWindowObj.txtSupplierName.text;
     txtBuspartner.text = p_supplier_pk
   
    var p_item_code = "";
    if(p_grdGrid.row >0 )
    { 
      txtItem.text =  p_grdGrid.GetGridData( select_row, callerWindowObj.G1_PO_Item_Code);      
    } else
    {
        txtItem.text = "";
    }   
    SetGriFormat();     
 }
//=========================================================  
  function OnSearch()
{  
            epbp00112.Call("SELECT");          
}
//====================================================
function OnDataReceive()
{   
   if(grdMaster.rows > 1)
    {
      grdMaster.SetCellBold(1,G1_ST_PRICE,grdMaster.rows - 1,G1_ST_PRICE,  true); 
      grdMaster.SetCellBold(1,G1_PAYMENT_TERM,grdMaster.rows - 1,G1_PAYMENT_METHOD,  true); 
      grdMaster.SetCellBold(1,G1_PARTNER_NAME,grdMaster.rows - 1,G1_PARTNER_NAME,  true); 
      
      grdMaster.SetCellBgColor( 1, G1_ST_PRICE , grdMaster.rows - 1, G1_ST_PRICE , 0xC1B6FF );
     }
}

//=====================================================
function SetGriFormat()
{
    var ctr=grdMaster.GetGridControl();
    ctr.ColFormat(G1_ST_PRICE) = "###,###,###,###,###.##";
   
}

//=========================================================
function OnSelectPrice()
{
    var row,col     
    row = event.row;
    col = event.col;
    if(p_grdGrid.row >0 )
    {
        if(col == G1_ST_PRICE)
        {
            if(p_grdGrid.GetGridData(p_grdGrid.row,callerWindowObj.G1_PO_Item_Code) == grdMaster.GetGridData(row, G1_ITEM_CODE))
                {
                    p_grdGrid.SetGridText(p_grdGrid.row,callerWindowObj.G1_UPrice,grdMaster.GetGridData(row, col))
                    window.close();	 
                }
        }
   }  
}
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="epbp00112" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  function="st_lg_sel_epbp00112" >
                <input bind="grdMaster" >
                    <input bind="txtBuspartner" /> 
                    <input bind="txtItem" />
                    <input bind="lstPaymentTerm" />
                    <input bind="lstPaymentMethod" />
                </input>     
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td>
                <table style="width: 100%; height: 100%">
                    <tr>
                        <td align="right" width="5%">
                            <b>Bus partner</b>
                        </td>
                        <td width="15%">
                            <gw:textbox id="txtBuspartner" csstype="mandatory" styles="width:100%" onenterkey="OnSearch('grdMaster')" />
                        </td>
                        <td align="right" width="5%">
                            <b>Item</b>
                        </td>
                        <td width="15%">
                            <gw:textbox id="txtItem" csstype="mandatory" styles="width:100%" onenterkey="OnSearch('grdMaster')" />
                        </td>
                        <td width="5%" align='right'>
                            <gw:button id="btnInvSearch" img="search" onclick="OnSearch()" />
                        </td>                      
                    </tr>
                    <tr>
                        <td align="right" width="5%">
                            <b>Pay Term</b>
                        </td>
                        <td width="15%">
                            <gw:list id="lstPaymentTerm" styles="width:100%;" />
                        </td>
                        <td align="right" width="5%">
                            <b>Pay Method</b>
                        </td>
                        <td width="15%">
                            <gw:list id="lstPaymentMethod" styles="width:100%;" />                                      
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 99%">
            <td>
                <gw:grid id='grdMaster' 
                header='_pk|_tco_item_pk|Item Code|Item Name|_tco_buspartner_pk|Partner Name|Leads Day|Payment Term|Payment Method|Deli Type|St Price|CCY|Description|_Crt DT|_Crt by'
                    format ='0|0|0|0|0|0|1|2|2|2|1|0|0|0|0' 
                    aligns ='0|0|0|0|0|0|0|0|0|0|0|1|0|0|0' 
                    check  ='||||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|0|0|1|0|0' 
                    widths ='0|0|1200|2000|0|2500|1200|1500|1700|1500|1200|1500|1000|1500|1500'
                    sorting='T' styles='width:100%; height:100%' oncelldblclick="OnSelectPrice()" />
            </td>
        </tr>
    </table>
    <!------------------------------------------->
    <!------------------------------------------->
</body>
</html>
