<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Document</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
  OnSearch();
}
function OnSearch()
{
    dat_LaundryReport.Call("SELECT");
}
function OnReport(obj)
{		if(obj=='1')
		{
			if(grdLaundryReport.rows > 1)
			{
				 var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=ht/fo/htfo00090_laundry.rpt&procedure=sp_rpt_htfo00090&parameter="+dtFromDate.value+","+dtToDate.value+","+txtInvoiceNo.text+","+txtRoomNo.text;      
				 System.OpenTargetPage(url); 
			}
		}

		if(obj=='2')
		{
			 if(grdLaundryReport.rows > 1)
			 {
				var url = '/standard/reports/60/28/rpt_60280020_rvn_laundry_detail.aspx?p_dtfrom='+dtFromDate.GetData()+"&p_dtto="+dtToDate.GetData(); 
				System.OpenTargetPage( System.RootURL+url , "newform" );
			 }
		}
}
 function OnDataReceive(obj)
 {
	if(obj.id=='dat_LaundryReport')
	{
		if (grdLaundryReport.rows > 1)	
		{
			grdLaundryReport.Subtotal( 1, 2, -1, '5!6!7!8!9');
		}
	}
	
}
</script>

<body>
    <!----------------------------------------------------------------------------------------------->
    <gw:data id="dat_LaundryReport" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="grid" function="st_ht_sel_60280020"> 
            <input bind="grdLaundryReport">                    
                <input bind="dtFromDate" /> 
                <input bind="dtToDate" /> 
                <input bind="txtInvoiceNo" /> 
                <input bind="txtRoomNo" /> 
                <input bind="cbDelete" />
            </input> 
            <output bind="grdLaundryReport" />
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
                                                    <td width="13%" align="right">
                                                        Invoice No</td>
                                                    <td width="15%">
                                                        <gw:textbox id="txtInvoiceNo" styles="width:100%" onenterkey="OnSearch()" />
                                                    </td>
                                                    <td width="12%" align="right">
                                                        Room No</td>
                                                    <td width="10%">
                                                        <gw:textbox id="txtRoomNo" styles="width:100%" onenterkey="OnSearch()" />
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
                            <gw:grid id="grdLaundryReport" header="Date|Invoice#|Room|Last Name|First Name|Amount|Discount|SVC Amt|VAT Amt|Total due|Payed|Create By|Create Date|Delete By|Delete Date"
                                format="4|0|0|0|0|-0|-0|-0|-0|-0|0|0|4|0|4"
                                styles="width:100%; height:100%" sorting="T" autosize="T" acceptNullDate="false" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txt_pk" style="display: none" />
</body>
</html>
