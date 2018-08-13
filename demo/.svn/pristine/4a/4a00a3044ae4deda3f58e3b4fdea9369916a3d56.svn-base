<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
var g_tfn_eradv_ven_pk = "";
function BodyInit()
{
    System.Translate(document);
	OnFormatGrid();			
	g_tfn_eradv_ven_pk = "<%=Request("tfn_eradv_ven") %>" ;
	txttfn_eradv_ven_pk.SetDataText(g_tfn_eradv_ven_pk);
	dso_adv_list.Call("SELECT");
}
//--------------------------------------------
function OnDataReceive(iObj)
{
	switch(iObj.id)
	{
		case "dso_adv_list":
		break ;
	}
}
//--------------------------------------------
function OnFormatGrid()
{
    var fg = idGrid.GetGridControl();
    fg.ColFormat(3) = "###,###,###,###.##";
    fg.ColFormat(4) = "###,###,###,###.##";
}
//----------------------------------------------
</script>
<body style="margin:0; padding:0;">
    <gw:data id="dso_adv_list" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60090100_clear_adv" >
                <input bind="idGrid">
                    <input bind="lstCompany" />
					<input bind="txtVendorPK" />
					<input bind="dtFrom" />
					<input bind="dtTo" />
					<input bind="txtVoucherNo" />
					<input bind="txtSeq" />
					<input bind="lstBal" />
					<input bind="txttfn_eradv_ven_pk" />
                </input>
                <output bind="idGrid" />
            </dso>
        </xml>
    </gw:data>

<!----------------------------------------------------------------------------------------------------------------->	
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%" >
	<tr style="height:100%;width:100%" >
		<td colspan="1" width="100%">
			<gw:grid
				id="idGrid"				
				header  ="Seq|Voucher No|Trans Date|Trans Amt|Books Amt|Vendor Code|Vendor Name"
				format  ="0|0|4|0|0|0|0"
				aligns  ="0|0|0|3|3|2|2"
				defaults="||||||"
				editcol ="0|0|0|0|0|0|0"
				widths  ="1000|1500|1600|1600|1600|1400|2000"
				styles  ="width:100%; height:100%"		
				acceptNullDate="T"	
				sorting ="T"
				/>
		</td>
	</tr>	
</table>	
<gw:textbox id="txtVendorPK" style="width:100%; display:none;" />
<gw:textbox id="lstCompany" style="width:100%;display:none;" />
<gw:textbox id="dtFrom" style="width:100%;display:none;" />
<gw:textbox id="dtTo" style="width:100%;display:none;" />
<gw:textbox id="txtVoucherNo" style="width:100%;display:none;" />
<gw:textbox id="txtSeq" style="width:100%;display:none;" />
<gw:textbox id="lstBal" style="width:100%;display:none;" />
<gw:textbox id="txttfn_eradv_ven_pk" style="width:100%;display:none;" />

</body>
</html>