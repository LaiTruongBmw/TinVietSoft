<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 <html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Check AP Invoice</title>
</head>

<script>
function BodyInit()
{
 txtOperating.SetEnable(false);
 txtOrgId.SetEnable(false);
 txtInvID.SetEnable(false);
 txtInvNum.SetEnable(false);
 txtInvAmt.SetEnable(false);
 txtDetail.SetEnable(false);
 btnDel.SetEnable(false);
}
function OnSearch()
{datSearchAPInvoice.Call("SELECT");
}
function OnDataReceive(obj)
{
	if(obj.id == "datSearchAPInvoiceInfo")
	    datSearchAPInvoiceDetail.Call("SELECT");
	    
	if(obj.id == "dataDel")
	    datSearchAPInvoice.Call("SELECT");
	    
	if(obj.id == "datSearchAPInvoice")
	{
        txtOperating.text="";
        txtOrgId.text="";
        txtInvID.text="";
        txtInvNum.text="";
        txtInvAmt.text="";
        txtDetail.text="";
        txtPK.text="";
        datSearchAPInvoiceDetail.Call("SELECT");
	}
	
	if(obj.id == "dsoExportInvoices")
	    dsoExportInvoicesd.Call();
		
	if(obj.id == "dsoExportInvoicesd")
	    status = 'Export data successful.';
}
function OnDelete()
{
    if(confirm("Do you want to delete master invoices?\nBạn có chắc muốn xóa hóa đơn không?")==true)
    {dataDel.Call();
    }
}
function OnDataError(obj)
{
	AlertDBError(obj.errmsg)
	return;
}
function OnSelect()
{   
    txtPK.text=((grdInvMaster.GetGridData(grdInvMaster.row,0)+""));
    txtAP_type.text=((grdInvMaster.GetGridData(grdInvMaster.row,6)+""));
     var status=(grdInvMaster.GetGridData(grdInvMaster.row,3)+"");
    if(status=="Upload")
    btnDel.SetEnable(false);
    else
    btnDel.SetEnable(true);
    datSearchAPInvoiceInfo.Call();
       
}

function OnReport()
{
	if(txtPK.text == "")
	{
		return;
	}
    var url=System.RootURL;
	url=url + '/standard/reports/gf/pm/rptAP_Invoice.aspx?inv_pk=' + txtPK.text;
	window.open(url); 
}

function AlertDBError(errmsg)
{
	var aTmp = new Array();
	aTmp = errmsg.split("ORA-");
	if(aTmp.length >= 2)
	{
		alert(aTmp[1]);
	}
	else 
	{
		alert(errmsg);
	}
}

function OnExport()
{
    status = 'Exporting data...';
    dsoExportInvoices.Call();
}

</script>

<body bgcolor='#F5F8FF'>
<!---------------------------------------------------------------->   
 
 <!---------------------------------------------------------------->   
<gw:data id="datSearchAPInvoice" onreceive="OnDataReceive(this)"  onerror="OnDataError(this)" > 
        <xml>
            <dso type="grid"  function="ac_sel_60140130" procedure="">
                <input bind="grdInvMaster">
                    <input bind="dtMonthFrom"/>
                    <input bind="dtMonthTo"/>
                    <input bind="lstAPkind" />
                 </input>
                <output bind="grdInvMaster"/>
            </dso>
        </xml>
</gw:data>
<gw:data id="dataDel" onreceive="OnDataReceive(this)"  onerror="OnDataError(this)" > 
        <xml>
            <dso type="process"   procedure="ac_sel_60140130_1">
                <input >
                <input bind="txtPK"/>
               </input>
               <output>
                <output bind="txtPK"/>
                </output>
            </dso>
        </xml>
</gw:data>

<gw:data id="datSearchAPInvoiceDetail" onreceive="OnDataReceive(this)"  onerror="OnDataError(this)" > 
        <xml>
            <dso type="grid" function="ac_sel_60140130_2">
                <input bind="grdInvDetail">
                    <input bind="txtPK"/>
                    <input bind="txtAP_type"/>
                 </input>                
                <output bind="grdInvDetail"/>
                
            </dso>
        </xml>
</gw:data>

<gw:data id="datSearchAPInvoiceInfo" onreceive="OnDataReceive(this)">
    <xml>
        <dso type ="process" procedure="ac_sel_60140130_3">
            <input >
                <input bind="txtPK"/>
                <input bind="txtAP_type"/>
            </input >
            <output>
                <output bind="txtOperating"/>
                <output bind="txtOrgId"/>
                <output bind="txtInvID"/>
                <output bind="txtInvNum"/>
                <output bind="txtInvAmt"/>
                <output bind="txtDetail"/>
                           
            </output>
            
        </dso>
    </xml>
</gw:data>

<gw:data id="dsoExportInvoices" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="process" procedure="ac_sel_60140130_4" onerror="OnDataError(this)" > 
                <input>
                    <input bind="txt1" />
                    <input bind="txtAP_type"/>
                </input>
                <output>
                    <input bind="txt2" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="dsoExportInvoicesd" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="process" procedure="ac_sel_60140130_5" onerror="OnDataError(this)" > 
                 <input>
                    <input bind="txt1" />
                    <input bind="txtAP_type"/>
                </input>
                <output>
                    <input bind="txt2" />
                </output>
            </dso> 
        </xml> 
</gw:data>
 
<gw:textbox id="txtPK" text="" styles="display:none"/>
<gw:textbox id="txt1" text="" styles="display:none"/>
<gw:textbox id="txt2" text="" styles="display:none"/>
<gw:textbox id="txtAP_type" text="" styles="display:none"/>


<table  border="0" width="100%" height="100%" cellpadding="0" cellspacing="0" >
<tr style="height:99% " align="left" >
    <td width="40%" height="100%"style="border:2">
        <table style="height:100%" width="100%">
            <tr>
                <td colspan="1" align=right>AP Type</td>
						<td colspan="1" align = "right"><gw:list id="lstAPkind" value="ALL" styles="width:100%;" onchange="">
						    <data>|01|Salary|02|Health Ins|03|Social Ins|04|Unemp Ins|05|Meal|ALL|Select All</data>
						</gw:list></td>
            <td colspan="3" align="right" >
                    <gw:button id="btnDel" img="delete" text="DELETE" styles="width:100" onclick="OnDelete()" /></td>
            </tr>
            <tr >
                <td  style="border:0"  >Salary Month  From:</td>
                <td  style="border:0" ><gw:datebox id="dtMonthFrom"  maxlen = "10" text="" styles='width:100%'type="month"   lang="<%=Session("Lang")%>"/></td>
                <td style="border:0" >To:</td>
                <td style="border:0" ><gw:datebox id="dtMonthTo"  maxlen = "10" text="" styles='width:100%' type="month"  lang="<%=Session("Lang")%>" /></td>
                <td style="border:0"><gw:imgBtn img="search" id="ibtnSearch"    alt="Search"  onclick="OnSearch()"/></td>
            </tr>
            <tr style="height:100%">
                 <td colspan="5">
				      <gw:grid     id="grdInvMaster"  
                                            header="_PK|Salary Month|Invoice No|Status|Pay Date|Remark|_ap_type"   
                                            format="0|0|0|0|0|0|0"  
                                            aligns="0|0|1|0|0|0|0"  
                                            defaults="|||||||"  
                                            editcol="0|0|0|0|0|0|0"  
                                            widths="1000|1300|2400|700|1300|1000|0"  
                                            styles="width:100%; height:100%"   
                                            sorting="T"   
                                            onclick="OnSelect()"
                                       /> 
					      </td>
            </tr>
        </table>
       
       
    </td>
 <td width="60%" height="100%" >
            <table style="height:100%" width="100%">
					<tr style="height:0%">
						<td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td>
						<td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td>
						<td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td>
						<td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td>
						<td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td>
						<td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td>
						<td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td>
						<td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td>
						<td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td>
						<td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td><td width="1%" style="border:0" ></td>
					</tr>
                  <tr   >
					<td colspan="80" style="border:0" align="right"></td>
					<td colspan="3" style="border:0" align="right">
                        <gw:button img="excel" id="ibtnSumPrinter" text="Print"    alt="Report"  onclick="OnReport()"/>
                    </td>
					<td colspan="3" style="border:0" align="right"></td>

                  <td colspan="14" align="right" ><gw:icon id="btnSplip" img="in" text="SLIP(ERP)" styles="width:100" onclick="OnExport()" /></td></tr>
                  </tr>
                  <tr   >
                        <td colspan="20">Operating Units.</td>
                        <td colspan="30"> <gw:textbox id="txtOperating" text="" maxlen = "50" styles='width:100%;' /></td>
                        <td colspan="20">Org. ID</td>
                        <td colspan="30"> <gw:textbox id="txtOrgId" text="" maxlen = "50" styles='width:100%;' /></td>
                   </tr>
                   <tr >
                        <td colspan="20">Invoice ID</td>
                        <td colspan="30"> <gw:textbox id="txtInvID" text="" maxlen = "50" styles='width:100%;' /></td>
                        <td colspan="20">Invoivce Num</td>
                        <td colspan="30"> <gw:textbox id="txtInvNum" text="" maxlen = "50" styles='width:100%;' /></td>
                   </tr>
                   <tr    >
                        <td colspan="20">Invoice Amt</td>
                        <td colspan="30"> <gw:textbox id="txtInvAmt" text="" maxlen = "50" styles='width:100%;' /></td>
                        <td colspan="20">Detail Amt</td>
                        <td colspan="30"> <gw:textbox id="txtDetail" text="" maxlen = "50" styles='width:100%;' /></td>
                   </tr>
                   <tr height="100%" >
                         <td colspan="100" style="width:100%"> 
                         <gw:grid     id="grdInvDetail"  
                                            header="_Employee|Cost Center|Account Code|Amt|Description"   
                                            format="0|0|0|1|0"  
                                            aligns="1|0|1|0|0"  
                                            defaults="|||||"  
                                            editcol="0|0|0|0|0"  
                                            widths="1000|2500|1500|1500|1000"  
                                            styles="width:100%; height:100%"   
                                            sorting="T"   
                                       /> 
					      </td>
                   
                   </tr>
                   
            </table>
            
        </td>
</tr>
</table>

</body>



