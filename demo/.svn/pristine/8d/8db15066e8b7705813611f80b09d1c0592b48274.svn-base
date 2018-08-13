<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
// global variables of grdMst
var g_M_Chk			= 0,
	g_M_PK			= 1,
	g_M_VoucherNo	= 2,
	g_M_Trans_Date	= 3,
	g_M_Serial_No	= 4,
	g_M_InvoiceDate	= 5,
	g_M_InvoiceNo	= 6,
	g_M_TransCcy	= 7,
	g_M_DueDate		= 8,
	g_M_VATDueDate		= 9,
	g_M_AccountCode	= 10,
	g_M_AccountName	= 11,
	g_M_tac_acpk	= 12,
	g_M_VendorName	= 13;
// global variables of grdDtl
	var g_Chk					= 0,
		g_tac_crdad_other_pk	= 1,
		g_tco_item_pk			= 2,
		g_VoucherNo				= 3,
		g_ItemCode				= 4,
		g_ItemName				= 5,
		g_Unit					= 6,
		g_Qty					= 7,
		g_UPrice				= 8,
		g_TransAmt				= 9,
		g_BooksAmt				= 10,
		g_tac_abacctcode_pk		= 11,
		g_AccCode				= 12,
		g_AccName				= 13,
		g_Description			= 14,
		g_LocalDesc				= 15,
		g_tin_whpk				= 16,
		g_WH_Name				= 17;
//
	var g_CheckAll = 0;
	var g_vendor_pk = "";		
	var g_vendor_cd = "";		
	var user_id = "";
function BodyInit()
{
    System.Translate(document);
	var l_today = dtInvoiceDateto.value ;
	var l_frdate = l_today.substr(0, 6) + '01';
	dtInvoiceDatefr.value = l_frdate;
	var g_tco_company_pk = "<%=Request("tco_company_pk") %>"	
	txtcompk.text = g_tco_company_pk;	
	g_vendor_pk = "<%=Request("vendor_pk") %>"
	g_vendor_cd = "<%=Request("vendor_cd") %>"
	txtven_cd.text = g_vendor_cd ;
	txtven_pk.text = g_vendor_pk ;
	user_id = "<%=Request("User_ID") %>"
}
//--------------------------------------------
function onSearchVen()
{
    var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx';
	var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes;toolbar:no;location:no;directories:no;status:no;menubar:no;scrollbars:no;resizable:no;');
	if( object != null )
	{
	    if (object[0] != 0)
        {
            txtven_cd.text = object[1];
            txtven_nm.text = object[2];
            txtven_pk.text = object[0];
        }
    }
}
//--------------------------------------------
function onResetVen()
{
    txtven_cd.text = '';
    txtven_nm.text = '';
    txtven_pk.text = '';
}
//--------------------------------------------
function onSearch(iCase)
{	
	switch(iCase)
	{
		case '1':
		    if(ckUser.value == "T")
		    {
		        txtUserID.SetDataText(user_id);
		    }
		    else
		    {
		        txtUserID.SetDataText("");
		    }
			dso_get_apother_mst.Call("SELECT");
			grdDtl.ClearData();
        break ;			
		case '2':
			if(grdMst.row > 0)
			{
				txtTac_crda_other_pk.text = grdMst.GetGridData(grdMst.row, g_M_PK);				
				dso_get_ap.Call('SELECT');				
			}						
		break ;	
	}
}
//--------------------------------------------
function onSelect()
{
	var l_aValue = new Array();
	var i;
	for (i = 1; i < grdDtl.rows ; i++)
	{
		if(grdDtl.GetGridData(i, g_Chk)=="-1")
		{
			var l = new Array();
			for(j = 0; j < grdDtl.cols ; j++)
			{
				l[l.length] = grdDtl.GetGridData(i, j);
			}
			l_aValue[l_aValue.length] = l;
		}
	}
	window.returnValue = l_aValue;
	window.close();
}
//--------------------------------------------
function OnDataReceive(iObj)
{	
	var i, l_trans = 0, l_books = 0 ;
	if(iObj.id == "dso_get_ap")
	{
		OnFormatGrid();
		for(i = 1; i < grdDtl.rows; i++)
		{
			grdDtl.SetGridText(i, g_Chk, '-1');
			l_trans += Number(grdDtl.GetGridData(i, g_TransAmt ));
			l_books += Number(grdDtl.GetGridData(i, g_BooksAmt ));
		}
		txtTotTrans.SetDataText(l_trans) ;
		txtTotBooks.SetDataText(l_books) ;
	}
	else if(iObj.id == 'dso_get_apother_mst')
	{
	    if(grdMst.rows > 1)
	    {
	        txtven_nm.text = grdMst.GetGridData(1, g_M_VendorName);
        }	        
	}
}
//--------------------------------------------
function OnFormatGrid()
{
	var fg = grdDtl.GetGridControl();
	fg.ColFormat(g_Qty) = "###,###.##";
	fg.ColFormat(g_UPrice) = "###,###.##";
	fg.ColFormat(g_TransAmt) = "###,###.##";
	fg.ColFormat(g_BooksAmt) = "###,###.##";	
}
//--------------------------------------------
function OnCheckAll()
{
	var i, str = "", strComma = "", n = 0;
	g_CheckAll = chkAll.value ;
	if(g_CheckAll == 'T')
	{
		for(i = 1; i < grdMst.rows; i++)
		{						
			grdMst.SetGridText(i, 0, '-1');
		}	
	}	
	else
	{
		for(i = 1; i < grdMst.rows; i++)
		{
			grdMst.SetGridText(i, 0, '0' );			
		}				
		grdDtl.ClearData();
	}
}
//--------------------------------------------
function OnShowDetails()
{
	var i, str = "", strComma = "", n = 0;	
	for(i = 1; i < grdMst.rows; i++)
	{
	    if(grdMst.GetGridData(i, 0) == '-1')
	    {
		    str = str + strComma + grdMst.GetGridData(i , 1);
		    strComma = ",";			
		    n += 1;
		 }
	}	    
    txtTac_crda_other_pk.SetDataText(str);	
    dso_get_ap.Call("SELECT");		
}
//--------------------------------------------
function OnSum()
{
	var i, l_trans = 0, l_books = 0 ;
	for(i = 1; i < grdDtl.rows; i++)
	{
		if(grdDtl.GetGridData(i, g_Chk, '-1')=='-1')
		{		
		    l_trans += Number(grdDtl.GetGridData(i, g_TransAmt ));
		    l_books += Number(grdDtl.GetGridData(i, g_BooksAmt ));
        }		    
	}
	txtTotTrans.SetDataText(l_trans) ;
	txtTotBooks.SetDataText(l_books) ;
}
//--------------------------------------------
</script>
<body style="margin:0; padding:0;">
<!---------------------------------------------------------------------------------->
    <gw:data id="dso_get_ap" onreceive="OnDataReceive(this)" >
        <xml>
            <dso type="grid" function="ac_sel_tac_crdad_other_1" >
                <input bind="grdDtl">
    	      <input bind="lstVATRate" />		
                    <input bind="txtTac_crda_other_pk" />                   
                </input>
                <output bind="grdDtl" />
            </dso>
        </xml>
    </gw:data>

    <gw:data id="dso_get_apother_mst" onreceive="OnDataReceive(this)" >
        <xml>
            <dso type="grid" function="ac_sel_60090080_crda_other" >
                <input bind="grdMst">
                    <input bind="txtcompk" />                   
                    <input bind="dtInvoiceDatefr" />
					<input bind="dtInvoiceDateto" />                    
                    <input bind="txtVoucherNo" />
					<input bind="txtven_pk" />        
                    <input bind="lstVATRate" />  
                    <input bind="txtUserID" />       					            
                </input>
                <output bind="grdMst" />
            </dso>
        </xml>
    </gw:data>
	
<!---------------------------------------------------------------------------------->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%">
<tr style="height:0%" >    
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
    <tr style="height:4%; " >
        <td align="right">Voucher No</td>
        <td ><gw:textbox id="txtVoucherNo" styles="width:100%" onenterkey="onSearch()"/></td>
        <td align="right">Trans Date</td>
        <td><gw:datebox id="dtInvoiceDatefr" lang="1" /></td>
        <td align="center">~</td>
        <td><gw:datebox id="dtInvoiceDateto" styles="width:100%" lang="1" /></td>
        <td align="right">Vendor</td>
        <td>
            <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="height:100%">
            <tr>
                <td width="30%"><gw:textbox id="txtven_cd" styles='width:100%' /></td>
                <td width="50%"><gw:textbox id="txtven_nm" styles='width:100%'/></td>
                <td width="0%"><gw:textbox  id="txtven_pk" styles='display:none'/></td>
                <td width="5%"><gw:imgBtn   img="popup"	id="idSearchVen" alt="Popup" onclick="onSearchVen()"/></td> 
                <td width="5%"><gw:imgBtn   img="reset"	id="idResetVen"  alt="Reset" onclick="onResetVen()"/></td>
                <td width="7%">Chk All</td>
                <td width="3%"><gw:checkbox id="chkAll" value='F' onchange="OnCheckAll()" /></td>
            </tr>
            </table>
        </td>
        <td>
            <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="height:100%">
				<tr>
				    <td align="center" width="15%">VAT</td>
					<td align="center" width="45%"><gw:list id="lstVATRate" onchange="onSearch('1')" >
					    <data>DATA|ALL|ALL|5|5%|10|10%</data>
					</gw:list></td>
					<td align="right" width="40%"><gw:imgBtn id="ibtnSelect" img="select" alt="Select" onclick="onSelect()"/></td>
				</tr>
            </table>
        </td>
        <td><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"        onclick="onSearch('1')"/></td>
    </tr>
    <tr>
        <td align="right">User</td>
        <td ><gw:checkbox id="ckUser" value="T" /></td> 
        <td><gw:icon id="btnShow" text="Show Details" alt="Show Details" onclick="OnShowDetails()" /></td>       
    </tr>
    <tr style="height:46%;">
        <td colspan="10" >
            <gw:grid
                id      ="grdMst"  
                header  ="|_PK|Voucher No|Trans Date|Serial No|Invoice Date|Invoice No|Trans Ccy|Due Date|VAT Due Date|Account Code|Account Name|_tac_acpk|Vendor Name"
                format  ="3|0|0|4|0|4|0|0|4|4|0|0|0|0"
                aligns  ="1|0|0|1|0|1|1|1|1|1|1|0|0|0"
                defaults="|||||||||||||"
                editcol ="1|0|0|0|0|0|0|0|0|0|0|0|0|0"
                widths  ="500|0|1500|1500|1500|1400|1500|1200|1200|1500|1500|2500|0|2000"
                styles  ="width:100%; height:100%"                
				acceptNullDate="T"								
                sorting ="T"                				
            />
        </td>
    </tr>	
    <tr style="height:6%;">
        <td colspan="10">         
            <table width="100%" >
                <tr>
                    <td style="width:80%;" align="right">Total&nbsp;</td>
                    <td align="right" style="width:10%;"><gw:textbox id="txtTotTrans" type="number" format="###,###,###.##R" /></td>
                    <td align="right" style="width:10%;"><gw:textbox id="txtTotBooks" type="number" format="###,###,###.##R" /></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="height:86%;">
        <td colspan="10" >
            <gw:grid
                id      ="grdDtl"  
                header  ="|_tac_crdad_other_pk|_tco_item_pk|Voucher No|Item Code|Item Name|Unit|Qty|UPrice|Trans Amt|Books Amt|_tac_abacctcode_pk|Acc. Code|Acc. Name|Description|Local Desc|_tin_whpk|WH|_acpk_338|_accd_338|_acnm_338|_tac_abplcenter_pk"
                format  ="3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                aligns  ="1|0|0|0|1|0|1|3|3|3|3|0|1|0|0|0|0|0|0|0|0|0"
                defaults="|||||||||||||||||||||"
                editcol ="1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                widths  ="500|0|0|1500|1200|2500|800|1000|1000|1500|1500|0|1200|2000|2000|2000|0|1500|0|0|0|0"
                styles  ="width:100%; height:100%"                
                sorting ="T"
				acceptNullDate="T"
				onafteredit="OnSum()"
            />
        </td>
    </tr>
</table>	
<gw:textbox id="txtcompk"           style="display:none" />
<gw:textbox id="txtTac_crda_other_pk" style="display:none" />
<gw:textbox id="txtUserID" style="display:none" />
<!---------------------------------------------------------------------------------------------------->
</body>
</html>