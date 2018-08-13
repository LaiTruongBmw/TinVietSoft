<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>GD-AR Checking</title>
</head>

<script>

    var  user_pk = "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>"  ;
    var iG0_Slip_No         = 0,
        iG0_SO_No       = 1,
        iG0_Item_Code       = 2,
        iG0_Item_Name       = 3,
        iG0_UOM             = 4,
        iG0_Qty             = 5,
		iG0_Get_Qty			= 6,
		iG0_UPrice			= 7,
		iG0_Amount			= 8,
		iG0_Ccy				= 9,
		iG0_Stock_Date		= 10,
		iG0_Get_YN			= 11,
		iG0_Seq				= 12,
		iG0_Voucher_No		= 13,
		iG0_Trans_Date   	= 14,
		iG0_Invoice_No		= 15,
		iG0_Invoice_Date	= 16,
		iG0_Partner_ID		= 17,
		iG0_Partner_Name	= 18,		
		iG0_Status 			= 19,
		iG0_Form_Name		= 20,
		iG0_Inv_Qty 		= 21 ,
		iG0_tac_crca_pk		= 22,
		iG0_Branch			= 23 ;
		
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
    
	txtUser_Pk.text = "<%=Session("USER_PK")%>";
	
	// Status
	lstStatus.value = "" ;
	
	dso_getCompany.Call();
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
          //  var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=&comm_nm2=&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=SP_SEL_ACCT_POPUP";         
            var path = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_code=&comm_nm=&dsqlid=ac_SEL_fmgf00050_3&val1=" + lstCompany.value + "&val2=" + lstWH.value + "&val3=" ;

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
        case 'dso_60110140' :
        
            dso_60110140.Call("SELECT")
            
        break;
    }
}
//------------------------------------------------------------------------
function OnDataReceive(obj)
{
    var i ;
    switch (obj.id)
    {
        case "dso_60110140" :
			var l_delivery_qty = 0, l_get_qty = 0 , l_sum_qty = 0, l_sum_qty_get = 0;
			for(i = 1; i < idGrid.rows; i++)
			{
				l_delivery_qty = Number(idGrid.GetGridData(i, iG0_Qty));
				l_get_qty = Number(idGrid.GetGridData(i, iG0_Get_Qty));
				//alert(l_delivery_qty);
				if(l_delivery_qty > l_get_qty)
				{
					idGrid.SetCellBgColor(i, 0, i,idGrid.cols-1,0xA9EBD7);
				}
				else if(l_delivery_qty < l_get_qty)
				{
					idGrid.SetCellBgColor(i, 0, i,idGrid.cols-1,0xFF66FF);
				}
				// sum quantity
				l_sum_qty += Number(idGrid.GetGridData(i, iG0_Qty));
				l_sum_qty_get += Number(idGrid.GetGridData(i, iG0_Get_Qty));
			}
			idGrid.AddRow();
			idGrid.SetGridText(idGrid.rows - 1, iG0_Qty, l_sum_qty);
			idGrid.SetGridText(idGrid.rows - 1, iG0_Get_Qty, l_sum_qty_get);
			idGrid.SetCellBgColor(idGrid.rows - 1, 0, idGrid.rows - 1,idGrid.cols-1,0xA9EBD7);
			FormatGrid();
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
    ctrl.ColFormat(iG0_Get_Qty)         = "###,###,###.##R" ; 
    ctrl.ColFormat(iG0_UPrice)         = "###,###,###.##R" ;   
    ctrl.ColFormat(iG0_Amount)         = "###,###,###,###,###R" ; 
	ctrl.ColFormat(iG0_Get_Qty)         = "###,###,###,###,###R" ; 	
	ctrl.ColFormat(iG0_Inv_Qty)         = "###,###,###,###,###R" ; 	
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
function OnRelease()
{
	var l_row ;
}
//-----------------------------------------------------
function OnSetRelease()
{
	var l_row, l_status ;
	l_row = event.row ;
	alert(l_row);
	if(l_row > 0)
	{
		l_status = idGrid.GetGridData(l_row, iG0_Status);
		alert(l_status);
		if(l_status.toUpperCase() == "CANCELLED")
		{
			alert(l_status.toUpperCase());
			var l_inv_qty = Number(idGrid.GetGridData(l_row, iG0_Inv_Qty));
			var l_tot_get_qty = Number(idGrid.GetGridData(l_row, iG0_Get_Qty));
			if(l_inv_qty < l_tot_get_qty)
			{
				lblStatus.text = "" ;
			}
			else
			{
				lblStatus.text = "Can release this row to modify" ;
			}
		}
	}
}
//-----------------------------------------------------
function OnRelease()
{
	var l_row, l_status ;
	l_row = idGrid.row ;
	if(confirm("Dou you want to release this AR slip to modify?"))
	{
		if(l_row > 0)
		{
			l_status = idGrid.GetGridData(l_row, iG0_Status);
			if(l_status.toUpperCase() == "CANCELLED" || l_status.toUpperCase() == "SAVED")
			{				
				var l_inv_qty = Number(idGrid.GetGridData(l_row, iG0_Inv_Qty));
				var l_tot_get_qty = Number(idGrid.GetGridData(l_row, iG0_Get_Qty));
				if(l_inv_qty < l_tot_get_qty)
				{
					lblStatus.text = "" ;
					alert("Can not cancel this A/R Slip");
				}
				else
				{
					lblStatus.text = "Can release this row to modify" ;
					txtTac_crca_Pk.SetDataText(idGrid.GetGridData(l_row, iG0_tac_crca_pk));
					dso_ar_release.Call();
				}
			}
		}
	}	
}
//-----------------------------------------------------
</script>

<body>
    <!-------------------------------------------------------------------->
    <gw:data id="dso_60110140" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="ac_sel_60110140" > 
                <input bind="idGrid" >                 
                    <input bind="lstCompany"/>
                    <input bind="dtTranFrom"/>
                    <input bind="dtTranTo"/>
                    <input bind="lstWH"/>
                    <input bind="txtSlipNo"/>
                    <input bind="txtTAC_ABACCTCODE_PK"/>
                    <input bind="txtItemCode"/>
                    <input bind="txtItemName"/>
					<input bind="chkGetYN"/>
					<input bind="lstStatus"/>
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>     
	
	<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_gfac00100_1" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>	

    <gw:data id="dso_ar_release" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso type="process" procedure="ac_pro_60110140_release" >
                <input> 
					<input bind="lstCompany"/>
                    <input bind="txtTac_crca_Pk"/>					 
                </input>  
                <output>
                     <output bind="txtReturn"/>
				</output> 
            </dso> 
        </xml> 
    </gw:data>
	
    <!-------------------------------------------------------------------->
<table style="width:100%; " border="1" style="height:100%" >
    <tr style="height:8%;" >
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
                        <gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch('dso_60110140')" />
                    </td>
                    <td style="width: 3%" align="right">
                        <gw:imgbtn img="excel" alt="Print" id="btnExcel" onclick="OnExcel()" />
                    </td>
                </tr>
                <tr>
                    <td style="width:10%; " align="right" >Trans Date</td>
                    <td style="width:10%; " align="left" ><gw:datebox id="dtTranFrom" styles="width:100%; " lang="1" /></td>
                    <td style="width:10%; " align="left" ><gw:datebox id="dtTranTo" styles="width:100%; " lang="1" /></td>
                    <td style=" width:9%" align="right" >Delivery No</td>
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
				<tr>
					<td align="right" >Status</td>
					<td align="left"><gw:list id="lstStatus" styles="width:100%;" onchange="OnSearch('dso_60110140')" >
						<data>DATA|1|Saved|2|Confirmed|0|Approved|3|Cancelled||ALL</data>
						</gw:list>
					</td>
					<td colspan="4"></td>
					<td ><gw:label id="lblStatus" text="" /></td>
					<td align="right"><gw:icon id="btnUnLoad" text="Release" alt="Release to modify" styles="" onclick="OnRelease()" /></td>
					<td align="right">Get Y/N</td>
					<td><gw:checkbox id="chkGetYN" onclick="OnSearch('dso_60110140')" /></td>
					<td></td>
				</tr>
            </table>            
        </td>                     
    </tr>        
    <tr style="height:92%; " >
        <td>
            <table width="100%" style="height:100%; ">
                <tr>
                    <td>
                        <gw:grid 
							id="idGrid" 
							header="Slip No|SO No|Item Code|Item Name|UOM|Output Qty|Total Get Qty|Unit Price|Amount|Ccy|Stock Date|Get YN|Seq|Voucher No|Trans Date|Invoice No|Invoice Date|Partner ID|Partner Name|Status|Form Name|Invoice Qty|_TAC_CRCA_PK|Branch"
                            format="0|0|0|0|0|0|0|0|0|0|4|3|0|0|4|0|4|0|0|0|0|0|0|0" 
							aligns="2|1|1|2|1|3|3|3|3|1|1|1|1|2|1|1|1|1|2|1|2|3|0|2"
                            defaults="|||||||||||||||||||||||" 
							editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
							widths="1500|1500|1500|2500|800|1500|1600|1500|1500|1000|1200|1000|1000|1500|1500|1500|1500|1500|2500|1000|1400|1400|0|1600"
                            styles="width:100%; height:100%; " 
							group='T' 
							acceptNullDate="T" 
							sorting="T" 							
							oncellclick="OnSetRelease()"
							/>                    
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>            
<gw:textbox id="txtTAC_ABACCTCODE_PK" styles="display:none; " />
<gw:textbox id="txtTCO_ITEM_PK" styles="display:none; " />
<gw:textbox id="txtUser_Pk"               style="display:none" />
<gw:textbox id="txtTac_crca_Pk"               style="display:none" />
<gw:textbox id="txtReturn"               style="display:none" />
</body>
</html>