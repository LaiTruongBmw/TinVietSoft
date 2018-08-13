<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
<title>Other Inventory</title>
</head>

<script>

    var  user_pk = "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>"  ;
    var g_company_pk = "<%=Session("COMPANY_PK")%>"  ;
var g_ItemCode = 0,
    g_ItemName = 1,
    g_Qty       = 2,
    g_TransAmt_DR = 3,
    g_BookAmt_DR = 4,
    g_TransAmt_CR = 5,
    g_BookAmt_CR = 6,
    g_VendorCode = 7,
    g_VendorName = 8,
    g_Status = 9,
    g_tco_item_pk = 10,
    g_vendor_pk = 11;   
//------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
}
//------------------------------------------------------------------------
function BindingDataList()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_data);
    //lstCompany.value = g_company_pk ;
    var data = "<%=CtlLib.SetListDataSQL("SELECT pk, wh_name FROM tlg_in_warehouse WHERE del_if = 0 ORDER BY wh_name ASC" )%>|ALL|ALL";    
    lstWH.SetDataText(data); 
    lstWH.value = 'ALL';     
    ///////////////////Account code
    var v_ac_cd = "<%=CtlLib.SetDataSQL("select a.char_4 from tac_commcode_detail a where a.tac_commcode_master_pk = (select b.pk from tac_commcode_master b where b.id = 'EACAB011' and b.del_if = 0) and a.code = '60040020' and a.del_if = 0" )%>";
    var v_ac_pk = "<%=CtlLib.SetDataSQL("select pk from tac_abacctcode where ac_cd in (select a.char_4 from tac_commcode_detail a where a.tac_commcode_master_pk = (select b.pk from tac_commcode_master b where b.id = 'EACAB011' and b.del_if = 0) and a.code = '60040020' and a.del_if = 0) and del_if = 0" )%>";
    var v_ac_nm = "<%=CtlLib.SetDataSQL("select ac_nm from tac_abacctcode where ac_cd in (select a.char_4 from tac_commcode_detail a where a.tac_commcode_master_pk = (select b.pk from tac_commcode_master b where b.id = 'EACAB011' and b.del_if = 0) and a.code = '60040020' and a.del_if = 0) and del_if = 0" )%>";
    txtAccountCode.SetDataText(v_ac_cd);
    txtAccountName.SetDataText(v_ac_nm);
    txtTAC_ABACCTCODE_PK.SetDataText(v_ac_pk);
    var v_tr_date = dbTo.value ;
    dbFrom.value = v_tr_date.substring(0, 6) + '01';
}
function OnPopUp(iCase)
{
    if(iCase == "Account")
    {
        var path = System.RootURL + "/standard/forms/60/09/60090050_popup.aspx?comm_code=&comm_nm=&dsqlid=ac_sel_60090050_popup&val1=" + lstCompany.value + "&val2=" + lstWH.value + "&val3=" ;
        var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
        if(object!=null)
        {
            txtAccountCode.text = object[0];
            txtAccountName.text = object[1];
            txtTAC_ABACCTCODE_PK.text = object[3];
        }            
    }
    else if(iCase == 'Vendor')
    {
		var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx';
		var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
		if ( object != null )
		{
			if (object[0] != 0)
			{
				txtVendorPK.text = object[0];
				txtVendorNM.text = object[2];
				txtVendorCD.text = object[1];
            }
        }                        
    }
    else if(iCase == 'Item')
    {
        var path = System.RootURL + "/standard/forms/60/11/60110190_popup_get_one_item.aspx?purchase_yn=&item_code=" + txtItemCode.text + "&item_name=" + txtItemName.text ;
        var object = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');        
        if(object != null)
        {
            txtTCO_ITEM_PK.text = object[0] ;
            txtItemCode.text = object[1];
            txtItemName.text = object[2];
        }                            
    }
}

function OnDblClick()
{
    if(idGrid.GetGridData(event.row, g_tco_item_pk) != '')
    {
        var path = System.RootURL + "/standard/forms/60/09/60090110_DiffQty_Details.aspx?com_pk=" + lstCompany.value + "&date_from=" + dbFrom.value + "&date_to=" + dbTo.value + "&wh_pk=" + lstWH.value + "&item_pk=" + idGrid.GetGridData(event.row, g_tco_item_pk) + "&ac_cd=" + txtAccountCode.GetData() + "&vendor_pk=" + idGrid.GetGridData(event.row, g_vendor_pk);
        var object = System.OpenModal( path ,900, 600, 'resizable:yes;status:yes'); 
    }
}

function OnReset(iCase)
{
    if(iCase == 'Item')
    {
        txtItemCode.SetDataText('');
        txtItemName.SetDataText('');
        txtTCO_ITEM_PK.SetDataText('');
    }
    else if(iCase == 'Account')
    {
        txtAccountCode.SetDataText('');
        txtAccountName.SetDataText('');
        txtTAC_ABACCTCODE_PK.SetDataText('');
    }
    else if(iCase == 'Vendor')
    {
        txtVendorCD.SetDataText('');
        txtVendorNM.SetDataText('');
        txtVendorPK.SetDataText('');
    }
}

function OnSearch()
{
    dso_get_data.Call("SELECT");
}

function OnDataReceive(iObj)
{
    if(iObj.id = 'dso_get_data')
    {
        var i, v_qty = 0, v_trans_amt_dr = 0, v_book_amt_dr = 0, v_trans_amt_cr = 0, v_book_amt_cr = 0;
        for(i = 1; i < idGrid.rows ; i++)
        {
            if(idGrid.GetGridData(i, g_Status) == 'receive more...')                   
            {
                idGrid.SetCellBgColor(idGrid.rows-1, 0,idGrid.rows-1,idGrid.cols-1,0xA178F7);
            }
            v_trans_amt_dr += Number(idGrid.GetGridData(i, g_TransAmt_DR));
            v_book_amt_dr += Number(idGrid.GetGridData(i, g_BookAmt_DR));
            v_trans_amt_cr += Number(idGrid.GetGridData(i, g_TransAmt_CR));
            v_book_amt_cr += Number(idGrid.GetGridData(i, g_BookAmt_CR));
            v_qty += Number(idGrid.GetGridData(i, g_Qty));
        }
        idGrid.AddRow();
        idGrid.SetGridText(idGrid.rows - 1, g_ItemName, 'Total: ' );
        idGrid.SetGridText(idGrid.rows - 1, g_Qty, v_qty );
        idGrid.SetGridText(idGrid.rows - 1, g_TransAmt_DR, v_trans_amt_dr );
        idGrid.SetGridText(idGrid.rows - 1, g_BookAmt_DR, v_book_amt_dr );
        idGrid.SetGridText(idGrid.rows - 1, g_TransAmt_CR, v_trans_amt_cr );        
        idGrid.SetGridText(idGrid.rows - 1, g_BookAmt_CR, v_book_amt_cr );
        idGrid.SetCellBgColor(idGrid.rows-1, 0,idGrid.rows-1,idGrid.cols-1,0xFFB35C);
        var fg = idGrid.GetGridControl();
        fg.ColFormat(g_Qty) = "###,###,###.###R";
        fg.ColFormat(g_TransAmt_DR) = "###,###,###,###,###.##R";
        fg.ColFormat(g_BookAmt_DR) = "###,###,###,###,###R";
        fg.ColFormat(g_TransAmt_CR) = "###,###,###,###,###.##R";
        fg.ColFormat(g_BookAmt_CR) = "###,###,###,###,###R";
    }    
}
//------------------------------------------------------------------------
</script>

<body>
<!------------------------------------------------------------------------------------------->
  <gw:data id="dso_get_data" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="ac_sel_60090110_other_inv" > 
                <input bind="idGrid" >                 
                    <input bind="lstCompany"/>
                    <input bind="dbFrom"/>
        			<input bind="dbTo"/>
                    <input bind="lstWH"/>                    
                    <input bind="txtTCO_ITEM_PK"/>                    
                    <input bind="txtAccountCode"/>                    
                    <input bind="txtVendorPK"/>                    
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>           
<!------------------------------------------------------------------------------------------->        
<table style="width:100%; height:100%; " border="1" cellpadding="0" cellspacing="0" >
    <tr style="height:10%;">
        <td>
            <table width="100%" border="0" cellpadding="0" cellspacing="0"  >
                <tr>
                    <td style="width: 8%"></td>
                    <td style="width: 16%"></td>
                    <td style="width: 12%"></td>
                    <td style="width: 8%"></td>
                    <td style="width: 16%"></td>
                    <td style="width: 2%"></td>
                    <td style="width: 8%"></td>
                    <td style="width: 10%"></td>
                    <td style="width: 16%"></td>
                    <td style="width: 2%"></td>
                    <td style="width: 2%"></td>                    
                </tr>
				<tr >
                    <td align="right">Company</td>
                    <td align="left"><gw:list id="lstCompany" styles="width:100%" /></td>				
					<td align="right">Trans Date</td>
					<td align="left" ><gw:datebox id="dbFrom" type="date" lang="1" /></td>
					<td align="right" colspan="2" ><gw:datebox id="dbTo" type="date" lang="1" /></td>
                    <td align="right" ><a title="Click here to select Product Item" onclick="OnPopUp('Item')" href="#tips">Item</a></td>
                    <td align="left" ><gw:textbox id="txtItemCode" text="" styles="width:100%; " /></td>
                    <td align="left" ><gw:textbox id="txtItemName" text="" styles="width:100%; " /></td>
                    <td align="right">
						<gw:imgbtn img="reset" alt="Reset" id="btnReset3" onclick="OnReset('Item')" />
                    </td>                                                            					
                    <td align="right"><gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch()" /></td>
				</tr>
				<tr > 
                    <td align="right" >WH</td>
                    <td colspan="1" align="left" ><gw:list id="lstWH" styles="width:100%; " onchange="OnSearch()" /></td>				
                    <td align="right" ><a title="Click here to select account" onclick="OnPopUp('Account')" href="#tips">Account code</a></td>
                    <td align="left"><gw:textbox id="txtAccountCode" text="" styles="width:100%; " /></td>
                    <td align="left"><gw:textbox id="txtAccountName" text="" styles="width:100%; " /></td>
                    <td align="right">
                        <gw:imgbtn img="reset" alt="Reset" id="btnReset" onclick="OnReset('Account')" />
					</td>
                    <td align="right" ><a title="Click here to select item code" onclick="OnPopUp('Vendor')" href="#tips">Vendor</a></td>
                    <td align="left"><gw:textbox id="txtVendorCD" text="" styles="width:100%; " /></td>
                    <td align="left" ><gw:textbox id="txtVendorNM" text="" styles="width:100%; " /></td>                    
                    <td align="right"><gw:imgbtn img="reset" alt="Reset" id="btnReset2" onclick="OnReset('Vendor')" /></td>                    										
				</tr>
            </table>            
        </td>                     
    </tr>   
    <tr style="height:90%;">
        <td colspan="11">
            <gw:grid id="idGrid" 
                header="Item Code|Item Name|Q'ty|Debit Trans Amt|Debit Book Amt|Credit Trans Amt|Credit Book Amt|Vendor Code|Vendor Name|Status|_tco_item_pk|_vendor_pk"
                format="0|0|0|0|0|0|0|0|0|0|0|0" 
                aligns="1|2|3|3|3|3|3|1|2|2|0|0"
                defaults="|||||||||||" 
                editcol="0|0|0|0|0|0|0|0|0|0|0|0" 
                widths="1200|2500|1200|1700|1700|1600|1600|1400|2200|1200|0|0"
                styles="width:100%; height:100% " 
                acceptNullDate="T" 
                sorting="T" 
                oncelldblclick="OnDblClick()" />                            
        </td>
    </tr>     
 </table>    
<gw:textbox id="txtTAC_ABACCTCODE_PK" styles="display:none; " />
<gw:textbox id="txtVendorPK" styles="display:none; " />
<gw:textbox id="txtTCO_ITEM_PK" styles="display:none; " />
</body>
</html>