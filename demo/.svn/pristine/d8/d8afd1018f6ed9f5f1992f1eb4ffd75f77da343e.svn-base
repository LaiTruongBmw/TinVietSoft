<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Spa Revenue</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
	txt_room_allocate_pk.text = '<%=Request.QueryString("p_room_allocate_pk") %>';
  OnSearch();
}
function OnSearch()
{
    dso_Repayment.Call("SELECT");
}

function OnReport()
 {
	 if(grdServices.rows > 1)
	 {
		var url = '/standard/reports/60/25/rpt_60250150_collector_by_cash.aspx?p_dt_from='+dtFromDate.GetData()+"&p_dt_to="+dtToDate.GetData() + "&p_invoice=" + txtInvoiceNo.GetData() +"&p_crt_by="+ txtCashierID.text;
	    System.OpenTargetPage( System.RootURL+url , "newform" );
	 }
 }
 function OnDataReceive(obj)
 {
	if(obj.id=='dso_Repayment')
	{
		if (grdServices.rows > 1)	
		{
			//grdServices.Subtotal( 1, 2, -1, '5!6!7!8!9');
		}
	}
}
</script>

<body>
    <!----------------------------------------------------------------------------------------------->
    <gw:data id="dso_Repayment" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="grid" function="st_ht_sel_60250020_prepay_inquiry"> 
            <input bind="grdServices">                    
                <input bind="txt_room_allocate_pk" />  
              				
            </input> 
            <output bind="grdServices" />
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
                                                        
                                                    </td>
                                                    <td style="width: 20%; white-space: nowrap">
                                                        
                                                    </td>         
                                                    <td width="26%" align="right"></td>
                                                    <td width="10%">
                                                        
                                                    </td> 
													<td width="8%" align="right"  style="display: none"></td>
                                                    <td width="8%">
                                                      
                                                    </td> 
													<td width="5%" align="right"  style="display: none"></td>  
                                                    <td width="12%">
                                                       
                                                    </td>
													<td style="width: 3%">
														<gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" />
													</td>
													<td style="width: 3%">
														
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
                            <gw:grid id="grdServices" 
                                header="_pk|_tht_room_allocate_pk|invoice#|Invoice Date|Room#|Last Name|First Name|Checkin Date|CheckOut Date|Cash(vnd)|Cash(USD)|Credit(VND)|Credit(USD)|Total Due(VND)|Total Due(USD)|Payment Method|Description|Create By|Create Date|_Ex_rate"
                                format="0|0|0|4|0|0|0|4|4|-0|-2|-0|-2|-0|-2|0|0|0|0|0"
								editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                styles="width:100%; height:100%" sorting="T" autosize="T" acceptNullDate="T"  />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <gw:textbox id="txt_pk" style="display: none" />
    <gw:textbox id="txt_room_allocate_pk" style="display: none" />
</body>
</html>
