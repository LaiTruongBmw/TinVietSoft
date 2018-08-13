<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
    <title></title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>

var CONS_LEVEL						= 0,
	CONS_CODE						= 1,
	CONS_NAME						= 2,
	CONS_STAN						= 3,
	CONS_UNIT						= 4,
	CONS_CCY						= 5,
	CONS_QTY						= 6,
	CONS_RAW						= 7,
	CONS_LABOR						= 8,
	CONS_EXP_UP						= 9,
	CONS_LABOR_UNIT_PRICE			= 10,
	CONS_AMT						= 11,
	CONS_ORDER_PK					= 12,
	CONS_ORDER_CODE					= 13,
	CONS_ORDER_NAME					= 14,
	CONS_EXEC_YN					= 15,
	CONS_DIR_MGT					= 16,
	CONS_BUDGET_PK					= 17,
	CONS_BUDGET_CODE				= 18,
	CONS_STAN_CODE					= 19,
	CONS_CALC_BASIC					= 20,
	CONS_ORDER_STA					= 21,
	CONS_RSLT_YN					= 22,
	CONS_PROJECT_PK					= 23,
	CONS_TECPS_UNDERTAKECTRTBASC_PK	= 24,
	CONS_UNDERTAKESEQ				= 25,
	CONS_TECPS_PERFORMBUDGETBASC_PK	= 26,
	CONS_BOOKING_AMT				= 27,
	CONS_SEQ_NO						= 28,
	CONS_NUM						= 29,
	CONS_PARENT_PK					= 30,
	CONS_PARENT_AMT					= 31,
	CONS_LEVEL_NUM					= 32,
	CONS_PK							= 33,
	CONS_LEVEL_PK					= 34,
	CONS_TECPS_ITEM_PK              = 35;
	
var 
G_Seq_No=0,
G_Level=1,
G_Level_Code=2,
G_Wkng_Seq_No=3,
G_Wkng_Dtals_No=4,
G_Dtals_Journal_No=5,
G_Dtals_Descrip=6,
G_Currency=7,
G_Name=8,
G_Standard=9,
G_Unit=10,
G_Qty=11,
G_Raw_Mtrl_Cost_U_P=12,
G_Raw_Mtrl_Cost_Amt=13,
G_Labor_Cost_U_P=14,
G_Labor_Cost_Amt=15,
G_Exp_Unit_Price=16,
G_Exp_Amt=17,
G_Unit_Price=18,//total unit price
G_Amount=19,// total amt
G_Order_Work_Div_Code=20,
G_Exec_Y_N=21,
G_Dir_Mgt_Outsrc_Descrip=22,
G_Bdgt_Item_Code=23,
G_Standard_Code=24,
G_Legal_O_H_Expns_Excl_Subj=25,
G_Sfty_Cost_Non_Appl_Items=26,
G_Calc_Basis=27,
G_project_pk=28,
G_description_type=29,
G_work_division_pk=30,
G_PK=31,
G_B_Raw_Mtrl_Cost_Amt=32,
G_B_Labor_Cost_Amt=33,
G_B_Exp_Amt=34,
G_B_Unit_Price=35,//book amt ,total unit price
G_B_Amount=36;//book total amt

function BodyInit()
{
	System.Translate(document);
    BindingDataList();
}

function BindingDataList()
{
	//commancode chu duoc cap nhat bi loi ->vao file word ghi chu xem co bkup de do
}

function MergeGrid()
{
	if (grdCONS.rows < 2)
	{		
		grdCONS.AddRow();
	}
	
	var fg = grdCONS.GetGridControl();
	fg.FixedRows = 2
	fg.MergeCells = 5

	fg.MergeCol(CONS_PK) = true
	fg.Cell(0, 0, CONS_PK, 1, CONS_PK) = "PK";

	fg.MergeCol(CONS_LEVEL_PK) = true
	fg.Cell(0, 0, CONS_LEVEL_PK, 1, CONS_LEVEL_PK) = "Level_PK"

	fg.MergeCol(CONS_LEVEL) = true
	fg.Cell(0, 0, CONS_LEVEL, 1, CONS_LEVEL) = "Level"

	fg.MergeCol(CONS_CODE) = true
	fg.Cell(0, 0, CONS_CODE, 1, CONS_CODE) = "Code"

	fg.MergeCol(CONS_NAME) = true
	fg.Cell(0, 0, CONS_NAME, 1, CONS_NAME) = "Name"

	fg.MergeCol(CONS_STAN) = true
	fg.Cell(0, 0, CONS_STAN, 1, CONS_STAN) = "Standard"	
	
	fg.MergeRow(0) = true
	fg.Cell(0, 0, CONS_UNIT, 0, CONS_AMT)	= "Working(Changed)"
	fg.Cell(0, 1, CONS_UNIT, 1) 			= "Unit"
	fg.Cell(0, 1, CONS_CCY, 1 ) 			= "Currency"
	fg.Cell(0, 1, CONS_QTY, 1) 				= "Qty"
	fg.Cell(0, 1, CONS_RAW, 1) 				= "Raw Mtrl. Cost U/P"
	fg.Cell(0, 1, CONS_LABOR, 1) 			= "Labor Cost U/P"
	fg.Cell(0, 1, CONS_EXP_UP, 1) 			= "Exp. U/P"
	fg.Cell(0, 1, CONS_LABOR_UNIT_PRICE, 1) = "Unit Price"
	fg.Cell(0, 1, CONS_AMT, 1) 				= "Amount"

	fg.Cell(0, 0, CONS_ORDER_PK, 0, CONS_ORDER_NAME) = "Order W. Div." 
	fg.Cell(0, 1, CONS_ORDER_PK, 1) 	= "PK"
	fg.Cell(0, 1, CONS_ORDER_CODE, 1) 	= "Code"
	fg.Cell(0, 1, CONS_ORDER_NAME, 1 ) 	= "Name"
	
	fg.MergeCol(CONS_EXEC_YN) = true
	fg.Cell(0, 0, CONS_EXEC_YN, 1, CONS_EXEC_YN) = "Exec. (Y/N)"
	
	fg.MergeCol(CONS_DIR_MGT) = true
	fg.Cell(0, 0, CONS_DIR_MGT, 1, CONS_DIR_MGT) = "Dir. Mgt Outsrc."
	
	fg.MergeCol(CONS_BUDGET_PK) = true
	fg.Cell(0, 0, CONS_BUDGET_PK, 1, CONS_BUDGET_PK) = "Budget_PK"

	fg.MergeCol(CONS_BUDGET_CODE) = true
	fg.Cell(0, 0, CONS_BUDGET_CODE, 1, CONS_BUDGET_CODE) = "Budget Code"
	
	fg.MergeCol(CONS_STAN_CODE) = true
	fg.Cell(0, 0, CONS_STAN_CODE, 1, CONS_STAN_CODE) = "Standard Code"
	
	fg.MergeCol(CONS_CALC_BASIC) = true
	fg.Cell(0, 0, CONS_CALC_BASIC, 1, CONS_CALC_BASIC) = "Calc. Basic"
	
	fg.MergeCol(CONS_ORDER_STA) = true
	fg.Cell(0, 0, CONS_ORDER_STA, 1, CONS_ORDER_STA) = "Order Status"
	
	fg.MergeCol(CONS_RSLT_YN) = true
	fg.Cell(0, 0, CONS_RSLT_YN, 1, CONS_RSLT_YN) = "A. Rslt Rcpt Y/N"				

	fg.MergeCol(CONS_PROJECT_PK) = true
	fg.Cell(0, 0, CONS_PROJECT_PK, 1, CONS_PROJECT_PK) = "PROJECT_PK"

	fg.MergeCol(CONS_TECPS_UNDERTAKECTRTBASC_PK) = true
	fg.Cell(0, 0, CONS_TECPS_UNDERTAKECTRTBASC_PK, 1, CONS_TECPS_UNDERTAKECTRTBASC_PK) = "TECPS_UNDERTAKECTRTBASC_PK"

	fg.MergeCol(CONS_UNDERTAKESEQ) = true
	fg.Cell(0, 0, CONS_UNDERTAKESEQ, 1, CONS_UNDERTAKESEQ) = "UNDERTAKE_SEQ"

	fg.MergeCol(CONS_TECPS_PERFORMBUDGETBASC_PK) = true
	fg.Cell(0, 0, CONS_TECPS_PERFORMBUDGETBASC_PK, 1, CONS_TECPS_PERFORMBUDGETBASC_PK) = "BUDGETMST_PK"

	fg.MergeCol(CONS_BOOKING_AMT) = true
	fg.Cell(0, 0, CONS_BOOKING_AMT, 1, CONS_BOOKING_AMT) = "BOOKING_AMT"

	fg.MergeCol(CONS_SEQ_NO) = true
	fg.Cell(0, 0, CONS_SEQ_NO, 1, CONS_SEQ_NO) = "SEQ"

	fg.MergeCol(CONS_NUM) = true
	fg.Cell(0, 0, CONS_NUM, 1, CONS_NUM) = "NUM"
	
	fg.MergeCol(CONS_PARENT_PK) = true
	fg.Cell(0, 0, CONS_PARENT_PK, 1, CONS_PARENT_PK) = "PARENT_PK"
	
	fg.MergeCol(CONS_PARENT_AMT) = true
	fg.Cell(0, 0, CONS_PARENT_AMT, 1, CONS_PARENT_AMT) = "PARENT_AMT"
	
	fg.MergeCol(CONS_LEVEL_NUM) = true
	fg.Cell(0, 0, CONS_LEVEL_NUM, 1, CONS_LEVEL_NUM) = "LEVEL_NUM"
	
	fg.MergeCol(CONS_TECPS_ITEM_PK) = true
	fg.Cell(0, 0, CONS_TECPS_ITEM_PK, 1, CONS_TECPS_ITEM_PK) = "TECPS_ITEM_PK"

	var ctrl = grdCONS.GetGridControl();
	ctrl.ColAlignment(CONS_QTY)			= 7;
	ctrl.ColAlignment(CONS_RAW)			= 7;
	ctrl.ColAlignment(CONS_LABOR)		= 7;
	ctrl.ColAlignment(CONS_EXP_UP)		= 7;
	ctrl.ColAlignment(CONS_LABOR_UNIT_PRICE) = 7;
	ctrl.ColAlignment(CONS_AMT)			= 7;
	ctrl.ColAlignment(CONS_CALC_BASIC)  = 7;
	ctrl.ColAlignment(CONS_CCY)			= 2;

	ctrl.ColFormat(CONS_QTY)				= "#,###,###,###,###,###,###,###,###.#########R";
	ctrl.ColFormat(CONS_RAW)				= "#,###,###,###,###,###,###,###,###.#####R";
	ctrl.ColFormat(CONS_LABOR)				= "#,###,###,###,###,###,###,###,###.#####R";
	ctrl.ColFormat(CONS_EXP_UP)				= "#,###,###,###,###,###,###,###,###.#####R";
	ctrl.ColFormat(CONS_LABOR_UNIT_PRICE)	= "#,###,###,###,###,###,###,###,###.#####R";
	ctrl.ColFormat(CONS_AMT)				= "#,###,###,###,###,###,###,###,###";
	ctrl.ColFormat(CONS_CALC_BASIC)			= "#,###,###,###,###,###,###,###,###.##R";
}

function OnPopUp(obj)
{
	switch(obj)
	{
		case 'Project':
			var fpath = System.RootURL + "/form/61/04/61040020_popup_1.aspx";
			var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
			if(aValue != null)
			{
				txtProjectPk.text = aValue[0];
				txtProject_Cd.text = aValue[1];
				txtProject_Nm.text = aValue[2];  
				dso_BudgetNo.Call("SELECT");
			} 
		break;
		
		case 'Work_Division':
			var fpath = System.RootURL + "/form/61/04/61040040_popup_Work_Breakdown.aspx";
			var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
			if(aValue != null)
			{
				txtWorkDivision_Pk.text = aValue[2];
				txtWorkDivision_Cd.text = aValue[0];
				txtWorkDivision_Nm.text = aValue[1];  
			} 
		break;
		case 'Description':
			var path = System.RootURL + '/form/61/04/61040010_popup_1.aspx?code=TPS0027';
			var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
			
			if (object != null )
			{
			 //lstDescription.SetDataText(object[1]);
			}
		break;
	} 
}

function OnSearch()
{
	if(validate())
	{
		dso_top.Call("SELECT");
	}
}

function OnVerify()
{
	if (grdCONS.rows > 2)
	{
		//grdCONS.SetAllRowStatusModify();
		dso_grdCONS.Call();
	}
}

function OnDownload()
{
	var url =System.RootURL + '/form/61/04/61040040_Excel_Upload_1.aspx?p_project_pk=' + txtProjectPk.text + '&p_budget_pk=' + lstBudgetNo.value;
	System.OpenTargetPage( url , 'newform' );
} 

function clearFileInputField(tagId) 
{
	document.getElementById(tagId).innerHTML = document.getElementById(tagId).innerHTML;
}

function validate()
{
	if(txtProjectPk.text == '')
	{
		alert('Please select Project !!');
		return false;
	}
	return true;
}


function CalcBalane()
{
    var _Sum_ContAmt = 0;
    var _Trans_Amt = 0;
    var _Balance = 0;
    var _Sum_BookAmt_Top = 0;                
    
	for ( i = 2; i < grdCONS.rows; i++)
	{
		if (grdCONS.GetGridData(i, CONS_LEVEL_PK) != '')
			_Sum_ContAmt += Math.round(Number(grdCONS.GetGridData(i, CONS_AMT)));
	}	
    txtBudgetAMT_Total.text = _Sum_ContAmt;
	
    if (Grid_Top.rows == 2)
    {
        _Trans_Amt = Number(Grid_Top.GetGridData(Grid_Top.rows-1, 2));
        _Balance = Math.round(_Trans_Amt - _Sum_ContAmt);
    }
    else if (Grid_Top.rows > 2)
    {
        for( j = 1; j < Grid_Top.rows; j++)
        {
            _Sum_BookAmt_Top += Math.round(Number(Grid_Top.GetGridData(j, 5)));
        }
        _Balance = Math.round(_Sum_BookAmt_Top - _Sum_ContAmt);
    }
    txtBalance.text = _Balance;
}

function OnUpload()
{
	if (validate())
	{ 
	    var fl = document.getElementById("idtext").value; 
        
		var excel = new ActiveXObject("Excel.Application");
		var excel_file  = excel.Workbooks.Open(fl);
		
		var excel_sheet = excel.Worksheets("Sheet1");
		var maxRow    = excel.Worksheets("Sheet1").UsedRange.Rows.Count;
		
		var lrow, lcol, data
		var lcol = 1;
        var cur_row = 0;
		for (lrow = 4; lrow <= maxRow ; lrow++) 
		{			
			grdCONS.AddRow();
            cur_row = grdCONS.rows-1;

			for (lcol = 1; lcol < grdCONS.cols; lcol++ )
			{                
				data = excel_sheet.Cells( lrow, lcol ).Value; 
				grdCONS.SetGridText(cur_row, lcol -1, data);
				
				grdCONS.SetGridText(cur_row, CONS_UNDERTAKESEQ, lstBudgetNo.GetText());
				grdCONS.SetGridText(cur_row, CONS_TECPS_PERFORMBUDGETBASC_PK, lstBudgetNo.value);
				grdCONS.SetGridText(cur_row, CONS_PROJECT_PK, txtProjectPk.text);	
                if (grdCONS.GetGridData(cur_row, CONS_TECPS_ITEM_PK) == '')
				{
					grdCONS.SetGridText(cur_row, CONS_LEVEL_NUM, '1');
					grdCONS.SetRowEditable(cur_row, false);
					grdCONS.SetCellBgColor(cur_row, 0, cur_row, grdCONS.cols - 1, Number('0XF4E6E0'));
				}
				else
				{
					grdCONS.SetGridText(cur_row, CONS_LEVEL_NUM, '2');
				}
			}
		}
        
       //excel.Visible = false;
       excel.Application.Quit();

        var p = new ActiveXObject("WScript.Shell");
        p.run("taskkill.exe /F /IM Excel.exe");

//	    excel_sheet.Application.Quit();
//        excel_sheet = "";
	}


	clearFileInputField('uploadFile_div');
	/*
	if(txtProjectPk.text == '' || lstVersion.value == '')
	{
			alert('Please select Version  & Project !!');
			clearFileInputField('uploadFile_div');
	}
	else
	{
		   var fl = document.getElementById("idtext").value; 
			var excel = new ActiveXObject("Excel.Application");
			var excel_file  = excel.Workbooks.Open(fl);
			
			var excel_sheet = excel.Worksheets("Sheet1");
			var maxRow    = excel.Worksheets("Sheet1").UsedRange.Rows.Count
			var lrow, lcol, data
			for(lrow = 2; lrow <= maxRow ; lrow++) 
			{
				Grid_Detail.AddRow();
				for ( lcol = 1; lcol < Grid_Detail.cols; lcol++ )
				{
					data = excel_sheet.Cells( lrow, lcol ).Value; 
					Grid_Detail.SetGridText(Grid_Detail.rows-1, lcol -1, data);
				}    
				Grid_Detail.SetGridText(Grid_Detail.rows-1, 20, lstVersion.value);
				Grid_Detail.SetGridText(Grid_Detail.rows-1, 22, txtProjectPk.text); 
				if(lstField.value=='ALL')
				{
					Grid_Detail.SetGridText(Grid_Detail.rows-1, 31, 'C');
				}
				else
				{
					Grid_Detail.SetGridText(Grid_Detail.rows-1, 31, lstField.value);
				}
			}
	}
	/**/
}
function CheckData(obj)
{
	switch(obj.id)
	{
		case 'grdCONS':	
			var vNum = 0, vLabor = 0, vMat = 0, vExp = 0, vQty = 0;
			var amt = 0, unit_price = 0;
			
			if (obj.col == CONS_QTY || obj.col == CONS_RAW || obj.col == CONS_LABOR ||
				obj.col == CONS_EXP_UP|| obj.col == CONS_LABOR_UNIT_PRICE  || obj.col == CONS_CALC_BASIC )
			{
				vNum = obj.GetGridData(obj.row, obj.col).replace(",", "").replace("\n", "").replace("\r", "");
				
				if (isNaN(vNum))
				{
					obj.SetGridText(obj.row, obj.col, 0);
				}
				
				vMat    = obj.GetGridData(obj.row, CONS_RAW).replace(",", "").replace("\n", "").replace("\r", "");
				vLabor  = obj.GetGridData(obj.row, CONS_LABOR).replace(",", "").replace("\n", "").replace("\r", "");
				vExp    = obj.GetGridData(obj.row, CONS_EXP_UP).replace(",", "").replace("\n", "").replace("\r", "");
				vQty    = obj.GetGridData(obj.row, CONS_QTY).replace(",", "").replace("\n", "").replace("\r", "");
				
				unit_price = Number(vMat) + Number(vLabor) + Number(vExp);
				amt = Number(vQty) * Number(unit_price);

				obj.SetGridText(obj.row, CONS_LABOR_UNIT_PRICE, unit_price);
				obj.SetGridText(obj.row, CONS_AMT, amt);
			}		
		break;
	}
}

function OnClick()
{

}

function OnDBClick()
{
	if (grdCONS.col == CONS_ORDER_CODE || grdCONS.col == CONS_ORDER_NAME)
	{
		if (grdCONS.GetGridData(grdCONS.row, CONS_LEVEL_NUM) == '1') 
		{
			grdCONS.row = -1;
			return;
		}
		
		var path = System.RootURL + "/form/61/04/61040040_Order_W_Div.aspx?p_project_pk=" + txtProjectPk.text;
		var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
		 
		if (object != null)
		{
			grdCONS.SetGridText(grdCONS.row, CONS_ORDER_PK,   object[0]);
			grdCONS.SetGridText(grdCONS.row, CONS_ORDER_CODE, object[1]);
			grdCONS.SetGridText(grdCONS.row, CONS_ORDER_NAME, object[2]);
		}
	}
	else if (grdCONS.col == CONS_BUDGET_CODE)
	{
		if (grdCONS.GetGridData(grdCONS.row, CONS_LEVEL_NUM) == '1') 
		{
			grdCONS.row = -1;
			return;
		}
		
		var fpath = System.RootURL + "/form/61/04/61040040_Budget.aspx?p_project_pk=" + txtProjectPk.text;
		var object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
		if(object != null)
		{
			grdCONS.SetGridText(grdCONS.row, CONS_BUDGET_PK,   object[0]);
			grdCONS.SetGridText(grdCONS.row, CONS_BUDGET_CODE, object[1]);
		}
	}
}

function OnSave()
{
	dso_kpbm00040_item.Call();
}

function OnNew()
{
	if(validate())
	{
		grdCONS.AddRow();
		//grdCONS.SetGridText(grdCONS.rows-1, G_description_type, lstDescription.value); 
		grdCONS.SetGridText(grdCONS.rows-1, G_work_division_pk, txtWorkDivision_Pk.text); 
		grdCONS.SetGridText(grdCONS.rows-1, G_project_pk, txtProjectPk.text); 
	}
}

function OnDataReceive(obj)
{
	switch(obj.id)
	{
		case 'dso_get_exrate':
			OnGetRate();
		break;		
		case 'dso_get_exrate_list':
			Calculator_Book_Amt();
		break;		
		case 'dso_kpbm00040_item':
			for (row = 2; row < grdCONS.rows; row++)
			{
				if (grdCONS.GetGridData(row, CONS_TECPS_ITEM_PK) == '')
				{
					grdCONS.SetRowEditable(row, false);
					grdCONS.SetCellBgColor(row, 0, row, grdCONS.cols - 1, Number('0XF4E6E0'));
				}
			}
			
			MergeGrid();
			CalcBalane();
		break;
		case 'dso_BudgetNo':
			//dso_top.Call("SELECT");
		break;
		case 'dso_top':
			dso_kpbm00040_item.Call("SELECT");
		break;
		case 'dso_grdCONS':
			dso_grdCONS_Pro.Call();
		break;
		case 'dso_grdCONS_Pro':
			OnSearch();
		break;
		
	}
}

function Calculator_Book_Amt()
{
	return;
	var Quantity = Number(grdCONS.GetGridData(grdCONS.row, G_Qty));
	var Mtrl_Cost_U_P = Number(grdCONS.GetGridData(grdCONS.row,G_Raw_Mtrl_Cost_U_P));
	var Labor_Cost_U_P =  Number(grdCONS.GetGridData(grdCONS.row, G_Labor_Cost_U_P));
	var Exp_Unit_Price =  Number(grdCONS.GetGridData(grdCONS.row, G_Exp_Unit_Price));
	var Total_Unit_Price =0;
	
	var B_Mtrl_Cost_U_P = 0;
	var B_Labor_Cost_U_P =  0;
	var B_Exp_Unit_Price =  0;
	var B_Total_Unit_Price =  0;

	var Material_Cost = 0;
	var Labor_Cost = 0; 
	var Expense_Cost = 0; 
	var TotalCost = 0 ;
	
	var B_Material_Cost = 0;
	var B_Labor_Cost = 0; 
	var B_Expense_Cost = 0; 
	var B_TotalCost = 0 ;

	Material_Cost = Math.round(Quantity * Mtrl_Cost_U_P);
	Labor_Cost = Math.round(Quantity * Labor_Cost_U_P); 
	Expense_Cost = Math.round(Quantity * Exp_Unit_Price); 
	
	Total_Unit_Price = Math.round(Mtrl_Cost_U_P + Labor_Cost_U_P + Exp_Unit_Price);//total amt U/Price
	TotalCost = Math.round(Material_Cost + Labor_Cost + Expense_Cost); //total amt
	
	
	
	var ccy = grdCONS.GetGridData(grdCONS.row, G_Currency);		
	var _book_rate = Number(txtBookRate.text);
	lstCCY.value = ccy;
	var tr_rate = Number(txtTR_RATE.GetData());
	//alert(txtbookccy.text+""+_book_rate+""+ccy+""+tr_rate)
	if(txtbookccy.text == 'VND' && _book_rate > 0)
	{
		if(ccy == 'USD')
		{		
			B_Material_Cost = Math.round(Material_Cost * tr_rate)
			B_Labor_Cost = Math.round(Labor_Cost * tr_rate);
			B_Expense_Cost = Math.round(Expense_Cost * tr_rate);
			B_Total_Unit_Price = Math.round(Total_Unit_Price * tr_rate);
			B_TotalCost = Math.round(TotalCost * tr_rate);	
		}
		else if(ccy == 'VND')
		{
			B_Material_Cost = Math.round(Material_Cost / _book_rate)
			B_Labor_Cost = Math.round(Labor_Cost / _book_rate);
			B_Expense_Cost = Math.round(Expense_Cost / _book_rate);
			B_Total_Unit_Price = Math.round(Total_Unit_Price / _book_rate);//total U/Price
			B_TotalCost = Math.round(TotalCost / _book_rate);	//total amt
		}
	}  
	else if(txtbookccy.text == 'USD' && _book_rate > 0)
	{
		if(ccy == 'USD')
		{
			B_Material_Cost = Math.round(Material_Cost)
			B_Labor_Cost = Math.round(Labor_Cost);
			B_Expense_Cost = Math.round(Expense_Cost);
			B_Total_Unit_Price = Math.round(Total_Unit_Price);	//total U/Price
			B_TotalCost = Math.round(TotalCost);	//total amt			
		}
		else if(ccy == 'VND')
		{
			B_Material_Cost = Math.round(Material_Cost / _book_rate)
			B_Labor_Cost = Math.round(Labor_Cost / _book_rate);
			B_Expense_Cost = Math.round(Expense_Cost / _book_rate);
			B_Total_Unit_Price = Math.round(Total_Unit_Price / _book_rate);//total U/Price
			B_TotalCost = Math.round(TotalCost / _book_rate);//total amt	
		}
	}
	//tran.amt
	grdCONS.SetGridText(grdCONS.row, G_Raw_Mtrl_Cost_Amt, Material_Cost);     
	grdCONS.SetGridText(grdCONS.row, G_Labor_Cost_Amt, Labor_Cost);  
	grdCONS.SetGridText(grdCONS.row, G_Exp_Amt, Expense_Cost);    
	grdCONS.SetGridText(grdCONS.row,G_Unit_Price, Total_Unit_Price); 
	grdCONS.SetGridText(grdCONS.row,G_Amount, TotalCost);	
	//book amt
	grdCONS.SetGridText(grdCONS.row, G_B_Raw_Mtrl_Cost_Amt, B_Material_Cost);    
	grdCONS.SetGridText(grdCONS.row, G_B_Labor_Cost_Amt, B_Labor_Cost);  
	grdCONS.SetGridText(grdCONS.row, G_B_Exp_Amt, B_Expense_Cost);  
	grdCONS.SetGridText(grdCONS.row, G_B_Unit_Price, B_Total_Unit_Price); 
	grdCONS.SetGridText(grdCONS.row, G_B_Amount, B_TotalCost); 
}

function Book_Amt()
{
	return;
	OnGetRate();
}

function OnGetRate()
{
	dso_get_exrate_list.Call();	
}

function OnDelete()
{
	if(grdCONS.row !='-1')
	{
		if(confirm("Are you sure you want to delete?"))
		{
			grdCONS.DeleteRow();
			dso_kpbm00040_item.Call();
		} 
	}
	else
	{
		alert("Please,choose data to delete.");
	}
}

function OnShow()
{
	var vendor = document.all("updating_info"); 
 
    if ( vendor.style.display == "none" )
    {
        vendor.style.display = "";
        imgup.src = "../../../system/images/up.gif";
    }
    else
    {
        vendor.style.display = "none";
        imgup.src = "../../../system/images/down.gif";
    }
}
</script>

<body>

<gw:data id="dso_BudgetNo" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="1" type="list" procedure="pm_sel_61040040_budgetno" > 
			<input> 
				<input bind="txtProjectPk" />
			</input> 
			<output>
				<output bind="lstBudgetNo" /> 
			</output>
		</dso> 
	</xml> 
</gw:data>
<gw:data id="dso_kpbm00040_item" onreceive="OnDataReceive(this)">
  <xml>
    <dso id="5" type="grid" parameter="1,2,3,4,5,6,7,8,9,10,11,12,15,16,17,19,20,21,22,23,24,25,26,28,29,30,32,33,34,35" function="pm_sel_61040040_item" procedure="pm_upd_61040040" > 
            <input bind="grdCONS"> 
		  <input bind="txtProjectPk"/>
		  <input bind="lstBudgetNo"/>
      </input>
      <output bind="grdCONS"/>
    </dso>
  </xml>
</gw:data>
<!---------------------------------------------------->
<gw:data id="dso_get_exrate" onreceive="">
        <xml> 
            <dso type="process" procedure="pm_PRO_61040020_GET_RATE"> 
                <input> 
                	 <input bind="txtUSE_DATE" />
                     <input bind="txtCOMPANY"/>
                     <input bind="txtbookccy" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtBookRate"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!---------------------------------------------------->	
<gw:data id="dso_get_exrate_list" onreceive="OnDataReceive(this)">
	<xml> 
		<dso type="process" procedure="pm_get_rate" > 
			<input> 
				 <input bind="txtCOMPANY"/>
				 <input bind="lstCCY"/>
				 <input bind="txtUSE_DATE"/>
			</input>
			<output>
				 <output bind="txtTR_RATE"/>
				 <output bind="txtBK_RATE"/>
		   </output> 
		</dso> 
	</xml> 
</gw:data> 
<gw:data id="dso_grdCONS_Pro" onreceive="OnDataReceive(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="pm_pro_61040040_cons"  > 
			<input> 
				<input bind="txtProjectPk" />
				<input bind="lstBudgetNo" />
			 </input>
			 <output>
				<output bind="txtReturnValue"/>
			 </output>
		</dso> 
	</xml> 
</gw:data>
 
<gw:data id="dso_grdCONS" onreceive="OnDataReceive(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="pm_pro_61040040_verify"  > 
			<input> 
				<input bind="txtProjectPk" />
				<input bind="lstBudgetNo" />
			 </input>
			 <output>
				<output bind="txtReturnValue"/>
			 </output>
		</dso> 
	</xml> 
</gw:data>

<gw:data id="dso_top" onreceive="OnDataReceive(this)"> 
	<xml> 
		<dso id="1" type="grid"  function="pm_sel_61040040"    > 
			<input bind="Grid_Top">                    
				<input bind="txtProjectPk" /> 
			</input> 
			<output bind="Grid_Top" /> 
		</dso> 
	</xml> 
</gw:data>
<!---------------------------------------------------->	
    <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%" border="0">
        <tr style="height: 2%">
            <td width="100%">
            <fieldset>
                <table cellpadding="1" cellspacing="1" width="100%" border="0">
                    <tr>
                        <td align="right" width="10%">
                            <a title="Click here to show Project" href="#" style="text-decoration : none" onClick="OnPopUp('Project')">Project</a></td>
                        <td width="40%">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="30%">
                                        <gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' />
                                    </td>
                                    <td width="70%">
                                        <gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' />
                                    </td>
                                    <td width="">
                                        <gw:textbox id="txtProjectPk" styles='width:100%;display:none' />
                                    </td>
                                    <td>
                                        <gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProjectPk.text='';" />
                                    </td>
                                </tr>                                
                            </table>
                        </td>
                        
                        <td width="20%" align="right">
							Budget Statement No.
                        </td>
                        <td width="20%">
							<gw:list id="lstBudgetNo"  styles='width:100%' onchange="OnSearch()" />
                        </td>
                        <td width="1%">
                            <gw:imgbtn id="btnSearch" img="search" alt="Search" onclick="OnSearch()" />
                        </td>
						<td width="2%">	
							<gw:button id="btnVerify" img="verify" alt="Verify Data" 	onclick="OnVerify()" 	 />
                        </td>
                        <td width="3%" style="display:none">
                            <gw:button id="btnNew" img="new" alt="New" onclick="OnNew()()" />
                        </td>
                        <td width="3%">
                            <gw:button id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                        </td>
                        
                        <td width="3%">
                            <gw:button id="btnSave" img="save" alt="Save" onclick="OnSave()" />
                        </td>
                        <td width="3%">
                            <gw:button id="ibtnConfirm" img="confirm" alt="Confirm" onclick="OnConfirm()" />
                        </td>
						<td width="3%"><gw:button id="ibUprde" img="download" alt="Download Format" 	onclick="OnDownload()" 	 /></td>
                    </tr>
                    <tr>
						<td width="" align="left"><img status="expand" id="imgup" src="../../../system/images/up.gif" style="cursor: hand;"  onclick="OnShow()" /></td>
						<td>
						</td>
						<td align="right">Upload</td>
						<td  align="left" colspan="3">
							<div id="uploadFile_div">
								<input type="file" id="idtext" size="80"  style="width:100%;" onChange="OnUpload()"  title="Upload"/></td>
							</div>
						</td>
						<td colspan="3"></td>
                    </tr>
					<tr style="display:none">
                        <td align="right" width="10%">
                            <a title="Click here to show Work" href="#" style="text-decoration : none" onClick="OnPopUp('Work_Division')">Work Division
                        <td width="42%">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="30%">
                                        <gw:textbox id="txtWorkDivision_Cd" readonly="true" styles='width:100%' />
                                    </td>
                                    <td width="70%">
                                        <gw:textbox id="txtWorkDivision_Nm" readonly="true" styles='width:100%' />
                                    </td>
                                    <td width="">
                                        <gw:textbox id="fd" styles='width:100%;display:none' />
                                    </td>
                                    <td>
                                        
                                    </td>								
                                </tr>                                
                            </table>
						</td>
						<td colspan=10>
							
						</td>	
                    <tr>
                </table>
                </fieldset>
            </td>
        </tr>
		
		<tr style="height: 18%"  id="updating_info">
			<td>
				<gw:grid id="Grid_Top" 
				header="Trans Ccy|Ex.Rate|Trans Amt|Book Ccy|Book Ex.Rate|Book Amt" 
				format="0|1|1|0|1|1"  
				aligns="1|3|3|1|3|3"  
				defaults="|||||"  
				editcol ="1|1|1|1|1|1"  
				widths  ="1000|1500|3000|1000|1500|2000"  
				styles="width:100%; height:100%"   
				sorting="T" />
            </td>
		</tr>
        <tr style="height: 76%">
            <td>
				<gw:grid id="grdCONS" 
				header="0|1|2|3|4|5|6|7|8|9|10|11|_12|13|14|15|16|_17|18|19|20|21|22|_23|_24|_25|_26|_27|_28|_29|_30|_31|_32|_33|_34|_35" 
				format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
				defaults="|||||||||||||||||||||||||||||||" 
				editcol="0|0|0|1|1|1|1|1|1|1|1|0|0|0|0|1|1|1|0|1|1|1|1|1|1|1|1|1|1|1|1|1"
				widths="1000|2000|4000|1000|1000|1000|2000|2000|2000|2000|2000|3000|2000|1500|3000|2500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1200|0"
				styles="width:100%; height:100%" sorting="T" debug="false"
				editcolcolor="true"
				oncellclick="OnClick(this)"
				oncelldblclick="OnDBClick(this)"
				onafteredit="CheckData(this)"
				oncellclick="Book_Amt()"/>
            </td>
			<td style="display:none">				
				<gw:textbox id="txtWorkDivision_Pk" 	styles='display:none' /> 
				<gw:datebox id="txtUSE_DATE" 			styles='display:none' />
				<gw:textbox id="txtBookRate" 			styles='display:none' />
				<gw:textbox id="txtBK_RATE"  			styles='display:none' />
				<gw:textbox id="txtCOMPANY" 			styles='display:none' />
				<gw:list 	id="lstCCY" 				styles='display:none' onchange="OnGetRate()"  />
				<gw:textbox id="txtTR_RATE" 			styles='display:none' />
				<gw:textbox id="txtbookccy" 			styles='display:none' />
				<gw:textbox id="txt_row"  				styles='display:none' />

				<gw:textbox id="txtOrderWork_Pk"  			styles='display:none' />
				<gw:textbox id="lstFilter2"  				styles='display:none' />
				<gw:textbox id="txtFilter2"  				styles='display:none' />
				<gw:textbox id="txtReturnValue"  				styles='display:none' />
			</td>			
        </tr>
		<tr style="height:2%">
			<td>
				<table width="100%" cellpadding="0" cellspacing="0" bordercolor="#00CCFF" style="border-collapse: collapse" border="1">
					<tr style="background:#C5EFF1">
						<td align="right" width="50%">Budget Amount Total&nbsp;</td>
						<td width="20%"><gw:textbox id="txtBudgetAMT_Total" readonly="true" styles='width:100%' type="number" format="###,###.##R" /></td>
						<td align="right" width="10%">Balance&nbsp;</td>
						<td width="20%"><gw:textbox id="txtBalance" readonly="true" styles='width:100%' type="number" format="###,###.##R" /></td>
					</tr>
				</table>
			</td>
		</tr>
    </table>
</body>
</html>
