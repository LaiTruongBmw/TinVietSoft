<!-- #include file="../../../../system/lib/form.inc"  -->
 <% CtlLib.SetUser(Session("APP_DBUSER"))%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        #d_main{
            background-color:#e6fbe3;
            float:left;
            width:100%;
            height:98%;
            border:1px solid #62ac0d;
        }
        #d_search {
            float: left;
            width: 25%;
            height:90%
        }
        #d_entry {
            float: left;
            width: 100%;
            height:90%;
        }
        #d_entry1{
            float: left;
            margin-left:10px;
            margin-right:10px;
            width: 97%;
            height:45%
        }
        #d_entry2{
            float: left;
            margin-left:10px;
            margin-right:10px;
            margin-top:5px;
            width: 97%;
            height:48%
        }
        #d_entry21{
            float: left;
            margin-top:5px;
            width: 100%;
            height:50%
        }
        #d_entry22{
            float: left;
            margin-top:5px;
            width: 50%;
            height:50%
        }
        #d_option{
            float: left;
            width: 20%;
            height:5%;
            background-color:#feffa7;
            vertical-align:center;
        }
        #d_option1{
            float: left;
            margin-left:10px;
            width: 20%;
            height:5%;
            background-color:#feffa7;
            ertical-align:center;
        }
		
        .txt_note{
			color : red !important;
		}
    </style>
</head>
<script type="text/javascript">
    /*******************************************************************************************************************
    * Description: Nhap thong tin nhan vien
    * - Bao gom nhung thong tin co ban nhat cua nhan vien
    *
    *
    *******************************************************************************************************************/

    
    var check_init = 0;
    var flag_show = 1;
    var bdelete = false;
    var binit = true;
    var flag_allowance = 0;
    var iale_days = 12;
	var v_language = "<%=Session("SESSION_LANG")%>";

function BodyInit() {
	System.Translate_V2(document, System.Menu.GetMenuPS());
    txtCompany_pk.text = "<%=Session("COMPANY_PK")%>";
    txtUser_PK.text = "<%=session("USER_PK")%>";
    txtHr_level.text = "<%=session("HR_LEVEL")%>";
    iale_days = "<%=CtlLib.SetDataSQL("select nvl(num_1,12) from vhr_hr_code where id='HR0006' and code='05'")%>";
    if (iale_days == "")
        iale_day = 12;
    //d_entry.style.width = "100%";
    //tab2.style.backgroundColor = "#fa8c8c";
    grdSearchEmp.GetGridControl().ScrollTrack = true;
    
    OnShowHide();
    BindingDataList();
	ChangeColorItem(lstOrg_Code.GetControl());
	ChangeColorItem(lstOrg_Code_s.GetControl());
    l_flag_load.text = "ALL";
    datPro_load_form.Call();
}
function BindingDataList()
{
	var data;
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0017', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstEmp_Type.SetDataText(data);
	lstEmp_Type.value =" ";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstStatus.SetDataText(data);
	lstStatus.value ="A";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE('HR0022', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstStatus_s.SetDataText(data);
	lstStatus_s.value ="A";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0004', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstResignType.SetDataText(data);
	lstResignType.value =" ";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST2('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg_Code.SetDataText(data);
	lstOrg_Code.value =" ";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST('ORG', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstOrg_Code_s.SetDataText(data);
	lstOrg_Code_s.value ="ALL";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST2('GROUP', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";
	lstWork_Grp.SetDataText(data);
	lstWork_Grp.value =" ";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0009', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstNation.SetDataText(data);
	lstNation.value ="01";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0021', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstBirthPlace.SetDataText(data);
	lstBirthPlace.value =" ";
	lstNativeCountry.SetDataText(data);
	lstBirthPlace.value =" ";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0008', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstPosition.SetDataText(data);
	lstPosition.value =" ";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0014', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstPlaceID.SetDataText(data);
	lstPlaceID.value =" ";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0010', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstJob.SetDataText(data);
	lstJob.value =" ";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0007', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstSEX.SetDataText(data);
	lstSEX.value =" ";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0015', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstEthnic.SetDataText(data);
	lstEthnic.value =" ";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0016', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstReligion.SetDataText(data);
	lstReligion.value =" ";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0011', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstEducation.SetDataText(data);
	lstEducation.value =" ";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_LIST2('MARITAL', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstMarial.SetDataText(data);
	lstMarial.value =" ";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0002', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstProKind.SetDataText(data);
	lstProKind.value =" ";
	
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0001', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstContractKind.SetDataText(data);
	lstContractKind.value =" ";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0020', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstBank.SetDataText(data);
	lstBank.value =" ";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0116', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstBankBranch.SetDataText(data);
	lstBankBranch.value =" ";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0023', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstPayType.SetDataText(data);
	lstPayType.value =" ";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0040', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstMoneyKind.SetDataText(data);
	lstMoneyKind.value ="01";
	
	data = "<%=CtlLib.SetListDataFUNC("SELECT ST_HR_GET_HRCODE2('HR0056', '" + Session("SESSION_LANG").ToString() + "') FROM DUAL" )%>";    
	lstSalaryType.SetDataText(data);
	lstSalaryType.value =" ";
	
	
}
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
    //--------------------------------------------------
    function OnDataReceive(obj) 
	{
        if (obj.id == "datPro_load_form") 
		{
            if (l_flag_load.text == "ALL")//load all
            {	
                //gan lai cac gia tri
                txtFlag_View.text = l_txtFlag_View.text;
                lblMaxID.text = l_lblMaxID.text;
                txt_sal_security.text = l_txt_sal_security.text;
                txt_First_use.text = l_txt_First_use.text;
                txt_Employee_ByHand.text = l_txt_Employee_ByHand.text;
                //OnOption(exp1, tab1);
                if (txtFlag_View.text == 'Y') {
                    ibtnUpdate.style.display = "none";
                    ibtnDelete.style.display = "none";
                    ibtnResetE.style.display = "none";

                }
                
                if (txt_sal_security.text == 'Y') {
                    tab_04.style.display = "";
                }
                else {
                    tab_04.style.display = "none";
                 
                }


                if ((Trim(txtUser_PK.text) != "") && (txtHr_level.text == "1")) //QUYEN BI GIOI HAN 
                    datUser_info.Call();
                else //ket thuc load form
                {	
					check_init = 1;
						
				}

            }
            else if (l_flag_load.text == "MAX_ID")//load only max id
            {
                lblMaxID.text = l_lblMaxID.text;
            }
			datAllowance.Call();
        }

         if (obj.id == "datEmployee") {
             l_exp = 0;
             //ibtnResetE.SetEnable(true);
             txt_Employee_ByHand.text = txt_Employee_ByHand_YN.text;
             if (bdelete == true) //delete information
             {
                 bdelete = false;
                 OnReset();
             }
             else //select and update information
             {
                 imgFile.SetDataText(txtPhoto_PK.text);
                 if (dtSTContract.value == "") //if employee have probation contract then you can modify probation type, but else can't
                 {
                     SetEnablePro(true);
                     if (lstProKind.value == "03") //other probation
                         dtEDProbate.SetEnable(true);
                     else
                         dtEDProbate.SetEnable(false);
                 }
                 else
                     SetEnablePro(false);
             }

             l_flag_load.text = "MAX_ID";
			 
			 //if(lstResignType.value != "")
			 //{
				//lstResignType.color = "red";
				document.getElementById("lstResignType").style.color = "red";
			 //}
			 
			 
             datPro_load_form.Call();
             
         }
		 if (obj.id=="datSearchEmployee_1")
		   {
                //alert(txtPhoto_PK.text);
				imgFile.SetDataText(txtPhoto_PK.text);
				var obj_lb_1 = document.getElementById("lb_left_date"); 
				var obj_lb_2 = document.getElementById("lb_resign_type");
				
				 if(lstStatus.value != "A"){
					obj_lb_1.className = "txt_note";
					obj_lb_2.className = "txt_note";
				 }else{
					obj_lb_1.className = "";
					obj_lb_2.className = "eco_link";
				 }
		   }
         if (obj.id == "datUser_info") 
		 {	alert("test2");
             ChangeColorItem(lstOrg_Code.GetControl());
             check_init = 1;
         }
         if(obj.id=="datCheckID")
			{   
				if(txt_Employee_ByHand.text=="Y")
					{
						OnCheckAdd();
					}             
			}
         if (obj.id == "datAllowance") {

             if (lblA1.text == "0") {
                 txtAllow1.style.display = "none";
                 lblA1.style.display = "none";

             }
             if (lblA2.text == "0") {
                 txtAllow2.style.display = "none";
                 lblA2.style.display = "none";

             }
             if (lblA3.text == "0") {
                 txtAllow3.style.display = "none";
                 lblA3.style.display = "none";

             }
             if (lblA4.text == "0") {
                 txtAllow4.style.display = "none";
                 lblA4.style.display = "none";

             }
             if (lblA5.text == "0") {
                 txtAllow5.style.display = "none";
                 lblA5.style.display = "none";

             }
             if (lblA6.text == "0") {
                 txtAllow6.style.display = "none";
                 lblA6.style.display = "none";

             }
             if (lblA7.text == "0") {
                 txtAllow7.style.display = "none";
                 lblA7.style.display = "none";

             }
             if (lblA8.text == "0") {
                 txtAllow8.style.display = "none";
                 lblA8.style.display = "none";

             }
         }

         if (obj.id == "datCheckExist") {
             if (txtFlag.text == 1) {
                 if (txtExistTemp.text != "") {
                     if (confirm("Have already person id of employee id:" + txtExistTemp.text + ", Do you want to continue?" + "\nĐã trùng số CMND với nhân viên : " + txtExistTemp.text + ", Bạn có muốn tiếp tục?")) {
                         txtFlag.text = "2";
                         datCheckExist.Call();
                     }
                     else
                         txtPersonalID.GetControl().focus();
                 }
                 else {
                     txtFlag.text = "2";
                     datCheckExist.Call();
                 }
             }
             else {
                 //alert(txtExistTemp.text);
                 if (txtExistTemp.text != "") {
                     alert("Have already card id of employee id:" + txtExistTemp.text + "\nĐã trùng card với nhân viên: " + txtExistTemp.text);
                     txtIDCard.GetControl().focus();
                 }
                 else
                 {
                     //alert(datEmployee.GetStatus());
                     txtPhoto_PK.text = imgFile.GetData();
                     //continue save info
                     if (datEmployee.GetStatus() == 10 || datEmployee.GetStatus() == 0) {
                         if (confirm("Do you want to update? \n Bạn có muốn cập nhật?")) {
                             datEmployee.StatusUpdate();
                             datEmployee.Call();
                         }
                     }
                     else if (datEmployee.GetStatus() == 20) {
                         if (txtEMPID.text == "" && txt_Employee_ByHand.text == "Y") {
                             alert("Please insert employee by hand!");
                             return;
                         }
                         if (txt_Exist_Emp_ID.text == "1" && txt_Employee_ByHand.text == "Y") {
                             alert((v_language =="ENG")?"You can't add new employee .\nEmployee id " + txtEMPID.text + " exists !":"Bạn không thể thêm nhân viên mới.\nMã nhân viên " + txtEMPID.text + " đã tồn tại !" );
                             return;
                         }

                         if (confirm("Do you want to add new employee? \n Bạn muốn thêm mới?")) {
                             txt_Employee_ByHand_YN.text = txt_Employee_ByHand.text;// luu gia tri byhand y/n
                             //alert(txtPhoto_PK.text);
                             datEmployee.Call();
                         }
                     }

                 }
             }
         }

         if (obj.id == "datEmpPK_Base_EmpID") {
             if (txtEmp_PK_NB.text == "-1")
                 alert("Can't find this employee with emp id like " + txtEMPID.text + "\n Không tìm thấy nhân viên này.");
             else {
                 txtEmp_PK.text = txtEmp_PK_NB.text;
				 //alert(txtEmp_PK.text);
                 datEmployee.Call("SELECT");
             }

         }
		 if (obj.id=="datProbationDate")
		   {
				if (lstProKind.value =="03") //have to input end probation
					dtEDProbate.SetEnable(true);
				else
					dtEDProbate.SetEnable(false);
				dtSTProbate.SetEnable(false);
					
		   }
    }
    //--------------------------------------------------
    function SetEnablePro(obj) {
        dtJoinDT.SetEnable(obj);
        dtSTProbate.SetEnable(false);
        dtEDProbate.SetEnable(false);
        lstProKind.SetEnable(obj);
    }
    //----------------------------------------------
    
    function OnReset() {
        lstContractKind.SetEnable(false);
        lstProKind.value = " ";
        dtSTContract.SetEnable(false);
        dtEDContract.SetEnable(false);
        SetEnablePro(true);
        if (datEmployee.GetStatus() != 20)
            datEmployee.StatusInsert();
        txtPhoto_PK.text = "";
        imgFile.SetDataText("");
        txtEmp_PK.text = "";
        txtEMPID.text = "";
		txtIDCard.text ="";
        txtFullName.text = "";
        lstStatus.value = "A";
        lstNation.value = "01";
        dtLeaveDT.text = "";
        lstBirthPlace.value = " ";
        lstBankBranch.value = " ";
        txtAnnualLeave.text = iale_days;
		txtBirthDT.text = "";
		dtJoinDT.value = "";
		lstEmp_Type.value = "";

        lstJob.value = " ";
        lstPosition.value = " ";
        lstEducation.value = " ";
        lstEthnic.value = "02";
        lstReligion.value = " ";
        dtSTContract.text = "";
        dtEDContract.text = "";
        dtSTProbate.text = "";
        dtEDProbate.text = "";
        lstContractKind.value = "01";
        lstBank.value = " ";
        txtContractNo.text = "";
        lstOTYN.value = "T";
        chkSocial.value="0";
        chkHealth.value="0";
        chkUnEmp.value = "0";
        lstResignType.value = " ";
        txtAccount.text = "";
        lstSalYN.value = "T";
        lstNetSal_YN.value = "F";
        lstAttYN.value = "T";
        lstSalaryType.value = "01";
        lstPayType.value = "01";
        lstMarial.value = " ";
        lstSEX.value = " ";
        lstPlaceID.value = " ";

        lstPlaceID.value = " ";
        lstNativeCountry.value = "";
        lstMoneyKind.value = "01";
        lstUnion.value = "0";
		lstOrg_Code.value = "";
		lstWork_Grp.value = "";
		txtPerAdd.text = "";
		txtLivingAdd.text = "";
		txtProSal.text = "";
		txtBasicSal.text = "";
		txtAllow1.text = "";
		txtAllow2.text = "";
		txtAllow3.text = "";
		txtAllow4.text = "";
		txtAllow5.text = "";
		txtAllow6.text = "";
		txtAllow7.text = "";
		txtAllow8.text = "";
        txtInsSal.text = "";
    }

    //--Kiem tra EmpID da ton tai hay chua khi su dung Byhand
    function CheckEmpID() {
        if (txt_Employee_ByHand.text == "Y" && txtEMPID.text != "") {
            datCheckID.Call();
        }

    }
    //------------------------------------------
    function OnUpdate() 
	{	
        if (check_init == 1) {
            if (txt_Employee_ByHand.text == "")
                txt_Employee_ByHand.text = "N";
            // Byhand
            if (txt_Employee_ByHand.text == "Y") {
                if (txtEMPID.text == "") {
                    alert((v_language =="ENG")?"Please insert employee Id":"Bạn hãy nhập mã nhân viên");
                    return;
                }
                if (datEmployee.GetStatus() == 20) //chi khi add new moi check 
                {
                    //alert(datEmployee.GetStatus())
                    CheckEmpID();
                }
                else
                    OnCheckAdd();
            }
            else
                OnCheckAdd();
        }

    }
    //----------------------------------------------
    function OnCheckAdd() {
        if (txtFullName.text == "") {
            alert("Please input full name! \n Vui lòng nhập họ và tên");
            txtFullName.GetControl().focus();
            return;
        }
		if (txtBirthDT.text == "") {
            alert("Please input birth date! \n Vui lòng nhập ngày sinh");
            txtBirthDT.GetControl().focus();
            return;
        }
        if (dtJoinDT.value == "") {
            alert("Have to input join date! \n Vui lòng nhập ngày vào.");
            dtJoinDT.GetControl().focus();
            return;
        }
        if (Trim(lstOrg_Code.value) == "") {
            alert("Please choose Organization! \n Vui lòng chọn phòng ban");
            return;
        }

        if (Trim(lstWork_Grp.value) == "") {
            alert((v_language =="ENG")?"Please choose Work Group ! \n":"Bạn hãy chọn Nhóm");
            return;
        }
        

        var t = CheckBirthDate();
        if (t == 1) {
            if (!confirm("Employee under 18!Do you want to continue? \n Nhân viên này chưa đủ 18tuổi, bạn muốn tiếp tục?"))
                return;
        }
        else if (t == 2) {
            alert("Year must be 4 character num, ex 1980,pls input again. \n Năm phải là 4 kí tự, ví dụ 1980, vui lòng nhập lại.");
            return;
        }
        else if (t == 3) {
            alert("Incorrect type, ex dd/mm/yyyy, pls input again \n Nhập ngày tháng năm không hợp lệ.");
            return;
        }
        else if (t == 4) {
            alert("Incorrect month, month >=1 and month <= 12, pls input again \n Kiểu tháng không hợp lệ.");
            return;
        }
        else if (t == 5) {
            alert("Incorrect day, day <= the last day of the month, pls input again\nSố ngày tối đa trong tháng không đúng.");
            return;
        }
        if (Trim(lstProKind.value) == "") {
            alert("Have to choose probation kind!\nVui lòng chọn loại thử việc");
            return;
        }
        if (dtJoinDT.value != "" && dtSTProbate.value != "" && dtSTProbate.value < dtJoinDT.value) {
            alert("Begin probation date have to larger than or equal to join date!\nNgày thử việc phải lớn hoặc bằng ngày ngày vào.");
            dtSTProbate.GetControl().focus();
            return;
        }
        if (dtJoinDT.value != "" && dtEDProbate.value != "" && dtEDProbate.value < dtJoinDT.value) {
            alert("End probation date have to larger than or equal to join date!\nNgày hết thử việc phải lớn hoặc bằng ngày vào.");
            dtEDProbate.GetControl().focus();
            return;
        }
        if (dtSTProbate.value != "" && dtEDProbate.value != "" && dtEDProbate.value < dtSTProbate.value) {
            alert("End probation date have to larger than start probation date!\nNgày hết thử việc phải lớn hoặc bằng ngày thử việc.");
            dtEDProbate.GetControl().focus();
            return;
        }
        if (Trim(dtEDProbate.value) == "") {
            alert("Please input end probation date!\nVui lòng nhập ngày hết thử .");
            return;
        }

        if (Trim(lstStatus.value) == "") {
            alert("Have to choose status!\nVui lòng chọnn status.");
            return;
        }
		/*
        if (Trim(lstSalaryType.value) == "") {
            alert("Salary Type cannot be NULL!\nVui lòng chọn phương thức tính lương.");
            return;
        } */
        if (lstStatus.value != "A" && dtLeaveDT.value == "") {
            alert("Have to input leave date with resign status!\nBạn phải nhập ngày nghỉ việc");

            return;
        }
        if (lstStatus.value == "A" && Trim(lstResignType.value) != "") {
            alert("Active status haven't got resign reason!\nĐang còn làm việc thì không thể có lý do nghỉ việc.");

            return;
        }
        if ((lstStatus.value == "A" || lstStatus.value == "") && dtLeaveDT.value != "") {
            alert("Have to clear leave date with active status!\nĐang còn làm việc thì không thể có ngày nghỉ việc.");

            return;
        }
        if (lstStatus.value == "") {
            alert("Have to input status!\Vui lòng chọn status");
            return;
        }
        if (dtJoinDT.value != "" && dtLeaveDT.value != "" && dtJoinDT.value > dtLeaveDT.value) {
            alert("Leave date have to larger than or equal to join date!\nNgày nghỉ việc phải lớn hay bằng ngày vào làm.");
            dtEDProbate.GetControl().focus();
            return;
        }

        if (txtPersonalID.text != "")
            CheckExistPersonID();
        else {
            txtFlag.text = "2";
            datCheckExist.Call();
        }
    }
    //-----------------------------------------------
    function CheckExistPersonID() {
        txtFlag.text = 1;
        datCheckExist.Call();
    }
    //-----------------------------------------------
    function CheckBirthDate() {
        var i, dt, yyyy, mm, dd, dem
        var MyDate = new Date();

        var SDay = MyDate.getDate();
        var SMonth = MyDate.getMonth();
        var SYear = MyDate.getFullYear();
        dt = Trim(txtBirthDT.text)
        //dt="-1/2/1978"
        dem = 0

        mm = ""
        dd = ""
        yyyy = dt.substr(dt.length - 4, 4);
        if (dt == "")
            return 0; //khong xet
        if (isNaN(yyyy))
            return 2;
        else
            yyyy = Number(yyyy)

        if (dt.length > 4) {
            for (var j = 0; j < dt.length; j++)
                if (dt.charAt(j) == '/')
                    dem += 1;
            if (dem != 2)
                return 3;
        }
        i = 0;
        while (i < dt.length - 4) {
            if (i < 2) {
                if (dt.charAt(i) != '/')
                    dd += "" + dt.charAt(i);
            }
            else
                if (dt.charAt(i) != '/')
                    mm += "" + dt.charAt(i);
            i += 1;
        }

        if ((dd == "") || (mm == "")) { //ngay hoac thang khong co -> chi lay nam
            txtBirthDT.text = yyyy
            if ((yyyy >= SYear) || (SYear - yyyy) < 18)
                return 1;
        }
        else //day du ngay thang
        {
            if ((SYear - yyyy) < 18)
                return 1;
            else {
                if ((Number(SYear) - Number(yyyy)) == 18)//xet toi thang, ko can xet ngay
                {
                    if (Number(mm) > Number(SMonth) + 1)
                        return 1;
                }
                //kiem tra ngay hop le
                var lday = getDaysInMonth(String(yyyy) + String(mm));
                if (Number(mm) < 1 || Number(mm) > 12)
                    return 4;
                else if ((Number(dd) > lday) || (Number(dd) < 0))
                    return 5;
            }

        }

        return 0;
    }
    //-----------------------------------------------
    function getDaysInMonth(yyyymm) //xac dinh thang do co bao nhieu ngay
    {
        // returns the last day of a given month
        var m, y, tmpDate, checkMonth, lastDay

        m = parseInt(yyyymm.substr(4, 2)) - 1;
        y = parseInt(yyyymm.substr(0, 4));
        tmpDate = new Date(y, m, 28);
        checkMonth = tmpDate.getMonth();
        lastDay = 27;

        while (lastDay <= 31) {
            temp = tmpDate.setDate(lastDay + 1);
            if (checkMonth != tmpDate.getMonth())
                break;
            lastDay++
        }
        return lastDay;
    }

    function OnSearch() {
        datSearchEmp.Call("SELECT");
    }

    function ShowEmp() {
        //alert(grdSearchEmp.GetGridData(grdSearchEmp.row, 0));
        var irow = grdSearchEmp.row;

        txtEmp_PK.text = grdSearchEmp.GetGridData(irow, 0);
        //alert(txtEmp_PK.text);
        //datEmployee.Call("SELECT");
        datSearchEmployee_1.Call();
    }

    function OnShowHide() {
        if (flag_show == 0) //hide
        {
            flag_show = 1;
            left.style.width = "";
            left.style.display = "none";
            right.style.width = "100%";

        }
        else {
            flag_show = 0;
            left.style.display = "";
            left.style.width = "25%";
            right.style.width = "75%";
        }

    }

    function OnOption(obj1, obj2) { 
        /*
        exp1.style.display = "none";
        tab1.style.backgroundColor = "#fbeb9c";
        exp2.style.display = "none";
        tab2.style.backgroundColor = "#fbeb9c";
        exp3.style.display = "none";
        tab3.style.backgroundColor = "#fbeb9c";
        exp4.style.display = "none";
        tab4.style.backgroundColor = "#fbeb9c";

        obj1.style.display = "";
        obj2.style.backgroundColor = "#fa8c8c";
	    
        if (obj1 == exp4) {
            if (flag_allowance == 0) {
                flag_allowance = 1;
                datAllowance.Call();
            }
        }
        /**/
    }
    
    function OnOption_2(){
        if(tabMain.GetCurrentPage().firstChild.firstChild.getAttribute("id").toString() == "tab_04"){
            if (flag_allowance == 0) {
                flag_allowance = 1;
                datAllowance.Call();
            }
        }
    }
    //-------------------------------------------
    function OnDelete() {
        if (check_init == 1) {
            if (confirm("Do you want to delete this employee?\Bạn muốn xóa?")) {
                if (txtDelete_Flag.text == 1)
                    alert("You can't delete beause having time machine \n Bạn không thể xóa vì nhân viên đã có công");
                else if (txtDelete_Flag.text == 2)
                    alert("You can't delete beause having absent time \n Bạn không thể xóa vì nhân viên đã có trong danh sách vắng .");
                else {
                    bdelete = true;
                    datEmployee.StatusDelete();
                    datEmployee.Call();

                }
            }
        }

    }

    //--------------------------------------------
    function OnEnterEmp() {

        datEmpPK_Base_EmpID.Call();
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
//-----------------------------------------------
function OnShowPopup(strtemp,objlist)
{
    if (strtemp==1 )
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
            //var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:yes;dialogWidth:16;dialogHeight:10;dialogLeft:300;dialogTop:230;edge:sunken;scroll:no;unadorned:yes;help:no');
			var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:16;dialogHeight:10;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
            if (obj!=null)
            {
                if(obj=="1")
                txt_Employee_ByHand.text="N";
                else
                txt_Employee_ByHand.text="Y";
                
            }
            
        }
    
    }
    else if (strtemp==2)
    {
        var strcom;
        var fpath = System.RootURL + "/form/10/10/10-001-04.aspx.aspx?";
        //var obj  = System.OpenModal(  fpath , 300 , 200 , 'resizable:yes;status:yes');
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:yes;dialogWidth:20;dialogHeight:20;dialogLeft:10;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
            txtUpperDept.text=obj;
            datDeptData.Call();
            
        }
    }
	else if (strtemp==3)
    {
        var strcom;
        var fpath = System.RootURL + "/standard/forms/hr/co/hrco00100.aspx";
        //var obj  = System.OpenModal(  fpath , 300 , 200 , 'resizable:yes;status:yes');
        //var obj=window.showModalDialog(fpath,this,'titleb:1;resizable:yes;status:yes;dialogWidth:20;dialogHeight:20;dialogLeft:100;dialogTop:330;edge:sunken;scroll:yes;unadorned:yes;help:no');
		var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
			if(objlist =="ORG_S")
				lstOrg_Code_s.value = obj;
			else
				lstOrg_Code.value = obj;
        }
    }
    else if (strtemp==4)
    {
        var strcom;
        var fpath = System.RootURL + "/form/10/10/10-001-06.aspx?";
        //var obj  = System.OpenModal(  fpath , 300 , 200 , 'resizable:yes;status:yes');
        var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:yes;status:yes;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {lstSalarGroup.value=obj;
			//lstOrg_Code.value = obj;
            //txtUpperOrg.text=obj;
            //datOrgData.Call();
            
        }
    }
    else if (strtemp==5) //cost center popup 
    {
        var strcom;
        var fpath = System.RootURL + "/form/00/00/00-001_costcenter.aspx?id="+txtCost_Center_pk.text+"&company_pk=" +  "<%=Session("COMPANY_PK")%>";
        var obj  = System.OpenModal(  fpath , 900 , 600 , 'resizable:yes;status:yes');
       // var obj=window.showModalDialog(fpath,this,'titleb:0;resizable:no;status:no;dialogWidth:20;dialogHeight:20;dialogLeft:'+window.event.screenX+';dialogTop:'+window.event.screenY+';edge:sunken;scroll:yes;unadorned:yes;help:no');
        if (obj!=null)
        {
            //alert(obj[0]);
			txtCost_Center_pk.text=obj[0]
			objlist.text=obj[1];
            
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
function OnResetImage()
{
	imgFile.SetDataText("");
}
function OnChangeTab()
 {
	/*
    var strRad = radTab.GetData();
    
    var tab_01       = document.all("tab_01");    
    var tab_02      = document.all("tab_02");    
	
	switch (strRad)
	{
		case '1':
		    tab_01.style.display      	= "";
		    tab_02.style.display      	= "none";
		    
        break;
        
        case '2':
		    tab_01.style.display      	= "none";
		    tab_02.style.display      	= "";
		    		
        break;	
        
    } /**/
 }
 
 function OnChangeTab2(val)
 {
    var tab_01      = document.all("tab_01");    
    var tab_02      = document.all("tab_02");    
	var r_01        = document.all("r_01");    
	var r_02        = document.all("r_02");    
	
	switch (val)
	{
		case '1':
		    tab_01.style.display      	= "";
		    tab_02.style.display      	= "none";
		    r_01.src = "../../../../system/images/r_on.gif";
			r_02.src = "../../../../system/images/r_of.gif";
        break;
        
        case '2':
		    tab_01.style.display      	= "none";
		    tab_02.style.display      	= "";
		    r_02.src = "../../../../system/images/r_on.gif";
			r_01.src = "../../../../system/images/r_of.gif";
        break;	
    } 
 }
</script>
 
      
<body bgcolor='#FFFFFF' style="overflow-y:hidden;">
   
   
<!------------------------------------------>
<gw:data id="datPro_load_form" onreceive="OnDataReceive(this)"  > 
    <xml>
        <dso  type="process" procedure="ST_HR_PRO_CO_LOAD_FORM"  > 
            <input>
                    <input bind="txtUser_PK" /> 
                <input bind="menu_id" />    
                <input bind="txtHr_level" />
                <input bind="l_flag_load" />
            </input> 
            <output>
                <output bind="l_txtFlag_View" />
                <output bind="l_lblMaxID" />
                <output bind="l_txt_sal_security" />
                <output bind="l_txt_First_use" />
                <output bind="l_txt_Employee_ByHand" /> 
				<output bind="lblTotalEmployee" />	
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
                <output bind="txtOrg_Code" />
            </output>
        </dso> 
    </xml> 
</gw:data>
             
<gw:data id="datSearchEmp" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso  type="grid"  function="ST_HR_SEL_HREM00100_0" > 
            <input bind="grdSearchEmp" >
                <input bind="lstOrg_Code_s" /> 
                <input bind="lstStatus_s" />
                <input bind="txtSearch_s" />
            </input>
            <output  bind="grdSearchEmp" />
        </dso> 
    </xml> 
</gw:data>

<gw:data id="datEmployee" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso  type="control" parameter="0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67" 
                            function="ST_HR_SEL_HREM00100_1" procedure="ST_HR_UPD_HREM00100_1"> 
            <inout>
                <inout bind="txtEmp_PK" /> 
                <inout bind="txtEMPID"/>
                <inout bind="txtIDCard"/>
                <inout bind="txtAnnualLeave"/>
                <inout bind="txtPhoto_PK"/>

                <inout bind="txtFullName"/>
                <inout bind="dtJoinDT"/>
                <inout bind="lstEmp_Type"/>
                <inout bind="lstStatus"/>
                <inout bind="dtLeaveDT"/>
                    
                <inout bind="lstResignType"/>
                <inout bind="lstOrg_Code"/>
				<inout bind="lstWork_Grp"/>
                <inout bind="lstNation"/>
                <inout bind="txtBirthDT"/>
                    
                <inout bind="lstBirthPlace"/>
                <inout bind="lstNativeCountry"/>
                <inout bind="lstPosition"/>
                <inout bind="txtPersonalID"/>
                <inout bind="dtIssueDT"/>
                    
                <inout bind="lstPlaceID"/>
                <inout bind="lstJob"/>
                <inout bind="lstSEX"/>
                <inout bind="lstReligion"/>
                <inout bind="lstEthnic"/>

                <inout bind="lstEducation"/>
                <inout bind="txtPerAdd"/>
                <inout bind="txtLivingAdd"/>
                <inout bind="txtHomePhone"/>
                <inout bind="txtTel"/>

                <inout bind="txtEmail"/>
                <inout bind="lstMarial"/>
                <inout bind="lstProKind"/>
                <inout bind="dtSTProbate"/>
                <inout bind="dtEDProbate"/>
                    
                <inout bind="lstContractKind"/>
                <inout bind="txtContractNo"/>
                <inout bind="dtSTContract"/>
                <inout bind="dtEDContract"/>
                <inout bind="lstBank"/>
                    
                <inout bind="lstBankBranch" />
                <inout bind="txtAccount"/>
                <inout bind="txtPit_No"/> 
                <inout bind="lstPayType"/>
                <inout bind="lstMoneyKind"/>
                    
                <inout bind="lstSalYN"/>
                <inout bind="lstOTYN"/>
                <inout bind="lstNetSal_YN"/>
                <inout bind="lstUnion"/>
                <inout bind="chkSocial"/>
                    
                <inout bind="chkHealth"/>
                <inout bind="chkUnEmp"/>
                <inout bind="lstSalaryType"/>
                <inout bind="txtLabor_No"/>
                <inout bind="dtLabor"/>
                    
                <inout bind="txtProSal"/>
                <inout bind="txtBasicSal"/>
                <inout bind="txtAllow1"/>
                <inout bind="txtAllow2"/>
                <inout bind="txtAllow3"/>
                    
                <inout bind="txtAllow4"/>
                <inout bind="txtAllow5"/>
                <inout bind="txtAllow6"/>
                <inout bind="txtAllow7"/>
                <inout bind="txtAllow8"/>
                    
                <inout bind="lstAttYN" />
                <inout bind="txt_Employee_ByHand_YN" />
                <inout bind="txtInsSal" />
                   
            </inout> 
        </dso> 
    </xml> 
</gw:data>
    
<gw:data id="datSearchEmployee_1" onreceive="OnDataReceive(this)" > 
    <xml> 
        <dso  type="process" procedure="ST_HR_SEL_HREM00100_2"> 
            <input>
                <input bind="txtEmp_PK" /> 
            </input>
            <output>
                <output bind="txtEMPID"/>
                <output bind="txtIDCard"/>
                <output bind="txtAnnualLeave"/>
                <output bind="txtPhoto_PK"/>

                <output bind="txtFullName"/>
                <output bind="dtJoinDT"/>
                <output bind="lstEmp_Type"/>
                <output bind="lstStatus"/>
                <output bind="dtLeaveDT"/>
                    
                <output bind="lstResignType"/>
                <output bind="lstOrg_Code"/>
				<output bind="lstWork_Grp"/>
                <output bind="lstNation"/>
                <output bind="txtBirthDT"/>
                    
                <output bind="lstBirthPlace"/>
                <output bind="lstNativeCountry"/>
                <output bind="lstPosition"/>
                <output bind="txtPersonalID"/>
                <output bind="dtIssueDT"/>
                    
                <output bind="lstPlaceID"/>
                <output bind="lstJob"/>
                <output bind="lstSEX"/>
                <output bind="lstReligion"/>
                <output bind="lstEthnic"/>

                <output bind="lstEducation"/>
                <output bind="txtPerAdd"/>
                <output bind="txtLivingAdd"/>
                <output bind="txtHomePhone"/>
                <output bind="txtTel"/>

                <output bind="txtEmail"/>
                <output bind="lstMarial"/>
                <output bind="lstProKind"/>
                <output bind="dtSTProbate"/>
                <output bind="dtEDProbate"/>
                    
                <output bind="lstContractKind"/>
                <output bind="txtContractNo"/>
                <output bind="dtSTContract"/>
                <output bind="dtEDContract"/>
                <output bind="lstBank"/>
                    
                <output bind="lstBankBranch" />
                <output bind="txtAccount"/>
                <output bind="txtPit_No"/> 
                <output bind="lstPayType"/>
                <output bind="lstMoneyKind"/>
                    
                <output bind="lstSalYN"/>
                <output bind="lstOTYN"/>
                <output bind="lstNetSal_YN"/>
                <output bind="lstUnion"/>
                <output bind="chkSocial"/>
                    
                <output bind="chkHealth"/>
                <output bind="chkUnEmp"/>
                <output bind="lstSalaryType"/>
                <output bind="txtLabor_No"/>
                <output bind="dtLabor"/>
                    
                <output bind="txtProSal"/>
                <output bind="txtBasicSal"/>
                <output bind="txtAllow1"/>
                <output bind="txtAllow2"/>
                <output bind="txtAllow3"/>
                    
                <output bind="txtAllow4"/>
                <output bind="txtAllow5"/>
                <output bind="txtAllow6"/>
                <output bind="txtAllow7"/>
                <output bind="txtAllow8"/>
                    
                <output bind="lstAttYN" />
                <output bind="txt_Employee_ByHand_YN" />
                <output bind="txtDelete_Flag" />
                <output bind="txtInsSal" />
            </output> 
        </dso> 
    </xml> 
</gw:data>
    <!----------------------------------->
    
<gw:data id="datAllowance" onreceive="OnDataReceive(this)"  > 
    <xml> 
        <dso  type="process" procedure="ST_HR_PRO_CO_SHOW_ALLOW" > 
            <input>
                <input bind="txtAllowance" /> 
            </input> 
            <output>
                <output bind="lblA1" />
                <output bind="lblA2" />
                <output bind="lblA3" />
                <output bind="lblA4" />
                <output bind="lblA5" />
                <output bind="lblA6" />
                <output bind="lblA7" />
                <output bind="lblA8" />
                    
            </output>
        </dso> 
    </xml> 
</gw:data>

    <%--------Check EmpID exist---------%>
<gw:data id="datCheckID" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="process" procedure="ST_HR_PRO_CO_CHECK_EMP_ID" > 
            <input>
                <input bind="txtEMPID"/>
            </input> 
            <output>
                <input bind="txt_Exist_Emp_ID"/>                    
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


<!----------------------------------->
<gw:data id="datEmpPK_Base_EmpID" onreceive="OnDataReceive(this)"  > 
    <xml> 
        <dso  type="process" procedure="ST_HR_PRO_CO_EMPPK_BASE_EMP_ID" > 
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
<gw:data id="datProbationDate" onreceive="OnDataReceive(this)"> 
    <xml> 
        <dso  type="process" procedure="ST_HR_PRO_CO_PROBATION_DATE" > 
            <input>
                <input bind="lstProKind" />
                <input bind="dtJoinDT" />
            </input>
            <output>
                <output bind="dtSTProbate" />
                <output bind="dtEDProbate" />
            </output>
        </dso> 
    </xml> 
</gw:data>
    <table id="main" style="width:100%;height:100%;border:0" cellpadding="2" cellspacing="1" border="0">
        <tr>
            <td id="left" style="width:25%;height:100%" valign="top" rowspan="2">
                <div style="width:100%;height:100%" class="eco_line">
                    <table style="width:100%;height:100%;border:1;" cellpadding="0" cellspacing="0">
                        <tr style="padding-bottom:5px;padding-left:5px;padding-right:5px;padding-top:5px;" class="eco_bg">
                            <td align="left" style="white-space:nowrap">&nbsp;</td>
                            <td align="left" style="width:70%">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td><gw:button id="ibtnSearch" img="search"  text="Search"  onclick="OnSearch()"/></td>
                        </tr>
                        <tr style="padding-left:5px;padding-right:5px;padding-top:5px;">
                            <td colspan="4" style="padding-top:3px;" class="eco_line_t">
                                <table style="width: 100%; height: 100%" border="0">
                                    <tr>
                                        <td style="width:100px"><a class="eco_link" title="Click choose organization" onclick="OnShowPopup(3,'ORG_S')" href="#tips"  >Organization</a></td>
                                        <td style="white-space: nowrap;" colspan="2">
                                           <gw:list  id="lstOrg_Code_s" value="ALL" maxlen = "100" styles='width:100%'onchange="" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Employee</td>
                                        <td colspan="2"><gw:textbox id="txtSearch_s"  text="" styles='width:100%;' onenterkey ="OnSearch()"  /></td></td>
                                    </tr>
                                    <tr>
                                        <td>Status</td>
                                        <td colspan="2"><gw:list  id="lstStatus_s"   maxlen = "100" styles='width:100%' value="A" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height: 96%" valign="top">
                            <td colspan="4" style="height:100%" class="eco_line_t">
                                <gw:grid id='grdSearchEmp'
                                    header='_Emp_pk|Employee ID|Employee Name'
                                    format='0|0|0'
                                    aligns='0|0|0'
                                    defaults='|||'
                                    editcol='1|1|1'
                                    widths='1000|1500|2000'
                                    sorting='T'
                                    styles='width:100%; height:100%'
                                    oncellclick="ShowEmp()"
                                />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
            <td id="right" style="width: 75%" valign="top">
                <div style="width:100%;height:100%" class="eco_line">
                    <table style="width:100%;border:0;height:100%;" cellpadding="0" cellspacing="0" border="0">
                        <tr style="padding-bottom:2px;padding:2 5 2 5;height:4%" class="eco_bg">
                            <td align="left" style="width:20%;white-space:nowrap">
                                <a class="eco_link" title="Click here to show/hide" onclick="OnShowHide()" href="#tips"  class="eco_link">Hide/Show Search</a>
                            </td>
                            <td style="width:60%" align="center">
                                <table style="height:100%;" border="0">
                                    <tr>
                                        <td style="width:30%" align="right">
                                           Max ID: &nbsp;
										</td>
										<td style="width:10%" align="left">
                                            <gw:label id="lblMaxID"  text="" maxlen = "100" styles='color:red;width:100%;font-weight: bold;font-size:13' />    
										</td>
										<td style="width:50%" align="right">
                                           Total Employees: &nbsp;
										</td>
										<td style="width:10%" align="left">
                                            <gw:label id="lblTotalEmployee"  text="" maxlen = "100" styles='color:red;width:100%;font-weight: bold;font-size:13' />    
										</td>
										
                                    </tr>
                                </table>
                            </td>
                            <td align="right" style="width:20%">
                                <table style="height:100%">
                                    <tr>
                                        <td><gw:button id="ibtnResetE" img="new"  text="Add New"  onclick="OnReset()"/></td>
                                        <td><gw:button id="ibtnUpdate" img="save" text="Save"  onclick="OnUpdate()"/></td>
                                        <td><gw:button id="ibtnDelete" img="delete"  text="Delete"  onclick="OnDelete()"/></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="height:96%;">
                            <td colspan="3" valign="top" class="eco_line_t">
                                 <table width="100%;" height="100%" border="0" cellpadding="2" cellspacing="1">
                                    <tr style="height:40%">
                                        <td>
                                            <fieldset style="padding: 5">
                                                <legend><font color="red"><b>Basic Information</b></font></legend>
                                                <table width="100%" border="0" cellpadding="1" cellspacing="1">
                                                    <tr >
                                                        <td nowrap align="center" width=24% colspan=2  rowspan=4 >
                                                            <gw:image id="imgFile"  view="../../system/binary/ViewFile.aspx" post="../../system/binary/PostFile.aspx" styles="width:120;height:130"  /></td>
                                                        <td nowrap width=1%></td>
                                                        <td nowrap width="9%"><a class="eco_link" title="Click choose employee id" onclick="OnShowPopup(1,'')" href="#tips"  class="eco_link" >Employee ID(*)</a></td>
                                                        <td nowrap width=15%>
                                                            <gw:textbox id="txtEMPID"  text="" 	maxlen = "10" styles='width:100%;'  onenterkey="OnEnterEmp()" />
                                                        </td>
                                                        <td nowrap width=1%></td>
                                                        <td nowrap width="9%">ID Number</td>
                                                        <td nowrap width="15%"><gw:textbox id="txtIDCard"  text="" maxlen = "20" styles='width:100%;'  /></td>
                                                        <td nowrap width="1%"></td>
                                                        <td nowrap width="9%">
															<a class="eco_link" title="Click here to show employee type" onclick="OnShowPopup('HR0017',lstEmp_Type)" href="#tips"  class="eco_link" >Employee Type(*)</a>
														</td>
                                                        <td nowrap width="15%"><gw:list  id="lstEmp_Type" styles='width:100%' csstype="mandatory" /></td>
                                                        <td nowrap width="1%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td nowrap ></td>
                                                        <td nowrap >Full Name(*)</td>
                                                        <td colspan=4 nowrap >
                                                            <gw:textbox id="txtFullName"  maxlen = "60" text="" styles='width:100%;' csstype="mandatory" />
                                                        </td>
                                                        <td nowrap ></td>
                                                        <td nowrap >Birth Date(*)</td>
                                                        <td nowrap >
															<gw:textbox id="txtBirthDT"  text="" maxlen = "10" styles='width:100%' />
                                                        </td> 
                                                        <td nowrap ></td>              
                                                    </tr>
													<tr>
                                                        <td nowrap ></td>     
                                                        <td nowrap ><a class="eco_link" title="Click choose organization" onclick="OnShowPopup(3,'ORG_E')" href="#tips"  class="eco_link" >
                                                            Organization(*)</a></td>
                                                        <td colspan=4 nowrap > <gw:list  id="lstOrg_Code" value=" " maxlen = "100" styles='width:100%'onchange="" csstype="mandatory" /></td>
                                                        <td nowrap ></td>
                                                        <td nowrap >Join Date(*)</td>
                                                        <td nowrap ><gw:datebox id="dtJoinDT"  maxlen = "10" text="" styles='width:100%'lang="<%=Session("Lang")%>" nullaccept onchange="ChangeProbType()" /> </td>
					                                    <td nowrap ></td>
                                                    </tr>
                                                    <tr>
                                                        <td nowrap ></td>   
                                                        <td nowrap >Group(*)</td>
                                                        <td colspan=4 nowrap ><gw:list  id="lstWork_Grp" value=" " maxlen = "100" styles='width:100%'onchange="" csstype="mandatory" /></td>
                                                        <td nowrap ></td>
                                                        <td nowrap >Annual Num</td>
                                                        <td nowrap ><gw:textbox  id="txtAnnualLeave" type="number" format="#,###,###,###.##R" text="12" styles='width:100%' /> </td>
					                                    <td nowrap ></td>              
                                                    </tr>
                                                    
                                                    <tr>
								                        <td colspan="2" align="center">
									                        <table style="height:100%;border:none" cellpadding="0" cellspacing="0" border="0">
										                        <tr>
											                        <td>
												                        <gw:button id="idBtnResetImg"  img="Reset Image" text="Reset Image"  onclick="OnResetImage()" />
											                        </td>
										                        </tr>
									                        </table>
								                        </td>  
														<td nowrap ></td>
                                                        <td nowrap >Status</td>
                                                        <td nowrap ><gw:list  id="lstStatus" value="A"  maxlen = "100" styles='width:100%' />    
                                                        </td>
                                                        <td nowrap></td>
                                                        <td nowrap><span id="lb_left_date">Left Date(*)</span></td>
                                                        <td nowrap >
                                                            <gw:datebox id="dtLeaveDT" text="" maxlen = "10" styles='width:90%;' lang="<%=Session("Lang")%>" nullaccept /> 
                                                        </td>
                                                        <td nowrap ></td>
                                                        <td nowrap width=5%><a class="eco_link" id="lb_resign_type" title="Click choose result of resign" onclick="OnShowPopup('HR0004',lstResignType)" href="#tips"  class="eco_link">Resign Type</a></td>
                                                        <td nowrap ><gw:list  id="lstResignType" maxlen = "100" value=" " styles='width:100%;' /> 
                                                        </td> 
                                                        <td nowrap ></td>
                                                    </tr>
                                                </table>
                                            </fieldset>
                                        </td>
                                    </tr>
									<tr style="height: 5%">
										<td>
											<table style="width: 100%; height: 100%" class="eco_bg">
												<tr>
													<td style="white-space: nowrap;width: 60%;float:left;" align="left" valign="middle">
														<div onclick="OnChangeTab2('1')" style="display:inline;width:25px">
															<image id="r_01" src="../../../../system/images/r_on.gif" />
														</div>
														<div onclick="OnChangeTab2('1')" style="display:inline;width:125px;padding-bottom:8px">
															<span style="font-weight:bold;">Extend Information</span>
														</div>
														<div onclick="OnChangeTab2('2')" style="display:inline;width:25px">
															<image id="r_02" src="../../../../system/images/r_of.gif" />
														</div>
														<div onclick="OnChangeTab2('2s')" style="display:inline;width:125px;padding-bottom:8px">
															<span style="font-weight:bold">Salary Information</span>
														</div>
													</td>
													<td style="white-space: nowrap;width: 40%" align="right">
														
													</td>
												</tr>
											</table>
										</td>
									</tr>		
                                    <tr style="height:55%">
                                        <td valign="top">
                                                <table id="tab_01" name="Extend Information 1" cellpadding="2" cellspacing="1" style="width:100%;height:100%" class="eco_line">
													<tr >
														<td ></td>
														<td style="white-space:nowrap">Probation Type(*)</td>
														<td>
															<gw:list  id="lstProKind" value=" " styles='width:100%' onchange="ChangeProbType()" csstype="mandatory"/>
														</td>
														<td ></td>
														<td style="white-space:nowrap;">Begin Probation(*)</td>
														<td ><gw:datebox id="dtSTProbate"  maxlen = "10" text="" lang="<%=Session("Lang")%>" nullaccept onchange=""/></td>
														<td ></td>
														<td style="white-space:nowrap">End Probation(*)</td>
														<td ><gw:datebox id="dtEDProbate"  maxlen = "10" text="" lang="<%=Session("Lang")%>" nullaccept onchange=""/></td>
														<td ></td>
														<td >Money Kind</td>
														<td ><gw:list  id="lstMoneyKind" value="01" styles='width:100%' onChange="" /></td>
													</tr>
													<tr>
														<td ></td>
														<td >Contract Kind(*)</td>
														<td ><gw:list  id="lstContractKind" value="01" styles='width:100%;' onChange="" /></td>
														<td ></td>
														<td >Begin Contract</td>
														<td ><gw:datebox id="dtSTContract"  maxlen = "10" text="" lang="<%=Session("Lang")%>" nullaccept onchange=""/></td>
														<td ></td>
														<td >End Contract</td>
														<td><gw:datebox id="dtEDContract"  maxlen = "10" text="" lang="<%=Session("Lang")%>" nullaccept onchange=""/></td>
														<td ></td>
														<td >Contract No</td>
														<td ><gw:textbox  id="txtContractNo" text="" styles='width:100%' /></td>
													</tr>
                                                    <tr>
                                                        <td nowrap width=1%></td>     
                                                        <td nowrap width=9%><a class="eco_link" title="Click choose nation" onclick="OnShowPopup('HR0009',lstNation)" href="#tips"  class="eco_link" >Nation(*)</a></td>
                                                        <td nowrap width=15%> 
										                    <gw:list  id="lstNation" value='01'  styles='width:100%' />
									                    </td>
					                                    <td nowrap width=1%> </td>
                                                        <td nowrap width=9%><a class="eco_link" title="Click choose place birth" onclick="OnShowPopup('HR0021',lstBirthPlace)" href="#tips"  class="eco_link" >Place Birth</a></td>
                                                        <td nowrap width=15%>
                                                            <gw:list  id="lstBirthPlace" value=" "  maxlen = "100" styles='width:100%' /> 
                                                        </td>
                                                        <td nowrap width=1%></td>
                                                        <td nowrap width=9%><a class="eco_link" title="Click choose native country" onclick="OnShowPopup('HR0021',lstNativeCountry)" href="#tips"  class="eco_link" >Native Country</a></td>
                                                        <td nowrap width=15%><gw:list  id="lstNativeCountry" value=" "  maxlen = "100" styles='width:100%' /></td>
					                                    <td nowrap width=1%></td>
                                                        <td nowrap width=9%><a class="eco_link" title="Click choose position" onclick="OnShowPopup('HR0008',lstPosition)" href="#tips"  class="eco_link" >Position</a></td>
                                                        <td nowrap width=15%><gw:list  id="lstPosition" value=" " maxlen = "100" styles='width:100%' />
									                    </td>
                                                    </tr>
                                                    <tr>
                                                        <td nowrap ></td>     
                                                        <td nowrap >Personal ID</td>
                                                        <td nowrap >
                                                            <gw:textbox id="txtPersonalID"  maxlen = "12" text="" styles='width:100%;' onkeypress="return Numbers(event)"  onlostfocus="check_number(0)" onenterkey="" />
                                                        </td>
                                                        <td nowrap ></td>
                                                        <td nowrap >Issue Date</td>
                                                        <td nowrap >
                                                            <gw:datebox id="dtIssueDT" text="" maxlen = "10" styles='width:100%' lang="<%=Session("Lang")%>" nullaccept/>
                                                        </td>
                                                        <td nowrap ></td>
                                                        <td nowrap ><a class="eco_link" title="Click choose place ID" onclick="OnShowPopup('HR0014',lstPlaceID)" href="#tips"   class="eco_link" >Place ID</a></td>
                                                        <td nowrap >
                                                            <gw:list  id="lstPlaceID" value=" " maxlen = "10" styles='width:100%' /> 
                                                        </td>
                                                        <td nowrap ></td>
                                                        <td nowrap ><a class="eco_link" title="Click choose job" onclick="OnShowPopup('HR0010',lstJob)" href="#tips"  class="eco_link" >Job</a></td>
                                                        <td nowrap >
                                                            <gw:list  id="lstJob" value="" styles='width:100%' /> 
                                                        </td>
                                                    </tr>    
                                                    <tr>
                                                        <td nowrap ></td>     
                                                        <td nowrap >Sex</td>
                                                        <td nowrap ><gw:list  id="lstSEX" value=" " styles='width:100%' /></td>
					                                    <td nowrap > </td>
                                                        <td nowrap ><a class="eco_link" title="Click choose ethnic" onclick="OnShowPopup('HR0015',lstEthnic)" href="#tips"  class="eco_link" >Ethenic</a></td>
                                                        <td nowrap >
                                                            <gw:list  id="lstEthnic" value=" " styles='width:100%' /> 
                                                        </td>
                                                        <td nowrap ></td>
                                                        <td nowrap ><a class="eco_link" title="Click choose religion" onclick="OnShowPopup('HR0016',lstReligion)" href="#tips"  class="eco_link" >Religion</a></td>
                                                        <td nowrap >
                                                            <gw:list  id="lstReligion" value=" " styles='width:100%' /> 
                                                        </td>
					                                    <td nowrap ></td>
                                                        <td nowrap ><a class="eco_link" title="Click choose education" onclick="OnShowPopup('HR0011',lstEducation)" href="#tips"  class="eco_link" >Education</a></td>
                                                        <td nowrap ><gw:list  id="lstEducation" value=" " maxlen = "10" styles='width:100%' /></td>
                                                    </tr>
                                                    <tr>
                                                        <td nowrap ></td>     
                                                        <td nowrap >Permanent Address</td>
                                                        <td nowrap  colspan=4 ><gw:textbox id="txtPerAdd"  text="" maxlen = "100" styles='width:100%' /></td>  
                                                        <td nowrap ></td>
                                                        <td nowrap >Current Address</td>
                                                        <td nowrap colspan=4 ><gw:textbox id="txtLivingAdd"  text="" maxlen = "100" styles='width:100%' /></td>
                                                    </tr>
                                                    <tr>
                                                        <td nowrap ></td>     
                                                        <td nowrap >Home Phone</td>
                                                        <td nowrap >
                                                            <gw:textbox id="txtHomePhone"  text="" maxlen = "100" styles='width:100%' />
                                                        </td> 
                                                        <td nowrap ></td> 
                                                        <td nowrap >Hand Phone</td>
                                                        <td nowrap ><gw:textbox id="txtTel"  text="" maxlen = "15" styles='width:100%' tabindex="35"  /></td>
                                                        <td nowrap></td>             
                                                        <td nowrap >Email</td>
                                                        <td nowrap ><gw:textbox id="txtEmail"  text="" maxlen = "100" styles='width:100%' /></td>
                                                        <td nowrap ></td>
                                                        <td nowrap >Marital Status</td>
                                                        <td nowrap  ><gw:list  id="lstMarial" value=" " styles="width:100%" /> 
                                                        </td>
                                                    </tr>
													
													<tr>
														<td style="width:1%"></td>
														<td style="width:8%"><a class="eco_link" title="Click choose pay type" onclick="OnShowPopup('HR0023',lstPayType)" href="#tips"  class="eco_link" >Pay Type</a> </td>
														<td style="width:16%"><gw:list  id="lstPayType" value="" styles='width:100%' onChange="" /></td>
														<td style="width:1%"></td>
														<td style="width:8%"><a class="eco_link" title="Click chọn ngân hàng" onclick="OnShowPopup('HR0020',lstBank)" href="#tips"  class="eco_link" >Bank Name</a> </td>
														<td style="width:16%"><gw:list  id="lstBank" value=" " styles='width:100%' onChange="" /></td>
														<td style="width:1%"></td>
														<td style="width:8%">Account No</td>
														<td style="width:16%"><gw:textbox  id="txtAccount" value="" styles='width:100%' /></td>
														<td style="width:1%"></td>
														<td style="width:8%">PIT No</td>
														<td style="width:16%"><gw:textbox id="txtPit_No"  text="" maxlen = "30" styles='width:100%' /></td>
													</tr>
													
                                                </table>
                                                
                                                <table id="tab_02" name="Extend Information 3" cellpadding="2" cellspacing="1" style="width:100%;height:100%;display:none" class="eco_line">
                                                    <tr >
                                                        <td nowrap width=1% ></td>
                                                        <td nowrap width=9%>Salary (Y/N)</td>
                                                        <td nowrap width=5% align="left"><gw:checkbox id="lstSalYN" value="T" ></gw:checkbox ></td>
                                                        <td nowrap width=1% ></td>
                                                        <td nowrap width=9%>Timekeeping (Y/N)</td>
                                                        <td nowrap width=5% align="left"><gw:checkbox id="lstAttYN" value="T" ></gw:checkbox ></td>
                                                        <td nowrap width=1%></td>
                                                        <td nowrap width=9% >Salary Type</td>
                                                        <td nowrap width=10% >
                                                            <gw:list  id="lstSalaryType" value="" styles='width:100%' onChange="">
                                                                <data>
                                                                    <%=CtlLib.SetListDataSQL("select code,CODE_NM from vhr_hr_code where id='HR0056' order by num_1")%>| |Select All
                                                                </data>
                                                            </gw:list >
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td nowrap  ></td>
                                                        <td nowrap  >Overtime (Y/N)</td>
                                                        <td nowrap align="left"><gw:checkbox id="lstOTYN" value="T" ></gw:checkbox ></td>
                                                        <td nowrap  ></td>
                                                        <td nowrap  >Social Ins (Y/N)</td>
                                                        <td nowrap align="left"><gw:checkbox id="chkSocial" value="F" ></gw:checkbox ></td>
                                                        <td nowrap  ></td>
                                                        <td nowrap  >Labour No</td>
                                                        <td nowrap ><gw:textbox id="txtLabor_No"  text="" maxlen = "20" styles='width:100%' /></td>
                                                    </tr>
                                                    <tr>
                                                        <td nowrap  ></td>
                                                        <td nowrap  >Salary Net (Y/N)</td>
                                                        <td nowrap align="left"><gw:checkbox id="lstNetSal_YN" value="F" ></gw:checkbox ></td>
                                                        <td nowrap  ></td>
                                                        <td nowrap  >Health Ins (Y/N)</td>
                                                        <td nowrap align="left"><gw:checkbox id="chkHealth" value="F" ></gw:checkbox ></td>
                                                        <td nowrap  ></td>
                                                        <td nowrap  >Issued Books</td>
                                                        <td nowrap ><gw:datebox id="dtLabor"  text="" maxlen = "10" styles='width:90%' lang="<%=Session("Lang")%>" type="month" nullaccept /></td>
                                                    </tr>
                                                    <tr >
                                                        <td nowrap  ></td>
                                                        <td nowrap >Union (Y/N)</td>
                                                        <td nowrap align="left" ><gw:checkbox id="lstUnion" value="F" ></gw:checkbox ></td>
                                                        <td nowrap ></td>
                                                        <td nowrap  >Unemployee Ins (Y/N)</td>
                                                        <td nowrap align="left" ><gw:checkbox id="chkUnEmp" value="F" ></gw:checkbox ></td>
                                                        <td nowrap ></td>
                                                        <td nowrap  ></td>
                                                        <td nowrap  ></td>
                                                    </tr>
													<tr>
														<td colspan=9>
															<table id="tab_04" name="Salary-Allowance Information" cellpadding="2" cellspacing="1" style="width:100%;height:100%;" class="eco_line_t">
																<tr >
																	<td nowrap width=1% ></td>
																	<td nowrap width=12%>Probation Salary</td>
																	<td nowrap width=15% ><gw:textbox id="txtProSal"  type="number" format="#,###,###,###.##R" styles='width:100%;'  /></td>
																	<td nowrap width=1% ></td>
																	<td nowrap width=12%>Basic Salary</td>
																	<td nowrap width=15% ><gw:textbox id="txtBasicSal"  type="number" format="#,###,###,###.##R" styles='width:100%;'  /></td>
																	<td nowrap width=1% ></td>
																	<td nowrap width=12% >Ins Salary</td>
																	<td nowrap width=15% ><gw:textbox id="txtInsSal"  type="number" format="#,###,###,###.##R" styles='width:100%;'  /></td>
																</tr>
																<tr >
																	<td nowrap width=1% ></td>
																	<td nowrap width=12%><gw:label  id="lblA1"   text="Allowance 1" styles='width:100%;font-weight: bold' /></td>
																	<td nowrap width=15% ><gw:textbox  id="txtAllow1" type="number" format="#,###,###,###.##R" text="" styles='width:100%'  /></td>
																	<td nowrap width=1% ></td>
																	<td nowrap width=12%><gw:label  id="lblA2"   text="Allowance 2" styles='width:100%;font-weight: bold' /></td>
																	<td nowrap width=15% ><gw:textbox id="txtAllow2"  text="" type="number" format="#,###,###,###.##R" styles='width:100%' /></td>
																	<td nowrap width=1% ></td>
																	<td nowrap width=12% ><gw:label  id="lblA3"   text="Allowance 3" styles='width:100%;font-weight: bold' /></td>
																	<td nowrap width=15% ><gw:textbox  id="txtAllow3" text="" type="number" format="#,###,###,###.##R" styles='width:100%' /></td>
																</tr>
																<tr >
																	<td nowrap width=1% ></td>
																	<td nowrap width=12%><gw:label  id="lblA4"   text="Allowance 4" styles='width:100%;font-weight: bold' /></td>
																	<td nowrap width=15% ><gw:textbox id="txtAllow4"  text="" type="number" format="#,###,###,###.##R" styles='width:100%' /></td>
																	<td nowrap width=1% ></td>
																	<td nowrap width=12%><gw:label  id="lblA5"   text="Allowance 5" styles='width:100%;font-weight: bold' /></td>
																	<td nowrap width=15% ><gw:textbox  id="txtAllow5" text="" type="number" format="#,###,###,###.##R" styles='width:100%' /></td>
																	<td nowrap width=1% ></td>
																	<td nowrap width=12% ><gw:label  id="lblA6"   text="Allowance6" styles='width:100%;font-weight: bold' /></td>
																	<td nowrap width=15% ><gw:textbox id="txtAllow6"  text=""  type="number" format="#,###,###,###.##R" styles='width:100%' /></td>
																</tr>
																<tr >
																	<td nowrap width=1% ></td>
																	<td nowrap width=12%><gw:label  id="lblA7"   text="Allowance 7" styles='width:100%;font-weight: bold' /></td>
																	<td nowrap width=15% ><gw:textbox  id="txtAllow7" text="" type="number" format="#,###,###,###.##R" styles='width:100%' /></td>
																	<td nowrap width=1% ></td>
																	<td nowrap width=12%><gw:label  id="lblA8"   text="Allowance 8" styles='width:100%;font-weight: bold' /></td>
																	<td nowrap width=15% ><gw:textbox id="txtAllow8"  text="" type="number" format="#,###,###,###.##R" styles='width:100%' /></td>
																	<td nowrap width=1% ></td>
																	<td nowrap width=12% ></td>
																	<td nowrap width=15% ></td>
																</tr>
															</table>
														</td>
													</tr>
                                                </table>
                                        </td>
                                    </tr>
                                 </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
 
       
            
<gw:textbox id="txtUser_PK" styles="display:none"/>
<gw:textbox id="txtHr_level" styles="display:none"/>
<gw:textbox id="txt_sal_security" styles="display:none"/>
<gw:textbox id="txt_First_use" text="" styles="display:none"/>
<gw:textbox id="txt_Employee_ByHand"  styles="display:none"/>
<gw:textbox id="txtEmp_PK" styles="display:none" />
<gw:textbox id="txtPhoto_PK" styles="display:none" />
<gw:textbox id="txt_Employee_ByHand_YN" styles="display:none" />
<gw:textbox id="txtCompany_pk" styles="display:none" />
<gw:textbox id="menu_id" text="" styles="display:none"  />
<gw:textbox id="txtFlag_View" text="" styles="display:none"  />
<gw:textbox id="l_flag_load" text="" styles="display:none"  />
<gw:textbox id="l_txtFlag_View" text="" styles="display:none"  />
<gw:textbox id="l_lblMaxID" text="" styles="display:none"  />
<gw:textbox id="l_txt_sal_security" text="" styles="display:none"  />
<gw:textbox id="l_txt_First_use" text="" styles="display:none"  />
<gw:textbox id="l_txt_Employee_ByHand" text="" styles="display:none"  />
<gw:textbox id="txtOrg_Code" text="" styles="display:none"  />
<gw:textbox id="txtAllowance" text="HR0019" styles="display:none"/>
<gw:textbox id="txt_Exist_Emp_ID" text="" styles="display:none"/>
<gw:textbox id="txtExistTemp" styles="display:none"/>
<gw:textbox id="txtFlag" styles="display:none"/>
<gw:textbox id="txtDelete_Flag" styles="display:none"/>
<gw:textbox id="txtEmp_PK_NB" styles="display:none" />

<gw:grid   
id="grdAllowance"  
header="Code Name 1|Code Name 2|Code Name 3|Code Name 4|Code Name 5|Code Name 6|Code Name 7|Code Name 8|Display 1|Display 2|Display 3|Display 4|Display 5|Display 6|Display 7|Display 8"
format="0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0"  
aligns="0|2|2|1|0|0|1|1|2|1|0|0|0|0|0|0"  
defaults="||||||||||||||"  
editcol="0|0|0|0|0|1|1|1|1|1|0|0|0|0|0|0"  
widths="0|1500|1600|1000|2500|1500|1700|1500|1700|1500|1500|1200|1200|1200|1200|1200"  
styles="display:none;width:100%; height:15%" 
sorting="T" />

<gw:list  id="lstBankBranch" value=" " styles='width:100%;display:none' onChange="" />
</body>
</html>