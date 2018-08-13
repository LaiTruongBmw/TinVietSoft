<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Clear Advance</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>
function BodyInit()
{
	System.Translate(document);
	BindingDataList();
	
}	
//=========================================================================================================
function BindingDataList()
{
	
} 
//=========================================================================================================
function OnSearch()
{
	if(txtProject_Pk.text!='')
	{
    	dso_master.Call('SELECT');
	}
	else
	{
		alert('Please select Project !!');
	}
}
//=========================================================================================================
function OnConfirm()
{
	if(txtDetail_Pk.text != '')
	{
		if(confirm('Are you sure you want to confirm ?'))
		{
			txtConfirm.text = 'INSERT';
			var MM = grdDetail.GetGridData(grdDetail.row, 3);
			var month = MM.substring(0,6);
			txtMonth.text = month;
			dtRequestDate.text = MM;
			dso_confirm.Call();	
		}
	}
	else
	{
		alert('Please save detail first!!');	
	}
}
//=========================================================================================================
function OnCancel()
{
	if(txtDetail_Pk.text != '')
	{
		if(confirm('Are you sure you want to cancel ?'))
		{
			txtConfirm.text = 'DELETE';
			var MM = grdDetail.GetGridData(grdDetail.row, 3);
			var month = MM.substring(0,6);
			txtMonth.text = month;
			dtRequestDate.text = MM;
			dso_confirm.Call();	
		}
	}
	else
	{
		alert('Please save detail first !!');	
	}
}
//=========================================================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'project':
		    var path = System.RootURL + '/form/61/05/61050020_popup.aspx';
		    var object = System.OpenModal( path ,750 , 500 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
			    txtProject_Pk.text = object[0];
                txtProject_Cd.text = object[1];
                txtProject_Nm.text = object[2];
		    }
	    break;
		
    }
}
//=========================================================================================================
function CellClick()
{
	txtMaster_Pk.text = grdMST.GetGridData(grdMST.row, 0);
	txtTotal_tmp.text = grdMST.GetGridData(grdMST.row, 7);
	dso_detail.Call('SELECT');
}
//=========================================================================================================
function CellClick_Dtl()
{
	txtDetail_Pk.text = grdDetail.GetGridData(grdDetail.row, 0);
	if(grdDetail.GetGridData(grdDetail.row, 10)== '2')
	{
		btnAdd.SetEnable(true);
		btnSave.SetEnable(false);
		btnDelete.SetEnable(false);
		btnConfirm.SetEnable(false);
		btnCancel.SetEnable(true);
	}
	else if(grdDetail.GetGridData(grdDetail.row, 10)== '3')
	{
		btnCancel.SetEnable(false);	
		btnSave.SetEnable(false);
		btnDelete.SetEnable(false);
		btnConfirm.SetEnable(false);
	}
	else
	{
		btnAdd.SetEnable(true);
		btnSave.SetEnable(true);
		btnDelete.SetEnable(true);
		btnConfirm.SetEnable(true);
		btnCancel.SetEnable(false);
	}
}
//=========================================================================================================
function RowEdit()
{
    var path = System.RootURL + '/form/61/06/61060060_popup.aspx?TECPS_EXPENSE_PAY_PK=' + grdDetail.GetGridData(grdDetail.row, 0) + '&TECPS_EXPENSE_REQ_PK=' + grdDetail.GetGridData(grdDetail.row, 1);
	var object = System.OpenModal( path ,1024 , 768 , 'resizable:yes;status:yes;scrollbars:yes');
	dso_detail.Call('SELECT');
}
//=========================================================================================================
function OnNew()
{
	if(txtMaster_Pk.text != '')
	{
		var path = System.RootURL + '/form/61/06/61060060_popup.aspx?TECPS_EXPENSE_REQ_PK='+ txtMaster_Pk.text + '&TECPS_EXPENSE_PAY_PK=' + '&p_project_pk=' + txtProject_Pk.text + '&p_project_cd=' + txtProject_Cd.text + '&p_project_nm=' + txtProject_Nm.text ;
		var object = System.OpenModal( path ,1024 , 768 , 'resizable:yes;status:yes;scrollbars:yes');
		dso_detail.Call('SELECT');
	}
	else
	{
		alert('Please select grid master !!');	
	}
}
//=========================================================================================================
function OnSave()
{
	if(!OnCheckSum())
	{
    	dso_detail.Call();
	}
}
//=========================================================================================================
function OnDelete()
{
    if ( grdDetail.row > 0 )
    {
        if(confirm("Are you sure you want to delete ?"))
        {
                grdDetail.DeleteRow();
				dso_detail.Call();
        }        
    }    
}
//=========================================================================================================
function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'dso_detail':
			if(grdDetail.rows> 1)
			{
				grdDetail.SetGridText(grdDetail.rows-1, 11, txtTotal_tmp.text);
			}
		break;	
		case 'dso_confirm':
			grdDetail.SetGridText(grdDetail.row, 2, txtSeq.text);
			alert(txtRtn.text);
		break;
	}
}
//=========================================================================================================
function OnCheckSum()
{
	var i = 0;
	var _NetAmt = 0;
	var _VATAmt = 0;
	var _Total = 0;
	for(i=1;i<grdDetail.rows;i++)
	{
		_Total += Math.round(Number(grdDetail.GetGridData(i,7)));
	}
	if (_Total > Number(grdDetail.GetGridData(grdDetail.rows-1,11)))
	{
		alert('Total of the detail can not be large than Total of the Master!!');
		return true;
	}
	return false;
}
//=========================================================================================================
function OnCalc()
{
	var _NetAmt = Number(grdDetail.GetGridData(grdDetail.row,5));
	var _VATAmt = Number(grdDetail.GetGridData(grdDetail.row,6));
	var _Total = 0;
	_Total = Math.round(_NetAmt + _VATAmt);
	grdDetail.SetGridText(grdDetail.row, 7, _Total);
}

function OnPrint(obj) {
    switch (obj) {
        case 'ACCOUNTING_SLIP':
            if (txtDetail_Pk.text != '') 
            {
                var url = System.RootURL + "/reports/61/05/rpt_61050080_envn.aspx?seq=" + grdDetail.GetGridData(grdDetail.row, 2);
                System.OpenTargetPage(url);
            }
            else 
            {
                alert('Please select a Seq !!');
            }
            break;
        case 'PROPOSAL_SHEET':
            if (txtDetail_Pk.text != '') 
            {
                var url = System.RootURL + "/reports/61/06/rpt_61060060.aspx?pk=" + txtDetail_Pk.GetData() + '&TECPS_EXPENSE_REQ_PK=' + grdDetail.GetGridData(grdDetail.row, 1);
                System.OpenTargetPage(url);
            }
            else 
            {
                alert('Please select a Seq !!');
            }
            break;
    }
    
}
</script>
<body>
<!------------------------------------------------------------------------------------------------------------------>
<gw:data id="dso_master" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso id="1" type="grid" function="pm_sel_61060060"> 
			<input bind="grdMST">                    
				<input bind="txtProject_Pk" /> 
                <input bind="dtDateFr" /> 
                <input bind="dtDateTo" /> 
                <input bind="txtRequest_No" /> 
			</input> 
			<output bind="grdMST" />
		</dso> 
	</xml> 
</gw:data>

<!------------------------------------------------------------------------------------------------------------------>
<gw:data id="dso_detail" onreceive="OnDataReceive(this)">
      <xml>
        <dso id="1" type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10"  function="pm_sel_61060060_dtl"  procedure="pm_upd_61060060_dtl">
          <input bind="grdDetail" >
          <input bind="txtMaster_Pk" />
          </input>
          <output bind="grdDetail" />
        </dso>
      </xml>
    </gw:data>  
    
<gw:data id="dso_confirm" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="pm_pro_61060060_confirm"> 
                <input> 
                	 <input bind="txtConfirm"/>
                     <input bind="txtMonth"/>
                     <input bind="dtRequestDate"/>
                     <input bind="txtDetail_Pk" />
                </input>
                <output>
                     <output bind="txtRtn"/>
                     <output bind="txtSeq"/>
                     <output bind="txtRtn_Status"/>
                     
               </output> 
            </dso> 
        </xml> 
    </gw:data>                      
    <table cellpadding="1" cellspacing="1" style="width: 100%; height: 100%;border-collapse: collapse" bordercolor="#00CCFF" border="1">
        <tr style="height: 2%">
            <td style="width: 100%">
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="right" width="6%"><a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('project')">Project&nbsp;</a></td>
                        <td width="20%"><gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' /></td>
                        <td width="30%"><gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' /></td>
                        <td width=""><gw:textbox id="txtProject_Pk" styles='width:100%;display:none' /></td>
                        <td><gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProject_Pk.text='';" /></td>
                        <td  align="right" width="10%">Date&nbsp;</td>
                        <td colspan="">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="50%"><gw:datebox id="dtDateFr" lang="1" styles='width:100%' /></td>
                                    <td>~</td>
                                    <td width="50%"><gw:datebox id="dtDateTo" lang="1" styles='width:100%' /></td>
                                </tr>
                            </table>
                        </td>
                        <td align="right" width="15%">Request No&nbsp;</td>
                        <td width="19%"><gw:textbox id="txtRequest_No" styles='width:100%' /></td>
                        <td><gw:button id="ibtnsearch" img="search" alt="Search" onclick="OnSearch()" /></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr style="height: 40%">
            <td>
                <gw:grid id="grdMST" 
					header="_PK|Seq|Request Date|Request No|Budget Item|Net Amount|VAT|Total|Description|Local Description"
                    format="0|0|0|0|0|1|1|1|0|0" 
					aligns="0|1|1|0|0|0|0|0|0|0"
                    defaults="|||||||||" 
				   editcol="0|0|0|0|0|0|0|0|0|0" 
                    widths="0|1000|1300|1500|3000|2000|1500|2000|3000|3000"
                    styles="width:100%; height:100%" 
                    sorting="T" 
					debug="false"
					oncellclick="CellClick()" />
            </td>
        </tr>
		<tr style="height: 2%">
			<td width="100%">
				<table cellpadding="0" cellspacing="0" width="100%" border="0">
					<tr>
                    	<td width="79%"></td>
						<td style="width: 3%"><gw:button id="btnAdd" img="new" alt="Add" onclick="OnNew()" /></td>
						<td style="width: 3%"><gw:button id="btnSave" img="save" alt="Save" onclick="OnSave()" /></td>
						<td style="width: 3%"><gw:button id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" /></td>
                        <td style="width: 3%"><gw:button id="btnConfirm" img="confirm" alt="Confirm" onclick="OnConfirm()"  /></td>
						<td style="width: 3%"><gw:button id="btnCancel" img="cancel" alt="Cancel" onclick="OnCancel()" /></td>
						<td style="width: 3%"><gw:button id="ibtnexcel" img="excel" text="Print" alt="ACCOUNTING SLIP" onclick="OnPrint('ACCOUNTING_SLIP')" /></td>
                        <td style="width: 3%"><gw:button id="ibtnexcel" img="excel" text="Print" alt="PROPOSAL SHEET" onclick="OnPrint('PROPOSAL_SHEET')" /></td>
					</tr>
				</table>
			</td>
		</tr>
        <tr style="height: 48%">
            <td>
                <gw:grid id="grdDetail" 
				header="_PK|_Master_pk|Seq|Date|Voucher|Net Amount|VAT|Total|Description|Local Description|_Status|_Total"
				format="0|0|0|4|0|1|1|1|0|0|0|0"
				aligns="0|0|1|1|0|0|0|0|0|0|0|0"
				defaults="|||||||||||" 
			   editcol="1|1|0|1|1|0|0|0|1|1|1|1"
				widths="0|0|1000|1200|1500|2000|1500|2000|3000|3000|0|0"
				styles="width:100%; height:100%" 
				sorting="T" 
				debug="false"
				oncelldblclick="RowEdit()"
                oncellclick="CellClick_Dtl()"
				onafteredit="OnCalc()"/>
            </td>
        </tr>
        
    </table>
<gw:textbox id="txtMaster_Pk" readonly="true" styles='width:100%;display:none' />   
<gw:textbox id="txtDetail_Pk" readonly="true" styles='width:100%;display:none' />   
<gw:textbox id="txtNet_tmp" readonly="true" styles='width:100%;display:none' />   
<gw:textbox id="txtVAT_tmp" readonly="true" styles='width:100%;display:none' />   
<gw:textbox id="txtTotal_tmp" readonly="true" styles='width:100%;display:none' />   
<gw:textbox id="txtConfirm" readonly="true" styles='width:100%;display:none' />   
<gw:textbox id="txtMonth" readonly="true" styles='width:100%;display:none' />  
 <gw:textbox id="dtRequestDate" readonly="true" styles='width:100%;display:none' /> 
  <gw:textbox id="txtRtn" readonly="true" styles='width:100%;display:none' />  
   <gw:textbox id="txtSeq" readonly="true" styles='width:100%;display:none' />  
   <gw:textbox id="txtRtn_Status" readonly="true" styles='width:100%;display:none' />  

</body>
</html>
