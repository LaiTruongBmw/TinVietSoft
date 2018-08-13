<!-- #include file="../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head> 
    <title>BCWS Details Registration</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>

var flag = '';
var cons_uder = false;
var level_pk;
var budgetNo;
var arrayBudget;

var EQ_LEVEL						= 0,
	EQ_LEVEL_CODE					= 1,
	EQ_LEVEL_NAME					= 2,
	EQ_STANDARD						= 3,
	EQ_WEIGHT						= 4,
	EQ_UOM							= 5,
	EQ_CCY							= 6,
	EQ_QTY							= 7,
	EQ_UNIT_COST					= 8,
	EQ_AMT							= 9,
	EQ_ORDER_PK						= 10,
	EQ_ORDER_CODE					= 11,
	EQ_ORDER_NAME					= 12,
	EQ_EX_YN						= 13,
	EQ_BUDGET_PK					= 14,
	EQ_BUDGET_CODE					= 15,
	EQ_STANDARD_PBS					= 16,
	EQ_DEVL_TERM					= 17,
	EQ_ORDER_STATUS					= 18,
	EQ_RSLT_YN						= 19,
	EQ_PROJECT_PK					= 20,
	EQ_TECPS_UNDERTAKECTRTBASC_PK	= 21,
	EQ_UNDERTAKESEQ					= 22,
	EQ_TECPS_PERFORMBUDGETBASC_PK	= 23,
	EQ_BOOKING_AMT					= 24,
	EQ_SEQ_NO						= 25,
	EQ_NUM							= 26,	
	EQ_PARENT_PK                    = 27,
	EQ_PARENT_AMT                   = 28,
	EQ_LEVEL_NUM                    = 29,
	EQ_PK							= 30,
	EQ_LEVEL_PK						= 31,
	EQ_TECPS_ITEM_PK                = 32;

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

var CM_PK								= 0,
	CM_NO								= 1,
	CM_DES								= 2,
	CM_LEVEL_PK							= 3,
	CM_LEVEL_CODE						= 4,
	CM_LEVEL_NAME						= 5,
	CM_UOM								= 6,
	CM_QTY								= 7,
	CM_DIRECT_CCY						= 8,
	CM_DIRECT_MM						= 9,
	CM_DIRECT_UNIT_COST					= 10,
	CM_DIRECT_AMT						= 11,
	CM_OUTSRC_CCY						= 12,
	CM_OUTSRC_MM						= 13,
	CM_OUTSRC_UNIT_COST					= 14,
	CM_OUTSRC_AMT						= 15,
	CM_SUM								= 16,
	CM_OUTSITE_PK						= 17,
	CM_OUTSITE_CODE						= 18,
	CM_OUTSITE_NAME						= 19,
	CM_ORDER_STATUS						= 20,
	CM_RSLT_YN							= 21,
	CM_PROJECT_PK						= 22,
	CM_TECPS_UNDERTAKECTRTBASC_PK		= 23,
	CM_UNDERTAKESEQ						= 24,
	CM_TECPS_PERFORMBUDGETBASC_PK		= 25,
	CM_BOOKING_AMT						= 26,
	CM_SEQ_NO							= 27,
	CM_NUM								= 28,
	CM_PARENT_PK					    = 29,
	CM_LEVEL_NUM                        = 30,
	CM_TECPS_ITEM_PK                    = 31;

var OTHER_PK							= 0,
	OTHER_LEVEL_PK						= 1,
	OTHER_LEVEL					        = 2,
	OTHER_LEVEL_CODE					= 3,
	OTHER_LEVEL_NAME					= 4,
	OTHER_SRVC_FLD					    = 5,
	OTHER_STANDARD						= 6,
	OTHER_UNIT							= 7,
	OTHER_CCY							= 8,
	OTHER_QTY							= 9,
	OTHER_UNIT_PRICE					= 10,
	OTHER_AMT							= 11,
	OTHER_ORDER_PK						= 12,
	OTHER_ORDER_CODE					= 13,
	OTHER_ORDER_NAME					= 14,
	OTHER_ORDER_STATUS					= 15,
	OTHER_RSLT_YN						= 16,
	OTHER_PROJECT_PK					= 17,
	OTHER_TECPS_UNDERTAKECTRTBASC_PK	= 18,
	OTHER_UNDERTAKESEQ					= 19,
	OTHER_TECPS_PERFORMBUDGETBASC_PK	= 20,
	OTHER_BOOKING_AMT					= 21,
	OTHER_SEQ_NO						= 22,
	OTHER_NUM							= 23,
	OTHER_PARENT_PK					    = 24,
	OTHER_LEVEL_NUM                     = 25,
	OTHER_TECPS_ITEM_PK                 = 26;

var status_control;

function BodyInit()
{ 
	System.Translate(document);
	BindingDataList();
	Merge_grid(grdEQ);
	Merge_grid(grdCONS);
	Merge_grid(grdCM);
	Merge_grid(grdOther);
	grdEQ.GetGridControl().FrozenCols       = EQ_UOM;
    grdCONS.GetGridControl().FrozenCols     = CONS_UNIT;
    grdCM.GetGridControl().FrozenCols       = CM_DIRECT_CCY;
    grdOther.GetGridControl().FrozenCols    = OTHER_UNIT;

	grdEQ.GetGridControl().WordWrap	= true;
	//grdCONS.GetGridControl().WordWrap	= true;
	grdCM.GetGridControl().WordWrap	= true;
	grdOther.GetGridControl().WordWrap = true;
	
}

function OnPopUp(pos)
{
    switch(pos)
    {
        case 'project':
		    var path = System.RootURL + '/form/kp/bp/kpbp00060_1.aspx';
		    var object = System.OpenModal( path ,750 , 500 , 'resizable:yes;status:yes');
		    if ( object != null )
		    {
			    txtProjectPk.text = object[0];
                txtProject_Cd.text = object[1];
                txtProject_Nm.text = object[2];
				dso_BudgetNo.Call('SELECT');
		    }
	    break;
        case 'Work_Breakdown':
            if (txtProjectPk.text == '')
            {
                alert('Please, select Project !!!');
                return;
            }
	    
            var path = System.RootURL + '/form/kp/bp/kpbp00050Work_Breakdown.aspx?Project_Pk=' + txtProjectPk.text;
            var obj = System.OpenModal(path , 600, 600, 'resizable:yes;status:yes');
            if ( obj != null )
            {
	            if (obj[2] != 0)
	            {
                    switch(idTab.GetCurrentPageNo())
                    {
                        case 0:
                            txtFilter1.text	= obj[0];
                        break;
                        case 1:
                            txtFilter2.text	= obj[0];
                        break;
                    }
                }
			    
                OnSearch();
            }    
        break;
        case 'OutsideOrderWork':
			if (txtProjectPk.text == '' )
			{
				alert('Please select Project !!');
			}
			else
			{
				var path = System.RootURL + "/form/kp/bm/kpbm00050_Order_W_Div.aspx?p_project_pk="+ txtProjectPk.text;
				var obj = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
				 
				if (obj != null)
		        {
                    switch(idTab.GetCurrentPageNo())
                    {
                        case 0:
                            txtFilter1.text	= obj[1];
                        break;
                        case 1: 
                            txtFilter2.text	= obj[1];
                        break;
                    }
			    
                OnSearch();
//					txtOrderWork_Cd.text = object[1];
//					txtOrderWork_Nm.text = object[2];
//					txtOrderWork_Pk.text = object[0];
				}
			}
        break;
    }    
}

function OnSearch()
{
	if (txtProjectPk.text != '')
	{
	    flag = 'SELECT';
	    switch(idTab.GetCurrentPageNo())
	    {
		    case 0:
			    dso_grdEQ.Call('SELECT');
		    break;	
		    case 1:
			    dso_grdCONS.Call('SELECT');
		    break;
		    case 2:
			    dso_grdCM.Call('SELECT');
		    break;
		    case 3:
			    dso_grdOther.Call('SELECT');
		    break;
	    }
    }
}

//---------------------------------------------------------
function OnPopUpList()
{
    var path = System.RootURL + '/form/kp/bm/kpbm00040_popup_list.aspx';
    var object = System.OpenModal( path ,200 , 400 , 'resizable:yes;status:yes');   
}
 //---------------------------------------------------------

function Merge_grid(obj)
{
	switch(obj.id)
	{
		case 'grdEQ':
			if (obj.rows < 2)
			{		
				obj.AddRow();
			}

			var fg = obj.GetGridControl();
			fg.FixedRows = 2
			fg.MergeCells = 5

			fg.MergeCol(EQ_PK) = true
			fg.Cell(0, 0, EQ_PK, 1, EQ_PK)				= "PK"

			fg.MergeCol(EQ_LEVEL_PK) = true
			fg.Cell(0, 0, EQ_LEVEL_PK, 1, EQ_LEVEL_PK)	= "LEVEL_PK"

			fg.MergeCol(EQ_LEVEL) = true
			fg.Cell(0, 0, EQ_LEVEL, 1, EQ_LEVEL)		= "Level"
			
			fg.MergeCol(EQ_LEVEL_CODE) = true
			fg.Cell(0, 0, EQ_LEVEL_CODE, 1, EQ_LEVEL_CODE)	= "Code"

			fg.MergeCol(EQ_LEVEL_NAME) = true
			fg.Cell(0, 0, EQ_LEVEL_NAME, 1, EQ_LEVEL_NAME)			= "Name"
			
			fg.MergeCol(EQ_STANDARD) = true
			fg.Cell(0, 0, EQ_STANDARD, 1, EQ_STANDARD)	= "Standard"
			
			fg.MergeCol(EQ_WEIGHT) = true
			fg.Cell(0, 0, EQ_WEIGHT, 1, EQ_WEIGHT)		= "Weight"
			
			fg.MergeRow(0) = true
			fg.Cell(0, 0, EQ_UOM, 0, EQ_AMT) = "Working (Version No : 0)"  
			fg.Cell(0, 1, EQ_UOM, 1) 		 = "Unit"
			fg.Cell(0, 1, EQ_CCY, 1) 		 = "CCY"
			fg.Cell(0, 1, EQ_QTY, 1 ) 		 = "Quantity"
			fg.Cell(0, 1, EQ_UNIT_COST, 1) 	 = "Unit Cost"
			fg.Cell(0, 1, EQ_AMT, 1) 		 = "Amount"			
			
			fg.MergeCol(EQ_ORDER_PK) = true
			fg.Cell(0, 0, EQ_ORDER_PK, 1, EQ_ORDER_PK) = "ORDER_PK"

			fg.MergeRow(0) = true
			fg.Cell(0, 0, EQ_ORDER_CODE, 0, EQ_ORDER_NAME) = "Order W. Div."  
			fg.Cell(0, 1, EQ_ORDER_CODE, 1) 	= "Code"
			fg.Cell(0, 1, EQ_ORDER_NAME, 1 ) 	= "Name"
			
			fg.MergeCol(EQ_EX_YN) = true
			fg.Cell(0, 0, EQ_EX_YN, 1, EQ_EX_YN) = "Excution (Yes/No)"

			fg.MergeCol(EQ_BUDGET_PK) = true
			fg.Cell(0, 0, EQ_BUDGET_PK, 1, EQ_BUDGET_PK) = "BUDGET_PK"

			fg.MergeCol(EQ_BUDGET_CODE) = true
			fg.Cell(0, 0, EQ_BUDGET_CODE, 1, EQ_BUDGET_CODE) = "Budget Code"
			
			fg.MergeCol(EQ_STANDARD_PBS) = true
			fg.Cell(0, 0, EQ_STANDARD_PBS, 1, EQ_STANDARD_PBS) = "Standard PBS"
			
			fg.MergeCol(EQ_DEVL_TERM) = true
			fg.Cell(0, 0, EQ_DEVL_TERM, 1, EQ_DEVL_TERM) = "Delivery Term"
			
			fg.MergeCol(EQ_ORDER_STATUS) = true
			fg.Cell(0, 0, EQ_ORDER_STATUS, 1, EQ_ORDER_STATUS) = "Order Status"
			
			fg.MergeCol(EQ_RSLT_YN) = true
			fg.Cell(0, 0, EQ_RSLT_YN, 1, EQ_RSLT_YN) = "A. Rslt Rcpt (Y/N)"
			
			fg.MergeCol(EQ_PROJECT_PK) = true
			fg.Cell(0, 0, EQ_PROJECT_PK, 1, EQ_PROJECT_PK) = "A. Rslt Rcpt (Y/N)"

			fg.MergeCol(EQ_PROJECT_PK) = true
			fg.Cell(0, 0, EQ_PROJECT_PK, 1, EQ_PROJECT_PK) = "PROJECT_PK"

			fg.MergeCol(EQ_TECPS_UNDERTAKECTRTBASC_PK) = true
			fg.Cell(0, 0, EQ_TECPS_UNDERTAKECTRTBASC_PK, 1, EQ_TECPS_UNDERTAKECTRTBASC_PK) = "TECPS_UNDERTAKECTRTBASC_PK"

			fg.MergeCol(EQ_UNDERTAKESEQ) = true
			fg.Cell(0, 0, EQ_UNDERTAKESEQ, 1, EQ_UNDERTAKESEQ) = "UNDERTAKE_SEQ"

			fg.MergeCol(EQ_TECPS_PERFORMBUDGETBASC_PK) = true
			fg.Cell(0, 0, EQ_TECPS_PERFORMBUDGETBASC_PK, 1, EQ_TECPS_PERFORMBUDGETBASC_PK) = "BUDGETMST_PK"
			
			fg.MergeCol(EQ_BOOKING_AMT) = true
			fg.Cell(0, 0, EQ_BOOKING_AMT, 1, EQ_BOOKING_AMT) = "BOOKING_AMT"

			fg.MergeCol(EQ_SEQ_NO) = true
			fg.Cell(0, 0, EQ_SEQ_NO, 1, EQ_SEQ_NO) = "SEQ"

			fg.MergeCol(EQ_NUM) = true
			fg.Cell(0, 0, EQ_NUM, 1, EQ_NUM) = "NUM"            
			
			fg.MergeCol(EQ_TECPS_ITEM_PK) = true;
			fg.Cell(0, 0, EQ_TECPS_ITEM_PK, 1, EQ_TECPS_ITEM_PK) = "TECPS_ITEM_PK";
			
			fg.MergeCol(EQ_LEVEL_NUM) = true;
			fg.Cell(0, 0, EQ_LEVEL_NUM, 1, EQ_LEVEL_NUM) = "LEVEL_NUM";
			
			fg.MergeCol(EQ_PARENT_PK) = true;
			fg.Cell(0, 0, EQ_PARENT_PK, 1, EQ_PARENT_PK) = "PARENT_PK";
			
			fg.MergeCol(EQ_PARENT_AMT) = true;
			fg.Cell(0, 0, EQ_PARENT_AMT, 1, EQ_PARENT_AMT) = "PARENT_AMT";

			var ctrl = obj.GetGridControl();
			ctrl.ColAlignment(EQ_WEIGHT)	= 7;
			ctrl.ColAlignment(EQ_QTY)		= 7;
			ctrl.ColAlignment(EQ_UNIT_COST)	= 7;
			ctrl.ColAlignment(EQ_AMT)		= 7;
			
			ctrl.ColFormat(EQ_WEIGHT)		= "#,###,###,###,###,###,###,###,###.##R";
			ctrl.ColFormat(EQ_QTY)			= "#,###,###,###,###,###,###,###,###.#########R";
			ctrl.ColFormat(EQ_UNIT_COST)	= "#,###,###,###,###,###,###,###,###.#####R";
			ctrl.ColFormat(EQ_AMT)			= "#,###,###,###,###,###,###,###,###.##R";
			break;
		case 'grdCONS':
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
			fg.Cell(0, 0, CONS_UNIT, 0, CONS_AMT)	= "Working (Version No : 0)"
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

			var ctrl = obj.GetGridControl();
			ctrl.ColAlignment(CONS_QTY)			= 7;
			ctrl.ColAlignment(CONS_RAW)			= 7;
			ctrl.ColAlignment(CONS_LABOR)		= 7;
			ctrl.ColAlignment(CONS_EXP_UP)		= 7;
			ctrl.ColAlignment(CONS_LABOR_UNIT_PRICE) = 7;
			ctrl.ColAlignment(CONS_AMT)			= 7;
			ctrl.ColAlignment(CONS_CALC_BASIC)  = 7;
			ctrl.ColAlignment(CONS_CCY)			= 2;

			ctrl.ColFormat(CONS_QTY)				= "#,###,###,###,###,###,###,###,###.##R";
			ctrl.ColFormat(CONS_RAW)				= "#,###,###,###,###,###,###,###,###.##R";
			ctrl.ColFormat(CONS_LABOR)				= "#,###,###,###,###,###,###,###,###.##R";
			ctrl.ColFormat(CONS_EXP_UP)				= "#,###,###,###,###,###,###,###,###.##R";
			ctrl.ColFormat(CONS_LABOR_UNIT_PRICE)	= "#,###,###,###,###,###,###,###,###.##R";
			ctrl.ColFormat(CONS_AMT)				= "#,###,###,###,###,###,###,###,###.##R";
			ctrl.ColFormat(CONS_CALC_BASIC)			= "#,###,###,###,###,###,###,###,###.##R";
		break;

		case 'grdCM':
			if (grdCM.rows < 2)
			{		
				grdCM.AddRow();
			}
			
			var fg = grdCM.GetGridControl();
			fg.FixedRows = 2
			fg.MergeCells = 5

			fg.MergeCol(CM_PK) = true
			fg.Cell(0, 0, CM_PK, 1, CM_PK) = "PK"

			fg.MergeCol(CM_NO) = true
			fg.Cell(0, 0, CM_NO, 1, CM_NO) = "No"

			fg.MergeCol(CM_DES) = true
			fg.Cell(0, 0, CM_DES, 1, CM_DES) = "Description"

			fg.MergeCol(CM_LEVEL_PK) = true
			fg.Cell(0, 0, CM_LEVEL_PK, 1, CM_LEVEL_PK) = "LEVEL_PK"

            fg.MergeCol(CM_LEVEL_CODE) = true
			fg.Cell(0, 0, CM_LEVEL_CODE, 1, CM_LEVEL_CODE) = "Code"
			
			fg.MergeCol(CM_LEVEL_NAME) = true
			fg.Cell(0, 0, CM_LEVEL_NAME, 1, CM_LEVEL_NAME) = "Name"
			
			fg.MergeCol(CM_UOM) = true
			fg.Cell(0, 0, CM_UOM, 1, CM_UOM) = "UOM"
			
			fg.MergeCol(CM_QTY) = true
			fg.Cell(0, 0, CM_QTY, 1, CM_QTY) = "Quatity"
			
			fg.MergeRow(0) = true
			fg.Cell(0, 0, CM_DIRECT_CCY, 0, CM_DIRECT_AMT)	= "Direct Management"  
			fg.Cell(0, 1, CM_DIRECT_CCY, 1) 				= "Ccy"
			fg.Cell(0, 1, CM_DIRECT_MM, 1 ) 				= "MM"
			fg.Cell(0, 1, CM_DIRECT_UNIT_COST, 1) 			= "Unit Cost"
			fg.Cell(0, 1, CM_DIRECT_AMT, 1) 				= "Amount"
			
			fg.MergeRow(0) = true
			fg.Cell(0, 0, CM_OUTSRC_CCY, 0, CM_OUTSRC_AMT)	= "Outsrc."  
			fg.Cell(0, 1, CM_OUTSRC_CCY, 1) 				= "Ccy"
			fg.Cell(0, 1, CM_OUTSRC_MM, 1 ) 				= "MM"
			fg.Cell(0, 1, CM_OUTSRC_UNIT_COST, 1) 			= "Unit Cost"
			fg.Cell(0, 1, CM_OUTSRC_AMT, 1 ) 				= "Amount"
			
			fg.MergeCol(CM_SUM) = true
			fg.Cell(0, 0, CM_SUM, 1, CM_SUM) = "Sum"
			
			fg.MergeCol(CM_OUTSITE_PK) = true
			fg.Cell(0, 0, CM_OUTSITE_PK, 1, CM_OUTSITE_PK) = "OUTSITE_PK"

			fg.MergeRow(0) = true
			fg.Cell(0, 0, CM_OUTSITE_CODE, 0, CM_OUTSITE_NAME) = "Outside Work"  
			fg.Cell(0, 1, CM_OUTSITE_CODE, 1) 					= "Code"
			fg.Cell(0, 1, CM_OUTSITE_NAME, 1 ) 				= "Name"
			
			fg.MergeCol(CM_ORDER_STATUS) = true
			fg.Cell(0, 0, CM_ORDER_STATUS, 1, CM_ORDER_STATUS) = "Order Status"
			
			fg.MergeCol(CM_RSLT_YN) = true
			fg.Cell(0, 0, CM_RSLT_YN, 1, CM_RSLT_YN) = "A. Rslt Rcpt (Y/N)"

			fg.MergeCol(CM_PROJECT_PK) = true
			fg.Cell(0, 0, CM_PROJECT_PK, 1, CM_PROJECT_PK) = "PROJECT_PK"

			fg.MergeCol(CM_TECPS_UNDERTAKECTRTBASC_PK) = true
			fg.Cell(0, 0, CM_TECPS_UNDERTAKECTRTBASC_PK, 1, CM_TECPS_UNDERTAKECTRTBASC_PK) = "TECPS_UNDERTAKECTRTBASC_PK"

			fg.MergeCol(CM_UNDERTAKESEQ) = true
			fg.Cell(0, 0, CM_UNDERTAKESEQ, 1, CM_UNDERTAKESEQ) = "UNDERTAKE_SEQ"

			fg.MergeCol(CM_TECPS_PERFORMBUDGETBASC_PK) = true
			fg.Cell(0, 0, CM_TECPS_PERFORMBUDGETBASC_PK, 1, CM_TECPS_PERFORMBUDGETBASC_PK) = "BUDGETMST_PK"

			fg.MergeCol(CM_BOOKING_AMT) = true
			fg.Cell(0, 0, CM_BOOKING_AMT, 1, CM_BOOKING_AMT) = "BOOKING_AMT"

			fg.MergeCol(CM_SEQ_NO) = true
			fg.Cell(0, 0, CM_SEQ_NO, 1, CM_SEQ_NO) = "SEQ"

			fg.MergeCol(CM_NUM) = true
			fg.Cell(0, 0, CM_NUM, 1, CM_NUM) = "NUM"
	
	        fg.MergeCol(CM_PARENT_PK) = true
			fg.Cell(0, 0, CM_PARENT_PK, 1, CM_PARENT_PK) = "PARENT_PK"
			
			fg.MergeCol(CM_LEVEL_NUM) = true
			fg.Cell(0, 0, CM_LEVEL_NUM, 1, CM_LEVEL_NUM) = "LEVEL_NUM"
			
			fg.MergeCol(CM_TECPS_ITEM_PK) = true
			fg.Cell(0, 0, CM_TECPS_ITEM_PK, 1, CM_TECPS_ITEM_PK) = "TECPS_ITEM_PK"
			
			var ctrl = obj.GetGridControl();
			ctrl.ColAlignment(CM_QTY)				= 7;
			ctrl.ColAlignment(CM_DIRECT_MM)			= 7;
			ctrl.ColAlignment(CM_DIRECT_UNIT_COST)	= 7;
			ctrl.ColAlignment(CM_DIRECT_AMT)		= 7;
			ctrl.ColAlignment(CM_OUTSRC_MM)			= 7;
			ctrl.ColAlignment(CM_OUTSRC_UNIT_COST)	= 7;
			ctrl.ColAlignment(CM_OUTSRC_AMT)		= 7;
			ctrl.ColAlignment(CM_SUM)				= 7;

			ctrl.ColFormat(CM_QTY)				= "#,###,###,###,###,###,###,###,###.#########R";
			ctrl.ColFormat(CM_DIRECT_MM)		= "#,###,###,###,###,###,###,###,###.#########R";
			ctrl.ColFormat(CM_DIRECT_UNIT_COST)	= "#,###,###,###,###,###,###,###,###.#####R";
			ctrl.ColFormat(CM_DIRECT_AMT)		= "#,###,###,###,###,###,###,###,###.##R";
			ctrl.ColFormat(CM_OUTSRC_MM)		= "#,###,###,###,###,###,###,###,###.#########R";
			ctrl.ColFormat(CM_OUTSRC_UNIT_COST)	= "#,###,###,###,###,###,###,###,###.#####R";
			ctrl.ColFormat(CM_OUTSRC_AMT)		= "#,###,###,###,###,###,###,###,###.##R";
			ctrl.ColFormat(CM_SUM)				= "#,###,###,###,###,###,###,###,###.##R";
		break;
		case 'grdOther':
			if (grdOther.rows < 2)
			{		
				grdOther.AddRow();
			}
			
			var fg = grdOther.GetGridControl();
			fg.FixedRows = 2
			fg.MergeCells = 5
	
			fg.MergeCol(OTHER_PK) = true
			fg.Cell(0, 0, OTHER_PK, 1, OTHER_PK) = "PK"

			fg.MergeCol(OTHER_LEVEL_PK) = true
			fg.Cell(0, 0, OTHER_LEVEL_PK, 1, OTHER_LEVEL_PK) = "LEVEL_PK"

			fg.MergeCol(OTHER_LEVEL) = true
			fg.Cell(0, 0, OTHER_LEVEL, 1, OTHER_LEVEL) = "Level"
			
			fg.MergeCol(OTHER_SRVC_FLD) = true
			fg.Cell(0, 0, OTHER_SRVC_FLD, 1, OTHER_SRVC_FLD) = "Other Srvc Fld"

            fg.MergeCol(OTHER_LEVEL_CODE) = true
			fg.Cell(0, 0, OTHER_LEVEL_CODE, 1, OTHER_LEVEL_CODE) = "Code"
            
			fg.MergeCol(OTHER_LEVEL_NAME) = true
			fg.Cell(0, 0, OTHER_LEVEL_NAME, 1, OTHER_LEVEL_NAME) = "Name"
			
			fg.MergeCol(OTHER_STANDARD) = true
			fg.Cell(0, 0, OTHER_STANDARD, 1, OTHER_STANDARD) = "Standard"
			
			fg.MergeRow(0) = true
			fg.Cell(0, 0, OTHER_UNIT, 0, OTHER_AMT) = "Execution(adjustment)"  
			fg.Cell(0, 1, OTHER_UNIT, 1) 	= "Unit"
			fg.Cell(0, 1, OTHER_CCY, 1) 	= "CYY"
			fg.Cell(0, 1, OTHER_QTY, 1) 	= "Q'ty"
			fg.Cell(0, 1, OTHER_UNIT_PRICE, 1) 	= "U/P"
			fg.Cell(0, 1, OTHER_AMT, 1) 	= "Amount"
			
			fg.MergeCol(OTHER_ORDER_PK) = true
			fg.Cell(0, 0, OTHER_ORDER_PK, 1, OTHER_ORDER_PK) = "ORDER_PK"
			
			fg.MergeRow(0) = true
			fg.Cell(0, 0, OTHER_ORDER_CODE, 0, OTHER_ORDER_NAME) = "Order W. Div."  
			fg.Cell(0, 1, OTHER_ORDER_CODE, 1) 	= "Code"
			fg.Cell(0, 1, OTHER_ORDER_NAME, 1 ) 	= "Name"
			
			fg.MergeCol(OTHER_ORDER_STATUS) = true
			fg.Cell(0, 0, OTHER_ORDER_STATUS, 1, OTHER_ORDER_STATUS) = "Order Status"

			fg.MergeCol(OTHER_RSLT_YN) = true
			fg.Cell(0, 0, OTHER_RSLT_YN, 1, OTHER_RSLT_YN) = "A. Rslt Rcpt (Y/N)"
			
			fg.MergeCol(OTHER_PROJECT_PK) = true
			fg.Cell(0, 0, OTHER_PROJECT_PK, 1, OTHER_PROJECT_PK) = "PROJECT_PK"

			fg.MergeCol(OTHER_TECPS_UNDERTAKECTRTBASC_PK) = true
			fg.Cell(0, 0, OTHER_TECPS_UNDERTAKECTRTBASC_PK, 1, OTHER_TECPS_UNDERTAKECTRTBASC_PK) = "TECPS_UNDERTAKECTRTBASC_PK"

			fg.MergeCol(OTHER_UNDERTAKESEQ) = true
			fg.Cell(0, 0, OTHER_UNDERTAKESEQ, 1, OTHER_UNDERTAKESEQ) = "UNDERTAKE_SEQ"
			
			fg.MergeCol(OTHER_TECPS_PERFORMBUDGETBASC_PK) = true
			fg.Cell(0, 0, OTHER_TECPS_PERFORMBUDGETBASC_PK, 1, OTHER_TECPS_PERFORMBUDGETBASC_PK) = "BUDGETMST_PK"

			fg.MergeCol(OTHER_BOOKING_AMT) = true
			fg.Cell(0, 0, OTHER_BOOKING_AMT, 1, OTHER_BOOKING_AMT) = "BOOKING_AMT"

			fg.MergeCol(OTHER_SEQ_NO) = true
			fg.Cell(0, 0, OTHER_SEQ_NO, 1, OTHER_SEQ_NO) = "SEQ"

			fg.MergeCol(OTHER_NUM) = true
			fg.Cell(0, 0, OTHER_NUM, 1, OTHER_NUM) = "NUM"
			
			fg.MergeCol(OTHER_PARENT_PK) = true
			fg.Cell(0, 0, OTHER_PARENT_PK, 1, OTHER_PARENT_PK) = "PARENT_PK"
			
			fg.MergeCol(OTHER_LEVEL_NUM) = true
			fg.Cell(0, 0, OTHER_LEVEL_NUM, 1, OTHER_LEVEL_NUM) = "LEVEL_NUM"
			
			fg.MergeCol(OTHER_TECPS_ITEM_PK) = true
			fg.Cell(0, 0, OTHER_TECPS_ITEM_PK, 1, OTHER_TECPS_ITEM_PK) = "TECPS_ITEM_PK"

			var ctrl = obj.GetGridControl();
			ctrl.ColAlignment(OTHER_QTY)			= 7;
			ctrl.ColAlignment(OTHER_UNIT_PRICE)		= 7;
			ctrl.ColAlignment(OTHER_AMT)			= 7;

			ctrl.ColFormat(OTHER_QTY)				= "#,###,###,###,###,###,###,###,###.#########R";
			ctrl.ColFormat(OTHER_UNIT_PRICE)		= "#,###,###,###,###,###,###,###,###.#####R";
			ctrl.ColFormat(OTHER_AMT)				= "#,###,###,###,###,###,###,###,###.##R";
		break;
	}
	
	CalcBalane();
}
 //---------------------------------------------------------
 function BindingDataList()
 {
	var data = '';
	data = "DATA|ALL|Select All|1|Level Code|2|Std|3|Wgt|4|Compared w/|5|Compared w/|6|Order Work|7|Order W. Div|8|Exec Y/N|9|Bdgt Code|10|Std PBS|11|Dlvr. Terms|12|Dlvr.(Y/N)|13|Cont. Dtals";
	//lstColumn.SetDataText(data);
	//lstColumn.value = '';
	
	data = "DATA|ALL|Select All|N|Non-Cont.|Y|Cont.";
	//lstContract_YN.SetDataText(data);
	//lstContract_YN.value = 'ALL';

	data = "DATA|ALL|Select All|1|Raw Mtrl. Cost|2|Labor Cost|3|Outsrc. Cost|4|Exp.";
	//lstBudgetItem.SetDataText(data);
	//lstBudgetItem.value = 'ALL';
	
	data = "DATA|ALL|Select All|1|Code|2|Name|3|Child Node|4|Order W. Code";
	lstFilter1.SetDataText(data);
	lstFilter1.value = 'ALL';
    txtFilter1.text = '';
	txtFilter1.style.display = 'none';
    idCode1.style.display = "none";
    
	//data = "DATA|ALL|Select All|1|Code|2|Name|3|Standard|4|Order W. Code|5|Budget Code|6|Standard Code";
	data = "DATA|ALL|Select All|1|Code|2|Name|3|Child Node|4|Order W. Code";
	lstFilter2.SetDataText(data);
	lstFilter2.value = 'ALL';
	txtFilter2.text = '';
	txtFilter2.style.display = 'none';
	btnLevelCode2.style.display = "none";
	btnLevelCode3.style.display = "none";
    
	data = "DATA|ALL|Select All|1|Level|2|Name|3|Standard|4|Order W. Code";
	lstFilter4.SetDataText(data);
	lstFilter4.value = 'ALL';
	//thieu commcd o day
	
 }

function OnEntryLevelCode()
{
    var path = System.RootURL + '/form/kp/bp/kpbp00050_popup_level.aspx';
	var aValue = System.OpenModal( path ,1024 , 500 , 'resizable:yes;status:yes');
}

function OnNew()
{
	if (txtProjectPk.text == '' )
	{
		alert('Please select Project !!');
	} 
	else
	{
		var path = System.RootURL + '/form/kp/bp/kpbp00050Work_Breakdown_1.aspx?Project_Pk=' + txtProjectPk.text;
		var aValue = System.OpenModal( path ,900 , 500 , 'resizable:yes;status:yes');

		var object;
		 if(aValue != null)
		 {
			switch(idTab.GetCurrentPageNo())
			{
				case 0:
					for (i = 0; i < aValue.length; i++ )
					{
						object = aValue[i];

						//if(!CheckDuplicateLevel(grdEQ, object[2], object[1])) return;
						grdEQ.AddRow();
						
						if(grdEQ.rows <= 3)
						{
							grdEQ.SetGridText(grdEQ.rows-1, EQ_LEVEL_PK						, object[2]);				// pk
							grdEQ.SetGridText(grdEQ.rows-1, EQ_LEVEL						, 'Level ' + object[3]);	// level
							grdEQ.SetGridText(grdEQ.rows-1, EQ_LEVEL_NAME							, object[1]);				// name
							grdEQ.SetGridText(grdEQ.rows-1, EQ_QTY							, 1);
							grdEQ.SetGridText(grdEQ.rows-1, EQ_UNIT_COST					, 0);
							grdEQ.SetGridText(grdEQ.rows-1, EQ_AMT							, 0);
							grdEQ.SetGridText(grdEQ.rows-1, EQ_ORDER_STATUS					, 'C');
							grdEQ.SetGridText(grdEQ.rows-1, EQ_PROJECT_PK					, txtProjectPk.text);
							grdEQ.SetGridText(grdEQ.rows-1, EQ_TECPS_PERFORMBUDGETBASC_PK	, lstBudgetNo.value);
							grdEQ.SetGridText(grdEQ.rows-1, EQ_UNDERTAKESEQ					, lstBudgetNo.GetText());
							grdEQ.SetGridText(grdEQ.rows-1, EQ_LEVEL_NUM					, 1);
						}
						else
						{							
							grdEQ.SetGridText(grdEQ.rows-1, EQ_LEVEL_PK						, object[2]);				// pk
							grdEQ.SetGridText(grdEQ.rows-1, EQ_LEVEL						, 'Level ' + object[3]);	// level
							grdEQ.SetGridText(grdEQ.rows-1, EQ_LEVEL_NAME							, object[1]);				// name
							grdEQ.SetGridText(grdEQ.rows-1, EQ_QTY							, 1);
							grdEQ.SetGridText(grdEQ.rows-1, EQ_UNIT_COST					, 0);
							grdEQ.SetGridText(grdEQ.rows-1, EQ_AMT							, 0);
							grdEQ.SetGridText(grdEQ.rows-1, EQ_ORDER_STATUS					, 'C');
							grdEQ.SetGridText(grdEQ.rows-1, EQ_PROJECT_PK					, grdEQ.GetGridData(grdEQ.rows-2, EQ_PROJECT_PK));
							grdEQ.SetGridText(grdEQ.rows-1, EQ_TECPS_PERFORMBUDGETBASC_PK	, grdEQ.GetGridData(grdEQ.rows-2, EQ_TECPS_PERFORMBUDGETBASC_PK));
							grdEQ.SetGridText(grdEQ.rows-1, EQ_UNDERTAKESEQ					, grdEQ.GetGridData(grdEQ.rows-2, EQ_UNDERTAKESEQ));
							grdEQ.SetGridText(grdEQ.rows-1, EQ_SEQ_NO						, grdEQ.GetGridData(grdEQ.rows-2, EQ_SEQ_NO));
							grdEQ.SetGridText(grdEQ.rows-1, EQ_LEVEL_NUM					, 1);
						}
					}
				break;
				case 1:
					for (i = 0; i < aValue.length; i++ )
					{
						object = aValue[i];
                        
						if(!CheckDuplicateLevel(grdCONS, object[2], object[1])) return;
						
						grdCONS.AddRow();
						
						if(grdCONS.rows <= 3)
						{
							grdCONS.SetGridText(grdCONS.rows-1, CONS_LEVEL_PK					, object[2]);			    // pk
							grdCONS.SetGridText(grdCONS.rows-1, CONS_LEVEL						, 'Level ' + object[3]);	// level
							grdCONS.SetGridText(grdCONS.rows-1, CONS_CODE						, object[0]);	            // code
							grdCONS.SetGridText(grdCONS.rows-1, CONS_NAME						, object[1]);				// name
							
							grdCONS.SetGridText(grdCONS.rows-1, CONS_PROJECT_PK					, txtProjectPk.text);
							grdCONS.SetGridText(grdCONS.rows-1, CONS_TECPS_PERFORMBUDGETBASC_PK	, lstBudgetNo.value);
							grdCONS.SetGridText(grdCONS.rows-1, CONS_UNDERTAKESEQ				, lstBudgetNo.GetText());
							grdCONS.SetGridText(grdCONS.rows-1, CONS_LEVEL_NUM				    , 1);
						}
						else
						{
							grdCONS.SetGridText(grdCONS.rows-1, CONS_LEVEL_PK					, object[2]);			    // pk
							grdCONS.SetGridText(grdCONS.rows-1, CONS_LEVEL						, 'Level ' + object[3]);	// level
							grdCONS.SetGridText(grdCONS.rows-1, CONS_CODE						, object[0]);	            // code
							grdCONS.SetGridText(grdCONS.rows-1, CONS_NAME						, object[1]);				// name
							
							grdCONS.SetGridText(grdCONS.rows-1, CONS_PROJECT_PK					, grdCONS.GetGridData(grdCONS.rows-2, CONS_PROJECT_PK));
							grdCONS.SetGridText(grdCONS.rows-1, CONS_TECPS_PERFORMBUDGETBASC_PK	, grdCONS.GetGridData(grdCONS.rows-2, CONS_TECPS_PERFORMBUDGETBASC_PK));
							grdCONS.SetGridText(grdCONS.rows-1, CONS_UNDERTAKESEQ				, grdCONS.GetGridData(grdCONS.rows-2, CONS_UNDERTAKESEQ));
							grdCONS.SetGridText(grdCONS.rows-1, CONS_SEQ_NO						, grdCONS.GetGridData(grdCONS.rows-2, CONS_SEQ_NO));
							grdCONS.SetGridText(grdCONS.rows-1, CONS_LEVEL_NUM				    , 1);
						}
							
						for (col = CONS_STAN; col <= CONS_RSLT_YN; col++)
						{
						    grdCONS.SetGridText(grdCONS.rows-1, col, '');
						}
					}
				break;
				case 2:
				    for (i = 0; i < aValue.length; i++ )
					{
						object = aValue[i];
                        
						if(!CheckDuplicateLevel(grdCM, object[2], object[1])) return;
						
						grdCM.AddRow();
						
						if(grdCM.rows <= 3)
						{
							grdCM.SetGridText(grdCM.rows-1, CM_LEVEL_PK					    , object[2]);			    // pk
							grdCM.SetGridText(grdCM.rows-1, CM_LEVEL_NAME					, object[1]);				// name
							
							grdCM.SetGridText(grdCM.rows-1, CM_PROJECT_PK					, txtProjectPk.text);
							grdCM.SetGridText(grdCM.rows-1, CM_TECPS_PERFORMBUDGETBASC_PK	, lstBudgetNo.value);
							grdCM.SetGridText(grdCM.rows-1, CM_UNDERTAKESEQ				    , lstBudgetNo.GetText());
							grdCM.SetGridText(grdCM.rows-1, CM_LEVEL_NUM				    , 1);
						}
						else
						{
							grdCM.SetGridText(grdCM.rows-1, CM_LEVEL_PK					    , object[2]);			    // pk
							grdCM.SetGridText(grdCM.rows-1, CM_LEVEL_NAME				    , object[1]);				// name
							
							grdCM.SetGridText(grdCM.rows-1, CM_PROJECT_PK					, grdCM.GetGridData(grdCM.rows-2, CM_PROJECT_PK));
							grdCM.SetGridText(grdCM.rows-1, CM_TECPS_PERFORMBUDGETBASC_PK	, grdCM.GetGridData(grdCM.rows-2, CM_TECPS_PERFORMBUDGETBASC_PK));
							grdCM.SetGridText(grdCM.rows-1, CM_UNDERTAKESEQ				    , grdCM.GetGridData(grdCM.rows-2, CM_UNDERTAKESEQ));
							grdCM.SetGridText(grdCM.rows-1, CM_SEQ_NO						, grdCM.GetGridData(grdCM.rows-2, CM_SEQ_NO));
							grdCM.SetGridText(grdCM.rows-1, CM_LEVEL_NUM				    , 1);
						}
							
						for (col = CM_UOM; col <= CM_RSLT_YN; col++)
						{
						    grdCM.SetGridText(grdCM.rows-1, col, '');
						}
					}				    
				break;
				case 3:
				    for (i = 0; i < aValue.length; i++ )
					{
						object = aValue[i];
                        
						if(!CheckDuplicateLevel(grdOther, object[2], object[1])) return;
						
						grdOther.AddRow();
						grdOther.SetRowEditable(grdOther.rows-1, false);
						if(grdOther.rows <= 3)
						{
							grdOther.SetGridText(grdOther.rows-1, OTHER_LEVEL_PK				    , object[2]);			    // pk
							grdOther.SetGridText(grdOther.rows-1, OTHER_LEVEL					    , 'Level ' + object[3]);	// level
							grdOther.SetGridText(grdOther.rows-1, OTHER_LEVEL_CODE				    , object[0]);	            // code
							grdOther.SetGridText(grdOther.rows-1, OTHER_LEVEL_NAME				    , object[1]);				// name
							
							grdOther.SetGridText(grdOther.rows-1, OTHER_QTY						    , 1);
							grdOther.SetGridText(grdOther.rows-1, OTHER_UNIT_PRICE				    , 0);
							grdOther.SetGridText(grdOther.rows-1, OTHER_AMT						    , 0);
							grdOther.SetGridText(grdOther.rows-1, OTHER_PROJECT_PK					, txtProjectPk.text);
							grdOther.SetGridText(grdOther.rows-1, OTHER_TECPS_PERFORMBUDGETBASC_PK	, lstBudgetNo.value);
							grdOther.SetGridText(grdOther.rows-1, OTHER_UNDERTAKESEQ				, lstBudgetNo.GetText());
							grdOther.SetGridText(grdOther.rows-1, OTHER_LEVEL_NUM				    , 1);
						}
						else
						{
							grdOther.SetGridText(grdOther.rows-1, OTHER_LEVEL_PK				, object[2]);			    // pk
							grdOther.SetGridText(grdOther.rows-1, OTHER_LEVEL					, 'Level ' + object[3]);	// level
							grdOther.SetGridText(grdOther.rows-1, OTHER_LEVEL_CODE				, object[0]);	            // code
							grdOther.SetGridText(grdOther.rows-1, OTHER_LEVEL_NAME				, object[1]);				// name
							
							grdOther.SetGridText(grdOther.rows-1, OTHER_QTY						, 1);
							grdOther.SetGridText(grdOther.rows-1, OTHER_UNIT_PRICE				, 0);
							grdOther.SetGridText(grdOther.rows-1, OTHER_AMT						, 0);
							grdOther.SetGridText(grdOther.rows-1, OTHER_PROJECT_PK					, grdOther.GetGridData(grdOther.rows-2, OTHER_PROJECT_PK));
							grdOther.SetGridText(grdOther.rows-1, OTHER_TECPS_PERFORMBUDGETBASC_PK	, grdOther.GetGridData(grdOther.rows-2, OTHER_TECPS_PERFORMBUDGETBASC_PK));
							grdOther.SetGridText(grdOther.rows-1, OTHER_UNDERTAKESEQ				, grdOther.GetGridData(grdOther.rows-2, OTHER_UNDERTAKESEQ));
							grdOther.SetGridText(grdOther.rows-1, OTHER_SEQ_NO						, grdOther.GetGridData(grdOther.rows-2, OTHER_SEQ_NO));
							grdOther.SetGridText(grdOther.rows-1, OTHER_LEVEL_NUM				    , 1);
						}
							
						for (col = OTHER_SRVC_FLD; col <= OTHER_RSLT_YN; col++)
						{
						    grdOther.SetGridText(grdOther.rows-1, col, '');
						}
					}
				break;
			}
		}
	} 
}

function OnNewFree()
{
    if (txtProjectPk.text == '' )
	{
		alert('Please select Project !!');
	} 
	else
	{
	    switch (idTab.GetCurrentPageNo())
	    {
		    case 0:		        
		        if (grdEQ.row == -1)
		        {
		            alert('Please, select one row.');
		            return;
		        }
		        
		        var level_pk = grdEQ.GetGridData(grdEQ.row, EQ_LEVEL_PK);
		        if (level_pk != '')
		        {
	                var fpath = System.RootURL + "/form/kp/bm/kpbm00050_Item.aspx?p_project_pk=" + txtProjectPk.text
                    + "&p_project_cd=" + txtProject_Cd.text + "&p_project_nm=" + txtProject_Nm.text
                    + "&p_level_pk=" + grdEQ.GetGridData(grdEQ.row, EQ_LEVEL_PK)
                    + "&p_status=ADD";
                    
                    var object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            	    
                    var temp;
                    if(object != null)
                    {
                        for (i = 0; i < object.length; i++)
                        {
                            temp = object[i];
                                                        
				            // by level_code
                            if(!CheckDuplicateLevelChild(grdEQ, grdEQ.row, level_pk, temp[3], temp[4])) return;
                            
                            grdEQ.AddRow();
                            grdEQ.SetGridText(grdEQ.rows-1, EQ_PARENT_PK, grdEQ.GetGridData(grdEQ.row, EQ_LEVEL_PK));
				            grdEQ.SetGridText(grdEQ.rows-1, EQ_LEVEL_NUM, Number(grdEQ.GetGridData(grdEQ.row, EQ_LEVEL_NUM)) + 1);
		                    grdEQ.SetGridText(grdEQ.rows-1, EQ_QTY, 1);		            
				            grdEQ.SetGridText(grdEQ.rows-1, EQ_UNIT_COST, 0);
				            grdEQ.SetGridText(grdEQ.rows-1, EQ_AMT, 0);
				            grdEQ.SetGridText(grdEQ.rows-1, EQ_PROJECT_PK, txtProjectPk.text);
				            grdEQ.SetGridText(grdEQ.rows-1, EQ_TECPS_UNDERTAKECTRTBASC_PK, grdEQ.GetGridData(grdEQ.row, EQ_TECPS_UNDERTAKECTRTBASC_PK));
				            grdEQ.SetGridText(grdEQ.rows-1, EQ_TECPS_PERFORMBUDGETBASC_PK, grdEQ.GetGridData(grdEQ.row, EQ_TECPS_PERFORMBUDGETBASC_PK));
				            grdEQ.SetGridText(grdEQ.rows-1, EQ_UNDERTAKESEQ, grdEQ.GetGridData(grdEQ.row, EQ_UNDERTAKESEQ));
				            grdEQ.SetGridText(grdEQ.rows-1, EQ_SEQ_NO, grdEQ.GetGridData(grdEQ.row, EQ_SEQ_NO));
                            grdEQ.SetGridText(grdEQ.rows-1, EQ_LEVEL_CODE,          temp[4]);
                            grdEQ.SetGridText(grdEQ.rows-1, EQ_LEVEL_NAME,          temp[5]);
                            grdEQ.SetGridText(grdEQ.rows-1, EQ_TECPS_ITEM_PK,       temp[3]);
                        }
                    }
                }
                else
                {
                    alert('Please, Select Level Code.');
                }                
		    break;
		    
		    case 1:
		        if (grdCONS.row == -1)
		        {
		            alert('Please, select one row.');
		            return;
		        }
		        
		        var level_pk = grdCONS.GetGridData(grdCONS.row, CONS_LEVEL_PK)		        
		        if (level_pk != '')
		        {
	                var fpath = System.RootURL + "/form/kp/bm/kpbm00050_Item.aspx?p_project_pk=" + txtProjectPk.text
                    + "&p_project_cd=" + txtProject_Cd.text + "&p_project_nm=" + txtProject_Nm.text
                    + "&p_level_pk=" + grdCONS.GetGridData(grdCONS.row, CONS_LEVEL_PK)
                    + "&p_status=ADD";
                    
                    var object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            	    
                    var temp;
                    if(object != null)
                    {
                        for (i = 0; i < object.length; i++)
                        {
                            temp = object[i];
                                                        
				            // by level_code
                            if(!CheckDuplicateLevelChild(grdCONS, grdCONS.row, level_pk, temp[3], temp[4])) return;
                            
                            grdCONS.AddRow();
                            grdCONS.SetGridText(grdCONS.rows-1, CONS_PARENT_PK , grdCONS.GetGridData(grdCONS.row, CONS_LEVEL_PK));
				            grdCONS.SetGridText(grdCONS.rows-1, CONS_LEVEL_NUM, Number(grdCONS.GetGridData(grdCONS.row, CONS_LEVEL_NUM)) + 1);
		                    grdCONS.SetGridText(grdCONS.rows-1, CONS_QTY, 1);		            
				            grdCONS.SetGridText(grdCONS.rows-1, CONS_RAW						, 0);
				            grdCONS.SetGridText(grdCONS.rows-1, CONS_LABOR						, 0);
				            grdCONS.SetGridText(grdCONS.rows-1, CONS_EXP_UP						, 0);
				            grdCONS.SetGridText(grdCONS.rows-1, CONS_LABOR_UNIT_PRICE			, 0);
				            grdCONS.SetGridText(grdCONS.rows-1, CONS_AMT						, 0);
				            grdCONS.SetGridText(grdCONS.rows-1, CONS_PROJECT_PK, txtProjectPk.text);
				            grdCONS.SetGridText(grdCONS.rows-1, CONS_TECPS_UNDERTAKECTRTBASC_PK, grdCONS.GetGridData(grdCONS.row, CONS_TECPS_UNDERTAKECTRTBASC_PK));
				            grdCONS.SetGridText(grdCONS.rows-1, CONS_TECPS_PERFORMBUDGETBASC_PK, grdCONS.GetGridData(grdCONS.row, CONS_TECPS_PERFORMBUDGETBASC_PK));
				            grdCONS.SetGridText(grdCONS.rows-1, CONS_UNDERTAKESEQ, grdCONS.GetGridData(grdCONS.row, CONS_UNDERTAKESEQ));
				            grdCONS.SetGridText(grdCONS.rows-1, CONS_SEQ_NO, grdCONS.GetGridData(grdCONS.row, CONS_SEQ_NO));
                            grdCONS.SetGridText(grdCONS.rows-1, CONS_CODE,          temp[4]);
                            grdCONS.SetGridText(grdCONS.rows-1, CONS_NAME,          temp[5]);
                            grdCONS.SetGridText(grdCONS.rows-1, CONS_TECPS_ITEM_PK, temp[3]);
                        }
                    }
                }
                else
                {
                    alert('Please, Select Level Code.');
                }                	
		    break;
		    case 2:
		        if (grdCM.row == -1)
		        {
		            alert('Please, select one row.');
		            return;
		        }
		        
		        var level_pk = grdCM.GetGridData(grdCM.row, CM_LEVEL_PK)		        
		        if (level_pk != '')
		        {
	                var fpath = System.RootURL + "/form/kp/bm/kpbm00050_Item.aspx?p_project_pk=" + txtProjectPk.text
                    + "&p_project_cd=" + txtProject_Cd.text + "&p_project_nm=" + txtProject_Nm.text
                    + "&p_level_pk=" + grdCM.GetGridData(grdCM.row, CM_LEVEL_PK)
                    + "&p_status=ADD";
                    
                    var object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            	    
                    var temp;
                    if(object != null)
                    {
                        for (i = 0; i < object.length; i++)
                        {
                            temp = object[i];
                                                        
				            // by level_code
                            if(!CheckDuplicateLevelChild(grdCM, grdCM.row, level_pk, temp[3], temp[4])) return;
                            
                            grdCM.AddRow();
                            grdCM.SetGridText(grdCM.rows-1, CM_PARENT_PK , grdCM.GetGridData(grdCM.row, CM_LEVEL_PK));
				            grdCM.SetGridText(grdCM.rows-1, CM_LEVEL_NUM, Number(grdCM.GetGridData(grdCM.row, CM_LEVEL_NUM)) + 1);
		                    grdCM.SetGridText(grdCM.rows-1, CM_QTY, 1);		            
				            grdCM.SetGridText(grdCM.rows-1, CM_DIRECT_MM		, 0);
				            grdCM.SetGridText(grdCM.rows-1, CM_DIRECT_UNIT_COST	, 0);
				            grdCM.SetGridText(grdCM.rows-1, CM_DIRECT_AMT       , 0);
				            grdCM.SetGridText(grdCM.rows-1, CM_OUTSRC_MM		, 0);
				            grdCM.SetGridText(grdCM.rows-1, CM_OUTSRC_UNIT_COST	, 0);
				            grdCM.SetGridText(grdCM.rows-1, CM_OUTSRC_AMT       , 0);
				            grdCM.SetGridText(grdCM.rows-1, CM_PROJECT_PK, txtProjectPk.text);
				            grdCM.SetGridText(grdCM.rows-1, CM_TECPS_UNDERTAKECTRTBASC_PK, grdCM.GetGridData(grdCM.row, CM_TECPS_UNDERTAKECTRTBASC_PK));
				            grdCM.SetGridText(grdCM.rows-1, CM_TECPS_PERFORMBUDGETBASC_PK, grdCM.GetGridData(grdCM.row, CM_TECPS_PERFORMBUDGETBASC_PK));
				            grdCM.SetGridText(grdCM.rows-1, CM_UNDERTAKESEQ, grdCM.GetGridData(grdCM.row, CM_UNDERTAKESEQ));
				            grdCM.SetGridText(grdCM.rows-1, CM_SEQ_NO, grdCM.GetGridData(grdCM.row, CM_SEQ_NO));
                            grdCM.SetGridText(grdCM.rows-1, CM_LEVEL_CODE,          temp[4]);
                            grdCM.SetGridText(grdCM.rows-1, CM_LEVEL_NAME,          temp[5]);
                            grdCM.SetGridText(grdCM.rows-1, CM_TECPS_ITEM_PK,       temp[3]);
                        }
                    }
                }
                else
                {
                    alert('Please, Select Level Code.');
                }		        
		    break;
		    case 3:
		        if (grdOther.row == -1)
		        {
		            alert('Please, select one row.');
		            return;
		        }
		        
		        var level_pk = grdOther.GetGridData(grdOther.row, OTHER_LEVEL_PK)		        
		        if (level_pk != '')
		        {
	                var fpath = System.RootURL + "/form/kp/bm/kpbm00050_Item.aspx?p_project_pk=" + txtProjectPk.text
                    + "&p_project_cd=" + txtProject_Cd.text + "&p_project_nm=" + txtProject_Nm.text
                    + "&p_level_pk=" + grdOther.GetGridData(grdOther.row, OTHER_LEVEL_PK)
                    + "&p_status=ADD";
                    
                    var object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
                            	    
                    var temp;
                    if(object != null)
                    {
                        for (i = 0; i < object.length; i++)
                        {
                            temp = object[i];
                                                        
				            // by level_code
                            if(!CheckDuplicateLevelChild(grdOther, grdOther.row, level_pk, temp[3], temp[4])) return;
                            
                            grdOther.AddRow();
                            grdOther.SetGridText(grdOther.rows-1, OTHER_PARENT_PK , grdOther.GetGridData(grdOther.row, OTHER_LEVEL_PK));
				            grdOther.SetGridText(grdOther.rows-1, OTHER_LEVEL_NUM, Number(grdOther.GetGridData(grdOther.row, OTHER_LEVEL_NUM)) + 1);
		                    grdOther.SetGridText(grdOther.rows-1, OTHER_QTY, 1);
		                    
				            grdOther.SetGridText(grdOther.rows-1, OTHER_PROJECT_PK, txtProjectPk.text);
				            grdOther.SetGridText(grdOther.rows-1, OTHER_TECPS_UNDERTAKECTRTBASC_PK, grdOther.GetGridData(grdOther.row, OTHER_TECPS_UNDERTAKECTRTBASC_PK));
				            grdOther.SetGridText(grdOther.rows-1, OTHER_TECPS_PERFORMBUDGETBASC_PK, grdOther.GetGridData(grdOther.row, OTHER_TECPS_PERFORMBUDGETBASC_PK));
				            grdOther.SetGridText(grdOther.rows-1, OTHER_UNDERTAKESEQ, grdOther.GetGridData(grdOther.row, OTHER_UNDERTAKESEQ));
				            grdOther.SetGridText(grdOther.rows-1, OTHER_SEQ_NO, grdOther.GetGridData(grdOther.row, OTHER_SEQ_NO));
                            grdOther.SetGridText(grdOther.rows-1, OTHER_LEVEL_CODE,          temp[4]);
                            grdOther.SetGridText(grdOther.rows-1, OTHER_LEVEL_NAME,          temp[5]);
                            grdOther.SetGridText(grdOther.rows-1, OTHER_TECPS_ITEM_PK,       temp[3]);
                        }
                    }
                }
                else
                {
                    alert('Please, Select Level Code.');
                }
		    break;
	    }
	}   
}

function CheckDuplicateLevel(grd, level_pk, level_name, level_num)
{
    switch (grd.id)
    {
	    case 'grdEQ':	
		    for(var i = 2; i < grd.rows; i++)
		    {
			    if(grd.GetGridData(i, EQ_LEVEL_PK) == level_pk)
			    {
				     alert("Duplicated Level Code : " + level_name);
				     return false ;
			    }
		    }
		    return true;
	    break;
	    case 'grdCONS':
		    for(var i = 2; i < grd.rows; i++)
		    {
			    if(grd.GetGridData(i, CONS_LEVEL_PK) == level_pk)
			    {
				     alert("Duplicated Level Code : " + level_name);
				     return false ;
			    }
		    }
		    return true;
	    break;
	    case 'grdCM':
		    for(var i = 2; i < grd.rows; i++)
		    {
			    if(grd.GetGridData(i, CM_LEVEL_PK) == level_pk)
			    {
				     alert("Duplicated Level Code : " + level_name);
				     return false ;
			    }
		    }
		    return true;
	    break
	    case 'grdOther':
		    for(var i = 2; i < grd.rows; i++)
		    {
			    if(grd.GetGridData(i, OTHER_LEVEL_PK) == level_pk)
			    {
				     alert("Duplicated Level Code : " + level_name);
				     return false ;
			    }
		    }
		    return true;
	    break;
    }
}

function CheckDuplicateLevelChild(grd, num, level_pk, item_pk, item_code)
{
    switch (grd.id)
    {
	    case 'grdEQ':
	        for(var i = num; i < grd.rows; i++)
		    {
		        if (grd.GetGridData(i, EQ_PARENT_PK) == level_pk)
		        {		        
			        if(grd.GetGridData(i, EQ_TECPS_ITEM_PK) == item_pk)
			        {
				         alert("Duplicated Item : " + item_code);
				         return false ;
			        }
			    }
			    else
			    {
			        return true;    
			    }
		    }
		    return true;
	    break;
	    case 'grdCONS':
		    for(var i = num; i < grd.rows; i++)
		    {
		        if (grd.GetGridData(i, CONS_PARENT_PK) == level_pk)
		        {		        
			        if(grd.GetGridData(i, CONS_TECPS_ITEM_PK) == item_pk)
			        {
				         alert("Duplicated Item : " + item_code);
				         return false ;
			        }
			    }
			    else
			    {
			        return true;    
			    }
		    }
		    return true;
	    break;
	    case 'grdCM':
		    for(var i = num; i < grd.rows; i++)
		    {
		        if (grd.GetGridData(i, CM_PARENT_PK) == level_pk)
		        {		        
			        if(grd.GetGridData(i, CM_TECPS_ITEM_PK) == item_pk)
			        {
				         alert("Duplicated Item : " + item_code);
				         return false ;
			        }
			    }
			    else
			    {
			        return true;    
			    }
		    }
		    return true;	        
	    break;
	    case 'grdOther':
		    for(var i = num; i < grd.rows; i++)
		    {
		        if (grd.GetGridData(i, OTHER_PARENT_PK) == level_pk)
		        {		        
			        if(grd.GetGridData(i, OTHER_TECPS_ITEM_PK) == item_pk)
			        {
				         alert("Duplicated Item : " + item_code);
				         return false ;
			        }
			    }
			    else
			    {
			        return true;    
			    }
		    }
		    return true;
	    break;
    }
}

function OnSave()
{
    dso_Status.Call();
}

function OnClear()
{
    switch(idTab.GetCurrentPageNo())
	{
	    case 0:
	        for (row = 2; row < grdEQ.rows; row++)
            {
                if (grdEQ.GetGridControl().isSelected(row))
                {
	                if (grdEQ.col == EQ_ORDER_CODE || grdEQ.col == EQ_ORDER_NAME)
	                {
	                    grdEQ.SetGridText(row, EQ_ORDER_PK, '');           
	                    grdEQ.SetGridText(row, grdEQ.col, '');
	                }
        	        
	                if (grdEQ.col == EQ_BUDGET_CODE)
	                {
	                    grdEQ.SetGridText(row, EQ_BUDGET_PK, '');
	                    grdEQ.SetGridText(row, grdEQ.col, '');
	                }
	            }
            }
	    break;
	    case 1:
	        for (row = 2; row < grdCONS.rows; row++)
            {
                if (grdCONS.GetGridControl().isSelected(row))
                {
	                if (grdCONS.col == CONS_ORDER_CODE || grdCONS.col == CONS_ORDER_NAME)
	                {
	                    grdCONS.SetGridText(row, CONS_ORDER_PK, '');           
	                    grdCONS.SetGridText(row, grdCONS.col, '');
	                }
        	        
	                if (grdCONS.col == CONS_BUDGET_CODE)
	                {
	                    grdCONS.SetGridText(row, CONS_BUDGET_PK, '');
	                    grdCONS.SetGridText(row, grdCONS.col, '');
	                }
	            }
            }
	    break;
	    case 2:
	        for (row = 2; row < grdCM.rows; row++)
            {
                if (grdCM.GetGridControl().isSelected(row))
                {
	                if (grdCM.col == CM_OUTSITE_CODE || grdCM.col == CM_OUTSITE_NAME)
	                {
	                    grdCM.SetGridText(row, CM_OUTSITE_PK, '');           
	                    grdCM.SetGridText(row, grdCONS.col, '');
	                }
	            }
            }
	    break;
	    case 3:
	        for (row = 2; row < grdOther.rows; row++)
            {
                if (grdOther.GetGridControl().isSelected(row))
                {
	                if (grdOther.col == OTHER_ORDER_CODE || grdOther.col == OTHER_ORDER_NAME)
	                {
	                    grdOther.SetGridText(row, OTHER_ORDER_PK, '');
	                    grdOther.SetGridText(row, grdCONS.col, '');
	                }
	            }
            }
	    break;
	}
}

function OnDelete()
{
	switch(idTab.GetCurrentPageNo())
	{
		case 0:
		    if(confirm("Are you sure to delete !!!"))
            {
                for (row = 2; row < grdEQ.rows; row++)
                {
                    if (grdEQ.GetGridControl().isSelected(row))
                    {
                        if (grdEQ.GetGridData(grdEQ.row, EQ_PK) == '')
                        {						            				
                            grdEQ.RemoveRowAt(row);
                        }        			
                        else 
                        {  
                            grdEQ.DeleteRowAt(row);
                        }
                    }
                }
            }
		break;
		case 1:
		    if(confirm("Are you sure to delete !!!"))
            {
                for (row = 2; row < grdCONS.rows; row++)
                {
                    if (grdCONS.GetGridControl().isSelected(row))
                    {
                        if (grdCONS.GetGridData(grdCONS.row, CONS_PK) == '')
                        {						            				
                            grdCONS.RemoveRowAt(row);
                        }        			
                        else 
                        {  
                            grdCONS.DeleteRowAt(row);
                        }
                    }
                }
            }
		break;
		case 2:
			if(confirm("Are you sure to delete !!!"))
            {
                for (row = 2; row < grdCM.rows; row++)
                {
                    if (grdCM.GetGridControl().isSelected(row))
                    {
                        if (grdCM.GetGridData(grdCM.row, CM_PK) == '')
                        {						            				
                            grdCM.RemoveRowAt(row);
                        }        			
                        else 
                        {  
                            grdCM.DeleteRowAt(row);
                        }
                    }
                }
            }
		break;
		case 3:
			if(confirm("Are you sure to delete !!!"))
            {
                for (row = 2; row < grdOther.rows; row++)
                {
                    if (grdOther.GetGridControl().isSelected(row))
                    {
                        if (grdOther.GetGridData(grdOther.row, OTHER_PK) == '')
                        {						            				
                            grdOther.RemoveRowAt(row);
                        }        			
                        else 
                        {  
                            grdOther.DeleteRowAt(row);
                        }
                    }
                }
            }
		break;
	}
}

function OnUnDelete()
{
	switch(idTab.GetCurrentPageNo())
	{
		case 0:
			for (row = 2; row < grdEQ.rows; row++)
            {
                if (grdEQ.GetGridControl().isSelected(row))
                {
                    grdEQ.UnDeleteRowAt(row);
                }
            }
		break;
		case 1:
            for (row = 2; row < grdCONS.rows; row++)
            {
                if (grdCONS.GetGridControl().isSelected(row))
                {
                    grdCONS.UnDeleteRowAt(row);
                }
            }   
		break;
		case 2:
            for (row = 2; row < grdCM.rows; row++)
            {
                if (grdCM.GetGridControl().isSelected(row))
                {
                    grdCM.UnDeleteRowAt(row);
                }
            }  
		break;
		case 3:
			dso_grdOther.RemoveRowAt(grdOther.row);
		break;
	}
}

function onPrint(n)
{
    if (txtProjectPk.text != "")
    {    
        switch (n)
        {
            case 1:
                switch(idTab.GetCurrentPageNo())
                {
	                case 0:
		                var path = System.RootURL + "/reports/61/04/61040140_eq.aspx?p_project_pk=" + txtProjectPk.text
		                + "&p_budget_no="	+ lstBudgetNo.value + "&p_work="		+ ''
		                + "&p_order_work="	+ txtOrderWork_Pk.text	+ "&p_lst_filter="	+ lstFilter1.value
		                + "&p_filter="		+ txtFilter1.text;
		                System.OpenTargetPage(path , 'newform');
	                break;
	                case 1:
		                var path = System.RootURL + "/reports/61/04/61040140_cons.aspx?p_project_pk=" + txtProjectPk.text
		                + "&p_budget_no="	+ lstBudgetNo.value + "&p_work="		+ ''
		                + "&p_order_work="	+ txtOrderWork_Pk.text	+ "&p_lst_filter="	+ lstFilter2.value
		                + "&p_filter="		+ txtFilter2.text;
		                System.OpenTargetPage(path , 'newform');
	                break;
	                case 2:
		                var path = System.RootURL + "/reports/61/04/61040140_cm.aspx?p_project_pk=" + txtProjectPk.text
		                + "&p_budget_no="	+ lstBudgetNo.value + "&p_work="		+ ''
		                + "&p_order_work="	+ txtOrderWork_Pk.text	+ "&p_lst_filter="	+ ''
		                + "&p_filter="		+ '';
		                System.OpenTargetPage(path , 'newform');
	                break;
	                case 3:
		                var path = System.RootURL + "/reports/61/04/61040140_other.aspx?p_project_pk=" + txtProjectPk.text
		                + "&p_budget_no="	+ lstBudgetNo.value + "&p_work="		+ ''
		                + "&p_order_work="	+ txtOrderWork_Pk.text	+ "&p_lst_filter="	+ lstFilter3.value
		                + "&p_filter="		+ txtFilter3.text;
		                System.OpenTargetPage(path , 'newform');
	                break;
                }
            break;
            case 2:
                switch(idTab.GetCurrentPageNo())
                {
	                case 0:
		                var path = System.RootURL + "/reports/kp/bm/kpbm00050_eq_1.aspx?p_project_pk=" + txtProjectPk.text
		                + "&p_budget_no="	+ lstBudgetNo.value + "&p_work="		+ ''
		                + "&p_order_work="	+ txtOrderWork_Pk.text	+ "&p_lst_filter="	+ lstFilter1.value
		                + "&p_filter="		+ txtFilter1.text;
		                System.OpenTargetPage(path , 'newform');
	                break;
	                case 1:
		                var path = System.RootURL + "/reports/kp/bm/kpbm00050_cons_1.aspx?p_project_pk=" + txtProjectPk.text
		                + "&p_budget_no="	+ lstBudgetNo.value ;
		                System.OpenTargetPage(path , 'newform');
	                break;
	                case 2:
		                var path = System.RootURL + "/reports/kp/bm/kpbm00050_cm_1.aspx?p_project_pk=" + txtProjectPk.text
		                + "&p_budget_no="	+ lstBudgetNo.value + "&p_work="		+ ''
		                + "&p_order_work="	+ txtOrderWork_Pk.text	+ "&p_lst_filter="	+ lstFilter1.value
		                + "&p_filter="		+ txtFilter1.text;
		                System.OpenTargetPage(path , 'newform');
	                break;
	                case 3:
		                var path = System.RootURL + "/reports/kp/bm/kpbm00050_other_1.aspx?p_project_pk=" + txtProjectPk.text
		                + "&p_budget_no="	+ lstBudgetNo.value + "&p_work="		+ ''
		                + "&p_order_work="	+ txtOrderWork_Pk.text	+ "&p_lst_filter="	+ lstFilter1.value
		                + "&p_filter="		+ txtFilter1.text;
		                System.OpenTargetPage(path , 'newform');
	                break;
                }
            break;
            case 3:
                var path = System.RootURL + "/reports/kp/bm/rpt_kpbm215_summary.aspx?p_project_pk=" + txtProjectPk.text + "&p_budget_pk="	+ lstBudgetNo.value;
                System.OpenTargetPage(path , 'newform');
            break;
//            case 4:
//                var path = System.RootURL + "/reports/kp/bm/kpbm00050_status.aspx?p_project_pk=" + txtProjectPk.text
//                        + "&p_project_cd="	+ txtProject_Cd.text + "&p_project_nm="	+ txtProject_Nm.text
//		                + "&p_budget_no="	+ lstBudgetNo.value + "&p_work="		+ ''
//		                + "&p_order_work="	+ txtOrderWork_Pk.text	+ "&p_lst_filter="	+ lstFilter1.value
//		                + "&p_filter="		+ txtFilter1.text;
//                System.OpenTargetPage(path , 'newform');
//            break;
        }
    }
}

function CalcBalane()
{
	var _Sum_ContAmt 	 = 0;
    var _Trans_Amt 		 = 0;
    var _Balance 		 = 0;
    var _Sum_BookAmt_Top = 0;        
	
	switch(idTab.GetCurrentPageNo())
	{
		case 0:
			txtBudgetAMT_Total.text = _Sum_ContAmt;
			txtBalance.text = _Balance;
		break;	
		case 1:
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
		break;
		case 2:
			txtBudgetAMT_Total.text = _Sum_ContAmt;
			txtBalance.text = _Balance;
		break;
		case 3:
			txtBudgetAMT_Total.text = _Sum_ContAmt;
			txtBalance.text = _Balance;
		break;
	}
}

function OnReceiveData(obj)
{
	switch(obj.id)
	{
		case 'dso_BudgetNo':
			dso_top.Call("SELECT");
		break;
		case 'dso_top':
			OnSearch();
		break;
		case 'dso_Status':
		    if (txtStatus.text == 'Approved')
            {
                alert('Budget No ' + lstBudgetNo.GetText() + ' already confirm.\nYou can not modify data.');
                OnSearch();
            }
            else 
            {
	            flag = '';
	            switch(idTab.GetCurrentPageNo())
	            {
		            case 0:
			            dso_grdEQ.Call();
		            break;
		            case 1:	
			            dso_grdCONS.Call();
		            break;
		            case 2:
			            dso_grdCM.Call();
		            break;
		            case 3:
			            dso_grdOther.Call();
		            break;
	            }
            }
		break;
		case 'dso_grdEQ':
			var ctl = grdEQ.GetGridControl();
			
		    for (row = 2; row < grdEQ.rows; row++)
            {
                if ( grdEQ.GetGridData(row, EQ_LEVEL_NUM) == "1" )
                { 
                    grdEQ.SetRowEditable(row, false);
		            grdEQ.SetCellBgColor(row, 0, row, grdEQ.cols - 1, Number('0XF4E6E0'));
		        }
		        
		        if (chkQty.value == 'Y')
		        {
		            if (grdEQ.GetGridData(row, EQ_LEVEL_NUM) != 1)
                    {				    
                        if (grdEQ.GetGridData(row, EQ_QTY) == 0)
                        {
                            grdEQ.GetGridControl().RowHidden(row) = true;
                        }					
                    }
                    
				    if(grdEQ.GetGridData(row, EQ_PK) == '' && grdEQ.GetGridData(row, EQ_TECPS_UNDERTAKECTRTBASC_PK) != '')
				    {
				        // lay tu version truoc
					    grdEQ.SetCellBgColor(row, 0, row, grdEQ.cols-1, 0x8B8B52);
				        grdEQ.SetGridText(row, grdEQ.cols-1, 0x10);
				    }
		        }
            }
            
			if (flag == '')
			{
			    dso_grdEQ_Pro.Call();
			}
			else
			{
				Merge_grid(grdEQ);

				// perform chua nhap, lay tu contract detail qua
				if (grdEQ.rows <= 2)
				{
					txtBudgetNo.text = lstBudgetNo.GetText();
					dso_grdEQ_UNDERTAKE.Call('SELECT');
				}
				else
				{
//				    budgetNo = lstBudgetNo.GetText();
//				    arrayBudget = budgetNo.split(".");				    
//				    
//					if (arrayBudget[1] != 0)
//					{
//						for (row = 2; row < grdEQ.rows; row++ )
//						{
//							grdEQ.SetGridText(row, EQ_TECPS_PERFORMBUDGETBASC_PK,	lstBudgetNo.value);
//							grdEQ.SetGridText(row, EQ_UNDERTAKESEQ, lstBudgetNo.GetText());
//						}
//					}
				}
			}
		break;
		case 'dso_grdEQ_Pro':
			OnSearch();
		break;
		case 'dso_grdCONS':
		    var ctl = grdCONS.GetGridControl();
		    
		    for (row = 2; row < grdCONS.rows; row++)
            {
                if ( grdCONS.GetGridData(row, CONS_LEVEL_NUM) == "1" )
                {
                    grdCONS.SetRowEditable(row, false);
		            grdCONS.SetCellBgColor(row, 0, row, grdCONS.cols - 1, Number('0XF4E6E0'));
		        }
		        
		        if (chkQty.value == 'Y')
			    {
                    if (grdCONS.GetGridData(row, CONS_LEVEL_NUM) != 1)
                    {				    
                        if (grdCONS.GetGridData(row, CONS_QTY) == 0)
                        {
                            grdCONS.GetGridControl().RowHidden(row) = true;
                        }					
                    }
                    
			        if(grdCONS.GetGridData(row, CONS_PK) == '' && grdCONS.GetGridData(row, CONS_TECPS_UNDERTAKECTRTBASC_PK) != '')
			        {
			            // lay tu 1.2.3 qua
			            alert('');
				        grdCONS.SetCellBgColor(row, 0, row, grdCONS.cols-1, 0x8B8B52);
				        grdCONS.SetGridText(row, grdCONS.cols-1, 0x10);
			        }
                }
            }
			
			if (flag == '')
			{
			    dso_grdCONS_Pro.Call();
			}
			else
			{
				Merge_grid(grdCONS);

				// perform chua nhap, lay tu contract detail qua
				if (grdCONS.rows <= 2)
				{
					txtBudgetNo.text = lstBudgetNo.GetText();
					dso_grdCONS_UNDERTAKE.Call('SELECT');
				}
				else
				{
//				    budgetNo = lstBudgetNo.GetText();
//				    arrayBudget = budgetNo.split(".");
				    
//					if (arrayBudget[1] != 0)
//					{
//						for (row = 2; row < grdCONS.rows; row++ )
//						{
//							grdCONS.SetGridText(row, CONS_TECPS_PERFORMBUDGETBASC_PK,	lstBudgetNo.value);
//							grdCONS.SetGridText(row, CONS_UNDERTAKESEQ, lstBudgetNo.GetText());
//						}
//					}
				}
			}
		break;
		case 'dso_grdCONS_Pro':
			OnSearch();
		break;
		case 'dso_grdCM':
		    var ctl = grdCM.GetGridControl();
		    for (row = 2; row < grdCM.rows; row++)
            {
                if ( grdCM.GetGridData(row, CM_LEVEL_NUM) == "1" )
                { 
                    grdCM.SetRowEditable(row, false);
		            grdCM.SetCellBgColor(row, 0, row, grdCM.cols - 1, Number('0XF4E6E0'));
		        }
		        
		        if (chkQty.value == 'Y')
			    {
                    if (grdCM.GetGridData(row, CM_LEVEL_NUM) != 1)
                    {				    
                        if (grdCM.GetGridData(row, CM_QTY) == 0)
                        {
                            grdCM.GetGridControl().RowHidden(row) = true;
                        }					
                    }
                    
			        if(grdCM.GetGridData(row, CM_PK) == '' && grdCM.GetGridData(row, CM_TECPS_UNDERTAKECTRTBASC_PK) != '')
			        {
			            // lay tu 1.2.3 qua
				        grdCM.SetCellBgColor(row, 0, row, grdCM.cols-1, 0x8B8B52);
				        grdCM.SetGridText(row, grdCM.cols-1, 0x10);
			        }
                }
            }

			if (flag == '')
			{
				dso_grdCM_Pro.Call();
			}
			else
			{
				Merge_grid(grdCM);
				// perform chua nhap, lay tu contract detail qua
				if (grdCM.rows <= 2)
				{
					txtBudgetNo.text = lstBudgetNo.GetText();
					dso_grdCM_UNDERTAKE.Call('SELECT');
				}
				else
				{
//				    budgetNo = lstBudgetNo.GetText();
//				    arrayBudget = budgetNo.split(".");				    
//				    
//					if (arrayBudget[1] != 0)
//					{
//						for (row = 2; row < grdCM.rows; row++ )
//						{
//							grdCM.SetGridText(row, CM_TECPS_PERFORMBUDGETBASC_PK,	lstBudgetNo.value);
//							grdCM.SetGridText(row, CM_UNDERTAKESEQ, lstBudgetNo.GetText());
//						}
//					}
				}
			}
		break;
		case 'dso_grdCM_Pro':
			OnSearch();
		break;
		case 'dso_grdOther':
		    var ctl = grdOther.GetGridControl();
		    for (row = 2; row < grdOther.rows; row++)
            {
                if ( grdOther.GetGridData(row, OTHER_LEVEL_NUM) == "1" )
                { 
                    grdOther.SetRowEditable(row, false);
		            grdOther.SetCellBgColor(row, 0, row, grdOther.cols - 1, Number('0XF4E6E0'));
		        }
		        
		        if (chkQty.value == 'Y')
			    {
                    if (grdOther.GetGridData(row, OTHER_LEVEL_NUM) != 1)
                    {				    
                        if (grdOther.GetGridData(row, OTHER_QTY) == 0)
                        {
                            grdOther.GetGridControl().RowHidden(row) = true;
                        }					
                    }
                    
			        if(grdOther.GetGridData(row, OTHER_PK) == '' && grdOther.GetGridData(row, OTHER_TECPS_UNDERTAKECTRTBASC_PK) != '')
			        {
			            // lay tu 1.2.3 qua
				        grdOther.SetCellBgColor(row, 0, row, grdOther.cols-1, 0x8B8B52);
				        grdOther.SetGridText(row, grdOther.cols-1, 0x10);
			        }
                }
            }

			if (flag == '')
			{
				dso_grdOther_Pro.Call();
			}
			else
			{
				Merge_grid(grdOther);
				// perform chua nhap, lay tu contract detail qua
				if (grdOther.rows <= 2)
				{
					txtBudgetNo.text = lstBudgetNo.GetText();
					dso_grdOther_UNDERTAKE.Call('SELECT');
				}
				else
				{
//				    budgetNo = lstBudgetNo.GetText();
//				    arrayBudget = budgetNo.split(".");				    
//				    
//					if (arrayBudget[1] != 0)
//					{
//						for (row = 2; row < grdOther.rows; row++ )
//						{
//							grdOther.SetGridText(row, OTHER_TECPS_PERFORMBUDGETBASC_PK,	lstBudgetNo.value);
//							grdOther.SetGridText(row, OTHER_UNDERTAKESEQ, lstBudgetNo.GetText());
//						}
//					}
				}
			}
		break;
		case 'dso_grdOther_Pro':
			OnSearch();
		break;
		case 'dso_grdEQ_UNDERTAKE':
			for (row = 2; row < grdEQ.rows; row++ )
			{
				if(grdEQ.GetGridData(row, EQ_PK) == '')
				{
					grdEQ.SetCellBgColor(row, 0, row, grdEQ.cols-1, 0x3366CC);
					grdEQ.SetGridText(row, grdEQ.cols-1, 0x20);
				}
			}
			Merge_grid(grdEQ);
		break;
		case 'dso_grdCONS_UNDERTAKE':
			for (row = 2; row < grdCONS.rows; row++ )
			{
				if(grdCONS.GetGridData(row, CONS_PK) == '')
				{
					grdCONS.SetCellBgColor(row, 0, row, grdCONS.cols-1, 0x3366CC);
					grdCONS.SetGridText(row, grdCONS.cols-1, 0x10);
				}
			}
			Merge_grid(grdCONS);
		break;
		case 'dso_grdCM_UNDERTAKE':
			for (row = 2; row < grdCM.rows; row++ )
			{
				if(grdCM.GetGridData(row, CM_PK) == '')
				{
					grdCM.SetCellBgColor(row, 0, row, grdCM.cols-1, 0x3366CC);
					grdCM.SetGridText(row, grdCM.cols-1, 0x10);
				}
			}
			Merge_grid(grdCM);
		break;
		case 'dso_grdOther_UNDERTAKE':
			for (row = 2; row < grdOther.rows; row++ )
			{
				if(grdOther.GetGridData(row, OTHER_PK) == '')
				{
					grdOther.SetCellBgColor(row, 0, row, grdOther.cols-1, 0x3366CC);
					grdOther.SetGridText(row, grdOther.cols-1, 0x10);
				}
			}
			Merge_grid(grdOther);
		break;
	}
}

function Find_Heigher_Level(grd, value, row)
{
	var i = row;
    if ( grd.GetGridData(row, CONS_LEVEL_NUM) == "1" )
    { 
		grd.SetCellBgColor(row, 0, row, grd.cols - 1, 0xEDEDED);
		
        return 0;
    }    
    else
    {
        while (i >= 1)
        {
            if ( grd.GetGridData(i, CONS_LEVEL_NUM) == value - 1 )
            {
                return i;
            }
            i = i - 1
        }
    }    
}

function OnClick(obj)
{
	switch(obj.id)
	{
	    case 'grdEQ':		    
		break;
		case 'grdCONS':
		break;
		case 'grdCM':
		break;
		case 'grdOther':
		break;
	}
}

function CheckData(obj)
{
	switch(obj.id)
	{
		case 'grdEQ':
			if (obj.col == EQ_QTY || obj.col == EQ_UNIT_COST || obj.col == EQ_WEIGHT)
			{
				if (isNaN(obj.GetGridData(obj.row, obj.col)))
				{
					obj.SetGridText(obj.row, obj.col, 0);
				}
                
				var amt = 0;
				amt = Number(obj.GetGridData(obj.row, EQ_QTY)) * Number(obj.GetGridData(obj.row, EQ_UNIT_COST));
				obj.SetGridText(obj.row, EQ_AMT, amt);
			}
		break;
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
		case 'grdCM':
			var dir_amt = 0, outsite_amt = 0, qty = 0;
			var vDir_MM = 0, vDir_UP = 0, vOut_MM = 0, vOut_UP = 0;
			
			vDir_MM = obj.GetGridData(obj.row, CM_DIRECT_MM).replace(",", "").replace("\n", "").replace("\r", "");
			vDir_UP = obj.GetGridData(obj.row, CM_DIRECT_UNIT_COST).replace(",", "").replace("\n", "").replace("\r", "");
			vOut_MM = obj.GetGridData(obj.row, CM_OUTSRC_MM).replace(",", "").replace("\n", "").replace("\r", "");
			vOut_UP = obj.GetGridData(obj.row, CM_OUTSRC_UNIT_COST).replace(",", "").replace("\n", "").replace("\r", "");
			
			if (obj.col == CM_DIRECT_CCY)
			{
				if (obj.GetGridData(obj.row, CM_OUTSRC_CCY) != '' || obj.GetGridData(obj.row, CM_DIRECT_CCY) == '')
				{					
					obj.SetGridText(obj.row, CM_DIRECT_CCY, '');	
					obj.SetGridText(obj.row, CM_DIRECT_MM, '0');
					obj.SetGridText(obj.row, CM_DIRECT_UNIT_COST, '0');

					dir_amt		= Number(vDir_MM) * Number(vDir_UP);
					outsite_amt = Number(vOut_MM) * Number(vOut_UP);
					qty			= Number(vDir_MM) + Number(vOut_MM);
					
					obj.SetGridText(obj.row, CM_QTY, qty);
					obj.SetGridText(obj.row, CM_DIRECT_AMT, dir_amt);
					obj.SetGridText(obj.row, CM_OUTSRC_AMT, outsite_amt);
					obj.SetGridText(obj.row, CM_SUM, Number(dir_amt) + Number(outsite_amt));
				}
			}
            else if (obj.col == CM_OUTSRC_CCY)
			{
				if (obj.GetGridData(obj.row, CM_DIRECT_CCY) != '' || obj.GetGridData(obj.row, CM_OUTSRC_CCY) == '')
				{
					obj.SetGridText(grdCM.row, CM_OUTSRC_CCY, '')
					obj.SetGridText(grdCM.row, CM_OUTSRC_MM, '0');
					obj.SetGridText(grdCM.row, CM_OUTSRC_UNIT_COST, '0');

					dir_amt		= Number(vDir_MM) * Number(vDir_UP);
					outsite_amt = Number(vOut_MM) * Number(vOut_UP);
					qty			= Number(vDir_MM) + Number(vOut_MM);
					
					obj.SetGridText(obj.row, CM_QTY, qty);
					obj.SetGridText(obj.row, CM_DIRECT_AMT, dir_amt);
					obj.SetGridText(obj.row, CM_OUTSRC_AMT, outsite_amt);
					obj.SetGridText(obj.row, CM_SUM, Number(dir_amt) + Number(outsite_amt));
				}
			}
            else if (obj.col == CM_DIRECT_MM || obj.col == CM_DIRECT_UNIT_COST)
			{
			    if (obj.GetGridData(obj.row, CM_DIRECT_CCY) == '') return;
			    
				if (isNaN(obj.GetGridData(obj.row, obj.col)))
				{
					obj.SetGridText(obj.row, obj.col, 0);
				}
				
				dir_amt		= Number(vDir_MM) * Number(vDir_UP);
				outsite_amt = Number(vOut_MM) * Number(vOut_UP);
				qty			= Number(vDir_MM) + Number(vOut_MM);
				
				obj.SetGridText(obj.row, CM_QTY, qty);
				obj.SetGridText(obj.row, CM_DIRECT_AMT, dir_amt);
				obj.SetGridText(obj.row, CM_OUTSRC_AMT, outsite_amt);
				obj.SetGridText(obj.row, CM_SUM, Number(dir_amt) + Number(outsite_amt));
			}
            else if (obj.col == CM_OUTSRC_MM || obj.col == CM_OUTSRC_UNIT_COST)
			{
			    if (obj.GetGridData(obj.row, CM_OUTSRC_CCY) == '') return;
			    
				if (isNaN(obj.GetGridData(obj.row, obj.col)))
				{
					obj.SetGridText(obj.row, obj.col, 0);
				}
				
				dir_amt		= Number(vDir_MM) * Number(vDir_UP);
				outsite_amt = Number(vOut_MM) * Number(vOut_UP);
				qty			= Number(vDir_MM) + Number(vOut_MM);
				
				obj.SetGridText(obj.row, CM_QTY, qty);
				obj.SetGridText(obj.row, CM_DIRECT_AMT, dir_amt);
				obj.SetGridText(obj.row, CM_OUTSRC_AMT, outsite_amt);
				obj.SetGridText(obj.row, CM_SUM, Number(dir_amt) + Number(outsite_amt));
			}
			
		break;
		case 'grdOther':
			if (obj.col == OTHER_QTY || obj.col == OTHER_UNIT_PRICE)
			{
				if (isNaN(obj.GetGridData(obj.row, obj.col)))
				{
					obj.SetGridText(obj.row, obj.col, 0);
				}
				var amt = 0;
				amt = Number(obj.GetGridData(obj.row, OTHER_QTY)) * Number(obj.GetGridData(obj.row, OTHER_UNIT_PRICE));
				obj.SetGridText(obj.row, OTHER_AMT, amt);
			}
		break;
	}
}

function CheckNum(obj)
{
	
}

function OnDBClick(obj)
{
	switch(obj.id)
	{
		case 'grdEQ':		    
			if (grdEQ.col == EQ_ORDER_CODE || grdEQ.col == EQ_ORDER_NAME)
			{
		        if (grdEQ.GetGridData(grdEQ.row, EQ_LEVEL_PK) != '') 
		        {
		            grdEQ.row = -1;
		            return;
		        }
		        
				var path = System.RootURL + "/form/kp/bm/kpbm00050_Order_W_Div.aspx?p_project_pk=" + txtProjectPk.text;
				var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
				 
				if (object != null)
				{
					grdEQ.SetGridText(grdEQ.row, EQ_ORDER_PK,   object[0]);
					grdEQ.SetGridText(grdEQ.row, EQ_ORDER_CODE, object[1]);
					grdEQ.SetGridText(grdEQ.row, EQ_ORDER_NAME, object[2]);
				}
			}
			else if (grdEQ.col == EQ_BUDGET_CODE)
			{
		        if (grdEQ.GetGridData(grdEQ.row, EQ_LEVEL_PK) != '') 
		        {
		            grdEQ.row = -1;
		            return;
		        }
		        
				var fpath = System.RootURL + "/form/kp/bm/kpbm00050_Budget.aspx?p_project_pk=" + txtProjectPk.text;
				var object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
				if(object != null)
				{
					grdEQ.SetGridText(grdEQ.row, EQ_BUDGET_PK,   object[0]);
					grdEQ.SetGridText(grdEQ.row, EQ_BUDGET_CODE, object[1]);
				}
			}
			else if (grdEQ.col == EQ_LEVEL_CODE || grdEQ.col == EQ_LEVEL_NAME)
			{
			    if (grdEQ.GetGridData(grdEQ.row, EQ_LEVEL_NUM) != '1')
			    {
			        var fpath = System.RootURL + "/form/kp/bm/kpbm00050_Item.aspx?p_project_pk=" + txtProjectPk.text
			        + "&p_project_cd=" + txtProject_Cd.text + "&p_project_nm=" + txtProject_Nm.text
			        + "&p_level_pk=" + grdEQ.GetGridData(grdEQ.row, EQ_PARENT_PK)
			        + "&p_status=UPDATE";
			        
				    var object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
    				
    				var temp;
				    if (object != null)
				    {
				        for (i = 0; i < object.length; i++)
				        {
				            temp = object[i];
				            
				            // by level_code
				            //if(!CheckDuplicateLevelChild(grdEQ, temp[3], temp[4])) return;
				            
				            grdEQ.SetGridText(grdEQ.row, EQ_LEVEL_CODE,          temp[4]);
				            grdEQ.SetGridText(grdEQ.row, EQ_LEVEL_NAME,          temp[5]);
				            grdEQ.SetGridText(grdEQ.row, CONS_TECPS_ITEM_PK,     temp[3]);
				        }
				    }
				}
				else
				{
				    OnNewFree();
				}
			}
		break;
		case 'grdCONS':			
			if (grdCONS.col == CONS_ORDER_CODE || grdCONS.col == CONS_ORDER_NAME)
			{
			    if (grdCONS.GetGridData(grdCONS.row, CONS_LEVEL_PK) != '') 
		        {
		            grdCONS.row = -1;
		            return;
		        }
		        
				var path = System.RootURL + "/form/kp/bm/kpbm00050_Order_W_Div.aspx?p_project_pk=" + txtProjectPk.text;
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
			    if (grdCONS.GetGridData(grdCONS.row, CONS_LEVEL_PK) != '') 
		        {
		            grdCONS.row = -1;
		            return;
		        }
		        
				var fpath = System.RootURL + "/form/kp/bm/kpbm00050_Budget.aspx?p_project_pk=" + txtProjectPk.text;
				var object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
				if(object != null)
				{
					grdCONS.SetGridText(grdCONS.row, CONS_BUDGET_PK,   object[0]);
					grdCONS.SetGridText(grdCONS.row, CONS_BUDGET_CODE, object[1]);
				}
			}
			else if (grdCONS.col == CONS_CODE || grdCONS.col == CONS_NAME)
			{
			    if (grdCONS.GetGridData(grdCONS.row, CONS_LEVEL_NUM) != '1')
			    {
			        var fpath = System.RootURL + "/form/kp/bm/kpbm00050_Item.aspx?p_project_pk=" + txtProjectPk.text
			        + "&p_project_cd=" + txtProject_Cd.text + "&p_project_nm=" + txtProject_Nm.text
			        + "&p_level_pk=" + grdCONS.GetGridData(grdCONS.row, CONS_PARENT_PK)
			        + "&p_status=UPDATE";
			        
				    var object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
    				
    				var temp;
				    if (object != null)
				    {
				        for (i = 0; i < object.length; i++)
				        {
				            temp = object[i];
				            
				            // by level_code
				            //if(!CheckDuplicateLevelChild(grdCONS, temp[3], temp[4])) return;
				            
				            grdCONS.SetGridText(grdCONS.row, CONS_CODE,          temp[4]);
				            grdCONS.SetGridText(grdCONS.row, CONS_NAME,          temp[5]);
				            grdCONS.SetGridText(grdCONS.row, CONS_TECPS_ITEM_PK, temp[3]);
				        }
				    }
				}
				else
				{
				    OnNewFree();
				}
			}
		break;
		case 'grdCM':
			if (grdCM.col == CM_OUTSITE_CODE || grdCM.col == CM_OUTSITE_NAME)
			{
			    if (grdCM.GetGridData(grdCM.row, CM_LEVEL_PK) != '') 
		        {
		            grdCM.row = -1;
		            return;
		        }
		        
				var path = System.RootURL + "/form/kp/bm/kpbm00050_Order_W_Div.aspx?p_project_pk=" + txtProjectPk.text;
				var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
				 
				if (object != null)
				{
					grdCM.SetGridText(grdCM.row, CM_OUTSITE_PK,   object[0]);
					grdCM.SetGridText(grdCM.row, CM_OUTSITE_CODE, object[1]);
					grdCM.SetGridText(grdCM.row, CM_OUTSITE_NAME, object[2]);
				}
			}
			else if (grdCM.col == CM_LEVEL_CODE || grdCM.col == CM_LEVEL_NAME)
			{
			    if (grdCM.GetGridData(grdCM.row, CM_LEVEL_NUM) != '1')
			    {
			        var fpath = System.RootURL + "/form/kp/bm/kpbm00050_Item.aspx?p_project_pk=" + txtProjectPk.text
			        + "&p_project_cd=" + txtProject_Cd.text + "&p_project_nm=" + txtProject_Nm.text
			        + "&p_level_pk=" + grdCM.GetGridData(grdCM.row, CM_PARENT_PK)
			        + "&p_status=UPDATE";
			        
				    var object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
    				
    				var temp;
				    if (object != null)
				    {
				        for (i = 0; i < object.length; i++)
				        {
				            temp = object[i];
				            
				            // by level_code
				            //if(!CheckDuplicateLevelChild(grdCM, temp[3], temp[4])) return;
				            grdCM.SetGridText(grdCM.row, CM_LEVEL_CODE,     temp[5]);
				            grdCM.SetGridText(grdCM.row, CM_LEVEL_NAME,     temp[5]);
				            grdCM.SetGridText(grdCM.row, CM_TECPS_ITEM_PK,  temp[3]);
				        }
				    }
				}
				else
				{
				    OnNewFree();
				}
			}
		break;
		case 'grdOther':
		    if (grdOther.col == OTHER_LEVEL_CODE || grdOther.col == OTHER_LEVEL_NAME)
			{
			    if (grdOther.GetGridData(grdOther.row, OTHER_LEVEL_NUM) != '1')
			    {
			        var fpath = System.RootURL + "/form/kp/bm/kpbm00050_Item.aspx?p_project_pk=" + txtProjectPk.text
			        + "&p_project_cd=" + txtProject_Cd.text + "&p_project_nm=" + txtProject_Nm.text
			        + "&p_level_pk=" + grdOther.GetGridData(grdOther.row, OTHER_PARENT_PK)
			        + "&p_status=UPDATE";
			        
				    var object = System.OpenModal( fpath , 700 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
    				
    				var temp;
				    if (object != null)
				    {
				        for (i = 0; i < object.length; i++)
				        {
				            temp = object[i];
				            
				            // by level_code
				            //if(!CheckDuplicateLevelChild(grdCM, temp[3], temp[4])) return;
				            grdOther.SetGridText(grdOther.row, OTHER_LEVEL_CODE,     temp[5]);
				            grdOther.SetGridText(grdOther.row, OTHER_LEVEL_NAME,     temp[5]);
				            grdOther.SetGridText(grdOther.row, OTHER_TECPS_ITEM_PK,  temp[3]);
				        }
				    }
				}
				else
				{
				    OnNewFree();
				}
			}
			else if (grdOther.col == OTHER_ORDER_CODE || grdOther.col == OTHER_ORDER_NAME)
			{			    
			    if (grdOther.GetGridData(grdOther.row, OTHER_LEVEL_PK) != '') 
		        {
		            grdOther.row = -1;
		            return;
		        }
		        
				var path = System.RootURL + "/form/kp/bm/kpbm00050_Order_W_Div.aspx?p_project_pk=" + txtProjectPk.text;
				var object = System.OpenModal( path ,800 ,600 ,'resizable:yes;status:yes');
				 
				if (object != null)
				{
					grdOther.SetGridText(grdOther.row, OTHER_ORDER_PK,   object[0]);
					grdOther.SetGridText(grdOther.row, OTHER_ORDER_CODE, object[1]);
					grdOther.SetGridText(grdOther.row, OTHER_ORDER_NAME, object[2]);
				}
			}
		break;
	}
}

function SetRowBackGroundColor(p_oGrid, p_col_val, p_color)
{
   for(var i=1;i<p_oGrid.rows;i++)
   {
      if(p_oGrid.GetGridData( i, acc_pk) == p_col_val)
      {
         p_oGrid.SetCellFontColor(i,0,i,p_oGrid.cols-1,p_color);
         return;
      }
   }
}

function OnCheckCol(n)
{
	switch(idTab.GetCurrentPageNo())
	{
		case 0:			
			var fg = grdEQ.GetGridControl(); 
			switch(n)
			{
				case 1:
					if (chk1.value == 'Y')
						fg.ColHidden(EQ_LEVEL) = false;
					else
						fg.ColHidden(EQ_LEVEL) = true;
				break;
				case 2:
					if (chk2.value == 'Y')
						fg.ColHidden(EQ_STANDARD) = false;
					else
						fg.ColHidden(EQ_STANDARD) = true;
				break;
				case 3:
					if (chk3.value == 'Y')
						fg.ColHidden(EQ_WEIGHT) = false;
					else
						fg.ColHidden(EQ_WEIGHT) = true;
				break;
				case 4:

				break;
				case 5:

				break;
				case 6:					
					if (chk6.value == 'Y')
					{
						fg.ColHidden(EQ_ORDER_CODE) = false;
						fg.ColHidden(EQ_ORDER_NAME) = false;
					}
					else
					{
						fg.ColHidden(EQ_ORDER_CODE) = true;
						fg.ColHidden(EQ_ORDER_NAME) = true;
					}
				break;
				case 7:
					if (chk7.value == 'Y')
						fg.ColHidden(EQ_EX_YN) = false;
					else
						fg.ColHidden(EQ_EX_YN) = true;
				break;
				case 8:
					if (chk8.value == 'Y')
						fg.ColHidden(EQ_BUDGET_CODE) = false;
					else
						fg.ColHidden(EQ_BUDGET_CODE) = true;
				break;
				case 9:
					if (chk9.value == 'Y')
						fg.ColHidden(EQ_STANDARD_PBS) = false;
					else
						fg.ColHidden(EQ_STANDARD_PBS) = true;	
				break;
				case 10:
					if (chk10.value == 'Y')
						fg.ColHidden(EQ_DEVL_TERM) = false;
					else
						fg.ColHidden(EQ_DEVL_TERM) = true;
				break;
				case 11:
					if (chk11.value == 'Y')
						fg.ColHidden(EQ_RSLT_YN) = false;
					else
						fg.ColHidden(EQ_RSLT_YN) = true;
				break;
				case 12:

				break;
			}
		break;
		case 1:
			var fg = grdCONS.GetGridControl(); 
			switch (n)
			{
				case 1:
					if (chk21.value == 'Y')
						fg.ColHidden(CONS_LEVEL) = false;
					else
						fg.ColHidden(CONS_LEVEL) = true;
				break;	
				case 2:
					if (chk22.value == 'Y')
						fg.ColHidden(CONS_STAN) = false;
					else
						fg.ColHidden(CONS_STAN) = true;				
				break;
				case 3:
					if (chk23.value == 'Y')
					{
						fg.ColHidden(CONS_RAW) = false;
						fg.ColHidden(CONS_LABOR) = false;
						fg.ColHidden(CONS_EXP_UP) = false;
					}
					else
					{
						fg.ColHidden(CONS_RAW) = true;	
						fg.ColHidden(CONS_LABOR) = true;	
						fg.ColHidden(CONS_EXP_UP) = true;	
					}
				break;
				case 4:
					if (chk24.value == 'Y')
					{
						fg.ColHidden(CONS_ORDER_CODE) = false;
						fg.ColHidden(CONS_ORDER_NAME) = false;
					}
					else
					{
						fg.ColHidden(CONS_ORDER_CODE) = true;
						fg.ColHidden(CONS_ORDER_NAME) = true;
					}
				break;
				case 5:
					if (chk25.value == 'Y')
						fg.ColHidden(CONS_EXEC_YN) = false;
					else
						fg.ColHidden(CONS_EXEC_YN) = true;
				break;
				case 6:
					if (chk26.value == 'Y')
						fg.ColHidden(CONS_DIR_MGT) = false;
					else
						fg.ColHidden(CONS_DIR_MGT) = true;
				break;
				case 7:
					if (chk27.value == 'Y')
						fg.ColHidden(CONS_BUDGET_CODE) = false;
					else
						fg.ColHidden(CONS_BUDGET_CODE) = true;
				break;
				case 8:
					if (chk28.value == 'Y')
						fg.ColHidden(CONS_STAN_CODE) = false;
					else
						fg.ColHidden(CONS_STAN_CODE) = true;
				break;
			}
			

		break;
		case 2:
		break;
		case 3:
			var fg = grdOther.GetGridControl(); 
			switch (n)
			{
			case 1:				
				if (chk41.value == 'Y')
					fg.ColHidden(OTHER_LEVEL) = false;
				else
					fg.ColHidden(OTHER_LEVEL) = true;
			break;
			case 2:				
				if (chk42.value == 'Y')
					fg.ColHidden(OTHER_STANDARD) = false;
				else
					fg.ColHidden(OTHER_STANDARD) = true;
			break;
			case 3:				
				if (chk43.value == 'Y')
				{
					fg.ColHidden(OTHER_ORDER_CODE) = false;
					fg.ColHidden(OTHER_ORDER_NAME) = false;
				}
				else
				{
					fg.ColHidden(OTHER_ORDER_CODE) = true;
					fg.ColHidden(OTHER_ORDER_NAME) = true;
				}
			break;
			}
		break;
	}
}

function OnChangeFilter()
{
    switch(idTab.GetCurrentPageNo())
    {
        case 0:
	        if (lstFilter1.value == 'ALL')
			{
			    txtFilter1.text = '';
                txtFilter1.style.display = 'none';
                idCode1.style.display = "none";
			}
			else if (lstFilter1.value == '1' || lstFilter1.value == '2' || lstFilter1.value == '3')
			{
			    txtFilter1.style.display = '';
			    idCode1.style.display = "";
			}
			else
			{
			    txtFilter1.text = '';
			    txtFilter1.style.display = 'none';
			    idCode1.style.display = "none";
			}
	    break;
        case 1:
	        if (lstFilter2.value == 'ALL')
			{
			    txtFilter2.text = '';
                txtFilter2.style.display = 'none';
				btnLevelCode2.style.display = "none";
				btnLevelCode3.style.display = "none";
				OnSearch();
			}
			else if (lstFilter2.value == '1' || lstFilter2.value == '2' || lstFilter2.value == '3')
			{
			    txtFilter2.style.display = '';
				btnLevelCode2.style.display = "";
				btnLevelCode3.style.display = "none";
			}
			else if (lstFilter2.value == '4')
			{
			    txtFilter2.style.display = '';				
				btnLevelCode2.style.display = "none";
				btnLevelCode3.style.display = "";
			}
	    break;
    }
}
</script>
<html>
<body>
<gw:data id="dso_BudgetNo" onreceive="OnReceiveData(this)"> 
    <xml> 
        <dso id="1" type="list" procedure="SP_SEL_KPBM00050_BUDGETNO" > 
			<input> 
				<input bind="txtProjectPk" />
			</input> 
			<output>
				<output bind="lstBudgetNo" /> 
			</output>
		</dso> 
	</xml> 
</gw:data>
<gw:data id="dso_Status" onreceive="OnReceiveData(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="sp_pro_kpbm00050_status"  > 
			<input> 
				<input bind="txtProjectPk" />
				<input bind="lstBudgetNo" />
			 </input>
			 <output>
				<output bind="txtStatus"/>
			 </output>
		</dso> 
	</xml>
</gw:data>
<gw:data id="dso_grdEQ" onreceive="OnReceiveData(this)"> 
    <xml> 
        <dso id="2" type="grid" parameter="1,2,3,4,5,6,7,8,9,10,13,14,16,17,18,19,20,21,22,23,25,26,27,29,30,31,32" function="SP_SEL_KPBM00050_EQ" procedure="SP_UPD_KPBM00050_EQ" > 
            <input bind="grdEQ">
                <input bind="txtProjectPk" />
				<input bind="lstBudgetNo" />
				<input bind="txtOrderWork_Pk" />
				<input bind="lstFilter1" />
				<input bind="txtFilter1" />
            </input> 
            <output bind="grdEQ" /> 
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dso_grdEQ_UNDERTAKE" onreceive="OnReceiveData(this)"> 
    <xml> 
        <dso id="3" type="grid" function="SP_SEL_KPBM00050_EQ_UNDER" > 
            <input bind="grdEQ">                    
                <input bind="txtProjectPk" />
				<input bind="lstBudgetNo" /> 
            </input> 
            <output bind="grdEQ" /> 
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dso_grdEQ_Pro" onreceive="OnReceiveData(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="sp_pro_kpbm00050_eq"  > 
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
<gw:data id="dso_grdCONS" onreceive="OnReceiveData(this)"> 
    <xml> 
        <dso id="5" type="grid" parameter="1,2,3,4,5,6,7,8,9,10,11,12,15,16,17,19,20,21,22,23,24,25,26,28,29,30,32,33,34,35" function="SP_SEL_KPBM00050_CONS" procedure="SP_UPD_KPBM00050_CONS" > 
            <input bind="grdCONS">                    
                <input bind="txtProjectPk" />
				<input bind="lstBudgetNo" />
				<input bind="txtOrderWork_Pk" />
				<input bind="lstFilter2" />
				<input bind="txtFilter2" />
            </input> 
            <output bind="grdCONS" /> 
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dso_grdCONS_UNDERTAKE" onreceive="OnReceiveData(this)"> 
    <xml> 
        <dso id="4" type="grid" function="SP_SEL_KPBM00050_CONS_UNDER" > 
            <input bind="grdCONS">                    
                <input bind="txtProjectPk" />
				<input bind="lstBudgetNo" /> 
            </input> 
            <output bind="grdCONS" /> 
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dso_grdCONS_Pro" onreceive="OnReceiveData(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="sp_pro_kpbm00050_cons"  > 
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
<gw:data id="dso_grdCM" onreceive="OnReceiveData(this)"> 
    <xml> 
        <dso id="7" type="grid" parameter="0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,17,20,21,22,23,24,25,27,28,29,30,31" function="SP_SEL_KPBM00050_CM" procedure="SP_UPD_KPBM00050_CM" > 
            <input bind="grdCM">                    
                <input bind="txtProjectPk" />
				<input bind="lstBudgetNo" />
            </input> 
            <output bind="grdCM" /> 
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dso_grdCM_UNDERTAKE" onreceive="OnReceiveData(this)"> 
    <xml> 
        <dso id="6" type="grid" function="SP_SEL_KPBM00050_CM_UNDER" > 
            <input bind="grdCM">
                <input bind="txtProjectPk" />
				<input bind="lstBudgetNo" /> 
            </input> 
            <output bind="grdCM" /> 
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dso_grdCM_Pro" onreceive="OnReceiveData(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="sp_pro_kpbm00050_cm"  > 
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
<gw:data id="dso_grdOther" onreceive="OnReceiveData(this)"> 
    <xml> 
        <dso id="9" type="grid" parameter="0,1,2,3,4,6,7,8,9,10,11,12,15,16,17,18,19,20,22,23,24,25,26" function="SP_SEL_KPBM00050_OTHER" procedure="SP_UPD_KPBM00050_OTHER" > 
            <input bind="grdOther">                    
                <input bind="txtProjectPk" />
				<input bind="lstBudgetNo" />
				<input bind="txtOrderWork_Pk" />
				<input bind="lstFilter4" />
				<input bind="txtFilter4" />
            </input> 
            <output bind="grdOther" /> 
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dso_grdOther_UNDERTAKE" onreceive="OnReceiveData(this)"> 
    <xml> 
        <dso id="8" type="grid" function="SP_SEL_KPBM00050_OTHER_UNDER" > 
            <input bind="grdOther">
                <input bind="txtProjectPk" />
				<input bind="lstBudgetNo" /> 
            </input> 
            <output bind="grdOther" /> 
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dso_grdOther_Pro" onreceive="OnReceiveData(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="sp_pro_kpbm00050_other"  > 
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
<gw:data id="dso_top" onreceive="OnReceiveData(this)"> 
	<xml> 
		<dso id="1" type="grid"  function="sp_sel_kpbp122"    > 
			<input bind="Grid_Top">                    
				<input bind="txtProjectPk" /> 
			</input> 
			<output bind="Grid_Top" /> 
		</dso> 
	</xml> 
</gw:data>
<table style="background: #BDE9FF; height: 97%; width: 100%" border="0" >
	<tr>
		<td style="width: 100%; height:98%; background:white">
			<table style="width: 100%; height: 100%" border="0" cellpadding="0" cellspacing="0">
				<tr style="height: 2%">
					<td style="width: 100%">
						<fieldset style="width:100%">
						<table style="width: 100%; height: 100%">
							<tr style="height: 1%">
								<td align="right" width="10%">
									<a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('project')">
									Project&nbsp;</a>
								</td>
								<td width="50%">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tr>
											<td width="40%">
												<gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' />
											</td>
											<td width="60%">
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
								 <td style="width: 15%" ></td>
								 <td width="25%">
								    <table style="width: 100%; height: 100%" border="0" cellpadding="0" cellspacing="0">
								        <tr>						    
								            <td width="40%">Budget Statement No.</td>
								            <td width="60%" align="right"><gw:list id="lstBudgetNo"  styles='width:100%' onchange="OnSearch()" /></td>
								         </td>								        
								        </tr>
								    </table>		
								 <!--td style="width: 15%" align="right">                                      
									Cont. (Y/N)
								</td>
								<td width="25%"><gw:list id="lstContract_YN" styles='width:100%' /></td-->
								<td style="width: 1%">
									<table style="width: 100%; height: 100%">
										<tr>
											<td>
												<gw:button id="ibnUpdte" img="create" alt="Entry Level Code" styles='width:100%;display:none'  onclick="OnEntryLevelCode()" />
											</td>
											<td style="width: 1%" style="display:none">
												<gw:button id="btnNw" img="popup" onclick="" />
											</td>
											<td style="width: 1%">
												<gw:button id="btnNew" img="new" styles='width:100%;display:none'  alt="Add New Level Code" text="New" onclick="OnNew()" />
											</td>											
											<td style="width: 1%">
												<gw:button id="btnNew" img="new" styles='width:100%;display:none'  alt="Add New Free" text="New" onclick="OnNewFree()" />
											</td>
											<td style="width: 1%">
												<gw:button id="btnSave" img="save" styles='width:100%;display:none'  alt="Save" text="Save" onclick="OnSave()" />
											</td>
											<td style="width: 1%">
												<gw:button id="btnRemove" img="cancel" styles='width:100%;display:none'  alt="Clear" text="Delete" onclick="OnClear()"/>
											</td>
											<td style="width: 1%">
												<gw:button id="btnDelete" img="delete" styles='width:100%;display:none'  alt="Delete" text="Delete" onclick="OnDelete()"/>
											</td>
											<td style="width: 1%">
												<gw:button id="btnUnDelete" img="udelete" styles='width:100%;display:none'  alt="UnDelete" text="UnDelete" onclick="OnUnDelete()"/>
											</td>
											<td style="width: 1%">
												<gw:button id="btnPrint" img="excel" alt="Print" text="Print"
													onclick="onPrint(1)" />
											</td>
											<td style="width: 1%;display:none">
												<gw:button id="btnPrint1" img="excel" alt="Print" text="Print"
													onclick="onPrint(2)" />
											</td>
											<td style="width: 1%;display:none">
												<gw:button id="btnPrint2" img="excel" alt="Total Summary" text="Print"
													onclick="onPrint(3)" />
											</td>
										</tr>
									</table>
								</td>
							</tr>                               
							<tr>
								<!--td  align="right">
								<a href="#"  title="Click here to show Work Division"  onClick="OnPopUp('Work_Breakdown')" style="text-decoration:none">W. Div</a></td>
								<td >
									<table cellpadding="0" cellspacing="0" width="100%">
										<tr>
											<td style="display:none">
												<gw:textbox id="txtWork_Breakdown" styles="width:100%" onchange="OnSearch()" />
											</td>
											<td width="40%">
												<gw:textbox id="txtWork_Breakdown_Cd" readonly="true" styles='width:100%' />
											</td>
											<td width="60%">
												<gw:textbox id="txtWork_Breakdown_Nm" readonly="true" styles='width:100%' />
											</td>											   
											<td>
												<gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtWork_Breakdown_Cd.text='';txtWork_Breakdown_Nm.text='';txtWork_Breakdown.text=''" />
											</td>
										</tr>										
									</table>
								</td-->
							</tr>
							 <tr>                                			
								<!--td align="right" width="10%">
									<a title="Click here to show Order Work Division" href="#" style="text-decoration: none"  onClick="OnPopUp('OutsideOrderWork')"">
										Order W. Div&nbsp;</a>
								</td>
								<td width="50%">
									<table cellpadding="0" cellspacing="0" width="100%">
										<tr>
											<td width="40%">
												<gw:textbox id="txtOrderWork_Cd" readonly="true" styles='width:100%' />
											</td>
											<td width="60%">
												<gw:textbox id="txtOrderWork_Nm" readonly="true" styles='width:100%' />
											</td>											   
											<td>
												<gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtOrderWork_Cd.text='';txtOrderWork_Nm.text='';txtOrderWork_Pk.text=''" />
											</td>
										</tr>
										
									</table>
								 </td-->
								 <td align="right">
										<gw:checkbox id="chkQty" value="Y" defaultvalue="Y|N" onchange="OnSearch()" />
								 </td>
								 <td colspan="2">Excluding detail of which quantity is "0"</td>
							</tr>
						</table>
						</fieldset>
					</td>
				</tr>

				<tr style="height: 98%">
					<td colspan="7">
						<gw:tab id="idTab" onpageactivate="OnSearch()">
							<table cellpadding="1" cellspacing="1" style="width: 100%; height: 100%;"
								name="Equipment" id="Tab1" border="0">
								<tr style="height: 1%">
									<td style="width: 100%;">
										<table style="width: 100%; height: 100%;" border="0">
											<tr style="width: 100%; height: 100%;">
												<td  align="center" style="display:none">
													<gw:checkbox id="chk1" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(1)" />Level Code
												</td>												
												<td align="center"  style="display:none">
													<gw:checkbox id="chk2" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(2)" />Standard
												</td>													
												<td align="center"  style="width:10%">
													<gw:checkbox id="chk3" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(3)" />Weight
												</td>												
												<td align="center"  style="width:10%">
													<gw:checkbox id="chk6" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(6)" />Order W. Div
												</td>
												<td align="center"  style="width:10%">
													<gw:checkbox id="chk7" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(7)" />Exec Y/N
												</td>												
												<td align="center"  style="width:10%"><gw:checkbox id="chk8" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(8)" />Budget Code</td>
												
												<td align="center"  style="width:10%" nowrap><gw:checkbox id="chk9" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(9)"/>Standard PBS</td>
												
												<td align="center"  style="width:10%"><gw:checkbox id="chk10" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(10)" />Dlvr. Terms</td>
												
												<td align="center"  style="width:10%"><gw:checkbox id="chk11" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(11)" />Dlvr.(Y/N)</td>
												
												<td align="center"  style="width:10%"><gw:checkbox id="chk12" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(12)" />Cont. Dtals</td>
											</tr>								
											<tr style="width: 100%; height: 100%;">
												<td colspan="2"  align="right" style="width:20%">
													<gw:list id="lstFilter1" styles="width: 60%" onchange="OnChangeFilter()" />
												</td>												
												<td colspan="2" align="center" style="width:20%">
													<gw:textbox id="txtFilter1" styles="width: 100%" />
												</td>
												<td id="idCode1" style="width: 10%" align="left">
													<gw:icon id="btnLevelCode1" img="in" text="Popup" onClick="OnPopUp('Work_Breakdown')"   />
												</td>		
												<td colspan="2" align="right" style="width:20%">
													Total
												</td>
												
												<td colspan="2" align="center" style="width:20%">
													<gw:list id="lstTotal1" styles="width: 100%" />
												</td>

												<td align="right" style="width:20%">
													<gw:imgbtn id="btnSearchs" img="search" alt="Search" onclick="OnSearch()" />
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr style="height: 98%">
									<td style="width: 100%">
										<gw:grid id="grdEQ" header="0|1|2|3|4|5|6|7|8|9|_10|11|12|13|_14|15|16|17|18|19|_20|_21|_22|_23|_24|_25|_26|_27|_28|_29|_30|_31|_32" 
										format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
										aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
										defaults="||||||||||||||||||||||||||||||||" editcol="0|0|0|1|1|1|1|1|1|0|1|0|0|1|0|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0" 				widths="1000|2000|4000|1200|2000|1000|1000|2000|2000|1000|1000|1200|1000|1000|1000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|0|0|0|0|0|0|0|0" 
										styles="width:100%; height:100%" 
										sorting="T" debug="false"
										oncellclick="OnClick(this)"
										oncelldblclick="OnDBClick(this)"										
										editcolcolor="true"
										onafteredit="CheckData(this)"/>
									</td>
								</tr>
							</table>
						   
							<table cellpadding="1" cellspacing="1" style="width: 100%; height: 100%;"
								name="Construction" id="Tab2" border="0">
								<tr style="height: 1%">
									<td style="width: 100%;">
										<table style="width: 100%; height: 100%;" border="0">
											<tr style="width: 100%; height: 100%;">
												<td  align="center" style="width:10%" nowrap=" align="center" ><gw:checkbox id="chk21" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(1)" />Level Code</td>
												<td  align="center" style="width:10%"><gw:checkbox id="chk22" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(2)" />Std</td>
												<td  align="center" style="width:10%" nowrap ><gw:checkbox id="chk23" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(3)" />Raw Mtrl/Labor/Exp</td>
												<td  align="center" style="width:10%"><gw:checkbox id="chk24" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(4)" />Order W.</td>
												<td  align="center" style="width:10%"><gw:checkbox id="chk25" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(5)" />Exec Y/N</td>
												<td  align="center" style="width:10%" nowrap><gw:checkbox id="chk26" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(6)" />Dir. Mgt Outsrc.</td>
												<td  align="center" style="width:10%"><gw:checkbox id="chk27" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(7)" />Bdgt Code</td>
												<td  align="center" style="width:10%"><gw:checkbox id="chk28" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(8)" />Std Code</td>
												<td colspan=2 align="right" style="width:10%">
													<gw:imgbtn id="btnSearchs1"styles="width: 100%" img="search" onclick="OnSearch()" />
												</td>
											</tr>
											<tr style="width: 100%; height: 100%;">
												<td style="width: 10%" align="right">
													<gw:list id="lstFilter2" styles="width: 100%" onchange="OnChangeFilter()" />
												</td>
												<td width="10%">
													<gw:textbox id="txtFilter2" styles="width: 100%" onenterkey="OnSearch()" />
												</td>
												<td style="width: 10%" align="left" nowrap>
													<gw:icon id="btnLevelCode2" img="in" text="Popup" onClick="OnPopUp('Work_Breakdown')"   />													
													<gw:icon id="btnLevelCode3" img="in" text="Popup" onClick="OnPopUp('OutsideOrderWork')"   />
												</td>
												<td style="width: 10%" align="left">
												</td>
												<td style="width: 10%" align="right"></td>
												<td style="width: 10%" >
													
												</td>
												<td align="right" style="width: 10%"></td>
												<td align="right" style="width:10%">
												</td>
												<td align="right" style="width:10%"></td>
												<td align="right" style="width:10%">
												</td>
											</tr>
										</table>
									</td>
								</tr>
								<tr style="height: 98%">
									<td style="width: 100%">
										<gw:grid id="grdCONS" 
										header="0|1|2|3|4|5|6|7|8|9|10|11|_12|13|14|15|16|_17|18|19|20|21|22|_23|_24|_25|_26|_27|_28|_29|_30|_31|_32|_33|_34|_35" 
										format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
										aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
										defaults="|||||||||||||||||||||||||||||||" 
										editcol="0|0|0|1|1|1|1|1|1|1|1|0|0|0|0|1|1|1|0|1|1|1|1|1|1|0|0|0|0|0|0|0"
										widths="1000|2000|4000|1000|1000|1000|2000|2000|2000|2000|2000|3000|2000|1500|3000|2500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1200|0"
										styles="width:100%; height:100%" sorting="T" debug="false"
										oncellclick="OnClick(this)"
										oncelldblclick="OnDBClick(this)"										
										editcolcolor="true"
										onafteredit="CheckData(this)"/>
									</td>
								</tr>
							</table>
							<table style="width: 100%; height: 100%" name="Construction Management, Supervision" style="overflow: scroll">
								<tr style="height: 1%">
									<td style="width: 15%" align="right"></td>
									<td style="width: 35%" align="left">
									</td>
									<td style="width: 50%" align="right">
									</td>
									<td style="width: 1%">
										<gw:imgbtn id="btnSearchs2" img="search" alt="Search" onclick="OnSearch()" />
									</td>
								</tr>
								<tr style="height: 99%">
									<td colspan="4" style="width: 100%">
										<gw:grid id="grdCM" header="_0|1|2|_3|4|5|6|7|8|9|10|11|12|13|14|15|16|_17|18|19|20|21|_22|_23|_24|_25|_26|_27|_28|_29|_30|_31"
										format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
										aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
										defaults="||||||||||||||||||||||||||||||"
										editcol="0|0|1|0|0|0|0|0|1|1|1|0|1|1|1|0|0|1|0|0|1|1|1|1|0|0|0|0|0|0|0"
										widths="1000|1100|2000|1000|2000|4000|1000|2000|1000|1500|2000|1500|1000|1500|2000|1500|2000|1000|1000|2000|1000|1000|1000|1000|0|0|0|0|0|0|0"
										styles="width:100%; height:100%" sorting="T" 
										debug="false"
										oncellclick="OnClick(this)"
										oncelldblclick="OnDBClick(this)" 
										editcolcolor="true"
										onafteredit="CheckData(this)"/>
									</td>
								</tr>
							</table>
							<table style="width: 100%; height: 100%" name="Other Service" id="Table3"
								align="top" style="overflow: scroll">
								<tr style="height: 1%">
									<td>
										<table>
											<tr>												
												<td  align="center" nowrap=" align="center" nowrap" style="width:1%"><gw:checkbox id="chk41" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(1)" />Level Code</td>
												
												<td  align="center" nowrap=" align="center" nowrap" style="width:1%"><gw:checkbox id="chk42" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(2)" />Std</td>

												<td  align="center" nowrap=" align="center" nowrap" style="width:1%"><gw:checkbox id="chk43" value="Y" defaultvalue="Y|N" onchange="OnCheckCol(3)" />Order W. Div</td>
												
												<td style="width: 20%" ></td>
												<td style="width: 15%" align="left">
													<gw:list id="lstFilter4" styles="width: 100%"  onchange="OnChangeFilter()" />
												</td>
												<td colspan="3" width="18%"><gw:textbox id="txtFilter4" styles="width: 100%" /></td>
												<td  style="width: 5%" align="right">Total</td>
												<td colspan="3" style="width: 25%" ><gw:list id="lstTotal4" styles="width: 100%" /></td>
												<td style="width: 1%">				
													<gw:imgbtn id="btnSearchs3" img="search" alt="Search" onclick="OnSearch()" />
												</td>
											</tr>	
										</table>
									</td>
								</tr>
								<tr style="height: 99%">
									<td colspan="4" style="width: 100%">
										<gw:grid id="grdOther" header="_0|_1|2|3|4|5|6|7|8|9|10|11|_12|13|14|15|16|_17|_18|_19|_20|_21|_22|_23|_24|_25|_26"  
										format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
										aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
										defaults="||||||||||||||||||||||||||" 
									    editcol="1|1|1||0|1|1|1|1|1|1|1|0|0|0|0|1|1|1|1|0|0|0|0|0|0|0|0"
										widths="1000|1000|1000|3000|4000|2000|1500|1000|1000|2000|2000|2500|1000|1000|1000|1000|1000|0|0|0|0|0|0|0|0|0|0"
										styles="width:100%; height:100%" 
										sorting="T" 
										debug="true"
										oncellclick="OnClick(this)" 
										oncelldblclick="OnDBClick(this)" 
										editcolcolor="true"
										onafteredit="CheckData(this)" />
									</td>
								</tr>
							</table>
						</gw:tab>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr >
		<td style="width: 100%; height:98%; background:white">
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
	<tr style="display:none" >
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
</table>
    <!----------------------------------------------------------------------------------------->
    <gw:textbox id="txtPartnerPk" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="txtParentPk" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="txtBillToPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="txtDeliToPK" maxlen="100" styles='width:100%;display:none' />
    <gw:textbox id="imagePK" maxlen="100" styles='width:100%;display:none' csstype="" />
    <gw:textbox id="txtPartID" styles='display:none' />
    <gw:textbox id="txtPartNm" styles='display:none' />
    <gw:textbox id="txtTable" text="tco_buspartner" styles='display:none' />
	<gw:textbox id="txtContract_Pk" styles='display:none' />
	<gw:textbox id="txtContract_Seq" styles='display:none' />
	<gw:textbox id="txtOrderWork_Pk" styles='display:none' />
	<gw:textbox id="txtLevelPK" styles='width:100%;display:none' />
	<gw:textbox id="txtBudgetNo" styles='width:100%;display:none' />
    <gw:textarea id="txtMemo" rows="10" styles="width:100%;display:none" />
	<gw:list id="lstCOMPANY" styles='width:100%;display:none' />
	<gw:textbox id="txtBK_RATE"  styles='width:100%;display:none' />
	<gw:textbox id="txtTR_RATE" styles="width:100%;display:none" />
	<gw:textbox id="txtReturnValue" styles="width:100%;display:none" />
	<gw:textbox id="txtStatus" styles="width:100%;display:none" />
    <!----------------------------------------------------------------------------------------->
</body>
</html>