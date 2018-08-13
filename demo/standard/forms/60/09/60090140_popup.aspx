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
    dso_getCompany.Call();
}
function onSearch()
{
    dso_search.Call("SELECT");
}
function MergeHeader2()
{
	if (idGrid2.rows < 2)
	{
	    idGrid2.AddRow();
	}
		var fg=idGrid2.GetGridControl();
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
		MergeHeader2();
    }
	if(iObj.id=='dso_search')
    {
		MergeHeader2();
    }
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
                <input bind="idGrid2" >                  
                    <input bind="dtFrom" />
                    <input bind="dtTo" />
					<input bind="txtVoucherNo" />
					<input bind="txtInvoiceNo" />
					<input bind="txtac_cd" />
					<input bind="lstCompany" />            
                </input>
                <output  bind="idGrid2" />
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
                          
            <td><a title="Click here to select Ex.Rate" onclick="OnPopup()" href="#tips" style="text-decoration: none; color=#0000ff"><b>Item&nbsp;</b></a></td>
			<td colspan="3">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="35%"><gw:textbox id="txtac_cd" styles='width:100%' onkeypress="CheckNumeric()" onenterkey="onEnter()"/></td>
                    <td width="60%"><gw:textbox id="txtac_nm" styles='width:100%'/></td>
                    <td width="0%"><gw:textbox  id="txtac_pk" styles='display:none'/></td>
                    <td width="5%"><gw:imgBtn   img="reset"	id="idResetAcc"  alt="Reset" onclick="Reset_Acc()"/></td>
                </tr>
				 
				<td colspan="1"></td>
                </table>
	        </td>
			<td align="right"><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"        onclick="onSearch()"/></td>
	    </tr>
	     <tr>
            <td align="center" colspan="6">
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="10%">Date</td>
                   
                    <td width="10%"><gw:datebox id="dtFrom" lang="1" /></td>
					<td width="2%">~</td>
					<td width="10%"><gw:datebox id="dtTo" lang="1" /></td>
                    <td width="5%"></td>
					<td align="right" width="12%">Voucher No</td>
					<td width="25%"><gw:textbox id="txtVoucherNo" styles='width:100%'/></td>
                    <td align="right" width="10%">Invoice No</td>
                    <td width="16%"><gw:textbox id="txtInvoiceNo" styles='width:100%'/> 
					</td> 
                </tr>
                </table>
            </td>
					
			
	    </tr>
	    </table>
        </fieldset>
	</td>
</tr>
<tr style='height:96%'>
	<td width="100%">
	    <table style='width:100%;height:100%' cellpadding="0" cellspacing="0" border="0">
        
        <tr style='height:100%'>
            <td>
                 <gw:grid   
				    id="idGrid2"  
				    header="1|2|3|4|5|6|7|8|9|10|11|12|13|14|15"
				    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
 			        aligns="1|2|0|0|3|3|3|3|3|3|3|0|0|0|0"
				    widths="400|0|3000|3000|3000|600|1800|1800|1800|1800|1800|1800|1800|2000|2000"  
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
</body>
</html>

