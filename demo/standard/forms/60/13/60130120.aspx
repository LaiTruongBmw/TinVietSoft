<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>FA ENTRY</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var gSave = false;
//--------------grdAllocate-----------------
var c_alocate_pk =0,
    c_asset_pk  =1,
    c_pl_pk  =2,
    c_pl_cd =3,
    c_pl_nm  =4,
    c_acc_code_pk   =5,
    c_acc_code_id   =6,
    c_acc_code_nm   =7,
    c_type   =8,
    c_ratio   =9,
    c_target   =10,
    c_depr_amt_tr  =11,
    c_depr_amt_bk   =12,
    c_description   =13,
    c_description2  =14,
    c_yy_mm         = 15;

//-------------------------------
 function OnToggle(direction)
 {
    if ( direction == 'SearchList' )
    {
        var left  = document.all("left");    
        var right = document.all("right");   
        var imgArrow = document.all("imgArrow");   
        
        if(imgArrow.status == "expand")
        {
            left.style.display="none";       
            imgArrow.status = "collapse";
            right.style.width="100%";
            imgArrow.src = "../../../system/images/button/next.gif";
        }
        else
        {
            left.style.display="";
            imgArrow.status = "expand";
            right.style.width="75%";
            imgArrow.src = "../../../system/images/button/previous.gif";
        }
     }
     else if ( direction == 'Picture' )
     {
        var left  = document.all("t-left");    
        var right = document.all("t-right");   
        var imgArrow = document.all("img1");   
        if(imgArrow.status == "expand")
        {
            right.style.display="none";       
            imgArrow.status = "collapse";
            left.style.width="99%";
            imgArrow.src = "../../../system/images/button/previous.gif";
        }
         else
        {
            right.style.display="";
            imgArrow.status = "expand";
            //left.style.width="75%";
            imgArrow.src = "../../../system/images/button/next.gif";
        } 
     }    
 }  

function BodyInit()
{
    System.Translate(document);  // Translate to language session
    var now = new Date(); 
    var lmonth, ldate;
     var arr;
     txt_row.text    = 1;
    var ls_lang     = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('COAB0070') FROM DUAL")%>"; 

    
    txtFA_Group.SetEnable(false);
    txtEXPE_AC_CD.SetEnable(false);
    txtEXPE_AC_NM.SetEnable(false);
    txtDEPR_AC_CD.SetEnable(false);
    txtDEPR_AC_NM.SetEnable(false);
    txtFA_AC_CD.SetEnable(false);
    txtFA_AC_NM.SetEnable(false);
    txtChargerNM.SetEnable(false);
    txtABPL_CD.SetEnable(false);
    txtABPL_NM.SetEnable(false);
   // txtBK_RATE.SetEnable(false);
   // txtTR_RATE.SetEnable(false);
    lstLang.SetDataText(ls_lang);
	ls_lang = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
    arr  = ls_lang.split("|");
	lstLang.SetDataText(arr[1]);
    //txtCOST_AMT.SetReadOnly(true);
    //txtBEGIN_DEPR_AMT.SetReadOnly(true);
    //txtMONTH_DEPR_AMT.SetReadOnly(true);
    //txtACCUM_DEPR_AMT.SetReadOnly(true);
    //txtREMAIN_AMT.SetReadOnly(true);
    txtREMAIN_FAMT.SetReadOnly(true);
    txtDEPR_MM.SetReadOnly(true);
    
    var trl = grdAllocate.GetGridControl();
    trl.ColFormat(c_depr_amt_tr)="###,###,###,###,##R";
    trl.ColFormat(c_depr_amt_bk)="###,###,###,###,##R"
    
    BindingDataList();
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	dso_getCompany.Call();

    //select pk,org_nm from tco_org a where  del_if=0
}


 function BindingDataList()
 {  
    var data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('EACBK012') FROM DUAL")%>";
    lstlen.SetDataText(data); 
    var lstDate = "DATA|1|Service Date|2|Depr Date|3|Invoice Date";  
    var lstCompany = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    
    var ls_unit         = "<%=CtlLib.SetListDataFUNC("SELECT ac_f_commoncode('ACDF0050','','') FROM DUAL")%>";
    var dataDepr="<%=CtlLib.SetListDataSQL(" select  a.pk, trim (a.org_id) || ' ' || a.org_nm from tco_org a  where a.del_if = 0 and a.tco_company_pk ="+ Session("COMPANY_PK") +"  order by a.org_nm")%>"; 
    var ls_kind_cd      = "<%=CtlLib.SetListDataFUNC("SELECT ac_f_commoncode('ACDF0010','01','') FROM DUAL")%>";
    var ls_ccy          = "<%=CtlLib.SetListDataFUNC("SELECT ac_f_commoncode('ACAB0110','03','') FROM DUAL")%>";
    
    var lststatus      = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACDF0070') FROM DUAL")%>";
    var lsAssetType      = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('GFQC0025') FROM DUAL")%>";
	var lsAssetType2      = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('GFQC0025') FROM DUAL")%>";
    var ls_depr_method  = "<%=CtlLib.SetListDataFUNC("SELECT ac_f_commoncode('ACDF0060','','') FROM DUAL")%>";

  
    l_data = "<%=CtlLib.SetListDataSQL("select TRIM(CODE) code, A.code_nm FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'ACBG0206' and def_yn ='Y'")%>";
    lstType.SetDataText(l_data)
    <%=CtlLib.SetGridColumnComboFormat("grdAllocate",8,"select TRIM(CODE) code, A.code_nm FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'ACBG0206' and def_yn ='Y'" )%>;
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
    lstdate.SetDataText(lstDate);
    lstDEPR_METHOD.SetDataText(ls_depr_method);
    lstAsset_Type.SetDataText(lsAssetType);
	lstAsset_Type2.SetDataText(lsAssetType2);
    OnNew();
	 System.Translate(document);
   // dso_upd_fa_gfgf50.StatusInsert();
 }
//-----------------------------------------------------------------------------------------
function OnShowProject(pos)
{
    switch(pos)
    {
    case 'Unit':
        var fpath = System.RootURL + "/standard/forms/60/13/60130120_pl_popup.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCOMPANY.GetData() + '&dsqlid=ac_sel_60130120_pl_popup&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
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
            var fpath = System.RootURL + "/standard/forms/60/01/60010060_search_emp.aspx"; 
	        var aValue = System.OpenModal( fpath , 900 ,600, 'resizable:yes;status:yes'); 
	        if ((aValue != null)&&(aValue[0]!=""))
	        {
	            txtChargerPK.text = aValue[0];
	            //txtChargerID.text = aValue[1];
	            txtChargerNM.text = aValue[2];
	        }
        break;  
       
        break;
		case 'Supplier':
             var path    = System.RootURL + '/standard/forms/60/05/60050010_popup_4.aspx?com_pk='+lstCOMPANY.value; 
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
    }
}
//---------------------------------------------------------------------------------------------
function OnSearch()
{
     dso_searchMST.Call("SELECT");
}
function OnCellclickGrid()
{
     txtMasterPK.text = grdSearch.GetGridData(grdSearch.row,0);
     dso_upd_fa_gfgf50.Call("SELECT");
}
//---------------------------------------------------------------------------------------------
function OnNew()
{
    dso_upd_fa_gfgf50.StatusInsert();
    txtBK_RATE.SetDataText('1');
    txtDEPR_RATE.SetDataText('1');
    txtTR_RATE.SetDataText('1');
    lstCCY.value='VND';
    txtMONTH_DEPR_FAMT.text="0";
    grdAllocate.ClearData();
	grdDetail1.ClearData();
    setTotalAllocate();
    //btnSave.SetEnable(true);
    dso_get_rate_book.Call();
}
//---------------------------------------------------------------------------------------------

function OnSave()
{
    gSave = true;
    dso_upd_fa_gfgf50.Call();
}
//---------------------------------------------------------------------------------------------
function OnDelete()
{
    if(confirm("Are you sure to delete ?"))
    {
        gSave = true;
        dso_upd_fa_gfgf50.StatusDelete();
        dso_upd_fa_gfgf50.Call();
        //dso_searchMST.Call("SELECT");
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
	if (obj.id=="dso_getCompany")
  {
	  dso_getCompany1.Call();
  }
  if (obj.id=="dso_getCompany1")
  {
	  dso_get_rate_book.Call();
  }
  if(obj.id=="dso_upd_fa_gfgf50")
   {
            if(gSave == true)
            {
                gSave = false;
                dso_searchMST.Call("SELECT");
            }
            else
            {
              dso_upd_fa_detail.Call("SELECT");  
            }
            
   }
   else if(obj.id=="dso_get_exrate_list")
   {
       /* lstBookExRate.value = lstCCY.GetData();
        var ex_rate = lstBookExRate.GetText();
        if(ex_rate == ""){
            alert("Please input exchange rate for this "+ lstCOMPANY.GetData() +" currency at date:"+ txtUSE_DATE.GetData() +".");
            return;
        }
        else{
            txtTR_RATE.SetDataText(ex_rate);
        }*/
     UpdateCost();
        
   }
   else if(obj.id=="dso_get_tongsongaykhauhao")
    {
	   	DailyDepr();
	}
    else if(obj.id =="dso_upd_fa_detail")
    {
      var  ldate = txtDEPR_DATE.value
        ldate = ldate.substr(0,4) + ldate.substr(4,2)  ;
        txtMonth.value = ldate;
        dso_upd_fa_allocate.Call('SELECT');
    }
    else if(obj.id =="dso_upd_fa_allocate")
    {
         setTotalAllocate();
    }
    else if(obj.id =="dso_get_allocate_copy")
    {
        alert("Copy finish!")
        dso_upd_fa_allocate.Call("SELECT")
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
    if(ind == "3" || ind == "4")
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
             if(ind == "4")
            {
                grdAllocate.SetGridText(grdAllocate.row,c_acc_code_pk,object[0])
                grdAllocate.SetGridText(grdAllocate.row,c_acc_code_id,object[1])
                grdAllocate.SetGridText(grdAllocate.row,c_acc_code_nm,object[2])
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
function OnPrintDTL()
{
    
  if(lstLang.value =="ENG")
    {
   var url = System.RootURL + "/standard/reports/gf/gf/gfgf00050_ENG.aspx?p_tac_gffa_mst_pk=" + txtMasterPK.GetData() + "&p_company=" +lstCompany1.value ;
           System.OpenTargetPage(url);   
     }
  else if(lstLang.value =="VIE")
  {
    if(txtMasterPK.text !="")
    {
        
        var url = System.RootURL + "/standard/reports/gf/gf/gfgf00050_VIE.aspx?p_tac_gffa_mst_pk=" + txtMasterPK.GetData() + "&p_company=" +lstCompany1.value ;
           System.OpenTargetPage(url);   
    }
    else
    {
        alert("Please select row master to print!!");
    }
   }
   else if(lstLang.value =="ENG-VIE")
   {
   var url = System.RootURL + "/standard/reports/gf/gf/gfgf00050_ENG-VIE.aspx?p_tac_gffa_mst_pk=" + txtMasterPK.GetData() + "&p_company=" +lstCompany1.value ;
           System.OpenTargetPage(url);   
    }
   
}
function OnPrint()
{
		 var url = System.RootURL + "/standard/reports/gf/gf/gfgf00050.aspx?Master_pk=" + txtMasterPK.GetData();
           System.OpenTargetPage(url);   
}
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
function onChangeStatus()
{
    
    if(lstStatus.GetData()=='U')
    {
        
        txtunUSE_DATE.SetDataText(dbcurdate.GetData());
    }else
    {
        txtunUSE_DATE.text ='';
    }
}
function UpdateCost(ind)
{ 
   
	var tr_rate = Number(txtTR_RATE.text);
    var bk_rate = Number(txtBK_RATE.text);
    var book_rate = Number(lblBookRate.text);
    var cost_amt = Number(txtCOST_AMT.text);
    var cost_famt = Number(txtCOST_FAMT.text);
    
//    var accum_dept_amt = Number(txtCOST_FAMT.GetData());
   var accum_dept_amt = Number(txtACCUM_DEPR_AMT.GetData());
   var accum_dept_famt = Number(txtACCUM_DEPR_FAMT.GetData());
   var BEGIN_DEPR_FAMT = Number(txtBEGIN_DEPR_FAMT.GetData());
   var BEGIN_DEPR_AMT = Number(txtBEGIN_DEPR_AMT.GetData());
   var REMAIN_FAMT=0;
    var REMAIN_AMT=0;
                          if(txtbookccy.text=='USD')
                          {
                                   if(lstCCY.value=='VND')
                                   {
                                               cost_amt = Math.round(cost_famt / book_rate *100 )/100;
                                              
                                               //cost_famt = Math.round(cost_famt / book_rate *100 )/100;
                                                txtCOST_AMT.SetDataText("" + cost_amt);
                                                REMAIN_AMT = Math.round((cost_amt - (accum_dept_amt + BEGIN_DEPR_AMT))*100)/100;
                                                txtREMAIN_AMT.SetDataText("" + REMAIN_AMT);
                                                REMAIN_FAMT = cost_famt - (accum_dept_famt + BEGIN_DEPR_FAMT);
                                                txtREMAIN_FAMT.SetDataText("" + REMAIN_FAMT);
                                   } 
                                   else if(lstCCY.value=='USD')
                                   {
                                                cost_amt = Math.round((cost_famt * book_rate / book_rate) *100)/100; 
                                              //  cost_famt = Math.round(cost_amt * bk_rate / tr_rate *100)/100; 
                                            
                                                txtCOST_AMT.SetDataText("" + cost_amt);
                                                REMAIN_AMT = Math.round((cost_amt - (accum_dept_amt + BEGIN_DEPR_AMT))*100)/100;
                                                txtREMAIN_AMT.SetDataText("" + REMAIN_AMT);
                                                REMAIN_FAMT = cost_famt - (accum_dept_famt + BEGIN_DEPR_FAMT);
                                                txtREMAIN_FAMT.SetDataText("" + REMAIN_FAMT);
                                   }
                        }
                        else if(txtbookccy.text=='VND')
                        {
                               if(lstCCY.value=='VND')
                               {  
                                            cost_amt = Math.round(cost_famt / book_rate );
                                            txtCOST_AMT.SetDataText("" + cost_amt);
                                            REMAIN_AMT = cost_amt - (accum_dept_amt + BEGIN_DEPR_AMT);
                                            txtREMAIN_AMT.SetDataText("" + REMAIN_AMT);
                                            REMAIN_FAMT = cost_famt - (accum_dept_famt + BEGIN_DEPR_FAMT);
                                            txtREMAIN_FAMT.SetDataText("" + REMAIN_FAMT);
                               }
                               else if(lstCCY.value=='USD')
                               {
                                            cost_amt = Math.round(cost_famt * tr_rate );
                                            txtCOST_AMT.SetDataText("" + cost_amt);
                                            REMAIN_AMT = cost_amt - (accum_dept_amt + BEGIN_DEPR_AMT);
                                            txtREMAIN_AMT.SetDataText("" + REMAIN_AMT);
                                            REMAIN_FAMT = cost_famt - (accum_dept_famt + BEGIN_DEPR_FAMT);
                                            txtREMAIN_FAMT.SetDataText("" + REMAIN_FAMT); 
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
    var begin_amt = Number(txtBEGIN_DEPR_AMT.text);
    var begin_famt = Number(txtBEGIN_DEPR_FAMT.text);

        if(txtbookccy.text=='USD')
        {
               if(lstCCY.value=='VND')
              { 
                    begin_amt = Math.round(begin_famt /book_rate *100)/100;
                    txtBEGIN_DEPR_AMT.SetDataText("" + begin_amt);
                    txtBEGIN_DEPR_FAMT.SetDataText("" + begin_famt);
                    UpdateRemainAMT();
              }
              else if(lstCCY.value=='USD')
              { 
                    begin_amt = Math.round(begin_famt * book_rate / book_rate *100)/100;
                    txtBEGIN_DEPR_AMT.SetDataText("" + begin_amt);
                    txtBEGIN_DEPR_FAMT.SetDataText("" + begin_famt);
                    UpdateRemainAMT();
              }  
        }
        else if(txtbookccy.text=='VND')
        {
              if(lstCCY.value=='VND')
              {   
                    begin_amt = Math.round(begin_famt *book_rate);
                    txtBEGIN_DEPR_AMT.SetDataText("" + begin_amt);
                    txtBEGIN_DEPR_FAMT.SetDataText("" + begin_famt);
                    UpdateRemainAMT();
               }
               else if(lstCCY.value=='USD')
              {  
                    begin_amt = Math.round(begin_famt * tr_rate );
                    txtBEGIN_DEPR_AMT.SetDataText("" + begin_amt);
                    txtBEGIN_DEPR_FAMT.SetDataText("" + begin_famt);
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
    var begin_amt = Number(txtACCUM_DEPR_AMT.text);
    var begin_famt = Number(txtACCUM_DEPR_FAMT.GetData());
        if(txtbookccy.text=='USD')
        {
                   if(lstCCY.value=='VND')  
                   { 
                             begin_amt = Math.round(begin_famt / book_rate *100)/100;
                             txtACCUM_DEPR_AMT.SetDataText("" + begin_amt);
                   }
                   else  if(lstCCY.value=='USD')  
                   {
                              begin_amt = Math.round(begin_famt * book_rate / book_rate *100)/100;
                              txtACCUM_DEPR_AMT.SetDataText("" + begin_amt);
                   } 
        }
        else  if(txtbookccy.text=='VND')
        {
                    if(lstCCY.value=='VND')  
                   {  
                              begin_amt = Math.round(begin_famt * book_rate);
                              txtACCUM_DEPR_AMT.SetDataText("" + begin_amt);
                    }
                   else  if(lstCCY.value=='USD')  
                  {
                            begin_amt = Math.round(begin_famt * tr_rate);
                            txtACCUM_DEPR_AMT.SetDataText("" + begin_amt);
                  } 
        }
        UpdateRemainAMT();
    
}
function MonthlyDeprAmt()
{
    var cost_amt  = Number(txtCOST_AMT.text);
    var cost_famt = Number(txtCOST_FAMT.text);
    var begin_amt = Number(txtBEGIN_DEPR_AMT.text);
    var begin_famt = Number(txtBEGIN_DEPR_FAMT.text);
    var depr_rate = Number(txtDEPR_RATE.text);
    var depr_TotalMM = Number(txtDEPR_MM.text);
    var d_yy = Number(txtUSE_DATE_YY.text);
    var d_mm = Number(txtDEPR_YY.text);
   // var Ex_rate = Number(txtTR_RATE.text);
    var Ex_rate = Number(lblBookRate.text);
    var depr_amt =0;
    var depr_famt =0;
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
                            depr_famt = Math.round((cost_famt * depr_rate ) /depr_TotalMM + Total);
                            depr_amt = Math.round((cost_amt * depr_rate ) /depr_TotalMM + Total_Book );
                 }
                else  if(lstCCY.value=='USD')  
                {
                             depr_famt = Math.round((cost_famt * depr_rate ) / depr_TotalMM  * 100)/100 + Total;
                             depr_amt = Math.round((cost_amt * depr_rate ) /depr_TotalMM + Total_Book);     
                }
        }
        else if(txtbookccy.text=='USD')
        {
                if(lstCCY.value=='VND')  
                {   
                         depr_famt = Math.round((cost_famt * depr_rate ) / depr_TotalMM + Total);
                         depr_amt = Math.round(((cost_amt * depr_rate ) / depr_TotalMM) *100)/100 + Total_Book;
						 //alert(depr_TotalMM);
                }
                else if(lstCCY.value=='USD')  
                {
                        depr_famt = Math.round(((cost_famt * depr_rate  ) / depr_TotalMM) * 100)/100 + Total;
                         depr_amt = Math.round(((cost_amt * depr_rate ) / depr_TotalMM) *100)/100 + Total_Book;
                }
        }
    }
    txtMONTH_DEPR_FAMT.SetDataText(""+ depr_famt);
	
    txtMONTH_DEPR_AMT.SetDataText(""+ depr_amt);
    
  
}
function OnchangeYear()
{
    //MonthlyDeprAmt();
    var currYear = Number(txtUSE_DATE_YY.GetData());
    var currMonth = Number(txtDEPR_YY.GetData());
    var updateTotalMonth=(currYear*12)+ currMonth;
    txtDEPR_MM.SetDataText("" + updateTotalMonth);
    UpdateCost();
    dso_get_tongsongaykhauhao.Call();
    
}
function OnchangeMonth()
{
    MonthlyDeprAmt();
    var currYear = Number(txtUSE_DATE_YY.GetData());
    var currMonth = Number(txtDEPR_YY.GetData());
    var updateTotalMonth=(currYear*12)+ currMonth;
    txtDEPR_MM.SetDataText("" + updateTotalMonth);
    UpdateCost();
    dso_get_tongsongaykhauhao.Call();
    
}
function UpdateRemainAMT()
{
  
    var cost_amt = Number(txtCOST_AMT.GetData());
    var cost_famt = Number(txtCOST_FAMT.GetData());
    var accum_dept_amt = Number(txtACCUM_DEPR_AMT.GetData());
    var accum_dept_famt = Number(txtACCUM_DEPR_FAMT.GetData());
    var BEGIN_DEPR_FAMT = Number(txtBEGIN_DEPR_FAMT.GetData());
    var BEGIN_DEPR_AMT = Number(txtBEGIN_DEPR_AMT.GetData());
    var SettxtFRemain=0;
    var SettxtRemain=0;
        SettxtFRemain= cost_famt - (accum_dept_famt + BEGIN_DEPR_FAMT);
        SettxtRemain = cost_amt - (accum_dept_amt + BEGIN_DEPR_AMT);
        txtREMAIN_FAMT.SetDataText("" + SettxtFRemain);
        txtREMAIN_AMT.SetDataText("" + SettxtRemain);
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
    var cost_famt1 = Number(txtCOST_FAMT.text);
    var cost_amt1 = Number(txtCOST_AMT.text);
    var depr_rate = Number(txtDEPR_RATE.text); 
    var depr_dd = Number(txtDEPR_DD.text);
    var daily = 0;
    var dailyf = 0;
    if(txtbookccy.text=='USD')
    {
            if(lstCCY.value=='VND')  
            {   
                daily = Math.round((cost_amt1 * depr_rate) /depr_dd *100)/100;
                dailyf = Math.round((cost_famt1 * depr_rate) / depr_dd);
            }
           else  if(lstCCY.value=='USD')  
           {
                daily = Math.round((cost_amt1 * depr_rate) /depr_dd *100)/100;
                dailyf = Math.round((cost_famt1 * depr_rate) / depr_dd *100)/100;
           }   
    }
    else if(txtbookccy.text=='VND')
    {
            if(lstCCY.value=='VND')  
            { 
                daily = Math.round((cost_amt1 * depr_rate) /depr_dd);
                dailyf = Math.round((cost_famt1 * depr_rate) / depr_dd);
            }
            else   if(lstCCY.value=='USD')  
            {
                  dailyf = Math.round((cost_famt1 * depr_rate) / depr_dd *100)/100;
                  daily = Math.round((cost_amt1 * depr_rate) /depr_dd);
            } 
    }
    txtDAY_DEPR_FAMT.SetDataText("" + dailyf);
    txtDAY_DEPR_AMT.SetDataText("" + daily);
    
}
//-----------------------------------------------------------------------------------------------------
function onNewAllocate()
{
    if(txtMasterPK.text =="")
    {
        alert("Please, select an asset to make expense allocation!");
    }
    else{
      var fpath = System.RootURL + "/standard/forms/60/13/60130120_multi_pl_popup.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCOMPANY.GetData() + '&dsqlid=ac_sel_60130120_pl_popup&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
        var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
        if ( object != null ) 
        {
            var temp= new Array();
            for(var i = 0 ; i< object.length ; i++)
            {
                    temp = object[i];                 
                    grdAllocate.AddRow();
                    grdAllocate.SetGridText(grdAllocate.rows-1,c_pl_pk,temp[2]);
                    grdAllocate.SetGridText(grdAllocate.rows-1,c_pl_cd,temp[0]);
                    grdAllocate.SetGridText(grdAllocate.rows-1,c_pl_nm,temp[1]);
                    
                     grdAllocate.SetGridText(grdAllocate.rows-1,c_acc_code_pk,txtEXPE_AC_PK.text);
                    grdAllocate.SetGridText(grdAllocate.rows-1,c_acc_code_id,txtEXPE_AC_CD.text);
                    grdAllocate.SetGridText(grdAllocate.rows-1,c_acc_code_nm,txtEXPE_AC_NM.text);

                    grdAllocate.SetGridText(grdAllocate.rows-1,c_asset_pk,txtMasterPK.text);
                    grdAllocate.SetGridText(grdAllocate.rows-1,c_type,lstType.value);
                    grdAllocate.SetGridText(grdAllocate.rows-1,c_yy_mm,txtMonth.value);
                
            }
            
        }
    }
   
}
function onGrdAllocateDblClick()
{
    var v_col = grdAllocate.col;     
    if(v_col==c_acc_code_id ||v_col== c_acc_code_nm)
    {
        GetAccount('4')
    }
}
function onGrdAllocateEdit()
{
     var v_col = grdAllocate.col; 
     var v_row =  grdAllocate.row; 
    if(lstType.value=='1') //ratio
    {
        if(v_col == c_ratio)
        {  
            var amt_tr = 0;
            var amt_bk =  0;
            var ratio = grdAllocate.GetGridData(v_row,c_ratio);

            if (Number(ratio)>0)
            {
                amt_tr = System.Round(Number(ratio)* Number(txtMONTH_DEPR_FAMT.text)/100,0);
                amt_bk = System.Round(Number(ratio)* Number(txtMONTH_DEPR_AMT.text)/100,0);
            }
            grdAllocate.SetGridText(v_row,c_depr_amt_tr,amt_tr);
            grdAllocate.SetGridText(v_row,c_depr_amt_bk,amt_bk);
        }    
    }else if(lstType.value=='2')
    {
        
        if(v_col == c_target)
        {
            var amt_tr = 0;
            var amt_bk =  0;
            var total_taget =0;
            total_taget = totalCols(c_target)
            var target =0, ratio =0;
            for (var i = 1; i<grdAllocate.rows; i++ )
            {
                ratio =0;
                amt_tr = 0;
                amt_bk = 0;
                target = grdAllocate.GetGridData(i,c_target);
                if (Number(target)>0)
                {
                 ratio = target/total_taget *100;
                  amt_tr = System.Round(Number(ratio)* Number(txtMONTH_DEPR_FAMT.text)/100,0);
                  amt_bk = System.Round(Number(ratio)* Number(txtMONTH_DEPR_AMT.text)/100,0);
                }
                grdAllocate.SetGridText(i,c_ratio,ratio);
                grdAllocate.SetGridText(i,c_depr_amt_tr,amt_tr);
                grdAllocate.SetGridText(i,c_depr_amt_bk,amt_bk);
            }
        }
    }
    setTotalAllocate();
}
function totalCols(p_col)
{
    var  r_value = 0;
    for(var i =1; i< grdAllocate.rows; i++)
    {
        r_value = r_value + Number(grdAllocate.GetGridData(i, p_col));
    }
    return r_value;
}

function setTotalAllocate()
{
    txtTotalRate.text = totalCols(c_ratio);
    txtTotalTaget.text = totalCols(c_target);
    txtTotalDeprTr.text  = totalCols(c_depr_amt_tr);
    txtTotalDeprBk.text  = totalCols(c_depr_amt_bk);
}

function onReAllocate()
{
    if(lstType.value=='1') //ratio
    {
         var amt_tr = 0;
         var amt_bk =  0;
         var ratio = 0;
         for (var i = 1; i<grdAllocate.rows; i++ )
            {
                amt_tr = 0;
                amt_bk = 0;
                 ratio = grdAllocate.GetGridData(i,c_ratio);
                  if (Number(ratio)>0)
                {
                    amt_tr = System.Round(Number(ratio)* Number(txtMONTH_DEPR_FAMT.text)/100,0);
                    amt_bk = System.Round(Number(ratio)* Number(txtMONTH_DEPR_AMT.text)/100,0);
                }
                grdAllocate.SetGridText(i,c_depr_amt_tr,Math.round(amt_tr));
                grdAllocate.SetGridText(i,c_depr_amt_bk,Math.round(amt_bk));
            }
          
    }else
    {
        
        
            var amt_tr = 0;
            var amt_bk =  0;
            var total_taget =0;
            total_taget = totalCols(c_target)
            var target =0, ratio =0;
            for (var i = 1; i<grdAllocate.rows; i++ )
            {
                ratio =0;
                amt_tr = 0;
                amt_bk = 0;
                target = grdAllocate.GetGridData(i,c_target);
                if (Number(target)>0)
                {
                 ratio = target/total_taget *100;
                  amt_tr = System.Round(Number(ratio)* Number(txtMONTH_DEPR_FAMT.text)/100,0);
                  amt_bk = System.Round(Number(ratio)* Number(txtMONTH_DEPR_AMT.text)/100,0);
                }
                grdAllocate.SetGridText(i,c_ratio,ratio);
                grdAllocate.SetGridText(i,c_depr_amt_tr,amt_tr);
                grdAllocate.SetGridText(i,c_depr_amt_bk,amt_bk);
            }
        }
     setTotalAllocate();
}

//------------------------------s---------------------------------------------------------------
function onSaveAllocate()
{
    if(txtMasterPK.text != "")
    {
        if(totalCols(c_ratio) >100)
        {
            alert("Total ratio is greater than 100 percent. Please, check ratio again!");
        }else
        {
        dso_upd_fa_allocate.Call();
        }
    }
}
//---------------------------------------------------------------------------------------------
function onDeleteAllocate()
{
	if(confirm("Do you want to delete this row ?"))
    {
        grdAllocate.DeleteRow();
        dso_upd_fa_allocate.Call();
    }
}

function onCopyAllocate()
{
    dso_get_allocate_copy.Call();
}
//------------------------------------------------------------------------------------------------------
</script>

<body>
<!------------------------------------------------------------------------>
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60130120_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!------------------------------------------------------------------------>
<gw:data id="dso_getCompany1" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60130120_company" > 
                <input> 
                     <input bind="txtProposedByUserPk"/>
                </input>
                <output>
                     <output bind="lstCompany1"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!------------------------------------------------------------------------>

    <gw:data id="dso_searchMST" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60130120_search">
                <input bind="grdSearch">
                    <input bind="lstCompany1"/>  
                    <input bind="txtPONoSearch"/>
                    <input bind="lstStatusSearch"/>
                    <input bind="lstdate"/>
                    <input bind="dtFrom"/>
                    <input bind="dtTo"/>   
                    <input bind="lstAsset_Type"/>   
                                                        
                </input>
                <output bind="grdSearch"/>
            </dso> 
        </xml>
    </gw:data>
    <!--------------------------------------------------------------------------------->
    <gw:data id="dso_get_exrate_list" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="ac_sel_60130120_get_rate" > 
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
            <dso type="list" procedure="ac_sel_60130120_get_bookccy"> 
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
            <dso type="process" procedure="ac_pro_60130120_get_rate"> 
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
            <dso type="process" procedure="ac_pro_60130120_acc_cd_auto"> 
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
    <gw:data id="dso_upd_fa_gfgf50" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78" function="ac_sel_60130120_control" procedure = "ac_upd_60130120_control">
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
                
				<inout bind="txt_seq_73"/>
				<inout bind="txtModel_74"/>
                <inout bind="txtSupplier_75"/>
				<inout bind="txtSupplierpk_76"/>
                <inout bind="txtManufacturer_77"/>
				
			    <inout bind="txtremainday_78"/>
                <inout bind="txtDepreciatedEnd"/>
			    <inout bind="lblBookRate"/>
				<inout bind="lstAsset_Type2"/>
				
              </inout>              
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="dso_upd_fa_detail" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10"  function="ac_sel_60130120_dtl" procedure="ac_upd_60130120_dtl">
                <input bind="grdDetail1">
                    <input bind="txtMasterPK"/>
                </input>
                <output bind="grdDetail1"/>
            </dso> 
        </xml>
    </gw:data>
<!------------------------------------------------------------------------------------->    
<gw:data id="dso_get_tongsongaykhauhao" onreceive="OnDataReceive(this)" >
        <xml> 
            <dso type="process" procedure="ac_pro_60130120_khau_hao">
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
    <gw:data id="dso_upd_fa_allocate" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15"  function="ac_sel_60130120_allocate" procedure="ac_upd_60130120_allocate">
                <input bind="grdAllocate">
                    <input bind="txtMasterPK"/>
                    <input bind="txtMonth"/>
                </input>
                <output bind="grdAllocate"/>
            </dso> 
        </xml>
    </gw:data>

    <!------------------------------------------------------------------------------------->    
<gw:data id="dso_get_allocate_copy" onreceive="OnDataReceive(this)" >
        <xml> 
            <dso type="process" procedure="ac_pro_60130120_allocate_copy">
                <input> 
                     <input bind="txtMasterPK"/>
                      <input bind="txtMonth"/>
                </input>
                <output>
                     <output bind="txtReturn"/>
               </output> 
            </dso> 
        </xml>
    </gw:data>
<!------------------------------------------------------------------------------------->
    <table cellpadding="0" cellspacing="0" style="width: 100%; height: 100%" border="1">
        <tr valign="top">
            <td id="left" style="width: 35%">
                <table style="width: 100%; height:100%" border="0" cellpadding='1' cellspacing='1'>
                    <tr  >
                        <td style="width: 40%" align="right">Company</td>
                        <td style="width: 60%"><gw:list id="lstCompany1" styles="width: 100%" /></td>
                        <td ><gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" /></td>
                    </tr>               
                    <tr  >
                        <td style="width:" align="right">Asset</td>
                        <td style="width: " colspan='2'><gw:textbox id="txtPONoSearch" styles="width: 100%" onenterkey="OnSearch()" /></td>
                    </tr>
                    <tr  >
                        <td style="width: " align="right">Status</td>
                        <td style="width: " colspan='2'><gw:list id="lstStatusSearch" styles="width: 100%" onchange="OnSearch()" /></td>
                    </tr>
                    <tr  >
                        <td style="width: " align="right">Asset Type</td>
                        <td style="width: " colspan='2'><gw:list id="lstAsset_Type" styles="width: 100%" onchange="OnSearch()" /></td>
                    </tr>
                    <tr  >
                        <td style="width: "><gw:list id="lstdate" styles="width:100%;" onchange="OnSearch()" /></td>
                        <td colspan='2'>
                            <table width="100%" cellpadding="0" cellspacing="0" >
                                <tr  >
                                    
                                    <td style="width: "><gw:datebox id="dtFrom" lang="1" /></td>
                                    <td >~</td>
                                    <td style="width: "><gw:datebox id="dtTo" lang="1" /></td>
                                    <td width='100%'></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr  valign="top" style="height:94%">
                        <td colspan='3'>
                            <table style="width: 100%; height:100%">
                                <tr valign="top">
                                    <td>
                                        <gw:grid id="grdSearch" 
                                        header="_PK|Asset No|Asset name" 
                                        format="0|0|0" 
                                        aligns="0|0|0"
                                        defaults="||" 
                                        editcol="0|0|0" 
                                        widths="0|1200|2000" 
                                        styles="width:100%; height:100%"
                                        sorting="T" 
                                        oncellclick="OnCellclickGrid()" 
                                        />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
            <td id="right" style="width: 65%" valign="top">
                <table width="100%" cellpadding="0" cellspacing="0" border=0>
                    <tr valign="top">
                        <td width="10%" align="left">Tag ID</td>
                        <td width="30%"><gw:textbox id="txtTagID" styles="width:100%;" /></td>
                        <td width="10%" align="right">Status</td>
                        <td width="15%"><gw:list id="lstStatus" styles="width: 100%" onchange="onChangeStatus()" /></td>
                        <td width="12%"  align=right>Unsed date</td>
                        <td width="2%"><gw:datebox id="txtunUSE_DATE" nullaccept=1  lang="<%=Session("Lang")%>"/></td>
                        
                        <td width="2%"><gw:imgbtn id="btnNewMST" img="new" alt="New" onclick="OnNew()" /></td>
                        <td width="2%"><gw:imgbtn id="btnSaveMST" img="save" alt="Save" onclick="OnSave()" /></td>
                         <td width="2%"><gw:imgbtn id="btnDeleteMST" img="delete" alt="Delete" onclick="OnDelete()" /></td>
						 <td width="2%" align="right"><gw:imgbtn id="btnPrint" img="excel" alt="Fixed Asset Card" onclick="OnPrintDTL()" /></td>
                         <td width="2%" align="right"><gw:imgbtn id="btnPrint" img="excel" styles="display:none" alt="Fixed Asset Card" onclick="OnPrint()" /></td>
                         
                    </tr>
                    <tr>
                        <td width="5%">Language</td>
				                            <td width="20%" colspan=1><gw:list id="lstLang" onchange="OnChangeLang()" styles='width:100%' /></td>
                    </tr>
                    <tr>
                        <td colspan="11" width="100%">
                            <gw:tab id="idTab" style="border1px">
                                <table id='tMain' name= "General Info" width=100% cellpadding=0 cellspacing=0 border=0>
                                    <tr>
                                        <td width=100%>
                                           <table border="1" cellpadding=0 cellspacing="1" width="100%">
                                              <tr>
                                                <td width="85%" id="t-left">
                                                <table border="0" cellpadding=0 cellspacing="0" width="100%">
                                                  <tr>
                                                    <td width="17%">Company</td>
                                                    <td width="84%" colspan="5"><gw:list id="lstCOMPANY" maxlen = "20" styles='width:100%;'/></td>
                                                  </tr>
                                                  <tr>
                                                    <td width="17%"><a title="Click here to select group" onClick="OnPopUpDept()" href="#tips"
                                                        style="text-decoration: none; color=#0000ff"><b>Group</b></a></td>
                                                    <td width="69%" colspan="3"><gw:textbox id="txtFA_Group" maxlen = "20" styles='width:100%;' csstype="mandatory" onchange="CheckExist()"/></td>
                                                    <td width="5%">Unit</td>
                                                    <td width="10%"><gw:list id="lstUNIT"  styles='width:100%' /></td>
                                                  </tr>
                                                  <tr>
                                                    <td width="24%">Asset code</td>
                                                    <td width="48%"><gw:textbox id="txtFA_CD" csstype="mandatory" maxlen = "50" styles='width:100%;'/></td>
                                                    <td width="7%" align=right>Auto</td>
                                                    <td width="7%"><gw:checkbox  id="chkAuto" value="T" /></td>
                                                    <td width="5%" align="right">len</td>
                                                    <td width="10%"><gw:list id="lstlen"  styles='width:100%'/>
                                                     </td>
                                                  </tr>
                                                  <tr>
                                                    <td width="17%">Asset name</td>
                                                    <td width="84%" colspan="5"><gw:textbox id="txtFA_NM" styles="width:100%;" csstype="mandatory" onenterkey="" /></td>
                                                  </tr>
                                                  <tr>
                                                    <td width="17%">Local name</td>
                                                    <td width="84%" colspan="5"><gw:textbox id="txtFA_LNM" styles="width:100%;" onenterkey="" /></td>
                                                  </tr>
                                                  <tr>
                                                    <td width="17%">Kor. name</td>
                                                    <td width="84%" colspan="5"><gw:textbox id="txtFA_KNM" styles="width:100%;" onenterkey="" /></td>
                                                  </tr>
                                                 
                                                  <tr>
                                                    <td width="17%">Kind</td>
                                                    <td width="84%" colspan="5"><gw:list id="lstKIND_CD"  styles='width:100%' /></td>
                                                  </tr>
                                                  <tr>
                                                    <td width="17%">Department</td>
                                                    <td width="84%" colspan="5"><gw:list  id="lstEODEPT_NM" value='ALL' maxlen = "100" styles='width:100%'onchange="" /></td>
                                                  </tr>
                                                  <tr>
                                                    <td width="17%"><a title="Click here to show Charger" onClick="OnShowProject('Charger')" href="#tips" ><b>Charger&nbsp;</b></a></td>
                                                    <td width=84% colspan=6>
                                                        <table width=100% cellpadding=0 cellspacing=0>
                                                             <tr>
                                                                <td width="95%" ><gw:textbox id="txtChargerNM" styles="width:100%;" csstype="mandatory" onenterkey="" /></td>
                                                                <td width="5%"><gw:imgBtn id="ibtnResetdept" styles="width:100%;"  img="reset"  alt="reset Department" onclick="OnResetProject('1')" /></td>
                                                                <td width="5%" ><gw:textbox id="txtChargerPK" styles='width:100%;display:none' /></td>
                                                             </tr>
                                                        </table>
                                                    </td>
                                                  </tr>
                                                   <tr>
                                                    <td width="17%"><a title="Click here to show PL Unit" onClick="OnShowProject('Unit')" href="#tips" ><b>PL Unit&nbsp;</b></a></td>          
                                                    <td width=84% colspan=6>
                                                        <table width=100% cellpadding=0 cellspacing=0>
                                                             <tr>
                                                                <td width="30%" ><gw:textbox id="txtABPL_CD" styles="width:100%;" csstype="mandatory" onenterkey="" /></td>
                                                                <td width="65%" ><gw:textbox id="txtABPL_NM" styles="width:100%;" csstype="mandatory" onenterkey="" /></td>
                                                                <td width="5%"><gw:imgBtn id="ibtnResetdeptPL" styles="width:100%;" img="reset"  alt="reset Department" onclick="OnResetProject('2')" /></td>
                                                                <td width="70%" ><gw:textbox id="txtABPL_PK" styles='width:100%;display:none' /></td>
                                                             </tr>
                                                        </table>
                                                    </td>
                                                  </tr>
                                                  
                                                  <tr>
                                                    <td width="17%">Description</td>
                                                    <td width="84%" colspan="5"><gw:textbox id="txtDescr" styles="width:100%;" onenterkey="" /></td>
                                                  </tr>
                                                  <tr>
                                                    <td width="17%">L.Description</td>
                                                    <td width="84%" colspan="5"><gw:textbox id="txtLDescr" styles="width:100%;" onenterkey="" /></td>
												
													
                                                  </tr>
													<tr>
														<td style="width: " >Asset Type</td>
														<td style="width: " colspan='5'><gw:list id="lstAsset_Type2" styles="width: 100%" onchange="" /></td>
													</tr>
                                                </table>
                                                </td>
                                                <td width="1%" ><img status="expand" id="img1" src="../../../../system/images/button/next.gif" style="cursor: hand;
                                                        position: fixed" onClick="OnToggle('Picture')" /></td>
                                                <td width="28%" id="t-right" ><gw:image id="imgItem" table_name="TAC_BPPHOTO" oid="0" view="/binary/ViewFile.aspx"
                                                  post="/binary/PostFile.aspx" styles="width:130;height:260" /></td>
                                              </tr>
                                              <tr>
                                              <td width="100%"  colspan="3">
                                                 <table cellpadding=0 cellspacing=0 border=0>
                                                    <tr>
                                                        <td width=90%></td>
                                                        <td  ><gw:imgBtn id="ibtnNew"    img="new"       alt="New"           onclick="onNewDetail()" /></td>
                                                        <td ><gw:imgBtn id="ibtnSave"   img="save"      alt="Save"          onclick="onUpdateDetail()" /></td>
                                                        <td ><gw:imgBtn id="ibtnDelete" img="delete"    alt="Delete"        onclick="onDeleteDetail()" /></td>
                                                    </tr>
                                                </table>
                                              </td>  
                                              </tr>
                                              <tr>
                                              <td width="100%" colspan="3">
                                                 <gw:grid
                                                id="grdDetail1"
                                                header  ="_mst_pk|_pk|Date|Voucher No|Type|Trans. Amt|Book Amt|Depreciation Date|Months|remark|remark2"
                                                format  ="0|0|4|0|2|1|1|4|1|0|0"
                                                aligns  ="0|0|0|0|0|3|3|1|3|0|0"
                                                defaults="||||||||||"
                                                editcol ="0|0|1|1|1|1|1|1|1|1|1"
                                                widths  ="0|0|1800|1800|1800|1800|1800|2000|1800|3000|3000"
                                                styles  ="width:100%; height:160"
                                                sorting ="F"
				                                /> 
                                             </td>
                                              </tr>

                                            </table>
                                        </td>
                                    </tr>
                                </table>
                              
                              <table id='Table1' name= "More Info" width=100% cellpadding=0 cellspacing=0 border=1>
                                    <tr>
                                        <td width=100%>
                                           <table border="0" cellpadding=0 cellspacing="1" width="100%">
                                              <tr>
                                                <td>
                                                   <fieldset style="padding: 2">
                                                  <legend style="color:Teal">General Ledger Information</legend>
                                                  <table border="0" cellpadding=0 cellspacing="0" width="100%">
                                                    <tr>
                                                      <td width="30%"><a title="Click here to select Requester" onClick="GetAccount('1')" href="#tips"
                                                          style="text-decoration: none; color=#0000ff"><b>Asset Acct. Code</b></a></td>
                                                      <td width="15%"> <gw:textbox id="txtFA_AC_CD" styles="width:100%;" csstype="mandatory" onenterkey="" />
                                                                        <gw:textbox id="txtFA_AC_PK" styles="width:100%;display:none" onenterkey="" /></td>
                                                      <td width="50%"><gw:textbox id="txtFA_AC_NM" styles="width:100%;" csstype="mandatory" onenterkey="" /></td>
                                                      <td width="5%"><gw:imgBtn id="ibtnResetdeptAsset" styles="width:100%;" img="reset"  alt="reset Department" onclick="OnResetProject('3')" /></td>
                                                    </tr>
                                                    <tr>
                                                      <td width="30%"><a title="Click here to select Requester" onClick="GetAccount('2')" href="#tips"
                                                          style="text-decoration: none; color=#0000ff"><b>Depr. Acct. Code</b></a></td>
                                                      <td width="15%"> <gw:textbox id="txtDEPR_AC_CD" styles="width:100%;" csstype="mandatory" onenterkey="" />
                                                                        <gw:textbox id="txtDEPR_AC_PK" styles="width:100%;display:none" onenterkey="" /></td>
                                                      <td width="50%"><gw:textbox id="txtDEPR_AC_NM" styles="width:100%;" csstype="mandatory" onenterkey="" /></td>
                                                      <td width="5%"><gw:imgBtn id="ibtnResetdeptDepr" styles="width:100%;" img="reset"  alt="reset Department" onclick="OnResetProject('4')" /></td>
                                                    </tr>
                                                    <tr>
                                                      <td width="30%"><a title="Click here to select Requester" onClick="GetAccount('3')" href="#tips"
                                                          style="text-decoration: none; color=#0000ff"><b>Expe. Acct. Code</b></a></td>
                                                      <td width="15%"> <gw:textbox id="txtEXPE_AC_CD" styles="width:100%;" csstype="mandatory" onenterkey="" />
                                                                        <gw:textbox id="txtEXPE_AC_PK" styles="width:100%;display:none" onenterkey="" /></td>
                                                      <td width="50%"><gw:textbox id="txtEXPE_AC_NM" styles="width:100%;" csstype="mandatory" onenterkey="" /></td>
                                                      <td width="5%"><gw:imgBtn id="ibtnResetdeptExp" styles="width:100%;" img="reset"  alt="reset Department" onclick="OnResetProject('5')" /></td>
                                                    </tr>
                                                  </table>
                                                  </fieldset>
                                                </td>
                                              </tr>
                                              <!--------------------------------------------------------------->
                                              <tr>
                                                <td>
                                                   <fieldset style="padding: 2">
                                                  <legend style="color:Teal">Depreciation Information</legend>
												  <table border="0" cellpadding=0 cellspacing="0" width="100%">
														<tr>
															<td>
																<table border="0" cellpadding=0 cellspacing="0" width="100%">
																	<tr>
																	  <td width="20%">Depr. method</td>
																	  <td width="40%"><gw:list id="lstDEPR_METHOD"  styles='width:100%' /></td>
																	  <td width="15%" align=right>Depr. rate</td>
																	  <td width="25%" ><gw:textbox id="txtDEPR_RATE"  text="1" type="number" format="###,###.##R" styles="text-align:right;width:100%;height:22" /></td>
																	</tr>
																</table>
															</td>
														</tr>
                                                    <tr>
                                                    <td>
                                                    <table border="0" cellpadding=0 cellspacing="0" width="100%">
                                                    <tr>
                                                      <td width="20%">Service Date</td>
                                                      <td width="40%" colspan=2><gw:datebox id="txtUSE_DATE"  lang="<%=Session("Lang")%>"/></td>
                                                      <td width="15%" align=right>Depr. Date</td>
                                                      <td width="25%" ><gw:datebox id="txtDEPR_DATE" nullaccept onchange="DailyDepr()"  lang="<%=Session("Lang")%>"/></td>
                                                    </tr>
                                                    </table>
                                                    </td>
                                                      
                                                    </tr>
                                                    <tr>
                                                    <td>
                                                    <table border="0" cellpadding=0 cellspacing="0" width="100%">
                                                    <tr>
                                                      <td width="20%">Estimate Life </td>
                                                      
                                                      
                                                      <td width="80%" colspan="3">
                                                             <table cellpadding="0" cellspacing="0" width:100%>
                                                                  <tr>
                                                                        <td width="10%"><gw:textbox id="txtUSE_DATE_YY" maxlen="10" type="number" onchange="OnchangeYear()" format="###,###,###" onEnterkey = "OnchangeYear()" /></td>
                                                                        <td width="15%" align="left">Year(s)</td>
                                                                        <td width="10%"><gw:textbox id="txtDEPR_YY" type="number" onchange="OnchangeMonth()" format="###,###,###"  onenterkey = "OnchangeMonth()"/></td>
                                                                        <td width="15%" align="left">Month(s)</td>
                                                                        <td width="10%"><gw:textbox id="txtDEPR_MM" onchange="OnchangeMonth()" type="number" format="###,###,###" readonly="true"   /></td>
                                                                        <td width="15%" align="left">Months(s)</td>
                                                                        <td width="10%"><gw:textbox id="txtDEPR_DD" type="number" format="###,###,###"  readonly="true" /></td>
                                                                        <td width="15%" align="left">Day(s)</td>
                                                                  </tr>
                                                             </table>
                                                      </td>
                                                      
                                                    </tr>
													 <tr>
                                                      <td width="20%">Remain day(s) </td>
                                                      <td colspan="3">
                                                        <table cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td width="50%" ><gw:textbox id="txtremainday_78" maxlen="10" type="number" format="###,###,###" /></td>
                                                                <td width="50%" align="right">Depreciated (End date)&nbsp;</td>
                                  	                            <td width=""><gw:datebox id="txtDepreciatedEnd" nullaccept lang="1"/></td>
                                                            </tr>
                                                        </table>
                                                      </td>  
                                                    </tr>
                                                    </table>
                                                    </td>
                                                    </tr>
                                                    <tr>
                                                    <td>
                                                    <table border="0" cellpadding=0 cellspacing="0" width="100%">
                                                    <tr>
                                                      <td width="20%">Currency &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                      <td width="20%"><gw:list id="lstCCY"  styles='width:100%' onchange="GetRate()" /></td>
                                                      <td width="15%" align=Right>Ex. Rate&nbsp;</td>
                                                      <td width="10%" align=right><gw:textbox id="txtBK_RATE"  type="number" format="###,###.##" text="1" styles="text-align:right;width:100%;" /></td>
                                                      <td width="10%"><gw:textbox id="txtTR_RATE"  type="number" text="1" format="###,###.##" styles="text-align:right;width:100%;" /></td>
                                                      <td width="15%" align=Right>Book Rate&nbsp;</td>  
                                                      <td width="10%"><gw:textbox id="lblBookRate" format="###,###,###,###.##"   type="number"  styles="width:100%;display:"/></td>
                                                    </tr>
                                                    </table>
                                                    </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                     <td>
                                                    <table border="0" cellpadding=0 cellspacing="0" width="100%">
                                                    <tr>
                                                      <td width="20%">Original Cost</td>
                                                      <td width="40%" colspan=2><gw:textbox id="txtCOST_FAMT"  type="number" format="###,###,###,###.##R" onchange="UpdateCost()" onenterkey="UpdateCost()" styles="text-align:right;width:100%;"/></td>
                                                      <td width="40%" colspan=2><gw:textbox id="txtCOST_AMT" type="number" format="###,###,###,###.##R"  styles="text-align:right;width:100%;color:red"/></td>                               
                                                    </tr>
                                                    </table>
                                                    </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                    <td>
                                                    <table border="0" cellpadding=0 cellspacing="0" width="100%">
                                                    <tr>
                                                      <td width="20%">Begin Depr.</td>
                                                     <td width="40%" colspan="2"><gw:textbox id="txtBEGIN_DEPR_FAMT" type="number" format="###,###,###,###.##R" onchange="UpdateBeginDepr()" onenterkey="UpdateBeginDepr()" styles="text-align:right;width:100%;"/></td>
                                                     <td width="40%" colspan="2"><gw:textbox id="txtBEGIN_DEPR_AMT" type="number" format="###,###,###,###.##R" styles="text-align:right;width:100%;color:red"/></td>
                                                    </tr>
                                                    </table>
                                                    </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                    <td>
                                                    <table border="0" cellpadding=0 cellspacing="0" width="100%">
                                                    <tr>
                                                      <td width="20%">Monthly Depr.</td>
                                                    <td width="40%"><gw:textbox id="txtMONTH_DEPR_FAMT" text="0" type="number" format="###,###,###,###.##R" onenterkey="onReAllocate()"   styles="text-align:right;width:100%;"/></td>
                                                    <td width="40%"><gw:textbox id="txtMONTH_DEPR_AMT" type="number" format="###,###,###,###.##R" styles="text-align:right;width:100%;color:red"/></td>
                                                    </tr>
                                                    <tr>
                                                        <td width="20%">Daily Depr.</td>
                                                        <td width="40%"><gw:textbox id="txtDAY_DEPR_FAMT" text="0" type="number" format="###,###,###,###.##R"   styles="text-align:right;width:100%;"/></td>
                                                        <td width="40%"><gw:textbox id="txtDAY_DEPR_AMT" type="number" format="###,###,###,###.##R" styles="text-align:right;width:100%;color:red"/></td>
                                                    </tr>
                                                    </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                <td>
                                                    <table border="0" cellpadding=0 cellspacing="0" width="100%">
                                                    <tr>
                                                      <td width="20%">Accum. Depr.</td>
                                                    <td width="40%"><gw:textbox id="txtACCUM_DEPR_FAMT" onchange="OnchangeAccDept()" onenterkey="OnchangeAccDept()" type="number" format="###,###,###,###.##R" styles="text-align:right;width:100%;"/></td>
                                                    <td width="40%"><gw:textbox id="txtACCUM_DEPR_AMT"  type="number" format="###,###,###,###.##R" styles="text-align:right;width:100%;color:red"/></td>
                                                    </tr>
                                                    </table>
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                <td>
                                                    <table border="0" cellpadding=0 cellspacing="0" width="100%">
                                                    <tr>
                                                      <td width="20%">Remain. Amt.</td>
                                                    <td width="40%" ><gw:textbox id="txtREMAIN_FAMT" type="number"  format="###,###,###,###.##R" styles="text-align:right;width:100%;"/></td>
                                                    <td width="40%"><gw:textbox id="txtREMAIN_AMT"  type="number"   format="###,###,###,###.##R" styles="text-align:right;width:100%;color:red"/></td>
                                                    </tr>
                                                    </table>  
                                                    </td>
                                                </tr>
                                                  </table>
                                                  </fieldset>
                                                  
                                                </td>
                                              </tr>
                                              <!------------------------------------------------------>
                                              <tr>
                                                <td>
                                                    <fieldset style="padding: 2">
                                                      <legend style="color:Teal">Expense Allocate</legend>
                                                      <table border="0" cellpadding=0 cellspacing="0" width="100%">
                                                        <tr>
                                                            <td>
                                                                <table border="0" cellpadding=0 cellspacing="0" width="100%">
                                                                    <tr>
                                                                       <td width="10%">Month</td>
                                                                      <td width="15%" colspan="2"><gw:datebox id="txtMonth" type="month" lang="<%=Session("Lang")%>"  onchange="dso_upd_fa_allocate.Call('SELECT')" /></td>
                                                                      <td width="10%" align="right">Type</td>
                                                                      <td width="15%"><gw:list id="lstType" styles='width:100%'  /></td>
                                                                       <td width="30%"></td>
                                                                       <td  width="5%" ><gw:imgBtn id="ibtnCopyEx"    img="copy"       alt="Copy"           onclick="onCopyAllocate()" /></td>
                                                                        <td  width="5%" ><gw:imgBtn id="ibtnNewEx"    img="new"       alt="New"           onclick="onNewAllocate()" /></td>
                                                                        <td width="5%" ><gw:imgBtn id="ibtnSaveEx"   img="save"      alt="Save"          onclick="onSaveAllocate()" /></td>
                                                                        <td width="5%" ><gw:imgBtn id="ibtnDeleteEx" img="delete"    alt="Delete"        onclick="onDeleteAllocate()" /></td>
                                                                    </tr>
                                                                </table >
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                                <td width="100%" colspan="3">
                                                                 <gw:grid
                                                                id="grdAllocate"
                                                                header  ="_pk|_asset_pk|_pl_pk|P/L Code|PL Name|_acc_code_pk|Exp. Acc. Code|Exp. Acc. Name|_Type|Ratio(%)|Target|Depr. Amt Tr|Depr. Amt Bk|Description|Local Description|_SD_YM"
                                                                format  ="0|0|0|0|0|0|0|0|0|1|1|1|1|0|0|0"
                                                                aligns  ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                                                                defaults="||||||||||||||||"
                                                                editcol ="0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"
                                                                widths  ="0|0|0|1500|2000|0|1500|2000|1000|1500|1500|1500|1500|3000|3000|0"
                                                                styles  ="width:100%; height:160"
                                                                sorting ="F"
                                                                oncelldblclick="onGrdAllocateDblClick()"
                                                                onafteredit="onGrdAllocateEdit()"
				                                                /> 
                                                             </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table style="background-color:Aqua; width:100%" >
                                                                    <tr style="width:100%">
                                                                            <td width="10%" align="right">Ratio(%)</td>
                                                                            <td width="10%"><gw:textbox id="txtTotalRate" type="number" readonly="true"  format="###,###,###" /></td>
                                                                            <td width="10%" align="right">Target</td>
                                                                            <td width="10%"><gw:textbox id="txtTotalTaget"  type="number" format="###,###,###" readonly="true"   /></td>
                                                                            <td width="15%" align="right">Depr. Amt TR</td>
                                                                            <td width="15%"><gw:textbox id="txtTotalDeprTr" type="number" format="###,###,###"  readonly="true" /></td>
                                                                            <td width="15%" align="right">Depr. Amt BK</td>
                                                                            <td width="15%"><gw:textbox id="txtTotalDeprBk" type="number" format="###,###,###"  readonly="true" /></td>
                                                                    </tr>
                                                                </table>
                                                            </td>                                                      
                                                        </tr>
                                                      </table>
                                                      </fieldset>

                                                </td>
                                              </tr>
                                              <!------------------------------------------------------>
                                              <tr>
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
                                        </td>
                                    </tr>
                                </table>   
                              <table id='Table2' name= "Received & Disposal Info" width=100% cellpadding=0 cellspacing=0 border=1>
                                    <tr>
                                        <td width=100%>
                                           <table border="0" cellpadding=0 cellspacing="1" width="100%">
                                              <tr>
                                                <td width="20%">Date of issuing card</td>
                                                <td width="15%"><gw:datebox id="txtDate_of_issuing_card" nullaccept=1  lang="<%=Session("Lang")%>"/></td>
                                              
                                              </tr>
                                              <tr>
                                                <td width="20%">Chief account</td>
                                                <td width="35%"><gw:textbox id="txtChiefaccount" /></td>
                                              </tr>
                                              <tr>
                                                <td width="20%">Date of delivery and receiving</td>
                                                <td width="15%"><gw:datebox id="txtDate_of_receiving" nullaccept=1  lang="<%=Session("Lang")%>"/></td>
                                              </tr>
                                              <tr>
                                              
                                                <td width="20%">Minutes of delivery and receiving No.</td>
                                                <td width="35%"><gw:textbox id="txtMinutes" /></td>
                                              </tr>
                                               <tr>
                                                <td width="20%">Date ceased using fixed asset</td>
                                                <td width="15%"><gw:datebox id="txtDate_ceased" nullaccept=1  lang="<%=Session("Lang")%>"/></td>
                                               </tr>
                                               <tr>
                                                
                                                <td width="20%">Reason for not using</td>
                                                <td width="35%"><gw:textarea rows=3 id="txtReason" styles="width: 100%" /></td>
                                              </tr>
                                              
                                            

                                            </table>
                                        </td>
                                    </tr>
                                </table>   
                             </gw:tab>
                        </td>
                    </tr>
            </td>
        </tr>
    </table>
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtMasterPK" styles="width: 100%;display: none" />
    <!--------------------------------------------------------------------------->
    <img status="expand" id="imgArrow" src="../../../../system/images/button/previous.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onClick="OnToggle('SearchList')" />
    <!--------------------------------------------------------------------------->
    <gw:textbox id="txtOrigin_PK" styles='width:100%;display:none' />
    <gw:textbox id="txtComCodeID" styles='width:100%;display:none' />
     
    <gw:list id="lstBookExRate" styles="width:100%;display:none" />
    <gw:textbox id="txtbookccy" styles="width:95%;display:none"  /> 

    <!------------------------------------------->
   <gw:textbox id="txtFA_pk" lang="1" style="display:none " />
   <gw:textbox id="txt_row"        styles='display:none'/>
   <gw:textbox id="txt_seq_73"        styles='display:none'/>
  
    <gw:datebox id="dbcurdate" lang="1" style="display: none" />
   <gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
   <!----------------------------------------------->
   <gw:textbox id="txtReturn" styles='width:100%;display:none' />

</body>
</html>