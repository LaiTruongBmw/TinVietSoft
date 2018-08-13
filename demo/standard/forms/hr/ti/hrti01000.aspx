<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Uses Entry</title>
	<script language="JavaScript" src="../../../../system/lib/md5.js"></script>
</head>
<script>

var v_language = "<%=Session("SESSION_LANG")%>";
var check_init=0;
var flag_save = 0;
//"V|_THR_EMP_PK|Org ID|Employee ID|Employee Name"

var stt = 0;	
var	G2_SEQ = stt;
var	G2_PK = ++stt;
var	G2_THR_EMP_PK = ++stt;
var	G2_ORG_NAME = ++stt;
var	G2_EMPLOYEE_ID = ++stt;
var	G2_EMPLOYEE_NAME = ++stt;
var	G2_ABSENCE_DT = ++stt;
var	G2_START_HOURS = ++stt;
var	G2_END_HOURS = ++stt;
var	G2_HOURS = ++stt;
var	G2_ABSENCE_TYPE = ++stt;
var	G2_REG_TYPE = ++stt;
var	G2_DESCRIPTION = ++stt;
var	G2_SEQUENCE = ++stt;
	;
var stt1 = 0;
var G3_SEQ				=	stt1;
var	G3_PK 				= 	++stt1;
var	G3_THR_EMP_PK 		= 	++stt1;
var	G3_ORG_NAME 		= 	++stt1;
var	G3_EMPLOYEE_ID	 	= 	++stt1;
var	G3_EMPLOYEE_NAME 	= 	++stt1;
var	G3_FROM_DT 			= 	++stt1;
var	G3_TO_DT 			= 	++stt1;
var	G3_ABSENCE_TYPE 	= 	++stt1;
var	G3_DESCRIPTION 		= 	++stt1;
var	G3_SEQUENCE 		= 	++stt1;
function BodyInit()
{
    System.Translate_V2(document, System.Menu.GetMenuPS());
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    menu_id.text=System.Menu.GetMenuID();
    
    var t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_FNM from vhr_hr_code where id='HR0003' order by code_nm")%>";
    grdAbsence.SetComboFormat(G2_ABSENCE_TYPE,t1);
	var t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_FNM from vhr_hr_code where id='HR0003' order by code_nm")%>";
	grdAbsenceL.SetComboFormat(G3_ABSENCE_TYPE,t1);
	grdAbsence.SetComboFormat(G2_REG_TYPE, '#1;Ngắn hạn|#2;Dài hạn');
    var data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg_A.SetDataText(data);
	lstOrg_A.value ="ALL";
	lstOrg_L.SetDataText(data);
	lstOrg_L.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0003', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>"; 
	lstAbsence_S.SetDataText(data);
	lstAbsence_S.value ="ALL";
	lstAbsence_L.SetDataText(data);
	lstAbsence_L.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstStatus.SetDataText(data);
	lstStatus.value ="A";
	lstStatus_L.SetDataText(data);
	lstStatus_L.value="A";
	
	data = (v_language =="ENG")?"|1|Daily|2|Weekly|3|Monthly":"|1|Ngày|2|Tuần|3|Tháng";
	lstPeriod.SetDataText(data);
	lstPeriod_L.SetDataText(data);
	
	ChangeColorItem(lstOrg_A.GetControl());
	ChangeColorItem(lstOrg_L.GetControl());
	
	var now = new Date(); 
	var ldate;
	ldate=dtFromDate.value ; 
	ldate = ldate.substr(0,4) + ldate.substr(4,2) + '01' ;
	dtFromDate.value=ldate ;
	var ldate1;
	ldate1=dtFromDate_L.value ; 
	ldate1 = ldate1.substr(0,4) + ldate1.substr(4,2) + '01' ;
	dtFromDate_L.value=ldate1 ;
}
//-----------------------------------------------
 function ChangeColorItem(lstctl) 
 {
        var slevel1, slevel2, slevel3,slevel4;
        for (var i = 0; i < lstctl.options.length; i++)
        {
            slevel1 = lstctl.options.item(i).text.substr(0, 1);
            slevel2 = lstctl.options.item(i).text.substr(0, 3);
            slevel3 = lstctl.options.item(i).text.substr(0, 5);
            slevel4 = lstctl.options.item(i).text.substr(0, 7);
            if (slevel4 != ".......")
            {
                if(slevel3==".....")
                {
                    lstctl.options.item(i).style.color = "0066CC";
                }
                else  
                {
                    if (slevel2 == "...")
                    {
                        lstctl.options.item(i).style.color = "FF4500";
                    }
                    else
                    {
                        if (slevel1 == ".")
                            lstctl.options.item(i).style.color = "FF00FF";  //FF3333
                    }
                }                
            }
        }
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
function OnChangeDate1(Option, dtfrom, dtto)
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
function OnSearch(obj)
{
	
	if(obj == "1")
	{
		data_hrti0100_2.Call("SELECT");
	}else{
		data_hrti0100_4.Call("SELECT");
	}
}
function OnDataReceive(obj)
{
	if(obj.id == "data_hrti0100_2")
	{
		lblRecord_A.text = grdAbsence.rows - 1;
	}
	if(obj.id == "data_hrti0100_3")
	{
		flag_save = 0;
		lblRecord_A.text = grdAbsence.rows - 1;
	}
	if(obj.id == "data_hrti0100_4")
	{
		lblRecord_L.text = grdAbsenceL.rows - 1;
	}
	if(obj.id == "data_hrti0100_5")
	{
		flag_save = 0;
		lblRecord_L.text = grdAbsenceL.rows - 1;
	}
}
function OnDataError(obj) 
{
	
	if(obj.id == "data_hrti0100_2")
    {	
		System.Menu.OnGetError(eval(obj).errmsg); 
    }
	if(obj.id == "data_hrti0100_3")
    {	
		System.Menu.OnGetError(eval(obj).errmsg); 
    }
	if(obj.id == "data_hrti0100_4")
    {	
		System.Menu.OnGetError(eval(obj).errmsg); 
    }
	if(obj.id == "data_hrti0100_5")
    {	
		System.Menu.OnGetError(eval(obj).errmsg); 
    }
	
}

function OnSetGrid(obj_checkbox,obj_grd,obj_col)
{	
    var tmp;
    if( obj_checkbox.GetData()=='T')
		tmp=-1;
	else
		tmp=0;
    var ctrl = obj_grd.GetGridControl();
    
    if (ctrl.SelectedRows>0)
    {
	    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		    {
			    var row = ctrl.SelectedRow(i);
				if ( row > 0 )
			    {		
				    obj_grd.SetGridText(row,obj_col,tmp);
			    }
			    
		    }
	}
	else
	{
	    for ( var i =  1 ; i < ctrl.rows ; i++ )
				    obj_grd.SetGridText(i,obj_col,tmp);
	}
}

function OnSave(obj)
{
	switch(obj.id)
	{
		case "ibtnSave_A":
			
			if (confirm((v_language =="ENG")?"Do you want to save?":"Bạn có muốn lưu?"))
			{	
				if(flag_save == "0")
				{
					data_hrti0100_2.Call();
				}
				else
					data_hrti0100_3.Call();
			}
		break;
		case "ibtnDelete_A":
			if (confirm((v_language =="ENG")?"Do you want to delete?":"Bạn có muốn xóa dữ liệu?"))
			{	
				if(flag_save == 1) // co nhan nut add
				{
					grdAbsence.RemoveRow();
					lblRecord_A.text = grdAbsence.rows - 1;
				}
				else
				{
					grdAbsence.DeleteRow();
					data_hrti0100_2.Call();
				}
			}
		break;
		case "ibtnSave_L":
			if(confirm((v_language == "ENG")?"Do you want to save?":"Bạn có muốn lưu dữ liệu?"))
			{
				if(flag_save == 0)
				{
					data_hrti0100_4.Call();
				}
				else
					data_hrti0100_5.Call();
			}
		break;
		case "ibtnDelete_L":
			if(confirm((v_language == "ENG")?"Do you want to delete?":"Bạn có muốn xóa dữ liệu?"))
			{
				if(flag_save == 1)
				{
					grdAbsenceL.RemoveRow();
					lblRecord_L.text = grdAbsenceL.rows - 1;
				}
				else
				{
					grdAbsenceL.DeleteRow();
					data_hrti0100_4.Call();
				}
			}
	}
} 
//-------------------------------------------------
function OnShowPopup(n) {
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
	var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj != null) {
			lstOrg_A.value = obj;
    }

}
function checktimehhmm(obj)
{

	var string = obj.text;
	var re = new RegExp("^[0-2][0-9]:[0-5][0-9]$");
	if (!re.test(string)) 
	{
		alert((v_language =="ENG")?"Please input type HH:MM":"Vui lòng chọn định dạng theo HH:MM");
		obj.text = "";
		obj.GetControl().focus();
		return;
	} 
}
function OnAddNew(obj)
{
	if(obj == "1")
	{
		var path = System.RootURL + '/standard/forms/hr/ti/hrti01004.aspx';
		var object = System.OpenModal( path ,1000 , 700 ,  'resizable:yes;status:yes');
	}
	if(obj == "2")
	{
		var path = System.RootURL + '/standard/forms/hr/ti/hrti01005.aspx';
		var object = System.OpenModal( path ,1000 , 700 ,  'resizable:yes;status:yes');
	}
}
function OnReport(obj)
{
	var url=System.RootURL;
	if(obj == "1")
	{
		var	url = url + '/standard/reports/hr/ti/rpt_hrti01000_0.aspx?p_tco_org_pk=' + lstOrg_A.value + '&p_search_temp=' + txtEmpName_A.text + '&p_absence_type=' + lstAbsence_S.value ;
			url = url + '&p_from_date=' + dtFromDate.value + '&p_to_date=' + dtToDate.value + '&p_lang=' + v_language ;
	}
	else
	{
		var	url = url + '/standard/reports/hr/ti/rpt_hrti01000_1.aspx?p_tco_org_pk=' + lstOrg_L.value + '&p_search_temp=' + txtEmpName_L.text + '&p_absence_type=' + lstAbsence_L.value ;
			url = url + '&p_from_date=' + dtFromDate_L.value + '&p_to_date=' + dtToDate_L.value + '&p_lang=' + v_language ;
	}
	window.open(url); 
					
}
</script>	
<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
	<!----------------------------------------------------------------------------------------------->
	
	<gw:data id="data_hrti0100_2" onreceive="OnDataReceive(this)" onerror="OnDataError(this)" > 
		<xml> 
		   <dso  type="grid"  function="ST_HR_SEL_HRTI01000_2" procedure="ST_HR_UPD_HRTI01000_2" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13"> 
				<input bind="grdAbsence"> 
					<input bind="lstOrg_A" /> 
					<input bind="txtEmpName_A" /> 
					<input bind="lstAbsence_S" /> 
					<input bind="dtFromDate" /> 
					<input bind="dtToDate" /> 
				</input> 
				<output bind="grdAbsence"/>
			</dso> 
		</xml> 
	</gw:data>
	<gw:data id="data_hrti0100_3" onreceive="OnDataReceive(this)" onerror="OnDataError(this)" > 
		<xml> 
		   <dso  type="grid"  function="ST_HR_SEL_HRTI01000_3" procedure="ST_HR_UPD_HRTI01000_2" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13"> 
				<input bind="grdAbsence"> 
					<input bind="txtSequence" /> 
				</input> 
				<output bind="grdAbsence"/>
			</dso> 
		</xml> 
	</gw:data>
	<gw:data id="data_hrti0100_4" onreceive="OnDataReceive(this)" onerror="OnDataError(this)" > 
		<xml> 
		   <dso  type="grid"  function="ST_HR_SEL_HRTI01000_4" procedure="ST_HR_UPD_HRTI01000_3" parameter="1,2,6,7,8,9,10"> 
				<input bind="grdAbsenceL"> 
					<input bind="lstOrg_L" /> 
					<input bind="txtEmpName_L" /> 
					<input bind="lstAbsence_L" /> 
					<input bind="dtFromDate_L" /> 
					<input bind="dtToDate_L" /> 
				</input> 
				<output bind="grdAbsenceL"/>
			</dso> 
		</xml> 
	</gw:data>
	<gw:data id="data_hrti0100_5" onreceive="OnDataReceive(this)" onerror="OnDataError(this)" > 
		<xml> 
		   <dso  type="grid"  function="ST_HR_SEL_HRTI01000_5" procedure="ST_HR_UPD_HRTI01000_3" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13"> 
				<input bind="grdAbsenceL"> 
					<input bind="txtSequence" /> 
				</input> 
				<output bind="grdAbsenceL"/>
			</dso> 
		</xml> 
	</gw:data>
	<!----------------------------------------------------------------------------------------------->
<gw:tab id="tabMain"  border=1 style="width:100%;height:100%;"  >
	<table id="Absence" name="Short Term" style="width:100%;height:100%;" cellpadding="0" cellspacing="0" class="eco_line" >		
		<tr style="height:100%" valign="top">
			<td valign="top">
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%">
								<tr>
									<td colspan= 2 width="2%" style="">
									</td>
									<td colspan=10 width="10%" align="left" style="white-space:nowrap">
										Employee
									</td>
									<td colspan=20 width="20%">
										<gw:textbox  id="txtEmpName_A" styles='width:100%' onenterkey="OnSearch(2)" />
									</td>
									<td colspan= 2 width="2%" style="">
									</td>									
									<td colspan=10 width="10%" align="left" style="white-space:nowrap">Absence Type</td>
									<td colspan=20 width="20%">
										<gw:list id="lstAbsence_S" styles="width:100%" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left"> Status </td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstStatus"  maxlen = "100" styles='width:100%'/>
									</td>									
								</tr>
								<tr>
									<td colspan= 2 width="2%" style="">
									</td>
									<td colspan=10 width="10%" align="left" style="white-space:nowrap">
										<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(2)" href="#tips" >Organization</a>
									</td>
									<td colspan=20 width="20%">
										<gw:list  id="lstOrg_A" value='ALL' maxlen = "100" styles='width:100%' />
									</td>
									<td colspan= 2 width="2%" style="">
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										<gw:list  id="lstPeriod" value='1' maxlen = "100" styles='width:80%' onchange="OnChangeDate(lstPeriod, dtFromDate, dtToDate)" />
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:datebox id="dtFromDate" onchange="OnChangeDate(lstPeriod, dtFromDate, dtToDate)"  styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtToDate"  styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>
								</tr>
							</table>
					</fieldset>
				</div>
				<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr>
							<td colspan= 2 width="2%" style="">
							</td>
							<td colspan="5" width="5%">
								Rows:
							</td>
							<td colspan="5" width="5%">
								<gw:label id="lblRecord_A" text="" ></gw:label>
							</td>
							<td colspan=55 width="55%">
							</td>
							<td colspan="5" width="5%">
								<gw:button id="ibtnSearch_A" img="search"  text="Search"  onclick="OnSearch(1)"/>
							</td>
							<td colspan="8" width="8%">
								<gw:button id="btnNew" img="new" alt="Add New" text="Add new" onclick="OnAddNew(1)" />
							</td>
							<td colspan="5" width="5%">
								<gw:button id="ibtnSave_A" img="save"  text="Save"  onclick="OnSave(this)"/>
							</td>
							<td colspan="5" width="5%">
								<gw:button id="ibtnDelete_A" img="delete"  text="Delete"  onclick="OnSave(this)"/>
							</td>
							<td colspan="5" width="5%">
								<gw:button id="ibtnReport_A" img="excel"  text="Report"  onclick="OnReport(1)"/>
							</td>														
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
					<table  cellspacing=0 cellpadding=0 style="height:100%" width=100% border=0>
						<tr style="height:96%" id="tdMaster">
							<td style="width:100%;" valign="top" colspan="2" class="eco_line_t">
								<gw:grid id="grdAbsence" 
							 header ="Seq|_PK|_THR_EMP_PK|Org Name|Employee ID|Employee Name|Absence Date|Start Hours|End Hours|Hours|Absence Type|_Reg Type|Description|_SEQUENCE"
							 format ="0|0|0|0|0|0|4|0|0|0|0|0|0|0" 
							 aligns ="0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
							 editcol="0|0|0|0|0|0|1|1|1|1|1|0|1|0"
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
	<table id="Absence" name="Long Term" style="width:100%;height:100%;" cellpadding="0" cellspacing="0" class="eco_line" >		
		<tr style="height:100%" valign="top">
			<td valign="top">
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
						<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
							<table width="100%">
								<tr>
									<td colspan= 2 width="2%" style="">
									</td>
									<td colspan=10 width="10%" align="left" style="white-space:nowrap">
										Employee
									</td>
									<td colspan=20 width="20%">
										<gw:textbox  id="txtEmpName_L" styles='width:100%' onenterkey="OnSearch(2)" />
									</td>
									<td colspan= 2 width="2%" style="">
									</td>									
									<td colspan=10 width="10%" align="left" style="white-space:nowrap">Absence Type</td>
									<td colspan=20 width="20%">
										<gw:list id="lstAbsence_L" styles="width:100%" />
									</td>
									<td colspan=2 width="2%" style="border:0"   >
										
									</td>
									<td colspan=10 width="10%" style="border:0" align="left"> Status </td>
									<td colspan=20 width="20%" style="border:0"> 
										<gw:list  id="lstStatus_L"  maxlen = "100" styles='width:100%'/>
									</td>									
								</tr>
								<tr>
									<td colspan= 2 width="2%" style="">
									</td>
									<td colspan=10 width="10%" align="left" style="white-space:nowrap">
										<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(2)" href="#tips" >Organization</a>
									</td>
									<td colspan=20 width="20%">
										<gw:list  id="lstOrg_L" value='ALL' maxlen = "100" styles='width:100%' />
									</td>
									<td colspan= 2 width="2%" style="">
									</td>
									<td colspan=10 width="10%" style="border:0"  align="left" >
										<gw:list  id="lstPeriod_L" value='1' maxlen = "100" styles='width:80%' onchange="OnChangeDate1(lstPeriod_L, dtFromDate_L, dtToDate_L)" />
									</td>
									<td colspan=20 width="20%" style="border:0"  align="left" >
										<gw:datebox id="dtFromDate_L" onchange="OnChangeDate1(lstPeriod_L, dtFromDate_L, dtToDate_L)"  styles="width:100%" lang="<%=Session("Lang")%>" />
										~
										<gw:datebox id="dtToDate_L"  styles="width:100%" lang="<%=Session("Lang")%>" />
									</td>
								</tr>
							</table>
					</fieldset>
				</div>
				<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:4%">
					<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
						<tr>
							<td colspan= 2 width="2%" style="">
							</td>
							<td colspan="5" width="5%">
								Rows:
							</td>
							<td colspan="5" width="5%">
								<gw:label id="lblRecord_L" text="" ></gw:label>
							</td>
							<td colspan=55 width="55%">
							</td>
							<td colspan="5" width="5%">
								<gw:button id="ibtnSearch_L" img="search"  text="Search"  onclick="OnSearch(2)"/>
							</td>
							<td colspan="8" width="8%">
								<gw:button id="btnNew_L" img="new" alt="Add New" text="Add new" onclick="OnAddNew(2)" />
							</td>
							<td colspan="5" width="5%">
								<gw:button id="ibtnSave_L" img="save"  text="Save"  onclick="OnSave(this)"/>
							</td>
							<td colspan="5" width="5%">
								<gw:button id="ibtnDelete_L" img="delete"  text="Delete"  onclick="OnSave(this)"/>
							</td>
							<td colspan="5" width="5%">
								<gw:button id="ibtnReport_L" img="excel"  text="Report"  onclick="OnReport(2)"/>
							</td>														
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:86%">
					<table  cellspacing=0 cellpadding=0 style="height:100%" width=100% border=0>
						<tr style="height:96%" id="tdMaster">
							<td style="width:100%;" valign="top" colspan="2" class="eco_line_t">
								<gw:grid id="grdAbsenceL" 
							 header ="Seq|_PK|_THR_EMP_PK|Org Name|Employee ID|Employee Name|From Date|To Date|Absence Type|Description|_SEQUENCE"
							 format ="0|0|0|0|0|0|4|4|0|0|0" 
							 aligns ="0|0|0|0|0|0|0|0|0|0|0" 
							 editcol="0|0|0|0|0|0|1|1|1|1|0"
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
</gw:tab>	
	<!----------------------------------------------------------------------------------------------->   
</body>
	<gw:textbox  id="txtClientID" styles='display:none' />
	<gw:textbox  id="txtUserID" styles='display:none' />
	<gw:textbox  id="txtObjectID" styles='display:none' />
	<gw:textbox  id="txtSysCD" styles='display:none' />
	<gw:textbox  id="txtAllYN" styles='display:none' />
	<gw:textbox  id="txtSRCYN" styles='display:none' />
	<gw:textbox  id="txtColumn" styles='display:none' />
	<gw:textbox  id="txtLable" styles='display:none' />
	<gw:textbox  id="txtLang" styles='display:none' />

	<gw:textbox  id="txtUserPK" styles='display:none' />
	<gw:textbox  id="txtPwdEnc" styles="display: none" />
	<gw:textbox  id="txtEmpPk" style="display: none" />
	<gw:textbox id="iduser_pk" styles="display:none"/>
	<gw:textbox id="txtHr_level" styles="display:none"/>
	<gw:textbox id="menu_id" text="" styles="display:none"  />
	<gw:textbox id="txtSequence" styles="display:none"  />
</html>