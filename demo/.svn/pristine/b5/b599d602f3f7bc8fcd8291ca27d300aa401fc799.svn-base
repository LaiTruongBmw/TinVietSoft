<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Order Expense</title>
    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var flag    = false;

function BodyInit()
{
    System.Translate(document);
    <%=CtlLib.SetGridColumnComboFormat("grdDtl", 3,"SELECT A.CODE, A.CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0  AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACCR0110' AND A.USE_IF = 1 ORDER BY A.CODE")%>;
    var ls_bookcyy  = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACBG0040','04','') FROM DUAL")%>";
    lstBook_ccy.SetDataText(ls_bookcyy);
    SetNumGrid();
    txtpk.text      = "<%=Request.querystring("tac_crda_pk")%>";
    txtrate.text    = "<%=Request.querystring("rate")%>";
    txtstatus.text  = "<%=Request.querystring("status")%>";
    txtBookRate.text= "<%=Request.querystring("txt_book")%>";
    txtCcy.text     = "<%=Request.querystring("ccy")%>";
    
    grdDtl.SetGridText( grdDtl.rows - 1, 0, txtpk.GetData());
    flag    = false;
    if (txtstatus.GetData() == 1)
    {
        ibtnSave.SetEnable(true);
    }
    else
    {
        ibtnSave.SetEnable(false);
    }
    dso_upd_grd_dtl_allocate.Call('SELECT');
}

function SetNumGrid()
{
    var fg = grdDtl.GetGridControl();
    fg.ColFormat(1) = "#,###,###,###,###,###,###,###,###.##R";
    fg.ColFormat(4) = "#,###,###,###,###,###,###,###,###.##R";
    if (lstBook_ccy.GetData() == 'VND')
    {
        fg.ColFormat(2) = "#,###,###,###,###,###,###,###,###R";
        fg.ColFormat(5) = "#,###,###,###,###,###,###,###,###R";
    }
    else
    {
        fg.ColFormat(2) = "#,###,###,###,###,###,###,###,###.##R";
        fg.ColFormat(5) = "#,###,###,###,###,###,###,###,###.##R";
    }
}

function onSave()
{
    flag    = true;
    dso_upd_grd_dtl_allocate.Call();
}

function SelectAfterEdit()
{
    if (event.col == 1)
    {
        var exp_trans  = grdDtl.GetGridData(grdDtl.selrow, 1);
        var vat_rate   = grdDtl.GetGridData(grdDtl.selrow, 3);
        var ls_rate    = txtrate.GetData();
        
        if (txtCcy.GetData() == lstBook_ccy.GetData())
        {
            grdDtl.SetGridText( grdDtl.rows - 1, 2, Math.round(Number(exp_trans*100))/100);
        }
        else
        {
            grdDtl.SetGridText( grdDtl.rows - 1, 2, Math.round(Number(exp_trans*(ls_rate/txtBookRate.GetData())*100))/100);
        }/*
        if (vat_rate != 'NO')
        {
            if (vat_rate != 1)
            {
                grdDtl.SetGridText( grdDtl.rows - 1, 4, Math.round(Number(exp_trans*(vat_rate/100))/100));
                grdDtl.SetGridText( grdDtl.rows - 1, 5, Math.round(Number(exp_trans*ls_rate*(vat_rate/100))/100));
            }
            else
            {
                grdDtl.SetGridText(grdDtl.rows - 1, 4, "");
                grdDtl.SetGridText(grdDtl.rows - 1, 5, "");
            }
        }
        else
        {
            grdDtl.SetGridText(grdDtl.rows - 1, 4, "");
            grdDtl.SetGridText(grdDtl.rows - 1, 5, "");
        }*/
    }/*
    else if (event.col == 3)
    {
        var exp_trans  = grdDtl.GetGridData(grdDtl.selrow, 1);
        var exp_books  = grdDtl.GetGridData(grdDtl.selrow, 2);
        var vat_rate   = grdDtl.GetGridData(grdDtl.selrow, 3);
        var ls_rate    = txtrate.GetData();
        if (vat_rate != 'NO')
        {
            if (vat_rate != 1)
            {
                grdDtl.SetGridText( grdDtl.rows - 1, 4, Math.round(Number(exp_trans*(vat_rate/100))/100));
                grdDtl.SetGridText( grdDtl.rows - 1, 5, Math.round(Number(exp_books*ls_rate*(vat_rate/100))/100));
            }
            else
            {
                grdDtl.SetGridText(grdDtl.rows - 1, 4, "");
                grdDtl.SetGridText(grdDtl.rows - 1, 5, "");
            }
        }
        else
        {
            grdDtl.SetGridText(grdDtl.rows - 1, 4, "");
            grdDtl.SetGridText(grdDtl.rows - 1, 5, "");
        }
    }*/
}

function onRecv()
{
    if (flag)
    {
        window.close();
    }
}

</script>
<body style="margin:0; padding:0;">
<!----------------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_upd_grd_dtl_allocate" onreceive="onRecv()">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5" function="ac_sel_60090040_expense_popup" procedure="ac_upd_60090040_expense_popup">
                <input bind="grdDtl">
                    <input bind="txtpk"/>
                </input>
                <output bind="grdDtl"/>
            </dso>
        </xml>
    </gw:data>
<!----------------------------------------------------------------------------------------------------------------->
<table width="100%" cellpadding="0" cellspacing="0" border="0">
<tr>
	<td>
	    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
	    <tr>
	        <td>
	            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
	            <tr>
	                <td width="95%"></td>
                    <td width="5%"><gw:imgBtn id="ibtnSave"   img="save"      alt="Save"          onclick="onSave()" /></td>
	            </tr>    
	            </table>
	        </td>
	    </tr>
        <tr>
            <td>
                <gw:grid
                    id      ="grdDtl"
                    header  ="_PK|Allocated Trans|Allocated Books|_VAT|_Vat Trans|_Vat Books"
                    format  ="0|0|0|2|0|0"
                    aligns  ="0|3|3|1|3|3"
                    defaults="|||||"
                    editcol ="0|1|1|0|0|0"
                    widths  ="0|3500|2500|1000|1500|0"
                    styles  ="width:100%; height:40"
                    sorting ="F"
                    onafteredit     = "SelectAfterEdit()"
                />
            </td>
        </tr>
        </table>
	</td>
</tr>
</table>

<gw:textbox id="txtpk"           style="display:none"/>
<gw:textbox id="txtrate"         style="display:none"/>
<gw:textbox id="txtstatus"       style="display:none"/>

<gw:list    id="lstBook_ccy" 	 styles="width:75%;display:none"></gw:list >
<gw:textbox id="txtBookRate"     style="display:none" />
<gw:textbox id="txtCcy"          style="display:none" />
<!---------------------------------------------------------------------------------------------------->
</body>
</html>