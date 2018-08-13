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
    //if (v_language!="ENG") 
        System.Translate(document);	
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    
    
    var tmp="<%=CtlLib.SetListDataSQL("select a.Code,a.CODE_NM ||' ' || char_1 || '->' || char_2 from thr_code_master b,thr_code_detail a  where b.pk=a.THR_CODE_MASTER_PK and a.del_if=0 and b.del_if=0 and b.ID='HR0030' ")%>";
    lstSalaryPeriod.SetDataText(tmp);        
    
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
    var fpath = System.RootURL + "/form/ch/ae/chae00010_org.aspx?";
    var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:200;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
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


   if (obj.id == "datFind_Report")
   {
        var url = System.RootURL;
        if(tabMain.GetCurrentPageNo()==0)//Salary reports 
        {
            switch (rpt_no)
            {
                case 1:
                {
                    url = url + '/reports/ch/cs/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_1.value  + '&l_group=' + lstGrp_Code_1.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_1.text + '&l_work_mon=' + dtMonth.value + '&l_pay_type=' + lstPay_Type_1.value + '&l_type=' + lstType_1.value + '&l_m_type=' + lstMoney_Type_1.value + "&l_sal_period="+lstSalaryPeriod.value + "&l_Emp_Type="+l_Emp_Type.value + "&l_nation="+lstNation.value;
                    break;
                }
                case 2:
                {
                    url = url + '/reports/ch/cs/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_2.value  + '&l_group=' + lstGrp_Code_2.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_2.text + '&l_work_mon=' + dtMonth.value + '&l_pay_type=' + lstPay_Type_2.value + '&l_type=' + lstType_2.value + '&l_m_type=' + lstMoney_Type_2.value+ "&l_sal_period="+lstSalaryPeriod.value + "&l_Emp_Type="+l_Emp_Type.value + "&l_nation="+lstNation.value;
                    break;
                }
                case 3:
                {
                    url = url + '/reports/ch/cs/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_3.value  + '&l_group=' + lstGrp_Code_3.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_3.text + '&l_work_mon=' + dtMonth.value + '&l_pay_type=' + lstPay_Type_3.value + '&l_type=' + lstType_3.value + '&l_m_type=' + lstMoney_Type_3.value+ "&l_sal_period="+lstSalaryPeriod.value + "&l_Emp_Type="+l_Emp_Type.value + "&l_nation="+lstNation.value;
                    break;
                }
                case 4:
                {
                    url = url + '/reports/ch/cs/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_4.value  + '&l_group=' + lstGrp_Code_4.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_4.text + '&l_work_mon=' + dtMonth.value + '&l_pay_type=' + lstPay_Type_4.value + '&l_type=' + lstType_4.value + '&l_m_type=' + lstMoney_Type_4.value+ "&l_sal_period="+lstSalaryPeriod.value + "&l_Emp_Type="+l_Emp_Type.value + "&l_nation="+lstNation.value;
                    break;
                }
                case 5:
                {
                    url = url + '/reports/ch/cs/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_5.value  + '&l_group=' + lstGrp_Code_5.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_5.text + '&l_work_mon=' + dtMonth.value + '&l_pay_type=' + lstPay_Type_5.value + '&l_type=' + lstType_5.value + '&l_m_type=' + lstMoney_Type_5.value+ "&l_sal_period="+lstSalaryPeriod.value + "&l_Emp_Type="+l_Emp_Type.value + "&l_nation="+lstNation.value;
                    break;
                }
                case 6:
                {
                    url = url + '/reports/ch/cs/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_6.value  + '&l_group=' + lstGrp_Code_6.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_6.text + '&l_work_mon=' + dtMonth.value + '&l_pay_type=' + lstBank_6.value + '&l_type=' + lstType_6.value + '&l_m_type=' + lstMoney_Type_6.value+ "&l_sal_period="+lstSalaryPeriod.value + "&l_Emp_Type="+l_Emp_Type.value + "&l_nation="+lstNation.value;
                    break;
                }
                case 7:
                {
                    url = url + '/reports/ch/cs/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_7.value  + '&l_group=' + lstGrp_Code_7.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_7.text + '&l_work_mon=' + dtMonth.value +  '&l_type=' + lstType_7.value + '&l_m_type=' + lstMoney_Type_7.value+ "&l_sal_period="+lstSalaryPeriod.value + "&l_Emp_Type="+l_Emp_Type.value + "&l_nation="+lstNation.value;
                    break;
                }
                case 8:
                {
                    url = url + '/reports/ch/cs/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_8.value  + '&l_group=' + lstGrp_Code_8.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_8.text + '&l_work_mon=' + dtMonth.value + '&l_pay_type=' + lstPay_Type_8.value + '&l_type=' + lstType_8.value + '&l_m_type=' + lstMoney_Type_8.value+ "&l_sal_period="+lstSalaryPeriod.value + "&l_Emp_Type="+l_Emp_Type.value + "&l_nation="+lstNation.value;
                    break;
                }
                case 9:
                {
                    url = url + '/reports/ch/cs/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_9.value  + '&l_group=' + lstGrp_Code_9.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_9.text + '&l_work_mon=' + dtMonth.value + '&l_pay_type=' + lstPay_Type_9.value + '&l_type=' + lstType_9.value + '&l_m_type=' + lstMoney_Type_9.value+ "&l_sal_period="+lstSalaryPeriod.value + "&l_Emp_Type="+l_Emp_Type.value + "&l_nation="+lstNation.value;
                    break;
                }
                case 10:
                {
                    url = url + '/reports/ch/cs/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_10.value  + '&l_group=' + lstGrp_Code_10.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_10.text + '&l_work_mon=' + dtMonth.value + '&l_pay_type=' + lstPay_Type_10.value + '&l_type=' + lstType_10.value + '&l_m_type=' + lstMoney_Type_10.value+ "&l_sal_period="+lstSalaryPeriod.value + "&l_Emp_Type="+l_Emp_Type.value + "&l_nation="+lstNation.value;
                    break;
                }
                case 11:
                {
                    url = url + '/reports/ch/cs/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_11.value  + '&l_group=' + lstGrp_Code_11.value + '&l_status=' + lstStatus.value + '&l_emp_id=' + txtEmp_ID_11.text + '&l_work_mon=' + dtMonth.value + '&l_pay_type=' + lstPay_Type_11.value + '&l_type=' + lstType_11.value + '&l_m_type=' + lstMoney_Type_11.value+ "&l_sal_period="+lstSalaryPeriod.value + "&l_Emp_Type="+l_Emp_Type.value + "&l_nation="+lstNation.value;
                    break;
                }
            }
        }
        else if (tabMain.GetCurrentPageNo()==1) //Bonus reports
        {                      
            switch(rpt_no)
            {
                case 1:
                {
                    url = url + '/reports/ch/cs/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_BN_1.value  +
                         '&l_group=' + lstGrp_Code_BN_1.value + 
                         '&l_emp_id=' + txtEmp_ID_BN_1.text + 
                         '&l_year=' + dtYear.value + 
                         '&l_pay_type=' + lstPay_Type_BN_1.value + '&l_bn_times=' + lstTimes.value +
                         '&l_m_type=' + lstMoney_Type_BN_1.value;
                    break;
                }
                case 3:
                {
                    url = url + '/reports/ch/cs/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_BN_3.value  +
                         '&l_group=' + lstGrp_Code_BN_3.value + 
                         '&l_emp_id=' + txtEmp_ID_BN_3.text + 
                         '&l_year=' + dtYear.value + 
                         '&l_pay_type=' + lstPay_Type_BN_3.value + '&l_bn_times=' + lstTimes.value +
                         '&l_m_type=' + lstMoney_Type_BN_3.value;
                    break;
                }
                case 4:
                {
                    url = url + '/reports/ch/cs/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_BN_4.value  +
                         '&l_group=' + lstGrp_Code_BN_4.value + 
                         '&l_emp_id=' + txtEmp_ID_BN_4.text + 
                         '&l_year=' + dtYear.value + 
                         '&l_pay_type=' + lstPay_Type_BN_4.value + '&l_bn_times=' + lstTimes.value +
                         '&l_m_type=' + lstMoney_Type_BN_4.value;
                    break;
                }
                case 5:
                {
                    url = url + '/reports/ch/cs/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_BN_5.value  +
                         '&l_group=' + lstGrp_Code_BN_5.value + 
                         '&l_emp_id=' + txtEmp_ID_BN_5.text + 
                         '&l_year=' + dtYear.value + 
                         '&l_pay_type=' + lstPay_Type_BN_5.value + '&l_bn_times=' + lstTimes.value +
                         '&l_m_type=' + lstMoney_Type_BN_5.value;
                    break;
                }
				case 6:
                {
                    url = url + '/reports/ch/cs/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_BN_6.value  +
                         '&l_group=' + lstGrp_Code_BN_6.value + 
                         '&l_emp_id=' + txtEmp_ID_BN_6.text + 
                         '&l_year=' + dtYear.value + 
                         '&l_pay_type=' + lstPay_Type_BN_6.value + '&l_bn_times=' + lstTimes.value +
                         '&l_m_type=' + lstMoney_Type_BN_6.value;
                    break;
                }
				case 7:
                {
                    url = url + '/reports/ch/cs/' + txtReport_tmp.text + '?l_dept=' + lstDept_Code_BN_7.value  +
                         '&l_group=' + lstGrp_Code_BN_7.value + 
                         '&l_emp_id=' + txtEmp_ID_BN_7.text + 
                         '&l_year=' + dtYear.value + 
                         '&l_pay_type=' + lstPay_Type_BN_7.value + '&l_bn_times=' + lstTimes.value +
                         '&l_m_type=' + lstMoney_Type_BN_7.value;
                    break;
                }
            }
        }
        else //PIT reports
        {
            url = url + '/reports/ch/cs/' + txtReport_tmp.text + '?p_year=' + dtYear_P.value + '&p_month_from=' + dtMonth_P_From.value + '&p_month_to=' + dtMonth_P_To.value;
            
        }
        
        System.OpenTargetPage( url , 'newform' );
   }
   else if (obj.id == "dat100030007_1")
   {
        check_init=1;
        if(txtResult.text=="0")
            ibtnReport.SetEnable(1);
        else
            ibtnReport.SetEnable(0);
                 
   }
   else if (obj.id == "datUser_info")
   {
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

			onChange_org(0,0,lstDept_Code_1);	
   }
   else if (obj.id == "datWorkGroup_info")
   {
		if(flag_tab==0)
		{
				lstGrp_Code_1.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_2.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_3.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_4.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_5.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_6.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_7.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_8.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_9.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_10.SetDataText(txtwg_tmp.text + "|ALL|Select All");
                lstGrp_Code_11.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				
				lstGrp_Code_BN_1.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_BN_2.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_BN_3.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_BN_4.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_BN_5.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_BN_6.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_BN_7.SetDataText(txtwg_tmp.text + "|ALL|Select All");

                lstGrp_Code_1.value='ALL';
				lstGrp_Code_2.value='ALL';
				lstGrp_Code_3.value='ALL';
				lstGrp_Code_4.value='ALL';
				lstGrp_Code_5.value='ALL';
				lstGrp_Code_6.value='ALL';
				lstGrp_Code_7.value='ALL';
				lstGrp_Code_8.value='ALL';
				lstGrp_Code_9.value='ALL';
				lstGrp_Code_10.value='ALL';
				lstGrp_Code_11.value='ALL';
				lstGrp_Code_BN_1.value='ALL';
				lstGrp_Code_BN_2.value='ALL';
				lstGrp_Code_BN_3.value='ALL';
				lstGrp_Code_BN_4.value='ALL';
				lstGrp_Code_BN_5.value='ALL';
				lstGrp_Code_BN_6.value='ALL';
				lstGrp_Code_BN_7.value='ALL';
		}
		else if(flag_tab==1)
		{
			if(flag_wg==0)
			{
				lstGrp_Code_1.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_2.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_3.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_4.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_5.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_6.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_7.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_8.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_9.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_10.SetDataText(txtwg_tmp.text + "|ALL|Select All");
                lstGrp_Code_11.SetDataText(txtwg_tmp.text + "|ALL|Select All");

                lstGrp_Code_1.value='ALL';
				lstGrp_Code_2.value='ALL';
				lstGrp_Code_3.value='ALL';
				lstGrp_Code_4.value='ALL';
				lstGrp_Code_5.value='ALL';
				lstGrp_Code_6.value='ALL';
				lstGrp_Code_7.value='ALL';
				lstGrp_Code_8.value='ALL';
				lstGrp_Code_9.value='ALL';
				lstGrp_Code_10.value='ALL';
				lstGrp_Code_11.value='ALL';
				
			}
			else
			{
				switch (flag_wg)
				{
					case 1:
						{
							lstGrp_Code_1.SetDataText(txtwg_tmp.text + "|ALL|Select All");
							lstGrp_Code_1.value='ALL';
							break;
						}
					case 2:
						{
							lstGrp_Code_2.SetDataText(txtwg_tmp.text + "|ALL|Select All");
							lstGrp_Code_2.value='ALL';
							break;
						}
					case 3:
						{
							lstGrp_Code_3.SetDataText(txtwg_tmp.text + "|ALL|Select All");
							lstGrp_Code_3.value='ALL';
							break;
						}		
					case 4:
						{
							lstGrp_Code_4.SetDataText(txtwg_tmp.text + "|ALL|Select All");
							lstGrp_Code_4.value='ALL';
							break;
						}	
					case 5:
						{
							lstGrp_Code_5.SetDataText(txtwg_tmp.text + "|ALL|Select All");
							lstGrp_Code_5.value='ALL';
							break;
						}
					case 6:
						{
							lstGrp_Code_6.SetDataText(txtwg_tmp.text + "|ALL|Select All");
							lstGrp_Code_6.value='ALL';
							break;
						}
					case 7:
						{
							lstGrp_Code_7.SetDataText(txtwg_tmp.text + "|ALL|Select All");
							lstGrp_Code_7.value='ALL';
							break;
						}
					case 8:
						{
							lstGrp_Code_8.SetDataText(txtwg_tmp.text + "|ALL|Select All");
							lstGrp_Code_8.value='ALL';
							break;
						}
					case 9:
						{
							lstGrp_Code_9.SetDataText(txtwg_tmp.text + "|ALL|Select All");
							lstGrp_Code_9.value='ALL';
							break;
						}	
					case 10:
						{
							lstGrp_Code_10.SetDataText(txtwg_tmp.text + "|ALL|Select All");
							lstGrp_Code_10.value='ALL';
							break;
						}	
                    case 11:
						{
							lstGrp_Code_11.SetDataText(txtwg_tmp.text + "|ALL|Select All");
							lstGrp_Code_11.value='ALL';
							break;
						}
				}
			}
		}
		else if(flag_tab==2)
		{
			if(flag_wg==0)
			{
				lstGrp_Code_BN_1.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_BN_2.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_BN_3.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_BN_4.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_BN_5.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_BN_6.SetDataText(txtwg_tmp.text + "|ALL|Select All");
				lstGrp_Code_BN_7.SetDataText(txtwg_tmp.text + "|ALL|Select All");

                lstGrp_Code_BN_1.value='ALL';
				lstGrp_Code_BN_2.value='ALL';
				lstGrp_Code_BN_3.value='ALL';
				lstGrp_Code_BN_4.value='ALL';
				lstGrp_Code_BN_5.value='ALL';
				lstGrp_Code_BN_6.value='ALL';
				lstGrp_Code_BN_7.value='ALL';
			}
			else
			{
				switch (flag_wg)
				{
					case 1:
						{
							lstGrp_Code_BN_1.SetDataText(txtwg_tmp.text + "|ALL|Select All");
							lstGrp_Code_BN_1.value='ALL';
							break;
						}
					case 2:
						{
							lstGrp_Code_BN_2.SetDataText(txtwg_tmp.text + "|ALL|Select All");
							lstGrp_Code_BN_2.value='ALL';
							break;
						}
					case 3:
						{
							lstGrp_Code_BN_3.SetDataText(txtwg_tmp.text + "|ALL|Select All");
							lstGrp_Code_BN_3.value='ALL';
							break;
						}		
					case 4:
						{
							lstGrp_Code_BN_4.SetDataText(txtwg_tmp.text + "|ALL|Select All");
							lstGrp_Code_BN_4.value='ALL';
							break;
						}	
					case 5:
						{
							lstGrp_Code_BN_5.SetDataText(txtwg_tmp.text + "|ALL|Select All");
							lstGrp_Code_BN_5.value='ALL';
							break;
						}
					case 6:
						{
							lstGrp_Code_BN_6.SetDataText(txtwg_tmp.text + "|ALL|Select All");
							lstGrp_Code_BN_6.value='ALL';
							break;
						}
					case 7:
						{
							lstGrp_Code_BN_7.SetDataText(txtwg_tmp.text + "|ALL|Select All");
							lstGrp_Code_BN_7.value='ALL';
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
					if (lstMoney_Type_1.value=="02")
					{
						txtReport_tmp.text = "rpt_employee_payroll_usd.aspx";
					}
					else
						txtReport_tmp.text = "rpt_employee_payroll.aspx";
					break;
				}
				case 2:
				{
					txtReport_tmp.text = "rpt_salary_pay_slip.aspx";
					break;
				}
				case 3:
				{
					txtReport_tmp.text = "rpt_payroll_summary.aspx";
					break;
				}
				case 4:
				{
					txtReport_tmp.text = "rpt_income_tax.aspx";
					break;
				}
				case 5:
				{
					txtReport_tmp.text = "rpt_severance_summary.aspx";
					break;
				}
				case 6:
				{
					txtReport_tmp.text = "rpt_atm_transferring.aspx";
					break;
				}
				case 7:
				{
					txtReport_tmp.text = "rpt_cash_payment.aspx";
					break;
				}
				case 8:
				{
					txtReport_tmp.text = "rpt_classification_detail.aspx";
					break;
				}
				case 9:
				{
					txtReport_tmp.text = "rpt_classification_group.aspx";
					break;
				}
				case 10:
				{
					txtReport_tmp.text = "rpt_insurance_payment.aspx";
					break;
				}
				case 11:
				{
					txtReport_tmp.text = "rpt_tax_detail.aspx";
					break;
				}
			}
		}
		else if(tabMain.GetCurrentPageNo()==1)//bonus tab
		{
			switch (rpt_no)
			{
				case 1: 
				{   
					txtReport_tmp.text = "rpt_bonus_payment.aspx";
					break;
				}
				case 2: 
				{   
					txtReport_tmp.text = "";
					break;
				}
				case 3:
				{
					txtReport_tmp.text = "rpt_bonus_group_payment.aspx";
					break;
				}
				case 4:
				{
					txtReport_tmp.text = "rpt_bonus_payment_bank.aspx";
					break;
				}
				case 5:
				{
					txtReport_tmp.text = "rpt_bonus_payment_cash.aspx";
					break;
				}
				case 6: 
				{   
					txtReport_tmp.text = "rpt_bonus_classification.aspx";
					break;
				}
				case 7: 
				{   
					txtReport_tmp.text = "rpt_bonus_classification_group.aspx";
					break;
				}
			}
		}
		else
		{
			switch (rpt_no)
			{
				case 1: 
				{   
					txtReport_tmp.text = "rpt_05_KK.aspx" ;
					break;
				}
				case 2: 
				{   
					txtReport_tmp.text = "rpt_05a_bk.aspx";
					break;
				}
				case 3:
				{
					txtReport_tmp.text = "rpt_05b_bk.aspx";
					break;
				}
                case 4:
				{
					txtReport_tmp.text = "rpt_05A_KK_detail.aspx";
					break;
				}
			}
		}
				
		datFind_Report.Call();
	}	
}
function OnReport_Lock(optobj)
{
    if(check_init==1)
	{
        rpt_no = optobj.value;
        for(var i=0;i<optobj.length;i++)
            if (optobj[i].checked)
                rpt_no = i + 1;
    //    if(tabMain.GetCurrentPageNo()==0)
    //    {    
            switch (rpt_no)
            {
                case 1:
                {
			        if (lstMoney_Type_1.value=="02")
			        {
				        txtReport_tmp.text = "rpt_employee_payroll_usd.aspx";
			        }
			        else
				        txtReport_tmp.text = "rpt_employee_payroll_pdf.aspx";
                    break;
                }
                case 2:
                {
                    txtReport_tmp.text = "rpt_salary_pay_slip_pdf.aspx";
                    break;
                }
                case 3:
                {
                    txtReport_tmp.text = "rpt_payroll_summary.aspx";
                    break;
                }
                case 4:
                {
                    txtReport_tmp.text = "rpt_income_tax.aspx";
                    break;
                }
                case 5:
                {
                    txtReport_tmp.text = "rpt_severance_summary.aspx";
                    break;
                }
                case 6:
                {
                    txtReport_tmp.text = "rpt_atm_transferring.aspx";
                    break;
                }
                case 7:
                {
                    txtReport_tmp.text = "rpt_cash_payment.aspx";
                    break;
                }
                case 8:
                {
                    txtReport_tmp.text = "rpt_classification_detail.aspx";
                    break;
                }
                case 9:
                {
                    txtReport_tmp.text = "rpt_classification_group.aspx";
                    break;
                }
                case 10:
                {
                    txtReport_tmp.text = "rpt_insurance_payment.aspx";
                    break;
                }
                case 11:
                {
                    txtReport_tmp.text = "rpt_salary_payment.aspx";
                    break;
                }
            }
    //    }
    /*    else if(tabMain.GetCurrentPageNo()==1)//bonus tab
        {
            switch (rpt_no)
            {
                case 1: 
                {   
                    txtReport_tmp.text = "rpt_bonus_payment.aspx";
                    break;
                }
                case 2: 
                {   
                    txtReport_tmp.text = "rpt_bonus_slip.aspx";
                    break;
                }
                case 3:
                {
                    txtReport_tmp.text = "rpt_bonus_group_payment.aspx";
                    break;
                }
                case 4:
                {
                    txtReport_tmp.text = "rpt_bonus_payment_bank.aspx";
                    break;
                }
                case 5:
                {
                    txtReport_tmp.text = "rpt_bonus_payment_cash.aspx";
                    break;
                }
                case 6: 
                {   
                    txtReport_tmp.text = "";
                    break;
                }
                case 7: 
                {   
                    txtReport_tmp.text = "";
                    break;
                }
            }
        }
        else
        {
            switch (rpt_no)
            {
                case 1: 
                {   
                    txtReport_tmp.text = "rpt_05_KK.aspx" ;
                    break;
                }
                case 2: 
                {   
                    txtReport_tmp.text = "rpt_05a_bk.aspx";
                    break;
                }
                case 3:
                {
                    txtReport_tmp.text = "rpt_05b_bk.aspx";
                    break;
                }
                case 4:
                {
                    txtReport_tmp.text = "rpt_income_before_tax_ins.aspx";
                    break;
                }
            }
        }
*/            
        datFind_Report.Call();
    }
}
//------------------------------
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

<body>
<!------------main control---------------------->
<!------------------------------------->

<!------------------------------------------------>
<gw:data id="datFind_Report" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="hr_sp_pro_find_report_2" > 
                <input>
                    <input bind="txtReport_tmp" /> 
                    <input bind="txtOrg_tmp" /> 
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="hr_sp_sel_user_role2"  > 
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
            <dso  type="list" procedure="hr_sp_sel_wg_role"  > 
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
            <dso  type="process" procedure="hr_pro_100030007_1" > 
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
<gw:tab id="tabMain"  border=1 style="width:100%;height:100%;">
<form name="General Reports" id="Salary" > 
<table   cellpadding="0" cellspacing="0" style="width:100%;height:80%"   valign="middle" border="0" >
	<tr height="15%" >
      <td style="width:100%">
        <table cellpadding="0" style="line-height:normal; padding:0" cellspacing="0" style="width:100%;height:100%" width="100%"  border="0" >
			<tr style="border:0;width:100%;height:5%" valign="center" >
				<td colspan=90 width="90%" style="border:0" class="topleft" align="center" >
					<font size="5" color="cc0066">SALARY REPORTS</font>
				</td>
				<td colspan=5 width="5%" align="center" valign="middle" class="top"></td>
				<td colspan=5 width="5%" class="topright" style="border:0" align="left"> 
					<gw:imgBtn id="ibtnReport" alt="Excel Report" img="excel" text="Print" onclick="OnReport(Salary.optMonthReport)" />
				</td>
			</tr>
            <tr style="border:0;width:100%;height:5%" valign="center" >
				<td colspan=2 width="2%" style="border:0"  >
					
				</td>
				<td colspan=8 width="8%" style="border:0"  align="left" >
					Month
				</td>
				<td colspan=15 width="15%" style="border:0"  align="left" >
					<gw:datebox id="dtMonth"  text="" maxlen = "10" type="month" styles='width:60%' lang="<%=Session("Lang")%>" onchange="onCheckClose()"/>
				</td>
				<td colspan=2 width="2%" style="border:0"  >
				
				</td>
				<td colspan=8 width="8%" style="border:0"  align="left" >
					Sal Period
				</td>
				<td colspan=15 width="15%" style="border:0"> 
					<gw:list  id="lstSalaryPeriod" maxlen = "100" styles='width:100%' onchange="onCheckClose()" ></gw:list>
				</td>
				<td colspan=2 width="2%" style="border:0"  >
				
				</td>
				<td colspan=8 width="8%" style="border:0"  align="left" >
					Emp Type
				</td>
				<td colspan=15 style="border:0" width="15%"  align="left" >
					<gw:list  id="l_Emp_Type" value='ALL' maxlen = "100" styles='width:100%;' onchange="">
						<data>
							<%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0017' order by code_nm")%>|ALL|Select All
						</data>
					</gw:list>
				</td>
				
				<td colspan=2 width="2%" style="border:0"  >
				
				</td>
				<td colspan=8 width="8%" style="border:0"  align="left" >
					Status
				</td>
				<td colspan=15 width="15%" style="border:0" align="left"> 
					<gw:list  id="lstStatus" value='ALL' maxlen = "100" styles='width:80%;' onchange="">
						<data>
							|A|Active|R|Resign|ALL|Select All
						</data>
					</gw:list>
				</td>
			</tr>
			<tr style="border:0;width:100%;height:5%" valign="center" >
				<td colspan=2 width="2%" style="border:0"  >
				
				</td>
				<td colspan=8 width="8%" style="border:0"  align="left" >
					<a class="eco_link"  title="Click here to show Organization" onclick="OnShowPopup()" href="#tips" style="text-decoration: none; color=#0000ff">Organization</a>
				</td>
				<td colspan=15 width="15%" style="border:0"  align="left" >
					<gw:list  id="lstDept_Code_1" value='ALL' maxlen = "100" styles='width:100%' onchange="onChoose_opt(document.Salary,1);onChange_org(1,1,lstDept_Code_1)" >
						<data>
							<%= CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
						</data>
					</gw:list>	
				</td>
				<td colspan=2 width="2%" style="border:0"  >
				
				</td>
				<td colspan=8 width="8%" style="border:0"  align="left" >
					Group
				</td>
				<td colspan=15 style="border:0" width="15%"  align="left" >
					<gw:list  id="lstGrp_Code_1" value='ALL' maxlen = "100" styles='width:100%' onchange="onChoose_opt(document.Salary,1)">
						<data>
							<%=CtlLib.SetListDataSQL("SELECT pk,workgroup_nm FROM thr_work_group WHERE DEL_IF = 0   order by workgroup_id" )%>|ALL|Select All
						</data>
					</gw:list>
				</td>
				<td colspan=2 width="2%" style="border:0"  >
				
				</td>
				<td colspan=8 width="8%" style="border:0"  align="left" >
					Pay Type
				</td>
				<td colspan=15 width="15%" style="border:0"> 
					<gw:list  id="lstPay_Type_1" value='ALL' maxlen = "100" styles='width:100%' onchange="onChoose_opt(document.Salary,1)">
						<data>
							<%=CtlLib.SetListDataSQL("select a.code,a.code_nm from vhr_hr_code a where a.id='HR0023' ORDER BY A.seq")%>|ALL|Select All
						</data>
					</gw:list>
				</td>
				<td colspan=2 width="2%" style="border:0"  >
				
				</td>
				<td colspan=8 width="8%" style="border:0"  align="left" >
					Money Type
				</td>
				<td colspan=15 width="15%" style="border:0" align="left"> 
					<gw:list  id="lstMoney_Type_1" value='01' maxlen = "100" styles='width:80%' onchange="onChoose_opt(document.Salary,1)">
						<data><%=CtlLib.SetListDataSQL("select a.code,a.code_nm from vhr_hr_code a where a.id='HR0040' ORDER BY A.seq")%>|ALL|Select All</data>
					</gw:list>
				</td>
			</tr>
			<tr style="border:0;width:100%;height:4%" valign="center" >
				<td colspan=2 width="2%" style="border:0"  >
				
				</td>
				<td colspan=8 width="8%" style="border:0"  align="left" >
					Amount
				</td>
				<td colspan=15 width="15%" style="border:0"  align="left" >
					<gw:list  id="lstType_1" value='>0' maxlen = "100" styles='width:100%' onchange="onChoose_opt(document.Salary,1)">
						<data>|>0|>0|=0|=0|<0|<0|>=0|>=0|ALL|ALL</data>
					</gw:list>
				</td>
				<td colspan=2 width="2%" style="border:0"  >
				
				</td>
				<td colspan=8 width="8%" style="border:0"  align="left" >
					Nation
				</td>
				<td colspan=15 style="border:0" width="15%"  align="left" >
					<gw:list  id="lstNation" value='ALL' maxlen = "100" styles='width:100%;' onchange="">
						<data>
							<%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm")%>|ALL|Select All
						</data>
					</gw:list>
				</td>
				<td colspan=2 width="2%" style="border:0"  >
				
				</td>
				<td colspan=8 width="8%" style="border:0"  align="left" >
					Employee
				</td>
				<td colspan=15 width="15%" style="border:0"> 
					<gw:textbox id="txtEmp_ID_1" onenterkey   ="onChoose_opt(document.Salary,1);OnReport(Salary.optMonthReport)" styles='width:100%'/>
				</td>
				<td colspan=2 width="2%" style="border:0"  >
				
				</td>
				<td colspan=8 width="8%" style="border:0"  align="left" >
				
				</td>
				<td colspan=15 width="15%" style="border:0" align="left"> 
					
				</td>
			</tr>
        </table>
      </td>
      
    </tr>
    <tr height="80%">
	    <td  style="width:100%;height:100%">
		    <table style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0">
			    
               
            </table>
	    </td>
	</tr>	
 </table>
 </form>
<form name="Bonus Reports" id="Bonus" > 
<table   cellpadding="0" cellspacing="0" style="width:100%;height:80%"   valign="middle" border="0" >
	<tr height="15%" >
      <td style="width:100%">
        <table cellpadding="0" style="line-height:normal; padding:0" cellspacing="0" style="width:100%;height:100%" width="100%"  border="0" >
            <tr>
                <td width="95%" colspan="8"  align="center" valign="middle" style="font-family:Times New Roman" class="topleft"><font size="5" color="cc0066">BONUS YEAR</font></td>
                <td width="5%" align="left" valign="middle" class="topright"><gw:imgBtn id="ibtnReport_B" alt="Excel Report" img="excel" text="Print" onclick="OnReport(Bonus.optMonthReport)" /></td>
            </tr>
            <tr>
                <td width="25%"  align="right" valign="middle" class="bottomleft">Year</td>
                <td width="13%"  align="left" valign="middle"  class="bottom"><gw:datebox id="dtYear"  text="" maxlen = "10" type="year" lang="<%=Session("Lang")%>" /> </td>
                <td width="7%"  align="right" valign="middle"  class="bottom">Time</td>
                <td width="10%"  align="left" valign="middle"  class="bottom"><gw:list  id="lstTimes"  maxlen = "100" styles='width:100%' >
                                        <data><%=CtlLib.SetListDataSQL("SELECT code,code_nm FROM vhr_hr_code WHERE id='HR0057'  order by code")%></data></gw:list></td>
                <td width="7%"  align="right" valign="middle"  class="bottom">&nbsp;</td>
                <td width="10%"  align="right" valign="middle"  class="bottom">&nbsp;</td>
                <td width="3%"  align="center" valign="middle"  class="bottom">&nbsp;</td>
                <td width="20%"  align="left" valign="middle"  class="bottom">&nbsp;</td>
                <td  align="left" valign="middle"  class="bottomright">&nbsp;</td>
            </tr>
        </table>
      </td>
      
    </tr>
    <tr height="80%">
	    <td  style="width:100%;height:100%">
		    <table style="width:100%;height:100%" border="0" cellpadding="0" cellspacing="0">
			    <tr style="width:100%;height:7%"  > 
                    <td width="18%" colspan=2 align="center" class="topleft" style="border-right:0;color:Navy">Report Name</td>
                    <td width="20%" align="center" class="top" style="border-left:0;border-right:0;color:Navy"><a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup()" href="#tips" style="text-decoration: none; color=#0000ff">Organization</a></td>
			        <td width="20%" align="center" class="top" style="border-left:0;border-right:0;color:Navy">Group</td>
			        <td width="14%" align="center" class="top" style="border-left:0;border-right:0;color:Navy">Pay Type</td>
			        <td width="14%" align="center" class="top" style="border-left:0;border-right:0;color:Navy">Money Type</td>
			        <td width="14%" align="center" class="topright" style="border-left:0;color:Navy">Emp ID</td>
                </tr>
                <tr height="7%" style="width:100%;"  valign="top"> 
                    <td class="left"  width="2%" valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" checked></td>
                    <td valign="middle" style="font-size:12" width="23%" style="border-left:0;border-right:0">Bonus Payment</td>
                    
                    <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstDept_Code_BN_1" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,1);onChange_org(2,1,lstDept_Code_BN_1)" >
                                        <data>
                                        <%= CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
			        <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstGrp_Code_BN_1" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,1)">
                                        <data><%=CtlLib.SetListDataSQL("SELECT pk,workgroup_nm FROM thr_work_group WHERE DEL_IF = 0   order by workgroup_id" )%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
			        <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstPay_Type_BN_1" value='ALL' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Bonus,1)">
                                        <data><%=CtlLib.SetListDataSQL("select a.code,a.code_nm from vhr_hr_code a where a.id='HR0023' ORDER BY A.seq")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
                    <td align="center" valign="middle" style="border-left:0;border-right:0">
                        <gw:list  id="lstMoney_Type_BN_1" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,1)" >
                            <data>
                            <%=CtlLib.SetListDataSQL("select code, code_nm from vhr_hr_code v where v.id='HR0040'")%>|ALL|Select All
                            </data>
                        </gw:list>
                    </td>
			        <td align="center" valign="middle" class="right"  style="border-left:0"><gw:textbox id="txtEmp_ID_BN_1" onenterkey   ="onChoose_opt(document.Bonus,1);OnReport(Bonus.optMonthReport)" styles='width:100%'/></td>
                </tr>
                <tr height="7%" style="width:100%;"  valign="top"> 
                    <td class="left"   valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                    <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Bonus slip</td>
                    
                    <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstDept_Code_BN_2" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,2);onChange_org(2,2,lstDept_Code_BN_2)" >
                                        <data>
                                        <%= CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
			        <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstGrp_Code_BN_2" value='ALL' maxlen = "100" styles='width:60%'  onchange="onChoose_opt(document.Bonus,2)">
                                        <data><%=CtlLib.SetListDataSQL("SELECT pk,workgroup_nm FROM thr_work_group WHERE DEL_IF = 0   order by workgroup_id" )%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
			        <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstPay_Type_BN_2" value='ALL' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Bonus,2)">
                                        <data><%=CtlLib.SetListDataSQL("select a.code,a.code_nm from vhr_hr_code a where a.id='HR0023' ORDER BY A.seq")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
                    <td align="center" valign="middle" style="border-left:0;border-right:0">
                        <gw:list  id="lstMoney_Type_BN_2" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,2)" >
                            <data>
                            <%=CtlLib.SetListDataSQL("select code, code_nm from vhr_hr_code v where v.id='HR0040'")%>|ALL|Select All
                            </data>
                        </gw:list>
                    </td>                                        
			        <td align="center" valign="middle" class="right"  style="border-left:0"><gw:textbox id="txtEmp_ID_BN_2" onenterkey   ="onChoose_opt(document.Bonus,2);OnReport(Bonus.optMonthReport)" styles='width:100%' /></td>
                </tr>
                <tr height="7%" style="width:100%;"  valign="top"> 
                    <td class="left"   valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                    <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Bonus Group Summary</td>
                    
                    <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstDept_Code_BN_3" value='ALL' maxlen = "100" styles='width:60%'onchange="onChoose_opt(document.Bonus,3);onChange_org(2,3,lstDept_Code_BN_3)" >
                                        <data>
                                        <%= CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
			        <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstGrp_Code_BN_3" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,3)">
                                        <data><%=CtlLib.SetListDataSQL("SELECT pk,workgroup_nm FROM thr_work_group WHERE DEL_IF = 0   order by workgroup_id" )%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
			        <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstPay_Type_BN_3" value='ALL' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Bonus,3)">
                                        <data><%=CtlLib.SetListDataSQL("select a.code,a.code_nm from vhr_hr_code a where a.id='HR0023' ORDER BY A.seq")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
                    <td align="center" valign="middle" style="border-left:0;border-right:0">
                        <gw:list  id="lstMoney_Type_BN_3" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,3)" >
                            <data>
                            <%=CtlLib.SetListDataSQL("select code, code_nm from vhr_hr_code v where v.id='HR0040'")%>|ALL|Select All
                            </data>
                        </gw:list>
                    </td>                    
			        <td align="center" valign="middle" class="right"  style="border-left:0"><gw:textbox id="txtEmp_ID_BN_3" onenterkey   ="onChoose_opt(document.Bonus,3);OnReport(Bonus.optMonthReport)" styles='width:100%'/></td>
                </tr>
                <tr height="7%" style="width:100%;"  valign="top"> 
                    <td class="left"  valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                    <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Bonus Payment by Bank</td>
                    
                    <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstDept_Code_BN_4" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,4);onChange_org(2,4,lstDept_Code_BN_4)" >
                                        <data>
                                        <%= CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
			        <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstGrp_Code_BN_4" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,4)">
                                        <data><%=CtlLib.SetListDataSQL("SELECT pk,workgroup_nm FROM thr_work_group WHERE DEL_IF = 0   order by workgroup_id" )%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
			        <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstPay_Type_BN_4" value='ALL' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Bonus,4)">
                                        <data><%=CtlLib.SetListDataSQL("select a.NUM_1,MAX(a.code_Knm) from vhr_hr_code a where a.id='HR0020' group by a.num_1")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
                    <td align="center" valign="middle" style="border-left:0;border-right:0">
                        <gw:list  id="lstMoney_Type_BN_4"  maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,4)" >
                            <data>
                            <%=CtlLib.SetListDataSQL("select code, code_nm from vhr_hr_code v where v.id='HR0040'")%>
                            </data>
                        </gw:list>
                    </td>                    
			        <td align="center" valign="middle" class="right"  style="border-left:0"><gw:textbox id="txtEmp_ID_BN_4" onenterkey   ="onChoose_opt(document.Bonus,4);OnReport(Bonus.optMonthReport)" styles='width:100%'/></td>
                </tr>
                <tr height="7%" style="width:100%;"  valign="top"> 
                    <td class="left"   valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                    <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Bonus Payment by Cash</td>
                    
                    <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstDept_Code_BN_5" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,5);onChange_org(2,5,lstDept_Code_BN_5)" >
                                        <data>
                                        <%= CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
			        <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstGrp_Code_BN_5" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,5)">
                                        <data><%=CtlLib.SetListDataSQL("SELECT pk,workgroup_nm FROM thr_work_group WHERE DEL_IF = 0   order by workgroup_id" )%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
			        <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstPay_Type_BN_5" value='ALL' maxlen = "100" styles='width:70%; display:none' onchange="onChoose_opt(document.Bonus,5)">
                                        <data><%=CtlLib.SetListDataSQL("select a.code,a.code_nm from vhr_hr_code a where a.id='HR0023' ORDER BY A.seq")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
                    <td align="center" valign="middle" style="border-left:0;border-right:0">
                        <gw:list  id="lstMoney_Type_BN_5" maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,5)" >
                            <data>
                            <%=CtlLib.SetListDataSQL("select code, code_nm from vhr_hr_code v where v.id='HR0040'")%>
                            </data>
                        </gw:list>
                    </td>                    
			        <td align="center" valign="middle" class="right"  style="border-left:0"><gw:textbox id="txtEmp_ID_BN_5" onenterkey   ="onChoose_opt(document.Bonus,5);OnReport(Bonus.optMonthReport)" styles='width:100%'/></td>
                </tr>
                <tr height="7%" style="width:100%;"  valign="top"> 
                    <td class="left"   valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                    <td valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Money's Classification</td>
                    
                    <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstDept_Code_BN_6" value='ALL' maxlen = "100" styles='width:60%'onchange="onChoose_opt(document.Bonus,6);onChange_org(2,6,lstDept_Code_BN_6)" >
                                        <data>
                                        <%= CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
			        <td align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstGrp_Code_BN_6" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,6);">
                                        <data><%=CtlLib.SetListDataSQL("SELECT pk,workgroup_nm FROM thr_work_group WHERE DEL_IF = 0   order by workgroup_id" )%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
			        <td  align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstPay_Type_BN_6" value='ALL' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Bonus,6);">
                                        <data><%=CtlLib.SetListDataSQL("select a.code,a.code_nm from vhr_hr_code a where a.id='HR0023' ORDER BY A.seq")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
                    <td align="center" valign="middle" style="border-left:0;border-right:0">
                        <gw:list  id="lstMoney_Type_BN_6" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,6)" >
                            <data>
                            <%=CtlLib.SetListDataSQL("select code, code_nm from vhr_hr_code v where v.id='HR0040'")%>|ALL|Select All
                            </data>
                        </gw:list>
                    </td>                    
			        <td class="right" align="center" valign="middle" class="right"  style="border-left:0"><gw:textbox id="txtEmp_ID_BN_6" onenterkey   ="onChoose_opt(document.Bonus,6);OnReport(Bonus.optMonthReport)" styles='width:100%'/></td>
                </tr>
                <tr height="7%" style="width:100%;"  valign="top"> 
                    <td class="bottomleft"   valign="middle" style="border-right:0"><input type="radio" name="optMonthReport" value="1" ></td>
                    <td class="bottom" valign="middle" style="font-size:12"  style="border-left:0;border-right:0">Money's Classification by Group</td>
                    
                    <td class="bottom" align="center" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstDept_Code_BN_7" value='ALL' maxlen = "100" styles='width:60%'onchange="onChoose_opt(document.Bonus,7);onChange_org(2,7,lstDept_Code_BN_7)" >
                                        <data>
                                        <%= CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + Session("COMPANY_PK") + "',a.tco_company_pk) or '" + Session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
			        <td  align="center" class="bottom" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstGrp_Code_BN_7" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,7)">
                                        <data><%=CtlLib.SetListDataSQL("SELECT pk,workgroup_nm FROM thr_work_group WHERE DEL_IF = 0   order by workgroup_id" )%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
			        <td align="center" class="bottom" valign="middle" style="border-left:0;border-right:0"><gw:list  id="lstPay_Type_BN_7" value='ALL' maxlen = "100" styles='width:70%' onchange="onChoose_opt(document.Bonus,7)">
                                        <data><%=CtlLib.SetListDataSQL("select a.code,a.code_nm from vhr_hr_code a where a.id='HR0023' ORDER BY A.seq")%>|ALL|Select All
                                        </data>
                                        </gw:list></td>
                    <td align="center"  class="bottom" valign="middle" style="border-left:0;border-right:0">
                        <gw:list  id="lstMoney_Type_BN_7" value='ALL' maxlen = "100" styles='width:60%' onchange="onChoose_opt(document.Bonus,7)" >
                            <data>
                            <%=CtlLib.SetListDataSQL("select code, code_nm from vhr_hr_code v where v.id='HR0040'")%>|ALL|Select All
                            </data>
                        </gw:list>
                    </td>                    
			        <td   class="bottomright" align="center" valign="middle" style="border-left:0"><gw:textbox id="txtEmp_ID_BN_7" onenterkey   ="onChoose_opt(document.Bonus,7);OnReport(Bonus.optMonthReport)" styles='width:100%'/></td>
                </tr>
                
            </table>
	    </td>
	</tr>	
 </table>
</form>
<form name="PIT Reports" id="PIT" > 
<table   cellpadding="0" cellspacing="0" style="width:60%;height:80%"   align="center" border="0" >
	<tr height="15%" >
      <td style="width:100%">
        <table cellpadding="0" style="line-height:normal; padding:0" cellspacing="0" style="width:100%;height:100%"  border="0" >
            <tr>
                <td width="90%" colspan="6"  align="center" valign="middle" class="topleft" style="font-family:Times New Roman"><font size="5" color="cc0066">PERSONAL INCOME TAX</font></td>
                <td width="10%" align="left" valign="middle" class="topright"><gw:imgBtn id="ibtnReport_P" alt="Excel Report" img="excel" text="Print" onclick="OnReport(PIT.optYearReport)" /></td>
            </tr>
            <tr>
                <td width="10%"  align="right" valign="middle" class="bottomleft">Year</td>
                <td width="20%"  align="left" valign="middle"  class="bottom"><gw:datebox id="dtYear_P"  text="" maxlen = "10" type="year" lang="<%=Session("Lang")%>" onchange="ChangeYear()"/> </td>
                <td width="10%"  align="right" valign="middle" class="bottom">Month</td>
                <td width="20%"  align="left" valign="middle"  class="bottom"><gw:datebox id="dtMonth_P_From"  text="" maxlen = "10" type="month" lang="<%=Session("Lang")%>" /> </td>
                <td width="10%"  align="center" valign="middle" class="bottom"><b>~</b></td>
                <td width="20%"  align="left" valign="middle"  class="bottom"><gw:datebox id="dtMonth_P_To"  text="" maxlen = "10" type="month" lang="<%=Session("Lang")%>" /> </td>
                
                <td width="10%"  align="left" valign="middle"  class="bottomright">&nbsp;</td>
            </tr>
        </table>
      </td>
      
    </tr>
    <tr height="80%">
	    <td  style="width:100%;height:100%">
		    <table style="width:100%;height:40%" border="0" cellpadding="0" cellspacing="0">
			    <tr style="width:100%;height:5%"  > 
                    <td width="18%" colspan=2 align="center" class="topleft" style="border-right:0">&nbsp;</td>
			        <td width="50%" align="center" class="top" style="border-left:0;border-right:0;color:Navy">Report Name</td>
			        <td width="14%" align="center" class="top" style="border-left:0;border-right:0">&nbsp;</td>
			        <td width="8%" align="center" class="topright" style="border-left:0">&nbsp;</td>
                </tr>
                <tr height="5%" style="width:100%;"  valign="top"> 
                    <td class="left"  width="2%" valign="middle" style="border-right:0">&nbsp;</td>
			        <td align="right" width="16%" valign="middle" style="border-left:0;border-right:0"><input type="radio" name="optYearReport" value="1" checked></td>
                    <td valign="middle" colspan=2 style="font-size:12"  style="border-left:0;border-right:0">Tờ khai quyết toán thuế thu nhập cá nhân (05/KK)</td>
			        <td align="center" valign="middle" class="right"  style="border-left:0">&nbsp;</td>
                </tr>
                <tr height="5%" style="width:100%;"  valign="top"> 
                    <td class="left"   valign="middle" style="border-right:0">&nbsp;</td>
                    
			        <td align="right" valign="middle" style="border-left:0;border-right:0"><input type="radio" name="optYearReport" value="2" ></td>
                    <td valign="middle" colspan=2 style="font-size:12"  style="border-left:0;border-right:0">Bảng kê thu nhập chịu thuế và thuế TNCN - HĐLĐ (05A/BK)</td>
			        <td align="center" valign="middle" class="right"  style="border-left:0">&nbsp;</td>
                </tr>
                <tr height="5%" style="width:100%;"  valign="top"> 
                    <td class="left"   valign="middle" style="border-right:0">&nbsp;</td>
			        <td align="right" valign="middle"   style="border-left:0;border-right:0"><input type="radio" name="optYearReport" value="3" ></td>
                    <td valign="middle" colspan=2  style="font-size:12"  style="border-left:0;border-right:0">Bảng kê thu nhập chịu thuế và thuế TNCN - Không HĐLĐ (05B/BK)</td>
			        <td align="center" valign="middle" class="right"  style="border-left:0">&nbsp;</td>
                </tr>
                <tr height="5%" style="width:100%;"  valign="top"> 
                    <td class="bottomleft"   valign="middle" style="border-right:0">&nbsp;</td>
			        <td align="right" valign="middle" class="bottom"  style="border-left:0;border-right:0"><input type="radio" name="optYearReport" value="4" ></td>
                    <td valign="middle" colspan=2 class="bottomleft" style="font-size:12"  style="border-left:0;border-right:0">Bảng kê thu nhập chịu thuế - Bảo hiểm</td>
			        <td align="center" valign="middle" class="bottomright"  style="border-left:0">&nbsp;</td>
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


<gw:textbox id="txtorg_tmp" styles="display:none"/>
<gw:textbox id="txtwg_tmp" styles="display:none"/>    
<gw:textbox id="txtResult" styles="display:none"/>  
</body>
</html>

