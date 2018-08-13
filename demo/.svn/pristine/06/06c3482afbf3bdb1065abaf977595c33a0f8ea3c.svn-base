<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>    
</head>
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
//No|Check|T/I Date|Vendor CD|Vendor NM|_Vendor_PK|Mat CD|Mat NM|_MatPK|Qty|Unit Price|Amount
var 	g_No	 		= 0,
		g_Check	 		= 1,
		g_TI_Date		= 2,
		g_VendorCD		= 3,
		g_VendorNM		= 4,
		g_Vendor_PK		= 5,
		g_MatCD			= 6,
		g_MatNM			= 7,
		g_MatPK			= 8,
		g_Qty			= 9,
		g_UnitPrice		= 10,
		g_Amount		= 11;

var 	g2_PK			= 0,
		g2_No	 		= 1,
		g2_Check	 	= 2,
		g2_TI_Date		= 3,
		g2_VendorCD		= 4,
		g2_VendorNM		= 5,
		g2_Vendor_PK	= 6,
		g2_MatCD		= 7,
		g2_MatNM		= 8,
		g2_MatPK		= 9,
		g2_Qty			= 10,
		g2_UnitPrice	= 11,
		g2_Amount		= 12,
		g2_loc			= 13,
		g2_dept_gu		= 14,
		g2_idate		= 15,
		g2_iseqno		= 16,
		g2_iserial		= 17;
var g_vendor_pk = "<%=Request.querystring("vendor_pk")%>";	
var g_vendor_id = "<%=Request.querystring("vendor_id") %>";	
//--------------------------------------------              
function BodyInit()
{
    System.Translate(document);
	BindingDataList();
}
//--------------------------------------------
function BindingDataList()
{
	var l_dtfr = dtTIDatefr.value ;
	dtTIDatefr.value = l_dtfr.substring(0, 6) + "01" ;
	var ls_data         = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
	lstCompany.SetDataText(ls_data);	
	FormatHeader('grdDtl');
	FormatHeader('grdDtl2');
	txtPartnerPK.text = g_vendor_pk ;
	txtVendorID.text = g_vendor_id ;
	dso_get_partnerNM.Call();
}
//--------------------------------------------
function OnPopUp(iCase)
{
/*
	switch(iCase)
	{
		case 'Partner':
			var fpath   = System.RootURL + "/standard/forms/fp/ab/PopUpGetPartner.aspx";
			var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
			if ( object != null )  
			{
				if (object[0] != "")
				{
					txtPartnerPK.text = object[0];
					txtPartnerID.text = object[1];
					txtPartnerNM.text = object[2];
				}
			}	
		break ;
		case 'Product':
			var fpath   = System.RootURL + "/standard/forms/fp/ab/PopUpGetOneItem.aspx";
			var object  = System.OpenModal(fpath , 900 , 500 , 'resizable:yes;status:yes'); 
			if ( object != null )  
			{
				if (object[0] != "")
				{
					txtProductPK.text = object[0];
					txtProductID.text = object[1];
					txtProductNM.text = object[2];
				}
			}			
		break ;
	}
	*/
}
//--------------------------------------------
function OnSearch()
{
	dso_getdata_SH.Call("SELECT");	
}
//--------------------------------------------
function OnDataReceive(iObj)
{
	switch(iObj.id)	
	{
		case 'dso_getdata_SH':
			FormatHeader('grdDtl');
			dso_update_rec_d_crdad.Call("SELECT");
		break ;
		case 'dso_update_rec_d_crdad':
			FormatHeader('grdDtl2');
		break ;
	}
}
//--------------------------------------------
function OnAddNew()
{
	var i;
	grdDtl2.AddRow();
	for( i = 0; i < grdDtl.cols ; i++)
	{
		grdDtl2.SetGridText(grdDtl2.rows - 1, i + 1, grdDtl.GetGridData(event.row, i) );
	}	
	grdDtl.RemoveRowAt(event.row);
	grdDtl2.SetRowStatus(grdDtl2.rows - 1, 0x20) ;
}
//--------------------------------------------
function OnSelect()
{
	var code_data = new Array()      
	  	
	var ctrl = grdDtl2.GetGridControl();
    var i , j, index = 0;
	if( ctrl.rows == 2 )
	{
		return ;
	}
	else
	{
		for( i = 2 ; i < ctrl.rows ; i++ )
		{
			var arr_data = new Array();
			if(grdDtl2.GetGridData(i, 0) == "")
			{
				alert("Must save data before selecting data for AP");
				return ;
			}
				for( j = 0 ; j < grdDtl2.cols - 1 ; j++ )
				{
					arr_data[arr_data.length] = grdDtl2.GetGridData(i , j );				
				} 
				code_data[code_data.length] = arr_data ;
				
		}
	}
	window.returnValue = code_data; 
	this.close(); 		
}
//--------------------------------------------
function OnClose()
{
    this.close();
}
//--------------------------------------------
function OnSave()
{
	grdDtl2.SetRowStatus(1, 0x00) ;
	dso_update_rec_d_crdad.Call();
}

function OnDelete()
{
	var i;
	var fg = grdDtl2.GetGridControl();
	for( i = 2; i < grdDtl2.rows; i++)
	{
		if(fg.IsSelected(i) == true)
		{
			grdDtl2.SetRowStatus(i, 0x40);
		}
	}
	dso_update_rec_d_crdad.Call();
}
//--------------------------------------------
function FormatHeader(iCase)
{
	switch(iCase)
	{
		case 'grdDtl':		
			var fg = grdDtl.GetGridControl();
			if(grdDtl.rows == 1)
				grdDtl.AddRow();
			fg.ColFormat(g_Qty)     		= "#,###,###.##R";
			fg.ColFormat(g_UnitPrice)     	= "#,###,###.##R";
			fg.ColFormat(g_Amount)     		= "#,###,###.##R";
			fg.FixedRows = 2; 
			fg.Cell(13, 1, 0, 1, fg.Cols - 1) 	= true ;    
			fg.MergeCells 						= 5;			
            fg.MergeCol(g_No) 						= true ;            
			fg.MergeRow(0) = true;
            fg.Cell(0, 0, g_No, 1, g_No) 				= 'No';   
			fg.MergeCol(g_Check) 						= true ;            
			fg.Cell(0, 0, g_Check, 1, g_Check) 				= 'Check';
			fg.MergeCol(g_TI_Date) 						= true ;            
			fg.Cell(0, 0, g_TI_Date, 1, g_TI_Date) 				= 'T/I Date';
			
			fg.Cell(0, 0, g_VendorCD, 0, g_Vendor_PK) 				= 'Vendor';
			fg.Cell(0, 1, g_VendorCD, 1, g_VendorCD) 				= 'Code';
			fg.Cell(0, 1, g_VendorNM, 1, g_VendorNM) 				= 'Name';
			
			fg.Cell(0, 0, g_MatCD, 0, g_MatPK) 				= 'Material';
			fg.Cell(0, 1, g_MatCD, 1, g_MatCD) 				= 'Code';
			fg.Cell(0, 1, g_MatNM, 1, g_MatNM) 				= 'Name';
			fg.MergeCol(g_Qty)				= true;
			fg.Cell(0, 0, g_Qty, 1, g_Qty) 				= 'Qty';
			fg.MergeCol(g_UnitPrice)				= true;
			fg.Cell(0, 0, g_UnitPrice, 1, g_UnitPrice) 				= 'Unit Price';
			fg.MergeCol(g_Amount)				= true;
			fg.Cell(0, 0, g_Amount, 1, g_Amount) 				= 'Amount';
		
		break ;
		case 'grdDtl2':
			var fg = grdDtl2.GetGridControl();
			if(grdDtl2.rows == 1)
				grdDtl2.AddRow();
					
			fg.ColFormat(g2_Qty)     		= "#,###,###.##R";
			fg.ColFormat(g2_UnitPrice)     	= "#,###,###.##R";
			fg.ColFormat(g2_Amount)     		= "#,###,###.##R";
			fg.FixedRows = 2; 
			fg.Cell(13, 1, 0, 1, fg.Cols - 1) 	= true ;    
			fg.MergeCells 						= 5;			
            fg.MergeCol(g2_No) 						= true ;            
			fg.MergeRow(0) = true;
            fg.Cell(0, 0, g2_No, 1, g2_No) 				= 'No';   
			fg.MergeCol(g2_Check) 						= true ;            
			fg.Cell(0, 0, g2_Check, 1, g2_Check) 				= 'Check';
			fg.MergeCol(g2_TI_Date) 						= true ;            
			fg.Cell(0, 0, g2_TI_Date, 1, g2_TI_Date) 				= 'T/I Date';
			
			fg.Cell(0, 0, g2_VendorCD, 0, g2_Vendor_PK) 				= 'Vendor';
			fg.Cell(0, 1, g2_VendorCD, 1, g2_VendorCD) 				= 'Code';
			fg.Cell(0, 1, g2_VendorNM, 1, g2_VendorNM) 				= 'Name';
			
			fg.Cell(0, 0, g2_MatCD, 0, g2_MatPK) 				= 'Material';
			fg.Cell(0, 1, g2_MatCD, 1, g2_MatCD) 				= 'Code';
			fg.Cell(0, 1, g2_MatNM, 1, g2_MatNM) 				= 'Name';
			fg.MergeCol(g2_Qty)				= true;
			fg.Cell(0, 0, g2_Qty, 1, g2_Qty) 				= 'Qty';
			fg.MergeCol(g2_UnitPrice)				= true;
			fg.Cell(0, 0, g2_UnitPrice, 1, g2_UnitPrice) 				= 'Unit Price';
			fg.MergeCol(g2_Amount)				= true;
			fg.Cell(0, 0, g2_Amount, 1, g2_Amount) 				= 'Amount';		
		break ;
	}
}

function OnPopUp(iCase)
{
	switch(iCase)
	{
		case 'Partner':
			var fpath   = System.RootURL + "/standard/forms/fp/ab/PopUpGetPartner.aspx";
			var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
			if ( object != null )  
			{
				if (object[0] != "")
				{
					txtPartnerPK.text = object[0];
					txtVendorID.text = object[1];
					txtVendorNM.text = object[2];
				}
			}	
		break ;
		case 'Product':
			var fpath   = System.RootURL + "/standard/forms/fp/ab/PopUpGetOneItem.aspx";
			var object  = System.OpenModal(fpath , 900 , 500 , 'resizable:yes;status:yes'); 
			if ( object != null )  
			{
				if (object[0] != "")
				{
					txtProductPK.text = object[0];
					txtMatID.text = object[1];
					txtMatNM.text = object[2];
				}
			}			
		break ;
	}
}

function OnReset(iCase)
{
	if(iCase == '1')
	{
		txtVendorID.text = '';
		txtVendorNM.text = '';
		txtPartnerPK.text = "";		
	}
	else if(iCase == "2")
	{
		txtMatID.text = '';
		txtMatNM.text = '';
		txtProductPK.text = '';
	}
}
</script>
<body style="margin:0; padding:0;">
<!------------------------------------------------------------------------------------------------>
<gw:data id="dso_getdata_SH" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="acnt.sp_sel_rec_d" >
                <input bind="grdDtl">
                    <input bind="lstCompany" />
					<input bind="dtTIDatefr"/>
					<input bind="dtTIDateto"/>
					<input bind="txtPartnerPK"/>
					<input bind="txtProductPK"/>
                </input>
                <output bind="grdDtl"/>
            </dso>
        </xml>
    </gw:data>
	
<gw:data id="dso_update_rec_d_crdad" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,3,13,14,16,17" function="acnt.sp_sel_rec_d_tac_crdad" procedure="acnt.sp_upd_rec_d_tac_crdad" >
                <input bind="grdDtl2">
					<input bind="dtTIDatefr"/>
					<input bind="dtTIDateto"/>
                </input>
                <output bind="grdDtl2"/>
            </dso>
        </xml>
    </gw:data>

    <gw:data id="dso_get_partnerNM" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="acnt.sp_pro_get_partner_nm" > 
                <input> 
                     <input bind="txtPartnerPK"/>
                </input>
                <output>
                     <output bind="txtVendorNM"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
	
<!------------------------------------------------------------------------------------------------>
<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%">
<tr style="height:0%" >    
    <td width="20%"></td>
    <td width="10%"></td>
    <td width="1%"></td>
	<td width="10%"></td>
	<td width="20%"></td>
    <td width="10%"></td>
    <td width="20%"></td>
    <td width="3%"></td>
    <td width="6%"></td>	
</tr>
<tr style="height:4%">
	<td align="right" >Company&nbsp;</td>
	<td align="left" colspan="3"><gw:list id="lstCompany" styles="width:100%" /></td>
	<td align="right"><a title="Click here to show Vendor" onclick="OnPopUp('Partner')" href="#tips" ><b>Vendor&nbsp;</b></a></td>
	<td align="left"><gw:textbox id="txtVendorID" text="" styles="width:100%" /></td>
	<td align="left"><gw:textbox id="txtVendorNM" text="" styles="width:100%" /></td>
	<td align="left"><gw:imgBtn id="idBtnReset" img="reset" alt="Reset" onclick="OnReset('1')" /></td>
	<td align="left"><gw:imgBtn id="idBtnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
</tr>
<tr style="height:4%">
	<td align="right" >T/I Date&nbsp;</td>
	<td align="left" colspan="1"><gw:datebox id="dtTIDatefr" lang="1" styles="width:100%" /></td>	
	<td align="right">~</td>
	<td align="left" colspan="1"><gw:datebox id="dtTIDateto" lang="1" styles="width:100%" /></td>
	<td align="right"><a title="Click here to show Product" onclick="OnPopUp('Product')" href="#tips" ><b>Material No&nbsp;</b></a></td>
	<td align="left"><gw:textbox id="txtMatID" text="" styles="width:100%" /></td>
	<td align="left"><gw:textbox id="txtMatNM" text="" styles="width:100%" /></td>
	<td align="left"><gw:imgBtn id="idBtnReset2" img="reset" alt="Reset" onclick="OnReset('2')" /></td>	
</tr>
<tr style="height:4%">
</tr>
<tr style="height:44%">
	<td colspan="10">
		<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%">
			<tr>
				<td>
					<gw:grid
					id="grdDtl"
					header  ="No|Check|T/I Date|Vendor CD|Vendor NM|_Vendor_PK|Mat CD|Mat NM|_MatPK|Qty|Unit Price|Amount|_loc|_dept_gu|_idate|_iseqno|_iserial"
					format  ="0|3|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					aligns  ="1|1|1|0|0|0|0|0|0|3|3|3|0|0|0|0|0"
					defaults="||||||||||||||||"
					editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					widths  ="800|500|1200|1100|2500|0|1100|2500|0|1400|1500|2000|0|0|0|0|0"
					styles  ="width:100%; height:100%"                                                     
					acceptNullDate="T"							
					sorting ="F"
					oncelldblclick="OnAddNew()"
					 />				
				</td>
			</tr>
		</table>
	</td>
</tr>
<tr style="height:4%">
	<td colspan="9"> 
		<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%">
			<tr>
				<td align="right" style="width:85%"><gw:imgBtn id="idBtnNew" img="new" alt="Add New" style="display:none;" onclick="OnAddNew()" /></td>
				<td align="right" style="width:5%"><gw:imgBtn id="idBtnSave" img="save" alt="Save" onclick="OnSave()" /></td>
				<td align="right" style="width:5%"><gw:imgBtn id="idBtnDelete" img="delete" alt="Delete" onclick="OnDelete()" /></td>
				<td align="right" style="width:5%"><gw:imgBtn id="idBtnSelect" img="select" alt="Select" onclick="OnSelect()" /></td>
			</tr>
		</table>
	</td>	
</tr>
<tr style="height:40%">
	<td colspan="10">
		<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%">
			<tr>
				<td>
					<gw:grid
					id="grdDtl2"
					header  ="_PK|No|Check|T/I Date|Vendor CD|Vendor NM|_Vendor_PK|Mat CD|Mat NM|_MatPK|Qty|Unit Price|Amount|_loc|_dept_gu|_idate|_iseqno|_iserial"
					format  ="0|0|3|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					aligns  ="0|1|1|1|0|0|0|0|0|0|3|3|3|0|0|0|0|0"
					defaults="|||||||||||||||||"
					editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					widths  ="0|800|500|1200|1100|2500|0|1100|2500|0|1400|1500|2000|0|0|0|0|0"
					styles  ="width:100%; height:100%"                                                     
					acceptNullDate="T"
					sorting ="F" />				
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
<gw:textbox id="txtcompk"           style="display:none" />
<gw:textbox id="txtPartnerPK"           style="display:none" />
<gw:textbox id="txtProductPK"           style="display:none" />
<!---------------------------------------------------------------------------------------------------->
</body>
</html>