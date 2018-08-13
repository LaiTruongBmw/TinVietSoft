<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Document</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
	/*var data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='OTHERFEE' AND USE_YN='Y' order by ord" )%>|ALL|Select all"; 
	lstFeeType.SetDataText(data);
	lstFeeType.value = 'ALL';
   
   data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='OTHERFEE' AND USE_YN='Y' ORDER BY ORD" )%>"; 
   grdOtherFee.SetComboFormat(12, data);*/
   
   OnSearch();
}
function OnSearch()
{
    dso_ServiceUse.Call("SELECT");
}
function OnReport()
 {
	 if(grdOtherFee.rows > 1)
	 {
		 var url = '/standard/reports/ho/28/rpt_60280130_service_use.aspx?p_dtfrom='+dtFromDate.value+ "&p_dtto="+dtToDate.value+ "&p_service_name="+txt_ServicesName.text;
		System.OpenTargetPage( System.RootURL+url , "newform" );
	 }
 }
 function OnDataReceive(obj)
 {
	if(obj.id=='dso_ServiceUse')
	{
		
		if(grdOtherFee.rows > 1)
		{
			txtCount.text=grdOtherFee.rows-1 + " row(s).";
			grdOtherFee.Subtotal( 1, 2, -1, '4!5');
		}
	}
 }
function OnSave()
{
	if(grdOtherFee.row !='-1')
	{
		//alert(grdOtherFee.GetGridData(grdOtherFee.row,13));
		dso_ServiceUse.Call();
	}
}
</script>

<body>
    <!----------------------------------------------------------------------------------------------->
    <gw:data id="dso_ServiceUse" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="grid"  function="ht_sel_60280130" procedure=""> 
            <input bind="grdOtherFee">                    
                <input bind="dtFromDate" />  
                <input bind="dtToDate" /> 
                <input bind="txt_ServicesName" /> 
            </input> 
            <output bind="grdOtherFee" />
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
                                                    <td style="width: 18%; white-space: nowrap">
                                                        <gw:datebox id="dtFromDate" lang="1" onchange="OnSearch()" />
                                                        ~
                                                        <gw:datebox id="dtToDate" lang="1" onchange="OnSearch()" />
                                                    </td>
													<td width="6%" align="right">
														Total:
                                                     </td>
													<td width="15%" align="right">
														<gw:label id="txtCount" />

                                                     </td>
				
                                                    <td width="10%" align="right">
                                                        Services Name:</td>
                                                    <td width="16%">
                                                        <gw:textbox id="txt_ServicesName" styles="width:100%" onenterkey="OnSearch()" />
                                                    </td>
                                                    
                                                    <td width="3%">
                                                        <gw:imgbtn id="btnSearch" img="search" width="100%" img="in" text="Search" onclick="OnSearch()" />
                                                    </td>
													<td style="width: 3%">
														<gw:imgbtn id="btnSave" img="save" alt="Save" style="display: none" onclick="OnSave()" />
													</td>
                                                    <td width="3%">
                                                         <gw:imgbtn id="ibtnReport" img="printer" alt="Print" onclick="OnReport()"
                                                            styles='width:100%;' />
                                                    </td>
													 <td style="width: 21%; white-space: nowrap">
														
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
                            <gw:grid id='grdOtherFee'
							header='Room#|Guest Name|Checkin Date|Check Out|Amount(VND)|_Amount(USD)|Service Name'
							format='0|0|0|0|-0|-2|0'
							aligns='0|0|0|0|0|0|0'
							check='||||||'
							editcol='0|0|0|0|0|0|0'
							widths='0|0|0|0|0|0|0'
							sorting='T'
							autosize='T' 
							styles='width:100%; height:100%'
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
