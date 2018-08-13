<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Booking Accountant</title>
   <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
  </head>
 <script>
	
 //---------------------------------------------------------
 function BodyInit()
 { 
    System.Translate(document);
	idAC_CD2.SetEnable(false);
	idAC_CD3.SetEnable(false);
	idAC_CD4.SetEnable(false);
	idAC_CD5.SetEnable(false);
	idAC_CD6.SetEnable(false);
	idAC_CD7.SetEnable(false);
	idAC_CD8.SetEnable(false);
	idAC_CD9.SetEnable(false);
	idAC_CD10.SetEnable(false);
	idAC_CD11.SetEnable(false);
	idAC_CD12.SetEnable(false);
	idAC_CD13.SetEnable(false);
	idAC_CD14.SetEnable(false);
    BindingDataList();
    txtUser_Pk.text = "<%=Session("USER_PK")%>";
   dso_getCompany.Call();

 }
 //---------------------------------------------------------
 
 function BindingDataList()
 {   
        var ls_data = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
        var ls_data2 = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
       var ls_data3 = "<%=CtlLib.SetListDataSQL(" SELECT 'ALL' C1,'<All>' C2  FROM DUAL union SELECT C1,C2 FROM ( SELECT TRIM(A.CODE) C1, A.CODE C2 FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.DEL_IF = 0 AND B.DEL_IF = 0 AND A.TCO_ABCODEGRP_PK = B.PK AND B.ID = 'ACAB0110' AND A.USE_IF = 1 ORDER BY NUM_VALUE1)")%>";
        var ls_Circulars = "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM  FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='AC150001' ORDER BY D.DEF_YN DESC")%>";
		lstCompany.SetDataText(ls_data);
        lstCompany.value = "<%=session("company_pk") %>";
        lstBookCcy.SetDataText(ls_data2); 
        lstCurrency11.SetDataText(ls_data3); 
        lstCurrency11.value = lstBookCcy.value;
        lstCurrency13.SetDataText(ls_data3); 
        lstCurrency14.SetDataText(ls_data3);         
        lstCirculars.SetDataText(ls_Circulars);
		var data_trans ="data|BOOK|Book|TRANS|Transaction"
        lstTransaction.SetDataText(data_trans);
 }

//--------------------------------------------------------------------
 function PrintReport()
{
	len = document.form1.rdReport.length;    
    opt = document.form1.rdReport; 
   
	for(i = 0; i< len; i++)	
    {
		if (opt[i].checked)		
        {
            
			switch ((opt[i].value))			
            {		    	
                case '1'://Sổ nhật ký chung(Mẫu số S03a-DN)(2)
							var url = '/standard/reports/gf/ka/gfka00160_SoNKC_S03a-DN.aspx?Company='+lstCompany.value+'&DateFrom=' +From1.value+ '&DateTo=' + To1.value+'&BookCcy='+lstBookCcy.value+'&status='+rbstatus.value + '&circulars='+lstCirculars.value;
							System.OpenTargetPage( System.RootURL+url , "newform" );
                    break;
				case '2'://Sổ nhật ký thu tiền
					if(idAC_PK2.text=="")
					{
						alert("Please select an account code!");
						return;
					}
						var url = '/standard/reports/gf/ka/gfka00160_SoNKthutien_S03a1-DN.aspx?company_pk='+lstCompany.value+'&account_pk='+idAC_PK2.text+'&dtbFrom=' +From2.value+ '&dtbTo=' + To2.value+'&ccy=ALL&status='+rbstatus.value+'&bookccy='+lstBookCcy.value+ '&circulars='+lstCirculars.value;
						System.OpenTargetPage( System.RootURL+url , "newform" );
					break;
				case '3'://Sổ nhật ký chi tiền
					if(idAC_PK3.text=="")
					{
						alert("Please select an account code!");
						return;
					}
						var url = 
'/standard/reports/gf/ka/gfka00160_SoNKchitien_S03a2-DN.aspx?company_pk='+lstCompany.value+'&account_pk='+idAC_PK3.text+'&dtbFrom=' +From3.value+ '&dtbTo=' + To3.value+'&ccy=ALL&status='+rbstatus.value+'&bookccy='+lstBookCcy.value+ '&circulars='+lstCirculars.value;
						System.OpenTargetPage( System.RootURL+url , "newform" );
					break;
				case '4'://Sổ nhật ký mua hàng
					alert("Not Finish");
					break;
				case '5'://Sổ nhật ký bán hàng
					alert("Not Finish");
					break;
				case '6'://Sổ cái (hình thức Nhật ký chung)
					if(idAC_PK6.text=="")
					{
						alert("Please select an account code!");
						return;
					}
						var url = 
'/standard/reports/gf/ka/gfka00160_Socai-S03b-DN.aspx?company_pk='+lstCompany.value+'&account_pk='+idAC_PK6.text+'&dtbFrom=' +From6.value+ '&dtbTo=' + To6.value+'&ccy=ALL&status='+rbstatus.value+'&bookccy='+lstBookCcy.value+ '&circulars='+lstCirculars.value;
						System.OpenTargetPage( System.RootURL+url , "newform" );
					break;
				case '7'://Sổ quỹ tiền mặt
					if(idAC_PK7.text=="")
					{
						alert("Please select an account code!");
						return;
					}
						var url = 
'/standard/reports/gf/ka/gfka00160_SoquyTM-S07-DN.aspx?company_pk='+lstCompany.value+'&account_pk='+idAC_PK7.text+'&dtbFrom=' +From7.value+ '&dtbTo=' + To7.value+'&ccy=ALL&status='+rbstatus.value+'&bookccy='+lstBookCcy.value+ '&circulars='+lstCirculars.value;
						System.OpenTargetPage( System.RootURL+url , "newform" );
					break;
				case '8'://Sổ kế toán chi tiết quỹ tiền mặt
					if(idAC_PK8.text=="")
					{
						alert("Please select an account code!");
						return;
					}
						var url = 
'/standard/reports/gf/ka/gfka00160_SoKToanCTquyTM-S07a-DN.aspx?company_pk='+lstCompany.value+'&account_pk='+idAC_PK8.text+'&dtbFrom=' +From8.value+ '&dtbTo=' + To8.value+'&ccy=ALL&status='+rbstatus.value+'&bookccy='+lstBookCcy.value+ '&circulars='+lstCirculars.value;
						System.OpenTargetPage( System.RootURL+url , "newform" );
					break;
				case '9'://Sổ tiền gởi ngân hàng
					if(lstDepositAcct.value=="")
					{
						alert("No Deposit Account Available!");
						return;
					}
					if (idAC_PK9.text=="")
					{
					    alert("Please select an account code!");
						return;
					}
					var strTmp = ""+lstDepositAcct.value;
					var bankpk = strTmp.substring(0,strTmp.indexOf(","));
					var ccy = strTmp.substring(strTmp.indexOf(",")+1);
					if(lstBookCcy.value==ccy)
					{
						var url = 
'/standard/reports/gf/ka/gfka00160_SotienguiNH_S08DN2.aspx?company_pk='+lstCompany.value+'&bank_pk='+bankpk+'&dtbFrom=' +From9.value+ '&dtbTo=' + To9.value+'&ccy=ALL&status='+rbstatus.value+'&bookccy='+lstBookCcy.value+'&account_pk='+idAC_PK9.text+ '&circulars='+lstCirculars.value;
						System.OpenTargetPage( System.RootURL+url , "newform" );
					}
					else
					{
						var url = 
'/standard/reports/gf/ka/gfka00160_SotienguiNH_S08DN.aspx?company_pk='+lstCompany.value+'&bank_pk='+bankpk+'&dtbFrom=' +From9.value+ '&dtbTo=' + To9.value+'&ccy=ALL&status='+rbstatus.value+'&bookccy='+lstBookCcy.value+'&account_pk='+idAC_PK9.text+ '&circulars='+lstCirculars.value;
						System.OpenTargetPage( System.RootURL+url , "newform" );
					}
					break;
					
					case '10'://Sổ tiền vay
					if(lstDepositAcct2.value=="")
					{
						alert("No Loan Account Available!");
						return;
					}
					var strTmp = ""+lstDepositAcct2.value;
					var bankpk = strTmp.substring(0,strTmp.indexOf(","));
					var ccy = strTmp.substring(strTmp.indexOf(",")+1);
					alert("Not finished!");
					break;
					
					case '11'://Sổ chi tiết tài khoản
					if(idAC_PK11.text=="")
					{
						url = '/standard/reports/gf/ka/gfka00160_SoChitietTK_S38_DN_acc_all.aspx?company_pk='+lstCompany.value+'&account_code='+idAC_CD11.text+'&dtbFrom=' +From11.value+ '&dtbTo=' + To11.value+'&ccy='+lstCurrency11.value+'&status='+rbstatus.value+'&bookccy='+lstBookCcy.value+'&transaction='+lstTransaction.value+ '&circulars='+lstCirculars.value;			
					}
					else
					{
					    var url ="";
					    if (lstCurrency11.value==lstBookCcy.value)
					    {
						        url = '/standard/reports/gf/ka/gfka00160_SoChitietTK_S38-DN.aspx?company_pk='+lstCompany.value+'&account_pk='+idAC_PK11.text+'&dtbFrom=' +From11.value+ '&dtbTo=' + To11.value+'&ccy=ALL&status='+rbstatus.value+'&bookccy='+lstBookCcy.value+ '&circulars='+lstCirculars.value;
						}
						else
						{
						        url = '/standard/reports/gf/ka/gfka00160_SoChitietTK_S38-DN2.aspx?company_pk='+lstCompany.value+'&account_pk='+idAC_PK11.text+'&dtbFrom=' +From11.value+ '&dtbTo=' + To11.value+'&ccy=ALL&status='+rbstatus.value+'&bookccy='+lstBookCcy.value+'&transccy='+lstCurrency11.value+ '&circulars='+lstCirculars.value;
						}   
					}
						System.OpenTargetPage( System.RootURL+url , "newform" );
					break;
					case '12': // T Sổ cái
					    var rqt = "";
					     rqt = "?company_pk="+lstCompany.value+'&account_pk='+idAC_PK12.text+'&dtbFrom='+From12.value+'&dtbTo='+To12.value+'&ccy=ALL'+ '&status='+rbstatus.value+'&bookccy='+lstBookCcy.value+'&rptOption=A'+ '&circulars='+lstCirculars.value;
               
					     var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SOCAI.aspx'+rqt;
                          System.OpenTargetPage( url , 'newform' );
                    return; 
					break;
					case '13': // T Sổ quỹ tiền mặt
					     var rqt = "";
					     rqt = "?company_pk="+lstCompany.value+'&account_pk='+idAC_PK13.text+'&dtbFrom='+From13.value+'&dtbTo='+To13.value+'&ccy=' + lstCurrency13.GetData()+ '&status='+rbstatus.value+'&bookccy='+lstBookCcy.value+'&rptOption=A'+ '&circulars='+lstCirculars.value;
					       var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_T_SCTQT.aspx'+rqt;
                             System.OpenTargetPage( url , 'newform' );
                    return; 
					break;
					case '14': // Sổ tiền gửi ngân hàng
					     var rqt = "";
					     rqt = "?company_pk="+lstCompany.value+'&account_pk='+idAC_PK14.text+'&dtbFrom='+From14.value+'&dtbTo='+To14.value+'&ccy='+ lstCurrency14.GetData()+ '&status='+rbstatus.value+'&bookccy='+lstBookCcy.value+'&rptOption=DRCR'+ '&circulars='+lstCirculars.value;
               
					     var url =System.RootURL + '/standard/reports/gf/ka/gfka00020_NH_S07-DN.aspx'+rqt; //?company_pk=" + lstCompany.value +  "&bank_pk=0" + "&dtbFrom=" + dtbFrom.value + "&dtbTo=" + dtbTo.value + "&ccy=" + lstCurrency.value + "&status=" + rdoSlipStatus.value + "&bookccy=" + lstBookCcy.value + "&account_pk=" + txtAccPK.GetData();
                        System.OpenTargetPage( url , 'newform' );
                         return;  
					break;
					case '15': // Báo cáo tiền theo tài khoản
					     var rqt = "";
					     rqt = "?company="+lstCompany.value+'&dtbFrom='+From15.value+'&dtbTo='+To15.value+'&status='+rbstatus.value+ '&circulars='+lstCirculars.value;             
					     var url =System.RootURL + '/standard/reports/gf/ka/gfka00160_DailyCash.aspx'+rqt; 
                        System.OpenTargetPage( url , 'newform' );
                         return;  
					break;
					
			}
		}
	}
	
	
} 
function onCompanyChange()
{
	//Reset Account Code
	idAC_PK2.text ="";
	idAC_CD2.text ="";
	idAC_PK3.text ="";
	idAC_CD3.text ="";
	idAC_PK4.text ="";
	idAC_CD4.text ="";
	idAC_PK5.text ="";
	idAC_CD5.text ="";
	idAC_PK6.text ="";
	idAC_CD6.text ="";
	idAC_PK7.text ="";
	idAC_CD7.text ="";
	idAC_PK8.text ="";
	idAC_CD8.text ="";
	idAC_PK9.text ="";
	idAC_CD9.text ="";
	idAC_PK10.text ="";
	idAC_CD10.text ="";
	idAC_PK11.text ="";
	idAC_CD11.text ="";
	idAC_PK12.text ="";
	idAC_CD12.text ="";
	
	idAC_PK13.text ="";
	idAC_CD13.text ="";
	
	idAC_PK14.text ="";
	idAC_CD14.text ="";
	
	
	grdDepositTmp.ClearData();
    datGetDepositAccount.Call('SELECT');
}

function OnDataReceive(objID)
{
	if(objID.id=="datGetDepositAccount")
	{
	     strDeposit = 'DATA';
	    for(i=1;i<grdDepositTmp.rows;i++)
	    {
	        strDeposit = strDeposit +'|' +grdDepositTmp.GetGridData(i,0)+'|'+ grdDepositTmp.GetGridData(i,1);
	    }
	    lstDepositAcct.SetDataText(strDeposit);
	    grdDepositTmp.ClearData();
		datGetDepositAccount2.Call('SELECT');
	}
	
	if(objID.id=="datGetDepositAccount2")
	{
	     strDeposit = 'DATA';
	    for(i=1;i<grdDepositTmp.rows;i++)
	    {
	        strDeposit = strDeposit +'|' +grdDepositTmp.GetGridData(i,0)+'|'+ grdDepositTmp.GetGridData(i,1);
	    }
	    lstDepositAcct2.SetDataText(strDeposit);
	}
    if(objID.id=="dso_getCompany")
	{
        onCompanyChange();
    }
}


function GetAccCode2()
{
	len = document.form1.rdReport.length;    
    opt = document.form1.rdReport; 
	tmp_value="";
	for(i = 0; i< len; i++)
    {
		if (opt[i].checked)
        {
			tmp_value = opt[i].value;
        }
	}
	
	var fpath = System.RootURL + "/standard/forms/60/08/60080050_popup_Acc.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCompany.value+'' + "&dsqlid=ac_sel_60080050_acct";
	var aValue = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
	if (aValue != null)
	{
		if(aValue[0] != 0)
		{
			switch (tmp_value)	
			{
			    
				case "2":
					idAC_PK2.text =aValue[3];
					idAC_CD2.text =aValue[0];
				break;
				case "3":
					idAC_PK3.text =aValue[3];
					idAC_CD3.text =aValue[0];
				break;
				case "4":
					idAC_PK4.text =aValue[3];
					idAC_CD4.text =aValue[0];
				break;
				case "5":
					idAC_PK5.text =aValue[3];
					idAC_CD5.text =aValue[0];
				break;
				case "6":
					idAC_PK6.text =aValue[3];
					idAC_CD6.text =aValue[0];
				break;
				case "7":
					idAC_PK7.text =aValue[3];
					idAC_CD7.text =aValue[0];
				break;
				case "8":
					idAC_PK8.text =aValue[3];
					idAC_CD8.text =aValue[0];
				break;
				case "9":
					idAC_PK9.text =aValue[3];
					idAC_CD9.text =aValue[0];
				break;
				case "10":
					idAC_PK10.text =aValue[3];
					idAC_CD10.text =aValue[0];
				break;
				case "11":
					idAC_PK11.text =aValue[3];
					idAC_CD11.text =aValue[0];
				break;
				
				case "12":
					idAC_PK12.text =aValue[3];
					idAC_CD12.text =aValue[0];
				break;
				
				case "13":
					idAC_PK13.text =aValue[3];
					idAC_CD13.text =aValue[0];
				break;
				
				case "14":
					idAC_PK14.text =aValue[3];
					idAC_CD14.text =aValue[0];
				break;
				case "15":
					idAC_PK15.text =aValue[3];
					idAC_CD15.text =aValue[0];
				break;
				
			}
		}
	}
}
function OnRadioClick()
{
	ResetLabelStyle();
	len = document.form1.rdReport.length;    
    opt = document.form1.rdReport; 
	for(i = 0; i< len; i++)	
    {        
        if (opt[i].checked)		
        {		    
            ResetLabelStyle();
            switch ((opt[i].value))			
            {		    	
                case '1':
                    lb1.style.fontWeight = 'bold';
                    lb1.style.color = 'red';
                    break;
                case '2':
                    lb2.style.fontWeight = 'bold';
                    lb2.style.color = 'red';
                    break;
                case '3':
		    	    lb3.style.fontWeight = 'bold';
		    	    lb3.style.color = 'red';
                    break;
                case '4':
                    lb4.style.fontWeight = 'bold';
                    lb4.style.color = 'red';
                    break;
		    	case '5':
                    lb5.style.fontWeight = 'bold';
                    lb5.style.color = 'red';
                    break;
                case '6':
                    lb6.style.fontWeight = 'bold';
                    lb6.style.color = 'red';
                    break;
                case '7':
		    	    lb7.style.fontWeight = 'bold';
		    	    lb7.style.color = 'red';
                    break;
                case '8':
                    lb8.style.fontWeight = 'bold';
                    lb8.style.color = 'red';
                    break;
                case '9':
                    lb9.style.fontWeight = 'bold';
                    lb9.style.color = 'red';
                    break;
				case '10':
                    lb10.style.fontWeight = 'bold';
                    lb10.style.color = 'red';
                    break;
                case '11':
                    lb11.style.fontWeight = 'bold';
                    lb11.style.color = 'red';
                    break;
                 case '12':
                    lb12.style.fontWeight = 'bold';
                    lb12.style.color = 'red';
                    break;  
                    
                 case '13':
                    lb13.style.fontWeight = 'bold';
                    lb13.style.color = 'red';
                    break;  
                    
                 case '14':
                    lb14.style.fontWeight = 'bold';
                    lb14.style.color = 'red';
                    break;        
                 case '15':
                    lb15.style.fontWeight = 'bold';
                    lb15.style.color = 'red';
                    break;        

            }		
        }   	
    }
	
}
function ResetLabelStyle()
{
	lb1.style.fontWeight    = '';
    lb1.style.color         = '';
    
    lb2.style.fontWeight    = '';
    lb2.style.color         = '';
    
    lb3.style.fontWeight    = '';
    lb3.style.color         = '';
    
    lb4.style.fontWeight    = '';
    lb4.style.color         = '';
    
    lb5.style.fontWeight    = '';
    lb5.style.color         = '';
    
    lb6.style.fontWeight    = '';
    lb6.style.color         = '';
    
    lb7.style.fontWeight    = '';
    lb7.style.color         = '';
    
    lb8.style.fontWeight    = '';
    lb8.style.color         = '';
    
    lb9.style.fontWeight    = '';
    lb9.style.color         = '';
	
	lb10.style.fontWeight    = '';
    lb10.style.color         = '';
   
   lb11.style.fontWeight    = '';
   lb11.style.color         = ''; 
   
   lb12.style.fontWeight    = '';
   lb12.style.color         = ''; 
   
   lb13.style.fontWeight    = '';
   lb13.style.color         = ''; 
   
   lb14.style.fontWeight    = '';
   lb14.style.color         = ''; 

   lb15.style.fontWeight    = '';
   lb15.style.color         = ''; 

}

</script>
<body >  
<form name="Reports" id="form1">
<gw:data id="datGetDepositAccount" onreceive="OnDataReceive(this)" > 
	<xml> 
		<dso id="1" type="grid"  function="ac_SEL_60080120_BOOKING_BANKD" > 
		<input bind="grdDepositTmp">
			<input bind="lstCompany" />
		</input>
		<output bind="grdDepositTmp"/>
		</dso> 
	</xml> 
</gw:data> 

<gw:data id="datGetDepositAccount2" onreceive="OnDataReceive(this)" > 
	<xml> 
		<dso id="1" type="grid"  function="ac_SEL_60080120_BOOKING_BANKL" > 
		<input bind="grdDepositTmp">
			<input bind="lstCompany" />
		</input>
		<output bind="grdDepositTmp"/>
		</dso> 
	</xml> 
</gw:data> 

<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_gfac00100_1" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lstCompany"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
    <table width ="100%" border = "0" cellpadding = "0" cellspacing = "0">
    <tr height="25"  bgcolor="#99CCFF">        
        <td class=Header>		    
        <table width="100%" border="0" cellpadding="2" cellspacing="2" >
            <tr>		        
                <td align="right" width="10%">Company</td>
               <td  width="20%"><gw:list id="lstCompany" styles="width:100%;"  onchange="onCompanyChange()"></gw:list></td> 
			   <td width="10%" align="right">Status</td>
			   <td width="" align="left" style='white-space:nowrap'>
			   <gw:radio id="rbstatus" value="2"> 
					<span value="2">Confirmed</span>
					<span value="0">Approved</span>
				</gw:radio>
			   
			   </td>
			   <td align="right" width="15%">Transaction</td> 
			   <td align="right" width="15%"><gw:list id="lstTransaction" styles="width:100%;"  onchange=""></gw:list></td> 
               <td align='right' width="10%" >Circulars</td>
				<td width="20%"><gw:list id="lstCirculars" onchange="" styles='width:100%' /></td>
                <td width=""><gw:imgBtn id="idBtnPrint" alt="Report" img="Printer" text="Print" onclick="PrintReport()" /></td>
            </tr>		    
        </table>
        </td>    
    </tr>
    </table>
            <div style=" width:100%; height:90%; overflow:auto;">
                    <table border="0" width="100%" cellpadding="0" cellspacing="0">
                          <tr>
                                <td width="25%" height="30"><input type="radio" id="rdReport" name="rdReport" value="1" onclick="OnRadioClick()"/><gw:label2 id="lb1">Sổ nhật ký chung(Mẫu số S03a-DN)(2)</gw:label2></td>            
                                <td align="center" width="5%">From: </td>            
                                <td align="center" width="10%" ><gw:datebox styles="width:70%" id="From1" name="From1" lang="1"  type="date"></gw:datebox></td>
                                <td align="center" width="2%">To: </td>
                                <td align="center" width="10%"><gw:datebox styles="width:70%" id="To1" name="To1" lang="1" type="date"></gw:datebox></td>
                                <td  width="9%"></td>
				                <td width="7%">
				                </td>
				                <td width="3%"></td>
                                <td align="center" width="10%"></td>
                                <td align="center" width="9%"></td>
                                <td width="10%"></td>
                        </tr>
                        
                        <tr>
                                <td height="30"><input type="radio" id="rdReport" name="rdReport" value="2" onclick="OnRadioClick()"><gw:label2 id="lb2">Sổ nhật ký thu tiền</gw:label2></td>            
                                <td align="center" >From: </td>            
                                <td align="center" ><gw:datebox styles="width:70%" id="From2" lang="1"  type="date"></gw:datebox></td>
                                <td align="center" >To: </td>
                                <td align="center" ><gw:datebox styles="width:70%" id="To2" lang="1" type="date"></gw:datebox></td>
                                <td align=right>Account</td>
				                <td width="7%">
				                            <gw:textbox id="idAC_PK2" text=""  styles="display:none"/>
				                            <gw:textbox id="idAC_CD2" csstype="mandatory"/>
				                </td>
				                <td ><gw:imgBtn id="ibtnGetAccount2" img="popup" styles="width:100%" onclick="GetAccCode2()"/></td>
                                <td align="center"></td>
                                <td align="center" ></td>
                                <td ></td>
                        </tr>
                        
                        <tr>
                                <td height="30"><input type="radio" id="rdReport" name="rdReport" value="3" onclick="OnRadioClick()"><gw:label2 id="lb3">Sổ nhật ký chi tiền</gw:label2></td>            
                                <td align="center" >From: </td>            
                                <td align="center" ><gw:datebox styles="width:70%" id="From3" lang="1"  type="date"></gw:datebox></td>
                                <td align="center" >To: </td>
                                <td align="center" ><gw:datebox styles="width:70%" id="To3" lang="1" type="date"></gw:datebox></td>
                                <td align=right>Account</td>
				                <td >
				                            <gw:textbox id="idAC_PK3" text=""  styles="display:none"/>
				                            <gw:textbox id="idAC_CD3" csstype="mandatory"/>
				                </td>
				                <td ><gw:imgBtn id="ibtnGetAccount3" img="popup" styles="width:20%" onclick="GetAccCode2()"/></td>
                                <td align="center" ></td>
                                <td align="center" ></td>
                                <td ></td>
                        </tr>
                        
                         <tr style="display:none">
                                <td  height="30"><input type="radio" id="rdReport" name="rdReport" value="4" onclick="OnRadioClick()"><gw:label2 id="lb4">Sổ nhật ký mua hàng</gw:label2></td>            
                                <td align="center" >From: </td>            
                                <td align="center" ><gw:datebox styles="width:70%" id="From4" lang="1"  type="date"></gw:datebox></td>
                                <td align="center" >To: </td>
                                <td align="center" ><gw:datebox styles="width:70%" id="To4" lang="1" type="date"></gw:datebox></td>
                                <td align=right>Account</td>
				                <td >
				                            <gw:textbox id="idAC_PK4" text=""  styles="display:none"/>
				                            <gw:textbox id="idAC_CD4" csstype="mandatory"/>
				                </td>
				                <td ><gw:imgBtn id="ibtnGetAccount4" img="popup" styles="width:20%" onclick="GetAccCode2()"/></td>
                                <td align="center" ></td>
                                <td align="center" ></td>
                                <td ></td>
                        </tr>
                        
                        <tr style="display:none">
                                <td  height="30"><input type="radio" id="rdReport" name="rdReport" value="5" onclick="OnRadioClick()"><gw:label2 id="lb5">Sổ nhật ký bán hàng</gw:label2></td>            
                                <td align="center" >From: </td>            
                                <td align="center" ><gw:datebox styles="width:70%" id="From5" lang="1"  type="date"></gw:datebox></td>
                                <td align="center" >To: </td>
                                <td align="center" ><gw:datebox styles="width:70%" id="To5" lang="1" type="date"></gw:datebox></td>
                                <td align=right>Account</td>
				                <td >
				                            <gw:textbox id="idAC_PK5" text=""  styles="display:none"/>
				                            <gw:textbox id="idAC_CD5" csstype="mandatory"/>
				                </td>
				                <td ><gw:imgBtn id="ibtnGetAccount5" img="popup" styles="width:20%" onclick="GetAccCode2()"/></td>
                                <td align="center" ></td>
                                <td align="center" ></td>
                                <td ></td>
                        </tr>
                        
                        <tr>
                                <td height="30"><input type="radio" id="rdReport" name="rdReport" value="6" onclick="OnRadioClick()"><gw:label2 id="lb6">Sổ cái (hình thức Nhật ký chung)</gw:label2></td>            
                                <td align="center" >From: </td>            
                                <td align="center" ><gw:datebox styles="width:70%" id="From6" lang="1"  type="date"></gw:datebox></td>
                                <td align="center" >To: </td>
                                <td align="center" ><gw:datebox styles="width:70%" id="To6" lang="1" type="date"></gw:datebox></td>
                                <td align=right>Account</td>
				                <td >
				                            <gw:textbox id="idAC_PK6" text=""  styles="display:none"/>
				                            <gw:textbox id="idAC_CD6" csstype="mandatory"/>
				                </td>
				                <td ><gw:imgBtn id="ibtnGetAccount6" img="popup" styles="width:20%" onclick="GetAccCode2()"/></td>
                                <td align="center" ></td>
                                <td align="center" ></td>
                                <td ></td>
                        </tr>
                        
                        <tr>
                                <td height="30"><input type="radio" id="rdReport" name="rdReport" value="7" onclick="OnRadioClick()"><gw:label2 id="lb7">Sổ quỹ tiền mặt</gw:label2></td>            
                                <td align="center" >From: </td>            
                                <td align="center" ><gw:datebox styles="width:70%" id="From7" lang="1"  type="date"></gw:datebox></td>
                                <td align="center" >To: </td>
                                <td align="center" ><gw:datebox styles="width:70%" id="To7" lang="1" type="date"></gw:datebox></td>
                                <td align=right>Account</td>
				                <td >
				                            <gw:textbox id="idAC_PK7" text=""  styles="display:none"/>
				                            <gw:textbox id="idAC_CD7" csstype="mandatory"/>
				                </td>
				                <td ><gw:imgBtn id="ibtnGetAccount7" img="popup" styles="width:20%" onclick="GetAccCode2()"/></td>
                                <td align="center" ></td>
                                <td align="center" ></td>
                                <td ></td>
                        </tr>
                        
                        <tr>
                                <td height="30"><input type="radio" id="rdReport" name="rdReport" value="8" onclick="OnRadioClick()"><gw:label2 id="lb8">Sổ kế toán chi tiết quỹ tiền mặt</gw:label2></td>            
                                <td align="center" >From: </td>            
                                <td align="center" ><gw:datebox styles="width:70%" id="From8" lang="1"  type="date"></gw:datebox></td>
                                <td align="center" >To: </td>
                                <td align="center" ><gw:datebox styles="width:70%" id="To8" lang="1" type="date"></gw:datebox></td>
                                <td align=right>Account</td>
				                <td >
				                            <gw:textbox id="idAC_PK8" text=""  styles="display:none"/>
				                            <gw:textbox id="idAC_CD8" csstype="mandatory"/>
				                </td>
				                <td ><gw:imgBtn id="ibtnGetAccount8" img="popup" styles="width:20%" onclick="GetAccCode2()"/></td>
                                <td align="center" ></td>
                                <td align="center" ></td>
                                <td ></td>
                        </tr>
                        
                        <tr>
                                <td  height="30"><input type="radio" id="rdReport" name="rdReport" value="9" onclick="OnRadioClick()"><gw:label2 id="lb9">Sổ tiền gửi ngân hàng</gw:label2></td>            
                                <td align="center" >From: </td>            
                                <td align="center" ><gw:datebox styles="width:70%" id="From9" lang="1"  type="date"></gw:datebox></td>
                                <td align="center" >To: </td>
                                <td align="center" ><gw:datebox styles="width:70%" id="To9" lang="1" type="date"></gw:datebox></td>
								<td align=right>Account</td>
				                <td >
				                            <gw:textbox id="idAC_PK9" text=""  styles="display:none"/>
				                            <gw:textbox id="idAC_CD9" csstype="mandatory"/>
				                </td>
				                <td ><gw:imgBtn id="ibtnGetAccount9" img="popup" styles="width:20%" onclick="GetAccCode2()"/></td>
                                <td  >&nbsp;Deposit Acct.</td>
				                <td colspan="2">
				                          <gw:list id="lstDepositAcct" styles="width:100%;" ></gw:list>
				                </td>
                        </tr>
						<!--
						 <tr>
                                <td  height="30"><input type="radio" id="rdReport" name="rdReport" value="10" onclick="OnRadioClick()"><gw:label2 id="lb10">Sổ chi tiết tiền vay</gw:label2></td>            
                                <td align="center" >From: </td>            
                                <td align="center" ><gw:datebox styles="width:70%" id="From10" lang="1"  type="date"></gw:datebox></td>
                                <td align="center" >To: </td>
                                <td align="center" ><gw:datebox styles="width:70%" id="To10" lang="1" type="date"></gw:datebox></td>
								<td >Account</td>
				                <td >
				                            <gw:textbox id="idAC_PK10" text=""  styles="display:none"/>
				                            <gw:textbox id="idAC_CD10" csstype="mandatory"/>
				                </td>
				                <td ><gw:imgBtn id="ibtnGetAccount10" img="popup" styles="width:20%" onclick="GetAccCode2()"/></td>
                                <td  >&nbsp;Deposit Acct.</td>
				                <td colspan="2">
				                          <gw:list id="lstDepositAcct2" styles="width:100%;" ></gw:list>
				                </td>
                        </tr>
                        -->
                        <tr>
                                <td  height="30"><input type="radio" id="rdReport" name="rdReport" value="11" onclick="OnRadioClick()"><gw:label2 id="lb11">Sổ chi tiết tài khoản</gw:label2></td>            
                                <td align="center" >From: </td>            
                                <td align="center" ><gw:datebox styles="width:70%" id="From11" lang="1"  type="date"></gw:datebox></td>
                                <td align="center" >To: </td>
                                <td align="center" ><gw:datebox styles="width:70%" id="To11" lang="1" type="date"></gw:datebox></td>
								<td align=right>Account</td>
				                <td >
				                            <gw:textbox id="idAC_PK11" text=""  styles="display:none"/>
				                            <gw:textbox id="idAC_CD11" styles="width:100%"  csstype="mandatory"/>
				                </td>
				                <td ><gw:imgBtn id="ibtnGetAccount11" img="popup" styles="width:20%" onclick="GetAccCode2()"/></td>
                                <td  >Currency</td>
				                <td colspan="2">
				                        <gw:list id="lstCurrency11" styles="width:100%;" ></gw:list>

				                </td>
                        </tr>
                        <tr>
                                <td  height="30"><input type="radio" id="rdReport" name="rdReport" value="12" onclick="OnRadioClick()"><gw:label2 id="lb12">T Sổ cái</gw:label2></td>            
                                <td align="center" >From: </td>            
                                <td align="center" ><gw:datebox styles="width:70%" id="From12" lang="1"  type="date"></gw:datebox></td>
                                <td align="center" >To: </td>
                                <td align="center" ><gw:datebox styles="width:70%" id="To12" lang="1" type="date"></gw:datebox></td>
								<td  align=right>Account</td>
				                <td  colspan="5">
				                            <gw:textbox id="idAC_PK12" text=""  styles="display:none"/>
				                            <gw:textbox id="idAC_CD12" styles="width:100%"  csstype="mandatory"/>
				                </td>
				                 <td ><gw:imgBtn id="ibtnGetAccount12" img="popup" styles="width:20%" onclick="GetAccCode2()"/></td>
                        </tr>
                        
                        
                        <tr>
                                <td  height="30"><input type="radio" id="rdReport" name="rdReport" value="13" onclick="OnRadioClick()"><gw:label2 id="lb13">T Sổ quỹ tiền mặt</gw:label2></td>            
                                <td align="center" >From: </td>            
                                <td align="center" ><gw:datebox styles="width:70%" id="From13" lang="1"  type="date"></gw:datebox></td>
                                <td align="center" >To: </td>
                                <td align="center" ><gw:datebox styles="width:70%" id="To13" lang="1" type="date"></gw:datebox></td>
								<td align=right>Account</td>
				                <td >
				                            <gw:textbox id="idAC_PK13" text=""  styles="display:none"/>
				                            <gw:textbox id="idAC_CD13" styles="width:100%"  csstype="mandatory"/>
				                </td>
				                <td ><gw:imgBtn id="ibtnGetAccount13" img="popup" styles="width:20%" onclick="GetAccCode2()"/></td>
                                <td  >Currency</td>
				                <td colspan="2">
				                        <gw:list id="lstCurrency13" styles="width:100%;" ></gw:list>

				                </td>
                        </tr>
                        
                        <tr>
                                <td  height="30"><input type="radio" id="rdReport" name="rdReport" value="14" onclick="OnRadioClick()"><gw:label2 id="lb14">Sổ tiền gửi ngân hàng</gw:label2></td>            
                                <td align="center" >From: </td>            
                                <td align="center" ><gw:datebox styles="width:70%" id="From14" lang="1"  type="date"></gw:datebox></td>
                                <td align="center" >To: </td>
                                <td align="center" ><gw:datebox styles="width:70%" id="To14" lang="1" type="date"></gw:datebox></td>
								<td  align=right>Account</td>
				                <td >
				                            <gw:textbox id="idAC_PK14" text=""  styles="display:none"/>
				                            <gw:textbox id="idAC_CD14" styles="width:100%"  csstype="mandatory"/>
				                </td>
				                <td ><gw:imgBtn id="ibtnGetAccount14" img="popup" styles="width:20%" onclick="GetAccCode2()"/></td>
                                <td  >Currency</td>
				                <td colspan="2">
				                        <gw:list id="lstCurrency14" styles="width:100%;" ></gw:list>

				                </td>
                        </tr>
                        <tr>
                                <td  height="30"><input type="radio" id="Radio1" name="rdReport" value="15" onclick="OnRadioClick()"><gw:label2 id="lb15">Báo cáo tiền theo tài khoản</gw:label2></td>            
                                <td align="center" >From: </td>            
                                <td align="center" ><gw:datebox styles="width:70%" id="From15" lang="1"  type="date"></gw:datebox></td>
                                <td align="center" >To: </td>
                                <td align="center" ><gw:datebox styles="width:70%" id="To15" lang="1" type="date"></gw:datebox></td>
                        </tr>
                        
                    </table>
            </div>
              
   <gw:textbox id="txtCheckExist" text="" styles='display:none;'/> 
   <gw:textbox id="txtCashbook_PK" text="" styles='display:none;'/> 
   <gw:textbox id="txtBalance_Trans" text="" styles='display:none;'/> 
   <gw:textbox id="txtBalance_Books" text="" styles='display:none;'/> 
   <gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
   
   <!--  SO CHI TIET TIEN VAY -->
   	<gw:datebox style="display:none" id="From10" lang="1"  type="date"></gw:datebox>
	<gw:datebox style="display:none" id="To10" lang="1" type="date"></gw:datebox>
	<gw:textbox id="idAC_PK10" text=""  styles="display:none"/>
    <gw:textbox id="idAC_CD10"  styles="display:none"/>
    <gw:list id="lstDepositAcct2" styles="display:none" ></gw:list>
    <gw:textbox id="txtUser_Pk"  styles='display:none' />
    <gw:label2 id="lb10"></gw:label2>
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
   </form>
</body>
</html>
