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
    var ls_date_fr = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
    
    dtInvoiceDatefr.SetDataText(ls_date_fr);
    txtcompk.text       = "<%=Request.querystring("company")%>";
    txtaptrtype.text    = "<%=Request.querystring("aptr_type")%>";
}

function Selects()
{
	var aValue = new Array();
	for(i=1;i<grdDtl.rows;i++)
    {
		if(grdDtl.GetGridData(i,2)== "-1")
		{
			tmp= new Array();
			for(j=0;j<grdDtl.cols;j++)
            {
				tmp[tmp.length] = grdDtl.GetGridData(i,j);
			}
			aValue[aValue.length]=tmp;
		}
    }
	window.returnValue = aValue;
	window.close();
}

function OnCancel()
{
	var code_data=new Array();
	tmp= new Array();
	tmp[0]       = 0
	code_data[0] = tmp;
	
	window.returnValue = code_data; 
	this.close();
}

function onSearch()
{
    dso_upd_grd_dtl_search.Call('SELECT');
}

function SumRow()
{
    if (grdDtl.rows < 2)
    {
        lblsum.text = "0";
    }
    else
    {
        lblsum.text = grdDtl.rows - 1;
    }
}

function DBPopupClickDtl()
{
    if (grdDtl.rows > 1)
    {
        if (grdDtl.GetGridData(grdDtl.selrow, 2)== "-1")
        {
            grdDtl.SetGridText(grdDtl.selrow, 2, 0);
            
        }
        else
        {
            grdDtl.SetGridText(grdDtl.selrow, 2, -1);
            
        }
    }
}

function onSearchVen()
{
    var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx';
	var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes;toolbar:no;location:no;directories:no;status:no;menubar:no;scrollbars:no;resizable:no;');
	if ( object != null )
	{
	    if (object[0] != 0)
        {
            txtven_cd.text = object[1];
            txtven_nm.text = object[2];
            txtven_pk.text = object[0];
        }
    }
}

function onResetVen()
{
    txtven_cd.text = '';
    txtven_nm.text = '';
    txtven_pk.text = '';
}

</script>
<body style="margin:0; padding:0;">
<!----------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_upd_grd_dtl_search" onreceive="SumRow()">
        <xml>
            <dso type="grid" function="acnt.SP_SEL_GRD_AP_FROM_LOG">
                <input bind="grdDtl">
                    <input bind="txtcompk"/>
                    <input bind="txtvoucher_no"/>
                    <input bind="dtInvoiceDatefr"/>
                    <input bind="dtInvoiceDateto"/>
                    <input bind="txtven_pk"/>
                    <input bind="txtaptrtype"/>
                </input>
                <output bind="grdDtl"/>
            </dso>
        </xml>
    </gw:data>
<!----------------------------------------------------------------------------------------------------------------->
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td>
	    <table width="100%"  border="1" cellspacing="0" cellpadding="0">
        <tr>
            <td>
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="8%"></td>
                    <td width="12%"></td>
                    <td width="8%"></td>
                    <td width="10%"></td>
                    <td width="3%"></td>
                    <td width="10%"></td>
                    <td width="5%"></td>
                    <td width="27%"></td>
                    <td width="12%"></td>
                    <td width="3%"></td>
                </tr>
                <tr>
                    <td align="right">Voucher No</td>
                    <td ><gw:textbox id="txtvoucher_no" styles="width:100%" onenterkey="onSearch()"/></td>
                    <td align="right">Trans Date</td>
                    <td><gw:datebox id="dtInvoiceDatefr" lang="1" /></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtInvoiceDateto" styles="width:100%" lang="1" /></td>
                    <td align="right">Vendor</td>
                    <td>
                        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="30%"><gw:textbox id="txtven_cd" styles='width:100%' onenterkey="onEnter()" onkeypress="CheckNumeric()"/></td>
                            <td width="60%"><gw:textbox id="txtven_nm" styles='width:100%'/></td>
                            <td width="0%"><gw:textbox  id="txtven_pk" styles='display:none'/></td>
                            <td width="5%"><gw:imgBtn   img="popup"	id="idSearchVen" alt="Popup" onclick="onSearchVen()"/></td> 
                            <td width="5%"><gw:imgBtn   img="reset"	id="idResetVen"  alt="Reset" onclick="onResetVen()"/></td>
                        </tr>
                        </table>
                    </td>
                    <td>
                        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td align="center" width="40%"><gw:label id="lblsum" text="0" styles="color:red;width:90%;font-weight: bold;font-size:12"/></td>
                            <td align="right" width="60%"><gw:label id="lblLabel" text="record(s)" styles="color:red;width:90%;font-weight: bold;font-size:12"/>&nbsp;</td>
                        </tr>
                        </table>
                    </td>
                    <td><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"        onclick="onSearch()"/></td>
                </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <gw:grid
                    id      ="grdDtl"  
                    header  ="_PK|Voucher No||Item Code|Item Name|UOM|Unit Price|Actural Q'ty|Invoce Q'ty|Diff Q'ty|PO|Desc|_ItemPK"
                    format  ="0|0|3|0|0|0|0|0|0|0|0|0|0"
                    aligns  ="0|1|1|0|0|1|3|3|3|3|1|0|0"
                    defaults="|||||||||||"
                    editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0"
                    widths  ="0|1300|400|1300|2500|600|1000|1300|1300|1000|1300|0|0|0"
                    styles  ="width:100%; height:190"
                    sorting ="F"
                    oncelldblclick  = "DBPopupClickDtl()"
                />
            </td>
        </tr>
        </table>
	</td>
</tr>
<tr height="5">
    <td></td>
</tr>

<tr>
    <td>
	    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width="5%"></td>
            <td width="40%"></td>
            <td width="10%"></td>
            <td width="40%"></td>
            <td width="5%"></td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <fieldset style="padding:5">
                <legend>&nbsp;Purchase Order</legend>
                    <table width=100% cellpadding=0 cellspacing=3 border=0>
                    <tr>
                        <td width=30%></td>
                        <td width=50%></td>
                    </tr>
                    <tr>
                        <td align="right">UOM</td>
                        <td ><gw:textbox id="txtUOM_pur" styles='width:100%'/></td>
                    </tr>
                    <tr>
                        <td align="right">PO Date</td>
                        <td ><gw:textbox id="txtUOM_pur" styles='width:100%'/></td>
                    </tr>
                    <tr>
                        <td align="right">Currency</td>
                        <td ><gw:textbox id="txtPay_pur" styles='width:100%'/></td>
                    </tr>
                    <tr>
                        <td align="right">Ex Rate</td>
                        <td ><gw:textbox id="txtPay_pur" styles='width:100%'/></td>
                    </tr>
                    <tr>
                        <td align="right">Qty Order</td>
                        <td ><gw:textbox id="txtQty_pur" styles='width:100%'/></td>
                    </tr>
                    <tr>
                        <td align="right">Unit Price</td>
                        <td ><gw:textbox id="txtUnit_pur" styles='width:100%'/></td>
                    </tr>
                    <tr>
                        <td align="right">Payment Terms</td>
                        <td ><gw:textbox id="txtPay_pur" styles='width:100%'/></td>
                    </tr>
                    <tr>
                        <td align="right">Form of Payment</td>
                        <td ><gw:textbox id="txtPay_pur" styles='width:100%'/></td>
                    </tr>
                    </table>
                </fieldset>
            </td>
            <td>
            </td>
            <td>
                <fieldset style="padding: 5">
                <legend><font color="blue" ><b>&nbsp;Receipt Quantity&nbsp;</b></font></legend>
                    <table width=100% cellpadding=0 cellspacing=3 border=0>
                        <tr>
                            <td width=30%></td>
                            <td width=50%></td>
                        </tr>
                        <tr>
                            <td align="right">UOM</td>
                            <td ><gw:textbox id="txtUOM_rec" styles='width:100%'/></td>
                        </tr>
                        <tr>
                            <td align="right">Receipt Date</td>
                            <td ><gw:textbox id="txtUOM_rec" styles='width:100%'/></td>
                        </tr>
                        <tr>
                            <td align="right">Warehouse</td>
                            <td ><gw:textbox id="txtwh_rec" styles='width:100%'/></td>
                        </tr>
                        <tr>
                            <td align="right">Received</td>
                            <td ><gw:textbox id="txtUOM_rec" styles='width:100%'/></td>
                        </tr>
                        <tr>
                            <td align="right">Net Received</td>
                            <td ><gw:textbox id="txtwh_rec" styles='width:100%'/></td>
                        </tr>
                        <tr>
                            <td align="right">Vendor Code</td>
                            <td ><gw:textbox id="txtUOM_rec" styles='width:100%'/></td>
                        </tr>
                        <tr>
                            <td align="right">Vendor Name</td>
                            <td ><gw:textbox id="txtwh_rec" styles='width:100%'/></td>
                        </tr>
                    </table>
                </fieldset>
            </td>
            <td>
            </td>
        </tr>
        </table>
    </td>
</tr>
<tr height="5">
    <td></td>
</tr>
<tr>
    <td>
    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td width=40%></td>
            <td width=10%><gw:icon id="btnOK"       img="in" text="OK"      onclick="Selects()"       styles="width:100%"/></td>
            <td width=10%><gw:icon id="btnCancel"   img="in" text="Cancel"  onclick="OnCancel()"   styles="width:100%"/></td>
            <td width=40%></td>
        </tr>
    </table>
    </td>
</tr>
</table>

<gw:textbox id="txtcompk"           style="display:none" />
<gw:textbox id="txtaptrtype"        style="display:none" />

<!---------------------------------------------------------------------------------------------------->
</body>
</html>