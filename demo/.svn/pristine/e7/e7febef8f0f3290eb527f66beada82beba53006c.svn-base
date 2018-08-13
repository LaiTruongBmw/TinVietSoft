<!-- #include file="../../../../system/lib/form.inc" -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<script type="text/javascript" language="javascript">
function BodyInit()
{
    BindingDataList();
}

function BindingDataList()
{
	var data;
	 var arr;
    var ls_comp = "<%= CtlLib.SetListDataSQL(" select pk,PARTNER_NAME from tco_company where del_if = 0") %>";
    var ls_kind_cd  = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACDF0010','01','') FROM DUAL")%>||Select All"; 
    var ls_kind_cd  = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACDF0010','01','') FROM DUAL")%>||Select All"; 
    var lststatus      = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACDF0070') FROM DUAL")%>||Select All"; 
    var lsAssetType      = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('GFQC0025') FROM DUAL")%>|ALL|[SELECT ALL]";
    lstSTATUS.SetDataText(lststatus);   
    lstSTATUS.SetDataText('');                                
    lstCOMPANY.SetDataText(ls_comp);  
    lstAsset_Type.SetDataText(lsAssetType);
    lstAsset_Type.value = 'ALL';
    lstKIND_CODE.SetDataText(ls_kind_cd); 
    lstKIND_CODE.value=""; 
	data =    "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACDF0071') FROM DUAL")%>"; 
    lstReportType.SetDataText(data);
	data =    "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('COAB0070') FROM DUAL")%>"; 
	lstLanguage.SetDataText(data);
	data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('COAB0070') FROM DUAL")%>";
    arr  = data.split("|");
	lstLanguage.SetDataText(arr[1]);
      data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
   arr  = data.split("|");
   txtbookccy.SetDataText(arr[1]);
   //alert(txtbookccy.text);
    txtAssetCode.text = "";  
    txtDeprCode.text = ""; 
    txtExpeCode.text = ""; 
    grdFixedAsset.GetGridControl().WordWrap = true;
    grdFixedAsset.GetGridControl().RowHeight(0) = 600 ; 
    grdFixedAsset.GetGridControl().FrozenCols = 4;
	txtProposedByUserPk.text="<%=Session("USER_PK")%>";
	dso_getCompany.Call();
    
    
    System.Translate(document);
}

function onGetDepartment()
{
        var strcom;
        var fpath = System.RootURL + "/standard/forms/ch/ae/chae00010_dept.aspx?";
        //var obj  = System.OpenModal(  fpath , 300 , 200 , 'resizable:yes;status:yes');
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:420;dialogTop:250;edge:sunken;scroll:no;unadorned:yes;help:no');
        if (obj!=null)
        {
            txtUpperDept.text=obj;
            datDeptData.Call();
        }
}

function onResetDepartment()
{
    txtDepartmentPK.text = "";
   txtDepartmentName.text = ""; 
}

function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {
        case "dso_getCompany":
			 datDeptData.Call("SELECT");
		break;
    }
}

function OnSearch()
{
    datFixedAsset.Call("SELECT");
}
function OnReport()
{
 
        //var url = System.RootURL + "/system/ReportEngine.aspx?file=gf/gf/gfgf00040_02.rpt&procedure=acnt.sp_sel_rptgfgf00040_1" 
       //  + "&parameter="+dtFrom.value+","+dtTo.value+","+lstCOMPANY.value+","+lstKIND_CODE.value+","+lstDEPT.value+","+txtAssetCode.text+","+txtDeprCode.text+","+txtExpeCode.text+","+lstDEPT.value+"";
       // window.open(url); 
        var rqt = "";
        var url= "";
        rqt = "?company_pk="+lstCOMPANY.value+'&KindCode='+lstKIND_CODE.value+'&DeptPK='+lstDEPT.value+'&Status='+lstSTATUS.value+'&AssetAccCode='+txtAssetCode.text+'&AssetDepr='+txtDeprCode.text+'&ExpAcc='+txtExpeCode.text+'&dtFrom='+dtFrom.value+'&dtTo='+dtTo.value + '&txtAssetCode_PK=' + txtAssetCode_PK.GetData() + '&txtDeprCode_PK=' + txtDeprCode_PK.GetData() + '&txtExpeCode_PK=' + txtExpeCode_PK.GetData()+'&ccy='+txtbookccy.text + '&Asset_Type=' + lstAsset_Type.value + '&fa_cd=' + txtAsset.text+'&lang='+lstLanguage.value+'&pl_pk='+txtPL_PK.text;
		
        switch(lstReportType.GetData())
        {
            case "1":
				
			   switch(lstLanguage.GetData())
			   {
					case "VIE":
						 //alert(lstLanguage.GetData());
						 url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_01_VIE.aspx'+rqt;
						 //url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_01_VIE_POSCOEC.aspx'+rqt; 
					 break;
					 case "ENG":
						 url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_01.aspx'+rqt;
					 break;
			  }
		    break;
            case "2":
			   switch(lstLanguage.GetData())
			   {
					case "VIE":
							// url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_02_VIE.aspx'+rqt;
						 url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_02_VIE_NEW.aspx'+rqt;
					 break;
					 case "ENG":
							// url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_02_VIE.aspx'+rqt;
						 url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_02_VIE_NEW.aspx'+rqt;
					 break;
			   }
               
            break;
            case "3":
			  switch(lstLanguage.GetData())
			   {
					case "VIE":
						 url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_03_VIE.aspx'+rqt;
					 break;
					 case "ENG":
						 url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_03.aspx'+rqt;
					 break;
			   }
              
            break;
			case "6":
						if(lstAsset_Type.value=="T")
						{
							url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_06_TOOL_ENG_VIE_1.aspx'+rqt;
						}
						if(lstAsset_Type.value=="A")
						{
							url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_06_ENG_VIE.aspx'+rqt;
						}
            break;
			case "7":
			   switch(lstLanguage.GetData())
			   {
					case "VIE":
						 url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_02_VIE_7.aspx'+rqt;
					 break;
					 case "ENG":
						url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_02.aspx'+rqt;
					 break;
			   }
			break;
			case "8":
			   switch(lstLanguage.GetData())
			   {
					case "VIE":
						 url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_02_VIE_8.aspx'+rqt;
					 break;
				}
			break;
			case "10":
			  switch(lstLanguage.GetData())
			   {
					case "VIE":
						 url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_02_VIE_NEW_PL.aspx'+rqt;
					 break;
			   }
            break;
			case "11":
			  
						 url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_02_VIE_NEW_model.aspx'+rqt;
            break;
			case "12":
						 url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_02_VIE_NEW_picture.aspx'+rqt;
            break;
			case "13":
			  switch(lstLanguage.GetData())
			   {
					case "VIE":
						 url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_02_VIE_NEW_More_PL.aspx'+rqt;
					 break;
			   }
            break;
			case "15":
				url =System.RootURL + '/standard/reports/gf/gf/gfgf00040_02_VIE_NEW_PL_2.aspx'+rqt;
			break;

        }
        
        System.OpenTargetPage(url, "newform" );
        return; 

}
function GetAccount(ind)
{
	var comm_code ="";
    var kind_cd = "ALL",trans_grp = "", acc_grp_cd = "";
        
    if(ind == "1")
    {
       comm_code = 'ACDF0020';
        kind_cd = lstKIND_CODE.GetData();
		trans_grp = "A";
		acc_grp_cd = "AF001";     
    }
    if(ind == "2")
    {      
        comm_code = 'ACDF0030';
        kind_cd = lstKIND_CODE.GetData();
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
        kind_cd = lstKIND_CODE.GetData();
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
	var fpath   = System.RootURL + "/standard/forms/60/13/60130110_acc_code.aspx?compk=" + lstCOMPANY.GetData() + "&transgrp=" + trans_grp + "&accgrpcd=" + acc_grp_cd;
    var object  = System.OpenModal(fpath , 600 , 500 , 'titleb:0;resizable:no;status:no;dialogWidth:50;dialogHeight:31;dialogLeft:5;dialogTop:30;edge:sunken;scroll:no;unadorned:yes;help:no'); 
	//var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:50;dialogHeight:31;dialogLeft:5;dialogTop:30;edge:sunken;scroll:no;unadorned:yes;help:no');
    if ( object != null )  
    {
        if (object[0] != "")
        {
            if(ind == "1")
            {
                txtAssetCode_PK.SetDataText(object[0]);
                txtAssetCode.SetDataText(object[1]);
                txtAssetCode_NM.SetDataText(object[2]);
            }
            if(ind == "2")
            {
                txtDeprCode_PK.SetDataText(object[0]);
                txtDeprCode.SetDataText(object[1]);
                txtDeprCode_NM.SetDataText(object[2]);
            }   
            if(ind == "3")
            {
                txtExpeCode_PK.SetDataText(object[0]);
                txtExpeCode.SetDataText(object[1]);
                txtExpeCode_NM.SetDataText(object[2]);
            } 
            /*if(ind == "4")
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
            } */
        }
    }    

}

function resetAcc(ind)
{
    if(ind == "1")
    {
        txtAssetCode_PK.SetDataText("");
        txtAssetCode.SetDataText("");
        txtAssetCode_NM.SetDataText("");
    }
    if(ind == "2")
    {
        txtDeprCode_PK.SetDataText("");
        txtDeprCode.SetDataText("");
        txtDeprCode_NM.SetDataText("");
    }   
    if(ind == "3")
    {
        txtExpeCode_PK.SetDataText("");
        txtExpeCode.SetDataText("");
        txtExpeCode_NM.SetDataText("");
    } 
}
function OnChangeReportType()
{
    var tmp="";
    switch(lstReportType.GetData())
    {
        case "1":
             dtFrom.SetEnable(1);
        break;
        case "2":
            dtFrom.SetEnable(1);
        break;
        case "3":
            dtFrom.SetEnable(0);
            tmp=dtTo.GetData();
            tmp=tmp.substr(0,4) + '01';
            dtFrom.SetDataText(tmp);
        break;
    }
}

function Popup_PL()
{
	var fpath = System.RootURL + "/standard/forms/gf/co/gfco002005.aspx?comm_code=" + "" + "&comm_nm=" + '' + "&company=" + lstCOMPANY.GetData() + '&dsqlid=AC_SEL_PL_POPUP&col_code=' + "PL CODE" + '&col_nm=' + "PL NAME";
	var object = System.OpenModal(fpath, 600, 500, 'resizable:yes;status:yes');
	{
	if (object != null) 
		{
		if (object[0] != 0) 
			{
				txtPL_CD.SetDataText(object[0]);
				txtPL_NM.SetDataText(object[1]);
				txtPL_PK.SetDataText(object[2]);
			} 
		}
	}
}
</script>

<body style="margin:0; padding:0;">
<gw:data id="datDeptData" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="ac_sel_60130150_list_dept" > 
                <input>
                    <input bind="lstCOMPANY" /> 
                </input> 
                <output>
                    <output bind="lstDEPT" />
                </output>
            </dso> 
        </xml> 
    </gw:data>

<gw:data id="datFixedAsset" onreceive="OnDataReceive(this)" >
        <xml>
            <dso type="grid" function="ac_sel_60130150_fa_depr_list">
                <input bind="grdFixedAsset">
                    <input bind="lstCOMPANY"/>
                     <input bind="lstKIND_CODE"/>
                     <input bind="lstDEPT"/>
                     <input bind="dtFrom"/>
                     <input bind="dtTo"/>
                     <input bind="txtAssetCode"/>
                     <input bind="txtDeprCode"/>
                     <input bind="txtExpeCode"/>
                     <input bind="lstSTATUS"/>
                     <input bind="txtbookccy"/>
                     <input bind="txtAsset"/>
                     <input bind="lstAsset_Type"/>
					 <input bind="txtPL_PK"/>		 
                </input>
                <output bind="grdFixedAsset"/>
            </dso>
        </xml>
    </gw:data> 
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
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
<table width="100%" cellpadding="0" cellspacing="0" border="1" height="100%">
    <tr height="18%" >
        <td>
            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td width="10%"></td>
                    <td width="10%"></td>
                    <td width="5%"></td>
                    <td width="10%"></td>
                    <td width="12%"></td>
                    <td width="6%"></td>
					<td width="14%"></td>
					<td width="3%"></td>
                    <td width="10%"></td>
                    <td width="12%"></td>
                    <td width="8%"></td>
                </tr>                    
                <tr>
                    <td align="right">Company&nbsp;</td>
                    <td colspan="3"><gw:list id="lstCOMPANY" styles='width:100%;height:22' onchange="OnSearch()">
                        <data><%=CtlLib.SetListDataSQL("SELECT PK, PARTNER_NAME FROM TCO_COMPANY WHERE DEL_IF=0")%>
                        </data></gw:list></td>
                    <td align="right"><a title="Click here to show Account" onClick="GetAccount('1')" href="#tips" ><font color="blue" ><b>Asset Accnt. code&nbsp;</b></font></a></td>
                    <td><gw:textbox id="txtAssetCode" styles="width:100%;" /></td>
					<td><gw:textbox id="txtAssetCode_NM" styles="width:100%;" /></td>
					<td><gw:imgBtn id="ibtnFaAccReset" img="reset"  alt="reset acc" onclick="resetAcc('1')" /></td>
                    <td align="right">Status </td>
                    <td><gw:list id="lstSTATUS" value = 'A' styles='width:70%' onchange="OnSearch()" /></td>
                    <td>
                        <table>
                            <tr>
                                <td><gw:imgBtn id="btnSearch" img="search"   alt="Search"  onclick="OnSearch()" styles="width:50%"/></td>
                                <td><gw:button id="btnPrint"  img="excel" text="Print"  alt="Print"  onclick="OnReport()" styles="width:50%"/></td>
                            </tr>
                        </table>                                                
                    </td>
                </tr>
                <tr>
                    <td align="right">Kind code</td>
                    <td colspan="3"><gw:list id="lstKIND_CODE" styles='width:100%' onchange="OnSearch()" /></td> 
                    <td align="right"><a title="Click here to show Account" onClick="GetAccount('2')" href="#tips" ><font color="blue" ><b>Depr Accnt. Code&nbsp;</b></font></a></td>
                    <td><gw:textbox id="txtDeprCode" styles="width:100%" /></td>
					<td><gw:textbox id="txtDeprCode_NM" styles="width:100%" /></td>	
					<td><gw:imgBtn id="ibtnDeprAccReset" img="reset"  alt="reset acc" onclick="resetAcc('2')" /></td>					
                    <td align="right">Department &nbsp;</td>
                    <td colspan="2"><gw:list id="lstDEPT" value='ALL' maxlen = "100" styles='width:100%' onchange="" /></td>
                </tr>
                <tr>
                    <td align="right">From month&nbsp; </td>
                    <td><gw:datebox id="dtFrom" styles='width:100%;' type=month onchange="OnSearch()" lang="<%=Session("Lang")%>"/></td>
                    <td align="right">To&nbsp; </td>
                    <td><gw:datebox id="dtTo" styles='width:100%;' type=month onchange="OnSearch();OnChangeReportType();" lang="<%=Session("Lang")%>"/></td>
                    <td align="right"><a title="Click here to show Account" onClick="GetAccount('3')" href="#tips" ><font color="blue" ><b>Expe. Accnt. Code&nbsp;</b></font></a></td>
                    <td><gw:textbox id="txtExpeCode" styles="width:100%;" /></td>                        
					<td><gw:textbox id="txtExpeCode_NM" styles="width:100%;" /></td>
					<td><gw:imgBtn id="ibtnExpeAccReset" img="reset"  alt="reset acc" onclick="resetAcc('3')" /></td>
                    <td align="right">Report type</td>
                    <td colspan="2"><gw:list  id="lstReportType" styles="width:100%" onchange="OnChangeReportType()" ></gw:list></td>
                </tr>
				  <tr>
                    <td style="width: " align="right">Asset Type</td>
                    <td style="width: " colspan='3'>
						<table style='width:100%'>
							<tr>
								<td width='30%'><gw:list id="lstAsset_Type" styles="width: 100%" onchange="OnSearch()" /></td>
								<td style='white-space:nowrap' align="right" >Asset</td>
								<td width='70%'><gw:textbox id="txtAsset" onenterkey="OnSearch()" styles="width:100%;" /></td> 
							</tr>
						</table>
					</td>
					<td align="right"><a title="Click here to show PL" onClick="Popup_PL()" href="#tips" ><font color="blue" ><b>PL&nbsp;</b></font></a></td>
					<td width=""><gw:textbox id="txtPL_CD" onenterkey="onSearch()" styles='width:100%' /></td>
					<td width="" colspan=""><gw:textbox id="txtPL_NM" styles='width:100%'/></td>
					<td><gw:imgBtn id="ibtnExpeAccReset" img="reset"  alt="reset PL" onclick="txtPL_CD.text='';txtPL_NM.text='';txtPL_PK.text=''" /></td>
                    <td align="right">Language</td>
                    <td colspan="2"><gw:list  id="lstLanguage" styles="width:100%" onchange="" /></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr height="82%">
        <td >
            <gw:grid id='grdFixedAsset'
                header  ='No|Asset Code|Name of fixed assets|Kind|Qty|Date of installation|Estimate life (year)|Estimate life(month)|Original cost|Depre.per month|Depreciated|Acc. Depreciation|Remain Amt|Depr. Acc|Expense Acc|PL Code|PL Name'
                format  ='0|0|0|0|1|4|1|1|0|0|0|0|0|0|0|0|0'
                aligns  ='1|0|0|0|0|3|0|0|3|3|3|3|3|0|0|0|0'
                defaults='||||||||||||||||'
                editcol ='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                widths  ='600|2000|3000|1000|800|1100|1200|1200|2000|2000|2000|2000|2000|1500|2000|0|0'
                sorting ='T'
                styles  ='width:100%; height:100%'/>
        </td>
    </tr>
</table>
<!---------------------------------------------------------------------------------------------------->
<gw:textbox id="txtAssetCode_PK" style="display:none; " />
<gw:textbox id="txtDeprCode_PK" style="display:none; " />
<gw:textbox id="txtExpeCode_PK" style="display:none; " />
<gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
<gw:textbox id="txtbookccy" style="display:none; " />
<gw:textbox id="txtPL_PK" styles='width:100%;display:none' />
</body>
</html>