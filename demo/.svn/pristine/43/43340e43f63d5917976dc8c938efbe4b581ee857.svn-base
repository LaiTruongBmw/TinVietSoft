<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Ending Balance</title>
</head>

<script>

    var  user_pk = "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>"  ;

    var 
        iG0_No          = 0,
        iG0_Acc_Cd      = 1,
        iG0_Acc_Nm      = 2,
        iG0_Item_Code   = 3,
        iG0_Item_Name   = 4,
        iG0_UOM         = 5,
        iG0_WH          = 6,
        iG0_PL_CD       = 7,
        iG0_PL_NM       = 8,
        iG0_Open_Qty    = 9,
        iG0_Open_Amt    = 10,
        iG0_IN_Qty      = 11,
        iG0_IN_Amt      = 12,
        iG0_OUT_Qty     = 13,
        iG0_OUT_Amt     = 14,
        iG0_End_Qty     = 15,
        iG0_End_Amt     = 16,
        iG0_tac_stockmm_pk = 17;
//------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
    txtAccountCode.SetEnable(false);
    txtAccountName.SetEnable(false);
    txtItemCode.SetEnable(false);
    txtItemName.SetEnable(false);
    txtPLCode.SetEnable(false);
    txtPLName.SetEnable(false);
     txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	dso_getCompany.Call();
    OnFormatGrid();
    OnFormatGrid();
}
//------------------------------------------------------------------------
function BindingDataList()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data);
    var data = "<%=CtlLib.SetListDataSQL("SELECT pk, WH_ID || '-'|| wh_name  FROM tlg_in_warehouse  WHERE del_if = 0 ORDER BY WH_ID  ASC" )%>|ALL|ALL";    
    lstWH.SetDataText(data); 
    lstWH.value = 'ALL';       
    var l_loading_opt = "<%=CtlLib.SetDataSQL("select d.code from tac_commcode_detail d, tac_commcode_master a where a.id = 'ACBG0183' and a.del_if = 0 and d.tac_commcode_master_pk = a.pk and d.del_if = 0 and d.def_yn = 'Y' ")%>";  
    if(l_loading_opt == 'Auto')
    {   
        btnSave.SetEnable(false);
    }
    else
    {
        btnSave.SetEnable(false);
    }
    idGrid.GetGridControl().FrozenCols = 4 ;
}
//------------------------------------------------------------------------
function OnPopUp(iObj)
{
    switch(iObj)
    {
    case 'Account':
            if(Trim(lstCompany.value)=='')
            {
                alert('Must select Company!!!');
                return ;
            }            
            var path = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_code=&comm_nm=&dsqlid=ac_sel_60170120_acc&val1=" + lstCompany.value + "&val2=" + lstWH.value + "&val3=" ;

            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            if(object!=null)
            {
                txtAccountCode.text = object[0];
                txtAccountName.text = object[1];
                txtTAC_ABACCTCODE_PK.text = object[3];
            }    
        break ;
    case 'Item':        
            var path = System.RootURL + "/standard/forms/60/17/60170120_popupgetonitem.aspx?purchase_yn=Y&item_code=" + txtItemCode.text + "&item_name=" + txtItemName.text ;
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
            if(object != null)
            {
                txtItemCode.text = object[1];
                txtItemName.text = object[2];
            }                        
        break;
    case 'PL':
            if(Trim(lstCompany.value)=='')
            {
                alert('Must select Company!!!');
                return ;
            }              
            var path   = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCompany.GetData() + '&dsqlid=SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME"; //lay tac_abplcenter_pk
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
            if(object != null)
            {
                txttac_abplcenter_pk.text = object[2];
                txtPLCode.text = object[0];
                txtPLName.text = object[1];
            }
            break;
    }
}
//------------------------------------------------------------------------
function OnSearch(pos)
{
    switch (pos)
    {
        case 'fmgf00120' :        
            fmgf00120.Call("SELECT")            
        break;
    }
}
//------------------------------------------------------------------------
function OnDataReceive(obj)
{
    var i ;
    var lOpenQty = 0, lOpenAmt = 0, lInQty = 0, lInAmt = 0, lOutQty = 0, lOutAmt = 0;          
    switch (obj.id)
    {
        case "fmgf00120" :            
            CalcuSubTotal();       
          var ctr = idGrid.GetGridControl()          
           if(ctr.rows > 1)
           {
                for( i =1 ; i< ctr.rows; i++)
               {
                    if( idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_Open_Qty) != "")
                        lOpenQty = lOpenQty + parseFloat(idGrid.GetGridData(i, iG0_Open_Qty));
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_Open_Amt) != "")
                        lOpenAmt = lOpenAmt + parseFloat(idGrid.GetGridData(i, iG0_Open_Amt));
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_IN_Qty) != "")
                        lInQty = lInQty + parseFloat(idGrid.GetGridData(i, iG0_IN_Qty));
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_IN_Amt) != "")
                        lInAmt = lInAmt + parseFloat(idGrid.GetGridData(i, iG0_IN_Amt));
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_OUT_Qty) != "")
                        lOutQty = lOutQty + parseFloat(idGrid.GetGridData(i, iG0_OUT_Qty));
                    if(idGrid.GetGridData(i, iG0_Acc_Cd) != "" && idGrid.GetGridData(i, iG0_OUT_Amt) != "")
                        lOutAmt = lOutAmt + parseFloat(idGrid.GetGridData(i, iG0_OUT_Amt));                        
                }
              idGrid.AddRow();
              idGrid.SetGridText(i, 0, "TOTAL");
              idGrid.SetCellBgColor(idGrid.rows-1,0,idGrid.rows-1,idGrid.cols-1,0xA9EBD7);
              idGrid.SetGridText(idGrid.rows-1, iG0_Open_Qty, lOpenQty) ;
              idGrid.SetGridText(idGrid.rows-1, iG0_Open_Amt, lOpenAmt) ;
              idGrid.SetGridText(idGrid.rows-1, iG0_IN_Qty, lInQty) ;
              idGrid.SetGridText(idGrid.rows-1, iG0_IN_Amt, lInAmt) ;
              idGrid.SetGridText(idGrid.rows-1, iG0_OUT_Qty, lOutQty) ;
              idGrid.SetGridText(idGrid.rows-1, iG0_OUT_Amt, lOutAmt) ;              
              ctr.TopRow = idGrid.rows-1; 
              ctr.Cell(13, 1, iG0_OUT_Qty, idGrid.rows - 1, iG0_OUT_Qty) = true;                   
              ctr.FrozenCols = 4 ;
          }         
        break;
        case 'dso_inout_upd':
            fmgf00120.Call("SELECT");
        break ;
    }    
}
//------------------------------------------------------------------------
function OnExcel(obj)
{
    var url = System.RootURL + "/standard/reports/fm/gf/fmgf00120.aspx?stdym_fr=" + dtFrom.value + "&stdym_to=" + dtTo.value + "&tco_company_pk=" + lstCompany.value ;
    System.OpenTargetPage(url);        
    
}
//-----------------------------------------------------
function OnFormatGrid()
{
    var trl ;
    trl = idGrid.GetGridControl();	
    trl.ColFormat(iG0_Open_Qty)                 = "###,###,###,###,###.##";
    trl.ColFormat(iG0_Open_Amt)                 = "###,###,###,###,###";
    trl.ColFormat(iG0_IN_Qty)                   = "###,###,###,###,###.##";
    trl.ColFormat(iG0_IN_Amt)                   = "###,###,###,###,###";
    trl.ColFormat(iG0_OUT_Qty)                  = "###,###,###,###,###.##";
    trl.ColFormat(iG0_OUT_Amt)                  = "###,###,###,###,###";
    trl.ColFormat(iG0_End_Qty)                  = "###,###,###,###,###.##";
    trl.ColFormat(iG0_End_Amt)                  = "###,###,###,###,###";
}
//-----------------------------------------------------
function OnReset(iObj)
{
    switch(iObj)
    {
        case 'Account':
            txtAccountCode.text = "" ;
            txtAccountName.text = "" ;
            txtTAC_ABACCTCODE_PK.text = "" ;
        break;
        case 'Item':
            txtItemCode.text = '' ;
            txtItemName.text = '' ;                    
            txtTCO_ITEM_PK.text = '' ;
        break ;   
        case 'PL':         
            txtPLCode.text = '';
            txtPLName.text = '';
            txttac_abplcenter_pk.text = '' ;
        break ;            
    }
}
//-----------------------------------------------------
//function Upcase()
//{
//    var c = String.fromCharCode (event.keyCode);
//	var x = c.toUpperCase().charCodeAt(0);
//	event.keyCode = x;
//}
//-----------------------------------------------------
//-----------------------------------------------------
function MergeColumn()
{
//      idGrid.GetGridControl().MergeCells  = 2 ;	
//      idGrid.GetGridControl().MergeCol(0) = true ;	
//      idGrid.GetGridControl().MergeCol(1) = true ;   	
//      idGrid.GetGridControl().MergeCol(2) = true ;	
//      idGrid.GetGridControl().MergeCol(3) = true ;	
//      idGrid.GetGridControl().MergeCol(4) = true ;		
//      idGrid.GetGridControl().MergeCol(5) = true ;	
//      idGrid.GetGridControl().MergeCol(6) = true ;	
}
//-----------------------------------------------------
function CalcuSubTotal()
{                
        var ctr=idGrid.GetGridControl(); 
        ctr.OutlineBar = 2 ;
        //ctr.SubtotalPosition=0;
        var color;
        var caption;
        var operator;        
        for (var igroup=0;igroup<=1;igroup++)
        {
            switch (igroup)
            {
                case 0:
                {
                    color=0xCCFFFF ;
                    caption='Grand Total';
                    break;
                }
                case iG0_Acc_Cd:
                {
                    color = 0xCCFFFF ;
                    caption='%s';
                    break;
                }                
            }
            for(var itotal = iG0_Open_Qty; itotal <= iG0_End_Amt; itotal++)
            {                
                ctr.SubTotal(2, igroup, itotal, '', color, 0x000000, '1', caption, '', true);
            }
        auto_resize_column(idGrid, 0, idGrid.cols-1, 10); 
    }            
}
//-----------------------------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
//-----------------------------------------------------
function OnSave()
{
	fmgf00120.Call();	
}
//-----------------------------------------------------
function OnChange(iObj)
{
    var lcol, lrow, lOut_Qty, lIn_Qty, lOpen_Qty, lEnd_Qty ;    
    lcol = event.col ;
    lrow = event.row ;
    var ltac_stockmm_pk = idGrid.GetGridData(lrow, iG0_tac_stockmm_pk);
    switch(iObj.id)
    {
        case 'idGrid':
            if(Trim(ltac_stockmm_pk) == "")
            {
                return ;
            }
            if( lcol == iG0_End_Qty && Trim(ltac_stockmm_pk) != "" )
            {
                if( Trim(idGrid.GetGridData(lrow, iG0_IN_Qty)) != "" )
                    lIn_Qty = idGrid.GetGridData(lrow, iG0_IN_Qty);
                else
                    lIn_Qty = "0";                                        
                if( Trim(idGrid.GetGridData(lrow, iG0_Open_Qty)) != "" )                    
                    lOpen_Qty = idGrid.GetGridData(lrow, iG0_Open_Qty);
                else
                    lOpen_Qty = "0" ;                                        
                if( Trim(idGrid.GetGridData(lrow, iG0_End_Qty)) != "" )                    
                    lEnd_Qty = idGrid.GetGridData(lrow, iG0_End_Qty);                                
                else
                    lEnd_Qty = "0";                                        
                lOut_Qty = parseFloat(lOpen_Qty) + parseFloat(lIn_Qty) - parseFloat(lEnd_Qty);
                idGrid.SetGridText(lrow, iG0_OUT_Qty, lOut_Qty);
                idGrid.SetRowStatus(event.row, Number('0x10')) ;
            }
        break;
    }
}
//-----------------------------------------------------
function OnUpdInOut()
{
    if(confirm('Are you sure you want to load selling quantity?'))
    {
        dso_inout_upd.Call();
    }        
}
//-----------------------------------------------------

</script>

<body>
     <!-------------------------------------------------------------------->
  <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60010020_1" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data> <!-------------------------------------------------------------------->
  <gw:data id="fmgf00120" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="AC_sel_60170130_01" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17" procedure="AC_upd_60170130_01" > 
                <input bind="idGrid" >                 
                    <input bind="lstCompany"/>                    
                    <input bind="dtFrom"/>                    
                    <input bind="dtTo"/>                    
                    <input bind="txtTAC_ABACCTCODE_PK"/>                    
                    <input bind="lstWH"/>                    
                    <input bind="txttac_abplcenter_pk"/>
                    <input bind="txtTCO_ITEM_PK"/>                                                            
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>       
    <!-------------------------------------------------------------------->
     <gw:data id="dso_inout_upd" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="AC_PRO_60170130_02" > 
                <input>
                   <input bind="lstCompany" />
                   <input bind="dtFrom"/>
                   <input bind="dtTo"/>
                   <input bind="lstWH"/>                                        
                 </input>
                <output>
                    <output bind="txtReturn"/>
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <!-------------------------------------------------------------------->    
<table style="width:100%; " border="1" cellpadding="0" cellspacing="0" >
    <tr style="height:10%;" >
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0" >
                <tr >
                    <td style="width: 8%; " align="right">Company&nbsp;</td>
                    <td style="width: 20%;" >
                        <gw:list id="lstCompany" styles="width:100%;" />
                    </td>
                    <td style="width: 8%;" align="right" ><a title="Click here to select account" onclick="OnPopUp('Account')" href="#tips">Account</a>
                    </td>
                    <td style="width:8%;"><gw:textbox id="txtAccountCode" text="" styles="width:100%; " csstype="mandatory" /></td>
                    <td style="width:14%;"><gw:textbox id="txtAccountName" text="" styles="width:100%; " csstype="mandatory" /></td>
                    <td style="width: 2%;" align="right">
                        <gw:imgbtn img="reset" alt="Reset" id="btnReset" onclick="OnReset('Account')" />
                    </td>                                        
                    <td style="width: 8%;" align="right" ><a title="Click here to select PL" onclick="OnPopUp('PL')" href="#tips">PL&nbsp;</a>
                    </td>
                    <td style="width:8%;"><gw:textbox id="txtPLCode" text="" styles="width:100%; " csstype="mandatory" /></td>
                    <td style="width:14%;"><gw:textbox id="txtPLName" text="" styles="width:100%; " csstype="mandatory" /></td>                    
                    <td style="width: 2%;" align="right">
                        <gw:imgbtn img="reset" alt="Reset" id="btnReset2" onclick="OnReset('PL')" />
                    </td>                    
                    <td style="width: 2%; " align="right">
                        <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('fmgf00120')" />
                    </td>
                    <td style="width: 3%;" align="right">
                        <gw:imgbtn img="save" alt="Save" id="btnSave" onclick="OnSave()" />
                    </td>
                    <td style="width: 3%;" align="right">
                        <gw:imgbtn img="printer" alt="Print" id="btnExcel" onclick="OnExcel()" />
                    </td>
                </tr>
                <tr>
                    <td style="width:8%; " align="right" >Period&nbsp;</td>
                    <td style="width:20%; " align="left" >
                        <table width="100%" style="height:100%">
                            <tr>
                                <td style="width:50%" ><gw:datebox id="dtFrom" type="date" lang="1" /></td>
                                <td style="width:50%"><gw:datebox id="dtTo" type="date" lang="1" /></td>
                            </tr>
                        </table>                    
                    </td>
                    <td style="width: 8%;" align="right" ><a title="Click here to select Product Item" onclick="OnPopUp('Item')" href="#tips">Item&nbsp;</a></td>
                    <td style="width:8%;"><gw:textbox id="txtItemCode" text="" styles="width:100%; " csstype="mandatory" /></td>
                    <td style="width:14%;"><gw:textbox id="txtItemName" text="" styles="width:100%; " csstype="mandatory" /></td>
                    <td style="width: 2%;" align="right">
                        <gw:imgbtn img="reset" alt="Reset" id="btnReset3" onclick="OnReset('Item')" />
                    </td>                                                            
                    <td style="width: 8%;" align="right" >WH</td>
                    <td style="width:22%;" colspan="3" ><gw:list id="lstWH" styles="width:100%; " onchange="OnSearch('fmgf00120')" /></td>
                    <td colspan="3" align="right"><gw:icon id="btnInOut" text="Load" styles="width:100%" onclick="OnUpdInOut()" /></td>
                </tr> 
            </table>            
        </td>                     
    </tr>        
    <tr style="height:90%;">
        <td >
            <table width="100%;" border="0" cellpadding="0" cellspacing="0" style="height:100%;" >
                <tr>
                    <td>
                        <gw:grid id="idGrid" 
                            header="|Acc.Cd|Acc.Nm|Item Code|Item Name|UOM|WH|PL CD|PL NM|Begin Qty|Begin Amt|IN Qty|IN Amt|OUT Qty|OUT Amt|End Qty|End Amt|_tac_stockmm_pk"
                            format="0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1" 
                            aligns="2|1|0|1|0|1|0|1|0|3|3|3|3|3|3|3|3|0"
                            defaults="|||||||||||||||||" 
                            editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0" 
                            widths="1000|1200|2000|1200|1500|800|1800|1000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1000"
                            styles="width:100%; height:100%; " 
                            acceptNullDate="T" 
                            sorting="T" 
                            param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17" 
                            onafteredit="OnChange(this)" />                    
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>            
<gw:textbox id="txtTAC_ABACCTCODE_PK" styles="display:none; " />
<gw:textbox id="txtTCO_ITEM_PK" styles="display:none; " />
<gw:textbox id="txttac_abplcenter_pk" styles="display:none; " />
<gw:textbox id="txtReturn" styles="display:none; " />
<gw:textbox id="txtProposedByUserPk"  style="display:none" />
</body>
</html>