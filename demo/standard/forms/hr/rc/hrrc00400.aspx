<!-- #include file="../../../../system/lib/form.inc"  -->
<%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script> 
    //_pk 0|Select 1|ID 2|Full Name 3|Sex 4|Birth DT 5|Birth Place 6|Personal ID 7|Issue DT 8|Place ID 9|Ethnic 10 
	//|Current Address 11|Permanent Address 12|Hand Phone 13|Home Phone 14|Other Contact 15|Email 16|Height(m)17|Weight(Kg) 18|State of Health 19|Marital Status 20
    //|Education  21|Graduation School 22
    //|Major 23|Graduation Kind 24|Other Certificate 25|Foreign Language 26|Language Certificate 27|Other Language 28
	//|Computer  Skill 29|Experience 30
    //|Other Description 31|Organization 32|Position 33|Job 34|Emp type 35|Salary 36|Other Request 37|Receive DT 38|Introduction 39
	//|Expiry DT 40|Full Profile 41
    //|Minus Profile 42|MINUS_CODE 43| Profile Note 44|Interview DT1 45|Hours ITV1 46|Interviewer1 47|_Interviewer1_pk 48
	//|Result 1 49|Remark 1 50|Interview DT2 51
    //|Hours ITV2 52|Interviewer2 53|_Interviewer2_pk 54
    //|Result 2 55|Remark 2 56|Interview DT3 57|Hours ITV3 58|Interviewer3 59|_Interviewer3_pk 60|Result 3 61|Remark 3 62
	//|Pass  63|Pass DT 64|Working DT 65|_int_pk 66
    //|Return Profile DT 67| Reason return 68|Request 69|_ORG_PK 70

var stt =0;
G_PK = stt; //pk
G_Select=++stt;//select
G_Id=++stt;
G_Full_Name=++stt;
G_Sex=++stt;
G_Birth_DT=++stt;
G_BIRTH_PLACE=++stt;
G_PER_ID=++stt;
G_ISSUE_DT=++stt;
G_PLACE_ID=++stt;
G_ETHNIC=++stt;
G_CURRENT_ADDRESS=++stt;
G_PERMANENT_ADDRESS=++stt;
G_HAND_PHONE=++stt;
G_HOME_PHONE=++stt;
G_OTHER_CONTACT=++stt;
G_EMAIL=++stt;
G_HEIGHT=++stt;
G_WEIGHT=++stt;
G_STAE_OF_HEATH=++stt;
G_MARITAL_STATUS=++stt;
G_EDUCATION=++stt;
G_GRADUATION_SCHOOL=++stt;
G_MAJOR=++stt;
G_GRADUATION_KIND=++stt;
G_OTHER_CERTIFICATE=++stt;
G_FOREIGN_LANGUAGE=++stt;
G_LANGUAGE_CERTIFICATE=++stt;
G_OTHER_LANGUAGE=++stt;
G_COMPUTER_SKILL=++stt;
G_EXPERRIENCE=++stt;
G_OTHER_DESCRIPTION=++stt;
G_ORGANIZATION=++stt;
G_POSITION=++stt;
G_JOB=++stt;
G_EMP_TYPE=++stt;
G_SALARY=++stt;
G_OTHER_REQUEST=++stt;
G_RECEIVE_DT=++stt;
G_INTRODUCTION=++stt;
G_EXPIRY_DT=++stt;
G_FULL_PROFILE=++stt;
G_MINUS_PROFILE=++stt;
G_MINUS_CODE=++stt;
G_PROFILE_NOTE=++stt;
G_INTERVIEW_DT1=++stt;
G_HOUR_ITV1=++stt;
G_INTERVIEW1=++stt;
G_INTERVIEW1_PK=++stt;
G_RESULT1=++stt;
G_REMARK1=++stt;
G_INTERVIEW_DT2=++stt;
G_HOUR_ITV2=++stt;
G_INTERVIEW2=++stt;
G_INTERVIEW2_PK=++stt;
G_RESULT2=++stt;
G_REMARK2=++stt;
G_INTERVIEW_DT3=++stt;
G_HOUR_ITV3=++stt;
G_INTERVIEW3=++stt;
G_INTERVIEW3_PK=++stt;
G_RESULT3=++stt;
G_REMARK3=++stt;
G_PASS=++stt;
G_PASS_DT=++stt;
G_WORKING_DT=++stt;
G_INT_PK=++stt;
G_RETURN_PROFILE_DT=++stt;
G_REASON_RETURN=++stt;
G_REQUEST=++stt;

var datenow;
var v_language = "<%=Session("SESSION_LANG")%>";
var user;
function BodyInit()
{ 	
    System.Translate_V2(document, System.Menu.GetMenuPS());
	grdCandidates.GetGridControl().FrozenCols =6;
	grdCandidates.GetGridControl().FrozenCols =4;
    grdCandidates.GetGridControl().ScrollTrack=true;
	grdCandidates.GetGridControl().ScrollTrack=true;
        System.Translate(document);
	 ibtnSave.SetEnable(false);
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    user="<%=session("USER_ID")%>";
	laguage.text = "<%= Session("SESSION_LANG") %>";
	BindingDataList();
    menu_id.text=System.Menu.GetMenuID();
	datCheck_View.Call(); 
	
}
function BindingDataList()
{
	var t1;
	
	t1= "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0159', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL")%>";
	lstPass.SetDataText(t1);
	lstPass.value = "ALL";
		
	t1 = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg_Code.SetDataText(t1);
    lstOrg_Code.value = "ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0008', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstPosition.SetDataText(data);
	lstPosition.value ="ALL";
	
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0007' order by code_nm")%>";
	grdCandidates.SetComboFormat(G_Sex,t1);
	
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0021' order by code_nm")%>";
	grdCandidates.SetComboFormat(G_BIRTH_PLACE,t1);
	
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0015' order by code_nm")%>";
	grdCandidates.SetComboFormat(G_ETHNIC,t1);
	
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0014' order by code_nm")%>";
	grdCandidates.SetComboFormat(G_PLACE_ID,t1);
	
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0011' order by code_nm")%>";
	grdCandidates.SetComboFormat(G_EDUCATION,t1);
	
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0146' order by code_nm")%>";
	grdCandidates.SetComboFormat(G_GRADUATION_SCHOOL,t1);
	
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0147' order by code_nm")%>";
	grdCandidates.SetComboFormat(G_GRADUATION_KIND,t1);
	
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0148' order by code_nm")%>";
	grdCandidates.SetComboFormat(G_MAJOR,t1);
	
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0143' order by code_nm")%>";
	grdCandidates.SetComboFormat(G_FOREIGN_LANGUAGE,t1);
	
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0144' order by code_nm")%>";
	grdCandidates.SetComboFormat(G_LANGUAGE_CERTIFICATE,t1);
	
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0210' order by code_nm")%>";
	grdCandidates.SetComboFormat(G_EXPERRIENCE,t1);
	
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' order by code_nm")%>";
	grdCandidates.SetComboFormat(G_POSITION,t1);
	
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0010' order by code_nm")%>";
	grdCandidates.SetComboFormat(G_JOB,t1);
	
	t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0159' order by code_nm")%>";
	grdCandidates.SetComboFormat(G_RESULT1,t1);
	grdCandidates.SetComboFormat(G_RESULT2,t1);
	grdCandidates.SetComboFormat(G_RESULT3,t1);
	grdCandidates.SetComboFormat(G_PASS,t1);
	
}
function OnDataReceive(obj)
{
	if (obj.id == 'datCheck_View')
	{
		if(txtFlag_View == 'Y' )
		{
			ibtnSave.style.display = "none";
		}
	}
	else if (obj.id == 'datRecEmp')
	{
		if (grdCandidates.rows>1)
        {
            ibtnSave.SetEnable(true);
            //SetColRow();
        }
        else
        {
            ibtnSave.SetEnable(false);
            
        }
		lblRecord.text = grdCandidates.rows-1;
	}
}

function CheckIns()
{

}

function OnSearch()
{
	datRecEmp.Call("SELECT");
}

function OnSave()
{ 

        if (confirm("Do you want to save?"))
		{
			//datRecEmp.StatusUpdate();
            datRecEmp.Call();
		}	
}
function OnShowPopup(m)
{     
        var strcom;
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
        //var obj  = System.OpenModal(  fpath , 300 , 200 , 'resizable:yes;status:yes');
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {  
			lstOrg_Code.value = obj;			
		}
}
function OnReport()
{
	
	if(lstReport.value=='1')
	{
	txtReport_tmp.text='rpt_hrrc00400_0.aspx';
	var  emp_pk_list="";
						
						for (var i=1;i<=grdCandidates.rows-1;i++)
						{
							if (grdCandidates.GetGridData(i,1)=="-1")
							{
								emp_pk_list = emp_pk_list + grdCandidates.GetGridData(i,0) + ",";
							   
							}   
						}
						if (emp_pk_list=="")
							alert("Please choose employees to print");
						else
						{
							emp_pk_list=emp_pk_list.substr(0,emp_pk_list.length-1);
							var url =System.RootURL + '/standard/reports/hr/rc/'+txtReport_tmp.text+'?emp_pk=' + emp_pk_list + '&appendix_type=1';
							window.open(url);     
							
						}
						

	}               
	else if(lstReport.value=='2')
	{       txtReport_tmp.text='rpt_hrrc00400_1.aspx';
				   var url =System.RootURL + '/standard/reports/hr/rc/'+txtReport_tmp.text+'?p_org=' + lstOrg_Code.value + '&p_position='
						+ lstPosition.value +'&p_search='+ txtCandidate.text + '&p_request_no=' + txtRequest.text + '&p_pass=' + lstPass.value
						+ '&p_select=' + lstSelectDate.value + '&p_from_dt=' + dtFrom_Date.value + '&p_to_dt=' + dtTo_Date.value 
						+ '&p_lang=' + v_language;
						window.open(url);     
				
	}
	/*               
	else if(lstReport.value=='3')
	{       txtReport_tmp.text='rpt_rec_interview_status_list.aspx';
				   var url =System.RootURL + '/reports/ch/pr/'+txtReport_tmp.text+'?p_org=' + lstOrg.value + '&p_position='
						+lstPosition.value +"&p_serach="+lstSearch.value+"&p_temp="+txtTemp.text +"&p_resultby="+lstResultBy.value+"&p_status="+lstStatus.value
						+"&p_request="+lstRequest.value + "&p_detail="+lstRequestDetail.value + "&p_PeriodFrom="+dtPeriodFrom.value 
						+ "&p_PeriodTo="+dtPeriodTo.value +"&p_receive_from=" +dtReceiveFrom.value+"&p_receive_to=" +dtReceiveTo.value
						+"&p_Expiry_from=" +dtExpiryFrom.value+"&p_Expiry_to=" +dtExpiryTo.value
						+"&p_Interview1_from=" +dtInterview1From.value+"&p_Interview1_to=" +dtInterview1To.value
						+"&p_Interview2_from=" +dtInterview2From.value+"&p_Interview2_to=" +dtInterview2To.value
						+"&p_Interview3_from=" +dtInterview3From.value+"&p_Interview3_to=" +dtInterview3To.value+"&p_emp_type="+lstEmpType.value 
						+"&p_working_from=" +dtWorkingFrom.value +"&p_working_to=" +dtWorkingTo.value ;
						window.open(url);     
						

	}      
	else if(lstReport.value=='4')
	{       txtReport_tmp.text='rpt_rec_emp_expect_list.aspx';
				   var url =System.RootURL + '/reports/ch/pr/'+txtReport_tmp.text+'?p_org=' + lstOrg.value + '&p_position='
						+lstPosition.value +"&p_serach="+lstSearch.value+"&p_temp="+txtTemp.text +"&p_resultby="+lstResultBy.value+"&p_status="+lstStatus.value
						+"&p_request="+lstRequest.value + "&p_detail="+lstRequestDetail.value + "&p_PeriodFrom="+dtPeriodFrom.value 
						+ "&p_PeriodTo="+dtPeriodTo.value +"&p_receive_from=" +dtReceiveFrom.value+"&p_receive_to=" +dtReceiveTo.value
						+"&p_Expiry_from=" +dtExpiryFrom.value+"&p_Expiry_to=" +dtExpiryTo.value
						+"&p_Interview1_from=" +dtInterview1From.value+"&p_Interview1_to=" +dtInterview1To.value
						+"&p_Interview2_from=" +dtInterview2From.value+"&p_Interview2_to=" +dtInterview2To.value
						+"&p_Interview3_from=" +dtInterview3From.value+"&p_Interview3_to=" +dtInterview3To.value+"&p_emp_type="+lstEmpType.value
						+"&p_working_from=" +dtWorkingFrom.value +"&p_working_to=" +dtWorkingTo.value ;
						window.open(url);     
						

	}*/           
}
</script>
<body bottommargin="0" topmargin="0" leftmargin="0" rightmargin="0" >
<!-- MainTable -->
<gw:data id="datCheck_View" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="process" procedure="ST_HR_PRO_CO_CHECK_VIEW"  > 
                <input>
                    <input bind="iduser_pk" />
                    <input bind="menu_id" />
                </input> 
                <output>
                    <output bind="txtFlag_View" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datRecEmp" onreceive="OnDataReceive(this)"  > 
	<xml>
		<dso type="grid" parameter="0,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,70" function="ST_HR_SEL_HRRC00400_0" procedure="ST_HR_UPD_HRRC00400_0">
			<input>
				<input bind="txtCandidate"/>
				<input bind="txtRequest"/>
				<input bind="lstPosition"/>
				<input bind="lstOrg_Code"/>
				<input bind="lstSelectDate"/>
				<input bind="dtFrom_Date"/>
				<input bind="dtTo_Date"/>
				<input bind="lstPass"/>
			</input>
			<output bind="grdCandidates" />
		</dso>
	</xml>
</gw:data>
<!------------------------------------------------------->
<table name="Employee Informations" width="100%" cellpadding="0" cellspacing="0" style="width:100%;height:100%;border:1px solid #62ac0d;">
        <tr style="width:100%;height:100%" valign="top">
            <td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:12%">
					<fieldset style="padding: 5">
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
						<table width="100%" id="tblexp" style="height:100%" border=0 cellpadding="0" cellspacing="0">
							<tr style="border:0.5;width:100%;height:4%" valign="center" >
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=12 width="12%" style="border:0"  align="left" >
									Candidate
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									 <gw:textbox id="txtCandidate" onenterkey   ="OnSearch()" styles="width:100%"/>
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0" align="left" >
									Request No
								</td>
								<td colspan=20 width="20%" style="border:0"> 
									<gw:textbox  id="txtRequest"  maxlen = "100" styles='width:100%' >
				
									</gw:textbox>
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0" align="left" >Position </td>
								<td colspan=20 width="20%" style="border:0"> 
									<gw:list  id="lstPosition" styles='width:100%' />
								</td>
							</tr>
							<tr style="border:0.5;width:100%;height:4%" valign="center" >
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=12 width="12%" style="border:0"  align="left" >
									<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(1)" href="#tips" style="text-decoration: none; color=#0000ff" >Organization</a>
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									 <gw:list  id="lstOrg_Code" value='ALL' maxlen = "100" styles='width:100%' />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									<gw:list  id="lstSelectDate" value='1' maxlen = "100" styles='width:80%' onchange="" >
										<data>
											|1|Interview Date 1|2|Interview Date 2|3|Interview Date 3
											|4|Period DT|5|Expiry DT|6|Working DT|7|Recieve DT
										</data>
									</gw:list>
								</td>
								<td colspan=20 width="20%" style="border:0" align="left">
									<gw:datebox id="dtFrom_Date" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									~
									<gw:datebox id="dtTo_Date" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								
								<td colspan=10 width="10%" style="border:0" align="left" >
									Pass
								</td>
								<td colspan=20 width="20%" style="border:0"> 
									<gw:list  id="lstPass"  maxlen = "100" styles='width:100%'/>
								</td>
							</tr>
						</table>
					</fieldset>
				</div>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:5%;">
					<table width="100%"  style="height:100%" border=0 cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center"  >
							<td colspan=5 width="5%" style="border:0"   >
								Rows: 
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:label id="lblRecord"  text="" />
							</td>
							<td colspan=60 width="60%" style="border:0"> 
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSearch" img="search"     text="Search"  onclick="OnSearch()"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnSave" img="save"   text="Save"  onclick="OnSave()"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnReport" img="excel"   text="Report"  onclick="OnReport(1)"/>
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								<gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%' >
									<data>
										|1|Curriculum Vitae|2|Candidate List
									</data>
								</gw:list>
							</td>
							
						</tr>
					</table>
				</div>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:83%">
					<table width="100%" style="height:100%" border=0 cellpadding="0" cellspacing="0">
                    <tr style="border:1;width:100%;height:75%" valign="top">
                        <td colspan=100 style="width:100%;height:100%;"> 
                             <gw:grid   
                                id="grdCandidates"  
                                header="_pk|Select|Candidate ID|Candidate Name|Sex|Birth DT|Birth Place|Personal ID|Issue DT|Place ID|Ethnic
										   |Current Address|Permanent Address|Hand Phone|Home Phone|Other Contract|Email|Height(m)|Weight(Kg)|State of Health|Marital Status
										   |Education|Graduation School|Major|Graduation Kind|Other Certificate|Foreign Language|Language Certificate|Other Language|Computer  Skill|Experience
										   |Other Description|Organization|Position|Job|Emp type|Salary|Other Request|Receive DT|Introduction
										   |Expiry DT|Full Profile|Minus Profile|MINUS_CODE| Profile Note|Interview DT1|Hours ITV1|Interviewer1|_Interviewer1 pk|Result 1
										   |Remark 1|Interview DT2|Hours ITV2|Interviewer2|_Interviewer2 pk|Result 2|Remark 2|Interview DT3|Hours ITV3|Interviewer3
										   |_Interviewer3 pk|Result 3|Remark 3|Pass|Pass DT|Working DT|_int pk|Return Profile DT| Reason return|Request|_ORG PK"   
                                format="0|3|0|0|0|0|0|0|4|2|0	
										 |0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|1|0|4|0|4
										 |0|0|0|0|4|0|0|0|0|0
										 |4|0|0|0|0|0|4|0|0|0
										 |0|0|0|4|4|0|4|0|0|0"  
                                aligns="0|0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|0|0|0|0|0
										 |0|0|0|0|0|0|0|0|0|0"    
                                defaults="||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"    
                               editcol="1|0|0|0|1|1|0|0|1|1|1
										 |1|1|1|1|1|1|1|1|1|1
										 |1|1|1|1|1|1|1|1|1|1
										 |1|0|1|1|1|1|1|1|1|1
										 |1|1|1|1|1|1|1|1|1|1
										 |1|1|1|1|1|1|1|1|1|1
										 |1|1|1|1|1|1|1|1|1|1"  
                                widths="0|500|1500|2500|1500|1500|2500|1500|1500|1500|1500
										 |1500|1500|1500|1500|1500|1500|1500|1500|1500|1500
										 |1500|1500|1500|1500|1500|1500|1500|1500|1500|1500
										 |1500|1500|1500|1500|1500|1500|1500|1500|1500|1500
										 |1500|1500|1500|1500|1500|1500|1500|1500|1500|1500
										 |1500|1500|1500|1500|1500|1500|1500|1500|1500|1500
										 |1500|1500|1500|500|500|1500|1500|1500|1500|0"  
                                styles="width:100%; height:100%"   acceptNullDates
                                sorting="T"/> 
                        </td>
                    </tr>
					</table>
				</div>	
                
            </td>
        </tr>
    </table>

<gw:textbox id="laguage" styles="display:none"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txtReport_tmp" styles="display:none"/>
<gw:textbox id="txtReportCode_tmp" styles="display:none"/>
<gw:textbox id="txt_sal_security" styles="display:none"/>
<gw:textbox id="txtOrgData" styles="display:none"/>
<gw:textbox id="txtUpperOrg" styles="display:none"/>
<gw:textbox id="txtEmpID" styles="display:none"/>
<gw:textbox id="txtResult" styles="display:none"/>
<gw:textbox id="tmpEmpID" styles="display:none"/>
<gw:textbox id="txtOrgPK" styles="display:none"/>
<gw:textbox id="txtOrgNM" styles="display:none"/>
<gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
<gw:textbox id="txtdept_temp" styles="display:none"/>
<gw:textbox id="txtlst_period" styles="display:none"/>
<gw:textbox id="txtwg_tmp" styles="display:none"/>
    
<gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtFlag_View" text="" styles="display:none"  />    
<gw:textbox id="txtCostGroup" text="" styles="display:none"  />
<gw:textbox id="txtCostType" text="" styles="display:none"  />
<gw:textbox id="txtCostCenter_pk" text="" styles="display:none"  />
<gw:textbox id="txtCostCenter_nm" text="" styles="display:none"  />
<gw:textbox id="txtHR0211_YN" text="" styles="display:none"  />

<gw:list id="lstPay_Type" value="ALL" styles="display:none"  />
<gw:list id="lstContract_Kind" value="ALL" styles="display:none"  />
<gw:textbox id="dtFrom_BeginContract"  styles="display:none"  />
<gw:textbox id="dtTo_BeginContract"  styles="display:none"  />
<gw:list id="lstSex" value="ALL" styles="display:none"  />
<gw:list id="lstInsuranceYN" value="ALL" styles="display:none"  />
<gw:list id="lstOTYN" value="ALL" styles="display:none"  />
<gw:list id="lstUnion" value="ALL" styles="display:none"  />
<gw:textbox id="txtTemp" styles="display:none"/>
    
</body>
</html>

				
