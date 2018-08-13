<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>

<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
 
function BodyInit()
{
    System.Translate(document);
	var g_user_pk = "<%=Session("USER_PK")%>";
	txtUserPK.SetDataText(g_user_pk);
	var l_data = "<%=CtlLib.SetListDataFUNC("select ac_A_GET_COMMONCODE('ACBG0010') FROM DUAL ")%>"; 
	lstStatus.SetDataText(l_data); 
	lstStatus.value=2;
	var ls_Book_ccy    = "<%=CtlLib.SetListDataSQL("select a.code, a.code code_nm from tac_commcode_detail a, tac_commcode_master b where a.del_if = 0 and b.del_if = 0 and a.tac_commcode_master_pk = b.pk and b.id = 'ACBG0040' and a.def_yn = 'Y'")%>";
	lstBook_ccy.SetDataText(ls_Book_ccy);
	SetGridData();
    dso_getCompany.Call();
}
function SetGridData()
{
    var fg1  = idGrid.GetGridControl();
	
    var fg2  = idGridDetail.GetGridControl();
	
     fg1.ColFormat(5)     = "#,###,###,###,###,###,###,###,###.##R";
     fg1.ColFormat(7)     = "#,###,###,###,###,###,###,###.##R";
     fg1.ColFormat(9)     = "#,###,###,###,###,###,###,###.##R"
     fg1.ColFormat(10)     = "#,###,###,###,###,###,###,###.##R";
		
    if (lstBook_ccy.GetData() == 'VND')
    {
        fg1.ColFormat(6)     = "#,###,###,###,###,###,###,###,###,###R";
        fg1.ColFormat(8)     = "#,###,###,###,###,###,###,###,###R";
        fg1.ColFormat(11)     = "#,###,###,###,###,###,###,###,###R";
		
       
        fg2.ColFormat(5)     = "#,###,###,###,###,###,###,###,###,###R";
        fg2.ColFormat(7)    = "#,###,###,###,###,###,###,###,###,###R";
        fg2.ColFormat(9)    = "#,###,###,###,###,###,###,###,###,###R";
		
    }
    else
    {
        fg1.ColFormat(6)      = "#,###,###,###,###,###,###,###,###.##R";
        fg1.ColFormat(8)      = "#,###,###,###,###,###,###,###,###.##R";
        fg1.ColFormat(11)     = "#,###,###,###,###,###,###,###,###.##R";
        
		
        fg2.ColFormat(5)    = "#,###,###,###,###,###,###,###,###.##R";
        fg2.ColFormat(7)    = "#,###,###,###,###,###,###,###,###.##R";
        fg2.ColFormat(9)    = "#,###,###,###,###,###,###,###,###.##R";
		
    }
  
    
}

function onSearch()
{
    dso_search.Call("SELECT");
}
function MergeHeader()
{
	if (idGrid.rows < 2)
	{
	    idGrid.AddRow();
	}
		var fg=idGrid.GetGridControl();
		fg.FixedRows    = 2
		fg.MergeCells   = 5
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 1, 0, 2) = "Item"  
		fg.Cell(0, 0, 3, 0, 4) = "Account"  
		fg.Cell(0, 0, 6, 0, 7) = "Org Amount (A/P)" 
		fg.Cell(0, 0, 8, 0, 9) = "Allocate Amount" 
		fg.Cell(0, 0, 11, 0, 12) = "Actual Amount" 
		
		fg.Cell(0, 1, 1, 1) 	= "Code"
		fg.Cell(0, 1, 2, 1 ) 	= "Name"
		fg.Cell(0, 1, 3, 1) 	= "Code"
		fg.Cell(0, 1, 4, 1 ) 	= "Name"
		fg.Cell(0, 1, 6, 1) 	= "Trans"
		fg.Cell(0, 1, 7, 1 ) 	= "Book"
		fg.Cell(0, 1, 8, 1) 	= "Trans"
		fg.Cell(0, 1, 9, 1 ) 	= "Book"
		fg.Cell(0, 1, 11, 1) 	= "Trans"
		fg.Cell(0, 1, 12, 1 ) 	= "Book"
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "PK"
		fg.MergeCol(5) = true
		fg.Cell(0, 0, 5, 1, 5) = "CCY"
		fg.MergeCol(10) = true
		fg.Cell(0, 0, 10, 1, 10) = "IMP.Tax"
		fg.MergeCol(13) = true
		fg.Cell(0, 0, 13, 1, 13) = "Serial No"
		fg.MergeCol(14) = true
		fg.Cell(0, 0, 14, 1, 14) = "Invoice No"
		fg.MergeCol(15) = true
		fg.Cell(0, 0, 15, 1, 15) = "Invoice Date"
		fg.MergeCol(16) = true
		fg.Cell(0, 0, 16, 1, 16) = "Voucher No"
		fg.MergeCol(17) = true
		fg.Cell(0, 0, 17, 1, 17) = "Voucher Date"
	
}
function MergeHeaderDetail()
{
	if (idGridDetail.rows < 2)
	{
	    idGridDetail.AddRow();
	}
		var fg=idGridDetail.GetGridControl();
		fg.FixedRows    = 2
		fg.MergeCells   = 5
		fg.MergeRow(0) = true
		fg.Cell(0, 0, 1, 0, 2) = "Item"  
		fg.Cell(0, 0, 3, 0, 4) = "Account"  
		fg.Cell(0, 0, 6, 0, 7) = "Org Amount (A/P)" 
		fg.Cell(0, 0, 8, 0, 9) = "Allocate Amount" 
		fg.Cell(0, 0, 10, 0, 11) = "Actual Amount" 
		
		fg.Cell(0, 1, 1, 1) 	= "Code"
		fg.Cell(0, 1, 2, 1 ) 	= "Name"
		fg.Cell(0, 1, 3, 1) 	= "Code"
		fg.Cell(0, 1, 4, 1 ) 	= "Name"
		fg.Cell(0, 1, 6, 1) 	= "Trans"
		fg.Cell(0, 1, 7, 1 ) 	= "Book"
		fg.Cell(0, 1, 8, 1) 	= "Trans"
		fg.Cell(0, 1, 9, 1 ) 	= "Book"
		fg.Cell(0, 1, 10, 1) 	= "Trans"
		fg.Cell(0, 1, 11, 1 ) 	= "Book"
		
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "PK"
		fg.MergeCol(5) = true
		fg.Cell(0, 0, 5, 1, 5) = "CCY"
		fg.MergeCol(12) = true
		fg.Cell(0, 0, 12, 1, 12) = "Invoice No"
		fg.MergeCol(13) = true
		fg.Cell(0, 0, 13, 1, 13) = "Voucher No"
		fg.MergeCol(14) = true
		fg.Cell(0, 0, 14, 1, 14) = "Voucher Date"
	
}
function OnDataReceive(iObj)
{
    if(iObj.id=='dso_getCompany')
    {
		MergeHeader();
		MergeHeaderDetail();
    }
	if(iObj.id=='dso_search')
    {
		MergeHeader();
		MergeHeaderDetail();
		if (idGrid.rows > 2)	
		{
			idGrid.Subtotal( 0, 2, -1, '6!7!8!9!10!11,12');
		}
    }
	if(iObj.id=='dso_search_detail')
    {
		MergeHeaderDetail();
		if (idGridDetail.rows > 2)	
		{
			idGridDetail.Subtotal( 1, 2, -1, '8!9');
		}
    }
	if(iObj.id=='dso_search_detail')
    {
		MergeHeaderDetail();
		if (idGridDetail.rows > 2)	
		{
			idGridDetail.Subtotal( 1, 2, -1, '8!9');
		}

    }
}
function OnSearchDetail()
{
	txtCRDAD_pk.text = idGrid.GetGridData(idGrid.row, 0); ;
	dso_search_detail.Call("SELECT");
}
function OnPopUp(obj)
{
	if(obj=='Item')
	{
		var path = System.RootURL + '/standard/forms/60/11/60110190_popup_get_one_item.aspx';
		    var object = System.OpenModal( path ,800 , 600 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
		        if (object[0] != 0)
                {
                    txtItemCD.SetDataText(object[1]);//customer id
                    txtItemNM.SetDataText(object[2]);//customer name
                    txtItemPK.SetDataText(object[0]);//customer name
      	        }   
		     }    
	}
	if(obj=='Account')
	{
		var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "15" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_SEL_ACCT_POPUP";
			var o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
			if (o != null)
			{
				if(o[0] != 0)
				{
					txtACC_PK.text = o[3]; // account pk
					txtACC_CD.text = o[0]; // account code
					txtACC_NM.text = o[1] ; // account name
				}				
			}		
	}
}
function Reset_Popup(obj)
{
	if(obj=='Item')
	{
		txtItemCD.text ="";//customer id
		txtItemNM.text ="";//customer name
		txtItemPK.text ="";//pk
	}
	if(obj=='Account')
	{
		txtACC_PK.text =""; // account pk
		txtACC_CD.text =""; // account code
		txtACC_NM.text = ""; // account name
	}
}
function OnExcel()
{  
	var url = System.RootURL + "/standard/reports/60/09/rpt_60090140_accrued.aspx?std_ym=" + dtFrom.value + "&ac_cd=" + txtACC_PK.GetData() + "&tin_warehouse_pk=ALL&tco_company_pk=" + lstCompany.value + "&item_pk=" + txtItemPK.GetData() + "&cust_pk=" +''+ "&voucherno=" + txtVoucherNo.GetData() +"&takein_no=" +''+"&std_ym_to=" + dtTo.value+"&invoice_no=" + txtInvoiceNo.text ;
	System.OpenTargetPage(url);     			
}
//---------------------------------------------------------------------------
function FormatCalculate(ccy, pnum)
{
	var rValue =0 ;
	if(ccy == "VND")
	{
		rValue = Math.round(Number(pnum));
	}
	else
	{
		rValue = Math.round(Number(pnum) * 100)/100;
	}	
	return rValue;
}

</script>
<body style="margin:0; padding:0;">
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_gfac00100_1" > 
                <input> 
                     <input bind="txtUserPK"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
</gw:data>  
<gw:data id="dso_search" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="ac_sel_60090140" > 
                <input bind="idGrid" >                  
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
					<input bind="txtVoucherNo" />
					<input bind="txtInvoiceNo" />
					<input bind="txtItemPK" />
					<input bind="lstCompany" /> 
					<input bind="txtACC_PK" />
					<input bind="lstStatus" />    	
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data> 
<gw:data id="dso_search_detail" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid"  function="ac_sel_60090140_dtl" > 
                <input bind="idGridDetail" >                  
                    <input bind="txtCRDAD_pk" />         
                </input>
                <output  bind="idGridDetail" />
            </dso> 
        </xml> 
    </gw:data>       	
<!------------------------------------------------------------------------>
<table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
<tr style='height:4%'>
    <td width="100%">
        <fieldset style='padding:0'>
        <table width="100%" cellpadding="1" cellspacing="1" border="0">
        <tr>
	        <td width="5%"></td>
	        <td width="24%"></td>
	        <td width="5%"></td>
	        <td width="11%"></td>
	        <td width="8%"></td> 
	        <td width="13%"></td>
	        <td width="7%"></td>
	        <td width="13%"></td>
	        <td width="5%"></td>
	        <td width="9%"></td>
	        
	    </tr>
	    <tr>
	        <td align="right">Company&nbsp;</td>
            <td><gw:list id="lstCompany" onChange ="onSearch()" styles='width:100%'></gw:list></td>
                          
            <td><a title="Click here to select Ex.Rate" onclick="OnPopUp('Item')" href="#tips" style="text-decoration: none; color=#0000ff"><b>Item&nbsp;</b></a></td>
			<td colspan="6">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%"> 
					<tr>
						<td width="15%"><gw:textbox id="txtItemCD" styles='width:100%' onkeypress="CheckNumeric()" onenterkey="onEnter()"/></td>
						<td width="30%"><gw:textbox id="txtItemNM" styles='width:100%'/></td>
						<td width="0%"><gw:textbox  id="txtItemPK" styles='display:none'/></td> 
						<td width="3%"><gw:imgBtn   img="reset"	id="idResetitem"  alt="Reset" onclick="Reset_Popup('Item')"/></td>
						<td width="10%" align="right"><a title="Click here to show account code" onclick="OnPopUp('Account')" href="#tips" >Account Code</a></td>
						<td width="15%"><gw:textbox id="txtACC_CD" readonly='true' styles='width:100%' text='' /></td>
						<td width="25%" ><gw:textbox id="txtACC_NM" readonly='true' styles='width:100%' text='' /></td>
						<td width="2%"><gw:imgBtn   img="reset"	id="idResetAcc"  alt="Reset" onclick="Reset_Popup('Account')"/></td>
					</tr>
                </table>
	        </td>
			<td align="right"><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"        onclick="onSearch()"/></td>
	    </tr>
	     <tr>
            <td align="center" colspan="10">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="6%">Date</td>
                   
                    <td width="8%"><gw:datebox id="dtFrom" lang="1" onchange="onSearch()" /></td>
					<td width="2%">~</td>
					<td width="8%"><gw:datebox id="dtTo" lang="1" onchange="onSearch()" /></td>
					<td align="right" width="9%">Voucher No</td>
					<td width="17%"><gw:textbox id="txtVoucherNo" styles='width:100%' onenterkey="onSearch()" /></td>
					<td width="7%" align="right"></td>
                    <td align="right" width="9%">Invoice No</td>
					
                    <td width="12%"><gw:textbox id="txtInvoiceNo" styles='width:100%' onenterkey="onSearch()" /> 
					</td> 
					<td width="5%" align="right">Status</td>
					<td align="" width="8%" ><gw:list id="lstStatus" styles="width:100%" onchange="OnSearch()" /></td>
					<td width="9%"><gw:imgBtn id="ibtnExcel" img="excel"  alt="Print"  onclick="OnExcel()" /></td>
                </tr>
                </table>
            </td>
	    </tr>
	    </table>
        </fieldset>
	</td>
</tr>
<tr style='height:48%'>
	<td width="100%">
	    <table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
        
        <tr style='height:100%'>
            <td>
                 <gw:grid   
				    id="idGrid"  
				    header="_1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18"
				    format="0|0|0|0|0|0|1|1|1|0|1|1|1|0|0|4|0|4"  
 			        aligns="1|2|0|0|0|0|0|3|3|3|3|3|0|0|0|0|0|0"
				    widths="400|0|3000|1200|2400|600|1800|1800|1800|1800|1800|1800|1800|1800|1800|1200|2000|1200"  
				    styles="width:100%; height:100%"
				    sorting="T"
				    oncellclick="OnSearchDetail()"
				    /> 
				
            </td>
        </tr>
		
        </table>
	</td>
</tr>
<tr style='height:48%'>
	<td width="100%">
	    <table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
        
        <tr style='height:100%'>
            <td>
                 <gw:grid   
				    id="idGridDetail"  
				    header="_1|2|3|4|5|_6|_7|_8|9|10|_11|_12|13|14|15"
				    format="0|0|0|0|0|0|-0|1|-0|1|-0|-0|0|0|4"  
 			        aligns="1|2|0|0|0|3|3|3|3|3|3|0|0|0|0"
				    widths="400|1200|2500|1200|2500|600|1800|1800|1800|1800|1800|1800|1200|1200|1500"  
				    styles="width:100%; height:100%"
				    sorting="T" 
				    oncelldblclick=""
				    /> 
				
            </td>
        </tr>
		
        </table>
	</td>
</tr>
</table>

<gw:textbox id="txt_check"      styles='display:none'/>
<gw:textbox id="txt_temp"       styles='display:none'/>
<gw:textbox id="txt_row"        styles='display:none'/>
<gw:textbox id="txt_date"       styles='display:none'/>
<gw:textbox id="txtUserPK"             style="display:none" />
<gw:textbox id="txtCRDAD_pk"             style="display:none" />
<gw:textbox id="txtACC_PK"             style="display:none" />
<gw:list    id="lstBook_ccy" 		    style="display:none" /></gw:list >
</body>
</html>