<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Payable List Check</title>
</head>
<script>
    var  user_pk = "<%=Session("EMPLOYEE_PK")%>"  ;
    var  user_name = "<%=Session("USER_NAME")%>"  ;
    var g_tco_company_pk = "<%=Session("COMPANY_PK")%>"  ; 
    var g_user_pk = "<%=Session("USER_PK")%>"  ;
    
//------------------------------------------------------------------------
function BodyInit()
{
    System.Translate(document);
    BindingDataList();
}
//------------------------------------------------------------------------
function BindingDataList()
{
    var ls_data     = "<%=CtlLib.SetListDataSQL("SELECT to_char(PK), PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    idCOM.SetDataText(ls_data);
    idCOM.value = g_tco_company_pk ;
    txtUser_PK.SetDataText(g_user_pk);
    dso_getCompany.Call();
	OnFormatGrid();
}
//------------------------------------------------------------------------
function OnDataReceive(iObj)
{
	if(iObj.id == "gfep00070")
	{
		lblRecord.text = idGrid.rows - 1;		
		var l_tot_trans = 0, l_tot_book = 0, i;
		for( i = 1; i < idGrid.rows; i++)
		{
			l_tot_trans += Number(idGrid.GetGridData(i, 12));
			l_tot_book += Number(idGrid.GetGridData(i, 13));
		}
		idTR_FAMT.text = l_tot_trans.toFixed(3);
		idTR_AMT.text = l_tot_book.toFixed(3);		
	}	
}
//------------------------------------------------------------------------
function OnPopUp(iCase)
{
	
	switch(iCase)
	{
		case '1': //Customer
			var path    = System.RootURL + '/standard/forms/60/09/60090010_vendor_popup.aspx?com_pk=' + idCOM.GetData();
			var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');		
			if ( object != null )
			{
				if (object[0] != 0)
				{
					idCUST_PK.text = object[0];
					idCUST_NM.text = object[2];
					idCUST_ID.text = object[1];
				}
			}		
		break;
		case '2': //PL
			var fpath   = System.RootURL + "/standard/forms/60/09/60090010_CtrItem2.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + idCOM.GetData() + '&dsqlid=ac_sel_60090010_popup_item&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
			var object  = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
			if ( object != null )  
			{
				if (object[0] != 0)
				{
					idPL_PK.text = object[2];
					idPL_ID.text = object[0];
					idPL_NM.text = object[1];
				}
			}		
		break ;
	}	
}
//------------------------------------------------------------------------
function OnSearch()
{
	if(idSTATUS.value == "Y")
	{	
		idGrid.SetColEdit(8, false);
		idGrid.SetColEdit(9, false);
		idGrid.SetColEdit(19, false);
		idBtnUpdate.SetEnable(false);
	}
	else
	{
		idGrid.SetColEdit(8, true);
		idGrid.SetColEdit(9, true);
		idGrid.SetColEdit(19, true);	
		idBtnUpdate.SetEnable(true);
	}
	gfep00070.Call("SELECT");
}
//------------------------------------------------------------------------
function OnResetPL()
{
	idPL_PK.text = "";
	idPL_ID.text = "";
	idPL_NM.text = "";
}
//------------------------------------------------------------------------
function OnResetCust()
{
	idCUST_PK.text = "";
	idCUST_ID.text = "";
	idCUST_NM.text = "";
}
//------------------------------------------------------------------------
function OnFormatGrid()
{
	var fg = idGrid.GetGridControl();
	fg.ColFormat(12) = "###,###,###,###.##";
	fg.ColFormat(13) = "###,###,###,###.##";
}
//------------------------------------------------------------------------
function UpdateOnClick()
{
    var i, n;
    n = 0;
    for( i = 1; i < idGrid.rows ; i++)
    {
        if(idGrid.GetGridData(i, 0)== '-1')
        {
            n += 1;
        }
    }
    if(n > 0)
	    gfep00070.Call();
}
//------------------------------------------------------------------------
function OnPrint()
{
	var url = System.RootURL + "/standard/reports/gf/ep/gfep00070_paylist.aspx?l_compk=" + idCOM.value + "&l_seq=" + idSEQ.text + "&l_paydue_fr=" + idSDT.value + "&l_paydue_to=" + idEDT.value + "&l_datefr=" + idSDT.value;
	url = url + "&l_dateto=" + idEDT.value + "&l_tco_buspartner_pk=" + idCUST_PK.text + "&l_voucher_no=" + idVOUCHERNO.text + "&l_tac_abplcenter_pk=" + idPL_PK.text + "&l_type=AL&l_tab=" + idSTATUS.value + "&l_pay_date=&bal_opt=0";
	if (confirm("Are you sure you want to report ?" ))
	{
		System.OpenTargetPage(url, 'newform');
		return;
	}	
}
//------------------------------------------------------------------------
</script>
<body>
<!-------------------------------------------------------------------->
  <gw:data id="gfep00070" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso id="1" type="grid" parameter="1,12,13,16,17,19,20" function="ac_sel_60100060" procedure="ac_upd_60100060" > 
                <input bind="idGrid" >                 
                    <input bind="idCOM" />
                    <input bind="idSDT" />
                    <input bind="idEDT" />                    
					<input bind="idCUST_PK" />	
					<input bind="idPL_PK" />
					<input bind="idVOUCHERNO" />
					<input bind="idSEQ" />					
					<input bind="idSTATUS" />
                </input>
                <output  bind="idGrid" />
            </dso> 
        </xml> 
    </gw:data>       
	<!--dso_paid-->
<!---------------------------------------ac_sel_60100060_1----------------------------->	
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_company" > 
                <input> 
                     <input bind="txtUser_PK"/>
                </input>
                <output>
                     <output bind="idCOM"/>
               </output> 
            </dso> 
        </xml> 
</gw:data>
<!-------------------------------------------------------------------->	
<table class="table" width="100%" cellpadding="0" cellspacing="0" border="1">
	<tr>
		
		<td width="100%">
					<!-- Table2 contain detail buttons and text box -->
					<table id="RightBottomTB" width="100%" cellpadding="0" cellspacing="0" height="100%"  align="top"  >
						
							<tr>
								<td width="10%" bgcolor="" align="right"><font color="black" ><b>Company&nbsp;</b></font></td>
								<td width="40%">
										<table  width="100%">
											<tr>
												<td width="40%">
													<gw:list id="idCOM" onChange="" styles='width:100%'> 
													</gw:list >
												</td>
												<td width="25%" bgcolor="" align="center"><font color="black" ><b>Status&nbsp;</b></font></td>
												<td width="35%">
													<gw:radio id="idSTATUS" value="" onchange="OnSearch()"> 
														<span value="N" >Unconfirm&nbsp;</span>
														<span value="Y" >Confirmed &nbsp;</span>
													</gw:radio >	
											</tr>
										</table>
								</td>
								<td width="10%" bgcolor="" align="right"><font color="black" ><a title="Click to select Customer" href="#tips" onclick="OnPopUp('1')" ><b>Customer&nbsp;</b></a></font></td>
								<td width="40%" >
									<table  width="100%">
										<tr>
											<td width="90%">
											<gw:textbox id="idCUST_PK" text=""  styles="display:none"/>									
											<gw:textbox id="idCUST_ID" styles='width:25%'/>
											<gw:textbox id="idCUST_NM" styles='width:74%'/>
											</td>
											<td width="5%" align="left"><gw:imgBtn id="ibtnResetClient" img="reset"  alt="reset Customer" onclick="OnResetCust()" /></td>
											<td width="5%" align="left"></td>											
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td width="10%" bgcolor="" align="right"><font color="black" ><b>Seq&nbsp;</b></font></td>
								<td width="40%">
										<table  width="100%">
											<tr>
												<td width="40%">
													<gw:textbox id="idSEQ" styles='width:40%' onenterkey="OnSearch()" />
												</td>
												<td width="25%" bgcolor="" align="center"><font color="black" ><b>&nbsp;</b></font></td>
												<td width="35%">
													
											</tr>
										</table>
								</td>
								<td width="10%" bgcolor="" align="right"><font color="black" ><a title="Click to select Project" href="#tips" onclick="OnPopUp('2')"><b>Project&nbsp;</b></a></font></td>
								<td width="40%" >
									<table  width="100%">
										<tr>
											<td width="90%">
											<gw:textbox id="idPL_PK" text=""  styles="display:none"/>									
											<gw:textbox id="idPL_ID" styles='width:25%'/>
											<gw:textbox id="idPL_NM" styles='width:74%'/>
											</td>
											<td width="5%" align="left"><gw:imgBtn id="ibtnResetClient" img="reset"  alt="reset Project" onclick="OnResetPL()" /></td>
											<td width="5%" align="left"></td>											
										</tr>
									</table>
								</td>
							</tr>
							<tr>
								<td width="10%" bgcolor="" align="right"><font color="black" ><b>Payment Date&nbsp;</b></font></td>
								<td width="40%">
										<table  width="100%">
											<tr>
												<td width="40%"><gw:datebox id="idSDT" 	onchange="" styles='width:85%'  lang="<%=Session("Lang")%>"/></td>
												<td width="25%" align="center"><font color="black" ><b>~&nbsp;</b></font></td>
												<td width="35%"><gw:datebox id="idEDT" 	onchange=""styles='width:85%'  lang="<%=Session("Lang")%>"/></td>
											</tr>
										</table>
								</td>
								
								
								<td width="10%" bgcolor="" align="right"><font color="black" ><b>Voucher No&nbsp;</b></font></td>
								<td width="40%" >
									<table  width="100%">
										<tr>
											<td width="50%"><gw:textbox id="idVOUCHERNO" styles='width:60%' onenterkey="OnSearch()"/></td>
											<td width="15%"align="right"><b><gw:label id="lblRecord" text="" style="width:80%" /></b></td>
											<td width="5%">&nbsp;<b>Records</b></td>
											<td width="10%"></td>
											<td width="5%" align="right"><gw:imgBtn id="idSearch"   	img="search" 	alt="search" 		text="Search" 		onclick="OnSearch()"/></td>																						
											<td width="5%" align="right"><gw:imgBtn img="save"    		alt="save"    	id="idBtnUpdate" 	styles='width:100%' onclick="UpdateOnClick()" /></td>
											<td width="5%">				 <gw:imgBtn id="ibtnPrint" 		img="printer" 	alt="Payable List" 						onclick="OnPrint()" /></td>			
											
										</tr>
									</table>
								</td>
							</tr>			
						
					</table>
					<!-- End of Table2 -->					
		</td>
	</tr>
	<tr>		
		<td width="100%">
			<!-- Table2 contain detail grid -->
			<gw:grid   
				id="idGrid"  
				header="|_PPK|Seq|Voucher No|Trans Date|Approved Date|Date Seq|PL Name|Description|Local Desc|_CUST_ID|Customer|Trans Amt|Book Amt|Invoice Date|Invoice No|Due DateYYYYMMDD|Remark|Contract no|Plan YYYYMMDD|Payment YN"   
				format="3|0|0|0|4|4|0|0|0|0|0|0|0|0|4|0|0|0|0|0|3"  
				aligns="0|0|0|0|1|1|0|0|0|0|0|0|3|3|1|1|1|0|0|1|1"  
				defaults="||||||||||||||||||||"  
				editcol="0|0|0|0|0|0|0|0|0|0|0|0|1|1|0|0|1|1|0|1|1"  
				widths="500|0|1000|1500|1200|1400|1200|1500|1500|1500|0|1500|1500|1500|1400|1400|1800|1500|1500|1500|800"  
				styles="width:100%; height:360"   
				sorting="T"   
				acceptNullDate='T'	
				param="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20" /> 
			<!-- End of Table2 -->		
		</td>
	</tr>	
	<tr>
		<td width="100%">
			<table width="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#81d7f3" style="border-collapse: collapse">
				<tr>
					<td width="70%" bgcolor="bde9ff"  colspan="4" align="center"><font color="black" ><b>Total</b></font></td>
					<td width="15%" ><gw:textbox id="idTR_FAMT" styles="width:100%;text-align: Right" type="number" format="###,###,###,###.##R"/></td>
					<td width="15%" ><gw:textbox id="idTR_AMT" styles="width:100%;text-align: Right" type="number" format="###,###,###,###.##R"/> </td>				
				</tr>
			</table>
		</td>
	</tr>
</table>
</body>
<gw:textbox id="txtUser_PK" style="display:none;" />
</html>