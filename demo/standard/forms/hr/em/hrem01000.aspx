<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>

//tab resign
var p_select=0;
var p_department=1;
var p_group=2;
var p_emp_id=3;
var p_full_name=4;
var p_join_dt=5;
var p_left_dt=6;
var p_resign_type=7;
var p_remark=8;
var p_ale_last_year=9;
var p_remain_ale=10;
var p_remain_ale_amt=11;
var p_severance_flag=12;
var p_salary=13;
var p_severance_mon=14;
var p_not_unemp_mon=15;
var p_severance_mon_total=16;
var p_severance_amt=17;
var p_seniority_amt=18;
var p_health_yn=19;
var p_return_health_card=20;
var p_not_timely=21;
var p_deduct_mon=22;
var p_return_card=23;
var p_cal_sal=24;
var p_equip1=25;
var p_equip1_amt=26;
var p_equip2=27;
var p_equip2_amt=28;
var p_equip3=29;
var p_equip3_amt=30;
var p_equip4=31;
var p_equip4_amt=32;
var p_equip5=33;
var p_equip5_amt=34;
var p_equip6=35;
var p_equip6_amt=36;
var p_equip7=37;
var p_equip7_amt=38;
var p_equip8=39;
var p_equip8_amt=40;
var p_emp_pk=41;
var p_by_hand=42;
var p_resign_pk=43;


var strcodereturn;
var user;
var v_language = "<%=Session("SESSION_LANG")%>";
var l_col_seniority_amt = 18,
    l_col_iEquip1 =25,
    l_col_employee_pk = 41,
    l_col_resign_pk = 43;

var flag_tab=1;
var check_init=0; 	
var pk_list;
function BodyInit()
{
    
    //if (v_language!="ENG")
    System.Translate(document);
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
	user = "<%=session("USER_ID")%>";
    menu_id.text=System.Menu.GetMenuID();
    grdEmployee.GetGridControl().FrozenCols =5;
    grdBreakContract.GetGridControl().FrozenCols =4;
      seniority_amt="<%=CtlLib.SetDataSQL("select nvl(num_3,0) from vhr_hr_code where id='HR0006' and code='10'")%>";
     <%=CtlLib.SetGridColumnComboFormat( "grdEmployee" , 7 ,  "select code,CODE_NM from vhr_hr_code where id='HR0004' order by code_nm ") %>; 
     <%=CtlLib.SetGridColumnComboFormat( "grdBreakContract" , 5 ,  "select code,CODE_NM from vhr_hr_code where id='HR0004' order by code_nm ") %>; 
    
     grdEmployee.SetComboFormat(p_return_health_card,"#Y;Yes|#N;No|#C;Not Yet");
     
	 BindingDataList();
     ChangeColorItem(lstOrg.GetControl());
     ChangeColorItem(lstOrg2.GetControl());
	
	
     datCheck_View.Call();
   
}
function BindingDataList()
{
	var data;
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HREM01000', 1, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>"; 
    lstReport.SetDataText(data);
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HREM01000', 2, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>"; 
    lstReport2.SetDataText(data);
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg.SetDataText(data);
	lstOrg.value ="ALL";
	lstOrg2.SetDataText(data);
	lstOrg2.value ="ALL";
	
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0009', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstNation.SetDataText(data);
	lstNation.value ="01";
	lstNation_B.SetDataText(data);
	lstNation_B.value="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0004', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstType.SetDataText(data);
	lstType.value ="ALL";
	lstType_B.SetDataText(data);
	lstType_B.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('YN', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstBreak_Con_B.SetDataText(data);
	lstBreak_Con_B.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0001', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstContract_Type_B.SetDataText(data);
	lstContract_Type_B.value ="ALL";
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
function OnDataReceive(obj)
{
	if(obj.id == "datCheck_View")
    {
        if(txtFlag_View.text == 'Y')
        {
            ibtnSave.style.display = "none";
            ibtnSave_B.style.display = "none";
            idBtnCalSer.style.display = "none";
            idBtnCalSer_B.style.display = "none";
        }
        if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	    {
            datUser_info.Call();     	    
	    }
        else
	        check_init = 1;
        
    }
	else if (obj.id=="datUser_info")
    {
		check_init = 1;
    }
	else if (obj.id=="datFind_Report")
    {
		if(txtReportCode_tmp.text == "28") // Resign Form
		{	
			var url =System.RootURL + txtReport_tmp.text + '?pk_list='+ pk_list ;
		}
		if(txtReportCode_tmp.text =="29")
		{ 
			url =System.RootURL +  txtReport_tmp.text +'?p_user=' + user + '&p_tco_org_pk=' + lstOrg.value
			+  '&p_input=' + txtEmployee.text + '&p_from=' +  dtFromDate.value +'&p_to=' + dtToDate.value            
            +  '&p_type='+lstType.value +'&p_nation=' + lstNation.value+'&p_lang='+v_language;
		}
		if(txtReportCode_tmp.text=="30")
		{
			url = System.RootURL + txtReport_tmp.text + '?p_user=' + user + '&p_tco_org_pk=' + lstOrg2.value
			+ '&p_input=' + txtEmployee_B.text + '&p_from=' + dtFromDate_B.value + '&p_to=' + dtToDate_B.value
			+ '&p_type=' + lstType_B.value + '&p_con_type=' + lstContract_Type_B + '&p_br_type=' + lstBreak_Con_B.value
			+ '&p_nation=' + lstNation_B.value + '&p_lang=' + v_language;
		}
		
		window.open(url);
    }
	else if (obj.id=="datResignedEmployee")
	{
		lblRecord.text = grdEmployee.rows-1;
	}
	else if (obj.id == "datBreakContract")
	{
		lblRecord_B.text = grdBreakContract.rows-1;
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
//-----------------------------------------------
function OnShowPopup(n)
{
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:60;dialogTop:200;edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
            if(n==1)
			{
				lstOrg.value=obj;
			}	
			else  
			{
				lstOrg2.value=obj;   
			}	
        }
}
//-----------------------------------------------
function OnSearch(obj)
{ 
	if(check_init==1)
	{
		if (obj==1)
		{ 
			datResignedEmployee.Call("SELECT");
		}
		else
		{
			datBreakContract.Call("SELECT");
		} 
	}	
}
//----------------------------------
function OnProcess(obj)
{
	if(obj =="1")
	{
		if (confirm("Do you want to process data?\n Bạn có muốn xử lý dữ liệu?"))
		{
			datCal_All.Call();
		}
	}
	else
	{
		if (confirm("Calculate all employee in list will take a long time, Do you want to continue?\nCông việc thực hiện một khoảng thời gian, Bạn có muốn tiếp tục không?"))
		{
			for (var i=0;i<grdBreakContract.rows;i++)
			{
					grdBreakContract.SetRowStatus(i,16);
			}
		}    
		datBreakContract.Call();
	}
    
}
//----------------------------------------
function ShowDetail(grd_obj,emp_pk_obj)
{
    var itype,isal,iale,ileft_dt;
    if (grd_obj==grdEmployee)
    {
        itype=7; //resign type column
        iale=10;
        isal=17;
        ileft_dt=6;
    }
    else
    {
        itype=5; //resign type column
        isal=3;
    }
    if (event.col==itype ) // double on resign type column
    {
        var code=grd_obj.GetGridData(event.row,itype);
        var id="HR0004";
        var fpath = System.RootURL + "/standard/forms/hr/em/hrem01001.aspx?code=" + code + "&id=" + id;
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:30;dialogHeight:25;dialogLeft:300;dialogTop:230;edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
            if(obj[0]!=code)
            {
                grd_obj.SetGridText(event.row,itype,obj[0]);
                grd_obj.SetCellBgColor(event.row, itype,event.row, itype, 0xcc99ff );
                grd_obj.SetCellBold(event.row,itype,event.row,itype,true);
            }
        
        }
    }
    else if (event.col==iale && grd_obj==grdEmployee) // double on remain ale column
    {
        var emp_pk=grd_obj.GetGridData(event.row,emp_pk_obj);
        var left_dt=grd_obj.GetGridData(event.row,ileft_dt);
        var fpath = System.RootURL + "/standard/forms/hr/em/hrem01002.aspx?emp_pk=" + emp_pk + "&year=" + left_dt.substr(0,4);
        window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:30;dialogHeight:25;dialogLeft:300;dialogTop:230;edge:sunken;scroll:yes;unadorned:yes;help:no');
    }
    else if (event.col==isal) // double on salary column
    {
        var emp_pk=grd_obj.GetGridData(event.row,emp_pk_obj);
        
        var fpath = System.RootURL + "/form/ch/ae/chae00120_salary.aspx?emp_pk=" + emp_pk ;
        window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:no;dialogWidth:50;dialogHeight:25;dialogLeft:100;dialogTop:230;edge:sunken;scroll:yes;unadorned:yes;help:no');
    }
}
//-----------------------------------------------
function OnReport(obj)
{
	if(check_init==1)
	{
		if(obj =="1") //tab đầu tiên
		{
			if(lstReport.value =="28") 
			{	
				pk_list="";
                for (var i=1;i<=grdEmployee.rows-1;i++)
                {
                   if (grdEmployee.GetGridData(i,0)!="0")      
                        if (grdEmployee.GetGridData(i,l_col_resign_pk)!="")
                            pk_list += grdEmployee.GetGridData(i,l_col_resign_pk) + ",";
                }   
				
                if (pk_list=="")
                {
                    alert((v_language =="ENG")?"Please select employees":"Bạn hãy chọn nhân viên");
                    return;
                }
				txtReportCode_tmp.text = lstReport.value;
				txtOrg_tmp_pk.text=lstOrg.value;
			}
			else if(lstReport.value =="29")
			{
/*				if(txtOption.text =="1")
				{
					dtfrom.text = dtMonth.value + "01";
					dtto.text = dtMonth.value + "31";
				}
				else if(txtOption.text =="2")
				{
					dtfrom.text = dtFromDate.value;
					dtto.text = dtToDate.value;
				}
*/				
				txtReportCode_tmp.text = lstReport.value;
				txtOrg_tmp_pk.text=lstOrg.value;
			}
			
		}
		else if(obj=="2") // tab thứ 2 break contract
		{
			if(lstReport2.value =="30") 
			{	
				txtReportCode_tmp.text = lstReport2.value;
				txtOrg_tmp_pk.text=lstOrg2.value;
			}
		}
		datFind_Report.Call();
		
	}	
}
</script>
<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<!-------------------data control----------------------->
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
<!------------------------------------------>
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="txtdept_temp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------>
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
<gw:data id="datEquip" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_HREM01000_0" > 
                <input bind="grdReturn" >
                </input>
                <output  bind="grdReturn" />
            </dso> 
        </xml> 
</gw:data>

<!----------------------------------------------------------->
<gw:data id="datResignedEmployee" onreceive="OnDataReceive(this)"  > 
        <xml> 
           <dso  type="grid"  parameter="6,7,8,10,11,12,14,15,17,18,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43" function="ST_HR_SEL_HREM01000_1" procedure="ST_HR_UPD_HREM01000_1"> 
                <input bind="grdEmployee">
					<input bind="txtEmployee" /> 
                    <input bind="dtFromDate" /> 
                    <input bind="dtToDate" /> 
                    <input bind="lstOrg" />  
                    <input bind="lstType" /> 
					<input bind="lstNation" />
                </input> 
                <output bind="grdEmployee"/>
            </dso> 
        </xml> 
</gw:data>
<!----------------------------------------------------------->
<gw:data id="datBreakContract" onreceive="OnDataReceive(this)"  > 
        <xml> 
           <dso  type="grid"  function="ST_HR_SEL_HREM01000_2" parameter="0,5,7,8,9,10,11,13,14" procedure="ST_HR_UPD_HREM01000_2"> 
                <input bind="grdBreakContract">
                    <input bind="txtTemp1" /> 
                    <input bind="txtTemp2" /> 
                    <input bind="lstOrg2" /> 
                    <input bind="lstType_B" />  
                    <input bind="txtEmployee_B" /> 
                    <input bind="lstContract_Type_B" /> 
                    <input bind="lstBreak_Con_B" />  
					<input bind="lstNation_B" />
					
                </input> 
                <output bind="grdBreakContract"/>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------->
<gw:data id="datCal_All" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HREM01000_0" > 
                <input>
                    <input bind="dtFromDate" /> 
                    <input bind="dtToDate" /> 
                    <input bind="lstOrg" /> 
                    <input bind="lstType" /> 
                    <input bind="txtEmployee" /> 
					<input bind="lstNation" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!-------------------data control----------------------->
<gw:tab id="tabMain"  border=1 style="width:100%;height:100%;"  >
   <table name="Resigned Employee"width="100%" cellpadding="0" cellspacing="0" style="width:100%;height:100%;border:1px solid #62ac0d;">
        <tr style="width:100%;height:100%" valign="top">
            <td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>	
					<table width="100%" id="tblexp" style="height:100%" cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height=50%" valign="center" >
							<td colspan=2 width="2%" style="border:0" align="left"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0"  align="left" >
								Employee
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:textbox id="txtEmployee" onenterkey ="OnSearch(1)" />
							</td>
							<td colspan=2 width="2%" style="border:0"   >								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								Resign Type
							</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:list  id="lstType" value='ALL' maxlen = "100" styles='width:100%' >
									<data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0004' order by code_nm")%>|ALL|Select All</data>
								</gw:list>
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 style="border:0" width="12%" align="left" >
								Nation
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:list  id="lstNation" value='ALL' maxlen = "100" styles='width:100%' >
									<data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm" )%>|ALL|Select All</data>
								</gw:list>
							</td>
							<td colspan=4 width= "4%"></td>
						</tr>
						<tr style="border:0;width:100%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0"  align="left" >
								<a class="eco_link" title="Click here to show organization" onclick="OnShowPopup(1)" href="#tips"  style="text-decoration : none; color=#0000FF">Organization</a>
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								<gw:list  id="lstOrg" value='ALL' maxlen = "100" styles='width:100%'  >
									<data>
										<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk) or '" + session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
									</data>
								</gw:list>
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								<gw:list  id="lstPeriod" value='1' maxlen = "100" styles='width:80%' onchange="OnChangeDate(lstPeriod, dtFromDate, dtToDate)" >
									<data>
										|1|Daily|2|Weekly|3|Monthly
									</data>
								</gw:list>
							</td>
							<td colspan=20 width="20%" style="border:0">
								<gw:datebox id="dtFromDate"  styles="width:100%" lang="<%=Session("Lang")%>" />
								~
								<gw:datebox id="dtToDate"  styles="width:100%" lang="<%=Session("Lang")%>" />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 style="border:0" width="12%" align="left" >
								
							</td>
							<td colspan=20 style="border:0" width="20%"  align="left" >
								
							</td>							
						</tr>												
					</table>
					</fieldset>					
				</div>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:5%; ">
					<table width="100%"  style="height:100%" border=1 cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >Rows:</td>
							<td colspan=5 width="5%" style="border:0"> 
								<gw:label id="lblRecord"  text="" maxlen = "100" />
							</td>
							<td colspan=58 width="58%" style="border:0" align="center" >
								 
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="search" text="Search" id="ibtnSearch"   alt="Search"  onclick="OnSearch(1)"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="save" text="Save" id="ibtnSave"    alt="Save"  onclick="OnSave(grdEmployee,datResignedEmployee)"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="idBtnCalSer"  img="process"  text="Process"  onclick="OnProcess(1)"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnReport" alt="Report" img="excel" text="Report" onclick="OnReport('1')"/>
							</td>
							
							<td colspan=10 width="10%" style="border:0" align="left" >
								<gw:list  id="lstReport" styles="color:blue;width:100%" onchange=""/> 
							</td>				
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:85%">
					<table  cellspacing=0 cellpadding=0 style="height:100%" width="100%" border=1>
						<tr valign="top">
							<td  style="width:100%;height:75%;"> 
								<gw:grid id="grdEmployee" 
								header="V|_Department|Group|Emp ID|Full Name|Join Date|Left Date|Resign Type|Remark|ALE Last Year|Remain ALE|Remain ALE AMT|Severance Flag|_Salary|Severance Month|Not UnEmp Month|Severance Month Total|Severance Amount|Seniority AMT|Health YN|Return Health Card|Not Timely|Deduct Months|_Return Card|_Calculate Salary|_EQUIP 1|_Amount|_EQUIP 2|_Amount|_EQUIP 3|_Amount|_EQUIP 4|_Amount|_EQUIP 5|_Amount|_EQUIP 6|_Amount|_EQUIP 7|_Amount|_EQUIP 8|_Amount|_EMP_PK|By Hand|_RESIGN_PK" 
								format="3|0|0|0|0|4|4|2|1|1|0|1|3|1|0|0|0|1|1|0|2|3|0|3|3|3|1|3|1|3|1|3|1|3|1|3|1|3|1|3|1|0|3|0" 
								aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
								defaults="|||||||||||||||||||||||||||||||||||||||||||" 
							   editcol="1|0|0|0|0|0|0|1|1|1|1|1|1|0|1|1|0|1|1|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1" 
								widths="300|1500|1500|1000|2500|1200|1200|2500|1300|1200|1200|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1500|1500|1200|1500" 
								styles="width:100%; height:100%"
								sorting="T" acceptNullDate 
								 oncelldblclick="ShowDetail(grdEmployee,l_col_employee_pk)" />
							</td>
						</tr>
				   </table> 
				</div>
            </td>
        </tr>
    </table>
    <table name="Break Contract" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;">
        <tr style="width:100%;height:100%" valign="top">
            <td>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border-bottom:1px solid #62ac0d;width:100%;height:10%">
					<fieldset style="padding: 5">
					<legend ><font class="eco_blue" ><b>Filter Data</b></font></legend>
					<table width="100%" id="tblexp" style="height:100%" cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%" valign="center" >
							<td colspan=2 width="2%" style="border:0" align="left"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0"  align="left" >
								Employee
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:textbox id="txtEmployee_B" onenterkey   ="OnSearch(2)" styles='width:100%'/>
							</td>

							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								Resign Type
							</td>
							<td colspan=20 width="20%" style="border:0"> 
								<gw:list  id="lstType_B" value='ALL' maxlen = "100" styles='width:100%' >
									<data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0004' order by code_nm")%>|ALL|Select All</data>
								</gw:list>
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0"  align="left" >
								Contract Type
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								<gw:list  id="lstContract_Type_B" value='ALL' maxlen = "100" styles='width:100%' >
									<data>
										|Y|Yes|N|No|ALL|Select All
									</data> 
								</gw:list>
							</td>
							<td colspan = 4 width ="4%"style="border:0"  align="left">
							</td>
							
						</tr>
						<tr style="border:0;width:100%" valign="center" >
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0"  align="left" >
								<a class="eco_link" title="Click here to show organization" onclick="OnShowPopup(2)" href="#tips"  style="text-decoration : none; color=#0000FF">Organization</a>
							</td>
							<td colspan=20 width="20%" style="border:0"  align="left" >
								<gw:list  id="lstOrg2" value='ALL' maxlen = "100" styles='width:100%' onchange="" >
									<data>
										<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk) or '" + session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
									</data>
								</gw:list>
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 style="border:0" width="10%" align="left" >
								<gw:list  id="lstPeriod_B" value='1' maxlen = "100" styles='width:80%' onchange="OnChangeDate(lstPeriod_B, dtFromDate_B, dtToDate_B)" >
									<data>
										|1|Daily|2|Weekly|3|Monthly
									</data>
								</gw:list>
							</td>
							<td colspan=20 style="border:0" width="20%"  align="left" >
								<gw:datebox id="dtFromDate_B"  styles="width:100%" lang="<%=Session("Lang")%>" />
								~
								<gw:datebox id="dtToDate_B"  styles="width:100%" lang="<%=Session("Lang")%>" />
							</td>
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=10 style="border:0" width="10%" align="left" >
								Break Contract
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
								<gw:list  id="lstBreak_Con_B" value='ALL' maxlen = "100" styles='width:100%' >
									<data> |Y|Yes|N|No|ALL|Select All</data>
								</gw:list>
							</td>
							<td colspan=20 width="20%" style="border:0" align="left">
							</td>
						</tr>
						
					</table>
					</fieldset>
				</div>
				<div style="border-top0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:5%">
					<table width="100%"  style="height:100%" border=1 cellpadding="0" cellspacing="0">
						<tr style="border:0;width:100%;height:4%" valign="center">
							<td colspan=2 width="2%" style="border:0"   >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >Rows:</td>
							<td colspan=5 width="5%" style="border:0"> 
								<gw:label id="lblRecord_B"  text="" maxlen = "100" />
							</td>
							<td colspan=58 width="58%" style="border:0" align="left" >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="search" id="ibtnSearch_B" text="Search"  alt="Search"  onclick="OnSearch(2)"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								 <gw:button img="save" id="ibtnSave_B"    alt="Save" text="Save" onclick="OnSave(grdBreakContract,datBreakContract)"/>
							</td>
							<td colspan=5 width="5%" style="border:0" >
								<gw:button img="process" id="idBtnCalSer_B"    text="Process"  onclick="OnProcess(2)"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button id="ibtnReport2" alt="Report" img="excel" text="Report" onclick="OnReport('2')"/>
							</td>
							
							<td colspan=10 width="10%" style="border:0" align="left" >
								<gw:list  id="lstReport2" styles="color:blue;width:100%" onchange=""/> 
							</td>
						</tr>
					</table>
				</div>
				<div  style="border-top:1px solid #62ac0d;border-left:1px solid #62ac0d;border-right:1px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:85%">
					<table  cellspacing=0 cellpadding=0 style="height:100%" width=100% border=1>
						<tr valign="top">
							<td  style="width:100%;height:100%;"> 
								<gw:grid id="grdBreakContract" 
								header="_Emp PK|Team/Section|Emp ID|Full Name|Join Date|Resign Type|Contract No.|Deduct Days(Rule)|Break Contract|Notice Date|Left Date|Deduct Days|_Basic Salary|Deduct Amount|Input by Hand" 
								format="0|0|0|0|4|2|0|0|3|4|4|0|1|1|3" 
								aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0" 
								defaults="||||||||||||||" 
								editcol="0|0|0|0|0|0|0|0|1|1|0|0|0|1|1" 
								widths="1000|1500|1000|2500|1200|1200|2500|1300|1200|1500|1500|1500|1800|1800|1500" 
								styles="width:100%; height:100%" 
								sorting="T" acceptNullDate 
								oncelldblclick="ShowDetail(grdBreakContract,0)" />
							</td>
						</tr>
				   </table> 
				</div>
            </td>
        </tr>
    </table>
</gw:tab>
</body>
<gw:textbox id="txtdept_temp" styles="display:none"/>
<gw:textbox id="txtDept_PK" styles="display:none"/>
<gw:textbox id="txtOption" text="1" styles="display:none"/> 
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>
<gw:textbox id="txtTemp1" styles="display:none"/>
<gw:textbox id="txtTemp2" styles="display:none"/>
<gw:textbox id="txtResult" styles="display:none" text="0"/>
<gw:textbox id="iduser_pk" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txtReport_tmp" styles="display:none"/>
<gw:textbox id="txtReportCode_tmp" styles="display:none"/>
<gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
<gw:textbox id="txtorg_tmp" styles="display:none"/>
<gw:textbox id="txtwg_tmp" styles="display:none"/> 
<gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtFlag_View" text="" styles="display:none"  />
<gw:textbox id="dtfrom" text="" styles="display:none"  />
<gw:textbox id="dtto" text="" styles="display:none"  />
<gw:list  id="lstNation_B" value='ALL' maxlen = "100" styles='width:100%' >
	<data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm" )%>|ALL|Select All</data>
</gw:list>
<gw:grid   
    id="grdReturn"  
    header="Code Name 1|Code Name 2|Code Name 3|Code Name 4|Code Name 5|Code Name 6|Code Name 7|Code Name 8"
    format="0|0|0|0|0|0|0|0"  
    aligns="0|2|2|1|0|0|1|1"  
    defaults="|||||||"  
    editcol="0|0|0|0|0|1|1|1"  
    widths="1500|1500|1600|1000|2500|1500|1700|1500"  
    styles="display:none" 
    sorting="T"    
/> 


</html>
