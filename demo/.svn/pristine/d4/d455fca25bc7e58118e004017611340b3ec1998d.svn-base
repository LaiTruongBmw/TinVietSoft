<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml" >
<head >
    <title>Actual Result Of Corporation Card</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
function BodyInit()
{
	var data = "<%=ESysLib.SetListDataFUNC("SELECT f_logistic_code('LGCM0100') FROM DUAL" )%>";    
//     lstccy.SetDataText(data); 
	data = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0027') FROM DUAL")%>"; 
	lstDescription.SetDataText(data);
}
function OnSearch()
{
	if(txtProjectPK.text !="")
	{
		dso_kpde00040.Call("SELECT");
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
		    /*var path = System.RootURL + '/form/kp/de/kpde00030_popup_InquiryPayment.aspx';
		    var object = System.OpenModal( path ,750 , 500 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
			    txtProjectPK.text = object[0];
                txtProjectCode.text = object[1];
                txtProjectName.text = object[2]; 
			    OnSearch();
		    }*/
	    break;
    }    
}
</script>
<body>
<gw:data id="dso_kpde00040" onreceive=""> 
	<xml> 
		<dso type="grid" parameter="" function="pm_sel_62060040">
			<input bind="gridMST">
				<input bind="txtProjectPK" />
				<input bind="lstDescription" />
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
											<td style="width: 10%"></td>
											<td style="width: 10%"><gw:icon id="idBtnInquiry" img="in" text="Inquiry" styles='width:100%' 	onclick="OnSearch()" /></td>											
										</tr>	
									</table>
								</td>
							</tr>
							<tr>
								<td>
									<table style="width:100%" cellpadding="0" cellspacing="0" border="0">
										<tr>
											<td style="width: 10%">Srch Descrip.</td>
											<td style="width: 30%"><gw:list id="lstDescription" styles="width:100%" onchange="OnSearch()"></gw:list ></td>
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
				header='_PK|Issue Date|Issue No.|Partner ID|Partner Name|Budget Item|Sum-up|Currency|Supplied Amount|VAT|Withholding Tax|Total'
				format='0|0|0|0|0|0|0|-0|-0|-0|-0' 
				aligns='0|0|0|0|0|0|0|0|0|0|0'
				defaults='||||||||||' 
				editcol='0|0|0|0|0|0|0|0|0|0|0' 
				widths='2000|1200|1300|1800|1400|1400|1500|1500|1000|2000|2000'
				autosize="T"
				sorting='T' styles='width:100%; height:100%' oncellclick='OnGridCellClick(this)'
				oncelldblclick='OnGridCellDblClick(this)'  />
		</td>
	</tr>			   
</table>
	
<gw:textbox id="txtProjectPK" styles='width:100%;display:none' />
</body>
</html>
