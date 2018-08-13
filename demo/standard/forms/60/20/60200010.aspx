<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>


<script>
var G_CTRL = 0,
    G_PK = 1,
    G_ACC_CD = 2,
    G_ACC_NM = 3,
    G_ACC_NM_LOCAL = 4,
    G_ACC_NM_KOREAN = 5,
    //==TRANS
    G_O_T_DR1 = 6,
    G_O_T_DR2 = 7,
    G_O_T_DR3 = 8,
    G_O_T_DR4 = 9,
    G_O_T_DR5 = 10,
    G_O_T_DR6 = 11,
    G_O_T_DR7 = 12,
    G_O_T_DR8 = 13,
    G_O_T_DR9 = 14,
    G_O_T_DR10 = 15,
    G_O_T_DR11 = 16,
    G_O_T_DR12 = 17,

    G_O_T_CR1 = 18,
    G_O_T_CR2 = 19,
    G_O_T_CR3 = 20,
    G_O_T_CR4 = 21,
    G_O_T_CR5 = 22,
    G_O_T_CR6 = 23,
    G_O_T_CR7 = 24,
    G_O_T_CR8 = 25,
    G_O_T_CR9 = 26,
    G_O_T_CR10 = 27,
    G_O_T_CR11 = 28,
    G_O_T_CR12 = 29,
    //===BOOK=======
    G_O_B_DR1 = 30,
    G_O_B_DR2 = 31,
    G_O_B_DR3 = 32,
    G_O_B_DR4 = 33,
    G_O_B_DR5 = 34,
    G_O_B_DR6 = 35,
    G_O_B_DR7 = 36,
    G_O_B_DR8 = 37,
    G_O_B_DR9 = 38,
    G_O_B_DR10 = 39,
    G_O_B_DR11 = 40,
    G_O_B_DR12 = 41,

    G_O_B_CR1 = 42,
    G_O_B_CR2 = 43,
    G_O_B_CR3 = 44,
    G_O_B_CR4 = 45,
    G_O_B_CR5 = 46,
    G_O_B_CR6 = 47,
    G_O_B_CR7 = 48,
    G_O_B_CR8 = 49,
    G_O_B_CR9 = 50,
    G_O_B_CR10 = 51,
    G_O_B_CR11 = 52,
    G_O_B_CR12 = 53,
    //=====PERIOD BALANCE===============
    G_P_T_DR1 = 54,
    G_P_T_DR2 = 55,
    G_P_T_DR3 = 56,
    G_P_T_DR4 = 57,
    G_P_T_DR5 = 58,
    G_P_T_DR6 = 59,
    G_P_T_DR7 = 60,
    G_P_T_DR8 = 61,
    G_P_T_DR9 = 62,
    G_P_T_DR10 = 63,
    G_P_T_DR11 = 64,
    G_P_T_DR12 = 65,

    G_P_T_CR1 = 66,
    G_P_T_CR2 = 67,
    G_P_T_CR3 = 68,
    G_P_T_CR4 = 69,
    G_P_T_CR5 = 70,
    G_P_T_CR6 = 71,
    G_P_T_CR7 = 72,
    G_P_T_CR8 = 73,
    G_P_T_CR9 = 74,
    G_P_T_CR10 = 75,
    G_P_T_CR11 = 76,
    G_P_T_CR12 = 77,
    //===BOOK=======
    G_P_B_DR1 = 78,
    G_P_B_DR2 = 79,
    G_P_B_DR3 = 80,
    G_P_B_DR4 = 81,
    G_P_B_DR5 = 82,
    G_P_B_DR6 = 83,
    G_P_B_DR7 = 84,
    G_P_B_DR8 = 85,
    G_P_B_DR9 = 86,
    G_P_B_DR10 = 87,
    G_P_B_DR11 = 88,
    G_P_B_DR12 = 89,

    G_P_B_CR1 = 90,
    G_P_B_CR2 = 91,
    G_P_B_CR3 = 92,
    G_P_B_CR4 = 93,
    G_P_B_CR5 = 94,
    G_P_B_CR6 = 95,
    G_P_B_CR7 = 96,
    G_P_B_CR8 = 97,
    G_P_B_CR9 = 98,
    G_P_B_CR10 = 99,
    G_P_B_CR11 = 100,
    G_P_B_CR12 = 101,
    //=====ENDING BALANCE===============
    G_E_T_DR1 = 102,
    G_E_T_DR2 = 103,
    G_E_T_DR3 = 104,
    G_E_T_DR4 = 105,
    G_E_T_DR5 = 106,
    G_E_T_DR6 = 107,
    G_E_T_DR7 = 108,
    G_E_T_DR8 = 109,
    G_E_T_DR9 = 110,
    G_E_T_DR10 = 111,
    G_E_T_DR11 = 112,
    G_E_T_DR12 = 113,

    G_E_T_CR1 = 114,
    G_E_T_CR2 = 115,
    G_E_T_CR3 = 116,
    G_E_T_CR4 = 117,
    G_E_T_CR5 = 118,
    G_E_T_CR6 = 119,
    G_E_T_CR7 = 120,
    G_E_T_CR8 = 121,
    G_E_T_CR9 = 122,
    G_E_T_CR10 = 123,
    G_E_T_CR11 = 124,
    G_E_T_CR12 = 125,
    //===BOOK=======
    G_E_B_DR1 = 126,
    G_E_B_DR2 = 127,
    G_E_B_DR3 = 128,
    G_E_B_DR4 = 129,
    G_E_B_DR5 = 130,
    G_E_B_DR6 = 131,
    G_E_B_DR7 = 132,
    G_E_B_DR8 = 133,
    G_E_B_DR9 = 134,
    G_E_B_DR10 = 135,
    G_E_B_DR11 = 136,
    G_E_B_DR12 = 137,

    G_E_B_CR1 = 138,
    G_E_B_CR2 = 139,
    G_E_B_CR3 = 140,
    G_E_B_CR4 = 141,
    G_E_B_CR5 = 142,
    G_E_B_CR6 = 143,
    G_E_B_CR7 = 144,
    G_E_B_CR8 = 145,
    G_E_B_CR9 = 146,
    G_E_B_CR10 = 147,
    G_E_B_CR11 = 148,
    G_E_B_CR12 = 149,
    G_FONT = 150,
    G_COLOR = 151
    ;

var GS_TOTAL = 0,
    //==TRANS
    GS_O_T_DR1 = 1,
    GS_O_T_DR2 = 2,
    GS_O_T_DR3 = 3,
    GS_O_T_DR4 = 4,
    GS_O_T_DR5 = 5,
    GS_O_T_DR6 = 6,
    GS_O_T_DR7 = 7,
    GS_O_T_DR8 = 8,
    GS_O_T_DR9 = 9,
    GS_O_T_DR10 = 10,
    GS_O_T_DR11 = 11,
    GS_O_T_DR12 = 12,

    GS_O_T_CR1 = 13,
    GS_O_T_CR2 = 14,
    GS_O_T_CR3 = 15,
    GS_O_T_CR4 = 16,
    GS_O_T_CR5 = 17,
    GS_O_T_CR6 = 18,
    GS_O_T_CR7 = 19,
    GS_O_T_CR8 = 20,
    GS_O_T_CR9 = 21,
    GS_O_T_CR10 = 22,
    GS_O_T_CR11 = 23,
    GS_O_T_CR12 = 24,
    //===BOOK=======
    GS_O_B_DR1 = 25,
    GS_O_B_DR2 = 26,
    GS_O_B_DR3 = 27,
    GS_O_B_DR4 = 28,
    GS_O_B_DR5 = 29,
    GS_O_B_DR6 = 30,
    GS_O_B_DR7 = 31,
    GS_O_B_DR8 = 32,
    GS_O_B_DR9 = 33,
    GS_O_B_DR10 = 34,
    GS_O_B_DR11 = 35,
    GS_O_B_DR12 = 36,

    GS_O_B_CR1 = 37,
    GS_O_B_CR2 = 38,
    GS_O_B_CR3 = 39,
    GS_O_B_CR4 = 40,
    GS_O_B_CR5 = 41,
    GS_O_B_CR6 = 42,
    GS_O_B_CR7 = 43,
    GS_O_B_CR8 = 44,
    GS_O_B_CR9 = 45,
    GS_O_B_CR10 = 46,
    GS_O_B_CR11 = 47,
    GS_O_B_CR12 = 48
    //=====PERIOD BALANCE===============
    GS_P_T_DR1 = 49,
    GS_P_T_DR2 = 50,
    GS_P_T_DR3 = 51,
    GS_P_T_DR4 = 52,
    GS_P_T_DR5 = 53,
    GS_P_T_DR6 = 54,
    GS_P_T_DR7 = 55,
    GS_P_T_DR8 = 56,
    GS_P_T_DR9 = 57,
    GS_P_T_DR10 = 58,
    GS_P_T_DR11 = 59,
    GS_P_T_DR12 = 60,

    GS_P_T_CR1 = 61,
    GS_P_T_CR2 = 62,
    GS_P_T_CR3 = 63,
    GS_P_T_CR4 = 64,
    GS_P_T_CR5 = 65,
    GS_P_T_CR6 = 66,
    GS_P_T_CR7 = 67,
    GS_P_T_CR8 = 68,
    GS_P_T_CR9 = 69,
    GS_P_T_CR10 = 70,
    GS_P_T_CR11 = 71,
    GS_P_T_CR12 = 72,
    //===BOOK=======
    GS_P_B_DR1 = 73,
    GS_P_B_DR2 = 74,
    GS_P_B_DR3 = 75,
    GS_P_B_DR4 = 76,
    GS_P_B_DR5 = 77,
    GS_P_B_DR6 = 78,
    GS_P_B_DR7 = 79,
    GS_P_B_DR8 = 80,
    GS_P_B_DR9 = 81,
    GS_P_B_DR10 = 82,
    GS_P_B_DR11 = 83,
    GS_P_B_DR12 = 84,

    GS_P_B_CR1 = 85,
    GS_P_B_CR2 = 86,
    GS_P_B_CR3 = 87,
    GS_P_B_CR4 = 88,
    GS_P_B_CR5 = 89,
    GS_P_B_CR6 = 90,
    GS_P_B_CR7 = 91,
    GS_P_B_CR8 = 92,
    GS_P_B_CR9 = 93,
    GS_P_B_CR10 = 94,
    GS_P_B_CR11 = 95,
    GS_P_B_CR12 = 96,
    //=====ENDING BALANCE===============
    GS_E_T_DR1 = 97,
    GS_E_T_DR2 = 98,
    GS_E_T_DR3 = 99,
    GS_E_T_DR4 = 100,
    GS_E_T_DR5 = 101,
    GS_E_T_DR6 = 102,
    GS_E_T_DR7 = 103,
    GS_E_T_DR8 = 104,
    GS_E_T_DR9 = 105,
    GS_E_T_DR10 = 106,
    GS_E_T_DR11 = 107,
    GS_E_T_DR12 = 108,

    GS_E_T_CR1 = 109,
    GS_E_T_CR2 = 110,
    GS_E_T_CR3 = 111,
    GS_E_T_CR4 = 112,
    GS_E_T_CR5 = 113,
    GS_E_T_CR6 = 114,
    GS_E_T_CR7 = 115,
    GS_E_T_CR8 = 116,
    GS_E_T_CR9 = 117,
    GS_E_T_CR10 = 118,
    GS_E_T_CR11 = 119,
    GS_E_T_CR12 = 120,
    //===BOOK=======
    GS_E_B_DR1 = 121,
    GS_E_B_DR2 = 122,
    GS_E_B_DR3 = 123,
    GS_E_B_DR4 = 124,
    GS_E_B_DR5 = 125,
    GS_E_B_DR6 = 126,
    GS_E_B_DR7 = 127,
    GS_E_B_DR8 = 128,
    GS_E_B_DR9 = 129,
    GS_E_B_DR10 = 130,
    GS_E_B_DR11 = 131,
    GS_E_B_DR12 = 132,

    GS_E_B_CR1 = 133,
    GS_E_B_CR2 = 134,
    GS_E_B_CR3 = 135,
    GS_E_B_CR4 = 136,
    GS_E_B_CR5 = 137,
    GS_E_B_CR6 = 138,
    GS_E_B_CR7 = 139,
    GS_E_B_CR8 = 140,
    GS_E_B_CR9 = 141,
    GS_E_B_CR10 = 142,
    GS_E_B_CR11 = 143,
    GS_E_B_CR12 = 144
    ;

function BodyInit()
{
    System.Translate(document);
    var ls_company = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_type    = "DATA|G|General Ledger";
    var ls_lang    = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('HRAB0180','02','') FROM DUAL")%>";
    var ls_current = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
    var ls_level   = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0020','','') FROM DUAL")%>||";
    var ls_possum  = "DATA|Y|Posting|N|Summary||";
    var ls_date     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(SYSDATE, 'YYYYMMDD') FROM DUAL")%>";
    var ls_month    = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(ADD_MONTHS(SYSDATE,-1), 'YYYYMM') FROM DUAL")%>";
    var dataAmtType = "Data|1|Transaction|2|Book|3|Trans & Book"; 
    lstAmtType.SetDataText(dataAmtType);
    lstAmtType.value=2;
    var dataAccType  =  "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACBK020') FROM DUAL")%>";
    lstAccType.SetDataText(dataAccType); 
    var dataStatus = "Data|0|Approved|2|Confirmed"; 
    lstStatus.SetDataText(dataStatus); 
    lstStatus.SetDataText("2"); 
//    var dataBalance = "Data|1|Monthly|2|Period"; 
//    lstBalance.SetDataText(dataBalance); 
//    lstBalance.value=2;
    txt_date.SetDataText(ls_date);
    txtrate1.SetDataText('1');
    dtfrmonth.SetDataText(ls_month);
    lstCompany.SetDataText(ls_company);
    lstCompany.value = "<%=session("company_pk") %>";
    lstFinancial.SetDataText(ls_type);
    lstLang.SetDataText(ls_lang);
    lstCurrent.SetDataText(ls_current);
    var data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
    arr  = data.split("|");
	lstCurrent.SetDataText(arr[1]);
    lstLevel.SetDataText(ls_level);
    lstPostSum.SetDataText(ls_possum);
    OnDisplay();
    MergeHeader();
    MergeHeaderSum();
    txtrate.SetDataText("1");
    txtrate.SetEnable(false);
    txtac_nm.SetEnable(false);
    lstLevel.SetDataText("");
    lstPostSum.SetDataText("");
    idGrid.GetGridControl().FrozenCols = G_O_T_DR1;
    idGrid_sum.GetGridControl().FrozenCols = GS_O_T_DR1;
    txtac_cd.GetControl().focus();
            
}

function MergeHeaderSum()
{
	if (idGrid_sum.rows < 2)
	{
	    idGrid_sum.AddRow();
	}
    var fg=idGrid_sum.GetGridControl();
		fg.FixedRows  = 2
		fg.MergeCells = 5
		fg.MergeRow(0) = true
          
	    fg.MergeCol(GS_TOTAL) = true
		fg.Cell(0, 0, GS_TOTAL, 1, GS_TOTAL) = "Total"

        
        //=======Tran Dr=========
        fg.Cell(0, 0, GS_O_T_DR1, 0, GS_O_T_CR12) = "Beginning Balance (Trans)"  
        fg.Cell(0, 1, GS_O_T_DR1, 1) 	= "Dr1"
		fg.Cell(0, 1, GS_O_T_DR2, 1 ) 	= "Dr2"
        fg.Cell(0, 1, GS_O_T_DR3, 1 ) 	= "Dr3"
        fg.Cell(0, 1, GS_O_T_DR4, 1 ) 	= "Dr4"
        fg.Cell(0, 1, GS_O_T_DR5, 1 ) 	= "Dr5"
        fg.Cell(0, 1, GS_O_T_DR6, 1 ) 	= "Dr6"
        fg.Cell(0, 1, GS_O_T_DR7, 1 ) 	= "Dr7"
        fg.Cell(0, 1, GS_O_T_DR8, 1 ) 	= "Dr8"
        fg.Cell(0, 1, GS_O_T_DR9, 1 ) 	= "Dr9"
        fg.Cell(0, 1, GS_O_T_DR10, 1 ) 	= "Dr10"
        fg.Cell(0, 1, GS_O_T_DR11, 1 ) 	= "Dr11"
        fg.Cell(0, 1, GS_O_T_DR12, 1 ) 	= "Dr12"
        //========Trans Cr========
        fg.Cell(0, 1, GS_O_T_CR1, 1) 	= "Cr1"
		fg.Cell(0, 1, GS_O_T_CR2, 1 ) 	= "Cr2"
        fg.Cell(0, 1, GS_O_T_CR3, 1 ) 	= "Cr3"
        fg.Cell(0, 1, GS_O_T_CR4, 1 ) 	= "Cr4"
        fg.Cell(0, 1, GS_O_T_CR5, 1 ) 	= "Cr5"
        fg.Cell(0, 1, GS_O_T_CR6, 1 ) 	= "Cr6"
        fg.Cell(0, 1, GS_O_T_CR7, 1 ) 	= "Cr7"
        fg.Cell(0, 1, GS_O_T_CR8, 1 ) 	= "Cr8"
        fg.Cell(0, 1, GS_O_T_CR9, 1 ) 	= "Cr9"
        fg.Cell(0, 1, GS_O_T_CR10, 1 ) 	= "Cr10"
        fg.Cell(0, 1, GS_O_T_CR11, 1 ) 	= "Cr11"
        fg.Cell(0, 1, GS_O_T_CR12, 1 ) 	= "Cr12"
        //=======Book Dr=========
        fg.Cell(0, 0, GS_O_B_DR1, 0, GS_O_B_CR12) = "Beginning Balance (Book)"  
        fg.Cell(0, 1, GS_O_B_DR1, 1) 	= "Dr1"
		fg.Cell(0, 1, GS_O_B_DR2, 1 ) 	= "Dr2"
        fg.Cell(0, 1, GS_O_B_DR3, 1 ) 	= "Dr3"
        fg.Cell(0, 1, GS_O_B_DR4, 1 ) 	= "Dr4"
        fg.Cell(0, 1, GS_O_B_DR5, 1 ) 	= "Dr5"
        fg.Cell(0, 1, GS_O_B_DR6, 1 ) 	= "Dr6"
        fg.Cell(0, 1, GS_O_B_DR7, 1 ) 	= "Dr7"
        fg.Cell(0, 1, GS_O_B_DR8, 1 ) 	= "Dr8"
        fg.Cell(0, 1, GS_O_B_DR9, 1 ) 	= "Dr9"
        fg.Cell(0, 1, GS_O_B_DR10, 1 ) 	= "Dr10"
        fg.Cell(0, 1, GS_O_B_DR11, 1 ) 	= "Dr11"
        fg.Cell(0, 1, GS_O_B_DR12, 1 ) 	= "Dr12"
        //========Book Cr========
        fg.Cell(0, 1, GS_O_B_CR1, 1) 	= "Cr1"
		fg.Cell(0, 1, GS_O_B_CR2, 1 ) 	= "Cr2"
        fg.Cell(0, 1, GS_O_B_CR3, 1 ) 	= "Cr3"
        fg.Cell(0, 1, GS_O_B_CR4, 1 ) 	= "Cr4"
        fg.Cell(0, 1, GS_O_B_CR5, 1 ) 	= "Cr5"
        fg.Cell(0, 1, GS_O_B_CR6, 1 ) 	= "Cr6"
        fg.Cell(0, 1, GS_O_B_CR7, 1 ) 	= "Cr7"
        fg.Cell(0, 1, GS_O_B_CR8, 1 ) 	= "Cr8"
        fg.Cell(0, 1, GS_O_B_CR9, 1 ) 	= "Cr9"
        fg.Cell(0, 1, GS_O_B_CR10, 1 ) 	= "Cr10"
        fg.Cell(0, 1, GS_O_B_CR11, 1 ) 	= "Cr11"
        fg.Cell(0, 1, GS_O_B_CR12, 1 ) 	= "Cr12"
        //==============Period Balance=====================
        //=======Tran Dr=========
        fg.Cell(0, 0, GS_P_T_DR1, 0, GS_P_T_CR12) = "Period Balance (Trans)"  
        fg.Cell(0, 1, GS_P_T_DR1, 1) 	= "Dr1"
		fg.Cell(0, 1, GS_P_T_DR2, 1 ) 	= "Dr2"
        fg.Cell(0, 1, GS_P_T_DR3, 1 ) 	= "Dr3"
        fg.Cell(0, 1, GS_P_T_DR4, 1 ) 	= "Dr4"
        fg.Cell(0, 1, GS_P_T_DR5, 1 ) 	= "Dr5"
        fg.Cell(0, 1, GS_P_T_DR6, 1 ) 	= "Dr6"
        fg.Cell(0, 1, GS_P_T_DR7, 1 ) 	= "Dr7"
        fg.Cell(0, 1, GS_P_T_DR8, 1 ) 	= "Dr8"
        fg.Cell(0, 1, GS_P_T_DR9, 1 ) 	= "Dr9"
        fg.Cell(0, 1, GS_P_T_DR10, 1 ) 	= "Dr10"
        fg.Cell(0, 1, GS_P_T_DR11, 1 ) 	= "Dr11"
        fg.Cell(0, 1, GS_P_T_DR12, 1 ) 	= "Dr12"
        //========Trans Cr========
        fg.Cell(0, 1, GS_P_T_CR1, 1) 	= "Cr1"
		fg.Cell(0, 1, GS_P_T_CR2, 1 ) 	= "Cr2"
        fg.Cell(0, 1, GS_P_T_CR3, 1 ) 	= "Cr3"
        fg.Cell(0, 1, GS_P_T_CR4, 1 ) 	= "Cr4"
        fg.Cell(0, 1, GS_P_T_CR5, 1 ) 	= "Cr5"
        fg.Cell(0, 1, GS_P_T_CR6, 1 ) 	= "Cr6"
        fg.Cell(0, 1, GS_P_T_CR7, 1 ) 	= "Cr7"
        fg.Cell(0, 1, GS_P_T_CR8, 1 ) 	= "Cr8"
        fg.Cell(0, 1, GS_P_T_CR9, 1 ) 	= "Cr9"
        fg.Cell(0, 1, GS_P_T_CR10, 1 ) 	= "Cr10"
        fg.Cell(0, 1, GS_P_T_CR11, 1 ) 	= "Cr11"
        fg.Cell(0, 1, GS_P_T_CR12, 1 ) 	= "Cr12"
        //=======Book=================
        fg.Cell(0, 0, GS_P_B_DR1, 0, GS_P_B_CR12) = "Period Balance (Book)"  
        fg.Cell(0, 1, GS_P_B_DR1, 1) 	= "Dr1"
		fg.Cell(0, 1, GS_P_B_DR2, 1 ) 	= "Dr2"
        fg.Cell(0, 1, GS_P_B_DR3, 1 ) 	= "Dr3"
        fg.Cell(0, 1, GS_P_B_DR4, 1 ) 	= "Dr4"
        fg.Cell(0, 1, GS_P_B_DR5, 1 ) 	= "Dr5"
        fg.Cell(0, 1, GS_P_B_DR6, 1 ) 	= "Dr6"
        fg.Cell(0, 1, GS_P_B_DR7, 1 ) 	= "Dr7"
        fg.Cell(0, 1, GS_P_B_DR8, 1 ) 	= "Dr8"
        fg.Cell(0, 1, GS_P_B_DR9, 1 ) 	= "Dr9"
        fg.Cell(0, 1, GS_P_B_DR10, 1 ) 	= "Dr10"
        fg.Cell(0, 1, GS_P_B_DR11, 1 ) 	= "Dr11"
        fg.Cell(0, 1, GS_P_B_DR12, 1 ) 	= "Dr12"
        //========Book Cr========
        fg.Cell(0, 1, GS_P_B_CR1, 1) 	= "Cr1"
		fg.Cell(0, 1, GS_P_B_CR2, 1 ) 	= "Cr2"
        fg.Cell(0, 1, GS_P_B_CR3, 1 ) 	= "Cr3"
        fg.Cell(0, 1, GS_P_B_CR4, 1 ) 	= "Cr4"
        fg.Cell(0, 1, GS_P_B_CR5, 1 ) 	= "Cr5"
        fg.Cell(0, 1, GS_P_B_CR6, 1 ) 	= "Cr6"
        fg.Cell(0, 1, GS_P_B_CR7, 1 ) 	= "Cr7"
        fg.Cell(0, 1, GS_P_B_CR8, 1 ) 	= "Cr8"
        fg.Cell(0, 1, GS_P_B_CR9, 1 ) 	= "Cr9"
        fg.Cell(0, 1, GS_P_B_CR10, 1 ) 	= "Cr10"
        fg.Cell(0, 1, GS_P_B_CR11, 1 ) 	= "Cr11"
        fg.Cell(0, 1, GS_P_B_CR12, 1 ) 	= "Cr12"
        //==============Ending Balance=====================
        //=======Tran Dr=========
        fg.Cell(0, 0, GS_E_T_DR1, 0, GS_E_T_CR12) = "Ending Balance (Trans)"  
        fg.Cell(0, 1, GS_E_T_DR1, 1) 	= "Dr1"
		fg.Cell(0, 1, GS_E_T_DR2, 1 ) 	= "Dr2"
        fg.Cell(0, 1, GS_E_T_DR3, 1 ) 	= "Dr3"
        fg.Cell(0, 1, GS_E_T_DR4, 1 ) 	= "Dr4"
        fg.Cell(0, 1, GS_E_T_DR5, 1 ) 	= "Dr5"
        fg.Cell(0, 1, GS_E_T_DR6, 1 ) 	= "Dr6"
        fg.Cell(0, 1, GS_E_T_DR7, 1 ) 	= "Dr7"
        fg.Cell(0, 1, GS_E_T_DR8, 1 ) 	= "Dr8"
        fg.Cell(0, 1, GS_E_T_DR9, 1 ) 	= "Dr9"
        fg.Cell(0, 1, GS_E_T_DR10, 1 ) 	= "Dr10"
        fg.Cell(0, 1, GS_E_T_DR11, 1 ) 	= "Dr11"
        fg.Cell(0, 1, GS_E_T_DR12, 1 ) 	= "Dr12"
        //========Trans Cr========
        fg.Cell(0, 1, GS_E_T_CR1, 1) 	= "Cr1"
		fg.Cell(0, 1, GS_E_T_CR2, 1 ) 	= "Cr2"
        fg.Cell(0, 1, GS_E_T_CR3, 1 ) 	= "Cr3"
        fg.Cell(0, 1, GS_E_T_CR4, 1 ) 	= "Cr4"
        fg.Cell(0, 1, GS_E_T_CR5, 1 ) 	= "Cr5"
        fg.Cell(0, 1, GS_E_T_CR6, 1 ) 	= "Cr6"
        fg.Cell(0, 1, GS_E_T_CR7, 1 ) 	= "Cr7"
        fg.Cell(0, 1, GS_E_T_CR8, 1 ) 	= "Cr8"
        fg.Cell(0, 1, GS_E_T_CR9, 1 ) 	= "Cr9"
        fg.Cell(0, 1, GS_E_T_CR10, 1 ) 	= "Cr10"
        fg.Cell(0, 1, GS_E_T_CR11, 1 ) 	= "Cr11"
        fg.Cell(0, 1, GS_E_T_CR12, 1 ) 	= "Cr12"
        //=======Book=================
        fg.Cell(0, 0, GS_E_B_DR1, 0, GS_E_B_CR12) = "Ending Balance (Book)"  
        fg.Cell(0, 1, GS_E_B_DR1, 1) 	= "Dr1"
		fg.Cell(0, 1, GS_E_B_DR2, 1 ) 	= "Dr2"
        fg.Cell(0, 1, GS_E_B_DR3, 1 ) 	= "Dr3"
        fg.Cell(0, 1, GS_E_B_DR4, 1 ) 	= "Dr4"
        fg.Cell(0, 1, GS_E_B_DR5, 1 ) 	= "Dr5"
        fg.Cell(0, 1, GS_E_B_DR6, 1 ) 	= "Dr6"
        fg.Cell(0, 1, GS_E_B_DR7, 1 ) 	= "Dr7"
        fg.Cell(0, 1, GS_E_B_DR8, 1 ) 	= "Dr8"
        fg.Cell(0, 1, GS_E_B_DR9, 1 ) 	= "Dr9"
        fg.Cell(0, 1, GS_E_B_DR10, 1 ) 	= "Dr10"
        fg.Cell(0, 1, GS_E_B_DR11, 1 ) 	= "Dr11"
        fg.Cell(0, 1, GS_E_B_DR12, 1 ) 	= "Dr12"
        //========Book Cr========
        fg.Cell(0, 1, GS_E_B_CR1, 1) 	= "Cr1"
		fg.Cell(0, 1, GS_E_B_CR2, 1 ) 	= "Cr2"
        fg.Cell(0, 1, GS_E_B_CR3, 1 ) 	= "Cr3"
        fg.Cell(0, 1, GS_E_B_CR4, 1 ) 	= "Cr4"
        fg.Cell(0, 1, GS_E_B_CR5, 1 ) 	= "Cr5"
        fg.Cell(0, 1, GS_E_B_CR6, 1 ) 	= "Cr6"
        fg.Cell(0, 1, GS_E_B_CR7, 1 ) 	= "Cr7"
        fg.Cell(0, 1, GS_E_B_CR8, 1 ) 	= "Cr8"
        fg.Cell(0, 1, GS_E_B_CR9, 1 ) 	= "Cr9"
        fg.Cell(0, 1, GS_E_B_CR10, 1 ) 	= "Cr10"
        fg.Cell(0, 1, GS_E_B_CR11, 1 ) 	= "Cr11"
        fg.Cell(0, 1, GS_E_B_CR12, 1 ) 	= "Cr12"
       
       idGrid_sum.SetCellBgColor(1,GS_O_T_DR1,1,GS_O_T_DR12,Number(0X0000FF));
        idGrid_sum.SetCellBgColor(1,GS_O_T_CR1,1,GS_O_T_CR12,Number(0X7174E7));

        idGrid_sum.SetCellBgColor(1,GS_O_B_DR1,1,GS_O_B_DR12,Number(0X8352C2));
        idGrid_sum.SetCellBgColor(1,GS_O_B_CR1,1,GS_O_B_CR12,Number(0XAB60F6));

        idGrid_sum.SetCellBgColor(1,GS_P_T_DR1,1,GS_P_T_DR12,Number(0X17B9FB));
        idGrid_sum.SetCellBgColor(1,GS_P_T_CR1,1,GS_P_T_CR12,Number(0X00FFFF));

        idGrid_sum.SetCellBgColor(1,GS_P_B_DR1,1,GS_P_B_DR12,Number(0XC72D6C));//6C2DC7
        idGrid_sum.SetCellBgColor(1,GS_P_B_CR1,1,GS_P_B_CR12,Number(0XEF358E));//8E35EF

        idGrid_sum.SetCellBgColor(1,GS_E_T_DR1,1,GS_E_T_DR12,Number(0X2CA04A));
        idGrid_sum.SetCellBgColor(1,GS_E_T_CR1,1,GS_E_T_CR12,Number(0X64E957));

        idGrid_sum.SetCellBgColor(1,GS_E_B_DR1,1,GS_E_B_DR12,Number(0XC75425));
        idGrid_sum.SetCellBgColor(1,GS_E_B_CR1,1,GS_E_B_CR12,Number(0XFF6E30));
}

function MergeHeader()
{
	if (idGrid.rows < 2)
	{
	    idGrid.AddRow();
	}
    var fg=idGrid.GetGridControl();
		fg.FixedRows  = 2
		fg.MergeCells = 5
		fg.MergeRow(0) = true
          
	    fg.MergeCol(G_CTRL) = true
		fg.Cell(0, 0, G_CTRL, 1, G_CTRL) = "Ctrl"

        fg.MergeCol(G_ACC_CD) = true
		fg.Cell(0, 0, G_ACC_CD, 1, G_ACC_CD) = "Account Code"

        fg.MergeCol(G_ACC_NM) = true
		fg.Cell(0, 0, G_ACC_NM, 1, G_ACC_NM) = "Account Name"

        fg.MergeCol(G_ACC_NM_LOCAL) = true
		fg.Cell(0, 0, G_ACC_NM_LOCAL, 1, G_ACC_NM_LOCAL) = "Account Name"

        fg.MergeCol(G_ACC_NM_KOREAN) = true
		fg.Cell(0, 0, G_ACC_NM_KOREAN, 1, G_ACC_NM_KOREAN) = "Account Name"
        //=======Tran Dr=========
        fg.Cell(0, 0, G_O_T_DR1, 0, G_O_T_CR12) = "Beginning Balance (Trans)"  
        fg.Cell(0, 1, G_O_T_DR1, 1) 	= "Dr1"
		fg.Cell(0, 1, G_O_T_DR2, 1 ) 	= "Dr2"
        fg.Cell(0, 1, G_O_T_DR3, 1 ) 	= "Dr3"
        fg.Cell(0, 1, G_O_T_DR4, 1 ) 	= "Dr4"
        fg.Cell(0, 1, G_O_T_DR5, 1 ) 	= "Dr5"
        fg.Cell(0, 1, G_O_T_DR6, 1 ) 	= "Dr6"
        fg.Cell(0, 1, G_O_T_DR7, 1 ) 	= "Dr7"
        fg.Cell(0, 1, G_O_T_DR8, 1 ) 	= "Dr8"
        fg.Cell(0, 1, G_O_T_DR9, 1 ) 	= "Dr9"
        fg.Cell(0, 1, G_O_T_DR10, 1 ) 	= "Dr10"
        fg.Cell(0, 1, G_O_T_DR11, 1 ) 	= "Dr11"
        fg.Cell(0, 1, G_O_T_DR12, 1 ) 	= "Dr12"
        //========Trans Cr========
        fg.Cell(0, 1, G_O_T_CR1, 1) 	= "Cr1"
		fg.Cell(0, 1, G_O_T_CR2, 1 ) 	= "Cr2"
        fg.Cell(0, 1, G_O_T_CR3, 1 ) 	= "Cr3"
        fg.Cell(0, 1, G_O_T_CR4, 1 ) 	= "Cr4"
        fg.Cell(0, 1, G_O_T_CR5, 1 ) 	= "Cr5"
        fg.Cell(0, 1, G_O_T_CR6, 1 ) 	= "Cr6"
        fg.Cell(0, 1, G_O_T_CR7, 1 ) 	= "Cr7"
        fg.Cell(0, 1, G_O_T_CR8, 1 ) 	= "Cr8"
        fg.Cell(0, 1, G_O_T_CR9, 1 ) 	= "Cr9"
        fg.Cell(0, 1, G_O_T_CR10, 1 ) 	= "Cr10"
        fg.Cell(0, 1, G_O_T_CR11, 1 ) 	= "Cr11"
        fg.Cell(0, 1, G_O_T_CR12, 1 ) 	= "Cr12"
        //=======Book Dr=========
        fg.Cell(0, 0, G_O_B_DR1, 0, G_O_B_CR12) = "Beginning Balance (Book)"  
        fg.Cell(0, 1, G_O_B_DR1, 1) 	= "Dr1"
		fg.Cell(0, 1, G_O_B_DR2, 1 ) 	= "Dr2"
        fg.Cell(0, 1, G_O_B_DR3, 1 ) 	= "Dr3"
        fg.Cell(0, 1, G_O_B_DR4, 1 ) 	= "Dr4"
        fg.Cell(0, 1, G_O_B_DR5, 1 ) 	= "Dr5"
        fg.Cell(0, 1, G_O_B_DR6, 1 ) 	= "Dr6"
        fg.Cell(0, 1, G_O_B_DR7, 1 ) 	= "Dr7"
        fg.Cell(0, 1, G_O_B_DR8, 1 ) 	= "Dr8"
        fg.Cell(0, 1, G_O_B_DR9, 1 ) 	= "Dr9"
        fg.Cell(0, 1, G_O_B_DR10, 1 ) 	= "Dr10"
        fg.Cell(0, 1, G_O_B_DR11, 1 ) 	= "Dr11"
        fg.Cell(0, 1, G_O_B_DR12, 1 ) 	= "Dr12"
        //========Book Cr========
        fg.Cell(0, 1, G_O_B_CR1, 1) 	= "Cr1"
		fg.Cell(0, 1, G_O_B_CR2, 1 ) 	= "Cr2"
        fg.Cell(0, 1, G_O_B_CR3, 1 ) 	= "Cr3"
        fg.Cell(0, 1, G_O_B_CR4, 1 ) 	= "Cr4"
        fg.Cell(0, 1, G_O_B_CR5, 1 ) 	= "Cr5"
        fg.Cell(0, 1, G_O_B_CR6, 1 ) 	= "Cr6"
        fg.Cell(0, 1, G_O_B_CR7, 1 ) 	= "Cr7"
        fg.Cell(0, 1, G_O_B_CR8, 1 ) 	= "Cr8"
        fg.Cell(0, 1, G_O_B_CR9, 1 ) 	= "Cr9"
        fg.Cell(0, 1, G_O_B_CR10, 1 ) 	= "Cr10"
        fg.Cell(0, 1, G_O_B_CR11, 1 ) 	= "Cr11"
        fg.Cell(0, 1, G_O_B_CR12, 1 ) 	= "Cr12"
        //==============Period Balance=====================
        //=======Tran Dr=========
        fg.Cell(0, 0, G_P_T_DR1, 0, G_P_T_CR12) = "Period Balance (Trans)"  
        fg.Cell(0, 1, G_P_T_DR1, 1) 	= "Dr1"
		fg.Cell(0, 1, G_P_T_DR2, 1 ) 	= "Dr2"
        fg.Cell(0, 1, G_P_T_DR3, 1 ) 	= "Dr3"
        fg.Cell(0, 1, G_P_T_DR4, 1 ) 	= "Dr4"
        fg.Cell(0, 1, G_P_T_DR5, 1 ) 	= "Dr5"
        fg.Cell(0, 1, G_P_T_DR6, 1 ) 	= "Dr6"
        fg.Cell(0, 1, G_P_T_DR7, 1 ) 	= "Dr7"
        fg.Cell(0, 1, G_P_T_DR8, 1 ) 	= "Dr8"
        fg.Cell(0, 1, G_P_T_DR9, 1 ) 	= "Dr9"
        fg.Cell(0, 1, G_P_T_DR10, 1 ) 	= "Dr10"
        fg.Cell(0, 1, G_P_T_DR11, 1 ) 	= "Dr11"
        fg.Cell(0, 1, G_P_T_DR12, 1 ) 	= "Dr12"
        //========Trans Cr========
        fg.Cell(0, 1, G_P_T_CR1, 1) 	= "Cr1"
		fg.Cell(0, 1, G_P_T_CR2, 1 ) 	= "Cr2"
        fg.Cell(0, 1, G_P_T_CR3, 1 ) 	= "Cr3"
        fg.Cell(0, 1, G_P_T_CR4, 1 ) 	= "Cr4"
        fg.Cell(0, 1, G_P_T_CR5, 1 ) 	= "Cr5"
        fg.Cell(0, 1, G_P_T_CR6, 1 ) 	= "Cr6"
        fg.Cell(0, 1, G_P_T_CR7, 1 ) 	= "Cr7"
        fg.Cell(0, 1, G_P_T_CR8, 1 ) 	= "Cr8"
        fg.Cell(0, 1, G_P_T_CR9, 1 ) 	= "Cr9"
        fg.Cell(0, 1, G_P_T_CR10, 1 ) 	= "Cr10"
        fg.Cell(0, 1, G_P_T_CR11, 1 ) 	= "Cr11"
        fg.Cell(0, 1, G_P_T_CR12, 1 ) 	= "Cr12"
        //=======Book=================
        fg.Cell(0, 0, G_P_B_DR1, 0, G_P_B_CR12) = "Period Balance (Book)"  
        fg.Cell(0, 1, G_P_B_DR1, 1) 	= "Dr1"
		fg.Cell(0, 1, G_P_B_DR2, 1 ) 	= "Dr2"
        fg.Cell(0, 1, G_P_B_DR3, 1 ) 	= "Dr3"
        fg.Cell(0, 1, G_P_B_DR4, 1 ) 	= "Dr4"
        fg.Cell(0, 1, G_P_B_DR5, 1 ) 	= "Dr5"
        fg.Cell(0, 1, G_P_B_DR6, 1 ) 	= "Dr6"
        fg.Cell(0, 1, G_P_B_DR7, 1 ) 	= "Dr7"
        fg.Cell(0, 1, G_P_B_DR8, 1 ) 	= "Dr8"
        fg.Cell(0, 1, G_P_B_DR9, 1 ) 	= "Dr9"
        fg.Cell(0, 1, G_P_B_DR10, 1 ) 	= "Dr10"
        fg.Cell(0, 1, G_P_B_DR11, 1 ) 	= "Dr11"
        fg.Cell(0, 1, G_P_B_DR12, 1 ) 	= "Dr12"
        //========Book Cr========
        fg.Cell(0, 1, G_P_B_CR1, 1) 	= "Cr1"
		fg.Cell(0, 1, G_P_B_CR2, 1 ) 	= "Cr2"
        fg.Cell(0, 1, G_P_B_CR3, 1 ) 	= "Cr3"
        fg.Cell(0, 1, G_P_B_CR4, 1 ) 	= "Cr4"
        fg.Cell(0, 1, G_P_B_CR5, 1 ) 	= "Cr5"
        fg.Cell(0, 1, G_P_B_CR6, 1 ) 	= "Cr6"
        fg.Cell(0, 1, G_P_B_CR7, 1 ) 	= "Cr7"
        fg.Cell(0, 1, G_P_B_CR8, 1 ) 	= "Cr8"
        fg.Cell(0, 1, G_P_B_CR9, 1 ) 	= "Cr9"
        fg.Cell(0, 1, G_P_B_CR10, 1 ) 	= "Cr10"
        fg.Cell(0, 1, G_P_B_CR11, 1 ) 	= "Cr11"
        fg.Cell(0, 1, G_P_B_CR12, 1 ) 	= "Cr12"
        //==============Ending Balance=====================
        //=======Tran Dr=========
        fg.Cell(0, 0, G_E_T_DR1, 0, G_E_T_CR12) = "Ending Balance (Trans)"  
        fg.Cell(0, 1, G_E_T_DR1, 1) 	= "Dr1"
		fg.Cell(0, 1, G_E_T_DR2, 1 ) 	= "Dr2"
        fg.Cell(0, 1, G_E_T_DR3, 1 ) 	= "Dr3"
        fg.Cell(0, 1, G_E_T_DR4, 1 ) 	= "Dr4"
        fg.Cell(0, 1, G_E_T_DR5, 1 ) 	= "Dr5"
        fg.Cell(0, 1, G_E_T_DR6, 1 ) 	= "Dr6"
        fg.Cell(0, 1, G_E_T_DR7, 1 ) 	= "Dr7"
        fg.Cell(0, 1, G_E_T_DR8, 1 ) 	= "Dr8"
        fg.Cell(0, 1, G_E_T_DR9, 1 ) 	= "Dr9"
        fg.Cell(0, 1, G_E_T_DR10, 1 ) 	= "Dr10"
        fg.Cell(0, 1, G_E_T_DR11, 1 ) 	= "Dr11"
        fg.Cell(0, 1, G_E_T_DR12, 1 ) 	= "Dr12"
        //========Trans Cr========
        fg.Cell(0, 1, G_E_T_CR1, 1) 	= "Cr1"
		fg.Cell(0, 1, G_E_T_CR2, 1 ) 	= "Cr2"
        fg.Cell(0, 1, G_E_T_CR3, 1 ) 	= "Cr3"
        fg.Cell(0, 1, G_E_T_CR4, 1 ) 	= "Cr4"
        fg.Cell(0, 1, G_E_T_CR5, 1 ) 	= "Cr5"
        fg.Cell(0, 1, G_E_T_CR6, 1 ) 	= "Cr6"
        fg.Cell(0, 1, G_E_T_CR7, 1 ) 	= "Cr7"
        fg.Cell(0, 1, G_E_T_CR8, 1 ) 	= "Cr8"
        fg.Cell(0, 1, G_E_T_CR9, 1 ) 	= "Cr9"
        fg.Cell(0, 1, G_E_T_CR10, 1 ) 	= "Cr10"
        fg.Cell(0, 1, G_E_T_CR11, 1 ) 	= "Cr11"
        fg.Cell(0, 1, G_E_T_CR12, 1 ) 	= "Cr12"
        //=======Book=================
        fg.Cell(0, 0, G_E_B_DR1, 0, G_E_B_CR12) = "Ending Balance (Book)"  
        fg.Cell(0, 1, G_E_B_DR1, 1) 	= "Dr1"
		fg.Cell(0, 1, G_E_B_DR2, 1 ) 	= "Dr2"
        fg.Cell(0, 1, G_E_B_DR3, 1 ) 	= "Dr3"
        fg.Cell(0, 1, G_E_B_DR4, 1 ) 	= "Dr4"
        fg.Cell(0, 1, G_E_B_DR5, 1 ) 	= "Dr5"
        fg.Cell(0, 1, G_E_B_DR6, 1 ) 	= "Dr6"
        fg.Cell(0, 1, G_E_B_DR7, 1 ) 	= "Dr7"
        fg.Cell(0, 1, G_E_B_DR8, 1 ) 	= "Dr8"
        fg.Cell(0, 1, G_E_B_DR9, 1 ) 	= "Dr9"
        fg.Cell(0, 1, G_E_B_DR10, 1 ) 	= "Dr10"
        fg.Cell(0, 1, G_E_B_DR11, 1 ) 	= "Dr11"
        fg.Cell(0, 1, G_E_B_DR12, 1 ) 	= "Dr12"
        //========Book Cr========
        fg.Cell(0, 1, G_E_B_CR1, 1) 	= "Cr1"
		fg.Cell(0, 1, G_E_B_CR2, 1 ) 	= "Cr2"
        fg.Cell(0, 1, G_E_B_CR3, 1 ) 	= "Cr3"
        fg.Cell(0, 1, G_E_B_CR4, 1 ) 	= "Cr4"
        fg.Cell(0, 1, G_E_B_CR5, 1 ) 	= "Cr5"
        fg.Cell(0, 1, G_E_B_CR6, 1 ) 	= "Cr6"
        fg.Cell(0, 1, G_E_B_CR7, 1 ) 	= "Cr7"
        fg.Cell(0, 1, G_E_B_CR8, 1 ) 	= "Cr8"
        fg.Cell(0, 1, G_E_B_CR9, 1 ) 	= "Cr9"
        fg.Cell(0, 1, G_E_B_CR10, 1 ) 	= "Cr10"
        fg.Cell(0, 1, G_E_B_CR11, 1 ) 	= "Cr11"
        fg.Cell(0, 1, G_E_B_CR12, 1 ) 	= "Cr12"
        idGrid.SetCellBgColor(1,G_O_T_DR1,1,G_O_T_DR12,Number(0X0000FF));
        idGrid.SetCellBgColor(1,G_O_T_CR1,1,G_O_T_CR12,Number(0X7174E7));

        idGrid.SetCellBgColor(1,G_O_B_DR1,1,G_O_B_DR12,Number(0X8352C2));
        idGrid.SetCellBgColor(1,G_O_B_CR1,1,G_O_B_CR12,Number(0XAB60F6));

        idGrid.SetCellBgColor(1,G_P_T_DR1,1,G_P_T_DR12,Number(0X17B9FB));
        idGrid.SetCellBgColor(1,G_P_T_CR1,1,G_P_T_CR12,Number(0X00FFFF));

        idGrid.SetCellBgColor(1,G_P_B_DR1,1,G_P_B_DR12,Number(0XC72D6C));//6C2DC7
        idGrid.SetCellBgColor(1,G_P_B_CR1,1,G_P_B_CR12,Number(0XEF358E));//8E35EF

        idGrid.SetCellBgColor(1,G_E_T_DR1,1,G_E_T_DR12,Number(0X2CA04A));
        idGrid.SetCellBgColor(1,G_E_T_CR1,1,G_E_T_CR12,Number(0X64E957));

        idGrid.SetCellBgColor(1,G_E_B_DR1,1,G_E_B_DR12,Number(0XC75425));
        idGrid.SetCellBgColor(1,G_E_B_CR1,1,G_E_B_CR12,Number(0XFF6E30));
}

function  OnDisplayLang()
{
    if(lstLang.value=='ENG')
    {
        idGrid.GetGridControl().ColHidden(G_ACC_NM) = false;
        idGrid.GetGridControl().ColHidden(G_ACC_NM_LOCAL) = true;
        idGrid.GetGridControl().ColHidden(G_ACC_NM_KOREAN) = true;
    }
    else if(lstLang.value=='VIE')
    {
        idGrid.GetGridControl().ColHidden(G_ACC_NM) = true;
        idGrid.GetGridControl().ColHidden(G_ACC_NM_LOCAL) = false;
        idGrid.GetGridControl().ColHidden(G_ACC_NM_KOREAN) = true;
    }
    else
    {
        idGrid.GetGridControl().ColHidden(G_ACC_NM) = true;
        idGrid.GetGridControl().ColHidden(G_ACC_NM_LOCAL) = true;
        idGrid.GetGridControl().ColHidden(G_ACC_NM_KOREAN) = false;
    }
}

function onReport()
{
        var url = '/standard/reports/gf/sa/gfsa00010.aspx?company_pk='+ lstCompany.value + '&dtfrom=' + dtfrmonth.value;
	    url =   url + '&status='+ lstStatus.value + '&ccy=' + lstCurrent.value + '&rate=';
	    url =   url + txtrate1.text + '&level=' + lstLevel.value + '&post=' + lstPostSum.value + '&accd=' + txtac_cd.text;
	    url =   url + '&language=' + lstLang.value + '&acctype=' + lstAccType.value;
	    System.OpenTargetPage( System.RootURL+url , "newform" );
}

function OnDisplay()
{
    OnDisplayLang();
    if(lstAmtType.value=='1')//trans
    {
        //====================Trans==============================
        idGrid.GetGridControl().ColHidden(G_O_T_DR1) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR2) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR3) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR4) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR5) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR6) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR7) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR8) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR9) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR10) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR11) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR12) = false;

        idGrid.GetGridControl().ColHidden(G_O_T_CR1) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR2) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR3) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR4) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR5) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR6) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR7) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR8) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR9) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR10) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR11) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR12) = false;
        //====================Book==============================
        idGrid.GetGridControl().ColHidden(G_O_B_DR1) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_DR2) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_DR3) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_DR4) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_DR5) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_DR6) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_DR7) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_DR8) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_DR9) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_DR10) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_DR11) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_DR12) = true;

        idGrid.GetGridControl().ColHidden(G_O_B_CR1) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_CR2) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_CR3) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_CR4) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_CR5) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_CR6) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_CR7) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_CR8) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_CR9) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_CR10) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_CR11) = true;
        idGrid.GetGridControl().ColHidden(G_O_B_CR12) = true;
        //====================Trans==============================
        idGrid.GetGridControl().ColHidden(G_P_T_DR1) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR2) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR3) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR4) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR5) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR6) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR7) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR8) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR9) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR10) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR11) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR12) = false;

        idGrid.GetGridControl().ColHidden(G_P_T_CR1) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR2) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR3) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR4) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR5) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR6) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR7) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR8) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR9) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR10) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR11) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR12) = false;
        //====================Book==============================
        idGrid.GetGridControl().ColHidden(G_P_B_DR1) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_DR2) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_DR3) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_DR4) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_DR5) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_DR6) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_DR7) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_DR8) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_DR9) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_DR10) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_DR11) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_DR12) = true;

        idGrid.GetGridControl().ColHidden(G_P_B_CR1) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_CR2) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_CR3) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_CR4) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_CR5) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_CR6) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_CR7) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_CR8) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_CR9) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_CR10) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_CR11) = true;
        idGrid.GetGridControl().ColHidden(G_P_B_CR12) = true;
        //====================Trans==============================
        idGrid.GetGridControl().ColHidden(G_E_T_DR1) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR2) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR3) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR4) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR5) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR6) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR7) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR8) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR9) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR10) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR11) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR12) = false;

        idGrid.GetGridControl().ColHidden(G_E_T_CR1) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR2) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR3) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR4) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR5) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR6) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR7) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR8) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR9) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR10) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR11) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR12) = false;
        //====================Book==============================
        idGrid.GetGridControl().ColHidden(G_E_B_DR1) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_DR2) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_DR3) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_DR4) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_DR5) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_DR6) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_DR7) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_DR8) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_DR9) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_DR10) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_DR11) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_DR12) = true;

        idGrid.GetGridControl().ColHidden(G_E_B_CR1) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_CR2) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_CR3) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_CR4) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_CR5) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_CR6) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_CR7) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_CR8) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_CR9) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_CR10) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_CR11) = true;
        idGrid.GetGridControl().ColHidden(G_E_B_CR12) = true;

        //================Grid Sum================================
        //====================Trans==============================
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR12) = false;

        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR12) = false;
        //====================Book==============================
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR1) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR2) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR3) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR4) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR5) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR6) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR7) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR8) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR9) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR10) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR11) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR12) = true;

        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR1) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR2) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR3) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR4) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR5) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR6) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR7) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR8) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR9) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR10) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR11) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR12) = true;
        //====================Trans==============================
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR12) = false;

        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR12) = false;
        //====================Book==============================
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR1) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR2) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR3) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR4) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR5) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR6) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR7) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR8) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR9) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR10) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR11) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR12) = true;

        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR1) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR2) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR3) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR4) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR5) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR6) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR7) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR8) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR9) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR10) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR11) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR12) = true;
        //====================Trans==============================
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR12) = false;

        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR12) = false;
        //====================Book==============================
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR1) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR2) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR3) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR4) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR5) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR6) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR7) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR8) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR9) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR10) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR11) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR12) = true;

        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR1) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR2) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR3) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR4) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR5) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR6) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR7) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR8) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR9) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR10) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR11) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR12) = true;
    }
    else if(lstAmtType.value=='2')//book
    {
        //====================Trans==============================
        idGrid.GetGridControl().ColHidden(G_O_T_DR1) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_DR2) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_DR3) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_DR4) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_DR5) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_DR6) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_DR7) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_DR8) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_DR9) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_DR10) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_DR11) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_DR12) = true;

        idGrid.GetGridControl().ColHidden(G_O_T_CR1) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_CR2) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_CR3) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_CR4) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_CR5) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_CR6) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_CR7) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_CR8) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_CR9) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_CR10) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_CR11) = true;
        idGrid.GetGridControl().ColHidden(G_O_T_CR12) = true;
        //====================Book==============================
        idGrid.GetGridControl().ColHidden(G_O_B_DR1) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR2) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR3) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR4) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR5) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR6) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR7) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR8) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR9) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR10) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR11) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR12) = false;

        idGrid.GetGridControl().ColHidden(G_O_B_CR1) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR2) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR3) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR4) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR5) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR6) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR7) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR8) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR9) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR10) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR11) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR12) = false;
        //====================Trans==============================
        idGrid.GetGridControl().ColHidden(G_P_T_DR1) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_DR2) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_DR3) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_DR4) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_DR5) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_DR6) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_DR7) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_DR8) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_DR9) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_DR10) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_DR11) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_DR12) = true;

        idGrid.GetGridControl().ColHidden(G_P_T_CR1) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_CR2) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_CR3) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_CR4) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_CR5) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_CR6) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_CR7) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_CR8) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_CR9) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_CR10) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_CR11) = true;
        idGrid.GetGridControl().ColHidden(G_P_T_CR12) = true;
        //====================Book==============================
        idGrid.GetGridControl().ColHidden(G_P_B_DR1) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR2) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR3) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR4) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR5) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR6) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR7) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR8) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR9) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR10) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR11) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR12) = false;

        idGrid.GetGridControl().ColHidden(G_P_B_CR1) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR2) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR3) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR4) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR5) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR6) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR7) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR8) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR9) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR10) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR11) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR12) = false;
        //====================Trans==============================
        idGrid.GetGridControl().ColHidden(G_E_T_DR1) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_DR2) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_DR3) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_DR4) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_DR5) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_DR6) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_DR7) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_DR8) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_DR9) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_DR10) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_DR11) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_DR12) = true;

        idGrid.GetGridControl().ColHidden(G_E_T_CR1) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_CR2) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_CR3) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_CR4) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_CR5) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_CR6) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_CR7) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_CR8) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_CR9) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_CR10) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_CR11) = true;
        idGrid.GetGridControl().ColHidden(G_E_T_CR12) = true;
        //====================Book==============================
        idGrid.GetGridControl().ColHidden(G_E_B_DR1) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR2) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR3) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR4) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR5) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR6) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR7) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR8) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR9) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR10) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR11) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR12) = false;

        idGrid.GetGridControl().ColHidden(G_E_B_CR1) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR2) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR3) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR4) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR5) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR6) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR7) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR8) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR9) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR10) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR11) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR12) = false;

        //===================Grid Sum==========================
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR1) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR2) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR3) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR4) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR5) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR6) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR7) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR8) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR9) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR10) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR11) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR12) = true;

        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR1) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR2) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR3) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR4) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR5) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR6) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR7) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR8) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR9) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR10) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR11) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR12) = true;
        //====================Book==============================
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR12) = false;

        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR12) = false;
        //====================Trans==============================
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR1) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR2) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR3) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR4) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR5) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR6) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR7) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR8) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR9) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR10) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR11) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR12) = true;

        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR1) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR2) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR3) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR4) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR5) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR6) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR7) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR8) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR9) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR10) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR11) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR12) = true;
        //====================Book==============================
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR12) = false;

        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR12) = false;
        //====================Trans==============================
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR1) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR2) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR3) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR4) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR5) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR6) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR7) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR8) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR9) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR10) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR11) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR12) = true;

        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR1) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR2) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR3) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR4) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR5) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR6) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR7) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR8) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR9) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR10) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR11) = true;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR12) = true;
        //====================Book==============================
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR12) = false;

        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR12) = false;
    }
    else
    {
        //====================Trans==============================
        idGrid.GetGridControl().ColHidden(G_O_T_DR1) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR2) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR3) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR4) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR5) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR6) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR7) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR8) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR9) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR10) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR11) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_DR12) = false;

        idGrid.GetGridControl().ColHidden(G_O_T_CR1) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR2) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR3) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR4) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR5) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR6) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR7) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR8) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR9) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR10) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR11) = false;
        idGrid.GetGridControl().ColHidden(G_O_T_CR12) = false;
        //====================Book==============================
        idGrid.GetGridControl().ColHidden(G_O_B_DR1) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR2) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR3) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR4) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR5) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR6) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR7) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR8) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR9) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR10) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR11) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_DR12) = false;

        idGrid.GetGridControl().ColHidden(G_O_B_CR1) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR2) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR3) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR4) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR5) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR6) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR7) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR8) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR9) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR10) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR11) = false;
        idGrid.GetGridControl().ColHidden(G_O_B_CR12) = false;
        //====================Trans==============================
        idGrid.GetGridControl().ColHidden(G_P_T_DR1) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR2) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR3) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR4) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR5) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR6) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR7) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR8) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR9) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR10) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR11) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_DR12) = false;

        idGrid.GetGridControl().ColHidden(G_P_T_CR1) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR2) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR3) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR4) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR5) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR6) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR7) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR8) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR9) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR10) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR11) = false;
        idGrid.GetGridControl().ColHidden(G_P_T_CR12) = false;
        //====================Book==============================
        idGrid.GetGridControl().ColHidden(G_P_B_DR1) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR2) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR3) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR4) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR5) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR6) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR7) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR8) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR9) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR10) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR11) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_DR12) = false;

        idGrid.GetGridControl().ColHidden(G_P_B_CR1) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR2) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR3) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR4) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR5) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR6) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR7) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR8) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR9) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR10) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR11) = false;
        idGrid.GetGridControl().ColHidden(G_P_B_CR12) = false;
        //====================Trans==============================
        idGrid.GetGridControl().ColHidden(G_E_T_DR1) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR2) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR3) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR4) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR5) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR6) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR7) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR8) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR9) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR10) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR11) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_DR12) = false;

        idGrid.GetGridControl().ColHidden(G_E_T_CR1) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR2) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR3) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR4) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR5) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR6) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR7) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR8) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR9) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR10) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR11) = false;
        idGrid.GetGridControl().ColHidden(G_E_T_CR12) = false;
        //====================Book==============================
        idGrid.GetGridControl().ColHidden(G_E_B_DR1) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR2) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR3) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR4) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR5) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR6) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR7) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR8) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR9) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR10) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR11) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_DR12) = false;

        idGrid.GetGridControl().ColHidden(G_E_B_CR1) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR2) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR3) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR4) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR5) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR6) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR7) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR8) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR9) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR10) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR11) = false;
        idGrid.GetGridControl().ColHidden(G_E_B_CR12) = false;

        //======================Grid Sum=======================
        //====================Trans==============================
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_DR12) = false;

        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_T_CR12) = false;
        //====================Book==============================
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_DR12) = false;

        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_O_B_CR12) = false;
        //====================Trans==============================
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_DR12) = false;

        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_T_CR12) = false;
        //====================Book==============================
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_DR12) = false;

        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_P_B_CR12) = false;
        //====================Trans==============================
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_DR12) = false;

        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_T_CR12) = false;
        //====================Book==============================
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_DR12) = false;

        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR1) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR2) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR3) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR4) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR5) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR6) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR7) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR8) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR9) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR10) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR11) = false;
        idGrid_sum.GetGridControl().ColHidden(GS_E_B_CR12) = false;
    }
}

function onSearch()
{
	OnDisplay();
    MergeHeader();
    MergeHeaderSum();
    dso_insert.Call('SELECT');
}

function OnChangeCurrent()
{
    dso_get_rate.Call();
}

function OnDataReceive(obj)
{
    switch(obj.id)
    {
        case 'dso_insert':
            MergeHeader();
            var ctrl = idGrid.GetGridControl();
            for (i = 2; i < ctrl.Rows; i++)
	        {
	    
	            if(idGrid.GetGridData(i,G_FONT)== "B")
                {
	                ctrl.Cell(14, i, G_CTRL, i, G_COLOR) = false;
	                idGrid.SetCellBold(i, G_CTRL, i, G_COLOR, true);
                }
                else if (idGrid.GetGridData(i,19)== "I")
                {
	                idGrid.SetCellBold(i, G_CTRL, i, G_COLOR, false);
	                ctrl.Cell(14, i, G_CTRL, i, G_COLOR) = true; // Chu nghieng
	            }
	            else
	            {
	                ctrl.Cell(14, i, 1, i, 20) = false;
	                idGrid.SetCellBold(i, G_CTRL, i, G_COLOR, false);
	            }
	            idGrid.SetCellBgColor(i, G_CTRL, i, G_COLOR, Number(idGrid.GetGridData(i, G_COLOR)));
	        }
            
            dso_sum.Call('SELECT');
        break;
        case 'dso_sum':
            MergeHeaderSum();
        break;
    }
}

function OnPopup(obj)
{
    switch(obj)
    {
        case 'Acc':
            var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_acct_popup";
            o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes');	
            if (o != null)
	        {
		        if(o[0] != 0)
		        {
		            txtac_cd.SetDataText(o[0]);
			        txtac_nm.SetDataText(o[1]);
			        txtac_pk.SetDataText(o[3]);
		        }
            }
        break;
        case 'DailySL':
            var ctrl 	= idGrid.GetGridControl();
	        var rows    = ctrl.Rows
	        rows = rows - 1;
	        var rownum  	= ctrl.Row;
	        var colnum  	= ctrl.Col;
            var _col_fr;
            var _col_to;
            if(idGrid.col==G_O_T_DR1)
            {
                _col_fr= dtfrmonth.value+'0101';
                _col_to= dtfrmonth.value+'0131';
            }
            else if(idGrid.col==G_O_T_DR2)
            {
                _col_fr= dtfrmonth.value+'0201';
                _col_to= dtfrmonth.value+'0228';
            }
            else if(idGrid.col==G_O_T_DR3)
            {
                _col_fr= dtfrmonth.value+'0301';
                _col_to= dtfrmonth.value+'0331';
            }
            else if(idGrid.col==G_O_T_DR4)
            {
                _col_fr= dtfrmonth.value+'0401';
                _col_to= dtfrmonth.value+'0430';
            }
            else if(idGrid.col==G_O_T_DR5)
            {
                _col_fr= dtfrmonth.value+'0501';
                _col_to= dtfrmonth.value+'0531';
            } 
            else if(idGrid.col==G_O_T_DR6)
            {
                _col_fr= dtfrmonth.value+'0601';
                _col_to= dtfrmonth.value+'0630';
            } 
            else if(idGrid.col==G_O_T_DR7)
            {
                _col_fr= dtfrmonth.value+'0701';
                _col_to= dtfrmonth.value+'0731';
            } 
            else if(idGrid.col==G_O_T_DR8)
            {
                _col_fr= dtfrmonth.value+'0801';
                _col_to= dtfrmonth.value+'0831';
            } 
            else if(idGrid.col==G_O_T_DR9)
            {
                _col_fr= dtfrmonth.value+'0901';
                _col_to= dtfrmonth.value+'0930';
            } 
            else if(idGrid.col==G_O_T_DR10)
            {
                _col_fr= dtfrmonth.value+'1001';
                _col_to= dtfrmonth.value+'1031';
            } 
            else if(idGrid.col==G_O_T_DR11)
            {
                _col_fr= dtfrmonth.value+'1101';
                _col_to= dtfrmonth.value+'1130';
            } 
            else if(idGrid.col==G_O_T_DR12)
            {
                _col_fr= dtfrmonth.value+'1201';
                _col_to= dtfrmonth.value+'1231';
            } 
            //========================================
            else if(idGrid.col==G_O_T_CR1)
            {
                _col_fr= dtfrmonth.value+'0101';
                _col_to= dtfrmonth.value+'0131';
            }
            else if(idGrid.col==G_O_T_CR2)
            {
                _col_fr= dtfrmonth.value+'0201';
                _col_to= dtfrmonth.value+'0228';
            }
            else if(idGrid.col==G_O_T_CR3)
            {
                _col_fr= dtfrmonth.value+'0301';
                _col_to= dtfrmonth.value+'0331';
            }
            else if(idGrid.col==G_O_T_CR4)
            {
                _col_fr= dtfrmonth.value+'0401';
                _col_to= dtfrmonth.value+'0430';
            }
            else if(idGrid.col==G_O_T_CR5)
            {
                _col_fr= dtfrmonth.value+'0501';
                _col_to= dtfrmonth.value+'0531';
            } 
            else if(idGrid.col==G_O_T_CR6)
            {
                _col_fr= dtfrmonth.value+'0601';
                _col_to= dtfrmonth.value+'0630';
            } 
            else if(idGrid.col==G_O_T_CR7)
            {
                _col_fr= dtfrmonth.value+'0701';
                _col_to= dtfrmonth.value+'0731';
            } 
            else if(idGrid.col==G_O_T_CR8)
            {
                _col_fr= dtfrmonth.value+'0801';
                _col_to= dtfrmonth.value+'0831';
            } 
            else if(idGrid.col==G_O_T_CR9)
            {
                _col_fr= dtfrmonth.value+'0901';
                _col_to= dtfrmonth.value+'0930';
            } 
            else if(idGrid.col==G_O_T_CR10)
            {
                _col_fr= dtfrmonth.value+'1001';
                _col_to= dtfrmonth.value+'1031';
            } 
            else if(idGrid.col==G_O_T_CR11)
            {
                _col_fr= dtfrmonth.value+'1101';
                _col_to= dtfrmonth.value+'1130';
            } 
            else if (idGrid.col==G_O_T_CR12)
            {
                _col_fr= dtfrmonth.value+'1201';
                _col_to= dtfrmonth.value+'1231';
            } 
            //========================================
            else if(idGrid.col==G_O_T_CR1)
            {
                _col_fr= dtfrmonth.value+'0101';
                _col_to= dtfrmonth.value+'0131';
            }
            else if(idGrid.col==G_O_T_CR2)
            {
                _col_fr= dtfrmonth.value+'0201';
                _col_to= dtfrmonth.value+'0228';
            }
            else if(idGrid.col==G_O_T_CR3)
            {
                _col_fr= dtfrmonth.value+'0301';
                _col_to= dtfrmonth.value+'0331';
            }
            else if(idGrid.col==G_O_T_CR4)
            {
                _col_fr= dtfrmonth.value+'0401';
                _col_to= dtfrmonth.value+'0430';
            }
            else if(idGrid.col==G_O_T_CR5)
            {
                _col_fr= dtfrmonth.value+'0501';
                _col_to= dtfrmonth.value+'0531';
            } 
            else if(idGrid.col==G_O_T_CR6)
            {
                _col_fr= dtfrmonth.value+'0601';
                _col_to= dtfrmonth.value+'0630';
            } 
            else if(idGrid.col==G_O_T_CR7)
            {
                _col_fr= dtfrmonth.value+'0701';
                _col_to= dtfrmonth.value+'0731';
            } 
            else if(idGrid.col==G_O_T_CR8)
            {
                _col_fr= dtfrmonth.value+'0801';
                _col_to= dtfrmonth.value+'0831';
            } 
            else if(idGrid.col==G_O_T_CR9)
            {
                _col_fr= dtfrmonth.value+'0901';
                _col_to= dtfrmonth.value+'0930';
            } 
            else if(idGrid.col==G_O_T_CR10)
            {
                _col_fr= dtfrmonth.value+'1001';
                _col_to= dtfrmonth.value+'1031';
            } 
            else if(idGrid.col==G_O_T_CR11)
            {
                _col_fr= dtfrmonth.value+'1101';
                _col_to= dtfrmonth.value+'1130';
            } 
            else if (idGrid.col==G_O_T_CR12)
            {
                _col_fr= dtfrmonth.value+'1201';
                _col_to= dtfrmonth.value+'1231';
            } 
            //========================================
            else if(idGrid.col==G_O_B_DR1)
            {
                _col_fr= dtfrmonth.value+'0101';
                _col_to= dtfrmonth.value+'0131';
            }
            else if(idGrid.col==G_O_B_DR2)
            {
                _col_fr= dtfrmonth.value+'0201';
                _col_to= dtfrmonth.value+'0228';
            }
            else if(idGrid.col==G_O_B_DR3)
            {
                _col_fr= dtfrmonth.value+'0301';
                _col_to= dtfrmonth.value+'0331';
            }
            else if(idGrid.col==G_O_B_DR4)
            {
                _col_fr= dtfrmonth.value+'0401';
                _col_to= dtfrmonth.value+'0430';
            }
            else if(idGrid.col==G_O_B_DR5)
            {
                _col_fr= dtfrmonth.value+'0501';
                _col_to= dtfrmonth.value+'0531';
            } 
            else if(idGrid.col==G_O_B_DR6)
            {
                _col_fr= dtfrmonth.value+'0601';
                _col_to= dtfrmonth.value+'0630';
            } 
            else if(idGrid.col==G_O_B_DR7)
            {
                _col_fr= dtfrmonth.value+'0701';
                _col_to= dtfrmonth.value+'0731';
            } 
            else if(idGrid.col==G_O_B_DR8)
            {
                _col_fr= dtfrmonth.value+'0801';
                _col_to= dtfrmonth.value+'0831';
            } 
            else if(idGrid.col==G_O_B_DR9)
            {
                _col_fr= dtfrmonth.value+'0901';
                _col_to= dtfrmonth.value+'0930';
            } 
            else if(idGrid.col==G_O_B_DR10)
            {
                _col_fr= dtfrmonth.value+'1001';
                _col_to= dtfrmonth.value+'1031';
            } 
            else if(idGrid.col==G_O_B_DR11)
            {
                _col_fr= dtfrmonth.value+'1101';
                _col_to= dtfrmonth.value+'1130';
            } 
            else if(idGrid.col==G_O_B_DR12)
            {
                _col_fr= dtfrmonth.value+'1201';
                _col_to= dtfrmonth.value+'1231';
            } 
            //========================================
            else if(idGrid.col==G_O_B_CR1)
            {
                _col_fr= dtfrmonth.value+'0101';
                _col_to= dtfrmonth.value+'0131';
            }
            else if(idGrid.col==G_O_B_CR2)
            {
                _col_fr= dtfrmonth.value+'0201';
                _col_to= dtfrmonth.value+'0228';
            }
            else if(idGrid.col==G_O_B_CR3)
            {
                _col_fr= dtfrmonth.value+'0301';
                _col_to= dtfrmonth.value+'0331';
            }
            else if(idGrid.col==G_O_B_CR4)
            {
                _col_fr= dtfrmonth.value+'0401';
                _col_to= dtfrmonth.value+'0430';
            }
            else if(idGrid.col==G_O_B_CR5)
            {
                _col_fr= dtfrmonth.value+'0501';
                _col_to= dtfrmonth.value+'0531';
            } 
            else if(idGrid.col==G_O_B_CR6)
            {
                _col_fr= dtfrmonth.value+'0601';
                _col_to= dtfrmonth.value+'0630';
            } 
            else if(idGrid.col==G_O_B_CR7)
            {
                _col_fr= dtfrmonth.value+'0701';
                _col_to= dtfrmonth.value+'0731';
            } 
            else if(idGrid.col==G_O_B_CR8)
            {
                _col_fr= dtfrmonth.value+'0801';
                _col_to= dtfrmonth.value+'0831';
            } 
            else if(idGrid.col==G_O_B_CR9)
            {
                _col_fr= dtfrmonth.value+'0901';
                _col_to= dtfrmonth.value+'0930';
            } 
            else if(idGrid.col==G_O_B_CR10)
            {
                _col_fr= dtfrmonth.value+'1001';
                _col_to= dtfrmonth.value+'1031';
            } 
            else if(idGrid.col==G_O_B_CR11)
            {
                _col_fr= dtfrmonth.value+'1101';
                _col_to= dtfrmonth.value+'1130';
            } 
            else if (idGrid.col==G_O_B_CR12)
            {
                _col_fr= dtfrmonth.value+'1201';
                _col_to= dtfrmonth.value+'1231';
            } 
            //========================================
            else if(idGrid.col==G_P_T_DR1)
            {
                _col_fr= dtfrmonth.value+'0101';
                _col_to= dtfrmonth.value+'0131';
            }
            else if(idGrid.col==G_P_T_DR2)
            {
                _col_fr= dtfrmonth.value+'0201';
                _col_to= dtfrmonth.value+'0228';
            }
            else if(idGrid.col==G_P_T_DR3)
            {
                _col_fr= dtfrmonth.value+'0301';
                _col_to= dtfrmonth.value+'0331';
            }
            else if(idGrid.col==G_P_T_DR4)
            {
                _col_fr= dtfrmonth.value+'0401';
                _col_to= dtfrmonth.value+'0430';
            }
            else if(idGrid.col==G_P_T_DR5)
            {
                _col_fr= dtfrmonth.value+'0501';
                _col_to= dtfrmonth.value+'0531';
            } 
            else if(idGrid.col==G_P_T_DR6)
            {
                _col_fr= dtfrmonth.value+'0601';
                _col_to= dtfrmonth.value+'0630';
            } 
            else if(idGrid.col==G_P_T_DR7)
            {
                _col_fr= dtfrmonth.value+'0701';
                _col_to= dtfrmonth.value+'0731';
            } 
            else if(idGrid.col==G_P_T_DR8)
            {
                _col_fr= dtfrmonth.value+'0801';
                _col_to= dtfrmonth.value+'0831';
            } 
            else if(idGrid.col==G_P_T_DR9)
            {
                _col_fr= dtfrmonth.value+'0901';
                _col_to= dtfrmonth.value+'0930';
            } 
            else if(idGrid.col==G_P_T_DR10)
            {
                _col_fr= dtfrmonth.value+'1001';
                _col_to= dtfrmonth.value+'1031';
            } 
            else if(idGrid.col==G_P_T_DR11)
            {
                _col_fr= dtfrmonth.value+'1101';
                _col_to= dtfrmonth.value+'1130';
            } 
            else if(idGrid.col==G_P_T_DR12)
            {
                _col_fr= dtfrmonth.value+'1201';
                _col_to= dtfrmonth.value+'1231';
            } 
             //========================================
            else if(idGrid.col==G_P_T_CR1)
            {
                _col_fr= dtfrmonth.value+'0101';
                _col_to= dtfrmonth.value+'0131';
            }
            else if(idGrid.col==G_P_T_CR2)
            {
                _col_fr= dtfrmonth.value+'0201';
                _col_to= dtfrmonth.value+'0228';
            }
            else if(idGrid.col==G_P_T_CR3)
            {
                _col_fr= dtfrmonth.value+'0301';
                _col_to= dtfrmonth.value+'0331';
            }
            else if(idGrid.col==G_P_T_CR4)
            {
                _col_fr= dtfrmonth.value+'0401';
                _col_to= dtfrmonth.value+'0430';
            }
            else if(idGrid.col==G_P_T_CR5)
            {
                _col_fr= dtfrmonth.value+'0501';
                _col_to= dtfrmonth.value+'0531';
            } 
            else if(idGrid.col==G_P_T_CR6)
            {
                _col_fr= dtfrmonth.value+'0601';
                _col_to= dtfrmonth.value+'0630';
            } 
            else if(idGrid.col==G_P_T_CR7)
            {
                _col_fr= dtfrmonth.value+'0701';
                _col_to= dtfrmonth.value+'0731';
            } 
            else if(idGrid.col==G_P_T_CR8)
            {
                _col_fr= dtfrmonth.value+'0801';
                _col_to= dtfrmonth.value+'0831';
            } 
            else if(idGrid.col==G_P_T_CR9)
            {
                _col_fr= dtfrmonth.value+'0901';
                _col_to= dtfrmonth.value+'0930';
            } 
            else if(idGrid.col==G_P_T_CR10)
            {
                _col_fr= dtfrmonth.value+'1001';
                _col_to= dtfrmonth.value+'1031';
            } 
            else if(idGrid.col==G_P_T_CR11)
            {
                _col_fr= dtfrmonth.value+'1101';
                _col_to= dtfrmonth.value+'1130';
            } 
            else if(idGrid.col==G_P_T_CR12)
            {
                _col_fr= dtfrmonth.value+'1201';
                _col_to= dtfrmonth.value+'1231';
            } 
             //========================================
            else if(idGrid.col==G_P_B_DR1)
            {
                _col_fr= dtfrmonth.value+'0101';
                _col_to= dtfrmonth.value+'0131';
            }
            else if(idGrid.col==G_P_B_DR2)
            {
                _col_fr= dtfrmonth.value+'0201';
                _col_to= dtfrmonth.value+'0228';
            }
            else if(idGrid.col==G_P_B_DR3)
            {
                _col_fr= dtfrmonth.value+'0301';
                _col_to= dtfrmonth.value+'0331';
            }
            else if(idGrid.col==G_P_B_DR4)
            {
                _col_fr= dtfrmonth.value+'0401';
                _col_to= dtfrmonth.value+'0430';
            }
            else if(idGrid.col==G_P_B_DR5)
            {
                _col_fr= dtfrmonth.value+'0501';
                _col_to= dtfrmonth.value+'0531';
            } 
            else if(idGrid.col==G_P_B_DR6)
            {
                _col_fr= dtfrmonth.value+'0601';
                _col_to= dtfrmonth.value+'0630';
            } 
            else if(idGrid.col==G_P_B_DR7)
            {
                _col_fr= dtfrmonth.value+'0701';
                _col_to= dtfrmonth.value+'0731';
            } 
            else if(idGrid.col==G_P_B_DR8)
            {
                _col_fr= dtfrmonth.value+'0801';
                _col_to= dtfrmonth.value+'0831';
            } 
            else if(idGrid.col==G_P_B_DR9)
            {
                _col_fr= dtfrmonth.value+'0901';
                _col_to= dtfrmonth.value+'0930';
            } 
            else if(idGrid.col==G_P_B_DR10)
            {
                _col_fr= dtfrmonth.value+'1001';
                _col_to= dtfrmonth.value+'1031';
            } 
            else if(idGrid.col==G_P_B_DR11)
            {
                _col_fr= dtfrmonth.value+'1101';
                _col_to= dtfrmonth.value+'1130';
            } 
            else if(idGrid.col==G_P_B_DR12)
            {
                _col_fr= dtfrmonth.value+'1201';
                _col_to= dtfrmonth.value+'1231';
            } 
             //========================================
            else if(idGrid.col==G_P_B_CR1)
            {
                _col_fr= dtfrmonth.value+'0101';
                _col_to= dtfrmonth.value+'0131';
            }
            else if(idGrid.col==G_P_B_CR2)
            {
                _col_fr= dtfrmonth.value+'0201';
                _col_to= dtfrmonth.value+'0228';
            }
            else if(idGrid.col==G_P_B_CR3)
            {
                _col_fr= dtfrmonth.value+'0301';
                _col_to= dtfrmonth.value+'0331';
            }
            else if(idGrid.col==G_P_B_CR4)
            {
                _col_fr= dtfrmonth.value+'0401';
                _col_to= dtfrmonth.value+'0430';
            }
            else if(idGrid.col==G_P_B_CR5)
            {
                _col_fr= dtfrmonth.value+'0501';
                _col_to= dtfrmonth.value+'0531';
            } 
            else if(idGrid.col==G_P_B_CR6)
            {
                _col_fr= dtfrmonth.value+'0601';
                _col_to= dtfrmonth.value+'0630';
            } 
            else if(idGrid.col==G_P_B_CR7)
            {
                _col_fr= dtfrmonth.value+'0701';
                _col_to= dtfrmonth.value+'0731';
            } 
            else if(idGrid.col==G_P_B_CR8)
            {
                _col_fr= dtfrmonth.value+'0801';
                _col_to= dtfrmonth.value+'0831';
            } 
            else if(idGrid.col==G_P_B_CR9)
            {
                _col_fr= dtfrmonth.value+'0901';
                _col_to= dtfrmonth.value+'0930';
            } 
            else if(idGrid.col==G_P_B_CR10)
            {
                _col_fr= dtfrmonth.value+'1001';
                _col_to= dtfrmonth.value+'1031';
            } 
            else if(idGrid.col==G_P_B_CR11)
            {
                _col_fr= dtfrmonth.value+'1101';
                _col_to= dtfrmonth.value+'1130';
            } 
            else if(idGrid.col==G_P_B_CR12)
            {
                _col_fr= dtfrmonth.value+'1201';
                _col_to= dtfrmonth.value+'1231';
            } 
             //========================================
            else if(idGrid.col==G_E_T_DR1)
            {
                _col_fr= dtfrmonth.value+'0101';
                _col_to= dtfrmonth.value+'0131';
            }
            else if(idGrid.col==G_E_T_DR2)
            {
                _col_fr= dtfrmonth.value+'0201';
                _col_to= dtfrmonth.value+'0228';
            }
            else if(idGrid.col==G_E_T_DR3)
            {
                _col_fr= dtfrmonth.value+'0301';
                _col_to= dtfrmonth.value+'0331';
            }
            else if(idGrid.col==G_E_T_DR4)
            {
                _col_fr= dtfrmonth.value+'0401';
                _col_to= dtfrmonth.value+'0430';
            }
            else if(idGrid.col==G_E_T_DR5)
            {
                _col_fr= dtfrmonth.value+'0501';
                _col_to= dtfrmonth.value+'0531';
            } 
            else if(idGrid.col==G_E_T_DR6)
            {
                _col_fr= dtfrmonth.value+'0601';
                _col_to= dtfrmonth.value+'0630';
            } 
            else if(idGrid.col==G_E_T_DR7)
            {
                _col_fr= dtfrmonth.value+'0701';
                _col_to= dtfrmonth.value+'0731';
            } 
            else if(idGrid.col==G_E_T_DR8)
            {
                _col_fr= dtfrmonth.value+'0801';
                _col_to= dtfrmonth.value+'0831';
            } 
            else if(idGrid.col==G_E_T_DR9)
            {
                _col_fr= dtfrmonth.value+'0901';
                _col_to= dtfrmonth.value+'0930';
            } 
            else if(idGrid.col==G_E_T_DR10)
            {
                _col_fr= dtfrmonth.value+'1001';
                _col_to= dtfrmonth.value+'1031';
            } 
            else if(idGrid.col==G_E_T_DR11)
            {
                _col_fr= dtfrmonth.value+'1101';
                _col_to= dtfrmonth.value+'1130';
            } 
            else if(idGrid.col==G_E_T_DR12)
            {
                _col_fr= dtfrmonth.value+'1201';
                _col_to= dtfrmonth.value+'1231';
            } 
             //========================================
            else if(idGrid.col==G_E_T_CR1)
            {
                _col_fr= dtfrmonth.value+'0101';
                _col_to= dtfrmonth.value+'0131';
            }
            else if(idGrid.col==G_E_T_CR2)
            {
                _col_fr= dtfrmonth.value+'0201';
                _col_to= dtfrmonth.value+'0228';
            }
            else if(idGrid.col==G_E_T_CR3)
            {
                _col_fr= dtfrmonth.value+'0301';
                _col_to= dtfrmonth.value+'0331';
            }
            else if(idGrid.col==G_E_T_CR4)
            {
                _col_fr= dtfrmonth.value+'0401';
                _col_to= dtfrmonth.value+'0430';
            }
            else if(idGrid.col==G_E_T_CR5)
            {
                _col_fr= dtfrmonth.value+'0501';
                _col_to= dtfrmonth.value+'0531';
            } 
            else if(idGrid.col==G_E_T_CR6)
            {
                _col_fr= dtfrmonth.value+'0601';
                _col_to= dtfrmonth.value+'0630';
            } 
            else if(idGrid.col==G_E_T_CR7)
            {
                _col_fr= dtfrmonth.value+'0701';
                _col_to= dtfrmonth.value+'0731';
            } 
            else if(idGrid.col==G_E_T_CR8)
            {
                _col_fr= dtfrmonth.value+'0801';
                _col_to= dtfrmonth.value+'0831';
            } 
            else if(idGrid.col==G_E_T_CR9)
            {
                _col_fr= dtfrmonth.value+'0901';
                _col_to= dtfrmonth.value+'0930';
            } 
            else if(idGrid.col==G_E_T_CR10)
            {
                _col_fr= dtfrmonth.value+'1001';
                _col_to= dtfrmonth.value+'1031';
            } 
            else if(idGrid.col==G_E_T_CR11)
            {
                _col_fr= dtfrmonth.value+'1101';
                _col_to= dtfrmonth.value+'1130';
            } 
            else if(idGrid.col==G_E_T_CR12)
            {
                _col_fr= dtfrmonth.value+'1201';
                _col_to= dtfrmonth.value+'1231';
            } 
             //========================================
            else if(idGrid.col==G_E_B_DR1)
            {
                _col_fr= dtfrmonth.value+'0101';
                _col_to= dtfrmonth.value+'0131';
            }
            else if(idGrid.col==G_E_B_DR2)
            {
                _col_fr= dtfrmonth.value+'0201';
                _col_to= dtfrmonth.value+'0228';
            }
            else if(idGrid.col==G_E_B_DR3)
            {
                _col_fr= dtfrmonth.value+'0301';
                _col_to= dtfrmonth.value+'0331';
            }
            else if(idGrid.col==G_E_B_DR4)
            {
                _col_fr= dtfrmonth.value+'0401';
                _col_to= dtfrmonth.value+'0430';
            }
            else if(idGrid.col==G_E_B_DR5)
            {
                _col_fr= dtfrmonth.value+'0501';
                _col_to= dtfrmonth.value+'0531';
            } 
            else if(idGrid.col==G_E_B_DR6)
            {
                _col_fr= dtfrmonth.value+'0601';
                _col_to= dtfrmonth.value+'0630';
            } 
            else if(idGrid.col==G_E_B_DR7)
            {
                _col_fr= dtfrmonth.value+'0701';
                _col_to= dtfrmonth.value+'0731';
            } 
            else if(idGrid.col==G_E_B_DR8)
            {
                _col_fr= dtfrmonth.value+'0801';
                _col_to= dtfrmonth.value+'0831';
            } 
            else if(idGrid.col==G_E_B_DR9)
            {
                _col_fr= dtfrmonth.value+'0901';
                _col_to= dtfrmonth.value+'0930';
            } 
            else if(idGrid.col==G_E_B_DR10)
            {
                _col_fr= dtfrmonth.value+'1001';
                _col_to= dtfrmonth.value+'1031';
            } 
            else if(idGrid.col==G_E_B_DR11)
            {
                _col_fr= dtfrmonth.value+'1101';
                _col_to= dtfrmonth.value+'1130';
            } 
            else if(idGrid.col==G_E_B_DR12)
            {
                _col_fr= dtfrmonth.value+'1201';
                _col_to= dtfrmonth.value+'1231';
            } 
             //========================================
            else if(idGrid.col==G_E_B_CR1)
            {
                _col_fr= dtfrmonth.value+'0101';
                _col_to= dtfrmonth.value+'0131';
            }
            else if(idGrid.col==G_E_B_CR2)
            {
                _col_fr= dtfrmonth.value+'0201';
                _col_to= dtfrmonth.value+'0228';
            }
            else if(idGrid.col==G_E_B_CR3)
            {
                _col_fr= dtfrmonth.value+'0301';
                _col_to= dtfrmonth.value+'0331';
            }
            else if(idGrid.col==G_E_B_CR4)
            {
                _col_fr= dtfrmonth.value+'0401';
                _col_to= dtfrmonth.value+'0430';
            }
            else if(idGrid.col==G_E_B_CR5)
            {
                _col_fr= dtfrmonth.value+'0501';
                _col_to= dtfrmonth.value+'0531';
            } 
            else if(idGrid.col==G_E_B_CR6)
            {
                _col_fr= dtfrmonth.value+'0601';
                _col_to= dtfrmonth.value+'0630';
            } 
            else if(idGrid.col==G_E_B_CR7)
            {
                _col_fr= dtfrmonth.value+'0701';
                _col_to= dtfrmonth.value+'0731';
            } 
            else if(idGrid.col==G_E_B_CR8)
            {
                _col_fr= dtfrmonth.value+'0801';
                _col_to= dtfrmonth.value+'0831';
            } 
            else if(idGrid.col==G_E_B_CR9)
            {
                _col_fr= dtfrmonth.value+'0901';
                _col_to= dtfrmonth.value+'0930';
            } 
            else if(idGrid.col==G_E_B_CR10)
            {
                _col_fr= dtfrmonth.value+'1001';
                _col_to= dtfrmonth.value+'1031';
            } 
            else if(idGrid.col==G_E_B_CR11)
            {
                _col_fr= dtfrmonth.value+'1101';
                _col_to= dtfrmonth.value+'1130';
            } 
            else if(idGrid.col==G_E_B_CR12)
            {
                _col_fr= dtfrmonth.value+'1201';
                _col_to= dtfrmonth.value+'1231';
            } 
	        if (rownum > 1)		 
	        {
		        if (event.col > 1)
		        {
			        var ac_pk   = idGrid.GetGridData(ctrl.row, G_PK);
			        var ac_nm   = idGrid.GetGridData(ctrl.row, G_ACC_NM);
			        var fpath   = System.RootURL + '/standard/forms/60/08/60080050_p1.aspx?ac_pk='+ ac_pk + '&ac_nm=' + ac_nm + '&compk=' + lstCompany.GetData() + '&status=' + lstStatus.GetData() + '&lang='+ lstLang.GetData() + '&cur=' + lstCurrent.GetData() + '&date_fr=' + _col_fr + '&date_to=' + _col_to + '&type_month=' ;
			            fpath = fpath + '&ac_cd=' + idGrid.GetGridData(ctrl.row, G_ACC_CD) + '&ad_nm1=' + idGrid.GetGridData(ctrl.row, G_ACC_NM) ;
			        var wWidth  = 950;
			        var wHeight = 500;
			        var x = Math.round((screen.availWidth - wWidth)/2);
			        var y = Math.round((screen.availHeight - wHeight)/2);
			alert(fpath)
			        var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
			           "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
			           "lef="+ x +",top=" + y;
			
			        var object = System.OpenModal(fpath, wWidth, wHeight, features);
	            }
            }
        break;
    }
}
</script>
<body style="margin:0; padding:0;">

    
    <gw:data id="dso_get_rate" onreceive="onSearch()">
        <xml> 
            <dso type="process" procedure="ac_PRO_GET_RATE"> 
                <input> 
                     <input bind="txt_date"/>
                     <input bind="lstCompany"/>
                     <input bind="lstCurrent" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="txtrate1"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    

    <gw:data id="dso_insert" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="grid" function="ac_sel_60200010"> 
                <input bind="idGrid_sum">
                     <input bind="lstCompany"/>
                     <input bind="dtfrmonth" />
                     <input bind="lstStatus" />
                     <input bind="lstLang" />
                     <input bind="lstCurrent" />
                     <input bind="txtrate1" />
                     <input bind="txtac_cd" />
                     <input bind="lstLevel" />
                     <input bind="lstPostSum"/>
                     <input bind="lstAccType"/>
                </input>
                <output bind="idGrid"/>
            </dso> 
        </xml> 
    </gw:data>

    <gw:data id="dso_sum" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="grid" function="ac_sel_60200010_sum"> 
                <input bind="idGrid_sum">
                     <input bind="lstCompany"/>
                     <input bind="dtfrmonth" />
                     <input bind="lstStatus" />
                     <input bind="lstLang" />
                     <input bind="lstCurrent" />
                     <input bind="txtrate1" />
                     <input bind="txtac_cd" />
                     <input bind="lstLevel" />
                     <input bind="lstAccType"/>
                </input>
                <output bind="idGrid_sum"/>
            </dso> 
        </xml> 
    </gw:data>
<table style="width:100%;height:100%" cellpadding="0" cellspacing="0" border="0">
<tr style="height:2%">
    <td width="100%">
        <fieldset style="padding:0">
        <table width="100%" cellpadding="2" cellspacing="0" border="0">
       
	    <tr>
	        <td align="right" width="8%">Company&nbsp;</td>
            <td width="20%"><gw:list id="lstCompany" onChange ="onSearch()" styles='width:100%'></gw:list></td>
            <td width="10%" align="right">Amt.Type</td>
            <td width="15%"><gw:list id="lstAmtType" onChange ="OnDisplay()"  styles='width:100%'></gw:list></td>
            <td width="15%" align="right">Financial Statement</td>
            <td width="10%"><gw:list id="lstFinancial" styles='width:100%' onChange="OnChangeList()" /></td>
            <td width="10%" align="right">Language&nbsp;</td>
            <td width="12%" colspan=""><gw:list id="lstLang" styles='width:100%' onChange="OnDisplayLang()" /></td>
            <td align="right"><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"        onclick="onSearch()"/></td>
            <td ><gw:imgBtn id="ibtnReport" img="printer"   alt="Print"  onclick="onReport()"/></td>
	    </tr>
	     <tr>
	        <td align="right">Year</td>
            <td><gw:datebox id="dtfrmonth" type="year" /></td>
            <td align="right">Status</td>
            <td><gw:list id="lstStatus" onchange="onSearch()"/></td>       
            <td align="right">Current</td>
            <td><gw:list id="lstCurrent" onChange="OnChangeCurrent()"  styles='width:100%'></gw:list></td>
            <td align="right"><a title="Click here to select Ex.Rate" onclick="Popup_Cur()" href="#tips" style="text-decoration: none; color=#0000ff"><b>Ex.Rate</b></a></td>
            <td colspan="3"> 
                <table cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td width="10%"><gw:textbox id="txtrate"  styles='width:100%' type="number" format="###,###.##R" /> </td>
                        <td width="27%"><gw:textbox id="txtrate1" styles='width:100%' type="number" format="###,###.##R" onenterkey="onSearch()"/></td>
                        <td width="20%" align="right">Level&nbsp;</td>
	                    <td width="43%" colspan=""><gw:list id="lstLevel" onChange="OnChangeList()"  /></td>
                    </tr>
                </table>
            </td>
	    </tr>
	     <tr>
	        <td align="right"><a title="Click here to select Ex.Rate" onclick="OnPopup('Acc')" href="#tips" style="text-decoration: none; color=#0000ff"><b>Acc.Code&nbsp;</b></a></td>
	        <td colspan="3">
	            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="35%"><gw:textbox id="txtac_cd" styles='width:100%' onkeypress="CheckNumeric()" onenterkey="onEnter()"/></td>
                    <td width="75%"><gw:textbox id="txtac_nm" styles='width:100%'/></td>
                    <td width=""><gw:textbox  id="txtac_pk" styles='display:none'/></td>
                    <td width=""><gw:imgBtn   img="reset"	id="idResetAcc"  alt="Reset" onclick="txtac_cd.text='';txtac_nm.text='';txtac_pk.text=''"/></td>
                </tr>
                </table>
	        </td>
	        <td align="right">Posting/Summary&nbsp;</td>
            <td ><gw:list id="lstPostSum" onChange="" /></td>
            <td align="right">Acc.Type</td>
            <td colspan="3"><gw:list id="lstAccType" onChange =""  styles='width:100%'></gw:list></td>
	    </tr>
	    </table>
        </fieldset>
	</td>
</tr>
<tr style="height:78%">
	
            <!--0.Ctrl|1_PK|2.Account Name|3.Begin Bal(Debt)|4.Begin Bal(Cret)|5.Debit|6.Credit|7.cal bal(Debt)|8.cal bal(Cret)|9.Ending bal(Debt)|10.Ending bal(Cret)|11_B|12_COLOR|13_ac_cd|14_ac_nm-->
            <!--header="0.Ctrl|1._PK|2.Account Name|3.Begin Bal(Debt)|4.Begin Bal(Cret)|5.Debit|6.Credit|7.cal bal(Debt)|8.cal bal(Cret)|9.Ending bal(Debt)|10.Ending bal(Cret)|11.Beginbal(Book)|12.Period_(Book)|13.ending_bal_(Book)|14.Cal_bal_(Book)|15.qq|16.qq2|17.qqq|18.qq3|19._B|20._COLOR|21._ac_cd|22._ac_nm"-->
            <td>
            
                <gw:grid   
				    id="idGrid"  
				    header="0.Ctrl|_1._PK|2.Acc_cd|2.AccountName|Acc_Nm_local|Accnm_korean|3.O_Tr_Debit_1|4.O_Tr_Debit_2|5.O_Tr_Debit_3|6.O_Tr_Debit_4|7.O_Tr_Debit_5|8.O_Tr_Debit_6|9.O_Tr_Debit_7|10.O_Tr_Debit_8|11.O_Tr_Debit_9|12.O_Tr_Debit_10|13.O_Tr_Debit_11|14.O_Tr_Debit_12|15.O_Tran_Credit_1|16.O_Tran_Credit_2|17.O_Tran_Credit_3|18.O_Tran_Credit_4|19.O_Tran_Credit_5|20.O_Tran_Credit_6|21.O_Tran_Credit_7|22.O_Tran_Credit_8|23.O_Tran_Credit_9|24.O_Tran_Credit_10|25.O_Tran_Credit_11|26.O_Tran_Credit_12|27.O_Book_Debit_1|28.O_Book_Debit_2|29.O_Book_Debit_3|30.O_Book_Debit_4|31.O_Book_Debit_5|32.O_Book_Debit_6|33.O_Book_Debit_7|34.O_Book_Debit_8|35.O_Book_Debit_9|36.O_Book_Debit_10|37.O_Book_Debit_11|38.O_Book_Debit_12|39.O_Book_Credit_1|40.O_Book_Debit_2|41.O_Book_Credit_3|42.O_Book_Credit_4|43.O_Book_Credit_5|44.O_Book_Credit_6|45.O_Book_Credit_7|46.O_Book_Credit_8|47.O_Book_Credit_9|48.O_Book_Credit_10|49.O_Book_Credit_11|50.O_Book_Credit_12|51.Period_Tr_Debit_1|52.Period_Tr_Debit_2|53.Period_Tr_Debit_3|54.Period_Tr_Debit_4|55.Period_Tr_Debit_5|56.Period_Tr_Debit_6|57.Period_Tr_Debit_7|58.Period_Tr_Debit_8|59.Period_Tr_Debit_9|60.Period_Tr_Debit_10|61.Period_Tr_Debit_11|62.Period_Tr_Debit_12|63.Period_Tr_Credit_1|64.Period_Tr_Credit_2|65.Period_Tr_Credit_3|66.Period_Tr_Credit_4|67.Period_Tr_Credit_5|68.Period_Tr_Credit_6|69.Period_Tr_Credit_7|70.Period_Tr_Credit_8|71.Period_Tr_Credit_9|72.Period_Tr_Credit_10|73.Period_Tr_Credit_11|74.Period_Tran_Credit_12|75.Period_Book_Debit_1|76.Period_Book_Debit_2|77.Period_Book_Debit_3|78.Period_Book_Debit_4|79.Period_Book_Debit_5|80.Period_Book_Debit_6|81.Period_Book_Debit_7|82.Period_Book_Debit_8|83.Period_Book_Debit_9|84.Period_Book_Debit_10|85.Period_Book_Debit_11|86.Period_Book_Debit_12|87.Period_Book_Credit_1|88.Period_Book_Debit_2|89.Period_Book_Credit_3|90.Period_Book_Credit_4|91.Period_Book_Credit_5|92.Period_Book_Credit_6|93.Period_Book_Credit_7|94.Period_Book_Credit_8|95.Period_Book_Credit_9|96.Period_Book_Credit_10|97.Period_Book_Credit_11|98.Period_Book_Credit_12|99.E_Tr_Debit_1|100.E_Tr_Debit_2|101.E_Tr_Debit_3|102.E_Tr_Debit_4|103.E_Tr_Debit_5|104.E_Tr_Debit_6|105.E_Tr_Debit_7|106.E_Tr_Debit_8|107.E_Tr_Debit_9|108.E_Tr_Debit_10|109.E_Tr_Debit_11|110.E_Tr_Debit_12|111.E_Tr_Credit_1|112.E_Tr_Credit_2|113.E_Tr_Credit_3|114.E_Tr_Credit_4|115.E_Tr_Credit_5|116.E_Tr_Credit_6|117.E_Tr_Credit_7|118.E_Credit_8|119.E_Tr_Credit_9|120.E_Tr_Credit_10|121.E_Tr_Credit_11|122.E_Tran_Credit_12|123.E_Book_Debit_1|124.E_Book_Debit_2|125.E_Book_Debit_3|126.E_Book_Debit_4|127.E_Book_Debit_5|128.E_Book_Debit_6|129.E_Book_Debit_7|130.E_Book_Debit_8|131.E_Book_Debit_9|132.E_Book_Debit_10|133.E_Book_Debit_11|134.E_Book_Debit_12|135.E_Book_Credit_1|136.E_Book_Debit_2|137.E_Book_Credit_3|138.E_Book_Credit_4|139.E_Book_Credit_5|140.E_Book_Credit_6|141.E_Book_Credit_7|142.E_Book_Credit_8|143.E_Book_Credit_9|144.E_Book_Credit_10|145.E_Book_Credit_11|146.E_Book_Credit_12|151._font|152._COLOR"
				    format="3|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
 			        aligns="1|0|0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3"
				    defaults="|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"  
				   editcol="1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				    widths="400|0|1300|4000|4000|4000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|0|0"  
				    styles="width:100%; height:100%"
				    sorting="T"
				    oncelldblclick="OnPopup('DailySL')"
				    /> 
            </td>
        </tr>
        <tr style="height:20%">
            <td>
                <gw:grid   
				id="idGrid_sum"
				header="0.Total|3.O_Tr_Debit_1|4.O_Tr_Debit_2|5.O_Tr_Debit_3|6.O_Tr_Debit_4|7.O_Tr_Debit_5|8.O_Tr_Debit_6|9.O_Tr_Debit_7|10.O_Tr_Debit_8|11.O_Tr_Debit_9|12.O_Tr_Debit_10|13.O_Tr_Debit_11|14.O_Tr_Debit_12|15.O_Tran_Credit_1|16.O_Tran_Credit_2|17.O_Tran_Credit_3|18.O_Tran_Credit_4|19.O_Tran_Credit_5|20.O_Tran_Credit_6|21.O_Tran_Credit_7|22.O_Tran_Credit_8|23.O_Tran_Credit_9|24.O_Tran_Credit_10|25.O_Tran_Credit_11|26.O_Tran_Credit_12|27.O_Book_Debit_1|28.O_Book_Debit_2|29.O_Book_Debit_3|30.O_Book_Debit_4|31.O_Book_Debit_5|32.O_Book_Debit_6|33.O_Book_Debit_7|34.O_Book_Debit_8|35.O_Book_Debit_9|36.O_Book_Debit_10|37.O_Book_Debit_11|38.O_Book_Debit_12|39.O_Book_Credit_1|40.O_Book_Debit_2|41.O_Book_Credit_3|42.O_Book_Credit_4|43.O_Book_Credit_5|44.O_Book_Credit_6|45.O_Book_Credit_7|46.O_Book_Credit_8|47.O_Book_Credit_9|48.O_Book_Credit_10|49.O_Book_Credit_11|50.O_Book_Credit_12|51.Period_Tr_Debit_1|52.Period_Tr_Debit_2|53.Period_Tr_Debit_3|54.Period_Tr_Debit_4|55.Period_Tr_Debit_5|56.Period_Tr_Debit_6|57.Period_Tr_Debit_7|58.Period_Tr_Debit_8|59.Period_Tr_Debit_9|60.Period_Tr_Debit_10|61.Period_Tr_Debit_11|62.Period_Tr_Debit_12|63.Period_Tr_Credit_1|64.Period_Tr_Credit_2|65.Period_Tr_Credit_3|66.Period_Tr_Credit_4|67.Period_Tr_Credit_5|68.Period_Tr_Credit_6|69.Period_Tr_Credit_7|70.Period_Tr_Credit_8|71.Period_Tr_Credit_9|72.Period_Tr_Credit_10|73.Period_Tr_Credit_11|74.Period_Tran_Credit_12|75.Period_Book_Debit_1|76.Period_Book_Debit_2|77.Period_Book_Debit_3|78.Period_Book_Debit_4|79.Period_Book_Debit_5|80.Period_Book_Debit_6|81.Period_Book_Debit_7|82.Period_Book_Debit_8|83.Period_Book_Debit_9|84.Period_Book_Debit_10|85.Period_Book_Debit_11|86.Period_Book_Debit_12|87.Period_Book_Credit_1|88.Period_Book_Debit_2|89.Period_Book_Credit_3|90.Period_Book_Credit_4|91.Period_Book_Credit_5|92.Period_Book_Credit_6|93.Period_Book_Credit_7|94.Period_Book_Credit_8|95.Period_Book_Credit_9|96.Period_Book_Credit_10|97.Period_Book_Credit_11|98.Period_Book_Credit_12|99.E_Tr_Debit_1|100.E_Tr_Debit_2|101.E_Tr_Debit_3|102.E_Tr_Debit_4|103.E_Tr_Debit_5|104.E_Tr_Debit_6|105.E_Tr_Debit_7|106.E_Tr_Debit_8|107.E_Tr_Debit_9|108.E_Tr_Debit_10|109.E_Tr_Debit_11|110.E_Tr_Debit_12|111.E_Tr_Credit_1|112.E_Tr_Credit_2|113.E_Tr_Credit_3|114.E_Tr_Credit_4|115.E_Tr_Credit_5|116.E_Tr_Credit_6|117.E_Tr_Credit_7|118.E_Credit_8|119.E_Tr_Credit_9|120.E_Tr_Credit_10|121.E_Tr_Credit_11|122.E_Tran_Credit_12|123.E_Book_Debit_1|124.E_Book_Debit_2|125.E_Book_Debit_3|126.E_Book_Debit_4|127.E_Book_Debit_5|128.E_Book_Debit_6|129.E_Book_Debit_7|130.E_Book_Debit_8|131.E_Book_Debit_9|132.E_Book_Debit_10|133.E_Book_Debit_11|134.E_Book_Debit_12|135.E_Book_Credit_1|136.E_Book_Debit_2|137.E_Book_Credit_3|138.E_Book_Credit_4|139.E_Book_Credit_5|140.E_Book_Credit_6|141.E_Book_Credit_7|142.E_Book_Credit_8|143.E_Book_Credit_9|144.E_Book_Credit_10|145.E_Book_Credit_11|146.E_Book_Credit_12"
				format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
 			    aligns="0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3"
				defaults="||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"  
			   editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
				widths="5700|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000|2000"  
				styles="width:100%; height:100%"
				sorting="T"
				sorting="F" /> 
            </td>
        </tr>
        
</table>

<gw:textbox id="txtRtn"      styles='display:none'/>
<gw:textbox id="txt_temp"       styles='display:none'/>
<gw:textbox id="txt_row"        styles='display:none'/>
<gw:textbox id="txt_date"       styles='display:none'/>

</body>
</html>

