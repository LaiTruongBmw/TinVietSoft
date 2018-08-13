<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Receipt/Payment Inquiry</title>
  </head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script>
var g_report_opt = '2';
var g_company_pk = "<%=Session("COMPANY_PK") %>";
function BodyInit()
{
    System.Translate(document);
    var ls_data        = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_date_fr     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(ADD_MONTHS(SYSDATE, -1)) + 1, 'YYYYMMDD') FROM DUAL")%>";
	var ls_date_to     = "<%=CtlLib.SetDataSQL("SELECT TO_CHAR(LAST_DAY(SYSDATE), 'YYYYMMDD') FROM DUAL")%>";
	/*
    var ls_data3       = "<%=CtlLib.SetListDataSQL("SELECT CODE, NVL(NUM_VALUE3,'0') FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK =b.pk and b.id ='ACBG0130' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 order by a.DEF_YN desc , code_nm")%>";
    */
    var ls_data3       = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, NVL(D.NUM_3,'0') FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.PK = D.TAC_COMMCODE_MASTER_PK AND M.ID = 'ACBG0130' AND M.DEL_IF = 0 AND D.DEL_IF = 0 ORDER BY CODE")%>"; 
    var ls_data8    = "<%=CtlLib.SetListDataSQL("SELECT B.CODE_LNM,B.CODE FROM tac_commcode_master a, tac_commcode_detail b WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'EACAB019' AND a.del_if = 0 AND b.del_if = 0 AND B.USE_YN ='Y' ORDER BY B.DEF_YN DESC,B.ORD")%>";
    var ls_data1 = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='COAB0070' and d.use_yn = 'Y' ORDER BY D.DEF_YN DESC, D.ORD")%>";
    var ls_data_status    = "<%=CtlLib.SetListDataSQL("SELECT B.CODE,B.CODE_NM FROM tac_commcode_master a, tac_commcode_detail b WHERE a.pk = b.tac_commcode_master_pk AND a.ID = 'ACBG0010'AND a.del_if = 0 AND b.del_if = 0 AND B.USE_YN ='Y' union select '' CODE,'ALL' CODE_NM from dual ORDER BY CODE")%>";
    g_report_opt    = "<%=CtlLib.SetDataSQL("select TRIM(CODE) code FROM TAC_COMMCODE_DETAIL A, TAC_COMMCODE_MASTER B WHERE A.DEL_IF=0 and b.del_if = 0 and a.TAC_COMMCODE_MASTER_PK = b.pk AND TRIM(b.ID) = 'EACBK019' and A.def_yn = 'Y' and A.use_yn = 'Y'")%>";
	var ls_data9 = "<%=CtlLib.SetListDataSQL("SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='GFQC0029' and d.use_yn = 'Y' ORDER BY D.CODE_NM")%>";
    lstReportLocation.SetDataText(ls_data8);
    lstVoucherTypePrint.SetDataText(ls_data3);
    rbstatus.SetDataText(ls_data_status); 
    lstLanguage.SetDataText(ls_data1);
    lstLanguage.value ="VIE"; 
    rbstatus.value ="2"; 
    lstCompany.SetDataText(ls_data);
    lstCompany.value = g_company_pk;
	lstReport.SetDataText(ls_data9);
    dtTrs_fr.SetDataText(ls_date_fr);
    dtTrs_to.SetDataText(ls_date_to);
    txtcust_nm.SetEnable(false);
    txtchk.SetDataText("0");
    txtvoucher_no.GetControl().focus();
    var tempGrid = grid.GetGridControl();
    tempGrid.FixedCols = 1;
	
	txtUser_Pk.text = "<%=Session("USER_PK")%>";
    dso_getCompany.Call();
	
    //grid.GetGridControl().FrozenCols = 3;
}

function Reset_Cust()
{
    txtcust_cd.SetDataText("");
    txtcust_nm.SetDataText("");
    txtcust_pk.SetDataText("");
}

function CheckNumeric()
{
   var key = window.event.keyCode;
   if ( key > 47 && key < 58 )
      return; // if so, do nothing
   else
      window.event.returnValue = null; // otherwise
}

function Upcase()
{
    var c = String.fromCharCode (event.keyCode);
	var x = c.toUpperCase().charCodeAt(0);
	event.keyCode = x;
}

function OnChkAll()
{
    if (grid.rows > 1)
    {
        if (txtchk.GetData() == 0)
        {
            document.getElementById("btnChk").innerHTML="<gw:button id='btnChk'    img='UnChk All'  onclick='OnChkAll()'/>";
			//btnChk.text="UnChk All";
            txtchk.SetDataText("1");
            for (i = 1; i< grid.rows; i++)
            {
                grid.SetGridText(i, 1, -1);
            }
        }
        else
        {
            document.getElementById("btnChk").innerHTML="<gw:button id='btnChk'    img='Chk All' onclick='OnChkAll()'/>";
			//btnChk.text="Chk All";
            txtchk.SetDataText("0");
            for (i = 1; i< grid.rows; i++)
            {
                grid.SetGridText(i, 1, 0);
            }
        }
    }
}

function OnCheck()
{
    var std_dt, etd_dt ;
	std_dt = dtTrs_fr.GetData();
	etd_dt = dtTrs_to.GetData();
	if (parseInt(etd_dt) < parseInt(std_dt))
	{
		alert('    End date can’t be earlier than start date!!!'+'\n'+'Ngày kết thúc không thể nhỏ hơn ngày bắt đầu!!!');
		return false;
	}
	return true;
}

function OnSearch()
{
    if (OnCheck())
    {
          lstVoucherTypePrint.value = lstVoucherType.value;
          txtStatusPrint.text =  rbstatus.value;
          grid.ClearData();
          //btnChk.text="Chk All";
		  document.getElementById("btnChk").innerHTML="<gw:button id='btnChk'    img='Chk All'  onclick='OnChkAll()'/>";
          txtchk.SetDataText("0"); 
          dso_sel_grd_dtl_rp_voucher_inq.Call("SELECT");
    }
}

function SetTotal()
{
    btnChk.text="Chk All";
    txtchk.SetDataText("0");
}

function OnChangeList()
{
    grid.ClearData();
	dso_getDepositNo.Call();
}

function OnPopupSlipEntry()
{
    var ctrl 	= grid.GetGridControl();
	var rows    = ctrl.Rows
	rows = rows - 1;
	var rownum  	= ctrl.Row;
	var colnum  	= ctrl.Col;
	if (rownum > 0)		 
	{
		if (event.col > 1)
		{
			var pk      = grid.GetGridData(ctrl.row, 2);
			var ls_arr = "";
//			for (i = 1; i < grid.rows; i++)
//			{
//			    ls_arr = ls_arr + ' ' + grid.GetGridData(i, 2);
//			}
			var fpath   = System.RootURL + '/standard/forms/60/06/60060020_popup.aspx?PK_ROW=' + pk + '&ROW=' + ctrl.row + '&ROWS=' + rows + "&ARRAY_PK=" + ls_arr;
			var wWidth  = 950;
			var wHeight = 510;
			var x = Math.round((screen.availWidth - wWidth)/2);
			var y = Math.round((screen.availHeight - wHeight)/2);
			
			var features = "toolbar=no,location=no,directories=no,status=no,menubar=no," + 
			   "scrollbars=no,resizable=no,copyhistory=no,width="+wWidth+",height="+wHeight +
			   "lef="+ x +",top=" + y;
			this.name = "gfbr00050";
			var object = System.OpenModal(fpath, wWidth, wHeight, features, window);
	    }
    }
}

function GetRowPK(row_index){
    if((row_index < grid.rows) && (row_index > 0)){
        return grid.GetGridData(row_index, 2);
    }
    return -1;
}

function Popup_Cust()
{
    var fpath   = System.RootURL + '/standard/forms/60/05/60050010_popup_4.aspx?com_pk='+lstCompany.value;
    var object  = System.OpenModal(fpath , 800 , 500 , 'resizable:yes;status:yes'); 
    if ( object != null )
    {
        if (object[1] != 0)
        {
            txtcust_pk.text    = object[0];
            txtcust_nm.text    = object[2];
            txtcust_cd.text    = object[1];
        }
    }
}

function OnPrint(obj)
{
	switch(lstReport.value)
	{
		case '01':	
			if(dtTrs_fr.value == dtTrs_to.value)
			{
				var rqt = "?company_pk="+lstCompany.value+"&seq="+txtSeq.text+"&voucher_type="+lstVoucherType.GetData()+ "&cust_cd="+txtcust_cd.text+"&status="+rbstatus.value+"&voucher_no=" + txtvoucher_no.text +"&Trs_fr="+ dtTrs_fr.GetData()+ "&Trs_to="+dtTrs_to.GetData()+"&RPPerson="+ txtRPPerson.text + "&Desc1="+ txtDescription.text+ "&Desc2="+txtLDescription.text+'&DepositNo='+lstDepositNo.value;    
			  
				var url =System.RootURL + '/standard/reports/60/05/60050050_Payment_List_For_Bank_Transfering.aspx'+rqt;   
				System.OpenTargetPage( url , 'newform' );
			}
			else
			{
				alert('Please select only one day!!');
			}
		break;
		case '02':
			if((txtStatusPrint.text!="0") && (txtStatusPrint.text!="2"))
		   {
				alert("Please select status CONFIRMED or APRROVED!");
				return;
		   } 
			var arr_pk ="";
			var rqt = "";
			var tmp ="";
			var bl = 0;
			var url ="";
			if (lstVoucherType.value=="ALL")
			{
				alert("Please specify voucher type");
				return;
			}
			for (i = 1; i < grid.rows; i++)
			{
				if((grid.GetGridData(i,1)=="-1") &&(grid.GetGridData(i, 2)!=""))
				{
					arr_pk = arr_pk + tmp + grid.GetGridData(i, 2);
					tmp = ',';
					bl = 1;
				}
			}
			if (bl==0)
			{
				alert("Please check voucher to print");
				return;
				
			}
			rqt = "?company_pk="+lstCompany.value+'&seq_list='+arr_pk+'&voucher_type='+lstVoucherTypePrint.value;
			if (lstVoucherTypePrint.GetText()=="1")//Receipt Voucher- Phieu Thu
			{
				//var url =System.RootURL + '/standard/reports/gf/br/gfbr00030_ReceiptVoucher_List.aspx'+rqt;
				if(lstVoucherType.value == 'BC' )		
					url =System.RootURL + '/standard/reports/60/05/60050050_ReceiptVoucher_List_General_Bank.aspx'+rqt;
				else
					url =System.RootURL + '/standard/reports/60/05/60050050_ReceiptVoucher_List_General.aspx'+rqt;
				System.OpenTargetPage( url , 'newform' );
			}
			if (lstVoucherTypePrint.GetText()=="2")//Phieu Chi
			{
				//var url =System.RootURL + '/standard/reports/gf/br/gfbr00030_PaymentVoucher_List.aspx'+rqt;
				switch (lstReportLocation.value)
				{
					case "EACAB005"://ACCOUNTING
						if(g_report_opt == '2' ) //A5
						{
							if(lstVoucherType.value == 'BN' )						
								url =System.RootURL + '/standard/reports/60/05/60050050_PaymentVoucher_List_General_Bank.aspx'+rqt;
							else
								url =System.RootURL + '/standard/reports/60/05/60050050_PaymentVoucher_List_General.aspx'+rqt;
						}	
						else if(g_report_opt == '1') //A4
						{
							if(lstVoucherType.value == 'BN' )
								url =System.RootURL + '/standard/reports/60/05/60050050_PaymentVoucher_List_General_A4_Bank.aspx'+rqt;
							else
								url =System.RootURL + '/standard/reports/60/05/60050050_PaymentVoucher_List_General_A4.aspx'+rqt;													
						}	
						break;
					case "EACAB017"://OTHER
						url =System.RootURL + '/standard/reports/60/05/60050050_PaymentVoucher_List_Other.aspx'+rqt; 
						break;
					case "EACAB016"://FACOTRY
						url =System.RootURL + '/standard/reports/60/05/60050050_PaymentVoucher_List_Fact.aspx'+rqt; 
						break;  
					  case "20":
		//		        if(lstVoucherType.value == 'PV' )
		//		        {
							  url =System.RootURL + '/standard/reports/60/05/60050030_Payment_Order.aspx?seq='+ arr_pk ;		
		//		        }
		//		        else
		//		        {
		//		            alert("Please select Voucher type is Pay(Bank)!!");
		//		        }
				 break;   
					
				}
				System.OpenTargetPage( url , 'newform' );
			}
		break;
		case '03':
			if(txtStatusPrint.text==" ")
			{
				alert("Please select specify status ");
				return;
			} 
			if (lstVoucherType.value=="ALL")
			{
				alert("Please specify voucher type");
				return;
			}

			var rqt = "?company_pk="+lstCompany.value+"&seq="+txtSeq.text+"&voucher_type="+lstVoucherType.GetData()+ "&cust_cd="+txtcust_cd.text+"&status="+rbstatus.value+"&voucher_no=" + txtvoucher_no.text +"&Trs_fr="+ dtTrs_fr.GetData()+ "&Trs_to="+dtTrs_to.GetData()+"&RPPerson="+ txtRPPerson.text + "&Desc1="+ txtDescription.text+ "&Desc2="+txtLDescription.text;    
			if (lstLanguage.value=="VIE")
			{
				var url =System.RootURL + '/standard/reports/60/05/60050050_ReceiptPaymentInq_VIE.aspx'+rqt;   
			}     
			else
			{
				var url =System.RootURL + '/standard/reports/60/05/60050050_ReceiptPaymentInq.aspx'+rqt;  
				
			}
			System.OpenTargetPage( url , 'newform' );
		break;
		case '04':	
			if(dtTrs_fr.value == dtTrs_to.value)
			{
				var rqt = "?company_pk="+lstCompany.value+"&seq="+txtSeq.text+"&voucher_type="+lstVoucherType.GetData()+ "&cust_cd="+txtcust_cd.text+"&status="+rbstatus.value+"&voucher_no=" + txtvoucher_no.text +"&Trs_fr="+ dtTrs_fr.GetData()+ "&Trs_to="+dtTrs_to.GetData()+"&RPPerson="+ txtRPPerson.text + "&Desc1="+ txtDescription.text+ "&Desc2="+txtLDescription.text+'&DepositNo='+lstDepositNo.value;    
			  
				var url =System.RootURL + '/standard/reports/60/05/rpt_60050050_Payment_List_For_Bank_Transfering_2.aspx'+rqt;   
				System.OpenTargetPage( url , 'newform' );
			}
			else
			{
				alert('Please select only one day!!');
			}
		break;
		case '05':	
			if(dtTrs_fr.value == dtTrs_to.value)
			{
				var rqt = "?company_pk="+lstCompany.value+"&seq="+txtSeq.text+"&voucher_type="+lstVoucherType.GetData()+ "&cust_cd="+txtcust_cd.text+"&status="+rbstatus.value+"&voucher_no=" + txtvoucher_no.text +"&Trs_fr="+ dtTrs_fr.GetData()+ "&Trs_to="+dtTrs_to.GetData()+"&RPPerson="+ txtRPPerson.text + "&Desc1="+ txtDescription.text+ "&Desc2="+txtLDescription.text+'&DepositNo='+lstDepositNo.value;    
			  
				var url =System.RootURL + '/standard/reports/60/05/rpt_60050050_Payment_List_For_Bank_Transfering_3.aspx'+rqt;   
				System.OpenTargetPage( url , 'newform' );
			}
			else
			{
				alert('Please select only one day!!');
			}
		break;
	}
}


</script>
<body style="margin:0; padding:0;">

   <gw:data id="dso_sel_grd_dtl_rp_voucher_inq" onreceive="">
        <xml>
            <dso type="grid" function="ac_SEL_60050050_GRD_DTL_RP_vc">
                <input bind="grid">
                    <input bind="lstCompany"/>
                    <input bind="dtTrs_fr"/>
                    <input bind="dtTrs_to"/>
                    <input bind="txtcust_cd"/>
                    <input bind="rbstatus"/>
                    <input bind="txtvoucher_no"/>
                    <input bind="lstVoucherType"/>
                    <input bind="txtSeq"/>
                    <input bind="txtRPPerson"/>
                    <input bind="txtDescription"/>
                    <input bind="txtLDescription"/>
                    <input bind="lstDepositNo"/>
                </input>
                <output bind="grid"/>
            </dso>
        </xml>
    </gw:data>
    
<gw:data id="dso_getDepositNo" onreceive=""> 
        <xml> 
            <dso type="list" procedure="ac_SEL_60050050_BANK_LIST" > 
                <input> 
                     <input bind="lstCompany"/>
                </input>
                <output>
                     <output bind="lstDepositNo"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
	
	<gw:data id="dso_getCompany" onreceive="dso_getDepositNo.Call();"> 
        <xml> 
            <dso type="list" procedure="sp_sel_gfac00100_1" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<table style='height:100%' width="100%" cellpadding="0" cellspacing="0" border="0">
<tr style='height:8%'>
    <td width="100%">
	    <table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
            <td width="100%">
	            <table width="100%" cellpadding="0" cellspacing="0" border="0">
		       
                <tr>
                    <td align="right" width='10%'>Company</td>
                    <td colspan="3" width='15%'><gw:list id="lstCompany" onChange="OnChangeList()" value ="" styles='width:100%'></gw:list></td>
                    <td align="right" width='12%'>Voucher Type</td>
                    <td width='15%'><gw:list id="lstVoucherType" onChange="OnChangeList()" value ="ALL" styles='width:100%'>
                        <data><%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACBG0130') FROM DUAL")%>|ALL|Select ALL</data>
                    </gw:list></td>
                    <td align="right" width='8%'>Seq</td>
                    <td width='10%'><gw:textbox id="txtSeq" styles='width:100%' onenterkey="OnSearch()"/></td>
                    <td align="right" width='7%'>Partner</td>
                    <td  width='23%' colspan=''>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td width="35%"><gw:textbox id="txtcust_cd" styles="width:100%" onenterkey="OnSearch()" onkeypress="Upcase()"/></td>
                            <td width="65%"><gw:textbox id="txtcust_nm" styles="width:100%"/></td>
                            <td width="0%"><gw:textbox  id="txtcust_pk" styles='display:none'/></td>
                            
                        </tr>
                        </table>
                    </td>
					
                    <td width=""><gw:imgBtn   img="popup"	id="idSearchTr" alt="Popup" onclick="Popup_Cust()"/></td> 
					<td width=""><gw:imgBtn   img="reset"	id="idResetTr"  alt="Reset" onclick="Reset_Cust()"/></td>
                </tr>
                <tr>
                    <td align="right">Trans Date</td>
                    <td><gw:datebox id="dtTrs_fr" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="center">~</td>
                    <td><gw:datebox id="dtTrs_to" 	onchange="" styles='width:100%' lang="1"/></td>
                    <td align="right">Voucher No</td>
                    <td ><gw:textbox id="txtvoucher_no" styles="width:100%" onkeypress="Upcase()" onenterkey="OnSearch()"/></td>
                    <td align="right">Status</td>
					<td align="" width="" ><gw:list id="rbstatus" onChange="OnSearch()" value ="2" styles='width:100%'></gw:list></td>
					<td width="" colspan='2'><gw:list id="lstReportLocation" styles='width:100%'></gw:list></td>
					
					<td width="" colspan='2'><gw:button id="btnChk"    img="Chk All" text="Chk All" styles='width:100%;' onclick="OnChkAll()"/></td>
                </tr>
                <tr>
                    <td align="right">R/P Person</td>
                    <td colspan="3"><gw:textbox id="txtRPPerson" styles='width:100%' onenterkey="OnSearch()" /></td>
                    <td align="right">Description</td>
                    <td ><gw:textbox id="txtDescription" styles='width:100%' onenterkey="OnSearch()" /></td>
                    <td align="right">Description (LC)</td>
                    <td colspan="3"><gw:textbox id="txtLDescription" styles='width:100%' onenterkey="OnSearch()" /></td>
                    <td width="" align="" colspan='2'> <gw:button id="btnSearch" img="search" alt="Search" onclick="OnSearch()" /></td>
                </tr>
                <tr>
                    <td align="right">Language</td>
                    <td colspan="3"><gw:list id="lstLanguage" styles="width:100%" ></gw:list></td>
					<td align="right">Deposit No</td>
                    <td colspan=""><gw:list id="lstDepositNo" styles='width:100%' onchange="OnSearch()" /></td>
					<td align="right">Reposts</td>
					<td width="" colspan='3'><gw:list id="lstReport" styles='width:100%'></gw:list></td>
                    
					<td width="" colspan='2'><gw:button id="btnPrint1"  img="excel" alt="PAYMENT LIST FOR BANK TRANSFERING"   styles='width:100%' onclick="OnPrint()"/></td>
					
                </tr>
                </table>
            </td>
        </tr>
        </table>
    </td>
</tr>
<tr style='height:92%'>
    <td width="100%">
	    <gw:grid   
		    id="grid"
		    header="Row|Chk|Seq|Voucher No|Trans Date|Partner Code|Partner Name|Total Amount|Description|Description (LC)|_pk"
		    format  ="0|3|0|0|4|0|0|0|0|0|0"  
		    aligns  ="1|1|1|1|1|1|1|3|0|0|0" 
		    defaults="|||||||||||"  
		    editcol ="0|1|0|0|0|0|0|0|0|0|0"  
		    acceptNullDate="T"
		    widths="500|400|800|1600|1500|1500|3000|2000|2000|1500|0"  
		    styles="width:100%; height:100%"
		    sorting="T"   
		    oncelldblclick="OnPopupSlipEntry()"
		    />
    </td>
</tr>
</table>
<gw:list id="lstVoucherTypePrint" styles="display:none"></gw:list>
<gw:textbox id="txtchk"                 style="display:none" />
<gw:textbox id="txtStatus"              style="display:none" />
<gw:textbox id="txtStatusPrint"              style="display:none" />
<gw:textbox id="txtseq_str"             style="display:none" />
<gw:textbox id="txtindex"               style="display:none" />
<gw:textbox id="txtUser_Pk"  styles='display:none' />
<gw:textbox id="txtSesion_company"  styles='display:none' />
</body>
</html>
