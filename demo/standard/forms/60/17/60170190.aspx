<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<% CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Goods Incoming Inquiry</title>
</head>

<script>

    var  user_pk = "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>"  ;
    var iG0_Slip_No         = 0,
        iG0_Takein_DT       = 1,
        iG0_Acc_Cd          = 2,
        iG0_Acc_Nm          = 3,
        iG0_Item_Code       = 4,
        iG0_Item_Name       = 5,
        iG0_UOM             = 6,
        iG0_Qty             = 7,
        iG0_WH_Name         = 8,
        iG0_Slip_No_WH      = 9;    

    
//------------------------------------------------------------------------
function BodyInit()
{
    BindingDataList();
    txtAccountCode.SetEnable(false);
    txtAccountName.SetEnable(false);
    txtItemCode.SetEnable(false);
    txtItemName.SetEnable(false);
    var str = dtTranFrom.value ;
    
    dtTranFrom.SetDataText(str.substring(0, 6) + "01");
    
    idGrid.GetGridControl().FrozenCols = 2 ;
    FormatGrid();
}
//------------------------------------------------------------------------
function BindingDataList()
{
	var data = '';
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data);
    var data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_id || ' - ' || wh_name wh_name FROM tlg_in_warehouse  WHERE del_if = 0 ORDER BY wh_name  ASC" )%>||ALL";    
    lstWH.SetDataText(data);    
    lstWH.value = '';	
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
            var path = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_sel_60080010_acct_partner";
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
            if(object!=null)
            {
                txtAccountCode.text = object[0];
                txtAccountName.text = object[1];
                txtTAC_ABACCTCODE_PK.text = object[3];
            }    
        break ;
    case 'Item':        
            var path = System.RootURL + "/standard/forms/fm/gf/PopUpGetOneItem.aspx?purchase_yn=N&item_code=" + txtItemCode.text + "&item_name=" + txtItemName.text ;
            var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
            if(object != null)
            {
                txtItemCode.text = object[1];
                txtItemName.text = object[2];
            }                        
        break;
    }
}
//------------------------------------------------------------------------
function OnSearch(pos)
{
    switch (pos)
    {
        case 'fmgf00030' :
        
            fmgf00030.Call("SELECT")
            
        break;
    }
}
//------------------------------------------------------------------------
function OnDataReceive(obj)
{
    var i ;
    switch (obj.id)
    {
        case "fmgf00030" :
            MergeColumn();
          var ctr = idGrid.GetGridControl()
          var lSumTakeinQty = 0;
          
           if(ctr.rows>1)
           {
                for( i =1 ; i< ctr.rows; i++)
               {
                    if(idGrid.GetGridData(i, iG0_Qty) != "")
                        lSumTakeinQty = lSumTakeinQty + parseFloat(idGrid.GetGridData(i, iG0_Qty));
                }
              idGrid.AddRow();
              idGrid.SetGridText(i, 0, "TOTAL");
              idGrid.SetCellBgColor(idGrid.rows-1,0,idGrid.rows-1,idGrid.cols-1,0xA9EBD7);
              idGrid.SetGridText(idGrid.rows-1, iG0_Qty, lSumTakeinQty) ;
              ctr.TopRow = idGrid.rows-1; 
          }         
        break;
    }    
}
//------------------------------------------------------------------------
function OnExcel(obj)
{
    switch (obj)
    {
        case "grdDetail" :
            
        break;
    }   
}
//-----------------------------------------------------
function OnFormatGrid()
{
    var trl ;
    trl = grdDetail.GetGridControl();	
    trl.ColFormat(iColPRODUCT_IN_RECEIPT_QTY )              = "###,###,###,###,###.##R";
    trl.ColFormat(iColBALANCE_BROUGHT_FORWARD )             = "###,###,###,###,###.##R";
    trl.ColFormat(iColBALANCE )                             = "###,###,###,###,###.##R";
                                             
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
    }
}
//-----------------------------------------------------
function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
	var x = c.toUpperCase().charCodeAt(0);
	event.keyCode = x;
}
//-----------------------------------------------------
 function FormatGrid()
 {
    var ctrl ;
    ctrl = idGrid.GetGridControl();    
    ctrl.ColFormat(iG0_Qty)         = "###,###,###.##R" ;    
 }
//-----------------------------------------------------
function MergeColumn()
{
      idGrid.GetGridControl().MergeCells  = 2 ;	
      idGrid.GetGridControl().MergeCol(0) = true ;	
      idGrid.GetGridControl().MergeCol(1) = true ;   	
      idGrid.GetGridControl().MergeCol(2) = true ;	
      idGrid.GetGridControl().MergeCol(3) = true ;	
      idGrid.GetGridControl().MergeCol(4) = true ;		
      idGrid.GetGridControl().MergeCol(5) = true ;	
      idGrid.GetGridControl().MergeCol(6) = true ;	
}
//-----------------------------------------------------          
</script>

<body>
    <!-------------------------------------------------------------------->
    <gw:data id="fmgf00030" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="AC_sel_60170190" > 
                <input bind="idGrid" >                 
                    <input bind="lstCompany"/>
                    <input bind="dtTranFrom"/>
                    <input bind="dtTranTo"/>
                    <input bind="lstWH"/>
                    <input bind="txtSlipNo"/>
                    <input bind="txtTAC_ABACCTCODE_PK"/>
                    <input bind="txtItemCode"/>
                    <input bind="txtItemName"/>                    
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>       
    <!-------------------------------------------------------------------->
<table style="width:100%; " border="1" style="height:100%" >
    <tr style="height:10%; " >
        <td>
            <table width="100%" border="0" >
                <tr >
                    <td style="width: 9%; " align="right">Company</td>
                    <td style="width: 20%" colspan="2" >
                        <gw:list id="lstCompany" styles="width:100%" />
                    </td>
                    <td style="width: 9%" align="right">WH</td>
                    <td style="width: 15%">
                        <gw:list id="lstWH" styles="width:100%" />
                    </td>
                    <td style="width: 8%" align="right" ><a title="Click here to select account" onclick="OnPopUp('Account')" href="#tips">Account</a>
                    </td>
                    <td style="width:10%;"><gw:textbox id="txtAccountCode" text="" styles="width:100%; " csstype="mandatory" /></td>
                    <td style="width:20%;"><gw:textbox id="txtAccountName" text="" styles="width:100%; " csstype="mandatory" /></td>
                    <td style="width: 3%" align="right">
                        <gw:imgbtn img="reset" alt="Reset" id="btnReset" onclick="OnReset('Account')" />
                    </td>                    
                    <td style="width: 3%" align="right">
                        <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('fmgf00030')" />
                    </td>
                    <td style="width: 3%" align="right">
                        <gw:imgbtn img="excel" alt="Print" id="btnExcel" onclick="OnExcel()" />
                    </td>
                </tr>
                <tr>
                    <td style="width:10%; " align="right" >Trans Date</td>
                    <td style="width:10%; " align="left" ><gw:datebox id="dtTranFrom" styles="width:100%; " lang="1" /></td>
                    <td style="width:10%; " align="left" ><gw:datebox id="dtTranTo" styles="width:100%; " lang="1" /></td>
                    <td style=" width:9%" align="right" >TakeIn No</td>
                    <td style=" width:15%"><gw:textbox id="txtSlipNo" text="" csstype="mandatory" styles="width:100%; " onkeypress="Upcase()" /></td>
                    <td style="width: 8%" align="right" ><a title="Click here to select Product Item" onclick="OnPopUp('Item')" href="#tips">Item</a>
                    </td>
                    <td style="width:10%;"><gw:textbox id="txtItemCode" text="" styles="width:100%; " csstype="mandatory" /></td>
                    <td style="width:20%;"><gw:textbox id="txtItemName" text="" styles="width:100%; " csstype="mandatory" /></td>                    
                    <td style="width: 3%" align="right">
                        <gw:imgbtn img="reset" alt="Reset" id="btnReset2" onclick="OnReset('Item')" />
                    </td>                                        
                    <td colspan="2" style="width:10%; "></td>
                </tr>
            </table>            
        </td>                     
    </tr>        
    <tr style="height:90%; " >
        <td>
            <table width="100%" style="height:100%; ">
                <tr>
                    <td>
                        <gw:grid id="idGrid" header="Slip No|Takein DT|Acc.Cd|Acc.Nm|Item Code|Item Name|UOM|Qty|WH Name|Slip No WH"
                            format="0|4|0|0|0|0|0|1|0|0" aligns="1|1|1|0|1|0|1|3|0|1"
                            defaults="|||||||||" editcol="1|1|1|1|1|1|1|1|1|1" widths="1500|1200|1000|2000|1500|3000|800|1400|2000|1500"
                            styles="width:100%; height:100%; " group='T' acceptNullDate="T" sorting="T" param="0,1,2,3,4,5,6,7,8,9" />                    
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>            
<gw:textbox id="txtTAC_ABACCTCODE_PK" styles="display:none; " />
<gw:textbox id="txtTCO_ITEM_PK" styles="display:none; " />
</body>
</html>