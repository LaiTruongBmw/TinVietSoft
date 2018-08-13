<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Untitled Document</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
	var data = "<%=CtlLib.SetListDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='OTHERFEE' AND USE_YN='Y' order by ord" )%>|ALL|Select all"; 
	lstFeeType.SetDataText(data);
	lstFeeType.value = 'ALL';
   
   data = "<%=CtlLib.SetGridColumnDataSQL("SELECT CODE, NAME FROM  TCO_COMMCODE WHERE DEL_IF=0 AND PARENT_CODE='OTHERFEE' AND USE_YN='Y' ORDER BY ORD" )%>"; 
   grdOtherFee.SetComboFormat(12, data);
   
   OnSearch();
}
function OnSearch()
{
    dat_OtherFee.Call("SELECT");
}
function OnReport()
 {
	 if(grdOtherFee.rows > 1)
	 {
		 var url = '/standard/reports/60/28/rpt_60280070_other_fee.aspx?p_dtfrom='+dtFromDate.value+ "&p_dtto="+dtToDate.value+ "&p_room_last_first_name="+txtRoomLastFirstName.text+ "&p_fee_type="+lstFeeType.value;
		System.OpenTargetPage( System.RootURL+url , "newform" );
	 }
 }
 function OnDataReceive(obj)
 {
	if(obj.id=='dat_OtherFee')
	{
		
		if(grdOtherFee.rows > 1)
		{
			grdOtherFee.Subtotal( 1, 2, -1, '6!11');
			//lblRecord.text=grdAdjust.rows-2 +" Room(s)."
		}
	}
 }
function OnSave()
{
	if(grdOtherFee.row !='-1')
	{
		//alert(grdOtherFee.GetGridData(grdOtherFee.row,13));
		dat_OtherFee.Call();
	}
}
</script>

<body>
    <!----------------------------------------------------------------------------------------------->
    <gw:data id="dat_OtherFee" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="grid" parameter="0,13" function="st_ht_sel_60280070" procedure="st_ht_upd_60280070"> 
            <input bind="grdOtherFee">                    
                <input bind="dtFromDate" />  
                <input bind="dtToDate" /> 
                <input bind="txtRoomLastFirstName" /> 
				<input bind="lstFeeType" /> 
				<input bind="cbDelete" /> 
				
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
													<td width="10%" align="right">
														Fee Type
                                                     </td>
													<td style="width: 21%; white-space: nowrap">
														<gw:list id="lstFeeType" styles='width:100%' onchange='OnSearch()' />
													</td>
                                                    <td width="20%" align="right">
                                                        Room#/Last Name/First Name:</td>
                                                    <td width="15%">
                                                        <gw:textbox id="txtRoomLastFirstName" styles="width:100%" onenterkey="OnSearch()" />
                                                    </td>
                                                    <td width="10%" align="right">
                                                        <gw:checkbox id="cbDelete" defaultvalue="-1|0" onchange="OnSearch()"  />Delete YN
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
							header='Invoice#|Room#|Last Name|First Name|Checkin Date|Checkout Date|Fee Amt(VND)|_SVC|_VAT|Rate|_Total Amt|Fee Amt(USD)|Fee Type|_PayedYN|Description|Create by|Create date'
							format='0|0|0|0|0|0|-0|-0|-0|-0|-0|-2|0|3|0|0|0'
							aligns='0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
							check='||||||||||||||||'
							editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0'
							widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
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
