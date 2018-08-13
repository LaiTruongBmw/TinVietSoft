<!-- #include file="../../../../system/lib/form.inc"  -->
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>genuwin</title>
  </head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script>
var G_PARTNER_ID = 0,
	G_PARTNER_NAME = 1,
	G_PARTNER_TYPE = 2,
	G_CCY = 3,
	G_F_Jan = 4,
	G_F_Feb = 5,
	G_F_Mar = 6,
	G_F_Apr = 7,
	G_F_May = 8,
	G_F_Jun = 9,
	G_F_Jul = 10,
	G_F_Aug = 11,
	G_F_Sep = 12,
	G_F_Oct = 13,
	G_F_Nov = 14,
	G_F_Dec = 15,
	G_Jan = 16,
	G_Feb = 17,
	G_Mar = 18,
	G_Apr = 19,
	G_May = 20,
	G_Jun = 21,
	G_Jul = 22,
	G_Aug = 23,
	G_Sep = 24,
	G_Oct = 25,
	G_Nov = 26,
	G_Dec = 27;
var g_user_pk = "<%=Session("USER_PK") %>";
function BodyInit()
{
    System.Translate(document);
    BindingData(); 
	MergeHeaderPartner();
    txtUser_Pk.text = g_user_pk;
	dso_getCompany.Call();
}
//------------------------------------------------------------------------
function BindingData()
{
    var ls_comp    = "<%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>";
    var ls_ccy       = "<%=CtlLib.SetListDataFUNC("SELECT AC_F_COMMONCODE('ACAB0110','03','') FROM DUAL")%>||Select All";
    var ls_report   = "<%=CtlLib.SetListDataSQL(" SELECT D.CODE, D.CODE_NM FROM TAC_COMMCODE_MASTER M, TAC_COMMCODE_DETAIL D WHERE M.DEL_IF =0 AND D.DEL_IF =0 AND M.PK = TAC_COMMCODE_MASTER_PK and d.use_yn = 'Y' AND M.ID='EACBK003' ORDER BY D.DEF_YN DESC, D.ORD ")%>";
    var ls_partner_type = "<%=CtlLib.SetListDataFUNC("SELECT AC_F_COMMONCODE('CODC0010','','') FROM DUAL")%>|ALL|--Select All--"; 
    var ls_data1     = "<%=CtlLib.SetListDataFUNC("SELECT AC_A_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
    var ls_bookccy = "<%=CtlLib.SetListDataSQL("SELECT CODE, CODE FROM TCO_ABCODE A, TCO_ABCODEGRP B WHERE A.TCO_ABCODEGRP_PK = b.pk and b.id ='ACBG0040' and a.use_if = 1 and a.del_if = 0 and b.del_if = 0 and a.def_yn ='Y' ")%>";
    lstBookCcy.SetDataText(ls_bookccy);  
	lstLanguage.SetDataText(ls_data1);
    lstCOMPANY.SetDataText(ls_comp);
    lstCCY.SetDataText(ls_ccy);
    lstLanguage.SetDataText('VIE');
    lstREPORT.SetDataText(ls_report);
    lstPartnerType.SetDataText(ls_partner_type);
	lstPartnerType.value = 'ALL';
    lstREPORT.value = 'PSY';
	OnShowHide();
}
//------------------------------------------------------------------------
function OnDataReceive(pObject)
{
    switch(pObject.id)
    {
		case "dso_search":
			MergeHeaderPartner();
			grdPartner.Subtotal (0,2 ,-1, '4!5!6!7!8!9!10!11!12!13!14!15!16!17!18!19!20!21!22!23!24!25!26!27','',true,4,'Total');
			auto_resize_column(grdPartner,0,grdPartner.cols-1,9);
		break;
	}
}

function auto_resize_column(obj,col1,col2,font_size)
{
    if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
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

function MergeHeaderPartner()
{
	var fg=grdPartner.GetGridControl();
	if(fg.Rows < 2)
	{
	   grdPartner.AddRow();     
	}
	fg.FrozenCols = G_F_Jan;
	fg.FixedRows = 2;
	fg.MergeRow(0) = true;
	fg.MergeCells = 5;
	fg.Cell(0, 0, G_PARTNER_ID, 0, G_PARTNER_NAME) = "Partner";
	fg.Cell(0, 1, G_PARTNER_ID, 1, G_PARTNER_ID) = "Code";
	fg.Cell(0, 1, G_PARTNER_NAME, 1, G_PARTNER_NAME) = "Name";
	fg.MergeCol(G_PARTNER_TYPE) = true;
	fg.Cell(0, 0, G_PARTNER_TYPE, 1, G_PARTNER_TYPE) = "Partner Type";
	fg.MergeCol(G_CCY) = true;
	fg.Cell(0, 0, G_CCY, 1, G_CCY) = "CCY";
	
	fg.Cell(0, 0, G_F_Jan, 0, G_F_Dec) = "Trans Balance";
	fg.Cell(0, 1, G_F_Jan, 1, G_F_Jan) = "Jan";
	fg.Cell(0, 1, G_F_Feb, 1, G_F_Feb) = "Feb";
	fg.Cell(0, 1, G_F_Mar, 1, G_F_Mar) = "Mar";
	fg.Cell(0, 1, G_F_Apr, 1, G_F_Apr) = "Apr";
	fg.Cell(0, 1, G_F_May, 1, G_F_May) = "May";
	fg.Cell(0, 1, G_F_Jun, 1, G_F_Jun) = "Jun";
	fg.Cell(0, 1, G_F_Jul, 1, G_F_Jul) = "Jul";
	fg.Cell(0, 1, G_F_Aug, 1, G_F_Aug) = "Aug";
	fg.Cell(0, 1, G_F_Sep, 1, G_F_Sep) = "Sep";
	fg.Cell(0, 1, G_F_Oct, 1, G_F_Oct) = "Oct";
	fg.Cell(0, 1, G_F_Nov, 1, G_F_Nov) = "Nov";
	fg.Cell(0, 1, G_F_Dec, 1, G_F_Dec) = "Dec";
	
	fg.Cell(0, 0, G_Jan, 0, G_Dec) = "Books Balance";
	fg.Cell(0, 1, G_Jan, 1, G_Jan) = "Jan";
	fg.Cell(0, 1, G_Feb, 1, G_Feb) = "Feb";
	fg.Cell(0, 1, G_Mar, 1, G_Mar) = "Mar";
	fg.Cell(0, 1, G_Apr, 1, G_Apr) = "Apr";
	fg.Cell(0, 1, G_May, 1, G_May) = "May";
	fg.Cell(0, 1, G_Jun, 1, G_Jun) = "Jun";
	fg.Cell(0, 1, G_Jul, 1, G_Jul) = "Jul";
	fg.Cell(0, 1, G_Aug, 1, G_Aug) = "Aug";
	fg.Cell(0, 1, G_Sep, 1, G_Sep) = "Sep";
	fg.Cell(0, 1, G_Oct, 1, G_Oct) = "Oct";
	fg.Cell(0, 1, G_Nov, 1, G_Nov) = "Nov";
	fg.Cell(0, 1, G_Dec, 1, G_Dec) = "Dec";
	
	fg.Cell(2, 0, 0, 1, fg.Cols - 1) = 4;
	fg.Cell(13, 1, 0, 1,fg.Cols - 1) = true; 
}

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
						case 'OB_TYPE':
                            url = '/standard/reports/gf/ka/gfka60110060_book_tpye_vie.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
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
					case 'OB_TYPE':
                            url = '/standard/reports/gf/ka/gfka60110060_book_tpye_eng.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
                            System.OpenTargetPage( System.RootURL+url , 'newform' );
                        break;
					case 'TB_TYPE':	
						url = '/standard/reports/gf/ka/gfka60110060_eng.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtbFrom=' + txtFROM_DATE.GetData()+ '&dtbTo=' + txtTO_DATE.GetData() + '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value;
						System.OpenTargetPage( System.RootURL+url , 'newform' );
					break;
					case 'PSY':	
						if(rdoAMOUNT.value == '1')
						{
							url = '/standard/reports/60/20/rpt_60200070_eng.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtYear=' + dtYear.GetData()+ '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value+'&partner_type='+lstPartnerType.value+'&account_cd='+txtAC_CD.text+'&account_nm='+txtAC_NM.text;
						}
						else if(rdoAMOUNT.value == '2')
						{
							url = '/standard/reports/60/20/rpt_60200070_book_eng.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtYear=' + dtYear.GetData()+ '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value+'&partner_type='+lstPartnerType.value+'&account_cd='+txtAC_CD.text+'&account_nm='+txtAC_NM.text;
						}
						if(rdoAMOUNT.value == '3')
						{
							url = '/standard/reports/60/20/rpt_60200070_trans_eng.aspx?company_pk=' + lstCOMPANY.GetData() + '&dtYear=' + dtYear.GetData()+ '&account_pk=' + txtAC_PK.text + '&cust_pk=' + txtTCO_BUSPARTNER_PK.text + '&ccy=' + lstCCY.GetData()+ '&status=' + rdoSTATUS.GetData()+'&bookccy='+lstBookCcy.value+'&partner_type='+lstPartnerType.value+'&account_cd='+txtAC_CD.text+'&account_nm='+txtAC_NM.text;
						}
						System.OpenTargetPage( System.RootURL+url , 'newform' );
					break;
                }
                System.OpenTargetPage( System.RootURL+url , 'newform' );
               
    break;
 }
}

function OnShowHide()
{
	if(rdoAMOUNT.value == '2')
	{
		grdPartner.GetGridControl().ColWidth(G_F_Jan) = 0;
		grdPartner.GetGridControl().ColWidth(G_F_Feb) = 0;
		grdPartner.GetGridControl().ColWidth(G_F_Mar) = 0;
		grdPartner.GetGridControl().ColWidth(G_F_Apr) = 0;
		grdPartner.GetGridControl().ColWidth(G_F_May) = 0;
		grdPartner.GetGridControl().ColWidth(G_F_Jun) = 0;
		grdPartner.GetGridControl().ColWidth(G_F_Jul) = 0;
		grdPartner.GetGridControl().ColWidth(G_F_Aug) = 0;
		grdPartner.GetGridControl().ColWidth(G_F_Sep) = 0;
		grdPartner.GetGridControl().ColWidth(G_F_Oct) = 0;
		grdPartner.GetGridControl().ColWidth(G_F_Nov) = 0;
		grdPartner.GetGridControl().ColWidth(G_F_Dec) = 0;
		
		auto_resize_column(grdPartner,16,27,9);
	}
	else if(rdoAMOUNT.value == '3')
	{
		grdPartner.GetGridControl().ColWidth(G_Jan) = 0;
		grdPartner.GetGridControl().ColWidth(G_Feb) = 0;
		grdPartner.GetGridControl().ColWidth(G_Mar) = 0;
		grdPartner.GetGridControl().ColWidth(G_Apr) = 0;
		grdPartner.GetGridControl().ColWidth(G_May) = 0;
		grdPartner.GetGridControl().ColWidth(G_Jun) = 0;
		grdPartner.GetGridControl().ColWidth(G_Jul) = 0;
		grdPartner.GetGridControl().ColWidth(G_Aug) = 0;
		grdPartner.GetGridControl().ColWidth(G_Sep) = 0;
		grdPartner.GetGridControl().ColWidth(G_Oct) = 0;
		grdPartner.GetGridControl().ColWidth(G_Nov) = 0;
		grdPartner.GetGridControl().ColWidth(G_Dec) = 0;
		
		auto_resize_column(grdPartner,0,15,9);
	}
	else
	{
		auto_resize_column(grdPartner,0,grdPartner.cols-1,9);
	}
}
</script>
  <body>
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
	<gw:data id="dso_search" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60200070">
                <input bind="grdPartner">
                    <input bind="lstCOMPANY"/>
                    <input bind="dtYear"/>
                    <input bind="txtAC_PK"/>
                    <input bind="txtTCO_BUSPARTNER_PK"/>
                    <input bind="rdoSTATUS"/>
                    <input bind="lstCCY"/>
                    <input bind="lstPartnerType"/>
                </input>
                <output bind="grdPartner"/>
            </dso>
        </xml>
    </gw:data>
<table style="width:100%;height:100%" cellpadding="1" cellspacing="1" border="0">
	<tr style='height:2%'>
		<td width='10%' align="right">Company</td>
		<td width='20%'><gw:list id="lstCOMPANY" styles='width:100%'/></td>
		<td width='15%' align="right"><b><a title="Click here to show Account" onclick="GetAccount()" href="#tips" >Account code</a></b></td>
		<td width='20%'>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="95%"><gw:textbox id="txtAC_PK" styles='display:none'></gw:textbox>
									<gw:textbox id="txtAC_CD" styles='width:30%;' csstype="mandatory" onenterkey="OnSearch()"/>
									<gw:textbox id="txtAC_NM" styles='width:70%;' csstype="mandatory"/></td>
					<td><gw:imgBtn id="ibtnAccReset" img="reset"  alt="reset acc" onclick="resetAcc()" /></td>
				</tr>
			</table>
		</td>
		
		<td align="right" width="15%">Language</td>
		<td  width='20%'><gw:list id="lstLanguage" styles="width:100%;" ></gw:list></td>
		<td ><gw:imgBtn id="ibtnSearch" img="search"  alt="Search" onclick="dso_search.Call('SELECT')" /></td>
	</tr>
	<tr style='height:2%'>
		<td align="right">GL Date</td>
		<td>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td align="left" ><gw:datebox type='year' id="dtYear" styles='width:100%;'  lang="<%=Session("Lang")%>"/></td>
					<td style='white-space:nowrap' align="right">Currency</td>
					<td width='100%'><gw:list id="lstCCY" styles='width:100%'/></td>
				</tr>
			</table>
		</td>
		<td align="right"><a title="Click here to show customer" onclick="GetPartner()" href="#tips" ><b>Partner&nbsp;</b></a></td>
		<td>
			<table width="100%" cellpadding="0" cellspacing="0" border="0">
				<tr>
					<td width="95%"><gw:textbox id="txtTCO_BUSPARTNER_PK" styles='display:none'></gw:textbox>
									<gw:textbox id="txtTCO_BUSPARTNER_CD" styles='width:30%;'csstype="mandatory"/>
									<gw:textbox id="txtTCO_BUSPARTNER_NM" styles='width:70%;' csstype="mandatory"/></td>
					<td><gw:imgBtn id="ibtnCustReset" img="reset"  alt="reset partner" onclick="resetPartner()" /></td>
				</tr>
			</table>
		</td>
	    <td align="right">Partner Type</td>
		<td><gw:list id="lstPartnerType" styles='width:100%'/></td>
		<td><gw:imgBtn id="ibtnReport" img="printer"   alt="Print Acct"    onclick="OnReport(lstLanguage.GetData())" /></td>
	</tr>
	<tr style='height:2%'>
		<td align="right">Slip Status</td>
		<td><gw:radio id="rdoSTATUS" value="2" onchange="OnSearch()" >
						<span value="2">Confirmed</span>
						<span value="0">Approved</span>
						</gw:radio ></td>
		<td align="right">Amount Type</td>
		<td>
			<table border="0" cellpadding="0" cellspacing="0" width="100%">
				<tr>
					<td width="100%">
					<gw:radio id="rdoAMOUNT" value="2" onchange="OnShowHide()" >
						<span value="1">Trans & Book</span>
						<span value="3">Trans</span>
						<span value="2">Book</span>
						</gw:radio >
					</td>
					
				</tr>
			</table>
		</td>
		<td align="right" width="">Report</td>
		<td><gw:list id="lstREPORT" styles='width:100%'/></td>
	</tr> 
	<tr style='height:90%'>
		<td colspan='10'>
			<gw:grid id='grdPartner'
			header='PARTNER_ID|PARTNER_NAME|Partner type|CCY|F_Jan|F_Feb|F_Mar|F_Apr|F_May|F_Jun|F_Jul|F_Aug|F_Sep|F_Oct|F_Nov|F_Dec|Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec'
			format='0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
			aligns='0|0|0|0|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3|3'
			defaults='|||||||||||||||||||||||||||'
		   editcol='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
			widths='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
			styles  ="width:100%; height:100%"   
			sorting="T"
			autosize="T"
			oncelldblclick =""/> 
		</td>
	</tr>
</table>     
<gw:textbox id="txtUser_Pk" styles='display:none'> 
<gw:list id="lstBookCcy" styles="display:none;" ></gw:list>                     
  </body>
</html>