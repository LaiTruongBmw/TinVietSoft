<!-- #include file="../../../../system/lib/form.inc"  -->
 <%  CtlLib.SetUser(Session("APP_DBUSER"))%>
 <html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<script>

var strcodereturn; //return data of common code popup to check whether you change data of common code.
var strdata; //data of common code popup
var bdelete=false;
var binit=true;
var obj_list_code; //temp list of common code list
var v_language = "<%=Session("SESSION_LANG")%>";
var lang= "<%=Session("Lang")%>"; 
var iale_days=12;
var flag_allowance=0;
var list_sal_rate;
var flag_tab=1;
var check_init=0;
var c_pk=0,
   c_emp_pk=1,
   c_full_name=2,
   c_relation=3,
   c_birth_dt=4,
   c_sex=5,
   c_nation=6,
   c_pp_new=7,
   c_pp_pk=8,
   c_pp_no=9,
   c_pp_from_dt=10,
   c_pp_to_dt=11,
   c_vr_new=12,
   c_vr_pk=13,
   c_vr_no=14,
   c_vr_from_dt=15,
   c_vr_to_dt=16;
 //----Management
 var c_org_m=1,
     c_org_pk=2,
     c_workgrp_m=3,
     c_sex_m=10,
     c_nation_m=11,
     c_pos_m=12;
     c_job_m=13;
 var rowclick;
 //-----expiry
 var c_emp_exp_pk=0,
     c_rel_pk=7,
     c_rel_nm=8,
     c_rel=9,
     c_create_new=10,
     c_temp_pk=11,
     c_temp_1=12,
     c_temp_2=13,
     c_from=14,
     c_to=15;
//----------------------grdForeigner_Hist
var c_his_temp_1=2,
    c_his_temp_2=3;
    
function BodyInit()
{          
    if (v_language!="ENG")
        System.Translate(document); 
    
    var t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0024' order by code_nm")%>";
    grdFamily.SetComboFormat(c_relation,t1);
    t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0007' order by code_nm")%>";
    grdFamily.SetComboFormat(c_sex,t1);
    t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm")%>";
    grdFamily.SetComboFormat(c_nation,t1);
    OnReset();
    lblLoginID.enabled=false;
    lblMaxID.enabled=false;
    iduser_pk.text = "<%=session("USER_PK")%>";
     txtUser_PK.text = "<%=session("USER_PK")%>";
    txtHr_level.text= "<%=session("HR_LEVEL")%>";
	menu_id.text=System.Menu.GetMenuID();
    //------management
    grdManage.GetGridControl().FrozenCols =6;
    var t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0007' order by code_nm")%>";
    grdManage.SetComboFormat(c_sex_m,t1);
    var t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' order by code_nm")%>";
    grdManage.SetComboFormat(c_nation_m,t1);
    var t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' order by code_nm")%>";
    grdManage.SetComboFormat(c_pos_m,t1);
    var t1 = "<%=CtlLib.SetGridColumnDataSQL("select pk,WORKGROUP_NM from thr_work_group where del_if=0 ")%>";
    grdManage.SetComboFormat(c_workgrp_m,t1);
    var t1 = "<%=CtlLib.SetGridColumnDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0010' order by code_nm")%>";
    grdManage.SetComboFormat(c_job_m,t1);
    //---------expiry
    OnChangeKind();
    datCheck_View.Call();

    
      
}

function ChangeColorItem(lstctl) {
        var slevel1, slevel2, slevel3, slevel4;
        for (var i = 0; i < lstoptions.length; i++) {
            slevel1 = lstoptions.item(i).text.substr(0, 1);
            slevel2 = lstoptions.item(i).text.substr(0, 3);
            slevel3 = lstoptions.item(i).text.substr(0, 5);
            slevel4 = lstoptions.item(i).text.substr(0, 7);
            if (slevel4 != ".......") {
                if (slevel3 == ".....") {
                    lstoptions.item(i).style.color = "0066CC";
                }
                else {
                    if (slevel2 == "...") {
                        lstoptions.item(i).style.color = "FF4500";
                    }
                    else {
                        if (slevel1 == ".")
                            lstoptions.item(i).style.color = "FF00FF";  //FF3333
                    }
                }
            }
        }
    }
//-----------------------------------------------
function OnShowPopup(strtemp,objlist)
{
	if(strtemp==1)
	{
		if(txt_First_use.text=="0")
			{
				var strcom
				var fpath = System.RootURL + "/standard/forms/hr/co/hrco00300.aspx";
				var obj  = System.OpenModal(  fpath , 900 , 1200 , 'resizable:yes;status:yes');
			}
			if(txt_First_use.text=="1")
			{   
				var strcom
				var fpath = System.RootURL + "/standard/forms/hr/co/hrco00400.aspx?byhand="+txt_Employee_ByHand.text;
				  var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:yes;dialogWidth:16;dialogHeight:10;dialogLeft:300;dialogTop:230;edge:sunken;scroll:no;unadorned:yes;help:no');
				if (obj!=null)
				{
					if(obj=="1")
					txt_Employee_ByHand.text="N";
					else
					txt_Employee_ByHand.text="Y";
					
				}
				
			}
	}
	else if (strtemp==3)
    {
		var strcom;
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx";
        //var obj  = System.OpenModal(  fpath , 300 , 200 , 'resizable:yes;status:yes');
        var obj=window.showModalDialog(fpath,this,'titleb:1;resizable:yes;status:yes;dialogWidth:20;dialogHeight:20;dialogLeft:100;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
		
        
        if (obj!=null)
        {
			lstOrg_Code.value = obj;
			 var icurpage=tabMain.GetCurrentPageNo();
            switch (icurpage)
            {
                case 0:
                    lstOrg_Code.value = obj;
					onChange_org(1,lstOrg_Code);
                    break;
                case 2:
                    lstOrg_Code_M.value = obj;
					onChange_org(3,lstOrg_Code_M);
                    break;
                case 3:
                    lstOrg_Code_E.value = obj;
					onChange_org(4,lstOrg_Code_E);
                    break;    
                       
            }
            //txtUpperOrg.text=obj;
            //datOrgData.Call();
            
        }
    }
    
    else
    {
        var strcom;
        obj_list_code=objlist;
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00500.aspx?code=" +  strtemp ;
        var strid = strtemp;
        
	    var obj  = System.OpenModal(  fpath , 800 , 600 , 'resizable:yes;status:yes');
	    if (obj!=null)
	    {
	        strcodereturn=obj[1];
	        if (obj[0]==1 )  //modify common code
	            datGetNewCode.Call("SELECT");
	        
	        else if (strcodereturn!=0)
	        {
	            
                obj_list_code.value=strcodereturn;
	        }
	        
	    }
    }
    
}
//--------------------------------------------------
function OnDataReceive(obj)
{   
    if(obj.id == "datCheck_View")
       {
            if(txtFlag_View.text == 'Y')
            {
                ibtnAdd.style.display = "none";
                ibtnResetE.style.display = "none";
                ibtnUpdate.style.display = "none";
                ibtnUpdate.style.display = "none";
                ibtnDelete.style.display = "none";

                ibtnAdd_F.style.display = "none";
                ibtnSave_F.style.display = "none";
                ibtnDelete_F.style.display = "none";

                ibtnSave_M.style.display = "none";

                ibtnSave_E.style.display = "none";
            }
        
            datMaxEmpID.Call();
       }
    if(obj.id=="datGetSal")
      ChangSal();
      
    if(obj.id=="datCheckID")
        {   
            if(txt_Employee_ByHand.text=="Y")
                {
                    OnCheckAdd();
                }             
        }
    
   if (obj.id=="datMaxEmpID" && binit==true)
   {   
        binit=false;
        if((Trim(txtUser_PK.text)!="")&&(txtHr_level.text=="1")) //QUYEN BI GIOI HAN 
	    {
            datUser_info.Call();     	    
	    }
		else
			check_init=1;
        
   }
   else if (obj.id=="datUser_info")
   {   
        lstOrg_Code.SetDataText(txtDeptData.text);
        lstOrg_Code_M.SetDataText(txtDeptData.text);
        lstOrg_Code_E.SetDataText(txtDeptData.text);
        onChange_org(0,lstOrg_Code);
   }
  
   else if (obj.id=="datEmployee")
   {
        ibtnResetE.SetEnable(true);
        if (bdelete==true ) //delete information
        {
            bdelete=false;
            OnReset();
        }
        else //select and update information
        {
            imgFile.SetDataText(txtPhoto_PK.text);
            
        }
        datMaxEmpID.Call();
   }
   else if (obj.id=="datCheckExist")
   {
        if (txtFlag.text==1)
        {    
                txtFlag.text="2";
                datCheckExist.Call();
            
        }
        else
        {    
            if (txtExistTemp.text!="" )
            {
                alert("Have already card id of employee id:" + txtExistTemp.text+"\nĐã trùng card với nhân viên: "+txtExistTemp.text);
                txtIDCard.GetControl().focus();
            }
            else
            {
                txtFull_FName.text=CutAccent(txtFullName.text);
                txtPhoto_PK.text=imgFile.GetData();
                //continue save info
                if (datEmployee.GetStatus()==10 || datEmployee.GetStatus()==0)
                {
                    if (confirm("Do you want to update? \n Bạn có muốn cập nhật?"))
                    {
                        datEmployee.StatusUpdate();
                        datEmployee.Call();
                    }
                }
                else if (datEmployee.GetStatus()==20)
                {
                     if(txtEMPID.text==""&& txt_Employee_ByHand.text=="Y")
                        {
                            alert("Please insert employee by hand!");
                            return;
                        }
                    if(txt_Exist_Emp_ID.text=="1" && txt_Employee_ByHand.text=="Y")
                        {
                            alert("You can't add new employee .\nEmployee id "+txtEMPID.text+ " exists !");
                            return; 
                        }
                    
                   if (confirm("Do you want to add new employee? \n Bạn muốn thêm mới?"))
                        {
                            txt_Employee_ByHand_YN.text = txt_Employee_ByHand.text;// luu gia tri byhand y/n
                            datEmployee.Call();
                        }
                    //alert("Please input new foreigner on employee entry form");
                    //return;
                }
                
            }
        }
   }
   else if (obj.id=="datCheckDelete")
   {
       
        if (txtDelete_Flag.text==1)
            alert("You can't delete beause having time machine \n Bạn không thể xóa vì nhân viên đã có công");
        else if (txtDelete_Flag.text==2)
            alert("You can't delete beause having absent time \n Bạn không thể xóa vì nhân viên đã có trong danh sách vắng .");
        else
        { 
            bdelete=true;
            datEmployee.StatusDelete();
            datEmployee.Call();
           
        }
   }
   else if (obj.id=="datEmpPK_Base_EmpID")
   {
        if (txtEmp_PK_NB.text=="-1")
            alert("Can't find this employee with emp id like " + txtEMPID.text+"\n Không tìm thấy nhân viên này.");
        else
        {
            txtEmp_PK.text=txtEmp_PK_NB.text;
            datEmployee.Call("SELECT");
        }
        
   }
   else if (obj.id=="datEmpIDBackNext")
   {
        if (txtEmp_PK_NB.text=="-1")
            alert("Can't find employee\nKhông tìm thấy nhân viên này.");
        else
        {
            txtEmp_PK.text=txtEmp_PK_NB.text;
            datEmployee.Call("SELECT");
        }    
   }
   else if (obj.id=="datProbationDate")
   {
        if (lstProKind.value =="03") //have to input end probation
            dtEDProbate.SetEnable(true);
        else
            dtEDProbate.SetEnable(false);
        dtSTProbate.SetEnable(false);
            
   }
   else if (obj.id=="datGetNewCode")
   {
         var strcom;
         var ctllist;
        if (obj_list_code.value!="")
            strcom=obj_list_code.value;
        obj_list_code.SetDataText(txtCodeTemp.text);
        if (strcodereturn!=0)
            obj_list_code.value=strcodereturn;
        else
            obj_list_code.value=strcom;
        
        
   }
   else if (obj.id==="datSalaryGroupData")
   {
		datSalRate.Call();
   }
   else if (obj.id=="datGet_Org")
   {

      grdManage.SetGridText(rowclick,c_org_m,txtOrgNM.text);
   }
   else if (obj.id=="datFind_Report")
   {
        var icurpage=tabMain.GetCurrentPageNo();
        switch (icurpage)
        {
            case 2:
                var url = System.RootURL + '/reports/ch/ae/' + txtReport_tmp.text + '?P_TCO_ORG_PK=' + lstOrg_Code_M.value  + '&P_TEAM_PK=' + lstGrp_Code_M.value + '&P_NATION=' + lstNation_M.value + '&P_SEARCH_BY=' + lstTemp.value + '&P_SEARCH_TEMP=' + txtTemp.text + '&P_FROM_JOINDATE=' + dtFrom_JoinDate.value + '&P_TO_JOINDATE=' + dtTo_JoinDate.value + '&P_POSITION=' + lstPosition_M.value + "&P_SEX="+lstSex_M.value + "&P_STATUS="+lstStatus_M.value + "&P_FROM_LEFTDATE="+dtFrom_LeftDate.value + "&P_TO_LEFTDATE="+dtTo_LeftDate.value + "&P_FROM_BIRTHDATE="+dtFrom_BirthDate.value + "&P_TO_BIRTHDATE="+dtTo_BirthDate.value;
                break;
            case 3:
                var url = System.RootURL + '/reports/ch/ae/' + txtReport_tmp.text + '?P_TCO_ORG_PK=' + lstOrg_Code_E.value  + '&P_TEAM_PK=' + lstGrp_Code_E.value + '&P_SEARCH_TEMP=' + txtEmployee_E.text + '&P_EXPIRY_FROM=' + dtExpiry_From.value + '&P_EXPIRY_TO=' + dtExpiry_To.value + '&P_INCLUDE=' + lstInclude.value + "&P_STATUS="+lstStatus_E.value ;
                break;
                
                   
        }
        System.OpenTargetPage( url , 'newform' );
   }
   else if (obj.id=="datEmp_Management")
   {
        lblRecord.text=grdManage.rows-1 + " record(s)";   
   }
   else if (obj.id=="datExpiry_PP")
   {
        switch (lstKind.value)
        {
            case "01":
                lblRecord_E.text=grdPP.rows-1 + " record(s)";   
                break;
            case "02":
                lblRecord_E.text=grdVR.rows-1 + " record(s)";   
                break;
            case "03":
                lblRecord_E.text=grdWP.rows-1 + " record(s)";   
                break;
            case "04":
                lblRecord_E.text=grdRT.rows-1 + " record(s)";   
                break;    
        }
   }
   
}
//----------------------------------------------
function OnSearch(obj)
{
	if(check_init==1)
	{
		if (obj==1)
		{
			var fpath = System.RootURL + "/form/ch/ae/chae00730_search_emp.aspx" ;
			var obj  = System.OpenModal(  fpath , 900 ,600, 'resizable:yes;status:yes;');
			if (obj!=null)
			{
				txtEmp_PK.text=obj[0];
			   
				datEmployee.Call("SELECT");
			}
		}
		else if (obj==2) //management
			datEmp_Management.Call("SELECT");
		else //expiry
		{
			switch (lstKind.value)
			{
				case "01":
					datExpiry_PP.Call("SELECT");
					break;
				case "02":
					datExpiry_VR.Call("SELECT");
					break;    
				case "03":
					datExpiry_WP.Call("SELECT");
					break;
				case "04":
					datExpiry_RT.Call("SELECT");
					break;
			}
		}    
	}
}
//----------------------------------------------
function OnSave(obj)
{
    if (obj==2)
    {
        if (confirm("Do you want to save information?"))
	        datEmp_Management.Call();
	
	}
	else //obj=3
	    switch (lstKind.value)
	    {
	        case "01":
	            if (OnCheckValid_Expiry(grdPP))
	                datExpiry_PP.Call();
	            break;
	        case "02":
	            if (OnCheckValid_Expiry(grdVR))
    	            datExpiry_VR.Call();
	            break;    
	        case "03":
	            if (OnCheckValid_Expiry(grdWP))
    	            datExpiry_WP.Call();
	            break;
	        case "04":
	            if (OnCheckValid_Expiry(grdRT))
    	            datExpiry_RT.Call();
	            break;
	    }
	
}
//----------------------------------------------
function OnAdd()
{
    //OnReset();
	if(check_init==1)
	{
		var fpath = System.RootURL + "/form/ch/ae/chae00010_rec_emp.aspx?p_status=ALL&p_request=ALL" ;
		var adata = new Array();
		adata  = System.OpenModal(  fpath , 950 ,600, 'resizable:yes;status:yes;');
		if (adata!=null)
		{
			txtClose_YN.text = adata[51];      //close_yn
			 if(txtClose_YN.text == "Y")
			 {
				alert("Recruitment has closed, you can't get information this person!\nĐợt tuyển dụng đã đóng, bạn không thể lấy thông tin cho người này!")
				return;
			 }
			 else
			 {
				 
				 txtFullName.text = adata[2];   //full Name
				 dtJoinDT.value = adata[47];    //joint_dt  
				 lstEmp_Type.value = adata[48]; //emp_type
				 lstOrg_Code.value = adata[27];   // Org
				 txtLivingAdd.text = adata[11];  //Current Address
				// txtHomePhone.text = adata[13];  //Home phone
				 txtTel.text = adata[12];       //Hand phone          
				 txtEmail.text = adata[15];     // Email
				 txtPerAdd.text = adata[10];      //per address
				 lstSEX.value = adata[3];    //sex
				 dtIssueDT.value = adata[7];     //issue date   
				 lstPlaceID.value = adata[8];    //place id
				 txtBirthDT.text = adata[4];    // birth date
				 lstBirthPlace.value = adata[5]; // birth place
				 //lstJob.value = adata[29];        // Job
				 lstPosition.value = adata[28];       // Position
				 lstNation.value = adata[49];         // Nation
				 lstEthnic.value = adata[9];           //Ethnic
				 lstEducation.value = adata[16];      //Education
				 
				 lstPermanent_Province.value = adata[53] ;  // province
				 lstNativeCountry.value	 = adata[54] ;  //n country
				 txtMajor.text = adata[18] 	;	//major
				 lstMarial.value = adata[55] ;	//marital
				 txtIntPK.text = adata[56]	;	//intro_pk
				 txtIntName.text = adata[57];	//intro_nm
				 
				 txtRec_PK.text = adata[50];        //rec pk
				 //imgFile.setData("3570");
				 
			 }
		}
	}	
}
//-------------------------------------------
function OnDelete()
{
	if(check_init==1)
	{
		if (confirm("Do you want to delete this employee?\Bạn muốn xóa?"))
		{
			datCheckDelete.Call();
		}
	}	
    
}
//--Kiem tra EmpID da ton tai hay chua khi su dung Byhand
function CheckEmpID()
{
    if(txt_Employee_ByHand.text=="Y" && txtEMPID.text!="" )
        {
            datCheckID.Call();   
        }

}
//------------------------------------------
function OnUpdate()
{   
    if(txt_Employee_ByHand.text=="")
        txt_Employee_ByHand.text="N";
     // Byhand
    if(txt_Employee_ByHand.text=="Y")
        {   if(txtEMPID.text=="")
                {
                    alert("Please insert employee Id");
                    return;
                }
         
            CheckEmpID();
        }
      //Auto
     if(txt_Employee_ByHand.text=="N")
        OnCheckAdd();    
    
}
//----------------------------------------------
function OnCheckAdd()
{
    if (txtFullName.text=="")
    {
        alert("Please input full name! \n Vui lòng nhập họ và tên");
        txtFullName.GetControl().focus();
        return;
    }
	if (dtJoinDT.value=="")
    {
        alert("Have to input join date! \n Vui lòng nhập ngày vào.");
        dtJoinDT.GetControl().focus();
        return;
    }
    if (Trim(lstOrg_Code.value)=="")
    {
        alert("Please choose Organization! \n Vui lòng chọn phòng ban");
        return;
    }
    
	if (Trim(lstWork_Grp.value)=="")
    {
        alert("Please choose Work Group ! \n");
        return;
    }
    if (txtBirthDT.text=="")
    {
        alert("Please input birth date! \n Vui lòng nhập ngày sinh");
        txtBirthDT.GetControl().focus();
        return;
    }
    
    var t= CheckBirthDate();
    if (t==1)
	{
		if (!confirm("Employee under 18!Do you want to continue? \n Nhân viên này chưa đủ 18tuổi, bạn muốn tiếp tục?"))
		    return;
	}
	else if(t==2)
	{	
		alert("Year must be 4 character num, ex 1980,pls input again. \n Năm phải là 4 kí tự, ví dụ 1980, vui lòng nhập lại.");
		return;
	}
	else if(t==3)
	{	
		alert("Incorrect type, ex dd/mm/yyyy, pls input again \n Nhập ngày tháng năm không hợp lệ.");
		return;
	}
	else if(t==4)
	{	
		alert("Incorrect month, month >=1 and month <= 12, pls input again \n Kiểu tháng không hợp lệ.");
		return;
	}
	else if(t==5)
	{	
		alert("Incorrect day, day <= the last day of the month, pls input again\nSố ngày tối đa trong tháng không đúng.");
		return;
	}
    if (Trim(lstStatus.value)=="")
    {
        alert("Have to choose status!\nVui lòng chọnn status.");
        return;
    }    
    
    if (lstStatus.value!="A" && dtLeaveDT.value=="")
    {  
        alert("Have to input leave date with resign status!\nBạn phải nhập ngày nghỉ việc");
        
        return; 
    }
    if (lstStatus.value=="A" && Trim(lstResignType.value)!="")
    {  
        alert("Active status haven't got resign reason!\nĐang còn làm việc thì không thể có lý do nghỉ việc.");
        
        return; 
    }
    if ((lstStatus.value=="A" || lstStatus.value=="") && dtLeaveDT.value!="")
    {
        alert("Have to clear leave date with active status!\nĐang còn làm việc thì không thể có ngày nghỉ việc.");
        
        return;
    }
    if (lstStatus.value=="")
    {
        alert("Have to input status!\Vui lòng chọn status");
        return;
    }
    if (dtJoinDT.value!="" && dtLeaveDT.value!="" && dtJoinDT.value > dtLeaveDT.value)
    {
        alert("Leave date have to larger than or equal to join date!\nNgày nghỉ việc phải lớn hay bằng ngày vào làm.");
        dtLeaveDT.GetControl().focus();
        return;
    }
    if (dtPP_Issue_DT.value!="" && dtPP_Expiry_DT.value!="" && dtPP_Issue_DT.value >= dtPP_Expiry_DT.value)
    {
        alert("Expiry Date have to be larger than Issue Date - Passport!");
        dtPP_Issue_DT.Focus();
        return;
    }
    if (dtVR_Issue_DT.value!="" && dtVR_Expiry_DT.value!="" && dtVR_Issue_DT.value >= dtVR_Expiry_DT.value)
    {
        alert("Expiry Date have to be larger than Issue Date - Visa/Residence!");
        dtVR_Issue_DT.Focus();
        return;
    }
    if (dtWP_Issue_DT.value!="" && dtWP_Expiry_DT.value!="" && dtWP_Issue_DT.value >= dtWP_Expiry_DT.value)
    {
        alert("Expiry Date have to be larger than Issue Date - Working Permit!");
        dtWP_Issue_DT.Focus();
        return;
    }
    if (dtRT_Issue_DT.value!="" && dtRT_Expiry_DT.value!="" && dtRT_Issue_DT.value >= dtRT_Expiry_DT.value)
    {
        alert("Expiry Date have to be larger than Issue Date - Rental House Detail!");
        dtRT_Issue_DT.Focus();
        return;
    }
       txtFlag.text="2";
        datCheckExist.Call();    
}
//-----------------------------------------------
function CheckExistPersonID()
{
    txtFlag.text=1;
    datCheckExist.Call();
}
//-----------------------------------------------
function CheckBirthDate()
{
    var i,dt,yyyy,mm,dd,dem
	var MyDate =new Date();
	
	var SDay=MyDate.getDate();
	var SMonth=MyDate.getMonth();
	var SYear=MyDate.getFullYear();
	dt=Trim(txtBirthDT.text)
	//dt="-1/2/1978"
	dem=0
	
	mm=""
	dd=""
	yyyy=dt.substr(dt.length-4,4);
	if(dt=="")
		return 0; //khong xet
	if(isNaN(yyyy))
		return 2;
	else
		yyyy=Number(yyyy)
		
	if(dt.length>4)
	{
		for(var j=0;j<dt.length;j++)
			if(dt.charAt(j)=='/')
				dem+=1;
		if(dem!=2)
			return 3;
	}
	i=0;
	while(i<dt.length-4)
	{
		if(i<2)
		{
			if(dt.charAt(i)!='/')
				dd+=""+dt.charAt(i);
		}
		else
			if(dt.charAt(i)!='/')
					mm+=""+dt.charAt(i);
		i+=1;
	}

	if((dd=="")||(mm==""))
	{ //ngay hoac thang khong co -> chi lay nam
		txtBirthDT.text=yyyy
		if((yyyy>=SYear)||(SYear-yyyy)<18)
			return 1;
	}
	else //day du ngay thang
	{
		if ((SYear-yyyy)<18)
			return 1;
		else
		{
			if ((Number(SYear)-Number(yyyy))==18)//xet toi thang, ko can xet ngay
			{
				if(Number(mm)>Number(SMonth)+1)
					return 1;
			}
		//kiem tra ngay hop le
		var lday =getDaysInMonth(String(yyyy)+String(mm));
			if (Number(mm) < 1 || Number(mm) > 12 ) 
				return 4;
			else if ((Number(dd) > lday)||(Number(dd)<0))
				return 5;
		}
		
	}
	
	return 0;
}
//-----------------------------------------------
function getDaysInMonth(yyyymm) //xac dinh thang do co bao nhieu ngay
{
   // returns the last day of a given month
    var m,y,tmpDate,checkMonth,lastDay
	
	m = parseInt(yyyymm.substr(4,2))-1;
	y = parseInt(yyyymm.substr(0,4));
	tmpDate = new Date(y, m, 28);
	checkMonth = tmpDate.getMonth();
	lastDay = 27;

    while(lastDay <= 31)
    {
        temp = tmpDate.setDate(lastDay + 1);
        if(checkMonth != tmpDate.getMonth())
            break;
        lastDay++
    }
    return lastDay;
}
//--------------------------------------------------
function SetEnablePro(obj)
{
    dtJoinDT.SetEnable(obj);
    dtSTProbate.SetEnable(false);
    dtEDProbate.SetEnable(false);
    lstProKind.SetEnable(obj);
}
//--------------------------------------------------
function OnReset()
{   txtManager.SetEnable(false);
    datEmployee.StatusInsert();
    txtPhoto_PK.text="";
    imgFile.SetDataText("");
    txtEmp_PK.text="";
    txtEMPID.text="";
    txtFullName.text="";
    txtFull_FName.text="";
    txtPhoto_PK.text="";
    lstStatus.value="A";
    //lstNation.value="02";
    dtLeaveDT.text="";
    lstJob.value="";
    lstManager_fix.value="N";
    lstResignType.value="";
    dtPP_Issue_DT.value="";
    txtPP_Number.text="";
    for (var i=0;i<4;i++)
        OnCreateNew(i+1);
    //ibtnResetE.SetEnable(false);
    
}
function OnCreateNew(obj)
{
    switch (obj)
    {
        case 1:
        {
            txtPP_Number.text="";
            dtPP_Issue_DT.value="";
            dtPP_Expiry_DT.value="";
            txtPP_PK.text="";
            break;
        }
        case 2:
        {
            txtVR_Number.text="";
            dtVR_Issue_DT.value="";
            dtVR_Expiry_DT.value="";
            txtVR_PK.text="";
            break;
        }  
        case 3:
        {
            txtWP_Number.text="";
            dtWP_Issue_DT.value="";
            dtWP_Expiry_DT.value="";
            txtWP_PK.text="";
            break;
        }
        case 4:
        {
            txtRT_Fee.text="";
            dtRT_Issue_DT.value="";
            dtRT_Expiry_DT.value="";
            txtRT_Deposit.text="";
            txtRT_PK.text="";
            break;
        }  
    }
}
//-----------------------------------------------
function OnDataError(oData)
{
  //alert(eval(oData).errmsg);
    if (eval(oData).errno == 20001)
    {
		alert("Database problem 1: "+ eval(oData).errmsg);
    }
    else if (eval(oData).errno == 20002)
    {
		alert("Database problem 2: "+ eval(oData).errmsg);
    }
	else if (eval(oData).errno > 0)
	{
		alert("Unexpected error: "+ eval(oData).errmsg);
	}	
	
}
//-----------------------------------------------

function CutAccent(str)
{
    var aaccent=new Array("Á","À","Ả","Ã","Ạ","Â","Ậ","Ấ","Ầ","Ẩ","Ẫ","Ậ","Ă","Ắ","Ằ","Ẳ","Ẵ","Ặ","Ê","Ế","Ề","Ể","Ễ","Ệ","Í","Ì","Ỉ","Ĩ","Ị","Ó","Ò","Ỏ","Õ","Ọ","Ô","Ố","Ồ","Ổ","Ỗ","Ộ","Ơ","Ớ","Ờ","Ở","Ỡ","Ợ","Ư","Ứ","Ừ","Ử","Ữ","Ự","Ú","Ù","Ủ","Ũ","Ụ","Ý","Ỳ","Ỷ","Ỹ","Ỵ","Đ");
	var araccent=new Array("A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","A","E","E","E","E","E","E","I","I","I","I","I","O","O","O","O","O","O","O","O","O","O","O","O","O","O","O","O","O","U","U","U","U","U","U","U","U","U","U","U","Y","Y","Y","Y","Y","D");
    
    for (var i=0;i<aaccent.length ;i++)
        str=ReplaceString(str,aaccent[i],araccent[i]);
    return str;
}
//-----------------------------------------------

function ReplaceString(s1,s2,s3)
{
    while (s1.search(s2)!=-1)
        s1=s1.replace(s2,s3)
    return s1;
}
//--------------------------------------------------
function OnBackNext(obj)
{
	if(check_init==1)
	{
		if (obj==1)
			txtBackNext.text=1;
		else
			txtBackNext.text=2;
		datEmpIDBackNext.Call();
	}	
}
//---------------------------------------------------
function checkKey() 
{ 
	var c = String.fromCharCode (event.keyCode); 
	var x = c.toUpperCase().charCodeAt(0) ; 
	event.keyCode = x; 
	
}
//--------------------------------------------------
function OnChangeSalaryGroup()
{
    if(lstSalarGroup.value=='0')
    {
        
        lstSalaryRate.SetDataText(list_sal_rate);
        lstSalaryRate.value='0';
		
    }
    else
    {
		datSalaryGroupData.Call();
    }    
}
//-------------------------------------------------
function OnChangeRate()
{
    //alert(lstSalaryRate.value);
    
    datSalRate.Call();
}
//-----------------------------------------------
function Numbers(e) 
{ 
  //  var ctrl=idTEL.GetControl(); 
    var keynum; 
    var keychar; 
    var numcheck; 
    keynum =event.keyCode; 
        
    if(window.event) // IE 
    { 
      keynum = e.keyCode; 
    } 
    else if(e.which) // Netscape/Firefox/Opera 
    { 
      keynum = e.which; 
    } 
    keychar = String.fromCharCode(keynum); 
    numcheck = /\d/; 
    return numcheck.test(keychar); 
}
//----------------------------------------------------------------------
function ChangeProbType()
{
    if (dtJoinDT.text!="" )
    {
        if (lstProKind.value!=" ") 
            datProbationDate.Call();
    }
    else
    {
        alert("Please input join date at first!\NVui lòng nhập ngày vào.");
        lstProKind.value=" ";
    }
}
//--------------------------------------------
function OnEnterEmp()
{
    
    datEmpPK_Base_EmpID.Call();
}

//------------------------------------------------------------------
function OnDataReceive_E(obj)
{   
   
    if (obj.id=="datFamily")
    {
    }
    
}
//------------------------end  with expand employee----------------
function OnReport(obj)
{
    if (obj==2)    
    {
        txtReport_tmp.text=lstReport.value;
    }
    else if (obj==3)
    {
        lstReport_E.GetControl().selectedIndex=lstKind.GetControl().selectedIndex
        txtReport_tmp.text=lstReport_E.value;
    }
     datFind_Report.Call();
}

function OnShowManager()
{
    var strcom
    
            var fpath = System.RootURL + "/form/ch/fd/chfd00020_search_emp.aspx";
            var obj  = System.OpenModal(  fpath , 800 , 500 , 'resizable:yes;status:yes');
            if (obj!=null)
	        {
                txtManager_id.text=obj[1];
                txtManager.text=obj[1]+"-"+obj[2];
	        }
	        
}
//------------------------------------------------
function OnAddNew_E()
{
    
    grdFamily.AddRow();
    grdFamily.SetGridText(grdFamily.rows-1,1,txtEmp_PK.text);
    
}
//------------------------------------------------
function OnSave_E()
{
    if (confirm("Do you want to save information?\nBạn có muốn lưu?") && OnCheckValid())
    {
        datFamily.Call();
        
    }
}
function OnCheckValid()
{
    for (var i=1;i<grdFamily.rows;i++)
    {
        var spp_from_dt=grdFamily.GetGridData(i,c_pp_from_dt);
        var spp_to_dt=grdFamily.GetGridData(i,c_pp_to_dt);
        var svr_from_dt=grdFamily.GetGridData(i,c_vr_from_dt);
        var svr_to_dt=grdFamily.GetGridData(i,c_vr_to_dt);
        
        if (spp_from_dt!="" && spp_to_dt !="" && spp_from_dt >=spp_to_dt )
        {
            alert("Expiry Date has to be larger than Issue Date at row " + (i-1))
            return false;
        }
        if (svr_from_dt!="" && svr_to_dt !="" && svr_from_dt >=svr_to_dt )
        {
            alert("Expiry Date has to be larger than Issue Date at row " + (i-1) )
            return false;
        }
    }
    return true;
}
//------------------------------------------------
function OnDelete_E()
{
    if (confirm("Do you want to delete information?\nBạn muốn delete."))
    {
        grdFamily.DeleteRow();
        datFamily.Call();
    }
}
//------------------------continued with expand employee----------------
function OnChangeTab()
{   
    
    var icurpage=tabMain.GetCurrentPageNo();
    if (icurpage==1) //expand employee
    {
        if (txtEmp_PK.text!="" && txtEmp_PK.text!=-1)
        {
            lblEmployee.text="EMPLOYEE:  " + txtEMPID.text + " - " + txtFullName.text;
            ibtnAdd_F.SetEnable(true);
            ibtnDelete_F.SetEnable(true);
            ibtnSave_F.SetEnable(true);
                if (txtEmp_PK.text != txtEmp_PK_E.text)
                {
                    txtEmp_PK_E.text=txtEmp_PK.text;
                    datFamily.Call("SELECT");
                }    
        }
        else
        {
            ibtnAdd_F.SetEnable(false);
            ibtnDelete_F.SetEnable(false);
            ibtnSave_F.SetEnable(false);

        }
    }
    
        
    
}
function Popup()
{
    var col=event.col;
    if(col==c_org_m)
    {
        
        var strcom;
        var fpath = System.RootURL + "/form/ch/ae/chae00030_org.aspx?";
        var obj  = System.OpenModal(  fpath , 700 , 600 , 'resizable:yes;status:yes');
        //var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
            rowclick= event.row;
             txtOrgPK.text = obj;
			 grdManage.SetGridText(event.row,c_org_pk,txtOrgPK.text);
           
            datGet_Org.Call();
            
            
        }    
    }
    
}
//---------------------Expiry-------------------------------
function OnChangeKind()
{
    switch (lstKind.value)
    {
        case "01":
        {
            grdPP.style.display="";
            grdVR.style.display="none";
            grdWP.style.display="none";
            grdRT.style.display="none";
            lstSet.SetDataText("|01|Number");
            break;
        }    
        case "02":
        {
            grdPP.style.display="none";
            grdVR.style.display="";
            grdWP.style.display="none";
            grdRT.style.display="none";
            lstSet.SetDataText("|01|Number");
            break;
        }    
        case "03":
        {
            grdPP.style.display="none";
            grdVR.style.display="none";
            grdWP.style.display="";
            grdRT.style.display="none";
            lstSet.SetDataText("|01|Number");
            break;
        }    
        case "04":
        {
            grdPP.style.display="none";
            grdVR.style.display="none";
            grdWP.style.display="none";
            grdRT.style.display="";
            lstSet.SetDataText("|01|Rental Amt|02|Deposit Amt");
            break;
        }    
    }
}
//-----------
function OnChangeInclude()
{
    if (lstInclude.value!="01")
    {
        grdPP.GetGridControl().ColHidden(c_rel_nm )=0;
        grdPP.GetGridControl().ColHidden(c_rel )=0;
        grdVR.GetGridControl().ColHidden(c_rel_nm )=0;
        grdVR.GetGridControl().ColHidden(c_rel )=0;
        grdRT.GetGridControl().ColHidden(c_rel_nm )=0;
        grdRT.GetGridControl().ColHidden(c_rel )=0;
        grdWP.GetGridControl().ColHidden(c_rel_nm )=0;
        grdWP.GetGridControl().ColHidden(c_rel )=0;
    }
    else
    {
        grdPP.GetGridControl().ColHidden(c_rel_nm )=1;
        grdPP.GetGridControl().ColHidden(c_rel )=1;
        grdVR.GetGridControl().ColHidden(c_rel_nm )=1;
        grdVR.GetGridControl().ColHidden(c_rel )=1;
        grdRT.GetGridControl().ColHidden(c_rel_nm )=1;
        grdRT.GetGridControl().ColHidden(c_rel )=1;
        grdWP.GetGridControl().ColHidden(c_rel_nm )=1;
        grdWP.GetGridControl().ColHidden(c_rel )=1;
    }
    
}
//---------------
function OnSetGrid(obj)
{
    var svalue;
    var icol;
    switch (obj)
    {
        case 1: //number or amt 
        {
            svalue=txtNumber.text;
            if (lstSet.value=="01")
                icol=c_temp_1;    
            else
                icol=c_temp_2;    
            break;
        }
        case 2: //issue date
        {
            svalue=dtIssue_DT.value;
            icol=c_from;    
            break;
        }  
        case 3: //expiry date
        {
            svalue=dtExpiry_DT.value;
            icol=c_to;    
            break;
        }
        case 4: //create new
        {
            if (chkCreateNew.value=="F")
                svalue=0;
            else
                svalue=1;
            icol=c_create_new;    
            break;
        }
    }
    var ctrl,obj_grd;
    switch (lstKind.value)
    {
        case "01":
        {
            ctrl = grdPP.GetGridControl();
            obj_grd=grdPP;
            break;
        }
        case "02":
        {
            ctrl = grdVR.GetGridControl();
            obj_grd=grdVR;
            break;
        }
        case "03":
        {
            ctrl = grdWP.GetGridControl();
            obj_grd=grdWP;
            break;    
        }
        case "04":
        {
            ctrl = grdRT.GetGridControl();
            obj_grd=grdRT;
            break;
        }
    }
    if (ctrl.SelectedRows>1)
    {
	    for ( var i =  0 ; i < ctrl.SelectedRows ; i++ )
		    {
			    var row = ctrl.SelectedRow(i);
			    if ( row > 0 )
			    {		
				    obj_grd.SetGridText(row,icol,svalue);
			    }
		    }
	}
	else
	{
	    for ( var i =  1 ; i < ctrl.rows ; i++ )
				    obj_grd.SetGridText(i,icol,svalue);
	}
    
}
//---------------------------
function OnCheckValid_Expiry(grdobj)
{
    for (var i=1;i<grdobj.rows;i++)
    {
        var s_from_dt=grdobj.GetGridData(i,c_from);
        var s_to_dt=grdobj.GetGridData(i,c_to);
        
        if (s_from_dt!="" && s_to_dt !="" && s_from_dt >=s_to_dt )
        {
            alert("Expiry Date has to be larger than Issue Date at row " + (i-1))
            return false;
        }
    }
    return true;
}
//-----------
function OnShowHis()
{
    var irow;
    var objgrd;
    switch (lstKind.value)
    {
        case "01":
            objgrd=grdPP;
            break;
        case "02":
            objgrd=grdVR;
            break;
        case "03":
            objgrd=grdWP;
            break;
        case "04":
            objgrd=grdRT;
            break;
                    
    }
    irow=objgrd.row;
    if (irow>0 && Expiry.imgArrow.status == "expand")
    {
        txtEmp_His_PK.text=objgrd.GetGridData(irow,c_emp_exp_pk);
        txtFamily_His_PK.text=objgrd.GetGridData(irow,c_rel_pk);
        txtTemp_His_PK.text=objgrd.GetGridData(irow,c_temp_pk);
        grdForeigner_Hist.SetGridText(0,c_his_temp_1,objgrd.GetGridData(0,c_temp_1));
        grdForeigner_Hist.SetGridText(0,c_his_temp_2,objgrd.GetGridData(0,c_temp_2));
        grdForeigner_Hist.GetGridControl().ColHidden(c_his_temp_2)=objgrd.GetGridControl().ColHidden(c_temp_2);
        datForeigner_Hist.Call("SELECT");
    }
    
}
//--------------------------
//------------------------------------------------
function OnToggle()
{
    
    if(Expiry.imgArrow.status == "expand")
    {
        tblHist.style.display="none";
        Expiry.imgArrow.status = "collapse";
        Expiry.imgArrow.src = "../../../system/images/iconmaximize.gif";
        tblMainHist.style.height="85%";
        tblHist.style.height="0%";
    }
    else
    {
        tblHist.style.display="";
        Expiry.imgArrow.status = "expand";
        Expiry.imgArrow.src = "../../../system/images/close_popup.gif";
        tblMainHist.style.height="45%";
        tblHist.style.height="40%";
        OnShowHis();
        
    }
    
}
function onChange_org(tab,obj)
{
	flag_tab=tab;
	txtorg_tmp.text=obj.value;
	
}
</script>
<body bgcolor='#F5F8FF'>
<!---------------------main employee tab data control------------------>
<!------------------------------------->
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
<gw:data id="datGet_Org" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_GET_ORG_NM" > 
                <input>
                    <input bind="txtOrgPK" />
                </input> 
                <output>
                    <output bind="txtOrgNM" />
                </output>
            </dso> 
        </xml> 
</gw:data>


<!------------------------------------->
<gw:data id="datCheckExist" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_CHECK_EXIST" > 
                <input>
                    <input bind="txtEmp_PK" />
                    <input bind="txtFlag" />  
                    <input bind="txtPersonalID" />
                    <input bind="txtIDCard" />  
                </input> 
                <output>
                    <output bind="txtExistTemp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------>
<gw:data id="datUser_info" onreceive="OnDataReceive(this)"  > 
        <xml>
            <dso  type="list" procedure="ST_HR_SEL_CO_USER_ROLE2"  > 
                <input>
                    <input bind="txtUser_PK" />
                </input> 
                <output>
                    <output bind="txtDeptData" />
                </output>
            </dso> 
        </xml> 
</gw:data>



<!------------------------------------>
<gw:data id="datCheckDelete" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_CHECK_DELETE" > 
                <input>
                    <input bind="txtEmp_PK" /> 
                </input> 
                <output>
                    <output bind="txtDelete_Flag" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!----------------------------------->
<gw:data id="datMaxEmpID" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_MAX_ID" > 
                <input>
                    <input bind="lblMaxID" />
                    <input bind="txtUser_PK" />
                </input>
                <output>
                    <output bind="lblMaxID" />
                    <output bind="txt_sal_security" />
                    <output bind="txt_First_use" />
                    <output bind="txt_Employee_ByHand" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!----------------------------------->
<gw:data id="datEmpPK_Base_EmpID" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_EMPPK_BASE_ID" > 
                <input>
                    <input bind="txtEMPID" />
					<input bind="txtUser_PK" />
                </input>
                <output>
                    <output bind="txtEmp_PK_NB" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<!----------------------------------->
<gw:data id="datEmpIDBackNext" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_BACK_NEXT" > 
                <input>
                    <input bind="txtBackNext" />
                    <input bind="txtEMPID" />
					<input bind="txtUser_PK" />
                </input>
                <output>
                    <output bind="txtEmp_PK_NB" />
                </output>
            </dso> 
        </xml> 
</gw:data>

<!-------------------------------------------->
<gw:data id="datGetNewCode" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso type="list" procedure="ST_HR_PRO_CO_NEW_CODE" > 
            <input> 
                <input bind="txtComCodeID" />
            </input>
	       <output>
	            <output bind="txtCodeTemp" /> 
	       </output>
        </dso> 
    </xml> 
</gw:data>

<!---------------------expand employee tab data control------------------>
<!----------------------------------->
<gw:data id="datFamily" onreceive="OnDataReceive_E(this)"  > 
        <xml> 
            <dso  type="grid" function="ST_HR_SEL_HREM01400_0" procedure="ST_HR_UPD_HREM01400_0" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16"> 
                <input>
                    <input bind="txtEmp_PK" />
                </input>
                <output  bind="grdFamily" />
            </dso> 
        </xml> 
</gw:data>
<%--------Check EmpID exist---------%>
<gw:data id="datCheckID" onreceive="OnDataReceive(this)"> 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_check_emp_id" > 
                <input>
                    <input bind="txtEMPID"/>
                </input> 
                <output>
                    <input bind="txt_Exist_Emp_ID"/>                    
                </output>
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------>
<gw:data id="datEmployee" onreceive="OnDataReceive(this)" onerror="OnDataError(this)" > 
        <xml> 
            <dso  type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43" function="ST_HR_SEL_HREM01400_1" procedure="ST_HR_UPD_HREM01400_1"> 
                <inout>
                    <inout bind="txtEmp_PK" /> 
                    <inout bind="txtEMPID"/>
                    <inout bind="lstLocation"/>
                    <inout bind="txtIDCard"/>
                    <inout bind="txtFullName"/>
                    
                    <inout bind="txtFull_FName"/>
                    <inout bind="txtPhoto_PK"/>
                    <inout bind="lstStatus"/>
                    <inout bind="dtJoinDT"/>
                    <inout bind="dtLeaveDT"/>
                    
                    <inout bind="lstSEX"/>
                    <inout bind="txtBirthDT"/>
                    <inout bind="lstNation"/>
                    <inout bind="txtTel"/>
                    <inout bind="txtLivingAdd"/>
                    
                    <inout bind="lstPosition"/>
                    <inout bind="lstResignType"/>
                    <inout bind="txtPit_No"/>  
                    <inout bind="txtEmail"/>
					<inout bind="lstOrg_Code"/>
					
					<inout bind="lstWork_Grp"/>
					<inout bind="txt_Employee_ByHand_YN" />
					<inout bind="txtManager"/>
					<inout bind="txtManager_id"/>
					<inout bind="lstManager_fix"/>
					
					<inout bind="txtPP_PK"/>
					<inout bind="txtPP_Number"/>
					<inout bind="dtPP_Issue_DT"/>
					<inout bind="dtPP_Expiry_DT"/>
					<inout bind="txtVR_PK"/>
					
					<inout bind="txtVR_Number"/>
					<inout bind="dtVR_Issue_DT"/>
					<inout bind="dtVR_Expiry_DT"/>
					<inout bind="txtWP_PK"/>
					<inout bind="txtWP_Number"/>
					
					<inout bind="dtWP_Issue_DT"/>
					<inout bind="dtWP_Expiry_DT"/>
					<inout bind="txtRT_PK"/>
					<inout bind="txtRT_Fee"/>
					<inout bind="txtRT_Deposit"/>
					
					<inout bind="dtRT_Issue_DT"/>
					<inout bind="dtRT_Expiry_DT"/>
					<inout bind="lstJob"/>
					
					
               </inout> 
            </dso> 
        </xml> 
</gw:data>
<!---------------------expand employee tab data control------------------>

<!------------------tab Manage----------------->
 
<gw:data id="datEmp_Management" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,2,3,4,5,8,9,10,11,12,13,14,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35" function="ST_HR_SEL_HREM01400_2" procedure="ST_HR_UPD_HREM01400_2"> 
                <input bind="grdManage" >
                    <input bind="lstOrg_Code_M" />
                    <input bind="lstGrp_Code_M" />
                    <input bind="lstNation_M" />
                    <input bind="txtEmployee_M" />
                    <input bind="dtFrom_JoinDate" />
                    <input bind="dtTo_JoinDate" />
                    <input bind="lstPosition_M" />
                    <input bind="lstSex_M" />
                    <input bind="lstStatus_M" />
                    <input bind="dtFrom_LeftDate" />
                    <input bind="dtTo_LeftDate" />
                    <input bind="dtFrom_BirthDate" />
                    <input bind="dtTo_BirthDate" />
                </input>
                <output  bind="grdManage" />
                
            </dso> 
        </xml> 
</gw:data>
<!------------------tab Expiry----------------->
 
<gw:data id="datExpiry_PP" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,7,10,11,12,13,14,15" function="ST_HR_SEL_HREM01400_3" procedure="ST_HR_UPD_HREM01400_3"> 
                <input bind="grdPP" >
                    <input bind="lstOrg_Code_E" />
                    <input bind="lstGrp_Code_E" />
                    <input bind="lstStatus_E" />
                    <input bind="txtEmployee_E" />
                    <input bind="dtExpiry_From" />
                    <input bind="dtExpiry_To" />
                    <input bind="lstInclude" />
                </input>
                <output  bind="grdPP" />
                
            </dso> 
        </xml> 
</gw:data>
<!------------------>
<gw:data id="datExpiry_VR" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,7,10,11,12,13,14,15" function="ST_HR_SEL_HREM01400_4" procedure="ST_HR_UPD_HREM01400_4"> 
                <input bind="grdVR" >
                    <input bind="lstOrg_Code_E" />
                    <input bind="lstGrp_Code_E" />
                    <input bind="lstStatus_E" />
                    <input bind="txtEmployee_E" />
                    <input bind="dtExpiry_From" />
                    <input bind="dtExpiry_To" />
                    <input bind="lstInclude" />
                </input>
                <output  bind="grdVR" />
                
            </dso> 
        </xml> 
</gw:data>
<!------------------>
<gw:data id="datExpiry_WP" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,7,10,11,12,13,14,15" function="ST_HR_SEL_HREM01400_5" procedure="ST_HR_UPD_HREM01400_5">  
                <input bind="grdWP" >
                    <input bind="lstOrg_Code_E" />
                    <input bind="lstGrp_Code_E" />
                    <input bind="lstStatus_E" />
                    <input bind="txtEmployee_E" />
                    <input bind="dtExpiry_From" />
                    <input bind="dtExpiry_To" />
                    <input bind="lstInclude" />
                </input>
                <output  bind="grdWP" />
                
            </dso> 
        </xml> 
</gw:data>
<!------------------>
<gw:data id="datExpiry_RT" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"  parameter="0,7,10,11,12,13,14,15" function="ST_HR_SEL_HREM01400_6" procedure="ST_HR_UPD_HREM01400_6">
                <input bind="grdRT" >
                    <input bind="lstOrg_Code_E" />
                    <input bind="lstGrp_Code_E" />
                    <input bind="lstStatus_E" />
                    <input bind="txtEmployee_E" />
                    <input bind="dtExpiry_From" />
                    <input bind="dtExpiry_To" />
                    <input bind="lstInclude" />
                </input>
                <output  bind="grdRT" />
                
            </dso> 
        </xml> 
</gw:data>
<!------------------>
<gw:data id="datForeigner_Hist" onreceive="OnDataReceive(this)" > 
        <xml> 
            <dso  type="grid"   function="ST_HR_SEL_HREM01400_7"> 
                <input bind="grdForeigner_Hist" >
                    <input bind="txtEmp_His_PK" />
                    <input bind="txtFamily_His_PK" />
                    <input bind="txtTemp_His_PK" />
                    <input bind="lstKind" />
                </input>
                <output  bind="grdForeigner_Hist" />
                
            </dso> 
        </xml> 
</gw:data>
<!------------------------------------------------>
<gw:data id="datFind_Report" onreceive="OnDataReceive(this)"  > 
        <xml> 
            <dso  type="process" procedure="ST_HR_PRO_CO_REPORT" > 
                <input>
                    <input bind="txtReport_tmp" /> 
                </input> 
                <output>
                    <output bind="txtReport_tmp" />
                </output>
            </dso> 
        </xml> 
</gw:data>
<gw:tab id="tabMain"  border=1 style="width:100%;height:99%" onpageactivate="OnChangeTab()" > 	
<form name="Main E" id="form1" >
     <table id="main"  cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;">
        <tr >
            <td>
                <table  width="100%" style="width:100%;height:100%;" cellpadding="0" cellspacing="0">
                    <tr style="height:5%">
                        <td colspan=11>
                            <table border=1 width=100% cellpadding="0" cellspacing="0">
                                <tr style="border:0" >
                                    <td nowrap width=10%  style="border:0" >
                                        Login ID</td>
                                    <td nowrap width=18%  style="border:0">
                                        <gw:label id="lblLoginID"  text="<%=session("USER_ID")%>" maxlen = "100" styles="color:red;width:90%;font-weight: bold;font-size:15" />
                                    </td>
                                    <td nowrap width=8%  style="border:0">
                                        
                                    </td>
                                    
                                    <td nowrap width=8%  style="border:0">
                                        Max EMP ID</td>
                                    <td nowrap width=4%  style="border:0">
                                        <gw:imgBtn img="back" id="ibtnPrev"   styles='width:10%' alt="back" img="in"  text="<<"  onclick="OnBackNext(1)"/>
                                    </td>
                                    <td nowrap width=10% align="center"  style="border:0">
                                        <gw:label id="lblMaxID"  text="" maxlen = "100" styles='color:red;width:100%;font-weight: bold;font-size:13' />
                                    </td>
                                    <td nowrap width=4% align="right"  style="border:0">
                                        <gw:imgBtn img="next"  id="ibtnNext"   styles='width:10%' img="in"  alt="next" text=">>"  onclick="OnBackNext(2)"/>
                                    </td>
                                    <td width=20%  style="border:0">
                                    </td>
                                    
									<td width=3%  style="border:0">
									
                                    </td>
                                   
                                    <td nowrap width=3%  style="border:0">
                                        <gw:button id="ibtnResetE" alt="Add New" img="new" text="Add New" onclick="OnReset()" />
                                    </td>
                                    <td nowrap width=3%  style="border:0">
                                        <gw:button id="ibtnUpdate" alt="Save" img="save" text="Save" onclick="OnUpdate()" />
                                    </td>
                                    
                                    <td nowrap width=3%  style="border:0">
                                        <gw:button id="ibtnDelete"  alt="Delete"  img="delete"  text="Delete"  onclick="OnDelete()" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    
                    <tr style="height:5%">
                        <td nowrap width=10%><a title="Click here to show employee id code" onclick="OnShowPopup(1,'')" href="#tips" >Employee ID(*)</a>
                            </td>
                        <td nowrap width=13%>
                            <gw:textbox id="txtEMPID"  text="" 	maxlen = "10" styles='width:100%;' csstype="mandatory"  onenterkey="OnEnterEmp()" />
                        </td>
                        <td nowrap width=3%>
                        </td>
                        <td nowrap width="9%"><a title="Click here to show location" onclick="OnShowPopup('HR0115',lstLocation)" href="#tips" >Location(*)</a></td>
                        <td nowrap width="12%">
                            <gw:list  id="lstLocation" value="01" styles='width:100%' onChange="">
                            <data>
                                <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0115' order by CODE")%>
                            </data>
                            </gw:list >
                        </td>
                        <td nowrap width="3%"></td>
                        <td nowrap width="10%">ID No</td>
                        <td nowrap width="8%">
                            <gw:textbox id="txtIDCard"  text="" maxlen = "20" styles='width:100%;' csstype="mandatory" />
                        </td>
                        <td nowrap width="1%"></td>
                        <td nowrap  width=19% colspan=2  rowspan=4 ><gw:image id="imgFile"   view="/binary/ViewFile.aspx" post="/binary/PostFile.aspx" styles="width:130;height:130"  />
                        </td>
                    </tr>
                    <tr style="height:5%">
                        <td nowrap >
                            Full Name(VN) (*)</td>
                        <td nowrap colspan=1 >
                            <gw:textbox id="txtFullName"  maxlen = "60" text="" styles='width:100%;' csstype="mandatory" onkeypress="checkKey()" />
                        </td>
                        <td></td>
                        <td nowrap >
                            Join Date(*)</td>
                        <td nowrap >
                            <gw:datebox id="dtJoinDT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="ChangeProbType()" />
                        </td>
                        <td nowrap >
                        </td>
                        <td nowrap  >PIT No</td>
                        <td nowrap  >
                            <gw:textbox id="txtPit_No"  text="" maxlen = "30" styles='width:100%' />
                        </td>
                        <td nowrap >
                        </td>              
                    </tr>
					<tr style="height:5%">
                        <td nowrap ><a title="Click here to show Organization" onclick="OnShowPopup(3,'')" href="#tips" >
                            Organization(*)</a></td>
                        <td nowrap colspan = "4"> <gw:list  id="lstOrg_Code" value=" " maxlen = "100" styles='width:100%' onchange="onChange_org(1,lstOrg_Code)" >
                            <data>
                                <%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk) or '" + session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>| |Select...
                            </data>
                        </gw:list>
                        <td nowrap ></td>
                        <td nowrap ><a title="Click here to change manager" onclick="OnShowManager()" href="#tips" >
                            Manager</a></td>
                        <td nowrap width=12%><gw:textbox id="txtManager" text="" maxlen = "10" styles='width:100%;' /></td>
						<td nowrap ></td>
                    </tr>
					<tr style="height:5%">
                        <td nowrap >Work Group(*)</td>
                        <td nowrap colspan = "4" ><gw:list  id="lstWork_Grp" value="82" maxlen = "100" styles='width:100%'onchange="" >
								<data>
									<%=CtlLib.SetListDataSQL("SELECT PK, WORKGROUP_NM FROM THR_WORK_GROUP WHERE DEL_IF = 0")%>| |Select ...
								</data>
							</gw:list></td>
						<td nowrap > </td>
                        <td nowrap >Manager Fix</td>
                        <td nowrap width=12%><gw:list  id="lstManager_fix" value=" " maxlen = "100" styles='width:100%'onchange="" >
                            <data>|Y|Yes|N|No</data>
                            </gw:list>
                        </td>
						<td nowrap ></td>
                    </tr>
                  <tr style="height:5%">
                        <td nowrap >Email</td>
                        <td nowrap >
                            <gw:textbox id="txtEmail"  text="" maxlen = "100" styles='width:100%' />
                        </td> 
                        <td nowrap ></td>
                        <td nowrap style="height:5%">
                            Job Title</td>
                        <td><gw:list  id="lstJob" value="" styles='width:100%' onChange="">
                            <data>
                                <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0010' order by code_nm")%>||
                            </data>
                            </gw:list ></td>
                        <td nowrap >
                        </td>
                        <td nowrap style="height:5%">
                            Birth Date(*)</td>
                        <td nowrap >
                            <gw:textbox id="txtBirthDT"  text="" maxlen = "10" styles='width:100%' /> 
                        </td>
                         <td nowrap >
                        </td>
                        <td nowrap width="8%"><a title="Click here to show position code" onclick="OnShowPopup('HR0008',lstPosition)" href="#tips" >
                            Position(*)</a></td>
                        <td nowrap  width="11%"><gw:list  id="lstPosition" maxlen = "100" styles='width:100%'>
                            <data>
                                <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008'  and num_4 in (1,2) order by code_nm")%>
                            </data>
                            </gw:list>
                        </td>
                    </tr>
                   
                    <tr style="height:5%">
                        <td nowrap >
                            Current Addr</td>
                        <td nowrap  colspan=4 >
                            <gw:textbox id="txtLivingAdd"  text="" maxlen = "100" styles='width:100%' />
                        </td>   
                        <td>
                        </td>         
                        <td nowrap ><a title="Click here to show nation code" onclick="OnShowPopup('HR0009',lstNation)" href="#tips" >
                            Nation(*)</a></td>
                        <td nowrap >
                            <gw:list  id="lstNation" value="02" styles='width:100%'>
                            <data>
                                <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' and code<>'01' order by code_nm")%>
                            </data>
                            </gw:list> 
                        </td>
                        <td nowrap >
                        </td>
                         <td nowrap ><a title="Click here to show sex code" onclick="OnShowPopup('HR0007',lstSEX)" href="#tips" >
                            Sex</a></td>
                        <td nowrap >
                            <gw:list  id="lstSEX" value=" " styles='width:100%'>
                            <data>
                                <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0007' order by code_nm")%>||
                            </data>
                            </gw:list>
                        </td>
                    </tr>
                   
                    
                    <tr style="height:5%">
                        <td nowrap >Phone Number</td>
                        <td nowrap ><gw:textbox id="txtTel"  text="" maxlen = "15" styles='width:100%' tabindex="35"  />
                        </td> 
                        <td nowrap  >
                        </td>
                        <td nowrap  >Status(*)</td>
                        <td nowrap  ><gw:list  id="lstStatus"   maxlen = "100" styles='width:100%' value="551">       
                            <data>
                                <%=CtlLib.SetListDataSQL("select code,code_nm from vhr_hr_code where id='HR0022' order by code_nm")%>
                            </data>
                             </gw:list>   </td>
                        <td nowrap  ></td>
                        <td nowrap  >Leave Date</td>
                        <td nowrap  >
                            <gw:datebox id="dtLeaveDT"  text="" maxlen = "10" styles='width:90%' lang="<%=Session("Lang")%>" nullaccept /> 
                        </td>
                        <td nowrap  >
                        </td>
                        <td nowrap  ><a title="Click here to show resign type" onclick="OnShowPopup('HR0004',lstResignType)" href="#tips" >
                            Resign Type</a></td>
                        <td nowrap  >
                            <gw:list  id="lstResignType" maxlen = "100" value=" " styles='width:100%'> 			        
                            <data>
                                <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0004' order by code_nm")%>||
                            </data>
                             </gw:list>
                        </td>
                        
                    </tr>
                    <tr style="height:5%">
                        <td colspan=11 style="border:1;width:100%;height:7%" align=center>
                            <fieldset style="height:100%;width:70%  " > 
                                <legend style="color:#990066">Passport</legend>
                               <table cellpadding=0 cellspacing=0 border=0 id="tblexp" style="height:10%;width:100%" >
                                    <tr style="width:100%;height:5%" valign="top"  >
                                        <td nowrap width=15% align=center valign=bottom>Number</td>
                                        <td nowrap  width=15% valign=bottom>
                                            <gw:textbox id="txtPP_Number"  text="" maxlen = "15" styles='width:100%' tabindex="35"  />
                                        </td>
                                        <td nowrap width="15%" align=center valign=bottom>Issue Date</td>
                                        <td nowrap width="15%" valign=bottom>
                                             <gw:datebox id="dtPP_Issue_DT"  text="" maxlen = "10" styles='width:90%' lang="<%=Session("Lang")%>" nullaccept /> 
                                        </td>
                                        <td nowrap width="15%" align=center valign=bottom>Expiry Date</td>
                                        <td nowrap width="15%" valign=bottom>
                                             <gw:datebox id="dtPP_Expiry_DT"  text="" maxlen = "10" styles='width:90%' lang="<%=Session("Lang")%>" nullaccept /> 
                                        </td>
                                        <td nowrap  width=10% align=right valign=bottom> <gw:imgBtn img="create" id="ibtnPP_Create"   alt="Create New"  onclick="OnCreateNew(1)"/></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                     <tr style="height:5%">
                        <td colspan=11 style="border:1;width:100%;height:7%" align=center>
                            <fieldset style="height:100%;width:70%  " > 
                                <legend style="color:#990066">Visa/Residence </legend>
                               <table cellpadding=0 cellspacing=0 border=0 id="Table1" style="height:10%;width:100%" >
                                    <tr style="width:100%;height:5%" valign="top"  >
                                        <td nowrap width=15% align=center valign=bottom>Number</td>
                                        <td nowrap  width=15% valign=bottom>
                                            <gw:textbox id="txtVR_Number"  text="" maxlen = "15" styles='width:100%' tabindex="35"  />
                                        </td>
                                        <td nowrap width="15%" align=center valign=bottom>Issue Date</td>
                                        <td nowrap width="15%" valign=bottom>
                                             <gw:datebox id="dtVR_Issue_DT"  text="" maxlen = "10" styles='width:90%' lang="<%=Session("Lang")%>" nullaccept /> 
                                        </td>
                                        <td nowrap width="15%" align=center valign=bottom>Expiry Date</td>
                                        <td nowrap width="15%" valign=bottom>
                                             <gw:datebox id="dtVR_Expiry_DT"  text="" maxlen = "10" styles='width:90%' lang="<%=Session("Lang")%>" nullaccept /> 
                                        </td>
                                        
                                        <td nowrap  width=10% align=right valign=bottom> <gw:imgBtn img="create" id="ibtnVR_Create"   alt="Create New"  onclick="OnCreateNew(2)"/></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height:5%">
                        <td colspan=11 style="border:1;width:100%;height:7%" align=center>
                            <fieldset style="height:100%;width:70%  " > 
                                <legend style="color:#990066">Working Permit </legend>
                               <table cellpadding=0 cellspacing=0 border=0 id="Table2" style="height:10%;width:100%" >
                                    <tr style="width:100%;height:5%" valign="top"  >
                                        <td nowrap width=15% align=center valign=bottom>Number</td>
                                        <td nowrap  width=15% valign=bottom>
                                            <gw:textbox id="txtWP_Number"  text="" maxlen = "15" styles='width:100%' tabindex="35"  />
                                        </td>
                                        <td nowrap width="15%" align=center valign=bottom>Issue Date</td>
                                        <td nowrap width="15%" valign=bottom>
                                             <gw:datebox id="dtWP_Issue_DT"  text="" maxlen = "10" styles='width:90%' lang="<%=Session("Lang")%>" nullaccept /> 
                                        </td>
                                        <td nowrap width="15%" align=center valign=bottom>Expiry Date</td>
                                        <td nowrap width="15%" valign=bottom>
                                             <gw:datebox id="dtWP_Expiry_DT"  text="" maxlen = "10" styles='width:90%' lang="<%=Session("Lang")%>" nullaccept /> 
                                        </td>
                                        
                                        <td nowrap  width=10% align=right valign=bottom> <gw:imgBtn img="create" id="ibtnWP_Create"   alt="Create New"  onclick="OnCreateNew(3)"/></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                    <tr style="height:5%">
                        <td colspan=11 style="border:1;width:100%;height:7%" align=center>
                            <fieldset style="height:100%;width:70%  "> 
                                <legend style="color:#990066">Rental House Detail</legend>
                               <table cellpadding=0 cellspacing=0 border=0 id="Table3" style="height:10%;width:100%" >
                                    <tr style="width:100%;height:5%" valign="top"  >
                                        <td nowrap width=12% align=center valign=bottom> Rental Fee($) </td>
                                        <td nowrap  width=12% valign=bottom>
                                            <gw:textbox id="txtRT_Fee"  text="" maxlen = "15" styles='width:100%' tabindex="35"  />
                                        </td>
                                        <td nowrap width="12%" align=center valign=bottom> Deposit(VND) </td>
                                        <td nowrap width="12%" valign=bottom>
                                            <gw:textbox id="txtRT_Deposit"  text="" maxlen = "15" styles='width:100%' tabindex="35"  />
                                        </td>
                                        <td nowrap width="12%" align=center valign=bottom>Issue Date</td>
                                        <td nowrap width="12%" valign=bottom>
                                             <gw:datebox id="dtRT_Issue_DT"  text="" maxlen = "10" styles='width:90%' lang="<%=Session("Lang")%>" nullaccept /> 
                                        </td>
                                         <td nowrap width="12%" align=center valign=bottom>Expiry Date</td>
                                        <td nowrap width="12%" valign=bottom>
                                             <gw:datebox id="dtRT_Expiry_DT"  text="" maxlen = "10" styles='width:90%' lang="<%=Session("Lang")%>" nullaccept /> 
                                        </td>
                                        <td nowrap  width=4% align=right valign=bottom> <gw:imgBtn img="create" id="ibtnRT_Create"   alt="Create New"  onclick="OnCreateNew(4)"/></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
<form name="Expand" id="form2">
    <table id="expand" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;">
        <tr style="width:100%;height:100%" valign="top">
            <td>
               <table width="100%" style="height:100%" border=1 cellpadding="0" cellspacing="0">
                    <tr style="border:1;width:100%;height:5%" valign="top" >
                        <td style="border:1;width:97%" align="center" valign="center">
                            <gw:label id="lblEmployee"  maxlen = "100" styles="color:red;width:90%;font-weight: bold;font-size:15" />
                        </td>
                        <td style="border:1;width:3%" align="right" valign="center"> <gw:button  id="ibtnMainReport" alt="All information" img="excel" text="Report" onclick="OnAllReport()" />
                        </td>
                    </tr>
                    <tr style="width:100%;height:95%">
                        <td colspan=2 style="border:1;width:100%;height:95%">
                            <fieldset style="height:100%"> 
                               <table width="100%" id="tblfam" style="height:100%" border=1 cellpadding="0" cellspacing="0">
                                  <tr style="width:100%;height:5%" valign="top" >
                                        <td width="88%" style="border:0;"  align="left" valign="center"><font color="#990066" size="2" >Family</font>
                                        </td>
                                        <td width="3%" style="border:0;" align="right" >
                                         <gw:button img="new" id="ibtnAdd_F" text="Add New"  alt="Add New"  onclick="OnAddNew_E()"/>
                                        </td>
                                         <td width="3%" style="border:0;" align="right" >
                                         <gw:button img="save" id="ibtnSave_F" text="Save"   alt="Save"  onclick="OnSave_E()"/>
                                        </td>
                                        <td width="3%" style="border:0;" align="right" >
                                         <gw:button img="delete" id="ibtnDelete_F"  text="Delete"  alt="Delete"  onclick="OnDelete_E()"/>
                                        </td>
                                        <td width="3%" style="border:0" align="right">
                                        </td>
                                    </tr>
                                    
                                    <tr style="border:1;width:100%;height:25%" valign="top">
                                        <td colspan=5 style="width:100%;height:100%"> 
                                             <gw:grid id="grdFamily"  
                                                header='_PK|_THR_EMPLOYEE_PK|Full Name|Relation|Birth Date|Sex|Nation|Create New|_PK|Passport No.|Issue Date|Expiry Date|Create New|_PK|Visa No.|Issue Date|Expiry Date'
                                                format='0|0|0|2|0|2|2|3|0|0|4|4|3|0|0|4|4'
                                                aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                                check='||||||||||||||||'
                                                editcol='1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                                                widths='1000|1000|3000|1400|1000|1000|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200|1200'
                                                sorting='T'
                                                acceptNullDate
                                                styles='width:100%; height:460'
                                                />   
                                                
                                        </td>
                                    </tr>
                               </table> 
                            </fieldset>
                        </td>
                    </tr>
               </table> 
               
               
            </td>
        </tr>
    </table>
</form> 
<form name="Management">
<table name="Management" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;">
        <tr style="width:100%;height:100%" valign="top">
            <td>
               <table width="100%" id="Table4" style="height:100%" border=1 cellpadding="0" cellspacing="0">
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(3,'')" href="#tips"  >Oganization</a>
                        </td>
                        <td colspan=15 width="15%" style="border:0"  align="left" >
                            <gw:list  id="lstOrg_Code_M" value='ALL' maxlen = "100" styles='width:100%' onchange="onChange_org(3,lstOrg_Code_M)" >
								<data>
									<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk) or '" + session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
								</data>
							</gw:list>
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Group
                        </td>
                        <td colspan=15 style="border:0" width="15%"  align="left" >
                            <gw:list  id="lstGrp_Code_M" value='ALL' maxlen = "100" styles='width:100%' >
								<data><%=CtlLib.SetListDataSQL("select a.PK,a.WORKGROUP_NM from thr_work_group a where a.del_if=0 order by a.WORKGROUP_NM")%>|ALL|Select All</data>
							</gw:list>
                        </td>
                        <td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Employee
                        </td>
			            <td colspan=15 width="15%" style="border:0"> 
				            <gw:textbox id="txtEmployee_M" onenterkey   ="OnSearch(2)" styles="width:95%"/>
			            </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
						
                        </td>
			            <td colspan=5 width="5%" style="border:0" align="left"> 
				            <gw:button img="search" text="Search" id="ibtnSearch_M"   alt="Search"  onclick="OnSearch(2)"/>
			            </td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
				            <gw:button img="save" text="Save" id="ibtnSave_M"    alt="Save"  onclick="OnSave(2)"/>
			            </td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
				            <gw:button img="excel" text="Report" id="ibtnDetPrinter"    alt="Report"  onclick="OnReport(2)"/>
			            </td>
                    </tr>
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Position
                        </td>
                        <td colspan=15 width="15%" style="border:0"  align="left" >
                            <gw:list  id="lstPosition_M" value='ALL' maxlen = "100" styles='width:100%' >
								<data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0008' and num_4 in (1,2) order by code_nm")%>|ALL|Select All</data>
							</gw:list>
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Nation
                        </td>
                        <td colspan=15 style="border:0" width="15%"  align="left" >
                            <gw:list  id="lstNation_M" value='02' maxlen = "100" styles='width:100%' >
                                <data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0009' and code<>'01' order by code_nm")%>|ALL|Select All</data>
							</gw:list>
                        </td>
                        <td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Birth Date
                        </td>
			            <td colspan=7 width="7%" style="border:0" align="left">
							<gw:datebox id="dtFrom_BirthDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
                        </td>
                        <td colspan=8 width="8%" style="border:0" align="left">
							<gw:datebox id="dtTo_BirthDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
						
                        </td>
			            <td colspan=5 width="5%" style="border:0"  align="left" >
							<gw:button id="ibtnReport" alt="Report" img="excel" text="Report" onclick="OnReport()"/>
						</td>
						<td colspan=10 width="10%" style="border:0"  align="left" >
							<gw:list  id="lstReport" styles="color:blue;width:100%" onchange=""/> 
						</td>
                    </tr>
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Status
                        </td>
                        <td colspan=15 width="15%" style="border:0"  align="left" >
                            <gw:list  id="lstStatus_M" value='A' maxlen = "100" styles='width:100%'>
								<data>
									<%=CtlLib.SetListDataSQL("select code,code_nm from vhr_hr_code where id='HR0022' order by code_nm")%>|ALL|Select All
								</data>
							</gw:list>
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Sex
                        </td>
                        <td colspan=15 style="border:0" width="15%"  align="left" >
                            <gw:list  id="lstSex_M" value="ALL" styles='width:100%' onchange=""> 
								<data><%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0007' order by code_nm" )%>|ALL|Select All</data>
							</gw:list>
                        </td>
                        <td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Left Date
                        </td>
			            <td colspan=7 width="7%" style="border:0" align="left">
							<gw:datebox id="dtFrom_LeftDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
                        </td>
                        <td colspan=8 width="8%" style="border:0" align="left">
							<gw:datebox id="dtTo_LeftDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Join Date
                        </td>
			            <td colspan=7 width="7%" style="border:0" align="left">
							<gw:datebox id="dtFrom_JoinDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
                        </td>
                        <td colspan=8 width="8%" style="border:0" align="left">
							<gw:datebox id="dtTo_JoinDate" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
                        </td>
                    </tr>
                    
                    
                   
                    <tr style="border:1;width:100%;height:75%" valign="top">
                        <td colspan=100 style="width:100%;height:100%;"> 
                                <gw:grid id='grdManage'
                                    header='_PK|Organization|_ORG_PK|Work Group|Emp ID|Full Name|Join Date|Birth Date|Tel|Current Addr|Sex|Nation|Position|Job Title|Email|Status|Left Date|Resignation Type|Pit Tax No|_PK|Passport No.|Issue Dt|Expiry Dt|_PK|Visa No.|Issue Dt|Expiry Dt|_PK|Labour No.|Issue Dt|Expiry Dt|_PK|Rental Amt|Deposit Amt|Issue Dt|Expiry Dt'
                                    format='0|0|0|2|0|0|4|0|0|0|2|2|2|2|0|0|0|0|0|0|0|4|4|0|0|4|4|0|0|4|4|0|1|1|4|4'
                                    aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                                    check='|||||||||||||||||||||||||||||||||||'
                                    editcol='0|0|0|1|0|1|0|0|1|1|1|1|1|1|1|0|0|0|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1|1'
                                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                                    sorting='T'
                                    autosize='T'  acceptNullDate
                                    styles='width:100%; height:100%'
                                    oncelldblclick = "Popup()"
                                    />
                        </td>
                    </tr>
               </table> 
            </td>
        </tr>
    </table>
</form>
<form name="Expiry">
<table id="Expiry" name="Expiry" width="100%" cellpadding="0" cellspacing="0" border=1 style="width:100%;height:100%;">
        <tr style="width:100%;height:100%" valign="top">
            <td>
               <table width="100%" id="Table5" style="height:15%" border=1 cellpadding="0" cellspacing="0">
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							<a class="eco_link" title="Click here to show Organization" onclick="OnShowPopup(3,0)" href="#tips"  >Oganization</a>
                        </td>
                        <td colspan=15 width="15%" style="border:0"  align="left" >
                            <gw:list  id="lstOrg_Code_E" value='ALL' maxlen = "100" styles='width:100%' onchange="onChange_org(4,lstOrg_Code_E)"  >
								<data>
									<%=CtlLib.SetListDataSQL("select a.pk,lpad('.',level*2-1,'.')|| a.org_nm from tco_org a  where a.del_if = 0 and (a.tco_company_pk=nvl('" + session("COMPANY_PK") + "',a.tco_company_pk) or '" + session("HR_LEVEL") + "'='6')  AND NVL(A.END_DATE,TO_CHAR(SYSDATE+1,'YYYYMMDD')) >  TO_CHAR(SYSDATE,'YYYYMMDD') connect by prior a.pk = a.p_pk start with nvl(a.p_pk,0)=0 order siblings by a.org_id")%>|ALL|Select All
								</data>
							</gw:list>
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Group
                        </td>
                        <td colspan=15 style="border:0" width="15%"  align="left" >
                            <gw:list  id="lstGrp_Code_E" value='ALL' maxlen = "100" styles='width:100%' >
								<data><%=CtlLib.SetListDataSQL("select a.PK,a.WORKGROUP_NM from thr_work_group a where a.del_if=0 order by a.WORKGROUP_NM")%>|ALL|Select All</data>
							</gw:list>
                        </td>
                        <td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Employee
                        </td>
			            <td colspan=15 width="15%" style="border:0"> 
				            <gw:textbox id="txtEmployee_E" onenterkey   ="OnSearch(3)" styles="width:95%"/>
			            </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							<gw:label id="lblRecord_E"  text="" maxlen = "100" styles="color:red;width:90%;font-weight: bold;font-size:12" />
                        </td>
			            <td colspan=5 width="5%" style="border:0" align="left"> 
				            <gw:button img="search" text="Search" id="ibtnSearch_E"   alt="Search"  onclick="OnSearch(3)"/>
			            </td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
				            <gw:button img="save" text="Save" id="ibtnSave_E"    alt="Save"  onclick="OnSave(3)"/>
			            </td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
				            
			            </td>
                    </tr>
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Status
                        </td>
                        <td colspan=15 width="15%" style="border:0"  align="left" >
                            <gw:list  id="lstStatus_E" value='A' maxlen = "100" styles='width:100%'>
								<data>
									<%=CtlLib.SetListDataSQL("select code,code_nm from vhr_hr_code where id='HR0022' order by code_nm")%>|ALL|Select All
								</data>
							</gw:list>
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Kind
                        </td>
                        <td colspan=15 style="border:0" width="15%"  align="left" >
                            <gw:list  id="lstKind" value='ALL' maxlen = "100" styles='width:100%' onchange="OnChangeKind()">
								<data>|01|Passport|02|Visa/Residence|03|Working Permit|04|Rental House</data>
							</gw:list>
                        </td>
                        <td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Expiry Period
                        </td>
			            <td colspan=7 width="7%" style="border:0" align="left">
							<gw:datebox id="dtExpiry_From" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
                        </td>
                        <td colspan=8 width="8%" style="border:0" align="left">
							<gw:datebox id="dtExpiry_To" nullaccept styles="width:100%" lang="<%=Session("Lang")%>" />
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							
                        </td>
			            <td colspan=5 width="5%" style="border:0"  align="left" >
							<gw:button id="ibtnReport2" alt="Report" img="excel" text="Report" onclick="OnReport()"/>
						</td>
						<td colspan=10 width="10%" style="border:0"  align="left" >
							<gw:list  id="lstReport2" styles="color:blue;width:100%" onchange=""/> 
						</td>
                    </tr>
					<tr style="border:0;width:100%;height:4%" valign="center" >
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Include
                        </td>
                        <td colspan=15 width="15%" style="border:0"  align="left" >
                            <gw:list  id="lstInclude" value='ALL' maxlen = "100" styles='width:100%' onchange="OnChangeInclude()" >
								<data>|01|Employee|02|Family|ALL|Select All</data>
							</gw:list>
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							<gw:list  id="lstSet" value='ALL' maxlen = "100" styles='width:100%' onchange="OnChangeInclude()" >
								<data>|01|Number</data>
							</gw:list>
                        </td>
                        <td colspan=13 style="border:0" width="13%"  align="left" >
                            <gw:textbox id="txtNumber" styles="width:100%"/>
                        </td>
						<td colspan=2 width="2%" style="border:0"  >
							<gw:imgBtn img="set" id="ibtnSet_2"   alt="Set Grid"  onclick="OnSetGrid(1)"/>
                        </td>
                        <td colspan=2 width="2%" style="border:0"  >
						
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Issue Date
                        </td>
			            <td colspan=5 width="5%" style="border:0"> 
				            <gw:datebox id="dtIssue_DT"  maxlen = "10" text="" styles='width:100%' lang="<%=Session("Lang")%>" nullaccept />
			            </td>
						<td colspan=5 width="5%" style="border:0"> 
				            <gw:imgBtn img="set" id="ibtnSet_1"   alt="Set Grid"  onclick="OnSetGrid(2)"/>
			            </td>
						<td colspan=5 width="5%" style="border:0" align="left"> 
				            
			            </td>
						<td colspan=2 width="2%" style="border:0" align="right" >
							
                        </td>
                        <td colspan=8 width="8%" style="border:0"  align="left" >
							Expiry Date
                        </td>
			            <td colspan=5 width="5%" style="border:0"> 
				            <gw:datebox id="dtExpiry_DT"  maxlen = "10" text="" styles='width:100%' lang="<%=Session("Lang")%>" nullaccept />
			            </td>
						<td colspan=5 width="5%" style="border:0"> 
				            <gw:imgBtn img="set" id="ibtnSet_3"   alt="Set Grid"  onclick="OnSetGrid(3)"/>
			            </td>
						<td colspan=2 width="2%" style="border:0"> 
				            Create
			            </td>
						<td colspan=2 width="2%" style="border:0"> 
				            <gw:checkbox id="chkCreateNew" value="F" onclick="OnSetGrid(4)" ></gw:checkbox >
			            </td>
						<td colspan=1 width="1%" style="border:0"> 
				            <img status="expand" id="imgArrow" src="../../../../system/images/iconmaximize.gif" alt="Show history"  style="cursor:hand" onclick="OnToggle()"  />
			            </td>
                    </tr>
                    
            </table>
            <table style="width:100%;height:45%"  id="tblMainHist" valign="top" cellpadding="0" cellspacing="0">
              <tr style="width:100%;height:100%">
                <td style="width:100%;height:100%">
              <gw:grid id='grdPP'
                    header='_PK|Organization|WGroup|Emp ID|Full Name|Join DT|Position|_REL_PK|Relation Name|Relation|Create New|_PK|Passport No.|_temp|Issue Date|Exipry Date'
                    format='0|0|0|0|0|0|0|0|0|0|3|0|0|0|4|4'
                    aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    check='|||||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1'
                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' acceptNullDate
                    autosize='T' 
                    styles='width:100%; height:100%'
                    oncellclick = "OnShowHis()"
                    />
              <gw:grid id='grdVR'
                    header='_PK|Organization|WGroup|Emp ID|Full Name|Join DT|Position|_REL_PK|Relation Name|Relation|Create New|_PK|Visa No.|_temp|Issue Date|Exiry Date'
                    format='0|0|0|0|0|0|0|0|0|0|3|0|0|0|4|4'
                    aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    check='|||||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1'
                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' acceptNullDate
                    autosize='T' 
                    styles='width:100%; height:100%'
                    oncellclick = "OnShowHis()"
                    />
               <gw:grid id='grdWP'
                    header='_PK|Organization|WGroup|Emp ID|Full Name|Join DT|Position|_REL_PK|Relation Name|Relation|Create New|_PK|Working Permit No.|_temp|Issue Date|Exiry Date'
                    format='0|0|0|0|0|0|0|0|0|0|3|0|0|0|4|4'
                    aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    check='|||||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1'
                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' acceptNullDate
                    autosize='T' 
                    styles='width:100%; height:100%'
                    oncellclick = "OnShowHis()"
                    />
              <gw:grid id='grdRT'
                    header='_PK|Organization|WGroup|Emp ID|Full Name|Join DT|Position|_REL_PK|Relation Name|Relation|Create New|_PK|Rental Amt|Deposit Amt|Issue Date|Exiry Date'
                    format='0|0|0|0|0|0|0|0|0|0|3|0|1|1|4|4'
                    aligns='0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0'
                    check='|||||||||||||||'
                    editcol='0|0|0|0|0|0|0|0|0|0|1|1|1|1|1|1'
                    widths='1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000|1000'
                    sorting='T' acceptNullDate
                    autosize='T' 
                    styles='width:100%; height:100%'
                    oncellclick = "OnShowHis()"
                    />
                </td>
            </tr>
        </table>
        <table border=1 style="width:100%;height:40%"  id="tblHist" valign="top" cellpadding="0" cellspacing="0">                
            <tr style="width:100%;height:100%"  valign="top">
                <td colspan=15 style="width:100%;height:100%; border:1"> 
                          <gw:grid id='grdForeigner_Hist'
                                header='Emp ID|Full Name|Number|Temp|Issue Date|Expiry Date'
                                format='0|0|0|0|0|0'
                                aligns='0|0|0|0|0|0'
                                check='||||||'
                                editcol='0|0|0|0|0|0'
                                widths='2000|2000|2000|2000|2000|2000'
                                sorting='T' acceptNullDate
                                styles='width:100%; height:100%'
                                />
                        
                </td>
            </tr>
       </table> 
            </td>
        </tr>
    </table>
</form>
</gw:tab>
  
     <gw:textbox id="txtComCodeID" styles="display:none"/>	
     <gw:textbox id="txtDept" styles="display:none"/>
	<gw:textbox id="txtOrg" styles="display:none"/>	 
     <gw:textbox id="txtDeptData" styles="display:none"/>
	 <gw:textbox id="txtOrgData" styles="display:none"/>
    <gw:textbox id="txtUpperDept" styles="display:none"/>
	<gw:textbox id="txtUpperOrg" styles="display:none"/>
    <gw:textbox id="txtGroupData" styles="display:none"/>
    <gw:textbox id="txtEmp_PK" styles="display:none"/>
    <gw:textbox id="txtPhoto_PK" styles="display:none"/>
    <gw:textbox id="txtFull_FName" styles="display:none"/>
    <gw:textbox id="txtExistTemp" styles="display:none"/>
    <gw:textbox id="txtFlag" styles="display:none"/>
   
    <gw:textbox id="txtDelete_Flag" styles="display:none"/>
    <gw:textbox id="txtAllowance" text="HR0019" styles="display:none"/>
    <gw:textbox id="txtBackNext" styles="display:none"/>
    <gw:textbox id="txtEmp_PK_E" styles="display:none" />
    <gw:textbox id="txtEmp_PK_NB" styles="display:none" />
    <gw:textbox id="txtUser_PK" styles="display:none"/>
    <gw:textbox id="txtHr_level" styles="display:none"/>
    <gw:textbox id="txt_Employee_ByHand"  styles="display:none"/>
    <gw:textbox id="txt_Employee_ByHand_YN"  styles="display:none"/>
    
    <gw:textbox id="txt_Exist_Emp_ID" text="" styles="display:none"/>
    
    <gw:textbox id="txtManager_id"  text="0" styles="display:none"  />
    <gw:textbox id="txtRec_PK" text="" styles="display:none"  />
    <gw:textbox id="txtClose_YN" text="" styles="display:none"  />
    <gw:textbox id="txt_sal_security" text="" styles="display:none"  />
    <gw:textbox id="txt_First_use" text="" styles="display:none"  />
    <gw:textbox id="txtCodeTemp" styles="display:none" text=""/>
    <gw:textbox id="txtPP_PK" styles="display:none" text=""/>
    <gw:textbox id="txtVR_PK" styles="display:none" text=""/>
    <gw:textbox id="txtWP_PK" styles="display:none" text=""/>
    <gw:textbox id="txtRT_PK" styles="display:none" text=""/>
    <gw:textbox id="txtPersonalID" styles="display:none" text=""/>
    <gw:textbox id="txtOrgPK" styles="display:none"/>
    <gw:textbox id="txtReport_tmp" styles="display:none"/>
    <gw:textbox id="txtEmp_His_PK" styles="display:none"/>
    <gw:textbox id="txtFamily_His_PK" styles="display:none"/>
    <gw:textbox id="txtTemp_His_PK" styles="display:none"/>
    <gw:textbox id="menu_id" text="" styles="display:none"  />
    <gw:textbox id="txtFlag_View" text="" styles="display:none"  /> 
    <gw:textbox id="iduser_pk" styles="display:none"/>

<gw:list  id="lstReport_E" styles="color:blue;width:100%;display:none" onchange=""> 
					             <data><%=CtlLib.SetListDataSQL("select char_2,CODE_NM from vhr_hr_code where id='HR0156' and char_1='chae00730' and char_4='4' order by seq")%></data>
			            </gw:list>
<gw:textbox id="txtOrgNM" styles="display:none"/>
<gw:textbox id="txtorg_tmp" styles="display:none"/>
	<gw:textbox id="txtwg_tmp" styles="display:none"/> 
</body>


