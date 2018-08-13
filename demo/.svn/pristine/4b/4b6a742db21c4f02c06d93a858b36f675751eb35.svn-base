<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Monthly Partner Balance</title>
    
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">

function BodyInit()
{
	//OnMerge();	
    //txtAC_CD.SetEnable(false);
    txtAC_NM.SetEnable(false);
    txtTCO_BUSPARTNER_CD.SetEnable(false);
    txtTCO_BUSPARTNER_NM.SetEnable(false);
    BindingDataList();
    lstCCY.SetDataText("");
    rdoAMOUNT.value = "2";
    rdoSTATUS.value = "2";
    var ls_bookccy = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
    lstBookCcy.SetDataText(ls_bookccy);  
    var myDate=new Date();
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
    txtFROM_DATE.SetDataText(fDate);
 
  
  
    System.Translate(document); 
	
    txtUser_Pk.text = "<%=Session("USER_PK")%>";
    dso_getCompany.Call();
}

function BindingDataList()
{
    var ls_comp    = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_ccy       = "<%=CtlLib.SetListDataFUNC("SELECT AC_F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>||Select All";
    var ls_search   = "<%=CtlLib.SetListDataFUNC("SELECT 'P|Period|M|Month' FROM DUAL")%>";
    var ls_report   = "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK AND M.ID='EACBK003' ORDER BY D.DEF_YN DESC, D.ORD ")%>";
    var ls_partner_type = "<%=CtlLib.SetListDataFUNC("SELECT AC_F_COMMONCODE('CODC0010','','') FROM DUAL")%>|ALL|--Select All--"; 
    var ls_data1     = "<%=CtlLib.SetListDataFUNC("SELECT AC_A_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
    lstLanguage.SetDataText(ls_data1);
    lstCOMPANY.SetDataText(ls_comp);
    lstCCY.SetDataText(ls_ccy);
    lstLanguage.SetDataText('VIE');
    lstREPORT.SetDataText(ls_report);
    lstSEARCH.SetDataText(ls_search);
    lstPartnerType.SetDataText(ls_partner_type);
	lstPartnerType.value = 'ALL';
}

function GetAccount()
{
    var fpath = System.RootURL + "/standard/forms/60/03/60030010_popup_ifrs.aspx?comm_nm=" + "" + "&comm_code=" + "" + "&comm_nm2=" + "" + "&val1=" + '' + "&val2=" + '' + "&val3=" + lstCOMPANY.value+'' + "&dsqlid=ac_sel_60080010_acct_partner";
    var object = System.OpenModal( fpath , 550 , 550 , 'resizable:yes;status:yes'); 
    if ((object != null) &&(object[0]!="0"))
    {
        txtAC_PK.SetDataText("");
        txtAC_CD.SetDataText("");
        txtAC_NM.SetDataText("");
        txtAC_PK.SetDataText(object[3]);
        txtAC_CD.SetDataText(object[0]);
        txtAC_NM.SetDataText(object[1]);

    }
}

function resetAcc(ind)
{
    txtAC_PK.SetDataText("");
    txtAC_CD.SetDataText("");
    txtAC_NM.SetDataText("");
   
}

function GetPartner()
{
    var path = System.RootURL + '/standard/forms/60/08/60080030_popup_customer.aspx?company_pk=' + lstCOMPANY.value;
    var object = System.OpenModal( path ,800 , 620 , 'resizable:yes;status:yes');
    if ( object != null )
    {
        if (object[0] != 0)
        {
            txtTCO_BUSPARTNER_PK.text = object[0];
            txtTCO_BUSPARTNER_CD.text = object[1];
            txtTCO_BUSPARTNER_NM.text = object[2];
        }
    }
}

function resetPartner()
{
    txtTCO_BUSPARTNER_PK.text = "";
    txtTCO_BUSPARTNER_CD.text = "";
    txtTCO_BUSPARTNER_NM.text = "";
}


function OnSearch()
{
//    if(txtAC_PK.text =="")
//    {
//        alert("Please select account");
//        return;
//    }
    if (tabMain.GetCurrentPageNo()=="0" || tabMain.GetCurrentPageNo()=="1")
    {
        if((txtAC_PK.text=="") &&(txtTCO_BUSPARTNER_PK.text==""))
       {
            alert("Please select an account code or partner!");
            return;
       } 
    }   
   
   if (tabMain.GetCurrentPageNo()=="0")
   {
        dso_sel_monthly_cust_bal3.Call("SELECT");
   } 
  
   
}




function OnDataReceive(pObject)
{
    switch(pObject.id)
    {
			
        
        
       
		 case "dso_sel_monthly_cust_bal3" :
			 OnMerge();
			if (grdPartnerACCD.rows > 2) 
			  {
			   grdPartnerACCD.Subtotal( 0, 2, -1, '6!7!8!9!10!11!12!13');// tham so thu 1 : gia tri 0 la subtotal hien thi cuoi cung va so 1 hien thi hien subtotal dau tien . tham so thu 2  la thuoc tinh group,tham so thu 3 :0 la  group tuong ung voi column so 0
			  }
			 
        break;
    
    
    }
	
}

/*function OnReport()
{
   if(txtAC_PK.text=="")
   {
        alert("Please choose account code");
        return;
   } 
   var url="";
    if(confirm("Are you sure you want to report ?" ))
    {
            switch (lstREPORT.value)
            {
                case 'AS':
                        url = '/standard/reports/gf/ka/gfka60110060_rpt.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                break;
               case 'TB':
                        url = '/standard/reports/gf/ka/gfka60110060_ccy.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                break; 
               case 'OB':
                        url = '/standard/reports/gf/ka/gfka60110060_book.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                break; 
                  }
        System.OpenTargetPage( System.RootURL+url , 'newform' );
    }

}*/
function OnReport(lang)
{
switch(lang)
    {
        case "VIE":
                 if (tabMain.GetCurrentPageNo()!="2")
                 { 
                    if(txtAC_PK.text=="")
                    {
                        alert("Please choose account code");
                        return;
                    } 
                    switch (lstREPORT.value)
                    {
                        case 'AS':
                            url = '/standard/reports/gf/ka/gfka60110060_rpt.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                            System.OpenTargetPage( System.RootURL+url , 'newform' );
                        break;
                        case 'TB':
                            url = '/standard/reports/gf/ka/gfka60110060_ccy.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                            System.OpenTargetPage( System.RootURL+url , 'newform' );
                        break; 
                        case 'OB':
                            url = '/standard/reports/gf/ka/gfka60110060_book_vie.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                            System.OpenTargetPage( System.RootURL+url , 'newform' );
                        break; 
                    }
                    
                 }  
                 else
                 {
                    switch (lstREPORT.value)
                    {
                        case 'AL':
                            url = '/standard/reports/gf/ka/gfka60110060_book_accd_vie.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_CD.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value+'&partner_type='+lstPartnerType.value;
                            System.OpenTargetPage( System.RootURL+url , 'newform' );
                        break; 
                        case 'AS':
                            alert("Chọn report in tất cả tài khoản");
                        break;
                        case 'TB':
                            alert("Chọn report in tất cả tài khoản");
                        break; 
                        case 'OB':
                            alert("Chọn report in tất cả tài khoản");
                        break; 
                    }
                 } 
    break;
    case "ENG":
                if(txtAC_PK.text=="")
                {
                    alert("Please choose account code");
                    return;
                } 

                switch (lstREPORT.value)
                {
                    case 'AS':
                        url = '/standard/reports/gf/ka/gfka60110060_rpt.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                    break;
                    case 'TB':
                        url = '/standard/reports/gf/ka/gfka60110060_ccy.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                    break; 
                    case 'OB':
                        url = '/standard/reports/gf/ka/gfka60110060_book.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                    break; 
                    case 'AL':
                        url = '/standard/reports/gf/ka/gfka60110060_book_accd_vie.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value+'&partner_type='+lstPartnerType.value;
                    break; 
                }
                System.OpenTargetPage( System.RootURL+url , 'newform' );
               
    break;
 }
}
function OnDisplayMonth()
{
    
}



function OnChangeTab()
{
}

function OnMerge()
{
		var fg=grdPartnerACCD.GetGridControl();
		if(fg.Rows < 2)
		{
		   grdPartnerACCD.AddRow();     
		}
		
		fg.FixedRows = 2
		fg.MergeRow(0) = true;
		fg.MergeCells = 5
		
		fg.Cell(0, 0, 0, 0, 0) = "pk";
        fg.Cell(0, 0, 0, 1, 0) = "pk2";
	

        fg.Cell(0, 0, 2, 0, 3) = "Partner";
        fg.Cell(0, 1, 2, 1, 2) = "ID";
        fg.Cell(0, 1, 3, 1, 3) = "Name";
		fg.MergeCol(4) = true;

	    fg.Cell(0, 0, 4, 1, 4) = "PL";
		fg.MergeCol(5) = true;
		fg.Cell(0, 0, 5, 1, 5) = "Acc Code";
		
		fg.Cell(0, 0, 6, 0, 7) = "Open"
		fg.Cell(0, 0, 8, 0, 9) = "Period"
		fg.Cell(0, 0, 10 ,0, 11) = "Acc cumulate"
		fg.Cell(0, 0, 12, 0, 13) = "End"
		
	
		
		fg.Cell(0, 1, 6, 1 ) 	= "DR"
		fg.Cell(0, 1, 7, 1) 	= "CR "	
		
		fg.Cell(0, 1, 8, 1 ) 	= "DR"
		fg.Cell(0, 1, 9, 1) 	= "CR "		
		
		fg.Cell(0, 1, 10, 1 ) 	= "DR"
		fg.Cell(0, 1, 11, 1) 	= "CR "
		
		fg.Cell(0, 1, 12, 1 ) 	= "DR"
		fg.Cell(0, 1, 13, 1) 	= "CR "
		
		
		
		fg.ColWidth(0)=2100;
		fg.ColWidth(1)=2100;
		fg.ColWidth(2)=2100;
		fg.ColWidth(3)=2100;
		fg.ColWidth(4)=2100;
		fg.ColWidth(5)=2100;
		fg.ColWidth(6)=2100;
		fg.ColWidth(7)=2100;
		fg.ColWidth(8)=2100;
		fg.ColWidth(9)=2100;
		fg.ColWidth(10)=2100;
		fg.ColWidth(11)=2100;
		
		/*
		fg.MergeCol(0) = true
		fg.Cell(0, 0, 0, 1, 0) = "Ctrl"
		fg.MergeCol(2) = true
		fg.Cell(0, 0, 2, 1, 2) = "Account Name"
        fg.MergeCol(3) = true
        fg.Cell(0, 0, 3, 1, 3) = "Account Name (Local)"
        fg.MergeCol(4) = true
        fg.Cell(0, 0, 4, 1, 4) = "Account Name (Kor)"
		AppearColTrans();
		AppearColBook();
		idGrid.GetGridControl().ColHidden(13) = true;
		idGrid.GetGridControl().ColHidden(14) = true;
		idGrid.GetGridControl().ColHidden(15) = true;
		idGrid.GetGridControl().ColHidden(16) = true;*/
}

function Popup()
	{
	
			var fpath = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code=" + "" + "&comm_nm=" + '' + "&company=" + lstCOMPANY.value + '&dsqlid=AC_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
			var object = System.OpenModal(fpath, 600, 500, 'resizable:yes;status:yes');
			{
			if (object != null) 
				{
				if (object[0] != 0) 
					{
						txtpl_cd.SetDataText(object[0]);
						//txt_PLC_CD.SetDataText(object[3]);
						txtpl_nm.text = object[1];
						txtpl_pk.text =object[2];
						//l_plc_nm=object[4];
					} 
				}
			}
		
	}

function reset_pl(){
	txtpl_cd.text ="";
	txtpl_nm.text ="";
	txtpl_pk.text ="";
}



</script>
<body style="margin:0; padding:0;">
   
  
    
    <gw:data id="dso_sel_monthly_cust_bal3" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60081343_mo_cust_bal3">
                <input bind="grdPartnerACCD">
                    <input bind="lstCOMPANY"/>
                    <input bind="txtFROM_DATE"/>
                    <input bind="txtTO_DATE"/>
                    <input bind="txtAC_CD"/>
                    <input bind="txtTCO_BUSPARTNER_PK"/>
                    <input bind="rdoSTATUS"/>
                    <input bind="lstPartnerType"/>
					<input bind="txtpl_pk"/>
					
                    
                </input>
                <output bind="grdPartnerACCD"/>
            </dso>
        </xml>
    </gw:data>
    
   
   
  
   
<!------------------------------------------------------------------------------------------------------->
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60010020_1" > 
                <input> 
                     <input bind="txtUser_Pk"/>
                </input>
                <output>
                     <output bind="lstCOMPANY"/>
               </output> 
            </dso> 
        </xml> 
    </gw:data>
<table width="100%" cellpadding="0" cellspacing="0" border="0" height="100%">
    <tr height="6%">
        <td>
            <table width="100%" cellpadding="0" cellspacing="0" border="0" height="100%">
                <tr>
                    <td width="10%"></td>
                    <td width="9%"></td>
                    <td width="3%"></td>
                    <td width="9%"></td>
                    
                    <td width="7%"></td>
                    <td width="10%"></td>
					<td width="10%"></td>
					 <td width="15%"></td>
                    <td width="9%"></td>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="10%"></td>
                </tr>  
                <tr>
                    <td align="right">Company</td>
                    <td colspan="3"><gw:list id="lstCOMPANY" styles='width:100%'/></td>
                    <td align="right"><b><a title="Click here to show Account" onclick="GetAccount()" href="#tips" >Account code</a></b></td>
                    <td colspan="2">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="20%"><gw:textbox id="txtAC_PK" styles='display:none'></gw:textbox>
                                                <gw:textbox id="txtAC_CD" styles='width:100%;' csstype="mandatory" onenterkey="OnSearch()"/>
                                                </td>
								<td width="75%"><gw:textbox id="txtAC_NM" styles='width:100%;' csstype="mandatory"/></td>
                                <td width="5%" align="left"><gw:imgBtn id="ibtnAccReset" img="reset"  alt="reset acc" onclick="resetAcc()" /></td>
                            </tr>
                        </table>
                    </td>
                    <td colspan="2">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
								<td width="7%" align ="right"><b><a title="Click here to show PL" onclick="Popup()" href="#tips"> PL</a></b></td>
                                <td width="20%"><gw:textbox id="txtpl_pk" styles='display:none'></gw:textbox>
                                                <gw:textbox id="txtpl_cd" styles='width:100%;'csstype="mandatory"/>
                                                </td>
								<td width="68%"><gw:textbox id="txtpl_nm" styles='width:100%;' csstype="mandatory"/></td>
                                <td width="5%" ><gw:imgBtn id="ibtnCustReset1" img="reset"  alt="reset partner" onclick="reset_pl()" /></td>
                            </tr>
                        </table>
                    </td>
                    <td align="right" >Language</td>
                    <td  ><gw:list id="lstLanguage" styles="width:100%;" ></gw:list></td>
                    <td align="center"><gw:imgBtn id="ibtnSearch" img="search"  alt="Search" onclick="OnSearch()" /></td>
                </tr> 
                <tr>
                    <td align="right">Proposed Date</td>
                    <td align="left" ><gw:datebox id="txtFROM_DATE" styles='width:100%;'  lang="<%=Session("Lang")%>"/></td>
                    <td align="center">~</td>
                    <td align="right"><gw:datebox id="txtTO_DATE" styles='width:100%;'  lang="<%=Session("Lang")%>"/></td>
                    <td align="right"><a title="Click here to show customer" onclick="GetPartner()" href="#tips" ><b>Partner&nbsp;</b></a></td>
                    <td colspan="2">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td width="20%"><gw:textbox id="txtTCO_BUSPARTNER_PK" styles='display:none'></gw:textbox>
                                                <gw:textbox id="txtTCO_BUSPARTNER_CD" styles='width:100%;'csstype="mandatory"/>
                                                </td>
								<td width="75%"><gw:textbox id="txtTCO_BUSPARTNER_NM" styles='width:100%;' csstype="mandatory"/></td>
                                <td width="5%" ><gw:imgBtn id="ibtnCustReset" img="reset"  alt="reset partner" onclick="resetPartner()" /></td>
                            </tr>
                        </table>
                    </td>
					<td colspan="2"></td>
                   <td align="right">Currency</td>
                    <td><gw:list id="lstCCY" styles='width:100%'/></td>
                    <td align="left"><gw:imgBtn id="ibtnReport" img="printer"   alt="Print Acct"  styles='display:none'  onclick="OnReport(lstLanguage.GetData())" /></td>
                </tr>
                <tr>
                    <td align="right">Slip Status</td>
                    <td colspan="3"><gw:radio id="rdoSTATUS" value="2" onchange="OnSearch()" >
                                    <span value="2">Confirmed</span>
                                    <span value="0">Approved</span>
                                    </gw:radio ></td>
                    <td align="right">Amount Type</td>
                    <td colspan="3">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td width="75%">
                                <gw:radio id="rdoAMOUNT" value="2" onchange="OnChangeAmountType()" >
                                    <span value="1">Trans & Book</span>
                                    <span value="2">Book</span>
                                    </gw:radio >
                                </td>
                                <td align="right" width="25%" styles='display:none'> <!--Report--></td>
                            </tr>
                        </table>
                    </td>
                    <td><gw:list id="lstREPORT" styles='width:100%;display:none'/></td>
                    <td align="right" >Partner Type</td>
                    <td><gw:list id="lstPartnerType" styles='width:100%'/></td>
                </tr> 
            </table>
        </td>
    </tr>
  <tr style="height: 94%">
  <td colspan="12"  >
   <gw:tab id="tabMain" border=1 style="width:100%;height:100%" onpageactivate="" onclick ="OnChangeTab()" > 

        <form name="Account Code & Customer" id="form3" >
                <table width="100%" cellpadding="0" cellspacing="0" border="0" height ="100%">
				<tr  >
					<td>
					<gw:grid id='grdPartnerACCD'
                            header='_TCO_BUSPARTNER_PK|_TAC_ABACCTCODE_PK|Partner ID|Partner Name|PL|Account Code|Openning DR Balance|Openning CR Balance|Debit Amount|Credit Amount|Acc. Debit Amount|Acc. Credit Amount|Closing DR Balance|Closing CR Balance'
                            format='0|0|0|0|0|0|1|1|1|1|1|1|1|1'
                            aligns='0|0|0|0|0|1|3|3|3|3|3|3|3|3'
                            defaults='|||||||||||||'
                            editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                            widths='0|0|1000|3000|2000|1500|1800|1800|1800|1800|1800|1800|1800'
                            styles  ="width:100%; height:100%"   
                            sorting="T"
                            oncelldblclick ="OnShowDetailBook()"/> 

					</td>
				</tr>
                
            </table>
        </form>
      
        
    
        </gw:tab>
</td>
</tr>
 </table> 
<gw:list id="lstBookCcy" styles="display:none;" ></gw:list>
<gw:textbox id="txtSUM"   style="display:none"/>

<gw:textbox id="txtAc_level"  styles='display:none' />
         <gw:textbox id="txtSesion_company"  styles='display:none' />
         <gw:textbox id="txtUser_Pk"  styles='display:none' />
<gw:list id="lstSEARCH" styles='width:100%;display:none' onchange="OnDisplayMonth()"/>
<!---------------------------------------------------------------------------------------------------->
</body>
</html>