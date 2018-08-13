<!-- #include file="../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Process Plan Registration</title>
</head>
<%  ESysLib.SetUser(Session("APP_DBUSER"))%>
<script>
var project_pk, progplanbase_pk;
var flag_save = false;
var version = '';
var dup = false;

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
    COL_DEC2         = false,
  
COL_JAN3         = false,
    COL_FEB3         = false,
    COL_MAR3         = false,
    COL_APR3        = false,
    COL_MAY3         = false,
    COL_JUN3        = false,
    COL_JUL3         = false,
    COL_AUG3         = false,
    COL_SEP3        = false,
    COL_OCT3         = false,
    COL_NOV3         = false,
    COL_DEC3         = false,
  COL_JAN4         = false,
    COL_FEB4         = false,
    COL_MAR4         = false,
    COL_APR4        = false,
    COL_MAY4         = false,
    COL_JUN4        = false,
    COL_JUL4         = false,
    COL_AUG4         = false,
    COL_SEP4        = false,
    COL_OCT4         = false,
    COL_NOV4         = false,
    COL_DEC4         = false;  

var IT_LARGE_DIV	= 0,
	IT_CODE			= 1,
	IT_DTL_ITEM		= 2,
	IT_LEVEL		= 3,
	IT_PK			= 4,
	IT_PROJECT_PK	= 5;

var PLAN_PK			= 0,
	PLAN_LARGE_DIV  = 1,
    PLAN_DTL_ITEM   = 2,
    PLAN_UNIT		= 3,
    PLAN_WEIGHT		= 4,
    PLAN_TOTAL      = 5,
	PLAN_RESULT		= 6,
	PLAN_TRIBUTION  = 7,
    PERCENT  = 8,
    REMARK = 9,
    JAN				= 10,
	JAN_MM			= 11,
	PK_JAN			= 12,

    FEB             = 13,
	FEB_MM			= 14,
	PK_FEB          = 15,

    MAR             = 16,
	MAR_MM			= 17,
    PK_MAR          = 18,

    APR             = 19,
	APR_MM			= 20,
    PK_APR          = 21,

    MAY             = 22,
	MAY_MM			= 23,
    PK_MAY          = 24,

    JUN             = 25,
	JUN_MM			= 26,
    PK_JUN          = 27,

    JUL             = 28,
	JUL_MM			= 29,
    PK_JUL          = 30,

    AUG             = 31,
	AUG_MM			= 32,
    PK_AUG          = 33,

    SEP             = 34,
	SEP_MM			= 35,
    PK_SEP          = 36,

    OCT             = 37,
	OCT_MM			= 38,
    PK_OCT          = 39,

    NOV             = 40,
	NOV_MM			= 41,
    PK_NOV          = 42,

    DEC             = 43,
	DEC_MM			= 44,
    PK_DEC          = 45,

    JAN2            = 46,
	JAN2_MM			= 47,
    PK_JAN2         = 48,

    FEB2            = 49,
	FEB2_MM			= 50,
    PK_FEB2         = 51,

    MAR2            = 52,
	MAR2_MM			= 53,
    PK_MAR2         = 54,

    APR2            = 55,
	APR2_MM			= 56,
    PK_APR2         = 57,

    MAY2            = 58,
	MAY2_MM			= 59,
    PK_MAY2         = 60,

    JUN2            = 61,
	JUN2_MM			= 62,
    PK_JUN2         = 63,

    JUL2            = 64,
	JUL2_MM			= 65,
    PK_JUL2         = 66,

    AUG2            = 67,
	AUG2_MM			= 68,
	PK_AUG2         = 69,

    SEP2            = 70,
	SEP2_MM			= 71,
    PK_SEP2         = 72,

    OCT2            = 73,
	OCT2_MM			= 74,
    PK_OCT2         = 75,

    NOV2            = 76,
	NOV2_MM			= 77,
    PK_NOV2         = 78,

    DEC2            = 79,
	DEC2_MM			= 80,
    PK_DEC2         = 81,
	
	PLAN_TECPS_PROPLAN_ITEM_PK	= 82,
	PLAN_TECPS_PROGPLANBASE_PK	= 83,
	PLAN_TECPS_PROJECTSUMM_PK	= 84,
	PLAN_LEVEL					= 85,
	PLAN_PROPLAN_CD				= 86,
	PLAN_CHANGESEQ				= 87,
	
	JAN3            = 88,
    FEB3            = 89,
    MAR3            = 90,
    APR3            = 91,
    MAY3            = 92,
    JUN3            = 93,
    JUL3            = 94,
    AUG3            = 95,
    SEP3            = 96,
    OCT3            = 97,
    NOV3            = 98,
    DEC3            = 99,
  
    JAN4            = 100,
    FEB4            = 101,
    MAR4            = 102,
    APR4            = 103,
    MAY4            = 104,
    JUN4            = 105,
    JUL4            = 106,
    AUG4            = 107,
    SEP4            = 108,
    OCT4            = 109,
    NOV4            = 110,
    DEC4            = 111;
function BodyInit()
{
	System.Translate(document);
	 grdPlan.MergeGridCols();
	grdPlan.MergeByCol(1);
	BindingDataList();
	MergeHeaderRegister();
	grdPlan.GetGridControl().FrozenCols = PLAN_UNIT;
	//InitControl();
	Debug(false);
	dtContractTarget_Fr.SetEnable(false);
	dtContractTarget_To.SetEnable(false);
}
//==============================================================================================  
function Debug(obj)
{	
	if (obj)
	{
		//grdPlan.GetGridControl().ColHidden(PLAN_PK)    = false ;

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
		//grdPlan.GetGridControl().ColHidden(PLAN_PK)    = true ;

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
//==============================================================================================  
function BindingDataList()
{
}
//==============================================================================================  
function OnPopUp(obj)
{
    switch(obj)
    {
		case 'Project':
			var fpath = System.RootURL + "/form/61/03/61030010_1.aspx";
			var aValue = System.OpenModal( fpath , 700 , 600 , 'resizable:yes;status:yes;toolbar=no;location:no;directories:no;menubar:no;scrollbars:no;'); 
			if(aValue != null)
			{
				txtProjectPk.text	= aValue[0];
				txtProject_Cd.text	= aValue[1];
				txtProject_Nm.text	= aValue[2];  
				project_pk			= txtProjectPk.text;
				dso_Date.Call();
			}
		break;
	}
}
//==============================================================================================  
function MergeHeaderRegister()
{
	var fg = grdPlan.GetGridControl(); 	
	if(fg.Rows < 2)
	{
	   grdPlan.AddRow();     
	}    

	fg.FixedRows	= 2
	fg.MergeCells	= 5	
		
	fg.MergeCol(PLAN_PK) = true
	fg.Cell(0, 0, PLAN_PK, 1, PLAN_PK)					= "PK"	
	fg.MergeCol(PLAN_LARGE_DIV) = true
	fg.Cell(0, 0, PLAN_LARGE_DIV, 1, PLAN_LARGE_DIV)	= "Item Code"	
	fg.MergeCol(PLAN_DTL_ITEM) = true
	fg.Cell(0, 0, PLAN_DTL_ITEM, 1, PLAN_DTL_ITEM)		= "Item Name"	
	fg.MergeCol(PLAN_UNIT) = true
	fg.Cell(0, 0, PLAN_UNIT, 1, PLAN_UNIT)				= "Unit"	
	fg.MergeCol(PLAN_WEIGHT) = true
	fg.Cell(0, 0, PLAN_WEIGHT, 1, PLAN_WEIGHT)			= "Weight Factor"	
	fg.MergeCol(PLAN_TOTAL) = true
	fg.Cell(0, 0, PLAN_TOTAL, 1, PLAN_TOTAL)			= "Total Plan Qty"	
	fg.MergeCol(PLAN_RESULT) = true
	fg.Cell(0, 0, PLAN_RESULT, 1, PLAN_RESULT)			= "A.Result Qty"	
	fg.MergeCol(PLAN_TRIBUTION) = true
	fg.Cell(0, 0, PLAN_TRIBUTION, 1, PLAN_TRIBUTION)	= "Tribution Back"
    fg.MergeCol(PERCENT) = true
	fg.Cell(0, 0, PERCENT, 1, PERCENT)	= "Percent"
    fg.MergeCol(REMARK) = true
	fg.Cell(0, 0, REMARK, 1, REMARK)	= "Remark"

	var date1 = dtContractTarget_Fr.value;
	var date2 = dtContractTarget_To.value;

	var year1 = date1.substring(0,4);
	var year2 = date2.substring(0,4);
	
	var month1 = Number(date1.substring(4,6));
	var month2 = Number(date2.substring(4,6));
	
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

	fg.ColAlignment(PLAN_WEIGHT)	= 7;
	fg.ColAlignment(PLAN_TOTAL)		= 7;
	fg.ColAlignment(PLAN_RESULT)	= 7;
	fg.ColAlignment(PLAN_TRIBUTION)	= 7;
    /*
	fg.ColFormat(JAN)		= "#,###,###,###,###,###,###,###,###.#################R";
	fg.ColFormat(FEB)		= "#,###,###,###,###,###,###,###,###.#################R";
	fg.ColFormat(MAR)		= "#,###,###,###,###,###,###,###,###.#################R";
	fg.ColFormat(APR)	= "#,###,###,###,###,###,###,###,###.#################R";
    fg.ColFormat(MAY)	= "#,###,###,###,###,###,###,###,###.#################R";
    fg.ColFormat(JUN)		= "#,###,###,###,###,###,###,###,###.#################R";
	fg.ColFormat(AUG)		= "#,###,###,###,###,###,###,###,###.#################R";
	fg.ColFormat(SEP)		= "#,###,###,###,###,###,###,###,###.#################R";
	fg.ColFormat(OCT)	= "#,###,###,###,###,###,###,###,###.#################R";
    fg.ColFormat(NOV)	= "#,###,###,###,###,###,###,###,###.#################R";
    fg.ColFormat(DEC)	= "#,###,###,###,###,###,###,###,###.#################R";

    fg.ColFormat(JAN2)		= "#,###,###,###,###,###,###,###,###.#################R";
	fg.ColFormat(FEB2)		= "#,###,###,###,###,###,###,###,###.#################R";
	fg.ColFormat(MAR2)		= "#,###,###,###,###,###,###,###,###.#################R";
	fg.ColFormat(APR2)	= "#,###,###,###,###,###,###,###,###.#################R";
    fg.ColFormat(MAY2)	= "#,###,###,###,###,###,###,###,###.#################R";
    fg.ColFormat(JUN2)		= "#,###,###,###,###,###,###,###,###.#################R";
	fg.ColFormat(AUG2)		= "#,###,###,###,###,###,###,###,###.#################R";
	fg.ColFormat(SEP2)		= "#,###,###,###,###,###,###,###,###.#################R";
	fg.ColFormat(OCT2)	= "#,###,###,###,###,###,###,###,###.#################R";
    fg.ColFormat(NOV2)	= "#,###,###,###,###,###,###,###,###.#################R";
    fg.ColFormat(DEC2)	= "#,###,###,###,###,###,###,###,###.#################R";
    /**/
//	for (col = JAN; col <= PK_DEC2 ; col+=3)
//	{
//		fg.ColAlignment(col)	= 7;
//		fg.ColFormat(col)		= "#,###,###,###,###,###,###,###,###.#################R";	
//	}

	fg.MergeCol(PLAN_TECPS_PROPLAN_ITEM_PK) = true
	fg.Cell(0, 0, PLAN_TECPS_PROPLAN_ITEM_PK, 1, PLAN_TECPS_PROPLAN_ITEM_PK)	= "TECPS_PROPLAN_ITEM_PK"

	fg.MergeCol(PLAN_TECPS_PROGPLANBASE_PK) = true
	fg.Cell(0, 0, PLAN_TECPS_PROGPLANBASE_PK, 1, PLAN_TECPS_PROGPLANBASE_PK)	= "TECPS_PROGPLANBASE_PK"

	fg.MergeCol(PLAN_TECPS_PROJECTSUMM_PK) = true
	fg.Cell(0, 0, PLAN_TECPS_PROJECTSUMM_PK, 1, PLAN_TECPS_PROJECTSUMM_PK)	= "TECPS_PROJECTSUMM_PK"

	fg.MergeCol(PLAN_LEVEL) = true
	fg.Cell(0, 0, PLAN_LEVEL, 1, PLAN_LEVEL)	= "LEVEL"

	fg.MergeCol(PLAN_PROPLAN_CD) = true
	fg.Cell(0, 0, PLAN_PROPLAN_CD, 1, PLAN_PROPLAN_CD)	= "CODE"

	fg.MergeCol(PLAN_CHANGESEQ) = true
	fg.Cell(0, 0, PLAN_CHANGESEQ, 1, PLAN_CHANGESEQ)	= "SEQ"
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
    /*
    fg.ColFormat(JAN)		= "#,###,###,###,###,###,###,###,###.##########";
	fg.ColFormat(FEB)		= "#,###,###,###,###,###,###,###,###.##########";
	fg.ColFormat(MAR)		= "#,###,###,###,###,###,###,###,###.##########";
	fg.ColFormat(APR)	= "#,###,###,###,###,###,###,###,###.##########";
    fg.ColFormat(MAY)	= "#,###,###,###,###,###,###,###,###.##########";
    fg.ColFormat(JUN)		= "#,###,###,###,###,###,###,###,###.##########";
	fg.ColFormat(AUG)		= "#,###,###,###,###,###,###,###,###.##########";
	fg.ColFormat(SEP)		= "#,###,###,###,###,###,###,###,###.##########";
	fg.ColFormat(OCT)	= "#,###,###,###,###,###,###,###,###.###################";
    fg.ColFormat(NOV)	= "#,###,###,###,###,###,###,###,###.##########";
    fg.ColFormat(DEC)	= "#,###,###,###,###,###,###,###,###.##########";

    fg.ColFormat(JAN2)		= "#,###,###,###,###,###,###,###,###.##########";
	fg.ColFormat(FEB2)		= "#,###,###,###,###,###,###,###,###.##########";
	fg.ColFormat(MAR2)		= "#,###,###,###,###,###,###,###,###.##########";
	fg.ColFormat(APR2)	= "#,###,###,###,###,###,###,###,###.##########";
    fg.ColFormat(MAY2)	= "#,###,###,###,###,###,###,###,###.##########";
    fg.ColFormat(JUN2)		= "#,###,###,###,###,###,###,###,###.##########";
	fg.ColFormat(AUG2)		= "#,###,###,###,###,###,###,###,###.##########";
	fg.ColFormat(SEP2)		= "#,###,###,###,###,###,###,###,###.##########";
	fg.ColFormat(OCT2)	= "#,###,###,###,###,###,###,###,###.###################";
    fg.ColFormat(NOV2)	= "#,###,###,###,###,###,###,###,###.##########";
    fg.ColFormat(DEC2)	= "#,###,###,###,###,###,###,###,###.##########";
    /**/
}
//==============================================================================================  
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
//==============================================================================================  
function OnDataReceive(obj)
{
    switch(obj.id)
	{
		    case 'dso_Date':
		            dso_subcontract.Call();
		    break;
		    case 'dso_subcontract':
		        dso_Period.Call();
		    break;
		    case 'dso_Period':
		        dso_grdPlan.Call('SELECT');
		    break;
		    case 'dso_grdPlan':
		        
		      SetColor();  
			  dso_status.Call();
		    break;
			case 'dso_status':
					if(txtCount.text !=0)
					{
								btSave1.SetEnable(false);
								btconfirm.SetEnable(false); 
					}
					else
					{
							btSave1.SetEnable(true);
							btconfirm.SetEnable(true); 
					}
                    MergeHeaderRegister();
			break;
			case 'dso_confirm':
					alert('Confirm is completed  !!');
					dso_grdPlan.Call('SELECT');
			break;
    }
}
//==============================================================================================  
function SetColor()
{
	for (row = 2; row < grdPlan.rows; row++ )
	{
		grdPlan.SetCellBgColor(row, PLAN_LARGE_DIV, row, PERCENT, 0xEDEDED);
		
	}
}
//==============================================================================================  
function AfterEdit()
{
	if (grdPlan.col > PLAN_UNIT)
	{
//		if (isNaN(grdPlan.GetGridData(grdPlan.row, grdPlan.col)))
//		{
//			grdPlan.SetGridText(grdPlan.row, grdPlan.col, 0);
//		}
//		else
//		{
//			if (grdPlan.GetGridData(grdPlan.row, grdPlan.col) < 0)
//			{
//				grdPlan.SetGridText(grdPlan.row, grdPlan.col, 0);
//			}
//		}

		// Weight Factory
		var total_plan = 0, percent = 0;
        total_plan.toFixed(17);
        percent.toFixed(17);
        
		for (row = 2; row < grdPlan.rows; row++)
		{
            var plan1 = grdPlan.GetGridData(row, PLAN_TOTAL).replace(/,/g,"");
			total_plan += Number(plan1);
		}
        
		if (total_plan == 0) return;

		percent = 100 / total_plan;	
		for (i = 2; i < grdPlan.rows; i++)
		{
			grdPlan.SetGridText(i, PLAN_WEIGHT, percent *  grdPlan.GetGridData(i, PLAN_TOTAL));
		}
        var qty_JAN = grdPlan.GetGridData(grdPlan.row, JAN).replace(/,/g,"");
        var qty_FEB = grdPlan.GetGridData(grdPlan.row, FEB).replace(/,/g,"");
        var qty_MAR = grdPlan.GetGridData(grdPlan.row, MAR).replace(/,/g,"");
        var qty_APR = grdPlan.GetGridData(grdPlan.row, APR).replace(/,/g,"");
        var qty_MAY = grdPlan.GetGridData(grdPlan.row, MAY).replace(/,/g,"");
        var qty_JUN = grdPlan.GetGridData(grdPlan.row, JUN).replace(/,/g,"");
        var qty_JUL = grdPlan.GetGridData(grdPlan.row, JUL).replace(/,/g,"");
        var qty_AUG = grdPlan.GetGridData(grdPlan.row, AUG).replace(/,/g,"");
        var qty_SEP = grdPlan.GetGridData(grdPlan.row, SEP).replace(/,/g,"");
        var qty_OCT = grdPlan.GetGridData(grdPlan.row, OCT).replace(/,/g,"");
        var qty_NOV = grdPlan.GetGridData(grdPlan.row, NOV).replace(/,/g,"");
        var qty_DEC = grdPlan.GetGridData(grdPlan.row, DEC).replace(/,/g,"");

        var qty_JAN2 = grdPlan.GetGridData(grdPlan.row, JAN2).replace(/,/g,"");
        var qty_FEB2 = grdPlan.GetGridData(grdPlan.row, FEB2).replace(/,/g,"");
        var qty_MAR2 = grdPlan.GetGridData(grdPlan.row, MAR2).replace(/,/g,"");
        var qty_APR2 = grdPlan.GetGridData(grdPlan.row, APR2).replace(/,/g,"");
        var qty_MAY2 = grdPlan.GetGridData(grdPlan.row, MAY2).replace(/,/g,"");
        var qty_JUN2 = grdPlan.GetGridData(grdPlan.row, JUN2).replace(/,/g,"");
        var qty_JUL2 = grdPlan.GetGridData(grdPlan.row, JUL2).replace(/,/g,"");
        var qty_AUG2 = grdPlan.GetGridData(grdPlan.row, AUG2).replace(/,/g,"");
        var qty_SEP2 = grdPlan.GetGridData(grdPlan.row, SEP2).replace(/,/g,"");
        var qty_OCT2 = grdPlan.GetGridData(grdPlan.row, OCT2).replace(/,/g,"");
        var qty_NOV2 = grdPlan.GetGridData(grdPlan.row, NOV2).replace(/,/g,"");
        var qty_DEC2 = grdPlan.GetGridData(grdPlan.row, DEC2).replace(/,/g,"");

        var result_qty = 0;
        result_qty.toFixed(17);
        result_qty = Number(qty_JAN) + Number(qty_FEB) + Number(qty_MAR) + Number(qty_APR) + Number(qty_MAY) + Number(qty_JUN) + Number(qty_JUL) + Number(qty_AUG) 
        + Number(qty_SEP) + Number(qty_OCT) + Number(qty_NOV) + Number(qty_DEC) + Number(qty_JAN2) + Number(qty_FEB2) + Number(qty_MAR2) + Number(qty_APR2) + 
        Number(qty_MAY2) + Number(qty_JUN2) + Number(qty_JUL2) + Number(qty_AUG2) + Number(qty_SEP2) + Number(qty_OCT2) + Number(qty_NOV2) + Number(qty_DEC2);
        grdPlan.SetGridText(grdPlan.row, PLAN_RESULT, result_qty);

        var _percent = 0;
        _percent.toFixed(17);
        if (grdPlan.GetGridData(grdPlan.row, PLAN_TOTAL) == 0) return;
        var _plan_result = grdPlan.GetGridData(grdPlan.row, PLAN_RESULT).replace(/,/g,"");
        var _plan_total = grdPlan.GetGridData(grdPlan.row, PLAN_TOTAL).replace(/,/g,"");
        _percent = Number(_plan_result) / Number(_plan_total) * 100;
		grdPlan.SetGridText(grdPlan.row, PERCENT, _percent);

        var _PLAN_TRIBUTION = 0;
        _PLAN_TRIBUTION.toFixed(17)
        _PLAN_TRIBUTION = Number(_plan_total) - result_qty;
        grdPlan.SetGridText(grdPlan.row, PLAN_TRIBUTION, _PLAN_TRIBUTION);
    }
}
//==============================================================================================  
function OnPeriod()
{
    dso_Period.Call();
}
//==============================================================================================  
function OnSearch()
{
            if(txtProjectPk.text != '')
            { 
                dso_grdPlan.Call('SELECT');
            }
            else
           {
                alert('Please select Project !!');
           }     
}
//==============================================================================================  
function OnChangeData()
{
	var ym1 = dtContractTarget_Fr.value.substring(0,6);
	var ym2 = dtContractTarget_To.value.substring(0,6);

	if (ym2 - ym1 < 0) return;

	MergeHeaderRegister();
}
//==============================================================================================  
function OnNew()
{
        if(txtProjectPk.text != '')
       { 
                grdPlan.AddRow();
        }
       else
       {
            alert('Please select Project !!');
       }   
}
//==============================================================================================  
function padLeft(n, d) 
{
	return Array(Math.max(0, d - (n + '').length + 1)).join(0) + n;
}
//==============================================================================================  
function OnSave()
{
        if (grdPlan.rows > 1)
		{
			for (row = 2; row < grdPlan.rows; row++)
			{
				grdPlan.SetGridText(row, PLAN_TECPS_PROJECTSUMM_PK, txtProjectPk.text);
				grdPlan.SetGridText(row, PLAN_TECPS_PROGPLANBASE_PK , lstSubcontract.GetData());
				var month1, date1, year1;
			    var month2, date2, year2;
				month1 = '1';
				month2 = '1';
				date1 = dtContractTarget_Fr.value;
				year1 = date1.substring(0,4);
				for (var col_mm_1 = JAN+1; col_mm_1 <= PK_DEC; col_mm_1+=3 )
				{
					month1 = padLeft(month1, 2);
					grdPlan.SetGridText(row, col_mm_1, year1 + ''+ month1);
					month1 = Number(month1);
					month1++;
				}
				date2 = dtContractTarget_To.value;
				year2 = date2.substring(0,4);
				for (col_mm_2 = JAN2+1; col_mm_2 <= PK_DEC2; col_mm_2+=3 )
				{
					month2 = padLeft(month2, 2);
					grdPlan.SetGridText(row, col_mm_2, year2 + ''+ month2);
					month2 = Number(month2);
					month2++;
				}
                
				grdPlan.SetRowStatus(row, 0x20);
			}
		    dso_grdPlan.Call();
		}			
}
//==============================================================================================  
function OnPrint()
{
        if(txtProjectPk.text != '')
       { 
                var url = System.RootURL + "/system/ReportEngine.aspx?export_pdf=Y&file=61/08/61080020.rpt&procedure=PM_RPT_61080020|PM_RPT_61080020_1&parameter="+txtProjectPk.text+","+lstSubcontract.value+"|"+txtProjectPk.text+","+lstSubcontract.value;   
                System.OpenTargetPage(url);  
        }
       else
       {
            alert('Please select Project !!');
       }   
}
function OnExcel()
{
        if(txtProjectPk.text != '')
       { 
                var path = System.RootURL + "/reports/61/08/61080020.aspx?Project_pk=" + txtProjectPk.text + '&Subcont_Pk=' + lstSubcontract.value + '&Month=' +  dtPrint_Mth.value;
                System.OpenTargetPage(path);  
        }
       else
       {
            alert('Please select Project !!');
       }   
}
function OnConfirm()
{
			if(grdPlan.rows>2)
			{
					if(confirm('Are you sure you want to confirm ?'))
					{
									dso_confirm.Call();
					}
			}
			else
			{
					alert('Not data to confirm !!');	
			}
}
function OnCheckPrintMonth()
{
	var _SubcontPeriod_Fr = dtContractTarget_Fr.value;
	var _SubcontPeriod_To = dtContractTarget_To.value;	
	var _SubMonth_Fr = Number(_SubcontPeriod_Fr.substring(0,6));
	var _SubMonth_To = Number(_SubcontPeriod_To.substring(0,6));
	var _PrintMonth = Number(dtPrint_Mth.value);
	if(_PrintMonth >= _SubMonth_Fr && _PrintMonth <= _SubMonth_To)
	{
		dso_status.Call();
		
	}
	else
	{
		alert('There is no data to confirm !!');	
		btconfirm.SetEnable(false); 
		btSave1.SetEnable(false);
	}
}
</script>
<body>
<gw:data id="dso_Date" onreceive="OnDataReceive(this)"> 
	<xml>                                                               
		<dso id="1" type="process" procedure="PM_SEL_61080020_DATE_PERIOD"  > 
			<input>
                <input  bind="txtProjectPk" />
            </input>
            <output>
                  <output bind="dtContractPeriod_Fr"/>
                <output bind="dtContractPeriod_To"/>
                <output bind="dtTarget_Fr"/>
                <output bind="dtTarget_To"/>  
            </output>
		</dso> 
	</xml>
</gw:data>
<gw:data id="dso_Period" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="PM_SEL_61080020_DATE_PERIOD_1" > 
                <input> 
                     <input  bind="txtProjectPk" />
                     <input  bind="lstSubcontract" />
                </input>
                <output>
                     <output  bind="dtContractTarget_Fr" />
                     <output  bind="dtContractTarget_To" />
                </output>
            </dso> 
        </xml> 
    </gw:data>	
 <gw:data id="dso_subcontract" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="list" procedure="PM_PRO_61080020_SUBCONTRACT" > 
            <input> 
                <input bind="txtProjectPk" />
            </input>
	       <output>
                  <output bind="lstSubcontract" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>    

<gw:data id="dso_grdPlan" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso id="2" type="grid" parameter="2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87" 
		function="PM_SEL_61080020" procedure="PM_UPD_61080020" > 
            <input bind="grdPlan">
                <input bind="txtProjectPk" />
				<input bind="lstSubcontract" />
				<input bind="dtContractTarget_Fr" />
				<input bind="dtContractTarget_To" />
            </input> 
            <output bind="grdPlan" /> 
        </dso> 
    </xml> 
</gw:data>

<gw:data id="dso_confirm" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="PM_PRO_61080020_CONFIRM" > 
                <input> 
                     <input  bind="txtProjectPk" />
                     <input  bind="lstSubcontract" />
                     <input  bind="dtPrint_Mth" />
                </input>
                <output>
                     <output  bind="txtReturnMessg" />
                </output>
            </dso> 
        </xml> 
    </gw:data>	
    
    <gw:data id="dso_status" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="PM_PRO_61080020" > 
                <input> 
                     <input  bind="txtProjectPk" />
                     <input  bind="lstSubcontract" />
                     <input  bind="dtPrint_Mth" />
                </input>
                <output>
                     <output  bind="txtCount" />
                </output>
            </dso> 
        </xml> 
    </gw:data>	
<table style="width:100%;height:100% " cellpadding="0" cellspacing="0" border="0">
	<tr valign=top style="width:100%;height:4% ">
		<td  id="right" style="width: 100%;">
		        <fieldset style="padding:0">
			                <table style="width: 100%" cellpadding="0" cellspacing="0" height="100%">
				<tr>
					<td style="width: 15%;" align="right"><a href="#" title="Click here to show Project" style="text-decoration:none" onClick="OnPopUp('Project')">Project&nbsp;</a></td> 
					<td style="width: 35%">
						<table style="width:100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="40%"><gw:textbox id="txtProject_Cd" readonly="true"  styles='width:100%' /></td>
								<td width="60%"><gw:textbox id="txtProject_Nm" readonly="true"  styles='width:100%' /></td>								
								<td><gw:imgbtn id="bve2" img="reset" alt="Reset"  onclick="txtProject_Cd.text='';txtProject_Nm.text='';txtProjectPk.text='';" /></td>
							</tr>
						</table>
					</td> 
					<td style="width: 15%" align="right">Subcontract&nbsp;</td>
					<td style="width: 35%">
						<table style="width:100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="40%" ><gw:list id="lstSubcontract" onchange="OnPeriod()" styles='width:100%' onchange="" /></td>
							</tr>
						</table>
					</td>
					<td ><gw:button id="btSearch"   img="search"    alt="Search"            onclick="OnSearch()"  /></td>
					<td style="display:none"><gw:button id="btNew"		img="new"		alt="New"				onclick="OnNew()"  /></td>
					<td ><gw:button id="btSave1"     img="save"      alt="Save"              onclick="OnSave()"  /></td>
                    <td ><gw:button id="btconfirm"     img="confirm"      alt="Confirm"              onclick="OnConfirm()"  /></td>
					<td ><gw:button id="btSave"     img="printer"      alt="Print"              onclick="OnPrint()"  /></td>
					<td  style="display:none"><gw:button id="btConfirm"  img="confirm"   alt="Confirm"           onclick=""  /></td>
					<td  style="display:"><gw:button id="btCancel"   img="excel"    alt="Print Report"    onclick="OnExcel()"  /></td>
				</tr>    
				<tr>
					<td align="right">Main Contract Period&nbsp;</td>
					<td>
						<table style="width:100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="" align="left"><gw:datebox id="dtContractPeriod_Fr" lang="1" /></td>
								<td width="" align="center">~</td>
								<td width="" align="right"><gw:datebox id="dtContractPeriod_To" lang="1" /></td>
								<td width="100%"></td>
							</tr>
						</table>
					</td>
					<td align="right">Subcontract Period&nbsp;</td>
					<td>
						<table style="width:100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="" align="left"><gw:datebox id="dtContractTarget_Fr" lang="1" onchange="OnChangeData()"/></td>
								<td width="" align="center">~</td>
								<td width="" align="right"><gw:datebox id="dtContractTarget_To" lang="1" onchange="OnChangeData()" /></td>
								<td width="100%"></td>
							</tr>
						</table>
					</td>
				</tr>
                <tr>
                    <td align="right">Target Period&nbsp;</td>
					<td>
						<table style="width:100%" cellpadding="0" cellspacing="0">
							<tr>
								<td width="" align="left"><gw:datebox id="dtTarget_Fr" lang="1" onchange=""/></td>
								<td width="" align="center">~</td>
								<td width="" align="right"><gw:datebox id="dtTarget_To" lang="1" onchange="" /></td>
								<td width="100%"></td>
							</tr>
						</table>
					</td>
                    <td align="right">Print Month</td>
                    <td width="" align=""><gw:datebox type="month" id="dtPrint_Mth" lang="1" onchange="OnCheckPrintMonth()"/></td>
                </tr>
			</table>
			    </fieldset>
		</td>
	</tr>
	<tr height="96%">
					<td colspan="12" style="width: 100%; height:">
						<gw:tab id="idTab">
							<table style="width: 100%; height:100%" name="Progress" id="Tab1"  cellpadding="0" cellspacing="0" border="0">
								<tr style="height:2%;display:none">
									<td >
										<fieldset style="width:100%;padding:0">
											<table  style="width: 100%" cellpadding="0" cellspacing="0" border="0">
												<tr>
													<td width="100%" align="left">
														<gw:radio id="rdoScheduleItem" value="Q" > 
															<span value="Q">Quantity</span> 
															<span value="P">Percentage</span> 
														</gw:radio >
													</td>
												</tr>
											</table>
										</fieldset>
								   </td>
								</tr>
								<tr style="height:98%">
									<td >
										<gw:grid id="grdPlan"  
										header="_PK|1|2|3|4|5|6|7|8|9|10|11|12|13|14|15|16|17|18|19|20|21|22|23|24|25|26|27|28|29|30|31|32|33|34|35|36|37|38|39|40|41|42|43|44|45|46|47|48|49|50|51|52|53|54|55|56|57|58|59|60|61|62|63|64|65|66|67|68|69|70|71|72|73|74|75|76|77|78|79|_80|_81|_82|_83|_84|_85|_86|_87|_88|_89|_90|_91|_92|_93|_94|_95|_96|_97|_98|_99|_100|_101|_102|_103|_104|_105|_106|_107|_108|_109|_110|_111"
										format  ="0|0|0|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
										aligns  ="0|0|0|0|0|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3"
										defaults="|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
									   editcol  ="0|0|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1" 
										widths="0|2000|2500|1000|1500|1500|1500|1500|1000|3000|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|2000|0|0|0|0|0"
										styles="width:100%; height:100%"
										debug="false"
										sorting="T" 
										onafteredit="AfterEdit()"/>
									</td>
								</tr>
							</table>
							
						</gw:tab>
					</td>
				</tr>
</table>
</body>
<gw:textbox id="txt_progplanbase_pk" readonly="true"  styles='display:none' />
<gw:textbox id="txtProjectPkS" readonly="true"  styles='width:100%;display:none' />
<gw:textbox id="txtProjectPk" readonly="true"  styles='width:100%;display:none' />
<gw:textbox id="txtStatus" readonly="true"  styles='width:100%;display:none' />
<gw:textbox id="txtProjectRefPk" readonly="true"  styles='width:100%;display:none' />
<gw:textbox id="txtReturnMessg" readonly="true"  styles='width:100%;display:none' />
<gw:textbox id="txtCount" readonly="true"  styles='width:100%;display:none' />


</html>
