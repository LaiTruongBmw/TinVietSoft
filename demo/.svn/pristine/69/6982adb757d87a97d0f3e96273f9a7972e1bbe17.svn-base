<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
  <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var g_ac_cd = 0,
	g_ac_nm = 1,
	g_ac_lnm = 2,
	g_ac_fnm = 3,
	
	g_jan_1 = 4,
	g_jan_2 = 5,
	g_jan_3 = 6,
	g_jan_4 = 7,
	g_jan_5 = 8,
	g_jan_6 = 9,
	
	g_feb_1 = 10,
	g_feb_2 = 11,
	g_feb_3 = 12,
	g_feb_4 = 13,
	g_feb_5 = 14,
	g_feb_6 = 15,
	
	g_mar_1 = 16,
	g_mar_2 = 17,
	g_mar_3 = 18,
	g_mar_4 = 19,
	g_mar_5 = 20,
	g_mar_6 = 21,
	
	g_apr_1 = 22,
	g_apr_2 = 23,
	g_apr_3 = 24,
	g_apr_4 = 25,
	g_apr_5 = 26,
	g_apr_6 = 27,
	
	g_may_1 = 28,
	g_may_2 = 29,
	g_may_3 = 30,
	g_may_4 = 31,
	g_may_5 = 32,
	g_may_6 = 33,
	
	g_jun_1 = 34,
	g_jun_2 = 35,
	g_jun_3 = 36,
	g_jun_4 = 37,
	g_jun_5 = 38,
	g_jun_6 = 39,
	
	g_jul_1 = 40,
	g_jul_2 = 41,
	g_jul_3 = 42,
	g_jul_4 = 43,
	g_jul_5 = 44,
	g_jul_6 = 45,
	
	g_aug_1 = 46,
	g_aug_2 = 47,
	g_aug_3 = 48,
	g_aug_4 = 49,
	g_aug_5 = 50,
	g_aug_6 = 51,
	
	g_sep_1 = 52,
	g_sep_2 = 53,
	g_sep_3 = 54,
	g_sep_4 = 55,
	g_sep_5 = 56,
	g_sep_6 = 57,
	
	g_oct_1 = 58,
	g_oct_2 = 59,
	g_oct_3 = 60,
	g_oct_4 = 61,
	g_oct_5 = 62,
	g_oct_6 = 63,
	
	g_nov_1 = 64,
	g_nov_2 = 65,
	g_nov_3 = 66,
	g_nov_4 = 67,
	g_nov_5 = 68,
	g_nov_6 = 69,
	
	g_dec_1 = 70,
	g_dec_2 = 71,
	g_dec_3 = 72,
	g_dec_4 = 73,
	g_dec_5 = 74,
	g_dec_6 = 75,
	
	g_accum_1 = 76,
	g_accum_2 = 77,
	g_accum_3 = 78,
	g_accum_4 = 79,
	g_accum_5 = 80,
	g_accum_6 = 81,
	g_font = 82,
	g_color = 83
	;
function BodyInit()
{
    txtUser.text="<%=Session("User_ID") %>"; 
    BindingData(); 
    System.Translate(document); 
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	dso_getCompany.Call();
    
}
//------------------------------------------------------------------------
function BindingData()
{
    var ls_data  = "<%=CtlLib.SetListDataSQL("SELECT pk, partner_name FROM tco_company where del_if = 0")%>";
    var ls_data2 = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK011' ORDER BY D.DEF_YN DESC, D.ORD")%>"; 
    var ls_data3 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
	var ls_data1 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE_NM  FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='HRAB0180' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 order by code_nm")%>";
	var ls_FS = "<%=CtlLib.SetListDataSQL(" SELECT CODE, CODE_NM FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0020' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and code like 'C%' order by a.DEF_YN desc , code ")%>";
	var ls_Report1 = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK053' and d.use_yn = 'Y' ORDER BY D.DEF_YN DESC, D.ORD")%>"; 
	var dataStatus = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='ACBG0202' and d.use_yn = 'Y' ORDER BY D.DEF_YN DESC, D.ORD")%>"; 
    
	lstCompany.SetDataText(ls_data);
    lstLanguage.SetDataText(ls_data1); 
	
    lstReport.SetDataText(dataStatus); 
	lstReport1.SetDataText(ls_Report1); 
	lstFS.SetDataText(ls_FS); 
	FormatGrid();
	grdDetail.GetGridControl().FrozenCols =2;

}
//------------------------------------------------------------------------
function OnPopUp(pname)
{
    if (pname=='ACCT')
    {
        var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_sel_60080150_accd_pl";
        var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
        if ((object != null) &&(object[0]!="0"))
		{
			txtACPK.SetDataText(object[3]);
			txtACCD.SetDataText(object[0]);
			txtACNM.SetDataText(object[1]);
		}
   }
   if (pname=='CENTER')
   {
        var fpath   = System.RootURL + "/standard/forms/60/01/60010080_plcenter.aspx?";
        var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
		if ( object != null )  
		{
			if (object[0] != 0)
			{
				txtPLC_PK.text = object;     // Center PK
				dat_gfka00220_1.Call();
			}            
		}        
   }
   if (pname=='PL')
   {
		var fpath   = System.RootURL + "/standard/forms/60/01/60010080_popup_plunit.aspx?";
		var object  = System.OpenModal(fpath , 400 , 500 , 'resizable:yes;status:yes'); 
		var tmp;
		if ( object != null )  
		{
			if (object[0] != 0)
			{
				txtPLPK.text=object;     // Center PK
				dat_gfka00220_2.Call();
			}            
		}    
   }
}
//------------------------------------------------------------------------------------------
function OnSearch()
{
   dso_search.Call("SELECT");
}
//-------------------------------------------------------------------------------------------

function OnPrint()
{
	/*if(lstReport1.value=='01')
	{
		var url ='/standard/reports/60/08/rpt_60081341_01.aspx?company_pk='+lstCompany.value+'&acc_pk='+txtACPK.text+'&plc_pk='+txtPLC_PK.text+'&pl_pk='+txtPLPK.text+'&month='+dtMonth.value+'&status='+rdoSlipStatus.value+'&fs='+lstFS.value+'&report='+lstReport.value;
	}	
	else if(lstReport1.value=='02')
	{
		var url ='/standard/reports/60/08/rpt_60081341_02.aspx?company_pk='+lstCompany.value+'&acc_pk='+txtACPK.text+'&plc_pk='+txtPLC_PK.text+'&pl_pk='+txtPLPK.text+'&month='+dtMonth.value+'&status='+rdoSlipStatus.value+'&fs='+lstFS.value+'&report='+lstReport.value;
	}*/
	switch(lstReport1.value)
	{
		case '01':
			var url ='/standard/reports/60/08/rpt_60081341_01.aspx?company_pk='+lstCompany.value+'&acc_pk='+txtACPK.text+'&plc_pk='+txtPLC_PK.text+'&pl_pk='+txtPLPK.text+'&month='+dtMonth.value+'&status='+rdoSlipStatus.value+'&fs='+lstFS.value+'&report='+lstReport.value;
		break;
		case '02':
			var url ='/standard/reports/60/08/rpt_60081341_02.aspx?company_pk='+lstCompany.value+'&acc_pk='+txtACPK.text+'&plc_pk='+txtPLC_PK.text+'&pl_pk='+txtPLPK.text+'&month='+dtMonth.value+'&status='+rdoSlipStatus.value+'&fs='+lstFS.value+'&report='+lstReport.value;
		break;
		case '03':
			var url ='/standard/reports/60/08/rpt_60081341_MC.aspx?company_pk='+lstCompany.value+'&acc_pk='+txtACPK.text+'&plc_pk='+txtPLC_PK.text+'&pl_pk='+txtPLPK.text+'&month='+dtMonth.value+'&status='+rdoSlipStatus.value+'&fs='+lstFS.value+'&report='+lstReport.value;
		break;
		case '05':
			var url ='/standard/reports/60/08/rpt_60081341_CF_PL.aspx?company_pk='+lstCompany.value+'&acc_pk='+txtACPK.text+'&plc_pk='+txtPLC_PK.text+'&pl_pk='+txtPLPK.text+'&month='+dtMonth.value+'&status='+rdoSlipStatus.value+'&fs='+lstFS.value+'&report='+lstReport.value;
		break;
	}
	
	
    System.OpenTargetPage( System.RootURL+url , 'newform' );
}
//----------------------------------------------------------------------------
function OnDataReceive(obj)
{
		
}
//-----------------------------------------------------------------------------
function OnChangeColor()
{
    var ctrl = grdDetail.GetGridControl();
    for (i = 1; i < ctrl.Rows; i++)
	{
	    if(grdDetail.GetGridData(i,g_font)== "B")
        {
	        ctrl.Cell(14, i, 1, i, 18) = false;
	        grdDetail.SetCellBold(i, g_ac_cd, i, g_color, true);
        }
        else if (grdDetail.GetGridData(i,g_font)== "I")
        {
	        grdDetail.SetCellBold(i, g_ac_cd, i, g_color, false);
	        ctrl.Cell(14, i, 1, i, 18) = true; // Chu nghieng
	    }
	    else
	    {
	        ctrl.Cell(14, i, 1, i, 18) = false;
	        grdDetail.SetCellBold(i, g_ac_cd, i, g_color, false);
	    }
	    grdDetail.SetCellBgColor(i, g_ac_cd, i, g_color, Number(grdDetail.GetGridData(i, g_color)));
	}
}
//---------------------------------------------------------------------
function OnFormat()
{
	var fg = grdDetail.GetGridControl();
	fg.ColFormat(2) = "###,###.##R"; 
	fg.ColFormat(3) = "###,###.##R"; 
	fg.ColFormat(4) = "###,###.##R"; 
	fg.ColFormat(5) = "###,###.##R"; 
	fg.ColFormat(6) = "###,###.##R"; 
	fg.ColFormat(7) = "###,###.##R"; 
	fg.ColFormat(8) = "###,###.##R"; 
	fg.ColFormat(9) = "###,###.##R";        
}
//---------------------------------------------------------------------
function FormatGrid()
{
	var fg=grdDetail.GetGridControl();
	fg.rows=fg.rows+2;

	fg.FixedRows = 3;
	fg.FixCols=1;
	fg.MergeCells =3;
	
	fg.MergeCol(g_ac_cd) = true;
	fg.Cell(0, 0, g_ac_cd, 2, g_ac_cd) = "Code";
	
	fg.MergeCol(g_ac_nm) = true;
	fg.Cell(0, 0, g_ac_nm, 2, g_ac_nm) = "Item";
	
	fg.MergeCol(g_ac_lnm) = true;
	fg.Cell(0, 0, g_ac_lnm, 2, g_ac_lnm) = "Item (local)";
	
	fg.MergeCol(g_ac_fnm) = true;
	fg.Cell(0, 0, g_ac_fnm, 2, g_ac_fnm) = "Item (foreign)";
	
	fg.MergeRow(0) =true	;
	fg.Cell(0, 0, g_jan_1, 0, g_jan_6)  = "Jan";
	fg.Cell(0, 0, g_feb_1, 0, g_feb_6)  = "Feb";
	fg.Cell(0, 0, g_mar_1, 0, g_mar_6)  = "Mar";
	fg.Cell(0, 0, g_apr_1, 0, g_apr_6)  = "Apr";
	fg.Cell(0, 0, g_may_1, 0, g_may_6)  = "May";
	fg.Cell(0, 0, g_jun_1, 0, g_jun_6)  = "Jul";
	fg.Cell(0, 0, g_jul_1, 0, g_jul_6)  = "Jun";
	fg.Cell(0, 0, g_aug_1, 0, g_aug_6)  = "Aug";
	fg.Cell(0, 0, g_sep_1, 0, g_sep_6)  = "Sep";
	fg.Cell(0, 0, g_oct_1, 0, g_oct_6)  = "Oct";
	fg.Cell(0, 0, g_nov_1, 0, g_nov_6)  = "Nov";
	fg.Cell(0, 0, g_dec_1, 0, g_dec_6)  = "Dec";
	fg.Cell(0, 0, g_accum_1, 0, g_accum_6)  = "Y - T - D";
	
	fg.MergeRow(1) =true;
	fg.Cell(0, 1, g_jan_1, 1, g_jan_2)  = "Last Year";
	fg.Cell(0, 1, g_jan_3, 1, g_jan_4)  = "This Year";
	fg.Cell(0, 1, g_jan_5, 1, g_jan_6)  = "Budget";
	fg.Cell(0, 1, g_feb_1, 1, g_feb_2)  = "Last Year";
	fg.Cell(0, 1, g_feb_3, 1, g_feb_4)  = "This Year";
	fg.Cell(0, 1, g_feb_5, 1, g_feb_6)  = "Budget";
	fg.Cell(0, 1, g_mar_1, 1, g_mar_2)  = "Last Year";
	fg.Cell(0, 1, g_mar_3, 1, g_mar_4)  = "This Year";
	fg.Cell(0, 1, g_mar_5, 1, g_mar_6)  = "Budget";
	fg.Cell(0, 1, g_apr_1, 1, g_apr_2)  = "Last Year";
	fg.Cell(0, 1, g_apr_3, 1, g_apr_4)  = "This Year";
	fg.Cell(0, 1, g_apr_5, 1, g_apr_6)  = "Budget";
	fg.Cell(0, 1, g_may_1, 1, g_may_2)  = "Last Year";
	fg.Cell(0, 1, g_may_3, 1, g_may_4)  = "This Year";
	fg.Cell(0, 1, g_may_5, 1, g_may_6)  = "Budget";
	fg.Cell(0, 1, g_jun_1, 1, g_jun_2)  = "Last Year";
	fg.Cell(0, 1, g_jun_3, 1, g_jun_4)  = "This Year";
	fg.Cell(0, 1, g_jun_5, 1, g_jun_6)  = "Budget";
	fg.Cell(0, 1, g_jul_1, 1, g_jul_2)  = "Last Year";
	fg.Cell(0, 1, g_jul_3, 1, g_jul_4)  = "This Year";
	fg.Cell(0, 1, g_jul_5, 1, g_jul_6)  = "Budget";
	fg.Cell(0, 1, g_aug_1, 1, g_aug_2)  = "Last Year";
	fg.Cell(0, 1, g_aug_3, 1, g_aug_4)  = "This Year";
	fg.Cell(0, 1, g_aug_5, 1, g_aug_6)  = "Budget";
	fg.Cell(0, 1, g_sep_1, 1, g_sep_2)  = "Last Year";
	fg.Cell(0, 1, g_sep_3, 1, g_sep_4)  = "This Year";
	fg.Cell(0, 1, g_sep_5, 1, g_sep_6)  = "Budget";
	fg.Cell(0, 1, g_oct_1, 1, g_oct_2)  = "Last Year";
	fg.Cell(0, 1, g_oct_3, 1, g_oct_4)  = "This Year";
	fg.Cell(0, 1, g_oct_5, 1, g_oct_6)  = "Budget";
	fg.Cell(0, 1, g_nov_1, 1, g_nov_2)  = "Last Year";
	fg.Cell(0, 1, g_nov_3, 1, g_nov_4)  = "This Year";
	fg.Cell(0, 1, g_nov_5, 1, g_nov_6)  = "Budget";
	fg.Cell(0, 1, g_dec_1, 1, g_dec_2)  = "Last Year";
	fg.Cell(0, 1, g_dec_3, 1, g_dec_4)  = "This Year";
	fg.Cell(0, 1, g_dec_5, 1, g_dec_6)  = "Budget";
	fg.Cell(0, 1, g_accum_1, 1, g_accum_2)  = "Last Year";
	fg.Cell(0, 1, g_accum_3, 1, g_accum_4)  = "This Year";
	fg.Cell(0, 1, g_accum_5, 1, g_accum_6)  = "Budget";
	
	fg.MergeRow(2) =true;
	fg.Cell(0, 2, g_jan_1, 2, g_jan_1)  = "Amount";
	fg.Cell(0, 2, g_jan_2, 2, g_jan_2)  = "%";
	fg.Cell(0, 2, g_jan_3, 2, g_jan_3)  = "Amount";
	fg.Cell(0, 2, g_jan_4, 2, g_jan_4)  = "%";
	fg.Cell(0, 2, g_jan_5, 2, g_jan_5)  = "Amount";
	fg.Cell(0, 2, g_jan_6, 2, g_jan_6)  = "%";
	fg.Cell(0, 2, g_feb_1, 2, g_feb_1)  = "Amount";
	fg.Cell(0, 2, g_feb_2, 2, g_feb_2)  = "%";
	fg.Cell(0, 2, g_feb_3, 2, g_feb_3)  = "Amount";
	fg.Cell(0, 2, g_feb_4, 2, g_feb_4)  = "%";
	fg.Cell(0, 2, g_feb_5, 2, g_feb_5)  = "Amount";
	fg.Cell(0, 2, g_feb_6, 2, g_feb_6)  = "%";
	fg.Cell(0, 2, g_mar_1, 2, g_mar_1)  = "Amount";
	fg.Cell(0, 2, g_mar_2, 2, g_mar_2)  = "%";
	fg.Cell(0, 2, g_mar_3, 2, g_mar_3)  = "Amount";
	fg.Cell(0, 2, g_mar_4, 2, g_mar_4)  = "%";
	fg.Cell(0, 2, g_mar_5, 2, g_mar_5)  = "Amount";
	fg.Cell(0, 2, g_mar_6, 2, g_mar_6)  = "%";
	fg.Cell(0, 2, g_apr_1, 2, g_apr_1)  = "Amount";
	fg.Cell(0, 2, g_apr_2, 2, g_apr_2)  = "%";
	fg.Cell(0, 2, g_apr_3, 2, g_apr_3)  = "Amount";
	fg.Cell(0, 2, g_apr_4, 2, g_apr_4)  = "%";
	fg.Cell(0, 2, g_apr_5, 2, g_apr_5)  = "Amount";
	fg.Cell(0, 2, g_apr_6, 2, g_apr_6)  = "%";
	fg.Cell(0, 2, g_may_1, 2, g_may_1)  = "Amount";
	fg.Cell(0, 2, g_may_2, 2, g_may_2)  = "%";
	fg.Cell(0, 2, g_may_3, 2, g_may_3)  = "Amount";
	fg.Cell(0, 2, g_may_4, 2, g_may_4)  = "%";
	fg.Cell(0, 2, g_may_5, 2, g_may_5)  = "Amount";
	fg.Cell(0, 2, g_may_6, 2, g_may_6)  = "%";
	fg.Cell(0, 2, g_jun_1, 2, g_jun_1)  = "Amount";
	fg.Cell(0, 2, g_jun_2, 2, g_jun_2)  = "%";
	fg.Cell(0, 2, g_jun_3, 2, g_jun_3)  = "Amount";
	fg.Cell(0, 2, g_jun_4, 2, g_jun_4)  = "%";
	fg.Cell(0, 2, g_jun_5, 2, g_jun_5)  = "Amount";
	fg.Cell(0, 2, g_jun_6, 2, g_jun_6)  = "%";
	fg.Cell(0, 2, g_jul_1, 2, g_jul_1)  = "Amount";
	fg.Cell(0, 2, g_jul_2, 2, g_jul_2)  = "%";
	fg.Cell(0, 2, g_jul_3, 2, g_jul_3)  = "Amount";
	fg.Cell(0, 2, g_jul_4, 2, g_jul_4)  = "%";
	fg.Cell(0, 2, g_jul_5, 2, g_jul_5)  = "Amount";
	fg.Cell(0, 2, g_jul_6, 2, g_jul_6)  = "%";
	fg.Cell(0, 2, g_aug_1, 2, g_aug_1)  = "Amount";
	fg.Cell(0, 2, g_aug_2, 2, g_aug_2)  = "%";
	fg.Cell(0, 2, g_aug_3, 2, g_aug_3)  = "Amount";
	fg.Cell(0, 2, g_aug_4, 2, g_aug_4)  = "%";
	fg.Cell(0, 2, g_aug_5, 2, g_aug_5)  = "Amount";
	fg.Cell(0, 2, g_aug_6, 2, g_aug_6)  = "%";
	fg.Cell(0, 2, g_sep_1, 2, g_sep_1)  = "Amount";
	fg.Cell(0, 2, g_sep_2, 2, g_sep_2)  = "%";
	fg.Cell(0, 2, g_sep_3, 2, g_sep_3)  = "Amount";
	fg.Cell(0, 2, g_sep_4, 2, g_sep_4)  = "%";
	fg.Cell(0, 2, g_sep_5, 2, g_sep_5)  = "Amount";
	fg.Cell(0, 2, g_sep_6, 2, g_sep_6)  = "%";
	fg.Cell(0, 2, g_oct_1, 2, g_oct_1)  = "Amount";
	fg.Cell(0, 2, g_oct_2, 2, g_oct_2)  = "%";
	fg.Cell(0, 2, g_oct_3, 2, g_oct_3)  = "Amount";
	fg.Cell(0, 2, g_oct_4, 2, g_oct_4)  = "%";
	fg.Cell(0, 2, g_oct_5, 2, g_oct_5)  = "Amount";
	fg.Cell(0, 2, g_oct_6, 2, g_oct_6)  = "%";
	fg.Cell(0, 2, g_nov_1, 2, g_nov_1)  = "Amount";
	fg.Cell(0, 2, g_nov_2, 2, g_nov_2)  = "%";
	fg.Cell(0, 2, g_nov_3, 2, g_nov_3)  = "Amount";
	fg.Cell(0, 2, g_nov_4, 2, g_nov_4)  = "%";
	fg.Cell(0, 2, g_nov_5, 2, g_nov_5)  = "Amount";
	fg.Cell(0, 2, g_nov_6, 2, g_nov_6)  = "%";
	fg.Cell(0, 2, g_dec_1, 2, g_dec_1)  = "Amount";
	fg.Cell(0, 2, g_dec_2, 2, g_dec_2)  = "%";
	fg.Cell(0, 2, g_dec_3, 2, g_dec_3)  = "Amount";
	fg.Cell(0, 2, g_dec_4, 2, g_dec_4)  = "%";
	fg.Cell(0, 2, g_dec_5, 2, g_dec_5)  = "Amount";
	fg.Cell(0, 2, g_dec_6, 2, g_dec_6)  = "%";
	fg.Cell(0, 2, g_accum_1, 2, g_accum_1)  = "Amount";
	fg.Cell(0, 2, g_accum_2, 2, g_accum_2)  = "%";
	fg.Cell(0, 2, g_accum_3, 2, g_accum_3)  = "Amount";
	fg.Cell(0, 2, g_accum_4, 2, g_accum_4)  = "%";
	fg.Cell(0, 2, g_accum_5, 2, g_accum_5)  = "Amount";
	fg.Cell(0, 2, g_accum_6, 2, g_accum_6)  = "%";
	
	OnChangeColor();
}		
</script>
  <body>
     <!------------------------------------------------------------------------>
  <gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------------------------------->
<gw:data id="dat_gfka00220_1" onreceive=""  > 
        <xml>
            <dso  type="process"   procedure="ac_sel_60080190"  > 
                <input>
                    <input bind="txtPLC_PK" />
                </input> 
                <output>
                    <output bind="txtPLC_CD" />
                    <output bind="txtPLC_NM" />
                </output>
            </dso> 
        </xml> 
   </gw:data><!------------------------------------------------------------------------> 
  
   <gw:data id="dat_gfka00220_2" onreceive=""  > 
        <xml>
            <dso  type="process"   procedure="ac_sel_60080190_2"  > 
                <input>
                    <input bind="txtPLPK" />
                </input> 
                <output>
                    <output bind="txtPLCD" />
                    <output bind="txtPLNM" />
                </output>
            </dso> 
        </xml> 
   </gw:data>
   
<gw:data id="dso_search" onreceive="FormatGrid();" >
        <xml>
            <dso type="grid"  function="ac_sel_60081341_1">
                <input bind="grdDetail">
                    <input bind="lstCompany"/>
                    <input bind="txtACPK"/>
                    <input bind="txtPLC_PK"/>
                    <input bind="txtPLPK"/>
                    <input bind="dtMonth"/>
                    <input bind="rdoSlipStatus"/>
                    <input bind="lstFS"/>
					<input bind="lstReport"/>
                </input>
                <output bind="grdDetail"/>
            </dso>
        </xml>
    </gw:data>     
            <table style="width:100%;height:100%" cellpadding="0" cellspacing="0" border="0">
                <tr style="width:100%;height:10%">
                   <td>
                        <fieldset >
                             <table width="100%" border="0" cellpadding="1" cellspacing="1" >
							   <tr >
									<td align="right" width="8%" >Company</td>
									<td  colspan="" width="20%"><gw:list id="lstCompany" styles="width:100%" /></td>
									<td align="right" width="12%"><a title="Click here to select Account Code" onclick="OnPopUp('ACCT')" href="#tips">Account Code</a></td>
									<td width="30%" colspan=''>
										<table style='width:100%' cellpadding="0" cellspacing="0">
											<tr>
												<td  width="35%"><gw:textbox id="txtACCD" onenterkey="OnSearch()"  text="" styles="width:100%" /><gw:textbox id="txtACPK"  text="" styles="width:100%;display:none" /></td>
												<td width="65%" ><gw:textbox id="txtACNM" onenterkey="OnSearch()" text="" styles="width:100%" /></td>
												<td><gw:imgbtn img="reset" alt="Reset Account Code" id="btnResetAcc" onclick="txtACCD.text='';txtACNM.text='';txtACPK.text='';" /></td>
											</tr>
										</table>
									</td>
									<td width="10%" align='right'><a title="Financial Statement" style='color:black' >F/S</a></td>
									<td width="20%"><gw:list id="lstFS" styles="width:100%" onchange=""/></td>
									<td align=""  ><gw:imgbtn img="search" alt="Search" id="btnSearch" onclick="OnSearch()" /></td>
								</tr>
								<tr>
									<td align="right" >Month</td> 
									<td><gw:datebox id="dtMonth" styles='width:100%'  lang="<%=Session("Lang")%>" type="month" /></td>  
									<td align="right" styles=""><a title="Click here to select PL Center" onclick="OnPopUp('CENTER')" href="#tips">PL Center</a></td>
									<td width="" colspan=''>
										<table style='width:100%' cellpadding="0" cellspacing="0">
											<tr>
												<td width="35%"> <gw:textbox id="txtPLC_CD" text="" styles="width:100%" /></td>
												<td width="65%"><gw:textbox id="txtPLC_NM" text="" styles="width:100%" /><gw:textbox id="txtPLC_PK" styles="display:none; " /></td>
												<td align=""><gw:imgbtn img="reset" alt="Reset" id="btnResetPLCenter" onclick="txtPLC_CD.text='';txtPLC_NM.text='';txtPLC_PK.text='';" /></td>
											</tr> 
										</table>
									</td>
									<td width="" align='right'>Language</td>
									<td width=""><gw:list id="lstLanguage" styles="width:100%" /></td>
									
							 	</tr>
								<tr>
									<td width="" align='right'>Status</td>
									<td > 
										<gw:radio id="rdoSlipStatus"  value="2" > 
											<span value="2" >Confirmed</span>
											<span value="0" >Approved</span>
										</gw:radio >
								    </td>

									<td align="right" ><a title="Click here to select PL Unit" onclick="OnPopUp('PL')" href="#tips">PL Unit</a></td>
									<td width="" >
										<table style='width:100%' cellpadding="0" cellspacing="0">
											<tr>
												<td width="35%" ><gw:textbox id="txtPLCD" text="" styles="width:100%" /></td>
												<td width="65%"><gw:textbox id="txtPLNM" text="" styles="width:100%" /><gw:textbox id="txtPLPK" styles="display:none; " /></td>
												<td align="right"><gw:imgbtn img="reset" alt="Reset" id="btnResetPLUnit" onclick="txtPLCD.text='';txtPLNM.text='';txtPLPK.text='';" /></td>
											</tr>
										</table>
									</td>
									<td width="" align='right'>Option</td>
									<td width=""><gw:list id="lstReport" styles="width:100%" /></td>
									
								</tr>
								<tr>
									<td width="" align='right' colspan='5'>Reports</td>
									<td width=""><gw:list id="lstReport1" styles="width:100%" /></td>
									<td align=""  ><gw:imgbtn img="excel" alt="Print" id="btnPrint" onclick="OnPrint()" /></td>
								</tr>
							</table>     
                        </fieldset>
                   </td>
                </tr>
                <tr style="width:100%;height:90%"> 
                    <td >
                    <!--header='0.Seq|1.Voucher No|2.Trans Date|3.Acc. Code|4.Acc. Name|Acc Code VAS|5.Trans Amount|6.Books Amount|7.Cust ID|8.Customer Name|9.PL Code|10.PL Name|11.Remark|12.Remark2'-->
                                <gw:grid id='grdDetail'
                                    header='Code|Item|Item (local)|Item (foreign)|Jan1|Jan2|Jan3|Jan4|Jan5|Jan6|Feb1|Feb2|Feb3|Feb4|Feb5|Feb6|Mar1|Mar2|Mar3|Mar4|Mar5|Mar6|Apr1|Apr2|Apr3|Apr4|Apr5|Apr6|May1|May2|May3|May4|May5|May6|Jun1|Jun2|Jun3|Jun4|Jun5|Jun6|Jul1|Jul2|Jul3|Jul4|Jul5|Jul6|Aug1|Aug2|Aug3|Aug4|Aug5|Aug6|Sep1|Sep2|Sep3|Sep4|Sep5|Sep6|Oct1|Oct2|Oct3|Oct4|Oct5|Oct6|Nov1|Nov2|Nov3|Nov4|Nov5|Nov6|Dec1|Dec2|Dec3|Dec4|Dec5|Dec6|1|2|3|4|5|6|_font style|_color|_prn_seq'
                                    format='0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0'
									aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    defaults='||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||'
                                   editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    widths='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    sorting='T'
                                    styles='width:100%; height:100%'
									autosize="T"
									oncellclick=""
                                />
                            </td>
                </tr>
                 
            </table>
          
<gw:textbox id="txtUser"  text="" styles="width:100%;display:none" />
<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
  </body>
</html>