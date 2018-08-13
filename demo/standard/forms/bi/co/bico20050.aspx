<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>PURCHASING REQUEST ENTRY</title>
</head>
<%  
	ESysLib.SetUser(Session("APP_DBUSER"))
    Dim l_user As String
    l_user = ""
%>

<script>

var flag;

//-------------------
var G1_PK   		= 0,
	G1_BRANCH_PK	= 1,
	G1_CHK			= 2,
	G1_STATUS		= 3,
	G1_ACC_SLIP		= 4,
	G1_DATE			= 5,
	G1_BRANCH_NM	= 6,
	G1_REVENUE		= 7,
	G1_MATERIAL		= 8,
	G1_SUB_MAT		= 9,
	G1_LABOR		= 10,
	G1_GENERAL		= 11,
	G1_PRO_LOSS		= 12,
	G1_REMARK		= 13,
	G1_NULL			= 14;
	 
//============================================================================== 
function BodyInit()
{
    System.Translate(document);  // Translate to language session
	txtRequesterName.text 	= "<%=Session("USER_NAME")%>";
	txtRequesterPK.text 	= "<%=Session("EMPLOYEE_PK")%>";

	BindingDataList();
	
	OnClick("search");
}
//============================================================================== 
 function BindingDataList()
 {      
	var data;    
	data =  "<%=ESysLib.SetListDataSQL("select pk,branch_id || ' * '|| branch_name from tlg_co_dl_branch a where del_if=0 order by branch_id")%>||ALL";    
    lstBranch.SetDataText(data);	
	lstBranch.value = "";
	
	data = "DATA|2|SUBMITTED|3|APPROVED|4|CANCEL||ALL"; 
	lstApprove.SetDataText(data);	
	lstApprove.value = "";
 }
//============================================================================== 
function OnClick(evt){
	switch(evt){
		case "search":
			pro_bico20050.Call("SELECT");
		break;
		case "cancel":
			pro_bico20050_cancel.Call();
		break;
		case "approve":
			pro_bico20050_approve.Call();
		break;
		case "branch":
			if(grdSummary.GetGridData( grdSummary.row, G1_PRO_LOSS) == "0") return false;
			if(event.row > 1 && event.col > G1_BRANCH_NM && event.col < G1_REMARK){
				var path   = System.RootURL + '/form/bi/co/bico20051.aspx?p_pk=' + grdSummary.GetGridData( grdSummary.row, G1_PK);
				var object = System.OpenModal( path ,950 , 600 ,  'resizable:yes;status:yes');
			}
		break;
		case "invalid":
			var vl;
			txtArrPK.text = '-1';
			if(grdSummary.rows > 2){
				for(var idx = 2; idx < grdSummary.rows; idx ++){
					vl = txtArrPK.text;
					//alert(grdSummary.GetGridData( idx, G1_PK) + " - " + grdSummary.rows);
					if (grdSummary.GetGridData( idx, G1_CHK) == '-1'){
						txtArrPK.text = vl + "," + grdSummary.GetGridData( idx, G1_PK);
					}
				}
			}
			if(txtArrPK.text != '-1'){
				//alert(txtArrPK.text);
				if (confirm('Are you sure to invalid data?'))
					pro_bico20050_invalid.Call();
			}
		break;
		case "valid":
			var vl;
			txtArrPK.text = '-1';
			if(grdSummary.rows > 2){
				for(var idx = 2; idx < grdSummary.rows; idx ++){
					vl = txtArrPK.text;
					if (grdSummary.GetGridData( idx, G1_CHK) == '-1'){
						txtArrPK.text = vl + "," + grdSummary.GetGridData( idx, G1_PK);
					}
				}
			}
			if(txtArrPK.text != '-1'){
				if (confirm('Are you sure to valid data?'))
					pro_bico20050_valid.Call();
			}
		break;
		case "autovalid":
			if(lstBranch.value == ""){
				alert("Please select 1 branch!"); return false;
			}
			pro_bico20050_autovalid.Call();
		break;
	}
}
//============================================================================== 
function OnDataReceive(obj)
{ 
	switch(obj.id)
	{
		case 'pro_bico20050':
			grdSummary.Subtotal( 1, 2,-1, '7!8!9!10!11!12');  
		break;
		case 'pro_bico20050_valid':
		case 'pro_bico20050_invalid':
		case 'pro_bico20050_autovalid':
			alert(txtResult.text); txtResult.text = "";
			pro_bico20050.Call("SELECT");
		break;
	}
}
//==============================================================================

function OnPopUp(pos)
{
	switch (pos)
	{		 
		case 'REPORT':
			var path = System.RootURL + '/form/bi/co/bico20052.aspx';
			var object = System.OpenModal( path ,400, 300 ,  'resizable:yes;status:yes',this);	
		break;	
	}
}
 
//=============================================================================
function OnReport(pos)
{
	
	switch (pos)
	{				
		case 'ST01':
			var url = System.RootURL + '?p_branch_pk=' + lstBranch.value + '&p_from_date=' + dtFrom.value + '&p_to_date=' + dtTo.value  ;
				 
			System.OpenTargetPage(url);
		break;
 
	}		 
}
//============================================================================= 

 
</script>

<body>
	<!---------------------------------------------------------------------------------->
	<gw:data id="pro_bico20050" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="<%=l_user%>lg_sel_bico20050"> 
				<input>
					<input bind="dtFrom" /> 
					<input bind="dtTo" /> 
					<input bind="lstBranch" /> 
					<input bind="txtAccSlip" /> 
					<input bind="lstApprove" /> 
				</input> 
				<output bind="grdSummary" /> 
			</dso> 
		</xml> 
	</gw:data>
	<!---------------------------------------------------------------------------------->
	<gw:data id="pro_bico20050_approve" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" parameter="0,2" function="<%=l_user%>lg_sel_bico20050" procedure="<%=l_user%>lg_upd_bico20050_approve"> 
				<input>
					<input bind="dtFrom" /> 
					<input bind="dtTo" /> 
					<input bind="lstBranch" /> 
					<input bind="txtAccSlip" /> 
					<input bind="lstApprove" /> 
				</input> 
				<output bind="grdSummary" /> 
			</dso> 
		</xml> 
	</gw:data>
	<!---------------------------------------------------------------------------------->
	<gw:data id="pro_bico20050_cancel" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" parameter="0,2" function="<%=l_user%>lg_sel_bico20050" procedure="<%=l_user%>lg_upd_bico20050_cancel"> 
				<input>
					<input bind="dtFrom" /> 
					<input bind="dtTo" /> 
					<input bind="lstBranch" /> 
					<input bind="txtAccSlip" /> 
					<input bind="lstApprove" /> 
				</input> 
				<output bind="grdSummary" /> 
			</dso> 
		</xml> 
	</gw:data>
	<!---------------------------------------------------------------------------------->
	<gw:data id="pro_bico20050_invalid" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="process" procedure="<%=l_user%>lg_pro_bico20040_V1_invalid" > 
			<input>
				<input bind="txtArrPK" />
			</input> 
			<output>
				<output bind="txtResult" />
			</output>
			</dso> 
		</xml> 
	</gw:data>
	<!---------------------------------------------------------------------------------->
	<gw:data id="pro_bico20050_valid" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="process" procedure="<%=l_user%>lg_pro_bico20040_V1_valid" > 
			<input>
				<input bind="txtArrPK" />
				<input bind="txtRequesterPK" />
				<input bind="txtRequesterName" />
			</input> 
			<output>
				<output bind="txtResult" />
			</output>
			</dso> 
		</xml> 
	</gw:data>
	<!---------------------------------------------------------------------------------->
	<gw:data id="pro_bico20050_autovalid" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="process" procedure="<%=l_user%>lg_pro_bico20040_V1_autovalid" > 
			<input>
				<input bind="lstBranch" />
				<input bind="txtRequesterPK" />
				<input bind="txtRequesterName" />
			</input> 
			<output>
				<output bind="txtResult" />
			</output>
			</dso> 
		</xml> 
	</gw:data>
	<!---------------------------------------------------------------------------------->
	<table style="width: 100%; height: 100%" border="0">
        <tr>
            <td id="right" style="width: 100%" valign="top">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 40%">
                            &nbsp;
                        </td>
                        <td align="right" style="width:5%; white-space: nowrap;">
                            Branch
                        </td>
                        <td style="width: 20%" colspan="2">
                            <gw:list id="lstBranch" styles="width:100%" />
                        </td>
						<td align="right" style="width: 5%; white-space: nowrap;">
                            Date
                        </td>
						<td align="left" style="white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~<gw:datebox id="dtTo" lang="1" />
                        </td>
						<td align="right" style="width:1%; white-space: nowrap;">
                            Account Slip No
                        </td>
						<td style="width: 10%" colspan="2">
                            <gw:textbox id="txtAccSlip" styles="width:100%" />
                        </td>
						<td align="right" style="width:1%; white-space: nowrap;">
                            Approve Status
                        </td>
                        <td align="center" style="width: 10%">
                            <gw:list id="lstApprove" styles="width:100%" />
                        </td>
                    </tr>
					<tr>
						<td align="right" colspan="12">
							<table style="height: 100%;width:1%" border="0">
								<tr>
									<td width="1%"><gw:button img="search"     	alt="Search"     	id="btnSearch"  		onclick="OnClick('search')" /> </td>
									<td width="1%"><gw:button img="approve" 	alt="Approve"     	id="btnApprove"  		onclick="OnClick('approve')" /> </td>
									<td width="1%"><gw:button img="cancel"   	alt="Cancel"     	id="btnCancel" 			onclick="OnClick('cancel')" /> </td>
									<!-- <td width="1%"><gw:button img="auto"     	alt="Account Auto Slip" id="btnAuto"  		onclick="OnClick('auto')" /> </td> -->
									<td width="1%"><gw:button img="print"   	alt="Print"     	id="btnPrint" 			onclick="OnPopUp('REPORT')" /> </td>
									<td width="1%"><gw:button img="Invalid"   	alt="Invalid"     	id="btnInvalid" 		onclick="OnClick('invalid')" /> </td>
									<td width="1%"><gw:button img="Valid"   	alt="Valid"     	id="btnValid" 			onclick="OnClick('valid')" /> </td>
									<td width="1%"><gw:button img="Auto Valid"  alt="Auto Valid"    id="btnAutoValid" 		onclick="OnClick('autovalid')" /> </td>
								</tr>
							</table>
						</td>
					</tr>
					<tr style="height:100%">
						<td colspan="15" style="padding-top:5px">
								<table name="Summary" class="table" width="100%" style="height: 100%;" CELLPADDING = "0"  CELLPADDING = "0" border="0">
									<tr>
										<td>
											<gw:grid id="grdSummary" header="_Master PK|_Branch PK|Chk|Status|Acc Slip No|Date|Branch|Revenue (1)|Material Cost (2)|Sub Mat(3)|Labor Cost (4)|General Cost (5)|Profit/Loss (6)= (1)-(2)-(3)-(4)-(5)|Remark|." 
												format="0|0|3|0|0|4|0|-0|-0|-0|-0|-0|-0|0|0"
												aligns="0|0|0|1|1|1|0|0|0|0|0|0|0|0|0" 
												defaults="|||||||||||||" 
												editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
												widths="0|0|600|1200|1500|1500|1500|1500|1500|1500|1500|1500|3300|2000|100"
												styles="width:100%; height:100%" sorting="T" oncelldblclick="OnClick('branch')"
												/>
										</td>
									</tr>
								</table>
						</td>
					</tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
	<gw:textbox id="txtArrPK" styles="width: 100%;display: none" />
	<gw:textbox id="txtResult" styles="width: 100%;display: none" />
	<gw:textbox id="txtRequesterPK" styles="display:none" />
	<gw:textbox id="txtRequesterName" styles="width:100%;display:none" />
</body>
</html>