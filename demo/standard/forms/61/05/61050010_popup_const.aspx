<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Change Contract Detail Preparation [Contruction]</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var WkngItemNo = 0,
	DetailsLevelCode = 1,
	DetailsLevelSeqNo = 2,
	Name = 3,
	Standard = 4,
	Weight = 5,
	Unit = 6,

	C_Qty = 7,
	C_RawMtrlCostUP = 8,
	C_RawMtrlCostAmt = 9,
	C_LaborCostUP = 10,
	C_LaborCostAmt = 11,
	C_ExpUP = 12,
	C_ExpAmt = 13,
	C_UP = 14,
	C_Amt = 15,

	W_Qty = 16,
	W_RawMtrlCostUP = 17,
	W_RawMtrlCostAmt = 18,
	W_LaborCostUP = 19,
	W_LaborCostAmt = 20,
	W_ExpUP = 21,
	W_ExpAmt = 22,
	W_UP = 23,
	W_Amt = 24,

	B_Qty = 25,
	B_RawMtrlCostUP = 26,
	B_RawMtrlCostAmt = 27,
	B_LaborCostUP = 28,
	B_LaborCostAmt = 29,
	B_ExpUP = 30,
	B_ExpAmt = 31,
	B_UP = 32,
	B_Amt = 33,

	A_Qty = 34,
	A_RawMtrlCostUP = 35,
	A_RawMtrlCostAmt = 36,
	A_LaborCostUP = 37,
	A_LaborCostAmt = 38,
	A_ExpUP = 39,
	A_ExpAmt = 40,
	A_UP = 41,
	A_Amt = 42,

	ID_Qty = 43,
	ID_RawMtrlCostUP = 44,
	ID_RawMtrlCostAmt = 45,
	ID_LaborCostUP = 46,
	ID_LaborCostAmt = 47,
	ID_ExpUP = 48,
	ID_ExpAmt = 49,
	ID_UP = 50,
	ID_Amt = 51;
function BodyInit()
{
	System.Translate(document);
	BindingDataList();
	MerGrid();
	Grid_Detail.GetGridControl().WordWrap = true;
	ShowHide(1);
	ShowHide(2);
	ShowHide(3);
	ShowHide(4);
	
	var p_pk = "<%=Request.querystring("pk")%>"; 
	var p_Project_Pk = "<%=Request.querystring("Project_Pk")%>"; 
	txtPk.SetDataText(p_pk);
	txtProject_Pk.SetDataText(p_Project_Pk);
}
//===================================================================================
function BindingDataList()
{
	var OrderWDiv = "<%=ESysLib.SetListDataSQL("select pk,orderingconttypename from tecps_orderingconttype where del_if = 0 order by orderingconttypename")%>";
	lstOrderWDiv.SetDataText(OrderWDiv);
	var RegWDiv = "<%=ESysLib.SetListDataSQL(" select pk, UNDERTAKELEVELNAME from TECPS_UNDERTAKELEVELCODE where del_if = 0 order by UNDERTAKELEVELNAME")%>";
	lstRegWDiv.SetDataText(RegWDiv);
	var ContType = "<%=ESysLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('TPS0018') FROM DUAL")%>|ALL|--Select All--";
	lstContType.SetDataText(ContType);
}
//===================================================================================
function MerGrid()
{
        if (Grid_Detail.rows < 2)
		{
			Grid_Detail.AddRow();
		}
		var fg=Grid_Detail.GetGridControl();
		fg.FixedRows = 2
		fg.MergeCells = 5

		fg.MergeCol(WkngItemNo) = true
		fg.Cell(0, 0, WkngItemNo, 1, WkngItemNo) = "Wkng Item No."
		
		fg.MergeCol(DetailsLevelCode) = true
		fg.Cell(0, 0, DetailsLevelCode, 1, DetailsLevelCode) = "Details Level Code"
		
		fg.MergeCol(DetailsLevelSeqNo) = true
		fg.Cell(0, 0, DetailsLevelSeqNo, 1, DetailsLevelSeqNo) = "Details Level Seq. No."
		
		fg.MergeCol(Name) = true
		fg.Cell(0, 0, Name, 1, Name) = "Name"
		
		fg.MergeCol(Standard) = true
		fg.Cell(0, 0, Standard, 1, Standard) = "Standard"
		
		fg.MergeCol(Weight) = true
		fg.Cell(0, 0, Weight, 1, Weight) = "Weight"
		
		fg.MergeCol(Unit) = true
		fg.Cell(0, 0, Unit, 1, Unit) = "Unit"
		
		fg.MergeRow(0) = true
		fg.Cell(0, 0, C_Qty, 0, C_Amt) = "Contract" 
		fg.Cell(0, 1, C_Qty, 1 ) 	= "Q'ty"
		fg.Cell(0, 1, C_RawMtrlCostUP, 1 ) 	= "Raw Mtrl Cost U/P"
		fg.Cell(0, 1, C_RawMtrlCostAmt, 1 ) 	= "Raw Mtrl Cost Amt"
		fg.Cell(0, 1, C_LaborCostUP, 1) 	= "Labor Cost U/P"
		fg.Cell(0, 1, C_LaborCostAmt, 1) 	= "Labor Cost Amt"
		fg.Cell(0, 1, C_ExpUP, 1) 	= "Exp U/P"
		fg.Cell(0, 1, C_ExpAmt, 1) 	= "Exp Amt"
		fg.Cell(0, 1, C_UP, 1 ) 	= "U/P"
		fg.Cell(0, 1, C_Amt, 1) 	= "Amt"
		
		fg.Cell(0, 0, W_Qty, 0, W_Amt) = "Working" 
		fg.Cell(0, 1, W_Qty, 1 ) 	= "Q'ty"
		fg.Cell(0, 1, W_RawMtrlCostUP, 1 ) 	= "Raw Mtrl Cost U/P"
		fg.Cell(0, 1, W_RawMtrlCostAmt, 1 ) 	= "Raw Mtrl Cost Amt"
		fg.Cell(0, 1, W_LaborCostUP, 1) 	= "Labor Cost U/P"
		fg.Cell(0, 1, W_LaborCostAmt, 1) 	= "Labor Cost Amt"
		fg.Cell(0, 1, W_ExpUP, 1) 	= "Exp U/P"
		fg.Cell(0, 1, W_ExpAmt, 1) 	= "Exp Amt"
		fg.Cell(0, 1, W_UP, 1 ) 	= "U/P"
		fg.Cell(0, 1, W_Amt, 1) 	= "Amt"
		
		fg.Cell(0, 0, B_Qty, 0, B_Amt) = "Before Change" 
		fg.Cell(0, 1, B_Qty, 1 ) 	= "Q'ty"
		fg.Cell(0, 1, B_RawMtrlCostUP, 1 ) 	= "Raw Mtrl Cost U/P"
		fg.Cell(0, 1, B_RawMtrlCostAmt, 1 ) 	= "Raw Mtrl Cost Amt"
		fg.Cell(0, 1, B_LaborCostUP, 1) 	= "Labor Cost U/P"
		fg.Cell(0, 1, B_LaborCostAmt, 1) 	= "Labor Cost Amt"
		fg.Cell(0, 1, B_ExpUP, 1) 	= "Exp U/P"
		fg.Cell(0, 1, B_ExpAmt, 1) 	= "Exp Amt"
		fg.Cell(0, 1, B_UP, 1 ) 	= "U/P"
		fg.Cell(0, 1, B_Amt, 1) 	= "Amt"

		fg.Cell(0, 0, A_Qty, 0, A_Amt) = "After Change" 
		fg.Cell(0, 1, A_Qty, 1 ) 	= "Q'ty"
		fg.Cell(0, 1, A_RawMtrlCostUP, 1 ) 	= "Raw Mtrl Cost U/P"
		fg.Cell(0, 1, A_RawMtrlCostAmt, 1 ) 	= "Raw Mtrl Cost Amt"
		fg.Cell(0, 1, A_LaborCostUP, 1) 	= "Labor Cost U/P"
		fg.Cell(0, 1, A_LaborCostAmt, 1) 	= "Labor Cost Amt"
		fg.Cell(0, 1, A_ExpUP, 1) 	= "Exp U/P"
		fg.Cell(0, 1, A_ExpAmt, 1) 	= "Exp Amt"
		fg.Cell(0, 1, A_UP, 1 ) 	= "U/P"
		fg.Cell(0, 1, A_Amt, 1) 	= "Amt"

		fg.Cell(0, 0, ID_Qty, 0, ID_Amt) = "Incr./Decr." 
		fg.Cell(0, 1, ID_Qty, 1 ) 	= "Q'ty"
		fg.Cell(0, 1, ID_RawMtrlCostUP, 1 ) 	= "Raw Mtrl Cost U/P"
		fg.Cell(0, 1, ID_RawMtrlCostAmt, 1 ) 	= "Raw Mtrl Cost Amt"
		fg.Cell(0, 1, ID_LaborCostUP, 1) 	= "Labor Cost U/P"
		fg.Cell(0, 1, ID_LaborCostAmt, 1) 	= "Labor Cost Amt"
		fg.Cell(0, 1, ID_ExpUP, 1) 	= "Exp U/P"
		fg.Cell(0, 1, ID_ExpAmt, 1) 	= "Exp Amt"
		fg.Cell(0, 1, ID_UP, 1 ) 	= "U/P"
		fg.Cell(0, 1, ID_Amt, 1) 	= "Amt"
		
}
//===================================================================================
function ShowHide(obj)
{
		var fg=Grid_Detail.GetGridControl(); 	
	 		switch(obj)
			{
				case 1:
						if(chkLevelCode.value == 'N')
						{
								fg.ColHidden(WkngItemNo) = true; 
								fg.ColHidden(DetailsLevelCode) = true; 
								fg.ColHidden(DetailsLevelSeqNo) = true; 
						}
						else
						{
								fg.ColHidden(WkngItemNo) = false; 
								fg.ColHidden(DetailsLevelCode) = false; 
								fg.ColHidden(DetailsLevelSeqNo) = false; 
						}
				break;
				case 2:
						if(chkContUP.value == 'N')
						{
								fg.ColHidden(C_Qty) = true; 
								fg.ColHidden(C_RawMtrlCostUP) = true; 
								fg.ColHidden(C_RawMtrlCostAmt) = true; 
								fg.ColHidden(C_LaborCostUP) = true; 
								fg.ColHidden(C_LaborCostAmt) = true; 
								fg.ColHidden(C_ExpUP) = true; 
								fg.ColHidden(C_ExpAmt) = true; 
								fg.ColHidden(C_UP) = true; 
								fg.ColHidden(C_Amt) = true; 
						}
						else
						{
								fg.ColHidden(C_Qty) = false; 
								fg.ColHidden(C_RawMtrlCostUP) = false; 
								fg.ColHidden(C_RawMtrlCostAmt) = false; 
								fg.ColHidden(C_LaborCostUP) = false; 
								fg.ColHidden(C_LaborCostAmt) = false; 
								fg.ColHidden(C_ExpUP) = false; 
								fg.ColHidden(C_ExpAmt) = false; 
								fg.ColHidden(C_UP) = false; 
								fg.ColHidden(C_Amt) = false; 
						}
				break;
				case 3:
						if(chkWkngUP.value == 'N')
						{
								fg.ColHidden(W_Qty) = true; 
								fg.ColHidden(W_RawMtrlCostUP) = true; 
								fg.ColHidden(W_RawMtrlCostAmt) = true; 
								fg.ColHidden(W_LaborCostUP) = true; 
								fg.ColHidden(W_LaborCostAmt) = true; 
								fg.ColHidden(W_ExpUP) = true; 
								fg.ColHidden(W_ExpAmt) = true; 
								fg.ColHidden(W_UP) = true; 
								fg.ColHidden(W_Amt) = true; 
						}
						else
						{
								fg.ColHidden(W_Qty) = false; 
								fg.ColHidden(W_RawMtrlCostUP) = false; 
								fg.ColHidden(W_RawMtrlCostAmt) = false; 
								fg.ColHidden(W_LaborCostUP) = false; 
								fg.ColHidden(W_LaborCostAmt) = false; 
								fg.ColHidden(W_ExpUP) = false; 
								fg.ColHidden(W_ExpAmt) = false; 
								fg.ColHidden(W_UP) = false; 
								fg.ColHidden(W_Amt) = false; 
						}
				break;
				case 4:
						if(chkRaw.value == 'N')
						{
								fg.ColHidden(C_RawMtrlCostAmt) = true; 
								fg.ColHidden(C_LaborCostAmt) = true; 
								fg.ColHidden(C_ExpAmt) = true; 
								fg.ColHidden(W_RawMtrlCostAmt) = true; 
								fg.ColHidden(W_LaborCostAmt) = true; 
								fg.ColHidden(W_ExpAmt) = true; 
								fg.ColHidden(B_RawMtrlCostAmt) = true; 
								fg.ColHidden(B_LaborCostAmt) = true; 
								fg.ColHidden(B_ExpAmt) = true; 
								fg.ColHidden(A_RawMtrlCostAmt) = true; 
								fg.ColHidden(A_LaborCostAmt) = true; 
								fg.ColHidden(A_ExpAmt) = true; 
								fg.ColHidden(ID_RawMtrlCostAmt) = true; 
								fg.ColHidden(ID_LaborCostAmt) = true; 
								fg.ColHidden(ID_ExpAmt) = true; 
						}
						else
						{
								if(    (chkContUP.value == 'Y') ||  (chkWkngUP.value == 'Y')         )
								{
											fg.ColHidden(C_RawMtrlCostAmt) = false; 
											fg.ColHidden(C_LaborCostAmt) = false; 
											fg.ColHidden(C_ExpAmt) = false; 
											fg.ColHidden(W_RawMtrlCostAmt) = false; 
											fg.ColHidden(W_LaborCostAmt) = false; 
											fg.ColHidden(W_ExpAmt) = false; 
											fg.ColHidden(B_RawMtrlCostAmt) = false; 
											fg.ColHidden(B_LaborCostAmt) = false; 
											fg.ColHidden(B_ExpAmt) = false; 
											fg.ColHidden(A_RawMtrlCostAmt) = false; 
											fg.ColHidden(A_LaborCostAmt) = false; 
											fg.ColHidden(A_ExpAmt) = false; 
											fg.ColHidden(ID_RawMtrlCostAmt) = false; 
											fg.ColHidden(ID_LaborCostAmt) = false; 
											fg.ColHidden(ID_ExpAmt) = false; 
								}
								else
								{
											fg.ColHidden(B_RawMtrlCostAmt) = false; 
											fg.ColHidden(B_LaborCostAmt) = false; 
											fg.ColHidden(B_ExpAmt) = false; 
											fg.ColHidden(A_RawMtrlCostAmt) = false; 
											fg.ColHidden(A_LaborCostAmt) = false; 
											fg.ColHidden(A_ExpAmt) = false; 
											fg.ColHidden(ID_RawMtrlCostAmt) = false; 
											fg.ColHidden(ID_LaborCostAmt) = false; 
											fg.ColHidden(ID_ExpAmt) = false; 
								}
						}
				break;
			}
}
</script>
<body>
<!--<gw:data id="dso_search" onreceive="OnDataReceive(this)">
  <xml>
    <dso type="process"  procedure="SP_SEL_kpcs313"  >
      <input>
		  <input bind="txtProject_Pk"/>
		  <input bind="txtPk"/>
     </input>
	 <output>
     	  <output bind="txtPk"/>
		  <output bind="txtCont_Nm"/>
          <output bind="txtOutsrcCo_Cd"/>
          <output bind="txtOutsrcCo_Nm"/>
          <output bind="txtDlvr_Terms"/>
          <output bind="txtCont_Cd"/>
		  <output bind="txtTECPS_ORDERINGCONTTYPE_PK"/>
	  </output>
    </dso>
  </xml>
</gw:data>
-->
<table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
		<tr height="2%">
        			<td>
                    		<fieldset style="padding:0">
                    			<table cellpadding="0" cellspacing="0" width="100%">
                                			<tr>
                                            			<td width="92%"></td>
                                            			<td><gw:icon id="ibtnCancel" img="in" text="Wkng Adj. Dtal Rcpt" styles='width:100%' onclick="" /></td>
                                                        <td width="2%"></td>
                                                        <td><gw:icon id="ibtnCancel" img="in" text="All Exp. Srch" styles='width:100%' onclick="" /></td>
                                                        <td width="2%"></td>
                                                        <td><gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
                                                        <td width="2%"></td>
                                                        <td><gw:imgbtn id="ibtnSearch" img="save" alt="Save" onclick="OnSave()" /></td>
                                                        <td width="2%"></td>
                                                        <td><gw:imgbtn id="ibtnSearch" img="confirm" alt="Confirm" onclick="OnConfirm()" /></td>
                                            </tr>
                                </table>
                                </fieldset>
                    </td>
        </tr>
        <tr height="8%">
        		<td>
                			<table cellpadding="0" cellspacing="0" width="100%" border="1" style="border-collapse: collapse" bordercolor="#00CCFF">
                                        <tr style="background:#C5EFF1" >
                                        			<td align="right" width="10%">Order W. Div.&nbsp;</td>
                                                    <td width="20%"><gw:list id="lstOrderWDiv"   styles='width:100%' /></td>
                                                    <td align="right" width="13%">Cont. Co.&nbsp;</td>
                                                    <td width="29%"><gw:textbox id="txtContCo"   styles='width:100%' /></td>
                                                    <td align="right" width="13%">Net Const. Cost&nbsp;</td>
                                                    <td width="15%"><gw:textbox id="txtNetConstCost"  type="number" format="###,###.##R"  styles='width:100%' /></td>
                                        </tr>
                                        <tr style="background:#C5EFF1" >
                                        			<td align="right" width="">Reg. W. Div.&nbsp;</td>
                                                    <td width=""><gw:list id="lstRegWDiv"   styles='width:100%' /></td>
                                                    <td align="right" width="">Cont. Awd. Amt&nbsp;</td>
                                                    <td width="">
                                                    			<table width="100%" cellpadding="0" cellspacing="0">
                                                                		<tr>
                                                                        			<td width="45%"><gw:textbox id="txtContAwd_Amt" type="number" format="###,###.##R"   styles='width:100%' /></td>
                                                                                    <td  align="right" width="30%">Cont. S/No.&nbsp;</td>
                                                                                    <td width="25%"><gw:textbox id="txtCont_SNo"     styles='width:100%' /></td>
                                                                        </tr>
                                                                </table>
                                                    </td>
                                                    <td align="right" width="">All Exp&nbsp;</td>
                                                    <td width=""><gw:textbox id="txtAllExp"  type="number" format="###,###.##R"  styles='width:100%' /></td>
                                        </tr>
                                         <tr style="background:#C5EFF1" >
                                        			<td align="right" width="">Cont. Type&nbsp;</td>
                                                    <td width=""><gw:list id="lstContType"   styles='width:100%' /></td>
                                                    <td align="right" width="">Order Amt&nbsp;</td>
                                                    <td width="">
                                                    			<table width="100%" cellpadding="0" cellspacing="0">
                                                                		<tr>
                                                                        			<td width="45%"><gw:textbox id="txtOrder _Amt" type="number" format="###,###.##R"   styles='width:100%' /></td>
                                                                                    <td  align="right" width="30%">Cont. Awd. Rate&nbsp;</td>
                                                                                    <td width="25%"><gw:textbox id="txtContAwdRate"  type="number" format="###,###.##R"    styles='width:100%' /></td>
                                                                        </tr>
                                                                </table>
                                                    </td>
                                                    <td align="right" width="">Total&nbsp;</td>
                                                    <td width=""><gw:textbox id="txtTotal"  type="number" format="###,###.##R"  styles='width:100%' /></td>
                                        </tr>
                                        <tr>
                                        			<td align="right" width="">Col. Sel.&nbsp;</td>
                                                    <td colspan="5">
                                                    			<table width="100%" cellpadding="0" cellspacing="0">
                                                                		<tr>
                                                                        			<td width="11%"  align=""><gw:checkbox id="chkLevelCode" value="N" defaultvalue="Y|N" onchange="ShowHide(1)" />Level Code</td>
                                                                                    <td width="10%"  align=""><gw:checkbox id="chkContUP" value="N" defaultvalue="Y|N" onchange="ShowHide(2)" />Cont. U/P</td>
                                                                                    <td width="10%"  align=""><gw:checkbox id="chkWkngUP" value="N" defaultvalue="Y|N" onchange="ShowHide(3)" />Wkng U/P</td>
                                                                                     <td width="14%"  align=""><gw:checkbox id="chkRaw" value="N" defaultvalue="Y|N" onchange="ShowHide(4)" />Raw Mtrl/Lab</td>
                                                                                    <td width="15%"><gw:list id="lstFilter"   styles='width:100%' /></td>
                                                                                    <td width="1%"></td>
                                                                                    <td width="20%"><gw:textbox id="txtSearch"   styles='width:100%' /></td>
                                                                                    <td><gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="" /></td>
                                                                                    <td width="1%"></td>
                                                                                    <td width="17%" align="left"><gw:checkbox id="chkChangeDetail" value="N" defaultvalue="Y|N" onchange="" />Chg Dtal Only</td>
                                                                        </tr>
                                                                </table>
                                                    </td>
                                        </tr>
                            </table>
                </td>
        </tr>
        <tr height="90%">
        			<td colspan="" width="100%" >
                                    <gw:grid id="Grid_Detail" 
                                    header="0.Wkng Item No.|1.Details Level Code|2.Details Level Seq. No.|3.Name|4.Standard|5.Weight|6.Unit|7.Q'ty|8.Raw Mtrl. Cost U/P|9.Raw Mtrl. Cost Amt|10.Labor Cost U/P|11.Labor Cost Amt|12.Exp. U/P|13.Exp. Amt|14.U/P|15.Amt|16.Q'ty|17.Raw Mtrl. Cost U/P|18.Raw Mtrl. Cost Amt|19.Labor Cost U/P|20.Labor Cost Amt|21.Exp. U/P|22.Exp. Amt|23.U/P|24.Amt|25.Q'ty|26.Raw Mtrl. Cost U/P|27.Raw Mtrl. Cost Amt|28.Labor Cost U/P|29.Labor Cost Amt|30.Exp. U/P|31.Exp. Amt|32.U/P|33.Amt|34.Q'ty|35.Raw Mtrl. Cost U/P|36.Raw Mtrl. Cost Amt|37.Labor Cost U/P|38.Labor Cost Amt|39.Exp. U/P|40.Exp. Amt|41.U/P|42.Amt|43.Q'ty|44.Raw Mtrl. Cost U/P|45.Raw Mtrl. Cost Amt|46.Labor Cost U/P|47.Labor Cost Amt|48.Exp. U/P|49.Exp. Amt|50.U/P|51.Amt"
                                    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                                    aligns  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                    defaults="|||||||||||||||||||||||||||||||||||||||||||||||||||" 
                                   editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
                                    widths="1500|1700|2000|2500|1500|1500|1500|1500|1500|2000|1500|1500|2000|1500|1500|2000|1700|2000|2500|1500|1500|1500|1500|1500|2000|1500|1500|2000|1500|1500|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000"
                                    styles="width:100%; height:100%" 
                                    sorting="T" 
                                    oncelldblclick="" />
                  </td>
        </tr>

</table>
<gw:textbox id="txtPk" styles='width:100%;display:none' />
<gw:textbox id="txtProject_Pk" styles='width:100%;display:none' />

</body>
</html>
