<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Non - Payment Repay</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
	var data = "<%=ESysLib.SetListDataFUNC("SELECT f_logistic_code('LGCM0100') FROM DUAL" )%>";    
//     lstccy.SetDataText(data); 
	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0027') FROM DUAL")%>"; 
	lstSrchDescrip.SetDataText(data);
	lstSrchDescrip.value=2;
	lstSrchDescrip.SetEnable(false);
}
function OnPopUp(pos)
{
    switch(pos)
    {
         case 'project':
		    var path = System.RootURL + '/form/61/05/61050020_popup.aspx';
		    var object = System.OpenModal( path ,750 , 500 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
			    txtProjectPK.text = object[0];
                txtProjectCode.text = object[1];
                txtProjectName.text = object[2]; 
			    OnSearch();
		    }
	    break;
		case 'inquiryPayment':
			if(txtProjectPK.text !="")  
			{
				if(gridMST.rows-1 > 0 && gridMST.row !='-1')
				{ 
					var path = System.RootURL + "/form/61/06/61060030_popup_InquiryPayment.aspx?Project_Pk="+txtProjectPK.text+"&p_master_pk="+gridMST.GetGridData(gridMST.row, 0)+"&currency="+gridMST.GetGridData(gridMST.row, 7);
					var object = System.OpenModal( path ,750 , 500 , 'resizable:yes;status:yes');
					OnSearch();
				}
				else
				{
					alert("Please,select item to inquiry payment.");
				}
			}
			else
			{
				alert("Please,select project to inquiry payment.");
			}
	    break;
    }    
}
function OnSearch()
{
	if(txtProjectPK.text !="")
	{
		dso_kpde00030.Call("SELECT");
	}
	else
	{
		alert("Please,choose project to search.")
	}
}
</script>
<body>
<gw:data id="dso_kpde00030" onreceive=""> 
	<xml> 
		<dso type="grid"  function="pm_sel_62060030">
			<input bind="gridMST">
				<input bind="txtProjectPK" />
				<input bind="lstSrchDescrip" />
				<input bind="dtFrom" />
				<input bind="dtTo" />
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
											<td style="width: 10%"><a title="Click here to select Project" onclick="OnPopUp('project')" href="#tips"  style="text-decoration: none; color=#0000ff"><b>Project</b></a></td>
											<td style="width: 10%"><gw:textbox id="txtProjectCode" styles='width:100%' /></td>
											<td style="width: 20%"><gw:textbox id="txtProjectName" styles='width:100%' /></td>
											<td style="width: 3%"><gw:imgBtn id="bt_ResetUpper"      img="reset"     alt="Reset" onclick="OnReset('1')" /></td>
											<td style="width: 37%"></td>
											<td style="width: 10%"><gw:icon id="idBtnInquiry" img="in" text="Inquiry" styles='width:100%' 	onclick="OnSearch()" /></td>
											<td style="width: 10%"><a title="Click here to select Inquiry Payment" onclick="OnPopUp('inquiryPayment')" href="#kpde_popup_InquiryPayment"  style="text-decoration: none; color=#0000ff"><b>Inquiry Payment</b></a></td>											
										</tr>	
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table style="width:100%" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td style="width: 10%">Srch Descrip.</td>
											<td style="width: 30%"><gw:list id="lstSrchDescrip" styles="width:100%" onchange="OnSearch()"></gw:list ></td>
											<td align="right" style="width: 10%">Execution Mth/Yr</td>
											<td style="width: 50%" colspan="2">
												<gw:datebox id="dtFrom" type="month" lang="1" onchange="OnSearch()" /> ~ <gw:datebox id="dtTo" type="month" lang="1" onchange="OnSearch()" />
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
		<td style="background: white; width: 60%;height:100%" id="left" >
			<gw:grid id='gridMST' 
				header='_PK|Issue Date|Issue No.|Partner ID|Partner Name|Budget Item|Description|Currency|Supplied Amount|VAT|Withholding Tax|Total|Repay AMT|Remain. AMT'
				format='0|4|0|0|0|0|0|0|-0|-0|-0|-0|-0|-0' 
				aligns='0|0|1|0|0|0|0|0|0|0|0|0|0|0'
				defaults='|||||||||||||' 
				editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0' 
				widths='2000|1200|1300|1800|1400|1400|1500|1500|1000|2000|2000|2000|2000|2000'
				autosize="T"
				sorting='T' styles='width:100%; height:100%'  />
		</td>					
	</tr>			   
</table>
	
	<gw:textbox id="txtProjectPK" styles='width:100%;display:none' />
</body>
</html>
