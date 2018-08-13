<!-- #include file="../../../../system/lib/form.inc"  -->
 <%CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
    var ctlGroup;
    var bChange_All = false;
    var binit = true;
    var v_language = "<%=Session("SESSION_LANG")%>";
var startTime, interval_time
function BodyInit() {
    dtFrom_Date.SetEnable(false);
    dtTo_Date.SetEnable(false);
    txtResignCheck.text = "<%=CtlLib.SetDataSQL("SELECT 1 FROM VHR_HR_CODE A WHERE A.ID='HR0117' AND ROWNUM=1") %>";
    if (txtResignCheck.text == "1") {
        var tmp = "<%=CtlLib.SetListDataSQL("select a.Code,a.CODE_NM from thr_code_master b,thr_code_detail a  where b.pk=a.THR_CODE_MASTER_PK and a.del_if=0 and b.del_if=0 and b.ID='HR0117'")%>";
        tmp += "|ALL|Select All";
        lstTimes.SetDataText(tmp);
    }
    else
        lstTimes.SetDataText("|ALL|Select All");

    idTimes.style.display = 'none';
    lstTimes.style.display = 'none';

    lstTimes.value = 'ALL';
    if (v_language != "ENG")
        System.Translate(document);
    idemp_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text = "<%=session("HR_LEVEL")%>";
    if ((Trim(idemp_pk.text) != "") && (txtHr_level.text == "1")) //QUYEN BI GIOI HAN 
         datUser_info.Call();
    else {
        binit = false;
        datGet_from_to.Call();
    }

}

//------------------------------------
function OnChangeOption(form, obj) {
    form.optMonthReport[obj - 1].checked = true;
}
//------------------------------------
function OnShowPopup() {
    var strcom;
    var fpath = System.RootURL + "/standard/forms/ch/ae/chae00010_org.aspx?";
    var obj = window.showModalDialog(fpath, this, 'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:200;dialogTop:360;edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj != null) {
        lstOrg_1.value = obj;
        lstOrg_2.value = obj;
        lstOrg_3.value = obj;
        lstOrg_4.value = obj;
    }

}


//------------------------------------

//------------------------------------
function OnChangeMonth() {
    txtResult.text = "";
    datGet_from_to.Call();
}

function OnChangeTimes() {

    txtResult.text = "";
    datGet_from_to.Call();

}

function SetDeptAll() {
    if (txtHr_level.text == "6")
        txtDeptData.text = txtDeptData.text + "|ALL|Select All";
    bChange_All = true;

    lstOrg_1.SetDataText(txtorg_tmp.text);
    lstOrg_2.SetDataText(txtorg_tmp.text);
    lstOrg_3.SetDataText(txtorg_tmp.text);
    lstOrg_4.SetDataText(txtorg_tmp.text);

}
//-----------------------------------------------------
function OnDataReceive(obj) {
    switch (obj.id) {
       
        case "datUser_info":
            {
                SetDeptAll();
                break;
            }
        case "datGet_from_to":
            {
                datProcess_chrm00020_1.Call();
                break;
            } 
        case "datProcess_chrm00020":
            if (txtResult.text == '0') {
                var iflag = txtFlag.text;
                alert(iflag + " complete. \n Thực hiện thành công.")
                clear_Interval(idInterval);
                idInterval.text = "Complete."
                datProcess_chrm00020_1.Call();
            }
            else {
                alert("Error: Uncomplete.\n Lỗi: Thực hiện thành công.")
                clear_Interval(idInterval);
                idInterval.text = "Uncomplete."
                datProcess_chrm00020_1.Call();
            }
            break;
        
        case "datProcess_chrm00020_1":
            if (txtResult.text == "0")  //da dong 
            {
                icoProcess.SetEnable(0);
                icoOpen.SetEnable(1);
                icoClose.SetEnable(0);
            }
            else
            {
                icoProcess.SetEnable(1);
                icoOpen.SetEnable(0);
                icoClose.SetEnable(1);
            }
            break;

        case "datFind_Report":
            {
                if (Reports.optMonthReport[0].checked) {
                    var url = System.RootURL + '/standard/reports/hr/me/' + txtReport_tmp.text + '?l_tco_dept_pk=' + lstOrg_1.value + '&l_dept_nm=' + lstOrg_1.GetText() + '&l_thr_group_pk=' + lstGrp_Code_1.value + '&l_emp_id=' + txtEmp_ID_1.text + '&l_work_mon=' + dtMonth.value + '&l_from_dt=' + dtFrom_Date.value + '&l_to_dt=' + dtTo_Date.value + '&l_meal_emp_type=' + lstMealEmpType_1.value;
                }
                if (Reports.optMonthReport[1].checked) {
                    var url = System.RootURL + '/standard/reports/hr/me/' + txtReport_tmp.text + '?l_tco_dept_pk=' + lstOrg_2.value + '&l_dept_nm=' + lstOrg_2.GetText() + '&l_thr_group_pk=' + lstGrp_Code_2.value + '&l_emp_id=' + txtEmp_ID_2.text + '&l_work_mon=' + dtMonth.value + '&l_from_dt=' + dtFrom_Date.value + '&l_to_dt=' + dtTo_Date.value + '&l_meal_emp_type=' + lstMealEmpType_2.value;
                }
                else if (Reports.optMonthReport[2].checked) {
                    var url = System.RootURL + '/standard/reports/hr/me/' + txtReport_tmp.text + '?l_tco_dept_pk=' + lstOrg_3.value + '&l_dept_nm=' + lstOrg_3.GetText() + '&l_thr_group_pk=' + lstGrp_Code_3.value + '&l_emp_id=' + txtEmp_ID_3.text + '&l_work_mon=' + dtMonth.value + '&l_from_dt=' + dtFrom_Date.value + '&l_to_dt=' + dtTo_Date.value + '&l_meal_emp_type=' + lstMealEmpType_3.value;
                    url += "&l_user=" + "<%=Session("USER_ID")%>";
                }
                else if (Reports.optMonthReport[3].checked) {
                    var url = System.RootURL + '/standard/reports/hr/me/' + txtReport_tmp.text + '?l_tco_dept_pk=' + lstOrg_4.value + '&l_dept_nm=' + lstOrg_4.GetText() + '&l_thr_group_pk=' + lstGrp_Code_4.value + '&l_emp_id=' + txtEmp_ID_4.text + '&l_work_mon=' + dtMonth.value + '&l_from_dt=' + dtFrom_Date.value + '&l_to_dt=' + dtTo_Date.value + '&l_meal_emp_type=' + lstMealEmpType_4.value;
                    url += "&l_user=" + "<%=Session("USER_ID")%>";
                }
				 else if (Reports.optMonthReport[4].checked) {
                    var url = System.RootURL + '/standard/reports/hr/me/' + txtReport_tmp.text + '?l_tco_dept_pk=' + '' + '&l_dept_nm=' + '' + '&l_thr_group_pk=' + '' + '&l_emp_id=' + '' + '&l_work_mon=' + dtMonth.value + '&l_from_dt=' + dtFrom_Date.value + '&l_to_dt=' + dtTo_Date.value + '&l_meal_emp_type=' + '' ;
                    url += "&l_user=" + "<%=Session("USER_ID")%>";
					}

                window.open(url);
            }
            break;
}

}
//-------------------------------------------------
function on_Process(flag)
{
    txtFlag.text = flag;

    if (confirm("Do you want to " + txtFlag.text + "?")) {
        idInterval.text = "";
        set_Interval(1000)
        datProcess_chrm00020.Call();
    }
}
//-------------------------------
function set_Interval(x) {
    startTime = new Date().valueOf();
    interval_time = setInterval("clock(" + startTime + "," + x + ")", x);
}
//------------------------------
function clock(start, x) {
    var d = new Date()
    idInterval.text = Math.round((d.valueOf() - start) / x);

}
//-------------------------------
function clear_Interval(obj) {
    clearInterval(interval_time);
    obj.text = "";
}
function OnReport() {
	
    if (Reports.optMonthReport[0].checked)
        txtReport_tmp.text = "rpt_chrm00020_1.aspx";
    else if (Reports.optMonthReport[1].checked)
        txtReport_tmp.text = "rpt_chrm00020_2.aspx";
    else if (Reports.optMonthReport[2].checked)
        txtReport_tmp.text = "rpt_chrm00020_3.aspx";
    else if (Reports.optMonthReport[3].checked)
        txtReport_tmp.text = "rpt_chrm00020_4.aspx";
	else if(Reports.optMonthReport[4].checked)
		txtReport_tmp.text = "rpt_chrm00020_5.aspx";
    datFind_Report.Call();

}

function onChangeStatus() {
    txtSalary.text = "01";
    if (lstMealTime.value == 'R') {
        if (txtResignCheck.text == "1") {
            idTimes.style.display = '';
            lstTimes.style.display = '';
            lstTimes.GetControl().options.selectedIndex = 0;
            txtSalary.text = "02";
        }
    }
    else {
        lstTimes.value = 'ALL';
        txtSalary.text = "01";
        idTimes.style.display = 'none';
        lstTimes.style.display = 'none';
    }

    txtResult.text = "";
    datGet_from_to.Call();
}
</script>
<style type="text/css">
<!--
.textColor {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #FFFFFF;
	font-weight: bold;
	font-size: 11px;
}
-->
</style>

<style>
.top { border-top:1px solid #034D72; }
.topright { border-top :1px solid #034D72;
			border-right: 1px solid #034D72;;padding-right:10px
			}
.topleft {border-left:1px solid #034D72; 
			border-top :1px solid #034D72;
			}
.left { border-left:1px solid #034D72; }
.right { border-right:1px solid #034D72;padding-right:10px }
.bottomright { border-bottom:1px solid #034D72; 
				border-right:1px solid #034D72; padding-right:10px
				}
.bottomleft { border-bottom:1px solid #034D72; 
				border-left:1px solid #034D72;;
			}
.bottom { border-bottom:1px solid #034D72; }

.topleftbottom { border-left:1px solid #034D72; 
			border-top :1px solid #034D72;
			border-bottom:1px solid #034D72; }

.topbottom {border-top :1px solid #034D72;
			border-bottom:1px solid #034D72; }

.toprightbottom { border-right:1px solid #034D72; 
			border-top :1px solid #034D72;
			border-bottom:1px solid #034D72; }
	
#up { background-color:#DFF2FF; }
#down { background-color:#EAEAEA; }

</style>

<body>
<!------------main control---------------------->

<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2"  > 
                <input>
                    <input bind="idemp_pk" />
                </input> 
                <output>
                    <output bind="txtorg_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>


<gw:data id="datGet_from_to" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_PRO_GET_FROM_TO" > 
                <input>
                    <input bind="txtSalary" />
                    <input bind="dtMonth" />
                    <input bind="lstTimes" />
                </input> 
                <output>
                    <output bind="dtFrom_Date" />
                    <output bind="dtTo_Date" />
                    <output bind="txtResult" />
                    <output bind="txtProcess" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------->
<gw:data id="datProcess_chrm00020" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CHRM00020_0" > 
                <input>
                    <input bind="txtFlag" />
                    <input bind="dtMonth" />
                    <input bind="dtFrom_Date" />
                    <input bind="dtTo_Date" />
                    <input bind="lstLocation_dept" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>



<gw:data id="datProcess_chrm00020_1" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CHRM00020_1" > 
                <input>
                    <input bind="dtMonth" /> 
                </input> 
                <output>
                     <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datFind_Report" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_PRO_FIND_REPORT" > 
                <input>
                    <input bind="txtReport_tmp" /> 
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!--------------------main table--------------------------------->
<form name="Reports" id="form2" > 
<table   cellpadding="0" cellspacing="0" style="width:100%;height:50%"   valign="middle" border="0" >
<tr height="30%" >
      <td style="width:100%">
        <table cellpadding="0" style="line-height:normal; padding:0" cellspacing="0" style="width:100%;height:100%" width="100%"  border="0" >
            <tr>
                <td width="90%" colspan=45  align="center" valign="middle" class="topleft" style="color:#cc0066; font-size:16">PROCESSING MEAL CHECKING</td>
                <td width="10%" colspan=5 align="right" valign="middle" class="topright">&nbsp;</td>
            </tr>
            <tr>
                <td colspan=4  align="right" width="8%" valign="middle" class="left" style="font-size:13">Location</td>
                <td colspan=5  align="left" width="10%" valign="middle"  >
                            <gw:list  id="lstLocation_dept" value='ALL' maxlen = "100" styles='width:100%' ><data>|ALL|Select All</data></gw:list> 
                 </td>
                <td colspan=3  align="right" width="6%" valign="middle" style="font-size:13"></td>
                <td colspan=4  align="right" width="8%" valign="middle"  style="font-size:13"><font>Month</font></td>
                <td colspan=4  align="left"  width="8%" valign="middle"  ><gw:datebox id="dtMonth"  text="" maxlen = "10" type="month" lang="<%=Session("Lang")%>" onchange="OnChangeMonth()" /> </td>
                <td colspan=3  align="right" width="6%" valign="middle" style="font-size:13"><b><gw:label id="idTimes" text="Times" styles="width:100%" ></gw:label></b></td>
                <td colspan=4  align="left"  width="8%" valign="middle"  ><gw:list  id="lstTimes" value='ALL' maxlen = "100" styles='width:100%' onchange="OnChangeTimes()" ></gw:list>
                </td> 
                <td colspan=3  align="right" width="6%" valign="middle"  style="font-size:13">Date</td>
                <td colspan=4  align="right" width="8%" valign="middle"  ><gw:datebox id="dtFrom_Date"  text="" styles="width:100%"  lang="<%=Session("Lang")%>" /> </td>
                <td colspan=1  align="center" width="2%" valign="middle"  style="font-size:13"><b >~</b></td>
                <td colspan=4  align="left"  width="8%" valign="middle"  ><gw:datebox id="dtTo_Date"  styles="width:100%"   lang="<%=Session("Lang")%>" /> </td>
                <td colspan=3  align="center" width="6%" valign="middle" style="color=#FF3300"><gw:label id="idInterval" text="" maxlen="100" styles="width:100%" ></gw:label></td>
                <td colspan=2 align="right"  width="4%" valign="middle" ><gw:icon id="icoProcess" img="in" text="Process" onclick="on_Process('PROCESS')" /></td>
                <td colspan=3 align="right" width="6%" valign="middle" ><gw:icon id="icoOpen" img="in" text="OPEN" onclick="on_Process('OPEN')" /></td>
                <td colspan=3 align="center" width="6%" valign="middle" class="right"><gw:icon id="icoClose" img="in" text="CLOSE" onclick="on_Process('CLOSE')" /></td>
            </tr>
        </table>
      </td>
      
    </tr>
    <tr height="70%">
	    <td  style="width:100%;height:100%">
		    <table style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0">
		        <tr style="width:100%;height:7%" >
                    <td width="95%" colspan="8"  align="center" valign="middle" class="topleft"style="color:#cc0066; font-size:16">REPORT</td>
                    <td width="5%" align="right" valign="middle" class="topright"><gw:imgBtn id="ibtnReport" alt="Excel Report" img="excel" text="Print" onclick="OnReport()" /></td>
                </tr>
			    <tr style="width:100%;height:7%"  > 
                    <td width="20%" colspan=2 align="center" class="left"  style="border-right:0"style="color:#0099cc; font-size:13">Report Name</td>
                    <td width="25%" align="center"  style="border-left:0;border-right:0"><a style="font-size:13" title="Click here to show department" onclick="OnShowPopup()" href="#tips">Organization</a></td>
			        <td width="15%" align="center"  style="border-left:0;border-right:0"style="color:#0099cc; font-size:13">Work Group</td>
                    <td width="5%" align="center"  style="border-left:0;border-right:0"style="color:#0099cc; font-size:13">&nbsp;</td>
                    <td width="15%" align="center"  style="border-left:0;border-right:0"style="color:#0099cc; font-size:13">Meal Employee Type</td>
			        <td width="5%" align="center"  style="border-left:0;border-right:0"style="color:#0099cc; font-size:13">&nbsp;</td>
			        <td width="10%" align="center"   style="border-left:0"style="color:#0099cc; font-size:13">Emp ID</td>
			        <td width="5%" class="right" align="center" valign="middle" class="right"  style="border-left:0">&nbsp;</td>
                </tr>
                <tr height="7%" style="width:100%;"  valign="top"> 
                    <td class="left"  width="2%" valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" checked></td>
                    <td valign="middle" style="font-size:12" width="23%" style="border-left:0;border-right:0">Meal Checking Summary</td>
                    
                    <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstOrg_1" value='ALL' maxlen = "100" styles='width:80%' onchange="OnChangeOption(document.form2,1)" >
                                        <data>
                                        <%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk)  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
                    <td align="center" valign="middle" style="border-left:0;border-right:0"style="color:#0099cc; font-size:13"><gw:list  id="lstGrp_Code_1" value='ALL' maxlen = "100" styles='width:95%' onchange="">
                                        <data><%=CtlLib.SetListDataSQL("select a.pk,a.workgroup_nm from thr_work_group a where a.del_if=0 order by a.workgroup_id")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>                    
			        <td align="center" valign="middle" style="border-left:0;border-right:0">&nbsp;</td>
                    <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstMealEmpType_1" value='ALL' maxlen = "100" styles='width:100%' onchange="OnChangeMealTime()" >
                                        <data>
                                        LIST|IN|Emp of Company|OUT|Out of Company|VIS|Visitor|ALL|Select All
                                        </data>
                                        </gw:list></td>
                    <td align="center" valign="middle" style="border-left:0;border-right:0">&nbsp;</td>
			        <td align="center" valign="middle" style="border-left:0"><gw:textbox id="txtEmp_ID_1" onenterkey   ="OnChangeOption(document.form2,1);OnReport();" styles='width:100%'/></td>
			        <td class="right" align="center" valign="middle" class="right"  style="border-left:0">&nbsp;</td>
                </tr>
                <tr height="7%" style="width:100%;"  valign="top"> 
                    <td class="left"   valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                    
                    <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Meal Checking Detail</td>
                    <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstOrg_2" value='ALL' maxlen = "100" styles='width:80%' onchange="OnChangeOption(document.form2,2)" >
                                        <data>
                                        <%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk)  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
                    <td  align="center" valign="middle" style="border-left:0;border-right:0"style="color:#0099cc; font-size:13"><gw:list  id="lstGrp_Code_2" value='ALL' maxlen = "100" styles='width:95%' onchange="">
                                        <data><%=CtlLib.SetListDataSQL("select a.pk,a.workgroup_nm from thr_work_group a where a.del_if=0 order by a.workgroup_id")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>                                        
			        <td align="center" valign="middle" style="border-left:0;border-right:0">&nbsp;</td>
                    <td width="10%" valign="middle" align="center"  style="border-left:0;border-right:0"><gw:list  id="lstMealEmpType_2" value='ALL' maxlen = "100" styles='width:100%' onchange="OnChangeMealTime()" >
                                        <data>LIST|IN|Emp of Company|OUT|Out of Company|VIS|Visitor|ALL|Select All</data>
                                        </gw:list></td>
                    <td align="center" valign="middle" style="border-left:0;border-right:0">&nbsp;</td>
			        <td align="center" valign="middle"  style="border-left:0"><gw:textbox id="txtEmp_ID_2" onenterkey   ="OnChangeOption(document.form2,2);OnReport(2)" styles='width:100%' /></td>
			        <td class="right" align="center" valign="middle" class="right"  style="border-left:0">&nbsp;</td>
                </tr>
                
                <tr height="7%" style="width:100%;"  valign="top"> 
                    <td class="left"   valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                    
                    <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Meal for Times</td>
                    
                    
                    <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstOrg_3" value='ALL' maxlen = "100" styles='width:80%'onchange="OnChangeOption(document.form2,4)" >
                                        <data>
                                        <%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk)  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
                    <td align="center" valign="middle" style="border-left:0;border-right:0"style="color:#0099cc; font-size:13"><gw:list  id="lstGrp_Code_3" value='ALL' maxlen = "100" styles='width:95%' onchange="">
                                        <data><%=CtlLib.SetListDataSQL("select a.pk,a.workgroup_nm from thr_work_group a where a.del_if=0 order by a.workgroup_id")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>                                        
			        <td align="center" valign="middle" style="border-left:0;border-right:0">&nbsp;</td>
                    <td width="10%" align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstMealEmpType_3" value='ALL' maxlen = "100" styles='width:100%' onchange="" >
                                        <data>LIST|IN|Emp of Company|OUT|Out of Company|VIS|Visitor|ALL|Select All</data></gw:list></td>
                    <td align="center" valign="middle" style="border-left:0;border-right:0">&nbsp;</td>
			        <td align="center" valign="middle" class="center"  style="border-left:0"><gw:textbox id="txtEmp_ID_3" onenterkey   ="OnChangeOption(document.form2,3);OnReport(3)" styles='width:100%'/></td>
			        <td class="right" align="center" valign="middle" class="right"  style="border-left:0">&nbsp;</td>
                </tr>
                <tr height="7%" style="width:100%;"  valign="top"> 
                    <td class="left"   valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                    
                    <td class="center" valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Quantity Of Meals</td>
                    
                    
                    <td class="center" align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstOrg_4" value='ALL' maxlen = "100" styles='width:80%'onchange="OnChangeOption(document.form2,4)" >
                                        <data>
                                        <%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk)  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
                    <td  class="center" align="center" valign="middle" style="border-left:0;border-right:0"style="color:#0099cc; font-size:13"><gw:list  id="lstGrp_Code_4" value='ALL' maxlen = "100" styles='width:95%' onchange="">
                                        <data><%=CtlLib.SetListDataSQL("select a.pk,a.workgroup_nm from thr_work_group a where a.del_if=0 order by a.workgroup_id")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>                                        
			        <td class="center" align="center" valign="middle" style="border-left:0;border-right:0">&nbsp;</td>
                    <td class="center" width="10%" align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstMealEmpType_4" value='ALL' maxlen = "100" styles='width:100%' onchange="" >
                                        <data>LIST|IN|Emp of Company|OUT|Out of Company|VIS|Visitor|ALL|Select All</data></gw:list></td>
                    <td class="center" align="center" valign="middle" style="border-left:0;border-right:0">&nbsp;</td>
			        <td class="center" align="center" valign="middle" class="right"  style="border-left:0"><gw:textbox id="txtEmp_ID_4" onenterkey   ="OnChangeOption(document.form2,4);OnReport(4)" styles='width:100%'/></td>
			        <td class="right" align="center" valign="middle" class="right"  style="border-left:0">&nbsp;</td>
                </tr>
				<tr height="7%" style="width:100%;"  valign="top"> 
                    <td class="bottomleft"   valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                    
                    <td class="bottom" valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Meal Employee Type</td>
                    
                    
                    <td class="bottom" align="center" valign="middle" style="border-left:0;border-right:0">&nbsp;</td>
                    <td  class="bottom" align="center" valign="middle" style="border-left:0;border-right:0"style="color:#0099cc; font-size:13">&nbsp;</td>                                        
			        <td class="bottom" align="center" valign="middle" style="border-left:0;border-right:0">&nbsp;</td>
                    <td class="bottom" width="10%" align="center" valign="middle" style="border-left:0;border-right:0">&nbsp;</td>
                    <td class="bottom" align="center" valign="middle" style="border-left:0;border-right:0">&nbsp;</td>
			        <td class="bottom" align="center" valign="middle" class="right"  style="border-left:0">&nbsp;</td>
			        <td class="bottomright" align="center" valign="middle" class="right"  style="border-left:0">&nbsp;</td>
                </tr>
            </table>
	    </td>
	</tr>	
 </table>
</form>
<gw:textbox id="txtDept" styles="display:none"/>	
<gw:textbox id="txtDeptData" styles="display:none"/>
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>
<gw:textbox id="idemp_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/> 
<gw:textbox id="txtResult" styles="display:none"/> 
<gw:textbox id="txtFlag" styles="display:none"/> 
<gw:textbox id="txtProcess" styles="display:none"/> 
<gw:textbox id="txtReport_tmp" styles="display:none"/> 
<gw:textbox id="txtSalary" styles="display:none" text="01"/> 
<gw:textbox id="txtResignTime" styles="display:none" text=""/> 
<gw:textbox id="txtResignCheck" styles="display:none" text=""/>
<gw:textbox id="txtorg_tmp" styles="display:none"/>
<gw:textbox id="txtReportCode_tmp" styles="display:none"/>
</body>
</html>

