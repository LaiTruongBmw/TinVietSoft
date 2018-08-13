<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>
    
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">
var click_tab0   = true;
var click_tab1   = true;
var click_tab2   = true;
var click_tab3   = true;
var click_tab4   = true;
function BodyInit()
{
	
	System.Translate(document); 
    //txtEODEPT_PK.SetEnable(false);
    //txtEODEPT_NM.SetEnable(false);
    txtFA_AC_CD.SetEnable(false);
    txtFA_AC_NM.SetEnable(false);
    txtDEPR_AC_CD.SetEnable(false);
    txtDEPR_AC_NM.SetEnable(false);
    txtEXPE_AC_CD.SetEnable(false);
    txtEXPE_AC_NM.SetEnable(false);
    txtABPL_CD.SetEnable(false);
    txtABPL_NM.SetEnable(false);
    
    txtMONTH_DEPR_FAMT.SetEnable(false);
    txtMONTH_DEPR_AMT.SetEnable(false);
    txtACCUM_DEPR_FAMT.SetEnable(false);
    txtACCUM_DEPR_AMT.SetEnable(false);
    txtREMAIN_FAMT.SetEnable(false);
    txtREMAIN_AMT.SetEnable(false);
    txtRatio_Total.SetEnable(false);
    txtTaget_Total.SetEnable(false);
    txtTrans_AMT_Total.SetEnable(false);
    txtBooks_AMT_Total.SetEnable(false);
    
    
    txtDEPR.text ="0";
    BindingDataList();
    
    dso_upd_fa_entry.StatusInsert();
    
    OnReset();
}

function BindingDataList()
{
	var ls_comp         = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_unit         = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACDF0050','','') FROM DUAL")%>";
    var ls_depr_method  = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACDF0060','','') FROM DUAL")%>";
    var ls_kind_cd      = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACDF0010','01','') FROM DUAL")%>";
    var ls_ccy          = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>";
    var ls_status       = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACDF0070','01','') FROM DUAL")%>";
    <%=CtlLib.SetGridColumnComboFormat("grdDetail", 3,"SELECT   'I', 'Increase' from dual union SELECT   'D', 'Descrease' from dual")%>;
    <%=CtlLib.SetGridColumnComboFormat("grdExpenseAllocate", 4,"SELECT   'T', 'Target' from dual union SELECT   'R', 'Ratio' from dual")%>;
    var ctrl=grdExpenseAllocate.GetGridControl();    
    ctrl.ColFormat(7) = "###,###R";
    ctrl.ColFormat(8) = "###,###R";
    
    lstCOMPANY.SetDataText(ls_comp);
    lstUNIT.SetDataText(ls_unit);
    lstDEPR_METHOD.SetDataText(ls_depr_method);
    lstKIND_CD.SetDataText(ls_kind_cd);
    lstCCY.SetDataText(ls_ccy);
    lstSTATUS.SetDataText(ls_status);
    
}

function OnReset()
{
	GetRate();
    txtFA_CD.SetDataText("");
    txtFA_NM.SetDataText("");
    txtFA_LNM.SetDataText("");
    txtFA_KNM.SetDataText("");
    txtFA_QTY.SetDataText("1");
    txtTR_RATE.SetDataText("1");
    txtBK_RATE.SetDataText("1");
    //txtEODEPT_PK.SetDataText("");
    //txtEODEPT_NM.SetDataText("");
    txtCHARGER.SetDataText("");
    txtABPL_PK.SetDataText("");
    txtABPL_CD.SetDataText("");
    txtABPL_NM.SetDataText("");
    lstSTATUS.SetDataText("U");
    txtPRICE.SetDataText("");
    txtBUY_AMT.SetDataText("");
    txtINVOICE_NO.SetDataText("");
    txtINVOICE_DATE.SetDataText("");
    txtREMARK.SetDataText("");
    txtREMARK2.SetDataText("");
    txtFA_AC_PK.SetDataText("");
    txtFA_AC_CD.SetDataText("");
    txtFA_AC_NM.SetDataText("");
    txtDEPR_AC_PK.SetDataText("");
    txtDEPR_AC_CD.SetDataText("");
    txtDEPR_AC_NM.SetDataText("");
    txtEXPE_AC_PK.SetDataText("");
    txtEXPE_AC_CD.SetDataText("");
    txtEXPE_AC_NM.SetDataText("");
    txtDEPR_RATE.SetDataText("1");
    txtUSE_DATE.SetDataText("");
    txtDEPR_DATE.SetDataText("");
    txtCOST_FAMT.SetDataText("");
    txtCOST_AMT.SetDataText("");
    txtBEGIN_DEPR_FAMT.SetDataText("");
    txtBEGIN_DEPR_AMT.SetDataText("");
    txtDEPR_YY.SetDataText("");
    txtDEPR_MM.SetDataText("");
    txtMONTH_DEPR_FAMT.SetDataText("");
    txtMONTH_DEPR_AMT.SetDataText("");
    txtACCUM_DEPR_FAMT.SetDataText("");
    txtACCUM_DEPR_AMT.SetDataText("");
    txtREMAIN_FAMT.SetDataText("");
    txtREMAIN_AMT.SetDataText("");
    txtEXIST.text = "0";
    OnChangeCompany();
	grdDetail.ClearData();
	grdMove.ClearData();
}

function OnChangeCompany()
{
	datDeptData.Call("SELECT");
}

function GetRate()
{
	dso_get_rate.Call();
}
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
    if(ind == "4")
    {
        comm_code = 'ACDF0030';
        kind_cd = lstKIND_CD.GetData();
		trans_grp = "A";
		acc_grp_cd = "AD001"
        
    } 
    if(ind == "5")
    {
        comm_code = 'ACDF0040';
        kind_cd = "ALL";
		trans_grp = "A";
		acc_grp_cd = "AD001"
        
    }
    //var fpath   = System.RootURL + "/standard/forms/gf/gf/gfgf00012.aspx?com_pk=" + lstCOMPANY.GetData() + "&comm_cd=" + comm_code + "&kind_cd=" + kind_cd;
	var fpath   = System.RootURL + "/standard/forms/60/13/60130190_GetAccGrpCd.aspx?compk=" + lstCOMPANY.GetData() + "&transgrp=" + trans_grp + "&accgrpcd=" + acc_grp_cd;
    var object  = System.OpenModal(fpath , 600 , 500 , 'titleb:0;resizable:no;status:no;dialogWidth:50;dialogHeight:31;dialogLeft:5;dialogTop:30;edge:sunken;scroll:no;unadorned:yes;help:no'); 
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
                txtMOVE_DEPR_PK.SetDataText(object[0]);
                txtMOVE_DEPR_CD.SetDataText(object[1]);
                txtMOVE_DEPR_NM.SetDataText(object[2]);
                
            } 
            if(ind == "5")
            {
                txtMOVE_EXPE_PK.SetDataText(object[0]);
                txtMOVE_EXPE_CD.SetDataText(object[1]);
                txtMOVE_EXPE_NM.SetDataText(object[2]);
            } 
        }
    }    
}

function resetAcc(ind)
{
    if(ind == "1")
    {
        txtFA_AC_PK.SetDataText("");
        txtFA_AC_CD.SetDataText("");
        txtFA_AC_NM.SetDataText("");
    }
    if(ind == "2")
    {
        txtDEPR_AC_PK.SetDataText("");
        txtDEPR_AC_CD.SetDataText("");
        txtDEPR_AC_NM.SetDataText("");
    }   
    if(ind == "3")
    {
        txtEXPE_AC_PK.SetDataText("");
        txtEXPE_AC_CD.SetDataText("");
        txtEXPE_AC_NM.SetDataText("");
    } 
}

function OnShowProject()
{
    
    var fpath = System.RootURL + "/standard/forms/60/05/60050010_popup_2005.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCOMPANY.GetData() + '&dsqlid=ACNT.SP_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
    var object = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
    if ( object != null ) 
    {
        if (object[0] != 0)
        {
            txtABPL_PK.SetDataText(object[2]);
            txtABPL_CD.SetDataText(object[0]);
            txtABPL_NM.SetDataText(object[1]);
        }
    }
}

function OnResetProject()
{
    txtABPL_PK.SetDataText("");
    txtABPL_CD.SetDataText("");
    txtABPL_NM.SetDataText("");
}
function checkKey() 
{
	 var c = String.fromCharCode (event.keyCode); 
	 var x = c.toUpperCase().charCodeAt(0) ; 
	 event.keyCode = x; 
}

function OnSearch()
{
    var fpath   = System.RootURL + "/standard/forms/60/13/60130200_popup.aspx";
    var object  = System.OpenModal(fpath , 1000 , 600 , 'resizable:yes;status:yes'); 
    if ( object != null )  
    {
        txt_PK.text = object;
		dso_upd_fa_entry.Call("SELECT");
		txtEXIST.text ="0";
        //dso_upd_fa_detail.Call("SELECT");
    }
}

function CheckOnSave()
{
    var retValue = true;
    if (txtFA_CD.GetData()=="")
    {
        alert("Input Fixed Asset code please!");
        retValue = false;
        return;
    }
    if (txtEXIST.GetData() !="0")
    {
        alert("This Asset code exist!");
        retValue = false;
        return;
    }
    if (txtFA_NM.GetData()=="")
    {
        alert("Input Fixed Asset name please!");
        retValue = false;
        return;
    }
    if(txtFA_AC_PK.GetData()=="")
    {
        alert("Input Fixed Asset account!");
        retValue = false;
        return;
    }
    if(txtDEPR_AC_PK.GetData()=="")
    {
        alert("Input Depreciation account!");
        retValue = false;
        return;
    }
    if(txtEXPE_AC_PK.GetData()=="")
    {
        alert("Input Expense account!");
        retValue = false;
        return;
    }
    if(lstEODEPT_NM.GetData() =="")
    {
        alert("Select Department please !");
        retValue = false;
        return;
    }
    /*if(lstSTATUS.GetData()!= "A")
    {
        alert("The Asset must be active!");
        retValue = false;
        return;
    }*/
    if(Number(txtDEPR_RATE.GetData())> 1)
    {
        alert("The Depreciation must be <= 1!");
        retValue = false;
        return;
    }
    
    return retValue;
}

function CheckIsDepreciated()
{
    var retValue = true;
    //alert(txtDEPR.text);
    if(txtDEPR.text != "0")
    {
        alert("This asset has depreciated, can not modify!");
        retValue = false;
        //return;
    }
    return retValue;
}
function OnUpdate()
{
    if(CheckOnSave())
    {
       
        txttac_photo_pk.SetDataText(imgFA.oid);
        dso_upd_fa_entry.Call();  
    }
    
}
function OnNew()
{
    imgFA.SetDataText(txttac_photo_pk.text );  
    dso_upd_fa_entry.StatusInsert();
    OnReset();
    
}
function onNew_PopupAllExp()
{    
    if (txt_PK.text!="")
    {
        var aValue=new Array();
        var fpath = System.RootURL + "/standard/forms/60/13/60130200_popup_1.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" + lstCOMPANY.GetData() + '&dsqlid=ac_sel_60130200_popup_1&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
        aValue = System.OpenModal(fpath , 600 , 500 , 'resizable:yes;status:yes'); 
        if ( aValue != null ) 
        {                  
            if (aValue.length>0)
            {               
                 for(i=0; i<aValue.length; i++)
                 {                    
                    var tmp = aValue[i];                   
                    if (tmp[0] != 0)
                    {
                       grdExpenseAllocate.AddRow();
                       grdExpenseAllocate.SetGridText(grdExpenseAllocate.rows - 1, 0, txt_PK.text);
                       grdExpenseAllocate.SetGridText(grdExpenseAllocate.rows - 1, 1, tmp[3]);   
                       grdExpenseAllocate.SetGridText(grdExpenseAllocate.rows - 1, 2, tmp[1]);   
                       grdExpenseAllocate.SetGridText(grdExpenseAllocate.rows - 1, 3, tmp[2]); 
                       grdExpenseAllocate.SetGridText(grdExpenseAllocate.rows - 1, 4, 'R');   
                     }
                   }              
            }
        }
     }
     else 
     {
        alert("Master is not null");
        return;
     }
}
function RowEdit()
{
    var trans_cost=Number(txtMONTH_DEPR_FAMT.text);
    var book_cost=Number(txtMONTH_DEPR_AMT.text);
    var trans_amt=0;
    var book_amt=0;
    var ctrl=grdExpenseAllocate.GetGridControl();
    var cntTarget=0;
    var cntRatio=0;
    var i;       
    for(i=1; i<ctrl.rows; i++)
    {        
        cntTarget=cntTarget+Number(grdExpenseAllocate.GetGridData(i,6));
    }  
    //return;*/
    if (event.col==4 || event.col==5 || event.col==6)
    {
        for(i=1; i<ctrl.rows; i++)
        {        
            cntRatio=cntRatio+Number(grdExpenseAllocate.GetGridData(i,5));
        } 
        if (cntRatio>100)
        {
            alert("Total of ratio is 100%");
            return;
        }
        if (grdExpenseAllocate.GetGridData(event.row,4)=='R')
        {
            trans_amt=Number(grdExpenseAllocate.GetGridData(event.row,5))*trans_cost/100;
            trans_amt = Math.round(trans_amt*Math.pow(10,2))/Math.pow(10,2);
        }
        else
        {
            book_amt=Number(grdExpenseAllocate.GetGridData(event.row,6))*trans_cost/100;
            book_amt = Math.round(book_amt*Math.pow(10,2))/Math.pow(10,2);            
        }        
    }
    grdExpenseAllocate.SetGridText(event.row,7,trans_amt);
    grdExpenseAllocate.SetGridText(event.row,8,trans_amt);    
}

function onChangeMonth()
{  
   dso_upd_fa_allexp.Call("SELECT");
}

function onUpdate1()
{    
   var ctrl = grdExpenseAllocate.GetGridControl();
   for(i=0;i<ctrl.rows;i++)
   {
        grdExpenseAllocate.SetGridText(i,11,dtMonth.GetData());  
   }
   dso_upd_fa_allexp.Call();
}
function onCopyAllExp()
{   
    datProcess_Copy_allexp.Call();
}
function SumOnGrid()
{
    var rRatio=0;
    var rTarget=0;
    var rTrans_AMT=0;
    var rBook_AMT=0;
    
   var ctrl = grdExpenseAllocate.GetGridControl();
   for(i=1;i<ctrl.rows;i++)
   {
        rRatio+=Number(grdExpenseAllocate.GetGridData(i,5));  
        rTarget+=Number(grdExpenseAllocate.GetGridData(i,6));  
        rTrans_AMT+=Number(grdExpenseAllocate.GetGridData(i,7));  
        rBook_AMT+=Number(grdExpenseAllocate.GetGridData(i,8));  
   }
   
   txtRatio_Total.SetDataText(""+ rRatio);
   txtTaget_Total.SetDataText(""+ rTarget);
   txtTrans_AMT_Total.SetDataText(""+ rTrans_AMT);
   txtBooks_AMT_Total.SetDataText(""+ rBook_AMT);   
}



function OnDelete()
{
    if(confirm("Are you sure to delete this Asset"))
    {
        dso_upd_fa_entry.StatusDelete();
        dso_upd_fa_entry.Call();
    }
}

function UpdateCost(ind)
{
	var tr_rate = Number(txtTR_RATE.text);
    var bk_rate = Number(txtBK_RATE.text);
    var cost_amt = Number(txtCOST_AMT.text);
    var cost_famt = Number(txtCOST_FAMT.text);
    if(ind == 1)
    {
        cost_amt = Math.round(cost_famt * tr_rate / bk_rate *100)/100;
        txtCOST_AMT.SetDataText("" + cost_amt);
    }
    if(ind == 2)
    {
        cost_famt = Math.round(cost_amt * bk_rate / tr_rate *100)/100;
        txtCOST_FAMT.SetDataText("" + cost_famt);
    }
    MonthlyDeprAmt();
}

function UpdateBeginDepr(ind)
{
	var tr_rate = Number(txtTR_RATE.text);
    var bk_rate = Number(txtBK_RATE.text);
    var begin_amt = Number(txtBEGIN_DEPR_AMT.text);
    var begin_famt = Number(txtBEGIN_DEPR_FAMT.text);
    if(ind == 1)
    {
        begin_amt = Math.round(begin_famt * tr_rate / bk_rate *100)/100;
        txtBEGIN_DEPR_AMT.SetDataText("" + begin_amt);
    }
    if(ind == 2)
    {
        begin_famt = Math.round(begin_amt * bk_rate / tr_rate *100)/100;
        txtBEGIN_DEPR_FAMT.SetDataText("" + begin_famt);
    }
    MonthlyDeprAmt();
}
function MonthlyDeprAmt()
{
    var cost_amt  = Number(txtCOST_AMT.text);
    var cost_famt = Number(txtCOST_FAMT.text);
    var begin_amt = Number(txtBEGIN_DEPR_AMT.text);
    var begin_famt = Number(txtBEGIN_DEPR_FAMT.text);
    var depr_rate = Number(txtDEPR_RATE.text);
    var d_yy = Number(txtDEPR_YY.text);
    var d_mm = Number(txtDEPR_MM.text);
    var depr_amt = 0;
    var depr_famt = 0;
    
    if(d_yy > 0 || d_mm > 0)
    {
        if(lstCCY.GetData() =="VND")
        {
            depr_famt = Math.round((cost_famt - begin_famt)/(d_yy * 12 + d_mm) * depr_rate);
            depr_amt = Math.round((cost_amt - begin_amt)/(d_yy * 12 + d_mm) * depr_rate);
            
        }
        else
        {
            depr_famt = Math.round((cost_famt - begin_famt)/(d_yy * 12 + d_mm) * depr_rate*100)/100;
            depr_amt = Math.round((cost_amt - begin_amt)/(d_yy * 12 + d_mm) * depr_rate);
        }
    }
    
    txtMONTH_DEPR_FAMT.SetDataText(""+ depr_famt);
    txtMONTH_DEPR_AMT.SetDataText(""+ depr_amt);
}
function OnDataReceive(pObject)
{
    if(pObject.id =="dso_get_company")
	{
		dso_get_rate.Call()
	}
    if(pObject.id =="dso_upd_fa_entry")
    {
		EnableTab(true);
		 imgFA.SetDataText(txttac_photo_pk.text ); 
        OnSearchTab();
        //dso_upd_fa_detail.Call("SELECT");
    }
    if(pObject.id=="dso_upd_fa_detail")
    {
        checkDepreciated.Call();
    }
    if(pObject.id=="dso_upd_fa_allexp")
    {       
        SumOnGrid();
    }
    if(pObject.id=="datDeptData")
    {
        moveDeptData.Call();
    }
    if(pObject.id=="dso_upd_fa_his")
    {
        dso_sel_fa_his.Call("SELECT");
    } 
    if(pObject.id=="datProcess_Copy_allexp")      
    {
        if (txtResult_Num.text=="0")
            alert(txtResult_Var.text);
        else
            alert("The copying is error!!!");
    }
}
function CheckExist()
{
    dso_check_exist_facode.Call();
}
function exist_code()
{
    if(txtEXIST.text != "0")
    {
        alert("This code exist, input another!");
        return;
    }
}
function OnReport()
{

}
function EnableTab(vbool)
{
    click_tab0 = vbool;
    click_tab1 = vbool;
    click_tab2 = vbool;
    click_tab3 = vbool;
    click_tab4 = vbool;
}
function OnSearchTab()
{
    if(txt_PK.text != "")
    {
        if (idTab_Detail.GetCurrentPageNo() == 2)
        {
		    if (click_tab0 == true)
            {
                EnableTab(true);
                click_tab0 = false;
			    dso_upd_fa_info.Call("SELECT");
            }
        }
        if (idTab_Detail.GetCurrentPageNo() == 0)
        {
		    if (click_tab1 == true)
            {
                EnableTab(true);
                click_tab0 = false;
			    dso_upd_fa_detail.Call("SELECT");
            }
        }
        if (idTab_Detail.GetCurrentPageNo() == 1)
        {
		    if (click_tab0 == true)
            {
                EnableTab(true);
                click_tab0 = false;
			    dso_upd_fa_allexp.Call("SELECT");
            }
        }
        if (idTab_Detail.GetCurrentPageNo() == 3)
        {
		    if (click_tab2 == true)
            {
                EnableTab(true);
                click_tab2 = false;
                dso_upd_fa_his.StatusUpdate();
			    dso_sel_fa_his.Call("SELECT");
            }
        }
    }
}
//-------Info Process
function onUpdateInfo()
{
    if(txt_PK.text != "")
    {
        dso_upd_fa_info.StatusUpdate();
        dso_upd_fa_info.Call();
    }
}
///---------Detail Process-----------------
function onNewDetail()
{
	if(txt_PK.text != "")
    {
		var ctrl = grdDetail.GetGridControl();
        grdDetail.AddRow();
        
        grdDetail.SetGridText(ctrl.Rows - 1,0,txt_PK.text);
        grdDetail.SetGridText(ctrl.Rows - 1,3,'I');
		dso_upd_fa_detail.Call();
    }
}
function onUpdateDetail()
{
    if(txt_PK.text != "")
    {
        dso_upd_fa_detail.Call();
    }
}
function onDeleteDetail()
{
	if(confirm("Do you want to delete this row ?"))
    {
        grdDetail.DeleteRow();
        dso_upd_fa_detail.Call();
    }
}

//-----Movement Process
function OnNewMove()
{
    if(confirm("Do you want to movement this asset?"))
    {
        dso_upd_fa_his.StatusInsert();
        lstMOVE_DEPT.text ="";
        txtMOVE_CHARGER.text ="";
//        txtMOVE_DEPR_PK.text ="";
//        txtMOVE_DEPR_CD.text ="";
//        txtMOVE_DEPR_NM.text ="";
//        txtMOVE_EXPE_PK.text ="";
//        txtMOVE_EXPE_CD.text ="";
//        txtMOVE_EXPE_NM.text ="";
        txtMOVE_OLDDEPT.text = lstEODEPT_NM.text;
        txtMOVE_REMARK.text ="";
        txtMOVE_REMARK2.text ="";
        txtMOVE_PK.text ="";
        
                
    }
}
function OnUpdateMove()
{
    if(confirm("Are you sure to save?"))
    {
        if(txtMOVE_PK.text =="")
        {
            txtMST_PK.text = txt_PK.text;
            
        }
        dso_upd_fa_his.Call();
    }    
}
function OnDeleteMove()
{
    if(confirm("Are you sure to delete?"))
    {
        dso_upd_fa_his.StatusDelete();
        dso_upd_fa_his.Call();
    }
}

function OnPrintMove()
{
    
}

function grdMoveClick()
{

    dso_upd_fa_his.StatusUpdate();
    var ctrl = grdMove.GetGridControl();
    var currow = grdMove.row;
    RefeshMoveControl(currow);
    //alert(currow + "   " + grdMove.rows);
}
function RefeshMoveControl(i)
{
    if( i > 0 && i < grdMove.rows)
    {
        txtMST_PK.text = grdMove.GetGridData(i,0);
        txtMOVE_PK.text = grdMove.GetGridData(i,1);
        txtMOVE_DATE.text = grdMove.GetGridData(i,2);
        lstMOVE_DEPT.value = grdMove.GetGridData(i,3);
        txtMOVE_CHARGER.text =grdMove.GetGridData(i,5);
        txtMOVE_DEPR_PK.text = grdMove.GetGridData(i,6);
        txtMOVE_DEPR_CD.text =grdMove.GetGridData(i,7);
        txtMOVE_DEPR_NM.text =grdMove.GetGridData(i,8);
        txtMOVE_EXPE_PK.text =grdMove.GetGridData(i,9);
        txtMOVE_EXPE_CD.text =grdMove.GetGridData(i,10);
        txtMOVE_EXPE_NM.text =grdMove.GetGridData(i,11);
        txtMOVE_OLDDEPT.text = lstEODEPT_NM.value;
        txtMOVE_REMARK.text =grdMove.GetGridData(i,16);
        txtMOVE_REMARK2.text =grdMove.GetGridData(i,17);
    }
}
//
</script>
<body style="margin:0; padding:0;">

   <!------------------------------------------------------------------->
   <gw:data id="dso_get_company" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60130200_GET_RATE" > 
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
   <!------------------------------------------------------------------->

    <gw:data id="dso_get_rate"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60130200_GET_RATE" > 
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
    
    <gw:data id="dso_check_exist_facode" onreceive="exist_code()"> 
        <xml> 
            <dso type="process" procedure="ac_pro_60130200_check_exist" > 
                <input> 
                     <input bind="lstCOMPANY"/>
                     <input bind="txtFA_CD"/>
                </input>
                <output>
                     <output bind="txtEXIST"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    
    <gw:data id="dso_upd_fa_detail" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,2,3,4,5,6,7,8"  function="ac_sel_60130200_dtl" procedure="ac_upd_60130200_dtl">
                <input bind="grdDetail">
                    <input bind="txt_PK"/>
                    
                </input>
                <output bind="grdDetail"/>
            </dso> 
        </xml>
    </gw:data>
    
    <gw:data id="dso_upd_fa_allexp" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" parameter="0,1,11,4,5,6,7,8,9,10,12"  function="ac_sel_60130200_fa_allexp" procedure="ac_upd_60130200_fa_allexp">
                <input bind="grdExpenseAllocate">
                    <input bind="txt_PK"/>  
                    <input bind="dtMonth"/>                                       
                </input>
                <output bind="grdExpenseAllocate"/>
            </dso> 
        </xml>
    </gw:data>    
    
    
    <gw:data id="datProcess_Copy_allexp" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ac_pro_60130200_fa_allexp" > 
                <input>
                    <input bind="txt_PK" />
                    <input bind="dtMonth" />                    
                </input> 
                <output>
                    <output bind="txtResult_Num" />                    
                    <output bind="txtResult_Var" />
                </output>
            </dso> 
        </xml> 
</gw:data>
    <gw:data id="dso_upd_fa_entry" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,17,18,19,20,23,26,29,30,31,32,33,34,35,36,37,38,39,40,45" function="ac_sel_60130200_mst" procedure = "ac_upd_60130200_mst">
              <inout> 
                <inout bind="txt_PK"/>
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
                <inout bind="txtCHARGER"/>
                <inout bind="txtABPL_PK"/>
                <inout bind="txtABPL_CD"/>
                <inout bind="txtABPL_NM"/>
                <inout bind="lstSTATUS"/>
                <inout bind="txtREMARK"/>
                <inout bind="txtREMARK2"/>
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
                <inout bind="txtDEPR_YY"/>
                <inout bind="txtDEPR_MM"/>
                <inout bind="txtMONTH_DEPR_FAMT"/>
                <inout bind="txtMONTH_DEPR_AMT"/>
                <inout bind="txtACCUM_DEPR_FAMT"/>
                <inout bind="txtACCUM_DEPR_AMT"/>
                <inout bind="txtREMAIN_FAMT"/>
                <inout bind="txtREMAIN_AMT"/>
                <inout bind="txttac_photo_pk"/>                
              </inout>              
            </dso> 
        </xml> 
    </gw:data>    
    <gw:data id="dso_upd_fa_info" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9" function="ac_sel_60130200_fa_info" procedure = "ac_upd_60130200_fa_info">
              <inout> 
                <inout bind="txt_PK"/>
                <inout bind="txtSERIAL_NO"/>
                <inout bind="txtINVOICE_NO"/>
                <inout bind="txtINVOICE_DATE"/>
                <inout bind="txtPRICE"/>
                <inout bind="txtBUY_AMT"/>
                <inout bind="txtCOUNTRY"/>
                <inout bind="txtMADE_YEAR"/>
                <inout bind="txtCAPACITY"/>
                <inout bind="txtENGINE"/>
                </inout>
            </dso> 
        </xml> 
    </gw:data>
    
    <gw:data id="datDeptData" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="ac_pro_60130200_list_dept" > 
                <input>
                    <input bind="lstCOMPANY" /> 
                </input> 
                <output>
                    <output bind="lstEODEPT_NM" />
                </output>
            </dso> 
        </xml> 
    </gw:data>    
    <gw:data id="moveDeptData" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="ac_pro_60130200_list_dept" > 
                <input>
                    <input bind="lstCOMPANY" /> 
                </input> 
                <output>
                    <output bind="lstMOVE_DEPT" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    <gw:data id="checkDepreciated" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ac_pro_60130200_depreciate" > 
                <input>
                    <input bind="txt_PK" /> 
                </input> 
                <output>
                    <output bind="txtDEPR" />
                </output>
            </dso> 
        </xml> 
    </gw:data>
    
    <gw:data id="dso_sel_fa_his" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60130200_FA_HIS">
                <input bind="grdMove">
                    <input bind="txt_PK"/>
                    
                </input>
                <output bind="grdMove"/>
            </dso> 
        </xml>
    </gw:data>
    
    <gw:data id="dso_upd_fa_his" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="control" parameter ="0,1,2,3,4,5,8,11,12,13,14,15" function="ac_sel_60130200_ctrhis" procedure="ac_upd_60130200_ctrhis">
                <inout>
                    <inout bind="txtMOVE_PK"/>
                    <inout bind="txtMST_PK"/>
                    <inout bind="txtMOVE_DATE"/>
                    <inout bind="lstMOVE_DEPT"/>
                    <inout bind="txtMOVE_CHARGER"/>
                    <inout bind="txtMOVE_DEPR_PK"/>
                    <inout bind="txtMOVE_DEPR_CD"/>
                    <inout bind="txtMOVE_DEPR_NM"/>
                    <inout bind="txtMOVE_EXPE_PK"/>
                    <inout bind="txtMOVE_EXPE_CD"/>
                    <inout bind="txtMOVE_EXPE_NM"/>
                    <inout bind="txtMOVE_REMAIN_FAMT"/>
                    <inout bind="txtMOVE_REMAIN_AMT"/>
                    <inout bind="txtMOVE_OLDDEPT"/>
                    <inout bind="txtMOVE_REMARK"/>
                    <inout bind="txtMOVE_REMARK2"/>
                </inout>
                
            </dso> 
        </xml>
    </gw:data>

<!------------------------------------------------------------------------------------------------------->
<table width="100%" cellpadding="0" cellspacing="0" border="1">
    <tr>
        <td>
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td width="85%"></td>
                    <td width="3%"><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"        onclick="OnSearch()" /></td>								
	                <td width="3%"><gw:button id="ibtnNew"    img="new"       alt="New"           onclick="OnNew()" /></td>
	                <td width="3%"><gw:button id="ibtnSave"   img="save"      alt="Save"          onclick="OnUpdate()" /></td>
	                <td width="3%"><gw:button id="ibtnDelete" img="delete"    alt="Delete"        onclick="OnDelete()" /></td>
	                <td width="3%"><gw:button id="ibtnReport" img="excel" text="Print"  alt="Print"    onclick="OnReport()" /></td>
		        </tr>
            </table>
        </td>
    </tr>    
    <tr>
        <td>
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td width="60%">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="15%"></td>
                                <td width="15%"></td>
                                <td width="15%"></td>
                                <td width="15%"></td>
                                <td width="15%"></td>
                                <td width="25%"></td>
                            </tr>
                            <tr>
                                <td colspan="6">&nbsp;&nbsp;General Information </td>
                            </tr>
                            <tr>
                                <td align="right">Company &nbsp;</td>
                                <td colspan="4"><gw:list id="lstCOMPANY" maxlen = "20" styles='width:100%' onchange="OnChangeCompany()"/></td>
                                
					            <td rowspan="6"> <gw:image id="imgFA" table_name="TAC_PHOTO" oid="0" view="/binary/ViewFile.aspx"
                                                        post="/binary/PostFile.aspx" styles="width:180;height:120" /></td>
					        </tr>
                            <tr>
                                <td align="right">Asset Code &nbsp;</td>
                                <td colspan="2"><gw:textbox id="txtFA_CD" maxlen = "20" styles='width:100%;height:22' csstype="mandatory" onkeypress="checkKey()" onchange="CheckExist()"/></td>
                                <td align="right">Unit &nbsp;</td>
					            <td ><gw:list id="lstUNIT"  styles='width:100%' /></td>
					         </tr>
                            <tr>
                                <td align="right">Asset name &nbsp;</td>
                                <td colspan="4"><gw:textbox id="txtFA_NM"  text="" styles='width:100%;height:22'/></td>
                            </tr>
                            <tr>
                                <td align="right">Local name &nbsp;</td>
                                <td colspan="4"><gw:textbox id="txtFA_LNM"  text="" styles='width:100%;height:22'/></td>
                            </tr>
                            <tr>
                                <td align="right">Korean name &nbsp;</td>
                                <td colspan="4"><gw:textbox id="txtFA_KNM"  text="" styles='width:100%;height:22'/></td>
                            </tr>
                            <tr>
                                <td align="right">Kind &nbsp;</td>
                                <td colspan="4"><gw:list id="lstKIND_CD"  styles='width:100%'></gw:list></td>
                            </tr>
                            <tr>
                                <td align="right">Quantity &nbsp;</td>
                                <td ><gw:textbox id="txtFA_QTY"  type="number" format="###,###" styles="text-align:right;width:100%;height:22"></gw:textbox></td>
                                <td align="right">Currency &nbsp;</td>
                                <td ><gw:list id="lstCCY"  styles='width:100%' onchange="GetRate()"></gw:list></td>
                                <td align="right">Exchange Rate &nbsp;</td>
                                <td ><gw:textbox id="txtTR_RATE"  type="number" format="###,###.##" text="1" styles="text-align:right;width:50%;height:22"></gw:textbox>
                                                <gw:textbox id="txtBK_RATE"  type="number" text="1" format="###,###.##" styles="text-align:right;width:50%;height:22"></gw:textbox></td>
                            </tr>
                            <tr>
                                <td align="right">Department &nbsp;</td>
                                <td colspan="3"><gw:list  id="lstEODEPT_NM" value='ALL' maxlen = "100" styles='width:100%'onchange="" /></td>
                                <td align="right">Charger &nbsp;</td>
								<td ><gw:textbox id="txtCHARGER"  styles='width:100%;height:22'/></td>
                            </tr>
                            <tr>
                                <td align="right"><a title="Click here to show PL Unit" onclick="OnShowProject()" href="#tips" >PL Unit&nbsp;</a></td>
                                <td colspan="3">
                                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td width="95%" colspan="3"><gw:textbox id="txtABPL_PK" styles='width:100%'  style="display:none" /> 
                                                    <gw:textbox id="txtABPL_CD" styles='width:29%;height:22' />
								                    <gw:textbox id="txtABPL_NM" styles='width:70%;height:22' /></td>
								            <td><gw:imgBtn id="ibtnResetdept" img="reset"  alt="reset Department" onclick="OnResetProject()" /></td>        
                                        </tr>
                                    </table>
                                </td>
                                <td align="right">Status</td>
                                <td><gw:list id="lstSTATUS" styles='width:100%'/></td>
                            </tr>
                            <tr>
                                <td align="right">Description &nbsp;</td>
                                <td colspan="5"><gw:textbox id="txtREMARK" styles='width:100%;height:22'></gw:textbox></td>
                            </tr>                           
                            <tr>
                                <td align="right">Local Description &nbsp;<</td>
                                <td colspan="5"><gw:textbox id="txtREMARK2" styles='width:100%;height:22'></gw:textbox></td>
                            </tr>                           
                        </table>
                    </td>                    
                    <td width="40%" >
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="20%"></td>
                                <td width="20%"></td>
                                <td width="20%"></td>
                                <td width="20%"></td>
                                <td width="20%"></td>
                                <td width="20%"></td>
                            </tr>
                            <tr>
                                <td colspan="5">&nbsp;&nbsp;General Ledger Information </td>
                            </tr>
                            <tr>
                                <td align="right"><a title="Click here to show Account" onclick="GetAccount('1')" href="#tips" >Asset Acct&nbsp;</a></td>
                                <td colspan="4">
                                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td width="95%"><gw:textbox id="txtFA_AC_PK" styles='display:none'></gw:textbox>
                                                            <gw:textbox id="txtFA_AC_CD" styles='width:30%;height:22'></gw:textbox>
                                                            <gw:textbox id="txtFA_AC_NM" styles='width:70%;height:22'></gw:textbox></td>
                                            <td><gw:imgBtn id="ibtnFaAccReset" img="reset"  alt="reset acc" onclick="resetAcc('1')" /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="right"><a title="Click here to show Account" onclick="GetAccount('2')" href="#tips" ><b>Depr. Acct&nbsp;</b></a></td>
                                <td colspan="4">
                                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td width="95%"><gw:textbox id="txtDEPR_AC_PK" styles='display:none'></gw:textbox>
                                                            <gw:textbox id="txtDEPR_AC_CD" styles='width:30%;height:22'></gw:textbox>
                                                            <gw:textbox id="txtDEPR_AC_NM" styles='width:70%;height:22'></gw:textbox></td>
                                            <td><gw:imgBtn id="ibtndeprAccReset" img="reset"  alt="reset acc" onclick="resetAcc('2')" /></td>
                                        </tr>
                                    </table>
                                </td>
                                
                            </tr>
                            <tr>
                                <td align="right"><a title="Click here to show Account" onclick="GetAccount('3')" href="#tips" ><b>Expe. Acct&nbsp;</b></a></td>
                                <td colspan="4">
                                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td width="95%"><gw:textbox id="txtEXPE_AC_PK" styles='display:none'></gw:textbox>
                                                            <gw:textbox id="txtEXPE_AC_CD" styles='width:30%;height:22'></gw:textbox>
                                                            <gw:textbox id="txtEXPE_AC_NM" styles='width:70%;height:22'></gw:textbox></td>
                                            <td><gw:imgBtn id="ibtnExpeAccReset" img="reset"  alt="reset acc" onclick="resetAcc('3')" /></td>
                                        </tr>
                                    </table>
                                </td>
                                
                            </tr>
                            
                            <tr>
                                <td colspan="4" >&nbsp;&nbsp;Depreciation Information </td>
                            </tr>
                            <tr>
                                <td align="right">Depr. method &nbsp;</td>
                                <td colspan="2"><gw:list id="lstDEPR_METHOD"  styles='width:100%'></gw:list></td>
                                <td align="right">Depr. rate &nbsp;</td>
                                <td ><gw:textbox id="txtDEPR_RATE"  value="1" type="number" format="###,###.##R" styles="text-align:right;width:100%;height:22" /></td>
                            </tr>
                            <tr>
                                <td align="right">Service Date &nbsp;</td>
                                <td ><gw:datebox id="txtUSE_DATE" styles='width:100%;height:22'  lang="<%=Session("Lang")%>"/></td>
                                <td align="right" colspan="2">Depreciation Date &nbsp;</td>
                                <td ><gw:datebox id="txtDEPR_DATE" styles='width:100%;height:22'  lang="<%=Session("Lang")%>"/></td>
                            </tr>
                            <tr>
                                <td align="right">Original Cost&nbsp;</td>
                                <td colspan="2"><gw:textbox id="txtCOST_FAMT" type="number" format="###,###,###,###.##R" onChange="UpdateCost(1)" onEnterkey="UpdateCost(1)" styles="text-align:right;width:100%;height:22"/></td>
                                <td colspan="2"><gw:textbox id="txtCOST_AMT" type="number" format="###,###,###,###.##R" onChange="UpdateCost(2)" onBlur="UpdateCost(2)" styles="text-align:right;width:100%;height:22"/></td>                                
                            </tr>                            
                            <tr>
                                <td align="right">Begin Depr.&nbsp;</td>
                                <td colspan="2"><gw:textbox id="txtBEGIN_DEPR_FAMT" type="number" format="###,###,###,###.##" onChange="UpdateBeginDepr(1)" onEnterkey="UpdateBeginDepr(1)" styles="text-align:right;width:100%;height:22"/></td>
                                <td colspan="2"><gw:textbox id="txtBEGIN_DEPR_AMT" type="number" format="###,###,###,###.##" onChange="UpdateBeginDepr(2)" onEnterkey="UpdateBeginDepr(2)" styles="text-align:right;width:100%;height:22"/></td>
                                
                            </tr>
                            <tr>
                                <td align="right">Estimate Life &nbsp;</td>
                                <td ><gw:textbox id="txtDEPR_YY" maxlen="10"   type="number" format="###,###R" onchange="MonthlyDeprAmt()" onlossfocus="MonthlyDeprAmt()" styles="text-align:right;width:100%;height:22"/></td>
                                <td >&nbsp;Year(s) </td>
                                <td ><gw:textbox id="txtDEPR_MM" maxlen="10"   type="number" format="###,###R" onchange="MonthlyDeprAmt()" onlossfocus="MonthlyDeprAmt()" styles="text-align:right;width:100%;height:22"/></td>
                                <td >&nbsp;Month(s) </td>
                            </tr>
                            <tr>
                                <td align="right">Monthly Depr.&nbsp;</td>
                                <td colspan="2"><gw:textbox id="txtMONTH_DEPR_FAMT" type="number" format="###,###,###,###.##" styles="text-align:right;width:100%;height:22"/></td>
                                <td colspan="2"><gw:textbox id="txtMONTH_DEPR_AMT" type="number" format="###,###,###,###.##" styles="text-align:right;width:100%;height:22"/></td>
                                
                            </tr>
                            <tr>
                                <td align="right">Accum. Depr.&nbsp;</td>
                                <td colspan="2"><gw:textbox id="txtACCUM_DEPR_FAMT" type="number" format="###,###,###,###.##" styles="text-align:right;width:100%;height:22"/></td>
                                <td colspan="2"><gw:textbox id="txtACCUM_DEPR_AMT" type="number" format="###,###,###,###.##" styles="text-align:right;width:100%;height:22"/></td>
                            </tr>
                            <tr>
                                <td align="right">Remain. Amt.&nbsp;</td>
                                <td colspan="2"><gw:textbox id="txtREMAIN_FAMT" type="number" format="###,###,###,###.##" styles="text-align:right;width:100%;height:22"/></td>
                                <td colspan="2"><gw:textbox id="txtREMAIN_AMT" type="number" format="###,###,###,###.##" styles="text-align:right;width:100%;height:22"/></td>
                            </tr>
                        </table>
                    </td>
                  
                </tr>    
            </table>
        </td>
    </tr>
    
    <tr>
        <td>
            <gw:tab id="idTab_Detail"  onpageactivate="OnSearchTab()">
				
				<table name="Increase/Decrease"  align ="top"  cellspacing=0 cellpadding=0 border=1 style="width:100%;height:40;" >
                    <tr>
                        <td width="100%">
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td width="90%"></td>
                                    <td ><gw:button id="ibtnNew"    img="new"       alt="New"           onclick="onNewDetail()" /></td>
                                    <td ><gw:button id="ibtnSave"   img="save"      alt="Save"          onclick="onUpdateDetail()" /></td>
                                    <td ><gw:button id="ibtnDelete" img="delete"    alt="Delete"        onclick="onDeleteDetail()" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td width="100%" colspan="4">
                            <gw:grid
                            id="grdDetail"
                            header  ="_mst_pk|_pk|Date|Type|Trans. Amt|Book Amt|Months|remark|remark2"
                            format  ="0|0|4|0|1|1|1|0|0"
                            aligns  ="0|0|0|0|3|3|3|0|0"
                            defaults="||||||||"
                            editcol ="0|0|1|1|1|1|1|1|1"
                            widths  ="0|0|1800|1800|1800|1800|1800|3000|3000"
                            styles  ="width:100%; height:150"
                            sorting ="F"
							onclick = ""/>   
                        </td>
                    </tr>
                </table>
				<table name="Expense Allocate"  align ="top"  cellspacing=0 cellpadding=0 border=1 style="width:100%;height:40;" >
                    <tr>
                        <td width="100%">
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td width="10%" align=right><strong>Month</strong></td>
                                    <td width="20%" align=left><gw:datebox id="dtMonth" styles='width:70%;height:22' onchange="onChangeMonth()"  lang="<%=Session("Lang")%>" type="month"/></td>
                                    <td width="10%" align=right><strong>Type</strong></td>
                                    <td width="20%">
                                        <gw:list id="lstType"  styles='width:70%'>
                                            <data>Data|R|Ratio|T|Target</data>
                                        </gw:list>
                                    </td>
                                    <td width="40%"></td>                                    
                                    <td ><gw:button id="ibtnCopy"    img="copy"     alt="Copy"    onclick="onCopyAllExp()" /></td>
                                    <td ><gw:button id="ibtnNewALL"    img="new"       alt="New"     onclick="onNew_PopupAllExp()" /></td>
                                    <td ><gw:button id="ibtnSaveALL"   img="save"      alt="Save"    onclick="onUpdate1()" /></td>
                                    <td ><gw:button id="ibtnDeleteALL" img="delete"    alt="Delete"  onclick="onDeleteAllExp()" /></td>
                                    <td ><gw:button id="ibtnProcessALL" img="process"  alt="Process"  onclick="onProcessAllExp()" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr> 
                        <td width="100%" colspan="4">
                            <gw:grid
                            id="grdExpenseAllocate"
                            header  ="_mst_pk|_pk|P/L Unit Code|P/L Unit Name|Type|Ratio|Taget|Trans Amount|Book Amount|Description|Local Description|_MONTH|_PK"
                            format  ="0|0|0|0|0|0|0|0|0|0|0|0|0"
                            aligns  ="0|0|0|0|0|3|3|3|3|0|0|0|0"
                            defaults="||||||||||||"
                            editcol ="0|0|0|0|1|1|1|0|0|1|1|1|0"
                            widths  ="0|0|1800|1800|1000|1000|1000|1800|1800|2000|2000|0|0"
                            styles  ="width:100%; height:150"
                            sorting ="F" onafteredit="RowEdit()"
							onclick = ""/>   
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td align="right" width="30%"><font></font>Total: </td>
                                    <td width="7%"><gw:textbox id="txtRatio_Total" type="number" format="###,###,###,###.##" styles="text-align:right;width:100%;height:22"/></td>
                                    <td width="7%"><gw:textbox id="txtTaget_Total" type="number" format="###,###,###,###.##" styles="text-align:right;width:100%;height:22"/></td>
                                    <td width="12%"><gw:textbox id="txtTrans_AMT_Total" type="number" format="###,###,###,###.##" styles="text-align:right;width:100%;height:22"/></td>
                                    <td width="12%"><gw:textbox id="txtBooks_AMT_Total" type="number" format="###,###,###,###.##" styles="text-align:right;width:100%;height:22"/></td>
                                    <td width="32%">&nbsp;</td>
                                </tr>
                            </table>
                        </td>                        
                    </tr>
                </table>
                <table name="Information detail"  align ="top"  cellspacing=0 cellpadding=0 border=0 style="width:100%;height:40;">
                    <tr>
                        <td width="10%"></td>
                        <td width="10%"></td>
                        <td width="10%"></td>
                        <td width="10%"></td>
                        <td width="10%"></td>
                        <td width="10%"></td>
                        <td width="10%"></td>
                        <td width="10%"></td>
                        <td width="10%"></td>
                        <td width="10%"></td>
                    </tr>
                    <tr>
                        <td colspan="9" align ="left"><font color="blue" ><b>Other Infomations</td>
                        <td align="right"><gw:button id="btnSaveInfo"    img="save"       alt="Save"        onclick="onUpdateInfo()" /></td>
                    </tr>
                    <tr>
                        <td align="right">Serial No &nbsp;</td>
                        <td ><gw:textbox id="txtSERIAL_NO" styles='width:100%;height:22'/></td>
                        <td align="right">Invoice No &nbsp;</td>
                        <td ><gw:textbox id="txtINVOICE_NO" styles='width:100%;height:22'/></td>
                        <td align="right">Invoice Date &nbsp;</td>
                        <td ><gw:datebox id="txtINVOICE_DATE" styles='width:100%'  lang="<%=Session("Lang")%>"/></td>
                        <td align="right">Price &nbsp;</td>
                        <td ><gw:textbox id="txtPRICE" type="number" format="###,###.##R" styles="text-align:right;width:100%;height:22"></gw:textbox></td>
                        <td align="right">Amount &nbsp;</td>
                        <td ><gw:textbox id="txtBUY_AMT" type="number" format="###,###.##R" styles="text-align:right;width:100%;height:22"></gw:textbox></td>
                    </tr>
                    <tr>   
                        <td align="right">Original country &nbsp;</td>
                        <td ><gw:textbox id="txtCOUNTRY" styles='width:100%'/></td>
                        <td align="right">Production year &nbsp;</td>
                        <td ><gw:textbox id="txtMADE_YEAR" styles='width:100%'/></td>
                        <td align="right">Capacity &nbsp;</td>
                        <td ><gw:textbox id="txtCAPACITY" styles='width:100%'/></td>
                        <td align="right">Engine No &nbsp;</td>
                        <td ><gw:textbox id="txtENGINE" styles='width:100%'/></td>
                    </tr>
                </table> 				
                <table name="Movement"  align ="top"  cellspacing=0 cellpadding=0 border=0 style="width:100%;height:145;" >
                    <tr>
                        <td width="100%">
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                    <td width="18%"></td>
                                    <td width="3%"></td>
                                    <td width="3%"></td>
                                    <td width="3%"></td>
                                    <td width="3%"></td>
                                </tr>
                                <tr>
                                    <td colspan="8"></td>
                                    <td ><gw:button id="btnNewMove"    img="new"       alt="New"        onclick="OnNewMove()" /></td>
                                    <td ><gw:button id="btnSaveMove"   img="save"      alt="Save"       onclick="OnUpdateMove()" /></td>
                                    <td ><gw:button id="btnDeleteMove" img="delete"    alt="Delete"     onclick="OnDeleteMove()" /></td>
                                    <td ><gw:button id="btnPrintMove" img="printer"    alt="Print"     onclick="OnPrintMove()" /></td>
                                </tr>
                                <tr>
                                    <td align="right">Movement Date &nbsp;</td>
                                    <td ><gw:datebox id="txtMOVE_DATE" styles='width:100%'  lang="<%=Session("Lang")%>"/></td>
                                    <td align="right">To Deparment &nbsp;</td>
                                    <td ><gw:list id="lstMOVE_DEPT" styles='width:100%'></gw:list></td>
                                    <td align="right">To Charger &nbsp;</td>
                                    <td ><gw:textbox id="txtMOVE_CHARGER" styles='width:100%'/></td>
                                    <td align="right"><a title="Click here to show Account" onclick="GetAccount('4')" href="#tips" ><b>Depr. Acct.&nbsp;</b></a></td>
                                    <td colspan="7">
                                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                            <tr>
                                                <td width="95%"><gw:textbox id="txtMOVE_DEPR_PK" styles='display:none'></gw:textbox>
                                                                <gw:textbox id="txtMOVE_DEPR_CD" styles='width:30%;height:22'></gw:textbox>
                                                                <gw:textbox id="txtMOVE_DEPR_NM" styles='width:67%;height:22'></gw:textbox></td>
                                                <td><gw:imgBtn id="ibtMovAccReset" img="reset"  alt="reset acc" onclick="resetMovAcc('4')" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <td align="right">Remark &nbsp;</td>
                                    <td colspan="5"><gw:textbox id="txtMOVE_REMARK" styles='width:49%'/>
                                                    <gw:textbox id="txtMOVE_REMARK2" styles='width:50%'/></td>
                                    <td align="right"><a title="Click here to show Account" onclick="GetAccount('5')" href="#tips" ><b>Expe. Acct.&nbsp;</b></a></td>
                                    <td colspan="5">
                                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                            <tr>
                                                <td width="95%"><gw:textbox id="txtMOVE_EXPE_PK" styles='display:none'></gw:textbox>
                                                                <gw:textbox id="txtMOVE_EXPE_CD" styles='width:30%;height:22'></gw:textbox>
                                                                <gw:textbox id="txtMOVE_EXPE_NM" styles='width:67%;height:22'></gw:textbox></td>
                                                <td><gw:imgBtn id="ibtMovAccReset" img="reset"  alt="reset acc" onclick="resetMovAcc('5')" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td width="100%" colspan="12">
                            <gw:grid
                            id="grdMove"
                            header  ="_mst_pk|_pk|DATE|dept_pk(3)|DEPARTMENR|CHARGER|_acpk_depr(6)|DEPT AC_CD|_AC_NM|_expepk_expe(9)|EXPE AC_CD|_AC_NM|REMAIN FAMT|REMAIN AMT|_dept_pk_from(14)|OLD DEPT|DESCRIPTION|LOCAL DESCRIPTION"
                            format  ="0|0|4|0|0|0|0|0|0|0|0|0|1|1|0|0|0"
                            aligns  ="0|0|3|0|0|0|0|0|0|0|0|0|3|3|0|0|0"
                            defaults="||||||||||||||||"
                            editcol ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
                            widths  ="0|0|1500|0|2000|1800|1500|1500|0|1500|1500|1500|1500|1500|1500|2500|2500"
                            styles  ="width:100%; height:100"
                            sorting ="F"
                            acceptNullDate="T"
                            oncellclick = "grdMoveClick()"
                            />   
                        </td>
                    </tr>
                </table>
            </gw:tab>
        </td>
    </tr>
</table>

<gw:textbox id="txt_PK"                  style="display:none"/>
<gw:textbox id="txtEXIST"                style="display:none"/>
<gw:textbox id="txtDEPR"                 style="display:none"/>
<gw:textbox id="txtMOVE_OLDDEPT"                 style="display:none"/>
<gw:textbox id="txtMESS"                 style="display:none"/>
<gw:textbox id="txtMOVE_PK"                 style="display:none"/>
<gw:textbox id="txtMST_PK"                 style="display:none"/>
<gw:textbox id="txtMOVE_REMAIN_FAMT"                 style="display:none"/>
<gw:textbox id="txtMOVE_REMAIN_AMT"                 style="display:none"/>
<gw:textbox id="txttac_photo_pk" maxlen="100" styles='width:100%;display:none'        csstype="" />
<gw:textbox id="txtResult_Num"                style="display:none"/>
<gw:textbox id="txtResult_Var"                style="display:none"/>

<!---------------------------------------------------------------------------------------------------->
</body>
</html>