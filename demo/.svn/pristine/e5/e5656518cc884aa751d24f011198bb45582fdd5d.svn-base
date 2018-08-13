<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Actual Result Of Advanced Money</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
	var data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACAB0110') FROM DUAL" )%>";    
    lstccy.SetDataText(data); 
	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0027') FROM DUAL")%>"; 
	lstDescription.SetDataText(data);
	lstDescription.value=3;
	lstDescription.SetEnable(false);
	//OnSearch();
}
function OnSearch()
{
	if(txtProjectPK.text !="")
	{
		dso_kpde00010_expenditure.Call("SELECT");
	}
	else
	{
		alert("Please,choose project to search.");
	}
}
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'project':
		    var path = System.RootURL + "/form/61/05/61050020_popup.aspx?Project_Pk=" + txtProjectPK.text;
		    var object = System.OpenModal( path ,750 , 500 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
			    txtProjectPK.text = object[0];
                txtProjectCode.text = object[1];
                txtProjectName.text = object[2]; 
			    OnSearch();
		    }
	    break;
		
		case 'AdvanceRegist': 
		if(txtProjectPK.text !="")
		{
			if(gridMST.rows-1 > 0 && gridMST.row !='-1')
				{ 
					var path = System.RootURL + "/form/61/06/61060020_adv_regist_popup.aspx?Project_Pk=" + txtProjectPK.text+"&master_pk="+gridMST.GetGridData(gridMST.row, 0)+"&currency="+gridMST.GetGridData(gridMST.row, 4);
					var object = System.OpenModal( path ,750 , 500 , 'resizable:yes;status:yes');
				}
				else
				{
					alert("Please,select item to advance register.");
				}
		}
		else
			{
				alert("Please select project to advance register.");
			}
		break;

		case 'Inquiry':

		break;
    }
    
}
function OnReset(pos)
{
    switch(pos)
    {
        case '1':
				txtProjectPK.text = "";
                txtProjectCode.text = "";
                txtProjectName.text = ""; 
	    break;
		
    }
	
}
function OnChangeCurrency()
{
    dso_get_rate.Call();
}
</script>
<body>
<gw:data id="dso_kpde00010_expenditure" onreceive=""> 
	<xml> 
		<dso type="grid" parameter="" function="pm_sel_62060020">
			<input bind="gridMST">
				<input bind="txtProjectPK" />
				<input bind="lstDescription" />
				<input bind="dtFrom" />
				<input bind="dtTo" />
				<input bind="lstccy" />
			</input> 
			<output bind="gridMST" /> 
		</dso> 
	</xml> 
</gw:data>
<table style="background: #BDE9FF; height: 100%; width: 100%">			
	<tr style="height:4%">	
		<td>
			<table style="width:100%" cellpadding="0" cellspacing="0" border="0">
				<tr>					
					<td >
						<table style="width:100%" cellpadding="0" cellspacing="0" border="0">
							<tr>
								<td>
									<table style="width:100%" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td align="center" style="width: 10%"><a title="Click here to select Project" onclick="OnPopUp('project')" href="#tips"  style="text-decoration: none; color=#0000ff"><b>Project</b></a> </td>
											<td style="width: 15%"><gw:textbox id="txtProjectCode" styles='width:100%' /></td>
											<td style="width: 25%"><gw:textbox id="txtProjectName" styles='width:100%' /></td>
											<td style="width: 4%"><gw:imgBtn id="bt_ResetUpper"      img="reset"     alt="Reset" onclick="OnReset('1')" /></td>
											<td style="width: 40%"></td>
											<td style="width: 3%"><gw:icon id="idBtnInquiry" img="in" text="Inquiry" styles='width:100%' onclick="OnSearch()" /></td>
											<td style="width: 3%"><gw:icon id="idBtnRegister" img="in" text="ADV Reg" styles='width:100%' onclick="OnPopUp('AdvanceRegist')" /></td> 
										</tr>	
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table style="width:100%" cellpadding="0" cellspacing="0" border="0">
										<tr>
												<td align="center" style="width: 10%">Srch Descrip.</td>
												<td style="width: 20%"><gw:list id="lstDescription" styles="width:100%" onchange="OnSearch()"></gw:list ></td>
												<td align="right" style="width: 6%" >Currency</td>
												<td style="width: 14%"><gw:list id="lstccy"  maxlen = "100" text="" styles='width:100%' onchange="OnSearch()" csstype="mandatory"/> </td>
												<td style="width: 5%"></td>
												<td style="width: 10%" nowrap>Execution Mth/Yr</td>
												<td style="width: 35%" colspan="2">
													<gw:datebox id="dtFrom" type="month" lang="1" onchange="OnSearch()" /> ~ 
													<gw:datebox id="dtTo" type="month" lang="1" onchange="OnSearch()" />
												</td>
										</tr>	
									</table>
								</td>
							</tr>	
						</table>
					</td>
				</tr>	
			</table>
			
		</td> 
	</tr>
	<tr style="height:96%">
		<td style="background: white; width: 100%;height:100%" >
			<gw:grid id='gridMST' 
				header='_PK|Issue Date|Descrip.|Budget Item|Currency|Supplied Amount|VAT|Withholding Tax|Total|Description|Draffer|Appr.'
				format='0|4|0|0|0|-0|-0|-0|-0|0|0|0' 
				aligns='0|0|1|0|0|0|0|0|0|0|0|0'
				defaults='|||||||||||' 
				editcol='0|0|0|0|0|0|0|0|0|0|0|0' 
				widths='2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|0'
				autosize="T"
				sorting='T' styles='width:100%; height:100%' oncellclick='OnGridCellClick(this)'
				oncelldblclick='OnGridCellDblClick(this)'  />
		</td>					
	</tr>						   
</table>
	<gw:textbox id="txtProjectPK" styles='width:100%;display:none' />
	<gw:textbox id="txtBudgetitemPK" styles='width:100%;display:none' />
	<gw:textbox id="txtVendorPK" styles='width:100%;display:none' />
</body>
</html>
