<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Contract Change Registration</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>

var flag;
function BodyInit()
{
		System.Translate(document);  	
		BindingDataList();
}

function BindingDataList()
{
			//ccy
			<%=ESysLib.SetGridColumnComboFormat("Grid_Owner",7,"SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK =b.pk and b.id='ACAB0110' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 order by a.DEF_YN desc , ord")%>;	
			//vat_yn
			<%=ESysLib.SetGridColumnComboFormat("Grid_Owner",10,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0029' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
			//VAT Rate
			<%=ESysLib.SetGridColumnComboFormat("Grid_Owner",12,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0017' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
			//
			<%=ESysLib.SetGridColumnComboFormat("Grid_ContAmt",3,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0029' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
			 //Grid_Detail.SetComboFormat(2, '#N;No|#Y;Yes');
			 //<%=ESysLib.SetGridColumnComboFormat("Grid_Detail",4,"SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK =b.pk and b.id='ACAB0110' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 order by a.DEF_YN desc , ord")%>;	
			 dtFrom.SetEnable(false);
			 dtTo.SetEnable(false);
			 ibtnNew.SetEnable(false);
			ibtnSave.SetEnable(false); 
			ibtDelete.SetEnable(false); 
			lblPM.style.color = '#333';
			lblDay.text = 'Day';
}
//====================================================================================================================
function OnSearch()
{
		if(txtProject_Pk.text != '')
		{
			dso_search.Call('SELECT');
		}
		else
		{
				alert('Please select project to search !!');	
		}
}
//====================================================================================================================
function OnPopUp(obj)
{
        switch(obj)
        {
			case 'Project':
                            var fpath = System.RootURL + "/form/61/01/61010060_project_search.aspx";
                            var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            if(aValue != null)
                            {
                                    txtProject_Pk.text = aValue[0];
                                    txtProject_Cd.text = aValue[1];
                                    txtProject_Nm.text = aValue[2]; 
									//dso_search.Call('SELECT');
                            } 
                break;
				case 'Charger':
							if(event.col == 13)
							{
									var fpath = System.RootURL + "/form/61/01/61010060_popup_charger.aspx";
									var aValue = System.OpenModal( fpath , 900 ,600, 'resizable:yes;status:yes'); 
									if ((aValue != null)&&(aValue[0]!=""))
									{
										Grid_Owner.SetGridText(Grid_Owner.row, 15, aValue[0]);
										Grid_Owner.SetGridText(Grid_Owner.row, 13, aValue[1] + ' - '  +aValue[2]);
									}
							}
			break;
			case 'Partner':
							if (event.col == 5)
							{
										var path = System.RootURL + '/form/61/01/61010060_popup_partner.aspx';
										var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
										if ( obj != null )
										{
										   Grid_Owner.SetGridText(Grid_Owner.row,1,obj[0]);
										   Grid_Owner.SetGridText(Grid_Owner.row,5,obj[2]);
										   txtPartner_Pk.text = obj[0];
										   dso_license.Call();
										}
							}
			break;
			case 'PM':
							if(chkPM.value == 'Y')
							{
									var path = System.RootURL + '/form/ch/ae/chae00010_search_emp.aspx';
									var obj = System.OpenModal( path ,800 , 600 ,  'resizable:yes;status:yes');
									if ( obj != null )
									{
										txtPM2.text = obj[2];
									}
							}
			break;
		}
}
//====================================================================================================================
function OnNew()
{
			if(txtProject_Pk.text != '' && txtSerialNo_Pk.text != '')
			{
					 flag='new';
					Grid_Owner.AddRow();	
					Grid_Owner.SetGridText(Grid_Owner.rows -1, 2, txtProject_Pk.text);
					Grid_Owner.SetGridText(Grid_Owner.rows -1, 12, '10');
					Grid_Owner.SetGridText(Grid_Owner.rows -1, 6, '100');
			}
			else
			{
					alert('Please select Project !!' + '\n' + 'Please select Serial No. !!');	
			}
}
//====================================================================================================================
function OnIncrease()
{
			if(txtProject_Pk.text != '' && Grid_Detail.GetGridData(Grid_Detail.rows-1,2) != 'No')
			{
					Grid_Detail.AddRow();	
					Grid_Detail.SetGridText(Grid_Detail.rows -1, 0, Grid_Detail.GetGridData(Grid_Detail.rows -2, 0));
					Grid_Detail.SetGridText(Grid_Detail.rows -1, 1, 1 + Number(Grid_Detail.GetGridData(Grid_Detail.rows -2, 1)));
					Grid_Detail.SetGridText(Grid_Detail.rows -1, 2, 'No');
					Grid_Detail.SetGridText(Grid_Detail.rows -1, 3, Grid_Detail.GetGridData(Grid_Detail.rows -2, 3));
					Grid_Detail.SetGridText(Grid_Detail.rows -1, 4, Grid_Detail.GetGridData(Grid_Detail.rows -2, 4));
					Grid_Detail.SetGridText(Grid_Detail.rows -1, 5, Grid_Detail.GetGridData(Grid_Detail.rows -2, 5));
					Grid_Detail.SetGridText(Grid_Detail.rows -1, 6, Grid_Detail.GetGridData(Grid_Detail.rows -2, 6));
					Grid_Detail.SetGridText(Grid_Detail.rows -1, 7, Grid_Detail.GetGridData(Grid_Detail.rows -2, 7));
					Grid_Detail.SetGridText(Grid_Detail.rows -1, 8, Grid_Detail.GetGridData(Grid_Detail.rows -2, 8));
					Grid_Detail.SetGridText(Grid_Detail.rows -1, 9, Grid_Detail.GetGridData(Grid_Detail.rows -2, 9));

                    Grid_Detail.SetGridText(Grid_Detail.rows -1, 12, Grid_Detail.GetGridData(Grid_Detail.rows -2, 12));
                    Grid_Detail.SetGridText(Grid_Detail.rows -1, 13, Grid_Detail.GetGridData(Grid_Detail.rows -2, 13));
					Grid_Detail.SetGridText(Grid_Detail.rows -1, 11, txtProject_Pk.text);
                    dso_detail.Call();
			}
			else
			{
					alert('Please select Project !!' + '\n' + 'Please confirm data to Increase !!');	
			}
}
//====================================================================================================================
function OnVisible(obj)
{
			switch(obj)
			{
					case 'Per':
							if(chkPer.value == 'Y')
							{
									dtFrom.SetEnable(true);
			 						dtTo.SetEnable(true);	
							}
							else
							{
									dtFrom.SetEnable(false);
			 						dtTo.SetEnable(false);	
							}
					break;
					case 'PM':
							if(chkPM.value == 'Y')
							{
									lblPM.style.color = '';
							}
							else
							{
									lblPM.style.color = '#333';
							}
					break;
					case 'Cont':
							if(chkCont_Amt.value == 'Y')
							{
									ibtnNew.SetEnable(true);
			 						ibtnSave.SetEnable(true);	
									ibtDelete.SetEnable(true);	
							}
							else
							{
									ibtnNew.SetEnable(false);
			 						ibtnSave.SetEnable(false);	
									ibtDelete.SetEnable(false);	
							}
					break;
			}
}
//====================================================================================================================
function OnClick()
{
        if(Grid_Detail.GetGridData(Grid_Detail.row, 2) == 'Yes')
        {
            btnSave.SetEnable(false);
            btnConfirm.SetEnable(false);
			ibtDeleteM.SetEnable(false);
			chkPer.SetEnable(false);
			chkPM.SetEnable(false);
            chkCont_Amt.SetEnable(false);
        }
        else
        {
            btnSave.SetEnable(true);
            btnConfirm.SetEnable(true);
			ibtDeleteM.SetEnable(true);
			chkPer.SetEnable(true);
			chkPM.SetEnable(true);
            chkCont_Amt.SetEnable(true);
        }
		txtSerialNo_Pk.text = Grid_Detail.GetGridData(Grid_Detail.row, 0);
		dso_update.Call('SELECT');
}

function OnDelete(obj)
{
		switch(obj)
		{
				case 'top':
						if(txtSerialNo_Pk.text != '')
						{
								if(confirm('Are you sure you want to delete ?'))
								dso_update.StatusDelete();
								dso_update.Call();
								 flag='delete';
						}
						else
						{
								alert('Please select Serial No !!');	
						}
				break;
				case 'bottom':
						if(confirm('Are you sure you want to delete ?'))
						Grid_Owner.DeleteRow();
						dso_owner.Call();
				break;
		}
}
//====================================================================================================================
function OnSave()
{
						if(Grid_ContAmt.row < 1)
						{
						    Grid_Detail.SetGridText(Grid_Detail.rows -1, 7, '');
						}
						else
						{
						    Grid_Detail.SetGridText(Grid_Detail.rows -1, 7, Grid_ContAmt.GetGridData(Grid_ContAmt.rows -1, 1));
						}
						
						flag='update';  
						dso_detail.Call();
						
}
//====================================================================================================================
function OnEditOwner()
{
	var vat_amt=0;
	var vat_rate="";
    var ctr_amt =0;
    if (event.col == 10)
    {
		if(Grid_Owner.GetGridData(Grid_Owner.row,10)== "Y")
		{
			Grid_Owner.SetGridText(Grid_Owner.row, 12, "10");
			vat_rate = Grid_Owner.GetGridData(Grid_Owner.row, 12);
			ctr_amt  = Grid_Owner.GetGridData(Grid_Owner.row,9)
			vat_amt = Number(ctr_amt) * (Number(vat_rate)/100);
			Grid_Owner.SetGridText(Grid_Owner.row,11,vat_amt);
		}else{
			Grid_Owner.SetGridText(Grid_Owner.row, 12 ,"0");
			vat_amt = 0; 
			Grid_Owner.SetGridText(Grid_Owner.row, 11,vat_amt);
		}
    }
	if (event.col == 12)
    {
		if(Grid_Owner.GetGridData(Grid_Owner.row,10)== "Y")
		{
			vat_rate = Grid_Owner.GetGridData(Grid_Owner.row, 12);
			ctr_amt  = Grid_Owner.GetGridData(Grid_Owner.row, 9)
			vat_amt = Number(ctr_amt) * (Number(vat_rate)/100);
			Grid_Owner.SetGridText(Grid_Owner.row, 11,vat_amt);
		}else{
			vat_amt = 0; 
			Grid_Owner.SetGridText(Grid_Owner.row,11,vat_amt);
		}
     }

}
//====================================================================================================================
function OnDataReceive(obj)
{
		switch (obj.id)
		{
			case "dso_search":
					dso_detail.Call('SELECT');
			 break;
			 case 'dso_detail':
			 		if(flag != 'search')
					{
							dso_update.StatusUpdate();
							dso_update.Call();
					}
					else
					{
								dso_update.Call('SELECT');
					}
			 break;
			 case 'dso_update':
			 			OnVisible('Per');
						OnVisible('PM');
						OnVisible('Cont');
						
						 if(flag != 'search' )
						  {
								for(i = 1; i < Grid_Owner.rows; i++)
								{
									if(Grid_Owner.GetGridData(i, 18)=='')
									{
										Grid_Owner.SetGridText(i, 18, txtSerialNo_Pk.text);
										Grid_Owner.SetRowStatus(i, 0x20);
									}    
								}
			 					dso_owner.Call();
						  }
						   else
						   {
							   	dso_owner.Call('SELECT');
						   }
						   var IncrDate = Number(txtIncrDate.text);
						   if(IncrDate > 1 && IncrDate != '')
						   {
								lblDay.text = 'Days' ;
						   }
						   else
						   {
								lblDay.text = 'Day'; 
						   }
						   
			 break;
			 case 'dso_owner':
			 		dso_Cont_Amt.Call('SELECT');
			 break;
			
			 case 'dso_license':
					 Grid_Owner.SetGridText(Grid_Owner.row,4,txtLicense_No.text);
			 break;
		}
}

function OnConfirm()
{
	if(confirm("Are you sure to confirm ?"))
	 {
		Grid_Detail.SetGridText(Grid_Detail.row,10,'confirm');
	    dso_detail.Call();
     }
}

</script>
<body>
<gw:data id="dso_search" onreceive="OnDataReceive(this)">
  <xml>
    <dso type="control"  function="PM_SEL_61010060"  >
      <input>
          <inout bind="txtProject_Pk"/>
          <inout bind="txtProject2_Nm"/>
          <inout bind="txtMajorOwner_Nm"/>
          <inout bind="txtPM"/>
          <inout bind="txtPC"/>
          
          <inout bind="txtContractPeriod"/>
          <inout bind="txtCont_Amt"/>
          <inout bind="txtCont_Date"/>
      </input>
    </dso>
  </xml>
</gw:data>

 <gw:data id="dso_owner" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid"   parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18" function="PM_SEL_61010060_Owner" procedure="pm_upd_61010060"   > 
				<input bind="Grid_Owner">                    
					<input bind="txtProject_Pk" /> 
                    <input bind="txtSerialNo_Pk" /> 
				</input> 
				<output bind="Grid_Owner" /> 
			</dso> 
		</xml> 
	</gw:data>
    
 <gw:data id="dso_Cont_Amt" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid"   parameter="0" function="PM_SEL_61010060_Cont_Amt"    > 
				<input bind="Grid_ContAmt">                    
					<input bind="txtProject_Pk" /> 
                    <input bind="txtSerialNo_Pk" /> 
				</input> 
				<output bind="Grid_ContAmt" /> 
			</dso> 
		</xml> 
	</gw:data>    
    
<gw:data id="dso_update" onreceive="OnDataReceive(this)">
  <xml>
    <dso type="control"  parameter="0,1,2,3,4,5,6,7,8,9"  function="PM_SEL_61010060_1"  procedure="pm_upd_61010060_1"   >
      <input>
          <inout bind="txtSerialNo_Pk"/>
          <inout bind="chkPer"/>
          <inout bind="chkPM"/>
          <inout bind="chkCont_Amt"/>
          <inout bind="dtChange_Date"/>
          
          <inout bind="dtFrom"/>
          <inout bind="dtTo"/>
          <inout bind="txtIncrDate"/>
          <inout bind="txtPM2"/>
          <inout bind="txtDescription"/>
      </input>
    </dso>
  </xml>
</gw:data> 

<gw:data id="dso_detail" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid"  parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13"     function="PM_SEL_61010060_2"   procedure="pm_upd_61010060_2"   > 
				<input bind="Grid_Detail">                    
					<input bind="txtProject_Pk" /> 
				</input> 
				<output bind="Grid_Detail" /> 
			</dso> 
		</xml> 
	</gw:data>    
    
<gw:data id="dso_license" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="pm_pro_61010060_license_no"> 
                <input> 
                     <input bind="txtPartner_Pk"/>
                </input>
                <output>
                     <output bind="txtLicense_No"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>       
<table style="width:100%;height:" cellpadding="0" cellspacing="0" border="0">
		<tr height="">
        			<td>
                    			<fieldset style="padding:0">
                                		<table width="100%" cellpadding="0" cellspacing="0">
                                        			<tr>
                                                            <td align="right" width="10%"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">Project&nbsp;</a></td>
                                                            <td width="90%">
                                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td width="30%"><gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' /></td>
                                                                            <td width="40%"><gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' /></td>
                                                                            <td width=""><gw:textbox id="txtProject_Pk" readonly="true" styles='width:100%;display:none' /></td>
                                                                            <td><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
                                                                            <td width="30%"></td>
                                                                            <td><gw:imgbtn id="ibtnUpdte1" img="search" alt="Search" onclick="OnSearch()" /></td>
                                                                            <td><gw:imgbtn id="ibtnUpdte1" img="increase" alt="Serial No. Increase" onclick="OnIncrease()" /></td>
                                                                            <td><gw:imgbtn id="btnConfirm" img="confirm" alt="Confirm" onclick="OnConfirm()" /></td>
                                                                            <td ><gw:imgbtn id="btnSave" img="save" alt="Save" onclick="OnSave()" /></td>
                                                                            <td><gw:imgbtn id="ibtDeleteM" img="delete" alt="Delete" onclick="OnDelete('top')" /></td>
                                                                             <td><gw:imgbtn id="ibtUpdate4" img="excel" alt="Print" onclick="OnPrint()" /></td>
                                                                        </tr>
                                                                    </table>
                                                            </td>
                                                    </tr>
                                        </table>
                                </fieldset>	
                    </td>
        </tr>
        <tr height="" valign="top">
        		<td>
                		<table border="1" style="width:100%;height:" cellpadding="0" cellspacing="0" bordercolor="#00CCFF" style="border-collapse: collapse">
                        			<tr height="20">
                                    			<td width="15%" align="right" style="background:#C5EFF1">Project Name&nbsp;</td>
                                                <td width="85%" align="left" colspan="5">&nbsp;<gw:label id="txtProject2_Nm"  styles='width:100%' /></td>
                                    </tr>
                                    <tr height="20">
                                    			<td width="15%" align="right" style="background:#C5EFF1">Major Owner Name&nbsp;</td>
                                                <td width="25%" align="left"><gw:label id="txtMajorOwner_Nm"  styles='width:100%' /></td>
                                                <td width="10%" align="right" style="background:#C5EFF1" title="Project Manager">PM&nbsp;</td>
                                                <td width="20%" align="left"><gw:label id="txtPM"  styles='width:100%' /></td>
                                                <td width="10%" align="right" style="background:#C5EFF1" title="Project Controller">PC&nbsp;</td>
                                                <td width="20%" align="left"><gw:label id="txtPC"  styles='width:100%' /></td>
                                    </tr>
                                    <tr height="20">
                                    			<td width="15%" align="right" style="background:#C5EFF1"><a title="Contract Period"  style="color:#333" >Cont. Per.&nbsp;</a></td>
                                                <td width="25%" align="left"><gw:label id="txtContractPeriod"  styles='width:100%' /></td>
                                                <td width="10%" align="right" style="background:#C5EFF1" title="Contract Amount">Cont. Amt&nbsp;</td>
                                                <td width="20%" align="right"><gw:label id="txtCont_Amt"  styles='width:100%' /></td>
                                                <td width="10%" align="right" style="background:#C5EFF1" title="Contract Date">Cont. Date&nbsp;</td>
                                                <td width="20%" align="left"><gw:label id="txtCont_Date"  styles='width:100%' /></td>
                                    </tr>
                        </table>
                </td>
        </tr>
        <tr height="" valign="top">
        		<td >
                        <gw:grid id="Grid_Detail" 
                            header="_pk|S/No.|Confirm (Y/N)|Change Date|Currency|Cont. Start Date|Cont. Expiry Date|Change Cont. Amt|Cont. Incr./Decr. Amt|Cont. Incr./Decr. Days|Status|_project_pk|_exrate|_trans_amt"
                            format="0|0|0|0|0|0|0|1|1|0|0|0|0|0" 
                            aligns="1|1|0|0|0|0|0|0|0|0|0|0|0|0" 
                            defaults="|||||||||||||"
                            editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                            widths="0|800|1500|1500|1000|1500|1600|2000|2000|2000|0|0|0|0"
                            styles="width:100%; height:100" 
                            sorting="T" 
                            oncellclick="OnClick()"
                           />
            	</td>
        </tr>
        <tr height="" valign="top">
        		<td>
                		<table border="1" style="width:100%;height:" cellpadding="0" cellspacing="0" bordercolor="#00CCFF" style="border-collapse: collapse">
                        			<tr height="">
                                    			<td width="15%" align="right" style="background:#C5EFF1">Change Contents&nbsp;</td>
                                                <td width="45%" align="right" >
                                                		<table width="100%" cellpadding="0" cellspacing="0">
                                                        		<tr>
                                                                			<td width="4%"><gw:checkbox id="chkPer" defaultvalue="Y|N" value="N" styles="width:100%" onclick="OnVisible('Per')" /></td>
                                                                            <td align="left" width="30%">Period</td>
                                                                            <td width="4%"><gw:checkbox id="chkPM" defaultvalue="Y|N" value="N" styles="width:100%" onclick="OnVisible('PM')" /></td>
                                                                            <td align="left" width="30%" title="Project Manager">PM</td>
                                                                            <td width="4%"><gw:checkbox id="chkCont_Amt" defaultvalue="Y|N" value="N" styles="width:100%" onclick="OnVisible('Cont')" /></td>
                                                                            <td align="left" width="22%" title="Contract Amount">Cont. Amt</td>
                                                                </tr>
                                                        </table>
                                                </td>
                                                <td align="right" width="15%" style="background:#C5EFF1">Change Date&nbsp;</td>
                                                <td  width="25%"><gw:datebox id="dtChange_Date" lang="1" /></td>
                                    </tr>
                                    <tr>
                                    			<td align="right" width="15%" style="background:#C5EFF1" title="Contract Period">Cont. Per.&nbsp;</td>
                                                <td width="45%" align="right" >
                                                		<table width="100%" cellpadding="0" cellspacing="0">
                                                        		<tr>
                                                                			<td ><gw:datebox id="dtFrom" lang="1" /></td>
                                                                            <td >~</td>
                                                                            <td ><gw:datebox id="dtTo" lang="1" /></td>
                                                                            <td width="100%"></td>
                                                                </tr>
                                                        </table>
                                                </td>
                                                <td align="right" width="" style="background:#C5EFF1" title="Increase Date">Incr. Date&nbsp;</td>
                                                <td width="25%" align="left">
                                                            			<table cellpadding="1" cellspacing="1">
                                                                        		<tr>
                                                                                			<td width="100%"><gw:textbox id="txtIncrDate"  styles='width:100%;text-align:right' /></td>
                                                                                            <td> <gw:label  id="lblDay"  styles='width:100%;color:#333' /></td>
                                                                                </tr>
                                                                        </table>
                                                </td>
                                    </tr>
                                    <tr>
                                    			<td align="right" width="15%" style="background:#C5EFF1"><a  id="lblPM" title="Click here to select Project Manager" onClick="OnPopUp('PM')" href="#tips" style="text-decoration: none; color=#0000ff" title="Project Manager">PM</a>&nbsp;</td>
                                                <td width="85%"  colspan="3">
                                                		<table cellpadding="0" cellspacing="0">
                                                        		<tr>
                                                                			<td  width="100%"><gw:textbox id="txtPM2"  readonly="true" styles='width:100%' /></td>
                                                                            <td ><gw:imgbtn id="btnresetPM" img="reset" alt="reset" onclick="txtPM2.text ='';" /></td>
                                                                </tr>
                                                        </table>
                                                </td>
                                    </tr>
                                    <tr>
                                    			<td align="right" width="15%" style="background:#C5EFF1">Description&nbsp;</td>
                                                <td width="85%"  colspan="3"><gw:textarea id="txtDescription"  styles='width:100%;height:50' /></td>
                                    </tr>
                                    
                        </table>
                </td>
        </tr>
        <tr>
                                    			<td colspan="4">
                                                            <fieldset style="padding:0">
                                                                <legend style="font-weight:600">Owner</legend>
                                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                                    			<tr>
                                                                                			<td width="100%"></td>
                                                                                			<td><gw:imgbtn id="ibtnNew" img="new" alt="New" onclick="OnNew()" /></td>
                                                                                            <td style="display:none"><gw:imgbtn id="ibtnSave" img="save" alt="Save" onclick="OnSave('Owner')" /></td>
                                                                            				<td><gw:imgbtn id="ibtDelete" img="delete" alt="Delete" onclick="OnDelete('bottom')" /></td>
                                                                                            <td style="display:none"><gw:datebox id="dtProject" lang="1" styles="display:none" /></td>
                                                                                </tr>
                                                                                <tr>
                                                                                        <td  colspan="4">
                                                                                        <!--header="0._Pk|1._Partner_pk|2._Project_pk|3.Seq. No.|4.Bus. No.|5.Owner Name|6.Stake(%)|7.Currency|8.Ex. Rate|9.Cont. Amt|10.VAT (Y/N)|11.VAT|12.Retention Rate(%)|13.Per. in chrg.|14.Tel. No.|15._TAC_EMPLOYEE_ADV_PK|16.Project_date|17.book_amt"-->
                                                                                                <gw:grid id="Grid_Owner" 
                                                                                                    header="_Pk|_Partner_pk|_Project_pk|Seq. No.|Bus. No.|Owner Name|Stake(%)|Currency|Ex. Rate|Cont. Amt|VAT (Y/N)|VAT|Retention Rate(%)|Per. in chrg.|Tel. No.|_TAC_EMPLOYEE_ADV_PK|_Project_date|_book_amt|_tecps_undertakectrtbasc"
                                                                                                    format="0|0|0|0|0|0|0|0|1|1|0|1|0|0|0|0|0|0" 
                                                                                                    aligns="1|0|0|1|0|0|3|0|0|0|0|0|3|0|0|0|0|3" 
                                                                                                    defaults="|||||||||||||||||"
                                                                                                    editcol="1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1" 
                                                                                                    widths="0|0|0|800|1500|2500|1500|1000|1500|2000|1000|2000|2000|2000|2000|0|0|0"
                                                                                                    styles="width:100%; height:100" 
                                                                                                    sorting="T" 
                                                                                                    oncelldblclick="OnPopUp('Charger'); OnPopUp('Partner')"
                                                                                                    onafteredit="OnEditOwner()"
                                                                                                    
                                                                                                   />
                                                                                        </td>
                                                                                </tr>
                                                                    </table>
                                                            </fieldset>	
                    							</td>
                                    </tr>
                                    <tr>
                                    			<td colspan="4">
                                                            <fieldset style="padding:0">
                                                                <legend style="font-weight:800">Contract Amount</legend>
                                                                    <table width="100%" cellpadding="0" cellspacing="0">
                                                                                <tr>
                                                                                        <td  >
                                                                                                <gw:grid id="Grid_ContAmt" 
                                                                                                    header="Currency|Amt|Exchange Rate|VAT (Y/N)|VAT|Corp. Currny Convr. Amt"
                                                                                                    format="0|1|1|0|1|1" 
                                                                                                    aligns ="1|0|0|0|3|0" 
                                                                                                    defaults="|||||"
                                                                                                    editcol="1|1|1|1|1|1" 
                                                                                                    widths="1000|2000|2000|1000|2000|1500"
                                                                                                    styles="width:100%; height:100" 
                                                                                                    sorting="T" 
                                                                                                   />
                                                                                        </td>
                                                                                </tr>
                                                                    </table>
                                                            </fieldset>	
                    							</td>
                                    </tr>
</table>
<gw:textbox id="txtLicense_No" readonly="true" styles='width:100%;display:none' />
<gw:textbox id="txtPartner_Pk" readonly="true" styles='width:100%;display:none' />
<gw:textbox id="txtSerialNo_Pk" readonly="true" styles='width:100%;display:none' />
</body>
</html>
