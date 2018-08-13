<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Manpower Plan</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>

<script>
var COL_JAN			 = false,
    COL_FEB          = false,
    COL_MAR          = false,
    COL_APR          = false,
    COL_MAY          = false,
    COL_JUN          = false,
    COL_JUL          = false,
    COL_AUG          = false,
    COL_SEP          = false,
    COL_OCT          = false,
    COL_NOV          = false,
    COL_DEC          = false,
    COL_JAN2         = false,
    COL_FEB2         = false,
    COL_MAR2         = false,
    COL_APR2         = false,
    COL_MAY2         = false,
    COL_JUN2         = false,
    COL_JUL2         = false,
    COL_AUG2         = false,
    COL_SEP2         = false,
    COL_OCT2         = false,
    COL_NOV2         = false,
    COL_DEC2         = false;

var INF_PALM_MM		= 0,
	INF_PLAN_AMT	= 1,
	INF_INPUT_MM	= 2,
	INF_INPUT_AMT	= 3;

var PLAN_PK			= 0,
	G2_SITE_EXE_YN  = 1,
    G2_JOB          = 2,
    G2_POSITION     = 3,
    G2_UNIT_PRICE   = 4,
    G2_MM_SUM       = 5,

    JAN				= 6,
	JAN_MM			= 7,
	PK_JAN			= 8,

    FEB             = 9,
	FEB_MM			= 10,
	PK_FEB          = 11,

    MAR             = 12,
	MAR_MM			= 13,
    PK_MAR          = 14,

    APR             = 15,
	APR_MM			= 16,
    PK_APR          = 17,

    MAY             = 18,
	MAY_MM			= 19,
    PK_MAY          = 20,

    JUN             = 21,
	JUN_MM			= 22,
    PK_JUN          = 23,

    JUL             = 24,
	JUL_MM			= 25,
    PK_JUL          = 26,

    AUG             = 27,
	AUG_MM			= 28,
    PK_AUG          = 29,

    SEP             = 30,
	SEP_MM			= 31,
    PK_SEP          = 32,

    OCT             = 33,
	OCT_MM			= 34,
    PK_OCT          = 35,

    NOV             = 36,
	NOV_MM			= 37,
    PK_NOV          = 38,

    DEC             = 39,
	DEC_MM			= 40,
    PK_DEC          = 41,

    JAN2            = 42,
	JAN2_MM			= 43,
    PK_JAN2         = 44,

    FEB2            = 45,
	FEB2_MM			= 46,
    PK_FEB2         = 47,

    MAR2            = 48,
	MAR2_MM			= 49,
    PK_MAR2         = 50,

    APR2            = 51,
	APR2_MM			= 52,
    PK_APR2         = 53,

    MAY2            = 54,
	MAY2_MM			= 55,
    PK_MAY2         = 56,

    JUN2            = 57,
	JUN2_MM			= 58,
    PK_JUN2         = 59,

    JUL2            = 60,
	JUL2_MM			= 61,
    PK_JUL2         = 62,

    AUG2            = 63,
	AUG2_MM			= 64,
	PK_AUG2         = 65,

    SEP2            = 66,
	SEP2_MM			= 67,
    PK_SEP2         = 68,

    OCT2            = 69,
	OCT2_MM			= 70,
    PK_OCT2         = 71,

    NOV2            = 72,
	NOV2_MM			= 73,
    PK_NOV2         = 74,

    DEC2            = 75,
	DEC2_MM			= 76,
    PK_DEC2         = 77,

	LEVEL_PK		= 78,
	PRJ_PK			= 79,
	FROM_MM			= 80,
	TO_MM			= 81,
	SEQ				= 82,
	SEQ_NO			= 83;

var LABOR_POS				= 0,
	LABOR_SUB_MM			= 1,
	LABOR_SUB_AMT			= 2,
	LABOR_YEAR_MM			= 3,
	LABOR_YEAR_UNIT_PRICE	= 4,
	LABOR_YEAR_AMT			= 5,
	LABOR_YEAR2_MM			= 6,
	LABOR_YEAR2_UNIT_PRICE	= 7,
	LABOR_YEAR2_AMT			= 8;

function BodyInit()
{
	System.Translate(document);
	BindingDataList();
	MergeHeader(); 
	MergeHeader_Planned();  
	MergeHeader_LaborCost(); 	  
	Debug(false);

	var time = new Date();
	var year = time.getYear();
	dtWorking_Period_Fr.value = year + '01';
	dtWorking_Period_To.value = year + '12'
}

function Debug(obj)
{	
	if (obj)
	{
		grdPlan.GetGridControl().ColHidden(PLAN_PK)    = false ;

		grdPlan.GetGridControl().ColHidden(JAN_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(FEB_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(MAR_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(APR_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(MAY_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(JUN_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(JUL_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(AUG_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(SEP_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(OCT_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(NOV_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(DEC_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(JAN2_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(FEB2_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(MAR2_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(APR2_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(MAY2_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(JUN2_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(JUL2_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(AUG2_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(SEP2_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(OCT2_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(NOV2_MM)     = false ;
		grdPlan.GetGridControl().ColHidden(DEC2_MM)     = false ;

		grdPlan.GetGridControl().ColHidden(PK_JAN)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_FEB)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_MAR)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_APR)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_MAY)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_JUN)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_JUL)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_AUG)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_SEP)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_OCT)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_NOV)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_DEC)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_JAN2)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_FEB2)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_MAR2)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_APR2)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_MAY2)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_JUN2)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_JUL2)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_AUG2)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_SEP2)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_OCT2)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_NOV2)     = false ;
		grdPlan.GetGridControl().ColHidden(PK_DEC2)     = false ;
	}
	else
	{
		grdPlan.GetGridControl().ColHidden(PLAN_PK)    = true ;

		grdPlan.GetGridControl().ColHidden(JAN_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(FEB_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(MAR_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(APR_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(MAY_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(JUN_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(JUL_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(AUG_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(SEP_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(OCT_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(NOV_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(DEC_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(JAN2_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(FEB2_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(MAR2_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(APR2_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(MAY2_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(JUN2_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(JUL2_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(AUG2_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(SEP2_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(OCT2_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(NOV2_MM)     = true ;
		grdPlan.GetGridControl().ColHidden(DEC2_MM)     = true ;

		grdPlan.GetGridControl().ColHidden(PK_JAN)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_FEB)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_MAR)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_APR)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_MAY)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_JUN)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_JUL)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_AUG)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_SEP)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_OCT)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_NOV)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_DEC)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_JAN2)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_FEB2)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_MAR2)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_APR2)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_MAY2)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_JUN2)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_JUL2)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_AUG2)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_SEP2)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_OCT2)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_NOV2)     = true ;
		grdPlan.GetGridControl().ColHidden(PK_DEC2)     = true ;
	}
}

//==========================================================================
function BindingDataList()
{
	<%=ESysLib.SetGridColumnComboFormat("grdPlan", 1,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'TPS0036' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>;
	<%=ESysLib.SetGridColumnComboFormat("grdPlan", 2,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'TPS0035' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>;
	
	<%=ESysLib.SetGridColumnComboFormat("grdPlan", 3, "SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'TPS0034' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>;
	
	<%=ESysLib.SetGridColumnComboFormat("grdLaborCost", 0,"SELECT CODE, B.CODE_NM FROM TAC_COMMCODE_MASTER A, TAC_COMMCODE_DETAIL B WHERE A.PK = B.TAC_COMMCODE_MASTER_PK AND A.ID = 'TPS0034' AND A.DEL_IF = 0 AND B.DEL_IF = 0 AND B.USE_YN ='Y' ORDER BY CODE, B.CODE_NM")%>;
	/**/
}

function MergeHeader()
{
	var fg = grdInfo.GetGridControl(); 	
	if(fg.Rows < 2)
	{
	   grdInfo.AddRow();     
	}    
	fg.FixedRows = 2
	fg.MergeCells =5	

	fg.MergeRow(0) = true
	fg.Cell(0, 0, INF_PALM_MM, 0, INF_PLAN_AMT)  = "Plan MM"   //fg.Cell(0,row, from_col, row, to_col)	
	fg.Cell(0, 1, INF_PALM_MM, 1, INF_PALM_MM) = "MM"
	fg.Cell(0, 1, INF_PLAN_AMT, 1, INF_PLAN_AMT) = "Amount" 
	
	fg.Cell(0, 0, INF_INPUT_MM, 0, INF_INPUT_AMT)  = "Input M/M Sum"   //fg.Cell(0,row, from_col, row, to_col)	
	fg.Cell(0, 1, INF_INPUT_MM, 1, INF_INPUT_MM) = "MM"
	fg.Cell(0, 1, INF_INPUT_AMT, 1, INF_INPUT_AMT) = "Amount" 
	
	var ctrl = grdInfo.GetGridControl();
	ctrl.ColAlignment(INF_PALM_MM)	= 7;
	ctrl.ColAlignment(INF_PLAN_AMT)	= 7;
	ctrl.ColAlignment(INF_INPUT_MM)	= 7;
	ctrl.ColAlignment(INF_INPUT_AMT)= 7;

	ctrl.ColFormat(INF_PALM_MM)		= "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(INF_PLAN_AMT)	= "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(INF_INPUT_MM)	= "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(INF_INPUT_AMT)	= "#,###,###,###,###,###,###,###,###.##R";
}
//===========================================================
function ResetGrid()
{
    grdPlan.GetGridControl().ColHidden(JAN)     = false ;
    grdPlan.GetGridControl().ColHidden(FEB)     = false ;
    grdPlan.GetGridControl().ColHidden(MAR)     = false ;
    grdPlan.GetGridControl().ColHidden(APR)     = false ;
    grdPlan.GetGridControl().ColHidden(MAY)     = false ;
    grdPlan.GetGridControl().ColHidden(JUN)     = false ;
    grdPlan.GetGridControl().ColHidden(JUL)     = false ;
    grdPlan.GetGridControl().ColHidden(AUG)     = false ;
    grdPlan.GetGridControl().ColHidden(SEP)     = false ;
    grdPlan.GetGridControl().ColHidden(OCT)     = false ;
    grdPlan.GetGridControl().ColHidden(NOV)     = false ;
    grdPlan.GetGridControl().ColHidden(DEC)     = false ;
    grdPlan.GetGridControl().ColHidden(JAN2)     = false ;
    grdPlan.GetGridControl().ColHidden(FEB2)     = false ;
    grdPlan.GetGridControl().ColHidden(MAR2)     = false ;
    grdPlan.GetGridControl().ColHidden(APR2)     = false ;
    grdPlan.GetGridControl().ColHidden(MAY2)     = false ;
    grdPlan.GetGridControl().ColHidden(JUN2)     = false ;
    grdPlan.GetGridControl().ColHidden(JUL2)     = false ;
    grdPlan.GetGridControl().ColHidden(AUG2)     = false ;
    grdPlan.GetGridControl().ColHidden(SEP2)     = false ;
    grdPlan.GetGridControl().ColHidden(OCT2)     = false ;
    grdPlan.GetGridControl().ColHidden(NOV2)     = false ;
    grdPlan.GetGridControl().ColHidden(DEC2)     = false ;

	COL_JAN			 = false,
    COL_FEB          = false,
    COL_MAR          = false,
    COL_APR          = false,
    COL_MAY          = false,
    COL_JUN          = false,
    COL_JUL          = false,
    COL_AUG          = false,
    COL_SEP          = false,
    COL_OCT          = false,
    COL_NOV          = false,
    COL_DEC          = false,
    COL_JAN2         = false,
    COL_FEB2         = false,
    COL_MAR2         = false,
    COL_APR2         = false,
    COL_MAY2         = false,
    COL_JUN2         = false,
    COL_JUL2         = false,
    COL_AUG2         = false,
    COL_SEP2         = false,
    COL_OCT2         = false,
    COL_NOV2         = false,
    COL_DEC2         = false;
}
//==========================================================================
function MergeHeader_Planned()
{
	var fg = grdPlan.GetGridControl(); 	
	if(fg.Rows < 2)
	{
	   grdPlan.AddRow();     
	}    
	fg.FixedRows = 2
	fg.MergeCells =5	

	fg.MergeCol(PLAN_PK) = true
	fg.Cell(0, 0, PLAN_PK, 1, PLAN_PK) = "PK"	

	fg.MergeCol(G2_SITE_EXE_YN) = true
	fg.Cell(0, 0, G2_SITE_EXE_YN, 1, G2_SITE_EXE_YN) = "Location"	

	fg.MergeCol(G2_JOB) = true
	fg.Cell(0, 0, G2_JOB, 1, G2_JOB) = "Work Description"	

	fg.MergeCol(G2_POSITION) = true
	fg.Cell(0, 0, G2_POSITION, 1, G2_POSITION) = "Position"	

	fg.MergeCol(G2_UNIT_PRICE) = true
	fg.Cell(0, 0, G2_UNIT_PRICE, 1, G2_UNIT_PRICE) = "Unit Price"	

	fg.MergeCol(G2_MM_SUM) = true
	fg.Cell(0, 0, G2_MM_SUM, 1, G2_MM_SUM) = "MM Sum"
	
	var date1=dtWorking_Period_Fr.value;
	var date2=dtWorking_Period_To.value;

	var year1=date1.substring(0,4);
	var year2=date2.substring(0,4);
	
	var month1=Number(date1.substring(4,6));
	var month2=Number(date2.substring(4,6));
	
	fg.MergeRow(0) = true
	fg.Cell(0, 0, JAN, 0, PK_DEC)  = year1 + ' Year'  //fg.Cell(0,row, from_col, row, to_col)	
	fg.Cell(0, 1, JAN, 1, JAN) = "Jan"
	fg.Cell(0, 1, FEB, 1, FEB) = "Feb" 
	fg.Cell(0, 1, MAR, 1, MAR) = "Mar" 
	fg.Cell(0, 1, APR, 1, APR) = "Apr"  
	fg.Cell(0, 1, MAY, 1, MAY) = "May"
	fg.Cell(0, 1, JUN, 1, JUN) = "Jun"
	fg.Cell(0, 1, JUL, 1, JUL) = "Jul"
	fg.Cell(0, 1, AUG, 1, AUG) = "Aug"
	fg.Cell(0, 1, SEP, 1, SEP) = "Sep"
	fg.Cell(0, 1, OCT, 1, OCT) = "Oct"
	fg.Cell(0, 1, NOV, 1, NOV) = "Nov"
	fg.Cell(0, 1, DEC, 1, DEC) = "Dec"

	fg.Cell(0, 1, JAN_MM, 1, JAN_MM) = "Jan_MM"
	fg.Cell(0, 1, FEB_MM, 1, FEB_MM) = "Feb_MM" 
	fg.Cell(0, 1, MAR_MM, 1, MAR_MM) = "Mar_MM" 
	fg.Cell(0, 1, APR_MM, 1, APR_MM) = "Apr_MM"  
	fg.Cell(0, 1, MAY_MM, 1, MAY_MM) = "May_MM"
	fg.Cell(0, 1, JUN_MM, 1, JUN_MM) = "Jun_MM"
	fg.Cell(0, 1, JUL_MM, 1, JUL_MM) = "Jul_MM"
	fg.Cell(0, 1, AUG_MM, 1, AUG_MM) = "Aug_MM"
	fg.Cell(0, 1, SEP_MM, 1, SEP_MM) = "Sep_MM"
	fg.Cell(0, 1, OCT_MM, 1, OCT_MM) = "Oct_MM"
	fg.Cell(0, 1, NOV_MM, 1, NOV_MM) = "Nov_MM"
	fg.Cell(0, 1, DEC_MM, 1, DEC_MM) = "Dec_MM"

	fg.Cell(0, 1, PK_JAN, 1, PK_JAN) = "Jan_PK"
	fg.Cell(0, 1, PK_FEB, 1, PK_FEB) = "Feb_PK" 
	fg.Cell(0, 1, PK_MAR, 1, PK_MAR) = "Mar_PK" 
	fg.Cell(0, 1, PK_APR, 1, PK_APR) = "Apr_PK"  
	fg.Cell(0, 1, PK_MAY, 1, PK_MAY) = "May_PK"
	fg.Cell(0, 1, PK_JUN, 1, PK_JUN) = "Jun_PK"
	fg.Cell(0, 1, PK_JUL, 1, PK_JUL) = "Jul_PK"
	fg.Cell(0, 1, PK_AUG, 1, PK_AUG) = "Aug_PK"
	fg.Cell(0, 1, PK_SEP, 1, PK_SEP) = "Sep_PK"
	fg.Cell(0, 1, PK_OCT, 1, PK_OCT) = "Oct_PK"
	fg.Cell(0, 1, PK_NOV, 1, PK_NOV) = "Nov_PK"
	fg.Cell(0, 1, PK_DEC, 1, PK_DEC) = "Dec_PK"
	
	fg.Cell(0, 0, JAN2, 0, PK_DEC2)  = year2 + ' Year'
	fg.Cell(0, 1, JAN2, 1, JAN2) = "Jan" 
	fg.Cell(0, 1, FEB2, 1, FEB2) = "Feb" 
	fg.Cell(0, 1, MAR2, 1, MAR2) = "Mar" 
	fg.Cell(0, 1, APR2, 1, APR2) = "Apr"  
	fg.Cell(0, 1, MAY2, 1, MAY2) = "May"
	fg.Cell(0, 1, JUN2, 1, JUN2) = "Jun"
	fg.Cell(0, 1, JUL2, 1, JUL2) = "Jul"
	fg.Cell(0, 1, AUG2, 1, AUG2) = "Aug"
	fg.Cell(0, 1, SEP2, 1, SEP2) = "Sep"
	fg.Cell(0, 1, OCT2, 1, OCT2) = "Oct"
	fg.Cell(0, 1, NOV2, 1, NOV2) = "Nov"
	fg.Cell(0, 1, DEC2, 1, DEC2) = "Dec"

	fg.Cell(0, 1, JAN2_MM, 1, JAN2_MM) = "Jan_MM" 
	fg.Cell(0, 1, FEB2_MM, 1, FEB2_MM) = "Feb_MM" 
	fg.Cell(0, 1, MAR2_MM, 1, MAR2_MM) = "Mar_MM" 
	fg.Cell(0, 1, APR2_MM, 1, APR2_MM) = "Apr_MM"  
	fg.Cell(0, 1, MAY2_MM, 1, MAY2_MM) = "May_MM"
	fg.Cell(0, 1, JUN2_MM, 1, JUN2_MM) = "Jun_MM"
	fg.Cell(0, 1, JUL2_MM, 1, JUL2_MM) = "Jul_MM"
	fg.Cell(0, 1, AUG2_MM, 1, AUG2_MM) = "Aug_MM"
	fg.Cell(0, 1, SEP2_MM, 1, SEP2_MM) = "Sep_MM"
	fg.Cell(0, 1, OCT2_MM, 1, OCT2_MM) = "Oct_MM"
	fg.Cell(0, 1, NOV2_MM, 1, NOV2_MM) = "Nov_MM"
	fg.Cell(0, 1, DEC2_MM, 1, DEC2_MM) = "Dec_MM"

	fg.Cell(0, 1, PK_JAN2, 1, PK_JAN2) = "Jan_PK" 
	fg.Cell(0, 1, PK_FEB2, 1, PK_FEB2) = "Feb_PK" 
	fg.Cell(0, 1, PK_MAR2, 1, PK_MAR2) = "Mar_PK" 
	fg.Cell(0, 1, PK_APR2, 1, PK_APR2) = "Apr_PK"  
	fg.Cell(0, 1, PK_MAY2, 1, PK_MAY2) = "May_PK"
	fg.Cell(0, 1, PK_JUN2, 1, PK_JUN2) = "Jun_PK"
	fg.Cell(0, 1, PK_JUL2, 1, PK_JUL2) = "Jul_PK"
	fg.Cell(0, 1, PK_AUG2, 1, PK_AUG2) = "Aug_PK"
	fg.Cell(0, 1, PK_SEP2, 1, PK_SEP2) = "Sep_PK"
	fg.Cell(0, 1, PK_OCT2, 1, PK_OCT2) = "Oct_PK"
	fg.Cell(0, 1, PK_NOV2, 1, PK_NOV2) = "Nov_PK"
	fg.Cell(0, 1, PK_DEC2, 1, PK_DEC2) = "Dec_PK"      
		
	var ctrl = grdPlan.GetGridControl();
	ctrl.ColAlignment(G2_UNIT_PRICE)	= 7;
	ctrl.ColAlignment(G2_MM_SUM)		= 7;

	ctrl.ColFormat(G2_UNIT_PRICE)	= "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(G2_MM_SUM)		= "#,###,###,###,###,###,###,###,###.##R";

	for (col = JAN; col <= PK_DEC2 ; col+=3)
	{
		ctrl.ColAlignment(col)	= 7;
		ctrl.ColFormat(col)		= "#,###,###,###,###,###,###,###,###.##R";	
	}

	ResetGrid();

	if(year2<=year1)
	{
		//ResetGrid();
		grdPlan.GetGridControl().ColHidden(JAN2)     = true ;
		grdPlan.GetGridControl().ColHidden(FEB2)     = true ;
		grdPlan.GetGridControl().ColHidden(MAR2)     = true ;
		grdPlan.GetGridControl().ColHidden(APR2)     = true ;
		grdPlan.GetGridControl().ColHidden(MAY2)     = true ;
		grdPlan.GetGridControl().ColHidden(JUN2)     = true ;
		grdPlan.GetGridControl().ColHidden(JUL2)     = true ;
		grdPlan.GetGridControl().ColHidden(AUG2)     = true ;
		grdPlan.GetGridControl().ColHidden(SEP2)     = true ;
		grdPlan.GetGridControl().ColHidden(OCT2)     = true ;
		grdPlan.GetGridControl().ColHidden(NOV2)     = true ;
		grdPlan.GetGridControl().ColHidden(DEC2)     = true ;

		COL_JAN2         = true,
		COL_FEB2         = true,
		COL_MAR2         = true,
		COL_APR2         = true,
		COL_MAY2         = true,
		COL_JUN2         = true,
		COL_JUL2         = true,
		COL_AUG2         = true,
		COL_SEP2         = true,
		COL_OCT2         = true,
		COL_NOV2         = true,
		COL_DEC2         = true;
			
		if(month2==11)		
		{
			grdPlan.GetGridControl().ColHidden(DEC)     = true ;
			COL_DEC = true;
		}
		if(month2==10)
		{
			grdPlan.GetGridControl().ColHidden(NOV)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC)     = true ;
			COL_NOV = true;
			COL_DEC = true;
		}
		if(month2==9)
		{
			grdPlan.GetGridControl().ColHidden(OCT)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC)     = true ;

			COL_OCT         = true,
			COL_NOV         = true,
			COL_DEC         = true;
		}
		if(month2==8)
		{
			grdPlan.GetGridControl().ColHidden(SEP)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC)     = true ;

			COL_SEP         = true,
			COL_OCT         = true,
			COL_NOV         = true,
			COL_DEC         = true;
		}
		if(month2==7)
		{
			grdPlan.GetGridControl().ColHidden(AUG)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC)     = true ;

			COL_AUG         = true,
			COL_SEP         = true,
			COL_OCT         = true,
			COL_NOV         = true,
			COL_DEC         = true;
		}
		if(month2==6)
		{
			grdPlan.GetGridControl().ColHidden(JUL)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC)     = true ;

			COL_JUL			= true,
			COL_AUG         = true,
			COL_SEP         = true,
			COL_OCT         = true,
			COL_NOV         = true,
			COL_DEC         = true;
		}
		if(month2==5)
		{
			grdPlan.GetGridControl().ColHidden(JUN)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC)     = true ;

			COL_JUN			= true,
			COL_JUL			= true,
			COL_AUG         = true,
			COL_SEP         = true,
			COL_OCT         = true,
			COL_NOV         = true,
			COL_DEC         = true;
		}
		if(month2==4)
		{
			grdPlan.GetGridControl().ColHidden(MAY)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC)     = true ;

			COL_MAY			= true,
			COL_JUN			= true,
			COL_JUL			= true,
			COL_AUG         = true,
			COL_SEP         = true,
			COL_OCT         = true,
			COL_NOV         = true,
			COL_DEC         = true;
		}
		if(month2==3)
		{
			grdPlan.GetGridControl().ColHidden(APR)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC)     = true ;

			COL_APR			= true,
			COL_MAY			= true,
			COL_JUN			= true,
			COL_JUL			= true,
			COL_AUG         = true,
			COL_SEP         = true,
			COL_OCT         = true,
			COL_NOV         = true,
			COL_DEC         = true;
		}
		if(month2==2)
		{
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			grdPlan.GetGridControl().ColHidden(APR)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC)     = true ;

			COL_MAR			= true,
			COL_APR			= true,
			COL_MAY			= true,
			COL_JUN			= true,
			COL_JUL			= true,
			COL_AUG         = true,
			COL_SEP         = true,
			COL_OCT         = true,
			COL_NOV         = true,
			COL_DEC         = true;
		}
		if(month2==1)
		{
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			grdPlan.GetGridControl().ColHidden(APR)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC)     = true ;
			
			COL_FEB			= true,
			COL_MAR			= true,
			COL_APR			= true,
			COL_MAY			= true,
			COL_JUN			= true,
			COL_JUL			= true,
			COL_AUG         = true,
			COL_SEP         = true,
			COL_OCT         = true,
			COL_NOV         = true,
			COL_DEC         = true;
		}
		
		//============================================================
		if(month1==2)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;

			COL_JAN = true;
		}
		if(month1==3)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;

			COL_JAN = true,
			COL_FEB = true;
		}
		if(month1==4)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			
			COL_JAN = true,
			COL_FEB = true,
			COL_MAR = true;
		}
		if(month1==5)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			grdPlan.GetGridControl().ColHidden(APR)     = true ;

			COL_JAN = true,
			COL_FEB = true,
			COL_MAR = true,
			COL_APR = true;
		}
		if(month1==6)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			grdPlan.GetGridControl().ColHidden(APR)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY)     = true ;
			
			COL_JAN = true,
			COL_FEB = true,
			COL_MAR = true,
			COL_APR = true,
			COL_MAY = true;
		}
		if(month1==7)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			grdPlan.GetGridControl().ColHidden(APR)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN)     = true ;
			
			COL_JAN = true,
			COL_FEB = true,
			COL_MAR = true,
			COL_APR = true,
			COL_MAY = true,
			COL_JUN = true;
		}
		if(month1==8)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			grdPlan.GetGridControl().ColHidden(APR)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL)     = true ;

			COL_JAN = true,
			COL_FEB = true,
			COL_MAR = true,
			COL_APR = true,
			COL_MAY = true,
			COL_JUN = true,
			COL_JUL = true;

		}
		if(month1==9)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			grdPlan.GetGridControl().ColHidden(APR)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG)     = true ;
			
			COL_JAN = true,
			COL_FEB = true,
			COL_MAR = true,
			COL_APR = true,
			COL_MAY = true,
			COL_JUN = true,
			COL_JUL = true,
			COL_AUG = true;
		}
		if(month1==10)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			grdPlan.GetGridControl().ColHidden(APR)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP)     = true ;
			
			COL_JAN = true,
			COL_FEB = true,
			COL_MAR = true,
			COL_APR = true,
			COL_MAY = true,
			COL_JUN = true,
			COL_JUL = true,
			COL_AUG = true,
			COL_SEP = true;
		}
		if(month1==11)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			grdPlan.GetGridControl().ColHidden(APR)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT)     = true ;

			COL_JAN = true,
			COL_FEB = true,
			COL_MAR = true,
			COL_APR = true,
			COL_MAY = true,
			COL_JUN = true,
			COL_JUL = true,
			COL_AUG = true,
			COL_SEP = true,
			COL_OCT = true;
		}
		if(month1==12)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			grdPlan.GetGridControl().ColHidden(APR)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV)     = true ;
			
			COL_JAN = true,
			COL_FEB = true,
			COL_MAR = true,
			COL_APR = true,
			COL_MAY = true,
			COL_JUN = true,
			COL_JUL = true,
			COL_AUG = true,
			COL_SEP = true,
			COL_OCT = true,
			COL_NOV = true;
		}   
	}
	
	//===============================================================================
	else
	{
		//ResetGrid();

		if(month2==11)
		{
			grdPlan.GetGridControl().ColHidden(DEC2)     = true ;

			COL_DEC2 = true;
		}
		if(month2==10)
		{
			grdPlan.GetGridControl().ColHidden(NOV2)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC2)     = true ;
			COL_NOV2 = true,
			COL_DEC2 = true;
		}
		if(month2==9)
		{
			grdPlan.GetGridControl().ColHidden(NOV2)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT2)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC2)     = true ;

			COL_NOV2 = true,
			COL_OCT2 = true,
			COL_DEC2 = true;
		}
		if(month2==8)
		{
			grdPlan.GetGridControl().ColHidden(SEP2)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV2)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT2)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC2)     = true ;

			COL_SEP2 = true,
			COL_NOV2 = true,
			COL_OCT2 = true,
			COL_DEC2 = true;
		}
		if(month2==7)
		{
			grdPlan.GetGridControl().ColHidden(AUG2)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP2)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV2)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT2)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC2)     = true ;

			COL_AUG2 = true,
			COL_SEP2 = true,
			COL_NOV2 = true,
			COL_OCT2 = true,
			COL_DEC2 = true;
		}
		if(month2==6)
		{
			grdPlan.GetGridControl().ColHidden(JUL2)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG2)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP2)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV2)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT2)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC2)     = true ;

			COL_JUL2 = true,
			COL_AUG2 = true,
			COL_SEP2 = true,
			COL_NOV2 = true,
			COL_OCT2 = true,
			COL_DEC2 = true;
		}
		if(month2==5)
		{
			grdPlan.GetGridControl().ColHidden(JUN2)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL2)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG2)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP2)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV2)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT2)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC2)     = true ;

			COL_JUN2 = true,
			COL_JUL2 = true,
			COL_AUG2 = true,
			COL_SEP2 = true,
			COL_NOV2 = true,
			COL_OCT2 = true,
			COL_DEC2 = true;
		}
		if(month2==4)
		{
			grdPlan.GetGridControl().ColHidden(MAY2)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN2)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL2)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG2)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP2)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV2)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT2)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC2)     = true ;

			COL_MAY2 = true,
			COL_JUN2 = true,
			COL_JUL2 = true,
			COL_AUG2 = true,
			COL_SEP2 = true,
			COL_NOV2 = true,
			COL_OCT2 = true,
			COL_DEC2 = true;
		}
		if(month2==3)
		{
			grdPlan.GetGridControl().ColHidden(APR2)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY2)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN2)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL2)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG2)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP2)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV2)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT2)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC2)     = true ;

			COL_APR2 = true,
			COL_MAY2 = true,
			COL_JUN2 = true,
			COL_JUL2 = true,
			COL_AUG2 = true,
			COL_SEP2 = true,
			COL_NOV2 = true,
			COL_OCT2 = true,
			COL_DEC2 = true;
		}
		if(month2==2)
		{
			grdPlan.GetGridControl().ColHidden(MAR2)     = true ;
			grdPlan.GetGridControl().ColHidden(APR2)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY2)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN2)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL2)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG2)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP2)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV2)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT2)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC2)     = true ;

			COL_MAR2 = true,
			COL_APR2 = true,
			COL_MAY2 = true,
			COL_JUN2 = true,
			COL_JUL2 = true,
			COL_AUG2 = true,
			COL_SEP2 = true,
			COL_NOV2 = true,
			COL_OCT2 = true,
			COL_DEC2 = true;
		}
		if(month2==1)
		{
			grdPlan.GetGridControl().ColHidden(FEB2)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR2)     = true ;
			grdPlan.GetGridControl().ColHidden(APR2)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY2)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN2)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL2)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG2)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP2)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV2)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT2)     = true ;
			grdPlan.GetGridControl().ColHidden(DEC2)     = true ;

			COL_FEB2 = true,
			COL_MAR2 = true,
			COL_APR2 = true,
			COL_MAY2 = true,
			COL_JUN2 = true,
			COL_JUL2 = true,
			COL_AUG2 = true,
			COL_SEP2 = true,
			COL_NOV2 = true,
			COL_OCT2 = true,
			COL_DEC2 = true;
		}
		
		//============================================================
		
		if(month1==2)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;

			COL_JAN = true;			
		}
		if(month1==3)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			
			COL_JAN = true,
			COL_FEB = true;
		}
		if(month1==4)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			
			COL_JAN = true,
			COL_FEB = true,
			COL_MAR = true;
		}
		if(month1==5)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			grdPlan.GetGridControl().ColHidden(APR)     = true ;
			
			COL_JAN = true,
			COL_FEB = true,
			COL_MAR = true,
			COL_APR = true;
		}
		if(month1==6)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			grdPlan.GetGridControl().ColHidden(APR)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY)     = true ;
			
			COL_JAN = true,
			COL_FEB = true,
			COL_MAR = true,
			COL_APR = true,
			COL_MAY = true;
		}
		if(month1==7)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			grdPlan.GetGridControl().ColHidden(APR)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN)     = true ;
			
			COL_JAN = true,
			COL_FEB = true,
			COL_MAR = true,
			COL_APR = true,
			COL_MAY = true,
			COL_JUN = true;
		}
		if(month1==8)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			grdPlan.GetGridControl().ColHidden(APR)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL)     = true ;

			COL_JAN = true,
			COL_FEB = true,
			COL_MAR = true,
			COL_APR = true,
			COL_MAY = true,
			COL_JUN = true,
			COL_JUL = true;
		}
		if(month1==9)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			grdPlan.GetGridControl().ColHidden(APR)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG)     = true ;
			
			COL_JAN = true,
			COL_FEB = true,
			COL_MAR = true,
			COL_APR = true,
			COL_MAY = true,
			COL_JUN = true,
			COL_JUL = true,
			COL_AUG = true;
		}
		if(month1==10)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			grdPlan.GetGridControl().ColHidden(APR)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP)     = true ;
			
			COL_JAN = true,
			COL_FEB = true,
			COL_MAR = true,
			COL_APR = true,
			COL_MAY = true,
			COL_JUN = true,
			COL_JUL = true,
			COL_AUG = true,
			COL_SEP = true;
		}
		if(month1==11)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			grdPlan.GetGridControl().ColHidden(APR)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT)     = true ;
			
			COL_JAN = true,
			COL_FEB = true,
			COL_MAR = true,
			COL_APR = true,
			COL_MAY = true,
			COL_JUN = true,
			COL_JUL = true,
			COL_AUG = true,
			COL_SEP = true,
			COL_OCT = true;
		}
		if(month1==12)
		{
			grdPlan.GetGridControl().ColHidden(JAN)     = true ;
			grdPlan.GetGridControl().ColHidden(FEB)     = true ;
			grdPlan.GetGridControl().ColHidden(MAR)     = true ;
			grdPlan.GetGridControl().ColHidden(APR)     = true ;
			grdPlan.GetGridControl().ColHidden(MAY)     = true ;
			grdPlan.GetGridControl().ColHidden(JUN)     = true ;
			grdPlan.GetGridControl().ColHidden(JUL)     = true ;
			grdPlan.GetGridControl().ColHidden(AUG)     = true ;
			grdPlan.GetGridControl().ColHidden(SEP)     = true ;
			grdPlan.GetGridControl().ColHidden(OCT)     = true ;
			grdPlan.GetGridControl().ColHidden(NOV)     = true ;

			COL_JAN = true,
			COL_FEB = true,
			COL_MAR = true,
			COL_APR = true,
			COL_MAY = true,
			COL_JUN = true,
			COL_JUL = true,
			COL_AUG = true,
			COL_SEP = true,
			COL_OCT = true,
			COL_NOV = true;
		}   
	}
}
//==========================================================================
function MergeHeader_LaborCost()
{
	var fg = grdLaborCost.GetGridControl(); 	
	if(fg.Rows < 2)
	{
	   grdLaborCost.AddRow();     
	}    
	fg.FixedRows = 2
	fg.MergeCells = 5	
	
	var date1=dtWorking_Period_Fr.value;
	var date2=dtWorking_Period_To.value;

	var year1=date1.substring(0,4);
	var year2=date2.substring(0,4);

	fg.MergeRow(0) = true 
	
	fg.MergeCol(LABOR_POS) = true
	fg.Cell(0, 0, LABOR_POS, 1, LABOR_POS) = "Postion"	
	fg.MergeCol(1) = true
	
	fg.Cell(0, 0, LABOR_SUB_MM, 0, 2)  = "Sub - Total"   //fg.Cell(0,row, from_col, row, to_col)	
	fg.Cell(0, 1, LABOR_SUB_MM, 1, LABOR_SUB_MM) = "MM"
	fg.Cell(0, 1, LABOR_SUB_MM, 1, LABOR_SUB_MM) = "Amount" 
   
	fg.Cell(0, 0, LABOR_YEAR_MM, 0, 5)  = year1 + " Year"   //fg.Cell(0,row, from_col, row, to_col)	
	fg.Cell(0, 1, LABOR_YEAR_MM, 1, LABOR_YEAR_MM) = "MM"
	fg.Cell(0, 1, LABOR_YEAR_UNIT_PRICE, 1, LABOR_YEAR_UNIT_PRICE) = "Unit Price" 
	fg.Cell(0, 1, LABOR_YEAR_AMT, 1, LABOR_YEAR_AMT) = "Amount"  
	
	fg.Cell(0, 0, LABOR_YEAR2_MM, 0, 8)  = year2 + " Year"   //fg.Cell(0,row, from_col, row, to_col)	
	fg.Cell(0, 1, LABOR_YEAR2_MM, 1, LABOR_YEAR2_MM) = "MM"
	fg.Cell(0, 1, LABOR_YEAR2_UNIT_PRICE, 1, LABOR_YEAR2_UNIT_PRICE) = "Unit Price" 
	fg.Cell(0, 1, LABOR_YEAR2_AMT, 1, LABOR_YEAR2_AMT) = "Amount"   
	
	var ctrl = grdLaborCost.GetGridControl();
	ctrl.ColAlignment(LABOR_SUB_MM)				= 7;
	ctrl.ColAlignment(LABOR_SUB_AMT)			= 7;
	ctrl.ColAlignment(LABOR_YEAR_MM)			= 7;
	ctrl.ColAlignment(LABOR_YEAR_UNIT_PRICE)	= 7;
	ctrl.ColAlignment(LABOR_YEAR_AMT)			= 7;
	ctrl.ColAlignment(LABOR_YEAR2_MM)			= 7;
	ctrl.ColAlignment(LABOR_YEAR2_UNIT_PRICE)	= 7;
	ctrl.ColAlignment(LABOR_YEAR2_AMT)			= 7;

	ctrl.ColFormat(LABOR_SUB_MM)			= "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(LABOR_SUB_AMT)			= "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(LABOR_YEAR_MM)			= "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(LABOR_YEAR_UNIT_PRICE)	= "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(LABOR_YEAR_AMT)			= "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(LABOR_YEAR2_MM)			= "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(LABOR_YEAR2_UNIT_PRICE)	= "#,###,###,###,###,###,###,###,###.##R";
	ctrl.ColFormat(LABOR_YEAR2_AMT)			= "#,###,###,###,###,###,###,###,###.##R";
}
//==========================================================================
function OnPopUp(pos)
{
    switch(pos)
    {
        case 'Project':
            var fpath = System.RootURL + "/form/61/04/61040070_1.aspx";
            var aValue = System.OpenModal( fpath , 600 , 500 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
            if(aValue != null)
            {
				txtProjectPK.text = aValue[0];
				txtProject_Cd.text = aValue[1];
				txtProject_Nm.text = aValue[2];
				 
				dtWorking_Period_Fr.value = aValue[3];
				dtWorking_Period_To.value = aValue[4];
				OnSearch('MST');
            } 
        break;
    }
}

function OnSearch(obj)
{
	switch(obj)
	{
		case 'MST':
			dso_BudgetNo.Call('SELECT');
		break;
		case 'PLAN':
			if (txtProjectPK.text != '')
			{
				var date1=dtWorking_Period_Fr.value;
				var date2=dtWorking_Period_To.value;

				if (date2 - date1 >= 198)  // ??? check again - gioi han 2 nam
				{	
					// lon hon 2 nam
					var month1 = padLeft(Number(date1.substring(4,6)),2);
					var year1  = Number(date1.substring(0,4)) + 1 + '';			
					dtWorking_Period_To.SetDataText(year1 + month1);
				}

				txtBudgetNo.text = lstBudgetNo.GetText();
				dso_grdPlan.Call('SELECT');
			}
			else
			{
				MergeHeader_Planned();
				Debug(false);
			}
		break;
	}
}

function OnNew()
{
	grdPlan.AddRow();
	grdPlan.SetGridText(grdPlan.rows-1, PRJ_PK, txtProjectPK.text); // project pk
	grdPlan.SetGridText(grdPlan.rows-1, G2_MM_SUM, 0);			  // qty
	grdPlan.SetGridText(grdPlan.rows-1, G2_UNIT_PRICE, 0); // unit prices
	grdPlan.SetGridText(grdPlan.rows-1, FROM_MM, dtWorking_Period_Fr.value); 
	grdPlan.SetGridText(grdPlan.rows-1, TO_MM, dtWorking_Period_To.value); 
	grdPlan.SetGridText(grdPlan.rows-1, SEQ, lstBudgetNo.value);
/*
	for (col = JAN; col <= DEC2; col+=3 )
	{
		grdPlan.SetGridText(grdPlan.rows-1, col, 0);
	}
*/	
	var month1 = '1', date1, year1;
	date1 = dtWorking_Period_Fr.value;
	year1 = date1.substring(0,4);
	for (col_mm_1 = JAN+1; col_mm_1 <= PK_DEC; col_mm_1+=3 )
	{
		month1 = padLeft(month1, 2);
		grdPlan.SetGridText(grdPlan.rows-1, col_mm_1, year1 + ''+ month1);

		month1 = Number(month1);
		month1++;
	}

	var month2 = '1', date2, year2;
	date2 = dtWorking_Period_To.value;
	year2 = date2.substring(0,4);
	for (col_mm_2 = JAN2+1; col_mm_2 <= PK_DEC2; col_mm_2+=3 )
	{
		month2 = padLeft(month2, 2);
		grdPlan.SetGridText(grdPlan.rows-1, col_mm_2, year2 + ''+ month2);

		month2 = Number(month2);
		month2++;
	}
}

function padLeft(n, d) 
{
	return Array(Math.max(0, d - (n + '').length + 1)).join(0) + n;
}

function OnSave()
{
	for (row = 2; row < grdPlan.rows; row++ )
	{
		if (grdPlan.GetGridData(row, G2_SITE_EXE_YN) == '' || 
			grdPlan.GetGridData(row, G2_JOB) == '' ||
			grdPlan.GetGridData(row, G2_POSITION) == '')
		{
			alert('Please, input data at row : ' + (row -1));
			return;
		}
	}

	dso_grdPlan.Call();
}

function OnDelete()
{
	if (confirm('Are you sure delete row(s) ?'))
	{
		grdPlan.DeleteRow();
	}
}

function OnUnDelete()
{
	grdPlan.UnDeleteRow();
}

function OnDBClick(obj)
{
	return;
	switch (obj.id)
	{
		case 'grdPlan':
			if (grdPlan.col == G2_JOB)
			{
				var path = System.RootURL + '/form/kp/bp/kpbp00050Work_Breakdown_1.aspx';
				var obj = System.OpenModal( path ,600 , 600 , 'resizable:yes;status:yes');

				if ( obj != null )
				{
					for (row = 2; row < grdPlan.rows; row++ )
					{
						if (grdPlan.GetGridData(row, LEVEL_PK) == obj[2])
						{
							alert('Duplicate Work Description !!!');
							return;
						}
					}
					
					grdPlan.SetGridText(grdPlan.row, G2_JOB, obj[1]);
					grdPlan.SetGridText(grdPlan.row, LEVEL_PK, obj[2]);
				}
			}
		break;	
	}
}

function AfterEdit()
{
	if (grdPlan.col > G2_POSITION)
	{
		if (isNaN(grdPlan.GetGridData(grdPlan.row, grdPlan.col)))
		{
			grdPlan.SetGridText(grdPlan.row, grdPlan.col, 0);
			return;
		}
		else
		{
			var mm_sum = 0, amt = 0;

			if (COL_JAN == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, JAN));
			if (COL_FEB == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, FEB));
			if (COL_MAR == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, MAR));
			if (COL_APR == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, APR));
			if (COL_MAY == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, MAY));
			if (COL_JUN == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, JUN));
			if (COL_JUL == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, JUL));
			if (COL_AUG == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, AUG));
			if (COL_SEP == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, SEP));
			if (COL_OCT == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, OCT));
			if (COL_NOV == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, NOV));
			if (COL_DEC == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, DEC));
			
			if (COL_JAN2 == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, JAN2));
			if (COL_FEB2 == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, FEB2));
			if (COL_MAR2 == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, MAR2));
			if (COL_APR2 == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, APR2));
			if (COL_MAY2 == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, MAY2));
			if (COL_JUN2 == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, JUN2));
			if (COL_JUL2 == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, JUL2));
			if (COL_AUG2 == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, AUG2));
			if (COL_SEP2 == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, SEP2));
			if (COL_OCT2 == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, OCT2));
			if (COL_NOV2 == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, NOV2));
			if (COL_DEC2 == false) mm_sum += Number(grdPlan.GetGridData(grdPlan.row, DEC2));
			
			grdPlan.SetGridText(grdPlan.row, G2_MM_SUM, mm_sum);

			var plan_mm_sum = 0;
			for (row = 2; row < grdPlan.rows; row++)
			{
				plan_mm_sum += Number(grdPlan.GetGridData(row, G2_MM_SUM));
				amt			+= Number(grdPlan.GetGridData(row, G2_UNIT_PRICE)) * Number(grdPlan.GetGridData(row, G2_MM_SUM)); 
			}
			
			if (grdInfo.rows <= 2)
			{
				grdInfo.AddRow();
				grdInfo.SetGridText(grdInfo.rows-1, INF_PALM_MM, 0);
				grdInfo.SetGridText(grdInfo.rows-1, INF_PLAN_AMT, 0);
				grdInfo.SetGridText(grdInfo.rows-1, INF_INPUT_MM, 0);
				grdInfo.SetGridText(grdInfo.rows-1, INF_INPUT_AMT, 0);
			}

			grdInfo.SetGridText(grdInfo.rows-1, INF_PALM_MM, plan_mm_sum);
			grdInfo.SetGridText(grdInfo.rows-1, INF_PLAN_AMT, amt);
		}
	}
}
function OnReceiveData(obj)
{
	switch(obj.id)
	{
		case 'dso_BudgetNo':
			dso_CONTAMT.Call();
		break;
		case 'dso_CONTAMT':
			txtBudgetNo.text = lstBudgetNo.GetText();
			dso_grdPlan.Call('SELECT');
		break;
		case 'dso_grdPlan':
			MergeHeader_Planned();
			Debug(false);
			CalSum();

			dso_grdLaborCost.Call('SELECT');
		break;
		case 'dso_grdLaborCost':
			MergeHeader_LaborCost(); 
		break;
	}
}

function CalSum()
{
	if (grdPlan.rows <= 2) return;
	var mm_sum = 0, amt = 0, plan_mm_sum = 0, amt = 0;

	for (row = 2; row < grdPlan.rows; row++ )
	{
		 mm_sum = 0; 

		if (COL_JAN == false) mm_sum += Number(grdPlan.GetGridData(row, JAN));
		if (COL_FEB == false) mm_sum += Number(grdPlan.GetGridData(row, FEB));
		if (COL_MAR == false) mm_sum += Number(grdPlan.GetGridData(row, MAR));
		if (COL_APR == false) mm_sum += Number(grdPlan.GetGridData(row, APR));
		if (COL_MAY == false) mm_sum += Number(grdPlan.GetGridData(row, MAY));
		if (COL_JUN == false) mm_sum += Number(grdPlan.GetGridData(row, JUN));
		if (COL_JUL == false) mm_sum += Number(grdPlan.GetGridData(row, JUL));
		if (COL_AUG == false) mm_sum += Number(grdPlan.GetGridData(row, AUG));
		if (COL_SEP == false) mm_sum += Number(grdPlan.GetGridData(row, SEP));
		if (COL_OCT == false) mm_sum += Number(grdPlan.GetGridData(row, OCT));
		if (COL_NOV == false) mm_sum += Number(grdPlan.GetGridData(row, NOV));
		if (COL_DEC == false) mm_sum += Number(grdPlan.GetGridData(row, DEC));
		
		if (COL_JAN2 == false) mm_sum += Number(grdPlan.GetGridData(row, JAN2));
		if (COL_FEB2 == false) mm_sum += Number(grdPlan.GetGridData(row, FEB2));
		if (COL_MAR2 == false) mm_sum += Number(grdPlan.GetGridData(row, MAR2));
		if (COL_APR2 == false) mm_sum += Number(grdPlan.GetGridData(row, APR2));
		if (COL_MAY2 == false) mm_sum += Number(grdPlan.GetGridData(row, MAY2));
		if (COL_JUN2 == false) mm_sum += Number(grdPlan.GetGridData(row, JUN2));
		if (COL_JUL2 == false) mm_sum += Number(grdPlan.GetGridData(row, JUL2));
		if (COL_AUG2 == false) mm_sum += Number(grdPlan.GetGridData(row, AUG2));
		if (COL_SEP2 == false) mm_sum += Number(grdPlan.GetGridData(row, SEP2));
		if (COL_OCT2 == false) mm_sum += Number(grdPlan.GetGridData(row, OCT2));
		if (COL_NOV2 == false) mm_sum += Number(grdPlan.GetGridData(row, NOV2));
		if (COL_DEC2 == false) mm_sum += Number(grdPlan.GetGridData(row, DEC2));
			
		grdPlan.SetGridText(row, G2_MM_SUM, mm_sum);

		plan_mm_sum += Number(grdPlan.GetGridData(row, G2_MM_SUM));
		amt += Number(grdPlan.GetGridData(row, G2_MM_SUM)) * Number(grdPlan.GetGridData(row, G2_UNIT_PRICE));
	}
		
	if (grdInfo.rows <= 2)
	{
		grdInfo.AddRow();
		grdInfo.SetGridText(grdInfo.rows-1, INF_PALM_MM, 0);
		grdInfo.SetGridText(grdInfo.rows-1, INF_PLAN_AMT, 0);
		grdInfo.SetGridText(grdInfo.rows-1, INF_INPUT_MM, 0);
		grdInfo.SetGridText(grdInfo.rows-1, INF_INPUT_AMT, 0);
	}
	
	grdInfo.SetGridText(grdInfo.rows-1, INF_PALM_MM, plan_mm_sum);
	grdInfo.SetGridText(grdInfo.rows-1, INF_PLAN_AMT, amt );
}

function OnChangeTab()
{
}
</script>

<body>
<gw:data id="dso_CONTAMT" onreceive="OnReceiveData(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="pm_pro_61040070_contamt"  > 
			<input> 
				<input bind="txtProjectPK" />
				<input bind="lstBudgetNo" />
			 </input>
			 <output>
				<output bind="txtContract_Amt"/>
			 </output>
		</dso> 
	</xml>
</gw:data>
<gw:data id="dso_BudgetNo" onreceive="OnReceiveData(this)"> 
    <xml> 
        <dso id="2" type="list" procedure="pm_sel_61040070_budgetno" > 
			<input> 
				<input bind="txtProjectPK" />
			</input> 
			<output>
				<output bind="lstBudgetNo" /> 
			</output>
		</dso> 
	</xml> 
</gw:data>
<gw:data id="dso_grdPlan" onreceive="OnReceiveData(this)"> 
    <xml> 
        <dso id="2" type="grid" parameter="1,2,3,4,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,82,83" function="pm_sel_61040070_mm_plan" procedure="pm_upd_61040070_mm_plan" > 
            <input bind="grdPlan">
                <input bind="txtProjectPK" />
				<input bind="dtWorking_Period_Fr" />
				<input bind="dtWorking_Period_To" />
				<input bind="lstBudgetNo" />
            </input> 
            <output bind="grdPlan" /> 
        </dso> 
    </xml> 
</gw:data>
<gw:data id="dso_grdLaborCost" onreceive="OnReceiveData(this)"> 
    <xml> 
        <dso id="2" type="grid" function="pm_sel_61040070_labor_cost" > 
            <input bind="grdLaborCost">
                <input bind="txtProjectPK" />
				<input bind="lstBudgetNo" />
				<input bind="dtWorking_Period_Fr" />
				<input bind="dtWorking_Period_To" />
            </input> 
            <output bind="grdLaborCost" /> 
        </dso> 
    </xml> 
</gw:data>

    <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
        <tr style="height: 2%">
            <td width="100%">
                <fieldset style="padding: 0">
                    <table cellpadding="1" cellspacing="1" width="100%">
                        <tr>
                            <td align="right" width="5%">
                                <a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">
                                    Project</a></td>
                            <td width="30%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="40%">
                                            <gw:textbox id="txtProject_Cd" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="60%">
                                            <gw:textbox id="txtProject_Nm" readonly="true" styles='width:100%' />
                                        </td>
                                        <td width="">
                                            <gw:textbox id="txtProjectPK" styles='width:100%;display:none' />
                                        </td>
                                        <td>
                                            <gw:imgbtn id="btve2" img="reset" alt="Reset" onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProjectPK.text='';" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right" width="10%"><a title="Actual Result Receipt Year/Month" style="color:#333">
                                A. Rslt Rcpt Yr/Mth</a></td>
                            <td width="55%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="">
                                            <gw:datebox type="month" id="dtActual" lang="1" />
                                        </td>
                                        <td align="right" width="40%">Budget No</td> 
                                            <td width="60%">
                                                <gw:list id="lstBudgetNo" onchange="OnSearch('PLAN')" styles='width:100%'></gw:list>
                                            </td>
                                            <td>
                                                <gw:imgbtn id="ibtnsearch" img="search" alt="Search..." onclick="OnSearch('PLAN')" />
                                            </td>
                                            <td>
                                                <gw:button id="ibtndte" img="new" alt="New" onclick="OnNew()" />
                                            </td>
                                            <td>
                                                <gw:button id="ibtnpdate" img="save" alt="Save" onclick="OnSave()" />
                                            </td>
                                            <td>
                                                <gw:button id="ibtUDelete" img="udelete" alt="UnDelete" onclick="OnUnDelete()" />
                                            </td>
                                            <td>
                                                <gw:button id="ibtDelete" img="delete" alt="Delete" onclick="OnDelete()" />
                                            </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right"><a title="Working Period" style="color:#333">
                                Wkng Per.</a></td>
                            <td width="">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="45%">
                                            <gw:datebox id="dtWorking_Period_Fr" lang="1" type="month"  onchange="OnSearch('PLAN')" />
                                        </td>
                                        <td width="10%" align="center">
                                            ~</td>
                                        <td width="45%">
                                            <gw:datebox id="dtWorking_Period_To" lang="1" type="month" onchange="OnSearch('PLAN')"/>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td align="right" width=""><a title="Contract Amount" style="color:#333">Cont. Amt&nbsp;</a></td>  
                            <td width="">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>                               
                                        <td width="40%" ><gw:textbox id="txtContract_Amt" type="number" format="#,###,###,###,###.##R" readonly="true" styles='width:100%' /></td>
                                        <td align="right" width="20%"><a title="Sales Person"  style="color:#333; display:none">Sales/per.&nbsp;</a></td>
                                        <td width="40%"><gw:textbox id="txtSalerPer" styles='width:100%;display:none' /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
        <tr style="height: 30%">
            <td width="100%">
                <gw:grid id="grdInfo" header="MM|Amount|MM|Amount" format="0|0|0|0" aligns="3|3|3|3"
                    defaults="|||" editcol="0|0|0|0" widths="1000|5000|1000|2500" styles="width:100%; height:100%"
                    sorting="T" />
            </td>
        </tr>
        <tr style="height: 68%">
            <td width="100%">
                <gw:tab id="idTab" onpageactivate="OnChangeTab()">
                <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%" name="MM Plan">
                    <tr>
                        <td width="100%">
                            <!--header="0.Description | 1.Amount (Contract Ccy) | 2.Amount (USD) | 3.Ratio to Contract Amount | 4.Amount (Contract Ccy) | 5.Amount (USD) | 6.Ration to Total Amount | 7.(Main Contract - Budget) | 8.Budget Amt / Main Contract Amt"   -->
                            <gw:grid id="grdPlan" 
							header=" _0.PK|1.Execution Y/N|2.Job|3.Position|4.Unit Price|5.MM Sum
							|6.Jan|_7.JAN_MM|_8.PK_JAN
							|9.Feb|_10.FEB_MM|_11.PK_FEB
							|12.Mar|_13.MAR_MM|_14.PK_MAR
							|15.Apr|_16.APR_MM|_17.PK_APR
							|18.May|_19.MAY_MM|_20.PK_MAY
							|21.Jun|_22.JUN_MM|_23.PK_JUN
							|24.Jul|_25.JUL_MM|_26.PK_JUL
							|27.Aug|_28.AUG_MM|_29.PK_AUG
							|30.Sep|_31.SEP_MM|_32.PK_SEP
							|33.Oct|_34.OCT_MM|_35.PK_OCT
							|36.Nov|_37.NOV_MM|_38.PK_NOV
							|39.Dec|_40.DEC_MM|_41.PK_DEC
							|42.Jan2|_43.JAN2_MM|_44.PK_JAN2
							|45.Feb2|_46.FEB2_MM|_47.PK_FEB2
							|48.Mar2|_49.MAR2_MM|_50.PK_MAR2
							|51.Apr2|_52.APR2_MM|_53.PK_APR2
							|54.May2|_55.MAY2_MM|_56.PK_MAY2
							|57.Jun2|_58.JUN2_MM|_59.PK_JUN2
							|60.Jul2|_61.JUL2_MM|_62.PK_JUL2
							|63.Aug2|_64.AUG2_MM|_65.PK_AUG2
							|66.Sep2|_67.SEP2_MM|_68.PK_SEP2
							|69.Oct2|_70.OCT2_MM|_71.PK_OCT2
							|72.Nov2|_73.NOV2_MM|_74.PK_NOV2
							|75.Dec2|_76.DEC_MM|_77.PK_DEC2
							|_78.LEVEL_PK|_79.PRJ_PK|_80.FROM_MM|_81.TO_MM|_82.TECPS_PERFORMBUDGETBASC_PK|_83.SEQ"
							format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
							aligns="0|1|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
							defaults="||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||" 
 						    editcol="0|1|1|0|1|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
							widths="0|1500|1700|2500|1500|2500|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
							styles="width:100%; height:100%" 
							sorting="T" 
							debug="false"
							oncelldblclick="OnDBClick(this)"
							onafteredit="AfterEdit()" />
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%" name="Inquiry Labor Cost">
                    <tr style="height: 10%; width: 100%" style="display:none">
                        <td>
                            <fieldset style="width: 100%">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td align="right" width="12%">
                                            <a title="Click here to show Project" href="#" style="text-decoration: none" onClick="OnPopUp('Project')">
                                                Project</a></td>
                                        <td width="30%">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="40%">
                                                        <gw:textbox id="txtProjectL_Cd" readonly="true" styles='width:100%' />
                                                    </td>
                                                    <td width="60%">
                                                        <gw:textbox id="txtProjectL_Nm" readonly="true" styles='width:100%' />
                                                    </td>
                                                    <td width="">
                                                        <gw:textbox id="txtProjectL_Pk" styles='width:100%;display:none' />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="btvre2" img="reset" alt="Reset" onclick="txtProjectL_Cd.text='';txtProjectL_Nm.text='';txtProjectL_Pk.text='';" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right" width="15%">
                                            Budget No .</td>
                                        <td width="47%">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="30%">
                                                        <gw:textbox id="txtBudget_No" styles='width:100%' />
                                                    </td>
                                                    <td align="right" width="30%">
                                                        Turnover/Person</td>
                                                    <td width="30%">
                                                        <gw:textbox id="txtTurnover" styles='width:100%' />
                                                    </td>
                                                    <td width="10%">
                                                        USD/Year</td>
                                                    <td>
                                                        <gw:imgbtn id="ibtnUpdte" img="search" alt="Search" onclick="OnSearch()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibtnpdte" img="new" alt="New" onclick="OnNew()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibtnUpdate" img="save" alt="Save" onclick="OnSave()" />
                                                    </td>
                                                    <td>
                                                        <gw:imgbtn id="ibtUpdate" img="delete" alt="Delete" onclick="OnDelete()" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            Working Period</td>
                                        <td width="">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="45%">
                                                        <gw:datebox id="dtWorking_Period_Fr1" lang="1" />
                                                    </td>
                                                    <td width="10%" align="center">
                                                        ~</td>
                                                    <td width="45%">
                                                        <gw:datebox id="dtWorking_Period_To1" lang="1" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right">
                                            Contract Amount</td>
                                        <td width="">
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 90%">
                        <td width="100%">
                            <gw:grid id="grdLaborCost" 
                            header="0.Postion|1.MM|2.Amount|3.MM|4.Unit Price|5.Amount|6.MM|7.Unit Price|8.Amount"
                                format="0|0|0|0|0|0|0|0|0" aligns="0|1|1|1|1|1|1|1|1" defaults="||||||||"
                                editcol="0|0|0|0|0|0|0|0|0" widths="1500|1500|1500|1500|1500|1500|1500|1500|1500"
                                styles="width:100%; height:100%" sorting="T" 
								debug="false"/>
                        </td>
                    </tr>
                </table>
                </gw:tab>
            </td>
        </tr>
    </table>
</body>
<gw:textbox id="txtLevelCodePK" styles='width:100%;display:none' />
<gw:textbox id="txtBudgetNo" styles='width:100%;display:none' />
</html>
