<!-- #include file="../../../../system/lib/form.inc"  -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head >
    <title>LONG-TERM PREPAYMENT ENTRY</title>
    <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

    <script>
  var Insert      = 'F';
var Modify      = 'F';
var Delete    = 'F';  
 function BodyInit()
 {
    System.Translate(document);
    BindingDatalist();
    OnNew();
	txt_row.text    = 1;
    txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	dso_getCompany_entry.Call();

    
  

 }
//-----------------------------------------------------------------------------------------------------------------------
 function BindingDatalist()
 {
    var data="";
	data="<%=CtlLib.SetListDataSQL("select pk,org_nm from tco_org a where   del_if=0")%>"; 
	lstDepartment.SetDataText(data);
	data = "<%=CtlLib.SetListDataFUNC("SELECT AC_GET_COMMONCODE('ACDF0060') FROM DUAL")%>";
	lstAllocate.SetDataText(data);
	data = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','','') FROM DUAL")%>";  //ccy
	lstCcy.SetDataText(data);	 
	data = "<%=CtlLib.SetListDataSQL("SELECT pk, PARTNER_NAME FROM TCO_company  where del_if=0")%>"; 
	lstCompany.SetDataText(data);
	lstCompany.value = "<%=Session("COMPANY_PK") %>";
	data = "<%=CtlLib.SetListDataSQL("SELECT pk, PARTNER_NAME FROM TCO_company  where del_if=0")%>";
	lstCompany1.SetDataText(data);
	lstCompany.value = "<%=Session("COMPANY_PK") %>";
	lstCompany1.value = "<%=Session("COMPANY_PK") %>";
	var lststatus      = "<%=CtlLib.SetListDataFUNC("SELECT AC_GET_COMMONCODE('ACDF0070') FROM DUAL")%>";
	txtStatus.SetDataText(lststatus);
	data = "<%=CtlLib.SetListDataFUNC("SELECT AC_get_default('ACBG0040') FROM DUAL")%>";
	arr  = data.split("|");
	txtbookccy.SetDataText(arr[1]);
 }   
 //-----------------------------------------------------------------------------------------------------------------------
 function OnSearch()
 {
    dso_sel_prepay.Call("SELECT");
 }
 //-----------------------------------------------------------------------------------------------------------------------
 function changecompany()
 {
    dso_sel_prepay.Call("SELECT");
 }
 //-----------------------------------------------------------------------------------------------------------------------
function OnSave()
	{  
	   dsoPrepayMaster.Call();
	}
//-----------------------------------------------------------------------------------------------------------------------
function OnNew()
	{
		dsoPrepayMaster.StatusInsert();
		btnSave.SetEnable(true);
		txtDeprRate.SetDataText('1');
		txtTransRate.SetDataText('1');
		txtBookRate.SetDataText('1');
		txtMonthly_Famt.text="0";
		lstCcy.value='VND';
	  Insert = 'T';  
	}
//-----------------------------------------------------------------------------------------------------------------------
function OnDelete()
{
   
    dsoPrepayMaster.StatusDelete(); 
    dsoPrepayMaster.Call();
    Delete='T';  
}
//-----------------------------------------------------------------------------------------------------------------------
 function OnSelect()
 {
    txtMasterPK.text = grdPrepayment.GetGridData(grdPrepayment.row,0);
    dsoPrepayMaster.Call("SELECT");
 }
 //-----------------------------------------------------------------------------------------------------------------------
  function onchanglist()
 {
    dso_get_exrate_list.Call("SELECT");
 }
 //-----------------------------------------------------------------------------------------------------------------------
function OnPopUp(pos)
{
    var tmp;
    var aValue;
    switch(pos)
    {
    case 'Acount':
//        var i = 0;
//        var fpath   = System.RootURL + "/standard/forms/gf/ja/gfja00010_1.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + "&val1="+"&val2=&val3=" + lstCompany.GetData() + "&dsqlid=ACNT.SP_SEL_ACCOUNT_NEW";
//        aValue      = System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	
//        if ( aValue != null )
//        { 
//        
//            tmp = aValue[0];
//            txtAcountPK.text = tmp[0]; 
//            txtAcountCode.text   = tmp[2];
//            txtAcountCodeNM.text   = tmp[3];		  
//        }

                          var fpath = System.RootURL + "/standard/forms/60/15/60150111_popup_Acc.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60150111_acc_popup";
                          var  o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes');	
                            if (o != null)
	                        {
		                        if(o[0] != 0)
		                        {
		                            txtAcountCode.SetDataText(o[0]);
			                        txtAcountCodeNM.SetDataText(o[1]);
			                        txtAcountPK.SetDataText(o[3]);
		                        }
                            }

        break;
        case 'CodeExpense':
//                            var i = 0;
//                            var fpath   = System.RootURL + "/standard/forms/gf/ja/gfja00010_1.aspx?comm_nm="+ '' + "&comm_code=" + '' + "&comm_nm2=" + "&val1="+"&val2=&val3=" + lstCompany.GetData() + "&dsqlid=ACNT.SP_SEL_ACCOUNT_NEW";
//                            aValue      = System.OpenModal(  fpath , 550 , 550 , 'resizable:yes;status:yes');	
//                            if ( aValue != null )
//                            { 
//                            
//                                tmp = aValue[0];
//                                txtAccCodeExpPK.text = tmp[0]; 
//                                txtAccCodeExp.text   = tmp[2];
//                                txtAccCodeExpNM.text   = tmp[3];		  
//                            }

                                 var fpath = System.RootURL + "/standard/forms/60/15/60150111_popup_Acc.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + 'Y' + "&val2=" + 'Y' + "&val3=" + lstCompany.GetData() + "&dsqlid=ac_sel_60150111_acc_popup";
                          var  o = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes');	
                            if (o != null)
	                        {
		                        if(o[0] != 0)
		                        {
		                            txtAccCodeExp.SetDataText(o[0]);
			                        txtAccCodeExpNM.SetDataText(o[1]);
			                        txtAccCodeExpPK.SetDataText(o[3]);
		                        }
                            }
        break;
        case 'PLUnit':
             fpath  = System.RootURL + "/standard/forms/60/15/60150112_plcenter.aspx?comm_code="+ "" + "&comm_nm=" + '' + "&company=" +  lstCompany.GetData() + '&dsqlid=AC_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
             oValue = System.OpenModal( fpath , 600 , 400 , 'resizable:yes;status:yes');
            if ( oValue != null )
            {
                
                txtUnitPK.text = oValue[2]; 
                txtUnitNM.text   = oValue[1];
                txtUnitID.text   = oValue[0];
            }
          
        break;     
		case "cust":
			var path = System.RootURL + '/standard/forms/60/15/60150113.aspx';
			var object = System.OpenModal( path ,800 , 630 , 'resizable:yes;status:yes');
			if ( object != null )
			{
				if (object[0] != 0)
				{
					txtcustPK.text = object[0];
					txtCustID.text = object[1];
					txtCustNM.text = object[2];
				}
			}
		break;
    }        
}
//-----------------------------------------------------------------------------------------------------------------------
function OnDataReceive(obj)
{
    switch(obj.id)
    {   
        case "dso_getCompany_entry":
				dso_getCompany.Call();
		break;
		case "dso_getCompany":
				dso_get_rate_book.Call();
		break;
		case "dso_get_exrate_list":
            lstBookExRate.value = lstCcy.GetData();
            var ex_rate = lstBookExRate.GetText();
            if(ex_rate == ""){
                alert("Please input exchange rate for this "+ lstCcy.GetData() +" currency at date:"+ dtTrans.GetData() +".");
                return;
            }
            else{
                txtTransRate.SetDataText(ex_rate);
            }
        break;
       case "dsoPrepayMaster":
             if((Insert == 'T') || (Modify == 'T') || (Delete=='T'))
              {
                     Insert = 'F';
                     Modify = 'F';
                     Delete = 'F';
                dso_sel_prepay.Call("SELECT");
              }
            
        break;
        case "dso_get_tongsongaykhauhao":
             DailyAllocate();
        break;
    }
}
//------------------------------------------------------------------------
function UpdateCost()
{ 
   
	var tr_rate = Number(txtTransRate.text);
    var bk_rate = Number(txtBookRate.text);
    var cost_amt = Number(txtDeprAMT.text);
    var cost_famt = Number(txtDeprFAMT.text);
    var book_rate = Number(lblBookRate.text);
   var accum_dept_amt = Number(txtACC_amt.GetData());
   var accum_dept_famt = Number(txtACC_famt.GetData());
   
   var BEGIN_DEPR_FAMT = Number(txtBeginFAMT.GetData());
   var BEGIN_DEPR_AMT = Number(txtBeginAMT.GetData());
   var REMAIN_FAMT=0;
    var REMAIN_AMT=0;
        if(txtbookccy.text=='USD')
        {
                   if(lstCcy.value=='VND')
                   {
                            cost_amt = Math.round(cost_famt / book_rate *100)/100;
                            txtDeprAMT.SetDataText("" + cost_amt);
                            REMAIN_AMT = cost_amt - (accum_dept_amt + BEGIN_DEPR_AMT *100)/100;
                            txtRemain_amt.SetDataText("" + REMAIN_AMT);
                            REMAIN_FAMT = cost_famt - (accum_dept_famt + BEGIN_DEPR_FAMT);
                            txtRemain_Famt.SetDataText("" + REMAIN_FAMT);
                   }  
                   else if(lstCcy.value=='USD')
                   {
                            cost_amt = Math.round(cost_famt * book_rate / book_rate *100)/100;
                            txtDeprAMT.SetDataText("" + cost_amt);
                            REMAIN_AMT = cost_amt - (accum_dept_amt + BEGIN_DEPR_AMT *100)/100;
                            txtRemain_amt.SetDataText("" + REMAIN_AMT);
                            REMAIN_FAMT = cost_famt - (accum_dept_famt + BEGIN_DEPR_FAMT);
                            txtRemain_Famt.SetDataText("" + REMAIN_FAMT);
                   }        
        }
        else if(txtbookccy.text=='VND')
        {
                    if(lstCcy.value=='VND')
                    { 
                            cost_amt = Math.round(cost_famt / book_rate );
                            txtDeprAMT.SetDataText("" + cost_amt);
                            REMAIN_AMT = cost_amt - (accum_dept_amt + BEGIN_DEPR_AMT);
                            txtRemain_amt.SetDataText("" + REMAIN_AMT);
                            REMAIN_FAMT = cost_famt - (accum_dept_famt + BEGIN_DEPR_FAMT);
                            txtRemain_Famt.SetDataText("" + REMAIN_FAMT);
                    }
                    else  if(lstCcy.value=='USD')
                    {
                            cost_amt = Math.round(cost_famt * tr_rate);
                            txtDeprAMT.SetDataText("" + cost_amt);
                            REMAIN_AMT = cost_amt - (accum_dept_amt + BEGIN_DEPR_AMT);
                            txtRemain_amt.SetDataText("" + REMAIN_AMT);
                            REMAIN_FAMT = cost_famt - (accum_dept_famt + BEGIN_DEPR_FAMT);
                            txtRemain_Famt.SetDataText("" + REMAIN_FAMT);
                    } 
        }
  
    MonthlyDeprAmt();
    DailyAllocate();
}
//----------------------------------------------------------------------------------------------
function MonthlyDeprAmt()
{
    var cost_amt  = Number(txtDeprAMT.text);
    var cost_famt = Number(txtDeprFAMT.text);
    var begin_amt = Number(txtBeginAMT.text);
    var begin_famt = Number(txtBeginFAMT.text);
    var depr_rate = Number(txtDeprRate.text);
    var depr_TotalMM = Number(txtMM.text);
    var d_yy = Number(txtYY.text);
    var d_mm = Number(txtMM.text);
     var Ex_rate = Number(txtTransRate.text);
    var depr_amt =0;
    var depr_famt =0;
    var book_rate = Number(lblBookRate.text);
    if(d_yy > 0 || d_mm > 0)
    {
        if(txtbookccy.text=='USD')
        {
                if(lstCcy.value=='VND')
                { 
                         depr_famt = Math.round((cost_famt * depr_rate) /d_mm);
                         depr_amt = Math.round((cost_amt * depr_rate) /d_mm *100)/100;
                }
                else if(lstCcy.value=='USD')
                {
                         depr_famt = Math.round((cost_famt * depr_rate) /d_mm *100)/100;
                         depr_amt = Math.round((cost_amt * depr_rate) /d_mm *100)/100;
                }
        }
        else if(txtbookccy.text=='VND')
        {
                    if(lstCcy.value=='VND')  
                    {        
                            depr_famt = Math.round((cost_famt * depr_rate) / d_mm );
                            depr_amt = Math.round((cost_amt * depr_rate) / d_mm);
                    }
                    else  if(lstCcy.value=='USD')  
                    {
                            depr_famt = Math.round((cost_famt * depr_rate) / d_mm *100)/100;
                            depr_amt = Math.round((cost_amt * depr_rate) / d_mm);
                    }    
        }
    }
    txtMonthly_Famt.SetDataText(""+ depr_famt);
    txtMonthly_Amt.SetDataText(""+ depr_amt);
}
//------------------------------ sua ------------------------------------------------------------
function OnchangeYear()
{
    
    var currYear = Number(txtYY.GetData());
    var currMonth = Number(txtTotalMM.GetData());
    var updateTotalMonth=(currYear*12)+ currMonth;
    txtMM.SetDataText("" + updateTotalMonth);
    UpdateCost();
    dso_get_tongsongaykhauhao.Call();
    DailyAllocate();
 
   
}
//----------------------------------------------------------
function OnchangeMonth()
{
    MonthlyDeprAmt();
    var currYear = Number(txtYY.GetData());
    var currMonth = Number(txtTotalMM.GetData());
    var updateTotalMonth=(currYear*12)+ currMonth;
    txtMM.SetDataText("" + updateTotalMonth);
    UpdateCost();
    dso_get_tongsongaykhauhao.Call();
    DailyAllocate();
    
 
}
//-------------------------------------------------------
function UpdateBeginDepr(ind)
{
	var tr_rate = Number(txtTransRate.text);
    var bk_rate = Number(txtBookRate.text);
    var begin_amt = Number(txtBeginAMT.text);
    var begin_famt = Number(txtBeginFAMT.text);
    var book_rate = Number(lblBookRate.text);
//    if(ind == 1)
//    {
        if(txtbookccy.text=='USD')
        {
                 if(lstCcy.value=='USD')  
                 {      
                        begin_amt = Math.round(begin_famt * book_rate / book_rate *100)/100;
                        txtBeginAMT.SetDataText("" + begin_amt);
                        txtBeginFAMT.SetDataText("" + begin_famt);
                 }
                 else  if(lstCcy.value=='VND')  
                 { 
                        begin_amt = Math.round(begin_famt / book_rate *100)/100;
                        txtBeginAMT.SetDataText("" + begin_amt);
                        txtBeginFAMT.SetDataText("" + begin_famt);
                  }  
        }
         else if(txtbookccy.text=='VND')
        {
                    if(lstCcy.value=='VND')  
                    {  
                         begin_amt = Math.round(begin_famt * book_rate);
                        txtBeginAMT.SetDataText("" + begin_amt);
                        txtBeginFAMT.SetDataText("" + begin_famt);
                    }
                   else if(lstCcy.value=='USD')
                  {
                            begin_amt = Math.round(begin_famt * tr_rate);
                        txtBeginAMT.SetDataText("" + begin_amt);
                        txtBeginFAMT.SetDataText("" + begin_famt);
                  }      
        }
//    }
  UpdateRemainAMT();
     MonthlyDeprAmt();
}
//--------------------------------------------------------------
function OnchangeAccDept()
{
	var tr_rate = Number(txtTransRate.text);
    var bk_rate = Number(txtBookRate.text);
    var begin_amt = Number(txtACC_amt.text);
    var begin_famt = Number(txtACC_famt.GetData());
     var book_rate = Number(lblBookRate.text);
      if(txtbookccy.text=='USD')
      {
            if(lstCcy.value=='VND')  
            {   
                    begin_amt = Math.round(begin_famt /book_rate *100)/100;
                    txtACC_amt.SetDataText("" + begin_amt);
             } 
             else  if(lstCcy.value=='USD')  
            {
                       begin_amt = Math.round(begin_famt * book_rate /book_rate *100)/100;
                       txtACC_amt.SetDataText("" + begin_amt);
            }  
      }
      else  if(txtbookccy.text=='VND')
      {
             if(lstCcy.value=='VND') 
            { 
                    begin_amt = Math.round(begin_famt *book_rate);
                    txtACC_amt.SetDataText("" + begin_amt);
             } 
            else  if(lstCcy.value=='USD') 
            { 
                     begin_amt = Math.round(begin_famt * tr_rate);
                       txtACC_amt.SetDataText("" + begin_amt);
             } 
      }
        UpdateRemainAMT();
}
//------------------------------------------------------------------------
function UpdateRemainAMT()
{
  
    var cost_amt = Number(txtDeprAMT.GetData());
    var cost_famt = Number(txtDeprFAMT.GetData());
    var accum_dept_amt = Number(txtACC_amt.GetData());
    var accum_dept_famt = Number(txtACC_famt.GetData());
    var BEGIN_DEPR_FAMT = Number(txtBeginFAMT.GetData());
    var BEGIN_DEPR_AMT = Number(txtBeginAMT.GetData());
    var SettxtFRemain=0;
    var SettxtRemain=0;
        SettxtFRemain= cost_famt - (accum_dept_famt + BEGIN_DEPR_FAMT);
        SettxtRemain = cost_amt - (accum_dept_amt + BEGIN_DEPR_AMT);
        txtRemain_Famt.SetDataText("" + SettxtFRemain);
        txtRemain_amt.SetDataText("" + SettxtRemain);
        
}
//-----------------------------------------------------------------------------------------------------------------------
function DailyAllocate()
{
    var cost_famt1 = Number(txtDeprFAMT.text);
    var cost_amt1 = Number(txtDeprAMT.text);
    
    var depr_dd = Number(txtDAY.text);
    var daily = 0;
    var dailyf = 0;
    var depr_rate = Number(txtDeprRate.text);
    //daily = Math.round(cost_amt1/depr_dd);
    //dailyf = Math.round(cost_famt1/depr_dd);
    if(txtbookccy.text=='USD')
    {
            if(lstCcy.value=='VND') 
            { 
                 daily = Math.round((cost_amt1 * depr_rate) /depr_dd *100)/100;
                dailyf = Math.round((cost_famt1 * depr_rate) / depr_dd);
            }
           else  if(lstCcy.value=='USD') 
           {
                    daily = Math.round((cost_amt1 * depr_rate) /depr_dd *100)/100;
                    dailyf = Math.round((cost_famt1 * depr_rate) / depr_dd *100)/100;
           }
    }
    else if(txtbookccy.text=='VND')
    {
            if(lstCcy.value=='VND') 
            { 
                 daily = Math.round((cost_amt1 * depr_rate) /depr_dd);
                 dailyf = Math.round((cost_famt1 * depr_rate) / depr_dd);
            }
            else   if(lstCcy.value=='USD') 
            {
                    daily = Math.round((cost_amt1 * depr_rate) /depr_dd);
                    dailyf = Math.round((cost_famt1 * depr_rate) / depr_dd *100)/100;
            } 
   
    }
    txtDAILY_FAMT.SetDataText("" + dailyf);
    txtDAILY_AMT.SetDataText("" + daily);
    
}
//-----------------------------------------------------------------------------------------------------------------------
function OnToggle()
 {
    var left  = document.all("idLEFT");    
    var right = document.all("idRIGHT");   
    var imgArrow = document.all("imgArrow");       
    if(imgArrow.status == "expand")
    {
        left.style.display="none";       
        imgArrow.status = "collapse";
        right.style.width="100%";
        imgArrow.src = "../../../system/images/next_orange.gif";
    }
    else
    {
        left.style.display="";
        imgArrow.status = "expand";
        right.style.width="70%";
        imgArrow.src = "../../../system/images/prev_orange.gif";
    }
 }
 //==============================================================
 
 function OnPrint()
	{
		
	}
 //==============================================================
 </script>
</head>
<body>
<!------------------------------------------------------------------------>
<gw:data id="dso_getCompany_entry" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60150110_4_entry" > 
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
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60150110_1" > 
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
<gw:data id="dso_get_tongsongaykhauhao" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="process" procedure="ac_pro_60150110_dep_days">
                <input> 
                     <input bind="dtAllo_Date"/>
                      <input bind="txtMM"/>
                </input>
                <output>
                     <output bind="txtDAY"/>
               </output> 
            </dso> 
        </xml>
    </gw:data>
<!------------------------------------------------------------------------------------------------------------------->    
   <gw:data id="dso_sel_prepay">
        <xml>
            <dso type="grid" function="ac_sel_60150110_pre_pay" onreceive="OnDataReceive(this)">
                <input bind="grdPrepayment">
                    <input bind="dtFrom"/>
                    <input bind="dtTo"/>
                    <input bind="lstCompany"/>
                    <input bind="txtVoucherNo"/>
                    <input bind="txtDescription"/>
                </input>
                <output bind="grdPrepayment"/>
            </dso>
        </xml>
    </gw:data>
<!------------------------------------------------------------------------------------------------------------------->        
    <gw:data id="dsoPrepayMaster" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36, 37,38,39,40,41,42" function="ac_sel_60150110_prepay_master" procedure="ac_upd_60150110_prepay_master"> 
                <inout> 
                    <inout bind="txtMasterPK" />
                    <inout bind="txtAcountPK" />
                    <inout bind="txtAccCodeExpPK" />
                    <inout bind="dtTrans" /> 
                    <inout bind="txtVoucher" />
                    
                    <inout bind="txtDes" />
                    <inout bind="txtLocalDescription" />
                   
                    <inout bind="lstDepartment"/>
                    
                    <inout bind="txtStatus"/>
                    <inout bind="lstCcy"/>
                    <inout bind="txtTransRate"/>
                    <inout bind="txtBookRate"/>
                    <inout bind="txtDeprFAMT"/>
                    
                    <inout bind="txtDeprAMT"/>
                    <inout bind="txtBeginFAMT"/>	
                    <inout bind="txtBeginAMT"/>	
                    <inout bind="txtYY"/>	
                    <inout bind="txtMM"/>	
                    
                    <inout bind="txtDeprRate"/>	
                    <inout bind="lstCompany1" />	
                    <inout bind="dtService" />	
                    <inout bind="lstAllocate" />	
                    <inout bind="txtMonthly_Famt"/>	
                    
                    <inout bind="txtMonthly_Amt"/>	
                    <inout bind="txtACC_famt"/>	
                    <inout bind="txtACC_amt"/>	
                    <inout bind="txtRemain_Famt"/>	
                    <inout bind="txtRemain_amt"/>	
                    
                    <inout bind="txtTotalMM"/>	
                    <inout bind="dtAllo_Date" />
                    <inout bind="txtUnitPK" />
                    <inout bind="txtUnitID" />
                    <inout bind="txtUnitNM" />
                    
                    <inout bind="txtAcountCode" />
                    <inout bind="txtAcountCodeNM" />
                    <inout bind="txtAccCodeExp" />
                    <inout bind="txtAccCodeExpNM" />
                    
                    <inout bind="txtDAILY_FAMT" />
                    <inout bind="txtDAILY_AMT" />
                    <inout bind="txtDAY" />

					<inout bind="txtcustPK" />
                    <inout bind="txtCustID" />
                    <inout bind="txtCustNM" />

               </inout>
            </dso> 
        </xml> 
    </gw:data>
    <!---------------------------------------------------------------------------------------------------->
     <gw:data id="dso_get_exrate" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="list" procedure="AC_PRO_GET_BOOKCCY"> 
                <input> 
                     <input bind="lstCompany1"/>
                     <input bind="dtService" />
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
            <dso type="process" procedure="AC_PRO_GET_RATE"> 
                <input> 
                     <input bind="dtService"/>
                     <input bind="lstCompany1"/>
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
    <!------------------------------------------------------------------------------------------------------->
    <gw:data id="dso_get_exrate_list" onreceive="OnDataReceive(this)">
        <xml> 
            <dso type="list" procedure="ac_lst_60150110"> 
                <input> 
                     <inout bind="lstCompany1" />
                     <input bind="dtTrans"/>
                     
                </input>
                <output>
                     <output bind="lstBookExRate"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<!------------------------------------------------------------------------------------------------------------------->      
   <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
        <tr>
            <td width="45%" id="idLEFT">
                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                    <tr style="height: 4%;width:100%">
                        <td>
                            <fieldset>
                                <table style="width: 100%; height: 100%" cellpadding="1" cellspacing="1">
                                    <tr>
                                        
                                           
                                                    <td width="17%" align="right">Company&nbsp;</td>
                                                    <td width="83%" ><gw:list id="lstCompany" styles="width:100%;" onchange="changecompany()" /></td>
                                                    <td ><gw:imgbtn id="btnSearch" img="search" alt="Search" text="Search" onclick="OnSearch()" /></td>
                                               <tr>
                                                    <td width="17%" align="right">Voucher No&nbsp;</td>
                                                    <td width="83%" colspan="2"><gw:textbox id="txtVoucherNo"  onenterkey="OnSearch()" /></td>
                                                </tr>
                                                <tr >
                                                    <td width="17%" align="right">Trans Date&nbsp;</td>
                                                                 
                                                    <td width="83%" colspan="2">
                                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                         <td width="15%"><gw:datebox id="dtFrom" lang="1" /></td>
                                                                                        <td align="center">~</td>
                                                                                         <td width="15%"><gw:datebox id="dtTo" lang="1"  /></td>
                                                                                        <td width="70%"></td> 
                                                                            </tr>
                                                                </table>
                                                    </td>
                                                    
                                                    
                                                </tr>
                                                <tr>
                                                    <td width="17%" align="right">Description&nbsp;</td>
                                                    <td width="83%" colspan="2"><gw:textbox id="txtDescription" onenterkey="OnSearch()" /></td>
                                                </tr>
                                          
                                       </tr>
                                 
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height: 96%">
                        
                                    <td colspan="5">
                                        <gw:grid id="grdPrepayment" 
                                            header='_PK|No|Trans Date|Voucher No|Description|Account Code| Account Name|Books Amt.|_CompanyPK'
                                            format='0|0|4|0|0|0|0|0|0' aligns='1|3|0|0|0|0|0|0|0' defaults='||||||||' editcol='1|0|1|1|1|1|1|1|0'
                                            widths='0|350|1100|1500|1600|1200|2300|1000|0' sorting='T' styles='width:100%; height:100%'
                                            oncellclick="OnSelect()" />
                                    </td>
                             
                    </tr>
                </table>
            </td>
            <td width="55%" id="idRIGHT">
                <table style="width: 100%; height: 100%;"  cellpadding="0"
                    cellspacing="0">
                    <tr style="height: 2%">
                        <td>
                            <fieldset>
                                <table style="width: 100%; height: 100%">
                                    <tr valign="top">
                                        <td style="width: 15%">Company</td>
                                        <td style="width: 60%"><gw:list id="lstCompany1"/></td>
                                        <td style="width: 5%"></td>
                                        <td style="width: 1%"> <gw:button  id="btnNew" img="new" alt="New" onclick="OnNew()" /> </td>	  
										<td style="width: 1%"><gw:button id="btnSave" img="save" alt="Save" onclick="OnSave()" /></td>
										<td style="width: 1%"> <gw:button id="btnDelete" img="delete" alt="Delete" onclick="OnDelete()" /> </td>
										<td style="width: 1%" align="right"><gw:button id="btnPrint"  text="Print" alt="Print Out Report" img="excel" onclick="OnPrint()" /></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <fieldset>
                                <legend style="color:Teal">General Ledger Information</legend>
                                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="12%">
                                            <a title="Click here to select Requester" onclick="OnPopUp('Acount')" href="#tips"
                                                style="text-decoration: none; color=#0000ff">Acount Code</a></td>
                                        <td colspan="3" width="38%">
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                                        <td width="30%" colspan="3">
                                                                            <gw:textbox id="txtAcountCode" csstype="mandatory" styles="width:100%;" readonly="true" />
                                                                            <gw:textbox id="txtAcountPK" styles="width:100%;display:none"  />
                                                                        </td>
                                                                        <td width="70%">
                                                                            <gw:textbox id="txtAcountCodeNM" csstype="mandatory" styles="width:100%;" readonly="true" />
                                                                            
                                                                        </td>
                                                                        <td><gw:imgbtn id="btnPrint1" img="reset" alt="Reset" onclick="txtAcountPK.text='';txtAcountCode.text='';txtAcountCodeNM.text='';" /></td>
                                                        </tr>
                                                    </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="12%">
                                            <a title="Click here to select Requester" onclick="OnPopUp('CodeExpense')" href="#tips"
                                                style="text-decoration: none; color=#0000ff">Acc.Expense</a></td>
                                        <td colspan="3" width="38%">
                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td width="30%" colspan="3">
                                                                                <gw:textbox id="txtAccCodeExp" csstype="mandatory" styles="width:100%;" readonly="true" />
                                                                                <gw:textbox id="txtAccCodeExpPK" styles="width:100%;display:none" />
                                                                            </td>
                                                                            <td width="70%">
                                                                                <gw:textbox id="txtAccCodeExpNM" csstype="mandatory" styles="width:100%;" readonly="true" />
                                                                            </td>
                                                                           <td><gw:imgbtn id="btnPrint111" img="reset" alt="Reset" onclick="txtAccCodeExpPK.text='';txtAccCodeExp.text='';txtAccCodeExpNM.text='';" /></td>
                                                                        </tr>
                                                        </table>
                                                    </td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                                <tr valign="top">
                                    <td width="100%">
                                        <fieldset>
                                            <legend style="color:Teal">General Information</legend>
                                            <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="7%">Trans Date</td>
                                                    <td width="15%"><gw:datebox id="dtTrans" lang="1" /></td>
                                                    <td width="10%" align="right">Voucher</td>
                                                    <td width="23%"><gw:textbox id="txtVoucher" csstype="mandatory" /></td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">Description</td>
                                                    <td colspan="3" width="10%"><gw:textbox id="txtDes" /></td>
                                                </tr>
                                                <tr>
                                                    <td width="10%">Local.Description</td>
                                                    <td colspan="3"><gw:textbox id="txtLocalDescription" /></td>
                                                </tr>
                                                
                                                <tr>
                                                    <td>
                                                        <a title="Click here to select PL unit" onclick="OnPopUp('PLUnit')" href="#tips"
                                                            style="text-decoration: none; color=#0000ff">P/L Unit</a></td>
                                                    <td colspan="3">
                                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                                                <tr>
                                                                                                <td width="30%" colspan="3">
                                                                                                    <gw:textbox id="txtUnitID" csstype="mandatory" styles="width:100%;" readonly="true" />
                                                                                                    <gw:textbox id="txtUnitPK" styles="width:100%;display:none" />
                                                                                                </td>
                                                                                                <td width="70%">
                                                                                                    <gw:textbox id="txtUnitNM" csstype="mandatory" styles="width:100%;" readonly="true" />
                                                                                                </td>
                                                                                                <td><gw:imgbtn id="btnPrint11" img="reset" alt="Reset" onclick="txtUnitPK.text='';txtUnitID.text='';txtUnitNM.text='';" /></td> 
                                                                                </tr>
                                                                    </table>
                                                    </td>
                                                </tr>
												 <tr>
                                                    <td>
                                                        <a title="Click here to select Customer" onclick="OnPopUp('cust')" href="#tips"
                                                            style="text-decoration: none; color=#0000ff">Customer</a></td>
                                                    <td colspan="3">
                                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                                                <tr>
                                                                                                <td width="30%" colspan="3">
                                                                                                    <gw:textbox id="txtCustID" csstype="mandatory" styles="width:100%;" readonly="true" />
                                                                                                    <gw:textbox id="txtcustPK" styles="width:100%;display:none" />
                                                                                                </td>
                                                                                                <td width="70%">
                                                                                                    <gw:textbox id="txtCustNM" csstype="mandatory" styles="width:100%;" readonly="true" />
                                                                                                </td>
                                                                                                <td><gw:imgbtn id="btnPrint11" img="reset" alt="Reset" onclick="txtCustID.text='';txtcustPK.text='';txtCustNM.text='';" /></td> 
                                                                                </tr>
                                                                    </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>Department</td>
                                                    <td colspan="3"><gw:list id="lstDepartment" /></td>
                                                </tr>
                                                <tr>
                                                    <td width="5%">Status</td>
                                                    <td width="20%"><gw:list id="txtStatus"  /></td>
                                                    <td width="2%" align="right">CCY</td>
                                                    <td width="7%"><gw:list id="lstCcy" onchange="onchanglist()" /></td>
                                                </tr>
                                                <tr>
                                                    <td width="7%">Trans.Rate</td>
                                                    <td width="7%"><gw:textbox id="txtTransRate" type="number" text="1" format="###,###.##" styles="text-align:right;width:100%;" /></td>
                                                    <td width="7%" align="right">Books.Rate</td>
                                                    <td width="7%"><gw:textbox id="txtBookRate" type="number" format="###,###.##" text="1" styles="text-align:right;width:100%;" /></td>
                                                    
                                                </tr>
                                                
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td>
                            <fieldset>
                                <legend style="color:Teal">Allocation Information</legend>
                                <table style="width: 100%; height: 100%" cellpadding="0" cellspacing="0" border=0>
                                    <tr>
                                        <td colspan="6" align=left>
                                            <table width="100%" cellpadding=0 cellspacing=0>
                                                <tr>
                                                    <td width="20%">Estimate Life</td>
                                                   
                                                    <td width="80%" colspan="3">
                                                        <table style="width:100%" cellpadding="0" cellspacing="0">
                                                             <tr>
                                                                   <td width="10%"><gw:textbox id="txtYY" maxlen="10" type="number" onchange="OnchangeYear()" format="###,###,###" onenterkey = "OnchangeYear()"  /></td>
                                                                    <td width="15%" align="left">Year(s)</td>
                                                                    <td width="10%"><gw:textbox id="txtTotalMM" type="number" onchange="OnchangeMonth()" format="###,###,###"  onenterkey = "OnchangeMonth()" /></td>
                                                                    <td width="15%" align=left>Month (s)</td>
                                                                    <td width="10%"><gw:textbox id="txtMM" readonly="true" type="number" format="###,###,###" /></td>
                                                                    <td width="15%" align=left>Month(s)</td>
                                                                    <td width="10%"><gw:textbox id="txtDAY"  readonly="true" type="number" format="###,###,###" /></td>
                                                                    <td align="left" width="15%">Day(s)</td>
                                                             </tr>
                                                        </table>
                                                    </td>
                                                   
                                                    
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="3%">Allocate Method</td>
                                        <td width="5%" colspan="2"><gw:list id="lstAllocate" /></td>
                                        <td width="3%" align="right">Allo.Rate</td>
                                        <td width="5%" colspan="2"><gw:textbox id="txtDeprRate" text="1" type="number" format="###,###.##" styles="text-align:right;width:100%;height:22" /></td>
                                    </tr>
                                    <tr>
                                        <td width="4%">Service Date</td>
                                        <td width="5%"><gw:datebox id="dtService" lang="1" /></td>
                                        <td colspan="2"></td>
                                        <td width="3%" align="right">Allo.Date</td>
                                        <td width="4%"><gw:datebox id="dtAllo_Date" lang="1" onchange="DailyAllocate()" /></td>
                                    </tr>
                                    <tr>
                                        <td width="3%">Original Cost</td>
                                        <td width="3%" colspan="3"><gw:textbox id="txtDeprFAMT" type="number" format="###,###,###,###.##R" onchange="UpdateCost()" onblur="UpdateCost()" onenterkey="UpdateCost()" styles="text-align:right;width:100%;" /></td>
                                        <td width="3%" colspan="2"><gw:textbox id="txtDeprAMT" type="number" format="###,###,###,###.##R" readonly="true" styles="text-align:right;width:100%;color:red" /></td>
                                    </tr>
                                    <tr>
                                        <td width="3%">Begin Cost</td>
                                        <td width="3%" colspan="3"><gw:textbox id="txtBeginFAMT" type="number" format="###,###,###,###.##" onchange="UpdateBeginDepr()" onblur="UpdateBeginDepr()" onenterkey="UpdateBeginDepr()" styles="text-align:right;width:100%;" /></td>
                                        <td width="3%" colspan="2"><gw:textbox id="txtBeginAMT" type="number" format="###,###,###,###.##" readonly="true" styles="text-align:right;width:100%;color:red" /></td>
                                    </tr>
                                    <tr>
                                        <td width="3%">Monthly Allocate</td>
                                        <td width="3%" colspan="3"><gw:textbox id="txtMonthly_Famt" type="number" readonly="true" format="###,###,###,###.##" /></td>
                                        <td width="3%" colspan="2"><gw:textbox id="txtMonthly_Amt" type="number" format="###,###,###,###.##" readonly="true" styles="text-align:right;width:100%;color:red" /></td>
                                    </tr>
                                    <tr>
                                          <td width="3%">Daily Allocate</td>
                                          <td width="3%" colspan="3"><gw:textbox id="txtDAILY_FAMT" text="0" type="number" format="###,###,###,###.##" readonly="true"   styles="text-align:right;width:100%;"/></td>
                                          <td width="3%" colspan="2"><gw:textbox id="txtDAILY_AMT" type="number" format="###,###,###,###.##" readonly="true" styles="text-align:right;width:100%;color:red"/></td>
                                    </tr>
                                    <tr>
                                        <td width="3%">Acum.Allocate</td>
                                        <td width="3%" colspan="3"><gw:textbox id="txtACC_famt" onchange="OnchangeAccDept()" onblur="OnchangeAccDept()" onenterkey="OnchangeAccDept()" type="number" format="###,###,###,###.##" styles="text-align:right;width:100%;" /></td>
                                        <td width="3%" colspan="2"><gw:textbox id="txtACC_amt" onchange=""  readonly="true" type="number" format="###,###,###,###.##" styles="text-align:right;width:100%;color:red" /></td>
                                    </tr>
                                    <tr>
                                        <td width="3%">Remain.Allocate</td>
                                        <td width="3%" colspan="3"><gw:textbox id="txtRemain_Famt" type="number" readonly="true"  format="###,###,###,###.##" styles="text-align:right;width:100%;" /></td>
                                        <td width="3%" colspan="2"><gw:textbox id="txtRemain_amt" type="number" readonly="true" format="###,###,###,###.##" styles="text-align:right;width:100%;color:red" /></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
   <img status="expand" id="imgArrow" src="../../../../system/images/prev_orange.gif" style="cursor: hand;
        position: absolute; left: 1; top: 0;" onclick="OnToggle()" />
   <gw:textbox id="txtMasterPK" styles="display:none" />
    <gw:list id="lstBookExRate" styles="width:100%;display:none" />
   <gw:textbox id="lblBookRate" format="#,###,###,###,###,###,###.###"  type="number"  styles="width:100%;display:none"/>
   <gw:textbox id="txt_row"        styles='display:none'/>
    <gw:textbox id="txtbookccy" styles="width:95%;display:none"  /> 
<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
  
</body>
</html>
