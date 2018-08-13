<!-- #include file="../../../../system/lib/form.inc"  -->
<%CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>Untitled Page</title>
</head>
<script>
    var strcodereturn;
    var user;
    var flag_header = true;
    var v_language = "<%=Session("SESSION_LANG")%>";
	
	G2_SEQ = 0,
	G2_PK = 1,
	G2_THR_EMP_PK = 2,
	G2_ORG_ID = 3,
	G2_ORG_NAME = 4,
	G2_EMPLOYEE_ID = 5,
	G2_EMPLOYEE_NAME = 6,
	G2_ABSENCE_DATE = 7,
	G2_START_HOURS = 8,
	G2_END_HOURS = 9,
	G2_TOTAL_HOURS = 10,
	G2_DAYS = 11,
	G2_ABSENCE_TYPE = 12,
	G2_REG_TYPE = 13,
	G2_DESCRIPTION = 14,
	G2_SEQUENCE = 15
	;
function BodyInit() {
    System.Translate_V2(document, System.Menu.GetMenuPS());
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text = "<%=session("HR_LEVEL")%>";
    user = "<%=session("USER_ID")%>";
    
    
	BindingDataList();
	
    if ((Trim(iduser_pk.text) != "") && (txtHr_level.text == "1")) //QUYEN BI GIOI HAN 
    {
        datUser_info.Call();
    }
    
}
function BindingDataList()
{
	var data;
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HRTI01100', 1, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>"; 
    lstReport.SetDataText(data);
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg.SetDataText(data);
	lstOrg.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstWG.SetDataText(data);
	lstWG.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstStatus.SetDataText(data);
	lstStatus.value ="A";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0003', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstAbs_Type.SetDataText(data);
	lstAbs_Type.value ="ALL";
	
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ABSENCE', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";	
	lstAbs_Kind.SetDataText(data);
	lstAbs_Kind.value ="ALL";
	
	var t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_FNM from vhr_hr_code where id='HR0003' order by code_nm")%>";
    grdAbsence.SetComboFormat(G2_ABSENCE_TYPE,t1);
	grdAbsence.SetComboFormat(G2_REG_TYPE, '#1;Ngắn hạn|#2;Dài hạn');
	
	data = (v_language =="ENG")?"|1|Daily|2|Weekly|3|Monthly":"|1|Ngày|2|Tuần|3|Tháng";
	lstPeriod.SetDataText(data);
	
	ChangeColorItem(lstOrg.GetControl());
	
	var now = new Date(); 
	var ldate;
	ldate=dtFromDate.value ; 
	ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
	dtFromDate.value=ldate ;
	
}
//-----------------------------------------------
function ChangeColorItem(lstctl) {
    var slevel1, slevel2, slevel3, slevel4;
    for (var i = 0; i < lstctl.options.length; i++) {
        slevel1 = lstctl.options.item(i).text.substr(0, 1);
        slevel2 = lstctl.options.item(i).text.substr(0, 3);
        slevel3 = lstctl.options.item(i).text.substr(0, 5);
        slevel4 = lstctl.options.item(i).text.substr(0, 7);
        if (slevel4 != ".......") {
            if (slevel3 == ".....") {
                lstctl.options.item(i).style.color = "0066CC";
            }
            else {
                if (slevel2 == "...") {
                    lstctl.options.item(i).style.color = "FF4500";
                }
                else {
                    if (slevel1 == ".")
                        lstctl.options.item(i).style.color = "FF00FF";  //FF3333
                }
            }
        }
    }
}


//-------------------------------------------------
function OnShowPopup() {
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
	var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj != null) {
        lstOrg.value = obj
        
       
    }

}

//----------------------------------------------
function OnDataReceive(obj) 
{

    if (obj.id == "data_hrti01100_0") {
        lblRecord.text = grdAbsence.rows - 1;
        auto_resize_column(grdAbsence, 0, grdAbsence.cols - 1, 0)  
    }
    
    else if (obj.id == "datUser_info") {
        ChangeColorItem(lstOrg.GetControl());
    }
    else if (obj.id == "datFind_Report") {
        var url = System.RootURL;
        switch (txtReportCode_tmp.text) {
            case "116":  
                {
                    
					url = url + txtReport_tmp.text + '?p_tco_org_pk=' + lstOrg.value + '&p_wg=' + lstWG.value + '&p_search_temp=' + txtEmployee.text + '&p_absence_type=' + lstAbs_Type.value ;
					url = url + '&p_from_date=' + dtFromDate.value + '&p_to_date=' + dtToDate.value + '&p_status=' + lstStatus.value + '&p_reg_kind=' + lstAbs_Kind.value + '&p_lang=' + v_language ;
                    break;
                }

            case "117": 
                {
                    url = url + txtReport_tmp.text + '?p_user=' + user + '&p_tco_org_pk=' + lstOrg.value + '&p_wg=' + lstWG.value + '&p_nation_type=' + lstNation.value + '&p_search_temp=' + txtEmployee.text + '&p_absence_type=' + lstAbs_Type.value + '&p_absence_type_text=' + lstAbs_Type.GetText();
                    url = url + '&p_print_type=' + lstPrint_Type.value + '&p_from_date=' + dtFromDate.value + '&p_to_date=' + dtToDate.value + '&p_from_date_text=' + dtFromDate.text + '&p_to_date_text=' + dtToDate.text + '&p_emp_type=' + lstEmp_Type.value;
                    break;
                }

            case "118":  
                {
                    url = url + txtReport_tmp.text + '?p_user=' + user + '&p_tco_org_pk=' + lstOrg.value + '&p_wg=' + lstWG.value + '&p_nation_type=' + lstNation.value + '&p_search_temp=' + txtEmployee.text + '&p_absence_type=' + lstAbs_Type.value + '&p_absence_type_text=' + lstAbs_Type.GetText();
                    url = url + '&p_print_type=' + lstPrint_Type.value + '&p_from_date=' + dtFromDate.value + '&p_to_date=' + dtToDate.value + '&p_from_date_text=' + dtFromDate.text + '&p_to_date_text=' + dtToDate.text + '&p_days=' + txtDay.text + '&p_emp_type=' + lstEmp_Type.value + '&p_value=' + lstValue.value;

                    break;
                }
        }
        window.open(url);
    }
}

//------------------------------------------------
function OnChangeDept() {
    txtDept.text = lstOrg.value;
    //datGroupData.Call();
}
//----------------------------------------------------
function OnSearch() {
	data_hrti01100_0.Call("SELECT");
	/*
    if (txtOption.text == 1)
        datShortTermAbsSum.Call("SELECT");
    else if (txtOption.text == 2)
        datLongTermAbsSum.Call("SELECT");
    else
        datAbsSum.Call("SELECT"); /**/
}
//-----------------------------------------------

function OnReport() {
    
    txtReportCode_tmp.text = lstReport.value;
    txtOrg_tmp_pk.text = lstOrg.value;
    datFind_Report.Call();
}


//--------------------------------------------------------
function ShowAbs(grdObj, colObj, colabs) {
    var col = event.col;
    if (col == colObj) {
        var abs_code, flag;
        abs_code = grdObj.GetGridData(event.row, colabs);
        flag = 0;
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');


    }
}
//----------------------------------------
function SetColor(grdObj, colObj) {
    if (grdObj.rows > 1)
        grdObj.SetCellBgColor(1, colObj, grdObj.rows - 1, colObj, 0xccffff);
}

function auto_resize_column(obj, col1, col2, font_size) {
    if (font_size != 0)
        obj.GetGridControl().FontSize = font_size;
    obj.GetGridControl().AutoSize(col1, col2, false, 0);
}
function OnChangeDate(Option, dtfrom, dtto)
{
	if(Option.value == "1") //daily
	{
		dtto.value = dtfrom.value;
	}
	else if(Option.value == "2") //weekly
	{
		dtto.SetDataText(System.AddDate(dtfrom.GetData(),7));
	}
	else if(Option.value == "3") //monthly
	{
		var ldate = dtfrom.value ; 
		lfromdate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
		ltodate = ldate.substr(0,4) + ldate.substr(4,2) ;
		ltodate = ltodate + getDaysInMonth(ltodate) ;
		dtfrom.value = lfromdate ;
		dtto.value = ltodate;
	}
}
function getDaysInMonth(yyyymm) //xac dinh thang do co bao nhieu ngay
{
   // returns the last day of a given month
    var m,y,tmpDate,checkMonth,lastDay
	
	m = Number(yyyymm.substr(4,2))-1;
		if(m==-1)
			m=Number(yyyymm.substr(5,1))-1;

	y = Number(yyyymm.substr(0,4));
	tmpDate = new Date(y, m, 28);
	checkMonth = tmpDate.getMonth();
	lastDay = 27;

    while(lastDay <= 31){
        temp = tmpDate.setDate(lastDay + 1);
        if(checkMonth != tmpDate.getMonth())
            break;
        lastDay++
    }
    return lastDay;
}
</script>
<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<!-------------------data control----------------------->
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="lstOrg" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------->
					
                    
                    
<!--------------------------------------------------------------->
<gw:data id="data_hrti01100_0" onreceive="OnDataReceive(this)"  > 
        <xml> 
           <dso  type="grid"  function="ST_HR_SEL_HRTI01100_0" > 
                <input bind="grdAbsence">
					<input bind="txtEmployee" /> 
					<input bind="lstOrg" /> 
                    <input bind="lstWG" /> 
					<input bind="lstStatus" /> 
					<input bind="dtFromDate" />
                    <input bind="dtToDate" />
					<input bind="lstAbs_Type" /> 
					<input bind="lstAbs_Kind" /> 
                </input> 
                <output bind="grdAbsence"/>
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------>
<gw:data id="datFind_Report" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_REPORT" > 
                <input>
                    <input bind="txtReportCode_tmp" /> 
					<input bind="txtOrg_tmp_pk" /> 
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!-------------------data control----------------------->
<table name="Summary" cellpadding="0" cellspacing="0" style="width:100%;height:100%;" class="eco_line">
    <tr style="width:100%;height:100%" valign="top">
		<td>
			<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
				<fieldset style="padding: 5">
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
						<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
							<tr style="border:0.5;width:100%;height:4%" valign="center" >
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=12 width="12%" style="border:0"  align="left" >
									Employee
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									<gw:textbox id="txtEmployee" maxlen = "50" styles="width:100%" onenterkey="OnSearch()" />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=12 style="border:0" width="12%" align="left" >
									Absence Type
								</td>
								<td colspan=20 style="border:0" width="20%"  align="left" >
									<gw:list  id="lstAbs_Type" value="ALL" styles='width:100%' onchange="" />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0" align="left"> Status </td>
								<td colspan=20 width="20%" style="border:0"> 
									<gw:list  id="lstStatus"  maxlen = "100" styles='width:100%'/>
								</td>
							</tr>
							<tr style="border:0.5;width:100%;height:4%" valign="center" >
								<td colspan=2 width="2%" style="border:0" align="left"   >
								</td>
								<td colspan=12 style="border:0" width="12%" align="left" >
									<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup()" href="#tips" >Organization</a>
								</td>
								<td colspan=20 width="20%" style="border:0" align="left">
									<gw:list  id="lstOrg" value='ALL' maxlen = "100" styles='width:100%' />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=12 width="12%" style="border:0"  align="left" >
									<gw:list  id="lstPeriod" value='1' maxlen = "100" styles='width:80%' onchange="OnChangeDate(lstPeriod, dtFromDate, dtToDate)" />
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									<gw:datebox id="dtFromDate" onchange="OnChangeDate(lstPeriod, dtFromDate, dtToDate)"  styles="width:100%" lang="<%=Session("Lang")%>" />
									~
									<gw:datebox id="dtToDate"  styles="width:100%" lang="<%=Session("Lang")%>" />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0" align="left">
								   Absence Kind
								</td>
								<td colspan=20 width="20%" style="border:0"> 
									<gw:list  id="lstAbs_Kind" value="ALL" styles='width:100%' onchange="" />
								</td>
							</tr>
						</table>
				</fieldset>
			</div>
			<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
				<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							Rows: 
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:label id="lblRecord" text="" ></gw:label>
						</td>
						<td colspan=75 width="75%" style="border:0" align="left" >							
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button img="search" id="ibtnSearch"   alt="Search"  onclick="OnSearch()"/>
						</td>
						<td colspan=5 width="5%" style="border:0" align="left" >
							<gw:button id="ibtnReport" alt="Report" img="excel" text="Report" onclick="OnReport()"/>
						</td>											
					</tr>
				</table>
			</div>
			<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
				<table  cellspacing=0 cellpadding=0 style="height:100%" width=100% border=0>
					<tr style="height:96%" id="tdMaster">
						<td style="width:100%;" valign="top" colspan="2" class="eco_line_t">
							<gw:grid id="grdAbsence" 
							 header ="Seq|_PK|_THR_EMP_PK|Org ID|Org Name|Employee ID|Employee Name|Absence Date|Start Hours|End Hours|Total Hours|Days|Absence Type|Reg Type|Description|_SEQUENCE"
							 format ="0|0|0|0|0|0|0|4|0|0|0|0|0|0|0|0" 
							 aligns ="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
							 editcol="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"
							 autosize = 'T'
							 styles="width:100%; height:100%"
							 sorting="T"  autosize="T" />
						</td>
					</tr>
				</table>
			</div>
		</td>	
    </tr>
</table>

</body>
    <gw:textbox id="txtDept" styles="display:none"/>	
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="txtOption" text="1" styles="display:none"/> 
    <gw:textbox id="txtEmp_PK"  styles="display:none"/> 
    <gw:textbox id="txtAbsence_Code"  styles="display:none"/> 
    <gw:textbox id="txtFromDate"  styles="display:none"/> 
    <gw:textbox id="txtToDate"  styles="display:none"/> 
    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtwg_tmp" styles="display:none"/> 
    <gw:textbox id="txtEmployee1" styles="display:none"/>
    <gw:textbox id="txtEmployee2" styles="display:none"/>      
    <gw:textbox id="txtReportCode_tmp" styles="display:none"/>
    <gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
    <gw:textbox id="txtReport_tmp" text="" styles="display:none"  />
	<gw:list  id="lstWG" value='ALL' maxlen = "100" styles='width:100%;display:none' /></gw:list>
	<gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%;display:none' ></gw:list>
	
</html>
