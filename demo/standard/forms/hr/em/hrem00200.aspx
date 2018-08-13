<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>
var byhand;
var cIdx,rIdx;
var dt_tmp;
var strcodereturn;
var user;
var rowclick;
var value_old;
var datenow;
var flag_wg=1;
var tab2=false;
var txt_data="";
var check_init=0;

var v_language = "<%=Session("SESSION_LANG")%>";
var rpt_no=0;

//tab 1
//_PK|Organization|Work Group|Emp ID|Old Code|Full Name|ID Num|Join Date|Birth Date|Place Birth|Telephone|
//Permanent Address|Present Address|Sex|Person ID|Issue Date|Place Per ID|Married|Nation|Ethenic|Religion|
//Education|Job|Position|Probation Type|Begin Probation|End  Probation|Contract Kind|Contract NO|
//Begin Contract|End Contract|Social Flag|Social No|Social Place|Social Date|Health Flag|Health No|Health Place|
//Health Date|Unemp Flag|Unemp Date|Employee Type|OT YN|Salary YN|Probation Salary|Basic Salary|
//Allow Amt1|Allow Amt2|Allow Amt3|Allow Amt4|Allow Amt5|Allow Amt6|Allow Amt7|Allow Amt8|
//Pay Type|Bank Type|Bank Branch|Account|Status|Left Date|Resign Type|Cost Group|Group Kind|Cost Center|
//Pass Port No|Pass Port Date|Remark|Union YN|Union Date|Pit No|_ByHand_YN|_PK_CostKind|_House YN|Meal YN|_PK_ORG|
//Salary Period|_Register Ins|N Country 2

var p_no = 0;
var p_PK = 1;
var p_Organization = 2;
var p_EmpID=3;
var p_OldID = 4;
var p_FullName= 5;
var p_IDNum=6;
var p_JoinDate=7 ;
var p_BirthDate=8;
var p_PlaceBirth= 9;
var p_Telephone= 10;
var p_PermanentAddress=11;
var p_PresentAddress=12;
var p_Sex=13;
var p_PersonID=14;
var p_IssueDate= 15;
var p_PlacePerID=16;
var p_Married= 17;
var p_Nation= 18;
var p_Ethenic= 19;
var p_Religion= 20;
var p_Education=21;
var p_Job=22;
var p_Position= 23;
var p_ProbationType= 24;
var p_BeginProbation= 25;
var p_EndProbation= 26;
var p_ContractKind= 27;
var p_ContractNO= 28;
var p_BeginContract= 29;
var p_EndContract= 30;
var p_SocialFlag= 31;
var p_SocialNo= 32;
var p_SocialPlace= 33;
var p_SocialDate= 34;
var p_HealthFlag= 35;
var p_HealthNo= 36;
var p_HealthPlace=37;
var p_HealthDate= 38;
var p_UnempFlag= 39;
var p_UnempDate= 40;
var p_EmployeeType= 41;
var p_OTYN =42;
var p_SalaryYN= 43;
var p_ProbationSalary= 44;
var p_BasicSalary= 45;
var p_AllowAmt1= 46;
var p_AllowAmt2 =47;
var p_AllowAmt3= 48;
var p_AllowAmt4= 49;
var p_AllowAmt5= 50;
var p_AllowAmt6 =51;
var p_AllowAmt7= 52;
var p_AllowAmt8= 53;
var p_PayType= 54;
var p_BankType= 55;
var p_bank_branch=56;
var p_Account= 57;
var p_Status= 58;
var p_LeftDate= 59;
var p_ResignType= 60;
var p_CostGroup =61
var p_GroupKind= 62
var p_CostKind= 63;
var p_PassPortNo= 64;
var p_PassPortDate= 65;
var p_Remark= 66;
var p_Union= 67;
var p_union_dt=68;
var p_PitNo= 69;
var p_ByHand_YN=70;
var p_pk_CostKind=71;
var p_house_yn=72;
var p_meal_yn=73;
var p_pk_Org=74;
var p_sal_peirod=75;
var p_contract_yn=77;

//"_PK|Department|Group|Emp ID|Full Name|Join Date|Social Flag|Social No Old|Social No|Social Date|Social Place|Health Flag|Health No
//|Health Date|Health Place|Unemp Flag|Unemp Date|Social Book "   
var g2_no = 0;
	g2_pk = 1;
    g2_org= 2; 
    g2_emp_id = 3;
    g2_fullname = 4;
    g2_join_dt = 5;
    g2_social_flag = 6;
    g2_social_no_old =  7;
    g2_social_no = 8;
    g2_social_dt = 9;
    g2_social_place = 10;
    g2_health_flag = 11;
    g2_health_no = 12;
    g2_health_dt = 13;
    g2_health_place = 14;
    g2_unemp_flag = 15;
    g2_unemp_dt = 16;
    g2_social_book = 17;
    g2_ins_Salary = 18;
    g2_submit_dt = 19;
    g2_return_dt = 20;
    g2_month_ins = 21;
    g2_remark = 22;
    g2_description = 23;

function BodyInit()
{
	System.Translate_V2(document, System.Menu.GetMenuPS());
	grdEmployee.GetGridControl().FrozenCols =6;
	grdEmployee2.GetGridControl().FrozenCols =4;
    grdEmployee.GetGridControl().ScrollTrack=true;
	grdEmployee2.GetGridControl().ScrollTrack=true;
    
    ibtnSave.SetEnable(false);
    iduser_pk.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
    user="<%=session("USER_ID")%>";
	laguage.text = "<%= Session("SESSION_LANG") %>";
    menu_id.text=System.Menu.GetMenuID();
    BindingDataList();
    ChangeColorItem(lstOrg_Code.GetControl());
    ChangeColorItem(lstOrg_Code2.GetControl());
	
	OnHideControl();
        
    datCheck_View.Call();
    

    //Lay ngay hien tai cho grid
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth()+1;
        if(month<10) month='0'+month;
    var date = now.getDate();
        if(date<10) date='0' + date;
    datenow = ''+year+month+date;
}
function OnHideControl()
{
	lstPay_Type.SetDataText("|ALL|SELECT ALL");
	lstPay_Type.value = "ALL";
	lstContract_Kind.SetDataText("|ALL|SELECT ALL");
	lstContract_Kind.value = "ALL";
	lstSex.SetDataText("|ALL|SELECT ALL");
	lstSex.value = "ALL";
	lstInsuranceYN.SetDataText("|ALL|SELECT ALL");
	lstInsuranceYN.value = "ALL";
	lstOTYN.SetDataText("|ALL|SELECT ALL");
	lstOTYN.value = "ALL";
	lstUnion.SetDataText("|ALL|SELECT ALL");
	lstUnion.value = "ALL";
	
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

//-------------------------------
function OnShowPopup(m)
{     
        var strcom;
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx?";
        //var obj  = System.OpenModal(  fpath , 300 , 200 , 'resizable:yes;status:yes');
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {  if(m==2)
			{lstOrg_Code2.value = obj;
            //txtUpperOrg.text=obj;
            //datOrgData2.Call();
			}
			else
			{
			lstOrg_Code.value = obj;
            //txtUpperOrg.text=obj;
            //datOrgData.Call();
			}
			
            
        }
}
function BindingDataList()
{   
    
      var t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0021' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_PlaceBirth,t1);
    
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0013' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_SocialPlace,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0012' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_HealthPlace,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0007' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_Sex,t1);
        t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0014' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_PlacePerID,t1);

       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_Nation,t1);
       
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0015' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_Ethenic,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0016' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_Religion,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0011' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_Education,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0010' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_Job,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_Position,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0017' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_EmployeeType,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0023' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_PayType,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0020' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_BankType,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0092' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_CostGroup,t1);
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0093' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_GroupKind,t1);
	   t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0116' order by code_nm")%>";
       grdEmployee.SetComboFormat(p_bank_branch,t1);
       
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select pk,org_nm from tco_org where del_if=0 order by org_nm")%>";
       grdEmployee.SetComboFormat(p_pk_Org,t1);
	   
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select v.code,v.CODE_NM||' '|| v.CHAR_1||'->'||v.CHAR_2 from vhr_hr_code v where v.id='HR0030' and v.num_1=1  order by 1")%>";
       grdEmployee.SetComboFormat(p_sal_peirod ,t1);
       
      // tmp="#Y;Yes|#N;No";
      // grdEmployee.SetComboFormat(p_contract_yn,tmp);// contract_yn
	   
       t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0175' order by code_nm")%>";
       grdEmployee2.SetComboFormat(g2_social_book ,t1);
	   
	   tmp="#Y;Yes|#N;No";
    grdEmployee2.SetComboFormat(g2_social_flag,tmp);//social yn
    tmp="<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0013' order by code_nm") %>";
    grdEmployee2.SetComboFormat(g2_social_place,tmp);// social place
    tmp="#Y;Yes|#N;No";
    grdEmployee2.SetComboFormat(g2_health_flag,tmp);//health yn
   tmp="<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0012' order by code_nm") %>";
    grdEmployee2.SetComboFormat(g2_health_place,tmp);// health place
    tmp="#Y;Yes|#N;No";
    grdEmployee2.SetComboFormat(g2_unemp_flag,tmp);//unEMp yn


	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HREM00200', 1, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>"; 
	lstReport.SetDataText(data);
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_HRCODE_REPORT2('HR0156','HREM00200', 2, '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>"; 
	lstReport1.SetDataText(data);

	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg_Code.SetDataText(data);
	lstOrg_Code.value ="ALL";
	lstOrg_Code2.SetDataText(data);
	lstOrg_Code2.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstGrp_Code.SetDataText(data);
	lstGrp_Code.value ="ALL";
	lstGrp_Code2.SetDataText(data);
	lstGrp_Code2.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0008', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstPosition.SetDataText(data);
	lstPosition.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstStatus.SetDataText(data);
	lstStatus.value ="A";
	lstStatus2.SetDataText(data);
	lstStatus2.value ="A";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0009', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstNation.SetDataText(data);
	lstNation.value ="01";
	lstNation2.SetDataText(data);
	lstNation2.value ="01";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('YN', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstSalaryYN.SetDataText(data);
	lstSalaryYN.value ="ALL";
	lstStatus_YN.SetDataText(data);
	lstStatus_YN.value ="ALL";
	
	data = (v_language =="ENG")?"|1|Birth Date|2|Join Date|3|Left Date":"|1|Ngày sinh|2|Ngày vào|3|Ngày nghỉ việc";
	lstSelectDate.SetDataText(data);
}

function ChoseList_box(obj_list,value)
{
    
    obj_list.SetDataText(value);
    obj=obj_list.GetControl()
	if (obj.options.length ==2)
		obj.options.selectedIndex=0;
	else
		obj.options.selectedIndex=obj.options.length-1;
}
//----------------------------------------------
function OnDataReceive(obj)
{
   if(obj.id == "datCheck_View")
   {
        if(txtFlag_View.text == 'Y')
        {
            ibtnSave.style.display = "none";
            ibtnSave2.style.display = "none";
        }
        datAllowance.Call();
   }
   else if (obj.id=="datDeptData")
   {
        if(txtHr_level.text=="6")
                txtDeptData.text=txtDeptData.text+"|ALL|Select All";
            lstOrg_Code.SetDataText(txtDeptData.text)    ;
            
              obj=lstOrg_Code.GetControl()
		    if (obj.options.length ==2)
			    obj.options.selectedIndex=0;
		    else
			    obj.options.selectedIndex=0;
   
   }
  
   else if (obj.id=="datAllowance")
   {
        var icol=p_AllowAmt1; //value of allowance col
        grdEmployee.SetGridText(0,icol,grdAllowance.GetGridData(1,0));
        grdEmployee.SetGridText(0,icol+1,grdAllowance.GetGridData(1,1));
        grdEmployee.SetGridText(0,icol+2,grdAllowance.GetGridData(1,2));
        grdEmployee.SetGridText(0,icol+3,grdAllowance.GetGridData(1,3));
        grdEmployee.SetGridText(0,icol+4,grdAllowance.GetGridData(1,4));
        grdEmployee.SetGridText(0,icol+5,grdAllowance.GetGridData(1,5));
        grdEmployee.SetGridText(0,icol+6,grdAllowance.GetGridData(1,6));
        grdEmployee.SetGridText(0,icol+7,grdAllowance.GetGridData(1,7));
        grdEmployee.GetGridControl().ColHidden(icol)=!(Number(grdAllowance.GetGridData(1,8)));
        grdEmployee.GetGridControl().ColHidden(icol+1)=!(Number(grdAllowance.GetGridData(1,9)));
        grdEmployee.GetGridControl().ColHidden(icol+2)=!(Number(grdAllowance.GetGridData(1,10)));
        grdEmployee.GetGridControl().ColHidden(icol+3)=!(Number(grdAllowance.GetGridData(1,11)));
        grdEmployee.GetGridControl().ColHidden(icol+4)=!(Number(grdAllowance.GetGridData(1,12)));
        grdEmployee.GetGridControl().ColHidden(icol+5)=!(Number(grdAllowance.GetGridData(1,13)));
        grdEmployee.GetGridControl().ColHidden(icol+6)=!(Number(grdAllowance.GetGridData(1,14)));
        grdEmployee.GetGridControl().ColHidden(icol+7)=!(Number(grdAllowance.GetGridData(1,15)));
        datSal_security.Call();
    
   }
   else if (obj.id=="datSal_security")
   {
       if(txt_sal_security.text=='N') 
       {
            var icol=p_ProbationSalary; //value of probation salary
            for (var i=0;i<=9;i++)
                grdEmployee.GetGridControl().ColHidden(icol+i)=1;
       }
       if((Trim(iduser_pk.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	    {
            datUser_info.Call();     	    
	    }
		else
			check_init=1;
   }
   else if (obj.id=="datUser_info")
   {
       
            lstOrg_Code.SetDataText(txtdept_temp.text);            
            lstOrg_Code2.SetDataText(txtdept_temp.text);

            ChangeColorItem(lstOrg_Code.GetControl());
            ChangeColorItem(lstOrg_Code2.GetControl());

			onChange_org();
   }
   else if (obj.id=="datGet_period")
   {
		var t=txtlst_period.text;
            var s="";
            t=t.substring(5,t.length);
            var arr=t.split("|");
            var i=0;
            while(i<arr.length)
            {
                s+="#"+arr[i]+";"+arr[i+1]+"|";
                i+=2;
            }
            s=s.substring(0,s.length-1);
            grdEmployee.SetComboFormat(p_sal_peirod,s);
			onGetWorkGroup(1);
   }
	else if(obj.id=="datIns")
   {
    lblRecord2.text=grdEmployee2.rows-1 ;
    auto_resize_column(grdEmployee2,0,grdEmployee2.cols-1,9);    
    /*if(grdEmployee2.rows>1)
        grdEmployee2.SetCellBgColor(1,g2_social_flag,grdEmployee2.rows -1 ,g2_description,0xFFEEFF);
        grdEmployee2.SetCellBgColor(1,g2_social_book,grdEmployee2.rows -1 ,g2_social_book,0xBAEDD3);
   */
   }
   else if (obj.id=="datEmp_Management")
   {
        if (grdEmployee.rows>1)
        {
            ibtnSave.SetEnable(true);
            //SetColRow();
        }
        else
        {
            ibtnSave.SetEnable(false);
            
        }
        lblRecord.text=grdEmployee.rows-1 ;
        auto_resize_column(grdEmployee,0,grdEmployee.cols-1,9);    
   }
   else if (obj.id=="datFind_Report")
   {
        var url=System.RootURL;
        switch (txtReportCode_tmp.text)
        {
            case "03":  // Summary employee list
            {
               
                url=url + txtReport_tmp.text + '?p_tco_org_pk=' + lstOrg_Code.value 
						+ '&p_nation=' + lstNation.value 
						+ '&p_position=' + lstPosition.value 
						+ '&p_select_date=' + lstSelectDate.value 
						+ '&p_from_date=' + dtFrom_Date.value 
						+ '&p_to_date=' + dtTo_Date.value 
						+ '&p_salary_yn=' + lstSalaryYN.value 
						+ '&p_status=' + lstStatus.value  
						+ '&p_emp_search=' + txtEmployee.text  
						+ '&p_data=' + txt_data 
						+ '&p_lang=' + txtlang.text
						+ '&p_sal_security=' + txt_sal_security.text
						+ '&p_user=' + user;
              
                break;
            }
            
            case "04": //Detail EMployee List
            {
                
                url=url + txtReport_tmp.text + '?p_tco_org_pk=' + lstOrg_Code.value 
						+ '&p_nation=' + lstNation.value 
						+ '&p_position=' + lstPosition.value 
						+ '&p_select_date=' + lstSelectDate.value 
						+ '&p_from_date=' + dtFrom_Date.value 
						+ '&p_to_date=' + dtTo_Date.value 
						+ '&p_salary_yn=' + lstSalaryYN.value 
						+ '&p_status=' + lstStatus.value  
						+ '&p_emp_search=' + txtEmployee.text  
						+ '&p_data=' + txt_data 
						+ '&p_lang=' + txtlang.text
						+ '&p_sal_security=' + txt_sal_security.text
						+ '&p_user=' + user;
                break;
            }

            case "05":  //insurance list
            {

               
                break;
            }

            case "404":  //Dynamic
            {

                url=url + txtReport_tmp.text + '?p_tco_org_pk=' + lstOrg_Code.value 
						+ '&p_nation=' + lstNation.value 
						+ '&p_position=' + lstPosition.value 
						+ '&p_select_date=' + lstSelectDate.value 
						+ '&p_from_date=' + dtFrom_Date.value 
						+ '&p_to_date=' + dtTo_Date.value 
						+ '&p_salary_yn=' + lstSalaryYN.value 
						+ '&p_status=' + lstStatus.value  
						+ '&p_emp_search=' + txtEmployee.text  
						+ '&p_data=' + txt_data 
						+ '&p_lang=' + txtlang.text
						+ '&p_sal_security=' + txt_sal_security.text
						+ '&p_user=' + user;

                break;
            }
        }
        
        window.open(url); 
   }
   else if (obj.id=="datCheck_Exist_Empid")
   {
        if(txtResult.text=="1")
        {
            alert("Emp ID has exist. Please try again!\nEmp ID này đã tồn tại. Xin nhập lại!");
            grdEmployee.SetGridText(rIdx,p_EmpID,dt_tmp);
            return;
        }
   }
   else if (obj.id=="datGet_Org")
   {

      grdEmployee.SetGridText(rowclick,p_Organization,txtOrgNM.text);
      if(txtHR0211_YN.text=="Y") //co su dung mapping pl
      {
        grdEmployee.SetGridText(rowclick,p_CostGroup,txtCostGroup.text);
        grdEmployee.SetGridText(rowclick,p_GroupKind,txtCostType.text);
        grdEmployee.SetGridText(rowclick,p_pk_CostKind,txtCostCenter_pk.text);
        grdEmployee.SetGridText(rowclick,p_CostKind,txtCostCenter_nm.text);
      }  
   }
   else if (obj.id=="datWorkGroup_info")
   {
		
		if(flag_wg==1)
        {
			lstGrp_Code.SetDataText(txtwg_tmp.text+ "|ALL|Select All");
            lstGrp_Code.value='ALL';
        }
		else
        {
			lstGrp_Code2.SetDataText(txtwg_tmp.text+ "|ALL|Select All");
            lstGrp_Code2.value='ALL';
        }
		
      //grdEmployee.SetGridText(rowclick,p_Organization,txtOrgNM.text);
	  check_init=1;
   }
   
   
}


function onGetWorkGroup(p)
{
	flag_wg=p;
	if(flag_wg==1)
	{
		txtOrgPK.text=lstOrg_Code.value;
		if(txtOrgPK.text!='ALL')
			datWorkGroup_info.Call();
	}
	else
	{
		txtOrgPK.text=lstOrg_Code2.value;
		if(txtOrgPK.text!='ALL')
			datWorkGroup_info.Call();
	}
		
}

//---------------------------------------------------
function auto_resize_column(obj,col1,col2,font_size)
{
  if(font_size!=0)
        obj.GetGridControl().FontSize =font_size;   
  obj.GetGridControl().AutoSize(col1,col2,false,0);  
}
//------------------------------------------------
function SetColRow()
{
    grdEmployee.SetCellBgColor(1,p_OldID,grdEmployee.rows -1 ,p_OldID,0xF9F9EC);
    grdEmployee.SetCellBgColor(1,p_IDNum,grdEmployee.rows -1 ,p_IDNum,0xF9F9EC);
    grdEmployee.SetCellBgColor(1,p_PlaceBirth,grdEmployee.rows -1 ,p_Position,0xF9F9EC);
    grdEmployee.SetCellBgColor(1,p_SocialFlag,grdEmployee.rows -1 ,p_SocialFlag,0xF9F9EC);
    grdEmployee.SetCellBgColor(1,p_HealthFlag,grdEmployee.rows -1 ,p_SalaryYN,0xF9F9EC);
    grdEmployee.SetCellBgColor(1,p_PayType,grdEmployee.rows -1 ,p_Account,0xF9F9EC);
    grdEmployee.SetCellBgColor(1,p_PassPortNo,grdEmployee.rows -1 ,p_meal_yn,0xF9F9EC);
    grdEmployee.SetCellBgColor(1,p_SocialNo,grdEmployee.rows -1 ,p_HealthDate,0xF9F9EC);
    
 
    
}

//----------------------------------------------------
function OnSearch()
{
        if(check_init==1)
			datEmp_Management.Call("SELECT");
}

//------------------------------------------------------------
function doSelectAll()
{	
	var tmp;
	if( idCheckAll.GetData()=='T')
		tmp=-1;
	else
		tmp=0;
	for (var i=1; i<grdEmployee.rows; i++)
		grdEmployee.SetGridText( i , 0,tmp );
}
//-----------------------------------------------
function OnReport(obj)
{
    var url=System.RootURL;
    rpt_no=obj;
	if(check_init==1)
	{
        if(lstReport.value == "404"){
                var fpath = System.RootURL + "/standard/forms/hr/em/hrem00201.aspx" ;
				var aData=new Array();
				aData  = System.OpenModal(fpath , 470 , 600 , 'resizable:yes;status:yes') ;
				if ( aData != null )
				{  	 
					var len=aData.length;
					var i;
					var data="";
					txt_data = "";
					for (i=0;i<len-1;i++)		
					{
						data = aData[i]; 
						txt_data = txt_data + data[0] + "|" ;
					}
				    
					if (len > 0)
					{
						var lang = aData[len - 1];
						txtlang.text = lang[0];
					}
                    
					//alert(txt_data);
					//alert(txt_field); 
					txtReportCode_tmp.text=lstReport.value;
                    txtOrg_tmp_pk.text=lstOrg_Code.value; 
				}	
				else
					return;
        } else {
		    switch (obj)
		    {
			    case 1:
			    {
				    txtReportCode_tmp.text = lstReport.value;
				    txtOrg_tmp_pk.text=lstOrg_Code.value; 
				    break;
			    }
			    case 2:
			    {
				    txtReportCode_tmp.text = lstReport1.value;
				    txtOrg_tmp_pk.text=lstOrg_Code2.value; 
				    break;
			    }
		    
		    }
        }

        datFind_Report.Call();
	}
}
//-----------------------------------------------
function OnSave()
{

	if(check_init==1)
	{
        if (confirm("Do you want to save?"))
            datEmp_Management.Call();
	}		
}
//-----------------------------------------------
function CheckUpdate()
{

    var rowvalue;
    for (var i=1;i<grdEmployee.rows;i++)
    {
        if (grdEmployee.GetRowStatus(i)==16)
        {

            if (isNaN(rowvalue)  && rowvalue!="")
            {
                alert((v_language =="ENG")?"Please input number in row " + i + " and column Person ID":"Bạn hãy nhập số ở dòng " + i + " và cột Mã NV");
                return false;
            }

        }
    }
    return true;
}
function OnChangeBand()
{
    //datBand_GradeData.Call();
}
function On_click()
{
    dt_tmp = grdEmployee.GetGridData(event.row,event.col);
    byhand = grdEmployee.GetGridData(event.row,p_ByHand_YN);
    rIdx = event.row;
    cIdx = event.col;
}
function On_AfterEdit()
{   
    
    if(cIdx==p_EmpID)
    {
            tmpEmpID.text= grdEmployee.GetGridData(event.row,p_EmpID);
            if(tmpEmpID.text=="")
            {
                alert("Emp ID not blank!\nEmp ID không được bỏ trống!")
                grdEmployee.SetGridText(rIdx,p_EmpID,dt_tmp);
            }
            if(tmpEmpID.text != dt_tmp)
            {
                if(byhand=="N")
                {
                    alert("Emp ID has automatic created, not edit!\nEmp ID này đã được tạo tự động vì thế không thể sửa!")
                    grdEmployee.SetGridText(rIdx,p_EmpID,dt_tmp);
                    return;
                }
                else 
                datCheck_Exist_Empid.Call();
            }       
    }
}

//-----------------------------------------------
//-------------------------------------------------------------
function OnSearchIns()
{ datIns.Call("SELECT");
}
function OnSaveIns()
{ if (confirm("Do you want to save?"))
        datIns.Call();
}


function CheckIns()
{
    if(event.col==g2_social_dt || event.col==g2_health_dt || event.col==g2_unemp_dt)
    {
        tmp=grdEmployee2.GetGridData(event.row,event.col);
        if(Trim(tmp)=="")
            return;
        if(tmp.length!=7||tmp.substring(2,3)!='/'||isNaN(tmp.substring(0,2))||isNaN(tmp.substring(3,7)))
        {
            alert("Incorrect type or month. (mm/yyyy)\nBạn nhập kiểu tháng không đúng.(mm/yyyy)");
            grdEmployee2.SetGridText(event.row,event.col,"");
        }   
      }  
    else if(event.col == g2_social_book)
    {
        var value = grdEmployee2.GetGridData(event.row, event.col);
        var book_no = grdEmployee2.GetGridData(event.row, g2_social_no);
        if((value == '03'|| value=='04' ||value=='05') && book_no=='')
        {
            alert("Book No have not yet.\nSố sổ bảo hiểm chưa có");
            grdEmployee2.SetGridText(event.row, event.col, value_old);
            return;
        }
        if(value == '05') // return
        {
            grdEmployee2.SetGridText(event.row, g2_return_dt, datenow);
        }
    }
    else if(event.col == g2_return_dt)
    {
        if(grdEmployee2.GetGridData(event.row, g2_social_book)!='04')
        {
            alert("Status social book is not return.");
            grdEmployee2.SetGridText(event.row, g2_return_dt, '');
            return;
        }
    }
    else if(event.col == g2_month_ins)
    {
        if(Number(grdEmployee2.GetGridData(event.row, g2_month_ins))<0 )
        {
            alert("You have to input number lager 0\nBạn phải nhập số lớn hơn 0");
            grdEmployee2.SetGridText(event.row, g2_month_ins, '');
            return;
        }
        else if(isNaN(grdEmployee2.GetGridData(event.row, g2_month_ins)))
        {
            alert("You have to input is number\nBạn phải nhập số");
            grdEmployee2.SetGridText(event.row, g2_month_ins, '');
            return;
        }
    }
}
function On_BeforeEditIns()
{
    if(event.col == g2_social_book)
    {
        value_old = grdEmployee2.GetGridData(event.row, event.col);
    }
}
function OnSetGrird(obj)
 {
 var ctrl=grdEmployee2.GetGridControl(); 
      if (ctrl.SelectedRows>0)
	    { 
	    var  tmp,col;
	    if(obj=='1')//yn
	        {
	           if(lstIns1.value=="2")//social
	                col= g2_social_flag;
	           if(lstIns1.value=="1")//health
	                col= g2_health_flag;  	               	        
	           if(lstIns1.value=="3")//unemp
	                 col= g2_unemp_flag;
	           tmp=lstIns2.value;       	               	        
			}
		if(obj=='2')//no
	        {
	            if(lstIns3.value=="2")//social
	                col= g2_social_no;
	           if(lstIns3.value=="1")//health
	                col= g2_health_no;  	               	        
	            tmp=txtIns4.text;       	               	        
	           	        
			}
		if(obj=='3')//place
	        {
	         if(lstIns5.value=="2")//social
	                col= g2_social_place;
	           if(lstIns5.value=="1")//health
	                col= g2_health_place;  	               	        
	           if(lstIns5.value=="3")//Social Book
	                col= g2_social_book;  	               	        
	            tmp=lstIns6.value;    	
	           	        
			}
		if(obj=='4') //date
	        {
	          if(lstIns7.value=="2")//social
	                col= g2_social_dt;
	           if(lstIns7.value=="1")//health
	                col=g2_health_dt;  	               	        
	           if(lstIns7.value=="3")//unemp
	                 col=g2_unemp_dt;
	           tmp=dtInsMonth.text;      
	           	        
			}			
	       for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		        {
			        var row = ctrl.SelectedRow(i);
			        if ( row > 0 )
			        {		
				        grdEmployee2.SetGridText(row,col,tmp);
			        }
		        }
	    }
 }
function onChange_org()
{
		datGet_period.Call();
}

function onPageActive()
{
	if(tabMain.GetCurrentPageNo()==1)
    {
        if(tab2==false)
        {
			onGetWorkGroup(2);
			tab2=true;
		}
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


<!------------------------------------------------------>
<gw:data id="datAllowance" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_CO_ALLOW_SALARY" > 
                <input bind="grdAllowance" >
                </input>
                <output  bind="grdAllowance" />
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------->

<gw:data id="datGet_Org" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_ORG_PL" > 
                <input>
                    <input bind="txtOrgPK" />
                </input> 
                <output>
                    <output bind="txtOrgNM" />
                    <output bind="txtCostGroup" />
                    <output bind="txtCostType" />
                    <output bind="txtCostCenter_pk" />
                    <output bind="txtCostCenter_nm" />
                    <output bind="txtHR0211_YN" />
                </output>
            </dso> 
        </xml> 
</gw:data>


<!------------------------------------------>
<gw:data id="datWorkGroup_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_WG_ROLE"  > 
                <input>
                    <input bind="txtOrgPK" />
                </input> 
                <output>
                    <output bind="txtwg_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>


<gw:data id="datEmp_Management" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="1,3,4,6,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,31,32,33,34,35,36,37,38,39,40,41,42,43,54,55,56,57,61,62,64,65,66,67,68,69,71,72,73,74,75,76,77" function="ST_HR_SEL_HREM00200_0" procedure="ST_HR_UPD_HREM00200_0"> 
                <input bind="grdEmployee" >
					          <input bind="txtEmployee" />
                    <input bind="lstOrg_Code" />
                    <input bind="lstNation" />
					           <input bind="lstPosition" />
                    <input bind="lstSelectDate" />
                    <input bind="dtFrom_Date" />
                    <input bind="dtTo_Date" />
                    <input bind="lstSalaryYN" />
                    <input bind="lstStatus" />
                </input>
                <output  bind="grdEmployee" />
                
            </dso> 
        </xml> 
</gw:data>
<!-------------------data control----------------------->
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
<!------------------------------------------>
<gw:data id="datSal_security" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="process" procedure="ST_HR_PRO_CO_SAL_DISPLAY"  > 
                <input>
                    <input bind="iduser_pk" />
                </input> 
                <output>
                    <output bind="txt_sal_security" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!--------Check EmpID exist---------------------------------->
<gw:data id="datCheck_Exist_Empid" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="process" procedure="ST_HR_PRO_CO_CHECK_EMP_ID"  > 
                <input>
                    <input bind="tmpEmpID" />
                </input> 
                <output>
                    <output bind="txtResult" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<gw:data id="datGet_period" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_PERIOD_BY_ORG"  > 
                <input>
                    <input bind="lstOrg_Code" />
                </input> 
                <output>
                    <output bind="txtlst_period" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!------------------------------------------>
<gw:data id="datIns" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="1,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23" function="ST_HR_SEL_HREM00200_1" procedure="ST_HR_UPD_HREM00200_1"> 
                <input bind="grdEmployee2" >
					<input bind="txtEmployee2" />
                    <input bind="lstOrg_Code2" />
                    <input bind="lstNation2" />
                    <input bind="lstStatus2" />
                    <input bind="lstSelectDate2" />
                    <input bind="dtFrom_Date2" />
                    <input bind="dtTo_Date2" />
					<input bind="lstSelectStatus" />
                    <input bind="lstStatus_YN" />
                </input>
                <output  bind="grdEmployee2" />
            </dso> 
        </xml> 
</gw:data>

<!-------------------data control----------------------->
<gw:tab id="tabMain"  border=1 style="width:100%;height:100%;" onpageactivate="onPageActive()"  >   
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
									Employee
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									 <gw:textbox id="txtEmployee" onenterkey   ="OnSearch()" styles="width:100%"/>
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0" align="left" >
									Nation
								</td>
								<td colspan=20 width="20%" style="border:0"> 
									<gw:list  id="lstNation" value='01' maxlen = "100" styles='width:100%' />
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
									<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(1)" href="#tips"  >Organization</a>
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									 <gw:list  id="lstOrg_Code" value='ALL' maxlen = "100" styles='width:100%' onchange="onChange_org()" />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									<gw:list  id="lstSelectDate" value='1' maxlen = "100" styles='width:80%' onchange="" />
								</td>
								<td colspan=20 width="20%" style="border:0" align="left">
									<gw:datebox id="dtFrom_Date" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									~
									<gw:datebox id="dtTo_Date" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								
								<td colspan=10 width="10%" style="border:0" align="left" >
									Status
								</td>
								<td colspan=20 width="20%" style="border:0"> 
									<gw:list  id="lstStatus"  maxlen = "100" styles='width:100%'/>
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
								<gw:list  id="lstReport" value='1' maxlen = "100" styles='width:100%' />
							</td>
							
						</tr>
					</table>
				</div>
				<div style="border-top:0px solid #62ac0d;border-left:0px solid #62ac0d;border-right:0px solid #62ac0d;border:0px solid #62ac0d;width:100%;height:83%">
					<table width="100%" style="height:100%" border=0 cellpadding="0" cellspacing="0">
                    <tr style="border:1;width:100%;height:75%" valign="top">
                        <td colspan=100 style="width:100%;height:100%;"> 
                             <gw:grid   
                                id="grdEmployee"  
                                header="No|_PK|Organization|Emp ID|Old Code|Full Name|ID Num|Join Date|Birth Date|Place Birth|Telephone|Permanent Address|Present Address|Sex|Person ID|Issue Date|Place Per ID|Married|Nation|Ethenic|Religion|Education|Job|Position|Probation Type|Begin Probation|End  Probation|Contract Kind|Contract NO|Begin Contract|End Contract|Social Flag|Social No|Social Place|Social Date|Health Flag|Health No|Health Place|Health Date|Unemp Flag|Unemp Date|Employee Type|OT YN|Salary YN|Probation Salary|Basic Salary|Allow Amt1|Allow Amt2|Allow Amt3|Allow Amt4|Allow Amt5|Allow Amt6|Allow Amt7|Allow Amt8|Pay Type|Bank Type|Bank Branch|Account|Status|Left Date|Resign Type|Cost Group|Group Kind|Cost Center|Pass Port No|Pass Port Date|Remark|Union YN|Union Date|Pit No|_ByHand_YN|_PK_CostKind|_House YN|Meal YN|_PK_ORG|Salary Period|_Register Ins|N Country 2"   
                                format="0|0|0|0|0|0|0|4|0|0|0|0|0|0|0|4|0|3|0|0|0|0|0|0|0|4|4|0|0|4|4|3|0|0|4|3|0|0|4|3|4|0|3|3|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|2|2|0|0|4|0|3|4|0|0|0|3|3|2|2|3|0"  
                                aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"    
                                defaults="||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"    
                               editcol="0|0|0|1|1|0|1|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|0|0|0|1|1|0|1|1|1|1|1|1|0|0|1|1|1|1|1|1"  
                                widths="500|500|2500|1500|1500|2500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|500|500|1500|1500|1500|1500|500|500|1500|1500|500|500|500|1000"  
                                styles="width:100%; height:100%"   acceptNullDate
                                onafteredit="On_AfterEdit()"
                                onentercell = "On_click()"
                                sorting="T"/> 
                        </td>
                    </tr>
					</table>
				</div>	
                
            </td>
        </tr>
    </table>
	 <table name="Insurance Infomations" id="Ins" width="100%" cellpadding="0" cellspacing="0" style="width:100%;height:100%;border:1px solid #62ac0d;">
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
									Employee
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									 <gw:textbox id="txtEmployee2" onenterkey   ="OnSearchIns()" styles="width:100%"/>
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0" align="left" >
									Nation
								</td>
								<td colspan=20 width="20%" style="border:0"> 
									<gw:list  id="lstNation2" value='ALL' maxlen = "100" styles='width:100%' />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0" align="left" >
									Status
								</td>
								<td colspan=20 width="20%" style="border:0"> 
									<gw:list  id="lstStatus2" value='A' maxlen = "100" styles='width:100%'/>
								</td>
							</tr>
							<tr style="border:0.5;width:100%;height:4%" valign="center" >
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=12 width="12%" style="border:0"  align="left" >
									<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(2)" href="#tips"  >
								Organization</a>
								</td>
								<td colspan=20 width="20%" style="border:0"  align="left" >
									 <gw:list  id="lstOrg_Code2" value='ALL' maxlen = "100" styles='width:100%'onchange="onChange_org()" />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 width="10%" style="border:0"  align="left" >
									<gw:list  id="lstSelectDate2" value='1' maxlen = "100" styles='width:80%' onchange="" >
										<data>
											|1|Birth Date|2|Join Date|3|Left Date
										</data>
									</gw:list>
								</td>
								<td colspan=20 width="20%" style="border:0" align="left">
									<gw:datebox id="dtFrom_Date2" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
									~
									<gw:datebox id="dtTo_Date2" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
								</td>
								<td colspan=2 width="2%" style="border:0"   >
									
								</td>
								<td colspan=10 style="border:0" width="10%" align="left" >
									<gw:list  id="lstSelectStatus" value='1' maxlen = "100" styles='width:80%' onchange="" >
										<data>
											|1|Social Y/N|2|Health Y/N|3|Unemployee Y/N
										</data>
									</gw:list>
								</td>
								<td colspan=20 width="20%" style="border:0" align="left">
									<gw:list  id="lstStatus_YN" value='ALL' maxlen = "100" styles='width:100%'/>
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
								<gw:label id="lblRecord2"  text=""  />
							</td>
							<td colspan=60 width="60%" style="border:0"> 
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="search" id="ibtnSearch2" text="Search"  alt="Search"  onclick="OnSearchIns()"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="save" id="ibtnSave2"  text="Save"  alt="Save"  onclick="OnSaveIns()"/>
							</td>
							<td colspan=5 width="5%" style="border:0" align="left" >
								<gw:button img="excel" id="ibtnIns" text="Report"  alt="Search"  onclick="OnReport(2)"/>
							</td>
							<td colspan=10 width="10%" style="border:0" align="left" >
								<gw:list  id="lstReport1" value='1' maxlen = "100" styles='width:100%' >
									<data>LIST|1|Insurance</data> 
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
									id="grdEmployee2"  
									header="NO|_PK|Organization|Emp ID|Full Name|Join Date|Social Flag|Social No Old|Social No|Social Date|Social Place|Health Flag|Health No|Health Date|Health Place|Unemp Flag|Unemp Date|Social Book|Ins Salary|Submit Book Date|Return Book Date|Month INS|Remark|Description"   
								   format="0|0|0|0|0|4|2|0|0|0|2|2|0|0|2|2|0|2|-0|4|4|0|0|0"  
								   aligns="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|0|0"    
									defaults="|||||||||||||||||||||||"    
								   editcol="0|0|0|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1"  
									widths="500|2000|2500|2000|2000|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500|1500"  
									styles="width:100%; height:100%"   
									acceptNullDate
									sorting="T"
									onafteredit="CheckIns()"
									onbeforeedit="On_BeforeEditIns()"
									
									/> 
							</td>
						</tr>
					</table>
				</div>	
               
            </td>
        </tr>
    </table> 
</gw:tab>   
</body>

<gw:textbox id="txtDeptData" styles="display:none"/>
<gw:textbox id="txtUpperDept" styles="display:none"/>
<gw:textbox id="txtGroupData" styles="display:none"/>
<gw:textbox id="txtOption" text="1" styles="display:none"/> 
<gw:grid   
    id="grdAllowance"  
    header="Code Name 1|Code Name 2|Code Name 3|Code Name 4|Code Name 5|Code Name 6|Code Name 7|Code Name 8|Display 1|Display 2|Display 3|Display 4|Display 5|Display 6|Display 7|Display 7"
    format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
    aligns="0|2|2|1|0|0|1|1|2|1|0|0|0|0|0|0"  
    defaults="||||||||||||||"  
    editcol="0|0|0|0|0|1|1|1|1|1|0|0|0|0|0|0"  
    widths="0|1500|1600|1000|2500|1500|1700|1500|1700|1500|1500|1200|1200|1200|1200|1200"  
    styles="display:none" 
    sorting="T"    
/> 
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


<gw:list  id="lstGrp_Code" value='ALL' maxlen = "100" styles='width:100%;display:none' />
<gw:list  id="lstGrp_Code2" value='ALL' maxlen = "100" styles='width:100%;display:none' />
<gw:textbox id="dtFrom_BeginContract2" nullaccept styles='display:none' />
<gw:textbox id="dtTo_BeginContract2" nullaccept styles='display:none'  />
<gw:list  id="lstSalaryYN"  maxlen = "100" styles='display:none' />
<gw:textbox id="txtlang" styles="display:none"/>
</html>
