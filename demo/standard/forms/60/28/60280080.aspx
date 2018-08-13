<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Spa Revenue</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
  var data = "";
  data = "DATA|Y|Payment by cash|N|Send Bill To FO|A|ALL";
  lstPayment.SetDataText(data);
  lstPayment.value = "A";
  OnSearch();
}
function OnSearch()
{
    dat_MinibarReport.Call("SELECT");
}
function OnReport(obj)
 {
	if(obj=='1')
	{
		 if(grdMinibarReport.rows > 1)
		 {
			var url = '/standard/reports/60/28/rpt_60280080.aspx?p_from='+dtFromDate.GetData()+"&p_to="+dtToDate.GetData() + "&p_invoice=" + txtInvoiceNo.GetData() + "&p_roomno="  + txtRoomNo.GetData() + "&p_loc=POINT-05&p_pay=" + lstPayment.GetData(); 
			System.OpenTargetPage( System.RootURL+url , "newform" );
		 }
	}
	if(obj=='2')
	{
		 if(grdMinibarReport.rows > 1)
		 {
			var url = '/standard/reports/60/28/rpt_60280080_rvn_detail.aspx?p_dtfrom='+dtFromDate.GetData()+"&p_dtto="+dtToDate.GetData(); 
			System.OpenTargetPage( System.RootURL+url , "newform" );
		 }
	}

 }
 function OnDataReceive(obj)
 {
	if(obj.id=='dat_MinibarReport')
	{
		if (grdMinibarReport.rows > 1)	
		{
			grdMinibarReport.Subtotal( 1, 2, -1, '5!6!7!8!9');
		}
	}
}
function OnPopUp(){
    var path = System.RootURL + '/standard/forms/ht/fo/htfo00041.aspx?pk=' + grdMinibarReport.GetGridData(grdMinibarReport.row, 15) + '&sn=' + grdMinibarReport.GetGridData(grdMinibarReport.row, 1)+ '&date=' + grdMinibarReport.GetGridData(grdMinibarReport.row, 0).substring(6,8) + '/' + grdMinibarReport.GetGridData(grdMinibarReport.row, 0).substring(4,6)+ '/' + grdMinibarReport.GetGridData(grdMinibarReport.row, 0).substring(0,4)+ '&room=' + url_encode(grdMinibarReport.GetGridData(grdMinibarReport.row, 3));
	//alert(path);
    var obj = System.OpenModal( path ,650 , 500,  'resizable:yes;status:yes');
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

<body>
    <!----------------------------------------------------------------------------------------------->
    <gw:data id="dat_MinibarReport" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="grid" function="st_ht_sel_60280080"> 
            <input bind="grdMinibarReport">                    
                <input bind="dtFromDate" />  
                <input bind="dtToDate" /> 
                <input bind="txtInvoiceNo" /> 
                <input bind="txtRoomNo" /> 
                <input bind="cbDelete" />
				<input bind="lstPayment" />
            </input> 
            <output bind="grdMinibarReport" />
        </dso> 
    </xml> 
</gw:data>
    <!----------------------------------------------------------------------------------------------->
    <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border="0">
        <tr style="width: 100%; height: 5%">
            <td width="100%">
                <table width="100%" cellpadding="0" cellspacing="0" border="0">
                    <tr>
                        <td>
                            <table border="0" width="100%" id="table1">
                                <tr>
                                    <td>
                                        <fieldset style="padding: 2; width: 100%; height: 100%">
                                            <table border="0" width="100%" id="table2">
                                                <tr>
                                                    <td style="width: 5%">
                                                        Date
                                                    </td>
                                                    <td style="width: 25%; white-space: nowrap">
                                                        <gw:datebox id="dtFromDate" lang="1" onchange="OnSearch()" />
                                                        ~
                                                        <gw:datebox id="dtToDate" lang="1" onchange="OnSearch()" />
                                                    </td>
                                                    <td width="10%" align="right">
                                                        Invoice No</td>
                                                    <td width="15%">
                                                        <gw:textbox id="txtInvoiceNo" styles="width:100%" onenterkey="OnSearch()" />
                                                    </td>
                                                    <td width="6%" align="right">
                                                        Room No</td>
                                                    <td width="10%">
                                                        <gw:textbox id="txtRoomNo" styles="width:100%" onenterkey="OnSearch()" />
                                                    </td>
													<td width="6%" align="right">
                                                        Payment</td>
                                                    <td width="10%">
                                                        <gw:list id="lstPayment" styles="color:blue;width:100%" onchange="OnSearch()" />
                                                    </td>
                                                    <td width="10%" align="right">
                                                        <gw:checkbox id="cbDelete" defaultvalue="-1|0" onchange="OnSearch()"  />Delete YN
                                                    </td>
                                                    <td width="3%">
                                                        <gw:imgbtn id="btnSearch" img="search" width="100%" img="in" text="Search" onclick="OnSearch()" />
                                                    </td>
                                                    <td width="3%">
                                                         <gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnReport('1')"
                                                            styles='width:100%' />
                                                    </td>
													<td style="width: 3%" align="right">
														<gw:imgbtn id="ibtnReport3" img="excel" alt="Revenue detail" onclick="OnReport('2')" />
													</td>

                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="width: 100%; height: 95%">
            <td width="100%">
                <table align="top" cellspacing="0" cellpadding="0" border="0" style="width: 100%;
                    height: 100%;">
                    <tr valign="top">
                        <td width="100%">
                            <gw:grid id="grdMinibarReport" 
                                header="Date|Invoice#|Room|Last Name|First Name|Amount|Discount|SVC Amt|VAT Amt|Total Amt|Adjust Amt|Total DUE|Payed|Create By|Create Date|Delete By|Delete Date|_PK"
                                format="4|0|0|0|0|-0|-0|-0|-0|-0|-0|-0|0|0|4|0|4|0"
                                styles="width:100%; height:100%" sorting="T" autosize="T" acceptNullDate="false" 
								oncelldblclick="OnPopUp();"
								/>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txt_pk" style="display: none" />
</body>
</html>
