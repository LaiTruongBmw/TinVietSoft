<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Unit Price</title>
</head>

<script>
//---------------
 var  user_pk   = "<%=Session("EMPLOYEE_PK")%>"  ;
 var  user_name = "<%=Session("USER_NAME")%>"  ;
 var  g_dept_pk = "<%=Session("DEPT_PK")%>"  ;
 		
//----------------------------------------------------------------------
	        
function BodyInit()
{  
   BindingData();
   OnFormatGrid();
   txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	dso_getCompany.Call();
}
//----------------------------------------------------------------------
function BindingData()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0 ")%>";
    lstCompany.SetDataText(ls_data);
    var ls_tr_type		= "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('CODC0120','01','') FROM DUAL ")%>|ALL|Select all";
     lstTR_TYPE.SetDataText(ls_tr_type);
	var ls_data = "<%=CtlLib.SetListDataSQL("select TRIM(CODE) code, A.code_nm FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'ACBG0130' ")%>";		 
	 lstVCType.SetDataText(ls_data);
	 txtDeptPK.SetDataText(g_dept_pk);
	 txtUserPK.SetDataText(user_pk);
	var v_data = "<%=CtlLib.SetDataSQL("select TRIM(CODE) code FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND B.ID= 'ACBG0040' AND A.DEF_YN = 'Y' ")%>";		 
	 txtBookCcy.SetDataText(v_data);
}

//----------------------------------------------------------------------
function OnFormatGrid()
{
    var ctrl = idGridVC.GetGridControl();
    ctrl.ColFormat(9) = "#,###,###";
    ctrl.ColFormat(11) = "#,###,###,###,###,###.##";
    ctrl.ColFormat(10) = "#,###,###,###,###,###.##";
    
    ctrl = idGridItem.GetGridControl();
    ctrl.ColFormat(5) = "#,###,###,###,###,###.##";
    ctrl.ColFormat(6) = "#,###,###,###,###,###.##";
    ctrl.ColFormat(7) = "#,###,###,###,###,###.##";
 
}

//---------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case "dat_fmgf00150":
            for(i=1;i<idGridVC.rows;i++)
            {
                idGridVC.SetGridText(i,0,i);
            }
        break;
        case "dat_fmgf00150_1":
            for(i=1;i<idGridItem.rows;i++)
            {
                idGridItem.SetGridText(i,0,i);
            }
        break;
        case "dat_fmgf00150_2":
			
			if(idGridVC.rows > 1)
			{
				txtCRCA_PK.SetDatatText(idGridVC.GetGridData(1, 2)) ; //Seq
			}
			else 	
				txtCRCA_PK.text = "";
            onSearch(0);
        break;
    }
    
}
//----------------------------------------------------------------------
function onSearch(index)
{
    switch(index)
    {
        case 0:
            dat_fmgf00150.Call("SELECT");
        break;
    }
}
//----------------------------------------------------------------------
function OnGridDblClick()
{
    
}
//----------------------------------------------------------------------
function OnGridClick()
{
    var tmp = idGridVC.GetGridData(idGridVC.row, 2); //Seq
    txtTacHgtrh_PK.SetDataText(tmp);
    dat_fmgf00150_1.Call("SELECT");
}
//----------------------------------------------------------------------
function OnUpdate()
{
	if(confirm("Do you want to update cost for selected month ?"))
	{
		dat_fmgf00150_2.Call();
	}
}
//----------------------------------------------------------------------
function OnPopupSlipEntry()
{
 
    var ctrl 	= idGridVC.GetGridControl();
	var rows    = ctrl.Rows
	rows = rows - 1;
	var rownum  	= ctrl.Row;
	var colnum  	= ctrl.Col;
	if (rownum > 0)		 
	{
		if (event.col > 1)
		{
			var pk      = idGridVC.GetGridData(ctrl.row, 2);
			var status  = idGridVC.GetGridData(ctrl.row, 14);
			var ls_arr = "";
			for (i = 1; i < idGridVC.rows; i++)
			{
			    ls_arr = ls_arr + ' ' + idGridVC.GetGridData(i, 2);
			}
			
			var fpath   = System.RootURL + '/standard/forms/gf/hg/gfhg00020_popup.aspx?PK_ROW=' + pk + '&ROW=' + ctrl.row + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
			var wWidth  = 950;
			var wHeight = 580;
			var x = Math.round((screen.availWidth - wWidth)/2);
			var y = Math.round((screen.availHeight - wHeight)/2);
			
			var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
			   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
			   "lef="+ x +",top=" + y;
			
			var object = System.OpenModal(fpath, wWidth, wHeight, features);
	    }
    }
}
//----------------------------------------------------------------------
</script>

<body>
    <gw:data id="dat_fmgf00150" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,5,6,7,8,9,10,11" function="AC_sel_60170200"  > 
                <input bind="idGridVC" >
                    <input bind="lstCompany" />                     
                    <input bind="dbMonth" /> 
                    <input bind="rbstatus" /> 
                    <input bind="lstTR_TYPE" /> 
                </input>
                <output  bind="idGridVC" />
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------->
     <gw:data id="dat_fmgf00150_1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid"  parameter="0,1,2,5,6,7,8,9,10,11" function="AC_sel_60170200_1"  > 
                <input bind="idGridItem" >
                    <input bind="lstCompany" />                     
                    <input bind="dbMonth" /> 
					<input bind="txtTacHgtrh_PK" />
                 </input>
                <output  bind="idGridItem" />
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------->
     <gw:data id="dat_fmgf00150_2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="acnt.sp_pro_fmgf00150_22" > 
                <input>
                    <input bind="lstCompany" />                     
                    <input bind="dbMonth" /> 
                    <input bind="lstVCType" /> 
					<input bind="chkAuto" /> 
					<input bind="txtVoucherNo" /> 
					<input bind="txtUserPK" /> 
					<input bind="txtDeptPK" /> 
					<input bind="txtBookCcy" /> 
					<input bind="txtRate" /> 
					<input bind="txtTrSeq" /> 
                 </input>
                <output>
                    <output bind="txtStatus"/>
                </output>
            </dso> 
        </xml> 
    </gw:data>
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
    </gw:data>
    <!--------------------------------------------------------------->
    <table style="width: 100%" border="1">
        <tr>
            <td>
                <table width = "100%" border=0 cellspacing=0 cellpadding=0>
                <tr>
                    <td style="width:10%" align="right">Company</td>
                    <td style="width:15%" align="left"><gw:list id="lstCompany" styles="width:100%" /></td>            
                    <td style="width:12%" align="right">Slip Status</td>
                    <td style="width:10%" colspan=3 align="left">
                        <gw:radio id="rbstatus" value="2" onchange="onSearch(0)"> 
			                <span value="2">Confirmed</span>
			                <span value="0">Approved</span>
			            </gw:radio>
                    </td>                     
                    <td style="width:1%" align="right"><gw:imgbtn id="idBtnSearch" img="search" alt="Search" text="Search" onclick="onSearch(0)" /></td>
                    <td style="width:1%" align="right"><gw:icon id="idBtnSave" img="in" alt="Process" text="Process" onclick="OnUpdate()" /></td>
                   <td style="width:10%" align="right">Book Rate</td>
				   <td style="width:10%" align="right"><gw:textbox id="txtRate" text="1" styles="width:100%;" /></td>
                </tr>
                <tr>
                    <td style="width:10%" align="right" >Monthly</td>
                    <td style="width:15%" align="left" ><gw:datebox id="dbMonth" type="month" lang="1" styles="width:100%" onchange="" /></td>            
                    <td style="width:12%" align="right">Type</td>
                    <td style="width:10%" align="left"><gw:list id="lstTR_TYPE" styles='width:100%' onchange="onSearch(0)"/></td>
                    <td style="width:10%" align="right">Voucher Type</td>            
                    <td style="width:3%" align="left"><gw:list id="lstVCType" styles="width:100;" /></td>
                    <td colspan="1" style="width:10%" align="right">Voucher No</td>
					<td colspan="1" style="width:3%"><gw:checkbox id="chkAuto" value="T" /></td>
					<td colspan="1" style="width:10%"><gw:textbox id="txtTrSeq" styles="width:100%;" /></td>
					<td colspan="1" style="width:10%"><gw:textbox id="txtVoucherNo" csstype="mandatory" styles="width:100%;" /></td>
                </tr>
                </table>
            </td>                
        </tr>
        <tr>
            <!--No|0.Pk|1.Seq|2.Voucher no|3.Voucher date|4.Serial no|5.Invoice date|6.Invoice no|7.CCY|8.Rate|9.Trans. Amt|10.Book amt|11.Description|12.Local Description|14. Status-->
            <td>
                <gw:grid id="idGridVC"                 
                    header="No.|Pk|Seq|Voucher no|Voucher date|Serial no|Invoice date|Invoice no|CCY|Rate|_Trans. Amt|Book amt|Description|Local Description|_Status"
                    format="0|0|0|0|4|0|4|0|0|0|0|0|0|0|0" 
                    aligns="3|3|3|0|1|0|1|0|1|3|3|3|0|0|0" 
                    defaults="||||||||||||||" 
                    editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths="700|700|1000|1600|1300|1000|1200|1200|500|800|1500|1500|2000|2000|0" 
                    styles="width:100%;height:220; " 
                    sorting="T"
                    onafteredit="OnGridDblClick()"
                    oncelldblclick="OnPopupSlipEntry()"
                    oncellclick="OnGridClick()"
                    onselchange="OnGridClick()"
                    acceptNullDate="T" />                
            </td>
        </tr>
         <tr>
            <!---0.No|1.Item Code|2.Item Name|3.Hs Code|4.Unit|5.Quantity|6.U/Price|7.Amount|8.Warehouse-->
            <td>
                <gw:grid id="idGridItem"                 
                    header="No|Item Code|Item Name|Hs Code|Unit|Quantity|U/Price|Amount|Warehouse"
                    format="0|0|0|0|0|0|0|0|0" 
                    aligns="3|0|0|0|1|3|3|3|0" 
                    defaults="||||||||" 
                    editcol="0|0|0|0|0|0|1|0|0"
                    widths="700|2500|3500|1200|600|1500|1500|2000|2500" 
                    styles="width:100%;height:220; " 
                    sorting="T"
                    onafteredit="OnGridDblClick()"
                    oncelldblclick="OnGridDblClick()"
                    acceptNullDate="T" />                
            </td>
        </tr>
    </table>
<!---------------------------------------------------------->
<gw:textbox id="txtTac_abacctcode_pk" styles="display:none; " />
<gw:textbox id="txtTco_item_pk" styles="display:none; " />
<gw:textbox id="txtTac_crca_pk" styles="display:none; " />
<gw:textbox id="txtNUM_PK" styles="display:none; " />
<gw:textbox id="txtCRCA_PK" styles="display:none; " />
<gw:textbox id="txtStatus" styles="display:none; " />
<gw:textbox id="txtUserPK" styles="display:none; " />
<gw:textbox id="txtDeptPK" styles="display:none; " />
<gw:textbox id="txtBookCcy" styles="display:none; " />
<gw:textbox id="txtTacHgtrh_PK" styles="display:none; " />
<gw:textbox id="txtProposedByUserPk"  style="display:none" />
</body>
</html>
