<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Delete Bill Log</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
    
function BodyInit(){
    var data;
    data = "<%=CtlLib.SetListDataSQL("SELECT A.* FROM (SELECT CODE, NAME FROM tco_commcode WHERE PARENT_CODE = 'POINT' and del_if = 0 UNION SELECT '','ALL' FROM DUAL) A ORDER BY A.CODE")%>";
	lstLocation.SetDataText(data);
	lstLocation.value = '';
    OnSearch();
}

function OnSearch(){
    dat_Invoices.Call('SELECT');
}

function OnReport(){
	var url = "";
	var p_loc = (lstLocation.GetData().length > 0)?lstLocation.GetData():"0";
	url = '/reports/ja/ma/rpt_jama00190.aspx?p_fr=' + dtfr.GetData() + '&p_to=' + dtTo.GetData() + '&p_loc=' + p_loc;
	System.OpenTargetPage( System.RootURL + url , "newform" );
}
</script>
<body>
<gw:data id="dat_Invoices"> 
    <xml> 
        <dso  type="grid" function="ht_sel_60300040"> 
            <input bind="grdInvoices"> 
				<input bind="dtfr" /> 
                <input bind="dtTo" /> 
                <input bind="txtInvoiceNo" /> 
                <input bind="lstLocation" />
            </input> 
            <output bind="grdInvoices"></output>
        </dso> 
    </xml> 
</gw:data>
<table width="100%" style="height:100%">
    <tr style="height: 5%">
        <td width="5%" align="center"><b>Date</b></td>
        <td width="10%" >
            <gw:datebox id="dtfr"  lang="1" onchange="OnSearch()" />
        </td>
        <td width="2%">~</td>
        <td width="10%" >
            <gw:datebox id="dtTo"  lang="1" onchange="OnSearch()" />
        </td>
        <td style="width:5%">
			Invoice#
		</td>
		<td style="width:10%">
			<gw:textbox id="txtInvoiceNo" styles="width:100%;"  />
		</td>
		<td align="right" width="3%"><b>Location</b></td>
			<td align="left" width="20%"><gw:list id="lstLocation" onchange="OnSearch()" /></td>
        <td width="1px" align="right">
            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
        </td>
		<td width="1px">
			<gw:imgbtn img="excel" alt="Bills Delete Reports" text="Bills Delete Reports" id="btnReport1" onclick="OnReport()" />
		</td>
		<td width="50%">&nbsp;</td>
    </tr>
    <tr style="height: 95%">
        <td colspan="11">
             <gw:grid 
                id="grdInvoices"
                header  ="Invoice No|Invoice Date|Item Name|Price|Q.Ty|Amount|Delete Reason|Create By|Create Date|Delete By|Detele Date|Status|Location" 
                format  ="0|4|0|-0|-2|-0|0|0|0|0|0|0|0"
                aligns  ="1|1|0|0|0|0|0|0|0|0|0|0|0" 
                defaults="||||||||||||"
                editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0" 
                sorting ='T'
                autosize='T'
                styles  ="width:100%; height:100%"
                />
        </td>
    </tr>
</table>
</body>
</html>
