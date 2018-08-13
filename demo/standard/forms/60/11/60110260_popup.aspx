<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>
    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<script type="text/javascript" language="javascript">
    var p_cust_pk,
        p_cust_id,
        p_cust_name,
        p_from_date,
        P_to_date;

    var col = 0;
        g_PK                 =col++,   
        g_Select             =col++,
        g_Date               =col++,
        g_Voucher_No         =col++,
        g_Item_PK            =col++,
        g_Item_Code          =col++,
        g_Item_Name          =col++,
        g_Unit               =col++,
        g_Quantity           =col++,
        g_Unit_Price         =col++,
        g_tac_abacctcode_pk  =col++,
        g_Acc_Code           =col++,
        g_Acc_Name           =col++,
        g_tin_wh_pk          =col++,
        g_Warehouse          =col++,
        g_tac_abplcenter_pk  =col++,
        g_PL_Code            =col++,
        g_PL_Name            =col++;

    
    function BodyInit() {
        p_from_date = "<%=Request("p_from_date") %>";
        P_to_date = "<%=Request("p_to_date") %>";
        p_cust_pk = "<%=Request("p_cust_pk") %>";
        p_cust_id = "<%=Request("p_cust_id") %>";
        p_cust_name = "<%=Request("p_cust_name") %>";

        dtDateFrom.value = p_from_date;
        dtDateTo.value = P_to_date;
        txtcustomer_cd.text = p_cust_id;
        txtcustomer_nm.text = p_cust_name;
        txtcustomer_pk.text = p_cust_pk;

        var l_data = "<%=CtlLib.SetListDataSQL("select w.pk, w.wh_id || ' - ' || w.wh_name wh_name from tlg_in_warehouse w WHERE w.del_if = 0")%>||ALL"
        lstWH.SetDataText(l_data);
        lstWH.value = "";
    }

    function onSearch() {
        dso_grd_crca_other.Call("SELECT");
    }

    function onResetCustomer() {
        txtcustomer_cd.text = '';
        txtcustomer_nm.text = '';
        txtcustomer_pk.text = '';
    }

    function OnDataReceive(iObj) {
    }

    function onSelect(){

        var l_aValue = new Array;
        for (var i = 1; i < grdDtl.rows; i++)
        {
            if (grdDtl.GetGridData(i, g_Select) == "-1") {
                var l_arr = new Array;

                for (var j = 0; j < grdDtl.cols; j++) {
                    l_arr[l_arr.length] = grdDtl.GetGridData(i, j);
                }
                l_aValue[l_aValue.length] = l_arr;
            }
        }

        window.returnValue = l_aValue;
        window.close();
    }

    function onSearchCustomer() {
        var path = System.RootURL + '/standard/forms/gf/co/ffbp00031.aspx';
        var object = System.OpenModal(path, 800, 550, 'resizable:yes;status:yes;toolbar:no;location:no;directories:no;status:no;menubar:no;scrollbars:no;resizable:no;');
        if (object != null) {
            if (object[0] != 0) {
                txtcustomer_cd.text = object[1];
                txtcustomer_nm.text = object[2];
                txtcustomer_pk.text = object[0];
            }
        }
    }

    function CheckAllChange() {

        var check = (chkAll.value == "N" ? "0" : "-1");

        for (var i = 1; i < grdDtl.rows; i++) {
            if (grdDtl.GetGridControl().isSelected(i)) {
                grdDtl.SetGridText(i, 1, check);
            }
        }
    }
</script>
<body style="margin:0; padding:0;">
<!---------------------------------------------------------------------------------------------------------->
<gw:data id="dso_grd_crca_other" onreceive="OnDataReceive(this)" >
    <xml>
        <dso type="grid" function="sp_sel_crca_other" >
            <input bind="grdDtl">
                <input bind="txtcompk" />                   
                <input bind="txtVoucherNo" />
			    <input bind="dtDateFrom" />
                <input bind="dtDateTo" />
                <input bind="txtcustomer_pk" />
                <input bind="txtcustomer_cd" />
                <input bind="txtcustomer_nm" />
		        <input bind="txtItem" />
		        <input bind="lstWH" />				
            </input>
            <output bind="grdDtl" />
        </dso>
    </xml>
</gw:data>

<!---------------------------------------------------------------------------------------------------------->
<table style="width:100%; height:100%; " border="0" cellpadding="0" cellspacing="0" >
	<tr style="height:0%">
        <td width="10%"></td>
        <td width="12%"></td>
        <td width="8%"></td>

        <td width="10%"></td>
        <td width="3%"></td>
        <td width="10%"></td>
        <td width="5%"></td>

        <td width="32%"></td>
        <td width="7%"></td>
        <td width="3%"></td>
	</tr>
    <tr style="height:5%">
        <td align="right">Voucher No</td>
        <td><gw:textbox id="txtVoucherNo" onenterkey="onSearch()"></gw:textbox></td>
        <td align="right">Date</td>
        <td><gw:datebox id="dtDateFrom"></gw:datebox></td>
        <td></td>
        <td><gw:datebox id="dtDateTo"></gw:datebox></td>
        <td align="right"><a title="Click here to select vendor" href="#tips" onclick="onSearchCustomer()" >Customer</a></td>
        <td><table width="100%"  border="0" cellspacing="0" cellpadding="0" style="height:100%">
            <tr>
                <td width="30%"><gw:textbox id="txtcustomer_cd" styles='width:100%' /></td> 
                <td width="60%"><gw:textbox id="txtcustomer_nm" styles='width:100%'/></td>
                <td width="0%"><gw:textbox  id="txtcustomer_pk" styles='display:none'/></td>
                <td width="5%"></td> 
                <td width="5%"><gw:imgBtn   img="reset"	id="idResetVen"  alt="Reset" onclick="onResetCustomer()"/></td>
            </tr>
            </table>
        </td>
        <td></td>
        <td><gw:imgBtn id="ibtnSearch" img="search" alt="Search" onclick="onSearch()"/></td>
    </tr>
    <tr style="height:5%">
        <td align="right"><gw:checkbox id="chkAll" defaultvalue="Y|N" value="N" onchange="CheckAllChange()">Check All</gw:checkbox></td>   
        <td></td>
        <td align="right">Item</td>
        <td colspan="3"><gw:textbox id="txtItem" onenterkey="onSearch()"></gw:textbox></td>
        <td align="right">Warehouse</td>
        <td><gw:list id="lstWH" value="ALL" styles="width:100%;" onchange="onSearch()" /></td>
        <td colspan="2" align="right"><gw:imgBtn id="ibtnSelect" alt="Select" img="select" onclick="onSelect()"></gw:imgBtn></td>
    </tr>
    <tr>
        <tr style="height:90%;">
        <td colspan="10" >
            <gw:grid
                id      ="grdDtl"  
                header  ="_PK|Select|Date|Voucher No|_Item_PK|Item Code|Item Name|Unit|Quantity|Unit Price|_tac_abacctcode_pk|Acc Code|Acc Name|_tin_wh_pk|Warehouse|_tac_abplcenter_pk|PL Code|PL Name|_tac_abacctcode_wh|_tco_buspartner_pk|partner_id|partner_name"
                format  ="0|3|4|0|0|0|0|0|-2|-2|0|0|0|0|0|0|0|0|0|0|0"
                aligns  ="1|0|1|1|0|1|0|3|3|3|3|3|0|0|0|0|0|0|0|0|0"
                defaults="0|||||||||||||||||||0|0"
                editcol ="1|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0"
                widths  ="0|800|1200|1300|2500|1500|3000|1000|1300|1300|1300|1300|1500|2000|2000|1000|1000|2000|0|0|0"
                styles  ="width:90%; height:100%"                
                sorting ="T"                								
            />
        </td>
    </tr>
    </tr>
</table>
<!------------------------------------------------------------------------>
<gw:textbox id="txtcompk"           style="display:none" />    
</body>
</html>