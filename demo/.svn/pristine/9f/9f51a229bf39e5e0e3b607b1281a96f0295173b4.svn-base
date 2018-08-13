<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Printed Invoice Log</title>
    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">
var lang = "<%=Session("SESSION_LANG")%>";
var g_company_pk = "<%=Session("COMPANY_PK")%>";
var g_tco_dept_pk = "<%=Session("DEPT_PK")%>";
//------------Grid
var i_Seq       = 0,
    i_VCNo      = 1,
    i_TransDt   = 2,
    i_Inv_No    = 3,
    i_Inv_Dt    = 4,
    i_SerialNo  = 5,
    i_CopyOdr   = 6,
    i_PrintDt   = 7,
    i_IPAddr    = 8,
    i_PrtSeq    = 9,
    i_Prt_YN    = 10,
    i_Prt_able = 11,
    i_Desc      = 12,
    i_LocalDesc      = 13,
    i_CustID    = 14,
    i_CustName  = 15,
    i_PrtBy     = 16,
    i_PK        = 17;    
function BodyInit()
{
    System.Translate(document);    
   //var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE PK = 2 AND DEL_IF=0")%>";
   //lstCompany.SetDataText(ls_data);     
	txtProposedByUserPk.text = "<%=Session("USER_PK")%>";   
	dso_getCompany.Call();	
}
//-------------------------------------------------------------------------------
function OnSearch()
{
    dso_get_log.Call("SELECT");
}
//-------------------------------------------------------------------------------
function OnDataReceive(iObj)
{
    if(iObj.id == "dso_getCompany")
    {
        var i;
        for(i = 1; i < idGrid.rows; i++)
        {
            if(idGrid.GetGridData(i, i_Prt_able) == '-1')
            {
                idGrid.SetCellBgColor(i, 0, i, idGrid.cols-1,Number('0xA9EBD7'));
            }
        }
		 lstCompany.SetDataText();  
    }
}
//--------------------------------------------------------------------------------
function OnSave()
{
    dso_get_log.Call();
}
//--------------------------------------------------------------------------------
</script>
<!------------------------------------------------>
<body style="margin:0; padding:0;">
    <gw:data id="dso_get_log" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="11,17" function="ac_sel_60110050_invoice_log" procedure="ac_upd_60110050_invoice_log">
                <input bind="idGrid">
                    <input bind="lstCompany"/>
                    <input bind="txtPartner_PK"/>
                    <input bind="dtTransFr"/>
                    <input bind="dtTransTo"/>
                    <input bind="lstStatus"/>
                    <input bind="txtInvNo"/>
                    <input bind="txtSeq"/>
                    <input bind="lstTrType"/>
                </input>
                <output bind="idGrid"/>
            </dso>
        </xml>
    </gw:data>
	 <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="AC_pro_60020020_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
	

<!-------------------------------------->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%" >
	<tr>
		<td width="10%"></td>
        <td width="15%"></td>
        <td width="10%"></td>
        <td width="7%"></td>
        <td width="16%"></td>
		<td width="2%"></td>
        <td width="10%"></td>
        <td width="10%"></td>
        <td width="2%"></td>
        <td width="10%"></td>
        <td width="5%"></td>
        <td width="3%"></td>
	</tr>
	<tr style="height:5%">
		<td align="right">Company&nbsp;</td>
		<td align="right"><gw:list id="lstCompany" styles="width:100%" /></td>
		<td align="right"><a title="Click here to show Customer" onclick="GetCustomer()" href="#tips" ><b>Customer&nbsp;</b></a></td>
        <td ><gw:textbox id="txtPartnerCD" styles='width:100%' text='' /></td>
		<td ><gw:textbox id="txtPartnerNM" styles='width:100%' text='' /></td>
		<td ><gw:imgBtn id="ibtnReset" img="reset"  alt="Reset"  onclick="OnReset()" /></td>
		<td align="right">Trans date&nbsp;</td>
		<td align="left"><gw:datebox id="dtTransFr" lang="1" /></td>
		<td>~</td>
		<td align="left"><gw:datebox id="dtTransTo" lang="1" /></td>		
        <td align="right"><gw:imgBtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()"/></td>
        <td align="left"><gw:button id="ibtnSave" img="save"  alt="Save" onclick="OnSave()" /></td>
	</tr>
	<tr style="height:5%">
		<td align="right">Status&nbsp;</td>
		<td align="left"><gw:list id="lstStatus" styles="width:100%" onchange="OnSearch()" >
		<data>DATA|2|Confirmed|0|Approved|4|NApp|ALL|Select All</data>
		</gw:list>
		</td>
		<td align="right">Seq/Vou. No&nbsp;</td>
		<td align="left"><gw:textbox id="txtSeq" text="" styles="width:100%" onenterkey="OnSearch()" /></td>
		<td align="left" colspan="2"><gw:textbox id="txtVoucherNo" text="" styles="width:100%" onenterkey="OnSearch()" /></td>
		<td align="right">Invoice No&nbsp;</td>
		<td align="left"><gw:textbox id="txtInvNo" styles="width:100%" onenterkey="OnSearch()" /></td>
		<td align="right" colspan="2">Origin Source&nbsp;</td>
		<td align="left" colspan="2"><gw:list id="lstTrType" styles="width:100%" onchange="OnSearch()" >
		<data>DATA|DO|Domestic|OS|Foreign|ALL|Select all</data>
		</gw:list>
		</td>	
	</tr>
	<tr style="height:90%">
		<td colspan="12">
			<gw:grid
				id="idGrid"
				header  ="Seq|Voucher No|Trans date|Invoice No|Invoice date|Serial No|Copy Odr|Print Date|IP Addr|Printed Seq|Printed YN|Printable|Description|Local Desc|Customer ID|Customer Name|Printed By|_PK"
				format  ="0|0|4|0|4|0|0|0|0|0|3|3|0|0|0|0|0|0"
				aligns  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				defaults="|||||||||||||||||"
				editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				widths  ="1000|1400|1200|1400|1200|1200|1000|2000|2000|1000|1000|1000|1000|1000|1000|1000|1400|1200"
				styles  ="width:100%; height:100%"							
				sorting ="F" />        
		</td>
	</tr>
</table>	
<gw:textbox id="txtPartner_PK" styles="display:none; " />
<gw:textbox id="txtProposedByUserPk"  styles='display:none' />
</body>
</html>