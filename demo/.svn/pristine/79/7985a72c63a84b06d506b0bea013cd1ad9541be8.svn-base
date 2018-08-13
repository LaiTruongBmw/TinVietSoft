<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var ctlGroup;
var bChange_All=false;
var v_language = "<%=Session("SESSION_LANG")%>";
var rpt_no=0;
var flag_wg=0;
var flag_tab=1;
var check_init=0;
function BodyInit()
{ 	
    System.Translate_V2(document, System.Menu.GetMenuPS());
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    
    
    var tmp="<%=CtlLib.SetListDataSQL("select a.Code,a.CODE_NM ||' ' || char_1 || '->' || char_2 from thr_code_master b,thr_code_detail a  where b.pk=a.THR_CODE_MASTER_PK and a.del_if=0 and b.del_if=0 and b.ID='HR0030' ")%>";
    lstSalaryPeriod.SetDataText(tmp);        
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT('HR0156','HRPM00700', 1) FROM DUAL")%>";
    lstReport.SetDataText(data);
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT('HR0156','HRPM00700', 2) FROM DUAL")%>";
    lstReport2.SetDataText(data);
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT('HR0156','HRPM00700', 3) FROM DUAL")%>";
    lstReport3.SetDataText(data);
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0017', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
    l_Emp_Type.SetDataText(data);
    l_Emp_Type.value ="ALL";
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
    lstStatus.SetDataText(data);
    lstStatus.value ="ALL";
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0009', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
    lstNation.SetDataText(data);
    lstNation.value ="ALL";
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstDept_Code_1.SetDataText(data);
    lstDept_Code_1.value ="ALL";
    
    lstDept_Code_2.SetDataText(data);
    lstDept_Code_2.value ="ALL";
    
    lstDept_Code_3.SetDataText(data);
    lstDept_Code_3.value ="ALL";
    
    lstDept_Code_4.SetDataText(data);
    lstDept_Code_4.value ="ALL";
    
    lstDept_Code_5.SetDataText(data);
    lstDept_Code_5.value ="ALL";
    
    lstDept_Code_6.SetDataText(data);
    lstDept_Code_6.value ="ALL";
    
    lstDept_Code_7.SetDataText(data);
    lstDept_Code_7.value ="ALL";
    
    lstDept_Code_8.SetDataText(data);
    lstDept_Code_8.value ="ALL";
    
    lstDept_Code_9.SetDataText(data);
    lstDept_Code_9.value ="ALL";
    
    lstDept_Code_10.SetDataText(data);
    lstDept_Code_10.value ="ALL";
    
    lstDept_Code_11.SetDataText(data);
    lstDept_Code_11.value ="ALL";
    //-----------------------------Bonus--------------------------------------//
    lstDept_Code_BN_1.SetDataText(data);
    lstDept_Code_BN_1.value ="ALL";
    
    lstDept_Code_BN_2.SetDataText(data);
    lstDept_Code_BN_2.value ="ALL";
    
    lstDept_Code_BN_3.SetDataText(data);
    lstDept_Code_BN_3.value ="ALL";
    
    lstDept_Code_BN_4.SetDataText(data);
    lstDept_Code_BN_4.value ="ALL";
    
    lstDept_Code_BN_5.SetDataText(data);
    lstDept_Code_BN_5.value ="ALL";
    
    lstDept_Code_BN_6.SetDataText(data);
    lstDept_Code_BN_6.value ="ALL";
    
    lstDept_Code_BN_7.SetDataText(data);
    lstDept_Code_BN_7.value ="ALL";
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstGrp_Code_1.SetDataText(data);
    lstGrp_Code_1.value ="ALL";
    
    lstGrp_Code_2.SetDataText(data);
    lstGrp_Code_2.value ="ALL";
    
    lstGrp_Code_3.SetDataText(data);
    lstGrp_Code_3.value ="ALL";
    
    lstGrp_Code_4.SetDataText(data);
    lstGrp_Code_4.value ="ALL";
    
    lstGrp_Code_5.SetDataText(data);
    lstGrp_Code_5.value ="ALL";
    
    lstGrp_Code_6.SetDataText(data);
    lstGrp_Code_6.value ="ALL";
    
    lstGrp_Code_7.SetDataText(data);
    lstGrp_Code_7.value ="ALL";
    
    lstGrp_Code_8.SetDataText(data);
    lstGrp_Code_8.value ="ALL";
    
    lstGrp_Code_9.SetDataText(data);
    lstGrp_Code_9.value ="ALL";
    
    lstGrp_Code_10.SetDataText(data);
    lstGrp_Code_10.value ="ALL";
    
    lstGrp_Code_11.SetDataText(data);
    lstGrp_Code_11.value ="ALL";
    
    //-----------------------------Bonus--------------------------------------//
    lstGrp_Code_BN_1.SetDataText(data);
    lstGrp_Code_BN_1.value ="ALL";
    
    lstGrp_Code_BN_2.SetDataText(data);
    lstGrp_Code_BN_2.value ="ALL";
    
    lstGrp_Code_BN_3.SetDataText(data);
    lstGrp_Code_BN_3.value ="ALL";
    
    lstGrp_Code_BN_4.SetDataText(data);
    lstGrp_Code_BN_4.value ="ALL";
    
    lstGrp_Code_BN_5.SetDataText(data);
    lstGrp_Code_BN_5.value ="ALL";
    
    lstGrp_Code_BN_6.SetDataText(data);
    lstGrp_Code_BN_6.value ="ALL";
    
    lstGrp_Code_BN_7.SetDataText(data);
    lstGrp_Code_BN_7.value ="ALL";
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0023', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstPay_Type_1.SetDataText(data);
    lstPay_Type_1.value ="ALL";
    
    lstPay_Type_2.SetDataText(data);
    lstPay_Type_2.value ="ALL";
    
    lstPay_Type_3.SetDataText(data);
    lstPay_Type_3.value ="ALL";
    
    lstPay_Type_4.SetDataText(data);
    lstPay_Type_4.value ="ALL";
    
    lstPay_Type_5.SetDataText(data);
    lstPay_Type_5.value ="ALL";
    
    lstPay_Type_8.SetDataText(data);
    lstPay_Type_8.value ="ALL";
    
    lstPay_Type_9.SetDataText(data);
    lstPay_Type_9.value ="ALL";
    
    lstPay_Type_10.SetDataText(data);
    lstPay_Type_10.value ="ALL";
    
    lstPay_Type_11.SetDataText(data);
    lstPay_Type_11.value ="ALL";
    
    //-----------------------------Bonus--------------------------------------//
    lstPay_Type_BN_1.SetDataText(data);
    lstPay_Type_BN_1.value ="ALL";
    
    lstPay_Type_BN_2.SetDataText(data);
    lstPay_Type_BN_2.value ="ALL";
    
    lstPay_Type_BN_3.SetDataText(data);
    lstPay_Type_BN_3.value ="ALL";
    
    lstPay_Type_BN_5.SetDataText(data);
    lstPay_Type_BN_5.value ="ALL";
    
    lstPay_Type_BN_6.SetDataText(data);
    lstPay_Type_BN_6.value ="ALL";
    
    lstPay_Type_BN_7.SetDataText(data);
    lstPay_Type_BN_7.value ="ALL";
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0020', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";   
    lstBank_6.SetDataText(data);
    lstBank_6.value ="ALL";
    
    //-----------------------------Bonus--------------------------------------//
    lstPay_Type_BN_4.SetDataText(data);
    lstPay_Type_BN_4.value ="ALL";
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0040', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
    lstMoney_Type_1.SetDataText(data);
    lstMoney_Type_1.value ="01";
    
    lstMoney_Type_2.SetDataText(data);
    lstMoney_Type_2.value ="01";
    
    lstMoney_Type_3.SetDataText(data);
    lstMoney_Type_3.value ="01";
    
    lstMoney_Type_4.SetDataText(data);
    lstMoney_Type_4.value ="01";
    
    lstMoney_Type_5.SetDataText(data);
    lstMoney_Type_5.value ="01";
    
    lstMoney_Type_6.SetDataText(data);
    lstMoney_Type_6.value ="ALL";
    
    lstMoney_Type_7.SetDataText(data);
    lstMoney_Type_7.value ="ALL";
    
    lstMoney_Type_8.SetDataText(data);
    lstMoney_Type_8.value ="01";
    
    lstMoney_Type_9.SetDataText(data);
    lstMoney_Type_9.value ="01";
    
    lstMoney_Type_10.SetDataText(data);
    lstMoney_Type_10.value ="01";
    
    lstMoney_Type_11.SetDataText(data);
    lstMoney_Type_11.value ="01";
    
    //-----------------------------Bonus--------------------------------------//
    lstMoney_Type_BN_1.SetDataText(data);
    lstMoney_Type_BN_1.value ="ALL";
    
    lstMoney_Type_BN_2.SetDataText(data);
    lstMoney_Type_BN_2.value ="ALL";
    
    lstMoney_Type_BN_3.SetDataText(data);
    lstMoney_Type_BN_3.value ="ALL";
    
    lstMoney_Type_BN_4.SetDataText(data);
    lstMoney_Type_BN_4.value ="01";
    
    lstMoney_Type_BN_5.SetDataText(data);
    lstMoney_Type_BN_5.value ="01";
    
    lstMoney_Type_BN_6.SetDataText(data);
    lstMoney_Type_BN_6.value ="ALL";
    
    lstMoney_Type_BN_7.SetDataText(data);
    lstMoney_Type_BN_7.value ="ALL";
    
    data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0057', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
    lstTimes.SetDataText(data);
    
    ChangeYear();

    ChangeColorItem(lstDept_Code_1.GetControl());
    ChangeColorItem(lstDept_Code_2.GetControl());
    ChangeColorItem(lstDept_Code_3.GetControl());
    ChangeColorItem(lstDept_Code_4.GetControl());
    ChangeColorItem(lstDept_Code_5.GetControl());
    ChangeColorItem(lstDept_Code_6.GetControl());
    ChangeColorItem(lstDept_Code_7.GetControl());
    ChangeColorItem(lstDept_Code_8.GetControl());
    ChangeColorItem(lstDept_Code_9.GetControl());
    ChangeColorItem(lstDept_Code_10.GetControl());
    ChangeColorItem(lstDept_Code_11.GetControl());

    ChangeColorItem(lstDept_Code_BN_1.GetControl());
    ChangeColorItem(lstDept_Code_BN_2.GetControl());
    ChangeColorItem(lstDept_Code_BN_3.GetControl());
    ChangeColorItem(lstDept_Code_BN_4.GetControl());
    ChangeColorItem(lstDept_Code_BN_5.GetControl());
    ChangeColorItem(lstDept_Code_BN_6.GetControl());
    ChangeColorItem(lstDept_Code_BN_7.GetControl());
   


    if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
              datUser_info.Call(); 
	else
		dat100030007_1.Call();
    
    
    
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

//----------------------------------------------

function onChoose_opt(form,obj)
{
	form.optMonthReport[obj-1].checked=true;
}

function onChange_org(tab,n,obj)
{
	flag_wg=n;
	flag_tab=tab;
	txtorg_tmp.text=obj.value;
	datWorkGroup_info.Call();
	
}

//------------------------------------
function OnShowPopup()
{
    var strcom;
    var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:25;dialogHeight:25;dialogLeft:10;dialogTop:240;edge:sunken;scroll:yes;unadorned:yes;help:no');
    if (obj!=null)
    {
        if (tabMain.GetCurrentPageNo()==0)
        {
            lstDept_Code_1.value=obj;
            lstDept_Code_2.value=obj;
            lstDept_Code_3.value=obj;
            lstDept_Code_4.value=obj;
            lstDept_Code_5.value=obj;
            lstDept_Code_6.value=obj;
            lstDept_Code_7.value=obj;
            lstDept_Code_8.value=obj;
            lstDept_Code_9.value=obj;
            lstDept_Code_10.value=obj;
            lstDept_Code_11.value=obj;
            onChange_org(1,0,lstDept_Code_1);
        }
        else
        {
            lstDept_Code_BN_1.value=obj;
            lstDept_Code_BN_2.value=obj;
            lstDept_Code_BN_3.value=obj;
            lstDept_Code_BN_4.value=obj;
            lstDept_Code_BN_5.value=obj;
            lstDept_Code_BN_6.value=obj;
            lstDept_Code_BN_7.value=obj;
			onChange_org(2,0,lstDept_Code_BN_1);
        }
        
    }
    
}
//-------------------------------------------------------------
function OnDataReceive(obj)
{
    if (obj.id == "datFind_Report") {
        var url = System.RootURL;

        if (tabMain.GetCurrentPageNo() == 0)//Salary reports 
        {
            switch (rpt_no) {
                case 1:
                    {
                        url = url + txtReport_tmp.text + '?l_dept=' + lstDept_Code_1.value + '&l_group=' + lstGrp_Code_1.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_1.text + '&l_work_mon=' + dtMonth.value;
                        url = url + '&l_pay_type=' + lstPay_Type_1.value + '&l_type=' + lstType_1.value + '&l_m_type=' + lstMoney_Type_1.value + "&l_sal_period=" + lstSalaryPeriod.value + "&l_Emp_Type=" + l_Emp_Type.value + "&l_nation=" + lstNation.value;
                        break;
                    }
                case 2:
                    {
                        url = url + txtReport_tmp.text + '?l_dept=' + lstDept_Code_2.value + '&l_group=' + lstGrp_Code_2.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_2.text + '&l_work_mon=' + dtMonth.value;
                        url = url + '&l_pay_type=' + lstPay_Type_2.value + '&l_type=' + lstType_2.value + '&l_m_type=' + lstMoney_Type_2.value + "&l_sal_period=" + lstSalaryPeriod.value + "&l_Emp_Type=" + l_Emp_Type.value + "&l_nation=" + lstNation.value;
                        break;
                    }
                case 3:
                    {
                        url = url + txtReport_tmp.text + '?l_dept=' + lstDept_Code_3.value + '&l_group=' + lstGrp_Code_3.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_3.text + '&l_work_mon=' + dtMonth.value;
                        url = url + '&l_pay_type=' + lstPay_Type_3.value + '&l_type=' + lstType_3.value + '&l_m_type=' + lstMoney_Type_3.value + "&l_sal_period=" + lstSalaryPeriod.value + "&l_Emp_Type=" + l_Emp_Type.value + "&l_nation=" + lstNation.value;
                        break;
                    }
                case 4:
                    {
                        url = url + txtReport_tmp.text + '?l_dept=' + lstDept_Code_4.value + '&l_group=' + lstGrp_Code_4.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_4.text + '&l_work_mon=' + dtMonth.value;
                        url = url + '&l_pay_type=' + lstPay_Type_4.value + '&l_type=' + lstType_4.value + '&l_m_type=' + lstMoney_Type_4.value + "&l_sal_period=" + lstSalaryPeriod.value + "&l_Emp_Type=" + l_Emp_Type.value + "&l_nation=" + lstNation.value;
                        break;
                    }
                case 5:
                    {
                        url = url + txtReport_tmp.text + '?l_dept=' + lstDept_Code_5.value + '&l_group=' + lstGrp_Code_5.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_5.text + '&l_work_mon=' + dtMonth.value;
                        url = url + '&l_pay_type=' + lstPay_Type_5.value + '&l_type=' + lstType_5.value + '&l_m_type=' + lstMoney_Type_5.value + "&l_sal_period=" + lstSalaryPeriod.value + "&l_Emp_Type=" + l_Emp_Type.value + "&l_nation=" + lstNation.value;
                        break;
                    }
                case 6:
                    {
                        url = url + txtReport_tmp.text + '?l_dept=' + lstDept_Code_6.value + '&l_group=' + lstGrp_Code_6.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_6.text + '&l_work_mon=' + dtMonth.value;
                        url = url + '&l_pay_type=' + lstBank_6.value + '&l_type=' + lstType_6.value + '&l_m_type=' + lstMoney_Type_6.value + "&l_sal_period=" + lstSalaryPeriod.value + "&l_Emp_Type=" + l_Emp_Type.value + "&l_nation=" + lstNation.value;
                        break;
                    }
                case 7:
                    {
                        url = url + txtReport_tmp.text + '?l_dept=' + lstDept_Code_7.value + '&l_group=' + lstGrp_Code_7.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_7.text + '&l_work_mon=' + dtMonth.value;
                        url = url + '&l_type=' + lstType_7.value + '&l_m_type=' + lstMoney_Type_7.value + "&l_sal_period=" + lstSalaryPeriod.value + "&l_Emp_Type=" + l_Emp_Type.value + "&l_nation=" + lstNation.value;
                        break;
                    }
                case 8:
                    {
                        url = url + txtReport_tmp.text + '?l_dept=' + lstDept_Code_8.value + '&l_group=' + lstGrp_Code_8.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_8.text + '&l_work_mon=' + dtMonth.value;
                        url = url + '&l_pay_type=' + lstPay_Type_8.value + '&l_type=' + lstType_8.value + '&l_m_type=' + lstMoney_Type_8.value + "&l_sal_period=" + lstSalaryPeriod.value + "&l_Emp_Type=" + l_Emp_Type.value + "&l_nation=" + lstNation.value;
                        break;
                    }
                case 9:
                    {
                        url = url + txtReport_tmp.text + '?l_dept=' + lstDept_Code_9.value + '&l_group=' + lstGrp_Code_9.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_9.text + '&l_work_mon=' + dtMonth.value;
                        url = url + '&l_pay_type=' + lstPay_Type_9.value + '&l_type=' + lstType_9.value + '&l_m_type=' + lstMoney_Type_9.value + "&l_sal_period=" + lstSalaryPeriod.value + "&l_Emp_Type=" + l_Emp_Type.value + "&l_nation=" + lstNation.value;
                        break;
                    }
                case 10:
                    {
                        url = url + txtReport_tmp.text + '?l_dept=' + lstDept_Code_10.value + '&l_group=' + lstGrp_Code_10.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_10.text + '&l_work_mon=' + dtMonth.value;
                        url = url + '&l_pay_type=' + lstPay_Type_10.value + '&l_type=' + lstType_10.value + '&l_m_type=' + lstMoney_Type_10.value + "&l_sal_period=" + lstSalaryPeriod.value + "&l_Emp_Type=" + l_Emp_Type.value + "&l_nation=" + lstNation.value;
                        break;
                    }
                case 11:
                    {
                        url = url + txtReport_tmp.text + '?l_dept=' + lstDept_Code_11.value + '&l_group=' + lstGrp_Code_11.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_11.text + '&l_work_mon=' + dtMonth.value;
                        url = url + '&l_pay_type=' + lstPay_Type_11.value + '&l_type=' + lstType_11.value + '&l_m_type=' + lstMoney_Type_11.value + "&l_sal_period=" + lstSalaryPeriod.value + "&l_Emp_Type=" + l_Emp_Type.value + "&l_nation=" + lstNation.value;
                        break;
                    }
            }
        }
        else if (tabMain.GetCurrentPageNo() == 1) //Bonus reports
        {
            switch (rpt_no) {
                case 1:
                    {
                        url = url + txtReport_tmp.text + '?l_dept=' + lstDept_Code_BN_1.value + '&l_group=' + lstGrp_Code_BN_1.value + '&l_emp_id=' + txtEmp_ID_BN_1.text + '&l_year=' + dtYear.value + '&l_pay_type=' + lstPay_Type_BN_1.value;
                        url = url + '&l_bn_times=' + lstTimes.value + '&l_m_type=' + lstMoney_Type_BN_1.value;
                        break;
                    }
                case 3:
                    {
                        url = url + txtReport_tmp.text + '?l_dept=' + lstDept_Code_BN_3.value + '&l_group=' + lstGrp_Code_BN_3.value + '&l_emp_id=' + txtEmp_ID_BN_3.text + '&l_year=' + dtYear.value + '&l_pay_type=' + lstPay_Type_BN_3.value;
                        url = url + '&l_bn_times=' + lstTimes.value + '&l_m_type=' + lstMoney_Type_BN_3.value;
                        break;
                    }
                case 4:
                    {
                        url = url + txtReport_tmp.text + '?l_dept=' + lstDept_Code_BN_4.value + '&l_group=' + lstGrp_Code_BN_4.value + '&l_emp_id=' + txtEmp_ID_BN_4.text + '&l_year=' + dtYear.value + '&l_pay_type=' + lstPay_Type_BN_4.value;
                        url = url + '&l_bn_times=' + lstTimes.value + '&l_m_type=' + lstMoney_Type_BN_4.value;
                        break;
                    }
                case 5:
                    {
                        url = url + txtReport_tmp.text + '?l_dept=' + lstDept_Code_BN_5.value + '&l_group=' + lstGrp_Code_BN_5.value + '&l_emp_id=' + txtEmp_ID_BN_5.text + '&l_year=' + dtYear.value + '&l_pay_type=' + lstPay_Type_BN_5.value;
                        url = url + '&l_bn_times=' + lstTimes.value + '&l_m_type=' + lstMoney_Type_BN_5.value;
                        break;
                    }
                case 6:
                    {
                        url = url + txtReport_tmp.text + '?l_dept=' + lstDept_Code_BN_6.value + '&l_group=' + lstGrp_Code_BN_6.value + '&l_emp_id=' + txtEmp_ID_BN_6.text + '&l_year=' + dtYear.value + '&l_pay_type=' + lstPay_Type_BN_6.value;
                        url = url + '&l_bn_times=' + lstTimes.value + '&l_m_type=' + lstMoney_Type_BN_6.value;
                        break;
                    }
                case 7:
                    {
                        url = url + txtReport_tmp.text + '?l_dept=' + lstDept_Code_BN_7.value + '&l_group=' + lstGrp_Code_BN_7.value + '&l_emp_id=' + txtEmp_ID_BN_7.text + '&l_year=' + dtYear.value + '&l_pay_type=' + lstPay_Type_BN_7.value;
                        url = url + '&l_bn_times=' + lstTimes.value + '&l_m_type=' + lstMoney_Type_BN_7.value;
                        break;
                    }
            }
        }
        else //PIT reports
        {
            url = url + txtReport_tmp.text + '?p_year=' + dtYear_P.value + '&p_month_from=' + dtMonth_P_From.value + '&p_month_to=' + dtMonth_P_To.value;

        }

        window.open(url);
    }
    else if (obj.id == "dat100030007_1") {
        check_init = 1;
        if (txtResult.text == "0")
            ibtnReport.SetEnable(1);
        else
            ibtnReport.SetEnable(0);

    }
    else if (obj.id == "datUser_info") {
        lstDept_Code_1.SetDataText(txtdept_temp.text);
        lstDept_Code_2.SetDataText(txtdept_temp.text);
        lstDept_Code_3.SetDataText(txtdept_temp.text);
        lstDept_Code_4.SetDataText(txtdept_temp.text);
        lstDept_Code_5.SetDataText(txtdept_temp.text);
        lstDept_Code_6.SetDataText(txtdept_temp.text);
        lstDept_Code_7.SetDataText(txtdept_temp.text);
        lstDept_Code_8.SetDataText(txtdept_temp.text);
        lstDept_Code_9.SetDataText(txtdept_temp.text);
        lstDept_Code_10.SetDataText(txtdept_temp.text);
        lstDept_Code_11.SetDataText(txtdept_temp.text);

        lstDept_Code_BN_1.SetDataText(txtdept_temp.text);
        lstDept_Code_BN_2.SetDataText(txtdept_temp.text);
        lstDept_Code_BN_3.SetDataText(txtdept_temp.text);
        lstDept_Code_BN_4.SetDataText(txtdept_temp.text);
        lstDept_Code_BN_5.SetDataText(txtdept_temp.text);
        lstDept_Code_BN_6.SetDataText(txtdept_temp.text);
        lstDept_Code_BN_7.SetDataText(txtdept_temp.text);

        ChangeColorItem(lstDept_Code_1.GetControl());
        ChangeColorItem(lstDept_Code_2.GetControl());
        ChangeColorItem(lstDept_Code_3.GetControl());
        ChangeColorItem(lstDept_Code_4.GetControl());
        ChangeColorItem(lstDept_Code_5.GetControl());
        ChangeColorItem(lstDept_Code_6.GetControl());
        ChangeColorItem(lstDept_Code_7.GetControl());
        ChangeColorItem(lstDept_Code_8.GetControl());
        ChangeColorItem(lstDept_Code_9.GetControl());
        ChangeColorItem(lstDept_Code_10.GetControl());
        ChangeColorItem(lstDept_Code_11.GetControl());

        ChangeColorItem(lstDept_Code_BN_1.GetControl());
        ChangeColorItem(lstDept_Code_BN_2.GetControl());
        ChangeColorItem(lstDept_Code_BN_3.GetControl());
        ChangeColorItem(lstDept_Code_BN_4.GetControl());
        ChangeColorItem(lstDept_Code_BN_5.GetControl());
        ChangeColorItem(lstDept_Code_BN_6.GetControl());
        ChangeColorItem(lstDept_Code_BN_7.GetControl());

        onChange_org(0, 0, lstDept_Code_1);
    }
    else if (obj.id == "datWorkGroup_info") {
        if (flag_tab == 0) {
            lstGrp_Code_1.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
            lstGrp_Code_2.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
            lstGrp_Code_3.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
            lstGrp_Code_4.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
            lstGrp_Code_5.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
            lstGrp_Code_6.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
            lstGrp_Code_7.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
            lstGrp_Code_8.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
            lstGrp_Code_9.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
            lstGrp_Code_10.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
            lstGrp_Code_11.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");

            lstGrp_Code_BN_1.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
            lstGrp_Code_BN_2.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
            lstGrp_Code_BN_3.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
            lstGrp_Code_BN_4.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
            lstGrp_Code_BN_5.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
            lstGrp_Code_BN_6.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
            lstGrp_Code_BN_7.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");

            lstGrp_Code_1.value = 'ALL';
            lstGrp_Code_2.value = 'ALL';
            lstGrp_Code_3.value = 'ALL';
            lstGrp_Code_4.value = 'ALL';
            lstGrp_Code_5.value = 'ALL';
            lstGrp_Code_6.value = 'ALL';
            lstGrp_Code_7.value = 'ALL';
            lstGrp_Code_8.value = 'ALL';
            lstGrp_Code_9.value = 'ALL';
            lstGrp_Code_10.value = 'ALL';
            lstGrp_Code_11.value = 'ALL';
            lstGrp_Code_BN_1.value = 'ALL';
            lstGrp_Code_BN_2.value = 'ALL';
            lstGrp_Code_BN_3.value = 'ALL';
            lstGrp_Code_BN_4.value = 'ALL';
            lstGrp_Code_BN_5.value = 'ALL';
            lstGrp_Code_BN_6.value = 'ALL';
            lstGrp_Code_BN_7.value = 'ALL';
        }
        else if (flag_tab == 1) {
            if (flag_wg == 0) {
                lstGrp_Code_1.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstGrp_Code_2.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstGrp_Code_3.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstGrp_Code_4.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstGrp_Code_5.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstGrp_Code_6.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstGrp_Code_7.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstGrp_Code_8.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstGrp_Code_9.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstGrp_Code_10.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstGrp_Code_11.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");

                lstGrp_Code_1.value = 'ALL';
                lstGrp_Code_2.value = 'ALL';
                lstGrp_Code_3.value = 'ALL';
                lstGrp_Code_4.value = 'ALL';
                lstGrp_Code_5.value = 'ALL';
                lstGrp_Code_6.value = 'ALL';
                lstGrp_Code_7.value = 'ALL';
                lstGrp_Code_8.value = 'ALL';
                lstGrp_Code_9.value = 'ALL';
                lstGrp_Code_10.value = 'ALL';
                lstGrp_Code_11.value = 'ALL';

            }
            else {
                switch (flag_wg) {
                    case 1:
                        {
                            lstGrp_Code_1.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                            lstGrp_Code_1.value = 'ALL';
                            break;
                        }
                    case 2:
                        {
                            lstGrp_Code_2.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                            lstGrp_Code_2.value = 'ALL';
                            break;
                        }
                    case 3:
                        {
                            lstGrp_Code_3.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                            lstGrp_Code_3.value = 'ALL';
                            break;
                        }
                    case 4:
                        {
                            lstGrp_Code_4.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                            lstGrp_Code_4.value = 'ALL';
                            break;
                        }
                    case 5:
                        {
                            lstGrp_Code_5.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                            lstGrp_Code_5.value = 'ALL';
                            break;
                        }
                    case 6:
                        {
                            lstGrp_Code_6.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                            lstGrp_Code_6.value = 'ALL';
                            break;
                        }
                    case 7:
                        {
                            lstGrp_Code_7.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                            lstGrp_Code_7.value = 'ALL';
                            break;
                        }
                    case 8:
                        {
                            lstGrp_Code_8.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                            lstGrp_Code_8.value = 'ALL';
                            break;
                        }
                    case 9:
                        {
                            lstGrp_Code_9.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                            lstGrp_Code_9.value = 'ALL';
                            break;
                        }
                    case 10:
                        {
                            lstGrp_Code_10.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                            lstGrp_Code_10.value = 'ALL';
                            break;
                        }
                    case 11:
                        {
                            lstGrp_Code_11.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                            lstGrp_Code_11.value = 'ALL';
                            break;
                        }
                }
            }
        }
        else if (flag_tab == 2) {
            if (flag_wg == 0) {
                lstGrp_Code_BN_1.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstGrp_Code_BN_2.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstGrp_Code_BN_3.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstGrp_Code_BN_4.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstGrp_Code_BN_5.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstGrp_Code_BN_6.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                lstGrp_Code_BN_7.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");

                lstGrp_Code_BN_1.value = 'ALL';
                lstGrp_Code_BN_2.value = 'ALL';
                lstGrp_Code_BN_3.value = 'ALL';
                lstGrp_Code_BN_4.value = 'ALL';
                lstGrp_Code_BN_5.value = 'ALL';
                lstGrp_Code_BN_6.value = 'ALL';
                lstGrp_Code_BN_7.value = 'ALL';
            }
            else {
                switch (flag_wg) {
                    case 1:
                        {
                            lstGrp_Code_BN_1.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                            lstGrp_Code_BN_1.value = 'ALL';
                            break;
                        }
                    case 2:
                        {
                            lstGrp_Code_BN_2.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                            lstGrp_Code_BN_2.value = 'ALL';
                            break;
                        }
                    case 3:
                        {
                            lstGrp_Code_BN_3.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                            lstGrp_Code_BN_3.value = 'ALL';
                            break;
                        }
                    case 4:
                        {
                            lstGrp_Code_BN_4.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                            lstGrp_Code_BN_4.value = 'ALL';
                            break;
                        }
                    case 5:
                        {
                            lstGrp_Code_BN_5.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                            lstGrp_Code_BN_5.value = 'ALL';
                            break;
                        }
                    case 6:
                        {
                            lstGrp_Code_BN_6.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                            lstGrp_Code_BN_6.value = 'ALL';
                            break;
                        }
                    case 7:
                        {
                            lstGrp_Code_BN_7.SetDataText(txtwg_tmp.text + "|ALL|"+(v_language =="ENG")?"Select All":"Tất cả");
                            lstGrp_Code_BN_7.value = 'ALL';
                            break;
                        }
                }
            }
        }
        dat100030007_1.Call();
    }
  
}
//-------------------------------------------------------------
function ChoseList_box(obj_list,value)
{
    var obj;
    obj_list.SetDataText(value);
    obj=obj_list.GetControl()
	if (obj.options.length ==2)
		obj.options.selectedIndex=0;
	else
		obj.options.selectedIndex=obj.options.length-1;
}
//------------------------------------
function OnReport(optobj)
{
    if(check_init==1)
	{
		 rpt_no = optobj.value;
			for(var i=0;i<optobj.length;i++)
				if (optobj[i].checked)
					rpt_no = i + 1;
		if(tabMain.GetCurrentPageNo()==0)
		{    
			switch (rpt_no)
			{
				case 1:
				{
				    if (lstMoney_Type_1.value == "02") {
				        lstReport.value = "208";
				        txtOrg_tmp_pk.text = lstDept_Code_1.value;
				    }
				    else {
				        lstReport.value = "207";
				        txtOrg_tmp_pk.text = lstDept_Code_1.value;
				    }
					break;
				}
				case 2:
				{
				    lstReport.value = "209";
				    txtOrg_tmp_pk.text = lstDept_Code_2.value;
					break;
				}
				case 3:
				{
				    lstReport.value = "210";
				    txtOrg_tmp_pk.text = lstDept_Code_3.value;
					break;
				}
				case 4:
				{
				    lstReport.value = "211";
				    txtOrg_tmp_pk.text = lstDept_Code_4.value;
					break;
				}
				case 5:
				{
				    lstReport.value = "212";
				    txtOrg_tmp_pk.text = lstDept_Code_5.value;
					break;
				}
				case 6:
				{
				    lstReport.value = "213";
				    txtOrg_tmp_pk.text = lstDept_Code_6.value;
					break;
				}
				case 7:
				{
				    lstReport.value = "214";
				    txtOrg_tmp_pk.text = lstDept_Code_7.value;
					break;
				}
				case 8:
				{
				    lstReport.value = "215";
				    txtOrg_tmp_pk.text = lstDept_Code_8.value;
					break;
				}
				case 9:
				{
				    lstReport.value = "216";
				    txtOrg_tmp_pk.text = lstDept_Code_9.value;
					break;
				}
				case 10:
				{
				    lstReport.value = "217";
				    txtOrg_tmp_pk.text = lstDept_Code_10.value;
					break;
				}
				case 11:
				{
				    lstReport.value = "218";
				    txtOrg_tmp_pk.text = lstDept_Code_11.value;
					break;
				}
			}
			txtReportCode_tmp.text = lstReport.value;
		}
		else if(tabMain.GetCurrentPageNo()==1)//bonus tab
		{
			switch (rpt_no)
			{
				case 1: 
				{   
				    lstReport2.value = "219";
				    txtOrg_tmp_pk.text = lstDept_Code_BN_1.value;
					break;
				}
				case 2: 
				{   
				    lstReport2.value = "220";
				    txtOrg_tmp_pk.text = lstDept_Code_BN_2.value;
					break;
				}
				case 3:
				{
				    lstReport2.value = "221";
				    txtOrg_tmp_pk.text = lstDept_Code_BN_3.value;
					break;
				}
				case 4:
				{
				    lstReport2.value = "222";
				    txtOrg_tmp_pk.text = lstDept_Code_BN_4.value;
					break;
				}
				case 5:
				{
				    lstReport2.value = "223";
				    txtOrg_tmp_pk.text = lstDept_Code_BN_5.value;
					break;
				}
				case 6: 
				{   
				    lstReport2.value = "224";
				    txtOrg_tmp_pk.text = lstDept_Code_BN_6.value;
					break;
				}
				case 7: 
				{   
				    lstReport2.value = "225";
				    txtOrg_tmp_pk.text = lstDept_Code_BN_7.value;
					break;
				}
			}
			txtReportCode_tmp.text = lstReport2.value;
		}
		else
		{
			switch (rpt_no)
			{
				case 1: 
				{   
				    lstReport3.value = "226";
				    txtOrg_tmp_pk.text = "ALL";
					break;
				}
				case 2: 
				{   
				    lstReport3.value = "227";
				    txtOrg_tmp_pk.text = "ALL";
					break;
				}
				case 3:
				{
				    lstReport3.value = "227";
				    txtOrg_tmp_pk.text = "ALL";
					break;
				}
                case 4:
				{
				    lstReport3.value = "229";
				    txtOrg_tmp_pk.text = "ALL";
					break;
				}
			}
			txtReportCode_tmp.text = lstReport3.value;
		}
		
		datFind_Report.Call();
	}	
}

function ChangeYear()
{
    dtMonth_P_From.value=dtYear_P.value + "01";
    dtMonth_P_To.value=dtYear_P.value + "12";
}

function onCheckClose()
{
    check_init=0;
    dat100030007_1.Call();    
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
.topcenter { border-top:1px solid #034D72; }
.bottom { border-bottom:1px solid #034D72; }

.topleftbottom { border-left:1px solid #034D72; 
			border-top :1px solid #034D72;
			border-bottom:1px solid #034D72; }
.topcenterbottom { 
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
<!------------------------------------->

<!------------------------------------------------>
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

<gw:data id="dat100030007_1" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_HRPM00700_0" > 
                <input>
                    <input bind="dtMonth" /> 
                    <input bind="lstSalaryPeriod" /> 
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!--------------------main table--------------------------------->
<gw:tab id="tabMain"  style="width:100%;height:100%;" border="0">
<form name="General Reports" id="Salary" > 
    <table cellpadding="0" cellspacing="0" style="width:100%;height:100%" valign="middle" class="eco_line">
	    <tr height="15%" >
          <td style="width:100%" class="eco_bg" align="center">
            <table cellpadding="2" style="line-height:normal;" cellspacing="1" style="height:100%" border="0" >
                <tr>
                     <td colspan="11" align="center" valign="middle" style="font-family:Times New Roman"><font size="5" color="cc0066">SALARY REPORTS</font></td>
                </tr>
                <tr>
                    <td>Month</td>
                    <td><gw:datebox id="dtMonth"  text="" maxlen = "10" type="month" styles='width:60%' lang="<%=Session("Lang")%>" onchange="onCheckClose()"/> </td>
                    <td style="white-space:nowrap">Emp Type</td>
                    <td width="100px">
                        <gw:list  id="l_Emp_Type" value='ALL' maxlen = "100" styles='width:100%;' onchange="" />
                    </td> 
                    <td style="white-space:nowrap">Sal Period</td>
                    <td width="220px">
                        <gw:list  id="lstSalaryPeriod" maxlen = "100" styles='width:100%' onchange="onCheckClose()" />
                    </td>
                    <td>Status</td>
			        <td width="100px">
			            <gw:list  id="lstStatus" value='ALL' maxlen = "100" styles='width:100%;' onchange="" />
                    </td>                 
                    <td>Nation</td>
                    <td width="100px">
                        <gw:list  id="lstNation" value='ALL' maxlen = "100" styles='width:100%;' onchange="" />
                    </td>
                    <td>
                        <gw:button id="ibtnReport" alt="Excel Report" img="excel" text="Report" onclick="OnReport(Salary.optMonthReport)" />
                    </td>
                </tr>
            </table>
          </td>
        </tr>
        <tr height="85%" valign="top">
	        <td  style="width:100%;height:100%" class="eco_line_t" valign="top">
		        <table style="width:100%;height:auto" border="0" cellpadding="2" cellspacing="1">
			        <tr style="width:100%;"  > 
                        <td width="15%" colspan="2" align="center" style="border-right:0;color:Navy">Report Name</td>
                        <td width="20%" align="center" style="border-left:0;border-right:0;color:Navy">
                            <a class="eco_link"  title="Click here to show Organization" onclick="OnShowPopup()" href="#tips" >Organization</a>
                        </td>
			            <td width="20%" align="center" style="border-left:0;border-right:0;color:Navy">Group</td>
    			        
			            <td width="10%" align="center" style="border-left:0;border-right:0;color:Navy">Pay Type</td>
			            <td width="10%" align="center" style="border-left:0;border-right:0;color:Navy">Money Type</td>
			            <td width="10%" align="center" style="border-left:0;border-right:0;color:Navy">Type</td>
			            <td width="15%" align="center" style="border-left:0;color:Navy">Emp ID</td>
                    </tr>                    
                    <tr style="width:100%;"  valign="top"> 
                        <td width="2%" valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" checked></td>
                        <td valign="middle" style="font-size:12" width="20%" style="border-left:0;border-right:0">Salary Payment</td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstDept_Code_1" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,1);onChange_org(1,1,lstDept_Code_1)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstGrp_Code_1" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,1)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstPay_Type_1" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,1)" />
                        </td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstMoney_Type_1" value='01' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,1)" />
                        </td>                                        
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstType_1" value='>0' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Salary,1)">
                                <data>|>0|>0|=0|=0|<0|<0|>=0|>=0|ALL|ALL</data>
                            </gw:list>
                        </td>
			            <td align="center" valign="middle" style="border-left:0">
			                <gw:textbox id="txtEmp_ID_1" onenterkey   ="onChoose_opt(document.Salary,1);OnReport(Salary.optMonthReport)" styles='width:100%'/>
			            </td>
                    </tr>
                    <tr style="width:100%;"  valign="top"> 
                        <td valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                        <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Pay-slip</td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstDept_Code_2" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,2);onChange_org(1,2,lstDept_Code_2)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstGrp_Code_2" value='ALL' maxlen = "100" styles='width:80%'  onchange="onChoose_opt(document.Salary,2)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstPay_Type_2" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,2)" />
                        </td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstMoney_Type_2" value='01' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,2)" />
                        </td>                                        
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstType_2" value='>0' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Salary,2)">
                                <data>|>0|>0|=0|=0|<0|<0|>=0|>=0|ALL|ALL</data>
                            </gw:list>
                        </td>
			            <td align="center" valign="middle" style="border-left:0">
			                <gw:textbox id="txtEmp_ID_2" onenterkey   ="onChoose_opt(document.Salary,2);OnReport(Salary.optMonthReport)" styles='width:100%' />
			            </td>
                    </tr>
                    <tr style="width:100%;"  valign="top"> 
                        <td valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                        <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Payroll Group Summary</td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstDept_Code_3" value='ALL' maxlen = "100" styles='width:80%'onchange="onChoose_opt(document.Salary,3);onChange_org(1,3,lstDept_Code_3)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstGrp_Code_3" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,3)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstPay_Type_3" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,3)" />
                        </td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstMoney_Type_3" value='01' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,3)" />
                        </td>                                        
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstType_3" value='>0' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Salary,3)">
                                <data>|>0|>0|=0|=0|<0|<0|>=0|>=0|ALL|ALL</data>
                            </gw:list>    
                        </td>
			            <td align="center" valign="middle" style="border-left:0">
			                <gw:textbox id="txtEmp_ID_3" onenterkey   ="onChoose_opt(document.Salary,3);OnReport(Salary.optMonthReport)" styles='width:100%'/>
			            </td>
                    </tr>
                    <tr style="width:100%;"  valign="top"> 
                        <td valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                        <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Income Tax(02_KK)</td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstDept_Code_4" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,4);onChange_org(1,4,lstDept_Code_4)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstGrp_Code_4" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,4)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstPay_Type_4" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,4)" />
                        </td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstMoney_Type_4" value='01' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,4)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstType_4" value='>0' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Salary,4)">
                                <data>|>0|>0|=0|=0|<0|<0|>=0|>=0</data>
                            </gw:list>
                        </td>
			            <td align="center" valign="middle" style="border-left:0">
			                <gw:textbox id="txtEmp_ID_4"  onenterkey="onChoose_opt(document.Salary,4);OnReport(Salary.optMonthReport)" styles='width:100%'/>
			            </td>
                    </tr>
                    <tr style="width:100%;"  valign="top"> 
                        <td valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                        <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Severance Pay</td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstDept_Code_5" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,5);onChange_org(1,5,lstDept_Code_5)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstGrp_Code_5" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,5)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstPay_Type_5" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,5)" />
                        </td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstMoney_Type_5" value='01' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,5)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstType_5" value='>0' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Salary,5)">
			                    <data>|>0|>0|=0|=0|<0|<0|>=0|>=0</data>
                            </gw:list>
                        </td>
			            <td align="center" valign="middle" style="border-left:0">
			                <gw:textbox id="txtEmp_ID_5" onenterkey   ="onChoose_opt(document.Salary,5);OnReport(Salary.optMonthReport)" styles='width:100%'/>
			            </td>
                    </tr>
                    <tr style="width:100%;"  valign="top"> 
                        <td valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                        <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Salary Payment by Bank</td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstDept_Code_6" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,6);onChange_org(1,6,lstDept_Code_6)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstGrp_Code_6" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,6)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstBank_6" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,6)" />
                        </td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstMoney_Type_6" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,6)" />
                        </td>                                        
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstType_6" value='>0' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Salary,6)">
                                <data>|>0|>0|=0|=0|<0|<0|>=0|>=0</data>
                            </gw:list>
                        </td>
			            <td align="center" valign="middle" style="border-left:0">
			                <gw:textbox id="txtEmp_ID_6" onenterkey   ="onChoose_opt(document.Salary,6);OnReport(Salary.optMonthReport)" styles='width:100%'/>
			            </td>
                    </tr>
                    <tr style="width:100%;"  valign="top"> 
                        <td valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                        <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Salary Payment by Cash</td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstDept_Code_7" value='ALL' maxlen = "100" styles='width:80%'onchange="onChoose_opt(document.Salary,7);onChange_org(1,7,lstDept_Code_7)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstGrp_Code_7" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,7);" />
                        </td>
			            <td></td>                                        
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstMoney_Type_7" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,7)" />
                        </td>
			            <td  align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstType_7" value='>0' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Salary,7);" >
                                <data>|>0|>0|=0|=0|<0|<0|>=0|>=0</data>
                            </gw:list>
                        </td>
			            <td align="center" valign="middle" style="border-left:0">
			                <gw:textbox id="txtEmp_ID_7" onenterkey   ="onChoose_opt(document.Salary,7);OnReport(Salary.optMonthReport)" styles='width:100%'/>
			            </td>
                    </tr>
                    <tr style="width:100%;"  valign="top"> 
                        <td valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                        <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Money's Classification</td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstDept_Code_8" value='ALL' maxlen = "100" styles='width:80%'onchange="onChoose_opt(document.Salary,8);onChange_org(1,8,lstDept_Code_8)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstGrp_Code_8" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,8)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstPay_Type_8" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,8)" />
                        </td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstMoney_Type_8" value='01' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,8)" />
                        </td>                                        
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstType_8" value='>0' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Salary,8)">
                                <data>|>0|>0|=0|=0|<0|<0|>=0|>=0</data>
                            </gw:list>
                        </td>
			            <td align="center" valign="middle" style="border-left:0">
			                <gw:textbox id="txtEmp_ID_8" onenterkey   ="onChoose_opt(document.Salary,8);OnReport(Salary.optMonthReport)" styles='width:100%'/>
			            </td>
                    </tr>
                    <tr style="width:100%;"  valign="top"> 
                        <td valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                        <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Money's Classification by Group</td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstDept_Code_9" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,9);onChange_org(1,9,lstDept_Code_9)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstGrp_Code_9" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,9)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstPay_Type_9" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,9)" />
                        </td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstMoney_Type_9" value='01' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,9)" />
                        </td>                                        
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstType_9" value='>0' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Salary,9)">
                                <data>|>0|>0|=0|=0|<0|<0|>=0|>=0</data>
                            </gw:list>
                        </td>
			            <td align="center" valign="middle" style="border-left:0">
			                <gw:textbox id="txtEmp_ID_9" onenterkey   ="onChoose_opt(document.Salary,9);OnReport(Salary.optMonthReport)" styles='width:100%'/>
			            </td>
                    </tr>
                    <tr style="width:100%;"  valign="top"> 
                        <td valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                        <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Insurance payment</td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstDept_Code_10" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,10);onChange_org(1,10,lstDept_Code_10)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstGrp_Code_10" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,10)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstPay_Type_10" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,10)" />
                        </td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstMoney_Type_10" value='01' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,10)" />
                        </td>                                        
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstType_10" value='>0' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Salary,10)">
                                <data>|>0|>0|=0|=0|<0|<0|>=0|>=0|ALL|ALL</data>
                            </gw:list>
                        </td>
			            <td align="center" valign="middle"   style="border-left:0">
			                <gw:textbox id="txtEmp_ID_10" onenterkey   ="onChoose_opt(document.Salary,10);OnReport(Salary.optMonthReport)" styles='width:100%'/>
			            </td>
                    </tr>
                    <tr style="width:100%;"  valign="top"> 
                        <td valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                        <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Income tax detail</td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstDept_Code_11" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,11);onChange_org(1,10,lstDept_Code_11)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstGrp_Code_11" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,11)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstPay_Type_11" value='ALL' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,11)" />
                        </td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstMoney_Type_11" value='01' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,11)" />
                        </td>                                        
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstType_11" value='>0' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Salary,11)">
                                <data>|>0|>0|=0|=0|<0|<0|>=0|>=0|ALL|ALL</data>
                            </gw:list>
                        </td>
			            <td align="center" valign="middle"   style="border-left:0">
			                <gw:textbox id="txtEmp_ID_11" onenterkey   ="onChoose_opt(document.Salary,11);OnReport(Salary.optMonthReport)" styles='width:100%'/>
			            </td>
                    </tr>
                </table>
	        </td>
	    </tr>	
     </table>
 </form>
<form name="Bonus Reports" id="Bonus" > 
    <table cellpadding="0" cellspacing="0" style="width:100%;height:100%" valign="middle" class="eco_line">
	    <tr height="15%" >
          <td style="width:100%" class="eco_bg" align="center">
            <table cellpadding="2" style="line-height:normal;" cellspacing="1" style="height:100%"  border="0" >
                <tr>
                    <td width="100%" colspan="5"  align="center" valign="middle" style="font-family:Times New Roman"><font size="5" color="cc0066">BONUS YEAR</font></td>
                </tr>
                <tr>
                    <td>Year</td>
                    <td><gw:datebox id="dtYear"  text="" maxlen = "10" type="year" lang="<%=Session("Lang")%>" /> </td>
                    <td>Time</td>
                    <td width="150px">
                        <gw:list  id="lstTimes"  maxlen = "100" styles='width:100%' />
                    </td>
                    <td><gw:button id="ibtnReport_B" alt="Excel Report" img="excel" text="Report" onclick="OnReport(Bonus.optMonthReport)" /></td>
                </tr>
            </table>
          </td>
        </tr>
        <tr height="85%">
	        <td  style="width:100%;height:100%" class="eco_line_t" valign="top">
		        <table style="width:100%;height:auto" border="0" cellpadding="2" cellspacing="1">
			        <tr style="width:100%;"  > 
                        <td width="18%" colspan="2" align="center" style="border-right:0;color:Navy">Report Name</td>
                        <td width="20%" align="center" style="border-left:0;border-right:0;color:Navy"><a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup()" href="#tips" >Organization</a></td>
			            <td width="20%" align="center" style="border-left:0;border-right:0;color:Navy">Group</td>
			            <td width="14%" align="center" style="border-left:0;border-right:0;color:Navy">Pay Type</td>
			            <td width="14%" align="center" style="border-left:0;border-right:0;color:Navy">Money Type</td>
			            <td width="14%" align="center" style="border-left:0;color:Navy">Emp ID</td>
                    </tr>
                    <tr style="width:100%;"  valign="top"> 
                        <td width="2%" valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" checked></td>
                        <td valign="middle" style="font-size:12" width="23%" style="border-left:0;border-right:0">Bonus Payment</td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstDept_Code_BN_1" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,1);onChange_org(2,1,lstDept_Code_BN_1)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstGrp_Code_BN_1" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,1)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstPay_Type_BN_1" value='ALL' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Bonus,1)" />
                        </td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstMoney_Type_BN_1" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,1)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0">
			                <gw:textbox id="txtEmp_ID_BN_1" onenterkey   ="onChoose_opt(document.Bonus,1);OnReport(Bonus.optMonthReport)" styles='width:100%'/>
			            </td>
                    </tr>
                    <tr style="width:100%;"  valign="top"> 
                        <td valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                        <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Bonus slip</td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstDept_Code_BN_2" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,2);onChange_org(2,2,lstDept_Code_BN_2)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstGrp_Code_BN_2" value='ALL' maxlen = "100" styles='width:60%'  onchange="onChoose_opt(document.Bonus,2)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstPay_Type_BN_2" value='ALL' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Bonus,2)" />
                        </td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstMoney_Type_BN_2" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,2)" />
                        </td>                                        
			            <td align="center" valign="middle" style="border-left:0">
			                <gw:textbox id="txtEmp_ID_BN_2" onenterkey   ="onChoose_opt(document.Bonus,2);OnReport(Bonus.optMonthReport)" styles='width:100%' />
			            </td>
                    </tr>
                    <tr style="width:100%;"  valign="top"> 
                        <td valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                        <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Bonus Group Summary</td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstDept_Code_BN_3" value='ALL' maxlen = "100" styles='width:60%'onchange="onChoose_opt(document.Bonus,3);onChange_org(2,3,lstDept_Code_BN_3)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstGrp_Code_BN_3" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,3)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstPay_Type_BN_3" value='ALL' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Bonus,3)" />
                        </td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstMoney_Type_BN_3" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,3)" />
                        </td>                    
			            <td align="center" valign="middle" style="border-left:0">
			                <gw:textbox id="txtEmp_ID_BN_3" onenterkey   ="onChoose_opt(document.Bonus,3);OnReport(Bonus.optMonthReport)" styles='width:100%'/>
			            </td>
                    </tr>
                    <tr style="width:100%;"  valign="top"> 
                        <td valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                        <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Bonus Payment by Bank</td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstDept_Code_BN_4" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,4);onChange_org(2,4,lstDept_Code_BN_4)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstGrp_Code_BN_4" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,4)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstPay_Type_BN_4" value='ALL' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Bonus,4)" />
                        </td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstMoney_Type_BN_4"  maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,4)" />
                        </td>                    
			            <td align="center" valign="middle" style="border-left:0">
			                <gw:textbox id="txtEmp_ID_BN_4" onenterkey   ="onChoose_opt(document.Bonus,4);OnReport(Bonus.optMonthReport)" styles='width:100%'/>
			            </td>
                    </tr>
                    <tr style="width:100%;"  valign="top"> 
                        <td valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                        <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Bonus Payment by Cash</td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstDept_Code_BN_5" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,5);onChange_org(2,5,lstDept_Code_BN_5)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstGrp_Code_BN_5" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,5)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstPay_Type_BN_5" value='ALL' maxlen = "100" styles='width:70%; display:none' onchange="onChoose_opt(document.Bonus,5)" />
                        </td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstMoney_Type_BN_5" maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,5)" />
                        </td>                    
			            <td align="center" valign="middle" style="border-left:0">
			                <gw:textbox id="txtEmp_ID_BN_5" onenterkey   ="onChoose_opt(document.Bonus,5);OnReport(Bonus.optMonthReport)" styles='width:100%'/>
			            </td>
                    </tr>
                    <tr style="width:100%;"  valign="top"> 
                        <td valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                        <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Money's Classification</td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstDept_Code_BN_6" value='ALL' maxlen = "100" styles='width:60%'onchange="onChoose_opt(document.Bonus,6);onChange_org(2,6,lstDept_Code_BN_6)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstGrp_Code_BN_6" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,6);" />
                        </td>
			            <td  align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstPay_Type_BN_6" value='ALL' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Bonus,6);" />
                        </td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstMoney_Type_BN_6" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,6)" />
                        </td>                    
			            <td align="center" valign="middle" style="border-left:0">
			                <gw:textbox id="txtEmp_ID_BN_6" onenterkey   ="onChoose_opt(document.Bonus,6);OnReport(Bonus.optMonthReport)" styles='width:100%'/>
			            </td>
                    </tr>
                    <tr style="width:100%;"  valign="top"> 
                        <td valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                        <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Money's Classification by Group</td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstDept_Code_BN_7" value='ALL' maxlen = "100" styles='width:60%'onchange="onChoose_opt(document.Bonus,7);onChange_org(2,7,lstDept_Code_BN_7)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstGrp_Code_BN_7" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,7)" />
                        </td>
			            <td align="center" valign="middle" style="border-left:0;border-right:0">
			                <gw:list  id="lstPay_Type_BN_7" value='ALL' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Bonus,7)" />
                        </td>
                        <td align="center" valign="middle" style="border-left:0;border-right:0">
                            <gw:list  id="lstMoney_Type_BN_7" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,7)" />
                        </td>                    
			            <td align="center" valign="middle" style="border-left:0">
			                <gw:textbox id="txtEmp_ID_BN_7" onenterkey   ="onChoose_opt(document.Bonus,7);OnReport(Bonus.optMonthReport)" styles='width:100%'/>
			            </td>
                    </tr>
                </table>
	        </td>
	    </tr>	
    </table>
</form>
<form name="PIT Reports" id="PIT" > 
<table cellpadding="0" cellspacing="0" style="width:100%;height:100%" valign="middle" class="eco_line">
	<tr height="15%" >
      <td style="width:100%" class="eco_bg" align="center">
        <table cellpadding="2" style="line-height:normal;" cellspacing="1" style="height:100%"  border="0" >
            <tr>
                <td colspan="7"  align="center" valign="middle" style="font-family:Times New Roman"><font size="5" color="cc0066">PERSONAL INCOME TAX</font></td>
            </tr>
            <tr>
                <td>Year</td>
                <td><gw:datebox id="dtYear_P"  text="" maxlen = "10" type="year" lang="<%=Session("Lang")%>" onchange="ChangeYear()"/> </td>
                <td>Month</td>
                <td><gw:datebox id="dtMonth_P_From"  text="" maxlen = "10" type="month" lang="<%=Session("Lang")%>" /> </td>
                <td><b>~</b></td>
                <td><gw:datebox id="dtMonth_P_To"  text="" maxlen = "10" type="month" lang="<%=Session("Lang")%>" /> </td>
                <td><gw:button id="ibtnReport_P" alt="Excel Report" img="excel" text="Report" onclick="OnReport(PIT.optYearReport)" /></td>
            </tr>
        </table>
      </td>
    </tr>
    <tr height="85%">
	    <td  style="width:100%;height:100%" class="eco_line_t" valign="top" align="center">
		    <table style="width:auto;height:auto" border="0" cellpadding="2" cellspacing="1">
			    <tr style="width:100%;"  > 
			        <td align="center" colspan="2" style="border-left:0;border-right:0;color:Navy">Report Name</td>
                </tr>
                <tr valign="top"> 
			        <td valign="middle"><input type="radio" name="optYearReport" value="1" checked></td>
                    <td style="font-size:12">Tờ khai quyết toán thuế thu nhập cá nhân (05/KK)</td>
                </tr>
                <tr valign="top"> 
			        <td valign="middle"><input type="radio" name="optYearReport" value="2" ></td>
                    <td style="font-size:12">Bảng kê thu nhập chịu thuế và thuế TNCN - HĐLĐ (05A/BK)</td>
                </tr>
                <tr valign="top"> 
			        <td valign="middle"><input type="radio" name="optYearReport" value="3" ></td>
                    <td style="font-size:12">Bảng kê thu nhập chịu thuế và thuế TNCN - Không HĐLĐ (05B/BK)</td>
                </tr>
                <tr valign="top"> 
			        <td valign="middle"><input type="radio" name="optYearReport" value="4" ></td>
                    <td style="font-size:12">Bảng kê thu nhập chịu thuế - Bảo hiểm</td>
                </tr>                
            </table>
	    </td>
	</tr>	
 </table>
</form>
 </gw:tab>
    <gw:textbox id="txtDept" styles="display:none"/>	
    <gw:textbox id="txtDeptData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="iduser_pk" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>  
    <gw:textbox id="txtReport_tmp" styles="display:none"/>
    <gw:textbox id="txtdept_temp" styles="display:none"/>
    <gw:textbox id="txtReportCode_tmp" styles="display:none"/>
    <gw:textbox id="txtOrg_tmp_pk" text="" styles="display:none"  />
    <gw:textbox id="txtorg_tmp" styles="display:none"/>
    <gw:textbox id="txtwg_tmp" styles="display:none"/>    
    <gw:textbox id="txtResult" styles="display:none"/>  
    <gw:list  id="lstReport" styles="display:none" />
    <gw:list  id="lstReport2" styles="display:none" />
    <gw:list  id="lstReport3" styles="display:none" />
</body>
</html>

