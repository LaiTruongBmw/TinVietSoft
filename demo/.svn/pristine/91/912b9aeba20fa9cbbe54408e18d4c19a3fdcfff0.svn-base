<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
    System.Translate(document);
	var l_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
	lstCompany.SetDataText(l_data);
	OnFormatGrid();			
}
//--------------------------------------------
function onSearchVen()
{
    var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx';
	var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes;toolbar:no;location:no;directories:no;status:no;menubar:no;scrollbars:no;resizable:no;');
	if ( object != null )
	{
	    if (object[0] != 0)
        {
            txtVendorCD.text = object[1];
            txtVendorNM.text = object[2];
            txtVendorPK.text = object[0];
        }
    }
}
//--------------------------------------------
function onResetVen()
{
    txtVendorCD.text = '';
    txtVendorNM.text = '';
    txtVendorPK.text = '';
}
//--------------------------------------------
function OnSearch(iCase)
{
	switch(iCase)
	{
	}
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
    fg.ColFormat(5) = "###,###,###,###.##";
    fg.ColFormat(6) = "###,###,###,###.##";
    fg.ColFormat(7) = "###,###,###,###.##";
    fg.ColFormat(8) = "###,###,###,###.##";
    
}

function OnShowDetail()
{
	var path    = System.RootURL + '/standard/forms/60/09/60090100_Clear_Adv_Popup.aspx?tfn_eradv_ven=' + idGrid.GetGridData(idGrid.row, 11);
	var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
}
function OnSearch()
{
    dso_adv_list.Call("SELECT");
}
//----------------------------------------------
</script>
<body style="margin:0; padding:0;">
    <gw:data id="dso_adv_list" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60090100" >
                <input bind="idGrid">
                    <input bind="lstCompany" />
					<input bind="txtVendorPK" />
					<input bind="dtFrom" />
					<input bind="dtTo" />
					<input bind="txtVoucherNo" />
					<input bind="txtSeq" />
					<input bind="lstBal" />
					<input bind="txtTemp" />
                </input>
                <output bind="idGrid" />
            </dso>
        </xml>
    </gw:data>

<!----------------------------------------------------------------------------------------------------------------->	
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%" >
	<tr>
	    <td style="width:10%;"></td>
	    <td style="width:10%;"></td>
	    <td style="width:15%;"></td>
	    <td style="width:10%;"></td>
	    <td style="width:10%;"></td>
	    <td style="width:3%;"></td>
	    <td style="width:10%;"></td>
	    <td style="width:10%;"></td>
	    <td style="width:10%;"></td>	    
	    <td style="width:7%;"></td>
	    <td style="width:5%;"></td>
	</tr>
	<tr style="height:5%">
	    <td align="right">Company&nbsp;</td>
	    <td align="left" colspan="2"><gw:list id="lstCompany" style="width:100%;" /></td>
	    <td align="right">Trans Date&nbsp;</td>
	    <td align="left"><gw:datebox id="dtFrom" lang="1" /></td>
	    <td>~</td>
	    <td align="left"><gw:datebox id="dtTo" lang="1" /></td>
	    <td align="right">Seq&nbsp;</td>
	    <td><gw:textbox id="txtSeq" style="width:100%;" /></td>
	    <td align="right"><gw:imgBtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
	    <td align="center"><gw:imgBtn id="btnPrint" img="printer" alt="Print" onclick="OnPrint()" /></td>
	</tr>
	<tr style="height:5%">
	    <td align="right"><a title="Click here to select vendor" href="#tips" onclick="onSearchVen()" >Vendor</a>&nbsp;</td>	    
	    <td align="left"><gw:textbox id="txtVendorCD" style="width:100%;" /></td>
	    <td align="left"><gw:textbox id="txtVendorNM" style="width:100%;" /></td>
	    <td align="right">Voucher No&nbsp;</td>
	    <td align="left" colspan="3"><gw:textbox id="txtVoucherNo" style="width:100%;" /></td>
	    <td align="right">Balance&nbsp;</td>
	    <td align="left"><gw:list id="lstBal" styles="width:100%;" onchange="OnSearch()" >
	        <data>DATA|0|> 0|1|= 0</data>
	        </gw:list></td>
	    
	</tr>
	<tr style="height:95%;width:100%" >
		<td colspan="14" width="100%">
			<gw:grid
				id="idGrid"				
				header  ="Seq|Voucher No|Trans Date|Adv Trans Amt|Adv Books Amt|Clear Trans Amt|Clear Books Amt|Bal Trans Amt|Bal Books Amt|Vendor Code|Vendor Name|_tfn_eradv_ven_pk|Account code|Account Name"
				format  ="0|0|4|0|0|0|0|0|0|0|0|0|0|0"
				aligns  ="0|0|0|3|3|3|3|3|3|2|2|0|0|0"
				defaults="|||||||||||||"
				editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				widths  ="1000|1500|1600|1600|1600|1600|1600|1600|1600|1400|2000|0|1200|2000"
				styles  ="width:100%; height:100%"		
				acceptNullDate="T"	
				sorting ="T"
				oncelldblclick="OnShowDetail()" />        
		</td>
	</tr>	
</table>	
<gw:textbox id="txtVendorPK" style="display:none;" />
<gw:textbox id="txtTemp" text="" style="display:none;" />
</body>
</html>