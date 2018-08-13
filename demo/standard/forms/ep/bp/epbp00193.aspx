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
//====================================================    
var callerWindowObj = dialogArguments;  
function OnSearch(pos)
{  
    switch(pos)
    {
        case'grdMaster':
            epbp00193.Call("SELECT");  
        break;
        case'Partner':
            epbp00193_1.Call("SELECT");  
        break;
    }
                
}
//====================================================
function OnDataReceive(obj)
{   
    switch(obj.id)
    {
        case'epbp00193':
            if(grdMaster.rows > 1)
            {
             grdMaster.SetCellBold(1,G1_ST_PRICE,grdMaster.rows - 1,G1_ST_PRICE,  true); 
             grdMaster.SetCellBold(1,G1_ITEM_NAME,grdMaster.rows - 1,G1_PARTNER_NAME,  true); 
             grdMaster.SetCellBold(1,G1_PAYMENT_TERM,grdMaster.rows - 1,G1_PAYMENT_METHOD,  true);      
             grdMaster.SetCellBgColor( 1, G1_ST_PRICE , grdMaster.rows - 1, G1_ST_PRICE , 0xCCFFFF );    
            } 
        break;
        case'pro_epbp00193':
            if(txtReturnValue.text=='0')
            {
                grdMaster.AddRow();
                grdMaster.SetGridText(grdMaster.rows-1,G1_TCO_BUSPARTNER_PK,txtPartnerPK.text);
                grdMaster.SetGridText(grdMaster.rows-1,G1_PARTNER_NAME,txtPartnerName.text);
                if(txtItemPK.text !="")
                {
                    grdMaster.SetGridText( grdMaster.rows-1, G1_TCO_ITEM_PK, txtItemPK.text);
                    grdMaster.SetGridText( grdMaster.rows-1, G1_ITEM_CODE  , txtItemCD.text);
                    grdMaster.SetGridText( grdMaster.rows-1, G1_ITEM_NAME  , txtItem.text);
                }
            }
            else
            {
                alert("partner "+txtPartnerName.text+ " already added !!!")
            }
        break;
    }
    
}
//=====================================================
function OnNew()
{  
    grdMaster.AddRow();
}
//=====================================================
function OnDelete()
{
    if( grdMaster.row >= 1 )
    { 
        if ( grdMaster.GetGridData( grdMaster.row,G1_PK ) == '' ) 
        {
            grdMaster.RemoveRow();
        }
        else
        {
            grdMaster.DeleteRow();
        }  
    }
}
//======================================================
function OnUndelete()
{
    grdMaster.UnDeleteRow();
}
//=====================================================
function OnSave()
{
    for(var i=1;i<grdMaster.rows;i++)
    {
        if(grdMaster.GetGridData(i,G1_ST_PRICE)=="")
        {
            alert("Please Input Price ");
            return false;
        } 
    }
    epbp00193.Call();
} 
//=====================================================
function SetGriFormat()
{
    
        if(callerWindowObj != null)
        {
        txtItemPK.text = callerWindowObj.txtItemPK.text ;
        txtItem.text = callerWindowObj.txtItem.text ;
        txtItemCD.text = callerWindowObj.txtItemCD.text ;
        }       
    var ctr=grdMaster.GetGridControl();
    ctr.ColFormat(G1_ST_PRICE) = "###,###,###,###,###.##";
   
}
//======================================================
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
    SetGriFormat();     
 }
//=========================================================
function CheckInput()
{
    var col,row
    col = event.col ;
    row = event.row ;
    if(col = col_unit_price)
    {
        var dQuantiy;
        dQuantiy = grdMaster.GetGridData(row,col);
        if(!Number(dQuantiy))
        {
            grdMaster.SetGridText(row,col,"");
        }
       
    }
} 
//=========================================================
function OnGetPartner()
{
    if(grdPartner.row > 0)
    {
        txtPartnerPK.text = grdPartner.GetGridData(grdPartner.row,0);
        txtPartnerName.text = grdPartner.GetGridData(grdPartner.row,2); 
        if(txtItemPK.text =="" )
        {
        grdMaster.AddRow();
        grdMaster.SetGridText(grdMaster.rows-1,G1_TCO_BUSPARTNER_PK,txtPartnerPK.text);
        grdMaster.SetGridText(grdMaster.rows-1,G1_PARTNER_NAME,txtPartnerName.text);
        
        }else
        {
        pro_epbp00193.Call();
        }
    }
}
//=========================================================
function OnGridCellDblClick()
{
    var row,col 
    
    row = event.row;
    col = event.col;
    
    switch (col)
    {
       
        case G1_ITEM_CODE:
        {
            var path = System.RootURL + '/standard/formsfp/ab/fpab00110.aspx?group_type=Y|Y|Y|Y|Y|Y&tco_stitem_pk='+ grdMaster.GetGridData(row,G1_TCO_ITEM_PK);
            var object  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:600px');
            if ( object != null )
              {
                    grdMaster.SetGridText( row, G1_TCO_ITEM_PK, object[0]);
                    grdMaster.SetGridText( row, G1_ITEM_CODE  , object[1]);
                    grdMaster.SetGridText( row, G1_ITEM_NAME  , object[2]);
              }
        }
        break;     
        case G1_ITEM_NAME:
        {
            var path = System.RootURL + '/standard/formsfp/ab/fpab00110.aspx?group_type=Y|Y|Y|Y|Y|Y&tco_stitem_pk='+ grdMaster.GetGridData(row,G1_TCO_ITEM_PK);
            var object  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:600px');
            if ( object != null )
              {
                    grdMaster.SetGridText( row, G1_TCO_ITEM_PK, object[0]);
                    grdMaster.SetGridText( row, G1_ITEM_CODE  , object[1]);
                    grdMaster.SetGridText( row, G1_ITEM_NAME  , object[2]);
              }
        }
        break;  
        case  G1_PARTNER_NAME:
        {
            var path = System.RootURL + '/standard/formsfp/ab/fpab00120.aspx';
            var object  = window.showModalDialog(  path , this , 'resizable:yes;toolbar=no;dialogWidth:800px;dialogHeight:600px');
            if ( object != null )
              {
                    grdMaster.SetGridText( row, G1_TCO_BUSPARTNER_PK , object[0]);
                    //grdMaster.SetGridText( row, col_partner_id , object[1]);
                    grdMaster.SetGridText( row, G1_PARTNER_NAME ,   object[2]);
                    
              }
        } 
        break;      
    }
    
}
</script>

<body>
    <!------------------------------------------------------------------>
    <gw:data id="epbp00193" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12" function="st_lg_sel_epbp00193"  procedure="st_lg_upd_epbp00193"> 
                <input bind="grdMaster" >
                    <input bind="txtBuspartner" /> 
                    <input bind="txtItem" />
                </input>     
                <output bind="grdMaster" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="epbp00193_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  function="st_lg_sel_epbp00193_1"> 
                <input bind="grdPartner" >
                    <input bind="txtPartner" /> 
                </input>     
                <output bind="grdPartner" /> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <gw:data id="pro_epbp00193" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="st_lg_pro_epbp00193" > 
                <input>
                    <input bind="txtPartnerPK" />
                     <input bind="txtItemPK" />
                </input> 
                <output>
                    <output bind="txtReturnValue" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------>
    <table style="width: 100%; height: 100%" border="1">
        <tr style="height: 1%">
            <td style="width: 30%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" width="5%" style="white-space: nowrap">
                            <b>Bus. Partner</b>
                        </td>
                        <td width="15%">
                            <gw:textbox id="txtPartner" csstype="mandatory" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="search" alt="Search" id="btnSearch" onclick="OnSearch('Partner')" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="3">
                            <gw:grid id='grdPartner' header='_pk|Partner ID|Partner Name' format='0|0|0' aligns='0|0|0'
                                check='||' editcol='1|1|0' widths='0|0|1200' sorting='T' styles='width:100%; height:100%'
                                oncelldblclick='OnGetPartner()' />
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 70%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td align="right" width="5%" style="white-space: nowrap">
                            <b>Bus. Partner</b>
                        </td>
                        <td width="15%">
                            <gw:textbox id="txtBuspartner" csstype="mandatory" styles="width:100%" onenterkey="OnSearch()" />
                        </td>
                        <td align="right" width="5%">
                            <b>Item</b>
                        </td>
                        <td width="15%">
                            <gw:textbox id="txtItem" csstype="mandatory" styles="width:100%" onenterkey="OnSearch()" />
                            <gw:textbox id="txtItemPK"  styles="width:100%;display:none"  />
                        </td>
                        <td width="10%" align='right'>
                            <gw:button id="btnInvSearch" img="search" onclick="OnSearch('grdMaster')" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="new" alt="New" id="btnAdd" onclick="OnNew()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="delete" alt="Delete" id="btnDelete" onclick="OnDelete()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="UnDelete" alt="Undelete" id="btnUnDelete" onclick="OnUndelete()" />
                        </td>
                        <td style="width: 1%" align="right">
                            <gw:button img="save" alt="Save" id="btnUpdate" onclick="OnSave()" />
                        </td>
                    </tr>
                    <tr style="height: 99%">
                        <td colspan="9">
                            <gw:grid id='grdMaster' header='_pk|_tco_item_pk|Item Code|Item Name|_tco_bus.partner_pk|Partner Name|Leads Day|Payment Term|Payment Method|Deli Type|St Price|CCY|Description|Crt DT|Crt by'
                                format='0|0|0|0|0|0|1|2|2|2|1|0|0|0|0' aligns='0|0|0|0|0|0|0|0|0|0|0|1|0|0|0'
                                check='||||||||||||||' editcol='1|1|0|0|0|0|1|1|1|1|1|0|1|0|0' widths='0|0|1200|2000|0|2500|1200|1500|1700|1500|1200|1500|1000|1500|1500'
                                sorting='T' styles='width:100%; height:100%' oncelldblclick='OnGridCellDblClick(this)'' />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <!------------------------------------------->
    <gw:textbox id="txtItemCD" styles="width:100%; display:none" onenterkey="" />
    <gw:textbox id="txtPartnerPK" styles="width:100%; display:none" onenterkey="" />
    <gw:textbox id="txtPartnerName" styles="width:100%; display:none" onenterkey="" />
    <gw:textbox id="txtReturnValue" styles="width:100%; display:none" onenterkey="" />
    <!------------------------------------------->
</body>
</html>
