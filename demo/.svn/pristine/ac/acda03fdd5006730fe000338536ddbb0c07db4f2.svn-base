<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Fixed Asset History</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
var gSave = false;
 
function BodyInit()
{
    System.Translate(document);  // Translate to language session
    var now = new Date(); 
    var lmonth, ldate;
     var arr;
     txt_row.text    = 1;
    BindingDataList();
    
}
 function BindingDataList()
 {  
    var data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACBK012') FROM DUAL")%>";
    lstlen.SetDataText(data); 
    var lstCompany = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    
    var ls_unit         = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACDF0050','','') FROM DUAL")%>";
    var dataDepr="<%=CtlLib.SetListDataSQL("select pk,org_nm from tco_org a where  del_if=0")%>"; 
    var ls_kind_cd      = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACDF0010','01','') FROM DUAL")%>";
    var ls_ccy          = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
    
    var lststatus      = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACDF0070') FROM DUAL")%>";
   

	//-----------grdGuarantee type
	  <%=CtlLib.SetGridColumnComboFormat("grdDetail1",4,"SELECT   code, b.code_nm  FROM tac_commcode_master a, tac_commcode_detail b  WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'GFGF001' AND a.del_if = 0  AND b.del_if = 0 AND b.use_yn = 'Y' ORDER BY code, b.code_nm")%>;


     data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
   arr  = data.split("|");
   txtbookccy.SetDataText(arr[1]);
			
    lstCompany1.SetDataText(lstCompany);
    
    lstCompany1.value = "<%=session("COMPANY_PK") %>";
    lstCOMPANY.SetDataText(lstCompany);
    lstCOMPANY.value = "<%=session("COMPANY_PK") %>";
    lstUNIT.SetDataText(ls_unit);
    lstEODEPT_NM.SetDataText(dataDepr);
    lstKIND_CD.SetDataText(ls_kind_cd);
    lstCCY.SetDataText(ls_ccy);
    lstBookExRate.SetDataText(ls_ccy);
    lstStatusSearch.SetDataText(lststatus);
    lstStatus.SetDataText(lststatus);
	 System.Translate(document);
	 txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	dso_getCompany.Call();
   // dso_upd_fa_gfgf50.StatusInsert();
 }
//-----------------------------------------------------------------------------------------
function OnShowProject(pos)
{
    switch(pos)
    {
    case 'Unit':  
        var fpath = System.RootURL + "/standard/forms/60/13/60130120_pl_popup.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCOMPANY.GetData() + '&dsqlid=ACNT.SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
        var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
        if ( object != null ) 
        {
            if (object[0] != 0)
            {
                txtABPL_PK.SetDataText(object[2]);//pk
                txtABPL_CD.SetDataText(object[0]);//id
                txtABPL_NM.SetDataText(object[1]);//nm
            }
        }
        break;
        case 'Charger': 
            var fpath = System.RootURL + "/standard/forms/60/08/60080030_popup_emp_3.aspx";
	        var aValue = System.OpenModal( fpath , 900 ,600, 'resizable:yes;status:yes'); 
	        if ((aValue != null)&&(aValue[0]!=""))
	        {
	            txtChargerPK.text = aValue[0];
	            //txtChargerID.text = aValue[1];
	            txtChargerNM.text = aValue[2];
	        }
        break;  
        case 'Center':
             var fpath = System.RootURL + "/standard/forms/60/13/60130120_pl_popup.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCOMPANY.GetData() + '&dsqlid=ACNT.SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
            var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
            if ( object != null ) 
            {
                if (object[0] != 0)
                {
                    txtABCenter_PK.SetDataText(object[6]);//pk
                    txtABCenter_CD.SetDataText(object[3]);//id
                    txtABCenter_NM.SetDataText(object[4]);//nm
                }
            }
        break;
		case 'Supplier': 
             var path    = System.RootURL + '/standard/forms/60/08/60080030_popup_customer.aspx';
			 var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
				if ( object != null )
				{
					if (object[0] != 0)
					{
						txtSupplierpk_76.text = object[0];
						txtSupplier_75.text = object[2];
					 }
                 }
        break;
        case 'Asset':
                var path    = System.RootURL + '/standard/forms/60/13/60130180_popup_Asset.aspx?company_pk=' + lstCompany1.value;
			   var object  = System.OpenModal( path, 800, 550,'resizable:yes;status:yes');
			   if ( object != null )
				{
					if (object[0] != 0)
					{
				            	txtAsset_Pk.text = object[0];
				            	txtAsset_Cd.text = object[2];
				            	txtAsset_Nm.text = object[3];
				            	dso_search.Call('SELECT');
					}
				}
        break;
    }
}
//---------------------------------------------------------------------------------------------

//---------------------------------------------------------------------------------------------
function OnNew()
{
        if(txtAsset_Pk.text != '')
        {
            dso_insert.Call();
        }
        else
        {
                alert('Please select Asset !!');
        }
}
//---------------------------------------------------------------------------------------------

function OnSave()
{
    flag='save';
    dso_upd.StatusUpdate();
    dso_upd.Call();
}
//---------------------------------------------------------------------------------------------
function OnDelete()
{
    if(confirm("Are you sure to delete ?"))
    {
            flag='delete';
            dso_upd.StatusDelete();
            dso_upd.Call();
    }
}
//----------------------------------------------------------------------------------------------
function GetRate()
 {
    dso_get_exrate_list.Call();
   
 }
 //---------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
        switch(obj.id)
        {
				case 'dso_getCompany':
                      dso_getCompany2.Call();  
                break;
				case 'dso_getCompany2':
                      dso_get_rate_book.Call();  
                break;
				
                case 'dso_insert':
                        dso_search.Call('SELECT');
                break;
                case 'dso_upd':
                        if(flag != 'search')
                        {
                                dso_search.Call('SELECT');
                        }
                        else
                        {
                                dso_upd_fa_detail.Call('SELECT');
                        }
                break;
        }
}
//---------------------------------------------------------------------------------------------
function onNewDetail()
{
	if(txtMasterPK.text != "")
    {
		var ctrl = grdDetail1.GetGridControl();
        grdDetail1.AddRow();
        grdDetail1.SetGridText(ctrl.Rows - 1,0,txtMasterPK.text);
        grdDetail1.SetGridText(ctrl.Rows - 1,4,'I');
       // grdDetail1.SetGridText(ctrl.Rows - 1,4,'0');
//        grdDetail1.SetGridText(ctrl.Rows - 1,5,'0');
//		grdDetail1.SetGridText(ctrl.Rows - 1,6,'0');
    }
}
//------------------------------s---------------------------------------------------------------
function onUpdateDetail()
{
    if(txtMasterPK.text != "")
    {
        dso_upd_fa_detail.Call();
    }
}
//---------------------------------------------------------------------------------------------
function onDeleteDetail()
{
	if(confirm("Do you want to delete this row ?"))
    {
        grdDetail1.DeleteRow();
        dso_upd_fa_detail.Call();
    }
}
//---------------------------------------------------------------------------------------------
function OnResetProject(obj)
{
    if(obj=="1")
    {
        txtChargerNM.SetDataText("");
        txtChargerPK.SetDataText("");
    }
    else
    if(obj=="2")
    {
        txtABPL_PK.SetDataText("");
        txtABPL_NM.SetDataText("");
        txtABPL_CD.SetDataText("");
    }
    if(obj=="3")
    {
        txtFA_AC_PK.SetDataText("");
        txtFA_AC_CD.SetDataText("");
        txtFA_AC_NM.SetDataText("");
    }
    if(obj=="4")
    {
        txtDEPR_AC_CD.SetDataText("");
        txtDEPR_AC_NM.SetDataText("");
        txtDEPR_AC_PK.SetDataText("");
    }
    if(obj=="5")
    {
        txtEXPE_AC_CD.SetDataText("");
        txtEXPE_AC_NM.SetDataText("");
        txtEXPE_AC_PK.SetDataText("");
    }
}
//---------------------------------------------------------------------------------------
function GetAccount(ind)
{
	var comm_code ="";
    var kind_cd = "ALL",trans_grp = "", acc_grp_cd = "";
        
    if(ind == "1")
    {
       comm_code = 'ACDF0020';
        kind_cd = lstKIND_CD.GetData();
		trans_grp = "A";
		acc_grp_cd = "AF001";     
    }
    if(ind == "2")
    {      
        comm_code = 'ACDF0030';
        kind_cd = lstKIND_CD.GetData();
		trans_grp = "A";
		acc_grp_cd = "AD001";       
    }          
    if(ind == "3")
    {        
        comm_code = 'AE002' ; //'ACDF0040';
        kind_cd = "ALL";
		trans_grp = "A";
		acc_grp_cd = "AE002" // AD001
       
    }                   
    //var fpath   = System.RootURL + "/standard/forms/gf/gf/gfgf00012.aspx?com_pk=" + lstCOMPANY.GetData() + "&comm_cd=" + comm_code + "&kind_cd=" + kind_cd;
	var fpath   = System.RootURL + "/standard/forms/60/13/60130110_acc_code.aspx?compk=" + lstCOMPANY.GetData() + "&transgrp=" + trans_grp + "&accgrpcd=" + acc_grp_cd;
    var object  = System.OpenModal(fpath , 600 , 500,'resizable:yes;status:yes;' ) 
	//var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:50;dialogHeight:31;dialogLeft:5;dialogTop:30;edge:sunken;scroll:no;unadorned:yes;help:no');
    if ( object != null )  
    {
        if (object[0] != "")
        {
            if(ind == "1")
            {
                txtFA_AC_PK.SetDataText(object[0]);
                txtFA_AC_CD.SetDataText(object[1]);
                txtFA_AC_NM.SetDataText(object[2]);
            }
            if(ind == "2")
            {
                txtDEPR_AC_PK.SetDataText(object[0]);
                txtDEPR_AC_CD.SetDataText(object[1]);
                txtDEPR_AC_NM.SetDataText(object[2]);
            }   
            if(ind == "3")
            {
                txtEXPE_AC_PK.SetDataText(object[0]);
                txtEXPE_AC_CD.SetDataText(object[1]);
                txtEXPE_AC_NM.SetDataText(object[2]);
            } 
        }
    }    
}
//----------------------------------------------------------------------------------------------------
function openPopup()
{  
    var fpath = System.RootURL + "/standard/forms/60/13/60130120_origin_popup.aspx"; 
        aValue = System.OpenModal( fpath , 600 , 400, 'resizable:yes;status:yes');
        if ( aValue != null )
        {          
            txtOrigin.SetDataText(aValue[1]+" - "+aValue[4]); 
        }	      
}
//------------------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------------------
function OnPopUpDept()
{
    var strtmp; 
	var fpath = System.RootURL + '/standard/forms/60/13/60130120_group_popup.aspx';
	//var aValue = System.OpenModal(fpath,700,400,'resizable:yes;status:no;');
	 var aValue = System.OpenModal( fpath , 900 ,600, 'resizable:yes;status:yes'); 
  if (aValue!=null)
	{
		txtFA_Group.text = aValue[0];
		txtFA_pk.text = aValue[1];
		
		lstKIND_CD.value = aValue[3];
		txtFA_AC_PK.text = aValue[4];
        txtFA_AC_CD.text = aValue[5];
        txtFA_AC_NM.text = aValue[6];
        txtDEPR_AC_PK.text = aValue[7];
        txtDEPR_AC_CD.text = aValue[8];
        txtDEPR_AC_NM.text = aValue[9];
        txtEXPE_AC_PK.text = aValue[10];
        txtEXPE_AC_CD.text = aValue[11];
        txtEXPE_AC_NM.text = aValue[12];
        txtDEPR_YY.text = aValue[13];
                
		
		if (chkAuto.value == "T")
		{
			/*strtmp = aValue[0];
			for(i = strtmp.length; i< Number(lstlen.value);i++)
			{
				strtmp= strtmp + "X";
				
			}
			txtFA_CD.text = strtmp;*/
			dso_get_facdauto.Call();
			
		}
		else
		{
		        alert("Please uncheck Auto for select!! ");
		}
	}

}
//------------------------------------------------------------------------------------------------------
function UpdateCost(ind)
{ 
   
	var tr_rate = Number(txtTR_RATE.text);
    var bk_rate = Number(txtBK_RATE.text);
    var book_rate = Number(lblBookRate.text);
    var cost_amt_chg = Number(txtCOST_AMT_Chg.text);
    var cost_famt_chg = Number(txtCOST_FAMT_Chg.text);

   var accum_dept_amt_chg = Number(txtACCUM_DEPR_AMT_Chg.GetData());
   var accum_dept_famt_chg = Number(txtACCUM_DEPR_FAMT_Chg.GetData());
   var BEGIN_DEPR_FAMT_chg = Number(txtBEGIN_DEPR_FAMT_Chg.GetData());
   var BEGIN_DEPR_AMT_chg = Number(txtBEGIN_DEPR_AMT_Chg.GetData());
   var REMAIN_FAMT_Chg=0;
   var REMAIN_AMT_Chg=0;
                          if(txtbookccy.text=='USD')
                          {
                                   if(lstCCY.value=='VND')
                                   {
                                                cost_amt_chg = cost_famt_chg / book_rate;
                                                txtCOST_AMT_Chg.SetDataText("" + cost_amt_chg);
                                                REMAIN_AMT_Chg = cost_amt_chg - accum_dept_amt_chg + BEGIN_DEPR_AMT_chg;
                                                txtREMAIN_AMT_Chg.SetDataText("" + REMAIN_AMT_Chg);
                                                REMAIN_FAMT_Chg = cost_famt_chg - accum_dept_famt_chg + BEGIN_DEPR_FAMT_chg;
                                                txtREMAIN_FAMT_Chg.SetDataText("" + REMAIN_FAMT_Chg);
                                   } 
                                   else if(lstCCY.value=='USD')
                                   {
                                                cost_amt_chg = cost_famt_chg * 1; 
                                                txtCOST_AMT_Chg.SetDataText("" + cost_amt_chg);
                                                REMAIN_AMT_Chg = cost_amt_chg - accum_dept_amt_chg + BEGIN_DEPR_AMT_chg;
                                                txtREMAIN_AMT_Chg.SetDataText("" + REMAIN_AMT_Chg);
                                                REMAIN_FAMT_Chg = cost_famt_chg - (accum_dept_famt_chg + BEGIN_DEPR_FAMT_chg);
                                                txtREMAIN_FAMT_Chg.SetDataText("" + REMAIN_FAMT_Chg);
                                   }
                        }
                        else if(txtbookccy.text=='VND')
                        {
                               if(lstCCY.value=='VND')
                               {  
                                            cost_amt_chg = Math.round(cost_famt_chg / book_rate );
                                            txtCOST_AMT_Chg.SetDataText("" + cost_amt_chg);
                                            REMAIN_AMT_Chg = cost_amt_chg - (accum_dept_amt_chg + BEGIN_DEPR_AMT_chg);
                                            txtREMAIN_AMT_Chg.SetDataText("" + REMAIN_AMT_Chg);
                                            REMAIN_FAMT_Chg = cost_famt_chg - (accum_dept_famt_chg + BEGIN_DEPR_FAMT_chg);
                                            txtREMAIN_FAMT_Chg.SetDataText("" + REMAIN_FAMT_Chg);
                               }
                               else if(lstCCY.value=='USD')
                               {
                                            cost_amt_chg = Math.round(cost_famt_chg * tr_rate );
                                            txtCOST_AMT_Chg.SetDataText("" + cost_amt_chg);
                                            REMAIN_AMT_Chg = cost_amt_chg - (accum_dept_amt_chg + BEGIN_DEPR_AMT_chg);
                                            txtREMAIN_AMT_Chg.SetDataText("" + REMAIN_AMT_Chg);
                                            REMAIN_FAMT_Chg = cost_famt_chg - (accum_dept_famt_chg + BEGIN_DEPR_FAMT_chg);
                                            txtREMAIN_FAMT_Chg.SetDataText("" + REMAIN_FAMT_Chg); 
                                }
                        }
    MonthlyDeprAmt();
    DailyDepr();
}
function UpdateBeginDepr(ind)
{
	var tr_rate = Number(txtTR_RATE.text);
    var bk_rate = Number(txtBK_RATE.text);
    var book_rate = Number(lblBookRate.text);
  
    var begin_amt_chg = Number(txtBEGIN_DEPR_AMT_Chg.text);
    var begin_famt_chg = Number(txtBEGIN_DEPR_FAMT_Chg.text);

        if(txtbookccy.text=='USD')
        {
               if(lstCCY.value=='VND')
              { 
                    begin_amt_chg = begin_famt_chg /book_rate;
                    txtBEGIN_DEPR_AMT_Chg.SetDataText("" + begin_amt_chg);
                    txtBEGIN_DEPR_FAMT_Chg.SetDataText("" + begin_famt_chg);

                    UpdateRemainAMT();
              }
              else if(lstCCY.value=='USD')
              { 
                    begin_amt_chg = begin_famt_chg * 1;
                    txtBEGIN_DEPR_AMT_Chg.SetDataText("" + begin_amt_chg);
                    txtBEGIN_DEPR_FAMT_Chg.SetDataText("" + begin_famt_chg);

                    UpdateRemainAMT();
              }  
        }
        else if(txtbookccy.text=='VND')
        {
              if(lstCCY.value=='VND')
              {  
                    begin_amt_chg = Math.round(begin_famt_chg *book_rate);
                    txtBEGIN_DEPR_AMT_Chg.SetDataText("" + begin_amt_chg);
                    txtBEGIN_DEPR_FAMT_Chg.SetDataText("" + begin_famt_chg);

                    UpdateRemainAMT();
               }
               else if(lstCCY.value=='USD')
              {  
                    begin_amt_chg = Math.round(begin_famt_chg * tr_rate );
                    txtBEGIN_DEPR_AMT_Chg.SetDataText("" + begin_amt_chg);
                    txtBEGIN_DEPR_FAMT_Chg.SetDataText("" + begin_famt_chg);

                    UpdateRemainAMT();
              }
        }
     MonthlyDeprAmt();
}
function OnchangeAccDept()
{
	var tr_rate = Number(txtTR_RATE.text);
    var bk_rate = Number(txtBK_RATE.text);
    var book_rate = Number(lblBookRate.text);
   
    var begin_amt_chg = Number(txtACCUM_DEPR_AMT_Chg.text);
    var begin_famt_chg = Number(txtACCUM_DEPR_FAMT_Chg.GetData());
        if(txtbookccy.text=='USD')
        {
                   if(lstCCY.value=='VND')  
                   { 
                             begin_amt_chg = begin_famt_chg / book_rate;
                             txtACCUM_DEPR_AMT_Chg.SetDataText("" + begin_amt_chg);
                   }
                   else  if(lstCCY.value=='USD')  
                   {
                              begin_amt_chg = begin_famt_chg * 1;
                              txtACCUM_DEPR_AMT_Chg.SetDataText("" + begin_amt_chg);
                   } 
        }
        else  if(txtbookccy.text=='VND')
        {
                    if(lstCCY.value=='VND')  
                   {  
                              begin_amt_chg = Math.round(begin_famt_chg * book_rate);
                              txtACCUM_DEPR_AMT_Chg.SetDataText("" + begin_amt_chg);
                    }
                   else  if(lstCCY.value=='USD')  
                  {
                            begin_amt_Chg = Math.round(begin_famt_chg * tr_rate);
                            txtACCUM_DEPR_AMT_Chg.SetDataText("" + begin_amt_chg);
                  } 
        }
        UpdateRemainAMT();
    
}
function MonthlyDeprAmt()
{
    var cost_amt_chg  = Number(txtCOST_AMT_Chg.text);
    var cost_famt_chg = Number(txtCOST_FAMT_Chg.text);
    var begin_amt_chg = Number(txtBEGIN_DEPR_AMT_Chg.text);
    var begin_famt_chg = Number(txtBEGIN_DEPR_FAMT_Chg.text);

    var depr_rate = Number(txtDEPR_RATE.text);
    var depr_TotalMM = Number(txtDEPR_MM_New.text);
    var d_yy = Number(txtUSE_DATE_YY_New.text);
    var d_mm = Number(txtDEPR_YY_New.text);
    var Ex_rate = Number(lblBookRate.text);
    var depr_amt_chg =0;
    var depr_famt_chg =0;

	var Increase = 0;
	var Decrease = 0;
	var Total = 0;
	var i = 0;
	var oper = 0;
	
	var Total_Book = 0;
	for(i=1;i<grdDetail1.rows;i++)
	{
			if(grdDetail1.GetGridData(i,4) == 'I')
			{
				oper =1;
			}
			else if(grdDetail1.GetGridData(i,4) == 'D')
			{
				oper = - 1;
			}
			Total += Math.round(Number(grdDetail1.GetGridData(i,5)) / Number(grdDetail1.GetGridData(i,8)) * Number(oper));	
			Total_Book += Number(grdDetail1.GetGridData(i,6)) / Number(grdDetail1.GetGridData(i,8)) * Number(oper);	
	}   
	
    if(d_yy > 0 || d_mm > 0)
    {
        if(txtbookccy.GetData() =="VND")
        {
                 if(lstCCY.value=='VND')  
                {     
                            depr_famt_chg = Math.round((cost_famt_chg * depr_rate ) /depr_TotalMM + Total);
                            depr_amt_chg = Math.round((cost_amt_chg * depr_rate ) /depr_TotalMM + Total_Book );
                 }
                else  if(lstCCY.value=='USD')  
                {
                             depr_famt_chg = Math.round(cost_famt_chg * depr_rate  / depr_TotalMM) + Total;
                             depr_amt_chg = Math.round(cost_amt_chg * depr_rate /depr_TotalMM + Total_Book);     
                }
        }
        else if(txtbookccy.text=='USD')
        {
                if(lstCCY.value=='VND')  
                {   
                         depr_famt_chg = cost_famt_chg * depr_rate  / depr_TotalMM + Total;
                         depr_amt_chg = cost_amt_chg * depr_rate / depr_TotalMM + Total_Book;
                }
                else if(lstCCY.value=='USD')  
                {
                        depr_famt_chg = cost_famt_chg * depr_rate  / depr_TotalMM + Total;
                        depr_amt_chg = cost_amt_chg * depr_rate / depr_TotalMM + Total_Book;
                }
        }
    }
    txtMONTH_DEPR_FAMT_Chg.SetDataText(""+ depr_famt_chg);
    txtMONTH_DEPR_AMT_Chg.SetDataText(""+ depr_amt_chg);
}

function OnchangeYearNew()
{
    //MonthlyDeprAmt();
    var currYear = Number(txtUSE_DATE_YY_New.GetData());
    var currMonth = Number(txtDEPR_YY_New.GetData());
    var updateTotalMonth=(currYear*12)+ currMonth;
    txtDEPR_MM_New.SetDataText("" + updateTotalMonth);
    UpdateCost();
    dso_get_tongsongaykhauhao_new.Call();
    DailyDepr();
}

function OnchangeMonthNew()
{
    MonthlyDeprAmt();
    var currYear = Number(txtUSE_DATE_YY_New.GetData());
    var currMonth = Number(txtDEPR_YY_New.GetData());
    var updateTotalMonth=(currYear*12)+ currMonth;
    txtDEPR_MM_New.SetDataText("" + updateTotalMonth);
    UpdateCost();
    dso_get_tongsongaykhauhao_new.Call();
    DailyDepr();
}
function UpdateRemainAMT()
{
    var cost_amt_chg = Number(txtCOST_AMT_Chg.GetData());
    var cost_famt_chg = Number(txtCOST_FAMT_Chg.GetData());
    var accum_dept_amt_chg = Number(txtACCUM_DEPR_AMT_Chg.GetData());
    var accum_dept_famt_chg = Number(txtACCUM_DEPR_FAMT_Chg.GetData());
    var BEGIN_DEPR_FAMT_chg = Number(txtBEGIN_DEPR_FAMT_Chg.GetData());
    var BEGIN_DEPR_AMT_chg = Number(txtBEGIN_DEPR_AMT_Chg.GetData());
    var SettxtFRemain_chg=0;
    var SettxtRemain_chg=0;
   
    SettxtFRemain_chg = cost_famt_chg - (accum_dept_famt_chg + BEGIN_DEPR_FAMT_chg);
    SettxtRemain_chg = cost_amt_chg - (accum_dept_amt_chg + BEGIN_DEPR_AMT_chg);
    txtREMAIN_FAMT_Chg.SetDataText("" + SettxtFRemain_chg);
    txtREMAIN_AMT_Chg.SetDataText("" + SettxtRemain_chg);
}
function OnchangePrice()
{
      var changePrice = Number(txtPRICE.GetData());
      var changeQty = Number(txtFA_QTY.GetData());
      var Amount=0;
            Amount= changePrice * changeQty;
            txtBUY_AMT.SetDataText("" + Amount);
}
function OnchangeQty()
{
    OnchangePrice();
}
function DailyDepr()
{
    var cost_famt1_chg = Number(txtCOST_FAMT_Chg.text);
    var cost_amt1_chg = Number(txtCOST_AMT_Chg.text);

    var depr_rate = Number(txtDEPR_RATE.text); 
    //ar depr_dd = Number(txtDEPR_DD.text);
     var depr_dd_new = Number(txtDEPR_DD_New.text);
    var daily = 0;
    var dailyf = 0;

    var daily_chg = 0;
    var dailyf_chg = 0;

    if(txtbookccy.text=='USD')
    {
            if(lstCCY.value=='VND')  
            {  
                daily_chg = cost_amt1_chg * depr_rate /depr_dd_new;
                dailyf_chg = cost_famt1_chg * depr_rate / depr_dd_new;
            }
           else  if(lstCCY.value=='USD')  
           {
                daily_chg = cost_amt1_chg * depr_rate /depr_dd_new;
                dailyf_chg = cost_famt1_chg * depr_rate / depr_dd_new;
           }   
    }
    else if(txtbookccy.text=='VND')
    {
            if(lstCCY.value=='VND')  
            { 
                daily_chg = Math.round((cost_amt1_chg * depr_rate) /depr_dd_new);
                dailyf_chg = Math.round((cost_famt1_chg * depr_rate) / depr_dd_new);
            }
            else   if(lstCCY.value=='USD')  
            {
                  dailyf_chg = Math.round(cost_famt1_chg * depr_rate / depr_dd_new);
                  daily_chg = Math.round((cost_amt1_chg * depr_rate) /depr_dd_new);
            } 
    }
    txtDAY_DEPR_FAMT_Chg.SetDataText("" + dailyf_chg);
    txtDAY_DEPR_AMT_Chg.SetDataText("" + daily_chg);
}
//------------------------------------------------------------------------------------------------------
function OnSearch()
{
        dso_search.Call('SELECT');
}
var flag="";
function OnClick()
{
        flag="search";
        txtMasterPK.text = grdMaster.GetGridData(grdMaster.row, 0);
        dso_upd.Call('SELECT');
}
</script>

<body>
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60130130_entry" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany1"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
	<gw:data id="dso_getCompany2" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60130130_entry" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCOMPANY"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------------->
    <gw:data id="dso_get_exrate_list" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="ac_pro_60130180_get_rate" > 
                <input> 
                     <input bind="lstCOMPANY"/>
                     <input bind="lstCCY"/>
                     <input bind="txtINVOICE_DATE"/>
                </input>
                <output>
                     <output bind="txtTR_RATE"/>
                     <output bind="txtBK_RATE"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!----------------------------------------------------------------------------------------------->
    <gw:data id="dso_get_exrate" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="list" procedure="ac_pro_60130180_GET_BOOKCCY"> 
                <input> 
                     <input bind="lstCOMPANY"/>
                     <input bind="txtUSE_DATE" />
                     <input bind="txtbookccy" />
                </input>
                <output>
                     <output bind="lblBookRate"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!--------------------------------------------------------------------------------------------------->
    <gw:data id="dso_get_rate_book" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="ac_pro_60130180_GET_RATE2"> 
                <input> 
                     <input bind="txtUSE_DATE"/>
                     <input bind="lstCOMPANY"/>
                     <input bind="txtbookccy" />
                     <input bind="txt_row"/>
                </input>
                <output>
                     <output bind="lblBookRate"/>
                     <output bind="txt_row"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>

      <!--------------------------------------------------------------------------------------------------->
    <gw:data id="dso_get_facdauto" onreceive="">
        <xml> 
            <dso type="process" procedure="ac_pro_60130180_acc_cd_auto"> 
                <input> 
                     <input bind="txtFA_pk"/>
                     <input bind="lstlen"/>
                </input>
                <output>
                     <output bind="txtFA_CD"/>
					 <output bind="txt_seq_73"/>
                </output> 
            </dso> 
        </xml> 
    </gw:data>
    <!------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_upd" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98" function="ac_sel_60130180_mst" procedure = "ac_upd_60130180_mst">
               <inout> 
                <inout bind="txtMasterPK"/>
                <inout bind="lstCOMPANY"/>
                <inout bind="txtFA_CD"/>
                <inout bind="lstUNIT"/>
                <inout bind="txtFA_NM"/>
                
                <inout bind="txtFA_LNM"/>
                <inout bind="txtFA_KNM"/>
                <inout bind="lstKIND_CD"/>
                <inout bind="txtFA_QTY"/>
                <inout bind="lstCCY"/>
                
                <inout bind="txtTR_RATE"/>
                <inout bind="txtBK_RATE"/>
                <inout bind="lstEODEPT_NM"/>
                <inout bind="txtChargerNM"/>
                <inout bind="txtABPL_PK"/>
                
                <inout bind="txtABPL_CD"/>
                <inout bind="txtABPL_NM"/>
                <inout bind="lstStatus"/>
                <inout bind="txtDescr"/>
                <inout bind="txtLDescr"/>
                
                <inout bind="txtFA_AC_PK"/>
                <inout bind="txtFA_AC_CD"/>
                <inout bind="txtFA_AC_NM"/>
                <inout bind="txtDEPR_AC_PK"/>
                <inout bind="txtDEPR_AC_CD"/>
                
                <inout bind="txtDEPR_AC_NM"/>
                <inout bind="txtEXPE_AC_PK"/>
                <inout bind="txtEXPE_AC_CD"/>
                <inout bind="txtEXPE_AC_NM"/>
                <inout bind="lstDEPR_METHOD"/>
                
                <inout bind="txtDEPR_RATE"/>
                <inout bind="txtUSE_DATE"/>
                <inout bind="txtDEPR_DATE"/>
                <inout bind="txtCOST_FAMT"/>
                <inout bind="txtCOST_AMT"/>
                
                <inout bind="txtBEGIN_DEPR_FAMT"/>
                <inout bind="txtBEGIN_DEPR_AMT"/>
                <inout bind="txtYear"/>
                <inout bind="txtDEPR_MM"/>
                <inout bind="txtMONTH_DEPR_FAMT"/>
                
                <inout bind="txtMONTH_DEPR_AMT"/>
                <inout bind="txtACCUM_DEPR_FAMT"/>
                <inout bind="txtACCUM_DEPR_AMT"/>
                <inout bind="txtREMAIN_FAMT"/>
                <inout bind="txtREMAIN_AMT"/>
                
                <inout bind="imgItem"/>
                <inout bind="txtOrigin"/> 
                <inout bind="txtSERIAL_NO"/>  
                <inout bind="txtINVOICE_DATE"/> 
                 <inout bind="txtINVOICE_NO"/> 
                
                <inout bind="txtCAPACITY"/> 
                <inout bind="txtENGINE"/>  
                <inout bind="txtUSE_DATE_YY"/>
                <inout bind="txtDEPR_YY"/>
                <inout bind="txtVoucher_NO"/>
                
                <inout bind="txtTagID"/>
                <inout bind="txtunUSE_DATE"/>
                <inout bind="txtPRICE"/>
                <inout bind="txtBUY_AMT"/>
                <inout bind="txtDate_of_issuing_card"/>
                
                <inout bind="txtChiefaccount"/>
                <inout bind="txtDate_of_receiving"/>
                <inout bind="txtMinutes"/>
                <inout bind="txtDate_ceased"/>
                <inout bind="txtReason"/>
                
                <inout bind="txtFA_pk"/>
                <inout bind="txtFA_Group"/>
                <inout bind="txtDEPR_DD"/>
                <inout bind="txtDAY_DEPR_FAMT"/>
                <inout bind="txtDAY_DEPR_AMT"/>
                
                <inout bind="txtABCenter_PK"/>
                <inout bind="txtABCenter_CD"/>
                <inout bind="txtABCenter_NM"/>
				<inout bind="txt_seq_73"/>
				<inout bind="txtModel_74"/>

                <inout bind="txtSupplier_75"/>
				<inout bind="txtSupplierpk_76"/>
				<inout bind="dtChangeDt"/>
				<inout bind="txtUSE_DATE_YY_New"/>
				<inout bind="txtDEPR_YY_New"/>

				<inout bind="txtDEPR_MM_New"/>
				<inout bind="txtDEPR_DD_New"/>
				<inout bind="txtDepreciatedMonth"/>
				<inout bind="txtDepreciatedEnd"/>
                <inout bind="txtCOST_FAMT_Chg"/>

			    <inout bind="txtCOST_AMT_Chg"/>
                <inout bind="txtBEGIN_DEPR_FAMT_Chg"/>
			    <inout bind="txtBEGIN_DEPR_AMT_Chg"/>
                <inout bind="txtMONTH_DEPR_FAMT_Chg"/>
			    <inout bind="txtMONTH_DEPR_AMT_Chg"/>

                <inout bind="txtDAY_DEPR_FAMT_Chg"/>
			    <inout bind="txtDAY_DEPR_AMT_Chg"/>
                <inout bind="txtACCUM_DEPR_FAMT_Chg"/>
			    <inout bind="txtACCUM_DEPR_AMT_Chg"/>
                <inout bind="txtREMAIN_FAMT_Chg"/>

			    <inout bind="txtREMAIN_AMT_Chg"/>
                <inout bind="lblBookRate"/>
                <inout bind="txtManufacturer_77"/>
			    <inout bind="txtremainday_78"/>
				
              </inout>              
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_upd_fa_detail" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10"  function="ac_sel_60130180_dtl" procedure="ac_upd_60130180_dtl">
                <input bind="grdDetail1">
                    <input bind="txtMasterPK"/>
                </input>
                <output bind="grdDetail1"/>
            </dso> 
        </xml>
    </gw:data>
<!------------------------------------------------------------------------------------->    
<gw:data id="dso_get_tongsongaykhauhao">
        <xml> 
            <dso type="process" procedure="ac_sel_60130180_khau_hao">
                <input> 
                     <input bind="txtDEPR_DATE"/>
                      <input bind="txtDEPR_MM"/>
                </input>
                <output>
                     <output bind="txtDEPR_DD"/>
               </output> 
            </dso> 
        </xml>
    </gw:data>
<!------------------------------------------------------------------------------------->
<gw:data id="dso_insert" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="ac_pro_60130180_insert">
                <input> 
                     <input bind="txtAsset_Pk"/>
                </input>
                <output>
                     <output bind="txtRtn"/>
               </output> 
            </dso> 
        </xml>
    </gw:data>
    
  <gw:data id="dso_search" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid"  function="ac_sel_60130180_search" >
                <input bind="grdMaster">
                    <input bind="txtAsset_Pk"/>
                    <input bind="lstCompany1"/>
                    <input bind="lstStatus"/>
                    <input bind="dtdate"/>
                </input>
                <output bind="grdMaster"/>
            </dso> 
        </xml>
    </gw:data>    
    
    <gw:data id="dso_get_tongsongaykhauhao_new">
        <xml> 
            <dso type="process" procedure="ac_sel_60130180_khau_hao">
                <input> 
                     <input bind="txtDEPR_DATE"/>
                      <input bind="txtDEPR_MM_New"/>
                </input>
                <output>
                     <output bind="txtDEPR_DD_New"/>
               </output> 
            </dso> 
        </xml>
    </gw:data>
<table cellpadding="0" cellspacing="0" style="width: 100%;  height:100% " border="0">
    <tr style="height:4%">
        <td>
            <fieldset style="padding:0">
                <table width="100%" cellpadding="1" cellspacing="1">
                    <tr>
                        <td style="width:8%" align="right">Company</td>
                        <td style="width:55%"><gw:list id="lstCompany1" styles="width:100%;" /></td>
                        <td style="width:15%" align="right">Status</td>
                        <td style="width:17%"><gw:list id="lstStatus" styles="width:100%;" /></td>
                        <td width="5%"></td>
                        <td><gw:imgBtn id="ibtnNew" img="search" alt="Search" onclick="OnSearch()" /></td>
                        <td><gw:button id="ibtnNew" img="new" alt="New" onclick="OnNew()" /></td>
						<td><gw:button id="ibtnNew" img="save" alt="Save" onclick="OnSave()" /></td>
                        <td><gw:button id="ibtnNew" img="delete" alt="Delete" onclick="OnDelete()" /></td>
                    </tr>
                    <tr>
                        <td width="" align="right"><a title="Click here to select Asset" href="#tips" onClick="OnShowProject('Asset')"  style="text-decoration: none">Asset</a></td>
                        <td>
                            <table cellpadding="0" cellspacing="0">
                                <tr>
                                      <td width="40%"> <gw:textbox id="txtAsset_Cd" styles="width:100%;"  /></td>
                                      <td width="60%"><gw:textbox id="txtAsset_Nm" styles="width:100%;"  /></td>
                                      <td><gw:textbox id="txtAsset_Pk" styles="width:100%;display:none" /></td>
                                      <td width=""><gw:imgBtn id="ibtnRsetdeptAsset" styles="width:100%;" img="reset"  alt="Reset" onclick="txtAsset_Cd.text='';txtAsset_Nm.text='';txtAsset_Pk.text='';" /></td>
                                </tr>
                            </table>
                        </td>
                        <td style="width:;display:none" align="right">Service Date</td>
                        <td style="width:;display:none"><gw:datebox id="dtdate" styles="width:100%;"  lang="1"/></td>
                        <td colspan="4"></td>
                    </tr>
                </table>
            </fieldset>
        </td>
    </tr>
    <tr style="height:26%">
    	<td width="100%">
        <!--header  ="0.pk|1.No|2.Asset Code|3.Asset Name|4.Service Date|5.Depreciation Date|6.Change Date|7.Original Cost(Tran.)|8.Original Cost(Book)|9.Estimate Life(Months)|10.Monthly Depr.(Tran.)|11.Monthly Depr.(Book)"-->
             <gw:grid
            id="grdMaster"
            header  ="_pk|No|Asset Code|Asset Name|Service Date|Depreciation Date|Change Date|Original Cost(Tran.)|Original Cost(Book)|Estimate Life(Months)|Monthly Depr.(Tran.)|Monthly Depr.(Book)"
            format  ="0|0|0|0|0|0|0|1|1|0|1|1"
            aligns  ="0|1|0|0|1|1|1|0|0|3|0|0"
            defaults="|||||||||||"
            editcol ="0|0|0|0|0|0|0|0|0|0|0|0"
            widths  ="0|600|2000|3000|1500|1700|1500|2000|2000|2000|2000|2000"
            styles  ="width:100%; height:100%"
            sorting ="T"
            oncellclick="OnClick()"
            /> 
         </td>
    </tr>
    <tr style="height:80%">
    	<td width="100%">
        	<gw:tab id="idTab">
            	<table border="1" id='tMain' name= "General Info" style="width:100%;height:100%;border-collapse: collapse;border-color:#00CCFF " cellpadding="0" cellspacing="0" >
                	<tr height="15%">
                	<td>
                	    <table cellpadding="0" cellspacing="0" width="100%" bordercolor="#00CCFF" style="border-collapse: collapse" border="1">
                            <tr>
                            	        <tr style="background:#C5EFF1">
                    	                    <td width="10%" align="right">Company&nbsp;</td>
                                            <td width="90%" ><gw:list id="lstCOMPANY" styles='width:100%;'/></td>
                                        </tr>
                                        <tr style="background:#C5EFF1">
                                            <td width="" align="right"><a title="Click here to select group" onClick="OnPopUpDept()" href="#tips"  style="text-decoration: none; color=#0000ff">Group&nbsp;</a></td>
                                            <td>
                        	                    <table cellpadding="0" cellspacing="0" width="100%">
                            	                    <tr>
                                	                    <td width="45%"><gw:textbox id="txtFA_Group" readonly="true" styles='width:100%;'  /></td>
                                                        <td width="7%" align="right">Unit&nbsp;</td>
                        			                    <td width="10%" colspan=""><gw:list id="lstUNIT"  styles='width:100%' /></td>
                                                        <td width="10%" align="right">Status&nbsp;</td>
                                                        <td width="13%"><gw:list id="lstStatusSearch"  styles='width:100%'/></td>
                                                        <td width="15%" align="right">Change Date&nbsp;</td>
                                                        <td style="width:"><gw:datebox id="dtChangeDt" lang="1" styles="width:100%;" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr style="background:#C5EFF1">
                                            <td width="" align="right">Asset code&nbsp;</td>
                                            <td>
                        	                    <table cellpadding="0" cellspacing="0" width="100%">
                            	                    <tr>
                                	                    <td width="45%"><gw:textbox id="txtFA_CD"  styles='width:100%;'/></td>
                                                        <td width="7%" align="right">Auto&nbsp;</td>
                                                        <td width="10%" align="left"><gw:checkbox  id="chkAuto" value="F" /></td>
                                                        <td width="10%" align="right">Length&nbsp;</td>
                                                        <td width="13%"><gw:list id="lstlen"  styles='width:100%'/></td>
                                                        <td width="15%" align="right">Unsed Date&nbsp;</td>
                                                        <td style="width:"><gw:datebox id="txtunUSE_DATE" nullaccept lang="1" styles="width:100%;" /></td>
                                                    </tr>
                                                </table>
                                                </td>
                                            </tr>  
                                            <tr style="background:#C5EFF1">
                      	                    <td width="" align="right">Asset name&nbsp;</td>
                                            <td width="" colspan="">
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                    <td width="26%"><gw:textbox id="txtFA_NM" styles="width:100%;"  /></td>
                                                                    <td width="12%" align="right">Local name&nbsp;</td>
                                                                    <td width="26%" colspan=""><gw:textbox id="txtFA_LNM" styles="width:100%;" onenterkey="" /></td>
                                                                    <td width="10%" align="right">Kor. name&nbsp;</td>
                                                                    <td width="26%" colspan=""><gw:textbox id="txtFA_KNM" styles="width:100%;" onenterkey="" /></td>
                                                            </tr>
                                                    </table>
                                            </td>
                                            </tr>
                                            <tr style="background:#C5EFF1">
                      	                    <td width="" align="right">Kind&nbsp;</td>
                                            <td width="" colspan="">
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                    <td width="26%"><gw:list id="lstKIND_CD"  styles='width:100%' /></td>
                                                                    <td width="12%" align="right">Department&nbsp;</td>
                                                                    <td width="26%" colspan=""><gw:list  id="lstEODEPT_NM" value='ALL'  styles='width:100%'onchange="" /></td>
                                                                    <td width="10%" align="right"><a title="Click here to show Charger" onClick="OnShowProject('Charger')" href="#tips"  style="text-decoration:none">Charger&nbsp;</a></td>
                                                                    <td width="26%" >
                                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                                <td width="100%"><gw:textbox id="txtChargerNM" readonly="true" styles="width:100%;" /></td>
                                                                                                <td width=""><gw:imgBtn id="ibtnResetdept" styles="width:100%;"  img="reset"  alt="reset Department" onclick="OnResetProject('1')" /></td>
                                                                                                    <td width="" ><gw:textbox id="txtChargerPK" styles='width:100%;display:none' /></td>
                                                                                    </tr>
                                                                            </table>
                                                                    </td>
                                                            </tr>
                                                    </table>
                                            </td>
                                            </tr>
                                            <tr style="background:#C5EFF1">
                      	                    <td width="" align="right"><a title="Click here to show PL Unit" onClick="OnShowProject('Unit')" href="#tips"  style="text-decoration:none" >PL Unit&nbsp;</a></td>          
                                            <td >
                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                        <td width="15%" ><gw:textbox id="txtABPL_CD" readonly="true" styles="width:100%;" /></td>
                                                        <td width="25%" ><gw:textbox id="txtABPL_NM" readonly="true" styles="width:100%;" /><gw:textbox id="txtABPL_PK" styles='display:none' /></td>
                                                        <td width=""><gw:imgBtn id="ibtnResetdeptPL" styles="width:100%;" img="reset"  alt="reset Department" onclick="OnResetProject('2')" /></td>
                                                                        
                                                        <td align="right" width="20%" ><a title="Click here to show PL Center" onClick="OnShowProject('Center')" href="#tips"  style="text-decoration:none">PL Center&nbsp;</a></td>          
                                                        <td width="15%" ><gw:textbox id="txtABCenter_CD" styles="width:100%;" /></td>
                                                        <td width="25%" ><gw:textbox id="txtABCenter_NM" styles="width:100%;" /><gw:textbox id="txtABCenter_PK" styles='display:none' /></td>
                                                        <td width=""><gw:imgBtn id="ibtnResetdeptPL1" styles="width:100%;" img="reset"  alt="reset Department" onclick="txtABCenter_CD.text='';txtABCenter_NM.text='';txtABCenter_PK.text='';" /></td>
                                                                        
                                                        </tr>
                                                </table>
                                            </td>
                                            </tr>
                                                         
                                            <tr style="background:#C5EFF1">
                      	                    <td width="" align="right">Description&nbsp;</td>
                                            <td width="" >
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                    <td width="40%"><gw:textbox id="txtDescr" styles="width:100%;" onenterkey="" /></td>
                                                                    <td width="20%" align="right">L.Description&nbsp;</td>
                                                                    <td width="40%" colspan=""><gw:textbox id="txtLDescr" styles="width:100%;" onenterkey="" /></td>
                                                            </tr>
                                                    </table>
                                            </td>
                                            </tr>
                            </tr>
                        </table>
                	</td>
                	</tr>
                      <tr height="2%">
                      	<td colspan="">
                        	<fieldset style="padding:0">
                                <table cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td  width="91%"></td>
                                        <td  width="3%"><gw:button id="ibtnNew"    img="new"       alt="New"           onclick="onNewDetail()" /></td>
                                        <td  width="3%"><gw:button id="ibtnSave"   img="save"      alt="Save"          onclick="onUpdateDetail()" /></td>
                                        <td  width="3%"><gw:button id="ibtnDelete" img="delete"    alt="Delete"        onclick="onDeleteDetail()" /></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                      </tr>
                      <tr height="83%">
                          <td width="100%" colspan="4">
                             <gw:grid
                            id="grdDetail1"
                            header  ="_mst_pk|_pk|Date|Voucher No|Type|Trans. Amt|Book Amt|Depreciation Date|Months|remark|remark2"
                            format  ="0|0|4|0|2|1|1|4|1|0|0"
                            aligns  ="0|0|0|0|0|3|3|1|3|0|0"
                            defaults="||||||||||"
                            editcol ="0|0|1|1|1|1|1|1|1|1|1"
                            widths  ="0|0|1800|1800|1800|1800|1800|2000|1800|3000|3000"
                            styles  ="width:100%; height:100%"
                            sorting ="F"
                            /> 
                         </td>
                      </tr>
                </table>
                <table border="0" name= "More Info" style="width:100%;height:100%; border-collapse: collapse;border-color:#00CCFF" cellpadding="0" cellspacing="0" >
                	<tr style="height:6%">
                        <td>
                           <fieldset style="padding: 0;">
                          		<legend style="color:Teal;">General Ledger Information</legend>
                                <table cellpadding="0" cellspacing="0" width="100%">
                                	<tr>
                                      <td width="15%" align="right"><a title="Click here to select Asset Acct. Code" onClick="GetAccount('1')" href="#tips"  style="text-decoration: none;">Asset Acct. Code&nbsp;</a></td>
                                      <td width="85%">
                                      	<table cellpadding="0" cellspacing="0" width="100%">
                                        	<tr>
                                            	<td width="40%"><gw:textbox id="txtFA_AC_CD" readonly="true" styles="width:100%;" /></td>
                                                <td width="60%"><gw:textbox id="txtFA_AC_NM" readonly="true"  styles="width:100%;"  /></td>
                                                <td><gw:textbox id="txtFA_AC_PK" styles="width:100%;display:none" onenterkey="" /></td>
                                                <td width=""><gw:imgBtn id="ibtnResetdeptAsset" styles="width:100%;" img="reset"  alt="reset Department" onclick="OnResetProject('3')" /></td>
                                            </tr>
                                        </table>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td width="" align="right"><a title="Click here to select Depr. Acct. Code" onClick="GetAccount('2')" href="#tips"  style="text-decoration: none;">Depr. Acct. Code&nbsp;</a></td>
                                      <td width="">
                                      	<table cellpadding="0" cellspacing="0" width="100%">
                                        	<tr>
                                            	<td width="40%"><gw:textbox id="txtDEPR_AC_CD" readonly="true" styles="width:100%;" /></td>
                                                <td width="60%"><gw:textbox id="txtDEPR_AC_NM" readonly="true" styles="width:100%;"  /></td>
                                                <td ><gw:textbox id="txtDEPR_AC_PK" styles="width:100%;display:none" onenterkey="" /></td>
                                                <td width=""><gw:imgBtn id="ibtnResetdeptDepr" styles="width:100%;" img="reset"  alt="reset Department" onclick="OnResetProject('4')" /></td>
                                            </tr>
                                        </table>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td width="" align="right"><a title="Click here to select Expe. Acct. Code" onClick="GetAccount('3')" href="#tips"  style="text-decoration: none; ">Expe. Acct. Code&nbsp;</a></td>
                                      <td width="">
                                      	<table cellpadding="0" cellspacing="0" width="100%">
                                        	<tr>
                                            	<td width="40%"><gw:textbox id="txtEXPE_AC_CD" readonly="true" styles="width:100%;"  /></td>
                                                <td width="60%"><gw:textbox id="txtEXPE_AC_NM" readonly="true" styles="width:100%;" /></td>
                                                <td><gw:textbox id="txtEXPE_AC_PK" styles="width:100%;display:none" onenterkey="" /></td>
                                                <td width=""><gw:imgBtn id="ibtnResetdeptExp" styles="width:100%;" img="reset"  alt="reset Department" onclick="OnResetProject('5')" /></td>
                                            </tr>
                                        </table>
                                      </td>
                                    </tr>
                                </table>
                           </fieldset>
                        </td>
                    </tr>
                    <tr style="height:94%">
                        <td>
                           <fieldset style="padding: 0"  >
                              <legend style="color:Teal">Depreciation Information</legend>
                              <table border="0"  style="width:100%;border-color:#00CCFF;border-collapse: collapse" cellpadding="0" cellspacing="0">
                              
                                <tr>
                                   <td width="" align="right" width="15%">Estimate Life</td>
                                   <td width="85%">
                                   	  <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="12%"><gw:textbox id="txtUSE_DATE_YY"  type="number"  format="###,###,###"   /></td>
                                            <td width="15%" align="left">Year(s)</td>
                                            <td width="12%"><gw:textbox id="txtDEPR_YY" type="number"  format="###,###,###" /></td>
                                            <td width="15%" align="left">Month(s)</td>
                                            <td width="12%"><gw:textbox id="txtDEPR_MM" type="number" format="###,###,###" readonly="true"   /></td>
                                            <td width="15%" align="left">Months(s)</td>
                                            <td width="12%"><gw:textbox id="txtDEPR_DD" type="number" format="###,###,###"  readonly="true" /></td>
                                            <td width="7%" align="left">Day(s)</td>
                                        </tr>
                                      </table>
                                   </td>
                                </tr>
                                 <tr>
                                   <td width="" align="right" width="15%">New Estimate Life</td>
                                   <td width="85%">
                                   	  <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="12%"><gw:textbox id="txtUSE_DATE_YY_New"  type="number"  format="###,###,###"  onEnterkey = "OnchangeYearNew()" onblur="OnchangeYearNew()"  /></td>
                                            <td width="15%" align="left">Year(s)</td>
                                            <td width="12%"><gw:textbox id="txtDEPR_YY_New" type="number"  format="###,###,###.####"  onenterkey = "OnchangeMonthNew()" onblur="OnchangeMonthNew()" /></td>
                                            <td width="15%" align="left">Month(s)</td>
                                            <td width="12%"><gw:textbox id="txtDEPR_MM_New" type="number" format="###,###,###" readonly="true"  onenterkey = "OnchangeMonthNew()" onblur="OnchangeMonthNew()"  /></td>
                                            <td width="15%" align="left">Months(s)</td>
                                            <td width="12%"><gw:textbox id="txtDEPR_DD_New" type="number" format="###,###,###"  readonly="true" /></td>
                                            <td width="7%" align="left">Day(s)</td>
                                        </tr>
                                      </table>
                                   </td>
                                </tr>
                                <tr>
                                    <td align="right">Remain day(s)</td>
                                    <td>
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td width="18%" colspan=""><gw:textbox id="txtremainday_78" type="number" format="###,###,###" /></td>
                                                <td width="23%" align="right">Depreciated Month(s)&nbsp;</td>
                                                <td width="18%"><gw:textbox id="txtDepreciatedMonth" type="number" format="###,###,###"  /></td>
                                                <td width="23%" align="right">Depreciated (End date)&nbsp;</td>
                                  	            <td width="18%"><gw:datebox id="txtDepreciatedEnd" nullaccept lang="1"/></td>
                                            </tr>

                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                	<td align="right">Currency</td>
                                    <td>
                                    	<table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="10%"><gw:list id="lstCCY"  styles='width:100%'  onchange="GetRate()"/></td>
                                              <td width="10%" align="right">Ex. Rate&nbsp;</td>
                                              <td width="10%" align="right"><gw:textbox id="txtBK_RATE"  type="number" format="###,###.##" text="1" styles="text-align:right;width:100%;" /></td>
                                              <td width="20%"><gw:textbox id="txtTR_RATE"  type="number" text="1" format="###,###.##" styles="text-align:right;width:100%;" /></td>
                                              <td width="10%" align="right">Book Rate&nbsp;</td>
                                              <td width="15%"><gw:textbox id="lblBookRate" format="###,###,###,###.##"   type="number"  styles="width:100%;display:"/></td>
                                              <td width="25%"></td>
                                        </tr>
                                      </table>
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2">
                                        <table border="1"  style="width:100%;border-collapse: collapse;border-color:#00CCFF " cellpadding="0" cellspacing="0" >
                                            <tr style="background:#C5EFF1;height:20">
                                                <td width="15%"></td>
                                                <td align="center" width="" style="">Original</td>
                                                <td align="center" width="">Change</td>
                                                <td align="center" width="">Original</td>
                                                <td align="center" width="">Change</td>
                                            </tr>
                                            <tr>
                                                <td width="" align="right" style="background:#C5EFF1">Original Cost&nbsp;</td>
                                                <td width="" ><gw:textbox id="txtCOST_FAMT"  type="number" format="###,###,###,###.##R" readonly="true" styles="text-align:right;width:100%;"/></td>
                                                <td width="" ><gw:textbox id="txtCOST_FAMT_Chg"  type="number" format="###,###,###,###.##R" onenterkey="UpdateCost()" onblur="UpdateCost()" styles="text-align:right;width:100%;"/></td>
                                                <td width="" ><gw:textbox id="txtCOST_AMT"  type="number" format="###,###,###,###.##R" readonly="true" styles="text-align:right;width:100%;color:red"/></td>
                                                <td width="" ><gw:textbox id="txtCOST_AMT_Chg"  type="number" format="###,###,###,###.##R" styles="text-align:right;width:100%;color:red"/></td>
                                            </tr>
                                            <tr>
                                                <td width="" align="right" style="background:#C5EFF1">Begin Depr.&nbsp;</td>
                                                <td width="" ><gw:textbox id="txtBEGIN_DEPR_FAMT" type="number" format="###,###,###,###.##R" readonly="true" styles="text-align:right;width:100%;"/></td>
                                                <td width="" ><gw:textbox id="txtBEGIN_DEPR_FAMT_Chg" type="number" format="###,###,###,###.##R" onblur="UpdateBeginDepr()" onenterkey="UpdateBeginDepr()"  styles="text-align:right;width:100%;"/></td>
                                                <td width="" ><gw:textbox id="txtBEGIN_DEPR_AMT" type="number" format="###,###,###,###.##R" readonly="true"  styles="text-align:right;width:100%;color:red"/></td>
                                                <td width="" ><gw:textbox id="txtBEGIN_DEPR_AMT_Chg" type="number" format="###,###,###,###.##R"  styles="text-align:right;width:100%;color:red"/></td>
                                            </tr>
                                            <tr>
                                                <td width="" align="right" style="background:#C5EFF1">Monthly Depr.&nbsp;</td>
                                                <td width=""><gw:textbox id="txtMONTH_DEPR_FAMT" text="0" type="number" format="###,###,###,###.##R"  readonly="true"  styles="text-align:right;width:100%;"/></td>
                                                <td width=""><gw:textbox id="txtMONTH_DEPR_FAMT_Chg" text="0" type="number" format="###,###,###,###.##R"    styles="text-align:right;width:100%;"/></td>
                                                <td width=""><gw:textbox id="txtMONTH_DEPR_AMT" type="number" format="###,###,###,###.##R" readonly="true" styles="text-align:right;width:100%;color:red"/></td>
                                                <td width=""><gw:textbox id="txtMONTH_DEPR_AMT_Chg" text="0" type="number" format="###,###,###,###.##R"    styles="text-align:right;width:100%;color:red"/></td>
                                            </tr>
                                            <tr>
                                                <td width="" align="right" style="background:#C5EFF1">Daily Depr.&nbsp;</td>
                                                <td width=""><gw:textbox id="txtDAY_DEPR_FAMT" text="0" type="number" format="###,###,###,###.##R" readonly="true"  styles="text-align:right;width:100%;"/></td>
                                                <td width=""><gw:textbox id="txtDAY_DEPR_FAMT_Chg" text="0" type="number" format="###,###,###,###.##R"   styles="text-align:right;width:100%;"/></td>
                                                <td width=""><gw:textbox id="txtDAY_DEPR_AMT" type="number" format="###,###,###,###.##R" readonly="true" styles="text-align:right;width:100%;color:red"/></td>
                                                <td width=""><gw:textbox id="txtDAY_DEPR_AMT_Chg" type="number" format="###,###,###,###.##R" styles="text-align:right;width:100%;color:red"/></td>
                                            </tr>
                                            <tr>
                                                <td width="" align="right" style="background:#C5EFF1">Accum. Depr.&nbsp;</td>
                                                <td width=""><gw:textbox id="txtACCUM_DEPR_FAMT" readonly="true" type="number" format="###,###,###,###.##R" styles="text-align:right;width:100%;"/></td>
                                                <td width=""><gw:textbox id="txtACCUM_DEPR_FAMT_Chg" onblur="OnchangeAccDept()" onenterkey="OnchangeAccDept()" type="number" format="###,###,###,###.##R" styles="text-align:right;width:100%;"/></td>
                                                <td width=""><gw:textbox id="txtACCUM_DEPR_AMT"  type="number" format="###,###,###,###.##R" readonly="true" styles="text-align:right;width:100%;color:red"/></td>
                                                <td width=""><gw:textbox id="txtACCUM_DEPR_AMT_Chg"  type="number" format="###,###,###,###.##R" styles="text-align:right;width:100%;color:red"/></td>
                                            </tr>
                                            <tr>
                                                <td width="" align="right" style="background:#C5EFF1">Remain. Amt.&nbsp;</td>
                                                <td width="" ><gw:textbox id="txtREMAIN_FAMT" type="number"  format="###,###,###,###.##R" readonly="true" styles="text-align:right;width:100%;"/></td>
                                                <td width="" ><gw:textbox id="txtREMAIN_FAMT_Chg" type="number"  format="###,###,###,###.##R" styles="text-align:right;width:100%;"/></td>
                                                <td width=""><gw:textbox id="txtREMAIN_AMT"  type="number"   format="###,###,###,###.##R" readonly="true"s styles="text-align:right;width:100%;color:red"/></td>
                                                <td width=""><gw:textbox id="txtREMAIN_AMT_Chg"  type="number"   format="###,###,###,###.##R" styles="text-align:right;width:100%;color:red"/></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                              </table>
                           </fieldset>
                        </td>
                   </tr>
                </table>
                <table border="1" name= "Received & Disposal Info" style="width:100%;border-collapse: collapse;border-color:#00CCFF" cellpadding="0" cellspacing="0"  >
                   <tr style="background:#C5EFF1">
                   		<td width="30%" align="right">Date of issuing card&nbsp;</td>
                        <td width=""><gw:datebox id="txtDate_of_issuing_card" nullaccept=1  lang="1"/></td>
                        <td width="35%" align="right">Chief account&nbsp;</td>
                        <td width="35%"><gw:textbox id="txtChiefaccount" styles='width:100%' /></td>
                   </tr>
                   <tr style="background:#C5EFF1">
                        <td width="" align="right">Date of delivery and receiving&nbsp;</td>
                        <td width=""><gw:datebox id="txtDate_of_receiving" nullaccept=1  lang="1"/></td>
                        <td width="" align="right">Minutes of delivery and receiving No.&nbsp;</td>
                        <td width=""><gw:textbox id="txtMinutes" /></td>
                   </tr>
                   <tr style="background:#C5EFF1">
                        <td width="" align="right">Date ceased using fixed asset&nbsp;</td>
                        <td width=""><gw:datebox id="txtDate_ceased" nullaccept=1  lang="1"/></td>
                        <td width="" align="right">Reason for not using&nbsp;</td>
                        <td width=""><gw:textarea rows=3 id="txtReason" styles="width: 100%" /></td>
                   </tr>
                   <tr style="display:none">
                             <td><gw:textbox id="txtMasterPK" styles="width: 100%;display: none" /></td>
                             <td><gw:textbox id="txtRtn" styles="width: 100%;display: none" /></td>
                             <td><gw:textbox id="txtOrigin_PK" styles='width:100%;display:none' /></td>
                             <td><gw:textbox id="txtComCodeID" styles='width:100%;display:none' /></td>
                             <td><gw:textbox id="txtCodeTemp" styles='width:100%;display:none' /></td>
                              <td><gw:list id="lstBookExRate" styles="width:100%;display:none" /></td>
                             <td><gw:textbox id="txtbookccy" styles="width:95%;display:none"  /> </td>
                              
                              <td><gw:textbox id="txtFA_pk" lang="1" style="display:none " /></td>
                              <td><gw:textbox id="txt_row"        styles='display:none'/></td>
                              <td><gw:textbox id="txt_seq_73"        styles='display:none'/></td>
                              <td><gw:datebox id="dbcurdate" lang="1" style="display: none" /></td>
                               <td><gw:textbox id="txtTagID"        styles='display:none'/></td>
                               <td><gw:textbox id="imgItem"        styles='display:none'/></td>
                   </tr>
                   	<tr style="display:none">
                                   <td width="15%" align="right">Depr. method</td>
                                   <td width="85%">
                                   	  <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="60%"><gw:list id="lstDEPR_METHOD"  styles='width:100%' /></td>
                                            <td width="20%" align=right>Depr. rate&nbsp;</td>
											<td width="20%" ><gw:textbox id="txtDEPR_RATE"  text="1" type="number" format="###,###.##R" styles="text-align:right;width:100%;" /></td>
                                        </tr>
                                      </table>
                                   </td>
                                </tr>
                    <tr style="display:none">
                        <td width="" align="right">Service Date</td>
                        <td width="">
                            <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width=""><gw:datebox id="txtUSE_DATE"  lang="<%=Session("Lang")%>"/></td>
                                <td width="20%" align=right>Depr. Date&nbsp;</td>
                                <td width="" ><gw:datebox id="txtDEPR_DATE" nullaccept   lang="<%=Session("Lang")%>"/></td>
                                <td width="80%"></td>
                            </tr>
                            </table>
                        </td>
                    </tr>
                    <tr style="display:none">
                                    <td>
                                        <fieldset style="padding: 2">
                                            <legend style="color:Teal">Purchase Infomation</legend>
                                            <table border="0" cellpadding=0 cellspacing="0" width="100%">
                                            <tr>
                                            <td>
                                            <table border="0" cellpadding=0 cellspacing="0" width="100%">
                                            <tr>
                                                <td width="16%">Prod year</td>
                                                <td width="12%" colspan="2"><gw:datebox id="txtYear" type="year"  onenterkey="" /></td>
                                                <td width="19%" align="right">Invoice Date</td>
                                                <td width="18%"><gw:datebox id="txtINVOICE_DATE" styles='width:100%' nullaccept  lang="<%=Session("Lang")%>"/></td>
                                                <td width="15%" align=right>Invoice No</td>
                                                <td width="20%"><gw:textbox id="txtINVOICE_NO" styles='width:100%;'/></td>
                                            </tr>
                                            </table >
                                            </td>
                                            </tr>
                                                        
                                            <tr>
                                            <td>
                                            <table border="0" cellpadding=0 cellspacing="0" width="100%">
                                            <tr>
                                            <td width="12%">Serial No</td>
                                                <td width="38%"><gw:textbox id="txtSERIAL_NO" styles='width:100%;'/></td>
                                                <td width="12%" align=right>Voucher No</td>
                                                <td width="38%"><gw:textbox id="txtVoucher_NO" styles='width:100%;'/></td>
                                            </tr>
                                            </table>
                                            </td>
                                            </tr>
                                                        
                                            <tr>
                                            <td>
                                            <table border="0" cellpadding=0 cellspacing="0" width="100%">
                                                <tr>
                                                <td width="12">Price</td>
                                                <td width="38%"><gw:textbox id="txtPRICE" text="1" onchange="OnchangePrice()" onenterkey="OnchangePrice()" type="number" format="###,###.##R" styles="text-align:right;width:100%;height:22"></gw:textbox></td>
                                                <td width="12%" align=right>Amount</td>
                                                <td width="38%"><gw:textbox id="txtBUY_AMT" type="number" format="###,###.##R" styles="text-align:right;width:100%;" /></td>
                                            </tr>
                                            </table>
                                            </td>
                                            </tr>
                                                        
                                            <tr>
                                            <td>
                                            <table border="0" cellpadding=0 cellspacing="0" width="100%">
                                                <tr>
                                                <td width="12%"><a title="Click here to select Requester" onClick="openPopup()" href="#tips"
                                                style="text-decoration: none; color=#0000ff"><b>Origin</b></a></td>
                                                <td width="38%"><gw:textbox id="txtOrigin" styles="width:100%;" onenterkey="" /></td>
                                                          
                                                <td width="12%" align="right">Quantity</td>
                                                <td width="38%"><gw:textbox  id="txtFA_QTY"  text="1" onchange="OnchangeQty()" onenterkey="OnchangeQty()"  type="number" format="###,###" styles="text-align:right;width:100%;"></gw:textbox></td>
                                            </tr>
                                            </table>
                                            </td>
                                            </tr>
                                                         
                                                <tr>
                                            <td>
                                            <table border="0" cellpadding=0 cellspacing="0" width="100%">
                                                <tr>
                                                <td width="12%">Capacity</td>
                                                <td width="38%"><gw:textbox id="txtCAPACITY" styles='width:100%'/></td>
                                                <td width="12%" align=right>Engine No</td>
                                                <td width="38%"><gw:textbox id="txtENGINE" styles='width:100%'/></td>
                                            </tr>
												<tr>
                                                <td width="12%">Manufacturer</td>
                                                <td width="88%" colspan="4"><gw:textbox id="txtManufacturer_77" styles='width:100%'/></td>
                                                          
                                            </tr>
												<tr>
                                                <td width="12%">Model</td>
                                                <td width="38%"><gw:textbox id="txtModel_74" styles='width:100%'/></td>
                                                <td width="12%" align=right><a title="Click here to show Charger" onClick="OnShowProject('Supplier')" href="#tips" ><b>Supplier&nbsp;</b></a></td>
                                                <td width="38%"><gw:textbox id="txtSupplier_75" styles='width:100%'/><gw:textbox id="txtSupplierpk_76" styles='width:100%;display:none'/></td>
                                            </tr>
														
                                            </table>
                                            </td>
                                            </tr>
                                                        
                                                        
                                            </table>
                                            </fieldset>

                                    </td>
                                    </tr>
                </table>
            </gw:tab>
        </td>
    </tr>
</table>
<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
</body>
</html>