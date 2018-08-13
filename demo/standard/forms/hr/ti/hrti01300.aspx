<!-- #include file="../../../../system/lib/form.inc"  -->
<%CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var ctlGroup;
var bChange_All=false;
var binit=true;
var v_language = "<%=Session("SESSION_LANG")%>";
var startTime,interval_time
var flag_all_wg=false;
var check_init=0;
var old_to_dt;
function BodyInit()
{ 	
    dtFrom_Date_R.SetEnable(false);
    dtTo_Date_R.SetEnable(false);
	
	
    //dtTo_Date.SetEnable(false); cho phep chon lai ngay to
	old_to_dt=dtTo_Date.value;
     
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('SALARY_PERIOD2', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
    lstSalaryPeriod.SetDataText(data);
    System.Translate_V2(document, System.Menu.GetMenuPS());
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT('HR0156','HRTI01300', 1) FROM DUAL" )%>";
    lstReport.SetDataText(data);
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstStatus_1.SetDataText(data);
	lstStatus_1.value ="ALL";
	OnChangeStatus();
    menu_id.text=System.Menu.GetMenuID();
	
	t1 = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG2', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstOrg_R.SetDataText(t1);
	lstLocation_dept.SetDataText(t1);

    ChangeColorItem(lstLocation_dept.GetControl());
    ChangeColorItem(lstOrg_R.GetControl());

    datCheck_View.Call();    
    
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

//---------------------------------------------------------------------------

function OnChangeOption(form,obj)
{
    form.optMonthReport[obj-1].checked=true;
    onChange_org(obj);
}

//------------------------------------
function OnShowPopup()
{
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:200;dialogTop:360;edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
        lstOrg_R.value=obj;
        lstOrg_R.value=obj;
        lstOrg_R.value=obj;
        lstOrg_R.value=obj;
        txtorg_tmp.text=obj;
        bChange_All=true;
        datWorkGroup_info.Call();
    }    
}


//------------------------------------

//------------------------------------
function OnChangeMonth(obj)
{
	if(check_init == 1)
	{
		if(obj=="1")
		{
			txtResult.text="";
			datGet_from_to.Call();
		}
		else
		{
			datGetfrom_to.Call();
		}
	}
	
    
}

function OnChangeTimes()
{
    
        txtResult.text="";
	    datGet_from_to.Call();
	 
}

function SetDeptAll()
{
    if(txtHr_level.text=="6")
            txtFact_PK.text=txtFact_PK.text+"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả";
    bChange_All=true;
    
    lstOrg_R.SetDataText(txtorg_tmp.text);
    lstOrg_R.SetDataText(txtorg_tmp.text);
    lstOrg_R.SetDataText(txtorg_tmp.text);
    lstOrg_R.SetDataText(txtorg_tmp.text);
    //datWorkGroup_info.Call();   
}
//-----------------------------------------------------
function OnDataReceive(obj)
{
    switch (obj.id)
    {
        case "datCheck_View":
        {
            if(txtFlag_View.text == 'Y')
            {
                icoProcess.style.display = "none";
            
            }
        
            if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
                 datGet_Location_dept.Call(); 
            else
			    datGet_period.Call();
            
        }
        break;
        case "datGet_Location_dept":
        {
               lstLocation_dept.SetDataText(txtFact_PK.text);
               datUser_info.Call();
               
               break;
        }
        case "datUser_info":
        {
               SetDeptAll();

                ChangeColorItem(lstLocation_dept.GetControl());
                ChangeColorItem(lstOrg_R.GetControl());
                ChangeColorItem(lstOrg_R.GetControl());
                ChangeColorItem(lstOrg_R.GetControl());
                ChangeColorItem(lstOrg_R.GetControl());

               datGet_period.Call();
               break;
        }
        case "datGet_period":
        {               
               datGet_from_to.Call();
			   
               break;
        } 
        case "datWorkGroup_info":       
        {
            if(document.form2.optMonthReport[0].checked==true)
            {
                
                    lstWG_1.SetDataText(txtwg_tmp.text +"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                    lstWG_1.value='ALL';
              
            }
            if(document.form2.optMonthReport[1].checked==true)
            {
                  lstWG_1.SetDataText(txtwg_tmp.text +"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                    lstWG_1.value='ALL';
               
            }
            if(document.form2.optMonthReport[2].checked==true)
            {
                    lstWG_1.SetDataText(txtwg_tmp.text +"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                    lstWG_1.value='ALL';    
                
            }
            if(document.form2.optMonthReport[3].checked==true)
            {
               
                    lstWG_1.SetDataText(txtwg_tmp.text +"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                    lstWG_1.value='ALL';
               
            }
            if(bChange_All==true)
            {
                lstWG_1.SetDataText(txtwg_tmp.text+"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstWG_1.SetDataText(txtwg_tmp.text+"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstWG_1.SetDataText(txtwg_tmp.text+"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstWG_1.SetDataText(txtwg_tmp.text+"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstWG_1.value='ALL';
                lstWG_1.value='ALL';
                lstWG_1.value='ALL';
                lstWG_1.value='ALL';
                //alert(txtwg_tmp.text);
            }
            bChange_All=false;
            break;
        }
		case "datGet_from_to":
		    {
		        
		        idstatus_process.text = "";
		        if (txtResult.text == 'Y') {
		            icoProcess.SetEnable(0);
		            icoOpen.SetEnable(0);
		            icoClose.SetEnable(0);
		        }
		        else if (txtResult.text == "") {
		            alert((v_language =="ENG")?"This Month Not Register.":"Tháng này chưa đăng ký");
		            icoProcess.SetEnable(0);
		            icoOpen.SetEnable(0);
		            icoClose.SetEnable(0);
		        }
		        else if (txtProcess.text == "Y") {
		            idstatus_process.text = (v_language =="ENG")?"This Month of salary has been processed":"Lương tháng này đã được xử lý, Vui lòng xóa dữ liệu trươc khi xử lý";
		            icoProcess.SetEnable(0);
		            icoOpen.SetEnable(0);
		            icoClose.SetEnable(0);
		        }
		        else {
		            if (txtWt_Close.text == "NOT")        //chua process bang cong
		            {
		                icoOpen.SetEnable(0);
		                icoClose.SetEnable(0);
		                icoProcess.SetEnable(1);
		            }
		            else if (txtWt_Close.text == "N")        //chua close bang cong
		            {
		                icoOpen.SetEnable(0);
		                icoClose.SetEnable(1);
		                icoProcess.SetEnable(1);
		            }
		            else         //da close bang cong
		            {
		                //alert(txtWt_Close.text);
		                idstatus_process.text = (v_language =="ENG")?"This Month is closed":"Tháng này đã đóng dữ liệu";
		                icoOpen.SetEnable(1);
		                icoClose.SetEnable(0);
		                icoProcess.SetEnable(0);
		            }
		        }
				
			 if(flag_all_wg==false)
			 {
				txtorg_tmp.text=lstLocation_dept.value;
				datWorkGroup_all.Call();
				flag_all_wg=true;
			 }	
			 old_to_dt=dtTo_Date.value; //luu lai ngay to cu
			
			 dtFrom_Date_R.value = dtFrom_Date.text ;
			 dtTo_Date_R.value = dtTo_Date.text;
			 
			 dtFrom_Resign.value = dtFrom_Date.text;
			 dtTo_Resign.value = dtTo_Date.text;
			 check_init=1;
			 
             break;     
	    }
		case "datWorkGroup_all":
		{
				lstWG_1.SetDataText(txtwg_tmp.text+"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstWG_1.SetDataText(txtwg_tmp.text+"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstWG_1.SetDataText(txtwg_tmp.text+"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstWG_1.SetDataText(txtwg_tmp.text+"|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstWG_1.value='ALL';
                lstWG_1.value='ALL';
                lstWG_1.value='ALL';
                lstWG_1.value='ALL';
				break;
		}
		case "datProcess_WT":  
		    if(txtResult.text=='0')
		    {
		        txtResult.text='';
		        clear_Interval(idInterval);
                idstatus_process.text=(v_language =="ENG")?"Task 2 is processing...":"Bước 2 đang xử lý...";
		        datProcess_OT.Call();
		    }
		    else
		    {
		        alert((v_language =="ENG")?"Error:Step 1(Working Month) Uncomplete.":"Lỗi: Bảng công tháng không thực hiện thành công.")
		        clear_Interval(idInterval);
		        idInterval.text="Uncomplete."
		    }    
		    break;
		  case "datProcess_OT":  
		    if(txtResult.text=='0')
		    {
		        txtResult.text='';
		        clear_Interval(idInterval);
                idstatus_process.text=(v_language =="ENG")?"Task 3 is processing...":"Bước 3 đang xử lý...";
		        datProcess_ABS.Call();
		    }
		    else
		    {
		        alert((v_language =="ENG")?"Error:Step 2(Extra Month) Uncomplete.":"Lỗi: Bảng tăng ca tháng không thực hiện thành công.")
		        clear_Interval(idInterval);
		        idInterval.text="Uncomplete."
		    }    
		    break;
		 case "datProcess_ABS":  
		    if(txtResult.text=='0')
		    {
		        txtResult.text='';
		        clear_Interval(idInterval);
                idstatus_process.text=(v_language =="ENG")?"Task 4 is processing...":"Bước 4 đang xử lý...";
		        datMonth_summary.Call();
		    }
		    else
		    {
		        alert((v_language =="ENG")?"Error:Step 3(Absence Month) Uncomplete.":"Lỗi: Bảng vắng tháng không thực hiện thành công.")
		        clear_Interval(idInterval);
		        idInterval.text="Uncomplete."
		    }    
		    break;
		case "datMonth_summary":  
		    if(txtResult.text=='0')
		    {
		        txtResult.text='';
                alert((v_language =="ENG")?"All Tasks finish": "Tất cả công đoạn đã hoàn thành")
		        idstatus_process.text=(v_language =="ENG")?"All Tasks finish.":"Tất cả công đoạn đã hoàn thành";
                clear_Interval(idInterval);
		    }
		    else
		    {
		        alert((v_language =="ENG")?"Error:Step 4(Month Summary) Uncomplete.":"Lỗi: Bảng tóm tắt tháng tháng không thực hiện thành công.")
		        clear_Interval(idInterval);
		        idInterval.text="Uncomplete."
		    }    
		    break; 
		case "datProcess_WT_resign":   
		    if(txtResult.text=='0')
		    {
		        txtResult.text='';
		        clear_Interval(idInterval);
                idstatus_process.text= (v_language =="ENG")? "Task 2 is processing...":"Bước 2 đang xử lý...";
		        datProcess_OT_resign.Call();
		    }
		    else
		    {
		        alert((v_language =="ENG")?"Error:Step 1(Working Month) Uncomplete.":"Lỗi: Bảng công tháng không thực hiện thành công.")
		        clear_Interval(idInterval);
		        idInterval.text="Uncomplete."
		    }    
		    break;
		 case "datProcess_OT_resign":   
		    if(txtResult.text=='0')
		    {
		        txtResult.text='';
		        clear_Interval(idInterval);
                idstatus_process.text= (v_language =="ENG")?"Task 3 is processing...":"Bước 3 đang xử lý...";
		        datProcess_ABS_resign.Call();
		    }
		    else
		    {
		        alert((v_language =="ENG")?"Error:Step 1(Working Month) Uncomplete.":"Lỗi: Bảng công tháng không thực hiện thành công.")
		        clear_Interval(idInterval);
		        idInterval.text="Uncomplete."
		    }    
		    break;   
		 case "datProcess_ABS_resign":   
		    if(txtResult.text=='0')
		    {
		        txtResult.text='';
		        clear_Interval(idInterval);
                idstatus_process.text= (v_language =="ENG")?"Task 4 is processing...":"Bước 4 đang xử lý...";
		        datMonth_summary_resign.Call();
		    }
		    else
		    {
		        alert((v_language =="ENG")?"Error:Step 1(Working Month) Uncomplete.":"Lỗi: Bảng công tháng không thực hiện thành công.")
		        clear_Interval(idInterval);
		        idInterval.text="Uncomplete."
		    }    
		    break;   
		 case "datMonth_summary_resign":  
		    if(txtResult.text=='0')
		    {
		        txtResult.text='';
                alert((v_language =="ENG")?"All Tasks finish":"Tất cả công đoạn đã hoàn thành")
		        idstatus_process.text=(v_language =="ENG")?"All Tasks finish":"Tất cả công đoạn đã hoàn thành";
		    }
		    else
		    {
		        alert((v_language =="ENG")?"Error:Step 4(Month Summary) Uncomplete.":"Lỗi: Bảng tóm tắt tháng tháng không thực hiện thành công.")
		        clear_Interval(idInterval);
		        idInterval.text="Uncomplete."
		    }    
		    break;
        
        case "datOpen_Close":
            if (txtResult.text == 'N')      //OPEN
            {
                alert((v_language =="ENG")?"Open successfull.":"Bạn đã mở dữ liệu thành công")
                idstatus_process.text = "";
                icoOpen.SetEnable(0);
                icoClose.SetEnable(1);
                icoProcess.SetEnable(1);
            }
            else {
                alert((v_language =="ENG")?"Close successfull.":"Bạn đã đóng dữ liệu thành công")
                idstatus_process.text = (v_language =="ENG")?"This Work Month is closed.":"Tháng này đã đóng dữ liệu";
                icoOpen.SetEnable(1);
                icoClose.SetEnable(0);
                icoProcess.SetEnable(0);
            }
            break;

		 case "datFind_Report":
		    {                              
		        
		        var url = System.RootURL;

		        if (Reports.optMonthReport[0].checked) 
				{	
					txtReport_tmp.text ="/standard/reports/hr/ti/rpt_hrti01700_0.aspx";
		            /*url = url + txtReport_tmp.text + '?l_tco_dept_pk=' + lstOrg_R.value + '&l_dept_nm=' + lstOrg_R.GetText() + '&l_thr_group_pk=' + lstWG_1.value + '&l_status=' + lstStatus_1.value + '&l_emp_id=' + txtEmp_ID_1.text;
		            url = url + '&l_work_mon=' + dtMonth_R.value + '&l_from_dt=' + dtFrom_Date_R.value + '&l_to_dt=' + dtTo_Date_R.value + '&l_nation=' + lstNation_1.value + '&l_SalaryPeriod=' + lstSalaryPeriod.value + '&l_lstEmpID=' + txtlstEmpID.text;
					url = url + '&l_from_r=' + dtFrom_Resign.value + '&l_to_r=' + dtTo_Resign.value;
					*/
					url = url + txtReport_tmp.text + '?l_emp_id=' + txtEmp_ID_1.text + '&l_work_mon=' + dtMonth_R.value 
					+ '&l_tco_org_pk=' + lstOrg_R.value +'&dt_from=' + dtFrom_Date_R.value + '&dt_to=' + dtTo_Date_R.value +'&l_sal_period=' + lstSalaryPeriod.value
					+ '&l_nation=' + lstNation_1.value ;
		        }
		        else if (Reports.optMonthReport[1].checked) {
		            url = url + txtReport_tmp.text + '?l_tco_dept_pk=' + lstOrg_R.value + '&l_dept_nm=' + lstOrg_R.GetText() + '&l_thr_group_pk=' + lstWG_1.value + '&l_status=' + lstStatus_1.value + '&l_emp_id=' + txtEmp_ID_1.text;
		            url = url + '&l_work_mon=' + dtMonth_R.value + '&l_from_dt=' + dtFrom_Date_R.value + '&l_to_dt=' + dtTo_Date_R.value + '&l_nation=' + lstNation_1.value + '&l_SalaryPeriod=' + lstSalaryPeriod.value + '&l_lstEmpID=' + txtlstEmpID.text;
					url = url + '&l_from_r=' + dtFrom_Resign.value + '&l_to_r=' + dtTo_Resign.value;
		        }
		        else if (Reports.optMonthReport[2].checked) {
		            url = url + txtReport_tmp.text + '?l_tco_dept_pk=' + lstOrg_R.value + '&l_dept_nm=' + lstOrg_R.GetText() + '&l_thr_group_pk=' + lstWG_1.value + '&l_status=' + lstStatus_1.value + '&l_emp_id=' + txtEmp_ID_1.text;
		            url = url + '&l_work_mon=' + dtMonth_R.value + '&l_from_dt=' + dtFrom_Date_R.value + '&l_to_dt=' + dtTo_Date_R.value + '&l_nation=' + lstNation_1.value + '&l_SalaryPeriod=' + lstSalaryPeriod.value + '&l_lstEmpID=' + txtlstEmpID.text;
					url = url + '&l_from_r=' + dtFrom_Resign.value + '&l_to_r=' + dtTo_Resign.value;
		        }
		        else if (Reports.optMonthReport[3].checked) {
		            url = url + txtReport_tmp.text + '?l_tco_dept_pk=' + lstOrg_R.value + '&l_dept_nm=' + lstOrg_R.GetText() + '&l_thr_group_pk=' + lstWG_1.value + '&l_status=' + lstStatus_1.value + '&l_emp_id=' + txtEmp_ID_1.text;
		            url = url + '&l_work_mon=' + dtMonth_R.value + '&l_from_dt=' + dtFrom_Date_R.value + '&l_to_dt=' + dtTo_Date_R.value + '&l_nation=' + lstNation_1.value + '&l_SalaryPeriod=' + lstSalaryPeriod.value + '&l_lstEmpID=' + txtlstEmpID.text;
		            url = url + "&l_user=" + "<%=Session("USER_ID")%>";
					url = url + '&l_from_r=' + dtFrom_Resign.value + '&l_to_r=' + dtTo_Resign.value;
		        }
		        
		        window.open(url);
		    }   
		    break;
		case "datGetfrom_to":
		{
			dtFrom_Resign.value = dtFrom_Date_R.value;
			dtTo_Resign.value = dtTo_Date_R.value;
		}
    }
	
}
//-------------------------------------------------
function on_Process(obj) {
    if (check_init == 1) {
        switch (obj) {
            case "PROCESS":
                if (confirm( (v_language =="ENG")?"Working Time will be process. Do you want to continous":"Hệ thống tính công được xử lý. Bạn có muốn tiếp tục?")) 
				{
                    idInterval.text = "";
                    set_Interval(1000)
                    if (txtActive_Resign.text != '1')
                        datProcess_WT_resign.Call();
                    else
                        datProcess_WT.Call();

                }
                break;

            case "OPEN":
                if (confirm((v_language =="ENG")?"Do you want to OPEN?":"Bạn muốn MỞ bảng công?")) {
                    txtFlag.text = 'OPEN';
                    datOpen_Close.Call();
                }
                break;

            case "CLOSE":
                if (confirm((v_language =="ENG")?"Do you want to CLOSE?":"Bạn muốn ĐÓNG bảng công?")) {
                    txtFlag.text = 'CLOSE';
                    datOpen_Close.Call();
                }
                break;
        }
    }
}
		

//-------------------------------
function set_Interval(x) 
{
 startTime = new Date().valueOf();
 interval_time=setInterval("clock(" + startTime + "," + x  + ")",x);
}
//------------------------------
function clock(start,x) 
{
 var d = new Date()
 idInterval.text= Math.round((d.valueOf()-start)/x);

}
//-------------------------------
function clear_Interval(obj)
{
	clearInterval(interval_time);
	obj.text="";
}
function OnReport() {
    if (check_init == 1) {
        var temp = Trim(txtEmpID.text);
        var arr = new Array();
        var str = "";
        if (temp != "") {

            arr = temp.split(',');
            str = Trim(arr[0]);
            for (var k = 1; k < arr.length; k++) {
                str = str + '\',' + '\'' + Trim(arr[k]);
            }
            txtlstEmpID.text = str.toUpperCase();

        }
        else {
            txtlstEmpID.text = "";
        }
        //alert(txtlstEmpID.text);
        //alert(txtEmpID.text);
        if (Reports.optMonthReport[0].checked) {
            lstReport.value = "122";
            txtOrg_tmp_pk.text = lstOrg_R.value;
        }
        else if (Reports.optMonthReport[1].checked) {
            lstReport.value = "123";
            txtOrg_tmp_pk.text = lstOrg_R.value;
        }
        else if (Reports.optMonthReport[2].checked) {
            lstReport.value = "124";
            txtOrg_tmp_pk.text = lstOrg_R.value;
        }
        else if (Reports.optMonthReport[3].checked) {
            lstReport.value = "125";
            txtOrg_tmp_pk.text = lstOrg_R.value;
        }
        txtReportCode_tmp.text = lstReport.value;

        datFind_Report.Call();
    }

}

function OnChangeLocation()
{
	
} 

function onChange_org(_num)
{    
    if(_num==1)
        txtorg_tmp.text=lstOrg_R.value;
    if(_num==2)
        txtorg_tmp.text=lstOrg_R.value;
    if(_num==3)
        txtorg_tmp.text=lstOrg_R.value;
    if(_num==4)
        txtorg_tmp.text=lstOrg_R.value;
    datWorkGroup_info.Call();
}





function OnShowPopup_E()
{
    var url = "/standard/forms/hr/ti/hrti01301.aspx";
    var str="";
	str = System.OpenModal( System.RootURL+ url , 900 , 600 , 'resizable:yes;status:yes') ;
    if ( str != null )
	{ 
        txtEmpID.text=str;
    } 	
}

function check_to_dt()
{
	if(Number(old_to_dt)<Number(dtTo_Date.value))
	{
		alert((v_language =="ENG")?"You can not change to date more than your period.":"Bạn không thể thay đổi ngày lớn hơn chu kỳ");
		dtTo_Date.value=old_to_dt;
	}
	if(Number(dtTo_Date.value)<=Number(dtFrom_Date.value))
	{
		alert((v_language =="ENG")?"You can not change to date less than your period.":"Bạn không thể thay đổi ngày nhỏ hơn chu kỳ");
		dtTo_Date.value=old_to_dt;
	}
	
}
function OnChangeStatus()
{
	if(lstStatus_1.value == "R")
	{
		td1.style.display = "";
		td2.style.display = "";
		td3.style.display = "";
	}
	else
	{
		td1.style.display = "none";
		td2.style.display = "none";
		td3.style.display = "none";
	}
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
				border-left:1px solid #034D72;
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

<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
<!------------main control---------------------->
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
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="txtorg_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datGet_period" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_PERIOD_BY_ORG"  > 
                <input>
                    <input bind="lstLocation_dept" />
                </input> 
                <output>
                    <output bind="lstSalaryPeriod" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datGet_from_to" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_SEL_CO_FROM_TO_2" > 
                <input>
                    <input bind="lstLocation_dept" />
                    <input bind="dtMonth" />
                    <input bind="lstSalaryPeriod" />
                </input> 
                <output>
                    <output bind="dtFrom_Date" />
                    <output bind="dtTo_Date" />
                    <output bind="txtResult" />
                    <output bind="txtProcess" />
                    <output bind="txtWt_Close" />
                    <output bind="txtActive_Resign" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datGetfrom_to" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_SEL_CO_FROM_TO" > 
                <input>
					<input bind="dtMonth_R" />
                    <input bind="lstOrg_R" />
                    <input bind="lstSalaryPeriod" />
                </input> 
                <output>
                    <output bind="dtFrom_Date_R" />
                    <output bind="dtTo_Date_R" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------->
<gw:data id="datProcess_WT" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI01300_1" > 
                <input>
                    <input bind="dtMonth" />
                    <input bind="dtFrom_Date" />
                    <input bind="dtTo_Date" />
                    <input bind="lstLocation_dept" />
                    <input bind="lstSalaryPeriod" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------->
<gw:data id="datProcess_OT" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI01300_2" > 
                <input>
                    <input bind="dtMonth" />
                    <input bind="dtFrom_Date" />
                    <input bind="dtTo_Date" />
                    <input bind="lstLocation_dept" />
                    <input bind="lstSalaryPeriod" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------->
<gw:data id="datProcess_ABS" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI01300_3" > 
                <input>
                    <input bind="dtMonth" />
                    <input bind="dtFrom_Date" />
                    <input bind="dtTo_Date" />
                    <input bind="lstLocation_dept" />
                    <input bind="lstSalaryPeriod" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------->
<gw:data id="datMonth_summary" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI01300_4" > 
                <input>
                    <input bind="dtMonth" />
                    <input bind="dtFrom_Date" />
                    <input bind="dtTo_Date" />
                    <input bind="lstLocation_dept" />
                    <input bind="lstSalaryPeriod" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!----resign------------------------>
<gw:data id="datProcess_WT_resign" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI01300_5" > 
                <input>
                    <input bind="dtMonth" />
                    <input bind="dtFrom_Date" />
                    <input bind="dtTo_Date" />
                    <input bind="lstLocation_dept" />
                    <input bind="lstSalaryPeriod" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datProcess_OT_resign" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI01300_6" > 
                <input>
                    <input bind="dtMonth" />
                    <input bind="dtFrom_Date" />
                    <input bind="dtTo_Date" />
                    <input bind="lstLocation_dept" />
                    <input bind="lstSalaryPeriod" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datProcess_ABS_resign" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI01300_7" > 
                <input>
                    <input bind="dtMonth" />
                    <input bind="dtFrom_Date" />
                    <input bind="dtTo_Date" />
                    <input bind="lstLocation_dept" />
                    <input bind="lstSalaryPeriod" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datMonth_summary_resign" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRTI01300_8" > 
                <input>
                    <input bind="dtMonth" />
                    <input bind="dtFrom_Date" />
                    <input bind="dtTo_Date" />
                    <input bind="lstLocation_dept" />
                    <input bind="lstSalaryPeriod" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------->
<gw:data id="datGet_Location_dept" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2" > 
                <input>
                    <input bind="iduser_pk" /> 
                </input> 
                <output>
                    <output bind="txtFact_PK" />
                </output>
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
<gw:data id="datWorkGroup_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_WG_ROLE"  > 
                <input>
                    <input bind="txtorg_tmp" />
                </input> 
                <output>
                    <output bind="txtwg_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datWorkGroup_all" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_WG_ROLE"  > 
                <input>
                    <input bind="txtorg_tmp" />
                </input> 
                <output>
                    <output bind="txtwg_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datOpen_Close" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="process" procedure="ST_HR_PRO_HRTI01300_9" > 
                <input>
                    <input bind="dtMonth" />
                    <input bind="dtFrom_Date" />
                    <input bind="dtTo_Date" />
                    <input bind="lstLocation_dept" />
                    <input bind="lstSalaryPeriod" />
                    <input bind="txtFlag" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!--------------------main table--------------------------------->
<table cellpadding="0" cellspacing="0" style="width:100%;height:100%;" class="eco_line">
    <tr style="height:12%;display:none" >
        <td colspan="2">
			<fieldset style="padding:5;color=green">
				<legend ><font color="green" size=2><b>Process Data</b></font></legend>
				<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=12 width="12%" style="border:0" align="left" >
							Organization
						</td>
						<td colspan=20 width="10%" style="border:0" align="left" >
							<gw:list  id="lstLocation_dept"  maxlen = "100" styles='width:100%' onchange="OnChangeLocation()" />
							
						</td>
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=10 width="10%" style="border:0" align="left" >
							Month
						</td>
						<td colspan=20 width="20%" style="border:0" align="left" >
							<gw:datebox id="dtMonth"  text="" maxlen = "10" type="month" lang="<%=Session("Lang")%>" onchange="OnChangeMonth(1)"/>
						</td>
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						
						<td colspan=10 width="10%" >
							<gw:button id="icoProcess" img="process" text="Process" onclick="on_Process('PROCESS')" />
						</td>
						<td colspan=10 width="10%" style="border:0" align="left" >
							<gw:button id="icoOpen" img="lock_open" text="Open" onclick="on_Process('OPEN')" />
						</td>
						<td colspan=10 width="10%" style="border:0" align="left" >
							<gw:button id="icoClose" img="lock" text="Close" onclick="on_Process('CLOSE')" />
						</td>
						
					</tr>
					
				</table>
			</fieldset>
        </td>
    </tr>
    <tr style="height:12%">
        <td colspan="2" >
			<fieldset style="padding: 5">
					<legend ><font color="green" size=2><b>Search </b></font></legend>
				<table width="100%"  style="height:100%" border="0" cellpadding="2" cellspacing="1">
					<tr style="border:0.5;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=12 width="12%" style="border:0"  align="left" >
							Month
						</td>
						<td colspan=10 width="10%" style="border:0"  align="left" >
							<gw:datebox id="dtMonth_R"  text="" maxlen = "10" type="month" lang="<%=Session("Lang")%>" onchange="OnChangeMonth(2)"/>
						</td>
						<td colspan=10 width="10%" style="border:0"  align="left" >
							<gw:list  id="lstSalaryPeriod" maxlen = "100" styles='width:100%' onchange="OnChangeTimes()" ></gw:list>
						</td>
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=10 style="border:0" width="10%" align="left" >
							Date
						</td>
						<td colspan=10 style="border:0" width="10%"  align="left" >
							<gw:datebox id="dtFrom_Date_R"   styles="width:100%"   />
						</td>
						<td colspan=10 style="border:0" width="10%"  align="left" >
							<gw:datebox id="dtTo_Date_R"   styles="width:100%"   />
						</td>
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=10 width="10%" style="border:0" align="left" >Employee</td>
						<td colspan=10 width="10%" style="border:0"> 
							<gw:textbox id="txtEmp_ID_1" onenterkey   ="OnChangeOption(document.form2,1);OnReport();" styles='width:100%'/>
						</td>
						<td colspan=10 width="10%" style="border:0" align="left" >
							<gw:button id="ibtnReport" alt="Excel Report" img="excel" text="Report" onclick="OnReport()" />
						</td>
					</tr>
					<tr style="border:0.5;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=12 width="12%" style="border:0"  align="left" >
							<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup()" href="#tips" style="text-decoration: none;" class="eco_link" >Organization</a>
						</td>
						<td colspan=20 width="20%" style="border:0"  align="left" >
							<gw:list  id="lstOrg_R"  maxlen = "100" styles='width:100%' onchange="OnChangeOption(document.form2,1)" />
						</td>
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td colspan=10 style="border:0" width="10%" align="left" >
							Status
						</td>
						<td colspan=20 style="border:0" width="20%"  align="left" >
							<gw:list  id="lstStatus_1" value='ALL' maxlen = "100" styles='width:100%' onchange="OnChangeStatus()" />
						</td>
						<td colspan=2 width="2%" style="border:0"   >
							
						</td>
						<td id="td1" colspan=10 width="10%" style="border:0" align="left">
							Left Date
						</td>
						<td id="td2" colspan=10 width="10%" style="border:0"> 
							<gw:datebox id="dtFrom_Resign"   styles="width:100%"   />
						</td>
						<td id="td3" colspan=10 width="10%" style="border:0" align="left" >
							<gw:datebox id="dtTo_Resign"   styles="width:100%"   />
						</td>
					</tr>
					
				</table>
			</fieldset>
        </td>
    </tr>
    <tr style="height:80%">
        <td colspan="2" class="eco_line_t" style="padding-top:10px" valign="top">
            <form name="Reports" id="form2" > 
				<fieldset style="padding: 5">
					<legend><font color="green" size=2><b>List Reports</b></font></legend>
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr style="border:0.5;width:100%;height:20%" valign="center" >
							<td colspan=30 width="30%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0"  align="left" >
								<input type="radio" name="optMonthReport" value="1" checked>
							</td>
							<td colspan=60 width="60%" style="border:0"  align="left" >
								WORKING SUMMARY
							</td>
							
						</tr>
						<tr style="border:0.5;width:100%;" valign="center" >
							<td colspan=30 width="30%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0"  align="left" >
								<input type="radio" name="optMonthReport" value="1" >
							</td>
							<td colspan=60 width="60%" style="border:0"  align="left" >
								WORKING DETAIL (IN-OUT)
							</td>
						</tr>
						<tr style="border:0.5;width:100%;" valign="center" >
							<td colspan=30 width="30%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0"  align="left" >
								<input type="radio" name="optMonthReport" value="1" >
							</td>
							<td colspan=60 width="60%" style="border:0"  align="left" >
								ABSENCE SUMMARY
							</td>
						</tr>
						<tr style="border:0.5;width:100%;" valign="center" >
							<td colspan=30 width="30%" style="border:0"   >
								
							</td>
							<td colspan=10 width="10%" style="border:0"  align="left" >
								<input type="radio" name="optMonthReport" value="1" >
							</td>
							<td colspan=60 width="60%" style="border:0"  align="left" >
								WORKING DETAIL
							</td>
						</tr>
					</table>
				</fieldset>
		    </form>
        </td>
    </tr>
    </table>
    <gw:textbox id="txtDept" styles="display:none"/>	
    <gw:textbox id="txtFact_PK" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/> 
    <gw:textbox id="txtResult" styles="display:none"/> 
    <gw:textbox id="txtProcess" styles="display:none"/> 
    <gw:textbox id="txtReport_tmp" styles="display:none"/> 
    <gw:textbox id="txtSalary" styles="display:none" text="01"/> 
    <gw:textbox id="txtResignTime" styles="display:none" text=""/> 
    <gw:textbox id="txtResignCheck" styles="display:none" text=""/>
    <gw:textbox id="txtCompany_pk" styles="display:none"/>
    <gw:textbox id="txtorg_tmp" styles="display:none"/>
    <gw:textbox id="txtwg_tmp" styles="display:none"/>    
    <gw:textbox id="menu_id" text="" styles="display:none"  />
    <gw:textbox id="txtFlag_View" text="" styles="display:none"  />  
    <gw:textbox id="txtlstEmpID" styles="display:none"/>  
    <gw:textbox id="txtActive_Resign" styles="display:none"/>  
    <gw:list  id="lstReport" styles="display:none" />
    <gw:textbox id="txtReportCode_tmp" styles="display:none"/>
    <gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
    <gw:textbox id="idInterval" text="" styles="display:none"  />
    <gw:textbox id="txtFlag" styles="display:none"/>  
    <gw:textbox id="txtWt_Close" styles="display:none"/> 
	<gw:textbox id="txtEmpID" styles='width:100%;display:none' />
	<gw:textbox id="dtFrom_Date"  text="" styles="width:100%;display:none"   />
	<gw:textbox id="dtTo_Date"  text="" styles="width:100%;display:none"   />
	<gw:list  id="lstWG_1" value='ALL' maxlen = "100" styles='width:100%;display:none' onchange="">
		<data>
			<%=CtlLib.SetListDataSQL("select a.pk,a.workgroup_nm from thr_work_group a where a.del_if=0 order by a.workgroup_id")%>|ALL|Select All
		</data>
	</gw:list>
	<gw:list  id="lstNation_1" value='ALL' maxlen = "100" styles='width:100%;display:none' onchange="" >
		<data>
			<%=CtlLib.SetListDataSQL("select a.code,a.code_nm from vhr_hr_code a where a.id='HR0009'")%>|ALL|Select All
		</data>
	</gw:list>
	<gw:label id="idstatus_process" text="" maxlen="100" styles="width:100%;color:blue;display:none" ></gw:label>
</body>
</html>

