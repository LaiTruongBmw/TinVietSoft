<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1"  runat="server">
    <title>Installment Entry</title>
</head>
 
<script>
<%=CtlLib.RenderControlHTML("dat60100020_split_popup","col_index")%>
function BodyInit(){
	txtAmount.text = '<%=Request.QueryString("amount")%>';
	txtTFN_EPPAY_PK.text = '<%=Request.QueryString("pk")%>';
	btnProcess.SetEnable(false);
	dat60100020_split_popup.Call("SELECT");
}
function OnDataReceive(obj){
	switch(obj.id){
		case "dat60100020_split_popup":
			var sum_x = 0;
			for(var x=1;x<grid_int_split.rows;x++){
				sum_x += Number(grid_int_split.GetGridData(x, grid_int_split_Trans_Amt));
			}
			txtRemainAmount.text = sum_x.toString();
		break;
		case "dat60100020_split":
			alert(txtResult.text);
			window.close();
		break;
	}
}
function OnDoubleClick_INTSPLIT(){
	var sum = 0;
	
	if(grid_int_split.rows < 3) return false;
	
	if(grid_int_split.row > 0){
		grid_split.AddRow();
		for(var idx = grid_int_split_TFN_EPPAY_INT_PK; idx <= grid_int_split_Account_name; idx++){
			grid_split.SetGridText(grid_split.rows-1, idx, grid_int_split.GetGridData(grid_int_split.row, idx));
		}
	}
	grid_int_split.RemoveRow(grid_int_split.row);
	
	for(var x=1;x<grid_int_split.rows;x++){
		sum += Number(grid_int_split.GetGridData(x, grid_int_split_Trans_Amt));
	}
	txtRemainAmount.text = sum.toString();
	
	sum = 0;
	
	for(var x=1;x<grid_split.rows;x++){
		sum += Number(grid_split.GetGridData(x, grid_int_split_Trans_Amt));
	}
	txtDevidAmount.text = sum.toString();
	
	btnProcess.SetEnable(grid_split.row > 0);
	
	txtLIST_PK.text = GetListPK();
}

function OnDoubleClick_SPLIT(){
	var sum = 0;
	if(grid_split.row > 0){
		grid_int_split.AddRow();
		for(var idx = grid_int_split_TFN_EPPAY_INT_PK; idx <= grid_int_split_Account_name; idx++){
			grid_int_split.SetGridText(grid_int_split.rows-1, idx, grid_split.GetGridData(grid_split.row, idx));
		}
	}
	grid_split.RemoveRow(grid_split.row);
	
	for(var x=1;x<grid_split.rows;x++){
		sum += Number(grid_split.GetGridData(x, grid_int_split_Trans_Amt));
	}
	txtDevidAmount.text = sum.toString();
	
	sum = 0;
	
	for(var x=1;x<grid_int_split.rows;x++){
		sum += Number(grid_int_split.GetGridData(x, grid_int_split_Trans_Amt));
	}
	txtRemainAmount.text = sum.toString();
	
	btnProcess.SetEnable(grid_split.row > 0);
	
	txtLIST_PK.text = GetListPK();
}

function GetListPK(){
	var list = '';
	
	for(var x=1;x<grid_split.rows;x++){
		if(x==1) list += grid_split.GetGridData(x, grid_int_split_TFN_EPPAY_INT_PK);
		else list = list + "," + grid_split.GetGridData(x, grid_int_split_TFN_EPPAY_INT_PK);
	}
	
	return list;
}

function OnProcess(){
	if(confirm("Are you sure to process!")){
		dat60100020_split.Call();
	}
}
</script>
<body style="margin:0; padding:0;">
<%=CtlLib.RenderControlHTML("dat60100020_split_popup","data")%>
<%=CtlLib.RenderControlHTML("dat60100020_split","data")%>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td width="1%"></td>
		<td width="70%" align="right" style="padding-right:5px">
			Orginal Amount :
		</td>
		<td width="30%">
			<gw:textbox id="txtAmount" format="###,###,###.##" type="number" readonly="true" />
		</td>
	</tr>
	<tr>
		<td width="1%"></td>
		<td width="70%" align="right" style="padding-right:5px">
			Remain Amount :
		</td>
		<td width="30%">
			<gw:textbox id="txtRemainAmount" format="###,###,###.##" type="number" readonly="true" />
		</td>
	</tr>
	<tr style="height:250px">
		<td colspan="3" style="padding-top:5px;padding-bottom:5px;"><%=CtlLib.RenderControlHTML("dat60100020_split_popup","grid")%></td>
	</tr>
	<tr>
		<td width="1%"><gw:button id="btnProcess" img="process" alt="Process" text="Process" onclick="OnProcess();" /></td>
		<td width="70%" align="right" style="padding-right:5px">
			Devid Amount :
		</td>
		<td width="30%">
			<gw:textbox id="txtDevidAmount" format="###,###,###.##" type="number" readonly="true" />
		</td>
	</tr>
	<tr style="height:250px">
		<td colspan="3" style="padding-top:5px"><%=CtlLib.RenderControlHTML("dat60100020_split_popup_split","grid")%></td>
	</tr>
</table>
<gw:textbox id="txtTFN_EPPAY_PK" style="display:none" />
<gw:textbox id="txtLIST_PK" style="display:none" />
<gw:textbox id="txtResult" style="display:none" />
</body>
</html>