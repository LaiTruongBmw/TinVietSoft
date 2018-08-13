<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Summary By Invoice</title>
  <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
    Binding();
    OnSearch();
}
function Binding()
{
    var loc = '<%=Request.QueryString("p_loc")%>';
    var data;
	data = "DATA|Y|CASH|N|SEND FO|R|DEBIT|C|CREDIT CARD||ALL";
	lstPayMethod.SetDataText(data);
	lstPayMethod.value = '';
	
	data = "DATA|10|DOING|20|NOT COMPLETE";
	lstStatus.SetDataText(data);
	lstStatus.value = '10';
	
	data = "<%=CtlLib.SetListDataSQL("SELECT A.* FROM (SELECT CODE, NAME FROM tco_commcode WHERE PARENT_CODE = 'POINT' and del_if = 0 and code in ('POINT-01','POINT-02','POINT-03','POINT-04') UNION SELECT '','ALL' FROM DUAL) A ORDER BY A.CODE")%>";
	lstLocation.SetDataText(data);
	lstLocation.value = loc;
	if(loc != ''){
	    lstLocation.SetEnable(false);
	    btnReport2.style.display = "none";
    }
}
function OnSearch(){
    dso_htrt00090.Call("SELECT");
}
function OnReport(code)
{
    //var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/rt/htrt00090.rpt&procedure=crm.sp_sel_htrt00090&parameter="+dtfr.GetData()+","+dtTo.GetData()+","+txtInvoiceNo.text;   
     //System.OpenTargetPage(url); 	 
	var url = "";
	switch(code){
		case "Revenue":
			var p_loc = (lstLocation.GetData().length > 0)?lstLocation.GetData():"0";
			var p_pay = (lstPayMethod.GetData().length > 0)?lstPayMethod.GetData():"0";
			url = '/reports/ht/rt/htrt00090_Revenue.aspx?p_fr=' + dtfr.GetData() + '&p_to=' + dtTo.GetData() + '&p_loc=' + p_loc + '&p_pay=' + p_pay;
		break;
		case "Session":
			url = '/reports/ht/rt/htrt00090_Session.aspx?p_fr=' + dtfr.GetData() + '&p_to=' + dtTo.GetData();
		break;
		case "Invoice":
			url = '/reports/ht/rt/htrt00090_Invoice.aspx?p_fr=' + dtfr.GetData() + '&p_to=' + dtTo.GetData() + '&p_loc=' + lstLocation.GetData();
		break;
		case "ItemType":
			url = '/reports/ht/rt/htrt00090_Item_Type.aspx?p_fr=' + dtfr.GetData() + '&p_to=' + dtTo.GetData() + '&p_loc=' + lstLocation.GetData();
		break;
		case "Test":
			url = '/reports/ht/fo/htfo00070_Laundry.aspx?p_fr=' + dtfr.GetData();
		break;
	}
	System.OpenTargetPage( System.RootURL + url , "newform" );
}
function OnPopUp(){
    var path = System.RootURL + '/form/ht/fo/htfo00041.aspx?pk=' + grdData.GetGridData(grdData.row, 23) + '&sn=' + grdData.GetGridData(grdData.row, 0)+ '&date=' + grdData.GetGridData(grdData.row, 1).substring(0,2) + '/' + grdData.GetGridData(grdData.row, 1).substring(3,5)+ '/' + grdData.GetGridData(grdData.row, 1).substring(6,10)+ '&room=' + url_encode(grdData.GetGridData(grdData.row, 22));
    var obj = System.OpenModal( path ,650 , 500,  'resizable:yes;status:yes');
}
function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'dso_htrt00090':			
			if (grdData.rows > 1)
			{
				lblRecord.text = grdData.rows - 1 + " record(s)";
				grdData.Subtotal( 1, 2, -1, '2!3!4!5!6!7!8!9!10!13!14!15!16!17!18!19!20!21');
			}
		break;
	}
}
function url_encode(s) {
		string = s.replace(/\r\n/g,"\n");
		var utftext = "";
 
		for (var n = 0; n < string.length; n++) {
 
			var c = string.charCodeAt(n);
 
			if (c < 128) {
				utftext += String.fromCharCode(c);
			}
			else if((c > 127) && (c < 2048)) {
				utftext += String.fromCharCode((c >> 6) | 192);
				utftext += String.fromCharCode((c & 63) | 128);
			}
			else {
				utftext += String.fromCharCode((c >> 12) | 224);
				utftext += String.fromCharCode(((c >> 6) & 63) | 128);
				utftext += String.fromCharCode((c & 63) | 128);
			}
 
		}
 
		return escape(utftext);
}
</script>

</head>
<body>
 <gw:data id="dso_htrt00090" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="grid" parameter="" function="ht_sel_60270120" procedure="" >  
                <input bind="grdData" >  
                    <input bind="dtfr" /> 
                    <input bind="dtTo" /> 
                    <input bind="txtInvoiceNo" />
                    <input bind="lstLocation" />
					<input bind="lstPayMethod" />
					<input bind="lstStatus" />
                </input> 
                <output bind="grdData" /> 
            </dso> 
        </xml> 
    </gw:data> 	
    <table width="100%" style="height:100%">
        <tr style="height: 5%">
            <td width="5%" align="center">
                <b>Date</b></td>
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
            <td align="right" width="5%" style="white-space:nowrap"><b>Payment Method</b></td>
			<td align="left" width="10%"><gw:list id="lstPayMethod" onchange="OnSearch()" /></td>
			<td style="width:1px">
				Status
            </td>
			<td align="left" width="10%"><gw:list id="lstStatus" onchange="OnSearch()" /></td>
			<td width="10%" align="right">
                <gw:label id="lblRecord" styles="color: blue; width: 100%"></gw:label>
            </td>
            <td with="1px" align="right">
                <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
            </td>
			<td style="width:1px">
				
            </td>
			<td style="width:1px">
				
            </td>
            <td style="width:1px">
				
            </td>
        </tr>
        <tr style="height: 95%">
            <td colspan="17">
                 <gw:grid 
                    id="grdData"
                    header="Invoice No|Invoice Date|Guest|Food(+)|Beverage(+)|Others(+)|SVC(+)|VAT(+)|Disct(-)|Total(=)|_Adjust(+/-)|Create Time|Create By|_Cash|_Credit Card|_FO Hotel|_FO Club|_Debit|_Office Check|_Entertainment|_Tranfer|_Total Bill|Guest Name|_Pk" 
                    format  ="0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|0|0"
                    aligns  ="0|1|1|0|0|0|0|0|0|0|0|1|1|0|0|0|0|0|0|0|0|0|0|0|0" 
                    defaults="||||||||||||||||||||||" 
                    editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                    sorting ='T'
                    autosize='T'
	                styles  ="width:100%; height:100%"
			        oncelldblclick="OnPopUp();"
                    />
            </td>
        </tr>
    </table>
</body>
</html>
