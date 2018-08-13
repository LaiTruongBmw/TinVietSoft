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
    G1_CLOSING_DATE = 1,    
    G1_STATUS      	= 2,
    G1_BRANCH   	= 3,
    G1_CHARGE 		= 4
	
	G5_NO   		= 1,    
    G5_ITEM_NAME    = 2,
    G5_UNIT   		= 3,
    G5_BEGIN_QTY 	= 4,
    G5_BEGIN_AMOUNT = 5,    
    G5_IN_AMOUNT    = 6,   
	G5_OUT_QTY   	= 7,	
    G5_OUT_AMOUNT   = 8,
    G5_END_QTY  	= 9,
	G5_END_AMOUNT	= 10
	
	G_TOTAL = 0; 

	
var rtnLGCode = '' ;
var arr_FormatNumber = new Array();
//======================================================================

function OnToggle(pos)
{
    switch (pos)
    {
        case '1':
            var left = document.all("left"); 
            var right = document.all("right"); 
            var imgArrow = document.all("imgArrow"); 

            if(imgArrow.status == "expand")
            {
                left.style.display="none";
                imgArrow.status = "collapse";
                right.style.width="100%";
                imgArrow.src = "../../../system/images/button/next.gif";
            }
            else
            {
                left.style.display="";
                imgArrow.status = "expand";
                right.style.width="80%";
                imgArrow.src = "../../../system/images/button/previous.gif";
            }        
        break; 
    }    
}

//======================================================================
var p_type = "" ;

function BodyInit()
{
    System.Translate(document);  // Translate to language session
	
	txtLang.text = "<%=Session("SESSION_LANG")%>";
    //---------------------------------- 
	txtEmpPK.text  = "<%=Session("EMPLOYEE_PK")%>"  ;
	txtUserPK.text = "<%=session("USER_PK")%>";
	
    var now = new Date(); 
    var lmonth, ldate;
	
    ldate = dtFrom.value ;         
    ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
    dtFrom.value = ldate;

    //---------------------------------- 
    txtRequesterID.SetEnable(false);
    txtRequesterName.SetEnable(false);
	
	//btnLoad.SetEnable(true);
	//btnUnClose.SetEnable(false);
	//btnClose.SetEnable(false);
	//btnAuto.SetEnable(false);
	
    //-------------------------
    BindingDataList();
	
	pro_bico20040_search.Call("SELECT");
}
//============================================================================== 
 function BindingDataList()
 {      
	var data;    
	data =  "<%=ESysLib.SetListDataSQL("select pk,branch_id || ' * '|| branch_name from tlg_co_dl_branch a where del_if=0 order by branch_id")%>";    
    lstBranchSlip.SetDataText(data);
	lstBranchSearch.SetDataText(data);
 }
 
//===================================================================================
function OnSearch(pos)
{
    switch (pos)
    {
        case 'grdSearch':
			alert("Search");
            //data_epbp00360.Call("SELECT");
        break;
    }
}
//===================================================================================
function OnClick(event)
{
	switch(event)
	{ 
		case 'load':
			txtRequesterName.text 	= "<%=Session("USER_NAME")%>";
			txtRequesterPK.text 	= "<%=Session("EMPLOYEE_PK")%>";
			
			grdSummary.ClearData();
			grdRevenue.ClearData();
			grdMaterial.ClearData();
			grdLabor.ClearData();
			
			btnLoad.SetEnable(false);
			
			pro_bico20040_load.Call();
		break;
		
		case 'Release':			 
			
			pro_bico20040_release.Call();
		break;
				
		case 'search':
			btnLoad.SetEnable(true);
			
			pro_bico20040_search.Call();
		break;
		
		case 'master':
			if ( grdSearch.row > 0 ){
				txtMasterPK.text = grdSearch.GetGridData( grdSearch.row, G1_PK);
				pro_bico20040_mt.Call("SELECT");
			}
		break;
		
		case 'close':
			txtCloseYN.text = 'Y';
			pro_bico20040_close.Call();
		break;
		
		case 'unclose':
			txtCloseYN.text = 'N';
			pro_bico20040_unclose.Call();
		break;
		
		case 'labor':
			if ( grdLabor.rows > 0 ){
				var path   = System.RootURL + '/form/bi/co/bico20040_labor.aspx?p_pk=' + txtMasterPK.text;
				var object = System.OpenModal( path ,950 , 400 ,  'resizable:yes;status:yes');	
			}
		break;
		
		case 'submit':
			pro_bico20040_submit.Call();
		break;
	}
}
//===================================================================================
function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case "pro_bico20040_close":
		break;
		
		case "pro_bico20040_load":						
			if(txtMasterPK.text == "0")
				alert("Fail");
			else
				pro_bico20040_mt.Call("SELECT");
		break;
		
		case "pro_bico20040_mt":
			btnLoad.SetEnable(true);
			
			pro_bico20040_material.Call("SELECT");
		break;
		
        case "pro_bico20040_material":
			if (grdMaterial.rows > 1)
			{
				grdMaterial.Subtotal(1, 2, -1, '3!4!5!6!7!8!9!10','###,###,###.##');
			}
			
			pro_bico20040_labor.Call("SELECT");
        break;
		
		case "pro_bico20040_labor":
			if (grdLabor.rows > 1)
			{
				grdLabor.Subtotal(1, 2, -1, '3!4!5','###,###,###.##');
			}
			
			pro_bico20040_revenue.Call("SELECT");
		break;
		
        case "pro_bico20040_revenue":
			if (grdRevenue.rows > 1)
			{
				grdRevenue.Subtotal(1, 2, -1, '3!4!5!6','###,###,###.##');
			}
			
			pro_bico20040_sub_material.Call("SELECT");
            
        break;
		
		case 'pro_bico20040_sub_material' :
			if (grdSubMaterial.rows > 1)
			{
				grdSubMaterial.Subtotal(1, 2, -1, '3!4!5!6!7!8!9!10','###,###,###.##');
			}
			
			pro_bico20040_summary.Call("SELECT");
		break;
		
		case "pro_bico20040_summary":
			if (grdSummary.rows > 1)
			{
				grdSummary.Subtotal(1, 2, -1, '4!5!6!7!8!9!10!11!12','###,###,###.##');
			}
		break;
		
		case 'pro_bico20040_release':
		break;
		
		case 'pro_bico20040_submit':
			alert('Finish.');
		break;
	}
}
//===================================================================================

function OnPopUp(pos)
{
	switch(pos)
	{
		case 'REVENUE':
			var path   = System.RootURL + '/form/bi/co/bico20041.aspx?p_master_pk=' + txtMasterPK.text;
			var object = System.OpenModal( path ,950 , 400 ,  'resizable:yes;status:yes');			
		break;
		
		case 'MATERIAL':
			var path   = System.RootURL + '/form/bi/co/bico20042.aspx?p_master_pk=' + txtMasterPK.text;
			var object = System.OpenModal( path ,950 , 400 ,  'resizable:yes;status:yes');			
		break;
		
		case 'SUB-MAT':
			var path   = System.RootURL + '/form/bi/co/bico20043.aspx?p_master_pk=' + txtMasterPK.text;
			var object = System.OpenModal( path ,950 , 400 ,  'resizable:yes;status:yes');			
		break;
	}
}

//===================================================================================
</script>

<body>
	<!------------------------------------------------------------------------------>
	<gw:data id="pro_bico20040_search" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="<%=l_user%>lg_sel_bico20040_search"> 
				<input>
					<input bind="dtFrom" /> 
					<input bind="dtTo" /> 
					<input bind="lstBranchSearch" /> 
					<input bind="txtEmpPK" /> 
					<input bind="chkUser" /> 
				</input> 
				<output bind="grdSearch" /> 
			</dso> 
		</xml> 
	</gw:data>
	<!------------------------------------------------------------------------------>
	<gw:data id="pro_bico20040_load" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="process" procedure="<%=l_user%>lg_pro_bico20040_load" > 
			<input>
				<input bind="txtRequesterPK" />
				<input bind="txtRequesterName" />
				<input bind="lstBranchSlip" />
				<input bind="dtClosing" />
			</input> 
			<output>
				<output bind="txtMasterPK" />
			</output>
			</dso> 
		</xml> 
	</gw:data>
	<!------------------------------------------------------------------------------>	 
	<gw:data id="pro_bico20040_release" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="process" procedure="<%=l_user%>lg_pro_bico20040_V1_release" > 
			<input>
				<input bind="lstBranchSlip" />
				<input bind="dtClosing" />
			</input> 
			<output>
				<output bind="txtMasterPK" />
			</output>
			</dso> 
		</xml> 
	</gw:data>
	<!------------------------------------------------------------------------------>	 
	<gw:data id="pro_bico20040_submit" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="process" procedure="<%=l_user%>lg_pro_bico20040_V1_submit" > 
			<input>
				<input bind="txtMasterPK" />				 
			</input> 
			<output>
				<output bind="txtMasterPK" />
			</output>
			</dso> 
		</xml> 
	</gw:data>
	<!------------------------------------------------------------------------------>
	<gw:data id="pro_bico20040_mt" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso type="control" function="<%=l_user%>lg_sel_bico20040_mt"> 
				<inout> 
					<inout bind="txtMasterPK" />
					<inout bind="lstBranchSlip" />
					<inout bind="txtRequesterPK" /> 
					<inout bind="txtRequesterName" />
					<inout bind="dtClosing" />
					<inout bind="txtTime" />
					<inout bind="txtCloseYN" />
					<inout bind="txtMaterial" />
                    <inout bind="txtRevenue" />
					<inout bind="txtLabor" />
					<inout bind="txtGeneral" />
					<inout bind="txtTotal" />
					<inout bind="txtPL" />
					<inout bind="txtSubMaterial" />
				</inout>
			</dso> 
		</xml> 
	</gw:data>
	<!------------------------------------------------------------------------------>
    <gw:data id="pro_bico20040_revenue" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="<%=l_user%>lg_sel_bico20040_revenue"> 
				<input>
					<input bind="txtMasterPK" /> 
				</input> 
				<output bind="grdRevenue" /> 
			</dso> 
		</xml> 
	</gw:data>
	<!------------------------------------------------------------------------------>
	<gw:data id="pro_bico20040_material" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="<%=l_user%>lg_sel_bico20040_material"> 
				<input>
					<input bind="txtMasterPK" /> 
				</input> 
				<output bind="grdMaterial" /> 
			</dso> 
		</xml> 
	</gw:data>
	<!------------------------------------------------------------------------------>
	<gw:data id="pro_bico20040_sub_material" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="<%=l_user%>lg_sel_bico20040_sub_material"> 
				<input>
					<input bind="txtMasterPK" /> 
				</input> 
				<output bind="grdSubMaterial" /> 
			</dso> 
		</xml> 
	</gw:data>
	<!------------------------------------------------------------------------------>
	<gw:data id="pro_bico20040_labor" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="<%=l_user%>lg_sel_bico20040_labor"> 
				<input>
					<input bind="txtMasterPK" /> 
				</input> 
				<output bind="grdLabor" /> 
			</dso> 
		</xml> 
	</gw:data>
	<!------------------------------------------------------------------------------>
    <gw:data id="pro_bico20040_summary" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid" function="<%=l_user%>lg_sel_bico20040_summary"> 
				<input>
					<input bind="txtMasterPK" /> 
				</input> 
				<output bind="grdSummary" /> 
			</dso> 
		</xml> 
	</gw:data>	   
	<!------------------------------------------------------------------------------>
	<table style="width: 100%; height: 100%" border="1">
        <tr>
            <td id="left" style="width: 20%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 20%" align="right">
                            Closing </td>
                        <td align="left" style="white-space: nowrap">
                            <gw:datebox id="dtFrom" lang="1" />
                            ~<gw:datebox id="dtTo" lang="1" />
                        </td>
                        <td width="1%"><gw:button img="search"     alt="Search"     id="btnSearch"  onclick="OnClick('search')" /> </td>
                    </tr>
                    <tr>
                        <td style="width: 20%; white-space: nowrap" align="right">
                            Req. Dept
                        </td>
                        <td>
                            <gw:list id="lstBranchSearch" styles="width:100%" />
                        </td>
						<td>
                            <gw:checkbox id="chkUser" styles="color:blue" defaultvalue="Y|N" value="Y" onchange="OnClick('search')">User
							</gw:checkbox>
                        </td>
                    </tr>
                    <tr style="height: 98%">
                        <td colspan="3">
                            <gw:grid id="grdSearch" header="_PK|Closing Date|Status|Branch|Charge" format="0|4|0|0|0"
                                aligns="1|1|1|0|0" defaults="||||" editcol="0|0|0|0|0" widths="0|1200|1200|1200|1300"
                                styles="width:100%; height:100%" sorting="T" oncellclick="OnClick('master')"
                                param="0,1,2,3" />
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 80%">
                <table style="width: 100%; height: 100%">
                    <tr style="height: 1%">
                        <td style="width: 1%">
                            <img status="expand" id="imgArrow" src="../../../system/images/button/previous.gif" style="cursor: hand" onclick="OnToggle('1')" />
                        </td>
                        <td align="right" style="width: 9%; white-space: nowrap;color:red">
                            Branch *
                        </td>
                        <td style="width: 20%" colspan="2">
                            <gw:list id="lstBranchSlip" styles="width:100%" />
                        </td>
                        <td align="center" style="width: 10%">
                            <gw:label id="lbStatus" styles='width:100%;color:cc0000;font:9pt' />
                        </td>
						<td align="right" colspan="3">
							<table style="height: 100%;width:1%" border="0">
								<tr>																	
									<td width="1%"><gw:button img="load"     	alt="Load Data"     	id="btnLoad"  		onclick="OnClick('load')" /> </td>
									<td width="1%"><gw:button img="release"     	alt="Release Data"     	id="btnRelease"  		onclick="OnClick('Release')" /> </td>
									
									<td width="1%"><gw:button img="submit"   alt="Submit"     	id="btnSubmit" 		onclick="OnClick('submit')"  /> </td>
									
									<td width="1%"><gw:button img="unclosedate" alt="UnClose Data"     	id="btnUnClose"  	onclick="OnClick('unclose')"  style="display:none" /> </td>
									
									<!--td width="1%"><gw:button img="auto"     	alt="Account Auto Slip" id="btnAuto"  		onclick="OnSearch('grdSearch')" /> </td-->
								</tr>
							</table>
						</td>
                    </tr>
					<tr style="height: 1%">
                        <td align="right" style="width: 10%" colspan="2">
							Charge
                        </td>
                        <td style="width: 20%;white-space:nowrap" colspan="2">
                            <gw:textbox id="txtRequesterPK" styles="display:none" />
                            <gw:textbox id="txtRequesterID" styles="width:30%;display:none" />
                            <gw:textbox id="txtRequesterName" styles="width:100%" />
                        </td>
                        <td align="right" style="width: 10%">
                            Revenue
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtRevenue" styles="width: 100%;font-weight:bold; " type="number" format="###,###,###.###" csstype="mandatory" />
                        </td>
						<td align="right" style="width: 10%">
                            Labor Cost
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtLabor" styles="width: 100%;font-weight:bold; " type="number" format="###,###,###.###" csstype="mandatory" />
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td align="right" style="width: 10%;color:red;white-space:nowrap" colspan="2">
							Closing Date *
                        </td>
                        <td style="width: 10%;white-space:nowrap">
                            <gw:datebox id="dtClosing" lang="1" />
                        </td>
						<td style="width: 10%;"><gw:textbox id="txtTime" styles="width:100%" /></td>
						<td align="right" style="width: 10%">
                            Total Cost
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtTotal" styles="width: 100%;font-weight:bold; " type="number" format="###,###,###.###" csstype="mandatory" />
                        </td>
						<td align="right" style="width: 10%">
                            Material Cost
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtMaterial" styles="width: 100%;font-weight:bold; " type="number" format="###,###,###.###" csstype="mandatory" />
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td align="right" style="width: 10%;white-space:nowrap" colspan="2">
							Lastest Closing
                        </td>
                        <td style="width: 20%;white-space:nowrap" colspan="2">
                            <gw:textbox id="txtTimeClosing" styles="width:100%" />
						</td>
						<td align="right" style="width: 10%">
                            Profit/Loss
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtPL" styles="width: 100%;color:red;font-weight:bold; " type="number" format="###,###,###.###" csstype="mandatory" />
                        </td>
						<td align="right" style="width: 10%">
                            General Cost
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtGeneral" styles="width: 100%;font-weight:bold; " type="number" format="###,###,###.###" csstype="mandatory" />
                        </td>
                    </tr>
					<tr style="height: 1%">
                        <td align="right" style="width: 10%;white-space:nowrap" colspan="2">
							 
                        </td>
                        <td style="width: 20%;white-space:nowrap" colspan="2">
                             
						</td>
						<td align="right" style="width: 10%">
                             
                        </td>
                        <td style="width: 10%">
                            
                        </td>
						<td align="right" style="width: 10%">
                            Sub-Mat
                        </td>
                        <td style="width: 10%">
                            <gw:textbox id="txtSubMaterial" styles="width: 100%;font-weight:bold; " type="number" format="###,###,###.###" csstype="mandatory" />
                        </td>
                    </tr>
					<tr>
						<td colspan="8" style="padding-top:5px">
							<gw:tab id="tab">
								<table name="Summary" class="table" width="100%" style="height: 100%;" CELLPADDING = "0"  CELLPADDING = "0" border="0">
									<tr>
										<td>
											<gw:grid id="grdSummary" header="No|Type|Menu|Unit Price|Pre Qty (1)|Actual Qty (2)|Revenue (3)|Material Cost (4)|Sub Material Cost (5)|Labor Cost (6)|Other Cost (7)|Total Cost (8=4+5+6+7)|Unit Cost (9=8/2)|Profit/Loss (10=3-8)|." 
												format="0|0|0|-0|-0|-0|-0|-0|-0|-0|-0|-0|-|-0|-0|0"
												aligns="1|1|0|0|0|0|0|0|0|0|0|0|0|0|0" 
												defaults="||||||||||||||" 
												editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
												widths="1000|1500|1500|1500|1500|1500|1500|1500|2000|1500|1500|2000|2000|2000|100"
												styles="width:100%; height:100%" sorting="T" oncellclick="OnSearch('grdMaster')"
												/>
										</td>
									</tr>
								</table>
								<table name="Revenue" class="table" width="100%" style="height: 100%;" CELLPADDING = "0"  CELLPADDING = "0" border="0">
									<tr>
										<td valign="top" style="border-top:1px solid;border-bottom:1px solid #DAA520;padding-top:5px;background-color:#F0E68C;height:28px" align="right">
											<table CELLPADDING = "0"  CELLPADDING = "0" border="0">
												<tr>
													<td>Sum Q.ty</td>
													<td style="width: 150px">
														<gw:textbox id="txtRevenueQty" styles="width: 100% " type="number" format="###,###,###.###" />
													</td>
													<td style="width: 20px">&nbsp;</td>
													<td>Sum Amount</td>
													<td style="width: 150px">
														<gw:textbox id="txtRevenueAmount" styles="width: 100% " type="number" format="###,###,###.###" />
													</td>
													<td style="width: 20px">&nbsp;</td>
													<td width="1px" style="padding-bottom:3px"><gw:button img="Detail"     alt="Detail Info"     id="btnRevenueDetail"  onclick="OnPopUp('REVENUE')" /> </td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<gw:grid id="grdRevenue" header="No|Type|Menu Item|Pre Qty|Actual Qty|Unit Price|Amount|GAP|." 
												format="0|0|0|-0|-0|-0|-0|-0|0"
												aligns="1|1|0|0|0|0|0|0|0" 
												defaults="||||||||" 
												editcol="0|0|0|0|0|0|0|0|0" 
												widths="1000|1500|4000|1500|1500|1500|1500|700|100"
												styles="width:100%; height:100%" sorting="T" oncellclick="OnSearch('grdMaster')"
												/>
										</td>
									</tr>
								</table>
								<table name="Material Cost" class="table" width="100%" style="height: 100%;" CELLPADDING = "0"  CELLPADDING = "0" border="0">
									<tr>
										<td valign="top" style="border-top:1px solid;border-bottom:1px solid #DAA520;padding-top:5px;background-color:#F0E68C;height:28px" align="right">
											<table CELLPADDING = "0"  CELLPADDING = "0" border="0">
												<tr>
													<td>In Amount</td>
													<td style="width: 150px">
														<gw:textbox id="txtMaterialIn" styles="width: 100% " type="number" format="###,###,###.###" />
													</td>
													<td style="width: 20px">&nbsp;</td>
													<td>Out Amount</td>
													<td style="width: 150px">
														<gw:textbox id="txtMaterialOut" styles="width: 100% " type="number" format="###,###,###.###" />
													</td>
													<td style="width: 20px">&nbsp;</td>
													<td width="1px" style="padding-bottom:3px"><gw:button img="Material"     alt="Detail Info"     id="btnMaterialDetail"  onclick="OnPopUp('MATERIAL')" /> </td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<gw:grid id="grdMaterial" header="No|Item Name|Unit|Begin Qty|Begin Amount|In Qty|In Amount|Out Qty|Out Amount|End Qty|End Amount|." 
												format="0|0|0|-2|-0|-2|-0|-2|-0|-2|-0|0"
												aligns="1|0|0|0|0|0|0|0|0|0|0|0" 
												defaults="|||||||||||" 
												editcol="0|0|0|0|0|0|0|0|0|0|0|0" 
												widths="700|4000|700|1500|2000|1500|2000|1500|2000|1500|2000|100"
												styles="width:100%; height:100%" sorting="T" oncellclick="OnSearch('grdMaster')"
												/>
										</td>
									</tr>
								</table>
								<table name="Labor Cost" class="table" width="100%" style="height: 100%;" CELLPADDING = "0"  CELLPADDING = "0" border="0">
									<tr>
										<td valign="top" style="border-top:1px solid;border-bottom:1px solid #DAA520;padding-top:5px;background-color:#F0E68C;height:28px" align="right">
											<table CELLPADDING = "0"  CELLPADDING = "0" border="0">
												<tr>
													<td>Sum Payment</td>
													<td style="width: 150px">
														<gw:textbox id="txtLaborSum" styles="width: 100% " type="number" format="###,###,###.###" />
													</td>
													<td style="width: 20px">&nbsp;</td>
													<td width="1px" style="padding-bottom:3px"><gw:button img="Labor"     alt="Detail Info"     id="btnLaborDetail"  onclick="OnClick('labor')" /> </td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<gw:grid id="grdLabor" header="No|Group|Emp Total| WT Pay| OT Pay|Total Pay|." 
												format="0|0|-0|-0|-0|-0|0"
												aligns="1|0|0|0|0|0|0" 
												defaults="||||||" 
												editcol="0|0|0|0|0|0|0" 
												widths="700|2500|1000|1500|1500|1500|100"
												styles="width:100%; height:100%" sorting="T" oncellclick="OnSearch('grdMaster')"
												/>
										</td>
									</tr>
								</table>
								<table name="Sub Material Cost" class="table" width="100%" style="height: 100%;" CELLPADDING = "0"  CELLPADDING = "0" border="0">
									<tr>
										<td valign="top" style="border-top:1px solid;border-bottom:1px solid #DAA520;padding-top:5px;background-color:#F0E68C;height:28px" align="right">
											<table CELLPADDING = "0"  CELLPADDING = "0" border="0">
												<tr>
													<td>In Amount</td>
													<td style="width: 150px">
														<gw:textbox id="txtSubMaterialIn" styles="width: 100% " type="number" format="###,###,###.###" />
													</td>
													<td style="width: 20px">&nbsp;</td>
													<td>Out Amount</td>
													<td style="width: 150px">
														<gw:textbox id="txtSubMaterialOut" styles="width: 100% " type="number" format="###,###,###.###" />
													</td>
													<td style="width: 20px">&nbsp;</td>
													<td width="1px" style="padding-bottom:3px"><gw:button img="Material"     alt="Detail Info"     id="btnMaterialDetail"  onclick="OnPopUp('SUB-MAT')" /> </td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<gw:grid id="grdSubMaterial" header="No|Item Name|Unit|Begin Qty|Begin Amount|In Qty|In Amount|Out Qty|Out Amount|End Qty|End Amount|." 
												format="0|0|0|-2|-0|-2|-0|-2|-0|-2|-0|0"
												aligns="1|0|0|0|0|0|0|0|0|0|0|0" 
												defaults="|||||||||||" 
												editcol="0|0|0|0|0|0|0|0|0|0|0|0" 
												widths="700|4000|700|1500|2000|1500|2000|1500|2000|1500|2000|100"
												styles="width:100%; height:100%" sorting="T" oncellclick="OnSearch('grdMaster')"
												/>
										</td>
									</tr>
								</table>
							</gw:tab>
						</td>
					</tr>
                </table>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
	<gw:textbox id="txtCloseYN" styles="width: 100%;display: none" />
    <gw:textbox id="txtEmpPK" styles="width: 100%;display: none" />
    <gw:textbox id="txtReturnValue" styles="width: 100%;display: none" />
	<gw:textbox id="txtUserPK" styles="width: 100%;display: none" />
    <!--------------------------------------------------------------------------->
	<gw:textbox id="txtLang" styles='display:none;width:100%' />
</body>
</html>