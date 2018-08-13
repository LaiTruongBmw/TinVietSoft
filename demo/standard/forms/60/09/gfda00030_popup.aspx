<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>    
</head>
<%CtlLib.SetUser("acnt")%>

<script>

//-----------------------------------------              
function BodyInit()
{
    System.Translate(document);
	var l_today = dtFrom.value ;
	l_today = l_today.substring(0, 6) + "01";
    dtFrom.value = l_today;    
	var l_compk = <%=Request("compk")%>;
	txtcompk.text = l_compk;
	OnFormatGrid();
}
//--------------------------------------------
function OnCheckAll()
{
	var i;
	if(chkAll.value == "F")
	{
		for(i = 1; i < grdDtl.rows; i++)
		{
			grdDtl.SetGridText(i, 0, "0");
		}
	}
	else if(chkAll.value == "T")
	{
		for(i = 1; i < grdDtl.rows; i++)
		{
			grdDtl.SetGridText(i, 0, "-1");
		}		
	}
}
//--------------------------------------------
function OnPopUp(p_data)
{
	if(p_data == "Vendor")
	{
		var path    = System.RootURL + '/standard/forms/gf/co/ffbp00031.aspx';
		var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
		if ( object != null )
		{
			if (object[0] != 0)
			{
				txtVendorPK.text = object[0];
				txtVendorNM.text = object[2];
			}
		}
	}	
}
//--------------------------------------------
function OnSearch()
{
	dso_ap_dtl.Call('SELECT');
}
//--------------------------------------------
function OnSelect()
{
    var i, j ;
	var aValue = new Array();
	for(i=1; i<grdDtl.rows; i++)
    {
		if(grdDtl.GetGridData(i, 0)== "-1")
		{
			tmp= new Array();
			for(j = 1; j < grdDtl.cols; j++)
			{
				tmp[tmp.length] = grdDtl.GetGridData(i, j);
			}			
			aValue[aValue.length]=tmp;
		}
    }
	window.returnValue = aValue;
	window.close();
}
//--------------------------------------------
function OnDataReceive(iObj)
{
	if(iObj.id == "dso_ap_dtl")
	{
		
	}
}
//--------------------------------------------
function OnFormatGrid()
{
	var fg = grdDtl.GetGridControl();
	fg.ColFormat(8) = "###,###,###,###,###R";
	fg.ColFormat(9) = "###,###,###,###,###.##R";
	fg.ColFormat(10) = "###,###,###,###,###R";	
}
//--------------------------------------------
</script>
<body style="margin:0; padding:0;">
<!----------------------------------------------------------------------------------------------------------------->
<gw:data id="dso_ap_dtl" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="grid" function="acnt.sp_sel_gfda00030_popup"  > 
            <input bind="grdDtl" > 
                 <input bind="txtcompk" />
				 <input bind="dtFrom" />
				 <input bind="dtTo" />				 
				 <input bind="txtVoucherNo" />
				 <input bind="txtSeq" />
				 <input bind="txtVendorPK" />
             </input> 
            <output bind="grdDtl" /> 
        </dso> 
    </xml> 
</gw:data>

<!----------------------------------------------------------------------------------------------------------------->
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%">
	<tr style="height:0%">    
    	<td width="12%"></td>
    	<td width="10%"></td>
    	<td width="2%"></td>
    	<td width="10%"></td>
    	<td width="10%"></td>
    	<td width="20%"></td>
    	<td width="10%"></td>
   		<td width="13%"></td>
		<td width="5%"></td>
		<td width="2%"></td>
	    <td width="3%"></td>
   		<td width="3%"></td>
	</tr>   
    <tr style="height:5%">
		<td align="right">Trans Date&nbsp;</td>
		<td align="left"><gw:datebox id="dtFrom" lang="1" /></td>
		<td>~</td>
		<td align="left"><gw:datebox id="dtTo" lang="1" /></td>
		<td align="right">Voucher No&nbsp;</td>
		<td align="left"><gw:textbox id="txtVoucherNo" styles="width:100%" onenterkey="OnSearch()" /></td>
		<td align="right">Seq&nbsp;</td>
		<td align="left"><gw:textbox id="txtSeq" styles="width:100%" onenterkey="OnSearch()" /></td>
		<td align="right">Check All&nbsp;</td>
		<td align="right"><gw:checkbox id="chkAll" value="F" onchange="OnCheckAll()" /></td>
		<td align="right"><gw:imgBtn id="idBtnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
		<td align="right"><gw:imgBtn id="idBtnSelect" img="select" alt="Select" onclick="OnSelect()" /></td>
	</tr> 
    <tr style="height:5%">
		<td align="right"><a title="Click here to select Vendor" onclick="OnPopUp('Vendor')" href="#tips">Vendor&nbsp;</td>
		<td align="left" colspan="3" ><gw:textbox id="txtVendorNM" styles="width:100%;" /></td>
	</tr> 	
	<tr style="height:90%">
		<td colspan="12">
            <gw:grid
                id      ="grdDtl"  
                header  ="|_tac_crdad_pk|Voucher No|Seq|_tco_item_pk|Item code|Item name|CCY|Ex Rate|Net Trans Amt|Net Books Amt|_tac_abacctcode_pk|Account code|Account Name|Description|Local Desc"
                format  ="3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                aligns  ="1|0|0|1|0|0|0|1|3|3|3|0|1|2|0|0"
                defaults="|||||||||||||||"
                editcol ="1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                widths  ="500|0|1500|800|0|1500|2500|800|1200|1700|1700|0|1500|2500|2000|2000"
                styles  ="width:100%; height:100%"
				acceptNullDate='T'
                sorting ="T"                
            />
		</td>
	</tr>
</table>
<gw:textbox id="txtcompk" style="display:none" />
<gw:textbox id="txtVendorPK" style="display:none" />
<!---------------------------------------------------------------------------------------------------->
</body>
</html>