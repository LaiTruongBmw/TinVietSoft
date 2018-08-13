<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Receipt/Payment Inquiry</title>
  </head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
var g_report_opt = '2';
var g_company_pk = "<%=Session("COMPANY_PK") %>";
<%=CtlLib.RenderControlHTML("dso_600100130","col_index") %>
function BodyInit()
{
    System.Translate(document);
    var ls_data8    = "<%=CtlLib.SetListDataSQL("SELECT B.CODE,B.CODE_LNM FROM tac_commcode_master a, tac_commcode_detail b WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'ERROR_TYPE' AND a.del_if = 0 AND b.del_if = 0 AND B.USE_YN ='Y' ORDER BY B.DEF_YN DESC,B.ORD")%>";  
    lst_error_type.SetDataText(ls_data8);
}
function OnSearch()
{
	dso_600100130.Call("SELECT");
}
function OnDataReceive(obj)
{
	if(obj=='')
	{
	}
}
function OnCellDBClickSEQ()
{
	if(grd_check_error.row >0)
	{
		var ctrl = grd_check_error.GetGridControl();
		var ls_arr="";
        rows = ctrl.Rows;
        rows = rows - 1;
        rownum = ctrl.row;
        pk = grd_check_error.GetGridData(grd_check_error.row, 0);
        status = grd_check_error.GetGridData(grd_check_error.row, 7);

		var fpath = System.RootURL + '/standard/forms/gf/hg/gfhg00020_popup.aspx?PK_ROW=' + pk + '&ROW=' + rownum + '&ROWS=' + rows + '&APPRCANCEL=' + status + "&ARRAY_PK=" + ls_arr;
        var wWidth = 950;
        var wHeight = 600;
        var x = Math.round((screen.availWidth - wWidth)/2);
        var y = Math.round((screen.availHeight - wHeight)/2);
        
        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +"lef="+ x +",top=" + y;
        var object = System.OpenModal(fpath, wWidth, wHeight, features, window);
	}
}
</script>
<body style="margin:0; padding:0;">
<%=CtlLib.RenderControlHTML("dso_600100130","data") %> 	
<table style="width: 100%; height: 100%" >
	<tr style="height: 2%">
	   <td align="right" width="8%">Error Type</td>
	   <td width="30%"><gw:list id="lst_error_type" onChange="OnSearch()" value ="" styles='width:100%'></gw:list></td>
	   <td width="3%" align="right"> <gw:imgbtn id="btnSearch" img="Search" alt="Search" onclick="OnSearch()" /></td>
	   <td width="59%"></td>
	</tr>
	<tr style="height: 98%">
		<td colspan=4 >
			<%=CtlLib.RenderControlHTML("dso_600100130","grid") %>
		</td>
	</tr>
</table>
</body>
</html>
