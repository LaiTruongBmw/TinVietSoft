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
	ID_Amt = 51,
	
	VAT_Rate = 52,
	VAT_Amt = 53,
	pk = 54,
	confirm = 55,
	total = 56
	;
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
	var p_Code = "<%=Request.querystring("Code")%>"; 
	var p_Contract_No = "<%=Request.querystring("Contract_No")%>"; 
	txtCode.SetDataText(p_Code);
	txtPk.SetDataText(p_pk);
	txtProject_Pk.SetDataText(p_Project_Pk);
	txtContract_No.SetDataText(p_Contract_No);
	dso_Master.Call();
	Grid_Detail.GetGridControl().FrozenCols =  C_Qty;

}
//===================================================================================
function BindingDataList()
{
	    //VAT Rate
			<%=ESysLib.SetGridColumnComboFormat("Grid_Detail",52,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'TPS0017' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;
			//
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
		fg.MergeCol(VAT_Rate) = true
		fg.Cell(0, 0, VAT_Rate, 1, VAT_Rate) = "VAT Rate"
		fg.MergeCol(VAT_Amt) = true
		fg.Cell(0, 0, VAT_Amt, 1, VAT_Amt) = "VAT Amount"
		fg.MergeCol(total) = true
		fg.Cell(0, 0, total, 1, total) = "Total"
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
//======================================================================================
function OnDataReceive(obj)
{
        switch(obj.id)
       {
                case 'dso_Master':
                        dso_detail.Call('SELECT');
              break;  
              case 'dso_detail':
                        MerGrid();
                       SetBkGrColor(); 
                       dso_OrderAmt.Call();
              break;
              case 'dso_OrderAmt':
                    dso_ProcessSubcontract_Amt.Call();
              break;
       } 
}
//======================================================================================
function OnSave()
{
        dso_detail.Call();
}
//======================================================================================
function OnConfirm1()
{
           //if(confirm('Are you sure you want to delete ?'))  alert('');
            //   {  
		                Grid_Detail.SetGridText(Grid_Detail.row, confirm,'confirm');
	                    dso_detail.Call();
	        //    } 
}
//======================================================================================
function OnCalc()
{
        //=================Contract======================
        var Ctr_Qty = Number(Grid_Detail.GetGridData(Grid_Detail.row, C_Qty));
        var Ctr_MtrlUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, C_RawMtrlCostUP));
       var Ctr_LaborUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, C_LaborCostUP));
       var Ctr_ExpUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, C_ExpUP));
       
       var Ctr_MtrlAmt = 0;
       var Ctr_LaborAmt = 0;
       var Ctr_ExpAmt = 0;
       var Ctr_UP = 0;
       var Ctr_Amt = 0;
       
       Ctr_MtrlAmt = Math.round(Ctr_Qty * Ctr_MtrlUP);
       Ctr_LaborAmt = Math.round(Ctr_Qty * Ctr_LaborUP);
       Ctr_ExpAmt = Math.round(Ctr_Qty * Ctr_ExpUP);
       Ctr_UP = Ctr_MtrlUP + Ctr_LaborUP + Ctr_ExpUP;
       Ctr_Amt = Ctr_MtrlAmt + Ctr_LaborAmt + Ctr_ExpAmt;
       
       Grid_Detail.SetGridText(Grid_Detail.row, C_RawMtrlCostAmt, Ctr_MtrlAmt);
       Grid_Detail.SetGridText(Grid_Detail.row, C_LaborCostAmt, Ctr_LaborAmt);
       Grid_Detail.SetGridText(Grid_Detail.row, C_ExpAmt, Ctr_ExpAmt);
       Grid_Detail.SetGridText(Grid_Detail.row, C_UP, Ctr_UP);
       Grid_Detail.SetGridText(Grid_Detail.row, C_Amt, Ctr_Amt);
       //=================Working======================
       var Wkg_Qty = Number(Grid_Detail.GetGridData(Grid_Detail.row, W_Qty));
       var Wkg_RawMtrlUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, W_RawMtrlCostUP));
       var Wkg_LaborUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, W_LaborCostUP));
       var Wkg_ExpUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, W_ExpUP));
       
       var Wkg_MtrlAmt = 0;
       var Wkg_LaborAmt = 0;
       var Wkg_ExpAmt = 0;
       var Wkg_UP = 0;
       var Wkg_Amt = 0;
       
       Wkg_MtrlAmt = Wkg_Qty * Wkg_RawMtrlUP;
       Wkg_LaborAmt = Wkg_Qty * Wkg_LaborUP;
       Wkg_ExpAmt = Wkg_Qty * Wkg_ExpUP;
       Wkg_UP = Wkg_RawMtrlUP + Wkg_LaborUP + Wkg_ExpUP;
       Wkg_Amt = Wkg_MtrlAmt + Wkg_LaborAmt + Wkg_ExpAmt;
       
       Grid_Detail.SetGridText(Grid_Detail.row, W_RawMtrlCostAmt, Wkg_MtrlAmt);
       Grid_Detail.SetGridText(Grid_Detail.row, W_LaborCostAmt, Wkg_LaborAmt);
       Grid_Detail.SetGridText(Grid_Detail.row, W_ExpAmt, Wkg_ExpAmt);
       Grid_Detail.SetGridText(Grid_Detail.row, W_UP, Wkg_UP);
       Grid_Detail.SetGridText(Grid_Detail.row, W_Amt, Wkg_Amt);
       //=================Before======================
       var Bf_Qty = Number(Grid_Detail.GetGridData(Grid_Detail.row, B_Qty));
       var Bf_MtrlCostUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, B_RawMtrlCostUP));
       var Bf_LaborCostUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, B_LaborCostUP));
       var Bf_ExpUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, B_ExpUP));
       
       var Bf_MtrlAmt = 0;
       var Bf_LaborAmt = 0;
       var Bf_ExpAmt = 0;
       var Bf_UP = 0;
       var Bf_Amt = 0;
       
       Bf_MtrlAmt = Math.round(Bf_Qty * Bf_MtrlCostUP);
       Bf_LaborAmt = Math.round(Bf_Qty * Bf_LaborCostUP);
       Bf_ExpAmt = Math.round(Bf_Qty * Bf_ExpUP);
       Bf_UP = Bf_MtrlCostUP + Bf_LaborCostUP + Bf_ExpUP;
       Bf_Amt = Bf_MtrlAmt + Bf_LaborAmt + Bf_ExpAmt;
       
       Grid_Detail.SetGridText(Grid_Detail.row, B_RawMtrlCostAmt, Bf_MtrlAmt);
       Grid_Detail.SetGridText(Grid_Detail.row, B_LaborCostAmt, Bf_LaborAmt);
       Grid_Detail.SetGridText(Grid_Detail.row, B_ExpAmt, Bf_ExpAmt);
       Grid_Detail.SetGridText(Grid_Detail.row, B_UP, Bf_UP);
       Grid_Detail.SetGridText(Grid_Detail.row, B_Amt, Bf_Amt);
       //=================After======================
       var Af_Qty = Number(Grid_Detail.GetGridData(Grid_Detail.row, A_Qty));
       var Af_MtrlCostUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, A_RawMtrlCostUP));
       var Af_LaborCostUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, A_LaborCostUP));
       var Af_ExpUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, A_ExpUP));
       
       var Af_MtrlCostAmt = 0;
       var Af_LaborCostAmt = 0;
       var Af_ExpAmt = 0;
       var Af_UP = 0;
       var Af_Amt = 0;
       
       Af_MtrlCostAmt = Math.round(Af_Qty * Af_MtrlCostUP);
       Af_LaborCostAmt = Math.round(Af_Qty * Af_LaborCostUP);
       Af_ExpAmt = Math.round(Af_Qty * Af_ExpUP);
       Af_UP = Af_MtrlCostUP + Af_LaborCostUP + Af_ExpUP;
       Af_Amt = Af_MtrlCostAmt + Af_LaborCostAmt + Af_ExpAmt;
       
       Grid_Detail.SetGridText(Grid_Detail.row, A_RawMtrlCostAmt, Af_MtrlCostAmt);
       Grid_Detail.SetGridText(Grid_Detail.row, A_LaborCostAmt, Af_LaborCostAmt);
       Grid_Detail.SetGridText(Grid_Detail.row, A_ExpAmt, Af_ExpAmt);
       Grid_Detail.SetGridText(Grid_Detail.row, A_UP, Af_UP);
       Grid_Detail.SetGridText(Grid_Detail.row, A_Amt, Af_Amt);
        //=================Incr/Decr======================
       var IrDr_Qty = Number(Grid_Detail.GetGridData(Grid_Detail.row, ID_Qty));
       var IrDr_MtrlCostUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, ID_RawMtrlCostUP));  
       var IrDr_LaborCostUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, ID_LaborCostUP));  
       var IrDr_ExpUP = Number(Grid_Detail.GetGridData(Grid_Detail.row, ID_ExpUP));  
       
       var IrDr_MtrlAmt  = 0;
       var IrDr_LaborAmt  = 0;
       var IrDr_ExpAmt  = 0;
       var IrDr_UP  = 0;
       var IrDr_Amt  = 0;
       
       IrDr_MtrlAmt = Math.round(IrDr_Qty * IrDr_MtrlCostUP);
       IrDr_LaborAmt = Math.round(IrDr_Qty * IrDr_LaborCostUP);
       IrDr_ExpAmt = Math.round(IrDr_Qty * IrDr_ExpUP);
       IrDr_UP = IrDr_MtrlCostUP + IrDr_LaborCostUP + IrDr_ExpUP;
       IrDr_Amt = IrDr_MtrlAmt + IrDr_LaborAmt + IrDr_ExpAmt;
       
       Grid_Detail.SetGridText(Grid_Detail.row, ID_RawMtrlCostAmt, IrDr_MtrlAmt);
       Grid_Detail.SetGridText(Grid_Detail.row, ID_LaborCostAmt, IrDr_LaborAmt);
       Grid_Detail.SetGridText(Grid_Detail.row, ID_ExpAmt, IrDr_ExpAmt);
       Grid_Detail.SetGridText(Grid_Detail.row, ID_UP, IrDr_UP);
       Grid_Detail.SetGridText(Grid_Detail.row, ID_Amt, IrDr_Amt);
       //=================VAT======================
       var _VAT_Rate = Number(Grid_Detail.GetGridData(Grid_Detail.row, VAT_Rate));
       _VAT_Amt = 0;
       _VAT_Amt = Math.round(Wkg_Amt * _VAT_Rate / 100);
       Grid_Detail.SetGridText(Grid_Detail.row, VAT_Amt, _VAT_Amt);
}

function SetBkGrColor()
{
		var fg=Grid_Detail.GetGridControl(); 	
		for (i = 2; i < fg.Rows; i++)
		{
					Grid_Detail.SetCellBgColor(i,WkngItemNo,i, C_Qty, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,C_RawMtrlCostAmt,i, C_RawMtrlCostAmt, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,C_LaborCostAmt,i, C_LaborCostAmt, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,C_ExpAmt,i, W_Qty, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,W_RawMtrlCostAmt,i, W_RawMtrlCostAmt, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,W_LaborCostAmt,i, W_LaborCostAmt, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,W_ExpAmt,i, B_Qty, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,B_RawMtrlCostAmt,i, B_RawMtrlCostAmt, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,B_LaborCostAmt,i, B_LaborCostAmt, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,B_ExpAmt,i, A_Qty, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,A_RawMtrlCostAmt,i, A_RawMtrlCostAmt, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,A_LaborCostAmt,i, A_LaborCostAmt, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,A_ExpAmt,i, ID_Qty, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,ID_RawMtrlCostAmt,i, ID_RawMtrlCostAmt, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,ID_LaborCostAmt,i, ID_LaborCostAmt, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,ID_ExpAmt,i, ID_Amt, 0xEDEDED);
					Grid_Detail.SetCellBgColor(i,VAT_Amt,i, total, 0xEDEDED);
		}
}
function OnSearch()
{
        dso_detail.Call('SELECT');
}


</script>
<body>
<gw:data id="dso_Master" onreceive="OnDataReceive(this)">
  <xml>
    <dso type="process"  procedure="sp_sel_311_4status3_master"  >
      <input>
		  <input bind="txtProject_Pk"/>
		  <input bind="txtPk"/>
		 <input  bind="txtCode" /> 
		<input  bind="txtContract_No" /> 
     </input>
	 <output>
     	  <output bind="txtOrderWDiv"/>
		  <output bind="txtRegWDiv"/>
          <output bind="txtContType"/>
          <output bind="txtContCo"/>
          <output bind="txtCont_SNo"/>
          <output bind="txtNetConstCost"/>
	  </output>
    </dso>
  </xml>
</gw:data>

<gw:data id="dso_OrderAmt" onreceive="OnDataReceive(this)">
  <xml>
    <dso type="process"  procedure="ec111.sp_sel_311_4status3_order"  >
      <input>
		  <input bind="txtProject_Pk"/>
		  <input bind="txtPk"/>
     </input>
	 <output>
          <output bind="txtOrder_Amt"/>
	  </output>
    </dso>
  </xml>
</gw:data>

 <gw:data id="dso_detail" onreceive="OnDataReceive(this)"> 
		<xml> 
			<dso id="1" type="grid"    function="sp_sel_311_4status3_detail" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56"   procedure="sp_upd_311_4status3_detail"> 
				<input bind="Grid_Detail">                    
					<input bind="txtProject_Pk"/>
		            <input bind="txtPk"/>
		           <input  bind="txtCode" />  
		           <input  bind="txtContract_No" /> 
				</input> 
				<output bind="Grid_Detail" /> 
			</dso> 
		</xml> 
	</gw:data>
	
<gw:data id="dso_ProcessSubcontract_Amt" onreceive="OnDataReceive(this)">
  <xml>
    <dso type="process"  procedure="sp_sel_311_subcont"  >
      <input>
		  <input bind="txtProject_Pk"/>
		  <input bind="txtPk"/>
     </input>
	 <output>
          <output bind="txtRtn"/>
	  </output>
    </dso>
  </xml>
</gw:data>	
<table cellpadding="0" cellspacing="0" style="width:100%;height:100%">
		<tr height="2%">
        			<td>
                    		<fieldset style="padding:0">
                    			<table cellpadding="0" cellspacing="0" width="100%">
                                			<tr>
                                            			<td width="96%"></td>
                                                        <td><gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
                                                        <td width="2%"></td>
                                                        <td><gw:imgbtn id="ibtnSearch" img="save" alt="Save" onclick="OnSave()" /></td>
                                                        <td width="2%"></td>
                                                        <td><gw:imgbtn id="ibtnSegarch" img="confirm" alt="Confirm" onclick="OnConfirm1()" /></td>
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
                                                    <td width="20%"><gw:textbox id="txtOrderWDiv"   styles='width:100%' /></td>
                                                    <td align="right" width="13%">Cont. Co.&nbsp;</td>
                                                    <td width="29%"><gw:textbox id="txtContCo"   styles='width:100%' /></td>
                                                    <td align="right" width="13%">Net Const. Cost&nbsp;</td>
                                                    <td width="15%"><gw:textbox id="txtNetConstCost"  type="number" format="###,###.##R"  styles='width:100%' /></td>
                                        </tr>
                                        <tr style="background:#C5EFF1" >
                                        			<td align="right" width="">Reg. W. Div.&nbsp;</td>
                                                    <td width=""><gw:textbox id="txtRegWDiv"   styles='width:100%' /></td>
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
                                                    <td width=""><gw:textbox id="txtContType"   styles='width:100%' /></td>
                                                    <td align="right" width="">Order Amt&nbsp;</td>
                                                    <td width="">
                                                    			<table width="100%" cellpadding="0" cellspacing="0">
                                                                		<tr>
                                                                        			<td width="45%"><gw:textbox id="txtOrder_Amt" type="number" format="###,###.##R"   styles='width:100%' /></td>
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
                                                                                    <td style="display:none"><gw:imgbtn id="ibtnSearch" img="search" alt="Search" onclick="" /></td>
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
                                    header="0.Wkng Item No.|1.Details Level Code|2.Details Level Seq. No.|3.Name|4.Standard|5.Weight|6.Unit|7.Q'ty|8.Raw Mtrl. Cost U/P|9.Raw Mtrl. Cost Amt|10.Labor Cost U/P|11.Labor Cost Amt|12.Exp. U/P|13.Exp. Amt|14.U/P|15.Amt|16.Q'ty|17.Raw Mtrl. Cost U/P|18.Raw Mtrl. Cost Amt|19.Labor Cost U/P|20.Labor Cost Amt|21.Exp. U/P|22.Exp. Amt|23.U/P|24.Amt|25.Q'ty|26.Raw Mtrl. Cost U/P|27.Raw Mtrl. Cost Amt|28.Labor Cost U/P|29.Labor Cost Amt|30.Exp. U/P|31.Exp. Amt|32.U/P|33.Amt|34.Q'ty|35.Raw Mtrl. Cost U/P|36.Raw Mtrl. Cost Amt|37.Labor Cost U/P|38.Labor Cost Amt|39.Exp. U/P|40.Exp. Amt|41.U/P|42.Amt|43.Q'ty|44.Raw Mtrl. Cost U/P|45.Raw Mtrl. Cost Amt|46.Labor Cost U/P|47.Labor Cost Amt|48.Exp. U/P|49.Exp. Amt|50.U/P|51.Amt|VAT Rate|VAT Amount|_pk|_Confirm|Total"
                                    format="0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|1|0|0|1" 
                                    aligns  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                    defaults="||||||||||||||||||||||||||||||||||||||||||||||||||||||||" 
                                   editcol ="0|0|0|0|0|0|0|0|1|0|1|0|1|0|0|0|0|1|0|1|0|1|0|0|0|0|1|0|1|0|1|0|0|0|0|1|0|1|0|1|0|0|0|0|1|0|1|0|1|0|0|0|1|0|0|0|0" 
                                    widths="1500|1700|2000|2500|1500|1500|1500|1500|1500|2000|1500|1500|2000|1500|1500|2000|1700|2000|2500|1500|1500|1500|1500|1500|2000|1500|1500|2000|1500|1500|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|1500|2000|0|0|2000"
                                    styles="width:100%; height:100%" 
                                    sorting="T" 
                                    onafteredit="OnCalc()" />
                  </td>
        </tr>

</table>
<gw:textbox id="txtPk" styles='width:100%;display:none' />
<gw:textbox id="txtProject_Pk" styles='width:100%;display:none' />
<gw:textbox id="txtCode" styles='width:100%;display:none' />
<gw:textbox id="txtContract_No" styles='width:100%;display:none' />

<gw:textbox id="txtRtn" styles='width:100%;display:none' />

</body>
</html>
