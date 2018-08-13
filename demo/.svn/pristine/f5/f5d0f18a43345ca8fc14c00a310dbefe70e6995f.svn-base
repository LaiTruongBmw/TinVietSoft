<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Seach List</title>
  </head>
 <%CtlLib.SetUser("acnt")%>


<script>
var v_language = "<%=Session("SESSION_LANG")%>";
var lang= "<%=Session("Lang")%>";
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
	//var ls_data2    = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACBG0130') FROM DUAL")%>";
	   var ls_data2    ="<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'ACBG0130' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY CODE")%>"; 
	var ls_compk    = "<%=Request.querystring("com_pk")%>";
	var ls_vouchertype  = "<%=Request.querystring("VoucherType")%>";
	lst_compk.SetDataText(ls_compk);
	var ls_vouchertype  = "<%=Request.querystring("VoucherType")%>";
	lst_vouchertype.SetDataText(ls_data2+ "|ALL|Select ALL");
	lst_vouchertype.value=ls_vouchertype;
	lblRecord.SetDataText("0");
	
	//txt_crt_by.SetDataText(_user_id);
	var fg = grid_search.GetGridControl();
   // fg.ColFormat(6) = "#,###,###,###,###,###,###,###,###R";
	var  _dt_fr = dt_from.value; 
	
	 dt_from.value = _dt_fr.substr(0,4)+'0101';
	txt_seq.GetControl().focus();
	chk_status.value = '2';
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
        code_data[0] = grid_search.GetGridData( ctrl.row , 0 );
		window.returnValue = code_data; 
	   	this.close();
    }
}

function OnCancel()
{
	var code_data=new Array()
	code_data[0] = 0;
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
        <dso type="grid" function="acnt.SP_SEL_GRD_SLIP_ENTRY_SEARCH">
            <input bind="grid_search">
                <input bind="lst_compk"/>
                <input bind="dt_from"/>
                <input bind="dt_to"/>
                <input bind="chk_status"/>
                <input bind="txt_seq"/>
                <input bind="txt_voucher"/>
                <input bind="lst_vouchertype"/>
				<input bind="txt_Desc" />
				<input bind="txtAmount"/>
                <input bind="txt_crt_by"/>
            </input>
            <output bind="grid_search"/>
        </dso>
    </xml>
</gw:data>

<table border="0" width="100%" height="100%" cellpadding="0" cellspacing="0">
  <tr>
    <td width="100%" height="100%">
    	<table width="100%" height="100%" cellpadding="0" cellspacing="0" border="1">
            <tr height="15%">
	            <td width="100%">
			        <table cellpadding="0" cellspacing="0" width="100%" height="100%" align="left" border="0">
						<tr>
							<td width="5%" align="right">Company</td>
							<td width="50%">
								<table width="100%">
									<tr>
										<td width="52%" colspan="3"><gw:list id="lst_compk" styles='width:100%'><data><%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%></data></gw:list></td>
										<td width="18%" align="right">Create By</td>
                                        <td width="30%"><gw:textbox id="txt_crt_by" styles='width:100%;text-align: Left' onenterkey="OnSearch()" /></td>
									</tr>
								</table>
							</td>
							<td width="5%" align="right">Seq</td>
							<td width="7%"><gw:textbox id="txt_seq" styles='width:100%;text-align: Left' onenterkey="OnSearch()" onkeypress="CheckNumeric()"/></td>
							<td width="5%">Description</td>
							<td width="30%" colspan="2"><gw:textbox id="txt_Desc" styles='width:100%;text-align: Left' onenterkey="OnSearch()"/></td>
		                </tr>
		                <tr>
							<td width="5%" style="white-space:nowrap" align="right">Entry Date</td>
							<td width="50%">
								<table width="100%">
									<tr>
										<td width="20%"><gw:datebox id="dt_from" lang="<%=Session("Lang")%>"/></td>
										<td width="2%" align="center"> ~ </td>
										<td width="20%"><gw:datebox id="dt_to" lang="<%=Session("Lang")%>" onchange="OnSearch()"/></td>
										<td width="18%" align="right">Voucher Type</td>
                                        <td width="30%"><gw:list id="lst_vouchertype" onenterkey="OnSearch()"  style="width:100%"></gw:list></td>
									</tr>
								</table>
                            </td>
							<td width="5%" align="right" style="white-space:nowrap">Voucher no</td>
							<td width="7%"><gw:textbox id="txt_voucher" styles='width:100%;text-align: Left' onenterkey="OnSearch()" /></td>
							<td colspan="3"></td>
						</tr>  
		                <tr>
							<td width="5%" style="white-space:nowrap" align="right">Slip Status</td>
							<td width="30%">
								<gw:radio id="chk_status" value="0" onchange="OnSearch()"> 
								<span value="0">All</span>
								<span value="1">Saved</span>
								<span value="2">Confirmed</span>
								<span value="3">Approved</span>
								<span value="5">Cancelled </span>
								</gw:radio >
							</td>
							<td width="5%" style="white-space:nowrap" align="right">Amount</td>
							<td width="15%" style="white-space:nowrap" align="right"><gw:textbox id="txtAmount"  styles='width:100%;text-align: right' onenterkey="OnSearch()"/></td>
							<td width="5%" align="right">Total </font>
                            <td width="7%" align="center"><gw:label id="lblRecord" text="" styles="color:red;width:90%;font-weight: bold;font-size:15"/></td> 
							<td width="5%" align="left">vouchers</font></td> 							
							<td width="3%"><gw:imgBtn id="idSearch" img="search" alt="Search"   onclick="OnSearch()"/></td>
							<td width="3%"><gw:imgBtn id="idClose"  img="cancel" alt="Close"    onclick="OnCancel()"/></td>	
						</tr>  						
				    </table>
		        </td>	        
	    	</tr>
	    	
	    	<tr width="100%" height="85%"> 
	    		<td>
	    			<table class="table" cellpadding="0" cellspacing="0" width="100%" height="100%">
	    				<tr>
					    	<td class="itable_content" height="80%">   
							<gw:grid   
							    id="grid_search"
							    header="Seq|Voucher No.|Entry Date|_Company|Trs Type|Trs Name|Amount|Description|Status|Prps By|Cancel cause|Trans Bookamt"   
							    format="0|0|4|0|0|0|0|0|2|0|2|-0"  
							    aligns="1|1|1|0|1|0|3|0|0|0|0|0"  
							    defaults="|||||||||||"  
							    editcol="0|0|0|0|0|0|0|0|0|0|0|0"  
							    widths="1000|1400|1200|1300|800|2500|2000|2000|900|0|1500|1700"  
							    styles="width:100%; height:100%"   
							    acceptNullDate="T"
							    sorting="T"   
							    oncelldblclick="Select()"/>  
				            </td>
		            	</tr>
		            </table>
            	</td>
	    	</tr>
		</table>  
    </td>
	</tr>
</table>

</body>
</html>
