<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Bank Statement Sum</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script type="text/javascript" language="javascript">
var g_inquiry_type = 10;//Dates :10; Vouchers :20
function BodyInit()
{
    var a_test ="<%=session("ACNT_LEVEL") %>"; 
	//alert(a_test);
	//grdSLByVoucher.style.display="none";
    System.Translate(document); 
    BindingDataList();
    FormatDepositAccount();
    FormatBankAccount();
 // grdDeposit.GetGridControl().setHeaderRow=-1;
   
}

function BindingDataList()
{
    var ls_comp    = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_ccy       = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>||<All>"; 
    var ls_report   =  "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK006' ORDER BY D.DEF_YN DESC, D.ORD ")%>";
    var ls_DepAcc = "<%=CtlLib.SetListDataSQL("SELECT '','<ALL>' FROM DUAL UNION ALL SELECT TO_CHAR(A.PK), A.BANK_ID FROM  TAC_ABDEPOMT A WHERE A.DEL_IF =0 AND  a.USE_YN='Y' ")%>";
    var ls_Bank = "<%=CtlLib.SetListDataSQL("SELECT '','<ALL>' FROM DUAL UNION ALL SELECT TO_CHAR(B.PK), PARTNER_NAME FROM TCO_BUSPARTNER B WHERE B.DEL_IF =0 AND B.PK IN (SELECT TCO_BUSPARTNER_PK FROM TAC_ABDEPOMT WHERE DEL_IF=0 AND  USE_YN='Y')")%>";
    var ls_searchby = "DATA|DEPOSIT|Deposit Account|BANK|Bank";
    var ls_bookccy = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
    lstCompany.SetDataText(ls_comp);
    lstSearchBy.SetDataText(ls_searchby);
    //lstDepositAccount.
    lstBookCcy. SetDataText(ls_bookccy);
    lstCurrency.SetDataText(ls_ccy);
    lstCurrency.value="";
    lstReportType.SetDataText(ls_report);
    //txtAC_CD.SetEnable(false);
    lstDepositAccount.SetDataText(ls_DepAcc);
    lstBankName.SetDataText(ls_Bank);
    lstBankName.value='';
    lstDepositAccount.value ='';
   /* var myDate=new Date();
    var fDate =""+myDate.getFullYear();
    if (myDate.getMonth()<9)
    {
            fDate=fDate+"0"+(myDate.getMonth()+1);
    }
    else
    {
            fDate=fDate+(myDate.getMonth()+1);
    }
    fDate=fDate+"01";
    dtbFrom.SetDataText(fDate);
	*/
}


function onCompanyChange()
{
    //grdDepositTmp.ClearData();
	//datGetDepositAccount.Call('');
}

function FormatDepositAccount()
{
    if(grdDeposit.rows <2)
	{
		grdDeposit.AddRow();
	}
	var fg=grdDeposit.GetGridControl();
	fg.FixedRows = 2;
	//fg.FrozenCols = 5;
	fg.MergeCells = 5;
	
	fg.MergeRow(0) = true;
	
	
	fg.Cell(0, 0, 0, 0, 1) = "DIVISION";
	//fg.Cell(0, 1, 0, 1, 0) = "ORG.INCOME";
	//fg.Cell(0, 1, 1, 1, 1) = "ORG.INCOME";
	/*fg.Cell(0, 1, 0, 1, 0) = "";
	fg.Cell(0, 1, 1, 1, 1) = "";/**/
	
	fg.MergeCol(2) = true;
	fg.Cell( 0,0, 2, 1, 2) = "UNIT";
	
	fg.MergeCol(3) = true;
	fg.Cell(0, 0, 3, 1, 3) = "BEFORE YESTERDAY BALANCE";
	
	fg.Cell(0, 0, 4, 0, 8) = "YESTERDAY INCOME";
	fg.Cell(0, 1, 4, 1, 4) = "ORG.INCOME";
	fg.Cell(0, 1, 5, 1, 5) = "EXCHANGE";
	fg.Cell(0, 1, 6, 1, 6) = "RECEIVING";
	fg.Cell(0, 1, 7, 1, 7) = "SETTELEMENT BALANCE";
	fg.Cell(0, 1, 8, 1, 8) = "TOTAL";
	
	fg.Cell(0, 0, 9, 0, 12) = "YESTERDAY PAYMENT";
	fg.Cell(0, 1, 9, 1, 9) = "ORG.PAYMENT";
	fg.Cell(0, 1, 10, 1, 10) = "WITHDRAWAL";
	fg.Cell(0, 1, 11, 1, 11) = "REMIT";
	fg.Cell(0, 1, 12, 1, 12) = "TOTAL";
	
	fg.MergeCol(13) = true;
	fg.Cell(0, 0, 13, 1, 13) = "YESTERDAY BALANCE";/**/
	
	

	
	fg.ColFormat(3) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(4) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(5) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(6) = "#,###,###,###,###,###,###,###";
	
    fg.ColFormat(7) = "#,###,###,###,###,###,###,###.##";
    fg.ColFormat(8) = "#,###,###,###,###,###,###,###.##";
    fg.ColFormat(9) = "#,###,###,###,###,###,###,###.##";
    fg.ColFormat(10) = "#,###,###,###,###,###,###,###.##";
    fg.ColFormat(11) = "#,###,###,###,###,###,###,###.##";
    fg.ColFormat(12) = "#,###,###,###,###,###,###,###.##";
    fg.ColFormat(13) = "#,###,###,###,###,###,###,###.##";
	
/*	if (lstBookCcy.value=="VND")
	{
        fg.ColFormat(7) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(10) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(13) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(16) = "#,###,###,###,###,###,###,###";
	}
	else
	{
	    fg.ColFormat(7) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(10) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(13) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(16) = "#,###,###,###,###,###,###,###.##";
	}

	
	*/
}

function FormatBankAccount()
{
    if(grdBankAccount.rows <2)
	{
		grdBankAccount.AddRow();
	}
	var fg=grdBankAccount.GetGridControl();
	fg.FixedRows = 2;
	//fg.FrozenCols = 5;
	fg.MergeCells = 5;
	
	fg.MergeRow(0) = true;
	
		fg.Cell(0, 0, 0, 0, 1) = "DIVISION";
	//fg.Cell(0, 1, 0, 1, 0) = "ORG.INCOME";
	//fg.Cell(0, 1, 1, 1, 1) = "ORG.INCOME";
	/*fg.Cell(0, 1, 0, 1, 0) = "";
	fg.Cell(0, 1, 1, 1, 1) = "";/**/
	
	fg.MergeCol(2) = true;
	fg.Cell( 0,0, 2, 1, 2) = "UNIT";
	
	fg.MergeCol(3) = true;
	fg.Cell(0, 0, 3, 1, 3) = "YESTERDAY BALANCE";
	
	fg.Cell(0, 0, 4, 0, 8) = "TODAY INCOME";
	fg.Cell(0, 1, 4, 1, 4) = "ORG.INCOME";
	fg.Cell(0, 1, 5, 1, 5) = "EXCHANGE";
	fg.Cell(0, 1, 6, 1, 6) = "RECEIVING";
	fg.Cell(0, 1, 7, 1, 7) = "SETTELEMENT BALANCE";
	fg.Cell(0, 1, 8, 1, 8) = "TOTAL";
	
	fg.Cell(0, 0, 9, 0, 12) = "TODAY PAYMENT";
	fg.Cell(0, 1, 9, 1, 9) = "ORG.PAYMENT";
	fg.Cell(0, 1, 10, 1, 10) = "WITHDRAWAL";
	fg.Cell(0, 1, 11, 1, 11) = "REMIT";
	fg.Cell(0, 1, 12, 1, 12) = "TOTAL";
	
	fg.MergeCol(13) = true;
	fg.Cell(0, 0, 13, 1, 13) = "TODAY FORCAST BALANCE";/**/

	fg.ColFormat(3) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(4) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(5) = "#,###,###,###,###,###,###,###";
	fg.ColFormat(6) = "#,###,###,###,###,###,###,###";
	
    fg.ColFormat(7) = "#,###,###,###,###,###,###,###.##";
    fg.ColFormat(8) = "#,###,###,###,###,###,###,###.##";
    fg.ColFormat(9) = "#,###,###,###,###,###,###,###.##";
    fg.ColFormat(10) = "#,###,###,###,###,###,###,###.##";
    fg.ColFormat(11) = "#,###,###,###,###,###,###,###.##";
    fg.ColFormat(12) = "#,###,###,###,###,###,###,###.##";
    fg.ColFormat(13) = "#,###,###,###,###,###,###,###.##";
/*	
	if (lstBookCcy.value=="VND")
	{
        fg.ColFormat(7) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(10) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(13) = "#,###,###,###,###,###,###,###";
		fg.ColFormat(16) = "#,###,###,###,###,###,###,###";
	}
	else
	{
	    fg.ColFormat(7) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(10) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(13) = "#,###,###,###,###,###,###,###.##";
		fg.ColFormat(16) = "#,###,###,###,###,###,###,###.##";
	}

/**/
	
}

function OnDataError(dsql)
{
	alert("ERROR "+ dsql.id+"-"+dsql.errmsg);
}

function OnDataReceive(objID)
{
	if (objID.id=="datDepositAccount")
	{
		
		datBankAccount.Call("SELECT");		          			      

	}
	
	
	if (objID.id=="datBankAccount")
	{
		FormatBankAccount();
		FormatDepositAccount();
        grdDeposit.GetGridControl().MergeCells  =4 ;	
        grdDeposit.GetGridControl().MergeCol(0) = true ;	
        grdDeposit.GetGridControl().MergeCol(1) = false ;	
        grdDeposit.GetGridControl().MergeCol(2) = false ;	
        grdDeposit.GetGridControl().MergeCol(3) = false ;	
        grdDeposit.GetGridControl().MergeCol(4) = false ;	
        grdDeposit.GetGridControl().MergeCol(5) = false ;	
        grdDeposit.GetGridControl().MergeCol(6) = false ;	
        grdDeposit.GetGridControl().MergeCol(7) = false ;	
        grdDeposit.GetGridControl().MergeCol(8) = false ;	
        grdDeposit.GetGridControl().MergeCol(9) = false ;	
        grdDeposit.GetGridControl().MergeCol(10) = false ;	
        grdDeposit.GetGridControl().MergeCol(11) = false ;	
        grdDeposit.GetGridControl().MergeCol(12) = false ;	
        grdDeposit.GetGridControl().MergeCol(13) = false ;	/**/

   
		grdDeposit.SetGridText(1,2,"");
		grdDeposit.SetGridText(1,3,"");
		grdDeposit.SetGridText(1,13,"");
		
//---------------------grdBankAccount--------------------------
         grdBankAccount.GetGridControl().MergeCells  =4 ;	
        grdBankAccount.GetGridControl().MergeCol(0) = true ;	
        grdBankAccount.GetGridControl().MergeCol(1) = false ;	
        grdBankAccount.GetGridControl().MergeCol(2) = false ;	
        grdBankAccount.GetGridControl().MergeCol(3) = false ;	
        grdBankAccount.GetGridControl().MergeCol(4) = false ;	
        grdBankAccount.GetGridControl().MergeCol(5) = false ;	
        grdBankAccount.GetGridControl().MergeCol(6) = false ;	
        grdBankAccount.GetGridControl().MergeCol(7) = false ;	
        grdBankAccount.GetGridControl().MergeCol(8) = false ;	
        grdBankAccount.GetGridControl().MergeCol(9) = false ;	
        grdBankAccount.GetGridControl().MergeCol(10) = false ;	
        grdBankAccount.GetGridControl().MergeCol(11) = false ;	
        grdBankAccount.GetGridControl().MergeCol(12) = false ;	
        grdBankAccount.GetGridControl().MergeCol(13) = false ;	/**/

   
		grdBankAccount.SetGridText(1,2,"");
		grdBankAccount.SetGridText(1,3,"");
		grdBankAccount.SetGridText(1,13,"");
		
		
	}
	

}


function onSearch()
{
	
	var cnd = lstSearchBy.value;
	if (cnd =="DEPOSIT")//Deposit Account
	{
		datDepositAccount.Call('SELECT');
		return;
	}
	if(cnd =="BANK")//Bank
	{
		datBankAccount.Call('SELECT');
		return;
	}
	
}

function GetAccount()
{
    var fpath = System.RootURL + "/standard/forms/gf/co/ffco002000.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=AC_SEL_ACCT_BANK";
    var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
    if ((object != null) &&(object[0]!="0"))
    {
        txtAC_PK.SetDataText("");
        txtAC_CD.SetDataText("");
        txtAC_PK.SetDataText(object[3]);
        txtAC_CD.SetDataText(object[0]);
    }
}

function resetAcc(ind)
{
    txtAC_PK.SetDataText("");
    txtAC_CD.SetDataText("");
}
//-----------------------------onPrint
function OnReport()
{
	if(lstReportType.value=='RPT')
	{
	 var url = '/standard/reports/60/08/60080290.aspx?company_pk='+lstCompany.value+'&dtbFrom=' +dtbFrom.value+ '&dtbTo=' + dtbTo.value+'&status='+rdoSlipStatus.value+'&bookccy='+lstBookCcy.value;
            System.OpenTargetPage( System.RootURL+url , "newform" );
	}
	
	if(lstReportType.value=='CHB')
	{
	 var url = '/standard/reports/60/08/60080290_daily.aspx?company_pk='+lstCompany.value+'&dtbFrom=' +dtbFrom.value+ '&dtbTo=' + dtbTo.value+'&status='+rdoSlipStatus.value+'&bookccy='+lstBookCcy.value;
            System.OpenTargetPage( System.RootURL+url , "newform" );
	}
	if(lstReportType.value=='DCR')
	{
	 var url = '/standard/reports/60/08/60080290_DailyCashReport.aspx?Company_pk='+lstCompany.value+'&From=' +dtbFrom.value+ '&To='  + dtbTo.value+ '&Bank_pk=' + lstDepositAccount.value +'&Status='+rdoSlipStatus.value+'&Ccy='+lstCurrency.value;
            System.OpenTargetPage( System.RootURL+url , "newform" );
	}
	
}
</script>
<body>
<gw:data id="datDepositAccount" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
    <xml>
        <dso type="grid" function="AC_SEL_60080290_1">
            <input bind="grdDeposit">
                <input bind="lstCompany"/>
                <input bind="dtbFrom"/>
               <input bind="dtbTo"/>
                <input bind="lstDepositAccount"/> 
                <input bind="rdoSlipStatus"/>
                <input bind="lstCurrency"/>
            </input>
            <output bind="grdDeposit"/>
        </dso>
    </xml>
</gw:data> 
<!--
<gw:data id="datDepositAccountSum" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
    <xml>
        <dso type="grid" function="ACNT.SP_SEL_MONTH_BANK_DEP_BAL_SUM">
            <input bind="grdDepositSum">
                <input bind="lstCompany"/>
                <input bind="dtbFrom"/>
                
                <input bind="lstDepositAccount"/> 
                <input bind="rdoSlipStatus"/>
                <input bind="lstCurrency"/>
            </input>
            <output bind="grdDepositSum"/>
        </dso>
    </xml>
</gw:data> 	
-->
<gw:data id="datBankAccount" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
    <xml>
        <dso type="grid" function="ac_sel_60080290_2">
            <input bind="grdBankAccount">
                <input bind="lstCompany"/>
                <input bind="dtbFrom"/>
                <input bind="dtbTo"/>
                <input bind="lstBankName"/> 
                <input bind="rdoSlipStatus"/>
                <input bind="lstCurrency"/>
            </input>
            <output bind="grdBankAccount"/>
        </dso>
    </xml>
</gw:data> 
<!--
<gw:data id="datBankAccountSum" onreceive="OnDataReceive(this)" onerror="OnDataError(this)">
    <xml>
        <dso type="grid" function="ACNT.SP_SEL_MONTH_BANK_BAL_SUM">
            <input bind="grdDepositSum">
                <input bind="lstCompany"/>
                <input bind="dtbFrom"/>
                
                <input bind="lstBankName"/> 
                <input bind="rdoSlipStatus"/>
                <input bind="lstCurrency"/>
            </input>
            <output bind="grdDepositSum"/>
        </dso>
    </xml>
</gw:data> 	
-->
<gw:data id="datGetDepositAccount" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso id="1" type="grid" function="AC_SP_60080290_BANK_LIST" > 
            <input bind="grdDepositTmp">
                <input bind="lstCompany" />
            </input>
            <output bind="grdDepositTmp"/>
        </dso> 
    </xml> 
</gw:data> 
	
<table border="0" cellpadding="0" cellspacing="0" style="width:100%;height:100%">
    <tr style="width:100%;height:10%">
        <td>
                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td align="right" width="9%">Company</td>
                        <td  width="21%"><gw:list id="lstCompany" styles="width:100%;" onchange="onCompanyChange()" ></gw:list></td>
                        <td width="8%" align="right"><b>Search By </b></td>
                        <td width="23%">
                            <gw:list id="lstSearchBy" styles="width:100%;" onchange="" ></gw:list>
						</td>
						<!--
						<td width="9%" align="right"><b><a title="Click here to show Account" onclick="GetAccount()" href="#tips" >Account</a></b></td>
						<td width="18%">
		<table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="95%"><gw:textbox id="txtAC_PK" styles='display:none'></gw:textbox>
                                                <gw:textbox id="txtAC_CD" styles='width:100%;' csstype="mandatory"/>
                                <td><gw:imgBtn id="ibtnAccReset" img="reset"  alt="reset acc" onclick="resetAcc()" /></td>
                            </tr>
                        </table>
						</td>
						-->
						<td td width="11%" align="right"><gw:label id="lblCmdText" text="Deposit Account"></gw:label></td>
                        <td width="16%" >
                                <gw:list id="lstDepositAccount" styles="width:100%;" ></gw:list>
                                <gw:list id="lstBankName" styles="width:100%;" ></gw:list>
                        </td>
						 <td align="right" width="6%">Currency</td>
                        <td  width="6%"><gw:list id="lstCurrency" styles="width:100%;" ></gw:list></td>
                    </tr>
                    <tr>
			<td align="right">Proposed Date</td>
                        <td >
                                <table border="0" cellpadding="0" cellspacing="0"  width="100%">
                                <tr>
                                    <td width="45%" align="left"><gw:datebox id="dtbFrom" lang="<%=Application("Lang")%>" mode="01" onchange="" /></td>
                                 <!--   <td width="10%" align="center"><b>&nbsp;~&nbsp;</b></td>-->
                                    <td width="45%" align="right" style="display:none"><gw:datebox id="dtbTo" lang="<%=Application("Lang")%>" mode="01" onchange="" /></td>
                                </tr>
                                </table>
                        </td>
                        <td align="right">Slip Status</td>
                        <td align="left" >
                                <gw:radio id="rdoSlipStatus"  value="2" > 
                                    <span value="2" >Confirmed</span>
                                    <span value="0" >Approved</span>
                                </gw:radio >
                        </td>
                         <td align="right" >Report Type </td>
                        <td  colspan="2"><gw:list id="lstReportType" styles="width:100%;" ></gw:list></td>
                        <td align="right">
                            <table border="0" cellpadding="2" cellspacing="0">
                                <tr>
                                    <td><gw:imgBtn id="ibtnSearch" img="search"    alt="Search"    onclick="onSearch()" /></td>
                                    <td><gw:imgBtn id="ibtnReport" img="printer"   alt="Print Report" onclick="OnReport()" /></td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
          </td> 
       </tr>
     
      <tr style="width:100%;height:45%">
	  <td>
	                             <!--header='0._pk|1._null|2._bank id|3.Division|4.Unit|5.Before Yesterday Balance|6.Org.Income|7.Exchange|8.Receiving|9.Settelement Balance|10.Total|11.Org.Payment|12.Withdrawal|13.Remit|14.Total|15.Yesterday Balance'-->
                            <gw:grid id='grdDeposit'
                           header='|Division|Unit|Before Yesterday Balance|Org.Income|Exchange|Receiving|Settelement Balance|Total|Org.Payment|Withdrawal|Remit|Total|Yesterday Balance'
                            format='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                            aligns ='1|0|1|3|3|3|3|3|3|3|3|3|3|3'
                            defaults='|||||||||||||'
                            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                            widths='800|3000|800|2500|2000|2000|2000|2200|2000|2000|2000|2000|2000|2000'
                            sorting='T'
                            styles='width:100%; height:100%'
                            />
      </td>
      </tr> 
     <tr style="width:100%;height:45%">
                <td width="100%">
                
                                 <!--header='0._pk|1._null|2._bank id|3.Division|4.Unit|5.Before Yesterday Balance|6.Org.Income|7.Exchange|8.Receiving|9.Settelement Balance|10.Total|11.Org.Payment|12.Withdrawal|13.Remit|14.Total|15.Yesterday Balance'-->
                            <gw:grid id='grdBankAccount'
                           header='|Division|Unit|Before Yesterday Balance|Org.Income|Exchange|Receiving|Settelement Balance|Total|Org.Payment|Withdrawal|Remit|Total|Yesterday Balance'
                            format='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                            aligns ='1|0|1|3|3|3|3|3|3|3|3|3|3|3'
                            defaults='|||||||||||||'
                            editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                            widths='800|3000|800|2500|2000|2000|2000|2200|2000|2000|2000|2000|2000|2000'
                            sorting='T'
                            styles='width:100%; height:100%'
                            />
                </td>      
     </tr> 
	  
   
</table>  
 <gw:list id="lstBookCcy" styles="display:;" ></gw:list>
<gw:textbox id="txtOpenBookAmt" text="0"  styles='display:none;'/>
<gw:textbox id="txtOpenTransAmt" text="0"  styles='display:none;'/>

<gw:textbox id="txtBankPK" text="0"  styles='display:none;'/>
<gw:textbox id="txtBankCCy" text="0"  styles='display:none;'/>
<gw:grid id='grdDepositTmp'
header='CCY|BANK_ID'
format='0|0'
aligns='0|0'
defaults='|'
editcol='1|1'
widths='0|0'
sorting='T'
styles='width:0; height:0;display:none;'
/>
</body>
</html>
