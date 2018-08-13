<!-- #include file="../../../../system/lib/form.inc"  -->
 <%CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
    var user;
    var v_language = "<%=Session("SESSION_LANG")%>";
    var rpt_no = 0;
    var interval_time = 0;
    
    var c_org_nm = 0;
    var c_emp_id = 2;
    var c_full_nm = 3;
    var c_time_in = 5;
    var c_meal_emp_type = 8;
    var c_close_yn = 11;
    var c_daily_close_yn = 11;

function BodyInit()
{
    if (v_language!="ENG")
        System.Translate(document);	
    //lstWeek.SetEnable(0);
   
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    user= "<%=session("USER_ID")%>";
    
    idGrid1.GetGridControl().ScrollTrack=true;
    tr_process.style.display = "none";
    idGrid1.GetGridControl().ColEditMask(c_time_in) = "99:99";
    <%=CtlLib.SetGridColumnComboFormat("idGrid1", 6, "select code,CODE_NM from vhr_hr_code where id='HR0191' order by code")%>;
    <%=CtlLib.SetGridColumnComboFormat("idGrid1", 8, "select 'IN' code, 'Emp of Company' CODE_NM from dual union select 'OUT' code, 'Out of Company' CODE_NM from dual order by code")%>;

	ChangeColorItem(lstOrg.GetControl());
}
//----------------------------------
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
function OnSetColEdit(n)
{
    idGrid1.SetColEdit(c_emp_id, n);
    idGrid1.SetColEdit(c_full_nm, n);
}
//-------------------------------------------------
function OnDataReceive(obj)
{
    
    var obj_lst;
       if (obj.id=="datCheck_meal")
       {
           idRecord.text=idGrid1.rows-1+" Records."; 
           auto_resize_column(idGrid1, 0, idGrid1.cols - 1, 0)
           OnSetColEdit(0);
           for (var i = 1; i < idGrid1.rows; i++)
           {
               if (idGrid1.GetGridData(i, c_close_yn) == "Y")
                   idGrid1.SetCellBgColor(i, c_org_nm, i, c_daily_close_yn, 0xFFEEFF);
           }
       }
       else if (obj.id == "datProcess_Meal")
       {
           clear_Interval(idInterval);
           if (txtResult.text == "0") {
               alert(txtflag.text + " successful!");
               idInterval.text = txtflag.text + " successful.";
           }
           else
           {
               alert("Have error, unsuccessful!");
               idInterval.text = txtflag.text + " unsuccessful.";
           }
           on_Enable(1);
       }
       else if (obj.id == "datChangeMealType") {
           lstMealTimes.SetDataText(txtResult.text + '|ALL|Select All');
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
//-------------------------------------------------
function OnShowPopup(n)
{
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
        //var obj  = System.OpenModal(  fpath , 300 , 200 , 'resizable:yes;status:yes');
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
            lstOrg.value=obj
        }
}

//------------------------------------------------------------  
function OnSearch(obj)
{
    obj.Call("SELECT");
}

function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}

function OnToggle() {
    if (img1.status == "show") {
        img1.status = "hide";
        img1.src = "../../../../system/images/close_popup.gif";
        img1.alt = "Hide Process Meal information";
        tr_process.style.display = '';
    }
    else {
        img1.status = "show";
        img1.src = "../../../../system/images/iconmaximize.gif";
        img1.alt = "Show Process Meal information";
        tr_process.style.display = "none";
    }

}

function on_Enable(n)
{
    icoProcess.SetEnable(n);
    icoClose.SetEnable(n);
    icoOpen.SetEnable(n);
}
    
function on_Process(obj)
{
    txtflag.text = obj;
    idInterval.text = "";
    switch (obj) {
        case 'PROCESS':

            if (confirm("Do you want to process meal?")) {
                set_Interval(1000);
                on_Enable(0);
                datProcess_Meal.Call();
            }
            break;

        case 'VISITOR':
            var url = "/standard/forms/hr/me/hrme00302.aspx";
            var aData = System.OpenModal(System.RootURL + url, 900, 600, 'resizable:yes;status:yes');
            break;

        case 'OPEN':
            if (confirm("Do you want to open?")) {
                on_Enable(0);
                datProcess_Meal.Call();
            }
            break;

        case 'CLOSE':
            if (confirm("Do you want to close?")) {
                on_Enable(0);
                datProcess_Meal.Call();
            }
            break;

        case 'OTHER':
            var url = "/standard/forms/hr/me/hrme00304.aspx";
            var aData = System.OpenModal(System.RootURL + url, 900, 600, 'resizable:yes;status:yes');
            break;
    }
}

function OnPopup(obj)
{
    switch (obj)
    {
        case 'addnew':
            var url, aEmp;

            url = "/standard/forms/hr/me/hrme00303.aspx";
            aEmp = System.OpenModal(System.RootURL + url, 200, 150, 'resizable:yes;status:yes', this);

            if (aEmp != null)
            {
                var aVal = aEmp[0];
                if (aVal == "IN")
                {
                    url = "/standard/forms/hr/me/hrme00301.aspx";
                    aData = new Array();
                    aData = System.OpenModal(System.RootURL + url, 900, 700, 'resizable:yes;status:yes');
                    //alert(aData.length)
                    if (aData != null) {
                        var len = aData.length;
                        var i;
                        for (i = 0; i < len; i++) {
                            idGrid1.AddRow();
                            var irow = idGrid1.rows - 1;
                            aRow = aData[i];
                            idGrid1.SetGridText(irow, 2, aRow[0]);		// emp id
                            idGrid1.SetGridText(irow, 3, aRow[1]);		// full name
                            idGrid1.SetGridText(irow, 4, aRow[2]);		// work dt 
                            idGrid1.SetGridText(irow, 9, aRow[3]);		// emp_pk 
                            idGrid1.SetGridText(irow, c_meal_emp_type, 'IN');		// c_meal_emp_type
                        }
                    }
                }
                else    //aVal == "OUT"
                {
                    idGrid1.AddRow();
                    var irow = idGrid1.rows - 1;
                    OnSetColEdit(1);
                    idGrid1.SetGridText(irow, c_meal_emp_type, 'OUT');		// c_meal_emp_type
                }
            }
            break;

        case 'save':
            if (confirm("Do you want to save? \n Bạn muốn lưu không?"))
                datCheck_meal.Call();

            break;

        case 'delete':
            if (confirm("Delete it?\nBạn muốn xóa?")) {
                idGrid1.DeleteRow();
                datCheck_meal.Call();
            }
            break;
    }
}

function On_AfterEdit() {
    var tmpIN, tmpDT, temp;
    cIdx = event.col;
    
    if (cIdx == c_time_in) {
        tmpIN = idGrid1.GetGridData(event.row, cIdx)
        if (tmpIN.length == 0) {
            idGrid1.SetGridText(event.row, cIdx, "")
            //return;
        }
        if ((tmpIN.length != 4) && (tmpIN.length != "")) {
            alert("Input In time is not correct type.(type: hh:mm)\nKiểu giờ in nhập không đúng")
            idGrid1.SetGridText(event.row, cIdx, '')
            return;
        }
        if ((Number(tmpIN.substr(0, 2)) >= 24) || (Number(tmpIN.substr(0, 2)) < 0)) {
            alert("Input In time(Hour) is not correct type.(00<= hh <= 23)\nKiểu giờ in phải >=00 và <=23")
            idGrid1.SetGridText(event.row, cIdx, '')
            return;
        }
        if ((Number(tmpIN.substr(2, 2)) >= 60) || (Number(tmpIN.substr(2, 2)) < 0)) {
            alert("Input In time(Minute) is not correct type.(00<= hh < 59)\nKiểu phút phải >=00 và <=59")
            idGrid1.SetGridText(event.row, cIdx, '')
            return;
        }
        if (tmpIN.length > 0) {
            tmpIN = tmpIN.substr(0, 2) + ":" + tmpIN.substr(2, 2)
            idGrid1.SetGridText(event.row, cIdx, tmpIN)
        }

    }
    
}

function OnchangeMealType()
{
    datChangeMealType.Call();
}


function OnReport()
{
    var url = System.RootURL +  lstReport.value + '?l_tco_dept_pk=' + lstOrg.value + '&l_thr_group_pk=' + lstWGroup.value + '&l_from_dt=' + FromDT.value + '&l_to_dt=' + ToDT.value;
           url = url + '&l_search_by=' + idSearch.value + '&l_search_tmp=' + idtxtTmp.text + '&l_meal_emp_type=' + lstEmpType.value + '&l_meal_type=' + idMealType.value + '&l_meal_times=' + lstMealTimes.value;  

           window.open(url);

}

//-------------------------------------------------------------------------------------------
</script>
<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
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


<gw:data id="datCheck_meal" onreceive="OnDataReceive(this)"  > 
        <xml> 
           <dso  type="grid" parameter="2,3,4,5,6,8,9,10" function="ST_HR_SEL_HRME00300_1" procedure="ST_HR_UPD_HRME00300_1" > 
                <input bind="idGrid1"> 
                    <input bind="lstOrg" /> 
                    <input bind="lstWGroup" /> 
                    <input bind="FromDT" /> 
                    <input bind="ToDT" /> 
                    <input bind="idSearch" />
                    <input bind="idtxtTmp" />
                    <input bind="lstEmpType" />
                    <input bind="idMealType" />
                    <input bind="lstMealTimes" />
                </input> 
                <output bind="idGrid1"/>
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------->
<gw:data id="datProcess_Meal" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRME00300_1" > 
                <input>
                    <input bind="dtFromDt" />
                    <input bind="dtToDt" />
                    <input bind="txtflag" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------>

<gw:data id="datChangeMealType" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_HRME00300_1"  > 
                <input>
                    <input bind="idMealType" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!--------------------main table----------------------------------->


    <table name="Detail" id="Meal_check" class="itable" width="100%" cellpadding="0"  cellspacing="0" border=0 style="height:100%;">
     <tr style="width:100%;height:100%" valign="top">
        <td>
            <table width="100%" style="height:17%" border="0" cellspacing="1" cellpadding="1">
                
                <tr id="tr_process" style="border:1;width:100%;height:5%" valign="center"  >
                    <td colspan="100">
                        <table style="width:100%;height:100%" cellpadding="1" cellspacing="1" valign="top" border="1">
                            <tr style="width:100%;height:100%"  >
                                <td width="30%" align=center style="border:0" ><font size="3" color="FF3399">Process Meal Information</font></td>
                                <td width="10%" style="border:0;" align="right" >Meal Date</td>
                                <td width="10%"  style="border:0;" align=center ><gw:datebox id="dtFromDt" value="" maxlen = "10" text="" type ="date" styles='width:100%'lang="<%=Session("Lang")%>" /></td>
                                <td width="2%" style="border:0;" align=cener >~</td>
                                <td width="10%"  style="border:0;" align=left ><gw:datebox id="dtToDt" value="" maxlen = "10" text="" type ="date" styles='width:100%'lang="<%=Session("Lang")%>" /></td>
                                <td width="10%" align=center style="border:0" ><gw:icon id="icoProcess" img="in" text="Process" onclick="on_Process('PROCESS')" /></td>
                                <td width="2%" style="border:0" align="right"></td>
                                <td width="14%" style="border:0" align="left"><gw:label id="idInterval" text="" styles="width:100%;color:red" ></gw:label></td>
                                <td width="5%" align=center style="border:0" ><gw:icon id="icoOpen" img="in" text="Open" onclick="on_Process('OPEN')" /></td>
                                <td width="5%" align=center style="border:0" ><gw:icon id="icoClose" img="in" text="Close" onclick="on_Process('CLOSE')" /></td>
                                <td width="2%" align=center style="border:0" ></td>
                            </tr>
                        </table>
                    </td>
                </tr>
				<tr>
					<td colspan= 2 width="2%" style="">
						<img status="show" id="img1" alt="Show Process Meal Imfomation" src="../../../../system/images/iconmaximize.gif" style="cursor:hand" onclick="OnToggle()"  />
					</td>
					<td colspan=10 width="10%" align="left" style="white-space:nowrap">
						<a title="Click here to show organization" onclick="OnShowPopup(1)" href="#tips" >Organization</a>
					</td>
					<td colspan=20 width="20%">
						<gw:list  id="lstOrg" value="ALL"  maxlen = "100" styles='width:100%' onchange="" >
							<data>
								<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
							</data>
                        </gw:list>
					</td>
					
					<td colspan=2 width="2%" style="border:0"   >
						
					</td>
					<td colspan=10 width="10%" style="border:0" align="left"> Meal Type </td>
					<td colspan=10 width="10%" style="border:0"> 
						<gw:list  id="idMealType" value="ALL" styles="width:98%" onChange="OnchangeMealType()">
                            <data>|1|Meal Main|2|Snack Time|ALL|Select All</data></gw:list>
					</td>	
					<td colspan=10 width="10%" style="border:0"> 
						<gw:list  id="lstMealTimes" value='ALL'  styles='width:100%' >
                        <data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0191' order by code" )%>|ALL|Select All</data></gw:list>
					</td>	
					<td colspan= 2 width="2%" style="">
					</td>									
					<td colspan=10 width="10%" align="left" style="white-space:nowrap">Search by</td>
					<td colspan=10 width="10%">
						<gw:list  id="idSearch" value="1" styles="width:95%" onChange="">
                            <data>|1|Emp ID|2|Card ID|3|Name</data></gw:list>
					</td>
					<td colspan=12 width="12%">
						<gw:textbox id="idtxtTmp" maxlen = "20" styles="width:100%" onenterkey="OnSearch(datCheck_meal)" />
					</td>
				</tr>
                <tr>
					<td colspan= 2 width="2%" style="">
					</td>
					<td colspan=10 width="10%" align="left" style="white-space:nowrap">
						Work Date
					</td>
					<td colspan=20 width="20%">
						<gw:datebox id="FromDT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" />
						~ <gw:datebox id="ToDT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" />
					</td>
					<td colspan= 2 width="2%" style="">
					</td>									
					<td colspan=10 width="10%" align="left" style="white-space:nowrap">Meal Emp Type</td>
					<td colspan=20 width="20%">
						<gw:list  id="lstEmpType" value='IN'  styles='width:100%' >
                        <data>|IN|Emp of Company|OUT|Out of Company|ALL|Select All</data></gw:list>
					</td>
					<td colspan=2 width="2%" style="border:0"   >
						
					</td>
					<td colspan=10 width="10%" style="border:0" >  
						<gw:button id="ibtnReport" img="excel"   text="Report"  onclick="OnReport(1)"/>
					</td>
					<td colspan=22 width="22%" style="border:0"> 
						<gw:list  id="lstReport" styles="color:blue;width:100%" onchange=""> 
					             <data><%=CtlLib.SetListDataSQL("select char_2,CODE_NM from vhr_hr_code where id='HR0156' and char_1='hrme00300' order by seq")%></data>
						</gw:list>
					</td>									
				</tr>
				<tr style="border:0;width:100%;height:4%" valign="center"  >
					<td colspan=5 width="5%" style="border:0"   >
						Rows: 
					</td>
					<td colspan=10 width="10%" style="border:0" align="left" >
						<gw:label id="idRecord" text="0 record(s)" styles="width:100%;color:red" ></gw:label>
					</td>
					<td colspan=65 width="65%" style="border:0"> 
						
					</td>
					
					<td colspan=5 width="5%" style="border:0" align="left" >
						<gw:button id="ibtnSearch" alt="Search" img="search" text="Search" onclick="OnSearch(datCheck_meal)" />
					</td>
					<td colspan=5 width="5%" style="border:0" align="left" >
						<gw:button id="ibtnSave" alt="Save" img="save" text="Save" onclick="OnPopup('save')" />
					</td>
					<td colspan=5 width="5%" style="border:0" align="left" >
						<gw:button id="ibtnAdd" alt="Add new" img="new" text="Add new" onclick="OnPopup('addnew')" />
					</td>
					<td colspan=5 width="5%" style="border:0" align="left" >
						<gw:button id="ibtnDelete" alt="Delete" img="delete" text="Delete" onclick="OnPopup('delete')" />
					</td>
					
				</tr>
            </table>
            <table cellspacing=0 cellpadding=0 style="height:83%" width=100% border="1">
                    <tr style="border:1;height:100%" valign="top">
                        <td  style="width:100%"> 
                            <gw:grid   
	                            id="idGrid1"  
	                            header="Organization|Work Group|Employee ID|Full Name|Work Date|Time In|Meal Times|Mod by Hand|Employee Type|_emp_pk|_thr_meal_checking_pk|_Close_yn|Daily Close (Y/N)"   
	                            format="0|0|0|0|4|0|2|0|0|0|0|0|0"  
	                            aligns="0|0|1|0|1|1|1|1|1|0|0|0|1"  
	                            defaults="||||||||||||"  
	                            editcol="0|0|0|0|1|1|1|1|0|0|0|0"  
	                            widths="2000|2500|1500|3000|1500|1500|1500|2000|1500|0|0|0|1000"  
	                            styles="width:100%; height:100%"   
	                            sorting="T"   
                                onafteredit="On_AfterEdit()"
	                            /> 
                        </td>
                        
                    </tr>
               </table> 
        </td>
     </tr>
    </table>  

</body>
    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txtDept" styles="display:none"/>	
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="txtdept_temp" styles="display:none"/>  
    <gw:textbox id="txtReport_tmp" styles="display:none"/>  
    <gw:textbox id="txtResult" styles="display:none"/>  
    <gw:textbox id="txtflag" styles="display:none"/> 
	<gw:list  id="lstWGroup" value="ALL"  maxlen = "100" styles='width:100%;display:none' >
                                <data><%=CtlLib.SetListDataSQL("SELECT pk,workGroup_NM FROM thr_work_group WHERE DEL_IF = 0 order by workgroup_id")%>|ALL|Select All</data></gw:list>

   
</html>
