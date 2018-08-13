<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script type="text/javascript" language="javascript">
//--------------------------------------------------------
function BodyInit()
{                        
    BindingDataList();    
}
//--------------------------------------------------------
function BindingDataList()
{
    var ls_comp         = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    lstCompany.SetDataText(ls_comp);      
	var l_data = dtContractTo.value ;
	l_data = l_data.substring(0, 6) + "01";
	dtContractFr.value = l_data;
}
//--------------------------------------------------------
function OnSearch()
{	
    dso_contract_entry.Call("SELECT");
}
//--------------------------------------------------------
function OnDataReceive(iObj)
{
    if(iObj.id =="dso_contract_entry")
    {        
    }    
}
//-------------------------------------------------------------------------------
//--Detail
function OnSelectAll()
{
	if(txt_PK.text != "")
	{
		var ctrl = grdDetail.GetGridControl();
		for(i=1; i<ctrl.rows;i++)
		{
			grdDetail.SetGridData(i, 0, "-1");
		}
	}
}
//-------------------------------------------------------------------------------
function OnClickOK()
{	
	var code_data = new Array();	
	var ctrl = grdMaster.GetGridControl();	
	code_data[0] = grdMaster.GetGridData(ctrl.row, 0); 
	code_data[1] = grdMaster.GetGridData(ctrl.row, 1); 		
	code_data[2] = grdMaster.GetGridData(ctrl.row, 13);// customer_pk
	code_data[3] = grdMaster.GetGridData(ctrl.row, 3);// customer_code
	code_data[4] = grdMaster.GetGridData(ctrl.row, 4);// customer_name
	code_data[5] = grdMaster.GetGridData(ctrl.row, 14);// cust to pk
	code_data[6] = grdMaster.GetGridData(ctrl.row, 15);// cust to id
	code_data[7] = grdMaster.GetGridData(ctrl.row, 16);// cust to name
	code_data[8] = grdMaster.GetGridData(ctrl.row, 17);// tac_abplcenter_pk
	code_data[9] = grdMaster.GetGridData(ctrl.row, 5);// tac_plcd
	code_data[10] = grdMaster.GetGridData(ctrl.row, 6);// tac_plnm
	window.returnValue = code_data;
	this.close();
}
//-------------------------------------------------------------------------------
function OnClose()
{
	this.close();
}
//-------------------------------------------------------------------------------
function OnPopUp()
{
	var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx';
	var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
	if ( object != null )
	{
		txtCustPK.text 		= object[0];
		txtCustCode.text 	= object[1];
		txtCustName.text 	= object[2];
	}	
}
//-------------------------------------------------------------------------------
</script>

<body style="margin: 0; padding: 0;">
<!------------------------------------------------------------------------------------------->
<gw:data id="dso_contract_entry" onreceive="OnDataReceive(this)">
	<xml>
		<dso type="grid" function="ac_sel_60110010_contract">
			<input bind="grdMaster">
			<input bind="lstCompany" />
			<input bind="txtCustPK" />
			<input bind="txtContractNo" />
			<input bind="lstBizType" />
			<input bind="txtChargerNM" />
			<input bind="dtContractFr" />	
			<input bind="dtContractTo" />
			</input>
			<output bind="grdMaster"/>
		</dso>	
	</xml>
</gw:data>	
<!------------------------------------------------------------------------------------------->
	<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%;">
		<tr>
			<td width="20%"></td>
			<td width="20%"></td>
			<td width="20%"></td>
			<td width="15%"></td>
			<td width="5%" ></td>
			<td width="20%"></td>
		</tr>
		<tr style="height:5%;">
			<td align="right">Company&nbsp;</td>
			<td align="left"><gw:list id="lstCompany" styles="width:100%;" /></td>
			<td align="right"><a title="Click here to select customer" onclick="OnPopUp()" href="#tips">Customer&nbsp;</td>
			<td align="left"><gw:textbox id="txtCustCode" styles="width:100%;" /></td>
			<td colspan="2" align="left"><gw:textbox id="txtCustName" styles="width:100%;" /></td>
		</tr>
		<tr style="height:5%;" >
			<td align="right">Contract No&nbsp;</td>
			<td align="left" ><gw:textbox id="txtContractNo" styles="width:100%;" /></td>
			<td align="right">Biz Type&nbsp;</td>
			<td align="left" ><gw:list id="lstBizType" styles="width:100%;" >
				<data>DATA|C|Construction|S|Service||Select All</data>
				</gw:list>
			</td>
			<td align="left" colspan="2" ><gw:textbox id="txtProjectNM" styles="width:100%;" /></td>			
		</tr>
		<tr style="height:5%;" >
			<td align="right">Charger&nbsp;</td>
			<td align="left"><gw:textbox id="txtChargerNM" styles="width:100%;" /></td>
			<td align="right">Contract Date&nbsp;</td>
			<td align="left"><gw:datebox id="dtContractFr" lang="1" /></td>
			<td align="center">~</td>
			<td align="left"><gw:datebox id="dtContractTo" lang="1" /></td>
		</tr>
		<tr>
			<td colspan="6">
				<table width="100%" cellpadding="0" cellspacing="0" border="0" style="height:100%;">
					<tr>
						<td width="95%" align="right"><gw:imgBtn id="btnSearch" img="search" onclick="OnSearch()"/></td>
						<td width="5%"><gw:icon id="btnClose" img="in" text="Close" onclick="OnClose()" /></td>
					</tr>
				</table>
			</td>
		</tr>
		<tr style="height:82%;">
			<td colspan="6">
				<gw:grid id="grdMaster" 
				    header="_tac_crcontract_pk|Contract No|Contract Date|CustomerID|CustomerNM|ProjectID|ProjectNM|Biz Type|Status|Trans Amt|Book Amt|Description|Local Desc|_tco_buspartner_pk|_tco_buspartner_to|Cust T/O ID|Cust T/O Name|_tac_abplcenter_pk"
					format	="0|0|4|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
					aligns	="0|2|1|1|0|0|0|1|3|3|3|0|0|0|0|0|0|0"
					defaults="|||||||||||||||||"
					editcol	="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
					widths	="0|1400|1500|1500|1400|2000|1400|1400|1500|1500|1500|1500|1500|0|0|1200|150|0"
					styles="width:100%; height:100%" 
					sorting="T" 
					oncelldblclick="OnClickOK()"		
				/>	
			</td>
		</tr>
	</table>
	<gw:textbox id="txtCustPK" style="display: none" />
	<gw:textbox id="txtProjectPK" style="display: none" />
<!------------------------------------------------------------------------------------------->
</body>
</html>
