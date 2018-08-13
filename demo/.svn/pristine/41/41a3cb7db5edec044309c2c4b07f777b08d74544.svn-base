<!-- #include file="../../../../system/lib/form.inc" -->

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>genuwin</title>
    
</head>
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<script type="text/javascript" language="javascript">

function BodyInit()
{
    System.Translate(document);
    BindingDataList();
    lstKindCode.SetDataText("ALL");   
    txtProposedByUserPk.text="<%=Session("USER_PK")%>";
   	dso_getCompany.Call();
}

function BindingDataList()
{
    var data1 = "<%= CtlLib.SetListDataSQL(" select pk,PARTNER_NAME from tco_company where del_if = 0") %>";
    var ls_kind_cd = "<%=CtlLib.SetListDataFUNC("SELECT F_COMMONCODE('ACDF0010','01','') FROM DUAL")%>|ALL|Select All"; 
    var ls_lang    = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('COAB0070') FROM DUAL")%>";
    lstCompany.SetDataText(data1);  
    lstKindCode.SetDataText(ls_kind_cd); 
  
   var data = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_DEFAULT('ACBG0040') FROM DUAL")%>";
     arr  = data.split("|");
	 lblBookccy.SetDataText(arr[1]);
     lstLanguage.SetDataText(ls_lang);
     lstLanguage.SetDataText('VIE');
     txtScale.SetDataText('1'); 
	 data =   "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('ACDF0070') FROM DUAL")%>";
	 lstStatus.SetDataText(data);
     var lsAssetType      = "<%=CtlLib.SetListDataFUNC("SELECT SF_A_GET_COMMONCODE('GFQC0025') FROM DUAL")%>|ALL|[SELECT ALL]";
    lstAsset_Type.SetDataText(lsAssetType);
    lstAsset_Type.value = 'ALL';
}


function OnDataReceive(p_oData)
{
    switch(p_oData.id)
    {
        case "datFAList":
            if(grdFA.rows >1)
            {
                for(i=1;i<grdFA.rows;i++)
                {
                    grdFA.SetGridText(i,0,i);
                }
                grdFA.Subtotal(0,2,2,"6!7!8!9","",true,8,"Total");
                grdFA.SetGridText(grdFA.rows-1,0,'');
                grdFA.SetGridText(grdFA.rows-1,1,'');
            } 
        break;
        
      
        break;
        case "dso_sel_change_ccy":
            if(grdFA.rows >1)
            {
                for(i=1;i<grdFA.rows;i++)
                {
                    grdFA.SetGridText(i,0,i);
                }
                grdFA.Subtotal(0,2,2,"6!7!8!9","",true,8,"Total");
                grdFA.SetGridText(grdFA.rows-1,0,'');
                grdFA.SetGridText(grdFA.rows-1,1,'');
            } 
        break;
    }
}

function OnReport(obj)
{
    var rqt = "";
        rqt = "?company_pk="+lstCompany.value+'&KindCode='+lstKindCode.value+'&DeptPK='+txtDepartmentPK.text+'&Status='+lstStatus.value+'&AssetNo='+txtAssetNo.text+'&AssetName='+txtAssetName.text+'&dtFrom='+dtFromMonth.value+'&dtTo='+dtToMonth.value;
       
    switch(obj)
    {
        case 1:
            if(lstLanguage.value=="ENG")
            {
                var url =System.RootURL + '/standard/reports/gf/gf/gfgf00030_eng_posco.aspx'+rqt;
                System.OpenTargetPage(url, "newform" );
            }
            else if(lstLanguage.value=="VIE")
            {
                //var url =System.RootURL + '/standard/reports/gf/gf/gfgf00030_VIE.aspx'+rqt;
                var url =System.RootURL + '/standard/reports/gf/gf/gfgf00030_VIE_posco.aspx'+rqt;  
                System.OpenTargetPage(url, "newform" );
            }
        break;
        case 2:
       var rqt1 = "?company_pk="+lstCompany.value+'&KindCode='+lstKindCode.value+'&DeptPK='+txtDepartmentPK.text+'&Status='+lstStatus.value+'&AssetNo='+txtAssetNo.text+'&AssetName='+txtAssetName.text+'&dtFrom='+dtFromMonth.value+'&dtTo='+dtToMonth.value+'&ccy='+lblBookccy.text+'&unit='+txtScale.text+'&Asset_Type='+lstAsset_Type.value;
            var url =System.RootURL + '/standard/reports/gf/gf/gfgf00030_bbkk.aspx'+rqt1;
            System.OpenTargetPage(url, "newform" );
        break;
    }
         
           
}
function OnSearch()
{
    datFAList.Call("SELECT");
}
function OnChangeAmt()
{
    
        dso_sel_change_ccy.Call("SELECT");
    
}
function onGetDepartment()
{
        var strcom;
        var fpath = System.RootURL + "/standard/forms/60/13/60130140_dept.aspx?";
        //var obj  = System.OpenModal(  fpath , 300 , 200 , 'resizable:yes;status:yes');
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:420;dialogTop:250;edge:sunken;scroll:no;unadorned:yes;help:no');
        if (obj!=null)
        {
            txtDepartmentPK.text=obj;
           
            datDeptData.Call();
        }
}

function onResetDepartment()
{
    txtDepartmentPK.text = "";
   txtDepartmentName.text = ""; 
  txtDepartmenCode.text = ""; 
}
</script>
<body style="margin:0; padding:0;">
<!------------------------------------------------------------------------>
<gw:data id="dso_getCompany" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso type="list" procedure="ac_sel_60130140_get_company" > 
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
<!------------------------------------------------------------------------------------------------------->
<gw:data id="datDeptData" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ac_pro_60130140_dept" > 
                <input>
                    <input bind="txtDepartmentPK" /> 
                    
                </input> 
                <output>
                    
                   <output bind="txtDepartmenCode" /> 
                    <output bind="txtDepartmentName" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datFAList" onreceive="OnDataReceive(this)" >
        <xml>
            <dso type="grid" function="ac_sel_60130140_fa_list">
                <input bind="grdFA">
                    <input bind="lstCompany"/>
                     <input bind="lstKindCode"/>
                     <input bind="txtDepartmentPK"/>
                     <input bind="lstStatus"/>
                     <input bind="txtAssetNo"/>
                     <input bind="txtAssetName"/>
                     <input bind="dtFromMonth"/>
                     <input bind="dtToMonth"/>
                     <input bind="lstAsset_Type"/>
                </input>
                <output bind="grdFA"/>
            </dso>
        </xml>
    </gw:data>

 <gw:data id="dso_sel_change_ccy" onreceive="OnDataReceive(this)">
        <xml>
            <dso type="grid" function="ac_sel_60130140_change_ccy">
                <input bind="grid_bs">
                    <input bind="lstCompany"/>
                     <input bind="lstKindCode"/>
                     <input bind="txtDepartmentPK"/>
                     <input bind="lstStatus"/>
                     <input bind="txtAssetNo"/>
                     <input bind="txtAssetName"/>
                     <input bind="dtFromMonth"/>
                     <input bind="dtToMonth"/>
                    <input bind="txtScale"/>
                    <input bind="lstAsset_Type"/>
                </input>
                <output bind="grdFA"/>
            </dso>
        </xml>
    </gw:data>
<table style="height:100%;width:100%" cellpadding="0" cellspacing="0" border="1">
    <tr style="height:2%">
        <td align="right">
            <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
						<td width="85%">&nbsp;</td>
                        <td width="5%" align="right"><gw:imgBtn id="btnSearch"     img="search"    alt="Search"          onclick="OnSearch()" /></td>
                        <td width="5%"><gw:button id="btnPrint"     img="excel" text="Print"   alt="Danh Sách Tài Sản Cố Định"       onclick="OnReport(1)" /></td>
                        <td width="5%"><gw:button id="btnPrint1"   img="excel" text="Print"   alt="Print Biên bản kiểm kê"          onclick="OnReport(2)" /></td>
                    </tr>
            </table>
        </td>
    </tr>
   <tr style="height:6%">
        <td>
             <table border="0" cellpadding="0" cellspacing="0" width="100%">
                    <tr>
                        <td  width="10%" ></td>
                        <td  width="25%"></td>
                        <td  width="10%"></td>
                        <td  width="25%"></td>
                        <td  width="10%"></td>
                        <td width="15%"></td>
                        <td width="5%"></td>
                    </tr> 
                    <tr>
                        <td align="right">Company&nbsp;</td>
                        <td><gw:list id="lstCompany" styles="width:100%;" onchange="onChangeCompany()"></gw:list></td>
                        <td align="right" ><a title="Click here to get Department" onclick="onGetDepartment()" href="#tips" >Department&nbsp;</a></td>
                        <td >
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="35%"><gw:textbox id="txtDepartmenCode"  readonly="true"  styles="width:100%;"/></td>
                                    <td width="65%">
                                        <gw:textbox id="txtDepartmentName"  readonly="true"   styles="width:100%;"/>
                                    </td>
                                    <td width="10%"><gw:imgBtn id="btnResetDepartment" img="reset"  alt="Reset Department" onclick="onResetDepartment()" /></td>
                                </tr>
                            </table>
                        </td>
                        <td  align=right>Unit&nbsp;</td>
                        <td ><gw:textbox id="txtScale" styles='width:70%' type="number" format="###,###,###R" onenterkey="OnChangeAmt()" /></td>
                        <td align=left><gw:label id="lblBookccy" styles="width:100%;color:red; font-weight:700;" /></td>
                    </tr>
                    <tr>
                        <td align="right">Kind&nbsp;</td>
                        <td><gw:list id="lstKindCode" styles='width:100%' onchange="OnSearch()"></gw:list></td>
                        <td align="right">From Date&nbsp;</td>
                        <td>
                            <table width="100%">
                                <tr>
                                    <td><gw:datebox id="dtFromMonth" styles='width:100%;' type=date onchange="OnSearch()" lang="<%=Session("Lang")%>"/></td>
                                    <td align=center>~</td>
                                    <td><gw:datebox id="dtToMonth" styles='width:100%;' type=date onchange="OnSearch()" lang="<%=Session("Lang")%>"/> </td>
                                </tr>
                            </table>
                        </td>
                        
                       <td align="right">Language&nbsp;</td>
                       <td colspan="2"><gw:list id="lstLanguage" styles="width:100%;" ></gw:list></td>
                    </tr>
                    <tr>
                        <td align="right">Asset No&nbsp;</td>
                        <td>
                            <table width="100%">
                                <tr>
                                    <td width='35%'><gw:textbox id="txtAssetNo" styles='width:100%'></gw:textbox></td>
                                    <td style="width:30% " align="right">Asset Type</td>
                                    <td style="width:35% " colspan=''><gw:list id="lstAsset_Type" styles="width: 100%" onchange="OnSearch()" /></td>

                                </tr>
                            </table>
                        </td>
                        
                        <td align="right">Asset Name&nbsp;</td>
                        <td><gw:textbox id="txtAssetName" styles='width:100%'></gw:textbox></td>
                        <td align="right">Status&nbsp;</td>
                        <td colspan="2"><gw:list id="lstStatus" value = 'A' styles='width:100%' onchange="OnSearch()" /></td>
                        
                    </tr>
            </table>
        </td>
   </tr> 
   <tr style="height:92%"> 
        <td height="100%">
             <gw:grid id='grdFA'
                            header='No|Status|Asset No|Asset Name|Kind Code|PIS Date|Orginal Cost|Depr.Amt.|Accum. Depr.Amt.|Remaining Amt.'
                            format='0|0|0|0|0|4|1|1|1|1'
                            aligns='1|0|0|0|0|0|3|3|3|3'
                            defaults='|||||||||'
                            editcol='0|0|0|0|0|0|0|0|0|0'
                            widths='600|800|1800|2500|1200|1500|1500|1500|1700|1500'
                            sorting='T'
                            styles='width:100%; height:100%'
                            />
        
        </td>
   </tr>
</table>
<gw:textbox id="txtDeptData" styles="display:none;"/>
<gw:textbox id="txtReturn"                  style="display:none"/>
<gw:textbox id="txtType"                  style="display:none"/>
<gw:textbox id="txtUpperDept"                  style="display:none"/>
<gw:textbox id="txtDepartmentPK"   styles="display:none"/>
 <gw:list  id="lstDept_Code" styles="display:none;" ></gw:list>
 <gw:textbox id="txtProposedByUserPk"       styles='display:none'/>
<!---------------------------------------------------------------------------------------------------->
</body>
</html>