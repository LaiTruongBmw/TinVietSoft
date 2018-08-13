<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Seach List</title>
  </head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>


<script>
var _user_id = "<%=Session("USER_ID")%>";
function BodyInit()
{
	System.Translate(document);
	<%=CtlLib.SetGridColumnComboFormat("grid_search", 8,"SELECT CODE, CODE_NM  FROM TCO_ABCODE WHERE DEL_IF = 0 AND TCO_ABCODEGRP_PK = 281 order by CODE_NM")%>;
	chk_status.SetDataText("");
	var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
	var ls_date_to     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(SYSDATE), 'YYYYMMDD') FROM DUAL")%>";
	dt_from.SetDataText(ls_date_fr);
	dt_to.SetDataText(ls_date_to);
	
	 var ls_data2    ="<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'ACBG0130' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY CODE")%>"; 
	 var ls_crt_by    ="<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'ACBG0197' AND M.DEL_IF = 0 and DEF_YN = 'Y' AND D.DEL_IF = 0 ORDER BY CODE")%>"; 
	var ls_compk        = "<%=Request.querystring("com_pk")%>";
	var ls_vouchertype  = "<%=Request.querystring("VoucherType")%>";
	
	
	lst_compk.SetDataText(ls_compk);
	lst_vouchertype.SetDataText(ls_data2);
	lst_vouchertype.value=ls_vouchertype;
	lst_vouchertype.SetEnable(false);
	lblRecord.SetDataText("0");
	txt_crt_by.SetDataText(_user_id);
	lst_crt_by_acnt.SetDataText(ls_crt_by);
	if(lst_crt_by_acnt.value=='N')
	{
		txt_crt_by.text = '';
	}
	txt_seq.GetControl().focus();
	OnSearch();
}

function OnSearch()
{
	dso_sel_grd_slip_entry_search.Call("SELECT");
}

function Select()
{
	var code_data=new Array()
	var ctrl = grid_search.GetGridControl();
    if(ctrl.SelectedRows == 0){
       alert("Please select a voucher.");
       return;
    }
    else
    {
        code_data[0] = grid_search.GetGridData( ctrl.row , 10 );
        code_data[1] = grid_search.GetGridData( ctrl.row , 0 );
		window.returnValue = code_data; 
	   	this.close();
    }
}

function OnCancel()
{
	var code_data=new Array()
	code_data[0] = 0;
	code_data[1] = 0;
	window.returnValue = code_data; 
	this.close();
}

function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null;
}

function OnRecv()
{
	var ctrl = grid_search.GetGridControl();
	var i = ctrl.rows - 1;
	lblRecord.SetDataText(i);
}

</script>
<body>

<gw:data id="dso_sel_grd_slip_entry_search" onreceive="OnRecv()">
    <xml>
        <dso type="grid" function="<%=Request.querystring("dsql")%>">
            <input bind="grid_search">
                <input bind="lst_compk"/>
                <input bind="dt_from"/>
                <input bind="dt_to"/>
                <input bind="chk_status"/>
                <input bind="txt_seq"/>
                <input bind="txt_voucher"/>
                <input bind="lst_vouchertype"/>
                <input bind="txt_crt_by"/>
				<input bind="txtDescription"/>
            </input>
            <output bind="grid_search"/>
        </dso>
    </xml>
</gw:data>

<table border="0" width="100%" height="100%" cellpadding="1" cellspacing="1">
	<tr height="2%">
		<td width="15%" align="right">Company</td>
		<td width="" colspan="3"><gw:list id="lst_compk" styles='width:100%'><data><%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%></data></gw:list></td>
		<td width="20%" align="right">Create By</td>
		<td width="20%"><gw:textbox id="txt_crt_by" styles='width:100%;text-align: Left' onenterkey="OnSearch()" /></td>
		<td width="15%" align="right" >Seq</td>
		<td width="30%" colspan=""><gw:textbox id="txt_seq" styles='width:100%;text-align: Left' onenterkey="OnSearch()" onkeypress="CheckNumeric()"/></td>
		<td width=""><gw:button id="idClose"  img="close" alt="Close"    onclick="OnCancel()"/></td>
	</tr>
	<tr height="2%">
		<td width="" align="right">Entry Date</td>
		<td width=""><gw:datebox id="dt_from" lang="<%=Session("Lang")%>"/></td>
		<td width="" align="center"> ~ </td>
		<td width=""><gw:datebox id="dt_to" lang="<%=Session("Lang")%>" onchange="OnSearch()"/></td>
		<td width="" align="right">Voucher Type</td>
		<td width="" ><gw:list id="lst_vouchertype" onenterkey="OnSearch()"></gw:list></td>
		<td width="" align="right">Voucher no</td>
		<td width="" colspan=""><gw:textbox id="txt_voucher" styles='width:100%;text-align: Left' onenterkey="OnSearch()" /></td>
		<td width=""><gw:button id="idSearch" img="search" alt="Search"   onclick="OnSearch()"/></td>		
	</tr>
	<tr height="2%">
		<td width="" align="right">Slip Status</td>
		<td width="" colspan='5'>
			<table width="100%">
				<tr>
					<td width="" >
					<gw:radio id="chk_status" value="0" onchange="OnSearch()"> 
					<span value="0">All</span>
					<span value="1">Saved</span>
					<span value="2">Confirmed</span>
					<span value="3">Approved</span>
					<span value="5">Cancelled </span>
					</gw:radio ></td>
					<td width="" align="right">Total</td> 
					<td width="" align="center" style='white-space:nowrap'><gw:label id="lblRecord" text="" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td> 
					<td width="" align="">vouchers</td> 
				</tr>
			</table>
		</td>
		<td width="" align="right">Description</td>
		<td width="" colspan="2"><gw:textbox id="txtDescription" styles='width:100%;text-align: Left' onenterkey="OnSearch()" /></td>					
		
	</tr>  	
	<tr height="94%">
		<td class="itable_content" colspan='9'>   
			<gw:grid   
			id="grid_search"
			header="Seq|Voucher No.|Entry Date|_Company|Trs Type|Trs Name|Amount|Description|Status|Prps By|_SEQ_TRH|Cancel cause"   
			format="0|0|4|0|0|0|0|0|2|0|0|0"  
			aligns="1|1|1|0|1|0|3|0|0|0|0|0"  
			defaults="|||||||||||"  
			editcol="0|0|0|0|0|0|0|0|0|0|0|0"  
			acceptNullDate="T"
			widths="1000|1400|1200|1300|800|2500|2000|2000|900|0|0|1500"  
			styles="width:100%; height:100%"   
			sorting="T"   
			oncelldblclick="Select()"/>  
		</td>
	</tr>
</table>
<gw:list id="lst_crt_by_acnt" styles='width:100%;text-align:Left;display:none' />
</body>
</html>
