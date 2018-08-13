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
	g_font_stype = 4,
	g_prn_color =5,
	g_Total_amount =6,
	g_Total_rate =7,
	g_Num_1 =8,
	g_Ratio_1 = 9,
	g_Num_2 = 10,
	g_Ratio_2 = 11,
	g_Num_3 = 12,
	g_Ratio_3 = 13,
	g_Num_4 = 14,
	g_Ratio_4 = 15,
	g_Num_5 = 16,
	g_Ratio_5 = 17,
	g_Num_6 = 18,
	g_Ratio_6 = 19,
	g_Num_7 = 20,
	g_Ratio_7 = 21,
	g_Num_8 = 22,
	g_Ratio_8 = 23,
	g_Num_9 = 24,
	g_Ratio_9 = 25,
	g_Num_10 = 26,
	g_Ratio_10 = 27,
	g_Num_11 = 28,
	g_Ratio_11 = 29,
	g_Num_12 = 30,
	g_Ratio_12 = 31,
	g_Num_13 = 32,
	g_Ratio_13 = 33,
	g_Num_14 = 34,
	g_Ratio_14 = 35,
	g_Num_15 = 36,
	g_Ratio_15 = 37,
	g_Num_16 = 38,
	g_Ratio_16 = 39,
	g_Num_17 = 40,
	g_Ratio_17 = 41,
	g_Num_18 = 42,
	g_Ratio_18 = 43,
	g_Num_19 = 44,
	g_Ratio_19 = 45,
	g_Num_20 = 46,
	g_Ratio_20 = 47,
	g_Num_21 = 48,
	g_Ratio_21 = 49,
	g_Num_22 = 50,
	g_Ratio_22 = 51,
	g_Num_23 = 52,
	g_Ratio_23 = 53,
	g_Num_24 = 54,
	g_Ratio_24 = 55,
	g_Num_25 = 56,
	g_Ratio_25 = 57,
	g_Num_26 = 58,
	g_Ratio_26 = 59,
	g_Num_27 = 60,
	g_Ratio_27 = 61,
	g_Num_28 = 62,
	g_Ratio_28 = 63,
	g_Num_29 = 64,
	g_Ratio_29 = 65,
	g_Num_30 = 66,
	g_Ratio_30 = 67,
	g_Num_31 = 68,
	g_Ratio_31 = 69,
	g_Num_32 = 70,
	g_Ratio_32 = 71,
	g_Num_33 = 72,
	g_Ratio_33 = 73,
	g_Num_34 = 74,
	g_Ratio_34 = 75,
	g_Num_35 = 76,
	g_Ratio_35 = 77,
	g_Num_36 = 78,
	g_Ratio_36 = 79,
	g_Num_37 = 80,
	g_Ratio_37 = 81,
	g_Num_38 = 82,
	g_Ratio_38 = 83,
	g_Num_39 = 84,
	g_Ratio_39 = 85,
	g_Num_40 = 86,
	g_Ratio_40 = 87,
	g_Num_41 = 88,
	g_Ratio_41 = 89,
	g_Num_42 = 90,
	g_Ratio_42 = 91,
	g_Num_43 = 92,
	g_Ratio_43 = 93,
	g_Num_44 = 94,
	g_Ratio_44 = 95,
	g_Num_45 = 96,
	g_Ratio_45 = 97,
	g_Num_46 = 98,
	g_Ratio_46 = 99,
	g_Num_47 = 100,
	g_Ratio_47 = 101,
	g_Num_48 = 102,
	g_Ratio_48 = 103,
	g_Num_49 = 104,
	g_Ratio_49 = 105,
	g_Num_50 = 106,
	g_Ratio_50 = 107,
	g_Num_51 = 108,
	g_Ratio_51 = 109,
	g_Num_52 = 110,
	g_Ratio_52 = 111,
	g_Num_53 = 112,
	g_Ratio_53 = 113,
	g_Num_54 = 114,
	g_Ratio_54 = 115,
	g_Num_55 = 116,
	g_Ratio_55 = 117,
	g_Num_56 = 118,
	g_Ratio_56 = 119,
	g_Num_57 = 120,
	g_Ratio_57 = 121,
	g_Num_58 = 122,
	g_Ratio_58 = 123,
	g_Num_59 = 124,
	g_Ratio_59 = 125,
	g_Num_60 = 126,
	g_Ratio_60 = 127,
	g_Num_61 = 128,
	g_Ratio_61 = 129,
	g_Num_62 = 130,
	g_Ratio_62 = 131,
	g_Num_63 = 132,
	g_Ratio_63 = 133,
	g_Num_64 = 134,
	g_Ratio_64 = 135,
	g_Num_65 = 136,
	g_Ratio_65 = 137,
	g_Num_66 = 138,
	g_Ratio_66 = 139,
	g_Num_67 = 140,
	g_Ratio_67 = 141,
	g_Num_68 = 142,
	g_Ratio_68 = 143,
	g_Num_69 = 144,
	g_Ratio_69 = 145,
	g_Num_70 = 146,
	g_Ratio_70 = 147,
	g_Num_71 = 148,
	g_Ratio_71 = 149,
	g_Num_72 = 150,
	g_Ratio_72 = 151,
	g_Num_73 = 152,
	g_Ratio_73 = 153,
	g_Num_74 = 154,
	g_Ratio_74 = 155,
	g_Num_75 = 156,
	g_Ratio_75 = 157,
	g_Num_76 = 158,
	g_Ratio_76 = 159,
	g_Num_77 = 160,
	g_Ratio_77 = 161,
	g_Num_78 = 162,
	g_Ratio_78 = 163,
	g_Num_79 = 164,
	g_Ratio_79 = 165,
	g_Num_80 = 166,
	g_Ratio_80 = 167,
	g_Num_81 = 168,
	g_Ratio_81 = 169,
	g_Num_82 = 170,
	g_Ratio_82 = 171,
	g_Num_83 = 172,
	g_Ratio_83 = 173,
	g_Num_84 = 174,
	g_Ratio_84 = 175,
	g_Num_85 = 176,
	g_Ratio_85 = 177,
	g_Num_86 = 178,
	g_Ratio_86 = 179,
	g_Num_87 = 180,
	g_Ratio_87 = 181,
	g_Num_88 = 182,
	g_Ratio_88 = 183,
	g_Num_89 = 184,
	g_Ratio_89 = 185,
	g_Num_90 = 186,
	g_Ratio_90 = 187,
	g_Num_91 = 188,
	g_Ratio_91= 189,
	g_Num_92 = 190,
	g_Ratio_92 = 191,
	g_Num_93 = 192,
	g_Ratio_93 = 193,
	g_Num_94 = 194,
	g_Ratio_94 = 195,
	g_Num_95 = 196,
	g_Ratio_95 = 197,
	g_Num_96 = 198,
	g_Ratio_96 = 199,
	g_Num_97 = 200,
	g_Ratio_97 = 201,
	g_Num_98 = 202 ,
	g_Ratio_98 = 203 ,
	g_Num_99 = 204 ,
	g_Ratio_99 = 205 ,
	g_name_1 = 206 ,
	g_name_2 = 207 ,
	g_name_3 = 208 ,
	g_name_4 = 209 ,
	g_name_5 = 210 ,
	g_name_6 = 211 ,
	g_name_7 = 212 ,
	g_name_8 = 213 ,
	g_name_9 = 214 ,
	g_name_10 = 215 ,
	g_name_11 = 216 ,
	g_name_12 = 217 ,
	g_name_13 = 218 ,
	g_name_14 = 219 ,
	g_name_15 = 220 ,
	g_name_16 = 221 ,
	g_name_17 = 222 ,
	g_name_18 = 223 ,
	g_name_19 = 224 ,
	g_name_20 = 225 ,
	g_name_21 = 226 ,
	g_name_22 = 227 ,
	g_name_23 = 228 ,
	g_name_24 = 229 ,
	g_name_25 = 230 ,
	g_name_26 = 231 ,
	g_name_27 = 232 ,
	g_name_28 = 233 ,
	g_name_29 = 234 ,
	g_name_30 = 235 ,
	g_name_31 = 236 ,
	g_name_32 = 237 ,
	g_name_33 = 238 ,
	g_name_34 = 239 ,
	g_name_35 = 240 ,
	g_name_36 = 241 ,
	g_name_37 = 242 ,
	g_name_38 = 243 ,
	g_name_39 = 244 ,
	g_name_40 = 245 ,
	g_name_41 = 246 ,
	g_name_42 = 247 ,
	g_name_43 = 248 ,
	g_name_44 = 249 ,
	g_name_45 = 250 ,
	g_name_46 = 251 ,
	g_name_47 = 252 ,
	g_name_48 = 253 ,
	g_name_49 = 254 ,
	g_name_50 = 255 ,
	g_name_51 = 256 ,
	g_name_52 = 257 ,
	g_name_53 = 258 ,
	g_name_54 = 259 ,
	g_name_55 = 260 ,
	g_name_56 = 261 ,
	g_name_57 = 262 ,
	g_name_58 = 263 ,
	g_name_59 = 264 ,
	g_name_60 = 265 ,
	g_name_61 = 266 ,
	g_name_62 = 267 ,
	g_name_63 = 268 ,
	g_name_64 = 269 ,
	g_name_65 = 270 ,
	g_name_66 = 271 ,
	g_name_67 = 272 ,
	g_name_68 = 273 ,
	g_name_69 = 274 ,
	g_name_70 = 275 ,
	g_name_71 = 276 ,
	g_name_72 = 277 ,
	g_name_73 = 278 ,
	g_name_74 = 279 ,
	g_name_75 = 280 ,
	g_name_76 = 281 ,
	g_name_77 = 282 ,
	g_name_78 = 283 ,
	g_name_79 = 284 ,
	g_name_80 = 285 ,
	g_name_81 = 286 ,
	g_name_82 = 287 ,
	g_name_83 = 288 ,
	g_name_84 = 289 ,
	g_name_85 = 290 ,
	g_name_86 = 291 ,
	g_name_87 = 292 ,
	g_name_88 = 293 ,
	g_name_89 = 294 ,
	g_name_90 = 295 ,
	g_name_91 = 296 ,
	g_name_92 = 297 ,
	g_name_93 = 298 ,
	g_name_94 = 299 ,
	g_name_95 = 300 ,
	g_name_96 = 301 ,
	g_name_97 = 302 ,
	g_name_98 = 303 ,
	g_name_99 = 304 ;
//-----------------------------------------
function BodyInit()
{
    txtUser.text="<%=Session("User_ID") %>"; 
    BindingData(); 
    System.Translate(document); 
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	//ChangeReport();
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
	var ls_Report1 = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK055' and d.use_yn = 'Y' ORDER BY D.DEF_YN DESC, D.ORD")%>"; 
	var dataStatus = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='ACBG0202' and d.use_yn = 'Y' ORDER BY D.DEF_YN DESC, D.ORD")%>"; 
    lstCompany.SetDataText(ls_data);
    lstLanguage.SetDataText(ls_data1); 
	lstReport.SetDataText(dataStatus); 
	lstFS.SetDataText(ls_FS); 
	grdDetail.GetGridControl().FrozenCols =2;
	lstReport1.SetDataText(ls_Report1); 
	lstReport1.SetDataText('BS'); 
	FormatGrid_2();
	
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
   if (lstReport1.GetData() ==  "PL2")
	{
		grdDetail.style.display='';
		grdDetail2.style.display='none';
		//alert(1);
		dso_search.Call("SELECT");
	}else{
		grdDetail.style.display='none';
		grdDetail2.style.display='';
		//alert(2);
		dso_search_type2.Call("SELECT");
	}
}
//-------------------------------------------------------------------------------------------
function OnPrint()
{
	switch(lstReport1.value)
	{
		case 'BS':
			var url ='/standard/reports/60/08/rpt_60081342_BS.aspx?company_pk='+lstCompany.value+'&acc_pk='+txtACPK.text+'&plc_pk='+txtPLC_PK.text+'&pl_pk='+txtPLPK.text+'&month='+dtMonth.value+'&status='+rdoSlipStatus.value+'&fs='+lstFS.value+'&report='+lstReport.value + '&p_exrate=' + txtrate1.GetData();
		break;
		case 'PL1':
			var url ='/standard/reports/60/08/rpt_60081342_PL1.aspx?company_pk='+lstCompany.value+'&acc_pk='+txtACPK.text+'&plc_pk='+txtPLC_PK.text+'&pl_pk='+txtPLPK.text+'&month='+dtMonth.value+'&status='+rdoSlipStatus.value+'&fs='+lstFS.value+'&report='+lstReport.value + '&p_exrate=' + txtrate1.GetData();
		break;
		case 'PL2':
			var url ='/standard/reports/60/08/rpt_60081342_PL2.aspx?company_pk='+lstCompany.value+'&acc_pk='+txtACPK.text+'&plc_pk='+txtPLC_PK.text+'&pl_pk='+txtPLPK.text+'&month='+dtMonth.value+'&status='+rdoSlipStatus.value+'&fs='+lstFS.value+'&report='+lstReport.value + '&p_exrate=' + txtrate1.GetData();
		break;
		case 'MC':
			var url ='/standard/reports/60/08/rpt_60081342_MC.aspx?company_pk='+lstCompany.value+'&acc_pk='+txtACPK.text+'&plc_pk='+txtPLC_PK.text+'&pl_pk='+txtPLPK.text+'&month='+dtMonth.value+'&status='+rdoSlipStatus.value+'&fs='+lstFS.value+'&report='+lstReport.value + '&p_exrate=' + txtrate1.GetData();
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
	    if(grdDetail.GetGridData(i,g_font_stype)== "B")
        {
	        ctrl.Cell(14, i, 1, i, 18) = false;
	        grdDetail.SetCellBold(i, g_ac_cd, i, g_Ratio_99, true);
        }
        else if (grdDetail.GetGridData(i,g_font_stype)== "I")
        {
	        grdDetail.SetCellBold(i, g_ac_cd, i, g_Ratio_99, false);
	        ctrl.Cell(14, i, 1, i, 18) = true; // Chu nghieng
	    }
	    else
	    {
	        ctrl.Cell(14, i, 1, i, 18) = false;
	        grdDetail.SetCellBold(i, g_ac_cd, i, g_prn_color, false);
	    }
	    grdDetail.SetCellBgColor(i, g_ac_cd, i, g_Ratio_99, Number(grdDetail.GetGridData(i, g_prn_color)));
	}
}
//---------------------------------------------------------------------
function FormatGrid_2()
{
	var fg=grdDetail2.GetGridControl();
		
	fg.FixedRows = 2
	fg.MergeCells = 5
	
	fg.MergeCol(g_ac_cd) = true;
	fg.Cell(0, 0, g_ac_cd, 1, g_ac_cd) = "Code";
	
	fg.MergeCol(g_ac_nm) = true;
	fg.Cell(0, 0, g_ac_nm, 1, g_ac_nm) = "Item";
	
	fg.MergeCol(g_ac_lnm) = true;
	fg.Cell(0, 0, g_ac_lnm, 1, g_ac_lnm) = "Item (local)";
	
	fg.MergeCol(g_ac_fnm) = true;
	fg.Cell(0, 0, g_ac_fnm, 1, g_ac_fnm) = "Item (foreign)";
	
	fg.MergeCol(10) = true;
	fg.Cell(0, 0, 10, 1, 10) = "Remark";
	
	fg.MergeRow(0) =true	;
	fg.Cell(0, 0, g_Total_amount, 0, g_Total_rate)  = "VND";
	fg.Cell(0, 0, g_Num_1, 0, g_Ratio_1)  = "USD";
	fg.Cell(0, 1, g_Total_amount, 1, g_Total_amount)  = "Amount";
	fg.Cell(0, 1, g_Total_rate, 1, g_Total_rate)  = "%";
	fg.Cell(0, 1, g_Num_1, 1, g_Num_1)  = "Amount";
	fg.Cell(0, 1, g_Ratio_1, 1, g_Ratio_1)  = "%";
	
	var ctrl = grdDetail2.GetGridControl();
    for (i = 1; i < ctrl.Rows; i++)
	{
	    if(grdDetail2.GetGridData(i,g_font_stype)== "B")
        {
	        grdDetail2.SetCellBold(i, g_ac_cd, i, 10, true);
        }
        else if (grdDetail2.GetGridData(i,g_font_stype)== "I")
        {
	        grdDetail2.SetCellBold(i, g_ac_cd, i, 10, false);
	    }
	    else
	    {
	        grdDetail2.SetCellBold(i, g_ac_cd, i, g_prn_color, false);
	    }
	    grdDetail2.SetCellBgColor(i, g_ac_cd, i, 10, Number(grdDetail2.GetGridData(i, g_prn_color)));
	}
	
}	

//--------------------------------------------------------
function FormatGrid()
{
	var fg=grdDetail.GetGridControl();
		
	fg.FixedRows = 2
	fg.MergeCells = 5
	
	fg.MergeCol(g_ac_cd) = true;
	fg.Cell(0, 0, g_ac_cd, 1, g_ac_cd) = "Code";
	
	fg.MergeCol(g_ac_nm) = true;
	fg.Cell(0, 0, g_ac_nm, 1, g_ac_nm) = "Item";
	
	fg.MergeCol(g_ac_lnm) = true;
	fg.Cell(0, 0, g_ac_lnm, 1, g_ac_lnm) = "Item (local)";
	
	fg.MergeCol(g_ac_fnm) = true;
	fg.Cell(0, 0, g_ac_fnm, 1, g_ac_fnm) = "Item (foreign)";
	
	fg.MergeRow(0) =true	;
	fg.Cell(0, 0, g_Total_amount, 0, g_Total_rate)  = dtMonth.text;
	fg.Cell(0, 0, g_Num_1, 0, g_Ratio_1)  = grdDetail.GetGridData(1,g_name_1);
	fg.Cell(0, 0, g_Num_2, 0, g_Ratio_2)  = grdDetail.GetGridData(1,g_name_2);
	fg.Cell(0, 0, g_Num_3, 0, g_Ratio_3)  = grdDetail.GetGridData(1,g_name_3);
	fg.Cell(0, 0, g_Num_4, 0, g_Ratio_4)  = grdDetail.GetGridData(1,g_name_4);
	fg.Cell(0, 0, g_Num_5, 0, g_Ratio_5)  = grdDetail.GetGridData(1,g_name_5);
	fg.Cell(0, 0, g_Num_6, 0, g_Ratio_6)  = grdDetail.GetGridData(1,g_name_6);
	fg.Cell(0, 0, g_Num_7, 0, g_Ratio_7)  = grdDetail.GetGridData(1,g_name_7);
	fg.Cell(0, 0, g_Num_8, 0, g_Ratio_8)  = grdDetail.GetGridData(1,g_name_8);
	fg.Cell(0, 0, g_Num_9, 0, g_Ratio_9)  = grdDetail.GetGridData(1,g_name_9);
	fg.Cell(0, 0, g_Num_10, 0, g_Ratio_10)  = grdDetail.GetGridData(1,g_name_10);
	fg.Cell(0, 0, g_Num_11, 0, g_Ratio_11)  = grdDetail.GetGridData(1,g_name_11);
	fg.Cell(0, 0, g_Num_12, 0, g_Ratio_12)  = grdDetail.GetGridData(1,g_name_12);
	fg.Cell(0, 0, g_Num_13, 0, g_Ratio_13)  = grdDetail.GetGridData(1,g_name_13);
	fg.Cell(0, 0, g_Num_14, 0, g_Ratio_14)  = grdDetail.GetGridData(1,g_name_14);
	fg.Cell(0, 0, g_Num_15, 0, g_Ratio_15)  = grdDetail.GetGridData(1,g_name_15);
	fg.Cell(0, 0, g_Num_16, 0, g_Ratio_16)  = grdDetail.GetGridData(1,g_name_16);
	fg.Cell(0, 0, g_Num_17, 0, g_Ratio_17)  = grdDetail.GetGridData(1,g_name_17);
	fg.Cell(0, 0, g_Num_18, 0, g_Ratio_18)  = grdDetail.GetGridData(1,g_name_18);
	fg.Cell(0, 0, g_Num_19, 0, g_Ratio_19)  = grdDetail.GetGridData(1,g_name_19);
	fg.Cell(0, 0, g_Num_20, 0, g_Ratio_20)  = grdDetail.GetGridData(1,g_name_20);
	fg.Cell(0, 0, g_Num_21, 0, g_Ratio_21)  = grdDetail.GetGridData(1,g_name_21);
	fg.Cell(0, 0, g_Num_22, 0, g_Ratio_22)  = grdDetail.GetGridData(1,g_name_22);
	fg.Cell(0, 0, g_Num_23, 0, g_Ratio_23)  = grdDetail.GetGridData(1,g_name_23);
	fg.Cell(0, 0, g_Num_24, 0, g_Ratio_24)  = grdDetail.GetGridData(1,g_name_24);
	fg.Cell(0, 0, g_Num_25, 0, g_Ratio_25)  = grdDetail.GetGridData(1,g_name_25);
	fg.Cell(0, 0, g_Num_26, 0, g_Ratio_26)  = grdDetail.GetGridData(1,g_name_26);
	fg.Cell(0, 0, g_Num_27, 0, g_Ratio_27)  = grdDetail.GetGridData(1,g_name_27);
	fg.Cell(0, 0, g_Num_28, 0, g_Ratio_28)  = grdDetail.GetGridData(1,g_name_28);
	fg.Cell(0, 0, g_Num_29, 0, g_Ratio_29)  = grdDetail.GetGridData(1,g_name_29);
	fg.Cell(0, 0, g_Num_30, 0, g_Ratio_30)  = grdDetail.GetGridData(1,g_name_30);
	fg.Cell(0, 0, g_Num_31, 0, g_Ratio_31)  = grdDetail.GetGridData(1,g_name_31);
	fg.Cell(0, 0, g_Num_32, 0, g_Ratio_32)  = grdDetail.GetGridData(1,g_name_32);
	fg.Cell(0, 0, g_Num_33, 0, g_Ratio_33)  = grdDetail.GetGridData(1,g_name_33);
	fg.Cell(0, 0, g_Num_34, 0, g_Ratio_34)  = grdDetail.GetGridData(1,g_name_34);
	fg.Cell(0, 0, g_Num_35, 0, g_Ratio_35)  = grdDetail.GetGridData(1,g_name_35);
	fg.Cell(0, 0, g_Num_36, 0, g_Ratio_36)  = grdDetail.GetGridData(1,g_name_36);
	fg.Cell(0, 0, g_Num_37, 0, g_Ratio_37)  = grdDetail.GetGridData(1,g_name_37);
	fg.Cell(0, 0, g_Num_38, 0, g_Ratio_38)  = grdDetail.GetGridData(1,g_name_38);
	fg.Cell(0, 0, g_Num_39, 0, g_Ratio_39)  = grdDetail.GetGridData(1,g_name_39);
	fg.Cell(0, 0, g_Num_40, 0, g_Ratio_40)  = grdDetail.GetGridData(1,g_name_40);
	fg.Cell(0, 0, g_Num_41, 0, g_Ratio_41)  = grdDetail.GetGridData(1,g_name_41);
	fg.Cell(0, 0, g_Num_42, 0, g_Ratio_42)  = grdDetail.GetGridData(1,g_name_42);
	fg.Cell(0, 0, g_Num_43, 0, g_Ratio_43)  = grdDetail.GetGridData(1,g_name_43);
	fg.Cell(0, 0, g_Num_44, 0, g_Ratio_44)  = grdDetail.GetGridData(1,g_name_44);
	fg.Cell(0, 0, g_Num_45, 0, g_Ratio_45)  = grdDetail.GetGridData(1,g_name_45);
	fg.Cell(0, 0, g_Num_46, 0, g_Ratio_46)  = grdDetail.GetGridData(1,g_name_46);
	fg.Cell(0, 0, g_Num_47, 0, g_Ratio_47)  = grdDetail.GetGridData(1,g_name_47);
	fg.Cell(0, 0, g_Num_48, 0, g_Ratio_48)  = grdDetail.GetGridData(1,g_name_48);
	fg.Cell(0, 0, g_Num_49, 0, g_Ratio_49)  = grdDetail.GetGridData(1,g_name_49);
	fg.Cell(0, 0, g_Num_50, 0, g_Ratio_50)  = grdDetail.GetGridData(1,g_name_50);
	fg.Cell(0, 0, g_Num_51, 0, g_Ratio_51)  = grdDetail.GetGridData(1,g_name_51);
	fg.Cell(0, 0, g_Num_52, 0, g_Ratio_52)  = grdDetail.GetGridData(1,g_name_52);
	fg.Cell(0, 0, g_Num_53, 0, g_Ratio_53)  = grdDetail.GetGridData(1,g_name_53);
	fg.Cell(0, 0, g_Num_54, 0, g_Ratio_54)  = grdDetail.GetGridData(1,g_name_54);
	fg.Cell(0, 0, g_Num_55, 0, g_Ratio_55)  = grdDetail.GetGridData(1,g_name_55);
	fg.Cell(0, 0, g_Num_56, 0, g_Ratio_56)  = grdDetail.GetGridData(1,g_name_56);
	fg.Cell(0, 0, g_Num_57, 0, g_Ratio_57)  = grdDetail.GetGridData(1,g_name_57);
	fg.Cell(0, 0, g_Num_58, 0, g_Ratio_58)  = grdDetail.GetGridData(1,g_name_58);
	fg.Cell(0, 0, g_Num_59, 0, g_Ratio_59)  = grdDetail.GetGridData(1,g_name_59);
	fg.Cell(0, 0, g_Num_60, 0, g_Ratio_60)  = grdDetail.GetGridData(1,g_name_60);
	fg.Cell(0, 0, g_Num_61, 0, g_Ratio_61)  = grdDetail.GetGridData(1,g_name_61);
	fg.Cell(0, 0, g_Num_62, 0, g_Ratio_62)  = grdDetail.GetGridData(1,g_name_62);
	fg.Cell(0, 0, g_Num_63, 0, g_Ratio_63)  = grdDetail.GetGridData(1,g_name_63);
	fg.Cell(0, 0, g_Num_64, 0, g_Ratio_64)  = grdDetail.GetGridData(1,g_name_64);
	fg.Cell(0, 0, g_Num_65, 0, g_Ratio_65)  = grdDetail.GetGridData(1,g_name_65);
	fg.Cell(0, 0, g_Num_66, 0, g_Ratio_66)  = grdDetail.GetGridData(1,g_name_66);
	fg.Cell(0, 0, g_Num_67, 0, g_Ratio_67)  = grdDetail.GetGridData(1,g_name_67);
	fg.Cell(0, 0, g_Num_68, 0, g_Ratio_68)  = grdDetail.GetGridData(1,g_name_68);
	fg.Cell(0, 0, g_Num_69, 0, g_Ratio_69)  = grdDetail.GetGridData(1,g_name_69);
	fg.Cell(0, 0, g_Num_70, 0, g_Ratio_70)  = grdDetail.GetGridData(1,g_name_70);
	fg.Cell(0, 0, g_Num_71, 0, g_Ratio_71)  = grdDetail.GetGridData(1,g_name_71);
	fg.Cell(0, 0, g_Num_72, 0, g_Ratio_72)  = grdDetail.GetGridData(1,g_name_72);
	fg.Cell(0, 0, g_Num_73, 0, g_Ratio_73)  = grdDetail.GetGridData(1,g_name_73);
	fg.Cell(0, 0, g_Num_74, 0, g_Ratio_74)  = grdDetail.GetGridData(1,g_name_74);
	fg.Cell(0, 0, g_Num_75, 0, g_Ratio_75)  = grdDetail.GetGridData(1,g_name_75);
	fg.Cell(0, 0, g_Num_76, 0, g_Ratio_76)  = grdDetail.GetGridData(1,g_name_76);
	fg.Cell(0, 0, g_Num_77, 0, g_Ratio_77)  = grdDetail.GetGridData(1,g_name_77);
	fg.Cell(0, 0, g_Num_78, 0, g_Ratio_78)  = grdDetail.GetGridData(1,g_name_78);
	fg.Cell(0, 0, g_Num_79, 0, g_Ratio_79)  = grdDetail.GetGridData(1,g_name_79);
	fg.Cell(0, 0, g_Num_80, 0, g_Ratio_80)  = grdDetail.GetGridData(1,g_name_80);
	fg.Cell(0, 0, g_Num_81, 0, g_Ratio_81)  = grdDetail.GetGridData(1,g_name_81);
	fg.Cell(0, 0, g_Num_82, 0, g_Ratio_82)  = grdDetail.GetGridData(1,g_name_82);
	fg.Cell(0, 0, g_Num_83, 0, g_Ratio_83)  = grdDetail.GetGridData(1,g_name_83);
	fg.Cell(0, 0, g_Num_84, 0, g_Ratio_84)  = grdDetail.GetGridData(1,g_name_84);
	fg.Cell(0, 0, g_Num_85, 0, g_Ratio_85)  = grdDetail.GetGridData(1,g_name_85);
	fg.Cell(0, 0, g_Num_86, 0, g_Ratio_86)  = grdDetail.GetGridData(1,g_name_86);
	fg.Cell(0, 0, g_Num_87, 0, g_Ratio_87)  = grdDetail.GetGridData(1,g_name_87);
	fg.Cell(0, 0, g_Num_88, 0, g_Ratio_88)  = grdDetail.GetGridData(1,g_name_88);
	fg.Cell(0, 0, g_Num_89, 0, g_Ratio_89)  = grdDetail.GetGridData(1,g_name_89);
	fg.Cell(0, 0, g_Num_90, 0, g_Ratio_90)  = grdDetail.GetGridData(1,g_name_90);
	fg.Cell(0, 0, g_Num_91, 0, g_Ratio_91)  = grdDetail.GetGridData(1,g_name_91);
	fg.Cell(0, 0, g_Num_92, 0, g_Ratio_92)  = grdDetail.GetGridData(1,g_name_92);
	fg.Cell(0, 0, g_Num_93, 0, g_Ratio_93)  = grdDetail.GetGridData(1,g_name_93);
	fg.Cell(0, 0, g_Num_94, 0, g_Ratio_94)  = grdDetail.GetGridData(1,g_name_94);
	fg.Cell(0, 0, g_Num_95, 0, g_Ratio_95)  = grdDetail.GetGridData(1,g_name_95);
	fg.Cell(0, 0, g_Num_96, 0, g_Ratio_96)  = grdDetail.GetGridData(1,g_name_96);
	fg.Cell(0, 0, g_Num_97, 0, g_Ratio_97)  = grdDetail.GetGridData(1,g_name_97);
	fg.Cell(0, 0, g_Num_98, 0, g_Ratio_98)  = grdDetail.GetGridData(1,g_name_98);
	fg.Cell(0, 0, g_Num_99, 0, g_Ratio_99)  = grdDetail.GetGridData(1,g_name_99);
	
	fg.MergeRow(1) =true;
	
	fg.Cell(0, 1, g_Total_amount, 1, g_Total_amount)  = "Amount";
	fg.Cell(0, 1, g_Total_rate, 1, g_Total_rate)  = "%";
	fg.Cell(0, 1, g_Num_1, 1, g_Num_1)  = "Amount";
	fg.Cell(0, 1, g_Ratio_1, 1, g_Ratio_1)  = "%";
	fg.Cell(0, 1, g_Num_2, 1, g_Num_2)  = "Amount";
	fg.Cell(0, 1, g_Ratio_2, 1, g_Ratio_2)  = "%";
	fg.Cell(0, 1, g_Num_3, 1, g_Num_3)  = "Amount";
    fg.Cell(0, 1, g_Ratio_3, 1, g_Ratio_3)  = "%";
    fg.Cell(0, 1, g_Num_4, 1, g_Num_4)  = "Amount";
    fg.Cell(0, 1, g_Ratio_4, 1, g_Ratio_4)  = "%";
    fg.Cell(0, 1, g_Num_5, 1, g_Num_5)  = "Amount";
    fg.Cell(0, 1, g_Ratio_5, 1, g_Ratio_5)  = "%";
    fg.Cell(0, 1, g_Num_6, 1, g_Num_6)  = "Amount";
    fg.Cell(0, 1, g_Ratio_6, 1, g_Ratio_6)  = "%";
    fg.Cell(0, 1, g_Num_7, 1, g_Num_7)  = "Amount";
    fg.Cell(0, 1, g_Ratio_7, 1, g_Ratio_7)  = "%";
    fg.Cell(0, 1, g_Num_8, 1, g_Num_8)  = "Amount";
    fg.Cell(0, 1, g_Ratio_8, 1, g_Ratio_8)  = "%";
    fg.Cell(0, 1, g_Num_9, 1, g_Num_9)  = "Amount";
    fg.Cell(0, 1, g_Ratio_9, 1, g_Ratio_9)  = "%";
    fg.Cell(0, 1, g_Num_10, 1, g_Num_10)  = "Amount";
    fg.Cell(0, 1, g_Ratio_10, 1, g_Ratio_10)  = "%";
    fg.Cell(0, 1, g_Num_11, 1, g_Num_11)  = "Amount";
    fg.Cell(0, 1, g_Ratio_11, 1, g_Ratio_11)  = "%";
    fg.Cell(0, 1, g_Num_12, 1, g_Num_12)  = "Amount";
    fg.Cell(0, 1, g_Ratio_12, 1, g_Ratio_12)  = "%";
    fg.Cell(0, 1, g_Num_13, 1, g_Num_13)  = "Amount";
    fg.Cell(0, 1, g_Ratio_13, 1, g_Ratio_13)  = "%";
    fg.Cell(0, 1, g_Num_14, 1, g_Num_14)  = "Amount";
    fg.Cell(0, 1, g_Ratio_14, 1, g_Ratio_14)  = "%";
    fg.Cell(0, 1, g_Num_15, 1, g_Num_15)  = "Amount";
    fg.Cell(0, 1, g_Ratio_15, 1, g_Ratio_15)  = "%";
    fg.Cell(0, 1, g_Num_16, 1, g_Num_16)  = "Amount";
    fg.Cell(0, 1, g_Ratio_16, 1, g_Ratio_16)  = "%";
    fg.Cell(0, 1, g_Num_17, 1, g_Num_17)  = "Amount";
    fg.Cell(0, 1, g_Ratio_17, 1, g_Ratio_17)  = "%";
    fg.Cell(0, 1, g_Num_18, 1, g_Num_18)  = "Amount";
    fg.Cell(0, 1, g_Ratio_18, 1, g_Ratio_18)  = "%";
    fg.Cell(0, 1, g_Num_19, 1, g_Num_19)  = "Amount";
    fg.Cell(0, 1, g_Ratio_19, 1, g_Ratio_19)  = "%";
    fg.Cell(0, 1, g_Num_20, 1, g_Num_20)  = "Amount";
    fg.Cell(0, 1, g_Ratio_20, 1, g_Ratio_20)  = "%";
    fg.Cell(0, 1, g_Num_21, 1, g_Num_21)  = "Amount";
    fg.Cell(0, 1, g_Ratio_21, 1, g_Ratio_21)  = "%";
    fg.Cell(0, 1, g_Num_22, 1, g_Num_22)  = "Amount";
    fg.Cell(0, 1, g_Ratio_22, 1, g_Ratio_22)  = "%";
    fg.Cell(0, 1, g_Num_23, 1, g_Num_23)  = "Amount";
    fg.Cell(0, 1, g_Ratio_23, 1, g_Ratio_23)  = "%";
    fg.Cell(0, 1, g_Num_24, 1, g_Num_24)  = "Amount";
    fg.Cell(0, 1, g_Ratio_24, 1, g_Ratio_24)  = "%";
    fg.Cell(0, 1, g_Num_25, 1, g_Num_25)  = "Amount";
    fg.Cell(0, 1, g_Ratio_25, 1, g_Ratio_25)  = "%";
    fg.Cell(0, 1, g_Num_26, 1, g_Num_26)  = "Amount";
    fg.Cell(0, 1, g_Ratio_26, 1, g_Ratio_26)  = "%";
    fg.Cell(0, 1, g_Num_27, 1, g_Num_27)  = "Amount";
    fg.Cell(0, 1, g_Ratio_27, 1, g_Ratio_27)  = "%";
    fg.Cell(0, 1, g_Num_28, 1, g_Num_28)  = "Amount";
    fg.Cell(0, 1, g_Ratio_28, 1, g_Ratio_28)  = "%";
    fg.Cell(0, 1, g_Num_29, 1, g_Num_29)  = "Amount";
    fg.Cell(0, 1, g_Ratio_29, 1, g_Ratio_29)  = "%";
    fg.Cell(0, 1, g_Num_30, 1, g_Num_30)  = "Amount";
    fg.Cell(0, 1, g_Ratio_30, 1, g_Ratio_30)  = "%";
    fg.Cell(0, 1, g_Num_31, 1, g_Num_31)  = "Amount";
    fg.Cell(0, 1, g_Ratio_31, 1, g_Ratio_31)  = "%";
    fg.Cell(0, 1, g_Num_32, 1, g_Num_32)  = "Amount";
    fg.Cell(0, 1, g_Ratio_32, 1, g_Ratio_32)  = "%";
    fg.Cell(0, 1, g_Num_33, 1, g_Num_33)  = "Amount";
    fg.Cell(0, 1, g_Ratio_33, 1, g_Ratio_33)  = "%";
    fg.Cell(0, 1, g_Num_34, 1, g_Num_34)  = "Amount";
    fg.Cell(0, 1, g_Ratio_34, 1, g_Ratio_34)  = "%";
    fg.Cell(0, 1, g_Num_35, 1, g_Num_35)  = "Amount";
    fg.Cell(0, 1, g_Ratio_35, 1, g_Ratio_35)  = "%";
    fg.Cell(0, 1, g_Num_36, 1, g_Num_36)  = "Amount";
    fg.Cell(0, 1, g_Ratio_36, 1, g_Ratio_36)  = "%";
    fg.Cell(0, 1, g_Num_37, 1, g_Num_37)  = "Amount";
    fg.Cell(0, 1, g_Ratio_37, 1, g_Ratio_37)  = "%";
    fg.Cell(0, 1, g_Num_38, 1, g_Num_38)  = "Amount";
    fg.Cell(0, 1, g_Ratio_38, 1, g_Ratio_38)  = "%";
    fg.Cell(0, 1, g_Num_39, 1, g_Num_39)  = "Amount";
    fg.Cell(0, 1, g_Ratio_39, 1, g_Ratio_39)  = "%";
    fg.Cell(0, 1, g_Num_40, 1, g_Num_40)  = "Amount";
    fg.Cell(0, 1, g_Ratio_40, 1, g_Ratio_40)  = "%";
    fg.Cell(0, 1, g_Num_41, 1, g_Num_41)  = "Amount";
    fg.Cell(0, 1, g_Ratio_41, 1, g_Ratio_41)  = "%";
    fg.Cell(0, 1, g_Num_42, 1, g_Num_42)  = "Amount";
    fg.Cell(0, 1, g_Ratio_42, 1, g_Ratio_42)  = "%";
    fg.Cell(0, 1, g_Num_43, 1, g_Num_43)  = "Amount";
    fg.Cell(0, 1, g_Ratio_43, 1, g_Ratio_43)  = "%";
    fg.Cell(0, 1, g_Num_44, 1, g_Num_44)  = "Amount";
    fg.Cell(0, 1, g_Ratio_44, 1, g_Ratio_44)  = "%";
    fg.Cell(0, 1, g_Num_45, 1, g_Num_45)  = "Amount";
    fg.Cell(0, 1, g_Ratio_45, 1, g_Ratio_45)  = "%";
    fg.Cell(0, 1, g_Num_46, 1, g_Num_46)  = "Amount";
    fg.Cell(0, 1, g_Ratio_46, 1, g_Ratio_46)  = "%";
    fg.Cell(0, 1, g_Num_47, 1, g_Num_47)  = "Amount";
    fg.Cell(0, 1, g_Ratio_47, 1, g_Ratio_47)  = "%";
    fg.Cell(0, 1, g_Num_48, 1, g_Num_48)  = "Amount";
    fg.Cell(0, 1, g_Ratio_48, 1, g_Ratio_48)  = "%";
    fg.Cell(0, 1, g_Num_49, 1, g_Num_49)  = "Amount";
    fg.Cell(0, 1, g_Ratio_49, 1, g_Ratio_49)  = "%";
    fg.Cell(0, 1, g_Num_50, 1, g_Num_50)  = "Amount";
    fg.Cell(0, 1, g_Ratio_50, 1, g_Ratio_50)  = "%";
    fg.Cell(0, 1, g_Num_51, 1, g_Num_51)  = "Amount";
    fg.Cell(0, 1, g_Ratio_51, 1, g_Ratio_51)  = "%";
    fg.Cell(0, 1, g_Num_52, 1, g_Num_52)  = "Amount";
    fg.Cell(0, 1, g_Ratio_52, 1, g_Ratio_52)  = "%";
    fg.Cell(0, 1, g_Num_53, 1, g_Num_53)  = "Amount";
    fg.Cell(0, 1, g_Ratio_53, 1, g_Ratio_53)  = "%";
    fg.Cell(0, 1, g_Num_54, 1, g_Num_54)  = "Amount";
    fg.Cell(0, 1, g_Ratio_54, 1, g_Ratio_54)  = "%";
    fg.Cell(0, 1, g_Num_55, 1, g_Num_55)  = "Amount";
    fg.Cell(0, 1, g_Ratio_55, 1, g_Ratio_55)  = "%";
    fg.Cell(0, 1, g_Num_56, 1, g_Num_56)  = "Amount";
    fg.Cell(0, 1, g_Ratio_56, 1, g_Ratio_56)  = "%";
    fg.Cell(0, 1, g_Num_57, 1, g_Num_57)  = "Amount";
    fg.Cell(0, 1, g_Ratio_57, 1, g_Ratio_57)  = "%";
    fg.Cell(0, 1, g_Num_58, 1, g_Num_58)  = "Amount";
    fg.Cell(0, 1, g_Ratio_58, 1, g_Ratio_58)  = "%";
    fg.Cell(0, 1, g_Num_59, 1, g_Num_59)  = "Amount";
    fg.Cell(0, 1, g_Ratio_59, 1, g_Ratio_59)  = "%";
    fg.Cell(0, 1, g_Num_60, 1, g_Num_60)  = "Amount";
    fg.Cell(0, 1, g_Ratio_60, 1, g_Ratio_60)  = "%";
    fg.Cell(0, 1, g_Num_61, 1, g_Num_61)  = "Amount";
    fg.Cell(0, 1, g_Ratio_61, 1, g_Ratio_61)  = "%";
    fg.Cell(0, 1, g_Num_62, 1, g_Num_62)  = "Amount";
    fg.Cell(0, 1, g_Ratio_62, 1, g_Ratio_62)  = "%";
    fg.Cell(0, 1, g_Num_63, 1, g_Num_63)  = "Amount";
    fg.Cell(0, 1, g_Ratio_63, 1, g_Ratio_63)  = "%";
    fg.Cell(0, 1, g_Num_64, 1, g_Num_64)  = "Amount";
    fg.Cell(0, 1, g_Ratio_64, 1, g_Ratio_64)  = "%";
    fg.Cell(0, 1, g_Num_65, 1, g_Num_65)  = "Amount";
    fg.Cell(0, 1, g_Ratio_65, 1, g_Ratio_65)  = "%";
    fg.Cell(0, 1, g_Num_66, 1, g_Num_66)  = "Amount";
    fg.Cell(0, 1, g_Ratio_66, 1, g_Ratio_66)  = "%";
    fg.Cell(0, 1, g_Num_67, 1, g_Num_67)  = "Amount";
    fg.Cell(0, 1, g_Ratio_67, 1, g_Ratio_67)  = "%";
    fg.Cell(0, 1, g_Num_68, 1, g_Num_68)  = "Amount";
    fg.Cell(0, 1, g_Ratio_68, 1, g_Ratio_68)  = "%";
    fg.Cell(0, 1, g_Num_69, 1, g_Num_69)  = "Amount";
    fg.Cell(0, 1, g_Ratio_69, 1, g_Ratio_69)  = "%";
    fg.Cell(0, 1, g_Num_70, 1, g_Num_70)  = "Amount";
    fg.Cell(0, 1, g_Ratio_70, 1, g_Ratio_70)  = "%";
    fg.Cell(0, 1, g_Num_71, 1, g_Num_71)  = "Amount";
    fg.Cell(0, 1, g_Ratio_71, 1, g_Ratio_71)  = "%";
    fg.Cell(0, 1, g_Num_72, 1, g_Num_72)  = "Amount";
    fg.Cell(0, 1, g_Ratio_72, 1, g_Ratio_72)  = "%";
    fg.Cell(0, 1, g_Num_73, 1, g_Num_73)  = "Amount";
    fg.Cell(0, 1, g_Ratio_73, 1, g_Ratio_73)  = "%";
    fg.Cell(0, 1, g_Num_74, 1, g_Num_74)  = "Amount";
    fg.Cell(0, 1, g_Ratio_74, 1, g_Ratio_74)  = "%";
    fg.Cell(0, 1, g_Num_75, 1, g_Num_75)  = "Amount";
    fg.Cell(0, 1, g_Ratio_75, 1, g_Ratio_75)  = "%";
    fg.Cell(0, 1, g_Num_76, 1, g_Num_76)  = "Amount";
    fg.Cell(0, 1, g_Ratio_76, 1, g_Ratio_76)  = "%";
    fg.Cell(0, 1, g_Num_77, 1, g_Num_77)  = "Amount";
    fg.Cell(0, 1, g_Ratio_77, 1, g_Ratio_77)  = "%";
    fg.Cell(0, 1, g_Num_78, 1, g_Num_78)  = "Amount";
    fg.Cell(0, 1, g_Ratio_78, 1, g_Ratio_78)  = "%";
    fg.Cell(0, 1, g_Num_79, 1, g_Num_79)  = "Amount";
    fg.Cell(0, 1, g_Ratio_79, 1, g_Ratio_79)  = "%";
    fg.Cell(0, 1, g_Num_80, 1, g_Num_80)  = "Amount";
    fg.Cell(0, 1, g_Ratio_80, 1, g_Ratio_80)  = "%";
    fg.Cell(0, 1, g_Num_81, 1, g_Num_81)  = "Amount";
    fg.Cell(0, 1, g_Ratio_81, 1, g_Ratio_81)  = "%";
    fg.Cell(0, 1, g_Num_82, 1, g_Num_82)  = "Amount";
    fg.Cell(0, 1, g_Ratio_82, 1, g_Ratio_82)  = "%";
    fg.Cell(0, 1, g_Num_83, 1, g_Num_83)  = "Amount";
    fg.Cell(0, 1, g_Ratio_83, 1, g_Ratio_83)  = "%";
    fg.Cell(0, 1, g_Num_84, 1, g_Num_84)  = "Amount";
    fg.Cell(0, 1, g_Ratio_84, 1, g_Ratio_84)  = "%";
    fg.Cell(0, 1, g_Num_85, 1, g_Num_85)  = "Amount";
    fg.Cell(0, 1, g_Ratio_85, 1, g_Ratio_85)  = "%";
    fg.Cell(0, 1, g_Num_86, 1, g_Num_86)  = "Amount";
    fg.Cell(0, 1, g_Ratio_86, 1, g_Ratio_86)  = "%";
    fg.Cell(0, 1, g_Num_87, 1, g_Num_87)  = "Amount";
    fg.Cell(0, 1, g_Ratio_87, 1, g_Ratio_87)  = "%";
    fg.Cell(0, 1, g_Num_88, 1, g_Num_88)  = "Amount";
    fg.Cell(0, 1, g_Ratio_88, 1, g_Ratio_88)  = "%";
    fg.Cell(0, 1, g_Num_89, 1, g_Num_89)  = "Amount";
    fg.Cell(0, 1, g_Ratio_89, 1, g_Ratio_89)  = "%";
    fg.Cell(0, 1, g_Num_90, 1, g_Num_90)  = "Amount";
    fg.Cell(0, 1, g_Ratio_90, 1, g_Ratio_90)  = "%";
    fg.Cell(0, 1, g_Num_91, 1, g_Num_91)  = "Amount";
    fg.Cell(0, 1, g_Ratio_91, 1, g_Ratio_91)  = "%";
    fg.Cell(0, 1, g_Num_92, 1, g_Num_92)  = "Amount";
    fg.Cell(0, 1, g_Ratio_92, 1, g_Ratio_92)  = "%";
    fg.Cell(0, 1, g_Num_93, 1, g_Num_93)  = "Amount";
    fg.Cell(0, 1, g_Ratio_93, 1, g_Ratio_93)  = "%";
    fg.Cell(0, 1, g_Num_94, 1, g_Num_94)  = "Amount";
    fg.Cell(0, 1, g_Ratio_94, 1, g_Ratio_94)  = "%";
    fg.Cell(0, 1, g_Num_95, 1, g_Num_95)  = "Amount";
    fg.Cell(0, 1, g_Ratio_95, 1, g_Ratio_95)  = "%";
    fg.Cell(0, 1, g_Num_96, 1, g_Num_96)  = "Amount";
    fg.Cell(0, 1, g_Ratio_96, 1, g_Ratio_96)  = "%";
    fg.Cell(0, 1, g_Num_97, 1, g_Num_97)  = "Amount";
    fg.Cell(0, 1, g_Ratio_97, 1, g_Ratio_97)  = "%";
    fg.Cell(0, 1, g_Num_98, 1, g_Num_98)  = "Amount";
    fg.Cell(0, 1, g_Ratio_98, 1, g_Ratio_98)  = "%";
    fg.Cell(0, 1, g_Num_99, 1, g_Num_99)  = "Amount";
    fg.Cell(0, 1, g_Ratio_99, 1, g_Ratio_99)  = "%";
	for(i=0;i<fg.Cols;i++)
	{
		if(grdDetail.GetGridData(1,i)=='')
		{
			fg.ColWidth(i)=0;
	    }
		if(i>=205 && i<=304)
		{
			fg.ColWidth(i)=0;
		}
		if(grdDetail.GetGridData(0,i)=='')
		{
			fg.ColWidth(i)=0;
		}
	}
	OnChangeColor();
}		
//--------------------------------------------
function ChangeReport()
{
	if (lstReport1.GetData() ==  "PL2")
	{
		grdDetail.style.display='';
		grdDetail2.style.display='none';
		FormatGrid();
	
	}else{
		grdDetail.style.display='none';
		grdDetail2.style.display='';
		FormatGrid_2();

	}
	
}
//---------------------------------------------
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
   </gw:data>
  <!------------------------------------------------------------------------> 
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
<!------------------------------------------------------------------------>    
<gw:data id="dso_search" onreceive="FormatGrid();" >
        <xml>
            <dso type="grid"  function="ac_sel_60081342_dpl">
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
<!------------------------------------------------------------------------>    
<gw:data id="dso_search_type2" onreceive="FormatGrid_2();" >
        <xml>
            <dso type="grid"  function="ac_sel_60081342_1">
                <input bind="grdDetail2">
                    <input bind="lstCompany"/>
                    <input bind="txtACPK"/>
                    <input bind="txtPLC_PK"/>
                    <input bind="txtPLPK"/>
                    <input bind="dtMonth"/>
                    <input bind="rdoSlipStatus"/>
                    <input bind="lstFS"/>
					<input bind="lstReport"/>
				    <input bind="txtrate1"/>
                </input>
                <output bind="grdDetail2"/>
            </dso>
        </xml>
    </gw:data>	
<!------------------------------------------------------------------------>     
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
									<td width="20%"><gw:list id="lstFS" styles="width:100%" onchange="OnSearch()"/></td>
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
									<td width=""><gw:list id="lstReport" styles="width:100%"  /></td>
									
								</tr>
								<tr>
								    <td colspan='2'></td>
								    <td  align=right>Ex Rate</td>
									<td width="" >
										<table style='width:100%' cellpadding="0" cellspacing="0">
											<tr>
												<td width="35%" ><gw:textbox id="txtrate" styles='width:100%' type="number" format="###,###.##R" /></td>
												<td width="65%"><gw:textbox id="txtrate1" text="1" styles='width:100%' type="number" format="###,###.##R"   /></td>
												<td align="right"></td>
											</tr>
										</table>
									</td>
									
									<td width="" align='right' colspan=''>Reports</td>
									<td width=""><gw:list id="lstReport1" styles="width:100%" onchange="ChangeReport()" /></td>
									<td align=""  ><gw:imgbtn img="excel" alt="Print" id="btnPrint" onclick="OnPrint()" /></td>
								</tr>
							</table>     
                        </fieldset>
                   </td>
                </tr>
                <tr style="width:100%;height:90%"> 
                    <td >
				<!--header='0.Code|1_Item|2_Item (local)|3_Item (foreign)|4_font_stype|5_prn_color|6_prn_seq|7_Total|8_Num_1|9_Ratio_1|10_Num_2
				|11_Ratio_2|12_Num_3|13_Ratio_3|14_Num_4|15_Ratio_4|16_Num_5|Num_10|Num_11|Num_12|Num_13|Num_14|Num_15|Num_16|Num_17|Num_18|Num_19|Num_20|Num_21|Num_22|Num_23|Num_24|Num_25|Num_26|Num_27|Num_28|Num_29|Num_30|Num_31|Num_32|Num_33|Num_34|Num_35|Num_36|Num_37|Num_38|Num_39|Num_40|Num_41|Num_42|Num_43|Num_44|Num_45|Num_46|Num_47|Num_48|Num_49|Num_50|Num_51|Num_52|Num_53|Num_54|Num_55|Num_56|Num_57|Num_58|Num_59|Num_60|Num_61|Num_62|Num_63|Num_64|Num_65|Num_66|Num_67|Num_68|Num_69|Num_70|Num_71|Num_72|Num_73|Num_74|Num_75|Num_76|Num_77|Num_78|Num_79|Num_80|Num_81|Num_82|Num_83|Num_84|Num_85|Num_86|Num_87|Num_88|Num_89|Num_90|Num_91|Num_92|Num_93|Num_94|Num_95|Num_96|Num_97|Num_98|Num_99             |Ratio_1|Ratio_2|Ratio_3|Ratio_4|Ratio_5|Ratio_6|Ratio_7|Ratio_8|Ratio_9|Ratio_10|Ratio_11|Ratio_12|Ratio_13|Ratio_14|Ratio_15|Ratio_16|Ratio_17|Ratio_18|Ratio_19|Ratio_20|Ratio_21|Ratio_22|Ratio_23|Ratio_24|Ratio_25|Ratio_26|Ratio_27|Ratio_28|Ratio_29|Ratio_30|Ratio_31|Ratio_32|Ratio_33|Ratio_34|Ratio_35|Ratio_36|Ratio_37|Ratio_38|Ratio_39|Ratio_40|Ratio_41|Ratio_42|Ratio_43|Ratio_44|Ratio_45|Ratio_46|Ratio_47|Ratio_48|Ratio_49|Ratio_50|Ratio_51|Ratio_52|Ratio_53|Ratio_54|Ratio_55|Ratio_56|Ratio_57|Ratio_58|Ratio_59|Ratio_60|Ratio_61|Ratio_62|Ratio_63|Ratio_64|Ratio_65|Ratio_66|Ratio_67|Ratio_68|Ratio_69|Ratio_70|Ratio_71|Ratio_72|Ratio_73|Ratio_74|Ratio_75|Ratio_76|Ratio_77|Ratio_78|Ratio_79|Ratio_80|Ratio_81|Ratio_82|Ratio_83|Ratio_84|Ratio_85|Ratio_86|Ratio_87|Ratio_88|Ratio_89|Ratio_90|Ratio_91|Ratio_92|Ratio_93|Ratio_94|Ratio_95|Ratio_96|Ratio_97|Ratio_98|Ratio_99             |Name_1|Name_2|Name_3|Name_4|Name_5|Name_6|Name_7|Name_8|Name_9|Name_10|Name_11|Name_12|Name_13|Name_14|Name_15|Name_16|Name_17|Name_18|Name_19|Name_20|Name_21|Name_22|Name_23|Name_24|Name_25|Name_26|Name_27|Name_28|Name_29|Name_30|Name_31|Name_32|Name_33|Name_34|Name_35|Name_36|Name_37|Name_38|Name_39|Name_40|Name_41|Name_42|Name_43|Name_44|Name_45|Name_46|Name_47|Name_48|Name_49|Name_50|Name_51|Name_52|Name_53|Name_54|Name_55|Name_56|Name_57|Name_58|Name_59|Name_60|Name_61|Name_62|Name_63|Name_64|Name_65|Name_66|Name_67|Name_68|Name_69|Name_70|Name_71|Name_72|Name_73|Name_74|Name_75|Name_76|Name_77|Name_78|Name_79|Name_80|Name_81|Name_82|Name_83|Name_84|Name_85|Name_86|Name_87|Name_88|Name_89|Name_90|Name_91|Name_92|Name_93|Name_94|Name_95|Name_96|Name_97|Name_98|Name_99-->
					<gw:grid id='grdDetail'
						header='Code|Item|Item (local)|Item (foreign)|font_stype|prn_color|Total|Num_1|Num_2|Num_3|Num_4|Num_5|Num_6|Num_7|Num_8|Num_9|Num_10|Num_11|Num_12|Num_13|Num_14|Num_15|Num_16|Num_17|Num_18|Num_19|Num_20|Num_21|Num_22|Num_23|Num_24|Num_25|Num_26|Num_27|Num_28|Num_29|Num_30|Num_31|Num_32|Num_33|Num_34|Num_35|Num_36|Num_37|Num_38|Num_39|Num_40|Num_41|Num_42|Num_43|Num_44|Num_45|Num_46|Num_47|Num_48|Num_49|Num_50|Num_51|Num_52|Num_53|Num_54|Num_55|Num_56|Num_57|Num_58|Num_59|Num_60|Num_61|Num_62|Num_63|Num_64|Num_65|Num_66|Num_67|Num_68|Num_69|Num_70|Num_71|Num_72|Num_73|Num_74|Num_75|Num_76|Num_77|Num_78|Num_79|Num_80|Num_81|Num_82|Num_83|Num_84|Num_85|Num_86|Num_87|Num_88|Num_89|Num_90|Num_91|Num_92|Num_93|Num_94|Num_95|Num_96|Num_97|Num_98|Num_99             |Ratio_1|Ratio_2|Ratio_3|Ratio_4|Ratio_5|Ratio_6|Ratio_7|Ratio_8|Ratio_9|Ratio_10|Ratio_11|Ratio_12|Ratio_13|Ratio_14|Ratio_15|Ratio_16|Ratio_17|Ratio_18|Ratio_19|Ratio_20|Ratio_21|Ratio_22|Ratio_23|Ratio_24|Ratio_25|Ratio_26|Ratio_27|Ratio_28|Ratio_29|Ratio_30|Ratio_31|Ratio_32|Ratio_33|Ratio_34|Ratio_35|Ratio_36|Ratio_37|Ratio_38|Ratio_39|Ratio_40|Ratio_41|Ratio_42|Ratio_43|Ratio_44|Ratio_45|Ratio_46|Ratio_47|Ratio_48|Ratio_49|Ratio_50|Ratio_51|Ratio_52|Ratio_53|Ratio_54|Ratio_55|Ratio_56|Ratio_57|Ratio_58|Ratio_59|Ratio_60|Ratio_61|Ratio_62|Ratio_63|Ratio_64|Ratio_65|Ratio_66|Ratio_67|Ratio_68|Ratio_69|Ratio_70|Ratio_71|Ratio_72|Ratio_73|Ratio_74|Ratio_75|Ratio_76|Ratio_77|Ratio_78|Ratio_79|Ratio_80|Ratio_81|Ratio_82|Ratio_83|Ratio_84|Ratio_85|Ratio_86|Ratio_87|Ratio_88|Ratio_89|Ratio_90|Ratio_91|Ratio_92|Ratio_93|Ratio_94|Ratio_95|Ratio_96|Ratio_97|Ratio_98|Ratio_99             |Name_1|Name_2|Name_3|Name_4|Name_5|Name_6|Name_7|Name_8|Name_9|Name_10|Name_11|Name_12|Name_13|Name_14|Name_15|Name_16|Name_17|Name_18|Name_19|Name_20|Name_21|Name_22|Name_23|Name_24|Name_25|Name_26|Name_27|Name_28|Name_29|Name_30|Name_31|Name_32|Name_33|Name_34|Name_35|Name_36|Name_37|Name_38|Name_39|Name_40|Name_41|Name_42|Name_43|Name_44|Name_45|Name_46|Name_47|Name_48|Name_49|Name_50|Name_51|Name_52|Name_53|Name_54|Name_55|Name_56|Name_57|Name_58|Name_59|Name_60|Name_61|Name_62|Name_63|Name_64|Name_65|Name_66|Name_67|Name_68|Name_69|Name_70|Name_71|Name_72|Name_73|Name_74|Name_75|Name_76|Name_77|Name_78|Name_79|Name_80|Name_81|Name_82|Name_83|Name_84|Name_85|Name_86|Name_87|Name_88|Name_89|Name_90|Name_91|Name_92|Name_93|Name_94|Name_95|Name_96|Name_97|Name_98|Name_99'
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
					<gw:grid id='grdDetail2'
						header='Code|Item|Item (local)|Item (foreign)|_font_stype|_prn_color|Total|Num_1|Num_2|Num_3|Num_4'
						format='0|0|0|0|0|0|-2|-2|-2|-2|0'
						aligns='0|0|0|0|0|0|3|3|3|3|0'
						defaults='||||||||||'
						editcol='0|0|0|0|0|0|0|0|0|0|0'
						widths='0|0|0|0|0|0|0|0|0|0|0'
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